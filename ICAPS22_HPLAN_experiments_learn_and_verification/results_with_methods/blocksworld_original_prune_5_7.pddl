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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22324 - BLOCK
      ?auto_22325 - BLOCK
      ?auto_22326 - BLOCK
      ?auto_22327 - BLOCK
      ?auto_22328 - BLOCK
    )
    :vars
    (
      ?auto_22329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22329 ?auto_22328 ) ( CLEAR ?auto_22329 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22324 ) ( ON ?auto_22325 ?auto_22324 ) ( ON ?auto_22326 ?auto_22325 ) ( ON ?auto_22327 ?auto_22326 ) ( ON ?auto_22328 ?auto_22327 ) ( not ( = ?auto_22324 ?auto_22325 ) ) ( not ( = ?auto_22324 ?auto_22326 ) ) ( not ( = ?auto_22324 ?auto_22327 ) ) ( not ( = ?auto_22324 ?auto_22328 ) ) ( not ( = ?auto_22324 ?auto_22329 ) ) ( not ( = ?auto_22325 ?auto_22326 ) ) ( not ( = ?auto_22325 ?auto_22327 ) ) ( not ( = ?auto_22325 ?auto_22328 ) ) ( not ( = ?auto_22325 ?auto_22329 ) ) ( not ( = ?auto_22326 ?auto_22327 ) ) ( not ( = ?auto_22326 ?auto_22328 ) ) ( not ( = ?auto_22326 ?auto_22329 ) ) ( not ( = ?auto_22327 ?auto_22328 ) ) ( not ( = ?auto_22327 ?auto_22329 ) ) ( not ( = ?auto_22328 ?auto_22329 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22329 ?auto_22328 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22331 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22331 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_22331 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22332 - BLOCK
    )
    :vars
    (
      ?auto_22333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22332 ?auto_22333 ) ( CLEAR ?auto_22332 ) ( HAND-EMPTY ) ( not ( = ?auto_22332 ?auto_22333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22332 ?auto_22333 )
      ( MAKE-1PILE ?auto_22332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22338 - BLOCK
      ?auto_22339 - BLOCK
      ?auto_22340 - BLOCK
      ?auto_22341 - BLOCK
    )
    :vars
    (
      ?auto_22342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22342 ?auto_22341 ) ( CLEAR ?auto_22342 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22338 ) ( ON ?auto_22339 ?auto_22338 ) ( ON ?auto_22340 ?auto_22339 ) ( ON ?auto_22341 ?auto_22340 ) ( not ( = ?auto_22338 ?auto_22339 ) ) ( not ( = ?auto_22338 ?auto_22340 ) ) ( not ( = ?auto_22338 ?auto_22341 ) ) ( not ( = ?auto_22338 ?auto_22342 ) ) ( not ( = ?auto_22339 ?auto_22340 ) ) ( not ( = ?auto_22339 ?auto_22341 ) ) ( not ( = ?auto_22339 ?auto_22342 ) ) ( not ( = ?auto_22340 ?auto_22341 ) ) ( not ( = ?auto_22340 ?auto_22342 ) ) ( not ( = ?auto_22341 ?auto_22342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22342 ?auto_22341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22343 - BLOCK
      ?auto_22344 - BLOCK
      ?auto_22345 - BLOCK
      ?auto_22346 - BLOCK
    )
    :vars
    (
      ?auto_22347 - BLOCK
      ?auto_22348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22347 ?auto_22346 ) ( CLEAR ?auto_22347 ) ( ON-TABLE ?auto_22343 ) ( ON ?auto_22344 ?auto_22343 ) ( ON ?auto_22345 ?auto_22344 ) ( ON ?auto_22346 ?auto_22345 ) ( not ( = ?auto_22343 ?auto_22344 ) ) ( not ( = ?auto_22343 ?auto_22345 ) ) ( not ( = ?auto_22343 ?auto_22346 ) ) ( not ( = ?auto_22343 ?auto_22347 ) ) ( not ( = ?auto_22344 ?auto_22345 ) ) ( not ( = ?auto_22344 ?auto_22346 ) ) ( not ( = ?auto_22344 ?auto_22347 ) ) ( not ( = ?auto_22345 ?auto_22346 ) ) ( not ( = ?auto_22345 ?auto_22347 ) ) ( not ( = ?auto_22346 ?auto_22347 ) ) ( HOLDING ?auto_22348 ) ( not ( = ?auto_22343 ?auto_22348 ) ) ( not ( = ?auto_22344 ?auto_22348 ) ) ( not ( = ?auto_22345 ?auto_22348 ) ) ( not ( = ?auto_22346 ?auto_22348 ) ) ( not ( = ?auto_22347 ?auto_22348 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_22348 )
      ( MAKE-4PILE ?auto_22343 ?auto_22344 ?auto_22345 ?auto_22346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22349 - BLOCK
      ?auto_22350 - BLOCK
      ?auto_22351 - BLOCK
      ?auto_22352 - BLOCK
    )
    :vars
    (
      ?auto_22353 - BLOCK
      ?auto_22354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22353 ?auto_22352 ) ( ON-TABLE ?auto_22349 ) ( ON ?auto_22350 ?auto_22349 ) ( ON ?auto_22351 ?auto_22350 ) ( ON ?auto_22352 ?auto_22351 ) ( not ( = ?auto_22349 ?auto_22350 ) ) ( not ( = ?auto_22349 ?auto_22351 ) ) ( not ( = ?auto_22349 ?auto_22352 ) ) ( not ( = ?auto_22349 ?auto_22353 ) ) ( not ( = ?auto_22350 ?auto_22351 ) ) ( not ( = ?auto_22350 ?auto_22352 ) ) ( not ( = ?auto_22350 ?auto_22353 ) ) ( not ( = ?auto_22351 ?auto_22352 ) ) ( not ( = ?auto_22351 ?auto_22353 ) ) ( not ( = ?auto_22352 ?auto_22353 ) ) ( not ( = ?auto_22349 ?auto_22354 ) ) ( not ( = ?auto_22350 ?auto_22354 ) ) ( not ( = ?auto_22351 ?auto_22354 ) ) ( not ( = ?auto_22352 ?auto_22354 ) ) ( not ( = ?auto_22353 ?auto_22354 ) ) ( ON ?auto_22354 ?auto_22353 ) ( CLEAR ?auto_22354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22349 ?auto_22350 ?auto_22351 ?auto_22352 ?auto_22353 )
      ( MAKE-4PILE ?auto_22349 ?auto_22350 ?auto_22351 ?auto_22352 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22357 - BLOCK
      ?auto_22358 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22358 ) ( CLEAR ?auto_22357 ) ( ON-TABLE ?auto_22357 ) ( not ( = ?auto_22357 ?auto_22358 ) ) )
    :subtasks
    ( ( !STACK ?auto_22358 ?auto_22357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22359 - BLOCK
      ?auto_22360 - BLOCK
    )
    :vars
    (
      ?auto_22361 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22359 ) ( ON-TABLE ?auto_22359 ) ( not ( = ?auto_22359 ?auto_22360 ) ) ( ON ?auto_22360 ?auto_22361 ) ( CLEAR ?auto_22360 ) ( HAND-EMPTY ) ( not ( = ?auto_22359 ?auto_22361 ) ) ( not ( = ?auto_22360 ?auto_22361 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22360 ?auto_22361 )
      ( MAKE-2PILE ?auto_22359 ?auto_22360 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22362 - BLOCK
      ?auto_22363 - BLOCK
    )
    :vars
    (
      ?auto_22364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22362 ?auto_22363 ) ) ( ON ?auto_22363 ?auto_22364 ) ( CLEAR ?auto_22363 ) ( not ( = ?auto_22362 ?auto_22364 ) ) ( not ( = ?auto_22363 ?auto_22364 ) ) ( HOLDING ?auto_22362 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22362 )
      ( MAKE-2PILE ?auto_22362 ?auto_22363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22365 - BLOCK
      ?auto_22366 - BLOCK
    )
    :vars
    (
      ?auto_22367 - BLOCK
      ?auto_22369 - BLOCK
      ?auto_22370 - BLOCK
      ?auto_22368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22365 ?auto_22366 ) ) ( ON ?auto_22366 ?auto_22367 ) ( not ( = ?auto_22365 ?auto_22367 ) ) ( not ( = ?auto_22366 ?auto_22367 ) ) ( ON ?auto_22365 ?auto_22366 ) ( CLEAR ?auto_22365 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22369 ) ( ON ?auto_22370 ?auto_22369 ) ( ON ?auto_22368 ?auto_22370 ) ( ON ?auto_22367 ?auto_22368 ) ( not ( = ?auto_22369 ?auto_22370 ) ) ( not ( = ?auto_22369 ?auto_22368 ) ) ( not ( = ?auto_22369 ?auto_22367 ) ) ( not ( = ?auto_22369 ?auto_22366 ) ) ( not ( = ?auto_22369 ?auto_22365 ) ) ( not ( = ?auto_22370 ?auto_22368 ) ) ( not ( = ?auto_22370 ?auto_22367 ) ) ( not ( = ?auto_22370 ?auto_22366 ) ) ( not ( = ?auto_22370 ?auto_22365 ) ) ( not ( = ?auto_22368 ?auto_22367 ) ) ( not ( = ?auto_22368 ?auto_22366 ) ) ( not ( = ?auto_22368 ?auto_22365 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22369 ?auto_22370 ?auto_22368 ?auto_22367 ?auto_22366 )
      ( MAKE-2PILE ?auto_22365 ?auto_22366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22374 - BLOCK
      ?auto_22375 - BLOCK
      ?auto_22376 - BLOCK
    )
    :vars
    (
      ?auto_22377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22377 ?auto_22376 ) ( CLEAR ?auto_22377 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22374 ) ( ON ?auto_22375 ?auto_22374 ) ( ON ?auto_22376 ?auto_22375 ) ( not ( = ?auto_22374 ?auto_22375 ) ) ( not ( = ?auto_22374 ?auto_22376 ) ) ( not ( = ?auto_22374 ?auto_22377 ) ) ( not ( = ?auto_22375 ?auto_22376 ) ) ( not ( = ?auto_22375 ?auto_22377 ) ) ( not ( = ?auto_22376 ?auto_22377 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22377 ?auto_22376 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22378 - BLOCK
      ?auto_22379 - BLOCK
      ?auto_22380 - BLOCK
    )
    :vars
    (
      ?auto_22381 - BLOCK
      ?auto_22382 - BLOCK
      ?auto_22383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22381 ?auto_22380 ) ( CLEAR ?auto_22381 ) ( ON-TABLE ?auto_22378 ) ( ON ?auto_22379 ?auto_22378 ) ( ON ?auto_22380 ?auto_22379 ) ( not ( = ?auto_22378 ?auto_22379 ) ) ( not ( = ?auto_22378 ?auto_22380 ) ) ( not ( = ?auto_22378 ?auto_22381 ) ) ( not ( = ?auto_22379 ?auto_22380 ) ) ( not ( = ?auto_22379 ?auto_22381 ) ) ( not ( = ?auto_22380 ?auto_22381 ) ) ( HOLDING ?auto_22382 ) ( CLEAR ?auto_22383 ) ( not ( = ?auto_22378 ?auto_22382 ) ) ( not ( = ?auto_22378 ?auto_22383 ) ) ( not ( = ?auto_22379 ?auto_22382 ) ) ( not ( = ?auto_22379 ?auto_22383 ) ) ( not ( = ?auto_22380 ?auto_22382 ) ) ( not ( = ?auto_22380 ?auto_22383 ) ) ( not ( = ?auto_22381 ?auto_22382 ) ) ( not ( = ?auto_22381 ?auto_22383 ) ) ( not ( = ?auto_22382 ?auto_22383 ) ) )
    :subtasks
    ( ( !STACK ?auto_22382 ?auto_22383 )
      ( MAKE-3PILE ?auto_22378 ?auto_22379 ?auto_22380 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22746 - BLOCK
      ?auto_22747 - BLOCK
      ?auto_22748 - BLOCK
    )
    :vars
    (
      ?auto_22749 - BLOCK
      ?auto_22750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22749 ?auto_22748 ) ( ON-TABLE ?auto_22746 ) ( ON ?auto_22747 ?auto_22746 ) ( ON ?auto_22748 ?auto_22747 ) ( not ( = ?auto_22746 ?auto_22747 ) ) ( not ( = ?auto_22746 ?auto_22748 ) ) ( not ( = ?auto_22746 ?auto_22749 ) ) ( not ( = ?auto_22747 ?auto_22748 ) ) ( not ( = ?auto_22747 ?auto_22749 ) ) ( not ( = ?auto_22748 ?auto_22749 ) ) ( not ( = ?auto_22746 ?auto_22750 ) ) ( not ( = ?auto_22747 ?auto_22750 ) ) ( not ( = ?auto_22748 ?auto_22750 ) ) ( not ( = ?auto_22749 ?auto_22750 ) ) ( ON ?auto_22750 ?auto_22749 ) ( CLEAR ?auto_22750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22746 ?auto_22747 ?auto_22748 ?auto_22749 )
      ( MAKE-3PILE ?auto_22746 ?auto_22747 ?auto_22748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22390 - BLOCK
      ?auto_22391 - BLOCK
      ?auto_22392 - BLOCK
    )
    :vars
    (
      ?auto_22395 - BLOCK
      ?auto_22394 - BLOCK
      ?auto_22393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22395 ?auto_22392 ) ( ON-TABLE ?auto_22390 ) ( ON ?auto_22391 ?auto_22390 ) ( ON ?auto_22392 ?auto_22391 ) ( not ( = ?auto_22390 ?auto_22391 ) ) ( not ( = ?auto_22390 ?auto_22392 ) ) ( not ( = ?auto_22390 ?auto_22395 ) ) ( not ( = ?auto_22391 ?auto_22392 ) ) ( not ( = ?auto_22391 ?auto_22395 ) ) ( not ( = ?auto_22392 ?auto_22395 ) ) ( not ( = ?auto_22390 ?auto_22394 ) ) ( not ( = ?auto_22390 ?auto_22393 ) ) ( not ( = ?auto_22391 ?auto_22394 ) ) ( not ( = ?auto_22391 ?auto_22393 ) ) ( not ( = ?auto_22392 ?auto_22394 ) ) ( not ( = ?auto_22392 ?auto_22393 ) ) ( not ( = ?auto_22395 ?auto_22394 ) ) ( not ( = ?auto_22395 ?auto_22393 ) ) ( not ( = ?auto_22394 ?auto_22393 ) ) ( ON ?auto_22394 ?auto_22395 ) ( CLEAR ?auto_22394 ) ( HOLDING ?auto_22393 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22393 )
      ( MAKE-3PILE ?auto_22390 ?auto_22391 ?auto_22392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22396 - BLOCK
      ?auto_22397 - BLOCK
      ?auto_22398 - BLOCK
    )
    :vars
    (
      ?auto_22399 - BLOCK
      ?auto_22400 - BLOCK
      ?auto_22401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22399 ?auto_22398 ) ( ON-TABLE ?auto_22396 ) ( ON ?auto_22397 ?auto_22396 ) ( ON ?auto_22398 ?auto_22397 ) ( not ( = ?auto_22396 ?auto_22397 ) ) ( not ( = ?auto_22396 ?auto_22398 ) ) ( not ( = ?auto_22396 ?auto_22399 ) ) ( not ( = ?auto_22397 ?auto_22398 ) ) ( not ( = ?auto_22397 ?auto_22399 ) ) ( not ( = ?auto_22398 ?auto_22399 ) ) ( not ( = ?auto_22396 ?auto_22400 ) ) ( not ( = ?auto_22396 ?auto_22401 ) ) ( not ( = ?auto_22397 ?auto_22400 ) ) ( not ( = ?auto_22397 ?auto_22401 ) ) ( not ( = ?auto_22398 ?auto_22400 ) ) ( not ( = ?auto_22398 ?auto_22401 ) ) ( not ( = ?auto_22399 ?auto_22400 ) ) ( not ( = ?auto_22399 ?auto_22401 ) ) ( not ( = ?auto_22400 ?auto_22401 ) ) ( ON ?auto_22400 ?auto_22399 ) ( ON ?auto_22401 ?auto_22400 ) ( CLEAR ?auto_22401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22396 ?auto_22397 ?auto_22398 ?auto_22399 ?auto_22400 )
      ( MAKE-3PILE ?auto_22396 ?auto_22397 ?auto_22398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22405 - BLOCK
      ?auto_22406 - BLOCK
      ?auto_22407 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22407 ) ( CLEAR ?auto_22406 ) ( ON-TABLE ?auto_22405 ) ( ON ?auto_22406 ?auto_22405 ) ( not ( = ?auto_22405 ?auto_22406 ) ) ( not ( = ?auto_22405 ?auto_22407 ) ) ( not ( = ?auto_22406 ?auto_22407 ) ) )
    :subtasks
    ( ( !STACK ?auto_22407 ?auto_22406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22408 - BLOCK
      ?auto_22409 - BLOCK
      ?auto_22410 - BLOCK
    )
    :vars
    (
      ?auto_22411 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22409 ) ( ON-TABLE ?auto_22408 ) ( ON ?auto_22409 ?auto_22408 ) ( not ( = ?auto_22408 ?auto_22409 ) ) ( not ( = ?auto_22408 ?auto_22410 ) ) ( not ( = ?auto_22409 ?auto_22410 ) ) ( ON ?auto_22410 ?auto_22411 ) ( CLEAR ?auto_22410 ) ( HAND-EMPTY ) ( not ( = ?auto_22408 ?auto_22411 ) ) ( not ( = ?auto_22409 ?auto_22411 ) ) ( not ( = ?auto_22410 ?auto_22411 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22410 ?auto_22411 )
      ( MAKE-3PILE ?auto_22408 ?auto_22409 ?auto_22410 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22412 - BLOCK
      ?auto_22413 - BLOCK
      ?auto_22414 - BLOCK
    )
    :vars
    (
      ?auto_22415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22412 ) ( not ( = ?auto_22412 ?auto_22413 ) ) ( not ( = ?auto_22412 ?auto_22414 ) ) ( not ( = ?auto_22413 ?auto_22414 ) ) ( ON ?auto_22414 ?auto_22415 ) ( CLEAR ?auto_22414 ) ( not ( = ?auto_22412 ?auto_22415 ) ) ( not ( = ?auto_22413 ?auto_22415 ) ) ( not ( = ?auto_22414 ?auto_22415 ) ) ( HOLDING ?auto_22413 ) ( CLEAR ?auto_22412 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22412 ?auto_22413 )
      ( MAKE-3PILE ?auto_22412 ?auto_22413 ?auto_22414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22416 - BLOCK
      ?auto_22417 - BLOCK
      ?auto_22418 - BLOCK
    )
    :vars
    (
      ?auto_22419 - BLOCK
      ?auto_22421 - BLOCK
      ?auto_22420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22416 ) ( not ( = ?auto_22416 ?auto_22417 ) ) ( not ( = ?auto_22416 ?auto_22418 ) ) ( not ( = ?auto_22417 ?auto_22418 ) ) ( ON ?auto_22418 ?auto_22419 ) ( not ( = ?auto_22416 ?auto_22419 ) ) ( not ( = ?auto_22417 ?auto_22419 ) ) ( not ( = ?auto_22418 ?auto_22419 ) ) ( CLEAR ?auto_22416 ) ( ON ?auto_22417 ?auto_22418 ) ( CLEAR ?auto_22417 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22421 ) ( ON ?auto_22420 ?auto_22421 ) ( ON ?auto_22419 ?auto_22420 ) ( not ( = ?auto_22421 ?auto_22420 ) ) ( not ( = ?auto_22421 ?auto_22419 ) ) ( not ( = ?auto_22421 ?auto_22418 ) ) ( not ( = ?auto_22421 ?auto_22417 ) ) ( not ( = ?auto_22420 ?auto_22419 ) ) ( not ( = ?auto_22420 ?auto_22418 ) ) ( not ( = ?auto_22420 ?auto_22417 ) ) ( not ( = ?auto_22416 ?auto_22421 ) ) ( not ( = ?auto_22416 ?auto_22420 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22421 ?auto_22420 ?auto_22419 ?auto_22418 )
      ( MAKE-3PILE ?auto_22416 ?auto_22417 ?auto_22418 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22422 - BLOCK
      ?auto_22423 - BLOCK
      ?auto_22424 - BLOCK
    )
    :vars
    (
      ?auto_22427 - BLOCK
      ?auto_22426 - BLOCK
      ?auto_22425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22422 ?auto_22423 ) ) ( not ( = ?auto_22422 ?auto_22424 ) ) ( not ( = ?auto_22423 ?auto_22424 ) ) ( ON ?auto_22424 ?auto_22427 ) ( not ( = ?auto_22422 ?auto_22427 ) ) ( not ( = ?auto_22423 ?auto_22427 ) ) ( not ( = ?auto_22424 ?auto_22427 ) ) ( ON ?auto_22423 ?auto_22424 ) ( CLEAR ?auto_22423 ) ( ON-TABLE ?auto_22426 ) ( ON ?auto_22425 ?auto_22426 ) ( ON ?auto_22427 ?auto_22425 ) ( not ( = ?auto_22426 ?auto_22425 ) ) ( not ( = ?auto_22426 ?auto_22427 ) ) ( not ( = ?auto_22426 ?auto_22424 ) ) ( not ( = ?auto_22426 ?auto_22423 ) ) ( not ( = ?auto_22425 ?auto_22427 ) ) ( not ( = ?auto_22425 ?auto_22424 ) ) ( not ( = ?auto_22425 ?auto_22423 ) ) ( not ( = ?auto_22422 ?auto_22426 ) ) ( not ( = ?auto_22422 ?auto_22425 ) ) ( HOLDING ?auto_22422 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22422 )
      ( MAKE-3PILE ?auto_22422 ?auto_22423 ?auto_22424 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22428 - BLOCK
      ?auto_22429 - BLOCK
      ?auto_22430 - BLOCK
    )
    :vars
    (
      ?auto_22433 - BLOCK
      ?auto_22431 - BLOCK
      ?auto_22432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22428 ?auto_22429 ) ) ( not ( = ?auto_22428 ?auto_22430 ) ) ( not ( = ?auto_22429 ?auto_22430 ) ) ( ON ?auto_22430 ?auto_22433 ) ( not ( = ?auto_22428 ?auto_22433 ) ) ( not ( = ?auto_22429 ?auto_22433 ) ) ( not ( = ?auto_22430 ?auto_22433 ) ) ( ON ?auto_22429 ?auto_22430 ) ( ON-TABLE ?auto_22431 ) ( ON ?auto_22432 ?auto_22431 ) ( ON ?auto_22433 ?auto_22432 ) ( not ( = ?auto_22431 ?auto_22432 ) ) ( not ( = ?auto_22431 ?auto_22433 ) ) ( not ( = ?auto_22431 ?auto_22430 ) ) ( not ( = ?auto_22431 ?auto_22429 ) ) ( not ( = ?auto_22432 ?auto_22433 ) ) ( not ( = ?auto_22432 ?auto_22430 ) ) ( not ( = ?auto_22432 ?auto_22429 ) ) ( not ( = ?auto_22428 ?auto_22431 ) ) ( not ( = ?auto_22428 ?auto_22432 ) ) ( ON ?auto_22428 ?auto_22429 ) ( CLEAR ?auto_22428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22431 ?auto_22432 ?auto_22433 ?auto_22430 ?auto_22429 )
      ( MAKE-3PILE ?auto_22428 ?auto_22429 ?auto_22430 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22436 - BLOCK
      ?auto_22437 - BLOCK
    )
    :vars
    (
      ?auto_22438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22438 ?auto_22437 ) ( CLEAR ?auto_22438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22436 ) ( ON ?auto_22437 ?auto_22436 ) ( not ( = ?auto_22436 ?auto_22437 ) ) ( not ( = ?auto_22436 ?auto_22438 ) ) ( not ( = ?auto_22437 ?auto_22438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22438 ?auto_22437 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22439 - BLOCK
      ?auto_22440 - BLOCK
    )
    :vars
    (
      ?auto_22441 - BLOCK
      ?auto_22442 - BLOCK
      ?auto_22443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22441 ?auto_22440 ) ( CLEAR ?auto_22441 ) ( ON-TABLE ?auto_22439 ) ( ON ?auto_22440 ?auto_22439 ) ( not ( = ?auto_22439 ?auto_22440 ) ) ( not ( = ?auto_22439 ?auto_22441 ) ) ( not ( = ?auto_22440 ?auto_22441 ) ) ( HOLDING ?auto_22442 ) ( CLEAR ?auto_22443 ) ( not ( = ?auto_22439 ?auto_22442 ) ) ( not ( = ?auto_22439 ?auto_22443 ) ) ( not ( = ?auto_22440 ?auto_22442 ) ) ( not ( = ?auto_22440 ?auto_22443 ) ) ( not ( = ?auto_22441 ?auto_22442 ) ) ( not ( = ?auto_22441 ?auto_22443 ) ) ( not ( = ?auto_22442 ?auto_22443 ) ) )
    :subtasks
    ( ( !STACK ?auto_22442 ?auto_22443 )
      ( MAKE-2PILE ?auto_22439 ?auto_22440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22444 - BLOCK
      ?auto_22445 - BLOCK
    )
    :vars
    (
      ?auto_22448 - BLOCK
      ?auto_22446 - BLOCK
      ?auto_22447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22448 ?auto_22445 ) ( ON-TABLE ?auto_22444 ) ( ON ?auto_22445 ?auto_22444 ) ( not ( = ?auto_22444 ?auto_22445 ) ) ( not ( = ?auto_22444 ?auto_22448 ) ) ( not ( = ?auto_22445 ?auto_22448 ) ) ( CLEAR ?auto_22446 ) ( not ( = ?auto_22444 ?auto_22447 ) ) ( not ( = ?auto_22444 ?auto_22446 ) ) ( not ( = ?auto_22445 ?auto_22447 ) ) ( not ( = ?auto_22445 ?auto_22446 ) ) ( not ( = ?auto_22448 ?auto_22447 ) ) ( not ( = ?auto_22448 ?auto_22446 ) ) ( not ( = ?auto_22447 ?auto_22446 ) ) ( ON ?auto_22447 ?auto_22448 ) ( CLEAR ?auto_22447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22444 ?auto_22445 ?auto_22448 )
      ( MAKE-2PILE ?auto_22444 ?auto_22445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22449 - BLOCK
      ?auto_22450 - BLOCK
    )
    :vars
    (
      ?auto_22453 - BLOCK
      ?auto_22452 - BLOCK
      ?auto_22451 - BLOCK
      ?auto_22454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22453 ?auto_22450 ) ( ON-TABLE ?auto_22449 ) ( ON ?auto_22450 ?auto_22449 ) ( not ( = ?auto_22449 ?auto_22450 ) ) ( not ( = ?auto_22449 ?auto_22453 ) ) ( not ( = ?auto_22450 ?auto_22453 ) ) ( not ( = ?auto_22449 ?auto_22452 ) ) ( not ( = ?auto_22449 ?auto_22451 ) ) ( not ( = ?auto_22450 ?auto_22452 ) ) ( not ( = ?auto_22450 ?auto_22451 ) ) ( not ( = ?auto_22453 ?auto_22452 ) ) ( not ( = ?auto_22453 ?auto_22451 ) ) ( not ( = ?auto_22452 ?auto_22451 ) ) ( ON ?auto_22452 ?auto_22453 ) ( CLEAR ?auto_22452 ) ( HOLDING ?auto_22451 ) ( CLEAR ?auto_22454 ) ( ON-TABLE ?auto_22454 ) ( not ( = ?auto_22454 ?auto_22451 ) ) ( not ( = ?auto_22449 ?auto_22454 ) ) ( not ( = ?auto_22450 ?auto_22454 ) ) ( not ( = ?auto_22453 ?auto_22454 ) ) ( not ( = ?auto_22452 ?auto_22454 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22454 ?auto_22451 )
      ( MAKE-2PILE ?auto_22449 ?auto_22450 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22873 - BLOCK
      ?auto_22874 - BLOCK
    )
    :vars
    (
      ?auto_22876 - BLOCK
      ?auto_22875 - BLOCK
      ?auto_22877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22876 ?auto_22874 ) ( ON-TABLE ?auto_22873 ) ( ON ?auto_22874 ?auto_22873 ) ( not ( = ?auto_22873 ?auto_22874 ) ) ( not ( = ?auto_22873 ?auto_22876 ) ) ( not ( = ?auto_22874 ?auto_22876 ) ) ( not ( = ?auto_22873 ?auto_22875 ) ) ( not ( = ?auto_22873 ?auto_22877 ) ) ( not ( = ?auto_22874 ?auto_22875 ) ) ( not ( = ?auto_22874 ?auto_22877 ) ) ( not ( = ?auto_22876 ?auto_22875 ) ) ( not ( = ?auto_22876 ?auto_22877 ) ) ( not ( = ?auto_22875 ?auto_22877 ) ) ( ON ?auto_22875 ?auto_22876 ) ( ON ?auto_22877 ?auto_22875 ) ( CLEAR ?auto_22877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22873 ?auto_22874 ?auto_22876 ?auto_22875 )
      ( MAKE-2PILE ?auto_22873 ?auto_22874 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22461 - BLOCK
      ?auto_22462 - BLOCK
    )
    :vars
    (
      ?auto_22463 - BLOCK
      ?auto_22464 - BLOCK
      ?auto_22466 - BLOCK
      ?auto_22465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22463 ?auto_22462 ) ( ON-TABLE ?auto_22461 ) ( ON ?auto_22462 ?auto_22461 ) ( not ( = ?auto_22461 ?auto_22462 ) ) ( not ( = ?auto_22461 ?auto_22463 ) ) ( not ( = ?auto_22462 ?auto_22463 ) ) ( not ( = ?auto_22461 ?auto_22464 ) ) ( not ( = ?auto_22461 ?auto_22466 ) ) ( not ( = ?auto_22462 ?auto_22464 ) ) ( not ( = ?auto_22462 ?auto_22466 ) ) ( not ( = ?auto_22463 ?auto_22464 ) ) ( not ( = ?auto_22463 ?auto_22466 ) ) ( not ( = ?auto_22464 ?auto_22466 ) ) ( ON ?auto_22464 ?auto_22463 ) ( not ( = ?auto_22465 ?auto_22466 ) ) ( not ( = ?auto_22461 ?auto_22465 ) ) ( not ( = ?auto_22462 ?auto_22465 ) ) ( not ( = ?auto_22463 ?auto_22465 ) ) ( not ( = ?auto_22464 ?auto_22465 ) ) ( ON ?auto_22466 ?auto_22464 ) ( CLEAR ?auto_22466 ) ( HOLDING ?auto_22465 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22465 )
      ( MAKE-2PILE ?auto_22461 ?auto_22462 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22467 - BLOCK
      ?auto_22468 - BLOCK
    )
    :vars
    (
      ?auto_22472 - BLOCK
      ?auto_22469 - BLOCK
      ?auto_22471 - BLOCK
      ?auto_22470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22472 ?auto_22468 ) ( ON-TABLE ?auto_22467 ) ( ON ?auto_22468 ?auto_22467 ) ( not ( = ?auto_22467 ?auto_22468 ) ) ( not ( = ?auto_22467 ?auto_22472 ) ) ( not ( = ?auto_22468 ?auto_22472 ) ) ( not ( = ?auto_22467 ?auto_22469 ) ) ( not ( = ?auto_22467 ?auto_22471 ) ) ( not ( = ?auto_22468 ?auto_22469 ) ) ( not ( = ?auto_22468 ?auto_22471 ) ) ( not ( = ?auto_22472 ?auto_22469 ) ) ( not ( = ?auto_22472 ?auto_22471 ) ) ( not ( = ?auto_22469 ?auto_22471 ) ) ( ON ?auto_22469 ?auto_22472 ) ( not ( = ?auto_22470 ?auto_22471 ) ) ( not ( = ?auto_22467 ?auto_22470 ) ) ( not ( = ?auto_22468 ?auto_22470 ) ) ( not ( = ?auto_22472 ?auto_22470 ) ) ( not ( = ?auto_22469 ?auto_22470 ) ) ( ON ?auto_22471 ?auto_22469 ) ( ON ?auto_22470 ?auto_22471 ) ( CLEAR ?auto_22470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22467 ?auto_22468 ?auto_22472 ?auto_22469 ?auto_22471 )
      ( MAKE-2PILE ?auto_22467 ?auto_22468 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22477 - BLOCK
      ?auto_22478 - BLOCK
      ?auto_22479 - BLOCK
      ?auto_22480 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22480 ) ( CLEAR ?auto_22479 ) ( ON-TABLE ?auto_22477 ) ( ON ?auto_22478 ?auto_22477 ) ( ON ?auto_22479 ?auto_22478 ) ( not ( = ?auto_22477 ?auto_22478 ) ) ( not ( = ?auto_22477 ?auto_22479 ) ) ( not ( = ?auto_22477 ?auto_22480 ) ) ( not ( = ?auto_22478 ?auto_22479 ) ) ( not ( = ?auto_22478 ?auto_22480 ) ) ( not ( = ?auto_22479 ?auto_22480 ) ) )
    :subtasks
    ( ( !STACK ?auto_22480 ?auto_22479 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22481 - BLOCK
      ?auto_22482 - BLOCK
      ?auto_22483 - BLOCK
      ?auto_22484 - BLOCK
    )
    :vars
    (
      ?auto_22485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22483 ) ( ON-TABLE ?auto_22481 ) ( ON ?auto_22482 ?auto_22481 ) ( ON ?auto_22483 ?auto_22482 ) ( not ( = ?auto_22481 ?auto_22482 ) ) ( not ( = ?auto_22481 ?auto_22483 ) ) ( not ( = ?auto_22481 ?auto_22484 ) ) ( not ( = ?auto_22482 ?auto_22483 ) ) ( not ( = ?auto_22482 ?auto_22484 ) ) ( not ( = ?auto_22483 ?auto_22484 ) ) ( ON ?auto_22484 ?auto_22485 ) ( CLEAR ?auto_22484 ) ( HAND-EMPTY ) ( not ( = ?auto_22481 ?auto_22485 ) ) ( not ( = ?auto_22482 ?auto_22485 ) ) ( not ( = ?auto_22483 ?auto_22485 ) ) ( not ( = ?auto_22484 ?auto_22485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22484 ?auto_22485 )
      ( MAKE-4PILE ?auto_22481 ?auto_22482 ?auto_22483 ?auto_22484 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22486 - BLOCK
      ?auto_22487 - BLOCK
      ?auto_22488 - BLOCK
      ?auto_22489 - BLOCK
    )
    :vars
    (
      ?auto_22490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22486 ) ( ON ?auto_22487 ?auto_22486 ) ( not ( = ?auto_22486 ?auto_22487 ) ) ( not ( = ?auto_22486 ?auto_22488 ) ) ( not ( = ?auto_22486 ?auto_22489 ) ) ( not ( = ?auto_22487 ?auto_22488 ) ) ( not ( = ?auto_22487 ?auto_22489 ) ) ( not ( = ?auto_22488 ?auto_22489 ) ) ( ON ?auto_22489 ?auto_22490 ) ( CLEAR ?auto_22489 ) ( not ( = ?auto_22486 ?auto_22490 ) ) ( not ( = ?auto_22487 ?auto_22490 ) ) ( not ( = ?auto_22488 ?auto_22490 ) ) ( not ( = ?auto_22489 ?auto_22490 ) ) ( HOLDING ?auto_22488 ) ( CLEAR ?auto_22487 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22486 ?auto_22487 ?auto_22488 )
      ( MAKE-4PILE ?auto_22486 ?auto_22487 ?auto_22488 ?auto_22489 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22491 - BLOCK
      ?auto_22492 - BLOCK
      ?auto_22493 - BLOCK
      ?auto_22494 - BLOCK
    )
    :vars
    (
      ?auto_22495 - BLOCK
      ?auto_22496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22491 ) ( ON ?auto_22492 ?auto_22491 ) ( not ( = ?auto_22491 ?auto_22492 ) ) ( not ( = ?auto_22491 ?auto_22493 ) ) ( not ( = ?auto_22491 ?auto_22494 ) ) ( not ( = ?auto_22492 ?auto_22493 ) ) ( not ( = ?auto_22492 ?auto_22494 ) ) ( not ( = ?auto_22493 ?auto_22494 ) ) ( ON ?auto_22494 ?auto_22495 ) ( not ( = ?auto_22491 ?auto_22495 ) ) ( not ( = ?auto_22492 ?auto_22495 ) ) ( not ( = ?auto_22493 ?auto_22495 ) ) ( not ( = ?auto_22494 ?auto_22495 ) ) ( CLEAR ?auto_22492 ) ( ON ?auto_22493 ?auto_22494 ) ( CLEAR ?auto_22493 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22496 ) ( ON ?auto_22495 ?auto_22496 ) ( not ( = ?auto_22496 ?auto_22495 ) ) ( not ( = ?auto_22496 ?auto_22494 ) ) ( not ( = ?auto_22496 ?auto_22493 ) ) ( not ( = ?auto_22491 ?auto_22496 ) ) ( not ( = ?auto_22492 ?auto_22496 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22496 ?auto_22495 ?auto_22494 )
      ( MAKE-4PILE ?auto_22491 ?auto_22492 ?auto_22493 ?auto_22494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22497 - BLOCK
      ?auto_22498 - BLOCK
      ?auto_22499 - BLOCK
      ?auto_22500 - BLOCK
    )
    :vars
    (
      ?auto_22502 - BLOCK
      ?auto_22501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22497 ) ( not ( = ?auto_22497 ?auto_22498 ) ) ( not ( = ?auto_22497 ?auto_22499 ) ) ( not ( = ?auto_22497 ?auto_22500 ) ) ( not ( = ?auto_22498 ?auto_22499 ) ) ( not ( = ?auto_22498 ?auto_22500 ) ) ( not ( = ?auto_22499 ?auto_22500 ) ) ( ON ?auto_22500 ?auto_22502 ) ( not ( = ?auto_22497 ?auto_22502 ) ) ( not ( = ?auto_22498 ?auto_22502 ) ) ( not ( = ?auto_22499 ?auto_22502 ) ) ( not ( = ?auto_22500 ?auto_22502 ) ) ( ON ?auto_22499 ?auto_22500 ) ( CLEAR ?auto_22499 ) ( ON-TABLE ?auto_22501 ) ( ON ?auto_22502 ?auto_22501 ) ( not ( = ?auto_22501 ?auto_22502 ) ) ( not ( = ?auto_22501 ?auto_22500 ) ) ( not ( = ?auto_22501 ?auto_22499 ) ) ( not ( = ?auto_22497 ?auto_22501 ) ) ( not ( = ?auto_22498 ?auto_22501 ) ) ( HOLDING ?auto_22498 ) ( CLEAR ?auto_22497 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22497 ?auto_22498 )
      ( MAKE-4PILE ?auto_22497 ?auto_22498 ?auto_22499 ?auto_22500 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22503 - BLOCK
      ?auto_22504 - BLOCK
      ?auto_22505 - BLOCK
      ?auto_22506 - BLOCK
    )
    :vars
    (
      ?auto_22507 - BLOCK
      ?auto_22508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22503 ) ( not ( = ?auto_22503 ?auto_22504 ) ) ( not ( = ?auto_22503 ?auto_22505 ) ) ( not ( = ?auto_22503 ?auto_22506 ) ) ( not ( = ?auto_22504 ?auto_22505 ) ) ( not ( = ?auto_22504 ?auto_22506 ) ) ( not ( = ?auto_22505 ?auto_22506 ) ) ( ON ?auto_22506 ?auto_22507 ) ( not ( = ?auto_22503 ?auto_22507 ) ) ( not ( = ?auto_22504 ?auto_22507 ) ) ( not ( = ?auto_22505 ?auto_22507 ) ) ( not ( = ?auto_22506 ?auto_22507 ) ) ( ON ?auto_22505 ?auto_22506 ) ( ON-TABLE ?auto_22508 ) ( ON ?auto_22507 ?auto_22508 ) ( not ( = ?auto_22508 ?auto_22507 ) ) ( not ( = ?auto_22508 ?auto_22506 ) ) ( not ( = ?auto_22508 ?auto_22505 ) ) ( not ( = ?auto_22503 ?auto_22508 ) ) ( not ( = ?auto_22504 ?auto_22508 ) ) ( CLEAR ?auto_22503 ) ( ON ?auto_22504 ?auto_22505 ) ( CLEAR ?auto_22504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22508 ?auto_22507 ?auto_22506 ?auto_22505 )
      ( MAKE-4PILE ?auto_22503 ?auto_22504 ?auto_22505 ?auto_22506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22509 - BLOCK
      ?auto_22510 - BLOCK
      ?auto_22511 - BLOCK
      ?auto_22512 - BLOCK
    )
    :vars
    (
      ?auto_22514 - BLOCK
      ?auto_22513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22509 ?auto_22510 ) ) ( not ( = ?auto_22509 ?auto_22511 ) ) ( not ( = ?auto_22509 ?auto_22512 ) ) ( not ( = ?auto_22510 ?auto_22511 ) ) ( not ( = ?auto_22510 ?auto_22512 ) ) ( not ( = ?auto_22511 ?auto_22512 ) ) ( ON ?auto_22512 ?auto_22514 ) ( not ( = ?auto_22509 ?auto_22514 ) ) ( not ( = ?auto_22510 ?auto_22514 ) ) ( not ( = ?auto_22511 ?auto_22514 ) ) ( not ( = ?auto_22512 ?auto_22514 ) ) ( ON ?auto_22511 ?auto_22512 ) ( ON-TABLE ?auto_22513 ) ( ON ?auto_22514 ?auto_22513 ) ( not ( = ?auto_22513 ?auto_22514 ) ) ( not ( = ?auto_22513 ?auto_22512 ) ) ( not ( = ?auto_22513 ?auto_22511 ) ) ( not ( = ?auto_22509 ?auto_22513 ) ) ( not ( = ?auto_22510 ?auto_22513 ) ) ( ON ?auto_22510 ?auto_22511 ) ( CLEAR ?auto_22510 ) ( HOLDING ?auto_22509 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22509 )
      ( MAKE-4PILE ?auto_22509 ?auto_22510 ?auto_22511 ?auto_22512 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22515 - BLOCK
      ?auto_22516 - BLOCK
      ?auto_22517 - BLOCK
      ?auto_22518 - BLOCK
    )
    :vars
    (
      ?auto_22519 - BLOCK
      ?auto_22520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22515 ?auto_22516 ) ) ( not ( = ?auto_22515 ?auto_22517 ) ) ( not ( = ?auto_22515 ?auto_22518 ) ) ( not ( = ?auto_22516 ?auto_22517 ) ) ( not ( = ?auto_22516 ?auto_22518 ) ) ( not ( = ?auto_22517 ?auto_22518 ) ) ( ON ?auto_22518 ?auto_22519 ) ( not ( = ?auto_22515 ?auto_22519 ) ) ( not ( = ?auto_22516 ?auto_22519 ) ) ( not ( = ?auto_22517 ?auto_22519 ) ) ( not ( = ?auto_22518 ?auto_22519 ) ) ( ON ?auto_22517 ?auto_22518 ) ( ON-TABLE ?auto_22520 ) ( ON ?auto_22519 ?auto_22520 ) ( not ( = ?auto_22520 ?auto_22519 ) ) ( not ( = ?auto_22520 ?auto_22518 ) ) ( not ( = ?auto_22520 ?auto_22517 ) ) ( not ( = ?auto_22515 ?auto_22520 ) ) ( not ( = ?auto_22516 ?auto_22520 ) ) ( ON ?auto_22516 ?auto_22517 ) ( ON ?auto_22515 ?auto_22516 ) ( CLEAR ?auto_22515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22520 ?auto_22519 ?auto_22518 ?auto_22517 ?auto_22516 )
      ( MAKE-4PILE ?auto_22515 ?auto_22516 ?auto_22517 ?auto_22518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22522 - BLOCK
    )
    :vars
    (
      ?auto_22523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22523 ?auto_22522 ) ( CLEAR ?auto_22523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22522 ) ( not ( = ?auto_22522 ?auto_22523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22523 ?auto_22522 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22524 - BLOCK
    )
    :vars
    (
      ?auto_22525 - BLOCK
      ?auto_22526 - BLOCK
      ?auto_22527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22525 ?auto_22524 ) ( CLEAR ?auto_22525 ) ( ON-TABLE ?auto_22524 ) ( not ( = ?auto_22524 ?auto_22525 ) ) ( HOLDING ?auto_22526 ) ( CLEAR ?auto_22527 ) ( not ( = ?auto_22524 ?auto_22526 ) ) ( not ( = ?auto_22524 ?auto_22527 ) ) ( not ( = ?auto_22525 ?auto_22526 ) ) ( not ( = ?auto_22525 ?auto_22527 ) ) ( not ( = ?auto_22526 ?auto_22527 ) ) )
    :subtasks
    ( ( !STACK ?auto_22526 ?auto_22527 )
      ( MAKE-1PILE ?auto_22524 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22528 - BLOCK
    )
    :vars
    (
      ?auto_22529 - BLOCK
      ?auto_22530 - BLOCK
      ?auto_22531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22529 ?auto_22528 ) ( ON-TABLE ?auto_22528 ) ( not ( = ?auto_22528 ?auto_22529 ) ) ( CLEAR ?auto_22530 ) ( not ( = ?auto_22528 ?auto_22531 ) ) ( not ( = ?auto_22528 ?auto_22530 ) ) ( not ( = ?auto_22529 ?auto_22531 ) ) ( not ( = ?auto_22529 ?auto_22530 ) ) ( not ( = ?auto_22531 ?auto_22530 ) ) ( ON ?auto_22531 ?auto_22529 ) ( CLEAR ?auto_22531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22528 ?auto_22529 )
      ( MAKE-1PILE ?auto_22528 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22532 - BLOCK
    )
    :vars
    (
      ?auto_22535 - BLOCK
      ?auto_22533 - BLOCK
      ?auto_22534 - BLOCK
      ?auto_22537 - BLOCK
      ?auto_22536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22535 ?auto_22532 ) ( ON-TABLE ?auto_22532 ) ( not ( = ?auto_22532 ?auto_22535 ) ) ( not ( = ?auto_22532 ?auto_22533 ) ) ( not ( = ?auto_22532 ?auto_22534 ) ) ( not ( = ?auto_22535 ?auto_22533 ) ) ( not ( = ?auto_22535 ?auto_22534 ) ) ( not ( = ?auto_22533 ?auto_22534 ) ) ( ON ?auto_22533 ?auto_22535 ) ( CLEAR ?auto_22533 ) ( HOLDING ?auto_22534 ) ( CLEAR ?auto_22537 ) ( ON-TABLE ?auto_22536 ) ( ON ?auto_22537 ?auto_22536 ) ( not ( = ?auto_22536 ?auto_22537 ) ) ( not ( = ?auto_22536 ?auto_22534 ) ) ( not ( = ?auto_22537 ?auto_22534 ) ) ( not ( = ?auto_22532 ?auto_22537 ) ) ( not ( = ?auto_22532 ?auto_22536 ) ) ( not ( = ?auto_22535 ?auto_22537 ) ) ( not ( = ?auto_22535 ?auto_22536 ) ) ( not ( = ?auto_22533 ?auto_22537 ) ) ( not ( = ?auto_22533 ?auto_22536 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22536 ?auto_22537 ?auto_22534 )
      ( MAKE-1PILE ?auto_22532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22538 - BLOCK
    )
    :vars
    (
      ?auto_22540 - BLOCK
      ?auto_22541 - BLOCK
      ?auto_22543 - BLOCK
      ?auto_22539 - BLOCK
      ?auto_22542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22540 ?auto_22538 ) ( ON-TABLE ?auto_22538 ) ( not ( = ?auto_22538 ?auto_22540 ) ) ( not ( = ?auto_22538 ?auto_22541 ) ) ( not ( = ?auto_22538 ?auto_22543 ) ) ( not ( = ?auto_22540 ?auto_22541 ) ) ( not ( = ?auto_22540 ?auto_22543 ) ) ( not ( = ?auto_22541 ?auto_22543 ) ) ( ON ?auto_22541 ?auto_22540 ) ( CLEAR ?auto_22539 ) ( ON-TABLE ?auto_22542 ) ( ON ?auto_22539 ?auto_22542 ) ( not ( = ?auto_22542 ?auto_22539 ) ) ( not ( = ?auto_22542 ?auto_22543 ) ) ( not ( = ?auto_22539 ?auto_22543 ) ) ( not ( = ?auto_22538 ?auto_22539 ) ) ( not ( = ?auto_22538 ?auto_22542 ) ) ( not ( = ?auto_22540 ?auto_22539 ) ) ( not ( = ?auto_22540 ?auto_22542 ) ) ( not ( = ?auto_22541 ?auto_22539 ) ) ( not ( = ?auto_22541 ?auto_22542 ) ) ( ON ?auto_22543 ?auto_22541 ) ( CLEAR ?auto_22543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22538 ?auto_22540 ?auto_22541 )
      ( MAKE-1PILE ?auto_22538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22544 - BLOCK
    )
    :vars
    (
      ?auto_22546 - BLOCK
      ?auto_22549 - BLOCK
      ?auto_22545 - BLOCK
      ?auto_22548 - BLOCK
      ?auto_22547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22546 ?auto_22544 ) ( ON-TABLE ?auto_22544 ) ( not ( = ?auto_22544 ?auto_22546 ) ) ( not ( = ?auto_22544 ?auto_22549 ) ) ( not ( = ?auto_22544 ?auto_22545 ) ) ( not ( = ?auto_22546 ?auto_22549 ) ) ( not ( = ?auto_22546 ?auto_22545 ) ) ( not ( = ?auto_22549 ?auto_22545 ) ) ( ON ?auto_22549 ?auto_22546 ) ( ON-TABLE ?auto_22548 ) ( not ( = ?auto_22548 ?auto_22547 ) ) ( not ( = ?auto_22548 ?auto_22545 ) ) ( not ( = ?auto_22547 ?auto_22545 ) ) ( not ( = ?auto_22544 ?auto_22547 ) ) ( not ( = ?auto_22544 ?auto_22548 ) ) ( not ( = ?auto_22546 ?auto_22547 ) ) ( not ( = ?auto_22546 ?auto_22548 ) ) ( not ( = ?auto_22549 ?auto_22547 ) ) ( not ( = ?auto_22549 ?auto_22548 ) ) ( ON ?auto_22545 ?auto_22549 ) ( CLEAR ?auto_22545 ) ( HOLDING ?auto_22547 ) ( CLEAR ?auto_22548 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22548 ?auto_22547 )
      ( MAKE-1PILE ?auto_22544 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23013 - BLOCK
    )
    :vars
    (
      ?auto_23016 - BLOCK
      ?auto_23017 - BLOCK
      ?auto_23015 - BLOCK
      ?auto_23014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23016 ?auto_23013 ) ( ON-TABLE ?auto_23013 ) ( not ( = ?auto_23013 ?auto_23016 ) ) ( not ( = ?auto_23013 ?auto_23017 ) ) ( not ( = ?auto_23013 ?auto_23015 ) ) ( not ( = ?auto_23016 ?auto_23017 ) ) ( not ( = ?auto_23016 ?auto_23015 ) ) ( not ( = ?auto_23017 ?auto_23015 ) ) ( ON ?auto_23017 ?auto_23016 ) ( not ( = ?auto_23014 ?auto_23015 ) ) ( not ( = ?auto_23013 ?auto_23014 ) ) ( not ( = ?auto_23016 ?auto_23014 ) ) ( not ( = ?auto_23017 ?auto_23014 ) ) ( ON ?auto_23015 ?auto_23017 ) ( ON ?auto_23014 ?auto_23015 ) ( CLEAR ?auto_23014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23013 ?auto_23016 ?auto_23017 ?auto_23015 )
      ( MAKE-1PILE ?auto_23013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22556 - BLOCK
    )
    :vars
    (
      ?auto_22561 - BLOCK
      ?auto_22560 - BLOCK
      ?auto_22557 - BLOCK
      ?auto_22558 - BLOCK
      ?auto_22559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22561 ?auto_22556 ) ( ON-TABLE ?auto_22556 ) ( not ( = ?auto_22556 ?auto_22561 ) ) ( not ( = ?auto_22556 ?auto_22560 ) ) ( not ( = ?auto_22556 ?auto_22557 ) ) ( not ( = ?auto_22561 ?auto_22560 ) ) ( not ( = ?auto_22561 ?auto_22557 ) ) ( not ( = ?auto_22560 ?auto_22557 ) ) ( ON ?auto_22560 ?auto_22561 ) ( not ( = ?auto_22558 ?auto_22559 ) ) ( not ( = ?auto_22558 ?auto_22557 ) ) ( not ( = ?auto_22559 ?auto_22557 ) ) ( not ( = ?auto_22556 ?auto_22559 ) ) ( not ( = ?auto_22556 ?auto_22558 ) ) ( not ( = ?auto_22561 ?auto_22559 ) ) ( not ( = ?auto_22561 ?auto_22558 ) ) ( not ( = ?auto_22560 ?auto_22559 ) ) ( not ( = ?auto_22560 ?auto_22558 ) ) ( ON ?auto_22557 ?auto_22560 ) ( ON ?auto_22559 ?auto_22557 ) ( CLEAR ?auto_22559 ) ( HOLDING ?auto_22558 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22558 )
      ( MAKE-1PILE ?auto_22556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22562 - BLOCK
    )
    :vars
    (
      ?auto_22565 - BLOCK
      ?auto_22567 - BLOCK
      ?auto_22564 - BLOCK
      ?auto_22563 - BLOCK
      ?auto_22566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22565 ?auto_22562 ) ( ON-TABLE ?auto_22562 ) ( not ( = ?auto_22562 ?auto_22565 ) ) ( not ( = ?auto_22562 ?auto_22567 ) ) ( not ( = ?auto_22562 ?auto_22564 ) ) ( not ( = ?auto_22565 ?auto_22567 ) ) ( not ( = ?auto_22565 ?auto_22564 ) ) ( not ( = ?auto_22567 ?auto_22564 ) ) ( ON ?auto_22567 ?auto_22565 ) ( not ( = ?auto_22563 ?auto_22566 ) ) ( not ( = ?auto_22563 ?auto_22564 ) ) ( not ( = ?auto_22566 ?auto_22564 ) ) ( not ( = ?auto_22562 ?auto_22566 ) ) ( not ( = ?auto_22562 ?auto_22563 ) ) ( not ( = ?auto_22565 ?auto_22566 ) ) ( not ( = ?auto_22565 ?auto_22563 ) ) ( not ( = ?auto_22567 ?auto_22566 ) ) ( not ( = ?auto_22567 ?auto_22563 ) ) ( ON ?auto_22564 ?auto_22567 ) ( ON ?auto_22566 ?auto_22564 ) ( ON ?auto_22563 ?auto_22566 ) ( CLEAR ?auto_22563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22562 ?auto_22565 ?auto_22567 ?auto_22564 ?auto_22566 )
      ( MAKE-1PILE ?auto_22562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22573 - BLOCK
      ?auto_22574 - BLOCK
      ?auto_22575 - BLOCK
      ?auto_22576 - BLOCK
      ?auto_22577 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22577 ) ( CLEAR ?auto_22576 ) ( ON-TABLE ?auto_22573 ) ( ON ?auto_22574 ?auto_22573 ) ( ON ?auto_22575 ?auto_22574 ) ( ON ?auto_22576 ?auto_22575 ) ( not ( = ?auto_22573 ?auto_22574 ) ) ( not ( = ?auto_22573 ?auto_22575 ) ) ( not ( = ?auto_22573 ?auto_22576 ) ) ( not ( = ?auto_22573 ?auto_22577 ) ) ( not ( = ?auto_22574 ?auto_22575 ) ) ( not ( = ?auto_22574 ?auto_22576 ) ) ( not ( = ?auto_22574 ?auto_22577 ) ) ( not ( = ?auto_22575 ?auto_22576 ) ) ( not ( = ?auto_22575 ?auto_22577 ) ) ( not ( = ?auto_22576 ?auto_22577 ) ) )
    :subtasks
    ( ( !STACK ?auto_22577 ?auto_22576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22578 - BLOCK
      ?auto_22579 - BLOCK
      ?auto_22580 - BLOCK
      ?auto_22581 - BLOCK
      ?auto_22582 - BLOCK
    )
    :vars
    (
      ?auto_22583 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22581 ) ( ON-TABLE ?auto_22578 ) ( ON ?auto_22579 ?auto_22578 ) ( ON ?auto_22580 ?auto_22579 ) ( ON ?auto_22581 ?auto_22580 ) ( not ( = ?auto_22578 ?auto_22579 ) ) ( not ( = ?auto_22578 ?auto_22580 ) ) ( not ( = ?auto_22578 ?auto_22581 ) ) ( not ( = ?auto_22578 ?auto_22582 ) ) ( not ( = ?auto_22579 ?auto_22580 ) ) ( not ( = ?auto_22579 ?auto_22581 ) ) ( not ( = ?auto_22579 ?auto_22582 ) ) ( not ( = ?auto_22580 ?auto_22581 ) ) ( not ( = ?auto_22580 ?auto_22582 ) ) ( not ( = ?auto_22581 ?auto_22582 ) ) ( ON ?auto_22582 ?auto_22583 ) ( CLEAR ?auto_22582 ) ( HAND-EMPTY ) ( not ( = ?auto_22578 ?auto_22583 ) ) ( not ( = ?auto_22579 ?auto_22583 ) ) ( not ( = ?auto_22580 ?auto_22583 ) ) ( not ( = ?auto_22581 ?auto_22583 ) ) ( not ( = ?auto_22582 ?auto_22583 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22582 ?auto_22583 )
      ( MAKE-5PILE ?auto_22578 ?auto_22579 ?auto_22580 ?auto_22581 ?auto_22582 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22584 - BLOCK
      ?auto_22585 - BLOCK
      ?auto_22586 - BLOCK
      ?auto_22587 - BLOCK
      ?auto_22588 - BLOCK
    )
    :vars
    (
      ?auto_22589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22584 ) ( ON ?auto_22585 ?auto_22584 ) ( ON ?auto_22586 ?auto_22585 ) ( not ( = ?auto_22584 ?auto_22585 ) ) ( not ( = ?auto_22584 ?auto_22586 ) ) ( not ( = ?auto_22584 ?auto_22587 ) ) ( not ( = ?auto_22584 ?auto_22588 ) ) ( not ( = ?auto_22585 ?auto_22586 ) ) ( not ( = ?auto_22585 ?auto_22587 ) ) ( not ( = ?auto_22585 ?auto_22588 ) ) ( not ( = ?auto_22586 ?auto_22587 ) ) ( not ( = ?auto_22586 ?auto_22588 ) ) ( not ( = ?auto_22587 ?auto_22588 ) ) ( ON ?auto_22588 ?auto_22589 ) ( CLEAR ?auto_22588 ) ( not ( = ?auto_22584 ?auto_22589 ) ) ( not ( = ?auto_22585 ?auto_22589 ) ) ( not ( = ?auto_22586 ?auto_22589 ) ) ( not ( = ?auto_22587 ?auto_22589 ) ) ( not ( = ?auto_22588 ?auto_22589 ) ) ( HOLDING ?auto_22587 ) ( CLEAR ?auto_22586 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22584 ?auto_22585 ?auto_22586 ?auto_22587 )
      ( MAKE-5PILE ?auto_22584 ?auto_22585 ?auto_22586 ?auto_22587 ?auto_22588 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22590 - BLOCK
      ?auto_22591 - BLOCK
      ?auto_22592 - BLOCK
      ?auto_22593 - BLOCK
      ?auto_22594 - BLOCK
    )
    :vars
    (
      ?auto_22595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22590 ) ( ON ?auto_22591 ?auto_22590 ) ( ON ?auto_22592 ?auto_22591 ) ( not ( = ?auto_22590 ?auto_22591 ) ) ( not ( = ?auto_22590 ?auto_22592 ) ) ( not ( = ?auto_22590 ?auto_22593 ) ) ( not ( = ?auto_22590 ?auto_22594 ) ) ( not ( = ?auto_22591 ?auto_22592 ) ) ( not ( = ?auto_22591 ?auto_22593 ) ) ( not ( = ?auto_22591 ?auto_22594 ) ) ( not ( = ?auto_22592 ?auto_22593 ) ) ( not ( = ?auto_22592 ?auto_22594 ) ) ( not ( = ?auto_22593 ?auto_22594 ) ) ( ON ?auto_22594 ?auto_22595 ) ( not ( = ?auto_22590 ?auto_22595 ) ) ( not ( = ?auto_22591 ?auto_22595 ) ) ( not ( = ?auto_22592 ?auto_22595 ) ) ( not ( = ?auto_22593 ?auto_22595 ) ) ( not ( = ?auto_22594 ?auto_22595 ) ) ( CLEAR ?auto_22592 ) ( ON ?auto_22593 ?auto_22594 ) ( CLEAR ?auto_22593 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22595 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22595 ?auto_22594 )
      ( MAKE-5PILE ?auto_22590 ?auto_22591 ?auto_22592 ?auto_22593 ?auto_22594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22596 - BLOCK
      ?auto_22597 - BLOCK
      ?auto_22598 - BLOCK
      ?auto_22599 - BLOCK
      ?auto_22600 - BLOCK
    )
    :vars
    (
      ?auto_22601 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22596 ) ( ON ?auto_22597 ?auto_22596 ) ( not ( = ?auto_22596 ?auto_22597 ) ) ( not ( = ?auto_22596 ?auto_22598 ) ) ( not ( = ?auto_22596 ?auto_22599 ) ) ( not ( = ?auto_22596 ?auto_22600 ) ) ( not ( = ?auto_22597 ?auto_22598 ) ) ( not ( = ?auto_22597 ?auto_22599 ) ) ( not ( = ?auto_22597 ?auto_22600 ) ) ( not ( = ?auto_22598 ?auto_22599 ) ) ( not ( = ?auto_22598 ?auto_22600 ) ) ( not ( = ?auto_22599 ?auto_22600 ) ) ( ON ?auto_22600 ?auto_22601 ) ( not ( = ?auto_22596 ?auto_22601 ) ) ( not ( = ?auto_22597 ?auto_22601 ) ) ( not ( = ?auto_22598 ?auto_22601 ) ) ( not ( = ?auto_22599 ?auto_22601 ) ) ( not ( = ?auto_22600 ?auto_22601 ) ) ( ON ?auto_22599 ?auto_22600 ) ( CLEAR ?auto_22599 ) ( ON-TABLE ?auto_22601 ) ( HOLDING ?auto_22598 ) ( CLEAR ?auto_22597 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22596 ?auto_22597 ?auto_22598 )
      ( MAKE-5PILE ?auto_22596 ?auto_22597 ?auto_22598 ?auto_22599 ?auto_22600 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22602 - BLOCK
      ?auto_22603 - BLOCK
      ?auto_22604 - BLOCK
      ?auto_22605 - BLOCK
      ?auto_22606 - BLOCK
    )
    :vars
    (
      ?auto_22607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22602 ) ( ON ?auto_22603 ?auto_22602 ) ( not ( = ?auto_22602 ?auto_22603 ) ) ( not ( = ?auto_22602 ?auto_22604 ) ) ( not ( = ?auto_22602 ?auto_22605 ) ) ( not ( = ?auto_22602 ?auto_22606 ) ) ( not ( = ?auto_22603 ?auto_22604 ) ) ( not ( = ?auto_22603 ?auto_22605 ) ) ( not ( = ?auto_22603 ?auto_22606 ) ) ( not ( = ?auto_22604 ?auto_22605 ) ) ( not ( = ?auto_22604 ?auto_22606 ) ) ( not ( = ?auto_22605 ?auto_22606 ) ) ( ON ?auto_22606 ?auto_22607 ) ( not ( = ?auto_22602 ?auto_22607 ) ) ( not ( = ?auto_22603 ?auto_22607 ) ) ( not ( = ?auto_22604 ?auto_22607 ) ) ( not ( = ?auto_22605 ?auto_22607 ) ) ( not ( = ?auto_22606 ?auto_22607 ) ) ( ON ?auto_22605 ?auto_22606 ) ( ON-TABLE ?auto_22607 ) ( CLEAR ?auto_22603 ) ( ON ?auto_22604 ?auto_22605 ) ( CLEAR ?auto_22604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22607 ?auto_22606 ?auto_22605 )
      ( MAKE-5PILE ?auto_22602 ?auto_22603 ?auto_22604 ?auto_22605 ?auto_22606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22608 - BLOCK
      ?auto_22609 - BLOCK
      ?auto_22610 - BLOCK
      ?auto_22611 - BLOCK
      ?auto_22612 - BLOCK
    )
    :vars
    (
      ?auto_22613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22608 ) ( not ( = ?auto_22608 ?auto_22609 ) ) ( not ( = ?auto_22608 ?auto_22610 ) ) ( not ( = ?auto_22608 ?auto_22611 ) ) ( not ( = ?auto_22608 ?auto_22612 ) ) ( not ( = ?auto_22609 ?auto_22610 ) ) ( not ( = ?auto_22609 ?auto_22611 ) ) ( not ( = ?auto_22609 ?auto_22612 ) ) ( not ( = ?auto_22610 ?auto_22611 ) ) ( not ( = ?auto_22610 ?auto_22612 ) ) ( not ( = ?auto_22611 ?auto_22612 ) ) ( ON ?auto_22612 ?auto_22613 ) ( not ( = ?auto_22608 ?auto_22613 ) ) ( not ( = ?auto_22609 ?auto_22613 ) ) ( not ( = ?auto_22610 ?auto_22613 ) ) ( not ( = ?auto_22611 ?auto_22613 ) ) ( not ( = ?auto_22612 ?auto_22613 ) ) ( ON ?auto_22611 ?auto_22612 ) ( ON-TABLE ?auto_22613 ) ( ON ?auto_22610 ?auto_22611 ) ( CLEAR ?auto_22610 ) ( HOLDING ?auto_22609 ) ( CLEAR ?auto_22608 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22608 ?auto_22609 )
      ( MAKE-5PILE ?auto_22608 ?auto_22609 ?auto_22610 ?auto_22611 ?auto_22612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22614 - BLOCK
      ?auto_22615 - BLOCK
      ?auto_22616 - BLOCK
      ?auto_22617 - BLOCK
      ?auto_22618 - BLOCK
    )
    :vars
    (
      ?auto_22619 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22614 ) ( not ( = ?auto_22614 ?auto_22615 ) ) ( not ( = ?auto_22614 ?auto_22616 ) ) ( not ( = ?auto_22614 ?auto_22617 ) ) ( not ( = ?auto_22614 ?auto_22618 ) ) ( not ( = ?auto_22615 ?auto_22616 ) ) ( not ( = ?auto_22615 ?auto_22617 ) ) ( not ( = ?auto_22615 ?auto_22618 ) ) ( not ( = ?auto_22616 ?auto_22617 ) ) ( not ( = ?auto_22616 ?auto_22618 ) ) ( not ( = ?auto_22617 ?auto_22618 ) ) ( ON ?auto_22618 ?auto_22619 ) ( not ( = ?auto_22614 ?auto_22619 ) ) ( not ( = ?auto_22615 ?auto_22619 ) ) ( not ( = ?auto_22616 ?auto_22619 ) ) ( not ( = ?auto_22617 ?auto_22619 ) ) ( not ( = ?auto_22618 ?auto_22619 ) ) ( ON ?auto_22617 ?auto_22618 ) ( ON-TABLE ?auto_22619 ) ( ON ?auto_22616 ?auto_22617 ) ( CLEAR ?auto_22614 ) ( ON ?auto_22615 ?auto_22616 ) ( CLEAR ?auto_22615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22619 ?auto_22618 ?auto_22617 ?auto_22616 )
      ( MAKE-5PILE ?auto_22614 ?auto_22615 ?auto_22616 ?auto_22617 ?auto_22618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22620 - BLOCK
      ?auto_22621 - BLOCK
      ?auto_22622 - BLOCK
      ?auto_22623 - BLOCK
      ?auto_22624 - BLOCK
    )
    :vars
    (
      ?auto_22625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22620 ?auto_22621 ) ) ( not ( = ?auto_22620 ?auto_22622 ) ) ( not ( = ?auto_22620 ?auto_22623 ) ) ( not ( = ?auto_22620 ?auto_22624 ) ) ( not ( = ?auto_22621 ?auto_22622 ) ) ( not ( = ?auto_22621 ?auto_22623 ) ) ( not ( = ?auto_22621 ?auto_22624 ) ) ( not ( = ?auto_22622 ?auto_22623 ) ) ( not ( = ?auto_22622 ?auto_22624 ) ) ( not ( = ?auto_22623 ?auto_22624 ) ) ( ON ?auto_22624 ?auto_22625 ) ( not ( = ?auto_22620 ?auto_22625 ) ) ( not ( = ?auto_22621 ?auto_22625 ) ) ( not ( = ?auto_22622 ?auto_22625 ) ) ( not ( = ?auto_22623 ?auto_22625 ) ) ( not ( = ?auto_22624 ?auto_22625 ) ) ( ON ?auto_22623 ?auto_22624 ) ( ON-TABLE ?auto_22625 ) ( ON ?auto_22622 ?auto_22623 ) ( ON ?auto_22621 ?auto_22622 ) ( CLEAR ?auto_22621 ) ( HOLDING ?auto_22620 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22620 )
      ( MAKE-5PILE ?auto_22620 ?auto_22621 ?auto_22622 ?auto_22623 ?auto_22624 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22626 - BLOCK
      ?auto_22627 - BLOCK
      ?auto_22628 - BLOCK
      ?auto_22629 - BLOCK
      ?auto_22630 - BLOCK
    )
    :vars
    (
      ?auto_22631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22626 ?auto_22627 ) ) ( not ( = ?auto_22626 ?auto_22628 ) ) ( not ( = ?auto_22626 ?auto_22629 ) ) ( not ( = ?auto_22626 ?auto_22630 ) ) ( not ( = ?auto_22627 ?auto_22628 ) ) ( not ( = ?auto_22627 ?auto_22629 ) ) ( not ( = ?auto_22627 ?auto_22630 ) ) ( not ( = ?auto_22628 ?auto_22629 ) ) ( not ( = ?auto_22628 ?auto_22630 ) ) ( not ( = ?auto_22629 ?auto_22630 ) ) ( ON ?auto_22630 ?auto_22631 ) ( not ( = ?auto_22626 ?auto_22631 ) ) ( not ( = ?auto_22627 ?auto_22631 ) ) ( not ( = ?auto_22628 ?auto_22631 ) ) ( not ( = ?auto_22629 ?auto_22631 ) ) ( not ( = ?auto_22630 ?auto_22631 ) ) ( ON ?auto_22629 ?auto_22630 ) ( ON-TABLE ?auto_22631 ) ( ON ?auto_22628 ?auto_22629 ) ( ON ?auto_22627 ?auto_22628 ) ( ON ?auto_22626 ?auto_22627 ) ( CLEAR ?auto_22626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22631 ?auto_22630 ?auto_22629 ?auto_22628 ?auto_22627 )
      ( MAKE-5PILE ?auto_22626 ?auto_22627 ?auto_22628 ?auto_22629 ?auto_22630 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22690 - BLOCK
    )
    :vars
    (
      ?auto_22691 - BLOCK
      ?auto_22692 - BLOCK
      ?auto_22693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22690 ?auto_22691 ) ( CLEAR ?auto_22690 ) ( not ( = ?auto_22690 ?auto_22691 ) ) ( HOLDING ?auto_22692 ) ( CLEAR ?auto_22693 ) ( not ( = ?auto_22690 ?auto_22692 ) ) ( not ( = ?auto_22690 ?auto_22693 ) ) ( not ( = ?auto_22691 ?auto_22692 ) ) ( not ( = ?auto_22691 ?auto_22693 ) ) ( not ( = ?auto_22692 ?auto_22693 ) ) )
    :subtasks
    ( ( !STACK ?auto_22692 ?auto_22693 )
      ( MAKE-1PILE ?auto_22690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22694 - BLOCK
    )
    :vars
    (
      ?auto_22696 - BLOCK
      ?auto_22697 - BLOCK
      ?auto_22695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22694 ?auto_22696 ) ( not ( = ?auto_22694 ?auto_22696 ) ) ( CLEAR ?auto_22697 ) ( not ( = ?auto_22694 ?auto_22695 ) ) ( not ( = ?auto_22694 ?auto_22697 ) ) ( not ( = ?auto_22696 ?auto_22695 ) ) ( not ( = ?auto_22696 ?auto_22697 ) ) ( not ( = ?auto_22695 ?auto_22697 ) ) ( ON ?auto_22695 ?auto_22694 ) ( CLEAR ?auto_22695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22696 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22696 ?auto_22694 )
      ( MAKE-1PILE ?auto_22694 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22698 - BLOCK
    )
    :vars
    (
      ?auto_22700 - BLOCK
      ?auto_22699 - BLOCK
      ?auto_22701 - BLOCK
      ?auto_22703 - BLOCK
      ?auto_22702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22698 ?auto_22700 ) ( not ( = ?auto_22698 ?auto_22700 ) ) ( not ( = ?auto_22698 ?auto_22699 ) ) ( not ( = ?auto_22698 ?auto_22701 ) ) ( not ( = ?auto_22700 ?auto_22699 ) ) ( not ( = ?auto_22700 ?auto_22701 ) ) ( not ( = ?auto_22699 ?auto_22701 ) ) ( ON ?auto_22699 ?auto_22698 ) ( CLEAR ?auto_22699 ) ( ON-TABLE ?auto_22700 ) ( HOLDING ?auto_22701 ) ( CLEAR ?auto_22703 ) ( ON-TABLE ?auto_22702 ) ( ON ?auto_22703 ?auto_22702 ) ( not ( = ?auto_22702 ?auto_22703 ) ) ( not ( = ?auto_22702 ?auto_22701 ) ) ( not ( = ?auto_22703 ?auto_22701 ) ) ( not ( = ?auto_22698 ?auto_22703 ) ) ( not ( = ?auto_22698 ?auto_22702 ) ) ( not ( = ?auto_22700 ?auto_22703 ) ) ( not ( = ?auto_22700 ?auto_22702 ) ) ( not ( = ?auto_22699 ?auto_22703 ) ) ( not ( = ?auto_22699 ?auto_22702 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22702 ?auto_22703 ?auto_22701 )
      ( MAKE-1PILE ?auto_22698 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22704 - BLOCK
    )
    :vars
    (
      ?auto_22708 - BLOCK
      ?auto_22706 - BLOCK
      ?auto_22707 - BLOCK
      ?auto_22709 - BLOCK
      ?auto_22705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22704 ?auto_22708 ) ( not ( = ?auto_22704 ?auto_22708 ) ) ( not ( = ?auto_22704 ?auto_22706 ) ) ( not ( = ?auto_22704 ?auto_22707 ) ) ( not ( = ?auto_22708 ?auto_22706 ) ) ( not ( = ?auto_22708 ?auto_22707 ) ) ( not ( = ?auto_22706 ?auto_22707 ) ) ( ON ?auto_22706 ?auto_22704 ) ( ON-TABLE ?auto_22708 ) ( CLEAR ?auto_22709 ) ( ON-TABLE ?auto_22705 ) ( ON ?auto_22709 ?auto_22705 ) ( not ( = ?auto_22705 ?auto_22709 ) ) ( not ( = ?auto_22705 ?auto_22707 ) ) ( not ( = ?auto_22709 ?auto_22707 ) ) ( not ( = ?auto_22704 ?auto_22709 ) ) ( not ( = ?auto_22704 ?auto_22705 ) ) ( not ( = ?auto_22708 ?auto_22709 ) ) ( not ( = ?auto_22708 ?auto_22705 ) ) ( not ( = ?auto_22706 ?auto_22709 ) ) ( not ( = ?auto_22706 ?auto_22705 ) ) ( ON ?auto_22707 ?auto_22706 ) ( CLEAR ?auto_22707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22708 ?auto_22704 ?auto_22706 )
      ( MAKE-1PILE ?auto_22704 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22710 - BLOCK
    )
    :vars
    (
      ?auto_22713 - BLOCK
      ?auto_22711 - BLOCK
      ?auto_22714 - BLOCK
      ?auto_22712 - BLOCK
      ?auto_22715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22710 ?auto_22713 ) ( not ( = ?auto_22710 ?auto_22713 ) ) ( not ( = ?auto_22710 ?auto_22711 ) ) ( not ( = ?auto_22710 ?auto_22714 ) ) ( not ( = ?auto_22713 ?auto_22711 ) ) ( not ( = ?auto_22713 ?auto_22714 ) ) ( not ( = ?auto_22711 ?auto_22714 ) ) ( ON ?auto_22711 ?auto_22710 ) ( ON-TABLE ?auto_22713 ) ( ON-TABLE ?auto_22712 ) ( not ( = ?auto_22712 ?auto_22715 ) ) ( not ( = ?auto_22712 ?auto_22714 ) ) ( not ( = ?auto_22715 ?auto_22714 ) ) ( not ( = ?auto_22710 ?auto_22715 ) ) ( not ( = ?auto_22710 ?auto_22712 ) ) ( not ( = ?auto_22713 ?auto_22715 ) ) ( not ( = ?auto_22713 ?auto_22712 ) ) ( not ( = ?auto_22711 ?auto_22715 ) ) ( not ( = ?auto_22711 ?auto_22712 ) ) ( ON ?auto_22714 ?auto_22711 ) ( CLEAR ?auto_22714 ) ( HOLDING ?auto_22715 ) ( CLEAR ?auto_22712 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22712 ?auto_22715 )
      ( MAKE-1PILE ?auto_22710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22716 - BLOCK
    )
    :vars
    (
      ?auto_22721 - BLOCK
      ?auto_22718 - BLOCK
      ?auto_22719 - BLOCK
      ?auto_22720 - BLOCK
      ?auto_22717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22716 ?auto_22721 ) ( not ( = ?auto_22716 ?auto_22721 ) ) ( not ( = ?auto_22716 ?auto_22718 ) ) ( not ( = ?auto_22716 ?auto_22719 ) ) ( not ( = ?auto_22721 ?auto_22718 ) ) ( not ( = ?auto_22721 ?auto_22719 ) ) ( not ( = ?auto_22718 ?auto_22719 ) ) ( ON ?auto_22718 ?auto_22716 ) ( ON-TABLE ?auto_22721 ) ( ON-TABLE ?auto_22720 ) ( not ( = ?auto_22720 ?auto_22717 ) ) ( not ( = ?auto_22720 ?auto_22719 ) ) ( not ( = ?auto_22717 ?auto_22719 ) ) ( not ( = ?auto_22716 ?auto_22717 ) ) ( not ( = ?auto_22716 ?auto_22720 ) ) ( not ( = ?auto_22721 ?auto_22717 ) ) ( not ( = ?auto_22721 ?auto_22720 ) ) ( not ( = ?auto_22718 ?auto_22717 ) ) ( not ( = ?auto_22718 ?auto_22720 ) ) ( ON ?auto_22719 ?auto_22718 ) ( CLEAR ?auto_22720 ) ( ON ?auto_22717 ?auto_22719 ) ( CLEAR ?auto_22717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22721 ?auto_22716 ?auto_22718 ?auto_22719 )
      ( MAKE-1PILE ?auto_22716 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22722 - BLOCK
    )
    :vars
    (
      ?auto_22727 - BLOCK
      ?auto_22723 - BLOCK
      ?auto_22725 - BLOCK
      ?auto_22724 - BLOCK
      ?auto_22726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22722 ?auto_22727 ) ( not ( = ?auto_22722 ?auto_22727 ) ) ( not ( = ?auto_22722 ?auto_22723 ) ) ( not ( = ?auto_22722 ?auto_22725 ) ) ( not ( = ?auto_22727 ?auto_22723 ) ) ( not ( = ?auto_22727 ?auto_22725 ) ) ( not ( = ?auto_22723 ?auto_22725 ) ) ( ON ?auto_22723 ?auto_22722 ) ( ON-TABLE ?auto_22727 ) ( not ( = ?auto_22724 ?auto_22726 ) ) ( not ( = ?auto_22724 ?auto_22725 ) ) ( not ( = ?auto_22726 ?auto_22725 ) ) ( not ( = ?auto_22722 ?auto_22726 ) ) ( not ( = ?auto_22722 ?auto_22724 ) ) ( not ( = ?auto_22727 ?auto_22726 ) ) ( not ( = ?auto_22727 ?auto_22724 ) ) ( not ( = ?auto_22723 ?auto_22726 ) ) ( not ( = ?auto_22723 ?auto_22724 ) ) ( ON ?auto_22725 ?auto_22723 ) ( ON ?auto_22726 ?auto_22725 ) ( CLEAR ?auto_22726 ) ( HOLDING ?auto_22724 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22724 )
      ( MAKE-1PILE ?auto_22722 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22728 - BLOCK
    )
    :vars
    (
      ?auto_22729 - BLOCK
      ?auto_22732 - BLOCK
      ?auto_22731 - BLOCK
      ?auto_22730 - BLOCK
      ?auto_22733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22728 ?auto_22729 ) ( not ( = ?auto_22728 ?auto_22729 ) ) ( not ( = ?auto_22728 ?auto_22732 ) ) ( not ( = ?auto_22728 ?auto_22731 ) ) ( not ( = ?auto_22729 ?auto_22732 ) ) ( not ( = ?auto_22729 ?auto_22731 ) ) ( not ( = ?auto_22732 ?auto_22731 ) ) ( ON ?auto_22732 ?auto_22728 ) ( ON-TABLE ?auto_22729 ) ( not ( = ?auto_22730 ?auto_22733 ) ) ( not ( = ?auto_22730 ?auto_22731 ) ) ( not ( = ?auto_22733 ?auto_22731 ) ) ( not ( = ?auto_22728 ?auto_22733 ) ) ( not ( = ?auto_22728 ?auto_22730 ) ) ( not ( = ?auto_22729 ?auto_22733 ) ) ( not ( = ?auto_22729 ?auto_22730 ) ) ( not ( = ?auto_22732 ?auto_22733 ) ) ( not ( = ?auto_22732 ?auto_22730 ) ) ( ON ?auto_22731 ?auto_22732 ) ( ON ?auto_22733 ?auto_22731 ) ( ON ?auto_22730 ?auto_22733 ) ( CLEAR ?auto_22730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22729 ?auto_22728 ?auto_22732 ?auto_22731 ?auto_22733 )
      ( MAKE-1PILE ?auto_22728 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22741 - BLOCK
      ?auto_22742 - BLOCK
      ?auto_22743 - BLOCK
    )
    :vars
    (
      ?auto_22744 - BLOCK
      ?auto_22745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22744 ?auto_22743 ) ( CLEAR ?auto_22744 ) ( ON-TABLE ?auto_22741 ) ( ON ?auto_22742 ?auto_22741 ) ( ON ?auto_22743 ?auto_22742 ) ( not ( = ?auto_22741 ?auto_22742 ) ) ( not ( = ?auto_22741 ?auto_22743 ) ) ( not ( = ?auto_22741 ?auto_22744 ) ) ( not ( = ?auto_22742 ?auto_22743 ) ) ( not ( = ?auto_22742 ?auto_22744 ) ) ( not ( = ?auto_22743 ?auto_22744 ) ) ( HOLDING ?auto_22745 ) ( not ( = ?auto_22741 ?auto_22745 ) ) ( not ( = ?auto_22742 ?auto_22745 ) ) ( not ( = ?auto_22743 ?auto_22745 ) ) ( not ( = ?auto_22744 ?auto_22745 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_22745 )
      ( MAKE-3PILE ?auto_22741 ?auto_22742 ?auto_22743 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22794 - BLOCK
      ?auto_22795 - BLOCK
    )
    :vars
    (
      ?auto_22796 - BLOCK
      ?auto_22797 - BLOCK
      ?auto_22798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22794 ?auto_22795 ) ) ( ON ?auto_22795 ?auto_22796 ) ( not ( = ?auto_22794 ?auto_22796 ) ) ( not ( = ?auto_22795 ?auto_22796 ) ) ( ON ?auto_22794 ?auto_22795 ) ( CLEAR ?auto_22794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22797 ) ( ON ?auto_22798 ?auto_22797 ) ( ON ?auto_22796 ?auto_22798 ) ( not ( = ?auto_22797 ?auto_22798 ) ) ( not ( = ?auto_22797 ?auto_22796 ) ) ( not ( = ?auto_22797 ?auto_22795 ) ) ( not ( = ?auto_22797 ?auto_22794 ) ) ( not ( = ?auto_22798 ?auto_22796 ) ) ( not ( = ?auto_22798 ?auto_22795 ) ) ( not ( = ?auto_22798 ?auto_22794 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22797 ?auto_22798 ?auto_22796 ?auto_22795 )
      ( MAKE-2PILE ?auto_22794 ?auto_22795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22801 - BLOCK
      ?auto_22802 - BLOCK
    )
    :vars
    (
      ?auto_22803 - BLOCK
      ?auto_22804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22801 ?auto_22802 ) ) ( ON ?auto_22802 ?auto_22803 ) ( CLEAR ?auto_22802 ) ( not ( = ?auto_22801 ?auto_22803 ) ) ( not ( = ?auto_22802 ?auto_22803 ) ) ( ON ?auto_22801 ?auto_22804 ) ( CLEAR ?auto_22801 ) ( HAND-EMPTY ) ( not ( = ?auto_22801 ?auto_22804 ) ) ( not ( = ?auto_22802 ?auto_22804 ) ) ( not ( = ?auto_22803 ?auto_22804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22801 ?auto_22804 )
      ( MAKE-2PILE ?auto_22801 ?auto_22802 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22805 - BLOCK
      ?auto_22806 - BLOCK
    )
    :vars
    (
      ?auto_22807 - BLOCK
      ?auto_22808 - BLOCK
      ?auto_22810 - BLOCK
      ?auto_22809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22805 ?auto_22806 ) ) ( not ( = ?auto_22805 ?auto_22807 ) ) ( not ( = ?auto_22806 ?auto_22807 ) ) ( ON ?auto_22805 ?auto_22808 ) ( CLEAR ?auto_22805 ) ( not ( = ?auto_22805 ?auto_22808 ) ) ( not ( = ?auto_22806 ?auto_22808 ) ) ( not ( = ?auto_22807 ?auto_22808 ) ) ( HOLDING ?auto_22806 ) ( CLEAR ?auto_22807 ) ( ON-TABLE ?auto_22810 ) ( ON ?auto_22809 ?auto_22810 ) ( ON ?auto_22807 ?auto_22809 ) ( not ( = ?auto_22810 ?auto_22809 ) ) ( not ( = ?auto_22810 ?auto_22807 ) ) ( not ( = ?auto_22810 ?auto_22806 ) ) ( not ( = ?auto_22809 ?auto_22807 ) ) ( not ( = ?auto_22809 ?auto_22806 ) ) ( not ( = ?auto_22805 ?auto_22810 ) ) ( not ( = ?auto_22805 ?auto_22809 ) ) ( not ( = ?auto_22808 ?auto_22810 ) ) ( not ( = ?auto_22808 ?auto_22809 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22810 ?auto_22809 ?auto_22807 ?auto_22806 )
      ( MAKE-2PILE ?auto_22805 ?auto_22806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22811 - BLOCK
      ?auto_22812 - BLOCK
    )
    :vars
    (
      ?auto_22815 - BLOCK
      ?auto_22816 - BLOCK
      ?auto_22814 - BLOCK
      ?auto_22813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22811 ?auto_22812 ) ) ( not ( = ?auto_22811 ?auto_22815 ) ) ( not ( = ?auto_22812 ?auto_22815 ) ) ( ON ?auto_22811 ?auto_22816 ) ( not ( = ?auto_22811 ?auto_22816 ) ) ( not ( = ?auto_22812 ?auto_22816 ) ) ( not ( = ?auto_22815 ?auto_22816 ) ) ( CLEAR ?auto_22815 ) ( ON-TABLE ?auto_22814 ) ( ON ?auto_22813 ?auto_22814 ) ( ON ?auto_22815 ?auto_22813 ) ( not ( = ?auto_22814 ?auto_22813 ) ) ( not ( = ?auto_22814 ?auto_22815 ) ) ( not ( = ?auto_22814 ?auto_22812 ) ) ( not ( = ?auto_22813 ?auto_22815 ) ) ( not ( = ?auto_22813 ?auto_22812 ) ) ( not ( = ?auto_22811 ?auto_22814 ) ) ( not ( = ?auto_22811 ?auto_22813 ) ) ( not ( = ?auto_22816 ?auto_22814 ) ) ( not ( = ?auto_22816 ?auto_22813 ) ) ( ON ?auto_22812 ?auto_22811 ) ( CLEAR ?auto_22812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22816 ?auto_22811 )
      ( MAKE-2PILE ?auto_22811 ?auto_22812 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22817 - BLOCK
      ?auto_22818 - BLOCK
    )
    :vars
    (
      ?auto_22822 - BLOCK
      ?auto_22821 - BLOCK
      ?auto_22819 - BLOCK
      ?auto_22820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22817 ?auto_22818 ) ) ( not ( = ?auto_22817 ?auto_22822 ) ) ( not ( = ?auto_22818 ?auto_22822 ) ) ( ON ?auto_22817 ?auto_22821 ) ( not ( = ?auto_22817 ?auto_22821 ) ) ( not ( = ?auto_22818 ?auto_22821 ) ) ( not ( = ?auto_22822 ?auto_22821 ) ) ( ON-TABLE ?auto_22819 ) ( ON ?auto_22820 ?auto_22819 ) ( not ( = ?auto_22819 ?auto_22820 ) ) ( not ( = ?auto_22819 ?auto_22822 ) ) ( not ( = ?auto_22819 ?auto_22818 ) ) ( not ( = ?auto_22820 ?auto_22822 ) ) ( not ( = ?auto_22820 ?auto_22818 ) ) ( not ( = ?auto_22817 ?auto_22819 ) ) ( not ( = ?auto_22817 ?auto_22820 ) ) ( not ( = ?auto_22821 ?auto_22819 ) ) ( not ( = ?auto_22821 ?auto_22820 ) ) ( ON ?auto_22818 ?auto_22817 ) ( CLEAR ?auto_22818 ) ( ON-TABLE ?auto_22821 ) ( HOLDING ?auto_22822 ) ( CLEAR ?auto_22820 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22819 ?auto_22820 ?auto_22822 )
      ( MAKE-2PILE ?auto_22817 ?auto_22818 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22823 - BLOCK
      ?auto_22824 - BLOCK
    )
    :vars
    (
      ?auto_22828 - BLOCK
      ?auto_22825 - BLOCK
      ?auto_22827 - BLOCK
      ?auto_22826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22823 ?auto_22824 ) ) ( not ( = ?auto_22823 ?auto_22828 ) ) ( not ( = ?auto_22824 ?auto_22828 ) ) ( ON ?auto_22823 ?auto_22825 ) ( not ( = ?auto_22823 ?auto_22825 ) ) ( not ( = ?auto_22824 ?auto_22825 ) ) ( not ( = ?auto_22828 ?auto_22825 ) ) ( ON-TABLE ?auto_22827 ) ( ON ?auto_22826 ?auto_22827 ) ( not ( = ?auto_22827 ?auto_22826 ) ) ( not ( = ?auto_22827 ?auto_22828 ) ) ( not ( = ?auto_22827 ?auto_22824 ) ) ( not ( = ?auto_22826 ?auto_22828 ) ) ( not ( = ?auto_22826 ?auto_22824 ) ) ( not ( = ?auto_22823 ?auto_22827 ) ) ( not ( = ?auto_22823 ?auto_22826 ) ) ( not ( = ?auto_22825 ?auto_22827 ) ) ( not ( = ?auto_22825 ?auto_22826 ) ) ( ON ?auto_22824 ?auto_22823 ) ( ON-TABLE ?auto_22825 ) ( CLEAR ?auto_22826 ) ( ON ?auto_22828 ?auto_22824 ) ( CLEAR ?auto_22828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22825 ?auto_22823 ?auto_22824 )
      ( MAKE-2PILE ?auto_22823 ?auto_22824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22829 - BLOCK
      ?auto_22830 - BLOCK
    )
    :vars
    (
      ?auto_22834 - BLOCK
      ?auto_22833 - BLOCK
      ?auto_22831 - BLOCK
      ?auto_22832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22829 ?auto_22830 ) ) ( not ( = ?auto_22829 ?auto_22834 ) ) ( not ( = ?auto_22830 ?auto_22834 ) ) ( ON ?auto_22829 ?auto_22833 ) ( not ( = ?auto_22829 ?auto_22833 ) ) ( not ( = ?auto_22830 ?auto_22833 ) ) ( not ( = ?auto_22834 ?auto_22833 ) ) ( ON-TABLE ?auto_22831 ) ( not ( = ?auto_22831 ?auto_22832 ) ) ( not ( = ?auto_22831 ?auto_22834 ) ) ( not ( = ?auto_22831 ?auto_22830 ) ) ( not ( = ?auto_22832 ?auto_22834 ) ) ( not ( = ?auto_22832 ?auto_22830 ) ) ( not ( = ?auto_22829 ?auto_22831 ) ) ( not ( = ?auto_22829 ?auto_22832 ) ) ( not ( = ?auto_22833 ?auto_22831 ) ) ( not ( = ?auto_22833 ?auto_22832 ) ) ( ON ?auto_22830 ?auto_22829 ) ( ON-TABLE ?auto_22833 ) ( ON ?auto_22834 ?auto_22830 ) ( CLEAR ?auto_22834 ) ( HOLDING ?auto_22832 ) ( CLEAR ?auto_22831 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22831 ?auto_22832 )
      ( MAKE-2PILE ?auto_22829 ?auto_22830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22835 - BLOCK
      ?auto_22836 - BLOCK
    )
    :vars
    (
      ?auto_22839 - BLOCK
      ?auto_22837 - BLOCK
      ?auto_22838 - BLOCK
      ?auto_22840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22835 ?auto_22836 ) ) ( not ( = ?auto_22835 ?auto_22839 ) ) ( not ( = ?auto_22836 ?auto_22839 ) ) ( ON ?auto_22835 ?auto_22837 ) ( not ( = ?auto_22835 ?auto_22837 ) ) ( not ( = ?auto_22836 ?auto_22837 ) ) ( not ( = ?auto_22839 ?auto_22837 ) ) ( ON-TABLE ?auto_22838 ) ( not ( = ?auto_22838 ?auto_22840 ) ) ( not ( = ?auto_22838 ?auto_22839 ) ) ( not ( = ?auto_22838 ?auto_22836 ) ) ( not ( = ?auto_22840 ?auto_22839 ) ) ( not ( = ?auto_22840 ?auto_22836 ) ) ( not ( = ?auto_22835 ?auto_22838 ) ) ( not ( = ?auto_22835 ?auto_22840 ) ) ( not ( = ?auto_22837 ?auto_22838 ) ) ( not ( = ?auto_22837 ?auto_22840 ) ) ( ON ?auto_22836 ?auto_22835 ) ( ON-TABLE ?auto_22837 ) ( ON ?auto_22839 ?auto_22836 ) ( CLEAR ?auto_22838 ) ( ON ?auto_22840 ?auto_22839 ) ( CLEAR ?auto_22840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22837 ?auto_22835 ?auto_22836 ?auto_22839 )
      ( MAKE-2PILE ?auto_22835 ?auto_22836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22841 - BLOCK
      ?auto_22842 - BLOCK
    )
    :vars
    (
      ?auto_22844 - BLOCK
      ?auto_22846 - BLOCK
      ?auto_22843 - BLOCK
      ?auto_22845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22841 ?auto_22842 ) ) ( not ( = ?auto_22841 ?auto_22844 ) ) ( not ( = ?auto_22842 ?auto_22844 ) ) ( ON ?auto_22841 ?auto_22846 ) ( not ( = ?auto_22841 ?auto_22846 ) ) ( not ( = ?auto_22842 ?auto_22846 ) ) ( not ( = ?auto_22844 ?auto_22846 ) ) ( not ( = ?auto_22843 ?auto_22845 ) ) ( not ( = ?auto_22843 ?auto_22844 ) ) ( not ( = ?auto_22843 ?auto_22842 ) ) ( not ( = ?auto_22845 ?auto_22844 ) ) ( not ( = ?auto_22845 ?auto_22842 ) ) ( not ( = ?auto_22841 ?auto_22843 ) ) ( not ( = ?auto_22841 ?auto_22845 ) ) ( not ( = ?auto_22846 ?auto_22843 ) ) ( not ( = ?auto_22846 ?auto_22845 ) ) ( ON ?auto_22842 ?auto_22841 ) ( ON-TABLE ?auto_22846 ) ( ON ?auto_22844 ?auto_22842 ) ( ON ?auto_22845 ?auto_22844 ) ( CLEAR ?auto_22845 ) ( HOLDING ?auto_22843 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22843 )
      ( MAKE-2PILE ?auto_22841 ?auto_22842 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22847 - BLOCK
      ?auto_22848 - BLOCK
    )
    :vars
    (
      ?auto_22851 - BLOCK
      ?auto_22850 - BLOCK
      ?auto_22849 - BLOCK
      ?auto_22852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22847 ?auto_22848 ) ) ( not ( = ?auto_22847 ?auto_22851 ) ) ( not ( = ?auto_22848 ?auto_22851 ) ) ( ON ?auto_22847 ?auto_22850 ) ( not ( = ?auto_22847 ?auto_22850 ) ) ( not ( = ?auto_22848 ?auto_22850 ) ) ( not ( = ?auto_22851 ?auto_22850 ) ) ( not ( = ?auto_22849 ?auto_22852 ) ) ( not ( = ?auto_22849 ?auto_22851 ) ) ( not ( = ?auto_22849 ?auto_22848 ) ) ( not ( = ?auto_22852 ?auto_22851 ) ) ( not ( = ?auto_22852 ?auto_22848 ) ) ( not ( = ?auto_22847 ?auto_22849 ) ) ( not ( = ?auto_22847 ?auto_22852 ) ) ( not ( = ?auto_22850 ?auto_22849 ) ) ( not ( = ?auto_22850 ?auto_22852 ) ) ( ON ?auto_22848 ?auto_22847 ) ( ON-TABLE ?auto_22850 ) ( ON ?auto_22851 ?auto_22848 ) ( ON ?auto_22852 ?auto_22851 ) ( ON ?auto_22849 ?auto_22852 ) ( CLEAR ?auto_22849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22850 ?auto_22847 ?auto_22848 ?auto_22851 ?auto_22852 )
      ( MAKE-2PILE ?auto_22847 ?auto_22848 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22868 - BLOCK
      ?auto_22869 - BLOCK
    )
    :vars
    (
      ?auto_22870 - BLOCK
      ?auto_22872 - BLOCK
      ?auto_22871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22870 ?auto_22869 ) ( ON-TABLE ?auto_22868 ) ( ON ?auto_22869 ?auto_22868 ) ( not ( = ?auto_22868 ?auto_22869 ) ) ( not ( = ?auto_22868 ?auto_22870 ) ) ( not ( = ?auto_22869 ?auto_22870 ) ) ( not ( = ?auto_22868 ?auto_22872 ) ) ( not ( = ?auto_22868 ?auto_22871 ) ) ( not ( = ?auto_22869 ?auto_22872 ) ) ( not ( = ?auto_22869 ?auto_22871 ) ) ( not ( = ?auto_22870 ?auto_22872 ) ) ( not ( = ?auto_22870 ?auto_22871 ) ) ( not ( = ?auto_22872 ?auto_22871 ) ) ( ON ?auto_22872 ?auto_22870 ) ( CLEAR ?auto_22872 ) ( HOLDING ?auto_22871 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22871 )
      ( MAKE-2PILE ?auto_22868 ?auto_22869 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22915 - BLOCK
      ?auto_22916 - BLOCK
      ?auto_22917 - BLOCK
    )
    :vars
    (
      ?auto_22918 - BLOCK
      ?auto_22919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22915 ) ( not ( = ?auto_22915 ?auto_22916 ) ) ( not ( = ?auto_22915 ?auto_22917 ) ) ( not ( = ?auto_22916 ?auto_22917 ) ) ( ON ?auto_22917 ?auto_22918 ) ( not ( = ?auto_22915 ?auto_22918 ) ) ( not ( = ?auto_22916 ?auto_22918 ) ) ( not ( = ?auto_22917 ?auto_22918 ) ) ( CLEAR ?auto_22915 ) ( ON ?auto_22916 ?auto_22917 ) ( CLEAR ?auto_22916 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22919 ) ( ON ?auto_22918 ?auto_22919 ) ( not ( = ?auto_22919 ?auto_22918 ) ) ( not ( = ?auto_22919 ?auto_22917 ) ) ( not ( = ?auto_22919 ?auto_22916 ) ) ( not ( = ?auto_22915 ?auto_22919 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22919 ?auto_22918 ?auto_22917 )
      ( MAKE-3PILE ?auto_22915 ?auto_22916 ?auto_22917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22920 - BLOCK
      ?auto_22921 - BLOCK
      ?auto_22922 - BLOCK
    )
    :vars
    (
      ?auto_22923 - BLOCK
      ?auto_22924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22920 ?auto_22921 ) ) ( not ( = ?auto_22920 ?auto_22922 ) ) ( not ( = ?auto_22921 ?auto_22922 ) ) ( ON ?auto_22922 ?auto_22923 ) ( not ( = ?auto_22920 ?auto_22923 ) ) ( not ( = ?auto_22921 ?auto_22923 ) ) ( not ( = ?auto_22922 ?auto_22923 ) ) ( ON ?auto_22921 ?auto_22922 ) ( CLEAR ?auto_22921 ) ( ON-TABLE ?auto_22924 ) ( ON ?auto_22923 ?auto_22924 ) ( not ( = ?auto_22924 ?auto_22923 ) ) ( not ( = ?auto_22924 ?auto_22922 ) ) ( not ( = ?auto_22924 ?auto_22921 ) ) ( not ( = ?auto_22920 ?auto_22924 ) ) ( HOLDING ?auto_22920 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22920 )
      ( MAKE-3PILE ?auto_22920 ?auto_22921 ?auto_22922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22925 - BLOCK
      ?auto_22926 - BLOCK
      ?auto_22927 - BLOCK
    )
    :vars
    (
      ?auto_22929 - BLOCK
      ?auto_22928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22925 ?auto_22926 ) ) ( not ( = ?auto_22925 ?auto_22927 ) ) ( not ( = ?auto_22926 ?auto_22927 ) ) ( ON ?auto_22927 ?auto_22929 ) ( not ( = ?auto_22925 ?auto_22929 ) ) ( not ( = ?auto_22926 ?auto_22929 ) ) ( not ( = ?auto_22927 ?auto_22929 ) ) ( ON ?auto_22926 ?auto_22927 ) ( ON-TABLE ?auto_22928 ) ( ON ?auto_22929 ?auto_22928 ) ( not ( = ?auto_22928 ?auto_22929 ) ) ( not ( = ?auto_22928 ?auto_22927 ) ) ( not ( = ?auto_22928 ?auto_22926 ) ) ( not ( = ?auto_22925 ?auto_22928 ) ) ( ON ?auto_22925 ?auto_22926 ) ( CLEAR ?auto_22925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22928 ?auto_22929 ?auto_22927 ?auto_22926 )
      ( MAKE-3PILE ?auto_22925 ?auto_22926 ?auto_22927 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22933 - BLOCK
      ?auto_22934 - BLOCK
      ?auto_22935 - BLOCK
    )
    :vars
    (
      ?auto_22937 - BLOCK
      ?auto_22936 - BLOCK
      ?auto_22938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22933 ?auto_22934 ) ) ( not ( = ?auto_22933 ?auto_22935 ) ) ( not ( = ?auto_22934 ?auto_22935 ) ) ( ON ?auto_22935 ?auto_22937 ) ( not ( = ?auto_22933 ?auto_22937 ) ) ( not ( = ?auto_22934 ?auto_22937 ) ) ( not ( = ?auto_22935 ?auto_22937 ) ) ( ON ?auto_22934 ?auto_22935 ) ( CLEAR ?auto_22934 ) ( ON-TABLE ?auto_22936 ) ( ON ?auto_22937 ?auto_22936 ) ( not ( = ?auto_22936 ?auto_22937 ) ) ( not ( = ?auto_22936 ?auto_22935 ) ) ( not ( = ?auto_22936 ?auto_22934 ) ) ( not ( = ?auto_22933 ?auto_22936 ) ) ( ON ?auto_22933 ?auto_22938 ) ( CLEAR ?auto_22933 ) ( HAND-EMPTY ) ( not ( = ?auto_22933 ?auto_22938 ) ) ( not ( = ?auto_22934 ?auto_22938 ) ) ( not ( = ?auto_22935 ?auto_22938 ) ) ( not ( = ?auto_22937 ?auto_22938 ) ) ( not ( = ?auto_22936 ?auto_22938 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22933 ?auto_22938 )
      ( MAKE-3PILE ?auto_22933 ?auto_22934 ?auto_22935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22939 - BLOCK
      ?auto_22940 - BLOCK
      ?auto_22941 - BLOCK
    )
    :vars
    (
      ?auto_22942 - BLOCK
      ?auto_22943 - BLOCK
      ?auto_22944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22939 ?auto_22940 ) ) ( not ( = ?auto_22939 ?auto_22941 ) ) ( not ( = ?auto_22940 ?auto_22941 ) ) ( ON ?auto_22941 ?auto_22942 ) ( not ( = ?auto_22939 ?auto_22942 ) ) ( not ( = ?auto_22940 ?auto_22942 ) ) ( not ( = ?auto_22941 ?auto_22942 ) ) ( ON-TABLE ?auto_22943 ) ( ON ?auto_22942 ?auto_22943 ) ( not ( = ?auto_22943 ?auto_22942 ) ) ( not ( = ?auto_22943 ?auto_22941 ) ) ( not ( = ?auto_22943 ?auto_22940 ) ) ( not ( = ?auto_22939 ?auto_22943 ) ) ( ON ?auto_22939 ?auto_22944 ) ( CLEAR ?auto_22939 ) ( not ( = ?auto_22939 ?auto_22944 ) ) ( not ( = ?auto_22940 ?auto_22944 ) ) ( not ( = ?auto_22941 ?auto_22944 ) ) ( not ( = ?auto_22942 ?auto_22944 ) ) ( not ( = ?auto_22943 ?auto_22944 ) ) ( HOLDING ?auto_22940 ) ( CLEAR ?auto_22941 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22943 ?auto_22942 ?auto_22941 ?auto_22940 )
      ( MAKE-3PILE ?auto_22939 ?auto_22940 ?auto_22941 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22945 - BLOCK
      ?auto_22946 - BLOCK
      ?auto_22947 - BLOCK
    )
    :vars
    (
      ?auto_22948 - BLOCK
      ?auto_22949 - BLOCK
      ?auto_22950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22945 ?auto_22946 ) ) ( not ( = ?auto_22945 ?auto_22947 ) ) ( not ( = ?auto_22946 ?auto_22947 ) ) ( ON ?auto_22947 ?auto_22948 ) ( not ( = ?auto_22945 ?auto_22948 ) ) ( not ( = ?auto_22946 ?auto_22948 ) ) ( not ( = ?auto_22947 ?auto_22948 ) ) ( ON-TABLE ?auto_22949 ) ( ON ?auto_22948 ?auto_22949 ) ( not ( = ?auto_22949 ?auto_22948 ) ) ( not ( = ?auto_22949 ?auto_22947 ) ) ( not ( = ?auto_22949 ?auto_22946 ) ) ( not ( = ?auto_22945 ?auto_22949 ) ) ( ON ?auto_22945 ?auto_22950 ) ( not ( = ?auto_22945 ?auto_22950 ) ) ( not ( = ?auto_22946 ?auto_22950 ) ) ( not ( = ?auto_22947 ?auto_22950 ) ) ( not ( = ?auto_22948 ?auto_22950 ) ) ( not ( = ?auto_22949 ?auto_22950 ) ) ( CLEAR ?auto_22947 ) ( ON ?auto_22946 ?auto_22945 ) ( CLEAR ?auto_22946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22950 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22950 ?auto_22945 )
      ( MAKE-3PILE ?auto_22945 ?auto_22946 ?auto_22947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22951 - BLOCK
      ?auto_22952 - BLOCK
      ?auto_22953 - BLOCK
    )
    :vars
    (
      ?auto_22954 - BLOCK
      ?auto_22956 - BLOCK
      ?auto_22955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22951 ?auto_22952 ) ) ( not ( = ?auto_22951 ?auto_22953 ) ) ( not ( = ?auto_22952 ?auto_22953 ) ) ( not ( = ?auto_22951 ?auto_22954 ) ) ( not ( = ?auto_22952 ?auto_22954 ) ) ( not ( = ?auto_22953 ?auto_22954 ) ) ( ON-TABLE ?auto_22956 ) ( ON ?auto_22954 ?auto_22956 ) ( not ( = ?auto_22956 ?auto_22954 ) ) ( not ( = ?auto_22956 ?auto_22953 ) ) ( not ( = ?auto_22956 ?auto_22952 ) ) ( not ( = ?auto_22951 ?auto_22956 ) ) ( ON ?auto_22951 ?auto_22955 ) ( not ( = ?auto_22951 ?auto_22955 ) ) ( not ( = ?auto_22952 ?auto_22955 ) ) ( not ( = ?auto_22953 ?auto_22955 ) ) ( not ( = ?auto_22954 ?auto_22955 ) ) ( not ( = ?auto_22956 ?auto_22955 ) ) ( ON ?auto_22952 ?auto_22951 ) ( CLEAR ?auto_22952 ) ( ON-TABLE ?auto_22955 ) ( HOLDING ?auto_22953 ) ( CLEAR ?auto_22954 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22956 ?auto_22954 ?auto_22953 )
      ( MAKE-3PILE ?auto_22951 ?auto_22952 ?auto_22953 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22957 - BLOCK
      ?auto_22958 - BLOCK
      ?auto_22959 - BLOCK
    )
    :vars
    (
      ?auto_22960 - BLOCK
      ?auto_22961 - BLOCK
      ?auto_22962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22957 ?auto_22958 ) ) ( not ( = ?auto_22957 ?auto_22959 ) ) ( not ( = ?auto_22958 ?auto_22959 ) ) ( not ( = ?auto_22957 ?auto_22960 ) ) ( not ( = ?auto_22958 ?auto_22960 ) ) ( not ( = ?auto_22959 ?auto_22960 ) ) ( ON-TABLE ?auto_22961 ) ( ON ?auto_22960 ?auto_22961 ) ( not ( = ?auto_22961 ?auto_22960 ) ) ( not ( = ?auto_22961 ?auto_22959 ) ) ( not ( = ?auto_22961 ?auto_22958 ) ) ( not ( = ?auto_22957 ?auto_22961 ) ) ( ON ?auto_22957 ?auto_22962 ) ( not ( = ?auto_22957 ?auto_22962 ) ) ( not ( = ?auto_22958 ?auto_22962 ) ) ( not ( = ?auto_22959 ?auto_22962 ) ) ( not ( = ?auto_22960 ?auto_22962 ) ) ( not ( = ?auto_22961 ?auto_22962 ) ) ( ON ?auto_22958 ?auto_22957 ) ( ON-TABLE ?auto_22962 ) ( CLEAR ?auto_22960 ) ( ON ?auto_22959 ?auto_22958 ) ( CLEAR ?auto_22959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22962 ?auto_22957 ?auto_22958 )
      ( MAKE-3PILE ?auto_22957 ?auto_22958 ?auto_22959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22963 - BLOCK
      ?auto_22964 - BLOCK
      ?auto_22965 - BLOCK
    )
    :vars
    (
      ?auto_22967 - BLOCK
      ?auto_22968 - BLOCK
      ?auto_22966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22963 ?auto_22964 ) ) ( not ( = ?auto_22963 ?auto_22965 ) ) ( not ( = ?auto_22964 ?auto_22965 ) ) ( not ( = ?auto_22963 ?auto_22967 ) ) ( not ( = ?auto_22964 ?auto_22967 ) ) ( not ( = ?auto_22965 ?auto_22967 ) ) ( ON-TABLE ?auto_22968 ) ( not ( = ?auto_22968 ?auto_22967 ) ) ( not ( = ?auto_22968 ?auto_22965 ) ) ( not ( = ?auto_22968 ?auto_22964 ) ) ( not ( = ?auto_22963 ?auto_22968 ) ) ( ON ?auto_22963 ?auto_22966 ) ( not ( = ?auto_22963 ?auto_22966 ) ) ( not ( = ?auto_22964 ?auto_22966 ) ) ( not ( = ?auto_22965 ?auto_22966 ) ) ( not ( = ?auto_22967 ?auto_22966 ) ) ( not ( = ?auto_22968 ?auto_22966 ) ) ( ON ?auto_22964 ?auto_22963 ) ( ON-TABLE ?auto_22966 ) ( ON ?auto_22965 ?auto_22964 ) ( CLEAR ?auto_22965 ) ( HOLDING ?auto_22967 ) ( CLEAR ?auto_22968 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22968 ?auto_22967 )
      ( MAKE-3PILE ?auto_22963 ?auto_22964 ?auto_22965 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22969 - BLOCK
      ?auto_22970 - BLOCK
      ?auto_22971 - BLOCK
    )
    :vars
    (
      ?auto_22972 - BLOCK
      ?auto_22974 - BLOCK
      ?auto_22973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22969 ?auto_22970 ) ) ( not ( = ?auto_22969 ?auto_22971 ) ) ( not ( = ?auto_22970 ?auto_22971 ) ) ( not ( = ?auto_22969 ?auto_22972 ) ) ( not ( = ?auto_22970 ?auto_22972 ) ) ( not ( = ?auto_22971 ?auto_22972 ) ) ( ON-TABLE ?auto_22974 ) ( not ( = ?auto_22974 ?auto_22972 ) ) ( not ( = ?auto_22974 ?auto_22971 ) ) ( not ( = ?auto_22974 ?auto_22970 ) ) ( not ( = ?auto_22969 ?auto_22974 ) ) ( ON ?auto_22969 ?auto_22973 ) ( not ( = ?auto_22969 ?auto_22973 ) ) ( not ( = ?auto_22970 ?auto_22973 ) ) ( not ( = ?auto_22971 ?auto_22973 ) ) ( not ( = ?auto_22972 ?auto_22973 ) ) ( not ( = ?auto_22974 ?auto_22973 ) ) ( ON ?auto_22970 ?auto_22969 ) ( ON-TABLE ?auto_22973 ) ( ON ?auto_22971 ?auto_22970 ) ( CLEAR ?auto_22974 ) ( ON ?auto_22972 ?auto_22971 ) ( CLEAR ?auto_22972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22973 ?auto_22969 ?auto_22970 ?auto_22971 )
      ( MAKE-3PILE ?auto_22969 ?auto_22970 ?auto_22971 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22975 - BLOCK
      ?auto_22976 - BLOCK
      ?auto_22977 - BLOCK
    )
    :vars
    (
      ?auto_22979 - BLOCK
      ?auto_22978 - BLOCK
      ?auto_22980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22975 ?auto_22976 ) ) ( not ( = ?auto_22975 ?auto_22977 ) ) ( not ( = ?auto_22976 ?auto_22977 ) ) ( not ( = ?auto_22975 ?auto_22979 ) ) ( not ( = ?auto_22976 ?auto_22979 ) ) ( not ( = ?auto_22977 ?auto_22979 ) ) ( not ( = ?auto_22978 ?auto_22979 ) ) ( not ( = ?auto_22978 ?auto_22977 ) ) ( not ( = ?auto_22978 ?auto_22976 ) ) ( not ( = ?auto_22975 ?auto_22978 ) ) ( ON ?auto_22975 ?auto_22980 ) ( not ( = ?auto_22975 ?auto_22980 ) ) ( not ( = ?auto_22976 ?auto_22980 ) ) ( not ( = ?auto_22977 ?auto_22980 ) ) ( not ( = ?auto_22979 ?auto_22980 ) ) ( not ( = ?auto_22978 ?auto_22980 ) ) ( ON ?auto_22976 ?auto_22975 ) ( ON-TABLE ?auto_22980 ) ( ON ?auto_22977 ?auto_22976 ) ( ON ?auto_22979 ?auto_22977 ) ( CLEAR ?auto_22979 ) ( HOLDING ?auto_22978 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22978 )
      ( MAKE-3PILE ?auto_22975 ?auto_22976 ?auto_22977 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22981 - BLOCK
      ?auto_22982 - BLOCK
      ?auto_22983 - BLOCK
    )
    :vars
    (
      ?auto_22984 - BLOCK
      ?auto_22986 - BLOCK
      ?auto_22985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22981 ?auto_22982 ) ) ( not ( = ?auto_22981 ?auto_22983 ) ) ( not ( = ?auto_22982 ?auto_22983 ) ) ( not ( = ?auto_22981 ?auto_22984 ) ) ( not ( = ?auto_22982 ?auto_22984 ) ) ( not ( = ?auto_22983 ?auto_22984 ) ) ( not ( = ?auto_22986 ?auto_22984 ) ) ( not ( = ?auto_22986 ?auto_22983 ) ) ( not ( = ?auto_22986 ?auto_22982 ) ) ( not ( = ?auto_22981 ?auto_22986 ) ) ( ON ?auto_22981 ?auto_22985 ) ( not ( = ?auto_22981 ?auto_22985 ) ) ( not ( = ?auto_22982 ?auto_22985 ) ) ( not ( = ?auto_22983 ?auto_22985 ) ) ( not ( = ?auto_22984 ?auto_22985 ) ) ( not ( = ?auto_22986 ?auto_22985 ) ) ( ON ?auto_22982 ?auto_22981 ) ( ON-TABLE ?auto_22985 ) ( ON ?auto_22983 ?auto_22982 ) ( ON ?auto_22984 ?auto_22983 ) ( ON ?auto_22986 ?auto_22984 ) ( CLEAR ?auto_22986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22985 ?auto_22981 ?auto_22982 ?auto_22983 ?auto_22984 )
      ( MAKE-3PILE ?auto_22981 ?auto_22982 ?auto_22983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22998 - BLOCK
    )
    :vars
    (
      ?auto_23001 - BLOCK
      ?auto_23000 - BLOCK
      ?auto_22999 - BLOCK
      ?auto_23002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23001 ?auto_22998 ) ( ON-TABLE ?auto_22998 ) ( not ( = ?auto_22998 ?auto_23001 ) ) ( not ( = ?auto_22998 ?auto_23000 ) ) ( not ( = ?auto_22998 ?auto_22999 ) ) ( not ( = ?auto_23001 ?auto_23000 ) ) ( not ( = ?auto_23001 ?auto_22999 ) ) ( not ( = ?auto_23000 ?auto_22999 ) ) ( ON ?auto_23000 ?auto_23001 ) ( CLEAR ?auto_23000 ) ( HOLDING ?auto_22999 ) ( CLEAR ?auto_23002 ) ( ON-TABLE ?auto_23002 ) ( not ( = ?auto_23002 ?auto_22999 ) ) ( not ( = ?auto_22998 ?auto_23002 ) ) ( not ( = ?auto_23001 ?auto_23002 ) ) ( not ( = ?auto_23000 ?auto_23002 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23002 ?auto_22999 )
      ( MAKE-1PILE ?auto_22998 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23003 - BLOCK
    )
    :vars
    (
      ?auto_23007 - BLOCK
      ?auto_23005 - BLOCK
      ?auto_23006 - BLOCK
      ?auto_23004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23007 ?auto_23003 ) ( ON-TABLE ?auto_23003 ) ( not ( = ?auto_23003 ?auto_23007 ) ) ( not ( = ?auto_23003 ?auto_23005 ) ) ( not ( = ?auto_23003 ?auto_23006 ) ) ( not ( = ?auto_23007 ?auto_23005 ) ) ( not ( = ?auto_23007 ?auto_23006 ) ) ( not ( = ?auto_23005 ?auto_23006 ) ) ( ON ?auto_23005 ?auto_23007 ) ( CLEAR ?auto_23004 ) ( ON-TABLE ?auto_23004 ) ( not ( = ?auto_23004 ?auto_23006 ) ) ( not ( = ?auto_23003 ?auto_23004 ) ) ( not ( = ?auto_23007 ?auto_23004 ) ) ( not ( = ?auto_23005 ?auto_23004 ) ) ( ON ?auto_23006 ?auto_23005 ) ( CLEAR ?auto_23006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23003 ?auto_23007 ?auto_23005 )
      ( MAKE-1PILE ?auto_23003 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23008 - BLOCK
    )
    :vars
    (
      ?auto_23009 - BLOCK
      ?auto_23012 - BLOCK
      ?auto_23011 - BLOCK
      ?auto_23010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23009 ?auto_23008 ) ( ON-TABLE ?auto_23008 ) ( not ( = ?auto_23008 ?auto_23009 ) ) ( not ( = ?auto_23008 ?auto_23012 ) ) ( not ( = ?auto_23008 ?auto_23011 ) ) ( not ( = ?auto_23009 ?auto_23012 ) ) ( not ( = ?auto_23009 ?auto_23011 ) ) ( not ( = ?auto_23012 ?auto_23011 ) ) ( ON ?auto_23012 ?auto_23009 ) ( not ( = ?auto_23010 ?auto_23011 ) ) ( not ( = ?auto_23008 ?auto_23010 ) ) ( not ( = ?auto_23009 ?auto_23010 ) ) ( not ( = ?auto_23012 ?auto_23010 ) ) ( ON ?auto_23011 ?auto_23012 ) ( CLEAR ?auto_23011 ) ( HOLDING ?auto_23010 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23010 )
      ( MAKE-1PILE ?auto_23008 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23019 - BLOCK
    )
    :vars
    (
      ?auto_23022 - BLOCK
      ?auto_23023 - BLOCK
      ?auto_23020 - BLOCK
      ?auto_23021 - BLOCK
      ?auto_23024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23022 ?auto_23019 ) ( ON-TABLE ?auto_23019 ) ( not ( = ?auto_23019 ?auto_23022 ) ) ( not ( = ?auto_23019 ?auto_23023 ) ) ( not ( = ?auto_23019 ?auto_23020 ) ) ( not ( = ?auto_23022 ?auto_23023 ) ) ( not ( = ?auto_23022 ?auto_23020 ) ) ( not ( = ?auto_23023 ?auto_23020 ) ) ( ON ?auto_23023 ?auto_23022 ) ( not ( = ?auto_23021 ?auto_23020 ) ) ( not ( = ?auto_23019 ?auto_23021 ) ) ( not ( = ?auto_23022 ?auto_23021 ) ) ( not ( = ?auto_23023 ?auto_23021 ) ) ( ON ?auto_23020 ?auto_23023 ) ( CLEAR ?auto_23020 ) ( ON ?auto_23021 ?auto_23024 ) ( CLEAR ?auto_23021 ) ( HAND-EMPTY ) ( not ( = ?auto_23019 ?auto_23024 ) ) ( not ( = ?auto_23022 ?auto_23024 ) ) ( not ( = ?auto_23023 ?auto_23024 ) ) ( not ( = ?auto_23020 ?auto_23024 ) ) ( not ( = ?auto_23021 ?auto_23024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23021 ?auto_23024 )
      ( MAKE-1PILE ?auto_23019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23025 - BLOCK
    )
    :vars
    (
      ?auto_23029 - BLOCK
      ?auto_23027 - BLOCK
      ?auto_23026 - BLOCK
      ?auto_23028 - BLOCK
      ?auto_23030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23029 ?auto_23025 ) ( ON-TABLE ?auto_23025 ) ( not ( = ?auto_23025 ?auto_23029 ) ) ( not ( = ?auto_23025 ?auto_23027 ) ) ( not ( = ?auto_23025 ?auto_23026 ) ) ( not ( = ?auto_23029 ?auto_23027 ) ) ( not ( = ?auto_23029 ?auto_23026 ) ) ( not ( = ?auto_23027 ?auto_23026 ) ) ( ON ?auto_23027 ?auto_23029 ) ( not ( = ?auto_23028 ?auto_23026 ) ) ( not ( = ?auto_23025 ?auto_23028 ) ) ( not ( = ?auto_23029 ?auto_23028 ) ) ( not ( = ?auto_23027 ?auto_23028 ) ) ( ON ?auto_23028 ?auto_23030 ) ( CLEAR ?auto_23028 ) ( not ( = ?auto_23025 ?auto_23030 ) ) ( not ( = ?auto_23029 ?auto_23030 ) ) ( not ( = ?auto_23027 ?auto_23030 ) ) ( not ( = ?auto_23026 ?auto_23030 ) ) ( not ( = ?auto_23028 ?auto_23030 ) ) ( HOLDING ?auto_23026 ) ( CLEAR ?auto_23027 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23025 ?auto_23029 ?auto_23027 ?auto_23026 )
      ( MAKE-1PILE ?auto_23025 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23059 - BLOCK
      ?auto_23060 - BLOCK
      ?auto_23061 - BLOCK
      ?auto_23062 - BLOCK
    )
    :vars
    (
      ?auto_23063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23059 ) ( ON ?auto_23060 ?auto_23059 ) ( not ( = ?auto_23059 ?auto_23060 ) ) ( not ( = ?auto_23059 ?auto_23061 ) ) ( not ( = ?auto_23059 ?auto_23062 ) ) ( not ( = ?auto_23060 ?auto_23061 ) ) ( not ( = ?auto_23060 ?auto_23062 ) ) ( not ( = ?auto_23061 ?auto_23062 ) ) ( ON ?auto_23062 ?auto_23063 ) ( not ( = ?auto_23059 ?auto_23063 ) ) ( not ( = ?auto_23060 ?auto_23063 ) ) ( not ( = ?auto_23061 ?auto_23063 ) ) ( not ( = ?auto_23062 ?auto_23063 ) ) ( CLEAR ?auto_23060 ) ( ON ?auto_23061 ?auto_23062 ) ( CLEAR ?auto_23061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23063 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23063 ?auto_23062 )
      ( MAKE-4PILE ?auto_23059 ?auto_23060 ?auto_23061 ?auto_23062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23064 - BLOCK
      ?auto_23065 - BLOCK
      ?auto_23066 - BLOCK
      ?auto_23067 - BLOCK
    )
    :vars
    (
      ?auto_23068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23064 ) ( not ( = ?auto_23064 ?auto_23065 ) ) ( not ( = ?auto_23064 ?auto_23066 ) ) ( not ( = ?auto_23064 ?auto_23067 ) ) ( not ( = ?auto_23065 ?auto_23066 ) ) ( not ( = ?auto_23065 ?auto_23067 ) ) ( not ( = ?auto_23066 ?auto_23067 ) ) ( ON ?auto_23067 ?auto_23068 ) ( not ( = ?auto_23064 ?auto_23068 ) ) ( not ( = ?auto_23065 ?auto_23068 ) ) ( not ( = ?auto_23066 ?auto_23068 ) ) ( not ( = ?auto_23067 ?auto_23068 ) ) ( ON ?auto_23066 ?auto_23067 ) ( CLEAR ?auto_23066 ) ( ON-TABLE ?auto_23068 ) ( HOLDING ?auto_23065 ) ( CLEAR ?auto_23064 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23064 ?auto_23065 )
      ( MAKE-4PILE ?auto_23064 ?auto_23065 ?auto_23066 ?auto_23067 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23069 - BLOCK
      ?auto_23070 - BLOCK
      ?auto_23071 - BLOCK
      ?auto_23072 - BLOCK
    )
    :vars
    (
      ?auto_23073 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23069 ) ( not ( = ?auto_23069 ?auto_23070 ) ) ( not ( = ?auto_23069 ?auto_23071 ) ) ( not ( = ?auto_23069 ?auto_23072 ) ) ( not ( = ?auto_23070 ?auto_23071 ) ) ( not ( = ?auto_23070 ?auto_23072 ) ) ( not ( = ?auto_23071 ?auto_23072 ) ) ( ON ?auto_23072 ?auto_23073 ) ( not ( = ?auto_23069 ?auto_23073 ) ) ( not ( = ?auto_23070 ?auto_23073 ) ) ( not ( = ?auto_23071 ?auto_23073 ) ) ( not ( = ?auto_23072 ?auto_23073 ) ) ( ON ?auto_23071 ?auto_23072 ) ( ON-TABLE ?auto_23073 ) ( CLEAR ?auto_23069 ) ( ON ?auto_23070 ?auto_23071 ) ( CLEAR ?auto_23070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23073 ?auto_23072 ?auto_23071 )
      ( MAKE-4PILE ?auto_23069 ?auto_23070 ?auto_23071 ?auto_23072 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23074 - BLOCK
      ?auto_23075 - BLOCK
      ?auto_23076 - BLOCK
      ?auto_23077 - BLOCK
    )
    :vars
    (
      ?auto_23078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23074 ?auto_23075 ) ) ( not ( = ?auto_23074 ?auto_23076 ) ) ( not ( = ?auto_23074 ?auto_23077 ) ) ( not ( = ?auto_23075 ?auto_23076 ) ) ( not ( = ?auto_23075 ?auto_23077 ) ) ( not ( = ?auto_23076 ?auto_23077 ) ) ( ON ?auto_23077 ?auto_23078 ) ( not ( = ?auto_23074 ?auto_23078 ) ) ( not ( = ?auto_23075 ?auto_23078 ) ) ( not ( = ?auto_23076 ?auto_23078 ) ) ( not ( = ?auto_23077 ?auto_23078 ) ) ( ON ?auto_23076 ?auto_23077 ) ( ON-TABLE ?auto_23078 ) ( ON ?auto_23075 ?auto_23076 ) ( CLEAR ?auto_23075 ) ( HOLDING ?auto_23074 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23074 )
      ( MAKE-4PILE ?auto_23074 ?auto_23075 ?auto_23076 ?auto_23077 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23079 - BLOCK
      ?auto_23080 - BLOCK
      ?auto_23081 - BLOCK
      ?auto_23082 - BLOCK
    )
    :vars
    (
      ?auto_23083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23079 ?auto_23080 ) ) ( not ( = ?auto_23079 ?auto_23081 ) ) ( not ( = ?auto_23079 ?auto_23082 ) ) ( not ( = ?auto_23080 ?auto_23081 ) ) ( not ( = ?auto_23080 ?auto_23082 ) ) ( not ( = ?auto_23081 ?auto_23082 ) ) ( ON ?auto_23082 ?auto_23083 ) ( not ( = ?auto_23079 ?auto_23083 ) ) ( not ( = ?auto_23080 ?auto_23083 ) ) ( not ( = ?auto_23081 ?auto_23083 ) ) ( not ( = ?auto_23082 ?auto_23083 ) ) ( ON ?auto_23081 ?auto_23082 ) ( ON-TABLE ?auto_23083 ) ( ON ?auto_23080 ?auto_23081 ) ( ON ?auto_23079 ?auto_23080 ) ( CLEAR ?auto_23079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23083 ?auto_23082 ?auto_23081 ?auto_23080 )
      ( MAKE-4PILE ?auto_23079 ?auto_23080 ?auto_23081 ?auto_23082 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23088 - BLOCK
      ?auto_23089 - BLOCK
      ?auto_23090 - BLOCK
      ?auto_23091 - BLOCK
    )
    :vars
    (
      ?auto_23092 - BLOCK
      ?auto_23093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23088 ?auto_23089 ) ) ( not ( = ?auto_23088 ?auto_23090 ) ) ( not ( = ?auto_23088 ?auto_23091 ) ) ( not ( = ?auto_23089 ?auto_23090 ) ) ( not ( = ?auto_23089 ?auto_23091 ) ) ( not ( = ?auto_23090 ?auto_23091 ) ) ( ON ?auto_23091 ?auto_23092 ) ( not ( = ?auto_23088 ?auto_23092 ) ) ( not ( = ?auto_23089 ?auto_23092 ) ) ( not ( = ?auto_23090 ?auto_23092 ) ) ( not ( = ?auto_23091 ?auto_23092 ) ) ( ON ?auto_23090 ?auto_23091 ) ( ON-TABLE ?auto_23092 ) ( ON ?auto_23089 ?auto_23090 ) ( CLEAR ?auto_23089 ) ( ON ?auto_23088 ?auto_23093 ) ( CLEAR ?auto_23088 ) ( HAND-EMPTY ) ( not ( = ?auto_23088 ?auto_23093 ) ) ( not ( = ?auto_23089 ?auto_23093 ) ) ( not ( = ?auto_23090 ?auto_23093 ) ) ( not ( = ?auto_23091 ?auto_23093 ) ) ( not ( = ?auto_23092 ?auto_23093 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23088 ?auto_23093 )
      ( MAKE-4PILE ?auto_23088 ?auto_23089 ?auto_23090 ?auto_23091 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23094 - BLOCK
      ?auto_23095 - BLOCK
      ?auto_23096 - BLOCK
      ?auto_23097 - BLOCK
    )
    :vars
    (
      ?auto_23098 - BLOCK
      ?auto_23099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23094 ?auto_23095 ) ) ( not ( = ?auto_23094 ?auto_23096 ) ) ( not ( = ?auto_23094 ?auto_23097 ) ) ( not ( = ?auto_23095 ?auto_23096 ) ) ( not ( = ?auto_23095 ?auto_23097 ) ) ( not ( = ?auto_23096 ?auto_23097 ) ) ( ON ?auto_23097 ?auto_23098 ) ( not ( = ?auto_23094 ?auto_23098 ) ) ( not ( = ?auto_23095 ?auto_23098 ) ) ( not ( = ?auto_23096 ?auto_23098 ) ) ( not ( = ?auto_23097 ?auto_23098 ) ) ( ON ?auto_23096 ?auto_23097 ) ( ON-TABLE ?auto_23098 ) ( ON ?auto_23094 ?auto_23099 ) ( CLEAR ?auto_23094 ) ( not ( = ?auto_23094 ?auto_23099 ) ) ( not ( = ?auto_23095 ?auto_23099 ) ) ( not ( = ?auto_23096 ?auto_23099 ) ) ( not ( = ?auto_23097 ?auto_23099 ) ) ( not ( = ?auto_23098 ?auto_23099 ) ) ( HOLDING ?auto_23095 ) ( CLEAR ?auto_23096 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23098 ?auto_23097 ?auto_23096 ?auto_23095 )
      ( MAKE-4PILE ?auto_23094 ?auto_23095 ?auto_23096 ?auto_23097 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23100 - BLOCK
      ?auto_23101 - BLOCK
      ?auto_23102 - BLOCK
      ?auto_23103 - BLOCK
    )
    :vars
    (
      ?auto_23105 - BLOCK
      ?auto_23104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23100 ?auto_23101 ) ) ( not ( = ?auto_23100 ?auto_23102 ) ) ( not ( = ?auto_23100 ?auto_23103 ) ) ( not ( = ?auto_23101 ?auto_23102 ) ) ( not ( = ?auto_23101 ?auto_23103 ) ) ( not ( = ?auto_23102 ?auto_23103 ) ) ( ON ?auto_23103 ?auto_23105 ) ( not ( = ?auto_23100 ?auto_23105 ) ) ( not ( = ?auto_23101 ?auto_23105 ) ) ( not ( = ?auto_23102 ?auto_23105 ) ) ( not ( = ?auto_23103 ?auto_23105 ) ) ( ON ?auto_23102 ?auto_23103 ) ( ON-TABLE ?auto_23105 ) ( ON ?auto_23100 ?auto_23104 ) ( not ( = ?auto_23100 ?auto_23104 ) ) ( not ( = ?auto_23101 ?auto_23104 ) ) ( not ( = ?auto_23102 ?auto_23104 ) ) ( not ( = ?auto_23103 ?auto_23104 ) ) ( not ( = ?auto_23105 ?auto_23104 ) ) ( CLEAR ?auto_23102 ) ( ON ?auto_23101 ?auto_23100 ) ( CLEAR ?auto_23101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23104 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23104 ?auto_23100 )
      ( MAKE-4PILE ?auto_23100 ?auto_23101 ?auto_23102 ?auto_23103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23106 - BLOCK
      ?auto_23107 - BLOCK
      ?auto_23108 - BLOCK
      ?auto_23109 - BLOCK
    )
    :vars
    (
      ?auto_23111 - BLOCK
      ?auto_23110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23106 ?auto_23107 ) ) ( not ( = ?auto_23106 ?auto_23108 ) ) ( not ( = ?auto_23106 ?auto_23109 ) ) ( not ( = ?auto_23107 ?auto_23108 ) ) ( not ( = ?auto_23107 ?auto_23109 ) ) ( not ( = ?auto_23108 ?auto_23109 ) ) ( ON ?auto_23109 ?auto_23111 ) ( not ( = ?auto_23106 ?auto_23111 ) ) ( not ( = ?auto_23107 ?auto_23111 ) ) ( not ( = ?auto_23108 ?auto_23111 ) ) ( not ( = ?auto_23109 ?auto_23111 ) ) ( ON-TABLE ?auto_23111 ) ( ON ?auto_23106 ?auto_23110 ) ( not ( = ?auto_23106 ?auto_23110 ) ) ( not ( = ?auto_23107 ?auto_23110 ) ) ( not ( = ?auto_23108 ?auto_23110 ) ) ( not ( = ?auto_23109 ?auto_23110 ) ) ( not ( = ?auto_23111 ?auto_23110 ) ) ( ON ?auto_23107 ?auto_23106 ) ( CLEAR ?auto_23107 ) ( ON-TABLE ?auto_23110 ) ( HOLDING ?auto_23108 ) ( CLEAR ?auto_23109 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23111 ?auto_23109 ?auto_23108 )
      ( MAKE-4PILE ?auto_23106 ?auto_23107 ?auto_23108 ?auto_23109 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23112 - BLOCK
      ?auto_23113 - BLOCK
      ?auto_23114 - BLOCK
      ?auto_23115 - BLOCK
    )
    :vars
    (
      ?auto_23116 - BLOCK
      ?auto_23117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23112 ?auto_23113 ) ) ( not ( = ?auto_23112 ?auto_23114 ) ) ( not ( = ?auto_23112 ?auto_23115 ) ) ( not ( = ?auto_23113 ?auto_23114 ) ) ( not ( = ?auto_23113 ?auto_23115 ) ) ( not ( = ?auto_23114 ?auto_23115 ) ) ( ON ?auto_23115 ?auto_23116 ) ( not ( = ?auto_23112 ?auto_23116 ) ) ( not ( = ?auto_23113 ?auto_23116 ) ) ( not ( = ?auto_23114 ?auto_23116 ) ) ( not ( = ?auto_23115 ?auto_23116 ) ) ( ON-TABLE ?auto_23116 ) ( ON ?auto_23112 ?auto_23117 ) ( not ( = ?auto_23112 ?auto_23117 ) ) ( not ( = ?auto_23113 ?auto_23117 ) ) ( not ( = ?auto_23114 ?auto_23117 ) ) ( not ( = ?auto_23115 ?auto_23117 ) ) ( not ( = ?auto_23116 ?auto_23117 ) ) ( ON ?auto_23113 ?auto_23112 ) ( ON-TABLE ?auto_23117 ) ( CLEAR ?auto_23115 ) ( ON ?auto_23114 ?auto_23113 ) ( CLEAR ?auto_23114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23117 ?auto_23112 ?auto_23113 )
      ( MAKE-4PILE ?auto_23112 ?auto_23113 ?auto_23114 ?auto_23115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23118 - BLOCK
      ?auto_23119 - BLOCK
      ?auto_23120 - BLOCK
      ?auto_23121 - BLOCK
    )
    :vars
    (
      ?auto_23122 - BLOCK
      ?auto_23123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23118 ?auto_23119 ) ) ( not ( = ?auto_23118 ?auto_23120 ) ) ( not ( = ?auto_23118 ?auto_23121 ) ) ( not ( = ?auto_23119 ?auto_23120 ) ) ( not ( = ?auto_23119 ?auto_23121 ) ) ( not ( = ?auto_23120 ?auto_23121 ) ) ( not ( = ?auto_23118 ?auto_23122 ) ) ( not ( = ?auto_23119 ?auto_23122 ) ) ( not ( = ?auto_23120 ?auto_23122 ) ) ( not ( = ?auto_23121 ?auto_23122 ) ) ( ON-TABLE ?auto_23122 ) ( ON ?auto_23118 ?auto_23123 ) ( not ( = ?auto_23118 ?auto_23123 ) ) ( not ( = ?auto_23119 ?auto_23123 ) ) ( not ( = ?auto_23120 ?auto_23123 ) ) ( not ( = ?auto_23121 ?auto_23123 ) ) ( not ( = ?auto_23122 ?auto_23123 ) ) ( ON ?auto_23119 ?auto_23118 ) ( ON-TABLE ?auto_23123 ) ( ON ?auto_23120 ?auto_23119 ) ( CLEAR ?auto_23120 ) ( HOLDING ?auto_23121 ) ( CLEAR ?auto_23122 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23122 ?auto_23121 )
      ( MAKE-4PILE ?auto_23118 ?auto_23119 ?auto_23120 ?auto_23121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23124 - BLOCK
      ?auto_23125 - BLOCK
      ?auto_23126 - BLOCK
      ?auto_23127 - BLOCK
    )
    :vars
    (
      ?auto_23128 - BLOCK
      ?auto_23129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23124 ?auto_23125 ) ) ( not ( = ?auto_23124 ?auto_23126 ) ) ( not ( = ?auto_23124 ?auto_23127 ) ) ( not ( = ?auto_23125 ?auto_23126 ) ) ( not ( = ?auto_23125 ?auto_23127 ) ) ( not ( = ?auto_23126 ?auto_23127 ) ) ( not ( = ?auto_23124 ?auto_23128 ) ) ( not ( = ?auto_23125 ?auto_23128 ) ) ( not ( = ?auto_23126 ?auto_23128 ) ) ( not ( = ?auto_23127 ?auto_23128 ) ) ( ON-TABLE ?auto_23128 ) ( ON ?auto_23124 ?auto_23129 ) ( not ( = ?auto_23124 ?auto_23129 ) ) ( not ( = ?auto_23125 ?auto_23129 ) ) ( not ( = ?auto_23126 ?auto_23129 ) ) ( not ( = ?auto_23127 ?auto_23129 ) ) ( not ( = ?auto_23128 ?auto_23129 ) ) ( ON ?auto_23125 ?auto_23124 ) ( ON-TABLE ?auto_23129 ) ( ON ?auto_23126 ?auto_23125 ) ( CLEAR ?auto_23128 ) ( ON ?auto_23127 ?auto_23126 ) ( CLEAR ?auto_23127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23129 ?auto_23124 ?auto_23125 ?auto_23126 )
      ( MAKE-4PILE ?auto_23124 ?auto_23125 ?auto_23126 ?auto_23127 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23130 - BLOCK
      ?auto_23131 - BLOCK
      ?auto_23132 - BLOCK
      ?auto_23133 - BLOCK
    )
    :vars
    (
      ?auto_23134 - BLOCK
      ?auto_23135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23130 ?auto_23131 ) ) ( not ( = ?auto_23130 ?auto_23132 ) ) ( not ( = ?auto_23130 ?auto_23133 ) ) ( not ( = ?auto_23131 ?auto_23132 ) ) ( not ( = ?auto_23131 ?auto_23133 ) ) ( not ( = ?auto_23132 ?auto_23133 ) ) ( not ( = ?auto_23130 ?auto_23134 ) ) ( not ( = ?auto_23131 ?auto_23134 ) ) ( not ( = ?auto_23132 ?auto_23134 ) ) ( not ( = ?auto_23133 ?auto_23134 ) ) ( ON ?auto_23130 ?auto_23135 ) ( not ( = ?auto_23130 ?auto_23135 ) ) ( not ( = ?auto_23131 ?auto_23135 ) ) ( not ( = ?auto_23132 ?auto_23135 ) ) ( not ( = ?auto_23133 ?auto_23135 ) ) ( not ( = ?auto_23134 ?auto_23135 ) ) ( ON ?auto_23131 ?auto_23130 ) ( ON-TABLE ?auto_23135 ) ( ON ?auto_23132 ?auto_23131 ) ( ON ?auto_23133 ?auto_23132 ) ( CLEAR ?auto_23133 ) ( HOLDING ?auto_23134 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23134 )
      ( MAKE-4PILE ?auto_23130 ?auto_23131 ?auto_23132 ?auto_23133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23136 - BLOCK
      ?auto_23137 - BLOCK
      ?auto_23138 - BLOCK
      ?auto_23139 - BLOCK
    )
    :vars
    (
      ?auto_23140 - BLOCK
      ?auto_23141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23136 ?auto_23137 ) ) ( not ( = ?auto_23136 ?auto_23138 ) ) ( not ( = ?auto_23136 ?auto_23139 ) ) ( not ( = ?auto_23137 ?auto_23138 ) ) ( not ( = ?auto_23137 ?auto_23139 ) ) ( not ( = ?auto_23138 ?auto_23139 ) ) ( not ( = ?auto_23136 ?auto_23140 ) ) ( not ( = ?auto_23137 ?auto_23140 ) ) ( not ( = ?auto_23138 ?auto_23140 ) ) ( not ( = ?auto_23139 ?auto_23140 ) ) ( ON ?auto_23136 ?auto_23141 ) ( not ( = ?auto_23136 ?auto_23141 ) ) ( not ( = ?auto_23137 ?auto_23141 ) ) ( not ( = ?auto_23138 ?auto_23141 ) ) ( not ( = ?auto_23139 ?auto_23141 ) ) ( not ( = ?auto_23140 ?auto_23141 ) ) ( ON ?auto_23137 ?auto_23136 ) ( ON-TABLE ?auto_23141 ) ( ON ?auto_23138 ?auto_23137 ) ( ON ?auto_23139 ?auto_23138 ) ( ON ?auto_23140 ?auto_23139 ) ( CLEAR ?auto_23140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23141 ?auto_23136 ?auto_23137 ?auto_23138 ?auto_23139 )
      ( MAKE-4PILE ?auto_23136 ?auto_23137 ?auto_23138 ?auto_23139 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23152 - BLOCK
      ?auto_23153 - BLOCK
      ?auto_23154 - BLOCK
      ?auto_23155 - BLOCK
      ?auto_23156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23155 ) ( ON-TABLE ?auto_23152 ) ( ON ?auto_23153 ?auto_23152 ) ( ON ?auto_23154 ?auto_23153 ) ( ON ?auto_23155 ?auto_23154 ) ( not ( = ?auto_23152 ?auto_23153 ) ) ( not ( = ?auto_23152 ?auto_23154 ) ) ( not ( = ?auto_23152 ?auto_23155 ) ) ( not ( = ?auto_23152 ?auto_23156 ) ) ( not ( = ?auto_23153 ?auto_23154 ) ) ( not ( = ?auto_23153 ?auto_23155 ) ) ( not ( = ?auto_23153 ?auto_23156 ) ) ( not ( = ?auto_23154 ?auto_23155 ) ) ( not ( = ?auto_23154 ?auto_23156 ) ) ( not ( = ?auto_23155 ?auto_23156 ) ) ( ON-TABLE ?auto_23156 ) ( CLEAR ?auto_23156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_23156 )
      ( MAKE-5PILE ?auto_23152 ?auto_23153 ?auto_23154 ?auto_23155 ?auto_23156 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23157 - BLOCK
      ?auto_23158 - BLOCK
      ?auto_23159 - BLOCK
      ?auto_23160 - BLOCK
      ?auto_23161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23157 ) ( ON ?auto_23158 ?auto_23157 ) ( ON ?auto_23159 ?auto_23158 ) ( not ( = ?auto_23157 ?auto_23158 ) ) ( not ( = ?auto_23157 ?auto_23159 ) ) ( not ( = ?auto_23157 ?auto_23160 ) ) ( not ( = ?auto_23157 ?auto_23161 ) ) ( not ( = ?auto_23158 ?auto_23159 ) ) ( not ( = ?auto_23158 ?auto_23160 ) ) ( not ( = ?auto_23158 ?auto_23161 ) ) ( not ( = ?auto_23159 ?auto_23160 ) ) ( not ( = ?auto_23159 ?auto_23161 ) ) ( not ( = ?auto_23160 ?auto_23161 ) ) ( ON-TABLE ?auto_23161 ) ( CLEAR ?auto_23161 ) ( HOLDING ?auto_23160 ) ( CLEAR ?auto_23159 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23157 ?auto_23158 ?auto_23159 ?auto_23160 )
      ( MAKE-5PILE ?auto_23157 ?auto_23158 ?auto_23159 ?auto_23160 ?auto_23161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23162 - BLOCK
      ?auto_23163 - BLOCK
      ?auto_23164 - BLOCK
      ?auto_23165 - BLOCK
      ?auto_23166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23162 ) ( ON ?auto_23163 ?auto_23162 ) ( ON ?auto_23164 ?auto_23163 ) ( not ( = ?auto_23162 ?auto_23163 ) ) ( not ( = ?auto_23162 ?auto_23164 ) ) ( not ( = ?auto_23162 ?auto_23165 ) ) ( not ( = ?auto_23162 ?auto_23166 ) ) ( not ( = ?auto_23163 ?auto_23164 ) ) ( not ( = ?auto_23163 ?auto_23165 ) ) ( not ( = ?auto_23163 ?auto_23166 ) ) ( not ( = ?auto_23164 ?auto_23165 ) ) ( not ( = ?auto_23164 ?auto_23166 ) ) ( not ( = ?auto_23165 ?auto_23166 ) ) ( ON-TABLE ?auto_23166 ) ( CLEAR ?auto_23164 ) ( ON ?auto_23165 ?auto_23166 ) ( CLEAR ?auto_23165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23166 )
      ( MAKE-5PILE ?auto_23162 ?auto_23163 ?auto_23164 ?auto_23165 ?auto_23166 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23167 - BLOCK
      ?auto_23168 - BLOCK
      ?auto_23169 - BLOCK
      ?auto_23170 - BLOCK
      ?auto_23171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23167 ) ( ON ?auto_23168 ?auto_23167 ) ( not ( = ?auto_23167 ?auto_23168 ) ) ( not ( = ?auto_23167 ?auto_23169 ) ) ( not ( = ?auto_23167 ?auto_23170 ) ) ( not ( = ?auto_23167 ?auto_23171 ) ) ( not ( = ?auto_23168 ?auto_23169 ) ) ( not ( = ?auto_23168 ?auto_23170 ) ) ( not ( = ?auto_23168 ?auto_23171 ) ) ( not ( = ?auto_23169 ?auto_23170 ) ) ( not ( = ?auto_23169 ?auto_23171 ) ) ( not ( = ?auto_23170 ?auto_23171 ) ) ( ON-TABLE ?auto_23171 ) ( ON ?auto_23170 ?auto_23171 ) ( CLEAR ?auto_23170 ) ( HOLDING ?auto_23169 ) ( CLEAR ?auto_23168 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23167 ?auto_23168 ?auto_23169 )
      ( MAKE-5PILE ?auto_23167 ?auto_23168 ?auto_23169 ?auto_23170 ?auto_23171 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23172 - BLOCK
      ?auto_23173 - BLOCK
      ?auto_23174 - BLOCK
      ?auto_23175 - BLOCK
      ?auto_23176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23172 ) ( ON ?auto_23173 ?auto_23172 ) ( not ( = ?auto_23172 ?auto_23173 ) ) ( not ( = ?auto_23172 ?auto_23174 ) ) ( not ( = ?auto_23172 ?auto_23175 ) ) ( not ( = ?auto_23172 ?auto_23176 ) ) ( not ( = ?auto_23173 ?auto_23174 ) ) ( not ( = ?auto_23173 ?auto_23175 ) ) ( not ( = ?auto_23173 ?auto_23176 ) ) ( not ( = ?auto_23174 ?auto_23175 ) ) ( not ( = ?auto_23174 ?auto_23176 ) ) ( not ( = ?auto_23175 ?auto_23176 ) ) ( ON-TABLE ?auto_23176 ) ( ON ?auto_23175 ?auto_23176 ) ( CLEAR ?auto_23173 ) ( ON ?auto_23174 ?auto_23175 ) ( CLEAR ?auto_23174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23176 ?auto_23175 )
      ( MAKE-5PILE ?auto_23172 ?auto_23173 ?auto_23174 ?auto_23175 ?auto_23176 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23177 - BLOCK
      ?auto_23178 - BLOCK
      ?auto_23179 - BLOCK
      ?auto_23180 - BLOCK
      ?auto_23181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23177 ) ( not ( = ?auto_23177 ?auto_23178 ) ) ( not ( = ?auto_23177 ?auto_23179 ) ) ( not ( = ?auto_23177 ?auto_23180 ) ) ( not ( = ?auto_23177 ?auto_23181 ) ) ( not ( = ?auto_23178 ?auto_23179 ) ) ( not ( = ?auto_23178 ?auto_23180 ) ) ( not ( = ?auto_23178 ?auto_23181 ) ) ( not ( = ?auto_23179 ?auto_23180 ) ) ( not ( = ?auto_23179 ?auto_23181 ) ) ( not ( = ?auto_23180 ?auto_23181 ) ) ( ON-TABLE ?auto_23181 ) ( ON ?auto_23180 ?auto_23181 ) ( ON ?auto_23179 ?auto_23180 ) ( CLEAR ?auto_23179 ) ( HOLDING ?auto_23178 ) ( CLEAR ?auto_23177 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23177 ?auto_23178 )
      ( MAKE-5PILE ?auto_23177 ?auto_23178 ?auto_23179 ?auto_23180 ?auto_23181 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23182 - BLOCK
      ?auto_23183 - BLOCK
      ?auto_23184 - BLOCK
      ?auto_23185 - BLOCK
      ?auto_23186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23182 ) ( not ( = ?auto_23182 ?auto_23183 ) ) ( not ( = ?auto_23182 ?auto_23184 ) ) ( not ( = ?auto_23182 ?auto_23185 ) ) ( not ( = ?auto_23182 ?auto_23186 ) ) ( not ( = ?auto_23183 ?auto_23184 ) ) ( not ( = ?auto_23183 ?auto_23185 ) ) ( not ( = ?auto_23183 ?auto_23186 ) ) ( not ( = ?auto_23184 ?auto_23185 ) ) ( not ( = ?auto_23184 ?auto_23186 ) ) ( not ( = ?auto_23185 ?auto_23186 ) ) ( ON-TABLE ?auto_23186 ) ( ON ?auto_23185 ?auto_23186 ) ( ON ?auto_23184 ?auto_23185 ) ( CLEAR ?auto_23182 ) ( ON ?auto_23183 ?auto_23184 ) ( CLEAR ?auto_23183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23186 ?auto_23185 ?auto_23184 )
      ( MAKE-5PILE ?auto_23182 ?auto_23183 ?auto_23184 ?auto_23185 ?auto_23186 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23187 - BLOCK
      ?auto_23188 - BLOCK
      ?auto_23189 - BLOCK
      ?auto_23190 - BLOCK
      ?auto_23191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23187 ?auto_23188 ) ) ( not ( = ?auto_23187 ?auto_23189 ) ) ( not ( = ?auto_23187 ?auto_23190 ) ) ( not ( = ?auto_23187 ?auto_23191 ) ) ( not ( = ?auto_23188 ?auto_23189 ) ) ( not ( = ?auto_23188 ?auto_23190 ) ) ( not ( = ?auto_23188 ?auto_23191 ) ) ( not ( = ?auto_23189 ?auto_23190 ) ) ( not ( = ?auto_23189 ?auto_23191 ) ) ( not ( = ?auto_23190 ?auto_23191 ) ) ( ON-TABLE ?auto_23191 ) ( ON ?auto_23190 ?auto_23191 ) ( ON ?auto_23189 ?auto_23190 ) ( ON ?auto_23188 ?auto_23189 ) ( CLEAR ?auto_23188 ) ( HOLDING ?auto_23187 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23187 )
      ( MAKE-5PILE ?auto_23187 ?auto_23188 ?auto_23189 ?auto_23190 ?auto_23191 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23192 - BLOCK
      ?auto_23193 - BLOCK
      ?auto_23194 - BLOCK
      ?auto_23195 - BLOCK
      ?auto_23196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23192 ?auto_23193 ) ) ( not ( = ?auto_23192 ?auto_23194 ) ) ( not ( = ?auto_23192 ?auto_23195 ) ) ( not ( = ?auto_23192 ?auto_23196 ) ) ( not ( = ?auto_23193 ?auto_23194 ) ) ( not ( = ?auto_23193 ?auto_23195 ) ) ( not ( = ?auto_23193 ?auto_23196 ) ) ( not ( = ?auto_23194 ?auto_23195 ) ) ( not ( = ?auto_23194 ?auto_23196 ) ) ( not ( = ?auto_23195 ?auto_23196 ) ) ( ON-TABLE ?auto_23196 ) ( ON ?auto_23195 ?auto_23196 ) ( ON ?auto_23194 ?auto_23195 ) ( ON ?auto_23193 ?auto_23194 ) ( ON ?auto_23192 ?auto_23193 ) ( CLEAR ?auto_23192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23196 ?auto_23195 ?auto_23194 ?auto_23193 )
      ( MAKE-5PILE ?auto_23192 ?auto_23193 ?auto_23194 ?auto_23195 ?auto_23196 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23202 - BLOCK
      ?auto_23203 - BLOCK
      ?auto_23204 - BLOCK
      ?auto_23205 - BLOCK
      ?auto_23206 - BLOCK
    )
    :vars
    (
      ?auto_23207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23202 ?auto_23203 ) ) ( not ( = ?auto_23202 ?auto_23204 ) ) ( not ( = ?auto_23202 ?auto_23205 ) ) ( not ( = ?auto_23202 ?auto_23206 ) ) ( not ( = ?auto_23203 ?auto_23204 ) ) ( not ( = ?auto_23203 ?auto_23205 ) ) ( not ( = ?auto_23203 ?auto_23206 ) ) ( not ( = ?auto_23204 ?auto_23205 ) ) ( not ( = ?auto_23204 ?auto_23206 ) ) ( not ( = ?auto_23205 ?auto_23206 ) ) ( ON-TABLE ?auto_23206 ) ( ON ?auto_23205 ?auto_23206 ) ( ON ?auto_23204 ?auto_23205 ) ( ON ?auto_23203 ?auto_23204 ) ( CLEAR ?auto_23203 ) ( ON ?auto_23202 ?auto_23207 ) ( CLEAR ?auto_23202 ) ( HAND-EMPTY ) ( not ( = ?auto_23202 ?auto_23207 ) ) ( not ( = ?auto_23203 ?auto_23207 ) ) ( not ( = ?auto_23204 ?auto_23207 ) ) ( not ( = ?auto_23205 ?auto_23207 ) ) ( not ( = ?auto_23206 ?auto_23207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23202 ?auto_23207 )
      ( MAKE-5PILE ?auto_23202 ?auto_23203 ?auto_23204 ?auto_23205 ?auto_23206 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23208 - BLOCK
      ?auto_23209 - BLOCK
      ?auto_23210 - BLOCK
      ?auto_23211 - BLOCK
      ?auto_23212 - BLOCK
    )
    :vars
    (
      ?auto_23213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23208 ?auto_23209 ) ) ( not ( = ?auto_23208 ?auto_23210 ) ) ( not ( = ?auto_23208 ?auto_23211 ) ) ( not ( = ?auto_23208 ?auto_23212 ) ) ( not ( = ?auto_23209 ?auto_23210 ) ) ( not ( = ?auto_23209 ?auto_23211 ) ) ( not ( = ?auto_23209 ?auto_23212 ) ) ( not ( = ?auto_23210 ?auto_23211 ) ) ( not ( = ?auto_23210 ?auto_23212 ) ) ( not ( = ?auto_23211 ?auto_23212 ) ) ( ON-TABLE ?auto_23212 ) ( ON ?auto_23211 ?auto_23212 ) ( ON ?auto_23210 ?auto_23211 ) ( ON ?auto_23208 ?auto_23213 ) ( CLEAR ?auto_23208 ) ( not ( = ?auto_23208 ?auto_23213 ) ) ( not ( = ?auto_23209 ?auto_23213 ) ) ( not ( = ?auto_23210 ?auto_23213 ) ) ( not ( = ?auto_23211 ?auto_23213 ) ) ( not ( = ?auto_23212 ?auto_23213 ) ) ( HOLDING ?auto_23209 ) ( CLEAR ?auto_23210 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23212 ?auto_23211 ?auto_23210 ?auto_23209 )
      ( MAKE-5PILE ?auto_23208 ?auto_23209 ?auto_23210 ?auto_23211 ?auto_23212 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23214 - BLOCK
      ?auto_23215 - BLOCK
      ?auto_23216 - BLOCK
      ?auto_23217 - BLOCK
      ?auto_23218 - BLOCK
    )
    :vars
    (
      ?auto_23219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23214 ?auto_23215 ) ) ( not ( = ?auto_23214 ?auto_23216 ) ) ( not ( = ?auto_23214 ?auto_23217 ) ) ( not ( = ?auto_23214 ?auto_23218 ) ) ( not ( = ?auto_23215 ?auto_23216 ) ) ( not ( = ?auto_23215 ?auto_23217 ) ) ( not ( = ?auto_23215 ?auto_23218 ) ) ( not ( = ?auto_23216 ?auto_23217 ) ) ( not ( = ?auto_23216 ?auto_23218 ) ) ( not ( = ?auto_23217 ?auto_23218 ) ) ( ON-TABLE ?auto_23218 ) ( ON ?auto_23217 ?auto_23218 ) ( ON ?auto_23216 ?auto_23217 ) ( ON ?auto_23214 ?auto_23219 ) ( not ( = ?auto_23214 ?auto_23219 ) ) ( not ( = ?auto_23215 ?auto_23219 ) ) ( not ( = ?auto_23216 ?auto_23219 ) ) ( not ( = ?auto_23217 ?auto_23219 ) ) ( not ( = ?auto_23218 ?auto_23219 ) ) ( CLEAR ?auto_23216 ) ( ON ?auto_23215 ?auto_23214 ) ( CLEAR ?auto_23215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23219 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23219 ?auto_23214 )
      ( MAKE-5PILE ?auto_23214 ?auto_23215 ?auto_23216 ?auto_23217 ?auto_23218 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23220 - BLOCK
      ?auto_23221 - BLOCK
      ?auto_23222 - BLOCK
      ?auto_23223 - BLOCK
      ?auto_23224 - BLOCK
    )
    :vars
    (
      ?auto_23225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23220 ?auto_23221 ) ) ( not ( = ?auto_23220 ?auto_23222 ) ) ( not ( = ?auto_23220 ?auto_23223 ) ) ( not ( = ?auto_23220 ?auto_23224 ) ) ( not ( = ?auto_23221 ?auto_23222 ) ) ( not ( = ?auto_23221 ?auto_23223 ) ) ( not ( = ?auto_23221 ?auto_23224 ) ) ( not ( = ?auto_23222 ?auto_23223 ) ) ( not ( = ?auto_23222 ?auto_23224 ) ) ( not ( = ?auto_23223 ?auto_23224 ) ) ( ON-TABLE ?auto_23224 ) ( ON ?auto_23223 ?auto_23224 ) ( ON ?auto_23220 ?auto_23225 ) ( not ( = ?auto_23220 ?auto_23225 ) ) ( not ( = ?auto_23221 ?auto_23225 ) ) ( not ( = ?auto_23222 ?auto_23225 ) ) ( not ( = ?auto_23223 ?auto_23225 ) ) ( not ( = ?auto_23224 ?auto_23225 ) ) ( ON ?auto_23221 ?auto_23220 ) ( CLEAR ?auto_23221 ) ( ON-TABLE ?auto_23225 ) ( HOLDING ?auto_23222 ) ( CLEAR ?auto_23223 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23224 ?auto_23223 ?auto_23222 )
      ( MAKE-5PILE ?auto_23220 ?auto_23221 ?auto_23222 ?auto_23223 ?auto_23224 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23226 - BLOCK
      ?auto_23227 - BLOCK
      ?auto_23228 - BLOCK
      ?auto_23229 - BLOCK
      ?auto_23230 - BLOCK
    )
    :vars
    (
      ?auto_23231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23226 ?auto_23227 ) ) ( not ( = ?auto_23226 ?auto_23228 ) ) ( not ( = ?auto_23226 ?auto_23229 ) ) ( not ( = ?auto_23226 ?auto_23230 ) ) ( not ( = ?auto_23227 ?auto_23228 ) ) ( not ( = ?auto_23227 ?auto_23229 ) ) ( not ( = ?auto_23227 ?auto_23230 ) ) ( not ( = ?auto_23228 ?auto_23229 ) ) ( not ( = ?auto_23228 ?auto_23230 ) ) ( not ( = ?auto_23229 ?auto_23230 ) ) ( ON-TABLE ?auto_23230 ) ( ON ?auto_23229 ?auto_23230 ) ( ON ?auto_23226 ?auto_23231 ) ( not ( = ?auto_23226 ?auto_23231 ) ) ( not ( = ?auto_23227 ?auto_23231 ) ) ( not ( = ?auto_23228 ?auto_23231 ) ) ( not ( = ?auto_23229 ?auto_23231 ) ) ( not ( = ?auto_23230 ?auto_23231 ) ) ( ON ?auto_23227 ?auto_23226 ) ( ON-TABLE ?auto_23231 ) ( CLEAR ?auto_23229 ) ( ON ?auto_23228 ?auto_23227 ) ( CLEAR ?auto_23228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23231 ?auto_23226 ?auto_23227 )
      ( MAKE-5PILE ?auto_23226 ?auto_23227 ?auto_23228 ?auto_23229 ?auto_23230 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23232 - BLOCK
      ?auto_23233 - BLOCK
      ?auto_23234 - BLOCK
      ?auto_23235 - BLOCK
      ?auto_23236 - BLOCK
    )
    :vars
    (
      ?auto_23237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23232 ?auto_23233 ) ) ( not ( = ?auto_23232 ?auto_23234 ) ) ( not ( = ?auto_23232 ?auto_23235 ) ) ( not ( = ?auto_23232 ?auto_23236 ) ) ( not ( = ?auto_23233 ?auto_23234 ) ) ( not ( = ?auto_23233 ?auto_23235 ) ) ( not ( = ?auto_23233 ?auto_23236 ) ) ( not ( = ?auto_23234 ?auto_23235 ) ) ( not ( = ?auto_23234 ?auto_23236 ) ) ( not ( = ?auto_23235 ?auto_23236 ) ) ( ON-TABLE ?auto_23236 ) ( ON ?auto_23232 ?auto_23237 ) ( not ( = ?auto_23232 ?auto_23237 ) ) ( not ( = ?auto_23233 ?auto_23237 ) ) ( not ( = ?auto_23234 ?auto_23237 ) ) ( not ( = ?auto_23235 ?auto_23237 ) ) ( not ( = ?auto_23236 ?auto_23237 ) ) ( ON ?auto_23233 ?auto_23232 ) ( ON-TABLE ?auto_23237 ) ( ON ?auto_23234 ?auto_23233 ) ( CLEAR ?auto_23234 ) ( HOLDING ?auto_23235 ) ( CLEAR ?auto_23236 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23236 ?auto_23235 )
      ( MAKE-5PILE ?auto_23232 ?auto_23233 ?auto_23234 ?auto_23235 ?auto_23236 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23238 - BLOCK
      ?auto_23239 - BLOCK
      ?auto_23240 - BLOCK
      ?auto_23241 - BLOCK
      ?auto_23242 - BLOCK
    )
    :vars
    (
      ?auto_23243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23238 ?auto_23239 ) ) ( not ( = ?auto_23238 ?auto_23240 ) ) ( not ( = ?auto_23238 ?auto_23241 ) ) ( not ( = ?auto_23238 ?auto_23242 ) ) ( not ( = ?auto_23239 ?auto_23240 ) ) ( not ( = ?auto_23239 ?auto_23241 ) ) ( not ( = ?auto_23239 ?auto_23242 ) ) ( not ( = ?auto_23240 ?auto_23241 ) ) ( not ( = ?auto_23240 ?auto_23242 ) ) ( not ( = ?auto_23241 ?auto_23242 ) ) ( ON-TABLE ?auto_23242 ) ( ON ?auto_23238 ?auto_23243 ) ( not ( = ?auto_23238 ?auto_23243 ) ) ( not ( = ?auto_23239 ?auto_23243 ) ) ( not ( = ?auto_23240 ?auto_23243 ) ) ( not ( = ?auto_23241 ?auto_23243 ) ) ( not ( = ?auto_23242 ?auto_23243 ) ) ( ON ?auto_23239 ?auto_23238 ) ( ON-TABLE ?auto_23243 ) ( ON ?auto_23240 ?auto_23239 ) ( CLEAR ?auto_23242 ) ( ON ?auto_23241 ?auto_23240 ) ( CLEAR ?auto_23241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23243 ?auto_23238 ?auto_23239 ?auto_23240 )
      ( MAKE-5PILE ?auto_23238 ?auto_23239 ?auto_23240 ?auto_23241 ?auto_23242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23244 - BLOCK
      ?auto_23245 - BLOCK
      ?auto_23246 - BLOCK
      ?auto_23247 - BLOCK
      ?auto_23248 - BLOCK
    )
    :vars
    (
      ?auto_23249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23244 ?auto_23245 ) ) ( not ( = ?auto_23244 ?auto_23246 ) ) ( not ( = ?auto_23244 ?auto_23247 ) ) ( not ( = ?auto_23244 ?auto_23248 ) ) ( not ( = ?auto_23245 ?auto_23246 ) ) ( not ( = ?auto_23245 ?auto_23247 ) ) ( not ( = ?auto_23245 ?auto_23248 ) ) ( not ( = ?auto_23246 ?auto_23247 ) ) ( not ( = ?auto_23246 ?auto_23248 ) ) ( not ( = ?auto_23247 ?auto_23248 ) ) ( ON ?auto_23244 ?auto_23249 ) ( not ( = ?auto_23244 ?auto_23249 ) ) ( not ( = ?auto_23245 ?auto_23249 ) ) ( not ( = ?auto_23246 ?auto_23249 ) ) ( not ( = ?auto_23247 ?auto_23249 ) ) ( not ( = ?auto_23248 ?auto_23249 ) ) ( ON ?auto_23245 ?auto_23244 ) ( ON-TABLE ?auto_23249 ) ( ON ?auto_23246 ?auto_23245 ) ( ON ?auto_23247 ?auto_23246 ) ( CLEAR ?auto_23247 ) ( HOLDING ?auto_23248 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23248 )
      ( MAKE-5PILE ?auto_23244 ?auto_23245 ?auto_23246 ?auto_23247 ?auto_23248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23250 - BLOCK
      ?auto_23251 - BLOCK
      ?auto_23252 - BLOCK
      ?auto_23253 - BLOCK
      ?auto_23254 - BLOCK
    )
    :vars
    (
      ?auto_23255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23250 ?auto_23251 ) ) ( not ( = ?auto_23250 ?auto_23252 ) ) ( not ( = ?auto_23250 ?auto_23253 ) ) ( not ( = ?auto_23250 ?auto_23254 ) ) ( not ( = ?auto_23251 ?auto_23252 ) ) ( not ( = ?auto_23251 ?auto_23253 ) ) ( not ( = ?auto_23251 ?auto_23254 ) ) ( not ( = ?auto_23252 ?auto_23253 ) ) ( not ( = ?auto_23252 ?auto_23254 ) ) ( not ( = ?auto_23253 ?auto_23254 ) ) ( ON ?auto_23250 ?auto_23255 ) ( not ( = ?auto_23250 ?auto_23255 ) ) ( not ( = ?auto_23251 ?auto_23255 ) ) ( not ( = ?auto_23252 ?auto_23255 ) ) ( not ( = ?auto_23253 ?auto_23255 ) ) ( not ( = ?auto_23254 ?auto_23255 ) ) ( ON ?auto_23251 ?auto_23250 ) ( ON-TABLE ?auto_23255 ) ( ON ?auto_23252 ?auto_23251 ) ( ON ?auto_23253 ?auto_23252 ) ( ON ?auto_23254 ?auto_23253 ) ( CLEAR ?auto_23254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23255 ?auto_23250 ?auto_23251 ?auto_23252 ?auto_23253 )
      ( MAKE-5PILE ?auto_23250 ?auto_23251 ?auto_23252 ?auto_23253 ?auto_23254 ) )
  )

)

