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
      ?auto_13304 - BLOCK
      ?auto_13305 - BLOCK
      ?auto_13306 - BLOCK
      ?auto_13307 - BLOCK
    )
    :vars
    (
      ?auto_13308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13308 ?auto_13307 ) ( CLEAR ?auto_13308 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13304 ) ( ON ?auto_13305 ?auto_13304 ) ( ON ?auto_13306 ?auto_13305 ) ( ON ?auto_13307 ?auto_13306 ) ( not ( = ?auto_13304 ?auto_13305 ) ) ( not ( = ?auto_13304 ?auto_13306 ) ) ( not ( = ?auto_13304 ?auto_13307 ) ) ( not ( = ?auto_13304 ?auto_13308 ) ) ( not ( = ?auto_13305 ?auto_13306 ) ) ( not ( = ?auto_13305 ?auto_13307 ) ) ( not ( = ?auto_13305 ?auto_13308 ) ) ( not ( = ?auto_13306 ?auto_13307 ) ) ( not ( = ?auto_13306 ?auto_13308 ) ) ( not ( = ?auto_13307 ?auto_13308 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13308 ?auto_13307 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13310 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13310 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13311 - BLOCK
    )
    :vars
    (
      ?auto_13312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13311 ?auto_13312 ) ( CLEAR ?auto_13311 ) ( HAND-EMPTY ) ( not ( = ?auto_13311 ?auto_13312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13311 ?auto_13312 )
      ( MAKE-1PILE ?auto_13311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13316 - BLOCK
      ?auto_13317 - BLOCK
      ?auto_13318 - BLOCK
    )
    :vars
    (
      ?auto_13319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13319 ?auto_13318 ) ( CLEAR ?auto_13319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13316 ) ( ON ?auto_13317 ?auto_13316 ) ( ON ?auto_13318 ?auto_13317 ) ( not ( = ?auto_13316 ?auto_13317 ) ) ( not ( = ?auto_13316 ?auto_13318 ) ) ( not ( = ?auto_13316 ?auto_13319 ) ) ( not ( = ?auto_13317 ?auto_13318 ) ) ( not ( = ?auto_13317 ?auto_13319 ) ) ( not ( = ?auto_13318 ?auto_13319 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13319 ?auto_13318 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13320 - BLOCK
      ?auto_13321 - BLOCK
      ?auto_13322 - BLOCK
    )
    :vars
    (
      ?auto_13323 - BLOCK
      ?auto_13324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13323 ?auto_13322 ) ( CLEAR ?auto_13323 ) ( ON-TABLE ?auto_13320 ) ( ON ?auto_13321 ?auto_13320 ) ( ON ?auto_13322 ?auto_13321 ) ( not ( = ?auto_13320 ?auto_13321 ) ) ( not ( = ?auto_13320 ?auto_13322 ) ) ( not ( = ?auto_13320 ?auto_13323 ) ) ( not ( = ?auto_13321 ?auto_13322 ) ) ( not ( = ?auto_13321 ?auto_13323 ) ) ( not ( = ?auto_13322 ?auto_13323 ) ) ( HOLDING ?auto_13324 ) ( not ( = ?auto_13320 ?auto_13324 ) ) ( not ( = ?auto_13321 ?auto_13324 ) ) ( not ( = ?auto_13322 ?auto_13324 ) ) ( not ( = ?auto_13323 ?auto_13324 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13324 )
      ( MAKE-3PILE ?auto_13320 ?auto_13321 ?auto_13322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13325 - BLOCK
      ?auto_13326 - BLOCK
      ?auto_13327 - BLOCK
    )
    :vars
    (
      ?auto_13329 - BLOCK
      ?auto_13328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13329 ?auto_13327 ) ( ON-TABLE ?auto_13325 ) ( ON ?auto_13326 ?auto_13325 ) ( ON ?auto_13327 ?auto_13326 ) ( not ( = ?auto_13325 ?auto_13326 ) ) ( not ( = ?auto_13325 ?auto_13327 ) ) ( not ( = ?auto_13325 ?auto_13329 ) ) ( not ( = ?auto_13326 ?auto_13327 ) ) ( not ( = ?auto_13326 ?auto_13329 ) ) ( not ( = ?auto_13327 ?auto_13329 ) ) ( not ( = ?auto_13325 ?auto_13328 ) ) ( not ( = ?auto_13326 ?auto_13328 ) ) ( not ( = ?auto_13327 ?auto_13328 ) ) ( not ( = ?auto_13329 ?auto_13328 ) ) ( ON ?auto_13328 ?auto_13329 ) ( CLEAR ?auto_13328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13325 ?auto_13326 ?auto_13327 ?auto_13329 )
      ( MAKE-3PILE ?auto_13325 ?auto_13326 ?auto_13327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13332 - BLOCK
      ?auto_13333 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13333 ) ( CLEAR ?auto_13332 ) ( ON-TABLE ?auto_13332 ) ( not ( = ?auto_13332 ?auto_13333 ) ) )
    :subtasks
    ( ( !STACK ?auto_13333 ?auto_13332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13334 - BLOCK
      ?auto_13335 - BLOCK
    )
    :vars
    (
      ?auto_13336 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13334 ) ( ON-TABLE ?auto_13334 ) ( not ( = ?auto_13334 ?auto_13335 ) ) ( ON ?auto_13335 ?auto_13336 ) ( CLEAR ?auto_13335 ) ( HAND-EMPTY ) ( not ( = ?auto_13334 ?auto_13336 ) ) ( not ( = ?auto_13335 ?auto_13336 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13335 ?auto_13336 )
      ( MAKE-2PILE ?auto_13334 ?auto_13335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13337 - BLOCK
      ?auto_13338 - BLOCK
    )
    :vars
    (
      ?auto_13339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13337 ?auto_13338 ) ) ( ON ?auto_13338 ?auto_13339 ) ( CLEAR ?auto_13338 ) ( not ( = ?auto_13337 ?auto_13339 ) ) ( not ( = ?auto_13338 ?auto_13339 ) ) ( HOLDING ?auto_13337 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13337 )
      ( MAKE-2PILE ?auto_13337 ?auto_13338 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13340 - BLOCK
      ?auto_13341 - BLOCK
    )
    :vars
    (
      ?auto_13342 - BLOCK
      ?auto_13343 - BLOCK
      ?auto_13344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13340 ?auto_13341 ) ) ( ON ?auto_13341 ?auto_13342 ) ( not ( = ?auto_13340 ?auto_13342 ) ) ( not ( = ?auto_13341 ?auto_13342 ) ) ( ON ?auto_13340 ?auto_13341 ) ( CLEAR ?auto_13340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13343 ) ( ON ?auto_13344 ?auto_13343 ) ( ON ?auto_13342 ?auto_13344 ) ( not ( = ?auto_13343 ?auto_13344 ) ) ( not ( = ?auto_13343 ?auto_13342 ) ) ( not ( = ?auto_13343 ?auto_13341 ) ) ( not ( = ?auto_13343 ?auto_13340 ) ) ( not ( = ?auto_13344 ?auto_13342 ) ) ( not ( = ?auto_13344 ?auto_13341 ) ) ( not ( = ?auto_13344 ?auto_13340 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13343 ?auto_13344 ?auto_13342 ?auto_13341 )
      ( MAKE-2PILE ?auto_13340 ?auto_13341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13347 - BLOCK
      ?auto_13348 - BLOCK
    )
    :vars
    (
      ?auto_13349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13349 ?auto_13348 ) ( CLEAR ?auto_13349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13347 ) ( ON ?auto_13348 ?auto_13347 ) ( not ( = ?auto_13347 ?auto_13348 ) ) ( not ( = ?auto_13347 ?auto_13349 ) ) ( not ( = ?auto_13348 ?auto_13349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13349 ?auto_13348 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13350 - BLOCK
      ?auto_13351 - BLOCK
    )
    :vars
    (
      ?auto_13352 - BLOCK
      ?auto_13353 - BLOCK
      ?auto_13354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13352 ?auto_13351 ) ( CLEAR ?auto_13352 ) ( ON-TABLE ?auto_13350 ) ( ON ?auto_13351 ?auto_13350 ) ( not ( = ?auto_13350 ?auto_13351 ) ) ( not ( = ?auto_13350 ?auto_13352 ) ) ( not ( = ?auto_13351 ?auto_13352 ) ) ( HOLDING ?auto_13353 ) ( CLEAR ?auto_13354 ) ( not ( = ?auto_13350 ?auto_13353 ) ) ( not ( = ?auto_13350 ?auto_13354 ) ) ( not ( = ?auto_13351 ?auto_13353 ) ) ( not ( = ?auto_13351 ?auto_13354 ) ) ( not ( = ?auto_13352 ?auto_13353 ) ) ( not ( = ?auto_13352 ?auto_13354 ) ) ( not ( = ?auto_13353 ?auto_13354 ) ) )
    :subtasks
    ( ( !STACK ?auto_13353 ?auto_13354 )
      ( MAKE-2PILE ?auto_13350 ?auto_13351 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13550 - BLOCK
      ?auto_13551 - BLOCK
    )
    :vars
    (
      ?auto_13552 - BLOCK
      ?auto_13553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13552 ?auto_13551 ) ( ON-TABLE ?auto_13550 ) ( ON ?auto_13551 ?auto_13550 ) ( not ( = ?auto_13550 ?auto_13551 ) ) ( not ( = ?auto_13550 ?auto_13552 ) ) ( not ( = ?auto_13551 ?auto_13552 ) ) ( not ( = ?auto_13550 ?auto_13553 ) ) ( not ( = ?auto_13551 ?auto_13553 ) ) ( not ( = ?auto_13552 ?auto_13553 ) ) ( ON ?auto_13553 ?auto_13552 ) ( CLEAR ?auto_13553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13550 ?auto_13551 ?auto_13552 )
      ( MAKE-2PILE ?auto_13550 ?auto_13551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13360 - BLOCK
      ?auto_13361 - BLOCK
    )
    :vars
    (
      ?auto_13363 - BLOCK
      ?auto_13362 - BLOCK
      ?auto_13364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13363 ?auto_13361 ) ( ON-TABLE ?auto_13360 ) ( ON ?auto_13361 ?auto_13360 ) ( not ( = ?auto_13360 ?auto_13361 ) ) ( not ( = ?auto_13360 ?auto_13363 ) ) ( not ( = ?auto_13361 ?auto_13363 ) ) ( not ( = ?auto_13360 ?auto_13362 ) ) ( not ( = ?auto_13360 ?auto_13364 ) ) ( not ( = ?auto_13361 ?auto_13362 ) ) ( not ( = ?auto_13361 ?auto_13364 ) ) ( not ( = ?auto_13363 ?auto_13362 ) ) ( not ( = ?auto_13363 ?auto_13364 ) ) ( not ( = ?auto_13362 ?auto_13364 ) ) ( ON ?auto_13362 ?auto_13363 ) ( CLEAR ?auto_13362 ) ( HOLDING ?auto_13364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13364 )
      ( MAKE-2PILE ?auto_13360 ?auto_13361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13365 - BLOCK
      ?auto_13366 - BLOCK
    )
    :vars
    (
      ?auto_13369 - BLOCK
      ?auto_13367 - BLOCK
      ?auto_13368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13369 ?auto_13366 ) ( ON-TABLE ?auto_13365 ) ( ON ?auto_13366 ?auto_13365 ) ( not ( = ?auto_13365 ?auto_13366 ) ) ( not ( = ?auto_13365 ?auto_13369 ) ) ( not ( = ?auto_13366 ?auto_13369 ) ) ( not ( = ?auto_13365 ?auto_13367 ) ) ( not ( = ?auto_13365 ?auto_13368 ) ) ( not ( = ?auto_13366 ?auto_13367 ) ) ( not ( = ?auto_13366 ?auto_13368 ) ) ( not ( = ?auto_13369 ?auto_13367 ) ) ( not ( = ?auto_13369 ?auto_13368 ) ) ( not ( = ?auto_13367 ?auto_13368 ) ) ( ON ?auto_13367 ?auto_13369 ) ( ON ?auto_13368 ?auto_13367 ) ( CLEAR ?auto_13368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13365 ?auto_13366 ?auto_13369 ?auto_13367 )
      ( MAKE-2PILE ?auto_13365 ?auto_13366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13373 - BLOCK
      ?auto_13374 - BLOCK
      ?auto_13375 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13375 ) ( CLEAR ?auto_13374 ) ( ON-TABLE ?auto_13373 ) ( ON ?auto_13374 ?auto_13373 ) ( not ( = ?auto_13373 ?auto_13374 ) ) ( not ( = ?auto_13373 ?auto_13375 ) ) ( not ( = ?auto_13374 ?auto_13375 ) ) )
    :subtasks
    ( ( !STACK ?auto_13375 ?auto_13374 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13376 - BLOCK
      ?auto_13377 - BLOCK
      ?auto_13378 - BLOCK
    )
    :vars
    (
      ?auto_13379 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13377 ) ( ON-TABLE ?auto_13376 ) ( ON ?auto_13377 ?auto_13376 ) ( not ( = ?auto_13376 ?auto_13377 ) ) ( not ( = ?auto_13376 ?auto_13378 ) ) ( not ( = ?auto_13377 ?auto_13378 ) ) ( ON ?auto_13378 ?auto_13379 ) ( CLEAR ?auto_13378 ) ( HAND-EMPTY ) ( not ( = ?auto_13376 ?auto_13379 ) ) ( not ( = ?auto_13377 ?auto_13379 ) ) ( not ( = ?auto_13378 ?auto_13379 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13378 ?auto_13379 )
      ( MAKE-3PILE ?auto_13376 ?auto_13377 ?auto_13378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13380 - BLOCK
      ?auto_13381 - BLOCK
      ?auto_13382 - BLOCK
    )
    :vars
    (
      ?auto_13383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13380 ) ( not ( = ?auto_13380 ?auto_13381 ) ) ( not ( = ?auto_13380 ?auto_13382 ) ) ( not ( = ?auto_13381 ?auto_13382 ) ) ( ON ?auto_13382 ?auto_13383 ) ( CLEAR ?auto_13382 ) ( not ( = ?auto_13380 ?auto_13383 ) ) ( not ( = ?auto_13381 ?auto_13383 ) ) ( not ( = ?auto_13382 ?auto_13383 ) ) ( HOLDING ?auto_13381 ) ( CLEAR ?auto_13380 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13380 ?auto_13381 )
      ( MAKE-3PILE ?auto_13380 ?auto_13381 ?auto_13382 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13384 - BLOCK
      ?auto_13385 - BLOCK
      ?auto_13386 - BLOCK
    )
    :vars
    (
      ?auto_13387 - BLOCK
      ?auto_13388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13384 ) ( not ( = ?auto_13384 ?auto_13385 ) ) ( not ( = ?auto_13384 ?auto_13386 ) ) ( not ( = ?auto_13385 ?auto_13386 ) ) ( ON ?auto_13386 ?auto_13387 ) ( not ( = ?auto_13384 ?auto_13387 ) ) ( not ( = ?auto_13385 ?auto_13387 ) ) ( not ( = ?auto_13386 ?auto_13387 ) ) ( CLEAR ?auto_13384 ) ( ON ?auto_13385 ?auto_13386 ) ( CLEAR ?auto_13385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13388 ) ( ON ?auto_13387 ?auto_13388 ) ( not ( = ?auto_13388 ?auto_13387 ) ) ( not ( = ?auto_13388 ?auto_13386 ) ) ( not ( = ?auto_13388 ?auto_13385 ) ) ( not ( = ?auto_13384 ?auto_13388 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13388 ?auto_13387 ?auto_13386 )
      ( MAKE-3PILE ?auto_13384 ?auto_13385 ?auto_13386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13389 - BLOCK
      ?auto_13390 - BLOCK
      ?auto_13391 - BLOCK
    )
    :vars
    (
      ?auto_13393 - BLOCK
      ?auto_13392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13389 ?auto_13390 ) ) ( not ( = ?auto_13389 ?auto_13391 ) ) ( not ( = ?auto_13390 ?auto_13391 ) ) ( ON ?auto_13391 ?auto_13393 ) ( not ( = ?auto_13389 ?auto_13393 ) ) ( not ( = ?auto_13390 ?auto_13393 ) ) ( not ( = ?auto_13391 ?auto_13393 ) ) ( ON ?auto_13390 ?auto_13391 ) ( CLEAR ?auto_13390 ) ( ON-TABLE ?auto_13392 ) ( ON ?auto_13393 ?auto_13392 ) ( not ( = ?auto_13392 ?auto_13393 ) ) ( not ( = ?auto_13392 ?auto_13391 ) ) ( not ( = ?auto_13392 ?auto_13390 ) ) ( not ( = ?auto_13389 ?auto_13392 ) ) ( HOLDING ?auto_13389 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13389 )
      ( MAKE-3PILE ?auto_13389 ?auto_13390 ?auto_13391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13394 - BLOCK
      ?auto_13395 - BLOCK
      ?auto_13396 - BLOCK
    )
    :vars
    (
      ?auto_13398 - BLOCK
      ?auto_13397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13394 ?auto_13395 ) ) ( not ( = ?auto_13394 ?auto_13396 ) ) ( not ( = ?auto_13395 ?auto_13396 ) ) ( ON ?auto_13396 ?auto_13398 ) ( not ( = ?auto_13394 ?auto_13398 ) ) ( not ( = ?auto_13395 ?auto_13398 ) ) ( not ( = ?auto_13396 ?auto_13398 ) ) ( ON ?auto_13395 ?auto_13396 ) ( ON-TABLE ?auto_13397 ) ( ON ?auto_13398 ?auto_13397 ) ( not ( = ?auto_13397 ?auto_13398 ) ) ( not ( = ?auto_13397 ?auto_13396 ) ) ( not ( = ?auto_13397 ?auto_13395 ) ) ( not ( = ?auto_13394 ?auto_13397 ) ) ( ON ?auto_13394 ?auto_13395 ) ( CLEAR ?auto_13394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13397 ?auto_13398 ?auto_13396 ?auto_13395 )
      ( MAKE-3PILE ?auto_13394 ?auto_13395 ?auto_13396 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13400 - BLOCK
    )
    :vars
    (
      ?auto_13401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13401 ?auto_13400 ) ( CLEAR ?auto_13401 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13400 ) ( not ( = ?auto_13400 ?auto_13401 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13401 ?auto_13400 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13402 - BLOCK
    )
    :vars
    (
      ?auto_13403 - BLOCK
      ?auto_13404 - BLOCK
      ?auto_13405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13403 ?auto_13402 ) ( CLEAR ?auto_13403 ) ( ON-TABLE ?auto_13402 ) ( not ( = ?auto_13402 ?auto_13403 ) ) ( HOLDING ?auto_13404 ) ( CLEAR ?auto_13405 ) ( not ( = ?auto_13402 ?auto_13404 ) ) ( not ( = ?auto_13402 ?auto_13405 ) ) ( not ( = ?auto_13403 ?auto_13404 ) ) ( not ( = ?auto_13403 ?auto_13405 ) ) ( not ( = ?auto_13404 ?auto_13405 ) ) )
    :subtasks
    ( ( !STACK ?auto_13404 ?auto_13405 )
      ( MAKE-1PILE ?auto_13402 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13406 - BLOCK
    )
    :vars
    (
      ?auto_13408 - BLOCK
      ?auto_13409 - BLOCK
      ?auto_13407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13408 ?auto_13406 ) ( ON-TABLE ?auto_13406 ) ( not ( = ?auto_13406 ?auto_13408 ) ) ( CLEAR ?auto_13409 ) ( not ( = ?auto_13406 ?auto_13407 ) ) ( not ( = ?auto_13406 ?auto_13409 ) ) ( not ( = ?auto_13408 ?auto_13407 ) ) ( not ( = ?auto_13408 ?auto_13409 ) ) ( not ( = ?auto_13407 ?auto_13409 ) ) ( ON ?auto_13407 ?auto_13408 ) ( CLEAR ?auto_13407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13406 ?auto_13408 )
      ( MAKE-1PILE ?auto_13406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13410 - BLOCK
    )
    :vars
    (
      ?auto_13412 - BLOCK
      ?auto_13411 - BLOCK
      ?auto_13413 - BLOCK
      ?auto_13414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13412 ?auto_13410 ) ( ON-TABLE ?auto_13410 ) ( not ( = ?auto_13410 ?auto_13412 ) ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( not ( = ?auto_13410 ?auto_13413 ) ) ( not ( = ?auto_13412 ?auto_13411 ) ) ( not ( = ?auto_13412 ?auto_13413 ) ) ( not ( = ?auto_13411 ?auto_13413 ) ) ( ON ?auto_13411 ?auto_13412 ) ( CLEAR ?auto_13411 ) ( HOLDING ?auto_13413 ) ( CLEAR ?auto_13414 ) ( ON-TABLE ?auto_13414 ) ( not ( = ?auto_13414 ?auto_13413 ) ) ( not ( = ?auto_13410 ?auto_13414 ) ) ( not ( = ?auto_13412 ?auto_13414 ) ) ( not ( = ?auto_13411 ?auto_13414 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13414 ?auto_13413 )
      ( MAKE-1PILE ?auto_13410 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13638 - BLOCK
    )
    :vars
    (
      ?auto_13640 - BLOCK
      ?auto_13639 - BLOCK
      ?auto_13641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13640 ?auto_13638 ) ( ON-TABLE ?auto_13638 ) ( not ( = ?auto_13638 ?auto_13640 ) ) ( not ( = ?auto_13638 ?auto_13639 ) ) ( not ( = ?auto_13638 ?auto_13641 ) ) ( not ( = ?auto_13640 ?auto_13639 ) ) ( not ( = ?auto_13640 ?auto_13641 ) ) ( not ( = ?auto_13639 ?auto_13641 ) ) ( ON ?auto_13639 ?auto_13640 ) ( ON ?auto_13641 ?auto_13639 ) ( CLEAR ?auto_13641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13638 ?auto_13640 ?auto_13639 )
      ( MAKE-1PILE ?auto_13638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13420 - BLOCK
    )
    :vars
    (
      ?auto_13422 - BLOCK
      ?auto_13421 - BLOCK
      ?auto_13423 - BLOCK
      ?auto_13424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13422 ?auto_13420 ) ( ON-TABLE ?auto_13420 ) ( not ( = ?auto_13420 ?auto_13422 ) ) ( not ( = ?auto_13420 ?auto_13421 ) ) ( not ( = ?auto_13420 ?auto_13423 ) ) ( not ( = ?auto_13422 ?auto_13421 ) ) ( not ( = ?auto_13422 ?auto_13423 ) ) ( not ( = ?auto_13421 ?auto_13423 ) ) ( ON ?auto_13421 ?auto_13422 ) ( not ( = ?auto_13424 ?auto_13423 ) ) ( not ( = ?auto_13420 ?auto_13424 ) ) ( not ( = ?auto_13422 ?auto_13424 ) ) ( not ( = ?auto_13421 ?auto_13424 ) ) ( ON ?auto_13423 ?auto_13421 ) ( CLEAR ?auto_13423 ) ( HOLDING ?auto_13424 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13424 )
      ( MAKE-1PILE ?auto_13420 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13425 - BLOCK
    )
    :vars
    (
      ?auto_13427 - BLOCK
      ?auto_13428 - BLOCK
      ?auto_13429 - BLOCK
      ?auto_13426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13427 ?auto_13425 ) ( ON-TABLE ?auto_13425 ) ( not ( = ?auto_13425 ?auto_13427 ) ) ( not ( = ?auto_13425 ?auto_13428 ) ) ( not ( = ?auto_13425 ?auto_13429 ) ) ( not ( = ?auto_13427 ?auto_13428 ) ) ( not ( = ?auto_13427 ?auto_13429 ) ) ( not ( = ?auto_13428 ?auto_13429 ) ) ( ON ?auto_13428 ?auto_13427 ) ( not ( = ?auto_13426 ?auto_13429 ) ) ( not ( = ?auto_13425 ?auto_13426 ) ) ( not ( = ?auto_13427 ?auto_13426 ) ) ( not ( = ?auto_13428 ?auto_13426 ) ) ( ON ?auto_13429 ?auto_13428 ) ( ON ?auto_13426 ?auto_13429 ) ( CLEAR ?auto_13426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13425 ?auto_13427 ?auto_13428 ?auto_13429 )
      ( MAKE-1PILE ?auto_13425 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13434 - BLOCK
      ?auto_13435 - BLOCK
      ?auto_13436 - BLOCK
      ?auto_13437 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13437 ) ( CLEAR ?auto_13436 ) ( ON-TABLE ?auto_13434 ) ( ON ?auto_13435 ?auto_13434 ) ( ON ?auto_13436 ?auto_13435 ) ( not ( = ?auto_13434 ?auto_13435 ) ) ( not ( = ?auto_13434 ?auto_13436 ) ) ( not ( = ?auto_13434 ?auto_13437 ) ) ( not ( = ?auto_13435 ?auto_13436 ) ) ( not ( = ?auto_13435 ?auto_13437 ) ) ( not ( = ?auto_13436 ?auto_13437 ) ) )
    :subtasks
    ( ( !STACK ?auto_13437 ?auto_13436 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13438 - BLOCK
      ?auto_13439 - BLOCK
      ?auto_13440 - BLOCK
      ?auto_13441 - BLOCK
    )
    :vars
    (
      ?auto_13442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13440 ) ( ON-TABLE ?auto_13438 ) ( ON ?auto_13439 ?auto_13438 ) ( ON ?auto_13440 ?auto_13439 ) ( not ( = ?auto_13438 ?auto_13439 ) ) ( not ( = ?auto_13438 ?auto_13440 ) ) ( not ( = ?auto_13438 ?auto_13441 ) ) ( not ( = ?auto_13439 ?auto_13440 ) ) ( not ( = ?auto_13439 ?auto_13441 ) ) ( not ( = ?auto_13440 ?auto_13441 ) ) ( ON ?auto_13441 ?auto_13442 ) ( CLEAR ?auto_13441 ) ( HAND-EMPTY ) ( not ( = ?auto_13438 ?auto_13442 ) ) ( not ( = ?auto_13439 ?auto_13442 ) ) ( not ( = ?auto_13440 ?auto_13442 ) ) ( not ( = ?auto_13441 ?auto_13442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13441 ?auto_13442 )
      ( MAKE-4PILE ?auto_13438 ?auto_13439 ?auto_13440 ?auto_13441 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13443 - BLOCK
      ?auto_13444 - BLOCK
      ?auto_13445 - BLOCK
      ?auto_13446 - BLOCK
    )
    :vars
    (
      ?auto_13447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13443 ) ( ON ?auto_13444 ?auto_13443 ) ( not ( = ?auto_13443 ?auto_13444 ) ) ( not ( = ?auto_13443 ?auto_13445 ) ) ( not ( = ?auto_13443 ?auto_13446 ) ) ( not ( = ?auto_13444 ?auto_13445 ) ) ( not ( = ?auto_13444 ?auto_13446 ) ) ( not ( = ?auto_13445 ?auto_13446 ) ) ( ON ?auto_13446 ?auto_13447 ) ( CLEAR ?auto_13446 ) ( not ( = ?auto_13443 ?auto_13447 ) ) ( not ( = ?auto_13444 ?auto_13447 ) ) ( not ( = ?auto_13445 ?auto_13447 ) ) ( not ( = ?auto_13446 ?auto_13447 ) ) ( HOLDING ?auto_13445 ) ( CLEAR ?auto_13444 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13443 ?auto_13444 ?auto_13445 )
      ( MAKE-4PILE ?auto_13443 ?auto_13444 ?auto_13445 ?auto_13446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13448 - BLOCK
      ?auto_13449 - BLOCK
      ?auto_13450 - BLOCK
      ?auto_13451 - BLOCK
    )
    :vars
    (
      ?auto_13452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13448 ) ( ON ?auto_13449 ?auto_13448 ) ( not ( = ?auto_13448 ?auto_13449 ) ) ( not ( = ?auto_13448 ?auto_13450 ) ) ( not ( = ?auto_13448 ?auto_13451 ) ) ( not ( = ?auto_13449 ?auto_13450 ) ) ( not ( = ?auto_13449 ?auto_13451 ) ) ( not ( = ?auto_13450 ?auto_13451 ) ) ( ON ?auto_13451 ?auto_13452 ) ( not ( = ?auto_13448 ?auto_13452 ) ) ( not ( = ?auto_13449 ?auto_13452 ) ) ( not ( = ?auto_13450 ?auto_13452 ) ) ( not ( = ?auto_13451 ?auto_13452 ) ) ( CLEAR ?auto_13449 ) ( ON ?auto_13450 ?auto_13451 ) ( CLEAR ?auto_13450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13452 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13452 ?auto_13451 )
      ( MAKE-4PILE ?auto_13448 ?auto_13449 ?auto_13450 ?auto_13451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13453 - BLOCK
      ?auto_13454 - BLOCK
      ?auto_13455 - BLOCK
      ?auto_13456 - BLOCK
    )
    :vars
    (
      ?auto_13457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13453 ) ( not ( = ?auto_13453 ?auto_13454 ) ) ( not ( = ?auto_13453 ?auto_13455 ) ) ( not ( = ?auto_13453 ?auto_13456 ) ) ( not ( = ?auto_13454 ?auto_13455 ) ) ( not ( = ?auto_13454 ?auto_13456 ) ) ( not ( = ?auto_13455 ?auto_13456 ) ) ( ON ?auto_13456 ?auto_13457 ) ( not ( = ?auto_13453 ?auto_13457 ) ) ( not ( = ?auto_13454 ?auto_13457 ) ) ( not ( = ?auto_13455 ?auto_13457 ) ) ( not ( = ?auto_13456 ?auto_13457 ) ) ( ON ?auto_13455 ?auto_13456 ) ( CLEAR ?auto_13455 ) ( ON-TABLE ?auto_13457 ) ( HOLDING ?auto_13454 ) ( CLEAR ?auto_13453 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13453 ?auto_13454 )
      ( MAKE-4PILE ?auto_13453 ?auto_13454 ?auto_13455 ?auto_13456 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13458 - BLOCK
      ?auto_13459 - BLOCK
      ?auto_13460 - BLOCK
      ?auto_13461 - BLOCK
    )
    :vars
    (
      ?auto_13462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13458 ) ( not ( = ?auto_13458 ?auto_13459 ) ) ( not ( = ?auto_13458 ?auto_13460 ) ) ( not ( = ?auto_13458 ?auto_13461 ) ) ( not ( = ?auto_13459 ?auto_13460 ) ) ( not ( = ?auto_13459 ?auto_13461 ) ) ( not ( = ?auto_13460 ?auto_13461 ) ) ( ON ?auto_13461 ?auto_13462 ) ( not ( = ?auto_13458 ?auto_13462 ) ) ( not ( = ?auto_13459 ?auto_13462 ) ) ( not ( = ?auto_13460 ?auto_13462 ) ) ( not ( = ?auto_13461 ?auto_13462 ) ) ( ON ?auto_13460 ?auto_13461 ) ( ON-TABLE ?auto_13462 ) ( CLEAR ?auto_13458 ) ( ON ?auto_13459 ?auto_13460 ) ( CLEAR ?auto_13459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13462 ?auto_13461 ?auto_13460 )
      ( MAKE-4PILE ?auto_13458 ?auto_13459 ?auto_13460 ?auto_13461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13463 - BLOCK
      ?auto_13464 - BLOCK
      ?auto_13465 - BLOCK
      ?auto_13466 - BLOCK
    )
    :vars
    (
      ?auto_13467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13463 ?auto_13464 ) ) ( not ( = ?auto_13463 ?auto_13465 ) ) ( not ( = ?auto_13463 ?auto_13466 ) ) ( not ( = ?auto_13464 ?auto_13465 ) ) ( not ( = ?auto_13464 ?auto_13466 ) ) ( not ( = ?auto_13465 ?auto_13466 ) ) ( ON ?auto_13466 ?auto_13467 ) ( not ( = ?auto_13463 ?auto_13467 ) ) ( not ( = ?auto_13464 ?auto_13467 ) ) ( not ( = ?auto_13465 ?auto_13467 ) ) ( not ( = ?auto_13466 ?auto_13467 ) ) ( ON ?auto_13465 ?auto_13466 ) ( ON-TABLE ?auto_13467 ) ( ON ?auto_13464 ?auto_13465 ) ( CLEAR ?auto_13464 ) ( HOLDING ?auto_13463 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13463 )
      ( MAKE-4PILE ?auto_13463 ?auto_13464 ?auto_13465 ?auto_13466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13468 - BLOCK
      ?auto_13469 - BLOCK
      ?auto_13470 - BLOCK
      ?auto_13471 - BLOCK
    )
    :vars
    (
      ?auto_13472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13468 ?auto_13469 ) ) ( not ( = ?auto_13468 ?auto_13470 ) ) ( not ( = ?auto_13468 ?auto_13471 ) ) ( not ( = ?auto_13469 ?auto_13470 ) ) ( not ( = ?auto_13469 ?auto_13471 ) ) ( not ( = ?auto_13470 ?auto_13471 ) ) ( ON ?auto_13471 ?auto_13472 ) ( not ( = ?auto_13468 ?auto_13472 ) ) ( not ( = ?auto_13469 ?auto_13472 ) ) ( not ( = ?auto_13470 ?auto_13472 ) ) ( not ( = ?auto_13471 ?auto_13472 ) ) ( ON ?auto_13470 ?auto_13471 ) ( ON-TABLE ?auto_13472 ) ( ON ?auto_13469 ?auto_13470 ) ( ON ?auto_13468 ?auto_13469 ) ( CLEAR ?auto_13468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13472 ?auto_13471 ?auto_13470 ?auto_13469 )
      ( MAKE-4PILE ?auto_13468 ?auto_13469 ?auto_13470 ?auto_13471 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13513 - BLOCK
    )
    :vars
    (
      ?auto_13514 - BLOCK
      ?auto_13515 - BLOCK
      ?auto_13516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13513 ?auto_13514 ) ( CLEAR ?auto_13513 ) ( not ( = ?auto_13513 ?auto_13514 ) ) ( HOLDING ?auto_13515 ) ( CLEAR ?auto_13516 ) ( not ( = ?auto_13513 ?auto_13515 ) ) ( not ( = ?auto_13513 ?auto_13516 ) ) ( not ( = ?auto_13514 ?auto_13515 ) ) ( not ( = ?auto_13514 ?auto_13516 ) ) ( not ( = ?auto_13515 ?auto_13516 ) ) )
    :subtasks
    ( ( !STACK ?auto_13515 ?auto_13516 )
      ( MAKE-1PILE ?auto_13513 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13517 - BLOCK
    )
    :vars
    (
      ?auto_13519 - BLOCK
      ?auto_13520 - BLOCK
      ?auto_13518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13517 ?auto_13519 ) ( not ( = ?auto_13517 ?auto_13519 ) ) ( CLEAR ?auto_13520 ) ( not ( = ?auto_13517 ?auto_13518 ) ) ( not ( = ?auto_13517 ?auto_13520 ) ) ( not ( = ?auto_13519 ?auto_13518 ) ) ( not ( = ?auto_13519 ?auto_13520 ) ) ( not ( = ?auto_13518 ?auto_13520 ) ) ( ON ?auto_13518 ?auto_13517 ) ( CLEAR ?auto_13518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13519 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13519 ?auto_13517 )
      ( MAKE-1PILE ?auto_13517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13521 - BLOCK
    )
    :vars
    (
      ?auto_13524 - BLOCK
      ?auto_13523 - BLOCK
      ?auto_13522 - BLOCK
      ?auto_13525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13521 ?auto_13524 ) ( not ( = ?auto_13521 ?auto_13524 ) ) ( not ( = ?auto_13521 ?auto_13523 ) ) ( not ( = ?auto_13521 ?auto_13522 ) ) ( not ( = ?auto_13524 ?auto_13523 ) ) ( not ( = ?auto_13524 ?auto_13522 ) ) ( not ( = ?auto_13523 ?auto_13522 ) ) ( ON ?auto_13523 ?auto_13521 ) ( CLEAR ?auto_13523 ) ( ON-TABLE ?auto_13524 ) ( HOLDING ?auto_13522 ) ( CLEAR ?auto_13525 ) ( ON-TABLE ?auto_13525 ) ( not ( = ?auto_13525 ?auto_13522 ) ) ( not ( = ?auto_13521 ?auto_13525 ) ) ( not ( = ?auto_13524 ?auto_13525 ) ) ( not ( = ?auto_13523 ?auto_13525 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13525 ?auto_13522 )
      ( MAKE-1PILE ?auto_13521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13526 - BLOCK
    )
    :vars
    (
      ?auto_13529 - BLOCK
      ?auto_13528 - BLOCK
      ?auto_13527 - BLOCK
      ?auto_13530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13526 ?auto_13529 ) ( not ( = ?auto_13526 ?auto_13529 ) ) ( not ( = ?auto_13526 ?auto_13528 ) ) ( not ( = ?auto_13526 ?auto_13527 ) ) ( not ( = ?auto_13529 ?auto_13528 ) ) ( not ( = ?auto_13529 ?auto_13527 ) ) ( not ( = ?auto_13528 ?auto_13527 ) ) ( ON ?auto_13528 ?auto_13526 ) ( ON-TABLE ?auto_13529 ) ( CLEAR ?auto_13530 ) ( ON-TABLE ?auto_13530 ) ( not ( = ?auto_13530 ?auto_13527 ) ) ( not ( = ?auto_13526 ?auto_13530 ) ) ( not ( = ?auto_13529 ?auto_13530 ) ) ( not ( = ?auto_13528 ?auto_13530 ) ) ( ON ?auto_13527 ?auto_13528 ) ( CLEAR ?auto_13527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13529 ?auto_13526 ?auto_13528 )
      ( MAKE-1PILE ?auto_13526 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13531 - BLOCK
    )
    :vars
    (
      ?auto_13533 - BLOCK
      ?auto_13534 - BLOCK
      ?auto_13532 - BLOCK
      ?auto_13535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13531 ?auto_13533 ) ( not ( = ?auto_13531 ?auto_13533 ) ) ( not ( = ?auto_13531 ?auto_13534 ) ) ( not ( = ?auto_13531 ?auto_13532 ) ) ( not ( = ?auto_13533 ?auto_13534 ) ) ( not ( = ?auto_13533 ?auto_13532 ) ) ( not ( = ?auto_13534 ?auto_13532 ) ) ( ON ?auto_13534 ?auto_13531 ) ( ON-TABLE ?auto_13533 ) ( not ( = ?auto_13535 ?auto_13532 ) ) ( not ( = ?auto_13531 ?auto_13535 ) ) ( not ( = ?auto_13533 ?auto_13535 ) ) ( not ( = ?auto_13534 ?auto_13535 ) ) ( ON ?auto_13532 ?auto_13534 ) ( CLEAR ?auto_13532 ) ( HOLDING ?auto_13535 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13535 )
      ( MAKE-1PILE ?auto_13531 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13536 - BLOCK
    )
    :vars
    (
      ?auto_13539 - BLOCK
      ?auto_13540 - BLOCK
      ?auto_13538 - BLOCK
      ?auto_13537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13536 ?auto_13539 ) ( not ( = ?auto_13536 ?auto_13539 ) ) ( not ( = ?auto_13536 ?auto_13540 ) ) ( not ( = ?auto_13536 ?auto_13538 ) ) ( not ( = ?auto_13539 ?auto_13540 ) ) ( not ( = ?auto_13539 ?auto_13538 ) ) ( not ( = ?auto_13540 ?auto_13538 ) ) ( ON ?auto_13540 ?auto_13536 ) ( ON-TABLE ?auto_13539 ) ( not ( = ?auto_13537 ?auto_13538 ) ) ( not ( = ?auto_13536 ?auto_13537 ) ) ( not ( = ?auto_13539 ?auto_13537 ) ) ( not ( = ?auto_13540 ?auto_13537 ) ) ( ON ?auto_13538 ?auto_13540 ) ( ON ?auto_13537 ?auto_13538 ) ( CLEAR ?auto_13537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13539 ?auto_13536 ?auto_13540 ?auto_13538 )
      ( MAKE-1PILE ?auto_13536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13546 - BLOCK
      ?auto_13547 - BLOCK
    )
    :vars
    (
      ?auto_13548 - BLOCK
      ?auto_13549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13548 ?auto_13547 ) ( CLEAR ?auto_13548 ) ( ON-TABLE ?auto_13546 ) ( ON ?auto_13547 ?auto_13546 ) ( not ( = ?auto_13546 ?auto_13547 ) ) ( not ( = ?auto_13546 ?auto_13548 ) ) ( not ( = ?auto_13547 ?auto_13548 ) ) ( HOLDING ?auto_13549 ) ( not ( = ?auto_13546 ?auto_13549 ) ) ( not ( = ?auto_13547 ?auto_13549 ) ) ( not ( = ?auto_13548 ?auto_13549 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13549 )
      ( MAKE-2PILE ?auto_13546 ?auto_13547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13583 - BLOCK
      ?auto_13584 - BLOCK
    )
    :vars
    (
      ?auto_13585 - BLOCK
      ?auto_13586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13583 ?auto_13584 ) ) ( ON ?auto_13584 ?auto_13585 ) ( not ( = ?auto_13583 ?auto_13585 ) ) ( not ( = ?auto_13584 ?auto_13585 ) ) ( ON ?auto_13583 ?auto_13584 ) ( CLEAR ?auto_13583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13586 ) ( ON ?auto_13585 ?auto_13586 ) ( not ( = ?auto_13586 ?auto_13585 ) ) ( not ( = ?auto_13586 ?auto_13584 ) ) ( not ( = ?auto_13586 ?auto_13583 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13586 ?auto_13585 ?auto_13584 )
      ( MAKE-2PILE ?auto_13583 ?auto_13584 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13589 - BLOCK
      ?auto_13590 - BLOCK
    )
    :vars
    (
      ?auto_13591 - BLOCK
      ?auto_13592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13589 ?auto_13590 ) ) ( ON ?auto_13590 ?auto_13591 ) ( CLEAR ?auto_13590 ) ( not ( = ?auto_13589 ?auto_13591 ) ) ( not ( = ?auto_13590 ?auto_13591 ) ) ( ON ?auto_13589 ?auto_13592 ) ( CLEAR ?auto_13589 ) ( HAND-EMPTY ) ( not ( = ?auto_13589 ?auto_13592 ) ) ( not ( = ?auto_13590 ?auto_13592 ) ) ( not ( = ?auto_13591 ?auto_13592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13589 ?auto_13592 )
      ( MAKE-2PILE ?auto_13589 ?auto_13590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13593 - BLOCK
      ?auto_13594 - BLOCK
    )
    :vars
    (
      ?auto_13595 - BLOCK
      ?auto_13596 - BLOCK
      ?auto_13597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13593 ?auto_13594 ) ) ( not ( = ?auto_13593 ?auto_13595 ) ) ( not ( = ?auto_13594 ?auto_13595 ) ) ( ON ?auto_13593 ?auto_13596 ) ( CLEAR ?auto_13593 ) ( not ( = ?auto_13593 ?auto_13596 ) ) ( not ( = ?auto_13594 ?auto_13596 ) ) ( not ( = ?auto_13595 ?auto_13596 ) ) ( HOLDING ?auto_13594 ) ( CLEAR ?auto_13595 ) ( ON-TABLE ?auto_13597 ) ( ON ?auto_13595 ?auto_13597 ) ( not ( = ?auto_13597 ?auto_13595 ) ) ( not ( = ?auto_13597 ?auto_13594 ) ) ( not ( = ?auto_13593 ?auto_13597 ) ) ( not ( = ?auto_13596 ?auto_13597 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13597 ?auto_13595 ?auto_13594 )
      ( MAKE-2PILE ?auto_13593 ?auto_13594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13598 - BLOCK
      ?auto_13599 - BLOCK
    )
    :vars
    (
      ?auto_13602 - BLOCK
      ?auto_13601 - BLOCK
      ?auto_13600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13598 ?auto_13599 ) ) ( not ( = ?auto_13598 ?auto_13602 ) ) ( not ( = ?auto_13599 ?auto_13602 ) ) ( ON ?auto_13598 ?auto_13601 ) ( not ( = ?auto_13598 ?auto_13601 ) ) ( not ( = ?auto_13599 ?auto_13601 ) ) ( not ( = ?auto_13602 ?auto_13601 ) ) ( CLEAR ?auto_13602 ) ( ON-TABLE ?auto_13600 ) ( ON ?auto_13602 ?auto_13600 ) ( not ( = ?auto_13600 ?auto_13602 ) ) ( not ( = ?auto_13600 ?auto_13599 ) ) ( not ( = ?auto_13598 ?auto_13600 ) ) ( not ( = ?auto_13601 ?auto_13600 ) ) ( ON ?auto_13599 ?auto_13598 ) ( CLEAR ?auto_13599 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13601 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13601 ?auto_13598 )
      ( MAKE-2PILE ?auto_13598 ?auto_13599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13603 - BLOCK
      ?auto_13604 - BLOCK
    )
    :vars
    (
      ?auto_13607 - BLOCK
      ?auto_13606 - BLOCK
      ?auto_13605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13603 ?auto_13604 ) ) ( not ( = ?auto_13603 ?auto_13607 ) ) ( not ( = ?auto_13604 ?auto_13607 ) ) ( ON ?auto_13603 ?auto_13606 ) ( not ( = ?auto_13603 ?auto_13606 ) ) ( not ( = ?auto_13604 ?auto_13606 ) ) ( not ( = ?auto_13607 ?auto_13606 ) ) ( ON-TABLE ?auto_13605 ) ( not ( = ?auto_13605 ?auto_13607 ) ) ( not ( = ?auto_13605 ?auto_13604 ) ) ( not ( = ?auto_13603 ?auto_13605 ) ) ( not ( = ?auto_13606 ?auto_13605 ) ) ( ON ?auto_13604 ?auto_13603 ) ( CLEAR ?auto_13604 ) ( ON-TABLE ?auto_13606 ) ( HOLDING ?auto_13607 ) ( CLEAR ?auto_13605 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13605 ?auto_13607 )
      ( MAKE-2PILE ?auto_13603 ?auto_13604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13608 - BLOCK
      ?auto_13609 - BLOCK
    )
    :vars
    (
      ?auto_13611 - BLOCK
      ?auto_13612 - BLOCK
      ?auto_13610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13608 ?auto_13609 ) ) ( not ( = ?auto_13608 ?auto_13611 ) ) ( not ( = ?auto_13609 ?auto_13611 ) ) ( ON ?auto_13608 ?auto_13612 ) ( not ( = ?auto_13608 ?auto_13612 ) ) ( not ( = ?auto_13609 ?auto_13612 ) ) ( not ( = ?auto_13611 ?auto_13612 ) ) ( ON-TABLE ?auto_13610 ) ( not ( = ?auto_13610 ?auto_13611 ) ) ( not ( = ?auto_13610 ?auto_13609 ) ) ( not ( = ?auto_13608 ?auto_13610 ) ) ( not ( = ?auto_13612 ?auto_13610 ) ) ( ON ?auto_13609 ?auto_13608 ) ( ON-TABLE ?auto_13612 ) ( CLEAR ?auto_13610 ) ( ON ?auto_13611 ?auto_13609 ) ( CLEAR ?auto_13611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13612 ?auto_13608 ?auto_13609 )
      ( MAKE-2PILE ?auto_13608 ?auto_13609 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13613 - BLOCK
      ?auto_13614 - BLOCK
    )
    :vars
    (
      ?auto_13616 - BLOCK
      ?auto_13617 - BLOCK
      ?auto_13615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13613 ?auto_13614 ) ) ( not ( = ?auto_13613 ?auto_13616 ) ) ( not ( = ?auto_13614 ?auto_13616 ) ) ( ON ?auto_13613 ?auto_13617 ) ( not ( = ?auto_13613 ?auto_13617 ) ) ( not ( = ?auto_13614 ?auto_13617 ) ) ( not ( = ?auto_13616 ?auto_13617 ) ) ( not ( = ?auto_13615 ?auto_13616 ) ) ( not ( = ?auto_13615 ?auto_13614 ) ) ( not ( = ?auto_13613 ?auto_13615 ) ) ( not ( = ?auto_13617 ?auto_13615 ) ) ( ON ?auto_13614 ?auto_13613 ) ( ON-TABLE ?auto_13617 ) ( ON ?auto_13616 ?auto_13614 ) ( CLEAR ?auto_13616 ) ( HOLDING ?auto_13615 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13615 )
      ( MAKE-2PILE ?auto_13613 ?auto_13614 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13618 - BLOCK
      ?auto_13619 - BLOCK
    )
    :vars
    (
      ?auto_13620 - BLOCK
      ?auto_13621 - BLOCK
      ?auto_13622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13618 ?auto_13619 ) ) ( not ( = ?auto_13618 ?auto_13620 ) ) ( not ( = ?auto_13619 ?auto_13620 ) ) ( ON ?auto_13618 ?auto_13621 ) ( not ( = ?auto_13618 ?auto_13621 ) ) ( not ( = ?auto_13619 ?auto_13621 ) ) ( not ( = ?auto_13620 ?auto_13621 ) ) ( not ( = ?auto_13622 ?auto_13620 ) ) ( not ( = ?auto_13622 ?auto_13619 ) ) ( not ( = ?auto_13618 ?auto_13622 ) ) ( not ( = ?auto_13621 ?auto_13622 ) ) ( ON ?auto_13619 ?auto_13618 ) ( ON-TABLE ?auto_13621 ) ( ON ?auto_13620 ?auto_13619 ) ( ON ?auto_13622 ?auto_13620 ) ( CLEAR ?auto_13622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13621 ?auto_13618 ?auto_13619 ?auto_13620 )
      ( MAKE-2PILE ?auto_13618 ?auto_13619 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13634 - BLOCK
    )
    :vars
    (
      ?auto_13636 - BLOCK
      ?auto_13637 - BLOCK
      ?auto_13635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13636 ?auto_13634 ) ( ON-TABLE ?auto_13634 ) ( not ( = ?auto_13634 ?auto_13636 ) ) ( not ( = ?auto_13634 ?auto_13637 ) ) ( not ( = ?auto_13634 ?auto_13635 ) ) ( not ( = ?auto_13636 ?auto_13637 ) ) ( not ( = ?auto_13636 ?auto_13635 ) ) ( not ( = ?auto_13637 ?auto_13635 ) ) ( ON ?auto_13637 ?auto_13636 ) ( CLEAR ?auto_13637 ) ( HOLDING ?auto_13635 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13635 )
      ( MAKE-1PILE ?auto_13634 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13667 - BLOCK
      ?auto_13668 - BLOCK
      ?auto_13669 - BLOCK
    )
    :vars
    (
      ?auto_13670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13667 ) ( not ( = ?auto_13667 ?auto_13668 ) ) ( not ( = ?auto_13667 ?auto_13669 ) ) ( not ( = ?auto_13668 ?auto_13669 ) ) ( ON ?auto_13669 ?auto_13670 ) ( not ( = ?auto_13667 ?auto_13670 ) ) ( not ( = ?auto_13668 ?auto_13670 ) ) ( not ( = ?auto_13669 ?auto_13670 ) ) ( CLEAR ?auto_13667 ) ( ON ?auto_13668 ?auto_13669 ) ( CLEAR ?auto_13668 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13670 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13670 ?auto_13669 )
      ( MAKE-3PILE ?auto_13667 ?auto_13668 ?auto_13669 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13671 - BLOCK
      ?auto_13672 - BLOCK
      ?auto_13673 - BLOCK
    )
    :vars
    (
      ?auto_13674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13671 ?auto_13672 ) ) ( not ( = ?auto_13671 ?auto_13673 ) ) ( not ( = ?auto_13672 ?auto_13673 ) ) ( ON ?auto_13673 ?auto_13674 ) ( not ( = ?auto_13671 ?auto_13674 ) ) ( not ( = ?auto_13672 ?auto_13674 ) ) ( not ( = ?auto_13673 ?auto_13674 ) ) ( ON ?auto_13672 ?auto_13673 ) ( CLEAR ?auto_13672 ) ( ON-TABLE ?auto_13674 ) ( HOLDING ?auto_13671 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13671 )
      ( MAKE-3PILE ?auto_13671 ?auto_13672 ?auto_13673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13675 - BLOCK
      ?auto_13676 - BLOCK
      ?auto_13677 - BLOCK
    )
    :vars
    (
      ?auto_13678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13675 ?auto_13676 ) ) ( not ( = ?auto_13675 ?auto_13677 ) ) ( not ( = ?auto_13676 ?auto_13677 ) ) ( ON ?auto_13677 ?auto_13678 ) ( not ( = ?auto_13675 ?auto_13678 ) ) ( not ( = ?auto_13676 ?auto_13678 ) ) ( not ( = ?auto_13677 ?auto_13678 ) ) ( ON ?auto_13676 ?auto_13677 ) ( ON-TABLE ?auto_13678 ) ( ON ?auto_13675 ?auto_13676 ) ( CLEAR ?auto_13675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13678 ?auto_13677 ?auto_13676 )
      ( MAKE-3PILE ?auto_13675 ?auto_13676 ?auto_13677 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13682 - BLOCK
      ?auto_13683 - BLOCK
      ?auto_13684 - BLOCK
    )
    :vars
    (
      ?auto_13685 - BLOCK
      ?auto_13686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13682 ?auto_13683 ) ) ( not ( = ?auto_13682 ?auto_13684 ) ) ( not ( = ?auto_13683 ?auto_13684 ) ) ( ON ?auto_13684 ?auto_13685 ) ( not ( = ?auto_13682 ?auto_13685 ) ) ( not ( = ?auto_13683 ?auto_13685 ) ) ( not ( = ?auto_13684 ?auto_13685 ) ) ( ON ?auto_13683 ?auto_13684 ) ( CLEAR ?auto_13683 ) ( ON-TABLE ?auto_13685 ) ( ON ?auto_13682 ?auto_13686 ) ( CLEAR ?auto_13682 ) ( HAND-EMPTY ) ( not ( = ?auto_13682 ?auto_13686 ) ) ( not ( = ?auto_13683 ?auto_13686 ) ) ( not ( = ?auto_13684 ?auto_13686 ) ) ( not ( = ?auto_13685 ?auto_13686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13682 ?auto_13686 )
      ( MAKE-3PILE ?auto_13682 ?auto_13683 ?auto_13684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13687 - BLOCK
      ?auto_13688 - BLOCK
      ?auto_13689 - BLOCK
    )
    :vars
    (
      ?auto_13691 - BLOCK
      ?auto_13690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13687 ?auto_13688 ) ) ( not ( = ?auto_13687 ?auto_13689 ) ) ( not ( = ?auto_13688 ?auto_13689 ) ) ( ON ?auto_13689 ?auto_13691 ) ( not ( = ?auto_13687 ?auto_13691 ) ) ( not ( = ?auto_13688 ?auto_13691 ) ) ( not ( = ?auto_13689 ?auto_13691 ) ) ( ON-TABLE ?auto_13691 ) ( ON ?auto_13687 ?auto_13690 ) ( CLEAR ?auto_13687 ) ( not ( = ?auto_13687 ?auto_13690 ) ) ( not ( = ?auto_13688 ?auto_13690 ) ) ( not ( = ?auto_13689 ?auto_13690 ) ) ( not ( = ?auto_13691 ?auto_13690 ) ) ( HOLDING ?auto_13688 ) ( CLEAR ?auto_13689 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13691 ?auto_13689 ?auto_13688 )
      ( MAKE-3PILE ?auto_13687 ?auto_13688 ?auto_13689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13692 - BLOCK
      ?auto_13693 - BLOCK
      ?auto_13694 - BLOCK
    )
    :vars
    (
      ?auto_13696 - BLOCK
      ?auto_13695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13692 ?auto_13693 ) ) ( not ( = ?auto_13692 ?auto_13694 ) ) ( not ( = ?auto_13693 ?auto_13694 ) ) ( ON ?auto_13694 ?auto_13696 ) ( not ( = ?auto_13692 ?auto_13696 ) ) ( not ( = ?auto_13693 ?auto_13696 ) ) ( not ( = ?auto_13694 ?auto_13696 ) ) ( ON-TABLE ?auto_13696 ) ( ON ?auto_13692 ?auto_13695 ) ( not ( = ?auto_13692 ?auto_13695 ) ) ( not ( = ?auto_13693 ?auto_13695 ) ) ( not ( = ?auto_13694 ?auto_13695 ) ) ( not ( = ?auto_13696 ?auto_13695 ) ) ( CLEAR ?auto_13694 ) ( ON ?auto_13693 ?auto_13692 ) ( CLEAR ?auto_13693 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13695 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13695 ?auto_13692 )
      ( MAKE-3PILE ?auto_13692 ?auto_13693 ?auto_13694 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13697 - BLOCK
      ?auto_13698 - BLOCK
      ?auto_13699 - BLOCK
    )
    :vars
    (
      ?auto_13700 - BLOCK
      ?auto_13701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13697 ?auto_13698 ) ) ( not ( = ?auto_13697 ?auto_13699 ) ) ( not ( = ?auto_13698 ?auto_13699 ) ) ( not ( = ?auto_13697 ?auto_13700 ) ) ( not ( = ?auto_13698 ?auto_13700 ) ) ( not ( = ?auto_13699 ?auto_13700 ) ) ( ON-TABLE ?auto_13700 ) ( ON ?auto_13697 ?auto_13701 ) ( not ( = ?auto_13697 ?auto_13701 ) ) ( not ( = ?auto_13698 ?auto_13701 ) ) ( not ( = ?auto_13699 ?auto_13701 ) ) ( not ( = ?auto_13700 ?auto_13701 ) ) ( ON ?auto_13698 ?auto_13697 ) ( CLEAR ?auto_13698 ) ( ON-TABLE ?auto_13701 ) ( HOLDING ?auto_13699 ) ( CLEAR ?auto_13700 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13700 ?auto_13699 )
      ( MAKE-3PILE ?auto_13697 ?auto_13698 ?auto_13699 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13702 - BLOCK
      ?auto_13703 - BLOCK
      ?auto_13704 - BLOCK
    )
    :vars
    (
      ?auto_13705 - BLOCK
      ?auto_13706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13702 ?auto_13703 ) ) ( not ( = ?auto_13702 ?auto_13704 ) ) ( not ( = ?auto_13703 ?auto_13704 ) ) ( not ( = ?auto_13702 ?auto_13705 ) ) ( not ( = ?auto_13703 ?auto_13705 ) ) ( not ( = ?auto_13704 ?auto_13705 ) ) ( ON-TABLE ?auto_13705 ) ( ON ?auto_13702 ?auto_13706 ) ( not ( = ?auto_13702 ?auto_13706 ) ) ( not ( = ?auto_13703 ?auto_13706 ) ) ( not ( = ?auto_13704 ?auto_13706 ) ) ( not ( = ?auto_13705 ?auto_13706 ) ) ( ON ?auto_13703 ?auto_13702 ) ( ON-TABLE ?auto_13706 ) ( CLEAR ?auto_13705 ) ( ON ?auto_13704 ?auto_13703 ) ( CLEAR ?auto_13704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13706 ?auto_13702 ?auto_13703 )
      ( MAKE-3PILE ?auto_13702 ?auto_13703 ?auto_13704 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13707 - BLOCK
      ?auto_13708 - BLOCK
      ?auto_13709 - BLOCK
    )
    :vars
    (
      ?auto_13710 - BLOCK
      ?auto_13711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13707 ?auto_13708 ) ) ( not ( = ?auto_13707 ?auto_13709 ) ) ( not ( = ?auto_13708 ?auto_13709 ) ) ( not ( = ?auto_13707 ?auto_13710 ) ) ( not ( = ?auto_13708 ?auto_13710 ) ) ( not ( = ?auto_13709 ?auto_13710 ) ) ( ON ?auto_13707 ?auto_13711 ) ( not ( = ?auto_13707 ?auto_13711 ) ) ( not ( = ?auto_13708 ?auto_13711 ) ) ( not ( = ?auto_13709 ?auto_13711 ) ) ( not ( = ?auto_13710 ?auto_13711 ) ) ( ON ?auto_13708 ?auto_13707 ) ( ON-TABLE ?auto_13711 ) ( ON ?auto_13709 ?auto_13708 ) ( CLEAR ?auto_13709 ) ( HOLDING ?auto_13710 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13710 )
      ( MAKE-3PILE ?auto_13707 ?auto_13708 ?auto_13709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13712 - BLOCK
      ?auto_13713 - BLOCK
      ?auto_13714 - BLOCK
    )
    :vars
    (
      ?auto_13715 - BLOCK
      ?auto_13716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13712 ?auto_13713 ) ) ( not ( = ?auto_13712 ?auto_13714 ) ) ( not ( = ?auto_13713 ?auto_13714 ) ) ( not ( = ?auto_13712 ?auto_13715 ) ) ( not ( = ?auto_13713 ?auto_13715 ) ) ( not ( = ?auto_13714 ?auto_13715 ) ) ( ON ?auto_13712 ?auto_13716 ) ( not ( = ?auto_13712 ?auto_13716 ) ) ( not ( = ?auto_13713 ?auto_13716 ) ) ( not ( = ?auto_13714 ?auto_13716 ) ) ( not ( = ?auto_13715 ?auto_13716 ) ) ( ON ?auto_13713 ?auto_13712 ) ( ON-TABLE ?auto_13716 ) ( ON ?auto_13714 ?auto_13713 ) ( ON ?auto_13715 ?auto_13714 ) ( CLEAR ?auto_13715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13716 ?auto_13712 ?auto_13713 ?auto_13714 )
      ( MAKE-3PILE ?auto_13712 ?auto_13713 ?auto_13714 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13725 - BLOCK
      ?auto_13726 - BLOCK
      ?auto_13727 - BLOCK
      ?auto_13728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13727 ) ( ON-TABLE ?auto_13725 ) ( ON ?auto_13726 ?auto_13725 ) ( ON ?auto_13727 ?auto_13726 ) ( not ( = ?auto_13725 ?auto_13726 ) ) ( not ( = ?auto_13725 ?auto_13727 ) ) ( not ( = ?auto_13725 ?auto_13728 ) ) ( not ( = ?auto_13726 ?auto_13727 ) ) ( not ( = ?auto_13726 ?auto_13728 ) ) ( not ( = ?auto_13727 ?auto_13728 ) ) ( ON-TABLE ?auto_13728 ) ( CLEAR ?auto_13728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_13728 )
      ( MAKE-4PILE ?auto_13725 ?auto_13726 ?auto_13727 ?auto_13728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13729 - BLOCK
      ?auto_13730 - BLOCK
      ?auto_13731 - BLOCK
      ?auto_13732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13729 ) ( ON ?auto_13730 ?auto_13729 ) ( not ( = ?auto_13729 ?auto_13730 ) ) ( not ( = ?auto_13729 ?auto_13731 ) ) ( not ( = ?auto_13729 ?auto_13732 ) ) ( not ( = ?auto_13730 ?auto_13731 ) ) ( not ( = ?auto_13730 ?auto_13732 ) ) ( not ( = ?auto_13731 ?auto_13732 ) ) ( ON-TABLE ?auto_13732 ) ( CLEAR ?auto_13732 ) ( HOLDING ?auto_13731 ) ( CLEAR ?auto_13730 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13729 ?auto_13730 ?auto_13731 )
      ( MAKE-4PILE ?auto_13729 ?auto_13730 ?auto_13731 ?auto_13732 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13733 - BLOCK
      ?auto_13734 - BLOCK
      ?auto_13735 - BLOCK
      ?auto_13736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13733 ) ( ON ?auto_13734 ?auto_13733 ) ( not ( = ?auto_13733 ?auto_13734 ) ) ( not ( = ?auto_13733 ?auto_13735 ) ) ( not ( = ?auto_13733 ?auto_13736 ) ) ( not ( = ?auto_13734 ?auto_13735 ) ) ( not ( = ?auto_13734 ?auto_13736 ) ) ( not ( = ?auto_13735 ?auto_13736 ) ) ( ON-TABLE ?auto_13736 ) ( CLEAR ?auto_13734 ) ( ON ?auto_13735 ?auto_13736 ) ( CLEAR ?auto_13735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13736 )
      ( MAKE-4PILE ?auto_13733 ?auto_13734 ?auto_13735 ?auto_13736 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13737 - BLOCK
      ?auto_13738 - BLOCK
      ?auto_13739 - BLOCK
      ?auto_13740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13737 ) ( not ( = ?auto_13737 ?auto_13738 ) ) ( not ( = ?auto_13737 ?auto_13739 ) ) ( not ( = ?auto_13737 ?auto_13740 ) ) ( not ( = ?auto_13738 ?auto_13739 ) ) ( not ( = ?auto_13738 ?auto_13740 ) ) ( not ( = ?auto_13739 ?auto_13740 ) ) ( ON-TABLE ?auto_13740 ) ( ON ?auto_13739 ?auto_13740 ) ( CLEAR ?auto_13739 ) ( HOLDING ?auto_13738 ) ( CLEAR ?auto_13737 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13737 ?auto_13738 )
      ( MAKE-4PILE ?auto_13737 ?auto_13738 ?auto_13739 ?auto_13740 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13741 - BLOCK
      ?auto_13742 - BLOCK
      ?auto_13743 - BLOCK
      ?auto_13744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13741 ) ( not ( = ?auto_13741 ?auto_13742 ) ) ( not ( = ?auto_13741 ?auto_13743 ) ) ( not ( = ?auto_13741 ?auto_13744 ) ) ( not ( = ?auto_13742 ?auto_13743 ) ) ( not ( = ?auto_13742 ?auto_13744 ) ) ( not ( = ?auto_13743 ?auto_13744 ) ) ( ON-TABLE ?auto_13744 ) ( ON ?auto_13743 ?auto_13744 ) ( CLEAR ?auto_13741 ) ( ON ?auto_13742 ?auto_13743 ) ( CLEAR ?auto_13742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13744 ?auto_13743 )
      ( MAKE-4PILE ?auto_13741 ?auto_13742 ?auto_13743 ?auto_13744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13745 - BLOCK
      ?auto_13746 - BLOCK
      ?auto_13747 - BLOCK
      ?auto_13748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13745 ?auto_13746 ) ) ( not ( = ?auto_13745 ?auto_13747 ) ) ( not ( = ?auto_13745 ?auto_13748 ) ) ( not ( = ?auto_13746 ?auto_13747 ) ) ( not ( = ?auto_13746 ?auto_13748 ) ) ( not ( = ?auto_13747 ?auto_13748 ) ) ( ON-TABLE ?auto_13748 ) ( ON ?auto_13747 ?auto_13748 ) ( ON ?auto_13746 ?auto_13747 ) ( CLEAR ?auto_13746 ) ( HOLDING ?auto_13745 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13745 )
      ( MAKE-4PILE ?auto_13745 ?auto_13746 ?auto_13747 ?auto_13748 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13749 - BLOCK
      ?auto_13750 - BLOCK
      ?auto_13751 - BLOCK
      ?auto_13752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13749 ?auto_13750 ) ) ( not ( = ?auto_13749 ?auto_13751 ) ) ( not ( = ?auto_13749 ?auto_13752 ) ) ( not ( = ?auto_13750 ?auto_13751 ) ) ( not ( = ?auto_13750 ?auto_13752 ) ) ( not ( = ?auto_13751 ?auto_13752 ) ) ( ON-TABLE ?auto_13752 ) ( ON ?auto_13751 ?auto_13752 ) ( ON ?auto_13750 ?auto_13751 ) ( ON ?auto_13749 ?auto_13750 ) ( CLEAR ?auto_13749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13752 ?auto_13751 ?auto_13750 )
      ( MAKE-4PILE ?auto_13749 ?auto_13750 ?auto_13751 ?auto_13752 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13757 - BLOCK
      ?auto_13758 - BLOCK
      ?auto_13759 - BLOCK
      ?auto_13760 - BLOCK
    )
    :vars
    (
      ?auto_13761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13757 ?auto_13758 ) ) ( not ( = ?auto_13757 ?auto_13759 ) ) ( not ( = ?auto_13757 ?auto_13760 ) ) ( not ( = ?auto_13758 ?auto_13759 ) ) ( not ( = ?auto_13758 ?auto_13760 ) ) ( not ( = ?auto_13759 ?auto_13760 ) ) ( ON-TABLE ?auto_13760 ) ( ON ?auto_13759 ?auto_13760 ) ( ON ?auto_13758 ?auto_13759 ) ( CLEAR ?auto_13758 ) ( ON ?auto_13757 ?auto_13761 ) ( CLEAR ?auto_13757 ) ( HAND-EMPTY ) ( not ( = ?auto_13757 ?auto_13761 ) ) ( not ( = ?auto_13758 ?auto_13761 ) ) ( not ( = ?auto_13759 ?auto_13761 ) ) ( not ( = ?auto_13760 ?auto_13761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13757 ?auto_13761 )
      ( MAKE-4PILE ?auto_13757 ?auto_13758 ?auto_13759 ?auto_13760 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13762 - BLOCK
      ?auto_13763 - BLOCK
      ?auto_13764 - BLOCK
      ?auto_13765 - BLOCK
    )
    :vars
    (
      ?auto_13766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13762 ?auto_13763 ) ) ( not ( = ?auto_13762 ?auto_13764 ) ) ( not ( = ?auto_13762 ?auto_13765 ) ) ( not ( = ?auto_13763 ?auto_13764 ) ) ( not ( = ?auto_13763 ?auto_13765 ) ) ( not ( = ?auto_13764 ?auto_13765 ) ) ( ON-TABLE ?auto_13765 ) ( ON ?auto_13764 ?auto_13765 ) ( ON ?auto_13762 ?auto_13766 ) ( CLEAR ?auto_13762 ) ( not ( = ?auto_13762 ?auto_13766 ) ) ( not ( = ?auto_13763 ?auto_13766 ) ) ( not ( = ?auto_13764 ?auto_13766 ) ) ( not ( = ?auto_13765 ?auto_13766 ) ) ( HOLDING ?auto_13763 ) ( CLEAR ?auto_13764 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13765 ?auto_13764 ?auto_13763 )
      ( MAKE-4PILE ?auto_13762 ?auto_13763 ?auto_13764 ?auto_13765 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13767 - BLOCK
      ?auto_13768 - BLOCK
      ?auto_13769 - BLOCK
      ?auto_13770 - BLOCK
    )
    :vars
    (
      ?auto_13771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13767 ?auto_13768 ) ) ( not ( = ?auto_13767 ?auto_13769 ) ) ( not ( = ?auto_13767 ?auto_13770 ) ) ( not ( = ?auto_13768 ?auto_13769 ) ) ( not ( = ?auto_13768 ?auto_13770 ) ) ( not ( = ?auto_13769 ?auto_13770 ) ) ( ON-TABLE ?auto_13770 ) ( ON ?auto_13769 ?auto_13770 ) ( ON ?auto_13767 ?auto_13771 ) ( not ( = ?auto_13767 ?auto_13771 ) ) ( not ( = ?auto_13768 ?auto_13771 ) ) ( not ( = ?auto_13769 ?auto_13771 ) ) ( not ( = ?auto_13770 ?auto_13771 ) ) ( CLEAR ?auto_13769 ) ( ON ?auto_13768 ?auto_13767 ) ( CLEAR ?auto_13768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13771 ?auto_13767 )
      ( MAKE-4PILE ?auto_13767 ?auto_13768 ?auto_13769 ?auto_13770 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13772 - BLOCK
      ?auto_13773 - BLOCK
      ?auto_13774 - BLOCK
      ?auto_13775 - BLOCK
    )
    :vars
    (
      ?auto_13776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13772 ?auto_13773 ) ) ( not ( = ?auto_13772 ?auto_13774 ) ) ( not ( = ?auto_13772 ?auto_13775 ) ) ( not ( = ?auto_13773 ?auto_13774 ) ) ( not ( = ?auto_13773 ?auto_13775 ) ) ( not ( = ?auto_13774 ?auto_13775 ) ) ( ON-TABLE ?auto_13775 ) ( ON ?auto_13772 ?auto_13776 ) ( not ( = ?auto_13772 ?auto_13776 ) ) ( not ( = ?auto_13773 ?auto_13776 ) ) ( not ( = ?auto_13774 ?auto_13776 ) ) ( not ( = ?auto_13775 ?auto_13776 ) ) ( ON ?auto_13773 ?auto_13772 ) ( CLEAR ?auto_13773 ) ( ON-TABLE ?auto_13776 ) ( HOLDING ?auto_13774 ) ( CLEAR ?auto_13775 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13775 ?auto_13774 )
      ( MAKE-4PILE ?auto_13772 ?auto_13773 ?auto_13774 ?auto_13775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13777 - BLOCK
      ?auto_13778 - BLOCK
      ?auto_13779 - BLOCK
      ?auto_13780 - BLOCK
    )
    :vars
    (
      ?auto_13781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13777 ?auto_13778 ) ) ( not ( = ?auto_13777 ?auto_13779 ) ) ( not ( = ?auto_13777 ?auto_13780 ) ) ( not ( = ?auto_13778 ?auto_13779 ) ) ( not ( = ?auto_13778 ?auto_13780 ) ) ( not ( = ?auto_13779 ?auto_13780 ) ) ( ON-TABLE ?auto_13780 ) ( ON ?auto_13777 ?auto_13781 ) ( not ( = ?auto_13777 ?auto_13781 ) ) ( not ( = ?auto_13778 ?auto_13781 ) ) ( not ( = ?auto_13779 ?auto_13781 ) ) ( not ( = ?auto_13780 ?auto_13781 ) ) ( ON ?auto_13778 ?auto_13777 ) ( ON-TABLE ?auto_13781 ) ( CLEAR ?auto_13780 ) ( ON ?auto_13779 ?auto_13778 ) ( CLEAR ?auto_13779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13781 ?auto_13777 ?auto_13778 )
      ( MAKE-4PILE ?auto_13777 ?auto_13778 ?auto_13779 ?auto_13780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13782 - BLOCK
      ?auto_13783 - BLOCK
      ?auto_13784 - BLOCK
      ?auto_13785 - BLOCK
    )
    :vars
    (
      ?auto_13786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13782 ?auto_13783 ) ) ( not ( = ?auto_13782 ?auto_13784 ) ) ( not ( = ?auto_13782 ?auto_13785 ) ) ( not ( = ?auto_13783 ?auto_13784 ) ) ( not ( = ?auto_13783 ?auto_13785 ) ) ( not ( = ?auto_13784 ?auto_13785 ) ) ( ON ?auto_13782 ?auto_13786 ) ( not ( = ?auto_13782 ?auto_13786 ) ) ( not ( = ?auto_13783 ?auto_13786 ) ) ( not ( = ?auto_13784 ?auto_13786 ) ) ( not ( = ?auto_13785 ?auto_13786 ) ) ( ON ?auto_13783 ?auto_13782 ) ( ON-TABLE ?auto_13786 ) ( ON ?auto_13784 ?auto_13783 ) ( CLEAR ?auto_13784 ) ( HOLDING ?auto_13785 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13785 )
      ( MAKE-4PILE ?auto_13782 ?auto_13783 ?auto_13784 ?auto_13785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13787 - BLOCK
      ?auto_13788 - BLOCK
      ?auto_13789 - BLOCK
      ?auto_13790 - BLOCK
    )
    :vars
    (
      ?auto_13791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13787 ?auto_13788 ) ) ( not ( = ?auto_13787 ?auto_13789 ) ) ( not ( = ?auto_13787 ?auto_13790 ) ) ( not ( = ?auto_13788 ?auto_13789 ) ) ( not ( = ?auto_13788 ?auto_13790 ) ) ( not ( = ?auto_13789 ?auto_13790 ) ) ( ON ?auto_13787 ?auto_13791 ) ( not ( = ?auto_13787 ?auto_13791 ) ) ( not ( = ?auto_13788 ?auto_13791 ) ) ( not ( = ?auto_13789 ?auto_13791 ) ) ( not ( = ?auto_13790 ?auto_13791 ) ) ( ON ?auto_13788 ?auto_13787 ) ( ON-TABLE ?auto_13791 ) ( ON ?auto_13789 ?auto_13788 ) ( ON ?auto_13790 ?auto_13789 ) ( CLEAR ?auto_13790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13791 ?auto_13787 ?auto_13788 ?auto_13789 )
      ( MAKE-4PILE ?auto_13787 ?auto_13788 ?auto_13789 ?auto_13790 ) )
  )

)

