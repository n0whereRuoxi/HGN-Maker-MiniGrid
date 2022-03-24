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
      ?auto_376269 - BLOCK
    )
    :vars
    (
      ?auto_376270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376269 ?auto_376270 ) ( CLEAR ?auto_376269 ) ( HAND-EMPTY ) ( not ( = ?auto_376269 ?auto_376270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376269 ?auto_376270 )
      ( !PUTDOWN ?auto_376269 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_376272 - BLOCK
    )
    :vars
    (
      ?auto_376273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376272 ?auto_376273 ) ( CLEAR ?auto_376272 ) ( HAND-EMPTY ) ( not ( = ?auto_376272 ?auto_376273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376272 ?auto_376273 )
      ( !PUTDOWN ?auto_376272 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_376276 - BLOCK
      ?auto_376277 - BLOCK
    )
    :vars
    (
      ?auto_376278 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376276 ) ( ON ?auto_376277 ?auto_376278 ) ( CLEAR ?auto_376277 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376276 ) ( not ( = ?auto_376276 ?auto_376277 ) ) ( not ( = ?auto_376276 ?auto_376278 ) ) ( not ( = ?auto_376277 ?auto_376278 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376277 ?auto_376278 )
      ( !STACK ?auto_376277 ?auto_376276 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_376281 - BLOCK
      ?auto_376282 - BLOCK
    )
    :vars
    (
      ?auto_376283 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376281 ) ( ON ?auto_376282 ?auto_376283 ) ( CLEAR ?auto_376282 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376281 ) ( not ( = ?auto_376281 ?auto_376282 ) ) ( not ( = ?auto_376281 ?auto_376283 ) ) ( not ( = ?auto_376282 ?auto_376283 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376282 ?auto_376283 )
      ( !STACK ?auto_376282 ?auto_376281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_376286 - BLOCK
      ?auto_376287 - BLOCK
    )
    :vars
    (
      ?auto_376288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376287 ?auto_376288 ) ( not ( = ?auto_376286 ?auto_376287 ) ) ( not ( = ?auto_376286 ?auto_376288 ) ) ( not ( = ?auto_376287 ?auto_376288 ) ) ( ON ?auto_376286 ?auto_376287 ) ( CLEAR ?auto_376286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376286 )
      ( MAKE-2PILE ?auto_376286 ?auto_376287 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_376291 - BLOCK
      ?auto_376292 - BLOCK
    )
    :vars
    (
      ?auto_376293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376292 ?auto_376293 ) ( not ( = ?auto_376291 ?auto_376292 ) ) ( not ( = ?auto_376291 ?auto_376293 ) ) ( not ( = ?auto_376292 ?auto_376293 ) ) ( ON ?auto_376291 ?auto_376292 ) ( CLEAR ?auto_376291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376291 )
      ( MAKE-2PILE ?auto_376291 ?auto_376292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_376297 - BLOCK
      ?auto_376298 - BLOCK
      ?auto_376299 - BLOCK
    )
    :vars
    (
      ?auto_376300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376298 ) ( ON ?auto_376299 ?auto_376300 ) ( CLEAR ?auto_376299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376297 ) ( ON ?auto_376298 ?auto_376297 ) ( not ( = ?auto_376297 ?auto_376298 ) ) ( not ( = ?auto_376297 ?auto_376299 ) ) ( not ( = ?auto_376297 ?auto_376300 ) ) ( not ( = ?auto_376298 ?auto_376299 ) ) ( not ( = ?auto_376298 ?auto_376300 ) ) ( not ( = ?auto_376299 ?auto_376300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376299 ?auto_376300 )
      ( !STACK ?auto_376299 ?auto_376298 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_376304 - BLOCK
      ?auto_376305 - BLOCK
      ?auto_376306 - BLOCK
    )
    :vars
    (
      ?auto_376307 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376305 ) ( ON ?auto_376306 ?auto_376307 ) ( CLEAR ?auto_376306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376304 ) ( ON ?auto_376305 ?auto_376304 ) ( not ( = ?auto_376304 ?auto_376305 ) ) ( not ( = ?auto_376304 ?auto_376306 ) ) ( not ( = ?auto_376304 ?auto_376307 ) ) ( not ( = ?auto_376305 ?auto_376306 ) ) ( not ( = ?auto_376305 ?auto_376307 ) ) ( not ( = ?auto_376306 ?auto_376307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376306 ?auto_376307 )
      ( !STACK ?auto_376306 ?auto_376305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_376311 - BLOCK
      ?auto_376312 - BLOCK
      ?auto_376313 - BLOCK
    )
    :vars
    (
      ?auto_376314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376313 ?auto_376314 ) ( ON-TABLE ?auto_376311 ) ( not ( = ?auto_376311 ?auto_376312 ) ) ( not ( = ?auto_376311 ?auto_376313 ) ) ( not ( = ?auto_376311 ?auto_376314 ) ) ( not ( = ?auto_376312 ?auto_376313 ) ) ( not ( = ?auto_376312 ?auto_376314 ) ) ( not ( = ?auto_376313 ?auto_376314 ) ) ( CLEAR ?auto_376311 ) ( ON ?auto_376312 ?auto_376313 ) ( CLEAR ?auto_376312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376311 ?auto_376312 )
      ( MAKE-3PILE ?auto_376311 ?auto_376312 ?auto_376313 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_376318 - BLOCK
      ?auto_376319 - BLOCK
      ?auto_376320 - BLOCK
    )
    :vars
    (
      ?auto_376321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376320 ?auto_376321 ) ( ON-TABLE ?auto_376318 ) ( not ( = ?auto_376318 ?auto_376319 ) ) ( not ( = ?auto_376318 ?auto_376320 ) ) ( not ( = ?auto_376318 ?auto_376321 ) ) ( not ( = ?auto_376319 ?auto_376320 ) ) ( not ( = ?auto_376319 ?auto_376321 ) ) ( not ( = ?auto_376320 ?auto_376321 ) ) ( CLEAR ?auto_376318 ) ( ON ?auto_376319 ?auto_376320 ) ( CLEAR ?auto_376319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376318 ?auto_376319 )
      ( MAKE-3PILE ?auto_376318 ?auto_376319 ?auto_376320 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_376325 - BLOCK
      ?auto_376326 - BLOCK
      ?auto_376327 - BLOCK
    )
    :vars
    (
      ?auto_376328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376327 ?auto_376328 ) ( not ( = ?auto_376325 ?auto_376326 ) ) ( not ( = ?auto_376325 ?auto_376327 ) ) ( not ( = ?auto_376325 ?auto_376328 ) ) ( not ( = ?auto_376326 ?auto_376327 ) ) ( not ( = ?auto_376326 ?auto_376328 ) ) ( not ( = ?auto_376327 ?auto_376328 ) ) ( ON ?auto_376326 ?auto_376327 ) ( ON ?auto_376325 ?auto_376326 ) ( CLEAR ?auto_376325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376325 )
      ( MAKE-3PILE ?auto_376325 ?auto_376326 ?auto_376327 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_376332 - BLOCK
      ?auto_376333 - BLOCK
      ?auto_376334 - BLOCK
    )
    :vars
    (
      ?auto_376335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376334 ?auto_376335 ) ( not ( = ?auto_376332 ?auto_376333 ) ) ( not ( = ?auto_376332 ?auto_376334 ) ) ( not ( = ?auto_376332 ?auto_376335 ) ) ( not ( = ?auto_376333 ?auto_376334 ) ) ( not ( = ?auto_376333 ?auto_376335 ) ) ( not ( = ?auto_376334 ?auto_376335 ) ) ( ON ?auto_376333 ?auto_376334 ) ( ON ?auto_376332 ?auto_376333 ) ( CLEAR ?auto_376332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376332 )
      ( MAKE-3PILE ?auto_376332 ?auto_376333 ?auto_376334 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_376340 - BLOCK
      ?auto_376341 - BLOCK
      ?auto_376342 - BLOCK
      ?auto_376343 - BLOCK
    )
    :vars
    (
      ?auto_376344 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376342 ) ( ON ?auto_376343 ?auto_376344 ) ( CLEAR ?auto_376343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376340 ) ( ON ?auto_376341 ?auto_376340 ) ( ON ?auto_376342 ?auto_376341 ) ( not ( = ?auto_376340 ?auto_376341 ) ) ( not ( = ?auto_376340 ?auto_376342 ) ) ( not ( = ?auto_376340 ?auto_376343 ) ) ( not ( = ?auto_376340 ?auto_376344 ) ) ( not ( = ?auto_376341 ?auto_376342 ) ) ( not ( = ?auto_376341 ?auto_376343 ) ) ( not ( = ?auto_376341 ?auto_376344 ) ) ( not ( = ?auto_376342 ?auto_376343 ) ) ( not ( = ?auto_376342 ?auto_376344 ) ) ( not ( = ?auto_376343 ?auto_376344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376343 ?auto_376344 )
      ( !STACK ?auto_376343 ?auto_376342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_376349 - BLOCK
      ?auto_376350 - BLOCK
      ?auto_376351 - BLOCK
      ?auto_376352 - BLOCK
    )
    :vars
    (
      ?auto_376353 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376351 ) ( ON ?auto_376352 ?auto_376353 ) ( CLEAR ?auto_376352 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376349 ) ( ON ?auto_376350 ?auto_376349 ) ( ON ?auto_376351 ?auto_376350 ) ( not ( = ?auto_376349 ?auto_376350 ) ) ( not ( = ?auto_376349 ?auto_376351 ) ) ( not ( = ?auto_376349 ?auto_376352 ) ) ( not ( = ?auto_376349 ?auto_376353 ) ) ( not ( = ?auto_376350 ?auto_376351 ) ) ( not ( = ?auto_376350 ?auto_376352 ) ) ( not ( = ?auto_376350 ?auto_376353 ) ) ( not ( = ?auto_376351 ?auto_376352 ) ) ( not ( = ?auto_376351 ?auto_376353 ) ) ( not ( = ?auto_376352 ?auto_376353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376352 ?auto_376353 )
      ( !STACK ?auto_376352 ?auto_376351 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_376358 - BLOCK
      ?auto_376359 - BLOCK
      ?auto_376360 - BLOCK
      ?auto_376361 - BLOCK
    )
    :vars
    (
      ?auto_376362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376361 ?auto_376362 ) ( ON-TABLE ?auto_376358 ) ( ON ?auto_376359 ?auto_376358 ) ( not ( = ?auto_376358 ?auto_376359 ) ) ( not ( = ?auto_376358 ?auto_376360 ) ) ( not ( = ?auto_376358 ?auto_376361 ) ) ( not ( = ?auto_376358 ?auto_376362 ) ) ( not ( = ?auto_376359 ?auto_376360 ) ) ( not ( = ?auto_376359 ?auto_376361 ) ) ( not ( = ?auto_376359 ?auto_376362 ) ) ( not ( = ?auto_376360 ?auto_376361 ) ) ( not ( = ?auto_376360 ?auto_376362 ) ) ( not ( = ?auto_376361 ?auto_376362 ) ) ( CLEAR ?auto_376359 ) ( ON ?auto_376360 ?auto_376361 ) ( CLEAR ?auto_376360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376358 ?auto_376359 ?auto_376360 )
      ( MAKE-4PILE ?auto_376358 ?auto_376359 ?auto_376360 ?auto_376361 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_376367 - BLOCK
      ?auto_376368 - BLOCK
      ?auto_376369 - BLOCK
      ?auto_376370 - BLOCK
    )
    :vars
    (
      ?auto_376371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376370 ?auto_376371 ) ( ON-TABLE ?auto_376367 ) ( ON ?auto_376368 ?auto_376367 ) ( not ( = ?auto_376367 ?auto_376368 ) ) ( not ( = ?auto_376367 ?auto_376369 ) ) ( not ( = ?auto_376367 ?auto_376370 ) ) ( not ( = ?auto_376367 ?auto_376371 ) ) ( not ( = ?auto_376368 ?auto_376369 ) ) ( not ( = ?auto_376368 ?auto_376370 ) ) ( not ( = ?auto_376368 ?auto_376371 ) ) ( not ( = ?auto_376369 ?auto_376370 ) ) ( not ( = ?auto_376369 ?auto_376371 ) ) ( not ( = ?auto_376370 ?auto_376371 ) ) ( CLEAR ?auto_376368 ) ( ON ?auto_376369 ?auto_376370 ) ( CLEAR ?auto_376369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376367 ?auto_376368 ?auto_376369 )
      ( MAKE-4PILE ?auto_376367 ?auto_376368 ?auto_376369 ?auto_376370 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_376376 - BLOCK
      ?auto_376377 - BLOCK
      ?auto_376378 - BLOCK
      ?auto_376379 - BLOCK
    )
    :vars
    (
      ?auto_376380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376379 ?auto_376380 ) ( ON-TABLE ?auto_376376 ) ( not ( = ?auto_376376 ?auto_376377 ) ) ( not ( = ?auto_376376 ?auto_376378 ) ) ( not ( = ?auto_376376 ?auto_376379 ) ) ( not ( = ?auto_376376 ?auto_376380 ) ) ( not ( = ?auto_376377 ?auto_376378 ) ) ( not ( = ?auto_376377 ?auto_376379 ) ) ( not ( = ?auto_376377 ?auto_376380 ) ) ( not ( = ?auto_376378 ?auto_376379 ) ) ( not ( = ?auto_376378 ?auto_376380 ) ) ( not ( = ?auto_376379 ?auto_376380 ) ) ( ON ?auto_376378 ?auto_376379 ) ( CLEAR ?auto_376376 ) ( ON ?auto_376377 ?auto_376378 ) ( CLEAR ?auto_376377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376376 ?auto_376377 )
      ( MAKE-4PILE ?auto_376376 ?auto_376377 ?auto_376378 ?auto_376379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_376385 - BLOCK
      ?auto_376386 - BLOCK
      ?auto_376387 - BLOCK
      ?auto_376388 - BLOCK
    )
    :vars
    (
      ?auto_376389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376388 ?auto_376389 ) ( ON-TABLE ?auto_376385 ) ( not ( = ?auto_376385 ?auto_376386 ) ) ( not ( = ?auto_376385 ?auto_376387 ) ) ( not ( = ?auto_376385 ?auto_376388 ) ) ( not ( = ?auto_376385 ?auto_376389 ) ) ( not ( = ?auto_376386 ?auto_376387 ) ) ( not ( = ?auto_376386 ?auto_376388 ) ) ( not ( = ?auto_376386 ?auto_376389 ) ) ( not ( = ?auto_376387 ?auto_376388 ) ) ( not ( = ?auto_376387 ?auto_376389 ) ) ( not ( = ?auto_376388 ?auto_376389 ) ) ( ON ?auto_376387 ?auto_376388 ) ( CLEAR ?auto_376385 ) ( ON ?auto_376386 ?auto_376387 ) ( CLEAR ?auto_376386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376385 ?auto_376386 )
      ( MAKE-4PILE ?auto_376385 ?auto_376386 ?auto_376387 ?auto_376388 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_376394 - BLOCK
      ?auto_376395 - BLOCK
      ?auto_376396 - BLOCK
      ?auto_376397 - BLOCK
    )
    :vars
    (
      ?auto_376398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376397 ?auto_376398 ) ( not ( = ?auto_376394 ?auto_376395 ) ) ( not ( = ?auto_376394 ?auto_376396 ) ) ( not ( = ?auto_376394 ?auto_376397 ) ) ( not ( = ?auto_376394 ?auto_376398 ) ) ( not ( = ?auto_376395 ?auto_376396 ) ) ( not ( = ?auto_376395 ?auto_376397 ) ) ( not ( = ?auto_376395 ?auto_376398 ) ) ( not ( = ?auto_376396 ?auto_376397 ) ) ( not ( = ?auto_376396 ?auto_376398 ) ) ( not ( = ?auto_376397 ?auto_376398 ) ) ( ON ?auto_376396 ?auto_376397 ) ( ON ?auto_376395 ?auto_376396 ) ( ON ?auto_376394 ?auto_376395 ) ( CLEAR ?auto_376394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376394 )
      ( MAKE-4PILE ?auto_376394 ?auto_376395 ?auto_376396 ?auto_376397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_376403 - BLOCK
      ?auto_376404 - BLOCK
      ?auto_376405 - BLOCK
      ?auto_376406 - BLOCK
    )
    :vars
    (
      ?auto_376407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376406 ?auto_376407 ) ( not ( = ?auto_376403 ?auto_376404 ) ) ( not ( = ?auto_376403 ?auto_376405 ) ) ( not ( = ?auto_376403 ?auto_376406 ) ) ( not ( = ?auto_376403 ?auto_376407 ) ) ( not ( = ?auto_376404 ?auto_376405 ) ) ( not ( = ?auto_376404 ?auto_376406 ) ) ( not ( = ?auto_376404 ?auto_376407 ) ) ( not ( = ?auto_376405 ?auto_376406 ) ) ( not ( = ?auto_376405 ?auto_376407 ) ) ( not ( = ?auto_376406 ?auto_376407 ) ) ( ON ?auto_376405 ?auto_376406 ) ( ON ?auto_376404 ?auto_376405 ) ( ON ?auto_376403 ?auto_376404 ) ( CLEAR ?auto_376403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376403 )
      ( MAKE-4PILE ?auto_376403 ?auto_376404 ?auto_376405 ?auto_376406 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_376413 - BLOCK
      ?auto_376414 - BLOCK
      ?auto_376415 - BLOCK
      ?auto_376416 - BLOCK
      ?auto_376417 - BLOCK
    )
    :vars
    (
      ?auto_376418 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376416 ) ( ON ?auto_376417 ?auto_376418 ) ( CLEAR ?auto_376417 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376413 ) ( ON ?auto_376414 ?auto_376413 ) ( ON ?auto_376415 ?auto_376414 ) ( ON ?auto_376416 ?auto_376415 ) ( not ( = ?auto_376413 ?auto_376414 ) ) ( not ( = ?auto_376413 ?auto_376415 ) ) ( not ( = ?auto_376413 ?auto_376416 ) ) ( not ( = ?auto_376413 ?auto_376417 ) ) ( not ( = ?auto_376413 ?auto_376418 ) ) ( not ( = ?auto_376414 ?auto_376415 ) ) ( not ( = ?auto_376414 ?auto_376416 ) ) ( not ( = ?auto_376414 ?auto_376417 ) ) ( not ( = ?auto_376414 ?auto_376418 ) ) ( not ( = ?auto_376415 ?auto_376416 ) ) ( not ( = ?auto_376415 ?auto_376417 ) ) ( not ( = ?auto_376415 ?auto_376418 ) ) ( not ( = ?auto_376416 ?auto_376417 ) ) ( not ( = ?auto_376416 ?auto_376418 ) ) ( not ( = ?auto_376417 ?auto_376418 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376417 ?auto_376418 )
      ( !STACK ?auto_376417 ?auto_376416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_376424 - BLOCK
      ?auto_376425 - BLOCK
      ?auto_376426 - BLOCK
      ?auto_376427 - BLOCK
      ?auto_376428 - BLOCK
    )
    :vars
    (
      ?auto_376429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376427 ) ( ON ?auto_376428 ?auto_376429 ) ( CLEAR ?auto_376428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376424 ) ( ON ?auto_376425 ?auto_376424 ) ( ON ?auto_376426 ?auto_376425 ) ( ON ?auto_376427 ?auto_376426 ) ( not ( = ?auto_376424 ?auto_376425 ) ) ( not ( = ?auto_376424 ?auto_376426 ) ) ( not ( = ?auto_376424 ?auto_376427 ) ) ( not ( = ?auto_376424 ?auto_376428 ) ) ( not ( = ?auto_376424 ?auto_376429 ) ) ( not ( = ?auto_376425 ?auto_376426 ) ) ( not ( = ?auto_376425 ?auto_376427 ) ) ( not ( = ?auto_376425 ?auto_376428 ) ) ( not ( = ?auto_376425 ?auto_376429 ) ) ( not ( = ?auto_376426 ?auto_376427 ) ) ( not ( = ?auto_376426 ?auto_376428 ) ) ( not ( = ?auto_376426 ?auto_376429 ) ) ( not ( = ?auto_376427 ?auto_376428 ) ) ( not ( = ?auto_376427 ?auto_376429 ) ) ( not ( = ?auto_376428 ?auto_376429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376428 ?auto_376429 )
      ( !STACK ?auto_376428 ?auto_376427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_376435 - BLOCK
      ?auto_376436 - BLOCK
      ?auto_376437 - BLOCK
      ?auto_376438 - BLOCK
      ?auto_376439 - BLOCK
    )
    :vars
    (
      ?auto_376440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376439 ?auto_376440 ) ( ON-TABLE ?auto_376435 ) ( ON ?auto_376436 ?auto_376435 ) ( ON ?auto_376437 ?auto_376436 ) ( not ( = ?auto_376435 ?auto_376436 ) ) ( not ( = ?auto_376435 ?auto_376437 ) ) ( not ( = ?auto_376435 ?auto_376438 ) ) ( not ( = ?auto_376435 ?auto_376439 ) ) ( not ( = ?auto_376435 ?auto_376440 ) ) ( not ( = ?auto_376436 ?auto_376437 ) ) ( not ( = ?auto_376436 ?auto_376438 ) ) ( not ( = ?auto_376436 ?auto_376439 ) ) ( not ( = ?auto_376436 ?auto_376440 ) ) ( not ( = ?auto_376437 ?auto_376438 ) ) ( not ( = ?auto_376437 ?auto_376439 ) ) ( not ( = ?auto_376437 ?auto_376440 ) ) ( not ( = ?auto_376438 ?auto_376439 ) ) ( not ( = ?auto_376438 ?auto_376440 ) ) ( not ( = ?auto_376439 ?auto_376440 ) ) ( CLEAR ?auto_376437 ) ( ON ?auto_376438 ?auto_376439 ) ( CLEAR ?auto_376438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_376435 ?auto_376436 ?auto_376437 ?auto_376438 )
      ( MAKE-5PILE ?auto_376435 ?auto_376436 ?auto_376437 ?auto_376438 ?auto_376439 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_376446 - BLOCK
      ?auto_376447 - BLOCK
      ?auto_376448 - BLOCK
      ?auto_376449 - BLOCK
      ?auto_376450 - BLOCK
    )
    :vars
    (
      ?auto_376451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376450 ?auto_376451 ) ( ON-TABLE ?auto_376446 ) ( ON ?auto_376447 ?auto_376446 ) ( ON ?auto_376448 ?auto_376447 ) ( not ( = ?auto_376446 ?auto_376447 ) ) ( not ( = ?auto_376446 ?auto_376448 ) ) ( not ( = ?auto_376446 ?auto_376449 ) ) ( not ( = ?auto_376446 ?auto_376450 ) ) ( not ( = ?auto_376446 ?auto_376451 ) ) ( not ( = ?auto_376447 ?auto_376448 ) ) ( not ( = ?auto_376447 ?auto_376449 ) ) ( not ( = ?auto_376447 ?auto_376450 ) ) ( not ( = ?auto_376447 ?auto_376451 ) ) ( not ( = ?auto_376448 ?auto_376449 ) ) ( not ( = ?auto_376448 ?auto_376450 ) ) ( not ( = ?auto_376448 ?auto_376451 ) ) ( not ( = ?auto_376449 ?auto_376450 ) ) ( not ( = ?auto_376449 ?auto_376451 ) ) ( not ( = ?auto_376450 ?auto_376451 ) ) ( CLEAR ?auto_376448 ) ( ON ?auto_376449 ?auto_376450 ) ( CLEAR ?auto_376449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_376446 ?auto_376447 ?auto_376448 ?auto_376449 )
      ( MAKE-5PILE ?auto_376446 ?auto_376447 ?auto_376448 ?auto_376449 ?auto_376450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_376457 - BLOCK
      ?auto_376458 - BLOCK
      ?auto_376459 - BLOCK
      ?auto_376460 - BLOCK
      ?auto_376461 - BLOCK
    )
    :vars
    (
      ?auto_376462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376461 ?auto_376462 ) ( ON-TABLE ?auto_376457 ) ( ON ?auto_376458 ?auto_376457 ) ( not ( = ?auto_376457 ?auto_376458 ) ) ( not ( = ?auto_376457 ?auto_376459 ) ) ( not ( = ?auto_376457 ?auto_376460 ) ) ( not ( = ?auto_376457 ?auto_376461 ) ) ( not ( = ?auto_376457 ?auto_376462 ) ) ( not ( = ?auto_376458 ?auto_376459 ) ) ( not ( = ?auto_376458 ?auto_376460 ) ) ( not ( = ?auto_376458 ?auto_376461 ) ) ( not ( = ?auto_376458 ?auto_376462 ) ) ( not ( = ?auto_376459 ?auto_376460 ) ) ( not ( = ?auto_376459 ?auto_376461 ) ) ( not ( = ?auto_376459 ?auto_376462 ) ) ( not ( = ?auto_376460 ?auto_376461 ) ) ( not ( = ?auto_376460 ?auto_376462 ) ) ( not ( = ?auto_376461 ?auto_376462 ) ) ( ON ?auto_376460 ?auto_376461 ) ( CLEAR ?auto_376458 ) ( ON ?auto_376459 ?auto_376460 ) ( CLEAR ?auto_376459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376457 ?auto_376458 ?auto_376459 )
      ( MAKE-5PILE ?auto_376457 ?auto_376458 ?auto_376459 ?auto_376460 ?auto_376461 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_376468 - BLOCK
      ?auto_376469 - BLOCK
      ?auto_376470 - BLOCK
      ?auto_376471 - BLOCK
      ?auto_376472 - BLOCK
    )
    :vars
    (
      ?auto_376473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376472 ?auto_376473 ) ( ON-TABLE ?auto_376468 ) ( ON ?auto_376469 ?auto_376468 ) ( not ( = ?auto_376468 ?auto_376469 ) ) ( not ( = ?auto_376468 ?auto_376470 ) ) ( not ( = ?auto_376468 ?auto_376471 ) ) ( not ( = ?auto_376468 ?auto_376472 ) ) ( not ( = ?auto_376468 ?auto_376473 ) ) ( not ( = ?auto_376469 ?auto_376470 ) ) ( not ( = ?auto_376469 ?auto_376471 ) ) ( not ( = ?auto_376469 ?auto_376472 ) ) ( not ( = ?auto_376469 ?auto_376473 ) ) ( not ( = ?auto_376470 ?auto_376471 ) ) ( not ( = ?auto_376470 ?auto_376472 ) ) ( not ( = ?auto_376470 ?auto_376473 ) ) ( not ( = ?auto_376471 ?auto_376472 ) ) ( not ( = ?auto_376471 ?auto_376473 ) ) ( not ( = ?auto_376472 ?auto_376473 ) ) ( ON ?auto_376471 ?auto_376472 ) ( CLEAR ?auto_376469 ) ( ON ?auto_376470 ?auto_376471 ) ( CLEAR ?auto_376470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376468 ?auto_376469 ?auto_376470 )
      ( MAKE-5PILE ?auto_376468 ?auto_376469 ?auto_376470 ?auto_376471 ?auto_376472 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_376479 - BLOCK
      ?auto_376480 - BLOCK
      ?auto_376481 - BLOCK
      ?auto_376482 - BLOCK
      ?auto_376483 - BLOCK
    )
    :vars
    (
      ?auto_376484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376483 ?auto_376484 ) ( ON-TABLE ?auto_376479 ) ( not ( = ?auto_376479 ?auto_376480 ) ) ( not ( = ?auto_376479 ?auto_376481 ) ) ( not ( = ?auto_376479 ?auto_376482 ) ) ( not ( = ?auto_376479 ?auto_376483 ) ) ( not ( = ?auto_376479 ?auto_376484 ) ) ( not ( = ?auto_376480 ?auto_376481 ) ) ( not ( = ?auto_376480 ?auto_376482 ) ) ( not ( = ?auto_376480 ?auto_376483 ) ) ( not ( = ?auto_376480 ?auto_376484 ) ) ( not ( = ?auto_376481 ?auto_376482 ) ) ( not ( = ?auto_376481 ?auto_376483 ) ) ( not ( = ?auto_376481 ?auto_376484 ) ) ( not ( = ?auto_376482 ?auto_376483 ) ) ( not ( = ?auto_376482 ?auto_376484 ) ) ( not ( = ?auto_376483 ?auto_376484 ) ) ( ON ?auto_376482 ?auto_376483 ) ( ON ?auto_376481 ?auto_376482 ) ( CLEAR ?auto_376479 ) ( ON ?auto_376480 ?auto_376481 ) ( CLEAR ?auto_376480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376479 ?auto_376480 )
      ( MAKE-5PILE ?auto_376479 ?auto_376480 ?auto_376481 ?auto_376482 ?auto_376483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_376490 - BLOCK
      ?auto_376491 - BLOCK
      ?auto_376492 - BLOCK
      ?auto_376493 - BLOCK
      ?auto_376494 - BLOCK
    )
    :vars
    (
      ?auto_376495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376494 ?auto_376495 ) ( ON-TABLE ?auto_376490 ) ( not ( = ?auto_376490 ?auto_376491 ) ) ( not ( = ?auto_376490 ?auto_376492 ) ) ( not ( = ?auto_376490 ?auto_376493 ) ) ( not ( = ?auto_376490 ?auto_376494 ) ) ( not ( = ?auto_376490 ?auto_376495 ) ) ( not ( = ?auto_376491 ?auto_376492 ) ) ( not ( = ?auto_376491 ?auto_376493 ) ) ( not ( = ?auto_376491 ?auto_376494 ) ) ( not ( = ?auto_376491 ?auto_376495 ) ) ( not ( = ?auto_376492 ?auto_376493 ) ) ( not ( = ?auto_376492 ?auto_376494 ) ) ( not ( = ?auto_376492 ?auto_376495 ) ) ( not ( = ?auto_376493 ?auto_376494 ) ) ( not ( = ?auto_376493 ?auto_376495 ) ) ( not ( = ?auto_376494 ?auto_376495 ) ) ( ON ?auto_376493 ?auto_376494 ) ( ON ?auto_376492 ?auto_376493 ) ( CLEAR ?auto_376490 ) ( ON ?auto_376491 ?auto_376492 ) ( CLEAR ?auto_376491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376490 ?auto_376491 )
      ( MAKE-5PILE ?auto_376490 ?auto_376491 ?auto_376492 ?auto_376493 ?auto_376494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_376501 - BLOCK
      ?auto_376502 - BLOCK
      ?auto_376503 - BLOCK
      ?auto_376504 - BLOCK
      ?auto_376505 - BLOCK
    )
    :vars
    (
      ?auto_376506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376505 ?auto_376506 ) ( not ( = ?auto_376501 ?auto_376502 ) ) ( not ( = ?auto_376501 ?auto_376503 ) ) ( not ( = ?auto_376501 ?auto_376504 ) ) ( not ( = ?auto_376501 ?auto_376505 ) ) ( not ( = ?auto_376501 ?auto_376506 ) ) ( not ( = ?auto_376502 ?auto_376503 ) ) ( not ( = ?auto_376502 ?auto_376504 ) ) ( not ( = ?auto_376502 ?auto_376505 ) ) ( not ( = ?auto_376502 ?auto_376506 ) ) ( not ( = ?auto_376503 ?auto_376504 ) ) ( not ( = ?auto_376503 ?auto_376505 ) ) ( not ( = ?auto_376503 ?auto_376506 ) ) ( not ( = ?auto_376504 ?auto_376505 ) ) ( not ( = ?auto_376504 ?auto_376506 ) ) ( not ( = ?auto_376505 ?auto_376506 ) ) ( ON ?auto_376504 ?auto_376505 ) ( ON ?auto_376503 ?auto_376504 ) ( ON ?auto_376502 ?auto_376503 ) ( ON ?auto_376501 ?auto_376502 ) ( CLEAR ?auto_376501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376501 )
      ( MAKE-5PILE ?auto_376501 ?auto_376502 ?auto_376503 ?auto_376504 ?auto_376505 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_376512 - BLOCK
      ?auto_376513 - BLOCK
      ?auto_376514 - BLOCK
      ?auto_376515 - BLOCK
      ?auto_376516 - BLOCK
    )
    :vars
    (
      ?auto_376517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376516 ?auto_376517 ) ( not ( = ?auto_376512 ?auto_376513 ) ) ( not ( = ?auto_376512 ?auto_376514 ) ) ( not ( = ?auto_376512 ?auto_376515 ) ) ( not ( = ?auto_376512 ?auto_376516 ) ) ( not ( = ?auto_376512 ?auto_376517 ) ) ( not ( = ?auto_376513 ?auto_376514 ) ) ( not ( = ?auto_376513 ?auto_376515 ) ) ( not ( = ?auto_376513 ?auto_376516 ) ) ( not ( = ?auto_376513 ?auto_376517 ) ) ( not ( = ?auto_376514 ?auto_376515 ) ) ( not ( = ?auto_376514 ?auto_376516 ) ) ( not ( = ?auto_376514 ?auto_376517 ) ) ( not ( = ?auto_376515 ?auto_376516 ) ) ( not ( = ?auto_376515 ?auto_376517 ) ) ( not ( = ?auto_376516 ?auto_376517 ) ) ( ON ?auto_376515 ?auto_376516 ) ( ON ?auto_376514 ?auto_376515 ) ( ON ?auto_376513 ?auto_376514 ) ( ON ?auto_376512 ?auto_376513 ) ( CLEAR ?auto_376512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376512 )
      ( MAKE-5PILE ?auto_376512 ?auto_376513 ?auto_376514 ?auto_376515 ?auto_376516 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376524 - BLOCK
      ?auto_376525 - BLOCK
      ?auto_376526 - BLOCK
      ?auto_376527 - BLOCK
      ?auto_376528 - BLOCK
      ?auto_376529 - BLOCK
    )
    :vars
    (
      ?auto_376530 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376528 ) ( ON ?auto_376529 ?auto_376530 ) ( CLEAR ?auto_376529 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376524 ) ( ON ?auto_376525 ?auto_376524 ) ( ON ?auto_376526 ?auto_376525 ) ( ON ?auto_376527 ?auto_376526 ) ( ON ?auto_376528 ?auto_376527 ) ( not ( = ?auto_376524 ?auto_376525 ) ) ( not ( = ?auto_376524 ?auto_376526 ) ) ( not ( = ?auto_376524 ?auto_376527 ) ) ( not ( = ?auto_376524 ?auto_376528 ) ) ( not ( = ?auto_376524 ?auto_376529 ) ) ( not ( = ?auto_376524 ?auto_376530 ) ) ( not ( = ?auto_376525 ?auto_376526 ) ) ( not ( = ?auto_376525 ?auto_376527 ) ) ( not ( = ?auto_376525 ?auto_376528 ) ) ( not ( = ?auto_376525 ?auto_376529 ) ) ( not ( = ?auto_376525 ?auto_376530 ) ) ( not ( = ?auto_376526 ?auto_376527 ) ) ( not ( = ?auto_376526 ?auto_376528 ) ) ( not ( = ?auto_376526 ?auto_376529 ) ) ( not ( = ?auto_376526 ?auto_376530 ) ) ( not ( = ?auto_376527 ?auto_376528 ) ) ( not ( = ?auto_376527 ?auto_376529 ) ) ( not ( = ?auto_376527 ?auto_376530 ) ) ( not ( = ?auto_376528 ?auto_376529 ) ) ( not ( = ?auto_376528 ?auto_376530 ) ) ( not ( = ?auto_376529 ?auto_376530 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376529 ?auto_376530 )
      ( !STACK ?auto_376529 ?auto_376528 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376537 - BLOCK
      ?auto_376538 - BLOCK
      ?auto_376539 - BLOCK
      ?auto_376540 - BLOCK
      ?auto_376541 - BLOCK
      ?auto_376542 - BLOCK
    )
    :vars
    (
      ?auto_376543 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376541 ) ( ON ?auto_376542 ?auto_376543 ) ( CLEAR ?auto_376542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376537 ) ( ON ?auto_376538 ?auto_376537 ) ( ON ?auto_376539 ?auto_376538 ) ( ON ?auto_376540 ?auto_376539 ) ( ON ?auto_376541 ?auto_376540 ) ( not ( = ?auto_376537 ?auto_376538 ) ) ( not ( = ?auto_376537 ?auto_376539 ) ) ( not ( = ?auto_376537 ?auto_376540 ) ) ( not ( = ?auto_376537 ?auto_376541 ) ) ( not ( = ?auto_376537 ?auto_376542 ) ) ( not ( = ?auto_376537 ?auto_376543 ) ) ( not ( = ?auto_376538 ?auto_376539 ) ) ( not ( = ?auto_376538 ?auto_376540 ) ) ( not ( = ?auto_376538 ?auto_376541 ) ) ( not ( = ?auto_376538 ?auto_376542 ) ) ( not ( = ?auto_376538 ?auto_376543 ) ) ( not ( = ?auto_376539 ?auto_376540 ) ) ( not ( = ?auto_376539 ?auto_376541 ) ) ( not ( = ?auto_376539 ?auto_376542 ) ) ( not ( = ?auto_376539 ?auto_376543 ) ) ( not ( = ?auto_376540 ?auto_376541 ) ) ( not ( = ?auto_376540 ?auto_376542 ) ) ( not ( = ?auto_376540 ?auto_376543 ) ) ( not ( = ?auto_376541 ?auto_376542 ) ) ( not ( = ?auto_376541 ?auto_376543 ) ) ( not ( = ?auto_376542 ?auto_376543 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376542 ?auto_376543 )
      ( !STACK ?auto_376542 ?auto_376541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376550 - BLOCK
      ?auto_376551 - BLOCK
      ?auto_376552 - BLOCK
      ?auto_376553 - BLOCK
      ?auto_376554 - BLOCK
      ?auto_376555 - BLOCK
    )
    :vars
    (
      ?auto_376556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376555 ?auto_376556 ) ( ON-TABLE ?auto_376550 ) ( ON ?auto_376551 ?auto_376550 ) ( ON ?auto_376552 ?auto_376551 ) ( ON ?auto_376553 ?auto_376552 ) ( not ( = ?auto_376550 ?auto_376551 ) ) ( not ( = ?auto_376550 ?auto_376552 ) ) ( not ( = ?auto_376550 ?auto_376553 ) ) ( not ( = ?auto_376550 ?auto_376554 ) ) ( not ( = ?auto_376550 ?auto_376555 ) ) ( not ( = ?auto_376550 ?auto_376556 ) ) ( not ( = ?auto_376551 ?auto_376552 ) ) ( not ( = ?auto_376551 ?auto_376553 ) ) ( not ( = ?auto_376551 ?auto_376554 ) ) ( not ( = ?auto_376551 ?auto_376555 ) ) ( not ( = ?auto_376551 ?auto_376556 ) ) ( not ( = ?auto_376552 ?auto_376553 ) ) ( not ( = ?auto_376552 ?auto_376554 ) ) ( not ( = ?auto_376552 ?auto_376555 ) ) ( not ( = ?auto_376552 ?auto_376556 ) ) ( not ( = ?auto_376553 ?auto_376554 ) ) ( not ( = ?auto_376553 ?auto_376555 ) ) ( not ( = ?auto_376553 ?auto_376556 ) ) ( not ( = ?auto_376554 ?auto_376555 ) ) ( not ( = ?auto_376554 ?auto_376556 ) ) ( not ( = ?auto_376555 ?auto_376556 ) ) ( CLEAR ?auto_376553 ) ( ON ?auto_376554 ?auto_376555 ) ( CLEAR ?auto_376554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_376550 ?auto_376551 ?auto_376552 ?auto_376553 ?auto_376554 )
      ( MAKE-6PILE ?auto_376550 ?auto_376551 ?auto_376552 ?auto_376553 ?auto_376554 ?auto_376555 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376563 - BLOCK
      ?auto_376564 - BLOCK
      ?auto_376565 - BLOCK
      ?auto_376566 - BLOCK
      ?auto_376567 - BLOCK
      ?auto_376568 - BLOCK
    )
    :vars
    (
      ?auto_376569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376568 ?auto_376569 ) ( ON-TABLE ?auto_376563 ) ( ON ?auto_376564 ?auto_376563 ) ( ON ?auto_376565 ?auto_376564 ) ( ON ?auto_376566 ?auto_376565 ) ( not ( = ?auto_376563 ?auto_376564 ) ) ( not ( = ?auto_376563 ?auto_376565 ) ) ( not ( = ?auto_376563 ?auto_376566 ) ) ( not ( = ?auto_376563 ?auto_376567 ) ) ( not ( = ?auto_376563 ?auto_376568 ) ) ( not ( = ?auto_376563 ?auto_376569 ) ) ( not ( = ?auto_376564 ?auto_376565 ) ) ( not ( = ?auto_376564 ?auto_376566 ) ) ( not ( = ?auto_376564 ?auto_376567 ) ) ( not ( = ?auto_376564 ?auto_376568 ) ) ( not ( = ?auto_376564 ?auto_376569 ) ) ( not ( = ?auto_376565 ?auto_376566 ) ) ( not ( = ?auto_376565 ?auto_376567 ) ) ( not ( = ?auto_376565 ?auto_376568 ) ) ( not ( = ?auto_376565 ?auto_376569 ) ) ( not ( = ?auto_376566 ?auto_376567 ) ) ( not ( = ?auto_376566 ?auto_376568 ) ) ( not ( = ?auto_376566 ?auto_376569 ) ) ( not ( = ?auto_376567 ?auto_376568 ) ) ( not ( = ?auto_376567 ?auto_376569 ) ) ( not ( = ?auto_376568 ?auto_376569 ) ) ( CLEAR ?auto_376566 ) ( ON ?auto_376567 ?auto_376568 ) ( CLEAR ?auto_376567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_376563 ?auto_376564 ?auto_376565 ?auto_376566 ?auto_376567 )
      ( MAKE-6PILE ?auto_376563 ?auto_376564 ?auto_376565 ?auto_376566 ?auto_376567 ?auto_376568 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376576 - BLOCK
      ?auto_376577 - BLOCK
      ?auto_376578 - BLOCK
      ?auto_376579 - BLOCK
      ?auto_376580 - BLOCK
      ?auto_376581 - BLOCK
    )
    :vars
    (
      ?auto_376582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376581 ?auto_376582 ) ( ON-TABLE ?auto_376576 ) ( ON ?auto_376577 ?auto_376576 ) ( ON ?auto_376578 ?auto_376577 ) ( not ( = ?auto_376576 ?auto_376577 ) ) ( not ( = ?auto_376576 ?auto_376578 ) ) ( not ( = ?auto_376576 ?auto_376579 ) ) ( not ( = ?auto_376576 ?auto_376580 ) ) ( not ( = ?auto_376576 ?auto_376581 ) ) ( not ( = ?auto_376576 ?auto_376582 ) ) ( not ( = ?auto_376577 ?auto_376578 ) ) ( not ( = ?auto_376577 ?auto_376579 ) ) ( not ( = ?auto_376577 ?auto_376580 ) ) ( not ( = ?auto_376577 ?auto_376581 ) ) ( not ( = ?auto_376577 ?auto_376582 ) ) ( not ( = ?auto_376578 ?auto_376579 ) ) ( not ( = ?auto_376578 ?auto_376580 ) ) ( not ( = ?auto_376578 ?auto_376581 ) ) ( not ( = ?auto_376578 ?auto_376582 ) ) ( not ( = ?auto_376579 ?auto_376580 ) ) ( not ( = ?auto_376579 ?auto_376581 ) ) ( not ( = ?auto_376579 ?auto_376582 ) ) ( not ( = ?auto_376580 ?auto_376581 ) ) ( not ( = ?auto_376580 ?auto_376582 ) ) ( not ( = ?auto_376581 ?auto_376582 ) ) ( ON ?auto_376580 ?auto_376581 ) ( CLEAR ?auto_376578 ) ( ON ?auto_376579 ?auto_376580 ) ( CLEAR ?auto_376579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_376576 ?auto_376577 ?auto_376578 ?auto_376579 )
      ( MAKE-6PILE ?auto_376576 ?auto_376577 ?auto_376578 ?auto_376579 ?auto_376580 ?auto_376581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376589 - BLOCK
      ?auto_376590 - BLOCK
      ?auto_376591 - BLOCK
      ?auto_376592 - BLOCK
      ?auto_376593 - BLOCK
      ?auto_376594 - BLOCK
    )
    :vars
    (
      ?auto_376595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376594 ?auto_376595 ) ( ON-TABLE ?auto_376589 ) ( ON ?auto_376590 ?auto_376589 ) ( ON ?auto_376591 ?auto_376590 ) ( not ( = ?auto_376589 ?auto_376590 ) ) ( not ( = ?auto_376589 ?auto_376591 ) ) ( not ( = ?auto_376589 ?auto_376592 ) ) ( not ( = ?auto_376589 ?auto_376593 ) ) ( not ( = ?auto_376589 ?auto_376594 ) ) ( not ( = ?auto_376589 ?auto_376595 ) ) ( not ( = ?auto_376590 ?auto_376591 ) ) ( not ( = ?auto_376590 ?auto_376592 ) ) ( not ( = ?auto_376590 ?auto_376593 ) ) ( not ( = ?auto_376590 ?auto_376594 ) ) ( not ( = ?auto_376590 ?auto_376595 ) ) ( not ( = ?auto_376591 ?auto_376592 ) ) ( not ( = ?auto_376591 ?auto_376593 ) ) ( not ( = ?auto_376591 ?auto_376594 ) ) ( not ( = ?auto_376591 ?auto_376595 ) ) ( not ( = ?auto_376592 ?auto_376593 ) ) ( not ( = ?auto_376592 ?auto_376594 ) ) ( not ( = ?auto_376592 ?auto_376595 ) ) ( not ( = ?auto_376593 ?auto_376594 ) ) ( not ( = ?auto_376593 ?auto_376595 ) ) ( not ( = ?auto_376594 ?auto_376595 ) ) ( ON ?auto_376593 ?auto_376594 ) ( CLEAR ?auto_376591 ) ( ON ?auto_376592 ?auto_376593 ) ( CLEAR ?auto_376592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_376589 ?auto_376590 ?auto_376591 ?auto_376592 )
      ( MAKE-6PILE ?auto_376589 ?auto_376590 ?auto_376591 ?auto_376592 ?auto_376593 ?auto_376594 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376602 - BLOCK
      ?auto_376603 - BLOCK
      ?auto_376604 - BLOCK
      ?auto_376605 - BLOCK
      ?auto_376606 - BLOCK
      ?auto_376607 - BLOCK
    )
    :vars
    (
      ?auto_376608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376607 ?auto_376608 ) ( ON-TABLE ?auto_376602 ) ( ON ?auto_376603 ?auto_376602 ) ( not ( = ?auto_376602 ?auto_376603 ) ) ( not ( = ?auto_376602 ?auto_376604 ) ) ( not ( = ?auto_376602 ?auto_376605 ) ) ( not ( = ?auto_376602 ?auto_376606 ) ) ( not ( = ?auto_376602 ?auto_376607 ) ) ( not ( = ?auto_376602 ?auto_376608 ) ) ( not ( = ?auto_376603 ?auto_376604 ) ) ( not ( = ?auto_376603 ?auto_376605 ) ) ( not ( = ?auto_376603 ?auto_376606 ) ) ( not ( = ?auto_376603 ?auto_376607 ) ) ( not ( = ?auto_376603 ?auto_376608 ) ) ( not ( = ?auto_376604 ?auto_376605 ) ) ( not ( = ?auto_376604 ?auto_376606 ) ) ( not ( = ?auto_376604 ?auto_376607 ) ) ( not ( = ?auto_376604 ?auto_376608 ) ) ( not ( = ?auto_376605 ?auto_376606 ) ) ( not ( = ?auto_376605 ?auto_376607 ) ) ( not ( = ?auto_376605 ?auto_376608 ) ) ( not ( = ?auto_376606 ?auto_376607 ) ) ( not ( = ?auto_376606 ?auto_376608 ) ) ( not ( = ?auto_376607 ?auto_376608 ) ) ( ON ?auto_376606 ?auto_376607 ) ( ON ?auto_376605 ?auto_376606 ) ( CLEAR ?auto_376603 ) ( ON ?auto_376604 ?auto_376605 ) ( CLEAR ?auto_376604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376602 ?auto_376603 ?auto_376604 )
      ( MAKE-6PILE ?auto_376602 ?auto_376603 ?auto_376604 ?auto_376605 ?auto_376606 ?auto_376607 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376615 - BLOCK
      ?auto_376616 - BLOCK
      ?auto_376617 - BLOCK
      ?auto_376618 - BLOCK
      ?auto_376619 - BLOCK
      ?auto_376620 - BLOCK
    )
    :vars
    (
      ?auto_376621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376620 ?auto_376621 ) ( ON-TABLE ?auto_376615 ) ( ON ?auto_376616 ?auto_376615 ) ( not ( = ?auto_376615 ?auto_376616 ) ) ( not ( = ?auto_376615 ?auto_376617 ) ) ( not ( = ?auto_376615 ?auto_376618 ) ) ( not ( = ?auto_376615 ?auto_376619 ) ) ( not ( = ?auto_376615 ?auto_376620 ) ) ( not ( = ?auto_376615 ?auto_376621 ) ) ( not ( = ?auto_376616 ?auto_376617 ) ) ( not ( = ?auto_376616 ?auto_376618 ) ) ( not ( = ?auto_376616 ?auto_376619 ) ) ( not ( = ?auto_376616 ?auto_376620 ) ) ( not ( = ?auto_376616 ?auto_376621 ) ) ( not ( = ?auto_376617 ?auto_376618 ) ) ( not ( = ?auto_376617 ?auto_376619 ) ) ( not ( = ?auto_376617 ?auto_376620 ) ) ( not ( = ?auto_376617 ?auto_376621 ) ) ( not ( = ?auto_376618 ?auto_376619 ) ) ( not ( = ?auto_376618 ?auto_376620 ) ) ( not ( = ?auto_376618 ?auto_376621 ) ) ( not ( = ?auto_376619 ?auto_376620 ) ) ( not ( = ?auto_376619 ?auto_376621 ) ) ( not ( = ?auto_376620 ?auto_376621 ) ) ( ON ?auto_376619 ?auto_376620 ) ( ON ?auto_376618 ?auto_376619 ) ( CLEAR ?auto_376616 ) ( ON ?auto_376617 ?auto_376618 ) ( CLEAR ?auto_376617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376615 ?auto_376616 ?auto_376617 )
      ( MAKE-6PILE ?auto_376615 ?auto_376616 ?auto_376617 ?auto_376618 ?auto_376619 ?auto_376620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376628 - BLOCK
      ?auto_376629 - BLOCK
      ?auto_376630 - BLOCK
      ?auto_376631 - BLOCK
      ?auto_376632 - BLOCK
      ?auto_376633 - BLOCK
    )
    :vars
    (
      ?auto_376634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376633 ?auto_376634 ) ( ON-TABLE ?auto_376628 ) ( not ( = ?auto_376628 ?auto_376629 ) ) ( not ( = ?auto_376628 ?auto_376630 ) ) ( not ( = ?auto_376628 ?auto_376631 ) ) ( not ( = ?auto_376628 ?auto_376632 ) ) ( not ( = ?auto_376628 ?auto_376633 ) ) ( not ( = ?auto_376628 ?auto_376634 ) ) ( not ( = ?auto_376629 ?auto_376630 ) ) ( not ( = ?auto_376629 ?auto_376631 ) ) ( not ( = ?auto_376629 ?auto_376632 ) ) ( not ( = ?auto_376629 ?auto_376633 ) ) ( not ( = ?auto_376629 ?auto_376634 ) ) ( not ( = ?auto_376630 ?auto_376631 ) ) ( not ( = ?auto_376630 ?auto_376632 ) ) ( not ( = ?auto_376630 ?auto_376633 ) ) ( not ( = ?auto_376630 ?auto_376634 ) ) ( not ( = ?auto_376631 ?auto_376632 ) ) ( not ( = ?auto_376631 ?auto_376633 ) ) ( not ( = ?auto_376631 ?auto_376634 ) ) ( not ( = ?auto_376632 ?auto_376633 ) ) ( not ( = ?auto_376632 ?auto_376634 ) ) ( not ( = ?auto_376633 ?auto_376634 ) ) ( ON ?auto_376632 ?auto_376633 ) ( ON ?auto_376631 ?auto_376632 ) ( ON ?auto_376630 ?auto_376631 ) ( CLEAR ?auto_376628 ) ( ON ?auto_376629 ?auto_376630 ) ( CLEAR ?auto_376629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376628 ?auto_376629 )
      ( MAKE-6PILE ?auto_376628 ?auto_376629 ?auto_376630 ?auto_376631 ?auto_376632 ?auto_376633 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376641 - BLOCK
      ?auto_376642 - BLOCK
      ?auto_376643 - BLOCK
      ?auto_376644 - BLOCK
      ?auto_376645 - BLOCK
      ?auto_376646 - BLOCK
    )
    :vars
    (
      ?auto_376647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376646 ?auto_376647 ) ( ON-TABLE ?auto_376641 ) ( not ( = ?auto_376641 ?auto_376642 ) ) ( not ( = ?auto_376641 ?auto_376643 ) ) ( not ( = ?auto_376641 ?auto_376644 ) ) ( not ( = ?auto_376641 ?auto_376645 ) ) ( not ( = ?auto_376641 ?auto_376646 ) ) ( not ( = ?auto_376641 ?auto_376647 ) ) ( not ( = ?auto_376642 ?auto_376643 ) ) ( not ( = ?auto_376642 ?auto_376644 ) ) ( not ( = ?auto_376642 ?auto_376645 ) ) ( not ( = ?auto_376642 ?auto_376646 ) ) ( not ( = ?auto_376642 ?auto_376647 ) ) ( not ( = ?auto_376643 ?auto_376644 ) ) ( not ( = ?auto_376643 ?auto_376645 ) ) ( not ( = ?auto_376643 ?auto_376646 ) ) ( not ( = ?auto_376643 ?auto_376647 ) ) ( not ( = ?auto_376644 ?auto_376645 ) ) ( not ( = ?auto_376644 ?auto_376646 ) ) ( not ( = ?auto_376644 ?auto_376647 ) ) ( not ( = ?auto_376645 ?auto_376646 ) ) ( not ( = ?auto_376645 ?auto_376647 ) ) ( not ( = ?auto_376646 ?auto_376647 ) ) ( ON ?auto_376645 ?auto_376646 ) ( ON ?auto_376644 ?auto_376645 ) ( ON ?auto_376643 ?auto_376644 ) ( CLEAR ?auto_376641 ) ( ON ?auto_376642 ?auto_376643 ) ( CLEAR ?auto_376642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376641 ?auto_376642 )
      ( MAKE-6PILE ?auto_376641 ?auto_376642 ?auto_376643 ?auto_376644 ?auto_376645 ?auto_376646 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376654 - BLOCK
      ?auto_376655 - BLOCK
      ?auto_376656 - BLOCK
      ?auto_376657 - BLOCK
      ?auto_376658 - BLOCK
      ?auto_376659 - BLOCK
    )
    :vars
    (
      ?auto_376660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376659 ?auto_376660 ) ( not ( = ?auto_376654 ?auto_376655 ) ) ( not ( = ?auto_376654 ?auto_376656 ) ) ( not ( = ?auto_376654 ?auto_376657 ) ) ( not ( = ?auto_376654 ?auto_376658 ) ) ( not ( = ?auto_376654 ?auto_376659 ) ) ( not ( = ?auto_376654 ?auto_376660 ) ) ( not ( = ?auto_376655 ?auto_376656 ) ) ( not ( = ?auto_376655 ?auto_376657 ) ) ( not ( = ?auto_376655 ?auto_376658 ) ) ( not ( = ?auto_376655 ?auto_376659 ) ) ( not ( = ?auto_376655 ?auto_376660 ) ) ( not ( = ?auto_376656 ?auto_376657 ) ) ( not ( = ?auto_376656 ?auto_376658 ) ) ( not ( = ?auto_376656 ?auto_376659 ) ) ( not ( = ?auto_376656 ?auto_376660 ) ) ( not ( = ?auto_376657 ?auto_376658 ) ) ( not ( = ?auto_376657 ?auto_376659 ) ) ( not ( = ?auto_376657 ?auto_376660 ) ) ( not ( = ?auto_376658 ?auto_376659 ) ) ( not ( = ?auto_376658 ?auto_376660 ) ) ( not ( = ?auto_376659 ?auto_376660 ) ) ( ON ?auto_376658 ?auto_376659 ) ( ON ?auto_376657 ?auto_376658 ) ( ON ?auto_376656 ?auto_376657 ) ( ON ?auto_376655 ?auto_376656 ) ( ON ?auto_376654 ?auto_376655 ) ( CLEAR ?auto_376654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376654 )
      ( MAKE-6PILE ?auto_376654 ?auto_376655 ?auto_376656 ?auto_376657 ?auto_376658 ?auto_376659 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_376667 - BLOCK
      ?auto_376668 - BLOCK
      ?auto_376669 - BLOCK
      ?auto_376670 - BLOCK
      ?auto_376671 - BLOCK
      ?auto_376672 - BLOCK
    )
    :vars
    (
      ?auto_376673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376672 ?auto_376673 ) ( not ( = ?auto_376667 ?auto_376668 ) ) ( not ( = ?auto_376667 ?auto_376669 ) ) ( not ( = ?auto_376667 ?auto_376670 ) ) ( not ( = ?auto_376667 ?auto_376671 ) ) ( not ( = ?auto_376667 ?auto_376672 ) ) ( not ( = ?auto_376667 ?auto_376673 ) ) ( not ( = ?auto_376668 ?auto_376669 ) ) ( not ( = ?auto_376668 ?auto_376670 ) ) ( not ( = ?auto_376668 ?auto_376671 ) ) ( not ( = ?auto_376668 ?auto_376672 ) ) ( not ( = ?auto_376668 ?auto_376673 ) ) ( not ( = ?auto_376669 ?auto_376670 ) ) ( not ( = ?auto_376669 ?auto_376671 ) ) ( not ( = ?auto_376669 ?auto_376672 ) ) ( not ( = ?auto_376669 ?auto_376673 ) ) ( not ( = ?auto_376670 ?auto_376671 ) ) ( not ( = ?auto_376670 ?auto_376672 ) ) ( not ( = ?auto_376670 ?auto_376673 ) ) ( not ( = ?auto_376671 ?auto_376672 ) ) ( not ( = ?auto_376671 ?auto_376673 ) ) ( not ( = ?auto_376672 ?auto_376673 ) ) ( ON ?auto_376671 ?auto_376672 ) ( ON ?auto_376670 ?auto_376671 ) ( ON ?auto_376669 ?auto_376670 ) ( ON ?auto_376668 ?auto_376669 ) ( ON ?auto_376667 ?auto_376668 ) ( CLEAR ?auto_376667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376667 )
      ( MAKE-6PILE ?auto_376667 ?auto_376668 ?auto_376669 ?auto_376670 ?auto_376671 ?auto_376672 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376681 - BLOCK
      ?auto_376682 - BLOCK
      ?auto_376683 - BLOCK
      ?auto_376684 - BLOCK
      ?auto_376685 - BLOCK
      ?auto_376686 - BLOCK
      ?auto_376687 - BLOCK
    )
    :vars
    (
      ?auto_376688 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376686 ) ( ON ?auto_376687 ?auto_376688 ) ( CLEAR ?auto_376687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376681 ) ( ON ?auto_376682 ?auto_376681 ) ( ON ?auto_376683 ?auto_376682 ) ( ON ?auto_376684 ?auto_376683 ) ( ON ?auto_376685 ?auto_376684 ) ( ON ?auto_376686 ?auto_376685 ) ( not ( = ?auto_376681 ?auto_376682 ) ) ( not ( = ?auto_376681 ?auto_376683 ) ) ( not ( = ?auto_376681 ?auto_376684 ) ) ( not ( = ?auto_376681 ?auto_376685 ) ) ( not ( = ?auto_376681 ?auto_376686 ) ) ( not ( = ?auto_376681 ?auto_376687 ) ) ( not ( = ?auto_376681 ?auto_376688 ) ) ( not ( = ?auto_376682 ?auto_376683 ) ) ( not ( = ?auto_376682 ?auto_376684 ) ) ( not ( = ?auto_376682 ?auto_376685 ) ) ( not ( = ?auto_376682 ?auto_376686 ) ) ( not ( = ?auto_376682 ?auto_376687 ) ) ( not ( = ?auto_376682 ?auto_376688 ) ) ( not ( = ?auto_376683 ?auto_376684 ) ) ( not ( = ?auto_376683 ?auto_376685 ) ) ( not ( = ?auto_376683 ?auto_376686 ) ) ( not ( = ?auto_376683 ?auto_376687 ) ) ( not ( = ?auto_376683 ?auto_376688 ) ) ( not ( = ?auto_376684 ?auto_376685 ) ) ( not ( = ?auto_376684 ?auto_376686 ) ) ( not ( = ?auto_376684 ?auto_376687 ) ) ( not ( = ?auto_376684 ?auto_376688 ) ) ( not ( = ?auto_376685 ?auto_376686 ) ) ( not ( = ?auto_376685 ?auto_376687 ) ) ( not ( = ?auto_376685 ?auto_376688 ) ) ( not ( = ?auto_376686 ?auto_376687 ) ) ( not ( = ?auto_376686 ?auto_376688 ) ) ( not ( = ?auto_376687 ?auto_376688 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376687 ?auto_376688 )
      ( !STACK ?auto_376687 ?auto_376686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376696 - BLOCK
      ?auto_376697 - BLOCK
      ?auto_376698 - BLOCK
      ?auto_376699 - BLOCK
      ?auto_376700 - BLOCK
      ?auto_376701 - BLOCK
      ?auto_376702 - BLOCK
    )
    :vars
    (
      ?auto_376703 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376701 ) ( ON ?auto_376702 ?auto_376703 ) ( CLEAR ?auto_376702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376696 ) ( ON ?auto_376697 ?auto_376696 ) ( ON ?auto_376698 ?auto_376697 ) ( ON ?auto_376699 ?auto_376698 ) ( ON ?auto_376700 ?auto_376699 ) ( ON ?auto_376701 ?auto_376700 ) ( not ( = ?auto_376696 ?auto_376697 ) ) ( not ( = ?auto_376696 ?auto_376698 ) ) ( not ( = ?auto_376696 ?auto_376699 ) ) ( not ( = ?auto_376696 ?auto_376700 ) ) ( not ( = ?auto_376696 ?auto_376701 ) ) ( not ( = ?auto_376696 ?auto_376702 ) ) ( not ( = ?auto_376696 ?auto_376703 ) ) ( not ( = ?auto_376697 ?auto_376698 ) ) ( not ( = ?auto_376697 ?auto_376699 ) ) ( not ( = ?auto_376697 ?auto_376700 ) ) ( not ( = ?auto_376697 ?auto_376701 ) ) ( not ( = ?auto_376697 ?auto_376702 ) ) ( not ( = ?auto_376697 ?auto_376703 ) ) ( not ( = ?auto_376698 ?auto_376699 ) ) ( not ( = ?auto_376698 ?auto_376700 ) ) ( not ( = ?auto_376698 ?auto_376701 ) ) ( not ( = ?auto_376698 ?auto_376702 ) ) ( not ( = ?auto_376698 ?auto_376703 ) ) ( not ( = ?auto_376699 ?auto_376700 ) ) ( not ( = ?auto_376699 ?auto_376701 ) ) ( not ( = ?auto_376699 ?auto_376702 ) ) ( not ( = ?auto_376699 ?auto_376703 ) ) ( not ( = ?auto_376700 ?auto_376701 ) ) ( not ( = ?auto_376700 ?auto_376702 ) ) ( not ( = ?auto_376700 ?auto_376703 ) ) ( not ( = ?auto_376701 ?auto_376702 ) ) ( not ( = ?auto_376701 ?auto_376703 ) ) ( not ( = ?auto_376702 ?auto_376703 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376702 ?auto_376703 )
      ( !STACK ?auto_376702 ?auto_376701 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376711 - BLOCK
      ?auto_376712 - BLOCK
      ?auto_376713 - BLOCK
      ?auto_376714 - BLOCK
      ?auto_376715 - BLOCK
      ?auto_376716 - BLOCK
      ?auto_376717 - BLOCK
    )
    :vars
    (
      ?auto_376718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376717 ?auto_376718 ) ( ON-TABLE ?auto_376711 ) ( ON ?auto_376712 ?auto_376711 ) ( ON ?auto_376713 ?auto_376712 ) ( ON ?auto_376714 ?auto_376713 ) ( ON ?auto_376715 ?auto_376714 ) ( not ( = ?auto_376711 ?auto_376712 ) ) ( not ( = ?auto_376711 ?auto_376713 ) ) ( not ( = ?auto_376711 ?auto_376714 ) ) ( not ( = ?auto_376711 ?auto_376715 ) ) ( not ( = ?auto_376711 ?auto_376716 ) ) ( not ( = ?auto_376711 ?auto_376717 ) ) ( not ( = ?auto_376711 ?auto_376718 ) ) ( not ( = ?auto_376712 ?auto_376713 ) ) ( not ( = ?auto_376712 ?auto_376714 ) ) ( not ( = ?auto_376712 ?auto_376715 ) ) ( not ( = ?auto_376712 ?auto_376716 ) ) ( not ( = ?auto_376712 ?auto_376717 ) ) ( not ( = ?auto_376712 ?auto_376718 ) ) ( not ( = ?auto_376713 ?auto_376714 ) ) ( not ( = ?auto_376713 ?auto_376715 ) ) ( not ( = ?auto_376713 ?auto_376716 ) ) ( not ( = ?auto_376713 ?auto_376717 ) ) ( not ( = ?auto_376713 ?auto_376718 ) ) ( not ( = ?auto_376714 ?auto_376715 ) ) ( not ( = ?auto_376714 ?auto_376716 ) ) ( not ( = ?auto_376714 ?auto_376717 ) ) ( not ( = ?auto_376714 ?auto_376718 ) ) ( not ( = ?auto_376715 ?auto_376716 ) ) ( not ( = ?auto_376715 ?auto_376717 ) ) ( not ( = ?auto_376715 ?auto_376718 ) ) ( not ( = ?auto_376716 ?auto_376717 ) ) ( not ( = ?auto_376716 ?auto_376718 ) ) ( not ( = ?auto_376717 ?auto_376718 ) ) ( CLEAR ?auto_376715 ) ( ON ?auto_376716 ?auto_376717 ) ( CLEAR ?auto_376716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_376711 ?auto_376712 ?auto_376713 ?auto_376714 ?auto_376715 ?auto_376716 )
      ( MAKE-7PILE ?auto_376711 ?auto_376712 ?auto_376713 ?auto_376714 ?auto_376715 ?auto_376716 ?auto_376717 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376726 - BLOCK
      ?auto_376727 - BLOCK
      ?auto_376728 - BLOCK
      ?auto_376729 - BLOCK
      ?auto_376730 - BLOCK
      ?auto_376731 - BLOCK
      ?auto_376732 - BLOCK
    )
    :vars
    (
      ?auto_376733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376732 ?auto_376733 ) ( ON-TABLE ?auto_376726 ) ( ON ?auto_376727 ?auto_376726 ) ( ON ?auto_376728 ?auto_376727 ) ( ON ?auto_376729 ?auto_376728 ) ( ON ?auto_376730 ?auto_376729 ) ( not ( = ?auto_376726 ?auto_376727 ) ) ( not ( = ?auto_376726 ?auto_376728 ) ) ( not ( = ?auto_376726 ?auto_376729 ) ) ( not ( = ?auto_376726 ?auto_376730 ) ) ( not ( = ?auto_376726 ?auto_376731 ) ) ( not ( = ?auto_376726 ?auto_376732 ) ) ( not ( = ?auto_376726 ?auto_376733 ) ) ( not ( = ?auto_376727 ?auto_376728 ) ) ( not ( = ?auto_376727 ?auto_376729 ) ) ( not ( = ?auto_376727 ?auto_376730 ) ) ( not ( = ?auto_376727 ?auto_376731 ) ) ( not ( = ?auto_376727 ?auto_376732 ) ) ( not ( = ?auto_376727 ?auto_376733 ) ) ( not ( = ?auto_376728 ?auto_376729 ) ) ( not ( = ?auto_376728 ?auto_376730 ) ) ( not ( = ?auto_376728 ?auto_376731 ) ) ( not ( = ?auto_376728 ?auto_376732 ) ) ( not ( = ?auto_376728 ?auto_376733 ) ) ( not ( = ?auto_376729 ?auto_376730 ) ) ( not ( = ?auto_376729 ?auto_376731 ) ) ( not ( = ?auto_376729 ?auto_376732 ) ) ( not ( = ?auto_376729 ?auto_376733 ) ) ( not ( = ?auto_376730 ?auto_376731 ) ) ( not ( = ?auto_376730 ?auto_376732 ) ) ( not ( = ?auto_376730 ?auto_376733 ) ) ( not ( = ?auto_376731 ?auto_376732 ) ) ( not ( = ?auto_376731 ?auto_376733 ) ) ( not ( = ?auto_376732 ?auto_376733 ) ) ( CLEAR ?auto_376730 ) ( ON ?auto_376731 ?auto_376732 ) ( CLEAR ?auto_376731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_376726 ?auto_376727 ?auto_376728 ?auto_376729 ?auto_376730 ?auto_376731 )
      ( MAKE-7PILE ?auto_376726 ?auto_376727 ?auto_376728 ?auto_376729 ?auto_376730 ?auto_376731 ?auto_376732 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376741 - BLOCK
      ?auto_376742 - BLOCK
      ?auto_376743 - BLOCK
      ?auto_376744 - BLOCK
      ?auto_376745 - BLOCK
      ?auto_376746 - BLOCK
      ?auto_376747 - BLOCK
    )
    :vars
    (
      ?auto_376748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376747 ?auto_376748 ) ( ON-TABLE ?auto_376741 ) ( ON ?auto_376742 ?auto_376741 ) ( ON ?auto_376743 ?auto_376742 ) ( ON ?auto_376744 ?auto_376743 ) ( not ( = ?auto_376741 ?auto_376742 ) ) ( not ( = ?auto_376741 ?auto_376743 ) ) ( not ( = ?auto_376741 ?auto_376744 ) ) ( not ( = ?auto_376741 ?auto_376745 ) ) ( not ( = ?auto_376741 ?auto_376746 ) ) ( not ( = ?auto_376741 ?auto_376747 ) ) ( not ( = ?auto_376741 ?auto_376748 ) ) ( not ( = ?auto_376742 ?auto_376743 ) ) ( not ( = ?auto_376742 ?auto_376744 ) ) ( not ( = ?auto_376742 ?auto_376745 ) ) ( not ( = ?auto_376742 ?auto_376746 ) ) ( not ( = ?auto_376742 ?auto_376747 ) ) ( not ( = ?auto_376742 ?auto_376748 ) ) ( not ( = ?auto_376743 ?auto_376744 ) ) ( not ( = ?auto_376743 ?auto_376745 ) ) ( not ( = ?auto_376743 ?auto_376746 ) ) ( not ( = ?auto_376743 ?auto_376747 ) ) ( not ( = ?auto_376743 ?auto_376748 ) ) ( not ( = ?auto_376744 ?auto_376745 ) ) ( not ( = ?auto_376744 ?auto_376746 ) ) ( not ( = ?auto_376744 ?auto_376747 ) ) ( not ( = ?auto_376744 ?auto_376748 ) ) ( not ( = ?auto_376745 ?auto_376746 ) ) ( not ( = ?auto_376745 ?auto_376747 ) ) ( not ( = ?auto_376745 ?auto_376748 ) ) ( not ( = ?auto_376746 ?auto_376747 ) ) ( not ( = ?auto_376746 ?auto_376748 ) ) ( not ( = ?auto_376747 ?auto_376748 ) ) ( ON ?auto_376746 ?auto_376747 ) ( CLEAR ?auto_376744 ) ( ON ?auto_376745 ?auto_376746 ) ( CLEAR ?auto_376745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_376741 ?auto_376742 ?auto_376743 ?auto_376744 ?auto_376745 )
      ( MAKE-7PILE ?auto_376741 ?auto_376742 ?auto_376743 ?auto_376744 ?auto_376745 ?auto_376746 ?auto_376747 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376756 - BLOCK
      ?auto_376757 - BLOCK
      ?auto_376758 - BLOCK
      ?auto_376759 - BLOCK
      ?auto_376760 - BLOCK
      ?auto_376761 - BLOCK
      ?auto_376762 - BLOCK
    )
    :vars
    (
      ?auto_376763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376762 ?auto_376763 ) ( ON-TABLE ?auto_376756 ) ( ON ?auto_376757 ?auto_376756 ) ( ON ?auto_376758 ?auto_376757 ) ( ON ?auto_376759 ?auto_376758 ) ( not ( = ?auto_376756 ?auto_376757 ) ) ( not ( = ?auto_376756 ?auto_376758 ) ) ( not ( = ?auto_376756 ?auto_376759 ) ) ( not ( = ?auto_376756 ?auto_376760 ) ) ( not ( = ?auto_376756 ?auto_376761 ) ) ( not ( = ?auto_376756 ?auto_376762 ) ) ( not ( = ?auto_376756 ?auto_376763 ) ) ( not ( = ?auto_376757 ?auto_376758 ) ) ( not ( = ?auto_376757 ?auto_376759 ) ) ( not ( = ?auto_376757 ?auto_376760 ) ) ( not ( = ?auto_376757 ?auto_376761 ) ) ( not ( = ?auto_376757 ?auto_376762 ) ) ( not ( = ?auto_376757 ?auto_376763 ) ) ( not ( = ?auto_376758 ?auto_376759 ) ) ( not ( = ?auto_376758 ?auto_376760 ) ) ( not ( = ?auto_376758 ?auto_376761 ) ) ( not ( = ?auto_376758 ?auto_376762 ) ) ( not ( = ?auto_376758 ?auto_376763 ) ) ( not ( = ?auto_376759 ?auto_376760 ) ) ( not ( = ?auto_376759 ?auto_376761 ) ) ( not ( = ?auto_376759 ?auto_376762 ) ) ( not ( = ?auto_376759 ?auto_376763 ) ) ( not ( = ?auto_376760 ?auto_376761 ) ) ( not ( = ?auto_376760 ?auto_376762 ) ) ( not ( = ?auto_376760 ?auto_376763 ) ) ( not ( = ?auto_376761 ?auto_376762 ) ) ( not ( = ?auto_376761 ?auto_376763 ) ) ( not ( = ?auto_376762 ?auto_376763 ) ) ( ON ?auto_376761 ?auto_376762 ) ( CLEAR ?auto_376759 ) ( ON ?auto_376760 ?auto_376761 ) ( CLEAR ?auto_376760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_376756 ?auto_376757 ?auto_376758 ?auto_376759 ?auto_376760 )
      ( MAKE-7PILE ?auto_376756 ?auto_376757 ?auto_376758 ?auto_376759 ?auto_376760 ?auto_376761 ?auto_376762 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376771 - BLOCK
      ?auto_376772 - BLOCK
      ?auto_376773 - BLOCK
      ?auto_376774 - BLOCK
      ?auto_376775 - BLOCK
      ?auto_376776 - BLOCK
      ?auto_376777 - BLOCK
    )
    :vars
    (
      ?auto_376778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376777 ?auto_376778 ) ( ON-TABLE ?auto_376771 ) ( ON ?auto_376772 ?auto_376771 ) ( ON ?auto_376773 ?auto_376772 ) ( not ( = ?auto_376771 ?auto_376772 ) ) ( not ( = ?auto_376771 ?auto_376773 ) ) ( not ( = ?auto_376771 ?auto_376774 ) ) ( not ( = ?auto_376771 ?auto_376775 ) ) ( not ( = ?auto_376771 ?auto_376776 ) ) ( not ( = ?auto_376771 ?auto_376777 ) ) ( not ( = ?auto_376771 ?auto_376778 ) ) ( not ( = ?auto_376772 ?auto_376773 ) ) ( not ( = ?auto_376772 ?auto_376774 ) ) ( not ( = ?auto_376772 ?auto_376775 ) ) ( not ( = ?auto_376772 ?auto_376776 ) ) ( not ( = ?auto_376772 ?auto_376777 ) ) ( not ( = ?auto_376772 ?auto_376778 ) ) ( not ( = ?auto_376773 ?auto_376774 ) ) ( not ( = ?auto_376773 ?auto_376775 ) ) ( not ( = ?auto_376773 ?auto_376776 ) ) ( not ( = ?auto_376773 ?auto_376777 ) ) ( not ( = ?auto_376773 ?auto_376778 ) ) ( not ( = ?auto_376774 ?auto_376775 ) ) ( not ( = ?auto_376774 ?auto_376776 ) ) ( not ( = ?auto_376774 ?auto_376777 ) ) ( not ( = ?auto_376774 ?auto_376778 ) ) ( not ( = ?auto_376775 ?auto_376776 ) ) ( not ( = ?auto_376775 ?auto_376777 ) ) ( not ( = ?auto_376775 ?auto_376778 ) ) ( not ( = ?auto_376776 ?auto_376777 ) ) ( not ( = ?auto_376776 ?auto_376778 ) ) ( not ( = ?auto_376777 ?auto_376778 ) ) ( ON ?auto_376776 ?auto_376777 ) ( ON ?auto_376775 ?auto_376776 ) ( CLEAR ?auto_376773 ) ( ON ?auto_376774 ?auto_376775 ) ( CLEAR ?auto_376774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_376771 ?auto_376772 ?auto_376773 ?auto_376774 )
      ( MAKE-7PILE ?auto_376771 ?auto_376772 ?auto_376773 ?auto_376774 ?auto_376775 ?auto_376776 ?auto_376777 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376786 - BLOCK
      ?auto_376787 - BLOCK
      ?auto_376788 - BLOCK
      ?auto_376789 - BLOCK
      ?auto_376790 - BLOCK
      ?auto_376791 - BLOCK
      ?auto_376792 - BLOCK
    )
    :vars
    (
      ?auto_376793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376792 ?auto_376793 ) ( ON-TABLE ?auto_376786 ) ( ON ?auto_376787 ?auto_376786 ) ( ON ?auto_376788 ?auto_376787 ) ( not ( = ?auto_376786 ?auto_376787 ) ) ( not ( = ?auto_376786 ?auto_376788 ) ) ( not ( = ?auto_376786 ?auto_376789 ) ) ( not ( = ?auto_376786 ?auto_376790 ) ) ( not ( = ?auto_376786 ?auto_376791 ) ) ( not ( = ?auto_376786 ?auto_376792 ) ) ( not ( = ?auto_376786 ?auto_376793 ) ) ( not ( = ?auto_376787 ?auto_376788 ) ) ( not ( = ?auto_376787 ?auto_376789 ) ) ( not ( = ?auto_376787 ?auto_376790 ) ) ( not ( = ?auto_376787 ?auto_376791 ) ) ( not ( = ?auto_376787 ?auto_376792 ) ) ( not ( = ?auto_376787 ?auto_376793 ) ) ( not ( = ?auto_376788 ?auto_376789 ) ) ( not ( = ?auto_376788 ?auto_376790 ) ) ( not ( = ?auto_376788 ?auto_376791 ) ) ( not ( = ?auto_376788 ?auto_376792 ) ) ( not ( = ?auto_376788 ?auto_376793 ) ) ( not ( = ?auto_376789 ?auto_376790 ) ) ( not ( = ?auto_376789 ?auto_376791 ) ) ( not ( = ?auto_376789 ?auto_376792 ) ) ( not ( = ?auto_376789 ?auto_376793 ) ) ( not ( = ?auto_376790 ?auto_376791 ) ) ( not ( = ?auto_376790 ?auto_376792 ) ) ( not ( = ?auto_376790 ?auto_376793 ) ) ( not ( = ?auto_376791 ?auto_376792 ) ) ( not ( = ?auto_376791 ?auto_376793 ) ) ( not ( = ?auto_376792 ?auto_376793 ) ) ( ON ?auto_376791 ?auto_376792 ) ( ON ?auto_376790 ?auto_376791 ) ( CLEAR ?auto_376788 ) ( ON ?auto_376789 ?auto_376790 ) ( CLEAR ?auto_376789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_376786 ?auto_376787 ?auto_376788 ?auto_376789 )
      ( MAKE-7PILE ?auto_376786 ?auto_376787 ?auto_376788 ?auto_376789 ?auto_376790 ?auto_376791 ?auto_376792 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376801 - BLOCK
      ?auto_376802 - BLOCK
      ?auto_376803 - BLOCK
      ?auto_376804 - BLOCK
      ?auto_376805 - BLOCK
      ?auto_376806 - BLOCK
      ?auto_376807 - BLOCK
    )
    :vars
    (
      ?auto_376808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376807 ?auto_376808 ) ( ON-TABLE ?auto_376801 ) ( ON ?auto_376802 ?auto_376801 ) ( not ( = ?auto_376801 ?auto_376802 ) ) ( not ( = ?auto_376801 ?auto_376803 ) ) ( not ( = ?auto_376801 ?auto_376804 ) ) ( not ( = ?auto_376801 ?auto_376805 ) ) ( not ( = ?auto_376801 ?auto_376806 ) ) ( not ( = ?auto_376801 ?auto_376807 ) ) ( not ( = ?auto_376801 ?auto_376808 ) ) ( not ( = ?auto_376802 ?auto_376803 ) ) ( not ( = ?auto_376802 ?auto_376804 ) ) ( not ( = ?auto_376802 ?auto_376805 ) ) ( not ( = ?auto_376802 ?auto_376806 ) ) ( not ( = ?auto_376802 ?auto_376807 ) ) ( not ( = ?auto_376802 ?auto_376808 ) ) ( not ( = ?auto_376803 ?auto_376804 ) ) ( not ( = ?auto_376803 ?auto_376805 ) ) ( not ( = ?auto_376803 ?auto_376806 ) ) ( not ( = ?auto_376803 ?auto_376807 ) ) ( not ( = ?auto_376803 ?auto_376808 ) ) ( not ( = ?auto_376804 ?auto_376805 ) ) ( not ( = ?auto_376804 ?auto_376806 ) ) ( not ( = ?auto_376804 ?auto_376807 ) ) ( not ( = ?auto_376804 ?auto_376808 ) ) ( not ( = ?auto_376805 ?auto_376806 ) ) ( not ( = ?auto_376805 ?auto_376807 ) ) ( not ( = ?auto_376805 ?auto_376808 ) ) ( not ( = ?auto_376806 ?auto_376807 ) ) ( not ( = ?auto_376806 ?auto_376808 ) ) ( not ( = ?auto_376807 ?auto_376808 ) ) ( ON ?auto_376806 ?auto_376807 ) ( ON ?auto_376805 ?auto_376806 ) ( ON ?auto_376804 ?auto_376805 ) ( CLEAR ?auto_376802 ) ( ON ?auto_376803 ?auto_376804 ) ( CLEAR ?auto_376803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376801 ?auto_376802 ?auto_376803 )
      ( MAKE-7PILE ?auto_376801 ?auto_376802 ?auto_376803 ?auto_376804 ?auto_376805 ?auto_376806 ?auto_376807 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376816 - BLOCK
      ?auto_376817 - BLOCK
      ?auto_376818 - BLOCK
      ?auto_376819 - BLOCK
      ?auto_376820 - BLOCK
      ?auto_376821 - BLOCK
      ?auto_376822 - BLOCK
    )
    :vars
    (
      ?auto_376823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376822 ?auto_376823 ) ( ON-TABLE ?auto_376816 ) ( ON ?auto_376817 ?auto_376816 ) ( not ( = ?auto_376816 ?auto_376817 ) ) ( not ( = ?auto_376816 ?auto_376818 ) ) ( not ( = ?auto_376816 ?auto_376819 ) ) ( not ( = ?auto_376816 ?auto_376820 ) ) ( not ( = ?auto_376816 ?auto_376821 ) ) ( not ( = ?auto_376816 ?auto_376822 ) ) ( not ( = ?auto_376816 ?auto_376823 ) ) ( not ( = ?auto_376817 ?auto_376818 ) ) ( not ( = ?auto_376817 ?auto_376819 ) ) ( not ( = ?auto_376817 ?auto_376820 ) ) ( not ( = ?auto_376817 ?auto_376821 ) ) ( not ( = ?auto_376817 ?auto_376822 ) ) ( not ( = ?auto_376817 ?auto_376823 ) ) ( not ( = ?auto_376818 ?auto_376819 ) ) ( not ( = ?auto_376818 ?auto_376820 ) ) ( not ( = ?auto_376818 ?auto_376821 ) ) ( not ( = ?auto_376818 ?auto_376822 ) ) ( not ( = ?auto_376818 ?auto_376823 ) ) ( not ( = ?auto_376819 ?auto_376820 ) ) ( not ( = ?auto_376819 ?auto_376821 ) ) ( not ( = ?auto_376819 ?auto_376822 ) ) ( not ( = ?auto_376819 ?auto_376823 ) ) ( not ( = ?auto_376820 ?auto_376821 ) ) ( not ( = ?auto_376820 ?auto_376822 ) ) ( not ( = ?auto_376820 ?auto_376823 ) ) ( not ( = ?auto_376821 ?auto_376822 ) ) ( not ( = ?auto_376821 ?auto_376823 ) ) ( not ( = ?auto_376822 ?auto_376823 ) ) ( ON ?auto_376821 ?auto_376822 ) ( ON ?auto_376820 ?auto_376821 ) ( ON ?auto_376819 ?auto_376820 ) ( CLEAR ?auto_376817 ) ( ON ?auto_376818 ?auto_376819 ) ( CLEAR ?auto_376818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376816 ?auto_376817 ?auto_376818 )
      ( MAKE-7PILE ?auto_376816 ?auto_376817 ?auto_376818 ?auto_376819 ?auto_376820 ?auto_376821 ?auto_376822 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376831 - BLOCK
      ?auto_376832 - BLOCK
      ?auto_376833 - BLOCK
      ?auto_376834 - BLOCK
      ?auto_376835 - BLOCK
      ?auto_376836 - BLOCK
      ?auto_376837 - BLOCK
    )
    :vars
    (
      ?auto_376838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376837 ?auto_376838 ) ( ON-TABLE ?auto_376831 ) ( not ( = ?auto_376831 ?auto_376832 ) ) ( not ( = ?auto_376831 ?auto_376833 ) ) ( not ( = ?auto_376831 ?auto_376834 ) ) ( not ( = ?auto_376831 ?auto_376835 ) ) ( not ( = ?auto_376831 ?auto_376836 ) ) ( not ( = ?auto_376831 ?auto_376837 ) ) ( not ( = ?auto_376831 ?auto_376838 ) ) ( not ( = ?auto_376832 ?auto_376833 ) ) ( not ( = ?auto_376832 ?auto_376834 ) ) ( not ( = ?auto_376832 ?auto_376835 ) ) ( not ( = ?auto_376832 ?auto_376836 ) ) ( not ( = ?auto_376832 ?auto_376837 ) ) ( not ( = ?auto_376832 ?auto_376838 ) ) ( not ( = ?auto_376833 ?auto_376834 ) ) ( not ( = ?auto_376833 ?auto_376835 ) ) ( not ( = ?auto_376833 ?auto_376836 ) ) ( not ( = ?auto_376833 ?auto_376837 ) ) ( not ( = ?auto_376833 ?auto_376838 ) ) ( not ( = ?auto_376834 ?auto_376835 ) ) ( not ( = ?auto_376834 ?auto_376836 ) ) ( not ( = ?auto_376834 ?auto_376837 ) ) ( not ( = ?auto_376834 ?auto_376838 ) ) ( not ( = ?auto_376835 ?auto_376836 ) ) ( not ( = ?auto_376835 ?auto_376837 ) ) ( not ( = ?auto_376835 ?auto_376838 ) ) ( not ( = ?auto_376836 ?auto_376837 ) ) ( not ( = ?auto_376836 ?auto_376838 ) ) ( not ( = ?auto_376837 ?auto_376838 ) ) ( ON ?auto_376836 ?auto_376837 ) ( ON ?auto_376835 ?auto_376836 ) ( ON ?auto_376834 ?auto_376835 ) ( ON ?auto_376833 ?auto_376834 ) ( CLEAR ?auto_376831 ) ( ON ?auto_376832 ?auto_376833 ) ( CLEAR ?auto_376832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376831 ?auto_376832 )
      ( MAKE-7PILE ?auto_376831 ?auto_376832 ?auto_376833 ?auto_376834 ?auto_376835 ?auto_376836 ?auto_376837 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376846 - BLOCK
      ?auto_376847 - BLOCK
      ?auto_376848 - BLOCK
      ?auto_376849 - BLOCK
      ?auto_376850 - BLOCK
      ?auto_376851 - BLOCK
      ?auto_376852 - BLOCK
    )
    :vars
    (
      ?auto_376853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376852 ?auto_376853 ) ( ON-TABLE ?auto_376846 ) ( not ( = ?auto_376846 ?auto_376847 ) ) ( not ( = ?auto_376846 ?auto_376848 ) ) ( not ( = ?auto_376846 ?auto_376849 ) ) ( not ( = ?auto_376846 ?auto_376850 ) ) ( not ( = ?auto_376846 ?auto_376851 ) ) ( not ( = ?auto_376846 ?auto_376852 ) ) ( not ( = ?auto_376846 ?auto_376853 ) ) ( not ( = ?auto_376847 ?auto_376848 ) ) ( not ( = ?auto_376847 ?auto_376849 ) ) ( not ( = ?auto_376847 ?auto_376850 ) ) ( not ( = ?auto_376847 ?auto_376851 ) ) ( not ( = ?auto_376847 ?auto_376852 ) ) ( not ( = ?auto_376847 ?auto_376853 ) ) ( not ( = ?auto_376848 ?auto_376849 ) ) ( not ( = ?auto_376848 ?auto_376850 ) ) ( not ( = ?auto_376848 ?auto_376851 ) ) ( not ( = ?auto_376848 ?auto_376852 ) ) ( not ( = ?auto_376848 ?auto_376853 ) ) ( not ( = ?auto_376849 ?auto_376850 ) ) ( not ( = ?auto_376849 ?auto_376851 ) ) ( not ( = ?auto_376849 ?auto_376852 ) ) ( not ( = ?auto_376849 ?auto_376853 ) ) ( not ( = ?auto_376850 ?auto_376851 ) ) ( not ( = ?auto_376850 ?auto_376852 ) ) ( not ( = ?auto_376850 ?auto_376853 ) ) ( not ( = ?auto_376851 ?auto_376852 ) ) ( not ( = ?auto_376851 ?auto_376853 ) ) ( not ( = ?auto_376852 ?auto_376853 ) ) ( ON ?auto_376851 ?auto_376852 ) ( ON ?auto_376850 ?auto_376851 ) ( ON ?auto_376849 ?auto_376850 ) ( ON ?auto_376848 ?auto_376849 ) ( CLEAR ?auto_376846 ) ( ON ?auto_376847 ?auto_376848 ) ( CLEAR ?auto_376847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376846 ?auto_376847 )
      ( MAKE-7PILE ?auto_376846 ?auto_376847 ?auto_376848 ?auto_376849 ?auto_376850 ?auto_376851 ?auto_376852 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376861 - BLOCK
      ?auto_376862 - BLOCK
      ?auto_376863 - BLOCK
      ?auto_376864 - BLOCK
      ?auto_376865 - BLOCK
      ?auto_376866 - BLOCK
      ?auto_376867 - BLOCK
    )
    :vars
    (
      ?auto_376868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376867 ?auto_376868 ) ( not ( = ?auto_376861 ?auto_376862 ) ) ( not ( = ?auto_376861 ?auto_376863 ) ) ( not ( = ?auto_376861 ?auto_376864 ) ) ( not ( = ?auto_376861 ?auto_376865 ) ) ( not ( = ?auto_376861 ?auto_376866 ) ) ( not ( = ?auto_376861 ?auto_376867 ) ) ( not ( = ?auto_376861 ?auto_376868 ) ) ( not ( = ?auto_376862 ?auto_376863 ) ) ( not ( = ?auto_376862 ?auto_376864 ) ) ( not ( = ?auto_376862 ?auto_376865 ) ) ( not ( = ?auto_376862 ?auto_376866 ) ) ( not ( = ?auto_376862 ?auto_376867 ) ) ( not ( = ?auto_376862 ?auto_376868 ) ) ( not ( = ?auto_376863 ?auto_376864 ) ) ( not ( = ?auto_376863 ?auto_376865 ) ) ( not ( = ?auto_376863 ?auto_376866 ) ) ( not ( = ?auto_376863 ?auto_376867 ) ) ( not ( = ?auto_376863 ?auto_376868 ) ) ( not ( = ?auto_376864 ?auto_376865 ) ) ( not ( = ?auto_376864 ?auto_376866 ) ) ( not ( = ?auto_376864 ?auto_376867 ) ) ( not ( = ?auto_376864 ?auto_376868 ) ) ( not ( = ?auto_376865 ?auto_376866 ) ) ( not ( = ?auto_376865 ?auto_376867 ) ) ( not ( = ?auto_376865 ?auto_376868 ) ) ( not ( = ?auto_376866 ?auto_376867 ) ) ( not ( = ?auto_376866 ?auto_376868 ) ) ( not ( = ?auto_376867 ?auto_376868 ) ) ( ON ?auto_376866 ?auto_376867 ) ( ON ?auto_376865 ?auto_376866 ) ( ON ?auto_376864 ?auto_376865 ) ( ON ?auto_376863 ?auto_376864 ) ( ON ?auto_376862 ?auto_376863 ) ( ON ?auto_376861 ?auto_376862 ) ( CLEAR ?auto_376861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376861 )
      ( MAKE-7PILE ?auto_376861 ?auto_376862 ?auto_376863 ?auto_376864 ?auto_376865 ?auto_376866 ?auto_376867 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_376876 - BLOCK
      ?auto_376877 - BLOCK
      ?auto_376878 - BLOCK
      ?auto_376879 - BLOCK
      ?auto_376880 - BLOCK
      ?auto_376881 - BLOCK
      ?auto_376882 - BLOCK
    )
    :vars
    (
      ?auto_376883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376882 ?auto_376883 ) ( not ( = ?auto_376876 ?auto_376877 ) ) ( not ( = ?auto_376876 ?auto_376878 ) ) ( not ( = ?auto_376876 ?auto_376879 ) ) ( not ( = ?auto_376876 ?auto_376880 ) ) ( not ( = ?auto_376876 ?auto_376881 ) ) ( not ( = ?auto_376876 ?auto_376882 ) ) ( not ( = ?auto_376876 ?auto_376883 ) ) ( not ( = ?auto_376877 ?auto_376878 ) ) ( not ( = ?auto_376877 ?auto_376879 ) ) ( not ( = ?auto_376877 ?auto_376880 ) ) ( not ( = ?auto_376877 ?auto_376881 ) ) ( not ( = ?auto_376877 ?auto_376882 ) ) ( not ( = ?auto_376877 ?auto_376883 ) ) ( not ( = ?auto_376878 ?auto_376879 ) ) ( not ( = ?auto_376878 ?auto_376880 ) ) ( not ( = ?auto_376878 ?auto_376881 ) ) ( not ( = ?auto_376878 ?auto_376882 ) ) ( not ( = ?auto_376878 ?auto_376883 ) ) ( not ( = ?auto_376879 ?auto_376880 ) ) ( not ( = ?auto_376879 ?auto_376881 ) ) ( not ( = ?auto_376879 ?auto_376882 ) ) ( not ( = ?auto_376879 ?auto_376883 ) ) ( not ( = ?auto_376880 ?auto_376881 ) ) ( not ( = ?auto_376880 ?auto_376882 ) ) ( not ( = ?auto_376880 ?auto_376883 ) ) ( not ( = ?auto_376881 ?auto_376882 ) ) ( not ( = ?auto_376881 ?auto_376883 ) ) ( not ( = ?auto_376882 ?auto_376883 ) ) ( ON ?auto_376881 ?auto_376882 ) ( ON ?auto_376880 ?auto_376881 ) ( ON ?auto_376879 ?auto_376880 ) ( ON ?auto_376878 ?auto_376879 ) ( ON ?auto_376877 ?auto_376878 ) ( ON ?auto_376876 ?auto_376877 ) ( CLEAR ?auto_376876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376876 )
      ( MAKE-7PILE ?auto_376876 ?auto_376877 ?auto_376878 ?auto_376879 ?auto_376880 ?auto_376881 ?auto_376882 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_376892 - BLOCK
      ?auto_376893 - BLOCK
      ?auto_376894 - BLOCK
      ?auto_376895 - BLOCK
      ?auto_376896 - BLOCK
      ?auto_376897 - BLOCK
      ?auto_376898 - BLOCK
      ?auto_376899 - BLOCK
    )
    :vars
    (
      ?auto_376900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376898 ) ( ON ?auto_376899 ?auto_376900 ) ( CLEAR ?auto_376899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376892 ) ( ON ?auto_376893 ?auto_376892 ) ( ON ?auto_376894 ?auto_376893 ) ( ON ?auto_376895 ?auto_376894 ) ( ON ?auto_376896 ?auto_376895 ) ( ON ?auto_376897 ?auto_376896 ) ( ON ?auto_376898 ?auto_376897 ) ( not ( = ?auto_376892 ?auto_376893 ) ) ( not ( = ?auto_376892 ?auto_376894 ) ) ( not ( = ?auto_376892 ?auto_376895 ) ) ( not ( = ?auto_376892 ?auto_376896 ) ) ( not ( = ?auto_376892 ?auto_376897 ) ) ( not ( = ?auto_376892 ?auto_376898 ) ) ( not ( = ?auto_376892 ?auto_376899 ) ) ( not ( = ?auto_376892 ?auto_376900 ) ) ( not ( = ?auto_376893 ?auto_376894 ) ) ( not ( = ?auto_376893 ?auto_376895 ) ) ( not ( = ?auto_376893 ?auto_376896 ) ) ( not ( = ?auto_376893 ?auto_376897 ) ) ( not ( = ?auto_376893 ?auto_376898 ) ) ( not ( = ?auto_376893 ?auto_376899 ) ) ( not ( = ?auto_376893 ?auto_376900 ) ) ( not ( = ?auto_376894 ?auto_376895 ) ) ( not ( = ?auto_376894 ?auto_376896 ) ) ( not ( = ?auto_376894 ?auto_376897 ) ) ( not ( = ?auto_376894 ?auto_376898 ) ) ( not ( = ?auto_376894 ?auto_376899 ) ) ( not ( = ?auto_376894 ?auto_376900 ) ) ( not ( = ?auto_376895 ?auto_376896 ) ) ( not ( = ?auto_376895 ?auto_376897 ) ) ( not ( = ?auto_376895 ?auto_376898 ) ) ( not ( = ?auto_376895 ?auto_376899 ) ) ( not ( = ?auto_376895 ?auto_376900 ) ) ( not ( = ?auto_376896 ?auto_376897 ) ) ( not ( = ?auto_376896 ?auto_376898 ) ) ( not ( = ?auto_376896 ?auto_376899 ) ) ( not ( = ?auto_376896 ?auto_376900 ) ) ( not ( = ?auto_376897 ?auto_376898 ) ) ( not ( = ?auto_376897 ?auto_376899 ) ) ( not ( = ?auto_376897 ?auto_376900 ) ) ( not ( = ?auto_376898 ?auto_376899 ) ) ( not ( = ?auto_376898 ?auto_376900 ) ) ( not ( = ?auto_376899 ?auto_376900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376899 ?auto_376900 )
      ( !STACK ?auto_376899 ?auto_376898 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_376909 - BLOCK
      ?auto_376910 - BLOCK
      ?auto_376911 - BLOCK
      ?auto_376912 - BLOCK
      ?auto_376913 - BLOCK
      ?auto_376914 - BLOCK
      ?auto_376915 - BLOCK
      ?auto_376916 - BLOCK
    )
    :vars
    (
      ?auto_376917 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_376915 ) ( ON ?auto_376916 ?auto_376917 ) ( CLEAR ?auto_376916 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_376909 ) ( ON ?auto_376910 ?auto_376909 ) ( ON ?auto_376911 ?auto_376910 ) ( ON ?auto_376912 ?auto_376911 ) ( ON ?auto_376913 ?auto_376912 ) ( ON ?auto_376914 ?auto_376913 ) ( ON ?auto_376915 ?auto_376914 ) ( not ( = ?auto_376909 ?auto_376910 ) ) ( not ( = ?auto_376909 ?auto_376911 ) ) ( not ( = ?auto_376909 ?auto_376912 ) ) ( not ( = ?auto_376909 ?auto_376913 ) ) ( not ( = ?auto_376909 ?auto_376914 ) ) ( not ( = ?auto_376909 ?auto_376915 ) ) ( not ( = ?auto_376909 ?auto_376916 ) ) ( not ( = ?auto_376909 ?auto_376917 ) ) ( not ( = ?auto_376910 ?auto_376911 ) ) ( not ( = ?auto_376910 ?auto_376912 ) ) ( not ( = ?auto_376910 ?auto_376913 ) ) ( not ( = ?auto_376910 ?auto_376914 ) ) ( not ( = ?auto_376910 ?auto_376915 ) ) ( not ( = ?auto_376910 ?auto_376916 ) ) ( not ( = ?auto_376910 ?auto_376917 ) ) ( not ( = ?auto_376911 ?auto_376912 ) ) ( not ( = ?auto_376911 ?auto_376913 ) ) ( not ( = ?auto_376911 ?auto_376914 ) ) ( not ( = ?auto_376911 ?auto_376915 ) ) ( not ( = ?auto_376911 ?auto_376916 ) ) ( not ( = ?auto_376911 ?auto_376917 ) ) ( not ( = ?auto_376912 ?auto_376913 ) ) ( not ( = ?auto_376912 ?auto_376914 ) ) ( not ( = ?auto_376912 ?auto_376915 ) ) ( not ( = ?auto_376912 ?auto_376916 ) ) ( not ( = ?auto_376912 ?auto_376917 ) ) ( not ( = ?auto_376913 ?auto_376914 ) ) ( not ( = ?auto_376913 ?auto_376915 ) ) ( not ( = ?auto_376913 ?auto_376916 ) ) ( not ( = ?auto_376913 ?auto_376917 ) ) ( not ( = ?auto_376914 ?auto_376915 ) ) ( not ( = ?auto_376914 ?auto_376916 ) ) ( not ( = ?auto_376914 ?auto_376917 ) ) ( not ( = ?auto_376915 ?auto_376916 ) ) ( not ( = ?auto_376915 ?auto_376917 ) ) ( not ( = ?auto_376916 ?auto_376917 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_376916 ?auto_376917 )
      ( !STACK ?auto_376916 ?auto_376915 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_376926 - BLOCK
      ?auto_376927 - BLOCK
      ?auto_376928 - BLOCK
      ?auto_376929 - BLOCK
      ?auto_376930 - BLOCK
      ?auto_376931 - BLOCK
      ?auto_376932 - BLOCK
      ?auto_376933 - BLOCK
    )
    :vars
    (
      ?auto_376934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376933 ?auto_376934 ) ( ON-TABLE ?auto_376926 ) ( ON ?auto_376927 ?auto_376926 ) ( ON ?auto_376928 ?auto_376927 ) ( ON ?auto_376929 ?auto_376928 ) ( ON ?auto_376930 ?auto_376929 ) ( ON ?auto_376931 ?auto_376930 ) ( not ( = ?auto_376926 ?auto_376927 ) ) ( not ( = ?auto_376926 ?auto_376928 ) ) ( not ( = ?auto_376926 ?auto_376929 ) ) ( not ( = ?auto_376926 ?auto_376930 ) ) ( not ( = ?auto_376926 ?auto_376931 ) ) ( not ( = ?auto_376926 ?auto_376932 ) ) ( not ( = ?auto_376926 ?auto_376933 ) ) ( not ( = ?auto_376926 ?auto_376934 ) ) ( not ( = ?auto_376927 ?auto_376928 ) ) ( not ( = ?auto_376927 ?auto_376929 ) ) ( not ( = ?auto_376927 ?auto_376930 ) ) ( not ( = ?auto_376927 ?auto_376931 ) ) ( not ( = ?auto_376927 ?auto_376932 ) ) ( not ( = ?auto_376927 ?auto_376933 ) ) ( not ( = ?auto_376927 ?auto_376934 ) ) ( not ( = ?auto_376928 ?auto_376929 ) ) ( not ( = ?auto_376928 ?auto_376930 ) ) ( not ( = ?auto_376928 ?auto_376931 ) ) ( not ( = ?auto_376928 ?auto_376932 ) ) ( not ( = ?auto_376928 ?auto_376933 ) ) ( not ( = ?auto_376928 ?auto_376934 ) ) ( not ( = ?auto_376929 ?auto_376930 ) ) ( not ( = ?auto_376929 ?auto_376931 ) ) ( not ( = ?auto_376929 ?auto_376932 ) ) ( not ( = ?auto_376929 ?auto_376933 ) ) ( not ( = ?auto_376929 ?auto_376934 ) ) ( not ( = ?auto_376930 ?auto_376931 ) ) ( not ( = ?auto_376930 ?auto_376932 ) ) ( not ( = ?auto_376930 ?auto_376933 ) ) ( not ( = ?auto_376930 ?auto_376934 ) ) ( not ( = ?auto_376931 ?auto_376932 ) ) ( not ( = ?auto_376931 ?auto_376933 ) ) ( not ( = ?auto_376931 ?auto_376934 ) ) ( not ( = ?auto_376932 ?auto_376933 ) ) ( not ( = ?auto_376932 ?auto_376934 ) ) ( not ( = ?auto_376933 ?auto_376934 ) ) ( CLEAR ?auto_376931 ) ( ON ?auto_376932 ?auto_376933 ) ( CLEAR ?auto_376932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_376926 ?auto_376927 ?auto_376928 ?auto_376929 ?auto_376930 ?auto_376931 ?auto_376932 )
      ( MAKE-8PILE ?auto_376926 ?auto_376927 ?auto_376928 ?auto_376929 ?auto_376930 ?auto_376931 ?auto_376932 ?auto_376933 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_376943 - BLOCK
      ?auto_376944 - BLOCK
      ?auto_376945 - BLOCK
      ?auto_376946 - BLOCK
      ?auto_376947 - BLOCK
      ?auto_376948 - BLOCK
      ?auto_376949 - BLOCK
      ?auto_376950 - BLOCK
    )
    :vars
    (
      ?auto_376951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376950 ?auto_376951 ) ( ON-TABLE ?auto_376943 ) ( ON ?auto_376944 ?auto_376943 ) ( ON ?auto_376945 ?auto_376944 ) ( ON ?auto_376946 ?auto_376945 ) ( ON ?auto_376947 ?auto_376946 ) ( ON ?auto_376948 ?auto_376947 ) ( not ( = ?auto_376943 ?auto_376944 ) ) ( not ( = ?auto_376943 ?auto_376945 ) ) ( not ( = ?auto_376943 ?auto_376946 ) ) ( not ( = ?auto_376943 ?auto_376947 ) ) ( not ( = ?auto_376943 ?auto_376948 ) ) ( not ( = ?auto_376943 ?auto_376949 ) ) ( not ( = ?auto_376943 ?auto_376950 ) ) ( not ( = ?auto_376943 ?auto_376951 ) ) ( not ( = ?auto_376944 ?auto_376945 ) ) ( not ( = ?auto_376944 ?auto_376946 ) ) ( not ( = ?auto_376944 ?auto_376947 ) ) ( not ( = ?auto_376944 ?auto_376948 ) ) ( not ( = ?auto_376944 ?auto_376949 ) ) ( not ( = ?auto_376944 ?auto_376950 ) ) ( not ( = ?auto_376944 ?auto_376951 ) ) ( not ( = ?auto_376945 ?auto_376946 ) ) ( not ( = ?auto_376945 ?auto_376947 ) ) ( not ( = ?auto_376945 ?auto_376948 ) ) ( not ( = ?auto_376945 ?auto_376949 ) ) ( not ( = ?auto_376945 ?auto_376950 ) ) ( not ( = ?auto_376945 ?auto_376951 ) ) ( not ( = ?auto_376946 ?auto_376947 ) ) ( not ( = ?auto_376946 ?auto_376948 ) ) ( not ( = ?auto_376946 ?auto_376949 ) ) ( not ( = ?auto_376946 ?auto_376950 ) ) ( not ( = ?auto_376946 ?auto_376951 ) ) ( not ( = ?auto_376947 ?auto_376948 ) ) ( not ( = ?auto_376947 ?auto_376949 ) ) ( not ( = ?auto_376947 ?auto_376950 ) ) ( not ( = ?auto_376947 ?auto_376951 ) ) ( not ( = ?auto_376948 ?auto_376949 ) ) ( not ( = ?auto_376948 ?auto_376950 ) ) ( not ( = ?auto_376948 ?auto_376951 ) ) ( not ( = ?auto_376949 ?auto_376950 ) ) ( not ( = ?auto_376949 ?auto_376951 ) ) ( not ( = ?auto_376950 ?auto_376951 ) ) ( CLEAR ?auto_376948 ) ( ON ?auto_376949 ?auto_376950 ) ( CLEAR ?auto_376949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_376943 ?auto_376944 ?auto_376945 ?auto_376946 ?auto_376947 ?auto_376948 ?auto_376949 )
      ( MAKE-8PILE ?auto_376943 ?auto_376944 ?auto_376945 ?auto_376946 ?auto_376947 ?auto_376948 ?auto_376949 ?auto_376950 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_376960 - BLOCK
      ?auto_376961 - BLOCK
      ?auto_376962 - BLOCK
      ?auto_376963 - BLOCK
      ?auto_376964 - BLOCK
      ?auto_376965 - BLOCK
      ?auto_376966 - BLOCK
      ?auto_376967 - BLOCK
    )
    :vars
    (
      ?auto_376968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376967 ?auto_376968 ) ( ON-TABLE ?auto_376960 ) ( ON ?auto_376961 ?auto_376960 ) ( ON ?auto_376962 ?auto_376961 ) ( ON ?auto_376963 ?auto_376962 ) ( ON ?auto_376964 ?auto_376963 ) ( not ( = ?auto_376960 ?auto_376961 ) ) ( not ( = ?auto_376960 ?auto_376962 ) ) ( not ( = ?auto_376960 ?auto_376963 ) ) ( not ( = ?auto_376960 ?auto_376964 ) ) ( not ( = ?auto_376960 ?auto_376965 ) ) ( not ( = ?auto_376960 ?auto_376966 ) ) ( not ( = ?auto_376960 ?auto_376967 ) ) ( not ( = ?auto_376960 ?auto_376968 ) ) ( not ( = ?auto_376961 ?auto_376962 ) ) ( not ( = ?auto_376961 ?auto_376963 ) ) ( not ( = ?auto_376961 ?auto_376964 ) ) ( not ( = ?auto_376961 ?auto_376965 ) ) ( not ( = ?auto_376961 ?auto_376966 ) ) ( not ( = ?auto_376961 ?auto_376967 ) ) ( not ( = ?auto_376961 ?auto_376968 ) ) ( not ( = ?auto_376962 ?auto_376963 ) ) ( not ( = ?auto_376962 ?auto_376964 ) ) ( not ( = ?auto_376962 ?auto_376965 ) ) ( not ( = ?auto_376962 ?auto_376966 ) ) ( not ( = ?auto_376962 ?auto_376967 ) ) ( not ( = ?auto_376962 ?auto_376968 ) ) ( not ( = ?auto_376963 ?auto_376964 ) ) ( not ( = ?auto_376963 ?auto_376965 ) ) ( not ( = ?auto_376963 ?auto_376966 ) ) ( not ( = ?auto_376963 ?auto_376967 ) ) ( not ( = ?auto_376963 ?auto_376968 ) ) ( not ( = ?auto_376964 ?auto_376965 ) ) ( not ( = ?auto_376964 ?auto_376966 ) ) ( not ( = ?auto_376964 ?auto_376967 ) ) ( not ( = ?auto_376964 ?auto_376968 ) ) ( not ( = ?auto_376965 ?auto_376966 ) ) ( not ( = ?auto_376965 ?auto_376967 ) ) ( not ( = ?auto_376965 ?auto_376968 ) ) ( not ( = ?auto_376966 ?auto_376967 ) ) ( not ( = ?auto_376966 ?auto_376968 ) ) ( not ( = ?auto_376967 ?auto_376968 ) ) ( ON ?auto_376966 ?auto_376967 ) ( CLEAR ?auto_376964 ) ( ON ?auto_376965 ?auto_376966 ) ( CLEAR ?auto_376965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_376960 ?auto_376961 ?auto_376962 ?auto_376963 ?auto_376964 ?auto_376965 )
      ( MAKE-8PILE ?auto_376960 ?auto_376961 ?auto_376962 ?auto_376963 ?auto_376964 ?auto_376965 ?auto_376966 ?auto_376967 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_376977 - BLOCK
      ?auto_376978 - BLOCK
      ?auto_376979 - BLOCK
      ?auto_376980 - BLOCK
      ?auto_376981 - BLOCK
      ?auto_376982 - BLOCK
      ?auto_376983 - BLOCK
      ?auto_376984 - BLOCK
    )
    :vars
    (
      ?auto_376985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376984 ?auto_376985 ) ( ON-TABLE ?auto_376977 ) ( ON ?auto_376978 ?auto_376977 ) ( ON ?auto_376979 ?auto_376978 ) ( ON ?auto_376980 ?auto_376979 ) ( ON ?auto_376981 ?auto_376980 ) ( not ( = ?auto_376977 ?auto_376978 ) ) ( not ( = ?auto_376977 ?auto_376979 ) ) ( not ( = ?auto_376977 ?auto_376980 ) ) ( not ( = ?auto_376977 ?auto_376981 ) ) ( not ( = ?auto_376977 ?auto_376982 ) ) ( not ( = ?auto_376977 ?auto_376983 ) ) ( not ( = ?auto_376977 ?auto_376984 ) ) ( not ( = ?auto_376977 ?auto_376985 ) ) ( not ( = ?auto_376978 ?auto_376979 ) ) ( not ( = ?auto_376978 ?auto_376980 ) ) ( not ( = ?auto_376978 ?auto_376981 ) ) ( not ( = ?auto_376978 ?auto_376982 ) ) ( not ( = ?auto_376978 ?auto_376983 ) ) ( not ( = ?auto_376978 ?auto_376984 ) ) ( not ( = ?auto_376978 ?auto_376985 ) ) ( not ( = ?auto_376979 ?auto_376980 ) ) ( not ( = ?auto_376979 ?auto_376981 ) ) ( not ( = ?auto_376979 ?auto_376982 ) ) ( not ( = ?auto_376979 ?auto_376983 ) ) ( not ( = ?auto_376979 ?auto_376984 ) ) ( not ( = ?auto_376979 ?auto_376985 ) ) ( not ( = ?auto_376980 ?auto_376981 ) ) ( not ( = ?auto_376980 ?auto_376982 ) ) ( not ( = ?auto_376980 ?auto_376983 ) ) ( not ( = ?auto_376980 ?auto_376984 ) ) ( not ( = ?auto_376980 ?auto_376985 ) ) ( not ( = ?auto_376981 ?auto_376982 ) ) ( not ( = ?auto_376981 ?auto_376983 ) ) ( not ( = ?auto_376981 ?auto_376984 ) ) ( not ( = ?auto_376981 ?auto_376985 ) ) ( not ( = ?auto_376982 ?auto_376983 ) ) ( not ( = ?auto_376982 ?auto_376984 ) ) ( not ( = ?auto_376982 ?auto_376985 ) ) ( not ( = ?auto_376983 ?auto_376984 ) ) ( not ( = ?auto_376983 ?auto_376985 ) ) ( not ( = ?auto_376984 ?auto_376985 ) ) ( ON ?auto_376983 ?auto_376984 ) ( CLEAR ?auto_376981 ) ( ON ?auto_376982 ?auto_376983 ) ( CLEAR ?auto_376982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_376977 ?auto_376978 ?auto_376979 ?auto_376980 ?auto_376981 ?auto_376982 )
      ( MAKE-8PILE ?auto_376977 ?auto_376978 ?auto_376979 ?auto_376980 ?auto_376981 ?auto_376982 ?auto_376983 ?auto_376984 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_376994 - BLOCK
      ?auto_376995 - BLOCK
      ?auto_376996 - BLOCK
      ?auto_376997 - BLOCK
      ?auto_376998 - BLOCK
      ?auto_376999 - BLOCK
      ?auto_377000 - BLOCK
      ?auto_377001 - BLOCK
    )
    :vars
    (
      ?auto_377002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377001 ?auto_377002 ) ( ON-TABLE ?auto_376994 ) ( ON ?auto_376995 ?auto_376994 ) ( ON ?auto_376996 ?auto_376995 ) ( ON ?auto_376997 ?auto_376996 ) ( not ( = ?auto_376994 ?auto_376995 ) ) ( not ( = ?auto_376994 ?auto_376996 ) ) ( not ( = ?auto_376994 ?auto_376997 ) ) ( not ( = ?auto_376994 ?auto_376998 ) ) ( not ( = ?auto_376994 ?auto_376999 ) ) ( not ( = ?auto_376994 ?auto_377000 ) ) ( not ( = ?auto_376994 ?auto_377001 ) ) ( not ( = ?auto_376994 ?auto_377002 ) ) ( not ( = ?auto_376995 ?auto_376996 ) ) ( not ( = ?auto_376995 ?auto_376997 ) ) ( not ( = ?auto_376995 ?auto_376998 ) ) ( not ( = ?auto_376995 ?auto_376999 ) ) ( not ( = ?auto_376995 ?auto_377000 ) ) ( not ( = ?auto_376995 ?auto_377001 ) ) ( not ( = ?auto_376995 ?auto_377002 ) ) ( not ( = ?auto_376996 ?auto_376997 ) ) ( not ( = ?auto_376996 ?auto_376998 ) ) ( not ( = ?auto_376996 ?auto_376999 ) ) ( not ( = ?auto_376996 ?auto_377000 ) ) ( not ( = ?auto_376996 ?auto_377001 ) ) ( not ( = ?auto_376996 ?auto_377002 ) ) ( not ( = ?auto_376997 ?auto_376998 ) ) ( not ( = ?auto_376997 ?auto_376999 ) ) ( not ( = ?auto_376997 ?auto_377000 ) ) ( not ( = ?auto_376997 ?auto_377001 ) ) ( not ( = ?auto_376997 ?auto_377002 ) ) ( not ( = ?auto_376998 ?auto_376999 ) ) ( not ( = ?auto_376998 ?auto_377000 ) ) ( not ( = ?auto_376998 ?auto_377001 ) ) ( not ( = ?auto_376998 ?auto_377002 ) ) ( not ( = ?auto_376999 ?auto_377000 ) ) ( not ( = ?auto_376999 ?auto_377001 ) ) ( not ( = ?auto_376999 ?auto_377002 ) ) ( not ( = ?auto_377000 ?auto_377001 ) ) ( not ( = ?auto_377000 ?auto_377002 ) ) ( not ( = ?auto_377001 ?auto_377002 ) ) ( ON ?auto_377000 ?auto_377001 ) ( ON ?auto_376999 ?auto_377000 ) ( CLEAR ?auto_376997 ) ( ON ?auto_376998 ?auto_376999 ) ( CLEAR ?auto_376998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_376994 ?auto_376995 ?auto_376996 ?auto_376997 ?auto_376998 )
      ( MAKE-8PILE ?auto_376994 ?auto_376995 ?auto_376996 ?auto_376997 ?auto_376998 ?auto_376999 ?auto_377000 ?auto_377001 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_377011 - BLOCK
      ?auto_377012 - BLOCK
      ?auto_377013 - BLOCK
      ?auto_377014 - BLOCK
      ?auto_377015 - BLOCK
      ?auto_377016 - BLOCK
      ?auto_377017 - BLOCK
      ?auto_377018 - BLOCK
    )
    :vars
    (
      ?auto_377019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377018 ?auto_377019 ) ( ON-TABLE ?auto_377011 ) ( ON ?auto_377012 ?auto_377011 ) ( ON ?auto_377013 ?auto_377012 ) ( ON ?auto_377014 ?auto_377013 ) ( not ( = ?auto_377011 ?auto_377012 ) ) ( not ( = ?auto_377011 ?auto_377013 ) ) ( not ( = ?auto_377011 ?auto_377014 ) ) ( not ( = ?auto_377011 ?auto_377015 ) ) ( not ( = ?auto_377011 ?auto_377016 ) ) ( not ( = ?auto_377011 ?auto_377017 ) ) ( not ( = ?auto_377011 ?auto_377018 ) ) ( not ( = ?auto_377011 ?auto_377019 ) ) ( not ( = ?auto_377012 ?auto_377013 ) ) ( not ( = ?auto_377012 ?auto_377014 ) ) ( not ( = ?auto_377012 ?auto_377015 ) ) ( not ( = ?auto_377012 ?auto_377016 ) ) ( not ( = ?auto_377012 ?auto_377017 ) ) ( not ( = ?auto_377012 ?auto_377018 ) ) ( not ( = ?auto_377012 ?auto_377019 ) ) ( not ( = ?auto_377013 ?auto_377014 ) ) ( not ( = ?auto_377013 ?auto_377015 ) ) ( not ( = ?auto_377013 ?auto_377016 ) ) ( not ( = ?auto_377013 ?auto_377017 ) ) ( not ( = ?auto_377013 ?auto_377018 ) ) ( not ( = ?auto_377013 ?auto_377019 ) ) ( not ( = ?auto_377014 ?auto_377015 ) ) ( not ( = ?auto_377014 ?auto_377016 ) ) ( not ( = ?auto_377014 ?auto_377017 ) ) ( not ( = ?auto_377014 ?auto_377018 ) ) ( not ( = ?auto_377014 ?auto_377019 ) ) ( not ( = ?auto_377015 ?auto_377016 ) ) ( not ( = ?auto_377015 ?auto_377017 ) ) ( not ( = ?auto_377015 ?auto_377018 ) ) ( not ( = ?auto_377015 ?auto_377019 ) ) ( not ( = ?auto_377016 ?auto_377017 ) ) ( not ( = ?auto_377016 ?auto_377018 ) ) ( not ( = ?auto_377016 ?auto_377019 ) ) ( not ( = ?auto_377017 ?auto_377018 ) ) ( not ( = ?auto_377017 ?auto_377019 ) ) ( not ( = ?auto_377018 ?auto_377019 ) ) ( ON ?auto_377017 ?auto_377018 ) ( ON ?auto_377016 ?auto_377017 ) ( CLEAR ?auto_377014 ) ( ON ?auto_377015 ?auto_377016 ) ( CLEAR ?auto_377015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_377011 ?auto_377012 ?auto_377013 ?auto_377014 ?auto_377015 )
      ( MAKE-8PILE ?auto_377011 ?auto_377012 ?auto_377013 ?auto_377014 ?auto_377015 ?auto_377016 ?auto_377017 ?auto_377018 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_377028 - BLOCK
      ?auto_377029 - BLOCK
      ?auto_377030 - BLOCK
      ?auto_377031 - BLOCK
      ?auto_377032 - BLOCK
      ?auto_377033 - BLOCK
      ?auto_377034 - BLOCK
      ?auto_377035 - BLOCK
    )
    :vars
    (
      ?auto_377036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377035 ?auto_377036 ) ( ON-TABLE ?auto_377028 ) ( ON ?auto_377029 ?auto_377028 ) ( ON ?auto_377030 ?auto_377029 ) ( not ( = ?auto_377028 ?auto_377029 ) ) ( not ( = ?auto_377028 ?auto_377030 ) ) ( not ( = ?auto_377028 ?auto_377031 ) ) ( not ( = ?auto_377028 ?auto_377032 ) ) ( not ( = ?auto_377028 ?auto_377033 ) ) ( not ( = ?auto_377028 ?auto_377034 ) ) ( not ( = ?auto_377028 ?auto_377035 ) ) ( not ( = ?auto_377028 ?auto_377036 ) ) ( not ( = ?auto_377029 ?auto_377030 ) ) ( not ( = ?auto_377029 ?auto_377031 ) ) ( not ( = ?auto_377029 ?auto_377032 ) ) ( not ( = ?auto_377029 ?auto_377033 ) ) ( not ( = ?auto_377029 ?auto_377034 ) ) ( not ( = ?auto_377029 ?auto_377035 ) ) ( not ( = ?auto_377029 ?auto_377036 ) ) ( not ( = ?auto_377030 ?auto_377031 ) ) ( not ( = ?auto_377030 ?auto_377032 ) ) ( not ( = ?auto_377030 ?auto_377033 ) ) ( not ( = ?auto_377030 ?auto_377034 ) ) ( not ( = ?auto_377030 ?auto_377035 ) ) ( not ( = ?auto_377030 ?auto_377036 ) ) ( not ( = ?auto_377031 ?auto_377032 ) ) ( not ( = ?auto_377031 ?auto_377033 ) ) ( not ( = ?auto_377031 ?auto_377034 ) ) ( not ( = ?auto_377031 ?auto_377035 ) ) ( not ( = ?auto_377031 ?auto_377036 ) ) ( not ( = ?auto_377032 ?auto_377033 ) ) ( not ( = ?auto_377032 ?auto_377034 ) ) ( not ( = ?auto_377032 ?auto_377035 ) ) ( not ( = ?auto_377032 ?auto_377036 ) ) ( not ( = ?auto_377033 ?auto_377034 ) ) ( not ( = ?auto_377033 ?auto_377035 ) ) ( not ( = ?auto_377033 ?auto_377036 ) ) ( not ( = ?auto_377034 ?auto_377035 ) ) ( not ( = ?auto_377034 ?auto_377036 ) ) ( not ( = ?auto_377035 ?auto_377036 ) ) ( ON ?auto_377034 ?auto_377035 ) ( ON ?auto_377033 ?auto_377034 ) ( ON ?auto_377032 ?auto_377033 ) ( CLEAR ?auto_377030 ) ( ON ?auto_377031 ?auto_377032 ) ( CLEAR ?auto_377031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_377028 ?auto_377029 ?auto_377030 ?auto_377031 )
      ( MAKE-8PILE ?auto_377028 ?auto_377029 ?auto_377030 ?auto_377031 ?auto_377032 ?auto_377033 ?auto_377034 ?auto_377035 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_377045 - BLOCK
      ?auto_377046 - BLOCK
      ?auto_377047 - BLOCK
      ?auto_377048 - BLOCK
      ?auto_377049 - BLOCK
      ?auto_377050 - BLOCK
      ?auto_377051 - BLOCK
      ?auto_377052 - BLOCK
    )
    :vars
    (
      ?auto_377053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377052 ?auto_377053 ) ( ON-TABLE ?auto_377045 ) ( ON ?auto_377046 ?auto_377045 ) ( ON ?auto_377047 ?auto_377046 ) ( not ( = ?auto_377045 ?auto_377046 ) ) ( not ( = ?auto_377045 ?auto_377047 ) ) ( not ( = ?auto_377045 ?auto_377048 ) ) ( not ( = ?auto_377045 ?auto_377049 ) ) ( not ( = ?auto_377045 ?auto_377050 ) ) ( not ( = ?auto_377045 ?auto_377051 ) ) ( not ( = ?auto_377045 ?auto_377052 ) ) ( not ( = ?auto_377045 ?auto_377053 ) ) ( not ( = ?auto_377046 ?auto_377047 ) ) ( not ( = ?auto_377046 ?auto_377048 ) ) ( not ( = ?auto_377046 ?auto_377049 ) ) ( not ( = ?auto_377046 ?auto_377050 ) ) ( not ( = ?auto_377046 ?auto_377051 ) ) ( not ( = ?auto_377046 ?auto_377052 ) ) ( not ( = ?auto_377046 ?auto_377053 ) ) ( not ( = ?auto_377047 ?auto_377048 ) ) ( not ( = ?auto_377047 ?auto_377049 ) ) ( not ( = ?auto_377047 ?auto_377050 ) ) ( not ( = ?auto_377047 ?auto_377051 ) ) ( not ( = ?auto_377047 ?auto_377052 ) ) ( not ( = ?auto_377047 ?auto_377053 ) ) ( not ( = ?auto_377048 ?auto_377049 ) ) ( not ( = ?auto_377048 ?auto_377050 ) ) ( not ( = ?auto_377048 ?auto_377051 ) ) ( not ( = ?auto_377048 ?auto_377052 ) ) ( not ( = ?auto_377048 ?auto_377053 ) ) ( not ( = ?auto_377049 ?auto_377050 ) ) ( not ( = ?auto_377049 ?auto_377051 ) ) ( not ( = ?auto_377049 ?auto_377052 ) ) ( not ( = ?auto_377049 ?auto_377053 ) ) ( not ( = ?auto_377050 ?auto_377051 ) ) ( not ( = ?auto_377050 ?auto_377052 ) ) ( not ( = ?auto_377050 ?auto_377053 ) ) ( not ( = ?auto_377051 ?auto_377052 ) ) ( not ( = ?auto_377051 ?auto_377053 ) ) ( not ( = ?auto_377052 ?auto_377053 ) ) ( ON ?auto_377051 ?auto_377052 ) ( ON ?auto_377050 ?auto_377051 ) ( ON ?auto_377049 ?auto_377050 ) ( CLEAR ?auto_377047 ) ( ON ?auto_377048 ?auto_377049 ) ( CLEAR ?auto_377048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_377045 ?auto_377046 ?auto_377047 ?auto_377048 )
      ( MAKE-8PILE ?auto_377045 ?auto_377046 ?auto_377047 ?auto_377048 ?auto_377049 ?auto_377050 ?auto_377051 ?auto_377052 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_377062 - BLOCK
      ?auto_377063 - BLOCK
      ?auto_377064 - BLOCK
      ?auto_377065 - BLOCK
      ?auto_377066 - BLOCK
      ?auto_377067 - BLOCK
      ?auto_377068 - BLOCK
      ?auto_377069 - BLOCK
    )
    :vars
    (
      ?auto_377070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377069 ?auto_377070 ) ( ON-TABLE ?auto_377062 ) ( ON ?auto_377063 ?auto_377062 ) ( not ( = ?auto_377062 ?auto_377063 ) ) ( not ( = ?auto_377062 ?auto_377064 ) ) ( not ( = ?auto_377062 ?auto_377065 ) ) ( not ( = ?auto_377062 ?auto_377066 ) ) ( not ( = ?auto_377062 ?auto_377067 ) ) ( not ( = ?auto_377062 ?auto_377068 ) ) ( not ( = ?auto_377062 ?auto_377069 ) ) ( not ( = ?auto_377062 ?auto_377070 ) ) ( not ( = ?auto_377063 ?auto_377064 ) ) ( not ( = ?auto_377063 ?auto_377065 ) ) ( not ( = ?auto_377063 ?auto_377066 ) ) ( not ( = ?auto_377063 ?auto_377067 ) ) ( not ( = ?auto_377063 ?auto_377068 ) ) ( not ( = ?auto_377063 ?auto_377069 ) ) ( not ( = ?auto_377063 ?auto_377070 ) ) ( not ( = ?auto_377064 ?auto_377065 ) ) ( not ( = ?auto_377064 ?auto_377066 ) ) ( not ( = ?auto_377064 ?auto_377067 ) ) ( not ( = ?auto_377064 ?auto_377068 ) ) ( not ( = ?auto_377064 ?auto_377069 ) ) ( not ( = ?auto_377064 ?auto_377070 ) ) ( not ( = ?auto_377065 ?auto_377066 ) ) ( not ( = ?auto_377065 ?auto_377067 ) ) ( not ( = ?auto_377065 ?auto_377068 ) ) ( not ( = ?auto_377065 ?auto_377069 ) ) ( not ( = ?auto_377065 ?auto_377070 ) ) ( not ( = ?auto_377066 ?auto_377067 ) ) ( not ( = ?auto_377066 ?auto_377068 ) ) ( not ( = ?auto_377066 ?auto_377069 ) ) ( not ( = ?auto_377066 ?auto_377070 ) ) ( not ( = ?auto_377067 ?auto_377068 ) ) ( not ( = ?auto_377067 ?auto_377069 ) ) ( not ( = ?auto_377067 ?auto_377070 ) ) ( not ( = ?auto_377068 ?auto_377069 ) ) ( not ( = ?auto_377068 ?auto_377070 ) ) ( not ( = ?auto_377069 ?auto_377070 ) ) ( ON ?auto_377068 ?auto_377069 ) ( ON ?auto_377067 ?auto_377068 ) ( ON ?auto_377066 ?auto_377067 ) ( ON ?auto_377065 ?auto_377066 ) ( CLEAR ?auto_377063 ) ( ON ?auto_377064 ?auto_377065 ) ( CLEAR ?auto_377064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_377062 ?auto_377063 ?auto_377064 )
      ( MAKE-8PILE ?auto_377062 ?auto_377063 ?auto_377064 ?auto_377065 ?auto_377066 ?auto_377067 ?auto_377068 ?auto_377069 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_377079 - BLOCK
      ?auto_377080 - BLOCK
      ?auto_377081 - BLOCK
      ?auto_377082 - BLOCK
      ?auto_377083 - BLOCK
      ?auto_377084 - BLOCK
      ?auto_377085 - BLOCK
      ?auto_377086 - BLOCK
    )
    :vars
    (
      ?auto_377087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377086 ?auto_377087 ) ( ON-TABLE ?auto_377079 ) ( ON ?auto_377080 ?auto_377079 ) ( not ( = ?auto_377079 ?auto_377080 ) ) ( not ( = ?auto_377079 ?auto_377081 ) ) ( not ( = ?auto_377079 ?auto_377082 ) ) ( not ( = ?auto_377079 ?auto_377083 ) ) ( not ( = ?auto_377079 ?auto_377084 ) ) ( not ( = ?auto_377079 ?auto_377085 ) ) ( not ( = ?auto_377079 ?auto_377086 ) ) ( not ( = ?auto_377079 ?auto_377087 ) ) ( not ( = ?auto_377080 ?auto_377081 ) ) ( not ( = ?auto_377080 ?auto_377082 ) ) ( not ( = ?auto_377080 ?auto_377083 ) ) ( not ( = ?auto_377080 ?auto_377084 ) ) ( not ( = ?auto_377080 ?auto_377085 ) ) ( not ( = ?auto_377080 ?auto_377086 ) ) ( not ( = ?auto_377080 ?auto_377087 ) ) ( not ( = ?auto_377081 ?auto_377082 ) ) ( not ( = ?auto_377081 ?auto_377083 ) ) ( not ( = ?auto_377081 ?auto_377084 ) ) ( not ( = ?auto_377081 ?auto_377085 ) ) ( not ( = ?auto_377081 ?auto_377086 ) ) ( not ( = ?auto_377081 ?auto_377087 ) ) ( not ( = ?auto_377082 ?auto_377083 ) ) ( not ( = ?auto_377082 ?auto_377084 ) ) ( not ( = ?auto_377082 ?auto_377085 ) ) ( not ( = ?auto_377082 ?auto_377086 ) ) ( not ( = ?auto_377082 ?auto_377087 ) ) ( not ( = ?auto_377083 ?auto_377084 ) ) ( not ( = ?auto_377083 ?auto_377085 ) ) ( not ( = ?auto_377083 ?auto_377086 ) ) ( not ( = ?auto_377083 ?auto_377087 ) ) ( not ( = ?auto_377084 ?auto_377085 ) ) ( not ( = ?auto_377084 ?auto_377086 ) ) ( not ( = ?auto_377084 ?auto_377087 ) ) ( not ( = ?auto_377085 ?auto_377086 ) ) ( not ( = ?auto_377085 ?auto_377087 ) ) ( not ( = ?auto_377086 ?auto_377087 ) ) ( ON ?auto_377085 ?auto_377086 ) ( ON ?auto_377084 ?auto_377085 ) ( ON ?auto_377083 ?auto_377084 ) ( ON ?auto_377082 ?auto_377083 ) ( CLEAR ?auto_377080 ) ( ON ?auto_377081 ?auto_377082 ) ( CLEAR ?auto_377081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_377079 ?auto_377080 ?auto_377081 )
      ( MAKE-8PILE ?auto_377079 ?auto_377080 ?auto_377081 ?auto_377082 ?auto_377083 ?auto_377084 ?auto_377085 ?auto_377086 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_377096 - BLOCK
      ?auto_377097 - BLOCK
      ?auto_377098 - BLOCK
      ?auto_377099 - BLOCK
      ?auto_377100 - BLOCK
      ?auto_377101 - BLOCK
      ?auto_377102 - BLOCK
      ?auto_377103 - BLOCK
    )
    :vars
    (
      ?auto_377104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377103 ?auto_377104 ) ( ON-TABLE ?auto_377096 ) ( not ( = ?auto_377096 ?auto_377097 ) ) ( not ( = ?auto_377096 ?auto_377098 ) ) ( not ( = ?auto_377096 ?auto_377099 ) ) ( not ( = ?auto_377096 ?auto_377100 ) ) ( not ( = ?auto_377096 ?auto_377101 ) ) ( not ( = ?auto_377096 ?auto_377102 ) ) ( not ( = ?auto_377096 ?auto_377103 ) ) ( not ( = ?auto_377096 ?auto_377104 ) ) ( not ( = ?auto_377097 ?auto_377098 ) ) ( not ( = ?auto_377097 ?auto_377099 ) ) ( not ( = ?auto_377097 ?auto_377100 ) ) ( not ( = ?auto_377097 ?auto_377101 ) ) ( not ( = ?auto_377097 ?auto_377102 ) ) ( not ( = ?auto_377097 ?auto_377103 ) ) ( not ( = ?auto_377097 ?auto_377104 ) ) ( not ( = ?auto_377098 ?auto_377099 ) ) ( not ( = ?auto_377098 ?auto_377100 ) ) ( not ( = ?auto_377098 ?auto_377101 ) ) ( not ( = ?auto_377098 ?auto_377102 ) ) ( not ( = ?auto_377098 ?auto_377103 ) ) ( not ( = ?auto_377098 ?auto_377104 ) ) ( not ( = ?auto_377099 ?auto_377100 ) ) ( not ( = ?auto_377099 ?auto_377101 ) ) ( not ( = ?auto_377099 ?auto_377102 ) ) ( not ( = ?auto_377099 ?auto_377103 ) ) ( not ( = ?auto_377099 ?auto_377104 ) ) ( not ( = ?auto_377100 ?auto_377101 ) ) ( not ( = ?auto_377100 ?auto_377102 ) ) ( not ( = ?auto_377100 ?auto_377103 ) ) ( not ( = ?auto_377100 ?auto_377104 ) ) ( not ( = ?auto_377101 ?auto_377102 ) ) ( not ( = ?auto_377101 ?auto_377103 ) ) ( not ( = ?auto_377101 ?auto_377104 ) ) ( not ( = ?auto_377102 ?auto_377103 ) ) ( not ( = ?auto_377102 ?auto_377104 ) ) ( not ( = ?auto_377103 ?auto_377104 ) ) ( ON ?auto_377102 ?auto_377103 ) ( ON ?auto_377101 ?auto_377102 ) ( ON ?auto_377100 ?auto_377101 ) ( ON ?auto_377099 ?auto_377100 ) ( ON ?auto_377098 ?auto_377099 ) ( CLEAR ?auto_377096 ) ( ON ?auto_377097 ?auto_377098 ) ( CLEAR ?auto_377097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_377096 ?auto_377097 )
      ( MAKE-8PILE ?auto_377096 ?auto_377097 ?auto_377098 ?auto_377099 ?auto_377100 ?auto_377101 ?auto_377102 ?auto_377103 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_377113 - BLOCK
      ?auto_377114 - BLOCK
      ?auto_377115 - BLOCK
      ?auto_377116 - BLOCK
      ?auto_377117 - BLOCK
      ?auto_377118 - BLOCK
      ?auto_377119 - BLOCK
      ?auto_377120 - BLOCK
    )
    :vars
    (
      ?auto_377121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377120 ?auto_377121 ) ( ON-TABLE ?auto_377113 ) ( not ( = ?auto_377113 ?auto_377114 ) ) ( not ( = ?auto_377113 ?auto_377115 ) ) ( not ( = ?auto_377113 ?auto_377116 ) ) ( not ( = ?auto_377113 ?auto_377117 ) ) ( not ( = ?auto_377113 ?auto_377118 ) ) ( not ( = ?auto_377113 ?auto_377119 ) ) ( not ( = ?auto_377113 ?auto_377120 ) ) ( not ( = ?auto_377113 ?auto_377121 ) ) ( not ( = ?auto_377114 ?auto_377115 ) ) ( not ( = ?auto_377114 ?auto_377116 ) ) ( not ( = ?auto_377114 ?auto_377117 ) ) ( not ( = ?auto_377114 ?auto_377118 ) ) ( not ( = ?auto_377114 ?auto_377119 ) ) ( not ( = ?auto_377114 ?auto_377120 ) ) ( not ( = ?auto_377114 ?auto_377121 ) ) ( not ( = ?auto_377115 ?auto_377116 ) ) ( not ( = ?auto_377115 ?auto_377117 ) ) ( not ( = ?auto_377115 ?auto_377118 ) ) ( not ( = ?auto_377115 ?auto_377119 ) ) ( not ( = ?auto_377115 ?auto_377120 ) ) ( not ( = ?auto_377115 ?auto_377121 ) ) ( not ( = ?auto_377116 ?auto_377117 ) ) ( not ( = ?auto_377116 ?auto_377118 ) ) ( not ( = ?auto_377116 ?auto_377119 ) ) ( not ( = ?auto_377116 ?auto_377120 ) ) ( not ( = ?auto_377116 ?auto_377121 ) ) ( not ( = ?auto_377117 ?auto_377118 ) ) ( not ( = ?auto_377117 ?auto_377119 ) ) ( not ( = ?auto_377117 ?auto_377120 ) ) ( not ( = ?auto_377117 ?auto_377121 ) ) ( not ( = ?auto_377118 ?auto_377119 ) ) ( not ( = ?auto_377118 ?auto_377120 ) ) ( not ( = ?auto_377118 ?auto_377121 ) ) ( not ( = ?auto_377119 ?auto_377120 ) ) ( not ( = ?auto_377119 ?auto_377121 ) ) ( not ( = ?auto_377120 ?auto_377121 ) ) ( ON ?auto_377119 ?auto_377120 ) ( ON ?auto_377118 ?auto_377119 ) ( ON ?auto_377117 ?auto_377118 ) ( ON ?auto_377116 ?auto_377117 ) ( ON ?auto_377115 ?auto_377116 ) ( CLEAR ?auto_377113 ) ( ON ?auto_377114 ?auto_377115 ) ( CLEAR ?auto_377114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_377113 ?auto_377114 )
      ( MAKE-8PILE ?auto_377113 ?auto_377114 ?auto_377115 ?auto_377116 ?auto_377117 ?auto_377118 ?auto_377119 ?auto_377120 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_377130 - BLOCK
      ?auto_377131 - BLOCK
      ?auto_377132 - BLOCK
      ?auto_377133 - BLOCK
      ?auto_377134 - BLOCK
      ?auto_377135 - BLOCK
      ?auto_377136 - BLOCK
      ?auto_377137 - BLOCK
    )
    :vars
    (
      ?auto_377138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377137 ?auto_377138 ) ( not ( = ?auto_377130 ?auto_377131 ) ) ( not ( = ?auto_377130 ?auto_377132 ) ) ( not ( = ?auto_377130 ?auto_377133 ) ) ( not ( = ?auto_377130 ?auto_377134 ) ) ( not ( = ?auto_377130 ?auto_377135 ) ) ( not ( = ?auto_377130 ?auto_377136 ) ) ( not ( = ?auto_377130 ?auto_377137 ) ) ( not ( = ?auto_377130 ?auto_377138 ) ) ( not ( = ?auto_377131 ?auto_377132 ) ) ( not ( = ?auto_377131 ?auto_377133 ) ) ( not ( = ?auto_377131 ?auto_377134 ) ) ( not ( = ?auto_377131 ?auto_377135 ) ) ( not ( = ?auto_377131 ?auto_377136 ) ) ( not ( = ?auto_377131 ?auto_377137 ) ) ( not ( = ?auto_377131 ?auto_377138 ) ) ( not ( = ?auto_377132 ?auto_377133 ) ) ( not ( = ?auto_377132 ?auto_377134 ) ) ( not ( = ?auto_377132 ?auto_377135 ) ) ( not ( = ?auto_377132 ?auto_377136 ) ) ( not ( = ?auto_377132 ?auto_377137 ) ) ( not ( = ?auto_377132 ?auto_377138 ) ) ( not ( = ?auto_377133 ?auto_377134 ) ) ( not ( = ?auto_377133 ?auto_377135 ) ) ( not ( = ?auto_377133 ?auto_377136 ) ) ( not ( = ?auto_377133 ?auto_377137 ) ) ( not ( = ?auto_377133 ?auto_377138 ) ) ( not ( = ?auto_377134 ?auto_377135 ) ) ( not ( = ?auto_377134 ?auto_377136 ) ) ( not ( = ?auto_377134 ?auto_377137 ) ) ( not ( = ?auto_377134 ?auto_377138 ) ) ( not ( = ?auto_377135 ?auto_377136 ) ) ( not ( = ?auto_377135 ?auto_377137 ) ) ( not ( = ?auto_377135 ?auto_377138 ) ) ( not ( = ?auto_377136 ?auto_377137 ) ) ( not ( = ?auto_377136 ?auto_377138 ) ) ( not ( = ?auto_377137 ?auto_377138 ) ) ( ON ?auto_377136 ?auto_377137 ) ( ON ?auto_377135 ?auto_377136 ) ( ON ?auto_377134 ?auto_377135 ) ( ON ?auto_377133 ?auto_377134 ) ( ON ?auto_377132 ?auto_377133 ) ( ON ?auto_377131 ?auto_377132 ) ( ON ?auto_377130 ?auto_377131 ) ( CLEAR ?auto_377130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_377130 )
      ( MAKE-8PILE ?auto_377130 ?auto_377131 ?auto_377132 ?auto_377133 ?auto_377134 ?auto_377135 ?auto_377136 ?auto_377137 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_377147 - BLOCK
      ?auto_377148 - BLOCK
      ?auto_377149 - BLOCK
      ?auto_377150 - BLOCK
      ?auto_377151 - BLOCK
      ?auto_377152 - BLOCK
      ?auto_377153 - BLOCK
      ?auto_377154 - BLOCK
    )
    :vars
    (
      ?auto_377155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377154 ?auto_377155 ) ( not ( = ?auto_377147 ?auto_377148 ) ) ( not ( = ?auto_377147 ?auto_377149 ) ) ( not ( = ?auto_377147 ?auto_377150 ) ) ( not ( = ?auto_377147 ?auto_377151 ) ) ( not ( = ?auto_377147 ?auto_377152 ) ) ( not ( = ?auto_377147 ?auto_377153 ) ) ( not ( = ?auto_377147 ?auto_377154 ) ) ( not ( = ?auto_377147 ?auto_377155 ) ) ( not ( = ?auto_377148 ?auto_377149 ) ) ( not ( = ?auto_377148 ?auto_377150 ) ) ( not ( = ?auto_377148 ?auto_377151 ) ) ( not ( = ?auto_377148 ?auto_377152 ) ) ( not ( = ?auto_377148 ?auto_377153 ) ) ( not ( = ?auto_377148 ?auto_377154 ) ) ( not ( = ?auto_377148 ?auto_377155 ) ) ( not ( = ?auto_377149 ?auto_377150 ) ) ( not ( = ?auto_377149 ?auto_377151 ) ) ( not ( = ?auto_377149 ?auto_377152 ) ) ( not ( = ?auto_377149 ?auto_377153 ) ) ( not ( = ?auto_377149 ?auto_377154 ) ) ( not ( = ?auto_377149 ?auto_377155 ) ) ( not ( = ?auto_377150 ?auto_377151 ) ) ( not ( = ?auto_377150 ?auto_377152 ) ) ( not ( = ?auto_377150 ?auto_377153 ) ) ( not ( = ?auto_377150 ?auto_377154 ) ) ( not ( = ?auto_377150 ?auto_377155 ) ) ( not ( = ?auto_377151 ?auto_377152 ) ) ( not ( = ?auto_377151 ?auto_377153 ) ) ( not ( = ?auto_377151 ?auto_377154 ) ) ( not ( = ?auto_377151 ?auto_377155 ) ) ( not ( = ?auto_377152 ?auto_377153 ) ) ( not ( = ?auto_377152 ?auto_377154 ) ) ( not ( = ?auto_377152 ?auto_377155 ) ) ( not ( = ?auto_377153 ?auto_377154 ) ) ( not ( = ?auto_377153 ?auto_377155 ) ) ( not ( = ?auto_377154 ?auto_377155 ) ) ( ON ?auto_377153 ?auto_377154 ) ( ON ?auto_377152 ?auto_377153 ) ( ON ?auto_377151 ?auto_377152 ) ( ON ?auto_377150 ?auto_377151 ) ( ON ?auto_377149 ?auto_377150 ) ( ON ?auto_377148 ?auto_377149 ) ( ON ?auto_377147 ?auto_377148 ) ( CLEAR ?auto_377147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_377147 )
      ( MAKE-8PILE ?auto_377147 ?auto_377148 ?auto_377149 ?auto_377150 ?auto_377151 ?auto_377152 ?auto_377153 ?auto_377154 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377165 - BLOCK
      ?auto_377166 - BLOCK
      ?auto_377167 - BLOCK
      ?auto_377168 - BLOCK
      ?auto_377169 - BLOCK
      ?auto_377170 - BLOCK
      ?auto_377171 - BLOCK
      ?auto_377172 - BLOCK
      ?auto_377173 - BLOCK
    )
    :vars
    (
      ?auto_377174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_377172 ) ( ON ?auto_377173 ?auto_377174 ) ( CLEAR ?auto_377173 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_377165 ) ( ON ?auto_377166 ?auto_377165 ) ( ON ?auto_377167 ?auto_377166 ) ( ON ?auto_377168 ?auto_377167 ) ( ON ?auto_377169 ?auto_377168 ) ( ON ?auto_377170 ?auto_377169 ) ( ON ?auto_377171 ?auto_377170 ) ( ON ?auto_377172 ?auto_377171 ) ( not ( = ?auto_377165 ?auto_377166 ) ) ( not ( = ?auto_377165 ?auto_377167 ) ) ( not ( = ?auto_377165 ?auto_377168 ) ) ( not ( = ?auto_377165 ?auto_377169 ) ) ( not ( = ?auto_377165 ?auto_377170 ) ) ( not ( = ?auto_377165 ?auto_377171 ) ) ( not ( = ?auto_377165 ?auto_377172 ) ) ( not ( = ?auto_377165 ?auto_377173 ) ) ( not ( = ?auto_377165 ?auto_377174 ) ) ( not ( = ?auto_377166 ?auto_377167 ) ) ( not ( = ?auto_377166 ?auto_377168 ) ) ( not ( = ?auto_377166 ?auto_377169 ) ) ( not ( = ?auto_377166 ?auto_377170 ) ) ( not ( = ?auto_377166 ?auto_377171 ) ) ( not ( = ?auto_377166 ?auto_377172 ) ) ( not ( = ?auto_377166 ?auto_377173 ) ) ( not ( = ?auto_377166 ?auto_377174 ) ) ( not ( = ?auto_377167 ?auto_377168 ) ) ( not ( = ?auto_377167 ?auto_377169 ) ) ( not ( = ?auto_377167 ?auto_377170 ) ) ( not ( = ?auto_377167 ?auto_377171 ) ) ( not ( = ?auto_377167 ?auto_377172 ) ) ( not ( = ?auto_377167 ?auto_377173 ) ) ( not ( = ?auto_377167 ?auto_377174 ) ) ( not ( = ?auto_377168 ?auto_377169 ) ) ( not ( = ?auto_377168 ?auto_377170 ) ) ( not ( = ?auto_377168 ?auto_377171 ) ) ( not ( = ?auto_377168 ?auto_377172 ) ) ( not ( = ?auto_377168 ?auto_377173 ) ) ( not ( = ?auto_377168 ?auto_377174 ) ) ( not ( = ?auto_377169 ?auto_377170 ) ) ( not ( = ?auto_377169 ?auto_377171 ) ) ( not ( = ?auto_377169 ?auto_377172 ) ) ( not ( = ?auto_377169 ?auto_377173 ) ) ( not ( = ?auto_377169 ?auto_377174 ) ) ( not ( = ?auto_377170 ?auto_377171 ) ) ( not ( = ?auto_377170 ?auto_377172 ) ) ( not ( = ?auto_377170 ?auto_377173 ) ) ( not ( = ?auto_377170 ?auto_377174 ) ) ( not ( = ?auto_377171 ?auto_377172 ) ) ( not ( = ?auto_377171 ?auto_377173 ) ) ( not ( = ?auto_377171 ?auto_377174 ) ) ( not ( = ?auto_377172 ?auto_377173 ) ) ( not ( = ?auto_377172 ?auto_377174 ) ) ( not ( = ?auto_377173 ?auto_377174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_377173 ?auto_377174 )
      ( !STACK ?auto_377173 ?auto_377172 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377184 - BLOCK
      ?auto_377185 - BLOCK
      ?auto_377186 - BLOCK
      ?auto_377187 - BLOCK
      ?auto_377188 - BLOCK
      ?auto_377189 - BLOCK
      ?auto_377190 - BLOCK
      ?auto_377191 - BLOCK
      ?auto_377192 - BLOCK
    )
    :vars
    (
      ?auto_377193 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_377191 ) ( ON ?auto_377192 ?auto_377193 ) ( CLEAR ?auto_377192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_377184 ) ( ON ?auto_377185 ?auto_377184 ) ( ON ?auto_377186 ?auto_377185 ) ( ON ?auto_377187 ?auto_377186 ) ( ON ?auto_377188 ?auto_377187 ) ( ON ?auto_377189 ?auto_377188 ) ( ON ?auto_377190 ?auto_377189 ) ( ON ?auto_377191 ?auto_377190 ) ( not ( = ?auto_377184 ?auto_377185 ) ) ( not ( = ?auto_377184 ?auto_377186 ) ) ( not ( = ?auto_377184 ?auto_377187 ) ) ( not ( = ?auto_377184 ?auto_377188 ) ) ( not ( = ?auto_377184 ?auto_377189 ) ) ( not ( = ?auto_377184 ?auto_377190 ) ) ( not ( = ?auto_377184 ?auto_377191 ) ) ( not ( = ?auto_377184 ?auto_377192 ) ) ( not ( = ?auto_377184 ?auto_377193 ) ) ( not ( = ?auto_377185 ?auto_377186 ) ) ( not ( = ?auto_377185 ?auto_377187 ) ) ( not ( = ?auto_377185 ?auto_377188 ) ) ( not ( = ?auto_377185 ?auto_377189 ) ) ( not ( = ?auto_377185 ?auto_377190 ) ) ( not ( = ?auto_377185 ?auto_377191 ) ) ( not ( = ?auto_377185 ?auto_377192 ) ) ( not ( = ?auto_377185 ?auto_377193 ) ) ( not ( = ?auto_377186 ?auto_377187 ) ) ( not ( = ?auto_377186 ?auto_377188 ) ) ( not ( = ?auto_377186 ?auto_377189 ) ) ( not ( = ?auto_377186 ?auto_377190 ) ) ( not ( = ?auto_377186 ?auto_377191 ) ) ( not ( = ?auto_377186 ?auto_377192 ) ) ( not ( = ?auto_377186 ?auto_377193 ) ) ( not ( = ?auto_377187 ?auto_377188 ) ) ( not ( = ?auto_377187 ?auto_377189 ) ) ( not ( = ?auto_377187 ?auto_377190 ) ) ( not ( = ?auto_377187 ?auto_377191 ) ) ( not ( = ?auto_377187 ?auto_377192 ) ) ( not ( = ?auto_377187 ?auto_377193 ) ) ( not ( = ?auto_377188 ?auto_377189 ) ) ( not ( = ?auto_377188 ?auto_377190 ) ) ( not ( = ?auto_377188 ?auto_377191 ) ) ( not ( = ?auto_377188 ?auto_377192 ) ) ( not ( = ?auto_377188 ?auto_377193 ) ) ( not ( = ?auto_377189 ?auto_377190 ) ) ( not ( = ?auto_377189 ?auto_377191 ) ) ( not ( = ?auto_377189 ?auto_377192 ) ) ( not ( = ?auto_377189 ?auto_377193 ) ) ( not ( = ?auto_377190 ?auto_377191 ) ) ( not ( = ?auto_377190 ?auto_377192 ) ) ( not ( = ?auto_377190 ?auto_377193 ) ) ( not ( = ?auto_377191 ?auto_377192 ) ) ( not ( = ?auto_377191 ?auto_377193 ) ) ( not ( = ?auto_377192 ?auto_377193 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_377192 ?auto_377193 )
      ( !STACK ?auto_377192 ?auto_377191 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377203 - BLOCK
      ?auto_377204 - BLOCK
      ?auto_377205 - BLOCK
      ?auto_377206 - BLOCK
      ?auto_377207 - BLOCK
      ?auto_377208 - BLOCK
      ?auto_377209 - BLOCK
      ?auto_377210 - BLOCK
      ?auto_377211 - BLOCK
    )
    :vars
    (
      ?auto_377212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377211 ?auto_377212 ) ( ON-TABLE ?auto_377203 ) ( ON ?auto_377204 ?auto_377203 ) ( ON ?auto_377205 ?auto_377204 ) ( ON ?auto_377206 ?auto_377205 ) ( ON ?auto_377207 ?auto_377206 ) ( ON ?auto_377208 ?auto_377207 ) ( ON ?auto_377209 ?auto_377208 ) ( not ( = ?auto_377203 ?auto_377204 ) ) ( not ( = ?auto_377203 ?auto_377205 ) ) ( not ( = ?auto_377203 ?auto_377206 ) ) ( not ( = ?auto_377203 ?auto_377207 ) ) ( not ( = ?auto_377203 ?auto_377208 ) ) ( not ( = ?auto_377203 ?auto_377209 ) ) ( not ( = ?auto_377203 ?auto_377210 ) ) ( not ( = ?auto_377203 ?auto_377211 ) ) ( not ( = ?auto_377203 ?auto_377212 ) ) ( not ( = ?auto_377204 ?auto_377205 ) ) ( not ( = ?auto_377204 ?auto_377206 ) ) ( not ( = ?auto_377204 ?auto_377207 ) ) ( not ( = ?auto_377204 ?auto_377208 ) ) ( not ( = ?auto_377204 ?auto_377209 ) ) ( not ( = ?auto_377204 ?auto_377210 ) ) ( not ( = ?auto_377204 ?auto_377211 ) ) ( not ( = ?auto_377204 ?auto_377212 ) ) ( not ( = ?auto_377205 ?auto_377206 ) ) ( not ( = ?auto_377205 ?auto_377207 ) ) ( not ( = ?auto_377205 ?auto_377208 ) ) ( not ( = ?auto_377205 ?auto_377209 ) ) ( not ( = ?auto_377205 ?auto_377210 ) ) ( not ( = ?auto_377205 ?auto_377211 ) ) ( not ( = ?auto_377205 ?auto_377212 ) ) ( not ( = ?auto_377206 ?auto_377207 ) ) ( not ( = ?auto_377206 ?auto_377208 ) ) ( not ( = ?auto_377206 ?auto_377209 ) ) ( not ( = ?auto_377206 ?auto_377210 ) ) ( not ( = ?auto_377206 ?auto_377211 ) ) ( not ( = ?auto_377206 ?auto_377212 ) ) ( not ( = ?auto_377207 ?auto_377208 ) ) ( not ( = ?auto_377207 ?auto_377209 ) ) ( not ( = ?auto_377207 ?auto_377210 ) ) ( not ( = ?auto_377207 ?auto_377211 ) ) ( not ( = ?auto_377207 ?auto_377212 ) ) ( not ( = ?auto_377208 ?auto_377209 ) ) ( not ( = ?auto_377208 ?auto_377210 ) ) ( not ( = ?auto_377208 ?auto_377211 ) ) ( not ( = ?auto_377208 ?auto_377212 ) ) ( not ( = ?auto_377209 ?auto_377210 ) ) ( not ( = ?auto_377209 ?auto_377211 ) ) ( not ( = ?auto_377209 ?auto_377212 ) ) ( not ( = ?auto_377210 ?auto_377211 ) ) ( not ( = ?auto_377210 ?auto_377212 ) ) ( not ( = ?auto_377211 ?auto_377212 ) ) ( CLEAR ?auto_377209 ) ( ON ?auto_377210 ?auto_377211 ) ( CLEAR ?auto_377210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_377203 ?auto_377204 ?auto_377205 ?auto_377206 ?auto_377207 ?auto_377208 ?auto_377209 ?auto_377210 )
      ( MAKE-9PILE ?auto_377203 ?auto_377204 ?auto_377205 ?auto_377206 ?auto_377207 ?auto_377208 ?auto_377209 ?auto_377210 ?auto_377211 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377222 - BLOCK
      ?auto_377223 - BLOCK
      ?auto_377224 - BLOCK
      ?auto_377225 - BLOCK
      ?auto_377226 - BLOCK
      ?auto_377227 - BLOCK
      ?auto_377228 - BLOCK
      ?auto_377229 - BLOCK
      ?auto_377230 - BLOCK
    )
    :vars
    (
      ?auto_377231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377230 ?auto_377231 ) ( ON-TABLE ?auto_377222 ) ( ON ?auto_377223 ?auto_377222 ) ( ON ?auto_377224 ?auto_377223 ) ( ON ?auto_377225 ?auto_377224 ) ( ON ?auto_377226 ?auto_377225 ) ( ON ?auto_377227 ?auto_377226 ) ( ON ?auto_377228 ?auto_377227 ) ( not ( = ?auto_377222 ?auto_377223 ) ) ( not ( = ?auto_377222 ?auto_377224 ) ) ( not ( = ?auto_377222 ?auto_377225 ) ) ( not ( = ?auto_377222 ?auto_377226 ) ) ( not ( = ?auto_377222 ?auto_377227 ) ) ( not ( = ?auto_377222 ?auto_377228 ) ) ( not ( = ?auto_377222 ?auto_377229 ) ) ( not ( = ?auto_377222 ?auto_377230 ) ) ( not ( = ?auto_377222 ?auto_377231 ) ) ( not ( = ?auto_377223 ?auto_377224 ) ) ( not ( = ?auto_377223 ?auto_377225 ) ) ( not ( = ?auto_377223 ?auto_377226 ) ) ( not ( = ?auto_377223 ?auto_377227 ) ) ( not ( = ?auto_377223 ?auto_377228 ) ) ( not ( = ?auto_377223 ?auto_377229 ) ) ( not ( = ?auto_377223 ?auto_377230 ) ) ( not ( = ?auto_377223 ?auto_377231 ) ) ( not ( = ?auto_377224 ?auto_377225 ) ) ( not ( = ?auto_377224 ?auto_377226 ) ) ( not ( = ?auto_377224 ?auto_377227 ) ) ( not ( = ?auto_377224 ?auto_377228 ) ) ( not ( = ?auto_377224 ?auto_377229 ) ) ( not ( = ?auto_377224 ?auto_377230 ) ) ( not ( = ?auto_377224 ?auto_377231 ) ) ( not ( = ?auto_377225 ?auto_377226 ) ) ( not ( = ?auto_377225 ?auto_377227 ) ) ( not ( = ?auto_377225 ?auto_377228 ) ) ( not ( = ?auto_377225 ?auto_377229 ) ) ( not ( = ?auto_377225 ?auto_377230 ) ) ( not ( = ?auto_377225 ?auto_377231 ) ) ( not ( = ?auto_377226 ?auto_377227 ) ) ( not ( = ?auto_377226 ?auto_377228 ) ) ( not ( = ?auto_377226 ?auto_377229 ) ) ( not ( = ?auto_377226 ?auto_377230 ) ) ( not ( = ?auto_377226 ?auto_377231 ) ) ( not ( = ?auto_377227 ?auto_377228 ) ) ( not ( = ?auto_377227 ?auto_377229 ) ) ( not ( = ?auto_377227 ?auto_377230 ) ) ( not ( = ?auto_377227 ?auto_377231 ) ) ( not ( = ?auto_377228 ?auto_377229 ) ) ( not ( = ?auto_377228 ?auto_377230 ) ) ( not ( = ?auto_377228 ?auto_377231 ) ) ( not ( = ?auto_377229 ?auto_377230 ) ) ( not ( = ?auto_377229 ?auto_377231 ) ) ( not ( = ?auto_377230 ?auto_377231 ) ) ( CLEAR ?auto_377228 ) ( ON ?auto_377229 ?auto_377230 ) ( CLEAR ?auto_377229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_377222 ?auto_377223 ?auto_377224 ?auto_377225 ?auto_377226 ?auto_377227 ?auto_377228 ?auto_377229 )
      ( MAKE-9PILE ?auto_377222 ?auto_377223 ?auto_377224 ?auto_377225 ?auto_377226 ?auto_377227 ?auto_377228 ?auto_377229 ?auto_377230 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377241 - BLOCK
      ?auto_377242 - BLOCK
      ?auto_377243 - BLOCK
      ?auto_377244 - BLOCK
      ?auto_377245 - BLOCK
      ?auto_377246 - BLOCK
      ?auto_377247 - BLOCK
      ?auto_377248 - BLOCK
      ?auto_377249 - BLOCK
    )
    :vars
    (
      ?auto_377250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377249 ?auto_377250 ) ( ON-TABLE ?auto_377241 ) ( ON ?auto_377242 ?auto_377241 ) ( ON ?auto_377243 ?auto_377242 ) ( ON ?auto_377244 ?auto_377243 ) ( ON ?auto_377245 ?auto_377244 ) ( ON ?auto_377246 ?auto_377245 ) ( not ( = ?auto_377241 ?auto_377242 ) ) ( not ( = ?auto_377241 ?auto_377243 ) ) ( not ( = ?auto_377241 ?auto_377244 ) ) ( not ( = ?auto_377241 ?auto_377245 ) ) ( not ( = ?auto_377241 ?auto_377246 ) ) ( not ( = ?auto_377241 ?auto_377247 ) ) ( not ( = ?auto_377241 ?auto_377248 ) ) ( not ( = ?auto_377241 ?auto_377249 ) ) ( not ( = ?auto_377241 ?auto_377250 ) ) ( not ( = ?auto_377242 ?auto_377243 ) ) ( not ( = ?auto_377242 ?auto_377244 ) ) ( not ( = ?auto_377242 ?auto_377245 ) ) ( not ( = ?auto_377242 ?auto_377246 ) ) ( not ( = ?auto_377242 ?auto_377247 ) ) ( not ( = ?auto_377242 ?auto_377248 ) ) ( not ( = ?auto_377242 ?auto_377249 ) ) ( not ( = ?auto_377242 ?auto_377250 ) ) ( not ( = ?auto_377243 ?auto_377244 ) ) ( not ( = ?auto_377243 ?auto_377245 ) ) ( not ( = ?auto_377243 ?auto_377246 ) ) ( not ( = ?auto_377243 ?auto_377247 ) ) ( not ( = ?auto_377243 ?auto_377248 ) ) ( not ( = ?auto_377243 ?auto_377249 ) ) ( not ( = ?auto_377243 ?auto_377250 ) ) ( not ( = ?auto_377244 ?auto_377245 ) ) ( not ( = ?auto_377244 ?auto_377246 ) ) ( not ( = ?auto_377244 ?auto_377247 ) ) ( not ( = ?auto_377244 ?auto_377248 ) ) ( not ( = ?auto_377244 ?auto_377249 ) ) ( not ( = ?auto_377244 ?auto_377250 ) ) ( not ( = ?auto_377245 ?auto_377246 ) ) ( not ( = ?auto_377245 ?auto_377247 ) ) ( not ( = ?auto_377245 ?auto_377248 ) ) ( not ( = ?auto_377245 ?auto_377249 ) ) ( not ( = ?auto_377245 ?auto_377250 ) ) ( not ( = ?auto_377246 ?auto_377247 ) ) ( not ( = ?auto_377246 ?auto_377248 ) ) ( not ( = ?auto_377246 ?auto_377249 ) ) ( not ( = ?auto_377246 ?auto_377250 ) ) ( not ( = ?auto_377247 ?auto_377248 ) ) ( not ( = ?auto_377247 ?auto_377249 ) ) ( not ( = ?auto_377247 ?auto_377250 ) ) ( not ( = ?auto_377248 ?auto_377249 ) ) ( not ( = ?auto_377248 ?auto_377250 ) ) ( not ( = ?auto_377249 ?auto_377250 ) ) ( ON ?auto_377248 ?auto_377249 ) ( CLEAR ?auto_377246 ) ( ON ?auto_377247 ?auto_377248 ) ( CLEAR ?auto_377247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_377241 ?auto_377242 ?auto_377243 ?auto_377244 ?auto_377245 ?auto_377246 ?auto_377247 )
      ( MAKE-9PILE ?auto_377241 ?auto_377242 ?auto_377243 ?auto_377244 ?auto_377245 ?auto_377246 ?auto_377247 ?auto_377248 ?auto_377249 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377260 - BLOCK
      ?auto_377261 - BLOCK
      ?auto_377262 - BLOCK
      ?auto_377263 - BLOCK
      ?auto_377264 - BLOCK
      ?auto_377265 - BLOCK
      ?auto_377266 - BLOCK
      ?auto_377267 - BLOCK
      ?auto_377268 - BLOCK
    )
    :vars
    (
      ?auto_377269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377268 ?auto_377269 ) ( ON-TABLE ?auto_377260 ) ( ON ?auto_377261 ?auto_377260 ) ( ON ?auto_377262 ?auto_377261 ) ( ON ?auto_377263 ?auto_377262 ) ( ON ?auto_377264 ?auto_377263 ) ( ON ?auto_377265 ?auto_377264 ) ( not ( = ?auto_377260 ?auto_377261 ) ) ( not ( = ?auto_377260 ?auto_377262 ) ) ( not ( = ?auto_377260 ?auto_377263 ) ) ( not ( = ?auto_377260 ?auto_377264 ) ) ( not ( = ?auto_377260 ?auto_377265 ) ) ( not ( = ?auto_377260 ?auto_377266 ) ) ( not ( = ?auto_377260 ?auto_377267 ) ) ( not ( = ?auto_377260 ?auto_377268 ) ) ( not ( = ?auto_377260 ?auto_377269 ) ) ( not ( = ?auto_377261 ?auto_377262 ) ) ( not ( = ?auto_377261 ?auto_377263 ) ) ( not ( = ?auto_377261 ?auto_377264 ) ) ( not ( = ?auto_377261 ?auto_377265 ) ) ( not ( = ?auto_377261 ?auto_377266 ) ) ( not ( = ?auto_377261 ?auto_377267 ) ) ( not ( = ?auto_377261 ?auto_377268 ) ) ( not ( = ?auto_377261 ?auto_377269 ) ) ( not ( = ?auto_377262 ?auto_377263 ) ) ( not ( = ?auto_377262 ?auto_377264 ) ) ( not ( = ?auto_377262 ?auto_377265 ) ) ( not ( = ?auto_377262 ?auto_377266 ) ) ( not ( = ?auto_377262 ?auto_377267 ) ) ( not ( = ?auto_377262 ?auto_377268 ) ) ( not ( = ?auto_377262 ?auto_377269 ) ) ( not ( = ?auto_377263 ?auto_377264 ) ) ( not ( = ?auto_377263 ?auto_377265 ) ) ( not ( = ?auto_377263 ?auto_377266 ) ) ( not ( = ?auto_377263 ?auto_377267 ) ) ( not ( = ?auto_377263 ?auto_377268 ) ) ( not ( = ?auto_377263 ?auto_377269 ) ) ( not ( = ?auto_377264 ?auto_377265 ) ) ( not ( = ?auto_377264 ?auto_377266 ) ) ( not ( = ?auto_377264 ?auto_377267 ) ) ( not ( = ?auto_377264 ?auto_377268 ) ) ( not ( = ?auto_377264 ?auto_377269 ) ) ( not ( = ?auto_377265 ?auto_377266 ) ) ( not ( = ?auto_377265 ?auto_377267 ) ) ( not ( = ?auto_377265 ?auto_377268 ) ) ( not ( = ?auto_377265 ?auto_377269 ) ) ( not ( = ?auto_377266 ?auto_377267 ) ) ( not ( = ?auto_377266 ?auto_377268 ) ) ( not ( = ?auto_377266 ?auto_377269 ) ) ( not ( = ?auto_377267 ?auto_377268 ) ) ( not ( = ?auto_377267 ?auto_377269 ) ) ( not ( = ?auto_377268 ?auto_377269 ) ) ( ON ?auto_377267 ?auto_377268 ) ( CLEAR ?auto_377265 ) ( ON ?auto_377266 ?auto_377267 ) ( CLEAR ?auto_377266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_377260 ?auto_377261 ?auto_377262 ?auto_377263 ?auto_377264 ?auto_377265 ?auto_377266 )
      ( MAKE-9PILE ?auto_377260 ?auto_377261 ?auto_377262 ?auto_377263 ?auto_377264 ?auto_377265 ?auto_377266 ?auto_377267 ?auto_377268 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377279 - BLOCK
      ?auto_377280 - BLOCK
      ?auto_377281 - BLOCK
      ?auto_377282 - BLOCK
      ?auto_377283 - BLOCK
      ?auto_377284 - BLOCK
      ?auto_377285 - BLOCK
      ?auto_377286 - BLOCK
      ?auto_377287 - BLOCK
    )
    :vars
    (
      ?auto_377288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377287 ?auto_377288 ) ( ON-TABLE ?auto_377279 ) ( ON ?auto_377280 ?auto_377279 ) ( ON ?auto_377281 ?auto_377280 ) ( ON ?auto_377282 ?auto_377281 ) ( ON ?auto_377283 ?auto_377282 ) ( not ( = ?auto_377279 ?auto_377280 ) ) ( not ( = ?auto_377279 ?auto_377281 ) ) ( not ( = ?auto_377279 ?auto_377282 ) ) ( not ( = ?auto_377279 ?auto_377283 ) ) ( not ( = ?auto_377279 ?auto_377284 ) ) ( not ( = ?auto_377279 ?auto_377285 ) ) ( not ( = ?auto_377279 ?auto_377286 ) ) ( not ( = ?auto_377279 ?auto_377287 ) ) ( not ( = ?auto_377279 ?auto_377288 ) ) ( not ( = ?auto_377280 ?auto_377281 ) ) ( not ( = ?auto_377280 ?auto_377282 ) ) ( not ( = ?auto_377280 ?auto_377283 ) ) ( not ( = ?auto_377280 ?auto_377284 ) ) ( not ( = ?auto_377280 ?auto_377285 ) ) ( not ( = ?auto_377280 ?auto_377286 ) ) ( not ( = ?auto_377280 ?auto_377287 ) ) ( not ( = ?auto_377280 ?auto_377288 ) ) ( not ( = ?auto_377281 ?auto_377282 ) ) ( not ( = ?auto_377281 ?auto_377283 ) ) ( not ( = ?auto_377281 ?auto_377284 ) ) ( not ( = ?auto_377281 ?auto_377285 ) ) ( not ( = ?auto_377281 ?auto_377286 ) ) ( not ( = ?auto_377281 ?auto_377287 ) ) ( not ( = ?auto_377281 ?auto_377288 ) ) ( not ( = ?auto_377282 ?auto_377283 ) ) ( not ( = ?auto_377282 ?auto_377284 ) ) ( not ( = ?auto_377282 ?auto_377285 ) ) ( not ( = ?auto_377282 ?auto_377286 ) ) ( not ( = ?auto_377282 ?auto_377287 ) ) ( not ( = ?auto_377282 ?auto_377288 ) ) ( not ( = ?auto_377283 ?auto_377284 ) ) ( not ( = ?auto_377283 ?auto_377285 ) ) ( not ( = ?auto_377283 ?auto_377286 ) ) ( not ( = ?auto_377283 ?auto_377287 ) ) ( not ( = ?auto_377283 ?auto_377288 ) ) ( not ( = ?auto_377284 ?auto_377285 ) ) ( not ( = ?auto_377284 ?auto_377286 ) ) ( not ( = ?auto_377284 ?auto_377287 ) ) ( not ( = ?auto_377284 ?auto_377288 ) ) ( not ( = ?auto_377285 ?auto_377286 ) ) ( not ( = ?auto_377285 ?auto_377287 ) ) ( not ( = ?auto_377285 ?auto_377288 ) ) ( not ( = ?auto_377286 ?auto_377287 ) ) ( not ( = ?auto_377286 ?auto_377288 ) ) ( not ( = ?auto_377287 ?auto_377288 ) ) ( ON ?auto_377286 ?auto_377287 ) ( ON ?auto_377285 ?auto_377286 ) ( CLEAR ?auto_377283 ) ( ON ?auto_377284 ?auto_377285 ) ( CLEAR ?auto_377284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_377279 ?auto_377280 ?auto_377281 ?auto_377282 ?auto_377283 ?auto_377284 )
      ( MAKE-9PILE ?auto_377279 ?auto_377280 ?auto_377281 ?auto_377282 ?auto_377283 ?auto_377284 ?auto_377285 ?auto_377286 ?auto_377287 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377298 - BLOCK
      ?auto_377299 - BLOCK
      ?auto_377300 - BLOCK
      ?auto_377301 - BLOCK
      ?auto_377302 - BLOCK
      ?auto_377303 - BLOCK
      ?auto_377304 - BLOCK
      ?auto_377305 - BLOCK
      ?auto_377306 - BLOCK
    )
    :vars
    (
      ?auto_377307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377306 ?auto_377307 ) ( ON-TABLE ?auto_377298 ) ( ON ?auto_377299 ?auto_377298 ) ( ON ?auto_377300 ?auto_377299 ) ( ON ?auto_377301 ?auto_377300 ) ( ON ?auto_377302 ?auto_377301 ) ( not ( = ?auto_377298 ?auto_377299 ) ) ( not ( = ?auto_377298 ?auto_377300 ) ) ( not ( = ?auto_377298 ?auto_377301 ) ) ( not ( = ?auto_377298 ?auto_377302 ) ) ( not ( = ?auto_377298 ?auto_377303 ) ) ( not ( = ?auto_377298 ?auto_377304 ) ) ( not ( = ?auto_377298 ?auto_377305 ) ) ( not ( = ?auto_377298 ?auto_377306 ) ) ( not ( = ?auto_377298 ?auto_377307 ) ) ( not ( = ?auto_377299 ?auto_377300 ) ) ( not ( = ?auto_377299 ?auto_377301 ) ) ( not ( = ?auto_377299 ?auto_377302 ) ) ( not ( = ?auto_377299 ?auto_377303 ) ) ( not ( = ?auto_377299 ?auto_377304 ) ) ( not ( = ?auto_377299 ?auto_377305 ) ) ( not ( = ?auto_377299 ?auto_377306 ) ) ( not ( = ?auto_377299 ?auto_377307 ) ) ( not ( = ?auto_377300 ?auto_377301 ) ) ( not ( = ?auto_377300 ?auto_377302 ) ) ( not ( = ?auto_377300 ?auto_377303 ) ) ( not ( = ?auto_377300 ?auto_377304 ) ) ( not ( = ?auto_377300 ?auto_377305 ) ) ( not ( = ?auto_377300 ?auto_377306 ) ) ( not ( = ?auto_377300 ?auto_377307 ) ) ( not ( = ?auto_377301 ?auto_377302 ) ) ( not ( = ?auto_377301 ?auto_377303 ) ) ( not ( = ?auto_377301 ?auto_377304 ) ) ( not ( = ?auto_377301 ?auto_377305 ) ) ( not ( = ?auto_377301 ?auto_377306 ) ) ( not ( = ?auto_377301 ?auto_377307 ) ) ( not ( = ?auto_377302 ?auto_377303 ) ) ( not ( = ?auto_377302 ?auto_377304 ) ) ( not ( = ?auto_377302 ?auto_377305 ) ) ( not ( = ?auto_377302 ?auto_377306 ) ) ( not ( = ?auto_377302 ?auto_377307 ) ) ( not ( = ?auto_377303 ?auto_377304 ) ) ( not ( = ?auto_377303 ?auto_377305 ) ) ( not ( = ?auto_377303 ?auto_377306 ) ) ( not ( = ?auto_377303 ?auto_377307 ) ) ( not ( = ?auto_377304 ?auto_377305 ) ) ( not ( = ?auto_377304 ?auto_377306 ) ) ( not ( = ?auto_377304 ?auto_377307 ) ) ( not ( = ?auto_377305 ?auto_377306 ) ) ( not ( = ?auto_377305 ?auto_377307 ) ) ( not ( = ?auto_377306 ?auto_377307 ) ) ( ON ?auto_377305 ?auto_377306 ) ( ON ?auto_377304 ?auto_377305 ) ( CLEAR ?auto_377302 ) ( ON ?auto_377303 ?auto_377304 ) ( CLEAR ?auto_377303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_377298 ?auto_377299 ?auto_377300 ?auto_377301 ?auto_377302 ?auto_377303 )
      ( MAKE-9PILE ?auto_377298 ?auto_377299 ?auto_377300 ?auto_377301 ?auto_377302 ?auto_377303 ?auto_377304 ?auto_377305 ?auto_377306 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377317 - BLOCK
      ?auto_377318 - BLOCK
      ?auto_377319 - BLOCK
      ?auto_377320 - BLOCK
      ?auto_377321 - BLOCK
      ?auto_377322 - BLOCK
      ?auto_377323 - BLOCK
      ?auto_377324 - BLOCK
      ?auto_377325 - BLOCK
    )
    :vars
    (
      ?auto_377326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377325 ?auto_377326 ) ( ON-TABLE ?auto_377317 ) ( ON ?auto_377318 ?auto_377317 ) ( ON ?auto_377319 ?auto_377318 ) ( ON ?auto_377320 ?auto_377319 ) ( not ( = ?auto_377317 ?auto_377318 ) ) ( not ( = ?auto_377317 ?auto_377319 ) ) ( not ( = ?auto_377317 ?auto_377320 ) ) ( not ( = ?auto_377317 ?auto_377321 ) ) ( not ( = ?auto_377317 ?auto_377322 ) ) ( not ( = ?auto_377317 ?auto_377323 ) ) ( not ( = ?auto_377317 ?auto_377324 ) ) ( not ( = ?auto_377317 ?auto_377325 ) ) ( not ( = ?auto_377317 ?auto_377326 ) ) ( not ( = ?auto_377318 ?auto_377319 ) ) ( not ( = ?auto_377318 ?auto_377320 ) ) ( not ( = ?auto_377318 ?auto_377321 ) ) ( not ( = ?auto_377318 ?auto_377322 ) ) ( not ( = ?auto_377318 ?auto_377323 ) ) ( not ( = ?auto_377318 ?auto_377324 ) ) ( not ( = ?auto_377318 ?auto_377325 ) ) ( not ( = ?auto_377318 ?auto_377326 ) ) ( not ( = ?auto_377319 ?auto_377320 ) ) ( not ( = ?auto_377319 ?auto_377321 ) ) ( not ( = ?auto_377319 ?auto_377322 ) ) ( not ( = ?auto_377319 ?auto_377323 ) ) ( not ( = ?auto_377319 ?auto_377324 ) ) ( not ( = ?auto_377319 ?auto_377325 ) ) ( not ( = ?auto_377319 ?auto_377326 ) ) ( not ( = ?auto_377320 ?auto_377321 ) ) ( not ( = ?auto_377320 ?auto_377322 ) ) ( not ( = ?auto_377320 ?auto_377323 ) ) ( not ( = ?auto_377320 ?auto_377324 ) ) ( not ( = ?auto_377320 ?auto_377325 ) ) ( not ( = ?auto_377320 ?auto_377326 ) ) ( not ( = ?auto_377321 ?auto_377322 ) ) ( not ( = ?auto_377321 ?auto_377323 ) ) ( not ( = ?auto_377321 ?auto_377324 ) ) ( not ( = ?auto_377321 ?auto_377325 ) ) ( not ( = ?auto_377321 ?auto_377326 ) ) ( not ( = ?auto_377322 ?auto_377323 ) ) ( not ( = ?auto_377322 ?auto_377324 ) ) ( not ( = ?auto_377322 ?auto_377325 ) ) ( not ( = ?auto_377322 ?auto_377326 ) ) ( not ( = ?auto_377323 ?auto_377324 ) ) ( not ( = ?auto_377323 ?auto_377325 ) ) ( not ( = ?auto_377323 ?auto_377326 ) ) ( not ( = ?auto_377324 ?auto_377325 ) ) ( not ( = ?auto_377324 ?auto_377326 ) ) ( not ( = ?auto_377325 ?auto_377326 ) ) ( ON ?auto_377324 ?auto_377325 ) ( ON ?auto_377323 ?auto_377324 ) ( ON ?auto_377322 ?auto_377323 ) ( CLEAR ?auto_377320 ) ( ON ?auto_377321 ?auto_377322 ) ( CLEAR ?auto_377321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_377317 ?auto_377318 ?auto_377319 ?auto_377320 ?auto_377321 )
      ( MAKE-9PILE ?auto_377317 ?auto_377318 ?auto_377319 ?auto_377320 ?auto_377321 ?auto_377322 ?auto_377323 ?auto_377324 ?auto_377325 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377336 - BLOCK
      ?auto_377337 - BLOCK
      ?auto_377338 - BLOCK
      ?auto_377339 - BLOCK
      ?auto_377340 - BLOCK
      ?auto_377341 - BLOCK
      ?auto_377342 - BLOCK
      ?auto_377343 - BLOCK
      ?auto_377344 - BLOCK
    )
    :vars
    (
      ?auto_377345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377344 ?auto_377345 ) ( ON-TABLE ?auto_377336 ) ( ON ?auto_377337 ?auto_377336 ) ( ON ?auto_377338 ?auto_377337 ) ( ON ?auto_377339 ?auto_377338 ) ( not ( = ?auto_377336 ?auto_377337 ) ) ( not ( = ?auto_377336 ?auto_377338 ) ) ( not ( = ?auto_377336 ?auto_377339 ) ) ( not ( = ?auto_377336 ?auto_377340 ) ) ( not ( = ?auto_377336 ?auto_377341 ) ) ( not ( = ?auto_377336 ?auto_377342 ) ) ( not ( = ?auto_377336 ?auto_377343 ) ) ( not ( = ?auto_377336 ?auto_377344 ) ) ( not ( = ?auto_377336 ?auto_377345 ) ) ( not ( = ?auto_377337 ?auto_377338 ) ) ( not ( = ?auto_377337 ?auto_377339 ) ) ( not ( = ?auto_377337 ?auto_377340 ) ) ( not ( = ?auto_377337 ?auto_377341 ) ) ( not ( = ?auto_377337 ?auto_377342 ) ) ( not ( = ?auto_377337 ?auto_377343 ) ) ( not ( = ?auto_377337 ?auto_377344 ) ) ( not ( = ?auto_377337 ?auto_377345 ) ) ( not ( = ?auto_377338 ?auto_377339 ) ) ( not ( = ?auto_377338 ?auto_377340 ) ) ( not ( = ?auto_377338 ?auto_377341 ) ) ( not ( = ?auto_377338 ?auto_377342 ) ) ( not ( = ?auto_377338 ?auto_377343 ) ) ( not ( = ?auto_377338 ?auto_377344 ) ) ( not ( = ?auto_377338 ?auto_377345 ) ) ( not ( = ?auto_377339 ?auto_377340 ) ) ( not ( = ?auto_377339 ?auto_377341 ) ) ( not ( = ?auto_377339 ?auto_377342 ) ) ( not ( = ?auto_377339 ?auto_377343 ) ) ( not ( = ?auto_377339 ?auto_377344 ) ) ( not ( = ?auto_377339 ?auto_377345 ) ) ( not ( = ?auto_377340 ?auto_377341 ) ) ( not ( = ?auto_377340 ?auto_377342 ) ) ( not ( = ?auto_377340 ?auto_377343 ) ) ( not ( = ?auto_377340 ?auto_377344 ) ) ( not ( = ?auto_377340 ?auto_377345 ) ) ( not ( = ?auto_377341 ?auto_377342 ) ) ( not ( = ?auto_377341 ?auto_377343 ) ) ( not ( = ?auto_377341 ?auto_377344 ) ) ( not ( = ?auto_377341 ?auto_377345 ) ) ( not ( = ?auto_377342 ?auto_377343 ) ) ( not ( = ?auto_377342 ?auto_377344 ) ) ( not ( = ?auto_377342 ?auto_377345 ) ) ( not ( = ?auto_377343 ?auto_377344 ) ) ( not ( = ?auto_377343 ?auto_377345 ) ) ( not ( = ?auto_377344 ?auto_377345 ) ) ( ON ?auto_377343 ?auto_377344 ) ( ON ?auto_377342 ?auto_377343 ) ( ON ?auto_377341 ?auto_377342 ) ( CLEAR ?auto_377339 ) ( ON ?auto_377340 ?auto_377341 ) ( CLEAR ?auto_377340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_377336 ?auto_377337 ?auto_377338 ?auto_377339 ?auto_377340 )
      ( MAKE-9PILE ?auto_377336 ?auto_377337 ?auto_377338 ?auto_377339 ?auto_377340 ?auto_377341 ?auto_377342 ?auto_377343 ?auto_377344 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377355 - BLOCK
      ?auto_377356 - BLOCK
      ?auto_377357 - BLOCK
      ?auto_377358 - BLOCK
      ?auto_377359 - BLOCK
      ?auto_377360 - BLOCK
      ?auto_377361 - BLOCK
      ?auto_377362 - BLOCK
      ?auto_377363 - BLOCK
    )
    :vars
    (
      ?auto_377364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377363 ?auto_377364 ) ( ON-TABLE ?auto_377355 ) ( ON ?auto_377356 ?auto_377355 ) ( ON ?auto_377357 ?auto_377356 ) ( not ( = ?auto_377355 ?auto_377356 ) ) ( not ( = ?auto_377355 ?auto_377357 ) ) ( not ( = ?auto_377355 ?auto_377358 ) ) ( not ( = ?auto_377355 ?auto_377359 ) ) ( not ( = ?auto_377355 ?auto_377360 ) ) ( not ( = ?auto_377355 ?auto_377361 ) ) ( not ( = ?auto_377355 ?auto_377362 ) ) ( not ( = ?auto_377355 ?auto_377363 ) ) ( not ( = ?auto_377355 ?auto_377364 ) ) ( not ( = ?auto_377356 ?auto_377357 ) ) ( not ( = ?auto_377356 ?auto_377358 ) ) ( not ( = ?auto_377356 ?auto_377359 ) ) ( not ( = ?auto_377356 ?auto_377360 ) ) ( not ( = ?auto_377356 ?auto_377361 ) ) ( not ( = ?auto_377356 ?auto_377362 ) ) ( not ( = ?auto_377356 ?auto_377363 ) ) ( not ( = ?auto_377356 ?auto_377364 ) ) ( not ( = ?auto_377357 ?auto_377358 ) ) ( not ( = ?auto_377357 ?auto_377359 ) ) ( not ( = ?auto_377357 ?auto_377360 ) ) ( not ( = ?auto_377357 ?auto_377361 ) ) ( not ( = ?auto_377357 ?auto_377362 ) ) ( not ( = ?auto_377357 ?auto_377363 ) ) ( not ( = ?auto_377357 ?auto_377364 ) ) ( not ( = ?auto_377358 ?auto_377359 ) ) ( not ( = ?auto_377358 ?auto_377360 ) ) ( not ( = ?auto_377358 ?auto_377361 ) ) ( not ( = ?auto_377358 ?auto_377362 ) ) ( not ( = ?auto_377358 ?auto_377363 ) ) ( not ( = ?auto_377358 ?auto_377364 ) ) ( not ( = ?auto_377359 ?auto_377360 ) ) ( not ( = ?auto_377359 ?auto_377361 ) ) ( not ( = ?auto_377359 ?auto_377362 ) ) ( not ( = ?auto_377359 ?auto_377363 ) ) ( not ( = ?auto_377359 ?auto_377364 ) ) ( not ( = ?auto_377360 ?auto_377361 ) ) ( not ( = ?auto_377360 ?auto_377362 ) ) ( not ( = ?auto_377360 ?auto_377363 ) ) ( not ( = ?auto_377360 ?auto_377364 ) ) ( not ( = ?auto_377361 ?auto_377362 ) ) ( not ( = ?auto_377361 ?auto_377363 ) ) ( not ( = ?auto_377361 ?auto_377364 ) ) ( not ( = ?auto_377362 ?auto_377363 ) ) ( not ( = ?auto_377362 ?auto_377364 ) ) ( not ( = ?auto_377363 ?auto_377364 ) ) ( ON ?auto_377362 ?auto_377363 ) ( ON ?auto_377361 ?auto_377362 ) ( ON ?auto_377360 ?auto_377361 ) ( ON ?auto_377359 ?auto_377360 ) ( CLEAR ?auto_377357 ) ( ON ?auto_377358 ?auto_377359 ) ( CLEAR ?auto_377358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_377355 ?auto_377356 ?auto_377357 ?auto_377358 )
      ( MAKE-9PILE ?auto_377355 ?auto_377356 ?auto_377357 ?auto_377358 ?auto_377359 ?auto_377360 ?auto_377361 ?auto_377362 ?auto_377363 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377374 - BLOCK
      ?auto_377375 - BLOCK
      ?auto_377376 - BLOCK
      ?auto_377377 - BLOCK
      ?auto_377378 - BLOCK
      ?auto_377379 - BLOCK
      ?auto_377380 - BLOCK
      ?auto_377381 - BLOCK
      ?auto_377382 - BLOCK
    )
    :vars
    (
      ?auto_377383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377382 ?auto_377383 ) ( ON-TABLE ?auto_377374 ) ( ON ?auto_377375 ?auto_377374 ) ( ON ?auto_377376 ?auto_377375 ) ( not ( = ?auto_377374 ?auto_377375 ) ) ( not ( = ?auto_377374 ?auto_377376 ) ) ( not ( = ?auto_377374 ?auto_377377 ) ) ( not ( = ?auto_377374 ?auto_377378 ) ) ( not ( = ?auto_377374 ?auto_377379 ) ) ( not ( = ?auto_377374 ?auto_377380 ) ) ( not ( = ?auto_377374 ?auto_377381 ) ) ( not ( = ?auto_377374 ?auto_377382 ) ) ( not ( = ?auto_377374 ?auto_377383 ) ) ( not ( = ?auto_377375 ?auto_377376 ) ) ( not ( = ?auto_377375 ?auto_377377 ) ) ( not ( = ?auto_377375 ?auto_377378 ) ) ( not ( = ?auto_377375 ?auto_377379 ) ) ( not ( = ?auto_377375 ?auto_377380 ) ) ( not ( = ?auto_377375 ?auto_377381 ) ) ( not ( = ?auto_377375 ?auto_377382 ) ) ( not ( = ?auto_377375 ?auto_377383 ) ) ( not ( = ?auto_377376 ?auto_377377 ) ) ( not ( = ?auto_377376 ?auto_377378 ) ) ( not ( = ?auto_377376 ?auto_377379 ) ) ( not ( = ?auto_377376 ?auto_377380 ) ) ( not ( = ?auto_377376 ?auto_377381 ) ) ( not ( = ?auto_377376 ?auto_377382 ) ) ( not ( = ?auto_377376 ?auto_377383 ) ) ( not ( = ?auto_377377 ?auto_377378 ) ) ( not ( = ?auto_377377 ?auto_377379 ) ) ( not ( = ?auto_377377 ?auto_377380 ) ) ( not ( = ?auto_377377 ?auto_377381 ) ) ( not ( = ?auto_377377 ?auto_377382 ) ) ( not ( = ?auto_377377 ?auto_377383 ) ) ( not ( = ?auto_377378 ?auto_377379 ) ) ( not ( = ?auto_377378 ?auto_377380 ) ) ( not ( = ?auto_377378 ?auto_377381 ) ) ( not ( = ?auto_377378 ?auto_377382 ) ) ( not ( = ?auto_377378 ?auto_377383 ) ) ( not ( = ?auto_377379 ?auto_377380 ) ) ( not ( = ?auto_377379 ?auto_377381 ) ) ( not ( = ?auto_377379 ?auto_377382 ) ) ( not ( = ?auto_377379 ?auto_377383 ) ) ( not ( = ?auto_377380 ?auto_377381 ) ) ( not ( = ?auto_377380 ?auto_377382 ) ) ( not ( = ?auto_377380 ?auto_377383 ) ) ( not ( = ?auto_377381 ?auto_377382 ) ) ( not ( = ?auto_377381 ?auto_377383 ) ) ( not ( = ?auto_377382 ?auto_377383 ) ) ( ON ?auto_377381 ?auto_377382 ) ( ON ?auto_377380 ?auto_377381 ) ( ON ?auto_377379 ?auto_377380 ) ( ON ?auto_377378 ?auto_377379 ) ( CLEAR ?auto_377376 ) ( ON ?auto_377377 ?auto_377378 ) ( CLEAR ?auto_377377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_377374 ?auto_377375 ?auto_377376 ?auto_377377 )
      ( MAKE-9PILE ?auto_377374 ?auto_377375 ?auto_377376 ?auto_377377 ?auto_377378 ?auto_377379 ?auto_377380 ?auto_377381 ?auto_377382 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377393 - BLOCK
      ?auto_377394 - BLOCK
      ?auto_377395 - BLOCK
      ?auto_377396 - BLOCK
      ?auto_377397 - BLOCK
      ?auto_377398 - BLOCK
      ?auto_377399 - BLOCK
      ?auto_377400 - BLOCK
      ?auto_377401 - BLOCK
    )
    :vars
    (
      ?auto_377402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377401 ?auto_377402 ) ( ON-TABLE ?auto_377393 ) ( ON ?auto_377394 ?auto_377393 ) ( not ( = ?auto_377393 ?auto_377394 ) ) ( not ( = ?auto_377393 ?auto_377395 ) ) ( not ( = ?auto_377393 ?auto_377396 ) ) ( not ( = ?auto_377393 ?auto_377397 ) ) ( not ( = ?auto_377393 ?auto_377398 ) ) ( not ( = ?auto_377393 ?auto_377399 ) ) ( not ( = ?auto_377393 ?auto_377400 ) ) ( not ( = ?auto_377393 ?auto_377401 ) ) ( not ( = ?auto_377393 ?auto_377402 ) ) ( not ( = ?auto_377394 ?auto_377395 ) ) ( not ( = ?auto_377394 ?auto_377396 ) ) ( not ( = ?auto_377394 ?auto_377397 ) ) ( not ( = ?auto_377394 ?auto_377398 ) ) ( not ( = ?auto_377394 ?auto_377399 ) ) ( not ( = ?auto_377394 ?auto_377400 ) ) ( not ( = ?auto_377394 ?auto_377401 ) ) ( not ( = ?auto_377394 ?auto_377402 ) ) ( not ( = ?auto_377395 ?auto_377396 ) ) ( not ( = ?auto_377395 ?auto_377397 ) ) ( not ( = ?auto_377395 ?auto_377398 ) ) ( not ( = ?auto_377395 ?auto_377399 ) ) ( not ( = ?auto_377395 ?auto_377400 ) ) ( not ( = ?auto_377395 ?auto_377401 ) ) ( not ( = ?auto_377395 ?auto_377402 ) ) ( not ( = ?auto_377396 ?auto_377397 ) ) ( not ( = ?auto_377396 ?auto_377398 ) ) ( not ( = ?auto_377396 ?auto_377399 ) ) ( not ( = ?auto_377396 ?auto_377400 ) ) ( not ( = ?auto_377396 ?auto_377401 ) ) ( not ( = ?auto_377396 ?auto_377402 ) ) ( not ( = ?auto_377397 ?auto_377398 ) ) ( not ( = ?auto_377397 ?auto_377399 ) ) ( not ( = ?auto_377397 ?auto_377400 ) ) ( not ( = ?auto_377397 ?auto_377401 ) ) ( not ( = ?auto_377397 ?auto_377402 ) ) ( not ( = ?auto_377398 ?auto_377399 ) ) ( not ( = ?auto_377398 ?auto_377400 ) ) ( not ( = ?auto_377398 ?auto_377401 ) ) ( not ( = ?auto_377398 ?auto_377402 ) ) ( not ( = ?auto_377399 ?auto_377400 ) ) ( not ( = ?auto_377399 ?auto_377401 ) ) ( not ( = ?auto_377399 ?auto_377402 ) ) ( not ( = ?auto_377400 ?auto_377401 ) ) ( not ( = ?auto_377400 ?auto_377402 ) ) ( not ( = ?auto_377401 ?auto_377402 ) ) ( ON ?auto_377400 ?auto_377401 ) ( ON ?auto_377399 ?auto_377400 ) ( ON ?auto_377398 ?auto_377399 ) ( ON ?auto_377397 ?auto_377398 ) ( ON ?auto_377396 ?auto_377397 ) ( CLEAR ?auto_377394 ) ( ON ?auto_377395 ?auto_377396 ) ( CLEAR ?auto_377395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_377393 ?auto_377394 ?auto_377395 )
      ( MAKE-9PILE ?auto_377393 ?auto_377394 ?auto_377395 ?auto_377396 ?auto_377397 ?auto_377398 ?auto_377399 ?auto_377400 ?auto_377401 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377412 - BLOCK
      ?auto_377413 - BLOCK
      ?auto_377414 - BLOCK
      ?auto_377415 - BLOCK
      ?auto_377416 - BLOCK
      ?auto_377417 - BLOCK
      ?auto_377418 - BLOCK
      ?auto_377419 - BLOCK
      ?auto_377420 - BLOCK
    )
    :vars
    (
      ?auto_377421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377420 ?auto_377421 ) ( ON-TABLE ?auto_377412 ) ( ON ?auto_377413 ?auto_377412 ) ( not ( = ?auto_377412 ?auto_377413 ) ) ( not ( = ?auto_377412 ?auto_377414 ) ) ( not ( = ?auto_377412 ?auto_377415 ) ) ( not ( = ?auto_377412 ?auto_377416 ) ) ( not ( = ?auto_377412 ?auto_377417 ) ) ( not ( = ?auto_377412 ?auto_377418 ) ) ( not ( = ?auto_377412 ?auto_377419 ) ) ( not ( = ?auto_377412 ?auto_377420 ) ) ( not ( = ?auto_377412 ?auto_377421 ) ) ( not ( = ?auto_377413 ?auto_377414 ) ) ( not ( = ?auto_377413 ?auto_377415 ) ) ( not ( = ?auto_377413 ?auto_377416 ) ) ( not ( = ?auto_377413 ?auto_377417 ) ) ( not ( = ?auto_377413 ?auto_377418 ) ) ( not ( = ?auto_377413 ?auto_377419 ) ) ( not ( = ?auto_377413 ?auto_377420 ) ) ( not ( = ?auto_377413 ?auto_377421 ) ) ( not ( = ?auto_377414 ?auto_377415 ) ) ( not ( = ?auto_377414 ?auto_377416 ) ) ( not ( = ?auto_377414 ?auto_377417 ) ) ( not ( = ?auto_377414 ?auto_377418 ) ) ( not ( = ?auto_377414 ?auto_377419 ) ) ( not ( = ?auto_377414 ?auto_377420 ) ) ( not ( = ?auto_377414 ?auto_377421 ) ) ( not ( = ?auto_377415 ?auto_377416 ) ) ( not ( = ?auto_377415 ?auto_377417 ) ) ( not ( = ?auto_377415 ?auto_377418 ) ) ( not ( = ?auto_377415 ?auto_377419 ) ) ( not ( = ?auto_377415 ?auto_377420 ) ) ( not ( = ?auto_377415 ?auto_377421 ) ) ( not ( = ?auto_377416 ?auto_377417 ) ) ( not ( = ?auto_377416 ?auto_377418 ) ) ( not ( = ?auto_377416 ?auto_377419 ) ) ( not ( = ?auto_377416 ?auto_377420 ) ) ( not ( = ?auto_377416 ?auto_377421 ) ) ( not ( = ?auto_377417 ?auto_377418 ) ) ( not ( = ?auto_377417 ?auto_377419 ) ) ( not ( = ?auto_377417 ?auto_377420 ) ) ( not ( = ?auto_377417 ?auto_377421 ) ) ( not ( = ?auto_377418 ?auto_377419 ) ) ( not ( = ?auto_377418 ?auto_377420 ) ) ( not ( = ?auto_377418 ?auto_377421 ) ) ( not ( = ?auto_377419 ?auto_377420 ) ) ( not ( = ?auto_377419 ?auto_377421 ) ) ( not ( = ?auto_377420 ?auto_377421 ) ) ( ON ?auto_377419 ?auto_377420 ) ( ON ?auto_377418 ?auto_377419 ) ( ON ?auto_377417 ?auto_377418 ) ( ON ?auto_377416 ?auto_377417 ) ( ON ?auto_377415 ?auto_377416 ) ( CLEAR ?auto_377413 ) ( ON ?auto_377414 ?auto_377415 ) ( CLEAR ?auto_377414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_377412 ?auto_377413 ?auto_377414 )
      ( MAKE-9PILE ?auto_377412 ?auto_377413 ?auto_377414 ?auto_377415 ?auto_377416 ?auto_377417 ?auto_377418 ?auto_377419 ?auto_377420 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377431 - BLOCK
      ?auto_377432 - BLOCK
      ?auto_377433 - BLOCK
      ?auto_377434 - BLOCK
      ?auto_377435 - BLOCK
      ?auto_377436 - BLOCK
      ?auto_377437 - BLOCK
      ?auto_377438 - BLOCK
      ?auto_377439 - BLOCK
    )
    :vars
    (
      ?auto_377440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377439 ?auto_377440 ) ( ON-TABLE ?auto_377431 ) ( not ( = ?auto_377431 ?auto_377432 ) ) ( not ( = ?auto_377431 ?auto_377433 ) ) ( not ( = ?auto_377431 ?auto_377434 ) ) ( not ( = ?auto_377431 ?auto_377435 ) ) ( not ( = ?auto_377431 ?auto_377436 ) ) ( not ( = ?auto_377431 ?auto_377437 ) ) ( not ( = ?auto_377431 ?auto_377438 ) ) ( not ( = ?auto_377431 ?auto_377439 ) ) ( not ( = ?auto_377431 ?auto_377440 ) ) ( not ( = ?auto_377432 ?auto_377433 ) ) ( not ( = ?auto_377432 ?auto_377434 ) ) ( not ( = ?auto_377432 ?auto_377435 ) ) ( not ( = ?auto_377432 ?auto_377436 ) ) ( not ( = ?auto_377432 ?auto_377437 ) ) ( not ( = ?auto_377432 ?auto_377438 ) ) ( not ( = ?auto_377432 ?auto_377439 ) ) ( not ( = ?auto_377432 ?auto_377440 ) ) ( not ( = ?auto_377433 ?auto_377434 ) ) ( not ( = ?auto_377433 ?auto_377435 ) ) ( not ( = ?auto_377433 ?auto_377436 ) ) ( not ( = ?auto_377433 ?auto_377437 ) ) ( not ( = ?auto_377433 ?auto_377438 ) ) ( not ( = ?auto_377433 ?auto_377439 ) ) ( not ( = ?auto_377433 ?auto_377440 ) ) ( not ( = ?auto_377434 ?auto_377435 ) ) ( not ( = ?auto_377434 ?auto_377436 ) ) ( not ( = ?auto_377434 ?auto_377437 ) ) ( not ( = ?auto_377434 ?auto_377438 ) ) ( not ( = ?auto_377434 ?auto_377439 ) ) ( not ( = ?auto_377434 ?auto_377440 ) ) ( not ( = ?auto_377435 ?auto_377436 ) ) ( not ( = ?auto_377435 ?auto_377437 ) ) ( not ( = ?auto_377435 ?auto_377438 ) ) ( not ( = ?auto_377435 ?auto_377439 ) ) ( not ( = ?auto_377435 ?auto_377440 ) ) ( not ( = ?auto_377436 ?auto_377437 ) ) ( not ( = ?auto_377436 ?auto_377438 ) ) ( not ( = ?auto_377436 ?auto_377439 ) ) ( not ( = ?auto_377436 ?auto_377440 ) ) ( not ( = ?auto_377437 ?auto_377438 ) ) ( not ( = ?auto_377437 ?auto_377439 ) ) ( not ( = ?auto_377437 ?auto_377440 ) ) ( not ( = ?auto_377438 ?auto_377439 ) ) ( not ( = ?auto_377438 ?auto_377440 ) ) ( not ( = ?auto_377439 ?auto_377440 ) ) ( ON ?auto_377438 ?auto_377439 ) ( ON ?auto_377437 ?auto_377438 ) ( ON ?auto_377436 ?auto_377437 ) ( ON ?auto_377435 ?auto_377436 ) ( ON ?auto_377434 ?auto_377435 ) ( ON ?auto_377433 ?auto_377434 ) ( CLEAR ?auto_377431 ) ( ON ?auto_377432 ?auto_377433 ) ( CLEAR ?auto_377432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_377431 ?auto_377432 )
      ( MAKE-9PILE ?auto_377431 ?auto_377432 ?auto_377433 ?auto_377434 ?auto_377435 ?auto_377436 ?auto_377437 ?auto_377438 ?auto_377439 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377450 - BLOCK
      ?auto_377451 - BLOCK
      ?auto_377452 - BLOCK
      ?auto_377453 - BLOCK
      ?auto_377454 - BLOCK
      ?auto_377455 - BLOCK
      ?auto_377456 - BLOCK
      ?auto_377457 - BLOCK
      ?auto_377458 - BLOCK
    )
    :vars
    (
      ?auto_377459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377458 ?auto_377459 ) ( ON-TABLE ?auto_377450 ) ( not ( = ?auto_377450 ?auto_377451 ) ) ( not ( = ?auto_377450 ?auto_377452 ) ) ( not ( = ?auto_377450 ?auto_377453 ) ) ( not ( = ?auto_377450 ?auto_377454 ) ) ( not ( = ?auto_377450 ?auto_377455 ) ) ( not ( = ?auto_377450 ?auto_377456 ) ) ( not ( = ?auto_377450 ?auto_377457 ) ) ( not ( = ?auto_377450 ?auto_377458 ) ) ( not ( = ?auto_377450 ?auto_377459 ) ) ( not ( = ?auto_377451 ?auto_377452 ) ) ( not ( = ?auto_377451 ?auto_377453 ) ) ( not ( = ?auto_377451 ?auto_377454 ) ) ( not ( = ?auto_377451 ?auto_377455 ) ) ( not ( = ?auto_377451 ?auto_377456 ) ) ( not ( = ?auto_377451 ?auto_377457 ) ) ( not ( = ?auto_377451 ?auto_377458 ) ) ( not ( = ?auto_377451 ?auto_377459 ) ) ( not ( = ?auto_377452 ?auto_377453 ) ) ( not ( = ?auto_377452 ?auto_377454 ) ) ( not ( = ?auto_377452 ?auto_377455 ) ) ( not ( = ?auto_377452 ?auto_377456 ) ) ( not ( = ?auto_377452 ?auto_377457 ) ) ( not ( = ?auto_377452 ?auto_377458 ) ) ( not ( = ?auto_377452 ?auto_377459 ) ) ( not ( = ?auto_377453 ?auto_377454 ) ) ( not ( = ?auto_377453 ?auto_377455 ) ) ( not ( = ?auto_377453 ?auto_377456 ) ) ( not ( = ?auto_377453 ?auto_377457 ) ) ( not ( = ?auto_377453 ?auto_377458 ) ) ( not ( = ?auto_377453 ?auto_377459 ) ) ( not ( = ?auto_377454 ?auto_377455 ) ) ( not ( = ?auto_377454 ?auto_377456 ) ) ( not ( = ?auto_377454 ?auto_377457 ) ) ( not ( = ?auto_377454 ?auto_377458 ) ) ( not ( = ?auto_377454 ?auto_377459 ) ) ( not ( = ?auto_377455 ?auto_377456 ) ) ( not ( = ?auto_377455 ?auto_377457 ) ) ( not ( = ?auto_377455 ?auto_377458 ) ) ( not ( = ?auto_377455 ?auto_377459 ) ) ( not ( = ?auto_377456 ?auto_377457 ) ) ( not ( = ?auto_377456 ?auto_377458 ) ) ( not ( = ?auto_377456 ?auto_377459 ) ) ( not ( = ?auto_377457 ?auto_377458 ) ) ( not ( = ?auto_377457 ?auto_377459 ) ) ( not ( = ?auto_377458 ?auto_377459 ) ) ( ON ?auto_377457 ?auto_377458 ) ( ON ?auto_377456 ?auto_377457 ) ( ON ?auto_377455 ?auto_377456 ) ( ON ?auto_377454 ?auto_377455 ) ( ON ?auto_377453 ?auto_377454 ) ( ON ?auto_377452 ?auto_377453 ) ( CLEAR ?auto_377450 ) ( ON ?auto_377451 ?auto_377452 ) ( CLEAR ?auto_377451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_377450 ?auto_377451 )
      ( MAKE-9PILE ?auto_377450 ?auto_377451 ?auto_377452 ?auto_377453 ?auto_377454 ?auto_377455 ?auto_377456 ?auto_377457 ?auto_377458 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377469 - BLOCK
      ?auto_377470 - BLOCK
      ?auto_377471 - BLOCK
      ?auto_377472 - BLOCK
      ?auto_377473 - BLOCK
      ?auto_377474 - BLOCK
      ?auto_377475 - BLOCK
      ?auto_377476 - BLOCK
      ?auto_377477 - BLOCK
    )
    :vars
    (
      ?auto_377478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377477 ?auto_377478 ) ( not ( = ?auto_377469 ?auto_377470 ) ) ( not ( = ?auto_377469 ?auto_377471 ) ) ( not ( = ?auto_377469 ?auto_377472 ) ) ( not ( = ?auto_377469 ?auto_377473 ) ) ( not ( = ?auto_377469 ?auto_377474 ) ) ( not ( = ?auto_377469 ?auto_377475 ) ) ( not ( = ?auto_377469 ?auto_377476 ) ) ( not ( = ?auto_377469 ?auto_377477 ) ) ( not ( = ?auto_377469 ?auto_377478 ) ) ( not ( = ?auto_377470 ?auto_377471 ) ) ( not ( = ?auto_377470 ?auto_377472 ) ) ( not ( = ?auto_377470 ?auto_377473 ) ) ( not ( = ?auto_377470 ?auto_377474 ) ) ( not ( = ?auto_377470 ?auto_377475 ) ) ( not ( = ?auto_377470 ?auto_377476 ) ) ( not ( = ?auto_377470 ?auto_377477 ) ) ( not ( = ?auto_377470 ?auto_377478 ) ) ( not ( = ?auto_377471 ?auto_377472 ) ) ( not ( = ?auto_377471 ?auto_377473 ) ) ( not ( = ?auto_377471 ?auto_377474 ) ) ( not ( = ?auto_377471 ?auto_377475 ) ) ( not ( = ?auto_377471 ?auto_377476 ) ) ( not ( = ?auto_377471 ?auto_377477 ) ) ( not ( = ?auto_377471 ?auto_377478 ) ) ( not ( = ?auto_377472 ?auto_377473 ) ) ( not ( = ?auto_377472 ?auto_377474 ) ) ( not ( = ?auto_377472 ?auto_377475 ) ) ( not ( = ?auto_377472 ?auto_377476 ) ) ( not ( = ?auto_377472 ?auto_377477 ) ) ( not ( = ?auto_377472 ?auto_377478 ) ) ( not ( = ?auto_377473 ?auto_377474 ) ) ( not ( = ?auto_377473 ?auto_377475 ) ) ( not ( = ?auto_377473 ?auto_377476 ) ) ( not ( = ?auto_377473 ?auto_377477 ) ) ( not ( = ?auto_377473 ?auto_377478 ) ) ( not ( = ?auto_377474 ?auto_377475 ) ) ( not ( = ?auto_377474 ?auto_377476 ) ) ( not ( = ?auto_377474 ?auto_377477 ) ) ( not ( = ?auto_377474 ?auto_377478 ) ) ( not ( = ?auto_377475 ?auto_377476 ) ) ( not ( = ?auto_377475 ?auto_377477 ) ) ( not ( = ?auto_377475 ?auto_377478 ) ) ( not ( = ?auto_377476 ?auto_377477 ) ) ( not ( = ?auto_377476 ?auto_377478 ) ) ( not ( = ?auto_377477 ?auto_377478 ) ) ( ON ?auto_377476 ?auto_377477 ) ( ON ?auto_377475 ?auto_377476 ) ( ON ?auto_377474 ?auto_377475 ) ( ON ?auto_377473 ?auto_377474 ) ( ON ?auto_377472 ?auto_377473 ) ( ON ?auto_377471 ?auto_377472 ) ( ON ?auto_377470 ?auto_377471 ) ( ON ?auto_377469 ?auto_377470 ) ( CLEAR ?auto_377469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_377469 )
      ( MAKE-9PILE ?auto_377469 ?auto_377470 ?auto_377471 ?auto_377472 ?auto_377473 ?auto_377474 ?auto_377475 ?auto_377476 ?auto_377477 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_377488 - BLOCK
      ?auto_377489 - BLOCK
      ?auto_377490 - BLOCK
      ?auto_377491 - BLOCK
      ?auto_377492 - BLOCK
      ?auto_377493 - BLOCK
      ?auto_377494 - BLOCK
      ?auto_377495 - BLOCK
      ?auto_377496 - BLOCK
    )
    :vars
    (
      ?auto_377497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377496 ?auto_377497 ) ( not ( = ?auto_377488 ?auto_377489 ) ) ( not ( = ?auto_377488 ?auto_377490 ) ) ( not ( = ?auto_377488 ?auto_377491 ) ) ( not ( = ?auto_377488 ?auto_377492 ) ) ( not ( = ?auto_377488 ?auto_377493 ) ) ( not ( = ?auto_377488 ?auto_377494 ) ) ( not ( = ?auto_377488 ?auto_377495 ) ) ( not ( = ?auto_377488 ?auto_377496 ) ) ( not ( = ?auto_377488 ?auto_377497 ) ) ( not ( = ?auto_377489 ?auto_377490 ) ) ( not ( = ?auto_377489 ?auto_377491 ) ) ( not ( = ?auto_377489 ?auto_377492 ) ) ( not ( = ?auto_377489 ?auto_377493 ) ) ( not ( = ?auto_377489 ?auto_377494 ) ) ( not ( = ?auto_377489 ?auto_377495 ) ) ( not ( = ?auto_377489 ?auto_377496 ) ) ( not ( = ?auto_377489 ?auto_377497 ) ) ( not ( = ?auto_377490 ?auto_377491 ) ) ( not ( = ?auto_377490 ?auto_377492 ) ) ( not ( = ?auto_377490 ?auto_377493 ) ) ( not ( = ?auto_377490 ?auto_377494 ) ) ( not ( = ?auto_377490 ?auto_377495 ) ) ( not ( = ?auto_377490 ?auto_377496 ) ) ( not ( = ?auto_377490 ?auto_377497 ) ) ( not ( = ?auto_377491 ?auto_377492 ) ) ( not ( = ?auto_377491 ?auto_377493 ) ) ( not ( = ?auto_377491 ?auto_377494 ) ) ( not ( = ?auto_377491 ?auto_377495 ) ) ( not ( = ?auto_377491 ?auto_377496 ) ) ( not ( = ?auto_377491 ?auto_377497 ) ) ( not ( = ?auto_377492 ?auto_377493 ) ) ( not ( = ?auto_377492 ?auto_377494 ) ) ( not ( = ?auto_377492 ?auto_377495 ) ) ( not ( = ?auto_377492 ?auto_377496 ) ) ( not ( = ?auto_377492 ?auto_377497 ) ) ( not ( = ?auto_377493 ?auto_377494 ) ) ( not ( = ?auto_377493 ?auto_377495 ) ) ( not ( = ?auto_377493 ?auto_377496 ) ) ( not ( = ?auto_377493 ?auto_377497 ) ) ( not ( = ?auto_377494 ?auto_377495 ) ) ( not ( = ?auto_377494 ?auto_377496 ) ) ( not ( = ?auto_377494 ?auto_377497 ) ) ( not ( = ?auto_377495 ?auto_377496 ) ) ( not ( = ?auto_377495 ?auto_377497 ) ) ( not ( = ?auto_377496 ?auto_377497 ) ) ( ON ?auto_377495 ?auto_377496 ) ( ON ?auto_377494 ?auto_377495 ) ( ON ?auto_377493 ?auto_377494 ) ( ON ?auto_377492 ?auto_377493 ) ( ON ?auto_377491 ?auto_377492 ) ( ON ?auto_377490 ?auto_377491 ) ( ON ?auto_377489 ?auto_377490 ) ( ON ?auto_377488 ?auto_377489 ) ( CLEAR ?auto_377488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_377488 )
      ( MAKE-9PILE ?auto_377488 ?auto_377489 ?auto_377490 ?auto_377491 ?auto_377492 ?auto_377493 ?auto_377494 ?auto_377495 ?auto_377496 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377508 - BLOCK
      ?auto_377509 - BLOCK
      ?auto_377510 - BLOCK
      ?auto_377511 - BLOCK
      ?auto_377512 - BLOCK
      ?auto_377513 - BLOCK
      ?auto_377514 - BLOCK
      ?auto_377515 - BLOCK
      ?auto_377516 - BLOCK
      ?auto_377517 - BLOCK
    )
    :vars
    (
      ?auto_377518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_377516 ) ( ON ?auto_377517 ?auto_377518 ) ( CLEAR ?auto_377517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_377508 ) ( ON ?auto_377509 ?auto_377508 ) ( ON ?auto_377510 ?auto_377509 ) ( ON ?auto_377511 ?auto_377510 ) ( ON ?auto_377512 ?auto_377511 ) ( ON ?auto_377513 ?auto_377512 ) ( ON ?auto_377514 ?auto_377513 ) ( ON ?auto_377515 ?auto_377514 ) ( ON ?auto_377516 ?auto_377515 ) ( not ( = ?auto_377508 ?auto_377509 ) ) ( not ( = ?auto_377508 ?auto_377510 ) ) ( not ( = ?auto_377508 ?auto_377511 ) ) ( not ( = ?auto_377508 ?auto_377512 ) ) ( not ( = ?auto_377508 ?auto_377513 ) ) ( not ( = ?auto_377508 ?auto_377514 ) ) ( not ( = ?auto_377508 ?auto_377515 ) ) ( not ( = ?auto_377508 ?auto_377516 ) ) ( not ( = ?auto_377508 ?auto_377517 ) ) ( not ( = ?auto_377508 ?auto_377518 ) ) ( not ( = ?auto_377509 ?auto_377510 ) ) ( not ( = ?auto_377509 ?auto_377511 ) ) ( not ( = ?auto_377509 ?auto_377512 ) ) ( not ( = ?auto_377509 ?auto_377513 ) ) ( not ( = ?auto_377509 ?auto_377514 ) ) ( not ( = ?auto_377509 ?auto_377515 ) ) ( not ( = ?auto_377509 ?auto_377516 ) ) ( not ( = ?auto_377509 ?auto_377517 ) ) ( not ( = ?auto_377509 ?auto_377518 ) ) ( not ( = ?auto_377510 ?auto_377511 ) ) ( not ( = ?auto_377510 ?auto_377512 ) ) ( not ( = ?auto_377510 ?auto_377513 ) ) ( not ( = ?auto_377510 ?auto_377514 ) ) ( not ( = ?auto_377510 ?auto_377515 ) ) ( not ( = ?auto_377510 ?auto_377516 ) ) ( not ( = ?auto_377510 ?auto_377517 ) ) ( not ( = ?auto_377510 ?auto_377518 ) ) ( not ( = ?auto_377511 ?auto_377512 ) ) ( not ( = ?auto_377511 ?auto_377513 ) ) ( not ( = ?auto_377511 ?auto_377514 ) ) ( not ( = ?auto_377511 ?auto_377515 ) ) ( not ( = ?auto_377511 ?auto_377516 ) ) ( not ( = ?auto_377511 ?auto_377517 ) ) ( not ( = ?auto_377511 ?auto_377518 ) ) ( not ( = ?auto_377512 ?auto_377513 ) ) ( not ( = ?auto_377512 ?auto_377514 ) ) ( not ( = ?auto_377512 ?auto_377515 ) ) ( not ( = ?auto_377512 ?auto_377516 ) ) ( not ( = ?auto_377512 ?auto_377517 ) ) ( not ( = ?auto_377512 ?auto_377518 ) ) ( not ( = ?auto_377513 ?auto_377514 ) ) ( not ( = ?auto_377513 ?auto_377515 ) ) ( not ( = ?auto_377513 ?auto_377516 ) ) ( not ( = ?auto_377513 ?auto_377517 ) ) ( not ( = ?auto_377513 ?auto_377518 ) ) ( not ( = ?auto_377514 ?auto_377515 ) ) ( not ( = ?auto_377514 ?auto_377516 ) ) ( not ( = ?auto_377514 ?auto_377517 ) ) ( not ( = ?auto_377514 ?auto_377518 ) ) ( not ( = ?auto_377515 ?auto_377516 ) ) ( not ( = ?auto_377515 ?auto_377517 ) ) ( not ( = ?auto_377515 ?auto_377518 ) ) ( not ( = ?auto_377516 ?auto_377517 ) ) ( not ( = ?auto_377516 ?auto_377518 ) ) ( not ( = ?auto_377517 ?auto_377518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_377517 ?auto_377518 )
      ( !STACK ?auto_377517 ?auto_377516 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377529 - BLOCK
      ?auto_377530 - BLOCK
      ?auto_377531 - BLOCK
      ?auto_377532 - BLOCK
      ?auto_377533 - BLOCK
      ?auto_377534 - BLOCK
      ?auto_377535 - BLOCK
      ?auto_377536 - BLOCK
      ?auto_377537 - BLOCK
      ?auto_377538 - BLOCK
    )
    :vars
    (
      ?auto_377539 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_377537 ) ( ON ?auto_377538 ?auto_377539 ) ( CLEAR ?auto_377538 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_377529 ) ( ON ?auto_377530 ?auto_377529 ) ( ON ?auto_377531 ?auto_377530 ) ( ON ?auto_377532 ?auto_377531 ) ( ON ?auto_377533 ?auto_377532 ) ( ON ?auto_377534 ?auto_377533 ) ( ON ?auto_377535 ?auto_377534 ) ( ON ?auto_377536 ?auto_377535 ) ( ON ?auto_377537 ?auto_377536 ) ( not ( = ?auto_377529 ?auto_377530 ) ) ( not ( = ?auto_377529 ?auto_377531 ) ) ( not ( = ?auto_377529 ?auto_377532 ) ) ( not ( = ?auto_377529 ?auto_377533 ) ) ( not ( = ?auto_377529 ?auto_377534 ) ) ( not ( = ?auto_377529 ?auto_377535 ) ) ( not ( = ?auto_377529 ?auto_377536 ) ) ( not ( = ?auto_377529 ?auto_377537 ) ) ( not ( = ?auto_377529 ?auto_377538 ) ) ( not ( = ?auto_377529 ?auto_377539 ) ) ( not ( = ?auto_377530 ?auto_377531 ) ) ( not ( = ?auto_377530 ?auto_377532 ) ) ( not ( = ?auto_377530 ?auto_377533 ) ) ( not ( = ?auto_377530 ?auto_377534 ) ) ( not ( = ?auto_377530 ?auto_377535 ) ) ( not ( = ?auto_377530 ?auto_377536 ) ) ( not ( = ?auto_377530 ?auto_377537 ) ) ( not ( = ?auto_377530 ?auto_377538 ) ) ( not ( = ?auto_377530 ?auto_377539 ) ) ( not ( = ?auto_377531 ?auto_377532 ) ) ( not ( = ?auto_377531 ?auto_377533 ) ) ( not ( = ?auto_377531 ?auto_377534 ) ) ( not ( = ?auto_377531 ?auto_377535 ) ) ( not ( = ?auto_377531 ?auto_377536 ) ) ( not ( = ?auto_377531 ?auto_377537 ) ) ( not ( = ?auto_377531 ?auto_377538 ) ) ( not ( = ?auto_377531 ?auto_377539 ) ) ( not ( = ?auto_377532 ?auto_377533 ) ) ( not ( = ?auto_377532 ?auto_377534 ) ) ( not ( = ?auto_377532 ?auto_377535 ) ) ( not ( = ?auto_377532 ?auto_377536 ) ) ( not ( = ?auto_377532 ?auto_377537 ) ) ( not ( = ?auto_377532 ?auto_377538 ) ) ( not ( = ?auto_377532 ?auto_377539 ) ) ( not ( = ?auto_377533 ?auto_377534 ) ) ( not ( = ?auto_377533 ?auto_377535 ) ) ( not ( = ?auto_377533 ?auto_377536 ) ) ( not ( = ?auto_377533 ?auto_377537 ) ) ( not ( = ?auto_377533 ?auto_377538 ) ) ( not ( = ?auto_377533 ?auto_377539 ) ) ( not ( = ?auto_377534 ?auto_377535 ) ) ( not ( = ?auto_377534 ?auto_377536 ) ) ( not ( = ?auto_377534 ?auto_377537 ) ) ( not ( = ?auto_377534 ?auto_377538 ) ) ( not ( = ?auto_377534 ?auto_377539 ) ) ( not ( = ?auto_377535 ?auto_377536 ) ) ( not ( = ?auto_377535 ?auto_377537 ) ) ( not ( = ?auto_377535 ?auto_377538 ) ) ( not ( = ?auto_377535 ?auto_377539 ) ) ( not ( = ?auto_377536 ?auto_377537 ) ) ( not ( = ?auto_377536 ?auto_377538 ) ) ( not ( = ?auto_377536 ?auto_377539 ) ) ( not ( = ?auto_377537 ?auto_377538 ) ) ( not ( = ?auto_377537 ?auto_377539 ) ) ( not ( = ?auto_377538 ?auto_377539 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_377538 ?auto_377539 )
      ( !STACK ?auto_377538 ?auto_377537 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377550 - BLOCK
      ?auto_377551 - BLOCK
      ?auto_377552 - BLOCK
      ?auto_377553 - BLOCK
      ?auto_377554 - BLOCK
      ?auto_377555 - BLOCK
      ?auto_377556 - BLOCK
      ?auto_377557 - BLOCK
      ?auto_377558 - BLOCK
      ?auto_377559 - BLOCK
    )
    :vars
    (
      ?auto_377560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377559 ?auto_377560 ) ( ON-TABLE ?auto_377550 ) ( ON ?auto_377551 ?auto_377550 ) ( ON ?auto_377552 ?auto_377551 ) ( ON ?auto_377553 ?auto_377552 ) ( ON ?auto_377554 ?auto_377553 ) ( ON ?auto_377555 ?auto_377554 ) ( ON ?auto_377556 ?auto_377555 ) ( ON ?auto_377557 ?auto_377556 ) ( not ( = ?auto_377550 ?auto_377551 ) ) ( not ( = ?auto_377550 ?auto_377552 ) ) ( not ( = ?auto_377550 ?auto_377553 ) ) ( not ( = ?auto_377550 ?auto_377554 ) ) ( not ( = ?auto_377550 ?auto_377555 ) ) ( not ( = ?auto_377550 ?auto_377556 ) ) ( not ( = ?auto_377550 ?auto_377557 ) ) ( not ( = ?auto_377550 ?auto_377558 ) ) ( not ( = ?auto_377550 ?auto_377559 ) ) ( not ( = ?auto_377550 ?auto_377560 ) ) ( not ( = ?auto_377551 ?auto_377552 ) ) ( not ( = ?auto_377551 ?auto_377553 ) ) ( not ( = ?auto_377551 ?auto_377554 ) ) ( not ( = ?auto_377551 ?auto_377555 ) ) ( not ( = ?auto_377551 ?auto_377556 ) ) ( not ( = ?auto_377551 ?auto_377557 ) ) ( not ( = ?auto_377551 ?auto_377558 ) ) ( not ( = ?auto_377551 ?auto_377559 ) ) ( not ( = ?auto_377551 ?auto_377560 ) ) ( not ( = ?auto_377552 ?auto_377553 ) ) ( not ( = ?auto_377552 ?auto_377554 ) ) ( not ( = ?auto_377552 ?auto_377555 ) ) ( not ( = ?auto_377552 ?auto_377556 ) ) ( not ( = ?auto_377552 ?auto_377557 ) ) ( not ( = ?auto_377552 ?auto_377558 ) ) ( not ( = ?auto_377552 ?auto_377559 ) ) ( not ( = ?auto_377552 ?auto_377560 ) ) ( not ( = ?auto_377553 ?auto_377554 ) ) ( not ( = ?auto_377553 ?auto_377555 ) ) ( not ( = ?auto_377553 ?auto_377556 ) ) ( not ( = ?auto_377553 ?auto_377557 ) ) ( not ( = ?auto_377553 ?auto_377558 ) ) ( not ( = ?auto_377553 ?auto_377559 ) ) ( not ( = ?auto_377553 ?auto_377560 ) ) ( not ( = ?auto_377554 ?auto_377555 ) ) ( not ( = ?auto_377554 ?auto_377556 ) ) ( not ( = ?auto_377554 ?auto_377557 ) ) ( not ( = ?auto_377554 ?auto_377558 ) ) ( not ( = ?auto_377554 ?auto_377559 ) ) ( not ( = ?auto_377554 ?auto_377560 ) ) ( not ( = ?auto_377555 ?auto_377556 ) ) ( not ( = ?auto_377555 ?auto_377557 ) ) ( not ( = ?auto_377555 ?auto_377558 ) ) ( not ( = ?auto_377555 ?auto_377559 ) ) ( not ( = ?auto_377555 ?auto_377560 ) ) ( not ( = ?auto_377556 ?auto_377557 ) ) ( not ( = ?auto_377556 ?auto_377558 ) ) ( not ( = ?auto_377556 ?auto_377559 ) ) ( not ( = ?auto_377556 ?auto_377560 ) ) ( not ( = ?auto_377557 ?auto_377558 ) ) ( not ( = ?auto_377557 ?auto_377559 ) ) ( not ( = ?auto_377557 ?auto_377560 ) ) ( not ( = ?auto_377558 ?auto_377559 ) ) ( not ( = ?auto_377558 ?auto_377560 ) ) ( not ( = ?auto_377559 ?auto_377560 ) ) ( CLEAR ?auto_377557 ) ( ON ?auto_377558 ?auto_377559 ) ( CLEAR ?auto_377558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_377550 ?auto_377551 ?auto_377552 ?auto_377553 ?auto_377554 ?auto_377555 ?auto_377556 ?auto_377557 ?auto_377558 )
      ( MAKE-10PILE ?auto_377550 ?auto_377551 ?auto_377552 ?auto_377553 ?auto_377554 ?auto_377555 ?auto_377556 ?auto_377557 ?auto_377558 ?auto_377559 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377571 - BLOCK
      ?auto_377572 - BLOCK
      ?auto_377573 - BLOCK
      ?auto_377574 - BLOCK
      ?auto_377575 - BLOCK
      ?auto_377576 - BLOCK
      ?auto_377577 - BLOCK
      ?auto_377578 - BLOCK
      ?auto_377579 - BLOCK
      ?auto_377580 - BLOCK
    )
    :vars
    (
      ?auto_377581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377580 ?auto_377581 ) ( ON-TABLE ?auto_377571 ) ( ON ?auto_377572 ?auto_377571 ) ( ON ?auto_377573 ?auto_377572 ) ( ON ?auto_377574 ?auto_377573 ) ( ON ?auto_377575 ?auto_377574 ) ( ON ?auto_377576 ?auto_377575 ) ( ON ?auto_377577 ?auto_377576 ) ( ON ?auto_377578 ?auto_377577 ) ( not ( = ?auto_377571 ?auto_377572 ) ) ( not ( = ?auto_377571 ?auto_377573 ) ) ( not ( = ?auto_377571 ?auto_377574 ) ) ( not ( = ?auto_377571 ?auto_377575 ) ) ( not ( = ?auto_377571 ?auto_377576 ) ) ( not ( = ?auto_377571 ?auto_377577 ) ) ( not ( = ?auto_377571 ?auto_377578 ) ) ( not ( = ?auto_377571 ?auto_377579 ) ) ( not ( = ?auto_377571 ?auto_377580 ) ) ( not ( = ?auto_377571 ?auto_377581 ) ) ( not ( = ?auto_377572 ?auto_377573 ) ) ( not ( = ?auto_377572 ?auto_377574 ) ) ( not ( = ?auto_377572 ?auto_377575 ) ) ( not ( = ?auto_377572 ?auto_377576 ) ) ( not ( = ?auto_377572 ?auto_377577 ) ) ( not ( = ?auto_377572 ?auto_377578 ) ) ( not ( = ?auto_377572 ?auto_377579 ) ) ( not ( = ?auto_377572 ?auto_377580 ) ) ( not ( = ?auto_377572 ?auto_377581 ) ) ( not ( = ?auto_377573 ?auto_377574 ) ) ( not ( = ?auto_377573 ?auto_377575 ) ) ( not ( = ?auto_377573 ?auto_377576 ) ) ( not ( = ?auto_377573 ?auto_377577 ) ) ( not ( = ?auto_377573 ?auto_377578 ) ) ( not ( = ?auto_377573 ?auto_377579 ) ) ( not ( = ?auto_377573 ?auto_377580 ) ) ( not ( = ?auto_377573 ?auto_377581 ) ) ( not ( = ?auto_377574 ?auto_377575 ) ) ( not ( = ?auto_377574 ?auto_377576 ) ) ( not ( = ?auto_377574 ?auto_377577 ) ) ( not ( = ?auto_377574 ?auto_377578 ) ) ( not ( = ?auto_377574 ?auto_377579 ) ) ( not ( = ?auto_377574 ?auto_377580 ) ) ( not ( = ?auto_377574 ?auto_377581 ) ) ( not ( = ?auto_377575 ?auto_377576 ) ) ( not ( = ?auto_377575 ?auto_377577 ) ) ( not ( = ?auto_377575 ?auto_377578 ) ) ( not ( = ?auto_377575 ?auto_377579 ) ) ( not ( = ?auto_377575 ?auto_377580 ) ) ( not ( = ?auto_377575 ?auto_377581 ) ) ( not ( = ?auto_377576 ?auto_377577 ) ) ( not ( = ?auto_377576 ?auto_377578 ) ) ( not ( = ?auto_377576 ?auto_377579 ) ) ( not ( = ?auto_377576 ?auto_377580 ) ) ( not ( = ?auto_377576 ?auto_377581 ) ) ( not ( = ?auto_377577 ?auto_377578 ) ) ( not ( = ?auto_377577 ?auto_377579 ) ) ( not ( = ?auto_377577 ?auto_377580 ) ) ( not ( = ?auto_377577 ?auto_377581 ) ) ( not ( = ?auto_377578 ?auto_377579 ) ) ( not ( = ?auto_377578 ?auto_377580 ) ) ( not ( = ?auto_377578 ?auto_377581 ) ) ( not ( = ?auto_377579 ?auto_377580 ) ) ( not ( = ?auto_377579 ?auto_377581 ) ) ( not ( = ?auto_377580 ?auto_377581 ) ) ( CLEAR ?auto_377578 ) ( ON ?auto_377579 ?auto_377580 ) ( CLEAR ?auto_377579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_377571 ?auto_377572 ?auto_377573 ?auto_377574 ?auto_377575 ?auto_377576 ?auto_377577 ?auto_377578 ?auto_377579 )
      ( MAKE-10PILE ?auto_377571 ?auto_377572 ?auto_377573 ?auto_377574 ?auto_377575 ?auto_377576 ?auto_377577 ?auto_377578 ?auto_377579 ?auto_377580 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377592 - BLOCK
      ?auto_377593 - BLOCK
      ?auto_377594 - BLOCK
      ?auto_377595 - BLOCK
      ?auto_377596 - BLOCK
      ?auto_377597 - BLOCK
      ?auto_377598 - BLOCK
      ?auto_377599 - BLOCK
      ?auto_377600 - BLOCK
      ?auto_377601 - BLOCK
    )
    :vars
    (
      ?auto_377602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377601 ?auto_377602 ) ( ON-TABLE ?auto_377592 ) ( ON ?auto_377593 ?auto_377592 ) ( ON ?auto_377594 ?auto_377593 ) ( ON ?auto_377595 ?auto_377594 ) ( ON ?auto_377596 ?auto_377595 ) ( ON ?auto_377597 ?auto_377596 ) ( ON ?auto_377598 ?auto_377597 ) ( not ( = ?auto_377592 ?auto_377593 ) ) ( not ( = ?auto_377592 ?auto_377594 ) ) ( not ( = ?auto_377592 ?auto_377595 ) ) ( not ( = ?auto_377592 ?auto_377596 ) ) ( not ( = ?auto_377592 ?auto_377597 ) ) ( not ( = ?auto_377592 ?auto_377598 ) ) ( not ( = ?auto_377592 ?auto_377599 ) ) ( not ( = ?auto_377592 ?auto_377600 ) ) ( not ( = ?auto_377592 ?auto_377601 ) ) ( not ( = ?auto_377592 ?auto_377602 ) ) ( not ( = ?auto_377593 ?auto_377594 ) ) ( not ( = ?auto_377593 ?auto_377595 ) ) ( not ( = ?auto_377593 ?auto_377596 ) ) ( not ( = ?auto_377593 ?auto_377597 ) ) ( not ( = ?auto_377593 ?auto_377598 ) ) ( not ( = ?auto_377593 ?auto_377599 ) ) ( not ( = ?auto_377593 ?auto_377600 ) ) ( not ( = ?auto_377593 ?auto_377601 ) ) ( not ( = ?auto_377593 ?auto_377602 ) ) ( not ( = ?auto_377594 ?auto_377595 ) ) ( not ( = ?auto_377594 ?auto_377596 ) ) ( not ( = ?auto_377594 ?auto_377597 ) ) ( not ( = ?auto_377594 ?auto_377598 ) ) ( not ( = ?auto_377594 ?auto_377599 ) ) ( not ( = ?auto_377594 ?auto_377600 ) ) ( not ( = ?auto_377594 ?auto_377601 ) ) ( not ( = ?auto_377594 ?auto_377602 ) ) ( not ( = ?auto_377595 ?auto_377596 ) ) ( not ( = ?auto_377595 ?auto_377597 ) ) ( not ( = ?auto_377595 ?auto_377598 ) ) ( not ( = ?auto_377595 ?auto_377599 ) ) ( not ( = ?auto_377595 ?auto_377600 ) ) ( not ( = ?auto_377595 ?auto_377601 ) ) ( not ( = ?auto_377595 ?auto_377602 ) ) ( not ( = ?auto_377596 ?auto_377597 ) ) ( not ( = ?auto_377596 ?auto_377598 ) ) ( not ( = ?auto_377596 ?auto_377599 ) ) ( not ( = ?auto_377596 ?auto_377600 ) ) ( not ( = ?auto_377596 ?auto_377601 ) ) ( not ( = ?auto_377596 ?auto_377602 ) ) ( not ( = ?auto_377597 ?auto_377598 ) ) ( not ( = ?auto_377597 ?auto_377599 ) ) ( not ( = ?auto_377597 ?auto_377600 ) ) ( not ( = ?auto_377597 ?auto_377601 ) ) ( not ( = ?auto_377597 ?auto_377602 ) ) ( not ( = ?auto_377598 ?auto_377599 ) ) ( not ( = ?auto_377598 ?auto_377600 ) ) ( not ( = ?auto_377598 ?auto_377601 ) ) ( not ( = ?auto_377598 ?auto_377602 ) ) ( not ( = ?auto_377599 ?auto_377600 ) ) ( not ( = ?auto_377599 ?auto_377601 ) ) ( not ( = ?auto_377599 ?auto_377602 ) ) ( not ( = ?auto_377600 ?auto_377601 ) ) ( not ( = ?auto_377600 ?auto_377602 ) ) ( not ( = ?auto_377601 ?auto_377602 ) ) ( ON ?auto_377600 ?auto_377601 ) ( CLEAR ?auto_377598 ) ( ON ?auto_377599 ?auto_377600 ) ( CLEAR ?auto_377599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_377592 ?auto_377593 ?auto_377594 ?auto_377595 ?auto_377596 ?auto_377597 ?auto_377598 ?auto_377599 )
      ( MAKE-10PILE ?auto_377592 ?auto_377593 ?auto_377594 ?auto_377595 ?auto_377596 ?auto_377597 ?auto_377598 ?auto_377599 ?auto_377600 ?auto_377601 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377613 - BLOCK
      ?auto_377614 - BLOCK
      ?auto_377615 - BLOCK
      ?auto_377616 - BLOCK
      ?auto_377617 - BLOCK
      ?auto_377618 - BLOCK
      ?auto_377619 - BLOCK
      ?auto_377620 - BLOCK
      ?auto_377621 - BLOCK
      ?auto_377622 - BLOCK
    )
    :vars
    (
      ?auto_377623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377622 ?auto_377623 ) ( ON-TABLE ?auto_377613 ) ( ON ?auto_377614 ?auto_377613 ) ( ON ?auto_377615 ?auto_377614 ) ( ON ?auto_377616 ?auto_377615 ) ( ON ?auto_377617 ?auto_377616 ) ( ON ?auto_377618 ?auto_377617 ) ( ON ?auto_377619 ?auto_377618 ) ( not ( = ?auto_377613 ?auto_377614 ) ) ( not ( = ?auto_377613 ?auto_377615 ) ) ( not ( = ?auto_377613 ?auto_377616 ) ) ( not ( = ?auto_377613 ?auto_377617 ) ) ( not ( = ?auto_377613 ?auto_377618 ) ) ( not ( = ?auto_377613 ?auto_377619 ) ) ( not ( = ?auto_377613 ?auto_377620 ) ) ( not ( = ?auto_377613 ?auto_377621 ) ) ( not ( = ?auto_377613 ?auto_377622 ) ) ( not ( = ?auto_377613 ?auto_377623 ) ) ( not ( = ?auto_377614 ?auto_377615 ) ) ( not ( = ?auto_377614 ?auto_377616 ) ) ( not ( = ?auto_377614 ?auto_377617 ) ) ( not ( = ?auto_377614 ?auto_377618 ) ) ( not ( = ?auto_377614 ?auto_377619 ) ) ( not ( = ?auto_377614 ?auto_377620 ) ) ( not ( = ?auto_377614 ?auto_377621 ) ) ( not ( = ?auto_377614 ?auto_377622 ) ) ( not ( = ?auto_377614 ?auto_377623 ) ) ( not ( = ?auto_377615 ?auto_377616 ) ) ( not ( = ?auto_377615 ?auto_377617 ) ) ( not ( = ?auto_377615 ?auto_377618 ) ) ( not ( = ?auto_377615 ?auto_377619 ) ) ( not ( = ?auto_377615 ?auto_377620 ) ) ( not ( = ?auto_377615 ?auto_377621 ) ) ( not ( = ?auto_377615 ?auto_377622 ) ) ( not ( = ?auto_377615 ?auto_377623 ) ) ( not ( = ?auto_377616 ?auto_377617 ) ) ( not ( = ?auto_377616 ?auto_377618 ) ) ( not ( = ?auto_377616 ?auto_377619 ) ) ( not ( = ?auto_377616 ?auto_377620 ) ) ( not ( = ?auto_377616 ?auto_377621 ) ) ( not ( = ?auto_377616 ?auto_377622 ) ) ( not ( = ?auto_377616 ?auto_377623 ) ) ( not ( = ?auto_377617 ?auto_377618 ) ) ( not ( = ?auto_377617 ?auto_377619 ) ) ( not ( = ?auto_377617 ?auto_377620 ) ) ( not ( = ?auto_377617 ?auto_377621 ) ) ( not ( = ?auto_377617 ?auto_377622 ) ) ( not ( = ?auto_377617 ?auto_377623 ) ) ( not ( = ?auto_377618 ?auto_377619 ) ) ( not ( = ?auto_377618 ?auto_377620 ) ) ( not ( = ?auto_377618 ?auto_377621 ) ) ( not ( = ?auto_377618 ?auto_377622 ) ) ( not ( = ?auto_377618 ?auto_377623 ) ) ( not ( = ?auto_377619 ?auto_377620 ) ) ( not ( = ?auto_377619 ?auto_377621 ) ) ( not ( = ?auto_377619 ?auto_377622 ) ) ( not ( = ?auto_377619 ?auto_377623 ) ) ( not ( = ?auto_377620 ?auto_377621 ) ) ( not ( = ?auto_377620 ?auto_377622 ) ) ( not ( = ?auto_377620 ?auto_377623 ) ) ( not ( = ?auto_377621 ?auto_377622 ) ) ( not ( = ?auto_377621 ?auto_377623 ) ) ( not ( = ?auto_377622 ?auto_377623 ) ) ( ON ?auto_377621 ?auto_377622 ) ( CLEAR ?auto_377619 ) ( ON ?auto_377620 ?auto_377621 ) ( CLEAR ?auto_377620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_377613 ?auto_377614 ?auto_377615 ?auto_377616 ?auto_377617 ?auto_377618 ?auto_377619 ?auto_377620 )
      ( MAKE-10PILE ?auto_377613 ?auto_377614 ?auto_377615 ?auto_377616 ?auto_377617 ?auto_377618 ?auto_377619 ?auto_377620 ?auto_377621 ?auto_377622 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377634 - BLOCK
      ?auto_377635 - BLOCK
      ?auto_377636 - BLOCK
      ?auto_377637 - BLOCK
      ?auto_377638 - BLOCK
      ?auto_377639 - BLOCK
      ?auto_377640 - BLOCK
      ?auto_377641 - BLOCK
      ?auto_377642 - BLOCK
      ?auto_377643 - BLOCK
    )
    :vars
    (
      ?auto_377644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377643 ?auto_377644 ) ( ON-TABLE ?auto_377634 ) ( ON ?auto_377635 ?auto_377634 ) ( ON ?auto_377636 ?auto_377635 ) ( ON ?auto_377637 ?auto_377636 ) ( ON ?auto_377638 ?auto_377637 ) ( ON ?auto_377639 ?auto_377638 ) ( not ( = ?auto_377634 ?auto_377635 ) ) ( not ( = ?auto_377634 ?auto_377636 ) ) ( not ( = ?auto_377634 ?auto_377637 ) ) ( not ( = ?auto_377634 ?auto_377638 ) ) ( not ( = ?auto_377634 ?auto_377639 ) ) ( not ( = ?auto_377634 ?auto_377640 ) ) ( not ( = ?auto_377634 ?auto_377641 ) ) ( not ( = ?auto_377634 ?auto_377642 ) ) ( not ( = ?auto_377634 ?auto_377643 ) ) ( not ( = ?auto_377634 ?auto_377644 ) ) ( not ( = ?auto_377635 ?auto_377636 ) ) ( not ( = ?auto_377635 ?auto_377637 ) ) ( not ( = ?auto_377635 ?auto_377638 ) ) ( not ( = ?auto_377635 ?auto_377639 ) ) ( not ( = ?auto_377635 ?auto_377640 ) ) ( not ( = ?auto_377635 ?auto_377641 ) ) ( not ( = ?auto_377635 ?auto_377642 ) ) ( not ( = ?auto_377635 ?auto_377643 ) ) ( not ( = ?auto_377635 ?auto_377644 ) ) ( not ( = ?auto_377636 ?auto_377637 ) ) ( not ( = ?auto_377636 ?auto_377638 ) ) ( not ( = ?auto_377636 ?auto_377639 ) ) ( not ( = ?auto_377636 ?auto_377640 ) ) ( not ( = ?auto_377636 ?auto_377641 ) ) ( not ( = ?auto_377636 ?auto_377642 ) ) ( not ( = ?auto_377636 ?auto_377643 ) ) ( not ( = ?auto_377636 ?auto_377644 ) ) ( not ( = ?auto_377637 ?auto_377638 ) ) ( not ( = ?auto_377637 ?auto_377639 ) ) ( not ( = ?auto_377637 ?auto_377640 ) ) ( not ( = ?auto_377637 ?auto_377641 ) ) ( not ( = ?auto_377637 ?auto_377642 ) ) ( not ( = ?auto_377637 ?auto_377643 ) ) ( not ( = ?auto_377637 ?auto_377644 ) ) ( not ( = ?auto_377638 ?auto_377639 ) ) ( not ( = ?auto_377638 ?auto_377640 ) ) ( not ( = ?auto_377638 ?auto_377641 ) ) ( not ( = ?auto_377638 ?auto_377642 ) ) ( not ( = ?auto_377638 ?auto_377643 ) ) ( not ( = ?auto_377638 ?auto_377644 ) ) ( not ( = ?auto_377639 ?auto_377640 ) ) ( not ( = ?auto_377639 ?auto_377641 ) ) ( not ( = ?auto_377639 ?auto_377642 ) ) ( not ( = ?auto_377639 ?auto_377643 ) ) ( not ( = ?auto_377639 ?auto_377644 ) ) ( not ( = ?auto_377640 ?auto_377641 ) ) ( not ( = ?auto_377640 ?auto_377642 ) ) ( not ( = ?auto_377640 ?auto_377643 ) ) ( not ( = ?auto_377640 ?auto_377644 ) ) ( not ( = ?auto_377641 ?auto_377642 ) ) ( not ( = ?auto_377641 ?auto_377643 ) ) ( not ( = ?auto_377641 ?auto_377644 ) ) ( not ( = ?auto_377642 ?auto_377643 ) ) ( not ( = ?auto_377642 ?auto_377644 ) ) ( not ( = ?auto_377643 ?auto_377644 ) ) ( ON ?auto_377642 ?auto_377643 ) ( ON ?auto_377641 ?auto_377642 ) ( CLEAR ?auto_377639 ) ( ON ?auto_377640 ?auto_377641 ) ( CLEAR ?auto_377640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_377634 ?auto_377635 ?auto_377636 ?auto_377637 ?auto_377638 ?auto_377639 ?auto_377640 )
      ( MAKE-10PILE ?auto_377634 ?auto_377635 ?auto_377636 ?auto_377637 ?auto_377638 ?auto_377639 ?auto_377640 ?auto_377641 ?auto_377642 ?auto_377643 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377655 - BLOCK
      ?auto_377656 - BLOCK
      ?auto_377657 - BLOCK
      ?auto_377658 - BLOCK
      ?auto_377659 - BLOCK
      ?auto_377660 - BLOCK
      ?auto_377661 - BLOCK
      ?auto_377662 - BLOCK
      ?auto_377663 - BLOCK
      ?auto_377664 - BLOCK
    )
    :vars
    (
      ?auto_377665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377664 ?auto_377665 ) ( ON-TABLE ?auto_377655 ) ( ON ?auto_377656 ?auto_377655 ) ( ON ?auto_377657 ?auto_377656 ) ( ON ?auto_377658 ?auto_377657 ) ( ON ?auto_377659 ?auto_377658 ) ( ON ?auto_377660 ?auto_377659 ) ( not ( = ?auto_377655 ?auto_377656 ) ) ( not ( = ?auto_377655 ?auto_377657 ) ) ( not ( = ?auto_377655 ?auto_377658 ) ) ( not ( = ?auto_377655 ?auto_377659 ) ) ( not ( = ?auto_377655 ?auto_377660 ) ) ( not ( = ?auto_377655 ?auto_377661 ) ) ( not ( = ?auto_377655 ?auto_377662 ) ) ( not ( = ?auto_377655 ?auto_377663 ) ) ( not ( = ?auto_377655 ?auto_377664 ) ) ( not ( = ?auto_377655 ?auto_377665 ) ) ( not ( = ?auto_377656 ?auto_377657 ) ) ( not ( = ?auto_377656 ?auto_377658 ) ) ( not ( = ?auto_377656 ?auto_377659 ) ) ( not ( = ?auto_377656 ?auto_377660 ) ) ( not ( = ?auto_377656 ?auto_377661 ) ) ( not ( = ?auto_377656 ?auto_377662 ) ) ( not ( = ?auto_377656 ?auto_377663 ) ) ( not ( = ?auto_377656 ?auto_377664 ) ) ( not ( = ?auto_377656 ?auto_377665 ) ) ( not ( = ?auto_377657 ?auto_377658 ) ) ( not ( = ?auto_377657 ?auto_377659 ) ) ( not ( = ?auto_377657 ?auto_377660 ) ) ( not ( = ?auto_377657 ?auto_377661 ) ) ( not ( = ?auto_377657 ?auto_377662 ) ) ( not ( = ?auto_377657 ?auto_377663 ) ) ( not ( = ?auto_377657 ?auto_377664 ) ) ( not ( = ?auto_377657 ?auto_377665 ) ) ( not ( = ?auto_377658 ?auto_377659 ) ) ( not ( = ?auto_377658 ?auto_377660 ) ) ( not ( = ?auto_377658 ?auto_377661 ) ) ( not ( = ?auto_377658 ?auto_377662 ) ) ( not ( = ?auto_377658 ?auto_377663 ) ) ( not ( = ?auto_377658 ?auto_377664 ) ) ( not ( = ?auto_377658 ?auto_377665 ) ) ( not ( = ?auto_377659 ?auto_377660 ) ) ( not ( = ?auto_377659 ?auto_377661 ) ) ( not ( = ?auto_377659 ?auto_377662 ) ) ( not ( = ?auto_377659 ?auto_377663 ) ) ( not ( = ?auto_377659 ?auto_377664 ) ) ( not ( = ?auto_377659 ?auto_377665 ) ) ( not ( = ?auto_377660 ?auto_377661 ) ) ( not ( = ?auto_377660 ?auto_377662 ) ) ( not ( = ?auto_377660 ?auto_377663 ) ) ( not ( = ?auto_377660 ?auto_377664 ) ) ( not ( = ?auto_377660 ?auto_377665 ) ) ( not ( = ?auto_377661 ?auto_377662 ) ) ( not ( = ?auto_377661 ?auto_377663 ) ) ( not ( = ?auto_377661 ?auto_377664 ) ) ( not ( = ?auto_377661 ?auto_377665 ) ) ( not ( = ?auto_377662 ?auto_377663 ) ) ( not ( = ?auto_377662 ?auto_377664 ) ) ( not ( = ?auto_377662 ?auto_377665 ) ) ( not ( = ?auto_377663 ?auto_377664 ) ) ( not ( = ?auto_377663 ?auto_377665 ) ) ( not ( = ?auto_377664 ?auto_377665 ) ) ( ON ?auto_377663 ?auto_377664 ) ( ON ?auto_377662 ?auto_377663 ) ( CLEAR ?auto_377660 ) ( ON ?auto_377661 ?auto_377662 ) ( CLEAR ?auto_377661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_377655 ?auto_377656 ?auto_377657 ?auto_377658 ?auto_377659 ?auto_377660 ?auto_377661 )
      ( MAKE-10PILE ?auto_377655 ?auto_377656 ?auto_377657 ?auto_377658 ?auto_377659 ?auto_377660 ?auto_377661 ?auto_377662 ?auto_377663 ?auto_377664 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377676 - BLOCK
      ?auto_377677 - BLOCK
      ?auto_377678 - BLOCK
      ?auto_377679 - BLOCK
      ?auto_377680 - BLOCK
      ?auto_377681 - BLOCK
      ?auto_377682 - BLOCK
      ?auto_377683 - BLOCK
      ?auto_377684 - BLOCK
      ?auto_377685 - BLOCK
    )
    :vars
    (
      ?auto_377686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377685 ?auto_377686 ) ( ON-TABLE ?auto_377676 ) ( ON ?auto_377677 ?auto_377676 ) ( ON ?auto_377678 ?auto_377677 ) ( ON ?auto_377679 ?auto_377678 ) ( ON ?auto_377680 ?auto_377679 ) ( not ( = ?auto_377676 ?auto_377677 ) ) ( not ( = ?auto_377676 ?auto_377678 ) ) ( not ( = ?auto_377676 ?auto_377679 ) ) ( not ( = ?auto_377676 ?auto_377680 ) ) ( not ( = ?auto_377676 ?auto_377681 ) ) ( not ( = ?auto_377676 ?auto_377682 ) ) ( not ( = ?auto_377676 ?auto_377683 ) ) ( not ( = ?auto_377676 ?auto_377684 ) ) ( not ( = ?auto_377676 ?auto_377685 ) ) ( not ( = ?auto_377676 ?auto_377686 ) ) ( not ( = ?auto_377677 ?auto_377678 ) ) ( not ( = ?auto_377677 ?auto_377679 ) ) ( not ( = ?auto_377677 ?auto_377680 ) ) ( not ( = ?auto_377677 ?auto_377681 ) ) ( not ( = ?auto_377677 ?auto_377682 ) ) ( not ( = ?auto_377677 ?auto_377683 ) ) ( not ( = ?auto_377677 ?auto_377684 ) ) ( not ( = ?auto_377677 ?auto_377685 ) ) ( not ( = ?auto_377677 ?auto_377686 ) ) ( not ( = ?auto_377678 ?auto_377679 ) ) ( not ( = ?auto_377678 ?auto_377680 ) ) ( not ( = ?auto_377678 ?auto_377681 ) ) ( not ( = ?auto_377678 ?auto_377682 ) ) ( not ( = ?auto_377678 ?auto_377683 ) ) ( not ( = ?auto_377678 ?auto_377684 ) ) ( not ( = ?auto_377678 ?auto_377685 ) ) ( not ( = ?auto_377678 ?auto_377686 ) ) ( not ( = ?auto_377679 ?auto_377680 ) ) ( not ( = ?auto_377679 ?auto_377681 ) ) ( not ( = ?auto_377679 ?auto_377682 ) ) ( not ( = ?auto_377679 ?auto_377683 ) ) ( not ( = ?auto_377679 ?auto_377684 ) ) ( not ( = ?auto_377679 ?auto_377685 ) ) ( not ( = ?auto_377679 ?auto_377686 ) ) ( not ( = ?auto_377680 ?auto_377681 ) ) ( not ( = ?auto_377680 ?auto_377682 ) ) ( not ( = ?auto_377680 ?auto_377683 ) ) ( not ( = ?auto_377680 ?auto_377684 ) ) ( not ( = ?auto_377680 ?auto_377685 ) ) ( not ( = ?auto_377680 ?auto_377686 ) ) ( not ( = ?auto_377681 ?auto_377682 ) ) ( not ( = ?auto_377681 ?auto_377683 ) ) ( not ( = ?auto_377681 ?auto_377684 ) ) ( not ( = ?auto_377681 ?auto_377685 ) ) ( not ( = ?auto_377681 ?auto_377686 ) ) ( not ( = ?auto_377682 ?auto_377683 ) ) ( not ( = ?auto_377682 ?auto_377684 ) ) ( not ( = ?auto_377682 ?auto_377685 ) ) ( not ( = ?auto_377682 ?auto_377686 ) ) ( not ( = ?auto_377683 ?auto_377684 ) ) ( not ( = ?auto_377683 ?auto_377685 ) ) ( not ( = ?auto_377683 ?auto_377686 ) ) ( not ( = ?auto_377684 ?auto_377685 ) ) ( not ( = ?auto_377684 ?auto_377686 ) ) ( not ( = ?auto_377685 ?auto_377686 ) ) ( ON ?auto_377684 ?auto_377685 ) ( ON ?auto_377683 ?auto_377684 ) ( ON ?auto_377682 ?auto_377683 ) ( CLEAR ?auto_377680 ) ( ON ?auto_377681 ?auto_377682 ) ( CLEAR ?auto_377681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_377676 ?auto_377677 ?auto_377678 ?auto_377679 ?auto_377680 ?auto_377681 )
      ( MAKE-10PILE ?auto_377676 ?auto_377677 ?auto_377678 ?auto_377679 ?auto_377680 ?auto_377681 ?auto_377682 ?auto_377683 ?auto_377684 ?auto_377685 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377697 - BLOCK
      ?auto_377698 - BLOCK
      ?auto_377699 - BLOCK
      ?auto_377700 - BLOCK
      ?auto_377701 - BLOCK
      ?auto_377702 - BLOCK
      ?auto_377703 - BLOCK
      ?auto_377704 - BLOCK
      ?auto_377705 - BLOCK
      ?auto_377706 - BLOCK
    )
    :vars
    (
      ?auto_377707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377706 ?auto_377707 ) ( ON-TABLE ?auto_377697 ) ( ON ?auto_377698 ?auto_377697 ) ( ON ?auto_377699 ?auto_377698 ) ( ON ?auto_377700 ?auto_377699 ) ( ON ?auto_377701 ?auto_377700 ) ( not ( = ?auto_377697 ?auto_377698 ) ) ( not ( = ?auto_377697 ?auto_377699 ) ) ( not ( = ?auto_377697 ?auto_377700 ) ) ( not ( = ?auto_377697 ?auto_377701 ) ) ( not ( = ?auto_377697 ?auto_377702 ) ) ( not ( = ?auto_377697 ?auto_377703 ) ) ( not ( = ?auto_377697 ?auto_377704 ) ) ( not ( = ?auto_377697 ?auto_377705 ) ) ( not ( = ?auto_377697 ?auto_377706 ) ) ( not ( = ?auto_377697 ?auto_377707 ) ) ( not ( = ?auto_377698 ?auto_377699 ) ) ( not ( = ?auto_377698 ?auto_377700 ) ) ( not ( = ?auto_377698 ?auto_377701 ) ) ( not ( = ?auto_377698 ?auto_377702 ) ) ( not ( = ?auto_377698 ?auto_377703 ) ) ( not ( = ?auto_377698 ?auto_377704 ) ) ( not ( = ?auto_377698 ?auto_377705 ) ) ( not ( = ?auto_377698 ?auto_377706 ) ) ( not ( = ?auto_377698 ?auto_377707 ) ) ( not ( = ?auto_377699 ?auto_377700 ) ) ( not ( = ?auto_377699 ?auto_377701 ) ) ( not ( = ?auto_377699 ?auto_377702 ) ) ( not ( = ?auto_377699 ?auto_377703 ) ) ( not ( = ?auto_377699 ?auto_377704 ) ) ( not ( = ?auto_377699 ?auto_377705 ) ) ( not ( = ?auto_377699 ?auto_377706 ) ) ( not ( = ?auto_377699 ?auto_377707 ) ) ( not ( = ?auto_377700 ?auto_377701 ) ) ( not ( = ?auto_377700 ?auto_377702 ) ) ( not ( = ?auto_377700 ?auto_377703 ) ) ( not ( = ?auto_377700 ?auto_377704 ) ) ( not ( = ?auto_377700 ?auto_377705 ) ) ( not ( = ?auto_377700 ?auto_377706 ) ) ( not ( = ?auto_377700 ?auto_377707 ) ) ( not ( = ?auto_377701 ?auto_377702 ) ) ( not ( = ?auto_377701 ?auto_377703 ) ) ( not ( = ?auto_377701 ?auto_377704 ) ) ( not ( = ?auto_377701 ?auto_377705 ) ) ( not ( = ?auto_377701 ?auto_377706 ) ) ( not ( = ?auto_377701 ?auto_377707 ) ) ( not ( = ?auto_377702 ?auto_377703 ) ) ( not ( = ?auto_377702 ?auto_377704 ) ) ( not ( = ?auto_377702 ?auto_377705 ) ) ( not ( = ?auto_377702 ?auto_377706 ) ) ( not ( = ?auto_377702 ?auto_377707 ) ) ( not ( = ?auto_377703 ?auto_377704 ) ) ( not ( = ?auto_377703 ?auto_377705 ) ) ( not ( = ?auto_377703 ?auto_377706 ) ) ( not ( = ?auto_377703 ?auto_377707 ) ) ( not ( = ?auto_377704 ?auto_377705 ) ) ( not ( = ?auto_377704 ?auto_377706 ) ) ( not ( = ?auto_377704 ?auto_377707 ) ) ( not ( = ?auto_377705 ?auto_377706 ) ) ( not ( = ?auto_377705 ?auto_377707 ) ) ( not ( = ?auto_377706 ?auto_377707 ) ) ( ON ?auto_377705 ?auto_377706 ) ( ON ?auto_377704 ?auto_377705 ) ( ON ?auto_377703 ?auto_377704 ) ( CLEAR ?auto_377701 ) ( ON ?auto_377702 ?auto_377703 ) ( CLEAR ?auto_377702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_377697 ?auto_377698 ?auto_377699 ?auto_377700 ?auto_377701 ?auto_377702 )
      ( MAKE-10PILE ?auto_377697 ?auto_377698 ?auto_377699 ?auto_377700 ?auto_377701 ?auto_377702 ?auto_377703 ?auto_377704 ?auto_377705 ?auto_377706 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377718 - BLOCK
      ?auto_377719 - BLOCK
      ?auto_377720 - BLOCK
      ?auto_377721 - BLOCK
      ?auto_377722 - BLOCK
      ?auto_377723 - BLOCK
      ?auto_377724 - BLOCK
      ?auto_377725 - BLOCK
      ?auto_377726 - BLOCK
      ?auto_377727 - BLOCK
    )
    :vars
    (
      ?auto_377728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377727 ?auto_377728 ) ( ON-TABLE ?auto_377718 ) ( ON ?auto_377719 ?auto_377718 ) ( ON ?auto_377720 ?auto_377719 ) ( ON ?auto_377721 ?auto_377720 ) ( not ( = ?auto_377718 ?auto_377719 ) ) ( not ( = ?auto_377718 ?auto_377720 ) ) ( not ( = ?auto_377718 ?auto_377721 ) ) ( not ( = ?auto_377718 ?auto_377722 ) ) ( not ( = ?auto_377718 ?auto_377723 ) ) ( not ( = ?auto_377718 ?auto_377724 ) ) ( not ( = ?auto_377718 ?auto_377725 ) ) ( not ( = ?auto_377718 ?auto_377726 ) ) ( not ( = ?auto_377718 ?auto_377727 ) ) ( not ( = ?auto_377718 ?auto_377728 ) ) ( not ( = ?auto_377719 ?auto_377720 ) ) ( not ( = ?auto_377719 ?auto_377721 ) ) ( not ( = ?auto_377719 ?auto_377722 ) ) ( not ( = ?auto_377719 ?auto_377723 ) ) ( not ( = ?auto_377719 ?auto_377724 ) ) ( not ( = ?auto_377719 ?auto_377725 ) ) ( not ( = ?auto_377719 ?auto_377726 ) ) ( not ( = ?auto_377719 ?auto_377727 ) ) ( not ( = ?auto_377719 ?auto_377728 ) ) ( not ( = ?auto_377720 ?auto_377721 ) ) ( not ( = ?auto_377720 ?auto_377722 ) ) ( not ( = ?auto_377720 ?auto_377723 ) ) ( not ( = ?auto_377720 ?auto_377724 ) ) ( not ( = ?auto_377720 ?auto_377725 ) ) ( not ( = ?auto_377720 ?auto_377726 ) ) ( not ( = ?auto_377720 ?auto_377727 ) ) ( not ( = ?auto_377720 ?auto_377728 ) ) ( not ( = ?auto_377721 ?auto_377722 ) ) ( not ( = ?auto_377721 ?auto_377723 ) ) ( not ( = ?auto_377721 ?auto_377724 ) ) ( not ( = ?auto_377721 ?auto_377725 ) ) ( not ( = ?auto_377721 ?auto_377726 ) ) ( not ( = ?auto_377721 ?auto_377727 ) ) ( not ( = ?auto_377721 ?auto_377728 ) ) ( not ( = ?auto_377722 ?auto_377723 ) ) ( not ( = ?auto_377722 ?auto_377724 ) ) ( not ( = ?auto_377722 ?auto_377725 ) ) ( not ( = ?auto_377722 ?auto_377726 ) ) ( not ( = ?auto_377722 ?auto_377727 ) ) ( not ( = ?auto_377722 ?auto_377728 ) ) ( not ( = ?auto_377723 ?auto_377724 ) ) ( not ( = ?auto_377723 ?auto_377725 ) ) ( not ( = ?auto_377723 ?auto_377726 ) ) ( not ( = ?auto_377723 ?auto_377727 ) ) ( not ( = ?auto_377723 ?auto_377728 ) ) ( not ( = ?auto_377724 ?auto_377725 ) ) ( not ( = ?auto_377724 ?auto_377726 ) ) ( not ( = ?auto_377724 ?auto_377727 ) ) ( not ( = ?auto_377724 ?auto_377728 ) ) ( not ( = ?auto_377725 ?auto_377726 ) ) ( not ( = ?auto_377725 ?auto_377727 ) ) ( not ( = ?auto_377725 ?auto_377728 ) ) ( not ( = ?auto_377726 ?auto_377727 ) ) ( not ( = ?auto_377726 ?auto_377728 ) ) ( not ( = ?auto_377727 ?auto_377728 ) ) ( ON ?auto_377726 ?auto_377727 ) ( ON ?auto_377725 ?auto_377726 ) ( ON ?auto_377724 ?auto_377725 ) ( ON ?auto_377723 ?auto_377724 ) ( CLEAR ?auto_377721 ) ( ON ?auto_377722 ?auto_377723 ) ( CLEAR ?auto_377722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_377718 ?auto_377719 ?auto_377720 ?auto_377721 ?auto_377722 )
      ( MAKE-10PILE ?auto_377718 ?auto_377719 ?auto_377720 ?auto_377721 ?auto_377722 ?auto_377723 ?auto_377724 ?auto_377725 ?auto_377726 ?auto_377727 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377739 - BLOCK
      ?auto_377740 - BLOCK
      ?auto_377741 - BLOCK
      ?auto_377742 - BLOCK
      ?auto_377743 - BLOCK
      ?auto_377744 - BLOCK
      ?auto_377745 - BLOCK
      ?auto_377746 - BLOCK
      ?auto_377747 - BLOCK
      ?auto_377748 - BLOCK
    )
    :vars
    (
      ?auto_377749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377748 ?auto_377749 ) ( ON-TABLE ?auto_377739 ) ( ON ?auto_377740 ?auto_377739 ) ( ON ?auto_377741 ?auto_377740 ) ( ON ?auto_377742 ?auto_377741 ) ( not ( = ?auto_377739 ?auto_377740 ) ) ( not ( = ?auto_377739 ?auto_377741 ) ) ( not ( = ?auto_377739 ?auto_377742 ) ) ( not ( = ?auto_377739 ?auto_377743 ) ) ( not ( = ?auto_377739 ?auto_377744 ) ) ( not ( = ?auto_377739 ?auto_377745 ) ) ( not ( = ?auto_377739 ?auto_377746 ) ) ( not ( = ?auto_377739 ?auto_377747 ) ) ( not ( = ?auto_377739 ?auto_377748 ) ) ( not ( = ?auto_377739 ?auto_377749 ) ) ( not ( = ?auto_377740 ?auto_377741 ) ) ( not ( = ?auto_377740 ?auto_377742 ) ) ( not ( = ?auto_377740 ?auto_377743 ) ) ( not ( = ?auto_377740 ?auto_377744 ) ) ( not ( = ?auto_377740 ?auto_377745 ) ) ( not ( = ?auto_377740 ?auto_377746 ) ) ( not ( = ?auto_377740 ?auto_377747 ) ) ( not ( = ?auto_377740 ?auto_377748 ) ) ( not ( = ?auto_377740 ?auto_377749 ) ) ( not ( = ?auto_377741 ?auto_377742 ) ) ( not ( = ?auto_377741 ?auto_377743 ) ) ( not ( = ?auto_377741 ?auto_377744 ) ) ( not ( = ?auto_377741 ?auto_377745 ) ) ( not ( = ?auto_377741 ?auto_377746 ) ) ( not ( = ?auto_377741 ?auto_377747 ) ) ( not ( = ?auto_377741 ?auto_377748 ) ) ( not ( = ?auto_377741 ?auto_377749 ) ) ( not ( = ?auto_377742 ?auto_377743 ) ) ( not ( = ?auto_377742 ?auto_377744 ) ) ( not ( = ?auto_377742 ?auto_377745 ) ) ( not ( = ?auto_377742 ?auto_377746 ) ) ( not ( = ?auto_377742 ?auto_377747 ) ) ( not ( = ?auto_377742 ?auto_377748 ) ) ( not ( = ?auto_377742 ?auto_377749 ) ) ( not ( = ?auto_377743 ?auto_377744 ) ) ( not ( = ?auto_377743 ?auto_377745 ) ) ( not ( = ?auto_377743 ?auto_377746 ) ) ( not ( = ?auto_377743 ?auto_377747 ) ) ( not ( = ?auto_377743 ?auto_377748 ) ) ( not ( = ?auto_377743 ?auto_377749 ) ) ( not ( = ?auto_377744 ?auto_377745 ) ) ( not ( = ?auto_377744 ?auto_377746 ) ) ( not ( = ?auto_377744 ?auto_377747 ) ) ( not ( = ?auto_377744 ?auto_377748 ) ) ( not ( = ?auto_377744 ?auto_377749 ) ) ( not ( = ?auto_377745 ?auto_377746 ) ) ( not ( = ?auto_377745 ?auto_377747 ) ) ( not ( = ?auto_377745 ?auto_377748 ) ) ( not ( = ?auto_377745 ?auto_377749 ) ) ( not ( = ?auto_377746 ?auto_377747 ) ) ( not ( = ?auto_377746 ?auto_377748 ) ) ( not ( = ?auto_377746 ?auto_377749 ) ) ( not ( = ?auto_377747 ?auto_377748 ) ) ( not ( = ?auto_377747 ?auto_377749 ) ) ( not ( = ?auto_377748 ?auto_377749 ) ) ( ON ?auto_377747 ?auto_377748 ) ( ON ?auto_377746 ?auto_377747 ) ( ON ?auto_377745 ?auto_377746 ) ( ON ?auto_377744 ?auto_377745 ) ( CLEAR ?auto_377742 ) ( ON ?auto_377743 ?auto_377744 ) ( CLEAR ?auto_377743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_377739 ?auto_377740 ?auto_377741 ?auto_377742 ?auto_377743 )
      ( MAKE-10PILE ?auto_377739 ?auto_377740 ?auto_377741 ?auto_377742 ?auto_377743 ?auto_377744 ?auto_377745 ?auto_377746 ?auto_377747 ?auto_377748 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377760 - BLOCK
      ?auto_377761 - BLOCK
      ?auto_377762 - BLOCK
      ?auto_377763 - BLOCK
      ?auto_377764 - BLOCK
      ?auto_377765 - BLOCK
      ?auto_377766 - BLOCK
      ?auto_377767 - BLOCK
      ?auto_377768 - BLOCK
      ?auto_377769 - BLOCK
    )
    :vars
    (
      ?auto_377770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377769 ?auto_377770 ) ( ON-TABLE ?auto_377760 ) ( ON ?auto_377761 ?auto_377760 ) ( ON ?auto_377762 ?auto_377761 ) ( not ( = ?auto_377760 ?auto_377761 ) ) ( not ( = ?auto_377760 ?auto_377762 ) ) ( not ( = ?auto_377760 ?auto_377763 ) ) ( not ( = ?auto_377760 ?auto_377764 ) ) ( not ( = ?auto_377760 ?auto_377765 ) ) ( not ( = ?auto_377760 ?auto_377766 ) ) ( not ( = ?auto_377760 ?auto_377767 ) ) ( not ( = ?auto_377760 ?auto_377768 ) ) ( not ( = ?auto_377760 ?auto_377769 ) ) ( not ( = ?auto_377760 ?auto_377770 ) ) ( not ( = ?auto_377761 ?auto_377762 ) ) ( not ( = ?auto_377761 ?auto_377763 ) ) ( not ( = ?auto_377761 ?auto_377764 ) ) ( not ( = ?auto_377761 ?auto_377765 ) ) ( not ( = ?auto_377761 ?auto_377766 ) ) ( not ( = ?auto_377761 ?auto_377767 ) ) ( not ( = ?auto_377761 ?auto_377768 ) ) ( not ( = ?auto_377761 ?auto_377769 ) ) ( not ( = ?auto_377761 ?auto_377770 ) ) ( not ( = ?auto_377762 ?auto_377763 ) ) ( not ( = ?auto_377762 ?auto_377764 ) ) ( not ( = ?auto_377762 ?auto_377765 ) ) ( not ( = ?auto_377762 ?auto_377766 ) ) ( not ( = ?auto_377762 ?auto_377767 ) ) ( not ( = ?auto_377762 ?auto_377768 ) ) ( not ( = ?auto_377762 ?auto_377769 ) ) ( not ( = ?auto_377762 ?auto_377770 ) ) ( not ( = ?auto_377763 ?auto_377764 ) ) ( not ( = ?auto_377763 ?auto_377765 ) ) ( not ( = ?auto_377763 ?auto_377766 ) ) ( not ( = ?auto_377763 ?auto_377767 ) ) ( not ( = ?auto_377763 ?auto_377768 ) ) ( not ( = ?auto_377763 ?auto_377769 ) ) ( not ( = ?auto_377763 ?auto_377770 ) ) ( not ( = ?auto_377764 ?auto_377765 ) ) ( not ( = ?auto_377764 ?auto_377766 ) ) ( not ( = ?auto_377764 ?auto_377767 ) ) ( not ( = ?auto_377764 ?auto_377768 ) ) ( not ( = ?auto_377764 ?auto_377769 ) ) ( not ( = ?auto_377764 ?auto_377770 ) ) ( not ( = ?auto_377765 ?auto_377766 ) ) ( not ( = ?auto_377765 ?auto_377767 ) ) ( not ( = ?auto_377765 ?auto_377768 ) ) ( not ( = ?auto_377765 ?auto_377769 ) ) ( not ( = ?auto_377765 ?auto_377770 ) ) ( not ( = ?auto_377766 ?auto_377767 ) ) ( not ( = ?auto_377766 ?auto_377768 ) ) ( not ( = ?auto_377766 ?auto_377769 ) ) ( not ( = ?auto_377766 ?auto_377770 ) ) ( not ( = ?auto_377767 ?auto_377768 ) ) ( not ( = ?auto_377767 ?auto_377769 ) ) ( not ( = ?auto_377767 ?auto_377770 ) ) ( not ( = ?auto_377768 ?auto_377769 ) ) ( not ( = ?auto_377768 ?auto_377770 ) ) ( not ( = ?auto_377769 ?auto_377770 ) ) ( ON ?auto_377768 ?auto_377769 ) ( ON ?auto_377767 ?auto_377768 ) ( ON ?auto_377766 ?auto_377767 ) ( ON ?auto_377765 ?auto_377766 ) ( ON ?auto_377764 ?auto_377765 ) ( CLEAR ?auto_377762 ) ( ON ?auto_377763 ?auto_377764 ) ( CLEAR ?auto_377763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_377760 ?auto_377761 ?auto_377762 ?auto_377763 )
      ( MAKE-10PILE ?auto_377760 ?auto_377761 ?auto_377762 ?auto_377763 ?auto_377764 ?auto_377765 ?auto_377766 ?auto_377767 ?auto_377768 ?auto_377769 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377781 - BLOCK
      ?auto_377782 - BLOCK
      ?auto_377783 - BLOCK
      ?auto_377784 - BLOCK
      ?auto_377785 - BLOCK
      ?auto_377786 - BLOCK
      ?auto_377787 - BLOCK
      ?auto_377788 - BLOCK
      ?auto_377789 - BLOCK
      ?auto_377790 - BLOCK
    )
    :vars
    (
      ?auto_377791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377790 ?auto_377791 ) ( ON-TABLE ?auto_377781 ) ( ON ?auto_377782 ?auto_377781 ) ( ON ?auto_377783 ?auto_377782 ) ( not ( = ?auto_377781 ?auto_377782 ) ) ( not ( = ?auto_377781 ?auto_377783 ) ) ( not ( = ?auto_377781 ?auto_377784 ) ) ( not ( = ?auto_377781 ?auto_377785 ) ) ( not ( = ?auto_377781 ?auto_377786 ) ) ( not ( = ?auto_377781 ?auto_377787 ) ) ( not ( = ?auto_377781 ?auto_377788 ) ) ( not ( = ?auto_377781 ?auto_377789 ) ) ( not ( = ?auto_377781 ?auto_377790 ) ) ( not ( = ?auto_377781 ?auto_377791 ) ) ( not ( = ?auto_377782 ?auto_377783 ) ) ( not ( = ?auto_377782 ?auto_377784 ) ) ( not ( = ?auto_377782 ?auto_377785 ) ) ( not ( = ?auto_377782 ?auto_377786 ) ) ( not ( = ?auto_377782 ?auto_377787 ) ) ( not ( = ?auto_377782 ?auto_377788 ) ) ( not ( = ?auto_377782 ?auto_377789 ) ) ( not ( = ?auto_377782 ?auto_377790 ) ) ( not ( = ?auto_377782 ?auto_377791 ) ) ( not ( = ?auto_377783 ?auto_377784 ) ) ( not ( = ?auto_377783 ?auto_377785 ) ) ( not ( = ?auto_377783 ?auto_377786 ) ) ( not ( = ?auto_377783 ?auto_377787 ) ) ( not ( = ?auto_377783 ?auto_377788 ) ) ( not ( = ?auto_377783 ?auto_377789 ) ) ( not ( = ?auto_377783 ?auto_377790 ) ) ( not ( = ?auto_377783 ?auto_377791 ) ) ( not ( = ?auto_377784 ?auto_377785 ) ) ( not ( = ?auto_377784 ?auto_377786 ) ) ( not ( = ?auto_377784 ?auto_377787 ) ) ( not ( = ?auto_377784 ?auto_377788 ) ) ( not ( = ?auto_377784 ?auto_377789 ) ) ( not ( = ?auto_377784 ?auto_377790 ) ) ( not ( = ?auto_377784 ?auto_377791 ) ) ( not ( = ?auto_377785 ?auto_377786 ) ) ( not ( = ?auto_377785 ?auto_377787 ) ) ( not ( = ?auto_377785 ?auto_377788 ) ) ( not ( = ?auto_377785 ?auto_377789 ) ) ( not ( = ?auto_377785 ?auto_377790 ) ) ( not ( = ?auto_377785 ?auto_377791 ) ) ( not ( = ?auto_377786 ?auto_377787 ) ) ( not ( = ?auto_377786 ?auto_377788 ) ) ( not ( = ?auto_377786 ?auto_377789 ) ) ( not ( = ?auto_377786 ?auto_377790 ) ) ( not ( = ?auto_377786 ?auto_377791 ) ) ( not ( = ?auto_377787 ?auto_377788 ) ) ( not ( = ?auto_377787 ?auto_377789 ) ) ( not ( = ?auto_377787 ?auto_377790 ) ) ( not ( = ?auto_377787 ?auto_377791 ) ) ( not ( = ?auto_377788 ?auto_377789 ) ) ( not ( = ?auto_377788 ?auto_377790 ) ) ( not ( = ?auto_377788 ?auto_377791 ) ) ( not ( = ?auto_377789 ?auto_377790 ) ) ( not ( = ?auto_377789 ?auto_377791 ) ) ( not ( = ?auto_377790 ?auto_377791 ) ) ( ON ?auto_377789 ?auto_377790 ) ( ON ?auto_377788 ?auto_377789 ) ( ON ?auto_377787 ?auto_377788 ) ( ON ?auto_377786 ?auto_377787 ) ( ON ?auto_377785 ?auto_377786 ) ( CLEAR ?auto_377783 ) ( ON ?auto_377784 ?auto_377785 ) ( CLEAR ?auto_377784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_377781 ?auto_377782 ?auto_377783 ?auto_377784 )
      ( MAKE-10PILE ?auto_377781 ?auto_377782 ?auto_377783 ?auto_377784 ?auto_377785 ?auto_377786 ?auto_377787 ?auto_377788 ?auto_377789 ?auto_377790 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377802 - BLOCK
      ?auto_377803 - BLOCK
      ?auto_377804 - BLOCK
      ?auto_377805 - BLOCK
      ?auto_377806 - BLOCK
      ?auto_377807 - BLOCK
      ?auto_377808 - BLOCK
      ?auto_377809 - BLOCK
      ?auto_377810 - BLOCK
      ?auto_377811 - BLOCK
    )
    :vars
    (
      ?auto_377812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377811 ?auto_377812 ) ( ON-TABLE ?auto_377802 ) ( ON ?auto_377803 ?auto_377802 ) ( not ( = ?auto_377802 ?auto_377803 ) ) ( not ( = ?auto_377802 ?auto_377804 ) ) ( not ( = ?auto_377802 ?auto_377805 ) ) ( not ( = ?auto_377802 ?auto_377806 ) ) ( not ( = ?auto_377802 ?auto_377807 ) ) ( not ( = ?auto_377802 ?auto_377808 ) ) ( not ( = ?auto_377802 ?auto_377809 ) ) ( not ( = ?auto_377802 ?auto_377810 ) ) ( not ( = ?auto_377802 ?auto_377811 ) ) ( not ( = ?auto_377802 ?auto_377812 ) ) ( not ( = ?auto_377803 ?auto_377804 ) ) ( not ( = ?auto_377803 ?auto_377805 ) ) ( not ( = ?auto_377803 ?auto_377806 ) ) ( not ( = ?auto_377803 ?auto_377807 ) ) ( not ( = ?auto_377803 ?auto_377808 ) ) ( not ( = ?auto_377803 ?auto_377809 ) ) ( not ( = ?auto_377803 ?auto_377810 ) ) ( not ( = ?auto_377803 ?auto_377811 ) ) ( not ( = ?auto_377803 ?auto_377812 ) ) ( not ( = ?auto_377804 ?auto_377805 ) ) ( not ( = ?auto_377804 ?auto_377806 ) ) ( not ( = ?auto_377804 ?auto_377807 ) ) ( not ( = ?auto_377804 ?auto_377808 ) ) ( not ( = ?auto_377804 ?auto_377809 ) ) ( not ( = ?auto_377804 ?auto_377810 ) ) ( not ( = ?auto_377804 ?auto_377811 ) ) ( not ( = ?auto_377804 ?auto_377812 ) ) ( not ( = ?auto_377805 ?auto_377806 ) ) ( not ( = ?auto_377805 ?auto_377807 ) ) ( not ( = ?auto_377805 ?auto_377808 ) ) ( not ( = ?auto_377805 ?auto_377809 ) ) ( not ( = ?auto_377805 ?auto_377810 ) ) ( not ( = ?auto_377805 ?auto_377811 ) ) ( not ( = ?auto_377805 ?auto_377812 ) ) ( not ( = ?auto_377806 ?auto_377807 ) ) ( not ( = ?auto_377806 ?auto_377808 ) ) ( not ( = ?auto_377806 ?auto_377809 ) ) ( not ( = ?auto_377806 ?auto_377810 ) ) ( not ( = ?auto_377806 ?auto_377811 ) ) ( not ( = ?auto_377806 ?auto_377812 ) ) ( not ( = ?auto_377807 ?auto_377808 ) ) ( not ( = ?auto_377807 ?auto_377809 ) ) ( not ( = ?auto_377807 ?auto_377810 ) ) ( not ( = ?auto_377807 ?auto_377811 ) ) ( not ( = ?auto_377807 ?auto_377812 ) ) ( not ( = ?auto_377808 ?auto_377809 ) ) ( not ( = ?auto_377808 ?auto_377810 ) ) ( not ( = ?auto_377808 ?auto_377811 ) ) ( not ( = ?auto_377808 ?auto_377812 ) ) ( not ( = ?auto_377809 ?auto_377810 ) ) ( not ( = ?auto_377809 ?auto_377811 ) ) ( not ( = ?auto_377809 ?auto_377812 ) ) ( not ( = ?auto_377810 ?auto_377811 ) ) ( not ( = ?auto_377810 ?auto_377812 ) ) ( not ( = ?auto_377811 ?auto_377812 ) ) ( ON ?auto_377810 ?auto_377811 ) ( ON ?auto_377809 ?auto_377810 ) ( ON ?auto_377808 ?auto_377809 ) ( ON ?auto_377807 ?auto_377808 ) ( ON ?auto_377806 ?auto_377807 ) ( ON ?auto_377805 ?auto_377806 ) ( CLEAR ?auto_377803 ) ( ON ?auto_377804 ?auto_377805 ) ( CLEAR ?auto_377804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_377802 ?auto_377803 ?auto_377804 )
      ( MAKE-10PILE ?auto_377802 ?auto_377803 ?auto_377804 ?auto_377805 ?auto_377806 ?auto_377807 ?auto_377808 ?auto_377809 ?auto_377810 ?auto_377811 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377823 - BLOCK
      ?auto_377824 - BLOCK
      ?auto_377825 - BLOCK
      ?auto_377826 - BLOCK
      ?auto_377827 - BLOCK
      ?auto_377828 - BLOCK
      ?auto_377829 - BLOCK
      ?auto_377830 - BLOCK
      ?auto_377831 - BLOCK
      ?auto_377832 - BLOCK
    )
    :vars
    (
      ?auto_377833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377832 ?auto_377833 ) ( ON-TABLE ?auto_377823 ) ( ON ?auto_377824 ?auto_377823 ) ( not ( = ?auto_377823 ?auto_377824 ) ) ( not ( = ?auto_377823 ?auto_377825 ) ) ( not ( = ?auto_377823 ?auto_377826 ) ) ( not ( = ?auto_377823 ?auto_377827 ) ) ( not ( = ?auto_377823 ?auto_377828 ) ) ( not ( = ?auto_377823 ?auto_377829 ) ) ( not ( = ?auto_377823 ?auto_377830 ) ) ( not ( = ?auto_377823 ?auto_377831 ) ) ( not ( = ?auto_377823 ?auto_377832 ) ) ( not ( = ?auto_377823 ?auto_377833 ) ) ( not ( = ?auto_377824 ?auto_377825 ) ) ( not ( = ?auto_377824 ?auto_377826 ) ) ( not ( = ?auto_377824 ?auto_377827 ) ) ( not ( = ?auto_377824 ?auto_377828 ) ) ( not ( = ?auto_377824 ?auto_377829 ) ) ( not ( = ?auto_377824 ?auto_377830 ) ) ( not ( = ?auto_377824 ?auto_377831 ) ) ( not ( = ?auto_377824 ?auto_377832 ) ) ( not ( = ?auto_377824 ?auto_377833 ) ) ( not ( = ?auto_377825 ?auto_377826 ) ) ( not ( = ?auto_377825 ?auto_377827 ) ) ( not ( = ?auto_377825 ?auto_377828 ) ) ( not ( = ?auto_377825 ?auto_377829 ) ) ( not ( = ?auto_377825 ?auto_377830 ) ) ( not ( = ?auto_377825 ?auto_377831 ) ) ( not ( = ?auto_377825 ?auto_377832 ) ) ( not ( = ?auto_377825 ?auto_377833 ) ) ( not ( = ?auto_377826 ?auto_377827 ) ) ( not ( = ?auto_377826 ?auto_377828 ) ) ( not ( = ?auto_377826 ?auto_377829 ) ) ( not ( = ?auto_377826 ?auto_377830 ) ) ( not ( = ?auto_377826 ?auto_377831 ) ) ( not ( = ?auto_377826 ?auto_377832 ) ) ( not ( = ?auto_377826 ?auto_377833 ) ) ( not ( = ?auto_377827 ?auto_377828 ) ) ( not ( = ?auto_377827 ?auto_377829 ) ) ( not ( = ?auto_377827 ?auto_377830 ) ) ( not ( = ?auto_377827 ?auto_377831 ) ) ( not ( = ?auto_377827 ?auto_377832 ) ) ( not ( = ?auto_377827 ?auto_377833 ) ) ( not ( = ?auto_377828 ?auto_377829 ) ) ( not ( = ?auto_377828 ?auto_377830 ) ) ( not ( = ?auto_377828 ?auto_377831 ) ) ( not ( = ?auto_377828 ?auto_377832 ) ) ( not ( = ?auto_377828 ?auto_377833 ) ) ( not ( = ?auto_377829 ?auto_377830 ) ) ( not ( = ?auto_377829 ?auto_377831 ) ) ( not ( = ?auto_377829 ?auto_377832 ) ) ( not ( = ?auto_377829 ?auto_377833 ) ) ( not ( = ?auto_377830 ?auto_377831 ) ) ( not ( = ?auto_377830 ?auto_377832 ) ) ( not ( = ?auto_377830 ?auto_377833 ) ) ( not ( = ?auto_377831 ?auto_377832 ) ) ( not ( = ?auto_377831 ?auto_377833 ) ) ( not ( = ?auto_377832 ?auto_377833 ) ) ( ON ?auto_377831 ?auto_377832 ) ( ON ?auto_377830 ?auto_377831 ) ( ON ?auto_377829 ?auto_377830 ) ( ON ?auto_377828 ?auto_377829 ) ( ON ?auto_377827 ?auto_377828 ) ( ON ?auto_377826 ?auto_377827 ) ( CLEAR ?auto_377824 ) ( ON ?auto_377825 ?auto_377826 ) ( CLEAR ?auto_377825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_377823 ?auto_377824 ?auto_377825 )
      ( MAKE-10PILE ?auto_377823 ?auto_377824 ?auto_377825 ?auto_377826 ?auto_377827 ?auto_377828 ?auto_377829 ?auto_377830 ?auto_377831 ?auto_377832 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377844 - BLOCK
      ?auto_377845 - BLOCK
      ?auto_377846 - BLOCK
      ?auto_377847 - BLOCK
      ?auto_377848 - BLOCK
      ?auto_377849 - BLOCK
      ?auto_377850 - BLOCK
      ?auto_377851 - BLOCK
      ?auto_377852 - BLOCK
      ?auto_377853 - BLOCK
    )
    :vars
    (
      ?auto_377854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377853 ?auto_377854 ) ( ON-TABLE ?auto_377844 ) ( not ( = ?auto_377844 ?auto_377845 ) ) ( not ( = ?auto_377844 ?auto_377846 ) ) ( not ( = ?auto_377844 ?auto_377847 ) ) ( not ( = ?auto_377844 ?auto_377848 ) ) ( not ( = ?auto_377844 ?auto_377849 ) ) ( not ( = ?auto_377844 ?auto_377850 ) ) ( not ( = ?auto_377844 ?auto_377851 ) ) ( not ( = ?auto_377844 ?auto_377852 ) ) ( not ( = ?auto_377844 ?auto_377853 ) ) ( not ( = ?auto_377844 ?auto_377854 ) ) ( not ( = ?auto_377845 ?auto_377846 ) ) ( not ( = ?auto_377845 ?auto_377847 ) ) ( not ( = ?auto_377845 ?auto_377848 ) ) ( not ( = ?auto_377845 ?auto_377849 ) ) ( not ( = ?auto_377845 ?auto_377850 ) ) ( not ( = ?auto_377845 ?auto_377851 ) ) ( not ( = ?auto_377845 ?auto_377852 ) ) ( not ( = ?auto_377845 ?auto_377853 ) ) ( not ( = ?auto_377845 ?auto_377854 ) ) ( not ( = ?auto_377846 ?auto_377847 ) ) ( not ( = ?auto_377846 ?auto_377848 ) ) ( not ( = ?auto_377846 ?auto_377849 ) ) ( not ( = ?auto_377846 ?auto_377850 ) ) ( not ( = ?auto_377846 ?auto_377851 ) ) ( not ( = ?auto_377846 ?auto_377852 ) ) ( not ( = ?auto_377846 ?auto_377853 ) ) ( not ( = ?auto_377846 ?auto_377854 ) ) ( not ( = ?auto_377847 ?auto_377848 ) ) ( not ( = ?auto_377847 ?auto_377849 ) ) ( not ( = ?auto_377847 ?auto_377850 ) ) ( not ( = ?auto_377847 ?auto_377851 ) ) ( not ( = ?auto_377847 ?auto_377852 ) ) ( not ( = ?auto_377847 ?auto_377853 ) ) ( not ( = ?auto_377847 ?auto_377854 ) ) ( not ( = ?auto_377848 ?auto_377849 ) ) ( not ( = ?auto_377848 ?auto_377850 ) ) ( not ( = ?auto_377848 ?auto_377851 ) ) ( not ( = ?auto_377848 ?auto_377852 ) ) ( not ( = ?auto_377848 ?auto_377853 ) ) ( not ( = ?auto_377848 ?auto_377854 ) ) ( not ( = ?auto_377849 ?auto_377850 ) ) ( not ( = ?auto_377849 ?auto_377851 ) ) ( not ( = ?auto_377849 ?auto_377852 ) ) ( not ( = ?auto_377849 ?auto_377853 ) ) ( not ( = ?auto_377849 ?auto_377854 ) ) ( not ( = ?auto_377850 ?auto_377851 ) ) ( not ( = ?auto_377850 ?auto_377852 ) ) ( not ( = ?auto_377850 ?auto_377853 ) ) ( not ( = ?auto_377850 ?auto_377854 ) ) ( not ( = ?auto_377851 ?auto_377852 ) ) ( not ( = ?auto_377851 ?auto_377853 ) ) ( not ( = ?auto_377851 ?auto_377854 ) ) ( not ( = ?auto_377852 ?auto_377853 ) ) ( not ( = ?auto_377852 ?auto_377854 ) ) ( not ( = ?auto_377853 ?auto_377854 ) ) ( ON ?auto_377852 ?auto_377853 ) ( ON ?auto_377851 ?auto_377852 ) ( ON ?auto_377850 ?auto_377851 ) ( ON ?auto_377849 ?auto_377850 ) ( ON ?auto_377848 ?auto_377849 ) ( ON ?auto_377847 ?auto_377848 ) ( ON ?auto_377846 ?auto_377847 ) ( CLEAR ?auto_377844 ) ( ON ?auto_377845 ?auto_377846 ) ( CLEAR ?auto_377845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_377844 ?auto_377845 )
      ( MAKE-10PILE ?auto_377844 ?auto_377845 ?auto_377846 ?auto_377847 ?auto_377848 ?auto_377849 ?auto_377850 ?auto_377851 ?auto_377852 ?auto_377853 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377865 - BLOCK
      ?auto_377866 - BLOCK
      ?auto_377867 - BLOCK
      ?auto_377868 - BLOCK
      ?auto_377869 - BLOCK
      ?auto_377870 - BLOCK
      ?auto_377871 - BLOCK
      ?auto_377872 - BLOCK
      ?auto_377873 - BLOCK
      ?auto_377874 - BLOCK
    )
    :vars
    (
      ?auto_377875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377874 ?auto_377875 ) ( ON-TABLE ?auto_377865 ) ( not ( = ?auto_377865 ?auto_377866 ) ) ( not ( = ?auto_377865 ?auto_377867 ) ) ( not ( = ?auto_377865 ?auto_377868 ) ) ( not ( = ?auto_377865 ?auto_377869 ) ) ( not ( = ?auto_377865 ?auto_377870 ) ) ( not ( = ?auto_377865 ?auto_377871 ) ) ( not ( = ?auto_377865 ?auto_377872 ) ) ( not ( = ?auto_377865 ?auto_377873 ) ) ( not ( = ?auto_377865 ?auto_377874 ) ) ( not ( = ?auto_377865 ?auto_377875 ) ) ( not ( = ?auto_377866 ?auto_377867 ) ) ( not ( = ?auto_377866 ?auto_377868 ) ) ( not ( = ?auto_377866 ?auto_377869 ) ) ( not ( = ?auto_377866 ?auto_377870 ) ) ( not ( = ?auto_377866 ?auto_377871 ) ) ( not ( = ?auto_377866 ?auto_377872 ) ) ( not ( = ?auto_377866 ?auto_377873 ) ) ( not ( = ?auto_377866 ?auto_377874 ) ) ( not ( = ?auto_377866 ?auto_377875 ) ) ( not ( = ?auto_377867 ?auto_377868 ) ) ( not ( = ?auto_377867 ?auto_377869 ) ) ( not ( = ?auto_377867 ?auto_377870 ) ) ( not ( = ?auto_377867 ?auto_377871 ) ) ( not ( = ?auto_377867 ?auto_377872 ) ) ( not ( = ?auto_377867 ?auto_377873 ) ) ( not ( = ?auto_377867 ?auto_377874 ) ) ( not ( = ?auto_377867 ?auto_377875 ) ) ( not ( = ?auto_377868 ?auto_377869 ) ) ( not ( = ?auto_377868 ?auto_377870 ) ) ( not ( = ?auto_377868 ?auto_377871 ) ) ( not ( = ?auto_377868 ?auto_377872 ) ) ( not ( = ?auto_377868 ?auto_377873 ) ) ( not ( = ?auto_377868 ?auto_377874 ) ) ( not ( = ?auto_377868 ?auto_377875 ) ) ( not ( = ?auto_377869 ?auto_377870 ) ) ( not ( = ?auto_377869 ?auto_377871 ) ) ( not ( = ?auto_377869 ?auto_377872 ) ) ( not ( = ?auto_377869 ?auto_377873 ) ) ( not ( = ?auto_377869 ?auto_377874 ) ) ( not ( = ?auto_377869 ?auto_377875 ) ) ( not ( = ?auto_377870 ?auto_377871 ) ) ( not ( = ?auto_377870 ?auto_377872 ) ) ( not ( = ?auto_377870 ?auto_377873 ) ) ( not ( = ?auto_377870 ?auto_377874 ) ) ( not ( = ?auto_377870 ?auto_377875 ) ) ( not ( = ?auto_377871 ?auto_377872 ) ) ( not ( = ?auto_377871 ?auto_377873 ) ) ( not ( = ?auto_377871 ?auto_377874 ) ) ( not ( = ?auto_377871 ?auto_377875 ) ) ( not ( = ?auto_377872 ?auto_377873 ) ) ( not ( = ?auto_377872 ?auto_377874 ) ) ( not ( = ?auto_377872 ?auto_377875 ) ) ( not ( = ?auto_377873 ?auto_377874 ) ) ( not ( = ?auto_377873 ?auto_377875 ) ) ( not ( = ?auto_377874 ?auto_377875 ) ) ( ON ?auto_377873 ?auto_377874 ) ( ON ?auto_377872 ?auto_377873 ) ( ON ?auto_377871 ?auto_377872 ) ( ON ?auto_377870 ?auto_377871 ) ( ON ?auto_377869 ?auto_377870 ) ( ON ?auto_377868 ?auto_377869 ) ( ON ?auto_377867 ?auto_377868 ) ( CLEAR ?auto_377865 ) ( ON ?auto_377866 ?auto_377867 ) ( CLEAR ?auto_377866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_377865 ?auto_377866 )
      ( MAKE-10PILE ?auto_377865 ?auto_377866 ?auto_377867 ?auto_377868 ?auto_377869 ?auto_377870 ?auto_377871 ?auto_377872 ?auto_377873 ?auto_377874 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377886 - BLOCK
      ?auto_377887 - BLOCK
      ?auto_377888 - BLOCK
      ?auto_377889 - BLOCK
      ?auto_377890 - BLOCK
      ?auto_377891 - BLOCK
      ?auto_377892 - BLOCK
      ?auto_377893 - BLOCK
      ?auto_377894 - BLOCK
      ?auto_377895 - BLOCK
    )
    :vars
    (
      ?auto_377896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377895 ?auto_377896 ) ( not ( = ?auto_377886 ?auto_377887 ) ) ( not ( = ?auto_377886 ?auto_377888 ) ) ( not ( = ?auto_377886 ?auto_377889 ) ) ( not ( = ?auto_377886 ?auto_377890 ) ) ( not ( = ?auto_377886 ?auto_377891 ) ) ( not ( = ?auto_377886 ?auto_377892 ) ) ( not ( = ?auto_377886 ?auto_377893 ) ) ( not ( = ?auto_377886 ?auto_377894 ) ) ( not ( = ?auto_377886 ?auto_377895 ) ) ( not ( = ?auto_377886 ?auto_377896 ) ) ( not ( = ?auto_377887 ?auto_377888 ) ) ( not ( = ?auto_377887 ?auto_377889 ) ) ( not ( = ?auto_377887 ?auto_377890 ) ) ( not ( = ?auto_377887 ?auto_377891 ) ) ( not ( = ?auto_377887 ?auto_377892 ) ) ( not ( = ?auto_377887 ?auto_377893 ) ) ( not ( = ?auto_377887 ?auto_377894 ) ) ( not ( = ?auto_377887 ?auto_377895 ) ) ( not ( = ?auto_377887 ?auto_377896 ) ) ( not ( = ?auto_377888 ?auto_377889 ) ) ( not ( = ?auto_377888 ?auto_377890 ) ) ( not ( = ?auto_377888 ?auto_377891 ) ) ( not ( = ?auto_377888 ?auto_377892 ) ) ( not ( = ?auto_377888 ?auto_377893 ) ) ( not ( = ?auto_377888 ?auto_377894 ) ) ( not ( = ?auto_377888 ?auto_377895 ) ) ( not ( = ?auto_377888 ?auto_377896 ) ) ( not ( = ?auto_377889 ?auto_377890 ) ) ( not ( = ?auto_377889 ?auto_377891 ) ) ( not ( = ?auto_377889 ?auto_377892 ) ) ( not ( = ?auto_377889 ?auto_377893 ) ) ( not ( = ?auto_377889 ?auto_377894 ) ) ( not ( = ?auto_377889 ?auto_377895 ) ) ( not ( = ?auto_377889 ?auto_377896 ) ) ( not ( = ?auto_377890 ?auto_377891 ) ) ( not ( = ?auto_377890 ?auto_377892 ) ) ( not ( = ?auto_377890 ?auto_377893 ) ) ( not ( = ?auto_377890 ?auto_377894 ) ) ( not ( = ?auto_377890 ?auto_377895 ) ) ( not ( = ?auto_377890 ?auto_377896 ) ) ( not ( = ?auto_377891 ?auto_377892 ) ) ( not ( = ?auto_377891 ?auto_377893 ) ) ( not ( = ?auto_377891 ?auto_377894 ) ) ( not ( = ?auto_377891 ?auto_377895 ) ) ( not ( = ?auto_377891 ?auto_377896 ) ) ( not ( = ?auto_377892 ?auto_377893 ) ) ( not ( = ?auto_377892 ?auto_377894 ) ) ( not ( = ?auto_377892 ?auto_377895 ) ) ( not ( = ?auto_377892 ?auto_377896 ) ) ( not ( = ?auto_377893 ?auto_377894 ) ) ( not ( = ?auto_377893 ?auto_377895 ) ) ( not ( = ?auto_377893 ?auto_377896 ) ) ( not ( = ?auto_377894 ?auto_377895 ) ) ( not ( = ?auto_377894 ?auto_377896 ) ) ( not ( = ?auto_377895 ?auto_377896 ) ) ( ON ?auto_377894 ?auto_377895 ) ( ON ?auto_377893 ?auto_377894 ) ( ON ?auto_377892 ?auto_377893 ) ( ON ?auto_377891 ?auto_377892 ) ( ON ?auto_377890 ?auto_377891 ) ( ON ?auto_377889 ?auto_377890 ) ( ON ?auto_377888 ?auto_377889 ) ( ON ?auto_377887 ?auto_377888 ) ( ON ?auto_377886 ?auto_377887 ) ( CLEAR ?auto_377886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_377886 )
      ( MAKE-10PILE ?auto_377886 ?auto_377887 ?auto_377888 ?auto_377889 ?auto_377890 ?auto_377891 ?auto_377892 ?auto_377893 ?auto_377894 ?auto_377895 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_377907 - BLOCK
      ?auto_377908 - BLOCK
      ?auto_377909 - BLOCK
      ?auto_377910 - BLOCK
      ?auto_377911 - BLOCK
      ?auto_377912 - BLOCK
      ?auto_377913 - BLOCK
      ?auto_377914 - BLOCK
      ?auto_377915 - BLOCK
      ?auto_377916 - BLOCK
    )
    :vars
    (
      ?auto_377917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377916 ?auto_377917 ) ( not ( = ?auto_377907 ?auto_377908 ) ) ( not ( = ?auto_377907 ?auto_377909 ) ) ( not ( = ?auto_377907 ?auto_377910 ) ) ( not ( = ?auto_377907 ?auto_377911 ) ) ( not ( = ?auto_377907 ?auto_377912 ) ) ( not ( = ?auto_377907 ?auto_377913 ) ) ( not ( = ?auto_377907 ?auto_377914 ) ) ( not ( = ?auto_377907 ?auto_377915 ) ) ( not ( = ?auto_377907 ?auto_377916 ) ) ( not ( = ?auto_377907 ?auto_377917 ) ) ( not ( = ?auto_377908 ?auto_377909 ) ) ( not ( = ?auto_377908 ?auto_377910 ) ) ( not ( = ?auto_377908 ?auto_377911 ) ) ( not ( = ?auto_377908 ?auto_377912 ) ) ( not ( = ?auto_377908 ?auto_377913 ) ) ( not ( = ?auto_377908 ?auto_377914 ) ) ( not ( = ?auto_377908 ?auto_377915 ) ) ( not ( = ?auto_377908 ?auto_377916 ) ) ( not ( = ?auto_377908 ?auto_377917 ) ) ( not ( = ?auto_377909 ?auto_377910 ) ) ( not ( = ?auto_377909 ?auto_377911 ) ) ( not ( = ?auto_377909 ?auto_377912 ) ) ( not ( = ?auto_377909 ?auto_377913 ) ) ( not ( = ?auto_377909 ?auto_377914 ) ) ( not ( = ?auto_377909 ?auto_377915 ) ) ( not ( = ?auto_377909 ?auto_377916 ) ) ( not ( = ?auto_377909 ?auto_377917 ) ) ( not ( = ?auto_377910 ?auto_377911 ) ) ( not ( = ?auto_377910 ?auto_377912 ) ) ( not ( = ?auto_377910 ?auto_377913 ) ) ( not ( = ?auto_377910 ?auto_377914 ) ) ( not ( = ?auto_377910 ?auto_377915 ) ) ( not ( = ?auto_377910 ?auto_377916 ) ) ( not ( = ?auto_377910 ?auto_377917 ) ) ( not ( = ?auto_377911 ?auto_377912 ) ) ( not ( = ?auto_377911 ?auto_377913 ) ) ( not ( = ?auto_377911 ?auto_377914 ) ) ( not ( = ?auto_377911 ?auto_377915 ) ) ( not ( = ?auto_377911 ?auto_377916 ) ) ( not ( = ?auto_377911 ?auto_377917 ) ) ( not ( = ?auto_377912 ?auto_377913 ) ) ( not ( = ?auto_377912 ?auto_377914 ) ) ( not ( = ?auto_377912 ?auto_377915 ) ) ( not ( = ?auto_377912 ?auto_377916 ) ) ( not ( = ?auto_377912 ?auto_377917 ) ) ( not ( = ?auto_377913 ?auto_377914 ) ) ( not ( = ?auto_377913 ?auto_377915 ) ) ( not ( = ?auto_377913 ?auto_377916 ) ) ( not ( = ?auto_377913 ?auto_377917 ) ) ( not ( = ?auto_377914 ?auto_377915 ) ) ( not ( = ?auto_377914 ?auto_377916 ) ) ( not ( = ?auto_377914 ?auto_377917 ) ) ( not ( = ?auto_377915 ?auto_377916 ) ) ( not ( = ?auto_377915 ?auto_377917 ) ) ( not ( = ?auto_377916 ?auto_377917 ) ) ( ON ?auto_377915 ?auto_377916 ) ( ON ?auto_377914 ?auto_377915 ) ( ON ?auto_377913 ?auto_377914 ) ( ON ?auto_377912 ?auto_377913 ) ( ON ?auto_377911 ?auto_377912 ) ( ON ?auto_377910 ?auto_377911 ) ( ON ?auto_377909 ?auto_377910 ) ( ON ?auto_377908 ?auto_377909 ) ( ON ?auto_377907 ?auto_377908 ) ( CLEAR ?auto_377907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_377907 )
      ( MAKE-10PILE ?auto_377907 ?auto_377908 ?auto_377909 ?auto_377910 ?auto_377911 ?auto_377912 ?auto_377913 ?auto_377914 ?auto_377915 ?auto_377916 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_377929 - BLOCK
      ?auto_377930 - BLOCK
      ?auto_377931 - BLOCK
      ?auto_377932 - BLOCK
      ?auto_377933 - BLOCK
      ?auto_377934 - BLOCK
      ?auto_377935 - BLOCK
      ?auto_377936 - BLOCK
      ?auto_377937 - BLOCK
      ?auto_377938 - BLOCK
      ?auto_377939 - BLOCK
    )
    :vars
    (
      ?auto_377940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_377938 ) ( ON ?auto_377939 ?auto_377940 ) ( CLEAR ?auto_377939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_377929 ) ( ON ?auto_377930 ?auto_377929 ) ( ON ?auto_377931 ?auto_377930 ) ( ON ?auto_377932 ?auto_377931 ) ( ON ?auto_377933 ?auto_377932 ) ( ON ?auto_377934 ?auto_377933 ) ( ON ?auto_377935 ?auto_377934 ) ( ON ?auto_377936 ?auto_377935 ) ( ON ?auto_377937 ?auto_377936 ) ( ON ?auto_377938 ?auto_377937 ) ( not ( = ?auto_377929 ?auto_377930 ) ) ( not ( = ?auto_377929 ?auto_377931 ) ) ( not ( = ?auto_377929 ?auto_377932 ) ) ( not ( = ?auto_377929 ?auto_377933 ) ) ( not ( = ?auto_377929 ?auto_377934 ) ) ( not ( = ?auto_377929 ?auto_377935 ) ) ( not ( = ?auto_377929 ?auto_377936 ) ) ( not ( = ?auto_377929 ?auto_377937 ) ) ( not ( = ?auto_377929 ?auto_377938 ) ) ( not ( = ?auto_377929 ?auto_377939 ) ) ( not ( = ?auto_377929 ?auto_377940 ) ) ( not ( = ?auto_377930 ?auto_377931 ) ) ( not ( = ?auto_377930 ?auto_377932 ) ) ( not ( = ?auto_377930 ?auto_377933 ) ) ( not ( = ?auto_377930 ?auto_377934 ) ) ( not ( = ?auto_377930 ?auto_377935 ) ) ( not ( = ?auto_377930 ?auto_377936 ) ) ( not ( = ?auto_377930 ?auto_377937 ) ) ( not ( = ?auto_377930 ?auto_377938 ) ) ( not ( = ?auto_377930 ?auto_377939 ) ) ( not ( = ?auto_377930 ?auto_377940 ) ) ( not ( = ?auto_377931 ?auto_377932 ) ) ( not ( = ?auto_377931 ?auto_377933 ) ) ( not ( = ?auto_377931 ?auto_377934 ) ) ( not ( = ?auto_377931 ?auto_377935 ) ) ( not ( = ?auto_377931 ?auto_377936 ) ) ( not ( = ?auto_377931 ?auto_377937 ) ) ( not ( = ?auto_377931 ?auto_377938 ) ) ( not ( = ?auto_377931 ?auto_377939 ) ) ( not ( = ?auto_377931 ?auto_377940 ) ) ( not ( = ?auto_377932 ?auto_377933 ) ) ( not ( = ?auto_377932 ?auto_377934 ) ) ( not ( = ?auto_377932 ?auto_377935 ) ) ( not ( = ?auto_377932 ?auto_377936 ) ) ( not ( = ?auto_377932 ?auto_377937 ) ) ( not ( = ?auto_377932 ?auto_377938 ) ) ( not ( = ?auto_377932 ?auto_377939 ) ) ( not ( = ?auto_377932 ?auto_377940 ) ) ( not ( = ?auto_377933 ?auto_377934 ) ) ( not ( = ?auto_377933 ?auto_377935 ) ) ( not ( = ?auto_377933 ?auto_377936 ) ) ( not ( = ?auto_377933 ?auto_377937 ) ) ( not ( = ?auto_377933 ?auto_377938 ) ) ( not ( = ?auto_377933 ?auto_377939 ) ) ( not ( = ?auto_377933 ?auto_377940 ) ) ( not ( = ?auto_377934 ?auto_377935 ) ) ( not ( = ?auto_377934 ?auto_377936 ) ) ( not ( = ?auto_377934 ?auto_377937 ) ) ( not ( = ?auto_377934 ?auto_377938 ) ) ( not ( = ?auto_377934 ?auto_377939 ) ) ( not ( = ?auto_377934 ?auto_377940 ) ) ( not ( = ?auto_377935 ?auto_377936 ) ) ( not ( = ?auto_377935 ?auto_377937 ) ) ( not ( = ?auto_377935 ?auto_377938 ) ) ( not ( = ?auto_377935 ?auto_377939 ) ) ( not ( = ?auto_377935 ?auto_377940 ) ) ( not ( = ?auto_377936 ?auto_377937 ) ) ( not ( = ?auto_377936 ?auto_377938 ) ) ( not ( = ?auto_377936 ?auto_377939 ) ) ( not ( = ?auto_377936 ?auto_377940 ) ) ( not ( = ?auto_377937 ?auto_377938 ) ) ( not ( = ?auto_377937 ?auto_377939 ) ) ( not ( = ?auto_377937 ?auto_377940 ) ) ( not ( = ?auto_377938 ?auto_377939 ) ) ( not ( = ?auto_377938 ?auto_377940 ) ) ( not ( = ?auto_377939 ?auto_377940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_377939 ?auto_377940 )
      ( !STACK ?auto_377939 ?auto_377938 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_377952 - BLOCK
      ?auto_377953 - BLOCK
      ?auto_377954 - BLOCK
      ?auto_377955 - BLOCK
      ?auto_377956 - BLOCK
      ?auto_377957 - BLOCK
      ?auto_377958 - BLOCK
      ?auto_377959 - BLOCK
      ?auto_377960 - BLOCK
      ?auto_377961 - BLOCK
      ?auto_377962 - BLOCK
    )
    :vars
    (
      ?auto_377963 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_377961 ) ( ON ?auto_377962 ?auto_377963 ) ( CLEAR ?auto_377962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_377952 ) ( ON ?auto_377953 ?auto_377952 ) ( ON ?auto_377954 ?auto_377953 ) ( ON ?auto_377955 ?auto_377954 ) ( ON ?auto_377956 ?auto_377955 ) ( ON ?auto_377957 ?auto_377956 ) ( ON ?auto_377958 ?auto_377957 ) ( ON ?auto_377959 ?auto_377958 ) ( ON ?auto_377960 ?auto_377959 ) ( ON ?auto_377961 ?auto_377960 ) ( not ( = ?auto_377952 ?auto_377953 ) ) ( not ( = ?auto_377952 ?auto_377954 ) ) ( not ( = ?auto_377952 ?auto_377955 ) ) ( not ( = ?auto_377952 ?auto_377956 ) ) ( not ( = ?auto_377952 ?auto_377957 ) ) ( not ( = ?auto_377952 ?auto_377958 ) ) ( not ( = ?auto_377952 ?auto_377959 ) ) ( not ( = ?auto_377952 ?auto_377960 ) ) ( not ( = ?auto_377952 ?auto_377961 ) ) ( not ( = ?auto_377952 ?auto_377962 ) ) ( not ( = ?auto_377952 ?auto_377963 ) ) ( not ( = ?auto_377953 ?auto_377954 ) ) ( not ( = ?auto_377953 ?auto_377955 ) ) ( not ( = ?auto_377953 ?auto_377956 ) ) ( not ( = ?auto_377953 ?auto_377957 ) ) ( not ( = ?auto_377953 ?auto_377958 ) ) ( not ( = ?auto_377953 ?auto_377959 ) ) ( not ( = ?auto_377953 ?auto_377960 ) ) ( not ( = ?auto_377953 ?auto_377961 ) ) ( not ( = ?auto_377953 ?auto_377962 ) ) ( not ( = ?auto_377953 ?auto_377963 ) ) ( not ( = ?auto_377954 ?auto_377955 ) ) ( not ( = ?auto_377954 ?auto_377956 ) ) ( not ( = ?auto_377954 ?auto_377957 ) ) ( not ( = ?auto_377954 ?auto_377958 ) ) ( not ( = ?auto_377954 ?auto_377959 ) ) ( not ( = ?auto_377954 ?auto_377960 ) ) ( not ( = ?auto_377954 ?auto_377961 ) ) ( not ( = ?auto_377954 ?auto_377962 ) ) ( not ( = ?auto_377954 ?auto_377963 ) ) ( not ( = ?auto_377955 ?auto_377956 ) ) ( not ( = ?auto_377955 ?auto_377957 ) ) ( not ( = ?auto_377955 ?auto_377958 ) ) ( not ( = ?auto_377955 ?auto_377959 ) ) ( not ( = ?auto_377955 ?auto_377960 ) ) ( not ( = ?auto_377955 ?auto_377961 ) ) ( not ( = ?auto_377955 ?auto_377962 ) ) ( not ( = ?auto_377955 ?auto_377963 ) ) ( not ( = ?auto_377956 ?auto_377957 ) ) ( not ( = ?auto_377956 ?auto_377958 ) ) ( not ( = ?auto_377956 ?auto_377959 ) ) ( not ( = ?auto_377956 ?auto_377960 ) ) ( not ( = ?auto_377956 ?auto_377961 ) ) ( not ( = ?auto_377956 ?auto_377962 ) ) ( not ( = ?auto_377956 ?auto_377963 ) ) ( not ( = ?auto_377957 ?auto_377958 ) ) ( not ( = ?auto_377957 ?auto_377959 ) ) ( not ( = ?auto_377957 ?auto_377960 ) ) ( not ( = ?auto_377957 ?auto_377961 ) ) ( not ( = ?auto_377957 ?auto_377962 ) ) ( not ( = ?auto_377957 ?auto_377963 ) ) ( not ( = ?auto_377958 ?auto_377959 ) ) ( not ( = ?auto_377958 ?auto_377960 ) ) ( not ( = ?auto_377958 ?auto_377961 ) ) ( not ( = ?auto_377958 ?auto_377962 ) ) ( not ( = ?auto_377958 ?auto_377963 ) ) ( not ( = ?auto_377959 ?auto_377960 ) ) ( not ( = ?auto_377959 ?auto_377961 ) ) ( not ( = ?auto_377959 ?auto_377962 ) ) ( not ( = ?auto_377959 ?auto_377963 ) ) ( not ( = ?auto_377960 ?auto_377961 ) ) ( not ( = ?auto_377960 ?auto_377962 ) ) ( not ( = ?auto_377960 ?auto_377963 ) ) ( not ( = ?auto_377961 ?auto_377962 ) ) ( not ( = ?auto_377961 ?auto_377963 ) ) ( not ( = ?auto_377962 ?auto_377963 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_377962 ?auto_377963 )
      ( !STACK ?auto_377962 ?auto_377961 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_377975 - BLOCK
      ?auto_377976 - BLOCK
      ?auto_377977 - BLOCK
      ?auto_377978 - BLOCK
      ?auto_377979 - BLOCK
      ?auto_377980 - BLOCK
      ?auto_377981 - BLOCK
      ?auto_377982 - BLOCK
      ?auto_377983 - BLOCK
      ?auto_377984 - BLOCK
      ?auto_377985 - BLOCK
    )
    :vars
    (
      ?auto_377986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377985 ?auto_377986 ) ( ON-TABLE ?auto_377975 ) ( ON ?auto_377976 ?auto_377975 ) ( ON ?auto_377977 ?auto_377976 ) ( ON ?auto_377978 ?auto_377977 ) ( ON ?auto_377979 ?auto_377978 ) ( ON ?auto_377980 ?auto_377979 ) ( ON ?auto_377981 ?auto_377980 ) ( ON ?auto_377982 ?auto_377981 ) ( ON ?auto_377983 ?auto_377982 ) ( not ( = ?auto_377975 ?auto_377976 ) ) ( not ( = ?auto_377975 ?auto_377977 ) ) ( not ( = ?auto_377975 ?auto_377978 ) ) ( not ( = ?auto_377975 ?auto_377979 ) ) ( not ( = ?auto_377975 ?auto_377980 ) ) ( not ( = ?auto_377975 ?auto_377981 ) ) ( not ( = ?auto_377975 ?auto_377982 ) ) ( not ( = ?auto_377975 ?auto_377983 ) ) ( not ( = ?auto_377975 ?auto_377984 ) ) ( not ( = ?auto_377975 ?auto_377985 ) ) ( not ( = ?auto_377975 ?auto_377986 ) ) ( not ( = ?auto_377976 ?auto_377977 ) ) ( not ( = ?auto_377976 ?auto_377978 ) ) ( not ( = ?auto_377976 ?auto_377979 ) ) ( not ( = ?auto_377976 ?auto_377980 ) ) ( not ( = ?auto_377976 ?auto_377981 ) ) ( not ( = ?auto_377976 ?auto_377982 ) ) ( not ( = ?auto_377976 ?auto_377983 ) ) ( not ( = ?auto_377976 ?auto_377984 ) ) ( not ( = ?auto_377976 ?auto_377985 ) ) ( not ( = ?auto_377976 ?auto_377986 ) ) ( not ( = ?auto_377977 ?auto_377978 ) ) ( not ( = ?auto_377977 ?auto_377979 ) ) ( not ( = ?auto_377977 ?auto_377980 ) ) ( not ( = ?auto_377977 ?auto_377981 ) ) ( not ( = ?auto_377977 ?auto_377982 ) ) ( not ( = ?auto_377977 ?auto_377983 ) ) ( not ( = ?auto_377977 ?auto_377984 ) ) ( not ( = ?auto_377977 ?auto_377985 ) ) ( not ( = ?auto_377977 ?auto_377986 ) ) ( not ( = ?auto_377978 ?auto_377979 ) ) ( not ( = ?auto_377978 ?auto_377980 ) ) ( not ( = ?auto_377978 ?auto_377981 ) ) ( not ( = ?auto_377978 ?auto_377982 ) ) ( not ( = ?auto_377978 ?auto_377983 ) ) ( not ( = ?auto_377978 ?auto_377984 ) ) ( not ( = ?auto_377978 ?auto_377985 ) ) ( not ( = ?auto_377978 ?auto_377986 ) ) ( not ( = ?auto_377979 ?auto_377980 ) ) ( not ( = ?auto_377979 ?auto_377981 ) ) ( not ( = ?auto_377979 ?auto_377982 ) ) ( not ( = ?auto_377979 ?auto_377983 ) ) ( not ( = ?auto_377979 ?auto_377984 ) ) ( not ( = ?auto_377979 ?auto_377985 ) ) ( not ( = ?auto_377979 ?auto_377986 ) ) ( not ( = ?auto_377980 ?auto_377981 ) ) ( not ( = ?auto_377980 ?auto_377982 ) ) ( not ( = ?auto_377980 ?auto_377983 ) ) ( not ( = ?auto_377980 ?auto_377984 ) ) ( not ( = ?auto_377980 ?auto_377985 ) ) ( not ( = ?auto_377980 ?auto_377986 ) ) ( not ( = ?auto_377981 ?auto_377982 ) ) ( not ( = ?auto_377981 ?auto_377983 ) ) ( not ( = ?auto_377981 ?auto_377984 ) ) ( not ( = ?auto_377981 ?auto_377985 ) ) ( not ( = ?auto_377981 ?auto_377986 ) ) ( not ( = ?auto_377982 ?auto_377983 ) ) ( not ( = ?auto_377982 ?auto_377984 ) ) ( not ( = ?auto_377982 ?auto_377985 ) ) ( not ( = ?auto_377982 ?auto_377986 ) ) ( not ( = ?auto_377983 ?auto_377984 ) ) ( not ( = ?auto_377983 ?auto_377985 ) ) ( not ( = ?auto_377983 ?auto_377986 ) ) ( not ( = ?auto_377984 ?auto_377985 ) ) ( not ( = ?auto_377984 ?auto_377986 ) ) ( not ( = ?auto_377985 ?auto_377986 ) ) ( CLEAR ?auto_377983 ) ( ON ?auto_377984 ?auto_377985 ) ( CLEAR ?auto_377984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_377975 ?auto_377976 ?auto_377977 ?auto_377978 ?auto_377979 ?auto_377980 ?auto_377981 ?auto_377982 ?auto_377983 ?auto_377984 )
      ( MAKE-11PILE ?auto_377975 ?auto_377976 ?auto_377977 ?auto_377978 ?auto_377979 ?auto_377980 ?auto_377981 ?auto_377982 ?auto_377983 ?auto_377984 ?auto_377985 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_377998 - BLOCK
      ?auto_377999 - BLOCK
      ?auto_378000 - BLOCK
      ?auto_378001 - BLOCK
      ?auto_378002 - BLOCK
      ?auto_378003 - BLOCK
      ?auto_378004 - BLOCK
      ?auto_378005 - BLOCK
      ?auto_378006 - BLOCK
      ?auto_378007 - BLOCK
      ?auto_378008 - BLOCK
    )
    :vars
    (
      ?auto_378009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378008 ?auto_378009 ) ( ON-TABLE ?auto_377998 ) ( ON ?auto_377999 ?auto_377998 ) ( ON ?auto_378000 ?auto_377999 ) ( ON ?auto_378001 ?auto_378000 ) ( ON ?auto_378002 ?auto_378001 ) ( ON ?auto_378003 ?auto_378002 ) ( ON ?auto_378004 ?auto_378003 ) ( ON ?auto_378005 ?auto_378004 ) ( ON ?auto_378006 ?auto_378005 ) ( not ( = ?auto_377998 ?auto_377999 ) ) ( not ( = ?auto_377998 ?auto_378000 ) ) ( not ( = ?auto_377998 ?auto_378001 ) ) ( not ( = ?auto_377998 ?auto_378002 ) ) ( not ( = ?auto_377998 ?auto_378003 ) ) ( not ( = ?auto_377998 ?auto_378004 ) ) ( not ( = ?auto_377998 ?auto_378005 ) ) ( not ( = ?auto_377998 ?auto_378006 ) ) ( not ( = ?auto_377998 ?auto_378007 ) ) ( not ( = ?auto_377998 ?auto_378008 ) ) ( not ( = ?auto_377998 ?auto_378009 ) ) ( not ( = ?auto_377999 ?auto_378000 ) ) ( not ( = ?auto_377999 ?auto_378001 ) ) ( not ( = ?auto_377999 ?auto_378002 ) ) ( not ( = ?auto_377999 ?auto_378003 ) ) ( not ( = ?auto_377999 ?auto_378004 ) ) ( not ( = ?auto_377999 ?auto_378005 ) ) ( not ( = ?auto_377999 ?auto_378006 ) ) ( not ( = ?auto_377999 ?auto_378007 ) ) ( not ( = ?auto_377999 ?auto_378008 ) ) ( not ( = ?auto_377999 ?auto_378009 ) ) ( not ( = ?auto_378000 ?auto_378001 ) ) ( not ( = ?auto_378000 ?auto_378002 ) ) ( not ( = ?auto_378000 ?auto_378003 ) ) ( not ( = ?auto_378000 ?auto_378004 ) ) ( not ( = ?auto_378000 ?auto_378005 ) ) ( not ( = ?auto_378000 ?auto_378006 ) ) ( not ( = ?auto_378000 ?auto_378007 ) ) ( not ( = ?auto_378000 ?auto_378008 ) ) ( not ( = ?auto_378000 ?auto_378009 ) ) ( not ( = ?auto_378001 ?auto_378002 ) ) ( not ( = ?auto_378001 ?auto_378003 ) ) ( not ( = ?auto_378001 ?auto_378004 ) ) ( not ( = ?auto_378001 ?auto_378005 ) ) ( not ( = ?auto_378001 ?auto_378006 ) ) ( not ( = ?auto_378001 ?auto_378007 ) ) ( not ( = ?auto_378001 ?auto_378008 ) ) ( not ( = ?auto_378001 ?auto_378009 ) ) ( not ( = ?auto_378002 ?auto_378003 ) ) ( not ( = ?auto_378002 ?auto_378004 ) ) ( not ( = ?auto_378002 ?auto_378005 ) ) ( not ( = ?auto_378002 ?auto_378006 ) ) ( not ( = ?auto_378002 ?auto_378007 ) ) ( not ( = ?auto_378002 ?auto_378008 ) ) ( not ( = ?auto_378002 ?auto_378009 ) ) ( not ( = ?auto_378003 ?auto_378004 ) ) ( not ( = ?auto_378003 ?auto_378005 ) ) ( not ( = ?auto_378003 ?auto_378006 ) ) ( not ( = ?auto_378003 ?auto_378007 ) ) ( not ( = ?auto_378003 ?auto_378008 ) ) ( not ( = ?auto_378003 ?auto_378009 ) ) ( not ( = ?auto_378004 ?auto_378005 ) ) ( not ( = ?auto_378004 ?auto_378006 ) ) ( not ( = ?auto_378004 ?auto_378007 ) ) ( not ( = ?auto_378004 ?auto_378008 ) ) ( not ( = ?auto_378004 ?auto_378009 ) ) ( not ( = ?auto_378005 ?auto_378006 ) ) ( not ( = ?auto_378005 ?auto_378007 ) ) ( not ( = ?auto_378005 ?auto_378008 ) ) ( not ( = ?auto_378005 ?auto_378009 ) ) ( not ( = ?auto_378006 ?auto_378007 ) ) ( not ( = ?auto_378006 ?auto_378008 ) ) ( not ( = ?auto_378006 ?auto_378009 ) ) ( not ( = ?auto_378007 ?auto_378008 ) ) ( not ( = ?auto_378007 ?auto_378009 ) ) ( not ( = ?auto_378008 ?auto_378009 ) ) ( CLEAR ?auto_378006 ) ( ON ?auto_378007 ?auto_378008 ) ( CLEAR ?auto_378007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_377998 ?auto_377999 ?auto_378000 ?auto_378001 ?auto_378002 ?auto_378003 ?auto_378004 ?auto_378005 ?auto_378006 ?auto_378007 )
      ( MAKE-11PILE ?auto_377998 ?auto_377999 ?auto_378000 ?auto_378001 ?auto_378002 ?auto_378003 ?auto_378004 ?auto_378005 ?auto_378006 ?auto_378007 ?auto_378008 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378021 - BLOCK
      ?auto_378022 - BLOCK
      ?auto_378023 - BLOCK
      ?auto_378024 - BLOCK
      ?auto_378025 - BLOCK
      ?auto_378026 - BLOCK
      ?auto_378027 - BLOCK
      ?auto_378028 - BLOCK
      ?auto_378029 - BLOCK
      ?auto_378030 - BLOCK
      ?auto_378031 - BLOCK
    )
    :vars
    (
      ?auto_378032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378031 ?auto_378032 ) ( ON-TABLE ?auto_378021 ) ( ON ?auto_378022 ?auto_378021 ) ( ON ?auto_378023 ?auto_378022 ) ( ON ?auto_378024 ?auto_378023 ) ( ON ?auto_378025 ?auto_378024 ) ( ON ?auto_378026 ?auto_378025 ) ( ON ?auto_378027 ?auto_378026 ) ( ON ?auto_378028 ?auto_378027 ) ( not ( = ?auto_378021 ?auto_378022 ) ) ( not ( = ?auto_378021 ?auto_378023 ) ) ( not ( = ?auto_378021 ?auto_378024 ) ) ( not ( = ?auto_378021 ?auto_378025 ) ) ( not ( = ?auto_378021 ?auto_378026 ) ) ( not ( = ?auto_378021 ?auto_378027 ) ) ( not ( = ?auto_378021 ?auto_378028 ) ) ( not ( = ?auto_378021 ?auto_378029 ) ) ( not ( = ?auto_378021 ?auto_378030 ) ) ( not ( = ?auto_378021 ?auto_378031 ) ) ( not ( = ?auto_378021 ?auto_378032 ) ) ( not ( = ?auto_378022 ?auto_378023 ) ) ( not ( = ?auto_378022 ?auto_378024 ) ) ( not ( = ?auto_378022 ?auto_378025 ) ) ( not ( = ?auto_378022 ?auto_378026 ) ) ( not ( = ?auto_378022 ?auto_378027 ) ) ( not ( = ?auto_378022 ?auto_378028 ) ) ( not ( = ?auto_378022 ?auto_378029 ) ) ( not ( = ?auto_378022 ?auto_378030 ) ) ( not ( = ?auto_378022 ?auto_378031 ) ) ( not ( = ?auto_378022 ?auto_378032 ) ) ( not ( = ?auto_378023 ?auto_378024 ) ) ( not ( = ?auto_378023 ?auto_378025 ) ) ( not ( = ?auto_378023 ?auto_378026 ) ) ( not ( = ?auto_378023 ?auto_378027 ) ) ( not ( = ?auto_378023 ?auto_378028 ) ) ( not ( = ?auto_378023 ?auto_378029 ) ) ( not ( = ?auto_378023 ?auto_378030 ) ) ( not ( = ?auto_378023 ?auto_378031 ) ) ( not ( = ?auto_378023 ?auto_378032 ) ) ( not ( = ?auto_378024 ?auto_378025 ) ) ( not ( = ?auto_378024 ?auto_378026 ) ) ( not ( = ?auto_378024 ?auto_378027 ) ) ( not ( = ?auto_378024 ?auto_378028 ) ) ( not ( = ?auto_378024 ?auto_378029 ) ) ( not ( = ?auto_378024 ?auto_378030 ) ) ( not ( = ?auto_378024 ?auto_378031 ) ) ( not ( = ?auto_378024 ?auto_378032 ) ) ( not ( = ?auto_378025 ?auto_378026 ) ) ( not ( = ?auto_378025 ?auto_378027 ) ) ( not ( = ?auto_378025 ?auto_378028 ) ) ( not ( = ?auto_378025 ?auto_378029 ) ) ( not ( = ?auto_378025 ?auto_378030 ) ) ( not ( = ?auto_378025 ?auto_378031 ) ) ( not ( = ?auto_378025 ?auto_378032 ) ) ( not ( = ?auto_378026 ?auto_378027 ) ) ( not ( = ?auto_378026 ?auto_378028 ) ) ( not ( = ?auto_378026 ?auto_378029 ) ) ( not ( = ?auto_378026 ?auto_378030 ) ) ( not ( = ?auto_378026 ?auto_378031 ) ) ( not ( = ?auto_378026 ?auto_378032 ) ) ( not ( = ?auto_378027 ?auto_378028 ) ) ( not ( = ?auto_378027 ?auto_378029 ) ) ( not ( = ?auto_378027 ?auto_378030 ) ) ( not ( = ?auto_378027 ?auto_378031 ) ) ( not ( = ?auto_378027 ?auto_378032 ) ) ( not ( = ?auto_378028 ?auto_378029 ) ) ( not ( = ?auto_378028 ?auto_378030 ) ) ( not ( = ?auto_378028 ?auto_378031 ) ) ( not ( = ?auto_378028 ?auto_378032 ) ) ( not ( = ?auto_378029 ?auto_378030 ) ) ( not ( = ?auto_378029 ?auto_378031 ) ) ( not ( = ?auto_378029 ?auto_378032 ) ) ( not ( = ?auto_378030 ?auto_378031 ) ) ( not ( = ?auto_378030 ?auto_378032 ) ) ( not ( = ?auto_378031 ?auto_378032 ) ) ( ON ?auto_378030 ?auto_378031 ) ( CLEAR ?auto_378028 ) ( ON ?auto_378029 ?auto_378030 ) ( CLEAR ?auto_378029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_378021 ?auto_378022 ?auto_378023 ?auto_378024 ?auto_378025 ?auto_378026 ?auto_378027 ?auto_378028 ?auto_378029 )
      ( MAKE-11PILE ?auto_378021 ?auto_378022 ?auto_378023 ?auto_378024 ?auto_378025 ?auto_378026 ?auto_378027 ?auto_378028 ?auto_378029 ?auto_378030 ?auto_378031 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378044 - BLOCK
      ?auto_378045 - BLOCK
      ?auto_378046 - BLOCK
      ?auto_378047 - BLOCK
      ?auto_378048 - BLOCK
      ?auto_378049 - BLOCK
      ?auto_378050 - BLOCK
      ?auto_378051 - BLOCK
      ?auto_378052 - BLOCK
      ?auto_378053 - BLOCK
      ?auto_378054 - BLOCK
    )
    :vars
    (
      ?auto_378055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378054 ?auto_378055 ) ( ON-TABLE ?auto_378044 ) ( ON ?auto_378045 ?auto_378044 ) ( ON ?auto_378046 ?auto_378045 ) ( ON ?auto_378047 ?auto_378046 ) ( ON ?auto_378048 ?auto_378047 ) ( ON ?auto_378049 ?auto_378048 ) ( ON ?auto_378050 ?auto_378049 ) ( ON ?auto_378051 ?auto_378050 ) ( not ( = ?auto_378044 ?auto_378045 ) ) ( not ( = ?auto_378044 ?auto_378046 ) ) ( not ( = ?auto_378044 ?auto_378047 ) ) ( not ( = ?auto_378044 ?auto_378048 ) ) ( not ( = ?auto_378044 ?auto_378049 ) ) ( not ( = ?auto_378044 ?auto_378050 ) ) ( not ( = ?auto_378044 ?auto_378051 ) ) ( not ( = ?auto_378044 ?auto_378052 ) ) ( not ( = ?auto_378044 ?auto_378053 ) ) ( not ( = ?auto_378044 ?auto_378054 ) ) ( not ( = ?auto_378044 ?auto_378055 ) ) ( not ( = ?auto_378045 ?auto_378046 ) ) ( not ( = ?auto_378045 ?auto_378047 ) ) ( not ( = ?auto_378045 ?auto_378048 ) ) ( not ( = ?auto_378045 ?auto_378049 ) ) ( not ( = ?auto_378045 ?auto_378050 ) ) ( not ( = ?auto_378045 ?auto_378051 ) ) ( not ( = ?auto_378045 ?auto_378052 ) ) ( not ( = ?auto_378045 ?auto_378053 ) ) ( not ( = ?auto_378045 ?auto_378054 ) ) ( not ( = ?auto_378045 ?auto_378055 ) ) ( not ( = ?auto_378046 ?auto_378047 ) ) ( not ( = ?auto_378046 ?auto_378048 ) ) ( not ( = ?auto_378046 ?auto_378049 ) ) ( not ( = ?auto_378046 ?auto_378050 ) ) ( not ( = ?auto_378046 ?auto_378051 ) ) ( not ( = ?auto_378046 ?auto_378052 ) ) ( not ( = ?auto_378046 ?auto_378053 ) ) ( not ( = ?auto_378046 ?auto_378054 ) ) ( not ( = ?auto_378046 ?auto_378055 ) ) ( not ( = ?auto_378047 ?auto_378048 ) ) ( not ( = ?auto_378047 ?auto_378049 ) ) ( not ( = ?auto_378047 ?auto_378050 ) ) ( not ( = ?auto_378047 ?auto_378051 ) ) ( not ( = ?auto_378047 ?auto_378052 ) ) ( not ( = ?auto_378047 ?auto_378053 ) ) ( not ( = ?auto_378047 ?auto_378054 ) ) ( not ( = ?auto_378047 ?auto_378055 ) ) ( not ( = ?auto_378048 ?auto_378049 ) ) ( not ( = ?auto_378048 ?auto_378050 ) ) ( not ( = ?auto_378048 ?auto_378051 ) ) ( not ( = ?auto_378048 ?auto_378052 ) ) ( not ( = ?auto_378048 ?auto_378053 ) ) ( not ( = ?auto_378048 ?auto_378054 ) ) ( not ( = ?auto_378048 ?auto_378055 ) ) ( not ( = ?auto_378049 ?auto_378050 ) ) ( not ( = ?auto_378049 ?auto_378051 ) ) ( not ( = ?auto_378049 ?auto_378052 ) ) ( not ( = ?auto_378049 ?auto_378053 ) ) ( not ( = ?auto_378049 ?auto_378054 ) ) ( not ( = ?auto_378049 ?auto_378055 ) ) ( not ( = ?auto_378050 ?auto_378051 ) ) ( not ( = ?auto_378050 ?auto_378052 ) ) ( not ( = ?auto_378050 ?auto_378053 ) ) ( not ( = ?auto_378050 ?auto_378054 ) ) ( not ( = ?auto_378050 ?auto_378055 ) ) ( not ( = ?auto_378051 ?auto_378052 ) ) ( not ( = ?auto_378051 ?auto_378053 ) ) ( not ( = ?auto_378051 ?auto_378054 ) ) ( not ( = ?auto_378051 ?auto_378055 ) ) ( not ( = ?auto_378052 ?auto_378053 ) ) ( not ( = ?auto_378052 ?auto_378054 ) ) ( not ( = ?auto_378052 ?auto_378055 ) ) ( not ( = ?auto_378053 ?auto_378054 ) ) ( not ( = ?auto_378053 ?auto_378055 ) ) ( not ( = ?auto_378054 ?auto_378055 ) ) ( ON ?auto_378053 ?auto_378054 ) ( CLEAR ?auto_378051 ) ( ON ?auto_378052 ?auto_378053 ) ( CLEAR ?auto_378052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_378044 ?auto_378045 ?auto_378046 ?auto_378047 ?auto_378048 ?auto_378049 ?auto_378050 ?auto_378051 ?auto_378052 )
      ( MAKE-11PILE ?auto_378044 ?auto_378045 ?auto_378046 ?auto_378047 ?auto_378048 ?auto_378049 ?auto_378050 ?auto_378051 ?auto_378052 ?auto_378053 ?auto_378054 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378067 - BLOCK
      ?auto_378068 - BLOCK
      ?auto_378069 - BLOCK
      ?auto_378070 - BLOCK
      ?auto_378071 - BLOCK
      ?auto_378072 - BLOCK
      ?auto_378073 - BLOCK
      ?auto_378074 - BLOCK
      ?auto_378075 - BLOCK
      ?auto_378076 - BLOCK
      ?auto_378077 - BLOCK
    )
    :vars
    (
      ?auto_378078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378077 ?auto_378078 ) ( ON-TABLE ?auto_378067 ) ( ON ?auto_378068 ?auto_378067 ) ( ON ?auto_378069 ?auto_378068 ) ( ON ?auto_378070 ?auto_378069 ) ( ON ?auto_378071 ?auto_378070 ) ( ON ?auto_378072 ?auto_378071 ) ( ON ?auto_378073 ?auto_378072 ) ( not ( = ?auto_378067 ?auto_378068 ) ) ( not ( = ?auto_378067 ?auto_378069 ) ) ( not ( = ?auto_378067 ?auto_378070 ) ) ( not ( = ?auto_378067 ?auto_378071 ) ) ( not ( = ?auto_378067 ?auto_378072 ) ) ( not ( = ?auto_378067 ?auto_378073 ) ) ( not ( = ?auto_378067 ?auto_378074 ) ) ( not ( = ?auto_378067 ?auto_378075 ) ) ( not ( = ?auto_378067 ?auto_378076 ) ) ( not ( = ?auto_378067 ?auto_378077 ) ) ( not ( = ?auto_378067 ?auto_378078 ) ) ( not ( = ?auto_378068 ?auto_378069 ) ) ( not ( = ?auto_378068 ?auto_378070 ) ) ( not ( = ?auto_378068 ?auto_378071 ) ) ( not ( = ?auto_378068 ?auto_378072 ) ) ( not ( = ?auto_378068 ?auto_378073 ) ) ( not ( = ?auto_378068 ?auto_378074 ) ) ( not ( = ?auto_378068 ?auto_378075 ) ) ( not ( = ?auto_378068 ?auto_378076 ) ) ( not ( = ?auto_378068 ?auto_378077 ) ) ( not ( = ?auto_378068 ?auto_378078 ) ) ( not ( = ?auto_378069 ?auto_378070 ) ) ( not ( = ?auto_378069 ?auto_378071 ) ) ( not ( = ?auto_378069 ?auto_378072 ) ) ( not ( = ?auto_378069 ?auto_378073 ) ) ( not ( = ?auto_378069 ?auto_378074 ) ) ( not ( = ?auto_378069 ?auto_378075 ) ) ( not ( = ?auto_378069 ?auto_378076 ) ) ( not ( = ?auto_378069 ?auto_378077 ) ) ( not ( = ?auto_378069 ?auto_378078 ) ) ( not ( = ?auto_378070 ?auto_378071 ) ) ( not ( = ?auto_378070 ?auto_378072 ) ) ( not ( = ?auto_378070 ?auto_378073 ) ) ( not ( = ?auto_378070 ?auto_378074 ) ) ( not ( = ?auto_378070 ?auto_378075 ) ) ( not ( = ?auto_378070 ?auto_378076 ) ) ( not ( = ?auto_378070 ?auto_378077 ) ) ( not ( = ?auto_378070 ?auto_378078 ) ) ( not ( = ?auto_378071 ?auto_378072 ) ) ( not ( = ?auto_378071 ?auto_378073 ) ) ( not ( = ?auto_378071 ?auto_378074 ) ) ( not ( = ?auto_378071 ?auto_378075 ) ) ( not ( = ?auto_378071 ?auto_378076 ) ) ( not ( = ?auto_378071 ?auto_378077 ) ) ( not ( = ?auto_378071 ?auto_378078 ) ) ( not ( = ?auto_378072 ?auto_378073 ) ) ( not ( = ?auto_378072 ?auto_378074 ) ) ( not ( = ?auto_378072 ?auto_378075 ) ) ( not ( = ?auto_378072 ?auto_378076 ) ) ( not ( = ?auto_378072 ?auto_378077 ) ) ( not ( = ?auto_378072 ?auto_378078 ) ) ( not ( = ?auto_378073 ?auto_378074 ) ) ( not ( = ?auto_378073 ?auto_378075 ) ) ( not ( = ?auto_378073 ?auto_378076 ) ) ( not ( = ?auto_378073 ?auto_378077 ) ) ( not ( = ?auto_378073 ?auto_378078 ) ) ( not ( = ?auto_378074 ?auto_378075 ) ) ( not ( = ?auto_378074 ?auto_378076 ) ) ( not ( = ?auto_378074 ?auto_378077 ) ) ( not ( = ?auto_378074 ?auto_378078 ) ) ( not ( = ?auto_378075 ?auto_378076 ) ) ( not ( = ?auto_378075 ?auto_378077 ) ) ( not ( = ?auto_378075 ?auto_378078 ) ) ( not ( = ?auto_378076 ?auto_378077 ) ) ( not ( = ?auto_378076 ?auto_378078 ) ) ( not ( = ?auto_378077 ?auto_378078 ) ) ( ON ?auto_378076 ?auto_378077 ) ( ON ?auto_378075 ?auto_378076 ) ( CLEAR ?auto_378073 ) ( ON ?auto_378074 ?auto_378075 ) ( CLEAR ?auto_378074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_378067 ?auto_378068 ?auto_378069 ?auto_378070 ?auto_378071 ?auto_378072 ?auto_378073 ?auto_378074 )
      ( MAKE-11PILE ?auto_378067 ?auto_378068 ?auto_378069 ?auto_378070 ?auto_378071 ?auto_378072 ?auto_378073 ?auto_378074 ?auto_378075 ?auto_378076 ?auto_378077 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378090 - BLOCK
      ?auto_378091 - BLOCK
      ?auto_378092 - BLOCK
      ?auto_378093 - BLOCK
      ?auto_378094 - BLOCK
      ?auto_378095 - BLOCK
      ?auto_378096 - BLOCK
      ?auto_378097 - BLOCK
      ?auto_378098 - BLOCK
      ?auto_378099 - BLOCK
      ?auto_378100 - BLOCK
    )
    :vars
    (
      ?auto_378101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378100 ?auto_378101 ) ( ON-TABLE ?auto_378090 ) ( ON ?auto_378091 ?auto_378090 ) ( ON ?auto_378092 ?auto_378091 ) ( ON ?auto_378093 ?auto_378092 ) ( ON ?auto_378094 ?auto_378093 ) ( ON ?auto_378095 ?auto_378094 ) ( ON ?auto_378096 ?auto_378095 ) ( not ( = ?auto_378090 ?auto_378091 ) ) ( not ( = ?auto_378090 ?auto_378092 ) ) ( not ( = ?auto_378090 ?auto_378093 ) ) ( not ( = ?auto_378090 ?auto_378094 ) ) ( not ( = ?auto_378090 ?auto_378095 ) ) ( not ( = ?auto_378090 ?auto_378096 ) ) ( not ( = ?auto_378090 ?auto_378097 ) ) ( not ( = ?auto_378090 ?auto_378098 ) ) ( not ( = ?auto_378090 ?auto_378099 ) ) ( not ( = ?auto_378090 ?auto_378100 ) ) ( not ( = ?auto_378090 ?auto_378101 ) ) ( not ( = ?auto_378091 ?auto_378092 ) ) ( not ( = ?auto_378091 ?auto_378093 ) ) ( not ( = ?auto_378091 ?auto_378094 ) ) ( not ( = ?auto_378091 ?auto_378095 ) ) ( not ( = ?auto_378091 ?auto_378096 ) ) ( not ( = ?auto_378091 ?auto_378097 ) ) ( not ( = ?auto_378091 ?auto_378098 ) ) ( not ( = ?auto_378091 ?auto_378099 ) ) ( not ( = ?auto_378091 ?auto_378100 ) ) ( not ( = ?auto_378091 ?auto_378101 ) ) ( not ( = ?auto_378092 ?auto_378093 ) ) ( not ( = ?auto_378092 ?auto_378094 ) ) ( not ( = ?auto_378092 ?auto_378095 ) ) ( not ( = ?auto_378092 ?auto_378096 ) ) ( not ( = ?auto_378092 ?auto_378097 ) ) ( not ( = ?auto_378092 ?auto_378098 ) ) ( not ( = ?auto_378092 ?auto_378099 ) ) ( not ( = ?auto_378092 ?auto_378100 ) ) ( not ( = ?auto_378092 ?auto_378101 ) ) ( not ( = ?auto_378093 ?auto_378094 ) ) ( not ( = ?auto_378093 ?auto_378095 ) ) ( not ( = ?auto_378093 ?auto_378096 ) ) ( not ( = ?auto_378093 ?auto_378097 ) ) ( not ( = ?auto_378093 ?auto_378098 ) ) ( not ( = ?auto_378093 ?auto_378099 ) ) ( not ( = ?auto_378093 ?auto_378100 ) ) ( not ( = ?auto_378093 ?auto_378101 ) ) ( not ( = ?auto_378094 ?auto_378095 ) ) ( not ( = ?auto_378094 ?auto_378096 ) ) ( not ( = ?auto_378094 ?auto_378097 ) ) ( not ( = ?auto_378094 ?auto_378098 ) ) ( not ( = ?auto_378094 ?auto_378099 ) ) ( not ( = ?auto_378094 ?auto_378100 ) ) ( not ( = ?auto_378094 ?auto_378101 ) ) ( not ( = ?auto_378095 ?auto_378096 ) ) ( not ( = ?auto_378095 ?auto_378097 ) ) ( not ( = ?auto_378095 ?auto_378098 ) ) ( not ( = ?auto_378095 ?auto_378099 ) ) ( not ( = ?auto_378095 ?auto_378100 ) ) ( not ( = ?auto_378095 ?auto_378101 ) ) ( not ( = ?auto_378096 ?auto_378097 ) ) ( not ( = ?auto_378096 ?auto_378098 ) ) ( not ( = ?auto_378096 ?auto_378099 ) ) ( not ( = ?auto_378096 ?auto_378100 ) ) ( not ( = ?auto_378096 ?auto_378101 ) ) ( not ( = ?auto_378097 ?auto_378098 ) ) ( not ( = ?auto_378097 ?auto_378099 ) ) ( not ( = ?auto_378097 ?auto_378100 ) ) ( not ( = ?auto_378097 ?auto_378101 ) ) ( not ( = ?auto_378098 ?auto_378099 ) ) ( not ( = ?auto_378098 ?auto_378100 ) ) ( not ( = ?auto_378098 ?auto_378101 ) ) ( not ( = ?auto_378099 ?auto_378100 ) ) ( not ( = ?auto_378099 ?auto_378101 ) ) ( not ( = ?auto_378100 ?auto_378101 ) ) ( ON ?auto_378099 ?auto_378100 ) ( ON ?auto_378098 ?auto_378099 ) ( CLEAR ?auto_378096 ) ( ON ?auto_378097 ?auto_378098 ) ( CLEAR ?auto_378097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_378090 ?auto_378091 ?auto_378092 ?auto_378093 ?auto_378094 ?auto_378095 ?auto_378096 ?auto_378097 )
      ( MAKE-11PILE ?auto_378090 ?auto_378091 ?auto_378092 ?auto_378093 ?auto_378094 ?auto_378095 ?auto_378096 ?auto_378097 ?auto_378098 ?auto_378099 ?auto_378100 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378113 - BLOCK
      ?auto_378114 - BLOCK
      ?auto_378115 - BLOCK
      ?auto_378116 - BLOCK
      ?auto_378117 - BLOCK
      ?auto_378118 - BLOCK
      ?auto_378119 - BLOCK
      ?auto_378120 - BLOCK
      ?auto_378121 - BLOCK
      ?auto_378122 - BLOCK
      ?auto_378123 - BLOCK
    )
    :vars
    (
      ?auto_378124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378123 ?auto_378124 ) ( ON-TABLE ?auto_378113 ) ( ON ?auto_378114 ?auto_378113 ) ( ON ?auto_378115 ?auto_378114 ) ( ON ?auto_378116 ?auto_378115 ) ( ON ?auto_378117 ?auto_378116 ) ( ON ?auto_378118 ?auto_378117 ) ( not ( = ?auto_378113 ?auto_378114 ) ) ( not ( = ?auto_378113 ?auto_378115 ) ) ( not ( = ?auto_378113 ?auto_378116 ) ) ( not ( = ?auto_378113 ?auto_378117 ) ) ( not ( = ?auto_378113 ?auto_378118 ) ) ( not ( = ?auto_378113 ?auto_378119 ) ) ( not ( = ?auto_378113 ?auto_378120 ) ) ( not ( = ?auto_378113 ?auto_378121 ) ) ( not ( = ?auto_378113 ?auto_378122 ) ) ( not ( = ?auto_378113 ?auto_378123 ) ) ( not ( = ?auto_378113 ?auto_378124 ) ) ( not ( = ?auto_378114 ?auto_378115 ) ) ( not ( = ?auto_378114 ?auto_378116 ) ) ( not ( = ?auto_378114 ?auto_378117 ) ) ( not ( = ?auto_378114 ?auto_378118 ) ) ( not ( = ?auto_378114 ?auto_378119 ) ) ( not ( = ?auto_378114 ?auto_378120 ) ) ( not ( = ?auto_378114 ?auto_378121 ) ) ( not ( = ?auto_378114 ?auto_378122 ) ) ( not ( = ?auto_378114 ?auto_378123 ) ) ( not ( = ?auto_378114 ?auto_378124 ) ) ( not ( = ?auto_378115 ?auto_378116 ) ) ( not ( = ?auto_378115 ?auto_378117 ) ) ( not ( = ?auto_378115 ?auto_378118 ) ) ( not ( = ?auto_378115 ?auto_378119 ) ) ( not ( = ?auto_378115 ?auto_378120 ) ) ( not ( = ?auto_378115 ?auto_378121 ) ) ( not ( = ?auto_378115 ?auto_378122 ) ) ( not ( = ?auto_378115 ?auto_378123 ) ) ( not ( = ?auto_378115 ?auto_378124 ) ) ( not ( = ?auto_378116 ?auto_378117 ) ) ( not ( = ?auto_378116 ?auto_378118 ) ) ( not ( = ?auto_378116 ?auto_378119 ) ) ( not ( = ?auto_378116 ?auto_378120 ) ) ( not ( = ?auto_378116 ?auto_378121 ) ) ( not ( = ?auto_378116 ?auto_378122 ) ) ( not ( = ?auto_378116 ?auto_378123 ) ) ( not ( = ?auto_378116 ?auto_378124 ) ) ( not ( = ?auto_378117 ?auto_378118 ) ) ( not ( = ?auto_378117 ?auto_378119 ) ) ( not ( = ?auto_378117 ?auto_378120 ) ) ( not ( = ?auto_378117 ?auto_378121 ) ) ( not ( = ?auto_378117 ?auto_378122 ) ) ( not ( = ?auto_378117 ?auto_378123 ) ) ( not ( = ?auto_378117 ?auto_378124 ) ) ( not ( = ?auto_378118 ?auto_378119 ) ) ( not ( = ?auto_378118 ?auto_378120 ) ) ( not ( = ?auto_378118 ?auto_378121 ) ) ( not ( = ?auto_378118 ?auto_378122 ) ) ( not ( = ?auto_378118 ?auto_378123 ) ) ( not ( = ?auto_378118 ?auto_378124 ) ) ( not ( = ?auto_378119 ?auto_378120 ) ) ( not ( = ?auto_378119 ?auto_378121 ) ) ( not ( = ?auto_378119 ?auto_378122 ) ) ( not ( = ?auto_378119 ?auto_378123 ) ) ( not ( = ?auto_378119 ?auto_378124 ) ) ( not ( = ?auto_378120 ?auto_378121 ) ) ( not ( = ?auto_378120 ?auto_378122 ) ) ( not ( = ?auto_378120 ?auto_378123 ) ) ( not ( = ?auto_378120 ?auto_378124 ) ) ( not ( = ?auto_378121 ?auto_378122 ) ) ( not ( = ?auto_378121 ?auto_378123 ) ) ( not ( = ?auto_378121 ?auto_378124 ) ) ( not ( = ?auto_378122 ?auto_378123 ) ) ( not ( = ?auto_378122 ?auto_378124 ) ) ( not ( = ?auto_378123 ?auto_378124 ) ) ( ON ?auto_378122 ?auto_378123 ) ( ON ?auto_378121 ?auto_378122 ) ( ON ?auto_378120 ?auto_378121 ) ( CLEAR ?auto_378118 ) ( ON ?auto_378119 ?auto_378120 ) ( CLEAR ?auto_378119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_378113 ?auto_378114 ?auto_378115 ?auto_378116 ?auto_378117 ?auto_378118 ?auto_378119 )
      ( MAKE-11PILE ?auto_378113 ?auto_378114 ?auto_378115 ?auto_378116 ?auto_378117 ?auto_378118 ?auto_378119 ?auto_378120 ?auto_378121 ?auto_378122 ?auto_378123 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378136 - BLOCK
      ?auto_378137 - BLOCK
      ?auto_378138 - BLOCK
      ?auto_378139 - BLOCK
      ?auto_378140 - BLOCK
      ?auto_378141 - BLOCK
      ?auto_378142 - BLOCK
      ?auto_378143 - BLOCK
      ?auto_378144 - BLOCK
      ?auto_378145 - BLOCK
      ?auto_378146 - BLOCK
    )
    :vars
    (
      ?auto_378147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378146 ?auto_378147 ) ( ON-TABLE ?auto_378136 ) ( ON ?auto_378137 ?auto_378136 ) ( ON ?auto_378138 ?auto_378137 ) ( ON ?auto_378139 ?auto_378138 ) ( ON ?auto_378140 ?auto_378139 ) ( ON ?auto_378141 ?auto_378140 ) ( not ( = ?auto_378136 ?auto_378137 ) ) ( not ( = ?auto_378136 ?auto_378138 ) ) ( not ( = ?auto_378136 ?auto_378139 ) ) ( not ( = ?auto_378136 ?auto_378140 ) ) ( not ( = ?auto_378136 ?auto_378141 ) ) ( not ( = ?auto_378136 ?auto_378142 ) ) ( not ( = ?auto_378136 ?auto_378143 ) ) ( not ( = ?auto_378136 ?auto_378144 ) ) ( not ( = ?auto_378136 ?auto_378145 ) ) ( not ( = ?auto_378136 ?auto_378146 ) ) ( not ( = ?auto_378136 ?auto_378147 ) ) ( not ( = ?auto_378137 ?auto_378138 ) ) ( not ( = ?auto_378137 ?auto_378139 ) ) ( not ( = ?auto_378137 ?auto_378140 ) ) ( not ( = ?auto_378137 ?auto_378141 ) ) ( not ( = ?auto_378137 ?auto_378142 ) ) ( not ( = ?auto_378137 ?auto_378143 ) ) ( not ( = ?auto_378137 ?auto_378144 ) ) ( not ( = ?auto_378137 ?auto_378145 ) ) ( not ( = ?auto_378137 ?auto_378146 ) ) ( not ( = ?auto_378137 ?auto_378147 ) ) ( not ( = ?auto_378138 ?auto_378139 ) ) ( not ( = ?auto_378138 ?auto_378140 ) ) ( not ( = ?auto_378138 ?auto_378141 ) ) ( not ( = ?auto_378138 ?auto_378142 ) ) ( not ( = ?auto_378138 ?auto_378143 ) ) ( not ( = ?auto_378138 ?auto_378144 ) ) ( not ( = ?auto_378138 ?auto_378145 ) ) ( not ( = ?auto_378138 ?auto_378146 ) ) ( not ( = ?auto_378138 ?auto_378147 ) ) ( not ( = ?auto_378139 ?auto_378140 ) ) ( not ( = ?auto_378139 ?auto_378141 ) ) ( not ( = ?auto_378139 ?auto_378142 ) ) ( not ( = ?auto_378139 ?auto_378143 ) ) ( not ( = ?auto_378139 ?auto_378144 ) ) ( not ( = ?auto_378139 ?auto_378145 ) ) ( not ( = ?auto_378139 ?auto_378146 ) ) ( not ( = ?auto_378139 ?auto_378147 ) ) ( not ( = ?auto_378140 ?auto_378141 ) ) ( not ( = ?auto_378140 ?auto_378142 ) ) ( not ( = ?auto_378140 ?auto_378143 ) ) ( not ( = ?auto_378140 ?auto_378144 ) ) ( not ( = ?auto_378140 ?auto_378145 ) ) ( not ( = ?auto_378140 ?auto_378146 ) ) ( not ( = ?auto_378140 ?auto_378147 ) ) ( not ( = ?auto_378141 ?auto_378142 ) ) ( not ( = ?auto_378141 ?auto_378143 ) ) ( not ( = ?auto_378141 ?auto_378144 ) ) ( not ( = ?auto_378141 ?auto_378145 ) ) ( not ( = ?auto_378141 ?auto_378146 ) ) ( not ( = ?auto_378141 ?auto_378147 ) ) ( not ( = ?auto_378142 ?auto_378143 ) ) ( not ( = ?auto_378142 ?auto_378144 ) ) ( not ( = ?auto_378142 ?auto_378145 ) ) ( not ( = ?auto_378142 ?auto_378146 ) ) ( not ( = ?auto_378142 ?auto_378147 ) ) ( not ( = ?auto_378143 ?auto_378144 ) ) ( not ( = ?auto_378143 ?auto_378145 ) ) ( not ( = ?auto_378143 ?auto_378146 ) ) ( not ( = ?auto_378143 ?auto_378147 ) ) ( not ( = ?auto_378144 ?auto_378145 ) ) ( not ( = ?auto_378144 ?auto_378146 ) ) ( not ( = ?auto_378144 ?auto_378147 ) ) ( not ( = ?auto_378145 ?auto_378146 ) ) ( not ( = ?auto_378145 ?auto_378147 ) ) ( not ( = ?auto_378146 ?auto_378147 ) ) ( ON ?auto_378145 ?auto_378146 ) ( ON ?auto_378144 ?auto_378145 ) ( ON ?auto_378143 ?auto_378144 ) ( CLEAR ?auto_378141 ) ( ON ?auto_378142 ?auto_378143 ) ( CLEAR ?auto_378142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_378136 ?auto_378137 ?auto_378138 ?auto_378139 ?auto_378140 ?auto_378141 ?auto_378142 )
      ( MAKE-11PILE ?auto_378136 ?auto_378137 ?auto_378138 ?auto_378139 ?auto_378140 ?auto_378141 ?auto_378142 ?auto_378143 ?auto_378144 ?auto_378145 ?auto_378146 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378159 - BLOCK
      ?auto_378160 - BLOCK
      ?auto_378161 - BLOCK
      ?auto_378162 - BLOCK
      ?auto_378163 - BLOCK
      ?auto_378164 - BLOCK
      ?auto_378165 - BLOCK
      ?auto_378166 - BLOCK
      ?auto_378167 - BLOCK
      ?auto_378168 - BLOCK
      ?auto_378169 - BLOCK
    )
    :vars
    (
      ?auto_378170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378169 ?auto_378170 ) ( ON-TABLE ?auto_378159 ) ( ON ?auto_378160 ?auto_378159 ) ( ON ?auto_378161 ?auto_378160 ) ( ON ?auto_378162 ?auto_378161 ) ( ON ?auto_378163 ?auto_378162 ) ( not ( = ?auto_378159 ?auto_378160 ) ) ( not ( = ?auto_378159 ?auto_378161 ) ) ( not ( = ?auto_378159 ?auto_378162 ) ) ( not ( = ?auto_378159 ?auto_378163 ) ) ( not ( = ?auto_378159 ?auto_378164 ) ) ( not ( = ?auto_378159 ?auto_378165 ) ) ( not ( = ?auto_378159 ?auto_378166 ) ) ( not ( = ?auto_378159 ?auto_378167 ) ) ( not ( = ?auto_378159 ?auto_378168 ) ) ( not ( = ?auto_378159 ?auto_378169 ) ) ( not ( = ?auto_378159 ?auto_378170 ) ) ( not ( = ?auto_378160 ?auto_378161 ) ) ( not ( = ?auto_378160 ?auto_378162 ) ) ( not ( = ?auto_378160 ?auto_378163 ) ) ( not ( = ?auto_378160 ?auto_378164 ) ) ( not ( = ?auto_378160 ?auto_378165 ) ) ( not ( = ?auto_378160 ?auto_378166 ) ) ( not ( = ?auto_378160 ?auto_378167 ) ) ( not ( = ?auto_378160 ?auto_378168 ) ) ( not ( = ?auto_378160 ?auto_378169 ) ) ( not ( = ?auto_378160 ?auto_378170 ) ) ( not ( = ?auto_378161 ?auto_378162 ) ) ( not ( = ?auto_378161 ?auto_378163 ) ) ( not ( = ?auto_378161 ?auto_378164 ) ) ( not ( = ?auto_378161 ?auto_378165 ) ) ( not ( = ?auto_378161 ?auto_378166 ) ) ( not ( = ?auto_378161 ?auto_378167 ) ) ( not ( = ?auto_378161 ?auto_378168 ) ) ( not ( = ?auto_378161 ?auto_378169 ) ) ( not ( = ?auto_378161 ?auto_378170 ) ) ( not ( = ?auto_378162 ?auto_378163 ) ) ( not ( = ?auto_378162 ?auto_378164 ) ) ( not ( = ?auto_378162 ?auto_378165 ) ) ( not ( = ?auto_378162 ?auto_378166 ) ) ( not ( = ?auto_378162 ?auto_378167 ) ) ( not ( = ?auto_378162 ?auto_378168 ) ) ( not ( = ?auto_378162 ?auto_378169 ) ) ( not ( = ?auto_378162 ?auto_378170 ) ) ( not ( = ?auto_378163 ?auto_378164 ) ) ( not ( = ?auto_378163 ?auto_378165 ) ) ( not ( = ?auto_378163 ?auto_378166 ) ) ( not ( = ?auto_378163 ?auto_378167 ) ) ( not ( = ?auto_378163 ?auto_378168 ) ) ( not ( = ?auto_378163 ?auto_378169 ) ) ( not ( = ?auto_378163 ?auto_378170 ) ) ( not ( = ?auto_378164 ?auto_378165 ) ) ( not ( = ?auto_378164 ?auto_378166 ) ) ( not ( = ?auto_378164 ?auto_378167 ) ) ( not ( = ?auto_378164 ?auto_378168 ) ) ( not ( = ?auto_378164 ?auto_378169 ) ) ( not ( = ?auto_378164 ?auto_378170 ) ) ( not ( = ?auto_378165 ?auto_378166 ) ) ( not ( = ?auto_378165 ?auto_378167 ) ) ( not ( = ?auto_378165 ?auto_378168 ) ) ( not ( = ?auto_378165 ?auto_378169 ) ) ( not ( = ?auto_378165 ?auto_378170 ) ) ( not ( = ?auto_378166 ?auto_378167 ) ) ( not ( = ?auto_378166 ?auto_378168 ) ) ( not ( = ?auto_378166 ?auto_378169 ) ) ( not ( = ?auto_378166 ?auto_378170 ) ) ( not ( = ?auto_378167 ?auto_378168 ) ) ( not ( = ?auto_378167 ?auto_378169 ) ) ( not ( = ?auto_378167 ?auto_378170 ) ) ( not ( = ?auto_378168 ?auto_378169 ) ) ( not ( = ?auto_378168 ?auto_378170 ) ) ( not ( = ?auto_378169 ?auto_378170 ) ) ( ON ?auto_378168 ?auto_378169 ) ( ON ?auto_378167 ?auto_378168 ) ( ON ?auto_378166 ?auto_378167 ) ( ON ?auto_378165 ?auto_378166 ) ( CLEAR ?auto_378163 ) ( ON ?auto_378164 ?auto_378165 ) ( CLEAR ?auto_378164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_378159 ?auto_378160 ?auto_378161 ?auto_378162 ?auto_378163 ?auto_378164 )
      ( MAKE-11PILE ?auto_378159 ?auto_378160 ?auto_378161 ?auto_378162 ?auto_378163 ?auto_378164 ?auto_378165 ?auto_378166 ?auto_378167 ?auto_378168 ?auto_378169 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378182 - BLOCK
      ?auto_378183 - BLOCK
      ?auto_378184 - BLOCK
      ?auto_378185 - BLOCK
      ?auto_378186 - BLOCK
      ?auto_378187 - BLOCK
      ?auto_378188 - BLOCK
      ?auto_378189 - BLOCK
      ?auto_378190 - BLOCK
      ?auto_378191 - BLOCK
      ?auto_378192 - BLOCK
    )
    :vars
    (
      ?auto_378193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378192 ?auto_378193 ) ( ON-TABLE ?auto_378182 ) ( ON ?auto_378183 ?auto_378182 ) ( ON ?auto_378184 ?auto_378183 ) ( ON ?auto_378185 ?auto_378184 ) ( ON ?auto_378186 ?auto_378185 ) ( not ( = ?auto_378182 ?auto_378183 ) ) ( not ( = ?auto_378182 ?auto_378184 ) ) ( not ( = ?auto_378182 ?auto_378185 ) ) ( not ( = ?auto_378182 ?auto_378186 ) ) ( not ( = ?auto_378182 ?auto_378187 ) ) ( not ( = ?auto_378182 ?auto_378188 ) ) ( not ( = ?auto_378182 ?auto_378189 ) ) ( not ( = ?auto_378182 ?auto_378190 ) ) ( not ( = ?auto_378182 ?auto_378191 ) ) ( not ( = ?auto_378182 ?auto_378192 ) ) ( not ( = ?auto_378182 ?auto_378193 ) ) ( not ( = ?auto_378183 ?auto_378184 ) ) ( not ( = ?auto_378183 ?auto_378185 ) ) ( not ( = ?auto_378183 ?auto_378186 ) ) ( not ( = ?auto_378183 ?auto_378187 ) ) ( not ( = ?auto_378183 ?auto_378188 ) ) ( not ( = ?auto_378183 ?auto_378189 ) ) ( not ( = ?auto_378183 ?auto_378190 ) ) ( not ( = ?auto_378183 ?auto_378191 ) ) ( not ( = ?auto_378183 ?auto_378192 ) ) ( not ( = ?auto_378183 ?auto_378193 ) ) ( not ( = ?auto_378184 ?auto_378185 ) ) ( not ( = ?auto_378184 ?auto_378186 ) ) ( not ( = ?auto_378184 ?auto_378187 ) ) ( not ( = ?auto_378184 ?auto_378188 ) ) ( not ( = ?auto_378184 ?auto_378189 ) ) ( not ( = ?auto_378184 ?auto_378190 ) ) ( not ( = ?auto_378184 ?auto_378191 ) ) ( not ( = ?auto_378184 ?auto_378192 ) ) ( not ( = ?auto_378184 ?auto_378193 ) ) ( not ( = ?auto_378185 ?auto_378186 ) ) ( not ( = ?auto_378185 ?auto_378187 ) ) ( not ( = ?auto_378185 ?auto_378188 ) ) ( not ( = ?auto_378185 ?auto_378189 ) ) ( not ( = ?auto_378185 ?auto_378190 ) ) ( not ( = ?auto_378185 ?auto_378191 ) ) ( not ( = ?auto_378185 ?auto_378192 ) ) ( not ( = ?auto_378185 ?auto_378193 ) ) ( not ( = ?auto_378186 ?auto_378187 ) ) ( not ( = ?auto_378186 ?auto_378188 ) ) ( not ( = ?auto_378186 ?auto_378189 ) ) ( not ( = ?auto_378186 ?auto_378190 ) ) ( not ( = ?auto_378186 ?auto_378191 ) ) ( not ( = ?auto_378186 ?auto_378192 ) ) ( not ( = ?auto_378186 ?auto_378193 ) ) ( not ( = ?auto_378187 ?auto_378188 ) ) ( not ( = ?auto_378187 ?auto_378189 ) ) ( not ( = ?auto_378187 ?auto_378190 ) ) ( not ( = ?auto_378187 ?auto_378191 ) ) ( not ( = ?auto_378187 ?auto_378192 ) ) ( not ( = ?auto_378187 ?auto_378193 ) ) ( not ( = ?auto_378188 ?auto_378189 ) ) ( not ( = ?auto_378188 ?auto_378190 ) ) ( not ( = ?auto_378188 ?auto_378191 ) ) ( not ( = ?auto_378188 ?auto_378192 ) ) ( not ( = ?auto_378188 ?auto_378193 ) ) ( not ( = ?auto_378189 ?auto_378190 ) ) ( not ( = ?auto_378189 ?auto_378191 ) ) ( not ( = ?auto_378189 ?auto_378192 ) ) ( not ( = ?auto_378189 ?auto_378193 ) ) ( not ( = ?auto_378190 ?auto_378191 ) ) ( not ( = ?auto_378190 ?auto_378192 ) ) ( not ( = ?auto_378190 ?auto_378193 ) ) ( not ( = ?auto_378191 ?auto_378192 ) ) ( not ( = ?auto_378191 ?auto_378193 ) ) ( not ( = ?auto_378192 ?auto_378193 ) ) ( ON ?auto_378191 ?auto_378192 ) ( ON ?auto_378190 ?auto_378191 ) ( ON ?auto_378189 ?auto_378190 ) ( ON ?auto_378188 ?auto_378189 ) ( CLEAR ?auto_378186 ) ( ON ?auto_378187 ?auto_378188 ) ( CLEAR ?auto_378187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_378182 ?auto_378183 ?auto_378184 ?auto_378185 ?auto_378186 ?auto_378187 )
      ( MAKE-11PILE ?auto_378182 ?auto_378183 ?auto_378184 ?auto_378185 ?auto_378186 ?auto_378187 ?auto_378188 ?auto_378189 ?auto_378190 ?auto_378191 ?auto_378192 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378205 - BLOCK
      ?auto_378206 - BLOCK
      ?auto_378207 - BLOCK
      ?auto_378208 - BLOCK
      ?auto_378209 - BLOCK
      ?auto_378210 - BLOCK
      ?auto_378211 - BLOCK
      ?auto_378212 - BLOCK
      ?auto_378213 - BLOCK
      ?auto_378214 - BLOCK
      ?auto_378215 - BLOCK
    )
    :vars
    (
      ?auto_378216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378215 ?auto_378216 ) ( ON-TABLE ?auto_378205 ) ( ON ?auto_378206 ?auto_378205 ) ( ON ?auto_378207 ?auto_378206 ) ( ON ?auto_378208 ?auto_378207 ) ( not ( = ?auto_378205 ?auto_378206 ) ) ( not ( = ?auto_378205 ?auto_378207 ) ) ( not ( = ?auto_378205 ?auto_378208 ) ) ( not ( = ?auto_378205 ?auto_378209 ) ) ( not ( = ?auto_378205 ?auto_378210 ) ) ( not ( = ?auto_378205 ?auto_378211 ) ) ( not ( = ?auto_378205 ?auto_378212 ) ) ( not ( = ?auto_378205 ?auto_378213 ) ) ( not ( = ?auto_378205 ?auto_378214 ) ) ( not ( = ?auto_378205 ?auto_378215 ) ) ( not ( = ?auto_378205 ?auto_378216 ) ) ( not ( = ?auto_378206 ?auto_378207 ) ) ( not ( = ?auto_378206 ?auto_378208 ) ) ( not ( = ?auto_378206 ?auto_378209 ) ) ( not ( = ?auto_378206 ?auto_378210 ) ) ( not ( = ?auto_378206 ?auto_378211 ) ) ( not ( = ?auto_378206 ?auto_378212 ) ) ( not ( = ?auto_378206 ?auto_378213 ) ) ( not ( = ?auto_378206 ?auto_378214 ) ) ( not ( = ?auto_378206 ?auto_378215 ) ) ( not ( = ?auto_378206 ?auto_378216 ) ) ( not ( = ?auto_378207 ?auto_378208 ) ) ( not ( = ?auto_378207 ?auto_378209 ) ) ( not ( = ?auto_378207 ?auto_378210 ) ) ( not ( = ?auto_378207 ?auto_378211 ) ) ( not ( = ?auto_378207 ?auto_378212 ) ) ( not ( = ?auto_378207 ?auto_378213 ) ) ( not ( = ?auto_378207 ?auto_378214 ) ) ( not ( = ?auto_378207 ?auto_378215 ) ) ( not ( = ?auto_378207 ?auto_378216 ) ) ( not ( = ?auto_378208 ?auto_378209 ) ) ( not ( = ?auto_378208 ?auto_378210 ) ) ( not ( = ?auto_378208 ?auto_378211 ) ) ( not ( = ?auto_378208 ?auto_378212 ) ) ( not ( = ?auto_378208 ?auto_378213 ) ) ( not ( = ?auto_378208 ?auto_378214 ) ) ( not ( = ?auto_378208 ?auto_378215 ) ) ( not ( = ?auto_378208 ?auto_378216 ) ) ( not ( = ?auto_378209 ?auto_378210 ) ) ( not ( = ?auto_378209 ?auto_378211 ) ) ( not ( = ?auto_378209 ?auto_378212 ) ) ( not ( = ?auto_378209 ?auto_378213 ) ) ( not ( = ?auto_378209 ?auto_378214 ) ) ( not ( = ?auto_378209 ?auto_378215 ) ) ( not ( = ?auto_378209 ?auto_378216 ) ) ( not ( = ?auto_378210 ?auto_378211 ) ) ( not ( = ?auto_378210 ?auto_378212 ) ) ( not ( = ?auto_378210 ?auto_378213 ) ) ( not ( = ?auto_378210 ?auto_378214 ) ) ( not ( = ?auto_378210 ?auto_378215 ) ) ( not ( = ?auto_378210 ?auto_378216 ) ) ( not ( = ?auto_378211 ?auto_378212 ) ) ( not ( = ?auto_378211 ?auto_378213 ) ) ( not ( = ?auto_378211 ?auto_378214 ) ) ( not ( = ?auto_378211 ?auto_378215 ) ) ( not ( = ?auto_378211 ?auto_378216 ) ) ( not ( = ?auto_378212 ?auto_378213 ) ) ( not ( = ?auto_378212 ?auto_378214 ) ) ( not ( = ?auto_378212 ?auto_378215 ) ) ( not ( = ?auto_378212 ?auto_378216 ) ) ( not ( = ?auto_378213 ?auto_378214 ) ) ( not ( = ?auto_378213 ?auto_378215 ) ) ( not ( = ?auto_378213 ?auto_378216 ) ) ( not ( = ?auto_378214 ?auto_378215 ) ) ( not ( = ?auto_378214 ?auto_378216 ) ) ( not ( = ?auto_378215 ?auto_378216 ) ) ( ON ?auto_378214 ?auto_378215 ) ( ON ?auto_378213 ?auto_378214 ) ( ON ?auto_378212 ?auto_378213 ) ( ON ?auto_378211 ?auto_378212 ) ( ON ?auto_378210 ?auto_378211 ) ( CLEAR ?auto_378208 ) ( ON ?auto_378209 ?auto_378210 ) ( CLEAR ?auto_378209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_378205 ?auto_378206 ?auto_378207 ?auto_378208 ?auto_378209 )
      ( MAKE-11PILE ?auto_378205 ?auto_378206 ?auto_378207 ?auto_378208 ?auto_378209 ?auto_378210 ?auto_378211 ?auto_378212 ?auto_378213 ?auto_378214 ?auto_378215 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378228 - BLOCK
      ?auto_378229 - BLOCK
      ?auto_378230 - BLOCK
      ?auto_378231 - BLOCK
      ?auto_378232 - BLOCK
      ?auto_378233 - BLOCK
      ?auto_378234 - BLOCK
      ?auto_378235 - BLOCK
      ?auto_378236 - BLOCK
      ?auto_378237 - BLOCK
      ?auto_378238 - BLOCK
    )
    :vars
    (
      ?auto_378239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378238 ?auto_378239 ) ( ON-TABLE ?auto_378228 ) ( ON ?auto_378229 ?auto_378228 ) ( ON ?auto_378230 ?auto_378229 ) ( ON ?auto_378231 ?auto_378230 ) ( not ( = ?auto_378228 ?auto_378229 ) ) ( not ( = ?auto_378228 ?auto_378230 ) ) ( not ( = ?auto_378228 ?auto_378231 ) ) ( not ( = ?auto_378228 ?auto_378232 ) ) ( not ( = ?auto_378228 ?auto_378233 ) ) ( not ( = ?auto_378228 ?auto_378234 ) ) ( not ( = ?auto_378228 ?auto_378235 ) ) ( not ( = ?auto_378228 ?auto_378236 ) ) ( not ( = ?auto_378228 ?auto_378237 ) ) ( not ( = ?auto_378228 ?auto_378238 ) ) ( not ( = ?auto_378228 ?auto_378239 ) ) ( not ( = ?auto_378229 ?auto_378230 ) ) ( not ( = ?auto_378229 ?auto_378231 ) ) ( not ( = ?auto_378229 ?auto_378232 ) ) ( not ( = ?auto_378229 ?auto_378233 ) ) ( not ( = ?auto_378229 ?auto_378234 ) ) ( not ( = ?auto_378229 ?auto_378235 ) ) ( not ( = ?auto_378229 ?auto_378236 ) ) ( not ( = ?auto_378229 ?auto_378237 ) ) ( not ( = ?auto_378229 ?auto_378238 ) ) ( not ( = ?auto_378229 ?auto_378239 ) ) ( not ( = ?auto_378230 ?auto_378231 ) ) ( not ( = ?auto_378230 ?auto_378232 ) ) ( not ( = ?auto_378230 ?auto_378233 ) ) ( not ( = ?auto_378230 ?auto_378234 ) ) ( not ( = ?auto_378230 ?auto_378235 ) ) ( not ( = ?auto_378230 ?auto_378236 ) ) ( not ( = ?auto_378230 ?auto_378237 ) ) ( not ( = ?auto_378230 ?auto_378238 ) ) ( not ( = ?auto_378230 ?auto_378239 ) ) ( not ( = ?auto_378231 ?auto_378232 ) ) ( not ( = ?auto_378231 ?auto_378233 ) ) ( not ( = ?auto_378231 ?auto_378234 ) ) ( not ( = ?auto_378231 ?auto_378235 ) ) ( not ( = ?auto_378231 ?auto_378236 ) ) ( not ( = ?auto_378231 ?auto_378237 ) ) ( not ( = ?auto_378231 ?auto_378238 ) ) ( not ( = ?auto_378231 ?auto_378239 ) ) ( not ( = ?auto_378232 ?auto_378233 ) ) ( not ( = ?auto_378232 ?auto_378234 ) ) ( not ( = ?auto_378232 ?auto_378235 ) ) ( not ( = ?auto_378232 ?auto_378236 ) ) ( not ( = ?auto_378232 ?auto_378237 ) ) ( not ( = ?auto_378232 ?auto_378238 ) ) ( not ( = ?auto_378232 ?auto_378239 ) ) ( not ( = ?auto_378233 ?auto_378234 ) ) ( not ( = ?auto_378233 ?auto_378235 ) ) ( not ( = ?auto_378233 ?auto_378236 ) ) ( not ( = ?auto_378233 ?auto_378237 ) ) ( not ( = ?auto_378233 ?auto_378238 ) ) ( not ( = ?auto_378233 ?auto_378239 ) ) ( not ( = ?auto_378234 ?auto_378235 ) ) ( not ( = ?auto_378234 ?auto_378236 ) ) ( not ( = ?auto_378234 ?auto_378237 ) ) ( not ( = ?auto_378234 ?auto_378238 ) ) ( not ( = ?auto_378234 ?auto_378239 ) ) ( not ( = ?auto_378235 ?auto_378236 ) ) ( not ( = ?auto_378235 ?auto_378237 ) ) ( not ( = ?auto_378235 ?auto_378238 ) ) ( not ( = ?auto_378235 ?auto_378239 ) ) ( not ( = ?auto_378236 ?auto_378237 ) ) ( not ( = ?auto_378236 ?auto_378238 ) ) ( not ( = ?auto_378236 ?auto_378239 ) ) ( not ( = ?auto_378237 ?auto_378238 ) ) ( not ( = ?auto_378237 ?auto_378239 ) ) ( not ( = ?auto_378238 ?auto_378239 ) ) ( ON ?auto_378237 ?auto_378238 ) ( ON ?auto_378236 ?auto_378237 ) ( ON ?auto_378235 ?auto_378236 ) ( ON ?auto_378234 ?auto_378235 ) ( ON ?auto_378233 ?auto_378234 ) ( CLEAR ?auto_378231 ) ( ON ?auto_378232 ?auto_378233 ) ( CLEAR ?auto_378232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_378228 ?auto_378229 ?auto_378230 ?auto_378231 ?auto_378232 )
      ( MAKE-11PILE ?auto_378228 ?auto_378229 ?auto_378230 ?auto_378231 ?auto_378232 ?auto_378233 ?auto_378234 ?auto_378235 ?auto_378236 ?auto_378237 ?auto_378238 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378251 - BLOCK
      ?auto_378252 - BLOCK
      ?auto_378253 - BLOCK
      ?auto_378254 - BLOCK
      ?auto_378255 - BLOCK
      ?auto_378256 - BLOCK
      ?auto_378257 - BLOCK
      ?auto_378258 - BLOCK
      ?auto_378259 - BLOCK
      ?auto_378260 - BLOCK
      ?auto_378261 - BLOCK
    )
    :vars
    (
      ?auto_378262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378261 ?auto_378262 ) ( ON-TABLE ?auto_378251 ) ( ON ?auto_378252 ?auto_378251 ) ( ON ?auto_378253 ?auto_378252 ) ( not ( = ?auto_378251 ?auto_378252 ) ) ( not ( = ?auto_378251 ?auto_378253 ) ) ( not ( = ?auto_378251 ?auto_378254 ) ) ( not ( = ?auto_378251 ?auto_378255 ) ) ( not ( = ?auto_378251 ?auto_378256 ) ) ( not ( = ?auto_378251 ?auto_378257 ) ) ( not ( = ?auto_378251 ?auto_378258 ) ) ( not ( = ?auto_378251 ?auto_378259 ) ) ( not ( = ?auto_378251 ?auto_378260 ) ) ( not ( = ?auto_378251 ?auto_378261 ) ) ( not ( = ?auto_378251 ?auto_378262 ) ) ( not ( = ?auto_378252 ?auto_378253 ) ) ( not ( = ?auto_378252 ?auto_378254 ) ) ( not ( = ?auto_378252 ?auto_378255 ) ) ( not ( = ?auto_378252 ?auto_378256 ) ) ( not ( = ?auto_378252 ?auto_378257 ) ) ( not ( = ?auto_378252 ?auto_378258 ) ) ( not ( = ?auto_378252 ?auto_378259 ) ) ( not ( = ?auto_378252 ?auto_378260 ) ) ( not ( = ?auto_378252 ?auto_378261 ) ) ( not ( = ?auto_378252 ?auto_378262 ) ) ( not ( = ?auto_378253 ?auto_378254 ) ) ( not ( = ?auto_378253 ?auto_378255 ) ) ( not ( = ?auto_378253 ?auto_378256 ) ) ( not ( = ?auto_378253 ?auto_378257 ) ) ( not ( = ?auto_378253 ?auto_378258 ) ) ( not ( = ?auto_378253 ?auto_378259 ) ) ( not ( = ?auto_378253 ?auto_378260 ) ) ( not ( = ?auto_378253 ?auto_378261 ) ) ( not ( = ?auto_378253 ?auto_378262 ) ) ( not ( = ?auto_378254 ?auto_378255 ) ) ( not ( = ?auto_378254 ?auto_378256 ) ) ( not ( = ?auto_378254 ?auto_378257 ) ) ( not ( = ?auto_378254 ?auto_378258 ) ) ( not ( = ?auto_378254 ?auto_378259 ) ) ( not ( = ?auto_378254 ?auto_378260 ) ) ( not ( = ?auto_378254 ?auto_378261 ) ) ( not ( = ?auto_378254 ?auto_378262 ) ) ( not ( = ?auto_378255 ?auto_378256 ) ) ( not ( = ?auto_378255 ?auto_378257 ) ) ( not ( = ?auto_378255 ?auto_378258 ) ) ( not ( = ?auto_378255 ?auto_378259 ) ) ( not ( = ?auto_378255 ?auto_378260 ) ) ( not ( = ?auto_378255 ?auto_378261 ) ) ( not ( = ?auto_378255 ?auto_378262 ) ) ( not ( = ?auto_378256 ?auto_378257 ) ) ( not ( = ?auto_378256 ?auto_378258 ) ) ( not ( = ?auto_378256 ?auto_378259 ) ) ( not ( = ?auto_378256 ?auto_378260 ) ) ( not ( = ?auto_378256 ?auto_378261 ) ) ( not ( = ?auto_378256 ?auto_378262 ) ) ( not ( = ?auto_378257 ?auto_378258 ) ) ( not ( = ?auto_378257 ?auto_378259 ) ) ( not ( = ?auto_378257 ?auto_378260 ) ) ( not ( = ?auto_378257 ?auto_378261 ) ) ( not ( = ?auto_378257 ?auto_378262 ) ) ( not ( = ?auto_378258 ?auto_378259 ) ) ( not ( = ?auto_378258 ?auto_378260 ) ) ( not ( = ?auto_378258 ?auto_378261 ) ) ( not ( = ?auto_378258 ?auto_378262 ) ) ( not ( = ?auto_378259 ?auto_378260 ) ) ( not ( = ?auto_378259 ?auto_378261 ) ) ( not ( = ?auto_378259 ?auto_378262 ) ) ( not ( = ?auto_378260 ?auto_378261 ) ) ( not ( = ?auto_378260 ?auto_378262 ) ) ( not ( = ?auto_378261 ?auto_378262 ) ) ( ON ?auto_378260 ?auto_378261 ) ( ON ?auto_378259 ?auto_378260 ) ( ON ?auto_378258 ?auto_378259 ) ( ON ?auto_378257 ?auto_378258 ) ( ON ?auto_378256 ?auto_378257 ) ( ON ?auto_378255 ?auto_378256 ) ( CLEAR ?auto_378253 ) ( ON ?auto_378254 ?auto_378255 ) ( CLEAR ?auto_378254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_378251 ?auto_378252 ?auto_378253 ?auto_378254 )
      ( MAKE-11PILE ?auto_378251 ?auto_378252 ?auto_378253 ?auto_378254 ?auto_378255 ?auto_378256 ?auto_378257 ?auto_378258 ?auto_378259 ?auto_378260 ?auto_378261 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378274 - BLOCK
      ?auto_378275 - BLOCK
      ?auto_378276 - BLOCK
      ?auto_378277 - BLOCK
      ?auto_378278 - BLOCK
      ?auto_378279 - BLOCK
      ?auto_378280 - BLOCK
      ?auto_378281 - BLOCK
      ?auto_378282 - BLOCK
      ?auto_378283 - BLOCK
      ?auto_378284 - BLOCK
    )
    :vars
    (
      ?auto_378285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378284 ?auto_378285 ) ( ON-TABLE ?auto_378274 ) ( ON ?auto_378275 ?auto_378274 ) ( ON ?auto_378276 ?auto_378275 ) ( not ( = ?auto_378274 ?auto_378275 ) ) ( not ( = ?auto_378274 ?auto_378276 ) ) ( not ( = ?auto_378274 ?auto_378277 ) ) ( not ( = ?auto_378274 ?auto_378278 ) ) ( not ( = ?auto_378274 ?auto_378279 ) ) ( not ( = ?auto_378274 ?auto_378280 ) ) ( not ( = ?auto_378274 ?auto_378281 ) ) ( not ( = ?auto_378274 ?auto_378282 ) ) ( not ( = ?auto_378274 ?auto_378283 ) ) ( not ( = ?auto_378274 ?auto_378284 ) ) ( not ( = ?auto_378274 ?auto_378285 ) ) ( not ( = ?auto_378275 ?auto_378276 ) ) ( not ( = ?auto_378275 ?auto_378277 ) ) ( not ( = ?auto_378275 ?auto_378278 ) ) ( not ( = ?auto_378275 ?auto_378279 ) ) ( not ( = ?auto_378275 ?auto_378280 ) ) ( not ( = ?auto_378275 ?auto_378281 ) ) ( not ( = ?auto_378275 ?auto_378282 ) ) ( not ( = ?auto_378275 ?auto_378283 ) ) ( not ( = ?auto_378275 ?auto_378284 ) ) ( not ( = ?auto_378275 ?auto_378285 ) ) ( not ( = ?auto_378276 ?auto_378277 ) ) ( not ( = ?auto_378276 ?auto_378278 ) ) ( not ( = ?auto_378276 ?auto_378279 ) ) ( not ( = ?auto_378276 ?auto_378280 ) ) ( not ( = ?auto_378276 ?auto_378281 ) ) ( not ( = ?auto_378276 ?auto_378282 ) ) ( not ( = ?auto_378276 ?auto_378283 ) ) ( not ( = ?auto_378276 ?auto_378284 ) ) ( not ( = ?auto_378276 ?auto_378285 ) ) ( not ( = ?auto_378277 ?auto_378278 ) ) ( not ( = ?auto_378277 ?auto_378279 ) ) ( not ( = ?auto_378277 ?auto_378280 ) ) ( not ( = ?auto_378277 ?auto_378281 ) ) ( not ( = ?auto_378277 ?auto_378282 ) ) ( not ( = ?auto_378277 ?auto_378283 ) ) ( not ( = ?auto_378277 ?auto_378284 ) ) ( not ( = ?auto_378277 ?auto_378285 ) ) ( not ( = ?auto_378278 ?auto_378279 ) ) ( not ( = ?auto_378278 ?auto_378280 ) ) ( not ( = ?auto_378278 ?auto_378281 ) ) ( not ( = ?auto_378278 ?auto_378282 ) ) ( not ( = ?auto_378278 ?auto_378283 ) ) ( not ( = ?auto_378278 ?auto_378284 ) ) ( not ( = ?auto_378278 ?auto_378285 ) ) ( not ( = ?auto_378279 ?auto_378280 ) ) ( not ( = ?auto_378279 ?auto_378281 ) ) ( not ( = ?auto_378279 ?auto_378282 ) ) ( not ( = ?auto_378279 ?auto_378283 ) ) ( not ( = ?auto_378279 ?auto_378284 ) ) ( not ( = ?auto_378279 ?auto_378285 ) ) ( not ( = ?auto_378280 ?auto_378281 ) ) ( not ( = ?auto_378280 ?auto_378282 ) ) ( not ( = ?auto_378280 ?auto_378283 ) ) ( not ( = ?auto_378280 ?auto_378284 ) ) ( not ( = ?auto_378280 ?auto_378285 ) ) ( not ( = ?auto_378281 ?auto_378282 ) ) ( not ( = ?auto_378281 ?auto_378283 ) ) ( not ( = ?auto_378281 ?auto_378284 ) ) ( not ( = ?auto_378281 ?auto_378285 ) ) ( not ( = ?auto_378282 ?auto_378283 ) ) ( not ( = ?auto_378282 ?auto_378284 ) ) ( not ( = ?auto_378282 ?auto_378285 ) ) ( not ( = ?auto_378283 ?auto_378284 ) ) ( not ( = ?auto_378283 ?auto_378285 ) ) ( not ( = ?auto_378284 ?auto_378285 ) ) ( ON ?auto_378283 ?auto_378284 ) ( ON ?auto_378282 ?auto_378283 ) ( ON ?auto_378281 ?auto_378282 ) ( ON ?auto_378280 ?auto_378281 ) ( ON ?auto_378279 ?auto_378280 ) ( ON ?auto_378278 ?auto_378279 ) ( CLEAR ?auto_378276 ) ( ON ?auto_378277 ?auto_378278 ) ( CLEAR ?auto_378277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_378274 ?auto_378275 ?auto_378276 ?auto_378277 )
      ( MAKE-11PILE ?auto_378274 ?auto_378275 ?auto_378276 ?auto_378277 ?auto_378278 ?auto_378279 ?auto_378280 ?auto_378281 ?auto_378282 ?auto_378283 ?auto_378284 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378297 - BLOCK
      ?auto_378298 - BLOCK
      ?auto_378299 - BLOCK
      ?auto_378300 - BLOCK
      ?auto_378301 - BLOCK
      ?auto_378302 - BLOCK
      ?auto_378303 - BLOCK
      ?auto_378304 - BLOCK
      ?auto_378305 - BLOCK
      ?auto_378306 - BLOCK
      ?auto_378307 - BLOCK
    )
    :vars
    (
      ?auto_378308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378307 ?auto_378308 ) ( ON-TABLE ?auto_378297 ) ( ON ?auto_378298 ?auto_378297 ) ( not ( = ?auto_378297 ?auto_378298 ) ) ( not ( = ?auto_378297 ?auto_378299 ) ) ( not ( = ?auto_378297 ?auto_378300 ) ) ( not ( = ?auto_378297 ?auto_378301 ) ) ( not ( = ?auto_378297 ?auto_378302 ) ) ( not ( = ?auto_378297 ?auto_378303 ) ) ( not ( = ?auto_378297 ?auto_378304 ) ) ( not ( = ?auto_378297 ?auto_378305 ) ) ( not ( = ?auto_378297 ?auto_378306 ) ) ( not ( = ?auto_378297 ?auto_378307 ) ) ( not ( = ?auto_378297 ?auto_378308 ) ) ( not ( = ?auto_378298 ?auto_378299 ) ) ( not ( = ?auto_378298 ?auto_378300 ) ) ( not ( = ?auto_378298 ?auto_378301 ) ) ( not ( = ?auto_378298 ?auto_378302 ) ) ( not ( = ?auto_378298 ?auto_378303 ) ) ( not ( = ?auto_378298 ?auto_378304 ) ) ( not ( = ?auto_378298 ?auto_378305 ) ) ( not ( = ?auto_378298 ?auto_378306 ) ) ( not ( = ?auto_378298 ?auto_378307 ) ) ( not ( = ?auto_378298 ?auto_378308 ) ) ( not ( = ?auto_378299 ?auto_378300 ) ) ( not ( = ?auto_378299 ?auto_378301 ) ) ( not ( = ?auto_378299 ?auto_378302 ) ) ( not ( = ?auto_378299 ?auto_378303 ) ) ( not ( = ?auto_378299 ?auto_378304 ) ) ( not ( = ?auto_378299 ?auto_378305 ) ) ( not ( = ?auto_378299 ?auto_378306 ) ) ( not ( = ?auto_378299 ?auto_378307 ) ) ( not ( = ?auto_378299 ?auto_378308 ) ) ( not ( = ?auto_378300 ?auto_378301 ) ) ( not ( = ?auto_378300 ?auto_378302 ) ) ( not ( = ?auto_378300 ?auto_378303 ) ) ( not ( = ?auto_378300 ?auto_378304 ) ) ( not ( = ?auto_378300 ?auto_378305 ) ) ( not ( = ?auto_378300 ?auto_378306 ) ) ( not ( = ?auto_378300 ?auto_378307 ) ) ( not ( = ?auto_378300 ?auto_378308 ) ) ( not ( = ?auto_378301 ?auto_378302 ) ) ( not ( = ?auto_378301 ?auto_378303 ) ) ( not ( = ?auto_378301 ?auto_378304 ) ) ( not ( = ?auto_378301 ?auto_378305 ) ) ( not ( = ?auto_378301 ?auto_378306 ) ) ( not ( = ?auto_378301 ?auto_378307 ) ) ( not ( = ?auto_378301 ?auto_378308 ) ) ( not ( = ?auto_378302 ?auto_378303 ) ) ( not ( = ?auto_378302 ?auto_378304 ) ) ( not ( = ?auto_378302 ?auto_378305 ) ) ( not ( = ?auto_378302 ?auto_378306 ) ) ( not ( = ?auto_378302 ?auto_378307 ) ) ( not ( = ?auto_378302 ?auto_378308 ) ) ( not ( = ?auto_378303 ?auto_378304 ) ) ( not ( = ?auto_378303 ?auto_378305 ) ) ( not ( = ?auto_378303 ?auto_378306 ) ) ( not ( = ?auto_378303 ?auto_378307 ) ) ( not ( = ?auto_378303 ?auto_378308 ) ) ( not ( = ?auto_378304 ?auto_378305 ) ) ( not ( = ?auto_378304 ?auto_378306 ) ) ( not ( = ?auto_378304 ?auto_378307 ) ) ( not ( = ?auto_378304 ?auto_378308 ) ) ( not ( = ?auto_378305 ?auto_378306 ) ) ( not ( = ?auto_378305 ?auto_378307 ) ) ( not ( = ?auto_378305 ?auto_378308 ) ) ( not ( = ?auto_378306 ?auto_378307 ) ) ( not ( = ?auto_378306 ?auto_378308 ) ) ( not ( = ?auto_378307 ?auto_378308 ) ) ( ON ?auto_378306 ?auto_378307 ) ( ON ?auto_378305 ?auto_378306 ) ( ON ?auto_378304 ?auto_378305 ) ( ON ?auto_378303 ?auto_378304 ) ( ON ?auto_378302 ?auto_378303 ) ( ON ?auto_378301 ?auto_378302 ) ( ON ?auto_378300 ?auto_378301 ) ( CLEAR ?auto_378298 ) ( ON ?auto_378299 ?auto_378300 ) ( CLEAR ?auto_378299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_378297 ?auto_378298 ?auto_378299 )
      ( MAKE-11PILE ?auto_378297 ?auto_378298 ?auto_378299 ?auto_378300 ?auto_378301 ?auto_378302 ?auto_378303 ?auto_378304 ?auto_378305 ?auto_378306 ?auto_378307 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378320 - BLOCK
      ?auto_378321 - BLOCK
      ?auto_378322 - BLOCK
      ?auto_378323 - BLOCK
      ?auto_378324 - BLOCK
      ?auto_378325 - BLOCK
      ?auto_378326 - BLOCK
      ?auto_378327 - BLOCK
      ?auto_378328 - BLOCK
      ?auto_378329 - BLOCK
      ?auto_378330 - BLOCK
    )
    :vars
    (
      ?auto_378331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378330 ?auto_378331 ) ( ON-TABLE ?auto_378320 ) ( ON ?auto_378321 ?auto_378320 ) ( not ( = ?auto_378320 ?auto_378321 ) ) ( not ( = ?auto_378320 ?auto_378322 ) ) ( not ( = ?auto_378320 ?auto_378323 ) ) ( not ( = ?auto_378320 ?auto_378324 ) ) ( not ( = ?auto_378320 ?auto_378325 ) ) ( not ( = ?auto_378320 ?auto_378326 ) ) ( not ( = ?auto_378320 ?auto_378327 ) ) ( not ( = ?auto_378320 ?auto_378328 ) ) ( not ( = ?auto_378320 ?auto_378329 ) ) ( not ( = ?auto_378320 ?auto_378330 ) ) ( not ( = ?auto_378320 ?auto_378331 ) ) ( not ( = ?auto_378321 ?auto_378322 ) ) ( not ( = ?auto_378321 ?auto_378323 ) ) ( not ( = ?auto_378321 ?auto_378324 ) ) ( not ( = ?auto_378321 ?auto_378325 ) ) ( not ( = ?auto_378321 ?auto_378326 ) ) ( not ( = ?auto_378321 ?auto_378327 ) ) ( not ( = ?auto_378321 ?auto_378328 ) ) ( not ( = ?auto_378321 ?auto_378329 ) ) ( not ( = ?auto_378321 ?auto_378330 ) ) ( not ( = ?auto_378321 ?auto_378331 ) ) ( not ( = ?auto_378322 ?auto_378323 ) ) ( not ( = ?auto_378322 ?auto_378324 ) ) ( not ( = ?auto_378322 ?auto_378325 ) ) ( not ( = ?auto_378322 ?auto_378326 ) ) ( not ( = ?auto_378322 ?auto_378327 ) ) ( not ( = ?auto_378322 ?auto_378328 ) ) ( not ( = ?auto_378322 ?auto_378329 ) ) ( not ( = ?auto_378322 ?auto_378330 ) ) ( not ( = ?auto_378322 ?auto_378331 ) ) ( not ( = ?auto_378323 ?auto_378324 ) ) ( not ( = ?auto_378323 ?auto_378325 ) ) ( not ( = ?auto_378323 ?auto_378326 ) ) ( not ( = ?auto_378323 ?auto_378327 ) ) ( not ( = ?auto_378323 ?auto_378328 ) ) ( not ( = ?auto_378323 ?auto_378329 ) ) ( not ( = ?auto_378323 ?auto_378330 ) ) ( not ( = ?auto_378323 ?auto_378331 ) ) ( not ( = ?auto_378324 ?auto_378325 ) ) ( not ( = ?auto_378324 ?auto_378326 ) ) ( not ( = ?auto_378324 ?auto_378327 ) ) ( not ( = ?auto_378324 ?auto_378328 ) ) ( not ( = ?auto_378324 ?auto_378329 ) ) ( not ( = ?auto_378324 ?auto_378330 ) ) ( not ( = ?auto_378324 ?auto_378331 ) ) ( not ( = ?auto_378325 ?auto_378326 ) ) ( not ( = ?auto_378325 ?auto_378327 ) ) ( not ( = ?auto_378325 ?auto_378328 ) ) ( not ( = ?auto_378325 ?auto_378329 ) ) ( not ( = ?auto_378325 ?auto_378330 ) ) ( not ( = ?auto_378325 ?auto_378331 ) ) ( not ( = ?auto_378326 ?auto_378327 ) ) ( not ( = ?auto_378326 ?auto_378328 ) ) ( not ( = ?auto_378326 ?auto_378329 ) ) ( not ( = ?auto_378326 ?auto_378330 ) ) ( not ( = ?auto_378326 ?auto_378331 ) ) ( not ( = ?auto_378327 ?auto_378328 ) ) ( not ( = ?auto_378327 ?auto_378329 ) ) ( not ( = ?auto_378327 ?auto_378330 ) ) ( not ( = ?auto_378327 ?auto_378331 ) ) ( not ( = ?auto_378328 ?auto_378329 ) ) ( not ( = ?auto_378328 ?auto_378330 ) ) ( not ( = ?auto_378328 ?auto_378331 ) ) ( not ( = ?auto_378329 ?auto_378330 ) ) ( not ( = ?auto_378329 ?auto_378331 ) ) ( not ( = ?auto_378330 ?auto_378331 ) ) ( ON ?auto_378329 ?auto_378330 ) ( ON ?auto_378328 ?auto_378329 ) ( ON ?auto_378327 ?auto_378328 ) ( ON ?auto_378326 ?auto_378327 ) ( ON ?auto_378325 ?auto_378326 ) ( ON ?auto_378324 ?auto_378325 ) ( ON ?auto_378323 ?auto_378324 ) ( CLEAR ?auto_378321 ) ( ON ?auto_378322 ?auto_378323 ) ( CLEAR ?auto_378322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_378320 ?auto_378321 ?auto_378322 )
      ( MAKE-11PILE ?auto_378320 ?auto_378321 ?auto_378322 ?auto_378323 ?auto_378324 ?auto_378325 ?auto_378326 ?auto_378327 ?auto_378328 ?auto_378329 ?auto_378330 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378343 - BLOCK
      ?auto_378344 - BLOCK
      ?auto_378345 - BLOCK
      ?auto_378346 - BLOCK
      ?auto_378347 - BLOCK
      ?auto_378348 - BLOCK
      ?auto_378349 - BLOCK
      ?auto_378350 - BLOCK
      ?auto_378351 - BLOCK
      ?auto_378352 - BLOCK
      ?auto_378353 - BLOCK
    )
    :vars
    (
      ?auto_378354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378353 ?auto_378354 ) ( ON-TABLE ?auto_378343 ) ( not ( = ?auto_378343 ?auto_378344 ) ) ( not ( = ?auto_378343 ?auto_378345 ) ) ( not ( = ?auto_378343 ?auto_378346 ) ) ( not ( = ?auto_378343 ?auto_378347 ) ) ( not ( = ?auto_378343 ?auto_378348 ) ) ( not ( = ?auto_378343 ?auto_378349 ) ) ( not ( = ?auto_378343 ?auto_378350 ) ) ( not ( = ?auto_378343 ?auto_378351 ) ) ( not ( = ?auto_378343 ?auto_378352 ) ) ( not ( = ?auto_378343 ?auto_378353 ) ) ( not ( = ?auto_378343 ?auto_378354 ) ) ( not ( = ?auto_378344 ?auto_378345 ) ) ( not ( = ?auto_378344 ?auto_378346 ) ) ( not ( = ?auto_378344 ?auto_378347 ) ) ( not ( = ?auto_378344 ?auto_378348 ) ) ( not ( = ?auto_378344 ?auto_378349 ) ) ( not ( = ?auto_378344 ?auto_378350 ) ) ( not ( = ?auto_378344 ?auto_378351 ) ) ( not ( = ?auto_378344 ?auto_378352 ) ) ( not ( = ?auto_378344 ?auto_378353 ) ) ( not ( = ?auto_378344 ?auto_378354 ) ) ( not ( = ?auto_378345 ?auto_378346 ) ) ( not ( = ?auto_378345 ?auto_378347 ) ) ( not ( = ?auto_378345 ?auto_378348 ) ) ( not ( = ?auto_378345 ?auto_378349 ) ) ( not ( = ?auto_378345 ?auto_378350 ) ) ( not ( = ?auto_378345 ?auto_378351 ) ) ( not ( = ?auto_378345 ?auto_378352 ) ) ( not ( = ?auto_378345 ?auto_378353 ) ) ( not ( = ?auto_378345 ?auto_378354 ) ) ( not ( = ?auto_378346 ?auto_378347 ) ) ( not ( = ?auto_378346 ?auto_378348 ) ) ( not ( = ?auto_378346 ?auto_378349 ) ) ( not ( = ?auto_378346 ?auto_378350 ) ) ( not ( = ?auto_378346 ?auto_378351 ) ) ( not ( = ?auto_378346 ?auto_378352 ) ) ( not ( = ?auto_378346 ?auto_378353 ) ) ( not ( = ?auto_378346 ?auto_378354 ) ) ( not ( = ?auto_378347 ?auto_378348 ) ) ( not ( = ?auto_378347 ?auto_378349 ) ) ( not ( = ?auto_378347 ?auto_378350 ) ) ( not ( = ?auto_378347 ?auto_378351 ) ) ( not ( = ?auto_378347 ?auto_378352 ) ) ( not ( = ?auto_378347 ?auto_378353 ) ) ( not ( = ?auto_378347 ?auto_378354 ) ) ( not ( = ?auto_378348 ?auto_378349 ) ) ( not ( = ?auto_378348 ?auto_378350 ) ) ( not ( = ?auto_378348 ?auto_378351 ) ) ( not ( = ?auto_378348 ?auto_378352 ) ) ( not ( = ?auto_378348 ?auto_378353 ) ) ( not ( = ?auto_378348 ?auto_378354 ) ) ( not ( = ?auto_378349 ?auto_378350 ) ) ( not ( = ?auto_378349 ?auto_378351 ) ) ( not ( = ?auto_378349 ?auto_378352 ) ) ( not ( = ?auto_378349 ?auto_378353 ) ) ( not ( = ?auto_378349 ?auto_378354 ) ) ( not ( = ?auto_378350 ?auto_378351 ) ) ( not ( = ?auto_378350 ?auto_378352 ) ) ( not ( = ?auto_378350 ?auto_378353 ) ) ( not ( = ?auto_378350 ?auto_378354 ) ) ( not ( = ?auto_378351 ?auto_378352 ) ) ( not ( = ?auto_378351 ?auto_378353 ) ) ( not ( = ?auto_378351 ?auto_378354 ) ) ( not ( = ?auto_378352 ?auto_378353 ) ) ( not ( = ?auto_378352 ?auto_378354 ) ) ( not ( = ?auto_378353 ?auto_378354 ) ) ( ON ?auto_378352 ?auto_378353 ) ( ON ?auto_378351 ?auto_378352 ) ( ON ?auto_378350 ?auto_378351 ) ( ON ?auto_378349 ?auto_378350 ) ( ON ?auto_378348 ?auto_378349 ) ( ON ?auto_378347 ?auto_378348 ) ( ON ?auto_378346 ?auto_378347 ) ( ON ?auto_378345 ?auto_378346 ) ( CLEAR ?auto_378343 ) ( ON ?auto_378344 ?auto_378345 ) ( CLEAR ?auto_378344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_378343 ?auto_378344 )
      ( MAKE-11PILE ?auto_378343 ?auto_378344 ?auto_378345 ?auto_378346 ?auto_378347 ?auto_378348 ?auto_378349 ?auto_378350 ?auto_378351 ?auto_378352 ?auto_378353 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378366 - BLOCK
      ?auto_378367 - BLOCK
      ?auto_378368 - BLOCK
      ?auto_378369 - BLOCK
      ?auto_378370 - BLOCK
      ?auto_378371 - BLOCK
      ?auto_378372 - BLOCK
      ?auto_378373 - BLOCK
      ?auto_378374 - BLOCK
      ?auto_378375 - BLOCK
      ?auto_378376 - BLOCK
    )
    :vars
    (
      ?auto_378377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378376 ?auto_378377 ) ( ON-TABLE ?auto_378366 ) ( not ( = ?auto_378366 ?auto_378367 ) ) ( not ( = ?auto_378366 ?auto_378368 ) ) ( not ( = ?auto_378366 ?auto_378369 ) ) ( not ( = ?auto_378366 ?auto_378370 ) ) ( not ( = ?auto_378366 ?auto_378371 ) ) ( not ( = ?auto_378366 ?auto_378372 ) ) ( not ( = ?auto_378366 ?auto_378373 ) ) ( not ( = ?auto_378366 ?auto_378374 ) ) ( not ( = ?auto_378366 ?auto_378375 ) ) ( not ( = ?auto_378366 ?auto_378376 ) ) ( not ( = ?auto_378366 ?auto_378377 ) ) ( not ( = ?auto_378367 ?auto_378368 ) ) ( not ( = ?auto_378367 ?auto_378369 ) ) ( not ( = ?auto_378367 ?auto_378370 ) ) ( not ( = ?auto_378367 ?auto_378371 ) ) ( not ( = ?auto_378367 ?auto_378372 ) ) ( not ( = ?auto_378367 ?auto_378373 ) ) ( not ( = ?auto_378367 ?auto_378374 ) ) ( not ( = ?auto_378367 ?auto_378375 ) ) ( not ( = ?auto_378367 ?auto_378376 ) ) ( not ( = ?auto_378367 ?auto_378377 ) ) ( not ( = ?auto_378368 ?auto_378369 ) ) ( not ( = ?auto_378368 ?auto_378370 ) ) ( not ( = ?auto_378368 ?auto_378371 ) ) ( not ( = ?auto_378368 ?auto_378372 ) ) ( not ( = ?auto_378368 ?auto_378373 ) ) ( not ( = ?auto_378368 ?auto_378374 ) ) ( not ( = ?auto_378368 ?auto_378375 ) ) ( not ( = ?auto_378368 ?auto_378376 ) ) ( not ( = ?auto_378368 ?auto_378377 ) ) ( not ( = ?auto_378369 ?auto_378370 ) ) ( not ( = ?auto_378369 ?auto_378371 ) ) ( not ( = ?auto_378369 ?auto_378372 ) ) ( not ( = ?auto_378369 ?auto_378373 ) ) ( not ( = ?auto_378369 ?auto_378374 ) ) ( not ( = ?auto_378369 ?auto_378375 ) ) ( not ( = ?auto_378369 ?auto_378376 ) ) ( not ( = ?auto_378369 ?auto_378377 ) ) ( not ( = ?auto_378370 ?auto_378371 ) ) ( not ( = ?auto_378370 ?auto_378372 ) ) ( not ( = ?auto_378370 ?auto_378373 ) ) ( not ( = ?auto_378370 ?auto_378374 ) ) ( not ( = ?auto_378370 ?auto_378375 ) ) ( not ( = ?auto_378370 ?auto_378376 ) ) ( not ( = ?auto_378370 ?auto_378377 ) ) ( not ( = ?auto_378371 ?auto_378372 ) ) ( not ( = ?auto_378371 ?auto_378373 ) ) ( not ( = ?auto_378371 ?auto_378374 ) ) ( not ( = ?auto_378371 ?auto_378375 ) ) ( not ( = ?auto_378371 ?auto_378376 ) ) ( not ( = ?auto_378371 ?auto_378377 ) ) ( not ( = ?auto_378372 ?auto_378373 ) ) ( not ( = ?auto_378372 ?auto_378374 ) ) ( not ( = ?auto_378372 ?auto_378375 ) ) ( not ( = ?auto_378372 ?auto_378376 ) ) ( not ( = ?auto_378372 ?auto_378377 ) ) ( not ( = ?auto_378373 ?auto_378374 ) ) ( not ( = ?auto_378373 ?auto_378375 ) ) ( not ( = ?auto_378373 ?auto_378376 ) ) ( not ( = ?auto_378373 ?auto_378377 ) ) ( not ( = ?auto_378374 ?auto_378375 ) ) ( not ( = ?auto_378374 ?auto_378376 ) ) ( not ( = ?auto_378374 ?auto_378377 ) ) ( not ( = ?auto_378375 ?auto_378376 ) ) ( not ( = ?auto_378375 ?auto_378377 ) ) ( not ( = ?auto_378376 ?auto_378377 ) ) ( ON ?auto_378375 ?auto_378376 ) ( ON ?auto_378374 ?auto_378375 ) ( ON ?auto_378373 ?auto_378374 ) ( ON ?auto_378372 ?auto_378373 ) ( ON ?auto_378371 ?auto_378372 ) ( ON ?auto_378370 ?auto_378371 ) ( ON ?auto_378369 ?auto_378370 ) ( ON ?auto_378368 ?auto_378369 ) ( CLEAR ?auto_378366 ) ( ON ?auto_378367 ?auto_378368 ) ( CLEAR ?auto_378367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_378366 ?auto_378367 )
      ( MAKE-11PILE ?auto_378366 ?auto_378367 ?auto_378368 ?auto_378369 ?auto_378370 ?auto_378371 ?auto_378372 ?auto_378373 ?auto_378374 ?auto_378375 ?auto_378376 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378389 - BLOCK
      ?auto_378390 - BLOCK
      ?auto_378391 - BLOCK
      ?auto_378392 - BLOCK
      ?auto_378393 - BLOCK
      ?auto_378394 - BLOCK
      ?auto_378395 - BLOCK
      ?auto_378396 - BLOCK
      ?auto_378397 - BLOCK
      ?auto_378398 - BLOCK
      ?auto_378399 - BLOCK
    )
    :vars
    (
      ?auto_378400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378399 ?auto_378400 ) ( not ( = ?auto_378389 ?auto_378390 ) ) ( not ( = ?auto_378389 ?auto_378391 ) ) ( not ( = ?auto_378389 ?auto_378392 ) ) ( not ( = ?auto_378389 ?auto_378393 ) ) ( not ( = ?auto_378389 ?auto_378394 ) ) ( not ( = ?auto_378389 ?auto_378395 ) ) ( not ( = ?auto_378389 ?auto_378396 ) ) ( not ( = ?auto_378389 ?auto_378397 ) ) ( not ( = ?auto_378389 ?auto_378398 ) ) ( not ( = ?auto_378389 ?auto_378399 ) ) ( not ( = ?auto_378389 ?auto_378400 ) ) ( not ( = ?auto_378390 ?auto_378391 ) ) ( not ( = ?auto_378390 ?auto_378392 ) ) ( not ( = ?auto_378390 ?auto_378393 ) ) ( not ( = ?auto_378390 ?auto_378394 ) ) ( not ( = ?auto_378390 ?auto_378395 ) ) ( not ( = ?auto_378390 ?auto_378396 ) ) ( not ( = ?auto_378390 ?auto_378397 ) ) ( not ( = ?auto_378390 ?auto_378398 ) ) ( not ( = ?auto_378390 ?auto_378399 ) ) ( not ( = ?auto_378390 ?auto_378400 ) ) ( not ( = ?auto_378391 ?auto_378392 ) ) ( not ( = ?auto_378391 ?auto_378393 ) ) ( not ( = ?auto_378391 ?auto_378394 ) ) ( not ( = ?auto_378391 ?auto_378395 ) ) ( not ( = ?auto_378391 ?auto_378396 ) ) ( not ( = ?auto_378391 ?auto_378397 ) ) ( not ( = ?auto_378391 ?auto_378398 ) ) ( not ( = ?auto_378391 ?auto_378399 ) ) ( not ( = ?auto_378391 ?auto_378400 ) ) ( not ( = ?auto_378392 ?auto_378393 ) ) ( not ( = ?auto_378392 ?auto_378394 ) ) ( not ( = ?auto_378392 ?auto_378395 ) ) ( not ( = ?auto_378392 ?auto_378396 ) ) ( not ( = ?auto_378392 ?auto_378397 ) ) ( not ( = ?auto_378392 ?auto_378398 ) ) ( not ( = ?auto_378392 ?auto_378399 ) ) ( not ( = ?auto_378392 ?auto_378400 ) ) ( not ( = ?auto_378393 ?auto_378394 ) ) ( not ( = ?auto_378393 ?auto_378395 ) ) ( not ( = ?auto_378393 ?auto_378396 ) ) ( not ( = ?auto_378393 ?auto_378397 ) ) ( not ( = ?auto_378393 ?auto_378398 ) ) ( not ( = ?auto_378393 ?auto_378399 ) ) ( not ( = ?auto_378393 ?auto_378400 ) ) ( not ( = ?auto_378394 ?auto_378395 ) ) ( not ( = ?auto_378394 ?auto_378396 ) ) ( not ( = ?auto_378394 ?auto_378397 ) ) ( not ( = ?auto_378394 ?auto_378398 ) ) ( not ( = ?auto_378394 ?auto_378399 ) ) ( not ( = ?auto_378394 ?auto_378400 ) ) ( not ( = ?auto_378395 ?auto_378396 ) ) ( not ( = ?auto_378395 ?auto_378397 ) ) ( not ( = ?auto_378395 ?auto_378398 ) ) ( not ( = ?auto_378395 ?auto_378399 ) ) ( not ( = ?auto_378395 ?auto_378400 ) ) ( not ( = ?auto_378396 ?auto_378397 ) ) ( not ( = ?auto_378396 ?auto_378398 ) ) ( not ( = ?auto_378396 ?auto_378399 ) ) ( not ( = ?auto_378396 ?auto_378400 ) ) ( not ( = ?auto_378397 ?auto_378398 ) ) ( not ( = ?auto_378397 ?auto_378399 ) ) ( not ( = ?auto_378397 ?auto_378400 ) ) ( not ( = ?auto_378398 ?auto_378399 ) ) ( not ( = ?auto_378398 ?auto_378400 ) ) ( not ( = ?auto_378399 ?auto_378400 ) ) ( ON ?auto_378398 ?auto_378399 ) ( ON ?auto_378397 ?auto_378398 ) ( ON ?auto_378396 ?auto_378397 ) ( ON ?auto_378395 ?auto_378396 ) ( ON ?auto_378394 ?auto_378395 ) ( ON ?auto_378393 ?auto_378394 ) ( ON ?auto_378392 ?auto_378393 ) ( ON ?auto_378391 ?auto_378392 ) ( ON ?auto_378390 ?auto_378391 ) ( ON ?auto_378389 ?auto_378390 ) ( CLEAR ?auto_378389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_378389 )
      ( MAKE-11PILE ?auto_378389 ?auto_378390 ?auto_378391 ?auto_378392 ?auto_378393 ?auto_378394 ?auto_378395 ?auto_378396 ?auto_378397 ?auto_378398 ?auto_378399 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_378412 - BLOCK
      ?auto_378413 - BLOCK
      ?auto_378414 - BLOCK
      ?auto_378415 - BLOCK
      ?auto_378416 - BLOCK
      ?auto_378417 - BLOCK
      ?auto_378418 - BLOCK
      ?auto_378419 - BLOCK
      ?auto_378420 - BLOCK
      ?auto_378421 - BLOCK
      ?auto_378422 - BLOCK
    )
    :vars
    (
      ?auto_378423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378422 ?auto_378423 ) ( not ( = ?auto_378412 ?auto_378413 ) ) ( not ( = ?auto_378412 ?auto_378414 ) ) ( not ( = ?auto_378412 ?auto_378415 ) ) ( not ( = ?auto_378412 ?auto_378416 ) ) ( not ( = ?auto_378412 ?auto_378417 ) ) ( not ( = ?auto_378412 ?auto_378418 ) ) ( not ( = ?auto_378412 ?auto_378419 ) ) ( not ( = ?auto_378412 ?auto_378420 ) ) ( not ( = ?auto_378412 ?auto_378421 ) ) ( not ( = ?auto_378412 ?auto_378422 ) ) ( not ( = ?auto_378412 ?auto_378423 ) ) ( not ( = ?auto_378413 ?auto_378414 ) ) ( not ( = ?auto_378413 ?auto_378415 ) ) ( not ( = ?auto_378413 ?auto_378416 ) ) ( not ( = ?auto_378413 ?auto_378417 ) ) ( not ( = ?auto_378413 ?auto_378418 ) ) ( not ( = ?auto_378413 ?auto_378419 ) ) ( not ( = ?auto_378413 ?auto_378420 ) ) ( not ( = ?auto_378413 ?auto_378421 ) ) ( not ( = ?auto_378413 ?auto_378422 ) ) ( not ( = ?auto_378413 ?auto_378423 ) ) ( not ( = ?auto_378414 ?auto_378415 ) ) ( not ( = ?auto_378414 ?auto_378416 ) ) ( not ( = ?auto_378414 ?auto_378417 ) ) ( not ( = ?auto_378414 ?auto_378418 ) ) ( not ( = ?auto_378414 ?auto_378419 ) ) ( not ( = ?auto_378414 ?auto_378420 ) ) ( not ( = ?auto_378414 ?auto_378421 ) ) ( not ( = ?auto_378414 ?auto_378422 ) ) ( not ( = ?auto_378414 ?auto_378423 ) ) ( not ( = ?auto_378415 ?auto_378416 ) ) ( not ( = ?auto_378415 ?auto_378417 ) ) ( not ( = ?auto_378415 ?auto_378418 ) ) ( not ( = ?auto_378415 ?auto_378419 ) ) ( not ( = ?auto_378415 ?auto_378420 ) ) ( not ( = ?auto_378415 ?auto_378421 ) ) ( not ( = ?auto_378415 ?auto_378422 ) ) ( not ( = ?auto_378415 ?auto_378423 ) ) ( not ( = ?auto_378416 ?auto_378417 ) ) ( not ( = ?auto_378416 ?auto_378418 ) ) ( not ( = ?auto_378416 ?auto_378419 ) ) ( not ( = ?auto_378416 ?auto_378420 ) ) ( not ( = ?auto_378416 ?auto_378421 ) ) ( not ( = ?auto_378416 ?auto_378422 ) ) ( not ( = ?auto_378416 ?auto_378423 ) ) ( not ( = ?auto_378417 ?auto_378418 ) ) ( not ( = ?auto_378417 ?auto_378419 ) ) ( not ( = ?auto_378417 ?auto_378420 ) ) ( not ( = ?auto_378417 ?auto_378421 ) ) ( not ( = ?auto_378417 ?auto_378422 ) ) ( not ( = ?auto_378417 ?auto_378423 ) ) ( not ( = ?auto_378418 ?auto_378419 ) ) ( not ( = ?auto_378418 ?auto_378420 ) ) ( not ( = ?auto_378418 ?auto_378421 ) ) ( not ( = ?auto_378418 ?auto_378422 ) ) ( not ( = ?auto_378418 ?auto_378423 ) ) ( not ( = ?auto_378419 ?auto_378420 ) ) ( not ( = ?auto_378419 ?auto_378421 ) ) ( not ( = ?auto_378419 ?auto_378422 ) ) ( not ( = ?auto_378419 ?auto_378423 ) ) ( not ( = ?auto_378420 ?auto_378421 ) ) ( not ( = ?auto_378420 ?auto_378422 ) ) ( not ( = ?auto_378420 ?auto_378423 ) ) ( not ( = ?auto_378421 ?auto_378422 ) ) ( not ( = ?auto_378421 ?auto_378423 ) ) ( not ( = ?auto_378422 ?auto_378423 ) ) ( ON ?auto_378421 ?auto_378422 ) ( ON ?auto_378420 ?auto_378421 ) ( ON ?auto_378419 ?auto_378420 ) ( ON ?auto_378418 ?auto_378419 ) ( ON ?auto_378417 ?auto_378418 ) ( ON ?auto_378416 ?auto_378417 ) ( ON ?auto_378415 ?auto_378416 ) ( ON ?auto_378414 ?auto_378415 ) ( ON ?auto_378413 ?auto_378414 ) ( ON ?auto_378412 ?auto_378413 ) ( CLEAR ?auto_378412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_378412 )
      ( MAKE-11PILE ?auto_378412 ?auto_378413 ?auto_378414 ?auto_378415 ?auto_378416 ?auto_378417 ?auto_378418 ?auto_378419 ?auto_378420 ?auto_378421 ?auto_378422 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378436 - BLOCK
      ?auto_378437 - BLOCK
      ?auto_378438 - BLOCK
      ?auto_378439 - BLOCK
      ?auto_378440 - BLOCK
      ?auto_378441 - BLOCK
      ?auto_378442 - BLOCK
      ?auto_378443 - BLOCK
      ?auto_378444 - BLOCK
      ?auto_378445 - BLOCK
      ?auto_378446 - BLOCK
      ?auto_378447 - BLOCK
    )
    :vars
    (
      ?auto_378448 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_378446 ) ( ON ?auto_378447 ?auto_378448 ) ( CLEAR ?auto_378447 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_378436 ) ( ON ?auto_378437 ?auto_378436 ) ( ON ?auto_378438 ?auto_378437 ) ( ON ?auto_378439 ?auto_378438 ) ( ON ?auto_378440 ?auto_378439 ) ( ON ?auto_378441 ?auto_378440 ) ( ON ?auto_378442 ?auto_378441 ) ( ON ?auto_378443 ?auto_378442 ) ( ON ?auto_378444 ?auto_378443 ) ( ON ?auto_378445 ?auto_378444 ) ( ON ?auto_378446 ?auto_378445 ) ( not ( = ?auto_378436 ?auto_378437 ) ) ( not ( = ?auto_378436 ?auto_378438 ) ) ( not ( = ?auto_378436 ?auto_378439 ) ) ( not ( = ?auto_378436 ?auto_378440 ) ) ( not ( = ?auto_378436 ?auto_378441 ) ) ( not ( = ?auto_378436 ?auto_378442 ) ) ( not ( = ?auto_378436 ?auto_378443 ) ) ( not ( = ?auto_378436 ?auto_378444 ) ) ( not ( = ?auto_378436 ?auto_378445 ) ) ( not ( = ?auto_378436 ?auto_378446 ) ) ( not ( = ?auto_378436 ?auto_378447 ) ) ( not ( = ?auto_378436 ?auto_378448 ) ) ( not ( = ?auto_378437 ?auto_378438 ) ) ( not ( = ?auto_378437 ?auto_378439 ) ) ( not ( = ?auto_378437 ?auto_378440 ) ) ( not ( = ?auto_378437 ?auto_378441 ) ) ( not ( = ?auto_378437 ?auto_378442 ) ) ( not ( = ?auto_378437 ?auto_378443 ) ) ( not ( = ?auto_378437 ?auto_378444 ) ) ( not ( = ?auto_378437 ?auto_378445 ) ) ( not ( = ?auto_378437 ?auto_378446 ) ) ( not ( = ?auto_378437 ?auto_378447 ) ) ( not ( = ?auto_378437 ?auto_378448 ) ) ( not ( = ?auto_378438 ?auto_378439 ) ) ( not ( = ?auto_378438 ?auto_378440 ) ) ( not ( = ?auto_378438 ?auto_378441 ) ) ( not ( = ?auto_378438 ?auto_378442 ) ) ( not ( = ?auto_378438 ?auto_378443 ) ) ( not ( = ?auto_378438 ?auto_378444 ) ) ( not ( = ?auto_378438 ?auto_378445 ) ) ( not ( = ?auto_378438 ?auto_378446 ) ) ( not ( = ?auto_378438 ?auto_378447 ) ) ( not ( = ?auto_378438 ?auto_378448 ) ) ( not ( = ?auto_378439 ?auto_378440 ) ) ( not ( = ?auto_378439 ?auto_378441 ) ) ( not ( = ?auto_378439 ?auto_378442 ) ) ( not ( = ?auto_378439 ?auto_378443 ) ) ( not ( = ?auto_378439 ?auto_378444 ) ) ( not ( = ?auto_378439 ?auto_378445 ) ) ( not ( = ?auto_378439 ?auto_378446 ) ) ( not ( = ?auto_378439 ?auto_378447 ) ) ( not ( = ?auto_378439 ?auto_378448 ) ) ( not ( = ?auto_378440 ?auto_378441 ) ) ( not ( = ?auto_378440 ?auto_378442 ) ) ( not ( = ?auto_378440 ?auto_378443 ) ) ( not ( = ?auto_378440 ?auto_378444 ) ) ( not ( = ?auto_378440 ?auto_378445 ) ) ( not ( = ?auto_378440 ?auto_378446 ) ) ( not ( = ?auto_378440 ?auto_378447 ) ) ( not ( = ?auto_378440 ?auto_378448 ) ) ( not ( = ?auto_378441 ?auto_378442 ) ) ( not ( = ?auto_378441 ?auto_378443 ) ) ( not ( = ?auto_378441 ?auto_378444 ) ) ( not ( = ?auto_378441 ?auto_378445 ) ) ( not ( = ?auto_378441 ?auto_378446 ) ) ( not ( = ?auto_378441 ?auto_378447 ) ) ( not ( = ?auto_378441 ?auto_378448 ) ) ( not ( = ?auto_378442 ?auto_378443 ) ) ( not ( = ?auto_378442 ?auto_378444 ) ) ( not ( = ?auto_378442 ?auto_378445 ) ) ( not ( = ?auto_378442 ?auto_378446 ) ) ( not ( = ?auto_378442 ?auto_378447 ) ) ( not ( = ?auto_378442 ?auto_378448 ) ) ( not ( = ?auto_378443 ?auto_378444 ) ) ( not ( = ?auto_378443 ?auto_378445 ) ) ( not ( = ?auto_378443 ?auto_378446 ) ) ( not ( = ?auto_378443 ?auto_378447 ) ) ( not ( = ?auto_378443 ?auto_378448 ) ) ( not ( = ?auto_378444 ?auto_378445 ) ) ( not ( = ?auto_378444 ?auto_378446 ) ) ( not ( = ?auto_378444 ?auto_378447 ) ) ( not ( = ?auto_378444 ?auto_378448 ) ) ( not ( = ?auto_378445 ?auto_378446 ) ) ( not ( = ?auto_378445 ?auto_378447 ) ) ( not ( = ?auto_378445 ?auto_378448 ) ) ( not ( = ?auto_378446 ?auto_378447 ) ) ( not ( = ?auto_378446 ?auto_378448 ) ) ( not ( = ?auto_378447 ?auto_378448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_378447 ?auto_378448 )
      ( !STACK ?auto_378447 ?auto_378446 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378461 - BLOCK
      ?auto_378462 - BLOCK
      ?auto_378463 - BLOCK
      ?auto_378464 - BLOCK
      ?auto_378465 - BLOCK
      ?auto_378466 - BLOCK
      ?auto_378467 - BLOCK
      ?auto_378468 - BLOCK
      ?auto_378469 - BLOCK
      ?auto_378470 - BLOCK
      ?auto_378471 - BLOCK
      ?auto_378472 - BLOCK
    )
    :vars
    (
      ?auto_378473 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_378471 ) ( ON ?auto_378472 ?auto_378473 ) ( CLEAR ?auto_378472 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_378461 ) ( ON ?auto_378462 ?auto_378461 ) ( ON ?auto_378463 ?auto_378462 ) ( ON ?auto_378464 ?auto_378463 ) ( ON ?auto_378465 ?auto_378464 ) ( ON ?auto_378466 ?auto_378465 ) ( ON ?auto_378467 ?auto_378466 ) ( ON ?auto_378468 ?auto_378467 ) ( ON ?auto_378469 ?auto_378468 ) ( ON ?auto_378470 ?auto_378469 ) ( ON ?auto_378471 ?auto_378470 ) ( not ( = ?auto_378461 ?auto_378462 ) ) ( not ( = ?auto_378461 ?auto_378463 ) ) ( not ( = ?auto_378461 ?auto_378464 ) ) ( not ( = ?auto_378461 ?auto_378465 ) ) ( not ( = ?auto_378461 ?auto_378466 ) ) ( not ( = ?auto_378461 ?auto_378467 ) ) ( not ( = ?auto_378461 ?auto_378468 ) ) ( not ( = ?auto_378461 ?auto_378469 ) ) ( not ( = ?auto_378461 ?auto_378470 ) ) ( not ( = ?auto_378461 ?auto_378471 ) ) ( not ( = ?auto_378461 ?auto_378472 ) ) ( not ( = ?auto_378461 ?auto_378473 ) ) ( not ( = ?auto_378462 ?auto_378463 ) ) ( not ( = ?auto_378462 ?auto_378464 ) ) ( not ( = ?auto_378462 ?auto_378465 ) ) ( not ( = ?auto_378462 ?auto_378466 ) ) ( not ( = ?auto_378462 ?auto_378467 ) ) ( not ( = ?auto_378462 ?auto_378468 ) ) ( not ( = ?auto_378462 ?auto_378469 ) ) ( not ( = ?auto_378462 ?auto_378470 ) ) ( not ( = ?auto_378462 ?auto_378471 ) ) ( not ( = ?auto_378462 ?auto_378472 ) ) ( not ( = ?auto_378462 ?auto_378473 ) ) ( not ( = ?auto_378463 ?auto_378464 ) ) ( not ( = ?auto_378463 ?auto_378465 ) ) ( not ( = ?auto_378463 ?auto_378466 ) ) ( not ( = ?auto_378463 ?auto_378467 ) ) ( not ( = ?auto_378463 ?auto_378468 ) ) ( not ( = ?auto_378463 ?auto_378469 ) ) ( not ( = ?auto_378463 ?auto_378470 ) ) ( not ( = ?auto_378463 ?auto_378471 ) ) ( not ( = ?auto_378463 ?auto_378472 ) ) ( not ( = ?auto_378463 ?auto_378473 ) ) ( not ( = ?auto_378464 ?auto_378465 ) ) ( not ( = ?auto_378464 ?auto_378466 ) ) ( not ( = ?auto_378464 ?auto_378467 ) ) ( not ( = ?auto_378464 ?auto_378468 ) ) ( not ( = ?auto_378464 ?auto_378469 ) ) ( not ( = ?auto_378464 ?auto_378470 ) ) ( not ( = ?auto_378464 ?auto_378471 ) ) ( not ( = ?auto_378464 ?auto_378472 ) ) ( not ( = ?auto_378464 ?auto_378473 ) ) ( not ( = ?auto_378465 ?auto_378466 ) ) ( not ( = ?auto_378465 ?auto_378467 ) ) ( not ( = ?auto_378465 ?auto_378468 ) ) ( not ( = ?auto_378465 ?auto_378469 ) ) ( not ( = ?auto_378465 ?auto_378470 ) ) ( not ( = ?auto_378465 ?auto_378471 ) ) ( not ( = ?auto_378465 ?auto_378472 ) ) ( not ( = ?auto_378465 ?auto_378473 ) ) ( not ( = ?auto_378466 ?auto_378467 ) ) ( not ( = ?auto_378466 ?auto_378468 ) ) ( not ( = ?auto_378466 ?auto_378469 ) ) ( not ( = ?auto_378466 ?auto_378470 ) ) ( not ( = ?auto_378466 ?auto_378471 ) ) ( not ( = ?auto_378466 ?auto_378472 ) ) ( not ( = ?auto_378466 ?auto_378473 ) ) ( not ( = ?auto_378467 ?auto_378468 ) ) ( not ( = ?auto_378467 ?auto_378469 ) ) ( not ( = ?auto_378467 ?auto_378470 ) ) ( not ( = ?auto_378467 ?auto_378471 ) ) ( not ( = ?auto_378467 ?auto_378472 ) ) ( not ( = ?auto_378467 ?auto_378473 ) ) ( not ( = ?auto_378468 ?auto_378469 ) ) ( not ( = ?auto_378468 ?auto_378470 ) ) ( not ( = ?auto_378468 ?auto_378471 ) ) ( not ( = ?auto_378468 ?auto_378472 ) ) ( not ( = ?auto_378468 ?auto_378473 ) ) ( not ( = ?auto_378469 ?auto_378470 ) ) ( not ( = ?auto_378469 ?auto_378471 ) ) ( not ( = ?auto_378469 ?auto_378472 ) ) ( not ( = ?auto_378469 ?auto_378473 ) ) ( not ( = ?auto_378470 ?auto_378471 ) ) ( not ( = ?auto_378470 ?auto_378472 ) ) ( not ( = ?auto_378470 ?auto_378473 ) ) ( not ( = ?auto_378471 ?auto_378472 ) ) ( not ( = ?auto_378471 ?auto_378473 ) ) ( not ( = ?auto_378472 ?auto_378473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_378472 ?auto_378473 )
      ( !STACK ?auto_378472 ?auto_378471 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378486 - BLOCK
      ?auto_378487 - BLOCK
      ?auto_378488 - BLOCK
      ?auto_378489 - BLOCK
      ?auto_378490 - BLOCK
      ?auto_378491 - BLOCK
      ?auto_378492 - BLOCK
      ?auto_378493 - BLOCK
      ?auto_378494 - BLOCK
      ?auto_378495 - BLOCK
      ?auto_378496 - BLOCK
      ?auto_378497 - BLOCK
    )
    :vars
    (
      ?auto_378498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378497 ?auto_378498 ) ( ON-TABLE ?auto_378486 ) ( ON ?auto_378487 ?auto_378486 ) ( ON ?auto_378488 ?auto_378487 ) ( ON ?auto_378489 ?auto_378488 ) ( ON ?auto_378490 ?auto_378489 ) ( ON ?auto_378491 ?auto_378490 ) ( ON ?auto_378492 ?auto_378491 ) ( ON ?auto_378493 ?auto_378492 ) ( ON ?auto_378494 ?auto_378493 ) ( ON ?auto_378495 ?auto_378494 ) ( not ( = ?auto_378486 ?auto_378487 ) ) ( not ( = ?auto_378486 ?auto_378488 ) ) ( not ( = ?auto_378486 ?auto_378489 ) ) ( not ( = ?auto_378486 ?auto_378490 ) ) ( not ( = ?auto_378486 ?auto_378491 ) ) ( not ( = ?auto_378486 ?auto_378492 ) ) ( not ( = ?auto_378486 ?auto_378493 ) ) ( not ( = ?auto_378486 ?auto_378494 ) ) ( not ( = ?auto_378486 ?auto_378495 ) ) ( not ( = ?auto_378486 ?auto_378496 ) ) ( not ( = ?auto_378486 ?auto_378497 ) ) ( not ( = ?auto_378486 ?auto_378498 ) ) ( not ( = ?auto_378487 ?auto_378488 ) ) ( not ( = ?auto_378487 ?auto_378489 ) ) ( not ( = ?auto_378487 ?auto_378490 ) ) ( not ( = ?auto_378487 ?auto_378491 ) ) ( not ( = ?auto_378487 ?auto_378492 ) ) ( not ( = ?auto_378487 ?auto_378493 ) ) ( not ( = ?auto_378487 ?auto_378494 ) ) ( not ( = ?auto_378487 ?auto_378495 ) ) ( not ( = ?auto_378487 ?auto_378496 ) ) ( not ( = ?auto_378487 ?auto_378497 ) ) ( not ( = ?auto_378487 ?auto_378498 ) ) ( not ( = ?auto_378488 ?auto_378489 ) ) ( not ( = ?auto_378488 ?auto_378490 ) ) ( not ( = ?auto_378488 ?auto_378491 ) ) ( not ( = ?auto_378488 ?auto_378492 ) ) ( not ( = ?auto_378488 ?auto_378493 ) ) ( not ( = ?auto_378488 ?auto_378494 ) ) ( not ( = ?auto_378488 ?auto_378495 ) ) ( not ( = ?auto_378488 ?auto_378496 ) ) ( not ( = ?auto_378488 ?auto_378497 ) ) ( not ( = ?auto_378488 ?auto_378498 ) ) ( not ( = ?auto_378489 ?auto_378490 ) ) ( not ( = ?auto_378489 ?auto_378491 ) ) ( not ( = ?auto_378489 ?auto_378492 ) ) ( not ( = ?auto_378489 ?auto_378493 ) ) ( not ( = ?auto_378489 ?auto_378494 ) ) ( not ( = ?auto_378489 ?auto_378495 ) ) ( not ( = ?auto_378489 ?auto_378496 ) ) ( not ( = ?auto_378489 ?auto_378497 ) ) ( not ( = ?auto_378489 ?auto_378498 ) ) ( not ( = ?auto_378490 ?auto_378491 ) ) ( not ( = ?auto_378490 ?auto_378492 ) ) ( not ( = ?auto_378490 ?auto_378493 ) ) ( not ( = ?auto_378490 ?auto_378494 ) ) ( not ( = ?auto_378490 ?auto_378495 ) ) ( not ( = ?auto_378490 ?auto_378496 ) ) ( not ( = ?auto_378490 ?auto_378497 ) ) ( not ( = ?auto_378490 ?auto_378498 ) ) ( not ( = ?auto_378491 ?auto_378492 ) ) ( not ( = ?auto_378491 ?auto_378493 ) ) ( not ( = ?auto_378491 ?auto_378494 ) ) ( not ( = ?auto_378491 ?auto_378495 ) ) ( not ( = ?auto_378491 ?auto_378496 ) ) ( not ( = ?auto_378491 ?auto_378497 ) ) ( not ( = ?auto_378491 ?auto_378498 ) ) ( not ( = ?auto_378492 ?auto_378493 ) ) ( not ( = ?auto_378492 ?auto_378494 ) ) ( not ( = ?auto_378492 ?auto_378495 ) ) ( not ( = ?auto_378492 ?auto_378496 ) ) ( not ( = ?auto_378492 ?auto_378497 ) ) ( not ( = ?auto_378492 ?auto_378498 ) ) ( not ( = ?auto_378493 ?auto_378494 ) ) ( not ( = ?auto_378493 ?auto_378495 ) ) ( not ( = ?auto_378493 ?auto_378496 ) ) ( not ( = ?auto_378493 ?auto_378497 ) ) ( not ( = ?auto_378493 ?auto_378498 ) ) ( not ( = ?auto_378494 ?auto_378495 ) ) ( not ( = ?auto_378494 ?auto_378496 ) ) ( not ( = ?auto_378494 ?auto_378497 ) ) ( not ( = ?auto_378494 ?auto_378498 ) ) ( not ( = ?auto_378495 ?auto_378496 ) ) ( not ( = ?auto_378495 ?auto_378497 ) ) ( not ( = ?auto_378495 ?auto_378498 ) ) ( not ( = ?auto_378496 ?auto_378497 ) ) ( not ( = ?auto_378496 ?auto_378498 ) ) ( not ( = ?auto_378497 ?auto_378498 ) ) ( CLEAR ?auto_378495 ) ( ON ?auto_378496 ?auto_378497 ) ( CLEAR ?auto_378496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_378486 ?auto_378487 ?auto_378488 ?auto_378489 ?auto_378490 ?auto_378491 ?auto_378492 ?auto_378493 ?auto_378494 ?auto_378495 ?auto_378496 )
      ( MAKE-12PILE ?auto_378486 ?auto_378487 ?auto_378488 ?auto_378489 ?auto_378490 ?auto_378491 ?auto_378492 ?auto_378493 ?auto_378494 ?auto_378495 ?auto_378496 ?auto_378497 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378511 - BLOCK
      ?auto_378512 - BLOCK
      ?auto_378513 - BLOCK
      ?auto_378514 - BLOCK
      ?auto_378515 - BLOCK
      ?auto_378516 - BLOCK
      ?auto_378517 - BLOCK
      ?auto_378518 - BLOCK
      ?auto_378519 - BLOCK
      ?auto_378520 - BLOCK
      ?auto_378521 - BLOCK
      ?auto_378522 - BLOCK
    )
    :vars
    (
      ?auto_378523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378522 ?auto_378523 ) ( ON-TABLE ?auto_378511 ) ( ON ?auto_378512 ?auto_378511 ) ( ON ?auto_378513 ?auto_378512 ) ( ON ?auto_378514 ?auto_378513 ) ( ON ?auto_378515 ?auto_378514 ) ( ON ?auto_378516 ?auto_378515 ) ( ON ?auto_378517 ?auto_378516 ) ( ON ?auto_378518 ?auto_378517 ) ( ON ?auto_378519 ?auto_378518 ) ( ON ?auto_378520 ?auto_378519 ) ( not ( = ?auto_378511 ?auto_378512 ) ) ( not ( = ?auto_378511 ?auto_378513 ) ) ( not ( = ?auto_378511 ?auto_378514 ) ) ( not ( = ?auto_378511 ?auto_378515 ) ) ( not ( = ?auto_378511 ?auto_378516 ) ) ( not ( = ?auto_378511 ?auto_378517 ) ) ( not ( = ?auto_378511 ?auto_378518 ) ) ( not ( = ?auto_378511 ?auto_378519 ) ) ( not ( = ?auto_378511 ?auto_378520 ) ) ( not ( = ?auto_378511 ?auto_378521 ) ) ( not ( = ?auto_378511 ?auto_378522 ) ) ( not ( = ?auto_378511 ?auto_378523 ) ) ( not ( = ?auto_378512 ?auto_378513 ) ) ( not ( = ?auto_378512 ?auto_378514 ) ) ( not ( = ?auto_378512 ?auto_378515 ) ) ( not ( = ?auto_378512 ?auto_378516 ) ) ( not ( = ?auto_378512 ?auto_378517 ) ) ( not ( = ?auto_378512 ?auto_378518 ) ) ( not ( = ?auto_378512 ?auto_378519 ) ) ( not ( = ?auto_378512 ?auto_378520 ) ) ( not ( = ?auto_378512 ?auto_378521 ) ) ( not ( = ?auto_378512 ?auto_378522 ) ) ( not ( = ?auto_378512 ?auto_378523 ) ) ( not ( = ?auto_378513 ?auto_378514 ) ) ( not ( = ?auto_378513 ?auto_378515 ) ) ( not ( = ?auto_378513 ?auto_378516 ) ) ( not ( = ?auto_378513 ?auto_378517 ) ) ( not ( = ?auto_378513 ?auto_378518 ) ) ( not ( = ?auto_378513 ?auto_378519 ) ) ( not ( = ?auto_378513 ?auto_378520 ) ) ( not ( = ?auto_378513 ?auto_378521 ) ) ( not ( = ?auto_378513 ?auto_378522 ) ) ( not ( = ?auto_378513 ?auto_378523 ) ) ( not ( = ?auto_378514 ?auto_378515 ) ) ( not ( = ?auto_378514 ?auto_378516 ) ) ( not ( = ?auto_378514 ?auto_378517 ) ) ( not ( = ?auto_378514 ?auto_378518 ) ) ( not ( = ?auto_378514 ?auto_378519 ) ) ( not ( = ?auto_378514 ?auto_378520 ) ) ( not ( = ?auto_378514 ?auto_378521 ) ) ( not ( = ?auto_378514 ?auto_378522 ) ) ( not ( = ?auto_378514 ?auto_378523 ) ) ( not ( = ?auto_378515 ?auto_378516 ) ) ( not ( = ?auto_378515 ?auto_378517 ) ) ( not ( = ?auto_378515 ?auto_378518 ) ) ( not ( = ?auto_378515 ?auto_378519 ) ) ( not ( = ?auto_378515 ?auto_378520 ) ) ( not ( = ?auto_378515 ?auto_378521 ) ) ( not ( = ?auto_378515 ?auto_378522 ) ) ( not ( = ?auto_378515 ?auto_378523 ) ) ( not ( = ?auto_378516 ?auto_378517 ) ) ( not ( = ?auto_378516 ?auto_378518 ) ) ( not ( = ?auto_378516 ?auto_378519 ) ) ( not ( = ?auto_378516 ?auto_378520 ) ) ( not ( = ?auto_378516 ?auto_378521 ) ) ( not ( = ?auto_378516 ?auto_378522 ) ) ( not ( = ?auto_378516 ?auto_378523 ) ) ( not ( = ?auto_378517 ?auto_378518 ) ) ( not ( = ?auto_378517 ?auto_378519 ) ) ( not ( = ?auto_378517 ?auto_378520 ) ) ( not ( = ?auto_378517 ?auto_378521 ) ) ( not ( = ?auto_378517 ?auto_378522 ) ) ( not ( = ?auto_378517 ?auto_378523 ) ) ( not ( = ?auto_378518 ?auto_378519 ) ) ( not ( = ?auto_378518 ?auto_378520 ) ) ( not ( = ?auto_378518 ?auto_378521 ) ) ( not ( = ?auto_378518 ?auto_378522 ) ) ( not ( = ?auto_378518 ?auto_378523 ) ) ( not ( = ?auto_378519 ?auto_378520 ) ) ( not ( = ?auto_378519 ?auto_378521 ) ) ( not ( = ?auto_378519 ?auto_378522 ) ) ( not ( = ?auto_378519 ?auto_378523 ) ) ( not ( = ?auto_378520 ?auto_378521 ) ) ( not ( = ?auto_378520 ?auto_378522 ) ) ( not ( = ?auto_378520 ?auto_378523 ) ) ( not ( = ?auto_378521 ?auto_378522 ) ) ( not ( = ?auto_378521 ?auto_378523 ) ) ( not ( = ?auto_378522 ?auto_378523 ) ) ( CLEAR ?auto_378520 ) ( ON ?auto_378521 ?auto_378522 ) ( CLEAR ?auto_378521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_378511 ?auto_378512 ?auto_378513 ?auto_378514 ?auto_378515 ?auto_378516 ?auto_378517 ?auto_378518 ?auto_378519 ?auto_378520 ?auto_378521 )
      ( MAKE-12PILE ?auto_378511 ?auto_378512 ?auto_378513 ?auto_378514 ?auto_378515 ?auto_378516 ?auto_378517 ?auto_378518 ?auto_378519 ?auto_378520 ?auto_378521 ?auto_378522 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378536 - BLOCK
      ?auto_378537 - BLOCK
      ?auto_378538 - BLOCK
      ?auto_378539 - BLOCK
      ?auto_378540 - BLOCK
      ?auto_378541 - BLOCK
      ?auto_378542 - BLOCK
      ?auto_378543 - BLOCK
      ?auto_378544 - BLOCK
      ?auto_378545 - BLOCK
      ?auto_378546 - BLOCK
      ?auto_378547 - BLOCK
    )
    :vars
    (
      ?auto_378548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378547 ?auto_378548 ) ( ON-TABLE ?auto_378536 ) ( ON ?auto_378537 ?auto_378536 ) ( ON ?auto_378538 ?auto_378537 ) ( ON ?auto_378539 ?auto_378538 ) ( ON ?auto_378540 ?auto_378539 ) ( ON ?auto_378541 ?auto_378540 ) ( ON ?auto_378542 ?auto_378541 ) ( ON ?auto_378543 ?auto_378542 ) ( ON ?auto_378544 ?auto_378543 ) ( not ( = ?auto_378536 ?auto_378537 ) ) ( not ( = ?auto_378536 ?auto_378538 ) ) ( not ( = ?auto_378536 ?auto_378539 ) ) ( not ( = ?auto_378536 ?auto_378540 ) ) ( not ( = ?auto_378536 ?auto_378541 ) ) ( not ( = ?auto_378536 ?auto_378542 ) ) ( not ( = ?auto_378536 ?auto_378543 ) ) ( not ( = ?auto_378536 ?auto_378544 ) ) ( not ( = ?auto_378536 ?auto_378545 ) ) ( not ( = ?auto_378536 ?auto_378546 ) ) ( not ( = ?auto_378536 ?auto_378547 ) ) ( not ( = ?auto_378536 ?auto_378548 ) ) ( not ( = ?auto_378537 ?auto_378538 ) ) ( not ( = ?auto_378537 ?auto_378539 ) ) ( not ( = ?auto_378537 ?auto_378540 ) ) ( not ( = ?auto_378537 ?auto_378541 ) ) ( not ( = ?auto_378537 ?auto_378542 ) ) ( not ( = ?auto_378537 ?auto_378543 ) ) ( not ( = ?auto_378537 ?auto_378544 ) ) ( not ( = ?auto_378537 ?auto_378545 ) ) ( not ( = ?auto_378537 ?auto_378546 ) ) ( not ( = ?auto_378537 ?auto_378547 ) ) ( not ( = ?auto_378537 ?auto_378548 ) ) ( not ( = ?auto_378538 ?auto_378539 ) ) ( not ( = ?auto_378538 ?auto_378540 ) ) ( not ( = ?auto_378538 ?auto_378541 ) ) ( not ( = ?auto_378538 ?auto_378542 ) ) ( not ( = ?auto_378538 ?auto_378543 ) ) ( not ( = ?auto_378538 ?auto_378544 ) ) ( not ( = ?auto_378538 ?auto_378545 ) ) ( not ( = ?auto_378538 ?auto_378546 ) ) ( not ( = ?auto_378538 ?auto_378547 ) ) ( not ( = ?auto_378538 ?auto_378548 ) ) ( not ( = ?auto_378539 ?auto_378540 ) ) ( not ( = ?auto_378539 ?auto_378541 ) ) ( not ( = ?auto_378539 ?auto_378542 ) ) ( not ( = ?auto_378539 ?auto_378543 ) ) ( not ( = ?auto_378539 ?auto_378544 ) ) ( not ( = ?auto_378539 ?auto_378545 ) ) ( not ( = ?auto_378539 ?auto_378546 ) ) ( not ( = ?auto_378539 ?auto_378547 ) ) ( not ( = ?auto_378539 ?auto_378548 ) ) ( not ( = ?auto_378540 ?auto_378541 ) ) ( not ( = ?auto_378540 ?auto_378542 ) ) ( not ( = ?auto_378540 ?auto_378543 ) ) ( not ( = ?auto_378540 ?auto_378544 ) ) ( not ( = ?auto_378540 ?auto_378545 ) ) ( not ( = ?auto_378540 ?auto_378546 ) ) ( not ( = ?auto_378540 ?auto_378547 ) ) ( not ( = ?auto_378540 ?auto_378548 ) ) ( not ( = ?auto_378541 ?auto_378542 ) ) ( not ( = ?auto_378541 ?auto_378543 ) ) ( not ( = ?auto_378541 ?auto_378544 ) ) ( not ( = ?auto_378541 ?auto_378545 ) ) ( not ( = ?auto_378541 ?auto_378546 ) ) ( not ( = ?auto_378541 ?auto_378547 ) ) ( not ( = ?auto_378541 ?auto_378548 ) ) ( not ( = ?auto_378542 ?auto_378543 ) ) ( not ( = ?auto_378542 ?auto_378544 ) ) ( not ( = ?auto_378542 ?auto_378545 ) ) ( not ( = ?auto_378542 ?auto_378546 ) ) ( not ( = ?auto_378542 ?auto_378547 ) ) ( not ( = ?auto_378542 ?auto_378548 ) ) ( not ( = ?auto_378543 ?auto_378544 ) ) ( not ( = ?auto_378543 ?auto_378545 ) ) ( not ( = ?auto_378543 ?auto_378546 ) ) ( not ( = ?auto_378543 ?auto_378547 ) ) ( not ( = ?auto_378543 ?auto_378548 ) ) ( not ( = ?auto_378544 ?auto_378545 ) ) ( not ( = ?auto_378544 ?auto_378546 ) ) ( not ( = ?auto_378544 ?auto_378547 ) ) ( not ( = ?auto_378544 ?auto_378548 ) ) ( not ( = ?auto_378545 ?auto_378546 ) ) ( not ( = ?auto_378545 ?auto_378547 ) ) ( not ( = ?auto_378545 ?auto_378548 ) ) ( not ( = ?auto_378546 ?auto_378547 ) ) ( not ( = ?auto_378546 ?auto_378548 ) ) ( not ( = ?auto_378547 ?auto_378548 ) ) ( ON ?auto_378546 ?auto_378547 ) ( CLEAR ?auto_378544 ) ( ON ?auto_378545 ?auto_378546 ) ( CLEAR ?auto_378545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_378536 ?auto_378537 ?auto_378538 ?auto_378539 ?auto_378540 ?auto_378541 ?auto_378542 ?auto_378543 ?auto_378544 ?auto_378545 )
      ( MAKE-12PILE ?auto_378536 ?auto_378537 ?auto_378538 ?auto_378539 ?auto_378540 ?auto_378541 ?auto_378542 ?auto_378543 ?auto_378544 ?auto_378545 ?auto_378546 ?auto_378547 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378561 - BLOCK
      ?auto_378562 - BLOCK
      ?auto_378563 - BLOCK
      ?auto_378564 - BLOCK
      ?auto_378565 - BLOCK
      ?auto_378566 - BLOCK
      ?auto_378567 - BLOCK
      ?auto_378568 - BLOCK
      ?auto_378569 - BLOCK
      ?auto_378570 - BLOCK
      ?auto_378571 - BLOCK
      ?auto_378572 - BLOCK
    )
    :vars
    (
      ?auto_378573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378572 ?auto_378573 ) ( ON-TABLE ?auto_378561 ) ( ON ?auto_378562 ?auto_378561 ) ( ON ?auto_378563 ?auto_378562 ) ( ON ?auto_378564 ?auto_378563 ) ( ON ?auto_378565 ?auto_378564 ) ( ON ?auto_378566 ?auto_378565 ) ( ON ?auto_378567 ?auto_378566 ) ( ON ?auto_378568 ?auto_378567 ) ( ON ?auto_378569 ?auto_378568 ) ( not ( = ?auto_378561 ?auto_378562 ) ) ( not ( = ?auto_378561 ?auto_378563 ) ) ( not ( = ?auto_378561 ?auto_378564 ) ) ( not ( = ?auto_378561 ?auto_378565 ) ) ( not ( = ?auto_378561 ?auto_378566 ) ) ( not ( = ?auto_378561 ?auto_378567 ) ) ( not ( = ?auto_378561 ?auto_378568 ) ) ( not ( = ?auto_378561 ?auto_378569 ) ) ( not ( = ?auto_378561 ?auto_378570 ) ) ( not ( = ?auto_378561 ?auto_378571 ) ) ( not ( = ?auto_378561 ?auto_378572 ) ) ( not ( = ?auto_378561 ?auto_378573 ) ) ( not ( = ?auto_378562 ?auto_378563 ) ) ( not ( = ?auto_378562 ?auto_378564 ) ) ( not ( = ?auto_378562 ?auto_378565 ) ) ( not ( = ?auto_378562 ?auto_378566 ) ) ( not ( = ?auto_378562 ?auto_378567 ) ) ( not ( = ?auto_378562 ?auto_378568 ) ) ( not ( = ?auto_378562 ?auto_378569 ) ) ( not ( = ?auto_378562 ?auto_378570 ) ) ( not ( = ?auto_378562 ?auto_378571 ) ) ( not ( = ?auto_378562 ?auto_378572 ) ) ( not ( = ?auto_378562 ?auto_378573 ) ) ( not ( = ?auto_378563 ?auto_378564 ) ) ( not ( = ?auto_378563 ?auto_378565 ) ) ( not ( = ?auto_378563 ?auto_378566 ) ) ( not ( = ?auto_378563 ?auto_378567 ) ) ( not ( = ?auto_378563 ?auto_378568 ) ) ( not ( = ?auto_378563 ?auto_378569 ) ) ( not ( = ?auto_378563 ?auto_378570 ) ) ( not ( = ?auto_378563 ?auto_378571 ) ) ( not ( = ?auto_378563 ?auto_378572 ) ) ( not ( = ?auto_378563 ?auto_378573 ) ) ( not ( = ?auto_378564 ?auto_378565 ) ) ( not ( = ?auto_378564 ?auto_378566 ) ) ( not ( = ?auto_378564 ?auto_378567 ) ) ( not ( = ?auto_378564 ?auto_378568 ) ) ( not ( = ?auto_378564 ?auto_378569 ) ) ( not ( = ?auto_378564 ?auto_378570 ) ) ( not ( = ?auto_378564 ?auto_378571 ) ) ( not ( = ?auto_378564 ?auto_378572 ) ) ( not ( = ?auto_378564 ?auto_378573 ) ) ( not ( = ?auto_378565 ?auto_378566 ) ) ( not ( = ?auto_378565 ?auto_378567 ) ) ( not ( = ?auto_378565 ?auto_378568 ) ) ( not ( = ?auto_378565 ?auto_378569 ) ) ( not ( = ?auto_378565 ?auto_378570 ) ) ( not ( = ?auto_378565 ?auto_378571 ) ) ( not ( = ?auto_378565 ?auto_378572 ) ) ( not ( = ?auto_378565 ?auto_378573 ) ) ( not ( = ?auto_378566 ?auto_378567 ) ) ( not ( = ?auto_378566 ?auto_378568 ) ) ( not ( = ?auto_378566 ?auto_378569 ) ) ( not ( = ?auto_378566 ?auto_378570 ) ) ( not ( = ?auto_378566 ?auto_378571 ) ) ( not ( = ?auto_378566 ?auto_378572 ) ) ( not ( = ?auto_378566 ?auto_378573 ) ) ( not ( = ?auto_378567 ?auto_378568 ) ) ( not ( = ?auto_378567 ?auto_378569 ) ) ( not ( = ?auto_378567 ?auto_378570 ) ) ( not ( = ?auto_378567 ?auto_378571 ) ) ( not ( = ?auto_378567 ?auto_378572 ) ) ( not ( = ?auto_378567 ?auto_378573 ) ) ( not ( = ?auto_378568 ?auto_378569 ) ) ( not ( = ?auto_378568 ?auto_378570 ) ) ( not ( = ?auto_378568 ?auto_378571 ) ) ( not ( = ?auto_378568 ?auto_378572 ) ) ( not ( = ?auto_378568 ?auto_378573 ) ) ( not ( = ?auto_378569 ?auto_378570 ) ) ( not ( = ?auto_378569 ?auto_378571 ) ) ( not ( = ?auto_378569 ?auto_378572 ) ) ( not ( = ?auto_378569 ?auto_378573 ) ) ( not ( = ?auto_378570 ?auto_378571 ) ) ( not ( = ?auto_378570 ?auto_378572 ) ) ( not ( = ?auto_378570 ?auto_378573 ) ) ( not ( = ?auto_378571 ?auto_378572 ) ) ( not ( = ?auto_378571 ?auto_378573 ) ) ( not ( = ?auto_378572 ?auto_378573 ) ) ( ON ?auto_378571 ?auto_378572 ) ( CLEAR ?auto_378569 ) ( ON ?auto_378570 ?auto_378571 ) ( CLEAR ?auto_378570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_378561 ?auto_378562 ?auto_378563 ?auto_378564 ?auto_378565 ?auto_378566 ?auto_378567 ?auto_378568 ?auto_378569 ?auto_378570 )
      ( MAKE-12PILE ?auto_378561 ?auto_378562 ?auto_378563 ?auto_378564 ?auto_378565 ?auto_378566 ?auto_378567 ?auto_378568 ?auto_378569 ?auto_378570 ?auto_378571 ?auto_378572 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378586 - BLOCK
      ?auto_378587 - BLOCK
      ?auto_378588 - BLOCK
      ?auto_378589 - BLOCK
      ?auto_378590 - BLOCK
      ?auto_378591 - BLOCK
      ?auto_378592 - BLOCK
      ?auto_378593 - BLOCK
      ?auto_378594 - BLOCK
      ?auto_378595 - BLOCK
      ?auto_378596 - BLOCK
      ?auto_378597 - BLOCK
    )
    :vars
    (
      ?auto_378598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378597 ?auto_378598 ) ( ON-TABLE ?auto_378586 ) ( ON ?auto_378587 ?auto_378586 ) ( ON ?auto_378588 ?auto_378587 ) ( ON ?auto_378589 ?auto_378588 ) ( ON ?auto_378590 ?auto_378589 ) ( ON ?auto_378591 ?auto_378590 ) ( ON ?auto_378592 ?auto_378591 ) ( ON ?auto_378593 ?auto_378592 ) ( not ( = ?auto_378586 ?auto_378587 ) ) ( not ( = ?auto_378586 ?auto_378588 ) ) ( not ( = ?auto_378586 ?auto_378589 ) ) ( not ( = ?auto_378586 ?auto_378590 ) ) ( not ( = ?auto_378586 ?auto_378591 ) ) ( not ( = ?auto_378586 ?auto_378592 ) ) ( not ( = ?auto_378586 ?auto_378593 ) ) ( not ( = ?auto_378586 ?auto_378594 ) ) ( not ( = ?auto_378586 ?auto_378595 ) ) ( not ( = ?auto_378586 ?auto_378596 ) ) ( not ( = ?auto_378586 ?auto_378597 ) ) ( not ( = ?auto_378586 ?auto_378598 ) ) ( not ( = ?auto_378587 ?auto_378588 ) ) ( not ( = ?auto_378587 ?auto_378589 ) ) ( not ( = ?auto_378587 ?auto_378590 ) ) ( not ( = ?auto_378587 ?auto_378591 ) ) ( not ( = ?auto_378587 ?auto_378592 ) ) ( not ( = ?auto_378587 ?auto_378593 ) ) ( not ( = ?auto_378587 ?auto_378594 ) ) ( not ( = ?auto_378587 ?auto_378595 ) ) ( not ( = ?auto_378587 ?auto_378596 ) ) ( not ( = ?auto_378587 ?auto_378597 ) ) ( not ( = ?auto_378587 ?auto_378598 ) ) ( not ( = ?auto_378588 ?auto_378589 ) ) ( not ( = ?auto_378588 ?auto_378590 ) ) ( not ( = ?auto_378588 ?auto_378591 ) ) ( not ( = ?auto_378588 ?auto_378592 ) ) ( not ( = ?auto_378588 ?auto_378593 ) ) ( not ( = ?auto_378588 ?auto_378594 ) ) ( not ( = ?auto_378588 ?auto_378595 ) ) ( not ( = ?auto_378588 ?auto_378596 ) ) ( not ( = ?auto_378588 ?auto_378597 ) ) ( not ( = ?auto_378588 ?auto_378598 ) ) ( not ( = ?auto_378589 ?auto_378590 ) ) ( not ( = ?auto_378589 ?auto_378591 ) ) ( not ( = ?auto_378589 ?auto_378592 ) ) ( not ( = ?auto_378589 ?auto_378593 ) ) ( not ( = ?auto_378589 ?auto_378594 ) ) ( not ( = ?auto_378589 ?auto_378595 ) ) ( not ( = ?auto_378589 ?auto_378596 ) ) ( not ( = ?auto_378589 ?auto_378597 ) ) ( not ( = ?auto_378589 ?auto_378598 ) ) ( not ( = ?auto_378590 ?auto_378591 ) ) ( not ( = ?auto_378590 ?auto_378592 ) ) ( not ( = ?auto_378590 ?auto_378593 ) ) ( not ( = ?auto_378590 ?auto_378594 ) ) ( not ( = ?auto_378590 ?auto_378595 ) ) ( not ( = ?auto_378590 ?auto_378596 ) ) ( not ( = ?auto_378590 ?auto_378597 ) ) ( not ( = ?auto_378590 ?auto_378598 ) ) ( not ( = ?auto_378591 ?auto_378592 ) ) ( not ( = ?auto_378591 ?auto_378593 ) ) ( not ( = ?auto_378591 ?auto_378594 ) ) ( not ( = ?auto_378591 ?auto_378595 ) ) ( not ( = ?auto_378591 ?auto_378596 ) ) ( not ( = ?auto_378591 ?auto_378597 ) ) ( not ( = ?auto_378591 ?auto_378598 ) ) ( not ( = ?auto_378592 ?auto_378593 ) ) ( not ( = ?auto_378592 ?auto_378594 ) ) ( not ( = ?auto_378592 ?auto_378595 ) ) ( not ( = ?auto_378592 ?auto_378596 ) ) ( not ( = ?auto_378592 ?auto_378597 ) ) ( not ( = ?auto_378592 ?auto_378598 ) ) ( not ( = ?auto_378593 ?auto_378594 ) ) ( not ( = ?auto_378593 ?auto_378595 ) ) ( not ( = ?auto_378593 ?auto_378596 ) ) ( not ( = ?auto_378593 ?auto_378597 ) ) ( not ( = ?auto_378593 ?auto_378598 ) ) ( not ( = ?auto_378594 ?auto_378595 ) ) ( not ( = ?auto_378594 ?auto_378596 ) ) ( not ( = ?auto_378594 ?auto_378597 ) ) ( not ( = ?auto_378594 ?auto_378598 ) ) ( not ( = ?auto_378595 ?auto_378596 ) ) ( not ( = ?auto_378595 ?auto_378597 ) ) ( not ( = ?auto_378595 ?auto_378598 ) ) ( not ( = ?auto_378596 ?auto_378597 ) ) ( not ( = ?auto_378596 ?auto_378598 ) ) ( not ( = ?auto_378597 ?auto_378598 ) ) ( ON ?auto_378596 ?auto_378597 ) ( ON ?auto_378595 ?auto_378596 ) ( CLEAR ?auto_378593 ) ( ON ?auto_378594 ?auto_378595 ) ( CLEAR ?auto_378594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_378586 ?auto_378587 ?auto_378588 ?auto_378589 ?auto_378590 ?auto_378591 ?auto_378592 ?auto_378593 ?auto_378594 )
      ( MAKE-12PILE ?auto_378586 ?auto_378587 ?auto_378588 ?auto_378589 ?auto_378590 ?auto_378591 ?auto_378592 ?auto_378593 ?auto_378594 ?auto_378595 ?auto_378596 ?auto_378597 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378611 - BLOCK
      ?auto_378612 - BLOCK
      ?auto_378613 - BLOCK
      ?auto_378614 - BLOCK
      ?auto_378615 - BLOCK
      ?auto_378616 - BLOCK
      ?auto_378617 - BLOCK
      ?auto_378618 - BLOCK
      ?auto_378619 - BLOCK
      ?auto_378620 - BLOCK
      ?auto_378621 - BLOCK
      ?auto_378622 - BLOCK
    )
    :vars
    (
      ?auto_378623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378622 ?auto_378623 ) ( ON-TABLE ?auto_378611 ) ( ON ?auto_378612 ?auto_378611 ) ( ON ?auto_378613 ?auto_378612 ) ( ON ?auto_378614 ?auto_378613 ) ( ON ?auto_378615 ?auto_378614 ) ( ON ?auto_378616 ?auto_378615 ) ( ON ?auto_378617 ?auto_378616 ) ( ON ?auto_378618 ?auto_378617 ) ( not ( = ?auto_378611 ?auto_378612 ) ) ( not ( = ?auto_378611 ?auto_378613 ) ) ( not ( = ?auto_378611 ?auto_378614 ) ) ( not ( = ?auto_378611 ?auto_378615 ) ) ( not ( = ?auto_378611 ?auto_378616 ) ) ( not ( = ?auto_378611 ?auto_378617 ) ) ( not ( = ?auto_378611 ?auto_378618 ) ) ( not ( = ?auto_378611 ?auto_378619 ) ) ( not ( = ?auto_378611 ?auto_378620 ) ) ( not ( = ?auto_378611 ?auto_378621 ) ) ( not ( = ?auto_378611 ?auto_378622 ) ) ( not ( = ?auto_378611 ?auto_378623 ) ) ( not ( = ?auto_378612 ?auto_378613 ) ) ( not ( = ?auto_378612 ?auto_378614 ) ) ( not ( = ?auto_378612 ?auto_378615 ) ) ( not ( = ?auto_378612 ?auto_378616 ) ) ( not ( = ?auto_378612 ?auto_378617 ) ) ( not ( = ?auto_378612 ?auto_378618 ) ) ( not ( = ?auto_378612 ?auto_378619 ) ) ( not ( = ?auto_378612 ?auto_378620 ) ) ( not ( = ?auto_378612 ?auto_378621 ) ) ( not ( = ?auto_378612 ?auto_378622 ) ) ( not ( = ?auto_378612 ?auto_378623 ) ) ( not ( = ?auto_378613 ?auto_378614 ) ) ( not ( = ?auto_378613 ?auto_378615 ) ) ( not ( = ?auto_378613 ?auto_378616 ) ) ( not ( = ?auto_378613 ?auto_378617 ) ) ( not ( = ?auto_378613 ?auto_378618 ) ) ( not ( = ?auto_378613 ?auto_378619 ) ) ( not ( = ?auto_378613 ?auto_378620 ) ) ( not ( = ?auto_378613 ?auto_378621 ) ) ( not ( = ?auto_378613 ?auto_378622 ) ) ( not ( = ?auto_378613 ?auto_378623 ) ) ( not ( = ?auto_378614 ?auto_378615 ) ) ( not ( = ?auto_378614 ?auto_378616 ) ) ( not ( = ?auto_378614 ?auto_378617 ) ) ( not ( = ?auto_378614 ?auto_378618 ) ) ( not ( = ?auto_378614 ?auto_378619 ) ) ( not ( = ?auto_378614 ?auto_378620 ) ) ( not ( = ?auto_378614 ?auto_378621 ) ) ( not ( = ?auto_378614 ?auto_378622 ) ) ( not ( = ?auto_378614 ?auto_378623 ) ) ( not ( = ?auto_378615 ?auto_378616 ) ) ( not ( = ?auto_378615 ?auto_378617 ) ) ( not ( = ?auto_378615 ?auto_378618 ) ) ( not ( = ?auto_378615 ?auto_378619 ) ) ( not ( = ?auto_378615 ?auto_378620 ) ) ( not ( = ?auto_378615 ?auto_378621 ) ) ( not ( = ?auto_378615 ?auto_378622 ) ) ( not ( = ?auto_378615 ?auto_378623 ) ) ( not ( = ?auto_378616 ?auto_378617 ) ) ( not ( = ?auto_378616 ?auto_378618 ) ) ( not ( = ?auto_378616 ?auto_378619 ) ) ( not ( = ?auto_378616 ?auto_378620 ) ) ( not ( = ?auto_378616 ?auto_378621 ) ) ( not ( = ?auto_378616 ?auto_378622 ) ) ( not ( = ?auto_378616 ?auto_378623 ) ) ( not ( = ?auto_378617 ?auto_378618 ) ) ( not ( = ?auto_378617 ?auto_378619 ) ) ( not ( = ?auto_378617 ?auto_378620 ) ) ( not ( = ?auto_378617 ?auto_378621 ) ) ( not ( = ?auto_378617 ?auto_378622 ) ) ( not ( = ?auto_378617 ?auto_378623 ) ) ( not ( = ?auto_378618 ?auto_378619 ) ) ( not ( = ?auto_378618 ?auto_378620 ) ) ( not ( = ?auto_378618 ?auto_378621 ) ) ( not ( = ?auto_378618 ?auto_378622 ) ) ( not ( = ?auto_378618 ?auto_378623 ) ) ( not ( = ?auto_378619 ?auto_378620 ) ) ( not ( = ?auto_378619 ?auto_378621 ) ) ( not ( = ?auto_378619 ?auto_378622 ) ) ( not ( = ?auto_378619 ?auto_378623 ) ) ( not ( = ?auto_378620 ?auto_378621 ) ) ( not ( = ?auto_378620 ?auto_378622 ) ) ( not ( = ?auto_378620 ?auto_378623 ) ) ( not ( = ?auto_378621 ?auto_378622 ) ) ( not ( = ?auto_378621 ?auto_378623 ) ) ( not ( = ?auto_378622 ?auto_378623 ) ) ( ON ?auto_378621 ?auto_378622 ) ( ON ?auto_378620 ?auto_378621 ) ( CLEAR ?auto_378618 ) ( ON ?auto_378619 ?auto_378620 ) ( CLEAR ?auto_378619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_378611 ?auto_378612 ?auto_378613 ?auto_378614 ?auto_378615 ?auto_378616 ?auto_378617 ?auto_378618 ?auto_378619 )
      ( MAKE-12PILE ?auto_378611 ?auto_378612 ?auto_378613 ?auto_378614 ?auto_378615 ?auto_378616 ?auto_378617 ?auto_378618 ?auto_378619 ?auto_378620 ?auto_378621 ?auto_378622 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378636 - BLOCK
      ?auto_378637 - BLOCK
      ?auto_378638 - BLOCK
      ?auto_378639 - BLOCK
      ?auto_378640 - BLOCK
      ?auto_378641 - BLOCK
      ?auto_378642 - BLOCK
      ?auto_378643 - BLOCK
      ?auto_378644 - BLOCK
      ?auto_378645 - BLOCK
      ?auto_378646 - BLOCK
      ?auto_378647 - BLOCK
    )
    :vars
    (
      ?auto_378648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378647 ?auto_378648 ) ( ON-TABLE ?auto_378636 ) ( ON ?auto_378637 ?auto_378636 ) ( ON ?auto_378638 ?auto_378637 ) ( ON ?auto_378639 ?auto_378638 ) ( ON ?auto_378640 ?auto_378639 ) ( ON ?auto_378641 ?auto_378640 ) ( ON ?auto_378642 ?auto_378641 ) ( not ( = ?auto_378636 ?auto_378637 ) ) ( not ( = ?auto_378636 ?auto_378638 ) ) ( not ( = ?auto_378636 ?auto_378639 ) ) ( not ( = ?auto_378636 ?auto_378640 ) ) ( not ( = ?auto_378636 ?auto_378641 ) ) ( not ( = ?auto_378636 ?auto_378642 ) ) ( not ( = ?auto_378636 ?auto_378643 ) ) ( not ( = ?auto_378636 ?auto_378644 ) ) ( not ( = ?auto_378636 ?auto_378645 ) ) ( not ( = ?auto_378636 ?auto_378646 ) ) ( not ( = ?auto_378636 ?auto_378647 ) ) ( not ( = ?auto_378636 ?auto_378648 ) ) ( not ( = ?auto_378637 ?auto_378638 ) ) ( not ( = ?auto_378637 ?auto_378639 ) ) ( not ( = ?auto_378637 ?auto_378640 ) ) ( not ( = ?auto_378637 ?auto_378641 ) ) ( not ( = ?auto_378637 ?auto_378642 ) ) ( not ( = ?auto_378637 ?auto_378643 ) ) ( not ( = ?auto_378637 ?auto_378644 ) ) ( not ( = ?auto_378637 ?auto_378645 ) ) ( not ( = ?auto_378637 ?auto_378646 ) ) ( not ( = ?auto_378637 ?auto_378647 ) ) ( not ( = ?auto_378637 ?auto_378648 ) ) ( not ( = ?auto_378638 ?auto_378639 ) ) ( not ( = ?auto_378638 ?auto_378640 ) ) ( not ( = ?auto_378638 ?auto_378641 ) ) ( not ( = ?auto_378638 ?auto_378642 ) ) ( not ( = ?auto_378638 ?auto_378643 ) ) ( not ( = ?auto_378638 ?auto_378644 ) ) ( not ( = ?auto_378638 ?auto_378645 ) ) ( not ( = ?auto_378638 ?auto_378646 ) ) ( not ( = ?auto_378638 ?auto_378647 ) ) ( not ( = ?auto_378638 ?auto_378648 ) ) ( not ( = ?auto_378639 ?auto_378640 ) ) ( not ( = ?auto_378639 ?auto_378641 ) ) ( not ( = ?auto_378639 ?auto_378642 ) ) ( not ( = ?auto_378639 ?auto_378643 ) ) ( not ( = ?auto_378639 ?auto_378644 ) ) ( not ( = ?auto_378639 ?auto_378645 ) ) ( not ( = ?auto_378639 ?auto_378646 ) ) ( not ( = ?auto_378639 ?auto_378647 ) ) ( not ( = ?auto_378639 ?auto_378648 ) ) ( not ( = ?auto_378640 ?auto_378641 ) ) ( not ( = ?auto_378640 ?auto_378642 ) ) ( not ( = ?auto_378640 ?auto_378643 ) ) ( not ( = ?auto_378640 ?auto_378644 ) ) ( not ( = ?auto_378640 ?auto_378645 ) ) ( not ( = ?auto_378640 ?auto_378646 ) ) ( not ( = ?auto_378640 ?auto_378647 ) ) ( not ( = ?auto_378640 ?auto_378648 ) ) ( not ( = ?auto_378641 ?auto_378642 ) ) ( not ( = ?auto_378641 ?auto_378643 ) ) ( not ( = ?auto_378641 ?auto_378644 ) ) ( not ( = ?auto_378641 ?auto_378645 ) ) ( not ( = ?auto_378641 ?auto_378646 ) ) ( not ( = ?auto_378641 ?auto_378647 ) ) ( not ( = ?auto_378641 ?auto_378648 ) ) ( not ( = ?auto_378642 ?auto_378643 ) ) ( not ( = ?auto_378642 ?auto_378644 ) ) ( not ( = ?auto_378642 ?auto_378645 ) ) ( not ( = ?auto_378642 ?auto_378646 ) ) ( not ( = ?auto_378642 ?auto_378647 ) ) ( not ( = ?auto_378642 ?auto_378648 ) ) ( not ( = ?auto_378643 ?auto_378644 ) ) ( not ( = ?auto_378643 ?auto_378645 ) ) ( not ( = ?auto_378643 ?auto_378646 ) ) ( not ( = ?auto_378643 ?auto_378647 ) ) ( not ( = ?auto_378643 ?auto_378648 ) ) ( not ( = ?auto_378644 ?auto_378645 ) ) ( not ( = ?auto_378644 ?auto_378646 ) ) ( not ( = ?auto_378644 ?auto_378647 ) ) ( not ( = ?auto_378644 ?auto_378648 ) ) ( not ( = ?auto_378645 ?auto_378646 ) ) ( not ( = ?auto_378645 ?auto_378647 ) ) ( not ( = ?auto_378645 ?auto_378648 ) ) ( not ( = ?auto_378646 ?auto_378647 ) ) ( not ( = ?auto_378646 ?auto_378648 ) ) ( not ( = ?auto_378647 ?auto_378648 ) ) ( ON ?auto_378646 ?auto_378647 ) ( ON ?auto_378645 ?auto_378646 ) ( ON ?auto_378644 ?auto_378645 ) ( CLEAR ?auto_378642 ) ( ON ?auto_378643 ?auto_378644 ) ( CLEAR ?auto_378643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_378636 ?auto_378637 ?auto_378638 ?auto_378639 ?auto_378640 ?auto_378641 ?auto_378642 ?auto_378643 )
      ( MAKE-12PILE ?auto_378636 ?auto_378637 ?auto_378638 ?auto_378639 ?auto_378640 ?auto_378641 ?auto_378642 ?auto_378643 ?auto_378644 ?auto_378645 ?auto_378646 ?auto_378647 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378661 - BLOCK
      ?auto_378662 - BLOCK
      ?auto_378663 - BLOCK
      ?auto_378664 - BLOCK
      ?auto_378665 - BLOCK
      ?auto_378666 - BLOCK
      ?auto_378667 - BLOCK
      ?auto_378668 - BLOCK
      ?auto_378669 - BLOCK
      ?auto_378670 - BLOCK
      ?auto_378671 - BLOCK
      ?auto_378672 - BLOCK
    )
    :vars
    (
      ?auto_378673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378672 ?auto_378673 ) ( ON-TABLE ?auto_378661 ) ( ON ?auto_378662 ?auto_378661 ) ( ON ?auto_378663 ?auto_378662 ) ( ON ?auto_378664 ?auto_378663 ) ( ON ?auto_378665 ?auto_378664 ) ( ON ?auto_378666 ?auto_378665 ) ( ON ?auto_378667 ?auto_378666 ) ( not ( = ?auto_378661 ?auto_378662 ) ) ( not ( = ?auto_378661 ?auto_378663 ) ) ( not ( = ?auto_378661 ?auto_378664 ) ) ( not ( = ?auto_378661 ?auto_378665 ) ) ( not ( = ?auto_378661 ?auto_378666 ) ) ( not ( = ?auto_378661 ?auto_378667 ) ) ( not ( = ?auto_378661 ?auto_378668 ) ) ( not ( = ?auto_378661 ?auto_378669 ) ) ( not ( = ?auto_378661 ?auto_378670 ) ) ( not ( = ?auto_378661 ?auto_378671 ) ) ( not ( = ?auto_378661 ?auto_378672 ) ) ( not ( = ?auto_378661 ?auto_378673 ) ) ( not ( = ?auto_378662 ?auto_378663 ) ) ( not ( = ?auto_378662 ?auto_378664 ) ) ( not ( = ?auto_378662 ?auto_378665 ) ) ( not ( = ?auto_378662 ?auto_378666 ) ) ( not ( = ?auto_378662 ?auto_378667 ) ) ( not ( = ?auto_378662 ?auto_378668 ) ) ( not ( = ?auto_378662 ?auto_378669 ) ) ( not ( = ?auto_378662 ?auto_378670 ) ) ( not ( = ?auto_378662 ?auto_378671 ) ) ( not ( = ?auto_378662 ?auto_378672 ) ) ( not ( = ?auto_378662 ?auto_378673 ) ) ( not ( = ?auto_378663 ?auto_378664 ) ) ( not ( = ?auto_378663 ?auto_378665 ) ) ( not ( = ?auto_378663 ?auto_378666 ) ) ( not ( = ?auto_378663 ?auto_378667 ) ) ( not ( = ?auto_378663 ?auto_378668 ) ) ( not ( = ?auto_378663 ?auto_378669 ) ) ( not ( = ?auto_378663 ?auto_378670 ) ) ( not ( = ?auto_378663 ?auto_378671 ) ) ( not ( = ?auto_378663 ?auto_378672 ) ) ( not ( = ?auto_378663 ?auto_378673 ) ) ( not ( = ?auto_378664 ?auto_378665 ) ) ( not ( = ?auto_378664 ?auto_378666 ) ) ( not ( = ?auto_378664 ?auto_378667 ) ) ( not ( = ?auto_378664 ?auto_378668 ) ) ( not ( = ?auto_378664 ?auto_378669 ) ) ( not ( = ?auto_378664 ?auto_378670 ) ) ( not ( = ?auto_378664 ?auto_378671 ) ) ( not ( = ?auto_378664 ?auto_378672 ) ) ( not ( = ?auto_378664 ?auto_378673 ) ) ( not ( = ?auto_378665 ?auto_378666 ) ) ( not ( = ?auto_378665 ?auto_378667 ) ) ( not ( = ?auto_378665 ?auto_378668 ) ) ( not ( = ?auto_378665 ?auto_378669 ) ) ( not ( = ?auto_378665 ?auto_378670 ) ) ( not ( = ?auto_378665 ?auto_378671 ) ) ( not ( = ?auto_378665 ?auto_378672 ) ) ( not ( = ?auto_378665 ?auto_378673 ) ) ( not ( = ?auto_378666 ?auto_378667 ) ) ( not ( = ?auto_378666 ?auto_378668 ) ) ( not ( = ?auto_378666 ?auto_378669 ) ) ( not ( = ?auto_378666 ?auto_378670 ) ) ( not ( = ?auto_378666 ?auto_378671 ) ) ( not ( = ?auto_378666 ?auto_378672 ) ) ( not ( = ?auto_378666 ?auto_378673 ) ) ( not ( = ?auto_378667 ?auto_378668 ) ) ( not ( = ?auto_378667 ?auto_378669 ) ) ( not ( = ?auto_378667 ?auto_378670 ) ) ( not ( = ?auto_378667 ?auto_378671 ) ) ( not ( = ?auto_378667 ?auto_378672 ) ) ( not ( = ?auto_378667 ?auto_378673 ) ) ( not ( = ?auto_378668 ?auto_378669 ) ) ( not ( = ?auto_378668 ?auto_378670 ) ) ( not ( = ?auto_378668 ?auto_378671 ) ) ( not ( = ?auto_378668 ?auto_378672 ) ) ( not ( = ?auto_378668 ?auto_378673 ) ) ( not ( = ?auto_378669 ?auto_378670 ) ) ( not ( = ?auto_378669 ?auto_378671 ) ) ( not ( = ?auto_378669 ?auto_378672 ) ) ( not ( = ?auto_378669 ?auto_378673 ) ) ( not ( = ?auto_378670 ?auto_378671 ) ) ( not ( = ?auto_378670 ?auto_378672 ) ) ( not ( = ?auto_378670 ?auto_378673 ) ) ( not ( = ?auto_378671 ?auto_378672 ) ) ( not ( = ?auto_378671 ?auto_378673 ) ) ( not ( = ?auto_378672 ?auto_378673 ) ) ( ON ?auto_378671 ?auto_378672 ) ( ON ?auto_378670 ?auto_378671 ) ( ON ?auto_378669 ?auto_378670 ) ( CLEAR ?auto_378667 ) ( ON ?auto_378668 ?auto_378669 ) ( CLEAR ?auto_378668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_378661 ?auto_378662 ?auto_378663 ?auto_378664 ?auto_378665 ?auto_378666 ?auto_378667 ?auto_378668 )
      ( MAKE-12PILE ?auto_378661 ?auto_378662 ?auto_378663 ?auto_378664 ?auto_378665 ?auto_378666 ?auto_378667 ?auto_378668 ?auto_378669 ?auto_378670 ?auto_378671 ?auto_378672 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378686 - BLOCK
      ?auto_378687 - BLOCK
      ?auto_378688 - BLOCK
      ?auto_378689 - BLOCK
      ?auto_378690 - BLOCK
      ?auto_378691 - BLOCK
      ?auto_378692 - BLOCK
      ?auto_378693 - BLOCK
      ?auto_378694 - BLOCK
      ?auto_378695 - BLOCK
      ?auto_378696 - BLOCK
      ?auto_378697 - BLOCK
    )
    :vars
    (
      ?auto_378698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378697 ?auto_378698 ) ( ON-TABLE ?auto_378686 ) ( ON ?auto_378687 ?auto_378686 ) ( ON ?auto_378688 ?auto_378687 ) ( ON ?auto_378689 ?auto_378688 ) ( ON ?auto_378690 ?auto_378689 ) ( ON ?auto_378691 ?auto_378690 ) ( not ( = ?auto_378686 ?auto_378687 ) ) ( not ( = ?auto_378686 ?auto_378688 ) ) ( not ( = ?auto_378686 ?auto_378689 ) ) ( not ( = ?auto_378686 ?auto_378690 ) ) ( not ( = ?auto_378686 ?auto_378691 ) ) ( not ( = ?auto_378686 ?auto_378692 ) ) ( not ( = ?auto_378686 ?auto_378693 ) ) ( not ( = ?auto_378686 ?auto_378694 ) ) ( not ( = ?auto_378686 ?auto_378695 ) ) ( not ( = ?auto_378686 ?auto_378696 ) ) ( not ( = ?auto_378686 ?auto_378697 ) ) ( not ( = ?auto_378686 ?auto_378698 ) ) ( not ( = ?auto_378687 ?auto_378688 ) ) ( not ( = ?auto_378687 ?auto_378689 ) ) ( not ( = ?auto_378687 ?auto_378690 ) ) ( not ( = ?auto_378687 ?auto_378691 ) ) ( not ( = ?auto_378687 ?auto_378692 ) ) ( not ( = ?auto_378687 ?auto_378693 ) ) ( not ( = ?auto_378687 ?auto_378694 ) ) ( not ( = ?auto_378687 ?auto_378695 ) ) ( not ( = ?auto_378687 ?auto_378696 ) ) ( not ( = ?auto_378687 ?auto_378697 ) ) ( not ( = ?auto_378687 ?auto_378698 ) ) ( not ( = ?auto_378688 ?auto_378689 ) ) ( not ( = ?auto_378688 ?auto_378690 ) ) ( not ( = ?auto_378688 ?auto_378691 ) ) ( not ( = ?auto_378688 ?auto_378692 ) ) ( not ( = ?auto_378688 ?auto_378693 ) ) ( not ( = ?auto_378688 ?auto_378694 ) ) ( not ( = ?auto_378688 ?auto_378695 ) ) ( not ( = ?auto_378688 ?auto_378696 ) ) ( not ( = ?auto_378688 ?auto_378697 ) ) ( not ( = ?auto_378688 ?auto_378698 ) ) ( not ( = ?auto_378689 ?auto_378690 ) ) ( not ( = ?auto_378689 ?auto_378691 ) ) ( not ( = ?auto_378689 ?auto_378692 ) ) ( not ( = ?auto_378689 ?auto_378693 ) ) ( not ( = ?auto_378689 ?auto_378694 ) ) ( not ( = ?auto_378689 ?auto_378695 ) ) ( not ( = ?auto_378689 ?auto_378696 ) ) ( not ( = ?auto_378689 ?auto_378697 ) ) ( not ( = ?auto_378689 ?auto_378698 ) ) ( not ( = ?auto_378690 ?auto_378691 ) ) ( not ( = ?auto_378690 ?auto_378692 ) ) ( not ( = ?auto_378690 ?auto_378693 ) ) ( not ( = ?auto_378690 ?auto_378694 ) ) ( not ( = ?auto_378690 ?auto_378695 ) ) ( not ( = ?auto_378690 ?auto_378696 ) ) ( not ( = ?auto_378690 ?auto_378697 ) ) ( not ( = ?auto_378690 ?auto_378698 ) ) ( not ( = ?auto_378691 ?auto_378692 ) ) ( not ( = ?auto_378691 ?auto_378693 ) ) ( not ( = ?auto_378691 ?auto_378694 ) ) ( not ( = ?auto_378691 ?auto_378695 ) ) ( not ( = ?auto_378691 ?auto_378696 ) ) ( not ( = ?auto_378691 ?auto_378697 ) ) ( not ( = ?auto_378691 ?auto_378698 ) ) ( not ( = ?auto_378692 ?auto_378693 ) ) ( not ( = ?auto_378692 ?auto_378694 ) ) ( not ( = ?auto_378692 ?auto_378695 ) ) ( not ( = ?auto_378692 ?auto_378696 ) ) ( not ( = ?auto_378692 ?auto_378697 ) ) ( not ( = ?auto_378692 ?auto_378698 ) ) ( not ( = ?auto_378693 ?auto_378694 ) ) ( not ( = ?auto_378693 ?auto_378695 ) ) ( not ( = ?auto_378693 ?auto_378696 ) ) ( not ( = ?auto_378693 ?auto_378697 ) ) ( not ( = ?auto_378693 ?auto_378698 ) ) ( not ( = ?auto_378694 ?auto_378695 ) ) ( not ( = ?auto_378694 ?auto_378696 ) ) ( not ( = ?auto_378694 ?auto_378697 ) ) ( not ( = ?auto_378694 ?auto_378698 ) ) ( not ( = ?auto_378695 ?auto_378696 ) ) ( not ( = ?auto_378695 ?auto_378697 ) ) ( not ( = ?auto_378695 ?auto_378698 ) ) ( not ( = ?auto_378696 ?auto_378697 ) ) ( not ( = ?auto_378696 ?auto_378698 ) ) ( not ( = ?auto_378697 ?auto_378698 ) ) ( ON ?auto_378696 ?auto_378697 ) ( ON ?auto_378695 ?auto_378696 ) ( ON ?auto_378694 ?auto_378695 ) ( ON ?auto_378693 ?auto_378694 ) ( CLEAR ?auto_378691 ) ( ON ?auto_378692 ?auto_378693 ) ( CLEAR ?auto_378692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_378686 ?auto_378687 ?auto_378688 ?auto_378689 ?auto_378690 ?auto_378691 ?auto_378692 )
      ( MAKE-12PILE ?auto_378686 ?auto_378687 ?auto_378688 ?auto_378689 ?auto_378690 ?auto_378691 ?auto_378692 ?auto_378693 ?auto_378694 ?auto_378695 ?auto_378696 ?auto_378697 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378711 - BLOCK
      ?auto_378712 - BLOCK
      ?auto_378713 - BLOCK
      ?auto_378714 - BLOCK
      ?auto_378715 - BLOCK
      ?auto_378716 - BLOCK
      ?auto_378717 - BLOCK
      ?auto_378718 - BLOCK
      ?auto_378719 - BLOCK
      ?auto_378720 - BLOCK
      ?auto_378721 - BLOCK
      ?auto_378722 - BLOCK
    )
    :vars
    (
      ?auto_378723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378722 ?auto_378723 ) ( ON-TABLE ?auto_378711 ) ( ON ?auto_378712 ?auto_378711 ) ( ON ?auto_378713 ?auto_378712 ) ( ON ?auto_378714 ?auto_378713 ) ( ON ?auto_378715 ?auto_378714 ) ( ON ?auto_378716 ?auto_378715 ) ( not ( = ?auto_378711 ?auto_378712 ) ) ( not ( = ?auto_378711 ?auto_378713 ) ) ( not ( = ?auto_378711 ?auto_378714 ) ) ( not ( = ?auto_378711 ?auto_378715 ) ) ( not ( = ?auto_378711 ?auto_378716 ) ) ( not ( = ?auto_378711 ?auto_378717 ) ) ( not ( = ?auto_378711 ?auto_378718 ) ) ( not ( = ?auto_378711 ?auto_378719 ) ) ( not ( = ?auto_378711 ?auto_378720 ) ) ( not ( = ?auto_378711 ?auto_378721 ) ) ( not ( = ?auto_378711 ?auto_378722 ) ) ( not ( = ?auto_378711 ?auto_378723 ) ) ( not ( = ?auto_378712 ?auto_378713 ) ) ( not ( = ?auto_378712 ?auto_378714 ) ) ( not ( = ?auto_378712 ?auto_378715 ) ) ( not ( = ?auto_378712 ?auto_378716 ) ) ( not ( = ?auto_378712 ?auto_378717 ) ) ( not ( = ?auto_378712 ?auto_378718 ) ) ( not ( = ?auto_378712 ?auto_378719 ) ) ( not ( = ?auto_378712 ?auto_378720 ) ) ( not ( = ?auto_378712 ?auto_378721 ) ) ( not ( = ?auto_378712 ?auto_378722 ) ) ( not ( = ?auto_378712 ?auto_378723 ) ) ( not ( = ?auto_378713 ?auto_378714 ) ) ( not ( = ?auto_378713 ?auto_378715 ) ) ( not ( = ?auto_378713 ?auto_378716 ) ) ( not ( = ?auto_378713 ?auto_378717 ) ) ( not ( = ?auto_378713 ?auto_378718 ) ) ( not ( = ?auto_378713 ?auto_378719 ) ) ( not ( = ?auto_378713 ?auto_378720 ) ) ( not ( = ?auto_378713 ?auto_378721 ) ) ( not ( = ?auto_378713 ?auto_378722 ) ) ( not ( = ?auto_378713 ?auto_378723 ) ) ( not ( = ?auto_378714 ?auto_378715 ) ) ( not ( = ?auto_378714 ?auto_378716 ) ) ( not ( = ?auto_378714 ?auto_378717 ) ) ( not ( = ?auto_378714 ?auto_378718 ) ) ( not ( = ?auto_378714 ?auto_378719 ) ) ( not ( = ?auto_378714 ?auto_378720 ) ) ( not ( = ?auto_378714 ?auto_378721 ) ) ( not ( = ?auto_378714 ?auto_378722 ) ) ( not ( = ?auto_378714 ?auto_378723 ) ) ( not ( = ?auto_378715 ?auto_378716 ) ) ( not ( = ?auto_378715 ?auto_378717 ) ) ( not ( = ?auto_378715 ?auto_378718 ) ) ( not ( = ?auto_378715 ?auto_378719 ) ) ( not ( = ?auto_378715 ?auto_378720 ) ) ( not ( = ?auto_378715 ?auto_378721 ) ) ( not ( = ?auto_378715 ?auto_378722 ) ) ( not ( = ?auto_378715 ?auto_378723 ) ) ( not ( = ?auto_378716 ?auto_378717 ) ) ( not ( = ?auto_378716 ?auto_378718 ) ) ( not ( = ?auto_378716 ?auto_378719 ) ) ( not ( = ?auto_378716 ?auto_378720 ) ) ( not ( = ?auto_378716 ?auto_378721 ) ) ( not ( = ?auto_378716 ?auto_378722 ) ) ( not ( = ?auto_378716 ?auto_378723 ) ) ( not ( = ?auto_378717 ?auto_378718 ) ) ( not ( = ?auto_378717 ?auto_378719 ) ) ( not ( = ?auto_378717 ?auto_378720 ) ) ( not ( = ?auto_378717 ?auto_378721 ) ) ( not ( = ?auto_378717 ?auto_378722 ) ) ( not ( = ?auto_378717 ?auto_378723 ) ) ( not ( = ?auto_378718 ?auto_378719 ) ) ( not ( = ?auto_378718 ?auto_378720 ) ) ( not ( = ?auto_378718 ?auto_378721 ) ) ( not ( = ?auto_378718 ?auto_378722 ) ) ( not ( = ?auto_378718 ?auto_378723 ) ) ( not ( = ?auto_378719 ?auto_378720 ) ) ( not ( = ?auto_378719 ?auto_378721 ) ) ( not ( = ?auto_378719 ?auto_378722 ) ) ( not ( = ?auto_378719 ?auto_378723 ) ) ( not ( = ?auto_378720 ?auto_378721 ) ) ( not ( = ?auto_378720 ?auto_378722 ) ) ( not ( = ?auto_378720 ?auto_378723 ) ) ( not ( = ?auto_378721 ?auto_378722 ) ) ( not ( = ?auto_378721 ?auto_378723 ) ) ( not ( = ?auto_378722 ?auto_378723 ) ) ( ON ?auto_378721 ?auto_378722 ) ( ON ?auto_378720 ?auto_378721 ) ( ON ?auto_378719 ?auto_378720 ) ( ON ?auto_378718 ?auto_378719 ) ( CLEAR ?auto_378716 ) ( ON ?auto_378717 ?auto_378718 ) ( CLEAR ?auto_378717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_378711 ?auto_378712 ?auto_378713 ?auto_378714 ?auto_378715 ?auto_378716 ?auto_378717 )
      ( MAKE-12PILE ?auto_378711 ?auto_378712 ?auto_378713 ?auto_378714 ?auto_378715 ?auto_378716 ?auto_378717 ?auto_378718 ?auto_378719 ?auto_378720 ?auto_378721 ?auto_378722 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378736 - BLOCK
      ?auto_378737 - BLOCK
      ?auto_378738 - BLOCK
      ?auto_378739 - BLOCK
      ?auto_378740 - BLOCK
      ?auto_378741 - BLOCK
      ?auto_378742 - BLOCK
      ?auto_378743 - BLOCK
      ?auto_378744 - BLOCK
      ?auto_378745 - BLOCK
      ?auto_378746 - BLOCK
      ?auto_378747 - BLOCK
    )
    :vars
    (
      ?auto_378748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378747 ?auto_378748 ) ( ON-TABLE ?auto_378736 ) ( ON ?auto_378737 ?auto_378736 ) ( ON ?auto_378738 ?auto_378737 ) ( ON ?auto_378739 ?auto_378738 ) ( ON ?auto_378740 ?auto_378739 ) ( not ( = ?auto_378736 ?auto_378737 ) ) ( not ( = ?auto_378736 ?auto_378738 ) ) ( not ( = ?auto_378736 ?auto_378739 ) ) ( not ( = ?auto_378736 ?auto_378740 ) ) ( not ( = ?auto_378736 ?auto_378741 ) ) ( not ( = ?auto_378736 ?auto_378742 ) ) ( not ( = ?auto_378736 ?auto_378743 ) ) ( not ( = ?auto_378736 ?auto_378744 ) ) ( not ( = ?auto_378736 ?auto_378745 ) ) ( not ( = ?auto_378736 ?auto_378746 ) ) ( not ( = ?auto_378736 ?auto_378747 ) ) ( not ( = ?auto_378736 ?auto_378748 ) ) ( not ( = ?auto_378737 ?auto_378738 ) ) ( not ( = ?auto_378737 ?auto_378739 ) ) ( not ( = ?auto_378737 ?auto_378740 ) ) ( not ( = ?auto_378737 ?auto_378741 ) ) ( not ( = ?auto_378737 ?auto_378742 ) ) ( not ( = ?auto_378737 ?auto_378743 ) ) ( not ( = ?auto_378737 ?auto_378744 ) ) ( not ( = ?auto_378737 ?auto_378745 ) ) ( not ( = ?auto_378737 ?auto_378746 ) ) ( not ( = ?auto_378737 ?auto_378747 ) ) ( not ( = ?auto_378737 ?auto_378748 ) ) ( not ( = ?auto_378738 ?auto_378739 ) ) ( not ( = ?auto_378738 ?auto_378740 ) ) ( not ( = ?auto_378738 ?auto_378741 ) ) ( not ( = ?auto_378738 ?auto_378742 ) ) ( not ( = ?auto_378738 ?auto_378743 ) ) ( not ( = ?auto_378738 ?auto_378744 ) ) ( not ( = ?auto_378738 ?auto_378745 ) ) ( not ( = ?auto_378738 ?auto_378746 ) ) ( not ( = ?auto_378738 ?auto_378747 ) ) ( not ( = ?auto_378738 ?auto_378748 ) ) ( not ( = ?auto_378739 ?auto_378740 ) ) ( not ( = ?auto_378739 ?auto_378741 ) ) ( not ( = ?auto_378739 ?auto_378742 ) ) ( not ( = ?auto_378739 ?auto_378743 ) ) ( not ( = ?auto_378739 ?auto_378744 ) ) ( not ( = ?auto_378739 ?auto_378745 ) ) ( not ( = ?auto_378739 ?auto_378746 ) ) ( not ( = ?auto_378739 ?auto_378747 ) ) ( not ( = ?auto_378739 ?auto_378748 ) ) ( not ( = ?auto_378740 ?auto_378741 ) ) ( not ( = ?auto_378740 ?auto_378742 ) ) ( not ( = ?auto_378740 ?auto_378743 ) ) ( not ( = ?auto_378740 ?auto_378744 ) ) ( not ( = ?auto_378740 ?auto_378745 ) ) ( not ( = ?auto_378740 ?auto_378746 ) ) ( not ( = ?auto_378740 ?auto_378747 ) ) ( not ( = ?auto_378740 ?auto_378748 ) ) ( not ( = ?auto_378741 ?auto_378742 ) ) ( not ( = ?auto_378741 ?auto_378743 ) ) ( not ( = ?auto_378741 ?auto_378744 ) ) ( not ( = ?auto_378741 ?auto_378745 ) ) ( not ( = ?auto_378741 ?auto_378746 ) ) ( not ( = ?auto_378741 ?auto_378747 ) ) ( not ( = ?auto_378741 ?auto_378748 ) ) ( not ( = ?auto_378742 ?auto_378743 ) ) ( not ( = ?auto_378742 ?auto_378744 ) ) ( not ( = ?auto_378742 ?auto_378745 ) ) ( not ( = ?auto_378742 ?auto_378746 ) ) ( not ( = ?auto_378742 ?auto_378747 ) ) ( not ( = ?auto_378742 ?auto_378748 ) ) ( not ( = ?auto_378743 ?auto_378744 ) ) ( not ( = ?auto_378743 ?auto_378745 ) ) ( not ( = ?auto_378743 ?auto_378746 ) ) ( not ( = ?auto_378743 ?auto_378747 ) ) ( not ( = ?auto_378743 ?auto_378748 ) ) ( not ( = ?auto_378744 ?auto_378745 ) ) ( not ( = ?auto_378744 ?auto_378746 ) ) ( not ( = ?auto_378744 ?auto_378747 ) ) ( not ( = ?auto_378744 ?auto_378748 ) ) ( not ( = ?auto_378745 ?auto_378746 ) ) ( not ( = ?auto_378745 ?auto_378747 ) ) ( not ( = ?auto_378745 ?auto_378748 ) ) ( not ( = ?auto_378746 ?auto_378747 ) ) ( not ( = ?auto_378746 ?auto_378748 ) ) ( not ( = ?auto_378747 ?auto_378748 ) ) ( ON ?auto_378746 ?auto_378747 ) ( ON ?auto_378745 ?auto_378746 ) ( ON ?auto_378744 ?auto_378745 ) ( ON ?auto_378743 ?auto_378744 ) ( ON ?auto_378742 ?auto_378743 ) ( CLEAR ?auto_378740 ) ( ON ?auto_378741 ?auto_378742 ) ( CLEAR ?auto_378741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_378736 ?auto_378737 ?auto_378738 ?auto_378739 ?auto_378740 ?auto_378741 )
      ( MAKE-12PILE ?auto_378736 ?auto_378737 ?auto_378738 ?auto_378739 ?auto_378740 ?auto_378741 ?auto_378742 ?auto_378743 ?auto_378744 ?auto_378745 ?auto_378746 ?auto_378747 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378761 - BLOCK
      ?auto_378762 - BLOCK
      ?auto_378763 - BLOCK
      ?auto_378764 - BLOCK
      ?auto_378765 - BLOCK
      ?auto_378766 - BLOCK
      ?auto_378767 - BLOCK
      ?auto_378768 - BLOCK
      ?auto_378769 - BLOCK
      ?auto_378770 - BLOCK
      ?auto_378771 - BLOCK
      ?auto_378772 - BLOCK
    )
    :vars
    (
      ?auto_378773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378772 ?auto_378773 ) ( ON-TABLE ?auto_378761 ) ( ON ?auto_378762 ?auto_378761 ) ( ON ?auto_378763 ?auto_378762 ) ( ON ?auto_378764 ?auto_378763 ) ( ON ?auto_378765 ?auto_378764 ) ( not ( = ?auto_378761 ?auto_378762 ) ) ( not ( = ?auto_378761 ?auto_378763 ) ) ( not ( = ?auto_378761 ?auto_378764 ) ) ( not ( = ?auto_378761 ?auto_378765 ) ) ( not ( = ?auto_378761 ?auto_378766 ) ) ( not ( = ?auto_378761 ?auto_378767 ) ) ( not ( = ?auto_378761 ?auto_378768 ) ) ( not ( = ?auto_378761 ?auto_378769 ) ) ( not ( = ?auto_378761 ?auto_378770 ) ) ( not ( = ?auto_378761 ?auto_378771 ) ) ( not ( = ?auto_378761 ?auto_378772 ) ) ( not ( = ?auto_378761 ?auto_378773 ) ) ( not ( = ?auto_378762 ?auto_378763 ) ) ( not ( = ?auto_378762 ?auto_378764 ) ) ( not ( = ?auto_378762 ?auto_378765 ) ) ( not ( = ?auto_378762 ?auto_378766 ) ) ( not ( = ?auto_378762 ?auto_378767 ) ) ( not ( = ?auto_378762 ?auto_378768 ) ) ( not ( = ?auto_378762 ?auto_378769 ) ) ( not ( = ?auto_378762 ?auto_378770 ) ) ( not ( = ?auto_378762 ?auto_378771 ) ) ( not ( = ?auto_378762 ?auto_378772 ) ) ( not ( = ?auto_378762 ?auto_378773 ) ) ( not ( = ?auto_378763 ?auto_378764 ) ) ( not ( = ?auto_378763 ?auto_378765 ) ) ( not ( = ?auto_378763 ?auto_378766 ) ) ( not ( = ?auto_378763 ?auto_378767 ) ) ( not ( = ?auto_378763 ?auto_378768 ) ) ( not ( = ?auto_378763 ?auto_378769 ) ) ( not ( = ?auto_378763 ?auto_378770 ) ) ( not ( = ?auto_378763 ?auto_378771 ) ) ( not ( = ?auto_378763 ?auto_378772 ) ) ( not ( = ?auto_378763 ?auto_378773 ) ) ( not ( = ?auto_378764 ?auto_378765 ) ) ( not ( = ?auto_378764 ?auto_378766 ) ) ( not ( = ?auto_378764 ?auto_378767 ) ) ( not ( = ?auto_378764 ?auto_378768 ) ) ( not ( = ?auto_378764 ?auto_378769 ) ) ( not ( = ?auto_378764 ?auto_378770 ) ) ( not ( = ?auto_378764 ?auto_378771 ) ) ( not ( = ?auto_378764 ?auto_378772 ) ) ( not ( = ?auto_378764 ?auto_378773 ) ) ( not ( = ?auto_378765 ?auto_378766 ) ) ( not ( = ?auto_378765 ?auto_378767 ) ) ( not ( = ?auto_378765 ?auto_378768 ) ) ( not ( = ?auto_378765 ?auto_378769 ) ) ( not ( = ?auto_378765 ?auto_378770 ) ) ( not ( = ?auto_378765 ?auto_378771 ) ) ( not ( = ?auto_378765 ?auto_378772 ) ) ( not ( = ?auto_378765 ?auto_378773 ) ) ( not ( = ?auto_378766 ?auto_378767 ) ) ( not ( = ?auto_378766 ?auto_378768 ) ) ( not ( = ?auto_378766 ?auto_378769 ) ) ( not ( = ?auto_378766 ?auto_378770 ) ) ( not ( = ?auto_378766 ?auto_378771 ) ) ( not ( = ?auto_378766 ?auto_378772 ) ) ( not ( = ?auto_378766 ?auto_378773 ) ) ( not ( = ?auto_378767 ?auto_378768 ) ) ( not ( = ?auto_378767 ?auto_378769 ) ) ( not ( = ?auto_378767 ?auto_378770 ) ) ( not ( = ?auto_378767 ?auto_378771 ) ) ( not ( = ?auto_378767 ?auto_378772 ) ) ( not ( = ?auto_378767 ?auto_378773 ) ) ( not ( = ?auto_378768 ?auto_378769 ) ) ( not ( = ?auto_378768 ?auto_378770 ) ) ( not ( = ?auto_378768 ?auto_378771 ) ) ( not ( = ?auto_378768 ?auto_378772 ) ) ( not ( = ?auto_378768 ?auto_378773 ) ) ( not ( = ?auto_378769 ?auto_378770 ) ) ( not ( = ?auto_378769 ?auto_378771 ) ) ( not ( = ?auto_378769 ?auto_378772 ) ) ( not ( = ?auto_378769 ?auto_378773 ) ) ( not ( = ?auto_378770 ?auto_378771 ) ) ( not ( = ?auto_378770 ?auto_378772 ) ) ( not ( = ?auto_378770 ?auto_378773 ) ) ( not ( = ?auto_378771 ?auto_378772 ) ) ( not ( = ?auto_378771 ?auto_378773 ) ) ( not ( = ?auto_378772 ?auto_378773 ) ) ( ON ?auto_378771 ?auto_378772 ) ( ON ?auto_378770 ?auto_378771 ) ( ON ?auto_378769 ?auto_378770 ) ( ON ?auto_378768 ?auto_378769 ) ( ON ?auto_378767 ?auto_378768 ) ( CLEAR ?auto_378765 ) ( ON ?auto_378766 ?auto_378767 ) ( CLEAR ?auto_378766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_378761 ?auto_378762 ?auto_378763 ?auto_378764 ?auto_378765 ?auto_378766 )
      ( MAKE-12PILE ?auto_378761 ?auto_378762 ?auto_378763 ?auto_378764 ?auto_378765 ?auto_378766 ?auto_378767 ?auto_378768 ?auto_378769 ?auto_378770 ?auto_378771 ?auto_378772 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378786 - BLOCK
      ?auto_378787 - BLOCK
      ?auto_378788 - BLOCK
      ?auto_378789 - BLOCK
      ?auto_378790 - BLOCK
      ?auto_378791 - BLOCK
      ?auto_378792 - BLOCK
      ?auto_378793 - BLOCK
      ?auto_378794 - BLOCK
      ?auto_378795 - BLOCK
      ?auto_378796 - BLOCK
      ?auto_378797 - BLOCK
    )
    :vars
    (
      ?auto_378798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378797 ?auto_378798 ) ( ON-TABLE ?auto_378786 ) ( ON ?auto_378787 ?auto_378786 ) ( ON ?auto_378788 ?auto_378787 ) ( ON ?auto_378789 ?auto_378788 ) ( not ( = ?auto_378786 ?auto_378787 ) ) ( not ( = ?auto_378786 ?auto_378788 ) ) ( not ( = ?auto_378786 ?auto_378789 ) ) ( not ( = ?auto_378786 ?auto_378790 ) ) ( not ( = ?auto_378786 ?auto_378791 ) ) ( not ( = ?auto_378786 ?auto_378792 ) ) ( not ( = ?auto_378786 ?auto_378793 ) ) ( not ( = ?auto_378786 ?auto_378794 ) ) ( not ( = ?auto_378786 ?auto_378795 ) ) ( not ( = ?auto_378786 ?auto_378796 ) ) ( not ( = ?auto_378786 ?auto_378797 ) ) ( not ( = ?auto_378786 ?auto_378798 ) ) ( not ( = ?auto_378787 ?auto_378788 ) ) ( not ( = ?auto_378787 ?auto_378789 ) ) ( not ( = ?auto_378787 ?auto_378790 ) ) ( not ( = ?auto_378787 ?auto_378791 ) ) ( not ( = ?auto_378787 ?auto_378792 ) ) ( not ( = ?auto_378787 ?auto_378793 ) ) ( not ( = ?auto_378787 ?auto_378794 ) ) ( not ( = ?auto_378787 ?auto_378795 ) ) ( not ( = ?auto_378787 ?auto_378796 ) ) ( not ( = ?auto_378787 ?auto_378797 ) ) ( not ( = ?auto_378787 ?auto_378798 ) ) ( not ( = ?auto_378788 ?auto_378789 ) ) ( not ( = ?auto_378788 ?auto_378790 ) ) ( not ( = ?auto_378788 ?auto_378791 ) ) ( not ( = ?auto_378788 ?auto_378792 ) ) ( not ( = ?auto_378788 ?auto_378793 ) ) ( not ( = ?auto_378788 ?auto_378794 ) ) ( not ( = ?auto_378788 ?auto_378795 ) ) ( not ( = ?auto_378788 ?auto_378796 ) ) ( not ( = ?auto_378788 ?auto_378797 ) ) ( not ( = ?auto_378788 ?auto_378798 ) ) ( not ( = ?auto_378789 ?auto_378790 ) ) ( not ( = ?auto_378789 ?auto_378791 ) ) ( not ( = ?auto_378789 ?auto_378792 ) ) ( not ( = ?auto_378789 ?auto_378793 ) ) ( not ( = ?auto_378789 ?auto_378794 ) ) ( not ( = ?auto_378789 ?auto_378795 ) ) ( not ( = ?auto_378789 ?auto_378796 ) ) ( not ( = ?auto_378789 ?auto_378797 ) ) ( not ( = ?auto_378789 ?auto_378798 ) ) ( not ( = ?auto_378790 ?auto_378791 ) ) ( not ( = ?auto_378790 ?auto_378792 ) ) ( not ( = ?auto_378790 ?auto_378793 ) ) ( not ( = ?auto_378790 ?auto_378794 ) ) ( not ( = ?auto_378790 ?auto_378795 ) ) ( not ( = ?auto_378790 ?auto_378796 ) ) ( not ( = ?auto_378790 ?auto_378797 ) ) ( not ( = ?auto_378790 ?auto_378798 ) ) ( not ( = ?auto_378791 ?auto_378792 ) ) ( not ( = ?auto_378791 ?auto_378793 ) ) ( not ( = ?auto_378791 ?auto_378794 ) ) ( not ( = ?auto_378791 ?auto_378795 ) ) ( not ( = ?auto_378791 ?auto_378796 ) ) ( not ( = ?auto_378791 ?auto_378797 ) ) ( not ( = ?auto_378791 ?auto_378798 ) ) ( not ( = ?auto_378792 ?auto_378793 ) ) ( not ( = ?auto_378792 ?auto_378794 ) ) ( not ( = ?auto_378792 ?auto_378795 ) ) ( not ( = ?auto_378792 ?auto_378796 ) ) ( not ( = ?auto_378792 ?auto_378797 ) ) ( not ( = ?auto_378792 ?auto_378798 ) ) ( not ( = ?auto_378793 ?auto_378794 ) ) ( not ( = ?auto_378793 ?auto_378795 ) ) ( not ( = ?auto_378793 ?auto_378796 ) ) ( not ( = ?auto_378793 ?auto_378797 ) ) ( not ( = ?auto_378793 ?auto_378798 ) ) ( not ( = ?auto_378794 ?auto_378795 ) ) ( not ( = ?auto_378794 ?auto_378796 ) ) ( not ( = ?auto_378794 ?auto_378797 ) ) ( not ( = ?auto_378794 ?auto_378798 ) ) ( not ( = ?auto_378795 ?auto_378796 ) ) ( not ( = ?auto_378795 ?auto_378797 ) ) ( not ( = ?auto_378795 ?auto_378798 ) ) ( not ( = ?auto_378796 ?auto_378797 ) ) ( not ( = ?auto_378796 ?auto_378798 ) ) ( not ( = ?auto_378797 ?auto_378798 ) ) ( ON ?auto_378796 ?auto_378797 ) ( ON ?auto_378795 ?auto_378796 ) ( ON ?auto_378794 ?auto_378795 ) ( ON ?auto_378793 ?auto_378794 ) ( ON ?auto_378792 ?auto_378793 ) ( ON ?auto_378791 ?auto_378792 ) ( CLEAR ?auto_378789 ) ( ON ?auto_378790 ?auto_378791 ) ( CLEAR ?auto_378790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_378786 ?auto_378787 ?auto_378788 ?auto_378789 ?auto_378790 )
      ( MAKE-12PILE ?auto_378786 ?auto_378787 ?auto_378788 ?auto_378789 ?auto_378790 ?auto_378791 ?auto_378792 ?auto_378793 ?auto_378794 ?auto_378795 ?auto_378796 ?auto_378797 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378811 - BLOCK
      ?auto_378812 - BLOCK
      ?auto_378813 - BLOCK
      ?auto_378814 - BLOCK
      ?auto_378815 - BLOCK
      ?auto_378816 - BLOCK
      ?auto_378817 - BLOCK
      ?auto_378818 - BLOCK
      ?auto_378819 - BLOCK
      ?auto_378820 - BLOCK
      ?auto_378821 - BLOCK
      ?auto_378822 - BLOCK
    )
    :vars
    (
      ?auto_378823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378822 ?auto_378823 ) ( ON-TABLE ?auto_378811 ) ( ON ?auto_378812 ?auto_378811 ) ( ON ?auto_378813 ?auto_378812 ) ( ON ?auto_378814 ?auto_378813 ) ( not ( = ?auto_378811 ?auto_378812 ) ) ( not ( = ?auto_378811 ?auto_378813 ) ) ( not ( = ?auto_378811 ?auto_378814 ) ) ( not ( = ?auto_378811 ?auto_378815 ) ) ( not ( = ?auto_378811 ?auto_378816 ) ) ( not ( = ?auto_378811 ?auto_378817 ) ) ( not ( = ?auto_378811 ?auto_378818 ) ) ( not ( = ?auto_378811 ?auto_378819 ) ) ( not ( = ?auto_378811 ?auto_378820 ) ) ( not ( = ?auto_378811 ?auto_378821 ) ) ( not ( = ?auto_378811 ?auto_378822 ) ) ( not ( = ?auto_378811 ?auto_378823 ) ) ( not ( = ?auto_378812 ?auto_378813 ) ) ( not ( = ?auto_378812 ?auto_378814 ) ) ( not ( = ?auto_378812 ?auto_378815 ) ) ( not ( = ?auto_378812 ?auto_378816 ) ) ( not ( = ?auto_378812 ?auto_378817 ) ) ( not ( = ?auto_378812 ?auto_378818 ) ) ( not ( = ?auto_378812 ?auto_378819 ) ) ( not ( = ?auto_378812 ?auto_378820 ) ) ( not ( = ?auto_378812 ?auto_378821 ) ) ( not ( = ?auto_378812 ?auto_378822 ) ) ( not ( = ?auto_378812 ?auto_378823 ) ) ( not ( = ?auto_378813 ?auto_378814 ) ) ( not ( = ?auto_378813 ?auto_378815 ) ) ( not ( = ?auto_378813 ?auto_378816 ) ) ( not ( = ?auto_378813 ?auto_378817 ) ) ( not ( = ?auto_378813 ?auto_378818 ) ) ( not ( = ?auto_378813 ?auto_378819 ) ) ( not ( = ?auto_378813 ?auto_378820 ) ) ( not ( = ?auto_378813 ?auto_378821 ) ) ( not ( = ?auto_378813 ?auto_378822 ) ) ( not ( = ?auto_378813 ?auto_378823 ) ) ( not ( = ?auto_378814 ?auto_378815 ) ) ( not ( = ?auto_378814 ?auto_378816 ) ) ( not ( = ?auto_378814 ?auto_378817 ) ) ( not ( = ?auto_378814 ?auto_378818 ) ) ( not ( = ?auto_378814 ?auto_378819 ) ) ( not ( = ?auto_378814 ?auto_378820 ) ) ( not ( = ?auto_378814 ?auto_378821 ) ) ( not ( = ?auto_378814 ?auto_378822 ) ) ( not ( = ?auto_378814 ?auto_378823 ) ) ( not ( = ?auto_378815 ?auto_378816 ) ) ( not ( = ?auto_378815 ?auto_378817 ) ) ( not ( = ?auto_378815 ?auto_378818 ) ) ( not ( = ?auto_378815 ?auto_378819 ) ) ( not ( = ?auto_378815 ?auto_378820 ) ) ( not ( = ?auto_378815 ?auto_378821 ) ) ( not ( = ?auto_378815 ?auto_378822 ) ) ( not ( = ?auto_378815 ?auto_378823 ) ) ( not ( = ?auto_378816 ?auto_378817 ) ) ( not ( = ?auto_378816 ?auto_378818 ) ) ( not ( = ?auto_378816 ?auto_378819 ) ) ( not ( = ?auto_378816 ?auto_378820 ) ) ( not ( = ?auto_378816 ?auto_378821 ) ) ( not ( = ?auto_378816 ?auto_378822 ) ) ( not ( = ?auto_378816 ?auto_378823 ) ) ( not ( = ?auto_378817 ?auto_378818 ) ) ( not ( = ?auto_378817 ?auto_378819 ) ) ( not ( = ?auto_378817 ?auto_378820 ) ) ( not ( = ?auto_378817 ?auto_378821 ) ) ( not ( = ?auto_378817 ?auto_378822 ) ) ( not ( = ?auto_378817 ?auto_378823 ) ) ( not ( = ?auto_378818 ?auto_378819 ) ) ( not ( = ?auto_378818 ?auto_378820 ) ) ( not ( = ?auto_378818 ?auto_378821 ) ) ( not ( = ?auto_378818 ?auto_378822 ) ) ( not ( = ?auto_378818 ?auto_378823 ) ) ( not ( = ?auto_378819 ?auto_378820 ) ) ( not ( = ?auto_378819 ?auto_378821 ) ) ( not ( = ?auto_378819 ?auto_378822 ) ) ( not ( = ?auto_378819 ?auto_378823 ) ) ( not ( = ?auto_378820 ?auto_378821 ) ) ( not ( = ?auto_378820 ?auto_378822 ) ) ( not ( = ?auto_378820 ?auto_378823 ) ) ( not ( = ?auto_378821 ?auto_378822 ) ) ( not ( = ?auto_378821 ?auto_378823 ) ) ( not ( = ?auto_378822 ?auto_378823 ) ) ( ON ?auto_378821 ?auto_378822 ) ( ON ?auto_378820 ?auto_378821 ) ( ON ?auto_378819 ?auto_378820 ) ( ON ?auto_378818 ?auto_378819 ) ( ON ?auto_378817 ?auto_378818 ) ( ON ?auto_378816 ?auto_378817 ) ( CLEAR ?auto_378814 ) ( ON ?auto_378815 ?auto_378816 ) ( CLEAR ?auto_378815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_378811 ?auto_378812 ?auto_378813 ?auto_378814 ?auto_378815 )
      ( MAKE-12PILE ?auto_378811 ?auto_378812 ?auto_378813 ?auto_378814 ?auto_378815 ?auto_378816 ?auto_378817 ?auto_378818 ?auto_378819 ?auto_378820 ?auto_378821 ?auto_378822 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378836 - BLOCK
      ?auto_378837 - BLOCK
      ?auto_378838 - BLOCK
      ?auto_378839 - BLOCK
      ?auto_378840 - BLOCK
      ?auto_378841 - BLOCK
      ?auto_378842 - BLOCK
      ?auto_378843 - BLOCK
      ?auto_378844 - BLOCK
      ?auto_378845 - BLOCK
      ?auto_378846 - BLOCK
      ?auto_378847 - BLOCK
    )
    :vars
    (
      ?auto_378848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378847 ?auto_378848 ) ( ON-TABLE ?auto_378836 ) ( ON ?auto_378837 ?auto_378836 ) ( ON ?auto_378838 ?auto_378837 ) ( not ( = ?auto_378836 ?auto_378837 ) ) ( not ( = ?auto_378836 ?auto_378838 ) ) ( not ( = ?auto_378836 ?auto_378839 ) ) ( not ( = ?auto_378836 ?auto_378840 ) ) ( not ( = ?auto_378836 ?auto_378841 ) ) ( not ( = ?auto_378836 ?auto_378842 ) ) ( not ( = ?auto_378836 ?auto_378843 ) ) ( not ( = ?auto_378836 ?auto_378844 ) ) ( not ( = ?auto_378836 ?auto_378845 ) ) ( not ( = ?auto_378836 ?auto_378846 ) ) ( not ( = ?auto_378836 ?auto_378847 ) ) ( not ( = ?auto_378836 ?auto_378848 ) ) ( not ( = ?auto_378837 ?auto_378838 ) ) ( not ( = ?auto_378837 ?auto_378839 ) ) ( not ( = ?auto_378837 ?auto_378840 ) ) ( not ( = ?auto_378837 ?auto_378841 ) ) ( not ( = ?auto_378837 ?auto_378842 ) ) ( not ( = ?auto_378837 ?auto_378843 ) ) ( not ( = ?auto_378837 ?auto_378844 ) ) ( not ( = ?auto_378837 ?auto_378845 ) ) ( not ( = ?auto_378837 ?auto_378846 ) ) ( not ( = ?auto_378837 ?auto_378847 ) ) ( not ( = ?auto_378837 ?auto_378848 ) ) ( not ( = ?auto_378838 ?auto_378839 ) ) ( not ( = ?auto_378838 ?auto_378840 ) ) ( not ( = ?auto_378838 ?auto_378841 ) ) ( not ( = ?auto_378838 ?auto_378842 ) ) ( not ( = ?auto_378838 ?auto_378843 ) ) ( not ( = ?auto_378838 ?auto_378844 ) ) ( not ( = ?auto_378838 ?auto_378845 ) ) ( not ( = ?auto_378838 ?auto_378846 ) ) ( not ( = ?auto_378838 ?auto_378847 ) ) ( not ( = ?auto_378838 ?auto_378848 ) ) ( not ( = ?auto_378839 ?auto_378840 ) ) ( not ( = ?auto_378839 ?auto_378841 ) ) ( not ( = ?auto_378839 ?auto_378842 ) ) ( not ( = ?auto_378839 ?auto_378843 ) ) ( not ( = ?auto_378839 ?auto_378844 ) ) ( not ( = ?auto_378839 ?auto_378845 ) ) ( not ( = ?auto_378839 ?auto_378846 ) ) ( not ( = ?auto_378839 ?auto_378847 ) ) ( not ( = ?auto_378839 ?auto_378848 ) ) ( not ( = ?auto_378840 ?auto_378841 ) ) ( not ( = ?auto_378840 ?auto_378842 ) ) ( not ( = ?auto_378840 ?auto_378843 ) ) ( not ( = ?auto_378840 ?auto_378844 ) ) ( not ( = ?auto_378840 ?auto_378845 ) ) ( not ( = ?auto_378840 ?auto_378846 ) ) ( not ( = ?auto_378840 ?auto_378847 ) ) ( not ( = ?auto_378840 ?auto_378848 ) ) ( not ( = ?auto_378841 ?auto_378842 ) ) ( not ( = ?auto_378841 ?auto_378843 ) ) ( not ( = ?auto_378841 ?auto_378844 ) ) ( not ( = ?auto_378841 ?auto_378845 ) ) ( not ( = ?auto_378841 ?auto_378846 ) ) ( not ( = ?auto_378841 ?auto_378847 ) ) ( not ( = ?auto_378841 ?auto_378848 ) ) ( not ( = ?auto_378842 ?auto_378843 ) ) ( not ( = ?auto_378842 ?auto_378844 ) ) ( not ( = ?auto_378842 ?auto_378845 ) ) ( not ( = ?auto_378842 ?auto_378846 ) ) ( not ( = ?auto_378842 ?auto_378847 ) ) ( not ( = ?auto_378842 ?auto_378848 ) ) ( not ( = ?auto_378843 ?auto_378844 ) ) ( not ( = ?auto_378843 ?auto_378845 ) ) ( not ( = ?auto_378843 ?auto_378846 ) ) ( not ( = ?auto_378843 ?auto_378847 ) ) ( not ( = ?auto_378843 ?auto_378848 ) ) ( not ( = ?auto_378844 ?auto_378845 ) ) ( not ( = ?auto_378844 ?auto_378846 ) ) ( not ( = ?auto_378844 ?auto_378847 ) ) ( not ( = ?auto_378844 ?auto_378848 ) ) ( not ( = ?auto_378845 ?auto_378846 ) ) ( not ( = ?auto_378845 ?auto_378847 ) ) ( not ( = ?auto_378845 ?auto_378848 ) ) ( not ( = ?auto_378846 ?auto_378847 ) ) ( not ( = ?auto_378846 ?auto_378848 ) ) ( not ( = ?auto_378847 ?auto_378848 ) ) ( ON ?auto_378846 ?auto_378847 ) ( ON ?auto_378845 ?auto_378846 ) ( ON ?auto_378844 ?auto_378845 ) ( ON ?auto_378843 ?auto_378844 ) ( ON ?auto_378842 ?auto_378843 ) ( ON ?auto_378841 ?auto_378842 ) ( ON ?auto_378840 ?auto_378841 ) ( CLEAR ?auto_378838 ) ( ON ?auto_378839 ?auto_378840 ) ( CLEAR ?auto_378839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_378836 ?auto_378837 ?auto_378838 ?auto_378839 )
      ( MAKE-12PILE ?auto_378836 ?auto_378837 ?auto_378838 ?auto_378839 ?auto_378840 ?auto_378841 ?auto_378842 ?auto_378843 ?auto_378844 ?auto_378845 ?auto_378846 ?auto_378847 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378861 - BLOCK
      ?auto_378862 - BLOCK
      ?auto_378863 - BLOCK
      ?auto_378864 - BLOCK
      ?auto_378865 - BLOCK
      ?auto_378866 - BLOCK
      ?auto_378867 - BLOCK
      ?auto_378868 - BLOCK
      ?auto_378869 - BLOCK
      ?auto_378870 - BLOCK
      ?auto_378871 - BLOCK
      ?auto_378872 - BLOCK
    )
    :vars
    (
      ?auto_378873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378872 ?auto_378873 ) ( ON-TABLE ?auto_378861 ) ( ON ?auto_378862 ?auto_378861 ) ( ON ?auto_378863 ?auto_378862 ) ( not ( = ?auto_378861 ?auto_378862 ) ) ( not ( = ?auto_378861 ?auto_378863 ) ) ( not ( = ?auto_378861 ?auto_378864 ) ) ( not ( = ?auto_378861 ?auto_378865 ) ) ( not ( = ?auto_378861 ?auto_378866 ) ) ( not ( = ?auto_378861 ?auto_378867 ) ) ( not ( = ?auto_378861 ?auto_378868 ) ) ( not ( = ?auto_378861 ?auto_378869 ) ) ( not ( = ?auto_378861 ?auto_378870 ) ) ( not ( = ?auto_378861 ?auto_378871 ) ) ( not ( = ?auto_378861 ?auto_378872 ) ) ( not ( = ?auto_378861 ?auto_378873 ) ) ( not ( = ?auto_378862 ?auto_378863 ) ) ( not ( = ?auto_378862 ?auto_378864 ) ) ( not ( = ?auto_378862 ?auto_378865 ) ) ( not ( = ?auto_378862 ?auto_378866 ) ) ( not ( = ?auto_378862 ?auto_378867 ) ) ( not ( = ?auto_378862 ?auto_378868 ) ) ( not ( = ?auto_378862 ?auto_378869 ) ) ( not ( = ?auto_378862 ?auto_378870 ) ) ( not ( = ?auto_378862 ?auto_378871 ) ) ( not ( = ?auto_378862 ?auto_378872 ) ) ( not ( = ?auto_378862 ?auto_378873 ) ) ( not ( = ?auto_378863 ?auto_378864 ) ) ( not ( = ?auto_378863 ?auto_378865 ) ) ( not ( = ?auto_378863 ?auto_378866 ) ) ( not ( = ?auto_378863 ?auto_378867 ) ) ( not ( = ?auto_378863 ?auto_378868 ) ) ( not ( = ?auto_378863 ?auto_378869 ) ) ( not ( = ?auto_378863 ?auto_378870 ) ) ( not ( = ?auto_378863 ?auto_378871 ) ) ( not ( = ?auto_378863 ?auto_378872 ) ) ( not ( = ?auto_378863 ?auto_378873 ) ) ( not ( = ?auto_378864 ?auto_378865 ) ) ( not ( = ?auto_378864 ?auto_378866 ) ) ( not ( = ?auto_378864 ?auto_378867 ) ) ( not ( = ?auto_378864 ?auto_378868 ) ) ( not ( = ?auto_378864 ?auto_378869 ) ) ( not ( = ?auto_378864 ?auto_378870 ) ) ( not ( = ?auto_378864 ?auto_378871 ) ) ( not ( = ?auto_378864 ?auto_378872 ) ) ( not ( = ?auto_378864 ?auto_378873 ) ) ( not ( = ?auto_378865 ?auto_378866 ) ) ( not ( = ?auto_378865 ?auto_378867 ) ) ( not ( = ?auto_378865 ?auto_378868 ) ) ( not ( = ?auto_378865 ?auto_378869 ) ) ( not ( = ?auto_378865 ?auto_378870 ) ) ( not ( = ?auto_378865 ?auto_378871 ) ) ( not ( = ?auto_378865 ?auto_378872 ) ) ( not ( = ?auto_378865 ?auto_378873 ) ) ( not ( = ?auto_378866 ?auto_378867 ) ) ( not ( = ?auto_378866 ?auto_378868 ) ) ( not ( = ?auto_378866 ?auto_378869 ) ) ( not ( = ?auto_378866 ?auto_378870 ) ) ( not ( = ?auto_378866 ?auto_378871 ) ) ( not ( = ?auto_378866 ?auto_378872 ) ) ( not ( = ?auto_378866 ?auto_378873 ) ) ( not ( = ?auto_378867 ?auto_378868 ) ) ( not ( = ?auto_378867 ?auto_378869 ) ) ( not ( = ?auto_378867 ?auto_378870 ) ) ( not ( = ?auto_378867 ?auto_378871 ) ) ( not ( = ?auto_378867 ?auto_378872 ) ) ( not ( = ?auto_378867 ?auto_378873 ) ) ( not ( = ?auto_378868 ?auto_378869 ) ) ( not ( = ?auto_378868 ?auto_378870 ) ) ( not ( = ?auto_378868 ?auto_378871 ) ) ( not ( = ?auto_378868 ?auto_378872 ) ) ( not ( = ?auto_378868 ?auto_378873 ) ) ( not ( = ?auto_378869 ?auto_378870 ) ) ( not ( = ?auto_378869 ?auto_378871 ) ) ( not ( = ?auto_378869 ?auto_378872 ) ) ( not ( = ?auto_378869 ?auto_378873 ) ) ( not ( = ?auto_378870 ?auto_378871 ) ) ( not ( = ?auto_378870 ?auto_378872 ) ) ( not ( = ?auto_378870 ?auto_378873 ) ) ( not ( = ?auto_378871 ?auto_378872 ) ) ( not ( = ?auto_378871 ?auto_378873 ) ) ( not ( = ?auto_378872 ?auto_378873 ) ) ( ON ?auto_378871 ?auto_378872 ) ( ON ?auto_378870 ?auto_378871 ) ( ON ?auto_378869 ?auto_378870 ) ( ON ?auto_378868 ?auto_378869 ) ( ON ?auto_378867 ?auto_378868 ) ( ON ?auto_378866 ?auto_378867 ) ( ON ?auto_378865 ?auto_378866 ) ( CLEAR ?auto_378863 ) ( ON ?auto_378864 ?auto_378865 ) ( CLEAR ?auto_378864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_378861 ?auto_378862 ?auto_378863 ?auto_378864 )
      ( MAKE-12PILE ?auto_378861 ?auto_378862 ?auto_378863 ?auto_378864 ?auto_378865 ?auto_378866 ?auto_378867 ?auto_378868 ?auto_378869 ?auto_378870 ?auto_378871 ?auto_378872 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378886 - BLOCK
      ?auto_378887 - BLOCK
      ?auto_378888 - BLOCK
      ?auto_378889 - BLOCK
      ?auto_378890 - BLOCK
      ?auto_378891 - BLOCK
      ?auto_378892 - BLOCK
      ?auto_378893 - BLOCK
      ?auto_378894 - BLOCK
      ?auto_378895 - BLOCK
      ?auto_378896 - BLOCK
      ?auto_378897 - BLOCK
    )
    :vars
    (
      ?auto_378898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378897 ?auto_378898 ) ( ON-TABLE ?auto_378886 ) ( ON ?auto_378887 ?auto_378886 ) ( not ( = ?auto_378886 ?auto_378887 ) ) ( not ( = ?auto_378886 ?auto_378888 ) ) ( not ( = ?auto_378886 ?auto_378889 ) ) ( not ( = ?auto_378886 ?auto_378890 ) ) ( not ( = ?auto_378886 ?auto_378891 ) ) ( not ( = ?auto_378886 ?auto_378892 ) ) ( not ( = ?auto_378886 ?auto_378893 ) ) ( not ( = ?auto_378886 ?auto_378894 ) ) ( not ( = ?auto_378886 ?auto_378895 ) ) ( not ( = ?auto_378886 ?auto_378896 ) ) ( not ( = ?auto_378886 ?auto_378897 ) ) ( not ( = ?auto_378886 ?auto_378898 ) ) ( not ( = ?auto_378887 ?auto_378888 ) ) ( not ( = ?auto_378887 ?auto_378889 ) ) ( not ( = ?auto_378887 ?auto_378890 ) ) ( not ( = ?auto_378887 ?auto_378891 ) ) ( not ( = ?auto_378887 ?auto_378892 ) ) ( not ( = ?auto_378887 ?auto_378893 ) ) ( not ( = ?auto_378887 ?auto_378894 ) ) ( not ( = ?auto_378887 ?auto_378895 ) ) ( not ( = ?auto_378887 ?auto_378896 ) ) ( not ( = ?auto_378887 ?auto_378897 ) ) ( not ( = ?auto_378887 ?auto_378898 ) ) ( not ( = ?auto_378888 ?auto_378889 ) ) ( not ( = ?auto_378888 ?auto_378890 ) ) ( not ( = ?auto_378888 ?auto_378891 ) ) ( not ( = ?auto_378888 ?auto_378892 ) ) ( not ( = ?auto_378888 ?auto_378893 ) ) ( not ( = ?auto_378888 ?auto_378894 ) ) ( not ( = ?auto_378888 ?auto_378895 ) ) ( not ( = ?auto_378888 ?auto_378896 ) ) ( not ( = ?auto_378888 ?auto_378897 ) ) ( not ( = ?auto_378888 ?auto_378898 ) ) ( not ( = ?auto_378889 ?auto_378890 ) ) ( not ( = ?auto_378889 ?auto_378891 ) ) ( not ( = ?auto_378889 ?auto_378892 ) ) ( not ( = ?auto_378889 ?auto_378893 ) ) ( not ( = ?auto_378889 ?auto_378894 ) ) ( not ( = ?auto_378889 ?auto_378895 ) ) ( not ( = ?auto_378889 ?auto_378896 ) ) ( not ( = ?auto_378889 ?auto_378897 ) ) ( not ( = ?auto_378889 ?auto_378898 ) ) ( not ( = ?auto_378890 ?auto_378891 ) ) ( not ( = ?auto_378890 ?auto_378892 ) ) ( not ( = ?auto_378890 ?auto_378893 ) ) ( not ( = ?auto_378890 ?auto_378894 ) ) ( not ( = ?auto_378890 ?auto_378895 ) ) ( not ( = ?auto_378890 ?auto_378896 ) ) ( not ( = ?auto_378890 ?auto_378897 ) ) ( not ( = ?auto_378890 ?auto_378898 ) ) ( not ( = ?auto_378891 ?auto_378892 ) ) ( not ( = ?auto_378891 ?auto_378893 ) ) ( not ( = ?auto_378891 ?auto_378894 ) ) ( not ( = ?auto_378891 ?auto_378895 ) ) ( not ( = ?auto_378891 ?auto_378896 ) ) ( not ( = ?auto_378891 ?auto_378897 ) ) ( not ( = ?auto_378891 ?auto_378898 ) ) ( not ( = ?auto_378892 ?auto_378893 ) ) ( not ( = ?auto_378892 ?auto_378894 ) ) ( not ( = ?auto_378892 ?auto_378895 ) ) ( not ( = ?auto_378892 ?auto_378896 ) ) ( not ( = ?auto_378892 ?auto_378897 ) ) ( not ( = ?auto_378892 ?auto_378898 ) ) ( not ( = ?auto_378893 ?auto_378894 ) ) ( not ( = ?auto_378893 ?auto_378895 ) ) ( not ( = ?auto_378893 ?auto_378896 ) ) ( not ( = ?auto_378893 ?auto_378897 ) ) ( not ( = ?auto_378893 ?auto_378898 ) ) ( not ( = ?auto_378894 ?auto_378895 ) ) ( not ( = ?auto_378894 ?auto_378896 ) ) ( not ( = ?auto_378894 ?auto_378897 ) ) ( not ( = ?auto_378894 ?auto_378898 ) ) ( not ( = ?auto_378895 ?auto_378896 ) ) ( not ( = ?auto_378895 ?auto_378897 ) ) ( not ( = ?auto_378895 ?auto_378898 ) ) ( not ( = ?auto_378896 ?auto_378897 ) ) ( not ( = ?auto_378896 ?auto_378898 ) ) ( not ( = ?auto_378897 ?auto_378898 ) ) ( ON ?auto_378896 ?auto_378897 ) ( ON ?auto_378895 ?auto_378896 ) ( ON ?auto_378894 ?auto_378895 ) ( ON ?auto_378893 ?auto_378894 ) ( ON ?auto_378892 ?auto_378893 ) ( ON ?auto_378891 ?auto_378892 ) ( ON ?auto_378890 ?auto_378891 ) ( ON ?auto_378889 ?auto_378890 ) ( CLEAR ?auto_378887 ) ( ON ?auto_378888 ?auto_378889 ) ( CLEAR ?auto_378888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_378886 ?auto_378887 ?auto_378888 )
      ( MAKE-12PILE ?auto_378886 ?auto_378887 ?auto_378888 ?auto_378889 ?auto_378890 ?auto_378891 ?auto_378892 ?auto_378893 ?auto_378894 ?auto_378895 ?auto_378896 ?auto_378897 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378911 - BLOCK
      ?auto_378912 - BLOCK
      ?auto_378913 - BLOCK
      ?auto_378914 - BLOCK
      ?auto_378915 - BLOCK
      ?auto_378916 - BLOCK
      ?auto_378917 - BLOCK
      ?auto_378918 - BLOCK
      ?auto_378919 - BLOCK
      ?auto_378920 - BLOCK
      ?auto_378921 - BLOCK
      ?auto_378922 - BLOCK
    )
    :vars
    (
      ?auto_378923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378922 ?auto_378923 ) ( ON-TABLE ?auto_378911 ) ( ON ?auto_378912 ?auto_378911 ) ( not ( = ?auto_378911 ?auto_378912 ) ) ( not ( = ?auto_378911 ?auto_378913 ) ) ( not ( = ?auto_378911 ?auto_378914 ) ) ( not ( = ?auto_378911 ?auto_378915 ) ) ( not ( = ?auto_378911 ?auto_378916 ) ) ( not ( = ?auto_378911 ?auto_378917 ) ) ( not ( = ?auto_378911 ?auto_378918 ) ) ( not ( = ?auto_378911 ?auto_378919 ) ) ( not ( = ?auto_378911 ?auto_378920 ) ) ( not ( = ?auto_378911 ?auto_378921 ) ) ( not ( = ?auto_378911 ?auto_378922 ) ) ( not ( = ?auto_378911 ?auto_378923 ) ) ( not ( = ?auto_378912 ?auto_378913 ) ) ( not ( = ?auto_378912 ?auto_378914 ) ) ( not ( = ?auto_378912 ?auto_378915 ) ) ( not ( = ?auto_378912 ?auto_378916 ) ) ( not ( = ?auto_378912 ?auto_378917 ) ) ( not ( = ?auto_378912 ?auto_378918 ) ) ( not ( = ?auto_378912 ?auto_378919 ) ) ( not ( = ?auto_378912 ?auto_378920 ) ) ( not ( = ?auto_378912 ?auto_378921 ) ) ( not ( = ?auto_378912 ?auto_378922 ) ) ( not ( = ?auto_378912 ?auto_378923 ) ) ( not ( = ?auto_378913 ?auto_378914 ) ) ( not ( = ?auto_378913 ?auto_378915 ) ) ( not ( = ?auto_378913 ?auto_378916 ) ) ( not ( = ?auto_378913 ?auto_378917 ) ) ( not ( = ?auto_378913 ?auto_378918 ) ) ( not ( = ?auto_378913 ?auto_378919 ) ) ( not ( = ?auto_378913 ?auto_378920 ) ) ( not ( = ?auto_378913 ?auto_378921 ) ) ( not ( = ?auto_378913 ?auto_378922 ) ) ( not ( = ?auto_378913 ?auto_378923 ) ) ( not ( = ?auto_378914 ?auto_378915 ) ) ( not ( = ?auto_378914 ?auto_378916 ) ) ( not ( = ?auto_378914 ?auto_378917 ) ) ( not ( = ?auto_378914 ?auto_378918 ) ) ( not ( = ?auto_378914 ?auto_378919 ) ) ( not ( = ?auto_378914 ?auto_378920 ) ) ( not ( = ?auto_378914 ?auto_378921 ) ) ( not ( = ?auto_378914 ?auto_378922 ) ) ( not ( = ?auto_378914 ?auto_378923 ) ) ( not ( = ?auto_378915 ?auto_378916 ) ) ( not ( = ?auto_378915 ?auto_378917 ) ) ( not ( = ?auto_378915 ?auto_378918 ) ) ( not ( = ?auto_378915 ?auto_378919 ) ) ( not ( = ?auto_378915 ?auto_378920 ) ) ( not ( = ?auto_378915 ?auto_378921 ) ) ( not ( = ?auto_378915 ?auto_378922 ) ) ( not ( = ?auto_378915 ?auto_378923 ) ) ( not ( = ?auto_378916 ?auto_378917 ) ) ( not ( = ?auto_378916 ?auto_378918 ) ) ( not ( = ?auto_378916 ?auto_378919 ) ) ( not ( = ?auto_378916 ?auto_378920 ) ) ( not ( = ?auto_378916 ?auto_378921 ) ) ( not ( = ?auto_378916 ?auto_378922 ) ) ( not ( = ?auto_378916 ?auto_378923 ) ) ( not ( = ?auto_378917 ?auto_378918 ) ) ( not ( = ?auto_378917 ?auto_378919 ) ) ( not ( = ?auto_378917 ?auto_378920 ) ) ( not ( = ?auto_378917 ?auto_378921 ) ) ( not ( = ?auto_378917 ?auto_378922 ) ) ( not ( = ?auto_378917 ?auto_378923 ) ) ( not ( = ?auto_378918 ?auto_378919 ) ) ( not ( = ?auto_378918 ?auto_378920 ) ) ( not ( = ?auto_378918 ?auto_378921 ) ) ( not ( = ?auto_378918 ?auto_378922 ) ) ( not ( = ?auto_378918 ?auto_378923 ) ) ( not ( = ?auto_378919 ?auto_378920 ) ) ( not ( = ?auto_378919 ?auto_378921 ) ) ( not ( = ?auto_378919 ?auto_378922 ) ) ( not ( = ?auto_378919 ?auto_378923 ) ) ( not ( = ?auto_378920 ?auto_378921 ) ) ( not ( = ?auto_378920 ?auto_378922 ) ) ( not ( = ?auto_378920 ?auto_378923 ) ) ( not ( = ?auto_378921 ?auto_378922 ) ) ( not ( = ?auto_378921 ?auto_378923 ) ) ( not ( = ?auto_378922 ?auto_378923 ) ) ( ON ?auto_378921 ?auto_378922 ) ( ON ?auto_378920 ?auto_378921 ) ( ON ?auto_378919 ?auto_378920 ) ( ON ?auto_378918 ?auto_378919 ) ( ON ?auto_378917 ?auto_378918 ) ( ON ?auto_378916 ?auto_378917 ) ( ON ?auto_378915 ?auto_378916 ) ( ON ?auto_378914 ?auto_378915 ) ( CLEAR ?auto_378912 ) ( ON ?auto_378913 ?auto_378914 ) ( CLEAR ?auto_378913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_378911 ?auto_378912 ?auto_378913 )
      ( MAKE-12PILE ?auto_378911 ?auto_378912 ?auto_378913 ?auto_378914 ?auto_378915 ?auto_378916 ?auto_378917 ?auto_378918 ?auto_378919 ?auto_378920 ?auto_378921 ?auto_378922 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378936 - BLOCK
      ?auto_378937 - BLOCK
      ?auto_378938 - BLOCK
      ?auto_378939 - BLOCK
      ?auto_378940 - BLOCK
      ?auto_378941 - BLOCK
      ?auto_378942 - BLOCK
      ?auto_378943 - BLOCK
      ?auto_378944 - BLOCK
      ?auto_378945 - BLOCK
      ?auto_378946 - BLOCK
      ?auto_378947 - BLOCK
    )
    :vars
    (
      ?auto_378948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378947 ?auto_378948 ) ( ON-TABLE ?auto_378936 ) ( not ( = ?auto_378936 ?auto_378937 ) ) ( not ( = ?auto_378936 ?auto_378938 ) ) ( not ( = ?auto_378936 ?auto_378939 ) ) ( not ( = ?auto_378936 ?auto_378940 ) ) ( not ( = ?auto_378936 ?auto_378941 ) ) ( not ( = ?auto_378936 ?auto_378942 ) ) ( not ( = ?auto_378936 ?auto_378943 ) ) ( not ( = ?auto_378936 ?auto_378944 ) ) ( not ( = ?auto_378936 ?auto_378945 ) ) ( not ( = ?auto_378936 ?auto_378946 ) ) ( not ( = ?auto_378936 ?auto_378947 ) ) ( not ( = ?auto_378936 ?auto_378948 ) ) ( not ( = ?auto_378937 ?auto_378938 ) ) ( not ( = ?auto_378937 ?auto_378939 ) ) ( not ( = ?auto_378937 ?auto_378940 ) ) ( not ( = ?auto_378937 ?auto_378941 ) ) ( not ( = ?auto_378937 ?auto_378942 ) ) ( not ( = ?auto_378937 ?auto_378943 ) ) ( not ( = ?auto_378937 ?auto_378944 ) ) ( not ( = ?auto_378937 ?auto_378945 ) ) ( not ( = ?auto_378937 ?auto_378946 ) ) ( not ( = ?auto_378937 ?auto_378947 ) ) ( not ( = ?auto_378937 ?auto_378948 ) ) ( not ( = ?auto_378938 ?auto_378939 ) ) ( not ( = ?auto_378938 ?auto_378940 ) ) ( not ( = ?auto_378938 ?auto_378941 ) ) ( not ( = ?auto_378938 ?auto_378942 ) ) ( not ( = ?auto_378938 ?auto_378943 ) ) ( not ( = ?auto_378938 ?auto_378944 ) ) ( not ( = ?auto_378938 ?auto_378945 ) ) ( not ( = ?auto_378938 ?auto_378946 ) ) ( not ( = ?auto_378938 ?auto_378947 ) ) ( not ( = ?auto_378938 ?auto_378948 ) ) ( not ( = ?auto_378939 ?auto_378940 ) ) ( not ( = ?auto_378939 ?auto_378941 ) ) ( not ( = ?auto_378939 ?auto_378942 ) ) ( not ( = ?auto_378939 ?auto_378943 ) ) ( not ( = ?auto_378939 ?auto_378944 ) ) ( not ( = ?auto_378939 ?auto_378945 ) ) ( not ( = ?auto_378939 ?auto_378946 ) ) ( not ( = ?auto_378939 ?auto_378947 ) ) ( not ( = ?auto_378939 ?auto_378948 ) ) ( not ( = ?auto_378940 ?auto_378941 ) ) ( not ( = ?auto_378940 ?auto_378942 ) ) ( not ( = ?auto_378940 ?auto_378943 ) ) ( not ( = ?auto_378940 ?auto_378944 ) ) ( not ( = ?auto_378940 ?auto_378945 ) ) ( not ( = ?auto_378940 ?auto_378946 ) ) ( not ( = ?auto_378940 ?auto_378947 ) ) ( not ( = ?auto_378940 ?auto_378948 ) ) ( not ( = ?auto_378941 ?auto_378942 ) ) ( not ( = ?auto_378941 ?auto_378943 ) ) ( not ( = ?auto_378941 ?auto_378944 ) ) ( not ( = ?auto_378941 ?auto_378945 ) ) ( not ( = ?auto_378941 ?auto_378946 ) ) ( not ( = ?auto_378941 ?auto_378947 ) ) ( not ( = ?auto_378941 ?auto_378948 ) ) ( not ( = ?auto_378942 ?auto_378943 ) ) ( not ( = ?auto_378942 ?auto_378944 ) ) ( not ( = ?auto_378942 ?auto_378945 ) ) ( not ( = ?auto_378942 ?auto_378946 ) ) ( not ( = ?auto_378942 ?auto_378947 ) ) ( not ( = ?auto_378942 ?auto_378948 ) ) ( not ( = ?auto_378943 ?auto_378944 ) ) ( not ( = ?auto_378943 ?auto_378945 ) ) ( not ( = ?auto_378943 ?auto_378946 ) ) ( not ( = ?auto_378943 ?auto_378947 ) ) ( not ( = ?auto_378943 ?auto_378948 ) ) ( not ( = ?auto_378944 ?auto_378945 ) ) ( not ( = ?auto_378944 ?auto_378946 ) ) ( not ( = ?auto_378944 ?auto_378947 ) ) ( not ( = ?auto_378944 ?auto_378948 ) ) ( not ( = ?auto_378945 ?auto_378946 ) ) ( not ( = ?auto_378945 ?auto_378947 ) ) ( not ( = ?auto_378945 ?auto_378948 ) ) ( not ( = ?auto_378946 ?auto_378947 ) ) ( not ( = ?auto_378946 ?auto_378948 ) ) ( not ( = ?auto_378947 ?auto_378948 ) ) ( ON ?auto_378946 ?auto_378947 ) ( ON ?auto_378945 ?auto_378946 ) ( ON ?auto_378944 ?auto_378945 ) ( ON ?auto_378943 ?auto_378944 ) ( ON ?auto_378942 ?auto_378943 ) ( ON ?auto_378941 ?auto_378942 ) ( ON ?auto_378940 ?auto_378941 ) ( ON ?auto_378939 ?auto_378940 ) ( ON ?auto_378938 ?auto_378939 ) ( CLEAR ?auto_378936 ) ( ON ?auto_378937 ?auto_378938 ) ( CLEAR ?auto_378937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_378936 ?auto_378937 )
      ( MAKE-12PILE ?auto_378936 ?auto_378937 ?auto_378938 ?auto_378939 ?auto_378940 ?auto_378941 ?auto_378942 ?auto_378943 ?auto_378944 ?auto_378945 ?auto_378946 ?auto_378947 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378961 - BLOCK
      ?auto_378962 - BLOCK
      ?auto_378963 - BLOCK
      ?auto_378964 - BLOCK
      ?auto_378965 - BLOCK
      ?auto_378966 - BLOCK
      ?auto_378967 - BLOCK
      ?auto_378968 - BLOCK
      ?auto_378969 - BLOCK
      ?auto_378970 - BLOCK
      ?auto_378971 - BLOCK
      ?auto_378972 - BLOCK
    )
    :vars
    (
      ?auto_378973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378972 ?auto_378973 ) ( ON-TABLE ?auto_378961 ) ( not ( = ?auto_378961 ?auto_378962 ) ) ( not ( = ?auto_378961 ?auto_378963 ) ) ( not ( = ?auto_378961 ?auto_378964 ) ) ( not ( = ?auto_378961 ?auto_378965 ) ) ( not ( = ?auto_378961 ?auto_378966 ) ) ( not ( = ?auto_378961 ?auto_378967 ) ) ( not ( = ?auto_378961 ?auto_378968 ) ) ( not ( = ?auto_378961 ?auto_378969 ) ) ( not ( = ?auto_378961 ?auto_378970 ) ) ( not ( = ?auto_378961 ?auto_378971 ) ) ( not ( = ?auto_378961 ?auto_378972 ) ) ( not ( = ?auto_378961 ?auto_378973 ) ) ( not ( = ?auto_378962 ?auto_378963 ) ) ( not ( = ?auto_378962 ?auto_378964 ) ) ( not ( = ?auto_378962 ?auto_378965 ) ) ( not ( = ?auto_378962 ?auto_378966 ) ) ( not ( = ?auto_378962 ?auto_378967 ) ) ( not ( = ?auto_378962 ?auto_378968 ) ) ( not ( = ?auto_378962 ?auto_378969 ) ) ( not ( = ?auto_378962 ?auto_378970 ) ) ( not ( = ?auto_378962 ?auto_378971 ) ) ( not ( = ?auto_378962 ?auto_378972 ) ) ( not ( = ?auto_378962 ?auto_378973 ) ) ( not ( = ?auto_378963 ?auto_378964 ) ) ( not ( = ?auto_378963 ?auto_378965 ) ) ( not ( = ?auto_378963 ?auto_378966 ) ) ( not ( = ?auto_378963 ?auto_378967 ) ) ( not ( = ?auto_378963 ?auto_378968 ) ) ( not ( = ?auto_378963 ?auto_378969 ) ) ( not ( = ?auto_378963 ?auto_378970 ) ) ( not ( = ?auto_378963 ?auto_378971 ) ) ( not ( = ?auto_378963 ?auto_378972 ) ) ( not ( = ?auto_378963 ?auto_378973 ) ) ( not ( = ?auto_378964 ?auto_378965 ) ) ( not ( = ?auto_378964 ?auto_378966 ) ) ( not ( = ?auto_378964 ?auto_378967 ) ) ( not ( = ?auto_378964 ?auto_378968 ) ) ( not ( = ?auto_378964 ?auto_378969 ) ) ( not ( = ?auto_378964 ?auto_378970 ) ) ( not ( = ?auto_378964 ?auto_378971 ) ) ( not ( = ?auto_378964 ?auto_378972 ) ) ( not ( = ?auto_378964 ?auto_378973 ) ) ( not ( = ?auto_378965 ?auto_378966 ) ) ( not ( = ?auto_378965 ?auto_378967 ) ) ( not ( = ?auto_378965 ?auto_378968 ) ) ( not ( = ?auto_378965 ?auto_378969 ) ) ( not ( = ?auto_378965 ?auto_378970 ) ) ( not ( = ?auto_378965 ?auto_378971 ) ) ( not ( = ?auto_378965 ?auto_378972 ) ) ( not ( = ?auto_378965 ?auto_378973 ) ) ( not ( = ?auto_378966 ?auto_378967 ) ) ( not ( = ?auto_378966 ?auto_378968 ) ) ( not ( = ?auto_378966 ?auto_378969 ) ) ( not ( = ?auto_378966 ?auto_378970 ) ) ( not ( = ?auto_378966 ?auto_378971 ) ) ( not ( = ?auto_378966 ?auto_378972 ) ) ( not ( = ?auto_378966 ?auto_378973 ) ) ( not ( = ?auto_378967 ?auto_378968 ) ) ( not ( = ?auto_378967 ?auto_378969 ) ) ( not ( = ?auto_378967 ?auto_378970 ) ) ( not ( = ?auto_378967 ?auto_378971 ) ) ( not ( = ?auto_378967 ?auto_378972 ) ) ( not ( = ?auto_378967 ?auto_378973 ) ) ( not ( = ?auto_378968 ?auto_378969 ) ) ( not ( = ?auto_378968 ?auto_378970 ) ) ( not ( = ?auto_378968 ?auto_378971 ) ) ( not ( = ?auto_378968 ?auto_378972 ) ) ( not ( = ?auto_378968 ?auto_378973 ) ) ( not ( = ?auto_378969 ?auto_378970 ) ) ( not ( = ?auto_378969 ?auto_378971 ) ) ( not ( = ?auto_378969 ?auto_378972 ) ) ( not ( = ?auto_378969 ?auto_378973 ) ) ( not ( = ?auto_378970 ?auto_378971 ) ) ( not ( = ?auto_378970 ?auto_378972 ) ) ( not ( = ?auto_378970 ?auto_378973 ) ) ( not ( = ?auto_378971 ?auto_378972 ) ) ( not ( = ?auto_378971 ?auto_378973 ) ) ( not ( = ?auto_378972 ?auto_378973 ) ) ( ON ?auto_378971 ?auto_378972 ) ( ON ?auto_378970 ?auto_378971 ) ( ON ?auto_378969 ?auto_378970 ) ( ON ?auto_378968 ?auto_378969 ) ( ON ?auto_378967 ?auto_378968 ) ( ON ?auto_378966 ?auto_378967 ) ( ON ?auto_378965 ?auto_378966 ) ( ON ?auto_378964 ?auto_378965 ) ( ON ?auto_378963 ?auto_378964 ) ( CLEAR ?auto_378961 ) ( ON ?auto_378962 ?auto_378963 ) ( CLEAR ?auto_378962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_378961 ?auto_378962 )
      ( MAKE-12PILE ?auto_378961 ?auto_378962 ?auto_378963 ?auto_378964 ?auto_378965 ?auto_378966 ?auto_378967 ?auto_378968 ?auto_378969 ?auto_378970 ?auto_378971 ?auto_378972 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_378986 - BLOCK
      ?auto_378987 - BLOCK
      ?auto_378988 - BLOCK
      ?auto_378989 - BLOCK
      ?auto_378990 - BLOCK
      ?auto_378991 - BLOCK
      ?auto_378992 - BLOCK
      ?auto_378993 - BLOCK
      ?auto_378994 - BLOCK
      ?auto_378995 - BLOCK
      ?auto_378996 - BLOCK
      ?auto_378997 - BLOCK
    )
    :vars
    (
      ?auto_378998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378997 ?auto_378998 ) ( not ( = ?auto_378986 ?auto_378987 ) ) ( not ( = ?auto_378986 ?auto_378988 ) ) ( not ( = ?auto_378986 ?auto_378989 ) ) ( not ( = ?auto_378986 ?auto_378990 ) ) ( not ( = ?auto_378986 ?auto_378991 ) ) ( not ( = ?auto_378986 ?auto_378992 ) ) ( not ( = ?auto_378986 ?auto_378993 ) ) ( not ( = ?auto_378986 ?auto_378994 ) ) ( not ( = ?auto_378986 ?auto_378995 ) ) ( not ( = ?auto_378986 ?auto_378996 ) ) ( not ( = ?auto_378986 ?auto_378997 ) ) ( not ( = ?auto_378986 ?auto_378998 ) ) ( not ( = ?auto_378987 ?auto_378988 ) ) ( not ( = ?auto_378987 ?auto_378989 ) ) ( not ( = ?auto_378987 ?auto_378990 ) ) ( not ( = ?auto_378987 ?auto_378991 ) ) ( not ( = ?auto_378987 ?auto_378992 ) ) ( not ( = ?auto_378987 ?auto_378993 ) ) ( not ( = ?auto_378987 ?auto_378994 ) ) ( not ( = ?auto_378987 ?auto_378995 ) ) ( not ( = ?auto_378987 ?auto_378996 ) ) ( not ( = ?auto_378987 ?auto_378997 ) ) ( not ( = ?auto_378987 ?auto_378998 ) ) ( not ( = ?auto_378988 ?auto_378989 ) ) ( not ( = ?auto_378988 ?auto_378990 ) ) ( not ( = ?auto_378988 ?auto_378991 ) ) ( not ( = ?auto_378988 ?auto_378992 ) ) ( not ( = ?auto_378988 ?auto_378993 ) ) ( not ( = ?auto_378988 ?auto_378994 ) ) ( not ( = ?auto_378988 ?auto_378995 ) ) ( not ( = ?auto_378988 ?auto_378996 ) ) ( not ( = ?auto_378988 ?auto_378997 ) ) ( not ( = ?auto_378988 ?auto_378998 ) ) ( not ( = ?auto_378989 ?auto_378990 ) ) ( not ( = ?auto_378989 ?auto_378991 ) ) ( not ( = ?auto_378989 ?auto_378992 ) ) ( not ( = ?auto_378989 ?auto_378993 ) ) ( not ( = ?auto_378989 ?auto_378994 ) ) ( not ( = ?auto_378989 ?auto_378995 ) ) ( not ( = ?auto_378989 ?auto_378996 ) ) ( not ( = ?auto_378989 ?auto_378997 ) ) ( not ( = ?auto_378989 ?auto_378998 ) ) ( not ( = ?auto_378990 ?auto_378991 ) ) ( not ( = ?auto_378990 ?auto_378992 ) ) ( not ( = ?auto_378990 ?auto_378993 ) ) ( not ( = ?auto_378990 ?auto_378994 ) ) ( not ( = ?auto_378990 ?auto_378995 ) ) ( not ( = ?auto_378990 ?auto_378996 ) ) ( not ( = ?auto_378990 ?auto_378997 ) ) ( not ( = ?auto_378990 ?auto_378998 ) ) ( not ( = ?auto_378991 ?auto_378992 ) ) ( not ( = ?auto_378991 ?auto_378993 ) ) ( not ( = ?auto_378991 ?auto_378994 ) ) ( not ( = ?auto_378991 ?auto_378995 ) ) ( not ( = ?auto_378991 ?auto_378996 ) ) ( not ( = ?auto_378991 ?auto_378997 ) ) ( not ( = ?auto_378991 ?auto_378998 ) ) ( not ( = ?auto_378992 ?auto_378993 ) ) ( not ( = ?auto_378992 ?auto_378994 ) ) ( not ( = ?auto_378992 ?auto_378995 ) ) ( not ( = ?auto_378992 ?auto_378996 ) ) ( not ( = ?auto_378992 ?auto_378997 ) ) ( not ( = ?auto_378992 ?auto_378998 ) ) ( not ( = ?auto_378993 ?auto_378994 ) ) ( not ( = ?auto_378993 ?auto_378995 ) ) ( not ( = ?auto_378993 ?auto_378996 ) ) ( not ( = ?auto_378993 ?auto_378997 ) ) ( not ( = ?auto_378993 ?auto_378998 ) ) ( not ( = ?auto_378994 ?auto_378995 ) ) ( not ( = ?auto_378994 ?auto_378996 ) ) ( not ( = ?auto_378994 ?auto_378997 ) ) ( not ( = ?auto_378994 ?auto_378998 ) ) ( not ( = ?auto_378995 ?auto_378996 ) ) ( not ( = ?auto_378995 ?auto_378997 ) ) ( not ( = ?auto_378995 ?auto_378998 ) ) ( not ( = ?auto_378996 ?auto_378997 ) ) ( not ( = ?auto_378996 ?auto_378998 ) ) ( not ( = ?auto_378997 ?auto_378998 ) ) ( ON ?auto_378996 ?auto_378997 ) ( ON ?auto_378995 ?auto_378996 ) ( ON ?auto_378994 ?auto_378995 ) ( ON ?auto_378993 ?auto_378994 ) ( ON ?auto_378992 ?auto_378993 ) ( ON ?auto_378991 ?auto_378992 ) ( ON ?auto_378990 ?auto_378991 ) ( ON ?auto_378989 ?auto_378990 ) ( ON ?auto_378988 ?auto_378989 ) ( ON ?auto_378987 ?auto_378988 ) ( ON ?auto_378986 ?auto_378987 ) ( CLEAR ?auto_378986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_378986 )
      ( MAKE-12PILE ?auto_378986 ?auto_378987 ?auto_378988 ?auto_378989 ?auto_378990 ?auto_378991 ?auto_378992 ?auto_378993 ?auto_378994 ?auto_378995 ?auto_378996 ?auto_378997 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_379011 - BLOCK
      ?auto_379012 - BLOCK
      ?auto_379013 - BLOCK
      ?auto_379014 - BLOCK
      ?auto_379015 - BLOCK
      ?auto_379016 - BLOCK
      ?auto_379017 - BLOCK
      ?auto_379018 - BLOCK
      ?auto_379019 - BLOCK
      ?auto_379020 - BLOCK
      ?auto_379021 - BLOCK
      ?auto_379022 - BLOCK
    )
    :vars
    (
      ?auto_379023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379022 ?auto_379023 ) ( not ( = ?auto_379011 ?auto_379012 ) ) ( not ( = ?auto_379011 ?auto_379013 ) ) ( not ( = ?auto_379011 ?auto_379014 ) ) ( not ( = ?auto_379011 ?auto_379015 ) ) ( not ( = ?auto_379011 ?auto_379016 ) ) ( not ( = ?auto_379011 ?auto_379017 ) ) ( not ( = ?auto_379011 ?auto_379018 ) ) ( not ( = ?auto_379011 ?auto_379019 ) ) ( not ( = ?auto_379011 ?auto_379020 ) ) ( not ( = ?auto_379011 ?auto_379021 ) ) ( not ( = ?auto_379011 ?auto_379022 ) ) ( not ( = ?auto_379011 ?auto_379023 ) ) ( not ( = ?auto_379012 ?auto_379013 ) ) ( not ( = ?auto_379012 ?auto_379014 ) ) ( not ( = ?auto_379012 ?auto_379015 ) ) ( not ( = ?auto_379012 ?auto_379016 ) ) ( not ( = ?auto_379012 ?auto_379017 ) ) ( not ( = ?auto_379012 ?auto_379018 ) ) ( not ( = ?auto_379012 ?auto_379019 ) ) ( not ( = ?auto_379012 ?auto_379020 ) ) ( not ( = ?auto_379012 ?auto_379021 ) ) ( not ( = ?auto_379012 ?auto_379022 ) ) ( not ( = ?auto_379012 ?auto_379023 ) ) ( not ( = ?auto_379013 ?auto_379014 ) ) ( not ( = ?auto_379013 ?auto_379015 ) ) ( not ( = ?auto_379013 ?auto_379016 ) ) ( not ( = ?auto_379013 ?auto_379017 ) ) ( not ( = ?auto_379013 ?auto_379018 ) ) ( not ( = ?auto_379013 ?auto_379019 ) ) ( not ( = ?auto_379013 ?auto_379020 ) ) ( not ( = ?auto_379013 ?auto_379021 ) ) ( not ( = ?auto_379013 ?auto_379022 ) ) ( not ( = ?auto_379013 ?auto_379023 ) ) ( not ( = ?auto_379014 ?auto_379015 ) ) ( not ( = ?auto_379014 ?auto_379016 ) ) ( not ( = ?auto_379014 ?auto_379017 ) ) ( not ( = ?auto_379014 ?auto_379018 ) ) ( not ( = ?auto_379014 ?auto_379019 ) ) ( not ( = ?auto_379014 ?auto_379020 ) ) ( not ( = ?auto_379014 ?auto_379021 ) ) ( not ( = ?auto_379014 ?auto_379022 ) ) ( not ( = ?auto_379014 ?auto_379023 ) ) ( not ( = ?auto_379015 ?auto_379016 ) ) ( not ( = ?auto_379015 ?auto_379017 ) ) ( not ( = ?auto_379015 ?auto_379018 ) ) ( not ( = ?auto_379015 ?auto_379019 ) ) ( not ( = ?auto_379015 ?auto_379020 ) ) ( not ( = ?auto_379015 ?auto_379021 ) ) ( not ( = ?auto_379015 ?auto_379022 ) ) ( not ( = ?auto_379015 ?auto_379023 ) ) ( not ( = ?auto_379016 ?auto_379017 ) ) ( not ( = ?auto_379016 ?auto_379018 ) ) ( not ( = ?auto_379016 ?auto_379019 ) ) ( not ( = ?auto_379016 ?auto_379020 ) ) ( not ( = ?auto_379016 ?auto_379021 ) ) ( not ( = ?auto_379016 ?auto_379022 ) ) ( not ( = ?auto_379016 ?auto_379023 ) ) ( not ( = ?auto_379017 ?auto_379018 ) ) ( not ( = ?auto_379017 ?auto_379019 ) ) ( not ( = ?auto_379017 ?auto_379020 ) ) ( not ( = ?auto_379017 ?auto_379021 ) ) ( not ( = ?auto_379017 ?auto_379022 ) ) ( not ( = ?auto_379017 ?auto_379023 ) ) ( not ( = ?auto_379018 ?auto_379019 ) ) ( not ( = ?auto_379018 ?auto_379020 ) ) ( not ( = ?auto_379018 ?auto_379021 ) ) ( not ( = ?auto_379018 ?auto_379022 ) ) ( not ( = ?auto_379018 ?auto_379023 ) ) ( not ( = ?auto_379019 ?auto_379020 ) ) ( not ( = ?auto_379019 ?auto_379021 ) ) ( not ( = ?auto_379019 ?auto_379022 ) ) ( not ( = ?auto_379019 ?auto_379023 ) ) ( not ( = ?auto_379020 ?auto_379021 ) ) ( not ( = ?auto_379020 ?auto_379022 ) ) ( not ( = ?auto_379020 ?auto_379023 ) ) ( not ( = ?auto_379021 ?auto_379022 ) ) ( not ( = ?auto_379021 ?auto_379023 ) ) ( not ( = ?auto_379022 ?auto_379023 ) ) ( ON ?auto_379021 ?auto_379022 ) ( ON ?auto_379020 ?auto_379021 ) ( ON ?auto_379019 ?auto_379020 ) ( ON ?auto_379018 ?auto_379019 ) ( ON ?auto_379017 ?auto_379018 ) ( ON ?auto_379016 ?auto_379017 ) ( ON ?auto_379015 ?auto_379016 ) ( ON ?auto_379014 ?auto_379015 ) ( ON ?auto_379013 ?auto_379014 ) ( ON ?auto_379012 ?auto_379013 ) ( ON ?auto_379011 ?auto_379012 ) ( CLEAR ?auto_379011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_379011 )
      ( MAKE-12PILE ?auto_379011 ?auto_379012 ?auto_379013 ?auto_379014 ?auto_379015 ?auto_379016 ?auto_379017 ?auto_379018 ?auto_379019 ?auto_379020 ?auto_379021 ?auto_379022 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379037 - BLOCK
      ?auto_379038 - BLOCK
      ?auto_379039 - BLOCK
      ?auto_379040 - BLOCK
      ?auto_379041 - BLOCK
      ?auto_379042 - BLOCK
      ?auto_379043 - BLOCK
      ?auto_379044 - BLOCK
      ?auto_379045 - BLOCK
      ?auto_379046 - BLOCK
      ?auto_379047 - BLOCK
      ?auto_379048 - BLOCK
      ?auto_379049 - BLOCK
    )
    :vars
    (
      ?auto_379050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_379048 ) ( ON ?auto_379049 ?auto_379050 ) ( CLEAR ?auto_379049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_379037 ) ( ON ?auto_379038 ?auto_379037 ) ( ON ?auto_379039 ?auto_379038 ) ( ON ?auto_379040 ?auto_379039 ) ( ON ?auto_379041 ?auto_379040 ) ( ON ?auto_379042 ?auto_379041 ) ( ON ?auto_379043 ?auto_379042 ) ( ON ?auto_379044 ?auto_379043 ) ( ON ?auto_379045 ?auto_379044 ) ( ON ?auto_379046 ?auto_379045 ) ( ON ?auto_379047 ?auto_379046 ) ( ON ?auto_379048 ?auto_379047 ) ( not ( = ?auto_379037 ?auto_379038 ) ) ( not ( = ?auto_379037 ?auto_379039 ) ) ( not ( = ?auto_379037 ?auto_379040 ) ) ( not ( = ?auto_379037 ?auto_379041 ) ) ( not ( = ?auto_379037 ?auto_379042 ) ) ( not ( = ?auto_379037 ?auto_379043 ) ) ( not ( = ?auto_379037 ?auto_379044 ) ) ( not ( = ?auto_379037 ?auto_379045 ) ) ( not ( = ?auto_379037 ?auto_379046 ) ) ( not ( = ?auto_379037 ?auto_379047 ) ) ( not ( = ?auto_379037 ?auto_379048 ) ) ( not ( = ?auto_379037 ?auto_379049 ) ) ( not ( = ?auto_379037 ?auto_379050 ) ) ( not ( = ?auto_379038 ?auto_379039 ) ) ( not ( = ?auto_379038 ?auto_379040 ) ) ( not ( = ?auto_379038 ?auto_379041 ) ) ( not ( = ?auto_379038 ?auto_379042 ) ) ( not ( = ?auto_379038 ?auto_379043 ) ) ( not ( = ?auto_379038 ?auto_379044 ) ) ( not ( = ?auto_379038 ?auto_379045 ) ) ( not ( = ?auto_379038 ?auto_379046 ) ) ( not ( = ?auto_379038 ?auto_379047 ) ) ( not ( = ?auto_379038 ?auto_379048 ) ) ( not ( = ?auto_379038 ?auto_379049 ) ) ( not ( = ?auto_379038 ?auto_379050 ) ) ( not ( = ?auto_379039 ?auto_379040 ) ) ( not ( = ?auto_379039 ?auto_379041 ) ) ( not ( = ?auto_379039 ?auto_379042 ) ) ( not ( = ?auto_379039 ?auto_379043 ) ) ( not ( = ?auto_379039 ?auto_379044 ) ) ( not ( = ?auto_379039 ?auto_379045 ) ) ( not ( = ?auto_379039 ?auto_379046 ) ) ( not ( = ?auto_379039 ?auto_379047 ) ) ( not ( = ?auto_379039 ?auto_379048 ) ) ( not ( = ?auto_379039 ?auto_379049 ) ) ( not ( = ?auto_379039 ?auto_379050 ) ) ( not ( = ?auto_379040 ?auto_379041 ) ) ( not ( = ?auto_379040 ?auto_379042 ) ) ( not ( = ?auto_379040 ?auto_379043 ) ) ( not ( = ?auto_379040 ?auto_379044 ) ) ( not ( = ?auto_379040 ?auto_379045 ) ) ( not ( = ?auto_379040 ?auto_379046 ) ) ( not ( = ?auto_379040 ?auto_379047 ) ) ( not ( = ?auto_379040 ?auto_379048 ) ) ( not ( = ?auto_379040 ?auto_379049 ) ) ( not ( = ?auto_379040 ?auto_379050 ) ) ( not ( = ?auto_379041 ?auto_379042 ) ) ( not ( = ?auto_379041 ?auto_379043 ) ) ( not ( = ?auto_379041 ?auto_379044 ) ) ( not ( = ?auto_379041 ?auto_379045 ) ) ( not ( = ?auto_379041 ?auto_379046 ) ) ( not ( = ?auto_379041 ?auto_379047 ) ) ( not ( = ?auto_379041 ?auto_379048 ) ) ( not ( = ?auto_379041 ?auto_379049 ) ) ( not ( = ?auto_379041 ?auto_379050 ) ) ( not ( = ?auto_379042 ?auto_379043 ) ) ( not ( = ?auto_379042 ?auto_379044 ) ) ( not ( = ?auto_379042 ?auto_379045 ) ) ( not ( = ?auto_379042 ?auto_379046 ) ) ( not ( = ?auto_379042 ?auto_379047 ) ) ( not ( = ?auto_379042 ?auto_379048 ) ) ( not ( = ?auto_379042 ?auto_379049 ) ) ( not ( = ?auto_379042 ?auto_379050 ) ) ( not ( = ?auto_379043 ?auto_379044 ) ) ( not ( = ?auto_379043 ?auto_379045 ) ) ( not ( = ?auto_379043 ?auto_379046 ) ) ( not ( = ?auto_379043 ?auto_379047 ) ) ( not ( = ?auto_379043 ?auto_379048 ) ) ( not ( = ?auto_379043 ?auto_379049 ) ) ( not ( = ?auto_379043 ?auto_379050 ) ) ( not ( = ?auto_379044 ?auto_379045 ) ) ( not ( = ?auto_379044 ?auto_379046 ) ) ( not ( = ?auto_379044 ?auto_379047 ) ) ( not ( = ?auto_379044 ?auto_379048 ) ) ( not ( = ?auto_379044 ?auto_379049 ) ) ( not ( = ?auto_379044 ?auto_379050 ) ) ( not ( = ?auto_379045 ?auto_379046 ) ) ( not ( = ?auto_379045 ?auto_379047 ) ) ( not ( = ?auto_379045 ?auto_379048 ) ) ( not ( = ?auto_379045 ?auto_379049 ) ) ( not ( = ?auto_379045 ?auto_379050 ) ) ( not ( = ?auto_379046 ?auto_379047 ) ) ( not ( = ?auto_379046 ?auto_379048 ) ) ( not ( = ?auto_379046 ?auto_379049 ) ) ( not ( = ?auto_379046 ?auto_379050 ) ) ( not ( = ?auto_379047 ?auto_379048 ) ) ( not ( = ?auto_379047 ?auto_379049 ) ) ( not ( = ?auto_379047 ?auto_379050 ) ) ( not ( = ?auto_379048 ?auto_379049 ) ) ( not ( = ?auto_379048 ?auto_379050 ) ) ( not ( = ?auto_379049 ?auto_379050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_379049 ?auto_379050 )
      ( !STACK ?auto_379049 ?auto_379048 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379064 - BLOCK
      ?auto_379065 - BLOCK
      ?auto_379066 - BLOCK
      ?auto_379067 - BLOCK
      ?auto_379068 - BLOCK
      ?auto_379069 - BLOCK
      ?auto_379070 - BLOCK
      ?auto_379071 - BLOCK
      ?auto_379072 - BLOCK
      ?auto_379073 - BLOCK
      ?auto_379074 - BLOCK
      ?auto_379075 - BLOCK
      ?auto_379076 - BLOCK
    )
    :vars
    (
      ?auto_379077 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_379075 ) ( ON ?auto_379076 ?auto_379077 ) ( CLEAR ?auto_379076 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_379064 ) ( ON ?auto_379065 ?auto_379064 ) ( ON ?auto_379066 ?auto_379065 ) ( ON ?auto_379067 ?auto_379066 ) ( ON ?auto_379068 ?auto_379067 ) ( ON ?auto_379069 ?auto_379068 ) ( ON ?auto_379070 ?auto_379069 ) ( ON ?auto_379071 ?auto_379070 ) ( ON ?auto_379072 ?auto_379071 ) ( ON ?auto_379073 ?auto_379072 ) ( ON ?auto_379074 ?auto_379073 ) ( ON ?auto_379075 ?auto_379074 ) ( not ( = ?auto_379064 ?auto_379065 ) ) ( not ( = ?auto_379064 ?auto_379066 ) ) ( not ( = ?auto_379064 ?auto_379067 ) ) ( not ( = ?auto_379064 ?auto_379068 ) ) ( not ( = ?auto_379064 ?auto_379069 ) ) ( not ( = ?auto_379064 ?auto_379070 ) ) ( not ( = ?auto_379064 ?auto_379071 ) ) ( not ( = ?auto_379064 ?auto_379072 ) ) ( not ( = ?auto_379064 ?auto_379073 ) ) ( not ( = ?auto_379064 ?auto_379074 ) ) ( not ( = ?auto_379064 ?auto_379075 ) ) ( not ( = ?auto_379064 ?auto_379076 ) ) ( not ( = ?auto_379064 ?auto_379077 ) ) ( not ( = ?auto_379065 ?auto_379066 ) ) ( not ( = ?auto_379065 ?auto_379067 ) ) ( not ( = ?auto_379065 ?auto_379068 ) ) ( not ( = ?auto_379065 ?auto_379069 ) ) ( not ( = ?auto_379065 ?auto_379070 ) ) ( not ( = ?auto_379065 ?auto_379071 ) ) ( not ( = ?auto_379065 ?auto_379072 ) ) ( not ( = ?auto_379065 ?auto_379073 ) ) ( not ( = ?auto_379065 ?auto_379074 ) ) ( not ( = ?auto_379065 ?auto_379075 ) ) ( not ( = ?auto_379065 ?auto_379076 ) ) ( not ( = ?auto_379065 ?auto_379077 ) ) ( not ( = ?auto_379066 ?auto_379067 ) ) ( not ( = ?auto_379066 ?auto_379068 ) ) ( not ( = ?auto_379066 ?auto_379069 ) ) ( not ( = ?auto_379066 ?auto_379070 ) ) ( not ( = ?auto_379066 ?auto_379071 ) ) ( not ( = ?auto_379066 ?auto_379072 ) ) ( not ( = ?auto_379066 ?auto_379073 ) ) ( not ( = ?auto_379066 ?auto_379074 ) ) ( not ( = ?auto_379066 ?auto_379075 ) ) ( not ( = ?auto_379066 ?auto_379076 ) ) ( not ( = ?auto_379066 ?auto_379077 ) ) ( not ( = ?auto_379067 ?auto_379068 ) ) ( not ( = ?auto_379067 ?auto_379069 ) ) ( not ( = ?auto_379067 ?auto_379070 ) ) ( not ( = ?auto_379067 ?auto_379071 ) ) ( not ( = ?auto_379067 ?auto_379072 ) ) ( not ( = ?auto_379067 ?auto_379073 ) ) ( not ( = ?auto_379067 ?auto_379074 ) ) ( not ( = ?auto_379067 ?auto_379075 ) ) ( not ( = ?auto_379067 ?auto_379076 ) ) ( not ( = ?auto_379067 ?auto_379077 ) ) ( not ( = ?auto_379068 ?auto_379069 ) ) ( not ( = ?auto_379068 ?auto_379070 ) ) ( not ( = ?auto_379068 ?auto_379071 ) ) ( not ( = ?auto_379068 ?auto_379072 ) ) ( not ( = ?auto_379068 ?auto_379073 ) ) ( not ( = ?auto_379068 ?auto_379074 ) ) ( not ( = ?auto_379068 ?auto_379075 ) ) ( not ( = ?auto_379068 ?auto_379076 ) ) ( not ( = ?auto_379068 ?auto_379077 ) ) ( not ( = ?auto_379069 ?auto_379070 ) ) ( not ( = ?auto_379069 ?auto_379071 ) ) ( not ( = ?auto_379069 ?auto_379072 ) ) ( not ( = ?auto_379069 ?auto_379073 ) ) ( not ( = ?auto_379069 ?auto_379074 ) ) ( not ( = ?auto_379069 ?auto_379075 ) ) ( not ( = ?auto_379069 ?auto_379076 ) ) ( not ( = ?auto_379069 ?auto_379077 ) ) ( not ( = ?auto_379070 ?auto_379071 ) ) ( not ( = ?auto_379070 ?auto_379072 ) ) ( not ( = ?auto_379070 ?auto_379073 ) ) ( not ( = ?auto_379070 ?auto_379074 ) ) ( not ( = ?auto_379070 ?auto_379075 ) ) ( not ( = ?auto_379070 ?auto_379076 ) ) ( not ( = ?auto_379070 ?auto_379077 ) ) ( not ( = ?auto_379071 ?auto_379072 ) ) ( not ( = ?auto_379071 ?auto_379073 ) ) ( not ( = ?auto_379071 ?auto_379074 ) ) ( not ( = ?auto_379071 ?auto_379075 ) ) ( not ( = ?auto_379071 ?auto_379076 ) ) ( not ( = ?auto_379071 ?auto_379077 ) ) ( not ( = ?auto_379072 ?auto_379073 ) ) ( not ( = ?auto_379072 ?auto_379074 ) ) ( not ( = ?auto_379072 ?auto_379075 ) ) ( not ( = ?auto_379072 ?auto_379076 ) ) ( not ( = ?auto_379072 ?auto_379077 ) ) ( not ( = ?auto_379073 ?auto_379074 ) ) ( not ( = ?auto_379073 ?auto_379075 ) ) ( not ( = ?auto_379073 ?auto_379076 ) ) ( not ( = ?auto_379073 ?auto_379077 ) ) ( not ( = ?auto_379074 ?auto_379075 ) ) ( not ( = ?auto_379074 ?auto_379076 ) ) ( not ( = ?auto_379074 ?auto_379077 ) ) ( not ( = ?auto_379075 ?auto_379076 ) ) ( not ( = ?auto_379075 ?auto_379077 ) ) ( not ( = ?auto_379076 ?auto_379077 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_379076 ?auto_379077 )
      ( !STACK ?auto_379076 ?auto_379075 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379091 - BLOCK
      ?auto_379092 - BLOCK
      ?auto_379093 - BLOCK
      ?auto_379094 - BLOCK
      ?auto_379095 - BLOCK
      ?auto_379096 - BLOCK
      ?auto_379097 - BLOCK
      ?auto_379098 - BLOCK
      ?auto_379099 - BLOCK
      ?auto_379100 - BLOCK
      ?auto_379101 - BLOCK
      ?auto_379102 - BLOCK
      ?auto_379103 - BLOCK
    )
    :vars
    (
      ?auto_379104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379103 ?auto_379104 ) ( ON-TABLE ?auto_379091 ) ( ON ?auto_379092 ?auto_379091 ) ( ON ?auto_379093 ?auto_379092 ) ( ON ?auto_379094 ?auto_379093 ) ( ON ?auto_379095 ?auto_379094 ) ( ON ?auto_379096 ?auto_379095 ) ( ON ?auto_379097 ?auto_379096 ) ( ON ?auto_379098 ?auto_379097 ) ( ON ?auto_379099 ?auto_379098 ) ( ON ?auto_379100 ?auto_379099 ) ( ON ?auto_379101 ?auto_379100 ) ( not ( = ?auto_379091 ?auto_379092 ) ) ( not ( = ?auto_379091 ?auto_379093 ) ) ( not ( = ?auto_379091 ?auto_379094 ) ) ( not ( = ?auto_379091 ?auto_379095 ) ) ( not ( = ?auto_379091 ?auto_379096 ) ) ( not ( = ?auto_379091 ?auto_379097 ) ) ( not ( = ?auto_379091 ?auto_379098 ) ) ( not ( = ?auto_379091 ?auto_379099 ) ) ( not ( = ?auto_379091 ?auto_379100 ) ) ( not ( = ?auto_379091 ?auto_379101 ) ) ( not ( = ?auto_379091 ?auto_379102 ) ) ( not ( = ?auto_379091 ?auto_379103 ) ) ( not ( = ?auto_379091 ?auto_379104 ) ) ( not ( = ?auto_379092 ?auto_379093 ) ) ( not ( = ?auto_379092 ?auto_379094 ) ) ( not ( = ?auto_379092 ?auto_379095 ) ) ( not ( = ?auto_379092 ?auto_379096 ) ) ( not ( = ?auto_379092 ?auto_379097 ) ) ( not ( = ?auto_379092 ?auto_379098 ) ) ( not ( = ?auto_379092 ?auto_379099 ) ) ( not ( = ?auto_379092 ?auto_379100 ) ) ( not ( = ?auto_379092 ?auto_379101 ) ) ( not ( = ?auto_379092 ?auto_379102 ) ) ( not ( = ?auto_379092 ?auto_379103 ) ) ( not ( = ?auto_379092 ?auto_379104 ) ) ( not ( = ?auto_379093 ?auto_379094 ) ) ( not ( = ?auto_379093 ?auto_379095 ) ) ( not ( = ?auto_379093 ?auto_379096 ) ) ( not ( = ?auto_379093 ?auto_379097 ) ) ( not ( = ?auto_379093 ?auto_379098 ) ) ( not ( = ?auto_379093 ?auto_379099 ) ) ( not ( = ?auto_379093 ?auto_379100 ) ) ( not ( = ?auto_379093 ?auto_379101 ) ) ( not ( = ?auto_379093 ?auto_379102 ) ) ( not ( = ?auto_379093 ?auto_379103 ) ) ( not ( = ?auto_379093 ?auto_379104 ) ) ( not ( = ?auto_379094 ?auto_379095 ) ) ( not ( = ?auto_379094 ?auto_379096 ) ) ( not ( = ?auto_379094 ?auto_379097 ) ) ( not ( = ?auto_379094 ?auto_379098 ) ) ( not ( = ?auto_379094 ?auto_379099 ) ) ( not ( = ?auto_379094 ?auto_379100 ) ) ( not ( = ?auto_379094 ?auto_379101 ) ) ( not ( = ?auto_379094 ?auto_379102 ) ) ( not ( = ?auto_379094 ?auto_379103 ) ) ( not ( = ?auto_379094 ?auto_379104 ) ) ( not ( = ?auto_379095 ?auto_379096 ) ) ( not ( = ?auto_379095 ?auto_379097 ) ) ( not ( = ?auto_379095 ?auto_379098 ) ) ( not ( = ?auto_379095 ?auto_379099 ) ) ( not ( = ?auto_379095 ?auto_379100 ) ) ( not ( = ?auto_379095 ?auto_379101 ) ) ( not ( = ?auto_379095 ?auto_379102 ) ) ( not ( = ?auto_379095 ?auto_379103 ) ) ( not ( = ?auto_379095 ?auto_379104 ) ) ( not ( = ?auto_379096 ?auto_379097 ) ) ( not ( = ?auto_379096 ?auto_379098 ) ) ( not ( = ?auto_379096 ?auto_379099 ) ) ( not ( = ?auto_379096 ?auto_379100 ) ) ( not ( = ?auto_379096 ?auto_379101 ) ) ( not ( = ?auto_379096 ?auto_379102 ) ) ( not ( = ?auto_379096 ?auto_379103 ) ) ( not ( = ?auto_379096 ?auto_379104 ) ) ( not ( = ?auto_379097 ?auto_379098 ) ) ( not ( = ?auto_379097 ?auto_379099 ) ) ( not ( = ?auto_379097 ?auto_379100 ) ) ( not ( = ?auto_379097 ?auto_379101 ) ) ( not ( = ?auto_379097 ?auto_379102 ) ) ( not ( = ?auto_379097 ?auto_379103 ) ) ( not ( = ?auto_379097 ?auto_379104 ) ) ( not ( = ?auto_379098 ?auto_379099 ) ) ( not ( = ?auto_379098 ?auto_379100 ) ) ( not ( = ?auto_379098 ?auto_379101 ) ) ( not ( = ?auto_379098 ?auto_379102 ) ) ( not ( = ?auto_379098 ?auto_379103 ) ) ( not ( = ?auto_379098 ?auto_379104 ) ) ( not ( = ?auto_379099 ?auto_379100 ) ) ( not ( = ?auto_379099 ?auto_379101 ) ) ( not ( = ?auto_379099 ?auto_379102 ) ) ( not ( = ?auto_379099 ?auto_379103 ) ) ( not ( = ?auto_379099 ?auto_379104 ) ) ( not ( = ?auto_379100 ?auto_379101 ) ) ( not ( = ?auto_379100 ?auto_379102 ) ) ( not ( = ?auto_379100 ?auto_379103 ) ) ( not ( = ?auto_379100 ?auto_379104 ) ) ( not ( = ?auto_379101 ?auto_379102 ) ) ( not ( = ?auto_379101 ?auto_379103 ) ) ( not ( = ?auto_379101 ?auto_379104 ) ) ( not ( = ?auto_379102 ?auto_379103 ) ) ( not ( = ?auto_379102 ?auto_379104 ) ) ( not ( = ?auto_379103 ?auto_379104 ) ) ( CLEAR ?auto_379101 ) ( ON ?auto_379102 ?auto_379103 ) ( CLEAR ?auto_379102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_379091 ?auto_379092 ?auto_379093 ?auto_379094 ?auto_379095 ?auto_379096 ?auto_379097 ?auto_379098 ?auto_379099 ?auto_379100 ?auto_379101 ?auto_379102 )
      ( MAKE-13PILE ?auto_379091 ?auto_379092 ?auto_379093 ?auto_379094 ?auto_379095 ?auto_379096 ?auto_379097 ?auto_379098 ?auto_379099 ?auto_379100 ?auto_379101 ?auto_379102 ?auto_379103 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379118 - BLOCK
      ?auto_379119 - BLOCK
      ?auto_379120 - BLOCK
      ?auto_379121 - BLOCK
      ?auto_379122 - BLOCK
      ?auto_379123 - BLOCK
      ?auto_379124 - BLOCK
      ?auto_379125 - BLOCK
      ?auto_379126 - BLOCK
      ?auto_379127 - BLOCK
      ?auto_379128 - BLOCK
      ?auto_379129 - BLOCK
      ?auto_379130 - BLOCK
    )
    :vars
    (
      ?auto_379131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379130 ?auto_379131 ) ( ON-TABLE ?auto_379118 ) ( ON ?auto_379119 ?auto_379118 ) ( ON ?auto_379120 ?auto_379119 ) ( ON ?auto_379121 ?auto_379120 ) ( ON ?auto_379122 ?auto_379121 ) ( ON ?auto_379123 ?auto_379122 ) ( ON ?auto_379124 ?auto_379123 ) ( ON ?auto_379125 ?auto_379124 ) ( ON ?auto_379126 ?auto_379125 ) ( ON ?auto_379127 ?auto_379126 ) ( ON ?auto_379128 ?auto_379127 ) ( not ( = ?auto_379118 ?auto_379119 ) ) ( not ( = ?auto_379118 ?auto_379120 ) ) ( not ( = ?auto_379118 ?auto_379121 ) ) ( not ( = ?auto_379118 ?auto_379122 ) ) ( not ( = ?auto_379118 ?auto_379123 ) ) ( not ( = ?auto_379118 ?auto_379124 ) ) ( not ( = ?auto_379118 ?auto_379125 ) ) ( not ( = ?auto_379118 ?auto_379126 ) ) ( not ( = ?auto_379118 ?auto_379127 ) ) ( not ( = ?auto_379118 ?auto_379128 ) ) ( not ( = ?auto_379118 ?auto_379129 ) ) ( not ( = ?auto_379118 ?auto_379130 ) ) ( not ( = ?auto_379118 ?auto_379131 ) ) ( not ( = ?auto_379119 ?auto_379120 ) ) ( not ( = ?auto_379119 ?auto_379121 ) ) ( not ( = ?auto_379119 ?auto_379122 ) ) ( not ( = ?auto_379119 ?auto_379123 ) ) ( not ( = ?auto_379119 ?auto_379124 ) ) ( not ( = ?auto_379119 ?auto_379125 ) ) ( not ( = ?auto_379119 ?auto_379126 ) ) ( not ( = ?auto_379119 ?auto_379127 ) ) ( not ( = ?auto_379119 ?auto_379128 ) ) ( not ( = ?auto_379119 ?auto_379129 ) ) ( not ( = ?auto_379119 ?auto_379130 ) ) ( not ( = ?auto_379119 ?auto_379131 ) ) ( not ( = ?auto_379120 ?auto_379121 ) ) ( not ( = ?auto_379120 ?auto_379122 ) ) ( not ( = ?auto_379120 ?auto_379123 ) ) ( not ( = ?auto_379120 ?auto_379124 ) ) ( not ( = ?auto_379120 ?auto_379125 ) ) ( not ( = ?auto_379120 ?auto_379126 ) ) ( not ( = ?auto_379120 ?auto_379127 ) ) ( not ( = ?auto_379120 ?auto_379128 ) ) ( not ( = ?auto_379120 ?auto_379129 ) ) ( not ( = ?auto_379120 ?auto_379130 ) ) ( not ( = ?auto_379120 ?auto_379131 ) ) ( not ( = ?auto_379121 ?auto_379122 ) ) ( not ( = ?auto_379121 ?auto_379123 ) ) ( not ( = ?auto_379121 ?auto_379124 ) ) ( not ( = ?auto_379121 ?auto_379125 ) ) ( not ( = ?auto_379121 ?auto_379126 ) ) ( not ( = ?auto_379121 ?auto_379127 ) ) ( not ( = ?auto_379121 ?auto_379128 ) ) ( not ( = ?auto_379121 ?auto_379129 ) ) ( not ( = ?auto_379121 ?auto_379130 ) ) ( not ( = ?auto_379121 ?auto_379131 ) ) ( not ( = ?auto_379122 ?auto_379123 ) ) ( not ( = ?auto_379122 ?auto_379124 ) ) ( not ( = ?auto_379122 ?auto_379125 ) ) ( not ( = ?auto_379122 ?auto_379126 ) ) ( not ( = ?auto_379122 ?auto_379127 ) ) ( not ( = ?auto_379122 ?auto_379128 ) ) ( not ( = ?auto_379122 ?auto_379129 ) ) ( not ( = ?auto_379122 ?auto_379130 ) ) ( not ( = ?auto_379122 ?auto_379131 ) ) ( not ( = ?auto_379123 ?auto_379124 ) ) ( not ( = ?auto_379123 ?auto_379125 ) ) ( not ( = ?auto_379123 ?auto_379126 ) ) ( not ( = ?auto_379123 ?auto_379127 ) ) ( not ( = ?auto_379123 ?auto_379128 ) ) ( not ( = ?auto_379123 ?auto_379129 ) ) ( not ( = ?auto_379123 ?auto_379130 ) ) ( not ( = ?auto_379123 ?auto_379131 ) ) ( not ( = ?auto_379124 ?auto_379125 ) ) ( not ( = ?auto_379124 ?auto_379126 ) ) ( not ( = ?auto_379124 ?auto_379127 ) ) ( not ( = ?auto_379124 ?auto_379128 ) ) ( not ( = ?auto_379124 ?auto_379129 ) ) ( not ( = ?auto_379124 ?auto_379130 ) ) ( not ( = ?auto_379124 ?auto_379131 ) ) ( not ( = ?auto_379125 ?auto_379126 ) ) ( not ( = ?auto_379125 ?auto_379127 ) ) ( not ( = ?auto_379125 ?auto_379128 ) ) ( not ( = ?auto_379125 ?auto_379129 ) ) ( not ( = ?auto_379125 ?auto_379130 ) ) ( not ( = ?auto_379125 ?auto_379131 ) ) ( not ( = ?auto_379126 ?auto_379127 ) ) ( not ( = ?auto_379126 ?auto_379128 ) ) ( not ( = ?auto_379126 ?auto_379129 ) ) ( not ( = ?auto_379126 ?auto_379130 ) ) ( not ( = ?auto_379126 ?auto_379131 ) ) ( not ( = ?auto_379127 ?auto_379128 ) ) ( not ( = ?auto_379127 ?auto_379129 ) ) ( not ( = ?auto_379127 ?auto_379130 ) ) ( not ( = ?auto_379127 ?auto_379131 ) ) ( not ( = ?auto_379128 ?auto_379129 ) ) ( not ( = ?auto_379128 ?auto_379130 ) ) ( not ( = ?auto_379128 ?auto_379131 ) ) ( not ( = ?auto_379129 ?auto_379130 ) ) ( not ( = ?auto_379129 ?auto_379131 ) ) ( not ( = ?auto_379130 ?auto_379131 ) ) ( CLEAR ?auto_379128 ) ( ON ?auto_379129 ?auto_379130 ) ( CLEAR ?auto_379129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_379118 ?auto_379119 ?auto_379120 ?auto_379121 ?auto_379122 ?auto_379123 ?auto_379124 ?auto_379125 ?auto_379126 ?auto_379127 ?auto_379128 ?auto_379129 )
      ( MAKE-13PILE ?auto_379118 ?auto_379119 ?auto_379120 ?auto_379121 ?auto_379122 ?auto_379123 ?auto_379124 ?auto_379125 ?auto_379126 ?auto_379127 ?auto_379128 ?auto_379129 ?auto_379130 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379145 - BLOCK
      ?auto_379146 - BLOCK
      ?auto_379147 - BLOCK
      ?auto_379148 - BLOCK
      ?auto_379149 - BLOCK
      ?auto_379150 - BLOCK
      ?auto_379151 - BLOCK
      ?auto_379152 - BLOCK
      ?auto_379153 - BLOCK
      ?auto_379154 - BLOCK
      ?auto_379155 - BLOCK
      ?auto_379156 - BLOCK
      ?auto_379157 - BLOCK
    )
    :vars
    (
      ?auto_379158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379157 ?auto_379158 ) ( ON-TABLE ?auto_379145 ) ( ON ?auto_379146 ?auto_379145 ) ( ON ?auto_379147 ?auto_379146 ) ( ON ?auto_379148 ?auto_379147 ) ( ON ?auto_379149 ?auto_379148 ) ( ON ?auto_379150 ?auto_379149 ) ( ON ?auto_379151 ?auto_379150 ) ( ON ?auto_379152 ?auto_379151 ) ( ON ?auto_379153 ?auto_379152 ) ( ON ?auto_379154 ?auto_379153 ) ( not ( = ?auto_379145 ?auto_379146 ) ) ( not ( = ?auto_379145 ?auto_379147 ) ) ( not ( = ?auto_379145 ?auto_379148 ) ) ( not ( = ?auto_379145 ?auto_379149 ) ) ( not ( = ?auto_379145 ?auto_379150 ) ) ( not ( = ?auto_379145 ?auto_379151 ) ) ( not ( = ?auto_379145 ?auto_379152 ) ) ( not ( = ?auto_379145 ?auto_379153 ) ) ( not ( = ?auto_379145 ?auto_379154 ) ) ( not ( = ?auto_379145 ?auto_379155 ) ) ( not ( = ?auto_379145 ?auto_379156 ) ) ( not ( = ?auto_379145 ?auto_379157 ) ) ( not ( = ?auto_379145 ?auto_379158 ) ) ( not ( = ?auto_379146 ?auto_379147 ) ) ( not ( = ?auto_379146 ?auto_379148 ) ) ( not ( = ?auto_379146 ?auto_379149 ) ) ( not ( = ?auto_379146 ?auto_379150 ) ) ( not ( = ?auto_379146 ?auto_379151 ) ) ( not ( = ?auto_379146 ?auto_379152 ) ) ( not ( = ?auto_379146 ?auto_379153 ) ) ( not ( = ?auto_379146 ?auto_379154 ) ) ( not ( = ?auto_379146 ?auto_379155 ) ) ( not ( = ?auto_379146 ?auto_379156 ) ) ( not ( = ?auto_379146 ?auto_379157 ) ) ( not ( = ?auto_379146 ?auto_379158 ) ) ( not ( = ?auto_379147 ?auto_379148 ) ) ( not ( = ?auto_379147 ?auto_379149 ) ) ( not ( = ?auto_379147 ?auto_379150 ) ) ( not ( = ?auto_379147 ?auto_379151 ) ) ( not ( = ?auto_379147 ?auto_379152 ) ) ( not ( = ?auto_379147 ?auto_379153 ) ) ( not ( = ?auto_379147 ?auto_379154 ) ) ( not ( = ?auto_379147 ?auto_379155 ) ) ( not ( = ?auto_379147 ?auto_379156 ) ) ( not ( = ?auto_379147 ?auto_379157 ) ) ( not ( = ?auto_379147 ?auto_379158 ) ) ( not ( = ?auto_379148 ?auto_379149 ) ) ( not ( = ?auto_379148 ?auto_379150 ) ) ( not ( = ?auto_379148 ?auto_379151 ) ) ( not ( = ?auto_379148 ?auto_379152 ) ) ( not ( = ?auto_379148 ?auto_379153 ) ) ( not ( = ?auto_379148 ?auto_379154 ) ) ( not ( = ?auto_379148 ?auto_379155 ) ) ( not ( = ?auto_379148 ?auto_379156 ) ) ( not ( = ?auto_379148 ?auto_379157 ) ) ( not ( = ?auto_379148 ?auto_379158 ) ) ( not ( = ?auto_379149 ?auto_379150 ) ) ( not ( = ?auto_379149 ?auto_379151 ) ) ( not ( = ?auto_379149 ?auto_379152 ) ) ( not ( = ?auto_379149 ?auto_379153 ) ) ( not ( = ?auto_379149 ?auto_379154 ) ) ( not ( = ?auto_379149 ?auto_379155 ) ) ( not ( = ?auto_379149 ?auto_379156 ) ) ( not ( = ?auto_379149 ?auto_379157 ) ) ( not ( = ?auto_379149 ?auto_379158 ) ) ( not ( = ?auto_379150 ?auto_379151 ) ) ( not ( = ?auto_379150 ?auto_379152 ) ) ( not ( = ?auto_379150 ?auto_379153 ) ) ( not ( = ?auto_379150 ?auto_379154 ) ) ( not ( = ?auto_379150 ?auto_379155 ) ) ( not ( = ?auto_379150 ?auto_379156 ) ) ( not ( = ?auto_379150 ?auto_379157 ) ) ( not ( = ?auto_379150 ?auto_379158 ) ) ( not ( = ?auto_379151 ?auto_379152 ) ) ( not ( = ?auto_379151 ?auto_379153 ) ) ( not ( = ?auto_379151 ?auto_379154 ) ) ( not ( = ?auto_379151 ?auto_379155 ) ) ( not ( = ?auto_379151 ?auto_379156 ) ) ( not ( = ?auto_379151 ?auto_379157 ) ) ( not ( = ?auto_379151 ?auto_379158 ) ) ( not ( = ?auto_379152 ?auto_379153 ) ) ( not ( = ?auto_379152 ?auto_379154 ) ) ( not ( = ?auto_379152 ?auto_379155 ) ) ( not ( = ?auto_379152 ?auto_379156 ) ) ( not ( = ?auto_379152 ?auto_379157 ) ) ( not ( = ?auto_379152 ?auto_379158 ) ) ( not ( = ?auto_379153 ?auto_379154 ) ) ( not ( = ?auto_379153 ?auto_379155 ) ) ( not ( = ?auto_379153 ?auto_379156 ) ) ( not ( = ?auto_379153 ?auto_379157 ) ) ( not ( = ?auto_379153 ?auto_379158 ) ) ( not ( = ?auto_379154 ?auto_379155 ) ) ( not ( = ?auto_379154 ?auto_379156 ) ) ( not ( = ?auto_379154 ?auto_379157 ) ) ( not ( = ?auto_379154 ?auto_379158 ) ) ( not ( = ?auto_379155 ?auto_379156 ) ) ( not ( = ?auto_379155 ?auto_379157 ) ) ( not ( = ?auto_379155 ?auto_379158 ) ) ( not ( = ?auto_379156 ?auto_379157 ) ) ( not ( = ?auto_379156 ?auto_379158 ) ) ( not ( = ?auto_379157 ?auto_379158 ) ) ( ON ?auto_379156 ?auto_379157 ) ( CLEAR ?auto_379154 ) ( ON ?auto_379155 ?auto_379156 ) ( CLEAR ?auto_379155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_379145 ?auto_379146 ?auto_379147 ?auto_379148 ?auto_379149 ?auto_379150 ?auto_379151 ?auto_379152 ?auto_379153 ?auto_379154 ?auto_379155 )
      ( MAKE-13PILE ?auto_379145 ?auto_379146 ?auto_379147 ?auto_379148 ?auto_379149 ?auto_379150 ?auto_379151 ?auto_379152 ?auto_379153 ?auto_379154 ?auto_379155 ?auto_379156 ?auto_379157 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379172 - BLOCK
      ?auto_379173 - BLOCK
      ?auto_379174 - BLOCK
      ?auto_379175 - BLOCK
      ?auto_379176 - BLOCK
      ?auto_379177 - BLOCK
      ?auto_379178 - BLOCK
      ?auto_379179 - BLOCK
      ?auto_379180 - BLOCK
      ?auto_379181 - BLOCK
      ?auto_379182 - BLOCK
      ?auto_379183 - BLOCK
      ?auto_379184 - BLOCK
    )
    :vars
    (
      ?auto_379185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379184 ?auto_379185 ) ( ON-TABLE ?auto_379172 ) ( ON ?auto_379173 ?auto_379172 ) ( ON ?auto_379174 ?auto_379173 ) ( ON ?auto_379175 ?auto_379174 ) ( ON ?auto_379176 ?auto_379175 ) ( ON ?auto_379177 ?auto_379176 ) ( ON ?auto_379178 ?auto_379177 ) ( ON ?auto_379179 ?auto_379178 ) ( ON ?auto_379180 ?auto_379179 ) ( ON ?auto_379181 ?auto_379180 ) ( not ( = ?auto_379172 ?auto_379173 ) ) ( not ( = ?auto_379172 ?auto_379174 ) ) ( not ( = ?auto_379172 ?auto_379175 ) ) ( not ( = ?auto_379172 ?auto_379176 ) ) ( not ( = ?auto_379172 ?auto_379177 ) ) ( not ( = ?auto_379172 ?auto_379178 ) ) ( not ( = ?auto_379172 ?auto_379179 ) ) ( not ( = ?auto_379172 ?auto_379180 ) ) ( not ( = ?auto_379172 ?auto_379181 ) ) ( not ( = ?auto_379172 ?auto_379182 ) ) ( not ( = ?auto_379172 ?auto_379183 ) ) ( not ( = ?auto_379172 ?auto_379184 ) ) ( not ( = ?auto_379172 ?auto_379185 ) ) ( not ( = ?auto_379173 ?auto_379174 ) ) ( not ( = ?auto_379173 ?auto_379175 ) ) ( not ( = ?auto_379173 ?auto_379176 ) ) ( not ( = ?auto_379173 ?auto_379177 ) ) ( not ( = ?auto_379173 ?auto_379178 ) ) ( not ( = ?auto_379173 ?auto_379179 ) ) ( not ( = ?auto_379173 ?auto_379180 ) ) ( not ( = ?auto_379173 ?auto_379181 ) ) ( not ( = ?auto_379173 ?auto_379182 ) ) ( not ( = ?auto_379173 ?auto_379183 ) ) ( not ( = ?auto_379173 ?auto_379184 ) ) ( not ( = ?auto_379173 ?auto_379185 ) ) ( not ( = ?auto_379174 ?auto_379175 ) ) ( not ( = ?auto_379174 ?auto_379176 ) ) ( not ( = ?auto_379174 ?auto_379177 ) ) ( not ( = ?auto_379174 ?auto_379178 ) ) ( not ( = ?auto_379174 ?auto_379179 ) ) ( not ( = ?auto_379174 ?auto_379180 ) ) ( not ( = ?auto_379174 ?auto_379181 ) ) ( not ( = ?auto_379174 ?auto_379182 ) ) ( not ( = ?auto_379174 ?auto_379183 ) ) ( not ( = ?auto_379174 ?auto_379184 ) ) ( not ( = ?auto_379174 ?auto_379185 ) ) ( not ( = ?auto_379175 ?auto_379176 ) ) ( not ( = ?auto_379175 ?auto_379177 ) ) ( not ( = ?auto_379175 ?auto_379178 ) ) ( not ( = ?auto_379175 ?auto_379179 ) ) ( not ( = ?auto_379175 ?auto_379180 ) ) ( not ( = ?auto_379175 ?auto_379181 ) ) ( not ( = ?auto_379175 ?auto_379182 ) ) ( not ( = ?auto_379175 ?auto_379183 ) ) ( not ( = ?auto_379175 ?auto_379184 ) ) ( not ( = ?auto_379175 ?auto_379185 ) ) ( not ( = ?auto_379176 ?auto_379177 ) ) ( not ( = ?auto_379176 ?auto_379178 ) ) ( not ( = ?auto_379176 ?auto_379179 ) ) ( not ( = ?auto_379176 ?auto_379180 ) ) ( not ( = ?auto_379176 ?auto_379181 ) ) ( not ( = ?auto_379176 ?auto_379182 ) ) ( not ( = ?auto_379176 ?auto_379183 ) ) ( not ( = ?auto_379176 ?auto_379184 ) ) ( not ( = ?auto_379176 ?auto_379185 ) ) ( not ( = ?auto_379177 ?auto_379178 ) ) ( not ( = ?auto_379177 ?auto_379179 ) ) ( not ( = ?auto_379177 ?auto_379180 ) ) ( not ( = ?auto_379177 ?auto_379181 ) ) ( not ( = ?auto_379177 ?auto_379182 ) ) ( not ( = ?auto_379177 ?auto_379183 ) ) ( not ( = ?auto_379177 ?auto_379184 ) ) ( not ( = ?auto_379177 ?auto_379185 ) ) ( not ( = ?auto_379178 ?auto_379179 ) ) ( not ( = ?auto_379178 ?auto_379180 ) ) ( not ( = ?auto_379178 ?auto_379181 ) ) ( not ( = ?auto_379178 ?auto_379182 ) ) ( not ( = ?auto_379178 ?auto_379183 ) ) ( not ( = ?auto_379178 ?auto_379184 ) ) ( not ( = ?auto_379178 ?auto_379185 ) ) ( not ( = ?auto_379179 ?auto_379180 ) ) ( not ( = ?auto_379179 ?auto_379181 ) ) ( not ( = ?auto_379179 ?auto_379182 ) ) ( not ( = ?auto_379179 ?auto_379183 ) ) ( not ( = ?auto_379179 ?auto_379184 ) ) ( not ( = ?auto_379179 ?auto_379185 ) ) ( not ( = ?auto_379180 ?auto_379181 ) ) ( not ( = ?auto_379180 ?auto_379182 ) ) ( not ( = ?auto_379180 ?auto_379183 ) ) ( not ( = ?auto_379180 ?auto_379184 ) ) ( not ( = ?auto_379180 ?auto_379185 ) ) ( not ( = ?auto_379181 ?auto_379182 ) ) ( not ( = ?auto_379181 ?auto_379183 ) ) ( not ( = ?auto_379181 ?auto_379184 ) ) ( not ( = ?auto_379181 ?auto_379185 ) ) ( not ( = ?auto_379182 ?auto_379183 ) ) ( not ( = ?auto_379182 ?auto_379184 ) ) ( not ( = ?auto_379182 ?auto_379185 ) ) ( not ( = ?auto_379183 ?auto_379184 ) ) ( not ( = ?auto_379183 ?auto_379185 ) ) ( not ( = ?auto_379184 ?auto_379185 ) ) ( ON ?auto_379183 ?auto_379184 ) ( CLEAR ?auto_379181 ) ( ON ?auto_379182 ?auto_379183 ) ( CLEAR ?auto_379182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_379172 ?auto_379173 ?auto_379174 ?auto_379175 ?auto_379176 ?auto_379177 ?auto_379178 ?auto_379179 ?auto_379180 ?auto_379181 ?auto_379182 )
      ( MAKE-13PILE ?auto_379172 ?auto_379173 ?auto_379174 ?auto_379175 ?auto_379176 ?auto_379177 ?auto_379178 ?auto_379179 ?auto_379180 ?auto_379181 ?auto_379182 ?auto_379183 ?auto_379184 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379199 - BLOCK
      ?auto_379200 - BLOCK
      ?auto_379201 - BLOCK
      ?auto_379202 - BLOCK
      ?auto_379203 - BLOCK
      ?auto_379204 - BLOCK
      ?auto_379205 - BLOCK
      ?auto_379206 - BLOCK
      ?auto_379207 - BLOCK
      ?auto_379208 - BLOCK
      ?auto_379209 - BLOCK
      ?auto_379210 - BLOCK
      ?auto_379211 - BLOCK
    )
    :vars
    (
      ?auto_379212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379211 ?auto_379212 ) ( ON-TABLE ?auto_379199 ) ( ON ?auto_379200 ?auto_379199 ) ( ON ?auto_379201 ?auto_379200 ) ( ON ?auto_379202 ?auto_379201 ) ( ON ?auto_379203 ?auto_379202 ) ( ON ?auto_379204 ?auto_379203 ) ( ON ?auto_379205 ?auto_379204 ) ( ON ?auto_379206 ?auto_379205 ) ( ON ?auto_379207 ?auto_379206 ) ( not ( = ?auto_379199 ?auto_379200 ) ) ( not ( = ?auto_379199 ?auto_379201 ) ) ( not ( = ?auto_379199 ?auto_379202 ) ) ( not ( = ?auto_379199 ?auto_379203 ) ) ( not ( = ?auto_379199 ?auto_379204 ) ) ( not ( = ?auto_379199 ?auto_379205 ) ) ( not ( = ?auto_379199 ?auto_379206 ) ) ( not ( = ?auto_379199 ?auto_379207 ) ) ( not ( = ?auto_379199 ?auto_379208 ) ) ( not ( = ?auto_379199 ?auto_379209 ) ) ( not ( = ?auto_379199 ?auto_379210 ) ) ( not ( = ?auto_379199 ?auto_379211 ) ) ( not ( = ?auto_379199 ?auto_379212 ) ) ( not ( = ?auto_379200 ?auto_379201 ) ) ( not ( = ?auto_379200 ?auto_379202 ) ) ( not ( = ?auto_379200 ?auto_379203 ) ) ( not ( = ?auto_379200 ?auto_379204 ) ) ( not ( = ?auto_379200 ?auto_379205 ) ) ( not ( = ?auto_379200 ?auto_379206 ) ) ( not ( = ?auto_379200 ?auto_379207 ) ) ( not ( = ?auto_379200 ?auto_379208 ) ) ( not ( = ?auto_379200 ?auto_379209 ) ) ( not ( = ?auto_379200 ?auto_379210 ) ) ( not ( = ?auto_379200 ?auto_379211 ) ) ( not ( = ?auto_379200 ?auto_379212 ) ) ( not ( = ?auto_379201 ?auto_379202 ) ) ( not ( = ?auto_379201 ?auto_379203 ) ) ( not ( = ?auto_379201 ?auto_379204 ) ) ( not ( = ?auto_379201 ?auto_379205 ) ) ( not ( = ?auto_379201 ?auto_379206 ) ) ( not ( = ?auto_379201 ?auto_379207 ) ) ( not ( = ?auto_379201 ?auto_379208 ) ) ( not ( = ?auto_379201 ?auto_379209 ) ) ( not ( = ?auto_379201 ?auto_379210 ) ) ( not ( = ?auto_379201 ?auto_379211 ) ) ( not ( = ?auto_379201 ?auto_379212 ) ) ( not ( = ?auto_379202 ?auto_379203 ) ) ( not ( = ?auto_379202 ?auto_379204 ) ) ( not ( = ?auto_379202 ?auto_379205 ) ) ( not ( = ?auto_379202 ?auto_379206 ) ) ( not ( = ?auto_379202 ?auto_379207 ) ) ( not ( = ?auto_379202 ?auto_379208 ) ) ( not ( = ?auto_379202 ?auto_379209 ) ) ( not ( = ?auto_379202 ?auto_379210 ) ) ( not ( = ?auto_379202 ?auto_379211 ) ) ( not ( = ?auto_379202 ?auto_379212 ) ) ( not ( = ?auto_379203 ?auto_379204 ) ) ( not ( = ?auto_379203 ?auto_379205 ) ) ( not ( = ?auto_379203 ?auto_379206 ) ) ( not ( = ?auto_379203 ?auto_379207 ) ) ( not ( = ?auto_379203 ?auto_379208 ) ) ( not ( = ?auto_379203 ?auto_379209 ) ) ( not ( = ?auto_379203 ?auto_379210 ) ) ( not ( = ?auto_379203 ?auto_379211 ) ) ( not ( = ?auto_379203 ?auto_379212 ) ) ( not ( = ?auto_379204 ?auto_379205 ) ) ( not ( = ?auto_379204 ?auto_379206 ) ) ( not ( = ?auto_379204 ?auto_379207 ) ) ( not ( = ?auto_379204 ?auto_379208 ) ) ( not ( = ?auto_379204 ?auto_379209 ) ) ( not ( = ?auto_379204 ?auto_379210 ) ) ( not ( = ?auto_379204 ?auto_379211 ) ) ( not ( = ?auto_379204 ?auto_379212 ) ) ( not ( = ?auto_379205 ?auto_379206 ) ) ( not ( = ?auto_379205 ?auto_379207 ) ) ( not ( = ?auto_379205 ?auto_379208 ) ) ( not ( = ?auto_379205 ?auto_379209 ) ) ( not ( = ?auto_379205 ?auto_379210 ) ) ( not ( = ?auto_379205 ?auto_379211 ) ) ( not ( = ?auto_379205 ?auto_379212 ) ) ( not ( = ?auto_379206 ?auto_379207 ) ) ( not ( = ?auto_379206 ?auto_379208 ) ) ( not ( = ?auto_379206 ?auto_379209 ) ) ( not ( = ?auto_379206 ?auto_379210 ) ) ( not ( = ?auto_379206 ?auto_379211 ) ) ( not ( = ?auto_379206 ?auto_379212 ) ) ( not ( = ?auto_379207 ?auto_379208 ) ) ( not ( = ?auto_379207 ?auto_379209 ) ) ( not ( = ?auto_379207 ?auto_379210 ) ) ( not ( = ?auto_379207 ?auto_379211 ) ) ( not ( = ?auto_379207 ?auto_379212 ) ) ( not ( = ?auto_379208 ?auto_379209 ) ) ( not ( = ?auto_379208 ?auto_379210 ) ) ( not ( = ?auto_379208 ?auto_379211 ) ) ( not ( = ?auto_379208 ?auto_379212 ) ) ( not ( = ?auto_379209 ?auto_379210 ) ) ( not ( = ?auto_379209 ?auto_379211 ) ) ( not ( = ?auto_379209 ?auto_379212 ) ) ( not ( = ?auto_379210 ?auto_379211 ) ) ( not ( = ?auto_379210 ?auto_379212 ) ) ( not ( = ?auto_379211 ?auto_379212 ) ) ( ON ?auto_379210 ?auto_379211 ) ( ON ?auto_379209 ?auto_379210 ) ( CLEAR ?auto_379207 ) ( ON ?auto_379208 ?auto_379209 ) ( CLEAR ?auto_379208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_379199 ?auto_379200 ?auto_379201 ?auto_379202 ?auto_379203 ?auto_379204 ?auto_379205 ?auto_379206 ?auto_379207 ?auto_379208 )
      ( MAKE-13PILE ?auto_379199 ?auto_379200 ?auto_379201 ?auto_379202 ?auto_379203 ?auto_379204 ?auto_379205 ?auto_379206 ?auto_379207 ?auto_379208 ?auto_379209 ?auto_379210 ?auto_379211 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379226 - BLOCK
      ?auto_379227 - BLOCK
      ?auto_379228 - BLOCK
      ?auto_379229 - BLOCK
      ?auto_379230 - BLOCK
      ?auto_379231 - BLOCK
      ?auto_379232 - BLOCK
      ?auto_379233 - BLOCK
      ?auto_379234 - BLOCK
      ?auto_379235 - BLOCK
      ?auto_379236 - BLOCK
      ?auto_379237 - BLOCK
      ?auto_379238 - BLOCK
    )
    :vars
    (
      ?auto_379239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379238 ?auto_379239 ) ( ON-TABLE ?auto_379226 ) ( ON ?auto_379227 ?auto_379226 ) ( ON ?auto_379228 ?auto_379227 ) ( ON ?auto_379229 ?auto_379228 ) ( ON ?auto_379230 ?auto_379229 ) ( ON ?auto_379231 ?auto_379230 ) ( ON ?auto_379232 ?auto_379231 ) ( ON ?auto_379233 ?auto_379232 ) ( ON ?auto_379234 ?auto_379233 ) ( not ( = ?auto_379226 ?auto_379227 ) ) ( not ( = ?auto_379226 ?auto_379228 ) ) ( not ( = ?auto_379226 ?auto_379229 ) ) ( not ( = ?auto_379226 ?auto_379230 ) ) ( not ( = ?auto_379226 ?auto_379231 ) ) ( not ( = ?auto_379226 ?auto_379232 ) ) ( not ( = ?auto_379226 ?auto_379233 ) ) ( not ( = ?auto_379226 ?auto_379234 ) ) ( not ( = ?auto_379226 ?auto_379235 ) ) ( not ( = ?auto_379226 ?auto_379236 ) ) ( not ( = ?auto_379226 ?auto_379237 ) ) ( not ( = ?auto_379226 ?auto_379238 ) ) ( not ( = ?auto_379226 ?auto_379239 ) ) ( not ( = ?auto_379227 ?auto_379228 ) ) ( not ( = ?auto_379227 ?auto_379229 ) ) ( not ( = ?auto_379227 ?auto_379230 ) ) ( not ( = ?auto_379227 ?auto_379231 ) ) ( not ( = ?auto_379227 ?auto_379232 ) ) ( not ( = ?auto_379227 ?auto_379233 ) ) ( not ( = ?auto_379227 ?auto_379234 ) ) ( not ( = ?auto_379227 ?auto_379235 ) ) ( not ( = ?auto_379227 ?auto_379236 ) ) ( not ( = ?auto_379227 ?auto_379237 ) ) ( not ( = ?auto_379227 ?auto_379238 ) ) ( not ( = ?auto_379227 ?auto_379239 ) ) ( not ( = ?auto_379228 ?auto_379229 ) ) ( not ( = ?auto_379228 ?auto_379230 ) ) ( not ( = ?auto_379228 ?auto_379231 ) ) ( not ( = ?auto_379228 ?auto_379232 ) ) ( not ( = ?auto_379228 ?auto_379233 ) ) ( not ( = ?auto_379228 ?auto_379234 ) ) ( not ( = ?auto_379228 ?auto_379235 ) ) ( not ( = ?auto_379228 ?auto_379236 ) ) ( not ( = ?auto_379228 ?auto_379237 ) ) ( not ( = ?auto_379228 ?auto_379238 ) ) ( not ( = ?auto_379228 ?auto_379239 ) ) ( not ( = ?auto_379229 ?auto_379230 ) ) ( not ( = ?auto_379229 ?auto_379231 ) ) ( not ( = ?auto_379229 ?auto_379232 ) ) ( not ( = ?auto_379229 ?auto_379233 ) ) ( not ( = ?auto_379229 ?auto_379234 ) ) ( not ( = ?auto_379229 ?auto_379235 ) ) ( not ( = ?auto_379229 ?auto_379236 ) ) ( not ( = ?auto_379229 ?auto_379237 ) ) ( not ( = ?auto_379229 ?auto_379238 ) ) ( not ( = ?auto_379229 ?auto_379239 ) ) ( not ( = ?auto_379230 ?auto_379231 ) ) ( not ( = ?auto_379230 ?auto_379232 ) ) ( not ( = ?auto_379230 ?auto_379233 ) ) ( not ( = ?auto_379230 ?auto_379234 ) ) ( not ( = ?auto_379230 ?auto_379235 ) ) ( not ( = ?auto_379230 ?auto_379236 ) ) ( not ( = ?auto_379230 ?auto_379237 ) ) ( not ( = ?auto_379230 ?auto_379238 ) ) ( not ( = ?auto_379230 ?auto_379239 ) ) ( not ( = ?auto_379231 ?auto_379232 ) ) ( not ( = ?auto_379231 ?auto_379233 ) ) ( not ( = ?auto_379231 ?auto_379234 ) ) ( not ( = ?auto_379231 ?auto_379235 ) ) ( not ( = ?auto_379231 ?auto_379236 ) ) ( not ( = ?auto_379231 ?auto_379237 ) ) ( not ( = ?auto_379231 ?auto_379238 ) ) ( not ( = ?auto_379231 ?auto_379239 ) ) ( not ( = ?auto_379232 ?auto_379233 ) ) ( not ( = ?auto_379232 ?auto_379234 ) ) ( not ( = ?auto_379232 ?auto_379235 ) ) ( not ( = ?auto_379232 ?auto_379236 ) ) ( not ( = ?auto_379232 ?auto_379237 ) ) ( not ( = ?auto_379232 ?auto_379238 ) ) ( not ( = ?auto_379232 ?auto_379239 ) ) ( not ( = ?auto_379233 ?auto_379234 ) ) ( not ( = ?auto_379233 ?auto_379235 ) ) ( not ( = ?auto_379233 ?auto_379236 ) ) ( not ( = ?auto_379233 ?auto_379237 ) ) ( not ( = ?auto_379233 ?auto_379238 ) ) ( not ( = ?auto_379233 ?auto_379239 ) ) ( not ( = ?auto_379234 ?auto_379235 ) ) ( not ( = ?auto_379234 ?auto_379236 ) ) ( not ( = ?auto_379234 ?auto_379237 ) ) ( not ( = ?auto_379234 ?auto_379238 ) ) ( not ( = ?auto_379234 ?auto_379239 ) ) ( not ( = ?auto_379235 ?auto_379236 ) ) ( not ( = ?auto_379235 ?auto_379237 ) ) ( not ( = ?auto_379235 ?auto_379238 ) ) ( not ( = ?auto_379235 ?auto_379239 ) ) ( not ( = ?auto_379236 ?auto_379237 ) ) ( not ( = ?auto_379236 ?auto_379238 ) ) ( not ( = ?auto_379236 ?auto_379239 ) ) ( not ( = ?auto_379237 ?auto_379238 ) ) ( not ( = ?auto_379237 ?auto_379239 ) ) ( not ( = ?auto_379238 ?auto_379239 ) ) ( ON ?auto_379237 ?auto_379238 ) ( ON ?auto_379236 ?auto_379237 ) ( CLEAR ?auto_379234 ) ( ON ?auto_379235 ?auto_379236 ) ( CLEAR ?auto_379235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_379226 ?auto_379227 ?auto_379228 ?auto_379229 ?auto_379230 ?auto_379231 ?auto_379232 ?auto_379233 ?auto_379234 ?auto_379235 )
      ( MAKE-13PILE ?auto_379226 ?auto_379227 ?auto_379228 ?auto_379229 ?auto_379230 ?auto_379231 ?auto_379232 ?auto_379233 ?auto_379234 ?auto_379235 ?auto_379236 ?auto_379237 ?auto_379238 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379253 - BLOCK
      ?auto_379254 - BLOCK
      ?auto_379255 - BLOCK
      ?auto_379256 - BLOCK
      ?auto_379257 - BLOCK
      ?auto_379258 - BLOCK
      ?auto_379259 - BLOCK
      ?auto_379260 - BLOCK
      ?auto_379261 - BLOCK
      ?auto_379262 - BLOCK
      ?auto_379263 - BLOCK
      ?auto_379264 - BLOCK
      ?auto_379265 - BLOCK
    )
    :vars
    (
      ?auto_379266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379265 ?auto_379266 ) ( ON-TABLE ?auto_379253 ) ( ON ?auto_379254 ?auto_379253 ) ( ON ?auto_379255 ?auto_379254 ) ( ON ?auto_379256 ?auto_379255 ) ( ON ?auto_379257 ?auto_379256 ) ( ON ?auto_379258 ?auto_379257 ) ( ON ?auto_379259 ?auto_379258 ) ( ON ?auto_379260 ?auto_379259 ) ( not ( = ?auto_379253 ?auto_379254 ) ) ( not ( = ?auto_379253 ?auto_379255 ) ) ( not ( = ?auto_379253 ?auto_379256 ) ) ( not ( = ?auto_379253 ?auto_379257 ) ) ( not ( = ?auto_379253 ?auto_379258 ) ) ( not ( = ?auto_379253 ?auto_379259 ) ) ( not ( = ?auto_379253 ?auto_379260 ) ) ( not ( = ?auto_379253 ?auto_379261 ) ) ( not ( = ?auto_379253 ?auto_379262 ) ) ( not ( = ?auto_379253 ?auto_379263 ) ) ( not ( = ?auto_379253 ?auto_379264 ) ) ( not ( = ?auto_379253 ?auto_379265 ) ) ( not ( = ?auto_379253 ?auto_379266 ) ) ( not ( = ?auto_379254 ?auto_379255 ) ) ( not ( = ?auto_379254 ?auto_379256 ) ) ( not ( = ?auto_379254 ?auto_379257 ) ) ( not ( = ?auto_379254 ?auto_379258 ) ) ( not ( = ?auto_379254 ?auto_379259 ) ) ( not ( = ?auto_379254 ?auto_379260 ) ) ( not ( = ?auto_379254 ?auto_379261 ) ) ( not ( = ?auto_379254 ?auto_379262 ) ) ( not ( = ?auto_379254 ?auto_379263 ) ) ( not ( = ?auto_379254 ?auto_379264 ) ) ( not ( = ?auto_379254 ?auto_379265 ) ) ( not ( = ?auto_379254 ?auto_379266 ) ) ( not ( = ?auto_379255 ?auto_379256 ) ) ( not ( = ?auto_379255 ?auto_379257 ) ) ( not ( = ?auto_379255 ?auto_379258 ) ) ( not ( = ?auto_379255 ?auto_379259 ) ) ( not ( = ?auto_379255 ?auto_379260 ) ) ( not ( = ?auto_379255 ?auto_379261 ) ) ( not ( = ?auto_379255 ?auto_379262 ) ) ( not ( = ?auto_379255 ?auto_379263 ) ) ( not ( = ?auto_379255 ?auto_379264 ) ) ( not ( = ?auto_379255 ?auto_379265 ) ) ( not ( = ?auto_379255 ?auto_379266 ) ) ( not ( = ?auto_379256 ?auto_379257 ) ) ( not ( = ?auto_379256 ?auto_379258 ) ) ( not ( = ?auto_379256 ?auto_379259 ) ) ( not ( = ?auto_379256 ?auto_379260 ) ) ( not ( = ?auto_379256 ?auto_379261 ) ) ( not ( = ?auto_379256 ?auto_379262 ) ) ( not ( = ?auto_379256 ?auto_379263 ) ) ( not ( = ?auto_379256 ?auto_379264 ) ) ( not ( = ?auto_379256 ?auto_379265 ) ) ( not ( = ?auto_379256 ?auto_379266 ) ) ( not ( = ?auto_379257 ?auto_379258 ) ) ( not ( = ?auto_379257 ?auto_379259 ) ) ( not ( = ?auto_379257 ?auto_379260 ) ) ( not ( = ?auto_379257 ?auto_379261 ) ) ( not ( = ?auto_379257 ?auto_379262 ) ) ( not ( = ?auto_379257 ?auto_379263 ) ) ( not ( = ?auto_379257 ?auto_379264 ) ) ( not ( = ?auto_379257 ?auto_379265 ) ) ( not ( = ?auto_379257 ?auto_379266 ) ) ( not ( = ?auto_379258 ?auto_379259 ) ) ( not ( = ?auto_379258 ?auto_379260 ) ) ( not ( = ?auto_379258 ?auto_379261 ) ) ( not ( = ?auto_379258 ?auto_379262 ) ) ( not ( = ?auto_379258 ?auto_379263 ) ) ( not ( = ?auto_379258 ?auto_379264 ) ) ( not ( = ?auto_379258 ?auto_379265 ) ) ( not ( = ?auto_379258 ?auto_379266 ) ) ( not ( = ?auto_379259 ?auto_379260 ) ) ( not ( = ?auto_379259 ?auto_379261 ) ) ( not ( = ?auto_379259 ?auto_379262 ) ) ( not ( = ?auto_379259 ?auto_379263 ) ) ( not ( = ?auto_379259 ?auto_379264 ) ) ( not ( = ?auto_379259 ?auto_379265 ) ) ( not ( = ?auto_379259 ?auto_379266 ) ) ( not ( = ?auto_379260 ?auto_379261 ) ) ( not ( = ?auto_379260 ?auto_379262 ) ) ( not ( = ?auto_379260 ?auto_379263 ) ) ( not ( = ?auto_379260 ?auto_379264 ) ) ( not ( = ?auto_379260 ?auto_379265 ) ) ( not ( = ?auto_379260 ?auto_379266 ) ) ( not ( = ?auto_379261 ?auto_379262 ) ) ( not ( = ?auto_379261 ?auto_379263 ) ) ( not ( = ?auto_379261 ?auto_379264 ) ) ( not ( = ?auto_379261 ?auto_379265 ) ) ( not ( = ?auto_379261 ?auto_379266 ) ) ( not ( = ?auto_379262 ?auto_379263 ) ) ( not ( = ?auto_379262 ?auto_379264 ) ) ( not ( = ?auto_379262 ?auto_379265 ) ) ( not ( = ?auto_379262 ?auto_379266 ) ) ( not ( = ?auto_379263 ?auto_379264 ) ) ( not ( = ?auto_379263 ?auto_379265 ) ) ( not ( = ?auto_379263 ?auto_379266 ) ) ( not ( = ?auto_379264 ?auto_379265 ) ) ( not ( = ?auto_379264 ?auto_379266 ) ) ( not ( = ?auto_379265 ?auto_379266 ) ) ( ON ?auto_379264 ?auto_379265 ) ( ON ?auto_379263 ?auto_379264 ) ( ON ?auto_379262 ?auto_379263 ) ( CLEAR ?auto_379260 ) ( ON ?auto_379261 ?auto_379262 ) ( CLEAR ?auto_379261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_379253 ?auto_379254 ?auto_379255 ?auto_379256 ?auto_379257 ?auto_379258 ?auto_379259 ?auto_379260 ?auto_379261 )
      ( MAKE-13PILE ?auto_379253 ?auto_379254 ?auto_379255 ?auto_379256 ?auto_379257 ?auto_379258 ?auto_379259 ?auto_379260 ?auto_379261 ?auto_379262 ?auto_379263 ?auto_379264 ?auto_379265 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379280 - BLOCK
      ?auto_379281 - BLOCK
      ?auto_379282 - BLOCK
      ?auto_379283 - BLOCK
      ?auto_379284 - BLOCK
      ?auto_379285 - BLOCK
      ?auto_379286 - BLOCK
      ?auto_379287 - BLOCK
      ?auto_379288 - BLOCK
      ?auto_379289 - BLOCK
      ?auto_379290 - BLOCK
      ?auto_379291 - BLOCK
      ?auto_379292 - BLOCK
    )
    :vars
    (
      ?auto_379293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379292 ?auto_379293 ) ( ON-TABLE ?auto_379280 ) ( ON ?auto_379281 ?auto_379280 ) ( ON ?auto_379282 ?auto_379281 ) ( ON ?auto_379283 ?auto_379282 ) ( ON ?auto_379284 ?auto_379283 ) ( ON ?auto_379285 ?auto_379284 ) ( ON ?auto_379286 ?auto_379285 ) ( ON ?auto_379287 ?auto_379286 ) ( not ( = ?auto_379280 ?auto_379281 ) ) ( not ( = ?auto_379280 ?auto_379282 ) ) ( not ( = ?auto_379280 ?auto_379283 ) ) ( not ( = ?auto_379280 ?auto_379284 ) ) ( not ( = ?auto_379280 ?auto_379285 ) ) ( not ( = ?auto_379280 ?auto_379286 ) ) ( not ( = ?auto_379280 ?auto_379287 ) ) ( not ( = ?auto_379280 ?auto_379288 ) ) ( not ( = ?auto_379280 ?auto_379289 ) ) ( not ( = ?auto_379280 ?auto_379290 ) ) ( not ( = ?auto_379280 ?auto_379291 ) ) ( not ( = ?auto_379280 ?auto_379292 ) ) ( not ( = ?auto_379280 ?auto_379293 ) ) ( not ( = ?auto_379281 ?auto_379282 ) ) ( not ( = ?auto_379281 ?auto_379283 ) ) ( not ( = ?auto_379281 ?auto_379284 ) ) ( not ( = ?auto_379281 ?auto_379285 ) ) ( not ( = ?auto_379281 ?auto_379286 ) ) ( not ( = ?auto_379281 ?auto_379287 ) ) ( not ( = ?auto_379281 ?auto_379288 ) ) ( not ( = ?auto_379281 ?auto_379289 ) ) ( not ( = ?auto_379281 ?auto_379290 ) ) ( not ( = ?auto_379281 ?auto_379291 ) ) ( not ( = ?auto_379281 ?auto_379292 ) ) ( not ( = ?auto_379281 ?auto_379293 ) ) ( not ( = ?auto_379282 ?auto_379283 ) ) ( not ( = ?auto_379282 ?auto_379284 ) ) ( not ( = ?auto_379282 ?auto_379285 ) ) ( not ( = ?auto_379282 ?auto_379286 ) ) ( not ( = ?auto_379282 ?auto_379287 ) ) ( not ( = ?auto_379282 ?auto_379288 ) ) ( not ( = ?auto_379282 ?auto_379289 ) ) ( not ( = ?auto_379282 ?auto_379290 ) ) ( not ( = ?auto_379282 ?auto_379291 ) ) ( not ( = ?auto_379282 ?auto_379292 ) ) ( not ( = ?auto_379282 ?auto_379293 ) ) ( not ( = ?auto_379283 ?auto_379284 ) ) ( not ( = ?auto_379283 ?auto_379285 ) ) ( not ( = ?auto_379283 ?auto_379286 ) ) ( not ( = ?auto_379283 ?auto_379287 ) ) ( not ( = ?auto_379283 ?auto_379288 ) ) ( not ( = ?auto_379283 ?auto_379289 ) ) ( not ( = ?auto_379283 ?auto_379290 ) ) ( not ( = ?auto_379283 ?auto_379291 ) ) ( not ( = ?auto_379283 ?auto_379292 ) ) ( not ( = ?auto_379283 ?auto_379293 ) ) ( not ( = ?auto_379284 ?auto_379285 ) ) ( not ( = ?auto_379284 ?auto_379286 ) ) ( not ( = ?auto_379284 ?auto_379287 ) ) ( not ( = ?auto_379284 ?auto_379288 ) ) ( not ( = ?auto_379284 ?auto_379289 ) ) ( not ( = ?auto_379284 ?auto_379290 ) ) ( not ( = ?auto_379284 ?auto_379291 ) ) ( not ( = ?auto_379284 ?auto_379292 ) ) ( not ( = ?auto_379284 ?auto_379293 ) ) ( not ( = ?auto_379285 ?auto_379286 ) ) ( not ( = ?auto_379285 ?auto_379287 ) ) ( not ( = ?auto_379285 ?auto_379288 ) ) ( not ( = ?auto_379285 ?auto_379289 ) ) ( not ( = ?auto_379285 ?auto_379290 ) ) ( not ( = ?auto_379285 ?auto_379291 ) ) ( not ( = ?auto_379285 ?auto_379292 ) ) ( not ( = ?auto_379285 ?auto_379293 ) ) ( not ( = ?auto_379286 ?auto_379287 ) ) ( not ( = ?auto_379286 ?auto_379288 ) ) ( not ( = ?auto_379286 ?auto_379289 ) ) ( not ( = ?auto_379286 ?auto_379290 ) ) ( not ( = ?auto_379286 ?auto_379291 ) ) ( not ( = ?auto_379286 ?auto_379292 ) ) ( not ( = ?auto_379286 ?auto_379293 ) ) ( not ( = ?auto_379287 ?auto_379288 ) ) ( not ( = ?auto_379287 ?auto_379289 ) ) ( not ( = ?auto_379287 ?auto_379290 ) ) ( not ( = ?auto_379287 ?auto_379291 ) ) ( not ( = ?auto_379287 ?auto_379292 ) ) ( not ( = ?auto_379287 ?auto_379293 ) ) ( not ( = ?auto_379288 ?auto_379289 ) ) ( not ( = ?auto_379288 ?auto_379290 ) ) ( not ( = ?auto_379288 ?auto_379291 ) ) ( not ( = ?auto_379288 ?auto_379292 ) ) ( not ( = ?auto_379288 ?auto_379293 ) ) ( not ( = ?auto_379289 ?auto_379290 ) ) ( not ( = ?auto_379289 ?auto_379291 ) ) ( not ( = ?auto_379289 ?auto_379292 ) ) ( not ( = ?auto_379289 ?auto_379293 ) ) ( not ( = ?auto_379290 ?auto_379291 ) ) ( not ( = ?auto_379290 ?auto_379292 ) ) ( not ( = ?auto_379290 ?auto_379293 ) ) ( not ( = ?auto_379291 ?auto_379292 ) ) ( not ( = ?auto_379291 ?auto_379293 ) ) ( not ( = ?auto_379292 ?auto_379293 ) ) ( ON ?auto_379291 ?auto_379292 ) ( ON ?auto_379290 ?auto_379291 ) ( ON ?auto_379289 ?auto_379290 ) ( CLEAR ?auto_379287 ) ( ON ?auto_379288 ?auto_379289 ) ( CLEAR ?auto_379288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_379280 ?auto_379281 ?auto_379282 ?auto_379283 ?auto_379284 ?auto_379285 ?auto_379286 ?auto_379287 ?auto_379288 )
      ( MAKE-13PILE ?auto_379280 ?auto_379281 ?auto_379282 ?auto_379283 ?auto_379284 ?auto_379285 ?auto_379286 ?auto_379287 ?auto_379288 ?auto_379289 ?auto_379290 ?auto_379291 ?auto_379292 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379307 - BLOCK
      ?auto_379308 - BLOCK
      ?auto_379309 - BLOCK
      ?auto_379310 - BLOCK
      ?auto_379311 - BLOCK
      ?auto_379312 - BLOCK
      ?auto_379313 - BLOCK
      ?auto_379314 - BLOCK
      ?auto_379315 - BLOCK
      ?auto_379316 - BLOCK
      ?auto_379317 - BLOCK
      ?auto_379318 - BLOCK
      ?auto_379319 - BLOCK
    )
    :vars
    (
      ?auto_379320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379319 ?auto_379320 ) ( ON-TABLE ?auto_379307 ) ( ON ?auto_379308 ?auto_379307 ) ( ON ?auto_379309 ?auto_379308 ) ( ON ?auto_379310 ?auto_379309 ) ( ON ?auto_379311 ?auto_379310 ) ( ON ?auto_379312 ?auto_379311 ) ( ON ?auto_379313 ?auto_379312 ) ( not ( = ?auto_379307 ?auto_379308 ) ) ( not ( = ?auto_379307 ?auto_379309 ) ) ( not ( = ?auto_379307 ?auto_379310 ) ) ( not ( = ?auto_379307 ?auto_379311 ) ) ( not ( = ?auto_379307 ?auto_379312 ) ) ( not ( = ?auto_379307 ?auto_379313 ) ) ( not ( = ?auto_379307 ?auto_379314 ) ) ( not ( = ?auto_379307 ?auto_379315 ) ) ( not ( = ?auto_379307 ?auto_379316 ) ) ( not ( = ?auto_379307 ?auto_379317 ) ) ( not ( = ?auto_379307 ?auto_379318 ) ) ( not ( = ?auto_379307 ?auto_379319 ) ) ( not ( = ?auto_379307 ?auto_379320 ) ) ( not ( = ?auto_379308 ?auto_379309 ) ) ( not ( = ?auto_379308 ?auto_379310 ) ) ( not ( = ?auto_379308 ?auto_379311 ) ) ( not ( = ?auto_379308 ?auto_379312 ) ) ( not ( = ?auto_379308 ?auto_379313 ) ) ( not ( = ?auto_379308 ?auto_379314 ) ) ( not ( = ?auto_379308 ?auto_379315 ) ) ( not ( = ?auto_379308 ?auto_379316 ) ) ( not ( = ?auto_379308 ?auto_379317 ) ) ( not ( = ?auto_379308 ?auto_379318 ) ) ( not ( = ?auto_379308 ?auto_379319 ) ) ( not ( = ?auto_379308 ?auto_379320 ) ) ( not ( = ?auto_379309 ?auto_379310 ) ) ( not ( = ?auto_379309 ?auto_379311 ) ) ( not ( = ?auto_379309 ?auto_379312 ) ) ( not ( = ?auto_379309 ?auto_379313 ) ) ( not ( = ?auto_379309 ?auto_379314 ) ) ( not ( = ?auto_379309 ?auto_379315 ) ) ( not ( = ?auto_379309 ?auto_379316 ) ) ( not ( = ?auto_379309 ?auto_379317 ) ) ( not ( = ?auto_379309 ?auto_379318 ) ) ( not ( = ?auto_379309 ?auto_379319 ) ) ( not ( = ?auto_379309 ?auto_379320 ) ) ( not ( = ?auto_379310 ?auto_379311 ) ) ( not ( = ?auto_379310 ?auto_379312 ) ) ( not ( = ?auto_379310 ?auto_379313 ) ) ( not ( = ?auto_379310 ?auto_379314 ) ) ( not ( = ?auto_379310 ?auto_379315 ) ) ( not ( = ?auto_379310 ?auto_379316 ) ) ( not ( = ?auto_379310 ?auto_379317 ) ) ( not ( = ?auto_379310 ?auto_379318 ) ) ( not ( = ?auto_379310 ?auto_379319 ) ) ( not ( = ?auto_379310 ?auto_379320 ) ) ( not ( = ?auto_379311 ?auto_379312 ) ) ( not ( = ?auto_379311 ?auto_379313 ) ) ( not ( = ?auto_379311 ?auto_379314 ) ) ( not ( = ?auto_379311 ?auto_379315 ) ) ( not ( = ?auto_379311 ?auto_379316 ) ) ( not ( = ?auto_379311 ?auto_379317 ) ) ( not ( = ?auto_379311 ?auto_379318 ) ) ( not ( = ?auto_379311 ?auto_379319 ) ) ( not ( = ?auto_379311 ?auto_379320 ) ) ( not ( = ?auto_379312 ?auto_379313 ) ) ( not ( = ?auto_379312 ?auto_379314 ) ) ( not ( = ?auto_379312 ?auto_379315 ) ) ( not ( = ?auto_379312 ?auto_379316 ) ) ( not ( = ?auto_379312 ?auto_379317 ) ) ( not ( = ?auto_379312 ?auto_379318 ) ) ( not ( = ?auto_379312 ?auto_379319 ) ) ( not ( = ?auto_379312 ?auto_379320 ) ) ( not ( = ?auto_379313 ?auto_379314 ) ) ( not ( = ?auto_379313 ?auto_379315 ) ) ( not ( = ?auto_379313 ?auto_379316 ) ) ( not ( = ?auto_379313 ?auto_379317 ) ) ( not ( = ?auto_379313 ?auto_379318 ) ) ( not ( = ?auto_379313 ?auto_379319 ) ) ( not ( = ?auto_379313 ?auto_379320 ) ) ( not ( = ?auto_379314 ?auto_379315 ) ) ( not ( = ?auto_379314 ?auto_379316 ) ) ( not ( = ?auto_379314 ?auto_379317 ) ) ( not ( = ?auto_379314 ?auto_379318 ) ) ( not ( = ?auto_379314 ?auto_379319 ) ) ( not ( = ?auto_379314 ?auto_379320 ) ) ( not ( = ?auto_379315 ?auto_379316 ) ) ( not ( = ?auto_379315 ?auto_379317 ) ) ( not ( = ?auto_379315 ?auto_379318 ) ) ( not ( = ?auto_379315 ?auto_379319 ) ) ( not ( = ?auto_379315 ?auto_379320 ) ) ( not ( = ?auto_379316 ?auto_379317 ) ) ( not ( = ?auto_379316 ?auto_379318 ) ) ( not ( = ?auto_379316 ?auto_379319 ) ) ( not ( = ?auto_379316 ?auto_379320 ) ) ( not ( = ?auto_379317 ?auto_379318 ) ) ( not ( = ?auto_379317 ?auto_379319 ) ) ( not ( = ?auto_379317 ?auto_379320 ) ) ( not ( = ?auto_379318 ?auto_379319 ) ) ( not ( = ?auto_379318 ?auto_379320 ) ) ( not ( = ?auto_379319 ?auto_379320 ) ) ( ON ?auto_379318 ?auto_379319 ) ( ON ?auto_379317 ?auto_379318 ) ( ON ?auto_379316 ?auto_379317 ) ( ON ?auto_379315 ?auto_379316 ) ( CLEAR ?auto_379313 ) ( ON ?auto_379314 ?auto_379315 ) ( CLEAR ?auto_379314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_379307 ?auto_379308 ?auto_379309 ?auto_379310 ?auto_379311 ?auto_379312 ?auto_379313 ?auto_379314 )
      ( MAKE-13PILE ?auto_379307 ?auto_379308 ?auto_379309 ?auto_379310 ?auto_379311 ?auto_379312 ?auto_379313 ?auto_379314 ?auto_379315 ?auto_379316 ?auto_379317 ?auto_379318 ?auto_379319 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379334 - BLOCK
      ?auto_379335 - BLOCK
      ?auto_379336 - BLOCK
      ?auto_379337 - BLOCK
      ?auto_379338 - BLOCK
      ?auto_379339 - BLOCK
      ?auto_379340 - BLOCK
      ?auto_379341 - BLOCK
      ?auto_379342 - BLOCK
      ?auto_379343 - BLOCK
      ?auto_379344 - BLOCK
      ?auto_379345 - BLOCK
      ?auto_379346 - BLOCK
    )
    :vars
    (
      ?auto_379347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379346 ?auto_379347 ) ( ON-TABLE ?auto_379334 ) ( ON ?auto_379335 ?auto_379334 ) ( ON ?auto_379336 ?auto_379335 ) ( ON ?auto_379337 ?auto_379336 ) ( ON ?auto_379338 ?auto_379337 ) ( ON ?auto_379339 ?auto_379338 ) ( ON ?auto_379340 ?auto_379339 ) ( not ( = ?auto_379334 ?auto_379335 ) ) ( not ( = ?auto_379334 ?auto_379336 ) ) ( not ( = ?auto_379334 ?auto_379337 ) ) ( not ( = ?auto_379334 ?auto_379338 ) ) ( not ( = ?auto_379334 ?auto_379339 ) ) ( not ( = ?auto_379334 ?auto_379340 ) ) ( not ( = ?auto_379334 ?auto_379341 ) ) ( not ( = ?auto_379334 ?auto_379342 ) ) ( not ( = ?auto_379334 ?auto_379343 ) ) ( not ( = ?auto_379334 ?auto_379344 ) ) ( not ( = ?auto_379334 ?auto_379345 ) ) ( not ( = ?auto_379334 ?auto_379346 ) ) ( not ( = ?auto_379334 ?auto_379347 ) ) ( not ( = ?auto_379335 ?auto_379336 ) ) ( not ( = ?auto_379335 ?auto_379337 ) ) ( not ( = ?auto_379335 ?auto_379338 ) ) ( not ( = ?auto_379335 ?auto_379339 ) ) ( not ( = ?auto_379335 ?auto_379340 ) ) ( not ( = ?auto_379335 ?auto_379341 ) ) ( not ( = ?auto_379335 ?auto_379342 ) ) ( not ( = ?auto_379335 ?auto_379343 ) ) ( not ( = ?auto_379335 ?auto_379344 ) ) ( not ( = ?auto_379335 ?auto_379345 ) ) ( not ( = ?auto_379335 ?auto_379346 ) ) ( not ( = ?auto_379335 ?auto_379347 ) ) ( not ( = ?auto_379336 ?auto_379337 ) ) ( not ( = ?auto_379336 ?auto_379338 ) ) ( not ( = ?auto_379336 ?auto_379339 ) ) ( not ( = ?auto_379336 ?auto_379340 ) ) ( not ( = ?auto_379336 ?auto_379341 ) ) ( not ( = ?auto_379336 ?auto_379342 ) ) ( not ( = ?auto_379336 ?auto_379343 ) ) ( not ( = ?auto_379336 ?auto_379344 ) ) ( not ( = ?auto_379336 ?auto_379345 ) ) ( not ( = ?auto_379336 ?auto_379346 ) ) ( not ( = ?auto_379336 ?auto_379347 ) ) ( not ( = ?auto_379337 ?auto_379338 ) ) ( not ( = ?auto_379337 ?auto_379339 ) ) ( not ( = ?auto_379337 ?auto_379340 ) ) ( not ( = ?auto_379337 ?auto_379341 ) ) ( not ( = ?auto_379337 ?auto_379342 ) ) ( not ( = ?auto_379337 ?auto_379343 ) ) ( not ( = ?auto_379337 ?auto_379344 ) ) ( not ( = ?auto_379337 ?auto_379345 ) ) ( not ( = ?auto_379337 ?auto_379346 ) ) ( not ( = ?auto_379337 ?auto_379347 ) ) ( not ( = ?auto_379338 ?auto_379339 ) ) ( not ( = ?auto_379338 ?auto_379340 ) ) ( not ( = ?auto_379338 ?auto_379341 ) ) ( not ( = ?auto_379338 ?auto_379342 ) ) ( not ( = ?auto_379338 ?auto_379343 ) ) ( not ( = ?auto_379338 ?auto_379344 ) ) ( not ( = ?auto_379338 ?auto_379345 ) ) ( not ( = ?auto_379338 ?auto_379346 ) ) ( not ( = ?auto_379338 ?auto_379347 ) ) ( not ( = ?auto_379339 ?auto_379340 ) ) ( not ( = ?auto_379339 ?auto_379341 ) ) ( not ( = ?auto_379339 ?auto_379342 ) ) ( not ( = ?auto_379339 ?auto_379343 ) ) ( not ( = ?auto_379339 ?auto_379344 ) ) ( not ( = ?auto_379339 ?auto_379345 ) ) ( not ( = ?auto_379339 ?auto_379346 ) ) ( not ( = ?auto_379339 ?auto_379347 ) ) ( not ( = ?auto_379340 ?auto_379341 ) ) ( not ( = ?auto_379340 ?auto_379342 ) ) ( not ( = ?auto_379340 ?auto_379343 ) ) ( not ( = ?auto_379340 ?auto_379344 ) ) ( not ( = ?auto_379340 ?auto_379345 ) ) ( not ( = ?auto_379340 ?auto_379346 ) ) ( not ( = ?auto_379340 ?auto_379347 ) ) ( not ( = ?auto_379341 ?auto_379342 ) ) ( not ( = ?auto_379341 ?auto_379343 ) ) ( not ( = ?auto_379341 ?auto_379344 ) ) ( not ( = ?auto_379341 ?auto_379345 ) ) ( not ( = ?auto_379341 ?auto_379346 ) ) ( not ( = ?auto_379341 ?auto_379347 ) ) ( not ( = ?auto_379342 ?auto_379343 ) ) ( not ( = ?auto_379342 ?auto_379344 ) ) ( not ( = ?auto_379342 ?auto_379345 ) ) ( not ( = ?auto_379342 ?auto_379346 ) ) ( not ( = ?auto_379342 ?auto_379347 ) ) ( not ( = ?auto_379343 ?auto_379344 ) ) ( not ( = ?auto_379343 ?auto_379345 ) ) ( not ( = ?auto_379343 ?auto_379346 ) ) ( not ( = ?auto_379343 ?auto_379347 ) ) ( not ( = ?auto_379344 ?auto_379345 ) ) ( not ( = ?auto_379344 ?auto_379346 ) ) ( not ( = ?auto_379344 ?auto_379347 ) ) ( not ( = ?auto_379345 ?auto_379346 ) ) ( not ( = ?auto_379345 ?auto_379347 ) ) ( not ( = ?auto_379346 ?auto_379347 ) ) ( ON ?auto_379345 ?auto_379346 ) ( ON ?auto_379344 ?auto_379345 ) ( ON ?auto_379343 ?auto_379344 ) ( ON ?auto_379342 ?auto_379343 ) ( CLEAR ?auto_379340 ) ( ON ?auto_379341 ?auto_379342 ) ( CLEAR ?auto_379341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_379334 ?auto_379335 ?auto_379336 ?auto_379337 ?auto_379338 ?auto_379339 ?auto_379340 ?auto_379341 )
      ( MAKE-13PILE ?auto_379334 ?auto_379335 ?auto_379336 ?auto_379337 ?auto_379338 ?auto_379339 ?auto_379340 ?auto_379341 ?auto_379342 ?auto_379343 ?auto_379344 ?auto_379345 ?auto_379346 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379361 - BLOCK
      ?auto_379362 - BLOCK
      ?auto_379363 - BLOCK
      ?auto_379364 - BLOCK
      ?auto_379365 - BLOCK
      ?auto_379366 - BLOCK
      ?auto_379367 - BLOCK
      ?auto_379368 - BLOCK
      ?auto_379369 - BLOCK
      ?auto_379370 - BLOCK
      ?auto_379371 - BLOCK
      ?auto_379372 - BLOCK
      ?auto_379373 - BLOCK
    )
    :vars
    (
      ?auto_379374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379373 ?auto_379374 ) ( ON-TABLE ?auto_379361 ) ( ON ?auto_379362 ?auto_379361 ) ( ON ?auto_379363 ?auto_379362 ) ( ON ?auto_379364 ?auto_379363 ) ( ON ?auto_379365 ?auto_379364 ) ( ON ?auto_379366 ?auto_379365 ) ( not ( = ?auto_379361 ?auto_379362 ) ) ( not ( = ?auto_379361 ?auto_379363 ) ) ( not ( = ?auto_379361 ?auto_379364 ) ) ( not ( = ?auto_379361 ?auto_379365 ) ) ( not ( = ?auto_379361 ?auto_379366 ) ) ( not ( = ?auto_379361 ?auto_379367 ) ) ( not ( = ?auto_379361 ?auto_379368 ) ) ( not ( = ?auto_379361 ?auto_379369 ) ) ( not ( = ?auto_379361 ?auto_379370 ) ) ( not ( = ?auto_379361 ?auto_379371 ) ) ( not ( = ?auto_379361 ?auto_379372 ) ) ( not ( = ?auto_379361 ?auto_379373 ) ) ( not ( = ?auto_379361 ?auto_379374 ) ) ( not ( = ?auto_379362 ?auto_379363 ) ) ( not ( = ?auto_379362 ?auto_379364 ) ) ( not ( = ?auto_379362 ?auto_379365 ) ) ( not ( = ?auto_379362 ?auto_379366 ) ) ( not ( = ?auto_379362 ?auto_379367 ) ) ( not ( = ?auto_379362 ?auto_379368 ) ) ( not ( = ?auto_379362 ?auto_379369 ) ) ( not ( = ?auto_379362 ?auto_379370 ) ) ( not ( = ?auto_379362 ?auto_379371 ) ) ( not ( = ?auto_379362 ?auto_379372 ) ) ( not ( = ?auto_379362 ?auto_379373 ) ) ( not ( = ?auto_379362 ?auto_379374 ) ) ( not ( = ?auto_379363 ?auto_379364 ) ) ( not ( = ?auto_379363 ?auto_379365 ) ) ( not ( = ?auto_379363 ?auto_379366 ) ) ( not ( = ?auto_379363 ?auto_379367 ) ) ( not ( = ?auto_379363 ?auto_379368 ) ) ( not ( = ?auto_379363 ?auto_379369 ) ) ( not ( = ?auto_379363 ?auto_379370 ) ) ( not ( = ?auto_379363 ?auto_379371 ) ) ( not ( = ?auto_379363 ?auto_379372 ) ) ( not ( = ?auto_379363 ?auto_379373 ) ) ( not ( = ?auto_379363 ?auto_379374 ) ) ( not ( = ?auto_379364 ?auto_379365 ) ) ( not ( = ?auto_379364 ?auto_379366 ) ) ( not ( = ?auto_379364 ?auto_379367 ) ) ( not ( = ?auto_379364 ?auto_379368 ) ) ( not ( = ?auto_379364 ?auto_379369 ) ) ( not ( = ?auto_379364 ?auto_379370 ) ) ( not ( = ?auto_379364 ?auto_379371 ) ) ( not ( = ?auto_379364 ?auto_379372 ) ) ( not ( = ?auto_379364 ?auto_379373 ) ) ( not ( = ?auto_379364 ?auto_379374 ) ) ( not ( = ?auto_379365 ?auto_379366 ) ) ( not ( = ?auto_379365 ?auto_379367 ) ) ( not ( = ?auto_379365 ?auto_379368 ) ) ( not ( = ?auto_379365 ?auto_379369 ) ) ( not ( = ?auto_379365 ?auto_379370 ) ) ( not ( = ?auto_379365 ?auto_379371 ) ) ( not ( = ?auto_379365 ?auto_379372 ) ) ( not ( = ?auto_379365 ?auto_379373 ) ) ( not ( = ?auto_379365 ?auto_379374 ) ) ( not ( = ?auto_379366 ?auto_379367 ) ) ( not ( = ?auto_379366 ?auto_379368 ) ) ( not ( = ?auto_379366 ?auto_379369 ) ) ( not ( = ?auto_379366 ?auto_379370 ) ) ( not ( = ?auto_379366 ?auto_379371 ) ) ( not ( = ?auto_379366 ?auto_379372 ) ) ( not ( = ?auto_379366 ?auto_379373 ) ) ( not ( = ?auto_379366 ?auto_379374 ) ) ( not ( = ?auto_379367 ?auto_379368 ) ) ( not ( = ?auto_379367 ?auto_379369 ) ) ( not ( = ?auto_379367 ?auto_379370 ) ) ( not ( = ?auto_379367 ?auto_379371 ) ) ( not ( = ?auto_379367 ?auto_379372 ) ) ( not ( = ?auto_379367 ?auto_379373 ) ) ( not ( = ?auto_379367 ?auto_379374 ) ) ( not ( = ?auto_379368 ?auto_379369 ) ) ( not ( = ?auto_379368 ?auto_379370 ) ) ( not ( = ?auto_379368 ?auto_379371 ) ) ( not ( = ?auto_379368 ?auto_379372 ) ) ( not ( = ?auto_379368 ?auto_379373 ) ) ( not ( = ?auto_379368 ?auto_379374 ) ) ( not ( = ?auto_379369 ?auto_379370 ) ) ( not ( = ?auto_379369 ?auto_379371 ) ) ( not ( = ?auto_379369 ?auto_379372 ) ) ( not ( = ?auto_379369 ?auto_379373 ) ) ( not ( = ?auto_379369 ?auto_379374 ) ) ( not ( = ?auto_379370 ?auto_379371 ) ) ( not ( = ?auto_379370 ?auto_379372 ) ) ( not ( = ?auto_379370 ?auto_379373 ) ) ( not ( = ?auto_379370 ?auto_379374 ) ) ( not ( = ?auto_379371 ?auto_379372 ) ) ( not ( = ?auto_379371 ?auto_379373 ) ) ( not ( = ?auto_379371 ?auto_379374 ) ) ( not ( = ?auto_379372 ?auto_379373 ) ) ( not ( = ?auto_379372 ?auto_379374 ) ) ( not ( = ?auto_379373 ?auto_379374 ) ) ( ON ?auto_379372 ?auto_379373 ) ( ON ?auto_379371 ?auto_379372 ) ( ON ?auto_379370 ?auto_379371 ) ( ON ?auto_379369 ?auto_379370 ) ( ON ?auto_379368 ?auto_379369 ) ( CLEAR ?auto_379366 ) ( ON ?auto_379367 ?auto_379368 ) ( CLEAR ?auto_379367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_379361 ?auto_379362 ?auto_379363 ?auto_379364 ?auto_379365 ?auto_379366 ?auto_379367 )
      ( MAKE-13PILE ?auto_379361 ?auto_379362 ?auto_379363 ?auto_379364 ?auto_379365 ?auto_379366 ?auto_379367 ?auto_379368 ?auto_379369 ?auto_379370 ?auto_379371 ?auto_379372 ?auto_379373 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379388 - BLOCK
      ?auto_379389 - BLOCK
      ?auto_379390 - BLOCK
      ?auto_379391 - BLOCK
      ?auto_379392 - BLOCK
      ?auto_379393 - BLOCK
      ?auto_379394 - BLOCK
      ?auto_379395 - BLOCK
      ?auto_379396 - BLOCK
      ?auto_379397 - BLOCK
      ?auto_379398 - BLOCK
      ?auto_379399 - BLOCK
      ?auto_379400 - BLOCK
    )
    :vars
    (
      ?auto_379401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379400 ?auto_379401 ) ( ON-TABLE ?auto_379388 ) ( ON ?auto_379389 ?auto_379388 ) ( ON ?auto_379390 ?auto_379389 ) ( ON ?auto_379391 ?auto_379390 ) ( ON ?auto_379392 ?auto_379391 ) ( ON ?auto_379393 ?auto_379392 ) ( not ( = ?auto_379388 ?auto_379389 ) ) ( not ( = ?auto_379388 ?auto_379390 ) ) ( not ( = ?auto_379388 ?auto_379391 ) ) ( not ( = ?auto_379388 ?auto_379392 ) ) ( not ( = ?auto_379388 ?auto_379393 ) ) ( not ( = ?auto_379388 ?auto_379394 ) ) ( not ( = ?auto_379388 ?auto_379395 ) ) ( not ( = ?auto_379388 ?auto_379396 ) ) ( not ( = ?auto_379388 ?auto_379397 ) ) ( not ( = ?auto_379388 ?auto_379398 ) ) ( not ( = ?auto_379388 ?auto_379399 ) ) ( not ( = ?auto_379388 ?auto_379400 ) ) ( not ( = ?auto_379388 ?auto_379401 ) ) ( not ( = ?auto_379389 ?auto_379390 ) ) ( not ( = ?auto_379389 ?auto_379391 ) ) ( not ( = ?auto_379389 ?auto_379392 ) ) ( not ( = ?auto_379389 ?auto_379393 ) ) ( not ( = ?auto_379389 ?auto_379394 ) ) ( not ( = ?auto_379389 ?auto_379395 ) ) ( not ( = ?auto_379389 ?auto_379396 ) ) ( not ( = ?auto_379389 ?auto_379397 ) ) ( not ( = ?auto_379389 ?auto_379398 ) ) ( not ( = ?auto_379389 ?auto_379399 ) ) ( not ( = ?auto_379389 ?auto_379400 ) ) ( not ( = ?auto_379389 ?auto_379401 ) ) ( not ( = ?auto_379390 ?auto_379391 ) ) ( not ( = ?auto_379390 ?auto_379392 ) ) ( not ( = ?auto_379390 ?auto_379393 ) ) ( not ( = ?auto_379390 ?auto_379394 ) ) ( not ( = ?auto_379390 ?auto_379395 ) ) ( not ( = ?auto_379390 ?auto_379396 ) ) ( not ( = ?auto_379390 ?auto_379397 ) ) ( not ( = ?auto_379390 ?auto_379398 ) ) ( not ( = ?auto_379390 ?auto_379399 ) ) ( not ( = ?auto_379390 ?auto_379400 ) ) ( not ( = ?auto_379390 ?auto_379401 ) ) ( not ( = ?auto_379391 ?auto_379392 ) ) ( not ( = ?auto_379391 ?auto_379393 ) ) ( not ( = ?auto_379391 ?auto_379394 ) ) ( not ( = ?auto_379391 ?auto_379395 ) ) ( not ( = ?auto_379391 ?auto_379396 ) ) ( not ( = ?auto_379391 ?auto_379397 ) ) ( not ( = ?auto_379391 ?auto_379398 ) ) ( not ( = ?auto_379391 ?auto_379399 ) ) ( not ( = ?auto_379391 ?auto_379400 ) ) ( not ( = ?auto_379391 ?auto_379401 ) ) ( not ( = ?auto_379392 ?auto_379393 ) ) ( not ( = ?auto_379392 ?auto_379394 ) ) ( not ( = ?auto_379392 ?auto_379395 ) ) ( not ( = ?auto_379392 ?auto_379396 ) ) ( not ( = ?auto_379392 ?auto_379397 ) ) ( not ( = ?auto_379392 ?auto_379398 ) ) ( not ( = ?auto_379392 ?auto_379399 ) ) ( not ( = ?auto_379392 ?auto_379400 ) ) ( not ( = ?auto_379392 ?auto_379401 ) ) ( not ( = ?auto_379393 ?auto_379394 ) ) ( not ( = ?auto_379393 ?auto_379395 ) ) ( not ( = ?auto_379393 ?auto_379396 ) ) ( not ( = ?auto_379393 ?auto_379397 ) ) ( not ( = ?auto_379393 ?auto_379398 ) ) ( not ( = ?auto_379393 ?auto_379399 ) ) ( not ( = ?auto_379393 ?auto_379400 ) ) ( not ( = ?auto_379393 ?auto_379401 ) ) ( not ( = ?auto_379394 ?auto_379395 ) ) ( not ( = ?auto_379394 ?auto_379396 ) ) ( not ( = ?auto_379394 ?auto_379397 ) ) ( not ( = ?auto_379394 ?auto_379398 ) ) ( not ( = ?auto_379394 ?auto_379399 ) ) ( not ( = ?auto_379394 ?auto_379400 ) ) ( not ( = ?auto_379394 ?auto_379401 ) ) ( not ( = ?auto_379395 ?auto_379396 ) ) ( not ( = ?auto_379395 ?auto_379397 ) ) ( not ( = ?auto_379395 ?auto_379398 ) ) ( not ( = ?auto_379395 ?auto_379399 ) ) ( not ( = ?auto_379395 ?auto_379400 ) ) ( not ( = ?auto_379395 ?auto_379401 ) ) ( not ( = ?auto_379396 ?auto_379397 ) ) ( not ( = ?auto_379396 ?auto_379398 ) ) ( not ( = ?auto_379396 ?auto_379399 ) ) ( not ( = ?auto_379396 ?auto_379400 ) ) ( not ( = ?auto_379396 ?auto_379401 ) ) ( not ( = ?auto_379397 ?auto_379398 ) ) ( not ( = ?auto_379397 ?auto_379399 ) ) ( not ( = ?auto_379397 ?auto_379400 ) ) ( not ( = ?auto_379397 ?auto_379401 ) ) ( not ( = ?auto_379398 ?auto_379399 ) ) ( not ( = ?auto_379398 ?auto_379400 ) ) ( not ( = ?auto_379398 ?auto_379401 ) ) ( not ( = ?auto_379399 ?auto_379400 ) ) ( not ( = ?auto_379399 ?auto_379401 ) ) ( not ( = ?auto_379400 ?auto_379401 ) ) ( ON ?auto_379399 ?auto_379400 ) ( ON ?auto_379398 ?auto_379399 ) ( ON ?auto_379397 ?auto_379398 ) ( ON ?auto_379396 ?auto_379397 ) ( ON ?auto_379395 ?auto_379396 ) ( CLEAR ?auto_379393 ) ( ON ?auto_379394 ?auto_379395 ) ( CLEAR ?auto_379394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_379388 ?auto_379389 ?auto_379390 ?auto_379391 ?auto_379392 ?auto_379393 ?auto_379394 )
      ( MAKE-13PILE ?auto_379388 ?auto_379389 ?auto_379390 ?auto_379391 ?auto_379392 ?auto_379393 ?auto_379394 ?auto_379395 ?auto_379396 ?auto_379397 ?auto_379398 ?auto_379399 ?auto_379400 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379415 - BLOCK
      ?auto_379416 - BLOCK
      ?auto_379417 - BLOCK
      ?auto_379418 - BLOCK
      ?auto_379419 - BLOCK
      ?auto_379420 - BLOCK
      ?auto_379421 - BLOCK
      ?auto_379422 - BLOCK
      ?auto_379423 - BLOCK
      ?auto_379424 - BLOCK
      ?auto_379425 - BLOCK
      ?auto_379426 - BLOCK
      ?auto_379427 - BLOCK
    )
    :vars
    (
      ?auto_379428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379427 ?auto_379428 ) ( ON-TABLE ?auto_379415 ) ( ON ?auto_379416 ?auto_379415 ) ( ON ?auto_379417 ?auto_379416 ) ( ON ?auto_379418 ?auto_379417 ) ( ON ?auto_379419 ?auto_379418 ) ( not ( = ?auto_379415 ?auto_379416 ) ) ( not ( = ?auto_379415 ?auto_379417 ) ) ( not ( = ?auto_379415 ?auto_379418 ) ) ( not ( = ?auto_379415 ?auto_379419 ) ) ( not ( = ?auto_379415 ?auto_379420 ) ) ( not ( = ?auto_379415 ?auto_379421 ) ) ( not ( = ?auto_379415 ?auto_379422 ) ) ( not ( = ?auto_379415 ?auto_379423 ) ) ( not ( = ?auto_379415 ?auto_379424 ) ) ( not ( = ?auto_379415 ?auto_379425 ) ) ( not ( = ?auto_379415 ?auto_379426 ) ) ( not ( = ?auto_379415 ?auto_379427 ) ) ( not ( = ?auto_379415 ?auto_379428 ) ) ( not ( = ?auto_379416 ?auto_379417 ) ) ( not ( = ?auto_379416 ?auto_379418 ) ) ( not ( = ?auto_379416 ?auto_379419 ) ) ( not ( = ?auto_379416 ?auto_379420 ) ) ( not ( = ?auto_379416 ?auto_379421 ) ) ( not ( = ?auto_379416 ?auto_379422 ) ) ( not ( = ?auto_379416 ?auto_379423 ) ) ( not ( = ?auto_379416 ?auto_379424 ) ) ( not ( = ?auto_379416 ?auto_379425 ) ) ( not ( = ?auto_379416 ?auto_379426 ) ) ( not ( = ?auto_379416 ?auto_379427 ) ) ( not ( = ?auto_379416 ?auto_379428 ) ) ( not ( = ?auto_379417 ?auto_379418 ) ) ( not ( = ?auto_379417 ?auto_379419 ) ) ( not ( = ?auto_379417 ?auto_379420 ) ) ( not ( = ?auto_379417 ?auto_379421 ) ) ( not ( = ?auto_379417 ?auto_379422 ) ) ( not ( = ?auto_379417 ?auto_379423 ) ) ( not ( = ?auto_379417 ?auto_379424 ) ) ( not ( = ?auto_379417 ?auto_379425 ) ) ( not ( = ?auto_379417 ?auto_379426 ) ) ( not ( = ?auto_379417 ?auto_379427 ) ) ( not ( = ?auto_379417 ?auto_379428 ) ) ( not ( = ?auto_379418 ?auto_379419 ) ) ( not ( = ?auto_379418 ?auto_379420 ) ) ( not ( = ?auto_379418 ?auto_379421 ) ) ( not ( = ?auto_379418 ?auto_379422 ) ) ( not ( = ?auto_379418 ?auto_379423 ) ) ( not ( = ?auto_379418 ?auto_379424 ) ) ( not ( = ?auto_379418 ?auto_379425 ) ) ( not ( = ?auto_379418 ?auto_379426 ) ) ( not ( = ?auto_379418 ?auto_379427 ) ) ( not ( = ?auto_379418 ?auto_379428 ) ) ( not ( = ?auto_379419 ?auto_379420 ) ) ( not ( = ?auto_379419 ?auto_379421 ) ) ( not ( = ?auto_379419 ?auto_379422 ) ) ( not ( = ?auto_379419 ?auto_379423 ) ) ( not ( = ?auto_379419 ?auto_379424 ) ) ( not ( = ?auto_379419 ?auto_379425 ) ) ( not ( = ?auto_379419 ?auto_379426 ) ) ( not ( = ?auto_379419 ?auto_379427 ) ) ( not ( = ?auto_379419 ?auto_379428 ) ) ( not ( = ?auto_379420 ?auto_379421 ) ) ( not ( = ?auto_379420 ?auto_379422 ) ) ( not ( = ?auto_379420 ?auto_379423 ) ) ( not ( = ?auto_379420 ?auto_379424 ) ) ( not ( = ?auto_379420 ?auto_379425 ) ) ( not ( = ?auto_379420 ?auto_379426 ) ) ( not ( = ?auto_379420 ?auto_379427 ) ) ( not ( = ?auto_379420 ?auto_379428 ) ) ( not ( = ?auto_379421 ?auto_379422 ) ) ( not ( = ?auto_379421 ?auto_379423 ) ) ( not ( = ?auto_379421 ?auto_379424 ) ) ( not ( = ?auto_379421 ?auto_379425 ) ) ( not ( = ?auto_379421 ?auto_379426 ) ) ( not ( = ?auto_379421 ?auto_379427 ) ) ( not ( = ?auto_379421 ?auto_379428 ) ) ( not ( = ?auto_379422 ?auto_379423 ) ) ( not ( = ?auto_379422 ?auto_379424 ) ) ( not ( = ?auto_379422 ?auto_379425 ) ) ( not ( = ?auto_379422 ?auto_379426 ) ) ( not ( = ?auto_379422 ?auto_379427 ) ) ( not ( = ?auto_379422 ?auto_379428 ) ) ( not ( = ?auto_379423 ?auto_379424 ) ) ( not ( = ?auto_379423 ?auto_379425 ) ) ( not ( = ?auto_379423 ?auto_379426 ) ) ( not ( = ?auto_379423 ?auto_379427 ) ) ( not ( = ?auto_379423 ?auto_379428 ) ) ( not ( = ?auto_379424 ?auto_379425 ) ) ( not ( = ?auto_379424 ?auto_379426 ) ) ( not ( = ?auto_379424 ?auto_379427 ) ) ( not ( = ?auto_379424 ?auto_379428 ) ) ( not ( = ?auto_379425 ?auto_379426 ) ) ( not ( = ?auto_379425 ?auto_379427 ) ) ( not ( = ?auto_379425 ?auto_379428 ) ) ( not ( = ?auto_379426 ?auto_379427 ) ) ( not ( = ?auto_379426 ?auto_379428 ) ) ( not ( = ?auto_379427 ?auto_379428 ) ) ( ON ?auto_379426 ?auto_379427 ) ( ON ?auto_379425 ?auto_379426 ) ( ON ?auto_379424 ?auto_379425 ) ( ON ?auto_379423 ?auto_379424 ) ( ON ?auto_379422 ?auto_379423 ) ( ON ?auto_379421 ?auto_379422 ) ( CLEAR ?auto_379419 ) ( ON ?auto_379420 ?auto_379421 ) ( CLEAR ?auto_379420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_379415 ?auto_379416 ?auto_379417 ?auto_379418 ?auto_379419 ?auto_379420 )
      ( MAKE-13PILE ?auto_379415 ?auto_379416 ?auto_379417 ?auto_379418 ?auto_379419 ?auto_379420 ?auto_379421 ?auto_379422 ?auto_379423 ?auto_379424 ?auto_379425 ?auto_379426 ?auto_379427 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379442 - BLOCK
      ?auto_379443 - BLOCK
      ?auto_379444 - BLOCK
      ?auto_379445 - BLOCK
      ?auto_379446 - BLOCK
      ?auto_379447 - BLOCK
      ?auto_379448 - BLOCK
      ?auto_379449 - BLOCK
      ?auto_379450 - BLOCK
      ?auto_379451 - BLOCK
      ?auto_379452 - BLOCK
      ?auto_379453 - BLOCK
      ?auto_379454 - BLOCK
    )
    :vars
    (
      ?auto_379455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379454 ?auto_379455 ) ( ON-TABLE ?auto_379442 ) ( ON ?auto_379443 ?auto_379442 ) ( ON ?auto_379444 ?auto_379443 ) ( ON ?auto_379445 ?auto_379444 ) ( ON ?auto_379446 ?auto_379445 ) ( not ( = ?auto_379442 ?auto_379443 ) ) ( not ( = ?auto_379442 ?auto_379444 ) ) ( not ( = ?auto_379442 ?auto_379445 ) ) ( not ( = ?auto_379442 ?auto_379446 ) ) ( not ( = ?auto_379442 ?auto_379447 ) ) ( not ( = ?auto_379442 ?auto_379448 ) ) ( not ( = ?auto_379442 ?auto_379449 ) ) ( not ( = ?auto_379442 ?auto_379450 ) ) ( not ( = ?auto_379442 ?auto_379451 ) ) ( not ( = ?auto_379442 ?auto_379452 ) ) ( not ( = ?auto_379442 ?auto_379453 ) ) ( not ( = ?auto_379442 ?auto_379454 ) ) ( not ( = ?auto_379442 ?auto_379455 ) ) ( not ( = ?auto_379443 ?auto_379444 ) ) ( not ( = ?auto_379443 ?auto_379445 ) ) ( not ( = ?auto_379443 ?auto_379446 ) ) ( not ( = ?auto_379443 ?auto_379447 ) ) ( not ( = ?auto_379443 ?auto_379448 ) ) ( not ( = ?auto_379443 ?auto_379449 ) ) ( not ( = ?auto_379443 ?auto_379450 ) ) ( not ( = ?auto_379443 ?auto_379451 ) ) ( not ( = ?auto_379443 ?auto_379452 ) ) ( not ( = ?auto_379443 ?auto_379453 ) ) ( not ( = ?auto_379443 ?auto_379454 ) ) ( not ( = ?auto_379443 ?auto_379455 ) ) ( not ( = ?auto_379444 ?auto_379445 ) ) ( not ( = ?auto_379444 ?auto_379446 ) ) ( not ( = ?auto_379444 ?auto_379447 ) ) ( not ( = ?auto_379444 ?auto_379448 ) ) ( not ( = ?auto_379444 ?auto_379449 ) ) ( not ( = ?auto_379444 ?auto_379450 ) ) ( not ( = ?auto_379444 ?auto_379451 ) ) ( not ( = ?auto_379444 ?auto_379452 ) ) ( not ( = ?auto_379444 ?auto_379453 ) ) ( not ( = ?auto_379444 ?auto_379454 ) ) ( not ( = ?auto_379444 ?auto_379455 ) ) ( not ( = ?auto_379445 ?auto_379446 ) ) ( not ( = ?auto_379445 ?auto_379447 ) ) ( not ( = ?auto_379445 ?auto_379448 ) ) ( not ( = ?auto_379445 ?auto_379449 ) ) ( not ( = ?auto_379445 ?auto_379450 ) ) ( not ( = ?auto_379445 ?auto_379451 ) ) ( not ( = ?auto_379445 ?auto_379452 ) ) ( not ( = ?auto_379445 ?auto_379453 ) ) ( not ( = ?auto_379445 ?auto_379454 ) ) ( not ( = ?auto_379445 ?auto_379455 ) ) ( not ( = ?auto_379446 ?auto_379447 ) ) ( not ( = ?auto_379446 ?auto_379448 ) ) ( not ( = ?auto_379446 ?auto_379449 ) ) ( not ( = ?auto_379446 ?auto_379450 ) ) ( not ( = ?auto_379446 ?auto_379451 ) ) ( not ( = ?auto_379446 ?auto_379452 ) ) ( not ( = ?auto_379446 ?auto_379453 ) ) ( not ( = ?auto_379446 ?auto_379454 ) ) ( not ( = ?auto_379446 ?auto_379455 ) ) ( not ( = ?auto_379447 ?auto_379448 ) ) ( not ( = ?auto_379447 ?auto_379449 ) ) ( not ( = ?auto_379447 ?auto_379450 ) ) ( not ( = ?auto_379447 ?auto_379451 ) ) ( not ( = ?auto_379447 ?auto_379452 ) ) ( not ( = ?auto_379447 ?auto_379453 ) ) ( not ( = ?auto_379447 ?auto_379454 ) ) ( not ( = ?auto_379447 ?auto_379455 ) ) ( not ( = ?auto_379448 ?auto_379449 ) ) ( not ( = ?auto_379448 ?auto_379450 ) ) ( not ( = ?auto_379448 ?auto_379451 ) ) ( not ( = ?auto_379448 ?auto_379452 ) ) ( not ( = ?auto_379448 ?auto_379453 ) ) ( not ( = ?auto_379448 ?auto_379454 ) ) ( not ( = ?auto_379448 ?auto_379455 ) ) ( not ( = ?auto_379449 ?auto_379450 ) ) ( not ( = ?auto_379449 ?auto_379451 ) ) ( not ( = ?auto_379449 ?auto_379452 ) ) ( not ( = ?auto_379449 ?auto_379453 ) ) ( not ( = ?auto_379449 ?auto_379454 ) ) ( not ( = ?auto_379449 ?auto_379455 ) ) ( not ( = ?auto_379450 ?auto_379451 ) ) ( not ( = ?auto_379450 ?auto_379452 ) ) ( not ( = ?auto_379450 ?auto_379453 ) ) ( not ( = ?auto_379450 ?auto_379454 ) ) ( not ( = ?auto_379450 ?auto_379455 ) ) ( not ( = ?auto_379451 ?auto_379452 ) ) ( not ( = ?auto_379451 ?auto_379453 ) ) ( not ( = ?auto_379451 ?auto_379454 ) ) ( not ( = ?auto_379451 ?auto_379455 ) ) ( not ( = ?auto_379452 ?auto_379453 ) ) ( not ( = ?auto_379452 ?auto_379454 ) ) ( not ( = ?auto_379452 ?auto_379455 ) ) ( not ( = ?auto_379453 ?auto_379454 ) ) ( not ( = ?auto_379453 ?auto_379455 ) ) ( not ( = ?auto_379454 ?auto_379455 ) ) ( ON ?auto_379453 ?auto_379454 ) ( ON ?auto_379452 ?auto_379453 ) ( ON ?auto_379451 ?auto_379452 ) ( ON ?auto_379450 ?auto_379451 ) ( ON ?auto_379449 ?auto_379450 ) ( ON ?auto_379448 ?auto_379449 ) ( CLEAR ?auto_379446 ) ( ON ?auto_379447 ?auto_379448 ) ( CLEAR ?auto_379447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_379442 ?auto_379443 ?auto_379444 ?auto_379445 ?auto_379446 ?auto_379447 )
      ( MAKE-13PILE ?auto_379442 ?auto_379443 ?auto_379444 ?auto_379445 ?auto_379446 ?auto_379447 ?auto_379448 ?auto_379449 ?auto_379450 ?auto_379451 ?auto_379452 ?auto_379453 ?auto_379454 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379469 - BLOCK
      ?auto_379470 - BLOCK
      ?auto_379471 - BLOCK
      ?auto_379472 - BLOCK
      ?auto_379473 - BLOCK
      ?auto_379474 - BLOCK
      ?auto_379475 - BLOCK
      ?auto_379476 - BLOCK
      ?auto_379477 - BLOCK
      ?auto_379478 - BLOCK
      ?auto_379479 - BLOCK
      ?auto_379480 - BLOCK
      ?auto_379481 - BLOCK
    )
    :vars
    (
      ?auto_379482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379481 ?auto_379482 ) ( ON-TABLE ?auto_379469 ) ( ON ?auto_379470 ?auto_379469 ) ( ON ?auto_379471 ?auto_379470 ) ( ON ?auto_379472 ?auto_379471 ) ( not ( = ?auto_379469 ?auto_379470 ) ) ( not ( = ?auto_379469 ?auto_379471 ) ) ( not ( = ?auto_379469 ?auto_379472 ) ) ( not ( = ?auto_379469 ?auto_379473 ) ) ( not ( = ?auto_379469 ?auto_379474 ) ) ( not ( = ?auto_379469 ?auto_379475 ) ) ( not ( = ?auto_379469 ?auto_379476 ) ) ( not ( = ?auto_379469 ?auto_379477 ) ) ( not ( = ?auto_379469 ?auto_379478 ) ) ( not ( = ?auto_379469 ?auto_379479 ) ) ( not ( = ?auto_379469 ?auto_379480 ) ) ( not ( = ?auto_379469 ?auto_379481 ) ) ( not ( = ?auto_379469 ?auto_379482 ) ) ( not ( = ?auto_379470 ?auto_379471 ) ) ( not ( = ?auto_379470 ?auto_379472 ) ) ( not ( = ?auto_379470 ?auto_379473 ) ) ( not ( = ?auto_379470 ?auto_379474 ) ) ( not ( = ?auto_379470 ?auto_379475 ) ) ( not ( = ?auto_379470 ?auto_379476 ) ) ( not ( = ?auto_379470 ?auto_379477 ) ) ( not ( = ?auto_379470 ?auto_379478 ) ) ( not ( = ?auto_379470 ?auto_379479 ) ) ( not ( = ?auto_379470 ?auto_379480 ) ) ( not ( = ?auto_379470 ?auto_379481 ) ) ( not ( = ?auto_379470 ?auto_379482 ) ) ( not ( = ?auto_379471 ?auto_379472 ) ) ( not ( = ?auto_379471 ?auto_379473 ) ) ( not ( = ?auto_379471 ?auto_379474 ) ) ( not ( = ?auto_379471 ?auto_379475 ) ) ( not ( = ?auto_379471 ?auto_379476 ) ) ( not ( = ?auto_379471 ?auto_379477 ) ) ( not ( = ?auto_379471 ?auto_379478 ) ) ( not ( = ?auto_379471 ?auto_379479 ) ) ( not ( = ?auto_379471 ?auto_379480 ) ) ( not ( = ?auto_379471 ?auto_379481 ) ) ( not ( = ?auto_379471 ?auto_379482 ) ) ( not ( = ?auto_379472 ?auto_379473 ) ) ( not ( = ?auto_379472 ?auto_379474 ) ) ( not ( = ?auto_379472 ?auto_379475 ) ) ( not ( = ?auto_379472 ?auto_379476 ) ) ( not ( = ?auto_379472 ?auto_379477 ) ) ( not ( = ?auto_379472 ?auto_379478 ) ) ( not ( = ?auto_379472 ?auto_379479 ) ) ( not ( = ?auto_379472 ?auto_379480 ) ) ( not ( = ?auto_379472 ?auto_379481 ) ) ( not ( = ?auto_379472 ?auto_379482 ) ) ( not ( = ?auto_379473 ?auto_379474 ) ) ( not ( = ?auto_379473 ?auto_379475 ) ) ( not ( = ?auto_379473 ?auto_379476 ) ) ( not ( = ?auto_379473 ?auto_379477 ) ) ( not ( = ?auto_379473 ?auto_379478 ) ) ( not ( = ?auto_379473 ?auto_379479 ) ) ( not ( = ?auto_379473 ?auto_379480 ) ) ( not ( = ?auto_379473 ?auto_379481 ) ) ( not ( = ?auto_379473 ?auto_379482 ) ) ( not ( = ?auto_379474 ?auto_379475 ) ) ( not ( = ?auto_379474 ?auto_379476 ) ) ( not ( = ?auto_379474 ?auto_379477 ) ) ( not ( = ?auto_379474 ?auto_379478 ) ) ( not ( = ?auto_379474 ?auto_379479 ) ) ( not ( = ?auto_379474 ?auto_379480 ) ) ( not ( = ?auto_379474 ?auto_379481 ) ) ( not ( = ?auto_379474 ?auto_379482 ) ) ( not ( = ?auto_379475 ?auto_379476 ) ) ( not ( = ?auto_379475 ?auto_379477 ) ) ( not ( = ?auto_379475 ?auto_379478 ) ) ( not ( = ?auto_379475 ?auto_379479 ) ) ( not ( = ?auto_379475 ?auto_379480 ) ) ( not ( = ?auto_379475 ?auto_379481 ) ) ( not ( = ?auto_379475 ?auto_379482 ) ) ( not ( = ?auto_379476 ?auto_379477 ) ) ( not ( = ?auto_379476 ?auto_379478 ) ) ( not ( = ?auto_379476 ?auto_379479 ) ) ( not ( = ?auto_379476 ?auto_379480 ) ) ( not ( = ?auto_379476 ?auto_379481 ) ) ( not ( = ?auto_379476 ?auto_379482 ) ) ( not ( = ?auto_379477 ?auto_379478 ) ) ( not ( = ?auto_379477 ?auto_379479 ) ) ( not ( = ?auto_379477 ?auto_379480 ) ) ( not ( = ?auto_379477 ?auto_379481 ) ) ( not ( = ?auto_379477 ?auto_379482 ) ) ( not ( = ?auto_379478 ?auto_379479 ) ) ( not ( = ?auto_379478 ?auto_379480 ) ) ( not ( = ?auto_379478 ?auto_379481 ) ) ( not ( = ?auto_379478 ?auto_379482 ) ) ( not ( = ?auto_379479 ?auto_379480 ) ) ( not ( = ?auto_379479 ?auto_379481 ) ) ( not ( = ?auto_379479 ?auto_379482 ) ) ( not ( = ?auto_379480 ?auto_379481 ) ) ( not ( = ?auto_379480 ?auto_379482 ) ) ( not ( = ?auto_379481 ?auto_379482 ) ) ( ON ?auto_379480 ?auto_379481 ) ( ON ?auto_379479 ?auto_379480 ) ( ON ?auto_379478 ?auto_379479 ) ( ON ?auto_379477 ?auto_379478 ) ( ON ?auto_379476 ?auto_379477 ) ( ON ?auto_379475 ?auto_379476 ) ( ON ?auto_379474 ?auto_379475 ) ( CLEAR ?auto_379472 ) ( ON ?auto_379473 ?auto_379474 ) ( CLEAR ?auto_379473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_379469 ?auto_379470 ?auto_379471 ?auto_379472 ?auto_379473 )
      ( MAKE-13PILE ?auto_379469 ?auto_379470 ?auto_379471 ?auto_379472 ?auto_379473 ?auto_379474 ?auto_379475 ?auto_379476 ?auto_379477 ?auto_379478 ?auto_379479 ?auto_379480 ?auto_379481 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379496 - BLOCK
      ?auto_379497 - BLOCK
      ?auto_379498 - BLOCK
      ?auto_379499 - BLOCK
      ?auto_379500 - BLOCK
      ?auto_379501 - BLOCK
      ?auto_379502 - BLOCK
      ?auto_379503 - BLOCK
      ?auto_379504 - BLOCK
      ?auto_379505 - BLOCK
      ?auto_379506 - BLOCK
      ?auto_379507 - BLOCK
      ?auto_379508 - BLOCK
    )
    :vars
    (
      ?auto_379509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379508 ?auto_379509 ) ( ON-TABLE ?auto_379496 ) ( ON ?auto_379497 ?auto_379496 ) ( ON ?auto_379498 ?auto_379497 ) ( ON ?auto_379499 ?auto_379498 ) ( not ( = ?auto_379496 ?auto_379497 ) ) ( not ( = ?auto_379496 ?auto_379498 ) ) ( not ( = ?auto_379496 ?auto_379499 ) ) ( not ( = ?auto_379496 ?auto_379500 ) ) ( not ( = ?auto_379496 ?auto_379501 ) ) ( not ( = ?auto_379496 ?auto_379502 ) ) ( not ( = ?auto_379496 ?auto_379503 ) ) ( not ( = ?auto_379496 ?auto_379504 ) ) ( not ( = ?auto_379496 ?auto_379505 ) ) ( not ( = ?auto_379496 ?auto_379506 ) ) ( not ( = ?auto_379496 ?auto_379507 ) ) ( not ( = ?auto_379496 ?auto_379508 ) ) ( not ( = ?auto_379496 ?auto_379509 ) ) ( not ( = ?auto_379497 ?auto_379498 ) ) ( not ( = ?auto_379497 ?auto_379499 ) ) ( not ( = ?auto_379497 ?auto_379500 ) ) ( not ( = ?auto_379497 ?auto_379501 ) ) ( not ( = ?auto_379497 ?auto_379502 ) ) ( not ( = ?auto_379497 ?auto_379503 ) ) ( not ( = ?auto_379497 ?auto_379504 ) ) ( not ( = ?auto_379497 ?auto_379505 ) ) ( not ( = ?auto_379497 ?auto_379506 ) ) ( not ( = ?auto_379497 ?auto_379507 ) ) ( not ( = ?auto_379497 ?auto_379508 ) ) ( not ( = ?auto_379497 ?auto_379509 ) ) ( not ( = ?auto_379498 ?auto_379499 ) ) ( not ( = ?auto_379498 ?auto_379500 ) ) ( not ( = ?auto_379498 ?auto_379501 ) ) ( not ( = ?auto_379498 ?auto_379502 ) ) ( not ( = ?auto_379498 ?auto_379503 ) ) ( not ( = ?auto_379498 ?auto_379504 ) ) ( not ( = ?auto_379498 ?auto_379505 ) ) ( not ( = ?auto_379498 ?auto_379506 ) ) ( not ( = ?auto_379498 ?auto_379507 ) ) ( not ( = ?auto_379498 ?auto_379508 ) ) ( not ( = ?auto_379498 ?auto_379509 ) ) ( not ( = ?auto_379499 ?auto_379500 ) ) ( not ( = ?auto_379499 ?auto_379501 ) ) ( not ( = ?auto_379499 ?auto_379502 ) ) ( not ( = ?auto_379499 ?auto_379503 ) ) ( not ( = ?auto_379499 ?auto_379504 ) ) ( not ( = ?auto_379499 ?auto_379505 ) ) ( not ( = ?auto_379499 ?auto_379506 ) ) ( not ( = ?auto_379499 ?auto_379507 ) ) ( not ( = ?auto_379499 ?auto_379508 ) ) ( not ( = ?auto_379499 ?auto_379509 ) ) ( not ( = ?auto_379500 ?auto_379501 ) ) ( not ( = ?auto_379500 ?auto_379502 ) ) ( not ( = ?auto_379500 ?auto_379503 ) ) ( not ( = ?auto_379500 ?auto_379504 ) ) ( not ( = ?auto_379500 ?auto_379505 ) ) ( not ( = ?auto_379500 ?auto_379506 ) ) ( not ( = ?auto_379500 ?auto_379507 ) ) ( not ( = ?auto_379500 ?auto_379508 ) ) ( not ( = ?auto_379500 ?auto_379509 ) ) ( not ( = ?auto_379501 ?auto_379502 ) ) ( not ( = ?auto_379501 ?auto_379503 ) ) ( not ( = ?auto_379501 ?auto_379504 ) ) ( not ( = ?auto_379501 ?auto_379505 ) ) ( not ( = ?auto_379501 ?auto_379506 ) ) ( not ( = ?auto_379501 ?auto_379507 ) ) ( not ( = ?auto_379501 ?auto_379508 ) ) ( not ( = ?auto_379501 ?auto_379509 ) ) ( not ( = ?auto_379502 ?auto_379503 ) ) ( not ( = ?auto_379502 ?auto_379504 ) ) ( not ( = ?auto_379502 ?auto_379505 ) ) ( not ( = ?auto_379502 ?auto_379506 ) ) ( not ( = ?auto_379502 ?auto_379507 ) ) ( not ( = ?auto_379502 ?auto_379508 ) ) ( not ( = ?auto_379502 ?auto_379509 ) ) ( not ( = ?auto_379503 ?auto_379504 ) ) ( not ( = ?auto_379503 ?auto_379505 ) ) ( not ( = ?auto_379503 ?auto_379506 ) ) ( not ( = ?auto_379503 ?auto_379507 ) ) ( not ( = ?auto_379503 ?auto_379508 ) ) ( not ( = ?auto_379503 ?auto_379509 ) ) ( not ( = ?auto_379504 ?auto_379505 ) ) ( not ( = ?auto_379504 ?auto_379506 ) ) ( not ( = ?auto_379504 ?auto_379507 ) ) ( not ( = ?auto_379504 ?auto_379508 ) ) ( not ( = ?auto_379504 ?auto_379509 ) ) ( not ( = ?auto_379505 ?auto_379506 ) ) ( not ( = ?auto_379505 ?auto_379507 ) ) ( not ( = ?auto_379505 ?auto_379508 ) ) ( not ( = ?auto_379505 ?auto_379509 ) ) ( not ( = ?auto_379506 ?auto_379507 ) ) ( not ( = ?auto_379506 ?auto_379508 ) ) ( not ( = ?auto_379506 ?auto_379509 ) ) ( not ( = ?auto_379507 ?auto_379508 ) ) ( not ( = ?auto_379507 ?auto_379509 ) ) ( not ( = ?auto_379508 ?auto_379509 ) ) ( ON ?auto_379507 ?auto_379508 ) ( ON ?auto_379506 ?auto_379507 ) ( ON ?auto_379505 ?auto_379506 ) ( ON ?auto_379504 ?auto_379505 ) ( ON ?auto_379503 ?auto_379504 ) ( ON ?auto_379502 ?auto_379503 ) ( ON ?auto_379501 ?auto_379502 ) ( CLEAR ?auto_379499 ) ( ON ?auto_379500 ?auto_379501 ) ( CLEAR ?auto_379500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_379496 ?auto_379497 ?auto_379498 ?auto_379499 ?auto_379500 )
      ( MAKE-13PILE ?auto_379496 ?auto_379497 ?auto_379498 ?auto_379499 ?auto_379500 ?auto_379501 ?auto_379502 ?auto_379503 ?auto_379504 ?auto_379505 ?auto_379506 ?auto_379507 ?auto_379508 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379523 - BLOCK
      ?auto_379524 - BLOCK
      ?auto_379525 - BLOCK
      ?auto_379526 - BLOCK
      ?auto_379527 - BLOCK
      ?auto_379528 - BLOCK
      ?auto_379529 - BLOCK
      ?auto_379530 - BLOCK
      ?auto_379531 - BLOCK
      ?auto_379532 - BLOCK
      ?auto_379533 - BLOCK
      ?auto_379534 - BLOCK
      ?auto_379535 - BLOCK
    )
    :vars
    (
      ?auto_379536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379535 ?auto_379536 ) ( ON-TABLE ?auto_379523 ) ( ON ?auto_379524 ?auto_379523 ) ( ON ?auto_379525 ?auto_379524 ) ( not ( = ?auto_379523 ?auto_379524 ) ) ( not ( = ?auto_379523 ?auto_379525 ) ) ( not ( = ?auto_379523 ?auto_379526 ) ) ( not ( = ?auto_379523 ?auto_379527 ) ) ( not ( = ?auto_379523 ?auto_379528 ) ) ( not ( = ?auto_379523 ?auto_379529 ) ) ( not ( = ?auto_379523 ?auto_379530 ) ) ( not ( = ?auto_379523 ?auto_379531 ) ) ( not ( = ?auto_379523 ?auto_379532 ) ) ( not ( = ?auto_379523 ?auto_379533 ) ) ( not ( = ?auto_379523 ?auto_379534 ) ) ( not ( = ?auto_379523 ?auto_379535 ) ) ( not ( = ?auto_379523 ?auto_379536 ) ) ( not ( = ?auto_379524 ?auto_379525 ) ) ( not ( = ?auto_379524 ?auto_379526 ) ) ( not ( = ?auto_379524 ?auto_379527 ) ) ( not ( = ?auto_379524 ?auto_379528 ) ) ( not ( = ?auto_379524 ?auto_379529 ) ) ( not ( = ?auto_379524 ?auto_379530 ) ) ( not ( = ?auto_379524 ?auto_379531 ) ) ( not ( = ?auto_379524 ?auto_379532 ) ) ( not ( = ?auto_379524 ?auto_379533 ) ) ( not ( = ?auto_379524 ?auto_379534 ) ) ( not ( = ?auto_379524 ?auto_379535 ) ) ( not ( = ?auto_379524 ?auto_379536 ) ) ( not ( = ?auto_379525 ?auto_379526 ) ) ( not ( = ?auto_379525 ?auto_379527 ) ) ( not ( = ?auto_379525 ?auto_379528 ) ) ( not ( = ?auto_379525 ?auto_379529 ) ) ( not ( = ?auto_379525 ?auto_379530 ) ) ( not ( = ?auto_379525 ?auto_379531 ) ) ( not ( = ?auto_379525 ?auto_379532 ) ) ( not ( = ?auto_379525 ?auto_379533 ) ) ( not ( = ?auto_379525 ?auto_379534 ) ) ( not ( = ?auto_379525 ?auto_379535 ) ) ( not ( = ?auto_379525 ?auto_379536 ) ) ( not ( = ?auto_379526 ?auto_379527 ) ) ( not ( = ?auto_379526 ?auto_379528 ) ) ( not ( = ?auto_379526 ?auto_379529 ) ) ( not ( = ?auto_379526 ?auto_379530 ) ) ( not ( = ?auto_379526 ?auto_379531 ) ) ( not ( = ?auto_379526 ?auto_379532 ) ) ( not ( = ?auto_379526 ?auto_379533 ) ) ( not ( = ?auto_379526 ?auto_379534 ) ) ( not ( = ?auto_379526 ?auto_379535 ) ) ( not ( = ?auto_379526 ?auto_379536 ) ) ( not ( = ?auto_379527 ?auto_379528 ) ) ( not ( = ?auto_379527 ?auto_379529 ) ) ( not ( = ?auto_379527 ?auto_379530 ) ) ( not ( = ?auto_379527 ?auto_379531 ) ) ( not ( = ?auto_379527 ?auto_379532 ) ) ( not ( = ?auto_379527 ?auto_379533 ) ) ( not ( = ?auto_379527 ?auto_379534 ) ) ( not ( = ?auto_379527 ?auto_379535 ) ) ( not ( = ?auto_379527 ?auto_379536 ) ) ( not ( = ?auto_379528 ?auto_379529 ) ) ( not ( = ?auto_379528 ?auto_379530 ) ) ( not ( = ?auto_379528 ?auto_379531 ) ) ( not ( = ?auto_379528 ?auto_379532 ) ) ( not ( = ?auto_379528 ?auto_379533 ) ) ( not ( = ?auto_379528 ?auto_379534 ) ) ( not ( = ?auto_379528 ?auto_379535 ) ) ( not ( = ?auto_379528 ?auto_379536 ) ) ( not ( = ?auto_379529 ?auto_379530 ) ) ( not ( = ?auto_379529 ?auto_379531 ) ) ( not ( = ?auto_379529 ?auto_379532 ) ) ( not ( = ?auto_379529 ?auto_379533 ) ) ( not ( = ?auto_379529 ?auto_379534 ) ) ( not ( = ?auto_379529 ?auto_379535 ) ) ( not ( = ?auto_379529 ?auto_379536 ) ) ( not ( = ?auto_379530 ?auto_379531 ) ) ( not ( = ?auto_379530 ?auto_379532 ) ) ( not ( = ?auto_379530 ?auto_379533 ) ) ( not ( = ?auto_379530 ?auto_379534 ) ) ( not ( = ?auto_379530 ?auto_379535 ) ) ( not ( = ?auto_379530 ?auto_379536 ) ) ( not ( = ?auto_379531 ?auto_379532 ) ) ( not ( = ?auto_379531 ?auto_379533 ) ) ( not ( = ?auto_379531 ?auto_379534 ) ) ( not ( = ?auto_379531 ?auto_379535 ) ) ( not ( = ?auto_379531 ?auto_379536 ) ) ( not ( = ?auto_379532 ?auto_379533 ) ) ( not ( = ?auto_379532 ?auto_379534 ) ) ( not ( = ?auto_379532 ?auto_379535 ) ) ( not ( = ?auto_379532 ?auto_379536 ) ) ( not ( = ?auto_379533 ?auto_379534 ) ) ( not ( = ?auto_379533 ?auto_379535 ) ) ( not ( = ?auto_379533 ?auto_379536 ) ) ( not ( = ?auto_379534 ?auto_379535 ) ) ( not ( = ?auto_379534 ?auto_379536 ) ) ( not ( = ?auto_379535 ?auto_379536 ) ) ( ON ?auto_379534 ?auto_379535 ) ( ON ?auto_379533 ?auto_379534 ) ( ON ?auto_379532 ?auto_379533 ) ( ON ?auto_379531 ?auto_379532 ) ( ON ?auto_379530 ?auto_379531 ) ( ON ?auto_379529 ?auto_379530 ) ( ON ?auto_379528 ?auto_379529 ) ( ON ?auto_379527 ?auto_379528 ) ( CLEAR ?auto_379525 ) ( ON ?auto_379526 ?auto_379527 ) ( CLEAR ?auto_379526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_379523 ?auto_379524 ?auto_379525 ?auto_379526 )
      ( MAKE-13PILE ?auto_379523 ?auto_379524 ?auto_379525 ?auto_379526 ?auto_379527 ?auto_379528 ?auto_379529 ?auto_379530 ?auto_379531 ?auto_379532 ?auto_379533 ?auto_379534 ?auto_379535 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379550 - BLOCK
      ?auto_379551 - BLOCK
      ?auto_379552 - BLOCK
      ?auto_379553 - BLOCK
      ?auto_379554 - BLOCK
      ?auto_379555 - BLOCK
      ?auto_379556 - BLOCK
      ?auto_379557 - BLOCK
      ?auto_379558 - BLOCK
      ?auto_379559 - BLOCK
      ?auto_379560 - BLOCK
      ?auto_379561 - BLOCK
      ?auto_379562 - BLOCK
    )
    :vars
    (
      ?auto_379563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379562 ?auto_379563 ) ( ON-TABLE ?auto_379550 ) ( ON ?auto_379551 ?auto_379550 ) ( ON ?auto_379552 ?auto_379551 ) ( not ( = ?auto_379550 ?auto_379551 ) ) ( not ( = ?auto_379550 ?auto_379552 ) ) ( not ( = ?auto_379550 ?auto_379553 ) ) ( not ( = ?auto_379550 ?auto_379554 ) ) ( not ( = ?auto_379550 ?auto_379555 ) ) ( not ( = ?auto_379550 ?auto_379556 ) ) ( not ( = ?auto_379550 ?auto_379557 ) ) ( not ( = ?auto_379550 ?auto_379558 ) ) ( not ( = ?auto_379550 ?auto_379559 ) ) ( not ( = ?auto_379550 ?auto_379560 ) ) ( not ( = ?auto_379550 ?auto_379561 ) ) ( not ( = ?auto_379550 ?auto_379562 ) ) ( not ( = ?auto_379550 ?auto_379563 ) ) ( not ( = ?auto_379551 ?auto_379552 ) ) ( not ( = ?auto_379551 ?auto_379553 ) ) ( not ( = ?auto_379551 ?auto_379554 ) ) ( not ( = ?auto_379551 ?auto_379555 ) ) ( not ( = ?auto_379551 ?auto_379556 ) ) ( not ( = ?auto_379551 ?auto_379557 ) ) ( not ( = ?auto_379551 ?auto_379558 ) ) ( not ( = ?auto_379551 ?auto_379559 ) ) ( not ( = ?auto_379551 ?auto_379560 ) ) ( not ( = ?auto_379551 ?auto_379561 ) ) ( not ( = ?auto_379551 ?auto_379562 ) ) ( not ( = ?auto_379551 ?auto_379563 ) ) ( not ( = ?auto_379552 ?auto_379553 ) ) ( not ( = ?auto_379552 ?auto_379554 ) ) ( not ( = ?auto_379552 ?auto_379555 ) ) ( not ( = ?auto_379552 ?auto_379556 ) ) ( not ( = ?auto_379552 ?auto_379557 ) ) ( not ( = ?auto_379552 ?auto_379558 ) ) ( not ( = ?auto_379552 ?auto_379559 ) ) ( not ( = ?auto_379552 ?auto_379560 ) ) ( not ( = ?auto_379552 ?auto_379561 ) ) ( not ( = ?auto_379552 ?auto_379562 ) ) ( not ( = ?auto_379552 ?auto_379563 ) ) ( not ( = ?auto_379553 ?auto_379554 ) ) ( not ( = ?auto_379553 ?auto_379555 ) ) ( not ( = ?auto_379553 ?auto_379556 ) ) ( not ( = ?auto_379553 ?auto_379557 ) ) ( not ( = ?auto_379553 ?auto_379558 ) ) ( not ( = ?auto_379553 ?auto_379559 ) ) ( not ( = ?auto_379553 ?auto_379560 ) ) ( not ( = ?auto_379553 ?auto_379561 ) ) ( not ( = ?auto_379553 ?auto_379562 ) ) ( not ( = ?auto_379553 ?auto_379563 ) ) ( not ( = ?auto_379554 ?auto_379555 ) ) ( not ( = ?auto_379554 ?auto_379556 ) ) ( not ( = ?auto_379554 ?auto_379557 ) ) ( not ( = ?auto_379554 ?auto_379558 ) ) ( not ( = ?auto_379554 ?auto_379559 ) ) ( not ( = ?auto_379554 ?auto_379560 ) ) ( not ( = ?auto_379554 ?auto_379561 ) ) ( not ( = ?auto_379554 ?auto_379562 ) ) ( not ( = ?auto_379554 ?auto_379563 ) ) ( not ( = ?auto_379555 ?auto_379556 ) ) ( not ( = ?auto_379555 ?auto_379557 ) ) ( not ( = ?auto_379555 ?auto_379558 ) ) ( not ( = ?auto_379555 ?auto_379559 ) ) ( not ( = ?auto_379555 ?auto_379560 ) ) ( not ( = ?auto_379555 ?auto_379561 ) ) ( not ( = ?auto_379555 ?auto_379562 ) ) ( not ( = ?auto_379555 ?auto_379563 ) ) ( not ( = ?auto_379556 ?auto_379557 ) ) ( not ( = ?auto_379556 ?auto_379558 ) ) ( not ( = ?auto_379556 ?auto_379559 ) ) ( not ( = ?auto_379556 ?auto_379560 ) ) ( not ( = ?auto_379556 ?auto_379561 ) ) ( not ( = ?auto_379556 ?auto_379562 ) ) ( not ( = ?auto_379556 ?auto_379563 ) ) ( not ( = ?auto_379557 ?auto_379558 ) ) ( not ( = ?auto_379557 ?auto_379559 ) ) ( not ( = ?auto_379557 ?auto_379560 ) ) ( not ( = ?auto_379557 ?auto_379561 ) ) ( not ( = ?auto_379557 ?auto_379562 ) ) ( not ( = ?auto_379557 ?auto_379563 ) ) ( not ( = ?auto_379558 ?auto_379559 ) ) ( not ( = ?auto_379558 ?auto_379560 ) ) ( not ( = ?auto_379558 ?auto_379561 ) ) ( not ( = ?auto_379558 ?auto_379562 ) ) ( not ( = ?auto_379558 ?auto_379563 ) ) ( not ( = ?auto_379559 ?auto_379560 ) ) ( not ( = ?auto_379559 ?auto_379561 ) ) ( not ( = ?auto_379559 ?auto_379562 ) ) ( not ( = ?auto_379559 ?auto_379563 ) ) ( not ( = ?auto_379560 ?auto_379561 ) ) ( not ( = ?auto_379560 ?auto_379562 ) ) ( not ( = ?auto_379560 ?auto_379563 ) ) ( not ( = ?auto_379561 ?auto_379562 ) ) ( not ( = ?auto_379561 ?auto_379563 ) ) ( not ( = ?auto_379562 ?auto_379563 ) ) ( ON ?auto_379561 ?auto_379562 ) ( ON ?auto_379560 ?auto_379561 ) ( ON ?auto_379559 ?auto_379560 ) ( ON ?auto_379558 ?auto_379559 ) ( ON ?auto_379557 ?auto_379558 ) ( ON ?auto_379556 ?auto_379557 ) ( ON ?auto_379555 ?auto_379556 ) ( ON ?auto_379554 ?auto_379555 ) ( CLEAR ?auto_379552 ) ( ON ?auto_379553 ?auto_379554 ) ( CLEAR ?auto_379553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_379550 ?auto_379551 ?auto_379552 ?auto_379553 )
      ( MAKE-13PILE ?auto_379550 ?auto_379551 ?auto_379552 ?auto_379553 ?auto_379554 ?auto_379555 ?auto_379556 ?auto_379557 ?auto_379558 ?auto_379559 ?auto_379560 ?auto_379561 ?auto_379562 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379577 - BLOCK
      ?auto_379578 - BLOCK
      ?auto_379579 - BLOCK
      ?auto_379580 - BLOCK
      ?auto_379581 - BLOCK
      ?auto_379582 - BLOCK
      ?auto_379583 - BLOCK
      ?auto_379584 - BLOCK
      ?auto_379585 - BLOCK
      ?auto_379586 - BLOCK
      ?auto_379587 - BLOCK
      ?auto_379588 - BLOCK
      ?auto_379589 - BLOCK
    )
    :vars
    (
      ?auto_379590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379589 ?auto_379590 ) ( ON-TABLE ?auto_379577 ) ( ON ?auto_379578 ?auto_379577 ) ( not ( = ?auto_379577 ?auto_379578 ) ) ( not ( = ?auto_379577 ?auto_379579 ) ) ( not ( = ?auto_379577 ?auto_379580 ) ) ( not ( = ?auto_379577 ?auto_379581 ) ) ( not ( = ?auto_379577 ?auto_379582 ) ) ( not ( = ?auto_379577 ?auto_379583 ) ) ( not ( = ?auto_379577 ?auto_379584 ) ) ( not ( = ?auto_379577 ?auto_379585 ) ) ( not ( = ?auto_379577 ?auto_379586 ) ) ( not ( = ?auto_379577 ?auto_379587 ) ) ( not ( = ?auto_379577 ?auto_379588 ) ) ( not ( = ?auto_379577 ?auto_379589 ) ) ( not ( = ?auto_379577 ?auto_379590 ) ) ( not ( = ?auto_379578 ?auto_379579 ) ) ( not ( = ?auto_379578 ?auto_379580 ) ) ( not ( = ?auto_379578 ?auto_379581 ) ) ( not ( = ?auto_379578 ?auto_379582 ) ) ( not ( = ?auto_379578 ?auto_379583 ) ) ( not ( = ?auto_379578 ?auto_379584 ) ) ( not ( = ?auto_379578 ?auto_379585 ) ) ( not ( = ?auto_379578 ?auto_379586 ) ) ( not ( = ?auto_379578 ?auto_379587 ) ) ( not ( = ?auto_379578 ?auto_379588 ) ) ( not ( = ?auto_379578 ?auto_379589 ) ) ( not ( = ?auto_379578 ?auto_379590 ) ) ( not ( = ?auto_379579 ?auto_379580 ) ) ( not ( = ?auto_379579 ?auto_379581 ) ) ( not ( = ?auto_379579 ?auto_379582 ) ) ( not ( = ?auto_379579 ?auto_379583 ) ) ( not ( = ?auto_379579 ?auto_379584 ) ) ( not ( = ?auto_379579 ?auto_379585 ) ) ( not ( = ?auto_379579 ?auto_379586 ) ) ( not ( = ?auto_379579 ?auto_379587 ) ) ( not ( = ?auto_379579 ?auto_379588 ) ) ( not ( = ?auto_379579 ?auto_379589 ) ) ( not ( = ?auto_379579 ?auto_379590 ) ) ( not ( = ?auto_379580 ?auto_379581 ) ) ( not ( = ?auto_379580 ?auto_379582 ) ) ( not ( = ?auto_379580 ?auto_379583 ) ) ( not ( = ?auto_379580 ?auto_379584 ) ) ( not ( = ?auto_379580 ?auto_379585 ) ) ( not ( = ?auto_379580 ?auto_379586 ) ) ( not ( = ?auto_379580 ?auto_379587 ) ) ( not ( = ?auto_379580 ?auto_379588 ) ) ( not ( = ?auto_379580 ?auto_379589 ) ) ( not ( = ?auto_379580 ?auto_379590 ) ) ( not ( = ?auto_379581 ?auto_379582 ) ) ( not ( = ?auto_379581 ?auto_379583 ) ) ( not ( = ?auto_379581 ?auto_379584 ) ) ( not ( = ?auto_379581 ?auto_379585 ) ) ( not ( = ?auto_379581 ?auto_379586 ) ) ( not ( = ?auto_379581 ?auto_379587 ) ) ( not ( = ?auto_379581 ?auto_379588 ) ) ( not ( = ?auto_379581 ?auto_379589 ) ) ( not ( = ?auto_379581 ?auto_379590 ) ) ( not ( = ?auto_379582 ?auto_379583 ) ) ( not ( = ?auto_379582 ?auto_379584 ) ) ( not ( = ?auto_379582 ?auto_379585 ) ) ( not ( = ?auto_379582 ?auto_379586 ) ) ( not ( = ?auto_379582 ?auto_379587 ) ) ( not ( = ?auto_379582 ?auto_379588 ) ) ( not ( = ?auto_379582 ?auto_379589 ) ) ( not ( = ?auto_379582 ?auto_379590 ) ) ( not ( = ?auto_379583 ?auto_379584 ) ) ( not ( = ?auto_379583 ?auto_379585 ) ) ( not ( = ?auto_379583 ?auto_379586 ) ) ( not ( = ?auto_379583 ?auto_379587 ) ) ( not ( = ?auto_379583 ?auto_379588 ) ) ( not ( = ?auto_379583 ?auto_379589 ) ) ( not ( = ?auto_379583 ?auto_379590 ) ) ( not ( = ?auto_379584 ?auto_379585 ) ) ( not ( = ?auto_379584 ?auto_379586 ) ) ( not ( = ?auto_379584 ?auto_379587 ) ) ( not ( = ?auto_379584 ?auto_379588 ) ) ( not ( = ?auto_379584 ?auto_379589 ) ) ( not ( = ?auto_379584 ?auto_379590 ) ) ( not ( = ?auto_379585 ?auto_379586 ) ) ( not ( = ?auto_379585 ?auto_379587 ) ) ( not ( = ?auto_379585 ?auto_379588 ) ) ( not ( = ?auto_379585 ?auto_379589 ) ) ( not ( = ?auto_379585 ?auto_379590 ) ) ( not ( = ?auto_379586 ?auto_379587 ) ) ( not ( = ?auto_379586 ?auto_379588 ) ) ( not ( = ?auto_379586 ?auto_379589 ) ) ( not ( = ?auto_379586 ?auto_379590 ) ) ( not ( = ?auto_379587 ?auto_379588 ) ) ( not ( = ?auto_379587 ?auto_379589 ) ) ( not ( = ?auto_379587 ?auto_379590 ) ) ( not ( = ?auto_379588 ?auto_379589 ) ) ( not ( = ?auto_379588 ?auto_379590 ) ) ( not ( = ?auto_379589 ?auto_379590 ) ) ( ON ?auto_379588 ?auto_379589 ) ( ON ?auto_379587 ?auto_379588 ) ( ON ?auto_379586 ?auto_379587 ) ( ON ?auto_379585 ?auto_379586 ) ( ON ?auto_379584 ?auto_379585 ) ( ON ?auto_379583 ?auto_379584 ) ( ON ?auto_379582 ?auto_379583 ) ( ON ?auto_379581 ?auto_379582 ) ( ON ?auto_379580 ?auto_379581 ) ( CLEAR ?auto_379578 ) ( ON ?auto_379579 ?auto_379580 ) ( CLEAR ?auto_379579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_379577 ?auto_379578 ?auto_379579 )
      ( MAKE-13PILE ?auto_379577 ?auto_379578 ?auto_379579 ?auto_379580 ?auto_379581 ?auto_379582 ?auto_379583 ?auto_379584 ?auto_379585 ?auto_379586 ?auto_379587 ?auto_379588 ?auto_379589 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379604 - BLOCK
      ?auto_379605 - BLOCK
      ?auto_379606 - BLOCK
      ?auto_379607 - BLOCK
      ?auto_379608 - BLOCK
      ?auto_379609 - BLOCK
      ?auto_379610 - BLOCK
      ?auto_379611 - BLOCK
      ?auto_379612 - BLOCK
      ?auto_379613 - BLOCK
      ?auto_379614 - BLOCK
      ?auto_379615 - BLOCK
      ?auto_379616 - BLOCK
    )
    :vars
    (
      ?auto_379617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379616 ?auto_379617 ) ( ON-TABLE ?auto_379604 ) ( ON ?auto_379605 ?auto_379604 ) ( not ( = ?auto_379604 ?auto_379605 ) ) ( not ( = ?auto_379604 ?auto_379606 ) ) ( not ( = ?auto_379604 ?auto_379607 ) ) ( not ( = ?auto_379604 ?auto_379608 ) ) ( not ( = ?auto_379604 ?auto_379609 ) ) ( not ( = ?auto_379604 ?auto_379610 ) ) ( not ( = ?auto_379604 ?auto_379611 ) ) ( not ( = ?auto_379604 ?auto_379612 ) ) ( not ( = ?auto_379604 ?auto_379613 ) ) ( not ( = ?auto_379604 ?auto_379614 ) ) ( not ( = ?auto_379604 ?auto_379615 ) ) ( not ( = ?auto_379604 ?auto_379616 ) ) ( not ( = ?auto_379604 ?auto_379617 ) ) ( not ( = ?auto_379605 ?auto_379606 ) ) ( not ( = ?auto_379605 ?auto_379607 ) ) ( not ( = ?auto_379605 ?auto_379608 ) ) ( not ( = ?auto_379605 ?auto_379609 ) ) ( not ( = ?auto_379605 ?auto_379610 ) ) ( not ( = ?auto_379605 ?auto_379611 ) ) ( not ( = ?auto_379605 ?auto_379612 ) ) ( not ( = ?auto_379605 ?auto_379613 ) ) ( not ( = ?auto_379605 ?auto_379614 ) ) ( not ( = ?auto_379605 ?auto_379615 ) ) ( not ( = ?auto_379605 ?auto_379616 ) ) ( not ( = ?auto_379605 ?auto_379617 ) ) ( not ( = ?auto_379606 ?auto_379607 ) ) ( not ( = ?auto_379606 ?auto_379608 ) ) ( not ( = ?auto_379606 ?auto_379609 ) ) ( not ( = ?auto_379606 ?auto_379610 ) ) ( not ( = ?auto_379606 ?auto_379611 ) ) ( not ( = ?auto_379606 ?auto_379612 ) ) ( not ( = ?auto_379606 ?auto_379613 ) ) ( not ( = ?auto_379606 ?auto_379614 ) ) ( not ( = ?auto_379606 ?auto_379615 ) ) ( not ( = ?auto_379606 ?auto_379616 ) ) ( not ( = ?auto_379606 ?auto_379617 ) ) ( not ( = ?auto_379607 ?auto_379608 ) ) ( not ( = ?auto_379607 ?auto_379609 ) ) ( not ( = ?auto_379607 ?auto_379610 ) ) ( not ( = ?auto_379607 ?auto_379611 ) ) ( not ( = ?auto_379607 ?auto_379612 ) ) ( not ( = ?auto_379607 ?auto_379613 ) ) ( not ( = ?auto_379607 ?auto_379614 ) ) ( not ( = ?auto_379607 ?auto_379615 ) ) ( not ( = ?auto_379607 ?auto_379616 ) ) ( not ( = ?auto_379607 ?auto_379617 ) ) ( not ( = ?auto_379608 ?auto_379609 ) ) ( not ( = ?auto_379608 ?auto_379610 ) ) ( not ( = ?auto_379608 ?auto_379611 ) ) ( not ( = ?auto_379608 ?auto_379612 ) ) ( not ( = ?auto_379608 ?auto_379613 ) ) ( not ( = ?auto_379608 ?auto_379614 ) ) ( not ( = ?auto_379608 ?auto_379615 ) ) ( not ( = ?auto_379608 ?auto_379616 ) ) ( not ( = ?auto_379608 ?auto_379617 ) ) ( not ( = ?auto_379609 ?auto_379610 ) ) ( not ( = ?auto_379609 ?auto_379611 ) ) ( not ( = ?auto_379609 ?auto_379612 ) ) ( not ( = ?auto_379609 ?auto_379613 ) ) ( not ( = ?auto_379609 ?auto_379614 ) ) ( not ( = ?auto_379609 ?auto_379615 ) ) ( not ( = ?auto_379609 ?auto_379616 ) ) ( not ( = ?auto_379609 ?auto_379617 ) ) ( not ( = ?auto_379610 ?auto_379611 ) ) ( not ( = ?auto_379610 ?auto_379612 ) ) ( not ( = ?auto_379610 ?auto_379613 ) ) ( not ( = ?auto_379610 ?auto_379614 ) ) ( not ( = ?auto_379610 ?auto_379615 ) ) ( not ( = ?auto_379610 ?auto_379616 ) ) ( not ( = ?auto_379610 ?auto_379617 ) ) ( not ( = ?auto_379611 ?auto_379612 ) ) ( not ( = ?auto_379611 ?auto_379613 ) ) ( not ( = ?auto_379611 ?auto_379614 ) ) ( not ( = ?auto_379611 ?auto_379615 ) ) ( not ( = ?auto_379611 ?auto_379616 ) ) ( not ( = ?auto_379611 ?auto_379617 ) ) ( not ( = ?auto_379612 ?auto_379613 ) ) ( not ( = ?auto_379612 ?auto_379614 ) ) ( not ( = ?auto_379612 ?auto_379615 ) ) ( not ( = ?auto_379612 ?auto_379616 ) ) ( not ( = ?auto_379612 ?auto_379617 ) ) ( not ( = ?auto_379613 ?auto_379614 ) ) ( not ( = ?auto_379613 ?auto_379615 ) ) ( not ( = ?auto_379613 ?auto_379616 ) ) ( not ( = ?auto_379613 ?auto_379617 ) ) ( not ( = ?auto_379614 ?auto_379615 ) ) ( not ( = ?auto_379614 ?auto_379616 ) ) ( not ( = ?auto_379614 ?auto_379617 ) ) ( not ( = ?auto_379615 ?auto_379616 ) ) ( not ( = ?auto_379615 ?auto_379617 ) ) ( not ( = ?auto_379616 ?auto_379617 ) ) ( ON ?auto_379615 ?auto_379616 ) ( ON ?auto_379614 ?auto_379615 ) ( ON ?auto_379613 ?auto_379614 ) ( ON ?auto_379612 ?auto_379613 ) ( ON ?auto_379611 ?auto_379612 ) ( ON ?auto_379610 ?auto_379611 ) ( ON ?auto_379609 ?auto_379610 ) ( ON ?auto_379608 ?auto_379609 ) ( ON ?auto_379607 ?auto_379608 ) ( CLEAR ?auto_379605 ) ( ON ?auto_379606 ?auto_379607 ) ( CLEAR ?auto_379606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_379604 ?auto_379605 ?auto_379606 )
      ( MAKE-13PILE ?auto_379604 ?auto_379605 ?auto_379606 ?auto_379607 ?auto_379608 ?auto_379609 ?auto_379610 ?auto_379611 ?auto_379612 ?auto_379613 ?auto_379614 ?auto_379615 ?auto_379616 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379631 - BLOCK
      ?auto_379632 - BLOCK
      ?auto_379633 - BLOCK
      ?auto_379634 - BLOCK
      ?auto_379635 - BLOCK
      ?auto_379636 - BLOCK
      ?auto_379637 - BLOCK
      ?auto_379638 - BLOCK
      ?auto_379639 - BLOCK
      ?auto_379640 - BLOCK
      ?auto_379641 - BLOCK
      ?auto_379642 - BLOCK
      ?auto_379643 - BLOCK
    )
    :vars
    (
      ?auto_379644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379643 ?auto_379644 ) ( ON-TABLE ?auto_379631 ) ( not ( = ?auto_379631 ?auto_379632 ) ) ( not ( = ?auto_379631 ?auto_379633 ) ) ( not ( = ?auto_379631 ?auto_379634 ) ) ( not ( = ?auto_379631 ?auto_379635 ) ) ( not ( = ?auto_379631 ?auto_379636 ) ) ( not ( = ?auto_379631 ?auto_379637 ) ) ( not ( = ?auto_379631 ?auto_379638 ) ) ( not ( = ?auto_379631 ?auto_379639 ) ) ( not ( = ?auto_379631 ?auto_379640 ) ) ( not ( = ?auto_379631 ?auto_379641 ) ) ( not ( = ?auto_379631 ?auto_379642 ) ) ( not ( = ?auto_379631 ?auto_379643 ) ) ( not ( = ?auto_379631 ?auto_379644 ) ) ( not ( = ?auto_379632 ?auto_379633 ) ) ( not ( = ?auto_379632 ?auto_379634 ) ) ( not ( = ?auto_379632 ?auto_379635 ) ) ( not ( = ?auto_379632 ?auto_379636 ) ) ( not ( = ?auto_379632 ?auto_379637 ) ) ( not ( = ?auto_379632 ?auto_379638 ) ) ( not ( = ?auto_379632 ?auto_379639 ) ) ( not ( = ?auto_379632 ?auto_379640 ) ) ( not ( = ?auto_379632 ?auto_379641 ) ) ( not ( = ?auto_379632 ?auto_379642 ) ) ( not ( = ?auto_379632 ?auto_379643 ) ) ( not ( = ?auto_379632 ?auto_379644 ) ) ( not ( = ?auto_379633 ?auto_379634 ) ) ( not ( = ?auto_379633 ?auto_379635 ) ) ( not ( = ?auto_379633 ?auto_379636 ) ) ( not ( = ?auto_379633 ?auto_379637 ) ) ( not ( = ?auto_379633 ?auto_379638 ) ) ( not ( = ?auto_379633 ?auto_379639 ) ) ( not ( = ?auto_379633 ?auto_379640 ) ) ( not ( = ?auto_379633 ?auto_379641 ) ) ( not ( = ?auto_379633 ?auto_379642 ) ) ( not ( = ?auto_379633 ?auto_379643 ) ) ( not ( = ?auto_379633 ?auto_379644 ) ) ( not ( = ?auto_379634 ?auto_379635 ) ) ( not ( = ?auto_379634 ?auto_379636 ) ) ( not ( = ?auto_379634 ?auto_379637 ) ) ( not ( = ?auto_379634 ?auto_379638 ) ) ( not ( = ?auto_379634 ?auto_379639 ) ) ( not ( = ?auto_379634 ?auto_379640 ) ) ( not ( = ?auto_379634 ?auto_379641 ) ) ( not ( = ?auto_379634 ?auto_379642 ) ) ( not ( = ?auto_379634 ?auto_379643 ) ) ( not ( = ?auto_379634 ?auto_379644 ) ) ( not ( = ?auto_379635 ?auto_379636 ) ) ( not ( = ?auto_379635 ?auto_379637 ) ) ( not ( = ?auto_379635 ?auto_379638 ) ) ( not ( = ?auto_379635 ?auto_379639 ) ) ( not ( = ?auto_379635 ?auto_379640 ) ) ( not ( = ?auto_379635 ?auto_379641 ) ) ( not ( = ?auto_379635 ?auto_379642 ) ) ( not ( = ?auto_379635 ?auto_379643 ) ) ( not ( = ?auto_379635 ?auto_379644 ) ) ( not ( = ?auto_379636 ?auto_379637 ) ) ( not ( = ?auto_379636 ?auto_379638 ) ) ( not ( = ?auto_379636 ?auto_379639 ) ) ( not ( = ?auto_379636 ?auto_379640 ) ) ( not ( = ?auto_379636 ?auto_379641 ) ) ( not ( = ?auto_379636 ?auto_379642 ) ) ( not ( = ?auto_379636 ?auto_379643 ) ) ( not ( = ?auto_379636 ?auto_379644 ) ) ( not ( = ?auto_379637 ?auto_379638 ) ) ( not ( = ?auto_379637 ?auto_379639 ) ) ( not ( = ?auto_379637 ?auto_379640 ) ) ( not ( = ?auto_379637 ?auto_379641 ) ) ( not ( = ?auto_379637 ?auto_379642 ) ) ( not ( = ?auto_379637 ?auto_379643 ) ) ( not ( = ?auto_379637 ?auto_379644 ) ) ( not ( = ?auto_379638 ?auto_379639 ) ) ( not ( = ?auto_379638 ?auto_379640 ) ) ( not ( = ?auto_379638 ?auto_379641 ) ) ( not ( = ?auto_379638 ?auto_379642 ) ) ( not ( = ?auto_379638 ?auto_379643 ) ) ( not ( = ?auto_379638 ?auto_379644 ) ) ( not ( = ?auto_379639 ?auto_379640 ) ) ( not ( = ?auto_379639 ?auto_379641 ) ) ( not ( = ?auto_379639 ?auto_379642 ) ) ( not ( = ?auto_379639 ?auto_379643 ) ) ( not ( = ?auto_379639 ?auto_379644 ) ) ( not ( = ?auto_379640 ?auto_379641 ) ) ( not ( = ?auto_379640 ?auto_379642 ) ) ( not ( = ?auto_379640 ?auto_379643 ) ) ( not ( = ?auto_379640 ?auto_379644 ) ) ( not ( = ?auto_379641 ?auto_379642 ) ) ( not ( = ?auto_379641 ?auto_379643 ) ) ( not ( = ?auto_379641 ?auto_379644 ) ) ( not ( = ?auto_379642 ?auto_379643 ) ) ( not ( = ?auto_379642 ?auto_379644 ) ) ( not ( = ?auto_379643 ?auto_379644 ) ) ( ON ?auto_379642 ?auto_379643 ) ( ON ?auto_379641 ?auto_379642 ) ( ON ?auto_379640 ?auto_379641 ) ( ON ?auto_379639 ?auto_379640 ) ( ON ?auto_379638 ?auto_379639 ) ( ON ?auto_379637 ?auto_379638 ) ( ON ?auto_379636 ?auto_379637 ) ( ON ?auto_379635 ?auto_379636 ) ( ON ?auto_379634 ?auto_379635 ) ( ON ?auto_379633 ?auto_379634 ) ( CLEAR ?auto_379631 ) ( ON ?auto_379632 ?auto_379633 ) ( CLEAR ?auto_379632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_379631 ?auto_379632 )
      ( MAKE-13PILE ?auto_379631 ?auto_379632 ?auto_379633 ?auto_379634 ?auto_379635 ?auto_379636 ?auto_379637 ?auto_379638 ?auto_379639 ?auto_379640 ?auto_379641 ?auto_379642 ?auto_379643 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379658 - BLOCK
      ?auto_379659 - BLOCK
      ?auto_379660 - BLOCK
      ?auto_379661 - BLOCK
      ?auto_379662 - BLOCK
      ?auto_379663 - BLOCK
      ?auto_379664 - BLOCK
      ?auto_379665 - BLOCK
      ?auto_379666 - BLOCK
      ?auto_379667 - BLOCK
      ?auto_379668 - BLOCK
      ?auto_379669 - BLOCK
      ?auto_379670 - BLOCK
    )
    :vars
    (
      ?auto_379671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379670 ?auto_379671 ) ( ON-TABLE ?auto_379658 ) ( not ( = ?auto_379658 ?auto_379659 ) ) ( not ( = ?auto_379658 ?auto_379660 ) ) ( not ( = ?auto_379658 ?auto_379661 ) ) ( not ( = ?auto_379658 ?auto_379662 ) ) ( not ( = ?auto_379658 ?auto_379663 ) ) ( not ( = ?auto_379658 ?auto_379664 ) ) ( not ( = ?auto_379658 ?auto_379665 ) ) ( not ( = ?auto_379658 ?auto_379666 ) ) ( not ( = ?auto_379658 ?auto_379667 ) ) ( not ( = ?auto_379658 ?auto_379668 ) ) ( not ( = ?auto_379658 ?auto_379669 ) ) ( not ( = ?auto_379658 ?auto_379670 ) ) ( not ( = ?auto_379658 ?auto_379671 ) ) ( not ( = ?auto_379659 ?auto_379660 ) ) ( not ( = ?auto_379659 ?auto_379661 ) ) ( not ( = ?auto_379659 ?auto_379662 ) ) ( not ( = ?auto_379659 ?auto_379663 ) ) ( not ( = ?auto_379659 ?auto_379664 ) ) ( not ( = ?auto_379659 ?auto_379665 ) ) ( not ( = ?auto_379659 ?auto_379666 ) ) ( not ( = ?auto_379659 ?auto_379667 ) ) ( not ( = ?auto_379659 ?auto_379668 ) ) ( not ( = ?auto_379659 ?auto_379669 ) ) ( not ( = ?auto_379659 ?auto_379670 ) ) ( not ( = ?auto_379659 ?auto_379671 ) ) ( not ( = ?auto_379660 ?auto_379661 ) ) ( not ( = ?auto_379660 ?auto_379662 ) ) ( not ( = ?auto_379660 ?auto_379663 ) ) ( not ( = ?auto_379660 ?auto_379664 ) ) ( not ( = ?auto_379660 ?auto_379665 ) ) ( not ( = ?auto_379660 ?auto_379666 ) ) ( not ( = ?auto_379660 ?auto_379667 ) ) ( not ( = ?auto_379660 ?auto_379668 ) ) ( not ( = ?auto_379660 ?auto_379669 ) ) ( not ( = ?auto_379660 ?auto_379670 ) ) ( not ( = ?auto_379660 ?auto_379671 ) ) ( not ( = ?auto_379661 ?auto_379662 ) ) ( not ( = ?auto_379661 ?auto_379663 ) ) ( not ( = ?auto_379661 ?auto_379664 ) ) ( not ( = ?auto_379661 ?auto_379665 ) ) ( not ( = ?auto_379661 ?auto_379666 ) ) ( not ( = ?auto_379661 ?auto_379667 ) ) ( not ( = ?auto_379661 ?auto_379668 ) ) ( not ( = ?auto_379661 ?auto_379669 ) ) ( not ( = ?auto_379661 ?auto_379670 ) ) ( not ( = ?auto_379661 ?auto_379671 ) ) ( not ( = ?auto_379662 ?auto_379663 ) ) ( not ( = ?auto_379662 ?auto_379664 ) ) ( not ( = ?auto_379662 ?auto_379665 ) ) ( not ( = ?auto_379662 ?auto_379666 ) ) ( not ( = ?auto_379662 ?auto_379667 ) ) ( not ( = ?auto_379662 ?auto_379668 ) ) ( not ( = ?auto_379662 ?auto_379669 ) ) ( not ( = ?auto_379662 ?auto_379670 ) ) ( not ( = ?auto_379662 ?auto_379671 ) ) ( not ( = ?auto_379663 ?auto_379664 ) ) ( not ( = ?auto_379663 ?auto_379665 ) ) ( not ( = ?auto_379663 ?auto_379666 ) ) ( not ( = ?auto_379663 ?auto_379667 ) ) ( not ( = ?auto_379663 ?auto_379668 ) ) ( not ( = ?auto_379663 ?auto_379669 ) ) ( not ( = ?auto_379663 ?auto_379670 ) ) ( not ( = ?auto_379663 ?auto_379671 ) ) ( not ( = ?auto_379664 ?auto_379665 ) ) ( not ( = ?auto_379664 ?auto_379666 ) ) ( not ( = ?auto_379664 ?auto_379667 ) ) ( not ( = ?auto_379664 ?auto_379668 ) ) ( not ( = ?auto_379664 ?auto_379669 ) ) ( not ( = ?auto_379664 ?auto_379670 ) ) ( not ( = ?auto_379664 ?auto_379671 ) ) ( not ( = ?auto_379665 ?auto_379666 ) ) ( not ( = ?auto_379665 ?auto_379667 ) ) ( not ( = ?auto_379665 ?auto_379668 ) ) ( not ( = ?auto_379665 ?auto_379669 ) ) ( not ( = ?auto_379665 ?auto_379670 ) ) ( not ( = ?auto_379665 ?auto_379671 ) ) ( not ( = ?auto_379666 ?auto_379667 ) ) ( not ( = ?auto_379666 ?auto_379668 ) ) ( not ( = ?auto_379666 ?auto_379669 ) ) ( not ( = ?auto_379666 ?auto_379670 ) ) ( not ( = ?auto_379666 ?auto_379671 ) ) ( not ( = ?auto_379667 ?auto_379668 ) ) ( not ( = ?auto_379667 ?auto_379669 ) ) ( not ( = ?auto_379667 ?auto_379670 ) ) ( not ( = ?auto_379667 ?auto_379671 ) ) ( not ( = ?auto_379668 ?auto_379669 ) ) ( not ( = ?auto_379668 ?auto_379670 ) ) ( not ( = ?auto_379668 ?auto_379671 ) ) ( not ( = ?auto_379669 ?auto_379670 ) ) ( not ( = ?auto_379669 ?auto_379671 ) ) ( not ( = ?auto_379670 ?auto_379671 ) ) ( ON ?auto_379669 ?auto_379670 ) ( ON ?auto_379668 ?auto_379669 ) ( ON ?auto_379667 ?auto_379668 ) ( ON ?auto_379666 ?auto_379667 ) ( ON ?auto_379665 ?auto_379666 ) ( ON ?auto_379664 ?auto_379665 ) ( ON ?auto_379663 ?auto_379664 ) ( ON ?auto_379662 ?auto_379663 ) ( ON ?auto_379661 ?auto_379662 ) ( ON ?auto_379660 ?auto_379661 ) ( CLEAR ?auto_379658 ) ( ON ?auto_379659 ?auto_379660 ) ( CLEAR ?auto_379659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_379658 ?auto_379659 )
      ( MAKE-13PILE ?auto_379658 ?auto_379659 ?auto_379660 ?auto_379661 ?auto_379662 ?auto_379663 ?auto_379664 ?auto_379665 ?auto_379666 ?auto_379667 ?auto_379668 ?auto_379669 ?auto_379670 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379685 - BLOCK
      ?auto_379686 - BLOCK
      ?auto_379687 - BLOCK
      ?auto_379688 - BLOCK
      ?auto_379689 - BLOCK
      ?auto_379690 - BLOCK
      ?auto_379691 - BLOCK
      ?auto_379692 - BLOCK
      ?auto_379693 - BLOCK
      ?auto_379694 - BLOCK
      ?auto_379695 - BLOCK
      ?auto_379696 - BLOCK
      ?auto_379697 - BLOCK
    )
    :vars
    (
      ?auto_379698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379697 ?auto_379698 ) ( not ( = ?auto_379685 ?auto_379686 ) ) ( not ( = ?auto_379685 ?auto_379687 ) ) ( not ( = ?auto_379685 ?auto_379688 ) ) ( not ( = ?auto_379685 ?auto_379689 ) ) ( not ( = ?auto_379685 ?auto_379690 ) ) ( not ( = ?auto_379685 ?auto_379691 ) ) ( not ( = ?auto_379685 ?auto_379692 ) ) ( not ( = ?auto_379685 ?auto_379693 ) ) ( not ( = ?auto_379685 ?auto_379694 ) ) ( not ( = ?auto_379685 ?auto_379695 ) ) ( not ( = ?auto_379685 ?auto_379696 ) ) ( not ( = ?auto_379685 ?auto_379697 ) ) ( not ( = ?auto_379685 ?auto_379698 ) ) ( not ( = ?auto_379686 ?auto_379687 ) ) ( not ( = ?auto_379686 ?auto_379688 ) ) ( not ( = ?auto_379686 ?auto_379689 ) ) ( not ( = ?auto_379686 ?auto_379690 ) ) ( not ( = ?auto_379686 ?auto_379691 ) ) ( not ( = ?auto_379686 ?auto_379692 ) ) ( not ( = ?auto_379686 ?auto_379693 ) ) ( not ( = ?auto_379686 ?auto_379694 ) ) ( not ( = ?auto_379686 ?auto_379695 ) ) ( not ( = ?auto_379686 ?auto_379696 ) ) ( not ( = ?auto_379686 ?auto_379697 ) ) ( not ( = ?auto_379686 ?auto_379698 ) ) ( not ( = ?auto_379687 ?auto_379688 ) ) ( not ( = ?auto_379687 ?auto_379689 ) ) ( not ( = ?auto_379687 ?auto_379690 ) ) ( not ( = ?auto_379687 ?auto_379691 ) ) ( not ( = ?auto_379687 ?auto_379692 ) ) ( not ( = ?auto_379687 ?auto_379693 ) ) ( not ( = ?auto_379687 ?auto_379694 ) ) ( not ( = ?auto_379687 ?auto_379695 ) ) ( not ( = ?auto_379687 ?auto_379696 ) ) ( not ( = ?auto_379687 ?auto_379697 ) ) ( not ( = ?auto_379687 ?auto_379698 ) ) ( not ( = ?auto_379688 ?auto_379689 ) ) ( not ( = ?auto_379688 ?auto_379690 ) ) ( not ( = ?auto_379688 ?auto_379691 ) ) ( not ( = ?auto_379688 ?auto_379692 ) ) ( not ( = ?auto_379688 ?auto_379693 ) ) ( not ( = ?auto_379688 ?auto_379694 ) ) ( not ( = ?auto_379688 ?auto_379695 ) ) ( not ( = ?auto_379688 ?auto_379696 ) ) ( not ( = ?auto_379688 ?auto_379697 ) ) ( not ( = ?auto_379688 ?auto_379698 ) ) ( not ( = ?auto_379689 ?auto_379690 ) ) ( not ( = ?auto_379689 ?auto_379691 ) ) ( not ( = ?auto_379689 ?auto_379692 ) ) ( not ( = ?auto_379689 ?auto_379693 ) ) ( not ( = ?auto_379689 ?auto_379694 ) ) ( not ( = ?auto_379689 ?auto_379695 ) ) ( not ( = ?auto_379689 ?auto_379696 ) ) ( not ( = ?auto_379689 ?auto_379697 ) ) ( not ( = ?auto_379689 ?auto_379698 ) ) ( not ( = ?auto_379690 ?auto_379691 ) ) ( not ( = ?auto_379690 ?auto_379692 ) ) ( not ( = ?auto_379690 ?auto_379693 ) ) ( not ( = ?auto_379690 ?auto_379694 ) ) ( not ( = ?auto_379690 ?auto_379695 ) ) ( not ( = ?auto_379690 ?auto_379696 ) ) ( not ( = ?auto_379690 ?auto_379697 ) ) ( not ( = ?auto_379690 ?auto_379698 ) ) ( not ( = ?auto_379691 ?auto_379692 ) ) ( not ( = ?auto_379691 ?auto_379693 ) ) ( not ( = ?auto_379691 ?auto_379694 ) ) ( not ( = ?auto_379691 ?auto_379695 ) ) ( not ( = ?auto_379691 ?auto_379696 ) ) ( not ( = ?auto_379691 ?auto_379697 ) ) ( not ( = ?auto_379691 ?auto_379698 ) ) ( not ( = ?auto_379692 ?auto_379693 ) ) ( not ( = ?auto_379692 ?auto_379694 ) ) ( not ( = ?auto_379692 ?auto_379695 ) ) ( not ( = ?auto_379692 ?auto_379696 ) ) ( not ( = ?auto_379692 ?auto_379697 ) ) ( not ( = ?auto_379692 ?auto_379698 ) ) ( not ( = ?auto_379693 ?auto_379694 ) ) ( not ( = ?auto_379693 ?auto_379695 ) ) ( not ( = ?auto_379693 ?auto_379696 ) ) ( not ( = ?auto_379693 ?auto_379697 ) ) ( not ( = ?auto_379693 ?auto_379698 ) ) ( not ( = ?auto_379694 ?auto_379695 ) ) ( not ( = ?auto_379694 ?auto_379696 ) ) ( not ( = ?auto_379694 ?auto_379697 ) ) ( not ( = ?auto_379694 ?auto_379698 ) ) ( not ( = ?auto_379695 ?auto_379696 ) ) ( not ( = ?auto_379695 ?auto_379697 ) ) ( not ( = ?auto_379695 ?auto_379698 ) ) ( not ( = ?auto_379696 ?auto_379697 ) ) ( not ( = ?auto_379696 ?auto_379698 ) ) ( not ( = ?auto_379697 ?auto_379698 ) ) ( ON ?auto_379696 ?auto_379697 ) ( ON ?auto_379695 ?auto_379696 ) ( ON ?auto_379694 ?auto_379695 ) ( ON ?auto_379693 ?auto_379694 ) ( ON ?auto_379692 ?auto_379693 ) ( ON ?auto_379691 ?auto_379692 ) ( ON ?auto_379690 ?auto_379691 ) ( ON ?auto_379689 ?auto_379690 ) ( ON ?auto_379688 ?auto_379689 ) ( ON ?auto_379687 ?auto_379688 ) ( ON ?auto_379686 ?auto_379687 ) ( ON ?auto_379685 ?auto_379686 ) ( CLEAR ?auto_379685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_379685 )
      ( MAKE-13PILE ?auto_379685 ?auto_379686 ?auto_379687 ?auto_379688 ?auto_379689 ?auto_379690 ?auto_379691 ?auto_379692 ?auto_379693 ?auto_379694 ?auto_379695 ?auto_379696 ?auto_379697 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_379712 - BLOCK
      ?auto_379713 - BLOCK
      ?auto_379714 - BLOCK
      ?auto_379715 - BLOCK
      ?auto_379716 - BLOCK
      ?auto_379717 - BLOCK
      ?auto_379718 - BLOCK
      ?auto_379719 - BLOCK
      ?auto_379720 - BLOCK
      ?auto_379721 - BLOCK
      ?auto_379722 - BLOCK
      ?auto_379723 - BLOCK
      ?auto_379724 - BLOCK
    )
    :vars
    (
      ?auto_379725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379724 ?auto_379725 ) ( not ( = ?auto_379712 ?auto_379713 ) ) ( not ( = ?auto_379712 ?auto_379714 ) ) ( not ( = ?auto_379712 ?auto_379715 ) ) ( not ( = ?auto_379712 ?auto_379716 ) ) ( not ( = ?auto_379712 ?auto_379717 ) ) ( not ( = ?auto_379712 ?auto_379718 ) ) ( not ( = ?auto_379712 ?auto_379719 ) ) ( not ( = ?auto_379712 ?auto_379720 ) ) ( not ( = ?auto_379712 ?auto_379721 ) ) ( not ( = ?auto_379712 ?auto_379722 ) ) ( not ( = ?auto_379712 ?auto_379723 ) ) ( not ( = ?auto_379712 ?auto_379724 ) ) ( not ( = ?auto_379712 ?auto_379725 ) ) ( not ( = ?auto_379713 ?auto_379714 ) ) ( not ( = ?auto_379713 ?auto_379715 ) ) ( not ( = ?auto_379713 ?auto_379716 ) ) ( not ( = ?auto_379713 ?auto_379717 ) ) ( not ( = ?auto_379713 ?auto_379718 ) ) ( not ( = ?auto_379713 ?auto_379719 ) ) ( not ( = ?auto_379713 ?auto_379720 ) ) ( not ( = ?auto_379713 ?auto_379721 ) ) ( not ( = ?auto_379713 ?auto_379722 ) ) ( not ( = ?auto_379713 ?auto_379723 ) ) ( not ( = ?auto_379713 ?auto_379724 ) ) ( not ( = ?auto_379713 ?auto_379725 ) ) ( not ( = ?auto_379714 ?auto_379715 ) ) ( not ( = ?auto_379714 ?auto_379716 ) ) ( not ( = ?auto_379714 ?auto_379717 ) ) ( not ( = ?auto_379714 ?auto_379718 ) ) ( not ( = ?auto_379714 ?auto_379719 ) ) ( not ( = ?auto_379714 ?auto_379720 ) ) ( not ( = ?auto_379714 ?auto_379721 ) ) ( not ( = ?auto_379714 ?auto_379722 ) ) ( not ( = ?auto_379714 ?auto_379723 ) ) ( not ( = ?auto_379714 ?auto_379724 ) ) ( not ( = ?auto_379714 ?auto_379725 ) ) ( not ( = ?auto_379715 ?auto_379716 ) ) ( not ( = ?auto_379715 ?auto_379717 ) ) ( not ( = ?auto_379715 ?auto_379718 ) ) ( not ( = ?auto_379715 ?auto_379719 ) ) ( not ( = ?auto_379715 ?auto_379720 ) ) ( not ( = ?auto_379715 ?auto_379721 ) ) ( not ( = ?auto_379715 ?auto_379722 ) ) ( not ( = ?auto_379715 ?auto_379723 ) ) ( not ( = ?auto_379715 ?auto_379724 ) ) ( not ( = ?auto_379715 ?auto_379725 ) ) ( not ( = ?auto_379716 ?auto_379717 ) ) ( not ( = ?auto_379716 ?auto_379718 ) ) ( not ( = ?auto_379716 ?auto_379719 ) ) ( not ( = ?auto_379716 ?auto_379720 ) ) ( not ( = ?auto_379716 ?auto_379721 ) ) ( not ( = ?auto_379716 ?auto_379722 ) ) ( not ( = ?auto_379716 ?auto_379723 ) ) ( not ( = ?auto_379716 ?auto_379724 ) ) ( not ( = ?auto_379716 ?auto_379725 ) ) ( not ( = ?auto_379717 ?auto_379718 ) ) ( not ( = ?auto_379717 ?auto_379719 ) ) ( not ( = ?auto_379717 ?auto_379720 ) ) ( not ( = ?auto_379717 ?auto_379721 ) ) ( not ( = ?auto_379717 ?auto_379722 ) ) ( not ( = ?auto_379717 ?auto_379723 ) ) ( not ( = ?auto_379717 ?auto_379724 ) ) ( not ( = ?auto_379717 ?auto_379725 ) ) ( not ( = ?auto_379718 ?auto_379719 ) ) ( not ( = ?auto_379718 ?auto_379720 ) ) ( not ( = ?auto_379718 ?auto_379721 ) ) ( not ( = ?auto_379718 ?auto_379722 ) ) ( not ( = ?auto_379718 ?auto_379723 ) ) ( not ( = ?auto_379718 ?auto_379724 ) ) ( not ( = ?auto_379718 ?auto_379725 ) ) ( not ( = ?auto_379719 ?auto_379720 ) ) ( not ( = ?auto_379719 ?auto_379721 ) ) ( not ( = ?auto_379719 ?auto_379722 ) ) ( not ( = ?auto_379719 ?auto_379723 ) ) ( not ( = ?auto_379719 ?auto_379724 ) ) ( not ( = ?auto_379719 ?auto_379725 ) ) ( not ( = ?auto_379720 ?auto_379721 ) ) ( not ( = ?auto_379720 ?auto_379722 ) ) ( not ( = ?auto_379720 ?auto_379723 ) ) ( not ( = ?auto_379720 ?auto_379724 ) ) ( not ( = ?auto_379720 ?auto_379725 ) ) ( not ( = ?auto_379721 ?auto_379722 ) ) ( not ( = ?auto_379721 ?auto_379723 ) ) ( not ( = ?auto_379721 ?auto_379724 ) ) ( not ( = ?auto_379721 ?auto_379725 ) ) ( not ( = ?auto_379722 ?auto_379723 ) ) ( not ( = ?auto_379722 ?auto_379724 ) ) ( not ( = ?auto_379722 ?auto_379725 ) ) ( not ( = ?auto_379723 ?auto_379724 ) ) ( not ( = ?auto_379723 ?auto_379725 ) ) ( not ( = ?auto_379724 ?auto_379725 ) ) ( ON ?auto_379723 ?auto_379724 ) ( ON ?auto_379722 ?auto_379723 ) ( ON ?auto_379721 ?auto_379722 ) ( ON ?auto_379720 ?auto_379721 ) ( ON ?auto_379719 ?auto_379720 ) ( ON ?auto_379718 ?auto_379719 ) ( ON ?auto_379717 ?auto_379718 ) ( ON ?auto_379716 ?auto_379717 ) ( ON ?auto_379715 ?auto_379716 ) ( ON ?auto_379714 ?auto_379715 ) ( ON ?auto_379713 ?auto_379714 ) ( ON ?auto_379712 ?auto_379713 ) ( CLEAR ?auto_379712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_379712 )
      ( MAKE-13PILE ?auto_379712 ?auto_379713 ?auto_379714 ?auto_379715 ?auto_379716 ?auto_379717 ?auto_379718 ?auto_379719 ?auto_379720 ?auto_379721 ?auto_379722 ?auto_379723 ?auto_379724 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_379740 - BLOCK
      ?auto_379741 - BLOCK
      ?auto_379742 - BLOCK
      ?auto_379743 - BLOCK
      ?auto_379744 - BLOCK
      ?auto_379745 - BLOCK
      ?auto_379746 - BLOCK
      ?auto_379747 - BLOCK
      ?auto_379748 - BLOCK
      ?auto_379749 - BLOCK
      ?auto_379750 - BLOCK
      ?auto_379751 - BLOCK
      ?auto_379752 - BLOCK
      ?auto_379753 - BLOCK
    )
    :vars
    (
      ?auto_379754 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_379752 ) ( ON ?auto_379753 ?auto_379754 ) ( CLEAR ?auto_379753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_379740 ) ( ON ?auto_379741 ?auto_379740 ) ( ON ?auto_379742 ?auto_379741 ) ( ON ?auto_379743 ?auto_379742 ) ( ON ?auto_379744 ?auto_379743 ) ( ON ?auto_379745 ?auto_379744 ) ( ON ?auto_379746 ?auto_379745 ) ( ON ?auto_379747 ?auto_379746 ) ( ON ?auto_379748 ?auto_379747 ) ( ON ?auto_379749 ?auto_379748 ) ( ON ?auto_379750 ?auto_379749 ) ( ON ?auto_379751 ?auto_379750 ) ( ON ?auto_379752 ?auto_379751 ) ( not ( = ?auto_379740 ?auto_379741 ) ) ( not ( = ?auto_379740 ?auto_379742 ) ) ( not ( = ?auto_379740 ?auto_379743 ) ) ( not ( = ?auto_379740 ?auto_379744 ) ) ( not ( = ?auto_379740 ?auto_379745 ) ) ( not ( = ?auto_379740 ?auto_379746 ) ) ( not ( = ?auto_379740 ?auto_379747 ) ) ( not ( = ?auto_379740 ?auto_379748 ) ) ( not ( = ?auto_379740 ?auto_379749 ) ) ( not ( = ?auto_379740 ?auto_379750 ) ) ( not ( = ?auto_379740 ?auto_379751 ) ) ( not ( = ?auto_379740 ?auto_379752 ) ) ( not ( = ?auto_379740 ?auto_379753 ) ) ( not ( = ?auto_379740 ?auto_379754 ) ) ( not ( = ?auto_379741 ?auto_379742 ) ) ( not ( = ?auto_379741 ?auto_379743 ) ) ( not ( = ?auto_379741 ?auto_379744 ) ) ( not ( = ?auto_379741 ?auto_379745 ) ) ( not ( = ?auto_379741 ?auto_379746 ) ) ( not ( = ?auto_379741 ?auto_379747 ) ) ( not ( = ?auto_379741 ?auto_379748 ) ) ( not ( = ?auto_379741 ?auto_379749 ) ) ( not ( = ?auto_379741 ?auto_379750 ) ) ( not ( = ?auto_379741 ?auto_379751 ) ) ( not ( = ?auto_379741 ?auto_379752 ) ) ( not ( = ?auto_379741 ?auto_379753 ) ) ( not ( = ?auto_379741 ?auto_379754 ) ) ( not ( = ?auto_379742 ?auto_379743 ) ) ( not ( = ?auto_379742 ?auto_379744 ) ) ( not ( = ?auto_379742 ?auto_379745 ) ) ( not ( = ?auto_379742 ?auto_379746 ) ) ( not ( = ?auto_379742 ?auto_379747 ) ) ( not ( = ?auto_379742 ?auto_379748 ) ) ( not ( = ?auto_379742 ?auto_379749 ) ) ( not ( = ?auto_379742 ?auto_379750 ) ) ( not ( = ?auto_379742 ?auto_379751 ) ) ( not ( = ?auto_379742 ?auto_379752 ) ) ( not ( = ?auto_379742 ?auto_379753 ) ) ( not ( = ?auto_379742 ?auto_379754 ) ) ( not ( = ?auto_379743 ?auto_379744 ) ) ( not ( = ?auto_379743 ?auto_379745 ) ) ( not ( = ?auto_379743 ?auto_379746 ) ) ( not ( = ?auto_379743 ?auto_379747 ) ) ( not ( = ?auto_379743 ?auto_379748 ) ) ( not ( = ?auto_379743 ?auto_379749 ) ) ( not ( = ?auto_379743 ?auto_379750 ) ) ( not ( = ?auto_379743 ?auto_379751 ) ) ( not ( = ?auto_379743 ?auto_379752 ) ) ( not ( = ?auto_379743 ?auto_379753 ) ) ( not ( = ?auto_379743 ?auto_379754 ) ) ( not ( = ?auto_379744 ?auto_379745 ) ) ( not ( = ?auto_379744 ?auto_379746 ) ) ( not ( = ?auto_379744 ?auto_379747 ) ) ( not ( = ?auto_379744 ?auto_379748 ) ) ( not ( = ?auto_379744 ?auto_379749 ) ) ( not ( = ?auto_379744 ?auto_379750 ) ) ( not ( = ?auto_379744 ?auto_379751 ) ) ( not ( = ?auto_379744 ?auto_379752 ) ) ( not ( = ?auto_379744 ?auto_379753 ) ) ( not ( = ?auto_379744 ?auto_379754 ) ) ( not ( = ?auto_379745 ?auto_379746 ) ) ( not ( = ?auto_379745 ?auto_379747 ) ) ( not ( = ?auto_379745 ?auto_379748 ) ) ( not ( = ?auto_379745 ?auto_379749 ) ) ( not ( = ?auto_379745 ?auto_379750 ) ) ( not ( = ?auto_379745 ?auto_379751 ) ) ( not ( = ?auto_379745 ?auto_379752 ) ) ( not ( = ?auto_379745 ?auto_379753 ) ) ( not ( = ?auto_379745 ?auto_379754 ) ) ( not ( = ?auto_379746 ?auto_379747 ) ) ( not ( = ?auto_379746 ?auto_379748 ) ) ( not ( = ?auto_379746 ?auto_379749 ) ) ( not ( = ?auto_379746 ?auto_379750 ) ) ( not ( = ?auto_379746 ?auto_379751 ) ) ( not ( = ?auto_379746 ?auto_379752 ) ) ( not ( = ?auto_379746 ?auto_379753 ) ) ( not ( = ?auto_379746 ?auto_379754 ) ) ( not ( = ?auto_379747 ?auto_379748 ) ) ( not ( = ?auto_379747 ?auto_379749 ) ) ( not ( = ?auto_379747 ?auto_379750 ) ) ( not ( = ?auto_379747 ?auto_379751 ) ) ( not ( = ?auto_379747 ?auto_379752 ) ) ( not ( = ?auto_379747 ?auto_379753 ) ) ( not ( = ?auto_379747 ?auto_379754 ) ) ( not ( = ?auto_379748 ?auto_379749 ) ) ( not ( = ?auto_379748 ?auto_379750 ) ) ( not ( = ?auto_379748 ?auto_379751 ) ) ( not ( = ?auto_379748 ?auto_379752 ) ) ( not ( = ?auto_379748 ?auto_379753 ) ) ( not ( = ?auto_379748 ?auto_379754 ) ) ( not ( = ?auto_379749 ?auto_379750 ) ) ( not ( = ?auto_379749 ?auto_379751 ) ) ( not ( = ?auto_379749 ?auto_379752 ) ) ( not ( = ?auto_379749 ?auto_379753 ) ) ( not ( = ?auto_379749 ?auto_379754 ) ) ( not ( = ?auto_379750 ?auto_379751 ) ) ( not ( = ?auto_379750 ?auto_379752 ) ) ( not ( = ?auto_379750 ?auto_379753 ) ) ( not ( = ?auto_379750 ?auto_379754 ) ) ( not ( = ?auto_379751 ?auto_379752 ) ) ( not ( = ?auto_379751 ?auto_379753 ) ) ( not ( = ?auto_379751 ?auto_379754 ) ) ( not ( = ?auto_379752 ?auto_379753 ) ) ( not ( = ?auto_379752 ?auto_379754 ) ) ( not ( = ?auto_379753 ?auto_379754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_379753 ?auto_379754 )
      ( !STACK ?auto_379753 ?auto_379752 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_379769 - BLOCK
      ?auto_379770 - BLOCK
      ?auto_379771 - BLOCK
      ?auto_379772 - BLOCK
      ?auto_379773 - BLOCK
      ?auto_379774 - BLOCK
      ?auto_379775 - BLOCK
      ?auto_379776 - BLOCK
      ?auto_379777 - BLOCK
      ?auto_379778 - BLOCK
      ?auto_379779 - BLOCK
      ?auto_379780 - BLOCK
      ?auto_379781 - BLOCK
      ?auto_379782 - BLOCK
    )
    :vars
    (
      ?auto_379783 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_379781 ) ( ON ?auto_379782 ?auto_379783 ) ( CLEAR ?auto_379782 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_379769 ) ( ON ?auto_379770 ?auto_379769 ) ( ON ?auto_379771 ?auto_379770 ) ( ON ?auto_379772 ?auto_379771 ) ( ON ?auto_379773 ?auto_379772 ) ( ON ?auto_379774 ?auto_379773 ) ( ON ?auto_379775 ?auto_379774 ) ( ON ?auto_379776 ?auto_379775 ) ( ON ?auto_379777 ?auto_379776 ) ( ON ?auto_379778 ?auto_379777 ) ( ON ?auto_379779 ?auto_379778 ) ( ON ?auto_379780 ?auto_379779 ) ( ON ?auto_379781 ?auto_379780 ) ( not ( = ?auto_379769 ?auto_379770 ) ) ( not ( = ?auto_379769 ?auto_379771 ) ) ( not ( = ?auto_379769 ?auto_379772 ) ) ( not ( = ?auto_379769 ?auto_379773 ) ) ( not ( = ?auto_379769 ?auto_379774 ) ) ( not ( = ?auto_379769 ?auto_379775 ) ) ( not ( = ?auto_379769 ?auto_379776 ) ) ( not ( = ?auto_379769 ?auto_379777 ) ) ( not ( = ?auto_379769 ?auto_379778 ) ) ( not ( = ?auto_379769 ?auto_379779 ) ) ( not ( = ?auto_379769 ?auto_379780 ) ) ( not ( = ?auto_379769 ?auto_379781 ) ) ( not ( = ?auto_379769 ?auto_379782 ) ) ( not ( = ?auto_379769 ?auto_379783 ) ) ( not ( = ?auto_379770 ?auto_379771 ) ) ( not ( = ?auto_379770 ?auto_379772 ) ) ( not ( = ?auto_379770 ?auto_379773 ) ) ( not ( = ?auto_379770 ?auto_379774 ) ) ( not ( = ?auto_379770 ?auto_379775 ) ) ( not ( = ?auto_379770 ?auto_379776 ) ) ( not ( = ?auto_379770 ?auto_379777 ) ) ( not ( = ?auto_379770 ?auto_379778 ) ) ( not ( = ?auto_379770 ?auto_379779 ) ) ( not ( = ?auto_379770 ?auto_379780 ) ) ( not ( = ?auto_379770 ?auto_379781 ) ) ( not ( = ?auto_379770 ?auto_379782 ) ) ( not ( = ?auto_379770 ?auto_379783 ) ) ( not ( = ?auto_379771 ?auto_379772 ) ) ( not ( = ?auto_379771 ?auto_379773 ) ) ( not ( = ?auto_379771 ?auto_379774 ) ) ( not ( = ?auto_379771 ?auto_379775 ) ) ( not ( = ?auto_379771 ?auto_379776 ) ) ( not ( = ?auto_379771 ?auto_379777 ) ) ( not ( = ?auto_379771 ?auto_379778 ) ) ( not ( = ?auto_379771 ?auto_379779 ) ) ( not ( = ?auto_379771 ?auto_379780 ) ) ( not ( = ?auto_379771 ?auto_379781 ) ) ( not ( = ?auto_379771 ?auto_379782 ) ) ( not ( = ?auto_379771 ?auto_379783 ) ) ( not ( = ?auto_379772 ?auto_379773 ) ) ( not ( = ?auto_379772 ?auto_379774 ) ) ( not ( = ?auto_379772 ?auto_379775 ) ) ( not ( = ?auto_379772 ?auto_379776 ) ) ( not ( = ?auto_379772 ?auto_379777 ) ) ( not ( = ?auto_379772 ?auto_379778 ) ) ( not ( = ?auto_379772 ?auto_379779 ) ) ( not ( = ?auto_379772 ?auto_379780 ) ) ( not ( = ?auto_379772 ?auto_379781 ) ) ( not ( = ?auto_379772 ?auto_379782 ) ) ( not ( = ?auto_379772 ?auto_379783 ) ) ( not ( = ?auto_379773 ?auto_379774 ) ) ( not ( = ?auto_379773 ?auto_379775 ) ) ( not ( = ?auto_379773 ?auto_379776 ) ) ( not ( = ?auto_379773 ?auto_379777 ) ) ( not ( = ?auto_379773 ?auto_379778 ) ) ( not ( = ?auto_379773 ?auto_379779 ) ) ( not ( = ?auto_379773 ?auto_379780 ) ) ( not ( = ?auto_379773 ?auto_379781 ) ) ( not ( = ?auto_379773 ?auto_379782 ) ) ( not ( = ?auto_379773 ?auto_379783 ) ) ( not ( = ?auto_379774 ?auto_379775 ) ) ( not ( = ?auto_379774 ?auto_379776 ) ) ( not ( = ?auto_379774 ?auto_379777 ) ) ( not ( = ?auto_379774 ?auto_379778 ) ) ( not ( = ?auto_379774 ?auto_379779 ) ) ( not ( = ?auto_379774 ?auto_379780 ) ) ( not ( = ?auto_379774 ?auto_379781 ) ) ( not ( = ?auto_379774 ?auto_379782 ) ) ( not ( = ?auto_379774 ?auto_379783 ) ) ( not ( = ?auto_379775 ?auto_379776 ) ) ( not ( = ?auto_379775 ?auto_379777 ) ) ( not ( = ?auto_379775 ?auto_379778 ) ) ( not ( = ?auto_379775 ?auto_379779 ) ) ( not ( = ?auto_379775 ?auto_379780 ) ) ( not ( = ?auto_379775 ?auto_379781 ) ) ( not ( = ?auto_379775 ?auto_379782 ) ) ( not ( = ?auto_379775 ?auto_379783 ) ) ( not ( = ?auto_379776 ?auto_379777 ) ) ( not ( = ?auto_379776 ?auto_379778 ) ) ( not ( = ?auto_379776 ?auto_379779 ) ) ( not ( = ?auto_379776 ?auto_379780 ) ) ( not ( = ?auto_379776 ?auto_379781 ) ) ( not ( = ?auto_379776 ?auto_379782 ) ) ( not ( = ?auto_379776 ?auto_379783 ) ) ( not ( = ?auto_379777 ?auto_379778 ) ) ( not ( = ?auto_379777 ?auto_379779 ) ) ( not ( = ?auto_379777 ?auto_379780 ) ) ( not ( = ?auto_379777 ?auto_379781 ) ) ( not ( = ?auto_379777 ?auto_379782 ) ) ( not ( = ?auto_379777 ?auto_379783 ) ) ( not ( = ?auto_379778 ?auto_379779 ) ) ( not ( = ?auto_379778 ?auto_379780 ) ) ( not ( = ?auto_379778 ?auto_379781 ) ) ( not ( = ?auto_379778 ?auto_379782 ) ) ( not ( = ?auto_379778 ?auto_379783 ) ) ( not ( = ?auto_379779 ?auto_379780 ) ) ( not ( = ?auto_379779 ?auto_379781 ) ) ( not ( = ?auto_379779 ?auto_379782 ) ) ( not ( = ?auto_379779 ?auto_379783 ) ) ( not ( = ?auto_379780 ?auto_379781 ) ) ( not ( = ?auto_379780 ?auto_379782 ) ) ( not ( = ?auto_379780 ?auto_379783 ) ) ( not ( = ?auto_379781 ?auto_379782 ) ) ( not ( = ?auto_379781 ?auto_379783 ) ) ( not ( = ?auto_379782 ?auto_379783 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_379782 ?auto_379783 )
      ( !STACK ?auto_379782 ?auto_379781 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_379798 - BLOCK
      ?auto_379799 - BLOCK
      ?auto_379800 - BLOCK
      ?auto_379801 - BLOCK
      ?auto_379802 - BLOCK
      ?auto_379803 - BLOCK
      ?auto_379804 - BLOCK
      ?auto_379805 - BLOCK
      ?auto_379806 - BLOCK
      ?auto_379807 - BLOCK
      ?auto_379808 - BLOCK
      ?auto_379809 - BLOCK
      ?auto_379810 - BLOCK
      ?auto_379811 - BLOCK
    )
    :vars
    (
      ?auto_379812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379811 ?auto_379812 ) ( ON-TABLE ?auto_379798 ) ( ON ?auto_379799 ?auto_379798 ) ( ON ?auto_379800 ?auto_379799 ) ( ON ?auto_379801 ?auto_379800 ) ( ON ?auto_379802 ?auto_379801 ) ( ON ?auto_379803 ?auto_379802 ) ( ON ?auto_379804 ?auto_379803 ) ( ON ?auto_379805 ?auto_379804 ) ( ON ?auto_379806 ?auto_379805 ) ( ON ?auto_379807 ?auto_379806 ) ( ON ?auto_379808 ?auto_379807 ) ( ON ?auto_379809 ?auto_379808 ) ( not ( = ?auto_379798 ?auto_379799 ) ) ( not ( = ?auto_379798 ?auto_379800 ) ) ( not ( = ?auto_379798 ?auto_379801 ) ) ( not ( = ?auto_379798 ?auto_379802 ) ) ( not ( = ?auto_379798 ?auto_379803 ) ) ( not ( = ?auto_379798 ?auto_379804 ) ) ( not ( = ?auto_379798 ?auto_379805 ) ) ( not ( = ?auto_379798 ?auto_379806 ) ) ( not ( = ?auto_379798 ?auto_379807 ) ) ( not ( = ?auto_379798 ?auto_379808 ) ) ( not ( = ?auto_379798 ?auto_379809 ) ) ( not ( = ?auto_379798 ?auto_379810 ) ) ( not ( = ?auto_379798 ?auto_379811 ) ) ( not ( = ?auto_379798 ?auto_379812 ) ) ( not ( = ?auto_379799 ?auto_379800 ) ) ( not ( = ?auto_379799 ?auto_379801 ) ) ( not ( = ?auto_379799 ?auto_379802 ) ) ( not ( = ?auto_379799 ?auto_379803 ) ) ( not ( = ?auto_379799 ?auto_379804 ) ) ( not ( = ?auto_379799 ?auto_379805 ) ) ( not ( = ?auto_379799 ?auto_379806 ) ) ( not ( = ?auto_379799 ?auto_379807 ) ) ( not ( = ?auto_379799 ?auto_379808 ) ) ( not ( = ?auto_379799 ?auto_379809 ) ) ( not ( = ?auto_379799 ?auto_379810 ) ) ( not ( = ?auto_379799 ?auto_379811 ) ) ( not ( = ?auto_379799 ?auto_379812 ) ) ( not ( = ?auto_379800 ?auto_379801 ) ) ( not ( = ?auto_379800 ?auto_379802 ) ) ( not ( = ?auto_379800 ?auto_379803 ) ) ( not ( = ?auto_379800 ?auto_379804 ) ) ( not ( = ?auto_379800 ?auto_379805 ) ) ( not ( = ?auto_379800 ?auto_379806 ) ) ( not ( = ?auto_379800 ?auto_379807 ) ) ( not ( = ?auto_379800 ?auto_379808 ) ) ( not ( = ?auto_379800 ?auto_379809 ) ) ( not ( = ?auto_379800 ?auto_379810 ) ) ( not ( = ?auto_379800 ?auto_379811 ) ) ( not ( = ?auto_379800 ?auto_379812 ) ) ( not ( = ?auto_379801 ?auto_379802 ) ) ( not ( = ?auto_379801 ?auto_379803 ) ) ( not ( = ?auto_379801 ?auto_379804 ) ) ( not ( = ?auto_379801 ?auto_379805 ) ) ( not ( = ?auto_379801 ?auto_379806 ) ) ( not ( = ?auto_379801 ?auto_379807 ) ) ( not ( = ?auto_379801 ?auto_379808 ) ) ( not ( = ?auto_379801 ?auto_379809 ) ) ( not ( = ?auto_379801 ?auto_379810 ) ) ( not ( = ?auto_379801 ?auto_379811 ) ) ( not ( = ?auto_379801 ?auto_379812 ) ) ( not ( = ?auto_379802 ?auto_379803 ) ) ( not ( = ?auto_379802 ?auto_379804 ) ) ( not ( = ?auto_379802 ?auto_379805 ) ) ( not ( = ?auto_379802 ?auto_379806 ) ) ( not ( = ?auto_379802 ?auto_379807 ) ) ( not ( = ?auto_379802 ?auto_379808 ) ) ( not ( = ?auto_379802 ?auto_379809 ) ) ( not ( = ?auto_379802 ?auto_379810 ) ) ( not ( = ?auto_379802 ?auto_379811 ) ) ( not ( = ?auto_379802 ?auto_379812 ) ) ( not ( = ?auto_379803 ?auto_379804 ) ) ( not ( = ?auto_379803 ?auto_379805 ) ) ( not ( = ?auto_379803 ?auto_379806 ) ) ( not ( = ?auto_379803 ?auto_379807 ) ) ( not ( = ?auto_379803 ?auto_379808 ) ) ( not ( = ?auto_379803 ?auto_379809 ) ) ( not ( = ?auto_379803 ?auto_379810 ) ) ( not ( = ?auto_379803 ?auto_379811 ) ) ( not ( = ?auto_379803 ?auto_379812 ) ) ( not ( = ?auto_379804 ?auto_379805 ) ) ( not ( = ?auto_379804 ?auto_379806 ) ) ( not ( = ?auto_379804 ?auto_379807 ) ) ( not ( = ?auto_379804 ?auto_379808 ) ) ( not ( = ?auto_379804 ?auto_379809 ) ) ( not ( = ?auto_379804 ?auto_379810 ) ) ( not ( = ?auto_379804 ?auto_379811 ) ) ( not ( = ?auto_379804 ?auto_379812 ) ) ( not ( = ?auto_379805 ?auto_379806 ) ) ( not ( = ?auto_379805 ?auto_379807 ) ) ( not ( = ?auto_379805 ?auto_379808 ) ) ( not ( = ?auto_379805 ?auto_379809 ) ) ( not ( = ?auto_379805 ?auto_379810 ) ) ( not ( = ?auto_379805 ?auto_379811 ) ) ( not ( = ?auto_379805 ?auto_379812 ) ) ( not ( = ?auto_379806 ?auto_379807 ) ) ( not ( = ?auto_379806 ?auto_379808 ) ) ( not ( = ?auto_379806 ?auto_379809 ) ) ( not ( = ?auto_379806 ?auto_379810 ) ) ( not ( = ?auto_379806 ?auto_379811 ) ) ( not ( = ?auto_379806 ?auto_379812 ) ) ( not ( = ?auto_379807 ?auto_379808 ) ) ( not ( = ?auto_379807 ?auto_379809 ) ) ( not ( = ?auto_379807 ?auto_379810 ) ) ( not ( = ?auto_379807 ?auto_379811 ) ) ( not ( = ?auto_379807 ?auto_379812 ) ) ( not ( = ?auto_379808 ?auto_379809 ) ) ( not ( = ?auto_379808 ?auto_379810 ) ) ( not ( = ?auto_379808 ?auto_379811 ) ) ( not ( = ?auto_379808 ?auto_379812 ) ) ( not ( = ?auto_379809 ?auto_379810 ) ) ( not ( = ?auto_379809 ?auto_379811 ) ) ( not ( = ?auto_379809 ?auto_379812 ) ) ( not ( = ?auto_379810 ?auto_379811 ) ) ( not ( = ?auto_379810 ?auto_379812 ) ) ( not ( = ?auto_379811 ?auto_379812 ) ) ( CLEAR ?auto_379809 ) ( ON ?auto_379810 ?auto_379811 ) ( CLEAR ?auto_379810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_379798 ?auto_379799 ?auto_379800 ?auto_379801 ?auto_379802 ?auto_379803 ?auto_379804 ?auto_379805 ?auto_379806 ?auto_379807 ?auto_379808 ?auto_379809 ?auto_379810 )
      ( MAKE-14PILE ?auto_379798 ?auto_379799 ?auto_379800 ?auto_379801 ?auto_379802 ?auto_379803 ?auto_379804 ?auto_379805 ?auto_379806 ?auto_379807 ?auto_379808 ?auto_379809 ?auto_379810 ?auto_379811 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_379827 - BLOCK
      ?auto_379828 - BLOCK
      ?auto_379829 - BLOCK
      ?auto_379830 - BLOCK
      ?auto_379831 - BLOCK
      ?auto_379832 - BLOCK
      ?auto_379833 - BLOCK
      ?auto_379834 - BLOCK
      ?auto_379835 - BLOCK
      ?auto_379836 - BLOCK
      ?auto_379837 - BLOCK
      ?auto_379838 - BLOCK
      ?auto_379839 - BLOCK
      ?auto_379840 - BLOCK
    )
    :vars
    (
      ?auto_379841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379840 ?auto_379841 ) ( ON-TABLE ?auto_379827 ) ( ON ?auto_379828 ?auto_379827 ) ( ON ?auto_379829 ?auto_379828 ) ( ON ?auto_379830 ?auto_379829 ) ( ON ?auto_379831 ?auto_379830 ) ( ON ?auto_379832 ?auto_379831 ) ( ON ?auto_379833 ?auto_379832 ) ( ON ?auto_379834 ?auto_379833 ) ( ON ?auto_379835 ?auto_379834 ) ( ON ?auto_379836 ?auto_379835 ) ( ON ?auto_379837 ?auto_379836 ) ( ON ?auto_379838 ?auto_379837 ) ( not ( = ?auto_379827 ?auto_379828 ) ) ( not ( = ?auto_379827 ?auto_379829 ) ) ( not ( = ?auto_379827 ?auto_379830 ) ) ( not ( = ?auto_379827 ?auto_379831 ) ) ( not ( = ?auto_379827 ?auto_379832 ) ) ( not ( = ?auto_379827 ?auto_379833 ) ) ( not ( = ?auto_379827 ?auto_379834 ) ) ( not ( = ?auto_379827 ?auto_379835 ) ) ( not ( = ?auto_379827 ?auto_379836 ) ) ( not ( = ?auto_379827 ?auto_379837 ) ) ( not ( = ?auto_379827 ?auto_379838 ) ) ( not ( = ?auto_379827 ?auto_379839 ) ) ( not ( = ?auto_379827 ?auto_379840 ) ) ( not ( = ?auto_379827 ?auto_379841 ) ) ( not ( = ?auto_379828 ?auto_379829 ) ) ( not ( = ?auto_379828 ?auto_379830 ) ) ( not ( = ?auto_379828 ?auto_379831 ) ) ( not ( = ?auto_379828 ?auto_379832 ) ) ( not ( = ?auto_379828 ?auto_379833 ) ) ( not ( = ?auto_379828 ?auto_379834 ) ) ( not ( = ?auto_379828 ?auto_379835 ) ) ( not ( = ?auto_379828 ?auto_379836 ) ) ( not ( = ?auto_379828 ?auto_379837 ) ) ( not ( = ?auto_379828 ?auto_379838 ) ) ( not ( = ?auto_379828 ?auto_379839 ) ) ( not ( = ?auto_379828 ?auto_379840 ) ) ( not ( = ?auto_379828 ?auto_379841 ) ) ( not ( = ?auto_379829 ?auto_379830 ) ) ( not ( = ?auto_379829 ?auto_379831 ) ) ( not ( = ?auto_379829 ?auto_379832 ) ) ( not ( = ?auto_379829 ?auto_379833 ) ) ( not ( = ?auto_379829 ?auto_379834 ) ) ( not ( = ?auto_379829 ?auto_379835 ) ) ( not ( = ?auto_379829 ?auto_379836 ) ) ( not ( = ?auto_379829 ?auto_379837 ) ) ( not ( = ?auto_379829 ?auto_379838 ) ) ( not ( = ?auto_379829 ?auto_379839 ) ) ( not ( = ?auto_379829 ?auto_379840 ) ) ( not ( = ?auto_379829 ?auto_379841 ) ) ( not ( = ?auto_379830 ?auto_379831 ) ) ( not ( = ?auto_379830 ?auto_379832 ) ) ( not ( = ?auto_379830 ?auto_379833 ) ) ( not ( = ?auto_379830 ?auto_379834 ) ) ( not ( = ?auto_379830 ?auto_379835 ) ) ( not ( = ?auto_379830 ?auto_379836 ) ) ( not ( = ?auto_379830 ?auto_379837 ) ) ( not ( = ?auto_379830 ?auto_379838 ) ) ( not ( = ?auto_379830 ?auto_379839 ) ) ( not ( = ?auto_379830 ?auto_379840 ) ) ( not ( = ?auto_379830 ?auto_379841 ) ) ( not ( = ?auto_379831 ?auto_379832 ) ) ( not ( = ?auto_379831 ?auto_379833 ) ) ( not ( = ?auto_379831 ?auto_379834 ) ) ( not ( = ?auto_379831 ?auto_379835 ) ) ( not ( = ?auto_379831 ?auto_379836 ) ) ( not ( = ?auto_379831 ?auto_379837 ) ) ( not ( = ?auto_379831 ?auto_379838 ) ) ( not ( = ?auto_379831 ?auto_379839 ) ) ( not ( = ?auto_379831 ?auto_379840 ) ) ( not ( = ?auto_379831 ?auto_379841 ) ) ( not ( = ?auto_379832 ?auto_379833 ) ) ( not ( = ?auto_379832 ?auto_379834 ) ) ( not ( = ?auto_379832 ?auto_379835 ) ) ( not ( = ?auto_379832 ?auto_379836 ) ) ( not ( = ?auto_379832 ?auto_379837 ) ) ( not ( = ?auto_379832 ?auto_379838 ) ) ( not ( = ?auto_379832 ?auto_379839 ) ) ( not ( = ?auto_379832 ?auto_379840 ) ) ( not ( = ?auto_379832 ?auto_379841 ) ) ( not ( = ?auto_379833 ?auto_379834 ) ) ( not ( = ?auto_379833 ?auto_379835 ) ) ( not ( = ?auto_379833 ?auto_379836 ) ) ( not ( = ?auto_379833 ?auto_379837 ) ) ( not ( = ?auto_379833 ?auto_379838 ) ) ( not ( = ?auto_379833 ?auto_379839 ) ) ( not ( = ?auto_379833 ?auto_379840 ) ) ( not ( = ?auto_379833 ?auto_379841 ) ) ( not ( = ?auto_379834 ?auto_379835 ) ) ( not ( = ?auto_379834 ?auto_379836 ) ) ( not ( = ?auto_379834 ?auto_379837 ) ) ( not ( = ?auto_379834 ?auto_379838 ) ) ( not ( = ?auto_379834 ?auto_379839 ) ) ( not ( = ?auto_379834 ?auto_379840 ) ) ( not ( = ?auto_379834 ?auto_379841 ) ) ( not ( = ?auto_379835 ?auto_379836 ) ) ( not ( = ?auto_379835 ?auto_379837 ) ) ( not ( = ?auto_379835 ?auto_379838 ) ) ( not ( = ?auto_379835 ?auto_379839 ) ) ( not ( = ?auto_379835 ?auto_379840 ) ) ( not ( = ?auto_379835 ?auto_379841 ) ) ( not ( = ?auto_379836 ?auto_379837 ) ) ( not ( = ?auto_379836 ?auto_379838 ) ) ( not ( = ?auto_379836 ?auto_379839 ) ) ( not ( = ?auto_379836 ?auto_379840 ) ) ( not ( = ?auto_379836 ?auto_379841 ) ) ( not ( = ?auto_379837 ?auto_379838 ) ) ( not ( = ?auto_379837 ?auto_379839 ) ) ( not ( = ?auto_379837 ?auto_379840 ) ) ( not ( = ?auto_379837 ?auto_379841 ) ) ( not ( = ?auto_379838 ?auto_379839 ) ) ( not ( = ?auto_379838 ?auto_379840 ) ) ( not ( = ?auto_379838 ?auto_379841 ) ) ( not ( = ?auto_379839 ?auto_379840 ) ) ( not ( = ?auto_379839 ?auto_379841 ) ) ( not ( = ?auto_379840 ?auto_379841 ) ) ( CLEAR ?auto_379838 ) ( ON ?auto_379839 ?auto_379840 ) ( CLEAR ?auto_379839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_379827 ?auto_379828 ?auto_379829 ?auto_379830 ?auto_379831 ?auto_379832 ?auto_379833 ?auto_379834 ?auto_379835 ?auto_379836 ?auto_379837 ?auto_379838 ?auto_379839 )
      ( MAKE-14PILE ?auto_379827 ?auto_379828 ?auto_379829 ?auto_379830 ?auto_379831 ?auto_379832 ?auto_379833 ?auto_379834 ?auto_379835 ?auto_379836 ?auto_379837 ?auto_379838 ?auto_379839 ?auto_379840 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_379856 - BLOCK
      ?auto_379857 - BLOCK
      ?auto_379858 - BLOCK
      ?auto_379859 - BLOCK
      ?auto_379860 - BLOCK
      ?auto_379861 - BLOCK
      ?auto_379862 - BLOCK
      ?auto_379863 - BLOCK
      ?auto_379864 - BLOCK
      ?auto_379865 - BLOCK
      ?auto_379866 - BLOCK
      ?auto_379867 - BLOCK
      ?auto_379868 - BLOCK
      ?auto_379869 - BLOCK
    )
    :vars
    (
      ?auto_379870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379869 ?auto_379870 ) ( ON-TABLE ?auto_379856 ) ( ON ?auto_379857 ?auto_379856 ) ( ON ?auto_379858 ?auto_379857 ) ( ON ?auto_379859 ?auto_379858 ) ( ON ?auto_379860 ?auto_379859 ) ( ON ?auto_379861 ?auto_379860 ) ( ON ?auto_379862 ?auto_379861 ) ( ON ?auto_379863 ?auto_379862 ) ( ON ?auto_379864 ?auto_379863 ) ( ON ?auto_379865 ?auto_379864 ) ( ON ?auto_379866 ?auto_379865 ) ( not ( = ?auto_379856 ?auto_379857 ) ) ( not ( = ?auto_379856 ?auto_379858 ) ) ( not ( = ?auto_379856 ?auto_379859 ) ) ( not ( = ?auto_379856 ?auto_379860 ) ) ( not ( = ?auto_379856 ?auto_379861 ) ) ( not ( = ?auto_379856 ?auto_379862 ) ) ( not ( = ?auto_379856 ?auto_379863 ) ) ( not ( = ?auto_379856 ?auto_379864 ) ) ( not ( = ?auto_379856 ?auto_379865 ) ) ( not ( = ?auto_379856 ?auto_379866 ) ) ( not ( = ?auto_379856 ?auto_379867 ) ) ( not ( = ?auto_379856 ?auto_379868 ) ) ( not ( = ?auto_379856 ?auto_379869 ) ) ( not ( = ?auto_379856 ?auto_379870 ) ) ( not ( = ?auto_379857 ?auto_379858 ) ) ( not ( = ?auto_379857 ?auto_379859 ) ) ( not ( = ?auto_379857 ?auto_379860 ) ) ( not ( = ?auto_379857 ?auto_379861 ) ) ( not ( = ?auto_379857 ?auto_379862 ) ) ( not ( = ?auto_379857 ?auto_379863 ) ) ( not ( = ?auto_379857 ?auto_379864 ) ) ( not ( = ?auto_379857 ?auto_379865 ) ) ( not ( = ?auto_379857 ?auto_379866 ) ) ( not ( = ?auto_379857 ?auto_379867 ) ) ( not ( = ?auto_379857 ?auto_379868 ) ) ( not ( = ?auto_379857 ?auto_379869 ) ) ( not ( = ?auto_379857 ?auto_379870 ) ) ( not ( = ?auto_379858 ?auto_379859 ) ) ( not ( = ?auto_379858 ?auto_379860 ) ) ( not ( = ?auto_379858 ?auto_379861 ) ) ( not ( = ?auto_379858 ?auto_379862 ) ) ( not ( = ?auto_379858 ?auto_379863 ) ) ( not ( = ?auto_379858 ?auto_379864 ) ) ( not ( = ?auto_379858 ?auto_379865 ) ) ( not ( = ?auto_379858 ?auto_379866 ) ) ( not ( = ?auto_379858 ?auto_379867 ) ) ( not ( = ?auto_379858 ?auto_379868 ) ) ( not ( = ?auto_379858 ?auto_379869 ) ) ( not ( = ?auto_379858 ?auto_379870 ) ) ( not ( = ?auto_379859 ?auto_379860 ) ) ( not ( = ?auto_379859 ?auto_379861 ) ) ( not ( = ?auto_379859 ?auto_379862 ) ) ( not ( = ?auto_379859 ?auto_379863 ) ) ( not ( = ?auto_379859 ?auto_379864 ) ) ( not ( = ?auto_379859 ?auto_379865 ) ) ( not ( = ?auto_379859 ?auto_379866 ) ) ( not ( = ?auto_379859 ?auto_379867 ) ) ( not ( = ?auto_379859 ?auto_379868 ) ) ( not ( = ?auto_379859 ?auto_379869 ) ) ( not ( = ?auto_379859 ?auto_379870 ) ) ( not ( = ?auto_379860 ?auto_379861 ) ) ( not ( = ?auto_379860 ?auto_379862 ) ) ( not ( = ?auto_379860 ?auto_379863 ) ) ( not ( = ?auto_379860 ?auto_379864 ) ) ( not ( = ?auto_379860 ?auto_379865 ) ) ( not ( = ?auto_379860 ?auto_379866 ) ) ( not ( = ?auto_379860 ?auto_379867 ) ) ( not ( = ?auto_379860 ?auto_379868 ) ) ( not ( = ?auto_379860 ?auto_379869 ) ) ( not ( = ?auto_379860 ?auto_379870 ) ) ( not ( = ?auto_379861 ?auto_379862 ) ) ( not ( = ?auto_379861 ?auto_379863 ) ) ( not ( = ?auto_379861 ?auto_379864 ) ) ( not ( = ?auto_379861 ?auto_379865 ) ) ( not ( = ?auto_379861 ?auto_379866 ) ) ( not ( = ?auto_379861 ?auto_379867 ) ) ( not ( = ?auto_379861 ?auto_379868 ) ) ( not ( = ?auto_379861 ?auto_379869 ) ) ( not ( = ?auto_379861 ?auto_379870 ) ) ( not ( = ?auto_379862 ?auto_379863 ) ) ( not ( = ?auto_379862 ?auto_379864 ) ) ( not ( = ?auto_379862 ?auto_379865 ) ) ( not ( = ?auto_379862 ?auto_379866 ) ) ( not ( = ?auto_379862 ?auto_379867 ) ) ( not ( = ?auto_379862 ?auto_379868 ) ) ( not ( = ?auto_379862 ?auto_379869 ) ) ( not ( = ?auto_379862 ?auto_379870 ) ) ( not ( = ?auto_379863 ?auto_379864 ) ) ( not ( = ?auto_379863 ?auto_379865 ) ) ( not ( = ?auto_379863 ?auto_379866 ) ) ( not ( = ?auto_379863 ?auto_379867 ) ) ( not ( = ?auto_379863 ?auto_379868 ) ) ( not ( = ?auto_379863 ?auto_379869 ) ) ( not ( = ?auto_379863 ?auto_379870 ) ) ( not ( = ?auto_379864 ?auto_379865 ) ) ( not ( = ?auto_379864 ?auto_379866 ) ) ( not ( = ?auto_379864 ?auto_379867 ) ) ( not ( = ?auto_379864 ?auto_379868 ) ) ( not ( = ?auto_379864 ?auto_379869 ) ) ( not ( = ?auto_379864 ?auto_379870 ) ) ( not ( = ?auto_379865 ?auto_379866 ) ) ( not ( = ?auto_379865 ?auto_379867 ) ) ( not ( = ?auto_379865 ?auto_379868 ) ) ( not ( = ?auto_379865 ?auto_379869 ) ) ( not ( = ?auto_379865 ?auto_379870 ) ) ( not ( = ?auto_379866 ?auto_379867 ) ) ( not ( = ?auto_379866 ?auto_379868 ) ) ( not ( = ?auto_379866 ?auto_379869 ) ) ( not ( = ?auto_379866 ?auto_379870 ) ) ( not ( = ?auto_379867 ?auto_379868 ) ) ( not ( = ?auto_379867 ?auto_379869 ) ) ( not ( = ?auto_379867 ?auto_379870 ) ) ( not ( = ?auto_379868 ?auto_379869 ) ) ( not ( = ?auto_379868 ?auto_379870 ) ) ( not ( = ?auto_379869 ?auto_379870 ) ) ( ON ?auto_379868 ?auto_379869 ) ( CLEAR ?auto_379866 ) ( ON ?auto_379867 ?auto_379868 ) ( CLEAR ?auto_379867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_379856 ?auto_379857 ?auto_379858 ?auto_379859 ?auto_379860 ?auto_379861 ?auto_379862 ?auto_379863 ?auto_379864 ?auto_379865 ?auto_379866 ?auto_379867 )
      ( MAKE-14PILE ?auto_379856 ?auto_379857 ?auto_379858 ?auto_379859 ?auto_379860 ?auto_379861 ?auto_379862 ?auto_379863 ?auto_379864 ?auto_379865 ?auto_379866 ?auto_379867 ?auto_379868 ?auto_379869 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_379885 - BLOCK
      ?auto_379886 - BLOCK
      ?auto_379887 - BLOCK
      ?auto_379888 - BLOCK
      ?auto_379889 - BLOCK
      ?auto_379890 - BLOCK
      ?auto_379891 - BLOCK
      ?auto_379892 - BLOCK
      ?auto_379893 - BLOCK
      ?auto_379894 - BLOCK
      ?auto_379895 - BLOCK
      ?auto_379896 - BLOCK
      ?auto_379897 - BLOCK
      ?auto_379898 - BLOCK
    )
    :vars
    (
      ?auto_379899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379898 ?auto_379899 ) ( ON-TABLE ?auto_379885 ) ( ON ?auto_379886 ?auto_379885 ) ( ON ?auto_379887 ?auto_379886 ) ( ON ?auto_379888 ?auto_379887 ) ( ON ?auto_379889 ?auto_379888 ) ( ON ?auto_379890 ?auto_379889 ) ( ON ?auto_379891 ?auto_379890 ) ( ON ?auto_379892 ?auto_379891 ) ( ON ?auto_379893 ?auto_379892 ) ( ON ?auto_379894 ?auto_379893 ) ( ON ?auto_379895 ?auto_379894 ) ( not ( = ?auto_379885 ?auto_379886 ) ) ( not ( = ?auto_379885 ?auto_379887 ) ) ( not ( = ?auto_379885 ?auto_379888 ) ) ( not ( = ?auto_379885 ?auto_379889 ) ) ( not ( = ?auto_379885 ?auto_379890 ) ) ( not ( = ?auto_379885 ?auto_379891 ) ) ( not ( = ?auto_379885 ?auto_379892 ) ) ( not ( = ?auto_379885 ?auto_379893 ) ) ( not ( = ?auto_379885 ?auto_379894 ) ) ( not ( = ?auto_379885 ?auto_379895 ) ) ( not ( = ?auto_379885 ?auto_379896 ) ) ( not ( = ?auto_379885 ?auto_379897 ) ) ( not ( = ?auto_379885 ?auto_379898 ) ) ( not ( = ?auto_379885 ?auto_379899 ) ) ( not ( = ?auto_379886 ?auto_379887 ) ) ( not ( = ?auto_379886 ?auto_379888 ) ) ( not ( = ?auto_379886 ?auto_379889 ) ) ( not ( = ?auto_379886 ?auto_379890 ) ) ( not ( = ?auto_379886 ?auto_379891 ) ) ( not ( = ?auto_379886 ?auto_379892 ) ) ( not ( = ?auto_379886 ?auto_379893 ) ) ( not ( = ?auto_379886 ?auto_379894 ) ) ( not ( = ?auto_379886 ?auto_379895 ) ) ( not ( = ?auto_379886 ?auto_379896 ) ) ( not ( = ?auto_379886 ?auto_379897 ) ) ( not ( = ?auto_379886 ?auto_379898 ) ) ( not ( = ?auto_379886 ?auto_379899 ) ) ( not ( = ?auto_379887 ?auto_379888 ) ) ( not ( = ?auto_379887 ?auto_379889 ) ) ( not ( = ?auto_379887 ?auto_379890 ) ) ( not ( = ?auto_379887 ?auto_379891 ) ) ( not ( = ?auto_379887 ?auto_379892 ) ) ( not ( = ?auto_379887 ?auto_379893 ) ) ( not ( = ?auto_379887 ?auto_379894 ) ) ( not ( = ?auto_379887 ?auto_379895 ) ) ( not ( = ?auto_379887 ?auto_379896 ) ) ( not ( = ?auto_379887 ?auto_379897 ) ) ( not ( = ?auto_379887 ?auto_379898 ) ) ( not ( = ?auto_379887 ?auto_379899 ) ) ( not ( = ?auto_379888 ?auto_379889 ) ) ( not ( = ?auto_379888 ?auto_379890 ) ) ( not ( = ?auto_379888 ?auto_379891 ) ) ( not ( = ?auto_379888 ?auto_379892 ) ) ( not ( = ?auto_379888 ?auto_379893 ) ) ( not ( = ?auto_379888 ?auto_379894 ) ) ( not ( = ?auto_379888 ?auto_379895 ) ) ( not ( = ?auto_379888 ?auto_379896 ) ) ( not ( = ?auto_379888 ?auto_379897 ) ) ( not ( = ?auto_379888 ?auto_379898 ) ) ( not ( = ?auto_379888 ?auto_379899 ) ) ( not ( = ?auto_379889 ?auto_379890 ) ) ( not ( = ?auto_379889 ?auto_379891 ) ) ( not ( = ?auto_379889 ?auto_379892 ) ) ( not ( = ?auto_379889 ?auto_379893 ) ) ( not ( = ?auto_379889 ?auto_379894 ) ) ( not ( = ?auto_379889 ?auto_379895 ) ) ( not ( = ?auto_379889 ?auto_379896 ) ) ( not ( = ?auto_379889 ?auto_379897 ) ) ( not ( = ?auto_379889 ?auto_379898 ) ) ( not ( = ?auto_379889 ?auto_379899 ) ) ( not ( = ?auto_379890 ?auto_379891 ) ) ( not ( = ?auto_379890 ?auto_379892 ) ) ( not ( = ?auto_379890 ?auto_379893 ) ) ( not ( = ?auto_379890 ?auto_379894 ) ) ( not ( = ?auto_379890 ?auto_379895 ) ) ( not ( = ?auto_379890 ?auto_379896 ) ) ( not ( = ?auto_379890 ?auto_379897 ) ) ( not ( = ?auto_379890 ?auto_379898 ) ) ( not ( = ?auto_379890 ?auto_379899 ) ) ( not ( = ?auto_379891 ?auto_379892 ) ) ( not ( = ?auto_379891 ?auto_379893 ) ) ( not ( = ?auto_379891 ?auto_379894 ) ) ( not ( = ?auto_379891 ?auto_379895 ) ) ( not ( = ?auto_379891 ?auto_379896 ) ) ( not ( = ?auto_379891 ?auto_379897 ) ) ( not ( = ?auto_379891 ?auto_379898 ) ) ( not ( = ?auto_379891 ?auto_379899 ) ) ( not ( = ?auto_379892 ?auto_379893 ) ) ( not ( = ?auto_379892 ?auto_379894 ) ) ( not ( = ?auto_379892 ?auto_379895 ) ) ( not ( = ?auto_379892 ?auto_379896 ) ) ( not ( = ?auto_379892 ?auto_379897 ) ) ( not ( = ?auto_379892 ?auto_379898 ) ) ( not ( = ?auto_379892 ?auto_379899 ) ) ( not ( = ?auto_379893 ?auto_379894 ) ) ( not ( = ?auto_379893 ?auto_379895 ) ) ( not ( = ?auto_379893 ?auto_379896 ) ) ( not ( = ?auto_379893 ?auto_379897 ) ) ( not ( = ?auto_379893 ?auto_379898 ) ) ( not ( = ?auto_379893 ?auto_379899 ) ) ( not ( = ?auto_379894 ?auto_379895 ) ) ( not ( = ?auto_379894 ?auto_379896 ) ) ( not ( = ?auto_379894 ?auto_379897 ) ) ( not ( = ?auto_379894 ?auto_379898 ) ) ( not ( = ?auto_379894 ?auto_379899 ) ) ( not ( = ?auto_379895 ?auto_379896 ) ) ( not ( = ?auto_379895 ?auto_379897 ) ) ( not ( = ?auto_379895 ?auto_379898 ) ) ( not ( = ?auto_379895 ?auto_379899 ) ) ( not ( = ?auto_379896 ?auto_379897 ) ) ( not ( = ?auto_379896 ?auto_379898 ) ) ( not ( = ?auto_379896 ?auto_379899 ) ) ( not ( = ?auto_379897 ?auto_379898 ) ) ( not ( = ?auto_379897 ?auto_379899 ) ) ( not ( = ?auto_379898 ?auto_379899 ) ) ( ON ?auto_379897 ?auto_379898 ) ( CLEAR ?auto_379895 ) ( ON ?auto_379896 ?auto_379897 ) ( CLEAR ?auto_379896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_379885 ?auto_379886 ?auto_379887 ?auto_379888 ?auto_379889 ?auto_379890 ?auto_379891 ?auto_379892 ?auto_379893 ?auto_379894 ?auto_379895 ?auto_379896 )
      ( MAKE-14PILE ?auto_379885 ?auto_379886 ?auto_379887 ?auto_379888 ?auto_379889 ?auto_379890 ?auto_379891 ?auto_379892 ?auto_379893 ?auto_379894 ?auto_379895 ?auto_379896 ?auto_379897 ?auto_379898 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_379914 - BLOCK
      ?auto_379915 - BLOCK
      ?auto_379916 - BLOCK
      ?auto_379917 - BLOCK
      ?auto_379918 - BLOCK
      ?auto_379919 - BLOCK
      ?auto_379920 - BLOCK
      ?auto_379921 - BLOCK
      ?auto_379922 - BLOCK
      ?auto_379923 - BLOCK
      ?auto_379924 - BLOCK
      ?auto_379925 - BLOCK
      ?auto_379926 - BLOCK
      ?auto_379927 - BLOCK
    )
    :vars
    (
      ?auto_379928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379927 ?auto_379928 ) ( ON-TABLE ?auto_379914 ) ( ON ?auto_379915 ?auto_379914 ) ( ON ?auto_379916 ?auto_379915 ) ( ON ?auto_379917 ?auto_379916 ) ( ON ?auto_379918 ?auto_379917 ) ( ON ?auto_379919 ?auto_379918 ) ( ON ?auto_379920 ?auto_379919 ) ( ON ?auto_379921 ?auto_379920 ) ( ON ?auto_379922 ?auto_379921 ) ( ON ?auto_379923 ?auto_379922 ) ( not ( = ?auto_379914 ?auto_379915 ) ) ( not ( = ?auto_379914 ?auto_379916 ) ) ( not ( = ?auto_379914 ?auto_379917 ) ) ( not ( = ?auto_379914 ?auto_379918 ) ) ( not ( = ?auto_379914 ?auto_379919 ) ) ( not ( = ?auto_379914 ?auto_379920 ) ) ( not ( = ?auto_379914 ?auto_379921 ) ) ( not ( = ?auto_379914 ?auto_379922 ) ) ( not ( = ?auto_379914 ?auto_379923 ) ) ( not ( = ?auto_379914 ?auto_379924 ) ) ( not ( = ?auto_379914 ?auto_379925 ) ) ( not ( = ?auto_379914 ?auto_379926 ) ) ( not ( = ?auto_379914 ?auto_379927 ) ) ( not ( = ?auto_379914 ?auto_379928 ) ) ( not ( = ?auto_379915 ?auto_379916 ) ) ( not ( = ?auto_379915 ?auto_379917 ) ) ( not ( = ?auto_379915 ?auto_379918 ) ) ( not ( = ?auto_379915 ?auto_379919 ) ) ( not ( = ?auto_379915 ?auto_379920 ) ) ( not ( = ?auto_379915 ?auto_379921 ) ) ( not ( = ?auto_379915 ?auto_379922 ) ) ( not ( = ?auto_379915 ?auto_379923 ) ) ( not ( = ?auto_379915 ?auto_379924 ) ) ( not ( = ?auto_379915 ?auto_379925 ) ) ( not ( = ?auto_379915 ?auto_379926 ) ) ( not ( = ?auto_379915 ?auto_379927 ) ) ( not ( = ?auto_379915 ?auto_379928 ) ) ( not ( = ?auto_379916 ?auto_379917 ) ) ( not ( = ?auto_379916 ?auto_379918 ) ) ( not ( = ?auto_379916 ?auto_379919 ) ) ( not ( = ?auto_379916 ?auto_379920 ) ) ( not ( = ?auto_379916 ?auto_379921 ) ) ( not ( = ?auto_379916 ?auto_379922 ) ) ( not ( = ?auto_379916 ?auto_379923 ) ) ( not ( = ?auto_379916 ?auto_379924 ) ) ( not ( = ?auto_379916 ?auto_379925 ) ) ( not ( = ?auto_379916 ?auto_379926 ) ) ( not ( = ?auto_379916 ?auto_379927 ) ) ( not ( = ?auto_379916 ?auto_379928 ) ) ( not ( = ?auto_379917 ?auto_379918 ) ) ( not ( = ?auto_379917 ?auto_379919 ) ) ( not ( = ?auto_379917 ?auto_379920 ) ) ( not ( = ?auto_379917 ?auto_379921 ) ) ( not ( = ?auto_379917 ?auto_379922 ) ) ( not ( = ?auto_379917 ?auto_379923 ) ) ( not ( = ?auto_379917 ?auto_379924 ) ) ( not ( = ?auto_379917 ?auto_379925 ) ) ( not ( = ?auto_379917 ?auto_379926 ) ) ( not ( = ?auto_379917 ?auto_379927 ) ) ( not ( = ?auto_379917 ?auto_379928 ) ) ( not ( = ?auto_379918 ?auto_379919 ) ) ( not ( = ?auto_379918 ?auto_379920 ) ) ( not ( = ?auto_379918 ?auto_379921 ) ) ( not ( = ?auto_379918 ?auto_379922 ) ) ( not ( = ?auto_379918 ?auto_379923 ) ) ( not ( = ?auto_379918 ?auto_379924 ) ) ( not ( = ?auto_379918 ?auto_379925 ) ) ( not ( = ?auto_379918 ?auto_379926 ) ) ( not ( = ?auto_379918 ?auto_379927 ) ) ( not ( = ?auto_379918 ?auto_379928 ) ) ( not ( = ?auto_379919 ?auto_379920 ) ) ( not ( = ?auto_379919 ?auto_379921 ) ) ( not ( = ?auto_379919 ?auto_379922 ) ) ( not ( = ?auto_379919 ?auto_379923 ) ) ( not ( = ?auto_379919 ?auto_379924 ) ) ( not ( = ?auto_379919 ?auto_379925 ) ) ( not ( = ?auto_379919 ?auto_379926 ) ) ( not ( = ?auto_379919 ?auto_379927 ) ) ( not ( = ?auto_379919 ?auto_379928 ) ) ( not ( = ?auto_379920 ?auto_379921 ) ) ( not ( = ?auto_379920 ?auto_379922 ) ) ( not ( = ?auto_379920 ?auto_379923 ) ) ( not ( = ?auto_379920 ?auto_379924 ) ) ( not ( = ?auto_379920 ?auto_379925 ) ) ( not ( = ?auto_379920 ?auto_379926 ) ) ( not ( = ?auto_379920 ?auto_379927 ) ) ( not ( = ?auto_379920 ?auto_379928 ) ) ( not ( = ?auto_379921 ?auto_379922 ) ) ( not ( = ?auto_379921 ?auto_379923 ) ) ( not ( = ?auto_379921 ?auto_379924 ) ) ( not ( = ?auto_379921 ?auto_379925 ) ) ( not ( = ?auto_379921 ?auto_379926 ) ) ( not ( = ?auto_379921 ?auto_379927 ) ) ( not ( = ?auto_379921 ?auto_379928 ) ) ( not ( = ?auto_379922 ?auto_379923 ) ) ( not ( = ?auto_379922 ?auto_379924 ) ) ( not ( = ?auto_379922 ?auto_379925 ) ) ( not ( = ?auto_379922 ?auto_379926 ) ) ( not ( = ?auto_379922 ?auto_379927 ) ) ( not ( = ?auto_379922 ?auto_379928 ) ) ( not ( = ?auto_379923 ?auto_379924 ) ) ( not ( = ?auto_379923 ?auto_379925 ) ) ( not ( = ?auto_379923 ?auto_379926 ) ) ( not ( = ?auto_379923 ?auto_379927 ) ) ( not ( = ?auto_379923 ?auto_379928 ) ) ( not ( = ?auto_379924 ?auto_379925 ) ) ( not ( = ?auto_379924 ?auto_379926 ) ) ( not ( = ?auto_379924 ?auto_379927 ) ) ( not ( = ?auto_379924 ?auto_379928 ) ) ( not ( = ?auto_379925 ?auto_379926 ) ) ( not ( = ?auto_379925 ?auto_379927 ) ) ( not ( = ?auto_379925 ?auto_379928 ) ) ( not ( = ?auto_379926 ?auto_379927 ) ) ( not ( = ?auto_379926 ?auto_379928 ) ) ( not ( = ?auto_379927 ?auto_379928 ) ) ( ON ?auto_379926 ?auto_379927 ) ( ON ?auto_379925 ?auto_379926 ) ( CLEAR ?auto_379923 ) ( ON ?auto_379924 ?auto_379925 ) ( CLEAR ?auto_379924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_379914 ?auto_379915 ?auto_379916 ?auto_379917 ?auto_379918 ?auto_379919 ?auto_379920 ?auto_379921 ?auto_379922 ?auto_379923 ?auto_379924 )
      ( MAKE-14PILE ?auto_379914 ?auto_379915 ?auto_379916 ?auto_379917 ?auto_379918 ?auto_379919 ?auto_379920 ?auto_379921 ?auto_379922 ?auto_379923 ?auto_379924 ?auto_379925 ?auto_379926 ?auto_379927 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_379943 - BLOCK
      ?auto_379944 - BLOCK
      ?auto_379945 - BLOCK
      ?auto_379946 - BLOCK
      ?auto_379947 - BLOCK
      ?auto_379948 - BLOCK
      ?auto_379949 - BLOCK
      ?auto_379950 - BLOCK
      ?auto_379951 - BLOCK
      ?auto_379952 - BLOCK
      ?auto_379953 - BLOCK
      ?auto_379954 - BLOCK
      ?auto_379955 - BLOCK
      ?auto_379956 - BLOCK
    )
    :vars
    (
      ?auto_379957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379956 ?auto_379957 ) ( ON-TABLE ?auto_379943 ) ( ON ?auto_379944 ?auto_379943 ) ( ON ?auto_379945 ?auto_379944 ) ( ON ?auto_379946 ?auto_379945 ) ( ON ?auto_379947 ?auto_379946 ) ( ON ?auto_379948 ?auto_379947 ) ( ON ?auto_379949 ?auto_379948 ) ( ON ?auto_379950 ?auto_379949 ) ( ON ?auto_379951 ?auto_379950 ) ( ON ?auto_379952 ?auto_379951 ) ( not ( = ?auto_379943 ?auto_379944 ) ) ( not ( = ?auto_379943 ?auto_379945 ) ) ( not ( = ?auto_379943 ?auto_379946 ) ) ( not ( = ?auto_379943 ?auto_379947 ) ) ( not ( = ?auto_379943 ?auto_379948 ) ) ( not ( = ?auto_379943 ?auto_379949 ) ) ( not ( = ?auto_379943 ?auto_379950 ) ) ( not ( = ?auto_379943 ?auto_379951 ) ) ( not ( = ?auto_379943 ?auto_379952 ) ) ( not ( = ?auto_379943 ?auto_379953 ) ) ( not ( = ?auto_379943 ?auto_379954 ) ) ( not ( = ?auto_379943 ?auto_379955 ) ) ( not ( = ?auto_379943 ?auto_379956 ) ) ( not ( = ?auto_379943 ?auto_379957 ) ) ( not ( = ?auto_379944 ?auto_379945 ) ) ( not ( = ?auto_379944 ?auto_379946 ) ) ( not ( = ?auto_379944 ?auto_379947 ) ) ( not ( = ?auto_379944 ?auto_379948 ) ) ( not ( = ?auto_379944 ?auto_379949 ) ) ( not ( = ?auto_379944 ?auto_379950 ) ) ( not ( = ?auto_379944 ?auto_379951 ) ) ( not ( = ?auto_379944 ?auto_379952 ) ) ( not ( = ?auto_379944 ?auto_379953 ) ) ( not ( = ?auto_379944 ?auto_379954 ) ) ( not ( = ?auto_379944 ?auto_379955 ) ) ( not ( = ?auto_379944 ?auto_379956 ) ) ( not ( = ?auto_379944 ?auto_379957 ) ) ( not ( = ?auto_379945 ?auto_379946 ) ) ( not ( = ?auto_379945 ?auto_379947 ) ) ( not ( = ?auto_379945 ?auto_379948 ) ) ( not ( = ?auto_379945 ?auto_379949 ) ) ( not ( = ?auto_379945 ?auto_379950 ) ) ( not ( = ?auto_379945 ?auto_379951 ) ) ( not ( = ?auto_379945 ?auto_379952 ) ) ( not ( = ?auto_379945 ?auto_379953 ) ) ( not ( = ?auto_379945 ?auto_379954 ) ) ( not ( = ?auto_379945 ?auto_379955 ) ) ( not ( = ?auto_379945 ?auto_379956 ) ) ( not ( = ?auto_379945 ?auto_379957 ) ) ( not ( = ?auto_379946 ?auto_379947 ) ) ( not ( = ?auto_379946 ?auto_379948 ) ) ( not ( = ?auto_379946 ?auto_379949 ) ) ( not ( = ?auto_379946 ?auto_379950 ) ) ( not ( = ?auto_379946 ?auto_379951 ) ) ( not ( = ?auto_379946 ?auto_379952 ) ) ( not ( = ?auto_379946 ?auto_379953 ) ) ( not ( = ?auto_379946 ?auto_379954 ) ) ( not ( = ?auto_379946 ?auto_379955 ) ) ( not ( = ?auto_379946 ?auto_379956 ) ) ( not ( = ?auto_379946 ?auto_379957 ) ) ( not ( = ?auto_379947 ?auto_379948 ) ) ( not ( = ?auto_379947 ?auto_379949 ) ) ( not ( = ?auto_379947 ?auto_379950 ) ) ( not ( = ?auto_379947 ?auto_379951 ) ) ( not ( = ?auto_379947 ?auto_379952 ) ) ( not ( = ?auto_379947 ?auto_379953 ) ) ( not ( = ?auto_379947 ?auto_379954 ) ) ( not ( = ?auto_379947 ?auto_379955 ) ) ( not ( = ?auto_379947 ?auto_379956 ) ) ( not ( = ?auto_379947 ?auto_379957 ) ) ( not ( = ?auto_379948 ?auto_379949 ) ) ( not ( = ?auto_379948 ?auto_379950 ) ) ( not ( = ?auto_379948 ?auto_379951 ) ) ( not ( = ?auto_379948 ?auto_379952 ) ) ( not ( = ?auto_379948 ?auto_379953 ) ) ( not ( = ?auto_379948 ?auto_379954 ) ) ( not ( = ?auto_379948 ?auto_379955 ) ) ( not ( = ?auto_379948 ?auto_379956 ) ) ( not ( = ?auto_379948 ?auto_379957 ) ) ( not ( = ?auto_379949 ?auto_379950 ) ) ( not ( = ?auto_379949 ?auto_379951 ) ) ( not ( = ?auto_379949 ?auto_379952 ) ) ( not ( = ?auto_379949 ?auto_379953 ) ) ( not ( = ?auto_379949 ?auto_379954 ) ) ( not ( = ?auto_379949 ?auto_379955 ) ) ( not ( = ?auto_379949 ?auto_379956 ) ) ( not ( = ?auto_379949 ?auto_379957 ) ) ( not ( = ?auto_379950 ?auto_379951 ) ) ( not ( = ?auto_379950 ?auto_379952 ) ) ( not ( = ?auto_379950 ?auto_379953 ) ) ( not ( = ?auto_379950 ?auto_379954 ) ) ( not ( = ?auto_379950 ?auto_379955 ) ) ( not ( = ?auto_379950 ?auto_379956 ) ) ( not ( = ?auto_379950 ?auto_379957 ) ) ( not ( = ?auto_379951 ?auto_379952 ) ) ( not ( = ?auto_379951 ?auto_379953 ) ) ( not ( = ?auto_379951 ?auto_379954 ) ) ( not ( = ?auto_379951 ?auto_379955 ) ) ( not ( = ?auto_379951 ?auto_379956 ) ) ( not ( = ?auto_379951 ?auto_379957 ) ) ( not ( = ?auto_379952 ?auto_379953 ) ) ( not ( = ?auto_379952 ?auto_379954 ) ) ( not ( = ?auto_379952 ?auto_379955 ) ) ( not ( = ?auto_379952 ?auto_379956 ) ) ( not ( = ?auto_379952 ?auto_379957 ) ) ( not ( = ?auto_379953 ?auto_379954 ) ) ( not ( = ?auto_379953 ?auto_379955 ) ) ( not ( = ?auto_379953 ?auto_379956 ) ) ( not ( = ?auto_379953 ?auto_379957 ) ) ( not ( = ?auto_379954 ?auto_379955 ) ) ( not ( = ?auto_379954 ?auto_379956 ) ) ( not ( = ?auto_379954 ?auto_379957 ) ) ( not ( = ?auto_379955 ?auto_379956 ) ) ( not ( = ?auto_379955 ?auto_379957 ) ) ( not ( = ?auto_379956 ?auto_379957 ) ) ( ON ?auto_379955 ?auto_379956 ) ( ON ?auto_379954 ?auto_379955 ) ( CLEAR ?auto_379952 ) ( ON ?auto_379953 ?auto_379954 ) ( CLEAR ?auto_379953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_379943 ?auto_379944 ?auto_379945 ?auto_379946 ?auto_379947 ?auto_379948 ?auto_379949 ?auto_379950 ?auto_379951 ?auto_379952 ?auto_379953 )
      ( MAKE-14PILE ?auto_379943 ?auto_379944 ?auto_379945 ?auto_379946 ?auto_379947 ?auto_379948 ?auto_379949 ?auto_379950 ?auto_379951 ?auto_379952 ?auto_379953 ?auto_379954 ?auto_379955 ?auto_379956 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_379972 - BLOCK
      ?auto_379973 - BLOCK
      ?auto_379974 - BLOCK
      ?auto_379975 - BLOCK
      ?auto_379976 - BLOCK
      ?auto_379977 - BLOCK
      ?auto_379978 - BLOCK
      ?auto_379979 - BLOCK
      ?auto_379980 - BLOCK
      ?auto_379981 - BLOCK
      ?auto_379982 - BLOCK
      ?auto_379983 - BLOCK
      ?auto_379984 - BLOCK
      ?auto_379985 - BLOCK
    )
    :vars
    (
      ?auto_379986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_379985 ?auto_379986 ) ( ON-TABLE ?auto_379972 ) ( ON ?auto_379973 ?auto_379972 ) ( ON ?auto_379974 ?auto_379973 ) ( ON ?auto_379975 ?auto_379974 ) ( ON ?auto_379976 ?auto_379975 ) ( ON ?auto_379977 ?auto_379976 ) ( ON ?auto_379978 ?auto_379977 ) ( ON ?auto_379979 ?auto_379978 ) ( ON ?auto_379980 ?auto_379979 ) ( not ( = ?auto_379972 ?auto_379973 ) ) ( not ( = ?auto_379972 ?auto_379974 ) ) ( not ( = ?auto_379972 ?auto_379975 ) ) ( not ( = ?auto_379972 ?auto_379976 ) ) ( not ( = ?auto_379972 ?auto_379977 ) ) ( not ( = ?auto_379972 ?auto_379978 ) ) ( not ( = ?auto_379972 ?auto_379979 ) ) ( not ( = ?auto_379972 ?auto_379980 ) ) ( not ( = ?auto_379972 ?auto_379981 ) ) ( not ( = ?auto_379972 ?auto_379982 ) ) ( not ( = ?auto_379972 ?auto_379983 ) ) ( not ( = ?auto_379972 ?auto_379984 ) ) ( not ( = ?auto_379972 ?auto_379985 ) ) ( not ( = ?auto_379972 ?auto_379986 ) ) ( not ( = ?auto_379973 ?auto_379974 ) ) ( not ( = ?auto_379973 ?auto_379975 ) ) ( not ( = ?auto_379973 ?auto_379976 ) ) ( not ( = ?auto_379973 ?auto_379977 ) ) ( not ( = ?auto_379973 ?auto_379978 ) ) ( not ( = ?auto_379973 ?auto_379979 ) ) ( not ( = ?auto_379973 ?auto_379980 ) ) ( not ( = ?auto_379973 ?auto_379981 ) ) ( not ( = ?auto_379973 ?auto_379982 ) ) ( not ( = ?auto_379973 ?auto_379983 ) ) ( not ( = ?auto_379973 ?auto_379984 ) ) ( not ( = ?auto_379973 ?auto_379985 ) ) ( not ( = ?auto_379973 ?auto_379986 ) ) ( not ( = ?auto_379974 ?auto_379975 ) ) ( not ( = ?auto_379974 ?auto_379976 ) ) ( not ( = ?auto_379974 ?auto_379977 ) ) ( not ( = ?auto_379974 ?auto_379978 ) ) ( not ( = ?auto_379974 ?auto_379979 ) ) ( not ( = ?auto_379974 ?auto_379980 ) ) ( not ( = ?auto_379974 ?auto_379981 ) ) ( not ( = ?auto_379974 ?auto_379982 ) ) ( not ( = ?auto_379974 ?auto_379983 ) ) ( not ( = ?auto_379974 ?auto_379984 ) ) ( not ( = ?auto_379974 ?auto_379985 ) ) ( not ( = ?auto_379974 ?auto_379986 ) ) ( not ( = ?auto_379975 ?auto_379976 ) ) ( not ( = ?auto_379975 ?auto_379977 ) ) ( not ( = ?auto_379975 ?auto_379978 ) ) ( not ( = ?auto_379975 ?auto_379979 ) ) ( not ( = ?auto_379975 ?auto_379980 ) ) ( not ( = ?auto_379975 ?auto_379981 ) ) ( not ( = ?auto_379975 ?auto_379982 ) ) ( not ( = ?auto_379975 ?auto_379983 ) ) ( not ( = ?auto_379975 ?auto_379984 ) ) ( not ( = ?auto_379975 ?auto_379985 ) ) ( not ( = ?auto_379975 ?auto_379986 ) ) ( not ( = ?auto_379976 ?auto_379977 ) ) ( not ( = ?auto_379976 ?auto_379978 ) ) ( not ( = ?auto_379976 ?auto_379979 ) ) ( not ( = ?auto_379976 ?auto_379980 ) ) ( not ( = ?auto_379976 ?auto_379981 ) ) ( not ( = ?auto_379976 ?auto_379982 ) ) ( not ( = ?auto_379976 ?auto_379983 ) ) ( not ( = ?auto_379976 ?auto_379984 ) ) ( not ( = ?auto_379976 ?auto_379985 ) ) ( not ( = ?auto_379976 ?auto_379986 ) ) ( not ( = ?auto_379977 ?auto_379978 ) ) ( not ( = ?auto_379977 ?auto_379979 ) ) ( not ( = ?auto_379977 ?auto_379980 ) ) ( not ( = ?auto_379977 ?auto_379981 ) ) ( not ( = ?auto_379977 ?auto_379982 ) ) ( not ( = ?auto_379977 ?auto_379983 ) ) ( not ( = ?auto_379977 ?auto_379984 ) ) ( not ( = ?auto_379977 ?auto_379985 ) ) ( not ( = ?auto_379977 ?auto_379986 ) ) ( not ( = ?auto_379978 ?auto_379979 ) ) ( not ( = ?auto_379978 ?auto_379980 ) ) ( not ( = ?auto_379978 ?auto_379981 ) ) ( not ( = ?auto_379978 ?auto_379982 ) ) ( not ( = ?auto_379978 ?auto_379983 ) ) ( not ( = ?auto_379978 ?auto_379984 ) ) ( not ( = ?auto_379978 ?auto_379985 ) ) ( not ( = ?auto_379978 ?auto_379986 ) ) ( not ( = ?auto_379979 ?auto_379980 ) ) ( not ( = ?auto_379979 ?auto_379981 ) ) ( not ( = ?auto_379979 ?auto_379982 ) ) ( not ( = ?auto_379979 ?auto_379983 ) ) ( not ( = ?auto_379979 ?auto_379984 ) ) ( not ( = ?auto_379979 ?auto_379985 ) ) ( not ( = ?auto_379979 ?auto_379986 ) ) ( not ( = ?auto_379980 ?auto_379981 ) ) ( not ( = ?auto_379980 ?auto_379982 ) ) ( not ( = ?auto_379980 ?auto_379983 ) ) ( not ( = ?auto_379980 ?auto_379984 ) ) ( not ( = ?auto_379980 ?auto_379985 ) ) ( not ( = ?auto_379980 ?auto_379986 ) ) ( not ( = ?auto_379981 ?auto_379982 ) ) ( not ( = ?auto_379981 ?auto_379983 ) ) ( not ( = ?auto_379981 ?auto_379984 ) ) ( not ( = ?auto_379981 ?auto_379985 ) ) ( not ( = ?auto_379981 ?auto_379986 ) ) ( not ( = ?auto_379982 ?auto_379983 ) ) ( not ( = ?auto_379982 ?auto_379984 ) ) ( not ( = ?auto_379982 ?auto_379985 ) ) ( not ( = ?auto_379982 ?auto_379986 ) ) ( not ( = ?auto_379983 ?auto_379984 ) ) ( not ( = ?auto_379983 ?auto_379985 ) ) ( not ( = ?auto_379983 ?auto_379986 ) ) ( not ( = ?auto_379984 ?auto_379985 ) ) ( not ( = ?auto_379984 ?auto_379986 ) ) ( not ( = ?auto_379985 ?auto_379986 ) ) ( ON ?auto_379984 ?auto_379985 ) ( ON ?auto_379983 ?auto_379984 ) ( ON ?auto_379982 ?auto_379983 ) ( CLEAR ?auto_379980 ) ( ON ?auto_379981 ?auto_379982 ) ( CLEAR ?auto_379981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_379972 ?auto_379973 ?auto_379974 ?auto_379975 ?auto_379976 ?auto_379977 ?auto_379978 ?auto_379979 ?auto_379980 ?auto_379981 )
      ( MAKE-14PILE ?auto_379972 ?auto_379973 ?auto_379974 ?auto_379975 ?auto_379976 ?auto_379977 ?auto_379978 ?auto_379979 ?auto_379980 ?auto_379981 ?auto_379982 ?auto_379983 ?auto_379984 ?auto_379985 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380001 - BLOCK
      ?auto_380002 - BLOCK
      ?auto_380003 - BLOCK
      ?auto_380004 - BLOCK
      ?auto_380005 - BLOCK
      ?auto_380006 - BLOCK
      ?auto_380007 - BLOCK
      ?auto_380008 - BLOCK
      ?auto_380009 - BLOCK
      ?auto_380010 - BLOCK
      ?auto_380011 - BLOCK
      ?auto_380012 - BLOCK
      ?auto_380013 - BLOCK
      ?auto_380014 - BLOCK
    )
    :vars
    (
      ?auto_380015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380014 ?auto_380015 ) ( ON-TABLE ?auto_380001 ) ( ON ?auto_380002 ?auto_380001 ) ( ON ?auto_380003 ?auto_380002 ) ( ON ?auto_380004 ?auto_380003 ) ( ON ?auto_380005 ?auto_380004 ) ( ON ?auto_380006 ?auto_380005 ) ( ON ?auto_380007 ?auto_380006 ) ( ON ?auto_380008 ?auto_380007 ) ( ON ?auto_380009 ?auto_380008 ) ( not ( = ?auto_380001 ?auto_380002 ) ) ( not ( = ?auto_380001 ?auto_380003 ) ) ( not ( = ?auto_380001 ?auto_380004 ) ) ( not ( = ?auto_380001 ?auto_380005 ) ) ( not ( = ?auto_380001 ?auto_380006 ) ) ( not ( = ?auto_380001 ?auto_380007 ) ) ( not ( = ?auto_380001 ?auto_380008 ) ) ( not ( = ?auto_380001 ?auto_380009 ) ) ( not ( = ?auto_380001 ?auto_380010 ) ) ( not ( = ?auto_380001 ?auto_380011 ) ) ( not ( = ?auto_380001 ?auto_380012 ) ) ( not ( = ?auto_380001 ?auto_380013 ) ) ( not ( = ?auto_380001 ?auto_380014 ) ) ( not ( = ?auto_380001 ?auto_380015 ) ) ( not ( = ?auto_380002 ?auto_380003 ) ) ( not ( = ?auto_380002 ?auto_380004 ) ) ( not ( = ?auto_380002 ?auto_380005 ) ) ( not ( = ?auto_380002 ?auto_380006 ) ) ( not ( = ?auto_380002 ?auto_380007 ) ) ( not ( = ?auto_380002 ?auto_380008 ) ) ( not ( = ?auto_380002 ?auto_380009 ) ) ( not ( = ?auto_380002 ?auto_380010 ) ) ( not ( = ?auto_380002 ?auto_380011 ) ) ( not ( = ?auto_380002 ?auto_380012 ) ) ( not ( = ?auto_380002 ?auto_380013 ) ) ( not ( = ?auto_380002 ?auto_380014 ) ) ( not ( = ?auto_380002 ?auto_380015 ) ) ( not ( = ?auto_380003 ?auto_380004 ) ) ( not ( = ?auto_380003 ?auto_380005 ) ) ( not ( = ?auto_380003 ?auto_380006 ) ) ( not ( = ?auto_380003 ?auto_380007 ) ) ( not ( = ?auto_380003 ?auto_380008 ) ) ( not ( = ?auto_380003 ?auto_380009 ) ) ( not ( = ?auto_380003 ?auto_380010 ) ) ( not ( = ?auto_380003 ?auto_380011 ) ) ( not ( = ?auto_380003 ?auto_380012 ) ) ( not ( = ?auto_380003 ?auto_380013 ) ) ( not ( = ?auto_380003 ?auto_380014 ) ) ( not ( = ?auto_380003 ?auto_380015 ) ) ( not ( = ?auto_380004 ?auto_380005 ) ) ( not ( = ?auto_380004 ?auto_380006 ) ) ( not ( = ?auto_380004 ?auto_380007 ) ) ( not ( = ?auto_380004 ?auto_380008 ) ) ( not ( = ?auto_380004 ?auto_380009 ) ) ( not ( = ?auto_380004 ?auto_380010 ) ) ( not ( = ?auto_380004 ?auto_380011 ) ) ( not ( = ?auto_380004 ?auto_380012 ) ) ( not ( = ?auto_380004 ?auto_380013 ) ) ( not ( = ?auto_380004 ?auto_380014 ) ) ( not ( = ?auto_380004 ?auto_380015 ) ) ( not ( = ?auto_380005 ?auto_380006 ) ) ( not ( = ?auto_380005 ?auto_380007 ) ) ( not ( = ?auto_380005 ?auto_380008 ) ) ( not ( = ?auto_380005 ?auto_380009 ) ) ( not ( = ?auto_380005 ?auto_380010 ) ) ( not ( = ?auto_380005 ?auto_380011 ) ) ( not ( = ?auto_380005 ?auto_380012 ) ) ( not ( = ?auto_380005 ?auto_380013 ) ) ( not ( = ?auto_380005 ?auto_380014 ) ) ( not ( = ?auto_380005 ?auto_380015 ) ) ( not ( = ?auto_380006 ?auto_380007 ) ) ( not ( = ?auto_380006 ?auto_380008 ) ) ( not ( = ?auto_380006 ?auto_380009 ) ) ( not ( = ?auto_380006 ?auto_380010 ) ) ( not ( = ?auto_380006 ?auto_380011 ) ) ( not ( = ?auto_380006 ?auto_380012 ) ) ( not ( = ?auto_380006 ?auto_380013 ) ) ( not ( = ?auto_380006 ?auto_380014 ) ) ( not ( = ?auto_380006 ?auto_380015 ) ) ( not ( = ?auto_380007 ?auto_380008 ) ) ( not ( = ?auto_380007 ?auto_380009 ) ) ( not ( = ?auto_380007 ?auto_380010 ) ) ( not ( = ?auto_380007 ?auto_380011 ) ) ( not ( = ?auto_380007 ?auto_380012 ) ) ( not ( = ?auto_380007 ?auto_380013 ) ) ( not ( = ?auto_380007 ?auto_380014 ) ) ( not ( = ?auto_380007 ?auto_380015 ) ) ( not ( = ?auto_380008 ?auto_380009 ) ) ( not ( = ?auto_380008 ?auto_380010 ) ) ( not ( = ?auto_380008 ?auto_380011 ) ) ( not ( = ?auto_380008 ?auto_380012 ) ) ( not ( = ?auto_380008 ?auto_380013 ) ) ( not ( = ?auto_380008 ?auto_380014 ) ) ( not ( = ?auto_380008 ?auto_380015 ) ) ( not ( = ?auto_380009 ?auto_380010 ) ) ( not ( = ?auto_380009 ?auto_380011 ) ) ( not ( = ?auto_380009 ?auto_380012 ) ) ( not ( = ?auto_380009 ?auto_380013 ) ) ( not ( = ?auto_380009 ?auto_380014 ) ) ( not ( = ?auto_380009 ?auto_380015 ) ) ( not ( = ?auto_380010 ?auto_380011 ) ) ( not ( = ?auto_380010 ?auto_380012 ) ) ( not ( = ?auto_380010 ?auto_380013 ) ) ( not ( = ?auto_380010 ?auto_380014 ) ) ( not ( = ?auto_380010 ?auto_380015 ) ) ( not ( = ?auto_380011 ?auto_380012 ) ) ( not ( = ?auto_380011 ?auto_380013 ) ) ( not ( = ?auto_380011 ?auto_380014 ) ) ( not ( = ?auto_380011 ?auto_380015 ) ) ( not ( = ?auto_380012 ?auto_380013 ) ) ( not ( = ?auto_380012 ?auto_380014 ) ) ( not ( = ?auto_380012 ?auto_380015 ) ) ( not ( = ?auto_380013 ?auto_380014 ) ) ( not ( = ?auto_380013 ?auto_380015 ) ) ( not ( = ?auto_380014 ?auto_380015 ) ) ( ON ?auto_380013 ?auto_380014 ) ( ON ?auto_380012 ?auto_380013 ) ( ON ?auto_380011 ?auto_380012 ) ( CLEAR ?auto_380009 ) ( ON ?auto_380010 ?auto_380011 ) ( CLEAR ?auto_380010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_380001 ?auto_380002 ?auto_380003 ?auto_380004 ?auto_380005 ?auto_380006 ?auto_380007 ?auto_380008 ?auto_380009 ?auto_380010 )
      ( MAKE-14PILE ?auto_380001 ?auto_380002 ?auto_380003 ?auto_380004 ?auto_380005 ?auto_380006 ?auto_380007 ?auto_380008 ?auto_380009 ?auto_380010 ?auto_380011 ?auto_380012 ?auto_380013 ?auto_380014 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380030 - BLOCK
      ?auto_380031 - BLOCK
      ?auto_380032 - BLOCK
      ?auto_380033 - BLOCK
      ?auto_380034 - BLOCK
      ?auto_380035 - BLOCK
      ?auto_380036 - BLOCK
      ?auto_380037 - BLOCK
      ?auto_380038 - BLOCK
      ?auto_380039 - BLOCK
      ?auto_380040 - BLOCK
      ?auto_380041 - BLOCK
      ?auto_380042 - BLOCK
      ?auto_380043 - BLOCK
    )
    :vars
    (
      ?auto_380044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380043 ?auto_380044 ) ( ON-TABLE ?auto_380030 ) ( ON ?auto_380031 ?auto_380030 ) ( ON ?auto_380032 ?auto_380031 ) ( ON ?auto_380033 ?auto_380032 ) ( ON ?auto_380034 ?auto_380033 ) ( ON ?auto_380035 ?auto_380034 ) ( ON ?auto_380036 ?auto_380035 ) ( ON ?auto_380037 ?auto_380036 ) ( not ( = ?auto_380030 ?auto_380031 ) ) ( not ( = ?auto_380030 ?auto_380032 ) ) ( not ( = ?auto_380030 ?auto_380033 ) ) ( not ( = ?auto_380030 ?auto_380034 ) ) ( not ( = ?auto_380030 ?auto_380035 ) ) ( not ( = ?auto_380030 ?auto_380036 ) ) ( not ( = ?auto_380030 ?auto_380037 ) ) ( not ( = ?auto_380030 ?auto_380038 ) ) ( not ( = ?auto_380030 ?auto_380039 ) ) ( not ( = ?auto_380030 ?auto_380040 ) ) ( not ( = ?auto_380030 ?auto_380041 ) ) ( not ( = ?auto_380030 ?auto_380042 ) ) ( not ( = ?auto_380030 ?auto_380043 ) ) ( not ( = ?auto_380030 ?auto_380044 ) ) ( not ( = ?auto_380031 ?auto_380032 ) ) ( not ( = ?auto_380031 ?auto_380033 ) ) ( not ( = ?auto_380031 ?auto_380034 ) ) ( not ( = ?auto_380031 ?auto_380035 ) ) ( not ( = ?auto_380031 ?auto_380036 ) ) ( not ( = ?auto_380031 ?auto_380037 ) ) ( not ( = ?auto_380031 ?auto_380038 ) ) ( not ( = ?auto_380031 ?auto_380039 ) ) ( not ( = ?auto_380031 ?auto_380040 ) ) ( not ( = ?auto_380031 ?auto_380041 ) ) ( not ( = ?auto_380031 ?auto_380042 ) ) ( not ( = ?auto_380031 ?auto_380043 ) ) ( not ( = ?auto_380031 ?auto_380044 ) ) ( not ( = ?auto_380032 ?auto_380033 ) ) ( not ( = ?auto_380032 ?auto_380034 ) ) ( not ( = ?auto_380032 ?auto_380035 ) ) ( not ( = ?auto_380032 ?auto_380036 ) ) ( not ( = ?auto_380032 ?auto_380037 ) ) ( not ( = ?auto_380032 ?auto_380038 ) ) ( not ( = ?auto_380032 ?auto_380039 ) ) ( not ( = ?auto_380032 ?auto_380040 ) ) ( not ( = ?auto_380032 ?auto_380041 ) ) ( not ( = ?auto_380032 ?auto_380042 ) ) ( not ( = ?auto_380032 ?auto_380043 ) ) ( not ( = ?auto_380032 ?auto_380044 ) ) ( not ( = ?auto_380033 ?auto_380034 ) ) ( not ( = ?auto_380033 ?auto_380035 ) ) ( not ( = ?auto_380033 ?auto_380036 ) ) ( not ( = ?auto_380033 ?auto_380037 ) ) ( not ( = ?auto_380033 ?auto_380038 ) ) ( not ( = ?auto_380033 ?auto_380039 ) ) ( not ( = ?auto_380033 ?auto_380040 ) ) ( not ( = ?auto_380033 ?auto_380041 ) ) ( not ( = ?auto_380033 ?auto_380042 ) ) ( not ( = ?auto_380033 ?auto_380043 ) ) ( not ( = ?auto_380033 ?auto_380044 ) ) ( not ( = ?auto_380034 ?auto_380035 ) ) ( not ( = ?auto_380034 ?auto_380036 ) ) ( not ( = ?auto_380034 ?auto_380037 ) ) ( not ( = ?auto_380034 ?auto_380038 ) ) ( not ( = ?auto_380034 ?auto_380039 ) ) ( not ( = ?auto_380034 ?auto_380040 ) ) ( not ( = ?auto_380034 ?auto_380041 ) ) ( not ( = ?auto_380034 ?auto_380042 ) ) ( not ( = ?auto_380034 ?auto_380043 ) ) ( not ( = ?auto_380034 ?auto_380044 ) ) ( not ( = ?auto_380035 ?auto_380036 ) ) ( not ( = ?auto_380035 ?auto_380037 ) ) ( not ( = ?auto_380035 ?auto_380038 ) ) ( not ( = ?auto_380035 ?auto_380039 ) ) ( not ( = ?auto_380035 ?auto_380040 ) ) ( not ( = ?auto_380035 ?auto_380041 ) ) ( not ( = ?auto_380035 ?auto_380042 ) ) ( not ( = ?auto_380035 ?auto_380043 ) ) ( not ( = ?auto_380035 ?auto_380044 ) ) ( not ( = ?auto_380036 ?auto_380037 ) ) ( not ( = ?auto_380036 ?auto_380038 ) ) ( not ( = ?auto_380036 ?auto_380039 ) ) ( not ( = ?auto_380036 ?auto_380040 ) ) ( not ( = ?auto_380036 ?auto_380041 ) ) ( not ( = ?auto_380036 ?auto_380042 ) ) ( not ( = ?auto_380036 ?auto_380043 ) ) ( not ( = ?auto_380036 ?auto_380044 ) ) ( not ( = ?auto_380037 ?auto_380038 ) ) ( not ( = ?auto_380037 ?auto_380039 ) ) ( not ( = ?auto_380037 ?auto_380040 ) ) ( not ( = ?auto_380037 ?auto_380041 ) ) ( not ( = ?auto_380037 ?auto_380042 ) ) ( not ( = ?auto_380037 ?auto_380043 ) ) ( not ( = ?auto_380037 ?auto_380044 ) ) ( not ( = ?auto_380038 ?auto_380039 ) ) ( not ( = ?auto_380038 ?auto_380040 ) ) ( not ( = ?auto_380038 ?auto_380041 ) ) ( not ( = ?auto_380038 ?auto_380042 ) ) ( not ( = ?auto_380038 ?auto_380043 ) ) ( not ( = ?auto_380038 ?auto_380044 ) ) ( not ( = ?auto_380039 ?auto_380040 ) ) ( not ( = ?auto_380039 ?auto_380041 ) ) ( not ( = ?auto_380039 ?auto_380042 ) ) ( not ( = ?auto_380039 ?auto_380043 ) ) ( not ( = ?auto_380039 ?auto_380044 ) ) ( not ( = ?auto_380040 ?auto_380041 ) ) ( not ( = ?auto_380040 ?auto_380042 ) ) ( not ( = ?auto_380040 ?auto_380043 ) ) ( not ( = ?auto_380040 ?auto_380044 ) ) ( not ( = ?auto_380041 ?auto_380042 ) ) ( not ( = ?auto_380041 ?auto_380043 ) ) ( not ( = ?auto_380041 ?auto_380044 ) ) ( not ( = ?auto_380042 ?auto_380043 ) ) ( not ( = ?auto_380042 ?auto_380044 ) ) ( not ( = ?auto_380043 ?auto_380044 ) ) ( ON ?auto_380042 ?auto_380043 ) ( ON ?auto_380041 ?auto_380042 ) ( ON ?auto_380040 ?auto_380041 ) ( ON ?auto_380039 ?auto_380040 ) ( CLEAR ?auto_380037 ) ( ON ?auto_380038 ?auto_380039 ) ( CLEAR ?auto_380038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_380030 ?auto_380031 ?auto_380032 ?auto_380033 ?auto_380034 ?auto_380035 ?auto_380036 ?auto_380037 ?auto_380038 )
      ( MAKE-14PILE ?auto_380030 ?auto_380031 ?auto_380032 ?auto_380033 ?auto_380034 ?auto_380035 ?auto_380036 ?auto_380037 ?auto_380038 ?auto_380039 ?auto_380040 ?auto_380041 ?auto_380042 ?auto_380043 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380059 - BLOCK
      ?auto_380060 - BLOCK
      ?auto_380061 - BLOCK
      ?auto_380062 - BLOCK
      ?auto_380063 - BLOCK
      ?auto_380064 - BLOCK
      ?auto_380065 - BLOCK
      ?auto_380066 - BLOCK
      ?auto_380067 - BLOCK
      ?auto_380068 - BLOCK
      ?auto_380069 - BLOCK
      ?auto_380070 - BLOCK
      ?auto_380071 - BLOCK
      ?auto_380072 - BLOCK
    )
    :vars
    (
      ?auto_380073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380072 ?auto_380073 ) ( ON-TABLE ?auto_380059 ) ( ON ?auto_380060 ?auto_380059 ) ( ON ?auto_380061 ?auto_380060 ) ( ON ?auto_380062 ?auto_380061 ) ( ON ?auto_380063 ?auto_380062 ) ( ON ?auto_380064 ?auto_380063 ) ( ON ?auto_380065 ?auto_380064 ) ( ON ?auto_380066 ?auto_380065 ) ( not ( = ?auto_380059 ?auto_380060 ) ) ( not ( = ?auto_380059 ?auto_380061 ) ) ( not ( = ?auto_380059 ?auto_380062 ) ) ( not ( = ?auto_380059 ?auto_380063 ) ) ( not ( = ?auto_380059 ?auto_380064 ) ) ( not ( = ?auto_380059 ?auto_380065 ) ) ( not ( = ?auto_380059 ?auto_380066 ) ) ( not ( = ?auto_380059 ?auto_380067 ) ) ( not ( = ?auto_380059 ?auto_380068 ) ) ( not ( = ?auto_380059 ?auto_380069 ) ) ( not ( = ?auto_380059 ?auto_380070 ) ) ( not ( = ?auto_380059 ?auto_380071 ) ) ( not ( = ?auto_380059 ?auto_380072 ) ) ( not ( = ?auto_380059 ?auto_380073 ) ) ( not ( = ?auto_380060 ?auto_380061 ) ) ( not ( = ?auto_380060 ?auto_380062 ) ) ( not ( = ?auto_380060 ?auto_380063 ) ) ( not ( = ?auto_380060 ?auto_380064 ) ) ( not ( = ?auto_380060 ?auto_380065 ) ) ( not ( = ?auto_380060 ?auto_380066 ) ) ( not ( = ?auto_380060 ?auto_380067 ) ) ( not ( = ?auto_380060 ?auto_380068 ) ) ( not ( = ?auto_380060 ?auto_380069 ) ) ( not ( = ?auto_380060 ?auto_380070 ) ) ( not ( = ?auto_380060 ?auto_380071 ) ) ( not ( = ?auto_380060 ?auto_380072 ) ) ( not ( = ?auto_380060 ?auto_380073 ) ) ( not ( = ?auto_380061 ?auto_380062 ) ) ( not ( = ?auto_380061 ?auto_380063 ) ) ( not ( = ?auto_380061 ?auto_380064 ) ) ( not ( = ?auto_380061 ?auto_380065 ) ) ( not ( = ?auto_380061 ?auto_380066 ) ) ( not ( = ?auto_380061 ?auto_380067 ) ) ( not ( = ?auto_380061 ?auto_380068 ) ) ( not ( = ?auto_380061 ?auto_380069 ) ) ( not ( = ?auto_380061 ?auto_380070 ) ) ( not ( = ?auto_380061 ?auto_380071 ) ) ( not ( = ?auto_380061 ?auto_380072 ) ) ( not ( = ?auto_380061 ?auto_380073 ) ) ( not ( = ?auto_380062 ?auto_380063 ) ) ( not ( = ?auto_380062 ?auto_380064 ) ) ( not ( = ?auto_380062 ?auto_380065 ) ) ( not ( = ?auto_380062 ?auto_380066 ) ) ( not ( = ?auto_380062 ?auto_380067 ) ) ( not ( = ?auto_380062 ?auto_380068 ) ) ( not ( = ?auto_380062 ?auto_380069 ) ) ( not ( = ?auto_380062 ?auto_380070 ) ) ( not ( = ?auto_380062 ?auto_380071 ) ) ( not ( = ?auto_380062 ?auto_380072 ) ) ( not ( = ?auto_380062 ?auto_380073 ) ) ( not ( = ?auto_380063 ?auto_380064 ) ) ( not ( = ?auto_380063 ?auto_380065 ) ) ( not ( = ?auto_380063 ?auto_380066 ) ) ( not ( = ?auto_380063 ?auto_380067 ) ) ( not ( = ?auto_380063 ?auto_380068 ) ) ( not ( = ?auto_380063 ?auto_380069 ) ) ( not ( = ?auto_380063 ?auto_380070 ) ) ( not ( = ?auto_380063 ?auto_380071 ) ) ( not ( = ?auto_380063 ?auto_380072 ) ) ( not ( = ?auto_380063 ?auto_380073 ) ) ( not ( = ?auto_380064 ?auto_380065 ) ) ( not ( = ?auto_380064 ?auto_380066 ) ) ( not ( = ?auto_380064 ?auto_380067 ) ) ( not ( = ?auto_380064 ?auto_380068 ) ) ( not ( = ?auto_380064 ?auto_380069 ) ) ( not ( = ?auto_380064 ?auto_380070 ) ) ( not ( = ?auto_380064 ?auto_380071 ) ) ( not ( = ?auto_380064 ?auto_380072 ) ) ( not ( = ?auto_380064 ?auto_380073 ) ) ( not ( = ?auto_380065 ?auto_380066 ) ) ( not ( = ?auto_380065 ?auto_380067 ) ) ( not ( = ?auto_380065 ?auto_380068 ) ) ( not ( = ?auto_380065 ?auto_380069 ) ) ( not ( = ?auto_380065 ?auto_380070 ) ) ( not ( = ?auto_380065 ?auto_380071 ) ) ( not ( = ?auto_380065 ?auto_380072 ) ) ( not ( = ?auto_380065 ?auto_380073 ) ) ( not ( = ?auto_380066 ?auto_380067 ) ) ( not ( = ?auto_380066 ?auto_380068 ) ) ( not ( = ?auto_380066 ?auto_380069 ) ) ( not ( = ?auto_380066 ?auto_380070 ) ) ( not ( = ?auto_380066 ?auto_380071 ) ) ( not ( = ?auto_380066 ?auto_380072 ) ) ( not ( = ?auto_380066 ?auto_380073 ) ) ( not ( = ?auto_380067 ?auto_380068 ) ) ( not ( = ?auto_380067 ?auto_380069 ) ) ( not ( = ?auto_380067 ?auto_380070 ) ) ( not ( = ?auto_380067 ?auto_380071 ) ) ( not ( = ?auto_380067 ?auto_380072 ) ) ( not ( = ?auto_380067 ?auto_380073 ) ) ( not ( = ?auto_380068 ?auto_380069 ) ) ( not ( = ?auto_380068 ?auto_380070 ) ) ( not ( = ?auto_380068 ?auto_380071 ) ) ( not ( = ?auto_380068 ?auto_380072 ) ) ( not ( = ?auto_380068 ?auto_380073 ) ) ( not ( = ?auto_380069 ?auto_380070 ) ) ( not ( = ?auto_380069 ?auto_380071 ) ) ( not ( = ?auto_380069 ?auto_380072 ) ) ( not ( = ?auto_380069 ?auto_380073 ) ) ( not ( = ?auto_380070 ?auto_380071 ) ) ( not ( = ?auto_380070 ?auto_380072 ) ) ( not ( = ?auto_380070 ?auto_380073 ) ) ( not ( = ?auto_380071 ?auto_380072 ) ) ( not ( = ?auto_380071 ?auto_380073 ) ) ( not ( = ?auto_380072 ?auto_380073 ) ) ( ON ?auto_380071 ?auto_380072 ) ( ON ?auto_380070 ?auto_380071 ) ( ON ?auto_380069 ?auto_380070 ) ( ON ?auto_380068 ?auto_380069 ) ( CLEAR ?auto_380066 ) ( ON ?auto_380067 ?auto_380068 ) ( CLEAR ?auto_380067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_380059 ?auto_380060 ?auto_380061 ?auto_380062 ?auto_380063 ?auto_380064 ?auto_380065 ?auto_380066 ?auto_380067 )
      ( MAKE-14PILE ?auto_380059 ?auto_380060 ?auto_380061 ?auto_380062 ?auto_380063 ?auto_380064 ?auto_380065 ?auto_380066 ?auto_380067 ?auto_380068 ?auto_380069 ?auto_380070 ?auto_380071 ?auto_380072 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380088 - BLOCK
      ?auto_380089 - BLOCK
      ?auto_380090 - BLOCK
      ?auto_380091 - BLOCK
      ?auto_380092 - BLOCK
      ?auto_380093 - BLOCK
      ?auto_380094 - BLOCK
      ?auto_380095 - BLOCK
      ?auto_380096 - BLOCK
      ?auto_380097 - BLOCK
      ?auto_380098 - BLOCK
      ?auto_380099 - BLOCK
      ?auto_380100 - BLOCK
      ?auto_380101 - BLOCK
    )
    :vars
    (
      ?auto_380102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380101 ?auto_380102 ) ( ON-TABLE ?auto_380088 ) ( ON ?auto_380089 ?auto_380088 ) ( ON ?auto_380090 ?auto_380089 ) ( ON ?auto_380091 ?auto_380090 ) ( ON ?auto_380092 ?auto_380091 ) ( ON ?auto_380093 ?auto_380092 ) ( ON ?auto_380094 ?auto_380093 ) ( not ( = ?auto_380088 ?auto_380089 ) ) ( not ( = ?auto_380088 ?auto_380090 ) ) ( not ( = ?auto_380088 ?auto_380091 ) ) ( not ( = ?auto_380088 ?auto_380092 ) ) ( not ( = ?auto_380088 ?auto_380093 ) ) ( not ( = ?auto_380088 ?auto_380094 ) ) ( not ( = ?auto_380088 ?auto_380095 ) ) ( not ( = ?auto_380088 ?auto_380096 ) ) ( not ( = ?auto_380088 ?auto_380097 ) ) ( not ( = ?auto_380088 ?auto_380098 ) ) ( not ( = ?auto_380088 ?auto_380099 ) ) ( not ( = ?auto_380088 ?auto_380100 ) ) ( not ( = ?auto_380088 ?auto_380101 ) ) ( not ( = ?auto_380088 ?auto_380102 ) ) ( not ( = ?auto_380089 ?auto_380090 ) ) ( not ( = ?auto_380089 ?auto_380091 ) ) ( not ( = ?auto_380089 ?auto_380092 ) ) ( not ( = ?auto_380089 ?auto_380093 ) ) ( not ( = ?auto_380089 ?auto_380094 ) ) ( not ( = ?auto_380089 ?auto_380095 ) ) ( not ( = ?auto_380089 ?auto_380096 ) ) ( not ( = ?auto_380089 ?auto_380097 ) ) ( not ( = ?auto_380089 ?auto_380098 ) ) ( not ( = ?auto_380089 ?auto_380099 ) ) ( not ( = ?auto_380089 ?auto_380100 ) ) ( not ( = ?auto_380089 ?auto_380101 ) ) ( not ( = ?auto_380089 ?auto_380102 ) ) ( not ( = ?auto_380090 ?auto_380091 ) ) ( not ( = ?auto_380090 ?auto_380092 ) ) ( not ( = ?auto_380090 ?auto_380093 ) ) ( not ( = ?auto_380090 ?auto_380094 ) ) ( not ( = ?auto_380090 ?auto_380095 ) ) ( not ( = ?auto_380090 ?auto_380096 ) ) ( not ( = ?auto_380090 ?auto_380097 ) ) ( not ( = ?auto_380090 ?auto_380098 ) ) ( not ( = ?auto_380090 ?auto_380099 ) ) ( not ( = ?auto_380090 ?auto_380100 ) ) ( not ( = ?auto_380090 ?auto_380101 ) ) ( not ( = ?auto_380090 ?auto_380102 ) ) ( not ( = ?auto_380091 ?auto_380092 ) ) ( not ( = ?auto_380091 ?auto_380093 ) ) ( not ( = ?auto_380091 ?auto_380094 ) ) ( not ( = ?auto_380091 ?auto_380095 ) ) ( not ( = ?auto_380091 ?auto_380096 ) ) ( not ( = ?auto_380091 ?auto_380097 ) ) ( not ( = ?auto_380091 ?auto_380098 ) ) ( not ( = ?auto_380091 ?auto_380099 ) ) ( not ( = ?auto_380091 ?auto_380100 ) ) ( not ( = ?auto_380091 ?auto_380101 ) ) ( not ( = ?auto_380091 ?auto_380102 ) ) ( not ( = ?auto_380092 ?auto_380093 ) ) ( not ( = ?auto_380092 ?auto_380094 ) ) ( not ( = ?auto_380092 ?auto_380095 ) ) ( not ( = ?auto_380092 ?auto_380096 ) ) ( not ( = ?auto_380092 ?auto_380097 ) ) ( not ( = ?auto_380092 ?auto_380098 ) ) ( not ( = ?auto_380092 ?auto_380099 ) ) ( not ( = ?auto_380092 ?auto_380100 ) ) ( not ( = ?auto_380092 ?auto_380101 ) ) ( not ( = ?auto_380092 ?auto_380102 ) ) ( not ( = ?auto_380093 ?auto_380094 ) ) ( not ( = ?auto_380093 ?auto_380095 ) ) ( not ( = ?auto_380093 ?auto_380096 ) ) ( not ( = ?auto_380093 ?auto_380097 ) ) ( not ( = ?auto_380093 ?auto_380098 ) ) ( not ( = ?auto_380093 ?auto_380099 ) ) ( not ( = ?auto_380093 ?auto_380100 ) ) ( not ( = ?auto_380093 ?auto_380101 ) ) ( not ( = ?auto_380093 ?auto_380102 ) ) ( not ( = ?auto_380094 ?auto_380095 ) ) ( not ( = ?auto_380094 ?auto_380096 ) ) ( not ( = ?auto_380094 ?auto_380097 ) ) ( not ( = ?auto_380094 ?auto_380098 ) ) ( not ( = ?auto_380094 ?auto_380099 ) ) ( not ( = ?auto_380094 ?auto_380100 ) ) ( not ( = ?auto_380094 ?auto_380101 ) ) ( not ( = ?auto_380094 ?auto_380102 ) ) ( not ( = ?auto_380095 ?auto_380096 ) ) ( not ( = ?auto_380095 ?auto_380097 ) ) ( not ( = ?auto_380095 ?auto_380098 ) ) ( not ( = ?auto_380095 ?auto_380099 ) ) ( not ( = ?auto_380095 ?auto_380100 ) ) ( not ( = ?auto_380095 ?auto_380101 ) ) ( not ( = ?auto_380095 ?auto_380102 ) ) ( not ( = ?auto_380096 ?auto_380097 ) ) ( not ( = ?auto_380096 ?auto_380098 ) ) ( not ( = ?auto_380096 ?auto_380099 ) ) ( not ( = ?auto_380096 ?auto_380100 ) ) ( not ( = ?auto_380096 ?auto_380101 ) ) ( not ( = ?auto_380096 ?auto_380102 ) ) ( not ( = ?auto_380097 ?auto_380098 ) ) ( not ( = ?auto_380097 ?auto_380099 ) ) ( not ( = ?auto_380097 ?auto_380100 ) ) ( not ( = ?auto_380097 ?auto_380101 ) ) ( not ( = ?auto_380097 ?auto_380102 ) ) ( not ( = ?auto_380098 ?auto_380099 ) ) ( not ( = ?auto_380098 ?auto_380100 ) ) ( not ( = ?auto_380098 ?auto_380101 ) ) ( not ( = ?auto_380098 ?auto_380102 ) ) ( not ( = ?auto_380099 ?auto_380100 ) ) ( not ( = ?auto_380099 ?auto_380101 ) ) ( not ( = ?auto_380099 ?auto_380102 ) ) ( not ( = ?auto_380100 ?auto_380101 ) ) ( not ( = ?auto_380100 ?auto_380102 ) ) ( not ( = ?auto_380101 ?auto_380102 ) ) ( ON ?auto_380100 ?auto_380101 ) ( ON ?auto_380099 ?auto_380100 ) ( ON ?auto_380098 ?auto_380099 ) ( ON ?auto_380097 ?auto_380098 ) ( ON ?auto_380096 ?auto_380097 ) ( CLEAR ?auto_380094 ) ( ON ?auto_380095 ?auto_380096 ) ( CLEAR ?auto_380095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_380088 ?auto_380089 ?auto_380090 ?auto_380091 ?auto_380092 ?auto_380093 ?auto_380094 ?auto_380095 )
      ( MAKE-14PILE ?auto_380088 ?auto_380089 ?auto_380090 ?auto_380091 ?auto_380092 ?auto_380093 ?auto_380094 ?auto_380095 ?auto_380096 ?auto_380097 ?auto_380098 ?auto_380099 ?auto_380100 ?auto_380101 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380117 - BLOCK
      ?auto_380118 - BLOCK
      ?auto_380119 - BLOCK
      ?auto_380120 - BLOCK
      ?auto_380121 - BLOCK
      ?auto_380122 - BLOCK
      ?auto_380123 - BLOCK
      ?auto_380124 - BLOCK
      ?auto_380125 - BLOCK
      ?auto_380126 - BLOCK
      ?auto_380127 - BLOCK
      ?auto_380128 - BLOCK
      ?auto_380129 - BLOCK
      ?auto_380130 - BLOCK
    )
    :vars
    (
      ?auto_380131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380130 ?auto_380131 ) ( ON-TABLE ?auto_380117 ) ( ON ?auto_380118 ?auto_380117 ) ( ON ?auto_380119 ?auto_380118 ) ( ON ?auto_380120 ?auto_380119 ) ( ON ?auto_380121 ?auto_380120 ) ( ON ?auto_380122 ?auto_380121 ) ( ON ?auto_380123 ?auto_380122 ) ( not ( = ?auto_380117 ?auto_380118 ) ) ( not ( = ?auto_380117 ?auto_380119 ) ) ( not ( = ?auto_380117 ?auto_380120 ) ) ( not ( = ?auto_380117 ?auto_380121 ) ) ( not ( = ?auto_380117 ?auto_380122 ) ) ( not ( = ?auto_380117 ?auto_380123 ) ) ( not ( = ?auto_380117 ?auto_380124 ) ) ( not ( = ?auto_380117 ?auto_380125 ) ) ( not ( = ?auto_380117 ?auto_380126 ) ) ( not ( = ?auto_380117 ?auto_380127 ) ) ( not ( = ?auto_380117 ?auto_380128 ) ) ( not ( = ?auto_380117 ?auto_380129 ) ) ( not ( = ?auto_380117 ?auto_380130 ) ) ( not ( = ?auto_380117 ?auto_380131 ) ) ( not ( = ?auto_380118 ?auto_380119 ) ) ( not ( = ?auto_380118 ?auto_380120 ) ) ( not ( = ?auto_380118 ?auto_380121 ) ) ( not ( = ?auto_380118 ?auto_380122 ) ) ( not ( = ?auto_380118 ?auto_380123 ) ) ( not ( = ?auto_380118 ?auto_380124 ) ) ( not ( = ?auto_380118 ?auto_380125 ) ) ( not ( = ?auto_380118 ?auto_380126 ) ) ( not ( = ?auto_380118 ?auto_380127 ) ) ( not ( = ?auto_380118 ?auto_380128 ) ) ( not ( = ?auto_380118 ?auto_380129 ) ) ( not ( = ?auto_380118 ?auto_380130 ) ) ( not ( = ?auto_380118 ?auto_380131 ) ) ( not ( = ?auto_380119 ?auto_380120 ) ) ( not ( = ?auto_380119 ?auto_380121 ) ) ( not ( = ?auto_380119 ?auto_380122 ) ) ( not ( = ?auto_380119 ?auto_380123 ) ) ( not ( = ?auto_380119 ?auto_380124 ) ) ( not ( = ?auto_380119 ?auto_380125 ) ) ( not ( = ?auto_380119 ?auto_380126 ) ) ( not ( = ?auto_380119 ?auto_380127 ) ) ( not ( = ?auto_380119 ?auto_380128 ) ) ( not ( = ?auto_380119 ?auto_380129 ) ) ( not ( = ?auto_380119 ?auto_380130 ) ) ( not ( = ?auto_380119 ?auto_380131 ) ) ( not ( = ?auto_380120 ?auto_380121 ) ) ( not ( = ?auto_380120 ?auto_380122 ) ) ( not ( = ?auto_380120 ?auto_380123 ) ) ( not ( = ?auto_380120 ?auto_380124 ) ) ( not ( = ?auto_380120 ?auto_380125 ) ) ( not ( = ?auto_380120 ?auto_380126 ) ) ( not ( = ?auto_380120 ?auto_380127 ) ) ( not ( = ?auto_380120 ?auto_380128 ) ) ( not ( = ?auto_380120 ?auto_380129 ) ) ( not ( = ?auto_380120 ?auto_380130 ) ) ( not ( = ?auto_380120 ?auto_380131 ) ) ( not ( = ?auto_380121 ?auto_380122 ) ) ( not ( = ?auto_380121 ?auto_380123 ) ) ( not ( = ?auto_380121 ?auto_380124 ) ) ( not ( = ?auto_380121 ?auto_380125 ) ) ( not ( = ?auto_380121 ?auto_380126 ) ) ( not ( = ?auto_380121 ?auto_380127 ) ) ( not ( = ?auto_380121 ?auto_380128 ) ) ( not ( = ?auto_380121 ?auto_380129 ) ) ( not ( = ?auto_380121 ?auto_380130 ) ) ( not ( = ?auto_380121 ?auto_380131 ) ) ( not ( = ?auto_380122 ?auto_380123 ) ) ( not ( = ?auto_380122 ?auto_380124 ) ) ( not ( = ?auto_380122 ?auto_380125 ) ) ( not ( = ?auto_380122 ?auto_380126 ) ) ( not ( = ?auto_380122 ?auto_380127 ) ) ( not ( = ?auto_380122 ?auto_380128 ) ) ( not ( = ?auto_380122 ?auto_380129 ) ) ( not ( = ?auto_380122 ?auto_380130 ) ) ( not ( = ?auto_380122 ?auto_380131 ) ) ( not ( = ?auto_380123 ?auto_380124 ) ) ( not ( = ?auto_380123 ?auto_380125 ) ) ( not ( = ?auto_380123 ?auto_380126 ) ) ( not ( = ?auto_380123 ?auto_380127 ) ) ( not ( = ?auto_380123 ?auto_380128 ) ) ( not ( = ?auto_380123 ?auto_380129 ) ) ( not ( = ?auto_380123 ?auto_380130 ) ) ( not ( = ?auto_380123 ?auto_380131 ) ) ( not ( = ?auto_380124 ?auto_380125 ) ) ( not ( = ?auto_380124 ?auto_380126 ) ) ( not ( = ?auto_380124 ?auto_380127 ) ) ( not ( = ?auto_380124 ?auto_380128 ) ) ( not ( = ?auto_380124 ?auto_380129 ) ) ( not ( = ?auto_380124 ?auto_380130 ) ) ( not ( = ?auto_380124 ?auto_380131 ) ) ( not ( = ?auto_380125 ?auto_380126 ) ) ( not ( = ?auto_380125 ?auto_380127 ) ) ( not ( = ?auto_380125 ?auto_380128 ) ) ( not ( = ?auto_380125 ?auto_380129 ) ) ( not ( = ?auto_380125 ?auto_380130 ) ) ( not ( = ?auto_380125 ?auto_380131 ) ) ( not ( = ?auto_380126 ?auto_380127 ) ) ( not ( = ?auto_380126 ?auto_380128 ) ) ( not ( = ?auto_380126 ?auto_380129 ) ) ( not ( = ?auto_380126 ?auto_380130 ) ) ( not ( = ?auto_380126 ?auto_380131 ) ) ( not ( = ?auto_380127 ?auto_380128 ) ) ( not ( = ?auto_380127 ?auto_380129 ) ) ( not ( = ?auto_380127 ?auto_380130 ) ) ( not ( = ?auto_380127 ?auto_380131 ) ) ( not ( = ?auto_380128 ?auto_380129 ) ) ( not ( = ?auto_380128 ?auto_380130 ) ) ( not ( = ?auto_380128 ?auto_380131 ) ) ( not ( = ?auto_380129 ?auto_380130 ) ) ( not ( = ?auto_380129 ?auto_380131 ) ) ( not ( = ?auto_380130 ?auto_380131 ) ) ( ON ?auto_380129 ?auto_380130 ) ( ON ?auto_380128 ?auto_380129 ) ( ON ?auto_380127 ?auto_380128 ) ( ON ?auto_380126 ?auto_380127 ) ( ON ?auto_380125 ?auto_380126 ) ( CLEAR ?auto_380123 ) ( ON ?auto_380124 ?auto_380125 ) ( CLEAR ?auto_380124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_380117 ?auto_380118 ?auto_380119 ?auto_380120 ?auto_380121 ?auto_380122 ?auto_380123 ?auto_380124 )
      ( MAKE-14PILE ?auto_380117 ?auto_380118 ?auto_380119 ?auto_380120 ?auto_380121 ?auto_380122 ?auto_380123 ?auto_380124 ?auto_380125 ?auto_380126 ?auto_380127 ?auto_380128 ?auto_380129 ?auto_380130 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380146 - BLOCK
      ?auto_380147 - BLOCK
      ?auto_380148 - BLOCK
      ?auto_380149 - BLOCK
      ?auto_380150 - BLOCK
      ?auto_380151 - BLOCK
      ?auto_380152 - BLOCK
      ?auto_380153 - BLOCK
      ?auto_380154 - BLOCK
      ?auto_380155 - BLOCK
      ?auto_380156 - BLOCK
      ?auto_380157 - BLOCK
      ?auto_380158 - BLOCK
      ?auto_380159 - BLOCK
    )
    :vars
    (
      ?auto_380160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380159 ?auto_380160 ) ( ON-TABLE ?auto_380146 ) ( ON ?auto_380147 ?auto_380146 ) ( ON ?auto_380148 ?auto_380147 ) ( ON ?auto_380149 ?auto_380148 ) ( ON ?auto_380150 ?auto_380149 ) ( ON ?auto_380151 ?auto_380150 ) ( not ( = ?auto_380146 ?auto_380147 ) ) ( not ( = ?auto_380146 ?auto_380148 ) ) ( not ( = ?auto_380146 ?auto_380149 ) ) ( not ( = ?auto_380146 ?auto_380150 ) ) ( not ( = ?auto_380146 ?auto_380151 ) ) ( not ( = ?auto_380146 ?auto_380152 ) ) ( not ( = ?auto_380146 ?auto_380153 ) ) ( not ( = ?auto_380146 ?auto_380154 ) ) ( not ( = ?auto_380146 ?auto_380155 ) ) ( not ( = ?auto_380146 ?auto_380156 ) ) ( not ( = ?auto_380146 ?auto_380157 ) ) ( not ( = ?auto_380146 ?auto_380158 ) ) ( not ( = ?auto_380146 ?auto_380159 ) ) ( not ( = ?auto_380146 ?auto_380160 ) ) ( not ( = ?auto_380147 ?auto_380148 ) ) ( not ( = ?auto_380147 ?auto_380149 ) ) ( not ( = ?auto_380147 ?auto_380150 ) ) ( not ( = ?auto_380147 ?auto_380151 ) ) ( not ( = ?auto_380147 ?auto_380152 ) ) ( not ( = ?auto_380147 ?auto_380153 ) ) ( not ( = ?auto_380147 ?auto_380154 ) ) ( not ( = ?auto_380147 ?auto_380155 ) ) ( not ( = ?auto_380147 ?auto_380156 ) ) ( not ( = ?auto_380147 ?auto_380157 ) ) ( not ( = ?auto_380147 ?auto_380158 ) ) ( not ( = ?auto_380147 ?auto_380159 ) ) ( not ( = ?auto_380147 ?auto_380160 ) ) ( not ( = ?auto_380148 ?auto_380149 ) ) ( not ( = ?auto_380148 ?auto_380150 ) ) ( not ( = ?auto_380148 ?auto_380151 ) ) ( not ( = ?auto_380148 ?auto_380152 ) ) ( not ( = ?auto_380148 ?auto_380153 ) ) ( not ( = ?auto_380148 ?auto_380154 ) ) ( not ( = ?auto_380148 ?auto_380155 ) ) ( not ( = ?auto_380148 ?auto_380156 ) ) ( not ( = ?auto_380148 ?auto_380157 ) ) ( not ( = ?auto_380148 ?auto_380158 ) ) ( not ( = ?auto_380148 ?auto_380159 ) ) ( not ( = ?auto_380148 ?auto_380160 ) ) ( not ( = ?auto_380149 ?auto_380150 ) ) ( not ( = ?auto_380149 ?auto_380151 ) ) ( not ( = ?auto_380149 ?auto_380152 ) ) ( not ( = ?auto_380149 ?auto_380153 ) ) ( not ( = ?auto_380149 ?auto_380154 ) ) ( not ( = ?auto_380149 ?auto_380155 ) ) ( not ( = ?auto_380149 ?auto_380156 ) ) ( not ( = ?auto_380149 ?auto_380157 ) ) ( not ( = ?auto_380149 ?auto_380158 ) ) ( not ( = ?auto_380149 ?auto_380159 ) ) ( not ( = ?auto_380149 ?auto_380160 ) ) ( not ( = ?auto_380150 ?auto_380151 ) ) ( not ( = ?auto_380150 ?auto_380152 ) ) ( not ( = ?auto_380150 ?auto_380153 ) ) ( not ( = ?auto_380150 ?auto_380154 ) ) ( not ( = ?auto_380150 ?auto_380155 ) ) ( not ( = ?auto_380150 ?auto_380156 ) ) ( not ( = ?auto_380150 ?auto_380157 ) ) ( not ( = ?auto_380150 ?auto_380158 ) ) ( not ( = ?auto_380150 ?auto_380159 ) ) ( not ( = ?auto_380150 ?auto_380160 ) ) ( not ( = ?auto_380151 ?auto_380152 ) ) ( not ( = ?auto_380151 ?auto_380153 ) ) ( not ( = ?auto_380151 ?auto_380154 ) ) ( not ( = ?auto_380151 ?auto_380155 ) ) ( not ( = ?auto_380151 ?auto_380156 ) ) ( not ( = ?auto_380151 ?auto_380157 ) ) ( not ( = ?auto_380151 ?auto_380158 ) ) ( not ( = ?auto_380151 ?auto_380159 ) ) ( not ( = ?auto_380151 ?auto_380160 ) ) ( not ( = ?auto_380152 ?auto_380153 ) ) ( not ( = ?auto_380152 ?auto_380154 ) ) ( not ( = ?auto_380152 ?auto_380155 ) ) ( not ( = ?auto_380152 ?auto_380156 ) ) ( not ( = ?auto_380152 ?auto_380157 ) ) ( not ( = ?auto_380152 ?auto_380158 ) ) ( not ( = ?auto_380152 ?auto_380159 ) ) ( not ( = ?auto_380152 ?auto_380160 ) ) ( not ( = ?auto_380153 ?auto_380154 ) ) ( not ( = ?auto_380153 ?auto_380155 ) ) ( not ( = ?auto_380153 ?auto_380156 ) ) ( not ( = ?auto_380153 ?auto_380157 ) ) ( not ( = ?auto_380153 ?auto_380158 ) ) ( not ( = ?auto_380153 ?auto_380159 ) ) ( not ( = ?auto_380153 ?auto_380160 ) ) ( not ( = ?auto_380154 ?auto_380155 ) ) ( not ( = ?auto_380154 ?auto_380156 ) ) ( not ( = ?auto_380154 ?auto_380157 ) ) ( not ( = ?auto_380154 ?auto_380158 ) ) ( not ( = ?auto_380154 ?auto_380159 ) ) ( not ( = ?auto_380154 ?auto_380160 ) ) ( not ( = ?auto_380155 ?auto_380156 ) ) ( not ( = ?auto_380155 ?auto_380157 ) ) ( not ( = ?auto_380155 ?auto_380158 ) ) ( not ( = ?auto_380155 ?auto_380159 ) ) ( not ( = ?auto_380155 ?auto_380160 ) ) ( not ( = ?auto_380156 ?auto_380157 ) ) ( not ( = ?auto_380156 ?auto_380158 ) ) ( not ( = ?auto_380156 ?auto_380159 ) ) ( not ( = ?auto_380156 ?auto_380160 ) ) ( not ( = ?auto_380157 ?auto_380158 ) ) ( not ( = ?auto_380157 ?auto_380159 ) ) ( not ( = ?auto_380157 ?auto_380160 ) ) ( not ( = ?auto_380158 ?auto_380159 ) ) ( not ( = ?auto_380158 ?auto_380160 ) ) ( not ( = ?auto_380159 ?auto_380160 ) ) ( ON ?auto_380158 ?auto_380159 ) ( ON ?auto_380157 ?auto_380158 ) ( ON ?auto_380156 ?auto_380157 ) ( ON ?auto_380155 ?auto_380156 ) ( ON ?auto_380154 ?auto_380155 ) ( ON ?auto_380153 ?auto_380154 ) ( CLEAR ?auto_380151 ) ( ON ?auto_380152 ?auto_380153 ) ( CLEAR ?auto_380152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_380146 ?auto_380147 ?auto_380148 ?auto_380149 ?auto_380150 ?auto_380151 ?auto_380152 )
      ( MAKE-14PILE ?auto_380146 ?auto_380147 ?auto_380148 ?auto_380149 ?auto_380150 ?auto_380151 ?auto_380152 ?auto_380153 ?auto_380154 ?auto_380155 ?auto_380156 ?auto_380157 ?auto_380158 ?auto_380159 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380175 - BLOCK
      ?auto_380176 - BLOCK
      ?auto_380177 - BLOCK
      ?auto_380178 - BLOCK
      ?auto_380179 - BLOCK
      ?auto_380180 - BLOCK
      ?auto_380181 - BLOCK
      ?auto_380182 - BLOCK
      ?auto_380183 - BLOCK
      ?auto_380184 - BLOCK
      ?auto_380185 - BLOCK
      ?auto_380186 - BLOCK
      ?auto_380187 - BLOCK
      ?auto_380188 - BLOCK
    )
    :vars
    (
      ?auto_380189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380188 ?auto_380189 ) ( ON-TABLE ?auto_380175 ) ( ON ?auto_380176 ?auto_380175 ) ( ON ?auto_380177 ?auto_380176 ) ( ON ?auto_380178 ?auto_380177 ) ( ON ?auto_380179 ?auto_380178 ) ( ON ?auto_380180 ?auto_380179 ) ( not ( = ?auto_380175 ?auto_380176 ) ) ( not ( = ?auto_380175 ?auto_380177 ) ) ( not ( = ?auto_380175 ?auto_380178 ) ) ( not ( = ?auto_380175 ?auto_380179 ) ) ( not ( = ?auto_380175 ?auto_380180 ) ) ( not ( = ?auto_380175 ?auto_380181 ) ) ( not ( = ?auto_380175 ?auto_380182 ) ) ( not ( = ?auto_380175 ?auto_380183 ) ) ( not ( = ?auto_380175 ?auto_380184 ) ) ( not ( = ?auto_380175 ?auto_380185 ) ) ( not ( = ?auto_380175 ?auto_380186 ) ) ( not ( = ?auto_380175 ?auto_380187 ) ) ( not ( = ?auto_380175 ?auto_380188 ) ) ( not ( = ?auto_380175 ?auto_380189 ) ) ( not ( = ?auto_380176 ?auto_380177 ) ) ( not ( = ?auto_380176 ?auto_380178 ) ) ( not ( = ?auto_380176 ?auto_380179 ) ) ( not ( = ?auto_380176 ?auto_380180 ) ) ( not ( = ?auto_380176 ?auto_380181 ) ) ( not ( = ?auto_380176 ?auto_380182 ) ) ( not ( = ?auto_380176 ?auto_380183 ) ) ( not ( = ?auto_380176 ?auto_380184 ) ) ( not ( = ?auto_380176 ?auto_380185 ) ) ( not ( = ?auto_380176 ?auto_380186 ) ) ( not ( = ?auto_380176 ?auto_380187 ) ) ( not ( = ?auto_380176 ?auto_380188 ) ) ( not ( = ?auto_380176 ?auto_380189 ) ) ( not ( = ?auto_380177 ?auto_380178 ) ) ( not ( = ?auto_380177 ?auto_380179 ) ) ( not ( = ?auto_380177 ?auto_380180 ) ) ( not ( = ?auto_380177 ?auto_380181 ) ) ( not ( = ?auto_380177 ?auto_380182 ) ) ( not ( = ?auto_380177 ?auto_380183 ) ) ( not ( = ?auto_380177 ?auto_380184 ) ) ( not ( = ?auto_380177 ?auto_380185 ) ) ( not ( = ?auto_380177 ?auto_380186 ) ) ( not ( = ?auto_380177 ?auto_380187 ) ) ( not ( = ?auto_380177 ?auto_380188 ) ) ( not ( = ?auto_380177 ?auto_380189 ) ) ( not ( = ?auto_380178 ?auto_380179 ) ) ( not ( = ?auto_380178 ?auto_380180 ) ) ( not ( = ?auto_380178 ?auto_380181 ) ) ( not ( = ?auto_380178 ?auto_380182 ) ) ( not ( = ?auto_380178 ?auto_380183 ) ) ( not ( = ?auto_380178 ?auto_380184 ) ) ( not ( = ?auto_380178 ?auto_380185 ) ) ( not ( = ?auto_380178 ?auto_380186 ) ) ( not ( = ?auto_380178 ?auto_380187 ) ) ( not ( = ?auto_380178 ?auto_380188 ) ) ( not ( = ?auto_380178 ?auto_380189 ) ) ( not ( = ?auto_380179 ?auto_380180 ) ) ( not ( = ?auto_380179 ?auto_380181 ) ) ( not ( = ?auto_380179 ?auto_380182 ) ) ( not ( = ?auto_380179 ?auto_380183 ) ) ( not ( = ?auto_380179 ?auto_380184 ) ) ( not ( = ?auto_380179 ?auto_380185 ) ) ( not ( = ?auto_380179 ?auto_380186 ) ) ( not ( = ?auto_380179 ?auto_380187 ) ) ( not ( = ?auto_380179 ?auto_380188 ) ) ( not ( = ?auto_380179 ?auto_380189 ) ) ( not ( = ?auto_380180 ?auto_380181 ) ) ( not ( = ?auto_380180 ?auto_380182 ) ) ( not ( = ?auto_380180 ?auto_380183 ) ) ( not ( = ?auto_380180 ?auto_380184 ) ) ( not ( = ?auto_380180 ?auto_380185 ) ) ( not ( = ?auto_380180 ?auto_380186 ) ) ( not ( = ?auto_380180 ?auto_380187 ) ) ( not ( = ?auto_380180 ?auto_380188 ) ) ( not ( = ?auto_380180 ?auto_380189 ) ) ( not ( = ?auto_380181 ?auto_380182 ) ) ( not ( = ?auto_380181 ?auto_380183 ) ) ( not ( = ?auto_380181 ?auto_380184 ) ) ( not ( = ?auto_380181 ?auto_380185 ) ) ( not ( = ?auto_380181 ?auto_380186 ) ) ( not ( = ?auto_380181 ?auto_380187 ) ) ( not ( = ?auto_380181 ?auto_380188 ) ) ( not ( = ?auto_380181 ?auto_380189 ) ) ( not ( = ?auto_380182 ?auto_380183 ) ) ( not ( = ?auto_380182 ?auto_380184 ) ) ( not ( = ?auto_380182 ?auto_380185 ) ) ( not ( = ?auto_380182 ?auto_380186 ) ) ( not ( = ?auto_380182 ?auto_380187 ) ) ( not ( = ?auto_380182 ?auto_380188 ) ) ( not ( = ?auto_380182 ?auto_380189 ) ) ( not ( = ?auto_380183 ?auto_380184 ) ) ( not ( = ?auto_380183 ?auto_380185 ) ) ( not ( = ?auto_380183 ?auto_380186 ) ) ( not ( = ?auto_380183 ?auto_380187 ) ) ( not ( = ?auto_380183 ?auto_380188 ) ) ( not ( = ?auto_380183 ?auto_380189 ) ) ( not ( = ?auto_380184 ?auto_380185 ) ) ( not ( = ?auto_380184 ?auto_380186 ) ) ( not ( = ?auto_380184 ?auto_380187 ) ) ( not ( = ?auto_380184 ?auto_380188 ) ) ( not ( = ?auto_380184 ?auto_380189 ) ) ( not ( = ?auto_380185 ?auto_380186 ) ) ( not ( = ?auto_380185 ?auto_380187 ) ) ( not ( = ?auto_380185 ?auto_380188 ) ) ( not ( = ?auto_380185 ?auto_380189 ) ) ( not ( = ?auto_380186 ?auto_380187 ) ) ( not ( = ?auto_380186 ?auto_380188 ) ) ( not ( = ?auto_380186 ?auto_380189 ) ) ( not ( = ?auto_380187 ?auto_380188 ) ) ( not ( = ?auto_380187 ?auto_380189 ) ) ( not ( = ?auto_380188 ?auto_380189 ) ) ( ON ?auto_380187 ?auto_380188 ) ( ON ?auto_380186 ?auto_380187 ) ( ON ?auto_380185 ?auto_380186 ) ( ON ?auto_380184 ?auto_380185 ) ( ON ?auto_380183 ?auto_380184 ) ( ON ?auto_380182 ?auto_380183 ) ( CLEAR ?auto_380180 ) ( ON ?auto_380181 ?auto_380182 ) ( CLEAR ?auto_380181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_380175 ?auto_380176 ?auto_380177 ?auto_380178 ?auto_380179 ?auto_380180 ?auto_380181 )
      ( MAKE-14PILE ?auto_380175 ?auto_380176 ?auto_380177 ?auto_380178 ?auto_380179 ?auto_380180 ?auto_380181 ?auto_380182 ?auto_380183 ?auto_380184 ?auto_380185 ?auto_380186 ?auto_380187 ?auto_380188 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380204 - BLOCK
      ?auto_380205 - BLOCK
      ?auto_380206 - BLOCK
      ?auto_380207 - BLOCK
      ?auto_380208 - BLOCK
      ?auto_380209 - BLOCK
      ?auto_380210 - BLOCK
      ?auto_380211 - BLOCK
      ?auto_380212 - BLOCK
      ?auto_380213 - BLOCK
      ?auto_380214 - BLOCK
      ?auto_380215 - BLOCK
      ?auto_380216 - BLOCK
      ?auto_380217 - BLOCK
    )
    :vars
    (
      ?auto_380218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380217 ?auto_380218 ) ( ON-TABLE ?auto_380204 ) ( ON ?auto_380205 ?auto_380204 ) ( ON ?auto_380206 ?auto_380205 ) ( ON ?auto_380207 ?auto_380206 ) ( ON ?auto_380208 ?auto_380207 ) ( not ( = ?auto_380204 ?auto_380205 ) ) ( not ( = ?auto_380204 ?auto_380206 ) ) ( not ( = ?auto_380204 ?auto_380207 ) ) ( not ( = ?auto_380204 ?auto_380208 ) ) ( not ( = ?auto_380204 ?auto_380209 ) ) ( not ( = ?auto_380204 ?auto_380210 ) ) ( not ( = ?auto_380204 ?auto_380211 ) ) ( not ( = ?auto_380204 ?auto_380212 ) ) ( not ( = ?auto_380204 ?auto_380213 ) ) ( not ( = ?auto_380204 ?auto_380214 ) ) ( not ( = ?auto_380204 ?auto_380215 ) ) ( not ( = ?auto_380204 ?auto_380216 ) ) ( not ( = ?auto_380204 ?auto_380217 ) ) ( not ( = ?auto_380204 ?auto_380218 ) ) ( not ( = ?auto_380205 ?auto_380206 ) ) ( not ( = ?auto_380205 ?auto_380207 ) ) ( not ( = ?auto_380205 ?auto_380208 ) ) ( not ( = ?auto_380205 ?auto_380209 ) ) ( not ( = ?auto_380205 ?auto_380210 ) ) ( not ( = ?auto_380205 ?auto_380211 ) ) ( not ( = ?auto_380205 ?auto_380212 ) ) ( not ( = ?auto_380205 ?auto_380213 ) ) ( not ( = ?auto_380205 ?auto_380214 ) ) ( not ( = ?auto_380205 ?auto_380215 ) ) ( not ( = ?auto_380205 ?auto_380216 ) ) ( not ( = ?auto_380205 ?auto_380217 ) ) ( not ( = ?auto_380205 ?auto_380218 ) ) ( not ( = ?auto_380206 ?auto_380207 ) ) ( not ( = ?auto_380206 ?auto_380208 ) ) ( not ( = ?auto_380206 ?auto_380209 ) ) ( not ( = ?auto_380206 ?auto_380210 ) ) ( not ( = ?auto_380206 ?auto_380211 ) ) ( not ( = ?auto_380206 ?auto_380212 ) ) ( not ( = ?auto_380206 ?auto_380213 ) ) ( not ( = ?auto_380206 ?auto_380214 ) ) ( not ( = ?auto_380206 ?auto_380215 ) ) ( not ( = ?auto_380206 ?auto_380216 ) ) ( not ( = ?auto_380206 ?auto_380217 ) ) ( not ( = ?auto_380206 ?auto_380218 ) ) ( not ( = ?auto_380207 ?auto_380208 ) ) ( not ( = ?auto_380207 ?auto_380209 ) ) ( not ( = ?auto_380207 ?auto_380210 ) ) ( not ( = ?auto_380207 ?auto_380211 ) ) ( not ( = ?auto_380207 ?auto_380212 ) ) ( not ( = ?auto_380207 ?auto_380213 ) ) ( not ( = ?auto_380207 ?auto_380214 ) ) ( not ( = ?auto_380207 ?auto_380215 ) ) ( not ( = ?auto_380207 ?auto_380216 ) ) ( not ( = ?auto_380207 ?auto_380217 ) ) ( not ( = ?auto_380207 ?auto_380218 ) ) ( not ( = ?auto_380208 ?auto_380209 ) ) ( not ( = ?auto_380208 ?auto_380210 ) ) ( not ( = ?auto_380208 ?auto_380211 ) ) ( not ( = ?auto_380208 ?auto_380212 ) ) ( not ( = ?auto_380208 ?auto_380213 ) ) ( not ( = ?auto_380208 ?auto_380214 ) ) ( not ( = ?auto_380208 ?auto_380215 ) ) ( not ( = ?auto_380208 ?auto_380216 ) ) ( not ( = ?auto_380208 ?auto_380217 ) ) ( not ( = ?auto_380208 ?auto_380218 ) ) ( not ( = ?auto_380209 ?auto_380210 ) ) ( not ( = ?auto_380209 ?auto_380211 ) ) ( not ( = ?auto_380209 ?auto_380212 ) ) ( not ( = ?auto_380209 ?auto_380213 ) ) ( not ( = ?auto_380209 ?auto_380214 ) ) ( not ( = ?auto_380209 ?auto_380215 ) ) ( not ( = ?auto_380209 ?auto_380216 ) ) ( not ( = ?auto_380209 ?auto_380217 ) ) ( not ( = ?auto_380209 ?auto_380218 ) ) ( not ( = ?auto_380210 ?auto_380211 ) ) ( not ( = ?auto_380210 ?auto_380212 ) ) ( not ( = ?auto_380210 ?auto_380213 ) ) ( not ( = ?auto_380210 ?auto_380214 ) ) ( not ( = ?auto_380210 ?auto_380215 ) ) ( not ( = ?auto_380210 ?auto_380216 ) ) ( not ( = ?auto_380210 ?auto_380217 ) ) ( not ( = ?auto_380210 ?auto_380218 ) ) ( not ( = ?auto_380211 ?auto_380212 ) ) ( not ( = ?auto_380211 ?auto_380213 ) ) ( not ( = ?auto_380211 ?auto_380214 ) ) ( not ( = ?auto_380211 ?auto_380215 ) ) ( not ( = ?auto_380211 ?auto_380216 ) ) ( not ( = ?auto_380211 ?auto_380217 ) ) ( not ( = ?auto_380211 ?auto_380218 ) ) ( not ( = ?auto_380212 ?auto_380213 ) ) ( not ( = ?auto_380212 ?auto_380214 ) ) ( not ( = ?auto_380212 ?auto_380215 ) ) ( not ( = ?auto_380212 ?auto_380216 ) ) ( not ( = ?auto_380212 ?auto_380217 ) ) ( not ( = ?auto_380212 ?auto_380218 ) ) ( not ( = ?auto_380213 ?auto_380214 ) ) ( not ( = ?auto_380213 ?auto_380215 ) ) ( not ( = ?auto_380213 ?auto_380216 ) ) ( not ( = ?auto_380213 ?auto_380217 ) ) ( not ( = ?auto_380213 ?auto_380218 ) ) ( not ( = ?auto_380214 ?auto_380215 ) ) ( not ( = ?auto_380214 ?auto_380216 ) ) ( not ( = ?auto_380214 ?auto_380217 ) ) ( not ( = ?auto_380214 ?auto_380218 ) ) ( not ( = ?auto_380215 ?auto_380216 ) ) ( not ( = ?auto_380215 ?auto_380217 ) ) ( not ( = ?auto_380215 ?auto_380218 ) ) ( not ( = ?auto_380216 ?auto_380217 ) ) ( not ( = ?auto_380216 ?auto_380218 ) ) ( not ( = ?auto_380217 ?auto_380218 ) ) ( ON ?auto_380216 ?auto_380217 ) ( ON ?auto_380215 ?auto_380216 ) ( ON ?auto_380214 ?auto_380215 ) ( ON ?auto_380213 ?auto_380214 ) ( ON ?auto_380212 ?auto_380213 ) ( ON ?auto_380211 ?auto_380212 ) ( ON ?auto_380210 ?auto_380211 ) ( CLEAR ?auto_380208 ) ( ON ?auto_380209 ?auto_380210 ) ( CLEAR ?auto_380209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_380204 ?auto_380205 ?auto_380206 ?auto_380207 ?auto_380208 ?auto_380209 )
      ( MAKE-14PILE ?auto_380204 ?auto_380205 ?auto_380206 ?auto_380207 ?auto_380208 ?auto_380209 ?auto_380210 ?auto_380211 ?auto_380212 ?auto_380213 ?auto_380214 ?auto_380215 ?auto_380216 ?auto_380217 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380233 - BLOCK
      ?auto_380234 - BLOCK
      ?auto_380235 - BLOCK
      ?auto_380236 - BLOCK
      ?auto_380237 - BLOCK
      ?auto_380238 - BLOCK
      ?auto_380239 - BLOCK
      ?auto_380240 - BLOCK
      ?auto_380241 - BLOCK
      ?auto_380242 - BLOCK
      ?auto_380243 - BLOCK
      ?auto_380244 - BLOCK
      ?auto_380245 - BLOCK
      ?auto_380246 - BLOCK
    )
    :vars
    (
      ?auto_380247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380246 ?auto_380247 ) ( ON-TABLE ?auto_380233 ) ( ON ?auto_380234 ?auto_380233 ) ( ON ?auto_380235 ?auto_380234 ) ( ON ?auto_380236 ?auto_380235 ) ( ON ?auto_380237 ?auto_380236 ) ( not ( = ?auto_380233 ?auto_380234 ) ) ( not ( = ?auto_380233 ?auto_380235 ) ) ( not ( = ?auto_380233 ?auto_380236 ) ) ( not ( = ?auto_380233 ?auto_380237 ) ) ( not ( = ?auto_380233 ?auto_380238 ) ) ( not ( = ?auto_380233 ?auto_380239 ) ) ( not ( = ?auto_380233 ?auto_380240 ) ) ( not ( = ?auto_380233 ?auto_380241 ) ) ( not ( = ?auto_380233 ?auto_380242 ) ) ( not ( = ?auto_380233 ?auto_380243 ) ) ( not ( = ?auto_380233 ?auto_380244 ) ) ( not ( = ?auto_380233 ?auto_380245 ) ) ( not ( = ?auto_380233 ?auto_380246 ) ) ( not ( = ?auto_380233 ?auto_380247 ) ) ( not ( = ?auto_380234 ?auto_380235 ) ) ( not ( = ?auto_380234 ?auto_380236 ) ) ( not ( = ?auto_380234 ?auto_380237 ) ) ( not ( = ?auto_380234 ?auto_380238 ) ) ( not ( = ?auto_380234 ?auto_380239 ) ) ( not ( = ?auto_380234 ?auto_380240 ) ) ( not ( = ?auto_380234 ?auto_380241 ) ) ( not ( = ?auto_380234 ?auto_380242 ) ) ( not ( = ?auto_380234 ?auto_380243 ) ) ( not ( = ?auto_380234 ?auto_380244 ) ) ( not ( = ?auto_380234 ?auto_380245 ) ) ( not ( = ?auto_380234 ?auto_380246 ) ) ( not ( = ?auto_380234 ?auto_380247 ) ) ( not ( = ?auto_380235 ?auto_380236 ) ) ( not ( = ?auto_380235 ?auto_380237 ) ) ( not ( = ?auto_380235 ?auto_380238 ) ) ( not ( = ?auto_380235 ?auto_380239 ) ) ( not ( = ?auto_380235 ?auto_380240 ) ) ( not ( = ?auto_380235 ?auto_380241 ) ) ( not ( = ?auto_380235 ?auto_380242 ) ) ( not ( = ?auto_380235 ?auto_380243 ) ) ( not ( = ?auto_380235 ?auto_380244 ) ) ( not ( = ?auto_380235 ?auto_380245 ) ) ( not ( = ?auto_380235 ?auto_380246 ) ) ( not ( = ?auto_380235 ?auto_380247 ) ) ( not ( = ?auto_380236 ?auto_380237 ) ) ( not ( = ?auto_380236 ?auto_380238 ) ) ( not ( = ?auto_380236 ?auto_380239 ) ) ( not ( = ?auto_380236 ?auto_380240 ) ) ( not ( = ?auto_380236 ?auto_380241 ) ) ( not ( = ?auto_380236 ?auto_380242 ) ) ( not ( = ?auto_380236 ?auto_380243 ) ) ( not ( = ?auto_380236 ?auto_380244 ) ) ( not ( = ?auto_380236 ?auto_380245 ) ) ( not ( = ?auto_380236 ?auto_380246 ) ) ( not ( = ?auto_380236 ?auto_380247 ) ) ( not ( = ?auto_380237 ?auto_380238 ) ) ( not ( = ?auto_380237 ?auto_380239 ) ) ( not ( = ?auto_380237 ?auto_380240 ) ) ( not ( = ?auto_380237 ?auto_380241 ) ) ( not ( = ?auto_380237 ?auto_380242 ) ) ( not ( = ?auto_380237 ?auto_380243 ) ) ( not ( = ?auto_380237 ?auto_380244 ) ) ( not ( = ?auto_380237 ?auto_380245 ) ) ( not ( = ?auto_380237 ?auto_380246 ) ) ( not ( = ?auto_380237 ?auto_380247 ) ) ( not ( = ?auto_380238 ?auto_380239 ) ) ( not ( = ?auto_380238 ?auto_380240 ) ) ( not ( = ?auto_380238 ?auto_380241 ) ) ( not ( = ?auto_380238 ?auto_380242 ) ) ( not ( = ?auto_380238 ?auto_380243 ) ) ( not ( = ?auto_380238 ?auto_380244 ) ) ( not ( = ?auto_380238 ?auto_380245 ) ) ( not ( = ?auto_380238 ?auto_380246 ) ) ( not ( = ?auto_380238 ?auto_380247 ) ) ( not ( = ?auto_380239 ?auto_380240 ) ) ( not ( = ?auto_380239 ?auto_380241 ) ) ( not ( = ?auto_380239 ?auto_380242 ) ) ( not ( = ?auto_380239 ?auto_380243 ) ) ( not ( = ?auto_380239 ?auto_380244 ) ) ( not ( = ?auto_380239 ?auto_380245 ) ) ( not ( = ?auto_380239 ?auto_380246 ) ) ( not ( = ?auto_380239 ?auto_380247 ) ) ( not ( = ?auto_380240 ?auto_380241 ) ) ( not ( = ?auto_380240 ?auto_380242 ) ) ( not ( = ?auto_380240 ?auto_380243 ) ) ( not ( = ?auto_380240 ?auto_380244 ) ) ( not ( = ?auto_380240 ?auto_380245 ) ) ( not ( = ?auto_380240 ?auto_380246 ) ) ( not ( = ?auto_380240 ?auto_380247 ) ) ( not ( = ?auto_380241 ?auto_380242 ) ) ( not ( = ?auto_380241 ?auto_380243 ) ) ( not ( = ?auto_380241 ?auto_380244 ) ) ( not ( = ?auto_380241 ?auto_380245 ) ) ( not ( = ?auto_380241 ?auto_380246 ) ) ( not ( = ?auto_380241 ?auto_380247 ) ) ( not ( = ?auto_380242 ?auto_380243 ) ) ( not ( = ?auto_380242 ?auto_380244 ) ) ( not ( = ?auto_380242 ?auto_380245 ) ) ( not ( = ?auto_380242 ?auto_380246 ) ) ( not ( = ?auto_380242 ?auto_380247 ) ) ( not ( = ?auto_380243 ?auto_380244 ) ) ( not ( = ?auto_380243 ?auto_380245 ) ) ( not ( = ?auto_380243 ?auto_380246 ) ) ( not ( = ?auto_380243 ?auto_380247 ) ) ( not ( = ?auto_380244 ?auto_380245 ) ) ( not ( = ?auto_380244 ?auto_380246 ) ) ( not ( = ?auto_380244 ?auto_380247 ) ) ( not ( = ?auto_380245 ?auto_380246 ) ) ( not ( = ?auto_380245 ?auto_380247 ) ) ( not ( = ?auto_380246 ?auto_380247 ) ) ( ON ?auto_380245 ?auto_380246 ) ( ON ?auto_380244 ?auto_380245 ) ( ON ?auto_380243 ?auto_380244 ) ( ON ?auto_380242 ?auto_380243 ) ( ON ?auto_380241 ?auto_380242 ) ( ON ?auto_380240 ?auto_380241 ) ( ON ?auto_380239 ?auto_380240 ) ( CLEAR ?auto_380237 ) ( ON ?auto_380238 ?auto_380239 ) ( CLEAR ?auto_380238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_380233 ?auto_380234 ?auto_380235 ?auto_380236 ?auto_380237 ?auto_380238 )
      ( MAKE-14PILE ?auto_380233 ?auto_380234 ?auto_380235 ?auto_380236 ?auto_380237 ?auto_380238 ?auto_380239 ?auto_380240 ?auto_380241 ?auto_380242 ?auto_380243 ?auto_380244 ?auto_380245 ?auto_380246 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380262 - BLOCK
      ?auto_380263 - BLOCK
      ?auto_380264 - BLOCK
      ?auto_380265 - BLOCK
      ?auto_380266 - BLOCK
      ?auto_380267 - BLOCK
      ?auto_380268 - BLOCK
      ?auto_380269 - BLOCK
      ?auto_380270 - BLOCK
      ?auto_380271 - BLOCK
      ?auto_380272 - BLOCK
      ?auto_380273 - BLOCK
      ?auto_380274 - BLOCK
      ?auto_380275 - BLOCK
    )
    :vars
    (
      ?auto_380276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380275 ?auto_380276 ) ( ON-TABLE ?auto_380262 ) ( ON ?auto_380263 ?auto_380262 ) ( ON ?auto_380264 ?auto_380263 ) ( ON ?auto_380265 ?auto_380264 ) ( not ( = ?auto_380262 ?auto_380263 ) ) ( not ( = ?auto_380262 ?auto_380264 ) ) ( not ( = ?auto_380262 ?auto_380265 ) ) ( not ( = ?auto_380262 ?auto_380266 ) ) ( not ( = ?auto_380262 ?auto_380267 ) ) ( not ( = ?auto_380262 ?auto_380268 ) ) ( not ( = ?auto_380262 ?auto_380269 ) ) ( not ( = ?auto_380262 ?auto_380270 ) ) ( not ( = ?auto_380262 ?auto_380271 ) ) ( not ( = ?auto_380262 ?auto_380272 ) ) ( not ( = ?auto_380262 ?auto_380273 ) ) ( not ( = ?auto_380262 ?auto_380274 ) ) ( not ( = ?auto_380262 ?auto_380275 ) ) ( not ( = ?auto_380262 ?auto_380276 ) ) ( not ( = ?auto_380263 ?auto_380264 ) ) ( not ( = ?auto_380263 ?auto_380265 ) ) ( not ( = ?auto_380263 ?auto_380266 ) ) ( not ( = ?auto_380263 ?auto_380267 ) ) ( not ( = ?auto_380263 ?auto_380268 ) ) ( not ( = ?auto_380263 ?auto_380269 ) ) ( not ( = ?auto_380263 ?auto_380270 ) ) ( not ( = ?auto_380263 ?auto_380271 ) ) ( not ( = ?auto_380263 ?auto_380272 ) ) ( not ( = ?auto_380263 ?auto_380273 ) ) ( not ( = ?auto_380263 ?auto_380274 ) ) ( not ( = ?auto_380263 ?auto_380275 ) ) ( not ( = ?auto_380263 ?auto_380276 ) ) ( not ( = ?auto_380264 ?auto_380265 ) ) ( not ( = ?auto_380264 ?auto_380266 ) ) ( not ( = ?auto_380264 ?auto_380267 ) ) ( not ( = ?auto_380264 ?auto_380268 ) ) ( not ( = ?auto_380264 ?auto_380269 ) ) ( not ( = ?auto_380264 ?auto_380270 ) ) ( not ( = ?auto_380264 ?auto_380271 ) ) ( not ( = ?auto_380264 ?auto_380272 ) ) ( not ( = ?auto_380264 ?auto_380273 ) ) ( not ( = ?auto_380264 ?auto_380274 ) ) ( not ( = ?auto_380264 ?auto_380275 ) ) ( not ( = ?auto_380264 ?auto_380276 ) ) ( not ( = ?auto_380265 ?auto_380266 ) ) ( not ( = ?auto_380265 ?auto_380267 ) ) ( not ( = ?auto_380265 ?auto_380268 ) ) ( not ( = ?auto_380265 ?auto_380269 ) ) ( not ( = ?auto_380265 ?auto_380270 ) ) ( not ( = ?auto_380265 ?auto_380271 ) ) ( not ( = ?auto_380265 ?auto_380272 ) ) ( not ( = ?auto_380265 ?auto_380273 ) ) ( not ( = ?auto_380265 ?auto_380274 ) ) ( not ( = ?auto_380265 ?auto_380275 ) ) ( not ( = ?auto_380265 ?auto_380276 ) ) ( not ( = ?auto_380266 ?auto_380267 ) ) ( not ( = ?auto_380266 ?auto_380268 ) ) ( not ( = ?auto_380266 ?auto_380269 ) ) ( not ( = ?auto_380266 ?auto_380270 ) ) ( not ( = ?auto_380266 ?auto_380271 ) ) ( not ( = ?auto_380266 ?auto_380272 ) ) ( not ( = ?auto_380266 ?auto_380273 ) ) ( not ( = ?auto_380266 ?auto_380274 ) ) ( not ( = ?auto_380266 ?auto_380275 ) ) ( not ( = ?auto_380266 ?auto_380276 ) ) ( not ( = ?auto_380267 ?auto_380268 ) ) ( not ( = ?auto_380267 ?auto_380269 ) ) ( not ( = ?auto_380267 ?auto_380270 ) ) ( not ( = ?auto_380267 ?auto_380271 ) ) ( not ( = ?auto_380267 ?auto_380272 ) ) ( not ( = ?auto_380267 ?auto_380273 ) ) ( not ( = ?auto_380267 ?auto_380274 ) ) ( not ( = ?auto_380267 ?auto_380275 ) ) ( not ( = ?auto_380267 ?auto_380276 ) ) ( not ( = ?auto_380268 ?auto_380269 ) ) ( not ( = ?auto_380268 ?auto_380270 ) ) ( not ( = ?auto_380268 ?auto_380271 ) ) ( not ( = ?auto_380268 ?auto_380272 ) ) ( not ( = ?auto_380268 ?auto_380273 ) ) ( not ( = ?auto_380268 ?auto_380274 ) ) ( not ( = ?auto_380268 ?auto_380275 ) ) ( not ( = ?auto_380268 ?auto_380276 ) ) ( not ( = ?auto_380269 ?auto_380270 ) ) ( not ( = ?auto_380269 ?auto_380271 ) ) ( not ( = ?auto_380269 ?auto_380272 ) ) ( not ( = ?auto_380269 ?auto_380273 ) ) ( not ( = ?auto_380269 ?auto_380274 ) ) ( not ( = ?auto_380269 ?auto_380275 ) ) ( not ( = ?auto_380269 ?auto_380276 ) ) ( not ( = ?auto_380270 ?auto_380271 ) ) ( not ( = ?auto_380270 ?auto_380272 ) ) ( not ( = ?auto_380270 ?auto_380273 ) ) ( not ( = ?auto_380270 ?auto_380274 ) ) ( not ( = ?auto_380270 ?auto_380275 ) ) ( not ( = ?auto_380270 ?auto_380276 ) ) ( not ( = ?auto_380271 ?auto_380272 ) ) ( not ( = ?auto_380271 ?auto_380273 ) ) ( not ( = ?auto_380271 ?auto_380274 ) ) ( not ( = ?auto_380271 ?auto_380275 ) ) ( not ( = ?auto_380271 ?auto_380276 ) ) ( not ( = ?auto_380272 ?auto_380273 ) ) ( not ( = ?auto_380272 ?auto_380274 ) ) ( not ( = ?auto_380272 ?auto_380275 ) ) ( not ( = ?auto_380272 ?auto_380276 ) ) ( not ( = ?auto_380273 ?auto_380274 ) ) ( not ( = ?auto_380273 ?auto_380275 ) ) ( not ( = ?auto_380273 ?auto_380276 ) ) ( not ( = ?auto_380274 ?auto_380275 ) ) ( not ( = ?auto_380274 ?auto_380276 ) ) ( not ( = ?auto_380275 ?auto_380276 ) ) ( ON ?auto_380274 ?auto_380275 ) ( ON ?auto_380273 ?auto_380274 ) ( ON ?auto_380272 ?auto_380273 ) ( ON ?auto_380271 ?auto_380272 ) ( ON ?auto_380270 ?auto_380271 ) ( ON ?auto_380269 ?auto_380270 ) ( ON ?auto_380268 ?auto_380269 ) ( ON ?auto_380267 ?auto_380268 ) ( CLEAR ?auto_380265 ) ( ON ?auto_380266 ?auto_380267 ) ( CLEAR ?auto_380266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_380262 ?auto_380263 ?auto_380264 ?auto_380265 ?auto_380266 )
      ( MAKE-14PILE ?auto_380262 ?auto_380263 ?auto_380264 ?auto_380265 ?auto_380266 ?auto_380267 ?auto_380268 ?auto_380269 ?auto_380270 ?auto_380271 ?auto_380272 ?auto_380273 ?auto_380274 ?auto_380275 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380291 - BLOCK
      ?auto_380292 - BLOCK
      ?auto_380293 - BLOCK
      ?auto_380294 - BLOCK
      ?auto_380295 - BLOCK
      ?auto_380296 - BLOCK
      ?auto_380297 - BLOCK
      ?auto_380298 - BLOCK
      ?auto_380299 - BLOCK
      ?auto_380300 - BLOCK
      ?auto_380301 - BLOCK
      ?auto_380302 - BLOCK
      ?auto_380303 - BLOCK
      ?auto_380304 - BLOCK
    )
    :vars
    (
      ?auto_380305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380304 ?auto_380305 ) ( ON-TABLE ?auto_380291 ) ( ON ?auto_380292 ?auto_380291 ) ( ON ?auto_380293 ?auto_380292 ) ( ON ?auto_380294 ?auto_380293 ) ( not ( = ?auto_380291 ?auto_380292 ) ) ( not ( = ?auto_380291 ?auto_380293 ) ) ( not ( = ?auto_380291 ?auto_380294 ) ) ( not ( = ?auto_380291 ?auto_380295 ) ) ( not ( = ?auto_380291 ?auto_380296 ) ) ( not ( = ?auto_380291 ?auto_380297 ) ) ( not ( = ?auto_380291 ?auto_380298 ) ) ( not ( = ?auto_380291 ?auto_380299 ) ) ( not ( = ?auto_380291 ?auto_380300 ) ) ( not ( = ?auto_380291 ?auto_380301 ) ) ( not ( = ?auto_380291 ?auto_380302 ) ) ( not ( = ?auto_380291 ?auto_380303 ) ) ( not ( = ?auto_380291 ?auto_380304 ) ) ( not ( = ?auto_380291 ?auto_380305 ) ) ( not ( = ?auto_380292 ?auto_380293 ) ) ( not ( = ?auto_380292 ?auto_380294 ) ) ( not ( = ?auto_380292 ?auto_380295 ) ) ( not ( = ?auto_380292 ?auto_380296 ) ) ( not ( = ?auto_380292 ?auto_380297 ) ) ( not ( = ?auto_380292 ?auto_380298 ) ) ( not ( = ?auto_380292 ?auto_380299 ) ) ( not ( = ?auto_380292 ?auto_380300 ) ) ( not ( = ?auto_380292 ?auto_380301 ) ) ( not ( = ?auto_380292 ?auto_380302 ) ) ( not ( = ?auto_380292 ?auto_380303 ) ) ( not ( = ?auto_380292 ?auto_380304 ) ) ( not ( = ?auto_380292 ?auto_380305 ) ) ( not ( = ?auto_380293 ?auto_380294 ) ) ( not ( = ?auto_380293 ?auto_380295 ) ) ( not ( = ?auto_380293 ?auto_380296 ) ) ( not ( = ?auto_380293 ?auto_380297 ) ) ( not ( = ?auto_380293 ?auto_380298 ) ) ( not ( = ?auto_380293 ?auto_380299 ) ) ( not ( = ?auto_380293 ?auto_380300 ) ) ( not ( = ?auto_380293 ?auto_380301 ) ) ( not ( = ?auto_380293 ?auto_380302 ) ) ( not ( = ?auto_380293 ?auto_380303 ) ) ( not ( = ?auto_380293 ?auto_380304 ) ) ( not ( = ?auto_380293 ?auto_380305 ) ) ( not ( = ?auto_380294 ?auto_380295 ) ) ( not ( = ?auto_380294 ?auto_380296 ) ) ( not ( = ?auto_380294 ?auto_380297 ) ) ( not ( = ?auto_380294 ?auto_380298 ) ) ( not ( = ?auto_380294 ?auto_380299 ) ) ( not ( = ?auto_380294 ?auto_380300 ) ) ( not ( = ?auto_380294 ?auto_380301 ) ) ( not ( = ?auto_380294 ?auto_380302 ) ) ( not ( = ?auto_380294 ?auto_380303 ) ) ( not ( = ?auto_380294 ?auto_380304 ) ) ( not ( = ?auto_380294 ?auto_380305 ) ) ( not ( = ?auto_380295 ?auto_380296 ) ) ( not ( = ?auto_380295 ?auto_380297 ) ) ( not ( = ?auto_380295 ?auto_380298 ) ) ( not ( = ?auto_380295 ?auto_380299 ) ) ( not ( = ?auto_380295 ?auto_380300 ) ) ( not ( = ?auto_380295 ?auto_380301 ) ) ( not ( = ?auto_380295 ?auto_380302 ) ) ( not ( = ?auto_380295 ?auto_380303 ) ) ( not ( = ?auto_380295 ?auto_380304 ) ) ( not ( = ?auto_380295 ?auto_380305 ) ) ( not ( = ?auto_380296 ?auto_380297 ) ) ( not ( = ?auto_380296 ?auto_380298 ) ) ( not ( = ?auto_380296 ?auto_380299 ) ) ( not ( = ?auto_380296 ?auto_380300 ) ) ( not ( = ?auto_380296 ?auto_380301 ) ) ( not ( = ?auto_380296 ?auto_380302 ) ) ( not ( = ?auto_380296 ?auto_380303 ) ) ( not ( = ?auto_380296 ?auto_380304 ) ) ( not ( = ?auto_380296 ?auto_380305 ) ) ( not ( = ?auto_380297 ?auto_380298 ) ) ( not ( = ?auto_380297 ?auto_380299 ) ) ( not ( = ?auto_380297 ?auto_380300 ) ) ( not ( = ?auto_380297 ?auto_380301 ) ) ( not ( = ?auto_380297 ?auto_380302 ) ) ( not ( = ?auto_380297 ?auto_380303 ) ) ( not ( = ?auto_380297 ?auto_380304 ) ) ( not ( = ?auto_380297 ?auto_380305 ) ) ( not ( = ?auto_380298 ?auto_380299 ) ) ( not ( = ?auto_380298 ?auto_380300 ) ) ( not ( = ?auto_380298 ?auto_380301 ) ) ( not ( = ?auto_380298 ?auto_380302 ) ) ( not ( = ?auto_380298 ?auto_380303 ) ) ( not ( = ?auto_380298 ?auto_380304 ) ) ( not ( = ?auto_380298 ?auto_380305 ) ) ( not ( = ?auto_380299 ?auto_380300 ) ) ( not ( = ?auto_380299 ?auto_380301 ) ) ( not ( = ?auto_380299 ?auto_380302 ) ) ( not ( = ?auto_380299 ?auto_380303 ) ) ( not ( = ?auto_380299 ?auto_380304 ) ) ( not ( = ?auto_380299 ?auto_380305 ) ) ( not ( = ?auto_380300 ?auto_380301 ) ) ( not ( = ?auto_380300 ?auto_380302 ) ) ( not ( = ?auto_380300 ?auto_380303 ) ) ( not ( = ?auto_380300 ?auto_380304 ) ) ( not ( = ?auto_380300 ?auto_380305 ) ) ( not ( = ?auto_380301 ?auto_380302 ) ) ( not ( = ?auto_380301 ?auto_380303 ) ) ( not ( = ?auto_380301 ?auto_380304 ) ) ( not ( = ?auto_380301 ?auto_380305 ) ) ( not ( = ?auto_380302 ?auto_380303 ) ) ( not ( = ?auto_380302 ?auto_380304 ) ) ( not ( = ?auto_380302 ?auto_380305 ) ) ( not ( = ?auto_380303 ?auto_380304 ) ) ( not ( = ?auto_380303 ?auto_380305 ) ) ( not ( = ?auto_380304 ?auto_380305 ) ) ( ON ?auto_380303 ?auto_380304 ) ( ON ?auto_380302 ?auto_380303 ) ( ON ?auto_380301 ?auto_380302 ) ( ON ?auto_380300 ?auto_380301 ) ( ON ?auto_380299 ?auto_380300 ) ( ON ?auto_380298 ?auto_380299 ) ( ON ?auto_380297 ?auto_380298 ) ( ON ?auto_380296 ?auto_380297 ) ( CLEAR ?auto_380294 ) ( ON ?auto_380295 ?auto_380296 ) ( CLEAR ?auto_380295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_380291 ?auto_380292 ?auto_380293 ?auto_380294 ?auto_380295 )
      ( MAKE-14PILE ?auto_380291 ?auto_380292 ?auto_380293 ?auto_380294 ?auto_380295 ?auto_380296 ?auto_380297 ?auto_380298 ?auto_380299 ?auto_380300 ?auto_380301 ?auto_380302 ?auto_380303 ?auto_380304 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380320 - BLOCK
      ?auto_380321 - BLOCK
      ?auto_380322 - BLOCK
      ?auto_380323 - BLOCK
      ?auto_380324 - BLOCK
      ?auto_380325 - BLOCK
      ?auto_380326 - BLOCK
      ?auto_380327 - BLOCK
      ?auto_380328 - BLOCK
      ?auto_380329 - BLOCK
      ?auto_380330 - BLOCK
      ?auto_380331 - BLOCK
      ?auto_380332 - BLOCK
      ?auto_380333 - BLOCK
    )
    :vars
    (
      ?auto_380334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380333 ?auto_380334 ) ( ON-TABLE ?auto_380320 ) ( ON ?auto_380321 ?auto_380320 ) ( ON ?auto_380322 ?auto_380321 ) ( not ( = ?auto_380320 ?auto_380321 ) ) ( not ( = ?auto_380320 ?auto_380322 ) ) ( not ( = ?auto_380320 ?auto_380323 ) ) ( not ( = ?auto_380320 ?auto_380324 ) ) ( not ( = ?auto_380320 ?auto_380325 ) ) ( not ( = ?auto_380320 ?auto_380326 ) ) ( not ( = ?auto_380320 ?auto_380327 ) ) ( not ( = ?auto_380320 ?auto_380328 ) ) ( not ( = ?auto_380320 ?auto_380329 ) ) ( not ( = ?auto_380320 ?auto_380330 ) ) ( not ( = ?auto_380320 ?auto_380331 ) ) ( not ( = ?auto_380320 ?auto_380332 ) ) ( not ( = ?auto_380320 ?auto_380333 ) ) ( not ( = ?auto_380320 ?auto_380334 ) ) ( not ( = ?auto_380321 ?auto_380322 ) ) ( not ( = ?auto_380321 ?auto_380323 ) ) ( not ( = ?auto_380321 ?auto_380324 ) ) ( not ( = ?auto_380321 ?auto_380325 ) ) ( not ( = ?auto_380321 ?auto_380326 ) ) ( not ( = ?auto_380321 ?auto_380327 ) ) ( not ( = ?auto_380321 ?auto_380328 ) ) ( not ( = ?auto_380321 ?auto_380329 ) ) ( not ( = ?auto_380321 ?auto_380330 ) ) ( not ( = ?auto_380321 ?auto_380331 ) ) ( not ( = ?auto_380321 ?auto_380332 ) ) ( not ( = ?auto_380321 ?auto_380333 ) ) ( not ( = ?auto_380321 ?auto_380334 ) ) ( not ( = ?auto_380322 ?auto_380323 ) ) ( not ( = ?auto_380322 ?auto_380324 ) ) ( not ( = ?auto_380322 ?auto_380325 ) ) ( not ( = ?auto_380322 ?auto_380326 ) ) ( not ( = ?auto_380322 ?auto_380327 ) ) ( not ( = ?auto_380322 ?auto_380328 ) ) ( not ( = ?auto_380322 ?auto_380329 ) ) ( not ( = ?auto_380322 ?auto_380330 ) ) ( not ( = ?auto_380322 ?auto_380331 ) ) ( not ( = ?auto_380322 ?auto_380332 ) ) ( not ( = ?auto_380322 ?auto_380333 ) ) ( not ( = ?auto_380322 ?auto_380334 ) ) ( not ( = ?auto_380323 ?auto_380324 ) ) ( not ( = ?auto_380323 ?auto_380325 ) ) ( not ( = ?auto_380323 ?auto_380326 ) ) ( not ( = ?auto_380323 ?auto_380327 ) ) ( not ( = ?auto_380323 ?auto_380328 ) ) ( not ( = ?auto_380323 ?auto_380329 ) ) ( not ( = ?auto_380323 ?auto_380330 ) ) ( not ( = ?auto_380323 ?auto_380331 ) ) ( not ( = ?auto_380323 ?auto_380332 ) ) ( not ( = ?auto_380323 ?auto_380333 ) ) ( not ( = ?auto_380323 ?auto_380334 ) ) ( not ( = ?auto_380324 ?auto_380325 ) ) ( not ( = ?auto_380324 ?auto_380326 ) ) ( not ( = ?auto_380324 ?auto_380327 ) ) ( not ( = ?auto_380324 ?auto_380328 ) ) ( not ( = ?auto_380324 ?auto_380329 ) ) ( not ( = ?auto_380324 ?auto_380330 ) ) ( not ( = ?auto_380324 ?auto_380331 ) ) ( not ( = ?auto_380324 ?auto_380332 ) ) ( not ( = ?auto_380324 ?auto_380333 ) ) ( not ( = ?auto_380324 ?auto_380334 ) ) ( not ( = ?auto_380325 ?auto_380326 ) ) ( not ( = ?auto_380325 ?auto_380327 ) ) ( not ( = ?auto_380325 ?auto_380328 ) ) ( not ( = ?auto_380325 ?auto_380329 ) ) ( not ( = ?auto_380325 ?auto_380330 ) ) ( not ( = ?auto_380325 ?auto_380331 ) ) ( not ( = ?auto_380325 ?auto_380332 ) ) ( not ( = ?auto_380325 ?auto_380333 ) ) ( not ( = ?auto_380325 ?auto_380334 ) ) ( not ( = ?auto_380326 ?auto_380327 ) ) ( not ( = ?auto_380326 ?auto_380328 ) ) ( not ( = ?auto_380326 ?auto_380329 ) ) ( not ( = ?auto_380326 ?auto_380330 ) ) ( not ( = ?auto_380326 ?auto_380331 ) ) ( not ( = ?auto_380326 ?auto_380332 ) ) ( not ( = ?auto_380326 ?auto_380333 ) ) ( not ( = ?auto_380326 ?auto_380334 ) ) ( not ( = ?auto_380327 ?auto_380328 ) ) ( not ( = ?auto_380327 ?auto_380329 ) ) ( not ( = ?auto_380327 ?auto_380330 ) ) ( not ( = ?auto_380327 ?auto_380331 ) ) ( not ( = ?auto_380327 ?auto_380332 ) ) ( not ( = ?auto_380327 ?auto_380333 ) ) ( not ( = ?auto_380327 ?auto_380334 ) ) ( not ( = ?auto_380328 ?auto_380329 ) ) ( not ( = ?auto_380328 ?auto_380330 ) ) ( not ( = ?auto_380328 ?auto_380331 ) ) ( not ( = ?auto_380328 ?auto_380332 ) ) ( not ( = ?auto_380328 ?auto_380333 ) ) ( not ( = ?auto_380328 ?auto_380334 ) ) ( not ( = ?auto_380329 ?auto_380330 ) ) ( not ( = ?auto_380329 ?auto_380331 ) ) ( not ( = ?auto_380329 ?auto_380332 ) ) ( not ( = ?auto_380329 ?auto_380333 ) ) ( not ( = ?auto_380329 ?auto_380334 ) ) ( not ( = ?auto_380330 ?auto_380331 ) ) ( not ( = ?auto_380330 ?auto_380332 ) ) ( not ( = ?auto_380330 ?auto_380333 ) ) ( not ( = ?auto_380330 ?auto_380334 ) ) ( not ( = ?auto_380331 ?auto_380332 ) ) ( not ( = ?auto_380331 ?auto_380333 ) ) ( not ( = ?auto_380331 ?auto_380334 ) ) ( not ( = ?auto_380332 ?auto_380333 ) ) ( not ( = ?auto_380332 ?auto_380334 ) ) ( not ( = ?auto_380333 ?auto_380334 ) ) ( ON ?auto_380332 ?auto_380333 ) ( ON ?auto_380331 ?auto_380332 ) ( ON ?auto_380330 ?auto_380331 ) ( ON ?auto_380329 ?auto_380330 ) ( ON ?auto_380328 ?auto_380329 ) ( ON ?auto_380327 ?auto_380328 ) ( ON ?auto_380326 ?auto_380327 ) ( ON ?auto_380325 ?auto_380326 ) ( ON ?auto_380324 ?auto_380325 ) ( CLEAR ?auto_380322 ) ( ON ?auto_380323 ?auto_380324 ) ( CLEAR ?auto_380323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_380320 ?auto_380321 ?auto_380322 ?auto_380323 )
      ( MAKE-14PILE ?auto_380320 ?auto_380321 ?auto_380322 ?auto_380323 ?auto_380324 ?auto_380325 ?auto_380326 ?auto_380327 ?auto_380328 ?auto_380329 ?auto_380330 ?auto_380331 ?auto_380332 ?auto_380333 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380349 - BLOCK
      ?auto_380350 - BLOCK
      ?auto_380351 - BLOCK
      ?auto_380352 - BLOCK
      ?auto_380353 - BLOCK
      ?auto_380354 - BLOCK
      ?auto_380355 - BLOCK
      ?auto_380356 - BLOCK
      ?auto_380357 - BLOCK
      ?auto_380358 - BLOCK
      ?auto_380359 - BLOCK
      ?auto_380360 - BLOCK
      ?auto_380361 - BLOCK
      ?auto_380362 - BLOCK
    )
    :vars
    (
      ?auto_380363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380362 ?auto_380363 ) ( ON-TABLE ?auto_380349 ) ( ON ?auto_380350 ?auto_380349 ) ( ON ?auto_380351 ?auto_380350 ) ( not ( = ?auto_380349 ?auto_380350 ) ) ( not ( = ?auto_380349 ?auto_380351 ) ) ( not ( = ?auto_380349 ?auto_380352 ) ) ( not ( = ?auto_380349 ?auto_380353 ) ) ( not ( = ?auto_380349 ?auto_380354 ) ) ( not ( = ?auto_380349 ?auto_380355 ) ) ( not ( = ?auto_380349 ?auto_380356 ) ) ( not ( = ?auto_380349 ?auto_380357 ) ) ( not ( = ?auto_380349 ?auto_380358 ) ) ( not ( = ?auto_380349 ?auto_380359 ) ) ( not ( = ?auto_380349 ?auto_380360 ) ) ( not ( = ?auto_380349 ?auto_380361 ) ) ( not ( = ?auto_380349 ?auto_380362 ) ) ( not ( = ?auto_380349 ?auto_380363 ) ) ( not ( = ?auto_380350 ?auto_380351 ) ) ( not ( = ?auto_380350 ?auto_380352 ) ) ( not ( = ?auto_380350 ?auto_380353 ) ) ( not ( = ?auto_380350 ?auto_380354 ) ) ( not ( = ?auto_380350 ?auto_380355 ) ) ( not ( = ?auto_380350 ?auto_380356 ) ) ( not ( = ?auto_380350 ?auto_380357 ) ) ( not ( = ?auto_380350 ?auto_380358 ) ) ( not ( = ?auto_380350 ?auto_380359 ) ) ( not ( = ?auto_380350 ?auto_380360 ) ) ( not ( = ?auto_380350 ?auto_380361 ) ) ( not ( = ?auto_380350 ?auto_380362 ) ) ( not ( = ?auto_380350 ?auto_380363 ) ) ( not ( = ?auto_380351 ?auto_380352 ) ) ( not ( = ?auto_380351 ?auto_380353 ) ) ( not ( = ?auto_380351 ?auto_380354 ) ) ( not ( = ?auto_380351 ?auto_380355 ) ) ( not ( = ?auto_380351 ?auto_380356 ) ) ( not ( = ?auto_380351 ?auto_380357 ) ) ( not ( = ?auto_380351 ?auto_380358 ) ) ( not ( = ?auto_380351 ?auto_380359 ) ) ( not ( = ?auto_380351 ?auto_380360 ) ) ( not ( = ?auto_380351 ?auto_380361 ) ) ( not ( = ?auto_380351 ?auto_380362 ) ) ( not ( = ?auto_380351 ?auto_380363 ) ) ( not ( = ?auto_380352 ?auto_380353 ) ) ( not ( = ?auto_380352 ?auto_380354 ) ) ( not ( = ?auto_380352 ?auto_380355 ) ) ( not ( = ?auto_380352 ?auto_380356 ) ) ( not ( = ?auto_380352 ?auto_380357 ) ) ( not ( = ?auto_380352 ?auto_380358 ) ) ( not ( = ?auto_380352 ?auto_380359 ) ) ( not ( = ?auto_380352 ?auto_380360 ) ) ( not ( = ?auto_380352 ?auto_380361 ) ) ( not ( = ?auto_380352 ?auto_380362 ) ) ( not ( = ?auto_380352 ?auto_380363 ) ) ( not ( = ?auto_380353 ?auto_380354 ) ) ( not ( = ?auto_380353 ?auto_380355 ) ) ( not ( = ?auto_380353 ?auto_380356 ) ) ( not ( = ?auto_380353 ?auto_380357 ) ) ( not ( = ?auto_380353 ?auto_380358 ) ) ( not ( = ?auto_380353 ?auto_380359 ) ) ( not ( = ?auto_380353 ?auto_380360 ) ) ( not ( = ?auto_380353 ?auto_380361 ) ) ( not ( = ?auto_380353 ?auto_380362 ) ) ( not ( = ?auto_380353 ?auto_380363 ) ) ( not ( = ?auto_380354 ?auto_380355 ) ) ( not ( = ?auto_380354 ?auto_380356 ) ) ( not ( = ?auto_380354 ?auto_380357 ) ) ( not ( = ?auto_380354 ?auto_380358 ) ) ( not ( = ?auto_380354 ?auto_380359 ) ) ( not ( = ?auto_380354 ?auto_380360 ) ) ( not ( = ?auto_380354 ?auto_380361 ) ) ( not ( = ?auto_380354 ?auto_380362 ) ) ( not ( = ?auto_380354 ?auto_380363 ) ) ( not ( = ?auto_380355 ?auto_380356 ) ) ( not ( = ?auto_380355 ?auto_380357 ) ) ( not ( = ?auto_380355 ?auto_380358 ) ) ( not ( = ?auto_380355 ?auto_380359 ) ) ( not ( = ?auto_380355 ?auto_380360 ) ) ( not ( = ?auto_380355 ?auto_380361 ) ) ( not ( = ?auto_380355 ?auto_380362 ) ) ( not ( = ?auto_380355 ?auto_380363 ) ) ( not ( = ?auto_380356 ?auto_380357 ) ) ( not ( = ?auto_380356 ?auto_380358 ) ) ( not ( = ?auto_380356 ?auto_380359 ) ) ( not ( = ?auto_380356 ?auto_380360 ) ) ( not ( = ?auto_380356 ?auto_380361 ) ) ( not ( = ?auto_380356 ?auto_380362 ) ) ( not ( = ?auto_380356 ?auto_380363 ) ) ( not ( = ?auto_380357 ?auto_380358 ) ) ( not ( = ?auto_380357 ?auto_380359 ) ) ( not ( = ?auto_380357 ?auto_380360 ) ) ( not ( = ?auto_380357 ?auto_380361 ) ) ( not ( = ?auto_380357 ?auto_380362 ) ) ( not ( = ?auto_380357 ?auto_380363 ) ) ( not ( = ?auto_380358 ?auto_380359 ) ) ( not ( = ?auto_380358 ?auto_380360 ) ) ( not ( = ?auto_380358 ?auto_380361 ) ) ( not ( = ?auto_380358 ?auto_380362 ) ) ( not ( = ?auto_380358 ?auto_380363 ) ) ( not ( = ?auto_380359 ?auto_380360 ) ) ( not ( = ?auto_380359 ?auto_380361 ) ) ( not ( = ?auto_380359 ?auto_380362 ) ) ( not ( = ?auto_380359 ?auto_380363 ) ) ( not ( = ?auto_380360 ?auto_380361 ) ) ( not ( = ?auto_380360 ?auto_380362 ) ) ( not ( = ?auto_380360 ?auto_380363 ) ) ( not ( = ?auto_380361 ?auto_380362 ) ) ( not ( = ?auto_380361 ?auto_380363 ) ) ( not ( = ?auto_380362 ?auto_380363 ) ) ( ON ?auto_380361 ?auto_380362 ) ( ON ?auto_380360 ?auto_380361 ) ( ON ?auto_380359 ?auto_380360 ) ( ON ?auto_380358 ?auto_380359 ) ( ON ?auto_380357 ?auto_380358 ) ( ON ?auto_380356 ?auto_380357 ) ( ON ?auto_380355 ?auto_380356 ) ( ON ?auto_380354 ?auto_380355 ) ( ON ?auto_380353 ?auto_380354 ) ( CLEAR ?auto_380351 ) ( ON ?auto_380352 ?auto_380353 ) ( CLEAR ?auto_380352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_380349 ?auto_380350 ?auto_380351 ?auto_380352 )
      ( MAKE-14PILE ?auto_380349 ?auto_380350 ?auto_380351 ?auto_380352 ?auto_380353 ?auto_380354 ?auto_380355 ?auto_380356 ?auto_380357 ?auto_380358 ?auto_380359 ?auto_380360 ?auto_380361 ?auto_380362 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380378 - BLOCK
      ?auto_380379 - BLOCK
      ?auto_380380 - BLOCK
      ?auto_380381 - BLOCK
      ?auto_380382 - BLOCK
      ?auto_380383 - BLOCK
      ?auto_380384 - BLOCK
      ?auto_380385 - BLOCK
      ?auto_380386 - BLOCK
      ?auto_380387 - BLOCK
      ?auto_380388 - BLOCK
      ?auto_380389 - BLOCK
      ?auto_380390 - BLOCK
      ?auto_380391 - BLOCK
    )
    :vars
    (
      ?auto_380392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380391 ?auto_380392 ) ( ON-TABLE ?auto_380378 ) ( ON ?auto_380379 ?auto_380378 ) ( not ( = ?auto_380378 ?auto_380379 ) ) ( not ( = ?auto_380378 ?auto_380380 ) ) ( not ( = ?auto_380378 ?auto_380381 ) ) ( not ( = ?auto_380378 ?auto_380382 ) ) ( not ( = ?auto_380378 ?auto_380383 ) ) ( not ( = ?auto_380378 ?auto_380384 ) ) ( not ( = ?auto_380378 ?auto_380385 ) ) ( not ( = ?auto_380378 ?auto_380386 ) ) ( not ( = ?auto_380378 ?auto_380387 ) ) ( not ( = ?auto_380378 ?auto_380388 ) ) ( not ( = ?auto_380378 ?auto_380389 ) ) ( not ( = ?auto_380378 ?auto_380390 ) ) ( not ( = ?auto_380378 ?auto_380391 ) ) ( not ( = ?auto_380378 ?auto_380392 ) ) ( not ( = ?auto_380379 ?auto_380380 ) ) ( not ( = ?auto_380379 ?auto_380381 ) ) ( not ( = ?auto_380379 ?auto_380382 ) ) ( not ( = ?auto_380379 ?auto_380383 ) ) ( not ( = ?auto_380379 ?auto_380384 ) ) ( not ( = ?auto_380379 ?auto_380385 ) ) ( not ( = ?auto_380379 ?auto_380386 ) ) ( not ( = ?auto_380379 ?auto_380387 ) ) ( not ( = ?auto_380379 ?auto_380388 ) ) ( not ( = ?auto_380379 ?auto_380389 ) ) ( not ( = ?auto_380379 ?auto_380390 ) ) ( not ( = ?auto_380379 ?auto_380391 ) ) ( not ( = ?auto_380379 ?auto_380392 ) ) ( not ( = ?auto_380380 ?auto_380381 ) ) ( not ( = ?auto_380380 ?auto_380382 ) ) ( not ( = ?auto_380380 ?auto_380383 ) ) ( not ( = ?auto_380380 ?auto_380384 ) ) ( not ( = ?auto_380380 ?auto_380385 ) ) ( not ( = ?auto_380380 ?auto_380386 ) ) ( not ( = ?auto_380380 ?auto_380387 ) ) ( not ( = ?auto_380380 ?auto_380388 ) ) ( not ( = ?auto_380380 ?auto_380389 ) ) ( not ( = ?auto_380380 ?auto_380390 ) ) ( not ( = ?auto_380380 ?auto_380391 ) ) ( not ( = ?auto_380380 ?auto_380392 ) ) ( not ( = ?auto_380381 ?auto_380382 ) ) ( not ( = ?auto_380381 ?auto_380383 ) ) ( not ( = ?auto_380381 ?auto_380384 ) ) ( not ( = ?auto_380381 ?auto_380385 ) ) ( not ( = ?auto_380381 ?auto_380386 ) ) ( not ( = ?auto_380381 ?auto_380387 ) ) ( not ( = ?auto_380381 ?auto_380388 ) ) ( not ( = ?auto_380381 ?auto_380389 ) ) ( not ( = ?auto_380381 ?auto_380390 ) ) ( not ( = ?auto_380381 ?auto_380391 ) ) ( not ( = ?auto_380381 ?auto_380392 ) ) ( not ( = ?auto_380382 ?auto_380383 ) ) ( not ( = ?auto_380382 ?auto_380384 ) ) ( not ( = ?auto_380382 ?auto_380385 ) ) ( not ( = ?auto_380382 ?auto_380386 ) ) ( not ( = ?auto_380382 ?auto_380387 ) ) ( not ( = ?auto_380382 ?auto_380388 ) ) ( not ( = ?auto_380382 ?auto_380389 ) ) ( not ( = ?auto_380382 ?auto_380390 ) ) ( not ( = ?auto_380382 ?auto_380391 ) ) ( not ( = ?auto_380382 ?auto_380392 ) ) ( not ( = ?auto_380383 ?auto_380384 ) ) ( not ( = ?auto_380383 ?auto_380385 ) ) ( not ( = ?auto_380383 ?auto_380386 ) ) ( not ( = ?auto_380383 ?auto_380387 ) ) ( not ( = ?auto_380383 ?auto_380388 ) ) ( not ( = ?auto_380383 ?auto_380389 ) ) ( not ( = ?auto_380383 ?auto_380390 ) ) ( not ( = ?auto_380383 ?auto_380391 ) ) ( not ( = ?auto_380383 ?auto_380392 ) ) ( not ( = ?auto_380384 ?auto_380385 ) ) ( not ( = ?auto_380384 ?auto_380386 ) ) ( not ( = ?auto_380384 ?auto_380387 ) ) ( not ( = ?auto_380384 ?auto_380388 ) ) ( not ( = ?auto_380384 ?auto_380389 ) ) ( not ( = ?auto_380384 ?auto_380390 ) ) ( not ( = ?auto_380384 ?auto_380391 ) ) ( not ( = ?auto_380384 ?auto_380392 ) ) ( not ( = ?auto_380385 ?auto_380386 ) ) ( not ( = ?auto_380385 ?auto_380387 ) ) ( not ( = ?auto_380385 ?auto_380388 ) ) ( not ( = ?auto_380385 ?auto_380389 ) ) ( not ( = ?auto_380385 ?auto_380390 ) ) ( not ( = ?auto_380385 ?auto_380391 ) ) ( not ( = ?auto_380385 ?auto_380392 ) ) ( not ( = ?auto_380386 ?auto_380387 ) ) ( not ( = ?auto_380386 ?auto_380388 ) ) ( not ( = ?auto_380386 ?auto_380389 ) ) ( not ( = ?auto_380386 ?auto_380390 ) ) ( not ( = ?auto_380386 ?auto_380391 ) ) ( not ( = ?auto_380386 ?auto_380392 ) ) ( not ( = ?auto_380387 ?auto_380388 ) ) ( not ( = ?auto_380387 ?auto_380389 ) ) ( not ( = ?auto_380387 ?auto_380390 ) ) ( not ( = ?auto_380387 ?auto_380391 ) ) ( not ( = ?auto_380387 ?auto_380392 ) ) ( not ( = ?auto_380388 ?auto_380389 ) ) ( not ( = ?auto_380388 ?auto_380390 ) ) ( not ( = ?auto_380388 ?auto_380391 ) ) ( not ( = ?auto_380388 ?auto_380392 ) ) ( not ( = ?auto_380389 ?auto_380390 ) ) ( not ( = ?auto_380389 ?auto_380391 ) ) ( not ( = ?auto_380389 ?auto_380392 ) ) ( not ( = ?auto_380390 ?auto_380391 ) ) ( not ( = ?auto_380390 ?auto_380392 ) ) ( not ( = ?auto_380391 ?auto_380392 ) ) ( ON ?auto_380390 ?auto_380391 ) ( ON ?auto_380389 ?auto_380390 ) ( ON ?auto_380388 ?auto_380389 ) ( ON ?auto_380387 ?auto_380388 ) ( ON ?auto_380386 ?auto_380387 ) ( ON ?auto_380385 ?auto_380386 ) ( ON ?auto_380384 ?auto_380385 ) ( ON ?auto_380383 ?auto_380384 ) ( ON ?auto_380382 ?auto_380383 ) ( ON ?auto_380381 ?auto_380382 ) ( CLEAR ?auto_380379 ) ( ON ?auto_380380 ?auto_380381 ) ( CLEAR ?auto_380380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_380378 ?auto_380379 ?auto_380380 )
      ( MAKE-14PILE ?auto_380378 ?auto_380379 ?auto_380380 ?auto_380381 ?auto_380382 ?auto_380383 ?auto_380384 ?auto_380385 ?auto_380386 ?auto_380387 ?auto_380388 ?auto_380389 ?auto_380390 ?auto_380391 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380407 - BLOCK
      ?auto_380408 - BLOCK
      ?auto_380409 - BLOCK
      ?auto_380410 - BLOCK
      ?auto_380411 - BLOCK
      ?auto_380412 - BLOCK
      ?auto_380413 - BLOCK
      ?auto_380414 - BLOCK
      ?auto_380415 - BLOCK
      ?auto_380416 - BLOCK
      ?auto_380417 - BLOCK
      ?auto_380418 - BLOCK
      ?auto_380419 - BLOCK
      ?auto_380420 - BLOCK
    )
    :vars
    (
      ?auto_380421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380420 ?auto_380421 ) ( ON-TABLE ?auto_380407 ) ( ON ?auto_380408 ?auto_380407 ) ( not ( = ?auto_380407 ?auto_380408 ) ) ( not ( = ?auto_380407 ?auto_380409 ) ) ( not ( = ?auto_380407 ?auto_380410 ) ) ( not ( = ?auto_380407 ?auto_380411 ) ) ( not ( = ?auto_380407 ?auto_380412 ) ) ( not ( = ?auto_380407 ?auto_380413 ) ) ( not ( = ?auto_380407 ?auto_380414 ) ) ( not ( = ?auto_380407 ?auto_380415 ) ) ( not ( = ?auto_380407 ?auto_380416 ) ) ( not ( = ?auto_380407 ?auto_380417 ) ) ( not ( = ?auto_380407 ?auto_380418 ) ) ( not ( = ?auto_380407 ?auto_380419 ) ) ( not ( = ?auto_380407 ?auto_380420 ) ) ( not ( = ?auto_380407 ?auto_380421 ) ) ( not ( = ?auto_380408 ?auto_380409 ) ) ( not ( = ?auto_380408 ?auto_380410 ) ) ( not ( = ?auto_380408 ?auto_380411 ) ) ( not ( = ?auto_380408 ?auto_380412 ) ) ( not ( = ?auto_380408 ?auto_380413 ) ) ( not ( = ?auto_380408 ?auto_380414 ) ) ( not ( = ?auto_380408 ?auto_380415 ) ) ( not ( = ?auto_380408 ?auto_380416 ) ) ( not ( = ?auto_380408 ?auto_380417 ) ) ( not ( = ?auto_380408 ?auto_380418 ) ) ( not ( = ?auto_380408 ?auto_380419 ) ) ( not ( = ?auto_380408 ?auto_380420 ) ) ( not ( = ?auto_380408 ?auto_380421 ) ) ( not ( = ?auto_380409 ?auto_380410 ) ) ( not ( = ?auto_380409 ?auto_380411 ) ) ( not ( = ?auto_380409 ?auto_380412 ) ) ( not ( = ?auto_380409 ?auto_380413 ) ) ( not ( = ?auto_380409 ?auto_380414 ) ) ( not ( = ?auto_380409 ?auto_380415 ) ) ( not ( = ?auto_380409 ?auto_380416 ) ) ( not ( = ?auto_380409 ?auto_380417 ) ) ( not ( = ?auto_380409 ?auto_380418 ) ) ( not ( = ?auto_380409 ?auto_380419 ) ) ( not ( = ?auto_380409 ?auto_380420 ) ) ( not ( = ?auto_380409 ?auto_380421 ) ) ( not ( = ?auto_380410 ?auto_380411 ) ) ( not ( = ?auto_380410 ?auto_380412 ) ) ( not ( = ?auto_380410 ?auto_380413 ) ) ( not ( = ?auto_380410 ?auto_380414 ) ) ( not ( = ?auto_380410 ?auto_380415 ) ) ( not ( = ?auto_380410 ?auto_380416 ) ) ( not ( = ?auto_380410 ?auto_380417 ) ) ( not ( = ?auto_380410 ?auto_380418 ) ) ( not ( = ?auto_380410 ?auto_380419 ) ) ( not ( = ?auto_380410 ?auto_380420 ) ) ( not ( = ?auto_380410 ?auto_380421 ) ) ( not ( = ?auto_380411 ?auto_380412 ) ) ( not ( = ?auto_380411 ?auto_380413 ) ) ( not ( = ?auto_380411 ?auto_380414 ) ) ( not ( = ?auto_380411 ?auto_380415 ) ) ( not ( = ?auto_380411 ?auto_380416 ) ) ( not ( = ?auto_380411 ?auto_380417 ) ) ( not ( = ?auto_380411 ?auto_380418 ) ) ( not ( = ?auto_380411 ?auto_380419 ) ) ( not ( = ?auto_380411 ?auto_380420 ) ) ( not ( = ?auto_380411 ?auto_380421 ) ) ( not ( = ?auto_380412 ?auto_380413 ) ) ( not ( = ?auto_380412 ?auto_380414 ) ) ( not ( = ?auto_380412 ?auto_380415 ) ) ( not ( = ?auto_380412 ?auto_380416 ) ) ( not ( = ?auto_380412 ?auto_380417 ) ) ( not ( = ?auto_380412 ?auto_380418 ) ) ( not ( = ?auto_380412 ?auto_380419 ) ) ( not ( = ?auto_380412 ?auto_380420 ) ) ( not ( = ?auto_380412 ?auto_380421 ) ) ( not ( = ?auto_380413 ?auto_380414 ) ) ( not ( = ?auto_380413 ?auto_380415 ) ) ( not ( = ?auto_380413 ?auto_380416 ) ) ( not ( = ?auto_380413 ?auto_380417 ) ) ( not ( = ?auto_380413 ?auto_380418 ) ) ( not ( = ?auto_380413 ?auto_380419 ) ) ( not ( = ?auto_380413 ?auto_380420 ) ) ( not ( = ?auto_380413 ?auto_380421 ) ) ( not ( = ?auto_380414 ?auto_380415 ) ) ( not ( = ?auto_380414 ?auto_380416 ) ) ( not ( = ?auto_380414 ?auto_380417 ) ) ( not ( = ?auto_380414 ?auto_380418 ) ) ( not ( = ?auto_380414 ?auto_380419 ) ) ( not ( = ?auto_380414 ?auto_380420 ) ) ( not ( = ?auto_380414 ?auto_380421 ) ) ( not ( = ?auto_380415 ?auto_380416 ) ) ( not ( = ?auto_380415 ?auto_380417 ) ) ( not ( = ?auto_380415 ?auto_380418 ) ) ( not ( = ?auto_380415 ?auto_380419 ) ) ( not ( = ?auto_380415 ?auto_380420 ) ) ( not ( = ?auto_380415 ?auto_380421 ) ) ( not ( = ?auto_380416 ?auto_380417 ) ) ( not ( = ?auto_380416 ?auto_380418 ) ) ( not ( = ?auto_380416 ?auto_380419 ) ) ( not ( = ?auto_380416 ?auto_380420 ) ) ( not ( = ?auto_380416 ?auto_380421 ) ) ( not ( = ?auto_380417 ?auto_380418 ) ) ( not ( = ?auto_380417 ?auto_380419 ) ) ( not ( = ?auto_380417 ?auto_380420 ) ) ( not ( = ?auto_380417 ?auto_380421 ) ) ( not ( = ?auto_380418 ?auto_380419 ) ) ( not ( = ?auto_380418 ?auto_380420 ) ) ( not ( = ?auto_380418 ?auto_380421 ) ) ( not ( = ?auto_380419 ?auto_380420 ) ) ( not ( = ?auto_380419 ?auto_380421 ) ) ( not ( = ?auto_380420 ?auto_380421 ) ) ( ON ?auto_380419 ?auto_380420 ) ( ON ?auto_380418 ?auto_380419 ) ( ON ?auto_380417 ?auto_380418 ) ( ON ?auto_380416 ?auto_380417 ) ( ON ?auto_380415 ?auto_380416 ) ( ON ?auto_380414 ?auto_380415 ) ( ON ?auto_380413 ?auto_380414 ) ( ON ?auto_380412 ?auto_380413 ) ( ON ?auto_380411 ?auto_380412 ) ( ON ?auto_380410 ?auto_380411 ) ( CLEAR ?auto_380408 ) ( ON ?auto_380409 ?auto_380410 ) ( CLEAR ?auto_380409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_380407 ?auto_380408 ?auto_380409 )
      ( MAKE-14PILE ?auto_380407 ?auto_380408 ?auto_380409 ?auto_380410 ?auto_380411 ?auto_380412 ?auto_380413 ?auto_380414 ?auto_380415 ?auto_380416 ?auto_380417 ?auto_380418 ?auto_380419 ?auto_380420 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380436 - BLOCK
      ?auto_380437 - BLOCK
      ?auto_380438 - BLOCK
      ?auto_380439 - BLOCK
      ?auto_380440 - BLOCK
      ?auto_380441 - BLOCK
      ?auto_380442 - BLOCK
      ?auto_380443 - BLOCK
      ?auto_380444 - BLOCK
      ?auto_380445 - BLOCK
      ?auto_380446 - BLOCK
      ?auto_380447 - BLOCK
      ?auto_380448 - BLOCK
      ?auto_380449 - BLOCK
    )
    :vars
    (
      ?auto_380450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380449 ?auto_380450 ) ( ON-TABLE ?auto_380436 ) ( not ( = ?auto_380436 ?auto_380437 ) ) ( not ( = ?auto_380436 ?auto_380438 ) ) ( not ( = ?auto_380436 ?auto_380439 ) ) ( not ( = ?auto_380436 ?auto_380440 ) ) ( not ( = ?auto_380436 ?auto_380441 ) ) ( not ( = ?auto_380436 ?auto_380442 ) ) ( not ( = ?auto_380436 ?auto_380443 ) ) ( not ( = ?auto_380436 ?auto_380444 ) ) ( not ( = ?auto_380436 ?auto_380445 ) ) ( not ( = ?auto_380436 ?auto_380446 ) ) ( not ( = ?auto_380436 ?auto_380447 ) ) ( not ( = ?auto_380436 ?auto_380448 ) ) ( not ( = ?auto_380436 ?auto_380449 ) ) ( not ( = ?auto_380436 ?auto_380450 ) ) ( not ( = ?auto_380437 ?auto_380438 ) ) ( not ( = ?auto_380437 ?auto_380439 ) ) ( not ( = ?auto_380437 ?auto_380440 ) ) ( not ( = ?auto_380437 ?auto_380441 ) ) ( not ( = ?auto_380437 ?auto_380442 ) ) ( not ( = ?auto_380437 ?auto_380443 ) ) ( not ( = ?auto_380437 ?auto_380444 ) ) ( not ( = ?auto_380437 ?auto_380445 ) ) ( not ( = ?auto_380437 ?auto_380446 ) ) ( not ( = ?auto_380437 ?auto_380447 ) ) ( not ( = ?auto_380437 ?auto_380448 ) ) ( not ( = ?auto_380437 ?auto_380449 ) ) ( not ( = ?auto_380437 ?auto_380450 ) ) ( not ( = ?auto_380438 ?auto_380439 ) ) ( not ( = ?auto_380438 ?auto_380440 ) ) ( not ( = ?auto_380438 ?auto_380441 ) ) ( not ( = ?auto_380438 ?auto_380442 ) ) ( not ( = ?auto_380438 ?auto_380443 ) ) ( not ( = ?auto_380438 ?auto_380444 ) ) ( not ( = ?auto_380438 ?auto_380445 ) ) ( not ( = ?auto_380438 ?auto_380446 ) ) ( not ( = ?auto_380438 ?auto_380447 ) ) ( not ( = ?auto_380438 ?auto_380448 ) ) ( not ( = ?auto_380438 ?auto_380449 ) ) ( not ( = ?auto_380438 ?auto_380450 ) ) ( not ( = ?auto_380439 ?auto_380440 ) ) ( not ( = ?auto_380439 ?auto_380441 ) ) ( not ( = ?auto_380439 ?auto_380442 ) ) ( not ( = ?auto_380439 ?auto_380443 ) ) ( not ( = ?auto_380439 ?auto_380444 ) ) ( not ( = ?auto_380439 ?auto_380445 ) ) ( not ( = ?auto_380439 ?auto_380446 ) ) ( not ( = ?auto_380439 ?auto_380447 ) ) ( not ( = ?auto_380439 ?auto_380448 ) ) ( not ( = ?auto_380439 ?auto_380449 ) ) ( not ( = ?auto_380439 ?auto_380450 ) ) ( not ( = ?auto_380440 ?auto_380441 ) ) ( not ( = ?auto_380440 ?auto_380442 ) ) ( not ( = ?auto_380440 ?auto_380443 ) ) ( not ( = ?auto_380440 ?auto_380444 ) ) ( not ( = ?auto_380440 ?auto_380445 ) ) ( not ( = ?auto_380440 ?auto_380446 ) ) ( not ( = ?auto_380440 ?auto_380447 ) ) ( not ( = ?auto_380440 ?auto_380448 ) ) ( not ( = ?auto_380440 ?auto_380449 ) ) ( not ( = ?auto_380440 ?auto_380450 ) ) ( not ( = ?auto_380441 ?auto_380442 ) ) ( not ( = ?auto_380441 ?auto_380443 ) ) ( not ( = ?auto_380441 ?auto_380444 ) ) ( not ( = ?auto_380441 ?auto_380445 ) ) ( not ( = ?auto_380441 ?auto_380446 ) ) ( not ( = ?auto_380441 ?auto_380447 ) ) ( not ( = ?auto_380441 ?auto_380448 ) ) ( not ( = ?auto_380441 ?auto_380449 ) ) ( not ( = ?auto_380441 ?auto_380450 ) ) ( not ( = ?auto_380442 ?auto_380443 ) ) ( not ( = ?auto_380442 ?auto_380444 ) ) ( not ( = ?auto_380442 ?auto_380445 ) ) ( not ( = ?auto_380442 ?auto_380446 ) ) ( not ( = ?auto_380442 ?auto_380447 ) ) ( not ( = ?auto_380442 ?auto_380448 ) ) ( not ( = ?auto_380442 ?auto_380449 ) ) ( not ( = ?auto_380442 ?auto_380450 ) ) ( not ( = ?auto_380443 ?auto_380444 ) ) ( not ( = ?auto_380443 ?auto_380445 ) ) ( not ( = ?auto_380443 ?auto_380446 ) ) ( not ( = ?auto_380443 ?auto_380447 ) ) ( not ( = ?auto_380443 ?auto_380448 ) ) ( not ( = ?auto_380443 ?auto_380449 ) ) ( not ( = ?auto_380443 ?auto_380450 ) ) ( not ( = ?auto_380444 ?auto_380445 ) ) ( not ( = ?auto_380444 ?auto_380446 ) ) ( not ( = ?auto_380444 ?auto_380447 ) ) ( not ( = ?auto_380444 ?auto_380448 ) ) ( not ( = ?auto_380444 ?auto_380449 ) ) ( not ( = ?auto_380444 ?auto_380450 ) ) ( not ( = ?auto_380445 ?auto_380446 ) ) ( not ( = ?auto_380445 ?auto_380447 ) ) ( not ( = ?auto_380445 ?auto_380448 ) ) ( not ( = ?auto_380445 ?auto_380449 ) ) ( not ( = ?auto_380445 ?auto_380450 ) ) ( not ( = ?auto_380446 ?auto_380447 ) ) ( not ( = ?auto_380446 ?auto_380448 ) ) ( not ( = ?auto_380446 ?auto_380449 ) ) ( not ( = ?auto_380446 ?auto_380450 ) ) ( not ( = ?auto_380447 ?auto_380448 ) ) ( not ( = ?auto_380447 ?auto_380449 ) ) ( not ( = ?auto_380447 ?auto_380450 ) ) ( not ( = ?auto_380448 ?auto_380449 ) ) ( not ( = ?auto_380448 ?auto_380450 ) ) ( not ( = ?auto_380449 ?auto_380450 ) ) ( ON ?auto_380448 ?auto_380449 ) ( ON ?auto_380447 ?auto_380448 ) ( ON ?auto_380446 ?auto_380447 ) ( ON ?auto_380445 ?auto_380446 ) ( ON ?auto_380444 ?auto_380445 ) ( ON ?auto_380443 ?auto_380444 ) ( ON ?auto_380442 ?auto_380443 ) ( ON ?auto_380441 ?auto_380442 ) ( ON ?auto_380440 ?auto_380441 ) ( ON ?auto_380439 ?auto_380440 ) ( ON ?auto_380438 ?auto_380439 ) ( CLEAR ?auto_380436 ) ( ON ?auto_380437 ?auto_380438 ) ( CLEAR ?auto_380437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_380436 ?auto_380437 )
      ( MAKE-14PILE ?auto_380436 ?auto_380437 ?auto_380438 ?auto_380439 ?auto_380440 ?auto_380441 ?auto_380442 ?auto_380443 ?auto_380444 ?auto_380445 ?auto_380446 ?auto_380447 ?auto_380448 ?auto_380449 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380465 - BLOCK
      ?auto_380466 - BLOCK
      ?auto_380467 - BLOCK
      ?auto_380468 - BLOCK
      ?auto_380469 - BLOCK
      ?auto_380470 - BLOCK
      ?auto_380471 - BLOCK
      ?auto_380472 - BLOCK
      ?auto_380473 - BLOCK
      ?auto_380474 - BLOCK
      ?auto_380475 - BLOCK
      ?auto_380476 - BLOCK
      ?auto_380477 - BLOCK
      ?auto_380478 - BLOCK
    )
    :vars
    (
      ?auto_380479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380478 ?auto_380479 ) ( ON-TABLE ?auto_380465 ) ( not ( = ?auto_380465 ?auto_380466 ) ) ( not ( = ?auto_380465 ?auto_380467 ) ) ( not ( = ?auto_380465 ?auto_380468 ) ) ( not ( = ?auto_380465 ?auto_380469 ) ) ( not ( = ?auto_380465 ?auto_380470 ) ) ( not ( = ?auto_380465 ?auto_380471 ) ) ( not ( = ?auto_380465 ?auto_380472 ) ) ( not ( = ?auto_380465 ?auto_380473 ) ) ( not ( = ?auto_380465 ?auto_380474 ) ) ( not ( = ?auto_380465 ?auto_380475 ) ) ( not ( = ?auto_380465 ?auto_380476 ) ) ( not ( = ?auto_380465 ?auto_380477 ) ) ( not ( = ?auto_380465 ?auto_380478 ) ) ( not ( = ?auto_380465 ?auto_380479 ) ) ( not ( = ?auto_380466 ?auto_380467 ) ) ( not ( = ?auto_380466 ?auto_380468 ) ) ( not ( = ?auto_380466 ?auto_380469 ) ) ( not ( = ?auto_380466 ?auto_380470 ) ) ( not ( = ?auto_380466 ?auto_380471 ) ) ( not ( = ?auto_380466 ?auto_380472 ) ) ( not ( = ?auto_380466 ?auto_380473 ) ) ( not ( = ?auto_380466 ?auto_380474 ) ) ( not ( = ?auto_380466 ?auto_380475 ) ) ( not ( = ?auto_380466 ?auto_380476 ) ) ( not ( = ?auto_380466 ?auto_380477 ) ) ( not ( = ?auto_380466 ?auto_380478 ) ) ( not ( = ?auto_380466 ?auto_380479 ) ) ( not ( = ?auto_380467 ?auto_380468 ) ) ( not ( = ?auto_380467 ?auto_380469 ) ) ( not ( = ?auto_380467 ?auto_380470 ) ) ( not ( = ?auto_380467 ?auto_380471 ) ) ( not ( = ?auto_380467 ?auto_380472 ) ) ( not ( = ?auto_380467 ?auto_380473 ) ) ( not ( = ?auto_380467 ?auto_380474 ) ) ( not ( = ?auto_380467 ?auto_380475 ) ) ( not ( = ?auto_380467 ?auto_380476 ) ) ( not ( = ?auto_380467 ?auto_380477 ) ) ( not ( = ?auto_380467 ?auto_380478 ) ) ( not ( = ?auto_380467 ?auto_380479 ) ) ( not ( = ?auto_380468 ?auto_380469 ) ) ( not ( = ?auto_380468 ?auto_380470 ) ) ( not ( = ?auto_380468 ?auto_380471 ) ) ( not ( = ?auto_380468 ?auto_380472 ) ) ( not ( = ?auto_380468 ?auto_380473 ) ) ( not ( = ?auto_380468 ?auto_380474 ) ) ( not ( = ?auto_380468 ?auto_380475 ) ) ( not ( = ?auto_380468 ?auto_380476 ) ) ( not ( = ?auto_380468 ?auto_380477 ) ) ( not ( = ?auto_380468 ?auto_380478 ) ) ( not ( = ?auto_380468 ?auto_380479 ) ) ( not ( = ?auto_380469 ?auto_380470 ) ) ( not ( = ?auto_380469 ?auto_380471 ) ) ( not ( = ?auto_380469 ?auto_380472 ) ) ( not ( = ?auto_380469 ?auto_380473 ) ) ( not ( = ?auto_380469 ?auto_380474 ) ) ( not ( = ?auto_380469 ?auto_380475 ) ) ( not ( = ?auto_380469 ?auto_380476 ) ) ( not ( = ?auto_380469 ?auto_380477 ) ) ( not ( = ?auto_380469 ?auto_380478 ) ) ( not ( = ?auto_380469 ?auto_380479 ) ) ( not ( = ?auto_380470 ?auto_380471 ) ) ( not ( = ?auto_380470 ?auto_380472 ) ) ( not ( = ?auto_380470 ?auto_380473 ) ) ( not ( = ?auto_380470 ?auto_380474 ) ) ( not ( = ?auto_380470 ?auto_380475 ) ) ( not ( = ?auto_380470 ?auto_380476 ) ) ( not ( = ?auto_380470 ?auto_380477 ) ) ( not ( = ?auto_380470 ?auto_380478 ) ) ( not ( = ?auto_380470 ?auto_380479 ) ) ( not ( = ?auto_380471 ?auto_380472 ) ) ( not ( = ?auto_380471 ?auto_380473 ) ) ( not ( = ?auto_380471 ?auto_380474 ) ) ( not ( = ?auto_380471 ?auto_380475 ) ) ( not ( = ?auto_380471 ?auto_380476 ) ) ( not ( = ?auto_380471 ?auto_380477 ) ) ( not ( = ?auto_380471 ?auto_380478 ) ) ( not ( = ?auto_380471 ?auto_380479 ) ) ( not ( = ?auto_380472 ?auto_380473 ) ) ( not ( = ?auto_380472 ?auto_380474 ) ) ( not ( = ?auto_380472 ?auto_380475 ) ) ( not ( = ?auto_380472 ?auto_380476 ) ) ( not ( = ?auto_380472 ?auto_380477 ) ) ( not ( = ?auto_380472 ?auto_380478 ) ) ( not ( = ?auto_380472 ?auto_380479 ) ) ( not ( = ?auto_380473 ?auto_380474 ) ) ( not ( = ?auto_380473 ?auto_380475 ) ) ( not ( = ?auto_380473 ?auto_380476 ) ) ( not ( = ?auto_380473 ?auto_380477 ) ) ( not ( = ?auto_380473 ?auto_380478 ) ) ( not ( = ?auto_380473 ?auto_380479 ) ) ( not ( = ?auto_380474 ?auto_380475 ) ) ( not ( = ?auto_380474 ?auto_380476 ) ) ( not ( = ?auto_380474 ?auto_380477 ) ) ( not ( = ?auto_380474 ?auto_380478 ) ) ( not ( = ?auto_380474 ?auto_380479 ) ) ( not ( = ?auto_380475 ?auto_380476 ) ) ( not ( = ?auto_380475 ?auto_380477 ) ) ( not ( = ?auto_380475 ?auto_380478 ) ) ( not ( = ?auto_380475 ?auto_380479 ) ) ( not ( = ?auto_380476 ?auto_380477 ) ) ( not ( = ?auto_380476 ?auto_380478 ) ) ( not ( = ?auto_380476 ?auto_380479 ) ) ( not ( = ?auto_380477 ?auto_380478 ) ) ( not ( = ?auto_380477 ?auto_380479 ) ) ( not ( = ?auto_380478 ?auto_380479 ) ) ( ON ?auto_380477 ?auto_380478 ) ( ON ?auto_380476 ?auto_380477 ) ( ON ?auto_380475 ?auto_380476 ) ( ON ?auto_380474 ?auto_380475 ) ( ON ?auto_380473 ?auto_380474 ) ( ON ?auto_380472 ?auto_380473 ) ( ON ?auto_380471 ?auto_380472 ) ( ON ?auto_380470 ?auto_380471 ) ( ON ?auto_380469 ?auto_380470 ) ( ON ?auto_380468 ?auto_380469 ) ( ON ?auto_380467 ?auto_380468 ) ( CLEAR ?auto_380465 ) ( ON ?auto_380466 ?auto_380467 ) ( CLEAR ?auto_380466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_380465 ?auto_380466 )
      ( MAKE-14PILE ?auto_380465 ?auto_380466 ?auto_380467 ?auto_380468 ?auto_380469 ?auto_380470 ?auto_380471 ?auto_380472 ?auto_380473 ?auto_380474 ?auto_380475 ?auto_380476 ?auto_380477 ?auto_380478 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380494 - BLOCK
      ?auto_380495 - BLOCK
      ?auto_380496 - BLOCK
      ?auto_380497 - BLOCK
      ?auto_380498 - BLOCK
      ?auto_380499 - BLOCK
      ?auto_380500 - BLOCK
      ?auto_380501 - BLOCK
      ?auto_380502 - BLOCK
      ?auto_380503 - BLOCK
      ?auto_380504 - BLOCK
      ?auto_380505 - BLOCK
      ?auto_380506 - BLOCK
      ?auto_380507 - BLOCK
    )
    :vars
    (
      ?auto_380508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380507 ?auto_380508 ) ( not ( = ?auto_380494 ?auto_380495 ) ) ( not ( = ?auto_380494 ?auto_380496 ) ) ( not ( = ?auto_380494 ?auto_380497 ) ) ( not ( = ?auto_380494 ?auto_380498 ) ) ( not ( = ?auto_380494 ?auto_380499 ) ) ( not ( = ?auto_380494 ?auto_380500 ) ) ( not ( = ?auto_380494 ?auto_380501 ) ) ( not ( = ?auto_380494 ?auto_380502 ) ) ( not ( = ?auto_380494 ?auto_380503 ) ) ( not ( = ?auto_380494 ?auto_380504 ) ) ( not ( = ?auto_380494 ?auto_380505 ) ) ( not ( = ?auto_380494 ?auto_380506 ) ) ( not ( = ?auto_380494 ?auto_380507 ) ) ( not ( = ?auto_380494 ?auto_380508 ) ) ( not ( = ?auto_380495 ?auto_380496 ) ) ( not ( = ?auto_380495 ?auto_380497 ) ) ( not ( = ?auto_380495 ?auto_380498 ) ) ( not ( = ?auto_380495 ?auto_380499 ) ) ( not ( = ?auto_380495 ?auto_380500 ) ) ( not ( = ?auto_380495 ?auto_380501 ) ) ( not ( = ?auto_380495 ?auto_380502 ) ) ( not ( = ?auto_380495 ?auto_380503 ) ) ( not ( = ?auto_380495 ?auto_380504 ) ) ( not ( = ?auto_380495 ?auto_380505 ) ) ( not ( = ?auto_380495 ?auto_380506 ) ) ( not ( = ?auto_380495 ?auto_380507 ) ) ( not ( = ?auto_380495 ?auto_380508 ) ) ( not ( = ?auto_380496 ?auto_380497 ) ) ( not ( = ?auto_380496 ?auto_380498 ) ) ( not ( = ?auto_380496 ?auto_380499 ) ) ( not ( = ?auto_380496 ?auto_380500 ) ) ( not ( = ?auto_380496 ?auto_380501 ) ) ( not ( = ?auto_380496 ?auto_380502 ) ) ( not ( = ?auto_380496 ?auto_380503 ) ) ( not ( = ?auto_380496 ?auto_380504 ) ) ( not ( = ?auto_380496 ?auto_380505 ) ) ( not ( = ?auto_380496 ?auto_380506 ) ) ( not ( = ?auto_380496 ?auto_380507 ) ) ( not ( = ?auto_380496 ?auto_380508 ) ) ( not ( = ?auto_380497 ?auto_380498 ) ) ( not ( = ?auto_380497 ?auto_380499 ) ) ( not ( = ?auto_380497 ?auto_380500 ) ) ( not ( = ?auto_380497 ?auto_380501 ) ) ( not ( = ?auto_380497 ?auto_380502 ) ) ( not ( = ?auto_380497 ?auto_380503 ) ) ( not ( = ?auto_380497 ?auto_380504 ) ) ( not ( = ?auto_380497 ?auto_380505 ) ) ( not ( = ?auto_380497 ?auto_380506 ) ) ( not ( = ?auto_380497 ?auto_380507 ) ) ( not ( = ?auto_380497 ?auto_380508 ) ) ( not ( = ?auto_380498 ?auto_380499 ) ) ( not ( = ?auto_380498 ?auto_380500 ) ) ( not ( = ?auto_380498 ?auto_380501 ) ) ( not ( = ?auto_380498 ?auto_380502 ) ) ( not ( = ?auto_380498 ?auto_380503 ) ) ( not ( = ?auto_380498 ?auto_380504 ) ) ( not ( = ?auto_380498 ?auto_380505 ) ) ( not ( = ?auto_380498 ?auto_380506 ) ) ( not ( = ?auto_380498 ?auto_380507 ) ) ( not ( = ?auto_380498 ?auto_380508 ) ) ( not ( = ?auto_380499 ?auto_380500 ) ) ( not ( = ?auto_380499 ?auto_380501 ) ) ( not ( = ?auto_380499 ?auto_380502 ) ) ( not ( = ?auto_380499 ?auto_380503 ) ) ( not ( = ?auto_380499 ?auto_380504 ) ) ( not ( = ?auto_380499 ?auto_380505 ) ) ( not ( = ?auto_380499 ?auto_380506 ) ) ( not ( = ?auto_380499 ?auto_380507 ) ) ( not ( = ?auto_380499 ?auto_380508 ) ) ( not ( = ?auto_380500 ?auto_380501 ) ) ( not ( = ?auto_380500 ?auto_380502 ) ) ( not ( = ?auto_380500 ?auto_380503 ) ) ( not ( = ?auto_380500 ?auto_380504 ) ) ( not ( = ?auto_380500 ?auto_380505 ) ) ( not ( = ?auto_380500 ?auto_380506 ) ) ( not ( = ?auto_380500 ?auto_380507 ) ) ( not ( = ?auto_380500 ?auto_380508 ) ) ( not ( = ?auto_380501 ?auto_380502 ) ) ( not ( = ?auto_380501 ?auto_380503 ) ) ( not ( = ?auto_380501 ?auto_380504 ) ) ( not ( = ?auto_380501 ?auto_380505 ) ) ( not ( = ?auto_380501 ?auto_380506 ) ) ( not ( = ?auto_380501 ?auto_380507 ) ) ( not ( = ?auto_380501 ?auto_380508 ) ) ( not ( = ?auto_380502 ?auto_380503 ) ) ( not ( = ?auto_380502 ?auto_380504 ) ) ( not ( = ?auto_380502 ?auto_380505 ) ) ( not ( = ?auto_380502 ?auto_380506 ) ) ( not ( = ?auto_380502 ?auto_380507 ) ) ( not ( = ?auto_380502 ?auto_380508 ) ) ( not ( = ?auto_380503 ?auto_380504 ) ) ( not ( = ?auto_380503 ?auto_380505 ) ) ( not ( = ?auto_380503 ?auto_380506 ) ) ( not ( = ?auto_380503 ?auto_380507 ) ) ( not ( = ?auto_380503 ?auto_380508 ) ) ( not ( = ?auto_380504 ?auto_380505 ) ) ( not ( = ?auto_380504 ?auto_380506 ) ) ( not ( = ?auto_380504 ?auto_380507 ) ) ( not ( = ?auto_380504 ?auto_380508 ) ) ( not ( = ?auto_380505 ?auto_380506 ) ) ( not ( = ?auto_380505 ?auto_380507 ) ) ( not ( = ?auto_380505 ?auto_380508 ) ) ( not ( = ?auto_380506 ?auto_380507 ) ) ( not ( = ?auto_380506 ?auto_380508 ) ) ( not ( = ?auto_380507 ?auto_380508 ) ) ( ON ?auto_380506 ?auto_380507 ) ( ON ?auto_380505 ?auto_380506 ) ( ON ?auto_380504 ?auto_380505 ) ( ON ?auto_380503 ?auto_380504 ) ( ON ?auto_380502 ?auto_380503 ) ( ON ?auto_380501 ?auto_380502 ) ( ON ?auto_380500 ?auto_380501 ) ( ON ?auto_380499 ?auto_380500 ) ( ON ?auto_380498 ?auto_380499 ) ( ON ?auto_380497 ?auto_380498 ) ( ON ?auto_380496 ?auto_380497 ) ( ON ?auto_380495 ?auto_380496 ) ( ON ?auto_380494 ?auto_380495 ) ( CLEAR ?auto_380494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_380494 )
      ( MAKE-14PILE ?auto_380494 ?auto_380495 ?auto_380496 ?auto_380497 ?auto_380498 ?auto_380499 ?auto_380500 ?auto_380501 ?auto_380502 ?auto_380503 ?auto_380504 ?auto_380505 ?auto_380506 ?auto_380507 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_380523 - BLOCK
      ?auto_380524 - BLOCK
      ?auto_380525 - BLOCK
      ?auto_380526 - BLOCK
      ?auto_380527 - BLOCK
      ?auto_380528 - BLOCK
      ?auto_380529 - BLOCK
      ?auto_380530 - BLOCK
      ?auto_380531 - BLOCK
      ?auto_380532 - BLOCK
      ?auto_380533 - BLOCK
      ?auto_380534 - BLOCK
      ?auto_380535 - BLOCK
      ?auto_380536 - BLOCK
    )
    :vars
    (
      ?auto_380537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380536 ?auto_380537 ) ( not ( = ?auto_380523 ?auto_380524 ) ) ( not ( = ?auto_380523 ?auto_380525 ) ) ( not ( = ?auto_380523 ?auto_380526 ) ) ( not ( = ?auto_380523 ?auto_380527 ) ) ( not ( = ?auto_380523 ?auto_380528 ) ) ( not ( = ?auto_380523 ?auto_380529 ) ) ( not ( = ?auto_380523 ?auto_380530 ) ) ( not ( = ?auto_380523 ?auto_380531 ) ) ( not ( = ?auto_380523 ?auto_380532 ) ) ( not ( = ?auto_380523 ?auto_380533 ) ) ( not ( = ?auto_380523 ?auto_380534 ) ) ( not ( = ?auto_380523 ?auto_380535 ) ) ( not ( = ?auto_380523 ?auto_380536 ) ) ( not ( = ?auto_380523 ?auto_380537 ) ) ( not ( = ?auto_380524 ?auto_380525 ) ) ( not ( = ?auto_380524 ?auto_380526 ) ) ( not ( = ?auto_380524 ?auto_380527 ) ) ( not ( = ?auto_380524 ?auto_380528 ) ) ( not ( = ?auto_380524 ?auto_380529 ) ) ( not ( = ?auto_380524 ?auto_380530 ) ) ( not ( = ?auto_380524 ?auto_380531 ) ) ( not ( = ?auto_380524 ?auto_380532 ) ) ( not ( = ?auto_380524 ?auto_380533 ) ) ( not ( = ?auto_380524 ?auto_380534 ) ) ( not ( = ?auto_380524 ?auto_380535 ) ) ( not ( = ?auto_380524 ?auto_380536 ) ) ( not ( = ?auto_380524 ?auto_380537 ) ) ( not ( = ?auto_380525 ?auto_380526 ) ) ( not ( = ?auto_380525 ?auto_380527 ) ) ( not ( = ?auto_380525 ?auto_380528 ) ) ( not ( = ?auto_380525 ?auto_380529 ) ) ( not ( = ?auto_380525 ?auto_380530 ) ) ( not ( = ?auto_380525 ?auto_380531 ) ) ( not ( = ?auto_380525 ?auto_380532 ) ) ( not ( = ?auto_380525 ?auto_380533 ) ) ( not ( = ?auto_380525 ?auto_380534 ) ) ( not ( = ?auto_380525 ?auto_380535 ) ) ( not ( = ?auto_380525 ?auto_380536 ) ) ( not ( = ?auto_380525 ?auto_380537 ) ) ( not ( = ?auto_380526 ?auto_380527 ) ) ( not ( = ?auto_380526 ?auto_380528 ) ) ( not ( = ?auto_380526 ?auto_380529 ) ) ( not ( = ?auto_380526 ?auto_380530 ) ) ( not ( = ?auto_380526 ?auto_380531 ) ) ( not ( = ?auto_380526 ?auto_380532 ) ) ( not ( = ?auto_380526 ?auto_380533 ) ) ( not ( = ?auto_380526 ?auto_380534 ) ) ( not ( = ?auto_380526 ?auto_380535 ) ) ( not ( = ?auto_380526 ?auto_380536 ) ) ( not ( = ?auto_380526 ?auto_380537 ) ) ( not ( = ?auto_380527 ?auto_380528 ) ) ( not ( = ?auto_380527 ?auto_380529 ) ) ( not ( = ?auto_380527 ?auto_380530 ) ) ( not ( = ?auto_380527 ?auto_380531 ) ) ( not ( = ?auto_380527 ?auto_380532 ) ) ( not ( = ?auto_380527 ?auto_380533 ) ) ( not ( = ?auto_380527 ?auto_380534 ) ) ( not ( = ?auto_380527 ?auto_380535 ) ) ( not ( = ?auto_380527 ?auto_380536 ) ) ( not ( = ?auto_380527 ?auto_380537 ) ) ( not ( = ?auto_380528 ?auto_380529 ) ) ( not ( = ?auto_380528 ?auto_380530 ) ) ( not ( = ?auto_380528 ?auto_380531 ) ) ( not ( = ?auto_380528 ?auto_380532 ) ) ( not ( = ?auto_380528 ?auto_380533 ) ) ( not ( = ?auto_380528 ?auto_380534 ) ) ( not ( = ?auto_380528 ?auto_380535 ) ) ( not ( = ?auto_380528 ?auto_380536 ) ) ( not ( = ?auto_380528 ?auto_380537 ) ) ( not ( = ?auto_380529 ?auto_380530 ) ) ( not ( = ?auto_380529 ?auto_380531 ) ) ( not ( = ?auto_380529 ?auto_380532 ) ) ( not ( = ?auto_380529 ?auto_380533 ) ) ( not ( = ?auto_380529 ?auto_380534 ) ) ( not ( = ?auto_380529 ?auto_380535 ) ) ( not ( = ?auto_380529 ?auto_380536 ) ) ( not ( = ?auto_380529 ?auto_380537 ) ) ( not ( = ?auto_380530 ?auto_380531 ) ) ( not ( = ?auto_380530 ?auto_380532 ) ) ( not ( = ?auto_380530 ?auto_380533 ) ) ( not ( = ?auto_380530 ?auto_380534 ) ) ( not ( = ?auto_380530 ?auto_380535 ) ) ( not ( = ?auto_380530 ?auto_380536 ) ) ( not ( = ?auto_380530 ?auto_380537 ) ) ( not ( = ?auto_380531 ?auto_380532 ) ) ( not ( = ?auto_380531 ?auto_380533 ) ) ( not ( = ?auto_380531 ?auto_380534 ) ) ( not ( = ?auto_380531 ?auto_380535 ) ) ( not ( = ?auto_380531 ?auto_380536 ) ) ( not ( = ?auto_380531 ?auto_380537 ) ) ( not ( = ?auto_380532 ?auto_380533 ) ) ( not ( = ?auto_380532 ?auto_380534 ) ) ( not ( = ?auto_380532 ?auto_380535 ) ) ( not ( = ?auto_380532 ?auto_380536 ) ) ( not ( = ?auto_380532 ?auto_380537 ) ) ( not ( = ?auto_380533 ?auto_380534 ) ) ( not ( = ?auto_380533 ?auto_380535 ) ) ( not ( = ?auto_380533 ?auto_380536 ) ) ( not ( = ?auto_380533 ?auto_380537 ) ) ( not ( = ?auto_380534 ?auto_380535 ) ) ( not ( = ?auto_380534 ?auto_380536 ) ) ( not ( = ?auto_380534 ?auto_380537 ) ) ( not ( = ?auto_380535 ?auto_380536 ) ) ( not ( = ?auto_380535 ?auto_380537 ) ) ( not ( = ?auto_380536 ?auto_380537 ) ) ( ON ?auto_380535 ?auto_380536 ) ( ON ?auto_380534 ?auto_380535 ) ( ON ?auto_380533 ?auto_380534 ) ( ON ?auto_380532 ?auto_380533 ) ( ON ?auto_380531 ?auto_380532 ) ( ON ?auto_380530 ?auto_380531 ) ( ON ?auto_380529 ?auto_380530 ) ( ON ?auto_380528 ?auto_380529 ) ( ON ?auto_380527 ?auto_380528 ) ( ON ?auto_380526 ?auto_380527 ) ( ON ?auto_380525 ?auto_380526 ) ( ON ?auto_380524 ?auto_380525 ) ( ON ?auto_380523 ?auto_380524 ) ( CLEAR ?auto_380523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_380523 )
      ( MAKE-14PILE ?auto_380523 ?auto_380524 ?auto_380525 ?auto_380526 ?auto_380527 ?auto_380528 ?auto_380529 ?auto_380530 ?auto_380531 ?auto_380532 ?auto_380533 ?auto_380534 ?auto_380535 ?auto_380536 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380553 - BLOCK
      ?auto_380554 - BLOCK
      ?auto_380555 - BLOCK
      ?auto_380556 - BLOCK
      ?auto_380557 - BLOCK
      ?auto_380558 - BLOCK
      ?auto_380559 - BLOCK
      ?auto_380560 - BLOCK
      ?auto_380561 - BLOCK
      ?auto_380562 - BLOCK
      ?auto_380563 - BLOCK
      ?auto_380564 - BLOCK
      ?auto_380565 - BLOCK
      ?auto_380566 - BLOCK
      ?auto_380567 - BLOCK
    )
    :vars
    (
      ?auto_380568 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_380566 ) ( ON ?auto_380567 ?auto_380568 ) ( CLEAR ?auto_380567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_380553 ) ( ON ?auto_380554 ?auto_380553 ) ( ON ?auto_380555 ?auto_380554 ) ( ON ?auto_380556 ?auto_380555 ) ( ON ?auto_380557 ?auto_380556 ) ( ON ?auto_380558 ?auto_380557 ) ( ON ?auto_380559 ?auto_380558 ) ( ON ?auto_380560 ?auto_380559 ) ( ON ?auto_380561 ?auto_380560 ) ( ON ?auto_380562 ?auto_380561 ) ( ON ?auto_380563 ?auto_380562 ) ( ON ?auto_380564 ?auto_380563 ) ( ON ?auto_380565 ?auto_380564 ) ( ON ?auto_380566 ?auto_380565 ) ( not ( = ?auto_380553 ?auto_380554 ) ) ( not ( = ?auto_380553 ?auto_380555 ) ) ( not ( = ?auto_380553 ?auto_380556 ) ) ( not ( = ?auto_380553 ?auto_380557 ) ) ( not ( = ?auto_380553 ?auto_380558 ) ) ( not ( = ?auto_380553 ?auto_380559 ) ) ( not ( = ?auto_380553 ?auto_380560 ) ) ( not ( = ?auto_380553 ?auto_380561 ) ) ( not ( = ?auto_380553 ?auto_380562 ) ) ( not ( = ?auto_380553 ?auto_380563 ) ) ( not ( = ?auto_380553 ?auto_380564 ) ) ( not ( = ?auto_380553 ?auto_380565 ) ) ( not ( = ?auto_380553 ?auto_380566 ) ) ( not ( = ?auto_380553 ?auto_380567 ) ) ( not ( = ?auto_380553 ?auto_380568 ) ) ( not ( = ?auto_380554 ?auto_380555 ) ) ( not ( = ?auto_380554 ?auto_380556 ) ) ( not ( = ?auto_380554 ?auto_380557 ) ) ( not ( = ?auto_380554 ?auto_380558 ) ) ( not ( = ?auto_380554 ?auto_380559 ) ) ( not ( = ?auto_380554 ?auto_380560 ) ) ( not ( = ?auto_380554 ?auto_380561 ) ) ( not ( = ?auto_380554 ?auto_380562 ) ) ( not ( = ?auto_380554 ?auto_380563 ) ) ( not ( = ?auto_380554 ?auto_380564 ) ) ( not ( = ?auto_380554 ?auto_380565 ) ) ( not ( = ?auto_380554 ?auto_380566 ) ) ( not ( = ?auto_380554 ?auto_380567 ) ) ( not ( = ?auto_380554 ?auto_380568 ) ) ( not ( = ?auto_380555 ?auto_380556 ) ) ( not ( = ?auto_380555 ?auto_380557 ) ) ( not ( = ?auto_380555 ?auto_380558 ) ) ( not ( = ?auto_380555 ?auto_380559 ) ) ( not ( = ?auto_380555 ?auto_380560 ) ) ( not ( = ?auto_380555 ?auto_380561 ) ) ( not ( = ?auto_380555 ?auto_380562 ) ) ( not ( = ?auto_380555 ?auto_380563 ) ) ( not ( = ?auto_380555 ?auto_380564 ) ) ( not ( = ?auto_380555 ?auto_380565 ) ) ( not ( = ?auto_380555 ?auto_380566 ) ) ( not ( = ?auto_380555 ?auto_380567 ) ) ( not ( = ?auto_380555 ?auto_380568 ) ) ( not ( = ?auto_380556 ?auto_380557 ) ) ( not ( = ?auto_380556 ?auto_380558 ) ) ( not ( = ?auto_380556 ?auto_380559 ) ) ( not ( = ?auto_380556 ?auto_380560 ) ) ( not ( = ?auto_380556 ?auto_380561 ) ) ( not ( = ?auto_380556 ?auto_380562 ) ) ( not ( = ?auto_380556 ?auto_380563 ) ) ( not ( = ?auto_380556 ?auto_380564 ) ) ( not ( = ?auto_380556 ?auto_380565 ) ) ( not ( = ?auto_380556 ?auto_380566 ) ) ( not ( = ?auto_380556 ?auto_380567 ) ) ( not ( = ?auto_380556 ?auto_380568 ) ) ( not ( = ?auto_380557 ?auto_380558 ) ) ( not ( = ?auto_380557 ?auto_380559 ) ) ( not ( = ?auto_380557 ?auto_380560 ) ) ( not ( = ?auto_380557 ?auto_380561 ) ) ( not ( = ?auto_380557 ?auto_380562 ) ) ( not ( = ?auto_380557 ?auto_380563 ) ) ( not ( = ?auto_380557 ?auto_380564 ) ) ( not ( = ?auto_380557 ?auto_380565 ) ) ( not ( = ?auto_380557 ?auto_380566 ) ) ( not ( = ?auto_380557 ?auto_380567 ) ) ( not ( = ?auto_380557 ?auto_380568 ) ) ( not ( = ?auto_380558 ?auto_380559 ) ) ( not ( = ?auto_380558 ?auto_380560 ) ) ( not ( = ?auto_380558 ?auto_380561 ) ) ( not ( = ?auto_380558 ?auto_380562 ) ) ( not ( = ?auto_380558 ?auto_380563 ) ) ( not ( = ?auto_380558 ?auto_380564 ) ) ( not ( = ?auto_380558 ?auto_380565 ) ) ( not ( = ?auto_380558 ?auto_380566 ) ) ( not ( = ?auto_380558 ?auto_380567 ) ) ( not ( = ?auto_380558 ?auto_380568 ) ) ( not ( = ?auto_380559 ?auto_380560 ) ) ( not ( = ?auto_380559 ?auto_380561 ) ) ( not ( = ?auto_380559 ?auto_380562 ) ) ( not ( = ?auto_380559 ?auto_380563 ) ) ( not ( = ?auto_380559 ?auto_380564 ) ) ( not ( = ?auto_380559 ?auto_380565 ) ) ( not ( = ?auto_380559 ?auto_380566 ) ) ( not ( = ?auto_380559 ?auto_380567 ) ) ( not ( = ?auto_380559 ?auto_380568 ) ) ( not ( = ?auto_380560 ?auto_380561 ) ) ( not ( = ?auto_380560 ?auto_380562 ) ) ( not ( = ?auto_380560 ?auto_380563 ) ) ( not ( = ?auto_380560 ?auto_380564 ) ) ( not ( = ?auto_380560 ?auto_380565 ) ) ( not ( = ?auto_380560 ?auto_380566 ) ) ( not ( = ?auto_380560 ?auto_380567 ) ) ( not ( = ?auto_380560 ?auto_380568 ) ) ( not ( = ?auto_380561 ?auto_380562 ) ) ( not ( = ?auto_380561 ?auto_380563 ) ) ( not ( = ?auto_380561 ?auto_380564 ) ) ( not ( = ?auto_380561 ?auto_380565 ) ) ( not ( = ?auto_380561 ?auto_380566 ) ) ( not ( = ?auto_380561 ?auto_380567 ) ) ( not ( = ?auto_380561 ?auto_380568 ) ) ( not ( = ?auto_380562 ?auto_380563 ) ) ( not ( = ?auto_380562 ?auto_380564 ) ) ( not ( = ?auto_380562 ?auto_380565 ) ) ( not ( = ?auto_380562 ?auto_380566 ) ) ( not ( = ?auto_380562 ?auto_380567 ) ) ( not ( = ?auto_380562 ?auto_380568 ) ) ( not ( = ?auto_380563 ?auto_380564 ) ) ( not ( = ?auto_380563 ?auto_380565 ) ) ( not ( = ?auto_380563 ?auto_380566 ) ) ( not ( = ?auto_380563 ?auto_380567 ) ) ( not ( = ?auto_380563 ?auto_380568 ) ) ( not ( = ?auto_380564 ?auto_380565 ) ) ( not ( = ?auto_380564 ?auto_380566 ) ) ( not ( = ?auto_380564 ?auto_380567 ) ) ( not ( = ?auto_380564 ?auto_380568 ) ) ( not ( = ?auto_380565 ?auto_380566 ) ) ( not ( = ?auto_380565 ?auto_380567 ) ) ( not ( = ?auto_380565 ?auto_380568 ) ) ( not ( = ?auto_380566 ?auto_380567 ) ) ( not ( = ?auto_380566 ?auto_380568 ) ) ( not ( = ?auto_380567 ?auto_380568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_380567 ?auto_380568 )
      ( !STACK ?auto_380567 ?auto_380566 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380584 - BLOCK
      ?auto_380585 - BLOCK
      ?auto_380586 - BLOCK
      ?auto_380587 - BLOCK
      ?auto_380588 - BLOCK
      ?auto_380589 - BLOCK
      ?auto_380590 - BLOCK
      ?auto_380591 - BLOCK
      ?auto_380592 - BLOCK
      ?auto_380593 - BLOCK
      ?auto_380594 - BLOCK
      ?auto_380595 - BLOCK
      ?auto_380596 - BLOCK
      ?auto_380597 - BLOCK
      ?auto_380598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_380597 ) ( ON-TABLE ?auto_380598 ) ( CLEAR ?auto_380598 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_380584 ) ( ON ?auto_380585 ?auto_380584 ) ( ON ?auto_380586 ?auto_380585 ) ( ON ?auto_380587 ?auto_380586 ) ( ON ?auto_380588 ?auto_380587 ) ( ON ?auto_380589 ?auto_380588 ) ( ON ?auto_380590 ?auto_380589 ) ( ON ?auto_380591 ?auto_380590 ) ( ON ?auto_380592 ?auto_380591 ) ( ON ?auto_380593 ?auto_380592 ) ( ON ?auto_380594 ?auto_380593 ) ( ON ?auto_380595 ?auto_380594 ) ( ON ?auto_380596 ?auto_380595 ) ( ON ?auto_380597 ?auto_380596 ) ( not ( = ?auto_380584 ?auto_380585 ) ) ( not ( = ?auto_380584 ?auto_380586 ) ) ( not ( = ?auto_380584 ?auto_380587 ) ) ( not ( = ?auto_380584 ?auto_380588 ) ) ( not ( = ?auto_380584 ?auto_380589 ) ) ( not ( = ?auto_380584 ?auto_380590 ) ) ( not ( = ?auto_380584 ?auto_380591 ) ) ( not ( = ?auto_380584 ?auto_380592 ) ) ( not ( = ?auto_380584 ?auto_380593 ) ) ( not ( = ?auto_380584 ?auto_380594 ) ) ( not ( = ?auto_380584 ?auto_380595 ) ) ( not ( = ?auto_380584 ?auto_380596 ) ) ( not ( = ?auto_380584 ?auto_380597 ) ) ( not ( = ?auto_380584 ?auto_380598 ) ) ( not ( = ?auto_380585 ?auto_380586 ) ) ( not ( = ?auto_380585 ?auto_380587 ) ) ( not ( = ?auto_380585 ?auto_380588 ) ) ( not ( = ?auto_380585 ?auto_380589 ) ) ( not ( = ?auto_380585 ?auto_380590 ) ) ( not ( = ?auto_380585 ?auto_380591 ) ) ( not ( = ?auto_380585 ?auto_380592 ) ) ( not ( = ?auto_380585 ?auto_380593 ) ) ( not ( = ?auto_380585 ?auto_380594 ) ) ( not ( = ?auto_380585 ?auto_380595 ) ) ( not ( = ?auto_380585 ?auto_380596 ) ) ( not ( = ?auto_380585 ?auto_380597 ) ) ( not ( = ?auto_380585 ?auto_380598 ) ) ( not ( = ?auto_380586 ?auto_380587 ) ) ( not ( = ?auto_380586 ?auto_380588 ) ) ( not ( = ?auto_380586 ?auto_380589 ) ) ( not ( = ?auto_380586 ?auto_380590 ) ) ( not ( = ?auto_380586 ?auto_380591 ) ) ( not ( = ?auto_380586 ?auto_380592 ) ) ( not ( = ?auto_380586 ?auto_380593 ) ) ( not ( = ?auto_380586 ?auto_380594 ) ) ( not ( = ?auto_380586 ?auto_380595 ) ) ( not ( = ?auto_380586 ?auto_380596 ) ) ( not ( = ?auto_380586 ?auto_380597 ) ) ( not ( = ?auto_380586 ?auto_380598 ) ) ( not ( = ?auto_380587 ?auto_380588 ) ) ( not ( = ?auto_380587 ?auto_380589 ) ) ( not ( = ?auto_380587 ?auto_380590 ) ) ( not ( = ?auto_380587 ?auto_380591 ) ) ( not ( = ?auto_380587 ?auto_380592 ) ) ( not ( = ?auto_380587 ?auto_380593 ) ) ( not ( = ?auto_380587 ?auto_380594 ) ) ( not ( = ?auto_380587 ?auto_380595 ) ) ( not ( = ?auto_380587 ?auto_380596 ) ) ( not ( = ?auto_380587 ?auto_380597 ) ) ( not ( = ?auto_380587 ?auto_380598 ) ) ( not ( = ?auto_380588 ?auto_380589 ) ) ( not ( = ?auto_380588 ?auto_380590 ) ) ( not ( = ?auto_380588 ?auto_380591 ) ) ( not ( = ?auto_380588 ?auto_380592 ) ) ( not ( = ?auto_380588 ?auto_380593 ) ) ( not ( = ?auto_380588 ?auto_380594 ) ) ( not ( = ?auto_380588 ?auto_380595 ) ) ( not ( = ?auto_380588 ?auto_380596 ) ) ( not ( = ?auto_380588 ?auto_380597 ) ) ( not ( = ?auto_380588 ?auto_380598 ) ) ( not ( = ?auto_380589 ?auto_380590 ) ) ( not ( = ?auto_380589 ?auto_380591 ) ) ( not ( = ?auto_380589 ?auto_380592 ) ) ( not ( = ?auto_380589 ?auto_380593 ) ) ( not ( = ?auto_380589 ?auto_380594 ) ) ( not ( = ?auto_380589 ?auto_380595 ) ) ( not ( = ?auto_380589 ?auto_380596 ) ) ( not ( = ?auto_380589 ?auto_380597 ) ) ( not ( = ?auto_380589 ?auto_380598 ) ) ( not ( = ?auto_380590 ?auto_380591 ) ) ( not ( = ?auto_380590 ?auto_380592 ) ) ( not ( = ?auto_380590 ?auto_380593 ) ) ( not ( = ?auto_380590 ?auto_380594 ) ) ( not ( = ?auto_380590 ?auto_380595 ) ) ( not ( = ?auto_380590 ?auto_380596 ) ) ( not ( = ?auto_380590 ?auto_380597 ) ) ( not ( = ?auto_380590 ?auto_380598 ) ) ( not ( = ?auto_380591 ?auto_380592 ) ) ( not ( = ?auto_380591 ?auto_380593 ) ) ( not ( = ?auto_380591 ?auto_380594 ) ) ( not ( = ?auto_380591 ?auto_380595 ) ) ( not ( = ?auto_380591 ?auto_380596 ) ) ( not ( = ?auto_380591 ?auto_380597 ) ) ( not ( = ?auto_380591 ?auto_380598 ) ) ( not ( = ?auto_380592 ?auto_380593 ) ) ( not ( = ?auto_380592 ?auto_380594 ) ) ( not ( = ?auto_380592 ?auto_380595 ) ) ( not ( = ?auto_380592 ?auto_380596 ) ) ( not ( = ?auto_380592 ?auto_380597 ) ) ( not ( = ?auto_380592 ?auto_380598 ) ) ( not ( = ?auto_380593 ?auto_380594 ) ) ( not ( = ?auto_380593 ?auto_380595 ) ) ( not ( = ?auto_380593 ?auto_380596 ) ) ( not ( = ?auto_380593 ?auto_380597 ) ) ( not ( = ?auto_380593 ?auto_380598 ) ) ( not ( = ?auto_380594 ?auto_380595 ) ) ( not ( = ?auto_380594 ?auto_380596 ) ) ( not ( = ?auto_380594 ?auto_380597 ) ) ( not ( = ?auto_380594 ?auto_380598 ) ) ( not ( = ?auto_380595 ?auto_380596 ) ) ( not ( = ?auto_380595 ?auto_380597 ) ) ( not ( = ?auto_380595 ?auto_380598 ) ) ( not ( = ?auto_380596 ?auto_380597 ) ) ( not ( = ?auto_380596 ?auto_380598 ) ) ( not ( = ?auto_380597 ?auto_380598 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_380598 )
      ( !STACK ?auto_380598 ?auto_380597 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380614 - BLOCK
      ?auto_380615 - BLOCK
      ?auto_380616 - BLOCK
      ?auto_380617 - BLOCK
      ?auto_380618 - BLOCK
      ?auto_380619 - BLOCK
      ?auto_380620 - BLOCK
      ?auto_380621 - BLOCK
      ?auto_380622 - BLOCK
      ?auto_380623 - BLOCK
      ?auto_380624 - BLOCK
      ?auto_380625 - BLOCK
      ?auto_380626 - BLOCK
      ?auto_380627 - BLOCK
      ?auto_380628 - BLOCK
    )
    :vars
    (
      ?auto_380629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380628 ?auto_380629 ) ( ON-TABLE ?auto_380614 ) ( ON ?auto_380615 ?auto_380614 ) ( ON ?auto_380616 ?auto_380615 ) ( ON ?auto_380617 ?auto_380616 ) ( ON ?auto_380618 ?auto_380617 ) ( ON ?auto_380619 ?auto_380618 ) ( ON ?auto_380620 ?auto_380619 ) ( ON ?auto_380621 ?auto_380620 ) ( ON ?auto_380622 ?auto_380621 ) ( ON ?auto_380623 ?auto_380622 ) ( ON ?auto_380624 ?auto_380623 ) ( ON ?auto_380625 ?auto_380624 ) ( ON ?auto_380626 ?auto_380625 ) ( not ( = ?auto_380614 ?auto_380615 ) ) ( not ( = ?auto_380614 ?auto_380616 ) ) ( not ( = ?auto_380614 ?auto_380617 ) ) ( not ( = ?auto_380614 ?auto_380618 ) ) ( not ( = ?auto_380614 ?auto_380619 ) ) ( not ( = ?auto_380614 ?auto_380620 ) ) ( not ( = ?auto_380614 ?auto_380621 ) ) ( not ( = ?auto_380614 ?auto_380622 ) ) ( not ( = ?auto_380614 ?auto_380623 ) ) ( not ( = ?auto_380614 ?auto_380624 ) ) ( not ( = ?auto_380614 ?auto_380625 ) ) ( not ( = ?auto_380614 ?auto_380626 ) ) ( not ( = ?auto_380614 ?auto_380627 ) ) ( not ( = ?auto_380614 ?auto_380628 ) ) ( not ( = ?auto_380614 ?auto_380629 ) ) ( not ( = ?auto_380615 ?auto_380616 ) ) ( not ( = ?auto_380615 ?auto_380617 ) ) ( not ( = ?auto_380615 ?auto_380618 ) ) ( not ( = ?auto_380615 ?auto_380619 ) ) ( not ( = ?auto_380615 ?auto_380620 ) ) ( not ( = ?auto_380615 ?auto_380621 ) ) ( not ( = ?auto_380615 ?auto_380622 ) ) ( not ( = ?auto_380615 ?auto_380623 ) ) ( not ( = ?auto_380615 ?auto_380624 ) ) ( not ( = ?auto_380615 ?auto_380625 ) ) ( not ( = ?auto_380615 ?auto_380626 ) ) ( not ( = ?auto_380615 ?auto_380627 ) ) ( not ( = ?auto_380615 ?auto_380628 ) ) ( not ( = ?auto_380615 ?auto_380629 ) ) ( not ( = ?auto_380616 ?auto_380617 ) ) ( not ( = ?auto_380616 ?auto_380618 ) ) ( not ( = ?auto_380616 ?auto_380619 ) ) ( not ( = ?auto_380616 ?auto_380620 ) ) ( not ( = ?auto_380616 ?auto_380621 ) ) ( not ( = ?auto_380616 ?auto_380622 ) ) ( not ( = ?auto_380616 ?auto_380623 ) ) ( not ( = ?auto_380616 ?auto_380624 ) ) ( not ( = ?auto_380616 ?auto_380625 ) ) ( not ( = ?auto_380616 ?auto_380626 ) ) ( not ( = ?auto_380616 ?auto_380627 ) ) ( not ( = ?auto_380616 ?auto_380628 ) ) ( not ( = ?auto_380616 ?auto_380629 ) ) ( not ( = ?auto_380617 ?auto_380618 ) ) ( not ( = ?auto_380617 ?auto_380619 ) ) ( not ( = ?auto_380617 ?auto_380620 ) ) ( not ( = ?auto_380617 ?auto_380621 ) ) ( not ( = ?auto_380617 ?auto_380622 ) ) ( not ( = ?auto_380617 ?auto_380623 ) ) ( not ( = ?auto_380617 ?auto_380624 ) ) ( not ( = ?auto_380617 ?auto_380625 ) ) ( not ( = ?auto_380617 ?auto_380626 ) ) ( not ( = ?auto_380617 ?auto_380627 ) ) ( not ( = ?auto_380617 ?auto_380628 ) ) ( not ( = ?auto_380617 ?auto_380629 ) ) ( not ( = ?auto_380618 ?auto_380619 ) ) ( not ( = ?auto_380618 ?auto_380620 ) ) ( not ( = ?auto_380618 ?auto_380621 ) ) ( not ( = ?auto_380618 ?auto_380622 ) ) ( not ( = ?auto_380618 ?auto_380623 ) ) ( not ( = ?auto_380618 ?auto_380624 ) ) ( not ( = ?auto_380618 ?auto_380625 ) ) ( not ( = ?auto_380618 ?auto_380626 ) ) ( not ( = ?auto_380618 ?auto_380627 ) ) ( not ( = ?auto_380618 ?auto_380628 ) ) ( not ( = ?auto_380618 ?auto_380629 ) ) ( not ( = ?auto_380619 ?auto_380620 ) ) ( not ( = ?auto_380619 ?auto_380621 ) ) ( not ( = ?auto_380619 ?auto_380622 ) ) ( not ( = ?auto_380619 ?auto_380623 ) ) ( not ( = ?auto_380619 ?auto_380624 ) ) ( not ( = ?auto_380619 ?auto_380625 ) ) ( not ( = ?auto_380619 ?auto_380626 ) ) ( not ( = ?auto_380619 ?auto_380627 ) ) ( not ( = ?auto_380619 ?auto_380628 ) ) ( not ( = ?auto_380619 ?auto_380629 ) ) ( not ( = ?auto_380620 ?auto_380621 ) ) ( not ( = ?auto_380620 ?auto_380622 ) ) ( not ( = ?auto_380620 ?auto_380623 ) ) ( not ( = ?auto_380620 ?auto_380624 ) ) ( not ( = ?auto_380620 ?auto_380625 ) ) ( not ( = ?auto_380620 ?auto_380626 ) ) ( not ( = ?auto_380620 ?auto_380627 ) ) ( not ( = ?auto_380620 ?auto_380628 ) ) ( not ( = ?auto_380620 ?auto_380629 ) ) ( not ( = ?auto_380621 ?auto_380622 ) ) ( not ( = ?auto_380621 ?auto_380623 ) ) ( not ( = ?auto_380621 ?auto_380624 ) ) ( not ( = ?auto_380621 ?auto_380625 ) ) ( not ( = ?auto_380621 ?auto_380626 ) ) ( not ( = ?auto_380621 ?auto_380627 ) ) ( not ( = ?auto_380621 ?auto_380628 ) ) ( not ( = ?auto_380621 ?auto_380629 ) ) ( not ( = ?auto_380622 ?auto_380623 ) ) ( not ( = ?auto_380622 ?auto_380624 ) ) ( not ( = ?auto_380622 ?auto_380625 ) ) ( not ( = ?auto_380622 ?auto_380626 ) ) ( not ( = ?auto_380622 ?auto_380627 ) ) ( not ( = ?auto_380622 ?auto_380628 ) ) ( not ( = ?auto_380622 ?auto_380629 ) ) ( not ( = ?auto_380623 ?auto_380624 ) ) ( not ( = ?auto_380623 ?auto_380625 ) ) ( not ( = ?auto_380623 ?auto_380626 ) ) ( not ( = ?auto_380623 ?auto_380627 ) ) ( not ( = ?auto_380623 ?auto_380628 ) ) ( not ( = ?auto_380623 ?auto_380629 ) ) ( not ( = ?auto_380624 ?auto_380625 ) ) ( not ( = ?auto_380624 ?auto_380626 ) ) ( not ( = ?auto_380624 ?auto_380627 ) ) ( not ( = ?auto_380624 ?auto_380628 ) ) ( not ( = ?auto_380624 ?auto_380629 ) ) ( not ( = ?auto_380625 ?auto_380626 ) ) ( not ( = ?auto_380625 ?auto_380627 ) ) ( not ( = ?auto_380625 ?auto_380628 ) ) ( not ( = ?auto_380625 ?auto_380629 ) ) ( not ( = ?auto_380626 ?auto_380627 ) ) ( not ( = ?auto_380626 ?auto_380628 ) ) ( not ( = ?auto_380626 ?auto_380629 ) ) ( not ( = ?auto_380627 ?auto_380628 ) ) ( not ( = ?auto_380627 ?auto_380629 ) ) ( not ( = ?auto_380628 ?auto_380629 ) ) ( CLEAR ?auto_380626 ) ( ON ?auto_380627 ?auto_380628 ) ( CLEAR ?auto_380627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_380614 ?auto_380615 ?auto_380616 ?auto_380617 ?auto_380618 ?auto_380619 ?auto_380620 ?auto_380621 ?auto_380622 ?auto_380623 ?auto_380624 ?auto_380625 ?auto_380626 ?auto_380627 )
      ( MAKE-15PILE ?auto_380614 ?auto_380615 ?auto_380616 ?auto_380617 ?auto_380618 ?auto_380619 ?auto_380620 ?auto_380621 ?auto_380622 ?auto_380623 ?auto_380624 ?auto_380625 ?auto_380626 ?auto_380627 ?auto_380628 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380645 - BLOCK
      ?auto_380646 - BLOCK
      ?auto_380647 - BLOCK
      ?auto_380648 - BLOCK
      ?auto_380649 - BLOCK
      ?auto_380650 - BLOCK
      ?auto_380651 - BLOCK
      ?auto_380652 - BLOCK
      ?auto_380653 - BLOCK
      ?auto_380654 - BLOCK
      ?auto_380655 - BLOCK
      ?auto_380656 - BLOCK
      ?auto_380657 - BLOCK
      ?auto_380658 - BLOCK
      ?auto_380659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_380659 ) ( ON-TABLE ?auto_380645 ) ( ON ?auto_380646 ?auto_380645 ) ( ON ?auto_380647 ?auto_380646 ) ( ON ?auto_380648 ?auto_380647 ) ( ON ?auto_380649 ?auto_380648 ) ( ON ?auto_380650 ?auto_380649 ) ( ON ?auto_380651 ?auto_380650 ) ( ON ?auto_380652 ?auto_380651 ) ( ON ?auto_380653 ?auto_380652 ) ( ON ?auto_380654 ?auto_380653 ) ( ON ?auto_380655 ?auto_380654 ) ( ON ?auto_380656 ?auto_380655 ) ( ON ?auto_380657 ?auto_380656 ) ( not ( = ?auto_380645 ?auto_380646 ) ) ( not ( = ?auto_380645 ?auto_380647 ) ) ( not ( = ?auto_380645 ?auto_380648 ) ) ( not ( = ?auto_380645 ?auto_380649 ) ) ( not ( = ?auto_380645 ?auto_380650 ) ) ( not ( = ?auto_380645 ?auto_380651 ) ) ( not ( = ?auto_380645 ?auto_380652 ) ) ( not ( = ?auto_380645 ?auto_380653 ) ) ( not ( = ?auto_380645 ?auto_380654 ) ) ( not ( = ?auto_380645 ?auto_380655 ) ) ( not ( = ?auto_380645 ?auto_380656 ) ) ( not ( = ?auto_380645 ?auto_380657 ) ) ( not ( = ?auto_380645 ?auto_380658 ) ) ( not ( = ?auto_380645 ?auto_380659 ) ) ( not ( = ?auto_380646 ?auto_380647 ) ) ( not ( = ?auto_380646 ?auto_380648 ) ) ( not ( = ?auto_380646 ?auto_380649 ) ) ( not ( = ?auto_380646 ?auto_380650 ) ) ( not ( = ?auto_380646 ?auto_380651 ) ) ( not ( = ?auto_380646 ?auto_380652 ) ) ( not ( = ?auto_380646 ?auto_380653 ) ) ( not ( = ?auto_380646 ?auto_380654 ) ) ( not ( = ?auto_380646 ?auto_380655 ) ) ( not ( = ?auto_380646 ?auto_380656 ) ) ( not ( = ?auto_380646 ?auto_380657 ) ) ( not ( = ?auto_380646 ?auto_380658 ) ) ( not ( = ?auto_380646 ?auto_380659 ) ) ( not ( = ?auto_380647 ?auto_380648 ) ) ( not ( = ?auto_380647 ?auto_380649 ) ) ( not ( = ?auto_380647 ?auto_380650 ) ) ( not ( = ?auto_380647 ?auto_380651 ) ) ( not ( = ?auto_380647 ?auto_380652 ) ) ( not ( = ?auto_380647 ?auto_380653 ) ) ( not ( = ?auto_380647 ?auto_380654 ) ) ( not ( = ?auto_380647 ?auto_380655 ) ) ( not ( = ?auto_380647 ?auto_380656 ) ) ( not ( = ?auto_380647 ?auto_380657 ) ) ( not ( = ?auto_380647 ?auto_380658 ) ) ( not ( = ?auto_380647 ?auto_380659 ) ) ( not ( = ?auto_380648 ?auto_380649 ) ) ( not ( = ?auto_380648 ?auto_380650 ) ) ( not ( = ?auto_380648 ?auto_380651 ) ) ( not ( = ?auto_380648 ?auto_380652 ) ) ( not ( = ?auto_380648 ?auto_380653 ) ) ( not ( = ?auto_380648 ?auto_380654 ) ) ( not ( = ?auto_380648 ?auto_380655 ) ) ( not ( = ?auto_380648 ?auto_380656 ) ) ( not ( = ?auto_380648 ?auto_380657 ) ) ( not ( = ?auto_380648 ?auto_380658 ) ) ( not ( = ?auto_380648 ?auto_380659 ) ) ( not ( = ?auto_380649 ?auto_380650 ) ) ( not ( = ?auto_380649 ?auto_380651 ) ) ( not ( = ?auto_380649 ?auto_380652 ) ) ( not ( = ?auto_380649 ?auto_380653 ) ) ( not ( = ?auto_380649 ?auto_380654 ) ) ( not ( = ?auto_380649 ?auto_380655 ) ) ( not ( = ?auto_380649 ?auto_380656 ) ) ( not ( = ?auto_380649 ?auto_380657 ) ) ( not ( = ?auto_380649 ?auto_380658 ) ) ( not ( = ?auto_380649 ?auto_380659 ) ) ( not ( = ?auto_380650 ?auto_380651 ) ) ( not ( = ?auto_380650 ?auto_380652 ) ) ( not ( = ?auto_380650 ?auto_380653 ) ) ( not ( = ?auto_380650 ?auto_380654 ) ) ( not ( = ?auto_380650 ?auto_380655 ) ) ( not ( = ?auto_380650 ?auto_380656 ) ) ( not ( = ?auto_380650 ?auto_380657 ) ) ( not ( = ?auto_380650 ?auto_380658 ) ) ( not ( = ?auto_380650 ?auto_380659 ) ) ( not ( = ?auto_380651 ?auto_380652 ) ) ( not ( = ?auto_380651 ?auto_380653 ) ) ( not ( = ?auto_380651 ?auto_380654 ) ) ( not ( = ?auto_380651 ?auto_380655 ) ) ( not ( = ?auto_380651 ?auto_380656 ) ) ( not ( = ?auto_380651 ?auto_380657 ) ) ( not ( = ?auto_380651 ?auto_380658 ) ) ( not ( = ?auto_380651 ?auto_380659 ) ) ( not ( = ?auto_380652 ?auto_380653 ) ) ( not ( = ?auto_380652 ?auto_380654 ) ) ( not ( = ?auto_380652 ?auto_380655 ) ) ( not ( = ?auto_380652 ?auto_380656 ) ) ( not ( = ?auto_380652 ?auto_380657 ) ) ( not ( = ?auto_380652 ?auto_380658 ) ) ( not ( = ?auto_380652 ?auto_380659 ) ) ( not ( = ?auto_380653 ?auto_380654 ) ) ( not ( = ?auto_380653 ?auto_380655 ) ) ( not ( = ?auto_380653 ?auto_380656 ) ) ( not ( = ?auto_380653 ?auto_380657 ) ) ( not ( = ?auto_380653 ?auto_380658 ) ) ( not ( = ?auto_380653 ?auto_380659 ) ) ( not ( = ?auto_380654 ?auto_380655 ) ) ( not ( = ?auto_380654 ?auto_380656 ) ) ( not ( = ?auto_380654 ?auto_380657 ) ) ( not ( = ?auto_380654 ?auto_380658 ) ) ( not ( = ?auto_380654 ?auto_380659 ) ) ( not ( = ?auto_380655 ?auto_380656 ) ) ( not ( = ?auto_380655 ?auto_380657 ) ) ( not ( = ?auto_380655 ?auto_380658 ) ) ( not ( = ?auto_380655 ?auto_380659 ) ) ( not ( = ?auto_380656 ?auto_380657 ) ) ( not ( = ?auto_380656 ?auto_380658 ) ) ( not ( = ?auto_380656 ?auto_380659 ) ) ( not ( = ?auto_380657 ?auto_380658 ) ) ( not ( = ?auto_380657 ?auto_380659 ) ) ( not ( = ?auto_380658 ?auto_380659 ) ) ( CLEAR ?auto_380657 ) ( ON ?auto_380658 ?auto_380659 ) ( CLEAR ?auto_380658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_380645 ?auto_380646 ?auto_380647 ?auto_380648 ?auto_380649 ?auto_380650 ?auto_380651 ?auto_380652 ?auto_380653 ?auto_380654 ?auto_380655 ?auto_380656 ?auto_380657 ?auto_380658 )
      ( MAKE-15PILE ?auto_380645 ?auto_380646 ?auto_380647 ?auto_380648 ?auto_380649 ?auto_380650 ?auto_380651 ?auto_380652 ?auto_380653 ?auto_380654 ?auto_380655 ?auto_380656 ?auto_380657 ?auto_380658 ?auto_380659 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380675 - BLOCK
      ?auto_380676 - BLOCK
      ?auto_380677 - BLOCK
      ?auto_380678 - BLOCK
      ?auto_380679 - BLOCK
      ?auto_380680 - BLOCK
      ?auto_380681 - BLOCK
      ?auto_380682 - BLOCK
      ?auto_380683 - BLOCK
      ?auto_380684 - BLOCK
      ?auto_380685 - BLOCK
      ?auto_380686 - BLOCK
      ?auto_380687 - BLOCK
      ?auto_380688 - BLOCK
      ?auto_380689 - BLOCK
    )
    :vars
    (
      ?auto_380690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380689 ?auto_380690 ) ( ON-TABLE ?auto_380675 ) ( ON ?auto_380676 ?auto_380675 ) ( ON ?auto_380677 ?auto_380676 ) ( ON ?auto_380678 ?auto_380677 ) ( ON ?auto_380679 ?auto_380678 ) ( ON ?auto_380680 ?auto_380679 ) ( ON ?auto_380681 ?auto_380680 ) ( ON ?auto_380682 ?auto_380681 ) ( ON ?auto_380683 ?auto_380682 ) ( ON ?auto_380684 ?auto_380683 ) ( ON ?auto_380685 ?auto_380684 ) ( ON ?auto_380686 ?auto_380685 ) ( not ( = ?auto_380675 ?auto_380676 ) ) ( not ( = ?auto_380675 ?auto_380677 ) ) ( not ( = ?auto_380675 ?auto_380678 ) ) ( not ( = ?auto_380675 ?auto_380679 ) ) ( not ( = ?auto_380675 ?auto_380680 ) ) ( not ( = ?auto_380675 ?auto_380681 ) ) ( not ( = ?auto_380675 ?auto_380682 ) ) ( not ( = ?auto_380675 ?auto_380683 ) ) ( not ( = ?auto_380675 ?auto_380684 ) ) ( not ( = ?auto_380675 ?auto_380685 ) ) ( not ( = ?auto_380675 ?auto_380686 ) ) ( not ( = ?auto_380675 ?auto_380687 ) ) ( not ( = ?auto_380675 ?auto_380688 ) ) ( not ( = ?auto_380675 ?auto_380689 ) ) ( not ( = ?auto_380675 ?auto_380690 ) ) ( not ( = ?auto_380676 ?auto_380677 ) ) ( not ( = ?auto_380676 ?auto_380678 ) ) ( not ( = ?auto_380676 ?auto_380679 ) ) ( not ( = ?auto_380676 ?auto_380680 ) ) ( not ( = ?auto_380676 ?auto_380681 ) ) ( not ( = ?auto_380676 ?auto_380682 ) ) ( not ( = ?auto_380676 ?auto_380683 ) ) ( not ( = ?auto_380676 ?auto_380684 ) ) ( not ( = ?auto_380676 ?auto_380685 ) ) ( not ( = ?auto_380676 ?auto_380686 ) ) ( not ( = ?auto_380676 ?auto_380687 ) ) ( not ( = ?auto_380676 ?auto_380688 ) ) ( not ( = ?auto_380676 ?auto_380689 ) ) ( not ( = ?auto_380676 ?auto_380690 ) ) ( not ( = ?auto_380677 ?auto_380678 ) ) ( not ( = ?auto_380677 ?auto_380679 ) ) ( not ( = ?auto_380677 ?auto_380680 ) ) ( not ( = ?auto_380677 ?auto_380681 ) ) ( not ( = ?auto_380677 ?auto_380682 ) ) ( not ( = ?auto_380677 ?auto_380683 ) ) ( not ( = ?auto_380677 ?auto_380684 ) ) ( not ( = ?auto_380677 ?auto_380685 ) ) ( not ( = ?auto_380677 ?auto_380686 ) ) ( not ( = ?auto_380677 ?auto_380687 ) ) ( not ( = ?auto_380677 ?auto_380688 ) ) ( not ( = ?auto_380677 ?auto_380689 ) ) ( not ( = ?auto_380677 ?auto_380690 ) ) ( not ( = ?auto_380678 ?auto_380679 ) ) ( not ( = ?auto_380678 ?auto_380680 ) ) ( not ( = ?auto_380678 ?auto_380681 ) ) ( not ( = ?auto_380678 ?auto_380682 ) ) ( not ( = ?auto_380678 ?auto_380683 ) ) ( not ( = ?auto_380678 ?auto_380684 ) ) ( not ( = ?auto_380678 ?auto_380685 ) ) ( not ( = ?auto_380678 ?auto_380686 ) ) ( not ( = ?auto_380678 ?auto_380687 ) ) ( not ( = ?auto_380678 ?auto_380688 ) ) ( not ( = ?auto_380678 ?auto_380689 ) ) ( not ( = ?auto_380678 ?auto_380690 ) ) ( not ( = ?auto_380679 ?auto_380680 ) ) ( not ( = ?auto_380679 ?auto_380681 ) ) ( not ( = ?auto_380679 ?auto_380682 ) ) ( not ( = ?auto_380679 ?auto_380683 ) ) ( not ( = ?auto_380679 ?auto_380684 ) ) ( not ( = ?auto_380679 ?auto_380685 ) ) ( not ( = ?auto_380679 ?auto_380686 ) ) ( not ( = ?auto_380679 ?auto_380687 ) ) ( not ( = ?auto_380679 ?auto_380688 ) ) ( not ( = ?auto_380679 ?auto_380689 ) ) ( not ( = ?auto_380679 ?auto_380690 ) ) ( not ( = ?auto_380680 ?auto_380681 ) ) ( not ( = ?auto_380680 ?auto_380682 ) ) ( not ( = ?auto_380680 ?auto_380683 ) ) ( not ( = ?auto_380680 ?auto_380684 ) ) ( not ( = ?auto_380680 ?auto_380685 ) ) ( not ( = ?auto_380680 ?auto_380686 ) ) ( not ( = ?auto_380680 ?auto_380687 ) ) ( not ( = ?auto_380680 ?auto_380688 ) ) ( not ( = ?auto_380680 ?auto_380689 ) ) ( not ( = ?auto_380680 ?auto_380690 ) ) ( not ( = ?auto_380681 ?auto_380682 ) ) ( not ( = ?auto_380681 ?auto_380683 ) ) ( not ( = ?auto_380681 ?auto_380684 ) ) ( not ( = ?auto_380681 ?auto_380685 ) ) ( not ( = ?auto_380681 ?auto_380686 ) ) ( not ( = ?auto_380681 ?auto_380687 ) ) ( not ( = ?auto_380681 ?auto_380688 ) ) ( not ( = ?auto_380681 ?auto_380689 ) ) ( not ( = ?auto_380681 ?auto_380690 ) ) ( not ( = ?auto_380682 ?auto_380683 ) ) ( not ( = ?auto_380682 ?auto_380684 ) ) ( not ( = ?auto_380682 ?auto_380685 ) ) ( not ( = ?auto_380682 ?auto_380686 ) ) ( not ( = ?auto_380682 ?auto_380687 ) ) ( not ( = ?auto_380682 ?auto_380688 ) ) ( not ( = ?auto_380682 ?auto_380689 ) ) ( not ( = ?auto_380682 ?auto_380690 ) ) ( not ( = ?auto_380683 ?auto_380684 ) ) ( not ( = ?auto_380683 ?auto_380685 ) ) ( not ( = ?auto_380683 ?auto_380686 ) ) ( not ( = ?auto_380683 ?auto_380687 ) ) ( not ( = ?auto_380683 ?auto_380688 ) ) ( not ( = ?auto_380683 ?auto_380689 ) ) ( not ( = ?auto_380683 ?auto_380690 ) ) ( not ( = ?auto_380684 ?auto_380685 ) ) ( not ( = ?auto_380684 ?auto_380686 ) ) ( not ( = ?auto_380684 ?auto_380687 ) ) ( not ( = ?auto_380684 ?auto_380688 ) ) ( not ( = ?auto_380684 ?auto_380689 ) ) ( not ( = ?auto_380684 ?auto_380690 ) ) ( not ( = ?auto_380685 ?auto_380686 ) ) ( not ( = ?auto_380685 ?auto_380687 ) ) ( not ( = ?auto_380685 ?auto_380688 ) ) ( not ( = ?auto_380685 ?auto_380689 ) ) ( not ( = ?auto_380685 ?auto_380690 ) ) ( not ( = ?auto_380686 ?auto_380687 ) ) ( not ( = ?auto_380686 ?auto_380688 ) ) ( not ( = ?auto_380686 ?auto_380689 ) ) ( not ( = ?auto_380686 ?auto_380690 ) ) ( not ( = ?auto_380687 ?auto_380688 ) ) ( not ( = ?auto_380687 ?auto_380689 ) ) ( not ( = ?auto_380687 ?auto_380690 ) ) ( not ( = ?auto_380688 ?auto_380689 ) ) ( not ( = ?auto_380688 ?auto_380690 ) ) ( not ( = ?auto_380689 ?auto_380690 ) ) ( ON ?auto_380688 ?auto_380689 ) ( CLEAR ?auto_380686 ) ( ON ?auto_380687 ?auto_380688 ) ( CLEAR ?auto_380687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_380675 ?auto_380676 ?auto_380677 ?auto_380678 ?auto_380679 ?auto_380680 ?auto_380681 ?auto_380682 ?auto_380683 ?auto_380684 ?auto_380685 ?auto_380686 ?auto_380687 )
      ( MAKE-15PILE ?auto_380675 ?auto_380676 ?auto_380677 ?auto_380678 ?auto_380679 ?auto_380680 ?auto_380681 ?auto_380682 ?auto_380683 ?auto_380684 ?auto_380685 ?auto_380686 ?auto_380687 ?auto_380688 ?auto_380689 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380706 - BLOCK
      ?auto_380707 - BLOCK
      ?auto_380708 - BLOCK
      ?auto_380709 - BLOCK
      ?auto_380710 - BLOCK
      ?auto_380711 - BLOCK
      ?auto_380712 - BLOCK
      ?auto_380713 - BLOCK
      ?auto_380714 - BLOCK
      ?auto_380715 - BLOCK
      ?auto_380716 - BLOCK
      ?auto_380717 - BLOCK
      ?auto_380718 - BLOCK
      ?auto_380719 - BLOCK
      ?auto_380720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_380720 ) ( ON-TABLE ?auto_380706 ) ( ON ?auto_380707 ?auto_380706 ) ( ON ?auto_380708 ?auto_380707 ) ( ON ?auto_380709 ?auto_380708 ) ( ON ?auto_380710 ?auto_380709 ) ( ON ?auto_380711 ?auto_380710 ) ( ON ?auto_380712 ?auto_380711 ) ( ON ?auto_380713 ?auto_380712 ) ( ON ?auto_380714 ?auto_380713 ) ( ON ?auto_380715 ?auto_380714 ) ( ON ?auto_380716 ?auto_380715 ) ( ON ?auto_380717 ?auto_380716 ) ( not ( = ?auto_380706 ?auto_380707 ) ) ( not ( = ?auto_380706 ?auto_380708 ) ) ( not ( = ?auto_380706 ?auto_380709 ) ) ( not ( = ?auto_380706 ?auto_380710 ) ) ( not ( = ?auto_380706 ?auto_380711 ) ) ( not ( = ?auto_380706 ?auto_380712 ) ) ( not ( = ?auto_380706 ?auto_380713 ) ) ( not ( = ?auto_380706 ?auto_380714 ) ) ( not ( = ?auto_380706 ?auto_380715 ) ) ( not ( = ?auto_380706 ?auto_380716 ) ) ( not ( = ?auto_380706 ?auto_380717 ) ) ( not ( = ?auto_380706 ?auto_380718 ) ) ( not ( = ?auto_380706 ?auto_380719 ) ) ( not ( = ?auto_380706 ?auto_380720 ) ) ( not ( = ?auto_380707 ?auto_380708 ) ) ( not ( = ?auto_380707 ?auto_380709 ) ) ( not ( = ?auto_380707 ?auto_380710 ) ) ( not ( = ?auto_380707 ?auto_380711 ) ) ( not ( = ?auto_380707 ?auto_380712 ) ) ( not ( = ?auto_380707 ?auto_380713 ) ) ( not ( = ?auto_380707 ?auto_380714 ) ) ( not ( = ?auto_380707 ?auto_380715 ) ) ( not ( = ?auto_380707 ?auto_380716 ) ) ( not ( = ?auto_380707 ?auto_380717 ) ) ( not ( = ?auto_380707 ?auto_380718 ) ) ( not ( = ?auto_380707 ?auto_380719 ) ) ( not ( = ?auto_380707 ?auto_380720 ) ) ( not ( = ?auto_380708 ?auto_380709 ) ) ( not ( = ?auto_380708 ?auto_380710 ) ) ( not ( = ?auto_380708 ?auto_380711 ) ) ( not ( = ?auto_380708 ?auto_380712 ) ) ( not ( = ?auto_380708 ?auto_380713 ) ) ( not ( = ?auto_380708 ?auto_380714 ) ) ( not ( = ?auto_380708 ?auto_380715 ) ) ( not ( = ?auto_380708 ?auto_380716 ) ) ( not ( = ?auto_380708 ?auto_380717 ) ) ( not ( = ?auto_380708 ?auto_380718 ) ) ( not ( = ?auto_380708 ?auto_380719 ) ) ( not ( = ?auto_380708 ?auto_380720 ) ) ( not ( = ?auto_380709 ?auto_380710 ) ) ( not ( = ?auto_380709 ?auto_380711 ) ) ( not ( = ?auto_380709 ?auto_380712 ) ) ( not ( = ?auto_380709 ?auto_380713 ) ) ( not ( = ?auto_380709 ?auto_380714 ) ) ( not ( = ?auto_380709 ?auto_380715 ) ) ( not ( = ?auto_380709 ?auto_380716 ) ) ( not ( = ?auto_380709 ?auto_380717 ) ) ( not ( = ?auto_380709 ?auto_380718 ) ) ( not ( = ?auto_380709 ?auto_380719 ) ) ( not ( = ?auto_380709 ?auto_380720 ) ) ( not ( = ?auto_380710 ?auto_380711 ) ) ( not ( = ?auto_380710 ?auto_380712 ) ) ( not ( = ?auto_380710 ?auto_380713 ) ) ( not ( = ?auto_380710 ?auto_380714 ) ) ( not ( = ?auto_380710 ?auto_380715 ) ) ( not ( = ?auto_380710 ?auto_380716 ) ) ( not ( = ?auto_380710 ?auto_380717 ) ) ( not ( = ?auto_380710 ?auto_380718 ) ) ( not ( = ?auto_380710 ?auto_380719 ) ) ( not ( = ?auto_380710 ?auto_380720 ) ) ( not ( = ?auto_380711 ?auto_380712 ) ) ( not ( = ?auto_380711 ?auto_380713 ) ) ( not ( = ?auto_380711 ?auto_380714 ) ) ( not ( = ?auto_380711 ?auto_380715 ) ) ( not ( = ?auto_380711 ?auto_380716 ) ) ( not ( = ?auto_380711 ?auto_380717 ) ) ( not ( = ?auto_380711 ?auto_380718 ) ) ( not ( = ?auto_380711 ?auto_380719 ) ) ( not ( = ?auto_380711 ?auto_380720 ) ) ( not ( = ?auto_380712 ?auto_380713 ) ) ( not ( = ?auto_380712 ?auto_380714 ) ) ( not ( = ?auto_380712 ?auto_380715 ) ) ( not ( = ?auto_380712 ?auto_380716 ) ) ( not ( = ?auto_380712 ?auto_380717 ) ) ( not ( = ?auto_380712 ?auto_380718 ) ) ( not ( = ?auto_380712 ?auto_380719 ) ) ( not ( = ?auto_380712 ?auto_380720 ) ) ( not ( = ?auto_380713 ?auto_380714 ) ) ( not ( = ?auto_380713 ?auto_380715 ) ) ( not ( = ?auto_380713 ?auto_380716 ) ) ( not ( = ?auto_380713 ?auto_380717 ) ) ( not ( = ?auto_380713 ?auto_380718 ) ) ( not ( = ?auto_380713 ?auto_380719 ) ) ( not ( = ?auto_380713 ?auto_380720 ) ) ( not ( = ?auto_380714 ?auto_380715 ) ) ( not ( = ?auto_380714 ?auto_380716 ) ) ( not ( = ?auto_380714 ?auto_380717 ) ) ( not ( = ?auto_380714 ?auto_380718 ) ) ( not ( = ?auto_380714 ?auto_380719 ) ) ( not ( = ?auto_380714 ?auto_380720 ) ) ( not ( = ?auto_380715 ?auto_380716 ) ) ( not ( = ?auto_380715 ?auto_380717 ) ) ( not ( = ?auto_380715 ?auto_380718 ) ) ( not ( = ?auto_380715 ?auto_380719 ) ) ( not ( = ?auto_380715 ?auto_380720 ) ) ( not ( = ?auto_380716 ?auto_380717 ) ) ( not ( = ?auto_380716 ?auto_380718 ) ) ( not ( = ?auto_380716 ?auto_380719 ) ) ( not ( = ?auto_380716 ?auto_380720 ) ) ( not ( = ?auto_380717 ?auto_380718 ) ) ( not ( = ?auto_380717 ?auto_380719 ) ) ( not ( = ?auto_380717 ?auto_380720 ) ) ( not ( = ?auto_380718 ?auto_380719 ) ) ( not ( = ?auto_380718 ?auto_380720 ) ) ( not ( = ?auto_380719 ?auto_380720 ) ) ( ON ?auto_380719 ?auto_380720 ) ( CLEAR ?auto_380717 ) ( ON ?auto_380718 ?auto_380719 ) ( CLEAR ?auto_380718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_380706 ?auto_380707 ?auto_380708 ?auto_380709 ?auto_380710 ?auto_380711 ?auto_380712 ?auto_380713 ?auto_380714 ?auto_380715 ?auto_380716 ?auto_380717 ?auto_380718 )
      ( MAKE-15PILE ?auto_380706 ?auto_380707 ?auto_380708 ?auto_380709 ?auto_380710 ?auto_380711 ?auto_380712 ?auto_380713 ?auto_380714 ?auto_380715 ?auto_380716 ?auto_380717 ?auto_380718 ?auto_380719 ?auto_380720 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380736 - BLOCK
      ?auto_380737 - BLOCK
      ?auto_380738 - BLOCK
      ?auto_380739 - BLOCK
      ?auto_380740 - BLOCK
      ?auto_380741 - BLOCK
      ?auto_380742 - BLOCK
      ?auto_380743 - BLOCK
      ?auto_380744 - BLOCK
      ?auto_380745 - BLOCK
      ?auto_380746 - BLOCK
      ?auto_380747 - BLOCK
      ?auto_380748 - BLOCK
      ?auto_380749 - BLOCK
      ?auto_380750 - BLOCK
    )
    :vars
    (
      ?auto_380751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380750 ?auto_380751 ) ( ON-TABLE ?auto_380736 ) ( ON ?auto_380737 ?auto_380736 ) ( ON ?auto_380738 ?auto_380737 ) ( ON ?auto_380739 ?auto_380738 ) ( ON ?auto_380740 ?auto_380739 ) ( ON ?auto_380741 ?auto_380740 ) ( ON ?auto_380742 ?auto_380741 ) ( ON ?auto_380743 ?auto_380742 ) ( ON ?auto_380744 ?auto_380743 ) ( ON ?auto_380745 ?auto_380744 ) ( ON ?auto_380746 ?auto_380745 ) ( not ( = ?auto_380736 ?auto_380737 ) ) ( not ( = ?auto_380736 ?auto_380738 ) ) ( not ( = ?auto_380736 ?auto_380739 ) ) ( not ( = ?auto_380736 ?auto_380740 ) ) ( not ( = ?auto_380736 ?auto_380741 ) ) ( not ( = ?auto_380736 ?auto_380742 ) ) ( not ( = ?auto_380736 ?auto_380743 ) ) ( not ( = ?auto_380736 ?auto_380744 ) ) ( not ( = ?auto_380736 ?auto_380745 ) ) ( not ( = ?auto_380736 ?auto_380746 ) ) ( not ( = ?auto_380736 ?auto_380747 ) ) ( not ( = ?auto_380736 ?auto_380748 ) ) ( not ( = ?auto_380736 ?auto_380749 ) ) ( not ( = ?auto_380736 ?auto_380750 ) ) ( not ( = ?auto_380736 ?auto_380751 ) ) ( not ( = ?auto_380737 ?auto_380738 ) ) ( not ( = ?auto_380737 ?auto_380739 ) ) ( not ( = ?auto_380737 ?auto_380740 ) ) ( not ( = ?auto_380737 ?auto_380741 ) ) ( not ( = ?auto_380737 ?auto_380742 ) ) ( not ( = ?auto_380737 ?auto_380743 ) ) ( not ( = ?auto_380737 ?auto_380744 ) ) ( not ( = ?auto_380737 ?auto_380745 ) ) ( not ( = ?auto_380737 ?auto_380746 ) ) ( not ( = ?auto_380737 ?auto_380747 ) ) ( not ( = ?auto_380737 ?auto_380748 ) ) ( not ( = ?auto_380737 ?auto_380749 ) ) ( not ( = ?auto_380737 ?auto_380750 ) ) ( not ( = ?auto_380737 ?auto_380751 ) ) ( not ( = ?auto_380738 ?auto_380739 ) ) ( not ( = ?auto_380738 ?auto_380740 ) ) ( not ( = ?auto_380738 ?auto_380741 ) ) ( not ( = ?auto_380738 ?auto_380742 ) ) ( not ( = ?auto_380738 ?auto_380743 ) ) ( not ( = ?auto_380738 ?auto_380744 ) ) ( not ( = ?auto_380738 ?auto_380745 ) ) ( not ( = ?auto_380738 ?auto_380746 ) ) ( not ( = ?auto_380738 ?auto_380747 ) ) ( not ( = ?auto_380738 ?auto_380748 ) ) ( not ( = ?auto_380738 ?auto_380749 ) ) ( not ( = ?auto_380738 ?auto_380750 ) ) ( not ( = ?auto_380738 ?auto_380751 ) ) ( not ( = ?auto_380739 ?auto_380740 ) ) ( not ( = ?auto_380739 ?auto_380741 ) ) ( not ( = ?auto_380739 ?auto_380742 ) ) ( not ( = ?auto_380739 ?auto_380743 ) ) ( not ( = ?auto_380739 ?auto_380744 ) ) ( not ( = ?auto_380739 ?auto_380745 ) ) ( not ( = ?auto_380739 ?auto_380746 ) ) ( not ( = ?auto_380739 ?auto_380747 ) ) ( not ( = ?auto_380739 ?auto_380748 ) ) ( not ( = ?auto_380739 ?auto_380749 ) ) ( not ( = ?auto_380739 ?auto_380750 ) ) ( not ( = ?auto_380739 ?auto_380751 ) ) ( not ( = ?auto_380740 ?auto_380741 ) ) ( not ( = ?auto_380740 ?auto_380742 ) ) ( not ( = ?auto_380740 ?auto_380743 ) ) ( not ( = ?auto_380740 ?auto_380744 ) ) ( not ( = ?auto_380740 ?auto_380745 ) ) ( not ( = ?auto_380740 ?auto_380746 ) ) ( not ( = ?auto_380740 ?auto_380747 ) ) ( not ( = ?auto_380740 ?auto_380748 ) ) ( not ( = ?auto_380740 ?auto_380749 ) ) ( not ( = ?auto_380740 ?auto_380750 ) ) ( not ( = ?auto_380740 ?auto_380751 ) ) ( not ( = ?auto_380741 ?auto_380742 ) ) ( not ( = ?auto_380741 ?auto_380743 ) ) ( not ( = ?auto_380741 ?auto_380744 ) ) ( not ( = ?auto_380741 ?auto_380745 ) ) ( not ( = ?auto_380741 ?auto_380746 ) ) ( not ( = ?auto_380741 ?auto_380747 ) ) ( not ( = ?auto_380741 ?auto_380748 ) ) ( not ( = ?auto_380741 ?auto_380749 ) ) ( not ( = ?auto_380741 ?auto_380750 ) ) ( not ( = ?auto_380741 ?auto_380751 ) ) ( not ( = ?auto_380742 ?auto_380743 ) ) ( not ( = ?auto_380742 ?auto_380744 ) ) ( not ( = ?auto_380742 ?auto_380745 ) ) ( not ( = ?auto_380742 ?auto_380746 ) ) ( not ( = ?auto_380742 ?auto_380747 ) ) ( not ( = ?auto_380742 ?auto_380748 ) ) ( not ( = ?auto_380742 ?auto_380749 ) ) ( not ( = ?auto_380742 ?auto_380750 ) ) ( not ( = ?auto_380742 ?auto_380751 ) ) ( not ( = ?auto_380743 ?auto_380744 ) ) ( not ( = ?auto_380743 ?auto_380745 ) ) ( not ( = ?auto_380743 ?auto_380746 ) ) ( not ( = ?auto_380743 ?auto_380747 ) ) ( not ( = ?auto_380743 ?auto_380748 ) ) ( not ( = ?auto_380743 ?auto_380749 ) ) ( not ( = ?auto_380743 ?auto_380750 ) ) ( not ( = ?auto_380743 ?auto_380751 ) ) ( not ( = ?auto_380744 ?auto_380745 ) ) ( not ( = ?auto_380744 ?auto_380746 ) ) ( not ( = ?auto_380744 ?auto_380747 ) ) ( not ( = ?auto_380744 ?auto_380748 ) ) ( not ( = ?auto_380744 ?auto_380749 ) ) ( not ( = ?auto_380744 ?auto_380750 ) ) ( not ( = ?auto_380744 ?auto_380751 ) ) ( not ( = ?auto_380745 ?auto_380746 ) ) ( not ( = ?auto_380745 ?auto_380747 ) ) ( not ( = ?auto_380745 ?auto_380748 ) ) ( not ( = ?auto_380745 ?auto_380749 ) ) ( not ( = ?auto_380745 ?auto_380750 ) ) ( not ( = ?auto_380745 ?auto_380751 ) ) ( not ( = ?auto_380746 ?auto_380747 ) ) ( not ( = ?auto_380746 ?auto_380748 ) ) ( not ( = ?auto_380746 ?auto_380749 ) ) ( not ( = ?auto_380746 ?auto_380750 ) ) ( not ( = ?auto_380746 ?auto_380751 ) ) ( not ( = ?auto_380747 ?auto_380748 ) ) ( not ( = ?auto_380747 ?auto_380749 ) ) ( not ( = ?auto_380747 ?auto_380750 ) ) ( not ( = ?auto_380747 ?auto_380751 ) ) ( not ( = ?auto_380748 ?auto_380749 ) ) ( not ( = ?auto_380748 ?auto_380750 ) ) ( not ( = ?auto_380748 ?auto_380751 ) ) ( not ( = ?auto_380749 ?auto_380750 ) ) ( not ( = ?auto_380749 ?auto_380751 ) ) ( not ( = ?auto_380750 ?auto_380751 ) ) ( ON ?auto_380749 ?auto_380750 ) ( ON ?auto_380748 ?auto_380749 ) ( CLEAR ?auto_380746 ) ( ON ?auto_380747 ?auto_380748 ) ( CLEAR ?auto_380747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_380736 ?auto_380737 ?auto_380738 ?auto_380739 ?auto_380740 ?auto_380741 ?auto_380742 ?auto_380743 ?auto_380744 ?auto_380745 ?auto_380746 ?auto_380747 )
      ( MAKE-15PILE ?auto_380736 ?auto_380737 ?auto_380738 ?auto_380739 ?auto_380740 ?auto_380741 ?auto_380742 ?auto_380743 ?auto_380744 ?auto_380745 ?auto_380746 ?auto_380747 ?auto_380748 ?auto_380749 ?auto_380750 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380767 - BLOCK
      ?auto_380768 - BLOCK
      ?auto_380769 - BLOCK
      ?auto_380770 - BLOCK
      ?auto_380771 - BLOCK
      ?auto_380772 - BLOCK
      ?auto_380773 - BLOCK
      ?auto_380774 - BLOCK
      ?auto_380775 - BLOCK
      ?auto_380776 - BLOCK
      ?auto_380777 - BLOCK
      ?auto_380778 - BLOCK
      ?auto_380779 - BLOCK
      ?auto_380780 - BLOCK
      ?auto_380781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_380781 ) ( ON-TABLE ?auto_380767 ) ( ON ?auto_380768 ?auto_380767 ) ( ON ?auto_380769 ?auto_380768 ) ( ON ?auto_380770 ?auto_380769 ) ( ON ?auto_380771 ?auto_380770 ) ( ON ?auto_380772 ?auto_380771 ) ( ON ?auto_380773 ?auto_380772 ) ( ON ?auto_380774 ?auto_380773 ) ( ON ?auto_380775 ?auto_380774 ) ( ON ?auto_380776 ?auto_380775 ) ( ON ?auto_380777 ?auto_380776 ) ( not ( = ?auto_380767 ?auto_380768 ) ) ( not ( = ?auto_380767 ?auto_380769 ) ) ( not ( = ?auto_380767 ?auto_380770 ) ) ( not ( = ?auto_380767 ?auto_380771 ) ) ( not ( = ?auto_380767 ?auto_380772 ) ) ( not ( = ?auto_380767 ?auto_380773 ) ) ( not ( = ?auto_380767 ?auto_380774 ) ) ( not ( = ?auto_380767 ?auto_380775 ) ) ( not ( = ?auto_380767 ?auto_380776 ) ) ( not ( = ?auto_380767 ?auto_380777 ) ) ( not ( = ?auto_380767 ?auto_380778 ) ) ( not ( = ?auto_380767 ?auto_380779 ) ) ( not ( = ?auto_380767 ?auto_380780 ) ) ( not ( = ?auto_380767 ?auto_380781 ) ) ( not ( = ?auto_380768 ?auto_380769 ) ) ( not ( = ?auto_380768 ?auto_380770 ) ) ( not ( = ?auto_380768 ?auto_380771 ) ) ( not ( = ?auto_380768 ?auto_380772 ) ) ( not ( = ?auto_380768 ?auto_380773 ) ) ( not ( = ?auto_380768 ?auto_380774 ) ) ( not ( = ?auto_380768 ?auto_380775 ) ) ( not ( = ?auto_380768 ?auto_380776 ) ) ( not ( = ?auto_380768 ?auto_380777 ) ) ( not ( = ?auto_380768 ?auto_380778 ) ) ( not ( = ?auto_380768 ?auto_380779 ) ) ( not ( = ?auto_380768 ?auto_380780 ) ) ( not ( = ?auto_380768 ?auto_380781 ) ) ( not ( = ?auto_380769 ?auto_380770 ) ) ( not ( = ?auto_380769 ?auto_380771 ) ) ( not ( = ?auto_380769 ?auto_380772 ) ) ( not ( = ?auto_380769 ?auto_380773 ) ) ( not ( = ?auto_380769 ?auto_380774 ) ) ( not ( = ?auto_380769 ?auto_380775 ) ) ( not ( = ?auto_380769 ?auto_380776 ) ) ( not ( = ?auto_380769 ?auto_380777 ) ) ( not ( = ?auto_380769 ?auto_380778 ) ) ( not ( = ?auto_380769 ?auto_380779 ) ) ( not ( = ?auto_380769 ?auto_380780 ) ) ( not ( = ?auto_380769 ?auto_380781 ) ) ( not ( = ?auto_380770 ?auto_380771 ) ) ( not ( = ?auto_380770 ?auto_380772 ) ) ( not ( = ?auto_380770 ?auto_380773 ) ) ( not ( = ?auto_380770 ?auto_380774 ) ) ( not ( = ?auto_380770 ?auto_380775 ) ) ( not ( = ?auto_380770 ?auto_380776 ) ) ( not ( = ?auto_380770 ?auto_380777 ) ) ( not ( = ?auto_380770 ?auto_380778 ) ) ( not ( = ?auto_380770 ?auto_380779 ) ) ( not ( = ?auto_380770 ?auto_380780 ) ) ( not ( = ?auto_380770 ?auto_380781 ) ) ( not ( = ?auto_380771 ?auto_380772 ) ) ( not ( = ?auto_380771 ?auto_380773 ) ) ( not ( = ?auto_380771 ?auto_380774 ) ) ( not ( = ?auto_380771 ?auto_380775 ) ) ( not ( = ?auto_380771 ?auto_380776 ) ) ( not ( = ?auto_380771 ?auto_380777 ) ) ( not ( = ?auto_380771 ?auto_380778 ) ) ( not ( = ?auto_380771 ?auto_380779 ) ) ( not ( = ?auto_380771 ?auto_380780 ) ) ( not ( = ?auto_380771 ?auto_380781 ) ) ( not ( = ?auto_380772 ?auto_380773 ) ) ( not ( = ?auto_380772 ?auto_380774 ) ) ( not ( = ?auto_380772 ?auto_380775 ) ) ( not ( = ?auto_380772 ?auto_380776 ) ) ( not ( = ?auto_380772 ?auto_380777 ) ) ( not ( = ?auto_380772 ?auto_380778 ) ) ( not ( = ?auto_380772 ?auto_380779 ) ) ( not ( = ?auto_380772 ?auto_380780 ) ) ( not ( = ?auto_380772 ?auto_380781 ) ) ( not ( = ?auto_380773 ?auto_380774 ) ) ( not ( = ?auto_380773 ?auto_380775 ) ) ( not ( = ?auto_380773 ?auto_380776 ) ) ( not ( = ?auto_380773 ?auto_380777 ) ) ( not ( = ?auto_380773 ?auto_380778 ) ) ( not ( = ?auto_380773 ?auto_380779 ) ) ( not ( = ?auto_380773 ?auto_380780 ) ) ( not ( = ?auto_380773 ?auto_380781 ) ) ( not ( = ?auto_380774 ?auto_380775 ) ) ( not ( = ?auto_380774 ?auto_380776 ) ) ( not ( = ?auto_380774 ?auto_380777 ) ) ( not ( = ?auto_380774 ?auto_380778 ) ) ( not ( = ?auto_380774 ?auto_380779 ) ) ( not ( = ?auto_380774 ?auto_380780 ) ) ( not ( = ?auto_380774 ?auto_380781 ) ) ( not ( = ?auto_380775 ?auto_380776 ) ) ( not ( = ?auto_380775 ?auto_380777 ) ) ( not ( = ?auto_380775 ?auto_380778 ) ) ( not ( = ?auto_380775 ?auto_380779 ) ) ( not ( = ?auto_380775 ?auto_380780 ) ) ( not ( = ?auto_380775 ?auto_380781 ) ) ( not ( = ?auto_380776 ?auto_380777 ) ) ( not ( = ?auto_380776 ?auto_380778 ) ) ( not ( = ?auto_380776 ?auto_380779 ) ) ( not ( = ?auto_380776 ?auto_380780 ) ) ( not ( = ?auto_380776 ?auto_380781 ) ) ( not ( = ?auto_380777 ?auto_380778 ) ) ( not ( = ?auto_380777 ?auto_380779 ) ) ( not ( = ?auto_380777 ?auto_380780 ) ) ( not ( = ?auto_380777 ?auto_380781 ) ) ( not ( = ?auto_380778 ?auto_380779 ) ) ( not ( = ?auto_380778 ?auto_380780 ) ) ( not ( = ?auto_380778 ?auto_380781 ) ) ( not ( = ?auto_380779 ?auto_380780 ) ) ( not ( = ?auto_380779 ?auto_380781 ) ) ( not ( = ?auto_380780 ?auto_380781 ) ) ( ON ?auto_380780 ?auto_380781 ) ( ON ?auto_380779 ?auto_380780 ) ( CLEAR ?auto_380777 ) ( ON ?auto_380778 ?auto_380779 ) ( CLEAR ?auto_380778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_380767 ?auto_380768 ?auto_380769 ?auto_380770 ?auto_380771 ?auto_380772 ?auto_380773 ?auto_380774 ?auto_380775 ?auto_380776 ?auto_380777 ?auto_380778 )
      ( MAKE-15PILE ?auto_380767 ?auto_380768 ?auto_380769 ?auto_380770 ?auto_380771 ?auto_380772 ?auto_380773 ?auto_380774 ?auto_380775 ?auto_380776 ?auto_380777 ?auto_380778 ?auto_380779 ?auto_380780 ?auto_380781 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380797 - BLOCK
      ?auto_380798 - BLOCK
      ?auto_380799 - BLOCK
      ?auto_380800 - BLOCK
      ?auto_380801 - BLOCK
      ?auto_380802 - BLOCK
      ?auto_380803 - BLOCK
      ?auto_380804 - BLOCK
      ?auto_380805 - BLOCK
      ?auto_380806 - BLOCK
      ?auto_380807 - BLOCK
      ?auto_380808 - BLOCK
      ?auto_380809 - BLOCK
      ?auto_380810 - BLOCK
      ?auto_380811 - BLOCK
    )
    :vars
    (
      ?auto_380812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380811 ?auto_380812 ) ( ON-TABLE ?auto_380797 ) ( ON ?auto_380798 ?auto_380797 ) ( ON ?auto_380799 ?auto_380798 ) ( ON ?auto_380800 ?auto_380799 ) ( ON ?auto_380801 ?auto_380800 ) ( ON ?auto_380802 ?auto_380801 ) ( ON ?auto_380803 ?auto_380802 ) ( ON ?auto_380804 ?auto_380803 ) ( ON ?auto_380805 ?auto_380804 ) ( ON ?auto_380806 ?auto_380805 ) ( not ( = ?auto_380797 ?auto_380798 ) ) ( not ( = ?auto_380797 ?auto_380799 ) ) ( not ( = ?auto_380797 ?auto_380800 ) ) ( not ( = ?auto_380797 ?auto_380801 ) ) ( not ( = ?auto_380797 ?auto_380802 ) ) ( not ( = ?auto_380797 ?auto_380803 ) ) ( not ( = ?auto_380797 ?auto_380804 ) ) ( not ( = ?auto_380797 ?auto_380805 ) ) ( not ( = ?auto_380797 ?auto_380806 ) ) ( not ( = ?auto_380797 ?auto_380807 ) ) ( not ( = ?auto_380797 ?auto_380808 ) ) ( not ( = ?auto_380797 ?auto_380809 ) ) ( not ( = ?auto_380797 ?auto_380810 ) ) ( not ( = ?auto_380797 ?auto_380811 ) ) ( not ( = ?auto_380797 ?auto_380812 ) ) ( not ( = ?auto_380798 ?auto_380799 ) ) ( not ( = ?auto_380798 ?auto_380800 ) ) ( not ( = ?auto_380798 ?auto_380801 ) ) ( not ( = ?auto_380798 ?auto_380802 ) ) ( not ( = ?auto_380798 ?auto_380803 ) ) ( not ( = ?auto_380798 ?auto_380804 ) ) ( not ( = ?auto_380798 ?auto_380805 ) ) ( not ( = ?auto_380798 ?auto_380806 ) ) ( not ( = ?auto_380798 ?auto_380807 ) ) ( not ( = ?auto_380798 ?auto_380808 ) ) ( not ( = ?auto_380798 ?auto_380809 ) ) ( not ( = ?auto_380798 ?auto_380810 ) ) ( not ( = ?auto_380798 ?auto_380811 ) ) ( not ( = ?auto_380798 ?auto_380812 ) ) ( not ( = ?auto_380799 ?auto_380800 ) ) ( not ( = ?auto_380799 ?auto_380801 ) ) ( not ( = ?auto_380799 ?auto_380802 ) ) ( not ( = ?auto_380799 ?auto_380803 ) ) ( not ( = ?auto_380799 ?auto_380804 ) ) ( not ( = ?auto_380799 ?auto_380805 ) ) ( not ( = ?auto_380799 ?auto_380806 ) ) ( not ( = ?auto_380799 ?auto_380807 ) ) ( not ( = ?auto_380799 ?auto_380808 ) ) ( not ( = ?auto_380799 ?auto_380809 ) ) ( not ( = ?auto_380799 ?auto_380810 ) ) ( not ( = ?auto_380799 ?auto_380811 ) ) ( not ( = ?auto_380799 ?auto_380812 ) ) ( not ( = ?auto_380800 ?auto_380801 ) ) ( not ( = ?auto_380800 ?auto_380802 ) ) ( not ( = ?auto_380800 ?auto_380803 ) ) ( not ( = ?auto_380800 ?auto_380804 ) ) ( not ( = ?auto_380800 ?auto_380805 ) ) ( not ( = ?auto_380800 ?auto_380806 ) ) ( not ( = ?auto_380800 ?auto_380807 ) ) ( not ( = ?auto_380800 ?auto_380808 ) ) ( not ( = ?auto_380800 ?auto_380809 ) ) ( not ( = ?auto_380800 ?auto_380810 ) ) ( not ( = ?auto_380800 ?auto_380811 ) ) ( not ( = ?auto_380800 ?auto_380812 ) ) ( not ( = ?auto_380801 ?auto_380802 ) ) ( not ( = ?auto_380801 ?auto_380803 ) ) ( not ( = ?auto_380801 ?auto_380804 ) ) ( not ( = ?auto_380801 ?auto_380805 ) ) ( not ( = ?auto_380801 ?auto_380806 ) ) ( not ( = ?auto_380801 ?auto_380807 ) ) ( not ( = ?auto_380801 ?auto_380808 ) ) ( not ( = ?auto_380801 ?auto_380809 ) ) ( not ( = ?auto_380801 ?auto_380810 ) ) ( not ( = ?auto_380801 ?auto_380811 ) ) ( not ( = ?auto_380801 ?auto_380812 ) ) ( not ( = ?auto_380802 ?auto_380803 ) ) ( not ( = ?auto_380802 ?auto_380804 ) ) ( not ( = ?auto_380802 ?auto_380805 ) ) ( not ( = ?auto_380802 ?auto_380806 ) ) ( not ( = ?auto_380802 ?auto_380807 ) ) ( not ( = ?auto_380802 ?auto_380808 ) ) ( not ( = ?auto_380802 ?auto_380809 ) ) ( not ( = ?auto_380802 ?auto_380810 ) ) ( not ( = ?auto_380802 ?auto_380811 ) ) ( not ( = ?auto_380802 ?auto_380812 ) ) ( not ( = ?auto_380803 ?auto_380804 ) ) ( not ( = ?auto_380803 ?auto_380805 ) ) ( not ( = ?auto_380803 ?auto_380806 ) ) ( not ( = ?auto_380803 ?auto_380807 ) ) ( not ( = ?auto_380803 ?auto_380808 ) ) ( not ( = ?auto_380803 ?auto_380809 ) ) ( not ( = ?auto_380803 ?auto_380810 ) ) ( not ( = ?auto_380803 ?auto_380811 ) ) ( not ( = ?auto_380803 ?auto_380812 ) ) ( not ( = ?auto_380804 ?auto_380805 ) ) ( not ( = ?auto_380804 ?auto_380806 ) ) ( not ( = ?auto_380804 ?auto_380807 ) ) ( not ( = ?auto_380804 ?auto_380808 ) ) ( not ( = ?auto_380804 ?auto_380809 ) ) ( not ( = ?auto_380804 ?auto_380810 ) ) ( not ( = ?auto_380804 ?auto_380811 ) ) ( not ( = ?auto_380804 ?auto_380812 ) ) ( not ( = ?auto_380805 ?auto_380806 ) ) ( not ( = ?auto_380805 ?auto_380807 ) ) ( not ( = ?auto_380805 ?auto_380808 ) ) ( not ( = ?auto_380805 ?auto_380809 ) ) ( not ( = ?auto_380805 ?auto_380810 ) ) ( not ( = ?auto_380805 ?auto_380811 ) ) ( not ( = ?auto_380805 ?auto_380812 ) ) ( not ( = ?auto_380806 ?auto_380807 ) ) ( not ( = ?auto_380806 ?auto_380808 ) ) ( not ( = ?auto_380806 ?auto_380809 ) ) ( not ( = ?auto_380806 ?auto_380810 ) ) ( not ( = ?auto_380806 ?auto_380811 ) ) ( not ( = ?auto_380806 ?auto_380812 ) ) ( not ( = ?auto_380807 ?auto_380808 ) ) ( not ( = ?auto_380807 ?auto_380809 ) ) ( not ( = ?auto_380807 ?auto_380810 ) ) ( not ( = ?auto_380807 ?auto_380811 ) ) ( not ( = ?auto_380807 ?auto_380812 ) ) ( not ( = ?auto_380808 ?auto_380809 ) ) ( not ( = ?auto_380808 ?auto_380810 ) ) ( not ( = ?auto_380808 ?auto_380811 ) ) ( not ( = ?auto_380808 ?auto_380812 ) ) ( not ( = ?auto_380809 ?auto_380810 ) ) ( not ( = ?auto_380809 ?auto_380811 ) ) ( not ( = ?auto_380809 ?auto_380812 ) ) ( not ( = ?auto_380810 ?auto_380811 ) ) ( not ( = ?auto_380810 ?auto_380812 ) ) ( not ( = ?auto_380811 ?auto_380812 ) ) ( ON ?auto_380810 ?auto_380811 ) ( ON ?auto_380809 ?auto_380810 ) ( ON ?auto_380808 ?auto_380809 ) ( CLEAR ?auto_380806 ) ( ON ?auto_380807 ?auto_380808 ) ( CLEAR ?auto_380807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_380797 ?auto_380798 ?auto_380799 ?auto_380800 ?auto_380801 ?auto_380802 ?auto_380803 ?auto_380804 ?auto_380805 ?auto_380806 ?auto_380807 )
      ( MAKE-15PILE ?auto_380797 ?auto_380798 ?auto_380799 ?auto_380800 ?auto_380801 ?auto_380802 ?auto_380803 ?auto_380804 ?auto_380805 ?auto_380806 ?auto_380807 ?auto_380808 ?auto_380809 ?auto_380810 ?auto_380811 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380828 - BLOCK
      ?auto_380829 - BLOCK
      ?auto_380830 - BLOCK
      ?auto_380831 - BLOCK
      ?auto_380832 - BLOCK
      ?auto_380833 - BLOCK
      ?auto_380834 - BLOCK
      ?auto_380835 - BLOCK
      ?auto_380836 - BLOCK
      ?auto_380837 - BLOCK
      ?auto_380838 - BLOCK
      ?auto_380839 - BLOCK
      ?auto_380840 - BLOCK
      ?auto_380841 - BLOCK
      ?auto_380842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_380842 ) ( ON-TABLE ?auto_380828 ) ( ON ?auto_380829 ?auto_380828 ) ( ON ?auto_380830 ?auto_380829 ) ( ON ?auto_380831 ?auto_380830 ) ( ON ?auto_380832 ?auto_380831 ) ( ON ?auto_380833 ?auto_380832 ) ( ON ?auto_380834 ?auto_380833 ) ( ON ?auto_380835 ?auto_380834 ) ( ON ?auto_380836 ?auto_380835 ) ( ON ?auto_380837 ?auto_380836 ) ( not ( = ?auto_380828 ?auto_380829 ) ) ( not ( = ?auto_380828 ?auto_380830 ) ) ( not ( = ?auto_380828 ?auto_380831 ) ) ( not ( = ?auto_380828 ?auto_380832 ) ) ( not ( = ?auto_380828 ?auto_380833 ) ) ( not ( = ?auto_380828 ?auto_380834 ) ) ( not ( = ?auto_380828 ?auto_380835 ) ) ( not ( = ?auto_380828 ?auto_380836 ) ) ( not ( = ?auto_380828 ?auto_380837 ) ) ( not ( = ?auto_380828 ?auto_380838 ) ) ( not ( = ?auto_380828 ?auto_380839 ) ) ( not ( = ?auto_380828 ?auto_380840 ) ) ( not ( = ?auto_380828 ?auto_380841 ) ) ( not ( = ?auto_380828 ?auto_380842 ) ) ( not ( = ?auto_380829 ?auto_380830 ) ) ( not ( = ?auto_380829 ?auto_380831 ) ) ( not ( = ?auto_380829 ?auto_380832 ) ) ( not ( = ?auto_380829 ?auto_380833 ) ) ( not ( = ?auto_380829 ?auto_380834 ) ) ( not ( = ?auto_380829 ?auto_380835 ) ) ( not ( = ?auto_380829 ?auto_380836 ) ) ( not ( = ?auto_380829 ?auto_380837 ) ) ( not ( = ?auto_380829 ?auto_380838 ) ) ( not ( = ?auto_380829 ?auto_380839 ) ) ( not ( = ?auto_380829 ?auto_380840 ) ) ( not ( = ?auto_380829 ?auto_380841 ) ) ( not ( = ?auto_380829 ?auto_380842 ) ) ( not ( = ?auto_380830 ?auto_380831 ) ) ( not ( = ?auto_380830 ?auto_380832 ) ) ( not ( = ?auto_380830 ?auto_380833 ) ) ( not ( = ?auto_380830 ?auto_380834 ) ) ( not ( = ?auto_380830 ?auto_380835 ) ) ( not ( = ?auto_380830 ?auto_380836 ) ) ( not ( = ?auto_380830 ?auto_380837 ) ) ( not ( = ?auto_380830 ?auto_380838 ) ) ( not ( = ?auto_380830 ?auto_380839 ) ) ( not ( = ?auto_380830 ?auto_380840 ) ) ( not ( = ?auto_380830 ?auto_380841 ) ) ( not ( = ?auto_380830 ?auto_380842 ) ) ( not ( = ?auto_380831 ?auto_380832 ) ) ( not ( = ?auto_380831 ?auto_380833 ) ) ( not ( = ?auto_380831 ?auto_380834 ) ) ( not ( = ?auto_380831 ?auto_380835 ) ) ( not ( = ?auto_380831 ?auto_380836 ) ) ( not ( = ?auto_380831 ?auto_380837 ) ) ( not ( = ?auto_380831 ?auto_380838 ) ) ( not ( = ?auto_380831 ?auto_380839 ) ) ( not ( = ?auto_380831 ?auto_380840 ) ) ( not ( = ?auto_380831 ?auto_380841 ) ) ( not ( = ?auto_380831 ?auto_380842 ) ) ( not ( = ?auto_380832 ?auto_380833 ) ) ( not ( = ?auto_380832 ?auto_380834 ) ) ( not ( = ?auto_380832 ?auto_380835 ) ) ( not ( = ?auto_380832 ?auto_380836 ) ) ( not ( = ?auto_380832 ?auto_380837 ) ) ( not ( = ?auto_380832 ?auto_380838 ) ) ( not ( = ?auto_380832 ?auto_380839 ) ) ( not ( = ?auto_380832 ?auto_380840 ) ) ( not ( = ?auto_380832 ?auto_380841 ) ) ( not ( = ?auto_380832 ?auto_380842 ) ) ( not ( = ?auto_380833 ?auto_380834 ) ) ( not ( = ?auto_380833 ?auto_380835 ) ) ( not ( = ?auto_380833 ?auto_380836 ) ) ( not ( = ?auto_380833 ?auto_380837 ) ) ( not ( = ?auto_380833 ?auto_380838 ) ) ( not ( = ?auto_380833 ?auto_380839 ) ) ( not ( = ?auto_380833 ?auto_380840 ) ) ( not ( = ?auto_380833 ?auto_380841 ) ) ( not ( = ?auto_380833 ?auto_380842 ) ) ( not ( = ?auto_380834 ?auto_380835 ) ) ( not ( = ?auto_380834 ?auto_380836 ) ) ( not ( = ?auto_380834 ?auto_380837 ) ) ( not ( = ?auto_380834 ?auto_380838 ) ) ( not ( = ?auto_380834 ?auto_380839 ) ) ( not ( = ?auto_380834 ?auto_380840 ) ) ( not ( = ?auto_380834 ?auto_380841 ) ) ( not ( = ?auto_380834 ?auto_380842 ) ) ( not ( = ?auto_380835 ?auto_380836 ) ) ( not ( = ?auto_380835 ?auto_380837 ) ) ( not ( = ?auto_380835 ?auto_380838 ) ) ( not ( = ?auto_380835 ?auto_380839 ) ) ( not ( = ?auto_380835 ?auto_380840 ) ) ( not ( = ?auto_380835 ?auto_380841 ) ) ( not ( = ?auto_380835 ?auto_380842 ) ) ( not ( = ?auto_380836 ?auto_380837 ) ) ( not ( = ?auto_380836 ?auto_380838 ) ) ( not ( = ?auto_380836 ?auto_380839 ) ) ( not ( = ?auto_380836 ?auto_380840 ) ) ( not ( = ?auto_380836 ?auto_380841 ) ) ( not ( = ?auto_380836 ?auto_380842 ) ) ( not ( = ?auto_380837 ?auto_380838 ) ) ( not ( = ?auto_380837 ?auto_380839 ) ) ( not ( = ?auto_380837 ?auto_380840 ) ) ( not ( = ?auto_380837 ?auto_380841 ) ) ( not ( = ?auto_380837 ?auto_380842 ) ) ( not ( = ?auto_380838 ?auto_380839 ) ) ( not ( = ?auto_380838 ?auto_380840 ) ) ( not ( = ?auto_380838 ?auto_380841 ) ) ( not ( = ?auto_380838 ?auto_380842 ) ) ( not ( = ?auto_380839 ?auto_380840 ) ) ( not ( = ?auto_380839 ?auto_380841 ) ) ( not ( = ?auto_380839 ?auto_380842 ) ) ( not ( = ?auto_380840 ?auto_380841 ) ) ( not ( = ?auto_380840 ?auto_380842 ) ) ( not ( = ?auto_380841 ?auto_380842 ) ) ( ON ?auto_380841 ?auto_380842 ) ( ON ?auto_380840 ?auto_380841 ) ( ON ?auto_380839 ?auto_380840 ) ( CLEAR ?auto_380837 ) ( ON ?auto_380838 ?auto_380839 ) ( CLEAR ?auto_380838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_380828 ?auto_380829 ?auto_380830 ?auto_380831 ?auto_380832 ?auto_380833 ?auto_380834 ?auto_380835 ?auto_380836 ?auto_380837 ?auto_380838 )
      ( MAKE-15PILE ?auto_380828 ?auto_380829 ?auto_380830 ?auto_380831 ?auto_380832 ?auto_380833 ?auto_380834 ?auto_380835 ?auto_380836 ?auto_380837 ?auto_380838 ?auto_380839 ?auto_380840 ?auto_380841 ?auto_380842 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380858 - BLOCK
      ?auto_380859 - BLOCK
      ?auto_380860 - BLOCK
      ?auto_380861 - BLOCK
      ?auto_380862 - BLOCK
      ?auto_380863 - BLOCK
      ?auto_380864 - BLOCK
      ?auto_380865 - BLOCK
      ?auto_380866 - BLOCK
      ?auto_380867 - BLOCK
      ?auto_380868 - BLOCK
      ?auto_380869 - BLOCK
      ?auto_380870 - BLOCK
      ?auto_380871 - BLOCK
      ?auto_380872 - BLOCK
    )
    :vars
    (
      ?auto_380873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380872 ?auto_380873 ) ( ON-TABLE ?auto_380858 ) ( ON ?auto_380859 ?auto_380858 ) ( ON ?auto_380860 ?auto_380859 ) ( ON ?auto_380861 ?auto_380860 ) ( ON ?auto_380862 ?auto_380861 ) ( ON ?auto_380863 ?auto_380862 ) ( ON ?auto_380864 ?auto_380863 ) ( ON ?auto_380865 ?auto_380864 ) ( ON ?auto_380866 ?auto_380865 ) ( not ( = ?auto_380858 ?auto_380859 ) ) ( not ( = ?auto_380858 ?auto_380860 ) ) ( not ( = ?auto_380858 ?auto_380861 ) ) ( not ( = ?auto_380858 ?auto_380862 ) ) ( not ( = ?auto_380858 ?auto_380863 ) ) ( not ( = ?auto_380858 ?auto_380864 ) ) ( not ( = ?auto_380858 ?auto_380865 ) ) ( not ( = ?auto_380858 ?auto_380866 ) ) ( not ( = ?auto_380858 ?auto_380867 ) ) ( not ( = ?auto_380858 ?auto_380868 ) ) ( not ( = ?auto_380858 ?auto_380869 ) ) ( not ( = ?auto_380858 ?auto_380870 ) ) ( not ( = ?auto_380858 ?auto_380871 ) ) ( not ( = ?auto_380858 ?auto_380872 ) ) ( not ( = ?auto_380858 ?auto_380873 ) ) ( not ( = ?auto_380859 ?auto_380860 ) ) ( not ( = ?auto_380859 ?auto_380861 ) ) ( not ( = ?auto_380859 ?auto_380862 ) ) ( not ( = ?auto_380859 ?auto_380863 ) ) ( not ( = ?auto_380859 ?auto_380864 ) ) ( not ( = ?auto_380859 ?auto_380865 ) ) ( not ( = ?auto_380859 ?auto_380866 ) ) ( not ( = ?auto_380859 ?auto_380867 ) ) ( not ( = ?auto_380859 ?auto_380868 ) ) ( not ( = ?auto_380859 ?auto_380869 ) ) ( not ( = ?auto_380859 ?auto_380870 ) ) ( not ( = ?auto_380859 ?auto_380871 ) ) ( not ( = ?auto_380859 ?auto_380872 ) ) ( not ( = ?auto_380859 ?auto_380873 ) ) ( not ( = ?auto_380860 ?auto_380861 ) ) ( not ( = ?auto_380860 ?auto_380862 ) ) ( not ( = ?auto_380860 ?auto_380863 ) ) ( not ( = ?auto_380860 ?auto_380864 ) ) ( not ( = ?auto_380860 ?auto_380865 ) ) ( not ( = ?auto_380860 ?auto_380866 ) ) ( not ( = ?auto_380860 ?auto_380867 ) ) ( not ( = ?auto_380860 ?auto_380868 ) ) ( not ( = ?auto_380860 ?auto_380869 ) ) ( not ( = ?auto_380860 ?auto_380870 ) ) ( not ( = ?auto_380860 ?auto_380871 ) ) ( not ( = ?auto_380860 ?auto_380872 ) ) ( not ( = ?auto_380860 ?auto_380873 ) ) ( not ( = ?auto_380861 ?auto_380862 ) ) ( not ( = ?auto_380861 ?auto_380863 ) ) ( not ( = ?auto_380861 ?auto_380864 ) ) ( not ( = ?auto_380861 ?auto_380865 ) ) ( not ( = ?auto_380861 ?auto_380866 ) ) ( not ( = ?auto_380861 ?auto_380867 ) ) ( not ( = ?auto_380861 ?auto_380868 ) ) ( not ( = ?auto_380861 ?auto_380869 ) ) ( not ( = ?auto_380861 ?auto_380870 ) ) ( not ( = ?auto_380861 ?auto_380871 ) ) ( not ( = ?auto_380861 ?auto_380872 ) ) ( not ( = ?auto_380861 ?auto_380873 ) ) ( not ( = ?auto_380862 ?auto_380863 ) ) ( not ( = ?auto_380862 ?auto_380864 ) ) ( not ( = ?auto_380862 ?auto_380865 ) ) ( not ( = ?auto_380862 ?auto_380866 ) ) ( not ( = ?auto_380862 ?auto_380867 ) ) ( not ( = ?auto_380862 ?auto_380868 ) ) ( not ( = ?auto_380862 ?auto_380869 ) ) ( not ( = ?auto_380862 ?auto_380870 ) ) ( not ( = ?auto_380862 ?auto_380871 ) ) ( not ( = ?auto_380862 ?auto_380872 ) ) ( not ( = ?auto_380862 ?auto_380873 ) ) ( not ( = ?auto_380863 ?auto_380864 ) ) ( not ( = ?auto_380863 ?auto_380865 ) ) ( not ( = ?auto_380863 ?auto_380866 ) ) ( not ( = ?auto_380863 ?auto_380867 ) ) ( not ( = ?auto_380863 ?auto_380868 ) ) ( not ( = ?auto_380863 ?auto_380869 ) ) ( not ( = ?auto_380863 ?auto_380870 ) ) ( not ( = ?auto_380863 ?auto_380871 ) ) ( not ( = ?auto_380863 ?auto_380872 ) ) ( not ( = ?auto_380863 ?auto_380873 ) ) ( not ( = ?auto_380864 ?auto_380865 ) ) ( not ( = ?auto_380864 ?auto_380866 ) ) ( not ( = ?auto_380864 ?auto_380867 ) ) ( not ( = ?auto_380864 ?auto_380868 ) ) ( not ( = ?auto_380864 ?auto_380869 ) ) ( not ( = ?auto_380864 ?auto_380870 ) ) ( not ( = ?auto_380864 ?auto_380871 ) ) ( not ( = ?auto_380864 ?auto_380872 ) ) ( not ( = ?auto_380864 ?auto_380873 ) ) ( not ( = ?auto_380865 ?auto_380866 ) ) ( not ( = ?auto_380865 ?auto_380867 ) ) ( not ( = ?auto_380865 ?auto_380868 ) ) ( not ( = ?auto_380865 ?auto_380869 ) ) ( not ( = ?auto_380865 ?auto_380870 ) ) ( not ( = ?auto_380865 ?auto_380871 ) ) ( not ( = ?auto_380865 ?auto_380872 ) ) ( not ( = ?auto_380865 ?auto_380873 ) ) ( not ( = ?auto_380866 ?auto_380867 ) ) ( not ( = ?auto_380866 ?auto_380868 ) ) ( not ( = ?auto_380866 ?auto_380869 ) ) ( not ( = ?auto_380866 ?auto_380870 ) ) ( not ( = ?auto_380866 ?auto_380871 ) ) ( not ( = ?auto_380866 ?auto_380872 ) ) ( not ( = ?auto_380866 ?auto_380873 ) ) ( not ( = ?auto_380867 ?auto_380868 ) ) ( not ( = ?auto_380867 ?auto_380869 ) ) ( not ( = ?auto_380867 ?auto_380870 ) ) ( not ( = ?auto_380867 ?auto_380871 ) ) ( not ( = ?auto_380867 ?auto_380872 ) ) ( not ( = ?auto_380867 ?auto_380873 ) ) ( not ( = ?auto_380868 ?auto_380869 ) ) ( not ( = ?auto_380868 ?auto_380870 ) ) ( not ( = ?auto_380868 ?auto_380871 ) ) ( not ( = ?auto_380868 ?auto_380872 ) ) ( not ( = ?auto_380868 ?auto_380873 ) ) ( not ( = ?auto_380869 ?auto_380870 ) ) ( not ( = ?auto_380869 ?auto_380871 ) ) ( not ( = ?auto_380869 ?auto_380872 ) ) ( not ( = ?auto_380869 ?auto_380873 ) ) ( not ( = ?auto_380870 ?auto_380871 ) ) ( not ( = ?auto_380870 ?auto_380872 ) ) ( not ( = ?auto_380870 ?auto_380873 ) ) ( not ( = ?auto_380871 ?auto_380872 ) ) ( not ( = ?auto_380871 ?auto_380873 ) ) ( not ( = ?auto_380872 ?auto_380873 ) ) ( ON ?auto_380871 ?auto_380872 ) ( ON ?auto_380870 ?auto_380871 ) ( ON ?auto_380869 ?auto_380870 ) ( ON ?auto_380868 ?auto_380869 ) ( CLEAR ?auto_380866 ) ( ON ?auto_380867 ?auto_380868 ) ( CLEAR ?auto_380867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_380858 ?auto_380859 ?auto_380860 ?auto_380861 ?auto_380862 ?auto_380863 ?auto_380864 ?auto_380865 ?auto_380866 ?auto_380867 )
      ( MAKE-15PILE ?auto_380858 ?auto_380859 ?auto_380860 ?auto_380861 ?auto_380862 ?auto_380863 ?auto_380864 ?auto_380865 ?auto_380866 ?auto_380867 ?auto_380868 ?auto_380869 ?auto_380870 ?auto_380871 ?auto_380872 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380889 - BLOCK
      ?auto_380890 - BLOCK
      ?auto_380891 - BLOCK
      ?auto_380892 - BLOCK
      ?auto_380893 - BLOCK
      ?auto_380894 - BLOCK
      ?auto_380895 - BLOCK
      ?auto_380896 - BLOCK
      ?auto_380897 - BLOCK
      ?auto_380898 - BLOCK
      ?auto_380899 - BLOCK
      ?auto_380900 - BLOCK
      ?auto_380901 - BLOCK
      ?auto_380902 - BLOCK
      ?auto_380903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_380903 ) ( ON-TABLE ?auto_380889 ) ( ON ?auto_380890 ?auto_380889 ) ( ON ?auto_380891 ?auto_380890 ) ( ON ?auto_380892 ?auto_380891 ) ( ON ?auto_380893 ?auto_380892 ) ( ON ?auto_380894 ?auto_380893 ) ( ON ?auto_380895 ?auto_380894 ) ( ON ?auto_380896 ?auto_380895 ) ( ON ?auto_380897 ?auto_380896 ) ( not ( = ?auto_380889 ?auto_380890 ) ) ( not ( = ?auto_380889 ?auto_380891 ) ) ( not ( = ?auto_380889 ?auto_380892 ) ) ( not ( = ?auto_380889 ?auto_380893 ) ) ( not ( = ?auto_380889 ?auto_380894 ) ) ( not ( = ?auto_380889 ?auto_380895 ) ) ( not ( = ?auto_380889 ?auto_380896 ) ) ( not ( = ?auto_380889 ?auto_380897 ) ) ( not ( = ?auto_380889 ?auto_380898 ) ) ( not ( = ?auto_380889 ?auto_380899 ) ) ( not ( = ?auto_380889 ?auto_380900 ) ) ( not ( = ?auto_380889 ?auto_380901 ) ) ( not ( = ?auto_380889 ?auto_380902 ) ) ( not ( = ?auto_380889 ?auto_380903 ) ) ( not ( = ?auto_380890 ?auto_380891 ) ) ( not ( = ?auto_380890 ?auto_380892 ) ) ( not ( = ?auto_380890 ?auto_380893 ) ) ( not ( = ?auto_380890 ?auto_380894 ) ) ( not ( = ?auto_380890 ?auto_380895 ) ) ( not ( = ?auto_380890 ?auto_380896 ) ) ( not ( = ?auto_380890 ?auto_380897 ) ) ( not ( = ?auto_380890 ?auto_380898 ) ) ( not ( = ?auto_380890 ?auto_380899 ) ) ( not ( = ?auto_380890 ?auto_380900 ) ) ( not ( = ?auto_380890 ?auto_380901 ) ) ( not ( = ?auto_380890 ?auto_380902 ) ) ( not ( = ?auto_380890 ?auto_380903 ) ) ( not ( = ?auto_380891 ?auto_380892 ) ) ( not ( = ?auto_380891 ?auto_380893 ) ) ( not ( = ?auto_380891 ?auto_380894 ) ) ( not ( = ?auto_380891 ?auto_380895 ) ) ( not ( = ?auto_380891 ?auto_380896 ) ) ( not ( = ?auto_380891 ?auto_380897 ) ) ( not ( = ?auto_380891 ?auto_380898 ) ) ( not ( = ?auto_380891 ?auto_380899 ) ) ( not ( = ?auto_380891 ?auto_380900 ) ) ( not ( = ?auto_380891 ?auto_380901 ) ) ( not ( = ?auto_380891 ?auto_380902 ) ) ( not ( = ?auto_380891 ?auto_380903 ) ) ( not ( = ?auto_380892 ?auto_380893 ) ) ( not ( = ?auto_380892 ?auto_380894 ) ) ( not ( = ?auto_380892 ?auto_380895 ) ) ( not ( = ?auto_380892 ?auto_380896 ) ) ( not ( = ?auto_380892 ?auto_380897 ) ) ( not ( = ?auto_380892 ?auto_380898 ) ) ( not ( = ?auto_380892 ?auto_380899 ) ) ( not ( = ?auto_380892 ?auto_380900 ) ) ( not ( = ?auto_380892 ?auto_380901 ) ) ( not ( = ?auto_380892 ?auto_380902 ) ) ( not ( = ?auto_380892 ?auto_380903 ) ) ( not ( = ?auto_380893 ?auto_380894 ) ) ( not ( = ?auto_380893 ?auto_380895 ) ) ( not ( = ?auto_380893 ?auto_380896 ) ) ( not ( = ?auto_380893 ?auto_380897 ) ) ( not ( = ?auto_380893 ?auto_380898 ) ) ( not ( = ?auto_380893 ?auto_380899 ) ) ( not ( = ?auto_380893 ?auto_380900 ) ) ( not ( = ?auto_380893 ?auto_380901 ) ) ( not ( = ?auto_380893 ?auto_380902 ) ) ( not ( = ?auto_380893 ?auto_380903 ) ) ( not ( = ?auto_380894 ?auto_380895 ) ) ( not ( = ?auto_380894 ?auto_380896 ) ) ( not ( = ?auto_380894 ?auto_380897 ) ) ( not ( = ?auto_380894 ?auto_380898 ) ) ( not ( = ?auto_380894 ?auto_380899 ) ) ( not ( = ?auto_380894 ?auto_380900 ) ) ( not ( = ?auto_380894 ?auto_380901 ) ) ( not ( = ?auto_380894 ?auto_380902 ) ) ( not ( = ?auto_380894 ?auto_380903 ) ) ( not ( = ?auto_380895 ?auto_380896 ) ) ( not ( = ?auto_380895 ?auto_380897 ) ) ( not ( = ?auto_380895 ?auto_380898 ) ) ( not ( = ?auto_380895 ?auto_380899 ) ) ( not ( = ?auto_380895 ?auto_380900 ) ) ( not ( = ?auto_380895 ?auto_380901 ) ) ( not ( = ?auto_380895 ?auto_380902 ) ) ( not ( = ?auto_380895 ?auto_380903 ) ) ( not ( = ?auto_380896 ?auto_380897 ) ) ( not ( = ?auto_380896 ?auto_380898 ) ) ( not ( = ?auto_380896 ?auto_380899 ) ) ( not ( = ?auto_380896 ?auto_380900 ) ) ( not ( = ?auto_380896 ?auto_380901 ) ) ( not ( = ?auto_380896 ?auto_380902 ) ) ( not ( = ?auto_380896 ?auto_380903 ) ) ( not ( = ?auto_380897 ?auto_380898 ) ) ( not ( = ?auto_380897 ?auto_380899 ) ) ( not ( = ?auto_380897 ?auto_380900 ) ) ( not ( = ?auto_380897 ?auto_380901 ) ) ( not ( = ?auto_380897 ?auto_380902 ) ) ( not ( = ?auto_380897 ?auto_380903 ) ) ( not ( = ?auto_380898 ?auto_380899 ) ) ( not ( = ?auto_380898 ?auto_380900 ) ) ( not ( = ?auto_380898 ?auto_380901 ) ) ( not ( = ?auto_380898 ?auto_380902 ) ) ( not ( = ?auto_380898 ?auto_380903 ) ) ( not ( = ?auto_380899 ?auto_380900 ) ) ( not ( = ?auto_380899 ?auto_380901 ) ) ( not ( = ?auto_380899 ?auto_380902 ) ) ( not ( = ?auto_380899 ?auto_380903 ) ) ( not ( = ?auto_380900 ?auto_380901 ) ) ( not ( = ?auto_380900 ?auto_380902 ) ) ( not ( = ?auto_380900 ?auto_380903 ) ) ( not ( = ?auto_380901 ?auto_380902 ) ) ( not ( = ?auto_380901 ?auto_380903 ) ) ( not ( = ?auto_380902 ?auto_380903 ) ) ( ON ?auto_380902 ?auto_380903 ) ( ON ?auto_380901 ?auto_380902 ) ( ON ?auto_380900 ?auto_380901 ) ( ON ?auto_380899 ?auto_380900 ) ( CLEAR ?auto_380897 ) ( ON ?auto_380898 ?auto_380899 ) ( CLEAR ?auto_380898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_380889 ?auto_380890 ?auto_380891 ?auto_380892 ?auto_380893 ?auto_380894 ?auto_380895 ?auto_380896 ?auto_380897 ?auto_380898 )
      ( MAKE-15PILE ?auto_380889 ?auto_380890 ?auto_380891 ?auto_380892 ?auto_380893 ?auto_380894 ?auto_380895 ?auto_380896 ?auto_380897 ?auto_380898 ?auto_380899 ?auto_380900 ?auto_380901 ?auto_380902 ?auto_380903 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380919 - BLOCK
      ?auto_380920 - BLOCK
      ?auto_380921 - BLOCK
      ?auto_380922 - BLOCK
      ?auto_380923 - BLOCK
      ?auto_380924 - BLOCK
      ?auto_380925 - BLOCK
      ?auto_380926 - BLOCK
      ?auto_380927 - BLOCK
      ?auto_380928 - BLOCK
      ?auto_380929 - BLOCK
      ?auto_380930 - BLOCK
      ?auto_380931 - BLOCK
      ?auto_380932 - BLOCK
      ?auto_380933 - BLOCK
    )
    :vars
    (
      ?auto_380934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380933 ?auto_380934 ) ( ON-TABLE ?auto_380919 ) ( ON ?auto_380920 ?auto_380919 ) ( ON ?auto_380921 ?auto_380920 ) ( ON ?auto_380922 ?auto_380921 ) ( ON ?auto_380923 ?auto_380922 ) ( ON ?auto_380924 ?auto_380923 ) ( ON ?auto_380925 ?auto_380924 ) ( ON ?auto_380926 ?auto_380925 ) ( not ( = ?auto_380919 ?auto_380920 ) ) ( not ( = ?auto_380919 ?auto_380921 ) ) ( not ( = ?auto_380919 ?auto_380922 ) ) ( not ( = ?auto_380919 ?auto_380923 ) ) ( not ( = ?auto_380919 ?auto_380924 ) ) ( not ( = ?auto_380919 ?auto_380925 ) ) ( not ( = ?auto_380919 ?auto_380926 ) ) ( not ( = ?auto_380919 ?auto_380927 ) ) ( not ( = ?auto_380919 ?auto_380928 ) ) ( not ( = ?auto_380919 ?auto_380929 ) ) ( not ( = ?auto_380919 ?auto_380930 ) ) ( not ( = ?auto_380919 ?auto_380931 ) ) ( not ( = ?auto_380919 ?auto_380932 ) ) ( not ( = ?auto_380919 ?auto_380933 ) ) ( not ( = ?auto_380919 ?auto_380934 ) ) ( not ( = ?auto_380920 ?auto_380921 ) ) ( not ( = ?auto_380920 ?auto_380922 ) ) ( not ( = ?auto_380920 ?auto_380923 ) ) ( not ( = ?auto_380920 ?auto_380924 ) ) ( not ( = ?auto_380920 ?auto_380925 ) ) ( not ( = ?auto_380920 ?auto_380926 ) ) ( not ( = ?auto_380920 ?auto_380927 ) ) ( not ( = ?auto_380920 ?auto_380928 ) ) ( not ( = ?auto_380920 ?auto_380929 ) ) ( not ( = ?auto_380920 ?auto_380930 ) ) ( not ( = ?auto_380920 ?auto_380931 ) ) ( not ( = ?auto_380920 ?auto_380932 ) ) ( not ( = ?auto_380920 ?auto_380933 ) ) ( not ( = ?auto_380920 ?auto_380934 ) ) ( not ( = ?auto_380921 ?auto_380922 ) ) ( not ( = ?auto_380921 ?auto_380923 ) ) ( not ( = ?auto_380921 ?auto_380924 ) ) ( not ( = ?auto_380921 ?auto_380925 ) ) ( not ( = ?auto_380921 ?auto_380926 ) ) ( not ( = ?auto_380921 ?auto_380927 ) ) ( not ( = ?auto_380921 ?auto_380928 ) ) ( not ( = ?auto_380921 ?auto_380929 ) ) ( not ( = ?auto_380921 ?auto_380930 ) ) ( not ( = ?auto_380921 ?auto_380931 ) ) ( not ( = ?auto_380921 ?auto_380932 ) ) ( not ( = ?auto_380921 ?auto_380933 ) ) ( not ( = ?auto_380921 ?auto_380934 ) ) ( not ( = ?auto_380922 ?auto_380923 ) ) ( not ( = ?auto_380922 ?auto_380924 ) ) ( not ( = ?auto_380922 ?auto_380925 ) ) ( not ( = ?auto_380922 ?auto_380926 ) ) ( not ( = ?auto_380922 ?auto_380927 ) ) ( not ( = ?auto_380922 ?auto_380928 ) ) ( not ( = ?auto_380922 ?auto_380929 ) ) ( not ( = ?auto_380922 ?auto_380930 ) ) ( not ( = ?auto_380922 ?auto_380931 ) ) ( not ( = ?auto_380922 ?auto_380932 ) ) ( not ( = ?auto_380922 ?auto_380933 ) ) ( not ( = ?auto_380922 ?auto_380934 ) ) ( not ( = ?auto_380923 ?auto_380924 ) ) ( not ( = ?auto_380923 ?auto_380925 ) ) ( not ( = ?auto_380923 ?auto_380926 ) ) ( not ( = ?auto_380923 ?auto_380927 ) ) ( not ( = ?auto_380923 ?auto_380928 ) ) ( not ( = ?auto_380923 ?auto_380929 ) ) ( not ( = ?auto_380923 ?auto_380930 ) ) ( not ( = ?auto_380923 ?auto_380931 ) ) ( not ( = ?auto_380923 ?auto_380932 ) ) ( not ( = ?auto_380923 ?auto_380933 ) ) ( not ( = ?auto_380923 ?auto_380934 ) ) ( not ( = ?auto_380924 ?auto_380925 ) ) ( not ( = ?auto_380924 ?auto_380926 ) ) ( not ( = ?auto_380924 ?auto_380927 ) ) ( not ( = ?auto_380924 ?auto_380928 ) ) ( not ( = ?auto_380924 ?auto_380929 ) ) ( not ( = ?auto_380924 ?auto_380930 ) ) ( not ( = ?auto_380924 ?auto_380931 ) ) ( not ( = ?auto_380924 ?auto_380932 ) ) ( not ( = ?auto_380924 ?auto_380933 ) ) ( not ( = ?auto_380924 ?auto_380934 ) ) ( not ( = ?auto_380925 ?auto_380926 ) ) ( not ( = ?auto_380925 ?auto_380927 ) ) ( not ( = ?auto_380925 ?auto_380928 ) ) ( not ( = ?auto_380925 ?auto_380929 ) ) ( not ( = ?auto_380925 ?auto_380930 ) ) ( not ( = ?auto_380925 ?auto_380931 ) ) ( not ( = ?auto_380925 ?auto_380932 ) ) ( not ( = ?auto_380925 ?auto_380933 ) ) ( not ( = ?auto_380925 ?auto_380934 ) ) ( not ( = ?auto_380926 ?auto_380927 ) ) ( not ( = ?auto_380926 ?auto_380928 ) ) ( not ( = ?auto_380926 ?auto_380929 ) ) ( not ( = ?auto_380926 ?auto_380930 ) ) ( not ( = ?auto_380926 ?auto_380931 ) ) ( not ( = ?auto_380926 ?auto_380932 ) ) ( not ( = ?auto_380926 ?auto_380933 ) ) ( not ( = ?auto_380926 ?auto_380934 ) ) ( not ( = ?auto_380927 ?auto_380928 ) ) ( not ( = ?auto_380927 ?auto_380929 ) ) ( not ( = ?auto_380927 ?auto_380930 ) ) ( not ( = ?auto_380927 ?auto_380931 ) ) ( not ( = ?auto_380927 ?auto_380932 ) ) ( not ( = ?auto_380927 ?auto_380933 ) ) ( not ( = ?auto_380927 ?auto_380934 ) ) ( not ( = ?auto_380928 ?auto_380929 ) ) ( not ( = ?auto_380928 ?auto_380930 ) ) ( not ( = ?auto_380928 ?auto_380931 ) ) ( not ( = ?auto_380928 ?auto_380932 ) ) ( not ( = ?auto_380928 ?auto_380933 ) ) ( not ( = ?auto_380928 ?auto_380934 ) ) ( not ( = ?auto_380929 ?auto_380930 ) ) ( not ( = ?auto_380929 ?auto_380931 ) ) ( not ( = ?auto_380929 ?auto_380932 ) ) ( not ( = ?auto_380929 ?auto_380933 ) ) ( not ( = ?auto_380929 ?auto_380934 ) ) ( not ( = ?auto_380930 ?auto_380931 ) ) ( not ( = ?auto_380930 ?auto_380932 ) ) ( not ( = ?auto_380930 ?auto_380933 ) ) ( not ( = ?auto_380930 ?auto_380934 ) ) ( not ( = ?auto_380931 ?auto_380932 ) ) ( not ( = ?auto_380931 ?auto_380933 ) ) ( not ( = ?auto_380931 ?auto_380934 ) ) ( not ( = ?auto_380932 ?auto_380933 ) ) ( not ( = ?auto_380932 ?auto_380934 ) ) ( not ( = ?auto_380933 ?auto_380934 ) ) ( ON ?auto_380932 ?auto_380933 ) ( ON ?auto_380931 ?auto_380932 ) ( ON ?auto_380930 ?auto_380931 ) ( ON ?auto_380929 ?auto_380930 ) ( ON ?auto_380928 ?auto_380929 ) ( CLEAR ?auto_380926 ) ( ON ?auto_380927 ?auto_380928 ) ( CLEAR ?auto_380927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_380919 ?auto_380920 ?auto_380921 ?auto_380922 ?auto_380923 ?auto_380924 ?auto_380925 ?auto_380926 ?auto_380927 )
      ( MAKE-15PILE ?auto_380919 ?auto_380920 ?auto_380921 ?auto_380922 ?auto_380923 ?auto_380924 ?auto_380925 ?auto_380926 ?auto_380927 ?auto_380928 ?auto_380929 ?auto_380930 ?auto_380931 ?auto_380932 ?auto_380933 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380950 - BLOCK
      ?auto_380951 - BLOCK
      ?auto_380952 - BLOCK
      ?auto_380953 - BLOCK
      ?auto_380954 - BLOCK
      ?auto_380955 - BLOCK
      ?auto_380956 - BLOCK
      ?auto_380957 - BLOCK
      ?auto_380958 - BLOCK
      ?auto_380959 - BLOCK
      ?auto_380960 - BLOCK
      ?auto_380961 - BLOCK
      ?auto_380962 - BLOCK
      ?auto_380963 - BLOCK
      ?auto_380964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_380964 ) ( ON-TABLE ?auto_380950 ) ( ON ?auto_380951 ?auto_380950 ) ( ON ?auto_380952 ?auto_380951 ) ( ON ?auto_380953 ?auto_380952 ) ( ON ?auto_380954 ?auto_380953 ) ( ON ?auto_380955 ?auto_380954 ) ( ON ?auto_380956 ?auto_380955 ) ( ON ?auto_380957 ?auto_380956 ) ( not ( = ?auto_380950 ?auto_380951 ) ) ( not ( = ?auto_380950 ?auto_380952 ) ) ( not ( = ?auto_380950 ?auto_380953 ) ) ( not ( = ?auto_380950 ?auto_380954 ) ) ( not ( = ?auto_380950 ?auto_380955 ) ) ( not ( = ?auto_380950 ?auto_380956 ) ) ( not ( = ?auto_380950 ?auto_380957 ) ) ( not ( = ?auto_380950 ?auto_380958 ) ) ( not ( = ?auto_380950 ?auto_380959 ) ) ( not ( = ?auto_380950 ?auto_380960 ) ) ( not ( = ?auto_380950 ?auto_380961 ) ) ( not ( = ?auto_380950 ?auto_380962 ) ) ( not ( = ?auto_380950 ?auto_380963 ) ) ( not ( = ?auto_380950 ?auto_380964 ) ) ( not ( = ?auto_380951 ?auto_380952 ) ) ( not ( = ?auto_380951 ?auto_380953 ) ) ( not ( = ?auto_380951 ?auto_380954 ) ) ( not ( = ?auto_380951 ?auto_380955 ) ) ( not ( = ?auto_380951 ?auto_380956 ) ) ( not ( = ?auto_380951 ?auto_380957 ) ) ( not ( = ?auto_380951 ?auto_380958 ) ) ( not ( = ?auto_380951 ?auto_380959 ) ) ( not ( = ?auto_380951 ?auto_380960 ) ) ( not ( = ?auto_380951 ?auto_380961 ) ) ( not ( = ?auto_380951 ?auto_380962 ) ) ( not ( = ?auto_380951 ?auto_380963 ) ) ( not ( = ?auto_380951 ?auto_380964 ) ) ( not ( = ?auto_380952 ?auto_380953 ) ) ( not ( = ?auto_380952 ?auto_380954 ) ) ( not ( = ?auto_380952 ?auto_380955 ) ) ( not ( = ?auto_380952 ?auto_380956 ) ) ( not ( = ?auto_380952 ?auto_380957 ) ) ( not ( = ?auto_380952 ?auto_380958 ) ) ( not ( = ?auto_380952 ?auto_380959 ) ) ( not ( = ?auto_380952 ?auto_380960 ) ) ( not ( = ?auto_380952 ?auto_380961 ) ) ( not ( = ?auto_380952 ?auto_380962 ) ) ( not ( = ?auto_380952 ?auto_380963 ) ) ( not ( = ?auto_380952 ?auto_380964 ) ) ( not ( = ?auto_380953 ?auto_380954 ) ) ( not ( = ?auto_380953 ?auto_380955 ) ) ( not ( = ?auto_380953 ?auto_380956 ) ) ( not ( = ?auto_380953 ?auto_380957 ) ) ( not ( = ?auto_380953 ?auto_380958 ) ) ( not ( = ?auto_380953 ?auto_380959 ) ) ( not ( = ?auto_380953 ?auto_380960 ) ) ( not ( = ?auto_380953 ?auto_380961 ) ) ( not ( = ?auto_380953 ?auto_380962 ) ) ( not ( = ?auto_380953 ?auto_380963 ) ) ( not ( = ?auto_380953 ?auto_380964 ) ) ( not ( = ?auto_380954 ?auto_380955 ) ) ( not ( = ?auto_380954 ?auto_380956 ) ) ( not ( = ?auto_380954 ?auto_380957 ) ) ( not ( = ?auto_380954 ?auto_380958 ) ) ( not ( = ?auto_380954 ?auto_380959 ) ) ( not ( = ?auto_380954 ?auto_380960 ) ) ( not ( = ?auto_380954 ?auto_380961 ) ) ( not ( = ?auto_380954 ?auto_380962 ) ) ( not ( = ?auto_380954 ?auto_380963 ) ) ( not ( = ?auto_380954 ?auto_380964 ) ) ( not ( = ?auto_380955 ?auto_380956 ) ) ( not ( = ?auto_380955 ?auto_380957 ) ) ( not ( = ?auto_380955 ?auto_380958 ) ) ( not ( = ?auto_380955 ?auto_380959 ) ) ( not ( = ?auto_380955 ?auto_380960 ) ) ( not ( = ?auto_380955 ?auto_380961 ) ) ( not ( = ?auto_380955 ?auto_380962 ) ) ( not ( = ?auto_380955 ?auto_380963 ) ) ( not ( = ?auto_380955 ?auto_380964 ) ) ( not ( = ?auto_380956 ?auto_380957 ) ) ( not ( = ?auto_380956 ?auto_380958 ) ) ( not ( = ?auto_380956 ?auto_380959 ) ) ( not ( = ?auto_380956 ?auto_380960 ) ) ( not ( = ?auto_380956 ?auto_380961 ) ) ( not ( = ?auto_380956 ?auto_380962 ) ) ( not ( = ?auto_380956 ?auto_380963 ) ) ( not ( = ?auto_380956 ?auto_380964 ) ) ( not ( = ?auto_380957 ?auto_380958 ) ) ( not ( = ?auto_380957 ?auto_380959 ) ) ( not ( = ?auto_380957 ?auto_380960 ) ) ( not ( = ?auto_380957 ?auto_380961 ) ) ( not ( = ?auto_380957 ?auto_380962 ) ) ( not ( = ?auto_380957 ?auto_380963 ) ) ( not ( = ?auto_380957 ?auto_380964 ) ) ( not ( = ?auto_380958 ?auto_380959 ) ) ( not ( = ?auto_380958 ?auto_380960 ) ) ( not ( = ?auto_380958 ?auto_380961 ) ) ( not ( = ?auto_380958 ?auto_380962 ) ) ( not ( = ?auto_380958 ?auto_380963 ) ) ( not ( = ?auto_380958 ?auto_380964 ) ) ( not ( = ?auto_380959 ?auto_380960 ) ) ( not ( = ?auto_380959 ?auto_380961 ) ) ( not ( = ?auto_380959 ?auto_380962 ) ) ( not ( = ?auto_380959 ?auto_380963 ) ) ( not ( = ?auto_380959 ?auto_380964 ) ) ( not ( = ?auto_380960 ?auto_380961 ) ) ( not ( = ?auto_380960 ?auto_380962 ) ) ( not ( = ?auto_380960 ?auto_380963 ) ) ( not ( = ?auto_380960 ?auto_380964 ) ) ( not ( = ?auto_380961 ?auto_380962 ) ) ( not ( = ?auto_380961 ?auto_380963 ) ) ( not ( = ?auto_380961 ?auto_380964 ) ) ( not ( = ?auto_380962 ?auto_380963 ) ) ( not ( = ?auto_380962 ?auto_380964 ) ) ( not ( = ?auto_380963 ?auto_380964 ) ) ( ON ?auto_380963 ?auto_380964 ) ( ON ?auto_380962 ?auto_380963 ) ( ON ?auto_380961 ?auto_380962 ) ( ON ?auto_380960 ?auto_380961 ) ( ON ?auto_380959 ?auto_380960 ) ( CLEAR ?auto_380957 ) ( ON ?auto_380958 ?auto_380959 ) ( CLEAR ?auto_380958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_380950 ?auto_380951 ?auto_380952 ?auto_380953 ?auto_380954 ?auto_380955 ?auto_380956 ?auto_380957 ?auto_380958 )
      ( MAKE-15PILE ?auto_380950 ?auto_380951 ?auto_380952 ?auto_380953 ?auto_380954 ?auto_380955 ?auto_380956 ?auto_380957 ?auto_380958 ?auto_380959 ?auto_380960 ?auto_380961 ?auto_380962 ?auto_380963 ?auto_380964 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_380980 - BLOCK
      ?auto_380981 - BLOCK
      ?auto_380982 - BLOCK
      ?auto_380983 - BLOCK
      ?auto_380984 - BLOCK
      ?auto_380985 - BLOCK
      ?auto_380986 - BLOCK
      ?auto_380987 - BLOCK
      ?auto_380988 - BLOCK
      ?auto_380989 - BLOCK
      ?auto_380990 - BLOCK
      ?auto_380991 - BLOCK
      ?auto_380992 - BLOCK
      ?auto_380993 - BLOCK
      ?auto_380994 - BLOCK
    )
    :vars
    (
      ?auto_380995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_380994 ?auto_380995 ) ( ON-TABLE ?auto_380980 ) ( ON ?auto_380981 ?auto_380980 ) ( ON ?auto_380982 ?auto_380981 ) ( ON ?auto_380983 ?auto_380982 ) ( ON ?auto_380984 ?auto_380983 ) ( ON ?auto_380985 ?auto_380984 ) ( ON ?auto_380986 ?auto_380985 ) ( not ( = ?auto_380980 ?auto_380981 ) ) ( not ( = ?auto_380980 ?auto_380982 ) ) ( not ( = ?auto_380980 ?auto_380983 ) ) ( not ( = ?auto_380980 ?auto_380984 ) ) ( not ( = ?auto_380980 ?auto_380985 ) ) ( not ( = ?auto_380980 ?auto_380986 ) ) ( not ( = ?auto_380980 ?auto_380987 ) ) ( not ( = ?auto_380980 ?auto_380988 ) ) ( not ( = ?auto_380980 ?auto_380989 ) ) ( not ( = ?auto_380980 ?auto_380990 ) ) ( not ( = ?auto_380980 ?auto_380991 ) ) ( not ( = ?auto_380980 ?auto_380992 ) ) ( not ( = ?auto_380980 ?auto_380993 ) ) ( not ( = ?auto_380980 ?auto_380994 ) ) ( not ( = ?auto_380980 ?auto_380995 ) ) ( not ( = ?auto_380981 ?auto_380982 ) ) ( not ( = ?auto_380981 ?auto_380983 ) ) ( not ( = ?auto_380981 ?auto_380984 ) ) ( not ( = ?auto_380981 ?auto_380985 ) ) ( not ( = ?auto_380981 ?auto_380986 ) ) ( not ( = ?auto_380981 ?auto_380987 ) ) ( not ( = ?auto_380981 ?auto_380988 ) ) ( not ( = ?auto_380981 ?auto_380989 ) ) ( not ( = ?auto_380981 ?auto_380990 ) ) ( not ( = ?auto_380981 ?auto_380991 ) ) ( not ( = ?auto_380981 ?auto_380992 ) ) ( not ( = ?auto_380981 ?auto_380993 ) ) ( not ( = ?auto_380981 ?auto_380994 ) ) ( not ( = ?auto_380981 ?auto_380995 ) ) ( not ( = ?auto_380982 ?auto_380983 ) ) ( not ( = ?auto_380982 ?auto_380984 ) ) ( not ( = ?auto_380982 ?auto_380985 ) ) ( not ( = ?auto_380982 ?auto_380986 ) ) ( not ( = ?auto_380982 ?auto_380987 ) ) ( not ( = ?auto_380982 ?auto_380988 ) ) ( not ( = ?auto_380982 ?auto_380989 ) ) ( not ( = ?auto_380982 ?auto_380990 ) ) ( not ( = ?auto_380982 ?auto_380991 ) ) ( not ( = ?auto_380982 ?auto_380992 ) ) ( not ( = ?auto_380982 ?auto_380993 ) ) ( not ( = ?auto_380982 ?auto_380994 ) ) ( not ( = ?auto_380982 ?auto_380995 ) ) ( not ( = ?auto_380983 ?auto_380984 ) ) ( not ( = ?auto_380983 ?auto_380985 ) ) ( not ( = ?auto_380983 ?auto_380986 ) ) ( not ( = ?auto_380983 ?auto_380987 ) ) ( not ( = ?auto_380983 ?auto_380988 ) ) ( not ( = ?auto_380983 ?auto_380989 ) ) ( not ( = ?auto_380983 ?auto_380990 ) ) ( not ( = ?auto_380983 ?auto_380991 ) ) ( not ( = ?auto_380983 ?auto_380992 ) ) ( not ( = ?auto_380983 ?auto_380993 ) ) ( not ( = ?auto_380983 ?auto_380994 ) ) ( not ( = ?auto_380983 ?auto_380995 ) ) ( not ( = ?auto_380984 ?auto_380985 ) ) ( not ( = ?auto_380984 ?auto_380986 ) ) ( not ( = ?auto_380984 ?auto_380987 ) ) ( not ( = ?auto_380984 ?auto_380988 ) ) ( not ( = ?auto_380984 ?auto_380989 ) ) ( not ( = ?auto_380984 ?auto_380990 ) ) ( not ( = ?auto_380984 ?auto_380991 ) ) ( not ( = ?auto_380984 ?auto_380992 ) ) ( not ( = ?auto_380984 ?auto_380993 ) ) ( not ( = ?auto_380984 ?auto_380994 ) ) ( not ( = ?auto_380984 ?auto_380995 ) ) ( not ( = ?auto_380985 ?auto_380986 ) ) ( not ( = ?auto_380985 ?auto_380987 ) ) ( not ( = ?auto_380985 ?auto_380988 ) ) ( not ( = ?auto_380985 ?auto_380989 ) ) ( not ( = ?auto_380985 ?auto_380990 ) ) ( not ( = ?auto_380985 ?auto_380991 ) ) ( not ( = ?auto_380985 ?auto_380992 ) ) ( not ( = ?auto_380985 ?auto_380993 ) ) ( not ( = ?auto_380985 ?auto_380994 ) ) ( not ( = ?auto_380985 ?auto_380995 ) ) ( not ( = ?auto_380986 ?auto_380987 ) ) ( not ( = ?auto_380986 ?auto_380988 ) ) ( not ( = ?auto_380986 ?auto_380989 ) ) ( not ( = ?auto_380986 ?auto_380990 ) ) ( not ( = ?auto_380986 ?auto_380991 ) ) ( not ( = ?auto_380986 ?auto_380992 ) ) ( not ( = ?auto_380986 ?auto_380993 ) ) ( not ( = ?auto_380986 ?auto_380994 ) ) ( not ( = ?auto_380986 ?auto_380995 ) ) ( not ( = ?auto_380987 ?auto_380988 ) ) ( not ( = ?auto_380987 ?auto_380989 ) ) ( not ( = ?auto_380987 ?auto_380990 ) ) ( not ( = ?auto_380987 ?auto_380991 ) ) ( not ( = ?auto_380987 ?auto_380992 ) ) ( not ( = ?auto_380987 ?auto_380993 ) ) ( not ( = ?auto_380987 ?auto_380994 ) ) ( not ( = ?auto_380987 ?auto_380995 ) ) ( not ( = ?auto_380988 ?auto_380989 ) ) ( not ( = ?auto_380988 ?auto_380990 ) ) ( not ( = ?auto_380988 ?auto_380991 ) ) ( not ( = ?auto_380988 ?auto_380992 ) ) ( not ( = ?auto_380988 ?auto_380993 ) ) ( not ( = ?auto_380988 ?auto_380994 ) ) ( not ( = ?auto_380988 ?auto_380995 ) ) ( not ( = ?auto_380989 ?auto_380990 ) ) ( not ( = ?auto_380989 ?auto_380991 ) ) ( not ( = ?auto_380989 ?auto_380992 ) ) ( not ( = ?auto_380989 ?auto_380993 ) ) ( not ( = ?auto_380989 ?auto_380994 ) ) ( not ( = ?auto_380989 ?auto_380995 ) ) ( not ( = ?auto_380990 ?auto_380991 ) ) ( not ( = ?auto_380990 ?auto_380992 ) ) ( not ( = ?auto_380990 ?auto_380993 ) ) ( not ( = ?auto_380990 ?auto_380994 ) ) ( not ( = ?auto_380990 ?auto_380995 ) ) ( not ( = ?auto_380991 ?auto_380992 ) ) ( not ( = ?auto_380991 ?auto_380993 ) ) ( not ( = ?auto_380991 ?auto_380994 ) ) ( not ( = ?auto_380991 ?auto_380995 ) ) ( not ( = ?auto_380992 ?auto_380993 ) ) ( not ( = ?auto_380992 ?auto_380994 ) ) ( not ( = ?auto_380992 ?auto_380995 ) ) ( not ( = ?auto_380993 ?auto_380994 ) ) ( not ( = ?auto_380993 ?auto_380995 ) ) ( not ( = ?auto_380994 ?auto_380995 ) ) ( ON ?auto_380993 ?auto_380994 ) ( ON ?auto_380992 ?auto_380993 ) ( ON ?auto_380991 ?auto_380992 ) ( ON ?auto_380990 ?auto_380991 ) ( ON ?auto_380989 ?auto_380990 ) ( ON ?auto_380988 ?auto_380989 ) ( CLEAR ?auto_380986 ) ( ON ?auto_380987 ?auto_380988 ) ( CLEAR ?auto_380987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_380980 ?auto_380981 ?auto_380982 ?auto_380983 ?auto_380984 ?auto_380985 ?auto_380986 ?auto_380987 )
      ( MAKE-15PILE ?auto_380980 ?auto_380981 ?auto_380982 ?auto_380983 ?auto_380984 ?auto_380985 ?auto_380986 ?auto_380987 ?auto_380988 ?auto_380989 ?auto_380990 ?auto_380991 ?auto_380992 ?auto_380993 ?auto_380994 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381011 - BLOCK
      ?auto_381012 - BLOCK
      ?auto_381013 - BLOCK
      ?auto_381014 - BLOCK
      ?auto_381015 - BLOCK
      ?auto_381016 - BLOCK
      ?auto_381017 - BLOCK
      ?auto_381018 - BLOCK
      ?auto_381019 - BLOCK
      ?auto_381020 - BLOCK
      ?auto_381021 - BLOCK
      ?auto_381022 - BLOCK
      ?auto_381023 - BLOCK
      ?auto_381024 - BLOCK
      ?auto_381025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_381025 ) ( ON-TABLE ?auto_381011 ) ( ON ?auto_381012 ?auto_381011 ) ( ON ?auto_381013 ?auto_381012 ) ( ON ?auto_381014 ?auto_381013 ) ( ON ?auto_381015 ?auto_381014 ) ( ON ?auto_381016 ?auto_381015 ) ( ON ?auto_381017 ?auto_381016 ) ( not ( = ?auto_381011 ?auto_381012 ) ) ( not ( = ?auto_381011 ?auto_381013 ) ) ( not ( = ?auto_381011 ?auto_381014 ) ) ( not ( = ?auto_381011 ?auto_381015 ) ) ( not ( = ?auto_381011 ?auto_381016 ) ) ( not ( = ?auto_381011 ?auto_381017 ) ) ( not ( = ?auto_381011 ?auto_381018 ) ) ( not ( = ?auto_381011 ?auto_381019 ) ) ( not ( = ?auto_381011 ?auto_381020 ) ) ( not ( = ?auto_381011 ?auto_381021 ) ) ( not ( = ?auto_381011 ?auto_381022 ) ) ( not ( = ?auto_381011 ?auto_381023 ) ) ( not ( = ?auto_381011 ?auto_381024 ) ) ( not ( = ?auto_381011 ?auto_381025 ) ) ( not ( = ?auto_381012 ?auto_381013 ) ) ( not ( = ?auto_381012 ?auto_381014 ) ) ( not ( = ?auto_381012 ?auto_381015 ) ) ( not ( = ?auto_381012 ?auto_381016 ) ) ( not ( = ?auto_381012 ?auto_381017 ) ) ( not ( = ?auto_381012 ?auto_381018 ) ) ( not ( = ?auto_381012 ?auto_381019 ) ) ( not ( = ?auto_381012 ?auto_381020 ) ) ( not ( = ?auto_381012 ?auto_381021 ) ) ( not ( = ?auto_381012 ?auto_381022 ) ) ( not ( = ?auto_381012 ?auto_381023 ) ) ( not ( = ?auto_381012 ?auto_381024 ) ) ( not ( = ?auto_381012 ?auto_381025 ) ) ( not ( = ?auto_381013 ?auto_381014 ) ) ( not ( = ?auto_381013 ?auto_381015 ) ) ( not ( = ?auto_381013 ?auto_381016 ) ) ( not ( = ?auto_381013 ?auto_381017 ) ) ( not ( = ?auto_381013 ?auto_381018 ) ) ( not ( = ?auto_381013 ?auto_381019 ) ) ( not ( = ?auto_381013 ?auto_381020 ) ) ( not ( = ?auto_381013 ?auto_381021 ) ) ( not ( = ?auto_381013 ?auto_381022 ) ) ( not ( = ?auto_381013 ?auto_381023 ) ) ( not ( = ?auto_381013 ?auto_381024 ) ) ( not ( = ?auto_381013 ?auto_381025 ) ) ( not ( = ?auto_381014 ?auto_381015 ) ) ( not ( = ?auto_381014 ?auto_381016 ) ) ( not ( = ?auto_381014 ?auto_381017 ) ) ( not ( = ?auto_381014 ?auto_381018 ) ) ( not ( = ?auto_381014 ?auto_381019 ) ) ( not ( = ?auto_381014 ?auto_381020 ) ) ( not ( = ?auto_381014 ?auto_381021 ) ) ( not ( = ?auto_381014 ?auto_381022 ) ) ( not ( = ?auto_381014 ?auto_381023 ) ) ( not ( = ?auto_381014 ?auto_381024 ) ) ( not ( = ?auto_381014 ?auto_381025 ) ) ( not ( = ?auto_381015 ?auto_381016 ) ) ( not ( = ?auto_381015 ?auto_381017 ) ) ( not ( = ?auto_381015 ?auto_381018 ) ) ( not ( = ?auto_381015 ?auto_381019 ) ) ( not ( = ?auto_381015 ?auto_381020 ) ) ( not ( = ?auto_381015 ?auto_381021 ) ) ( not ( = ?auto_381015 ?auto_381022 ) ) ( not ( = ?auto_381015 ?auto_381023 ) ) ( not ( = ?auto_381015 ?auto_381024 ) ) ( not ( = ?auto_381015 ?auto_381025 ) ) ( not ( = ?auto_381016 ?auto_381017 ) ) ( not ( = ?auto_381016 ?auto_381018 ) ) ( not ( = ?auto_381016 ?auto_381019 ) ) ( not ( = ?auto_381016 ?auto_381020 ) ) ( not ( = ?auto_381016 ?auto_381021 ) ) ( not ( = ?auto_381016 ?auto_381022 ) ) ( not ( = ?auto_381016 ?auto_381023 ) ) ( not ( = ?auto_381016 ?auto_381024 ) ) ( not ( = ?auto_381016 ?auto_381025 ) ) ( not ( = ?auto_381017 ?auto_381018 ) ) ( not ( = ?auto_381017 ?auto_381019 ) ) ( not ( = ?auto_381017 ?auto_381020 ) ) ( not ( = ?auto_381017 ?auto_381021 ) ) ( not ( = ?auto_381017 ?auto_381022 ) ) ( not ( = ?auto_381017 ?auto_381023 ) ) ( not ( = ?auto_381017 ?auto_381024 ) ) ( not ( = ?auto_381017 ?auto_381025 ) ) ( not ( = ?auto_381018 ?auto_381019 ) ) ( not ( = ?auto_381018 ?auto_381020 ) ) ( not ( = ?auto_381018 ?auto_381021 ) ) ( not ( = ?auto_381018 ?auto_381022 ) ) ( not ( = ?auto_381018 ?auto_381023 ) ) ( not ( = ?auto_381018 ?auto_381024 ) ) ( not ( = ?auto_381018 ?auto_381025 ) ) ( not ( = ?auto_381019 ?auto_381020 ) ) ( not ( = ?auto_381019 ?auto_381021 ) ) ( not ( = ?auto_381019 ?auto_381022 ) ) ( not ( = ?auto_381019 ?auto_381023 ) ) ( not ( = ?auto_381019 ?auto_381024 ) ) ( not ( = ?auto_381019 ?auto_381025 ) ) ( not ( = ?auto_381020 ?auto_381021 ) ) ( not ( = ?auto_381020 ?auto_381022 ) ) ( not ( = ?auto_381020 ?auto_381023 ) ) ( not ( = ?auto_381020 ?auto_381024 ) ) ( not ( = ?auto_381020 ?auto_381025 ) ) ( not ( = ?auto_381021 ?auto_381022 ) ) ( not ( = ?auto_381021 ?auto_381023 ) ) ( not ( = ?auto_381021 ?auto_381024 ) ) ( not ( = ?auto_381021 ?auto_381025 ) ) ( not ( = ?auto_381022 ?auto_381023 ) ) ( not ( = ?auto_381022 ?auto_381024 ) ) ( not ( = ?auto_381022 ?auto_381025 ) ) ( not ( = ?auto_381023 ?auto_381024 ) ) ( not ( = ?auto_381023 ?auto_381025 ) ) ( not ( = ?auto_381024 ?auto_381025 ) ) ( ON ?auto_381024 ?auto_381025 ) ( ON ?auto_381023 ?auto_381024 ) ( ON ?auto_381022 ?auto_381023 ) ( ON ?auto_381021 ?auto_381022 ) ( ON ?auto_381020 ?auto_381021 ) ( ON ?auto_381019 ?auto_381020 ) ( CLEAR ?auto_381017 ) ( ON ?auto_381018 ?auto_381019 ) ( CLEAR ?auto_381018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_381011 ?auto_381012 ?auto_381013 ?auto_381014 ?auto_381015 ?auto_381016 ?auto_381017 ?auto_381018 )
      ( MAKE-15PILE ?auto_381011 ?auto_381012 ?auto_381013 ?auto_381014 ?auto_381015 ?auto_381016 ?auto_381017 ?auto_381018 ?auto_381019 ?auto_381020 ?auto_381021 ?auto_381022 ?auto_381023 ?auto_381024 ?auto_381025 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381041 - BLOCK
      ?auto_381042 - BLOCK
      ?auto_381043 - BLOCK
      ?auto_381044 - BLOCK
      ?auto_381045 - BLOCK
      ?auto_381046 - BLOCK
      ?auto_381047 - BLOCK
      ?auto_381048 - BLOCK
      ?auto_381049 - BLOCK
      ?auto_381050 - BLOCK
      ?auto_381051 - BLOCK
      ?auto_381052 - BLOCK
      ?auto_381053 - BLOCK
      ?auto_381054 - BLOCK
      ?auto_381055 - BLOCK
    )
    :vars
    (
      ?auto_381056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381055 ?auto_381056 ) ( ON-TABLE ?auto_381041 ) ( ON ?auto_381042 ?auto_381041 ) ( ON ?auto_381043 ?auto_381042 ) ( ON ?auto_381044 ?auto_381043 ) ( ON ?auto_381045 ?auto_381044 ) ( ON ?auto_381046 ?auto_381045 ) ( not ( = ?auto_381041 ?auto_381042 ) ) ( not ( = ?auto_381041 ?auto_381043 ) ) ( not ( = ?auto_381041 ?auto_381044 ) ) ( not ( = ?auto_381041 ?auto_381045 ) ) ( not ( = ?auto_381041 ?auto_381046 ) ) ( not ( = ?auto_381041 ?auto_381047 ) ) ( not ( = ?auto_381041 ?auto_381048 ) ) ( not ( = ?auto_381041 ?auto_381049 ) ) ( not ( = ?auto_381041 ?auto_381050 ) ) ( not ( = ?auto_381041 ?auto_381051 ) ) ( not ( = ?auto_381041 ?auto_381052 ) ) ( not ( = ?auto_381041 ?auto_381053 ) ) ( not ( = ?auto_381041 ?auto_381054 ) ) ( not ( = ?auto_381041 ?auto_381055 ) ) ( not ( = ?auto_381041 ?auto_381056 ) ) ( not ( = ?auto_381042 ?auto_381043 ) ) ( not ( = ?auto_381042 ?auto_381044 ) ) ( not ( = ?auto_381042 ?auto_381045 ) ) ( not ( = ?auto_381042 ?auto_381046 ) ) ( not ( = ?auto_381042 ?auto_381047 ) ) ( not ( = ?auto_381042 ?auto_381048 ) ) ( not ( = ?auto_381042 ?auto_381049 ) ) ( not ( = ?auto_381042 ?auto_381050 ) ) ( not ( = ?auto_381042 ?auto_381051 ) ) ( not ( = ?auto_381042 ?auto_381052 ) ) ( not ( = ?auto_381042 ?auto_381053 ) ) ( not ( = ?auto_381042 ?auto_381054 ) ) ( not ( = ?auto_381042 ?auto_381055 ) ) ( not ( = ?auto_381042 ?auto_381056 ) ) ( not ( = ?auto_381043 ?auto_381044 ) ) ( not ( = ?auto_381043 ?auto_381045 ) ) ( not ( = ?auto_381043 ?auto_381046 ) ) ( not ( = ?auto_381043 ?auto_381047 ) ) ( not ( = ?auto_381043 ?auto_381048 ) ) ( not ( = ?auto_381043 ?auto_381049 ) ) ( not ( = ?auto_381043 ?auto_381050 ) ) ( not ( = ?auto_381043 ?auto_381051 ) ) ( not ( = ?auto_381043 ?auto_381052 ) ) ( not ( = ?auto_381043 ?auto_381053 ) ) ( not ( = ?auto_381043 ?auto_381054 ) ) ( not ( = ?auto_381043 ?auto_381055 ) ) ( not ( = ?auto_381043 ?auto_381056 ) ) ( not ( = ?auto_381044 ?auto_381045 ) ) ( not ( = ?auto_381044 ?auto_381046 ) ) ( not ( = ?auto_381044 ?auto_381047 ) ) ( not ( = ?auto_381044 ?auto_381048 ) ) ( not ( = ?auto_381044 ?auto_381049 ) ) ( not ( = ?auto_381044 ?auto_381050 ) ) ( not ( = ?auto_381044 ?auto_381051 ) ) ( not ( = ?auto_381044 ?auto_381052 ) ) ( not ( = ?auto_381044 ?auto_381053 ) ) ( not ( = ?auto_381044 ?auto_381054 ) ) ( not ( = ?auto_381044 ?auto_381055 ) ) ( not ( = ?auto_381044 ?auto_381056 ) ) ( not ( = ?auto_381045 ?auto_381046 ) ) ( not ( = ?auto_381045 ?auto_381047 ) ) ( not ( = ?auto_381045 ?auto_381048 ) ) ( not ( = ?auto_381045 ?auto_381049 ) ) ( not ( = ?auto_381045 ?auto_381050 ) ) ( not ( = ?auto_381045 ?auto_381051 ) ) ( not ( = ?auto_381045 ?auto_381052 ) ) ( not ( = ?auto_381045 ?auto_381053 ) ) ( not ( = ?auto_381045 ?auto_381054 ) ) ( not ( = ?auto_381045 ?auto_381055 ) ) ( not ( = ?auto_381045 ?auto_381056 ) ) ( not ( = ?auto_381046 ?auto_381047 ) ) ( not ( = ?auto_381046 ?auto_381048 ) ) ( not ( = ?auto_381046 ?auto_381049 ) ) ( not ( = ?auto_381046 ?auto_381050 ) ) ( not ( = ?auto_381046 ?auto_381051 ) ) ( not ( = ?auto_381046 ?auto_381052 ) ) ( not ( = ?auto_381046 ?auto_381053 ) ) ( not ( = ?auto_381046 ?auto_381054 ) ) ( not ( = ?auto_381046 ?auto_381055 ) ) ( not ( = ?auto_381046 ?auto_381056 ) ) ( not ( = ?auto_381047 ?auto_381048 ) ) ( not ( = ?auto_381047 ?auto_381049 ) ) ( not ( = ?auto_381047 ?auto_381050 ) ) ( not ( = ?auto_381047 ?auto_381051 ) ) ( not ( = ?auto_381047 ?auto_381052 ) ) ( not ( = ?auto_381047 ?auto_381053 ) ) ( not ( = ?auto_381047 ?auto_381054 ) ) ( not ( = ?auto_381047 ?auto_381055 ) ) ( not ( = ?auto_381047 ?auto_381056 ) ) ( not ( = ?auto_381048 ?auto_381049 ) ) ( not ( = ?auto_381048 ?auto_381050 ) ) ( not ( = ?auto_381048 ?auto_381051 ) ) ( not ( = ?auto_381048 ?auto_381052 ) ) ( not ( = ?auto_381048 ?auto_381053 ) ) ( not ( = ?auto_381048 ?auto_381054 ) ) ( not ( = ?auto_381048 ?auto_381055 ) ) ( not ( = ?auto_381048 ?auto_381056 ) ) ( not ( = ?auto_381049 ?auto_381050 ) ) ( not ( = ?auto_381049 ?auto_381051 ) ) ( not ( = ?auto_381049 ?auto_381052 ) ) ( not ( = ?auto_381049 ?auto_381053 ) ) ( not ( = ?auto_381049 ?auto_381054 ) ) ( not ( = ?auto_381049 ?auto_381055 ) ) ( not ( = ?auto_381049 ?auto_381056 ) ) ( not ( = ?auto_381050 ?auto_381051 ) ) ( not ( = ?auto_381050 ?auto_381052 ) ) ( not ( = ?auto_381050 ?auto_381053 ) ) ( not ( = ?auto_381050 ?auto_381054 ) ) ( not ( = ?auto_381050 ?auto_381055 ) ) ( not ( = ?auto_381050 ?auto_381056 ) ) ( not ( = ?auto_381051 ?auto_381052 ) ) ( not ( = ?auto_381051 ?auto_381053 ) ) ( not ( = ?auto_381051 ?auto_381054 ) ) ( not ( = ?auto_381051 ?auto_381055 ) ) ( not ( = ?auto_381051 ?auto_381056 ) ) ( not ( = ?auto_381052 ?auto_381053 ) ) ( not ( = ?auto_381052 ?auto_381054 ) ) ( not ( = ?auto_381052 ?auto_381055 ) ) ( not ( = ?auto_381052 ?auto_381056 ) ) ( not ( = ?auto_381053 ?auto_381054 ) ) ( not ( = ?auto_381053 ?auto_381055 ) ) ( not ( = ?auto_381053 ?auto_381056 ) ) ( not ( = ?auto_381054 ?auto_381055 ) ) ( not ( = ?auto_381054 ?auto_381056 ) ) ( not ( = ?auto_381055 ?auto_381056 ) ) ( ON ?auto_381054 ?auto_381055 ) ( ON ?auto_381053 ?auto_381054 ) ( ON ?auto_381052 ?auto_381053 ) ( ON ?auto_381051 ?auto_381052 ) ( ON ?auto_381050 ?auto_381051 ) ( ON ?auto_381049 ?auto_381050 ) ( ON ?auto_381048 ?auto_381049 ) ( CLEAR ?auto_381046 ) ( ON ?auto_381047 ?auto_381048 ) ( CLEAR ?auto_381047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_381041 ?auto_381042 ?auto_381043 ?auto_381044 ?auto_381045 ?auto_381046 ?auto_381047 )
      ( MAKE-15PILE ?auto_381041 ?auto_381042 ?auto_381043 ?auto_381044 ?auto_381045 ?auto_381046 ?auto_381047 ?auto_381048 ?auto_381049 ?auto_381050 ?auto_381051 ?auto_381052 ?auto_381053 ?auto_381054 ?auto_381055 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381072 - BLOCK
      ?auto_381073 - BLOCK
      ?auto_381074 - BLOCK
      ?auto_381075 - BLOCK
      ?auto_381076 - BLOCK
      ?auto_381077 - BLOCK
      ?auto_381078 - BLOCK
      ?auto_381079 - BLOCK
      ?auto_381080 - BLOCK
      ?auto_381081 - BLOCK
      ?auto_381082 - BLOCK
      ?auto_381083 - BLOCK
      ?auto_381084 - BLOCK
      ?auto_381085 - BLOCK
      ?auto_381086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_381086 ) ( ON-TABLE ?auto_381072 ) ( ON ?auto_381073 ?auto_381072 ) ( ON ?auto_381074 ?auto_381073 ) ( ON ?auto_381075 ?auto_381074 ) ( ON ?auto_381076 ?auto_381075 ) ( ON ?auto_381077 ?auto_381076 ) ( not ( = ?auto_381072 ?auto_381073 ) ) ( not ( = ?auto_381072 ?auto_381074 ) ) ( not ( = ?auto_381072 ?auto_381075 ) ) ( not ( = ?auto_381072 ?auto_381076 ) ) ( not ( = ?auto_381072 ?auto_381077 ) ) ( not ( = ?auto_381072 ?auto_381078 ) ) ( not ( = ?auto_381072 ?auto_381079 ) ) ( not ( = ?auto_381072 ?auto_381080 ) ) ( not ( = ?auto_381072 ?auto_381081 ) ) ( not ( = ?auto_381072 ?auto_381082 ) ) ( not ( = ?auto_381072 ?auto_381083 ) ) ( not ( = ?auto_381072 ?auto_381084 ) ) ( not ( = ?auto_381072 ?auto_381085 ) ) ( not ( = ?auto_381072 ?auto_381086 ) ) ( not ( = ?auto_381073 ?auto_381074 ) ) ( not ( = ?auto_381073 ?auto_381075 ) ) ( not ( = ?auto_381073 ?auto_381076 ) ) ( not ( = ?auto_381073 ?auto_381077 ) ) ( not ( = ?auto_381073 ?auto_381078 ) ) ( not ( = ?auto_381073 ?auto_381079 ) ) ( not ( = ?auto_381073 ?auto_381080 ) ) ( not ( = ?auto_381073 ?auto_381081 ) ) ( not ( = ?auto_381073 ?auto_381082 ) ) ( not ( = ?auto_381073 ?auto_381083 ) ) ( not ( = ?auto_381073 ?auto_381084 ) ) ( not ( = ?auto_381073 ?auto_381085 ) ) ( not ( = ?auto_381073 ?auto_381086 ) ) ( not ( = ?auto_381074 ?auto_381075 ) ) ( not ( = ?auto_381074 ?auto_381076 ) ) ( not ( = ?auto_381074 ?auto_381077 ) ) ( not ( = ?auto_381074 ?auto_381078 ) ) ( not ( = ?auto_381074 ?auto_381079 ) ) ( not ( = ?auto_381074 ?auto_381080 ) ) ( not ( = ?auto_381074 ?auto_381081 ) ) ( not ( = ?auto_381074 ?auto_381082 ) ) ( not ( = ?auto_381074 ?auto_381083 ) ) ( not ( = ?auto_381074 ?auto_381084 ) ) ( not ( = ?auto_381074 ?auto_381085 ) ) ( not ( = ?auto_381074 ?auto_381086 ) ) ( not ( = ?auto_381075 ?auto_381076 ) ) ( not ( = ?auto_381075 ?auto_381077 ) ) ( not ( = ?auto_381075 ?auto_381078 ) ) ( not ( = ?auto_381075 ?auto_381079 ) ) ( not ( = ?auto_381075 ?auto_381080 ) ) ( not ( = ?auto_381075 ?auto_381081 ) ) ( not ( = ?auto_381075 ?auto_381082 ) ) ( not ( = ?auto_381075 ?auto_381083 ) ) ( not ( = ?auto_381075 ?auto_381084 ) ) ( not ( = ?auto_381075 ?auto_381085 ) ) ( not ( = ?auto_381075 ?auto_381086 ) ) ( not ( = ?auto_381076 ?auto_381077 ) ) ( not ( = ?auto_381076 ?auto_381078 ) ) ( not ( = ?auto_381076 ?auto_381079 ) ) ( not ( = ?auto_381076 ?auto_381080 ) ) ( not ( = ?auto_381076 ?auto_381081 ) ) ( not ( = ?auto_381076 ?auto_381082 ) ) ( not ( = ?auto_381076 ?auto_381083 ) ) ( not ( = ?auto_381076 ?auto_381084 ) ) ( not ( = ?auto_381076 ?auto_381085 ) ) ( not ( = ?auto_381076 ?auto_381086 ) ) ( not ( = ?auto_381077 ?auto_381078 ) ) ( not ( = ?auto_381077 ?auto_381079 ) ) ( not ( = ?auto_381077 ?auto_381080 ) ) ( not ( = ?auto_381077 ?auto_381081 ) ) ( not ( = ?auto_381077 ?auto_381082 ) ) ( not ( = ?auto_381077 ?auto_381083 ) ) ( not ( = ?auto_381077 ?auto_381084 ) ) ( not ( = ?auto_381077 ?auto_381085 ) ) ( not ( = ?auto_381077 ?auto_381086 ) ) ( not ( = ?auto_381078 ?auto_381079 ) ) ( not ( = ?auto_381078 ?auto_381080 ) ) ( not ( = ?auto_381078 ?auto_381081 ) ) ( not ( = ?auto_381078 ?auto_381082 ) ) ( not ( = ?auto_381078 ?auto_381083 ) ) ( not ( = ?auto_381078 ?auto_381084 ) ) ( not ( = ?auto_381078 ?auto_381085 ) ) ( not ( = ?auto_381078 ?auto_381086 ) ) ( not ( = ?auto_381079 ?auto_381080 ) ) ( not ( = ?auto_381079 ?auto_381081 ) ) ( not ( = ?auto_381079 ?auto_381082 ) ) ( not ( = ?auto_381079 ?auto_381083 ) ) ( not ( = ?auto_381079 ?auto_381084 ) ) ( not ( = ?auto_381079 ?auto_381085 ) ) ( not ( = ?auto_381079 ?auto_381086 ) ) ( not ( = ?auto_381080 ?auto_381081 ) ) ( not ( = ?auto_381080 ?auto_381082 ) ) ( not ( = ?auto_381080 ?auto_381083 ) ) ( not ( = ?auto_381080 ?auto_381084 ) ) ( not ( = ?auto_381080 ?auto_381085 ) ) ( not ( = ?auto_381080 ?auto_381086 ) ) ( not ( = ?auto_381081 ?auto_381082 ) ) ( not ( = ?auto_381081 ?auto_381083 ) ) ( not ( = ?auto_381081 ?auto_381084 ) ) ( not ( = ?auto_381081 ?auto_381085 ) ) ( not ( = ?auto_381081 ?auto_381086 ) ) ( not ( = ?auto_381082 ?auto_381083 ) ) ( not ( = ?auto_381082 ?auto_381084 ) ) ( not ( = ?auto_381082 ?auto_381085 ) ) ( not ( = ?auto_381082 ?auto_381086 ) ) ( not ( = ?auto_381083 ?auto_381084 ) ) ( not ( = ?auto_381083 ?auto_381085 ) ) ( not ( = ?auto_381083 ?auto_381086 ) ) ( not ( = ?auto_381084 ?auto_381085 ) ) ( not ( = ?auto_381084 ?auto_381086 ) ) ( not ( = ?auto_381085 ?auto_381086 ) ) ( ON ?auto_381085 ?auto_381086 ) ( ON ?auto_381084 ?auto_381085 ) ( ON ?auto_381083 ?auto_381084 ) ( ON ?auto_381082 ?auto_381083 ) ( ON ?auto_381081 ?auto_381082 ) ( ON ?auto_381080 ?auto_381081 ) ( ON ?auto_381079 ?auto_381080 ) ( CLEAR ?auto_381077 ) ( ON ?auto_381078 ?auto_381079 ) ( CLEAR ?auto_381078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_381072 ?auto_381073 ?auto_381074 ?auto_381075 ?auto_381076 ?auto_381077 ?auto_381078 )
      ( MAKE-15PILE ?auto_381072 ?auto_381073 ?auto_381074 ?auto_381075 ?auto_381076 ?auto_381077 ?auto_381078 ?auto_381079 ?auto_381080 ?auto_381081 ?auto_381082 ?auto_381083 ?auto_381084 ?auto_381085 ?auto_381086 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381102 - BLOCK
      ?auto_381103 - BLOCK
      ?auto_381104 - BLOCK
      ?auto_381105 - BLOCK
      ?auto_381106 - BLOCK
      ?auto_381107 - BLOCK
      ?auto_381108 - BLOCK
      ?auto_381109 - BLOCK
      ?auto_381110 - BLOCK
      ?auto_381111 - BLOCK
      ?auto_381112 - BLOCK
      ?auto_381113 - BLOCK
      ?auto_381114 - BLOCK
      ?auto_381115 - BLOCK
      ?auto_381116 - BLOCK
    )
    :vars
    (
      ?auto_381117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381116 ?auto_381117 ) ( ON-TABLE ?auto_381102 ) ( ON ?auto_381103 ?auto_381102 ) ( ON ?auto_381104 ?auto_381103 ) ( ON ?auto_381105 ?auto_381104 ) ( ON ?auto_381106 ?auto_381105 ) ( not ( = ?auto_381102 ?auto_381103 ) ) ( not ( = ?auto_381102 ?auto_381104 ) ) ( not ( = ?auto_381102 ?auto_381105 ) ) ( not ( = ?auto_381102 ?auto_381106 ) ) ( not ( = ?auto_381102 ?auto_381107 ) ) ( not ( = ?auto_381102 ?auto_381108 ) ) ( not ( = ?auto_381102 ?auto_381109 ) ) ( not ( = ?auto_381102 ?auto_381110 ) ) ( not ( = ?auto_381102 ?auto_381111 ) ) ( not ( = ?auto_381102 ?auto_381112 ) ) ( not ( = ?auto_381102 ?auto_381113 ) ) ( not ( = ?auto_381102 ?auto_381114 ) ) ( not ( = ?auto_381102 ?auto_381115 ) ) ( not ( = ?auto_381102 ?auto_381116 ) ) ( not ( = ?auto_381102 ?auto_381117 ) ) ( not ( = ?auto_381103 ?auto_381104 ) ) ( not ( = ?auto_381103 ?auto_381105 ) ) ( not ( = ?auto_381103 ?auto_381106 ) ) ( not ( = ?auto_381103 ?auto_381107 ) ) ( not ( = ?auto_381103 ?auto_381108 ) ) ( not ( = ?auto_381103 ?auto_381109 ) ) ( not ( = ?auto_381103 ?auto_381110 ) ) ( not ( = ?auto_381103 ?auto_381111 ) ) ( not ( = ?auto_381103 ?auto_381112 ) ) ( not ( = ?auto_381103 ?auto_381113 ) ) ( not ( = ?auto_381103 ?auto_381114 ) ) ( not ( = ?auto_381103 ?auto_381115 ) ) ( not ( = ?auto_381103 ?auto_381116 ) ) ( not ( = ?auto_381103 ?auto_381117 ) ) ( not ( = ?auto_381104 ?auto_381105 ) ) ( not ( = ?auto_381104 ?auto_381106 ) ) ( not ( = ?auto_381104 ?auto_381107 ) ) ( not ( = ?auto_381104 ?auto_381108 ) ) ( not ( = ?auto_381104 ?auto_381109 ) ) ( not ( = ?auto_381104 ?auto_381110 ) ) ( not ( = ?auto_381104 ?auto_381111 ) ) ( not ( = ?auto_381104 ?auto_381112 ) ) ( not ( = ?auto_381104 ?auto_381113 ) ) ( not ( = ?auto_381104 ?auto_381114 ) ) ( not ( = ?auto_381104 ?auto_381115 ) ) ( not ( = ?auto_381104 ?auto_381116 ) ) ( not ( = ?auto_381104 ?auto_381117 ) ) ( not ( = ?auto_381105 ?auto_381106 ) ) ( not ( = ?auto_381105 ?auto_381107 ) ) ( not ( = ?auto_381105 ?auto_381108 ) ) ( not ( = ?auto_381105 ?auto_381109 ) ) ( not ( = ?auto_381105 ?auto_381110 ) ) ( not ( = ?auto_381105 ?auto_381111 ) ) ( not ( = ?auto_381105 ?auto_381112 ) ) ( not ( = ?auto_381105 ?auto_381113 ) ) ( not ( = ?auto_381105 ?auto_381114 ) ) ( not ( = ?auto_381105 ?auto_381115 ) ) ( not ( = ?auto_381105 ?auto_381116 ) ) ( not ( = ?auto_381105 ?auto_381117 ) ) ( not ( = ?auto_381106 ?auto_381107 ) ) ( not ( = ?auto_381106 ?auto_381108 ) ) ( not ( = ?auto_381106 ?auto_381109 ) ) ( not ( = ?auto_381106 ?auto_381110 ) ) ( not ( = ?auto_381106 ?auto_381111 ) ) ( not ( = ?auto_381106 ?auto_381112 ) ) ( not ( = ?auto_381106 ?auto_381113 ) ) ( not ( = ?auto_381106 ?auto_381114 ) ) ( not ( = ?auto_381106 ?auto_381115 ) ) ( not ( = ?auto_381106 ?auto_381116 ) ) ( not ( = ?auto_381106 ?auto_381117 ) ) ( not ( = ?auto_381107 ?auto_381108 ) ) ( not ( = ?auto_381107 ?auto_381109 ) ) ( not ( = ?auto_381107 ?auto_381110 ) ) ( not ( = ?auto_381107 ?auto_381111 ) ) ( not ( = ?auto_381107 ?auto_381112 ) ) ( not ( = ?auto_381107 ?auto_381113 ) ) ( not ( = ?auto_381107 ?auto_381114 ) ) ( not ( = ?auto_381107 ?auto_381115 ) ) ( not ( = ?auto_381107 ?auto_381116 ) ) ( not ( = ?auto_381107 ?auto_381117 ) ) ( not ( = ?auto_381108 ?auto_381109 ) ) ( not ( = ?auto_381108 ?auto_381110 ) ) ( not ( = ?auto_381108 ?auto_381111 ) ) ( not ( = ?auto_381108 ?auto_381112 ) ) ( not ( = ?auto_381108 ?auto_381113 ) ) ( not ( = ?auto_381108 ?auto_381114 ) ) ( not ( = ?auto_381108 ?auto_381115 ) ) ( not ( = ?auto_381108 ?auto_381116 ) ) ( not ( = ?auto_381108 ?auto_381117 ) ) ( not ( = ?auto_381109 ?auto_381110 ) ) ( not ( = ?auto_381109 ?auto_381111 ) ) ( not ( = ?auto_381109 ?auto_381112 ) ) ( not ( = ?auto_381109 ?auto_381113 ) ) ( not ( = ?auto_381109 ?auto_381114 ) ) ( not ( = ?auto_381109 ?auto_381115 ) ) ( not ( = ?auto_381109 ?auto_381116 ) ) ( not ( = ?auto_381109 ?auto_381117 ) ) ( not ( = ?auto_381110 ?auto_381111 ) ) ( not ( = ?auto_381110 ?auto_381112 ) ) ( not ( = ?auto_381110 ?auto_381113 ) ) ( not ( = ?auto_381110 ?auto_381114 ) ) ( not ( = ?auto_381110 ?auto_381115 ) ) ( not ( = ?auto_381110 ?auto_381116 ) ) ( not ( = ?auto_381110 ?auto_381117 ) ) ( not ( = ?auto_381111 ?auto_381112 ) ) ( not ( = ?auto_381111 ?auto_381113 ) ) ( not ( = ?auto_381111 ?auto_381114 ) ) ( not ( = ?auto_381111 ?auto_381115 ) ) ( not ( = ?auto_381111 ?auto_381116 ) ) ( not ( = ?auto_381111 ?auto_381117 ) ) ( not ( = ?auto_381112 ?auto_381113 ) ) ( not ( = ?auto_381112 ?auto_381114 ) ) ( not ( = ?auto_381112 ?auto_381115 ) ) ( not ( = ?auto_381112 ?auto_381116 ) ) ( not ( = ?auto_381112 ?auto_381117 ) ) ( not ( = ?auto_381113 ?auto_381114 ) ) ( not ( = ?auto_381113 ?auto_381115 ) ) ( not ( = ?auto_381113 ?auto_381116 ) ) ( not ( = ?auto_381113 ?auto_381117 ) ) ( not ( = ?auto_381114 ?auto_381115 ) ) ( not ( = ?auto_381114 ?auto_381116 ) ) ( not ( = ?auto_381114 ?auto_381117 ) ) ( not ( = ?auto_381115 ?auto_381116 ) ) ( not ( = ?auto_381115 ?auto_381117 ) ) ( not ( = ?auto_381116 ?auto_381117 ) ) ( ON ?auto_381115 ?auto_381116 ) ( ON ?auto_381114 ?auto_381115 ) ( ON ?auto_381113 ?auto_381114 ) ( ON ?auto_381112 ?auto_381113 ) ( ON ?auto_381111 ?auto_381112 ) ( ON ?auto_381110 ?auto_381111 ) ( ON ?auto_381109 ?auto_381110 ) ( ON ?auto_381108 ?auto_381109 ) ( CLEAR ?auto_381106 ) ( ON ?auto_381107 ?auto_381108 ) ( CLEAR ?auto_381107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_381102 ?auto_381103 ?auto_381104 ?auto_381105 ?auto_381106 ?auto_381107 )
      ( MAKE-15PILE ?auto_381102 ?auto_381103 ?auto_381104 ?auto_381105 ?auto_381106 ?auto_381107 ?auto_381108 ?auto_381109 ?auto_381110 ?auto_381111 ?auto_381112 ?auto_381113 ?auto_381114 ?auto_381115 ?auto_381116 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381133 - BLOCK
      ?auto_381134 - BLOCK
      ?auto_381135 - BLOCK
      ?auto_381136 - BLOCK
      ?auto_381137 - BLOCK
      ?auto_381138 - BLOCK
      ?auto_381139 - BLOCK
      ?auto_381140 - BLOCK
      ?auto_381141 - BLOCK
      ?auto_381142 - BLOCK
      ?auto_381143 - BLOCK
      ?auto_381144 - BLOCK
      ?auto_381145 - BLOCK
      ?auto_381146 - BLOCK
      ?auto_381147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_381147 ) ( ON-TABLE ?auto_381133 ) ( ON ?auto_381134 ?auto_381133 ) ( ON ?auto_381135 ?auto_381134 ) ( ON ?auto_381136 ?auto_381135 ) ( ON ?auto_381137 ?auto_381136 ) ( not ( = ?auto_381133 ?auto_381134 ) ) ( not ( = ?auto_381133 ?auto_381135 ) ) ( not ( = ?auto_381133 ?auto_381136 ) ) ( not ( = ?auto_381133 ?auto_381137 ) ) ( not ( = ?auto_381133 ?auto_381138 ) ) ( not ( = ?auto_381133 ?auto_381139 ) ) ( not ( = ?auto_381133 ?auto_381140 ) ) ( not ( = ?auto_381133 ?auto_381141 ) ) ( not ( = ?auto_381133 ?auto_381142 ) ) ( not ( = ?auto_381133 ?auto_381143 ) ) ( not ( = ?auto_381133 ?auto_381144 ) ) ( not ( = ?auto_381133 ?auto_381145 ) ) ( not ( = ?auto_381133 ?auto_381146 ) ) ( not ( = ?auto_381133 ?auto_381147 ) ) ( not ( = ?auto_381134 ?auto_381135 ) ) ( not ( = ?auto_381134 ?auto_381136 ) ) ( not ( = ?auto_381134 ?auto_381137 ) ) ( not ( = ?auto_381134 ?auto_381138 ) ) ( not ( = ?auto_381134 ?auto_381139 ) ) ( not ( = ?auto_381134 ?auto_381140 ) ) ( not ( = ?auto_381134 ?auto_381141 ) ) ( not ( = ?auto_381134 ?auto_381142 ) ) ( not ( = ?auto_381134 ?auto_381143 ) ) ( not ( = ?auto_381134 ?auto_381144 ) ) ( not ( = ?auto_381134 ?auto_381145 ) ) ( not ( = ?auto_381134 ?auto_381146 ) ) ( not ( = ?auto_381134 ?auto_381147 ) ) ( not ( = ?auto_381135 ?auto_381136 ) ) ( not ( = ?auto_381135 ?auto_381137 ) ) ( not ( = ?auto_381135 ?auto_381138 ) ) ( not ( = ?auto_381135 ?auto_381139 ) ) ( not ( = ?auto_381135 ?auto_381140 ) ) ( not ( = ?auto_381135 ?auto_381141 ) ) ( not ( = ?auto_381135 ?auto_381142 ) ) ( not ( = ?auto_381135 ?auto_381143 ) ) ( not ( = ?auto_381135 ?auto_381144 ) ) ( not ( = ?auto_381135 ?auto_381145 ) ) ( not ( = ?auto_381135 ?auto_381146 ) ) ( not ( = ?auto_381135 ?auto_381147 ) ) ( not ( = ?auto_381136 ?auto_381137 ) ) ( not ( = ?auto_381136 ?auto_381138 ) ) ( not ( = ?auto_381136 ?auto_381139 ) ) ( not ( = ?auto_381136 ?auto_381140 ) ) ( not ( = ?auto_381136 ?auto_381141 ) ) ( not ( = ?auto_381136 ?auto_381142 ) ) ( not ( = ?auto_381136 ?auto_381143 ) ) ( not ( = ?auto_381136 ?auto_381144 ) ) ( not ( = ?auto_381136 ?auto_381145 ) ) ( not ( = ?auto_381136 ?auto_381146 ) ) ( not ( = ?auto_381136 ?auto_381147 ) ) ( not ( = ?auto_381137 ?auto_381138 ) ) ( not ( = ?auto_381137 ?auto_381139 ) ) ( not ( = ?auto_381137 ?auto_381140 ) ) ( not ( = ?auto_381137 ?auto_381141 ) ) ( not ( = ?auto_381137 ?auto_381142 ) ) ( not ( = ?auto_381137 ?auto_381143 ) ) ( not ( = ?auto_381137 ?auto_381144 ) ) ( not ( = ?auto_381137 ?auto_381145 ) ) ( not ( = ?auto_381137 ?auto_381146 ) ) ( not ( = ?auto_381137 ?auto_381147 ) ) ( not ( = ?auto_381138 ?auto_381139 ) ) ( not ( = ?auto_381138 ?auto_381140 ) ) ( not ( = ?auto_381138 ?auto_381141 ) ) ( not ( = ?auto_381138 ?auto_381142 ) ) ( not ( = ?auto_381138 ?auto_381143 ) ) ( not ( = ?auto_381138 ?auto_381144 ) ) ( not ( = ?auto_381138 ?auto_381145 ) ) ( not ( = ?auto_381138 ?auto_381146 ) ) ( not ( = ?auto_381138 ?auto_381147 ) ) ( not ( = ?auto_381139 ?auto_381140 ) ) ( not ( = ?auto_381139 ?auto_381141 ) ) ( not ( = ?auto_381139 ?auto_381142 ) ) ( not ( = ?auto_381139 ?auto_381143 ) ) ( not ( = ?auto_381139 ?auto_381144 ) ) ( not ( = ?auto_381139 ?auto_381145 ) ) ( not ( = ?auto_381139 ?auto_381146 ) ) ( not ( = ?auto_381139 ?auto_381147 ) ) ( not ( = ?auto_381140 ?auto_381141 ) ) ( not ( = ?auto_381140 ?auto_381142 ) ) ( not ( = ?auto_381140 ?auto_381143 ) ) ( not ( = ?auto_381140 ?auto_381144 ) ) ( not ( = ?auto_381140 ?auto_381145 ) ) ( not ( = ?auto_381140 ?auto_381146 ) ) ( not ( = ?auto_381140 ?auto_381147 ) ) ( not ( = ?auto_381141 ?auto_381142 ) ) ( not ( = ?auto_381141 ?auto_381143 ) ) ( not ( = ?auto_381141 ?auto_381144 ) ) ( not ( = ?auto_381141 ?auto_381145 ) ) ( not ( = ?auto_381141 ?auto_381146 ) ) ( not ( = ?auto_381141 ?auto_381147 ) ) ( not ( = ?auto_381142 ?auto_381143 ) ) ( not ( = ?auto_381142 ?auto_381144 ) ) ( not ( = ?auto_381142 ?auto_381145 ) ) ( not ( = ?auto_381142 ?auto_381146 ) ) ( not ( = ?auto_381142 ?auto_381147 ) ) ( not ( = ?auto_381143 ?auto_381144 ) ) ( not ( = ?auto_381143 ?auto_381145 ) ) ( not ( = ?auto_381143 ?auto_381146 ) ) ( not ( = ?auto_381143 ?auto_381147 ) ) ( not ( = ?auto_381144 ?auto_381145 ) ) ( not ( = ?auto_381144 ?auto_381146 ) ) ( not ( = ?auto_381144 ?auto_381147 ) ) ( not ( = ?auto_381145 ?auto_381146 ) ) ( not ( = ?auto_381145 ?auto_381147 ) ) ( not ( = ?auto_381146 ?auto_381147 ) ) ( ON ?auto_381146 ?auto_381147 ) ( ON ?auto_381145 ?auto_381146 ) ( ON ?auto_381144 ?auto_381145 ) ( ON ?auto_381143 ?auto_381144 ) ( ON ?auto_381142 ?auto_381143 ) ( ON ?auto_381141 ?auto_381142 ) ( ON ?auto_381140 ?auto_381141 ) ( ON ?auto_381139 ?auto_381140 ) ( CLEAR ?auto_381137 ) ( ON ?auto_381138 ?auto_381139 ) ( CLEAR ?auto_381138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_381133 ?auto_381134 ?auto_381135 ?auto_381136 ?auto_381137 ?auto_381138 )
      ( MAKE-15PILE ?auto_381133 ?auto_381134 ?auto_381135 ?auto_381136 ?auto_381137 ?auto_381138 ?auto_381139 ?auto_381140 ?auto_381141 ?auto_381142 ?auto_381143 ?auto_381144 ?auto_381145 ?auto_381146 ?auto_381147 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381163 - BLOCK
      ?auto_381164 - BLOCK
      ?auto_381165 - BLOCK
      ?auto_381166 - BLOCK
      ?auto_381167 - BLOCK
      ?auto_381168 - BLOCK
      ?auto_381169 - BLOCK
      ?auto_381170 - BLOCK
      ?auto_381171 - BLOCK
      ?auto_381172 - BLOCK
      ?auto_381173 - BLOCK
      ?auto_381174 - BLOCK
      ?auto_381175 - BLOCK
      ?auto_381176 - BLOCK
      ?auto_381177 - BLOCK
    )
    :vars
    (
      ?auto_381178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381177 ?auto_381178 ) ( ON-TABLE ?auto_381163 ) ( ON ?auto_381164 ?auto_381163 ) ( ON ?auto_381165 ?auto_381164 ) ( ON ?auto_381166 ?auto_381165 ) ( not ( = ?auto_381163 ?auto_381164 ) ) ( not ( = ?auto_381163 ?auto_381165 ) ) ( not ( = ?auto_381163 ?auto_381166 ) ) ( not ( = ?auto_381163 ?auto_381167 ) ) ( not ( = ?auto_381163 ?auto_381168 ) ) ( not ( = ?auto_381163 ?auto_381169 ) ) ( not ( = ?auto_381163 ?auto_381170 ) ) ( not ( = ?auto_381163 ?auto_381171 ) ) ( not ( = ?auto_381163 ?auto_381172 ) ) ( not ( = ?auto_381163 ?auto_381173 ) ) ( not ( = ?auto_381163 ?auto_381174 ) ) ( not ( = ?auto_381163 ?auto_381175 ) ) ( not ( = ?auto_381163 ?auto_381176 ) ) ( not ( = ?auto_381163 ?auto_381177 ) ) ( not ( = ?auto_381163 ?auto_381178 ) ) ( not ( = ?auto_381164 ?auto_381165 ) ) ( not ( = ?auto_381164 ?auto_381166 ) ) ( not ( = ?auto_381164 ?auto_381167 ) ) ( not ( = ?auto_381164 ?auto_381168 ) ) ( not ( = ?auto_381164 ?auto_381169 ) ) ( not ( = ?auto_381164 ?auto_381170 ) ) ( not ( = ?auto_381164 ?auto_381171 ) ) ( not ( = ?auto_381164 ?auto_381172 ) ) ( not ( = ?auto_381164 ?auto_381173 ) ) ( not ( = ?auto_381164 ?auto_381174 ) ) ( not ( = ?auto_381164 ?auto_381175 ) ) ( not ( = ?auto_381164 ?auto_381176 ) ) ( not ( = ?auto_381164 ?auto_381177 ) ) ( not ( = ?auto_381164 ?auto_381178 ) ) ( not ( = ?auto_381165 ?auto_381166 ) ) ( not ( = ?auto_381165 ?auto_381167 ) ) ( not ( = ?auto_381165 ?auto_381168 ) ) ( not ( = ?auto_381165 ?auto_381169 ) ) ( not ( = ?auto_381165 ?auto_381170 ) ) ( not ( = ?auto_381165 ?auto_381171 ) ) ( not ( = ?auto_381165 ?auto_381172 ) ) ( not ( = ?auto_381165 ?auto_381173 ) ) ( not ( = ?auto_381165 ?auto_381174 ) ) ( not ( = ?auto_381165 ?auto_381175 ) ) ( not ( = ?auto_381165 ?auto_381176 ) ) ( not ( = ?auto_381165 ?auto_381177 ) ) ( not ( = ?auto_381165 ?auto_381178 ) ) ( not ( = ?auto_381166 ?auto_381167 ) ) ( not ( = ?auto_381166 ?auto_381168 ) ) ( not ( = ?auto_381166 ?auto_381169 ) ) ( not ( = ?auto_381166 ?auto_381170 ) ) ( not ( = ?auto_381166 ?auto_381171 ) ) ( not ( = ?auto_381166 ?auto_381172 ) ) ( not ( = ?auto_381166 ?auto_381173 ) ) ( not ( = ?auto_381166 ?auto_381174 ) ) ( not ( = ?auto_381166 ?auto_381175 ) ) ( not ( = ?auto_381166 ?auto_381176 ) ) ( not ( = ?auto_381166 ?auto_381177 ) ) ( not ( = ?auto_381166 ?auto_381178 ) ) ( not ( = ?auto_381167 ?auto_381168 ) ) ( not ( = ?auto_381167 ?auto_381169 ) ) ( not ( = ?auto_381167 ?auto_381170 ) ) ( not ( = ?auto_381167 ?auto_381171 ) ) ( not ( = ?auto_381167 ?auto_381172 ) ) ( not ( = ?auto_381167 ?auto_381173 ) ) ( not ( = ?auto_381167 ?auto_381174 ) ) ( not ( = ?auto_381167 ?auto_381175 ) ) ( not ( = ?auto_381167 ?auto_381176 ) ) ( not ( = ?auto_381167 ?auto_381177 ) ) ( not ( = ?auto_381167 ?auto_381178 ) ) ( not ( = ?auto_381168 ?auto_381169 ) ) ( not ( = ?auto_381168 ?auto_381170 ) ) ( not ( = ?auto_381168 ?auto_381171 ) ) ( not ( = ?auto_381168 ?auto_381172 ) ) ( not ( = ?auto_381168 ?auto_381173 ) ) ( not ( = ?auto_381168 ?auto_381174 ) ) ( not ( = ?auto_381168 ?auto_381175 ) ) ( not ( = ?auto_381168 ?auto_381176 ) ) ( not ( = ?auto_381168 ?auto_381177 ) ) ( not ( = ?auto_381168 ?auto_381178 ) ) ( not ( = ?auto_381169 ?auto_381170 ) ) ( not ( = ?auto_381169 ?auto_381171 ) ) ( not ( = ?auto_381169 ?auto_381172 ) ) ( not ( = ?auto_381169 ?auto_381173 ) ) ( not ( = ?auto_381169 ?auto_381174 ) ) ( not ( = ?auto_381169 ?auto_381175 ) ) ( not ( = ?auto_381169 ?auto_381176 ) ) ( not ( = ?auto_381169 ?auto_381177 ) ) ( not ( = ?auto_381169 ?auto_381178 ) ) ( not ( = ?auto_381170 ?auto_381171 ) ) ( not ( = ?auto_381170 ?auto_381172 ) ) ( not ( = ?auto_381170 ?auto_381173 ) ) ( not ( = ?auto_381170 ?auto_381174 ) ) ( not ( = ?auto_381170 ?auto_381175 ) ) ( not ( = ?auto_381170 ?auto_381176 ) ) ( not ( = ?auto_381170 ?auto_381177 ) ) ( not ( = ?auto_381170 ?auto_381178 ) ) ( not ( = ?auto_381171 ?auto_381172 ) ) ( not ( = ?auto_381171 ?auto_381173 ) ) ( not ( = ?auto_381171 ?auto_381174 ) ) ( not ( = ?auto_381171 ?auto_381175 ) ) ( not ( = ?auto_381171 ?auto_381176 ) ) ( not ( = ?auto_381171 ?auto_381177 ) ) ( not ( = ?auto_381171 ?auto_381178 ) ) ( not ( = ?auto_381172 ?auto_381173 ) ) ( not ( = ?auto_381172 ?auto_381174 ) ) ( not ( = ?auto_381172 ?auto_381175 ) ) ( not ( = ?auto_381172 ?auto_381176 ) ) ( not ( = ?auto_381172 ?auto_381177 ) ) ( not ( = ?auto_381172 ?auto_381178 ) ) ( not ( = ?auto_381173 ?auto_381174 ) ) ( not ( = ?auto_381173 ?auto_381175 ) ) ( not ( = ?auto_381173 ?auto_381176 ) ) ( not ( = ?auto_381173 ?auto_381177 ) ) ( not ( = ?auto_381173 ?auto_381178 ) ) ( not ( = ?auto_381174 ?auto_381175 ) ) ( not ( = ?auto_381174 ?auto_381176 ) ) ( not ( = ?auto_381174 ?auto_381177 ) ) ( not ( = ?auto_381174 ?auto_381178 ) ) ( not ( = ?auto_381175 ?auto_381176 ) ) ( not ( = ?auto_381175 ?auto_381177 ) ) ( not ( = ?auto_381175 ?auto_381178 ) ) ( not ( = ?auto_381176 ?auto_381177 ) ) ( not ( = ?auto_381176 ?auto_381178 ) ) ( not ( = ?auto_381177 ?auto_381178 ) ) ( ON ?auto_381176 ?auto_381177 ) ( ON ?auto_381175 ?auto_381176 ) ( ON ?auto_381174 ?auto_381175 ) ( ON ?auto_381173 ?auto_381174 ) ( ON ?auto_381172 ?auto_381173 ) ( ON ?auto_381171 ?auto_381172 ) ( ON ?auto_381170 ?auto_381171 ) ( ON ?auto_381169 ?auto_381170 ) ( ON ?auto_381168 ?auto_381169 ) ( CLEAR ?auto_381166 ) ( ON ?auto_381167 ?auto_381168 ) ( CLEAR ?auto_381167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_381163 ?auto_381164 ?auto_381165 ?auto_381166 ?auto_381167 )
      ( MAKE-15PILE ?auto_381163 ?auto_381164 ?auto_381165 ?auto_381166 ?auto_381167 ?auto_381168 ?auto_381169 ?auto_381170 ?auto_381171 ?auto_381172 ?auto_381173 ?auto_381174 ?auto_381175 ?auto_381176 ?auto_381177 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381194 - BLOCK
      ?auto_381195 - BLOCK
      ?auto_381196 - BLOCK
      ?auto_381197 - BLOCK
      ?auto_381198 - BLOCK
      ?auto_381199 - BLOCK
      ?auto_381200 - BLOCK
      ?auto_381201 - BLOCK
      ?auto_381202 - BLOCK
      ?auto_381203 - BLOCK
      ?auto_381204 - BLOCK
      ?auto_381205 - BLOCK
      ?auto_381206 - BLOCK
      ?auto_381207 - BLOCK
      ?auto_381208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_381208 ) ( ON-TABLE ?auto_381194 ) ( ON ?auto_381195 ?auto_381194 ) ( ON ?auto_381196 ?auto_381195 ) ( ON ?auto_381197 ?auto_381196 ) ( not ( = ?auto_381194 ?auto_381195 ) ) ( not ( = ?auto_381194 ?auto_381196 ) ) ( not ( = ?auto_381194 ?auto_381197 ) ) ( not ( = ?auto_381194 ?auto_381198 ) ) ( not ( = ?auto_381194 ?auto_381199 ) ) ( not ( = ?auto_381194 ?auto_381200 ) ) ( not ( = ?auto_381194 ?auto_381201 ) ) ( not ( = ?auto_381194 ?auto_381202 ) ) ( not ( = ?auto_381194 ?auto_381203 ) ) ( not ( = ?auto_381194 ?auto_381204 ) ) ( not ( = ?auto_381194 ?auto_381205 ) ) ( not ( = ?auto_381194 ?auto_381206 ) ) ( not ( = ?auto_381194 ?auto_381207 ) ) ( not ( = ?auto_381194 ?auto_381208 ) ) ( not ( = ?auto_381195 ?auto_381196 ) ) ( not ( = ?auto_381195 ?auto_381197 ) ) ( not ( = ?auto_381195 ?auto_381198 ) ) ( not ( = ?auto_381195 ?auto_381199 ) ) ( not ( = ?auto_381195 ?auto_381200 ) ) ( not ( = ?auto_381195 ?auto_381201 ) ) ( not ( = ?auto_381195 ?auto_381202 ) ) ( not ( = ?auto_381195 ?auto_381203 ) ) ( not ( = ?auto_381195 ?auto_381204 ) ) ( not ( = ?auto_381195 ?auto_381205 ) ) ( not ( = ?auto_381195 ?auto_381206 ) ) ( not ( = ?auto_381195 ?auto_381207 ) ) ( not ( = ?auto_381195 ?auto_381208 ) ) ( not ( = ?auto_381196 ?auto_381197 ) ) ( not ( = ?auto_381196 ?auto_381198 ) ) ( not ( = ?auto_381196 ?auto_381199 ) ) ( not ( = ?auto_381196 ?auto_381200 ) ) ( not ( = ?auto_381196 ?auto_381201 ) ) ( not ( = ?auto_381196 ?auto_381202 ) ) ( not ( = ?auto_381196 ?auto_381203 ) ) ( not ( = ?auto_381196 ?auto_381204 ) ) ( not ( = ?auto_381196 ?auto_381205 ) ) ( not ( = ?auto_381196 ?auto_381206 ) ) ( not ( = ?auto_381196 ?auto_381207 ) ) ( not ( = ?auto_381196 ?auto_381208 ) ) ( not ( = ?auto_381197 ?auto_381198 ) ) ( not ( = ?auto_381197 ?auto_381199 ) ) ( not ( = ?auto_381197 ?auto_381200 ) ) ( not ( = ?auto_381197 ?auto_381201 ) ) ( not ( = ?auto_381197 ?auto_381202 ) ) ( not ( = ?auto_381197 ?auto_381203 ) ) ( not ( = ?auto_381197 ?auto_381204 ) ) ( not ( = ?auto_381197 ?auto_381205 ) ) ( not ( = ?auto_381197 ?auto_381206 ) ) ( not ( = ?auto_381197 ?auto_381207 ) ) ( not ( = ?auto_381197 ?auto_381208 ) ) ( not ( = ?auto_381198 ?auto_381199 ) ) ( not ( = ?auto_381198 ?auto_381200 ) ) ( not ( = ?auto_381198 ?auto_381201 ) ) ( not ( = ?auto_381198 ?auto_381202 ) ) ( not ( = ?auto_381198 ?auto_381203 ) ) ( not ( = ?auto_381198 ?auto_381204 ) ) ( not ( = ?auto_381198 ?auto_381205 ) ) ( not ( = ?auto_381198 ?auto_381206 ) ) ( not ( = ?auto_381198 ?auto_381207 ) ) ( not ( = ?auto_381198 ?auto_381208 ) ) ( not ( = ?auto_381199 ?auto_381200 ) ) ( not ( = ?auto_381199 ?auto_381201 ) ) ( not ( = ?auto_381199 ?auto_381202 ) ) ( not ( = ?auto_381199 ?auto_381203 ) ) ( not ( = ?auto_381199 ?auto_381204 ) ) ( not ( = ?auto_381199 ?auto_381205 ) ) ( not ( = ?auto_381199 ?auto_381206 ) ) ( not ( = ?auto_381199 ?auto_381207 ) ) ( not ( = ?auto_381199 ?auto_381208 ) ) ( not ( = ?auto_381200 ?auto_381201 ) ) ( not ( = ?auto_381200 ?auto_381202 ) ) ( not ( = ?auto_381200 ?auto_381203 ) ) ( not ( = ?auto_381200 ?auto_381204 ) ) ( not ( = ?auto_381200 ?auto_381205 ) ) ( not ( = ?auto_381200 ?auto_381206 ) ) ( not ( = ?auto_381200 ?auto_381207 ) ) ( not ( = ?auto_381200 ?auto_381208 ) ) ( not ( = ?auto_381201 ?auto_381202 ) ) ( not ( = ?auto_381201 ?auto_381203 ) ) ( not ( = ?auto_381201 ?auto_381204 ) ) ( not ( = ?auto_381201 ?auto_381205 ) ) ( not ( = ?auto_381201 ?auto_381206 ) ) ( not ( = ?auto_381201 ?auto_381207 ) ) ( not ( = ?auto_381201 ?auto_381208 ) ) ( not ( = ?auto_381202 ?auto_381203 ) ) ( not ( = ?auto_381202 ?auto_381204 ) ) ( not ( = ?auto_381202 ?auto_381205 ) ) ( not ( = ?auto_381202 ?auto_381206 ) ) ( not ( = ?auto_381202 ?auto_381207 ) ) ( not ( = ?auto_381202 ?auto_381208 ) ) ( not ( = ?auto_381203 ?auto_381204 ) ) ( not ( = ?auto_381203 ?auto_381205 ) ) ( not ( = ?auto_381203 ?auto_381206 ) ) ( not ( = ?auto_381203 ?auto_381207 ) ) ( not ( = ?auto_381203 ?auto_381208 ) ) ( not ( = ?auto_381204 ?auto_381205 ) ) ( not ( = ?auto_381204 ?auto_381206 ) ) ( not ( = ?auto_381204 ?auto_381207 ) ) ( not ( = ?auto_381204 ?auto_381208 ) ) ( not ( = ?auto_381205 ?auto_381206 ) ) ( not ( = ?auto_381205 ?auto_381207 ) ) ( not ( = ?auto_381205 ?auto_381208 ) ) ( not ( = ?auto_381206 ?auto_381207 ) ) ( not ( = ?auto_381206 ?auto_381208 ) ) ( not ( = ?auto_381207 ?auto_381208 ) ) ( ON ?auto_381207 ?auto_381208 ) ( ON ?auto_381206 ?auto_381207 ) ( ON ?auto_381205 ?auto_381206 ) ( ON ?auto_381204 ?auto_381205 ) ( ON ?auto_381203 ?auto_381204 ) ( ON ?auto_381202 ?auto_381203 ) ( ON ?auto_381201 ?auto_381202 ) ( ON ?auto_381200 ?auto_381201 ) ( ON ?auto_381199 ?auto_381200 ) ( CLEAR ?auto_381197 ) ( ON ?auto_381198 ?auto_381199 ) ( CLEAR ?auto_381198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_381194 ?auto_381195 ?auto_381196 ?auto_381197 ?auto_381198 )
      ( MAKE-15PILE ?auto_381194 ?auto_381195 ?auto_381196 ?auto_381197 ?auto_381198 ?auto_381199 ?auto_381200 ?auto_381201 ?auto_381202 ?auto_381203 ?auto_381204 ?auto_381205 ?auto_381206 ?auto_381207 ?auto_381208 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381224 - BLOCK
      ?auto_381225 - BLOCK
      ?auto_381226 - BLOCK
      ?auto_381227 - BLOCK
      ?auto_381228 - BLOCK
      ?auto_381229 - BLOCK
      ?auto_381230 - BLOCK
      ?auto_381231 - BLOCK
      ?auto_381232 - BLOCK
      ?auto_381233 - BLOCK
      ?auto_381234 - BLOCK
      ?auto_381235 - BLOCK
      ?auto_381236 - BLOCK
      ?auto_381237 - BLOCK
      ?auto_381238 - BLOCK
    )
    :vars
    (
      ?auto_381239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381238 ?auto_381239 ) ( ON-TABLE ?auto_381224 ) ( ON ?auto_381225 ?auto_381224 ) ( ON ?auto_381226 ?auto_381225 ) ( not ( = ?auto_381224 ?auto_381225 ) ) ( not ( = ?auto_381224 ?auto_381226 ) ) ( not ( = ?auto_381224 ?auto_381227 ) ) ( not ( = ?auto_381224 ?auto_381228 ) ) ( not ( = ?auto_381224 ?auto_381229 ) ) ( not ( = ?auto_381224 ?auto_381230 ) ) ( not ( = ?auto_381224 ?auto_381231 ) ) ( not ( = ?auto_381224 ?auto_381232 ) ) ( not ( = ?auto_381224 ?auto_381233 ) ) ( not ( = ?auto_381224 ?auto_381234 ) ) ( not ( = ?auto_381224 ?auto_381235 ) ) ( not ( = ?auto_381224 ?auto_381236 ) ) ( not ( = ?auto_381224 ?auto_381237 ) ) ( not ( = ?auto_381224 ?auto_381238 ) ) ( not ( = ?auto_381224 ?auto_381239 ) ) ( not ( = ?auto_381225 ?auto_381226 ) ) ( not ( = ?auto_381225 ?auto_381227 ) ) ( not ( = ?auto_381225 ?auto_381228 ) ) ( not ( = ?auto_381225 ?auto_381229 ) ) ( not ( = ?auto_381225 ?auto_381230 ) ) ( not ( = ?auto_381225 ?auto_381231 ) ) ( not ( = ?auto_381225 ?auto_381232 ) ) ( not ( = ?auto_381225 ?auto_381233 ) ) ( not ( = ?auto_381225 ?auto_381234 ) ) ( not ( = ?auto_381225 ?auto_381235 ) ) ( not ( = ?auto_381225 ?auto_381236 ) ) ( not ( = ?auto_381225 ?auto_381237 ) ) ( not ( = ?auto_381225 ?auto_381238 ) ) ( not ( = ?auto_381225 ?auto_381239 ) ) ( not ( = ?auto_381226 ?auto_381227 ) ) ( not ( = ?auto_381226 ?auto_381228 ) ) ( not ( = ?auto_381226 ?auto_381229 ) ) ( not ( = ?auto_381226 ?auto_381230 ) ) ( not ( = ?auto_381226 ?auto_381231 ) ) ( not ( = ?auto_381226 ?auto_381232 ) ) ( not ( = ?auto_381226 ?auto_381233 ) ) ( not ( = ?auto_381226 ?auto_381234 ) ) ( not ( = ?auto_381226 ?auto_381235 ) ) ( not ( = ?auto_381226 ?auto_381236 ) ) ( not ( = ?auto_381226 ?auto_381237 ) ) ( not ( = ?auto_381226 ?auto_381238 ) ) ( not ( = ?auto_381226 ?auto_381239 ) ) ( not ( = ?auto_381227 ?auto_381228 ) ) ( not ( = ?auto_381227 ?auto_381229 ) ) ( not ( = ?auto_381227 ?auto_381230 ) ) ( not ( = ?auto_381227 ?auto_381231 ) ) ( not ( = ?auto_381227 ?auto_381232 ) ) ( not ( = ?auto_381227 ?auto_381233 ) ) ( not ( = ?auto_381227 ?auto_381234 ) ) ( not ( = ?auto_381227 ?auto_381235 ) ) ( not ( = ?auto_381227 ?auto_381236 ) ) ( not ( = ?auto_381227 ?auto_381237 ) ) ( not ( = ?auto_381227 ?auto_381238 ) ) ( not ( = ?auto_381227 ?auto_381239 ) ) ( not ( = ?auto_381228 ?auto_381229 ) ) ( not ( = ?auto_381228 ?auto_381230 ) ) ( not ( = ?auto_381228 ?auto_381231 ) ) ( not ( = ?auto_381228 ?auto_381232 ) ) ( not ( = ?auto_381228 ?auto_381233 ) ) ( not ( = ?auto_381228 ?auto_381234 ) ) ( not ( = ?auto_381228 ?auto_381235 ) ) ( not ( = ?auto_381228 ?auto_381236 ) ) ( not ( = ?auto_381228 ?auto_381237 ) ) ( not ( = ?auto_381228 ?auto_381238 ) ) ( not ( = ?auto_381228 ?auto_381239 ) ) ( not ( = ?auto_381229 ?auto_381230 ) ) ( not ( = ?auto_381229 ?auto_381231 ) ) ( not ( = ?auto_381229 ?auto_381232 ) ) ( not ( = ?auto_381229 ?auto_381233 ) ) ( not ( = ?auto_381229 ?auto_381234 ) ) ( not ( = ?auto_381229 ?auto_381235 ) ) ( not ( = ?auto_381229 ?auto_381236 ) ) ( not ( = ?auto_381229 ?auto_381237 ) ) ( not ( = ?auto_381229 ?auto_381238 ) ) ( not ( = ?auto_381229 ?auto_381239 ) ) ( not ( = ?auto_381230 ?auto_381231 ) ) ( not ( = ?auto_381230 ?auto_381232 ) ) ( not ( = ?auto_381230 ?auto_381233 ) ) ( not ( = ?auto_381230 ?auto_381234 ) ) ( not ( = ?auto_381230 ?auto_381235 ) ) ( not ( = ?auto_381230 ?auto_381236 ) ) ( not ( = ?auto_381230 ?auto_381237 ) ) ( not ( = ?auto_381230 ?auto_381238 ) ) ( not ( = ?auto_381230 ?auto_381239 ) ) ( not ( = ?auto_381231 ?auto_381232 ) ) ( not ( = ?auto_381231 ?auto_381233 ) ) ( not ( = ?auto_381231 ?auto_381234 ) ) ( not ( = ?auto_381231 ?auto_381235 ) ) ( not ( = ?auto_381231 ?auto_381236 ) ) ( not ( = ?auto_381231 ?auto_381237 ) ) ( not ( = ?auto_381231 ?auto_381238 ) ) ( not ( = ?auto_381231 ?auto_381239 ) ) ( not ( = ?auto_381232 ?auto_381233 ) ) ( not ( = ?auto_381232 ?auto_381234 ) ) ( not ( = ?auto_381232 ?auto_381235 ) ) ( not ( = ?auto_381232 ?auto_381236 ) ) ( not ( = ?auto_381232 ?auto_381237 ) ) ( not ( = ?auto_381232 ?auto_381238 ) ) ( not ( = ?auto_381232 ?auto_381239 ) ) ( not ( = ?auto_381233 ?auto_381234 ) ) ( not ( = ?auto_381233 ?auto_381235 ) ) ( not ( = ?auto_381233 ?auto_381236 ) ) ( not ( = ?auto_381233 ?auto_381237 ) ) ( not ( = ?auto_381233 ?auto_381238 ) ) ( not ( = ?auto_381233 ?auto_381239 ) ) ( not ( = ?auto_381234 ?auto_381235 ) ) ( not ( = ?auto_381234 ?auto_381236 ) ) ( not ( = ?auto_381234 ?auto_381237 ) ) ( not ( = ?auto_381234 ?auto_381238 ) ) ( not ( = ?auto_381234 ?auto_381239 ) ) ( not ( = ?auto_381235 ?auto_381236 ) ) ( not ( = ?auto_381235 ?auto_381237 ) ) ( not ( = ?auto_381235 ?auto_381238 ) ) ( not ( = ?auto_381235 ?auto_381239 ) ) ( not ( = ?auto_381236 ?auto_381237 ) ) ( not ( = ?auto_381236 ?auto_381238 ) ) ( not ( = ?auto_381236 ?auto_381239 ) ) ( not ( = ?auto_381237 ?auto_381238 ) ) ( not ( = ?auto_381237 ?auto_381239 ) ) ( not ( = ?auto_381238 ?auto_381239 ) ) ( ON ?auto_381237 ?auto_381238 ) ( ON ?auto_381236 ?auto_381237 ) ( ON ?auto_381235 ?auto_381236 ) ( ON ?auto_381234 ?auto_381235 ) ( ON ?auto_381233 ?auto_381234 ) ( ON ?auto_381232 ?auto_381233 ) ( ON ?auto_381231 ?auto_381232 ) ( ON ?auto_381230 ?auto_381231 ) ( ON ?auto_381229 ?auto_381230 ) ( ON ?auto_381228 ?auto_381229 ) ( CLEAR ?auto_381226 ) ( ON ?auto_381227 ?auto_381228 ) ( CLEAR ?auto_381227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_381224 ?auto_381225 ?auto_381226 ?auto_381227 )
      ( MAKE-15PILE ?auto_381224 ?auto_381225 ?auto_381226 ?auto_381227 ?auto_381228 ?auto_381229 ?auto_381230 ?auto_381231 ?auto_381232 ?auto_381233 ?auto_381234 ?auto_381235 ?auto_381236 ?auto_381237 ?auto_381238 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381255 - BLOCK
      ?auto_381256 - BLOCK
      ?auto_381257 - BLOCK
      ?auto_381258 - BLOCK
      ?auto_381259 - BLOCK
      ?auto_381260 - BLOCK
      ?auto_381261 - BLOCK
      ?auto_381262 - BLOCK
      ?auto_381263 - BLOCK
      ?auto_381264 - BLOCK
      ?auto_381265 - BLOCK
      ?auto_381266 - BLOCK
      ?auto_381267 - BLOCK
      ?auto_381268 - BLOCK
      ?auto_381269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_381269 ) ( ON-TABLE ?auto_381255 ) ( ON ?auto_381256 ?auto_381255 ) ( ON ?auto_381257 ?auto_381256 ) ( not ( = ?auto_381255 ?auto_381256 ) ) ( not ( = ?auto_381255 ?auto_381257 ) ) ( not ( = ?auto_381255 ?auto_381258 ) ) ( not ( = ?auto_381255 ?auto_381259 ) ) ( not ( = ?auto_381255 ?auto_381260 ) ) ( not ( = ?auto_381255 ?auto_381261 ) ) ( not ( = ?auto_381255 ?auto_381262 ) ) ( not ( = ?auto_381255 ?auto_381263 ) ) ( not ( = ?auto_381255 ?auto_381264 ) ) ( not ( = ?auto_381255 ?auto_381265 ) ) ( not ( = ?auto_381255 ?auto_381266 ) ) ( not ( = ?auto_381255 ?auto_381267 ) ) ( not ( = ?auto_381255 ?auto_381268 ) ) ( not ( = ?auto_381255 ?auto_381269 ) ) ( not ( = ?auto_381256 ?auto_381257 ) ) ( not ( = ?auto_381256 ?auto_381258 ) ) ( not ( = ?auto_381256 ?auto_381259 ) ) ( not ( = ?auto_381256 ?auto_381260 ) ) ( not ( = ?auto_381256 ?auto_381261 ) ) ( not ( = ?auto_381256 ?auto_381262 ) ) ( not ( = ?auto_381256 ?auto_381263 ) ) ( not ( = ?auto_381256 ?auto_381264 ) ) ( not ( = ?auto_381256 ?auto_381265 ) ) ( not ( = ?auto_381256 ?auto_381266 ) ) ( not ( = ?auto_381256 ?auto_381267 ) ) ( not ( = ?auto_381256 ?auto_381268 ) ) ( not ( = ?auto_381256 ?auto_381269 ) ) ( not ( = ?auto_381257 ?auto_381258 ) ) ( not ( = ?auto_381257 ?auto_381259 ) ) ( not ( = ?auto_381257 ?auto_381260 ) ) ( not ( = ?auto_381257 ?auto_381261 ) ) ( not ( = ?auto_381257 ?auto_381262 ) ) ( not ( = ?auto_381257 ?auto_381263 ) ) ( not ( = ?auto_381257 ?auto_381264 ) ) ( not ( = ?auto_381257 ?auto_381265 ) ) ( not ( = ?auto_381257 ?auto_381266 ) ) ( not ( = ?auto_381257 ?auto_381267 ) ) ( not ( = ?auto_381257 ?auto_381268 ) ) ( not ( = ?auto_381257 ?auto_381269 ) ) ( not ( = ?auto_381258 ?auto_381259 ) ) ( not ( = ?auto_381258 ?auto_381260 ) ) ( not ( = ?auto_381258 ?auto_381261 ) ) ( not ( = ?auto_381258 ?auto_381262 ) ) ( not ( = ?auto_381258 ?auto_381263 ) ) ( not ( = ?auto_381258 ?auto_381264 ) ) ( not ( = ?auto_381258 ?auto_381265 ) ) ( not ( = ?auto_381258 ?auto_381266 ) ) ( not ( = ?auto_381258 ?auto_381267 ) ) ( not ( = ?auto_381258 ?auto_381268 ) ) ( not ( = ?auto_381258 ?auto_381269 ) ) ( not ( = ?auto_381259 ?auto_381260 ) ) ( not ( = ?auto_381259 ?auto_381261 ) ) ( not ( = ?auto_381259 ?auto_381262 ) ) ( not ( = ?auto_381259 ?auto_381263 ) ) ( not ( = ?auto_381259 ?auto_381264 ) ) ( not ( = ?auto_381259 ?auto_381265 ) ) ( not ( = ?auto_381259 ?auto_381266 ) ) ( not ( = ?auto_381259 ?auto_381267 ) ) ( not ( = ?auto_381259 ?auto_381268 ) ) ( not ( = ?auto_381259 ?auto_381269 ) ) ( not ( = ?auto_381260 ?auto_381261 ) ) ( not ( = ?auto_381260 ?auto_381262 ) ) ( not ( = ?auto_381260 ?auto_381263 ) ) ( not ( = ?auto_381260 ?auto_381264 ) ) ( not ( = ?auto_381260 ?auto_381265 ) ) ( not ( = ?auto_381260 ?auto_381266 ) ) ( not ( = ?auto_381260 ?auto_381267 ) ) ( not ( = ?auto_381260 ?auto_381268 ) ) ( not ( = ?auto_381260 ?auto_381269 ) ) ( not ( = ?auto_381261 ?auto_381262 ) ) ( not ( = ?auto_381261 ?auto_381263 ) ) ( not ( = ?auto_381261 ?auto_381264 ) ) ( not ( = ?auto_381261 ?auto_381265 ) ) ( not ( = ?auto_381261 ?auto_381266 ) ) ( not ( = ?auto_381261 ?auto_381267 ) ) ( not ( = ?auto_381261 ?auto_381268 ) ) ( not ( = ?auto_381261 ?auto_381269 ) ) ( not ( = ?auto_381262 ?auto_381263 ) ) ( not ( = ?auto_381262 ?auto_381264 ) ) ( not ( = ?auto_381262 ?auto_381265 ) ) ( not ( = ?auto_381262 ?auto_381266 ) ) ( not ( = ?auto_381262 ?auto_381267 ) ) ( not ( = ?auto_381262 ?auto_381268 ) ) ( not ( = ?auto_381262 ?auto_381269 ) ) ( not ( = ?auto_381263 ?auto_381264 ) ) ( not ( = ?auto_381263 ?auto_381265 ) ) ( not ( = ?auto_381263 ?auto_381266 ) ) ( not ( = ?auto_381263 ?auto_381267 ) ) ( not ( = ?auto_381263 ?auto_381268 ) ) ( not ( = ?auto_381263 ?auto_381269 ) ) ( not ( = ?auto_381264 ?auto_381265 ) ) ( not ( = ?auto_381264 ?auto_381266 ) ) ( not ( = ?auto_381264 ?auto_381267 ) ) ( not ( = ?auto_381264 ?auto_381268 ) ) ( not ( = ?auto_381264 ?auto_381269 ) ) ( not ( = ?auto_381265 ?auto_381266 ) ) ( not ( = ?auto_381265 ?auto_381267 ) ) ( not ( = ?auto_381265 ?auto_381268 ) ) ( not ( = ?auto_381265 ?auto_381269 ) ) ( not ( = ?auto_381266 ?auto_381267 ) ) ( not ( = ?auto_381266 ?auto_381268 ) ) ( not ( = ?auto_381266 ?auto_381269 ) ) ( not ( = ?auto_381267 ?auto_381268 ) ) ( not ( = ?auto_381267 ?auto_381269 ) ) ( not ( = ?auto_381268 ?auto_381269 ) ) ( ON ?auto_381268 ?auto_381269 ) ( ON ?auto_381267 ?auto_381268 ) ( ON ?auto_381266 ?auto_381267 ) ( ON ?auto_381265 ?auto_381266 ) ( ON ?auto_381264 ?auto_381265 ) ( ON ?auto_381263 ?auto_381264 ) ( ON ?auto_381262 ?auto_381263 ) ( ON ?auto_381261 ?auto_381262 ) ( ON ?auto_381260 ?auto_381261 ) ( ON ?auto_381259 ?auto_381260 ) ( CLEAR ?auto_381257 ) ( ON ?auto_381258 ?auto_381259 ) ( CLEAR ?auto_381258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_381255 ?auto_381256 ?auto_381257 ?auto_381258 )
      ( MAKE-15PILE ?auto_381255 ?auto_381256 ?auto_381257 ?auto_381258 ?auto_381259 ?auto_381260 ?auto_381261 ?auto_381262 ?auto_381263 ?auto_381264 ?auto_381265 ?auto_381266 ?auto_381267 ?auto_381268 ?auto_381269 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381285 - BLOCK
      ?auto_381286 - BLOCK
      ?auto_381287 - BLOCK
      ?auto_381288 - BLOCK
      ?auto_381289 - BLOCK
      ?auto_381290 - BLOCK
      ?auto_381291 - BLOCK
      ?auto_381292 - BLOCK
      ?auto_381293 - BLOCK
      ?auto_381294 - BLOCK
      ?auto_381295 - BLOCK
      ?auto_381296 - BLOCK
      ?auto_381297 - BLOCK
      ?auto_381298 - BLOCK
      ?auto_381299 - BLOCK
    )
    :vars
    (
      ?auto_381300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381299 ?auto_381300 ) ( ON-TABLE ?auto_381285 ) ( ON ?auto_381286 ?auto_381285 ) ( not ( = ?auto_381285 ?auto_381286 ) ) ( not ( = ?auto_381285 ?auto_381287 ) ) ( not ( = ?auto_381285 ?auto_381288 ) ) ( not ( = ?auto_381285 ?auto_381289 ) ) ( not ( = ?auto_381285 ?auto_381290 ) ) ( not ( = ?auto_381285 ?auto_381291 ) ) ( not ( = ?auto_381285 ?auto_381292 ) ) ( not ( = ?auto_381285 ?auto_381293 ) ) ( not ( = ?auto_381285 ?auto_381294 ) ) ( not ( = ?auto_381285 ?auto_381295 ) ) ( not ( = ?auto_381285 ?auto_381296 ) ) ( not ( = ?auto_381285 ?auto_381297 ) ) ( not ( = ?auto_381285 ?auto_381298 ) ) ( not ( = ?auto_381285 ?auto_381299 ) ) ( not ( = ?auto_381285 ?auto_381300 ) ) ( not ( = ?auto_381286 ?auto_381287 ) ) ( not ( = ?auto_381286 ?auto_381288 ) ) ( not ( = ?auto_381286 ?auto_381289 ) ) ( not ( = ?auto_381286 ?auto_381290 ) ) ( not ( = ?auto_381286 ?auto_381291 ) ) ( not ( = ?auto_381286 ?auto_381292 ) ) ( not ( = ?auto_381286 ?auto_381293 ) ) ( not ( = ?auto_381286 ?auto_381294 ) ) ( not ( = ?auto_381286 ?auto_381295 ) ) ( not ( = ?auto_381286 ?auto_381296 ) ) ( not ( = ?auto_381286 ?auto_381297 ) ) ( not ( = ?auto_381286 ?auto_381298 ) ) ( not ( = ?auto_381286 ?auto_381299 ) ) ( not ( = ?auto_381286 ?auto_381300 ) ) ( not ( = ?auto_381287 ?auto_381288 ) ) ( not ( = ?auto_381287 ?auto_381289 ) ) ( not ( = ?auto_381287 ?auto_381290 ) ) ( not ( = ?auto_381287 ?auto_381291 ) ) ( not ( = ?auto_381287 ?auto_381292 ) ) ( not ( = ?auto_381287 ?auto_381293 ) ) ( not ( = ?auto_381287 ?auto_381294 ) ) ( not ( = ?auto_381287 ?auto_381295 ) ) ( not ( = ?auto_381287 ?auto_381296 ) ) ( not ( = ?auto_381287 ?auto_381297 ) ) ( not ( = ?auto_381287 ?auto_381298 ) ) ( not ( = ?auto_381287 ?auto_381299 ) ) ( not ( = ?auto_381287 ?auto_381300 ) ) ( not ( = ?auto_381288 ?auto_381289 ) ) ( not ( = ?auto_381288 ?auto_381290 ) ) ( not ( = ?auto_381288 ?auto_381291 ) ) ( not ( = ?auto_381288 ?auto_381292 ) ) ( not ( = ?auto_381288 ?auto_381293 ) ) ( not ( = ?auto_381288 ?auto_381294 ) ) ( not ( = ?auto_381288 ?auto_381295 ) ) ( not ( = ?auto_381288 ?auto_381296 ) ) ( not ( = ?auto_381288 ?auto_381297 ) ) ( not ( = ?auto_381288 ?auto_381298 ) ) ( not ( = ?auto_381288 ?auto_381299 ) ) ( not ( = ?auto_381288 ?auto_381300 ) ) ( not ( = ?auto_381289 ?auto_381290 ) ) ( not ( = ?auto_381289 ?auto_381291 ) ) ( not ( = ?auto_381289 ?auto_381292 ) ) ( not ( = ?auto_381289 ?auto_381293 ) ) ( not ( = ?auto_381289 ?auto_381294 ) ) ( not ( = ?auto_381289 ?auto_381295 ) ) ( not ( = ?auto_381289 ?auto_381296 ) ) ( not ( = ?auto_381289 ?auto_381297 ) ) ( not ( = ?auto_381289 ?auto_381298 ) ) ( not ( = ?auto_381289 ?auto_381299 ) ) ( not ( = ?auto_381289 ?auto_381300 ) ) ( not ( = ?auto_381290 ?auto_381291 ) ) ( not ( = ?auto_381290 ?auto_381292 ) ) ( not ( = ?auto_381290 ?auto_381293 ) ) ( not ( = ?auto_381290 ?auto_381294 ) ) ( not ( = ?auto_381290 ?auto_381295 ) ) ( not ( = ?auto_381290 ?auto_381296 ) ) ( not ( = ?auto_381290 ?auto_381297 ) ) ( not ( = ?auto_381290 ?auto_381298 ) ) ( not ( = ?auto_381290 ?auto_381299 ) ) ( not ( = ?auto_381290 ?auto_381300 ) ) ( not ( = ?auto_381291 ?auto_381292 ) ) ( not ( = ?auto_381291 ?auto_381293 ) ) ( not ( = ?auto_381291 ?auto_381294 ) ) ( not ( = ?auto_381291 ?auto_381295 ) ) ( not ( = ?auto_381291 ?auto_381296 ) ) ( not ( = ?auto_381291 ?auto_381297 ) ) ( not ( = ?auto_381291 ?auto_381298 ) ) ( not ( = ?auto_381291 ?auto_381299 ) ) ( not ( = ?auto_381291 ?auto_381300 ) ) ( not ( = ?auto_381292 ?auto_381293 ) ) ( not ( = ?auto_381292 ?auto_381294 ) ) ( not ( = ?auto_381292 ?auto_381295 ) ) ( not ( = ?auto_381292 ?auto_381296 ) ) ( not ( = ?auto_381292 ?auto_381297 ) ) ( not ( = ?auto_381292 ?auto_381298 ) ) ( not ( = ?auto_381292 ?auto_381299 ) ) ( not ( = ?auto_381292 ?auto_381300 ) ) ( not ( = ?auto_381293 ?auto_381294 ) ) ( not ( = ?auto_381293 ?auto_381295 ) ) ( not ( = ?auto_381293 ?auto_381296 ) ) ( not ( = ?auto_381293 ?auto_381297 ) ) ( not ( = ?auto_381293 ?auto_381298 ) ) ( not ( = ?auto_381293 ?auto_381299 ) ) ( not ( = ?auto_381293 ?auto_381300 ) ) ( not ( = ?auto_381294 ?auto_381295 ) ) ( not ( = ?auto_381294 ?auto_381296 ) ) ( not ( = ?auto_381294 ?auto_381297 ) ) ( not ( = ?auto_381294 ?auto_381298 ) ) ( not ( = ?auto_381294 ?auto_381299 ) ) ( not ( = ?auto_381294 ?auto_381300 ) ) ( not ( = ?auto_381295 ?auto_381296 ) ) ( not ( = ?auto_381295 ?auto_381297 ) ) ( not ( = ?auto_381295 ?auto_381298 ) ) ( not ( = ?auto_381295 ?auto_381299 ) ) ( not ( = ?auto_381295 ?auto_381300 ) ) ( not ( = ?auto_381296 ?auto_381297 ) ) ( not ( = ?auto_381296 ?auto_381298 ) ) ( not ( = ?auto_381296 ?auto_381299 ) ) ( not ( = ?auto_381296 ?auto_381300 ) ) ( not ( = ?auto_381297 ?auto_381298 ) ) ( not ( = ?auto_381297 ?auto_381299 ) ) ( not ( = ?auto_381297 ?auto_381300 ) ) ( not ( = ?auto_381298 ?auto_381299 ) ) ( not ( = ?auto_381298 ?auto_381300 ) ) ( not ( = ?auto_381299 ?auto_381300 ) ) ( ON ?auto_381298 ?auto_381299 ) ( ON ?auto_381297 ?auto_381298 ) ( ON ?auto_381296 ?auto_381297 ) ( ON ?auto_381295 ?auto_381296 ) ( ON ?auto_381294 ?auto_381295 ) ( ON ?auto_381293 ?auto_381294 ) ( ON ?auto_381292 ?auto_381293 ) ( ON ?auto_381291 ?auto_381292 ) ( ON ?auto_381290 ?auto_381291 ) ( ON ?auto_381289 ?auto_381290 ) ( ON ?auto_381288 ?auto_381289 ) ( CLEAR ?auto_381286 ) ( ON ?auto_381287 ?auto_381288 ) ( CLEAR ?auto_381287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_381285 ?auto_381286 ?auto_381287 )
      ( MAKE-15PILE ?auto_381285 ?auto_381286 ?auto_381287 ?auto_381288 ?auto_381289 ?auto_381290 ?auto_381291 ?auto_381292 ?auto_381293 ?auto_381294 ?auto_381295 ?auto_381296 ?auto_381297 ?auto_381298 ?auto_381299 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381316 - BLOCK
      ?auto_381317 - BLOCK
      ?auto_381318 - BLOCK
      ?auto_381319 - BLOCK
      ?auto_381320 - BLOCK
      ?auto_381321 - BLOCK
      ?auto_381322 - BLOCK
      ?auto_381323 - BLOCK
      ?auto_381324 - BLOCK
      ?auto_381325 - BLOCK
      ?auto_381326 - BLOCK
      ?auto_381327 - BLOCK
      ?auto_381328 - BLOCK
      ?auto_381329 - BLOCK
      ?auto_381330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_381330 ) ( ON-TABLE ?auto_381316 ) ( ON ?auto_381317 ?auto_381316 ) ( not ( = ?auto_381316 ?auto_381317 ) ) ( not ( = ?auto_381316 ?auto_381318 ) ) ( not ( = ?auto_381316 ?auto_381319 ) ) ( not ( = ?auto_381316 ?auto_381320 ) ) ( not ( = ?auto_381316 ?auto_381321 ) ) ( not ( = ?auto_381316 ?auto_381322 ) ) ( not ( = ?auto_381316 ?auto_381323 ) ) ( not ( = ?auto_381316 ?auto_381324 ) ) ( not ( = ?auto_381316 ?auto_381325 ) ) ( not ( = ?auto_381316 ?auto_381326 ) ) ( not ( = ?auto_381316 ?auto_381327 ) ) ( not ( = ?auto_381316 ?auto_381328 ) ) ( not ( = ?auto_381316 ?auto_381329 ) ) ( not ( = ?auto_381316 ?auto_381330 ) ) ( not ( = ?auto_381317 ?auto_381318 ) ) ( not ( = ?auto_381317 ?auto_381319 ) ) ( not ( = ?auto_381317 ?auto_381320 ) ) ( not ( = ?auto_381317 ?auto_381321 ) ) ( not ( = ?auto_381317 ?auto_381322 ) ) ( not ( = ?auto_381317 ?auto_381323 ) ) ( not ( = ?auto_381317 ?auto_381324 ) ) ( not ( = ?auto_381317 ?auto_381325 ) ) ( not ( = ?auto_381317 ?auto_381326 ) ) ( not ( = ?auto_381317 ?auto_381327 ) ) ( not ( = ?auto_381317 ?auto_381328 ) ) ( not ( = ?auto_381317 ?auto_381329 ) ) ( not ( = ?auto_381317 ?auto_381330 ) ) ( not ( = ?auto_381318 ?auto_381319 ) ) ( not ( = ?auto_381318 ?auto_381320 ) ) ( not ( = ?auto_381318 ?auto_381321 ) ) ( not ( = ?auto_381318 ?auto_381322 ) ) ( not ( = ?auto_381318 ?auto_381323 ) ) ( not ( = ?auto_381318 ?auto_381324 ) ) ( not ( = ?auto_381318 ?auto_381325 ) ) ( not ( = ?auto_381318 ?auto_381326 ) ) ( not ( = ?auto_381318 ?auto_381327 ) ) ( not ( = ?auto_381318 ?auto_381328 ) ) ( not ( = ?auto_381318 ?auto_381329 ) ) ( not ( = ?auto_381318 ?auto_381330 ) ) ( not ( = ?auto_381319 ?auto_381320 ) ) ( not ( = ?auto_381319 ?auto_381321 ) ) ( not ( = ?auto_381319 ?auto_381322 ) ) ( not ( = ?auto_381319 ?auto_381323 ) ) ( not ( = ?auto_381319 ?auto_381324 ) ) ( not ( = ?auto_381319 ?auto_381325 ) ) ( not ( = ?auto_381319 ?auto_381326 ) ) ( not ( = ?auto_381319 ?auto_381327 ) ) ( not ( = ?auto_381319 ?auto_381328 ) ) ( not ( = ?auto_381319 ?auto_381329 ) ) ( not ( = ?auto_381319 ?auto_381330 ) ) ( not ( = ?auto_381320 ?auto_381321 ) ) ( not ( = ?auto_381320 ?auto_381322 ) ) ( not ( = ?auto_381320 ?auto_381323 ) ) ( not ( = ?auto_381320 ?auto_381324 ) ) ( not ( = ?auto_381320 ?auto_381325 ) ) ( not ( = ?auto_381320 ?auto_381326 ) ) ( not ( = ?auto_381320 ?auto_381327 ) ) ( not ( = ?auto_381320 ?auto_381328 ) ) ( not ( = ?auto_381320 ?auto_381329 ) ) ( not ( = ?auto_381320 ?auto_381330 ) ) ( not ( = ?auto_381321 ?auto_381322 ) ) ( not ( = ?auto_381321 ?auto_381323 ) ) ( not ( = ?auto_381321 ?auto_381324 ) ) ( not ( = ?auto_381321 ?auto_381325 ) ) ( not ( = ?auto_381321 ?auto_381326 ) ) ( not ( = ?auto_381321 ?auto_381327 ) ) ( not ( = ?auto_381321 ?auto_381328 ) ) ( not ( = ?auto_381321 ?auto_381329 ) ) ( not ( = ?auto_381321 ?auto_381330 ) ) ( not ( = ?auto_381322 ?auto_381323 ) ) ( not ( = ?auto_381322 ?auto_381324 ) ) ( not ( = ?auto_381322 ?auto_381325 ) ) ( not ( = ?auto_381322 ?auto_381326 ) ) ( not ( = ?auto_381322 ?auto_381327 ) ) ( not ( = ?auto_381322 ?auto_381328 ) ) ( not ( = ?auto_381322 ?auto_381329 ) ) ( not ( = ?auto_381322 ?auto_381330 ) ) ( not ( = ?auto_381323 ?auto_381324 ) ) ( not ( = ?auto_381323 ?auto_381325 ) ) ( not ( = ?auto_381323 ?auto_381326 ) ) ( not ( = ?auto_381323 ?auto_381327 ) ) ( not ( = ?auto_381323 ?auto_381328 ) ) ( not ( = ?auto_381323 ?auto_381329 ) ) ( not ( = ?auto_381323 ?auto_381330 ) ) ( not ( = ?auto_381324 ?auto_381325 ) ) ( not ( = ?auto_381324 ?auto_381326 ) ) ( not ( = ?auto_381324 ?auto_381327 ) ) ( not ( = ?auto_381324 ?auto_381328 ) ) ( not ( = ?auto_381324 ?auto_381329 ) ) ( not ( = ?auto_381324 ?auto_381330 ) ) ( not ( = ?auto_381325 ?auto_381326 ) ) ( not ( = ?auto_381325 ?auto_381327 ) ) ( not ( = ?auto_381325 ?auto_381328 ) ) ( not ( = ?auto_381325 ?auto_381329 ) ) ( not ( = ?auto_381325 ?auto_381330 ) ) ( not ( = ?auto_381326 ?auto_381327 ) ) ( not ( = ?auto_381326 ?auto_381328 ) ) ( not ( = ?auto_381326 ?auto_381329 ) ) ( not ( = ?auto_381326 ?auto_381330 ) ) ( not ( = ?auto_381327 ?auto_381328 ) ) ( not ( = ?auto_381327 ?auto_381329 ) ) ( not ( = ?auto_381327 ?auto_381330 ) ) ( not ( = ?auto_381328 ?auto_381329 ) ) ( not ( = ?auto_381328 ?auto_381330 ) ) ( not ( = ?auto_381329 ?auto_381330 ) ) ( ON ?auto_381329 ?auto_381330 ) ( ON ?auto_381328 ?auto_381329 ) ( ON ?auto_381327 ?auto_381328 ) ( ON ?auto_381326 ?auto_381327 ) ( ON ?auto_381325 ?auto_381326 ) ( ON ?auto_381324 ?auto_381325 ) ( ON ?auto_381323 ?auto_381324 ) ( ON ?auto_381322 ?auto_381323 ) ( ON ?auto_381321 ?auto_381322 ) ( ON ?auto_381320 ?auto_381321 ) ( ON ?auto_381319 ?auto_381320 ) ( CLEAR ?auto_381317 ) ( ON ?auto_381318 ?auto_381319 ) ( CLEAR ?auto_381318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_381316 ?auto_381317 ?auto_381318 )
      ( MAKE-15PILE ?auto_381316 ?auto_381317 ?auto_381318 ?auto_381319 ?auto_381320 ?auto_381321 ?auto_381322 ?auto_381323 ?auto_381324 ?auto_381325 ?auto_381326 ?auto_381327 ?auto_381328 ?auto_381329 ?auto_381330 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381346 - BLOCK
      ?auto_381347 - BLOCK
      ?auto_381348 - BLOCK
      ?auto_381349 - BLOCK
      ?auto_381350 - BLOCK
      ?auto_381351 - BLOCK
      ?auto_381352 - BLOCK
      ?auto_381353 - BLOCK
      ?auto_381354 - BLOCK
      ?auto_381355 - BLOCK
      ?auto_381356 - BLOCK
      ?auto_381357 - BLOCK
      ?auto_381358 - BLOCK
      ?auto_381359 - BLOCK
      ?auto_381360 - BLOCK
    )
    :vars
    (
      ?auto_381361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381360 ?auto_381361 ) ( ON-TABLE ?auto_381346 ) ( not ( = ?auto_381346 ?auto_381347 ) ) ( not ( = ?auto_381346 ?auto_381348 ) ) ( not ( = ?auto_381346 ?auto_381349 ) ) ( not ( = ?auto_381346 ?auto_381350 ) ) ( not ( = ?auto_381346 ?auto_381351 ) ) ( not ( = ?auto_381346 ?auto_381352 ) ) ( not ( = ?auto_381346 ?auto_381353 ) ) ( not ( = ?auto_381346 ?auto_381354 ) ) ( not ( = ?auto_381346 ?auto_381355 ) ) ( not ( = ?auto_381346 ?auto_381356 ) ) ( not ( = ?auto_381346 ?auto_381357 ) ) ( not ( = ?auto_381346 ?auto_381358 ) ) ( not ( = ?auto_381346 ?auto_381359 ) ) ( not ( = ?auto_381346 ?auto_381360 ) ) ( not ( = ?auto_381346 ?auto_381361 ) ) ( not ( = ?auto_381347 ?auto_381348 ) ) ( not ( = ?auto_381347 ?auto_381349 ) ) ( not ( = ?auto_381347 ?auto_381350 ) ) ( not ( = ?auto_381347 ?auto_381351 ) ) ( not ( = ?auto_381347 ?auto_381352 ) ) ( not ( = ?auto_381347 ?auto_381353 ) ) ( not ( = ?auto_381347 ?auto_381354 ) ) ( not ( = ?auto_381347 ?auto_381355 ) ) ( not ( = ?auto_381347 ?auto_381356 ) ) ( not ( = ?auto_381347 ?auto_381357 ) ) ( not ( = ?auto_381347 ?auto_381358 ) ) ( not ( = ?auto_381347 ?auto_381359 ) ) ( not ( = ?auto_381347 ?auto_381360 ) ) ( not ( = ?auto_381347 ?auto_381361 ) ) ( not ( = ?auto_381348 ?auto_381349 ) ) ( not ( = ?auto_381348 ?auto_381350 ) ) ( not ( = ?auto_381348 ?auto_381351 ) ) ( not ( = ?auto_381348 ?auto_381352 ) ) ( not ( = ?auto_381348 ?auto_381353 ) ) ( not ( = ?auto_381348 ?auto_381354 ) ) ( not ( = ?auto_381348 ?auto_381355 ) ) ( not ( = ?auto_381348 ?auto_381356 ) ) ( not ( = ?auto_381348 ?auto_381357 ) ) ( not ( = ?auto_381348 ?auto_381358 ) ) ( not ( = ?auto_381348 ?auto_381359 ) ) ( not ( = ?auto_381348 ?auto_381360 ) ) ( not ( = ?auto_381348 ?auto_381361 ) ) ( not ( = ?auto_381349 ?auto_381350 ) ) ( not ( = ?auto_381349 ?auto_381351 ) ) ( not ( = ?auto_381349 ?auto_381352 ) ) ( not ( = ?auto_381349 ?auto_381353 ) ) ( not ( = ?auto_381349 ?auto_381354 ) ) ( not ( = ?auto_381349 ?auto_381355 ) ) ( not ( = ?auto_381349 ?auto_381356 ) ) ( not ( = ?auto_381349 ?auto_381357 ) ) ( not ( = ?auto_381349 ?auto_381358 ) ) ( not ( = ?auto_381349 ?auto_381359 ) ) ( not ( = ?auto_381349 ?auto_381360 ) ) ( not ( = ?auto_381349 ?auto_381361 ) ) ( not ( = ?auto_381350 ?auto_381351 ) ) ( not ( = ?auto_381350 ?auto_381352 ) ) ( not ( = ?auto_381350 ?auto_381353 ) ) ( not ( = ?auto_381350 ?auto_381354 ) ) ( not ( = ?auto_381350 ?auto_381355 ) ) ( not ( = ?auto_381350 ?auto_381356 ) ) ( not ( = ?auto_381350 ?auto_381357 ) ) ( not ( = ?auto_381350 ?auto_381358 ) ) ( not ( = ?auto_381350 ?auto_381359 ) ) ( not ( = ?auto_381350 ?auto_381360 ) ) ( not ( = ?auto_381350 ?auto_381361 ) ) ( not ( = ?auto_381351 ?auto_381352 ) ) ( not ( = ?auto_381351 ?auto_381353 ) ) ( not ( = ?auto_381351 ?auto_381354 ) ) ( not ( = ?auto_381351 ?auto_381355 ) ) ( not ( = ?auto_381351 ?auto_381356 ) ) ( not ( = ?auto_381351 ?auto_381357 ) ) ( not ( = ?auto_381351 ?auto_381358 ) ) ( not ( = ?auto_381351 ?auto_381359 ) ) ( not ( = ?auto_381351 ?auto_381360 ) ) ( not ( = ?auto_381351 ?auto_381361 ) ) ( not ( = ?auto_381352 ?auto_381353 ) ) ( not ( = ?auto_381352 ?auto_381354 ) ) ( not ( = ?auto_381352 ?auto_381355 ) ) ( not ( = ?auto_381352 ?auto_381356 ) ) ( not ( = ?auto_381352 ?auto_381357 ) ) ( not ( = ?auto_381352 ?auto_381358 ) ) ( not ( = ?auto_381352 ?auto_381359 ) ) ( not ( = ?auto_381352 ?auto_381360 ) ) ( not ( = ?auto_381352 ?auto_381361 ) ) ( not ( = ?auto_381353 ?auto_381354 ) ) ( not ( = ?auto_381353 ?auto_381355 ) ) ( not ( = ?auto_381353 ?auto_381356 ) ) ( not ( = ?auto_381353 ?auto_381357 ) ) ( not ( = ?auto_381353 ?auto_381358 ) ) ( not ( = ?auto_381353 ?auto_381359 ) ) ( not ( = ?auto_381353 ?auto_381360 ) ) ( not ( = ?auto_381353 ?auto_381361 ) ) ( not ( = ?auto_381354 ?auto_381355 ) ) ( not ( = ?auto_381354 ?auto_381356 ) ) ( not ( = ?auto_381354 ?auto_381357 ) ) ( not ( = ?auto_381354 ?auto_381358 ) ) ( not ( = ?auto_381354 ?auto_381359 ) ) ( not ( = ?auto_381354 ?auto_381360 ) ) ( not ( = ?auto_381354 ?auto_381361 ) ) ( not ( = ?auto_381355 ?auto_381356 ) ) ( not ( = ?auto_381355 ?auto_381357 ) ) ( not ( = ?auto_381355 ?auto_381358 ) ) ( not ( = ?auto_381355 ?auto_381359 ) ) ( not ( = ?auto_381355 ?auto_381360 ) ) ( not ( = ?auto_381355 ?auto_381361 ) ) ( not ( = ?auto_381356 ?auto_381357 ) ) ( not ( = ?auto_381356 ?auto_381358 ) ) ( not ( = ?auto_381356 ?auto_381359 ) ) ( not ( = ?auto_381356 ?auto_381360 ) ) ( not ( = ?auto_381356 ?auto_381361 ) ) ( not ( = ?auto_381357 ?auto_381358 ) ) ( not ( = ?auto_381357 ?auto_381359 ) ) ( not ( = ?auto_381357 ?auto_381360 ) ) ( not ( = ?auto_381357 ?auto_381361 ) ) ( not ( = ?auto_381358 ?auto_381359 ) ) ( not ( = ?auto_381358 ?auto_381360 ) ) ( not ( = ?auto_381358 ?auto_381361 ) ) ( not ( = ?auto_381359 ?auto_381360 ) ) ( not ( = ?auto_381359 ?auto_381361 ) ) ( not ( = ?auto_381360 ?auto_381361 ) ) ( ON ?auto_381359 ?auto_381360 ) ( ON ?auto_381358 ?auto_381359 ) ( ON ?auto_381357 ?auto_381358 ) ( ON ?auto_381356 ?auto_381357 ) ( ON ?auto_381355 ?auto_381356 ) ( ON ?auto_381354 ?auto_381355 ) ( ON ?auto_381353 ?auto_381354 ) ( ON ?auto_381352 ?auto_381353 ) ( ON ?auto_381351 ?auto_381352 ) ( ON ?auto_381350 ?auto_381351 ) ( ON ?auto_381349 ?auto_381350 ) ( ON ?auto_381348 ?auto_381349 ) ( CLEAR ?auto_381346 ) ( ON ?auto_381347 ?auto_381348 ) ( CLEAR ?auto_381347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_381346 ?auto_381347 )
      ( MAKE-15PILE ?auto_381346 ?auto_381347 ?auto_381348 ?auto_381349 ?auto_381350 ?auto_381351 ?auto_381352 ?auto_381353 ?auto_381354 ?auto_381355 ?auto_381356 ?auto_381357 ?auto_381358 ?auto_381359 ?auto_381360 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381377 - BLOCK
      ?auto_381378 - BLOCK
      ?auto_381379 - BLOCK
      ?auto_381380 - BLOCK
      ?auto_381381 - BLOCK
      ?auto_381382 - BLOCK
      ?auto_381383 - BLOCK
      ?auto_381384 - BLOCK
      ?auto_381385 - BLOCK
      ?auto_381386 - BLOCK
      ?auto_381387 - BLOCK
      ?auto_381388 - BLOCK
      ?auto_381389 - BLOCK
      ?auto_381390 - BLOCK
      ?auto_381391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_381391 ) ( ON-TABLE ?auto_381377 ) ( not ( = ?auto_381377 ?auto_381378 ) ) ( not ( = ?auto_381377 ?auto_381379 ) ) ( not ( = ?auto_381377 ?auto_381380 ) ) ( not ( = ?auto_381377 ?auto_381381 ) ) ( not ( = ?auto_381377 ?auto_381382 ) ) ( not ( = ?auto_381377 ?auto_381383 ) ) ( not ( = ?auto_381377 ?auto_381384 ) ) ( not ( = ?auto_381377 ?auto_381385 ) ) ( not ( = ?auto_381377 ?auto_381386 ) ) ( not ( = ?auto_381377 ?auto_381387 ) ) ( not ( = ?auto_381377 ?auto_381388 ) ) ( not ( = ?auto_381377 ?auto_381389 ) ) ( not ( = ?auto_381377 ?auto_381390 ) ) ( not ( = ?auto_381377 ?auto_381391 ) ) ( not ( = ?auto_381378 ?auto_381379 ) ) ( not ( = ?auto_381378 ?auto_381380 ) ) ( not ( = ?auto_381378 ?auto_381381 ) ) ( not ( = ?auto_381378 ?auto_381382 ) ) ( not ( = ?auto_381378 ?auto_381383 ) ) ( not ( = ?auto_381378 ?auto_381384 ) ) ( not ( = ?auto_381378 ?auto_381385 ) ) ( not ( = ?auto_381378 ?auto_381386 ) ) ( not ( = ?auto_381378 ?auto_381387 ) ) ( not ( = ?auto_381378 ?auto_381388 ) ) ( not ( = ?auto_381378 ?auto_381389 ) ) ( not ( = ?auto_381378 ?auto_381390 ) ) ( not ( = ?auto_381378 ?auto_381391 ) ) ( not ( = ?auto_381379 ?auto_381380 ) ) ( not ( = ?auto_381379 ?auto_381381 ) ) ( not ( = ?auto_381379 ?auto_381382 ) ) ( not ( = ?auto_381379 ?auto_381383 ) ) ( not ( = ?auto_381379 ?auto_381384 ) ) ( not ( = ?auto_381379 ?auto_381385 ) ) ( not ( = ?auto_381379 ?auto_381386 ) ) ( not ( = ?auto_381379 ?auto_381387 ) ) ( not ( = ?auto_381379 ?auto_381388 ) ) ( not ( = ?auto_381379 ?auto_381389 ) ) ( not ( = ?auto_381379 ?auto_381390 ) ) ( not ( = ?auto_381379 ?auto_381391 ) ) ( not ( = ?auto_381380 ?auto_381381 ) ) ( not ( = ?auto_381380 ?auto_381382 ) ) ( not ( = ?auto_381380 ?auto_381383 ) ) ( not ( = ?auto_381380 ?auto_381384 ) ) ( not ( = ?auto_381380 ?auto_381385 ) ) ( not ( = ?auto_381380 ?auto_381386 ) ) ( not ( = ?auto_381380 ?auto_381387 ) ) ( not ( = ?auto_381380 ?auto_381388 ) ) ( not ( = ?auto_381380 ?auto_381389 ) ) ( not ( = ?auto_381380 ?auto_381390 ) ) ( not ( = ?auto_381380 ?auto_381391 ) ) ( not ( = ?auto_381381 ?auto_381382 ) ) ( not ( = ?auto_381381 ?auto_381383 ) ) ( not ( = ?auto_381381 ?auto_381384 ) ) ( not ( = ?auto_381381 ?auto_381385 ) ) ( not ( = ?auto_381381 ?auto_381386 ) ) ( not ( = ?auto_381381 ?auto_381387 ) ) ( not ( = ?auto_381381 ?auto_381388 ) ) ( not ( = ?auto_381381 ?auto_381389 ) ) ( not ( = ?auto_381381 ?auto_381390 ) ) ( not ( = ?auto_381381 ?auto_381391 ) ) ( not ( = ?auto_381382 ?auto_381383 ) ) ( not ( = ?auto_381382 ?auto_381384 ) ) ( not ( = ?auto_381382 ?auto_381385 ) ) ( not ( = ?auto_381382 ?auto_381386 ) ) ( not ( = ?auto_381382 ?auto_381387 ) ) ( not ( = ?auto_381382 ?auto_381388 ) ) ( not ( = ?auto_381382 ?auto_381389 ) ) ( not ( = ?auto_381382 ?auto_381390 ) ) ( not ( = ?auto_381382 ?auto_381391 ) ) ( not ( = ?auto_381383 ?auto_381384 ) ) ( not ( = ?auto_381383 ?auto_381385 ) ) ( not ( = ?auto_381383 ?auto_381386 ) ) ( not ( = ?auto_381383 ?auto_381387 ) ) ( not ( = ?auto_381383 ?auto_381388 ) ) ( not ( = ?auto_381383 ?auto_381389 ) ) ( not ( = ?auto_381383 ?auto_381390 ) ) ( not ( = ?auto_381383 ?auto_381391 ) ) ( not ( = ?auto_381384 ?auto_381385 ) ) ( not ( = ?auto_381384 ?auto_381386 ) ) ( not ( = ?auto_381384 ?auto_381387 ) ) ( not ( = ?auto_381384 ?auto_381388 ) ) ( not ( = ?auto_381384 ?auto_381389 ) ) ( not ( = ?auto_381384 ?auto_381390 ) ) ( not ( = ?auto_381384 ?auto_381391 ) ) ( not ( = ?auto_381385 ?auto_381386 ) ) ( not ( = ?auto_381385 ?auto_381387 ) ) ( not ( = ?auto_381385 ?auto_381388 ) ) ( not ( = ?auto_381385 ?auto_381389 ) ) ( not ( = ?auto_381385 ?auto_381390 ) ) ( not ( = ?auto_381385 ?auto_381391 ) ) ( not ( = ?auto_381386 ?auto_381387 ) ) ( not ( = ?auto_381386 ?auto_381388 ) ) ( not ( = ?auto_381386 ?auto_381389 ) ) ( not ( = ?auto_381386 ?auto_381390 ) ) ( not ( = ?auto_381386 ?auto_381391 ) ) ( not ( = ?auto_381387 ?auto_381388 ) ) ( not ( = ?auto_381387 ?auto_381389 ) ) ( not ( = ?auto_381387 ?auto_381390 ) ) ( not ( = ?auto_381387 ?auto_381391 ) ) ( not ( = ?auto_381388 ?auto_381389 ) ) ( not ( = ?auto_381388 ?auto_381390 ) ) ( not ( = ?auto_381388 ?auto_381391 ) ) ( not ( = ?auto_381389 ?auto_381390 ) ) ( not ( = ?auto_381389 ?auto_381391 ) ) ( not ( = ?auto_381390 ?auto_381391 ) ) ( ON ?auto_381390 ?auto_381391 ) ( ON ?auto_381389 ?auto_381390 ) ( ON ?auto_381388 ?auto_381389 ) ( ON ?auto_381387 ?auto_381388 ) ( ON ?auto_381386 ?auto_381387 ) ( ON ?auto_381385 ?auto_381386 ) ( ON ?auto_381384 ?auto_381385 ) ( ON ?auto_381383 ?auto_381384 ) ( ON ?auto_381382 ?auto_381383 ) ( ON ?auto_381381 ?auto_381382 ) ( ON ?auto_381380 ?auto_381381 ) ( ON ?auto_381379 ?auto_381380 ) ( CLEAR ?auto_381377 ) ( ON ?auto_381378 ?auto_381379 ) ( CLEAR ?auto_381378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_381377 ?auto_381378 )
      ( MAKE-15PILE ?auto_381377 ?auto_381378 ?auto_381379 ?auto_381380 ?auto_381381 ?auto_381382 ?auto_381383 ?auto_381384 ?auto_381385 ?auto_381386 ?auto_381387 ?auto_381388 ?auto_381389 ?auto_381390 ?auto_381391 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381407 - BLOCK
      ?auto_381408 - BLOCK
      ?auto_381409 - BLOCK
      ?auto_381410 - BLOCK
      ?auto_381411 - BLOCK
      ?auto_381412 - BLOCK
      ?auto_381413 - BLOCK
      ?auto_381414 - BLOCK
      ?auto_381415 - BLOCK
      ?auto_381416 - BLOCK
      ?auto_381417 - BLOCK
      ?auto_381418 - BLOCK
      ?auto_381419 - BLOCK
      ?auto_381420 - BLOCK
      ?auto_381421 - BLOCK
    )
    :vars
    (
      ?auto_381422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381421 ?auto_381422 ) ( not ( = ?auto_381407 ?auto_381408 ) ) ( not ( = ?auto_381407 ?auto_381409 ) ) ( not ( = ?auto_381407 ?auto_381410 ) ) ( not ( = ?auto_381407 ?auto_381411 ) ) ( not ( = ?auto_381407 ?auto_381412 ) ) ( not ( = ?auto_381407 ?auto_381413 ) ) ( not ( = ?auto_381407 ?auto_381414 ) ) ( not ( = ?auto_381407 ?auto_381415 ) ) ( not ( = ?auto_381407 ?auto_381416 ) ) ( not ( = ?auto_381407 ?auto_381417 ) ) ( not ( = ?auto_381407 ?auto_381418 ) ) ( not ( = ?auto_381407 ?auto_381419 ) ) ( not ( = ?auto_381407 ?auto_381420 ) ) ( not ( = ?auto_381407 ?auto_381421 ) ) ( not ( = ?auto_381407 ?auto_381422 ) ) ( not ( = ?auto_381408 ?auto_381409 ) ) ( not ( = ?auto_381408 ?auto_381410 ) ) ( not ( = ?auto_381408 ?auto_381411 ) ) ( not ( = ?auto_381408 ?auto_381412 ) ) ( not ( = ?auto_381408 ?auto_381413 ) ) ( not ( = ?auto_381408 ?auto_381414 ) ) ( not ( = ?auto_381408 ?auto_381415 ) ) ( not ( = ?auto_381408 ?auto_381416 ) ) ( not ( = ?auto_381408 ?auto_381417 ) ) ( not ( = ?auto_381408 ?auto_381418 ) ) ( not ( = ?auto_381408 ?auto_381419 ) ) ( not ( = ?auto_381408 ?auto_381420 ) ) ( not ( = ?auto_381408 ?auto_381421 ) ) ( not ( = ?auto_381408 ?auto_381422 ) ) ( not ( = ?auto_381409 ?auto_381410 ) ) ( not ( = ?auto_381409 ?auto_381411 ) ) ( not ( = ?auto_381409 ?auto_381412 ) ) ( not ( = ?auto_381409 ?auto_381413 ) ) ( not ( = ?auto_381409 ?auto_381414 ) ) ( not ( = ?auto_381409 ?auto_381415 ) ) ( not ( = ?auto_381409 ?auto_381416 ) ) ( not ( = ?auto_381409 ?auto_381417 ) ) ( not ( = ?auto_381409 ?auto_381418 ) ) ( not ( = ?auto_381409 ?auto_381419 ) ) ( not ( = ?auto_381409 ?auto_381420 ) ) ( not ( = ?auto_381409 ?auto_381421 ) ) ( not ( = ?auto_381409 ?auto_381422 ) ) ( not ( = ?auto_381410 ?auto_381411 ) ) ( not ( = ?auto_381410 ?auto_381412 ) ) ( not ( = ?auto_381410 ?auto_381413 ) ) ( not ( = ?auto_381410 ?auto_381414 ) ) ( not ( = ?auto_381410 ?auto_381415 ) ) ( not ( = ?auto_381410 ?auto_381416 ) ) ( not ( = ?auto_381410 ?auto_381417 ) ) ( not ( = ?auto_381410 ?auto_381418 ) ) ( not ( = ?auto_381410 ?auto_381419 ) ) ( not ( = ?auto_381410 ?auto_381420 ) ) ( not ( = ?auto_381410 ?auto_381421 ) ) ( not ( = ?auto_381410 ?auto_381422 ) ) ( not ( = ?auto_381411 ?auto_381412 ) ) ( not ( = ?auto_381411 ?auto_381413 ) ) ( not ( = ?auto_381411 ?auto_381414 ) ) ( not ( = ?auto_381411 ?auto_381415 ) ) ( not ( = ?auto_381411 ?auto_381416 ) ) ( not ( = ?auto_381411 ?auto_381417 ) ) ( not ( = ?auto_381411 ?auto_381418 ) ) ( not ( = ?auto_381411 ?auto_381419 ) ) ( not ( = ?auto_381411 ?auto_381420 ) ) ( not ( = ?auto_381411 ?auto_381421 ) ) ( not ( = ?auto_381411 ?auto_381422 ) ) ( not ( = ?auto_381412 ?auto_381413 ) ) ( not ( = ?auto_381412 ?auto_381414 ) ) ( not ( = ?auto_381412 ?auto_381415 ) ) ( not ( = ?auto_381412 ?auto_381416 ) ) ( not ( = ?auto_381412 ?auto_381417 ) ) ( not ( = ?auto_381412 ?auto_381418 ) ) ( not ( = ?auto_381412 ?auto_381419 ) ) ( not ( = ?auto_381412 ?auto_381420 ) ) ( not ( = ?auto_381412 ?auto_381421 ) ) ( not ( = ?auto_381412 ?auto_381422 ) ) ( not ( = ?auto_381413 ?auto_381414 ) ) ( not ( = ?auto_381413 ?auto_381415 ) ) ( not ( = ?auto_381413 ?auto_381416 ) ) ( not ( = ?auto_381413 ?auto_381417 ) ) ( not ( = ?auto_381413 ?auto_381418 ) ) ( not ( = ?auto_381413 ?auto_381419 ) ) ( not ( = ?auto_381413 ?auto_381420 ) ) ( not ( = ?auto_381413 ?auto_381421 ) ) ( not ( = ?auto_381413 ?auto_381422 ) ) ( not ( = ?auto_381414 ?auto_381415 ) ) ( not ( = ?auto_381414 ?auto_381416 ) ) ( not ( = ?auto_381414 ?auto_381417 ) ) ( not ( = ?auto_381414 ?auto_381418 ) ) ( not ( = ?auto_381414 ?auto_381419 ) ) ( not ( = ?auto_381414 ?auto_381420 ) ) ( not ( = ?auto_381414 ?auto_381421 ) ) ( not ( = ?auto_381414 ?auto_381422 ) ) ( not ( = ?auto_381415 ?auto_381416 ) ) ( not ( = ?auto_381415 ?auto_381417 ) ) ( not ( = ?auto_381415 ?auto_381418 ) ) ( not ( = ?auto_381415 ?auto_381419 ) ) ( not ( = ?auto_381415 ?auto_381420 ) ) ( not ( = ?auto_381415 ?auto_381421 ) ) ( not ( = ?auto_381415 ?auto_381422 ) ) ( not ( = ?auto_381416 ?auto_381417 ) ) ( not ( = ?auto_381416 ?auto_381418 ) ) ( not ( = ?auto_381416 ?auto_381419 ) ) ( not ( = ?auto_381416 ?auto_381420 ) ) ( not ( = ?auto_381416 ?auto_381421 ) ) ( not ( = ?auto_381416 ?auto_381422 ) ) ( not ( = ?auto_381417 ?auto_381418 ) ) ( not ( = ?auto_381417 ?auto_381419 ) ) ( not ( = ?auto_381417 ?auto_381420 ) ) ( not ( = ?auto_381417 ?auto_381421 ) ) ( not ( = ?auto_381417 ?auto_381422 ) ) ( not ( = ?auto_381418 ?auto_381419 ) ) ( not ( = ?auto_381418 ?auto_381420 ) ) ( not ( = ?auto_381418 ?auto_381421 ) ) ( not ( = ?auto_381418 ?auto_381422 ) ) ( not ( = ?auto_381419 ?auto_381420 ) ) ( not ( = ?auto_381419 ?auto_381421 ) ) ( not ( = ?auto_381419 ?auto_381422 ) ) ( not ( = ?auto_381420 ?auto_381421 ) ) ( not ( = ?auto_381420 ?auto_381422 ) ) ( not ( = ?auto_381421 ?auto_381422 ) ) ( ON ?auto_381420 ?auto_381421 ) ( ON ?auto_381419 ?auto_381420 ) ( ON ?auto_381418 ?auto_381419 ) ( ON ?auto_381417 ?auto_381418 ) ( ON ?auto_381416 ?auto_381417 ) ( ON ?auto_381415 ?auto_381416 ) ( ON ?auto_381414 ?auto_381415 ) ( ON ?auto_381413 ?auto_381414 ) ( ON ?auto_381412 ?auto_381413 ) ( ON ?auto_381411 ?auto_381412 ) ( ON ?auto_381410 ?auto_381411 ) ( ON ?auto_381409 ?auto_381410 ) ( ON ?auto_381408 ?auto_381409 ) ( ON ?auto_381407 ?auto_381408 ) ( CLEAR ?auto_381407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381407 )
      ( MAKE-15PILE ?auto_381407 ?auto_381408 ?auto_381409 ?auto_381410 ?auto_381411 ?auto_381412 ?auto_381413 ?auto_381414 ?auto_381415 ?auto_381416 ?auto_381417 ?auto_381418 ?auto_381419 ?auto_381420 ?auto_381421 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381438 - BLOCK
      ?auto_381439 - BLOCK
      ?auto_381440 - BLOCK
      ?auto_381441 - BLOCK
      ?auto_381442 - BLOCK
      ?auto_381443 - BLOCK
      ?auto_381444 - BLOCK
      ?auto_381445 - BLOCK
      ?auto_381446 - BLOCK
      ?auto_381447 - BLOCK
      ?auto_381448 - BLOCK
      ?auto_381449 - BLOCK
      ?auto_381450 - BLOCK
      ?auto_381451 - BLOCK
      ?auto_381452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_381452 ) ( not ( = ?auto_381438 ?auto_381439 ) ) ( not ( = ?auto_381438 ?auto_381440 ) ) ( not ( = ?auto_381438 ?auto_381441 ) ) ( not ( = ?auto_381438 ?auto_381442 ) ) ( not ( = ?auto_381438 ?auto_381443 ) ) ( not ( = ?auto_381438 ?auto_381444 ) ) ( not ( = ?auto_381438 ?auto_381445 ) ) ( not ( = ?auto_381438 ?auto_381446 ) ) ( not ( = ?auto_381438 ?auto_381447 ) ) ( not ( = ?auto_381438 ?auto_381448 ) ) ( not ( = ?auto_381438 ?auto_381449 ) ) ( not ( = ?auto_381438 ?auto_381450 ) ) ( not ( = ?auto_381438 ?auto_381451 ) ) ( not ( = ?auto_381438 ?auto_381452 ) ) ( not ( = ?auto_381439 ?auto_381440 ) ) ( not ( = ?auto_381439 ?auto_381441 ) ) ( not ( = ?auto_381439 ?auto_381442 ) ) ( not ( = ?auto_381439 ?auto_381443 ) ) ( not ( = ?auto_381439 ?auto_381444 ) ) ( not ( = ?auto_381439 ?auto_381445 ) ) ( not ( = ?auto_381439 ?auto_381446 ) ) ( not ( = ?auto_381439 ?auto_381447 ) ) ( not ( = ?auto_381439 ?auto_381448 ) ) ( not ( = ?auto_381439 ?auto_381449 ) ) ( not ( = ?auto_381439 ?auto_381450 ) ) ( not ( = ?auto_381439 ?auto_381451 ) ) ( not ( = ?auto_381439 ?auto_381452 ) ) ( not ( = ?auto_381440 ?auto_381441 ) ) ( not ( = ?auto_381440 ?auto_381442 ) ) ( not ( = ?auto_381440 ?auto_381443 ) ) ( not ( = ?auto_381440 ?auto_381444 ) ) ( not ( = ?auto_381440 ?auto_381445 ) ) ( not ( = ?auto_381440 ?auto_381446 ) ) ( not ( = ?auto_381440 ?auto_381447 ) ) ( not ( = ?auto_381440 ?auto_381448 ) ) ( not ( = ?auto_381440 ?auto_381449 ) ) ( not ( = ?auto_381440 ?auto_381450 ) ) ( not ( = ?auto_381440 ?auto_381451 ) ) ( not ( = ?auto_381440 ?auto_381452 ) ) ( not ( = ?auto_381441 ?auto_381442 ) ) ( not ( = ?auto_381441 ?auto_381443 ) ) ( not ( = ?auto_381441 ?auto_381444 ) ) ( not ( = ?auto_381441 ?auto_381445 ) ) ( not ( = ?auto_381441 ?auto_381446 ) ) ( not ( = ?auto_381441 ?auto_381447 ) ) ( not ( = ?auto_381441 ?auto_381448 ) ) ( not ( = ?auto_381441 ?auto_381449 ) ) ( not ( = ?auto_381441 ?auto_381450 ) ) ( not ( = ?auto_381441 ?auto_381451 ) ) ( not ( = ?auto_381441 ?auto_381452 ) ) ( not ( = ?auto_381442 ?auto_381443 ) ) ( not ( = ?auto_381442 ?auto_381444 ) ) ( not ( = ?auto_381442 ?auto_381445 ) ) ( not ( = ?auto_381442 ?auto_381446 ) ) ( not ( = ?auto_381442 ?auto_381447 ) ) ( not ( = ?auto_381442 ?auto_381448 ) ) ( not ( = ?auto_381442 ?auto_381449 ) ) ( not ( = ?auto_381442 ?auto_381450 ) ) ( not ( = ?auto_381442 ?auto_381451 ) ) ( not ( = ?auto_381442 ?auto_381452 ) ) ( not ( = ?auto_381443 ?auto_381444 ) ) ( not ( = ?auto_381443 ?auto_381445 ) ) ( not ( = ?auto_381443 ?auto_381446 ) ) ( not ( = ?auto_381443 ?auto_381447 ) ) ( not ( = ?auto_381443 ?auto_381448 ) ) ( not ( = ?auto_381443 ?auto_381449 ) ) ( not ( = ?auto_381443 ?auto_381450 ) ) ( not ( = ?auto_381443 ?auto_381451 ) ) ( not ( = ?auto_381443 ?auto_381452 ) ) ( not ( = ?auto_381444 ?auto_381445 ) ) ( not ( = ?auto_381444 ?auto_381446 ) ) ( not ( = ?auto_381444 ?auto_381447 ) ) ( not ( = ?auto_381444 ?auto_381448 ) ) ( not ( = ?auto_381444 ?auto_381449 ) ) ( not ( = ?auto_381444 ?auto_381450 ) ) ( not ( = ?auto_381444 ?auto_381451 ) ) ( not ( = ?auto_381444 ?auto_381452 ) ) ( not ( = ?auto_381445 ?auto_381446 ) ) ( not ( = ?auto_381445 ?auto_381447 ) ) ( not ( = ?auto_381445 ?auto_381448 ) ) ( not ( = ?auto_381445 ?auto_381449 ) ) ( not ( = ?auto_381445 ?auto_381450 ) ) ( not ( = ?auto_381445 ?auto_381451 ) ) ( not ( = ?auto_381445 ?auto_381452 ) ) ( not ( = ?auto_381446 ?auto_381447 ) ) ( not ( = ?auto_381446 ?auto_381448 ) ) ( not ( = ?auto_381446 ?auto_381449 ) ) ( not ( = ?auto_381446 ?auto_381450 ) ) ( not ( = ?auto_381446 ?auto_381451 ) ) ( not ( = ?auto_381446 ?auto_381452 ) ) ( not ( = ?auto_381447 ?auto_381448 ) ) ( not ( = ?auto_381447 ?auto_381449 ) ) ( not ( = ?auto_381447 ?auto_381450 ) ) ( not ( = ?auto_381447 ?auto_381451 ) ) ( not ( = ?auto_381447 ?auto_381452 ) ) ( not ( = ?auto_381448 ?auto_381449 ) ) ( not ( = ?auto_381448 ?auto_381450 ) ) ( not ( = ?auto_381448 ?auto_381451 ) ) ( not ( = ?auto_381448 ?auto_381452 ) ) ( not ( = ?auto_381449 ?auto_381450 ) ) ( not ( = ?auto_381449 ?auto_381451 ) ) ( not ( = ?auto_381449 ?auto_381452 ) ) ( not ( = ?auto_381450 ?auto_381451 ) ) ( not ( = ?auto_381450 ?auto_381452 ) ) ( not ( = ?auto_381451 ?auto_381452 ) ) ( ON ?auto_381451 ?auto_381452 ) ( ON ?auto_381450 ?auto_381451 ) ( ON ?auto_381449 ?auto_381450 ) ( ON ?auto_381448 ?auto_381449 ) ( ON ?auto_381447 ?auto_381448 ) ( ON ?auto_381446 ?auto_381447 ) ( ON ?auto_381445 ?auto_381446 ) ( ON ?auto_381444 ?auto_381445 ) ( ON ?auto_381443 ?auto_381444 ) ( ON ?auto_381442 ?auto_381443 ) ( ON ?auto_381441 ?auto_381442 ) ( ON ?auto_381440 ?auto_381441 ) ( ON ?auto_381439 ?auto_381440 ) ( ON ?auto_381438 ?auto_381439 ) ( CLEAR ?auto_381438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381438 )
      ( MAKE-15PILE ?auto_381438 ?auto_381439 ?auto_381440 ?auto_381441 ?auto_381442 ?auto_381443 ?auto_381444 ?auto_381445 ?auto_381446 ?auto_381447 ?auto_381448 ?auto_381449 ?auto_381450 ?auto_381451 ?auto_381452 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_381468 - BLOCK
      ?auto_381469 - BLOCK
      ?auto_381470 - BLOCK
      ?auto_381471 - BLOCK
      ?auto_381472 - BLOCK
      ?auto_381473 - BLOCK
      ?auto_381474 - BLOCK
      ?auto_381475 - BLOCK
      ?auto_381476 - BLOCK
      ?auto_381477 - BLOCK
      ?auto_381478 - BLOCK
      ?auto_381479 - BLOCK
      ?auto_381480 - BLOCK
      ?auto_381481 - BLOCK
      ?auto_381482 - BLOCK
    )
    :vars
    (
      ?auto_381483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_381468 ?auto_381469 ) ) ( not ( = ?auto_381468 ?auto_381470 ) ) ( not ( = ?auto_381468 ?auto_381471 ) ) ( not ( = ?auto_381468 ?auto_381472 ) ) ( not ( = ?auto_381468 ?auto_381473 ) ) ( not ( = ?auto_381468 ?auto_381474 ) ) ( not ( = ?auto_381468 ?auto_381475 ) ) ( not ( = ?auto_381468 ?auto_381476 ) ) ( not ( = ?auto_381468 ?auto_381477 ) ) ( not ( = ?auto_381468 ?auto_381478 ) ) ( not ( = ?auto_381468 ?auto_381479 ) ) ( not ( = ?auto_381468 ?auto_381480 ) ) ( not ( = ?auto_381468 ?auto_381481 ) ) ( not ( = ?auto_381468 ?auto_381482 ) ) ( not ( = ?auto_381469 ?auto_381470 ) ) ( not ( = ?auto_381469 ?auto_381471 ) ) ( not ( = ?auto_381469 ?auto_381472 ) ) ( not ( = ?auto_381469 ?auto_381473 ) ) ( not ( = ?auto_381469 ?auto_381474 ) ) ( not ( = ?auto_381469 ?auto_381475 ) ) ( not ( = ?auto_381469 ?auto_381476 ) ) ( not ( = ?auto_381469 ?auto_381477 ) ) ( not ( = ?auto_381469 ?auto_381478 ) ) ( not ( = ?auto_381469 ?auto_381479 ) ) ( not ( = ?auto_381469 ?auto_381480 ) ) ( not ( = ?auto_381469 ?auto_381481 ) ) ( not ( = ?auto_381469 ?auto_381482 ) ) ( not ( = ?auto_381470 ?auto_381471 ) ) ( not ( = ?auto_381470 ?auto_381472 ) ) ( not ( = ?auto_381470 ?auto_381473 ) ) ( not ( = ?auto_381470 ?auto_381474 ) ) ( not ( = ?auto_381470 ?auto_381475 ) ) ( not ( = ?auto_381470 ?auto_381476 ) ) ( not ( = ?auto_381470 ?auto_381477 ) ) ( not ( = ?auto_381470 ?auto_381478 ) ) ( not ( = ?auto_381470 ?auto_381479 ) ) ( not ( = ?auto_381470 ?auto_381480 ) ) ( not ( = ?auto_381470 ?auto_381481 ) ) ( not ( = ?auto_381470 ?auto_381482 ) ) ( not ( = ?auto_381471 ?auto_381472 ) ) ( not ( = ?auto_381471 ?auto_381473 ) ) ( not ( = ?auto_381471 ?auto_381474 ) ) ( not ( = ?auto_381471 ?auto_381475 ) ) ( not ( = ?auto_381471 ?auto_381476 ) ) ( not ( = ?auto_381471 ?auto_381477 ) ) ( not ( = ?auto_381471 ?auto_381478 ) ) ( not ( = ?auto_381471 ?auto_381479 ) ) ( not ( = ?auto_381471 ?auto_381480 ) ) ( not ( = ?auto_381471 ?auto_381481 ) ) ( not ( = ?auto_381471 ?auto_381482 ) ) ( not ( = ?auto_381472 ?auto_381473 ) ) ( not ( = ?auto_381472 ?auto_381474 ) ) ( not ( = ?auto_381472 ?auto_381475 ) ) ( not ( = ?auto_381472 ?auto_381476 ) ) ( not ( = ?auto_381472 ?auto_381477 ) ) ( not ( = ?auto_381472 ?auto_381478 ) ) ( not ( = ?auto_381472 ?auto_381479 ) ) ( not ( = ?auto_381472 ?auto_381480 ) ) ( not ( = ?auto_381472 ?auto_381481 ) ) ( not ( = ?auto_381472 ?auto_381482 ) ) ( not ( = ?auto_381473 ?auto_381474 ) ) ( not ( = ?auto_381473 ?auto_381475 ) ) ( not ( = ?auto_381473 ?auto_381476 ) ) ( not ( = ?auto_381473 ?auto_381477 ) ) ( not ( = ?auto_381473 ?auto_381478 ) ) ( not ( = ?auto_381473 ?auto_381479 ) ) ( not ( = ?auto_381473 ?auto_381480 ) ) ( not ( = ?auto_381473 ?auto_381481 ) ) ( not ( = ?auto_381473 ?auto_381482 ) ) ( not ( = ?auto_381474 ?auto_381475 ) ) ( not ( = ?auto_381474 ?auto_381476 ) ) ( not ( = ?auto_381474 ?auto_381477 ) ) ( not ( = ?auto_381474 ?auto_381478 ) ) ( not ( = ?auto_381474 ?auto_381479 ) ) ( not ( = ?auto_381474 ?auto_381480 ) ) ( not ( = ?auto_381474 ?auto_381481 ) ) ( not ( = ?auto_381474 ?auto_381482 ) ) ( not ( = ?auto_381475 ?auto_381476 ) ) ( not ( = ?auto_381475 ?auto_381477 ) ) ( not ( = ?auto_381475 ?auto_381478 ) ) ( not ( = ?auto_381475 ?auto_381479 ) ) ( not ( = ?auto_381475 ?auto_381480 ) ) ( not ( = ?auto_381475 ?auto_381481 ) ) ( not ( = ?auto_381475 ?auto_381482 ) ) ( not ( = ?auto_381476 ?auto_381477 ) ) ( not ( = ?auto_381476 ?auto_381478 ) ) ( not ( = ?auto_381476 ?auto_381479 ) ) ( not ( = ?auto_381476 ?auto_381480 ) ) ( not ( = ?auto_381476 ?auto_381481 ) ) ( not ( = ?auto_381476 ?auto_381482 ) ) ( not ( = ?auto_381477 ?auto_381478 ) ) ( not ( = ?auto_381477 ?auto_381479 ) ) ( not ( = ?auto_381477 ?auto_381480 ) ) ( not ( = ?auto_381477 ?auto_381481 ) ) ( not ( = ?auto_381477 ?auto_381482 ) ) ( not ( = ?auto_381478 ?auto_381479 ) ) ( not ( = ?auto_381478 ?auto_381480 ) ) ( not ( = ?auto_381478 ?auto_381481 ) ) ( not ( = ?auto_381478 ?auto_381482 ) ) ( not ( = ?auto_381479 ?auto_381480 ) ) ( not ( = ?auto_381479 ?auto_381481 ) ) ( not ( = ?auto_381479 ?auto_381482 ) ) ( not ( = ?auto_381480 ?auto_381481 ) ) ( not ( = ?auto_381480 ?auto_381482 ) ) ( not ( = ?auto_381481 ?auto_381482 ) ) ( ON ?auto_381468 ?auto_381483 ) ( not ( = ?auto_381482 ?auto_381483 ) ) ( not ( = ?auto_381481 ?auto_381483 ) ) ( not ( = ?auto_381480 ?auto_381483 ) ) ( not ( = ?auto_381479 ?auto_381483 ) ) ( not ( = ?auto_381478 ?auto_381483 ) ) ( not ( = ?auto_381477 ?auto_381483 ) ) ( not ( = ?auto_381476 ?auto_381483 ) ) ( not ( = ?auto_381475 ?auto_381483 ) ) ( not ( = ?auto_381474 ?auto_381483 ) ) ( not ( = ?auto_381473 ?auto_381483 ) ) ( not ( = ?auto_381472 ?auto_381483 ) ) ( not ( = ?auto_381471 ?auto_381483 ) ) ( not ( = ?auto_381470 ?auto_381483 ) ) ( not ( = ?auto_381469 ?auto_381483 ) ) ( not ( = ?auto_381468 ?auto_381483 ) ) ( ON ?auto_381469 ?auto_381468 ) ( ON ?auto_381470 ?auto_381469 ) ( ON ?auto_381471 ?auto_381470 ) ( ON ?auto_381472 ?auto_381471 ) ( ON ?auto_381473 ?auto_381472 ) ( ON ?auto_381474 ?auto_381473 ) ( ON ?auto_381475 ?auto_381474 ) ( ON ?auto_381476 ?auto_381475 ) ( ON ?auto_381477 ?auto_381476 ) ( ON ?auto_381478 ?auto_381477 ) ( ON ?auto_381479 ?auto_381478 ) ( ON ?auto_381480 ?auto_381479 ) ( ON ?auto_381481 ?auto_381480 ) ( ON ?auto_381482 ?auto_381481 ) ( CLEAR ?auto_381482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_381482 ?auto_381481 ?auto_381480 ?auto_381479 ?auto_381478 ?auto_381477 ?auto_381476 ?auto_381475 ?auto_381474 ?auto_381473 ?auto_381472 ?auto_381471 ?auto_381470 ?auto_381469 ?auto_381468 )
      ( MAKE-15PILE ?auto_381468 ?auto_381469 ?auto_381470 ?auto_381471 ?auto_381472 ?auto_381473 ?auto_381474 ?auto_381475 ?auto_381476 ?auto_381477 ?auto_381478 ?auto_381479 ?auto_381480 ?auto_381481 ?auto_381482 ) )
  )

)

