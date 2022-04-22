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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109321 - BLOCK
      ?auto_109322 - BLOCK
      ?auto_109323 - BLOCK
      ?auto_109324 - BLOCK
      ?auto_109325 - BLOCK
      ?auto_109326 - BLOCK
      ?auto_109327 - BLOCK
    )
    :vars
    (
      ?auto_109328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109328 ?auto_109327 ) ( CLEAR ?auto_109328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109321 ) ( ON ?auto_109322 ?auto_109321 ) ( ON ?auto_109323 ?auto_109322 ) ( ON ?auto_109324 ?auto_109323 ) ( ON ?auto_109325 ?auto_109324 ) ( ON ?auto_109326 ?auto_109325 ) ( ON ?auto_109327 ?auto_109326 ) ( not ( = ?auto_109321 ?auto_109322 ) ) ( not ( = ?auto_109321 ?auto_109323 ) ) ( not ( = ?auto_109321 ?auto_109324 ) ) ( not ( = ?auto_109321 ?auto_109325 ) ) ( not ( = ?auto_109321 ?auto_109326 ) ) ( not ( = ?auto_109321 ?auto_109327 ) ) ( not ( = ?auto_109321 ?auto_109328 ) ) ( not ( = ?auto_109322 ?auto_109323 ) ) ( not ( = ?auto_109322 ?auto_109324 ) ) ( not ( = ?auto_109322 ?auto_109325 ) ) ( not ( = ?auto_109322 ?auto_109326 ) ) ( not ( = ?auto_109322 ?auto_109327 ) ) ( not ( = ?auto_109322 ?auto_109328 ) ) ( not ( = ?auto_109323 ?auto_109324 ) ) ( not ( = ?auto_109323 ?auto_109325 ) ) ( not ( = ?auto_109323 ?auto_109326 ) ) ( not ( = ?auto_109323 ?auto_109327 ) ) ( not ( = ?auto_109323 ?auto_109328 ) ) ( not ( = ?auto_109324 ?auto_109325 ) ) ( not ( = ?auto_109324 ?auto_109326 ) ) ( not ( = ?auto_109324 ?auto_109327 ) ) ( not ( = ?auto_109324 ?auto_109328 ) ) ( not ( = ?auto_109325 ?auto_109326 ) ) ( not ( = ?auto_109325 ?auto_109327 ) ) ( not ( = ?auto_109325 ?auto_109328 ) ) ( not ( = ?auto_109326 ?auto_109327 ) ) ( not ( = ?auto_109326 ?auto_109328 ) ) ( not ( = ?auto_109327 ?auto_109328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109328 ?auto_109327 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109330 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_109330 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_109330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109331 - BLOCK
    )
    :vars
    (
      ?auto_109332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109331 ?auto_109332 ) ( CLEAR ?auto_109331 ) ( HAND-EMPTY ) ( not ( = ?auto_109331 ?auto_109332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109331 ?auto_109332 )
      ( MAKE-1PILE ?auto_109331 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109339 - BLOCK
      ?auto_109340 - BLOCK
      ?auto_109341 - BLOCK
      ?auto_109342 - BLOCK
      ?auto_109343 - BLOCK
      ?auto_109344 - BLOCK
    )
    :vars
    (
      ?auto_109345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109345 ?auto_109344 ) ( CLEAR ?auto_109345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109339 ) ( ON ?auto_109340 ?auto_109339 ) ( ON ?auto_109341 ?auto_109340 ) ( ON ?auto_109342 ?auto_109341 ) ( ON ?auto_109343 ?auto_109342 ) ( ON ?auto_109344 ?auto_109343 ) ( not ( = ?auto_109339 ?auto_109340 ) ) ( not ( = ?auto_109339 ?auto_109341 ) ) ( not ( = ?auto_109339 ?auto_109342 ) ) ( not ( = ?auto_109339 ?auto_109343 ) ) ( not ( = ?auto_109339 ?auto_109344 ) ) ( not ( = ?auto_109339 ?auto_109345 ) ) ( not ( = ?auto_109340 ?auto_109341 ) ) ( not ( = ?auto_109340 ?auto_109342 ) ) ( not ( = ?auto_109340 ?auto_109343 ) ) ( not ( = ?auto_109340 ?auto_109344 ) ) ( not ( = ?auto_109340 ?auto_109345 ) ) ( not ( = ?auto_109341 ?auto_109342 ) ) ( not ( = ?auto_109341 ?auto_109343 ) ) ( not ( = ?auto_109341 ?auto_109344 ) ) ( not ( = ?auto_109341 ?auto_109345 ) ) ( not ( = ?auto_109342 ?auto_109343 ) ) ( not ( = ?auto_109342 ?auto_109344 ) ) ( not ( = ?auto_109342 ?auto_109345 ) ) ( not ( = ?auto_109343 ?auto_109344 ) ) ( not ( = ?auto_109343 ?auto_109345 ) ) ( not ( = ?auto_109344 ?auto_109345 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109345 ?auto_109344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109346 - BLOCK
      ?auto_109347 - BLOCK
      ?auto_109348 - BLOCK
      ?auto_109349 - BLOCK
      ?auto_109350 - BLOCK
      ?auto_109351 - BLOCK
    )
    :vars
    (
      ?auto_109352 - BLOCK
      ?auto_109353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109352 ?auto_109351 ) ( CLEAR ?auto_109352 ) ( ON-TABLE ?auto_109346 ) ( ON ?auto_109347 ?auto_109346 ) ( ON ?auto_109348 ?auto_109347 ) ( ON ?auto_109349 ?auto_109348 ) ( ON ?auto_109350 ?auto_109349 ) ( ON ?auto_109351 ?auto_109350 ) ( not ( = ?auto_109346 ?auto_109347 ) ) ( not ( = ?auto_109346 ?auto_109348 ) ) ( not ( = ?auto_109346 ?auto_109349 ) ) ( not ( = ?auto_109346 ?auto_109350 ) ) ( not ( = ?auto_109346 ?auto_109351 ) ) ( not ( = ?auto_109346 ?auto_109352 ) ) ( not ( = ?auto_109347 ?auto_109348 ) ) ( not ( = ?auto_109347 ?auto_109349 ) ) ( not ( = ?auto_109347 ?auto_109350 ) ) ( not ( = ?auto_109347 ?auto_109351 ) ) ( not ( = ?auto_109347 ?auto_109352 ) ) ( not ( = ?auto_109348 ?auto_109349 ) ) ( not ( = ?auto_109348 ?auto_109350 ) ) ( not ( = ?auto_109348 ?auto_109351 ) ) ( not ( = ?auto_109348 ?auto_109352 ) ) ( not ( = ?auto_109349 ?auto_109350 ) ) ( not ( = ?auto_109349 ?auto_109351 ) ) ( not ( = ?auto_109349 ?auto_109352 ) ) ( not ( = ?auto_109350 ?auto_109351 ) ) ( not ( = ?auto_109350 ?auto_109352 ) ) ( not ( = ?auto_109351 ?auto_109352 ) ) ( HOLDING ?auto_109353 ) ( not ( = ?auto_109346 ?auto_109353 ) ) ( not ( = ?auto_109347 ?auto_109353 ) ) ( not ( = ?auto_109348 ?auto_109353 ) ) ( not ( = ?auto_109349 ?auto_109353 ) ) ( not ( = ?auto_109350 ?auto_109353 ) ) ( not ( = ?auto_109351 ?auto_109353 ) ) ( not ( = ?auto_109352 ?auto_109353 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_109353 )
      ( MAKE-6PILE ?auto_109346 ?auto_109347 ?auto_109348 ?auto_109349 ?auto_109350 ?auto_109351 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109354 - BLOCK
      ?auto_109355 - BLOCK
      ?auto_109356 - BLOCK
      ?auto_109357 - BLOCK
      ?auto_109358 - BLOCK
      ?auto_109359 - BLOCK
    )
    :vars
    (
      ?auto_109360 - BLOCK
      ?auto_109361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109360 ?auto_109359 ) ( ON-TABLE ?auto_109354 ) ( ON ?auto_109355 ?auto_109354 ) ( ON ?auto_109356 ?auto_109355 ) ( ON ?auto_109357 ?auto_109356 ) ( ON ?auto_109358 ?auto_109357 ) ( ON ?auto_109359 ?auto_109358 ) ( not ( = ?auto_109354 ?auto_109355 ) ) ( not ( = ?auto_109354 ?auto_109356 ) ) ( not ( = ?auto_109354 ?auto_109357 ) ) ( not ( = ?auto_109354 ?auto_109358 ) ) ( not ( = ?auto_109354 ?auto_109359 ) ) ( not ( = ?auto_109354 ?auto_109360 ) ) ( not ( = ?auto_109355 ?auto_109356 ) ) ( not ( = ?auto_109355 ?auto_109357 ) ) ( not ( = ?auto_109355 ?auto_109358 ) ) ( not ( = ?auto_109355 ?auto_109359 ) ) ( not ( = ?auto_109355 ?auto_109360 ) ) ( not ( = ?auto_109356 ?auto_109357 ) ) ( not ( = ?auto_109356 ?auto_109358 ) ) ( not ( = ?auto_109356 ?auto_109359 ) ) ( not ( = ?auto_109356 ?auto_109360 ) ) ( not ( = ?auto_109357 ?auto_109358 ) ) ( not ( = ?auto_109357 ?auto_109359 ) ) ( not ( = ?auto_109357 ?auto_109360 ) ) ( not ( = ?auto_109358 ?auto_109359 ) ) ( not ( = ?auto_109358 ?auto_109360 ) ) ( not ( = ?auto_109359 ?auto_109360 ) ) ( not ( = ?auto_109354 ?auto_109361 ) ) ( not ( = ?auto_109355 ?auto_109361 ) ) ( not ( = ?auto_109356 ?auto_109361 ) ) ( not ( = ?auto_109357 ?auto_109361 ) ) ( not ( = ?auto_109358 ?auto_109361 ) ) ( not ( = ?auto_109359 ?auto_109361 ) ) ( not ( = ?auto_109360 ?auto_109361 ) ) ( ON ?auto_109361 ?auto_109360 ) ( CLEAR ?auto_109361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109354 ?auto_109355 ?auto_109356 ?auto_109357 ?auto_109358 ?auto_109359 ?auto_109360 )
      ( MAKE-6PILE ?auto_109354 ?auto_109355 ?auto_109356 ?auto_109357 ?auto_109358 ?auto_109359 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109364 - BLOCK
      ?auto_109365 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_109365 ) ( CLEAR ?auto_109364 ) ( ON-TABLE ?auto_109364 ) ( not ( = ?auto_109364 ?auto_109365 ) ) )
    :subtasks
    ( ( !STACK ?auto_109365 ?auto_109364 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109366 - BLOCK
      ?auto_109367 - BLOCK
    )
    :vars
    (
      ?auto_109368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109366 ) ( ON-TABLE ?auto_109366 ) ( not ( = ?auto_109366 ?auto_109367 ) ) ( ON ?auto_109367 ?auto_109368 ) ( CLEAR ?auto_109367 ) ( HAND-EMPTY ) ( not ( = ?auto_109366 ?auto_109368 ) ) ( not ( = ?auto_109367 ?auto_109368 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109367 ?auto_109368 )
      ( MAKE-2PILE ?auto_109366 ?auto_109367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109369 - BLOCK
      ?auto_109370 - BLOCK
    )
    :vars
    (
      ?auto_109371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109369 ?auto_109370 ) ) ( ON ?auto_109370 ?auto_109371 ) ( CLEAR ?auto_109370 ) ( not ( = ?auto_109369 ?auto_109371 ) ) ( not ( = ?auto_109370 ?auto_109371 ) ) ( HOLDING ?auto_109369 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109369 )
      ( MAKE-2PILE ?auto_109369 ?auto_109370 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109372 - BLOCK
      ?auto_109373 - BLOCK
    )
    :vars
    (
      ?auto_109374 - BLOCK
      ?auto_109376 - BLOCK
      ?auto_109377 - BLOCK
      ?auto_109378 - BLOCK
      ?auto_109375 - BLOCK
      ?auto_109379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109372 ?auto_109373 ) ) ( ON ?auto_109373 ?auto_109374 ) ( not ( = ?auto_109372 ?auto_109374 ) ) ( not ( = ?auto_109373 ?auto_109374 ) ) ( ON ?auto_109372 ?auto_109373 ) ( CLEAR ?auto_109372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109376 ) ( ON ?auto_109377 ?auto_109376 ) ( ON ?auto_109378 ?auto_109377 ) ( ON ?auto_109375 ?auto_109378 ) ( ON ?auto_109379 ?auto_109375 ) ( ON ?auto_109374 ?auto_109379 ) ( not ( = ?auto_109376 ?auto_109377 ) ) ( not ( = ?auto_109376 ?auto_109378 ) ) ( not ( = ?auto_109376 ?auto_109375 ) ) ( not ( = ?auto_109376 ?auto_109379 ) ) ( not ( = ?auto_109376 ?auto_109374 ) ) ( not ( = ?auto_109376 ?auto_109373 ) ) ( not ( = ?auto_109376 ?auto_109372 ) ) ( not ( = ?auto_109377 ?auto_109378 ) ) ( not ( = ?auto_109377 ?auto_109375 ) ) ( not ( = ?auto_109377 ?auto_109379 ) ) ( not ( = ?auto_109377 ?auto_109374 ) ) ( not ( = ?auto_109377 ?auto_109373 ) ) ( not ( = ?auto_109377 ?auto_109372 ) ) ( not ( = ?auto_109378 ?auto_109375 ) ) ( not ( = ?auto_109378 ?auto_109379 ) ) ( not ( = ?auto_109378 ?auto_109374 ) ) ( not ( = ?auto_109378 ?auto_109373 ) ) ( not ( = ?auto_109378 ?auto_109372 ) ) ( not ( = ?auto_109375 ?auto_109379 ) ) ( not ( = ?auto_109375 ?auto_109374 ) ) ( not ( = ?auto_109375 ?auto_109373 ) ) ( not ( = ?auto_109375 ?auto_109372 ) ) ( not ( = ?auto_109379 ?auto_109374 ) ) ( not ( = ?auto_109379 ?auto_109373 ) ) ( not ( = ?auto_109379 ?auto_109372 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109376 ?auto_109377 ?auto_109378 ?auto_109375 ?auto_109379 ?auto_109374 ?auto_109373 )
      ( MAKE-2PILE ?auto_109372 ?auto_109373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109385 - BLOCK
      ?auto_109386 - BLOCK
      ?auto_109387 - BLOCK
      ?auto_109388 - BLOCK
      ?auto_109389 - BLOCK
    )
    :vars
    (
      ?auto_109390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109390 ?auto_109389 ) ( CLEAR ?auto_109390 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109385 ) ( ON ?auto_109386 ?auto_109385 ) ( ON ?auto_109387 ?auto_109386 ) ( ON ?auto_109388 ?auto_109387 ) ( ON ?auto_109389 ?auto_109388 ) ( not ( = ?auto_109385 ?auto_109386 ) ) ( not ( = ?auto_109385 ?auto_109387 ) ) ( not ( = ?auto_109385 ?auto_109388 ) ) ( not ( = ?auto_109385 ?auto_109389 ) ) ( not ( = ?auto_109385 ?auto_109390 ) ) ( not ( = ?auto_109386 ?auto_109387 ) ) ( not ( = ?auto_109386 ?auto_109388 ) ) ( not ( = ?auto_109386 ?auto_109389 ) ) ( not ( = ?auto_109386 ?auto_109390 ) ) ( not ( = ?auto_109387 ?auto_109388 ) ) ( not ( = ?auto_109387 ?auto_109389 ) ) ( not ( = ?auto_109387 ?auto_109390 ) ) ( not ( = ?auto_109388 ?auto_109389 ) ) ( not ( = ?auto_109388 ?auto_109390 ) ) ( not ( = ?auto_109389 ?auto_109390 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109390 ?auto_109389 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109391 - BLOCK
      ?auto_109392 - BLOCK
      ?auto_109393 - BLOCK
      ?auto_109394 - BLOCK
      ?auto_109395 - BLOCK
    )
    :vars
    (
      ?auto_109396 - BLOCK
      ?auto_109397 - BLOCK
      ?auto_109398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109396 ?auto_109395 ) ( CLEAR ?auto_109396 ) ( ON-TABLE ?auto_109391 ) ( ON ?auto_109392 ?auto_109391 ) ( ON ?auto_109393 ?auto_109392 ) ( ON ?auto_109394 ?auto_109393 ) ( ON ?auto_109395 ?auto_109394 ) ( not ( = ?auto_109391 ?auto_109392 ) ) ( not ( = ?auto_109391 ?auto_109393 ) ) ( not ( = ?auto_109391 ?auto_109394 ) ) ( not ( = ?auto_109391 ?auto_109395 ) ) ( not ( = ?auto_109391 ?auto_109396 ) ) ( not ( = ?auto_109392 ?auto_109393 ) ) ( not ( = ?auto_109392 ?auto_109394 ) ) ( not ( = ?auto_109392 ?auto_109395 ) ) ( not ( = ?auto_109392 ?auto_109396 ) ) ( not ( = ?auto_109393 ?auto_109394 ) ) ( not ( = ?auto_109393 ?auto_109395 ) ) ( not ( = ?auto_109393 ?auto_109396 ) ) ( not ( = ?auto_109394 ?auto_109395 ) ) ( not ( = ?auto_109394 ?auto_109396 ) ) ( not ( = ?auto_109395 ?auto_109396 ) ) ( HOLDING ?auto_109397 ) ( CLEAR ?auto_109398 ) ( not ( = ?auto_109391 ?auto_109397 ) ) ( not ( = ?auto_109391 ?auto_109398 ) ) ( not ( = ?auto_109392 ?auto_109397 ) ) ( not ( = ?auto_109392 ?auto_109398 ) ) ( not ( = ?auto_109393 ?auto_109397 ) ) ( not ( = ?auto_109393 ?auto_109398 ) ) ( not ( = ?auto_109394 ?auto_109397 ) ) ( not ( = ?auto_109394 ?auto_109398 ) ) ( not ( = ?auto_109395 ?auto_109397 ) ) ( not ( = ?auto_109395 ?auto_109398 ) ) ( not ( = ?auto_109396 ?auto_109397 ) ) ( not ( = ?auto_109396 ?auto_109398 ) ) ( not ( = ?auto_109397 ?auto_109398 ) ) )
    :subtasks
    ( ( !STACK ?auto_109397 ?auto_109398 )
      ( MAKE-5PILE ?auto_109391 ?auto_109392 ?auto_109393 ?auto_109394 ?auto_109395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110317 - BLOCK
      ?auto_110318 - BLOCK
      ?auto_110319 - BLOCK
      ?auto_110320 - BLOCK
      ?auto_110321 - BLOCK
    )
    :vars
    (
      ?auto_110323 - BLOCK
      ?auto_110322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110323 ?auto_110321 ) ( ON-TABLE ?auto_110317 ) ( ON ?auto_110318 ?auto_110317 ) ( ON ?auto_110319 ?auto_110318 ) ( ON ?auto_110320 ?auto_110319 ) ( ON ?auto_110321 ?auto_110320 ) ( not ( = ?auto_110317 ?auto_110318 ) ) ( not ( = ?auto_110317 ?auto_110319 ) ) ( not ( = ?auto_110317 ?auto_110320 ) ) ( not ( = ?auto_110317 ?auto_110321 ) ) ( not ( = ?auto_110317 ?auto_110323 ) ) ( not ( = ?auto_110318 ?auto_110319 ) ) ( not ( = ?auto_110318 ?auto_110320 ) ) ( not ( = ?auto_110318 ?auto_110321 ) ) ( not ( = ?auto_110318 ?auto_110323 ) ) ( not ( = ?auto_110319 ?auto_110320 ) ) ( not ( = ?auto_110319 ?auto_110321 ) ) ( not ( = ?auto_110319 ?auto_110323 ) ) ( not ( = ?auto_110320 ?auto_110321 ) ) ( not ( = ?auto_110320 ?auto_110323 ) ) ( not ( = ?auto_110321 ?auto_110323 ) ) ( not ( = ?auto_110317 ?auto_110322 ) ) ( not ( = ?auto_110318 ?auto_110322 ) ) ( not ( = ?auto_110319 ?auto_110322 ) ) ( not ( = ?auto_110320 ?auto_110322 ) ) ( not ( = ?auto_110321 ?auto_110322 ) ) ( not ( = ?auto_110323 ?auto_110322 ) ) ( ON ?auto_110322 ?auto_110323 ) ( CLEAR ?auto_110322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110317 ?auto_110318 ?auto_110319 ?auto_110320 ?auto_110321 ?auto_110323 )
      ( MAKE-5PILE ?auto_110317 ?auto_110318 ?auto_110319 ?auto_110320 ?auto_110321 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109407 - BLOCK
      ?auto_109408 - BLOCK
      ?auto_109409 - BLOCK
      ?auto_109410 - BLOCK
      ?auto_109411 - BLOCK
    )
    :vars
    (
      ?auto_109413 - BLOCK
      ?auto_109412 - BLOCK
      ?auto_109414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109413 ?auto_109411 ) ( ON-TABLE ?auto_109407 ) ( ON ?auto_109408 ?auto_109407 ) ( ON ?auto_109409 ?auto_109408 ) ( ON ?auto_109410 ?auto_109409 ) ( ON ?auto_109411 ?auto_109410 ) ( not ( = ?auto_109407 ?auto_109408 ) ) ( not ( = ?auto_109407 ?auto_109409 ) ) ( not ( = ?auto_109407 ?auto_109410 ) ) ( not ( = ?auto_109407 ?auto_109411 ) ) ( not ( = ?auto_109407 ?auto_109413 ) ) ( not ( = ?auto_109408 ?auto_109409 ) ) ( not ( = ?auto_109408 ?auto_109410 ) ) ( not ( = ?auto_109408 ?auto_109411 ) ) ( not ( = ?auto_109408 ?auto_109413 ) ) ( not ( = ?auto_109409 ?auto_109410 ) ) ( not ( = ?auto_109409 ?auto_109411 ) ) ( not ( = ?auto_109409 ?auto_109413 ) ) ( not ( = ?auto_109410 ?auto_109411 ) ) ( not ( = ?auto_109410 ?auto_109413 ) ) ( not ( = ?auto_109411 ?auto_109413 ) ) ( not ( = ?auto_109407 ?auto_109412 ) ) ( not ( = ?auto_109407 ?auto_109414 ) ) ( not ( = ?auto_109408 ?auto_109412 ) ) ( not ( = ?auto_109408 ?auto_109414 ) ) ( not ( = ?auto_109409 ?auto_109412 ) ) ( not ( = ?auto_109409 ?auto_109414 ) ) ( not ( = ?auto_109410 ?auto_109412 ) ) ( not ( = ?auto_109410 ?auto_109414 ) ) ( not ( = ?auto_109411 ?auto_109412 ) ) ( not ( = ?auto_109411 ?auto_109414 ) ) ( not ( = ?auto_109413 ?auto_109412 ) ) ( not ( = ?auto_109413 ?auto_109414 ) ) ( not ( = ?auto_109412 ?auto_109414 ) ) ( ON ?auto_109412 ?auto_109413 ) ( CLEAR ?auto_109412 ) ( HOLDING ?auto_109414 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109414 )
      ( MAKE-5PILE ?auto_109407 ?auto_109408 ?auto_109409 ?auto_109410 ?auto_109411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109415 - BLOCK
      ?auto_109416 - BLOCK
      ?auto_109417 - BLOCK
      ?auto_109418 - BLOCK
      ?auto_109419 - BLOCK
    )
    :vars
    (
      ?auto_109422 - BLOCK
      ?auto_109420 - BLOCK
      ?auto_109421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109422 ?auto_109419 ) ( ON-TABLE ?auto_109415 ) ( ON ?auto_109416 ?auto_109415 ) ( ON ?auto_109417 ?auto_109416 ) ( ON ?auto_109418 ?auto_109417 ) ( ON ?auto_109419 ?auto_109418 ) ( not ( = ?auto_109415 ?auto_109416 ) ) ( not ( = ?auto_109415 ?auto_109417 ) ) ( not ( = ?auto_109415 ?auto_109418 ) ) ( not ( = ?auto_109415 ?auto_109419 ) ) ( not ( = ?auto_109415 ?auto_109422 ) ) ( not ( = ?auto_109416 ?auto_109417 ) ) ( not ( = ?auto_109416 ?auto_109418 ) ) ( not ( = ?auto_109416 ?auto_109419 ) ) ( not ( = ?auto_109416 ?auto_109422 ) ) ( not ( = ?auto_109417 ?auto_109418 ) ) ( not ( = ?auto_109417 ?auto_109419 ) ) ( not ( = ?auto_109417 ?auto_109422 ) ) ( not ( = ?auto_109418 ?auto_109419 ) ) ( not ( = ?auto_109418 ?auto_109422 ) ) ( not ( = ?auto_109419 ?auto_109422 ) ) ( not ( = ?auto_109415 ?auto_109420 ) ) ( not ( = ?auto_109415 ?auto_109421 ) ) ( not ( = ?auto_109416 ?auto_109420 ) ) ( not ( = ?auto_109416 ?auto_109421 ) ) ( not ( = ?auto_109417 ?auto_109420 ) ) ( not ( = ?auto_109417 ?auto_109421 ) ) ( not ( = ?auto_109418 ?auto_109420 ) ) ( not ( = ?auto_109418 ?auto_109421 ) ) ( not ( = ?auto_109419 ?auto_109420 ) ) ( not ( = ?auto_109419 ?auto_109421 ) ) ( not ( = ?auto_109422 ?auto_109420 ) ) ( not ( = ?auto_109422 ?auto_109421 ) ) ( not ( = ?auto_109420 ?auto_109421 ) ) ( ON ?auto_109420 ?auto_109422 ) ( ON ?auto_109421 ?auto_109420 ) ( CLEAR ?auto_109421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109415 ?auto_109416 ?auto_109417 ?auto_109418 ?auto_109419 ?auto_109422 ?auto_109420 )
      ( MAKE-5PILE ?auto_109415 ?auto_109416 ?auto_109417 ?auto_109418 ?auto_109419 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109426 - BLOCK
      ?auto_109427 - BLOCK
      ?auto_109428 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_109428 ) ( CLEAR ?auto_109427 ) ( ON-TABLE ?auto_109426 ) ( ON ?auto_109427 ?auto_109426 ) ( not ( = ?auto_109426 ?auto_109427 ) ) ( not ( = ?auto_109426 ?auto_109428 ) ) ( not ( = ?auto_109427 ?auto_109428 ) ) )
    :subtasks
    ( ( !STACK ?auto_109428 ?auto_109427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109429 - BLOCK
      ?auto_109430 - BLOCK
      ?auto_109431 - BLOCK
    )
    :vars
    (
      ?auto_109432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109430 ) ( ON-TABLE ?auto_109429 ) ( ON ?auto_109430 ?auto_109429 ) ( not ( = ?auto_109429 ?auto_109430 ) ) ( not ( = ?auto_109429 ?auto_109431 ) ) ( not ( = ?auto_109430 ?auto_109431 ) ) ( ON ?auto_109431 ?auto_109432 ) ( CLEAR ?auto_109431 ) ( HAND-EMPTY ) ( not ( = ?auto_109429 ?auto_109432 ) ) ( not ( = ?auto_109430 ?auto_109432 ) ) ( not ( = ?auto_109431 ?auto_109432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109431 ?auto_109432 )
      ( MAKE-3PILE ?auto_109429 ?auto_109430 ?auto_109431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109433 - BLOCK
      ?auto_109434 - BLOCK
      ?auto_109435 - BLOCK
    )
    :vars
    (
      ?auto_109436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109433 ) ( not ( = ?auto_109433 ?auto_109434 ) ) ( not ( = ?auto_109433 ?auto_109435 ) ) ( not ( = ?auto_109434 ?auto_109435 ) ) ( ON ?auto_109435 ?auto_109436 ) ( CLEAR ?auto_109435 ) ( not ( = ?auto_109433 ?auto_109436 ) ) ( not ( = ?auto_109434 ?auto_109436 ) ) ( not ( = ?auto_109435 ?auto_109436 ) ) ( HOLDING ?auto_109434 ) ( CLEAR ?auto_109433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109433 ?auto_109434 )
      ( MAKE-3PILE ?auto_109433 ?auto_109434 ?auto_109435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109437 - BLOCK
      ?auto_109438 - BLOCK
      ?auto_109439 - BLOCK
    )
    :vars
    (
      ?auto_109440 - BLOCK
      ?auto_109441 - BLOCK
      ?auto_109443 - BLOCK
      ?auto_109442 - BLOCK
      ?auto_109444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109437 ) ( not ( = ?auto_109437 ?auto_109438 ) ) ( not ( = ?auto_109437 ?auto_109439 ) ) ( not ( = ?auto_109438 ?auto_109439 ) ) ( ON ?auto_109439 ?auto_109440 ) ( not ( = ?auto_109437 ?auto_109440 ) ) ( not ( = ?auto_109438 ?auto_109440 ) ) ( not ( = ?auto_109439 ?auto_109440 ) ) ( CLEAR ?auto_109437 ) ( ON ?auto_109438 ?auto_109439 ) ( CLEAR ?auto_109438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109441 ) ( ON ?auto_109443 ?auto_109441 ) ( ON ?auto_109442 ?auto_109443 ) ( ON ?auto_109444 ?auto_109442 ) ( ON ?auto_109440 ?auto_109444 ) ( not ( = ?auto_109441 ?auto_109443 ) ) ( not ( = ?auto_109441 ?auto_109442 ) ) ( not ( = ?auto_109441 ?auto_109444 ) ) ( not ( = ?auto_109441 ?auto_109440 ) ) ( not ( = ?auto_109441 ?auto_109439 ) ) ( not ( = ?auto_109441 ?auto_109438 ) ) ( not ( = ?auto_109443 ?auto_109442 ) ) ( not ( = ?auto_109443 ?auto_109444 ) ) ( not ( = ?auto_109443 ?auto_109440 ) ) ( not ( = ?auto_109443 ?auto_109439 ) ) ( not ( = ?auto_109443 ?auto_109438 ) ) ( not ( = ?auto_109442 ?auto_109444 ) ) ( not ( = ?auto_109442 ?auto_109440 ) ) ( not ( = ?auto_109442 ?auto_109439 ) ) ( not ( = ?auto_109442 ?auto_109438 ) ) ( not ( = ?auto_109444 ?auto_109440 ) ) ( not ( = ?auto_109444 ?auto_109439 ) ) ( not ( = ?auto_109444 ?auto_109438 ) ) ( not ( = ?auto_109437 ?auto_109441 ) ) ( not ( = ?auto_109437 ?auto_109443 ) ) ( not ( = ?auto_109437 ?auto_109442 ) ) ( not ( = ?auto_109437 ?auto_109444 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109441 ?auto_109443 ?auto_109442 ?auto_109444 ?auto_109440 ?auto_109439 )
      ( MAKE-3PILE ?auto_109437 ?auto_109438 ?auto_109439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109445 - BLOCK
      ?auto_109446 - BLOCK
      ?auto_109447 - BLOCK
    )
    :vars
    (
      ?auto_109451 - BLOCK
      ?auto_109452 - BLOCK
      ?auto_109448 - BLOCK
      ?auto_109450 - BLOCK
      ?auto_109449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109445 ?auto_109446 ) ) ( not ( = ?auto_109445 ?auto_109447 ) ) ( not ( = ?auto_109446 ?auto_109447 ) ) ( ON ?auto_109447 ?auto_109451 ) ( not ( = ?auto_109445 ?auto_109451 ) ) ( not ( = ?auto_109446 ?auto_109451 ) ) ( not ( = ?auto_109447 ?auto_109451 ) ) ( ON ?auto_109446 ?auto_109447 ) ( CLEAR ?auto_109446 ) ( ON-TABLE ?auto_109452 ) ( ON ?auto_109448 ?auto_109452 ) ( ON ?auto_109450 ?auto_109448 ) ( ON ?auto_109449 ?auto_109450 ) ( ON ?auto_109451 ?auto_109449 ) ( not ( = ?auto_109452 ?auto_109448 ) ) ( not ( = ?auto_109452 ?auto_109450 ) ) ( not ( = ?auto_109452 ?auto_109449 ) ) ( not ( = ?auto_109452 ?auto_109451 ) ) ( not ( = ?auto_109452 ?auto_109447 ) ) ( not ( = ?auto_109452 ?auto_109446 ) ) ( not ( = ?auto_109448 ?auto_109450 ) ) ( not ( = ?auto_109448 ?auto_109449 ) ) ( not ( = ?auto_109448 ?auto_109451 ) ) ( not ( = ?auto_109448 ?auto_109447 ) ) ( not ( = ?auto_109448 ?auto_109446 ) ) ( not ( = ?auto_109450 ?auto_109449 ) ) ( not ( = ?auto_109450 ?auto_109451 ) ) ( not ( = ?auto_109450 ?auto_109447 ) ) ( not ( = ?auto_109450 ?auto_109446 ) ) ( not ( = ?auto_109449 ?auto_109451 ) ) ( not ( = ?auto_109449 ?auto_109447 ) ) ( not ( = ?auto_109449 ?auto_109446 ) ) ( not ( = ?auto_109445 ?auto_109452 ) ) ( not ( = ?auto_109445 ?auto_109448 ) ) ( not ( = ?auto_109445 ?auto_109450 ) ) ( not ( = ?auto_109445 ?auto_109449 ) ) ( HOLDING ?auto_109445 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109445 )
      ( MAKE-3PILE ?auto_109445 ?auto_109446 ?auto_109447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109453 - BLOCK
      ?auto_109454 - BLOCK
      ?auto_109455 - BLOCK
    )
    :vars
    (
      ?auto_109458 - BLOCK
      ?auto_109456 - BLOCK
      ?auto_109459 - BLOCK
      ?auto_109460 - BLOCK
      ?auto_109457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109453 ?auto_109454 ) ) ( not ( = ?auto_109453 ?auto_109455 ) ) ( not ( = ?auto_109454 ?auto_109455 ) ) ( ON ?auto_109455 ?auto_109458 ) ( not ( = ?auto_109453 ?auto_109458 ) ) ( not ( = ?auto_109454 ?auto_109458 ) ) ( not ( = ?auto_109455 ?auto_109458 ) ) ( ON ?auto_109454 ?auto_109455 ) ( ON-TABLE ?auto_109456 ) ( ON ?auto_109459 ?auto_109456 ) ( ON ?auto_109460 ?auto_109459 ) ( ON ?auto_109457 ?auto_109460 ) ( ON ?auto_109458 ?auto_109457 ) ( not ( = ?auto_109456 ?auto_109459 ) ) ( not ( = ?auto_109456 ?auto_109460 ) ) ( not ( = ?auto_109456 ?auto_109457 ) ) ( not ( = ?auto_109456 ?auto_109458 ) ) ( not ( = ?auto_109456 ?auto_109455 ) ) ( not ( = ?auto_109456 ?auto_109454 ) ) ( not ( = ?auto_109459 ?auto_109460 ) ) ( not ( = ?auto_109459 ?auto_109457 ) ) ( not ( = ?auto_109459 ?auto_109458 ) ) ( not ( = ?auto_109459 ?auto_109455 ) ) ( not ( = ?auto_109459 ?auto_109454 ) ) ( not ( = ?auto_109460 ?auto_109457 ) ) ( not ( = ?auto_109460 ?auto_109458 ) ) ( not ( = ?auto_109460 ?auto_109455 ) ) ( not ( = ?auto_109460 ?auto_109454 ) ) ( not ( = ?auto_109457 ?auto_109458 ) ) ( not ( = ?auto_109457 ?auto_109455 ) ) ( not ( = ?auto_109457 ?auto_109454 ) ) ( not ( = ?auto_109453 ?auto_109456 ) ) ( not ( = ?auto_109453 ?auto_109459 ) ) ( not ( = ?auto_109453 ?auto_109460 ) ) ( not ( = ?auto_109453 ?auto_109457 ) ) ( ON ?auto_109453 ?auto_109454 ) ( CLEAR ?auto_109453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109456 ?auto_109459 ?auto_109460 ?auto_109457 ?auto_109458 ?auto_109455 ?auto_109454 )
      ( MAKE-3PILE ?auto_109453 ?auto_109454 ?auto_109455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109465 - BLOCK
      ?auto_109466 - BLOCK
      ?auto_109467 - BLOCK
      ?auto_109468 - BLOCK
    )
    :vars
    (
      ?auto_109469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109469 ?auto_109468 ) ( CLEAR ?auto_109469 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109465 ) ( ON ?auto_109466 ?auto_109465 ) ( ON ?auto_109467 ?auto_109466 ) ( ON ?auto_109468 ?auto_109467 ) ( not ( = ?auto_109465 ?auto_109466 ) ) ( not ( = ?auto_109465 ?auto_109467 ) ) ( not ( = ?auto_109465 ?auto_109468 ) ) ( not ( = ?auto_109465 ?auto_109469 ) ) ( not ( = ?auto_109466 ?auto_109467 ) ) ( not ( = ?auto_109466 ?auto_109468 ) ) ( not ( = ?auto_109466 ?auto_109469 ) ) ( not ( = ?auto_109467 ?auto_109468 ) ) ( not ( = ?auto_109467 ?auto_109469 ) ) ( not ( = ?auto_109468 ?auto_109469 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109469 ?auto_109468 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109470 - BLOCK
      ?auto_109471 - BLOCK
      ?auto_109472 - BLOCK
      ?auto_109473 - BLOCK
    )
    :vars
    (
      ?auto_109474 - BLOCK
      ?auto_109475 - BLOCK
      ?auto_109476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109474 ?auto_109473 ) ( CLEAR ?auto_109474 ) ( ON-TABLE ?auto_109470 ) ( ON ?auto_109471 ?auto_109470 ) ( ON ?auto_109472 ?auto_109471 ) ( ON ?auto_109473 ?auto_109472 ) ( not ( = ?auto_109470 ?auto_109471 ) ) ( not ( = ?auto_109470 ?auto_109472 ) ) ( not ( = ?auto_109470 ?auto_109473 ) ) ( not ( = ?auto_109470 ?auto_109474 ) ) ( not ( = ?auto_109471 ?auto_109472 ) ) ( not ( = ?auto_109471 ?auto_109473 ) ) ( not ( = ?auto_109471 ?auto_109474 ) ) ( not ( = ?auto_109472 ?auto_109473 ) ) ( not ( = ?auto_109472 ?auto_109474 ) ) ( not ( = ?auto_109473 ?auto_109474 ) ) ( HOLDING ?auto_109475 ) ( CLEAR ?auto_109476 ) ( not ( = ?auto_109470 ?auto_109475 ) ) ( not ( = ?auto_109470 ?auto_109476 ) ) ( not ( = ?auto_109471 ?auto_109475 ) ) ( not ( = ?auto_109471 ?auto_109476 ) ) ( not ( = ?auto_109472 ?auto_109475 ) ) ( not ( = ?auto_109472 ?auto_109476 ) ) ( not ( = ?auto_109473 ?auto_109475 ) ) ( not ( = ?auto_109473 ?auto_109476 ) ) ( not ( = ?auto_109474 ?auto_109475 ) ) ( not ( = ?auto_109474 ?auto_109476 ) ) ( not ( = ?auto_109475 ?auto_109476 ) ) )
    :subtasks
    ( ( !STACK ?auto_109475 ?auto_109476 )
      ( MAKE-4PILE ?auto_109470 ?auto_109471 ?auto_109472 ?auto_109473 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109477 - BLOCK
      ?auto_109478 - BLOCK
      ?auto_109479 - BLOCK
      ?auto_109480 - BLOCK
    )
    :vars
    (
      ?auto_109482 - BLOCK
      ?auto_109483 - BLOCK
      ?auto_109481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109482 ?auto_109480 ) ( ON-TABLE ?auto_109477 ) ( ON ?auto_109478 ?auto_109477 ) ( ON ?auto_109479 ?auto_109478 ) ( ON ?auto_109480 ?auto_109479 ) ( not ( = ?auto_109477 ?auto_109478 ) ) ( not ( = ?auto_109477 ?auto_109479 ) ) ( not ( = ?auto_109477 ?auto_109480 ) ) ( not ( = ?auto_109477 ?auto_109482 ) ) ( not ( = ?auto_109478 ?auto_109479 ) ) ( not ( = ?auto_109478 ?auto_109480 ) ) ( not ( = ?auto_109478 ?auto_109482 ) ) ( not ( = ?auto_109479 ?auto_109480 ) ) ( not ( = ?auto_109479 ?auto_109482 ) ) ( not ( = ?auto_109480 ?auto_109482 ) ) ( CLEAR ?auto_109483 ) ( not ( = ?auto_109477 ?auto_109481 ) ) ( not ( = ?auto_109477 ?auto_109483 ) ) ( not ( = ?auto_109478 ?auto_109481 ) ) ( not ( = ?auto_109478 ?auto_109483 ) ) ( not ( = ?auto_109479 ?auto_109481 ) ) ( not ( = ?auto_109479 ?auto_109483 ) ) ( not ( = ?auto_109480 ?auto_109481 ) ) ( not ( = ?auto_109480 ?auto_109483 ) ) ( not ( = ?auto_109482 ?auto_109481 ) ) ( not ( = ?auto_109482 ?auto_109483 ) ) ( not ( = ?auto_109481 ?auto_109483 ) ) ( ON ?auto_109481 ?auto_109482 ) ( CLEAR ?auto_109481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109477 ?auto_109478 ?auto_109479 ?auto_109480 ?auto_109482 )
      ( MAKE-4PILE ?auto_109477 ?auto_109478 ?auto_109479 ?auto_109480 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109484 - BLOCK
      ?auto_109485 - BLOCK
      ?auto_109486 - BLOCK
      ?auto_109487 - BLOCK
    )
    :vars
    (
      ?auto_109489 - BLOCK
      ?auto_109488 - BLOCK
      ?auto_109490 - BLOCK
      ?auto_109491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109489 ?auto_109487 ) ( ON-TABLE ?auto_109484 ) ( ON ?auto_109485 ?auto_109484 ) ( ON ?auto_109486 ?auto_109485 ) ( ON ?auto_109487 ?auto_109486 ) ( not ( = ?auto_109484 ?auto_109485 ) ) ( not ( = ?auto_109484 ?auto_109486 ) ) ( not ( = ?auto_109484 ?auto_109487 ) ) ( not ( = ?auto_109484 ?auto_109489 ) ) ( not ( = ?auto_109485 ?auto_109486 ) ) ( not ( = ?auto_109485 ?auto_109487 ) ) ( not ( = ?auto_109485 ?auto_109489 ) ) ( not ( = ?auto_109486 ?auto_109487 ) ) ( not ( = ?auto_109486 ?auto_109489 ) ) ( not ( = ?auto_109487 ?auto_109489 ) ) ( not ( = ?auto_109484 ?auto_109488 ) ) ( not ( = ?auto_109484 ?auto_109490 ) ) ( not ( = ?auto_109485 ?auto_109488 ) ) ( not ( = ?auto_109485 ?auto_109490 ) ) ( not ( = ?auto_109486 ?auto_109488 ) ) ( not ( = ?auto_109486 ?auto_109490 ) ) ( not ( = ?auto_109487 ?auto_109488 ) ) ( not ( = ?auto_109487 ?auto_109490 ) ) ( not ( = ?auto_109489 ?auto_109488 ) ) ( not ( = ?auto_109489 ?auto_109490 ) ) ( not ( = ?auto_109488 ?auto_109490 ) ) ( ON ?auto_109488 ?auto_109489 ) ( CLEAR ?auto_109488 ) ( HOLDING ?auto_109490 ) ( CLEAR ?auto_109491 ) ( ON-TABLE ?auto_109491 ) ( not ( = ?auto_109491 ?auto_109490 ) ) ( not ( = ?auto_109484 ?auto_109491 ) ) ( not ( = ?auto_109485 ?auto_109491 ) ) ( not ( = ?auto_109486 ?auto_109491 ) ) ( not ( = ?auto_109487 ?auto_109491 ) ) ( not ( = ?auto_109489 ?auto_109491 ) ) ( not ( = ?auto_109488 ?auto_109491 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109491 ?auto_109490 )
      ( MAKE-4PILE ?auto_109484 ?auto_109485 ?auto_109486 ?auto_109487 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110546 - BLOCK
      ?auto_110547 - BLOCK
      ?auto_110548 - BLOCK
      ?auto_110549 - BLOCK
    )
    :vars
    (
      ?auto_110552 - BLOCK
      ?auto_110551 - BLOCK
      ?auto_110550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110552 ?auto_110549 ) ( ON-TABLE ?auto_110546 ) ( ON ?auto_110547 ?auto_110546 ) ( ON ?auto_110548 ?auto_110547 ) ( ON ?auto_110549 ?auto_110548 ) ( not ( = ?auto_110546 ?auto_110547 ) ) ( not ( = ?auto_110546 ?auto_110548 ) ) ( not ( = ?auto_110546 ?auto_110549 ) ) ( not ( = ?auto_110546 ?auto_110552 ) ) ( not ( = ?auto_110547 ?auto_110548 ) ) ( not ( = ?auto_110547 ?auto_110549 ) ) ( not ( = ?auto_110547 ?auto_110552 ) ) ( not ( = ?auto_110548 ?auto_110549 ) ) ( not ( = ?auto_110548 ?auto_110552 ) ) ( not ( = ?auto_110549 ?auto_110552 ) ) ( not ( = ?auto_110546 ?auto_110551 ) ) ( not ( = ?auto_110546 ?auto_110550 ) ) ( not ( = ?auto_110547 ?auto_110551 ) ) ( not ( = ?auto_110547 ?auto_110550 ) ) ( not ( = ?auto_110548 ?auto_110551 ) ) ( not ( = ?auto_110548 ?auto_110550 ) ) ( not ( = ?auto_110549 ?auto_110551 ) ) ( not ( = ?auto_110549 ?auto_110550 ) ) ( not ( = ?auto_110552 ?auto_110551 ) ) ( not ( = ?auto_110552 ?auto_110550 ) ) ( not ( = ?auto_110551 ?auto_110550 ) ) ( ON ?auto_110551 ?auto_110552 ) ( ON ?auto_110550 ?auto_110551 ) ( CLEAR ?auto_110550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110546 ?auto_110547 ?auto_110548 ?auto_110549 ?auto_110552 ?auto_110551 )
      ( MAKE-4PILE ?auto_110546 ?auto_110547 ?auto_110548 ?auto_110549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109500 - BLOCK
      ?auto_109501 - BLOCK
      ?auto_109502 - BLOCK
      ?auto_109503 - BLOCK
    )
    :vars
    (
      ?auto_109505 - BLOCK
      ?auto_109507 - BLOCK
      ?auto_109504 - BLOCK
      ?auto_109506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109505 ?auto_109503 ) ( ON-TABLE ?auto_109500 ) ( ON ?auto_109501 ?auto_109500 ) ( ON ?auto_109502 ?auto_109501 ) ( ON ?auto_109503 ?auto_109502 ) ( not ( = ?auto_109500 ?auto_109501 ) ) ( not ( = ?auto_109500 ?auto_109502 ) ) ( not ( = ?auto_109500 ?auto_109503 ) ) ( not ( = ?auto_109500 ?auto_109505 ) ) ( not ( = ?auto_109501 ?auto_109502 ) ) ( not ( = ?auto_109501 ?auto_109503 ) ) ( not ( = ?auto_109501 ?auto_109505 ) ) ( not ( = ?auto_109502 ?auto_109503 ) ) ( not ( = ?auto_109502 ?auto_109505 ) ) ( not ( = ?auto_109503 ?auto_109505 ) ) ( not ( = ?auto_109500 ?auto_109507 ) ) ( not ( = ?auto_109500 ?auto_109504 ) ) ( not ( = ?auto_109501 ?auto_109507 ) ) ( not ( = ?auto_109501 ?auto_109504 ) ) ( not ( = ?auto_109502 ?auto_109507 ) ) ( not ( = ?auto_109502 ?auto_109504 ) ) ( not ( = ?auto_109503 ?auto_109507 ) ) ( not ( = ?auto_109503 ?auto_109504 ) ) ( not ( = ?auto_109505 ?auto_109507 ) ) ( not ( = ?auto_109505 ?auto_109504 ) ) ( not ( = ?auto_109507 ?auto_109504 ) ) ( ON ?auto_109507 ?auto_109505 ) ( not ( = ?auto_109506 ?auto_109504 ) ) ( not ( = ?auto_109500 ?auto_109506 ) ) ( not ( = ?auto_109501 ?auto_109506 ) ) ( not ( = ?auto_109502 ?auto_109506 ) ) ( not ( = ?auto_109503 ?auto_109506 ) ) ( not ( = ?auto_109505 ?auto_109506 ) ) ( not ( = ?auto_109507 ?auto_109506 ) ) ( ON ?auto_109504 ?auto_109507 ) ( CLEAR ?auto_109504 ) ( HOLDING ?auto_109506 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109506 )
      ( MAKE-4PILE ?auto_109500 ?auto_109501 ?auto_109502 ?auto_109503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109508 - BLOCK
      ?auto_109509 - BLOCK
      ?auto_109510 - BLOCK
      ?auto_109511 - BLOCK
    )
    :vars
    (
      ?auto_109513 - BLOCK
      ?auto_109514 - BLOCK
      ?auto_109515 - BLOCK
      ?auto_109512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109513 ?auto_109511 ) ( ON-TABLE ?auto_109508 ) ( ON ?auto_109509 ?auto_109508 ) ( ON ?auto_109510 ?auto_109509 ) ( ON ?auto_109511 ?auto_109510 ) ( not ( = ?auto_109508 ?auto_109509 ) ) ( not ( = ?auto_109508 ?auto_109510 ) ) ( not ( = ?auto_109508 ?auto_109511 ) ) ( not ( = ?auto_109508 ?auto_109513 ) ) ( not ( = ?auto_109509 ?auto_109510 ) ) ( not ( = ?auto_109509 ?auto_109511 ) ) ( not ( = ?auto_109509 ?auto_109513 ) ) ( not ( = ?auto_109510 ?auto_109511 ) ) ( not ( = ?auto_109510 ?auto_109513 ) ) ( not ( = ?auto_109511 ?auto_109513 ) ) ( not ( = ?auto_109508 ?auto_109514 ) ) ( not ( = ?auto_109508 ?auto_109515 ) ) ( not ( = ?auto_109509 ?auto_109514 ) ) ( not ( = ?auto_109509 ?auto_109515 ) ) ( not ( = ?auto_109510 ?auto_109514 ) ) ( not ( = ?auto_109510 ?auto_109515 ) ) ( not ( = ?auto_109511 ?auto_109514 ) ) ( not ( = ?auto_109511 ?auto_109515 ) ) ( not ( = ?auto_109513 ?auto_109514 ) ) ( not ( = ?auto_109513 ?auto_109515 ) ) ( not ( = ?auto_109514 ?auto_109515 ) ) ( ON ?auto_109514 ?auto_109513 ) ( not ( = ?auto_109512 ?auto_109515 ) ) ( not ( = ?auto_109508 ?auto_109512 ) ) ( not ( = ?auto_109509 ?auto_109512 ) ) ( not ( = ?auto_109510 ?auto_109512 ) ) ( not ( = ?auto_109511 ?auto_109512 ) ) ( not ( = ?auto_109513 ?auto_109512 ) ) ( not ( = ?auto_109514 ?auto_109512 ) ) ( ON ?auto_109515 ?auto_109514 ) ( ON ?auto_109512 ?auto_109515 ) ( CLEAR ?auto_109512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109508 ?auto_109509 ?auto_109510 ?auto_109511 ?auto_109513 ?auto_109514 ?auto_109515 )
      ( MAKE-4PILE ?auto_109508 ?auto_109509 ?auto_109510 ?auto_109511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109520 - BLOCK
      ?auto_109521 - BLOCK
      ?auto_109522 - BLOCK
      ?auto_109523 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_109523 ) ( CLEAR ?auto_109522 ) ( ON-TABLE ?auto_109520 ) ( ON ?auto_109521 ?auto_109520 ) ( ON ?auto_109522 ?auto_109521 ) ( not ( = ?auto_109520 ?auto_109521 ) ) ( not ( = ?auto_109520 ?auto_109522 ) ) ( not ( = ?auto_109520 ?auto_109523 ) ) ( not ( = ?auto_109521 ?auto_109522 ) ) ( not ( = ?auto_109521 ?auto_109523 ) ) ( not ( = ?auto_109522 ?auto_109523 ) ) )
    :subtasks
    ( ( !STACK ?auto_109523 ?auto_109522 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109524 - BLOCK
      ?auto_109525 - BLOCK
      ?auto_109526 - BLOCK
      ?auto_109527 - BLOCK
    )
    :vars
    (
      ?auto_109528 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109526 ) ( ON-TABLE ?auto_109524 ) ( ON ?auto_109525 ?auto_109524 ) ( ON ?auto_109526 ?auto_109525 ) ( not ( = ?auto_109524 ?auto_109525 ) ) ( not ( = ?auto_109524 ?auto_109526 ) ) ( not ( = ?auto_109524 ?auto_109527 ) ) ( not ( = ?auto_109525 ?auto_109526 ) ) ( not ( = ?auto_109525 ?auto_109527 ) ) ( not ( = ?auto_109526 ?auto_109527 ) ) ( ON ?auto_109527 ?auto_109528 ) ( CLEAR ?auto_109527 ) ( HAND-EMPTY ) ( not ( = ?auto_109524 ?auto_109528 ) ) ( not ( = ?auto_109525 ?auto_109528 ) ) ( not ( = ?auto_109526 ?auto_109528 ) ) ( not ( = ?auto_109527 ?auto_109528 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109527 ?auto_109528 )
      ( MAKE-4PILE ?auto_109524 ?auto_109525 ?auto_109526 ?auto_109527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109529 - BLOCK
      ?auto_109530 - BLOCK
      ?auto_109531 - BLOCK
      ?auto_109532 - BLOCK
    )
    :vars
    (
      ?auto_109533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109529 ) ( ON ?auto_109530 ?auto_109529 ) ( not ( = ?auto_109529 ?auto_109530 ) ) ( not ( = ?auto_109529 ?auto_109531 ) ) ( not ( = ?auto_109529 ?auto_109532 ) ) ( not ( = ?auto_109530 ?auto_109531 ) ) ( not ( = ?auto_109530 ?auto_109532 ) ) ( not ( = ?auto_109531 ?auto_109532 ) ) ( ON ?auto_109532 ?auto_109533 ) ( CLEAR ?auto_109532 ) ( not ( = ?auto_109529 ?auto_109533 ) ) ( not ( = ?auto_109530 ?auto_109533 ) ) ( not ( = ?auto_109531 ?auto_109533 ) ) ( not ( = ?auto_109532 ?auto_109533 ) ) ( HOLDING ?auto_109531 ) ( CLEAR ?auto_109530 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109529 ?auto_109530 ?auto_109531 )
      ( MAKE-4PILE ?auto_109529 ?auto_109530 ?auto_109531 ?auto_109532 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109534 - BLOCK
      ?auto_109535 - BLOCK
      ?auto_109536 - BLOCK
      ?auto_109537 - BLOCK
    )
    :vars
    (
      ?auto_109538 - BLOCK
      ?auto_109541 - BLOCK
      ?auto_109540 - BLOCK
      ?auto_109539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109534 ) ( ON ?auto_109535 ?auto_109534 ) ( not ( = ?auto_109534 ?auto_109535 ) ) ( not ( = ?auto_109534 ?auto_109536 ) ) ( not ( = ?auto_109534 ?auto_109537 ) ) ( not ( = ?auto_109535 ?auto_109536 ) ) ( not ( = ?auto_109535 ?auto_109537 ) ) ( not ( = ?auto_109536 ?auto_109537 ) ) ( ON ?auto_109537 ?auto_109538 ) ( not ( = ?auto_109534 ?auto_109538 ) ) ( not ( = ?auto_109535 ?auto_109538 ) ) ( not ( = ?auto_109536 ?auto_109538 ) ) ( not ( = ?auto_109537 ?auto_109538 ) ) ( CLEAR ?auto_109535 ) ( ON ?auto_109536 ?auto_109537 ) ( CLEAR ?auto_109536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109541 ) ( ON ?auto_109540 ?auto_109541 ) ( ON ?auto_109539 ?auto_109540 ) ( ON ?auto_109538 ?auto_109539 ) ( not ( = ?auto_109541 ?auto_109540 ) ) ( not ( = ?auto_109541 ?auto_109539 ) ) ( not ( = ?auto_109541 ?auto_109538 ) ) ( not ( = ?auto_109541 ?auto_109537 ) ) ( not ( = ?auto_109541 ?auto_109536 ) ) ( not ( = ?auto_109540 ?auto_109539 ) ) ( not ( = ?auto_109540 ?auto_109538 ) ) ( not ( = ?auto_109540 ?auto_109537 ) ) ( not ( = ?auto_109540 ?auto_109536 ) ) ( not ( = ?auto_109539 ?auto_109538 ) ) ( not ( = ?auto_109539 ?auto_109537 ) ) ( not ( = ?auto_109539 ?auto_109536 ) ) ( not ( = ?auto_109534 ?auto_109541 ) ) ( not ( = ?auto_109534 ?auto_109540 ) ) ( not ( = ?auto_109534 ?auto_109539 ) ) ( not ( = ?auto_109535 ?auto_109541 ) ) ( not ( = ?auto_109535 ?auto_109540 ) ) ( not ( = ?auto_109535 ?auto_109539 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109541 ?auto_109540 ?auto_109539 ?auto_109538 ?auto_109537 )
      ( MAKE-4PILE ?auto_109534 ?auto_109535 ?auto_109536 ?auto_109537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109542 - BLOCK
      ?auto_109543 - BLOCK
      ?auto_109544 - BLOCK
      ?auto_109545 - BLOCK
    )
    :vars
    (
      ?auto_109548 - BLOCK
      ?auto_109546 - BLOCK
      ?auto_109547 - BLOCK
      ?auto_109549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109542 ) ( not ( = ?auto_109542 ?auto_109543 ) ) ( not ( = ?auto_109542 ?auto_109544 ) ) ( not ( = ?auto_109542 ?auto_109545 ) ) ( not ( = ?auto_109543 ?auto_109544 ) ) ( not ( = ?auto_109543 ?auto_109545 ) ) ( not ( = ?auto_109544 ?auto_109545 ) ) ( ON ?auto_109545 ?auto_109548 ) ( not ( = ?auto_109542 ?auto_109548 ) ) ( not ( = ?auto_109543 ?auto_109548 ) ) ( not ( = ?auto_109544 ?auto_109548 ) ) ( not ( = ?auto_109545 ?auto_109548 ) ) ( ON ?auto_109544 ?auto_109545 ) ( CLEAR ?auto_109544 ) ( ON-TABLE ?auto_109546 ) ( ON ?auto_109547 ?auto_109546 ) ( ON ?auto_109549 ?auto_109547 ) ( ON ?auto_109548 ?auto_109549 ) ( not ( = ?auto_109546 ?auto_109547 ) ) ( not ( = ?auto_109546 ?auto_109549 ) ) ( not ( = ?auto_109546 ?auto_109548 ) ) ( not ( = ?auto_109546 ?auto_109545 ) ) ( not ( = ?auto_109546 ?auto_109544 ) ) ( not ( = ?auto_109547 ?auto_109549 ) ) ( not ( = ?auto_109547 ?auto_109548 ) ) ( not ( = ?auto_109547 ?auto_109545 ) ) ( not ( = ?auto_109547 ?auto_109544 ) ) ( not ( = ?auto_109549 ?auto_109548 ) ) ( not ( = ?auto_109549 ?auto_109545 ) ) ( not ( = ?auto_109549 ?auto_109544 ) ) ( not ( = ?auto_109542 ?auto_109546 ) ) ( not ( = ?auto_109542 ?auto_109547 ) ) ( not ( = ?auto_109542 ?auto_109549 ) ) ( not ( = ?auto_109543 ?auto_109546 ) ) ( not ( = ?auto_109543 ?auto_109547 ) ) ( not ( = ?auto_109543 ?auto_109549 ) ) ( HOLDING ?auto_109543 ) ( CLEAR ?auto_109542 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109542 ?auto_109543 )
      ( MAKE-4PILE ?auto_109542 ?auto_109543 ?auto_109544 ?auto_109545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109550 - BLOCK
      ?auto_109551 - BLOCK
      ?auto_109552 - BLOCK
      ?auto_109553 - BLOCK
    )
    :vars
    (
      ?auto_109555 - BLOCK
      ?auto_109557 - BLOCK
      ?auto_109556 - BLOCK
      ?auto_109554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109550 ) ( not ( = ?auto_109550 ?auto_109551 ) ) ( not ( = ?auto_109550 ?auto_109552 ) ) ( not ( = ?auto_109550 ?auto_109553 ) ) ( not ( = ?auto_109551 ?auto_109552 ) ) ( not ( = ?auto_109551 ?auto_109553 ) ) ( not ( = ?auto_109552 ?auto_109553 ) ) ( ON ?auto_109553 ?auto_109555 ) ( not ( = ?auto_109550 ?auto_109555 ) ) ( not ( = ?auto_109551 ?auto_109555 ) ) ( not ( = ?auto_109552 ?auto_109555 ) ) ( not ( = ?auto_109553 ?auto_109555 ) ) ( ON ?auto_109552 ?auto_109553 ) ( ON-TABLE ?auto_109557 ) ( ON ?auto_109556 ?auto_109557 ) ( ON ?auto_109554 ?auto_109556 ) ( ON ?auto_109555 ?auto_109554 ) ( not ( = ?auto_109557 ?auto_109556 ) ) ( not ( = ?auto_109557 ?auto_109554 ) ) ( not ( = ?auto_109557 ?auto_109555 ) ) ( not ( = ?auto_109557 ?auto_109553 ) ) ( not ( = ?auto_109557 ?auto_109552 ) ) ( not ( = ?auto_109556 ?auto_109554 ) ) ( not ( = ?auto_109556 ?auto_109555 ) ) ( not ( = ?auto_109556 ?auto_109553 ) ) ( not ( = ?auto_109556 ?auto_109552 ) ) ( not ( = ?auto_109554 ?auto_109555 ) ) ( not ( = ?auto_109554 ?auto_109553 ) ) ( not ( = ?auto_109554 ?auto_109552 ) ) ( not ( = ?auto_109550 ?auto_109557 ) ) ( not ( = ?auto_109550 ?auto_109556 ) ) ( not ( = ?auto_109550 ?auto_109554 ) ) ( not ( = ?auto_109551 ?auto_109557 ) ) ( not ( = ?auto_109551 ?auto_109556 ) ) ( not ( = ?auto_109551 ?auto_109554 ) ) ( CLEAR ?auto_109550 ) ( ON ?auto_109551 ?auto_109552 ) ( CLEAR ?auto_109551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109557 ?auto_109556 ?auto_109554 ?auto_109555 ?auto_109553 ?auto_109552 )
      ( MAKE-4PILE ?auto_109550 ?auto_109551 ?auto_109552 ?auto_109553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109558 - BLOCK
      ?auto_109559 - BLOCK
      ?auto_109560 - BLOCK
      ?auto_109561 - BLOCK
    )
    :vars
    (
      ?auto_109565 - BLOCK
      ?auto_109563 - BLOCK
      ?auto_109564 - BLOCK
      ?auto_109562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109558 ?auto_109559 ) ) ( not ( = ?auto_109558 ?auto_109560 ) ) ( not ( = ?auto_109558 ?auto_109561 ) ) ( not ( = ?auto_109559 ?auto_109560 ) ) ( not ( = ?auto_109559 ?auto_109561 ) ) ( not ( = ?auto_109560 ?auto_109561 ) ) ( ON ?auto_109561 ?auto_109565 ) ( not ( = ?auto_109558 ?auto_109565 ) ) ( not ( = ?auto_109559 ?auto_109565 ) ) ( not ( = ?auto_109560 ?auto_109565 ) ) ( not ( = ?auto_109561 ?auto_109565 ) ) ( ON ?auto_109560 ?auto_109561 ) ( ON-TABLE ?auto_109563 ) ( ON ?auto_109564 ?auto_109563 ) ( ON ?auto_109562 ?auto_109564 ) ( ON ?auto_109565 ?auto_109562 ) ( not ( = ?auto_109563 ?auto_109564 ) ) ( not ( = ?auto_109563 ?auto_109562 ) ) ( not ( = ?auto_109563 ?auto_109565 ) ) ( not ( = ?auto_109563 ?auto_109561 ) ) ( not ( = ?auto_109563 ?auto_109560 ) ) ( not ( = ?auto_109564 ?auto_109562 ) ) ( not ( = ?auto_109564 ?auto_109565 ) ) ( not ( = ?auto_109564 ?auto_109561 ) ) ( not ( = ?auto_109564 ?auto_109560 ) ) ( not ( = ?auto_109562 ?auto_109565 ) ) ( not ( = ?auto_109562 ?auto_109561 ) ) ( not ( = ?auto_109562 ?auto_109560 ) ) ( not ( = ?auto_109558 ?auto_109563 ) ) ( not ( = ?auto_109558 ?auto_109564 ) ) ( not ( = ?auto_109558 ?auto_109562 ) ) ( not ( = ?auto_109559 ?auto_109563 ) ) ( not ( = ?auto_109559 ?auto_109564 ) ) ( not ( = ?auto_109559 ?auto_109562 ) ) ( ON ?auto_109559 ?auto_109560 ) ( CLEAR ?auto_109559 ) ( HOLDING ?auto_109558 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109558 )
      ( MAKE-4PILE ?auto_109558 ?auto_109559 ?auto_109560 ?auto_109561 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109566 - BLOCK
      ?auto_109567 - BLOCK
      ?auto_109568 - BLOCK
      ?auto_109569 - BLOCK
    )
    :vars
    (
      ?auto_109573 - BLOCK
      ?auto_109572 - BLOCK
      ?auto_109571 - BLOCK
      ?auto_109570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109566 ?auto_109567 ) ) ( not ( = ?auto_109566 ?auto_109568 ) ) ( not ( = ?auto_109566 ?auto_109569 ) ) ( not ( = ?auto_109567 ?auto_109568 ) ) ( not ( = ?auto_109567 ?auto_109569 ) ) ( not ( = ?auto_109568 ?auto_109569 ) ) ( ON ?auto_109569 ?auto_109573 ) ( not ( = ?auto_109566 ?auto_109573 ) ) ( not ( = ?auto_109567 ?auto_109573 ) ) ( not ( = ?auto_109568 ?auto_109573 ) ) ( not ( = ?auto_109569 ?auto_109573 ) ) ( ON ?auto_109568 ?auto_109569 ) ( ON-TABLE ?auto_109572 ) ( ON ?auto_109571 ?auto_109572 ) ( ON ?auto_109570 ?auto_109571 ) ( ON ?auto_109573 ?auto_109570 ) ( not ( = ?auto_109572 ?auto_109571 ) ) ( not ( = ?auto_109572 ?auto_109570 ) ) ( not ( = ?auto_109572 ?auto_109573 ) ) ( not ( = ?auto_109572 ?auto_109569 ) ) ( not ( = ?auto_109572 ?auto_109568 ) ) ( not ( = ?auto_109571 ?auto_109570 ) ) ( not ( = ?auto_109571 ?auto_109573 ) ) ( not ( = ?auto_109571 ?auto_109569 ) ) ( not ( = ?auto_109571 ?auto_109568 ) ) ( not ( = ?auto_109570 ?auto_109573 ) ) ( not ( = ?auto_109570 ?auto_109569 ) ) ( not ( = ?auto_109570 ?auto_109568 ) ) ( not ( = ?auto_109566 ?auto_109572 ) ) ( not ( = ?auto_109566 ?auto_109571 ) ) ( not ( = ?auto_109566 ?auto_109570 ) ) ( not ( = ?auto_109567 ?auto_109572 ) ) ( not ( = ?auto_109567 ?auto_109571 ) ) ( not ( = ?auto_109567 ?auto_109570 ) ) ( ON ?auto_109567 ?auto_109568 ) ( ON ?auto_109566 ?auto_109567 ) ( CLEAR ?auto_109566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109572 ?auto_109571 ?auto_109570 ?auto_109573 ?auto_109569 ?auto_109568 ?auto_109567 )
      ( MAKE-4PILE ?auto_109566 ?auto_109567 ?auto_109568 ?auto_109569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109577 - BLOCK
      ?auto_109578 - BLOCK
      ?auto_109579 - BLOCK
    )
    :vars
    (
      ?auto_109580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109580 ?auto_109579 ) ( CLEAR ?auto_109580 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109577 ) ( ON ?auto_109578 ?auto_109577 ) ( ON ?auto_109579 ?auto_109578 ) ( not ( = ?auto_109577 ?auto_109578 ) ) ( not ( = ?auto_109577 ?auto_109579 ) ) ( not ( = ?auto_109577 ?auto_109580 ) ) ( not ( = ?auto_109578 ?auto_109579 ) ) ( not ( = ?auto_109578 ?auto_109580 ) ) ( not ( = ?auto_109579 ?auto_109580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109580 ?auto_109579 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109581 - BLOCK
      ?auto_109582 - BLOCK
      ?auto_109583 - BLOCK
    )
    :vars
    (
      ?auto_109584 - BLOCK
      ?auto_109585 - BLOCK
      ?auto_109586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109584 ?auto_109583 ) ( CLEAR ?auto_109584 ) ( ON-TABLE ?auto_109581 ) ( ON ?auto_109582 ?auto_109581 ) ( ON ?auto_109583 ?auto_109582 ) ( not ( = ?auto_109581 ?auto_109582 ) ) ( not ( = ?auto_109581 ?auto_109583 ) ) ( not ( = ?auto_109581 ?auto_109584 ) ) ( not ( = ?auto_109582 ?auto_109583 ) ) ( not ( = ?auto_109582 ?auto_109584 ) ) ( not ( = ?auto_109583 ?auto_109584 ) ) ( HOLDING ?auto_109585 ) ( CLEAR ?auto_109586 ) ( not ( = ?auto_109581 ?auto_109585 ) ) ( not ( = ?auto_109581 ?auto_109586 ) ) ( not ( = ?auto_109582 ?auto_109585 ) ) ( not ( = ?auto_109582 ?auto_109586 ) ) ( not ( = ?auto_109583 ?auto_109585 ) ) ( not ( = ?auto_109583 ?auto_109586 ) ) ( not ( = ?auto_109584 ?auto_109585 ) ) ( not ( = ?auto_109584 ?auto_109586 ) ) ( not ( = ?auto_109585 ?auto_109586 ) ) )
    :subtasks
    ( ( !STACK ?auto_109585 ?auto_109586 )
      ( MAKE-3PILE ?auto_109581 ?auto_109582 ?auto_109583 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109587 - BLOCK
      ?auto_109588 - BLOCK
      ?auto_109589 - BLOCK
    )
    :vars
    (
      ?auto_109592 - BLOCK
      ?auto_109590 - BLOCK
      ?auto_109591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109592 ?auto_109589 ) ( ON-TABLE ?auto_109587 ) ( ON ?auto_109588 ?auto_109587 ) ( ON ?auto_109589 ?auto_109588 ) ( not ( = ?auto_109587 ?auto_109588 ) ) ( not ( = ?auto_109587 ?auto_109589 ) ) ( not ( = ?auto_109587 ?auto_109592 ) ) ( not ( = ?auto_109588 ?auto_109589 ) ) ( not ( = ?auto_109588 ?auto_109592 ) ) ( not ( = ?auto_109589 ?auto_109592 ) ) ( CLEAR ?auto_109590 ) ( not ( = ?auto_109587 ?auto_109591 ) ) ( not ( = ?auto_109587 ?auto_109590 ) ) ( not ( = ?auto_109588 ?auto_109591 ) ) ( not ( = ?auto_109588 ?auto_109590 ) ) ( not ( = ?auto_109589 ?auto_109591 ) ) ( not ( = ?auto_109589 ?auto_109590 ) ) ( not ( = ?auto_109592 ?auto_109591 ) ) ( not ( = ?auto_109592 ?auto_109590 ) ) ( not ( = ?auto_109591 ?auto_109590 ) ) ( ON ?auto_109591 ?auto_109592 ) ( CLEAR ?auto_109591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109587 ?auto_109588 ?auto_109589 ?auto_109592 )
      ( MAKE-3PILE ?auto_109587 ?auto_109588 ?auto_109589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109593 - BLOCK
      ?auto_109594 - BLOCK
      ?auto_109595 - BLOCK
    )
    :vars
    (
      ?auto_109598 - BLOCK
      ?auto_109597 - BLOCK
      ?auto_109596 - BLOCK
      ?auto_109599 - BLOCK
      ?auto_109600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109598 ?auto_109595 ) ( ON-TABLE ?auto_109593 ) ( ON ?auto_109594 ?auto_109593 ) ( ON ?auto_109595 ?auto_109594 ) ( not ( = ?auto_109593 ?auto_109594 ) ) ( not ( = ?auto_109593 ?auto_109595 ) ) ( not ( = ?auto_109593 ?auto_109598 ) ) ( not ( = ?auto_109594 ?auto_109595 ) ) ( not ( = ?auto_109594 ?auto_109598 ) ) ( not ( = ?auto_109595 ?auto_109598 ) ) ( not ( = ?auto_109593 ?auto_109597 ) ) ( not ( = ?auto_109593 ?auto_109596 ) ) ( not ( = ?auto_109594 ?auto_109597 ) ) ( not ( = ?auto_109594 ?auto_109596 ) ) ( not ( = ?auto_109595 ?auto_109597 ) ) ( not ( = ?auto_109595 ?auto_109596 ) ) ( not ( = ?auto_109598 ?auto_109597 ) ) ( not ( = ?auto_109598 ?auto_109596 ) ) ( not ( = ?auto_109597 ?auto_109596 ) ) ( ON ?auto_109597 ?auto_109598 ) ( CLEAR ?auto_109597 ) ( HOLDING ?auto_109596 ) ( CLEAR ?auto_109599 ) ( ON-TABLE ?auto_109600 ) ( ON ?auto_109599 ?auto_109600 ) ( not ( = ?auto_109600 ?auto_109599 ) ) ( not ( = ?auto_109600 ?auto_109596 ) ) ( not ( = ?auto_109599 ?auto_109596 ) ) ( not ( = ?auto_109593 ?auto_109599 ) ) ( not ( = ?auto_109593 ?auto_109600 ) ) ( not ( = ?auto_109594 ?auto_109599 ) ) ( not ( = ?auto_109594 ?auto_109600 ) ) ( not ( = ?auto_109595 ?auto_109599 ) ) ( not ( = ?auto_109595 ?auto_109600 ) ) ( not ( = ?auto_109598 ?auto_109599 ) ) ( not ( = ?auto_109598 ?auto_109600 ) ) ( not ( = ?auto_109597 ?auto_109599 ) ) ( not ( = ?auto_109597 ?auto_109600 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109600 ?auto_109599 ?auto_109596 )
      ( MAKE-3PILE ?auto_109593 ?auto_109594 ?auto_109595 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109601 - BLOCK
      ?auto_109602 - BLOCK
      ?auto_109603 - BLOCK
    )
    :vars
    (
      ?auto_109605 - BLOCK
      ?auto_109607 - BLOCK
      ?auto_109608 - BLOCK
      ?auto_109604 - BLOCK
      ?auto_109606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109605 ?auto_109603 ) ( ON-TABLE ?auto_109601 ) ( ON ?auto_109602 ?auto_109601 ) ( ON ?auto_109603 ?auto_109602 ) ( not ( = ?auto_109601 ?auto_109602 ) ) ( not ( = ?auto_109601 ?auto_109603 ) ) ( not ( = ?auto_109601 ?auto_109605 ) ) ( not ( = ?auto_109602 ?auto_109603 ) ) ( not ( = ?auto_109602 ?auto_109605 ) ) ( not ( = ?auto_109603 ?auto_109605 ) ) ( not ( = ?auto_109601 ?auto_109607 ) ) ( not ( = ?auto_109601 ?auto_109608 ) ) ( not ( = ?auto_109602 ?auto_109607 ) ) ( not ( = ?auto_109602 ?auto_109608 ) ) ( not ( = ?auto_109603 ?auto_109607 ) ) ( not ( = ?auto_109603 ?auto_109608 ) ) ( not ( = ?auto_109605 ?auto_109607 ) ) ( not ( = ?auto_109605 ?auto_109608 ) ) ( not ( = ?auto_109607 ?auto_109608 ) ) ( ON ?auto_109607 ?auto_109605 ) ( CLEAR ?auto_109604 ) ( ON-TABLE ?auto_109606 ) ( ON ?auto_109604 ?auto_109606 ) ( not ( = ?auto_109606 ?auto_109604 ) ) ( not ( = ?auto_109606 ?auto_109608 ) ) ( not ( = ?auto_109604 ?auto_109608 ) ) ( not ( = ?auto_109601 ?auto_109604 ) ) ( not ( = ?auto_109601 ?auto_109606 ) ) ( not ( = ?auto_109602 ?auto_109604 ) ) ( not ( = ?auto_109602 ?auto_109606 ) ) ( not ( = ?auto_109603 ?auto_109604 ) ) ( not ( = ?auto_109603 ?auto_109606 ) ) ( not ( = ?auto_109605 ?auto_109604 ) ) ( not ( = ?auto_109605 ?auto_109606 ) ) ( not ( = ?auto_109607 ?auto_109604 ) ) ( not ( = ?auto_109607 ?auto_109606 ) ) ( ON ?auto_109608 ?auto_109607 ) ( CLEAR ?auto_109608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109601 ?auto_109602 ?auto_109603 ?auto_109605 ?auto_109607 )
      ( MAKE-3PILE ?auto_109601 ?auto_109602 ?auto_109603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109609 - BLOCK
      ?auto_109610 - BLOCK
      ?auto_109611 - BLOCK
    )
    :vars
    (
      ?auto_109613 - BLOCK
      ?auto_109612 - BLOCK
      ?auto_109615 - BLOCK
      ?auto_109614 - BLOCK
      ?auto_109616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109613 ?auto_109611 ) ( ON-TABLE ?auto_109609 ) ( ON ?auto_109610 ?auto_109609 ) ( ON ?auto_109611 ?auto_109610 ) ( not ( = ?auto_109609 ?auto_109610 ) ) ( not ( = ?auto_109609 ?auto_109611 ) ) ( not ( = ?auto_109609 ?auto_109613 ) ) ( not ( = ?auto_109610 ?auto_109611 ) ) ( not ( = ?auto_109610 ?auto_109613 ) ) ( not ( = ?auto_109611 ?auto_109613 ) ) ( not ( = ?auto_109609 ?auto_109612 ) ) ( not ( = ?auto_109609 ?auto_109615 ) ) ( not ( = ?auto_109610 ?auto_109612 ) ) ( not ( = ?auto_109610 ?auto_109615 ) ) ( not ( = ?auto_109611 ?auto_109612 ) ) ( not ( = ?auto_109611 ?auto_109615 ) ) ( not ( = ?auto_109613 ?auto_109612 ) ) ( not ( = ?auto_109613 ?auto_109615 ) ) ( not ( = ?auto_109612 ?auto_109615 ) ) ( ON ?auto_109612 ?auto_109613 ) ( ON-TABLE ?auto_109614 ) ( not ( = ?auto_109614 ?auto_109616 ) ) ( not ( = ?auto_109614 ?auto_109615 ) ) ( not ( = ?auto_109616 ?auto_109615 ) ) ( not ( = ?auto_109609 ?auto_109616 ) ) ( not ( = ?auto_109609 ?auto_109614 ) ) ( not ( = ?auto_109610 ?auto_109616 ) ) ( not ( = ?auto_109610 ?auto_109614 ) ) ( not ( = ?auto_109611 ?auto_109616 ) ) ( not ( = ?auto_109611 ?auto_109614 ) ) ( not ( = ?auto_109613 ?auto_109616 ) ) ( not ( = ?auto_109613 ?auto_109614 ) ) ( not ( = ?auto_109612 ?auto_109616 ) ) ( not ( = ?auto_109612 ?auto_109614 ) ) ( ON ?auto_109615 ?auto_109612 ) ( CLEAR ?auto_109615 ) ( HOLDING ?auto_109616 ) ( CLEAR ?auto_109614 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109614 ?auto_109616 )
      ( MAKE-3PILE ?auto_109609 ?auto_109610 ?auto_109611 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110794 - BLOCK
      ?auto_110795 - BLOCK
      ?auto_110796 - BLOCK
    )
    :vars
    (
      ?auto_110800 - BLOCK
      ?auto_110797 - BLOCK
      ?auto_110798 - BLOCK
      ?auto_110799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110800 ?auto_110796 ) ( ON-TABLE ?auto_110794 ) ( ON ?auto_110795 ?auto_110794 ) ( ON ?auto_110796 ?auto_110795 ) ( not ( = ?auto_110794 ?auto_110795 ) ) ( not ( = ?auto_110794 ?auto_110796 ) ) ( not ( = ?auto_110794 ?auto_110800 ) ) ( not ( = ?auto_110795 ?auto_110796 ) ) ( not ( = ?auto_110795 ?auto_110800 ) ) ( not ( = ?auto_110796 ?auto_110800 ) ) ( not ( = ?auto_110794 ?auto_110797 ) ) ( not ( = ?auto_110794 ?auto_110798 ) ) ( not ( = ?auto_110795 ?auto_110797 ) ) ( not ( = ?auto_110795 ?auto_110798 ) ) ( not ( = ?auto_110796 ?auto_110797 ) ) ( not ( = ?auto_110796 ?auto_110798 ) ) ( not ( = ?auto_110800 ?auto_110797 ) ) ( not ( = ?auto_110800 ?auto_110798 ) ) ( not ( = ?auto_110797 ?auto_110798 ) ) ( ON ?auto_110797 ?auto_110800 ) ( not ( = ?auto_110799 ?auto_110798 ) ) ( not ( = ?auto_110794 ?auto_110799 ) ) ( not ( = ?auto_110795 ?auto_110799 ) ) ( not ( = ?auto_110796 ?auto_110799 ) ) ( not ( = ?auto_110800 ?auto_110799 ) ) ( not ( = ?auto_110797 ?auto_110799 ) ) ( ON ?auto_110798 ?auto_110797 ) ( ON ?auto_110799 ?auto_110798 ) ( CLEAR ?auto_110799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110794 ?auto_110795 ?auto_110796 ?auto_110800 ?auto_110797 ?auto_110798 )
      ( MAKE-3PILE ?auto_110794 ?auto_110795 ?auto_110796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109625 - BLOCK
      ?auto_109626 - BLOCK
      ?auto_109627 - BLOCK
    )
    :vars
    (
      ?auto_109629 - BLOCK
      ?auto_109628 - BLOCK
      ?auto_109630 - BLOCK
      ?auto_109632 - BLOCK
      ?auto_109631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109629 ?auto_109627 ) ( ON-TABLE ?auto_109625 ) ( ON ?auto_109626 ?auto_109625 ) ( ON ?auto_109627 ?auto_109626 ) ( not ( = ?auto_109625 ?auto_109626 ) ) ( not ( = ?auto_109625 ?auto_109627 ) ) ( not ( = ?auto_109625 ?auto_109629 ) ) ( not ( = ?auto_109626 ?auto_109627 ) ) ( not ( = ?auto_109626 ?auto_109629 ) ) ( not ( = ?auto_109627 ?auto_109629 ) ) ( not ( = ?auto_109625 ?auto_109628 ) ) ( not ( = ?auto_109625 ?auto_109630 ) ) ( not ( = ?auto_109626 ?auto_109628 ) ) ( not ( = ?auto_109626 ?auto_109630 ) ) ( not ( = ?auto_109627 ?auto_109628 ) ) ( not ( = ?auto_109627 ?auto_109630 ) ) ( not ( = ?auto_109629 ?auto_109628 ) ) ( not ( = ?auto_109629 ?auto_109630 ) ) ( not ( = ?auto_109628 ?auto_109630 ) ) ( ON ?auto_109628 ?auto_109629 ) ( not ( = ?auto_109632 ?auto_109631 ) ) ( not ( = ?auto_109632 ?auto_109630 ) ) ( not ( = ?auto_109631 ?auto_109630 ) ) ( not ( = ?auto_109625 ?auto_109631 ) ) ( not ( = ?auto_109625 ?auto_109632 ) ) ( not ( = ?auto_109626 ?auto_109631 ) ) ( not ( = ?auto_109626 ?auto_109632 ) ) ( not ( = ?auto_109627 ?auto_109631 ) ) ( not ( = ?auto_109627 ?auto_109632 ) ) ( not ( = ?auto_109629 ?auto_109631 ) ) ( not ( = ?auto_109629 ?auto_109632 ) ) ( not ( = ?auto_109628 ?auto_109631 ) ) ( not ( = ?auto_109628 ?auto_109632 ) ) ( ON ?auto_109630 ?auto_109628 ) ( ON ?auto_109631 ?auto_109630 ) ( CLEAR ?auto_109631 ) ( HOLDING ?auto_109632 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109632 )
      ( MAKE-3PILE ?auto_109625 ?auto_109626 ?auto_109627 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_109633 - BLOCK
      ?auto_109634 - BLOCK
      ?auto_109635 - BLOCK
    )
    :vars
    (
      ?auto_109640 - BLOCK
      ?auto_109638 - BLOCK
      ?auto_109636 - BLOCK
      ?auto_109637 - BLOCK
      ?auto_109639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109640 ?auto_109635 ) ( ON-TABLE ?auto_109633 ) ( ON ?auto_109634 ?auto_109633 ) ( ON ?auto_109635 ?auto_109634 ) ( not ( = ?auto_109633 ?auto_109634 ) ) ( not ( = ?auto_109633 ?auto_109635 ) ) ( not ( = ?auto_109633 ?auto_109640 ) ) ( not ( = ?auto_109634 ?auto_109635 ) ) ( not ( = ?auto_109634 ?auto_109640 ) ) ( not ( = ?auto_109635 ?auto_109640 ) ) ( not ( = ?auto_109633 ?auto_109638 ) ) ( not ( = ?auto_109633 ?auto_109636 ) ) ( not ( = ?auto_109634 ?auto_109638 ) ) ( not ( = ?auto_109634 ?auto_109636 ) ) ( not ( = ?auto_109635 ?auto_109638 ) ) ( not ( = ?auto_109635 ?auto_109636 ) ) ( not ( = ?auto_109640 ?auto_109638 ) ) ( not ( = ?auto_109640 ?auto_109636 ) ) ( not ( = ?auto_109638 ?auto_109636 ) ) ( ON ?auto_109638 ?auto_109640 ) ( not ( = ?auto_109637 ?auto_109639 ) ) ( not ( = ?auto_109637 ?auto_109636 ) ) ( not ( = ?auto_109639 ?auto_109636 ) ) ( not ( = ?auto_109633 ?auto_109639 ) ) ( not ( = ?auto_109633 ?auto_109637 ) ) ( not ( = ?auto_109634 ?auto_109639 ) ) ( not ( = ?auto_109634 ?auto_109637 ) ) ( not ( = ?auto_109635 ?auto_109639 ) ) ( not ( = ?auto_109635 ?auto_109637 ) ) ( not ( = ?auto_109640 ?auto_109639 ) ) ( not ( = ?auto_109640 ?auto_109637 ) ) ( not ( = ?auto_109638 ?auto_109639 ) ) ( not ( = ?auto_109638 ?auto_109637 ) ) ( ON ?auto_109636 ?auto_109638 ) ( ON ?auto_109639 ?auto_109636 ) ( ON ?auto_109637 ?auto_109639 ) ( CLEAR ?auto_109637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109633 ?auto_109634 ?auto_109635 ?auto_109640 ?auto_109638 ?auto_109636 ?auto_109639 )
      ( MAKE-3PILE ?auto_109633 ?auto_109634 ?auto_109635 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109646 - BLOCK
      ?auto_109647 - BLOCK
      ?auto_109648 - BLOCK
      ?auto_109649 - BLOCK
      ?auto_109650 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_109650 ) ( CLEAR ?auto_109649 ) ( ON-TABLE ?auto_109646 ) ( ON ?auto_109647 ?auto_109646 ) ( ON ?auto_109648 ?auto_109647 ) ( ON ?auto_109649 ?auto_109648 ) ( not ( = ?auto_109646 ?auto_109647 ) ) ( not ( = ?auto_109646 ?auto_109648 ) ) ( not ( = ?auto_109646 ?auto_109649 ) ) ( not ( = ?auto_109646 ?auto_109650 ) ) ( not ( = ?auto_109647 ?auto_109648 ) ) ( not ( = ?auto_109647 ?auto_109649 ) ) ( not ( = ?auto_109647 ?auto_109650 ) ) ( not ( = ?auto_109648 ?auto_109649 ) ) ( not ( = ?auto_109648 ?auto_109650 ) ) ( not ( = ?auto_109649 ?auto_109650 ) ) )
    :subtasks
    ( ( !STACK ?auto_109650 ?auto_109649 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109651 - BLOCK
      ?auto_109652 - BLOCK
      ?auto_109653 - BLOCK
      ?auto_109654 - BLOCK
      ?auto_109655 - BLOCK
    )
    :vars
    (
      ?auto_109656 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109654 ) ( ON-TABLE ?auto_109651 ) ( ON ?auto_109652 ?auto_109651 ) ( ON ?auto_109653 ?auto_109652 ) ( ON ?auto_109654 ?auto_109653 ) ( not ( = ?auto_109651 ?auto_109652 ) ) ( not ( = ?auto_109651 ?auto_109653 ) ) ( not ( = ?auto_109651 ?auto_109654 ) ) ( not ( = ?auto_109651 ?auto_109655 ) ) ( not ( = ?auto_109652 ?auto_109653 ) ) ( not ( = ?auto_109652 ?auto_109654 ) ) ( not ( = ?auto_109652 ?auto_109655 ) ) ( not ( = ?auto_109653 ?auto_109654 ) ) ( not ( = ?auto_109653 ?auto_109655 ) ) ( not ( = ?auto_109654 ?auto_109655 ) ) ( ON ?auto_109655 ?auto_109656 ) ( CLEAR ?auto_109655 ) ( HAND-EMPTY ) ( not ( = ?auto_109651 ?auto_109656 ) ) ( not ( = ?auto_109652 ?auto_109656 ) ) ( not ( = ?auto_109653 ?auto_109656 ) ) ( not ( = ?auto_109654 ?auto_109656 ) ) ( not ( = ?auto_109655 ?auto_109656 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109655 ?auto_109656 )
      ( MAKE-5PILE ?auto_109651 ?auto_109652 ?auto_109653 ?auto_109654 ?auto_109655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109657 - BLOCK
      ?auto_109658 - BLOCK
      ?auto_109659 - BLOCK
      ?auto_109660 - BLOCK
      ?auto_109661 - BLOCK
    )
    :vars
    (
      ?auto_109662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109657 ) ( ON ?auto_109658 ?auto_109657 ) ( ON ?auto_109659 ?auto_109658 ) ( not ( = ?auto_109657 ?auto_109658 ) ) ( not ( = ?auto_109657 ?auto_109659 ) ) ( not ( = ?auto_109657 ?auto_109660 ) ) ( not ( = ?auto_109657 ?auto_109661 ) ) ( not ( = ?auto_109658 ?auto_109659 ) ) ( not ( = ?auto_109658 ?auto_109660 ) ) ( not ( = ?auto_109658 ?auto_109661 ) ) ( not ( = ?auto_109659 ?auto_109660 ) ) ( not ( = ?auto_109659 ?auto_109661 ) ) ( not ( = ?auto_109660 ?auto_109661 ) ) ( ON ?auto_109661 ?auto_109662 ) ( CLEAR ?auto_109661 ) ( not ( = ?auto_109657 ?auto_109662 ) ) ( not ( = ?auto_109658 ?auto_109662 ) ) ( not ( = ?auto_109659 ?auto_109662 ) ) ( not ( = ?auto_109660 ?auto_109662 ) ) ( not ( = ?auto_109661 ?auto_109662 ) ) ( HOLDING ?auto_109660 ) ( CLEAR ?auto_109659 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109657 ?auto_109658 ?auto_109659 ?auto_109660 )
      ( MAKE-5PILE ?auto_109657 ?auto_109658 ?auto_109659 ?auto_109660 ?auto_109661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109663 - BLOCK
      ?auto_109664 - BLOCK
      ?auto_109665 - BLOCK
      ?auto_109666 - BLOCK
      ?auto_109667 - BLOCK
    )
    :vars
    (
      ?auto_109668 - BLOCK
      ?auto_109670 - BLOCK
      ?auto_109669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109663 ) ( ON ?auto_109664 ?auto_109663 ) ( ON ?auto_109665 ?auto_109664 ) ( not ( = ?auto_109663 ?auto_109664 ) ) ( not ( = ?auto_109663 ?auto_109665 ) ) ( not ( = ?auto_109663 ?auto_109666 ) ) ( not ( = ?auto_109663 ?auto_109667 ) ) ( not ( = ?auto_109664 ?auto_109665 ) ) ( not ( = ?auto_109664 ?auto_109666 ) ) ( not ( = ?auto_109664 ?auto_109667 ) ) ( not ( = ?auto_109665 ?auto_109666 ) ) ( not ( = ?auto_109665 ?auto_109667 ) ) ( not ( = ?auto_109666 ?auto_109667 ) ) ( ON ?auto_109667 ?auto_109668 ) ( not ( = ?auto_109663 ?auto_109668 ) ) ( not ( = ?auto_109664 ?auto_109668 ) ) ( not ( = ?auto_109665 ?auto_109668 ) ) ( not ( = ?auto_109666 ?auto_109668 ) ) ( not ( = ?auto_109667 ?auto_109668 ) ) ( CLEAR ?auto_109665 ) ( ON ?auto_109666 ?auto_109667 ) ( CLEAR ?auto_109666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109670 ) ( ON ?auto_109669 ?auto_109670 ) ( ON ?auto_109668 ?auto_109669 ) ( not ( = ?auto_109670 ?auto_109669 ) ) ( not ( = ?auto_109670 ?auto_109668 ) ) ( not ( = ?auto_109670 ?auto_109667 ) ) ( not ( = ?auto_109670 ?auto_109666 ) ) ( not ( = ?auto_109669 ?auto_109668 ) ) ( not ( = ?auto_109669 ?auto_109667 ) ) ( not ( = ?auto_109669 ?auto_109666 ) ) ( not ( = ?auto_109663 ?auto_109670 ) ) ( not ( = ?auto_109663 ?auto_109669 ) ) ( not ( = ?auto_109664 ?auto_109670 ) ) ( not ( = ?auto_109664 ?auto_109669 ) ) ( not ( = ?auto_109665 ?auto_109670 ) ) ( not ( = ?auto_109665 ?auto_109669 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109670 ?auto_109669 ?auto_109668 ?auto_109667 )
      ( MAKE-5PILE ?auto_109663 ?auto_109664 ?auto_109665 ?auto_109666 ?auto_109667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109671 - BLOCK
      ?auto_109672 - BLOCK
      ?auto_109673 - BLOCK
      ?auto_109674 - BLOCK
      ?auto_109675 - BLOCK
    )
    :vars
    (
      ?auto_109677 - BLOCK
      ?auto_109678 - BLOCK
      ?auto_109676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109671 ) ( ON ?auto_109672 ?auto_109671 ) ( not ( = ?auto_109671 ?auto_109672 ) ) ( not ( = ?auto_109671 ?auto_109673 ) ) ( not ( = ?auto_109671 ?auto_109674 ) ) ( not ( = ?auto_109671 ?auto_109675 ) ) ( not ( = ?auto_109672 ?auto_109673 ) ) ( not ( = ?auto_109672 ?auto_109674 ) ) ( not ( = ?auto_109672 ?auto_109675 ) ) ( not ( = ?auto_109673 ?auto_109674 ) ) ( not ( = ?auto_109673 ?auto_109675 ) ) ( not ( = ?auto_109674 ?auto_109675 ) ) ( ON ?auto_109675 ?auto_109677 ) ( not ( = ?auto_109671 ?auto_109677 ) ) ( not ( = ?auto_109672 ?auto_109677 ) ) ( not ( = ?auto_109673 ?auto_109677 ) ) ( not ( = ?auto_109674 ?auto_109677 ) ) ( not ( = ?auto_109675 ?auto_109677 ) ) ( ON ?auto_109674 ?auto_109675 ) ( CLEAR ?auto_109674 ) ( ON-TABLE ?auto_109678 ) ( ON ?auto_109676 ?auto_109678 ) ( ON ?auto_109677 ?auto_109676 ) ( not ( = ?auto_109678 ?auto_109676 ) ) ( not ( = ?auto_109678 ?auto_109677 ) ) ( not ( = ?auto_109678 ?auto_109675 ) ) ( not ( = ?auto_109678 ?auto_109674 ) ) ( not ( = ?auto_109676 ?auto_109677 ) ) ( not ( = ?auto_109676 ?auto_109675 ) ) ( not ( = ?auto_109676 ?auto_109674 ) ) ( not ( = ?auto_109671 ?auto_109678 ) ) ( not ( = ?auto_109671 ?auto_109676 ) ) ( not ( = ?auto_109672 ?auto_109678 ) ) ( not ( = ?auto_109672 ?auto_109676 ) ) ( not ( = ?auto_109673 ?auto_109678 ) ) ( not ( = ?auto_109673 ?auto_109676 ) ) ( HOLDING ?auto_109673 ) ( CLEAR ?auto_109672 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109671 ?auto_109672 ?auto_109673 )
      ( MAKE-5PILE ?auto_109671 ?auto_109672 ?auto_109673 ?auto_109674 ?auto_109675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109679 - BLOCK
      ?auto_109680 - BLOCK
      ?auto_109681 - BLOCK
      ?auto_109682 - BLOCK
      ?auto_109683 - BLOCK
    )
    :vars
    (
      ?auto_109684 - BLOCK
      ?auto_109686 - BLOCK
      ?auto_109685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109679 ) ( ON ?auto_109680 ?auto_109679 ) ( not ( = ?auto_109679 ?auto_109680 ) ) ( not ( = ?auto_109679 ?auto_109681 ) ) ( not ( = ?auto_109679 ?auto_109682 ) ) ( not ( = ?auto_109679 ?auto_109683 ) ) ( not ( = ?auto_109680 ?auto_109681 ) ) ( not ( = ?auto_109680 ?auto_109682 ) ) ( not ( = ?auto_109680 ?auto_109683 ) ) ( not ( = ?auto_109681 ?auto_109682 ) ) ( not ( = ?auto_109681 ?auto_109683 ) ) ( not ( = ?auto_109682 ?auto_109683 ) ) ( ON ?auto_109683 ?auto_109684 ) ( not ( = ?auto_109679 ?auto_109684 ) ) ( not ( = ?auto_109680 ?auto_109684 ) ) ( not ( = ?auto_109681 ?auto_109684 ) ) ( not ( = ?auto_109682 ?auto_109684 ) ) ( not ( = ?auto_109683 ?auto_109684 ) ) ( ON ?auto_109682 ?auto_109683 ) ( ON-TABLE ?auto_109686 ) ( ON ?auto_109685 ?auto_109686 ) ( ON ?auto_109684 ?auto_109685 ) ( not ( = ?auto_109686 ?auto_109685 ) ) ( not ( = ?auto_109686 ?auto_109684 ) ) ( not ( = ?auto_109686 ?auto_109683 ) ) ( not ( = ?auto_109686 ?auto_109682 ) ) ( not ( = ?auto_109685 ?auto_109684 ) ) ( not ( = ?auto_109685 ?auto_109683 ) ) ( not ( = ?auto_109685 ?auto_109682 ) ) ( not ( = ?auto_109679 ?auto_109686 ) ) ( not ( = ?auto_109679 ?auto_109685 ) ) ( not ( = ?auto_109680 ?auto_109686 ) ) ( not ( = ?auto_109680 ?auto_109685 ) ) ( not ( = ?auto_109681 ?auto_109686 ) ) ( not ( = ?auto_109681 ?auto_109685 ) ) ( CLEAR ?auto_109680 ) ( ON ?auto_109681 ?auto_109682 ) ( CLEAR ?auto_109681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109686 ?auto_109685 ?auto_109684 ?auto_109683 ?auto_109682 )
      ( MAKE-5PILE ?auto_109679 ?auto_109680 ?auto_109681 ?auto_109682 ?auto_109683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109687 - BLOCK
      ?auto_109688 - BLOCK
      ?auto_109689 - BLOCK
      ?auto_109690 - BLOCK
      ?auto_109691 - BLOCK
    )
    :vars
    (
      ?auto_109693 - BLOCK
      ?auto_109692 - BLOCK
      ?auto_109694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109687 ) ( not ( = ?auto_109687 ?auto_109688 ) ) ( not ( = ?auto_109687 ?auto_109689 ) ) ( not ( = ?auto_109687 ?auto_109690 ) ) ( not ( = ?auto_109687 ?auto_109691 ) ) ( not ( = ?auto_109688 ?auto_109689 ) ) ( not ( = ?auto_109688 ?auto_109690 ) ) ( not ( = ?auto_109688 ?auto_109691 ) ) ( not ( = ?auto_109689 ?auto_109690 ) ) ( not ( = ?auto_109689 ?auto_109691 ) ) ( not ( = ?auto_109690 ?auto_109691 ) ) ( ON ?auto_109691 ?auto_109693 ) ( not ( = ?auto_109687 ?auto_109693 ) ) ( not ( = ?auto_109688 ?auto_109693 ) ) ( not ( = ?auto_109689 ?auto_109693 ) ) ( not ( = ?auto_109690 ?auto_109693 ) ) ( not ( = ?auto_109691 ?auto_109693 ) ) ( ON ?auto_109690 ?auto_109691 ) ( ON-TABLE ?auto_109692 ) ( ON ?auto_109694 ?auto_109692 ) ( ON ?auto_109693 ?auto_109694 ) ( not ( = ?auto_109692 ?auto_109694 ) ) ( not ( = ?auto_109692 ?auto_109693 ) ) ( not ( = ?auto_109692 ?auto_109691 ) ) ( not ( = ?auto_109692 ?auto_109690 ) ) ( not ( = ?auto_109694 ?auto_109693 ) ) ( not ( = ?auto_109694 ?auto_109691 ) ) ( not ( = ?auto_109694 ?auto_109690 ) ) ( not ( = ?auto_109687 ?auto_109692 ) ) ( not ( = ?auto_109687 ?auto_109694 ) ) ( not ( = ?auto_109688 ?auto_109692 ) ) ( not ( = ?auto_109688 ?auto_109694 ) ) ( not ( = ?auto_109689 ?auto_109692 ) ) ( not ( = ?auto_109689 ?auto_109694 ) ) ( ON ?auto_109689 ?auto_109690 ) ( CLEAR ?auto_109689 ) ( HOLDING ?auto_109688 ) ( CLEAR ?auto_109687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109687 ?auto_109688 )
      ( MAKE-5PILE ?auto_109687 ?auto_109688 ?auto_109689 ?auto_109690 ?auto_109691 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109695 - BLOCK
      ?auto_109696 - BLOCK
      ?auto_109697 - BLOCK
      ?auto_109698 - BLOCK
      ?auto_109699 - BLOCK
    )
    :vars
    (
      ?auto_109702 - BLOCK
      ?auto_109700 - BLOCK
      ?auto_109701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109695 ) ( not ( = ?auto_109695 ?auto_109696 ) ) ( not ( = ?auto_109695 ?auto_109697 ) ) ( not ( = ?auto_109695 ?auto_109698 ) ) ( not ( = ?auto_109695 ?auto_109699 ) ) ( not ( = ?auto_109696 ?auto_109697 ) ) ( not ( = ?auto_109696 ?auto_109698 ) ) ( not ( = ?auto_109696 ?auto_109699 ) ) ( not ( = ?auto_109697 ?auto_109698 ) ) ( not ( = ?auto_109697 ?auto_109699 ) ) ( not ( = ?auto_109698 ?auto_109699 ) ) ( ON ?auto_109699 ?auto_109702 ) ( not ( = ?auto_109695 ?auto_109702 ) ) ( not ( = ?auto_109696 ?auto_109702 ) ) ( not ( = ?auto_109697 ?auto_109702 ) ) ( not ( = ?auto_109698 ?auto_109702 ) ) ( not ( = ?auto_109699 ?auto_109702 ) ) ( ON ?auto_109698 ?auto_109699 ) ( ON-TABLE ?auto_109700 ) ( ON ?auto_109701 ?auto_109700 ) ( ON ?auto_109702 ?auto_109701 ) ( not ( = ?auto_109700 ?auto_109701 ) ) ( not ( = ?auto_109700 ?auto_109702 ) ) ( not ( = ?auto_109700 ?auto_109699 ) ) ( not ( = ?auto_109700 ?auto_109698 ) ) ( not ( = ?auto_109701 ?auto_109702 ) ) ( not ( = ?auto_109701 ?auto_109699 ) ) ( not ( = ?auto_109701 ?auto_109698 ) ) ( not ( = ?auto_109695 ?auto_109700 ) ) ( not ( = ?auto_109695 ?auto_109701 ) ) ( not ( = ?auto_109696 ?auto_109700 ) ) ( not ( = ?auto_109696 ?auto_109701 ) ) ( not ( = ?auto_109697 ?auto_109700 ) ) ( not ( = ?auto_109697 ?auto_109701 ) ) ( ON ?auto_109697 ?auto_109698 ) ( CLEAR ?auto_109695 ) ( ON ?auto_109696 ?auto_109697 ) ( CLEAR ?auto_109696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109700 ?auto_109701 ?auto_109702 ?auto_109699 ?auto_109698 ?auto_109697 )
      ( MAKE-5PILE ?auto_109695 ?auto_109696 ?auto_109697 ?auto_109698 ?auto_109699 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109703 - BLOCK
      ?auto_109704 - BLOCK
      ?auto_109705 - BLOCK
      ?auto_109706 - BLOCK
      ?auto_109707 - BLOCK
    )
    :vars
    (
      ?auto_109709 - BLOCK
      ?auto_109708 - BLOCK
      ?auto_109710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109703 ?auto_109704 ) ) ( not ( = ?auto_109703 ?auto_109705 ) ) ( not ( = ?auto_109703 ?auto_109706 ) ) ( not ( = ?auto_109703 ?auto_109707 ) ) ( not ( = ?auto_109704 ?auto_109705 ) ) ( not ( = ?auto_109704 ?auto_109706 ) ) ( not ( = ?auto_109704 ?auto_109707 ) ) ( not ( = ?auto_109705 ?auto_109706 ) ) ( not ( = ?auto_109705 ?auto_109707 ) ) ( not ( = ?auto_109706 ?auto_109707 ) ) ( ON ?auto_109707 ?auto_109709 ) ( not ( = ?auto_109703 ?auto_109709 ) ) ( not ( = ?auto_109704 ?auto_109709 ) ) ( not ( = ?auto_109705 ?auto_109709 ) ) ( not ( = ?auto_109706 ?auto_109709 ) ) ( not ( = ?auto_109707 ?auto_109709 ) ) ( ON ?auto_109706 ?auto_109707 ) ( ON-TABLE ?auto_109708 ) ( ON ?auto_109710 ?auto_109708 ) ( ON ?auto_109709 ?auto_109710 ) ( not ( = ?auto_109708 ?auto_109710 ) ) ( not ( = ?auto_109708 ?auto_109709 ) ) ( not ( = ?auto_109708 ?auto_109707 ) ) ( not ( = ?auto_109708 ?auto_109706 ) ) ( not ( = ?auto_109710 ?auto_109709 ) ) ( not ( = ?auto_109710 ?auto_109707 ) ) ( not ( = ?auto_109710 ?auto_109706 ) ) ( not ( = ?auto_109703 ?auto_109708 ) ) ( not ( = ?auto_109703 ?auto_109710 ) ) ( not ( = ?auto_109704 ?auto_109708 ) ) ( not ( = ?auto_109704 ?auto_109710 ) ) ( not ( = ?auto_109705 ?auto_109708 ) ) ( not ( = ?auto_109705 ?auto_109710 ) ) ( ON ?auto_109705 ?auto_109706 ) ( ON ?auto_109704 ?auto_109705 ) ( CLEAR ?auto_109704 ) ( HOLDING ?auto_109703 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109703 )
      ( MAKE-5PILE ?auto_109703 ?auto_109704 ?auto_109705 ?auto_109706 ?auto_109707 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109711 - BLOCK
      ?auto_109712 - BLOCK
      ?auto_109713 - BLOCK
      ?auto_109714 - BLOCK
      ?auto_109715 - BLOCK
    )
    :vars
    (
      ?auto_109717 - BLOCK
      ?auto_109718 - BLOCK
      ?auto_109716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109711 ?auto_109712 ) ) ( not ( = ?auto_109711 ?auto_109713 ) ) ( not ( = ?auto_109711 ?auto_109714 ) ) ( not ( = ?auto_109711 ?auto_109715 ) ) ( not ( = ?auto_109712 ?auto_109713 ) ) ( not ( = ?auto_109712 ?auto_109714 ) ) ( not ( = ?auto_109712 ?auto_109715 ) ) ( not ( = ?auto_109713 ?auto_109714 ) ) ( not ( = ?auto_109713 ?auto_109715 ) ) ( not ( = ?auto_109714 ?auto_109715 ) ) ( ON ?auto_109715 ?auto_109717 ) ( not ( = ?auto_109711 ?auto_109717 ) ) ( not ( = ?auto_109712 ?auto_109717 ) ) ( not ( = ?auto_109713 ?auto_109717 ) ) ( not ( = ?auto_109714 ?auto_109717 ) ) ( not ( = ?auto_109715 ?auto_109717 ) ) ( ON ?auto_109714 ?auto_109715 ) ( ON-TABLE ?auto_109718 ) ( ON ?auto_109716 ?auto_109718 ) ( ON ?auto_109717 ?auto_109716 ) ( not ( = ?auto_109718 ?auto_109716 ) ) ( not ( = ?auto_109718 ?auto_109717 ) ) ( not ( = ?auto_109718 ?auto_109715 ) ) ( not ( = ?auto_109718 ?auto_109714 ) ) ( not ( = ?auto_109716 ?auto_109717 ) ) ( not ( = ?auto_109716 ?auto_109715 ) ) ( not ( = ?auto_109716 ?auto_109714 ) ) ( not ( = ?auto_109711 ?auto_109718 ) ) ( not ( = ?auto_109711 ?auto_109716 ) ) ( not ( = ?auto_109712 ?auto_109718 ) ) ( not ( = ?auto_109712 ?auto_109716 ) ) ( not ( = ?auto_109713 ?auto_109718 ) ) ( not ( = ?auto_109713 ?auto_109716 ) ) ( ON ?auto_109713 ?auto_109714 ) ( ON ?auto_109712 ?auto_109713 ) ( ON ?auto_109711 ?auto_109712 ) ( CLEAR ?auto_109711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109718 ?auto_109716 ?auto_109717 ?auto_109715 ?auto_109714 ?auto_109713 ?auto_109712 )
      ( MAKE-5PILE ?auto_109711 ?auto_109712 ?auto_109713 ?auto_109714 ?auto_109715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109721 - BLOCK
      ?auto_109722 - BLOCK
    )
    :vars
    (
      ?auto_109723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109723 ?auto_109722 ) ( CLEAR ?auto_109723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109721 ) ( ON ?auto_109722 ?auto_109721 ) ( not ( = ?auto_109721 ?auto_109722 ) ) ( not ( = ?auto_109721 ?auto_109723 ) ) ( not ( = ?auto_109722 ?auto_109723 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109723 ?auto_109722 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109724 - BLOCK
      ?auto_109725 - BLOCK
    )
    :vars
    (
      ?auto_109726 - BLOCK
      ?auto_109727 - BLOCK
      ?auto_109728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109726 ?auto_109725 ) ( CLEAR ?auto_109726 ) ( ON-TABLE ?auto_109724 ) ( ON ?auto_109725 ?auto_109724 ) ( not ( = ?auto_109724 ?auto_109725 ) ) ( not ( = ?auto_109724 ?auto_109726 ) ) ( not ( = ?auto_109725 ?auto_109726 ) ) ( HOLDING ?auto_109727 ) ( CLEAR ?auto_109728 ) ( not ( = ?auto_109724 ?auto_109727 ) ) ( not ( = ?auto_109724 ?auto_109728 ) ) ( not ( = ?auto_109725 ?auto_109727 ) ) ( not ( = ?auto_109725 ?auto_109728 ) ) ( not ( = ?auto_109726 ?auto_109727 ) ) ( not ( = ?auto_109726 ?auto_109728 ) ) ( not ( = ?auto_109727 ?auto_109728 ) ) )
    :subtasks
    ( ( !STACK ?auto_109727 ?auto_109728 )
      ( MAKE-2PILE ?auto_109724 ?auto_109725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109729 - BLOCK
      ?auto_109730 - BLOCK
    )
    :vars
    (
      ?auto_109732 - BLOCK
      ?auto_109733 - BLOCK
      ?auto_109731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109732 ?auto_109730 ) ( ON-TABLE ?auto_109729 ) ( ON ?auto_109730 ?auto_109729 ) ( not ( = ?auto_109729 ?auto_109730 ) ) ( not ( = ?auto_109729 ?auto_109732 ) ) ( not ( = ?auto_109730 ?auto_109732 ) ) ( CLEAR ?auto_109733 ) ( not ( = ?auto_109729 ?auto_109731 ) ) ( not ( = ?auto_109729 ?auto_109733 ) ) ( not ( = ?auto_109730 ?auto_109731 ) ) ( not ( = ?auto_109730 ?auto_109733 ) ) ( not ( = ?auto_109732 ?auto_109731 ) ) ( not ( = ?auto_109732 ?auto_109733 ) ) ( not ( = ?auto_109731 ?auto_109733 ) ) ( ON ?auto_109731 ?auto_109732 ) ( CLEAR ?auto_109731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109729 ?auto_109730 ?auto_109732 )
      ( MAKE-2PILE ?auto_109729 ?auto_109730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109734 - BLOCK
      ?auto_109735 - BLOCK
    )
    :vars
    (
      ?auto_109737 - BLOCK
      ?auto_109736 - BLOCK
      ?auto_109738 - BLOCK
      ?auto_109741 - BLOCK
      ?auto_109739 - BLOCK
      ?auto_109740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109737 ?auto_109735 ) ( ON-TABLE ?auto_109734 ) ( ON ?auto_109735 ?auto_109734 ) ( not ( = ?auto_109734 ?auto_109735 ) ) ( not ( = ?auto_109734 ?auto_109737 ) ) ( not ( = ?auto_109735 ?auto_109737 ) ) ( not ( = ?auto_109734 ?auto_109736 ) ) ( not ( = ?auto_109734 ?auto_109738 ) ) ( not ( = ?auto_109735 ?auto_109736 ) ) ( not ( = ?auto_109735 ?auto_109738 ) ) ( not ( = ?auto_109737 ?auto_109736 ) ) ( not ( = ?auto_109737 ?auto_109738 ) ) ( not ( = ?auto_109736 ?auto_109738 ) ) ( ON ?auto_109736 ?auto_109737 ) ( CLEAR ?auto_109736 ) ( HOLDING ?auto_109738 ) ( CLEAR ?auto_109741 ) ( ON-TABLE ?auto_109739 ) ( ON ?auto_109740 ?auto_109739 ) ( ON ?auto_109741 ?auto_109740 ) ( not ( = ?auto_109739 ?auto_109740 ) ) ( not ( = ?auto_109739 ?auto_109741 ) ) ( not ( = ?auto_109739 ?auto_109738 ) ) ( not ( = ?auto_109740 ?auto_109741 ) ) ( not ( = ?auto_109740 ?auto_109738 ) ) ( not ( = ?auto_109741 ?auto_109738 ) ) ( not ( = ?auto_109734 ?auto_109741 ) ) ( not ( = ?auto_109734 ?auto_109739 ) ) ( not ( = ?auto_109734 ?auto_109740 ) ) ( not ( = ?auto_109735 ?auto_109741 ) ) ( not ( = ?auto_109735 ?auto_109739 ) ) ( not ( = ?auto_109735 ?auto_109740 ) ) ( not ( = ?auto_109737 ?auto_109741 ) ) ( not ( = ?auto_109737 ?auto_109739 ) ) ( not ( = ?auto_109737 ?auto_109740 ) ) ( not ( = ?auto_109736 ?auto_109741 ) ) ( not ( = ?auto_109736 ?auto_109739 ) ) ( not ( = ?auto_109736 ?auto_109740 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109739 ?auto_109740 ?auto_109741 ?auto_109738 )
      ( MAKE-2PILE ?auto_109734 ?auto_109735 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109742 - BLOCK
      ?auto_109743 - BLOCK
    )
    :vars
    (
      ?auto_109746 - BLOCK
      ?auto_109744 - BLOCK
      ?auto_109748 - BLOCK
      ?auto_109749 - BLOCK
      ?auto_109747 - BLOCK
      ?auto_109745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109746 ?auto_109743 ) ( ON-TABLE ?auto_109742 ) ( ON ?auto_109743 ?auto_109742 ) ( not ( = ?auto_109742 ?auto_109743 ) ) ( not ( = ?auto_109742 ?auto_109746 ) ) ( not ( = ?auto_109743 ?auto_109746 ) ) ( not ( = ?auto_109742 ?auto_109744 ) ) ( not ( = ?auto_109742 ?auto_109748 ) ) ( not ( = ?auto_109743 ?auto_109744 ) ) ( not ( = ?auto_109743 ?auto_109748 ) ) ( not ( = ?auto_109746 ?auto_109744 ) ) ( not ( = ?auto_109746 ?auto_109748 ) ) ( not ( = ?auto_109744 ?auto_109748 ) ) ( ON ?auto_109744 ?auto_109746 ) ( CLEAR ?auto_109749 ) ( ON-TABLE ?auto_109747 ) ( ON ?auto_109745 ?auto_109747 ) ( ON ?auto_109749 ?auto_109745 ) ( not ( = ?auto_109747 ?auto_109745 ) ) ( not ( = ?auto_109747 ?auto_109749 ) ) ( not ( = ?auto_109747 ?auto_109748 ) ) ( not ( = ?auto_109745 ?auto_109749 ) ) ( not ( = ?auto_109745 ?auto_109748 ) ) ( not ( = ?auto_109749 ?auto_109748 ) ) ( not ( = ?auto_109742 ?auto_109749 ) ) ( not ( = ?auto_109742 ?auto_109747 ) ) ( not ( = ?auto_109742 ?auto_109745 ) ) ( not ( = ?auto_109743 ?auto_109749 ) ) ( not ( = ?auto_109743 ?auto_109747 ) ) ( not ( = ?auto_109743 ?auto_109745 ) ) ( not ( = ?auto_109746 ?auto_109749 ) ) ( not ( = ?auto_109746 ?auto_109747 ) ) ( not ( = ?auto_109746 ?auto_109745 ) ) ( not ( = ?auto_109744 ?auto_109749 ) ) ( not ( = ?auto_109744 ?auto_109747 ) ) ( not ( = ?auto_109744 ?auto_109745 ) ) ( ON ?auto_109748 ?auto_109744 ) ( CLEAR ?auto_109748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109742 ?auto_109743 ?auto_109746 ?auto_109744 )
      ( MAKE-2PILE ?auto_109742 ?auto_109743 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109750 - BLOCK
      ?auto_109751 - BLOCK
    )
    :vars
    (
      ?auto_109755 - BLOCK
      ?auto_109752 - BLOCK
      ?auto_109754 - BLOCK
      ?auto_109757 - BLOCK
      ?auto_109756 - BLOCK
      ?auto_109753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109755 ?auto_109751 ) ( ON-TABLE ?auto_109750 ) ( ON ?auto_109751 ?auto_109750 ) ( not ( = ?auto_109750 ?auto_109751 ) ) ( not ( = ?auto_109750 ?auto_109755 ) ) ( not ( = ?auto_109751 ?auto_109755 ) ) ( not ( = ?auto_109750 ?auto_109752 ) ) ( not ( = ?auto_109750 ?auto_109754 ) ) ( not ( = ?auto_109751 ?auto_109752 ) ) ( not ( = ?auto_109751 ?auto_109754 ) ) ( not ( = ?auto_109755 ?auto_109752 ) ) ( not ( = ?auto_109755 ?auto_109754 ) ) ( not ( = ?auto_109752 ?auto_109754 ) ) ( ON ?auto_109752 ?auto_109755 ) ( ON-TABLE ?auto_109757 ) ( ON ?auto_109756 ?auto_109757 ) ( not ( = ?auto_109757 ?auto_109756 ) ) ( not ( = ?auto_109757 ?auto_109753 ) ) ( not ( = ?auto_109757 ?auto_109754 ) ) ( not ( = ?auto_109756 ?auto_109753 ) ) ( not ( = ?auto_109756 ?auto_109754 ) ) ( not ( = ?auto_109753 ?auto_109754 ) ) ( not ( = ?auto_109750 ?auto_109753 ) ) ( not ( = ?auto_109750 ?auto_109757 ) ) ( not ( = ?auto_109750 ?auto_109756 ) ) ( not ( = ?auto_109751 ?auto_109753 ) ) ( not ( = ?auto_109751 ?auto_109757 ) ) ( not ( = ?auto_109751 ?auto_109756 ) ) ( not ( = ?auto_109755 ?auto_109753 ) ) ( not ( = ?auto_109755 ?auto_109757 ) ) ( not ( = ?auto_109755 ?auto_109756 ) ) ( not ( = ?auto_109752 ?auto_109753 ) ) ( not ( = ?auto_109752 ?auto_109757 ) ) ( not ( = ?auto_109752 ?auto_109756 ) ) ( ON ?auto_109754 ?auto_109752 ) ( CLEAR ?auto_109754 ) ( HOLDING ?auto_109753 ) ( CLEAR ?auto_109756 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109757 ?auto_109756 ?auto_109753 )
      ( MAKE-2PILE ?auto_109750 ?auto_109751 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109758 - BLOCK
      ?auto_109759 - BLOCK
    )
    :vars
    (
      ?auto_109763 - BLOCK
      ?auto_109765 - BLOCK
      ?auto_109760 - BLOCK
      ?auto_109764 - BLOCK
      ?auto_109762 - BLOCK
      ?auto_109761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109763 ?auto_109759 ) ( ON-TABLE ?auto_109758 ) ( ON ?auto_109759 ?auto_109758 ) ( not ( = ?auto_109758 ?auto_109759 ) ) ( not ( = ?auto_109758 ?auto_109763 ) ) ( not ( = ?auto_109759 ?auto_109763 ) ) ( not ( = ?auto_109758 ?auto_109765 ) ) ( not ( = ?auto_109758 ?auto_109760 ) ) ( not ( = ?auto_109759 ?auto_109765 ) ) ( not ( = ?auto_109759 ?auto_109760 ) ) ( not ( = ?auto_109763 ?auto_109765 ) ) ( not ( = ?auto_109763 ?auto_109760 ) ) ( not ( = ?auto_109765 ?auto_109760 ) ) ( ON ?auto_109765 ?auto_109763 ) ( ON-TABLE ?auto_109764 ) ( ON ?auto_109762 ?auto_109764 ) ( not ( = ?auto_109764 ?auto_109762 ) ) ( not ( = ?auto_109764 ?auto_109761 ) ) ( not ( = ?auto_109764 ?auto_109760 ) ) ( not ( = ?auto_109762 ?auto_109761 ) ) ( not ( = ?auto_109762 ?auto_109760 ) ) ( not ( = ?auto_109761 ?auto_109760 ) ) ( not ( = ?auto_109758 ?auto_109761 ) ) ( not ( = ?auto_109758 ?auto_109764 ) ) ( not ( = ?auto_109758 ?auto_109762 ) ) ( not ( = ?auto_109759 ?auto_109761 ) ) ( not ( = ?auto_109759 ?auto_109764 ) ) ( not ( = ?auto_109759 ?auto_109762 ) ) ( not ( = ?auto_109763 ?auto_109761 ) ) ( not ( = ?auto_109763 ?auto_109764 ) ) ( not ( = ?auto_109763 ?auto_109762 ) ) ( not ( = ?auto_109765 ?auto_109761 ) ) ( not ( = ?auto_109765 ?auto_109764 ) ) ( not ( = ?auto_109765 ?auto_109762 ) ) ( ON ?auto_109760 ?auto_109765 ) ( CLEAR ?auto_109762 ) ( ON ?auto_109761 ?auto_109760 ) ( CLEAR ?auto_109761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109758 ?auto_109759 ?auto_109763 ?auto_109765 ?auto_109760 )
      ( MAKE-2PILE ?auto_109758 ?auto_109759 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109766 - BLOCK
      ?auto_109767 - BLOCK
    )
    :vars
    (
      ?auto_109771 - BLOCK
      ?auto_109773 - BLOCK
      ?auto_109768 - BLOCK
      ?auto_109772 - BLOCK
      ?auto_109769 - BLOCK
      ?auto_109770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109771 ?auto_109767 ) ( ON-TABLE ?auto_109766 ) ( ON ?auto_109767 ?auto_109766 ) ( not ( = ?auto_109766 ?auto_109767 ) ) ( not ( = ?auto_109766 ?auto_109771 ) ) ( not ( = ?auto_109767 ?auto_109771 ) ) ( not ( = ?auto_109766 ?auto_109773 ) ) ( not ( = ?auto_109766 ?auto_109768 ) ) ( not ( = ?auto_109767 ?auto_109773 ) ) ( not ( = ?auto_109767 ?auto_109768 ) ) ( not ( = ?auto_109771 ?auto_109773 ) ) ( not ( = ?auto_109771 ?auto_109768 ) ) ( not ( = ?auto_109773 ?auto_109768 ) ) ( ON ?auto_109773 ?auto_109771 ) ( ON-TABLE ?auto_109772 ) ( not ( = ?auto_109772 ?auto_109769 ) ) ( not ( = ?auto_109772 ?auto_109770 ) ) ( not ( = ?auto_109772 ?auto_109768 ) ) ( not ( = ?auto_109769 ?auto_109770 ) ) ( not ( = ?auto_109769 ?auto_109768 ) ) ( not ( = ?auto_109770 ?auto_109768 ) ) ( not ( = ?auto_109766 ?auto_109770 ) ) ( not ( = ?auto_109766 ?auto_109772 ) ) ( not ( = ?auto_109766 ?auto_109769 ) ) ( not ( = ?auto_109767 ?auto_109770 ) ) ( not ( = ?auto_109767 ?auto_109772 ) ) ( not ( = ?auto_109767 ?auto_109769 ) ) ( not ( = ?auto_109771 ?auto_109770 ) ) ( not ( = ?auto_109771 ?auto_109772 ) ) ( not ( = ?auto_109771 ?auto_109769 ) ) ( not ( = ?auto_109773 ?auto_109770 ) ) ( not ( = ?auto_109773 ?auto_109772 ) ) ( not ( = ?auto_109773 ?auto_109769 ) ) ( ON ?auto_109768 ?auto_109773 ) ( ON ?auto_109770 ?auto_109768 ) ( CLEAR ?auto_109770 ) ( HOLDING ?auto_109769 ) ( CLEAR ?auto_109772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109772 ?auto_109769 )
      ( MAKE-2PILE ?auto_109766 ?auto_109767 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111067 - BLOCK
      ?auto_111068 - BLOCK
    )
    :vars
    (
      ?auto_111071 - BLOCK
      ?auto_111073 - BLOCK
      ?auto_111070 - BLOCK
      ?auto_111069 - BLOCK
      ?auto_111072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111071 ?auto_111068 ) ( ON-TABLE ?auto_111067 ) ( ON ?auto_111068 ?auto_111067 ) ( not ( = ?auto_111067 ?auto_111068 ) ) ( not ( = ?auto_111067 ?auto_111071 ) ) ( not ( = ?auto_111068 ?auto_111071 ) ) ( not ( = ?auto_111067 ?auto_111073 ) ) ( not ( = ?auto_111067 ?auto_111070 ) ) ( not ( = ?auto_111068 ?auto_111073 ) ) ( not ( = ?auto_111068 ?auto_111070 ) ) ( not ( = ?auto_111071 ?auto_111073 ) ) ( not ( = ?auto_111071 ?auto_111070 ) ) ( not ( = ?auto_111073 ?auto_111070 ) ) ( ON ?auto_111073 ?auto_111071 ) ( not ( = ?auto_111069 ?auto_111072 ) ) ( not ( = ?auto_111069 ?auto_111070 ) ) ( not ( = ?auto_111072 ?auto_111070 ) ) ( not ( = ?auto_111067 ?auto_111072 ) ) ( not ( = ?auto_111067 ?auto_111069 ) ) ( not ( = ?auto_111068 ?auto_111072 ) ) ( not ( = ?auto_111068 ?auto_111069 ) ) ( not ( = ?auto_111071 ?auto_111072 ) ) ( not ( = ?auto_111071 ?auto_111069 ) ) ( not ( = ?auto_111073 ?auto_111072 ) ) ( not ( = ?auto_111073 ?auto_111069 ) ) ( ON ?auto_111070 ?auto_111073 ) ( ON ?auto_111072 ?auto_111070 ) ( ON ?auto_111069 ?auto_111072 ) ( CLEAR ?auto_111069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111067 ?auto_111068 ?auto_111071 ?auto_111073 ?auto_111070 ?auto_111072 )
      ( MAKE-2PILE ?auto_111067 ?auto_111068 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109782 - BLOCK
      ?auto_109783 - BLOCK
    )
    :vars
    (
      ?auto_109789 - BLOCK
      ?auto_109784 - BLOCK
      ?auto_109785 - BLOCK
      ?auto_109788 - BLOCK
      ?auto_109787 - BLOCK
      ?auto_109786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109789 ?auto_109783 ) ( ON-TABLE ?auto_109782 ) ( ON ?auto_109783 ?auto_109782 ) ( not ( = ?auto_109782 ?auto_109783 ) ) ( not ( = ?auto_109782 ?auto_109789 ) ) ( not ( = ?auto_109783 ?auto_109789 ) ) ( not ( = ?auto_109782 ?auto_109784 ) ) ( not ( = ?auto_109782 ?auto_109785 ) ) ( not ( = ?auto_109783 ?auto_109784 ) ) ( not ( = ?auto_109783 ?auto_109785 ) ) ( not ( = ?auto_109789 ?auto_109784 ) ) ( not ( = ?auto_109789 ?auto_109785 ) ) ( not ( = ?auto_109784 ?auto_109785 ) ) ( ON ?auto_109784 ?auto_109789 ) ( not ( = ?auto_109788 ?auto_109787 ) ) ( not ( = ?auto_109788 ?auto_109786 ) ) ( not ( = ?auto_109788 ?auto_109785 ) ) ( not ( = ?auto_109787 ?auto_109786 ) ) ( not ( = ?auto_109787 ?auto_109785 ) ) ( not ( = ?auto_109786 ?auto_109785 ) ) ( not ( = ?auto_109782 ?auto_109786 ) ) ( not ( = ?auto_109782 ?auto_109788 ) ) ( not ( = ?auto_109782 ?auto_109787 ) ) ( not ( = ?auto_109783 ?auto_109786 ) ) ( not ( = ?auto_109783 ?auto_109788 ) ) ( not ( = ?auto_109783 ?auto_109787 ) ) ( not ( = ?auto_109789 ?auto_109786 ) ) ( not ( = ?auto_109789 ?auto_109788 ) ) ( not ( = ?auto_109789 ?auto_109787 ) ) ( not ( = ?auto_109784 ?auto_109786 ) ) ( not ( = ?auto_109784 ?auto_109788 ) ) ( not ( = ?auto_109784 ?auto_109787 ) ) ( ON ?auto_109785 ?auto_109784 ) ( ON ?auto_109786 ?auto_109785 ) ( ON ?auto_109787 ?auto_109786 ) ( CLEAR ?auto_109787 ) ( HOLDING ?auto_109788 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109788 )
      ( MAKE-2PILE ?auto_109782 ?auto_109783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109790 - BLOCK
      ?auto_109791 - BLOCK
    )
    :vars
    (
      ?auto_109794 - BLOCK
      ?auto_109795 - BLOCK
      ?auto_109796 - BLOCK
      ?auto_109793 - BLOCK
      ?auto_109797 - BLOCK
      ?auto_109792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109794 ?auto_109791 ) ( ON-TABLE ?auto_109790 ) ( ON ?auto_109791 ?auto_109790 ) ( not ( = ?auto_109790 ?auto_109791 ) ) ( not ( = ?auto_109790 ?auto_109794 ) ) ( not ( = ?auto_109791 ?auto_109794 ) ) ( not ( = ?auto_109790 ?auto_109795 ) ) ( not ( = ?auto_109790 ?auto_109796 ) ) ( not ( = ?auto_109791 ?auto_109795 ) ) ( not ( = ?auto_109791 ?auto_109796 ) ) ( not ( = ?auto_109794 ?auto_109795 ) ) ( not ( = ?auto_109794 ?auto_109796 ) ) ( not ( = ?auto_109795 ?auto_109796 ) ) ( ON ?auto_109795 ?auto_109794 ) ( not ( = ?auto_109793 ?auto_109797 ) ) ( not ( = ?auto_109793 ?auto_109792 ) ) ( not ( = ?auto_109793 ?auto_109796 ) ) ( not ( = ?auto_109797 ?auto_109792 ) ) ( not ( = ?auto_109797 ?auto_109796 ) ) ( not ( = ?auto_109792 ?auto_109796 ) ) ( not ( = ?auto_109790 ?auto_109792 ) ) ( not ( = ?auto_109790 ?auto_109793 ) ) ( not ( = ?auto_109790 ?auto_109797 ) ) ( not ( = ?auto_109791 ?auto_109792 ) ) ( not ( = ?auto_109791 ?auto_109793 ) ) ( not ( = ?auto_109791 ?auto_109797 ) ) ( not ( = ?auto_109794 ?auto_109792 ) ) ( not ( = ?auto_109794 ?auto_109793 ) ) ( not ( = ?auto_109794 ?auto_109797 ) ) ( not ( = ?auto_109795 ?auto_109792 ) ) ( not ( = ?auto_109795 ?auto_109793 ) ) ( not ( = ?auto_109795 ?auto_109797 ) ) ( ON ?auto_109796 ?auto_109795 ) ( ON ?auto_109792 ?auto_109796 ) ( ON ?auto_109797 ?auto_109792 ) ( ON ?auto_109793 ?auto_109797 ) ( CLEAR ?auto_109793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109790 ?auto_109791 ?auto_109794 ?auto_109795 ?auto_109796 ?auto_109792 ?auto_109797 )
      ( MAKE-2PILE ?auto_109790 ?auto_109791 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109804 - BLOCK
      ?auto_109805 - BLOCK
      ?auto_109806 - BLOCK
      ?auto_109807 - BLOCK
      ?auto_109808 - BLOCK
      ?auto_109809 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_109809 ) ( CLEAR ?auto_109808 ) ( ON-TABLE ?auto_109804 ) ( ON ?auto_109805 ?auto_109804 ) ( ON ?auto_109806 ?auto_109805 ) ( ON ?auto_109807 ?auto_109806 ) ( ON ?auto_109808 ?auto_109807 ) ( not ( = ?auto_109804 ?auto_109805 ) ) ( not ( = ?auto_109804 ?auto_109806 ) ) ( not ( = ?auto_109804 ?auto_109807 ) ) ( not ( = ?auto_109804 ?auto_109808 ) ) ( not ( = ?auto_109804 ?auto_109809 ) ) ( not ( = ?auto_109805 ?auto_109806 ) ) ( not ( = ?auto_109805 ?auto_109807 ) ) ( not ( = ?auto_109805 ?auto_109808 ) ) ( not ( = ?auto_109805 ?auto_109809 ) ) ( not ( = ?auto_109806 ?auto_109807 ) ) ( not ( = ?auto_109806 ?auto_109808 ) ) ( not ( = ?auto_109806 ?auto_109809 ) ) ( not ( = ?auto_109807 ?auto_109808 ) ) ( not ( = ?auto_109807 ?auto_109809 ) ) ( not ( = ?auto_109808 ?auto_109809 ) ) )
    :subtasks
    ( ( !STACK ?auto_109809 ?auto_109808 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109810 - BLOCK
      ?auto_109811 - BLOCK
      ?auto_109812 - BLOCK
      ?auto_109813 - BLOCK
      ?auto_109814 - BLOCK
      ?auto_109815 - BLOCK
    )
    :vars
    (
      ?auto_109816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109814 ) ( ON-TABLE ?auto_109810 ) ( ON ?auto_109811 ?auto_109810 ) ( ON ?auto_109812 ?auto_109811 ) ( ON ?auto_109813 ?auto_109812 ) ( ON ?auto_109814 ?auto_109813 ) ( not ( = ?auto_109810 ?auto_109811 ) ) ( not ( = ?auto_109810 ?auto_109812 ) ) ( not ( = ?auto_109810 ?auto_109813 ) ) ( not ( = ?auto_109810 ?auto_109814 ) ) ( not ( = ?auto_109810 ?auto_109815 ) ) ( not ( = ?auto_109811 ?auto_109812 ) ) ( not ( = ?auto_109811 ?auto_109813 ) ) ( not ( = ?auto_109811 ?auto_109814 ) ) ( not ( = ?auto_109811 ?auto_109815 ) ) ( not ( = ?auto_109812 ?auto_109813 ) ) ( not ( = ?auto_109812 ?auto_109814 ) ) ( not ( = ?auto_109812 ?auto_109815 ) ) ( not ( = ?auto_109813 ?auto_109814 ) ) ( not ( = ?auto_109813 ?auto_109815 ) ) ( not ( = ?auto_109814 ?auto_109815 ) ) ( ON ?auto_109815 ?auto_109816 ) ( CLEAR ?auto_109815 ) ( HAND-EMPTY ) ( not ( = ?auto_109810 ?auto_109816 ) ) ( not ( = ?auto_109811 ?auto_109816 ) ) ( not ( = ?auto_109812 ?auto_109816 ) ) ( not ( = ?auto_109813 ?auto_109816 ) ) ( not ( = ?auto_109814 ?auto_109816 ) ) ( not ( = ?auto_109815 ?auto_109816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109815 ?auto_109816 )
      ( MAKE-6PILE ?auto_109810 ?auto_109811 ?auto_109812 ?auto_109813 ?auto_109814 ?auto_109815 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109817 - BLOCK
      ?auto_109818 - BLOCK
      ?auto_109819 - BLOCK
      ?auto_109820 - BLOCK
      ?auto_109821 - BLOCK
      ?auto_109822 - BLOCK
    )
    :vars
    (
      ?auto_109823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109817 ) ( ON ?auto_109818 ?auto_109817 ) ( ON ?auto_109819 ?auto_109818 ) ( ON ?auto_109820 ?auto_109819 ) ( not ( = ?auto_109817 ?auto_109818 ) ) ( not ( = ?auto_109817 ?auto_109819 ) ) ( not ( = ?auto_109817 ?auto_109820 ) ) ( not ( = ?auto_109817 ?auto_109821 ) ) ( not ( = ?auto_109817 ?auto_109822 ) ) ( not ( = ?auto_109818 ?auto_109819 ) ) ( not ( = ?auto_109818 ?auto_109820 ) ) ( not ( = ?auto_109818 ?auto_109821 ) ) ( not ( = ?auto_109818 ?auto_109822 ) ) ( not ( = ?auto_109819 ?auto_109820 ) ) ( not ( = ?auto_109819 ?auto_109821 ) ) ( not ( = ?auto_109819 ?auto_109822 ) ) ( not ( = ?auto_109820 ?auto_109821 ) ) ( not ( = ?auto_109820 ?auto_109822 ) ) ( not ( = ?auto_109821 ?auto_109822 ) ) ( ON ?auto_109822 ?auto_109823 ) ( CLEAR ?auto_109822 ) ( not ( = ?auto_109817 ?auto_109823 ) ) ( not ( = ?auto_109818 ?auto_109823 ) ) ( not ( = ?auto_109819 ?auto_109823 ) ) ( not ( = ?auto_109820 ?auto_109823 ) ) ( not ( = ?auto_109821 ?auto_109823 ) ) ( not ( = ?auto_109822 ?auto_109823 ) ) ( HOLDING ?auto_109821 ) ( CLEAR ?auto_109820 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109817 ?auto_109818 ?auto_109819 ?auto_109820 ?auto_109821 )
      ( MAKE-6PILE ?auto_109817 ?auto_109818 ?auto_109819 ?auto_109820 ?auto_109821 ?auto_109822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109824 - BLOCK
      ?auto_109825 - BLOCK
      ?auto_109826 - BLOCK
      ?auto_109827 - BLOCK
      ?auto_109828 - BLOCK
      ?auto_109829 - BLOCK
    )
    :vars
    (
      ?auto_109830 - BLOCK
      ?auto_109831 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109824 ) ( ON ?auto_109825 ?auto_109824 ) ( ON ?auto_109826 ?auto_109825 ) ( ON ?auto_109827 ?auto_109826 ) ( not ( = ?auto_109824 ?auto_109825 ) ) ( not ( = ?auto_109824 ?auto_109826 ) ) ( not ( = ?auto_109824 ?auto_109827 ) ) ( not ( = ?auto_109824 ?auto_109828 ) ) ( not ( = ?auto_109824 ?auto_109829 ) ) ( not ( = ?auto_109825 ?auto_109826 ) ) ( not ( = ?auto_109825 ?auto_109827 ) ) ( not ( = ?auto_109825 ?auto_109828 ) ) ( not ( = ?auto_109825 ?auto_109829 ) ) ( not ( = ?auto_109826 ?auto_109827 ) ) ( not ( = ?auto_109826 ?auto_109828 ) ) ( not ( = ?auto_109826 ?auto_109829 ) ) ( not ( = ?auto_109827 ?auto_109828 ) ) ( not ( = ?auto_109827 ?auto_109829 ) ) ( not ( = ?auto_109828 ?auto_109829 ) ) ( ON ?auto_109829 ?auto_109830 ) ( not ( = ?auto_109824 ?auto_109830 ) ) ( not ( = ?auto_109825 ?auto_109830 ) ) ( not ( = ?auto_109826 ?auto_109830 ) ) ( not ( = ?auto_109827 ?auto_109830 ) ) ( not ( = ?auto_109828 ?auto_109830 ) ) ( not ( = ?auto_109829 ?auto_109830 ) ) ( CLEAR ?auto_109827 ) ( ON ?auto_109828 ?auto_109829 ) ( CLEAR ?auto_109828 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109831 ) ( ON ?auto_109830 ?auto_109831 ) ( not ( = ?auto_109831 ?auto_109830 ) ) ( not ( = ?auto_109831 ?auto_109829 ) ) ( not ( = ?auto_109831 ?auto_109828 ) ) ( not ( = ?auto_109824 ?auto_109831 ) ) ( not ( = ?auto_109825 ?auto_109831 ) ) ( not ( = ?auto_109826 ?auto_109831 ) ) ( not ( = ?auto_109827 ?auto_109831 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109831 ?auto_109830 ?auto_109829 )
      ( MAKE-6PILE ?auto_109824 ?auto_109825 ?auto_109826 ?auto_109827 ?auto_109828 ?auto_109829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109832 - BLOCK
      ?auto_109833 - BLOCK
      ?auto_109834 - BLOCK
      ?auto_109835 - BLOCK
      ?auto_109836 - BLOCK
      ?auto_109837 - BLOCK
    )
    :vars
    (
      ?auto_109839 - BLOCK
      ?auto_109838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109832 ) ( ON ?auto_109833 ?auto_109832 ) ( ON ?auto_109834 ?auto_109833 ) ( not ( = ?auto_109832 ?auto_109833 ) ) ( not ( = ?auto_109832 ?auto_109834 ) ) ( not ( = ?auto_109832 ?auto_109835 ) ) ( not ( = ?auto_109832 ?auto_109836 ) ) ( not ( = ?auto_109832 ?auto_109837 ) ) ( not ( = ?auto_109833 ?auto_109834 ) ) ( not ( = ?auto_109833 ?auto_109835 ) ) ( not ( = ?auto_109833 ?auto_109836 ) ) ( not ( = ?auto_109833 ?auto_109837 ) ) ( not ( = ?auto_109834 ?auto_109835 ) ) ( not ( = ?auto_109834 ?auto_109836 ) ) ( not ( = ?auto_109834 ?auto_109837 ) ) ( not ( = ?auto_109835 ?auto_109836 ) ) ( not ( = ?auto_109835 ?auto_109837 ) ) ( not ( = ?auto_109836 ?auto_109837 ) ) ( ON ?auto_109837 ?auto_109839 ) ( not ( = ?auto_109832 ?auto_109839 ) ) ( not ( = ?auto_109833 ?auto_109839 ) ) ( not ( = ?auto_109834 ?auto_109839 ) ) ( not ( = ?auto_109835 ?auto_109839 ) ) ( not ( = ?auto_109836 ?auto_109839 ) ) ( not ( = ?auto_109837 ?auto_109839 ) ) ( ON ?auto_109836 ?auto_109837 ) ( CLEAR ?auto_109836 ) ( ON-TABLE ?auto_109838 ) ( ON ?auto_109839 ?auto_109838 ) ( not ( = ?auto_109838 ?auto_109839 ) ) ( not ( = ?auto_109838 ?auto_109837 ) ) ( not ( = ?auto_109838 ?auto_109836 ) ) ( not ( = ?auto_109832 ?auto_109838 ) ) ( not ( = ?auto_109833 ?auto_109838 ) ) ( not ( = ?auto_109834 ?auto_109838 ) ) ( not ( = ?auto_109835 ?auto_109838 ) ) ( HOLDING ?auto_109835 ) ( CLEAR ?auto_109834 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109832 ?auto_109833 ?auto_109834 ?auto_109835 )
      ( MAKE-6PILE ?auto_109832 ?auto_109833 ?auto_109834 ?auto_109835 ?auto_109836 ?auto_109837 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109840 - BLOCK
      ?auto_109841 - BLOCK
      ?auto_109842 - BLOCK
      ?auto_109843 - BLOCK
      ?auto_109844 - BLOCK
      ?auto_109845 - BLOCK
    )
    :vars
    (
      ?auto_109847 - BLOCK
      ?auto_109846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109840 ) ( ON ?auto_109841 ?auto_109840 ) ( ON ?auto_109842 ?auto_109841 ) ( not ( = ?auto_109840 ?auto_109841 ) ) ( not ( = ?auto_109840 ?auto_109842 ) ) ( not ( = ?auto_109840 ?auto_109843 ) ) ( not ( = ?auto_109840 ?auto_109844 ) ) ( not ( = ?auto_109840 ?auto_109845 ) ) ( not ( = ?auto_109841 ?auto_109842 ) ) ( not ( = ?auto_109841 ?auto_109843 ) ) ( not ( = ?auto_109841 ?auto_109844 ) ) ( not ( = ?auto_109841 ?auto_109845 ) ) ( not ( = ?auto_109842 ?auto_109843 ) ) ( not ( = ?auto_109842 ?auto_109844 ) ) ( not ( = ?auto_109842 ?auto_109845 ) ) ( not ( = ?auto_109843 ?auto_109844 ) ) ( not ( = ?auto_109843 ?auto_109845 ) ) ( not ( = ?auto_109844 ?auto_109845 ) ) ( ON ?auto_109845 ?auto_109847 ) ( not ( = ?auto_109840 ?auto_109847 ) ) ( not ( = ?auto_109841 ?auto_109847 ) ) ( not ( = ?auto_109842 ?auto_109847 ) ) ( not ( = ?auto_109843 ?auto_109847 ) ) ( not ( = ?auto_109844 ?auto_109847 ) ) ( not ( = ?auto_109845 ?auto_109847 ) ) ( ON ?auto_109844 ?auto_109845 ) ( ON-TABLE ?auto_109846 ) ( ON ?auto_109847 ?auto_109846 ) ( not ( = ?auto_109846 ?auto_109847 ) ) ( not ( = ?auto_109846 ?auto_109845 ) ) ( not ( = ?auto_109846 ?auto_109844 ) ) ( not ( = ?auto_109840 ?auto_109846 ) ) ( not ( = ?auto_109841 ?auto_109846 ) ) ( not ( = ?auto_109842 ?auto_109846 ) ) ( not ( = ?auto_109843 ?auto_109846 ) ) ( CLEAR ?auto_109842 ) ( ON ?auto_109843 ?auto_109844 ) ( CLEAR ?auto_109843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109846 ?auto_109847 ?auto_109845 ?auto_109844 )
      ( MAKE-6PILE ?auto_109840 ?auto_109841 ?auto_109842 ?auto_109843 ?auto_109844 ?auto_109845 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109848 - BLOCK
      ?auto_109849 - BLOCK
      ?auto_109850 - BLOCK
      ?auto_109851 - BLOCK
      ?auto_109852 - BLOCK
      ?auto_109853 - BLOCK
    )
    :vars
    (
      ?auto_109855 - BLOCK
      ?auto_109854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109848 ) ( ON ?auto_109849 ?auto_109848 ) ( not ( = ?auto_109848 ?auto_109849 ) ) ( not ( = ?auto_109848 ?auto_109850 ) ) ( not ( = ?auto_109848 ?auto_109851 ) ) ( not ( = ?auto_109848 ?auto_109852 ) ) ( not ( = ?auto_109848 ?auto_109853 ) ) ( not ( = ?auto_109849 ?auto_109850 ) ) ( not ( = ?auto_109849 ?auto_109851 ) ) ( not ( = ?auto_109849 ?auto_109852 ) ) ( not ( = ?auto_109849 ?auto_109853 ) ) ( not ( = ?auto_109850 ?auto_109851 ) ) ( not ( = ?auto_109850 ?auto_109852 ) ) ( not ( = ?auto_109850 ?auto_109853 ) ) ( not ( = ?auto_109851 ?auto_109852 ) ) ( not ( = ?auto_109851 ?auto_109853 ) ) ( not ( = ?auto_109852 ?auto_109853 ) ) ( ON ?auto_109853 ?auto_109855 ) ( not ( = ?auto_109848 ?auto_109855 ) ) ( not ( = ?auto_109849 ?auto_109855 ) ) ( not ( = ?auto_109850 ?auto_109855 ) ) ( not ( = ?auto_109851 ?auto_109855 ) ) ( not ( = ?auto_109852 ?auto_109855 ) ) ( not ( = ?auto_109853 ?auto_109855 ) ) ( ON ?auto_109852 ?auto_109853 ) ( ON-TABLE ?auto_109854 ) ( ON ?auto_109855 ?auto_109854 ) ( not ( = ?auto_109854 ?auto_109855 ) ) ( not ( = ?auto_109854 ?auto_109853 ) ) ( not ( = ?auto_109854 ?auto_109852 ) ) ( not ( = ?auto_109848 ?auto_109854 ) ) ( not ( = ?auto_109849 ?auto_109854 ) ) ( not ( = ?auto_109850 ?auto_109854 ) ) ( not ( = ?auto_109851 ?auto_109854 ) ) ( ON ?auto_109851 ?auto_109852 ) ( CLEAR ?auto_109851 ) ( HOLDING ?auto_109850 ) ( CLEAR ?auto_109849 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109848 ?auto_109849 ?auto_109850 )
      ( MAKE-6PILE ?auto_109848 ?auto_109849 ?auto_109850 ?auto_109851 ?auto_109852 ?auto_109853 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109856 - BLOCK
      ?auto_109857 - BLOCK
      ?auto_109858 - BLOCK
      ?auto_109859 - BLOCK
      ?auto_109860 - BLOCK
      ?auto_109861 - BLOCK
    )
    :vars
    (
      ?auto_109863 - BLOCK
      ?auto_109862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109856 ) ( ON ?auto_109857 ?auto_109856 ) ( not ( = ?auto_109856 ?auto_109857 ) ) ( not ( = ?auto_109856 ?auto_109858 ) ) ( not ( = ?auto_109856 ?auto_109859 ) ) ( not ( = ?auto_109856 ?auto_109860 ) ) ( not ( = ?auto_109856 ?auto_109861 ) ) ( not ( = ?auto_109857 ?auto_109858 ) ) ( not ( = ?auto_109857 ?auto_109859 ) ) ( not ( = ?auto_109857 ?auto_109860 ) ) ( not ( = ?auto_109857 ?auto_109861 ) ) ( not ( = ?auto_109858 ?auto_109859 ) ) ( not ( = ?auto_109858 ?auto_109860 ) ) ( not ( = ?auto_109858 ?auto_109861 ) ) ( not ( = ?auto_109859 ?auto_109860 ) ) ( not ( = ?auto_109859 ?auto_109861 ) ) ( not ( = ?auto_109860 ?auto_109861 ) ) ( ON ?auto_109861 ?auto_109863 ) ( not ( = ?auto_109856 ?auto_109863 ) ) ( not ( = ?auto_109857 ?auto_109863 ) ) ( not ( = ?auto_109858 ?auto_109863 ) ) ( not ( = ?auto_109859 ?auto_109863 ) ) ( not ( = ?auto_109860 ?auto_109863 ) ) ( not ( = ?auto_109861 ?auto_109863 ) ) ( ON ?auto_109860 ?auto_109861 ) ( ON-TABLE ?auto_109862 ) ( ON ?auto_109863 ?auto_109862 ) ( not ( = ?auto_109862 ?auto_109863 ) ) ( not ( = ?auto_109862 ?auto_109861 ) ) ( not ( = ?auto_109862 ?auto_109860 ) ) ( not ( = ?auto_109856 ?auto_109862 ) ) ( not ( = ?auto_109857 ?auto_109862 ) ) ( not ( = ?auto_109858 ?auto_109862 ) ) ( not ( = ?auto_109859 ?auto_109862 ) ) ( ON ?auto_109859 ?auto_109860 ) ( CLEAR ?auto_109857 ) ( ON ?auto_109858 ?auto_109859 ) ( CLEAR ?auto_109858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109862 ?auto_109863 ?auto_109861 ?auto_109860 ?auto_109859 )
      ( MAKE-6PILE ?auto_109856 ?auto_109857 ?auto_109858 ?auto_109859 ?auto_109860 ?auto_109861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109864 - BLOCK
      ?auto_109865 - BLOCK
      ?auto_109866 - BLOCK
      ?auto_109867 - BLOCK
      ?auto_109868 - BLOCK
      ?auto_109869 - BLOCK
    )
    :vars
    (
      ?auto_109870 - BLOCK
      ?auto_109871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109864 ) ( not ( = ?auto_109864 ?auto_109865 ) ) ( not ( = ?auto_109864 ?auto_109866 ) ) ( not ( = ?auto_109864 ?auto_109867 ) ) ( not ( = ?auto_109864 ?auto_109868 ) ) ( not ( = ?auto_109864 ?auto_109869 ) ) ( not ( = ?auto_109865 ?auto_109866 ) ) ( not ( = ?auto_109865 ?auto_109867 ) ) ( not ( = ?auto_109865 ?auto_109868 ) ) ( not ( = ?auto_109865 ?auto_109869 ) ) ( not ( = ?auto_109866 ?auto_109867 ) ) ( not ( = ?auto_109866 ?auto_109868 ) ) ( not ( = ?auto_109866 ?auto_109869 ) ) ( not ( = ?auto_109867 ?auto_109868 ) ) ( not ( = ?auto_109867 ?auto_109869 ) ) ( not ( = ?auto_109868 ?auto_109869 ) ) ( ON ?auto_109869 ?auto_109870 ) ( not ( = ?auto_109864 ?auto_109870 ) ) ( not ( = ?auto_109865 ?auto_109870 ) ) ( not ( = ?auto_109866 ?auto_109870 ) ) ( not ( = ?auto_109867 ?auto_109870 ) ) ( not ( = ?auto_109868 ?auto_109870 ) ) ( not ( = ?auto_109869 ?auto_109870 ) ) ( ON ?auto_109868 ?auto_109869 ) ( ON-TABLE ?auto_109871 ) ( ON ?auto_109870 ?auto_109871 ) ( not ( = ?auto_109871 ?auto_109870 ) ) ( not ( = ?auto_109871 ?auto_109869 ) ) ( not ( = ?auto_109871 ?auto_109868 ) ) ( not ( = ?auto_109864 ?auto_109871 ) ) ( not ( = ?auto_109865 ?auto_109871 ) ) ( not ( = ?auto_109866 ?auto_109871 ) ) ( not ( = ?auto_109867 ?auto_109871 ) ) ( ON ?auto_109867 ?auto_109868 ) ( ON ?auto_109866 ?auto_109867 ) ( CLEAR ?auto_109866 ) ( HOLDING ?auto_109865 ) ( CLEAR ?auto_109864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109864 ?auto_109865 )
      ( MAKE-6PILE ?auto_109864 ?auto_109865 ?auto_109866 ?auto_109867 ?auto_109868 ?auto_109869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109872 - BLOCK
      ?auto_109873 - BLOCK
      ?auto_109874 - BLOCK
      ?auto_109875 - BLOCK
      ?auto_109876 - BLOCK
      ?auto_109877 - BLOCK
    )
    :vars
    (
      ?auto_109878 - BLOCK
      ?auto_109879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109872 ) ( not ( = ?auto_109872 ?auto_109873 ) ) ( not ( = ?auto_109872 ?auto_109874 ) ) ( not ( = ?auto_109872 ?auto_109875 ) ) ( not ( = ?auto_109872 ?auto_109876 ) ) ( not ( = ?auto_109872 ?auto_109877 ) ) ( not ( = ?auto_109873 ?auto_109874 ) ) ( not ( = ?auto_109873 ?auto_109875 ) ) ( not ( = ?auto_109873 ?auto_109876 ) ) ( not ( = ?auto_109873 ?auto_109877 ) ) ( not ( = ?auto_109874 ?auto_109875 ) ) ( not ( = ?auto_109874 ?auto_109876 ) ) ( not ( = ?auto_109874 ?auto_109877 ) ) ( not ( = ?auto_109875 ?auto_109876 ) ) ( not ( = ?auto_109875 ?auto_109877 ) ) ( not ( = ?auto_109876 ?auto_109877 ) ) ( ON ?auto_109877 ?auto_109878 ) ( not ( = ?auto_109872 ?auto_109878 ) ) ( not ( = ?auto_109873 ?auto_109878 ) ) ( not ( = ?auto_109874 ?auto_109878 ) ) ( not ( = ?auto_109875 ?auto_109878 ) ) ( not ( = ?auto_109876 ?auto_109878 ) ) ( not ( = ?auto_109877 ?auto_109878 ) ) ( ON ?auto_109876 ?auto_109877 ) ( ON-TABLE ?auto_109879 ) ( ON ?auto_109878 ?auto_109879 ) ( not ( = ?auto_109879 ?auto_109878 ) ) ( not ( = ?auto_109879 ?auto_109877 ) ) ( not ( = ?auto_109879 ?auto_109876 ) ) ( not ( = ?auto_109872 ?auto_109879 ) ) ( not ( = ?auto_109873 ?auto_109879 ) ) ( not ( = ?auto_109874 ?auto_109879 ) ) ( not ( = ?auto_109875 ?auto_109879 ) ) ( ON ?auto_109875 ?auto_109876 ) ( ON ?auto_109874 ?auto_109875 ) ( CLEAR ?auto_109872 ) ( ON ?auto_109873 ?auto_109874 ) ( CLEAR ?auto_109873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109879 ?auto_109878 ?auto_109877 ?auto_109876 ?auto_109875 ?auto_109874 )
      ( MAKE-6PILE ?auto_109872 ?auto_109873 ?auto_109874 ?auto_109875 ?auto_109876 ?auto_109877 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109880 - BLOCK
      ?auto_109881 - BLOCK
      ?auto_109882 - BLOCK
      ?auto_109883 - BLOCK
      ?auto_109884 - BLOCK
      ?auto_109885 - BLOCK
    )
    :vars
    (
      ?auto_109886 - BLOCK
      ?auto_109887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109880 ?auto_109881 ) ) ( not ( = ?auto_109880 ?auto_109882 ) ) ( not ( = ?auto_109880 ?auto_109883 ) ) ( not ( = ?auto_109880 ?auto_109884 ) ) ( not ( = ?auto_109880 ?auto_109885 ) ) ( not ( = ?auto_109881 ?auto_109882 ) ) ( not ( = ?auto_109881 ?auto_109883 ) ) ( not ( = ?auto_109881 ?auto_109884 ) ) ( not ( = ?auto_109881 ?auto_109885 ) ) ( not ( = ?auto_109882 ?auto_109883 ) ) ( not ( = ?auto_109882 ?auto_109884 ) ) ( not ( = ?auto_109882 ?auto_109885 ) ) ( not ( = ?auto_109883 ?auto_109884 ) ) ( not ( = ?auto_109883 ?auto_109885 ) ) ( not ( = ?auto_109884 ?auto_109885 ) ) ( ON ?auto_109885 ?auto_109886 ) ( not ( = ?auto_109880 ?auto_109886 ) ) ( not ( = ?auto_109881 ?auto_109886 ) ) ( not ( = ?auto_109882 ?auto_109886 ) ) ( not ( = ?auto_109883 ?auto_109886 ) ) ( not ( = ?auto_109884 ?auto_109886 ) ) ( not ( = ?auto_109885 ?auto_109886 ) ) ( ON ?auto_109884 ?auto_109885 ) ( ON-TABLE ?auto_109887 ) ( ON ?auto_109886 ?auto_109887 ) ( not ( = ?auto_109887 ?auto_109886 ) ) ( not ( = ?auto_109887 ?auto_109885 ) ) ( not ( = ?auto_109887 ?auto_109884 ) ) ( not ( = ?auto_109880 ?auto_109887 ) ) ( not ( = ?auto_109881 ?auto_109887 ) ) ( not ( = ?auto_109882 ?auto_109887 ) ) ( not ( = ?auto_109883 ?auto_109887 ) ) ( ON ?auto_109883 ?auto_109884 ) ( ON ?auto_109882 ?auto_109883 ) ( ON ?auto_109881 ?auto_109882 ) ( CLEAR ?auto_109881 ) ( HOLDING ?auto_109880 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109880 )
      ( MAKE-6PILE ?auto_109880 ?auto_109881 ?auto_109882 ?auto_109883 ?auto_109884 ?auto_109885 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109888 - BLOCK
      ?auto_109889 - BLOCK
      ?auto_109890 - BLOCK
      ?auto_109891 - BLOCK
      ?auto_109892 - BLOCK
      ?auto_109893 - BLOCK
    )
    :vars
    (
      ?auto_109895 - BLOCK
      ?auto_109894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109888 ?auto_109889 ) ) ( not ( = ?auto_109888 ?auto_109890 ) ) ( not ( = ?auto_109888 ?auto_109891 ) ) ( not ( = ?auto_109888 ?auto_109892 ) ) ( not ( = ?auto_109888 ?auto_109893 ) ) ( not ( = ?auto_109889 ?auto_109890 ) ) ( not ( = ?auto_109889 ?auto_109891 ) ) ( not ( = ?auto_109889 ?auto_109892 ) ) ( not ( = ?auto_109889 ?auto_109893 ) ) ( not ( = ?auto_109890 ?auto_109891 ) ) ( not ( = ?auto_109890 ?auto_109892 ) ) ( not ( = ?auto_109890 ?auto_109893 ) ) ( not ( = ?auto_109891 ?auto_109892 ) ) ( not ( = ?auto_109891 ?auto_109893 ) ) ( not ( = ?auto_109892 ?auto_109893 ) ) ( ON ?auto_109893 ?auto_109895 ) ( not ( = ?auto_109888 ?auto_109895 ) ) ( not ( = ?auto_109889 ?auto_109895 ) ) ( not ( = ?auto_109890 ?auto_109895 ) ) ( not ( = ?auto_109891 ?auto_109895 ) ) ( not ( = ?auto_109892 ?auto_109895 ) ) ( not ( = ?auto_109893 ?auto_109895 ) ) ( ON ?auto_109892 ?auto_109893 ) ( ON-TABLE ?auto_109894 ) ( ON ?auto_109895 ?auto_109894 ) ( not ( = ?auto_109894 ?auto_109895 ) ) ( not ( = ?auto_109894 ?auto_109893 ) ) ( not ( = ?auto_109894 ?auto_109892 ) ) ( not ( = ?auto_109888 ?auto_109894 ) ) ( not ( = ?auto_109889 ?auto_109894 ) ) ( not ( = ?auto_109890 ?auto_109894 ) ) ( not ( = ?auto_109891 ?auto_109894 ) ) ( ON ?auto_109891 ?auto_109892 ) ( ON ?auto_109890 ?auto_109891 ) ( ON ?auto_109889 ?auto_109890 ) ( ON ?auto_109888 ?auto_109889 ) ( CLEAR ?auto_109888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109894 ?auto_109895 ?auto_109893 ?auto_109892 ?auto_109891 ?auto_109890 ?auto_109889 )
      ( MAKE-6PILE ?auto_109888 ?auto_109889 ?auto_109890 ?auto_109891 ?auto_109892 ?auto_109893 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109897 - BLOCK
    )
    :vars
    (
      ?auto_109898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109898 ?auto_109897 ) ( CLEAR ?auto_109898 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109897 ) ( not ( = ?auto_109897 ?auto_109898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109898 ?auto_109897 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109899 - BLOCK
    )
    :vars
    (
      ?auto_109900 - BLOCK
      ?auto_109901 - BLOCK
      ?auto_109902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109900 ?auto_109899 ) ( CLEAR ?auto_109900 ) ( ON-TABLE ?auto_109899 ) ( not ( = ?auto_109899 ?auto_109900 ) ) ( HOLDING ?auto_109901 ) ( CLEAR ?auto_109902 ) ( not ( = ?auto_109899 ?auto_109901 ) ) ( not ( = ?auto_109899 ?auto_109902 ) ) ( not ( = ?auto_109900 ?auto_109901 ) ) ( not ( = ?auto_109900 ?auto_109902 ) ) ( not ( = ?auto_109901 ?auto_109902 ) ) )
    :subtasks
    ( ( !STACK ?auto_109901 ?auto_109902 )
      ( MAKE-1PILE ?auto_109899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109903 - BLOCK
    )
    :vars
    (
      ?auto_109905 - BLOCK
      ?auto_109906 - BLOCK
      ?auto_109904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109905 ?auto_109903 ) ( ON-TABLE ?auto_109903 ) ( not ( = ?auto_109903 ?auto_109905 ) ) ( CLEAR ?auto_109906 ) ( not ( = ?auto_109903 ?auto_109904 ) ) ( not ( = ?auto_109903 ?auto_109906 ) ) ( not ( = ?auto_109905 ?auto_109904 ) ) ( not ( = ?auto_109905 ?auto_109906 ) ) ( not ( = ?auto_109904 ?auto_109906 ) ) ( ON ?auto_109904 ?auto_109905 ) ( CLEAR ?auto_109904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109903 ?auto_109905 )
      ( MAKE-1PILE ?auto_109903 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109907 - BLOCK
    )
    :vars
    (
      ?auto_109909 - BLOCK
      ?auto_109910 - BLOCK
      ?auto_109908 - BLOCK
      ?auto_109913 - BLOCK
      ?auto_109914 - BLOCK
      ?auto_109912 - BLOCK
      ?auto_109911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109909 ?auto_109907 ) ( ON-TABLE ?auto_109907 ) ( not ( = ?auto_109907 ?auto_109909 ) ) ( not ( = ?auto_109907 ?auto_109910 ) ) ( not ( = ?auto_109907 ?auto_109908 ) ) ( not ( = ?auto_109909 ?auto_109910 ) ) ( not ( = ?auto_109909 ?auto_109908 ) ) ( not ( = ?auto_109910 ?auto_109908 ) ) ( ON ?auto_109910 ?auto_109909 ) ( CLEAR ?auto_109910 ) ( HOLDING ?auto_109908 ) ( CLEAR ?auto_109913 ) ( ON-TABLE ?auto_109914 ) ( ON ?auto_109912 ?auto_109914 ) ( ON ?auto_109911 ?auto_109912 ) ( ON ?auto_109913 ?auto_109911 ) ( not ( = ?auto_109914 ?auto_109912 ) ) ( not ( = ?auto_109914 ?auto_109911 ) ) ( not ( = ?auto_109914 ?auto_109913 ) ) ( not ( = ?auto_109914 ?auto_109908 ) ) ( not ( = ?auto_109912 ?auto_109911 ) ) ( not ( = ?auto_109912 ?auto_109913 ) ) ( not ( = ?auto_109912 ?auto_109908 ) ) ( not ( = ?auto_109911 ?auto_109913 ) ) ( not ( = ?auto_109911 ?auto_109908 ) ) ( not ( = ?auto_109913 ?auto_109908 ) ) ( not ( = ?auto_109907 ?auto_109913 ) ) ( not ( = ?auto_109907 ?auto_109914 ) ) ( not ( = ?auto_109907 ?auto_109912 ) ) ( not ( = ?auto_109907 ?auto_109911 ) ) ( not ( = ?auto_109909 ?auto_109913 ) ) ( not ( = ?auto_109909 ?auto_109914 ) ) ( not ( = ?auto_109909 ?auto_109912 ) ) ( not ( = ?auto_109909 ?auto_109911 ) ) ( not ( = ?auto_109910 ?auto_109913 ) ) ( not ( = ?auto_109910 ?auto_109914 ) ) ( not ( = ?auto_109910 ?auto_109912 ) ) ( not ( = ?auto_109910 ?auto_109911 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109914 ?auto_109912 ?auto_109911 ?auto_109913 ?auto_109908 )
      ( MAKE-1PILE ?auto_109907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109915 - BLOCK
    )
    :vars
    (
      ?auto_109918 - BLOCK
      ?auto_109920 - BLOCK
      ?auto_109922 - BLOCK
      ?auto_109921 - BLOCK
      ?auto_109919 - BLOCK
      ?auto_109917 - BLOCK
      ?auto_109916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109918 ?auto_109915 ) ( ON-TABLE ?auto_109915 ) ( not ( = ?auto_109915 ?auto_109918 ) ) ( not ( = ?auto_109915 ?auto_109920 ) ) ( not ( = ?auto_109915 ?auto_109922 ) ) ( not ( = ?auto_109918 ?auto_109920 ) ) ( not ( = ?auto_109918 ?auto_109922 ) ) ( not ( = ?auto_109920 ?auto_109922 ) ) ( ON ?auto_109920 ?auto_109918 ) ( CLEAR ?auto_109921 ) ( ON-TABLE ?auto_109919 ) ( ON ?auto_109917 ?auto_109919 ) ( ON ?auto_109916 ?auto_109917 ) ( ON ?auto_109921 ?auto_109916 ) ( not ( = ?auto_109919 ?auto_109917 ) ) ( not ( = ?auto_109919 ?auto_109916 ) ) ( not ( = ?auto_109919 ?auto_109921 ) ) ( not ( = ?auto_109919 ?auto_109922 ) ) ( not ( = ?auto_109917 ?auto_109916 ) ) ( not ( = ?auto_109917 ?auto_109921 ) ) ( not ( = ?auto_109917 ?auto_109922 ) ) ( not ( = ?auto_109916 ?auto_109921 ) ) ( not ( = ?auto_109916 ?auto_109922 ) ) ( not ( = ?auto_109921 ?auto_109922 ) ) ( not ( = ?auto_109915 ?auto_109921 ) ) ( not ( = ?auto_109915 ?auto_109919 ) ) ( not ( = ?auto_109915 ?auto_109917 ) ) ( not ( = ?auto_109915 ?auto_109916 ) ) ( not ( = ?auto_109918 ?auto_109921 ) ) ( not ( = ?auto_109918 ?auto_109919 ) ) ( not ( = ?auto_109918 ?auto_109917 ) ) ( not ( = ?auto_109918 ?auto_109916 ) ) ( not ( = ?auto_109920 ?auto_109921 ) ) ( not ( = ?auto_109920 ?auto_109919 ) ) ( not ( = ?auto_109920 ?auto_109917 ) ) ( not ( = ?auto_109920 ?auto_109916 ) ) ( ON ?auto_109922 ?auto_109920 ) ( CLEAR ?auto_109922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109915 ?auto_109918 ?auto_109920 )
      ( MAKE-1PILE ?auto_109915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109923 - BLOCK
    )
    :vars
    (
      ?auto_109928 - BLOCK
      ?auto_109927 - BLOCK
      ?auto_109929 - BLOCK
      ?auto_109926 - BLOCK
      ?auto_109930 - BLOCK
      ?auto_109925 - BLOCK
      ?auto_109924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109928 ?auto_109923 ) ( ON-TABLE ?auto_109923 ) ( not ( = ?auto_109923 ?auto_109928 ) ) ( not ( = ?auto_109923 ?auto_109927 ) ) ( not ( = ?auto_109923 ?auto_109929 ) ) ( not ( = ?auto_109928 ?auto_109927 ) ) ( not ( = ?auto_109928 ?auto_109929 ) ) ( not ( = ?auto_109927 ?auto_109929 ) ) ( ON ?auto_109927 ?auto_109928 ) ( ON-TABLE ?auto_109926 ) ( ON ?auto_109930 ?auto_109926 ) ( ON ?auto_109925 ?auto_109930 ) ( not ( = ?auto_109926 ?auto_109930 ) ) ( not ( = ?auto_109926 ?auto_109925 ) ) ( not ( = ?auto_109926 ?auto_109924 ) ) ( not ( = ?auto_109926 ?auto_109929 ) ) ( not ( = ?auto_109930 ?auto_109925 ) ) ( not ( = ?auto_109930 ?auto_109924 ) ) ( not ( = ?auto_109930 ?auto_109929 ) ) ( not ( = ?auto_109925 ?auto_109924 ) ) ( not ( = ?auto_109925 ?auto_109929 ) ) ( not ( = ?auto_109924 ?auto_109929 ) ) ( not ( = ?auto_109923 ?auto_109924 ) ) ( not ( = ?auto_109923 ?auto_109926 ) ) ( not ( = ?auto_109923 ?auto_109930 ) ) ( not ( = ?auto_109923 ?auto_109925 ) ) ( not ( = ?auto_109928 ?auto_109924 ) ) ( not ( = ?auto_109928 ?auto_109926 ) ) ( not ( = ?auto_109928 ?auto_109930 ) ) ( not ( = ?auto_109928 ?auto_109925 ) ) ( not ( = ?auto_109927 ?auto_109924 ) ) ( not ( = ?auto_109927 ?auto_109926 ) ) ( not ( = ?auto_109927 ?auto_109930 ) ) ( not ( = ?auto_109927 ?auto_109925 ) ) ( ON ?auto_109929 ?auto_109927 ) ( CLEAR ?auto_109929 ) ( HOLDING ?auto_109924 ) ( CLEAR ?auto_109925 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109926 ?auto_109930 ?auto_109925 ?auto_109924 )
      ( MAKE-1PILE ?auto_109923 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109931 - BLOCK
    )
    :vars
    (
      ?auto_109938 - BLOCK
      ?auto_109932 - BLOCK
      ?auto_109936 - BLOCK
      ?auto_109933 - BLOCK
      ?auto_109937 - BLOCK
      ?auto_109934 - BLOCK
      ?auto_109935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109938 ?auto_109931 ) ( ON-TABLE ?auto_109931 ) ( not ( = ?auto_109931 ?auto_109938 ) ) ( not ( = ?auto_109931 ?auto_109932 ) ) ( not ( = ?auto_109931 ?auto_109936 ) ) ( not ( = ?auto_109938 ?auto_109932 ) ) ( not ( = ?auto_109938 ?auto_109936 ) ) ( not ( = ?auto_109932 ?auto_109936 ) ) ( ON ?auto_109932 ?auto_109938 ) ( ON-TABLE ?auto_109933 ) ( ON ?auto_109937 ?auto_109933 ) ( ON ?auto_109934 ?auto_109937 ) ( not ( = ?auto_109933 ?auto_109937 ) ) ( not ( = ?auto_109933 ?auto_109934 ) ) ( not ( = ?auto_109933 ?auto_109935 ) ) ( not ( = ?auto_109933 ?auto_109936 ) ) ( not ( = ?auto_109937 ?auto_109934 ) ) ( not ( = ?auto_109937 ?auto_109935 ) ) ( not ( = ?auto_109937 ?auto_109936 ) ) ( not ( = ?auto_109934 ?auto_109935 ) ) ( not ( = ?auto_109934 ?auto_109936 ) ) ( not ( = ?auto_109935 ?auto_109936 ) ) ( not ( = ?auto_109931 ?auto_109935 ) ) ( not ( = ?auto_109931 ?auto_109933 ) ) ( not ( = ?auto_109931 ?auto_109937 ) ) ( not ( = ?auto_109931 ?auto_109934 ) ) ( not ( = ?auto_109938 ?auto_109935 ) ) ( not ( = ?auto_109938 ?auto_109933 ) ) ( not ( = ?auto_109938 ?auto_109937 ) ) ( not ( = ?auto_109938 ?auto_109934 ) ) ( not ( = ?auto_109932 ?auto_109935 ) ) ( not ( = ?auto_109932 ?auto_109933 ) ) ( not ( = ?auto_109932 ?auto_109937 ) ) ( not ( = ?auto_109932 ?auto_109934 ) ) ( ON ?auto_109936 ?auto_109932 ) ( CLEAR ?auto_109934 ) ( ON ?auto_109935 ?auto_109936 ) ( CLEAR ?auto_109935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109931 ?auto_109938 ?auto_109932 ?auto_109936 )
      ( MAKE-1PILE ?auto_109931 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109939 - BLOCK
    )
    :vars
    (
      ?auto_109941 - BLOCK
      ?auto_109945 - BLOCK
      ?auto_109946 - BLOCK
      ?auto_109943 - BLOCK
      ?auto_109940 - BLOCK
      ?auto_109942 - BLOCK
      ?auto_109944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109941 ?auto_109939 ) ( ON-TABLE ?auto_109939 ) ( not ( = ?auto_109939 ?auto_109941 ) ) ( not ( = ?auto_109939 ?auto_109945 ) ) ( not ( = ?auto_109939 ?auto_109946 ) ) ( not ( = ?auto_109941 ?auto_109945 ) ) ( not ( = ?auto_109941 ?auto_109946 ) ) ( not ( = ?auto_109945 ?auto_109946 ) ) ( ON ?auto_109945 ?auto_109941 ) ( ON-TABLE ?auto_109943 ) ( ON ?auto_109940 ?auto_109943 ) ( not ( = ?auto_109943 ?auto_109940 ) ) ( not ( = ?auto_109943 ?auto_109942 ) ) ( not ( = ?auto_109943 ?auto_109944 ) ) ( not ( = ?auto_109943 ?auto_109946 ) ) ( not ( = ?auto_109940 ?auto_109942 ) ) ( not ( = ?auto_109940 ?auto_109944 ) ) ( not ( = ?auto_109940 ?auto_109946 ) ) ( not ( = ?auto_109942 ?auto_109944 ) ) ( not ( = ?auto_109942 ?auto_109946 ) ) ( not ( = ?auto_109944 ?auto_109946 ) ) ( not ( = ?auto_109939 ?auto_109944 ) ) ( not ( = ?auto_109939 ?auto_109943 ) ) ( not ( = ?auto_109939 ?auto_109940 ) ) ( not ( = ?auto_109939 ?auto_109942 ) ) ( not ( = ?auto_109941 ?auto_109944 ) ) ( not ( = ?auto_109941 ?auto_109943 ) ) ( not ( = ?auto_109941 ?auto_109940 ) ) ( not ( = ?auto_109941 ?auto_109942 ) ) ( not ( = ?auto_109945 ?auto_109944 ) ) ( not ( = ?auto_109945 ?auto_109943 ) ) ( not ( = ?auto_109945 ?auto_109940 ) ) ( not ( = ?auto_109945 ?auto_109942 ) ) ( ON ?auto_109946 ?auto_109945 ) ( ON ?auto_109944 ?auto_109946 ) ( CLEAR ?auto_109944 ) ( HOLDING ?auto_109942 ) ( CLEAR ?auto_109940 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109943 ?auto_109940 ?auto_109942 )
      ( MAKE-1PILE ?auto_109939 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109947 - BLOCK
    )
    :vars
    (
      ?auto_109949 - BLOCK
      ?auto_109952 - BLOCK
      ?auto_109954 - BLOCK
      ?auto_109951 - BLOCK
      ?auto_109948 - BLOCK
      ?auto_109950 - BLOCK
      ?auto_109953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109949 ?auto_109947 ) ( ON-TABLE ?auto_109947 ) ( not ( = ?auto_109947 ?auto_109949 ) ) ( not ( = ?auto_109947 ?auto_109952 ) ) ( not ( = ?auto_109947 ?auto_109954 ) ) ( not ( = ?auto_109949 ?auto_109952 ) ) ( not ( = ?auto_109949 ?auto_109954 ) ) ( not ( = ?auto_109952 ?auto_109954 ) ) ( ON ?auto_109952 ?auto_109949 ) ( ON-TABLE ?auto_109951 ) ( ON ?auto_109948 ?auto_109951 ) ( not ( = ?auto_109951 ?auto_109948 ) ) ( not ( = ?auto_109951 ?auto_109950 ) ) ( not ( = ?auto_109951 ?auto_109953 ) ) ( not ( = ?auto_109951 ?auto_109954 ) ) ( not ( = ?auto_109948 ?auto_109950 ) ) ( not ( = ?auto_109948 ?auto_109953 ) ) ( not ( = ?auto_109948 ?auto_109954 ) ) ( not ( = ?auto_109950 ?auto_109953 ) ) ( not ( = ?auto_109950 ?auto_109954 ) ) ( not ( = ?auto_109953 ?auto_109954 ) ) ( not ( = ?auto_109947 ?auto_109953 ) ) ( not ( = ?auto_109947 ?auto_109951 ) ) ( not ( = ?auto_109947 ?auto_109948 ) ) ( not ( = ?auto_109947 ?auto_109950 ) ) ( not ( = ?auto_109949 ?auto_109953 ) ) ( not ( = ?auto_109949 ?auto_109951 ) ) ( not ( = ?auto_109949 ?auto_109948 ) ) ( not ( = ?auto_109949 ?auto_109950 ) ) ( not ( = ?auto_109952 ?auto_109953 ) ) ( not ( = ?auto_109952 ?auto_109951 ) ) ( not ( = ?auto_109952 ?auto_109948 ) ) ( not ( = ?auto_109952 ?auto_109950 ) ) ( ON ?auto_109954 ?auto_109952 ) ( ON ?auto_109953 ?auto_109954 ) ( CLEAR ?auto_109948 ) ( ON ?auto_109950 ?auto_109953 ) ( CLEAR ?auto_109950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109947 ?auto_109949 ?auto_109952 ?auto_109954 ?auto_109953 )
      ( MAKE-1PILE ?auto_109947 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109955 - BLOCK
    )
    :vars
    (
      ?auto_109962 - BLOCK
      ?auto_109956 - BLOCK
      ?auto_109959 - BLOCK
      ?auto_109960 - BLOCK
      ?auto_109961 - BLOCK
      ?auto_109958 - BLOCK
      ?auto_109957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109962 ?auto_109955 ) ( ON-TABLE ?auto_109955 ) ( not ( = ?auto_109955 ?auto_109962 ) ) ( not ( = ?auto_109955 ?auto_109956 ) ) ( not ( = ?auto_109955 ?auto_109959 ) ) ( not ( = ?auto_109962 ?auto_109956 ) ) ( not ( = ?auto_109962 ?auto_109959 ) ) ( not ( = ?auto_109956 ?auto_109959 ) ) ( ON ?auto_109956 ?auto_109962 ) ( ON-TABLE ?auto_109960 ) ( not ( = ?auto_109960 ?auto_109961 ) ) ( not ( = ?auto_109960 ?auto_109958 ) ) ( not ( = ?auto_109960 ?auto_109957 ) ) ( not ( = ?auto_109960 ?auto_109959 ) ) ( not ( = ?auto_109961 ?auto_109958 ) ) ( not ( = ?auto_109961 ?auto_109957 ) ) ( not ( = ?auto_109961 ?auto_109959 ) ) ( not ( = ?auto_109958 ?auto_109957 ) ) ( not ( = ?auto_109958 ?auto_109959 ) ) ( not ( = ?auto_109957 ?auto_109959 ) ) ( not ( = ?auto_109955 ?auto_109957 ) ) ( not ( = ?auto_109955 ?auto_109960 ) ) ( not ( = ?auto_109955 ?auto_109961 ) ) ( not ( = ?auto_109955 ?auto_109958 ) ) ( not ( = ?auto_109962 ?auto_109957 ) ) ( not ( = ?auto_109962 ?auto_109960 ) ) ( not ( = ?auto_109962 ?auto_109961 ) ) ( not ( = ?auto_109962 ?auto_109958 ) ) ( not ( = ?auto_109956 ?auto_109957 ) ) ( not ( = ?auto_109956 ?auto_109960 ) ) ( not ( = ?auto_109956 ?auto_109961 ) ) ( not ( = ?auto_109956 ?auto_109958 ) ) ( ON ?auto_109959 ?auto_109956 ) ( ON ?auto_109957 ?auto_109959 ) ( ON ?auto_109958 ?auto_109957 ) ( CLEAR ?auto_109958 ) ( HOLDING ?auto_109961 ) ( CLEAR ?auto_109960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109960 ?auto_109961 )
      ( MAKE-1PILE ?auto_109955 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111369 - BLOCK
    )
    :vars
    (
      ?auto_111373 - BLOCK
      ?auto_111370 - BLOCK
      ?auto_111371 - BLOCK
      ?auto_111374 - BLOCK
      ?auto_111375 - BLOCK
      ?auto_111372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111373 ?auto_111369 ) ( ON-TABLE ?auto_111369 ) ( not ( = ?auto_111369 ?auto_111373 ) ) ( not ( = ?auto_111369 ?auto_111370 ) ) ( not ( = ?auto_111369 ?auto_111371 ) ) ( not ( = ?auto_111373 ?auto_111370 ) ) ( not ( = ?auto_111373 ?auto_111371 ) ) ( not ( = ?auto_111370 ?auto_111371 ) ) ( ON ?auto_111370 ?auto_111373 ) ( not ( = ?auto_111374 ?auto_111375 ) ) ( not ( = ?auto_111374 ?auto_111372 ) ) ( not ( = ?auto_111374 ?auto_111371 ) ) ( not ( = ?auto_111375 ?auto_111372 ) ) ( not ( = ?auto_111375 ?auto_111371 ) ) ( not ( = ?auto_111372 ?auto_111371 ) ) ( not ( = ?auto_111369 ?auto_111372 ) ) ( not ( = ?auto_111369 ?auto_111374 ) ) ( not ( = ?auto_111369 ?auto_111375 ) ) ( not ( = ?auto_111373 ?auto_111372 ) ) ( not ( = ?auto_111373 ?auto_111374 ) ) ( not ( = ?auto_111373 ?auto_111375 ) ) ( not ( = ?auto_111370 ?auto_111372 ) ) ( not ( = ?auto_111370 ?auto_111374 ) ) ( not ( = ?auto_111370 ?auto_111375 ) ) ( ON ?auto_111371 ?auto_111370 ) ( ON ?auto_111372 ?auto_111371 ) ( ON ?auto_111375 ?auto_111372 ) ( ON ?auto_111374 ?auto_111375 ) ( CLEAR ?auto_111374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111369 ?auto_111373 ?auto_111370 ?auto_111371 ?auto_111372 ?auto_111375 )
      ( MAKE-1PILE ?auto_111369 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109971 - BLOCK
    )
    :vars
    (
      ?auto_109973 - BLOCK
      ?auto_109975 - BLOCK
      ?auto_109972 - BLOCK
      ?auto_109978 - BLOCK
      ?auto_109974 - BLOCK
      ?auto_109976 - BLOCK
      ?auto_109977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109973 ?auto_109971 ) ( ON-TABLE ?auto_109971 ) ( not ( = ?auto_109971 ?auto_109973 ) ) ( not ( = ?auto_109971 ?auto_109975 ) ) ( not ( = ?auto_109971 ?auto_109972 ) ) ( not ( = ?auto_109973 ?auto_109975 ) ) ( not ( = ?auto_109973 ?auto_109972 ) ) ( not ( = ?auto_109975 ?auto_109972 ) ) ( ON ?auto_109975 ?auto_109973 ) ( not ( = ?auto_109978 ?auto_109974 ) ) ( not ( = ?auto_109978 ?auto_109976 ) ) ( not ( = ?auto_109978 ?auto_109977 ) ) ( not ( = ?auto_109978 ?auto_109972 ) ) ( not ( = ?auto_109974 ?auto_109976 ) ) ( not ( = ?auto_109974 ?auto_109977 ) ) ( not ( = ?auto_109974 ?auto_109972 ) ) ( not ( = ?auto_109976 ?auto_109977 ) ) ( not ( = ?auto_109976 ?auto_109972 ) ) ( not ( = ?auto_109977 ?auto_109972 ) ) ( not ( = ?auto_109971 ?auto_109977 ) ) ( not ( = ?auto_109971 ?auto_109978 ) ) ( not ( = ?auto_109971 ?auto_109974 ) ) ( not ( = ?auto_109971 ?auto_109976 ) ) ( not ( = ?auto_109973 ?auto_109977 ) ) ( not ( = ?auto_109973 ?auto_109978 ) ) ( not ( = ?auto_109973 ?auto_109974 ) ) ( not ( = ?auto_109973 ?auto_109976 ) ) ( not ( = ?auto_109975 ?auto_109977 ) ) ( not ( = ?auto_109975 ?auto_109978 ) ) ( not ( = ?auto_109975 ?auto_109974 ) ) ( not ( = ?auto_109975 ?auto_109976 ) ) ( ON ?auto_109972 ?auto_109975 ) ( ON ?auto_109977 ?auto_109972 ) ( ON ?auto_109976 ?auto_109977 ) ( ON ?auto_109974 ?auto_109976 ) ( CLEAR ?auto_109974 ) ( HOLDING ?auto_109978 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109978 )
      ( MAKE-1PILE ?auto_109971 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109979 - BLOCK
    )
    :vars
    (
      ?auto_109983 - BLOCK
      ?auto_109982 - BLOCK
      ?auto_109986 - BLOCK
      ?auto_109984 - BLOCK
      ?auto_109981 - BLOCK
      ?auto_109985 - BLOCK
      ?auto_109980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109983 ?auto_109979 ) ( ON-TABLE ?auto_109979 ) ( not ( = ?auto_109979 ?auto_109983 ) ) ( not ( = ?auto_109979 ?auto_109982 ) ) ( not ( = ?auto_109979 ?auto_109986 ) ) ( not ( = ?auto_109983 ?auto_109982 ) ) ( not ( = ?auto_109983 ?auto_109986 ) ) ( not ( = ?auto_109982 ?auto_109986 ) ) ( ON ?auto_109982 ?auto_109983 ) ( not ( = ?auto_109984 ?auto_109981 ) ) ( not ( = ?auto_109984 ?auto_109985 ) ) ( not ( = ?auto_109984 ?auto_109980 ) ) ( not ( = ?auto_109984 ?auto_109986 ) ) ( not ( = ?auto_109981 ?auto_109985 ) ) ( not ( = ?auto_109981 ?auto_109980 ) ) ( not ( = ?auto_109981 ?auto_109986 ) ) ( not ( = ?auto_109985 ?auto_109980 ) ) ( not ( = ?auto_109985 ?auto_109986 ) ) ( not ( = ?auto_109980 ?auto_109986 ) ) ( not ( = ?auto_109979 ?auto_109980 ) ) ( not ( = ?auto_109979 ?auto_109984 ) ) ( not ( = ?auto_109979 ?auto_109981 ) ) ( not ( = ?auto_109979 ?auto_109985 ) ) ( not ( = ?auto_109983 ?auto_109980 ) ) ( not ( = ?auto_109983 ?auto_109984 ) ) ( not ( = ?auto_109983 ?auto_109981 ) ) ( not ( = ?auto_109983 ?auto_109985 ) ) ( not ( = ?auto_109982 ?auto_109980 ) ) ( not ( = ?auto_109982 ?auto_109984 ) ) ( not ( = ?auto_109982 ?auto_109981 ) ) ( not ( = ?auto_109982 ?auto_109985 ) ) ( ON ?auto_109986 ?auto_109982 ) ( ON ?auto_109980 ?auto_109986 ) ( ON ?auto_109985 ?auto_109980 ) ( ON ?auto_109981 ?auto_109985 ) ( ON ?auto_109984 ?auto_109981 ) ( CLEAR ?auto_109984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109979 ?auto_109983 ?auto_109982 ?auto_109986 ?auto_109980 ?auto_109985 ?auto_109981 )
      ( MAKE-1PILE ?auto_109979 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109994 - BLOCK
      ?auto_109995 - BLOCK
      ?auto_109996 - BLOCK
      ?auto_109997 - BLOCK
      ?auto_109998 - BLOCK
      ?auto_109999 - BLOCK
      ?auto_110000 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_110000 ) ( CLEAR ?auto_109999 ) ( ON-TABLE ?auto_109994 ) ( ON ?auto_109995 ?auto_109994 ) ( ON ?auto_109996 ?auto_109995 ) ( ON ?auto_109997 ?auto_109996 ) ( ON ?auto_109998 ?auto_109997 ) ( ON ?auto_109999 ?auto_109998 ) ( not ( = ?auto_109994 ?auto_109995 ) ) ( not ( = ?auto_109994 ?auto_109996 ) ) ( not ( = ?auto_109994 ?auto_109997 ) ) ( not ( = ?auto_109994 ?auto_109998 ) ) ( not ( = ?auto_109994 ?auto_109999 ) ) ( not ( = ?auto_109994 ?auto_110000 ) ) ( not ( = ?auto_109995 ?auto_109996 ) ) ( not ( = ?auto_109995 ?auto_109997 ) ) ( not ( = ?auto_109995 ?auto_109998 ) ) ( not ( = ?auto_109995 ?auto_109999 ) ) ( not ( = ?auto_109995 ?auto_110000 ) ) ( not ( = ?auto_109996 ?auto_109997 ) ) ( not ( = ?auto_109996 ?auto_109998 ) ) ( not ( = ?auto_109996 ?auto_109999 ) ) ( not ( = ?auto_109996 ?auto_110000 ) ) ( not ( = ?auto_109997 ?auto_109998 ) ) ( not ( = ?auto_109997 ?auto_109999 ) ) ( not ( = ?auto_109997 ?auto_110000 ) ) ( not ( = ?auto_109998 ?auto_109999 ) ) ( not ( = ?auto_109998 ?auto_110000 ) ) ( not ( = ?auto_109999 ?auto_110000 ) ) )
    :subtasks
    ( ( !STACK ?auto_110000 ?auto_109999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110001 - BLOCK
      ?auto_110002 - BLOCK
      ?auto_110003 - BLOCK
      ?auto_110004 - BLOCK
      ?auto_110005 - BLOCK
      ?auto_110006 - BLOCK
      ?auto_110007 - BLOCK
    )
    :vars
    (
      ?auto_110008 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_110006 ) ( ON-TABLE ?auto_110001 ) ( ON ?auto_110002 ?auto_110001 ) ( ON ?auto_110003 ?auto_110002 ) ( ON ?auto_110004 ?auto_110003 ) ( ON ?auto_110005 ?auto_110004 ) ( ON ?auto_110006 ?auto_110005 ) ( not ( = ?auto_110001 ?auto_110002 ) ) ( not ( = ?auto_110001 ?auto_110003 ) ) ( not ( = ?auto_110001 ?auto_110004 ) ) ( not ( = ?auto_110001 ?auto_110005 ) ) ( not ( = ?auto_110001 ?auto_110006 ) ) ( not ( = ?auto_110001 ?auto_110007 ) ) ( not ( = ?auto_110002 ?auto_110003 ) ) ( not ( = ?auto_110002 ?auto_110004 ) ) ( not ( = ?auto_110002 ?auto_110005 ) ) ( not ( = ?auto_110002 ?auto_110006 ) ) ( not ( = ?auto_110002 ?auto_110007 ) ) ( not ( = ?auto_110003 ?auto_110004 ) ) ( not ( = ?auto_110003 ?auto_110005 ) ) ( not ( = ?auto_110003 ?auto_110006 ) ) ( not ( = ?auto_110003 ?auto_110007 ) ) ( not ( = ?auto_110004 ?auto_110005 ) ) ( not ( = ?auto_110004 ?auto_110006 ) ) ( not ( = ?auto_110004 ?auto_110007 ) ) ( not ( = ?auto_110005 ?auto_110006 ) ) ( not ( = ?auto_110005 ?auto_110007 ) ) ( not ( = ?auto_110006 ?auto_110007 ) ) ( ON ?auto_110007 ?auto_110008 ) ( CLEAR ?auto_110007 ) ( HAND-EMPTY ) ( not ( = ?auto_110001 ?auto_110008 ) ) ( not ( = ?auto_110002 ?auto_110008 ) ) ( not ( = ?auto_110003 ?auto_110008 ) ) ( not ( = ?auto_110004 ?auto_110008 ) ) ( not ( = ?auto_110005 ?auto_110008 ) ) ( not ( = ?auto_110006 ?auto_110008 ) ) ( not ( = ?auto_110007 ?auto_110008 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110007 ?auto_110008 )
      ( MAKE-7PILE ?auto_110001 ?auto_110002 ?auto_110003 ?auto_110004 ?auto_110005 ?auto_110006 ?auto_110007 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110009 - BLOCK
      ?auto_110010 - BLOCK
      ?auto_110011 - BLOCK
      ?auto_110012 - BLOCK
      ?auto_110013 - BLOCK
      ?auto_110014 - BLOCK
      ?auto_110015 - BLOCK
    )
    :vars
    (
      ?auto_110016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110009 ) ( ON ?auto_110010 ?auto_110009 ) ( ON ?auto_110011 ?auto_110010 ) ( ON ?auto_110012 ?auto_110011 ) ( ON ?auto_110013 ?auto_110012 ) ( not ( = ?auto_110009 ?auto_110010 ) ) ( not ( = ?auto_110009 ?auto_110011 ) ) ( not ( = ?auto_110009 ?auto_110012 ) ) ( not ( = ?auto_110009 ?auto_110013 ) ) ( not ( = ?auto_110009 ?auto_110014 ) ) ( not ( = ?auto_110009 ?auto_110015 ) ) ( not ( = ?auto_110010 ?auto_110011 ) ) ( not ( = ?auto_110010 ?auto_110012 ) ) ( not ( = ?auto_110010 ?auto_110013 ) ) ( not ( = ?auto_110010 ?auto_110014 ) ) ( not ( = ?auto_110010 ?auto_110015 ) ) ( not ( = ?auto_110011 ?auto_110012 ) ) ( not ( = ?auto_110011 ?auto_110013 ) ) ( not ( = ?auto_110011 ?auto_110014 ) ) ( not ( = ?auto_110011 ?auto_110015 ) ) ( not ( = ?auto_110012 ?auto_110013 ) ) ( not ( = ?auto_110012 ?auto_110014 ) ) ( not ( = ?auto_110012 ?auto_110015 ) ) ( not ( = ?auto_110013 ?auto_110014 ) ) ( not ( = ?auto_110013 ?auto_110015 ) ) ( not ( = ?auto_110014 ?auto_110015 ) ) ( ON ?auto_110015 ?auto_110016 ) ( CLEAR ?auto_110015 ) ( not ( = ?auto_110009 ?auto_110016 ) ) ( not ( = ?auto_110010 ?auto_110016 ) ) ( not ( = ?auto_110011 ?auto_110016 ) ) ( not ( = ?auto_110012 ?auto_110016 ) ) ( not ( = ?auto_110013 ?auto_110016 ) ) ( not ( = ?auto_110014 ?auto_110016 ) ) ( not ( = ?auto_110015 ?auto_110016 ) ) ( HOLDING ?auto_110014 ) ( CLEAR ?auto_110013 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110009 ?auto_110010 ?auto_110011 ?auto_110012 ?auto_110013 ?auto_110014 )
      ( MAKE-7PILE ?auto_110009 ?auto_110010 ?auto_110011 ?auto_110012 ?auto_110013 ?auto_110014 ?auto_110015 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110017 - BLOCK
      ?auto_110018 - BLOCK
      ?auto_110019 - BLOCK
      ?auto_110020 - BLOCK
      ?auto_110021 - BLOCK
      ?auto_110022 - BLOCK
      ?auto_110023 - BLOCK
    )
    :vars
    (
      ?auto_110024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110017 ) ( ON ?auto_110018 ?auto_110017 ) ( ON ?auto_110019 ?auto_110018 ) ( ON ?auto_110020 ?auto_110019 ) ( ON ?auto_110021 ?auto_110020 ) ( not ( = ?auto_110017 ?auto_110018 ) ) ( not ( = ?auto_110017 ?auto_110019 ) ) ( not ( = ?auto_110017 ?auto_110020 ) ) ( not ( = ?auto_110017 ?auto_110021 ) ) ( not ( = ?auto_110017 ?auto_110022 ) ) ( not ( = ?auto_110017 ?auto_110023 ) ) ( not ( = ?auto_110018 ?auto_110019 ) ) ( not ( = ?auto_110018 ?auto_110020 ) ) ( not ( = ?auto_110018 ?auto_110021 ) ) ( not ( = ?auto_110018 ?auto_110022 ) ) ( not ( = ?auto_110018 ?auto_110023 ) ) ( not ( = ?auto_110019 ?auto_110020 ) ) ( not ( = ?auto_110019 ?auto_110021 ) ) ( not ( = ?auto_110019 ?auto_110022 ) ) ( not ( = ?auto_110019 ?auto_110023 ) ) ( not ( = ?auto_110020 ?auto_110021 ) ) ( not ( = ?auto_110020 ?auto_110022 ) ) ( not ( = ?auto_110020 ?auto_110023 ) ) ( not ( = ?auto_110021 ?auto_110022 ) ) ( not ( = ?auto_110021 ?auto_110023 ) ) ( not ( = ?auto_110022 ?auto_110023 ) ) ( ON ?auto_110023 ?auto_110024 ) ( not ( = ?auto_110017 ?auto_110024 ) ) ( not ( = ?auto_110018 ?auto_110024 ) ) ( not ( = ?auto_110019 ?auto_110024 ) ) ( not ( = ?auto_110020 ?auto_110024 ) ) ( not ( = ?auto_110021 ?auto_110024 ) ) ( not ( = ?auto_110022 ?auto_110024 ) ) ( not ( = ?auto_110023 ?auto_110024 ) ) ( CLEAR ?auto_110021 ) ( ON ?auto_110022 ?auto_110023 ) ( CLEAR ?auto_110022 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110024 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110024 ?auto_110023 )
      ( MAKE-7PILE ?auto_110017 ?auto_110018 ?auto_110019 ?auto_110020 ?auto_110021 ?auto_110022 ?auto_110023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110025 - BLOCK
      ?auto_110026 - BLOCK
      ?auto_110027 - BLOCK
      ?auto_110028 - BLOCK
      ?auto_110029 - BLOCK
      ?auto_110030 - BLOCK
      ?auto_110031 - BLOCK
    )
    :vars
    (
      ?auto_110032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110025 ) ( ON ?auto_110026 ?auto_110025 ) ( ON ?auto_110027 ?auto_110026 ) ( ON ?auto_110028 ?auto_110027 ) ( not ( = ?auto_110025 ?auto_110026 ) ) ( not ( = ?auto_110025 ?auto_110027 ) ) ( not ( = ?auto_110025 ?auto_110028 ) ) ( not ( = ?auto_110025 ?auto_110029 ) ) ( not ( = ?auto_110025 ?auto_110030 ) ) ( not ( = ?auto_110025 ?auto_110031 ) ) ( not ( = ?auto_110026 ?auto_110027 ) ) ( not ( = ?auto_110026 ?auto_110028 ) ) ( not ( = ?auto_110026 ?auto_110029 ) ) ( not ( = ?auto_110026 ?auto_110030 ) ) ( not ( = ?auto_110026 ?auto_110031 ) ) ( not ( = ?auto_110027 ?auto_110028 ) ) ( not ( = ?auto_110027 ?auto_110029 ) ) ( not ( = ?auto_110027 ?auto_110030 ) ) ( not ( = ?auto_110027 ?auto_110031 ) ) ( not ( = ?auto_110028 ?auto_110029 ) ) ( not ( = ?auto_110028 ?auto_110030 ) ) ( not ( = ?auto_110028 ?auto_110031 ) ) ( not ( = ?auto_110029 ?auto_110030 ) ) ( not ( = ?auto_110029 ?auto_110031 ) ) ( not ( = ?auto_110030 ?auto_110031 ) ) ( ON ?auto_110031 ?auto_110032 ) ( not ( = ?auto_110025 ?auto_110032 ) ) ( not ( = ?auto_110026 ?auto_110032 ) ) ( not ( = ?auto_110027 ?auto_110032 ) ) ( not ( = ?auto_110028 ?auto_110032 ) ) ( not ( = ?auto_110029 ?auto_110032 ) ) ( not ( = ?auto_110030 ?auto_110032 ) ) ( not ( = ?auto_110031 ?auto_110032 ) ) ( ON ?auto_110030 ?auto_110031 ) ( CLEAR ?auto_110030 ) ( ON-TABLE ?auto_110032 ) ( HOLDING ?auto_110029 ) ( CLEAR ?auto_110028 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110025 ?auto_110026 ?auto_110027 ?auto_110028 ?auto_110029 )
      ( MAKE-7PILE ?auto_110025 ?auto_110026 ?auto_110027 ?auto_110028 ?auto_110029 ?auto_110030 ?auto_110031 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110033 - BLOCK
      ?auto_110034 - BLOCK
      ?auto_110035 - BLOCK
      ?auto_110036 - BLOCK
      ?auto_110037 - BLOCK
      ?auto_110038 - BLOCK
      ?auto_110039 - BLOCK
    )
    :vars
    (
      ?auto_110040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110033 ) ( ON ?auto_110034 ?auto_110033 ) ( ON ?auto_110035 ?auto_110034 ) ( ON ?auto_110036 ?auto_110035 ) ( not ( = ?auto_110033 ?auto_110034 ) ) ( not ( = ?auto_110033 ?auto_110035 ) ) ( not ( = ?auto_110033 ?auto_110036 ) ) ( not ( = ?auto_110033 ?auto_110037 ) ) ( not ( = ?auto_110033 ?auto_110038 ) ) ( not ( = ?auto_110033 ?auto_110039 ) ) ( not ( = ?auto_110034 ?auto_110035 ) ) ( not ( = ?auto_110034 ?auto_110036 ) ) ( not ( = ?auto_110034 ?auto_110037 ) ) ( not ( = ?auto_110034 ?auto_110038 ) ) ( not ( = ?auto_110034 ?auto_110039 ) ) ( not ( = ?auto_110035 ?auto_110036 ) ) ( not ( = ?auto_110035 ?auto_110037 ) ) ( not ( = ?auto_110035 ?auto_110038 ) ) ( not ( = ?auto_110035 ?auto_110039 ) ) ( not ( = ?auto_110036 ?auto_110037 ) ) ( not ( = ?auto_110036 ?auto_110038 ) ) ( not ( = ?auto_110036 ?auto_110039 ) ) ( not ( = ?auto_110037 ?auto_110038 ) ) ( not ( = ?auto_110037 ?auto_110039 ) ) ( not ( = ?auto_110038 ?auto_110039 ) ) ( ON ?auto_110039 ?auto_110040 ) ( not ( = ?auto_110033 ?auto_110040 ) ) ( not ( = ?auto_110034 ?auto_110040 ) ) ( not ( = ?auto_110035 ?auto_110040 ) ) ( not ( = ?auto_110036 ?auto_110040 ) ) ( not ( = ?auto_110037 ?auto_110040 ) ) ( not ( = ?auto_110038 ?auto_110040 ) ) ( not ( = ?auto_110039 ?auto_110040 ) ) ( ON ?auto_110038 ?auto_110039 ) ( ON-TABLE ?auto_110040 ) ( CLEAR ?auto_110036 ) ( ON ?auto_110037 ?auto_110038 ) ( CLEAR ?auto_110037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110040 ?auto_110039 ?auto_110038 )
      ( MAKE-7PILE ?auto_110033 ?auto_110034 ?auto_110035 ?auto_110036 ?auto_110037 ?auto_110038 ?auto_110039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110041 - BLOCK
      ?auto_110042 - BLOCK
      ?auto_110043 - BLOCK
      ?auto_110044 - BLOCK
      ?auto_110045 - BLOCK
      ?auto_110046 - BLOCK
      ?auto_110047 - BLOCK
    )
    :vars
    (
      ?auto_110048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110041 ) ( ON ?auto_110042 ?auto_110041 ) ( ON ?auto_110043 ?auto_110042 ) ( not ( = ?auto_110041 ?auto_110042 ) ) ( not ( = ?auto_110041 ?auto_110043 ) ) ( not ( = ?auto_110041 ?auto_110044 ) ) ( not ( = ?auto_110041 ?auto_110045 ) ) ( not ( = ?auto_110041 ?auto_110046 ) ) ( not ( = ?auto_110041 ?auto_110047 ) ) ( not ( = ?auto_110042 ?auto_110043 ) ) ( not ( = ?auto_110042 ?auto_110044 ) ) ( not ( = ?auto_110042 ?auto_110045 ) ) ( not ( = ?auto_110042 ?auto_110046 ) ) ( not ( = ?auto_110042 ?auto_110047 ) ) ( not ( = ?auto_110043 ?auto_110044 ) ) ( not ( = ?auto_110043 ?auto_110045 ) ) ( not ( = ?auto_110043 ?auto_110046 ) ) ( not ( = ?auto_110043 ?auto_110047 ) ) ( not ( = ?auto_110044 ?auto_110045 ) ) ( not ( = ?auto_110044 ?auto_110046 ) ) ( not ( = ?auto_110044 ?auto_110047 ) ) ( not ( = ?auto_110045 ?auto_110046 ) ) ( not ( = ?auto_110045 ?auto_110047 ) ) ( not ( = ?auto_110046 ?auto_110047 ) ) ( ON ?auto_110047 ?auto_110048 ) ( not ( = ?auto_110041 ?auto_110048 ) ) ( not ( = ?auto_110042 ?auto_110048 ) ) ( not ( = ?auto_110043 ?auto_110048 ) ) ( not ( = ?auto_110044 ?auto_110048 ) ) ( not ( = ?auto_110045 ?auto_110048 ) ) ( not ( = ?auto_110046 ?auto_110048 ) ) ( not ( = ?auto_110047 ?auto_110048 ) ) ( ON ?auto_110046 ?auto_110047 ) ( ON-TABLE ?auto_110048 ) ( ON ?auto_110045 ?auto_110046 ) ( CLEAR ?auto_110045 ) ( HOLDING ?auto_110044 ) ( CLEAR ?auto_110043 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110041 ?auto_110042 ?auto_110043 ?auto_110044 )
      ( MAKE-7PILE ?auto_110041 ?auto_110042 ?auto_110043 ?auto_110044 ?auto_110045 ?auto_110046 ?auto_110047 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110049 - BLOCK
      ?auto_110050 - BLOCK
      ?auto_110051 - BLOCK
      ?auto_110052 - BLOCK
      ?auto_110053 - BLOCK
      ?auto_110054 - BLOCK
      ?auto_110055 - BLOCK
    )
    :vars
    (
      ?auto_110056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110049 ) ( ON ?auto_110050 ?auto_110049 ) ( ON ?auto_110051 ?auto_110050 ) ( not ( = ?auto_110049 ?auto_110050 ) ) ( not ( = ?auto_110049 ?auto_110051 ) ) ( not ( = ?auto_110049 ?auto_110052 ) ) ( not ( = ?auto_110049 ?auto_110053 ) ) ( not ( = ?auto_110049 ?auto_110054 ) ) ( not ( = ?auto_110049 ?auto_110055 ) ) ( not ( = ?auto_110050 ?auto_110051 ) ) ( not ( = ?auto_110050 ?auto_110052 ) ) ( not ( = ?auto_110050 ?auto_110053 ) ) ( not ( = ?auto_110050 ?auto_110054 ) ) ( not ( = ?auto_110050 ?auto_110055 ) ) ( not ( = ?auto_110051 ?auto_110052 ) ) ( not ( = ?auto_110051 ?auto_110053 ) ) ( not ( = ?auto_110051 ?auto_110054 ) ) ( not ( = ?auto_110051 ?auto_110055 ) ) ( not ( = ?auto_110052 ?auto_110053 ) ) ( not ( = ?auto_110052 ?auto_110054 ) ) ( not ( = ?auto_110052 ?auto_110055 ) ) ( not ( = ?auto_110053 ?auto_110054 ) ) ( not ( = ?auto_110053 ?auto_110055 ) ) ( not ( = ?auto_110054 ?auto_110055 ) ) ( ON ?auto_110055 ?auto_110056 ) ( not ( = ?auto_110049 ?auto_110056 ) ) ( not ( = ?auto_110050 ?auto_110056 ) ) ( not ( = ?auto_110051 ?auto_110056 ) ) ( not ( = ?auto_110052 ?auto_110056 ) ) ( not ( = ?auto_110053 ?auto_110056 ) ) ( not ( = ?auto_110054 ?auto_110056 ) ) ( not ( = ?auto_110055 ?auto_110056 ) ) ( ON ?auto_110054 ?auto_110055 ) ( ON-TABLE ?auto_110056 ) ( ON ?auto_110053 ?auto_110054 ) ( CLEAR ?auto_110051 ) ( ON ?auto_110052 ?auto_110053 ) ( CLEAR ?auto_110052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110056 ?auto_110055 ?auto_110054 ?auto_110053 )
      ( MAKE-7PILE ?auto_110049 ?auto_110050 ?auto_110051 ?auto_110052 ?auto_110053 ?auto_110054 ?auto_110055 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110057 - BLOCK
      ?auto_110058 - BLOCK
      ?auto_110059 - BLOCK
      ?auto_110060 - BLOCK
      ?auto_110061 - BLOCK
      ?auto_110062 - BLOCK
      ?auto_110063 - BLOCK
    )
    :vars
    (
      ?auto_110064 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110057 ) ( ON ?auto_110058 ?auto_110057 ) ( not ( = ?auto_110057 ?auto_110058 ) ) ( not ( = ?auto_110057 ?auto_110059 ) ) ( not ( = ?auto_110057 ?auto_110060 ) ) ( not ( = ?auto_110057 ?auto_110061 ) ) ( not ( = ?auto_110057 ?auto_110062 ) ) ( not ( = ?auto_110057 ?auto_110063 ) ) ( not ( = ?auto_110058 ?auto_110059 ) ) ( not ( = ?auto_110058 ?auto_110060 ) ) ( not ( = ?auto_110058 ?auto_110061 ) ) ( not ( = ?auto_110058 ?auto_110062 ) ) ( not ( = ?auto_110058 ?auto_110063 ) ) ( not ( = ?auto_110059 ?auto_110060 ) ) ( not ( = ?auto_110059 ?auto_110061 ) ) ( not ( = ?auto_110059 ?auto_110062 ) ) ( not ( = ?auto_110059 ?auto_110063 ) ) ( not ( = ?auto_110060 ?auto_110061 ) ) ( not ( = ?auto_110060 ?auto_110062 ) ) ( not ( = ?auto_110060 ?auto_110063 ) ) ( not ( = ?auto_110061 ?auto_110062 ) ) ( not ( = ?auto_110061 ?auto_110063 ) ) ( not ( = ?auto_110062 ?auto_110063 ) ) ( ON ?auto_110063 ?auto_110064 ) ( not ( = ?auto_110057 ?auto_110064 ) ) ( not ( = ?auto_110058 ?auto_110064 ) ) ( not ( = ?auto_110059 ?auto_110064 ) ) ( not ( = ?auto_110060 ?auto_110064 ) ) ( not ( = ?auto_110061 ?auto_110064 ) ) ( not ( = ?auto_110062 ?auto_110064 ) ) ( not ( = ?auto_110063 ?auto_110064 ) ) ( ON ?auto_110062 ?auto_110063 ) ( ON-TABLE ?auto_110064 ) ( ON ?auto_110061 ?auto_110062 ) ( ON ?auto_110060 ?auto_110061 ) ( CLEAR ?auto_110060 ) ( HOLDING ?auto_110059 ) ( CLEAR ?auto_110058 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110057 ?auto_110058 ?auto_110059 )
      ( MAKE-7PILE ?auto_110057 ?auto_110058 ?auto_110059 ?auto_110060 ?auto_110061 ?auto_110062 ?auto_110063 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110065 - BLOCK
      ?auto_110066 - BLOCK
      ?auto_110067 - BLOCK
      ?auto_110068 - BLOCK
      ?auto_110069 - BLOCK
      ?auto_110070 - BLOCK
      ?auto_110071 - BLOCK
    )
    :vars
    (
      ?auto_110072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110065 ) ( ON ?auto_110066 ?auto_110065 ) ( not ( = ?auto_110065 ?auto_110066 ) ) ( not ( = ?auto_110065 ?auto_110067 ) ) ( not ( = ?auto_110065 ?auto_110068 ) ) ( not ( = ?auto_110065 ?auto_110069 ) ) ( not ( = ?auto_110065 ?auto_110070 ) ) ( not ( = ?auto_110065 ?auto_110071 ) ) ( not ( = ?auto_110066 ?auto_110067 ) ) ( not ( = ?auto_110066 ?auto_110068 ) ) ( not ( = ?auto_110066 ?auto_110069 ) ) ( not ( = ?auto_110066 ?auto_110070 ) ) ( not ( = ?auto_110066 ?auto_110071 ) ) ( not ( = ?auto_110067 ?auto_110068 ) ) ( not ( = ?auto_110067 ?auto_110069 ) ) ( not ( = ?auto_110067 ?auto_110070 ) ) ( not ( = ?auto_110067 ?auto_110071 ) ) ( not ( = ?auto_110068 ?auto_110069 ) ) ( not ( = ?auto_110068 ?auto_110070 ) ) ( not ( = ?auto_110068 ?auto_110071 ) ) ( not ( = ?auto_110069 ?auto_110070 ) ) ( not ( = ?auto_110069 ?auto_110071 ) ) ( not ( = ?auto_110070 ?auto_110071 ) ) ( ON ?auto_110071 ?auto_110072 ) ( not ( = ?auto_110065 ?auto_110072 ) ) ( not ( = ?auto_110066 ?auto_110072 ) ) ( not ( = ?auto_110067 ?auto_110072 ) ) ( not ( = ?auto_110068 ?auto_110072 ) ) ( not ( = ?auto_110069 ?auto_110072 ) ) ( not ( = ?auto_110070 ?auto_110072 ) ) ( not ( = ?auto_110071 ?auto_110072 ) ) ( ON ?auto_110070 ?auto_110071 ) ( ON-TABLE ?auto_110072 ) ( ON ?auto_110069 ?auto_110070 ) ( ON ?auto_110068 ?auto_110069 ) ( CLEAR ?auto_110066 ) ( ON ?auto_110067 ?auto_110068 ) ( CLEAR ?auto_110067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110072 ?auto_110071 ?auto_110070 ?auto_110069 ?auto_110068 )
      ( MAKE-7PILE ?auto_110065 ?auto_110066 ?auto_110067 ?auto_110068 ?auto_110069 ?auto_110070 ?auto_110071 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110073 - BLOCK
      ?auto_110074 - BLOCK
      ?auto_110075 - BLOCK
      ?auto_110076 - BLOCK
      ?auto_110077 - BLOCK
      ?auto_110078 - BLOCK
      ?auto_110079 - BLOCK
    )
    :vars
    (
      ?auto_110080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110073 ) ( not ( = ?auto_110073 ?auto_110074 ) ) ( not ( = ?auto_110073 ?auto_110075 ) ) ( not ( = ?auto_110073 ?auto_110076 ) ) ( not ( = ?auto_110073 ?auto_110077 ) ) ( not ( = ?auto_110073 ?auto_110078 ) ) ( not ( = ?auto_110073 ?auto_110079 ) ) ( not ( = ?auto_110074 ?auto_110075 ) ) ( not ( = ?auto_110074 ?auto_110076 ) ) ( not ( = ?auto_110074 ?auto_110077 ) ) ( not ( = ?auto_110074 ?auto_110078 ) ) ( not ( = ?auto_110074 ?auto_110079 ) ) ( not ( = ?auto_110075 ?auto_110076 ) ) ( not ( = ?auto_110075 ?auto_110077 ) ) ( not ( = ?auto_110075 ?auto_110078 ) ) ( not ( = ?auto_110075 ?auto_110079 ) ) ( not ( = ?auto_110076 ?auto_110077 ) ) ( not ( = ?auto_110076 ?auto_110078 ) ) ( not ( = ?auto_110076 ?auto_110079 ) ) ( not ( = ?auto_110077 ?auto_110078 ) ) ( not ( = ?auto_110077 ?auto_110079 ) ) ( not ( = ?auto_110078 ?auto_110079 ) ) ( ON ?auto_110079 ?auto_110080 ) ( not ( = ?auto_110073 ?auto_110080 ) ) ( not ( = ?auto_110074 ?auto_110080 ) ) ( not ( = ?auto_110075 ?auto_110080 ) ) ( not ( = ?auto_110076 ?auto_110080 ) ) ( not ( = ?auto_110077 ?auto_110080 ) ) ( not ( = ?auto_110078 ?auto_110080 ) ) ( not ( = ?auto_110079 ?auto_110080 ) ) ( ON ?auto_110078 ?auto_110079 ) ( ON-TABLE ?auto_110080 ) ( ON ?auto_110077 ?auto_110078 ) ( ON ?auto_110076 ?auto_110077 ) ( ON ?auto_110075 ?auto_110076 ) ( CLEAR ?auto_110075 ) ( HOLDING ?auto_110074 ) ( CLEAR ?auto_110073 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110073 ?auto_110074 )
      ( MAKE-7PILE ?auto_110073 ?auto_110074 ?auto_110075 ?auto_110076 ?auto_110077 ?auto_110078 ?auto_110079 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110081 - BLOCK
      ?auto_110082 - BLOCK
      ?auto_110083 - BLOCK
      ?auto_110084 - BLOCK
      ?auto_110085 - BLOCK
      ?auto_110086 - BLOCK
      ?auto_110087 - BLOCK
    )
    :vars
    (
      ?auto_110088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110081 ) ( not ( = ?auto_110081 ?auto_110082 ) ) ( not ( = ?auto_110081 ?auto_110083 ) ) ( not ( = ?auto_110081 ?auto_110084 ) ) ( not ( = ?auto_110081 ?auto_110085 ) ) ( not ( = ?auto_110081 ?auto_110086 ) ) ( not ( = ?auto_110081 ?auto_110087 ) ) ( not ( = ?auto_110082 ?auto_110083 ) ) ( not ( = ?auto_110082 ?auto_110084 ) ) ( not ( = ?auto_110082 ?auto_110085 ) ) ( not ( = ?auto_110082 ?auto_110086 ) ) ( not ( = ?auto_110082 ?auto_110087 ) ) ( not ( = ?auto_110083 ?auto_110084 ) ) ( not ( = ?auto_110083 ?auto_110085 ) ) ( not ( = ?auto_110083 ?auto_110086 ) ) ( not ( = ?auto_110083 ?auto_110087 ) ) ( not ( = ?auto_110084 ?auto_110085 ) ) ( not ( = ?auto_110084 ?auto_110086 ) ) ( not ( = ?auto_110084 ?auto_110087 ) ) ( not ( = ?auto_110085 ?auto_110086 ) ) ( not ( = ?auto_110085 ?auto_110087 ) ) ( not ( = ?auto_110086 ?auto_110087 ) ) ( ON ?auto_110087 ?auto_110088 ) ( not ( = ?auto_110081 ?auto_110088 ) ) ( not ( = ?auto_110082 ?auto_110088 ) ) ( not ( = ?auto_110083 ?auto_110088 ) ) ( not ( = ?auto_110084 ?auto_110088 ) ) ( not ( = ?auto_110085 ?auto_110088 ) ) ( not ( = ?auto_110086 ?auto_110088 ) ) ( not ( = ?auto_110087 ?auto_110088 ) ) ( ON ?auto_110086 ?auto_110087 ) ( ON-TABLE ?auto_110088 ) ( ON ?auto_110085 ?auto_110086 ) ( ON ?auto_110084 ?auto_110085 ) ( ON ?auto_110083 ?auto_110084 ) ( CLEAR ?auto_110081 ) ( ON ?auto_110082 ?auto_110083 ) ( CLEAR ?auto_110082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110088 ?auto_110087 ?auto_110086 ?auto_110085 ?auto_110084 ?auto_110083 )
      ( MAKE-7PILE ?auto_110081 ?auto_110082 ?auto_110083 ?auto_110084 ?auto_110085 ?auto_110086 ?auto_110087 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110089 - BLOCK
      ?auto_110090 - BLOCK
      ?auto_110091 - BLOCK
      ?auto_110092 - BLOCK
      ?auto_110093 - BLOCK
      ?auto_110094 - BLOCK
      ?auto_110095 - BLOCK
    )
    :vars
    (
      ?auto_110096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110089 ?auto_110090 ) ) ( not ( = ?auto_110089 ?auto_110091 ) ) ( not ( = ?auto_110089 ?auto_110092 ) ) ( not ( = ?auto_110089 ?auto_110093 ) ) ( not ( = ?auto_110089 ?auto_110094 ) ) ( not ( = ?auto_110089 ?auto_110095 ) ) ( not ( = ?auto_110090 ?auto_110091 ) ) ( not ( = ?auto_110090 ?auto_110092 ) ) ( not ( = ?auto_110090 ?auto_110093 ) ) ( not ( = ?auto_110090 ?auto_110094 ) ) ( not ( = ?auto_110090 ?auto_110095 ) ) ( not ( = ?auto_110091 ?auto_110092 ) ) ( not ( = ?auto_110091 ?auto_110093 ) ) ( not ( = ?auto_110091 ?auto_110094 ) ) ( not ( = ?auto_110091 ?auto_110095 ) ) ( not ( = ?auto_110092 ?auto_110093 ) ) ( not ( = ?auto_110092 ?auto_110094 ) ) ( not ( = ?auto_110092 ?auto_110095 ) ) ( not ( = ?auto_110093 ?auto_110094 ) ) ( not ( = ?auto_110093 ?auto_110095 ) ) ( not ( = ?auto_110094 ?auto_110095 ) ) ( ON ?auto_110095 ?auto_110096 ) ( not ( = ?auto_110089 ?auto_110096 ) ) ( not ( = ?auto_110090 ?auto_110096 ) ) ( not ( = ?auto_110091 ?auto_110096 ) ) ( not ( = ?auto_110092 ?auto_110096 ) ) ( not ( = ?auto_110093 ?auto_110096 ) ) ( not ( = ?auto_110094 ?auto_110096 ) ) ( not ( = ?auto_110095 ?auto_110096 ) ) ( ON ?auto_110094 ?auto_110095 ) ( ON-TABLE ?auto_110096 ) ( ON ?auto_110093 ?auto_110094 ) ( ON ?auto_110092 ?auto_110093 ) ( ON ?auto_110091 ?auto_110092 ) ( ON ?auto_110090 ?auto_110091 ) ( CLEAR ?auto_110090 ) ( HOLDING ?auto_110089 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110089 )
      ( MAKE-7PILE ?auto_110089 ?auto_110090 ?auto_110091 ?auto_110092 ?auto_110093 ?auto_110094 ?auto_110095 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_110097 - BLOCK
      ?auto_110098 - BLOCK
      ?auto_110099 - BLOCK
      ?auto_110100 - BLOCK
      ?auto_110101 - BLOCK
      ?auto_110102 - BLOCK
      ?auto_110103 - BLOCK
    )
    :vars
    (
      ?auto_110104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110097 ?auto_110098 ) ) ( not ( = ?auto_110097 ?auto_110099 ) ) ( not ( = ?auto_110097 ?auto_110100 ) ) ( not ( = ?auto_110097 ?auto_110101 ) ) ( not ( = ?auto_110097 ?auto_110102 ) ) ( not ( = ?auto_110097 ?auto_110103 ) ) ( not ( = ?auto_110098 ?auto_110099 ) ) ( not ( = ?auto_110098 ?auto_110100 ) ) ( not ( = ?auto_110098 ?auto_110101 ) ) ( not ( = ?auto_110098 ?auto_110102 ) ) ( not ( = ?auto_110098 ?auto_110103 ) ) ( not ( = ?auto_110099 ?auto_110100 ) ) ( not ( = ?auto_110099 ?auto_110101 ) ) ( not ( = ?auto_110099 ?auto_110102 ) ) ( not ( = ?auto_110099 ?auto_110103 ) ) ( not ( = ?auto_110100 ?auto_110101 ) ) ( not ( = ?auto_110100 ?auto_110102 ) ) ( not ( = ?auto_110100 ?auto_110103 ) ) ( not ( = ?auto_110101 ?auto_110102 ) ) ( not ( = ?auto_110101 ?auto_110103 ) ) ( not ( = ?auto_110102 ?auto_110103 ) ) ( ON ?auto_110103 ?auto_110104 ) ( not ( = ?auto_110097 ?auto_110104 ) ) ( not ( = ?auto_110098 ?auto_110104 ) ) ( not ( = ?auto_110099 ?auto_110104 ) ) ( not ( = ?auto_110100 ?auto_110104 ) ) ( not ( = ?auto_110101 ?auto_110104 ) ) ( not ( = ?auto_110102 ?auto_110104 ) ) ( not ( = ?auto_110103 ?auto_110104 ) ) ( ON ?auto_110102 ?auto_110103 ) ( ON-TABLE ?auto_110104 ) ( ON ?auto_110101 ?auto_110102 ) ( ON ?auto_110100 ?auto_110101 ) ( ON ?auto_110099 ?auto_110100 ) ( ON ?auto_110098 ?auto_110099 ) ( ON ?auto_110097 ?auto_110098 ) ( CLEAR ?auto_110097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110104 ?auto_110103 ?auto_110102 ?auto_110101 ?auto_110100 ?auto_110099 ?auto_110098 )
      ( MAKE-7PILE ?auto_110097 ?auto_110098 ?auto_110099 ?auto_110100 ?auto_110101 ?auto_110102 ?auto_110103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110211 - BLOCK
    )
    :vars
    (
      ?auto_110212 - BLOCK
      ?auto_110213 - BLOCK
      ?auto_110214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110211 ?auto_110212 ) ( CLEAR ?auto_110211 ) ( not ( = ?auto_110211 ?auto_110212 ) ) ( HOLDING ?auto_110213 ) ( CLEAR ?auto_110214 ) ( not ( = ?auto_110211 ?auto_110213 ) ) ( not ( = ?auto_110211 ?auto_110214 ) ) ( not ( = ?auto_110212 ?auto_110213 ) ) ( not ( = ?auto_110212 ?auto_110214 ) ) ( not ( = ?auto_110213 ?auto_110214 ) ) )
    :subtasks
    ( ( !STACK ?auto_110213 ?auto_110214 )
      ( MAKE-1PILE ?auto_110211 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110215 - BLOCK
    )
    :vars
    (
      ?auto_110217 - BLOCK
      ?auto_110218 - BLOCK
      ?auto_110216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110215 ?auto_110217 ) ( not ( = ?auto_110215 ?auto_110217 ) ) ( CLEAR ?auto_110218 ) ( not ( = ?auto_110215 ?auto_110216 ) ) ( not ( = ?auto_110215 ?auto_110218 ) ) ( not ( = ?auto_110217 ?auto_110216 ) ) ( not ( = ?auto_110217 ?auto_110218 ) ) ( not ( = ?auto_110216 ?auto_110218 ) ) ( ON ?auto_110216 ?auto_110215 ) ( CLEAR ?auto_110216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110217 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110217 ?auto_110215 )
      ( MAKE-1PILE ?auto_110215 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110219 - BLOCK
    )
    :vars
    (
      ?auto_110220 - BLOCK
      ?auto_110222 - BLOCK
      ?auto_110221 - BLOCK
      ?auto_110225 - BLOCK
      ?auto_110226 - BLOCK
      ?auto_110224 - BLOCK
      ?auto_110223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110219 ?auto_110220 ) ( not ( = ?auto_110219 ?auto_110220 ) ) ( not ( = ?auto_110219 ?auto_110222 ) ) ( not ( = ?auto_110219 ?auto_110221 ) ) ( not ( = ?auto_110220 ?auto_110222 ) ) ( not ( = ?auto_110220 ?auto_110221 ) ) ( not ( = ?auto_110222 ?auto_110221 ) ) ( ON ?auto_110222 ?auto_110219 ) ( CLEAR ?auto_110222 ) ( ON-TABLE ?auto_110220 ) ( HOLDING ?auto_110221 ) ( CLEAR ?auto_110225 ) ( ON-TABLE ?auto_110226 ) ( ON ?auto_110224 ?auto_110226 ) ( ON ?auto_110223 ?auto_110224 ) ( ON ?auto_110225 ?auto_110223 ) ( not ( = ?auto_110226 ?auto_110224 ) ) ( not ( = ?auto_110226 ?auto_110223 ) ) ( not ( = ?auto_110226 ?auto_110225 ) ) ( not ( = ?auto_110226 ?auto_110221 ) ) ( not ( = ?auto_110224 ?auto_110223 ) ) ( not ( = ?auto_110224 ?auto_110225 ) ) ( not ( = ?auto_110224 ?auto_110221 ) ) ( not ( = ?auto_110223 ?auto_110225 ) ) ( not ( = ?auto_110223 ?auto_110221 ) ) ( not ( = ?auto_110225 ?auto_110221 ) ) ( not ( = ?auto_110219 ?auto_110225 ) ) ( not ( = ?auto_110219 ?auto_110226 ) ) ( not ( = ?auto_110219 ?auto_110224 ) ) ( not ( = ?auto_110219 ?auto_110223 ) ) ( not ( = ?auto_110220 ?auto_110225 ) ) ( not ( = ?auto_110220 ?auto_110226 ) ) ( not ( = ?auto_110220 ?auto_110224 ) ) ( not ( = ?auto_110220 ?auto_110223 ) ) ( not ( = ?auto_110222 ?auto_110225 ) ) ( not ( = ?auto_110222 ?auto_110226 ) ) ( not ( = ?auto_110222 ?auto_110224 ) ) ( not ( = ?auto_110222 ?auto_110223 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110226 ?auto_110224 ?auto_110223 ?auto_110225 ?auto_110221 )
      ( MAKE-1PILE ?auto_110219 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110227 - BLOCK
    )
    :vars
    (
      ?auto_110233 - BLOCK
      ?auto_110230 - BLOCK
      ?auto_110231 - BLOCK
      ?auto_110232 - BLOCK
      ?auto_110228 - BLOCK
      ?auto_110234 - BLOCK
      ?auto_110229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110227 ?auto_110233 ) ( not ( = ?auto_110227 ?auto_110233 ) ) ( not ( = ?auto_110227 ?auto_110230 ) ) ( not ( = ?auto_110227 ?auto_110231 ) ) ( not ( = ?auto_110233 ?auto_110230 ) ) ( not ( = ?auto_110233 ?auto_110231 ) ) ( not ( = ?auto_110230 ?auto_110231 ) ) ( ON ?auto_110230 ?auto_110227 ) ( ON-TABLE ?auto_110233 ) ( CLEAR ?auto_110232 ) ( ON-TABLE ?auto_110228 ) ( ON ?auto_110234 ?auto_110228 ) ( ON ?auto_110229 ?auto_110234 ) ( ON ?auto_110232 ?auto_110229 ) ( not ( = ?auto_110228 ?auto_110234 ) ) ( not ( = ?auto_110228 ?auto_110229 ) ) ( not ( = ?auto_110228 ?auto_110232 ) ) ( not ( = ?auto_110228 ?auto_110231 ) ) ( not ( = ?auto_110234 ?auto_110229 ) ) ( not ( = ?auto_110234 ?auto_110232 ) ) ( not ( = ?auto_110234 ?auto_110231 ) ) ( not ( = ?auto_110229 ?auto_110232 ) ) ( not ( = ?auto_110229 ?auto_110231 ) ) ( not ( = ?auto_110232 ?auto_110231 ) ) ( not ( = ?auto_110227 ?auto_110232 ) ) ( not ( = ?auto_110227 ?auto_110228 ) ) ( not ( = ?auto_110227 ?auto_110234 ) ) ( not ( = ?auto_110227 ?auto_110229 ) ) ( not ( = ?auto_110233 ?auto_110232 ) ) ( not ( = ?auto_110233 ?auto_110228 ) ) ( not ( = ?auto_110233 ?auto_110234 ) ) ( not ( = ?auto_110233 ?auto_110229 ) ) ( not ( = ?auto_110230 ?auto_110232 ) ) ( not ( = ?auto_110230 ?auto_110228 ) ) ( not ( = ?auto_110230 ?auto_110234 ) ) ( not ( = ?auto_110230 ?auto_110229 ) ) ( ON ?auto_110231 ?auto_110230 ) ( CLEAR ?auto_110231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110233 ?auto_110227 ?auto_110230 )
      ( MAKE-1PILE ?auto_110227 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110235 - BLOCK
    )
    :vars
    (
      ?auto_110239 - BLOCK
      ?auto_110240 - BLOCK
      ?auto_110236 - BLOCK
      ?auto_110241 - BLOCK
      ?auto_110242 - BLOCK
      ?auto_110238 - BLOCK
      ?auto_110237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110235 ?auto_110239 ) ( not ( = ?auto_110235 ?auto_110239 ) ) ( not ( = ?auto_110235 ?auto_110240 ) ) ( not ( = ?auto_110235 ?auto_110236 ) ) ( not ( = ?auto_110239 ?auto_110240 ) ) ( not ( = ?auto_110239 ?auto_110236 ) ) ( not ( = ?auto_110240 ?auto_110236 ) ) ( ON ?auto_110240 ?auto_110235 ) ( ON-TABLE ?auto_110239 ) ( ON-TABLE ?auto_110241 ) ( ON ?auto_110242 ?auto_110241 ) ( ON ?auto_110238 ?auto_110242 ) ( not ( = ?auto_110241 ?auto_110242 ) ) ( not ( = ?auto_110241 ?auto_110238 ) ) ( not ( = ?auto_110241 ?auto_110237 ) ) ( not ( = ?auto_110241 ?auto_110236 ) ) ( not ( = ?auto_110242 ?auto_110238 ) ) ( not ( = ?auto_110242 ?auto_110237 ) ) ( not ( = ?auto_110242 ?auto_110236 ) ) ( not ( = ?auto_110238 ?auto_110237 ) ) ( not ( = ?auto_110238 ?auto_110236 ) ) ( not ( = ?auto_110237 ?auto_110236 ) ) ( not ( = ?auto_110235 ?auto_110237 ) ) ( not ( = ?auto_110235 ?auto_110241 ) ) ( not ( = ?auto_110235 ?auto_110242 ) ) ( not ( = ?auto_110235 ?auto_110238 ) ) ( not ( = ?auto_110239 ?auto_110237 ) ) ( not ( = ?auto_110239 ?auto_110241 ) ) ( not ( = ?auto_110239 ?auto_110242 ) ) ( not ( = ?auto_110239 ?auto_110238 ) ) ( not ( = ?auto_110240 ?auto_110237 ) ) ( not ( = ?auto_110240 ?auto_110241 ) ) ( not ( = ?auto_110240 ?auto_110242 ) ) ( not ( = ?auto_110240 ?auto_110238 ) ) ( ON ?auto_110236 ?auto_110240 ) ( CLEAR ?auto_110236 ) ( HOLDING ?auto_110237 ) ( CLEAR ?auto_110238 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110241 ?auto_110242 ?auto_110238 ?auto_110237 )
      ( MAKE-1PILE ?auto_110235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110243 - BLOCK
    )
    :vars
    (
      ?auto_110245 - BLOCK
      ?auto_110250 - BLOCK
      ?auto_110248 - BLOCK
      ?auto_110249 - BLOCK
      ?auto_110246 - BLOCK
      ?auto_110244 - BLOCK
      ?auto_110247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110243 ?auto_110245 ) ( not ( = ?auto_110243 ?auto_110245 ) ) ( not ( = ?auto_110243 ?auto_110250 ) ) ( not ( = ?auto_110243 ?auto_110248 ) ) ( not ( = ?auto_110245 ?auto_110250 ) ) ( not ( = ?auto_110245 ?auto_110248 ) ) ( not ( = ?auto_110250 ?auto_110248 ) ) ( ON ?auto_110250 ?auto_110243 ) ( ON-TABLE ?auto_110245 ) ( ON-TABLE ?auto_110249 ) ( ON ?auto_110246 ?auto_110249 ) ( ON ?auto_110244 ?auto_110246 ) ( not ( = ?auto_110249 ?auto_110246 ) ) ( not ( = ?auto_110249 ?auto_110244 ) ) ( not ( = ?auto_110249 ?auto_110247 ) ) ( not ( = ?auto_110249 ?auto_110248 ) ) ( not ( = ?auto_110246 ?auto_110244 ) ) ( not ( = ?auto_110246 ?auto_110247 ) ) ( not ( = ?auto_110246 ?auto_110248 ) ) ( not ( = ?auto_110244 ?auto_110247 ) ) ( not ( = ?auto_110244 ?auto_110248 ) ) ( not ( = ?auto_110247 ?auto_110248 ) ) ( not ( = ?auto_110243 ?auto_110247 ) ) ( not ( = ?auto_110243 ?auto_110249 ) ) ( not ( = ?auto_110243 ?auto_110246 ) ) ( not ( = ?auto_110243 ?auto_110244 ) ) ( not ( = ?auto_110245 ?auto_110247 ) ) ( not ( = ?auto_110245 ?auto_110249 ) ) ( not ( = ?auto_110245 ?auto_110246 ) ) ( not ( = ?auto_110245 ?auto_110244 ) ) ( not ( = ?auto_110250 ?auto_110247 ) ) ( not ( = ?auto_110250 ?auto_110249 ) ) ( not ( = ?auto_110250 ?auto_110246 ) ) ( not ( = ?auto_110250 ?auto_110244 ) ) ( ON ?auto_110248 ?auto_110250 ) ( CLEAR ?auto_110244 ) ( ON ?auto_110247 ?auto_110248 ) ( CLEAR ?auto_110247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110245 ?auto_110243 ?auto_110250 ?auto_110248 )
      ( MAKE-1PILE ?auto_110243 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110251 - BLOCK
    )
    :vars
    (
      ?auto_110255 - BLOCK
      ?auto_110257 - BLOCK
      ?auto_110253 - BLOCK
      ?auto_110252 - BLOCK
      ?auto_110254 - BLOCK
      ?auto_110258 - BLOCK
      ?auto_110256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110251 ?auto_110255 ) ( not ( = ?auto_110251 ?auto_110255 ) ) ( not ( = ?auto_110251 ?auto_110257 ) ) ( not ( = ?auto_110251 ?auto_110253 ) ) ( not ( = ?auto_110255 ?auto_110257 ) ) ( not ( = ?auto_110255 ?auto_110253 ) ) ( not ( = ?auto_110257 ?auto_110253 ) ) ( ON ?auto_110257 ?auto_110251 ) ( ON-TABLE ?auto_110255 ) ( ON-TABLE ?auto_110252 ) ( ON ?auto_110254 ?auto_110252 ) ( not ( = ?auto_110252 ?auto_110254 ) ) ( not ( = ?auto_110252 ?auto_110258 ) ) ( not ( = ?auto_110252 ?auto_110256 ) ) ( not ( = ?auto_110252 ?auto_110253 ) ) ( not ( = ?auto_110254 ?auto_110258 ) ) ( not ( = ?auto_110254 ?auto_110256 ) ) ( not ( = ?auto_110254 ?auto_110253 ) ) ( not ( = ?auto_110258 ?auto_110256 ) ) ( not ( = ?auto_110258 ?auto_110253 ) ) ( not ( = ?auto_110256 ?auto_110253 ) ) ( not ( = ?auto_110251 ?auto_110256 ) ) ( not ( = ?auto_110251 ?auto_110252 ) ) ( not ( = ?auto_110251 ?auto_110254 ) ) ( not ( = ?auto_110251 ?auto_110258 ) ) ( not ( = ?auto_110255 ?auto_110256 ) ) ( not ( = ?auto_110255 ?auto_110252 ) ) ( not ( = ?auto_110255 ?auto_110254 ) ) ( not ( = ?auto_110255 ?auto_110258 ) ) ( not ( = ?auto_110257 ?auto_110256 ) ) ( not ( = ?auto_110257 ?auto_110252 ) ) ( not ( = ?auto_110257 ?auto_110254 ) ) ( not ( = ?auto_110257 ?auto_110258 ) ) ( ON ?auto_110253 ?auto_110257 ) ( ON ?auto_110256 ?auto_110253 ) ( CLEAR ?auto_110256 ) ( HOLDING ?auto_110258 ) ( CLEAR ?auto_110254 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110252 ?auto_110254 ?auto_110258 )
      ( MAKE-1PILE ?auto_110251 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110259 - BLOCK
    )
    :vars
    (
      ?auto_110266 - BLOCK
      ?auto_110264 - BLOCK
      ?auto_110262 - BLOCK
      ?auto_110265 - BLOCK
      ?auto_110263 - BLOCK
      ?auto_110260 - BLOCK
      ?auto_110261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110259 ?auto_110266 ) ( not ( = ?auto_110259 ?auto_110266 ) ) ( not ( = ?auto_110259 ?auto_110264 ) ) ( not ( = ?auto_110259 ?auto_110262 ) ) ( not ( = ?auto_110266 ?auto_110264 ) ) ( not ( = ?auto_110266 ?auto_110262 ) ) ( not ( = ?auto_110264 ?auto_110262 ) ) ( ON ?auto_110264 ?auto_110259 ) ( ON-TABLE ?auto_110266 ) ( ON-TABLE ?auto_110265 ) ( ON ?auto_110263 ?auto_110265 ) ( not ( = ?auto_110265 ?auto_110263 ) ) ( not ( = ?auto_110265 ?auto_110260 ) ) ( not ( = ?auto_110265 ?auto_110261 ) ) ( not ( = ?auto_110265 ?auto_110262 ) ) ( not ( = ?auto_110263 ?auto_110260 ) ) ( not ( = ?auto_110263 ?auto_110261 ) ) ( not ( = ?auto_110263 ?auto_110262 ) ) ( not ( = ?auto_110260 ?auto_110261 ) ) ( not ( = ?auto_110260 ?auto_110262 ) ) ( not ( = ?auto_110261 ?auto_110262 ) ) ( not ( = ?auto_110259 ?auto_110261 ) ) ( not ( = ?auto_110259 ?auto_110265 ) ) ( not ( = ?auto_110259 ?auto_110263 ) ) ( not ( = ?auto_110259 ?auto_110260 ) ) ( not ( = ?auto_110266 ?auto_110261 ) ) ( not ( = ?auto_110266 ?auto_110265 ) ) ( not ( = ?auto_110266 ?auto_110263 ) ) ( not ( = ?auto_110266 ?auto_110260 ) ) ( not ( = ?auto_110264 ?auto_110261 ) ) ( not ( = ?auto_110264 ?auto_110265 ) ) ( not ( = ?auto_110264 ?auto_110263 ) ) ( not ( = ?auto_110264 ?auto_110260 ) ) ( ON ?auto_110262 ?auto_110264 ) ( ON ?auto_110261 ?auto_110262 ) ( CLEAR ?auto_110263 ) ( ON ?auto_110260 ?auto_110261 ) ( CLEAR ?auto_110260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110266 ?auto_110259 ?auto_110264 ?auto_110262 ?auto_110261 )
      ( MAKE-1PILE ?auto_110259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110267 - BLOCK
    )
    :vars
    (
      ?auto_110272 - BLOCK
      ?auto_110273 - BLOCK
      ?auto_110268 - BLOCK
      ?auto_110274 - BLOCK
      ?auto_110270 - BLOCK
      ?auto_110271 - BLOCK
      ?auto_110269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110267 ?auto_110272 ) ( not ( = ?auto_110267 ?auto_110272 ) ) ( not ( = ?auto_110267 ?auto_110273 ) ) ( not ( = ?auto_110267 ?auto_110268 ) ) ( not ( = ?auto_110272 ?auto_110273 ) ) ( not ( = ?auto_110272 ?auto_110268 ) ) ( not ( = ?auto_110273 ?auto_110268 ) ) ( ON ?auto_110273 ?auto_110267 ) ( ON-TABLE ?auto_110272 ) ( ON-TABLE ?auto_110274 ) ( not ( = ?auto_110274 ?auto_110270 ) ) ( not ( = ?auto_110274 ?auto_110271 ) ) ( not ( = ?auto_110274 ?auto_110269 ) ) ( not ( = ?auto_110274 ?auto_110268 ) ) ( not ( = ?auto_110270 ?auto_110271 ) ) ( not ( = ?auto_110270 ?auto_110269 ) ) ( not ( = ?auto_110270 ?auto_110268 ) ) ( not ( = ?auto_110271 ?auto_110269 ) ) ( not ( = ?auto_110271 ?auto_110268 ) ) ( not ( = ?auto_110269 ?auto_110268 ) ) ( not ( = ?auto_110267 ?auto_110269 ) ) ( not ( = ?auto_110267 ?auto_110274 ) ) ( not ( = ?auto_110267 ?auto_110270 ) ) ( not ( = ?auto_110267 ?auto_110271 ) ) ( not ( = ?auto_110272 ?auto_110269 ) ) ( not ( = ?auto_110272 ?auto_110274 ) ) ( not ( = ?auto_110272 ?auto_110270 ) ) ( not ( = ?auto_110272 ?auto_110271 ) ) ( not ( = ?auto_110273 ?auto_110269 ) ) ( not ( = ?auto_110273 ?auto_110274 ) ) ( not ( = ?auto_110273 ?auto_110270 ) ) ( not ( = ?auto_110273 ?auto_110271 ) ) ( ON ?auto_110268 ?auto_110273 ) ( ON ?auto_110269 ?auto_110268 ) ( ON ?auto_110271 ?auto_110269 ) ( CLEAR ?auto_110271 ) ( HOLDING ?auto_110270 ) ( CLEAR ?auto_110274 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110274 ?auto_110270 )
      ( MAKE-1PILE ?auto_110267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110275 - BLOCK
    )
    :vars
    (
      ?auto_110278 - BLOCK
      ?auto_110276 - BLOCK
      ?auto_110281 - BLOCK
      ?auto_110277 - BLOCK
      ?auto_110279 - BLOCK
      ?auto_110280 - BLOCK
      ?auto_110282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110275 ?auto_110278 ) ( not ( = ?auto_110275 ?auto_110278 ) ) ( not ( = ?auto_110275 ?auto_110276 ) ) ( not ( = ?auto_110275 ?auto_110281 ) ) ( not ( = ?auto_110278 ?auto_110276 ) ) ( not ( = ?auto_110278 ?auto_110281 ) ) ( not ( = ?auto_110276 ?auto_110281 ) ) ( ON ?auto_110276 ?auto_110275 ) ( ON-TABLE ?auto_110278 ) ( ON-TABLE ?auto_110277 ) ( not ( = ?auto_110277 ?auto_110279 ) ) ( not ( = ?auto_110277 ?auto_110280 ) ) ( not ( = ?auto_110277 ?auto_110282 ) ) ( not ( = ?auto_110277 ?auto_110281 ) ) ( not ( = ?auto_110279 ?auto_110280 ) ) ( not ( = ?auto_110279 ?auto_110282 ) ) ( not ( = ?auto_110279 ?auto_110281 ) ) ( not ( = ?auto_110280 ?auto_110282 ) ) ( not ( = ?auto_110280 ?auto_110281 ) ) ( not ( = ?auto_110282 ?auto_110281 ) ) ( not ( = ?auto_110275 ?auto_110282 ) ) ( not ( = ?auto_110275 ?auto_110277 ) ) ( not ( = ?auto_110275 ?auto_110279 ) ) ( not ( = ?auto_110275 ?auto_110280 ) ) ( not ( = ?auto_110278 ?auto_110282 ) ) ( not ( = ?auto_110278 ?auto_110277 ) ) ( not ( = ?auto_110278 ?auto_110279 ) ) ( not ( = ?auto_110278 ?auto_110280 ) ) ( not ( = ?auto_110276 ?auto_110282 ) ) ( not ( = ?auto_110276 ?auto_110277 ) ) ( not ( = ?auto_110276 ?auto_110279 ) ) ( not ( = ?auto_110276 ?auto_110280 ) ) ( ON ?auto_110281 ?auto_110276 ) ( ON ?auto_110282 ?auto_110281 ) ( ON ?auto_110280 ?auto_110282 ) ( CLEAR ?auto_110277 ) ( ON ?auto_110279 ?auto_110280 ) ( CLEAR ?auto_110279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110278 ?auto_110275 ?auto_110276 ?auto_110281 ?auto_110282 ?auto_110280 )
      ( MAKE-1PILE ?auto_110275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110283 - BLOCK
    )
    :vars
    (
      ?auto_110284 - BLOCK
      ?auto_110289 - BLOCK
      ?auto_110290 - BLOCK
      ?auto_110288 - BLOCK
      ?auto_110285 - BLOCK
      ?auto_110287 - BLOCK
      ?auto_110286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110283 ?auto_110284 ) ( not ( = ?auto_110283 ?auto_110284 ) ) ( not ( = ?auto_110283 ?auto_110289 ) ) ( not ( = ?auto_110283 ?auto_110290 ) ) ( not ( = ?auto_110284 ?auto_110289 ) ) ( not ( = ?auto_110284 ?auto_110290 ) ) ( not ( = ?auto_110289 ?auto_110290 ) ) ( ON ?auto_110289 ?auto_110283 ) ( ON-TABLE ?auto_110284 ) ( not ( = ?auto_110288 ?auto_110285 ) ) ( not ( = ?auto_110288 ?auto_110287 ) ) ( not ( = ?auto_110288 ?auto_110286 ) ) ( not ( = ?auto_110288 ?auto_110290 ) ) ( not ( = ?auto_110285 ?auto_110287 ) ) ( not ( = ?auto_110285 ?auto_110286 ) ) ( not ( = ?auto_110285 ?auto_110290 ) ) ( not ( = ?auto_110287 ?auto_110286 ) ) ( not ( = ?auto_110287 ?auto_110290 ) ) ( not ( = ?auto_110286 ?auto_110290 ) ) ( not ( = ?auto_110283 ?auto_110286 ) ) ( not ( = ?auto_110283 ?auto_110288 ) ) ( not ( = ?auto_110283 ?auto_110285 ) ) ( not ( = ?auto_110283 ?auto_110287 ) ) ( not ( = ?auto_110284 ?auto_110286 ) ) ( not ( = ?auto_110284 ?auto_110288 ) ) ( not ( = ?auto_110284 ?auto_110285 ) ) ( not ( = ?auto_110284 ?auto_110287 ) ) ( not ( = ?auto_110289 ?auto_110286 ) ) ( not ( = ?auto_110289 ?auto_110288 ) ) ( not ( = ?auto_110289 ?auto_110285 ) ) ( not ( = ?auto_110289 ?auto_110287 ) ) ( ON ?auto_110290 ?auto_110289 ) ( ON ?auto_110286 ?auto_110290 ) ( ON ?auto_110287 ?auto_110286 ) ( ON ?auto_110285 ?auto_110287 ) ( CLEAR ?auto_110285 ) ( HOLDING ?auto_110288 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110288 )
      ( MAKE-1PILE ?auto_110283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_110291 - BLOCK
    )
    :vars
    (
      ?auto_110298 - BLOCK
      ?auto_110297 - BLOCK
      ?auto_110292 - BLOCK
      ?auto_110293 - BLOCK
      ?auto_110295 - BLOCK
      ?auto_110296 - BLOCK
      ?auto_110294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110291 ?auto_110298 ) ( not ( = ?auto_110291 ?auto_110298 ) ) ( not ( = ?auto_110291 ?auto_110297 ) ) ( not ( = ?auto_110291 ?auto_110292 ) ) ( not ( = ?auto_110298 ?auto_110297 ) ) ( not ( = ?auto_110298 ?auto_110292 ) ) ( not ( = ?auto_110297 ?auto_110292 ) ) ( ON ?auto_110297 ?auto_110291 ) ( ON-TABLE ?auto_110298 ) ( not ( = ?auto_110293 ?auto_110295 ) ) ( not ( = ?auto_110293 ?auto_110296 ) ) ( not ( = ?auto_110293 ?auto_110294 ) ) ( not ( = ?auto_110293 ?auto_110292 ) ) ( not ( = ?auto_110295 ?auto_110296 ) ) ( not ( = ?auto_110295 ?auto_110294 ) ) ( not ( = ?auto_110295 ?auto_110292 ) ) ( not ( = ?auto_110296 ?auto_110294 ) ) ( not ( = ?auto_110296 ?auto_110292 ) ) ( not ( = ?auto_110294 ?auto_110292 ) ) ( not ( = ?auto_110291 ?auto_110294 ) ) ( not ( = ?auto_110291 ?auto_110293 ) ) ( not ( = ?auto_110291 ?auto_110295 ) ) ( not ( = ?auto_110291 ?auto_110296 ) ) ( not ( = ?auto_110298 ?auto_110294 ) ) ( not ( = ?auto_110298 ?auto_110293 ) ) ( not ( = ?auto_110298 ?auto_110295 ) ) ( not ( = ?auto_110298 ?auto_110296 ) ) ( not ( = ?auto_110297 ?auto_110294 ) ) ( not ( = ?auto_110297 ?auto_110293 ) ) ( not ( = ?auto_110297 ?auto_110295 ) ) ( not ( = ?auto_110297 ?auto_110296 ) ) ( ON ?auto_110292 ?auto_110297 ) ( ON ?auto_110294 ?auto_110292 ) ( ON ?auto_110296 ?auto_110294 ) ( ON ?auto_110295 ?auto_110296 ) ( ON ?auto_110293 ?auto_110295 ) ( CLEAR ?auto_110293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110298 ?auto_110291 ?auto_110297 ?auto_110292 ?auto_110294 ?auto_110296 ?auto_110295 )
      ( MAKE-1PILE ?auto_110291 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_110310 - BLOCK
      ?auto_110311 - BLOCK
      ?auto_110312 - BLOCK
      ?auto_110313 - BLOCK
      ?auto_110314 - BLOCK
    )
    :vars
    (
      ?auto_110315 - BLOCK
      ?auto_110316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110315 ?auto_110314 ) ( CLEAR ?auto_110315 ) ( ON-TABLE ?auto_110310 ) ( ON ?auto_110311 ?auto_110310 ) ( ON ?auto_110312 ?auto_110311 ) ( ON ?auto_110313 ?auto_110312 ) ( ON ?auto_110314 ?auto_110313 ) ( not ( = ?auto_110310 ?auto_110311 ) ) ( not ( = ?auto_110310 ?auto_110312 ) ) ( not ( = ?auto_110310 ?auto_110313 ) ) ( not ( = ?auto_110310 ?auto_110314 ) ) ( not ( = ?auto_110310 ?auto_110315 ) ) ( not ( = ?auto_110311 ?auto_110312 ) ) ( not ( = ?auto_110311 ?auto_110313 ) ) ( not ( = ?auto_110311 ?auto_110314 ) ) ( not ( = ?auto_110311 ?auto_110315 ) ) ( not ( = ?auto_110312 ?auto_110313 ) ) ( not ( = ?auto_110312 ?auto_110314 ) ) ( not ( = ?auto_110312 ?auto_110315 ) ) ( not ( = ?auto_110313 ?auto_110314 ) ) ( not ( = ?auto_110313 ?auto_110315 ) ) ( not ( = ?auto_110314 ?auto_110315 ) ) ( HOLDING ?auto_110316 ) ( not ( = ?auto_110310 ?auto_110316 ) ) ( not ( = ?auto_110311 ?auto_110316 ) ) ( not ( = ?auto_110312 ?auto_110316 ) ) ( not ( = ?auto_110313 ?auto_110316 ) ) ( not ( = ?auto_110314 ?auto_110316 ) ) ( not ( = ?auto_110315 ?auto_110316 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_110316 )
      ( MAKE-5PILE ?auto_110310 ?auto_110311 ?auto_110312 ?auto_110313 ?auto_110314 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110407 - BLOCK
      ?auto_110408 - BLOCK
    )
    :vars
    (
      ?auto_110409 - BLOCK
      ?auto_110413 - BLOCK
      ?auto_110411 - BLOCK
      ?auto_110412 - BLOCK
      ?auto_110410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110407 ?auto_110408 ) ) ( ON ?auto_110408 ?auto_110409 ) ( not ( = ?auto_110407 ?auto_110409 ) ) ( not ( = ?auto_110408 ?auto_110409 ) ) ( ON ?auto_110407 ?auto_110408 ) ( CLEAR ?auto_110407 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110413 ) ( ON ?auto_110411 ?auto_110413 ) ( ON ?auto_110412 ?auto_110411 ) ( ON ?auto_110410 ?auto_110412 ) ( ON ?auto_110409 ?auto_110410 ) ( not ( = ?auto_110413 ?auto_110411 ) ) ( not ( = ?auto_110413 ?auto_110412 ) ) ( not ( = ?auto_110413 ?auto_110410 ) ) ( not ( = ?auto_110413 ?auto_110409 ) ) ( not ( = ?auto_110413 ?auto_110408 ) ) ( not ( = ?auto_110413 ?auto_110407 ) ) ( not ( = ?auto_110411 ?auto_110412 ) ) ( not ( = ?auto_110411 ?auto_110410 ) ) ( not ( = ?auto_110411 ?auto_110409 ) ) ( not ( = ?auto_110411 ?auto_110408 ) ) ( not ( = ?auto_110411 ?auto_110407 ) ) ( not ( = ?auto_110412 ?auto_110410 ) ) ( not ( = ?auto_110412 ?auto_110409 ) ) ( not ( = ?auto_110412 ?auto_110408 ) ) ( not ( = ?auto_110412 ?auto_110407 ) ) ( not ( = ?auto_110410 ?auto_110409 ) ) ( not ( = ?auto_110410 ?auto_110408 ) ) ( not ( = ?auto_110410 ?auto_110407 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110413 ?auto_110411 ?auto_110412 ?auto_110410 ?auto_110409 ?auto_110408 )
      ( MAKE-2PILE ?auto_110407 ?auto_110408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110416 - BLOCK
      ?auto_110417 - BLOCK
    )
    :vars
    (
      ?auto_110418 - BLOCK
      ?auto_110419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110416 ?auto_110417 ) ) ( ON ?auto_110417 ?auto_110418 ) ( CLEAR ?auto_110417 ) ( not ( = ?auto_110416 ?auto_110418 ) ) ( not ( = ?auto_110417 ?auto_110418 ) ) ( ON ?auto_110416 ?auto_110419 ) ( CLEAR ?auto_110416 ) ( HAND-EMPTY ) ( not ( = ?auto_110416 ?auto_110419 ) ) ( not ( = ?auto_110417 ?auto_110419 ) ) ( not ( = ?auto_110418 ?auto_110419 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110416 ?auto_110419 )
      ( MAKE-2PILE ?auto_110416 ?auto_110417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110420 - BLOCK
      ?auto_110421 - BLOCK
    )
    :vars
    (
      ?auto_110423 - BLOCK
      ?auto_110422 - BLOCK
      ?auto_110425 - BLOCK
      ?auto_110427 - BLOCK
      ?auto_110426 - BLOCK
      ?auto_110424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110420 ?auto_110421 ) ) ( not ( = ?auto_110420 ?auto_110423 ) ) ( not ( = ?auto_110421 ?auto_110423 ) ) ( ON ?auto_110420 ?auto_110422 ) ( CLEAR ?auto_110420 ) ( not ( = ?auto_110420 ?auto_110422 ) ) ( not ( = ?auto_110421 ?auto_110422 ) ) ( not ( = ?auto_110423 ?auto_110422 ) ) ( HOLDING ?auto_110421 ) ( CLEAR ?auto_110423 ) ( ON-TABLE ?auto_110425 ) ( ON ?auto_110427 ?auto_110425 ) ( ON ?auto_110426 ?auto_110427 ) ( ON ?auto_110424 ?auto_110426 ) ( ON ?auto_110423 ?auto_110424 ) ( not ( = ?auto_110425 ?auto_110427 ) ) ( not ( = ?auto_110425 ?auto_110426 ) ) ( not ( = ?auto_110425 ?auto_110424 ) ) ( not ( = ?auto_110425 ?auto_110423 ) ) ( not ( = ?auto_110425 ?auto_110421 ) ) ( not ( = ?auto_110427 ?auto_110426 ) ) ( not ( = ?auto_110427 ?auto_110424 ) ) ( not ( = ?auto_110427 ?auto_110423 ) ) ( not ( = ?auto_110427 ?auto_110421 ) ) ( not ( = ?auto_110426 ?auto_110424 ) ) ( not ( = ?auto_110426 ?auto_110423 ) ) ( not ( = ?auto_110426 ?auto_110421 ) ) ( not ( = ?auto_110424 ?auto_110423 ) ) ( not ( = ?auto_110424 ?auto_110421 ) ) ( not ( = ?auto_110420 ?auto_110425 ) ) ( not ( = ?auto_110420 ?auto_110427 ) ) ( not ( = ?auto_110420 ?auto_110426 ) ) ( not ( = ?auto_110420 ?auto_110424 ) ) ( not ( = ?auto_110422 ?auto_110425 ) ) ( not ( = ?auto_110422 ?auto_110427 ) ) ( not ( = ?auto_110422 ?auto_110426 ) ) ( not ( = ?auto_110422 ?auto_110424 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110425 ?auto_110427 ?auto_110426 ?auto_110424 ?auto_110423 ?auto_110421 )
      ( MAKE-2PILE ?auto_110420 ?auto_110421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110428 - BLOCK
      ?auto_110429 - BLOCK
    )
    :vars
    (
      ?auto_110431 - BLOCK
      ?auto_110433 - BLOCK
      ?auto_110432 - BLOCK
      ?auto_110434 - BLOCK
      ?auto_110430 - BLOCK
      ?auto_110435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110428 ?auto_110429 ) ) ( not ( = ?auto_110428 ?auto_110431 ) ) ( not ( = ?auto_110429 ?auto_110431 ) ) ( ON ?auto_110428 ?auto_110433 ) ( not ( = ?auto_110428 ?auto_110433 ) ) ( not ( = ?auto_110429 ?auto_110433 ) ) ( not ( = ?auto_110431 ?auto_110433 ) ) ( CLEAR ?auto_110431 ) ( ON-TABLE ?auto_110432 ) ( ON ?auto_110434 ?auto_110432 ) ( ON ?auto_110430 ?auto_110434 ) ( ON ?auto_110435 ?auto_110430 ) ( ON ?auto_110431 ?auto_110435 ) ( not ( = ?auto_110432 ?auto_110434 ) ) ( not ( = ?auto_110432 ?auto_110430 ) ) ( not ( = ?auto_110432 ?auto_110435 ) ) ( not ( = ?auto_110432 ?auto_110431 ) ) ( not ( = ?auto_110432 ?auto_110429 ) ) ( not ( = ?auto_110434 ?auto_110430 ) ) ( not ( = ?auto_110434 ?auto_110435 ) ) ( not ( = ?auto_110434 ?auto_110431 ) ) ( not ( = ?auto_110434 ?auto_110429 ) ) ( not ( = ?auto_110430 ?auto_110435 ) ) ( not ( = ?auto_110430 ?auto_110431 ) ) ( not ( = ?auto_110430 ?auto_110429 ) ) ( not ( = ?auto_110435 ?auto_110431 ) ) ( not ( = ?auto_110435 ?auto_110429 ) ) ( not ( = ?auto_110428 ?auto_110432 ) ) ( not ( = ?auto_110428 ?auto_110434 ) ) ( not ( = ?auto_110428 ?auto_110430 ) ) ( not ( = ?auto_110428 ?auto_110435 ) ) ( not ( = ?auto_110433 ?auto_110432 ) ) ( not ( = ?auto_110433 ?auto_110434 ) ) ( not ( = ?auto_110433 ?auto_110430 ) ) ( not ( = ?auto_110433 ?auto_110435 ) ) ( ON ?auto_110429 ?auto_110428 ) ( CLEAR ?auto_110429 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110433 ?auto_110428 )
      ( MAKE-2PILE ?auto_110428 ?auto_110429 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110436 - BLOCK
      ?auto_110437 - BLOCK
    )
    :vars
    (
      ?auto_110442 - BLOCK
      ?auto_110440 - BLOCK
      ?auto_110439 - BLOCK
      ?auto_110443 - BLOCK
      ?auto_110438 - BLOCK
      ?auto_110441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110436 ?auto_110437 ) ) ( not ( = ?auto_110436 ?auto_110442 ) ) ( not ( = ?auto_110437 ?auto_110442 ) ) ( ON ?auto_110436 ?auto_110440 ) ( not ( = ?auto_110436 ?auto_110440 ) ) ( not ( = ?auto_110437 ?auto_110440 ) ) ( not ( = ?auto_110442 ?auto_110440 ) ) ( ON-TABLE ?auto_110439 ) ( ON ?auto_110443 ?auto_110439 ) ( ON ?auto_110438 ?auto_110443 ) ( ON ?auto_110441 ?auto_110438 ) ( not ( = ?auto_110439 ?auto_110443 ) ) ( not ( = ?auto_110439 ?auto_110438 ) ) ( not ( = ?auto_110439 ?auto_110441 ) ) ( not ( = ?auto_110439 ?auto_110442 ) ) ( not ( = ?auto_110439 ?auto_110437 ) ) ( not ( = ?auto_110443 ?auto_110438 ) ) ( not ( = ?auto_110443 ?auto_110441 ) ) ( not ( = ?auto_110443 ?auto_110442 ) ) ( not ( = ?auto_110443 ?auto_110437 ) ) ( not ( = ?auto_110438 ?auto_110441 ) ) ( not ( = ?auto_110438 ?auto_110442 ) ) ( not ( = ?auto_110438 ?auto_110437 ) ) ( not ( = ?auto_110441 ?auto_110442 ) ) ( not ( = ?auto_110441 ?auto_110437 ) ) ( not ( = ?auto_110436 ?auto_110439 ) ) ( not ( = ?auto_110436 ?auto_110443 ) ) ( not ( = ?auto_110436 ?auto_110438 ) ) ( not ( = ?auto_110436 ?auto_110441 ) ) ( not ( = ?auto_110440 ?auto_110439 ) ) ( not ( = ?auto_110440 ?auto_110443 ) ) ( not ( = ?auto_110440 ?auto_110438 ) ) ( not ( = ?auto_110440 ?auto_110441 ) ) ( ON ?auto_110437 ?auto_110436 ) ( CLEAR ?auto_110437 ) ( ON-TABLE ?auto_110440 ) ( HOLDING ?auto_110442 ) ( CLEAR ?auto_110441 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110439 ?auto_110443 ?auto_110438 ?auto_110441 ?auto_110442 )
      ( MAKE-2PILE ?auto_110436 ?auto_110437 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110444 - BLOCK
      ?auto_110445 - BLOCK
    )
    :vars
    (
      ?auto_110448 - BLOCK
      ?auto_110450 - BLOCK
      ?auto_110446 - BLOCK
      ?auto_110449 - BLOCK
      ?auto_110447 - BLOCK
      ?auto_110451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110444 ?auto_110445 ) ) ( not ( = ?auto_110444 ?auto_110448 ) ) ( not ( = ?auto_110445 ?auto_110448 ) ) ( ON ?auto_110444 ?auto_110450 ) ( not ( = ?auto_110444 ?auto_110450 ) ) ( not ( = ?auto_110445 ?auto_110450 ) ) ( not ( = ?auto_110448 ?auto_110450 ) ) ( ON-TABLE ?auto_110446 ) ( ON ?auto_110449 ?auto_110446 ) ( ON ?auto_110447 ?auto_110449 ) ( ON ?auto_110451 ?auto_110447 ) ( not ( = ?auto_110446 ?auto_110449 ) ) ( not ( = ?auto_110446 ?auto_110447 ) ) ( not ( = ?auto_110446 ?auto_110451 ) ) ( not ( = ?auto_110446 ?auto_110448 ) ) ( not ( = ?auto_110446 ?auto_110445 ) ) ( not ( = ?auto_110449 ?auto_110447 ) ) ( not ( = ?auto_110449 ?auto_110451 ) ) ( not ( = ?auto_110449 ?auto_110448 ) ) ( not ( = ?auto_110449 ?auto_110445 ) ) ( not ( = ?auto_110447 ?auto_110451 ) ) ( not ( = ?auto_110447 ?auto_110448 ) ) ( not ( = ?auto_110447 ?auto_110445 ) ) ( not ( = ?auto_110451 ?auto_110448 ) ) ( not ( = ?auto_110451 ?auto_110445 ) ) ( not ( = ?auto_110444 ?auto_110446 ) ) ( not ( = ?auto_110444 ?auto_110449 ) ) ( not ( = ?auto_110444 ?auto_110447 ) ) ( not ( = ?auto_110444 ?auto_110451 ) ) ( not ( = ?auto_110450 ?auto_110446 ) ) ( not ( = ?auto_110450 ?auto_110449 ) ) ( not ( = ?auto_110450 ?auto_110447 ) ) ( not ( = ?auto_110450 ?auto_110451 ) ) ( ON ?auto_110445 ?auto_110444 ) ( ON-TABLE ?auto_110450 ) ( CLEAR ?auto_110451 ) ( ON ?auto_110448 ?auto_110445 ) ( CLEAR ?auto_110448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110450 ?auto_110444 ?auto_110445 )
      ( MAKE-2PILE ?auto_110444 ?auto_110445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110452 - BLOCK
      ?auto_110453 - BLOCK
    )
    :vars
    (
      ?auto_110455 - BLOCK
      ?auto_110458 - BLOCK
      ?auto_110456 - BLOCK
      ?auto_110459 - BLOCK
      ?auto_110457 - BLOCK
      ?auto_110454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110452 ?auto_110453 ) ) ( not ( = ?auto_110452 ?auto_110455 ) ) ( not ( = ?auto_110453 ?auto_110455 ) ) ( ON ?auto_110452 ?auto_110458 ) ( not ( = ?auto_110452 ?auto_110458 ) ) ( not ( = ?auto_110453 ?auto_110458 ) ) ( not ( = ?auto_110455 ?auto_110458 ) ) ( ON-TABLE ?auto_110456 ) ( ON ?auto_110459 ?auto_110456 ) ( ON ?auto_110457 ?auto_110459 ) ( not ( = ?auto_110456 ?auto_110459 ) ) ( not ( = ?auto_110456 ?auto_110457 ) ) ( not ( = ?auto_110456 ?auto_110454 ) ) ( not ( = ?auto_110456 ?auto_110455 ) ) ( not ( = ?auto_110456 ?auto_110453 ) ) ( not ( = ?auto_110459 ?auto_110457 ) ) ( not ( = ?auto_110459 ?auto_110454 ) ) ( not ( = ?auto_110459 ?auto_110455 ) ) ( not ( = ?auto_110459 ?auto_110453 ) ) ( not ( = ?auto_110457 ?auto_110454 ) ) ( not ( = ?auto_110457 ?auto_110455 ) ) ( not ( = ?auto_110457 ?auto_110453 ) ) ( not ( = ?auto_110454 ?auto_110455 ) ) ( not ( = ?auto_110454 ?auto_110453 ) ) ( not ( = ?auto_110452 ?auto_110456 ) ) ( not ( = ?auto_110452 ?auto_110459 ) ) ( not ( = ?auto_110452 ?auto_110457 ) ) ( not ( = ?auto_110452 ?auto_110454 ) ) ( not ( = ?auto_110458 ?auto_110456 ) ) ( not ( = ?auto_110458 ?auto_110459 ) ) ( not ( = ?auto_110458 ?auto_110457 ) ) ( not ( = ?auto_110458 ?auto_110454 ) ) ( ON ?auto_110453 ?auto_110452 ) ( ON-TABLE ?auto_110458 ) ( ON ?auto_110455 ?auto_110453 ) ( CLEAR ?auto_110455 ) ( HOLDING ?auto_110454 ) ( CLEAR ?auto_110457 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110456 ?auto_110459 ?auto_110457 ?auto_110454 )
      ( MAKE-2PILE ?auto_110452 ?auto_110453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110460 - BLOCK
      ?auto_110461 - BLOCK
    )
    :vars
    (
      ?auto_110464 - BLOCK
      ?auto_110463 - BLOCK
      ?auto_110465 - BLOCK
      ?auto_110466 - BLOCK
      ?auto_110467 - BLOCK
      ?auto_110462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110460 ?auto_110461 ) ) ( not ( = ?auto_110460 ?auto_110464 ) ) ( not ( = ?auto_110461 ?auto_110464 ) ) ( ON ?auto_110460 ?auto_110463 ) ( not ( = ?auto_110460 ?auto_110463 ) ) ( not ( = ?auto_110461 ?auto_110463 ) ) ( not ( = ?auto_110464 ?auto_110463 ) ) ( ON-TABLE ?auto_110465 ) ( ON ?auto_110466 ?auto_110465 ) ( ON ?auto_110467 ?auto_110466 ) ( not ( = ?auto_110465 ?auto_110466 ) ) ( not ( = ?auto_110465 ?auto_110467 ) ) ( not ( = ?auto_110465 ?auto_110462 ) ) ( not ( = ?auto_110465 ?auto_110464 ) ) ( not ( = ?auto_110465 ?auto_110461 ) ) ( not ( = ?auto_110466 ?auto_110467 ) ) ( not ( = ?auto_110466 ?auto_110462 ) ) ( not ( = ?auto_110466 ?auto_110464 ) ) ( not ( = ?auto_110466 ?auto_110461 ) ) ( not ( = ?auto_110467 ?auto_110462 ) ) ( not ( = ?auto_110467 ?auto_110464 ) ) ( not ( = ?auto_110467 ?auto_110461 ) ) ( not ( = ?auto_110462 ?auto_110464 ) ) ( not ( = ?auto_110462 ?auto_110461 ) ) ( not ( = ?auto_110460 ?auto_110465 ) ) ( not ( = ?auto_110460 ?auto_110466 ) ) ( not ( = ?auto_110460 ?auto_110467 ) ) ( not ( = ?auto_110460 ?auto_110462 ) ) ( not ( = ?auto_110463 ?auto_110465 ) ) ( not ( = ?auto_110463 ?auto_110466 ) ) ( not ( = ?auto_110463 ?auto_110467 ) ) ( not ( = ?auto_110463 ?auto_110462 ) ) ( ON ?auto_110461 ?auto_110460 ) ( ON-TABLE ?auto_110463 ) ( ON ?auto_110464 ?auto_110461 ) ( CLEAR ?auto_110467 ) ( ON ?auto_110462 ?auto_110464 ) ( CLEAR ?auto_110462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110463 ?auto_110460 ?auto_110461 ?auto_110464 )
      ( MAKE-2PILE ?auto_110460 ?auto_110461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110468 - BLOCK
      ?auto_110469 - BLOCK
    )
    :vars
    (
      ?auto_110475 - BLOCK
      ?auto_110472 - BLOCK
      ?auto_110474 - BLOCK
      ?auto_110470 - BLOCK
      ?auto_110473 - BLOCK
      ?auto_110471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110468 ?auto_110469 ) ) ( not ( = ?auto_110468 ?auto_110475 ) ) ( not ( = ?auto_110469 ?auto_110475 ) ) ( ON ?auto_110468 ?auto_110472 ) ( not ( = ?auto_110468 ?auto_110472 ) ) ( not ( = ?auto_110469 ?auto_110472 ) ) ( not ( = ?auto_110475 ?auto_110472 ) ) ( ON-TABLE ?auto_110474 ) ( ON ?auto_110470 ?auto_110474 ) ( not ( = ?auto_110474 ?auto_110470 ) ) ( not ( = ?auto_110474 ?auto_110473 ) ) ( not ( = ?auto_110474 ?auto_110471 ) ) ( not ( = ?auto_110474 ?auto_110475 ) ) ( not ( = ?auto_110474 ?auto_110469 ) ) ( not ( = ?auto_110470 ?auto_110473 ) ) ( not ( = ?auto_110470 ?auto_110471 ) ) ( not ( = ?auto_110470 ?auto_110475 ) ) ( not ( = ?auto_110470 ?auto_110469 ) ) ( not ( = ?auto_110473 ?auto_110471 ) ) ( not ( = ?auto_110473 ?auto_110475 ) ) ( not ( = ?auto_110473 ?auto_110469 ) ) ( not ( = ?auto_110471 ?auto_110475 ) ) ( not ( = ?auto_110471 ?auto_110469 ) ) ( not ( = ?auto_110468 ?auto_110474 ) ) ( not ( = ?auto_110468 ?auto_110470 ) ) ( not ( = ?auto_110468 ?auto_110473 ) ) ( not ( = ?auto_110468 ?auto_110471 ) ) ( not ( = ?auto_110472 ?auto_110474 ) ) ( not ( = ?auto_110472 ?auto_110470 ) ) ( not ( = ?auto_110472 ?auto_110473 ) ) ( not ( = ?auto_110472 ?auto_110471 ) ) ( ON ?auto_110469 ?auto_110468 ) ( ON-TABLE ?auto_110472 ) ( ON ?auto_110475 ?auto_110469 ) ( ON ?auto_110471 ?auto_110475 ) ( CLEAR ?auto_110471 ) ( HOLDING ?auto_110473 ) ( CLEAR ?auto_110470 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110474 ?auto_110470 ?auto_110473 )
      ( MAKE-2PILE ?auto_110468 ?auto_110469 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110476 - BLOCK
      ?auto_110477 - BLOCK
    )
    :vars
    (
      ?auto_110478 - BLOCK
      ?auto_110479 - BLOCK
      ?auto_110480 - BLOCK
      ?auto_110481 - BLOCK
      ?auto_110482 - BLOCK
      ?auto_110483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110476 ?auto_110477 ) ) ( not ( = ?auto_110476 ?auto_110478 ) ) ( not ( = ?auto_110477 ?auto_110478 ) ) ( ON ?auto_110476 ?auto_110479 ) ( not ( = ?auto_110476 ?auto_110479 ) ) ( not ( = ?auto_110477 ?auto_110479 ) ) ( not ( = ?auto_110478 ?auto_110479 ) ) ( ON-TABLE ?auto_110480 ) ( ON ?auto_110481 ?auto_110480 ) ( not ( = ?auto_110480 ?auto_110481 ) ) ( not ( = ?auto_110480 ?auto_110482 ) ) ( not ( = ?auto_110480 ?auto_110483 ) ) ( not ( = ?auto_110480 ?auto_110478 ) ) ( not ( = ?auto_110480 ?auto_110477 ) ) ( not ( = ?auto_110481 ?auto_110482 ) ) ( not ( = ?auto_110481 ?auto_110483 ) ) ( not ( = ?auto_110481 ?auto_110478 ) ) ( not ( = ?auto_110481 ?auto_110477 ) ) ( not ( = ?auto_110482 ?auto_110483 ) ) ( not ( = ?auto_110482 ?auto_110478 ) ) ( not ( = ?auto_110482 ?auto_110477 ) ) ( not ( = ?auto_110483 ?auto_110478 ) ) ( not ( = ?auto_110483 ?auto_110477 ) ) ( not ( = ?auto_110476 ?auto_110480 ) ) ( not ( = ?auto_110476 ?auto_110481 ) ) ( not ( = ?auto_110476 ?auto_110482 ) ) ( not ( = ?auto_110476 ?auto_110483 ) ) ( not ( = ?auto_110479 ?auto_110480 ) ) ( not ( = ?auto_110479 ?auto_110481 ) ) ( not ( = ?auto_110479 ?auto_110482 ) ) ( not ( = ?auto_110479 ?auto_110483 ) ) ( ON ?auto_110477 ?auto_110476 ) ( ON-TABLE ?auto_110479 ) ( ON ?auto_110478 ?auto_110477 ) ( ON ?auto_110483 ?auto_110478 ) ( CLEAR ?auto_110481 ) ( ON ?auto_110482 ?auto_110483 ) ( CLEAR ?auto_110482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110479 ?auto_110476 ?auto_110477 ?auto_110478 ?auto_110483 )
      ( MAKE-2PILE ?auto_110476 ?auto_110477 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110484 - BLOCK
      ?auto_110485 - BLOCK
    )
    :vars
    (
      ?auto_110487 - BLOCK
      ?auto_110486 - BLOCK
      ?auto_110490 - BLOCK
      ?auto_110489 - BLOCK
      ?auto_110488 - BLOCK
      ?auto_110491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110484 ?auto_110485 ) ) ( not ( = ?auto_110484 ?auto_110487 ) ) ( not ( = ?auto_110485 ?auto_110487 ) ) ( ON ?auto_110484 ?auto_110486 ) ( not ( = ?auto_110484 ?auto_110486 ) ) ( not ( = ?auto_110485 ?auto_110486 ) ) ( not ( = ?auto_110487 ?auto_110486 ) ) ( ON-TABLE ?auto_110490 ) ( not ( = ?auto_110490 ?auto_110489 ) ) ( not ( = ?auto_110490 ?auto_110488 ) ) ( not ( = ?auto_110490 ?auto_110491 ) ) ( not ( = ?auto_110490 ?auto_110487 ) ) ( not ( = ?auto_110490 ?auto_110485 ) ) ( not ( = ?auto_110489 ?auto_110488 ) ) ( not ( = ?auto_110489 ?auto_110491 ) ) ( not ( = ?auto_110489 ?auto_110487 ) ) ( not ( = ?auto_110489 ?auto_110485 ) ) ( not ( = ?auto_110488 ?auto_110491 ) ) ( not ( = ?auto_110488 ?auto_110487 ) ) ( not ( = ?auto_110488 ?auto_110485 ) ) ( not ( = ?auto_110491 ?auto_110487 ) ) ( not ( = ?auto_110491 ?auto_110485 ) ) ( not ( = ?auto_110484 ?auto_110490 ) ) ( not ( = ?auto_110484 ?auto_110489 ) ) ( not ( = ?auto_110484 ?auto_110488 ) ) ( not ( = ?auto_110484 ?auto_110491 ) ) ( not ( = ?auto_110486 ?auto_110490 ) ) ( not ( = ?auto_110486 ?auto_110489 ) ) ( not ( = ?auto_110486 ?auto_110488 ) ) ( not ( = ?auto_110486 ?auto_110491 ) ) ( ON ?auto_110485 ?auto_110484 ) ( ON-TABLE ?auto_110486 ) ( ON ?auto_110487 ?auto_110485 ) ( ON ?auto_110491 ?auto_110487 ) ( ON ?auto_110488 ?auto_110491 ) ( CLEAR ?auto_110488 ) ( HOLDING ?auto_110489 ) ( CLEAR ?auto_110490 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110490 ?auto_110489 )
      ( MAKE-2PILE ?auto_110484 ?auto_110485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110492 - BLOCK
      ?auto_110493 - BLOCK
    )
    :vars
    (
      ?auto_110499 - BLOCK
      ?auto_110497 - BLOCK
      ?auto_110498 - BLOCK
      ?auto_110496 - BLOCK
      ?auto_110495 - BLOCK
      ?auto_110494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110492 ?auto_110493 ) ) ( not ( = ?auto_110492 ?auto_110499 ) ) ( not ( = ?auto_110493 ?auto_110499 ) ) ( ON ?auto_110492 ?auto_110497 ) ( not ( = ?auto_110492 ?auto_110497 ) ) ( not ( = ?auto_110493 ?auto_110497 ) ) ( not ( = ?auto_110499 ?auto_110497 ) ) ( ON-TABLE ?auto_110498 ) ( not ( = ?auto_110498 ?auto_110496 ) ) ( not ( = ?auto_110498 ?auto_110495 ) ) ( not ( = ?auto_110498 ?auto_110494 ) ) ( not ( = ?auto_110498 ?auto_110499 ) ) ( not ( = ?auto_110498 ?auto_110493 ) ) ( not ( = ?auto_110496 ?auto_110495 ) ) ( not ( = ?auto_110496 ?auto_110494 ) ) ( not ( = ?auto_110496 ?auto_110499 ) ) ( not ( = ?auto_110496 ?auto_110493 ) ) ( not ( = ?auto_110495 ?auto_110494 ) ) ( not ( = ?auto_110495 ?auto_110499 ) ) ( not ( = ?auto_110495 ?auto_110493 ) ) ( not ( = ?auto_110494 ?auto_110499 ) ) ( not ( = ?auto_110494 ?auto_110493 ) ) ( not ( = ?auto_110492 ?auto_110498 ) ) ( not ( = ?auto_110492 ?auto_110496 ) ) ( not ( = ?auto_110492 ?auto_110495 ) ) ( not ( = ?auto_110492 ?auto_110494 ) ) ( not ( = ?auto_110497 ?auto_110498 ) ) ( not ( = ?auto_110497 ?auto_110496 ) ) ( not ( = ?auto_110497 ?auto_110495 ) ) ( not ( = ?auto_110497 ?auto_110494 ) ) ( ON ?auto_110493 ?auto_110492 ) ( ON-TABLE ?auto_110497 ) ( ON ?auto_110499 ?auto_110493 ) ( ON ?auto_110494 ?auto_110499 ) ( ON ?auto_110495 ?auto_110494 ) ( CLEAR ?auto_110498 ) ( ON ?auto_110496 ?auto_110495 ) ( CLEAR ?auto_110496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110497 ?auto_110492 ?auto_110493 ?auto_110499 ?auto_110494 ?auto_110495 )
      ( MAKE-2PILE ?auto_110492 ?auto_110493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110500 - BLOCK
      ?auto_110501 - BLOCK
    )
    :vars
    (
      ?auto_110507 - BLOCK
      ?auto_110502 - BLOCK
      ?auto_110504 - BLOCK
      ?auto_110503 - BLOCK
      ?auto_110506 - BLOCK
      ?auto_110505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110500 ?auto_110501 ) ) ( not ( = ?auto_110500 ?auto_110507 ) ) ( not ( = ?auto_110501 ?auto_110507 ) ) ( ON ?auto_110500 ?auto_110502 ) ( not ( = ?auto_110500 ?auto_110502 ) ) ( not ( = ?auto_110501 ?auto_110502 ) ) ( not ( = ?auto_110507 ?auto_110502 ) ) ( not ( = ?auto_110504 ?auto_110503 ) ) ( not ( = ?auto_110504 ?auto_110506 ) ) ( not ( = ?auto_110504 ?auto_110505 ) ) ( not ( = ?auto_110504 ?auto_110507 ) ) ( not ( = ?auto_110504 ?auto_110501 ) ) ( not ( = ?auto_110503 ?auto_110506 ) ) ( not ( = ?auto_110503 ?auto_110505 ) ) ( not ( = ?auto_110503 ?auto_110507 ) ) ( not ( = ?auto_110503 ?auto_110501 ) ) ( not ( = ?auto_110506 ?auto_110505 ) ) ( not ( = ?auto_110506 ?auto_110507 ) ) ( not ( = ?auto_110506 ?auto_110501 ) ) ( not ( = ?auto_110505 ?auto_110507 ) ) ( not ( = ?auto_110505 ?auto_110501 ) ) ( not ( = ?auto_110500 ?auto_110504 ) ) ( not ( = ?auto_110500 ?auto_110503 ) ) ( not ( = ?auto_110500 ?auto_110506 ) ) ( not ( = ?auto_110500 ?auto_110505 ) ) ( not ( = ?auto_110502 ?auto_110504 ) ) ( not ( = ?auto_110502 ?auto_110503 ) ) ( not ( = ?auto_110502 ?auto_110506 ) ) ( not ( = ?auto_110502 ?auto_110505 ) ) ( ON ?auto_110501 ?auto_110500 ) ( ON-TABLE ?auto_110502 ) ( ON ?auto_110507 ?auto_110501 ) ( ON ?auto_110505 ?auto_110507 ) ( ON ?auto_110506 ?auto_110505 ) ( ON ?auto_110503 ?auto_110506 ) ( CLEAR ?auto_110503 ) ( HOLDING ?auto_110504 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110504 )
      ( MAKE-2PILE ?auto_110500 ?auto_110501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_110508 - BLOCK
      ?auto_110509 - BLOCK
    )
    :vars
    (
      ?auto_110512 - BLOCK
      ?auto_110511 - BLOCK
      ?auto_110513 - BLOCK
      ?auto_110510 - BLOCK
      ?auto_110514 - BLOCK
      ?auto_110515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110508 ?auto_110509 ) ) ( not ( = ?auto_110508 ?auto_110512 ) ) ( not ( = ?auto_110509 ?auto_110512 ) ) ( ON ?auto_110508 ?auto_110511 ) ( not ( = ?auto_110508 ?auto_110511 ) ) ( not ( = ?auto_110509 ?auto_110511 ) ) ( not ( = ?auto_110512 ?auto_110511 ) ) ( not ( = ?auto_110513 ?auto_110510 ) ) ( not ( = ?auto_110513 ?auto_110514 ) ) ( not ( = ?auto_110513 ?auto_110515 ) ) ( not ( = ?auto_110513 ?auto_110512 ) ) ( not ( = ?auto_110513 ?auto_110509 ) ) ( not ( = ?auto_110510 ?auto_110514 ) ) ( not ( = ?auto_110510 ?auto_110515 ) ) ( not ( = ?auto_110510 ?auto_110512 ) ) ( not ( = ?auto_110510 ?auto_110509 ) ) ( not ( = ?auto_110514 ?auto_110515 ) ) ( not ( = ?auto_110514 ?auto_110512 ) ) ( not ( = ?auto_110514 ?auto_110509 ) ) ( not ( = ?auto_110515 ?auto_110512 ) ) ( not ( = ?auto_110515 ?auto_110509 ) ) ( not ( = ?auto_110508 ?auto_110513 ) ) ( not ( = ?auto_110508 ?auto_110510 ) ) ( not ( = ?auto_110508 ?auto_110514 ) ) ( not ( = ?auto_110508 ?auto_110515 ) ) ( not ( = ?auto_110511 ?auto_110513 ) ) ( not ( = ?auto_110511 ?auto_110510 ) ) ( not ( = ?auto_110511 ?auto_110514 ) ) ( not ( = ?auto_110511 ?auto_110515 ) ) ( ON ?auto_110509 ?auto_110508 ) ( ON-TABLE ?auto_110511 ) ( ON ?auto_110512 ?auto_110509 ) ( ON ?auto_110515 ?auto_110512 ) ( ON ?auto_110514 ?auto_110515 ) ( ON ?auto_110510 ?auto_110514 ) ( ON ?auto_110513 ?auto_110510 ) ( CLEAR ?auto_110513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110511 ?auto_110508 ?auto_110509 ?auto_110512 ?auto_110515 ?auto_110514 ?auto_110510 )
      ( MAKE-2PILE ?auto_110508 ?auto_110509 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110539 - BLOCK
      ?auto_110540 - BLOCK
      ?auto_110541 - BLOCK
      ?auto_110542 - BLOCK
    )
    :vars
    (
      ?auto_110544 - BLOCK
      ?auto_110543 - BLOCK
      ?auto_110545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110544 ?auto_110542 ) ( ON-TABLE ?auto_110539 ) ( ON ?auto_110540 ?auto_110539 ) ( ON ?auto_110541 ?auto_110540 ) ( ON ?auto_110542 ?auto_110541 ) ( not ( = ?auto_110539 ?auto_110540 ) ) ( not ( = ?auto_110539 ?auto_110541 ) ) ( not ( = ?auto_110539 ?auto_110542 ) ) ( not ( = ?auto_110539 ?auto_110544 ) ) ( not ( = ?auto_110540 ?auto_110541 ) ) ( not ( = ?auto_110540 ?auto_110542 ) ) ( not ( = ?auto_110540 ?auto_110544 ) ) ( not ( = ?auto_110541 ?auto_110542 ) ) ( not ( = ?auto_110541 ?auto_110544 ) ) ( not ( = ?auto_110542 ?auto_110544 ) ) ( not ( = ?auto_110539 ?auto_110543 ) ) ( not ( = ?auto_110539 ?auto_110545 ) ) ( not ( = ?auto_110540 ?auto_110543 ) ) ( not ( = ?auto_110540 ?auto_110545 ) ) ( not ( = ?auto_110541 ?auto_110543 ) ) ( not ( = ?auto_110541 ?auto_110545 ) ) ( not ( = ?auto_110542 ?auto_110543 ) ) ( not ( = ?auto_110542 ?auto_110545 ) ) ( not ( = ?auto_110544 ?auto_110543 ) ) ( not ( = ?auto_110544 ?auto_110545 ) ) ( not ( = ?auto_110543 ?auto_110545 ) ) ( ON ?auto_110543 ?auto_110544 ) ( CLEAR ?auto_110543 ) ( HOLDING ?auto_110545 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110545 )
      ( MAKE-4PILE ?auto_110539 ?auto_110540 ?auto_110541 ?auto_110542 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110626 - BLOCK
      ?auto_110627 - BLOCK
      ?auto_110628 - BLOCK
    )
    :vars
    (
      ?auto_110629 - BLOCK
      ?auto_110631 - BLOCK
      ?auto_110630 - BLOCK
      ?auto_110632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110626 ) ( not ( = ?auto_110626 ?auto_110627 ) ) ( not ( = ?auto_110626 ?auto_110628 ) ) ( not ( = ?auto_110627 ?auto_110628 ) ) ( ON ?auto_110628 ?auto_110629 ) ( not ( = ?auto_110626 ?auto_110629 ) ) ( not ( = ?auto_110627 ?auto_110629 ) ) ( not ( = ?auto_110628 ?auto_110629 ) ) ( CLEAR ?auto_110626 ) ( ON ?auto_110627 ?auto_110628 ) ( CLEAR ?auto_110627 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110631 ) ( ON ?auto_110630 ?auto_110631 ) ( ON ?auto_110632 ?auto_110630 ) ( ON ?auto_110629 ?auto_110632 ) ( not ( = ?auto_110631 ?auto_110630 ) ) ( not ( = ?auto_110631 ?auto_110632 ) ) ( not ( = ?auto_110631 ?auto_110629 ) ) ( not ( = ?auto_110631 ?auto_110628 ) ) ( not ( = ?auto_110631 ?auto_110627 ) ) ( not ( = ?auto_110630 ?auto_110632 ) ) ( not ( = ?auto_110630 ?auto_110629 ) ) ( not ( = ?auto_110630 ?auto_110628 ) ) ( not ( = ?auto_110630 ?auto_110627 ) ) ( not ( = ?auto_110632 ?auto_110629 ) ) ( not ( = ?auto_110632 ?auto_110628 ) ) ( not ( = ?auto_110632 ?auto_110627 ) ) ( not ( = ?auto_110626 ?auto_110631 ) ) ( not ( = ?auto_110626 ?auto_110630 ) ) ( not ( = ?auto_110626 ?auto_110632 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110631 ?auto_110630 ?auto_110632 ?auto_110629 ?auto_110628 )
      ( MAKE-3PILE ?auto_110626 ?auto_110627 ?auto_110628 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110633 - BLOCK
      ?auto_110634 - BLOCK
      ?auto_110635 - BLOCK
    )
    :vars
    (
      ?auto_110637 - BLOCK
      ?auto_110638 - BLOCK
      ?auto_110639 - BLOCK
      ?auto_110636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110633 ?auto_110634 ) ) ( not ( = ?auto_110633 ?auto_110635 ) ) ( not ( = ?auto_110634 ?auto_110635 ) ) ( ON ?auto_110635 ?auto_110637 ) ( not ( = ?auto_110633 ?auto_110637 ) ) ( not ( = ?auto_110634 ?auto_110637 ) ) ( not ( = ?auto_110635 ?auto_110637 ) ) ( ON ?auto_110634 ?auto_110635 ) ( CLEAR ?auto_110634 ) ( ON-TABLE ?auto_110638 ) ( ON ?auto_110639 ?auto_110638 ) ( ON ?auto_110636 ?auto_110639 ) ( ON ?auto_110637 ?auto_110636 ) ( not ( = ?auto_110638 ?auto_110639 ) ) ( not ( = ?auto_110638 ?auto_110636 ) ) ( not ( = ?auto_110638 ?auto_110637 ) ) ( not ( = ?auto_110638 ?auto_110635 ) ) ( not ( = ?auto_110638 ?auto_110634 ) ) ( not ( = ?auto_110639 ?auto_110636 ) ) ( not ( = ?auto_110639 ?auto_110637 ) ) ( not ( = ?auto_110639 ?auto_110635 ) ) ( not ( = ?auto_110639 ?auto_110634 ) ) ( not ( = ?auto_110636 ?auto_110637 ) ) ( not ( = ?auto_110636 ?auto_110635 ) ) ( not ( = ?auto_110636 ?auto_110634 ) ) ( not ( = ?auto_110633 ?auto_110638 ) ) ( not ( = ?auto_110633 ?auto_110639 ) ) ( not ( = ?auto_110633 ?auto_110636 ) ) ( HOLDING ?auto_110633 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110633 )
      ( MAKE-3PILE ?auto_110633 ?auto_110634 ?auto_110635 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110640 - BLOCK
      ?auto_110641 - BLOCK
      ?auto_110642 - BLOCK
    )
    :vars
    (
      ?auto_110643 - BLOCK
      ?auto_110645 - BLOCK
      ?auto_110644 - BLOCK
      ?auto_110646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110640 ?auto_110641 ) ) ( not ( = ?auto_110640 ?auto_110642 ) ) ( not ( = ?auto_110641 ?auto_110642 ) ) ( ON ?auto_110642 ?auto_110643 ) ( not ( = ?auto_110640 ?auto_110643 ) ) ( not ( = ?auto_110641 ?auto_110643 ) ) ( not ( = ?auto_110642 ?auto_110643 ) ) ( ON ?auto_110641 ?auto_110642 ) ( ON-TABLE ?auto_110645 ) ( ON ?auto_110644 ?auto_110645 ) ( ON ?auto_110646 ?auto_110644 ) ( ON ?auto_110643 ?auto_110646 ) ( not ( = ?auto_110645 ?auto_110644 ) ) ( not ( = ?auto_110645 ?auto_110646 ) ) ( not ( = ?auto_110645 ?auto_110643 ) ) ( not ( = ?auto_110645 ?auto_110642 ) ) ( not ( = ?auto_110645 ?auto_110641 ) ) ( not ( = ?auto_110644 ?auto_110646 ) ) ( not ( = ?auto_110644 ?auto_110643 ) ) ( not ( = ?auto_110644 ?auto_110642 ) ) ( not ( = ?auto_110644 ?auto_110641 ) ) ( not ( = ?auto_110646 ?auto_110643 ) ) ( not ( = ?auto_110646 ?auto_110642 ) ) ( not ( = ?auto_110646 ?auto_110641 ) ) ( not ( = ?auto_110640 ?auto_110645 ) ) ( not ( = ?auto_110640 ?auto_110644 ) ) ( not ( = ?auto_110640 ?auto_110646 ) ) ( ON ?auto_110640 ?auto_110641 ) ( CLEAR ?auto_110640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110645 ?auto_110644 ?auto_110646 ?auto_110643 ?auto_110642 ?auto_110641 )
      ( MAKE-3PILE ?auto_110640 ?auto_110641 ?auto_110642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110650 - BLOCK
      ?auto_110651 - BLOCK
      ?auto_110652 - BLOCK
    )
    :vars
    (
      ?auto_110653 - BLOCK
      ?auto_110655 - BLOCK
      ?auto_110656 - BLOCK
      ?auto_110654 - BLOCK
      ?auto_110657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110650 ?auto_110651 ) ) ( not ( = ?auto_110650 ?auto_110652 ) ) ( not ( = ?auto_110651 ?auto_110652 ) ) ( ON ?auto_110652 ?auto_110653 ) ( not ( = ?auto_110650 ?auto_110653 ) ) ( not ( = ?auto_110651 ?auto_110653 ) ) ( not ( = ?auto_110652 ?auto_110653 ) ) ( ON ?auto_110651 ?auto_110652 ) ( CLEAR ?auto_110651 ) ( ON-TABLE ?auto_110655 ) ( ON ?auto_110656 ?auto_110655 ) ( ON ?auto_110654 ?auto_110656 ) ( ON ?auto_110653 ?auto_110654 ) ( not ( = ?auto_110655 ?auto_110656 ) ) ( not ( = ?auto_110655 ?auto_110654 ) ) ( not ( = ?auto_110655 ?auto_110653 ) ) ( not ( = ?auto_110655 ?auto_110652 ) ) ( not ( = ?auto_110655 ?auto_110651 ) ) ( not ( = ?auto_110656 ?auto_110654 ) ) ( not ( = ?auto_110656 ?auto_110653 ) ) ( not ( = ?auto_110656 ?auto_110652 ) ) ( not ( = ?auto_110656 ?auto_110651 ) ) ( not ( = ?auto_110654 ?auto_110653 ) ) ( not ( = ?auto_110654 ?auto_110652 ) ) ( not ( = ?auto_110654 ?auto_110651 ) ) ( not ( = ?auto_110650 ?auto_110655 ) ) ( not ( = ?auto_110650 ?auto_110656 ) ) ( not ( = ?auto_110650 ?auto_110654 ) ) ( ON ?auto_110650 ?auto_110657 ) ( CLEAR ?auto_110650 ) ( HAND-EMPTY ) ( not ( = ?auto_110650 ?auto_110657 ) ) ( not ( = ?auto_110651 ?auto_110657 ) ) ( not ( = ?auto_110652 ?auto_110657 ) ) ( not ( = ?auto_110653 ?auto_110657 ) ) ( not ( = ?auto_110655 ?auto_110657 ) ) ( not ( = ?auto_110656 ?auto_110657 ) ) ( not ( = ?auto_110654 ?auto_110657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110650 ?auto_110657 )
      ( MAKE-3PILE ?auto_110650 ?auto_110651 ?auto_110652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110658 - BLOCK
      ?auto_110659 - BLOCK
      ?auto_110660 - BLOCK
    )
    :vars
    (
      ?auto_110662 - BLOCK
      ?auto_110661 - BLOCK
      ?auto_110664 - BLOCK
      ?auto_110665 - BLOCK
      ?auto_110663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110658 ?auto_110659 ) ) ( not ( = ?auto_110658 ?auto_110660 ) ) ( not ( = ?auto_110659 ?auto_110660 ) ) ( ON ?auto_110660 ?auto_110662 ) ( not ( = ?auto_110658 ?auto_110662 ) ) ( not ( = ?auto_110659 ?auto_110662 ) ) ( not ( = ?auto_110660 ?auto_110662 ) ) ( ON-TABLE ?auto_110661 ) ( ON ?auto_110664 ?auto_110661 ) ( ON ?auto_110665 ?auto_110664 ) ( ON ?auto_110662 ?auto_110665 ) ( not ( = ?auto_110661 ?auto_110664 ) ) ( not ( = ?auto_110661 ?auto_110665 ) ) ( not ( = ?auto_110661 ?auto_110662 ) ) ( not ( = ?auto_110661 ?auto_110660 ) ) ( not ( = ?auto_110661 ?auto_110659 ) ) ( not ( = ?auto_110664 ?auto_110665 ) ) ( not ( = ?auto_110664 ?auto_110662 ) ) ( not ( = ?auto_110664 ?auto_110660 ) ) ( not ( = ?auto_110664 ?auto_110659 ) ) ( not ( = ?auto_110665 ?auto_110662 ) ) ( not ( = ?auto_110665 ?auto_110660 ) ) ( not ( = ?auto_110665 ?auto_110659 ) ) ( not ( = ?auto_110658 ?auto_110661 ) ) ( not ( = ?auto_110658 ?auto_110664 ) ) ( not ( = ?auto_110658 ?auto_110665 ) ) ( ON ?auto_110658 ?auto_110663 ) ( CLEAR ?auto_110658 ) ( not ( = ?auto_110658 ?auto_110663 ) ) ( not ( = ?auto_110659 ?auto_110663 ) ) ( not ( = ?auto_110660 ?auto_110663 ) ) ( not ( = ?auto_110662 ?auto_110663 ) ) ( not ( = ?auto_110661 ?auto_110663 ) ) ( not ( = ?auto_110664 ?auto_110663 ) ) ( not ( = ?auto_110665 ?auto_110663 ) ) ( HOLDING ?auto_110659 ) ( CLEAR ?auto_110660 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110661 ?auto_110664 ?auto_110665 ?auto_110662 ?auto_110660 ?auto_110659 )
      ( MAKE-3PILE ?auto_110658 ?auto_110659 ?auto_110660 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110666 - BLOCK
      ?auto_110667 - BLOCK
      ?auto_110668 - BLOCK
    )
    :vars
    (
      ?auto_110669 - BLOCK
      ?auto_110673 - BLOCK
      ?auto_110672 - BLOCK
      ?auto_110670 - BLOCK
      ?auto_110671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110666 ?auto_110667 ) ) ( not ( = ?auto_110666 ?auto_110668 ) ) ( not ( = ?auto_110667 ?auto_110668 ) ) ( ON ?auto_110668 ?auto_110669 ) ( not ( = ?auto_110666 ?auto_110669 ) ) ( not ( = ?auto_110667 ?auto_110669 ) ) ( not ( = ?auto_110668 ?auto_110669 ) ) ( ON-TABLE ?auto_110673 ) ( ON ?auto_110672 ?auto_110673 ) ( ON ?auto_110670 ?auto_110672 ) ( ON ?auto_110669 ?auto_110670 ) ( not ( = ?auto_110673 ?auto_110672 ) ) ( not ( = ?auto_110673 ?auto_110670 ) ) ( not ( = ?auto_110673 ?auto_110669 ) ) ( not ( = ?auto_110673 ?auto_110668 ) ) ( not ( = ?auto_110673 ?auto_110667 ) ) ( not ( = ?auto_110672 ?auto_110670 ) ) ( not ( = ?auto_110672 ?auto_110669 ) ) ( not ( = ?auto_110672 ?auto_110668 ) ) ( not ( = ?auto_110672 ?auto_110667 ) ) ( not ( = ?auto_110670 ?auto_110669 ) ) ( not ( = ?auto_110670 ?auto_110668 ) ) ( not ( = ?auto_110670 ?auto_110667 ) ) ( not ( = ?auto_110666 ?auto_110673 ) ) ( not ( = ?auto_110666 ?auto_110672 ) ) ( not ( = ?auto_110666 ?auto_110670 ) ) ( ON ?auto_110666 ?auto_110671 ) ( not ( = ?auto_110666 ?auto_110671 ) ) ( not ( = ?auto_110667 ?auto_110671 ) ) ( not ( = ?auto_110668 ?auto_110671 ) ) ( not ( = ?auto_110669 ?auto_110671 ) ) ( not ( = ?auto_110673 ?auto_110671 ) ) ( not ( = ?auto_110672 ?auto_110671 ) ) ( not ( = ?auto_110670 ?auto_110671 ) ) ( CLEAR ?auto_110668 ) ( ON ?auto_110667 ?auto_110666 ) ( CLEAR ?auto_110667 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110671 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110671 ?auto_110666 )
      ( MAKE-3PILE ?auto_110666 ?auto_110667 ?auto_110668 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110674 - BLOCK
      ?auto_110675 - BLOCK
      ?auto_110676 - BLOCK
    )
    :vars
    (
      ?auto_110681 - BLOCK
      ?auto_110679 - BLOCK
      ?auto_110677 - BLOCK
      ?auto_110680 - BLOCK
      ?auto_110678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110674 ?auto_110675 ) ) ( not ( = ?auto_110674 ?auto_110676 ) ) ( not ( = ?auto_110675 ?auto_110676 ) ) ( not ( = ?auto_110674 ?auto_110681 ) ) ( not ( = ?auto_110675 ?auto_110681 ) ) ( not ( = ?auto_110676 ?auto_110681 ) ) ( ON-TABLE ?auto_110679 ) ( ON ?auto_110677 ?auto_110679 ) ( ON ?auto_110680 ?auto_110677 ) ( ON ?auto_110681 ?auto_110680 ) ( not ( = ?auto_110679 ?auto_110677 ) ) ( not ( = ?auto_110679 ?auto_110680 ) ) ( not ( = ?auto_110679 ?auto_110681 ) ) ( not ( = ?auto_110679 ?auto_110676 ) ) ( not ( = ?auto_110679 ?auto_110675 ) ) ( not ( = ?auto_110677 ?auto_110680 ) ) ( not ( = ?auto_110677 ?auto_110681 ) ) ( not ( = ?auto_110677 ?auto_110676 ) ) ( not ( = ?auto_110677 ?auto_110675 ) ) ( not ( = ?auto_110680 ?auto_110681 ) ) ( not ( = ?auto_110680 ?auto_110676 ) ) ( not ( = ?auto_110680 ?auto_110675 ) ) ( not ( = ?auto_110674 ?auto_110679 ) ) ( not ( = ?auto_110674 ?auto_110677 ) ) ( not ( = ?auto_110674 ?auto_110680 ) ) ( ON ?auto_110674 ?auto_110678 ) ( not ( = ?auto_110674 ?auto_110678 ) ) ( not ( = ?auto_110675 ?auto_110678 ) ) ( not ( = ?auto_110676 ?auto_110678 ) ) ( not ( = ?auto_110681 ?auto_110678 ) ) ( not ( = ?auto_110679 ?auto_110678 ) ) ( not ( = ?auto_110677 ?auto_110678 ) ) ( not ( = ?auto_110680 ?auto_110678 ) ) ( ON ?auto_110675 ?auto_110674 ) ( CLEAR ?auto_110675 ) ( ON-TABLE ?auto_110678 ) ( HOLDING ?auto_110676 ) ( CLEAR ?auto_110681 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110679 ?auto_110677 ?auto_110680 ?auto_110681 ?auto_110676 )
      ( MAKE-3PILE ?auto_110674 ?auto_110675 ?auto_110676 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110682 - BLOCK
      ?auto_110683 - BLOCK
      ?auto_110684 - BLOCK
    )
    :vars
    (
      ?auto_110688 - BLOCK
      ?auto_110689 - BLOCK
      ?auto_110685 - BLOCK
      ?auto_110686 - BLOCK
      ?auto_110687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110682 ?auto_110683 ) ) ( not ( = ?auto_110682 ?auto_110684 ) ) ( not ( = ?auto_110683 ?auto_110684 ) ) ( not ( = ?auto_110682 ?auto_110688 ) ) ( not ( = ?auto_110683 ?auto_110688 ) ) ( not ( = ?auto_110684 ?auto_110688 ) ) ( ON-TABLE ?auto_110689 ) ( ON ?auto_110685 ?auto_110689 ) ( ON ?auto_110686 ?auto_110685 ) ( ON ?auto_110688 ?auto_110686 ) ( not ( = ?auto_110689 ?auto_110685 ) ) ( not ( = ?auto_110689 ?auto_110686 ) ) ( not ( = ?auto_110689 ?auto_110688 ) ) ( not ( = ?auto_110689 ?auto_110684 ) ) ( not ( = ?auto_110689 ?auto_110683 ) ) ( not ( = ?auto_110685 ?auto_110686 ) ) ( not ( = ?auto_110685 ?auto_110688 ) ) ( not ( = ?auto_110685 ?auto_110684 ) ) ( not ( = ?auto_110685 ?auto_110683 ) ) ( not ( = ?auto_110686 ?auto_110688 ) ) ( not ( = ?auto_110686 ?auto_110684 ) ) ( not ( = ?auto_110686 ?auto_110683 ) ) ( not ( = ?auto_110682 ?auto_110689 ) ) ( not ( = ?auto_110682 ?auto_110685 ) ) ( not ( = ?auto_110682 ?auto_110686 ) ) ( ON ?auto_110682 ?auto_110687 ) ( not ( = ?auto_110682 ?auto_110687 ) ) ( not ( = ?auto_110683 ?auto_110687 ) ) ( not ( = ?auto_110684 ?auto_110687 ) ) ( not ( = ?auto_110688 ?auto_110687 ) ) ( not ( = ?auto_110689 ?auto_110687 ) ) ( not ( = ?auto_110685 ?auto_110687 ) ) ( not ( = ?auto_110686 ?auto_110687 ) ) ( ON ?auto_110683 ?auto_110682 ) ( ON-TABLE ?auto_110687 ) ( CLEAR ?auto_110688 ) ( ON ?auto_110684 ?auto_110683 ) ( CLEAR ?auto_110684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110687 ?auto_110682 ?auto_110683 )
      ( MAKE-3PILE ?auto_110682 ?auto_110683 ?auto_110684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110690 - BLOCK
      ?auto_110691 - BLOCK
      ?auto_110692 - BLOCK
    )
    :vars
    (
      ?auto_110695 - BLOCK
      ?auto_110697 - BLOCK
      ?auto_110694 - BLOCK
      ?auto_110693 - BLOCK
      ?auto_110696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110690 ?auto_110691 ) ) ( not ( = ?auto_110690 ?auto_110692 ) ) ( not ( = ?auto_110691 ?auto_110692 ) ) ( not ( = ?auto_110690 ?auto_110695 ) ) ( not ( = ?auto_110691 ?auto_110695 ) ) ( not ( = ?auto_110692 ?auto_110695 ) ) ( ON-TABLE ?auto_110697 ) ( ON ?auto_110694 ?auto_110697 ) ( ON ?auto_110693 ?auto_110694 ) ( not ( = ?auto_110697 ?auto_110694 ) ) ( not ( = ?auto_110697 ?auto_110693 ) ) ( not ( = ?auto_110697 ?auto_110695 ) ) ( not ( = ?auto_110697 ?auto_110692 ) ) ( not ( = ?auto_110697 ?auto_110691 ) ) ( not ( = ?auto_110694 ?auto_110693 ) ) ( not ( = ?auto_110694 ?auto_110695 ) ) ( not ( = ?auto_110694 ?auto_110692 ) ) ( not ( = ?auto_110694 ?auto_110691 ) ) ( not ( = ?auto_110693 ?auto_110695 ) ) ( not ( = ?auto_110693 ?auto_110692 ) ) ( not ( = ?auto_110693 ?auto_110691 ) ) ( not ( = ?auto_110690 ?auto_110697 ) ) ( not ( = ?auto_110690 ?auto_110694 ) ) ( not ( = ?auto_110690 ?auto_110693 ) ) ( ON ?auto_110690 ?auto_110696 ) ( not ( = ?auto_110690 ?auto_110696 ) ) ( not ( = ?auto_110691 ?auto_110696 ) ) ( not ( = ?auto_110692 ?auto_110696 ) ) ( not ( = ?auto_110695 ?auto_110696 ) ) ( not ( = ?auto_110697 ?auto_110696 ) ) ( not ( = ?auto_110694 ?auto_110696 ) ) ( not ( = ?auto_110693 ?auto_110696 ) ) ( ON ?auto_110691 ?auto_110690 ) ( ON-TABLE ?auto_110696 ) ( ON ?auto_110692 ?auto_110691 ) ( CLEAR ?auto_110692 ) ( HOLDING ?auto_110695 ) ( CLEAR ?auto_110693 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110697 ?auto_110694 ?auto_110693 ?auto_110695 )
      ( MAKE-3PILE ?auto_110690 ?auto_110691 ?auto_110692 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110698 - BLOCK
      ?auto_110699 - BLOCK
      ?auto_110700 - BLOCK
    )
    :vars
    (
      ?auto_110701 - BLOCK
      ?auto_110705 - BLOCK
      ?auto_110703 - BLOCK
      ?auto_110704 - BLOCK
      ?auto_110702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110698 ?auto_110699 ) ) ( not ( = ?auto_110698 ?auto_110700 ) ) ( not ( = ?auto_110699 ?auto_110700 ) ) ( not ( = ?auto_110698 ?auto_110701 ) ) ( not ( = ?auto_110699 ?auto_110701 ) ) ( not ( = ?auto_110700 ?auto_110701 ) ) ( ON-TABLE ?auto_110705 ) ( ON ?auto_110703 ?auto_110705 ) ( ON ?auto_110704 ?auto_110703 ) ( not ( = ?auto_110705 ?auto_110703 ) ) ( not ( = ?auto_110705 ?auto_110704 ) ) ( not ( = ?auto_110705 ?auto_110701 ) ) ( not ( = ?auto_110705 ?auto_110700 ) ) ( not ( = ?auto_110705 ?auto_110699 ) ) ( not ( = ?auto_110703 ?auto_110704 ) ) ( not ( = ?auto_110703 ?auto_110701 ) ) ( not ( = ?auto_110703 ?auto_110700 ) ) ( not ( = ?auto_110703 ?auto_110699 ) ) ( not ( = ?auto_110704 ?auto_110701 ) ) ( not ( = ?auto_110704 ?auto_110700 ) ) ( not ( = ?auto_110704 ?auto_110699 ) ) ( not ( = ?auto_110698 ?auto_110705 ) ) ( not ( = ?auto_110698 ?auto_110703 ) ) ( not ( = ?auto_110698 ?auto_110704 ) ) ( ON ?auto_110698 ?auto_110702 ) ( not ( = ?auto_110698 ?auto_110702 ) ) ( not ( = ?auto_110699 ?auto_110702 ) ) ( not ( = ?auto_110700 ?auto_110702 ) ) ( not ( = ?auto_110701 ?auto_110702 ) ) ( not ( = ?auto_110705 ?auto_110702 ) ) ( not ( = ?auto_110703 ?auto_110702 ) ) ( not ( = ?auto_110704 ?auto_110702 ) ) ( ON ?auto_110699 ?auto_110698 ) ( ON-TABLE ?auto_110702 ) ( ON ?auto_110700 ?auto_110699 ) ( CLEAR ?auto_110704 ) ( ON ?auto_110701 ?auto_110700 ) ( CLEAR ?auto_110701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110702 ?auto_110698 ?auto_110699 ?auto_110700 )
      ( MAKE-3PILE ?auto_110698 ?auto_110699 ?auto_110700 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110706 - BLOCK
      ?auto_110707 - BLOCK
      ?auto_110708 - BLOCK
    )
    :vars
    (
      ?auto_110709 - BLOCK
      ?auto_110713 - BLOCK
      ?auto_110710 - BLOCK
      ?auto_110712 - BLOCK
      ?auto_110711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110706 ?auto_110707 ) ) ( not ( = ?auto_110706 ?auto_110708 ) ) ( not ( = ?auto_110707 ?auto_110708 ) ) ( not ( = ?auto_110706 ?auto_110709 ) ) ( not ( = ?auto_110707 ?auto_110709 ) ) ( not ( = ?auto_110708 ?auto_110709 ) ) ( ON-TABLE ?auto_110713 ) ( ON ?auto_110710 ?auto_110713 ) ( not ( = ?auto_110713 ?auto_110710 ) ) ( not ( = ?auto_110713 ?auto_110712 ) ) ( not ( = ?auto_110713 ?auto_110709 ) ) ( not ( = ?auto_110713 ?auto_110708 ) ) ( not ( = ?auto_110713 ?auto_110707 ) ) ( not ( = ?auto_110710 ?auto_110712 ) ) ( not ( = ?auto_110710 ?auto_110709 ) ) ( not ( = ?auto_110710 ?auto_110708 ) ) ( not ( = ?auto_110710 ?auto_110707 ) ) ( not ( = ?auto_110712 ?auto_110709 ) ) ( not ( = ?auto_110712 ?auto_110708 ) ) ( not ( = ?auto_110712 ?auto_110707 ) ) ( not ( = ?auto_110706 ?auto_110713 ) ) ( not ( = ?auto_110706 ?auto_110710 ) ) ( not ( = ?auto_110706 ?auto_110712 ) ) ( ON ?auto_110706 ?auto_110711 ) ( not ( = ?auto_110706 ?auto_110711 ) ) ( not ( = ?auto_110707 ?auto_110711 ) ) ( not ( = ?auto_110708 ?auto_110711 ) ) ( not ( = ?auto_110709 ?auto_110711 ) ) ( not ( = ?auto_110713 ?auto_110711 ) ) ( not ( = ?auto_110710 ?auto_110711 ) ) ( not ( = ?auto_110712 ?auto_110711 ) ) ( ON ?auto_110707 ?auto_110706 ) ( ON-TABLE ?auto_110711 ) ( ON ?auto_110708 ?auto_110707 ) ( ON ?auto_110709 ?auto_110708 ) ( CLEAR ?auto_110709 ) ( HOLDING ?auto_110712 ) ( CLEAR ?auto_110710 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110713 ?auto_110710 ?auto_110712 )
      ( MAKE-3PILE ?auto_110706 ?auto_110707 ?auto_110708 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110714 - BLOCK
      ?auto_110715 - BLOCK
      ?auto_110716 - BLOCK
    )
    :vars
    (
      ?auto_110720 - BLOCK
      ?auto_110719 - BLOCK
      ?auto_110721 - BLOCK
      ?auto_110718 - BLOCK
      ?auto_110717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110714 ?auto_110715 ) ) ( not ( = ?auto_110714 ?auto_110716 ) ) ( not ( = ?auto_110715 ?auto_110716 ) ) ( not ( = ?auto_110714 ?auto_110720 ) ) ( not ( = ?auto_110715 ?auto_110720 ) ) ( not ( = ?auto_110716 ?auto_110720 ) ) ( ON-TABLE ?auto_110719 ) ( ON ?auto_110721 ?auto_110719 ) ( not ( = ?auto_110719 ?auto_110721 ) ) ( not ( = ?auto_110719 ?auto_110718 ) ) ( not ( = ?auto_110719 ?auto_110720 ) ) ( not ( = ?auto_110719 ?auto_110716 ) ) ( not ( = ?auto_110719 ?auto_110715 ) ) ( not ( = ?auto_110721 ?auto_110718 ) ) ( not ( = ?auto_110721 ?auto_110720 ) ) ( not ( = ?auto_110721 ?auto_110716 ) ) ( not ( = ?auto_110721 ?auto_110715 ) ) ( not ( = ?auto_110718 ?auto_110720 ) ) ( not ( = ?auto_110718 ?auto_110716 ) ) ( not ( = ?auto_110718 ?auto_110715 ) ) ( not ( = ?auto_110714 ?auto_110719 ) ) ( not ( = ?auto_110714 ?auto_110721 ) ) ( not ( = ?auto_110714 ?auto_110718 ) ) ( ON ?auto_110714 ?auto_110717 ) ( not ( = ?auto_110714 ?auto_110717 ) ) ( not ( = ?auto_110715 ?auto_110717 ) ) ( not ( = ?auto_110716 ?auto_110717 ) ) ( not ( = ?auto_110720 ?auto_110717 ) ) ( not ( = ?auto_110719 ?auto_110717 ) ) ( not ( = ?auto_110721 ?auto_110717 ) ) ( not ( = ?auto_110718 ?auto_110717 ) ) ( ON ?auto_110715 ?auto_110714 ) ( ON-TABLE ?auto_110717 ) ( ON ?auto_110716 ?auto_110715 ) ( ON ?auto_110720 ?auto_110716 ) ( CLEAR ?auto_110721 ) ( ON ?auto_110718 ?auto_110720 ) ( CLEAR ?auto_110718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110717 ?auto_110714 ?auto_110715 ?auto_110716 ?auto_110720 )
      ( MAKE-3PILE ?auto_110714 ?auto_110715 ?auto_110716 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110722 - BLOCK
      ?auto_110723 - BLOCK
      ?auto_110724 - BLOCK
    )
    :vars
    (
      ?auto_110726 - BLOCK
      ?auto_110728 - BLOCK
      ?auto_110727 - BLOCK
      ?auto_110725 - BLOCK
      ?auto_110729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110722 ?auto_110723 ) ) ( not ( = ?auto_110722 ?auto_110724 ) ) ( not ( = ?auto_110723 ?auto_110724 ) ) ( not ( = ?auto_110722 ?auto_110726 ) ) ( not ( = ?auto_110723 ?auto_110726 ) ) ( not ( = ?auto_110724 ?auto_110726 ) ) ( ON-TABLE ?auto_110728 ) ( not ( = ?auto_110728 ?auto_110727 ) ) ( not ( = ?auto_110728 ?auto_110725 ) ) ( not ( = ?auto_110728 ?auto_110726 ) ) ( not ( = ?auto_110728 ?auto_110724 ) ) ( not ( = ?auto_110728 ?auto_110723 ) ) ( not ( = ?auto_110727 ?auto_110725 ) ) ( not ( = ?auto_110727 ?auto_110726 ) ) ( not ( = ?auto_110727 ?auto_110724 ) ) ( not ( = ?auto_110727 ?auto_110723 ) ) ( not ( = ?auto_110725 ?auto_110726 ) ) ( not ( = ?auto_110725 ?auto_110724 ) ) ( not ( = ?auto_110725 ?auto_110723 ) ) ( not ( = ?auto_110722 ?auto_110728 ) ) ( not ( = ?auto_110722 ?auto_110727 ) ) ( not ( = ?auto_110722 ?auto_110725 ) ) ( ON ?auto_110722 ?auto_110729 ) ( not ( = ?auto_110722 ?auto_110729 ) ) ( not ( = ?auto_110723 ?auto_110729 ) ) ( not ( = ?auto_110724 ?auto_110729 ) ) ( not ( = ?auto_110726 ?auto_110729 ) ) ( not ( = ?auto_110728 ?auto_110729 ) ) ( not ( = ?auto_110727 ?auto_110729 ) ) ( not ( = ?auto_110725 ?auto_110729 ) ) ( ON ?auto_110723 ?auto_110722 ) ( ON-TABLE ?auto_110729 ) ( ON ?auto_110724 ?auto_110723 ) ( ON ?auto_110726 ?auto_110724 ) ( ON ?auto_110725 ?auto_110726 ) ( CLEAR ?auto_110725 ) ( HOLDING ?auto_110727 ) ( CLEAR ?auto_110728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110728 ?auto_110727 )
      ( MAKE-3PILE ?auto_110722 ?auto_110723 ?auto_110724 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110730 - BLOCK
      ?auto_110731 - BLOCK
      ?auto_110732 - BLOCK
    )
    :vars
    (
      ?auto_110736 - BLOCK
      ?auto_110734 - BLOCK
      ?auto_110737 - BLOCK
      ?auto_110733 - BLOCK
      ?auto_110735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110730 ?auto_110731 ) ) ( not ( = ?auto_110730 ?auto_110732 ) ) ( not ( = ?auto_110731 ?auto_110732 ) ) ( not ( = ?auto_110730 ?auto_110736 ) ) ( not ( = ?auto_110731 ?auto_110736 ) ) ( not ( = ?auto_110732 ?auto_110736 ) ) ( ON-TABLE ?auto_110734 ) ( not ( = ?auto_110734 ?auto_110737 ) ) ( not ( = ?auto_110734 ?auto_110733 ) ) ( not ( = ?auto_110734 ?auto_110736 ) ) ( not ( = ?auto_110734 ?auto_110732 ) ) ( not ( = ?auto_110734 ?auto_110731 ) ) ( not ( = ?auto_110737 ?auto_110733 ) ) ( not ( = ?auto_110737 ?auto_110736 ) ) ( not ( = ?auto_110737 ?auto_110732 ) ) ( not ( = ?auto_110737 ?auto_110731 ) ) ( not ( = ?auto_110733 ?auto_110736 ) ) ( not ( = ?auto_110733 ?auto_110732 ) ) ( not ( = ?auto_110733 ?auto_110731 ) ) ( not ( = ?auto_110730 ?auto_110734 ) ) ( not ( = ?auto_110730 ?auto_110737 ) ) ( not ( = ?auto_110730 ?auto_110733 ) ) ( ON ?auto_110730 ?auto_110735 ) ( not ( = ?auto_110730 ?auto_110735 ) ) ( not ( = ?auto_110731 ?auto_110735 ) ) ( not ( = ?auto_110732 ?auto_110735 ) ) ( not ( = ?auto_110736 ?auto_110735 ) ) ( not ( = ?auto_110734 ?auto_110735 ) ) ( not ( = ?auto_110737 ?auto_110735 ) ) ( not ( = ?auto_110733 ?auto_110735 ) ) ( ON ?auto_110731 ?auto_110730 ) ( ON-TABLE ?auto_110735 ) ( ON ?auto_110732 ?auto_110731 ) ( ON ?auto_110736 ?auto_110732 ) ( ON ?auto_110733 ?auto_110736 ) ( CLEAR ?auto_110734 ) ( ON ?auto_110737 ?auto_110733 ) ( CLEAR ?auto_110737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110735 ?auto_110730 ?auto_110731 ?auto_110732 ?auto_110736 ?auto_110733 )
      ( MAKE-3PILE ?auto_110730 ?auto_110731 ?auto_110732 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110738 - BLOCK
      ?auto_110739 - BLOCK
      ?auto_110740 - BLOCK
    )
    :vars
    (
      ?auto_110742 - BLOCK
      ?auto_110745 - BLOCK
      ?auto_110743 - BLOCK
      ?auto_110741 - BLOCK
      ?auto_110744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110738 ?auto_110739 ) ) ( not ( = ?auto_110738 ?auto_110740 ) ) ( not ( = ?auto_110739 ?auto_110740 ) ) ( not ( = ?auto_110738 ?auto_110742 ) ) ( not ( = ?auto_110739 ?auto_110742 ) ) ( not ( = ?auto_110740 ?auto_110742 ) ) ( not ( = ?auto_110745 ?auto_110743 ) ) ( not ( = ?auto_110745 ?auto_110741 ) ) ( not ( = ?auto_110745 ?auto_110742 ) ) ( not ( = ?auto_110745 ?auto_110740 ) ) ( not ( = ?auto_110745 ?auto_110739 ) ) ( not ( = ?auto_110743 ?auto_110741 ) ) ( not ( = ?auto_110743 ?auto_110742 ) ) ( not ( = ?auto_110743 ?auto_110740 ) ) ( not ( = ?auto_110743 ?auto_110739 ) ) ( not ( = ?auto_110741 ?auto_110742 ) ) ( not ( = ?auto_110741 ?auto_110740 ) ) ( not ( = ?auto_110741 ?auto_110739 ) ) ( not ( = ?auto_110738 ?auto_110745 ) ) ( not ( = ?auto_110738 ?auto_110743 ) ) ( not ( = ?auto_110738 ?auto_110741 ) ) ( ON ?auto_110738 ?auto_110744 ) ( not ( = ?auto_110738 ?auto_110744 ) ) ( not ( = ?auto_110739 ?auto_110744 ) ) ( not ( = ?auto_110740 ?auto_110744 ) ) ( not ( = ?auto_110742 ?auto_110744 ) ) ( not ( = ?auto_110745 ?auto_110744 ) ) ( not ( = ?auto_110743 ?auto_110744 ) ) ( not ( = ?auto_110741 ?auto_110744 ) ) ( ON ?auto_110739 ?auto_110738 ) ( ON-TABLE ?auto_110744 ) ( ON ?auto_110740 ?auto_110739 ) ( ON ?auto_110742 ?auto_110740 ) ( ON ?auto_110741 ?auto_110742 ) ( ON ?auto_110743 ?auto_110741 ) ( CLEAR ?auto_110743 ) ( HOLDING ?auto_110745 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110745 )
      ( MAKE-3PILE ?auto_110738 ?auto_110739 ?auto_110740 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110746 - BLOCK
      ?auto_110747 - BLOCK
      ?auto_110748 - BLOCK
    )
    :vars
    (
      ?auto_110751 - BLOCK
      ?auto_110749 - BLOCK
      ?auto_110752 - BLOCK
      ?auto_110750 - BLOCK
      ?auto_110753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110746 ?auto_110747 ) ) ( not ( = ?auto_110746 ?auto_110748 ) ) ( not ( = ?auto_110747 ?auto_110748 ) ) ( not ( = ?auto_110746 ?auto_110751 ) ) ( not ( = ?auto_110747 ?auto_110751 ) ) ( not ( = ?auto_110748 ?auto_110751 ) ) ( not ( = ?auto_110749 ?auto_110752 ) ) ( not ( = ?auto_110749 ?auto_110750 ) ) ( not ( = ?auto_110749 ?auto_110751 ) ) ( not ( = ?auto_110749 ?auto_110748 ) ) ( not ( = ?auto_110749 ?auto_110747 ) ) ( not ( = ?auto_110752 ?auto_110750 ) ) ( not ( = ?auto_110752 ?auto_110751 ) ) ( not ( = ?auto_110752 ?auto_110748 ) ) ( not ( = ?auto_110752 ?auto_110747 ) ) ( not ( = ?auto_110750 ?auto_110751 ) ) ( not ( = ?auto_110750 ?auto_110748 ) ) ( not ( = ?auto_110750 ?auto_110747 ) ) ( not ( = ?auto_110746 ?auto_110749 ) ) ( not ( = ?auto_110746 ?auto_110752 ) ) ( not ( = ?auto_110746 ?auto_110750 ) ) ( ON ?auto_110746 ?auto_110753 ) ( not ( = ?auto_110746 ?auto_110753 ) ) ( not ( = ?auto_110747 ?auto_110753 ) ) ( not ( = ?auto_110748 ?auto_110753 ) ) ( not ( = ?auto_110751 ?auto_110753 ) ) ( not ( = ?auto_110749 ?auto_110753 ) ) ( not ( = ?auto_110752 ?auto_110753 ) ) ( not ( = ?auto_110750 ?auto_110753 ) ) ( ON ?auto_110747 ?auto_110746 ) ( ON-TABLE ?auto_110753 ) ( ON ?auto_110748 ?auto_110747 ) ( ON ?auto_110751 ?auto_110748 ) ( ON ?auto_110750 ?auto_110751 ) ( ON ?auto_110752 ?auto_110750 ) ( ON ?auto_110749 ?auto_110752 ) ( CLEAR ?auto_110749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_110753 ?auto_110746 ?auto_110747 ?auto_110748 ?auto_110751 ?auto_110750 ?auto_110752 )
      ( MAKE-3PILE ?auto_110746 ?auto_110747 ?auto_110748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110773 - BLOCK
      ?auto_110774 - BLOCK
      ?auto_110775 - BLOCK
    )
    :vars
    (
      ?auto_110778 - BLOCK
      ?auto_110776 - BLOCK
      ?auto_110777 - BLOCK
      ?auto_110779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110778 ?auto_110775 ) ( ON-TABLE ?auto_110773 ) ( ON ?auto_110774 ?auto_110773 ) ( ON ?auto_110775 ?auto_110774 ) ( not ( = ?auto_110773 ?auto_110774 ) ) ( not ( = ?auto_110773 ?auto_110775 ) ) ( not ( = ?auto_110773 ?auto_110778 ) ) ( not ( = ?auto_110774 ?auto_110775 ) ) ( not ( = ?auto_110774 ?auto_110778 ) ) ( not ( = ?auto_110775 ?auto_110778 ) ) ( not ( = ?auto_110773 ?auto_110776 ) ) ( not ( = ?auto_110773 ?auto_110777 ) ) ( not ( = ?auto_110774 ?auto_110776 ) ) ( not ( = ?auto_110774 ?auto_110777 ) ) ( not ( = ?auto_110775 ?auto_110776 ) ) ( not ( = ?auto_110775 ?auto_110777 ) ) ( not ( = ?auto_110778 ?auto_110776 ) ) ( not ( = ?auto_110778 ?auto_110777 ) ) ( not ( = ?auto_110776 ?auto_110777 ) ) ( ON ?auto_110776 ?auto_110778 ) ( CLEAR ?auto_110776 ) ( HOLDING ?auto_110777 ) ( CLEAR ?auto_110779 ) ( ON-TABLE ?auto_110779 ) ( not ( = ?auto_110779 ?auto_110777 ) ) ( not ( = ?auto_110773 ?auto_110779 ) ) ( not ( = ?auto_110774 ?auto_110779 ) ) ( not ( = ?auto_110775 ?auto_110779 ) ) ( not ( = ?auto_110778 ?auto_110779 ) ) ( not ( = ?auto_110776 ?auto_110779 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110779 ?auto_110777 )
      ( MAKE-3PILE ?auto_110773 ?auto_110774 ?auto_110775 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110780 - BLOCK
      ?auto_110781 - BLOCK
      ?auto_110782 - BLOCK
    )
    :vars
    (
      ?auto_110784 - BLOCK
      ?auto_110786 - BLOCK
      ?auto_110785 - BLOCK
      ?auto_110783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110784 ?auto_110782 ) ( ON-TABLE ?auto_110780 ) ( ON ?auto_110781 ?auto_110780 ) ( ON ?auto_110782 ?auto_110781 ) ( not ( = ?auto_110780 ?auto_110781 ) ) ( not ( = ?auto_110780 ?auto_110782 ) ) ( not ( = ?auto_110780 ?auto_110784 ) ) ( not ( = ?auto_110781 ?auto_110782 ) ) ( not ( = ?auto_110781 ?auto_110784 ) ) ( not ( = ?auto_110782 ?auto_110784 ) ) ( not ( = ?auto_110780 ?auto_110786 ) ) ( not ( = ?auto_110780 ?auto_110785 ) ) ( not ( = ?auto_110781 ?auto_110786 ) ) ( not ( = ?auto_110781 ?auto_110785 ) ) ( not ( = ?auto_110782 ?auto_110786 ) ) ( not ( = ?auto_110782 ?auto_110785 ) ) ( not ( = ?auto_110784 ?auto_110786 ) ) ( not ( = ?auto_110784 ?auto_110785 ) ) ( not ( = ?auto_110786 ?auto_110785 ) ) ( ON ?auto_110786 ?auto_110784 ) ( CLEAR ?auto_110783 ) ( ON-TABLE ?auto_110783 ) ( not ( = ?auto_110783 ?auto_110785 ) ) ( not ( = ?auto_110780 ?auto_110783 ) ) ( not ( = ?auto_110781 ?auto_110783 ) ) ( not ( = ?auto_110782 ?auto_110783 ) ) ( not ( = ?auto_110784 ?auto_110783 ) ) ( not ( = ?auto_110786 ?auto_110783 ) ) ( ON ?auto_110785 ?auto_110786 ) ( CLEAR ?auto_110785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110780 ?auto_110781 ?auto_110782 ?auto_110784 ?auto_110786 )
      ( MAKE-3PILE ?auto_110780 ?auto_110781 ?auto_110782 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110787 - BLOCK
      ?auto_110788 - BLOCK
      ?auto_110789 - BLOCK
    )
    :vars
    (
      ?auto_110792 - BLOCK
      ?auto_110793 - BLOCK
      ?auto_110790 - BLOCK
      ?auto_110791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110792 ?auto_110789 ) ( ON-TABLE ?auto_110787 ) ( ON ?auto_110788 ?auto_110787 ) ( ON ?auto_110789 ?auto_110788 ) ( not ( = ?auto_110787 ?auto_110788 ) ) ( not ( = ?auto_110787 ?auto_110789 ) ) ( not ( = ?auto_110787 ?auto_110792 ) ) ( not ( = ?auto_110788 ?auto_110789 ) ) ( not ( = ?auto_110788 ?auto_110792 ) ) ( not ( = ?auto_110789 ?auto_110792 ) ) ( not ( = ?auto_110787 ?auto_110793 ) ) ( not ( = ?auto_110787 ?auto_110790 ) ) ( not ( = ?auto_110788 ?auto_110793 ) ) ( not ( = ?auto_110788 ?auto_110790 ) ) ( not ( = ?auto_110789 ?auto_110793 ) ) ( not ( = ?auto_110789 ?auto_110790 ) ) ( not ( = ?auto_110792 ?auto_110793 ) ) ( not ( = ?auto_110792 ?auto_110790 ) ) ( not ( = ?auto_110793 ?auto_110790 ) ) ( ON ?auto_110793 ?auto_110792 ) ( not ( = ?auto_110791 ?auto_110790 ) ) ( not ( = ?auto_110787 ?auto_110791 ) ) ( not ( = ?auto_110788 ?auto_110791 ) ) ( not ( = ?auto_110789 ?auto_110791 ) ) ( not ( = ?auto_110792 ?auto_110791 ) ) ( not ( = ?auto_110793 ?auto_110791 ) ) ( ON ?auto_110790 ?auto_110793 ) ( CLEAR ?auto_110790 ) ( HOLDING ?auto_110791 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110791 )
      ( MAKE-3PILE ?auto_110787 ?auto_110788 ?auto_110789 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110804 - BLOCK
      ?auto_110805 - BLOCK
      ?auto_110806 - BLOCK
    )
    :vars
    (
      ?auto_110807 - BLOCK
      ?auto_110810 - BLOCK
      ?auto_110809 - BLOCK
      ?auto_110808 - BLOCK
      ?auto_110811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110807 ?auto_110806 ) ( ON-TABLE ?auto_110804 ) ( ON ?auto_110805 ?auto_110804 ) ( ON ?auto_110806 ?auto_110805 ) ( not ( = ?auto_110804 ?auto_110805 ) ) ( not ( = ?auto_110804 ?auto_110806 ) ) ( not ( = ?auto_110804 ?auto_110807 ) ) ( not ( = ?auto_110805 ?auto_110806 ) ) ( not ( = ?auto_110805 ?auto_110807 ) ) ( not ( = ?auto_110806 ?auto_110807 ) ) ( not ( = ?auto_110804 ?auto_110810 ) ) ( not ( = ?auto_110804 ?auto_110809 ) ) ( not ( = ?auto_110805 ?auto_110810 ) ) ( not ( = ?auto_110805 ?auto_110809 ) ) ( not ( = ?auto_110806 ?auto_110810 ) ) ( not ( = ?auto_110806 ?auto_110809 ) ) ( not ( = ?auto_110807 ?auto_110810 ) ) ( not ( = ?auto_110807 ?auto_110809 ) ) ( not ( = ?auto_110810 ?auto_110809 ) ) ( ON ?auto_110810 ?auto_110807 ) ( not ( = ?auto_110808 ?auto_110809 ) ) ( not ( = ?auto_110804 ?auto_110808 ) ) ( not ( = ?auto_110805 ?auto_110808 ) ) ( not ( = ?auto_110806 ?auto_110808 ) ) ( not ( = ?auto_110807 ?auto_110808 ) ) ( not ( = ?auto_110810 ?auto_110808 ) ) ( ON ?auto_110809 ?auto_110810 ) ( CLEAR ?auto_110809 ) ( ON ?auto_110808 ?auto_110811 ) ( CLEAR ?auto_110808 ) ( HAND-EMPTY ) ( not ( = ?auto_110804 ?auto_110811 ) ) ( not ( = ?auto_110805 ?auto_110811 ) ) ( not ( = ?auto_110806 ?auto_110811 ) ) ( not ( = ?auto_110807 ?auto_110811 ) ) ( not ( = ?auto_110810 ?auto_110811 ) ) ( not ( = ?auto_110809 ?auto_110811 ) ) ( not ( = ?auto_110808 ?auto_110811 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110808 ?auto_110811 )
      ( MAKE-3PILE ?auto_110804 ?auto_110805 ?auto_110806 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_110812 - BLOCK
      ?auto_110813 - BLOCK
      ?auto_110814 - BLOCK
    )
    :vars
    (
      ?auto_110819 - BLOCK
      ?auto_110818 - BLOCK
      ?auto_110817 - BLOCK
      ?auto_110816 - BLOCK
      ?auto_110815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_110819 ?auto_110814 ) ( ON-TABLE ?auto_110812 ) ( ON ?auto_110813 ?auto_110812 ) ( ON ?auto_110814 ?auto_110813 ) ( not ( = ?auto_110812 ?auto_110813 ) ) ( not ( = ?auto_110812 ?auto_110814 ) ) ( not ( = ?auto_110812 ?auto_110819 ) ) ( not ( = ?auto_110813 ?auto_110814 ) ) ( not ( = ?auto_110813 ?auto_110819 ) ) ( not ( = ?auto_110814 ?auto_110819 ) ) ( not ( = ?auto_110812 ?auto_110818 ) ) ( not ( = ?auto_110812 ?auto_110817 ) ) ( not ( = ?auto_110813 ?auto_110818 ) ) ( not ( = ?auto_110813 ?auto_110817 ) ) ( not ( = ?auto_110814 ?auto_110818 ) ) ( not ( = ?auto_110814 ?auto_110817 ) ) ( not ( = ?auto_110819 ?auto_110818 ) ) ( not ( = ?auto_110819 ?auto_110817 ) ) ( not ( = ?auto_110818 ?auto_110817 ) ) ( ON ?auto_110818 ?auto_110819 ) ( not ( = ?auto_110816 ?auto_110817 ) ) ( not ( = ?auto_110812 ?auto_110816 ) ) ( not ( = ?auto_110813 ?auto_110816 ) ) ( not ( = ?auto_110814 ?auto_110816 ) ) ( not ( = ?auto_110819 ?auto_110816 ) ) ( not ( = ?auto_110818 ?auto_110816 ) ) ( ON ?auto_110816 ?auto_110815 ) ( CLEAR ?auto_110816 ) ( not ( = ?auto_110812 ?auto_110815 ) ) ( not ( = ?auto_110813 ?auto_110815 ) ) ( not ( = ?auto_110814 ?auto_110815 ) ) ( not ( = ?auto_110819 ?auto_110815 ) ) ( not ( = ?auto_110818 ?auto_110815 ) ) ( not ( = ?auto_110817 ?auto_110815 ) ) ( not ( = ?auto_110816 ?auto_110815 ) ) ( HOLDING ?auto_110817 ) ( CLEAR ?auto_110818 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110812 ?auto_110813 ?auto_110814 ?auto_110819 ?auto_110818 ?auto_110817 )
      ( MAKE-3PILE ?auto_110812 ?auto_110813 ?auto_110814 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110874 - BLOCK
      ?auto_110875 - BLOCK
      ?auto_110876 - BLOCK
      ?auto_110877 - BLOCK
    )
    :vars
    (
      ?auto_110878 - BLOCK
      ?auto_110880 - BLOCK
      ?auto_110879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110874 ) ( ON ?auto_110875 ?auto_110874 ) ( not ( = ?auto_110874 ?auto_110875 ) ) ( not ( = ?auto_110874 ?auto_110876 ) ) ( not ( = ?auto_110874 ?auto_110877 ) ) ( not ( = ?auto_110875 ?auto_110876 ) ) ( not ( = ?auto_110875 ?auto_110877 ) ) ( not ( = ?auto_110876 ?auto_110877 ) ) ( ON ?auto_110877 ?auto_110878 ) ( not ( = ?auto_110874 ?auto_110878 ) ) ( not ( = ?auto_110875 ?auto_110878 ) ) ( not ( = ?auto_110876 ?auto_110878 ) ) ( not ( = ?auto_110877 ?auto_110878 ) ) ( CLEAR ?auto_110875 ) ( ON ?auto_110876 ?auto_110877 ) ( CLEAR ?auto_110876 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110880 ) ( ON ?auto_110879 ?auto_110880 ) ( ON ?auto_110878 ?auto_110879 ) ( not ( = ?auto_110880 ?auto_110879 ) ) ( not ( = ?auto_110880 ?auto_110878 ) ) ( not ( = ?auto_110880 ?auto_110877 ) ) ( not ( = ?auto_110880 ?auto_110876 ) ) ( not ( = ?auto_110879 ?auto_110878 ) ) ( not ( = ?auto_110879 ?auto_110877 ) ) ( not ( = ?auto_110879 ?auto_110876 ) ) ( not ( = ?auto_110874 ?auto_110880 ) ) ( not ( = ?auto_110874 ?auto_110879 ) ) ( not ( = ?auto_110875 ?auto_110880 ) ) ( not ( = ?auto_110875 ?auto_110879 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110880 ?auto_110879 ?auto_110878 ?auto_110877 )
      ( MAKE-4PILE ?auto_110874 ?auto_110875 ?auto_110876 ?auto_110877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110881 - BLOCK
      ?auto_110882 - BLOCK
      ?auto_110883 - BLOCK
      ?auto_110884 - BLOCK
    )
    :vars
    (
      ?auto_110887 - BLOCK
      ?auto_110885 - BLOCK
      ?auto_110886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110881 ) ( not ( = ?auto_110881 ?auto_110882 ) ) ( not ( = ?auto_110881 ?auto_110883 ) ) ( not ( = ?auto_110881 ?auto_110884 ) ) ( not ( = ?auto_110882 ?auto_110883 ) ) ( not ( = ?auto_110882 ?auto_110884 ) ) ( not ( = ?auto_110883 ?auto_110884 ) ) ( ON ?auto_110884 ?auto_110887 ) ( not ( = ?auto_110881 ?auto_110887 ) ) ( not ( = ?auto_110882 ?auto_110887 ) ) ( not ( = ?auto_110883 ?auto_110887 ) ) ( not ( = ?auto_110884 ?auto_110887 ) ) ( ON ?auto_110883 ?auto_110884 ) ( CLEAR ?auto_110883 ) ( ON-TABLE ?auto_110885 ) ( ON ?auto_110886 ?auto_110885 ) ( ON ?auto_110887 ?auto_110886 ) ( not ( = ?auto_110885 ?auto_110886 ) ) ( not ( = ?auto_110885 ?auto_110887 ) ) ( not ( = ?auto_110885 ?auto_110884 ) ) ( not ( = ?auto_110885 ?auto_110883 ) ) ( not ( = ?auto_110886 ?auto_110887 ) ) ( not ( = ?auto_110886 ?auto_110884 ) ) ( not ( = ?auto_110886 ?auto_110883 ) ) ( not ( = ?auto_110881 ?auto_110885 ) ) ( not ( = ?auto_110881 ?auto_110886 ) ) ( not ( = ?auto_110882 ?auto_110885 ) ) ( not ( = ?auto_110882 ?auto_110886 ) ) ( HOLDING ?auto_110882 ) ( CLEAR ?auto_110881 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110881 ?auto_110882 )
      ( MAKE-4PILE ?auto_110881 ?auto_110882 ?auto_110883 ?auto_110884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110888 - BLOCK
      ?auto_110889 - BLOCK
      ?auto_110890 - BLOCK
      ?auto_110891 - BLOCK
    )
    :vars
    (
      ?auto_110894 - BLOCK
      ?auto_110892 - BLOCK
      ?auto_110893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110888 ) ( not ( = ?auto_110888 ?auto_110889 ) ) ( not ( = ?auto_110888 ?auto_110890 ) ) ( not ( = ?auto_110888 ?auto_110891 ) ) ( not ( = ?auto_110889 ?auto_110890 ) ) ( not ( = ?auto_110889 ?auto_110891 ) ) ( not ( = ?auto_110890 ?auto_110891 ) ) ( ON ?auto_110891 ?auto_110894 ) ( not ( = ?auto_110888 ?auto_110894 ) ) ( not ( = ?auto_110889 ?auto_110894 ) ) ( not ( = ?auto_110890 ?auto_110894 ) ) ( not ( = ?auto_110891 ?auto_110894 ) ) ( ON ?auto_110890 ?auto_110891 ) ( ON-TABLE ?auto_110892 ) ( ON ?auto_110893 ?auto_110892 ) ( ON ?auto_110894 ?auto_110893 ) ( not ( = ?auto_110892 ?auto_110893 ) ) ( not ( = ?auto_110892 ?auto_110894 ) ) ( not ( = ?auto_110892 ?auto_110891 ) ) ( not ( = ?auto_110892 ?auto_110890 ) ) ( not ( = ?auto_110893 ?auto_110894 ) ) ( not ( = ?auto_110893 ?auto_110891 ) ) ( not ( = ?auto_110893 ?auto_110890 ) ) ( not ( = ?auto_110888 ?auto_110892 ) ) ( not ( = ?auto_110888 ?auto_110893 ) ) ( not ( = ?auto_110889 ?auto_110892 ) ) ( not ( = ?auto_110889 ?auto_110893 ) ) ( CLEAR ?auto_110888 ) ( ON ?auto_110889 ?auto_110890 ) ( CLEAR ?auto_110889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110892 ?auto_110893 ?auto_110894 ?auto_110891 ?auto_110890 )
      ( MAKE-4PILE ?auto_110888 ?auto_110889 ?auto_110890 ?auto_110891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110895 - BLOCK
      ?auto_110896 - BLOCK
      ?auto_110897 - BLOCK
      ?auto_110898 - BLOCK
    )
    :vars
    (
      ?auto_110901 - BLOCK
      ?auto_110900 - BLOCK
      ?auto_110899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110895 ?auto_110896 ) ) ( not ( = ?auto_110895 ?auto_110897 ) ) ( not ( = ?auto_110895 ?auto_110898 ) ) ( not ( = ?auto_110896 ?auto_110897 ) ) ( not ( = ?auto_110896 ?auto_110898 ) ) ( not ( = ?auto_110897 ?auto_110898 ) ) ( ON ?auto_110898 ?auto_110901 ) ( not ( = ?auto_110895 ?auto_110901 ) ) ( not ( = ?auto_110896 ?auto_110901 ) ) ( not ( = ?auto_110897 ?auto_110901 ) ) ( not ( = ?auto_110898 ?auto_110901 ) ) ( ON ?auto_110897 ?auto_110898 ) ( ON-TABLE ?auto_110900 ) ( ON ?auto_110899 ?auto_110900 ) ( ON ?auto_110901 ?auto_110899 ) ( not ( = ?auto_110900 ?auto_110899 ) ) ( not ( = ?auto_110900 ?auto_110901 ) ) ( not ( = ?auto_110900 ?auto_110898 ) ) ( not ( = ?auto_110900 ?auto_110897 ) ) ( not ( = ?auto_110899 ?auto_110901 ) ) ( not ( = ?auto_110899 ?auto_110898 ) ) ( not ( = ?auto_110899 ?auto_110897 ) ) ( not ( = ?auto_110895 ?auto_110900 ) ) ( not ( = ?auto_110895 ?auto_110899 ) ) ( not ( = ?auto_110896 ?auto_110900 ) ) ( not ( = ?auto_110896 ?auto_110899 ) ) ( ON ?auto_110896 ?auto_110897 ) ( CLEAR ?auto_110896 ) ( HOLDING ?auto_110895 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_110895 )
      ( MAKE-4PILE ?auto_110895 ?auto_110896 ?auto_110897 ?auto_110898 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110902 - BLOCK
      ?auto_110903 - BLOCK
      ?auto_110904 - BLOCK
      ?auto_110905 - BLOCK
    )
    :vars
    (
      ?auto_110907 - BLOCK
      ?auto_110906 - BLOCK
      ?auto_110908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110902 ?auto_110903 ) ) ( not ( = ?auto_110902 ?auto_110904 ) ) ( not ( = ?auto_110902 ?auto_110905 ) ) ( not ( = ?auto_110903 ?auto_110904 ) ) ( not ( = ?auto_110903 ?auto_110905 ) ) ( not ( = ?auto_110904 ?auto_110905 ) ) ( ON ?auto_110905 ?auto_110907 ) ( not ( = ?auto_110902 ?auto_110907 ) ) ( not ( = ?auto_110903 ?auto_110907 ) ) ( not ( = ?auto_110904 ?auto_110907 ) ) ( not ( = ?auto_110905 ?auto_110907 ) ) ( ON ?auto_110904 ?auto_110905 ) ( ON-TABLE ?auto_110906 ) ( ON ?auto_110908 ?auto_110906 ) ( ON ?auto_110907 ?auto_110908 ) ( not ( = ?auto_110906 ?auto_110908 ) ) ( not ( = ?auto_110906 ?auto_110907 ) ) ( not ( = ?auto_110906 ?auto_110905 ) ) ( not ( = ?auto_110906 ?auto_110904 ) ) ( not ( = ?auto_110908 ?auto_110907 ) ) ( not ( = ?auto_110908 ?auto_110905 ) ) ( not ( = ?auto_110908 ?auto_110904 ) ) ( not ( = ?auto_110902 ?auto_110906 ) ) ( not ( = ?auto_110902 ?auto_110908 ) ) ( not ( = ?auto_110903 ?auto_110906 ) ) ( not ( = ?auto_110903 ?auto_110908 ) ) ( ON ?auto_110903 ?auto_110904 ) ( ON ?auto_110902 ?auto_110903 ) ( CLEAR ?auto_110902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110906 ?auto_110908 ?auto_110907 ?auto_110905 ?auto_110904 ?auto_110903 )
      ( MAKE-4PILE ?auto_110902 ?auto_110903 ?auto_110904 ?auto_110905 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110913 - BLOCK
      ?auto_110914 - BLOCK
      ?auto_110915 - BLOCK
      ?auto_110916 - BLOCK
    )
    :vars
    (
      ?auto_110917 - BLOCK
      ?auto_110919 - BLOCK
      ?auto_110918 - BLOCK
      ?auto_110920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110913 ?auto_110914 ) ) ( not ( = ?auto_110913 ?auto_110915 ) ) ( not ( = ?auto_110913 ?auto_110916 ) ) ( not ( = ?auto_110914 ?auto_110915 ) ) ( not ( = ?auto_110914 ?auto_110916 ) ) ( not ( = ?auto_110915 ?auto_110916 ) ) ( ON ?auto_110916 ?auto_110917 ) ( not ( = ?auto_110913 ?auto_110917 ) ) ( not ( = ?auto_110914 ?auto_110917 ) ) ( not ( = ?auto_110915 ?auto_110917 ) ) ( not ( = ?auto_110916 ?auto_110917 ) ) ( ON ?auto_110915 ?auto_110916 ) ( ON-TABLE ?auto_110919 ) ( ON ?auto_110918 ?auto_110919 ) ( ON ?auto_110917 ?auto_110918 ) ( not ( = ?auto_110919 ?auto_110918 ) ) ( not ( = ?auto_110919 ?auto_110917 ) ) ( not ( = ?auto_110919 ?auto_110916 ) ) ( not ( = ?auto_110919 ?auto_110915 ) ) ( not ( = ?auto_110918 ?auto_110917 ) ) ( not ( = ?auto_110918 ?auto_110916 ) ) ( not ( = ?auto_110918 ?auto_110915 ) ) ( not ( = ?auto_110913 ?auto_110919 ) ) ( not ( = ?auto_110913 ?auto_110918 ) ) ( not ( = ?auto_110914 ?auto_110919 ) ) ( not ( = ?auto_110914 ?auto_110918 ) ) ( ON ?auto_110914 ?auto_110915 ) ( CLEAR ?auto_110914 ) ( ON ?auto_110913 ?auto_110920 ) ( CLEAR ?auto_110913 ) ( HAND-EMPTY ) ( not ( = ?auto_110913 ?auto_110920 ) ) ( not ( = ?auto_110914 ?auto_110920 ) ) ( not ( = ?auto_110915 ?auto_110920 ) ) ( not ( = ?auto_110916 ?auto_110920 ) ) ( not ( = ?auto_110917 ?auto_110920 ) ) ( not ( = ?auto_110919 ?auto_110920 ) ) ( not ( = ?auto_110918 ?auto_110920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_110913 ?auto_110920 )
      ( MAKE-4PILE ?auto_110913 ?auto_110914 ?auto_110915 ?auto_110916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110921 - BLOCK
      ?auto_110922 - BLOCK
      ?auto_110923 - BLOCK
      ?auto_110924 - BLOCK
    )
    :vars
    (
      ?auto_110926 - BLOCK
      ?auto_110927 - BLOCK
      ?auto_110928 - BLOCK
      ?auto_110925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110921 ?auto_110922 ) ) ( not ( = ?auto_110921 ?auto_110923 ) ) ( not ( = ?auto_110921 ?auto_110924 ) ) ( not ( = ?auto_110922 ?auto_110923 ) ) ( not ( = ?auto_110922 ?auto_110924 ) ) ( not ( = ?auto_110923 ?auto_110924 ) ) ( ON ?auto_110924 ?auto_110926 ) ( not ( = ?auto_110921 ?auto_110926 ) ) ( not ( = ?auto_110922 ?auto_110926 ) ) ( not ( = ?auto_110923 ?auto_110926 ) ) ( not ( = ?auto_110924 ?auto_110926 ) ) ( ON ?auto_110923 ?auto_110924 ) ( ON-TABLE ?auto_110927 ) ( ON ?auto_110928 ?auto_110927 ) ( ON ?auto_110926 ?auto_110928 ) ( not ( = ?auto_110927 ?auto_110928 ) ) ( not ( = ?auto_110927 ?auto_110926 ) ) ( not ( = ?auto_110927 ?auto_110924 ) ) ( not ( = ?auto_110927 ?auto_110923 ) ) ( not ( = ?auto_110928 ?auto_110926 ) ) ( not ( = ?auto_110928 ?auto_110924 ) ) ( not ( = ?auto_110928 ?auto_110923 ) ) ( not ( = ?auto_110921 ?auto_110927 ) ) ( not ( = ?auto_110921 ?auto_110928 ) ) ( not ( = ?auto_110922 ?auto_110927 ) ) ( not ( = ?auto_110922 ?auto_110928 ) ) ( ON ?auto_110921 ?auto_110925 ) ( CLEAR ?auto_110921 ) ( not ( = ?auto_110921 ?auto_110925 ) ) ( not ( = ?auto_110922 ?auto_110925 ) ) ( not ( = ?auto_110923 ?auto_110925 ) ) ( not ( = ?auto_110924 ?auto_110925 ) ) ( not ( = ?auto_110926 ?auto_110925 ) ) ( not ( = ?auto_110927 ?auto_110925 ) ) ( not ( = ?auto_110928 ?auto_110925 ) ) ( HOLDING ?auto_110922 ) ( CLEAR ?auto_110923 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_110927 ?auto_110928 ?auto_110926 ?auto_110924 ?auto_110923 ?auto_110922 )
      ( MAKE-4PILE ?auto_110921 ?auto_110922 ?auto_110923 ?auto_110924 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110929 - BLOCK
      ?auto_110930 - BLOCK
      ?auto_110931 - BLOCK
      ?auto_110932 - BLOCK
    )
    :vars
    (
      ?auto_110935 - BLOCK
      ?auto_110933 - BLOCK
      ?auto_110934 - BLOCK
      ?auto_110936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110929 ?auto_110930 ) ) ( not ( = ?auto_110929 ?auto_110931 ) ) ( not ( = ?auto_110929 ?auto_110932 ) ) ( not ( = ?auto_110930 ?auto_110931 ) ) ( not ( = ?auto_110930 ?auto_110932 ) ) ( not ( = ?auto_110931 ?auto_110932 ) ) ( ON ?auto_110932 ?auto_110935 ) ( not ( = ?auto_110929 ?auto_110935 ) ) ( not ( = ?auto_110930 ?auto_110935 ) ) ( not ( = ?auto_110931 ?auto_110935 ) ) ( not ( = ?auto_110932 ?auto_110935 ) ) ( ON ?auto_110931 ?auto_110932 ) ( ON-TABLE ?auto_110933 ) ( ON ?auto_110934 ?auto_110933 ) ( ON ?auto_110935 ?auto_110934 ) ( not ( = ?auto_110933 ?auto_110934 ) ) ( not ( = ?auto_110933 ?auto_110935 ) ) ( not ( = ?auto_110933 ?auto_110932 ) ) ( not ( = ?auto_110933 ?auto_110931 ) ) ( not ( = ?auto_110934 ?auto_110935 ) ) ( not ( = ?auto_110934 ?auto_110932 ) ) ( not ( = ?auto_110934 ?auto_110931 ) ) ( not ( = ?auto_110929 ?auto_110933 ) ) ( not ( = ?auto_110929 ?auto_110934 ) ) ( not ( = ?auto_110930 ?auto_110933 ) ) ( not ( = ?auto_110930 ?auto_110934 ) ) ( ON ?auto_110929 ?auto_110936 ) ( not ( = ?auto_110929 ?auto_110936 ) ) ( not ( = ?auto_110930 ?auto_110936 ) ) ( not ( = ?auto_110931 ?auto_110936 ) ) ( not ( = ?auto_110932 ?auto_110936 ) ) ( not ( = ?auto_110935 ?auto_110936 ) ) ( not ( = ?auto_110933 ?auto_110936 ) ) ( not ( = ?auto_110934 ?auto_110936 ) ) ( CLEAR ?auto_110931 ) ( ON ?auto_110930 ?auto_110929 ) ( CLEAR ?auto_110930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_110936 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110936 ?auto_110929 )
      ( MAKE-4PILE ?auto_110929 ?auto_110930 ?auto_110931 ?auto_110932 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110937 - BLOCK
      ?auto_110938 - BLOCK
      ?auto_110939 - BLOCK
      ?auto_110940 - BLOCK
    )
    :vars
    (
      ?auto_110944 - BLOCK
      ?auto_110943 - BLOCK
      ?auto_110942 - BLOCK
      ?auto_110941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110937 ?auto_110938 ) ) ( not ( = ?auto_110937 ?auto_110939 ) ) ( not ( = ?auto_110937 ?auto_110940 ) ) ( not ( = ?auto_110938 ?auto_110939 ) ) ( not ( = ?auto_110938 ?auto_110940 ) ) ( not ( = ?auto_110939 ?auto_110940 ) ) ( ON ?auto_110940 ?auto_110944 ) ( not ( = ?auto_110937 ?auto_110944 ) ) ( not ( = ?auto_110938 ?auto_110944 ) ) ( not ( = ?auto_110939 ?auto_110944 ) ) ( not ( = ?auto_110940 ?auto_110944 ) ) ( ON-TABLE ?auto_110943 ) ( ON ?auto_110942 ?auto_110943 ) ( ON ?auto_110944 ?auto_110942 ) ( not ( = ?auto_110943 ?auto_110942 ) ) ( not ( = ?auto_110943 ?auto_110944 ) ) ( not ( = ?auto_110943 ?auto_110940 ) ) ( not ( = ?auto_110943 ?auto_110939 ) ) ( not ( = ?auto_110942 ?auto_110944 ) ) ( not ( = ?auto_110942 ?auto_110940 ) ) ( not ( = ?auto_110942 ?auto_110939 ) ) ( not ( = ?auto_110937 ?auto_110943 ) ) ( not ( = ?auto_110937 ?auto_110942 ) ) ( not ( = ?auto_110938 ?auto_110943 ) ) ( not ( = ?auto_110938 ?auto_110942 ) ) ( ON ?auto_110937 ?auto_110941 ) ( not ( = ?auto_110937 ?auto_110941 ) ) ( not ( = ?auto_110938 ?auto_110941 ) ) ( not ( = ?auto_110939 ?auto_110941 ) ) ( not ( = ?auto_110940 ?auto_110941 ) ) ( not ( = ?auto_110944 ?auto_110941 ) ) ( not ( = ?auto_110943 ?auto_110941 ) ) ( not ( = ?auto_110942 ?auto_110941 ) ) ( ON ?auto_110938 ?auto_110937 ) ( CLEAR ?auto_110938 ) ( ON-TABLE ?auto_110941 ) ( HOLDING ?auto_110939 ) ( CLEAR ?auto_110940 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110943 ?auto_110942 ?auto_110944 ?auto_110940 ?auto_110939 )
      ( MAKE-4PILE ?auto_110937 ?auto_110938 ?auto_110939 ?auto_110940 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110945 - BLOCK
      ?auto_110946 - BLOCK
      ?auto_110947 - BLOCK
      ?auto_110948 - BLOCK
    )
    :vars
    (
      ?auto_110952 - BLOCK
      ?auto_110949 - BLOCK
      ?auto_110950 - BLOCK
      ?auto_110951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110945 ?auto_110946 ) ) ( not ( = ?auto_110945 ?auto_110947 ) ) ( not ( = ?auto_110945 ?auto_110948 ) ) ( not ( = ?auto_110946 ?auto_110947 ) ) ( not ( = ?auto_110946 ?auto_110948 ) ) ( not ( = ?auto_110947 ?auto_110948 ) ) ( ON ?auto_110948 ?auto_110952 ) ( not ( = ?auto_110945 ?auto_110952 ) ) ( not ( = ?auto_110946 ?auto_110952 ) ) ( not ( = ?auto_110947 ?auto_110952 ) ) ( not ( = ?auto_110948 ?auto_110952 ) ) ( ON-TABLE ?auto_110949 ) ( ON ?auto_110950 ?auto_110949 ) ( ON ?auto_110952 ?auto_110950 ) ( not ( = ?auto_110949 ?auto_110950 ) ) ( not ( = ?auto_110949 ?auto_110952 ) ) ( not ( = ?auto_110949 ?auto_110948 ) ) ( not ( = ?auto_110949 ?auto_110947 ) ) ( not ( = ?auto_110950 ?auto_110952 ) ) ( not ( = ?auto_110950 ?auto_110948 ) ) ( not ( = ?auto_110950 ?auto_110947 ) ) ( not ( = ?auto_110945 ?auto_110949 ) ) ( not ( = ?auto_110945 ?auto_110950 ) ) ( not ( = ?auto_110946 ?auto_110949 ) ) ( not ( = ?auto_110946 ?auto_110950 ) ) ( ON ?auto_110945 ?auto_110951 ) ( not ( = ?auto_110945 ?auto_110951 ) ) ( not ( = ?auto_110946 ?auto_110951 ) ) ( not ( = ?auto_110947 ?auto_110951 ) ) ( not ( = ?auto_110948 ?auto_110951 ) ) ( not ( = ?auto_110952 ?auto_110951 ) ) ( not ( = ?auto_110949 ?auto_110951 ) ) ( not ( = ?auto_110950 ?auto_110951 ) ) ( ON ?auto_110946 ?auto_110945 ) ( ON-TABLE ?auto_110951 ) ( CLEAR ?auto_110948 ) ( ON ?auto_110947 ?auto_110946 ) ( CLEAR ?auto_110947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110951 ?auto_110945 ?auto_110946 )
      ( MAKE-4PILE ?auto_110945 ?auto_110946 ?auto_110947 ?auto_110948 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110953 - BLOCK
      ?auto_110954 - BLOCK
      ?auto_110955 - BLOCK
      ?auto_110956 - BLOCK
    )
    :vars
    (
      ?auto_110959 - BLOCK
      ?auto_110960 - BLOCK
      ?auto_110957 - BLOCK
      ?auto_110958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110953 ?auto_110954 ) ) ( not ( = ?auto_110953 ?auto_110955 ) ) ( not ( = ?auto_110953 ?auto_110956 ) ) ( not ( = ?auto_110954 ?auto_110955 ) ) ( not ( = ?auto_110954 ?auto_110956 ) ) ( not ( = ?auto_110955 ?auto_110956 ) ) ( not ( = ?auto_110953 ?auto_110959 ) ) ( not ( = ?auto_110954 ?auto_110959 ) ) ( not ( = ?auto_110955 ?auto_110959 ) ) ( not ( = ?auto_110956 ?auto_110959 ) ) ( ON-TABLE ?auto_110960 ) ( ON ?auto_110957 ?auto_110960 ) ( ON ?auto_110959 ?auto_110957 ) ( not ( = ?auto_110960 ?auto_110957 ) ) ( not ( = ?auto_110960 ?auto_110959 ) ) ( not ( = ?auto_110960 ?auto_110956 ) ) ( not ( = ?auto_110960 ?auto_110955 ) ) ( not ( = ?auto_110957 ?auto_110959 ) ) ( not ( = ?auto_110957 ?auto_110956 ) ) ( not ( = ?auto_110957 ?auto_110955 ) ) ( not ( = ?auto_110953 ?auto_110960 ) ) ( not ( = ?auto_110953 ?auto_110957 ) ) ( not ( = ?auto_110954 ?auto_110960 ) ) ( not ( = ?auto_110954 ?auto_110957 ) ) ( ON ?auto_110953 ?auto_110958 ) ( not ( = ?auto_110953 ?auto_110958 ) ) ( not ( = ?auto_110954 ?auto_110958 ) ) ( not ( = ?auto_110955 ?auto_110958 ) ) ( not ( = ?auto_110956 ?auto_110958 ) ) ( not ( = ?auto_110959 ?auto_110958 ) ) ( not ( = ?auto_110960 ?auto_110958 ) ) ( not ( = ?auto_110957 ?auto_110958 ) ) ( ON ?auto_110954 ?auto_110953 ) ( ON-TABLE ?auto_110958 ) ( ON ?auto_110955 ?auto_110954 ) ( CLEAR ?auto_110955 ) ( HOLDING ?auto_110956 ) ( CLEAR ?auto_110959 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110960 ?auto_110957 ?auto_110959 ?auto_110956 )
      ( MAKE-4PILE ?auto_110953 ?auto_110954 ?auto_110955 ?auto_110956 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110961 - BLOCK
      ?auto_110962 - BLOCK
      ?auto_110963 - BLOCK
      ?auto_110964 - BLOCK
    )
    :vars
    (
      ?auto_110966 - BLOCK
      ?auto_110967 - BLOCK
      ?auto_110968 - BLOCK
      ?auto_110965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110961 ?auto_110962 ) ) ( not ( = ?auto_110961 ?auto_110963 ) ) ( not ( = ?auto_110961 ?auto_110964 ) ) ( not ( = ?auto_110962 ?auto_110963 ) ) ( not ( = ?auto_110962 ?auto_110964 ) ) ( not ( = ?auto_110963 ?auto_110964 ) ) ( not ( = ?auto_110961 ?auto_110966 ) ) ( not ( = ?auto_110962 ?auto_110966 ) ) ( not ( = ?auto_110963 ?auto_110966 ) ) ( not ( = ?auto_110964 ?auto_110966 ) ) ( ON-TABLE ?auto_110967 ) ( ON ?auto_110968 ?auto_110967 ) ( ON ?auto_110966 ?auto_110968 ) ( not ( = ?auto_110967 ?auto_110968 ) ) ( not ( = ?auto_110967 ?auto_110966 ) ) ( not ( = ?auto_110967 ?auto_110964 ) ) ( not ( = ?auto_110967 ?auto_110963 ) ) ( not ( = ?auto_110968 ?auto_110966 ) ) ( not ( = ?auto_110968 ?auto_110964 ) ) ( not ( = ?auto_110968 ?auto_110963 ) ) ( not ( = ?auto_110961 ?auto_110967 ) ) ( not ( = ?auto_110961 ?auto_110968 ) ) ( not ( = ?auto_110962 ?auto_110967 ) ) ( not ( = ?auto_110962 ?auto_110968 ) ) ( ON ?auto_110961 ?auto_110965 ) ( not ( = ?auto_110961 ?auto_110965 ) ) ( not ( = ?auto_110962 ?auto_110965 ) ) ( not ( = ?auto_110963 ?auto_110965 ) ) ( not ( = ?auto_110964 ?auto_110965 ) ) ( not ( = ?auto_110966 ?auto_110965 ) ) ( not ( = ?auto_110967 ?auto_110965 ) ) ( not ( = ?auto_110968 ?auto_110965 ) ) ( ON ?auto_110962 ?auto_110961 ) ( ON-TABLE ?auto_110965 ) ( ON ?auto_110963 ?auto_110962 ) ( CLEAR ?auto_110966 ) ( ON ?auto_110964 ?auto_110963 ) ( CLEAR ?auto_110964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_110965 ?auto_110961 ?auto_110962 ?auto_110963 )
      ( MAKE-4PILE ?auto_110961 ?auto_110962 ?auto_110963 ?auto_110964 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110969 - BLOCK
      ?auto_110970 - BLOCK
      ?auto_110971 - BLOCK
      ?auto_110972 - BLOCK
    )
    :vars
    (
      ?auto_110973 - BLOCK
      ?auto_110975 - BLOCK
      ?auto_110974 - BLOCK
      ?auto_110976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110969 ?auto_110970 ) ) ( not ( = ?auto_110969 ?auto_110971 ) ) ( not ( = ?auto_110969 ?auto_110972 ) ) ( not ( = ?auto_110970 ?auto_110971 ) ) ( not ( = ?auto_110970 ?auto_110972 ) ) ( not ( = ?auto_110971 ?auto_110972 ) ) ( not ( = ?auto_110969 ?auto_110973 ) ) ( not ( = ?auto_110970 ?auto_110973 ) ) ( not ( = ?auto_110971 ?auto_110973 ) ) ( not ( = ?auto_110972 ?auto_110973 ) ) ( ON-TABLE ?auto_110975 ) ( ON ?auto_110974 ?auto_110975 ) ( not ( = ?auto_110975 ?auto_110974 ) ) ( not ( = ?auto_110975 ?auto_110973 ) ) ( not ( = ?auto_110975 ?auto_110972 ) ) ( not ( = ?auto_110975 ?auto_110971 ) ) ( not ( = ?auto_110974 ?auto_110973 ) ) ( not ( = ?auto_110974 ?auto_110972 ) ) ( not ( = ?auto_110974 ?auto_110971 ) ) ( not ( = ?auto_110969 ?auto_110975 ) ) ( not ( = ?auto_110969 ?auto_110974 ) ) ( not ( = ?auto_110970 ?auto_110975 ) ) ( not ( = ?auto_110970 ?auto_110974 ) ) ( ON ?auto_110969 ?auto_110976 ) ( not ( = ?auto_110969 ?auto_110976 ) ) ( not ( = ?auto_110970 ?auto_110976 ) ) ( not ( = ?auto_110971 ?auto_110976 ) ) ( not ( = ?auto_110972 ?auto_110976 ) ) ( not ( = ?auto_110973 ?auto_110976 ) ) ( not ( = ?auto_110975 ?auto_110976 ) ) ( not ( = ?auto_110974 ?auto_110976 ) ) ( ON ?auto_110970 ?auto_110969 ) ( ON-TABLE ?auto_110976 ) ( ON ?auto_110971 ?auto_110970 ) ( ON ?auto_110972 ?auto_110971 ) ( CLEAR ?auto_110972 ) ( HOLDING ?auto_110973 ) ( CLEAR ?auto_110974 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_110975 ?auto_110974 ?auto_110973 )
      ( MAKE-4PILE ?auto_110969 ?auto_110970 ?auto_110971 ?auto_110972 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110977 - BLOCK
      ?auto_110978 - BLOCK
      ?auto_110979 - BLOCK
      ?auto_110980 - BLOCK
    )
    :vars
    (
      ?auto_110981 - BLOCK
      ?auto_110984 - BLOCK
      ?auto_110983 - BLOCK
      ?auto_110982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110977 ?auto_110978 ) ) ( not ( = ?auto_110977 ?auto_110979 ) ) ( not ( = ?auto_110977 ?auto_110980 ) ) ( not ( = ?auto_110978 ?auto_110979 ) ) ( not ( = ?auto_110978 ?auto_110980 ) ) ( not ( = ?auto_110979 ?auto_110980 ) ) ( not ( = ?auto_110977 ?auto_110981 ) ) ( not ( = ?auto_110978 ?auto_110981 ) ) ( not ( = ?auto_110979 ?auto_110981 ) ) ( not ( = ?auto_110980 ?auto_110981 ) ) ( ON-TABLE ?auto_110984 ) ( ON ?auto_110983 ?auto_110984 ) ( not ( = ?auto_110984 ?auto_110983 ) ) ( not ( = ?auto_110984 ?auto_110981 ) ) ( not ( = ?auto_110984 ?auto_110980 ) ) ( not ( = ?auto_110984 ?auto_110979 ) ) ( not ( = ?auto_110983 ?auto_110981 ) ) ( not ( = ?auto_110983 ?auto_110980 ) ) ( not ( = ?auto_110983 ?auto_110979 ) ) ( not ( = ?auto_110977 ?auto_110984 ) ) ( not ( = ?auto_110977 ?auto_110983 ) ) ( not ( = ?auto_110978 ?auto_110984 ) ) ( not ( = ?auto_110978 ?auto_110983 ) ) ( ON ?auto_110977 ?auto_110982 ) ( not ( = ?auto_110977 ?auto_110982 ) ) ( not ( = ?auto_110978 ?auto_110982 ) ) ( not ( = ?auto_110979 ?auto_110982 ) ) ( not ( = ?auto_110980 ?auto_110982 ) ) ( not ( = ?auto_110981 ?auto_110982 ) ) ( not ( = ?auto_110984 ?auto_110982 ) ) ( not ( = ?auto_110983 ?auto_110982 ) ) ( ON ?auto_110978 ?auto_110977 ) ( ON-TABLE ?auto_110982 ) ( ON ?auto_110979 ?auto_110978 ) ( ON ?auto_110980 ?auto_110979 ) ( CLEAR ?auto_110983 ) ( ON ?auto_110981 ?auto_110980 ) ( CLEAR ?auto_110981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_110982 ?auto_110977 ?auto_110978 ?auto_110979 ?auto_110980 )
      ( MAKE-4PILE ?auto_110977 ?auto_110978 ?auto_110979 ?auto_110980 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110985 - BLOCK
      ?auto_110986 - BLOCK
      ?auto_110987 - BLOCK
      ?auto_110988 - BLOCK
    )
    :vars
    (
      ?auto_110992 - BLOCK
      ?auto_110991 - BLOCK
      ?auto_110990 - BLOCK
      ?auto_110989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110985 ?auto_110986 ) ) ( not ( = ?auto_110985 ?auto_110987 ) ) ( not ( = ?auto_110985 ?auto_110988 ) ) ( not ( = ?auto_110986 ?auto_110987 ) ) ( not ( = ?auto_110986 ?auto_110988 ) ) ( not ( = ?auto_110987 ?auto_110988 ) ) ( not ( = ?auto_110985 ?auto_110992 ) ) ( not ( = ?auto_110986 ?auto_110992 ) ) ( not ( = ?auto_110987 ?auto_110992 ) ) ( not ( = ?auto_110988 ?auto_110992 ) ) ( ON-TABLE ?auto_110991 ) ( not ( = ?auto_110991 ?auto_110990 ) ) ( not ( = ?auto_110991 ?auto_110992 ) ) ( not ( = ?auto_110991 ?auto_110988 ) ) ( not ( = ?auto_110991 ?auto_110987 ) ) ( not ( = ?auto_110990 ?auto_110992 ) ) ( not ( = ?auto_110990 ?auto_110988 ) ) ( not ( = ?auto_110990 ?auto_110987 ) ) ( not ( = ?auto_110985 ?auto_110991 ) ) ( not ( = ?auto_110985 ?auto_110990 ) ) ( not ( = ?auto_110986 ?auto_110991 ) ) ( not ( = ?auto_110986 ?auto_110990 ) ) ( ON ?auto_110985 ?auto_110989 ) ( not ( = ?auto_110985 ?auto_110989 ) ) ( not ( = ?auto_110986 ?auto_110989 ) ) ( not ( = ?auto_110987 ?auto_110989 ) ) ( not ( = ?auto_110988 ?auto_110989 ) ) ( not ( = ?auto_110992 ?auto_110989 ) ) ( not ( = ?auto_110991 ?auto_110989 ) ) ( not ( = ?auto_110990 ?auto_110989 ) ) ( ON ?auto_110986 ?auto_110985 ) ( ON-TABLE ?auto_110989 ) ( ON ?auto_110987 ?auto_110986 ) ( ON ?auto_110988 ?auto_110987 ) ( ON ?auto_110992 ?auto_110988 ) ( CLEAR ?auto_110992 ) ( HOLDING ?auto_110990 ) ( CLEAR ?auto_110991 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_110991 ?auto_110990 )
      ( MAKE-4PILE ?auto_110985 ?auto_110986 ?auto_110987 ?auto_110988 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_110993 - BLOCK
      ?auto_110994 - BLOCK
      ?auto_110995 - BLOCK
      ?auto_110996 - BLOCK
    )
    :vars
    (
      ?auto_110999 - BLOCK
      ?auto_110997 - BLOCK
      ?auto_110998 - BLOCK
      ?auto_111000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_110993 ?auto_110994 ) ) ( not ( = ?auto_110993 ?auto_110995 ) ) ( not ( = ?auto_110993 ?auto_110996 ) ) ( not ( = ?auto_110994 ?auto_110995 ) ) ( not ( = ?auto_110994 ?auto_110996 ) ) ( not ( = ?auto_110995 ?auto_110996 ) ) ( not ( = ?auto_110993 ?auto_110999 ) ) ( not ( = ?auto_110994 ?auto_110999 ) ) ( not ( = ?auto_110995 ?auto_110999 ) ) ( not ( = ?auto_110996 ?auto_110999 ) ) ( ON-TABLE ?auto_110997 ) ( not ( = ?auto_110997 ?auto_110998 ) ) ( not ( = ?auto_110997 ?auto_110999 ) ) ( not ( = ?auto_110997 ?auto_110996 ) ) ( not ( = ?auto_110997 ?auto_110995 ) ) ( not ( = ?auto_110998 ?auto_110999 ) ) ( not ( = ?auto_110998 ?auto_110996 ) ) ( not ( = ?auto_110998 ?auto_110995 ) ) ( not ( = ?auto_110993 ?auto_110997 ) ) ( not ( = ?auto_110993 ?auto_110998 ) ) ( not ( = ?auto_110994 ?auto_110997 ) ) ( not ( = ?auto_110994 ?auto_110998 ) ) ( ON ?auto_110993 ?auto_111000 ) ( not ( = ?auto_110993 ?auto_111000 ) ) ( not ( = ?auto_110994 ?auto_111000 ) ) ( not ( = ?auto_110995 ?auto_111000 ) ) ( not ( = ?auto_110996 ?auto_111000 ) ) ( not ( = ?auto_110999 ?auto_111000 ) ) ( not ( = ?auto_110997 ?auto_111000 ) ) ( not ( = ?auto_110998 ?auto_111000 ) ) ( ON ?auto_110994 ?auto_110993 ) ( ON-TABLE ?auto_111000 ) ( ON ?auto_110995 ?auto_110994 ) ( ON ?auto_110996 ?auto_110995 ) ( ON ?auto_110999 ?auto_110996 ) ( CLEAR ?auto_110997 ) ( ON ?auto_110998 ?auto_110999 ) ( CLEAR ?auto_110998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111000 ?auto_110993 ?auto_110994 ?auto_110995 ?auto_110996 ?auto_110999 )
      ( MAKE-4PILE ?auto_110993 ?auto_110994 ?auto_110995 ?auto_110996 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111001 - BLOCK
      ?auto_111002 - BLOCK
      ?auto_111003 - BLOCK
      ?auto_111004 - BLOCK
    )
    :vars
    (
      ?auto_111005 - BLOCK
      ?auto_111008 - BLOCK
      ?auto_111007 - BLOCK
      ?auto_111006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111001 ?auto_111002 ) ) ( not ( = ?auto_111001 ?auto_111003 ) ) ( not ( = ?auto_111001 ?auto_111004 ) ) ( not ( = ?auto_111002 ?auto_111003 ) ) ( not ( = ?auto_111002 ?auto_111004 ) ) ( not ( = ?auto_111003 ?auto_111004 ) ) ( not ( = ?auto_111001 ?auto_111005 ) ) ( not ( = ?auto_111002 ?auto_111005 ) ) ( not ( = ?auto_111003 ?auto_111005 ) ) ( not ( = ?auto_111004 ?auto_111005 ) ) ( not ( = ?auto_111008 ?auto_111007 ) ) ( not ( = ?auto_111008 ?auto_111005 ) ) ( not ( = ?auto_111008 ?auto_111004 ) ) ( not ( = ?auto_111008 ?auto_111003 ) ) ( not ( = ?auto_111007 ?auto_111005 ) ) ( not ( = ?auto_111007 ?auto_111004 ) ) ( not ( = ?auto_111007 ?auto_111003 ) ) ( not ( = ?auto_111001 ?auto_111008 ) ) ( not ( = ?auto_111001 ?auto_111007 ) ) ( not ( = ?auto_111002 ?auto_111008 ) ) ( not ( = ?auto_111002 ?auto_111007 ) ) ( ON ?auto_111001 ?auto_111006 ) ( not ( = ?auto_111001 ?auto_111006 ) ) ( not ( = ?auto_111002 ?auto_111006 ) ) ( not ( = ?auto_111003 ?auto_111006 ) ) ( not ( = ?auto_111004 ?auto_111006 ) ) ( not ( = ?auto_111005 ?auto_111006 ) ) ( not ( = ?auto_111008 ?auto_111006 ) ) ( not ( = ?auto_111007 ?auto_111006 ) ) ( ON ?auto_111002 ?auto_111001 ) ( ON-TABLE ?auto_111006 ) ( ON ?auto_111003 ?auto_111002 ) ( ON ?auto_111004 ?auto_111003 ) ( ON ?auto_111005 ?auto_111004 ) ( ON ?auto_111007 ?auto_111005 ) ( CLEAR ?auto_111007 ) ( HOLDING ?auto_111008 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111008 )
      ( MAKE-4PILE ?auto_111001 ?auto_111002 ?auto_111003 ?auto_111004 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111009 - BLOCK
      ?auto_111010 - BLOCK
      ?auto_111011 - BLOCK
      ?auto_111012 - BLOCK
    )
    :vars
    (
      ?auto_111015 - BLOCK
      ?auto_111016 - BLOCK
      ?auto_111014 - BLOCK
      ?auto_111013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111009 ?auto_111010 ) ) ( not ( = ?auto_111009 ?auto_111011 ) ) ( not ( = ?auto_111009 ?auto_111012 ) ) ( not ( = ?auto_111010 ?auto_111011 ) ) ( not ( = ?auto_111010 ?auto_111012 ) ) ( not ( = ?auto_111011 ?auto_111012 ) ) ( not ( = ?auto_111009 ?auto_111015 ) ) ( not ( = ?auto_111010 ?auto_111015 ) ) ( not ( = ?auto_111011 ?auto_111015 ) ) ( not ( = ?auto_111012 ?auto_111015 ) ) ( not ( = ?auto_111016 ?auto_111014 ) ) ( not ( = ?auto_111016 ?auto_111015 ) ) ( not ( = ?auto_111016 ?auto_111012 ) ) ( not ( = ?auto_111016 ?auto_111011 ) ) ( not ( = ?auto_111014 ?auto_111015 ) ) ( not ( = ?auto_111014 ?auto_111012 ) ) ( not ( = ?auto_111014 ?auto_111011 ) ) ( not ( = ?auto_111009 ?auto_111016 ) ) ( not ( = ?auto_111009 ?auto_111014 ) ) ( not ( = ?auto_111010 ?auto_111016 ) ) ( not ( = ?auto_111010 ?auto_111014 ) ) ( ON ?auto_111009 ?auto_111013 ) ( not ( = ?auto_111009 ?auto_111013 ) ) ( not ( = ?auto_111010 ?auto_111013 ) ) ( not ( = ?auto_111011 ?auto_111013 ) ) ( not ( = ?auto_111012 ?auto_111013 ) ) ( not ( = ?auto_111015 ?auto_111013 ) ) ( not ( = ?auto_111016 ?auto_111013 ) ) ( not ( = ?auto_111014 ?auto_111013 ) ) ( ON ?auto_111010 ?auto_111009 ) ( ON-TABLE ?auto_111013 ) ( ON ?auto_111011 ?auto_111010 ) ( ON ?auto_111012 ?auto_111011 ) ( ON ?auto_111015 ?auto_111012 ) ( ON ?auto_111014 ?auto_111015 ) ( ON ?auto_111016 ?auto_111014 ) ( CLEAR ?auto_111016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111013 ?auto_111009 ?auto_111010 ?auto_111011 ?auto_111012 ?auto_111015 ?auto_111014 )
      ( MAKE-4PILE ?auto_111009 ?auto_111010 ?auto_111011 ?auto_111012 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111032 - BLOCK
      ?auto_111033 - BLOCK
    )
    :vars
    (
      ?auto_111036 - BLOCK
      ?auto_111034 - BLOCK
      ?auto_111035 - BLOCK
      ?auto_111038 - BLOCK
      ?auto_111037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111036 ?auto_111033 ) ( ON-TABLE ?auto_111032 ) ( ON ?auto_111033 ?auto_111032 ) ( not ( = ?auto_111032 ?auto_111033 ) ) ( not ( = ?auto_111032 ?auto_111036 ) ) ( not ( = ?auto_111033 ?auto_111036 ) ) ( not ( = ?auto_111032 ?auto_111034 ) ) ( not ( = ?auto_111032 ?auto_111035 ) ) ( not ( = ?auto_111033 ?auto_111034 ) ) ( not ( = ?auto_111033 ?auto_111035 ) ) ( not ( = ?auto_111036 ?auto_111034 ) ) ( not ( = ?auto_111036 ?auto_111035 ) ) ( not ( = ?auto_111034 ?auto_111035 ) ) ( ON ?auto_111034 ?auto_111036 ) ( CLEAR ?auto_111034 ) ( HOLDING ?auto_111035 ) ( CLEAR ?auto_111038 ) ( ON-TABLE ?auto_111037 ) ( ON ?auto_111038 ?auto_111037 ) ( not ( = ?auto_111037 ?auto_111038 ) ) ( not ( = ?auto_111037 ?auto_111035 ) ) ( not ( = ?auto_111038 ?auto_111035 ) ) ( not ( = ?auto_111032 ?auto_111038 ) ) ( not ( = ?auto_111032 ?auto_111037 ) ) ( not ( = ?auto_111033 ?auto_111038 ) ) ( not ( = ?auto_111033 ?auto_111037 ) ) ( not ( = ?auto_111036 ?auto_111038 ) ) ( not ( = ?auto_111036 ?auto_111037 ) ) ( not ( = ?auto_111034 ?auto_111038 ) ) ( not ( = ?auto_111034 ?auto_111037 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111037 ?auto_111038 ?auto_111035 )
      ( MAKE-2PILE ?auto_111032 ?auto_111033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111039 - BLOCK
      ?auto_111040 - BLOCK
    )
    :vars
    (
      ?auto_111044 - BLOCK
      ?auto_111043 - BLOCK
      ?auto_111041 - BLOCK
      ?auto_111042 - BLOCK
      ?auto_111045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111044 ?auto_111040 ) ( ON-TABLE ?auto_111039 ) ( ON ?auto_111040 ?auto_111039 ) ( not ( = ?auto_111039 ?auto_111040 ) ) ( not ( = ?auto_111039 ?auto_111044 ) ) ( not ( = ?auto_111040 ?auto_111044 ) ) ( not ( = ?auto_111039 ?auto_111043 ) ) ( not ( = ?auto_111039 ?auto_111041 ) ) ( not ( = ?auto_111040 ?auto_111043 ) ) ( not ( = ?auto_111040 ?auto_111041 ) ) ( not ( = ?auto_111044 ?auto_111043 ) ) ( not ( = ?auto_111044 ?auto_111041 ) ) ( not ( = ?auto_111043 ?auto_111041 ) ) ( ON ?auto_111043 ?auto_111044 ) ( CLEAR ?auto_111042 ) ( ON-TABLE ?auto_111045 ) ( ON ?auto_111042 ?auto_111045 ) ( not ( = ?auto_111045 ?auto_111042 ) ) ( not ( = ?auto_111045 ?auto_111041 ) ) ( not ( = ?auto_111042 ?auto_111041 ) ) ( not ( = ?auto_111039 ?auto_111042 ) ) ( not ( = ?auto_111039 ?auto_111045 ) ) ( not ( = ?auto_111040 ?auto_111042 ) ) ( not ( = ?auto_111040 ?auto_111045 ) ) ( not ( = ?auto_111044 ?auto_111042 ) ) ( not ( = ?auto_111044 ?auto_111045 ) ) ( not ( = ?auto_111043 ?auto_111042 ) ) ( not ( = ?auto_111043 ?auto_111045 ) ) ( ON ?auto_111041 ?auto_111043 ) ( CLEAR ?auto_111041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111039 ?auto_111040 ?auto_111044 ?auto_111043 )
      ( MAKE-2PILE ?auto_111039 ?auto_111040 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111046 - BLOCK
      ?auto_111047 - BLOCK
    )
    :vars
    (
      ?auto_111050 - BLOCK
      ?auto_111048 - BLOCK
      ?auto_111052 - BLOCK
      ?auto_111049 - BLOCK
      ?auto_111051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111050 ?auto_111047 ) ( ON-TABLE ?auto_111046 ) ( ON ?auto_111047 ?auto_111046 ) ( not ( = ?auto_111046 ?auto_111047 ) ) ( not ( = ?auto_111046 ?auto_111050 ) ) ( not ( = ?auto_111047 ?auto_111050 ) ) ( not ( = ?auto_111046 ?auto_111048 ) ) ( not ( = ?auto_111046 ?auto_111052 ) ) ( not ( = ?auto_111047 ?auto_111048 ) ) ( not ( = ?auto_111047 ?auto_111052 ) ) ( not ( = ?auto_111050 ?auto_111048 ) ) ( not ( = ?auto_111050 ?auto_111052 ) ) ( not ( = ?auto_111048 ?auto_111052 ) ) ( ON ?auto_111048 ?auto_111050 ) ( ON-TABLE ?auto_111049 ) ( not ( = ?auto_111049 ?auto_111051 ) ) ( not ( = ?auto_111049 ?auto_111052 ) ) ( not ( = ?auto_111051 ?auto_111052 ) ) ( not ( = ?auto_111046 ?auto_111051 ) ) ( not ( = ?auto_111046 ?auto_111049 ) ) ( not ( = ?auto_111047 ?auto_111051 ) ) ( not ( = ?auto_111047 ?auto_111049 ) ) ( not ( = ?auto_111050 ?auto_111051 ) ) ( not ( = ?auto_111050 ?auto_111049 ) ) ( not ( = ?auto_111048 ?auto_111051 ) ) ( not ( = ?auto_111048 ?auto_111049 ) ) ( ON ?auto_111052 ?auto_111048 ) ( CLEAR ?auto_111052 ) ( HOLDING ?auto_111051 ) ( CLEAR ?auto_111049 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111049 ?auto_111051 )
      ( MAKE-2PILE ?auto_111046 ?auto_111047 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111053 - BLOCK
      ?auto_111054 - BLOCK
    )
    :vars
    (
      ?auto_111056 - BLOCK
      ?auto_111057 - BLOCK
      ?auto_111055 - BLOCK
      ?auto_111059 - BLOCK
      ?auto_111058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111056 ?auto_111054 ) ( ON-TABLE ?auto_111053 ) ( ON ?auto_111054 ?auto_111053 ) ( not ( = ?auto_111053 ?auto_111054 ) ) ( not ( = ?auto_111053 ?auto_111056 ) ) ( not ( = ?auto_111054 ?auto_111056 ) ) ( not ( = ?auto_111053 ?auto_111057 ) ) ( not ( = ?auto_111053 ?auto_111055 ) ) ( not ( = ?auto_111054 ?auto_111057 ) ) ( not ( = ?auto_111054 ?auto_111055 ) ) ( not ( = ?auto_111056 ?auto_111057 ) ) ( not ( = ?auto_111056 ?auto_111055 ) ) ( not ( = ?auto_111057 ?auto_111055 ) ) ( ON ?auto_111057 ?auto_111056 ) ( ON-TABLE ?auto_111059 ) ( not ( = ?auto_111059 ?auto_111058 ) ) ( not ( = ?auto_111059 ?auto_111055 ) ) ( not ( = ?auto_111058 ?auto_111055 ) ) ( not ( = ?auto_111053 ?auto_111058 ) ) ( not ( = ?auto_111053 ?auto_111059 ) ) ( not ( = ?auto_111054 ?auto_111058 ) ) ( not ( = ?auto_111054 ?auto_111059 ) ) ( not ( = ?auto_111056 ?auto_111058 ) ) ( not ( = ?auto_111056 ?auto_111059 ) ) ( not ( = ?auto_111057 ?auto_111058 ) ) ( not ( = ?auto_111057 ?auto_111059 ) ) ( ON ?auto_111055 ?auto_111057 ) ( CLEAR ?auto_111059 ) ( ON ?auto_111058 ?auto_111055 ) ( CLEAR ?auto_111058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111053 ?auto_111054 ?auto_111056 ?auto_111057 ?auto_111055 )
      ( MAKE-2PILE ?auto_111053 ?auto_111054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111060 - BLOCK
      ?auto_111061 - BLOCK
    )
    :vars
    (
      ?auto_111065 - BLOCK
      ?auto_111063 - BLOCK
      ?auto_111064 - BLOCK
      ?auto_111062 - BLOCK
      ?auto_111066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111065 ?auto_111061 ) ( ON-TABLE ?auto_111060 ) ( ON ?auto_111061 ?auto_111060 ) ( not ( = ?auto_111060 ?auto_111061 ) ) ( not ( = ?auto_111060 ?auto_111065 ) ) ( not ( = ?auto_111061 ?auto_111065 ) ) ( not ( = ?auto_111060 ?auto_111063 ) ) ( not ( = ?auto_111060 ?auto_111064 ) ) ( not ( = ?auto_111061 ?auto_111063 ) ) ( not ( = ?auto_111061 ?auto_111064 ) ) ( not ( = ?auto_111065 ?auto_111063 ) ) ( not ( = ?auto_111065 ?auto_111064 ) ) ( not ( = ?auto_111063 ?auto_111064 ) ) ( ON ?auto_111063 ?auto_111065 ) ( not ( = ?auto_111062 ?auto_111066 ) ) ( not ( = ?auto_111062 ?auto_111064 ) ) ( not ( = ?auto_111066 ?auto_111064 ) ) ( not ( = ?auto_111060 ?auto_111066 ) ) ( not ( = ?auto_111060 ?auto_111062 ) ) ( not ( = ?auto_111061 ?auto_111066 ) ) ( not ( = ?auto_111061 ?auto_111062 ) ) ( not ( = ?auto_111065 ?auto_111066 ) ) ( not ( = ?auto_111065 ?auto_111062 ) ) ( not ( = ?auto_111063 ?auto_111066 ) ) ( not ( = ?auto_111063 ?auto_111062 ) ) ( ON ?auto_111064 ?auto_111063 ) ( ON ?auto_111066 ?auto_111064 ) ( CLEAR ?auto_111066 ) ( HOLDING ?auto_111062 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111062 )
      ( MAKE-2PILE ?auto_111060 ?auto_111061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111076 - BLOCK
      ?auto_111077 - BLOCK
    )
    :vars
    (
      ?auto_111081 - BLOCK
      ?auto_111078 - BLOCK
      ?auto_111080 - BLOCK
      ?auto_111079 - BLOCK
      ?auto_111082 - BLOCK
      ?auto_111083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111081 ?auto_111077 ) ( ON-TABLE ?auto_111076 ) ( ON ?auto_111077 ?auto_111076 ) ( not ( = ?auto_111076 ?auto_111077 ) ) ( not ( = ?auto_111076 ?auto_111081 ) ) ( not ( = ?auto_111077 ?auto_111081 ) ) ( not ( = ?auto_111076 ?auto_111078 ) ) ( not ( = ?auto_111076 ?auto_111080 ) ) ( not ( = ?auto_111077 ?auto_111078 ) ) ( not ( = ?auto_111077 ?auto_111080 ) ) ( not ( = ?auto_111081 ?auto_111078 ) ) ( not ( = ?auto_111081 ?auto_111080 ) ) ( not ( = ?auto_111078 ?auto_111080 ) ) ( ON ?auto_111078 ?auto_111081 ) ( not ( = ?auto_111079 ?auto_111082 ) ) ( not ( = ?auto_111079 ?auto_111080 ) ) ( not ( = ?auto_111082 ?auto_111080 ) ) ( not ( = ?auto_111076 ?auto_111082 ) ) ( not ( = ?auto_111076 ?auto_111079 ) ) ( not ( = ?auto_111077 ?auto_111082 ) ) ( not ( = ?auto_111077 ?auto_111079 ) ) ( not ( = ?auto_111081 ?auto_111082 ) ) ( not ( = ?auto_111081 ?auto_111079 ) ) ( not ( = ?auto_111078 ?auto_111082 ) ) ( not ( = ?auto_111078 ?auto_111079 ) ) ( ON ?auto_111080 ?auto_111078 ) ( ON ?auto_111082 ?auto_111080 ) ( CLEAR ?auto_111082 ) ( ON ?auto_111079 ?auto_111083 ) ( CLEAR ?auto_111079 ) ( HAND-EMPTY ) ( not ( = ?auto_111076 ?auto_111083 ) ) ( not ( = ?auto_111077 ?auto_111083 ) ) ( not ( = ?auto_111081 ?auto_111083 ) ) ( not ( = ?auto_111078 ?auto_111083 ) ) ( not ( = ?auto_111080 ?auto_111083 ) ) ( not ( = ?auto_111079 ?auto_111083 ) ) ( not ( = ?auto_111082 ?auto_111083 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111079 ?auto_111083 )
      ( MAKE-2PILE ?auto_111076 ?auto_111077 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111084 - BLOCK
      ?auto_111085 - BLOCK
    )
    :vars
    (
      ?auto_111091 - BLOCK
      ?auto_111089 - BLOCK
      ?auto_111087 - BLOCK
      ?auto_111090 - BLOCK
      ?auto_111086 - BLOCK
      ?auto_111088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111091 ?auto_111085 ) ( ON-TABLE ?auto_111084 ) ( ON ?auto_111085 ?auto_111084 ) ( not ( = ?auto_111084 ?auto_111085 ) ) ( not ( = ?auto_111084 ?auto_111091 ) ) ( not ( = ?auto_111085 ?auto_111091 ) ) ( not ( = ?auto_111084 ?auto_111089 ) ) ( not ( = ?auto_111084 ?auto_111087 ) ) ( not ( = ?auto_111085 ?auto_111089 ) ) ( not ( = ?auto_111085 ?auto_111087 ) ) ( not ( = ?auto_111091 ?auto_111089 ) ) ( not ( = ?auto_111091 ?auto_111087 ) ) ( not ( = ?auto_111089 ?auto_111087 ) ) ( ON ?auto_111089 ?auto_111091 ) ( not ( = ?auto_111090 ?auto_111086 ) ) ( not ( = ?auto_111090 ?auto_111087 ) ) ( not ( = ?auto_111086 ?auto_111087 ) ) ( not ( = ?auto_111084 ?auto_111086 ) ) ( not ( = ?auto_111084 ?auto_111090 ) ) ( not ( = ?auto_111085 ?auto_111086 ) ) ( not ( = ?auto_111085 ?auto_111090 ) ) ( not ( = ?auto_111091 ?auto_111086 ) ) ( not ( = ?auto_111091 ?auto_111090 ) ) ( not ( = ?auto_111089 ?auto_111086 ) ) ( not ( = ?auto_111089 ?auto_111090 ) ) ( ON ?auto_111087 ?auto_111089 ) ( ON ?auto_111090 ?auto_111088 ) ( CLEAR ?auto_111090 ) ( not ( = ?auto_111084 ?auto_111088 ) ) ( not ( = ?auto_111085 ?auto_111088 ) ) ( not ( = ?auto_111091 ?auto_111088 ) ) ( not ( = ?auto_111089 ?auto_111088 ) ) ( not ( = ?auto_111087 ?auto_111088 ) ) ( not ( = ?auto_111090 ?auto_111088 ) ) ( not ( = ?auto_111086 ?auto_111088 ) ) ( HOLDING ?auto_111086 ) ( CLEAR ?auto_111087 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111084 ?auto_111085 ?auto_111091 ?auto_111089 ?auto_111087 ?auto_111086 )
      ( MAKE-2PILE ?auto_111084 ?auto_111085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111092 - BLOCK
      ?auto_111093 - BLOCK
    )
    :vars
    (
      ?auto_111095 - BLOCK
      ?auto_111099 - BLOCK
      ?auto_111097 - BLOCK
      ?auto_111094 - BLOCK
      ?auto_111096 - BLOCK
      ?auto_111098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111095 ?auto_111093 ) ( ON-TABLE ?auto_111092 ) ( ON ?auto_111093 ?auto_111092 ) ( not ( = ?auto_111092 ?auto_111093 ) ) ( not ( = ?auto_111092 ?auto_111095 ) ) ( not ( = ?auto_111093 ?auto_111095 ) ) ( not ( = ?auto_111092 ?auto_111099 ) ) ( not ( = ?auto_111092 ?auto_111097 ) ) ( not ( = ?auto_111093 ?auto_111099 ) ) ( not ( = ?auto_111093 ?auto_111097 ) ) ( not ( = ?auto_111095 ?auto_111099 ) ) ( not ( = ?auto_111095 ?auto_111097 ) ) ( not ( = ?auto_111099 ?auto_111097 ) ) ( ON ?auto_111099 ?auto_111095 ) ( not ( = ?auto_111094 ?auto_111096 ) ) ( not ( = ?auto_111094 ?auto_111097 ) ) ( not ( = ?auto_111096 ?auto_111097 ) ) ( not ( = ?auto_111092 ?auto_111096 ) ) ( not ( = ?auto_111092 ?auto_111094 ) ) ( not ( = ?auto_111093 ?auto_111096 ) ) ( not ( = ?auto_111093 ?auto_111094 ) ) ( not ( = ?auto_111095 ?auto_111096 ) ) ( not ( = ?auto_111095 ?auto_111094 ) ) ( not ( = ?auto_111099 ?auto_111096 ) ) ( not ( = ?auto_111099 ?auto_111094 ) ) ( ON ?auto_111097 ?auto_111099 ) ( ON ?auto_111094 ?auto_111098 ) ( not ( = ?auto_111092 ?auto_111098 ) ) ( not ( = ?auto_111093 ?auto_111098 ) ) ( not ( = ?auto_111095 ?auto_111098 ) ) ( not ( = ?auto_111099 ?auto_111098 ) ) ( not ( = ?auto_111097 ?auto_111098 ) ) ( not ( = ?auto_111094 ?auto_111098 ) ) ( not ( = ?auto_111096 ?auto_111098 ) ) ( CLEAR ?auto_111097 ) ( ON ?auto_111096 ?auto_111094 ) ( CLEAR ?auto_111096 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111098 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111098 ?auto_111094 )
      ( MAKE-2PILE ?auto_111092 ?auto_111093 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111100 - BLOCK
      ?auto_111101 - BLOCK
    )
    :vars
    (
      ?auto_111104 - BLOCK
      ?auto_111107 - BLOCK
      ?auto_111106 - BLOCK
      ?auto_111102 - BLOCK
      ?auto_111105 - BLOCK
      ?auto_111103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111104 ?auto_111101 ) ( ON-TABLE ?auto_111100 ) ( ON ?auto_111101 ?auto_111100 ) ( not ( = ?auto_111100 ?auto_111101 ) ) ( not ( = ?auto_111100 ?auto_111104 ) ) ( not ( = ?auto_111101 ?auto_111104 ) ) ( not ( = ?auto_111100 ?auto_111107 ) ) ( not ( = ?auto_111100 ?auto_111106 ) ) ( not ( = ?auto_111101 ?auto_111107 ) ) ( not ( = ?auto_111101 ?auto_111106 ) ) ( not ( = ?auto_111104 ?auto_111107 ) ) ( not ( = ?auto_111104 ?auto_111106 ) ) ( not ( = ?auto_111107 ?auto_111106 ) ) ( ON ?auto_111107 ?auto_111104 ) ( not ( = ?auto_111102 ?auto_111105 ) ) ( not ( = ?auto_111102 ?auto_111106 ) ) ( not ( = ?auto_111105 ?auto_111106 ) ) ( not ( = ?auto_111100 ?auto_111105 ) ) ( not ( = ?auto_111100 ?auto_111102 ) ) ( not ( = ?auto_111101 ?auto_111105 ) ) ( not ( = ?auto_111101 ?auto_111102 ) ) ( not ( = ?auto_111104 ?auto_111105 ) ) ( not ( = ?auto_111104 ?auto_111102 ) ) ( not ( = ?auto_111107 ?auto_111105 ) ) ( not ( = ?auto_111107 ?auto_111102 ) ) ( ON ?auto_111102 ?auto_111103 ) ( not ( = ?auto_111100 ?auto_111103 ) ) ( not ( = ?auto_111101 ?auto_111103 ) ) ( not ( = ?auto_111104 ?auto_111103 ) ) ( not ( = ?auto_111107 ?auto_111103 ) ) ( not ( = ?auto_111106 ?auto_111103 ) ) ( not ( = ?auto_111102 ?auto_111103 ) ) ( not ( = ?auto_111105 ?auto_111103 ) ) ( ON ?auto_111105 ?auto_111102 ) ( CLEAR ?auto_111105 ) ( ON-TABLE ?auto_111103 ) ( HOLDING ?auto_111106 ) ( CLEAR ?auto_111107 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111100 ?auto_111101 ?auto_111104 ?auto_111107 ?auto_111106 )
      ( MAKE-2PILE ?auto_111100 ?auto_111101 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111151 - BLOCK
      ?auto_111152 - BLOCK
      ?auto_111153 - BLOCK
      ?auto_111154 - BLOCK
      ?auto_111155 - BLOCK
    )
    :vars
    (
      ?auto_111156 - BLOCK
      ?auto_111157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111151 ) ( ON ?auto_111152 ?auto_111151 ) ( ON ?auto_111153 ?auto_111152 ) ( not ( = ?auto_111151 ?auto_111152 ) ) ( not ( = ?auto_111151 ?auto_111153 ) ) ( not ( = ?auto_111151 ?auto_111154 ) ) ( not ( = ?auto_111151 ?auto_111155 ) ) ( not ( = ?auto_111152 ?auto_111153 ) ) ( not ( = ?auto_111152 ?auto_111154 ) ) ( not ( = ?auto_111152 ?auto_111155 ) ) ( not ( = ?auto_111153 ?auto_111154 ) ) ( not ( = ?auto_111153 ?auto_111155 ) ) ( not ( = ?auto_111154 ?auto_111155 ) ) ( ON ?auto_111155 ?auto_111156 ) ( not ( = ?auto_111151 ?auto_111156 ) ) ( not ( = ?auto_111152 ?auto_111156 ) ) ( not ( = ?auto_111153 ?auto_111156 ) ) ( not ( = ?auto_111154 ?auto_111156 ) ) ( not ( = ?auto_111155 ?auto_111156 ) ) ( CLEAR ?auto_111153 ) ( ON ?auto_111154 ?auto_111155 ) ( CLEAR ?auto_111154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111157 ) ( ON ?auto_111156 ?auto_111157 ) ( not ( = ?auto_111157 ?auto_111156 ) ) ( not ( = ?auto_111157 ?auto_111155 ) ) ( not ( = ?auto_111157 ?auto_111154 ) ) ( not ( = ?auto_111151 ?auto_111157 ) ) ( not ( = ?auto_111152 ?auto_111157 ) ) ( not ( = ?auto_111153 ?auto_111157 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111157 ?auto_111156 ?auto_111155 )
      ( MAKE-5PILE ?auto_111151 ?auto_111152 ?auto_111153 ?auto_111154 ?auto_111155 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111158 - BLOCK
      ?auto_111159 - BLOCK
      ?auto_111160 - BLOCK
      ?auto_111161 - BLOCK
      ?auto_111162 - BLOCK
    )
    :vars
    (
      ?auto_111164 - BLOCK
      ?auto_111163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111158 ) ( ON ?auto_111159 ?auto_111158 ) ( not ( = ?auto_111158 ?auto_111159 ) ) ( not ( = ?auto_111158 ?auto_111160 ) ) ( not ( = ?auto_111158 ?auto_111161 ) ) ( not ( = ?auto_111158 ?auto_111162 ) ) ( not ( = ?auto_111159 ?auto_111160 ) ) ( not ( = ?auto_111159 ?auto_111161 ) ) ( not ( = ?auto_111159 ?auto_111162 ) ) ( not ( = ?auto_111160 ?auto_111161 ) ) ( not ( = ?auto_111160 ?auto_111162 ) ) ( not ( = ?auto_111161 ?auto_111162 ) ) ( ON ?auto_111162 ?auto_111164 ) ( not ( = ?auto_111158 ?auto_111164 ) ) ( not ( = ?auto_111159 ?auto_111164 ) ) ( not ( = ?auto_111160 ?auto_111164 ) ) ( not ( = ?auto_111161 ?auto_111164 ) ) ( not ( = ?auto_111162 ?auto_111164 ) ) ( ON ?auto_111161 ?auto_111162 ) ( CLEAR ?auto_111161 ) ( ON-TABLE ?auto_111163 ) ( ON ?auto_111164 ?auto_111163 ) ( not ( = ?auto_111163 ?auto_111164 ) ) ( not ( = ?auto_111163 ?auto_111162 ) ) ( not ( = ?auto_111163 ?auto_111161 ) ) ( not ( = ?auto_111158 ?auto_111163 ) ) ( not ( = ?auto_111159 ?auto_111163 ) ) ( not ( = ?auto_111160 ?auto_111163 ) ) ( HOLDING ?auto_111160 ) ( CLEAR ?auto_111159 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111158 ?auto_111159 ?auto_111160 )
      ( MAKE-5PILE ?auto_111158 ?auto_111159 ?auto_111160 ?auto_111161 ?auto_111162 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111165 - BLOCK
      ?auto_111166 - BLOCK
      ?auto_111167 - BLOCK
      ?auto_111168 - BLOCK
      ?auto_111169 - BLOCK
    )
    :vars
    (
      ?auto_111170 - BLOCK
      ?auto_111171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111165 ) ( ON ?auto_111166 ?auto_111165 ) ( not ( = ?auto_111165 ?auto_111166 ) ) ( not ( = ?auto_111165 ?auto_111167 ) ) ( not ( = ?auto_111165 ?auto_111168 ) ) ( not ( = ?auto_111165 ?auto_111169 ) ) ( not ( = ?auto_111166 ?auto_111167 ) ) ( not ( = ?auto_111166 ?auto_111168 ) ) ( not ( = ?auto_111166 ?auto_111169 ) ) ( not ( = ?auto_111167 ?auto_111168 ) ) ( not ( = ?auto_111167 ?auto_111169 ) ) ( not ( = ?auto_111168 ?auto_111169 ) ) ( ON ?auto_111169 ?auto_111170 ) ( not ( = ?auto_111165 ?auto_111170 ) ) ( not ( = ?auto_111166 ?auto_111170 ) ) ( not ( = ?auto_111167 ?auto_111170 ) ) ( not ( = ?auto_111168 ?auto_111170 ) ) ( not ( = ?auto_111169 ?auto_111170 ) ) ( ON ?auto_111168 ?auto_111169 ) ( ON-TABLE ?auto_111171 ) ( ON ?auto_111170 ?auto_111171 ) ( not ( = ?auto_111171 ?auto_111170 ) ) ( not ( = ?auto_111171 ?auto_111169 ) ) ( not ( = ?auto_111171 ?auto_111168 ) ) ( not ( = ?auto_111165 ?auto_111171 ) ) ( not ( = ?auto_111166 ?auto_111171 ) ) ( not ( = ?auto_111167 ?auto_111171 ) ) ( CLEAR ?auto_111166 ) ( ON ?auto_111167 ?auto_111168 ) ( CLEAR ?auto_111167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111171 ?auto_111170 ?auto_111169 ?auto_111168 )
      ( MAKE-5PILE ?auto_111165 ?auto_111166 ?auto_111167 ?auto_111168 ?auto_111169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111172 - BLOCK
      ?auto_111173 - BLOCK
      ?auto_111174 - BLOCK
      ?auto_111175 - BLOCK
      ?auto_111176 - BLOCK
    )
    :vars
    (
      ?auto_111177 - BLOCK
      ?auto_111178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111172 ) ( not ( = ?auto_111172 ?auto_111173 ) ) ( not ( = ?auto_111172 ?auto_111174 ) ) ( not ( = ?auto_111172 ?auto_111175 ) ) ( not ( = ?auto_111172 ?auto_111176 ) ) ( not ( = ?auto_111173 ?auto_111174 ) ) ( not ( = ?auto_111173 ?auto_111175 ) ) ( not ( = ?auto_111173 ?auto_111176 ) ) ( not ( = ?auto_111174 ?auto_111175 ) ) ( not ( = ?auto_111174 ?auto_111176 ) ) ( not ( = ?auto_111175 ?auto_111176 ) ) ( ON ?auto_111176 ?auto_111177 ) ( not ( = ?auto_111172 ?auto_111177 ) ) ( not ( = ?auto_111173 ?auto_111177 ) ) ( not ( = ?auto_111174 ?auto_111177 ) ) ( not ( = ?auto_111175 ?auto_111177 ) ) ( not ( = ?auto_111176 ?auto_111177 ) ) ( ON ?auto_111175 ?auto_111176 ) ( ON-TABLE ?auto_111178 ) ( ON ?auto_111177 ?auto_111178 ) ( not ( = ?auto_111178 ?auto_111177 ) ) ( not ( = ?auto_111178 ?auto_111176 ) ) ( not ( = ?auto_111178 ?auto_111175 ) ) ( not ( = ?auto_111172 ?auto_111178 ) ) ( not ( = ?auto_111173 ?auto_111178 ) ) ( not ( = ?auto_111174 ?auto_111178 ) ) ( ON ?auto_111174 ?auto_111175 ) ( CLEAR ?auto_111174 ) ( HOLDING ?auto_111173 ) ( CLEAR ?auto_111172 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111172 ?auto_111173 )
      ( MAKE-5PILE ?auto_111172 ?auto_111173 ?auto_111174 ?auto_111175 ?auto_111176 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111179 - BLOCK
      ?auto_111180 - BLOCK
      ?auto_111181 - BLOCK
      ?auto_111182 - BLOCK
      ?auto_111183 - BLOCK
    )
    :vars
    (
      ?auto_111184 - BLOCK
      ?auto_111185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111179 ) ( not ( = ?auto_111179 ?auto_111180 ) ) ( not ( = ?auto_111179 ?auto_111181 ) ) ( not ( = ?auto_111179 ?auto_111182 ) ) ( not ( = ?auto_111179 ?auto_111183 ) ) ( not ( = ?auto_111180 ?auto_111181 ) ) ( not ( = ?auto_111180 ?auto_111182 ) ) ( not ( = ?auto_111180 ?auto_111183 ) ) ( not ( = ?auto_111181 ?auto_111182 ) ) ( not ( = ?auto_111181 ?auto_111183 ) ) ( not ( = ?auto_111182 ?auto_111183 ) ) ( ON ?auto_111183 ?auto_111184 ) ( not ( = ?auto_111179 ?auto_111184 ) ) ( not ( = ?auto_111180 ?auto_111184 ) ) ( not ( = ?auto_111181 ?auto_111184 ) ) ( not ( = ?auto_111182 ?auto_111184 ) ) ( not ( = ?auto_111183 ?auto_111184 ) ) ( ON ?auto_111182 ?auto_111183 ) ( ON-TABLE ?auto_111185 ) ( ON ?auto_111184 ?auto_111185 ) ( not ( = ?auto_111185 ?auto_111184 ) ) ( not ( = ?auto_111185 ?auto_111183 ) ) ( not ( = ?auto_111185 ?auto_111182 ) ) ( not ( = ?auto_111179 ?auto_111185 ) ) ( not ( = ?auto_111180 ?auto_111185 ) ) ( not ( = ?auto_111181 ?auto_111185 ) ) ( ON ?auto_111181 ?auto_111182 ) ( CLEAR ?auto_111179 ) ( ON ?auto_111180 ?auto_111181 ) ( CLEAR ?auto_111180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111185 ?auto_111184 ?auto_111183 ?auto_111182 ?auto_111181 )
      ( MAKE-5PILE ?auto_111179 ?auto_111180 ?auto_111181 ?auto_111182 ?auto_111183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111186 - BLOCK
      ?auto_111187 - BLOCK
      ?auto_111188 - BLOCK
      ?auto_111189 - BLOCK
      ?auto_111190 - BLOCK
    )
    :vars
    (
      ?auto_111192 - BLOCK
      ?auto_111191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111186 ?auto_111187 ) ) ( not ( = ?auto_111186 ?auto_111188 ) ) ( not ( = ?auto_111186 ?auto_111189 ) ) ( not ( = ?auto_111186 ?auto_111190 ) ) ( not ( = ?auto_111187 ?auto_111188 ) ) ( not ( = ?auto_111187 ?auto_111189 ) ) ( not ( = ?auto_111187 ?auto_111190 ) ) ( not ( = ?auto_111188 ?auto_111189 ) ) ( not ( = ?auto_111188 ?auto_111190 ) ) ( not ( = ?auto_111189 ?auto_111190 ) ) ( ON ?auto_111190 ?auto_111192 ) ( not ( = ?auto_111186 ?auto_111192 ) ) ( not ( = ?auto_111187 ?auto_111192 ) ) ( not ( = ?auto_111188 ?auto_111192 ) ) ( not ( = ?auto_111189 ?auto_111192 ) ) ( not ( = ?auto_111190 ?auto_111192 ) ) ( ON ?auto_111189 ?auto_111190 ) ( ON-TABLE ?auto_111191 ) ( ON ?auto_111192 ?auto_111191 ) ( not ( = ?auto_111191 ?auto_111192 ) ) ( not ( = ?auto_111191 ?auto_111190 ) ) ( not ( = ?auto_111191 ?auto_111189 ) ) ( not ( = ?auto_111186 ?auto_111191 ) ) ( not ( = ?auto_111187 ?auto_111191 ) ) ( not ( = ?auto_111188 ?auto_111191 ) ) ( ON ?auto_111188 ?auto_111189 ) ( ON ?auto_111187 ?auto_111188 ) ( CLEAR ?auto_111187 ) ( HOLDING ?auto_111186 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111186 )
      ( MAKE-5PILE ?auto_111186 ?auto_111187 ?auto_111188 ?auto_111189 ?auto_111190 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111193 - BLOCK
      ?auto_111194 - BLOCK
      ?auto_111195 - BLOCK
      ?auto_111196 - BLOCK
      ?auto_111197 - BLOCK
    )
    :vars
    (
      ?auto_111198 - BLOCK
      ?auto_111199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111193 ?auto_111194 ) ) ( not ( = ?auto_111193 ?auto_111195 ) ) ( not ( = ?auto_111193 ?auto_111196 ) ) ( not ( = ?auto_111193 ?auto_111197 ) ) ( not ( = ?auto_111194 ?auto_111195 ) ) ( not ( = ?auto_111194 ?auto_111196 ) ) ( not ( = ?auto_111194 ?auto_111197 ) ) ( not ( = ?auto_111195 ?auto_111196 ) ) ( not ( = ?auto_111195 ?auto_111197 ) ) ( not ( = ?auto_111196 ?auto_111197 ) ) ( ON ?auto_111197 ?auto_111198 ) ( not ( = ?auto_111193 ?auto_111198 ) ) ( not ( = ?auto_111194 ?auto_111198 ) ) ( not ( = ?auto_111195 ?auto_111198 ) ) ( not ( = ?auto_111196 ?auto_111198 ) ) ( not ( = ?auto_111197 ?auto_111198 ) ) ( ON ?auto_111196 ?auto_111197 ) ( ON-TABLE ?auto_111199 ) ( ON ?auto_111198 ?auto_111199 ) ( not ( = ?auto_111199 ?auto_111198 ) ) ( not ( = ?auto_111199 ?auto_111197 ) ) ( not ( = ?auto_111199 ?auto_111196 ) ) ( not ( = ?auto_111193 ?auto_111199 ) ) ( not ( = ?auto_111194 ?auto_111199 ) ) ( not ( = ?auto_111195 ?auto_111199 ) ) ( ON ?auto_111195 ?auto_111196 ) ( ON ?auto_111194 ?auto_111195 ) ( ON ?auto_111193 ?auto_111194 ) ( CLEAR ?auto_111193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111199 ?auto_111198 ?auto_111197 ?auto_111196 ?auto_111195 ?auto_111194 )
      ( MAKE-5PILE ?auto_111193 ?auto_111194 ?auto_111195 ?auto_111196 ?auto_111197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111205 - BLOCK
      ?auto_111206 - BLOCK
      ?auto_111207 - BLOCK
      ?auto_111208 - BLOCK
      ?auto_111209 - BLOCK
    )
    :vars
    (
      ?auto_111210 - BLOCK
      ?auto_111211 - BLOCK
      ?auto_111212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111205 ?auto_111206 ) ) ( not ( = ?auto_111205 ?auto_111207 ) ) ( not ( = ?auto_111205 ?auto_111208 ) ) ( not ( = ?auto_111205 ?auto_111209 ) ) ( not ( = ?auto_111206 ?auto_111207 ) ) ( not ( = ?auto_111206 ?auto_111208 ) ) ( not ( = ?auto_111206 ?auto_111209 ) ) ( not ( = ?auto_111207 ?auto_111208 ) ) ( not ( = ?auto_111207 ?auto_111209 ) ) ( not ( = ?auto_111208 ?auto_111209 ) ) ( ON ?auto_111209 ?auto_111210 ) ( not ( = ?auto_111205 ?auto_111210 ) ) ( not ( = ?auto_111206 ?auto_111210 ) ) ( not ( = ?auto_111207 ?auto_111210 ) ) ( not ( = ?auto_111208 ?auto_111210 ) ) ( not ( = ?auto_111209 ?auto_111210 ) ) ( ON ?auto_111208 ?auto_111209 ) ( ON-TABLE ?auto_111211 ) ( ON ?auto_111210 ?auto_111211 ) ( not ( = ?auto_111211 ?auto_111210 ) ) ( not ( = ?auto_111211 ?auto_111209 ) ) ( not ( = ?auto_111211 ?auto_111208 ) ) ( not ( = ?auto_111205 ?auto_111211 ) ) ( not ( = ?auto_111206 ?auto_111211 ) ) ( not ( = ?auto_111207 ?auto_111211 ) ) ( ON ?auto_111207 ?auto_111208 ) ( ON ?auto_111206 ?auto_111207 ) ( CLEAR ?auto_111206 ) ( ON ?auto_111205 ?auto_111212 ) ( CLEAR ?auto_111205 ) ( HAND-EMPTY ) ( not ( = ?auto_111205 ?auto_111212 ) ) ( not ( = ?auto_111206 ?auto_111212 ) ) ( not ( = ?auto_111207 ?auto_111212 ) ) ( not ( = ?auto_111208 ?auto_111212 ) ) ( not ( = ?auto_111209 ?auto_111212 ) ) ( not ( = ?auto_111210 ?auto_111212 ) ) ( not ( = ?auto_111211 ?auto_111212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111205 ?auto_111212 )
      ( MAKE-5PILE ?auto_111205 ?auto_111206 ?auto_111207 ?auto_111208 ?auto_111209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111213 - BLOCK
      ?auto_111214 - BLOCK
      ?auto_111215 - BLOCK
      ?auto_111216 - BLOCK
      ?auto_111217 - BLOCK
    )
    :vars
    (
      ?auto_111220 - BLOCK
      ?auto_111219 - BLOCK
      ?auto_111218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111213 ?auto_111214 ) ) ( not ( = ?auto_111213 ?auto_111215 ) ) ( not ( = ?auto_111213 ?auto_111216 ) ) ( not ( = ?auto_111213 ?auto_111217 ) ) ( not ( = ?auto_111214 ?auto_111215 ) ) ( not ( = ?auto_111214 ?auto_111216 ) ) ( not ( = ?auto_111214 ?auto_111217 ) ) ( not ( = ?auto_111215 ?auto_111216 ) ) ( not ( = ?auto_111215 ?auto_111217 ) ) ( not ( = ?auto_111216 ?auto_111217 ) ) ( ON ?auto_111217 ?auto_111220 ) ( not ( = ?auto_111213 ?auto_111220 ) ) ( not ( = ?auto_111214 ?auto_111220 ) ) ( not ( = ?auto_111215 ?auto_111220 ) ) ( not ( = ?auto_111216 ?auto_111220 ) ) ( not ( = ?auto_111217 ?auto_111220 ) ) ( ON ?auto_111216 ?auto_111217 ) ( ON-TABLE ?auto_111219 ) ( ON ?auto_111220 ?auto_111219 ) ( not ( = ?auto_111219 ?auto_111220 ) ) ( not ( = ?auto_111219 ?auto_111217 ) ) ( not ( = ?auto_111219 ?auto_111216 ) ) ( not ( = ?auto_111213 ?auto_111219 ) ) ( not ( = ?auto_111214 ?auto_111219 ) ) ( not ( = ?auto_111215 ?auto_111219 ) ) ( ON ?auto_111215 ?auto_111216 ) ( ON ?auto_111213 ?auto_111218 ) ( CLEAR ?auto_111213 ) ( not ( = ?auto_111213 ?auto_111218 ) ) ( not ( = ?auto_111214 ?auto_111218 ) ) ( not ( = ?auto_111215 ?auto_111218 ) ) ( not ( = ?auto_111216 ?auto_111218 ) ) ( not ( = ?auto_111217 ?auto_111218 ) ) ( not ( = ?auto_111220 ?auto_111218 ) ) ( not ( = ?auto_111219 ?auto_111218 ) ) ( HOLDING ?auto_111214 ) ( CLEAR ?auto_111215 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111219 ?auto_111220 ?auto_111217 ?auto_111216 ?auto_111215 ?auto_111214 )
      ( MAKE-5PILE ?auto_111213 ?auto_111214 ?auto_111215 ?auto_111216 ?auto_111217 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111221 - BLOCK
      ?auto_111222 - BLOCK
      ?auto_111223 - BLOCK
      ?auto_111224 - BLOCK
      ?auto_111225 - BLOCK
    )
    :vars
    (
      ?auto_111228 - BLOCK
      ?auto_111226 - BLOCK
      ?auto_111227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111221 ?auto_111222 ) ) ( not ( = ?auto_111221 ?auto_111223 ) ) ( not ( = ?auto_111221 ?auto_111224 ) ) ( not ( = ?auto_111221 ?auto_111225 ) ) ( not ( = ?auto_111222 ?auto_111223 ) ) ( not ( = ?auto_111222 ?auto_111224 ) ) ( not ( = ?auto_111222 ?auto_111225 ) ) ( not ( = ?auto_111223 ?auto_111224 ) ) ( not ( = ?auto_111223 ?auto_111225 ) ) ( not ( = ?auto_111224 ?auto_111225 ) ) ( ON ?auto_111225 ?auto_111228 ) ( not ( = ?auto_111221 ?auto_111228 ) ) ( not ( = ?auto_111222 ?auto_111228 ) ) ( not ( = ?auto_111223 ?auto_111228 ) ) ( not ( = ?auto_111224 ?auto_111228 ) ) ( not ( = ?auto_111225 ?auto_111228 ) ) ( ON ?auto_111224 ?auto_111225 ) ( ON-TABLE ?auto_111226 ) ( ON ?auto_111228 ?auto_111226 ) ( not ( = ?auto_111226 ?auto_111228 ) ) ( not ( = ?auto_111226 ?auto_111225 ) ) ( not ( = ?auto_111226 ?auto_111224 ) ) ( not ( = ?auto_111221 ?auto_111226 ) ) ( not ( = ?auto_111222 ?auto_111226 ) ) ( not ( = ?auto_111223 ?auto_111226 ) ) ( ON ?auto_111223 ?auto_111224 ) ( ON ?auto_111221 ?auto_111227 ) ( not ( = ?auto_111221 ?auto_111227 ) ) ( not ( = ?auto_111222 ?auto_111227 ) ) ( not ( = ?auto_111223 ?auto_111227 ) ) ( not ( = ?auto_111224 ?auto_111227 ) ) ( not ( = ?auto_111225 ?auto_111227 ) ) ( not ( = ?auto_111228 ?auto_111227 ) ) ( not ( = ?auto_111226 ?auto_111227 ) ) ( CLEAR ?auto_111223 ) ( ON ?auto_111222 ?auto_111221 ) ( CLEAR ?auto_111222 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111227 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111227 ?auto_111221 )
      ( MAKE-5PILE ?auto_111221 ?auto_111222 ?auto_111223 ?auto_111224 ?auto_111225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111229 - BLOCK
      ?auto_111230 - BLOCK
      ?auto_111231 - BLOCK
      ?auto_111232 - BLOCK
      ?auto_111233 - BLOCK
    )
    :vars
    (
      ?auto_111234 - BLOCK
      ?auto_111235 - BLOCK
      ?auto_111236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111229 ?auto_111230 ) ) ( not ( = ?auto_111229 ?auto_111231 ) ) ( not ( = ?auto_111229 ?auto_111232 ) ) ( not ( = ?auto_111229 ?auto_111233 ) ) ( not ( = ?auto_111230 ?auto_111231 ) ) ( not ( = ?auto_111230 ?auto_111232 ) ) ( not ( = ?auto_111230 ?auto_111233 ) ) ( not ( = ?auto_111231 ?auto_111232 ) ) ( not ( = ?auto_111231 ?auto_111233 ) ) ( not ( = ?auto_111232 ?auto_111233 ) ) ( ON ?auto_111233 ?auto_111234 ) ( not ( = ?auto_111229 ?auto_111234 ) ) ( not ( = ?auto_111230 ?auto_111234 ) ) ( not ( = ?auto_111231 ?auto_111234 ) ) ( not ( = ?auto_111232 ?auto_111234 ) ) ( not ( = ?auto_111233 ?auto_111234 ) ) ( ON ?auto_111232 ?auto_111233 ) ( ON-TABLE ?auto_111235 ) ( ON ?auto_111234 ?auto_111235 ) ( not ( = ?auto_111235 ?auto_111234 ) ) ( not ( = ?auto_111235 ?auto_111233 ) ) ( not ( = ?auto_111235 ?auto_111232 ) ) ( not ( = ?auto_111229 ?auto_111235 ) ) ( not ( = ?auto_111230 ?auto_111235 ) ) ( not ( = ?auto_111231 ?auto_111235 ) ) ( ON ?auto_111229 ?auto_111236 ) ( not ( = ?auto_111229 ?auto_111236 ) ) ( not ( = ?auto_111230 ?auto_111236 ) ) ( not ( = ?auto_111231 ?auto_111236 ) ) ( not ( = ?auto_111232 ?auto_111236 ) ) ( not ( = ?auto_111233 ?auto_111236 ) ) ( not ( = ?auto_111234 ?auto_111236 ) ) ( not ( = ?auto_111235 ?auto_111236 ) ) ( ON ?auto_111230 ?auto_111229 ) ( CLEAR ?auto_111230 ) ( ON-TABLE ?auto_111236 ) ( HOLDING ?auto_111231 ) ( CLEAR ?auto_111232 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111235 ?auto_111234 ?auto_111233 ?auto_111232 ?auto_111231 )
      ( MAKE-5PILE ?auto_111229 ?auto_111230 ?auto_111231 ?auto_111232 ?auto_111233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111237 - BLOCK
      ?auto_111238 - BLOCK
      ?auto_111239 - BLOCK
      ?auto_111240 - BLOCK
      ?auto_111241 - BLOCK
    )
    :vars
    (
      ?auto_111242 - BLOCK
      ?auto_111244 - BLOCK
      ?auto_111243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111237 ?auto_111238 ) ) ( not ( = ?auto_111237 ?auto_111239 ) ) ( not ( = ?auto_111237 ?auto_111240 ) ) ( not ( = ?auto_111237 ?auto_111241 ) ) ( not ( = ?auto_111238 ?auto_111239 ) ) ( not ( = ?auto_111238 ?auto_111240 ) ) ( not ( = ?auto_111238 ?auto_111241 ) ) ( not ( = ?auto_111239 ?auto_111240 ) ) ( not ( = ?auto_111239 ?auto_111241 ) ) ( not ( = ?auto_111240 ?auto_111241 ) ) ( ON ?auto_111241 ?auto_111242 ) ( not ( = ?auto_111237 ?auto_111242 ) ) ( not ( = ?auto_111238 ?auto_111242 ) ) ( not ( = ?auto_111239 ?auto_111242 ) ) ( not ( = ?auto_111240 ?auto_111242 ) ) ( not ( = ?auto_111241 ?auto_111242 ) ) ( ON ?auto_111240 ?auto_111241 ) ( ON-TABLE ?auto_111244 ) ( ON ?auto_111242 ?auto_111244 ) ( not ( = ?auto_111244 ?auto_111242 ) ) ( not ( = ?auto_111244 ?auto_111241 ) ) ( not ( = ?auto_111244 ?auto_111240 ) ) ( not ( = ?auto_111237 ?auto_111244 ) ) ( not ( = ?auto_111238 ?auto_111244 ) ) ( not ( = ?auto_111239 ?auto_111244 ) ) ( ON ?auto_111237 ?auto_111243 ) ( not ( = ?auto_111237 ?auto_111243 ) ) ( not ( = ?auto_111238 ?auto_111243 ) ) ( not ( = ?auto_111239 ?auto_111243 ) ) ( not ( = ?auto_111240 ?auto_111243 ) ) ( not ( = ?auto_111241 ?auto_111243 ) ) ( not ( = ?auto_111242 ?auto_111243 ) ) ( not ( = ?auto_111244 ?auto_111243 ) ) ( ON ?auto_111238 ?auto_111237 ) ( ON-TABLE ?auto_111243 ) ( CLEAR ?auto_111240 ) ( ON ?auto_111239 ?auto_111238 ) ( CLEAR ?auto_111239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111243 ?auto_111237 ?auto_111238 )
      ( MAKE-5PILE ?auto_111237 ?auto_111238 ?auto_111239 ?auto_111240 ?auto_111241 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111245 - BLOCK
      ?auto_111246 - BLOCK
      ?auto_111247 - BLOCK
      ?auto_111248 - BLOCK
      ?auto_111249 - BLOCK
    )
    :vars
    (
      ?auto_111251 - BLOCK
      ?auto_111250 - BLOCK
      ?auto_111252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111245 ?auto_111246 ) ) ( not ( = ?auto_111245 ?auto_111247 ) ) ( not ( = ?auto_111245 ?auto_111248 ) ) ( not ( = ?auto_111245 ?auto_111249 ) ) ( not ( = ?auto_111246 ?auto_111247 ) ) ( not ( = ?auto_111246 ?auto_111248 ) ) ( not ( = ?auto_111246 ?auto_111249 ) ) ( not ( = ?auto_111247 ?auto_111248 ) ) ( not ( = ?auto_111247 ?auto_111249 ) ) ( not ( = ?auto_111248 ?auto_111249 ) ) ( ON ?auto_111249 ?auto_111251 ) ( not ( = ?auto_111245 ?auto_111251 ) ) ( not ( = ?auto_111246 ?auto_111251 ) ) ( not ( = ?auto_111247 ?auto_111251 ) ) ( not ( = ?auto_111248 ?auto_111251 ) ) ( not ( = ?auto_111249 ?auto_111251 ) ) ( ON-TABLE ?auto_111250 ) ( ON ?auto_111251 ?auto_111250 ) ( not ( = ?auto_111250 ?auto_111251 ) ) ( not ( = ?auto_111250 ?auto_111249 ) ) ( not ( = ?auto_111250 ?auto_111248 ) ) ( not ( = ?auto_111245 ?auto_111250 ) ) ( not ( = ?auto_111246 ?auto_111250 ) ) ( not ( = ?auto_111247 ?auto_111250 ) ) ( ON ?auto_111245 ?auto_111252 ) ( not ( = ?auto_111245 ?auto_111252 ) ) ( not ( = ?auto_111246 ?auto_111252 ) ) ( not ( = ?auto_111247 ?auto_111252 ) ) ( not ( = ?auto_111248 ?auto_111252 ) ) ( not ( = ?auto_111249 ?auto_111252 ) ) ( not ( = ?auto_111251 ?auto_111252 ) ) ( not ( = ?auto_111250 ?auto_111252 ) ) ( ON ?auto_111246 ?auto_111245 ) ( ON-TABLE ?auto_111252 ) ( ON ?auto_111247 ?auto_111246 ) ( CLEAR ?auto_111247 ) ( HOLDING ?auto_111248 ) ( CLEAR ?auto_111249 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111250 ?auto_111251 ?auto_111249 ?auto_111248 )
      ( MAKE-5PILE ?auto_111245 ?auto_111246 ?auto_111247 ?auto_111248 ?auto_111249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111253 - BLOCK
      ?auto_111254 - BLOCK
      ?auto_111255 - BLOCK
      ?auto_111256 - BLOCK
      ?auto_111257 - BLOCK
    )
    :vars
    (
      ?auto_111260 - BLOCK
      ?auto_111259 - BLOCK
      ?auto_111258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111253 ?auto_111254 ) ) ( not ( = ?auto_111253 ?auto_111255 ) ) ( not ( = ?auto_111253 ?auto_111256 ) ) ( not ( = ?auto_111253 ?auto_111257 ) ) ( not ( = ?auto_111254 ?auto_111255 ) ) ( not ( = ?auto_111254 ?auto_111256 ) ) ( not ( = ?auto_111254 ?auto_111257 ) ) ( not ( = ?auto_111255 ?auto_111256 ) ) ( not ( = ?auto_111255 ?auto_111257 ) ) ( not ( = ?auto_111256 ?auto_111257 ) ) ( ON ?auto_111257 ?auto_111260 ) ( not ( = ?auto_111253 ?auto_111260 ) ) ( not ( = ?auto_111254 ?auto_111260 ) ) ( not ( = ?auto_111255 ?auto_111260 ) ) ( not ( = ?auto_111256 ?auto_111260 ) ) ( not ( = ?auto_111257 ?auto_111260 ) ) ( ON-TABLE ?auto_111259 ) ( ON ?auto_111260 ?auto_111259 ) ( not ( = ?auto_111259 ?auto_111260 ) ) ( not ( = ?auto_111259 ?auto_111257 ) ) ( not ( = ?auto_111259 ?auto_111256 ) ) ( not ( = ?auto_111253 ?auto_111259 ) ) ( not ( = ?auto_111254 ?auto_111259 ) ) ( not ( = ?auto_111255 ?auto_111259 ) ) ( ON ?auto_111253 ?auto_111258 ) ( not ( = ?auto_111253 ?auto_111258 ) ) ( not ( = ?auto_111254 ?auto_111258 ) ) ( not ( = ?auto_111255 ?auto_111258 ) ) ( not ( = ?auto_111256 ?auto_111258 ) ) ( not ( = ?auto_111257 ?auto_111258 ) ) ( not ( = ?auto_111260 ?auto_111258 ) ) ( not ( = ?auto_111259 ?auto_111258 ) ) ( ON ?auto_111254 ?auto_111253 ) ( ON-TABLE ?auto_111258 ) ( ON ?auto_111255 ?auto_111254 ) ( CLEAR ?auto_111257 ) ( ON ?auto_111256 ?auto_111255 ) ( CLEAR ?auto_111256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111258 ?auto_111253 ?auto_111254 ?auto_111255 )
      ( MAKE-5PILE ?auto_111253 ?auto_111254 ?auto_111255 ?auto_111256 ?auto_111257 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111261 - BLOCK
      ?auto_111262 - BLOCK
      ?auto_111263 - BLOCK
      ?auto_111264 - BLOCK
      ?auto_111265 - BLOCK
    )
    :vars
    (
      ?auto_111268 - BLOCK
      ?auto_111267 - BLOCK
      ?auto_111266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111261 ?auto_111262 ) ) ( not ( = ?auto_111261 ?auto_111263 ) ) ( not ( = ?auto_111261 ?auto_111264 ) ) ( not ( = ?auto_111261 ?auto_111265 ) ) ( not ( = ?auto_111262 ?auto_111263 ) ) ( not ( = ?auto_111262 ?auto_111264 ) ) ( not ( = ?auto_111262 ?auto_111265 ) ) ( not ( = ?auto_111263 ?auto_111264 ) ) ( not ( = ?auto_111263 ?auto_111265 ) ) ( not ( = ?auto_111264 ?auto_111265 ) ) ( not ( = ?auto_111261 ?auto_111268 ) ) ( not ( = ?auto_111262 ?auto_111268 ) ) ( not ( = ?auto_111263 ?auto_111268 ) ) ( not ( = ?auto_111264 ?auto_111268 ) ) ( not ( = ?auto_111265 ?auto_111268 ) ) ( ON-TABLE ?auto_111267 ) ( ON ?auto_111268 ?auto_111267 ) ( not ( = ?auto_111267 ?auto_111268 ) ) ( not ( = ?auto_111267 ?auto_111265 ) ) ( not ( = ?auto_111267 ?auto_111264 ) ) ( not ( = ?auto_111261 ?auto_111267 ) ) ( not ( = ?auto_111262 ?auto_111267 ) ) ( not ( = ?auto_111263 ?auto_111267 ) ) ( ON ?auto_111261 ?auto_111266 ) ( not ( = ?auto_111261 ?auto_111266 ) ) ( not ( = ?auto_111262 ?auto_111266 ) ) ( not ( = ?auto_111263 ?auto_111266 ) ) ( not ( = ?auto_111264 ?auto_111266 ) ) ( not ( = ?auto_111265 ?auto_111266 ) ) ( not ( = ?auto_111268 ?auto_111266 ) ) ( not ( = ?auto_111267 ?auto_111266 ) ) ( ON ?auto_111262 ?auto_111261 ) ( ON-TABLE ?auto_111266 ) ( ON ?auto_111263 ?auto_111262 ) ( ON ?auto_111264 ?auto_111263 ) ( CLEAR ?auto_111264 ) ( HOLDING ?auto_111265 ) ( CLEAR ?auto_111268 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111267 ?auto_111268 ?auto_111265 )
      ( MAKE-5PILE ?auto_111261 ?auto_111262 ?auto_111263 ?auto_111264 ?auto_111265 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111269 - BLOCK
      ?auto_111270 - BLOCK
      ?auto_111271 - BLOCK
      ?auto_111272 - BLOCK
      ?auto_111273 - BLOCK
    )
    :vars
    (
      ?auto_111276 - BLOCK
      ?auto_111274 - BLOCK
      ?auto_111275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111269 ?auto_111270 ) ) ( not ( = ?auto_111269 ?auto_111271 ) ) ( not ( = ?auto_111269 ?auto_111272 ) ) ( not ( = ?auto_111269 ?auto_111273 ) ) ( not ( = ?auto_111270 ?auto_111271 ) ) ( not ( = ?auto_111270 ?auto_111272 ) ) ( not ( = ?auto_111270 ?auto_111273 ) ) ( not ( = ?auto_111271 ?auto_111272 ) ) ( not ( = ?auto_111271 ?auto_111273 ) ) ( not ( = ?auto_111272 ?auto_111273 ) ) ( not ( = ?auto_111269 ?auto_111276 ) ) ( not ( = ?auto_111270 ?auto_111276 ) ) ( not ( = ?auto_111271 ?auto_111276 ) ) ( not ( = ?auto_111272 ?auto_111276 ) ) ( not ( = ?auto_111273 ?auto_111276 ) ) ( ON-TABLE ?auto_111274 ) ( ON ?auto_111276 ?auto_111274 ) ( not ( = ?auto_111274 ?auto_111276 ) ) ( not ( = ?auto_111274 ?auto_111273 ) ) ( not ( = ?auto_111274 ?auto_111272 ) ) ( not ( = ?auto_111269 ?auto_111274 ) ) ( not ( = ?auto_111270 ?auto_111274 ) ) ( not ( = ?auto_111271 ?auto_111274 ) ) ( ON ?auto_111269 ?auto_111275 ) ( not ( = ?auto_111269 ?auto_111275 ) ) ( not ( = ?auto_111270 ?auto_111275 ) ) ( not ( = ?auto_111271 ?auto_111275 ) ) ( not ( = ?auto_111272 ?auto_111275 ) ) ( not ( = ?auto_111273 ?auto_111275 ) ) ( not ( = ?auto_111276 ?auto_111275 ) ) ( not ( = ?auto_111274 ?auto_111275 ) ) ( ON ?auto_111270 ?auto_111269 ) ( ON-TABLE ?auto_111275 ) ( ON ?auto_111271 ?auto_111270 ) ( ON ?auto_111272 ?auto_111271 ) ( CLEAR ?auto_111276 ) ( ON ?auto_111273 ?auto_111272 ) ( CLEAR ?auto_111273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111275 ?auto_111269 ?auto_111270 ?auto_111271 ?auto_111272 )
      ( MAKE-5PILE ?auto_111269 ?auto_111270 ?auto_111271 ?auto_111272 ?auto_111273 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111277 - BLOCK
      ?auto_111278 - BLOCK
      ?auto_111279 - BLOCK
      ?auto_111280 - BLOCK
      ?auto_111281 - BLOCK
    )
    :vars
    (
      ?auto_111283 - BLOCK
      ?auto_111282 - BLOCK
      ?auto_111284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111277 ?auto_111278 ) ) ( not ( = ?auto_111277 ?auto_111279 ) ) ( not ( = ?auto_111277 ?auto_111280 ) ) ( not ( = ?auto_111277 ?auto_111281 ) ) ( not ( = ?auto_111278 ?auto_111279 ) ) ( not ( = ?auto_111278 ?auto_111280 ) ) ( not ( = ?auto_111278 ?auto_111281 ) ) ( not ( = ?auto_111279 ?auto_111280 ) ) ( not ( = ?auto_111279 ?auto_111281 ) ) ( not ( = ?auto_111280 ?auto_111281 ) ) ( not ( = ?auto_111277 ?auto_111283 ) ) ( not ( = ?auto_111278 ?auto_111283 ) ) ( not ( = ?auto_111279 ?auto_111283 ) ) ( not ( = ?auto_111280 ?auto_111283 ) ) ( not ( = ?auto_111281 ?auto_111283 ) ) ( ON-TABLE ?auto_111282 ) ( not ( = ?auto_111282 ?auto_111283 ) ) ( not ( = ?auto_111282 ?auto_111281 ) ) ( not ( = ?auto_111282 ?auto_111280 ) ) ( not ( = ?auto_111277 ?auto_111282 ) ) ( not ( = ?auto_111278 ?auto_111282 ) ) ( not ( = ?auto_111279 ?auto_111282 ) ) ( ON ?auto_111277 ?auto_111284 ) ( not ( = ?auto_111277 ?auto_111284 ) ) ( not ( = ?auto_111278 ?auto_111284 ) ) ( not ( = ?auto_111279 ?auto_111284 ) ) ( not ( = ?auto_111280 ?auto_111284 ) ) ( not ( = ?auto_111281 ?auto_111284 ) ) ( not ( = ?auto_111283 ?auto_111284 ) ) ( not ( = ?auto_111282 ?auto_111284 ) ) ( ON ?auto_111278 ?auto_111277 ) ( ON-TABLE ?auto_111284 ) ( ON ?auto_111279 ?auto_111278 ) ( ON ?auto_111280 ?auto_111279 ) ( ON ?auto_111281 ?auto_111280 ) ( CLEAR ?auto_111281 ) ( HOLDING ?auto_111283 ) ( CLEAR ?auto_111282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111282 ?auto_111283 )
      ( MAKE-5PILE ?auto_111277 ?auto_111278 ?auto_111279 ?auto_111280 ?auto_111281 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111285 - BLOCK
      ?auto_111286 - BLOCK
      ?auto_111287 - BLOCK
      ?auto_111288 - BLOCK
      ?auto_111289 - BLOCK
    )
    :vars
    (
      ?auto_111292 - BLOCK
      ?auto_111290 - BLOCK
      ?auto_111291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111285 ?auto_111286 ) ) ( not ( = ?auto_111285 ?auto_111287 ) ) ( not ( = ?auto_111285 ?auto_111288 ) ) ( not ( = ?auto_111285 ?auto_111289 ) ) ( not ( = ?auto_111286 ?auto_111287 ) ) ( not ( = ?auto_111286 ?auto_111288 ) ) ( not ( = ?auto_111286 ?auto_111289 ) ) ( not ( = ?auto_111287 ?auto_111288 ) ) ( not ( = ?auto_111287 ?auto_111289 ) ) ( not ( = ?auto_111288 ?auto_111289 ) ) ( not ( = ?auto_111285 ?auto_111292 ) ) ( not ( = ?auto_111286 ?auto_111292 ) ) ( not ( = ?auto_111287 ?auto_111292 ) ) ( not ( = ?auto_111288 ?auto_111292 ) ) ( not ( = ?auto_111289 ?auto_111292 ) ) ( ON-TABLE ?auto_111290 ) ( not ( = ?auto_111290 ?auto_111292 ) ) ( not ( = ?auto_111290 ?auto_111289 ) ) ( not ( = ?auto_111290 ?auto_111288 ) ) ( not ( = ?auto_111285 ?auto_111290 ) ) ( not ( = ?auto_111286 ?auto_111290 ) ) ( not ( = ?auto_111287 ?auto_111290 ) ) ( ON ?auto_111285 ?auto_111291 ) ( not ( = ?auto_111285 ?auto_111291 ) ) ( not ( = ?auto_111286 ?auto_111291 ) ) ( not ( = ?auto_111287 ?auto_111291 ) ) ( not ( = ?auto_111288 ?auto_111291 ) ) ( not ( = ?auto_111289 ?auto_111291 ) ) ( not ( = ?auto_111292 ?auto_111291 ) ) ( not ( = ?auto_111290 ?auto_111291 ) ) ( ON ?auto_111286 ?auto_111285 ) ( ON-TABLE ?auto_111291 ) ( ON ?auto_111287 ?auto_111286 ) ( ON ?auto_111288 ?auto_111287 ) ( ON ?auto_111289 ?auto_111288 ) ( CLEAR ?auto_111290 ) ( ON ?auto_111292 ?auto_111289 ) ( CLEAR ?auto_111292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111291 ?auto_111285 ?auto_111286 ?auto_111287 ?auto_111288 ?auto_111289 )
      ( MAKE-5PILE ?auto_111285 ?auto_111286 ?auto_111287 ?auto_111288 ?auto_111289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111293 - BLOCK
      ?auto_111294 - BLOCK
      ?auto_111295 - BLOCK
      ?auto_111296 - BLOCK
      ?auto_111297 - BLOCK
    )
    :vars
    (
      ?auto_111299 - BLOCK
      ?auto_111300 - BLOCK
      ?auto_111298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111293 ?auto_111294 ) ) ( not ( = ?auto_111293 ?auto_111295 ) ) ( not ( = ?auto_111293 ?auto_111296 ) ) ( not ( = ?auto_111293 ?auto_111297 ) ) ( not ( = ?auto_111294 ?auto_111295 ) ) ( not ( = ?auto_111294 ?auto_111296 ) ) ( not ( = ?auto_111294 ?auto_111297 ) ) ( not ( = ?auto_111295 ?auto_111296 ) ) ( not ( = ?auto_111295 ?auto_111297 ) ) ( not ( = ?auto_111296 ?auto_111297 ) ) ( not ( = ?auto_111293 ?auto_111299 ) ) ( not ( = ?auto_111294 ?auto_111299 ) ) ( not ( = ?auto_111295 ?auto_111299 ) ) ( not ( = ?auto_111296 ?auto_111299 ) ) ( not ( = ?auto_111297 ?auto_111299 ) ) ( not ( = ?auto_111300 ?auto_111299 ) ) ( not ( = ?auto_111300 ?auto_111297 ) ) ( not ( = ?auto_111300 ?auto_111296 ) ) ( not ( = ?auto_111293 ?auto_111300 ) ) ( not ( = ?auto_111294 ?auto_111300 ) ) ( not ( = ?auto_111295 ?auto_111300 ) ) ( ON ?auto_111293 ?auto_111298 ) ( not ( = ?auto_111293 ?auto_111298 ) ) ( not ( = ?auto_111294 ?auto_111298 ) ) ( not ( = ?auto_111295 ?auto_111298 ) ) ( not ( = ?auto_111296 ?auto_111298 ) ) ( not ( = ?auto_111297 ?auto_111298 ) ) ( not ( = ?auto_111299 ?auto_111298 ) ) ( not ( = ?auto_111300 ?auto_111298 ) ) ( ON ?auto_111294 ?auto_111293 ) ( ON-TABLE ?auto_111298 ) ( ON ?auto_111295 ?auto_111294 ) ( ON ?auto_111296 ?auto_111295 ) ( ON ?auto_111297 ?auto_111296 ) ( ON ?auto_111299 ?auto_111297 ) ( CLEAR ?auto_111299 ) ( HOLDING ?auto_111300 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111300 )
      ( MAKE-5PILE ?auto_111293 ?auto_111294 ?auto_111295 ?auto_111296 ?auto_111297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111301 - BLOCK
      ?auto_111302 - BLOCK
      ?auto_111303 - BLOCK
      ?auto_111304 - BLOCK
      ?auto_111305 - BLOCK
    )
    :vars
    (
      ?auto_111307 - BLOCK
      ?auto_111308 - BLOCK
      ?auto_111306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111301 ?auto_111302 ) ) ( not ( = ?auto_111301 ?auto_111303 ) ) ( not ( = ?auto_111301 ?auto_111304 ) ) ( not ( = ?auto_111301 ?auto_111305 ) ) ( not ( = ?auto_111302 ?auto_111303 ) ) ( not ( = ?auto_111302 ?auto_111304 ) ) ( not ( = ?auto_111302 ?auto_111305 ) ) ( not ( = ?auto_111303 ?auto_111304 ) ) ( not ( = ?auto_111303 ?auto_111305 ) ) ( not ( = ?auto_111304 ?auto_111305 ) ) ( not ( = ?auto_111301 ?auto_111307 ) ) ( not ( = ?auto_111302 ?auto_111307 ) ) ( not ( = ?auto_111303 ?auto_111307 ) ) ( not ( = ?auto_111304 ?auto_111307 ) ) ( not ( = ?auto_111305 ?auto_111307 ) ) ( not ( = ?auto_111308 ?auto_111307 ) ) ( not ( = ?auto_111308 ?auto_111305 ) ) ( not ( = ?auto_111308 ?auto_111304 ) ) ( not ( = ?auto_111301 ?auto_111308 ) ) ( not ( = ?auto_111302 ?auto_111308 ) ) ( not ( = ?auto_111303 ?auto_111308 ) ) ( ON ?auto_111301 ?auto_111306 ) ( not ( = ?auto_111301 ?auto_111306 ) ) ( not ( = ?auto_111302 ?auto_111306 ) ) ( not ( = ?auto_111303 ?auto_111306 ) ) ( not ( = ?auto_111304 ?auto_111306 ) ) ( not ( = ?auto_111305 ?auto_111306 ) ) ( not ( = ?auto_111307 ?auto_111306 ) ) ( not ( = ?auto_111308 ?auto_111306 ) ) ( ON ?auto_111302 ?auto_111301 ) ( ON-TABLE ?auto_111306 ) ( ON ?auto_111303 ?auto_111302 ) ( ON ?auto_111304 ?auto_111303 ) ( ON ?auto_111305 ?auto_111304 ) ( ON ?auto_111307 ?auto_111305 ) ( ON ?auto_111308 ?auto_111307 ) ( CLEAR ?auto_111308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111306 ?auto_111301 ?auto_111302 ?auto_111303 ?auto_111304 ?auto_111305 ?auto_111307 )
      ( MAKE-5PILE ?auto_111301 ?auto_111302 ?auto_111303 ?auto_111304 ?auto_111305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111320 - BLOCK
    )
    :vars
    (
      ?auto_111323 - BLOCK
      ?auto_111322 - BLOCK
      ?auto_111321 - BLOCK
      ?auto_111325 - BLOCK
      ?auto_111324 - BLOCK
      ?auto_111326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111323 ?auto_111320 ) ( ON-TABLE ?auto_111320 ) ( not ( = ?auto_111320 ?auto_111323 ) ) ( not ( = ?auto_111320 ?auto_111322 ) ) ( not ( = ?auto_111320 ?auto_111321 ) ) ( not ( = ?auto_111323 ?auto_111322 ) ) ( not ( = ?auto_111323 ?auto_111321 ) ) ( not ( = ?auto_111322 ?auto_111321 ) ) ( ON ?auto_111322 ?auto_111323 ) ( CLEAR ?auto_111322 ) ( HOLDING ?auto_111321 ) ( CLEAR ?auto_111325 ) ( ON-TABLE ?auto_111324 ) ( ON ?auto_111326 ?auto_111324 ) ( ON ?auto_111325 ?auto_111326 ) ( not ( = ?auto_111324 ?auto_111326 ) ) ( not ( = ?auto_111324 ?auto_111325 ) ) ( not ( = ?auto_111324 ?auto_111321 ) ) ( not ( = ?auto_111326 ?auto_111325 ) ) ( not ( = ?auto_111326 ?auto_111321 ) ) ( not ( = ?auto_111325 ?auto_111321 ) ) ( not ( = ?auto_111320 ?auto_111325 ) ) ( not ( = ?auto_111320 ?auto_111324 ) ) ( not ( = ?auto_111320 ?auto_111326 ) ) ( not ( = ?auto_111323 ?auto_111325 ) ) ( not ( = ?auto_111323 ?auto_111324 ) ) ( not ( = ?auto_111323 ?auto_111326 ) ) ( not ( = ?auto_111322 ?auto_111325 ) ) ( not ( = ?auto_111322 ?auto_111324 ) ) ( not ( = ?auto_111322 ?auto_111326 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111324 ?auto_111326 ?auto_111325 ?auto_111321 )
      ( MAKE-1PILE ?auto_111320 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111327 - BLOCK
    )
    :vars
    (
      ?auto_111333 - BLOCK
      ?auto_111332 - BLOCK
      ?auto_111331 - BLOCK
      ?auto_111329 - BLOCK
      ?auto_111328 - BLOCK
      ?auto_111330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111333 ?auto_111327 ) ( ON-TABLE ?auto_111327 ) ( not ( = ?auto_111327 ?auto_111333 ) ) ( not ( = ?auto_111327 ?auto_111332 ) ) ( not ( = ?auto_111327 ?auto_111331 ) ) ( not ( = ?auto_111333 ?auto_111332 ) ) ( not ( = ?auto_111333 ?auto_111331 ) ) ( not ( = ?auto_111332 ?auto_111331 ) ) ( ON ?auto_111332 ?auto_111333 ) ( CLEAR ?auto_111329 ) ( ON-TABLE ?auto_111328 ) ( ON ?auto_111330 ?auto_111328 ) ( ON ?auto_111329 ?auto_111330 ) ( not ( = ?auto_111328 ?auto_111330 ) ) ( not ( = ?auto_111328 ?auto_111329 ) ) ( not ( = ?auto_111328 ?auto_111331 ) ) ( not ( = ?auto_111330 ?auto_111329 ) ) ( not ( = ?auto_111330 ?auto_111331 ) ) ( not ( = ?auto_111329 ?auto_111331 ) ) ( not ( = ?auto_111327 ?auto_111329 ) ) ( not ( = ?auto_111327 ?auto_111328 ) ) ( not ( = ?auto_111327 ?auto_111330 ) ) ( not ( = ?auto_111333 ?auto_111329 ) ) ( not ( = ?auto_111333 ?auto_111328 ) ) ( not ( = ?auto_111333 ?auto_111330 ) ) ( not ( = ?auto_111332 ?auto_111329 ) ) ( not ( = ?auto_111332 ?auto_111328 ) ) ( not ( = ?auto_111332 ?auto_111330 ) ) ( ON ?auto_111331 ?auto_111332 ) ( CLEAR ?auto_111331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111327 ?auto_111333 ?auto_111332 )
      ( MAKE-1PILE ?auto_111327 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111334 - BLOCK
    )
    :vars
    (
      ?auto_111340 - BLOCK
      ?auto_111338 - BLOCK
      ?auto_111335 - BLOCK
      ?auto_111339 - BLOCK
      ?auto_111337 - BLOCK
      ?auto_111336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111340 ?auto_111334 ) ( ON-TABLE ?auto_111334 ) ( not ( = ?auto_111334 ?auto_111340 ) ) ( not ( = ?auto_111334 ?auto_111338 ) ) ( not ( = ?auto_111334 ?auto_111335 ) ) ( not ( = ?auto_111340 ?auto_111338 ) ) ( not ( = ?auto_111340 ?auto_111335 ) ) ( not ( = ?auto_111338 ?auto_111335 ) ) ( ON ?auto_111338 ?auto_111340 ) ( ON-TABLE ?auto_111339 ) ( ON ?auto_111337 ?auto_111339 ) ( not ( = ?auto_111339 ?auto_111337 ) ) ( not ( = ?auto_111339 ?auto_111336 ) ) ( not ( = ?auto_111339 ?auto_111335 ) ) ( not ( = ?auto_111337 ?auto_111336 ) ) ( not ( = ?auto_111337 ?auto_111335 ) ) ( not ( = ?auto_111336 ?auto_111335 ) ) ( not ( = ?auto_111334 ?auto_111336 ) ) ( not ( = ?auto_111334 ?auto_111339 ) ) ( not ( = ?auto_111334 ?auto_111337 ) ) ( not ( = ?auto_111340 ?auto_111336 ) ) ( not ( = ?auto_111340 ?auto_111339 ) ) ( not ( = ?auto_111340 ?auto_111337 ) ) ( not ( = ?auto_111338 ?auto_111336 ) ) ( not ( = ?auto_111338 ?auto_111339 ) ) ( not ( = ?auto_111338 ?auto_111337 ) ) ( ON ?auto_111335 ?auto_111338 ) ( CLEAR ?auto_111335 ) ( HOLDING ?auto_111336 ) ( CLEAR ?auto_111337 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111339 ?auto_111337 ?auto_111336 )
      ( MAKE-1PILE ?auto_111334 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111341 - BLOCK
    )
    :vars
    (
      ?auto_111345 - BLOCK
      ?auto_111347 - BLOCK
      ?auto_111342 - BLOCK
      ?auto_111343 - BLOCK
      ?auto_111346 - BLOCK
      ?auto_111344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111345 ?auto_111341 ) ( ON-TABLE ?auto_111341 ) ( not ( = ?auto_111341 ?auto_111345 ) ) ( not ( = ?auto_111341 ?auto_111347 ) ) ( not ( = ?auto_111341 ?auto_111342 ) ) ( not ( = ?auto_111345 ?auto_111347 ) ) ( not ( = ?auto_111345 ?auto_111342 ) ) ( not ( = ?auto_111347 ?auto_111342 ) ) ( ON ?auto_111347 ?auto_111345 ) ( ON-TABLE ?auto_111343 ) ( ON ?auto_111346 ?auto_111343 ) ( not ( = ?auto_111343 ?auto_111346 ) ) ( not ( = ?auto_111343 ?auto_111344 ) ) ( not ( = ?auto_111343 ?auto_111342 ) ) ( not ( = ?auto_111346 ?auto_111344 ) ) ( not ( = ?auto_111346 ?auto_111342 ) ) ( not ( = ?auto_111344 ?auto_111342 ) ) ( not ( = ?auto_111341 ?auto_111344 ) ) ( not ( = ?auto_111341 ?auto_111343 ) ) ( not ( = ?auto_111341 ?auto_111346 ) ) ( not ( = ?auto_111345 ?auto_111344 ) ) ( not ( = ?auto_111345 ?auto_111343 ) ) ( not ( = ?auto_111345 ?auto_111346 ) ) ( not ( = ?auto_111347 ?auto_111344 ) ) ( not ( = ?auto_111347 ?auto_111343 ) ) ( not ( = ?auto_111347 ?auto_111346 ) ) ( ON ?auto_111342 ?auto_111347 ) ( CLEAR ?auto_111346 ) ( ON ?auto_111344 ?auto_111342 ) ( CLEAR ?auto_111344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111341 ?auto_111345 ?auto_111347 ?auto_111342 )
      ( MAKE-1PILE ?auto_111341 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111348 - BLOCK
    )
    :vars
    (
      ?auto_111352 - BLOCK
      ?auto_111354 - BLOCK
      ?auto_111353 - BLOCK
      ?auto_111350 - BLOCK
      ?auto_111349 - BLOCK
      ?auto_111351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111352 ?auto_111348 ) ( ON-TABLE ?auto_111348 ) ( not ( = ?auto_111348 ?auto_111352 ) ) ( not ( = ?auto_111348 ?auto_111354 ) ) ( not ( = ?auto_111348 ?auto_111353 ) ) ( not ( = ?auto_111352 ?auto_111354 ) ) ( not ( = ?auto_111352 ?auto_111353 ) ) ( not ( = ?auto_111354 ?auto_111353 ) ) ( ON ?auto_111354 ?auto_111352 ) ( ON-TABLE ?auto_111350 ) ( not ( = ?auto_111350 ?auto_111349 ) ) ( not ( = ?auto_111350 ?auto_111351 ) ) ( not ( = ?auto_111350 ?auto_111353 ) ) ( not ( = ?auto_111349 ?auto_111351 ) ) ( not ( = ?auto_111349 ?auto_111353 ) ) ( not ( = ?auto_111351 ?auto_111353 ) ) ( not ( = ?auto_111348 ?auto_111351 ) ) ( not ( = ?auto_111348 ?auto_111350 ) ) ( not ( = ?auto_111348 ?auto_111349 ) ) ( not ( = ?auto_111352 ?auto_111351 ) ) ( not ( = ?auto_111352 ?auto_111350 ) ) ( not ( = ?auto_111352 ?auto_111349 ) ) ( not ( = ?auto_111354 ?auto_111351 ) ) ( not ( = ?auto_111354 ?auto_111350 ) ) ( not ( = ?auto_111354 ?auto_111349 ) ) ( ON ?auto_111353 ?auto_111354 ) ( ON ?auto_111351 ?auto_111353 ) ( CLEAR ?auto_111351 ) ( HOLDING ?auto_111349 ) ( CLEAR ?auto_111350 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111350 ?auto_111349 )
      ( MAKE-1PILE ?auto_111348 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111355 - BLOCK
    )
    :vars
    (
      ?auto_111359 - BLOCK
      ?auto_111358 - BLOCK
      ?auto_111356 - BLOCK
      ?auto_111361 - BLOCK
      ?auto_111357 - BLOCK
      ?auto_111360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111359 ?auto_111355 ) ( ON-TABLE ?auto_111355 ) ( not ( = ?auto_111355 ?auto_111359 ) ) ( not ( = ?auto_111355 ?auto_111358 ) ) ( not ( = ?auto_111355 ?auto_111356 ) ) ( not ( = ?auto_111359 ?auto_111358 ) ) ( not ( = ?auto_111359 ?auto_111356 ) ) ( not ( = ?auto_111358 ?auto_111356 ) ) ( ON ?auto_111358 ?auto_111359 ) ( ON-TABLE ?auto_111361 ) ( not ( = ?auto_111361 ?auto_111357 ) ) ( not ( = ?auto_111361 ?auto_111360 ) ) ( not ( = ?auto_111361 ?auto_111356 ) ) ( not ( = ?auto_111357 ?auto_111360 ) ) ( not ( = ?auto_111357 ?auto_111356 ) ) ( not ( = ?auto_111360 ?auto_111356 ) ) ( not ( = ?auto_111355 ?auto_111360 ) ) ( not ( = ?auto_111355 ?auto_111361 ) ) ( not ( = ?auto_111355 ?auto_111357 ) ) ( not ( = ?auto_111359 ?auto_111360 ) ) ( not ( = ?auto_111359 ?auto_111361 ) ) ( not ( = ?auto_111359 ?auto_111357 ) ) ( not ( = ?auto_111358 ?auto_111360 ) ) ( not ( = ?auto_111358 ?auto_111361 ) ) ( not ( = ?auto_111358 ?auto_111357 ) ) ( ON ?auto_111356 ?auto_111358 ) ( ON ?auto_111360 ?auto_111356 ) ( CLEAR ?auto_111361 ) ( ON ?auto_111357 ?auto_111360 ) ( CLEAR ?auto_111357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111355 ?auto_111359 ?auto_111358 ?auto_111356 ?auto_111360 )
      ( MAKE-1PILE ?auto_111355 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111362 - BLOCK
    )
    :vars
    (
      ?auto_111368 - BLOCK
      ?auto_111366 - BLOCK
      ?auto_111367 - BLOCK
      ?auto_111365 - BLOCK
      ?auto_111364 - BLOCK
      ?auto_111363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111368 ?auto_111362 ) ( ON-TABLE ?auto_111362 ) ( not ( = ?auto_111362 ?auto_111368 ) ) ( not ( = ?auto_111362 ?auto_111366 ) ) ( not ( = ?auto_111362 ?auto_111367 ) ) ( not ( = ?auto_111368 ?auto_111366 ) ) ( not ( = ?auto_111368 ?auto_111367 ) ) ( not ( = ?auto_111366 ?auto_111367 ) ) ( ON ?auto_111366 ?auto_111368 ) ( not ( = ?auto_111365 ?auto_111364 ) ) ( not ( = ?auto_111365 ?auto_111363 ) ) ( not ( = ?auto_111365 ?auto_111367 ) ) ( not ( = ?auto_111364 ?auto_111363 ) ) ( not ( = ?auto_111364 ?auto_111367 ) ) ( not ( = ?auto_111363 ?auto_111367 ) ) ( not ( = ?auto_111362 ?auto_111363 ) ) ( not ( = ?auto_111362 ?auto_111365 ) ) ( not ( = ?auto_111362 ?auto_111364 ) ) ( not ( = ?auto_111368 ?auto_111363 ) ) ( not ( = ?auto_111368 ?auto_111365 ) ) ( not ( = ?auto_111368 ?auto_111364 ) ) ( not ( = ?auto_111366 ?auto_111363 ) ) ( not ( = ?auto_111366 ?auto_111365 ) ) ( not ( = ?auto_111366 ?auto_111364 ) ) ( ON ?auto_111367 ?auto_111366 ) ( ON ?auto_111363 ?auto_111367 ) ( ON ?auto_111364 ?auto_111363 ) ( CLEAR ?auto_111364 ) ( HOLDING ?auto_111365 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111365 )
      ( MAKE-1PILE ?auto_111362 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111377 - BLOCK
    )
    :vars
    (
      ?auto_111381 - BLOCK
      ?auto_111379 - BLOCK
      ?auto_111380 - BLOCK
      ?auto_111383 - BLOCK
      ?auto_111382 - BLOCK
      ?auto_111378 - BLOCK
      ?auto_111384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111381 ?auto_111377 ) ( ON-TABLE ?auto_111377 ) ( not ( = ?auto_111377 ?auto_111381 ) ) ( not ( = ?auto_111377 ?auto_111379 ) ) ( not ( = ?auto_111377 ?auto_111380 ) ) ( not ( = ?auto_111381 ?auto_111379 ) ) ( not ( = ?auto_111381 ?auto_111380 ) ) ( not ( = ?auto_111379 ?auto_111380 ) ) ( ON ?auto_111379 ?auto_111381 ) ( not ( = ?auto_111383 ?auto_111382 ) ) ( not ( = ?auto_111383 ?auto_111378 ) ) ( not ( = ?auto_111383 ?auto_111380 ) ) ( not ( = ?auto_111382 ?auto_111378 ) ) ( not ( = ?auto_111382 ?auto_111380 ) ) ( not ( = ?auto_111378 ?auto_111380 ) ) ( not ( = ?auto_111377 ?auto_111378 ) ) ( not ( = ?auto_111377 ?auto_111383 ) ) ( not ( = ?auto_111377 ?auto_111382 ) ) ( not ( = ?auto_111381 ?auto_111378 ) ) ( not ( = ?auto_111381 ?auto_111383 ) ) ( not ( = ?auto_111381 ?auto_111382 ) ) ( not ( = ?auto_111379 ?auto_111378 ) ) ( not ( = ?auto_111379 ?auto_111383 ) ) ( not ( = ?auto_111379 ?auto_111382 ) ) ( ON ?auto_111380 ?auto_111379 ) ( ON ?auto_111378 ?auto_111380 ) ( ON ?auto_111382 ?auto_111378 ) ( CLEAR ?auto_111382 ) ( ON ?auto_111383 ?auto_111384 ) ( CLEAR ?auto_111383 ) ( HAND-EMPTY ) ( not ( = ?auto_111377 ?auto_111384 ) ) ( not ( = ?auto_111381 ?auto_111384 ) ) ( not ( = ?auto_111379 ?auto_111384 ) ) ( not ( = ?auto_111380 ?auto_111384 ) ) ( not ( = ?auto_111383 ?auto_111384 ) ) ( not ( = ?auto_111382 ?auto_111384 ) ) ( not ( = ?auto_111378 ?auto_111384 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111383 ?auto_111384 )
      ( MAKE-1PILE ?auto_111377 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111385 - BLOCK
    )
    :vars
    (
      ?auto_111389 - BLOCK
      ?auto_111392 - BLOCK
      ?auto_111391 - BLOCK
      ?auto_111390 - BLOCK
      ?auto_111386 - BLOCK
      ?auto_111388 - BLOCK
      ?auto_111387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111389 ?auto_111385 ) ( ON-TABLE ?auto_111385 ) ( not ( = ?auto_111385 ?auto_111389 ) ) ( not ( = ?auto_111385 ?auto_111392 ) ) ( not ( = ?auto_111385 ?auto_111391 ) ) ( not ( = ?auto_111389 ?auto_111392 ) ) ( not ( = ?auto_111389 ?auto_111391 ) ) ( not ( = ?auto_111392 ?auto_111391 ) ) ( ON ?auto_111392 ?auto_111389 ) ( not ( = ?auto_111390 ?auto_111386 ) ) ( not ( = ?auto_111390 ?auto_111388 ) ) ( not ( = ?auto_111390 ?auto_111391 ) ) ( not ( = ?auto_111386 ?auto_111388 ) ) ( not ( = ?auto_111386 ?auto_111391 ) ) ( not ( = ?auto_111388 ?auto_111391 ) ) ( not ( = ?auto_111385 ?auto_111388 ) ) ( not ( = ?auto_111385 ?auto_111390 ) ) ( not ( = ?auto_111385 ?auto_111386 ) ) ( not ( = ?auto_111389 ?auto_111388 ) ) ( not ( = ?auto_111389 ?auto_111390 ) ) ( not ( = ?auto_111389 ?auto_111386 ) ) ( not ( = ?auto_111392 ?auto_111388 ) ) ( not ( = ?auto_111392 ?auto_111390 ) ) ( not ( = ?auto_111392 ?auto_111386 ) ) ( ON ?auto_111391 ?auto_111392 ) ( ON ?auto_111388 ?auto_111391 ) ( ON ?auto_111390 ?auto_111387 ) ( CLEAR ?auto_111390 ) ( not ( = ?auto_111385 ?auto_111387 ) ) ( not ( = ?auto_111389 ?auto_111387 ) ) ( not ( = ?auto_111392 ?auto_111387 ) ) ( not ( = ?auto_111391 ?auto_111387 ) ) ( not ( = ?auto_111390 ?auto_111387 ) ) ( not ( = ?auto_111386 ?auto_111387 ) ) ( not ( = ?auto_111388 ?auto_111387 ) ) ( HOLDING ?auto_111386 ) ( CLEAR ?auto_111388 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111385 ?auto_111389 ?auto_111392 ?auto_111391 ?auto_111388 ?auto_111386 )
      ( MAKE-1PILE ?auto_111385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111393 - BLOCK
    )
    :vars
    (
      ?auto_111400 - BLOCK
      ?auto_111394 - BLOCK
      ?auto_111395 - BLOCK
      ?auto_111399 - BLOCK
      ?auto_111397 - BLOCK
      ?auto_111398 - BLOCK
      ?auto_111396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111400 ?auto_111393 ) ( ON-TABLE ?auto_111393 ) ( not ( = ?auto_111393 ?auto_111400 ) ) ( not ( = ?auto_111393 ?auto_111394 ) ) ( not ( = ?auto_111393 ?auto_111395 ) ) ( not ( = ?auto_111400 ?auto_111394 ) ) ( not ( = ?auto_111400 ?auto_111395 ) ) ( not ( = ?auto_111394 ?auto_111395 ) ) ( ON ?auto_111394 ?auto_111400 ) ( not ( = ?auto_111399 ?auto_111397 ) ) ( not ( = ?auto_111399 ?auto_111398 ) ) ( not ( = ?auto_111399 ?auto_111395 ) ) ( not ( = ?auto_111397 ?auto_111398 ) ) ( not ( = ?auto_111397 ?auto_111395 ) ) ( not ( = ?auto_111398 ?auto_111395 ) ) ( not ( = ?auto_111393 ?auto_111398 ) ) ( not ( = ?auto_111393 ?auto_111399 ) ) ( not ( = ?auto_111393 ?auto_111397 ) ) ( not ( = ?auto_111400 ?auto_111398 ) ) ( not ( = ?auto_111400 ?auto_111399 ) ) ( not ( = ?auto_111400 ?auto_111397 ) ) ( not ( = ?auto_111394 ?auto_111398 ) ) ( not ( = ?auto_111394 ?auto_111399 ) ) ( not ( = ?auto_111394 ?auto_111397 ) ) ( ON ?auto_111395 ?auto_111394 ) ( ON ?auto_111398 ?auto_111395 ) ( ON ?auto_111399 ?auto_111396 ) ( not ( = ?auto_111393 ?auto_111396 ) ) ( not ( = ?auto_111400 ?auto_111396 ) ) ( not ( = ?auto_111394 ?auto_111396 ) ) ( not ( = ?auto_111395 ?auto_111396 ) ) ( not ( = ?auto_111399 ?auto_111396 ) ) ( not ( = ?auto_111397 ?auto_111396 ) ) ( not ( = ?auto_111398 ?auto_111396 ) ) ( CLEAR ?auto_111398 ) ( ON ?auto_111397 ?auto_111399 ) ( CLEAR ?auto_111397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111396 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111396 ?auto_111399 )
      ( MAKE-1PILE ?auto_111393 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111401 - BLOCK
    )
    :vars
    (
      ?auto_111403 - BLOCK
      ?auto_111405 - BLOCK
      ?auto_111402 - BLOCK
      ?auto_111406 - BLOCK
      ?auto_111404 - BLOCK
      ?auto_111407 - BLOCK
      ?auto_111408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111403 ?auto_111401 ) ( ON-TABLE ?auto_111401 ) ( not ( = ?auto_111401 ?auto_111403 ) ) ( not ( = ?auto_111401 ?auto_111405 ) ) ( not ( = ?auto_111401 ?auto_111402 ) ) ( not ( = ?auto_111403 ?auto_111405 ) ) ( not ( = ?auto_111403 ?auto_111402 ) ) ( not ( = ?auto_111405 ?auto_111402 ) ) ( ON ?auto_111405 ?auto_111403 ) ( not ( = ?auto_111406 ?auto_111404 ) ) ( not ( = ?auto_111406 ?auto_111407 ) ) ( not ( = ?auto_111406 ?auto_111402 ) ) ( not ( = ?auto_111404 ?auto_111407 ) ) ( not ( = ?auto_111404 ?auto_111402 ) ) ( not ( = ?auto_111407 ?auto_111402 ) ) ( not ( = ?auto_111401 ?auto_111407 ) ) ( not ( = ?auto_111401 ?auto_111406 ) ) ( not ( = ?auto_111401 ?auto_111404 ) ) ( not ( = ?auto_111403 ?auto_111407 ) ) ( not ( = ?auto_111403 ?auto_111406 ) ) ( not ( = ?auto_111403 ?auto_111404 ) ) ( not ( = ?auto_111405 ?auto_111407 ) ) ( not ( = ?auto_111405 ?auto_111406 ) ) ( not ( = ?auto_111405 ?auto_111404 ) ) ( ON ?auto_111402 ?auto_111405 ) ( ON ?auto_111406 ?auto_111408 ) ( not ( = ?auto_111401 ?auto_111408 ) ) ( not ( = ?auto_111403 ?auto_111408 ) ) ( not ( = ?auto_111405 ?auto_111408 ) ) ( not ( = ?auto_111402 ?auto_111408 ) ) ( not ( = ?auto_111406 ?auto_111408 ) ) ( not ( = ?auto_111404 ?auto_111408 ) ) ( not ( = ?auto_111407 ?auto_111408 ) ) ( ON ?auto_111404 ?auto_111406 ) ( CLEAR ?auto_111404 ) ( ON-TABLE ?auto_111408 ) ( HOLDING ?auto_111407 ) ( CLEAR ?auto_111402 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111401 ?auto_111403 ?auto_111405 ?auto_111402 ?auto_111407 )
      ( MAKE-1PILE ?auto_111401 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111447 - BLOCK
      ?auto_111448 - BLOCK
      ?auto_111449 - BLOCK
      ?auto_111450 - BLOCK
      ?auto_111451 - BLOCK
      ?auto_111452 - BLOCK
    )
    :vars
    (
      ?auto_111453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111447 ) ( ON ?auto_111448 ?auto_111447 ) ( ON ?auto_111449 ?auto_111448 ) ( ON ?auto_111450 ?auto_111449 ) ( not ( = ?auto_111447 ?auto_111448 ) ) ( not ( = ?auto_111447 ?auto_111449 ) ) ( not ( = ?auto_111447 ?auto_111450 ) ) ( not ( = ?auto_111447 ?auto_111451 ) ) ( not ( = ?auto_111447 ?auto_111452 ) ) ( not ( = ?auto_111448 ?auto_111449 ) ) ( not ( = ?auto_111448 ?auto_111450 ) ) ( not ( = ?auto_111448 ?auto_111451 ) ) ( not ( = ?auto_111448 ?auto_111452 ) ) ( not ( = ?auto_111449 ?auto_111450 ) ) ( not ( = ?auto_111449 ?auto_111451 ) ) ( not ( = ?auto_111449 ?auto_111452 ) ) ( not ( = ?auto_111450 ?auto_111451 ) ) ( not ( = ?auto_111450 ?auto_111452 ) ) ( not ( = ?auto_111451 ?auto_111452 ) ) ( ON ?auto_111452 ?auto_111453 ) ( not ( = ?auto_111447 ?auto_111453 ) ) ( not ( = ?auto_111448 ?auto_111453 ) ) ( not ( = ?auto_111449 ?auto_111453 ) ) ( not ( = ?auto_111450 ?auto_111453 ) ) ( not ( = ?auto_111451 ?auto_111453 ) ) ( not ( = ?auto_111452 ?auto_111453 ) ) ( CLEAR ?auto_111450 ) ( ON ?auto_111451 ?auto_111452 ) ( CLEAR ?auto_111451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111453 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111453 ?auto_111452 )
      ( MAKE-6PILE ?auto_111447 ?auto_111448 ?auto_111449 ?auto_111450 ?auto_111451 ?auto_111452 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111454 - BLOCK
      ?auto_111455 - BLOCK
      ?auto_111456 - BLOCK
      ?auto_111457 - BLOCK
      ?auto_111458 - BLOCK
      ?auto_111459 - BLOCK
    )
    :vars
    (
      ?auto_111460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111454 ) ( ON ?auto_111455 ?auto_111454 ) ( ON ?auto_111456 ?auto_111455 ) ( not ( = ?auto_111454 ?auto_111455 ) ) ( not ( = ?auto_111454 ?auto_111456 ) ) ( not ( = ?auto_111454 ?auto_111457 ) ) ( not ( = ?auto_111454 ?auto_111458 ) ) ( not ( = ?auto_111454 ?auto_111459 ) ) ( not ( = ?auto_111455 ?auto_111456 ) ) ( not ( = ?auto_111455 ?auto_111457 ) ) ( not ( = ?auto_111455 ?auto_111458 ) ) ( not ( = ?auto_111455 ?auto_111459 ) ) ( not ( = ?auto_111456 ?auto_111457 ) ) ( not ( = ?auto_111456 ?auto_111458 ) ) ( not ( = ?auto_111456 ?auto_111459 ) ) ( not ( = ?auto_111457 ?auto_111458 ) ) ( not ( = ?auto_111457 ?auto_111459 ) ) ( not ( = ?auto_111458 ?auto_111459 ) ) ( ON ?auto_111459 ?auto_111460 ) ( not ( = ?auto_111454 ?auto_111460 ) ) ( not ( = ?auto_111455 ?auto_111460 ) ) ( not ( = ?auto_111456 ?auto_111460 ) ) ( not ( = ?auto_111457 ?auto_111460 ) ) ( not ( = ?auto_111458 ?auto_111460 ) ) ( not ( = ?auto_111459 ?auto_111460 ) ) ( ON ?auto_111458 ?auto_111459 ) ( CLEAR ?auto_111458 ) ( ON-TABLE ?auto_111460 ) ( HOLDING ?auto_111457 ) ( CLEAR ?auto_111456 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111454 ?auto_111455 ?auto_111456 ?auto_111457 )
      ( MAKE-6PILE ?auto_111454 ?auto_111455 ?auto_111456 ?auto_111457 ?auto_111458 ?auto_111459 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111461 - BLOCK
      ?auto_111462 - BLOCK
      ?auto_111463 - BLOCK
      ?auto_111464 - BLOCK
      ?auto_111465 - BLOCK
      ?auto_111466 - BLOCK
    )
    :vars
    (
      ?auto_111467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111461 ) ( ON ?auto_111462 ?auto_111461 ) ( ON ?auto_111463 ?auto_111462 ) ( not ( = ?auto_111461 ?auto_111462 ) ) ( not ( = ?auto_111461 ?auto_111463 ) ) ( not ( = ?auto_111461 ?auto_111464 ) ) ( not ( = ?auto_111461 ?auto_111465 ) ) ( not ( = ?auto_111461 ?auto_111466 ) ) ( not ( = ?auto_111462 ?auto_111463 ) ) ( not ( = ?auto_111462 ?auto_111464 ) ) ( not ( = ?auto_111462 ?auto_111465 ) ) ( not ( = ?auto_111462 ?auto_111466 ) ) ( not ( = ?auto_111463 ?auto_111464 ) ) ( not ( = ?auto_111463 ?auto_111465 ) ) ( not ( = ?auto_111463 ?auto_111466 ) ) ( not ( = ?auto_111464 ?auto_111465 ) ) ( not ( = ?auto_111464 ?auto_111466 ) ) ( not ( = ?auto_111465 ?auto_111466 ) ) ( ON ?auto_111466 ?auto_111467 ) ( not ( = ?auto_111461 ?auto_111467 ) ) ( not ( = ?auto_111462 ?auto_111467 ) ) ( not ( = ?auto_111463 ?auto_111467 ) ) ( not ( = ?auto_111464 ?auto_111467 ) ) ( not ( = ?auto_111465 ?auto_111467 ) ) ( not ( = ?auto_111466 ?auto_111467 ) ) ( ON ?auto_111465 ?auto_111466 ) ( ON-TABLE ?auto_111467 ) ( CLEAR ?auto_111463 ) ( ON ?auto_111464 ?auto_111465 ) ( CLEAR ?auto_111464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111467 ?auto_111466 ?auto_111465 )
      ( MAKE-6PILE ?auto_111461 ?auto_111462 ?auto_111463 ?auto_111464 ?auto_111465 ?auto_111466 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111468 - BLOCK
      ?auto_111469 - BLOCK
      ?auto_111470 - BLOCK
      ?auto_111471 - BLOCK
      ?auto_111472 - BLOCK
      ?auto_111473 - BLOCK
    )
    :vars
    (
      ?auto_111474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111468 ) ( ON ?auto_111469 ?auto_111468 ) ( not ( = ?auto_111468 ?auto_111469 ) ) ( not ( = ?auto_111468 ?auto_111470 ) ) ( not ( = ?auto_111468 ?auto_111471 ) ) ( not ( = ?auto_111468 ?auto_111472 ) ) ( not ( = ?auto_111468 ?auto_111473 ) ) ( not ( = ?auto_111469 ?auto_111470 ) ) ( not ( = ?auto_111469 ?auto_111471 ) ) ( not ( = ?auto_111469 ?auto_111472 ) ) ( not ( = ?auto_111469 ?auto_111473 ) ) ( not ( = ?auto_111470 ?auto_111471 ) ) ( not ( = ?auto_111470 ?auto_111472 ) ) ( not ( = ?auto_111470 ?auto_111473 ) ) ( not ( = ?auto_111471 ?auto_111472 ) ) ( not ( = ?auto_111471 ?auto_111473 ) ) ( not ( = ?auto_111472 ?auto_111473 ) ) ( ON ?auto_111473 ?auto_111474 ) ( not ( = ?auto_111468 ?auto_111474 ) ) ( not ( = ?auto_111469 ?auto_111474 ) ) ( not ( = ?auto_111470 ?auto_111474 ) ) ( not ( = ?auto_111471 ?auto_111474 ) ) ( not ( = ?auto_111472 ?auto_111474 ) ) ( not ( = ?auto_111473 ?auto_111474 ) ) ( ON ?auto_111472 ?auto_111473 ) ( ON-TABLE ?auto_111474 ) ( ON ?auto_111471 ?auto_111472 ) ( CLEAR ?auto_111471 ) ( HOLDING ?auto_111470 ) ( CLEAR ?auto_111469 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111468 ?auto_111469 ?auto_111470 )
      ( MAKE-6PILE ?auto_111468 ?auto_111469 ?auto_111470 ?auto_111471 ?auto_111472 ?auto_111473 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111475 - BLOCK
      ?auto_111476 - BLOCK
      ?auto_111477 - BLOCK
      ?auto_111478 - BLOCK
      ?auto_111479 - BLOCK
      ?auto_111480 - BLOCK
    )
    :vars
    (
      ?auto_111481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111475 ) ( ON ?auto_111476 ?auto_111475 ) ( not ( = ?auto_111475 ?auto_111476 ) ) ( not ( = ?auto_111475 ?auto_111477 ) ) ( not ( = ?auto_111475 ?auto_111478 ) ) ( not ( = ?auto_111475 ?auto_111479 ) ) ( not ( = ?auto_111475 ?auto_111480 ) ) ( not ( = ?auto_111476 ?auto_111477 ) ) ( not ( = ?auto_111476 ?auto_111478 ) ) ( not ( = ?auto_111476 ?auto_111479 ) ) ( not ( = ?auto_111476 ?auto_111480 ) ) ( not ( = ?auto_111477 ?auto_111478 ) ) ( not ( = ?auto_111477 ?auto_111479 ) ) ( not ( = ?auto_111477 ?auto_111480 ) ) ( not ( = ?auto_111478 ?auto_111479 ) ) ( not ( = ?auto_111478 ?auto_111480 ) ) ( not ( = ?auto_111479 ?auto_111480 ) ) ( ON ?auto_111480 ?auto_111481 ) ( not ( = ?auto_111475 ?auto_111481 ) ) ( not ( = ?auto_111476 ?auto_111481 ) ) ( not ( = ?auto_111477 ?auto_111481 ) ) ( not ( = ?auto_111478 ?auto_111481 ) ) ( not ( = ?auto_111479 ?auto_111481 ) ) ( not ( = ?auto_111480 ?auto_111481 ) ) ( ON ?auto_111479 ?auto_111480 ) ( ON-TABLE ?auto_111481 ) ( ON ?auto_111478 ?auto_111479 ) ( CLEAR ?auto_111476 ) ( ON ?auto_111477 ?auto_111478 ) ( CLEAR ?auto_111477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111481 ?auto_111480 ?auto_111479 ?auto_111478 )
      ( MAKE-6PILE ?auto_111475 ?auto_111476 ?auto_111477 ?auto_111478 ?auto_111479 ?auto_111480 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111482 - BLOCK
      ?auto_111483 - BLOCK
      ?auto_111484 - BLOCK
      ?auto_111485 - BLOCK
      ?auto_111486 - BLOCK
      ?auto_111487 - BLOCK
    )
    :vars
    (
      ?auto_111488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111482 ) ( not ( = ?auto_111482 ?auto_111483 ) ) ( not ( = ?auto_111482 ?auto_111484 ) ) ( not ( = ?auto_111482 ?auto_111485 ) ) ( not ( = ?auto_111482 ?auto_111486 ) ) ( not ( = ?auto_111482 ?auto_111487 ) ) ( not ( = ?auto_111483 ?auto_111484 ) ) ( not ( = ?auto_111483 ?auto_111485 ) ) ( not ( = ?auto_111483 ?auto_111486 ) ) ( not ( = ?auto_111483 ?auto_111487 ) ) ( not ( = ?auto_111484 ?auto_111485 ) ) ( not ( = ?auto_111484 ?auto_111486 ) ) ( not ( = ?auto_111484 ?auto_111487 ) ) ( not ( = ?auto_111485 ?auto_111486 ) ) ( not ( = ?auto_111485 ?auto_111487 ) ) ( not ( = ?auto_111486 ?auto_111487 ) ) ( ON ?auto_111487 ?auto_111488 ) ( not ( = ?auto_111482 ?auto_111488 ) ) ( not ( = ?auto_111483 ?auto_111488 ) ) ( not ( = ?auto_111484 ?auto_111488 ) ) ( not ( = ?auto_111485 ?auto_111488 ) ) ( not ( = ?auto_111486 ?auto_111488 ) ) ( not ( = ?auto_111487 ?auto_111488 ) ) ( ON ?auto_111486 ?auto_111487 ) ( ON-TABLE ?auto_111488 ) ( ON ?auto_111485 ?auto_111486 ) ( ON ?auto_111484 ?auto_111485 ) ( CLEAR ?auto_111484 ) ( HOLDING ?auto_111483 ) ( CLEAR ?auto_111482 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111482 ?auto_111483 )
      ( MAKE-6PILE ?auto_111482 ?auto_111483 ?auto_111484 ?auto_111485 ?auto_111486 ?auto_111487 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111489 - BLOCK
      ?auto_111490 - BLOCK
      ?auto_111491 - BLOCK
      ?auto_111492 - BLOCK
      ?auto_111493 - BLOCK
      ?auto_111494 - BLOCK
    )
    :vars
    (
      ?auto_111495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111489 ) ( not ( = ?auto_111489 ?auto_111490 ) ) ( not ( = ?auto_111489 ?auto_111491 ) ) ( not ( = ?auto_111489 ?auto_111492 ) ) ( not ( = ?auto_111489 ?auto_111493 ) ) ( not ( = ?auto_111489 ?auto_111494 ) ) ( not ( = ?auto_111490 ?auto_111491 ) ) ( not ( = ?auto_111490 ?auto_111492 ) ) ( not ( = ?auto_111490 ?auto_111493 ) ) ( not ( = ?auto_111490 ?auto_111494 ) ) ( not ( = ?auto_111491 ?auto_111492 ) ) ( not ( = ?auto_111491 ?auto_111493 ) ) ( not ( = ?auto_111491 ?auto_111494 ) ) ( not ( = ?auto_111492 ?auto_111493 ) ) ( not ( = ?auto_111492 ?auto_111494 ) ) ( not ( = ?auto_111493 ?auto_111494 ) ) ( ON ?auto_111494 ?auto_111495 ) ( not ( = ?auto_111489 ?auto_111495 ) ) ( not ( = ?auto_111490 ?auto_111495 ) ) ( not ( = ?auto_111491 ?auto_111495 ) ) ( not ( = ?auto_111492 ?auto_111495 ) ) ( not ( = ?auto_111493 ?auto_111495 ) ) ( not ( = ?auto_111494 ?auto_111495 ) ) ( ON ?auto_111493 ?auto_111494 ) ( ON-TABLE ?auto_111495 ) ( ON ?auto_111492 ?auto_111493 ) ( ON ?auto_111491 ?auto_111492 ) ( CLEAR ?auto_111489 ) ( ON ?auto_111490 ?auto_111491 ) ( CLEAR ?auto_111490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111495 ?auto_111494 ?auto_111493 ?auto_111492 ?auto_111491 )
      ( MAKE-6PILE ?auto_111489 ?auto_111490 ?auto_111491 ?auto_111492 ?auto_111493 ?auto_111494 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111496 - BLOCK
      ?auto_111497 - BLOCK
      ?auto_111498 - BLOCK
      ?auto_111499 - BLOCK
      ?auto_111500 - BLOCK
      ?auto_111501 - BLOCK
    )
    :vars
    (
      ?auto_111502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111496 ?auto_111497 ) ) ( not ( = ?auto_111496 ?auto_111498 ) ) ( not ( = ?auto_111496 ?auto_111499 ) ) ( not ( = ?auto_111496 ?auto_111500 ) ) ( not ( = ?auto_111496 ?auto_111501 ) ) ( not ( = ?auto_111497 ?auto_111498 ) ) ( not ( = ?auto_111497 ?auto_111499 ) ) ( not ( = ?auto_111497 ?auto_111500 ) ) ( not ( = ?auto_111497 ?auto_111501 ) ) ( not ( = ?auto_111498 ?auto_111499 ) ) ( not ( = ?auto_111498 ?auto_111500 ) ) ( not ( = ?auto_111498 ?auto_111501 ) ) ( not ( = ?auto_111499 ?auto_111500 ) ) ( not ( = ?auto_111499 ?auto_111501 ) ) ( not ( = ?auto_111500 ?auto_111501 ) ) ( ON ?auto_111501 ?auto_111502 ) ( not ( = ?auto_111496 ?auto_111502 ) ) ( not ( = ?auto_111497 ?auto_111502 ) ) ( not ( = ?auto_111498 ?auto_111502 ) ) ( not ( = ?auto_111499 ?auto_111502 ) ) ( not ( = ?auto_111500 ?auto_111502 ) ) ( not ( = ?auto_111501 ?auto_111502 ) ) ( ON ?auto_111500 ?auto_111501 ) ( ON-TABLE ?auto_111502 ) ( ON ?auto_111499 ?auto_111500 ) ( ON ?auto_111498 ?auto_111499 ) ( ON ?auto_111497 ?auto_111498 ) ( CLEAR ?auto_111497 ) ( HOLDING ?auto_111496 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111496 )
      ( MAKE-6PILE ?auto_111496 ?auto_111497 ?auto_111498 ?auto_111499 ?auto_111500 ?auto_111501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111503 - BLOCK
      ?auto_111504 - BLOCK
      ?auto_111505 - BLOCK
      ?auto_111506 - BLOCK
      ?auto_111507 - BLOCK
      ?auto_111508 - BLOCK
    )
    :vars
    (
      ?auto_111509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111503 ?auto_111504 ) ) ( not ( = ?auto_111503 ?auto_111505 ) ) ( not ( = ?auto_111503 ?auto_111506 ) ) ( not ( = ?auto_111503 ?auto_111507 ) ) ( not ( = ?auto_111503 ?auto_111508 ) ) ( not ( = ?auto_111504 ?auto_111505 ) ) ( not ( = ?auto_111504 ?auto_111506 ) ) ( not ( = ?auto_111504 ?auto_111507 ) ) ( not ( = ?auto_111504 ?auto_111508 ) ) ( not ( = ?auto_111505 ?auto_111506 ) ) ( not ( = ?auto_111505 ?auto_111507 ) ) ( not ( = ?auto_111505 ?auto_111508 ) ) ( not ( = ?auto_111506 ?auto_111507 ) ) ( not ( = ?auto_111506 ?auto_111508 ) ) ( not ( = ?auto_111507 ?auto_111508 ) ) ( ON ?auto_111508 ?auto_111509 ) ( not ( = ?auto_111503 ?auto_111509 ) ) ( not ( = ?auto_111504 ?auto_111509 ) ) ( not ( = ?auto_111505 ?auto_111509 ) ) ( not ( = ?auto_111506 ?auto_111509 ) ) ( not ( = ?auto_111507 ?auto_111509 ) ) ( not ( = ?auto_111508 ?auto_111509 ) ) ( ON ?auto_111507 ?auto_111508 ) ( ON-TABLE ?auto_111509 ) ( ON ?auto_111506 ?auto_111507 ) ( ON ?auto_111505 ?auto_111506 ) ( ON ?auto_111504 ?auto_111505 ) ( ON ?auto_111503 ?auto_111504 ) ( CLEAR ?auto_111503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111509 ?auto_111508 ?auto_111507 ?auto_111506 ?auto_111505 ?auto_111504 )
      ( MAKE-6PILE ?auto_111503 ?auto_111504 ?auto_111505 ?auto_111506 ?auto_111507 ?auto_111508 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111516 - BLOCK
      ?auto_111517 - BLOCK
      ?auto_111518 - BLOCK
      ?auto_111519 - BLOCK
      ?auto_111520 - BLOCK
      ?auto_111521 - BLOCK
    )
    :vars
    (
      ?auto_111522 - BLOCK
      ?auto_111523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111516 ?auto_111517 ) ) ( not ( = ?auto_111516 ?auto_111518 ) ) ( not ( = ?auto_111516 ?auto_111519 ) ) ( not ( = ?auto_111516 ?auto_111520 ) ) ( not ( = ?auto_111516 ?auto_111521 ) ) ( not ( = ?auto_111517 ?auto_111518 ) ) ( not ( = ?auto_111517 ?auto_111519 ) ) ( not ( = ?auto_111517 ?auto_111520 ) ) ( not ( = ?auto_111517 ?auto_111521 ) ) ( not ( = ?auto_111518 ?auto_111519 ) ) ( not ( = ?auto_111518 ?auto_111520 ) ) ( not ( = ?auto_111518 ?auto_111521 ) ) ( not ( = ?auto_111519 ?auto_111520 ) ) ( not ( = ?auto_111519 ?auto_111521 ) ) ( not ( = ?auto_111520 ?auto_111521 ) ) ( ON ?auto_111521 ?auto_111522 ) ( not ( = ?auto_111516 ?auto_111522 ) ) ( not ( = ?auto_111517 ?auto_111522 ) ) ( not ( = ?auto_111518 ?auto_111522 ) ) ( not ( = ?auto_111519 ?auto_111522 ) ) ( not ( = ?auto_111520 ?auto_111522 ) ) ( not ( = ?auto_111521 ?auto_111522 ) ) ( ON ?auto_111520 ?auto_111521 ) ( ON-TABLE ?auto_111522 ) ( ON ?auto_111519 ?auto_111520 ) ( ON ?auto_111518 ?auto_111519 ) ( ON ?auto_111517 ?auto_111518 ) ( CLEAR ?auto_111517 ) ( ON ?auto_111516 ?auto_111523 ) ( CLEAR ?auto_111516 ) ( HAND-EMPTY ) ( not ( = ?auto_111516 ?auto_111523 ) ) ( not ( = ?auto_111517 ?auto_111523 ) ) ( not ( = ?auto_111518 ?auto_111523 ) ) ( not ( = ?auto_111519 ?auto_111523 ) ) ( not ( = ?auto_111520 ?auto_111523 ) ) ( not ( = ?auto_111521 ?auto_111523 ) ) ( not ( = ?auto_111522 ?auto_111523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111516 ?auto_111523 )
      ( MAKE-6PILE ?auto_111516 ?auto_111517 ?auto_111518 ?auto_111519 ?auto_111520 ?auto_111521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111524 - BLOCK
      ?auto_111525 - BLOCK
      ?auto_111526 - BLOCK
      ?auto_111527 - BLOCK
      ?auto_111528 - BLOCK
      ?auto_111529 - BLOCK
    )
    :vars
    (
      ?auto_111531 - BLOCK
      ?auto_111530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111524 ?auto_111525 ) ) ( not ( = ?auto_111524 ?auto_111526 ) ) ( not ( = ?auto_111524 ?auto_111527 ) ) ( not ( = ?auto_111524 ?auto_111528 ) ) ( not ( = ?auto_111524 ?auto_111529 ) ) ( not ( = ?auto_111525 ?auto_111526 ) ) ( not ( = ?auto_111525 ?auto_111527 ) ) ( not ( = ?auto_111525 ?auto_111528 ) ) ( not ( = ?auto_111525 ?auto_111529 ) ) ( not ( = ?auto_111526 ?auto_111527 ) ) ( not ( = ?auto_111526 ?auto_111528 ) ) ( not ( = ?auto_111526 ?auto_111529 ) ) ( not ( = ?auto_111527 ?auto_111528 ) ) ( not ( = ?auto_111527 ?auto_111529 ) ) ( not ( = ?auto_111528 ?auto_111529 ) ) ( ON ?auto_111529 ?auto_111531 ) ( not ( = ?auto_111524 ?auto_111531 ) ) ( not ( = ?auto_111525 ?auto_111531 ) ) ( not ( = ?auto_111526 ?auto_111531 ) ) ( not ( = ?auto_111527 ?auto_111531 ) ) ( not ( = ?auto_111528 ?auto_111531 ) ) ( not ( = ?auto_111529 ?auto_111531 ) ) ( ON ?auto_111528 ?auto_111529 ) ( ON-TABLE ?auto_111531 ) ( ON ?auto_111527 ?auto_111528 ) ( ON ?auto_111526 ?auto_111527 ) ( ON ?auto_111524 ?auto_111530 ) ( CLEAR ?auto_111524 ) ( not ( = ?auto_111524 ?auto_111530 ) ) ( not ( = ?auto_111525 ?auto_111530 ) ) ( not ( = ?auto_111526 ?auto_111530 ) ) ( not ( = ?auto_111527 ?auto_111530 ) ) ( not ( = ?auto_111528 ?auto_111530 ) ) ( not ( = ?auto_111529 ?auto_111530 ) ) ( not ( = ?auto_111531 ?auto_111530 ) ) ( HOLDING ?auto_111525 ) ( CLEAR ?auto_111526 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111531 ?auto_111529 ?auto_111528 ?auto_111527 ?auto_111526 ?auto_111525 )
      ( MAKE-6PILE ?auto_111524 ?auto_111525 ?auto_111526 ?auto_111527 ?auto_111528 ?auto_111529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111532 - BLOCK
      ?auto_111533 - BLOCK
      ?auto_111534 - BLOCK
      ?auto_111535 - BLOCK
      ?auto_111536 - BLOCK
      ?auto_111537 - BLOCK
    )
    :vars
    (
      ?auto_111539 - BLOCK
      ?auto_111538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111532 ?auto_111533 ) ) ( not ( = ?auto_111532 ?auto_111534 ) ) ( not ( = ?auto_111532 ?auto_111535 ) ) ( not ( = ?auto_111532 ?auto_111536 ) ) ( not ( = ?auto_111532 ?auto_111537 ) ) ( not ( = ?auto_111533 ?auto_111534 ) ) ( not ( = ?auto_111533 ?auto_111535 ) ) ( not ( = ?auto_111533 ?auto_111536 ) ) ( not ( = ?auto_111533 ?auto_111537 ) ) ( not ( = ?auto_111534 ?auto_111535 ) ) ( not ( = ?auto_111534 ?auto_111536 ) ) ( not ( = ?auto_111534 ?auto_111537 ) ) ( not ( = ?auto_111535 ?auto_111536 ) ) ( not ( = ?auto_111535 ?auto_111537 ) ) ( not ( = ?auto_111536 ?auto_111537 ) ) ( ON ?auto_111537 ?auto_111539 ) ( not ( = ?auto_111532 ?auto_111539 ) ) ( not ( = ?auto_111533 ?auto_111539 ) ) ( not ( = ?auto_111534 ?auto_111539 ) ) ( not ( = ?auto_111535 ?auto_111539 ) ) ( not ( = ?auto_111536 ?auto_111539 ) ) ( not ( = ?auto_111537 ?auto_111539 ) ) ( ON ?auto_111536 ?auto_111537 ) ( ON-TABLE ?auto_111539 ) ( ON ?auto_111535 ?auto_111536 ) ( ON ?auto_111534 ?auto_111535 ) ( ON ?auto_111532 ?auto_111538 ) ( not ( = ?auto_111532 ?auto_111538 ) ) ( not ( = ?auto_111533 ?auto_111538 ) ) ( not ( = ?auto_111534 ?auto_111538 ) ) ( not ( = ?auto_111535 ?auto_111538 ) ) ( not ( = ?auto_111536 ?auto_111538 ) ) ( not ( = ?auto_111537 ?auto_111538 ) ) ( not ( = ?auto_111539 ?auto_111538 ) ) ( CLEAR ?auto_111534 ) ( ON ?auto_111533 ?auto_111532 ) ( CLEAR ?auto_111533 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111538 ?auto_111532 )
      ( MAKE-6PILE ?auto_111532 ?auto_111533 ?auto_111534 ?auto_111535 ?auto_111536 ?auto_111537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111540 - BLOCK
      ?auto_111541 - BLOCK
      ?auto_111542 - BLOCK
      ?auto_111543 - BLOCK
      ?auto_111544 - BLOCK
      ?auto_111545 - BLOCK
    )
    :vars
    (
      ?auto_111546 - BLOCK
      ?auto_111547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111540 ?auto_111541 ) ) ( not ( = ?auto_111540 ?auto_111542 ) ) ( not ( = ?auto_111540 ?auto_111543 ) ) ( not ( = ?auto_111540 ?auto_111544 ) ) ( not ( = ?auto_111540 ?auto_111545 ) ) ( not ( = ?auto_111541 ?auto_111542 ) ) ( not ( = ?auto_111541 ?auto_111543 ) ) ( not ( = ?auto_111541 ?auto_111544 ) ) ( not ( = ?auto_111541 ?auto_111545 ) ) ( not ( = ?auto_111542 ?auto_111543 ) ) ( not ( = ?auto_111542 ?auto_111544 ) ) ( not ( = ?auto_111542 ?auto_111545 ) ) ( not ( = ?auto_111543 ?auto_111544 ) ) ( not ( = ?auto_111543 ?auto_111545 ) ) ( not ( = ?auto_111544 ?auto_111545 ) ) ( ON ?auto_111545 ?auto_111546 ) ( not ( = ?auto_111540 ?auto_111546 ) ) ( not ( = ?auto_111541 ?auto_111546 ) ) ( not ( = ?auto_111542 ?auto_111546 ) ) ( not ( = ?auto_111543 ?auto_111546 ) ) ( not ( = ?auto_111544 ?auto_111546 ) ) ( not ( = ?auto_111545 ?auto_111546 ) ) ( ON ?auto_111544 ?auto_111545 ) ( ON-TABLE ?auto_111546 ) ( ON ?auto_111543 ?auto_111544 ) ( ON ?auto_111540 ?auto_111547 ) ( not ( = ?auto_111540 ?auto_111547 ) ) ( not ( = ?auto_111541 ?auto_111547 ) ) ( not ( = ?auto_111542 ?auto_111547 ) ) ( not ( = ?auto_111543 ?auto_111547 ) ) ( not ( = ?auto_111544 ?auto_111547 ) ) ( not ( = ?auto_111545 ?auto_111547 ) ) ( not ( = ?auto_111546 ?auto_111547 ) ) ( ON ?auto_111541 ?auto_111540 ) ( CLEAR ?auto_111541 ) ( ON-TABLE ?auto_111547 ) ( HOLDING ?auto_111542 ) ( CLEAR ?auto_111543 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111546 ?auto_111545 ?auto_111544 ?auto_111543 ?auto_111542 )
      ( MAKE-6PILE ?auto_111540 ?auto_111541 ?auto_111542 ?auto_111543 ?auto_111544 ?auto_111545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111548 - BLOCK
      ?auto_111549 - BLOCK
      ?auto_111550 - BLOCK
      ?auto_111551 - BLOCK
      ?auto_111552 - BLOCK
      ?auto_111553 - BLOCK
    )
    :vars
    (
      ?auto_111555 - BLOCK
      ?auto_111554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111548 ?auto_111549 ) ) ( not ( = ?auto_111548 ?auto_111550 ) ) ( not ( = ?auto_111548 ?auto_111551 ) ) ( not ( = ?auto_111548 ?auto_111552 ) ) ( not ( = ?auto_111548 ?auto_111553 ) ) ( not ( = ?auto_111549 ?auto_111550 ) ) ( not ( = ?auto_111549 ?auto_111551 ) ) ( not ( = ?auto_111549 ?auto_111552 ) ) ( not ( = ?auto_111549 ?auto_111553 ) ) ( not ( = ?auto_111550 ?auto_111551 ) ) ( not ( = ?auto_111550 ?auto_111552 ) ) ( not ( = ?auto_111550 ?auto_111553 ) ) ( not ( = ?auto_111551 ?auto_111552 ) ) ( not ( = ?auto_111551 ?auto_111553 ) ) ( not ( = ?auto_111552 ?auto_111553 ) ) ( ON ?auto_111553 ?auto_111555 ) ( not ( = ?auto_111548 ?auto_111555 ) ) ( not ( = ?auto_111549 ?auto_111555 ) ) ( not ( = ?auto_111550 ?auto_111555 ) ) ( not ( = ?auto_111551 ?auto_111555 ) ) ( not ( = ?auto_111552 ?auto_111555 ) ) ( not ( = ?auto_111553 ?auto_111555 ) ) ( ON ?auto_111552 ?auto_111553 ) ( ON-TABLE ?auto_111555 ) ( ON ?auto_111551 ?auto_111552 ) ( ON ?auto_111548 ?auto_111554 ) ( not ( = ?auto_111548 ?auto_111554 ) ) ( not ( = ?auto_111549 ?auto_111554 ) ) ( not ( = ?auto_111550 ?auto_111554 ) ) ( not ( = ?auto_111551 ?auto_111554 ) ) ( not ( = ?auto_111552 ?auto_111554 ) ) ( not ( = ?auto_111553 ?auto_111554 ) ) ( not ( = ?auto_111555 ?auto_111554 ) ) ( ON ?auto_111549 ?auto_111548 ) ( ON-TABLE ?auto_111554 ) ( CLEAR ?auto_111551 ) ( ON ?auto_111550 ?auto_111549 ) ( CLEAR ?auto_111550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111554 ?auto_111548 ?auto_111549 )
      ( MAKE-6PILE ?auto_111548 ?auto_111549 ?auto_111550 ?auto_111551 ?auto_111552 ?auto_111553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111556 - BLOCK
      ?auto_111557 - BLOCK
      ?auto_111558 - BLOCK
      ?auto_111559 - BLOCK
      ?auto_111560 - BLOCK
      ?auto_111561 - BLOCK
    )
    :vars
    (
      ?auto_111563 - BLOCK
      ?auto_111562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111556 ?auto_111557 ) ) ( not ( = ?auto_111556 ?auto_111558 ) ) ( not ( = ?auto_111556 ?auto_111559 ) ) ( not ( = ?auto_111556 ?auto_111560 ) ) ( not ( = ?auto_111556 ?auto_111561 ) ) ( not ( = ?auto_111557 ?auto_111558 ) ) ( not ( = ?auto_111557 ?auto_111559 ) ) ( not ( = ?auto_111557 ?auto_111560 ) ) ( not ( = ?auto_111557 ?auto_111561 ) ) ( not ( = ?auto_111558 ?auto_111559 ) ) ( not ( = ?auto_111558 ?auto_111560 ) ) ( not ( = ?auto_111558 ?auto_111561 ) ) ( not ( = ?auto_111559 ?auto_111560 ) ) ( not ( = ?auto_111559 ?auto_111561 ) ) ( not ( = ?auto_111560 ?auto_111561 ) ) ( ON ?auto_111561 ?auto_111563 ) ( not ( = ?auto_111556 ?auto_111563 ) ) ( not ( = ?auto_111557 ?auto_111563 ) ) ( not ( = ?auto_111558 ?auto_111563 ) ) ( not ( = ?auto_111559 ?auto_111563 ) ) ( not ( = ?auto_111560 ?auto_111563 ) ) ( not ( = ?auto_111561 ?auto_111563 ) ) ( ON ?auto_111560 ?auto_111561 ) ( ON-TABLE ?auto_111563 ) ( ON ?auto_111556 ?auto_111562 ) ( not ( = ?auto_111556 ?auto_111562 ) ) ( not ( = ?auto_111557 ?auto_111562 ) ) ( not ( = ?auto_111558 ?auto_111562 ) ) ( not ( = ?auto_111559 ?auto_111562 ) ) ( not ( = ?auto_111560 ?auto_111562 ) ) ( not ( = ?auto_111561 ?auto_111562 ) ) ( not ( = ?auto_111563 ?auto_111562 ) ) ( ON ?auto_111557 ?auto_111556 ) ( ON-TABLE ?auto_111562 ) ( ON ?auto_111558 ?auto_111557 ) ( CLEAR ?auto_111558 ) ( HOLDING ?auto_111559 ) ( CLEAR ?auto_111560 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111563 ?auto_111561 ?auto_111560 ?auto_111559 )
      ( MAKE-6PILE ?auto_111556 ?auto_111557 ?auto_111558 ?auto_111559 ?auto_111560 ?auto_111561 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111564 - BLOCK
      ?auto_111565 - BLOCK
      ?auto_111566 - BLOCK
      ?auto_111567 - BLOCK
      ?auto_111568 - BLOCK
      ?auto_111569 - BLOCK
    )
    :vars
    (
      ?auto_111571 - BLOCK
      ?auto_111570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111564 ?auto_111565 ) ) ( not ( = ?auto_111564 ?auto_111566 ) ) ( not ( = ?auto_111564 ?auto_111567 ) ) ( not ( = ?auto_111564 ?auto_111568 ) ) ( not ( = ?auto_111564 ?auto_111569 ) ) ( not ( = ?auto_111565 ?auto_111566 ) ) ( not ( = ?auto_111565 ?auto_111567 ) ) ( not ( = ?auto_111565 ?auto_111568 ) ) ( not ( = ?auto_111565 ?auto_111569 ) ) ( not ( = ?auto_111566 ?auto_111567 ) ) ( not ( = ?auto_111566 ?auto_111568 ) ) ( not ( = ?auto_111566 ?auto_111569 ) ) ( not ( = ?auto_111567 ?auto_111568 ) ) ( not ( = ?auto_111567 ?auto_111569 ) ) ( not ( = ?auto_111568 ?auto_111569 ) ) ( ON ?auto_111569 ?auto_111571 ) ( not ( = ?auto_111564 ?auto_111571 ) ) ( not ( = ?auto_111565 ?auto_111571 ) ) ( not ( = ?auto_111566 ?auto_111571 ) ) ( not ( = ?auto_111567 ?auto_111571 ) ) ( not ( = ?auto_111568 ?auto_111571 ) ) ( not ( = ?auto_111569 ?auto_111571 ) ) ( ON ?auto_111568 ?auto_111569 ) ( ON-TABLE ?auto_111571 ) ( ON ?auto_111564 ?auto_111570 ) ( not ( = ?auto_111564 ?auto_111570 ) ) ( not ( = ?auto_111565 ?auto_111570 ) ) ( not ( = ?auto_111566 ?auto_111570 ) ) ( not ( = ?auto_111567 ?auto_111570 ) ) ( not ( = ?auto_111568 ?auto_111570 ) ) ( not ( = ?auto_111569 ?auto_111570 ) ) ( not ( = ?auto_111571 ?auto_111570 ) ) ( ON ?auto_111565 ?auto_111564 ) ( ON-TABLE ?auto_111570 ) ( ON ?auto_111566 ?auto_111565 ) ( CLEAR ?auto_111568 ) ( ON ?auto_111567 ?auto_111566 ) ( CLEAR ?auto_111567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111570 ?auto_111564 ?auto_111565 ?auto_111566 )
      ( MAKE-6PILE ?auto_111564 ?auto_111565 ?auto_111566 ?auto_111567 ?auto_111568 ?auto_111569 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111572 - BLOCK
      ?auto_111573 - BLOCK
      ?auto_111574 - BLOCK
      ?auto_111575 - BLOCK
      ?auto_111576 - BLOCK
      ?auto_111577 - BLOCK
    )
    :vars
    (
      ?auto_111579 - BLOCK
      ?auto_111578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111572 ?auto_111573 ) ) ( not ( = ?auto_111572 ?auto_111574 ) ) ( not ( = ?auto_111572 ?auto_111575 ) ) ( not ( = ?auto_111572 ?auto_111576 ) ) ( not ( = ?auto_111572 ?auto_111577 ) ) ( not ( = ?auto_111573 ?auto_111574 ) ) ( not ( = ?auto_111573 ?auto_111575 ) ) ( not ( = ?auto_111573 ?auto_111576 ) ) ( not ( = ?auto_111573 ?auto_111577 ) ) ( not ( = ?auto_111574 ?auto_111575 ) ) ( not ( = ?auto_111574 ?auto_111576 ) ) ( not ( = ?auto_111574 ?auto_111577 ) ) ( not ( = ?auto_111575 ?auto_111576 ) ) ( not ( = ?auto_111575 ?auto_111577 ) ) ( not ( = ?auto_111576 ?auto_111577 ) ) ( ON ?auto_111577 ?auto_111579 ) ( not ( = ?auto_111572 ?auto_111579 ) ) ( not ( = ?auto_111573 ?auto_111579 ) ) ( not ( = ?auto_111574 ?auto_111579 ) ) ( not ( = ?auto_111575 ?auto_111579 ) ) ( not ( = ?auto_111576 ?auto_111579 ) ) ( not ( = ?auto_111577 ?auto_111579 ) ) ( ON-TABLE ?auto_111579 ) ( ON ?auto_111572 ?auto_111578 ) ( not ( = ?auto_111572 ?auto_111578 ) ) ( not ( = ?auto_111573 ?auto_111578 ) ) ( not ( = ?auto_111574 ?auto_111578 ) ) ( not ( = ?auto_111575 ?auto_111578 ) ) ( not ( = ?auto_111576 ?auto_111578 ) ) ( not ( = ?auto_111577 ?auto_111578 ) ) ( not ( = ?auto_111579 ?auto_111578 ) ) ( ON ?auto_111573 ?auto_111572 ) ( ON-TABLE ?auto_111578 ) ( ON ?auto_111574 ?auto_111573 ) ( ON ?auto_111575 ?auto_111574 ) ( CLEAR ?auto_111575 ) ( HOLDING ?auto_111576 ) ( CLEAR ?auto_111577 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111579 ?auto_111577 ?auto_111576 )
      ( MAKE-6PILE ?auto_111572 ?auto_111573 ?auto_111574 ?auto_111575 ?auto_111576 ?auto_111577 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111580 - BLOCK
      ?auto_111581 - BLOCK
      ?auto_111582 - BLOCK
      ?auto_111583 - BLOCK
      ?auto_111584 - BLOCK
      ?auto_111585 - BLOCK
    )
    :vars
    (
      ?auto_111586 - BLOCK
      ?auto_111587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111580 ?auto_111581 ) ) ( not ( = ?auto_111580 ?auto_111582 ) ) ( not ( = ?auto_111580 ?auto_111583 ) ) ( not ( = ?auto_111580 ?auto_111584 ) ) ( not ( = ?auto_111580 ?auto_111585 ) ) ( not ( = ?auto_111581 ?auto_111582 ) ) ( not ( = ?auto_111581 ?auto_111583 ) ) ( not ( = ?auto_111581 ?auto_111584 ) ) ( not ( = ?auto_111581 ?auto_111585 ) ) ( not ( = ?auto_111582 ?auto_111583 ) ) ( not ( = ?auto_111582 ?auto_111584 ) ) ( not ( = ?auto_111582 ?auto_111585 ) ) ( not ( = ?auto_111583 ?auto_111584 ) ) ( not ( = ?auto_111583 ?auto_111585 ) ) ( not ( = ?auto_111584 ?auto_111585 ) ) ( ON ?auto_111585 ?auto_111586 ) ( not ( = ?auto_111580 ?auto_111586 ) ) ( not ( = ?auto_111581 ?auto_111586 ) ) ( not ( = ?auto_111582 ?auto_111586 ) ) ( not ( = ?auto_111583 ?auto_111586 ) ) ( not ( = ?auto_111584 ?auto_111586 ) ) ( not ( = ?auto_111585 ?auto_111586 ) ) ( ON-TABLE ?auto_111586 ) ( ON ?auto_111580 ?auto_111587 ) ( not ( = ?auto_111580 ?auto_111587 ) ) ( not ( = ?auto_111581 ?auto_111587 ) ) ( not ( = ?auto_111582 ?auto_111587 ) ) ( not ( = ?auto_111583 ?auto_111587 ) ) ( not ( = ?auto_111584 ?auto_111587 ) ) ( not ( = ?auto_111585 ?auto_111587 ) ) ( not ( = ?auto_111586 ?auto_111587 ) ) ( ON ?auto_111581 ?auto_111580 ) ( ON-TABLE ?auto_111587 ) ( ON ?auto_111582 ?auto_111581 ) ( ON ?auto_111583 ?auto_111582 ) ( CLEAR ?auto_111585 ) ( ON ?auto_111584 ?auto_111583 ) ( CLEAR ?auto_111584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111587 ?auto_111580 ?auto_111581 ?auto_111582 ?auto_111583 )
      ( MAKE-6PILE ?auto_111580 ?auto_111581 ?auto_111582 ?auto_111583 ?auto_111584 ?auto_111585 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111588 - BLOCK
      ?auto_111589 - BLOCK
      ?auto_111590 - BLOCK
      ?auto_111591 - BLOCK
      ?auto_111592 - BLOCK
      ?auto_111593 - BLOCK
    )
    :vars
    (
      ?auto_111594 - BLOCK
      ?auto_111595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111588 ?auto_111589 ) ) ( not ( = ?auto_111588 ?auto_111590 ) ) ( not ( = ?auto_111588 ?auto_111591 ) ) ( not ( = ?auto_111588 ?auto_111592 ) ) ( not ( = ?auto_111588 ?auto_111593 ) ) ( not ( = ?auto_111589 ?auto_111590 ) ) ( not ( = ?auto_111589 ?auto_111591 ) ) ( not ( = ?auto_111589 ?auto_111592 ) ) ( not ( = ?auto_111589 ?auto_111593 ) ) ( not ( = ?auto_111590 ?auto_111591 ) ) ( not ( = ?auto_111590 ?auto_111592 ) ) ( not ( = ?auto_111590 ?auto_111593 ) ) ( not ( = ?auto_111591 ?auto_111592 ) ) ( not ( = ?auto_111591 ?auto_111593 ) ) ( not ( = ?auto_111592 ?auto_111593 ) ) ( not ( = ?auto_111588 ?auto_111594 ) ) ( not ( = ?auto_111589 ?auto_111594 ) ) ( not ( = ?auto_111590 ?auto_111594 ) ) ( not ( = ?auto_111591 ?auto_111594 ) ) ( not ( = ?auto_111592 ?auto_111594 ) ) ( not ( = ?auto_111593 ?auto_111594 ) ) ( ON-TABLE ?auto_111594 ) ( ON ?auto_111588 ?auto_111595 ) ( not ( = ?auto_111588 ?auto_111595 ) ) ( not ( = ?auto_111589 ?auto_111595 ) ) ( not ( = ?auto_111590 ?auto_111595 ) ) ( not ( = ?auto_111591 ?auto_111595 ) ) ( not ( = ?auto_111592 ?auto_111595 ) ) ( not ( = ?auto_111593 ?auto_111595 ) ) ( not ( = ?auto_111594 ?auto_111595 ) ) ( ON ?auto_111589 ?auto_111588 ) ( ON-TABLE ?auto_111595 ) ( ON ?auto_111590 ?auto_111589 ) ( ON ?auto_111591 ?auto_111590 ) ( ON ?auto_111592 ?auto_111591 ) ( CLEAR ?auto_111592 ) ( HOLDING ?auto_111593 ) ( CLEAR ?auto_111594 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111594 ?auto_111593 )
      ( MAKE-6PILE ?auto_111588 ?auto_111589 ?auto_111590 ?auto_111591 ?auto_111592 ?auto_111593 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111596 - BLOCK
      ?auto_111597 - BLOCK
      ?auto_111598 - BLOCK
      ?auto_111599 - BLOCK
      ?auto_111600 - BLOCK
      ?auto_111601 - BLOCK
    )
    :vars
    (
      ?auto_111603 - BLOCK
      ?auto_111602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111596 ?auto_111597 ) ) ( not ( = ?auto_111596 ?auto_111598 ) ) ( not ( = ?auto_111596 ?auto_111599 ) ) ( not ( = ?auto_111596 ?auto_111600 ) ) ( not ( = ?auto_111596 ?auto_111601 ) ) ( not ( = ?auto_111597 ?auto_111598 ) ) ( not ( = ?auto_111597 ?auto_111599 ) ) ( not ( = ?auto_111597 ?auto_111600 ) ) ( not ( = ?auto_111597 ?auto_111601 ) ) ( not ( = ?auto_111598 ?auto_111599 ) ) ( not ( = ?auto_111598 ?auto_111600 ) ) ( not ( = ?auto_111598 ?auto_111601 ) ) ( not ( = ?auto_111599 ?auto_111600 ) ) ( not ( = ?auto_111599 ?auto_111601 ) ) ( not ( = ?auto_111600 ?auto_111601 ) ) ( not ( = ?auto_111596 ?auto_111603 ) ) ( not ( = ?auto_111597 ?auto_111603 ) ) ( not ( = ?auto_111598 ?auto_111603 ) ) ( not ( = ?auto_111599 ?auto_111603 ) ) ( not ( = ?auto_111600 ?auto_111603 ) ) ( not ( = ?auto_111601 ?auto_111603 ) ) ( ON-TABLE ?auto_111603 ) ( ON ?auto_111596 ?auto_111602 ) ( not ( = ?auto_111596 ?auto_111602 ) ) ( not ( = ?auto_111597 ?auto_111602 ) ) ( not ( = ?auto_111598 ?auto_111602 ) ) ( not ( = ?auto_111599 ?auto_111602 ) ) ( not ( = ?auto_111600 ?auto_111602 ) ) ( not ( = ?auto_111601 ?auto_111602 ) ) ( not ( = ?auto_111603 ?auto_111602 ) ) ( ON ?auto_111597 ?auto_111596 ) ( ON-TABLE ?auto_111602 ) ( ON ?auto_111598 ?auto_111597 ) ( ON ?auto_111599 ?auto_111598 ) ( ON ?auto_111600 ?auto_111599 ) ( CLEAR ?auto_111603 ) ( ON ?auto_111601 ?auto_111600 ) ( CLEAR ?auto_111601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111602 ?auto_111596 ?auto_111597 ?auto_111598 ?auto_111599 ?auto_111600 )
      ( MAKE-6PILE ?auto_111596 ?auto_111597 ?auto_111598 ?auto_111599 ?auto_111600 ?auto_111601 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111604 - BLOCK
      ?auto_111605 - BLOCK
      ?auto_111606 - BLOCK
      ?auto_111607 - BLOCK
      ?auto_111608 - BLOCK
      ?auto_111609 - BLOCK
    )
    :vars
    (
      ?auto_111610 - BLOCK
      ?auto_111611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111604 ?auto_111605 ) ) ( not ( = ?auto_111604 ?auto_111606 ) ) ( not ( = ?auto_111604 ?auto_111607 ) ) ( not ( = ?auto_111604 ?auto_111608 ) ) ( not ( = ?auto_111604 ?auto_111609 ) ) ( not ( = ?auto_111605 ?auto_111606 ) ) ( not ( = ?auto_111605 ?auto_111607 ) ) ( not ( = ?auto_111605 ?auto_111608 ) ) ( not ( = ?auto_111605 ?auto_111609 ) ) ( not ( = ?auto_111606 ?auto_111607 ) ) ( not ( = ?auto_111606 ?auto_111608 ) ) ( not ( = ?auto_111606 ?auto_111609 ) ) ( not ( = ?auto_111607 ?auto_111608 ) ) ( not ( = ?auto_111607 ?auto_111609 ) ) ( not ( = ?auto_111608 ?auto_111609 ) ) ( not ( = ?auto_111604 ?auto_111610 ) ) ( not ( = ?auto_111605 ?auto_111610 ) ) ( not ( = ?auto_111606 ?auto_111610 ) ) ( not ( = ?auto_111607 ?auto_111610 ) ) ( not ( = ?auto_111608 ?auto_111610 ) ) ( not ( = ?auto_111609 ?auto_111610 ) ) ( ON ?auto_111604 ?auto_111611 ) ( not ( = ?auto_111604 ?auto_111611 ) ) ( not ( = ?auto_111605 ?auto_111611 ) ) ( not ( = ?auto_111606 ?auto_111611 ) ) ( not ( = ?auto_111607 ?auto_111611 ) ) ( not ( = ?auto_111608 ?auto_111611 ) ) ( not ( = ?auto_111609 ?auto_111611 ) ) ( not ( = ?auto_111610 ?auto_111611 ) ) ( ON ?auto_111605 ?auto_111604 ) ( ON-TABLE ?auto_111611 ) ( ON ?auto_111606 ?auto_111605 ) ( ON ?auto_111607 ?auto_111606 ) ( ON ?auto_111608 ?auto_111607 ) ( ON ?auto_111609 ?auto_111608 ) ( CLEAR ?auto_111609 ) ( HOLDING ?auto_111610 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111610 )
      ( MAKE-6PILE ?auto_111604 ?auto_111605 ?auto_111606 ?auto_111607 ?auto_111608 ?auto_111609 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111612 - BLOCK
      ?auto_111613 - BLOCK
      ?auto_111614 - BLOCK
      ?auto_111615 - BLOCK
      ?auto_111616 - BLOCK
      ?auto_111617 - BLOCK
    )
    :vars
    (
      ?auto_111619 - BLOCK
      ?auto_111618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111612 ?auto_111613 ) ) ( not ( = ?auto_111612 ?auto_111614 ) ) ( not ( = ?auto_111612 ?auto_111615 ) ) ( not ( = ?auto_111612 ?auto_111616 ) ) ( not ( = ?auto_111612 ?auto_111617 ) ) ( not ( = ?auto_111613 ?auto_111614 ) ) ( not ( = ?auto_111613 ?auto_111615 ) ) ( not ( = ?auto_111613 ?auto_111616 ) ) ( not ( = ?auto_111613 ?auto_111617 ) ) ( not ( = ?auto_111614 ?auto_111615 ) ) ( not ( = ?auto_111614 ?auto_111616 ) ) ( not ( = ?auto_111614 ?auto_111617 ) ) ( not ( = ?auto_111615 ?auto_111616 ) ) ( not ( = ?auto_111615 ?auto_111617 ) ) ( not ( = ?auto_111616 ?auto_111617 ) ) ( not ( = ?auto_111612 ?auto_111619 ) ) ( not ( = ?auto_111613 ?auto_111619 ) ) ( not ( = ?auto_111614 ?auto_111619 ) ) ( not ( = ?auto_111615 ?auto_111619 ) ) ( not ( = ?auto_111616 ?auto_111619 ) ) ( not ( = ?auto_111617 ?auto_111619 ) ) ( ON ?auto_111612 ?auto_111618 ) ( not ( = ?auto_111612 ?auto_111618 ) ) ( not ( = ?auto_111613 ?auto_111618 ) ) ( not ( = ?auto_111614 ?auto_111618 ) ) ( not ( = ?auto_111615 ?auto_111618 ) ) ( not ( = ?auto_111616 ?auto_111618 ) ) ( not ( = ?auto_111617 ?auto_111618 ) ) ( not ( = ?auto_111619 ?auto_111618 ) ) ( ON ?auto_111613 ?auto_111612 ) ( ON-TABLE ?auto_111618 ) ( ON ?auto_111614 ?auto_111613 ) ( ON ?auto_111615 ?auto_111614 ) ( ON ?auto_111616 ?auto_111615 ) ( ON ?auto_111617 ?auto_111616 ) ( ON ?auto_111619 ?auto_111617 ) ( CLEAR ?auto_111619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111618 ?auto_111612 ?auto_111613 ?auto_111614 ?auto_111615 ?auto_111616 ?auto_111617 )
      ( MAKE-6PILE ?auto_111612 ?auto_111613 ?auto_111614 ?auto_111615 ?auto_111616 ?auto_111617 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111634 - BLOCK
      ?auto_111635 - BLOCK
      ?auto_111636 - BLOCK
      ?auto_111637 - BLOCK
      ?auto_111638 - BLOCK
      ?auto_111639 - BLOCK
      ?auto_111640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111639 ) ( ON-TABLE ?auto_111634 ) ( ON ?auto_111635 ?auto_111634 ) ( ON ?auto_111636 ?auto_111635 ) ( ON ?auto_111637 ?auto_111636 ) ( ON ?auto_111638 ?auto_111637 ) ( ON ?auto_111639 ?auto_111638 ) ( not ( = ?auto_111634 ?auto_111635 ) ) ( not ( = ?auto_111634 ?auto_111636 ) ) ( not ( = ?auto_111634 ?auto_111637 ) ) ( not ( = ?auto_111634 ?auto_111638 ) ) ( not ( = ?auto_111634 ?auto_111639 ) ) ( not ( = ?auto_111634 ?auto_111640 ) ) ( not ( = ?auto_111635 ?auto_111636 ) ) ( not ( = ?auto_111635 ?auto_111637 ) ) ( not ( = ?auto_111635 ?auto_111638 ) ) ( not ( = ?auto_111635 ?auto_111639 ) ) ( not ( = ?auto_111635 ?auto_111640 ) ) ( not ( = ?auto_111636 ?auto_111637 ) ) ( not ( = ?auto_111636 ?auto_111638 ) ) ( not ( = ?auto_111636 ?auto_111639 ) ) ( not ( = ?auto_111636 ?auto_111640 ) ) ( not ( = ?auto_111637 ?auto_111638 ) ) ( not ( = ?auto_111637 ?auto_111639 ) ) ( not ( = ?auto_111637 ?auto_111640 ) ) ( not ( = ?auto_111638 ?auto_111639 ) ) ( not ( = ?auto_111638 ?auto_111640 ) ) ( not ( = ?auto_111639 ?auto_111640 ) ) ( ON-TABLE ?auto_111640 ) ( CLEAR ?auto_111640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_111640 )
      ( MAKE-7PILE ?auto_111634 ?auto_111635 ?auto_111636 ?auto_111637 ?auto_111638 ?auto_111639 ?auto_111640 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111641 - BLOCK
      ?auto_111642 - BLOCK
      ?auto_111643 - BLOCK
      ?auto_111644 - BLOCK
      ?auto_111645 - BLOCK
      ?auto_111646 - BLOCK
      ?auto_111647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111641 ) ( ON ?auto_111642 ?auto_111641 ) ( ON ?auto_111643 ?auto_111642 ) ( ON ?auto_111644 ?auto_111643 ) ( ON ?auto_111645 ?auto_111644 ) ( not ( = ?auto_111641 ?auto_111642 ) ) ( not ( = ?auto_111641 ?auto_111643 ) ) ( not ( = ?auto_111641 ?auto_111644 ) ) ( not ( = ?auto_111641 ?auto_111645 ) ) ( not ( = ?auto_111641 ?auto_111646 ) ) ( not ( = ?auto_111641 ?auto_111647 ) ) ( not ( = ?auto_111642 ?auto_111643 ) ) ( not ( = ?auto_111642 ?auto_111644 ) ) ( not ( = ?auto_111642 ?auto_111645 ) ) ( not ( = ?auto_111642 ?auto_111646 ) ) ( not ( = ?auto_111642 ?auto_111647 ) ) ( not ( = ?auto_111643 ?auto_111644 ) ) ( not ( = ?auto_111643 ?auto_111645 ) ) ( not ( = ?auto_111643 ?auto_111646 ) ) ( not ( = ?auto_111643 ?auto_111647 ) ) ( not ( = ?auto_111644 ?auto_111645 ) ) ( not ( = ?auto_111644 ?auto_111646 ) ) ( not ( = ?auto_111644 ?auto_111647 ) ) ( not ( = ?auto_111645 ?auto_111646 ) ) ( not ( = ?auto_111645 ?auto_111647 ) ) ( not ( = ?auto_111646 ?auto_111647 ) ) ( ON-TABLE ?auto_111647 ) ( CLEAR ?auto_111647 ) ( HOLDING ?auto_111646 ) ( CLEAR ?auto_111645 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111641 ?auto_111642 ?auto_111643 ?auto_111644 ?auto_111645 ?auto_111646 )
      ( MAKE-7PILE ?auto_111641 ?auto_111642 ?auto_111643 ?auto_111644 ?auto_111645 ?auto_111646 ?auto_111647 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111648 - BLOCK
      ?auto_111649 - BLOCK
      ?auto_111650 - BLOCK
      ?auto_111651 - BLOCK
      ?auto_111652 - BLOCK
      ?auto_111653 - BLOCK
      ?auto_111654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111648 ) ( ON ?auto_111649 ?auto_111648 ) ( ON ?auto_111650 ?auto_111649 ) ( ON ?auto_111651 ?auto_111650 ) ( ON ?auto_111652 ?auto_111651 ) ( not ( = ?auto_111648 ?auto_111649 ) ) ( not ( = ?auto_111648 ?auto_111650 ) ) ( not ( = ?auto_111648 ?auto_111651 ) ) ( not ( = ?auto_111648 ?auto_111652 ) ) ( not ( = ?auto_111648 ?auto_111653 ) ) ( not ( = ?auto_111648 ?auto_111654 ) ) ( not ( = ?auto_111649 ?auto_111650 ) ) ( not ( = ?auto_111649 ?auto_111651 ) ) ( not ( = ?auto_111649 ?auto_111652 ) ) ( not ( = ?auto_111649 ?auto_111653 ) ) ( not ( = ?auto_111649 ?auto_111654 ) ) ( not ( = ?auto_111650 ?auto_111651 ) ) ( not ( = ?auto_111650 ?auto_111652 ) ) ( not ( = ?auto_111650 ?auto_111653 ) ) ( not ( = ?auto_111650 ?auto_111654 ) ) ( not ( = ?auto_111651 ?auto_111652 ) ) ( not ( = ?auto_111651 ?auto_111653 ) ) ( not ( = ?auto_111651 ?auto_111654 ) ) ( not ( = ?auto_111652 ?auto_111653 ) ) ( not ( = ?auto_111652 ?auto_111654 ) ) ( not ( = ?auto_111653 ?auto_111654 ) ) ( ON-TABLE ?auto_111654 ) ( CLEAR ?auto_111652 ) ( ON ?auto_111653 ?auto_111654 ) ( CLEAR ?auto_111653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111654 )
      ( MAKE-7PILE ?auto_111648 ?auto_111649 ?auto_111650 ?auto_111651 ?auto_111652 ?auto_111653 ?auto_111654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111655 - BLOCK
      ?auto_111656 - BLOCK
      ?auto_111657 - BLOCK
      ?auto_111658 - BLOCK
      ?auto_111659 - BLOCK
      ?auto_111660 - BLOCK
      ?auto_111661 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111655 ) ( ON ?auto_111656 ?auto_111655 ) ( ON ?auto_111657 ?auto_111656 ) ( ON ?auto_111658 ?auto_111657 ) ( not ( = ?auto_111655 ?auto_111656 ) ) ( not ( = ?auto_111655 ?auto_111657 ) ) ( not ( = ?auto_111655 ?auto_111658 ) ) ( not ( = ?auto_111655 ?auto_111659 ) ) ( not ( = ?auto_111655 ?auto_111660 ) ) ( not ( = ?auto_111655 ?auto_111661 ) ) ( not ( = ?auto_111656 ?auto_111657 ) ) ( not ( = ?auto_111656 ?auto_111658 ) ) ( not ( = ?auto_111656 ?auto_111659 ) ) ( not ( = ?auto_111656 ?auto_111660 ) ) ( not ( = ?auto_111656 ?auto_111661 ) ) ( not ( = ?auto_111657 ?auto_111658 ) ) ( not ( = ?auto_111657 ?auto_111659 ) ) ( not ( = ?auto_111657 ?auto_111660 ) ) ( not ( = ?auto_111657 ?auto_111661 ) ) ( not ( = ?auto_111658 ?auto_111659 ) ) ( not ( = ?auto_111658 ?auto_111660 ) ) ( not ( = ?auto_111658 ?auto_111661 ) ) ( not ( = ?auto_111659 ?auto_111660 ) ) ( not ( = ?auto_111659 ?auto_111661 ) ) ( not ( = ?auto_111660 ?auto_111661 ) ) ( ON-TABLE ?auto_111661 ) ( ON ?auto_111660 ?auto_111661 ) ( CLEAR ?auto_111660 ) ( HOLDING ?auto_111659 ) ( CLEAR ?auto_111658 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111655 ?auto_111656 ?auto_111657 ?auto_111658 ?auto_111659 )
      ( MAKE-7PILE ?auto_111655 ?auto_111656 ?auto_111657 ?auto_111658 ?auto_111659 ?auto_111660 ?auto_111661 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111662 - BLOCK
      ?auto_111663 - BLOCK
      ?auto_111664 - BLOCK
      ?auto_111665 - BLOCK
      ?auto_111666 - BLOCK
      ?auto_111667 - BLOCK
      ?auto_111668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111662 ) ( ON ?auto_111663 ?auto_111662 ) ( ON ?auto_111664 ?auto_111663 ) ( ON ?auto_111665 ?auto_111664 ) ( not ( = ?auto_111662 ?auto_111663 ) ) ( not ( = ?auto_111662 ?auto_111664 ) ) ( not ( = ?auto_111662 ?auto_111665 ) ) ( not ( = ?auto_111662 ?auto_111666 ) ) ( not ( = ?auto_111662 ?auto_111667 ) ) ( not ( = ?auto_111662 ?auto_111668 ) ) ( not ( = ?auto_111663 ?auto_111664 ) ) ( not ( = ?auto_111663 ?auto_111665 ) ) ( not ( = ?auto_111663 ?auto_111666 ) ) ( not ( = ?auto_111663 ?auto_111667 ) ) ( not ( = ?auto_111663 ?auto_111668 ) ) ( not ( = ?auto_111664 ?auto_111665 ) ) ( not ( = ?auto_111664 ?auto_111666 ) ) ( not ( = ?auto_111664 ?auto_111667 ) ) ( not ( = ?auto_111664 ?auto_111668 ) ) ( not ( = ?auto_111665 ?auto_111666 ) ) ( not ( = ?auto_111665 ?auto_111667 ) ) ( not ( = ?auto_111665 ?auto_111668 ) ) ( not ( = ?auto_111666 ?auto_111667 ) ) ( not ( = ?auto_111666 ?auto_111668 ) ) ( not ( = ?auto_111667 ?auto_111668 ) ) ( ON-TABLE ?auto_111668 ) ( ON ?auto_111667 ?auto_111668 ) ( CLEAR ?auto_111665 ) ( ON ?auto_111666 ?auto_111667 ) ( CLEAR ?auto_111666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111668 ?auto_111667 )
      ( MAKE-7PILE ?auto_111662 ?auto_111663 ?auto_111664 ?auto_111665 ?auto_111666 ?auto_111667 ?auto_111668 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111669 - BLOCK
      ?auto_111670 - BLOCK
      ?auto_111671 - BLOCK
      ?auto_111672 - BLOCK
      ?auto_111673 - BLOCK
      ?auto_111674 - BLOCK
      ?auto_111675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111669 ) ( ON ?auto_111670 ?auto_111669 ) ( ON ?auto_111671 ?auto_111670 ) ( not ( = ?auto_111669 ?auto_111670 ) ) ( not ( = ?auto_111669 ?auto_111671 ) ) ( not ( = ?auto_111669 ?auto_111672 ) ) ( not ( = ?auto_111669 ?auto_111673 ) ) ( not ( = ?auto_111669 ?auto_111674 ) ) ( not ( = ?auto_111669 ?auto_111675 ) ) ( not ( = ?auto_111670 ?auto_111671 ) ) ( not ( = ?auto_111670 ?auto_111672 ) ) ( not ( = ?auto_111670 ?auto_111673 ) ) ( not ( = ?auto_111670 ?auto_111674 ) ) ( not ( = ?auto_111670 ?auto_111675 ) ) ( not ( = ?auto_111671 ?auto_111672 ) ) ( not ( = ?auto_111671 ?auto_111673 ) ) ( not ( = ?auto_111671 ?auto_111674 ) ) ( not ( = ?auto_111671 ?auto_111675 ) ) ( not ( = ?auto_111672 ?auto_111673 ) ) ( not ( = ?auto_111672 ?auto_111674 ) ) ( not ( = ?auto_111672 ?auto_111675 ) ) ( not ( = ?auto_111673 ?auto_111674 ) ) ( not ( = ?auto_111673 ?auto_111675 ) ) ( not ( = ?auto_111674 ?auto_111675 ) ) ( ON-TABLE ?auto_111675 ) ( ON ?auto_111674 ?auto_111675 ) ( ON ?auto_111673 ?auto_111674 ) ( CLEAR ?auto_111673 ) ( HOLDING ?auto_111672 ) ( CLEAR ?auto_111671 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111669 ?auto_111670 ?auto_111671 ?auto_111672 )
      ( MAKE-7PILE ?auto_111669 ?auto_111670 ?auto_111671 ?auto_111672 ?auto_111673 ?auto_111674 ?auto_111675 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111676 - BLOCK
      ?auto_111677 - BLOCK
      ?auto_111678 - BLOCK
      ?auto_111679 - BLOCK
      ?auto_111680 - BLOCK
      ?auto_111681 - BLOCK
      ?auto_111682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111676 ) ( ON ?auto_111677 ?auto_111676 ) ( ON ?auto_111678 ?auto_111677 ) ( not ( = ?auto_111676 ?auto_111677 ) ) ( not ( = ?auto_111676 ?auto_111678 ) ) ( not ( = ?auto_111676 ?auto_111679 ) ) ( not ( = ?auto_111676 ?auto_111680 ) ) ( not ( = ?auto_111676 ?auto_111681 ) ) ( not ( = ?auto_111676 ?auto_111682 ) ) ( not ( = ?auto_111677 ?auto_111678 ) ) ( not ( = ?auto_111677 ?auto_111679 ) ) ( not ( = ?auto_111677 ?auto_111680 ) ) ( not ( = ?auto_111677 ?auto_111681 ) ) ( not ( = ?auto_111677 ?auto_111682 ) ) ( not ( = ?auto_111678 ?auto_111679 ) ) ( not ( = ?auto_111678 ?auto_111680 ) ) ( not ( = ?auto_111678 ?auto_111681 ) ) ( not ( = ?auto_111678 ?auto_111682 ) ) ( not ( = ?auto_111679 ?auto_111680 ) ) ( not ( = ?auto_111679 ?auto_111681 ) ) ( not ( = ?auto_111679 ?auto_111682 ) ) ( not ( = ?auto_111680 ?auto_111681 ) ) ( not ( = ?auto_111680 ?auto_111682 ) ) ( not ( = ?auto_111681 ?auto_111682 ) ) ( ON-TABLE ?auto_111682 ) ( ON ?auto_111681 ?auto_111682 ) ( ON ?auto_111680 ?auto_111681 ) ( CLEAR ?auto_111678 ) ( ON ?auto_111679 ?auto_111680 ) ( CLEAR ?auto_111679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111682 ?auto_111681 ?auto_111680 )
      ( MAKE-7PILE ?auto_111676 ?auto_111677 ?auto_111678 ?auto_111679 ?auto_111680 ?auto_111681 ?auto_111682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111683 - BLOCK
      ?auto_111684 - BLOCK
      ?auto_111685 - BLOCK
      ?auto_111686 - BLOCK
      ?auto_111687 - BLOCK
      ?auto_111688 - BLOCK
      ?auto_111689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111683 ) ( ON ?auto_111684 ?auto_111683 ) ( not ( = ?auto_111683 ?auto_111684 ) ) ( not ( = ?auto_111683 ?auto_111685 ) ) ( not ( = ?auto_111683 ?auto_111686 ) ) ( not ( = ?auto_111683 ?auto_111687 ) ) ( not ( = ?auto_111683 ?auto_111688 ) ) ( not ( = ?auto_111683 ?auto_111689 ) ) ( not ( = ?auto_111684 ?auto_111685 ) ) ( not ( = ?auto_111684 ?auto_111686 ) ) ( not ( = ?auto_111684 ?auto_111687 ) ) ( not ( = ?auto_111684 ?auto_111688 ) ) ( not ( = ?auto_111684 ?auto_111689 ) ) ( not ( = ?auto_111685 ?auto_111686 ) ) ( not ( = ?auto_111685 ?auto_111687 ) ) ( not ( = ?auto_111685 ?auto_111688 ) ) ( not ( = ?auto_111685 ?auto_111689 ) ) ( not ( = ?auto_111686 ?auto_111687 ) ) ( not ( = ?auto_111686 ?auto_111688 ) ) ( not ( = ?auto_111686 ?auto_111689 ) ) ( not ( = ?auto_111687 ?auto_111688 ) ) ( not ( = ?auto_111687 ?auto_111689 ) ) ( not ( = ?auto_111688 ?auto_111689 ) ) ( ON-TABLE ?auto_111689 ) ( ON ?auto_111688 ?auto_111689 ) ( ON ?auto_111687 ?auto_111688 ) ( ON ?auto_111686 ?auto_111687 ) ( CLEAR ?auto_111686 ) ( HOLDING ?auto_111685 ) ( CLEAR ?auto_111684 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111683 ?auto_111684 ?auto_111685 )
      ( MAKE-7PILE ?auto_111683 ?auto_111684 ?auto_111685 ?auto_111686 ?auto_111687 ?auto_111688 ?auto_111689 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111690 - BLOCK
      ?auto_111691 - BLOCK
      ?auto_111692 - BLOCK
      ?auto_111693 - BLOCK
      ?auto_111694 - BLOCK
      ?auto_111695 - BLOCK
      ?auto_111696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111690 ) ( ON ?auto_111691 ?auto_111690 ) ( not ( = ?auto_111690 ?auto_111691 ) ) ( not ( = ?auto_111690 ?auto_111692 ) ) ( not ( = ?auto_111690 ?auto_111693 ) ) ( not ( = ?auto_111690 ?auto_111694 ) ) ( not ( = ?auto_111690 ?auto_111695 ) ) ( not ( = ?auto_111690 ?auto_111696 ) ) ( not ( = ?auto_111691 ?auto_111692 ) ) ( not ( = ?auto_111691 ?auto_111693 ) ) ( not ( = ?auto_111691 ?auto_111694 ) ) ( not ( = ?auto_111691 ?auto_111695 ) ) ( not ( = ?auto_111691 ?auto_111696 ) ) ( not ( = ?auto_111692 ?auto_111693 ) ) ( not ( = ?auto_111692 ?auto_111694 ) ) ( not ( = ?auto_111692 ?auto_111695 ) ) ( not ( = ?auto_111692 ?auto_111696 ) ) ( not ( = ?auto_111693 ?auto_111694 ) ) ( not ( = ?auto_111693 ?auto_111695 ) ) ( not ( = ?auto_111693 ?auto_111696 ) ) ( not ( = ?auto_111694 ?auto_111695 ) ) ( not ( = ?auto_111694 ?auto_111696 ) ) ( not ( = ?auto_111695 ?auto_111696 ) ) ( ON-TABLE ?auto_111696 ) ( ON ?auto_111695 ?auto_111696 ) ( ON ?auto_111694 ?auto_111695 ) ( ON ?auto_111693 ?auto_111694 ) ( CLEAR ?auto_111691 ) ( ON ?auto_111692 ?auto_111693 ) ( CLEAR ?auto_111692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111696 ?auto_111695 ?auto_111694 ?auto_111693 )
      ( MAKE-7PILE ?auto_111690 ?auto_111691 ?auto_111692 ?auto_111693 ?auto_111694 ?auto_111695 ?auto_111696 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111697 - BLOCK
      ?auto_111698 - BLOCK
      ?auto_111699 - BLOCK
      ?auto_111700 - BLOCK
      ?auto_111701 - BLOCK
      ?auto_111702 - BLOCK
      ?auto_111703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111697 ) ( not ( = ?auto_111697 ?auto_111698 ) ) ( not ( = ?auto_111697 ?auto_111699 ) ) ( not ( = ?auto_111697 ?auto_111700 ) ) ( not ( = ?auto_111697 ?auto_111701 ) ) ( not ( = ?auto_111697 ?auto_111702 ) ) ( not ( = ?auto_111697 ?auto_111703 ) ) ( not ( = ?auto_111698 ?auto_111699 ) ) ( not ( = ?auto_111698 ?auto_111700 ) ) ( not ( = ?auto_111698 ?auto_111701 ) ) ( not ( = ?auto_111698 ?auto_111702 ) ) ( not ( = ?auto_111698 ?auto_111703 ) ) ( not ( = ?auto_111699 ?auto_111700 ) ) ( not ( = ?auto_111699 ?auto_111701 ) ) ( not ( = ?auto_111699 ?auto_111702 ) ) ( not ( = ?auto_111699 ?auto_111703 ) ) ( not ( = ?auto_111700 ?auto_111701 ) ) ( not ( = ?auto_111700 ?auto_111702 ) ) ( not ( = ?auto_111700 ?auto_111703 ) ) ( not ( = ?auto_111701 ?auto_111702 ) ) ( not ( = ?auto_111701 ?auto_111703 ) ) ( not ( = ?auto_111702 ?auto_111703 ) ) ( ON-TABLE ?auto_111703 ) ( ON ?auto_111702 ?auto_111703 ) ( ON ?auto_111701 ?auto_111702 ) ( ON ?auto_111700 ?auto_111701 ) ( ON ?auto_111699 ?auto_111700 ) ( CLEAR ?auto_111699 ) ( HOLDING ?auto_111698 ) ( CLEAR ?auto_111697 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111697 ?auto_111698 )
      ( MAKE-7PILE ?auto_111697 ?auto_111698 ?auto_111699 ?auto_111700 ?auto_111701 ?auto_111702 ?auto_111703 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111704 - BLOCK
      ?auto_111705 - BLOCK
      ?auto_111706 - BLOCK
      ?auto_111707 - BLOCK
      ?auto_111708 - BLOCK
      ?auto_111709 - BLOCK
      ?auto_111710 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111704 ) ( not ( = ?auto_111704 ?auto_111705 ) ) ( not ( = ?auto_111704 ?auto_111706 ) ) ( not ( = ?auto_111704 ?auto_111707 ) ) ( not ( = ?auto_111704 ?auto_111708 ) ) ( not ( = ?auto_111704 ?auto_111709 ) ) ( not ( = ?auto_111704 ?auto_111710 ) ) ( not ( = ?auto_111705 ?auto_111706 ) ) ( not ( = ?auto_111705 ?auto_111707 ) ) ( not ( = ?auto_111705 ?auto_111708 ) ) ( not ( = ?auto_111705 ?auto_111709 ) ) ( not ( = ?auto_111705 ?auto_111710 ) ) ( not ( = ?auto_111706 ?auto_111707 ) ) ( not ( = ?auto_111706 ?auto_111708 ) ) ( not ( = ?auto_111706 ?auto_111709 ) ) ( not ( = ?auto_111706 ?auto_111710 ) ) ( not ( = ?auto_111707 ?auto_111708 ) ) ( not ( = ?auto_111707 ?auto_111709 ) ) ( not ( = ?auto_111707 ?auto_111710 ) ) ( not ( = ?auto_111708 ?auto_111709 ) ) ( not ( = ?auto_111708 ?auto_111710 ) ) ( not ( = ?auto_111709 ?auto_111710 ) ) ( ON-TABLE ?auto_111710 ) ( ON ?auto_111709 ?auto_111710 ) ( ON ?auto_111708 ?auto_111709 ) ( ON ?auto_111707 ?auto_111708 ) ( ON ?auto_111706 ?auto_111707 ) ( CLEAR ?auto_111704 ) ( ON ?auto_111705 ?auto_111706 ) ( CLEAR ?auto_111705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111710 ?auto_111709 ?auto_111708 ?auto_111707 ?auto_111706 )
      ( MAKE-7PILE ?auto_111704 ?auto_111705 ?auto_111706 ?auto_111707 ?auto_111708 ?auto_111709 ?auto_111710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111711 - BLOCK
      ?auto_111712 - BLOCK
      ?auto_111713 - BLOCK
      ?auto_111714 - BLOCK
      ?auto_111715 - BLOCK
      ?auto_111716 - BLOCK
      ?auto_111717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111711 ?auto_111712 ) ) ( not ( = ?auto_111711 ?auto_111713 ) ) ( not ( = ?auto_111711 ?auto_111714 ) ) ( not ( = ?auto_111711 ?auto_111715 ) ) ( not ( = ?auto_111711 ?auto_111716 ) ) ( not ( = ?auto_111711 ?auto_111717 ) ) ( not ( = ?auto_111712 ?auto_111713 ) ) ( not ( = ?auto_111712 ?auto_111714 ) ) ( not ( = ?auto_111712 ?auto_111715 ) ) ( not ( = ?auto_111712 ?auto_111716 ) ) ( not ( = ?auto_111712 ?auto_111717 ) ) ( not ( = ?auto_111713 ?auto_111714 ) ) ( not ( = ?auto_111713 ?auto_111715 ) ) ( not ( = ?auto_111713 ?auto_111716 ) ) ( not ( = ?auto_111713 ?auto_111717 ) ) ( not ( = ?auto_111714 ?auto_111715 ) ) ( not ( = ?auto_111714 ?auto_111716 ) ) ( not ( = ?auto_111714 ?auto_111717 ) ) ( not ( = ?auto_111715 ?auto_111716 ) ) ( not ( = ?auto_111715 ?auto_111717 ) ) ( not ( = ?auto_111716 ?auto_111717 ) ) ( ON-TABLE ?auto_111717 ) ( ON ?auto_111716 ?auto_111717 ) ( ON ?auto_111715 ?auto_111716 ) ( ON ?auto_111714 ?auto_111715 ) ( ON ?auto_111713 ?auto_111714 ) ( ON ?auto_111712 ?auto_111713 ) ( CLEAR ?auto_111712 ) ( HOLDING ?auto_111711 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111711 )
      ( MAKE-7PILE ?auto_111711 ?auto_111712 ?auto_111713 ?auto_111714 ?auto_111715 ?auto_111716 ?auto_111717 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111718 - BLOCK
      ?auto_111719 - BLOCK
      ?auto_111720 - BLOCK
      ?auto_111721 - BLOCK
      ?auto_111722 - BLOCK
      ?auto_111723 - BLOCK
      ?auto_111724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111718 ?auto_111719 ) ) ( not ( = ?auto_111718 ?auto_111720 ) ) ( not ( = ?auto_111718 ?auto_111721 ) ) ( not ( = ?auto_111718 ?auto_111722 ) ) ( not ( = ?auto_111718 ?auto_111723 ) ) ( not ( = ?auto_111718 ?auto_111724 ) ) ( not ( = ?auto_111719 ?auto_111720 ) ) ( not ( = ?auto_111719 ?auto_111721 ) ) ( not ( = ?auto_111719 ?auto_111722 ) ) ( not ( = ?auto_111719 ?auto_111723 ) ) ( not ( = ?auto_111719 ?auto_111724 ) ) ( not ( = ?auto_111720 ?auto_111721 ) ) ( not ( = ?auto_111720 ?auto_111722 ) ) ( not ( = ?auto_111720 ?auto_111723 ) ) ( not ( = ?auto_111720 ?auto_111724 ) ) ( not ( = ?auto_111721 ?auto_111722 ) ) ( not ( = ?auto_111721 ?auto_111723 ) ) ( not ( = ?auto_111721 ?auto_111724 ) ) ( not ( = ?auto_111722 ?auto_111723 ) ) ( not ( = ?auto_111722 ?auto_111724 ) ) ( not ( = ?auto_111723 ?auto_111724 ) ) ( ON-TABLE ?auto_111724 ) ( ON ?auto_111723 ?auto_111724 ) ( ON ?auto_111722 ?auto_111723 ) ( ON ?auto_111721 ?auto_111722 ) ( ON ?auto_111720 ?auto_111721 ) ( ON ?auto_111719 ?auto_111720 ) ( ON ?auto_111718 ?auto_111719 ) ( CLEAR ?auto_111718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111724 ?auto_111723 ?auto_111722 ?auto_111721 ?auto_111720 ?auto_111719 )
      ( MAKE-7PILE ?auto_111718 ?auto_111719 ?auto_111720 ?auto_111721 ?auto_111722 ?auto_111723 ?auto_111724 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111732 - BLOCK
      ?auto_111733 - BLOCK
      ?auto_111734 - BLOCK
      ?auto_111735 - BLOCK
      ?auto_111736 - BLOCK
      ?auto_111737 - BLOCK
      ?auto_111738 - BLOCK
    )
    :vars
    (
      ?auto_111739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111732 ?auto_111733 ) ) ( not ( = ?auto_111732 ?auto_111734 ) ) ( not ( = ?auto_111732 ?auto_111735 ) ) ( not ( = ?auto_111732 ?auto_111736 ) ) ( not ( = ?auto_111732 ?auto_111737 ) ) ( not ( = ?auto_111732 ?auto_111738 ) ) ( not ( = ?auto_111733 ?auto_111734 ) ) ( not ( = ?auto_111733 ?auto_111735 ) ) ( not ( = ?auto_111733 ?auto_111736 ) ) ( not ( = ?auto_111733 ?auto_111737 ) ) ( not ( = ?auto_111733 ?auto_111738 ) ) ( not ( = ?auto_111734 ?auto_111735 ) ) ( not ( = ?auto_111734 ?auto_111736 ) ) ( not ( = ?auto_111734 ?auto_111737 ) ) ( not ( = ?auto_111734 ?auto_111738 ) ) ( not ( = ?auto_111735 ?auto_111736 ) ) ( not ( = ?auto_111735 ?auto_111737 ) ) ( not ( = ?auto_111735 ?auto_111738 ) ) ( not ( = ?auto_111736 ?auto_111737 ) ) ( not ( = ?auto_111736 ?auto_111738 ) ) ( not ( = ?auto_111737 ?auto_111738 ) ) ( ON-TABLE ?auto_111738 ) ( ON ?auto_111737 ?auto_111738 ) ( ON ?auto_111736 ?auto_111737 ) ( ON ?auto_111735 ?auto_111736 ) ( ON ?auto_111734 ?auto_111735 ) ( ON ?auto_111733 ?auto_111734 ) ( CLEAR ?auto_111733 ) ( ON ?auto_111732 ?auto_111739 ) ( CLEAR ?auto_111732 ) ( HAND-EMPTY ) ( not ( = ?auto_111732 ?auto_111739 ) ) ( not ( = ?auto_111733 ?auto_111739 ) ) ( not ( = ?auto_111734 ?auto_111739 ) ) ( not ( = ?auto_111735 ?auto_111739 ) ) ( not ( = ?auto_111736 ?auto_111739 ) ) ( not ( = ?auto_111737 ?auto_111739 ) ) ( not ( = ?auto_111738 ?auto_111739 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111732 ?auto_111739 )
      ( MAKE-7PILE ?auto_111732 ?auto_111733 ?auto_111734 ?auto_111735 ?auto_111736 ?auto_111737 ?auto_111738 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111740 - BLOCK
      ?auto_111741 - BLOCK
      ?auto_111742 - BLOCK
      ?auto_111743 - BLOCK
      ?auto_111744 - BLOCK
      ?auto_111745 - BLOCK
      ?auto_111746 - BLOCK
    )
    :vars
    (
      ?auto_111747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111740 ?auto_111741 ) ) ( not ( = ?auto_111740 ?auto_111742 ) ) ( not ( = ?auto_111740 ?auto_111743 ) ) ( not ( = ?auto_111740 ?auto_111744 ) ) ( not ( = ?auto_111740 ?auto_111745 ) ) ( not ( = ?auto_111740 ?auto_111746 ) ) ( not ( = ?auto_111741 ?auto_111742 ) ) ( not ( = ?auto_111741 ?auto_111743 ) ) ( not ( = ?auto_111741 ?auto_111744 ) ) ( not ( = ?auto_111741 ?auto_111745 ) ) ( not ( = ?auto_111741 ?auto_111746 ) ) ( not ( = ?auto_111742 ?auto_111743 ) ) ( not ( = ?auto_111742 ?auto_111744 ) ) ( not ( = ?auto_111742 ?auto_111745 ) ) ( not ( = ?auto_111742 ?auto_111746 ) ) ( not ( = ?auto_111743 ?auto_111744 ) ) ( not ( = ?auto_111743 ?auto_111745 ) ) ( not ( = ?auto_111743 ?auto_111746 ) ) ( not ( = ?auto_111744 ?auto_111745 ) ) ( not ( = ?auto_111744 ?auto_111746 ) ) ( not ( = ?auto_111745 ?auto_111746 ) ) ( ON-TABLE ?auto_111746 ) ( ON ?auto_111745 ?auto_111746 ) ( ON ?auto_111744 ?auto_111745 ) ( ON ?auto_111743 ?auto_111744 ) ( ON ?auto_111742 ?auto_111743 ) ( ON ?auto_111740 ?auto_111747 ) ( CLEAR ?auto_111740 ) ( not ( = ?auto_111740 ?auto_111747 ) ) ( not ( = ?auto_111741 ?auto_111747 ) ) ( not ( = ?auto_111742 ?auto_111747 ) ) ( not ( = ?auto_111743 ?auto_111747 ) ) ( not ( = ?auto_111744 ?auto_111747 ) ) ( not ( = ?auto_111745 ?auto_111747 ) ) ( not ( = ?auto_111746 ?auto_111747 ) ) ( HOLDING ?auto_111741 ) ( CLEAR ?auto_111742 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111746 ?auto_111745 ?auto_111744 ?auto_111743 ?auto_111742 ?auto_111741 )
      ( MAKE-7PILE ?auto_111740 ?auto_111741 ?auto_111742 ?auto_111743 ?auto_111744 ?auto_111745 ?auto_111746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111748 - BLOCK
      ?auto_111749 - BLOCK
      ?auto_111750 - BLOCK
      ?auto_111751 - BLOCK
      ?auto_111752 - BLOCK
      ?auto_111753 - BLOCK
      ?auto_111754 - BLOCK
    )
    :vars
    (
      ?auto_111755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111748 ?auto_111749 ) ) ( not ( = ?auto_111748 ?auto_111750 ) ) ( not ( = ?auto_111748 ?auto_111751 ) ) ( not ( = ?auto_111748 ?auto_111752 ) ) ( not ( = ?auto_111748 ?auto_111753 ) ) ( not ( = ?auto_111748 ?auto_111754 ) ) ( not ( = ?auto_111749 ?auto_111750 ) ) ( not ( = ?auto_111749 ?auto_111751 ) ) ( not ( = ?auto_111749 ?auto_111752 ) ) ( not ( = ?auto_111749 ?auto_111753 ) ) ( not ( = ?auto_111749 ?auto_111754 ) ) ( not ( = ?auto_111750 ?auto_111751 ) ) ( not ( = ?auto_111750 ?auto_111752 ) ) ( not ( = ?auto_111750 ?auto_111753 ) ) ( not ( = ?auto_111750 ?auto_111754 ) ) ( not ( = ?auto_111751 ?auto_111752 ) ) ( not ( = ?auto_111751 ?auto_111753 ) ) ( not ( = ?auto_111751 ?auto_111754 ) ) ( not ( = ?auto_111752 ?auto_111753 ) ) ( not ( = ?auto_111752 ?auto_111754 ) ) ( not ( = ?auto_111753 ?auto_111754 ) ) ( ON-TABLE ?auto_111754 ) ( ON ?auto_111753 ?auto_111754 ) ( ON ?auto_111752 ?auto_111753 ) ( ON ?auto_111751 ?auto_111752 ) ( ON ?auto_111750 ?auto_111751 ) ( ON ?auto_111748 ?auto_111755 ) ( not ( = ?auto_111748 ?auto_111755 ) ) ( not ( = ?auto_111749 ?auto_111755 ) ) ( not ( = ?auto_111750 ?auto_111755 ) ) ( not ( = ?auto_111751 ?auto_111755 ) ) ( not ( = ?auto_111752 ?auto_111755 ) ) ( not ( = ?auto_111753 ?auto_111755 ) ) ( not ( = ?auto_111754 ?auto_111755 ) ) ( CLEAR ?auto_111750 ) ( ON ?auto_111749 ?auto_111748 ) ( CLEAR ?auto_111749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111755 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111755 ?auto_111748 )
      ( MAKE-7PILE ?auto_111748 ?auto_111749 ?auto_111750 ?auto_111751 ?auto_111752 ?auto_111753 ?auto_111754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111756 - BLOCK
      ?auto_111757 - BLOCK
      ?auto_111758 - BLOCK
      ?auto_111759 - BLOCK
      ?auto_111760 - BLOCK
      ?auto_111761 - BLOCK
      ?auto_111762 - BLOCK
    )
    :vars
    (
      ?auto_111763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111756 ?auto_111757 ) ) ( not ( = ?auto_111756 ?auto_111758 ) ) ( not ( = ?auto_111756 ?auto_111759 ) ) ( not ( = ?auto_111756 ?auto_111760 ) ) ( not ( = ?auto_111756 ?auto_111761 ) ) ( not ( = ?auto_111756 ?auto_111762 ) ) ( not ( = ?auto_111757 ?auto_111758 ) ) ( not ( = ?auto_111757 ?auto_111759 ) ) ( not ( = ?auto_111757 ?auto_111760 ) ) ( not ( = ?auto_111757 ?auto_111761 ) ) ( not ( = ?auto_111757 ?auto_111762 ) ) ( not ( = ?auto_111758 ?auto_111759 ) ) ( not ( = ?auto_111758 ?auto_111760 ) ) ( not ( = ?auto_111758 ?auto_111761 ) ) ( not ( = ?auto_111758 ?auto_111762 ) ) ( not ( = ?auto_111759 ?auto_111760 ) ) ( not ( = ?auto_111759 ?auto_111761 ) ) ( not ( = ?auto_111759 ?auto_111762 ) ) ( not ( = ?auto_111760 ?auto_111761 ) ) ( not ( = ?auto_111760 ?auto_111762 ) ) ( not ( = ?auto_111761 ?auto_111762 ) ) ( ON-TABLE ?auto_111762 ) ( ON ?auto_111761 ?auto_111762 ) ( ON ?auto_111760 ?auto_111761 ) ( ON ?auto_111759 ?auto_111760 ) ( ON ?auto_111756 ?auto_111763 ) ( not ( = ?auto_111756 ?auto_111763 ) ) ( not ( = ?auto_111757 ?auto_111763 ) ) ( not ( = ?auto_111758 ?auto_111763 ) ) ( not ( = ?auto_111759 ?auto_111763 ) ) ( not ( = ?auto_111760 ?auto_111763 ) ) ( not ( = ?auto_111761 ?auto_111763 ) ) ( not ( = ?auto_111762 ?auto_111763 ) ) ( ON ?auto_111757 ?auto_111756 ) ( CLEAR ?auto_111757 ) ( ON-TABLE ?auto_111763 ) ( HOLDING ?auto_111758 ) ( CLEAR ?auto_111759 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111762 ?auto_111761 ?auto_111760 ?auto_111759 ?auto_111758 )
      ( MAKE-7PILE ?auto_111756 ?auto_111757 ?auto_111758 ?auto_111759 ?auto_111760 ?auto_111761 ?auto_111762 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111764 - BLOCK
      ?auto_111765 - BLOCK
      ?auto_111766 - BLOCK
      ?auto_111767 - BLOCK
      ?auto_111768 - BLOCK
      ?auto_111769 - BLOCK
      ?auto_111770 - BLOCK
    )
    :vars
    (
      ?auto_111771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111764 ?auto_111765 ) ) ( not ( = ?auto_111764 ?auto_111766 ) ) ( not ( = ?auto_111764 ?auto_111767 ) ) ( not ( = ?auto_111764 ?auto_111768 ) ) ( not ( = ?auto_111764 ?auto_111769 ) ) ( not ( = ?auto_111764 ?auto_111770 ) ) ( not ( = ?auto_111765 ?auto_111766 ) ) ( not ( = ?auto_111765 ?auto_111767 ) ) ( not ( = ?auto_111765 ?auto_111768 ) ) ( not ( = ?auto_111765 ?auto_111769 ) ) ( not ( = ?auto_111765 ?auto_111770 ) ) ( not ( = ?auto_111766 ?auto_111767 ) ) ( not ( = ?auto_111766 ?auto_111768 ) ) ( not ( = ?auto_111766 ?auto_111769 ) ) ( not ( = ?auto_111766 ?auto_111770 ) ) ( not ( = ?auto_111767 ?auto_111768 ) ) ( not ( = ?auto_111767 ?auto_111769 ) ) ( not ( = ?auto_111767 ?auto_111770 ) ) ( not ( = ?auto_111768 ?auto_111769 ) ) ( not ( = ?auto_111768 ?auto_111770 ) ) ( not ( = ?auto_111769 ?auto_111770 ) ) ( ON-TABLE ?auto_111770 ) ( ON ?auto_111769 ?auto_111770 ) ( ON ?auto_111768 ?auto_111769 ) ( ON ?auto_111767 ?auto_111768 ) ( ON ?auto_111764 ?auto_111771 ) ( not ( = ?auto_111764 ?auto_111771 ) ) ( not ( = ?auto_111765 ?auto_111771 ) ) ( not ( = ?auto_111766 ?auto_111771 ) ) ( not ( = ?auto_111767 ?auto_111771 ) ) ( not ( = ?auto_111768 ?auto_111771 ) ) ( not ( = ?auto_111769 ?auto_111771 ) ) ( not ( = ?auto_111770 ?auto_111771 ) ) ( ON ?auto_111765 ?auto_111764 ) ( ON-TABLE ?auto_111771 ) ( CLEAR ?auto_111767 ) ( ON ?auto_111766 ?auto_111765 ) ( CLEAR ?auto_111766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111771 ?auto_111764 ?auto_111765 )
      ( MAKE-7PILE ?auto_111764 ?auto_111765 ?auto_111766 ?auto_111767 ?auto_111768 ?auto_111769 ?auto_111770 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111772 - BLOCK
      ?auto_111773 - BLOCK
      ?auto_111774 - BLOCK
      ?auto_111775 - BLOCK
      ?auto_111776 - BLOCK
      ?auto_111777 - BLOCK
      ?auto_111778 - BLOCK
    )
    :vars
    (
      ?auto_111779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111772 ?auto_111773 ) ) ( not ( = ?auto_111772 ?auto_111774 ) ) ( not ( = ?auto_111772 ?auto_111775 ) ) ( not ( = ?auto_111772 ?auto_111776 ) ) ( not ( = ?auto_111772 ?auto_111777 ) ) ( not ( = ?auto_111772 ?auto_111778 ) ) ( not ( = ?auto_111773 ?auto_111774 ) ) ( not ( = ?auto_111773 ?auto_111775 ) ) ( not ( = ?auto_111773 ?auto_111776 ) ) ( not ( = ?auto_111773 ?auto_111777 ) ) ( not ( = ?auto_111773 ?auto_111778 ) ) ( not ( = ?auto_111774 ?auto_111775 ) ) ( not ( = ?auto_111774 ?auto_111776 ) ) ( not ( = ?auto_111774 ?auto_111777 ) ) ( not ( = ?auto_111774 ?auto_111778 ) ) ( not ( = ?auto_111775 ?auto_111776 ) ) ( not ( = ?auto_111775 ?auto_111777 ) ) ( not ( = ?auto_111775 ?auto_111778 ) ) ( not ( = ?auto_111776 ?auto_111777 ) ) ( not ( = ?auto_111776 ?auto_111778 ) ) ( not ( = ?auto_111777 ?auto_111778 ) ) ( ON-TABLE ?auto_111778 ) ( ON ?auto_111777 ?auto_111778 ) ( ON ?auto_111776 ?auto_111777 ) ( ON ?auto_111772 ?auto_111779 ) ( not ( = ?auto_111772 ?auto_111779 ) ) ( not ( = ?auto_111773 ?auto_111779 ) ) ( not ( = ?auto_111774 ?auto_111779 ) ) ( not ( = ?auto_111775 ?auto_111779 ) ) ( not ( = ?auto_111776 ?auto_111779 ) ) ( not ( = ?auto_111777 ?auto_111779 ) ) ( not ( = ?auto_111778 ?auto_111779 ) ) ( ON ?auto_111773 ?auto_111772 ) ( ON-TABLE ?auto_111779 ) ( ON ?auto_111774 ?auto_111773 ) ( CLEAR ?auto_111774 ) ( HOLDING ?auto_111775 ) ( CLEAR ?auto_111776 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111778 ?auto_111777 ?auto_111776 ?auto_111775 )
      ( MAKE-7PILE ?auto_111772 ?auto_111773 ?auto_111774 ?auto_111775 ?auto_111776 ?auto_111777 ?auto_111778 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111780 - BLOCK
      ?auto_111781 - BLOCK
      ?auto_111782 - BLOCK
      ?auto_111783 - BLOCK
      ?auto_111784 - BLOCK
      ?auto_111785 - BLOCK
      ?auto_111786 - BLOCK
    )
    :vars
    (
      ?auto_111787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111780 ?auto_111781 ) ) ( not ( = ?auto_111780 ?auto_111782 ) ) ( not ( = ?auto_111780 ?auto_111783 ) ) ( not ( = ?auto_111780 ?auto_111784 ) ) ( not ( = ?auto_111780 ?auto_111785 ) ) ( not ( = ?auto_111780 ?auto_111786 ) ) ( not ( = ?auto_111781 ?auto_111782 ) ) ( not ( = ?auto_111781 ?auto_111783 ) ) ( not ( = ?auto_111781 ?auto_111784 ) ) ( not ( = ?auto_111781 ?auto_111785 ) ) ( not ( = ?auto_111781 ?auto_111786 ) ) ( not ( = ?auto_111782 ?auto_111783 ) ) ( not ( = ?auto_111782 ?auto_111784 ) ) ( not ( = ?auto_111782 ?auto_111785 ) ) ( not ( = ?auto_111782 ?auto_111786 ) ) ( not ( = ?auto_111783 ?auto_111784 ) ) ( not ( = ?auto_111783 ?auto_111785 ) ) ( not ( = ?auto_111783 ?auto_111786 ) ) ( not ( = ?auto_111784 ?auto_111785 ) ) ( not ( = ?auto_111784 ?auto_111786 ) ) ( not ( = ?auto_111785 ?auto_111786 ) ) ( ON-TABLE ?auto_111786 ) ( ON ?auto_111785 ?auto_111786 ) ( ON ?auto_111784 ?auto_111785 ) ( ON ?auto_111780 ?auto_111787 ) ( not ( = ?auto_111780 ?auto_111787 ) ) ( not ( = ?auto_111781 ?auto_111787 ) ) ( not ( = ?auto_111782 ?auto_111787 ) ) ( not ( = ?auto_111783 ?auto_111787 ) ) ( not ( = ?auto_111784 ?auto_111787 ) ) ( not ( = ?auto_111785 ?auto_111787 ) ) ( not ( = ?auto_111786 ?auto_111787 ) ) ( ON ?auto_111781 ?auto_111780 ) ( ON-TABLE ?auto_111787 ) ( ON ?auto_111782 ?auto_111781 ) ( CLEAR ?auto_111784 ) ( ON ?auto_111783 ?auto_111782 ) ( CLEAR ?auto_111783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_111787 ?auto_111780 ?auto_111781 ?auto_111782 )
      ( MAKE-7PILE ?auto_111780 ?auto_111781 ?auto_111782 ?auto_111783 ?auto_111784 ?auto_111785 ?auto_111786 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111788 - BLOCK
      ?auto_111789 - BLOCK
      ?auto_111790 - BLOCK
      ?auto_111791 - BLOCK
      ?auto_111792 - BLOCK
      ?auto_111793 - BLOCK
      ?auto_111794 - BLOCK
    )
    :vars
    (
      ?auto_111795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111788 ?auto_111789 ) ) ( not ( = ?auto_111788 ?auto_111790 ) ) ( not ( = ?auto_111788 ?auto_111791 ) ) ( not ( = ?auto_111788 ?auto_111792 ) ) ( not ( = ?auto_111788 ?auto_111793 ) ) ( not ( = ?auto_111788 ?auto_111794 ) ) ( not ( = ?auto_111789 ?auto_111790 ) ) ( not ( = ?auto_111789 ?auto_111791 ) ) ( not ( = ?auto_111789 ?auto_111792 ) ) ( not ( = ?auto_111789 ?auto_111793 ) ) ( not ( = ?auto_111789 ?auto_111794 ) ) ( not ( = ?auto_111790 ?auto_111791 ) ) ( not ( = ?auto_111790 ?auto_111792 ) ) ( not ( = ?auto_111790 ?auto_111793 ) ) ( not ( = ?auto_111790 ?auto_111794 ) ) ( not ( = ?auto_111791 ?auto_111792 ) ) ( not ( = ?auto_111791 ?auto_111793 ) ) ( not ( = ?auto_111791 ?auto_111794 ) ) ( not ( = ?auto_111792 ?auto_111793 ) ) ( not ( = ?auto_111792 ?auto_111794 ) ) ( not ( = ?auto_111793 ?auto_111794 ) ) ( ON-TABLE ?auto_111794 ) ( ON ?auto_111793 ?auto_111794 ) ( ON ?auto_111788 ?auto_111795 ) ( not ( = ?auto_111788 ?auto_111795 ) ) ( not ( = ?auto_111789 ?auto_111795 ) ) ( not ( = ?auto_111790 ?auto_111795 ) ) ( not ( = ?auto_111791 ?auto_111795 ) ) ( not ( = ?auto_111792 ?auto_111795 ) ) ( not ( = ?auto_111793 ?auto_111795 ) ) ( not ( = ?auto_111794 ?auto_111795 ) ) ( ON ?auto_111789 ?auto_111788 ) ( ON-TABLE ?auto_111795 ) ( ON ?auto_111790 ?auto_111789 ) ( ON ?auto_111791 ?auto_111790 ) ( CLEAR ?auto_111791 ) ( HOLDING ?auto_111792 ) ( CLEAR ?auto_111793 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_111794 ?auto_111793 ?auto_111792 )
      ( MAKE-7PILE ?auto_111788 ?auto_111789 ?auto_111790 ?auto_111791 ?auto_111792 ?auto_111793 ?auto_111794 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111796 - BLOCK
      ?auto_111797 - BLOCK
      ?auto_111798 - BLOCK
      ?auto_111799 - BLOCK
      ?auto_111800 - BLOCK
      ?auto_111801 - BLOCK
      ?auto_111802 - BLOCK
    )
    :vars
    (
      ?auto_111803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111796 ?auto_111797 ) ) ( not ( = ?auto_111796 ?auto_111798 ) ) ( not ( = ?auto_111796 ?auto_111799 ) ) ( not ( = ?auto_111796 ?auto_111800 ) ) ( not ( = ?auto_111796 ?auto_111801 ) ) ( not ( = ?auto_111796 ?auto_111802 ) ) ( not ( = ?auto_111797 ?auto_111798 ) ) ( not ( = ?auto_111797 ?auto_111799 ) ) ( not ( = ?auto_111797 ?auto_111800 ) ) ( not ( = ?auto_111797 ?auto_111801 ) ) ( not ( = ?auto_111797 ?auto_111802 ) ) ( not ( = ?auto_111798 ?auto_111799 ) ) ( not ( = ?auto_111798 ?auto_111800 ) ) ( not ( = ?auto_111798 ?auto_111801 ) ) ( not ( = ?auto_111798 ?auto_111802 ) ) ( not ( = ?auto_111799 ?auto_111800 ) ) ( not ( = ?auto_111799 ?auto_111801 ) ) ( not ( = ?auto_111799 ?auto_111802 ) ) ( not ( = ?auto_111800 ?auto_111801 ) ) ( not ( = ?auto_111800 ?auto_111802 ) ) ( not ( = ?auto_111801 ?auto_111802 ) ) ( ON-TABLE ?auto_111802 ) ( ON ?auto_111801 ?auto_111802 ) ( ON ?auto_111796 ?auto_111803 ) ( not ( = ?auto_111796 ?auto_111803 ) ) ( not ( = ?auto_111797 ?auto_111803 ) ) ( not ( = ?auto_111798 ?auto_111803 ) ) ( not ( = ?auto_111799 ?auto_111803 ) ) ( not ( = ?auto_111800 ?auto_111803 ) ) ( not ( = ?auto_111801 ?auto_111803 ) ) ( not ( = ?auto_111802 ?auto_111803 ) ) ( ON ?auto_111797 ?auto_111796 ) ( ON-TABLE ?auto_111803 ) ( ON ?auto_111798 ?auto_111797 ) ( ON ?auto_111799 ?auto_111798 ) ( CLEAR ?auto_111801 ) ( ON ?auto_111800 ?auto_111799 ) ( CLEAR ?auto_111800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111803 ?auto_111796 ?auto_111797 ?auto_111798 ?auto_111799 )
      ( MAKE-7PILE ?auto_111796 ?auto_111797 ?auto_111798 ?auto_111799 ?auto_111800 ?auto_111801 ?auto_111802 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111804 - BLOCK
      ?auto_111805 - BLOCK
      ?auto_111806 - BLOCK
      ?auto_111807 - BLOCK
      ?auto_111808 - BLOCK
      ?auto_111809 - BLOCK
      ?auto_111810 - BLOCK
    )
    :vars
    (
      ?auto_111811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111804 ?auto_111805 ) ) ( not ( = ?auto_111804 ?auto_111806 ) ) ( not ( = ?auto_111804 ?auto_111807 ) ) ( not ( = ?auto_111804 ?auto_111808 ) ) ( not ( = ?auto_111804 ?auto_111809 ) ) ( not ( = ?auto_111804 ?auto_111810 ) ) ( not ( = ?auto_111805 ?auto_111806 ) ) ( not ( = ?auto_111805 ?auto_111807 ) ) ( not ( = ?auto_111805 ?auto_111808 ) ) ( not ( = ?auto_111805 ?auto_111809 ) ) ( not ( = ?auto_111805 ?auto_111810 ) ) ( not ( = ?auto_111806 ?auto_111807 ) ) ( not ( = ?auto_111806 ?auto_111808 ) ) ( not ( = ?auto_111806 ?auto_111809 ) ) ( not ( = ?auto_111806 ?auto_111810 ) ) ( not ( = ?auto_111807 ?auto_111808 ) ) ( not ( = ?auto_111807 ?auto_111809 ) ) ( not ( = ?auto_111807 ?auto_111810 ) ) ( not ( = ?auto_111808 ?auto_111809 ) ) ( not ( = ?auto_111808 ?auto_111810 ) ) ( not ( = ?auto_111809 ?auto_111810 ) ) ( ON-TABLE ?auto_111810 ) ( ON ?auto_111804 ?auto_111811 ) ( not ( = ?auto_111804 ?auto_111811 ) ) ( not ( = ?auto_111805 ?auto_111811 ) ) ( not ( = ?auto_111806 ?auto_111811 ) ) ( not ( = ?auto_111807 ?auto_111811 ) ) ( not ( = ?auto_111808 ?auto_111811 ) ) ( not ( = ?auto_111809 ?auto_111811 ) ) ( not ( = ?auto_111810 ?auto_111811 ) ) ( ON ?auto_111805 ?auto_111804 ) ( ON-TABLE ?auto_111811 ) ( ON ?auto_111806 ?auto_111805 ) ( ON ?auto_111807 ?auto_111806 ) ( ON ?auto_111808 ?auto_111807 ) ( CLEAR ?auto_111808 ) ( HOLDING ?auto_111809 ) ( CLEAR ?auto_111810 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111810 ?auto_111809 )
      ( MAKE-7PILE ?auto_111804 ?auto_111805 ?auto_111806 ?auto_111807 ?auto_111808 ?auto_111809 ?auto_111810 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111812 - BLOCK
      ?auto_111813 - BLOCK
      ?auto_111814 - BLOCK
      ?auto_111815 - BLOCK
      ?auto_111816 - BLOCK
      ?auto_111817 - BLOCK
      ?auto_111818 - BLOCK
    )
    :vars
    (
      ?auto_111819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111812 ?auto_111813 ) ) ( not ( = ?auto_111812 ?auto_111814 ) ) ( not ( = ?auto_111812 ?auto_111815 ) ) ( not ( = ?auto_111812 ?auto_111816 ) ) ( not ( = ?auto_111812 ?auto_111817 ) ) ( not ( = ?auto_111812 ?auto_111818 ) ) ( not ( = ?auto_111813 ?auto_111814 ) ) ( not ( = ?auto_111813 ?auto_111815 ) ) ( not ( = ?auto_111813 ?auto_111816 ) ) ( not ( = ?auto_111813 ?auto_111817 ) ) ( not ( = ?auto_111813 ?auto_111818 ) ) ( not ( = ?auto_111814 ?auto_111815 ) ) ( not ( = ?auto_111814 ?auto_111816 ) ) ( not ( = ?auto_111814 ?auto_111817 ) ) ( not ( = ?auto_111814 ?auto_111818 ) ) ( not ( = ?auto_111815 ?auto_111816 ) ) ( not ( = ?auto_111815 ?auto_111817 ) ) ( not ( = ?auto_111815 ?auto_111818 ) ) ( not ( = ?auto_111816 ?auto_111817 ) ) ( not ( = ?auto_111816 ?auto_111818 ) ) ( not ( = ?auto_111817 ?auto_111818 ) ) ( ON-TABLE ?auto_111818 ) ( ON ?auto_111812 ?auto_111819 ) ( not ( = ?auto_111812 ?auto_111819 ) ) ( not ( = ?auto_111813 ?auto_111819 ) ) ( not ( = ?auto_111814 ?auto_111819 ) ) ( not ( = ?auto_111815 ?auto_111819 ) ) ( not ( = ?auto_111816 ?auto_111819 ) ) ( not ( = ?auto_111817 ?auto_111819 ) ) ( not ( = ?auto_111818 ?auto_111819 ) ) ( ON ?auto_111813 ?auto_111812 ) ( ON-TABLE ?auto_111819 ) ( ON ?auto_111814 ?auto_111813 ) ( ON ?auto_111815 ?auto_111814 ) ( ON ?auto_111816 ?auto_111815 ) ( CLEAR ?auto_111818 ) ( ON ?auto_111817 ?auto_111816 ) ( CLEAR ?auto_111817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111819 ?auto_111812 ?auto_111813 ?auto_111814 ?auto_111815 ?auto_111816 )
      ( MAKE-7PILE ?auto_111812 ?auto_111813 ?auto_111814 ?auto_111815 ?auto_111816 ?auto_111817 ?auto_111818 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111820 - BLOCK
      ?auto_111821 - BLOCK
      ?auto_111822 - BLOCK
      ?auto_111823 - BLOCK
      ?auto_111824 - BLOCK
      ?auto_111825 - BLOCK
      ?auto_111826 - BLOCK
    )
    :vars
    (
      ?auto_111827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111820 ?auto_111821 ) ) ( not ( = ?auto_111820 ?auto_111822 ) ) ( not ( = ?auto_111820 ?auto_111823 ) ) ( not ( = ?auto_111820 ?auto_111824 ) ) ( not ( = ?auto_111820 ?auto_111825 ) ) ( not ( = ?auto_111820 ?auto_111826 ) ) ( not ( = ?auto_111821 ?auto_111822 ) ) ( not ( = ?auto_111821 ?auto_111823 ) ) ( not ( = ?auto_111821 ?auto_111824 ) ) ( not ( = ?auto_111821 ?auto_111825 ) ) ( not ( = ?auto_111821 ?auto_111826 ) ) ( not ( = ?auto_111822 ?auto_111823 ) ) ( not ( = ?auto_111822 ?auto_111824 ) ) ( not ( = ?auto_111822 ?auto_111825 ) ) ( not ( = ?auto_111822 ?auto_111826 ) ) ( not ( = ?auto_111823 ?auto_111824 ) ) ( not ( = ?auto_111823 ?auto_111825 ) ) ( not ( = ?auto_111823 ?auto_111826 ) ) ( not ( = ?auto_111824 ?auto_111825 ) ) ( not ( = ?auto_111824 ?auto_111826 ) ) ( not ( = ?auto_111825 ?auto_111826 ) ) ( ON ?auto_111820 ?auto_111827 ) ( not ( = ?auto_111820 ?auto_111827 ) ) ( not ( = ?auto_111821 ?auto_111827 ) ) ( not ( = ?auto_111822 ?auto_111827 ) ) ( not ( = ?auto_111823 ?auto_111827 ) ) ( not ( = ?auto_111824 ?auto_111827 ) ) ( not ( = ?auto_111825 ?auto_111827 ) ) ( not ( = ?auto_111826 ?auto_111827 ) ) ( ON ?auto_111821 ?auto_111820 ) ( ON-TABLE ?auto_111827 ) ( ON ?auto_111822 ?auto_111821 ) ( ON ?auto_111823 ?auto_111822 ) ( ON ?auto_111824 ?auto_111823 ) ( ON ?auto_111825 ?auto_111824 ) ( CLEAR ?auto_111825 ) ( HOLDING ?auto_111826 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111826 )
      ( MAKE-7PILE ?auto_111820 ?auto_111821 ?auto_111822 ?auto_111823 ?auto_111824 ?auto_111825 ?auto_111826 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111828 - BLOCK
      ?auto_111829 - BLOCK
      ?auto_111830 - BLOCK
      ?auto_111831 - BLOCK
      ?auto_111832 - BLOCK
      ?auto_111833 - BLOCK
      ?auto_111834 - BLOCK
    )
    :vars
    (
      ?auto_111835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111828 ?auto_111829 ) ) ( not ( = ?auto_111828 ?auto_111830 ) ) ( not ( = ?auto_111828 ?auto_111831 ) ) ( not ( = ?auto_111828 ?auto_111832 ) ) ( not ( = ?auto_111828 ?auto_111833 ) ) ( not ( = ?auto_111828 ?auto_111834 ) ) ( not ( = ?auto_111829 ?auto_111830 ) ) ( not ( = ?auto_111829 ?auto_111831 ) ) ( not ( = ?auto_111829 ?auto_111832 ) ) ( not ( = ?auto_111829 ?auto_111833 ) ) ( not ( = ?auto_111829 ?auto_111834 ) ) ( not ( = ?auto_111830 ?auto_111831 ) ) ( not ( = ?auto_111830 ?auto_111832 ) ) ( not ( = ?auto_111830 ?auto_111833 ) ) ( not ( = ?auto_111830 ?auto_111834 ) ) ( not ( = ?auto_111831 ?auto_111832 ) ) ( not ( = ?auto_111831 ?auto_111833 ) ) ( not ( = ?auto_111831 ?auto_111834 ) ) ( not ( = ?auto_111832 ?auto_111833 ) ) ( not ( = ?auto_111832 ?auto_111834 ) ) ( not ( = ?auto_111833 ?auto_111834 ) ) ( ON ?auto_111828 ?auto_111835 ) ( not ( = ?auto_111828 ?auto_111835 ) ) ( not ( = ?auto_111829 ?auto_111835 ) ) ( not ( = ?auto_111830 ?auto_111835 ) ) ( not ( = ?auto_111831 ?auto_111835 ) ) ( not ( = ?auto_111832 ?auto_111835 ) ) ( not ( = ?auto_111833 ?auto_111835 ) ) ( not ( = ?auto_111834 ?auto_111835 ) ) ( ON ?auto_111829 ?auto_111828 ) ( ON-TABLE ?auto_111835 ) ( ON ?auto_111830 ?auto_111829 ) ( ON ?auto_111831 ?auto_111830 ) ( ON ?auto_111832 ?auto_111831 ) ( ON ?auto_111833 ?auto_111832 ) ( ON ?auto_111834 ?auto_111833 ) ( CLEAR ?auto_111834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111835 ?auto_111828 ?auto_111829 ?auto_111830 ?auto_111831 ?auto_111832 ?auto_111833 )
      ( MAKE-7PILE ?auto_111828 ?auto_111829 ?auto_111830 ?auto_111831 ?auto_111832 ?auto_111833 ?auto_111834 ) )
  )

)

