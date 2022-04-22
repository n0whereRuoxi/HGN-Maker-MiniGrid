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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179303 - BLOCK
      ?auto_179304 - BLOCK
      ?auto_179305 - BLOCK
      ?auto_179306 - BLOCK
      ?auto_179307 - BLOCK
      ?auto_179308 - BLOCK
      ?auto_179309 - BLOCK
      ?auto_179310 - BLOCK
    )
    :vars
    (
      ?auto_179311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179311 ?auto_179310 ) ( CLEAR ?auto_179311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179303 ) ( ON ?auto_179304 ?auto_179303 ) ( ON ?auto_179305 ?auto_179304 ) ( ON ?auto_179306 ?auto_179305 ) ( ON ?auto_179307 ?auto_179306 ) ( ON ?auto_179308 ?auto_179307 ) ( ON ?auto_179309 ?auto_179308 ) ( ON ?auto_179310 ?auto_179309 ) ( not ( = ?auto_179303 ?auto_179304 ) ) ( not ( = ?auto_179303 ?auto_179305 ) ) ( not ( = ?auto_179303 ?auto_179306 ) ) ( not ( = ?auto_179303 ?auto_179307 ) ) ( not ( = ?auto_179303 ?auto_179308 ) ) ( not ( = ?auto_179303 ?auto_179309 ) ) ( not ( = ?auto_179303 ?auto_179310 ) ) ( not ( = ?auto_179303 ?auto_179311 ) ) ( not ( = ?auto_179304 ?auto_179305 ) ) ( not ( = ?auto_179304 ?auto_179306 ) ) ( not ( = ?auto_179304 ?auto_179307 ) ) ( not ( = ?auto_179304 ?auto_179308 ) ) ( not ( = ?auto_179304 ?auto_179309 ) ) ( not ( = ?auto_179304 ?auto_179310 ) ) ( not ( = ?auto_179304 ?auto_179311 ) ) ( not ( = ?auto_179305 ?auto_179306 ) ) ( not ( = ?auto_179305 ?auto_179307 ) ) ( not ( = ?auto_179305 ?auto_179308 ) ) ( not ( = ?auto_179305 ?auto_179309 ) ) ( not ( = ?auto_179305 ?auto_179310 ) ) ( not ( = ?auto_179305 ?auto_179311 ) ) ( not ( = ?auto_179306 ?auto_179307 ) ) ( not ( = ?auto_179306 ?auto_179308 ) ) ( not ( = ?auto_179306 ?auto_179309 ) ) ( not ( = ?auto_179306 ?auto_179310 ) ) ( not ( = ?auto_179306 ?auto_179311 ) ) ( not ( = ?auto_179307 ?auto_179308 ) ) ( not ( = ?auto_179307 ?auto_179309 ) ) ( not ( = ?auto_179307 ?auto_179310 ) ) ( not ( = ?auto_179307 ?auto_179311 ) ) ( not ( = ?auto_179308 ?auto_179309 ) ) ( not ( = ?auto_179308 ?auto_179310 ) ) ( not ( = ?auto_179308 ?auto_179311 ) ) ( not ( = ?auto_179309 ?auto_179310 ) ) ( not ( = ?auto_179309 ?auto_179311 ) ) ( not ( = ?auto_179310 ?auto_179311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179311 ?auto_179310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_179313 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_179313 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_179313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_179314 - BLOCK
    )
    :vars
    (
      ?auto_179315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179314 ?auto_179315 ) ( CLEAR ?auto_179314 ) ( HAND-EMPTY ) ( not ( = ?auto_179314 ?auto_179315 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179314 ?auto_179315 )
      ( MAKE-1PILE ?auto_179314 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_179323 - BLOCK
      ?auto_179324 - BLOCK
      ?auto_179325 - BLOCK
      ?auto_179326 - BLOCK
      ?auto_179327 - BLOCK
      ?auto_179328 - BLOCK
      ?auto_179329 - BLOCK
    )
    :vars
    (
      ?auto_179330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179330 ?auto_179329 ) ( CLEAR ?auto_179330 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179323 ) ( ON ?auto_179324 ?auto_179323 ) ( ON ?auto_179325 ?auto_179324 ) ( ON ?auto_179326 ?auto_179325 ) ( ON ?auto_179327 ?auto_179326 ) ( ON ?auto_179328 ?auto_179327 ) ( ON ?auto_179329 ?auto_179328 ) ( not ( = ?auto_179323 ?auto_179324 ) ) ( not ( = ?auto_179323 ?auto_179325 ) ) ( not ( = ?auto_179323 ?auto_179326 ) ) ( not ( = ?auto_179323 ?auto_179327 ) ) ( not ( = ?auto_179323 ?auto_179328 ) ) ( not ( = ?auto_179323 ?auto_179329 ) ) ( not ( = ?auto_179323 ?auto_179330 ) ) ( not ( = ?auto_179324 ?auto_179325 ) ) ( not ( = ?auto_179324 ?auto_179326 ) ) ( not ( = ?auto_179324 ?auto_179327 ) ) ( not ( = ?auto_179324 ?auto_179328 ) ) ( not ( = ?auto_179324 ?auto_179329 ) ) ( not ( = ?auto_179324 ?auto_179330 ) ) ( not ( = ?auto_179325 ?auto_179326 ) ) ( not ( = ?auto_179325 ?auto_179327 ) ) ( not ( = ?auto_179325 ?auto_179328 ) ) ( not ( = ?auto_179325 ?auto_179329 ) ) ( not ( = ?auto_179325 ?auto_179330 ) ) ( not ( = ?auto_179326 ?auto_179327 ) ) ( not ( = ?auto_179326 ?auto_179328 ) ) ( not ( = ?auto_179326 ?auto_179329 ) ) ( not ( = ?auto_179326 ?auto_179330 ) ) ( not ( = ?auto_179327 ?auto_179328 ) ) ( not ( = ?auto_179327 ?auto_179329 ) ) ( not ( = ?auto_179327 ?auto_179330 ) ) ( not ( = ?auto_179328 ?auto_179329 ) ) ( not ( = ?auto_179328 ?auto_179330 ) ) ( not ( = ?auto_179329 ?auto_179330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179330 ?auto_179329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_179331 - BLOCK
      ?auto_179332 - BLOCK
      ?auto_179333 - BLOCK
      ?auto_179334 - BLOCK
      ?auto_179335 - BLOCK
      ?auto_179336 - BLOCK
      ?auto_179337 - BLOCK
    )
    :vars
    (
      ?auto_179338 - BLOCK
      ?auto_179339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179338 ?auto_179337 ) ( CLEAR ?auto_179338 ) ( ON-TABLE ?auto_179331 ) ( ON ?auto_179332 ?auto_179331 ) ( ON ?auto_179333 ?auto_179332 ) ( ON ?auto_179334 ?auto_179333 ) ( ON ?auto_179335 ?auto_179334 ) ( ON ?auto_179336 ?auto_179335 ) ( ON ?auto_179337 ?auto_179336 ) ( not ( = ?auto_179331 ?auto_179332 ) ) ( not ( = ?auto_179331 ?auto_179333 ) ) ( not ( = ?auto_179331 ?auto_179334 ) ) ( not ( = ?auto_179331 ?auto_179335 ) ) ( not ( = ?auto_179331 ?auto_179336 ) ) ( not ( = ?auto_179331 ?auto_179337 ) ) ( not ( = ?auto_179331 ?auto_179338 ) ) ( not ( = ?auto_179332 ?auto_179333 ) ) ( not ( = ?auto_179332 ?auto_179334 ) ) ( not ( = ?auto_179332 ?auto_179335 ) ) ( not ( = ?auto_179332 ?auto_179336 ) ) ( not ( = ?auto_179332 ?auto_179337 ) ) ( not ( = ?auto_179332 ?auto_179338 ) ) ( not ( = ?auto_179333 ?auto_179334 ) ) ( not ( = ?auto_179333 ?auto_179335 ) ) ( not ( = ?auto_179333 ?auto_179336 ) ) ( not ( = ?auto_179333 ?auto_179337 ) ) ( not ( = ?auto_179333 ?auto_179338 ) ) ( not ( = ?auto_179334 ?auto_179335 ) ) ( not ( = ?auto_179334 ?auto_179336 ) ) ( not ( = ?auto_179334 ?auto_179337 ) ) ( not ( = ?auto_179334 ?auto_179338 ) ) ( not ( = ?auto_179335 ?auto_179336 ) ) ( not ( = ?auto_179335 ?auto_179337 ) ) ( not ( = ?auto_179335 ?auto_179338 ) ) ( not ( = ?auto_179336 ?auto_179337 ) ) ( not ( = ?auto_179336 ?auto_179338 ) ) ( not ( = ?auto_179337 ?auto_179338 ) ) ( HOLDING ?auto_179339 ) ( not ( = ?auto_179331 ?auto_179339 ) ) ( not ( = ?auto_179332 ?auto_179339 ) ) ( not ( = ?auto_179333 ?auto_179339 ) ) ( not ( = ?auto_179334 ?auto_179339 ) ) ( not ( = ?auto_179335 ?auto_179339 ) ) ( not ( = ?auto_179336 ?auto_179339 ) ) ( not ( = ?auto_179337 ?auto_179339 ) ) ( not ( = ?auto_179338 ?auto_179339 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_179339 )
      ( MAKE-7PILE ?auto_179331 ?auto_179332 ?auto_179333 ?auto_179334 ?auto_179335 ?auto_179336 ?auto_179337 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_179340 - BLOCK
      ?auto_179341 - BLOCK
      ?auto_179342 - BLOCK
      ?auto_179343 - BLOCK
      ?auto_179344 - BLOCK
      ?auto_179345 - BLOCK
      ?auto_179346 - BLOCK
    )
    :vars
    (
      ?auto_179347 - BLOCK
      ?auto_179348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179347 ?auto_179346 ) ( ON-TABLE ?auto_179340 ) ( ON ?auto_179341 ?auto_179340 ) ( ON ?auto_179342 ?auto_179341 ) ( ON ?auto_179343 ?auto_179342 ) ( ON ?auto_179344 ?auto_179343 ) ( ON ?auto_179345 ?auto_179344 ) ( ON ?auto_179346 ?auto_179345 ) ( not ( = ?auto_179340 ?auto_179341 ) ) ( not ( = ?auto_179340 ?auto_179342 ) ) ( not ( = ?auto_179340 ?auto_179343 ) ) ( not ( = ?auto_179340 ?auto_179344 ) ) ( not ( = ?auto_179340 ?auto_179345 ) ) ( not ( = ?auto_179340 ?auto_179346 ) ) ( not ( = ?auto_179340 ?auto_179347 ) ) ( not ( = ?auto_179341 ?auto_179342 ) ) ( not ( = ?auto_179341 ?auto_179343 ) ) ( not ( = ?auto_179341 ?auto_179344 ) ) ( not ( = ?auto_179341 ?auto_179345 ) ) ( not ( = ?auto_179341 ?auto_179346 ) ) ( not ( = ?auto_179341 ?auto_179347 ) ) ( not ( = ?auto_179342 ?auto_179343 ) ) ( not ( = ?auto_179342 ?auto_179344 ) ) ( not ( = ?auto_179342 ?auto_179345 ) ) ( not ( = ?auto_179342 ?auto_179346 ) ) ( not ( = ?auto_179342 ?auto_179347 ) ) ( not ( = ?auto_179343 ?auto_179344 ) ) ( not ( = ?auto_179343 ?auto_179345 ) ) ( not ( = ?auto_179343 ?auto_179346 ) ) ( not ( = ?auto_179343 ?auto_179347 ) ) ( not ( = ?auto_179344 ?auto_179345 ) ) ( not ( = ?auto_179344 ?auto_179346 ) ) ( not ( = ?auto_179344 ?auto_179347 ) ) ( not ( = ?auto_179345 ?auto_179346 ) ) ( not ( = ?auto_179345 ?auto_179347 ) ) ( not ( = ?auto_179346 ?auto_179347 ) ) ( not ( = ?auto_179340 ?auto_179348 ) ) ( not ( = ?auto_179341 ?auto_179348 ) ) ( not ( = ?auto_179342 ?auto_179348 ) ) ( not ( = ?auto_179343 ?auto_179348 ) ) ( not ( = ?auto_179344 ?auto_179348 ) ) ( not ( = ?auto_179345 ?auto_179348 ) ) ( not ( = ?auto_179346 ?auto_179348 ) ) ( not ( = ?auto_179347 ?auto_179348 ) ) ( ON ?auto_179348 ?auto_179347 ) ( CLEAR ?auto_179348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179340 ?auto_179341 ?auto_179342 ?auto_179343 ?auto_179344 ?auto_179345 ?auto_179346 ?auto_179347 )
      ( MAKE-7PILE ?auto_179340 ?auto_179341 ?auto_179342 ?auto_179343 ?auto_179344 ?auto_179345 ?auto_179346 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179351 - BLOCK
      ?auto_179352 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_179352 ) ( CLEAR ?auto_179351 ) ( ON-TABLE ?auto_179351 ) ( not ( = ?auto_179351 ?auto_179352 ) ) )
    :subtasks
    ( ( !STACK ?auto_179352 ?auto_179351 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179353 - BLOCK
      ?auto_179354 - BLOCK
    )
    :vars
    (
      ?auto_179355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_179353 ) ( ON-TABLE ?auto_179353 ) ( not ( = ?auto_179353 ?auto_179354 ) ) ( ON ?auto_179354 ?auto_179355 ) ( CLEAR ?auto_179354 ) ( HAND-EMPTY ) ( not ( = ?auto_179353 ?auto_179355 ) ) ( not ( = ?auto_179354 ?auto_179355 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179354 ?auto_179355 )
      ( MAKE-2PILE ?auto_179353 ?auto_179354 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179356 - BLOCK
      ?auto_179357 - BLOCK
    )
    :vars
    (
      ?auto_179358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179356 ?auto_179357 ) ) ( ON ?auto_179357 ?auto_179358 ) ( CLEAR ?auto_179357 ) ( not ( = ?auto_179356 ?auto_179358 ) ) ( not ( = ?auto_179357 ?auto_179358 ) ) ( HOLDING ?auto_179356 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179356 )
      ( MAKE-2PILE ?auto_179356 ?auto_179357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179359 - BLOCK
      ?auto_179360 - BLOCK
    )
    :vars
    (
      ?auto_179361 - BLOCK
      ?auto_179366 - BLOCK
      ?auto_179362 - BLOCK
      ?auto_179365 - BLOCK
      ?auto_179364 - BLOCK
      ?auto_179367 - BLOCK
      ?auto_179363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179359 ?auto_179360 ) ) ( ON ?auto_179360 ?auto_179361 ) ( not ( = ?auto_179359 ?auto_179361 ) ) ( not ( = ?auto_179360 ?auto_179361 ) ) ( ON ?auto_179359 ?auto_179360 ) ( CLEAR ?auto_179359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179366 ) ( ON ?auto_179362 ?auto_179366 ) ( ON ?auto_179365 ?auto_179362 ) ( ON ?auto_179364 ?auto_179365 ) ( ON ?auto_179367 ?auto_179364 ) ( ON ?auto_179363 ?auto_179367 ) ( ON ?auto_179361 ?auto_179363 ) ( not ( = ?auto_179366 ?auto_179362 ) ) ( not ( = ?auto_179366 ?auto_179365 ) ) ( not ( = ?auto_179366 ?auto_179364 ) ) ( not ( = ?auto_179366 ?auto_179367 ) ) ( not ( = ?auto_179366 ?auto_179363 ) ) ( not ( = ?auto_179366 ?auto_179361 ) ) ( not ( = ?auto_179366 ?auto_179360 ) ) ( not ( = ?auto_179366 ?auto_179359 ) ) ( not ( = ?auto_179362 ?auto_179365 ) ) ( not ( = ?auto_179362 ?auto_179364 ) ) ( not ( = ?auto_179362 ?auto_179367 ) ) ( not ( = ?auto_179362 ?auto_179363 ) ) ( not ( = ?auto_179362 ?auto_179361 ) ) ( not ( = ?auto_179362 ?auto_179360 ) ) ( not ( = ?auto_179362 ?auto_179359 ) ) ( not ( = ?auto_179365 ?auto_179364 ) ) ( not ( = ?auto_179365 ?auto_179367 ) ) ( not ( = ?auto_179365 ?auto_179363 ) ) ( not ( = ?auto_179365 ?auto_179361 ) ) ( not ( = ?auto_179365 ?auto_179360 ) ) ( not ( = ?auto_179365 ?auto_179359 ) ) ( not ( = ?auto_179364 ?auto_179367 ) ) ( not ( = ?auto_179364 ?auto_179363 ) ) ( not ( = ?auto_179364 ?auto_179361 ) ) ( not ( = ?auto_179364 ?auto_179360 ) ) ( not ( = ?auto_179364 ?auto_179359 ) ) ( not ( = ?auto_179367 ?auto_179363 ) ) ( not ( = ?auto_179367 ?auto_179361 ) ) ( not ( = ?auto_179367 ?auto_179360 ) ) ( not ( = ?auto_179367 ?auto_179359 ) ) ( not ( = ?auto_179363 ?auto_179361 ) ) ( not ( = ?auto_179363 ?auto_179360 ) ) ( not ( = ?auto_179363 ?auto_179359 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179366 ?auto_179362 ?auto_179365 ?auto_179364 ?auto_179367 ?auto_179363 ?auto_179361 ?auto_179360 )
      ( MAKE-2PILE ?auto_179359 ?auto_179360 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179374 - BLOCK
      ?auto_179375 - BLOCK
      ?auto_179376 - BLOCK
      ?auto_179377 - BLOCK
      ?auto_179378 - BLOCK
      ?auto_179379 - BLOCK
    )
    :vars
    (
      ?auto_179380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179380 ?auto_179379 ) ( CLEAR ?auto_179380 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179374 ) ( ON ?auto_179375 ?auto_179374 ) ( ON ?auto_179376 ?auto_179375 ) ( ON ?auto_179377 ?auto_179376 ) ( ON ?auto_179378 ?auto_179377 ) ( ON ?auto_179379 ?auto_179378 ) ( not ( = ?auto_179374 ?auto_179375 ) ) ( not ( = ?auto_179374 ?auto_179376 ) ) ( not ( = ?auto_179374 ?auto_179377 ) ) ( not ( = ?auto_179374 ?auto_179378 ) ) ( not ( = ?auto_179374 ?auto_179379 ) ) ( not ( = ?auto_179374 ?auto_179380 ) ) ( not ( = ?auto_179375 ?auto_179376 ) ) ( not ( = ?auto_179375 ?auto_179377 ) ) ( not ( = ?auto_179375 ?auto_179378 ) ) ( not ( = ?auto_179375 ?auto_179379 ) ) ( not ( = ?auto_179375 ?auto_179380 ) ) ( not ( = ?auto_179376 ?auto_179377 ) ) ( not ( = ?auto_179376 ?auto_179378 ) ) ( not ( = ?auto_179376 ?auto_179379 ) ) ( not ( = ?auto_179376 ?auto_179380 ) ) ( not ( = ?auto_179377 ?auto_179378 ) ) ( not ( = ?auto_179377 ?auto_179379 ) ) ( not ( = ?auto_179377 ?auto_179380 ) ) ( not ( = ?auto_179378 ?auto_179379 ) ) ( not ( = ?auto_179378 ?auto_179380 ) ) ( not ( = ?auto_179379 ?auto_179380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179380 ?auto_179379 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179381 - BLOCK
      ?auto_179382 - BLOCK
      ?auto_179383 - BLOCK
      ?auto_179384 - BLOCK
      ?auto_179385 - BLOCK
      ?auto_179386 - BLOCK
    )
    :vars
    (
      ?auto_179387 - BLOCK
      ?auto_179388 - BLOCK
      ?auto_179389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179387 ?auto_179386 ) ( CLEAR ?auto_179387 ) ( ON-TABLE ?auto_179381 ) ( ON ?auto_179382 ?auto_179381 ) ( ON ?auto_179383 ?auto_179382 ) ( ON ?auto_179384 ?auto_179383 ) ( ON ?auto_179385 ?auto_179384 ) ( ON ?auto_179386 ?auto_179385 ) ( not ( = ?auto_179381 ?auto_179382 ) ) ( not ( = ?auto_179381 ?auto_179383 ) ) ( not ( = ?auto_179381 ?auto_179384 ) ) ( not ( = ?auto_179381 ?auto_179385 ) ) ( not ( = ?auto_179381 ?auto_179386 ) ) ( not ( = ?auto_179381 ?auto_179387 ) ) ( not ( = ?auto_179382 ?auto_179383 ) ) ( not ( = ?auto_179382 ?auto_179384 ) ) ( not ( = ?auto_179382 ?auto_179385 ) ) ( not ( = ?auto_179382 ?auto_179386 ) ) ( not ( = ?auto_179382 ?auto_179387 ) ) ( not ( = ?auto_179383 ?auto_179384 ) ) ( not ( = ?auto_179383 ?auto_179385 ) ) ( not ( = ?auto_179383 ?auto_179386 ) ) ( not ( = ?auto_179383 ?auto_179387 ) ) ( not ( = ?auto_179384 ?auto_179385 ) ) ( not ( = ?auto_179384 ?auto_179386 ) ) ( not ( = ?auto_179384 ?auto_179387 ) ) ( not ( = ?auto_179385 ?auto_179386 ) ) ( not ( = ?auto_179385 ?auto_179387 ) ) ( not ( = ?auto_179386 ?auto_179387 ) ) ( HOLDING ?auto_179388 ) ( CLEAR ?auto_179389 ) ( not ( = ?auto_179381 ?auto_179388 ) ) ( not ( = ?auto_179381 ?auto_179389 ) ) ( not ( = ?auto_179382 ?auto_179388 ) ) ( not ( = ?auto_179382 ?auto_179389 ) ) ( not ( = ?auto_179383 ?auto_179388 ) ) ( not ( = ?auto_179383 ?auto_179389 ) ) ( not ( = ?auto_179384 ?auto_179388 ) ) ( not ( = ?auto_179384 ?auto_179389 ) ) ( not ( = ?auto_179385 ?auto_179388 ) ) ( not ( = ?auto_179385 ?auto_179389 ) ) ( not ( = ?auto_179386 ?auto_179388 ) ) ( not ( = ?auto_179386 ?auto_179389 ) ) ( not ( = ?auto_179387 ?auto_179388 ) ) ( not ( = ?auto_179387 ?auto_179389 ) ) ( not ( = ?auto_179388 ?auto_179389 ) ) )
    :subtasks
    ( ( !STACK ?auto_179388 ?auto_179389 )
      ( MAKE-6PILE ?auto_179381 ?auto_179382 ?auto_179383 ?auto_179384 ?auto_179385 ?auto_179386 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179390 - BLOCK
      ?auto_179391 - BLOCK
      ?auto_179392 - BLOCK
      ?auto_179393 - BLOCK
      ?auto_179394 - BLOCK
      ?auto_179395 - BLOCK
    )
    :vars
    (
      ?auto_179397 - BLOCK
      ?auto_179398 - BLOCK
      ?auto_179396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179397 ?auto_179395 ) ( ON-TABLE ?auto_179390 ) ( ON ?auto_179391 ?auto_179390 ) ( ON ?auto_179392 ?auto_179391 ) ( ON ?auto_179393 ?auto_179392 ) ( ON ?auto_179394 ?auto_179393 ) ( ON ?auto_179395 ?auto_179394 ) ( not ( = ?auto_179390 ?auto_179391 ) ) ( not ( = ?auto_179390 ?auto_179392 ) ) ( not ( = ?auto_179390 ?auto_179393 ) ) ( not ( = ?auto_179390 ?auto_179394 ) ) ( not ( = ?auto_179390 ?auto_179395 ) ) ( not ( = ?auto_179390 ?auto_179397 ) ) ( not ( = ?auto_179391 ?auto_179392 ) ) ( not ( = ?auto_179391 ?auto_179393 ) ) ( not ( = ?auto_179391 ?auto_179394 ) ) ( not ( = ?auto_179391 ?auto_179395 ) ) ( not ( = ?auto_179391 ?auto_179397 ) ) ( not ( = ?auto_179392 ?auto_179393 ) ) ( not ( = ?auto_179392 ?auto_179394 ) ) ( not ( = ?auto_179392 ?auto_179395 ) ) ( not ( = ?auto_179392 ?auto_179397 ) ) ( not ( = ?auto_179393 ?auto_179394 ) ) ( not ( = ?auto_179393 ?auto_179395 ) ) ( not ( = ?auto_179393 ?auto_179397 ) ) ( not ( = ?auto_179394 ?auto_179395 ) ) ( not ( = ?auto_179394 ?auto_179397 ) ) ( not ( = ?auto_179395 ?auto_179397 ) ) ( CLEAR ?auto_179398 ) ( not ( = ?auto_179390 ?auto_179396 ) ) ( not ( = ?auto_179390 ?auto_179398 ) ) ( not ( = ?auto_179391 ?auto_179396 ) ) ( not ( = ?auto_179391 ?auto_179398 ) ) ( not ( = ?auto_179392 ?auto_179396 ) ) ( not ( = ?auto_179392 ?auto_179398 ) ) ( not ( = ?auto_179393 ?auto_179396 ) ) ( not ( = ?auto_179393 ?auto_179398 ) ) ( not ( = ?auto_179394 ?auto_179396 ) ) ( not ( = ?auto_179394 ?auto_179398 ) ) ( not ( = ?auto_179395 ?auto_179396 ) ) ( not ( = ?auto_179395 ?auto_179398 ) ) ( not ( = ?auto_179397 ?auto_179396 ) ) ( not ( = ?auto_179397 ?auto_179398 ) ) ( not ( = ?auto_179396 ?auto_179398 ) ) ( ON ?auto_179396 ?auto_179397 ) ( CLEAR ?auto_179396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179390 ?auto_179391 ?auto_179392 ?auto_179393 ?auto_179394 ?auto_179395 ?auto_179397 )
      ( MAKE-6PILE ?auto_179390 ?auto_179391 ?auto_179392 ?auto_179393 ?auto_179394 ?auto_179395 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179399 - BLOCK
      ?auto_179400 - BLOCK
      ?auto_179401 - BLOCK
      ?auto_179402 - BLOCK
      ?auto_179403 - BLOCK
      ?auto_179404 - BLOCK
    )
    :vars
    (
      ?auto_179406 - BLOCK
      ?auto_179407 - BLOCK
      ?auto_179405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179406 ?auto_179404 ) ( ON-TABLE ?auto_179399 ) ( ON ?auto_179400 ?auto_179399 ) ( ON ?auto_179401 ?auto_179400 ) ( ON ?auto_179402 ?auto_179401 ) ( ON ?auto_179403 ?auto_179402 ) ( ON ?auto_179404 ?auto_179403 ) ( not ( = ?auto_179399 ?auto_179400 ) ) ( not ( = ?auto_179399 ?auto_179401 ) ) ( not ( = ?auto_179399 ?auto_179402 ) ) ( not ( = ?auto_179399 ?auto_179403 ) ) ( not ( = ?auto_179399 ?auto_179404 ) ) ( not ( = ?auto_179399 ?auto_179406 ) ) ( not ( = ?auto_179400 ?auto_179401 ) ) ( not ( = ?auto_179400 ?auto_179402 ) ) ( not ( = ?auto_179400 ?auto_179403 ) ) ( not ( = ?auto_179400 ?auto_179404 ) ) ( not ( = ?auto_179400 ?auto_179406 ) ) ( not ( = ?auto_179401 ?auto_179402 ) ) ( not ( = ?auto_179401 ?auto_179403 ) ) ( not ( = ?auto_179401 ?auto_179404 ) ) ( not ( = ?auto_179401 ?auto_179406 ) ) ( not ( = ?auto_179402 ?auto_179403 ) ) ( not ( = ?auto_179402 ?auto_179404 ) ) ( not ( = ?auto_179402 ?auto_179406 ) ) ( not ( = ?auto_179403 ?auto_179404 ) ) ( not ( = ?auto_179403 ?auto_179406 ) ) ( not ( = ?auto_179404 ?auto_179406 ) ) ( not ( = ?auto_179399 ?auto_179407 ) ) ( not ( = ?auto_179399 ?auto_179405 ) ) ( not ( = ?auto_179400 ?auto_179407 ) ) ( not ( = ?auto_179400 ?auto_179405 ) ) ( not ( = ?auto_179401 ?auto_179407 ) ) ( not ( = ?auto_179401 ?auto_179405 ) ) ( not ( = ?auto_179402 ?auto_179407 ) ) ( not ( = ?auto_179402 ?auto_179405 ) ) ( not ( = ?auto_179403 ?auto_179407 ) ) ( not ( = ?auto_179403 ?auto_179405 ) ) ( not ( = ?auto_179404 ?auto_179407 ) ) ( not ( = ?auto_179404 ?auto_179405 ) ) ( not ( = ?auto_179406 ?auto_179407 ) ) ( not ( = ?auto_179406 ?auto_179405 ) ) ( not ( = ?auto_179407 ?auto_179405 ) ) ( ON ?auto_179407 ?auto_179406 ) ( CLEAR ?auto_179407 ) ( HOLDING ?auto_179405 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179405 )
      ( MAKE-6PILE ?auto_179399 ?auto_179400 ?auto_179401 ?auto_179402 ?auto_179403 ?auto_179404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179408 - BLOCK
      ?auto_179409 - BLOCK
      ?auto_179410 - BLOCK
      ?auto_179411 - BLOCK
      ?auto_179412 - BLOCK
      ?auto_179413 - BLOCK
    )
    :vars
    (
      ?auto_179415 - BLOCK
      ?auto_179414 - BLOCK
      ?auto_179416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179415 ?auto_179413 ) ( ON-TABLE ?auto_179408 ) ( ON ?auto_179409 ?auto_179408 ) ( ON ?auto_179410 ?auto_179409 ) ( ON ?auto_179411 ?auto_179410 ) ( ON ?auto_179412 ?auto_179411 ) ( ON ?auto_179413 ?auto_179412 ) ( not ( = ?auto_179408 ?auto_179409 ) ) ( not ( = ?auto_179408 ?auto_179410 ) ) ( not ( = ?auto_179408 ?auto_179411 ) ) ( not ( = ?auto_179408 ?auto_179412 ) ) ( not ( = ?auto_179408 ?auto_179413 ) ) ( not ( = ?auto_179408 ?auto_179415 ) ) ( not ( = ?auto_179409 ?auto_179410 ) ) ( not ( = ?auto_179409 ?auto_179411 ) ) ( not ( = ?auto_179409 ?auto_179412 ) ) ( not ( = ?auto_179409 ?auto_179413 ) ) ( not ( = ?auto_179409 ?auto_179415 ) ) ( not ( = ?auto_179410 ?auto_179411 ) ) ( not ( = ?auto_179410 ?auto_179412 ) ) ( not ( = ?auto_179410 ?auto_179413 ) ) ( not ( = ?auto_179410 ?auto_179415 ) ) ( not ( = ?auto_179411 ?auto_179412 ) ) ( not ( = ?auto_179411 ?auto_179413 ) ) ( not ( = ?auto_179411 ?auto_179415 ) ) ( not ( = ?auto_179412 ?auto_179413 ) ) ( not ( = ?auto_179412 ?auto_179415 ) ) ( not ( = ?auto_179413 ?auto_179415 ) ) ( not ( = ?auto_179408 ?auto_179414 ) ) ( not ( = ?auto_179408 ?auto_179416 ) ) ( not ( = ?auto_179409 ?auto_179414 ) ) ( not ( = ?auto_179409 ?auto_179416 ) ) ( not ( = ?auto_179410 ?auto_179414 ) ) ( not ( = ?auto_179410 ?auto_179416 ) ) ( not ( = ?auto_179411 ?auto_179414 ) ) ( not ( = ?auto_179411 ?auto_179416 ) ) ( not ( = ?auto_179412 ?auto_179414 ) ) ( not ( = ?auto_179412 ?auto_179416 ) ) ( not ( = ?auto_179413 ?auto_179414 ) ) ( not ( = ?auto_179413 ?auto_179416 ) ) ( not ( = ?auto_179415 ?auto_179414 ) ) ( not ( = ?auto_179415 ?auto_179416 ) ) ( not ( = ?auto_179414 ?auto_179416 ) ) ( ON ?auto_179414 ?auto_179415 ) ( ON ?auto_179416 ?auto_179414 ) ( CLEAR ?auto_179416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179408 ?auto_179409 ?auto_179410 ?auto_179411 ?auto_179412 ?auto_179413 ?auto_179415 ?auto_179414 )
      ( MAKE-6PILE ?auto_179408 ?auto_179409 ?auto_179410 ?auto_179411 ?auto_179412 ?auto_179413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179420 - BLOCK
      ?auto_179421 - BLOCK
      ?auto_179422 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_179422 ) ( CLEAR ?auto_179421 ) ( ON-TABLE ?auto_179420 ) ( ON ?auto_179421 ?auto_179420 ) ( not ( = ?auto_179420 ?auto_179421 ) ) ( not ( = ?auto_179420 ?auto_179422 ) ) ( not ( = ?auto_179421 ?auto_179422 ) ) )
    :subtasks
    ( ( !STACK ?auto_179422 ?auto_179421 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179423 - BLOCK
      ?auto_179424 - BLOCK
      ?auto_179425 - BLOCK
    )
    :vars
    (
      ?auto_179426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_179424 ) ( ON-TABLE ?auto_179423 ) ( ON ?auto_179424 ?auto_179423 ) ( not ( = ?auto_179423 ?auto_179424 ) ) ( not ( = ?auto_179423 ?auto_179425 ) ) ( not ( = ?auto_179424 ?auto_179425 ) ) ( ON ?auto_179425 ?auto_179426 ) ( CLEAR ?auto_179425 ) ( HAND-EMPTY ) ( not ( = ?auto_179423 ?auto_179426 ) ) ( not ( = ?auto_179424 ?auto_179426 ) ) ( not ( = ?auto_179425 ?auto_179426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179425 ?auto_179426 )
      ( MAKE-3PILE ?auto_179423 ?auto_179424 ?auto_179425 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179427 - BLOCK
      ?auto_179428 - BLOCK
      ?auto_179429 - BLOCK
    )
    :vars
    (
      ?auto_179430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179427 ) ( not ( = ?auto_179427 ?auto_179428 ) ) ( not ( = ?auto_179427 ?auto_179429 ) ) ( not ( = ?auto_179428 ?auto_179429 ) ) ( ON ?auto_179429 ?auto_179430 ) ( CLEAR ?auto_179429 ) ( not ( = ?auto_179427 ?auto_179430 ) ) ( not ( = ?auto_179428 ?auto_179430 ) ) ( not ( = ?auto_179429 ?auto_179430 ) ) ( HOLDING ?auto_179428 ) ( CLEAR ?auto_179427 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179427 ?auto_179428 )
      ( MAKE-3PILE ?auto_179427 ?auto_179428 ?auto_179429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179431 - BLOCK
      ?auto_179432 - BLOCK
      ?auto_179433 - BLOCK
    )
    :vars
    (
      ?auto_179434 - BLOCK
      ?auto_179439 - BLOCK
      ?auto_179436 - BLOCK
      ?auto_179437 - BLOCK
      ?auto_179435 - BLOCK
      ?auto_179438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179431 ) ( not ( = ?auto_179431 ?auto_179432 ) ) ( not ( = ?auto_179431 ?auto_179433 ) ) ( not ( = ?auto_179432 ?auto_179433 ) ) ( ON ?auto_179433 ?auto_179434 ) ( not ( = ?auto_179431 ?auto_179434 ) ) ( not ( = ?auto_179432 ?auto_179434 ) ) ( not ( = ?auto_179433 ?auto_179434 ) ) ( CLEAR ?auto_179431 ) ( ON ?auto_179432 ?auto_179433 ) ( CLEAR ?auto_179432 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179439 ) ( ON ?auto_179436 ?auto_179439 ) ( ON ?auto_179437 ?auto_179436 ) ( ON ?auto_179435 ?auto_179437 ) ( ON ?auto_179438 ?auto_179435 ) ( ON ?auto_179434 ?auto_179438 ) ( not ( = ?auto_179439 ?auto_179436 ) ) ( not ( = ?auto_179439 ?auto_179437 ) ) ( not ( = ?auto_179439 ?auto_179435 ) ) ( not ( = ?auto_179439 ?auto_179438 ) ) ( not ( = ?auto_179439 ?auto_179434 ) ) ( not ( = ?auto_179439 ?auto_179433 ) ) ( not ( = ?auto_179439 ?auto_179432 ) ) ( not ( = ?auto_179436 ?auto_179437 ) ) ( not ( = ?auto_179436 ?auto_179435 ) ) ( not ( = ?auto_179436 ?auto_179438 ) ) ( not ( = ?auto_179436 ?auto_179434 ) ) ( not ( = ?auto_179436 ?auto_179433 ) ) ( not ( = ?auto_179436 ?auto_179432 ) ) ( not ( = ?auto_179437 ?auto_179435 ) ) ( not ( = ?auto_179437 ?auto_179438 ) ) ( not ( = ?auto_179437 ?auto_179434 ) ) ( not ( = ?auto_179437 ?auto_179433 ) ) ( not ( = ?auto_179437 ?auto_179432 ) ) ( not ( = ?auto_179435 ?auto_179438 ) ) ( not ( = ?auto_179435 ?auto_179434 ) ) ( not ( = ?auto_179435 ?auto_179433 ) ) ( not ( = ?auto_179435 ?auto_179432 ) ) ( not ( = ?auto_179438 ?auto_179434 ) ) ( not ( = ?auto_179438 ?auto_179433 ) ) ( not ( = ?auto_179438 ?auto_179432 ) ) ( not ( = ?auto_179431 ?auto_179439 ) ) ( not ( = ?auto_179431 ?auto_179436 ) ) ( not ( = ?auto_179431 ?auto_179437 ) ) ( not ( = ?auto_179431 ?auto_179435 ) ) ( not ( = ?auto_179431 ?auto_179438 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179439 ?auto_179436 ?auto_179437 ?auto_179435 ?auto_179438 ?auto_179434 ?auto_179433 )
      ( MAKE-3PILE ?auto_179431 ?auto_179432 ?auto_179433 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179440 - BLOCK
      ?auto_179441 - BLOCK
      ?auto_179442 - BLOCK
    )
    :vars
    (
      ?auto_179444 - BLOCK
      ?auto_179443 - BLOCK
      ?auto_179445 - BLOCK
      ?auto_179448 - BLOCK
      ?auto_179446 - BLOCK
      ?auto_179447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179440 ?auto_179441 ) ) ( not ( = ?auto_179440 ?auto_179442 ) ) ( not ( = ?auto_179441 ?auto_179442 ) ) ( ON ?auto_179442 ?auto_179444 ) ( not ( = ?auto_179440 ?auto_179444 ) ) ( not ( = ?auto_179441 ?auto_179444 ) ) ( not ( = ?auto_179442 ?auto_179444 ) ) ( ON ?auto_179441 ?auto_179442 ) ( CLEAR ?auto_179441 ) ( ON-TABLE ?auto_179443 ) ( ON ?auto_179445 ?auto_179443 ) ( ON ?auto_179448 ?auto_179445 ) ( ON ?auto_179446 ?auto_179448 ) ( ON ?auto_179447 ?auto_179446 ) ( ON ?auto_179444 ?auto_179447 ) ( not ( = ?auto_179443 ?auto_179445 ) ) ( not ( = ?auto_179443 ?auto_179448 ) ) ( not ( = ?auto_179443 ?auto_179446 ) ) ( not ( = ?auto_179443 ?auto_179447 ) ) ( not ( = ?auto_179443 ?auto_179444 ) ) ( not ( = ?auto_179443 ?auto_179442 ) ) ( not ( = ?auto_179443 ?auto_179441 ) ) ( not ( = ?auto_179445 ?auto_179448 ) ) ( not ( = ?auto_179445 ?auto_179446 ) ) ( not ( = ?auto_179445 ?auto_179447 ) ) ( not ( = ?auto_179445 ?auto_179444 ) ) ( not ( = ?auto_179445 ?auto_179442 ) ) ( not ( = ?auto_179445 ?auto_179441 ) ) ( not ( = ?auto_179448 ?auto_179446 ) ) ( not ( = ?auto_179448 ?auto_179447 ) ) ( not ( = ?auto_179448 ?auto_179444 ) ) ( not ( = ?auto_179448 ?auto_179442 ) ) ( not ( = ?auto_179448 ?auto_179441 ) ) ( not ( = ?auto_179446 ?auto_179447 ) ) ( not ( = ?auto_179446 ?auto_179444 ) ) ( not ( = ?auto_179446 ?auto_179442 ) ) ( not ( = ?auto_179446 ?auto_179441 ) ) ( not ( = ?auto_179447 ?auto_179444 ) ) ( not ( = ?auto_179447 ?auto_179442 ) ) ( not ( = ?auto_179447 ?auto_179441 ) ) ( not ( = ?auto_179440 ?auto_179443 ) ) ( not ( = ?auto_179440 ?auto_179445 ) ) ( not ( = ?auto_179440 ?auto_179448 ) ) ( not ( = ?auto_179440 ?auto_179446 ) ) ( not ( = ?auto_179440 ?auto_179447 ) ) ( HOLDING ?auto_179440 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179440 )
      ( MAKE-3PILE ?auto_179440 ?auto_179441 ?auto_179442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179449 - BLOCK
      ?auto_179450 - BLOCK
      ?auto_179451 - BLOCK
    )
    :vars
    (
      ?auto_179452 - BLOCK
      ?auto_179455 - BLOCK
      ?auto_179457 - BLOCK
      ?auto_179453 - BLOCK
      ?auto_179456 - BLOCK
      ?auto_179454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179449 ?auto_179450 ) ) ( not ( = ?auto_179449 ?auto_179451 ) ) ( not ( = ?auto_179450 ?auto_179451 ) ) ( ON ?auto_179451 ?auto_179452 ) ( not ( = ?auto_179449 ?auto_179452 ) ) ( not ( = ?auto_179450 ?auto_179452 ) ) ( not ( = ?auto_179451 ?auto_179452 ) ) ( ON ?auto_179450 ?auto_179451 ) ( ON-TABLE ?auto_179455 ) ( ON ?auto_179457 ?auto_179455 ) ( ON ?auto_179453 ?auto_179457 ) ( ON ?auto_179456 ?auto_179453 ) ( ON ?auto_179454 ?auto_179456 ) ( ON ?auto_179452 ?auto_179454 ) ( not ( = ?auto_179455 ?auto_179457 ) ) ( not ( = ?auto_179455 ?auto_179453 ) ) ( not ( = ?auto_179455 ?auto_179456 ) ) ( not ( = ?auto_179455 ?auto_179454 ) ) ( not ( = ?auto_179455 ?auto_179452 ) ) ( not ( = ?auto_179455 ?auto_179451 ) ) ( not ( = ?auto_179455 ?auto_179450 ) ) ( not ( = ?auto_179457 ?auto_179453 ) ) ( not ( = ?auto_179457 ?auto_179456 ) ) ( not ( = ?auto_179457 ?auto_179454 ) ) ( not ( = ?auto_179457 ?auto_179452 ) ) ( not ( = ?auto_179457 ?auto_179451 ) ) ( not ( = ?auto_179457 ?auto_179450 ) ) ( not ( = ?auto_179453 ?auto_179456 ) ) ( not ( = ?auto_179453 ?auto_179454 ) ) ( not ( = ?auto_179453 ?auto_179452 ) ) ( not ( = ?auto_179453 ?auto_179451 ) ) ( not ( = ?auto_179453 ?auto_179450 ) ) ( not ( = ?auto_179456 ?auto_179454 ) ) ( not ( = ?auto_179456 ?auto_179452 ) ) ( not ( = ?auto_179456 ?auto_179451 ) ) ( not ( = ?auto_179456 ?auto_179450 ) ) ( not ( = ?auto_179454 ?auto_179452 ) ) ( not ( = ?auto_179454 ?auto_179451 ) ) ( not ( = ?auto_179454 ?auto_179450 ) ) ( not ( = ?auto_179449 ?auto_179455 ) ) ( not ( = ?auto_179449 ?auto_179457 ) ) ( not ( = ?auto_179449 ?auto_179453 ) ) ( not ( = ?auto_179449 ?auto_179456 ) ) ( not ( = ?auto_179449 ?auto_179454 ) ) ( ON ?auto_179449 ?auto_179450 ) ( CLEAR ?auto_179449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179455 ?auto_179457 ?auto_179453 ?auto_179456 ?auto_179454 ?auto_179452 ?auto_179451 ?auto_179450 )
      ( MAKE-3PILE ?auto_179449 ?auto_179450 ?auto_179451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179463 - BLOCK
      ?auto_179464 - BLOCK
      ?auto_179465 - BLOCK
      ?auto_179466 - BLOCK
      ?auto_179467 - BLOCK
    )
    :vars
    (
      ?auto_179468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179468 ?auto_179467 ) ( CLEAR ?auto_179468 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179463 ) ( ON ?auto_179464 ?auto_179463 ) ( ON ?auto_179465 ?auto_179464 ) ( ON ?auto_179466 ?auto_179465 ) ( ON ?auto_179467 ?auto_179466 ) ( not ( = ?auto_179463 ?auto_179464 ) ) ( not ( = ?auto_179463 ?auto_179465 ) ) ( not ( = ?auto_179463 ?auto_179466 ) ) ( not ( = ?auto_179463 ?auto_179467 ) ) ( not ( = ?auto_179463 ?auto_179468 ) ) ( not ( = ?auto_179464 ?auto_179465 ) ) ( not ( = ?auto_179464 ?auto_179466 ) ) ( not ( = ?auto_179464 ?auto_179467 ) ) ( not ( = ?auto_179464 ?auto_179468 ) ) ( not ( = ?auto_179465 ?auto_179466 ) ) ( not ( = ?auto_179465 ?auto_179467 ) ) ( not ( = ?auto_179465 ?auto_179468 ) ) ( not ( = ?auto_179466 ?auto_179467 ) ) ( not ( = ?auto_179466 ?auto_179468 ) ) ( not ( = ?auto_179467 ?auto_179468 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179468 ?auto_179467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179469 - BLOCK
      ?auto_179470 - BLOCK
      ?auto_179471 - BLOCK
      ?auto_179472 - BLOCK
      ?auto_179473 - BLOCK
    )
    :vars
    (
      ?auto_179474 - BLOCK
      ?auto_179475 - BLOCK
      ?auto_179476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179474 ?auto_179473 ) ( CLEAR ?auto_179474 ) ( ON-TABLE ?auto_179469 ) ( ON ?auto_179470 ?auto_179469 ) ( ON ?auto_179471 ?auto_179470 ) ( ON ?auto_179472 ?auto_179471 ) ( ON ?auto_179473 ?auto_179472 ) ( not ( = ?auto_179469 ?auto_179470 ) ) ( not ( = ?auto_179469 ?auto_179471 ) ) ( not ( = ?auto_179469 ?auto_179472 ) ) ( not ( = ?auto_179469 ?auto_179473 ) ) ( not ( = ?auto_179469 ?auto_179474 ) ) ( not ( = ?auto_179470 ?auto_179471 ) ) ( not ( = ?auto_179470 ?auto_179472 ) ) ( not ( = ?auto_179470 ?auto_179473 ) ) ( not ( = ?auto_179470 ?auto_179474 ) ) ( not ( = ?auto_179471 ?auto_179472 ) ) ( not ( = ?auto_179471 ?auto_179473 ) ) ( not ( = ?auto_179471 ?auto_179474 ) ) ( not ( = ?auto_179472 ?auto_179473 ) ) ( not ( = ?auto_179472 ?auto_179474 ) ) ( not ( = ?auto_179473 ?auto_179474 ) ) ( HOLDING ?auto_179475 ) ( CLEAR ?auto_179476 ) ( not ( = ?auto_179469 ?auto_179475 ) ) ( not ( = ?auto_179469 ?auto_179476 ) ) ( not ( = ?auto_179470 ?auto_179475 ) ) ( not ( = ?auto_179470 ?auto_179476 ) ) ( not ( = ?auto_179471 ?auto_179475 ) ) ( not ( = ?auto_179471 ?auto_179476 ) ) ( not ( = ?auto_179472 ?auto_179475 ) ) ( not ( = ?auto_179472 ?auto_179476 ) ) ( not ( = ?auto_179473 ?auto_179475 ) ) ( not ( = ?auto_179473 ?auto_179476 ) ) ( not ( = ?auto_179474 ?auto_179475 ) ) ( not ( = ?auto_179474 ?auto_179476 ) ) ( not ( = ?auto_179475 ?auto_179476 ) ) )
    :subtasks
    ( ( !STACK ?auto_179475 ?auto_179476 )
      ( MAKE-5PILE ?auto_179469 ?auto_179470 ?auto_179471 ?auto_179472 ?auto_179473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179477 - BLOCK
      ?auto_179478 - BLOCK
      ?auto_179479 - BLOCK
      ?auto_179480 - BLOCK
      ?auto_179481 - BLOCK
    )
    :vars
    (
      ?auto_179484 - BLOCK
      ?auto_179482 - BLOCK
      ?auto_179483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179484 ?auto_179481 ) ( ON-TABLE ?auto_179477 ) ( ON ?auto_179478 ?auto_179477 ) ( ON ?auto_179479 ?auto_179478 ) ( ON ?auto_179480 ?auto_179479 ) ( ON ?auto_179481 ?auto_179480 ) ( not ( = ?auto_179477 ?auto_179478 ) ) ( not ( = ?auto_179477 ?auto_179479 ) ) ( not ( = ?auto_179477 ?auto_179480 ) ) ( not ( = ?auto_179477 ?auto_179481 ) ) ( not ( = ?auto_179477 ?auto_179484 ) ) ( not ( = ?auto_179478 ?auto_179479 ) ) ( not ( = ?auto_179478 ?auto_179480 ) ) ( not ( = ?auto_179478 ?auto_179481 ) ) ( not ( = ?auto_179478 ?auto_179484 ) ) ( not ( = ?auto_179479 ?auto_179480 ) ) ( not ( = ?auto_179479 ?auto_179481 ) ) ( not ( = ?auto_179479 ?auto_179484 ) ) ( not ( = ?auto_179480 ?auto_179481 ) ) ( not ( = ?auto_179480 ?auto_179484 ) ) ( not ( = ?auto_179481 ?auto_179484 ) ) ( CLEAR ?auto_179482 ) ( not ( = ?auto_179477 ?auto_179483 ) ) ( not ( = ?auto_179477 ?auto_179482 ) ) ( not ( = ?auto_179478 ?auto_179483 ) ) ( not ( = ?auto_179478 ?auto_179482 ) ) ( not ( = ?auto_179479 ?auto_179483 ) ) ( not ( = ?auto_179479 ?auto_179482 ) ) ( not ( = ?auto_179480 ?auto_179483 ) ) ( not ( = ?auto_179480 ?auto_179482 ) ) ( not ( = ?auto_179481 ?auto_179483 ) ) ( not ( = ?auto_179481 ?auto_179482 ) ) ( not ( = ?auto_179484 ?auto_179483 ) ) ( not ( = ?auto_179484 ?auto_179482 ) ) ( not ( = ?auto_179483 ?auto_179482 ) ) ( ON ?auto_179483 ?auto_179484 ) ( CLEAR ?auto_179483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179477 ?auto_179478 ?auto_179479 ?auto_179480 ?auto_179481 ?auto_179484 )
      ( MAKE-5PILE ?auto_179477 ?auto_179478 ?auto_179479 ?auto_179480 ?auto_179481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179485 - BLOCK
      ?auto_179486 - BLOCK
      ?auto_179487 - BLOCK
      ?auto_179488 - BLOCK
      ?auto_179489 - BLOCK
    )
    :vars
    (
      ?auto_179490 - BLOCK
      ?auto_179491 - BLOCK
      ?auto_179492 - BLOCK
      ?auto_179493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179490 ?auto_179489 ) ( ON-TABLE ?auto_179485 ) ( ON ?auto_179486 ?auto_179485 ) ( ON ?auto_179487 ?auto_179486 ) ( ON ?auto_179488 ?auto_179487 ) ( ON ?auto_179489 ?auto_179488 ) ( not ( = ?auto_179485 ?auto_179486 ) ) ( not ( = ?auto_179485 ?auto_179487 ) ) ( not ( = ?auto_179485 ?auto_179488 ) ) ( not ( = ?auto_179485 ?auto_179489 ) ) ( not ( = ?auto_179485 ?auto_179490 ) ) ( not ( = ?auto_179486 ?auto_179487 ) ) ( not ( = ?auto_179486 ?auto_179488 ) ) ( not ( = ?auto_179486 ?auto_179489 ) ) ( not ( = ?auto_179486 ?auto_179490 ) ) ( not ( = ?auto_179487 ?auto_179488 ) ) ( not ( = ?auto_179487 ?auto_179489 ) ) ( not ( = ?auto_179487 ?auto_179490 ) ) ( not ( = ?auto_179488 ?auto_179489 ) ) ( not ( = ?auto_179488 ?auto_179490 ) ) ( not ( = ?auto_179489 ?auto_179490 ) ) ( not ( = ?auto_179485 ?auto_179491 ) ) ( not ( = ?auto_179485 ?auto_179492 ) ) ( not ( = ?auto_179486 ?auto_179491 ) ) ( not ( = ?auto_179486 ?auto_179492 ) ) ( not ( = ?auto_179487 ?auto_179491 ) ) ( not ( = ?auto_179487 ?auto_179492 ) ) ( not ( = ?auto_179488 ?auto_179491 ) ) ( not ( = ?auto_179488 ?auto_179492 ) ) ( not ( = ?auto_179489 ?auto_179491 ) ) ( not ( = ?auto_179489 ?auto_179492 ) ) ( not ( = ?auto_179490 ?auto_179491 ) ) ( not ( = ?auto_179490 ?auto_179492 ) ) ( not ( = ?auto_179491 ?auto_179492 ) ) ( ON ?auto_179491 ?auto_179490 ) ( CLEAR ?auto_179491 ) ( HOLDING ?auto_179492 ) ( CLEAR ?auto_179493 ) ( ON-TABLE ?auto_179493 ) ( not ( = ?auto_179493 ?auto_179492 ) ) ( not ( = ?auto_179485 ?auto_179493 ) ) ( not ( = ?auto_179486 ?auto_179493 ) ) ( not ( = ?auto_179487 ?auto_179493 ) ) ( not ( = ?auto_179488 ?auto_179493 ) ) ( not ( = ?auto_179489 ?auto_179493 ) ) ( not ( = ?auto_179490 ?auto_179493 ) ) ( not ( = ?auto_179491 ?auto_179493 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179493 ?auto_179492 )
      ( MAKE-5PILE ?auto_179485 ?auto_179486 ?auto_179487 ?auto_179488 ?auto_179489 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179494 - BLOCK
      ?auto_179495 - BLOCK
      ?auto_179496 - BLOCK
      ?auto_179497 - BLOCK
      ?auto_179498 - BLOCK
    )
    :vars
    (
      ?auto_179499 - BLOCK
      ?auto_179502 - BLOCK
      ?auto_179501 - BLOCK
      ?auto_179500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179499 ?auto_179498 ) ( ON-TABLE ?auto_179494 ) ( ON ?auto_179495 ?auto_179494 ) ( ON ?auto_179496 ?auto_179495 ) ( ON ?auto_179497 ?auto_179496 ) ( ON ?auto_179498 ?auto_179497 ) ( not ( = ?auto_179494 ?auto_179495 ) ) ( not ( = ?auto_179494 ?auto_179496 ) ) ( not ( = ?auto_179494 ?auto_179497 ) ) ( not ( = ?auto_179494 ?auto_179498 ) ) ( not ( = ?auto_179494 ?auto_179499 ) ) ( not ( = ?auto_179495 ?auto_179496 ) ) ( not ( = ?auto_179495 ?auto_179497 ) ) ( not ( = ?auto_179495 ?auto_179498 ) ) ( not ( = ?auto_179495 ?auto_179499 ) ) ( not ( = ?auto_179496 ?auto_179497 ) ) ( not ( = ?auto_179496 ?auto_179498 ) ) ( not ( = ?auto_179496 ?auto_179499 ) ) ( not ( = ?auto_179497 ?auto_179498 ) ) ( not ( = ?auto_179497 ?auto_179499 ) ) ( not ( = ?auto_179498 ?auto_179499 ) ) ( not ( = ?auto_179494 ?auto_179502 ) ) ( not ( = ?auto_179494 ?auto_179501 ) ) ( not ( = ?auto_179495 ?auto_179502 ) ) ( not ( = ?auto_179495 ?auto_179501 ) ) ( not ( = ?auto_179496 ?auto_179502 ) ) ( not ( = ?auto_179496 ?auto_179501 ) ) ( not ( = ?auto_179497 ?auto_179502 ) ) ( not ( = ?auto_179497 ?auto_179501 ) ) ( not ( = ?auto_179498 ?auto_179502 ) ) ( not ( = ?auto_179498 ?auto_179501 ) ) ( not ( = ?auto_179499 ?auto_179502 ) ) ( not ( = ?auto_179499 ?auto_179501 ) ) ( not ( = ?auto_179502 ?auto_179501 ) ) ( ON ?auto_179502 ?auto_179499 ) ( CLEAR ?auto_179500 ) ( ON-TABLE ?auto_179500 ) ( not ( = ?auto_179500 ?auto_179501 ) ) ( not ( = ?auto_179494 ?auto_179500 ) ) ( not ( = ?auto_179495 ?auto_179500 ) ) ( not ( = ?auto_179496 ?auto_179500 ) ) ( not ( = ?auto_179497 ?auto_179500 ) ) ( not ( = ?auto_179498 ?auto_179500 ) ) ( not ( = ?auto_179499 ?auto_179500 ) ) ( not ( = ?auto_179502 ?auto_179500 ) ) ( ON ?auto_179501 ?auto_179502 ) ( CLEAR ?auto_179501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179494 ?auto_179495 ?auto_179496 ?auto_179497 ?auto_179498 ?auto_179499 ?auto_179502 )
      ( MAKE-5PILE ?auto_179494 ?auto_179495 ?auto_179496 ?auto_179497 ?auto_179498 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179503 - BLOCK
      ?auto_179504 - BLOCK
      ?auto_179505 - BLOCK
      ?auto_179506 - BLOCK
      ?auto_179507 - BLOCK
    )
    :vars
    (
      ?auto_179509 - BLOCK
      ?auto_179508 - BLOCK
      ?auto_179511 - BLOCK
      ?auto_179510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179509 ?auto_179507 ) ( ON-TABLE ?auto_179503 ) ( ON ?auto_179504 ?auto_179503 ) ( ON ?auto_179505 ?auto_179504 ) ( ON ?auto_179506 ?auto_179505 ) ( ON ?auto_179507 ?auto_179506 ) ( not ( = ?auto_179503 ?auto_179504 ) ) ( not ( = ?auto_179503 ?auto_179505 ) ) ( not ( = ?auto_179503 ?auto_179506 ) ) ( not ( = ?auto_179503 ?auto_179507 ) ) ( not ( = ?auto_179503 ?auto_179509 ) ) ( not ( = ?auto_179504 ?auto_179505 ) ) ( not ( = ?auto_179504 ?auto_179506 ) ) ( not ( = ?auto_179504 ?auto_179507 ) ) ( not ( = ?auto_179504 ?auto_179509 ) ) ( not ( = ?auto_179505 ?auto_179506 ) ) ( not ( = ?auto_179505 ?auto_179507 ) ) ( not ( = ?auto_179505 ?auto_179509 ) ) ( not ( = ?auto_179506 ?auto_179507 ) ) ( not ( = ?auto_179506 ?auto_179509 ) ) ( not ( = ?auto_179507 ?auto_179509 ) ) ( not ( = ?auto_179503 ?auto_179508 ) ) ( not ( = ?auto_179503 ?auto_179511 ) ) ( not ( = ?auto_179504 ?auto_179508 ) ) ( not ( = ?auto_179504 ?auto_179511 ) ) ( not ( = ?auto_179505 ?auto_179508 ) ) ( not ( = ?auto_179505 ?auto_179511 ) ) ( not ( = ?auto_179506 ?auto_179508 ) ) ( not ( = ?auto_179506 ?auto_179511 ) ) ( not ( = ?auto_179507 ?auto_179508 ) ) ( not ( = ?auto_179507 ?auto_179511 ) ) ( not ( = ?auto_179509 ?auto_179508 ) ) ( not ( = ?auto_179509 ?auto_179511 ) ) ( not ( = ?auto_179508 ?auto_179511 ) ) ( ON ?auto_179508 ?auto_179509 ) ( not ( = ?auto_179510 ?auto_179511 ) ) ( not ( = ?auto_179503 ?auto_179510 ) ) ( not ( = ?auto_179504 ?auto_179510 ) ) ( not ( = ?auto_179505 ?auto_179510 ) ) ( not ( = ?auto_179506 ?auto_179510 ) ) ( not ( = ?auto_179507 ?auto_179510 ) ) ( not ( = ?auto_179509 ?auto_179510 ) ) ( not ( = ?auto_179508 ?auto_179510 ) ) ( ON ?auto_179511 ?auto_179508 ) ( CLEAR ?auto_179511 ) ( HOLDING ?auto_179510 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179510 )
      ( MAKE-5PILE ?auto_179503 ?auto_179504 ?auto_179505 ?auto_179506 ?auto_179507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179512 - BLOCK
      ?auto_179513 - BLOCK
      ?auto_179514 - BLOCK
      ?auto_179515 - BLOCK
      ?auto_179516 - BLOCK
    )
    :vars
    (
      ?auto_179519 - BLOCK
      ?auto_179520 - BLOCK
      ?auto_179517 - BLOCK
      ?auto_179518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179519 ?auto_179516 ) ( ON-TABLE ?auto_179512 ) ( ON ?auto_179513 ?auto_179512 ) ( ON ?auto_179514 ?auto_179513 ) ( ON ?auto_179515 ?auto_179514 ) ( ON ?auto_179516 ?auto_179515 ) ( not ( = ?auto_179512 ?auto_179513 ) ) ( not ( = ?auto_179512 ?auto_179514 ) ) ( not ( = ?auto_179512 ?auto_179515 ) ) ( not ( = ?auto_179512 ?auto_179516 ) ) ( not ( = ?auto_179512 ?auto_179519 ) ) ( not ( = ?auto_179513 ?auto_179514 ) ) ( not ( = ?auto_179513 ?auto_179515 ) ) ( not ( = ?auto_179513 ?auto_179516 ) ) ( not ( = ?auto_179513 ?auto_179519 ) ) ( not ( = ?auto_179514 ?auto_179515 ) ) ( not ( = ?auto_179514 ?auto_179516 ) ) ( not ( = ?auto_179514 ?auto_179519 ) ) ( not ( = ?auto_179515 ?auto_179516 ) ) ( not ( = ?auto_179515 ?auto_179519 ) ) ( not ( = ?auto_179516 ?auto_179519 ) ) ( not ( = ?auto_179512 ?auto_179520 ) ) ( not ( = ?auto_179512 ?auto_179517 ) ) ( not ( = ?auto_179513 ?auto_179520 ) ) ( not ( = ?auto_179513 ?auto_179517 ) ) ( not ( = ?auto_179514 ?auto_179520 ) ) ( not ( = ?auto_179514 ?auto_179517 ) ) ( not ( = ?auto_179515 ?auto_179520 ) ) ( not ( = ?auto_179515 ?auto_179517 ) ) ( not ( = ?auto_179516 ?auto_179520 ) ) ( not ( = ?auto_179516 ?auto_179517 ) ) ( not ( = ?auto_179519 ?auto_179520 ) ) ( not ( = ?auto_179519 ?auto_179517 ) ) ( not ( = ?auto_179520 ?auto_179517 ) ) ( ON ?auto_179520 ?auto_179519 ) ( not ( = ?auto_179518 ?auto_179517 ) ) ( not ( = ?auto_179512 ?auto_179518 ) ) ( not ( = ?auto_179513 ?auto_179518 ) ) ( not ( = ?auto_179514 ?auto_179518 ) ) ( not ( = ?auto_179515 ?auto_179518 ) ) ( not ( = ?auto_179516 ?auto_179518 ) ) ( not ( = ?auto_179519 ?auto_179518 ) ) ( not ( = ?auto_179520 ?auto_179518 ) ) ( ON ?auto_179517 ?auto_179520 ) ( ON ?auto_179518 ?auto_179517 ) ( CLEAR ?auto_179518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179512 ?auto_179513 ?auto_179514 ?auto_179515 ?auto_179516 ?auto_179519 ?auto_179520 ?auto_179517 )
      ( MAKE-5PILE ?auto_179512 ?auto_179513 ?auto_179514 ?auto_179515 ?auto_179516 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179525 - BLOCK
      ?auto_179526 - BLOCK
      ?auto_179527 - BLOCK
      ?auto_179528 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_179528 ) ( CLEAR ?auto_179527 ) ( ON-TABLE ?auto_179525 ) ( ON ?auto_179526 ?auto_179525 ) ( ON ?auto_179527 ?auto_179526 ) ( not ( = ?auto_179525 ?auto_179526 ) ) ( not ( = ?auto_179525 ?auto_179527 ) ) ( not ( = ?auto_179525 ?auto_179528 ) ) ( not ( = ?auto_179526 ?auto_179527 ) ) ( not ( = ?auto_179526 ?auto_179528 ) ) ( not ( = ?auto_179527 ?auto_179528 ) ) )
    :subtasks
    ( ( !STACK ?auto_179528 ?auto_179527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179529 - BLOCK
      ?auto_179530 - BLOCK
      ?auto_179531 - BLOCK
      ?auto_179532 - BLOCK
    )
    :vars
    (
      ?auto_179533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_179531 ) ( ON-TABLE ?auto_179529 ) ( ON ?auto_179530 ?auto_179529 ) ( ON ?auto_179531 ?auto_179530 ) ( not ( = ?auto_179529 ?auto_179530 ) ) ( not ( = ?auto_179529 ?auto_179531 ) ) ( not ( = ?auto_179529 ?auto_179532 ) ) ( not ( = ?auto_179530 ?auto_179531 ) ) ( not ( = ?auto_179530 ?auto_179532 ) ) ( not ( = ?auto_179531 ?auto_179532 ) ) ( ON ?auto_179532 ?auto_179533 ) ( CLEAR ?auto_179532 ) ( HAND-EMPTY ) ( not ( = ?auto_179529 ?auto_179533 ) ) ( not ( = ?auto_179530 ?auto_179533 ) ) ( not ( = ?auto_179531 ?auto_179533 ) ) ( not ( = ?auto_179532 ?auto_179533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179532 ?auto_179533 )
      ( MAKE-4PILE ?auto_179529 ?auto_179530 ?auto_179531 ?auto_179532 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179534 - BLOCK
      ?auto_179535 - BLOCK
      ?auto_179536 - BLOCK
      ?auto_179537 - BLOCK
    )
    :vars
    (
      ?auto_179538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179534 ) ( ON ?auto_179535 ?auto_179534 ) ( not ( = ?auto_179534 ?auto_179535 ) ) ( not ( = ?auto_179534 ?auto_179536 ) ) ( not ( = ?auto_179534 ?auto_179537 ) ) ( not ( = ?auto_179535 ?auto_179536 ) ) ( not ( = ?auto_179535 ?auto_179537 ) ) ( not ( = ?auto_179536 ?auto_179537 ) ) ( ON ?auto_179537 ?auto_179538 ) ( CLEAR ?auto_179537 ) ( not ( = ?auto_179534 ?auto_179538 ) ) ( not ( = ?auto_179535 ?auto_179538 ) ) ( not ( = ?auto_179536 ?auto_179538 ) ) ( not ( = ?auto_179537 ?auto_179538 ) ) ( HOLDING ?auto_179536 ) ( CLEAR ?auto_179535 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179534 ?auto_179535 ?auto_179536 )
      ( MAKE-4PILE ?auto_179534 ?auto_179535 ?auto_179536 ?auto_179537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179539 - BLOCK
      ?auto_179540 - BLOCK
      ?auto_179541 - BLOCK
      ?auto_179542 - BLOCK
    )
    :vars
    (
      ?auto_179543 - BLOCK
      ?auto_179546 - BLOCK
      ?auto_179544 - BLOCK
      ?auto_179547 - BLOCK
      ?auto_179545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179539 ) ( ON ?auto_179540 ?auto_179539 ) ( not ( = ?auto_179539 ?auto_179540 ) ) ( not ( = ?auto_179539 ?auto_179541 ) ) ( not ( = ?auto_179539 ?auto_179542 ) ) ( not ( = ?auto_179540 ?auto_179541 ) ) ( not ( = ?auto_179540 ?auto_179542 ) ) ( not ( = ?auto_179541 ?auto_179542 ) ) ( ON ?auto_179542 ?auto_179543 ) ( not ( = ?auto_179539 ?auto_179543 ) ) ( not ( = ?auto_179540 ?auto_179543 ) ) ( not ( = ?auto_179541 ?auto_179543 ) ) ( not ( = ?auto_179542 ?auto_179543 ) ) ( CLEAR ?auto_179540 ) ( ON ?auto_179541 ?auto_179542 ) ( CLEAR ?auto_179541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179546 ) ( ON ?auto_179544 ?auto_179546 ) ( ON ?auto_179547 ?auto_179544 ) ( ON ?auto_179545 ?auto_179547 ) ( ON ?auto_179543 ?auto_179545 ) ( not ( = ?auto_179546 ?auto_179544 ) ) ( not ( = ?auto_179546 ?auto_179547 ) ) ( not ( = ?auto_179546 ?auto_179545 ) ) ( not ( = ?auto_179546 ?auto_179543 ) ) ( not ( = ?auto_179546 ?auto_179542 ) ) ( not ( = ?auto_179546 ?auto_179541 ) ) ( not ( = ?auto_179544 ?auto_179547 ) ) ( not ( = ?auto_179544 ?auto_179545 ) ) ( not ( = ?auto_179544 ?auto_179543 ) ) ( not ( = ?auto_179544 ?auto_179542 ) ) ( not ( = ?auto_179544 ?auto_179541 ) ) ( not ( = ?auto_179547 ?auto_179545 ) ) ( not ( = ?auto_179547 ?auto_179543 ) ) ( not ( = ?auto_179547 ?auto_179542 ) ) ( not ( = ?auto_179547 ?auto_179541 ) ) ( not ( = ?auto_179545 ?auto_179543 ) ) ( not ( = ?auto_179545 ?auto_179542 ) ) ( not ( = ?auto_179545 ?auto_179541 ) ) ( not ( = ?auto_179539 ?auto_179546 ) ) ( not ( = ?auto_179539 ?auto_179544 ) ) ( not ( = ?auto_179539 ?auto_179547 ) ) ( not ( = ?auto_179539 ?auto_179545 ) ) ( not ( = ?auto_179540 ?auto_179546 ) ) ( not ( = ?auto_179540 ?auto_179544 ) ) ( not ( = ?auto_179540 ?auto_179547 ) ) ( not ( = ?auto_179540 ?auto_179545 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179546 ?auto_179544 ?auto_179547 ?auto_179545 ?auto_179543 ?auto_179542 )
      ( MAKE-4PILE ?auto_179539 ?auto_179540 ?auto_179541 ?auto_179542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179548 - BLOCK
      ?auto_179549 - BLOCK
      ?auto_179550 - BLOCK
      ?auto_179551 - BLOCK
    )
    :vars
    (
      ?auto_179556 - BLOCK
      ?auto_179552 - BLOCK
      ?auto_179555 - BLOCK
      ?auto_179553 - BLOCK
      ?auto_179554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179548 ) ( not ( = ?auto_179548 ?auto_179549 ) ) ( not ( = ?auto_179548 ?auto_179550 ) ) ( not ( = ?auto_179548 ?auto_179551 ) ) ( not ( = ?auto_179549 ?auto_179550 ) ) ( not ( = ?auto_179549 ?auto_179551 ) ) ( not ( = ?auto_179550 ?auto_179551 ) ) ( ON ?auto_179551 ?auto_179556 ) ( not ( = ?auto_179548 ?auto_179556 ) ) ( not ( = ?auto_179549 ?auto_179556 ) ) ( not ( = ?auto_179550 ?auto_179556 ) ) ( not ( = ?auto_179551 ?auto_179556 ) ) ( ON ?auto_179550 ?auto_179551 ) ( CLEAR ?auto_179550 ) ( ON-TABLE ?auto_179552 ) ( ON ?auto_179555 ?auto_179552 ) ( ON ?auto_179553 ?auto_179555 ) ( ON ?auto_179554 ?auto_179553 ) ( ON ?auto_179556 ?auto_179554 ) ( not ( = ?auto_179552 ?auto_179555 ) ) ( not ( = ?auto_179552 ?auto_179553 ) ) ( not ( = ?auto_179552 ?auto_179554 ) ) ( not ( = ?auto_179552 ?auto_179556 ) ) ( not ( = ?auto_179552 ?auto_179551 ) ) ( not ( = ?auto_179552 ?auto_179550 ) ) ( not ( = ?auto_179555 ?auto_179553 ) ) ( not ( = ?auto_179555 ?auto_179554 ) ) ( not ( = ?auto_179555 ?auto_179556 ) ) ( not ( = ?auto_179555 ?auto_179551 ) ) ( not ( = ?auto_179555 ?auto_179550 ) ) ( not ( = ?auto_179553 ?auto_179554 ) ) ( not ( = ?auto_179553 ?auto_179556 ) ) ( not ( = ?auto_179553 ?auto_179551 ) ) ( not ( = ?auto_179553 ?auto_179550 ) ) ( not ( = ?auto_179554 ?auto_179556 ) ) ( not ( = ?auto_179554 ?auto_179551 ) ) ( not ( = ?auto_179554 ?auto_179550 ) ) ( not ( = ?auto_179548 ?auto_179552 ) ) ( not ( = ?auto_179548 ?auto_179555 ) ) ( not ( = ?auto_179548 ?auto_179553 ) ) ( not ( = ?auto_179548 ?auto_179554 ) ) ( not ( = ?auto_179549 ?auto_179552 ) ) ( not ( = ?auto_179549 ?auto_179555 ) ) ( not ( = ?auto_179549 ?auto_179553 ) ) ( not ( = ?auto_179549 ?auto_179554 ) ) ( HOLDING ?auto_179549 ) ( CLEAR ?auto_179548 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179548 ?auto_179549 )
      ( MAKE-4PILE ?auto_179548 ?auto_179549 ?auto_179550 ?auto_179551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179557 - BLOCK
      ?auto_179558 - BLOCK
      ?auto_179559 - BLOCK
      ?auto_179560 - BLOCK
    )
    :vars
    (
      ?auto_179562 - BLOCK
      ?auto_179565 - BLOCK
      ?auto_179563 - BLOCK
      ?auto_179564 - BLOCK
      ?auto_179561 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179557 ) ( not ( = ?auto_179557 ?auto_179558 ) ) ( not ( = ?auto_179557 ?auto_179559 ) ) ( not ( = ?auto_179557 ?auto_179560 ) ) ( not ( = ?auto_179558 ?auto_179559 ) ) ( not ( = ?auto_179558 ?auto_179560 ) ) ( not ( = ?auto_179559 ?auto_179560 ) ) ( ON ?auto_179560 ?auto_179562 ) ( not ( = ?auto_179557 ?auto_179562 ) ) ( not ( = ?auto_179558 ?auto_179562 ) ) ( not ( = ?auto_179559 ?auto_179562 ) ) ( not ( = ?auto_179560 ?auto_179562 ) ) ( ON ?auto_179559 ?auto_179560 ) ( ON-TABLE ?auto_179565 ) ( ON ?auto_179563 ?auto_179565 ) ( ON ?auto_179564 ?auto_179563 ) ( ON ?auto_179561 ?auto_179564 ) ( ON ?auto_179562 ?auto_179561 ) ( not ( = ?auto_179565 ?auto_179563 ) ) ( not ( = ?auto_179565 ?auto_179564 ) ) ( not ( = ?auto_179565 ?auto_179561 ) ) ( not ( = ?auto_179565 ?auto_179562 ) ) ( not ( = ?auto_179565 ?auto_179560 ) ) ( not ( = ?auto_179565 ?auto_179559 ) ) ( not ( = ?auto_179563 ?auto_179564 ) ) ( not ( = ?auto_179563 ?auto_179561 ) ) ( not ( = ?auto_179563 ?auto_179562 ) ) ( not ( = ?auto_179563 ?auto_179560 ) ) ( not ( = ?auto_179563 ?auto_179559 ) ) ( not ( = ?auto_179564 ?auto_179561 ) ) ( not ( = ?auto_179564 ?auto_179562 ) ) ( not ( = ?auto_179564 ?auto_179560 ) ) ( not ( = ?auto_179564 ?auto_179559 ) ) ( not ( = ?auto_179561 ?auto_179562 ) ) ( not ( = ?auto_179561 ?auto_179560 ) ) ( not ( = ?auto_179561 ?auto_179559 ) ) ( not ( = ?auto_179557 ?auto_179565 ) ) ( not ( = ?auto_179557 ?auto_179563 ) ) ( not ( = ?auto_179557 ?auto_179564 ) ) ( not ( = ?auto_179557 ?auto_179561 ) ) ( not ( = ?auto_179558 ?auto_179565 ) ) ( not ( = ?auto_179558 ?auto_179563 ) ) ( not ( = ?auto_179558 ?auto_179564 ) ) ( not ( = ?auto_179558 ?auto_179561 ) ) ( CLEAR ?auto_179557 ) ( ON ?auto_179558 ?auto_179559 ) ( CLEAR ?auto_179558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179565 ?auto_179563 ?auto_179564 ?auto_179561 ?auto_179562 ?auto_179560 ?auto_179559 )
      ( MAKE-4PILE ?auto_179557 ?auto_179558 ?auto_179559 ?auto_179560 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179566 - BLOCK
      ?auto_179567 - BLOCK
      ?auto_179568 - BLOCK
      ?auto_179569 - BLOCK
    )
    :vars
    (
      ?auto_179571 - BLOCK
      ?auto_179573 - BLOCK
      ?auto_179574 - BLOCK
      ?auto_179572 - BLOCK
      ?auto_179570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179566 ?auto_179567 ) ) ( not ( = ?auto_179566 ?auto_179568 ) ) ( not ( = ?auto_179566 ?auto_179569 ) ) ( not ( = ?auto_179567 ?auto_179568 ) ) ( not ( = ?auto_179567 ?auto_179569 ) ) ( not ( = ?auto_179568 ?auto_179569 ) ) ( ON ?auto_179569 ?auto_179571 ) ( not ( = ?auto_179566 ?auto_179571 ) ) ( not ( = ?auto_179567 ?auto_179571 ) ) ( not ( = ?auto_179568 ?auto_179571 ) ) ( not ( = ?auto_179569 ?auto_179571 ) ) ( ON ?auto_179568 ?auto_179569 ) ( ON-TABLE ?auto_179573 ) ( ON ?auto_179574 ?auto_179573 ) ( ON ?auto_179572 ?auto_179574 ) ( ON ?auto_179570 ?auto_179572 ) ( ON ?auto_179571 ?auto_179570 ) ( not ( = ?auto_179573 ?auto_179574 ) ) ( not ( = ?auto_179573 ?auto_179572 ) ) ( not ( = ?auto_179573 ?auto_179570 ) ) ( not ( = ?auto_179573 ?auto_179571 ) ) ( not ( = ?auto_179573 ?auto_179569 ) ) ( not ( = ?auto_179573 ?auto_179568 ) ) ( not ( = ?auto_179574 ?auto_179572 ) ) ( not ( = ?auto_179574 ?auto_179570 ) ) ( not ( = ?auto_179574 ?auto_179571 ) ) ( not ( = ?auto_179574 ?auto_179569 ) ) ( not ( = ?auto_179574 ?auto_179568 ) ) ( not ( = ?auto_179572 ?auto_179570 ) ) ( not ( = ?auto_179572 ?auto_179571 ) ) ( not ( = ?auto_179572 ?auto_179569 ) ) ( not ( = ?auto_179572 ?auto_179568 ) ) ( not ( = ?auto_179570 ?auto_179571 ) ) ( not ( = ?auto_179570 ?auto_179569 ) ) ( not ( = ?auto_179570 ?auto_179568 ) ) ( not ( = ?auto_179566 ?auto_179573 ) ) ( not ( = ?auto_179566 ?auto_179574 ) ) ( not ( = ?auto_179566 ?auto_179572 ) ) ( not ( = ?auto_179566 ?auto_179570 ) ) ( not ( = ?auto_179567 ?auto_179573 ) ) ( not ( = ?auto_179567 ?auto_179574 ) ) ( not ( = ?auto_179567 ?auto_179572 ) ) ( not ( = ?auto_179567 ?auto_179570 ) ) ( ON ?auto_179567 ?auto_179568 ) ( CLEAR ?auto_179567 ) ( HOLDING ?auto_179566 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179566 )
      ( MAKE-4PILE ?auto_179566 ?auto_179567 ?auto_179568 ?auto_179569 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179575 - BLOCK
      ?auto_179576 - BLOCK
      ?auto_179577 - BLOCK
      ?auto_179578 - BLOCK
    )
    :vars
    (
      ?auto_179579 - BLOCK
      ?auto_179581 - BLOCK
      ?auto_179582 - BLOCK
      ?auto_179583 - BLOCK
      ?auto_179580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179575 ?auto_179576 ) ) ( not ( = ?auto_179575 ?auto_179577 ) ) ( not ( = ?auto_179575 ?auto_179578 ) ) ( not ( = ?auto_179576 ?auto_179577 ) ) ( not ( = ?auto_179576 ?auto_179578 ) ) ( not ( = ?auto_179577 ?auto_179578 ) ) ( ON ?auto_179578 ?auto_179579 ) ( not ( = ?auto_179575 ?auto_179579 ) ) ( not ( = ?auto_179576 ?auto_179579 ) ) ( not ( = ?auto_179577 ?auto_179579 ) ) ( not ( = ?auto_179578 ?auto_179579 ) ) ( ON ?auto_179577 ?auto_179578 ) ( ON-TABLE ?auto_179581 ) ( ON ?auto_179582 ?auto_179581 ) ( ON ?auto_179583 ?auto_179582 ) ( ON ?auto_179580 ?auto_179583 ) ( ON ?auto_179579 ?auto_179580 ) ( not ( = ?auto_179581 ?auto_179582 ) ) ( not ( = ?auto_179581 ?auto_179583 ) ) ( not ( = ?auto_179581 ?auto_179580 ) ) ( not ( = ?auto_179581 ?auto_179579 ) ) ( not ( = ?auto_179581 ?auto_179578 ) ) ( not ( = ?auto_179581 ?auto_179577 ) ) ( not ( = ?auto_179582 ?auto_179583 ) ) ( not ( = ?auto_179582 ?auto_179580 ) ) ( not ( = ?auto_179582 ?auto_179579 ) ) ( not ( = ?auto_179582 ?auto_179578 ) ) ( not ( = ?auto_179582 ?auto_179577 ) ) ( not ( = ?auto_179583 ?auto_179580 ) ) ( not ( = ?auto_179583 ?auto_179579 ) ) ( not ( = ?auto_179583 ?auto_179578 ) ) ( not ( = ?auto_179583 ?auto_179577 ) ) ( not ( = ?auto_179580 ?auto_179579 ) ) ( not ( = ?auto_179580 ?auto_179578 ) ) ( not ( = ?auto_179580 ?auto_179577 ) ) ( not ( = ?auto_179575 ?auto_179581 ) ) ( not ( = ?auto_179575 ?auto_179582 ) ) ( not ( = ?auto_179575 ?auto_179583 ) ) ( not ( = ?auto_179575 ?auto_179580 ) ) ( not ( = ?auto_179576 ?auto_179581 ) ) ( not ( = ?auto_179576 ?auto_179582 ) ) ( not ( = ?auto_179576 ?auto_179583 ) ) ( not ( = ?auto_179576 ?auto_179580 ) ) ( ON ?auto_179576 ?auto_179577 ) ( ON ?auto_179575 ?auto_179576 ) ( CLEAR ?auto_179575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179581 ?auto_179582 ?auto_179583 ?auto_179580 ?auto_179579 ?auto_179578 ?auto_179577 ?auto_179576 )
      ( MAKE-4PILE ?auto_179575 ?auto_179576 ?auto_179577 ?auto_179578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179588 - BLOCK
      ?auto_179589 - BLOCK
      ?auto_179590 - BLOCK
      ?auto_179591 - BLOCK
    )
    :vars
    (
      ?auto_179592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179592 ?auto_179591 ) ( CLEAR ?auto_179592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179588 ) ( ON ?auto_179589 ?auto_179588 ) ( ON ?auto_179590 ?auto_179589 ) ( ON ?auto_179591 ?auto_179590 ) ( not ( = ?auto_179588 ?auto_179589 ) ) ( not ( = ?auto_179588 ?auto_179590 ) ) ( not ( = ?auto_179588 ?auto_179591 ) ) ( not ( = ?auto_179588 ?auto_179592 ) ) ( not ( = ?auto_179589 ?auto_179590 ) ) ( not ( = ?auto_179589 ?auto_179591 ) ) ( not ( = ?auto_179589 ?auto_179592 ) ) ( not ( = ?auto_179590 ?auto_179591 ) ) ( not ( = ?auto_179590 ?auto_179592 ) ) ( not ( = ?auto_179591 ?auto_179592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179592 ?auto_179591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179593 - BLOCK
      ?auto_179594 - BLOCK
      ?auto_179595 - BLOCK
      ?auto_179596 - BLOCK
    )
    :vars
    (
      ?auto_179597 - BLOCK
      ?auto_179598 - BLOCK
      ?auto_179599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179597 ?auto_179596 ) ( CLEAR ?auto_179597 ) ( ON-TABLE ?auto_179593 ) ( ON ?auto_179594 ?auto_179593 ) ( ON ?auto_179595 ?auto_179594 ) ( ON ?auto_179596 ?auto_179595 ) ( not ( = ?auto_179593 ?auto_179594 ) ) ( not ( = ?auto_179593 ?auto_179595 ) ) ( not ( = ?auto_179593 ?auto_179596 ) ) ( not ( = ?auto_179593 ?auto_179597 ) ) ( not ( = ?auto_179594 ?auto_179595 ) ) ( not ( = ?auto_179594 ?auto_179596 ) ) ( not ( = ?auto_179594 ?auto_179597 ) ) ( not ( = ?auto_179595 ?auto_179596 ) ) ( not ( = ?auto_179595 ?auto_179597 ) ) ( not ( = ?auto_179596 ?auto_179597 ) ) ( HOLDING ?auto_179598 ) ( CLEAR ?auto_179599 ) ( not ( = ?auto_179593 ?auto_179598 ) ) ( not ( = ?auto_179593 ?auto_179599 ) ) ( not ( = ?auto_179594 ?auto_179598 ) ) ( not ( = ?auto_179594 ?auto_179599 ) ) ( not ( = ?auto_179595 ?auto_179598 ) ) ( not ( = ?auto_179595 ?auto_179599 ) ) ( not ( = ?auto_179596 ?auto_179598 ) ) ( not ( = ?auto_179596 ?auto_179599 ) ) ( not ( = ?auto_179597 ?auto_179598 ) ) ( not ( = ?auto_179597 ?auto_179599 ) ) ( not ( = ?auto_179598 ?auto_179599 ) ) )
    :subtasks
    ( ( !STACK ?auto_179598 ?auto_179599 )
      ( MAKE-4PILE ?auto_179593 ?auto_179594 ?auto_179595 ?auto_179596 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179600 - BLOCK
      ?auto_179601 - BLOCK
      ?auto_179602 - BLOCK
      ?auto_179603 - BLOCK
    )
    :vars
    (
      ?auto_179604 - BLOCK
      ?auto_179606 - BLOCK
      ?auto_179605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179604 ?auto_179603 ) ( ON-TABLE ?auto_179600 ) ( ON ?auto_179601 ?auto_179600 ) ( ON ?auto_179602 ?auto_179601 ) ( ON ?auto_179603 ?auto_179602 ) ( not ( = ?auto_179600 ?auto_179601 ) ) ( not ( = ?auto_179600 ?auto_179602 ) ) ( not ( = ?auto_179600 ?auto_179603 ) ) ( not ( = ?auto_179600 ?auto_179604 ) ) ( not ( = ?auto_179601 ?auto_179602 ) ) ( not ( = ?auto_179601 ?auto_179603 ) ) ( not ( = ?auto_179601 ?auto_179604 ) ) ( not ( = ?auto_179602 ?auto_179603 ) ) ( not ( = ?auto_179602 ?auto_179604 ) ) ( not ( = ?auto_179603 ?auto_179604 ) ) ( CLEAR ?auto_179606 ) ( not ( = ?auto_179600 ?auto_179605 ) ) ( not ( = ?auto_179600 ?auto_179606 ) ) ( not ( = ?auto_179601 ?auto_179605 ) ) ( not ( = ?auto_179601 ?auto_179606 ) ) ( not ( = ?auto_179602 ?auto_179605 ) ) ( not ( = ?auto_179602 ?auto_179606 ) ) ( not ( = ?auto_179603 ?auto_179605 ) ) ( not ( = ?auto_179603 ?auto_179606 ) ) ( not ( = ?auto_179604 ?auto_179605 ) ) ( not ( = ?auto_179604 ?auto_179606 ) ) ( not ( = ?auto_179605 ?auto_179606 ) ) ( ON ?auto_179605 ?auto_179604 ) ( CLEAR ?auto_179605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179600 ?auto_179601 ?auto_179602 ?auto_179603 ?auto_179604 )
      ( MAKE-4PILE ?auto_179600 ?auto_179601 ?auto_179602 ?auto_179603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179607 - BLOCK
      ?auto_179608 - BLOCK
      ?auto_179609 - BLOCK
      ?auto_179610 - BLOCK
    )
    :vars
    (
      ?auto_179613 - BLOCK
      ?auto_179611 - BLOCK
      ?auto_179612 - BLOCK
      ?auto_179614 - BLOCK
      ?auto_179615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179613 ?auto_179610 ) ( ON-TABLE ?auto_179607 ) ( ON ?auto_179608 ?auto_179607 ) ( ON ?auto_179609 ?auto_179608 ) ( ON ?auto_179610 ?auto_179609 ) ( not ( = ?auto_179607 ?auto_179608 ) ) ( not ( = ?auto_179607 ?auto_179609 ) ) ( not ( = ?auto_179607 ?auto_179610 ) ) ( not ( = ?auto_179607 ?auto_179613 ) ) ( not ( = ?auto_179608 ?auto_179609 ) ) ( not ( = ?auto_179608 ?auto_179610 ) ) ( not ( = ?auto_179608 ?auto_179613 ) ) ( not ( = ?auto_179609 ?auto_179610 ) ) ( not ( = ?auto_179609 ?auto_179613 ) ) ( not ( = ?auto_179610 ?auto_179613 ) ) ( not ( = ?auto_179607 ?auto_179611 ) ) ( not ( = ?auto_179607 ?auto_179612 ) ) ( not ( = ?auto_179608 ?auto_179611 ) ) ( not ( = ?auto_179608 ?auto_179612 ) ) ( not ( = ?auto_179609 ?auto_179611 ) ) ( not ( = ?auto_179609 ?auto_179612 ) ) ( not ( = ?auto_179610 ?auto_179611 ) ) ( not ( = ?auto_179610 ?auto_179612 ) ) ( not ( = ?auto_179613 ?auto_179611 ) ) ( not ( = ?auto_179613 ?auto_179612 ) ) ( not ( = ?auto_179611 ?auto_179612 ) ) ( ON ?auto_179611 ?auto_179613 ) ( CLEAR ?auto_179611 ) ( HOLDING ?auto_179612 ) ( CLEAR ?auto_179614 ) ( ON-TABLE ?auto_179615 ) ( ON ?auto_179614 ?auto_179615 ) ( not ( = ?auto_179615 ?auto_179614 ) ) ( not ( = ?auto_179615 ?auto_179612 ) ) ( not ( = ?auto_179614 ?auto_179612 ) ) ( not ( = ?auto_179607 ?auto_179614 ) ) ( not ( = ?auto_179607 ?auto_179615 ) ) ( not ( = ?auto_179608 ?auto_179614 ) ) ( not ( = ?auto_179608 ?auto_179615 ) ) ( not ( = ?auto_179609 ?auto_179614 ) ) ( not ( = ?auto_179609 ?auto_179615 ) ) ( not ( = ?auto_179610 ?auto_179614 ) ) ( not ( = ?auto_179610 ?auto_179615 ) ) ( not ( = ?auto_179613 ?auto_179614 ) ) ( not ( = ?auto_179613 ?auto_179615 ) ) ( not ( = ?auto_179611 ?auto_179614 ) ) ( not ( = ?auto_179611 ?auto_179615 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179615 ?auto_179614 ?auto_179612 )
      ( MAKE-4PILE ?auto_179607 ?auto_179608 ?auto_179609 ?auto_179610 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179616 - BLOCK
      ?auto_179617 - BLOCK
      ?auto_179618 - BLOCK
      ?auto_179619 - BLOCK
    )
    :vars
    (
      ?auto_179623 - BLOCK
      ?auto_179620 - BLOCK
      ?auto_179622 - BLOCK
      ?auto_179621 - BLOCK
      ?auto_179624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179623 ?auto_179619 ) ( ON-TABLE ?auto_179616 ) ( ON ?auto_179617 ?auto_179616 ) ( ON ?auto_179618 ?auto_179617 ) ( ON ?auto_179619 ?auto_179618 ) ( not ( = ?auto_179616 ?auto_179617 ) ) ( not ( = ?auto_179616 ?auto_179618 ) ) ( not ( = ?auto_179616 ?auto_179619 ) ) ( not ( = ?auto_179616 ?auto_179623 ) ) ( not ( = ?auto_179617 ?auto_179618 ) ) ( not ( = ?auto_179617 ?auto_179619 ) ) ( not ( = ?auto_179617 ?auto_179623 ) ) ( not ( = ?auto_179618 ?auto_179619 ) ) ( not ( = ?auto_179618 ?auto_179623 ) ) ( not ( = ?auto_179619 ?auto_179623 ) ) ( not ( = ?auto_179616 ?auto_179620 ) ) ( not ( = ?auto_179616 ?auto_179622 ) ) ( not ( = ?auto_179617 ?auto_179620 ) ) ( not ( = ?auto_179617 ?auto_179622 ) ) ( not ( = ?auto_179618 ?auto_179620 ) ) ( not ( = ?auto_179618 ?auto_179622 ) ) ( not ( = ?auto_179619 ?auto_179620 ) ) ( not ( = ?auto_179619 ?auto_179622 ) ) ( not ( = ?auto_179623 ?auto_179620 ) ) ( not ( = ?auto_179623 ?auto_179622 ) ) ( not ( = ?auto_179620 ?auto_179622 ) ) ( ON ?auto_179620 ?auto_179623 ) ( CLEAR ?auto_179621 ) ( ON-TABLE ?auto_179624 ) ( ON ?auto_179621 ?auto_179624 ) ( not ( = ?auto_179624 ?auto_179621 ) ) ( not ( = ?auto_179624 ?auto_179622 ) ) ( not ( = ?auto_179621 ?auto_179622 ) ) ( not ( = ?auto_179616 ?auto_179621 ) ) ( not ( = ?auto_179616 ?auto_179624 ) ) ( not ( = ?auto_179617 ?auto_179621 ) ) ( not ( = ?auto_179617 ?auto_179624 ) ) ( not ( = ?auto_179618 ?auto_179621 ) ) ( not ( = ?auto_179618 ?auto_179624 ) ) ( not ( = ?auto_179619 ?auto_179621 ) ) ( not ( = ?auto_179619 ?auto_179624 ) ) ( not ( = ?auto_179623 ?auto_179621 ) ) ( not ( = ?auto_179623 ?auto_179624 ) ) ( not ( = ?auto_179620 ?auto_179621 ) ) ( not ( = ?auto_179620 ?auto_179624 ) ) ( ON ?auto_179622 ?auto_179620 ) ( CLEAR ?auto_179622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179616 ?auto_179617 ?auto_179618 ?auto_179619 ?auto_179623 ?auto_179620 )
      ( MAKE-4PILE ?auto_179616 ?auto_179617 ?auto_179618 ?auto_179619 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179625 - BLOCK
      ?auto_179626 - BLOCK
      ?auto_179627 - BLOCK
      ?auto_179628 - BLOCK
    )
    :vars
    (
      ?auto_179629 - BLOCK
      ?auto_179632 - BLOCK
      ?auto_179633 - BLOCK
      ?auto_179630 - BLOCK
      ?auto_179631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179629 ?auto_179628 ) ( ON-TABLE ?auto_179625 ) ( ON ?auto_179626 ?auto_179625 ) ( ON ?auto_179627 ?auto_179626 ) ( ON ?auto_179628 ?auto_179627 ) ( not ( = ?auto_179625 ?auto_179626 ) ) ( not ( = ?auto_179625 ?auto_179627 ) ) ( not ( = ?auto_179625 ?auto_179628 ) ) ( not ( = ?auto_179625 ?auto_179629 ) ) ( not ( = ?auto_179626 ?auto_179627 ) ) ( not ( = ?auto_179626 ?auto_179628 ) ) ( not ( = ?auto_179626 ?auto_179629 ) ) ( not ( = ?auto_179627 ?auto_179628 ) ) ( not ( = ?auto_179627 ?auto_179629 ) ) ( not ( = ?auto_179628 ?auto_179629 ) ) ( not ( = ?auto_179625 ?auto_179632 ) ) ( not ( = ?auto_179625 ?auto_179633 ) ) ( not ( = ?auto_179626 ?auto_179632 ) ) ( not ( = ?auto_179626 ?auto_179633 ) ) ( not ( = ?auto_179627 ?auto_179632 ) ) ( not ( = ?auto_179627 ?auto_179633 ) ) ( not ( = ?auto_179628 ?auto_179632 ) ) ( not ( = ?auto_179628 ?auto_179633 ) ) ( not ( = ?auto_179629 ?auto_179632 ) ) ( not ( = ?auto_179629 ?auto_179633 ) ) ( not ( = ?auto_179632 ?auto_179633 ) ) ( ON ?auto_179632 ?auto_179629 ) ( ON-TABLE ?auto_179630 ) ( not ( = ?auto_179630 ?auto_179631 ) ) ( not ( = ?auto_179630 ?auto_179633 ) ) ( not ( = ?auto_179631 ?auto_179633 ) ) ( not ( = ?auto_179625 ?auto_179631 ) ) ( not ( = ?auto_179625 ?auto_179630 ) ) ( not ( = ?auto_179626 ?auto_179631 ) ) ( not ( = ?auto_179626 ?auto_179630 ) ) ( not ( = ?auto_179627 ?auto_179631 ) ) ( not ( = ?auto_179627 ?auto_179630 ) ) ( not ( = ?auto_179628 ?auto_179631 ) ) ( not ( = ?auto_179628 ?auto_179630 ) ) ( not ( = ?auto_179629 ?auto_179631 ) ) ( not ( = ?auto_179629 ?auto_179630 ) ) ( not ( = ?auto_179632 ?auto_179631 ) ) ( not ( = ?auto_179632 ?auto_179630 ) ) ( ON ?auto_179633 ?auto_179632 ) ( CLEAR ?auto_179633 ) ( HOLDING ?auto_179631 ) ( CLEAR ?auto_179630 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179630 ?auto_179631 )
      ( MAKE-4PILE ?auto_179625 ?auto_179626 ?auto_179627 ?auto_179628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179634 - BLOCK
      ?auto_179635 - BLOCK
      ?auto_179636 - BLOCK
      ?auto_179637 - BLOCK
    )
    :vars
    (
      ?auto_179638 - BLOCK
      ?auto_179640 - BLOCK
      ?auto_179639 - BLOCK
      ?auto_179642 - BLOCK
      ?auto_179641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179638 ?auto_179637 ) ( ON-TABLE ?auto_179634 ) ( ON ?auto_179635 ?auto_179634 ) ( ON ?auto_179636 ?auto_179635 ) ( ON ?auto_179637 ?auto_179636 ) ( not ( = ?auto_179634 ?auto_179635 ) ) ( not ( = ?auto_179634 ?auto_179636 ) ) ( not ( = ?auto_179634 ?auto_179637 ) ) ( not ( = ?auto_179634 ?auto_179638 ) ) ( not ( = ?auto_179635 ?auto_179636 ) ) ( not ( = ?auto_179635 ?auto_179637 ) ) ( not ( = ?auto_179635 ?auto_179638 ) ) ( not ( = ?auto_179636 ?auto_179637 ) ) ( not ( = ?auto_179636 ?auto_179638 ) ) ( not ( = ?auto_179637 ?auto_179638 ) ) ( not ( = ?auto_179634 ?auto_179640 ) ) ( not ( = ?auto_179634 ?auto_179639 ) ) ( not ( = ?auto_179635 ?auto_179640 ) ) ( not ( = ?auto_179635 ?auto_179639 ) ) ( not ( = ?auto_179636 ?auto_179640 ) ) ( not ( = ?auto_179636 ?auto_179639 ) ) ( not ( = ?auto_179637 ?auto_179640 ) ) ( not ( = ?auto_179637 ?auto_179639 ) ) ( not ( = ?auto_179638 ?auto_179640 ) ) ( not ( = ?auto_179638 ?auto_179639 ) ) ( not ( = ?auto_179640 ?auto_179639 ) ) ( ON ?auto_179640 ?auto_179638 ) ( ON-TABLE ?auto_179642 ) ( not ( = ?auto_179642 ?auto_179641 ) ) ( not ( = ?auto_179642 ?auto_179639 ) ) ( not ( = ?auto_179641 ?auto_179639 ) ) ( not ( = ?auto_179634 ?auto_179641 ) ) ( not ( = ?auto_179634 ?auto_179642 ) ) ( not ( = ?auto_179635 ?auto_179641 ) ) ( not ( = ?auto_179635 ?auto_179642 ) ) ( not ( = ?auto_179636 ?auto_179641 ) ) ( not ( = ?auto_179636 ?auto_179642 ) ) ( not ( = ?auto_179637 ?auto_179641 ) ) ( not ( = ?auto_179637 ?auto_179642 ) ) ( not ( = ?auto_179638 ?auto_179641 ) ) ( not ( = ?auto_179638 ?auto_179642 ) ) ( not ( = ?auto_179640 ?auto_179641 ) ) ( not ( = ?auto_179640 ?auto_179642 ) ) ( ON ?auto_179639 ?auto_179640 ) ( CLEAR ?auto_179642 ) ( ON ?auto_179641 ?auto_179639 ) ( CLEAR ?auto_179641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179634 ?auto_179635 ?auto_179636 ?auto_179637 ?auto_179638 ?auto_179640 ?auto_179639 )
      ( MAKE-4PILE ?auto_179634 ?auto_179635 ?auto_179636 ?auto_179637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179643 - BLOCK
      ?auto_179644 - BLOCK
      ?auto_179645 - BLOCK
      ?auto_179646 - BLOCK
    )
    :vars
    (
      ?auto_179651 - BLOCK
      ?auto_179649 - BLOCK
      ?auto_179650 - BLOCK
      ?auto_179647 - BLOCK
      ?auto_179648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179651 ?auto_179646 ) ( ON-TABLE ?auto_179643 ) ( ON ?auto_179644 ?auto_179643 ) ( ON ?auto_179645 ?auto_179644 ) ( ON ?auto_179646 ?auto_179645 ) ( not ( = ?auto_179643 ?auto_179644 ) ) ( not ( = ?auto_179643 ?auto_179645 ) ) ( not ( = ?auto_179643 ?auto_179646 ) ) ( not ( = ?auto_179643 ?auto_179651 ) ) ( not ( = ?auto_179644 ?auto_179645 ) ) ( not ( = ?auto_179644 ?auto_179646 ) ) ( not ( = ?auto_179644 ?auto_179651 ) ) ( not ( = ?auto_179645 ?auto_179646 ) ) ( not ( = ?auto_179645 ?auto_179651 ) ) ( not ( = ?auto_179646 ?auto_179651 ) ) ( not ( = ?auto_179643 ?auto_179649 ) ) ( not ( = ?auto_179643 ?auto_179650 ) ) ( not ( = ?auto_179644 ?auto_179649 ) ) ( not ( = ?auto_179644 ?auto_179650 ) ) ( not ( = ?auto_179645 ?auto_179649 ) ) ( not ( = ?auto_179645 ?auto_179650 ) ) ( not ( = ?auto_179646 ?auto_179649 ) ) ( not ( = ?auto_179646 ?auto_179650 ) ) ( not ( = ?auto_179651 ?auto_179649 ) ) ( not ( = ?auto_179651 ?auto_179650 ) ) ( not ( = ?auto_179649 ?auto_179650 ) ) ( ON ?auto_179649 ?auto_179651 ) ( not ( = ?auto_179647 ?auto_179648 ) ) ( not ( = ?auto_179647 ?auto_179650 ) ) ( not ( = ?auto_179648 ?auto_179650 ) ) ( not ( = ?auto_179643 ?auto_179648 ) ) ( not ( = ?auto_179643 ?auto_179647 ) ) ( not ( = ?auto_179644 ?auto_179648 ) ) ( not ( = ?auto_179644 ?auto_179647 ) ) ( not ( = ?auto_179645 ?auto_179648 ) ) ( not ( = ?auto_179645 ?auto_179647 ) ) ( not ( = ?auto_179646 ?auto_179648 ) ) ( not ( = ?auto_179646 ?auto_179647 ) ) ( not ( = ?auto_179651 ?auto_179648 ) ) ( not ( = ?auto_179651 ?auto_179647 ) ) ( not ( = ?auto_179649 ?auto_179648 ) ) ( not ( = ?auto_179649 ?auto_179647 ) ) ( ON ?auto_179650 ?auto_179649 ) ( ON ?auto_179648 ?auto_179650 ) ( CLEAR ?auto_179648 ) ( HOLDING ?auto_179647 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179647 )
      ( MAKE-4PILE ?auto_179643 ?auto_179644 ?auto_179645 ?auto_179646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179652 - BLOCK
      ?auto_179653 - BLOCK
      ?auto_179654 - BLOCK
      ?auto_179655 - BLOCK
    )
    :vars
    (
      ?auto_179657 - BLOCK
      ?auto_179660 - BLOCK
      ?auto_179658 - BLOCK
      ?auto_179659 - BLOCK
      ?auto_179656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179657 ?auto_179655 ) ( ON-TABLE ?auto_179652 ) ( ON ?auto_179653 ?auto_179652 ) ( ON ?auto_179654 ?auto_179653 ) ( ON ?auto_179655 ?auto_179654 ) ( not ( = ?auto_179652 ?auto_179653 ) ) ( not ( = ?auto_179652 ?auto_179654 ) ) ( not ( = ?auto_179652 ?auto_179655 ) ) ( not ( = ?auto_179652 ?auto_179657 ) ) ( not ( = ?auto_179653 ?auto_179654 ) ) ( not ( = ?auto_179653 ?auto_179655 ) ) ( not ( = ?auto_179653 ?auto_179657 ) ) ( not ( = ?auto_179654 ?auto_179655 ) ) ( not ( = ?auto_179654 ?auto_179657 ) ) ( not ( = ?auto_179655 ?auto_179657 ) ) ( not ( = ?auto_179652 ?auto_179660 ) ) ( not ( = ?auto_179652 ?auto_179658 ) ) ( not ( = ?auto_179653 ?auto_179660 ) ) ( not ( = ?auto_179653 ?auto_179658 ) ) ( not ( = ?auto_179654 ?auto_179660 ) ) ( not ( = ?auto_179654 ?auto_179658 ) ) ( not ( = ?auto_179655 ?auto_179660 ) ) ( not ( = ?auto_179655 ?auto_179658 ) ) ( not ( = ?auto_179657 ?auto_179660 ) ) ( not ( = ?auto_179657 ?auto_179658 ) ) ( not ( = ?auto_179660 ?auto_179658 ) ) ( ON ?auto_179660 ?auto_179657 ) ( not ( = ?auto_179659 ?auto_179656 ) ) ( not ( = ?auto_179659 ?auto_179658 ) ) ( not ( = ?auto_179656 ?auto_179658 ) ) ( not ( = ?auto_179652 ?auto_179656 ) ) ( not ( = ?auto_179652 ?auto_179659 ) ) ( not ( = ?auto_179653 ?auto_179656 ) ) ( not ( = ?auto_179653 ?auto_179659 ) ) ( not ( = ?auto_179654 ?auto_179656 ) ) ( not ( = ?auto_179654 ?auto_179659 ) ) ( not ( = ?auto_179655 ?auto_179656 ) ) ( not ( = ?auto_179655 ?auto_179659 ) ) ( not ( = ?auto_179657 ?auto_179656 ) ) ( not ( = ?auto_179657 ?auto_179659 ) ) ( not ( = ?auto_179660 ?auto_179656 ) ) ( not ( = ?auto_179660 ?auto_179659 ) ) ( ON ?auto_179658 ?auto_179660 ) ( ON ?auto_179656 ?auto_179658 ) ( ON ?auto_179659 ?auto_179656 ) ( CLEAR ?auto_179659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179652 ?auto_179653 ?auto_179654 ?auto_179655 ?auto_179657 ?auto_179660 ?auto_179658 ?auto_179656 )
      ( MAKE-4PILE ?auto_179652 ?auto_179653 ?auto_179654 ?auto_179655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179666 - BLOCK
      ?auto_179667 - BLOCK
      ?auto_179668 - BLOCK
      ?auto_179669 - BLOCK
      ?auto_179670 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_179670 ) ( CLEAR ?auto_179669 ) ( ON-TABLE ?auto_179666 ) ( ON ?auto_179667 ?auto_179666 ) ( ON ?auto_179668 ?auto_179667 ) ( ON ?auto_179669 ?auto_179668 ) ( not ( = ?auto_179666 ?auto_179667 ) ) ( not ( = ?auto_179666 ?auto_179668 ) ) ( not ( = ?auto_179666 ?auto_179669 ) ) ( not ( = ?auto_179666 ?auto_179670 ) ) ( not ( = ?auto_179667 ?auto_179668 ) ) ( not ( = ?auto_179667 ?auto_179669 ) ) ( not ( = ?auto_179667 ?auto_179670 ) ) ( not ( = ?auto_179668 ?auto_179669 ) ) ( not ( = ?auto_179668 ?auto_179670 ) ) ( not ( = ?auto_179669 ?auto_179670 ) ) )
    :subtasks
    ( ( !STACK ?auto_179670 ?auto_179669 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179671 - BLOCK
      ?auto_179672 - BLOCK
      ?auto_179673 - BLOCK
      ?auto_179674 - BLOCK
      ?auto_179675 - BLOCK
    )
    :vars
    (
      ?auto_179676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_179674 ) ( ON-TABLE ?auto_179671 ) ( ON ?auto_179672 ?auto_179671 ) ( ON ?auto_179673 ?auto_179672 ) ( ON ?auto_179674 ?auto_179673 ) ( not ( = ?auto_179671 ?auto_179672 ) ) ( not ( = ?auto_179671 ?auto_179673 ) ) ( not ( = ?auto_179671 ?auto_179674 ) ) ( not ( = ?auto_179671 ?auto_179675 ) ) ( not ( = ?auto_179672 ?auto_179673 ) ) ( not ( = ?auto_179672 ?auto_179674 ) ) ( not ( = ?auto_179672 ?auto_179675 ) ) ( not ( = ?auto_179673 ?auto_179674 ) ) ( not ( = ?auto_179673 ?auto_179675 ) ) ( not ( = ?auto_179674 ?auto_179675 ) ) ( ON ?auto_179675 ?auto_179676 ) ( CLEAR ?auto_179675 ) ( HAND-EMPTY ) ( not ( = ?auto_179671 ?auto_179676 ) ) ( not ( = ?auto_179672 ?auto_179676 ) ) ( not ( = ?auto_179673 ?auto_179676 ) ) ( not ( = ?auto_179674 ?auto_179676 ) ) ( not ( = ?auto_179675 ?auto_179676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179675 ?auto_179676 )
      ( MAKE-5PILE ?auto_179671 ?auto_179672 ?auto_179673 ?auto_179674 ?auto_179675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179677 - BLOCK
      ?auto_179678 - BLOCK
      ?auto_179679 - BLOCK
      ?auto_179680 - BLOCK
      ?auto_179681 - BLOCK
    )
    :vars
    (
      ?auto_179682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179677 ) ( ON ?auto_179678 ?auto_179677 ) ( ON ?auto_179679 ?auto_179678 ) ( not ( = ?auto_179677 ?auto_179678 ) ) ( not ( = ?auto_179677 ?auto_179679 ) ) ( not ( = ?auto_179677 ?auto_179680 ) ) ( not ( = ?auto_179677 ?auto_179681 ) ) ( not ( = ?auto_179678 ?auto_179679 ) ) ( not ( = ?auto_179678 ?auto_179680 ) ) ( not ( = ?auto_179678 ?auto_179681 ) ) ( not ( = ?auto_179679 ?auto_179680 ) ) ( not ( = ?auto_179679 ?auto_179681 ) ) ( not ( = ?auto_179680 ?auto_179681 ) ) ( ON ?auto_179681 ?auto_179682 ) ( CLEAR ?auto_179681 ) ( not ( = ?auto_179677 ?auto_179682 ) ) ( not ( = ?auto_179678 ?auto_179682 ) ) ( not ( = ?auto_179679 ?auto_179682 ) ) ( not ( = ?auto_179680 ?auto_179682 ) ) ( not ( = ?auto_179681 ?auto_179682 ) ) ( HOLDING ?auto_179680 ) ( CLEAR ?auto_179679 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179677 ?auto_179678 ?auto_179679 ?auto_179680 )
      ( MAKE-5PILE ?auto_179677 ?auto_179678 ?auto_179679 ?auto_179680 ?auto_179681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179683 - BLOCK
      ?auto_179684 - BLOCK
      ?auto_179685 - BLOCK
      ?auto_179686 - BLOCK
      ?auto_179687 - BLOCK
    )
    :vars
    (
      ?auto_179688 - BLOCK
      ?auto_179689 - BLOCK
      ?auto_179691 - BLOCK
      ?auto_179690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179683 ) ( ON ?auto_179684 ?auto_179683 ) ( ON ?auto_179685 ?auto_179684 ) ( not ( = ?auto_179683 ?auto_179684 ) ) ( not ( = ?auto_179683 ?auto_179685 ) ) ( not ( = ?auto_179683 ?auto_179686 ) ) ( not ( = ?auto_179683 ?auto_179687 ) ) ( not ( = ?auto_179684 ?auto_179685 ) ) ( not ( = ?auto_179684 ?auto_179686 ) ) ( not ( = ?auto_179684 ?auto_179687 ) ) ( not ( = ?auto_179685 ?auto_179686 ) ) ( not ( = ?auto_179685 ?auto_179687 ) ) ( not ( = ?auto_179686 ?auto_179687 ) ) ( ON ?auto_179687 ?auto_179688 ) ( not ( = ?auto_179683 ?auto_179688 ) ) ( not ( = ?auto_179684 ?auto_179688 ) ) ( not ( = ?auto_179685 ?auto_179688 ) ) ( not ( = ?auto_179686 ?auto_179688 ) ) ( not ( = ?auto_179687 ?auto_179688 ) ) ( CLEAR ?auto_179685 ) ( ON ?auto_179686 ?auto_179687 ) ( CLEAR ?auto_179686 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179689 ) ( ON ?auto_179691 ?auto_179689 ) ( ON ?auto_179690 ?auto_179691 ) ( ON ?auto_179688 ?auto_179690 ) ( not ( = ?auto_179689 ?auto_179691 ) ) ( not ( = ?auto_179689 ?auto_179690 ) ) ( not ( = ?auto_179689 ?auto_179688 ) ) ( not ( = ?auto_179689 ?auto_179687 ) ) ( not ( = ?auto_179689 ?auto_179686 ) ) ( not ( = ?auto_179691 ?auto_179690 ) ) ( not ( = ?auto_179691 ?auto_179688 ) ) ( not ( = ?auto_179691 ?auto_179687 ) ) ( not ( = ?auto_179691 ?auto_179686 ) ) ( not ( = ?auto_179690 ?auto_179688 ) ) ( not ( = ?auto_179690 ?auto_179687 ) ) ( not ( = ?auto_179690 ?auto_179686 ) ) ( not ( = ?auto_179683 ?auto_179689 ) ) ( not ( = ?auto_179683 ?auto_179691 ) ) ( not ( = ?auto_179683 ?auto_179690 ) ) ( not ( = ?auto_179684 ?auto_179689 ) ) ( not ( = ?auto_179684 ?auto_179691 ) ) ( not ( = ?auto_179684 ?auto_179690 ) ) ( not ( = ?auto_179685 ?auto_179689 ) ) ( not ( = ?auto_179685 ?auto_179691 ) ) ( not ( = ?auto_179685 ?auto_179690 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179689 ?auto_179691 ?auto_179690 ?auto_179688 ?auto_179687 )
      ( MAKE-5PILE ?auto_179683 ?auto_179684 ?auto_179685 ?auto_179686 ?auto_179687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179692 - BLOCK
      ?auto_179693 - BLOCK
      ?auto_179694 - BLOCK
      ?auto_179695 - BLOCK
      ?auto_179696 - BLOCK
    )
    :vars
    (
      ?auto_179699 - BLOCK
      ?auto_179700 - BLOCK
      ?auto_179697 - BLOCK
      ?auto_179698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179692 ) ( ON ?auto_179693 ?auto_179692 ) ( not ( = ?auto_179692 ?auto_179693 ) ) ( not ( = ?auto_179692 ?auto_179694 ) ) ( not ( = ?auto_179692 ?auto_179695 ) ) ( not ( = ?auto_179692 ?auto_179696 ) ) ( not ( = ?auto_179693 ?auto_179694 ) ) ( not ( = ?auto_179693 ?auto_179695 ) ) ( not ( = ?auto_179693 ?auto_179696 ) ) ( not ( = ?auto_179694 ?auto_179695 ) ) ( not ( = ?auto_179694 ?auto_179696 ) ) ( not ( = ?auto_179695 ?auto_179696 ) ) ( ON ?auto_179696 ?auto_179699 ) ( not ( = ?auto_179692 ?auto_179699 ) ) ( not ( = ?auto_179693 ?auto_179699 ) ) ( not ( = ?auto_179694 ?auto_179699 ) ) ( not ( = ?auto_179695 ?auto_179699 ) ) ( not ( = ?auto_179696 ?auto_179699 ) ) ( ON ?auto_179695 ?auto_179696 ) ( CLEAR ?auto_179695 ) ( ON-TABLE ?auto_179700 ) ( ON ?auto_179697 ?auto_179700 ) ( ON ?auto_179698 ?auto_179697 ) ( ON ?auto_179699 ?auto_179698 ) ( not ( = ?auto_179700 ?auto_179697 ) ) ( not ( = ?auto_179700 ?auto_179698 ) ) ( not ( = ?auto_179700 ?auto_179699 ) ) ( not ( = ?auto_179700 ?auto_179696 ) ) ( not ( = ?auto_179700 ?auto_179695 ) ) ( not ( = ?auto_179697 ?auto_179698 ) ) ( not ( = ?auto_179697 ?auto_179699 ) ) ( not ( = ?auto_179697 ?auto_179696 ) ) ( not ( = ?auto_179697 ?auto_179695 ) ) ( not ( = ?auto_179698 ?auto_179699 ) ) ( not ( = ?auto_179698 ?auto_179696 ) ) ( not ( = ?auto_179698 ?auto_179695 ) ) ( not ( = ?auto_179692 ?auto_179700 ) ) ( not ( = ?auto_179692 ?auto_179697 ) ) ( not ( = ?auto_179692 ?auto_179698 ) ) ( not ( = ?auto_179693 ?auto_179700 ) ) ( not ( = ?auto_179693 ?auto_179697 ) ) ( not ( = ?auto_179693 ?auto_179698 ) ) ( not ( = ?auto_179694 ?auto_179700 ) ) ( not ( = ?auto_179694 ?auto_179697 ) ) ( not ( = ?auto_179694 ?auto_179698 ) ) ( HOLDING ?auto_179694 ) ( CLEAR ?auto_179693 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179692 ?auto_179693 ?auto_179694 )
      ( MAKE-5PILE ?auto_179692 ?auto_179693 ?auto_179694 ?auto_179695 ?auto_179696 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179701 - BLOCK
      ?auto_179702 - BLOCK
      ?auto_179703 - BLOCK
      ?auto_179704 - BLOCK
      ?auto_179705 - BLOCK
    )
    :vars
    (
      ?auto_179708 - BLOCK
      ?auto_179709 - BLOCK
      ?auto_179706 - BLOCK
      ?auto_179707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179701 ) ( ON ?auto_179702 ?auto_179701 ) ( not ( = ?auto_179701 ?auto_179702 ) ) ( not ( = ?auto_179701 ?auto_179703 ) ) ( not ( = ?auto_179701 ?auto_179704 ) ) ( not ( = ?auto_179701 ?auto_179705 ) ) ( not ( = ?auto_179702 ?auto_179703 ) ) ( not ( = ?auto_179702 ?auto_179704 ) ) ( not ( = ?auto_179702 ?auto_179705 ) ) ( not ( = ?auto_179703 ?auto_179704 ) ) ( not ( = ?auto_179703 ?auto_179705 ) ) ( not ( = ?auto_179704 ?auto_179705 ) ) ( ON ?auto_179705 ?auto_179708 ) ( not ( = ?auto_179701 ?auto_179708 ) ) ( not ( = ?auto_179702 ?auto_179708 ) ) ( not ( = ?auto_179703 ?auto_179708 ) ) ( not ( = ?auto_179704 ?auto_179708 ) ) ( not ( = ?auto_179705 ?auto_179708 ) ) ( ON ?auto_179704 ?auto_179705 ) ( ON-TABLE ?auto_179709 ) ( ON ?auto_179706 ?auto_179709 ) ( ON ?auto_179707 ?auto_179706 ) ( ON ?auto_179708 ?auto_179707 ) ( not ( = ?auto_179709 ?auto_179706 ) ) ( not ( = ?auto_179709 ?auto_179707 ) ) ( not ( = ?auto_179709 ?auto_179708 ) ) ( not ( = ?auto_179709 ?auto_179705 ) ) ( not ( = ?auto_179709 ?auto_179704 ) ) ( not ( = ?auto_179706 ?auto_179707 ) ) ( not ( = ?auto_179706 ?auto_179708 ) ) ( not ( = ?auto_179706 ?auto_179705 ) ) ( not ( = ?auto_179706 ?auto_179704 ) ) ( not ( = ?auto_179707 ?auto_179708 ) ) ( not ( = ?auto_179707 ?auto_179705 ) ) ( not ( = ?auto_179707 ?auto_179704 ) ) ( not ( = ?auto_179701 ?auto_179709 ) ) ( not ( = ?auto_179701 ?auto_179706 ) ) ( not ( = ?auto_179701 ?auto_179707 ) ) ( not ( = ?auto_179702 ?auto_179709 ) ) ( not ( = ?auto_179702 ?auto_179706 ) ) ( not ( = ?auto_179702 ?auto_179707 ) ) ( not ( = ?auto_179703 ?auto_179709 ) ) ( not ( = ?auto_179703 ?auto_179706 ) ) ( not ( = ?auto_179703 ?auto_179707 ) ) ( CLEAR ?auto_179702 ) ( ON ?auto_179703 ?auto_179704 ) ( CLEAR ?auto_179703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179709 ?auto_179706 ?auto_179707 ?auto_179708 ?auto_179705 ?auto_179704 )
      ( MAKE-5PILE ?auto_179701 ?auto_179702 ?auto_179703 ?auto_179704 ?auto_179705 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179710 - BLOCK
      ?auto_179711 - BLOCK
      ?auto_179712 - BLOCK
      ?auto_179713 - BLOCK
      ?auto_179714 - BLOCK
    )
    :vars
    (
      ?auto_179717 - BLOCK
      ?auto_179715 - BLOCK
      ?auto_179716 - BLOCK
      ?auto_179718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179710 ) ( not ( = ?auto_179710 ?auto_179711 ) ) ( not ( = ?auto_179710 ?auto_179712 ) ) ( not ( = ?auto_179710 ?auto_179713 ) ) ( not ( = ?auto_179710 ?auto_179714 ) ) ( not ( = ?auto_179711 ?auto_179712 ) ) ( not ( = ?auto_179711 ?auto_179713 ) ) ( not ( = ?auto_179711 ?auto_179714 ) ) ( not ( = ?auto_179712 ?auto_179713 ) ) ( not ( = ?auto_179712 ?auto_179714 ) ) ( not ( = ?auto_179713 ?auto_179714 ) ) ( ON ?auto_179714 ?auto_179717 ) ( not ( = ?auto_179710 ?auto_179717 ) ) ( not ( = ?auto_179711 ?auto_179717 ) ) ( not ( = ?auto_179712 ?auto_179717 ) ) ( not ( = ?auto_179713 ?auto_179717 ) ) ( not ( = ?auto_179714 ?auto_179717 ) ) ( ON ?auto_179713 ?auto_179714 ) ( ON-TABLE ?auto_179715 ) ( ON ?auto_179716 ?auto_179715 ) ( ON ?auto_179718 ?auto_179716 ) ( ON ?auto_179717 ?auto_179718 ) ( not ( = ?auto_179715 ?auto_179716 ) ) ( not ( = ?auto_179715 ?auto_179718 ) ) ( not ( = ?auto_179715 ?auto_179717 ) ) ( not ( = ?auto_179715 ?auto_179714 ) ) ( not ( = ?auto_179715 ?auto_179713 ) ) ( not ( = ?auto_179716 ?auto_179718 ) ) ( not ( = ?auto_179716 ?auto_179717 ) ) ( not ( = ?auto_179716 ?auto_179714 ) ) ( not ( = ?auto_179716 ?auto_179713 ) ) ( not ( = ?auto_179718 ?auto_179717 ) ) ( not ( = ?auto_179718 ?auto_179714 ) ) ( not ( = ?auto_179718 ?auto_179713 ) ) ( not ( = ?auto_179710 ?auto_179715 ) ) ( not ( = ?auto_179710 ?auto_179716 ) ) ( not ( = ?auto_179710 ?auto_179718 ) ) ( not ( = ?auto_179711 ?auto_179715 ) ) ( not ( = ?auto_179711 ?auto_179716 ) ) ( not ( = ?auto_179711 ?auto_179718 ) ) ( not ( = ?auto_179712 ?auto_179715 ) ) ( not ( = ?auto_179712 ?auto_179716 ) ) ( not ( = ?auto_179712 ?auto_179718 ) ) ( ON ?auto_179712 ?auto_179713 ) ( CLEAR ?auto_179712 ) ( HOLDING ?auto_179711 ) ( CLEAR ?auto_179710 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179710 ?auto_179711 )
      ( MAKE-5PILE ?auto_179710 ?auto_179711 ?auto_179712 ?auto_179713 ?auto_179714 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179719 - BLOCK
      ?auto_179720 - BLOCK
      ?auto_179721 - BLOCK
      ?auto_179722 - BLOCK
      ?auto_179723 - BLOCK
    )
    :vars
    (
      ?auto_179724 - BLOCK
      ?auto_179725 - BLOCK
      ?auto_179726 - BLOCK
      ?auto_179727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179719 ) ( not ( = ?auto_179719 ?auto_179720 ) ) ( not ( = ?auto_179719 ?auto_179721 ) ) ( not ( = ?auto_179719 ?auto_179722 ) ) ( not ( = ?auto_179719 ?auto_179723 ) ) ( not ( = ?auto_179720 ?auto_179721 ) ) ( not ( = ?auto_179720 ?auto_179722 ) ) ( not ( = ?auto_179720 ?auto_179723 ) ) ( not ( = ?auto_179721 ?auto_179722 ) ) ( not ( = ?auto_179721 ?auto_179723 ) ) ( not ( = ?auto_179722 ?auto_179723 ) ) ( ON ?auto_179723 ?auto_179724 ) ( not ( = ?auto_179719 ?auto_179724 ) ) ( not ( = ?auto_179720 ?auto_179724 ) ) ( not ( = ?auto_179721 ?auto_179724 ) ) ( not ( = ?auto_179722 ?auto_179724 ) ) ( not ( = ?auto_179723 ?auto_179724 ) ) ( ON ?auto_179722 ?auto_179723 ) ( ON-TABLE ?auto_179725 ) ( ON ?auto_179726 ?auto_179725 ) ( ON ?auto_179727 ?auto_179726 ) ( ON ?auto_179724 ?auto_179727 ) ( not ( = ?auto_179725 ?auto_179726 ) ) ( not ( = ?auto_179725 ?auto_179727 ) ) ( not ( = ?auto_179725 ?auto_179724 ) ) ( not ( = ?auto_179725 ?auto_179723 ) ) ( not ( = ?auto_179725 ?auto_179722 ) ) ( not ( = ?auto_179726 ?auto_179727 ) ) ( not ( = ?auto_179726 ?auto_179724 ) ) ( not ( = ?auto_179726 ?auto_179723 ) ) ( not ( = ?auto_179726 ?auto_179722 ) ) ( not ( = ?auto_179727 ?auto_179724 ) ) ( not ( = ?auto_179727 ?auto_179723 ) ) ( not ( = ?auto_179727 ?auto_179722 ) ) ( not ( = ?auto_179719 ?auto_179725 ) ) ( not ( = ?auto_179719 ?auto_179726 ) ) ( not ( = ?auto_179719 ?auto_179727 ) ) ( not ( = ?auto_179720 ?auto_179725 ) ) ( not ( = ?auto_179720 ?auto_179726 ) ) ( not ( = ?auto_179720 ?auto_179727 ) ) ( not ( = ?auto_179721 ?auto_179725 ) ) ( not ( = ?auto_179721 ?auto_179726 ) ) ( not ( = ?auto_179721 ?auto_179727 ) ) ( ON ?auto_179721 ?auto_179722 ) ( CLEAR ?auto_179719 ) ( ON ?auto_179720 ?auto_179721 ) ( CLEAR ?auto_179720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179725 ?auto_179726 ?auto_179727 ?auto_179724 ?auto_179723 ?auto_179722 ?auto_179721 )
      ( MAKE-5PILE ?auto_179719 ?auto_179720 ?auto_179721 ?auto_179722 ?auto_179723 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179728 - BLOCK
      ?auto_179729 - BLOCK
      ?auto_179730 - BLOCK
      ?auto_179731 - BLOCK
      ?auto_179732 - BLOCK
    )
    :vars
    (
      ?auto_179736 - BLOCK
      ?auto_179733 - BLOCK
      ?auto_179735 - BLOCK
      ?auto_179734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179728 ?auto_179729 ) ) ( not ( = ?auto_179728 ?auto_179730 ) ) ( not ( = ?auto_179728 ?auto_179731 ) ) ( not ( = ?auto_179728 ?auto_179732 ) ) ( not ( = ?auto_179729 ?auto_179730 ) ) ( not ( = ?auto_179729 ?auto_179731 ) ) ( not ( = ?auto_179729 ?auto_179732 ) ) ( not ( = ?auto_179730 ?auto_179731 ) ) ( not ( = ?auto_179730 ?auto_179732 ) ) ( not ( = ?auto_179731 ?auto_179732 ) ) ( ON ?auto_179732 ?auto_179736 ) ( not ( = ?auto_179728 ?auto_179736 ) ) ( not ( = ?auto_179729 ?auto_179736 ) ) ( not ( = ?auto_179730 ?auto_179736 ) ) ( not ( = ?auto_179731 ?auto_179736 ) ) ( not ( = ?auto_179732 ?auto_179736 ) ) ( ON ?auto_179731 ?auto_179732 ) ( ON-TABLE ?auto_179733 ) ( ON ?auto_179735 ?auto_179733 ) ( ON ?auto_179734 ?auto_179735 ) ( ON ?auto_179736 ?auto_179734 ) ( not ( = ?auto_179733 ?auto_179735 ) ) ( not ( = ?auto_179733 ?auto_179734 ) ) ( not ( = ?auto_179733 ?auto_179736 ) ) ( not ( = ?auto_179733 ?auto_179732 ) ) ( not ( = ?auto_179733 ?auto_179731 ) ) ( not ( = ?auto_179735 ?auto_179734 ) ) ( not ( = ?auto_179735 ?auto_179736 ) ) ( not ( = ?auto_179735 ?auto_179732 ) ) ( not ( = ?auto_179735 ?auto_179731 ) ) ( not ( = ?auto_179734 ?auto_179736 ) ) ( not ( = ?auto_179734 ?auto_179732 ) ) ( not ( = ?auto_179734 ?auto_179731 ) ) ( not ( = ?auto_179728 ?auto_179733 ) ) ( not ( = ?auto_179728 ?auto_179735 ) ) ( not ( = ?auto_179728 ?auto_179734 ) ) ( not ( = ?auto_179729 ?auto_179733 ) ) ( not ( = ?auto_179729 ?auto_179735 ) ) ( not ( = ?auto_179729 ?auto_179734 ) ) ( not ( = ?auto_179730 ?auto_179733 ) ) ( not ( = ?auto_179730 ?auto_179735 ) ) ( not ( = ?auto_179730 ?auto_179734 ) ) ( ON ?auto_179730 ?auto_179731 ) ( ON ?auto_179729 ?auto_179730 ) ( CLEAR ?auto_179729 ) ( HOLDING ?auto_179728 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179728 )
      ( MAKE-5PILE ?auto_179728 ?auto_179729 ?auto_179730 ?auto_179731 ?auto_179732 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179737 - BLOCK
      ?auto_179738 - BLOCK
      ?auto_179739 - BLOCK
      ?auto_179740 - BLOCK
      ?auto_179741 - BLOCK
    )
    :vars
    (
      ?auto_179743 - BLOCK
      ?auto_179745 - BLOCK
      ?auto_179744 - BLOCK
      ?auto_179742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179737 ?auto_179738 ) ) ( not ( = ?auto_179737 ?auto_179739 ) ) ( not ( = ?auto_179737 ?auto_179740 ) ) ( not ( = ?auto_179737 ?auto_179741 ) ) ( not ( = ?auto_179738 ?auto_179739 ) ) ( not ( = ?auto_179738 ?auto_179740 ) ) ( not ( = ?auto_179738 ?auto_179741 ) ) ( not ( = ?auto_179739 ?auto_179740 ) ) ( not ( = ?auto_179739 ?auto_179741 ) ) ( not ( = ?auto_179740 ?auto_179741 ) ) ( ON ?auto_179741 ?auto_179743 ) ( not ( = ?auto_179737 ?auto_179743 ) ) ( not ( = ?auto_179738 ?auto_179743 ) ) ( not ( = ?auto_179739 ?auto_179743 ) ) ( not ( = ?auto_179740 ?auto_179743 ) ) ( not ( = ?auto_179741 ?auto_179743 ) ) ( ON ?auto_179740 ?auto_179741 ) ( ON-TABLE ?auto_179745 ) ( ON ?auto_179744 ?auto_179745 ) ( ON ?auto_179742 ?auto_179744 ) ( ON ?auto_179743 ?auto_179742 ) ( not ( = ?auto_179745 ?auto_179744 ) ) ( not ( = ?auto_179745 ?auto_179742 ) ) ( not ( = ?auto_179745 ?auto_179743 ) ) ( not ( = ?auto_179745 ?auto_179741 ) ) ( not ( = ?auto_179745 ?auto_179740 ) ) ( not ( = ?auto_179744 ?auto_179742 ) ) ( not ( = ?auto_179744 ?auto_179743 ) ) ( not ( = ?auto_179744 ?auto_179741 ) ) ( not ( = ?auto_179744 ?auto_179740 ) ) ( not ( = ?auto_179742 ?auto_179743 ) ) ( not ( = ?auto_179742 ?auto_179741 ) ) ( not ( = ?auto_179742 ?auto_179740 ) ) ( not ( = ?auto_179737 ?auto_179745 ) ) ( not ( = ?auto_179737 ?auto_179744 ) ) ( not ( = ?auto_179737 ?auto_179742 ) ) ( not ( = ?auto_179738 ?auto_179745 ) ) ( not ( = ?auto_179738 ?auto_179744 ) ) ( not ( = ?auto_179738 ?auto_179742 ) ) ( not ( = ?auto_179739 ?auto_179745 ) ) ( not ( = ?auto_179739 ?auto_179744 ) ) ( not ( = ?auto_179739 ?auto_179742 ) ) ( ON ?auto_179739 ?auto_179740 ) ( ON ?auto_179738 ?auto_179739 ) ( ON ?auto_179737 ?auto_179738 ) ( CLEAR ?auto_179737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179745 ?auto_179744 ?auto_179742 ?auto_179743 ?auto_179741 ?auto_179740 ?auto_179739 ?auto_179738 )
      ( MAKE-5PILE ?auto_179737 ?auto_179738 ?auto_179739 ?auto_179740 ?auto_179741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179749 - BLOCK
      ?auto_179750 - BLOCK
      ?auto_179751 - BLOCK
    )
    :vars
    (
      ?auto_179752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179752 ?auto_179751 ) ( CLEAR ?auto_179752 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179749 ) ( ON ?auto_179750 ?auto_179749 ) ( ON ?auto_179751 ?auto_179750 ) ( not ( = ?auto_179749 ?auto_179750 ) ) ( not ( = ?auto_179749 ?auto_179751 ) ) ( not ( = ?auto_179749 ?auto_179752 ) ) ( not ( = ?auto_179750 ?auto_179751 ) ) ( not ( = ?auto_179750 ?auto_179752 ) ) ( not ( = ?auto_179751 ?auto_179752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179752 ?auto_179751 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179753 - BLOCK
      ?auto_179754 - BLOCK
      ?auto_179755 - BLOCK
    )
    :vars
    (
      ?auto_179756 - BLOCK
      ?auto_179757 - BLOCK
      ?auto_179758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179756 ?auto_179755 ) ( CLEAR ?auto_179756 ) ( ON-TABLE ?auto_179753 ) ( ON ?auto_179754 ?auto_179753 ) ( ON ?auto_179755 ?auto_179754 ) ( not ( = ?auto_179753 ?auto_179754 ) ) ( not ( = ?auto_179753 ?auto_179755 ) ) ( not ( = ?auto_179753 ?auto_179756 ) ) ( not ( = ?auto_179754 ?auto_179755 ) ) ( not ( = ?auto_179754 ?auto_179756 ) ) ( not ( = ?auto_179755 ?auto_179756 ) ) ( HOLDING ?auto_179757 ) ( CLEAR ?auto_179758 ) ( not ( = ?auto_179753 ?auto_179757 ) ) ( not ( = ?auto_179753 ?auto_179758 ) ) ( not ( = ?auto_179754 ?auto_179757 ) ) ( not ( = ?auto_179754 ?auto_179758 ) ) ( not ( = ?auto_179755 ?auto_179757 ) ) ( not ( = ?auto_179755 ?auto_179758 ) ) ( not ( = ?auto_179756 ?auto_179757 ) ) ( not ( = ?auto_179756 ?auto_179758 ) ) ( not ( = ?auto_179757 ?auto_179758 ) ) )
    :subtasks
    ( ( !STACK ?auto_179757 ?auto_179758 )
      ( MAKE-3PILE ?auto_179753 ?auto_179754 ?auto_179755 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179759 - BLOCK
      ?auto_179760 - BLOCK
      ?auto_179761 - BLOCK
    )
    :vars
    (
      ?auto_179763 - BLOCK
      ?auto_179764 - BLOCK
      ?auto_179762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179763 ?auto_179761 ) ( ON-TABLE ?auto_179759 ) ( ON ?auto_179760 ?auto_179759 ) ( ON ?auto_179761 ?auto_179760 ) ( not ( = ?auto_179759 ?auto_179760 ) ) ( not ( = ?auto_179759 ?auto_179761 ) ) ( not ( = ?auto_179759 ?auto_179763 ) ) ( not ( = ?auto_179760 ?auto_179761 ) ) ( not ( = ?auto_179760 ?auto_179763 ) ) ( not ( = ?auto_179761 ?auto_179763 ) ) ( CLEAR ?auto_179764 ) ( not ( = ?auto_179759 ?auto_179762 ) ) ( not ( = ?auto_179759 ?auto_179764 ) ) ( not ( = ?auto_179760 ?auto_179762 ) ) ( not ( = ?auto_179760 ?auto_179764 ) ) ( not ( = ?auto_179761 ?auto_179762 ) ) ( not ( = ?auto_179761 ?auto_179764 ) ) ( not ( = ?auto_179763 ?auto_179762 ) ) ( not ( = ?auto_179763 ?auto_179764 ) ) ( not ( = ?auto_179762 ?auto_179764 ) ) ( ON ?auto_179762 ?auto_179763 ) ( CLEAR ?auto_179762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179759 ?auto_179760 ?auto_179761 ?auto_179763 )
      ( MAKE-3PILE ?auto_179759 ?auto_179760 ?auto_179761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179765 - BLOCK
      ?auto_179766 - BLOCK
      ?auto_179767 - BLOCK
    )
    :vars
    (
      ?auto_179770 - BLOCK
      ?auto_179769 - BLOCK
      ?auto_179768 - BLOCK
      ?auto_179771 - BLOCK
      ?auto_179773 - BLOCK
      ?auto_179772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179770 ?auto_179767 ) ( ON-TABLE ?auto_179765 ) ( ON ?auto_179766 ?auto_179765 ) ( ON ?auto_179767 ?auto_179766 ) ( not ( = ?auto_179765 ?auto_179766 ) ) ( not ( = ?auto_179765 ?auto_179767 ) ) ( not ( = ?auto_179765 ?auto_179770 ) ) ( not ( = ?auto_179766 ?auto_179767 ) ) ( not ( = ?auto_179766 ?auto_179770 ) ) ( not ( = ?auto_179767 ?auto_179770 ) ) ( not ( = ?auto_179765 ?auto_179769 ) ) ( not ( = ?auto_179765 ?auto_179768 ) ) ( not ( = ?auto_179766 ?auto_179769 ) ) ( not ( = ?auto_179766 ?auto_179768 ) ) ( not ( = ?auto_179767 ?auto_179769 ) ) ( not ( = ?auto_179767 ?auto_179768 ) ) ( not ( = ?auto_179770 ?auto_179769 ) ) ( not ( = ?auto_179770 ?auto_179768 ) ) ( not ( = ?auto_179769 ?auto_179768 ) ) ( ON ?auto_179769 ?auto_179770 ) ( CLEAR ?auto_179769 ) ( HOLDING ?auto_179768 ) ( CLEAR ?auto_179771 ) ( ON-TABLE ?auto_179773 ) ( ON ?auto_179772 ?auto_179773 ) ( ON ?auto_179771 ?auto_179772 ) ( not ( = ?auto_179773 ?auto_179772 ) ) ( not ( = ?auto_179773 ?auto_179771 ) ) ( not ( = ?auto_179773 ?auto_179768 ) ) ( not ( = ?auto_179772 ?auto_179771 ) ) ( not ( = ?auto_179772 ?auto_179768 ) ) ( not ( = ?auto_179771 ?auto_179768 ) ) ( not ( = ?auto_179765 ?auto_179771 ) ) ( not ( = ?auto_179765 ?auto_179773 ) ) ( not ( = ?auto_179765 ?auto_179772 ) ) ( not ( = ?auto_179766 ?auto_179771 ) ) ( not ( = ?auto_179766 ?auto_179773 ) ) ( not ( = ?auto_179766 ?auto_179772 ) ) ( not ( = ?auto_179767 ?auto_179771 ) ) ( not ( = ?auto_179767 ?auto_179773 ) ) ( not ( = ?auto_179767 ?auto_179772 ) ) ( not ( = ?auto_179770 ?auto_179771 ) ) ( not ( = ?auto_179770 ?auto_179773 ) ) ( not ( = ?auto_179770 ?auto_179772 ) ) ( not ( = ?auto_179769 ?auto_179771 ) ) ( not ( = ?auto_179769 ?auto_179773 ) ) ( not ( = ?auto_179769 ?auto_179772 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179773 ?auto_179772 ?auto_179771 ?auto_179768 )
      ( MAKE-3PILE ?auto_179765 ?auto_179766 ?auto_179767 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179774 - BLOCK
      ?auto_179775 - BLOCK
      ?auto_179776 - BLOCK
    )
    :vars
    (
      ?auto_179781 - BLOCK
      ?auto_179782 - BLOCK
      ?auto_179778 - BLOCK
      ?auto_179779 - BLOCK
      ?auto_179777 - BLOCK
      ?auto_179780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179781 ?auto_179776 ) ( ON-TABLE ?auto_179774 ) ( ON ?auto_179775 ?auto_179774 ) ( ON ?auto_179776 ?auto_179775 ) ( not ( = ?auto_179774 ?auto_179775 ) ) ( not ( = ?auto_179774 ?auto_179776 ) ) ( not ( = ?auto_179774 ?auto_179781 ) ) ( not ( = ?auto_179775 ?auto_179776 ) ) ( not ( = ?auto_179775 ?auto_179781 ) ) ( not ( = ?auto_179776 ?auto_179781 ) ) ( not ( = ?auto_179774 ?auto_179782 ) ) ( not ( = ?auto_179774 ?auto_179778 ) ) ( not ( = ?auto_179775 ?auto_179782 ) ) ( not ( = ?auto_179775 ?auto_179778 ) ) ( not ( = ?auto_179776 ?auto_179782 ) ) ( not ( = ?auto_179776 ?auto_179778 ) ) ( not ( = ?auto_179781 ?auto_179782 ) ) ( not ( = ?auto_179781 ?auto_179778 ) ) ( not ( = ?auto_179782 ?auto_179778 ) ) ( ON ?auto_179782 ?auto_179781 ) ( CLEAR ?auto_179779 ) ( ON-TABLE ?auto_179777 ) ( ON ?auto_179780 ?auto_179777 ) ( ON ?auto_179779 ?auto_179780 ) ( not ( = ?auto_179777 ?auto_179780 ) ) ( not ( = ?auto_179777 ?auto_179779 ) ) ( not ( = ?auto_179777 ?auto_179778 ) ) ( not ( = ?auto_179780 ?auto_179779 ) ) ( not ( = ?auto_179780 ?auto_179778 ) ) ( not ( = ?auto_179779 ?auto_179778 ) ) ( not ( = ?auto_179774 ?auto_179779 ) ) ( not ( = ?auto_179774 ?auto_179777 ) ) ( not ( = ?auto_179774 ?auto_179780 ) ) ( not ( = ?auto_179775 ?auto_179779 ) ) ( not ( = ?auto_179775 ?auto_179777 ) ) ( not ( = ?auto_179775 ?auto_179780 ) ) ( not ( = ?auto_179776 ?auto_179779 ) ) ( not ( = ?auto_179776 ?auto_179777 ) ) ( not ( = ?auto_179776 ?auto_179780 ) ) ( not ( = ?auto_179781 ?auto_179779 ) ) ( not ( = ?auto_179781 ?auto_179777 ) ) ( not ( = ?auto_179781 ?auto_179780 ) ) ( not ( = ?auto_179782 ?auto_179779 ) ) ( not ( = ?auto_179782 ?auto_179777 ) ) ( not ( = ?auto_179782 ?auto_179780 ) ) ( ON ?auto_179778 ?auto_179782 ) ( CLEAR ?auto_179778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179774 ?auto_179775 ?auto_179776 ?auto_179781 ?auto_179782 )
      ( MAKE-3PILE ?auto_179774 ?auto_179775 ?auto_179776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179783 - BLOCK
      ?auto_179784 - BLOCK
      ?auto_179785 - BLOCK
    )
    :vars
    (
      ?auto_179791 - BLOCK
      ?auto_179790 - BLOCK
      ?auto_179789 - BLOCK
      ?auto_179788 - BLOCK
      ?auto_179786 - BLOCK
      ?auto_179787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179791 ?auto_179785 ) ( ON-TABLE ?auto_179783 ) ( ON ?auto_179784 ?auto_179783 ) ( ON ?auto_179785 ?auto_179784 ) ( not ( = ?auto_179783 ?auto_179784 ) ) ( not ( = ?auto_179783 ?auto_179785 ) ) ( not ( = ?auto_179783 ?auto_179791 ) ) ( not ( = ?auto_179784 ?auto_179785 ) ) ( not ( = ?auto_179784 ?auto_179791 ) ) ( not ( = ?auto_179785 ?auto_179791 ) ) ( not ( = ?auto_179783 ?auto_179790 ) ) ( not ( = ?auto_179783 ?auto_179789 ) ) ( not ( = ?auto_179784 ?auto_179790 ) ) ( not ( = ?auto_179784 ?auto_179789 ) ) ( not ( = ?auto_179785 ?auto_179790 ) ) ( not ( = ?auto_179785 ?auto_179789 ) ) ( not ( = ?auto_179791 ?auto_179790 ) ) ( not ( = ?auto_179791 ?auto_179789 ) ) ( not ( = ?auto_179790 ?auto_179789 ) ) ( ON ?auto_179790 ?auto_179791 ) ( ON-TABLE ?auto_179788 ) ( ON ?auto_179786 ?auto_179788 ) ( not ( = ?auto_179788 ?auto_179786 ) ) ( not ( = ?auto_179788 ?auto_179787 ) ) ( not ( = ?auto_179788 ?auto_179789 ) ) ( not ( = ?auto_179786 ?auto_179787 ) ) ( not ( = ?auto_179786 ?auto_179789 ) ) ( not ( = ?auto_179787 ?auto_179789 ) ) ( not ( = ?auto_179783 ?auto_179787 ) ) ( not ( = ?auto_179783 ?auto_179788 ) ) ( not ( = ?auto_179783 ?auto_179786 ) ) ( not ( = ?auto_179784 ?auto_179787 ) ) ( not ( = ?auto_179784 ?auto_179788 ) ) ( not ( = ?auto_179784 ?auto_179786 ) ) ( not ( = ?auto_179785 ?auto_179787 ) ) ( not ( = ?auto_179785 ?auto_179788 ) ) ( not ( = ?auto_179785 ?auto_179786 ) ) ( not ( = ?auto_179791 ?auto_179787 ) ) ( not ( = ?auto_179791 ?auto_179788 ) ) ( not ( = ?auto_179791 ?auto_179786 ) ) ( not ( = ?auto_179790 ?auto_179787 ) ) ( not ( = ?auto_179790 ?auto_179788 ) ) ( not ( = ?auto_179790 ?auto_179786 ) ) ( ON ?auto_179789 ?auto_179790 ) ( CLEAR ?auto_179789 ) ( HOLDING ?auto_179787 ) ( CLEAR ?auto_179786 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179788 ?auto_179786 ?auto_179787 )
      ( MAKE-3PILE ?auto_179783 ?auto_179784 ?auto_179785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179792 - BLOCK
      ?auto_179793 - BLOCK
      ?auto_179794 - BLOCK
    )
    :vars
    (
      ?auto_179796 - BLOCK
      ?auto_179797 - BLOCK
      ?auto_179799 - BLOCK
      ?auto_179795 - BLOCK
      ?auto_179798 - BLOCK
      ?auto_179800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179796 ?auto_179794 ) ( ON-TABLE ?auto_179792 ) ( ON ?auto_179793 ?auto_179792 ) ( ON ?auto_179794 ?auto_179793 ) ( not ( = ?auto_179792 ?auto_179793 ) ) ( not ( = ?auto_179792 ?auto_179794 ) ) ( not ( = ?auto_179792 ?auto_179796 ) ) ( not ( = ?auto_179793 ?auto_179794 ) ) ( not ( = ?auto_179793 ?auto_179796 ) ) ( not ( = ?auto_179794 ?auto_179796 ) ) ( not ( = ?auto_179792 ?auto_179797 ) ) ( not ( = ?auto_179792 ?auto_179799 ) ) ( not ( = ?auto_179793 ?auto_179797 ) ) ( not ( = ?auto_179793 ?auto_179799 ) ) ( not ( = ?auto_179794 ?auto_179797 ) ) ( not ( = ?auto_179794 ?auto_179799 ) ) ( not ( = ?auto_179796 ?auto_179797 ) ) ( not ( = ?auto_179796 ?auto_179799 ) ) ( not ( = ?auto_179797 ?auto_179799 ) ) ( ON ?auto_179797 ?auto_179796 ) ( ON-TABLE ?auto_179795 ) ( ON ?auto_179798 ?auto_179795 ) ( not ( = ?auto_179795 ?auto_179798 ) ) ( not ( = ?auto_179795 ?auto_179800 ) ) ( not ( = ?auto_179795 ?auto_179799 ) ) ( not ( = ?auto_179798 ?auto_179800 ) ) ( not ( = ?auto_179798 ?auto_179799 ) ) ( not ( = ?auto_179800 ?auto_179799 ) ) ( not ( = ?auto_179792 ?auto_179800 ) ) ( not ( = ?auto_179792 ?auto_179795 ) ) ( not ( = ?auto_179792 ?auto_179798 ) ) ( not ( = ?auto_179793 ?auto_179800 ) ) ( not ( = ?auto_179793 ?auto_179795 ) ) ( not ( = ?auto_179793 ?auto_179798 ) ) ( not ( = ?auto_179794 ?auto_179800 ) ) ( not ( = ?auto_179794 ?auto_179795 ) ) ( not ( = ?auto_179794 ?auto_179798 ) ) ( not ( = ?auto_179796 ?auto_179800 ) ) ( not ( = ?auto_179796 ?auto_179795 ) ) ( not ( = ?auto_179796 ?auto_179798 ) ) ( not ( = ?auto_179797 ?auto_179800 ) ) ( not ( = ?auto_179797 ?auto_179795 ) ) ( not ( = ?auto_179797 ?auto_179798 ) ) ( ON ?auto_179799 ?auto_179797 ) ( CLEAR ?auto_179798 ) ( ON ?auto_179800 ?auto_179799 ) ( CLEAR ?auto_179800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179792 ?auto_179793 ?auto_179794 ?auto_179796 ?auto_179797 ?auto_179799 )
      ( MAKE-3PILE ?auto_179792 ?auto_179793 ?auto_179794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179801 - BLOCK
      ?auto_179802 - BLOCK
      ?auto_179803 - BLOCK
    )
    :vars
    (
      ?auto_179804 - BLOCK
      ?auto_179808 - BLOCK
      ?auto_179806 - BLOCK
      ?auto_179807 - BLOCK
      ?auto_179809 - BLOCK
      ?auto_179805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179804 ?auto_179803 ) ( ON-TABLE ?auto_179801 ) ( ON ?auto_179802 ?auto_179801 ) ( ON ?auto_179803 ?auto_179802 ) ( not ( = ?auto_179801 ?auto_179802 ) ) ( not ( = ?auto_179801 ?auto_179803 ) ) ( not ( = ?auto_179801 ?auto_179804 ) ) ( not ( = ?auto_179802 ?auto_179803 ) ) ( not ( = ?auto_179802 ?auto_179804 ) ) ( not ( = ?auto_179803 ?auto_179804 ) ) ( not ( = ?auto_179801 ?auto_179808 ) ) ( not ( = ?auto_179801 ?auto_179806 ) ) ( not ( = ?auto_179802 ?auto_179808 ) ) ( not ( = ?auto_179802 ?auto_179806 ) ) ( not ( = ?auto_179803 ?auto_179808 ) ) ( not ( = ?auto_179803 ?auto_179806 ) ) ( not ( = ?auto_179804 ?auto_179808 ) ) ( not ( = ?auto_179804 ?auto_179806 ) ) ( not ( = ?auto_179808 ?auto_179806 ) ) ( ON ?auto_179808 ?auto_179804 ) ( ON-TABLE ?auto_179807 ) ( not ( = ?auto_179807 ?auto_179809 ) ) ( not ( = ?auto_179807 ?auto_179805 ) ) ( not ( = ?auto_179807 ?auto_179806 ) ) ( not ( = ?auto_179809 ?auto_179805 ) ) ( not ( = ?auto_179809 ?auto_179806 ) ) ( not ( = ?auto_179805 ?auto_179806 ) ) ( not ( = ?auto_179801 ?auto_179805 ) ) ( not ( = ?auto_179801 ?auto_179807 ) ) ( not ( = ?auto_179801 ?auto_179809 ) ) ( not ( = ?auto_179802 ?auto_179805 ) ) ( not ( = ?auto_179802 ?auto_179807 ) ) ( not ( = ?auto_179802 ?auto_179809 ) ) ( not ( = ?auto_179803 ?auto_179805 ) ) ( not ( = ?auto_179803 ?auto_179807 ) ) ( not ( = ?auto_179803 ?auto_179809 ) ) ( not ( = ?auto_179804 ?auto_179805 ) ) ( not ( = ?auto_179804 ?auto_179807 ) ) ( not ( = ?auto_179804 ?auto_179809 ) ) ( not ( = ?auto_179808 ?auto_179805 ) ) ( not ( = ?auto_179808 ?auto_179807 ) ) ( not ( = ?auto_179808 ?auto_179809 ) ) ( ON ?auto_179806 ?auto_179808 ) ( ON ?auto_179805 ?auto_179806 ) ( CLEAR ?auto_179805 ) ( HOLDING ?auto_179809 ) ( CLEAR ?auto_179807 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179807 ?auto_179809 )
      ( MAKE-3PILE ?auto_179801 ?auto_179802 ?auto_179803 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179810 - BLOCK
      ?auto_179811 - BLOCK
      ?auto_179812 - BLOCK
    )
    :vars
    (
      ?auto_179815 - BLOCK
      ?auto_179818 - BLOCK
      ?auto_179814 - BLOCK
      ?auto_179817 - BLOCK
      ?auto_179816 - BLOCK
      ?auto_179813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179815 ?auto_179812 ) ( ON-TABLE ?auto_179810 ) ( ON ?auto_179811 ?auto_179810 ) ( ON ?auto_179812 ?auto_179811 ) ( not ( = ?auto_179810 ?auto_179811 ) ) ( not ( = ?auto_179810 ?auto_179812 ) ) ( not ( = ?auto_179810 ?auto_179815 ) ) ( not ( = ?auto_179811 ?auto_179812 ) ) ( not ( = ?auto_179811 ?auto_179815 ) ) ( not ( = ?auto_179812 ?auto_179815 ) ) ( not ( = ?auto_179810 ?auto_179818 ) ) ( not ( = ?auto_179810 ?auto_179814 ) ) ( not ( = ?auto_179811 ?auto_179818 ) ) ( not ( = ?auto_179811 ?auto_179814 ) ) ( not ( = ?auto_179812 ?auto_179818 ) ) ( not ( = ?auto_179812 ?auto_179814 ) ) ( not ( = ?auto_179815 ?auto_179818 ) ) ( not ( = ?auto_179815 ?auto_179814 ) ) ( not ( = ?auto_179818 ?auto_179814 ) ) ( ON ?auto_179818 ?auto_179815 ) ( ON-TABLE ?auto_179817 ) ( not ( = ?auto_179817 ?auto_179816 ) ) ( not ( = ?auto_179817 ?auto_179813 ) ) ( not ( = ?auto_179817 ?auto_179814 ) ) ( not ( = ?auto_179816 ?auto_179813 ) ) ( not ( = ?auto_179816 ?auto_179814 ) ) ( not ( = ?auto_179813 ?auto_179814 ) ) ( not ( = ?auto_179810 ?auto_179813 ) ) ( not ( = ?auto_179810 ?auto_179817 ) ) ( not ( = ?auto_179810 ?auto_179816 ) ) ( not ( = ?auto_179811 ?auto_179813 ) ) ( not ( = ?auto_179811 ?auto_179817 ) ) ( not ( = ?auto_179811 ?auto_179816 ) ) ( not ( = ?auto_179812 ?auto_179813 ) ) ( not ( = ?auto_179812 ?auto_179817 ) ) ( not ( = ?auto_179812 ?auto_179816 ) ) ( not ( = ?auto_179815 ?auto_179813 ) ) ( not ( = ?auto_179815 ?auto_179817 ) ) ( not ( = ?auto_179815 ?auto_179816 ) ) ( not ( = ?auto_179818 ?auto_179813 ) ) ( not ( = ?auto_179818 ?auto_179817 ) ) ( not ( = ?auto_179818 ?auto_179816 ) ) ( ON ?auto_179814 ?auto_179818 ) ( ON ?auto_179813 ?auto_179814 ) ( CLEAR ?auto_179817 ) ( ON ?auto_179816 ?auto_179813 ) ( CLEAR ?auto_179816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179810 ?auto_179811 ?auto_179812 ?auto_179815 ?auto_179818 ?auto_179814 ?auto_179813 )
      ( MAKE-3PILE ?auto_179810 ?auto_179811 ?auto_179812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179819 - BLOCK
      ?auto_179820 - BLOCK
      ?auto_179821 - BLOCK
    )
    :vars
    (
      ?auto_179827 - BLOCK
      ?auto_179825 - BLOCK
      ?auto_179824 - BLOCK
      ?auto_179823 - BLOCK
      ?auto_179822 - BLOCK
      ?auto_179826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179827 ?auto_179821 ) ( ON-TABLE ?auto_179819 ) ( ON ?auto_179820 ?auto_179819 ) ( ON ?auto_179821 ?auto_179820 ) ( not ( = ?auto_179819 ?auto_179820 ) ) ( not ( = ?auto_179819 ?auto_179821 ) ) ( not ( = ?auto_179819 ?auto_179827 ) ) ( not ( = ?auto_179820 ?auto_179821 ) ) ( not ( = ?auto_179820 ?auto_179827 ) ) ( not ( = ?auto_179821 ?auto_179827 ) ) ( not ( = ?auto_179819 ?auto_179825 ) ) ( not ( = ?auto_179819 ?auto_179824 ) ) ( not ( = ?auto_179820 ?auto_179825 ) ) ( not ( = ?auto_179820 ?auto_179824 ) ) ( not ( = ?auto_179821 ?auto_179825 ) ) ( not ( = ?auto_179821 ?auto_179824 ) ) ( not ( = ?auto_179827 ?auto_179825 ) ) ( not ( = ?auto_179827 ?auto_179824 ) ) ( not ( = ?auto_179825 ?auto_179824 ) ) ( ON ?auto_179825 ?auto_179827 ) ( not ( = ?auto_179823 ?auto_179822 ) ) ( not ( = ?auto_179823 ?auto_179826 ) ) ( not ( = ?auto_179823 ?auto_179824 ) ) ( not ( = ?auto_179822 ?auto_179826 ) ) ( not ( = ?auto_179822 ?auto_179824 ) ) ( not ( = ?auto_179826 ?auto_179824 ) ) ( not ( = ?auto_179819 ?auto_179826 ) ) ( not ( = ?auto_179819 ?auto_179823 ) ) ( not ( = ?auto_179819 ?auto_179822 ) ) ( not ( = ?auto_179820 ?auto_179826 ) ) ( not ( = ?auto_179820 ?auto_179823 ) ) ( not ( = ?auto_179820 ?auto_179822 ) ) ( not ( = ?auto_179821 ?auto_179826 ) ) ( not ( = ?auto_179821 ?auto_179823 ) ) ( not ( = ?auto_179821 ?auto_179822 ) ) ( not ( = ?auto_179827 ?auto_179826 ) ) ( not ( = ?auto_179827 ?auto_179823 ) ) ( not ( = ?auto_179827 ?auto_179822 ) ) ( not ( = ?auto_179825 ?auto_179826 ) ) ( not ( = ?auto_179825 ?auto_179823 ) ) ( not ( = ?auto_179825 ?auto_179822 ) ) ( ON ?auto_179824 ?auto_179825 ) ( ON ?auto_179826 ?auto_179824 ) ( ON ?auto_179822 ?auto_179826 ) ( CLEAR ?auto_179822 ) ( HOLDING ?auto_179823 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179823 )
      ( MAKE-3PILE ?auto_179819 ?auto_179820 ?auto_179821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179828 - BLOCK
      ?auto_179829 - BLOCK
      ?auto_179830 - BLOCK
    )
    :vars
    (
      ?auto_179836 - BLOCK
      ?auto_179833 - BLOCK
      ?auto_179832 - BLOCK
      ?auto_179831 - BLOCK
      ?auto_179834 - BLOCK
      ?auto_179835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179836 ?auto_179830 ) ( ON-TABLE ?auto_179828 ) ( ON ?auto_179829 ?auto_179828 ) ( ON ?auto_179830 ?auto_179829 ) ( not ( = ?auto_179828 ?auto_179829 ) ) ( not ( = ?auto_179828 ?auto_179830 ) ) ( not ( = ?auto_179828 ?auto_179836 ) ) ( not ( = ?auto_179829 ?auto_179830 ) ) ( not ( = ?auto_179829 ?auto_179836 ) ) ( not ( = ?auto_179830 ?auto_179836 ) ) ( not ( = ?auto_179828 ?auto_179833 ) ) ( not ( = ?auto_179828 ?auto_179832 ) ) ( not ( = ?auto_179829 ?auto_179833 ) ) ( not ( = ?auto_179829 ?auto_179832 ) ) ( not ( = ?auto_179830 ?auto_179833 ) ) ( not ( = ?auto_179830 ?auto_179832 ) ) ( not ( = ?auto_179836 ?auto_179833 ) ) ( not ( = ?auto_179836 ?auto_179832 ) ) ( not ( = ?auto_179833 ?auto_179832 ) ) ( ON ?auto_179833 ?auto_179836 ) ( not ( = ?auto_179831 ?auto_179834 ) ) ( not ( = ?auto_179831 ?auto_179835 ) ) ( not ( = ?auto_179831 ?auto_179832 ) ) ( not ( = ?auto_179834 ?auto_179835 ) ) ( not ( = ?auto_179834 ?auto_179832 ) ) ( not ( = ?auto_179835 ?auto_179832 ) ) ( not ( = ?auto_179828 ?auto_179835 ) ) ( not ( = ?auto_179828 ?auto_179831 ) ) ( not ( = ?auto_179828 ?auto_179834 ) ) ( not ( = ?auto_179829 ?auto_179835 ) ) ( not ( = ?auto_179829 ?auto_179831 ) ) ( not ( = ?auto_179829 ?auto_179834 ) ) ( not ( = ?auto_179830 ?auto_179835 ) ) ( not ( = ?auto_179830 ?auto_179831 ) ) ( not ( = ?auto_179830 ?auto_179834 ) ) ( not ( = ?auto_179836 ?auto_179835 ) ) ( not ( = ?auto_179836 ?auto_179831 ) ) ( not ( = ?auto_179836 ?auto_179834 ) ) ( not ( = ?auto_179833 ?auto_179835 ) ) ( not ( = ?auto_179833 ?auto_179831 ) ) ( not ( = ?auto_179833 ?auto_179834 ) ) ( ON ?auto_179832 ?auto_179833 ) ( ON ?auto_179835 ?auto_179832 ) ( ON ?auto_179834 ?auto_179835 ) ( ON ?auto_179831 ?auto_179834 ) ( CLEAR ?auto_179831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179828 ?auto_179829 ?auto_179830 ?auto_179836 ?auto_179833 ?auto_179832 ?auto_179835 ?auto_179834 )
      ( MAKE-3PILE ?auto_179828 ?auto_179829 ?auto_179830 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179843 - BLOCK
      ?auto_179844 - BLOCK
      ?auto_179845 - BLOCK
      ?auto_179846 - BLOCK
      ?auto_179847 - BLOCK
      ?auto_179848 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_179848 ) ( CLEAR ?auto_179847 ) ( ON-TABLE ?auto_179843 ) ( ON ?auto_179844 ?auto_179843 ) ( ON ?auto_179845 ?auto_179844 ) ( ON ?auto_179846 ?auto_179845 ) ( ON ?auto_179847 ?auto_179846 ) ( not ( = ?auto_179843 ?auto_179844 ) ) ( not ( = ?auto_179843 ?auto_179845 ) ) ( not ( = ?auto_179843 ?auto_179846 ) ) ( not ( = ?auto_179843 ?auto_179847 ) ) ( not ( = ?auto_179843 ?auto_179848 ) ) ( not ( = ?auto_179844 ?auto_179845 ) ) ( not ( = ?auto_179844 ?auto_179846 ) ) ( not ( = ?auto_179844 ?auto_179847 ) ) ( not ( = ?auto_179844 ?auto_179848 ) ) ( not ( = ?auto_179845 ?auto_179846 ) ) ( not ( = ?auto_179845 ?auto_179847 ) ) ( not ( = ?auto_179845 ?auto_179848 ) ) ( not ( = ?auto_179846 ?auto_179847 ) ) ( not ( = ?auto_179846 ?auto_179848 ) ) ( not ( = ?auto_179847 ?auto_179848 ) ) )
    :subtasks
    ( ( !STACK ?auto_179848 ?auto_179847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179849 - BLOCK
      ?auto_179850 - BLOCK
      ?auto_179851 - BLOCK
      ?auto_179852 - BLOCK
      ?auto_179853 - BLOCK
      ?auto_179854 - BLOCK
    )
    :vars
    (
      ?auto_179855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_179853 ) ( ON-TABLE ?auto_179849 ) ( ON ?auto_179850 ?auto_179849 ) ( ON ?auto_179851 ?auto_179850 ) ( ON ?auto_179852 ?auto_179851 ) ( ON ?auto_179853 ?auto_179852 ) ( not ( = ?auto_179849 ?auto_179850 ) ) ( not ( = ?auto_179849 ?auto_179851 ) ) ( not ( = ?auto_179849 ?auto_179852 ) ) ( not ( = ?auto_179849 ?auto_179853 ) ) ( not ( = ?auto_179849 ?auto_179854 ) ) ( not ( = ?auto_179850 ?auto_179851 ) ) ( not ( = ?auto_179850 ?auto_179852 ) ) ( not ( = ?auto_179850 ?auto_179853 ) ) ( not ( = ?auto_179850 ?auto_179854 ) ) ( not ( = ?auto_179851 ?auto_179852 ) ) ( not ( = ?auto_179851 ?auto_179853 ) ) ( not ( = ?auto_179851 ?auto_179854 ) ) ( not ( = ?auto_179852 ?auto_179853 ) ) ( not ( = ?auto_179852 ?auto_179854 ) ) ( not ( = ?auto_179853 ?auto_179854 ) ) ( ON ?auto_179854 ?auto_179855 ) ( CLEAR ?auto_179854 ) ( HAND-EMPTY ) ( not ( = ?auto_179849 ?auto_179855 ) ) ( not ( = ?auto_179850 ?auto_179855 ) ) ( not ( = ?auto_179851 ?auto_179855 ) ) ( not ( = ?auto_179852 ?auto_179855 ) ) ( not ( = ?auto_179853 ?auto_179855 ) ) ( not ( = ?auto_179854 ?auto_179855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179854 ?auto_179855 )
      ( MAKE-6PILE ?auto_179849 ?auto_179850 ?auto_179851 ?auto_179852 ?auto_179853 ?auto_179854 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179856 - BLOCK
      ?auto_179857 - BLOCK
      ?auto_179858 - BLOCK
      ?auto_179859 - BLOCK
      ?auto_179860 - BLOCK
      ?auto_179861 - BLOCK
    )
    :vars
    (
      ?auto_179862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179856 ) ( ON ?auto_179857 ?auto_179856 ) ( ON ?auto_179858 ?auto_179857 ) ( ON ?auto_179859 ?auto_179858 ) ( not ( = ?auto_179856 ?auto_179857 ) ) ( not ( = ?auto_179856 ?auto_179858 ) ) ( not ( = ?auto_179856 ?auto_179859 ) ) ( not ( = ?auto_179856 ?auto_179860 ) ) ( not ( = ?auto_179856 ?auto_179861 ) ) ( not ( = ?auto_179857 ?auto_179858 ) ) ( not ( = ?auto_179857 ?auto_179859 ) ) ( not ( = ?auto_179857 ?auto_179860 ) ) ( not ( = ?auto_179857 ?auto_179861 ) ) ( not ( = ?auto_179858 ?auto_179859 ) ) ( not ( = ?auto_179858 ?auto_179860 ) ) ( not ( = ?auto_179858 ?auto_179861 ) ) ( not ( = ?auto_179859 ?auto_179860 ) ) ( not ( = ?auto_179859 ?auto_179861 ) ) ( not ( = ?auto_179860 ?auto_179861 ) ) ( ON ?auto_179861 ?auto_179862 ) ( CLEAR ?auto_179861 ) ( not ( = ?auto_179856 ?auto_179862 ) ) ( not ( = ?auto_179857 ?auto_179862 ) ) ( not ( = ?auto_179858 ?auto_179862 ) ) ( not ( = ?auto_179859 ?auto_179862 ) ) ( not ( = ?auto_179860 ?auto_179862 ) ) ( not ( = ?auto_179861 ?auto_179862 ) ) ( HOLDING ?auto_179860 ) ( CLEAR ?auto_179859 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179856 ?auto_179857 ?auto_179858 ?auto_179859 ?auto_179860 )
      ( MAKE-6PILE ?auto_179856 ?auto_179857 ?auto_179858 ?auto_179859 ?auto_179860 ?auto_179861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179863 - BLOCK
      ?auto_179864 - BLOCK
      ?auto_179865 - BLOCK
      ?auto_179866 - BLOCK
      ?auto_179867 - BLOCK
      ?auto_179868 - BLOCK
    )
    :vars
    (
      ?auto_179869 - BLOCK
      ?auto_179870 - BLOCK
      ?auto_179871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179863 ) ( ON ?auto_179864 ?auto_179863 ) ( ON ?auto_179865 ?auto_179864 ) ( ON ?auto_179866 ?auto_179865 ) ( not ( = ?auto_179863 ?auto_179864 ) ) ( not ( = ?auto_179863 ?auto_179865 ) ) ( not ( = ?auto_179863 ?auto_179866 ) ) ( not ( = ?auto_179863 ?auto_179867 ) ) ( not ( = ?auto_179863 ?auto_179868 ) ) ( not ( = ?auto_179864 ?auto_179865 ) ) ( not ( = ?auto_179864 ?auto_179866 ) ) ( not ( = ?auto_179864 ?auto_179867 ) ) ( not ( = ?auto_179864 ?auto_179868 ) ) ( not ( = ?auto_179865 ?auto_179866 ) ) ( not ( = ?auto_179865 ?auto_179867 ) ) ( not ( = ?auto_179865 ?auto_179868 ) ) ( not ( = ?auto_179866 ?auto_179867 ) ) ( not ( = ?auto_179866 ?auto_179868 ) ) ( not ( = ?auto_179867 ?auto_179868 ) ) ( ON ?auto_179868 ?auto_179869 ) ( not ( = ?auto_179863 ?auto_179869 ) ) ( not ( = ?auto_179864 ?auto_179869 ) ) ( not ( = ?auto_179865 ?auto_179869 ) ) ( not ( = ?auto_179866 ?auto_179869 ) ) ( not ( = ?auto_179867 ?auto_179869 ) ) ( not ( = ?auto_179868 ?auto_179869 ) ) ( CLEAR ?auto_179866 ) ( ON ?auto_179867 ?auto_179868 ) ( CLEAR ?auto_179867 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179870 ) ( ON ?auto_179871 ?auto_179870 ) ( ON ?auto_179869 ?auto_179871 ) ( not ( = ?auto_179870 ?auto_179871 ) ) ( not ( = ?auto_179870 ?auto_179869 ) ) ( not ( = ?auto_179870 ?auto_179868 ) ) ( not ( = ?auto_179870 ?auto_179867 ) ) ( not ( = ?auto_179871 ?auto_179869 ) ) ( not ( = ?auto_179871 ?auto_179868 ) ) ( not ( = ?auto_179871 ?auto_179867 ) ) ( not ( = ?auto_179863 ?auto_179870 ) ) ( not ( = ?auto_179863 ?auto_179871 ) ) ( not ( = ?auto_179864 ?auto_179870 ) ) ( not ( = ?auto_179864 ?auto_179871 ) ) ( not ( = ?auto_179865 ?auto_179870 ) ) ( not ( = ?auto_179865 ?auto_179871 ) ) ( not ( = ?auto_179866 ?auto_179870 ) ) ( not ( = ?auto_179866 ?auto_179871 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179870 ?auto_179871 ?auto_179869 ?auto_179868 )
      ( MAKE-6PILE ?auto_179863 ?auto_179864 ?auto_179865 ?auto_179866 ?auto_179867 ?auto_179868 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179872 - BLOCK
      ?auto_179873 - BLOCK
      ?auto_179874 - BLOCK
      ?auto_179875 - BLOCK
      ?auto_179876 - BLOCK
      ?auto_179877 - BLOCK
    )
    :vars
    (
      ?auto_179878 - BLOCK
      ?auto_179880 - BLOCK
      ?auto_179879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179872 ) ( ON ?auto_179873 ?auto_179872 ) ( ON ?auto_179874 ?auto_179873 ) ( not ( = ?auto_179872 ?auto_179873 ) ) ( not ( = ?auto_179872 ?auto_179874 ) ) ( not ( = ?auto_179872 ?auto_179875 ) ) ( not ( = ?auto_179872 ?auto_179876 ) ) ( not ( = ?auto_179872 ?auto_179877 ) ) ( not ( = ?auto_179873 ?auto_179874 ) ) ( not ( = ?auto_179873 ?auto_179875 ) ) ( not ( = ?auto_179873 ?auto_179876 ) ) ( not ( = ?auto_179873 ?auto_179877 ) ) ( not ( = ?auto_179874 ?auto_179875 ) ) ( not ( = ?auto_179874 ?auto_179876 ) ) ( not ( = ?auto_179874 ?auto_179877 ) ) ( not ( = ?auto_179875 ?auto_179876 ) ) ( not ( = ?auto_179875 ?auto_179877 ) ) ( not ( = ?auto_179876 ?auto_179877 ) ) ( ON ?auto_179877 ?auto_179878 ) ( not ( = ?auto_179872 ?auto_179878 ) ) ( not ( = ?auto_179873 ?auto_179878 ) ) ( not ( = ?auto_179874 ?auto_179878 ) ) ( not ( = ?auto_179875 ?auto_179878 ) ) ( not ( = ?auto_179876 ?auto_179878 ) ) ( not ( = ?auto_179877 ?auto_179878 ) ) ( ON ?auto_179876 ?auto_179877 ) ( CLEAR ?auto_179876 ) ( ON-TABLE ?auto_179880 ) ( ON ?auto_179879 ?auto_179880 ) ( ON ?auto_179878 ?auto_179879 ) ( not ( = ?auto_179880 ?auto_179879 ) ) ( not ( = ?auto_179880 ?auto_179878 ) ) ( not ( = ?auto_179880 ?auto_179877 ) ) ( not ( = ?auto_179880 ?auto_179876 ) ) ( not ( = ?auto_179879 ?auto_179878 ) ) ( not ( = ?auto_179879 ?auto_179877 ) ) ( not ( = ?auto_179879 ?auto_179876 ) ) ( not ( = ?auto_179872 ?auto_179880 ) ) ( not ( = ?auto_179872 ?auto_179879 ) ) ( not ( = ?auto_179873 ?auto_179880 ) ) ( not ( = ?auto_179873 ?auto_179879 ) ) ( not ( = ?auto_179874 ?auto_179880 ) ) ( not ( = ?auto_179874 ?auto_179879 ) ) ( not ( = ?auto_179875 ?auto_179880 ) ) ( not ( = ?auto_179875 ?auto_179879 ) ) ( HOLDING ?auto_179875 ) ( CLEAR ?auto_179874 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179872 ?auto_179873 ?auto_179874 ?auto_179875 )
      ( MAKE-6PILE ?auto_179872 ?auto_179873 ?auto_179874 ?auto_179875 ?auto_179876 ?auto_179877 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179881 - BLOCK
      ?auto_179882 - BLOCK
      ?auto_179883 - BLOCK
      ?auto_179884 - BLOCK
      ?auto_179885 - BLOCK
      ?auto_179886 - BLOCK
    )
    :vars
    (
      ?auto_179888 - BLOCK
      ?auto_179887 - BLOCK
      ?auto_179889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179881 ) ( ON ?auto_179882 ?auto_179881 ) ( ON ?auto_179883 ?auto_179882 ) ( not ( = ?auto_179881 ?auto_179882 ) ) ( not ( = ?auto_179881 ?auto_179883 ) ) ( not ( = ?auto_179881 ?auto_179884 ) ) ( not ( = ?auto_179881 ?auto_179885 ) ) ( not ( = ?auto_179881 ?auto_179886 ) ) ( not ( = ?auto_179882 ?auto_179883 ) ) ( not ( = ?auto_179882 ?auto_179884 ) ) ( not ( = ?auto_179882 ?auto_179885 ) ) ( not ( = ?auto_179882 ?auto_179886 ) ) ( not ( = ?auto_179883 ?auto_179884 ) ) ( not ( = ?auto_179883 ?auto_179885 ) ) ( not ( = ?auto_179883 ?auto_179886 ) ) ( not ( = ?auto_179884 ?auto_179885 ) ) ( not ( = ?auto_179884 ?auto_179886 ) ) ( not ( = ?auto_179885 ?auto_179886 ) ) ( ON ?auto_179886 ?auto_179888 ) ( not ( = ?auto_179881 ?auto_179888 ) ) ( not ( = ?auto_179882 ?auto_179888 ) ) ( not ( = ?auto_179883 ?auto_179888 ) ) ( not ( = ?auto_179884 ?auto_179888 ) ) ( not ( = ?auto_179885 ?auto_179888 ) ) ( not ( = ?auto_179886 ?auto_179888 ) ) ( ON ?auto_179885 ?auto_179886 ) ( ON-TABLE ?auto_179887 ) ( ON ?auto_179889 ?auto_179887 ) ( ON ?auto_179888 ?auto_179889 ) ( not ( = ?auto_179887 ?auto_179889 ) ) ( not ( = ?auto_179887 ?auto_179888 ) ) ( not ( = ?auto_179887 ?auto_179886 ) ) ( not ( = ?auto_179887 ?auto_179885 ) ) ( not ( = ?auto_179889 ?auto_179888 ) ) ( not ( = ?auto_179889 ?auto_179886 ) ) ( not ( = ?auto_179889 ?auto_179885 ) ) ( not ( = ?auto_179881 ?auto_179887 ) ) ( not ( = ?auto_179881 ?auto_179889 ) ) ( not ( = ?auto_179882 ?auto_179887 ) ) ( not ( = ?auto_179882 ?auto_179889 ) ) ( not ( = ?auto_179883 ?auto_179887 ) ) ( not ( = ?auto_179883 ?auto_179889 ) ) ( not ( = ?auto_179884 ?auto_179887 ) ) ( not ( = ?auto_179884 ?auto_179889 ) ) ( CLEAR ?auto_179883 ) ( ON ?auto_179884 ?auto_179885 ) ( CLEAR ?auto_179884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179887 ?auto_179889 ?auto_179888 ?auto_179886 ?auto_179885 )
      ( MAKE-6PILE ?auto_179881 ?auto_179882 ?auto_179883 ?auto_179884 ?auto_179885 ?auto_179886 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179890 - BLOCK
      ?auto_179891 - BLOCK
      ?auto_179892 - BLOCK
      ?auto_179893 - BLOCK
      ?auto_179894 - BLOCK
      ?auto_179895 - BLOCK
    )
    :vars
    (
      ?auto_179898 - BLOCK
      ?auto_179897 - BLOCK
      ?auto_179896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179890 ) ( ON ?auto_179891 ?auto_179890 ) ( not ( = ?auto_179890 ?auto_179891 ) ) ( not ( = ?auto_179890 ?auto_179892 ) ) ( not ( = ?auto_179890 ?auto_179893 ) ) ( not ( = ?auto_179890 ?auto_179894 ) ) ( not ( = ?auto_179890 ?auto_179895 ) ) ( not ( = ?auto_179891 ?auto_179892 ) ) ( not ( = ?auto_179891 ?auto_179893 ) ) ( not ( = ?auto_179891 ?auto_179894 ) ) ( not ( = ?auto_179891 ?auto_179895 ) ) ( not ( = ?auto_179892 ?auto_179893 ) ) ( not ( = ?auto_179892 ?auto_179894 ) ) ( not ( = ?auto_179892 ?auto_179895 ) ) ( not ( = ?auto_179893 ?auto_179894 ) ) ( not ( = ?auto_179893 ?auto_179895 ) ) ( not ( = ?auto_179894 ?auto_179895 ) ) ( ON ?auto_179895 ?auto_179898 ) ( not ( = ?auto_179890 ?auto_179898 ) ) ( not ( = ?auto_179891 ?auto_179898 ) ) ( not ( = ?auto_179892 ?auto_179898 ) ) ( not ( = ?auto_179893 ?auto_179898 ) ) ( not ( = ?auto_179894 ?auto_179898 ) ) ( not ( = ?auto_179895 ?auto_179898 ) ) ( ON ?auto_179894 ?auto_179895 ) ( ON-TABLE ?auto_179897 ) ( ON ?auto_179896 ?auto_179897 ) ( ON ?auto_179898 ?auto_179896 ) ( not ( = ?auto_179897 ?auto_179896 ) ) ( not ( = ?auto_179897 ?auto_179898 ) ) ( not ( = ?auto_179897 ?auto_179895 ) ) ( not ( = ?auto_179897 ?auto_179894 ) ) ( not ( = ?auto_179896 ?auto_179898 ) ) ( not ( = ?auto_179896 ?auto_179895 ) ) ( not ( = ?auto_179896 ?auto_179894 ) ) ( not ( = ?auto_179890 ?auto_179897 ) ) ( not ( = ?auto_179890 ?auto_179896 ) ) ( not ( = ?auto_179891 ?auto_179897 ) ) ( not ( = ?auto_179891 ?auto_179896 ) ) ( not ( = ?auto_179892 ?auto_179897 ) ) ( not ( = ?auto_179892 ?auto_179896 ) ) ( not ( = ?auto_179893 ?auto_179897 ) ) ( not ( = ?auto_179893 ?auto_179896 ) ) ( ON ?auto_179893 ?auto_179894 ) ( CLEAR ?auto_179893 ) ( HOLDING ?auto_179892 ) ( CLEAR ?auto_179891 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179890 ?auto_179891 ?auto_179892 )
      ( MAKE-6PILE ?auto_179890 ?auto_179891 ?auto_179892 ?auto_179893 ?auto_179894 ?auto_179895 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179899 - BLOCK
      ?auto_179900 - BLOCK
      ?auto_179901 - BLOCK
      ?auto_179902 - BLOCK
      ?auto_179903 - BLOCK
      ?auto_179904 - BLOCK
    )
    :vars
    (
      ?auto_179905 - BLOCK
      ?auto_179906 - BLOCK
      ?auto_179907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179899 ) ( ON ?auto_179900 ?auto_179899 ) ( not ( = ?auto_179899 ?auto_179900 ) ) ( not ( = ?auto_179899 ?auto_179901 ) ) ( not ( = ?auto_179899 ?auto_179902 ) ) ( not ( = ?auto_179899 ?auto_179903 ) ) ( not ( = ?auto_179899 ?auto_179904 ) ) ( not ( = ?auto_179900 ?auto_179901 ) ) ( not ( = ?auto_179900 ?auto_179902 ) ) ( not ( = ?auto_179900 ?auto_179903 ) ) ( not ( = ?auto_179900 ?auto_179904 ) ) ( not ( = ?auto_179901 ?auto_179902 ) ) ( not ( = ?auto_179901 ?auto_179903 ) ) ( not ( = ?auto_179901 ?auto_179904 ) ) ( not ( = ?auto_179902 ?auto_179903 ) ) ( not ( = ?auto_179902 ?auto_179904 ) ) ( not ( = ?auto_179903 ?auto_179904 ) ) ( ON ?auto_179904 ?auto_179905 ) ( not ( = ?auto_179899 ?auto_179905 ) ) ( not ( = ?auto_179900 ?auto_179905 ) ) ( not ( = ?auto_179901 ?auto_179905 ) ) ( not ( = ?auto_179902 ?auto_179905 ) ) ( not ( = ?auto_179903 ?auto_179905 ) ) ( not ( = ?auto_179904 ?auto_179905 ) ) ( ON ?auto_179903 ?auto_179904 ) ( ON-TABLE ?auto_179906 ) ( ON ?auto_179907 ?auto_179906 ) ( ON ?auto_179905 ?auto_179907 ) ( not ( = ?auto_179906 ?auto_179907 ) ) ( not ( = ?auto_179906 ?auto_179905 ) ) ( not ( = ?auto_179906 ?auto_179904 ) ) ( not ( = ?auto_179906 ?auto_179903 ) ) ( not ( = ?auto_179907 ?auto_179905 ) ) ( not ( = ?auto_179907 ?auto_179904 ) ) ( not ( = ?auto_179907 ?auto_179903 ) ) ( not ( = ?auto_179899 ?auto_179906 ) ) ( not ( = ?auto_179899 ?auto_179907 ) ) ( not ( = ?auto_179900 ?auto_179906 ) ) ( not ( = ?auto_179900 ?auto_179907 ) ) ( not ( = ?auto_179901 ?auto_179906 ) ) ( not ( = ?auto_179901 ?auto_179907 ) ) ( not ( = ?auto_179902 ?auto_179906 ) ) ( not ( = ?auto_179902 ?auto_179907 ) ) ( ON ?auto_179902 ?auto_179903 ) ( CLEAR ?auto_179900 ) ( ON ?auto_179901 ?auto_179902 ) ( CLEAR ?auto_179901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179906 ?auto_179907 ?auto_179905 ?auto_179904 ?auto_179903 ?auto_179902 )
      ( MAKE-6PILE ?auto_179899 ?auto_179900 ?auto_179901 ?auto_179902 ?auto_179903 ?auto_179904 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179908 - BLOCK
      ?auto_179909 - BLOCK
      ?auto_179910 - BLOCK
      ?auto_179911 - BLOCK
      ?auto_179912 - BLOCK
      ?auto_179913 - BLOCK
    )
    :vars
    (
      ?auto_179916 - BLOCK
      ?auto_179915 - BLOCK
      ?auto_179914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179908 ) ( not ( = ?auto_179908 ?auto_179909 ) ) ( not ( = ?auto_179908 ?auto_179910 ) ) ( not ( = ?auto_179908 ?auto_179911 ) ) ( not ( = ?auto_179908 ?auto_179912 ) ) ( not ( = ?auto_179908 ?auto_179913 ) ) ( not ( = ?auto_179909 ?auto_179910 ) ) ( not ( = ?auto_179909 ?auto_179911 ) ) ( not ( = ?auto_179909 ?auto_179912 ) ) ( not ( = ?auto_179909 ?auto_179913 ) ) ( not ( = ?auto_179910 ?auto_179911 ) ) ( not ( = ?auto_179910 ?auto_179912 ) ) ( not ( = ?auto_179910 ?auto_179913 ) ) ( not ( = ?auto_179911 ?auto_179912 ) ) ( not ( = ?auto_179911 ?auto_179913 ) ) ( not ( = ?auto_179912 ?auto_179913 ) ) ( ON ?auto_179913 ?auto_179916 ) ( not ( = ?auto_179908 ?auto_179916 ) ) ( not ( = ?auto_179909 ?auto_179916 ) ) ( not ( = ?auto_179910 ?auto_179916 ) ) ( not ( = ?auto_179911 ?auto_179916 ) ) ( not ( = ?auto_179912 ?auto_179916 ) ) ( not ( = ?auto_179913 ?auto_179916 ) ) ( ON ?auto_179912 ?auto_179913 ) ( ON-TABLE ?auto_179915 ) ( ON ?auto_179914 ?auto_179915 ) ( ON ?auto_179916 ?auto_179914 ) ( not ( = ?auto_179915 ?auto_179914 ) ) ( not ( = ?auto_179915 ?auto_179916 ) ) ( not ( = ?auto_179915 ?auto_179913 ) ) ( not ( = ?auto_179915 ?auto_179912 ) ) ( not ( = ?auto_179914 ?auto_179916 ) ) ( not ( = ?auto_179914 ?auto_179913 ) ) ( not ( = ?auto_179914 ?auto_179912 ) ) ( not ( = ?auto_179908 ?auto_179915 ) ) ( not ( = ?auto_179908 ?auto_179914 ) ) ( not ( = ?auto_179909 ?auto_179915 ) ) ( not ( = ?auto_179909 ?auto_179914 ) ) ( not ( = ?auto_179910 ?auto_179915 ) ) ( not ( = ?auto_179910 ?auto_179914 ) ) ( not ( = ?auto_179911 ?auto_179915 ) ) ( not ( = ?auto_179911 ?auto_179914 ) ) ( ON ?auto_179911 ?auto_179912 ) ( ON ?auto_179910 ?auto_179911 ) ( CLEAR ?auto_179910 ) ( HOLDING ?auto_179909 ) ( CLEAR ?auto_179908 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179908 ?auto_179909 )
      ( MAKE-6PILE ?auto_179908 ?auto_179909 ?auto_179910 ?auto_179911 ?auto_179912 ?auto_179913 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179917 - BLOCK
      ?auto_179918 - BLOCK
      ?auto_179919 - BLOCK
      ?auto_179920 - BLOCK
      ?auto_179921 - BLOCK
      ?auto_179922 - BLOCK
    )
    :vars
    (
      ?auto_179923 - BLOCK
      ?auto_179924 - BLOCK
      ?auto_179925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179917 ) ( not ( = ?auto_179917 ?auto_179918 ) ) ( not ( = ?auto_179917 ?auto_179919 ) ) ( not ( = ?auto_179917 ?auto_179920 ) ) ( not ( = ?auto_179917 ?auto_179921 ) ) ( not ( = ?auto_179917 ?auto_179922 ) ) ( not ( = ?auto_179918 ?auto_179919 ) ) ( not ( = ?auto_179918 ?auto_179920 ) ) ( not ( = ?auto_179918 ?auto_179921 ) ) ( not ( = ?auto_179918 ?auto_179922 ) ) ( not ( = ?auto_179919 ?auto_179920 ) ) ( not ( = ?auto_179919 ?auto_179921 ) ) ( not ( = ?auto_179919 ?auto_179922 ) ) ( not ( = ?auto_179920 ?auto_179921 ) ) ( not ( = ?auto_179920 ?auto_179922 ) ) ( not ( = ?auto_179921 ?auto_179922 ) ) ( ON ?auto_179922 ?auto_179923 ) ( not ( = ?auto_179917 ?auto_179923 ) ) ( not ( = ?auto_179918 ?auto_179923 ) ) ( not ( = ?auto_179919 ?auto_179923 ) ) ( not ( = ?auto_179920 ?auto_179923 ) ) ( not ( = ?auto_179921 ?auto_179923 ) ) ( not ( = ?auto_179922 ?auto_179923 ) ) ( ON ?auto_179921 ?auto_179922 ) ( ON-TABLE ?auto_179924 ) ( ON ?auto_179925 ?auto_179924 ) ( ON ?auto_179923 ?auto_179925 ) ( not ( = ?auto_179924 ?auto_179925 ) ) ( not ( = ?auto_179924 ?auto_179923 ) ) ( not ( = ?auto_179924 ?auto_179922 ) ) ( not ( = ?auto_179924 ?auto_179921 ) ) ( not ( = ?auto_179925 ?auto_179923 ) ) ( not ( = ?auto_179925 ?auto_179922 ) ) ( not ( = ?auto_179925 ?auto_179921 ) ) ( not ( = ?auto_179917 ?auto_179924 ) ) ( not ( = ?auto_179917 ?auto_179925 ) ) ( not ( = ?auto_179918 ?auto_179924 ) ) ( not ( = ?auto_179918 ?auto_179925 ) ) ( not ( = ?auto_179919 ?auto_179924 ) ) ( not ( = ?auto_179919 ?auto_179925 ) ) ( not ( = ?auto_179920 ?auto_179924 ) ) ( not ( = ?auto_179920 ?auto_179925 ) ) ( ON ?auto_179920 ?auto_179921 ) ( ON ?auto_179919 ?auto_179920 ) ( CLEAR ?auto_179917 ) ( ON ?auto_179918 ?auto_179919 ) ( CLEAR ?auto_179918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179924 ?auto_179925 ?auto_179923 ?auto_179922 ?auto_179921 ?auto_179920 ?auto_179919 )
      ( MAKE-6PILE ?auto_179917 ?auto_179918 ?auto_179919 ?auto_179920 ?auto_179921 ?auto_179922 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179926 - BLOCK
      ?auto_179927 - BLOCK
      ?auto_179928 - BLOCK
      ?auto_179929 - BLOCK
      ?auto_179930 - BLOCK
      ?auto_179931 - BLOCK
    )
    :vars
    (
      ?auto_179932 - BLOCK
      ?auto_179934 - BLOCK
      ?auto_179933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179926 ?auto_179927 ) ) ( not ( = ?auto_179926 ?auto_179928 ) ) ( not ( = ?auto_179926 ?auto_179929 ) ) ( not ( = ?auto_179926 ?auto_179930 ) ) ( not ( = ?auto_179926 ?auto_179931 ) ) ( not ( = ?auto_179927 ?auto_179928 ) ) ( not ( = ?auto_179927 ?auto_179929 ) ) ( not ( = ?auto_179927 ?auto_179930 ) ) ( not ( = ?auto_179927 ?auto_179931 ) ) ( not ( = ?auto_179928 ?auto_179929 ) ) ( not ( = ?auto_179928 ?auto_179930 ) ) ( not ( = ?auto_179928 ?auto_179931 ) ) ( not ( = ?auto_179929 ?auto_179930 ) ) ( not ( = ?auto_179929 ?auto_179931 ) ) ( not ( = ?auto_179930 ?auto_179931 ) ) ( ON ?auto_179931 ?auto_179932 ) ( not ( = ?auto_179926 ?auto_179932 ) ) ( not ( = ?auto_179927 ?auto_179932 ) ) ( not ( = ?auto_179928 ?auto_179932 ) ) ( not ( = ?auto_179929 ?auto_179932 ) ) ( not ( = ?auto_179930 ?auto_179932 ) ) ( not ( = ?auto_179931 ?auto_179932 ) ) ( ON ?auto_179930 ?auto_179931 ) ( ON-TABLE ?auto_179934 ) ( ON ?auto_179933 ?auto_179934 ) ( ON ?auto_179932 ?auto_179933 ) ( not ( = ?auto_179934 ?auto_179933 ) ) ( not ( = ?auto_179934 ?auto_179932 ) ) ( not ( = ?auto_179934 ?auto_179931 ) ) ( not ( = ?auto_179934 ?auto_179930 ) ) ( not ( = ?auto_179933 ?auto_179932 ) ) ( not ( = ?auto_179933 ?auto_179931 ) ) ( not ( = ?auto_179933 ?auto_179930 ) ) ( not ( = ?auto_179926 ?auto_179934 ) ) ( not ( = ?auto_179926 ?auto_179933 ) ) ( not ( = ?auto_179927 ?auto_179934 ) ) ( not ( = ?auto_179927 ?auto_179933 ) ) ( not ( = ?auto_179928 ?auto_179934 ) ) ( not ( = ?auto_179928 ?auto_179933 ) ) ( not ( = ?auto_179929 ?auto_179934 ) ) ( not ( = ?auto_179929 ?auto_179933 ) ) ( ON ?auto_179929 ?auto_179930 ) ( ON ?auto_179928 ?auto_179929 ) ( ON ?auto_179927 ?auto_179928 ) ( CLEAR ?auto_179927 ) ( HOLDING ?auto_179926 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179926 )
      ( MAKE-6PILE ?auto_179926 ?auto_179927 ?auto_179928 ?auto_179929 ?auto_179930 ?auto_179931 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179935 - BLOCK
      ?auto_179936 - BLOCK
      ?auto_179937 - BLOCK
      ?auto_179938 - BLOCK
      ?auto_179939 - BLOCK
      ?auto_179940 - BLOCK
    )
    :vars
    (
      ?auto_179943 - BLOCK
      ?auto_179942 - BLOCK
      ?auto_179941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179935 ?auto_179936 ) ) ( not ( = ?auto_179935 ?auto_179937 ) ) ( not ( = ?auto_179935 ?auto_179938 ) ) ( not ( = ?auto_179935 ?auto_179939 ) ) ( not ( = ?auto_179935 ?auto_179940 ) ) ( not ( = ?auto_179936 ?auto_179937 ) ) ( not ( = ?auto_179936 ?auto_179938 ) ) ( not ( = ?auto_179936 ?auto_179939 ) ) ( not ( = ?auto_179936 ?auto_179940 ) ) ( not ( = ?auto_179937 ?auto_179938 ) ) ( not ( = ?auto_179937 ?auto_179939 ) ) ( not ( = ?auto_179937 ?auto_179940 ) ) ( not ( = ?auto_179938 ?auto_179939 ) ) ( not ( = ?auto_179938 ?auto_179940 ) ) ( not ( = ?auto_179939 ?auto_179940 ) ) ( ON ?auto_179940 ?auto_179943 ) ( not ( = ?auto_179935 ?auto_179943 ) ) ( not ( = ?auto_179936 ?auto_179943 ) ) ( not ( = ?auto_179937 ?auto_179943 ) ) ( not ( = ?auto_179938 ?auto_179943 ) ) ( not ( = ?auto_179939 ?auto_179943 ) ) ( not ( = ?auto_179940 ?auto_179943 ) ) ( ON ?auto_179939 ?auto_179940 ) ( ON-TABLE ?auto_179942 ) ( ON ?auto_179941 ?auto_179942 ) ( ON ?auto_179943 ?auto_179941 ) ( not ( = ?auto_179942 ?auto_179941 ) ) ( not ( = ?auto_179942 ?auto_179943 ) ) ( not ( = ?auto_179942 ?auto_179940 ) ) ( not ( = ?auto_179942 ?auto_179939 ) ) ( not ( = ?auto_179941 ?auto_179943 ) ) ( not ( = ?auto_179941 ?auto_179940 ) ) ( not ( = ?auto_179941 ?auto_179939 ) ) ( not ( = ?auto_179935 ?auto_179942 ) ) ( not ( = ?auto_179935 ?auto_179941 ) ) ( not ( = ?auto_179936 ?auto_179942 ) ) ( not ( = ?auto_179936 ?auto_179941 ) ) ( not ( = ?auto_179937 ?auto_179942 ) ) ( not ( = ?auto_179937 ?auto_179941 ) ) ( not ( = ?auto_179938 ?auto_179942 ) ) ( not ( = ?auto_179938 ?auto_179941 ) ) ( ON ?auto_179938 ?auto_179939 ) ( ON ?auto_179937 ?auto_179938 ) ( ON ?auto_179936 ?auto_179937 ) ( ON ?auto_179935 ?auto_179936 ) ( CLEAR ?auto_179935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179942 ?auto_179941 ?auto_179943 ?auto_179940 ?auto_179939 ?auto_179938 ?auto_179937 ?auto_179936 )
      ( MAKE-6PILE ?auto_179935 ?auto_179936 ?auto_179937 ?auto_179938 ?auto_179939 ?auto_179940 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179946 - BLOCK
      ?auto_179947 - BLOCK
    )
    :vars
    (
      ?auto_179948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179948 ?auto_179947 ) ( CLEAR ?auto_179948 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179946 ) ( ON ?auto_179947 ?auto_179946 ) ( not ( = ?auto_179946 ?auto_179947 ) ) ( not ( = ?auto_179946 ?auto_179948 ) ) ( not ( = ?auto_179947 ?auto_179948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179948 ?auto_179947 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179949 - BLOCK
      ?auto_179950 - BLOCK
    )
    :vars
    (
      ?auto_179951 - BLOCK
      ?auto_179952 - BLOCK
      ?auto_179953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179951 ?auto_179950 ) ( CLEAR ?auto_179951 ) ( ON-TABLE ?auto_179949 ) ( ON ?auto_179950 ?auto_179949 ) ( not ( = ?auto_179949 ?auto_179950 ) ) ( not ( = ?auto_179949 ?auto_179951 ) ) ( not ( = ?auto_179950 ?auto_179951 ) ) ( HOLDING ?auto_179952 ) ( CLEAR ?auto_179953 ) ( not ( = ?auto_179949 ?auto_179952 ) ) ( not ( = ?auto_179949 ?auto_179953 ) ) ( not ( = ?auto_179950 ?auto_179952 ) ) ( not ( = ?auto_179950 ?auto_179953 ) ) ( not ( = ?auto_179951 ?auto_179952 ) ) ( not ( = ?auto_179951 ?auto_179953 ) ) ( not ( = ?auto_179952 ?auto_179953 ) ) )
    :subtasks
    ( ( !STACK ?auto_179952 ?auto_179953 )
      ( MAKE-2PILE ?auto_179949 ?auto_179950 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179954 - BLOCK
      ?auto_179955 - BLOCK
    )
    :vars
    (
      ?auto_179957 - BLOCK
      ?auto_179958 - BLOCK
      ?auto_179956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179957 ?auto_179955 ) ( ON-TABLE ?auto_179954 ) ( ON ?auto_179955 ?auto_179954 ) ( not ( = ?auto_179954 ?auto_179955 ) ) ( not ( = ?auto_179954 ?auto_179957 ) ) ( not ( = ?auto_179955 ?auto_179957 ) ) ( CLEAR ?auto_179958 ) ( not ( = ?auto_179954 ?auto_179956 ) ) ( not ( = ?auto_179954 ?auto_179958 ) ) ( not ( = ?auto_179955 ?auto_179956 ) ) ( not ( = ?auto_179955 ?auto_179958 ) ) ( not ( = ?auto_179957 ?auto_179956 ) ) ( not ( = ?auto_179957 ?auto_179958 ) ) ( not ( = ?auto_179956 ?auto_179958 ) ) ( ON ?auto_179956 ?auto_179957 ) ( CLEAR ?auto_179956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179954 ?auto_179955 ?auto_179957 )
      ( MAKE-2PILE ?auto_179954 ?auto_179955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179959 - BLOCK
      ?auto_179960 - BLOCK
    )
    :vars
    (
      ?auto_179961 - BLOCK
      ?auto_179962 - BLOCK
      ?auto_179963 - BLOCK
      ?auto_179964 - BLOCK
      ?auto_179966 - BLOCK
      ?auto_179967 - BLOCK
      ?auto_179965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179961 ?auto_179960 ) ( ON-TABLE ?auto_179959 ) ( ON ?auto_179960 ?auto_179959 ) ( not ( = ?auto_179959 ?auto_179960 ) ) ( not ( = ?auto_179959 ?auto_179961 ) ) ( not ( = ?auto_179960 ?auto_179961 ) ) ( not ( = ?auto_179959 ?auto_179962 ) ) ( not ( = ?auto_179959 ?auto_179963 ) ) ( not ( = ?auto_179960 ?auto_179962 ) ) ( not ( = ?auto_179960 ?auto_179963 ) ) ( not ( = ?auto_179961 ?auto_179962 ) ) ( not ( = ?auto_179961 ?auto_179963 ) ) ( not ( = ?auto_179962 ?auto_179963 ) ) ( ON ?auto_179962 ?auto_179961 ) ( CLEAR ?auto_179962 ) ( HOLDING ?auto_179963 ) ( CLEAR ?auto_179964 ) ( ON-TABLE ?auto_179966 ) ( ON ?auto_179967 ?auto_179966 ) ( ON ?auto_179965 ?auto_179967 ) ( ON ?auto_179964 ?auto_179965 ) ( not ( = ?auto_179966 ?auto_179967 ) ) ( not ( = ?auto_179966 ?auto_179965 ) ) ( not ( = ?auto_179966 ?auto_179964 ) ) ( not ( = ?auto_179966 ?auto_179963 ) ) ( not ( = ?auto_179967 ?auto_179965 ) ) ( not ( = ?auto_179967 ?auto_179964 ) ) ( not ( = ?auto_179967 ?auto_179963 ) ) ( not ( = ?auto_179965 ?auto_179964 ) ) ( not ( = ?auto_179965 ?auto_179963 ) ) ( not ( = ?auto_179964 ?auto_179963 ) ) ( not ( = ?auto_179959 ?auto_179964 ) ) ( not ( = ?auto_179959 ?auto_179966 ) ) ( not ( = ?auto_179959 ?auto_179967 ) ) ( not ( = ?auto_179959 ?auto_179965 ) ) ( not ( = ?auto_179960 ?auto_179964 ) ) ( not ( = ?auto_179960 ?auto_179966 ) ) ( not ( = ?auto_179960 ?auto_179967 ) ) ( not ( = ?auto_179960 ?auto_179965 ) ) ( not ( = ?auto_179961 ?auto_179964 ) ) ( not ( = ?auto_179961 ?auto_179966 ) ) ( not ( = ?auto_179961 ?auto_179967 ) ) ( not ( = ?auto_179961 ?auto_179965 ) ) ( not ( = ?auto_179962 ?auto_179964 ) ) ( not ( = ?auto_179962 ?auto_179966 ) ) ( not ( = ?auto_179962 ?auto_179967 ) ) ( not ( = ?auto_179962 ?auto_179965 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179966 ?auto_179967 ?auto_179965 ?auto_179964 ?auto_179963 )
      ( MAKE-2PILE ?auto_179959 ?auto_179960 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179968 - BLOCK
      ?auto_179969 - BLOCK
    )
    :vars
    (
      ?auto_179974 - BLOCK
      ?auto_179976 - BLOCK
      ?auto_179973 - BLOCK
      ?auto_179972 - BLOCK
      ?auto_179970 - BLOCK
      ?auto_179971 - BLOCK
      ?auto_179975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179974 ?auto_179969 ) ( ON-TABLE ?auto_179968 ) ( ON ?auto_179969 ?auto_179968 ) ( not ( = ?auto_179968 ?auto_179969 ) ) ( not ( = ?auto_179968 ?auto_179974 ) ) ( not ( = ?auto_179969 ?auto_179974 ) ) ( not ( = ?auto_179968 ?auto_179976 ) ) ( not ( = ?auto_179968 ?auto_179973 ) ) ( not ( = ?auto_179969 ?auto_179976 ) ) ( not ( = ?auto_179969 ?auto_179973 ) ) ( not ( = ?auto_179974 ?auto_179976 ) ) ( not ( = ?auto_179974 ?auto_179973 ) ) ( not ( = ?auto_179976 ?auto_179973 ) ) ( ON ?auto_179976 ?auto_179974 ) ( CLEAR ?auto_179972 ) ( ON-TABLE ?auto_179970 ) ( ON ?auto_179971 ?auto_179970 ) ( ON ?auto_179975 ?auto_179971 ) ( ON ?auto_179972 ?auto_179975 ) ( not ( = ?auto_179970 ?auto_179971 ) ) ( not ( = ?auto_179970 ?auto_179975 ) ) ( not ( = ?auto_179970 ?auto_179972 ) ) ( not ( = ?auto_179970 ?auto_179973 ) ) ( not ( = ?auto_179971 ?auto_179975 ) ) ( not ( = ?auto_179971 ?auto_179972 ) ) ( not ( = ?auto_179971 ?auto_179973 ) ) ( not ( = ?auto_179975 ?auto_179972 ) ) ( not ( = ?auto_179975 ?auto_179973 ) ) ( not ( = ?auto_179972 ?auto_179973 ) ) ( not ( = ?auto_179968 ?auto_179972 ) ) ( not ( = ?auto_179968 ?auto_179970 ) ) ( not ( = ?auto_179968 ?auto_179971 ) ) ( not ( = ?auto_179968 ?auto_179975 ) ) ( not ( = ?auto_179969 ?auto_179972 ) ) ( not ( = ?auto_179969 ?auto_179970 ) ) ( not ( = ?auto_179969 ?auto_179971 ) ) ( not ( = ?auto_179969 ?auto_179975 ) ) ( not ( = ?auto_179974 ?auto_179972 ) ) ( not ( = ?auto_179974 ?auto_179970 ) ) ( not ( = ?auto_179974 ?auto_179971 ) ) ( not ( = ?auto_179974 ?auto_179975 ) ) ( not ( = ?auto_179976 ?auto_179972 ) ) ( not ( = ?auto_179976 ?auto_179970 ) ) ( not ( = ?auto_179976 ?auto_179971 ) ) ( not ( = ?auto_179976 ?auto_179975 ) ) ( ON ?auto_179973 ?auto_179976 ) ( CLEAR ?auto_179973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179968 ?auto_179969 ?auto_179974 ?auto_179976 )
      ( MAKE-2PILE ?auto_179968 ?auto_179969 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179977 - BLOCK
      ?auto_179978 - BLOCK
    )
    :vars
    (
      ?auto_179982 - BLOCK
      ?auto_179984 - BLOCK
      ?auto_179983 - BLOCK
      ?auto_179979 - BLOCK
      ?auto_179981 - BLOCK
      ?auto_179980 - BLOCK
      ?auto_179985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179982 ?auto_179978 ) ( ON-TABLE ?auto_179977 ) ( ON ?auto_179978 ?auto_179977 ) ( not ( = ?auto_179977 ?auto_179978 ) ) ( not ( = ?auto_179977 ?auto_179982 ) ) ( not ( = ?auto_179978 ?auto_179982 ) ) ( not ( = ?auto_179977 ?auto_179984 ) ) ( not ( = ?auto_179977 ?auto_179983 ) ) ( not ( = ?auto_179978 ?auto_179984 ) ) ( not ( = ?auto_179978 ?auto_179983 ) ) ( not ( = ?auto_179982 ?auto_179984 ) ) ( not ( = ?auto_179982 ?auto_179983 ) ) ( not ( = ?auto_179984 ?auto_179983 ) ) ( ON ?auto_179984 ?auto_179982 ) ( ON-TABLE ?auto_179979 ) ( ON ?auto_179981 ?auto_179979 ) ( ON ?auto_179980 ?auto_179981 ) ( not ( = ?auto_179979 ?auto_179981 ) ) ( not ( = ?auto_179979 ?auto_179980 ) ) ( not ( = ?auto_179979 ?auto_179985 ) ) ( not ( = ?auto_179979 ?auto_179983 ) ) ( not ( = ?auto_179981 ?auto_179980 ) ) ( not ( = ?auto_179981 ?auto_179985 ) ) ( not ( = ?auto_179981 ?auto_179983 ) ) ( not ( = ?auto_179980 ?auto_179985 ) ) ( not ( = ?auto_179980 ?auto_179983 ) ) ( not ( = ?auto_179985 ?auto_179983 ) ) ( not ( = ?auto_179977 ?auto_179985 ) ) ( not ( = ?auto_179977 ?auto_179979 ) ) ( not ( = ?auto_179977 ?auto_179981 ) ) ( not ( = ?auto_179977 ?auto_179980 ) ) ( not ( = ?auto_179978 ?auto_179985 ) ) ( not ( = ?auto_179978 ?auto_179979 ) ) ( not ( = ?auto_179978 ?auto_179981 ) ) ( not ( = ?auto_179978 ?auto_179980 ) ) ( not ( = ?auto_179982 ?auto_179985 ) ) ( not ( = ?auto_179982 ?auto_179979 ) ) ( not ( = ?auto_179982 ?auto_179981 ) ) ( not ( = ?auto_179982 ?auto_179980 ) ) ( not ( = ?auto_179984 ?auto_179985 ) ) ( not ( = ?auto_179984 ?auto_179979 ) ) ( not ( = ?auto_179984 ?auto_179981 ) ) ( not ( = ?auto_179984 ?auto_179980 ) ) ( ON ?auto_179983 ?auto_179984 ) ( CLEAR ?auto_179983 ) ( HOLDING ?auto_179985 ) ( CLEAR ?auto_179980 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179979 ?auto_179981 ?auto_179980 ?auto_179985 )
      ( MAKE-2PILE ?auto_179977 ?auto_179978 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179986 - BLOCK
      ?auto_179987 - BLOCK
    )
    :vars
    (
      ?auto_179989 - BLOCK
      ?auto_179991 - BLOCK
      ?auto_179990 - BLOCK
      ?auto_179992 - BLOCK
      ?auto_179988 - BLOCK
      ?auto_179993 - BLOCK
      ?auto_179994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179989 ?auto_179987 ) ( ON-TABLE ?auto_179986 ) ( ON ?auto_179987 ?auto_179986 ) ( not ( = ?auto_179986 ?auto_179987 ) ) ( not ( = ?auto_179986 ?auto_179989 ) ) ( not ( = ?auto_179987 ?auto_179989 ) ) ( not ( = ?auto_179986 ?auto_179991 ) ) ( not ( = ?auto_179986 ?auto_179990 ) ) ( not ( = ?auto_179987 ?auto_179991 ) ) ( not ( = ?auto_179987 ?auto_179990 ) ) ( not ( = ?auto_179989 ?auto_179991 ) ) ( not ( = ?auto_179989 ?auto_179990 ) ) ( not ( = ?auto_179991 ?auto_179990 ) ) ( ON ?auto_179991 ?auto_179989 ) ( ON-TABLE ?auto_179992 ) ( ON ?auto_179988 ?auto_179992 ) ( ON ?auto_179993 ?auto_179988 ) ( not ( = ?auto_179992 ?auto_179988 ) ) ( not ( = ?auto_179992 ?auto_179993 ) ) ( not ( = ?auto_179992 ?auto_179994 ) ) ( not ( = ?auto_179992 ?auto_179990 ) ) ( not ( = ?auto_179988 ?auto_179993 ) ) ( not ( = ?auto_179988 ?auto_179994 ) ) ( not ( = ?auto_179988 ?auto_179990 ) ) ( not ( = ?auto_179993 ?auto_179994 ) ) ( not ( = ?auto_179993 ?auto_179990 ) ) ( not ( = ?auto_179994 ?auto_179990 ) ) ( not ( = ?auto_179986 ?auto_179994 ) ) ( not ( = ?auto_179986 ?auto_179992 ) ) ( not ( = ?auto_179986 ?auto_179988 ) ) ( not ( = ?auto_179986 ?auto_179993 ) ) ( not ( = ?auto_179987 ?auto_179994 ) ) ( not ( = ?auto_179987 ?auto_179992 ) ) ( not ( = ?auto_179987 ?auto_179988 ) ) ( not ( = ?auto_179987 ?auto_179993 ) ) ( not ( = ?auto_179989 ?auto_179994 ) ) ( not ( = ?auto_179989 ?auto_179992 ) ) ( not ( = ?auto_179989 ?auto_179988 ) ) ( not ( = ?auto_179989 ?auto_179993 ) ) ( not ( = ?auto_179991 ?auto_179994 ) ) ( not ( = ?auto_179991 ?auto_179992 ) ) ( not ( = ?auto_179991 ?auto_179988 ) ) ( not ( = ?auto_179991 ?auto_179993 ) ) ( ON ?auto_179990 ?auto_179991 ) ( CLEAR ?auto_179993 ) ( ON ?auto_179994 ?auto_179990 ) ( CLEAR ?auto_179994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179986 ?auto_179987 ?auto_179989 ?auto_179991 ?auto_179990 )
      ( MAKE-2PILE ?auto_179986 ?auto_179987 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179995 - BLOCK
      ?auto_179996 - BLOCK
    )
    :vars
    (
      ?auto_180000 - BLOCK
      ?auto_180001 - BLOCK
      ?auto_180003 - BLOCK
      ?auto_179997 - BLOCK
      ?auto_179998 - BLOCK
      ?auto_180002 - BLOCK
      ?auto_179999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180000 ?auto_179996 ) ( ON-TABLE ?auto_179995 ) ( ON ?auto_179996 ?auto_179995 ) ( not ( = ?auto_179995 ?auto_179996 ) ) ( not ( = ?auto_179995 ?auto_180000 ) ) ( not ( = ?auto_179996 ?auto_180000 ) ) ( not ( = ?auto_179995 ?auto_180001 ) ) ( not ( = ?auto_179995 ?auto_180003 ) ) ( not ( = ?auto_179996 ?auto_180001 ) ) ( not ( = ?auto_179996 ?auto_180003 ) ) ( not ( = ?auto_180000 ?auto_180001 ) ) ( not ( = ?auto_180000 ?auto_180003 ) ) ( not ( = ?auto_180001 ?auto_180003 ) ) ( ON ?auto_180001 ?auto_180000 ) ( ON-TABLE ?auto_179997 ) ( ON ?auto_179998 ?auto_179997 ) ( not ( = ?auto_179997 ?auto_179998 ) ) ( not ( = ?auto_179997 ?auto_180002 ) ) ( not ( = ?auto_179997 ?auto_179999 ) ) ( not ( = ?auto_179997 ?auto_180003 ) ) ( not ( = ?auto_179998 ?auto_180002 ) ) ( not ( = ?auto_179998 ?auto_179999 ) ) ( not ( = ?auto_179998 ?auto_180003 ) ) ( not ( = ?auto_180002 ?auto_179999 ) ) ( not ( = ?auto_180002 ?auto_180003 ) ) ( not ( = ?auto_179999 ?auto_180003 ) ) ( not ( = ?auto_179995 ?auto_179999 ) ) ( not ( = ?auto_179995 ?auto_179997 ) ) ( not ( = ?auto_179995 ?auto_179998 ) ) ( not ( = ?auto_179995 ?auto_180002 ) ) ( not ( = ?auto_179996 ?auto_179999 ) ) ( not ( = ?auto_179996 ?auto_179997 ) ) ( not ( = ?auto_179996 ?auto_179998 ) ) ( not ( = ?auto_179996 ?auto_180002 ) ) ( not ( = ?auto_180000 ?auto_179999 ) ) ( not ( = ?auto_180000 ?auto_179997 ) ) ( not ( = ?auto_180000 ?auto_179998 ) ) ( not ( = ?auto_180000 ?auto_180002 ) ) ( not ( = ?auto_180001 ?auto_179999 ) ) ( not ( = ?auto_180001 ?auto_179997 ) ) ( not ( = ?auto_180001 ?auto_179998 ) ) ( not ( = ?auto_180001 ?auto_180002 ) ) ( ON ?auto_180003 ?auto_180001 ) ( ON ?auto_179999 ?auto_180003 ) ( CLEAR ?auto_179999 ) ( HOLDING ?auto_180002 ) ( CLEAR ?auto_179998 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179997 ?auto_179998 ?auto_180002 )
      ( MAKE-2PILE ?auto_179995 ?auto_179996 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180004 - BLOCK
      ?auto_180005 - BLOCK
    )
    :vars
    (
      ?auto_180012 - BLOCK
      ?auto_180008 - BLOCK
      ?auto_180009 - BLOCK
      ?auto_180010 - BLOCK
      ?auto_180006 - BLOCK
      ?auto_180011 - BLOCK
      ?auto_180007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180012 ?auto_180005 ) ( ON-TABLE ?auto_180004 ) ( ON ?auto_180005 ?auto_180004 ) ( not ( = ?auto_180004 ?auto_180005 ) ) ( not ( = ?auto_180004 ?auto_180012 ) ) ( not ( = ?auto_180005 ?auto_180012 ) ) ( not ( = ?auto_180004 ?auto_180008 ) ) ( not ( = ?auto_180004 ?auto_180009 ) ) ( not ( = ?auto_180005 ?auto_180008 ) ) ( not ( = ?auto_180005 ?auto_180009 ) ) ( not ( = ?auto_180012 ?auto_180008 ) ) ( not ( = ?auto_180012 ?auto_180009 ) ) ( not ( = ?auto_180008 ?auto_180009 ) ) ( ON ?auto_180008 ?auto_180012 ) ( ON-TABLE ?auto_180010 ) ( ON ?auto_180006 ?auto_180010 ) ( not ( = ?auto_180010 ?auto_180006 ) ) ( not ( = ?auto_180010 ?auto_180011 ) ) ( not ( = ?auto_180010 ?auto_180007 ) ) ( not ( = ?auto_180010 ?auto_180009 ) ) ( not ( = ?auto_180006 ?auto_180011 ) ) ( not ( = ?auto_180006 ?auto_180007 ) ) ( not ( = ?auto_180006 ?auto_180009 ) ) ( not ( = ?auto_180011 ?auto_180007 ) ) ( not ( = ?auto_180011 ?auto_180009 ) ) ( not ( = ?auto_180007 ?auto_180009 ) ) ( not ( = ?auto_180004 ?auto_180007 ) ) ( not ( = ?auto_180004 ?auto_180010 ) ) ( not ( = ?auto_180004 ?auto_180006 ) ) ( not ( = ?auto_180004 ?auto_180011 ) ) ( not ( = ?auto_180005 ?auto_180007 ) ) ( not ( = ?auto_180005 ?auto_180010 ) ) ( not ( = ?auto_180005 ?auto_180006 ) ) ( not ( = ?auto_180005 ?auto_180011 ) ) ( not ( = ?auto_180012 ?auto_180007 ) ) ( not ( = ?auto_180012 ?auto_180010 ) ) ( not ( = ?auto_180012 ?auto_180006 ) ) ( not ( = ?auto_180012 ?auto_180011 ) ) ( not ( = ?auto_180008 ?auto_180007 ) ) ( not ( = ?auto_180008 ?auto_180010 ) ) ( not ( = ?auto_180008 ?auto_180006 ) ) ( not ( = ?auto_180008 ?auto_180011 ) ) ( ON ?auto_180009 ?auto_180008 ) ( ON ?auto_180007 ?auto_180009 ) ( CLEAR ?auto_180006 ) ( ON ?auto_180011 ?auto_180007 ) ( CLEAR ?auto_180011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180004 ?auto_180005 ?auto_180012 ?auto_180008 ?auto_180009 ?auto_180007 )
      ( MAKE-2PILE ?auto_180004 ?auto_180005 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180013 - BLOCK
      ?auto_180014 - BLOCK
    )
    :vars
    (
      ?auto_180020 - BLOCK
      ?auto_180016 - BLOCK
      ?auto_180019 - BLOCK
      ?auto_180015 - BLOCK
      ?auto_180018 - BLOCK
      ?auto_180021 - BLOCK
      ?auto_180017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180020 ?auto_180014 ) ( ON-TABLE ?auto_180013 ) ( ON ?auto_180014 ?auto_180013 ) ( not ( = ?auto_180013 ?auto_180014 ) ) ( not ( = ?auto_180013 ?auto_180020 ) ) ( not ( = ?auto_180014 ?auto_180020 ) ) ( not ( = ?auto_180013 ?auto_180016 ) ) ( not ( = ?auto_180013 ?auto_180019 ) ) ( not ( = ?auto_180014 ?auto_180016 ) ) ( not ( = ?auto_180014 ?auto_180019 ) ) ( not ( = ?auto_180020 ?auto_180016 ) ) ( not ( = ?auto_180020 ?auto_180019 ) ) ( not ( = ?auto_180016 ?auto_180019 ) ) ( ON ?auto_180016 ?auto_180020 ) ( ON-TABLE ?auto_180015 ) ( not ( = ?auto_180015 ?auto_180018 ) ) ( not ( = ?auto_180015 ?auto_180021 ) ) ( not ( = ?auto_180015 ?auto_180017 ) ) ( not ( = ?auto_180015 ?auto_180019 ) ) ( not ( = ?auto_180018 ?auto_180021 ) ) ( not ( = ?auto_180018 ?auto_180017 ) ) ( not ( = ?auto_180018 ?auto_180019 ) ) ( not ( = ?auto_180021 ?auto_180017 ) ) ( not ( = ?auto_180021 ?auto_180019 ) ) ( not ( = ?auto_180017 ?auto_180019 ) ) ( not ( = ?auto_180013 ?auto_180017 ) ) ( not ( = ?auto_180013 ?auto_180015 ) ) ( not ( = ?auto_180013 ?auto_180018 ) ) ( not ( = ?auto_180013 ?auto_180021 ) ) ( not ( = ?auto_180014 ?auto_180017 ) ) ( not ( = ?auto_180014 ?auto_180015 ) ) ( not ( = ?auto_180014 ?auto_180018 ) ) ( not ( = ?auto_180014 ?auto_180021 ) ) ( not ( = ?auto_180020 ?auto_180017 ) ) ( not ( = ?auto_180020 ?auto_180015 ) ) ( not ( = ?auto_180020 ?auto_180018 ) ) ( not ( = ?auto_180020 ?auto_180021 ) ) ( not ( = ?auto_180016 ?auto_180017 ) ) ( not ( = ?auto_180016 ?auto_180015 ) ) ( not ( = ?auto_180016 ?auto_180018 ) ) ( not ( = ?auto_180016 ?auto_180021 ) ) ( ON ?auto_180019 ?auto_180016 ) ( ON ?auto_180017 ?auto_180019 ) ( ON ?auto_180021 ?auto_180017 ) ( CLEAR ?auto_180021 ) ( HOLDING ?auto_180018 ) ( CLEAR ?auto_180015 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180015 ?auto_180018 )
      ( MAKE-2PILE ?auto_180013 ?auto_180014 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180022 - BLOCK
      ?auto_180023 - BLOCK
    )
    :vars
    (
      ?auto_180030 - BLOCK
      ?auto_180027 - BLOCK
      ?auto_180029 - BLOCK
      ?auto_180028 - BLOCK
      ?auto_180024 - BLOCK
      ?auto_180025 - BLOCK
      ?auto_180026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180030 ?auto_180023 ) ( ON-TABLE ?auto_180022 ) ( ON ?auto_180023 ?auto_180022 ) ( not ( = ?auto_180022 ?auto_180023 ) ) ( not ( = ?auto_180022 ?auto_180030 ) ) ( not ( = ?auto_180023 ?auto_180030 ) ) ( not ( = ?auto_180022 ?auto_180027 ) ) ( not ( = ?auto_180022 ?auto_180029 ) ) ( not ( = ?auto_180023 ?auto_180027 ) ) ( not ( = ?auto_180023 ?auto_180029 ) ) ( not ( = ?auto_180030 ?auto_180027 ) ) ( not ( = ?auto_180030 ?auto_180029 ) ) ( not ( = ?auto_180027 ?auto_180029 ) ) ( ON ?auto_180027 ?auto_180030 ) ( ON-TABLE ?auto_180028 ) ( not ( = ?auto_180028 ?auto_180024 ) ) ( not ( = ?auto_180028 ?auto_180025 ) ) ( not ( = ?auto_180028 ?auto_180026 ) ) ( not ( = ?auto_180028 ?auto_180029 ) ) ( not ( = ?auto_180024 ?auto_180025 ) ) ( not ( = ?auto_180024 ?auto_180026 ) ) ( not ( = ?auto_180024 ?auto_180029 ) ) ( not ( = ?auto_180025 ?auto_180026 ) ) ( not ( = ?auto_180025 ?auto_180029 ) ) ( not ( = ?auto_180026 ?auto_180029 ) ) ( not ( = ?auto_180022 ?auto_180026 ) ) ( not ( = ?auto_180022 ?auto_180028 ) ) ( not ( = ?auto_180022 ?auto_180024 ) ) ( not ( = ?auto_180022 ?auto_180025 ) ) ( not ( = ?auto_180023 ?auto_180026 ) ) ( not ( = ?auto_180023 ?auto_180028 ) ) ( not ( = ?auto_180023 ?auto_180024 ) ) ( not ( = ?auto_180023 ?auto_180025 ) ) ( not ( = ?auto_180030 ?auto_180026 ) ) ( not ( = ?auto_180030 ?auto_180028 ) ) ( not ( = ?auto_180030 ?auto_180024 ) ) ( not ( = ?auto_180030 ?auto_180025 ) ) ( not ( = ?auto_180027 ?auto_180026 ) ) ( not ( = ?auto_180027 ?auto_180028 ) ) ( not ( = ?auto_180027 ?auto_180024 ) ) ( not ( = ?auto_180027 ?auto_180025 ) ) ( ON ?auto_180029 ?auto_180027 ) ( ON ?auto_180026 ?auto_180029 ) ( ON ?auto_180025 ?auto_180026 ) ( CLEAR ?auto_180028 ) ( ON ?auto_180024 ?auto_180025 ) ( CLEAR ?auto_180024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180022 ?auto_180023 ?auto_180030 ?auto_180027 ?auto_180029 ?auto_180026 ?auto_180025 )
      ( MAKE-2PILE ?auto_180022 ?auto_180023 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180031 - BLOCK
      ?auto_180032 - BLOCK
    )
    :vars
    (
      ?auto_180034 - BLOCK
      ?auto_180036 - BLOCK
      ?auto_180033 - BLOCK
      ?auto_180035 - BLOCK
      ?auto_180037 - BLOCK
      ?auto_180038 - BLOCK
      ?auto_180039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180034 ?auto_180032 ) ( ON-TABLE ?auto_180031 ) ( ON ?auto_180032 ?auto_180031 ) ( not ( = ?auto_180031 ?auto_180032 ) ) ( not ( = ?auto_180031 ?auto_180034 ) ) ( not ( = ?auto_180032 ?auto_180034 ) ) ( not ( = ?auto_180031 ?auto_180036 ) ) ( not ( = ?auto_180031 ?auto_180033 ) ) ( not ( = ?auto_180032 ?auto_180036 ) ) ( not ( = ?auto_180032 ?auto_180033 ) ) ( not ( = ?auto_180034 ?auto_180036 ) ) ( not ( = ?auto_180034 ?auto_180033 ) ) ( not ( = ?auto_180036 ?auto_180033 ) ) ( ON ?auto_180036 ?auto_180034 ) ( not ( = ?auto_180035 ?auto_180037 ) ) ( not ( = ?auto_180035 ?auto_180038 ) ) ( not ( = ?auto_180035 ?auto_180039 ) ) ( not ( = ?auto_180035 ?auto_180033 ) ) ( not ( = ?auto_180037 ?auto_180038 ) ) ( not ( = ?auto_180037 ?auto_180039 ) ) ( not ( = ?auto_180037 ?auto_180033 ) ) ( not ( = ?auto_180038 ?auto_180039 ) ) ( not ( = ?auto_180038 ?auto_180033 ) ) ( not ( = ?auto_180039 ?auto_180033 ) ) ( not ( = ?auto_180031 ?auto_180039 ) ) ( not ( = ?auto_180031 ?auto_180035 ) ) ( not ( = ?auto_180031 ?auto_180037 ) ) ( not ( = ?auto_180031 ?auto_180038 ) ) ( not ( = ?auto_180032 ?auto_180039 ) ) ( not ( = ?auto_180032 ?auto_180035 ) ) ( not ( = ?auto_180032 ?auto_180037 ) ) ( not ( = ?auto_180032 ?auto_180038 ) ) ( not ( = ?auto_180034 ?auto_180039 ) ) ( not ( = ?auto_180034 ?auto_180035 ) ) ( not ( = ?auto_180034 ?auto_180037 ) ) ( not ( = ?auto_180034 ?auto_180038 ) ) ( not ( = ?auto_180036 ?auto_180039 ) ) ( not ( = ?auto_180036 ?auto_180035 ) ) ( not ( = ?auto_180036 ?auto_180037 ) ) ( not ( = ?auto_180036 ?auto_180038 ) ) ( ON ?auto_180033 ?auto_180036 ) ( ON ?auto_180039 ?auto_180033 ) ( ON ?auto_180038 ?auto_180039 ) ( ON ?auto_180037 ?auto_180038 ) ( CLEAR ?auto_180037 ) ( HOLDING ?auto_180035 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180035 )
      ( MAKE-2PILE ?auto_180031 ?auto_180032 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180040 - BLOCK
      ?auto_180041 - BLOCK
    )
    :vars
    (
      ?auto_180045 - BLOCK
      ?auto_180043 - BLOCK
      ?auto_180044 - BLOCK
      ?auto_180048 - BLOCK
      ?auto_180046 - BLOCK
      ?auto_180047 - BLOCK
      ?auto_180042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180045 ?auto_180041 ) ( ON-TABLE ?auto_180040 ) ( ON ?auto_180041 ?auto_180040 ) ( not ( = ?auto_180040 ?auto_180041 ) ) ( not ( = ?auto_180040 ?auto_180045 ) ) ( not ( = ?auto_180041 ?auto_180045 ) ) ( not ( = ?auto_180040 ?auto_180043 ) ) ( not ( = ?auto_180040 ?auto_180044 ) ) ( not ( = ?auto_180041 ?auto_180043 ) ) ( not ( = ?auto_180041 ?auto_180044 ) ) ( not ( = ?auto_180045 ?auto_180043 ) ) ( not ( = ?auto_180045 ?auto_180044 ) ) ( not ( = ?auto_180043 ?auto_180044 ) ) ( ON ?auto_180043 ?auto_180045 ) ( not ( = ?auto_180048 ?auto_180046 ) ) ( not ( = ?auto_180048 ?auto_180047 ) ) ( not ( = ?auto_180048 ?auto_180042 ) ) ( not ( = ?auto_180048 ?auto_180044 ) ) ( not ( = ?auto_180046 ?auto_180047 ) ) ( not ( = ?auto_180046 ?auto_180042 ) ) ( not ( = ?auto_180046 ?auto_180044 ) ) ( not ( = ?auto_180047 ?auto_180042 ) ) ( not ( = ?auto_180047 ?auto_180044 ) ) ( not ( = ?auto_180042 ?auto_180044 ) ) ( not ( = ?auto_180040 ?auto_180042 ) ) ( not ( = ?auto_180040 ?auto_180048 ) ) ( not ( = ?auto_180040 ?auto_180046 ) ) ( not ( = ?auto_180040 ?auto_180047 ) ) ( not ( = ?auto_180041 ?auto_180042 ) ) ( not ( = ?auto_180041 ?auto_180048 ) ) ( not ( = ?auto_180041 ?auto_180046 ) ) ( not ( = ?auto_180041 ?auto_180047 ) ) ( not ( = ?auto_180045 ?auto_180042 ) ) ( not ( = ?auto_180045 ?auto_180048 ) ) ( not ( = ?auto_180045 ?auto_180046 ) ) ( not ( = ?auto_180045 ?auto_180047 ) ) ( not ( = ?auto_180043 ?auto_180042 ) ) ( not ( = ?auto_180043 ?auto_180048 ) ) ( not ( = ?auto_180043 ?auto_180046 ) ) ( not ( = ?auto_180043 ?auto_180047 ) ) ( ON ?auto_180044 ?auto_180043 ) ( ON ?auto_180042 ?auto_180044 ) ( ON ?auto_180047 ?auto_180042 ) ( ON ?auto_180046 ?auto_180047 ) ( ON ?auto_180048 ?auto_180046 ) ( CLEAR ?auto_180048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180040 ?auto_180041 ?auto_180045 ?auto_180043 ?auto_180044 ?auto_180042 ?auto_180047 ?auto_180046 )
      ( MAKE-2PILE ?auto_180040 ?auto_180041 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180056 - BLOCK
      ?auto_180057 - BLOCK
      ?auto_180058 - BLOCK
      ?auto_180059 - BLOCK
      ?auto_180060 - BLOCK
      ?auto_180061 - BLOCK
      ?auto_180062 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_180062 ) ( CLEAR ?auto_180061 ) ( ON-TABLE ?auto_180056 ) ( ON ?auto_180057 ?auto_180056 ) ( ON ?auto_180058 ?auto_180057 ) ( ON ?auto_180059 ?auto_180058 ) ( ON ?auto_180060 ?auto_180059 ) ( ON ?auto_180061 ?auto_180060 ) ( not ( = ?auto_180056 ?auto_180057 ) ) ( not ( = ?auto_180056 ?auto_180058 ) ) ( not ( = ?auto_180056 ?auto_180059 ) ) ( not ( = ?auto_180056 ?auto_180060 ) ) ( not ( = ?auto_180056 ?auto_180061 ) ) ( not ( = ?auto_180056 ?auto_180062 ) ) ( not ( = ?auto_180057 ?auto_180058 ) ) ( not ( = ?auto_180057 ?auto_180059 ) ) ( not ( = ?auto_180057 ?auto_180060 ) ) ( not ( = ?auto_180057 ?auto_180061 ) ) ( not ( = ?auto_180057 ?auto_180062 ) ) ( not ( = ?auto_180058 ?auto_180059 ) ) ( not ( = ?auto_180058 ?auto_180060 ) ) ( not ( = ?auto_180058 ?auto_180061 ) ) ( not ( = ?auto_180058 ?auto_180062 ) ) ( not ( = ?auto_180059 ?auto_180060 ) ) ( not ( = ?auto_180059 ?auto_180061 ) ) ( not ( = ?auto_180059 ?auto_180062 ) ) ( not ( = ?auto_180060 ?auto_180061 ) ) ( not ( = ?auto_180060 ?auto_180062 ) ) ( not ( = ?auto_180061 ?auto_180062 ) ) )
    :subtasks
    ( ( !STACK ?auto_180062 ?auto_180061 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180063 - BLOCK
      ?auto_180064 - BLOCK
      ?auto_180065 - BLOCK
      ?auto_180066 - BLOCK
      ?auto_180067 - BLOCK
      ?auto_180068 - BLOCK
      ?auto_180069 - BLOCK
    )
    :vars
    (
      ?auto_180070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180068 ) ( ON-TABLE ?auto_180063 ) ( ON ?auto_180064 ?auto_180063 ) ( ON ?auto_180065 ?auto_180064 ) ( ON ?auto_180066 ?auto_180065 ) ( ON ?auto_180067 ?auto_180066 ) ( ON ?auto_180068 ?auto_180067 ) ( not ( = ?auto_180063 ?auto_180064 ) ) ( not ( = ?auto_180063 ?auto_180065 ) ) ( not ( = ?auto_180063 ?auto_180066 ) ) ( not ( = ?auto_180063 ?auto_180067 ) ) ( not ( = ?auto_180063 ?auto_180068 ) ) ( not ( = ?auto_180063 ?auto_180069 ) ) ( not ( = ?auto_180064 ?auto_180065 ) ) ( not ( = ?auto_180064 ?auto_180066 ) ) ( not ( = ?auto_180064 ?auto_180067 ) ) ( not ( = ?auto_180064 ?auto_180068 ) ) ( not ( = ?auto_180064 ?auto_180069 ) ) ( not ( = ?auto_180065 ?auto_180066 ) ) ( not ( = ?auto_180065 ?auto_180067 ) ) ( not ( = ?auto_180065 ?auto_180068 ) ) ( not ( = ?auto_180065 ?auto_180069 ) ) ( not ( = ?auto_180066 ?auto_180067 ) ) ( not ( = ?auto_180066 ?auto_180068 ) ) ( not ( = ?auto_180066 ?auto_180069 ) ) ( not ( = ?auto_180067 ?auto_180068 ) ) ( not ( = ?auto_180067 ?auto_180069 ) ) ( not ( = ?auto_180068 ?auto_180069 ) ) ( ON ?auto_180069 ?auto_180070 ) ( CLEAR ?auto_180069 ) ( HAND-EMPTY ) ( not ( = ?auto_180063 ?auto_180070 ) ) ( not ( = ?auto_180064 ?auto_180070 ) ) ( not ( = ?auto_180065 ?auto_180070 ) ) ( not ( = ?auto_180066 ?auto_180070 ) ) ( not ( = ?auto_180067 ?auto_180070 ) ) ( not ( = ?auto_180068 ?auto_180070 ) ) ( not ( = ?auto_180069 ?auto_180070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180069 ?auto_180070 )
      ( MAKE-7PILE ?auto_180063 ?auto_180064 ?auto_180065 ?auto_180066 ?auto_180067 ?auto_180068 ?auto_180069 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180071 - BLOCK
      ?auto_180072 - BLOCK
      ?auto_180073 - BLOCK
      ?auto_180074 - BLOCK
      ?auto_180075 - BLOCK
      ?auto_180076 - BLOCK
      ?auto_180077 - BLOCK
    )
    :vars
    (
      ?auto_180078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180071 ) ( ON ?auto_180072 ?auto_180071 ) ( ON ?auto_180073 ?auto_180072 ) ( ON ?auto_180074 ?auto_180073 ) ( ON ?auto_180075 ?auto_180074 ) ( not ( = ?auto_180071 ?auto_180072 ) ) ( not ( = ?auto_180071 ?auto_180073 ) ) ( not ( = ?auto_180071 ?auto_180074 ) ) ( not ( = ?auto_180071 ?auto_180075 ) ) ( not ( = ?auto_180071 ?auto_180076 ) ) ( not ( = ?auto_180071 ?auto_180077 ) ) ( not ( = ?auto_180072 ?auto_180073 ) ) ( not ( = ?auto_180072 ?auto_180074 ) ) ( not ( = ?auto_180072 ?auto_180075 ) ) ( not ( = ?auto_180072 ?auto_180076 ) ) ( not ( = ?auto_180072 ?auto_180077 ) ) ( not ( = ?auto_180073 ?auto_180074 ) ) ( not ( = ?auto_180073 ?auto_180075 ) ) ( not ( = ?auto_180073 ?auto_180076 ) ) ( not ( = ?auto_180073 ?auto_180077 ) ) ( not ( = ?auto_180074 ?auto_180075 ) ) ( not ( = ?auto_180074 ?auto_180076 ) ) ( not ( = ?auto_180074 ?auto_180077 ) ) ( not ( = ?auto_180075 ?auto_180076 ) ) ( not ( = ?auto_180075 ?auto_180077 ) ) ( not ( = ?auto_180076 ?auto_180077 ) ) ( ON ?auto_180077 ?auto_180078 ) ( CLEAR ?auto_180077 ) ( not ( = ?auto_180071 ?auto_180078 ) ) ( not ( = ?auto_180072 ?auto_180078 ) ) ( not ( = ?auto_180073 ?auto_180078 ) ) ( not ( = ?auto_180074 ?auto_180078 ) ) ( not ( = ?auto_180075 ?auto_180078 ) ) ( not ( = ?auto_180076 ?auto_180078 ) ) ( not ( = ?auto_180077 ?auto_180078 ) ) ( HOLDING ?auto_180076 ) ( CLEAR ?auto_180075 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180071 ?auto_180072 ?auto_180073 ?auto_180074 ?auto_180075 ?auto_180076 )
      ( MAKE-7PILE ?auto_180071 ?auto_180072 ?auto_180073 ?auto_180074 ?auto_180075 ?auto_180076 ?auto_180077 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180079 - BLOCK
      ?auto_180080 - BLOCK
      ?auto_180081 - BLOCK
      ?auto_180082 - BLOCK
      ?auto_180083 - BLOCK
      ?auto_180084 - BLOCK
      ?auto_180085 - BLOCK
    )
    :vars
    (
      ?auto_180086 - BLOCK
      ?auto_180087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180079 ) ( ON ?auto_180080 ?auto_180079 ) ( ON ?auto_180081 ?auto_180080 ) ( ON ?auto_180082 ?auto_180081 ) ( ON ?auto_180083 ?auto_180082 ) ( not ( = ?auto_180079 ?auto_180080 ) ) ( not ( = ?auto_180079 ?auto_180081 ) ) ( not ( = ?auto_180079 ?auto_180082 ) ) ( not ( = ?auto_180079 ?auto_180083 ) ) ( not ( = ?auto_180079 ?auto_180084 ) ) ( not ( = ?auto_180079 ?auto_180085 ) ) ( not ( = ?auto_180080 ?auto_180081 ) ) ( not ( = ?auto_180080 ?auto_180082 ) ) ( not ( = ?auto_180080 ?auto_180083 ) ) ( not ( = ?auto_180080 ?auto_180084 ) ) ( not ( = ?auto_180080 ?auto_180085 ) ) ( not ( = ?auto_180081 ?auto_180082 ) ) ( not ( = ?auto_180081 ?auto_180083 ) ) ( not ( = ?auto_180081 ?auto_180084 ) ) ( not ( = ?auto_180081 ?auto_180085 ) ) ( not ( = ?auto_180082 ?auto_180083 ) ) ( not ( = ?auto_180082 ?auto_180084 ) ) ( not ( = ?auto_180082 ?auto_180085 ) ) ( not ( = ?auto_180083 ?auto_180084 ) ) ( not ( = ?auto_180083 ?auto_180085 ) ) ( not ( = ?auto_180084 ?auto_180085 ) ) ( ON ?auto_180085 ?auto_180086 ) ( not ( = ?auto_180079 ?auto_180086 ) ) ( not ( = ?auto_180080 ?auto_180086 ) ) ( not ( = ?auto_180081 ?auto_180086 ) ) ( not ( = ?auto_180082 ?auto_180086 ) ) ( not ( = ?auto_180083 ?auto_180086 ) ) ( not ( = ?auto_180084 ?auto_180086 ) ) ( not ( = ?auto_180085 ?auto_180086 ) ) ( CLEAR ?auto_180083 ) ( ON ?auto_180084 ?auto_180085 ) ( CLEAR ?auto_180084 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180087 ) ( ON ?auto_180086 ?auto_180087 ) ( not ( = ?auto_180087 ?auto_180086 ) ) ( not ( = ?auto_180087 ?auto_180085 ) ) ( not ( = ?auto_180087 ?auto_180084 ) ) ( not ( = ?auto_180079 ?auto_180087 ) ) ( not ( = ?auto_180080 ?auto_180087 ) ) ( not ( = ?auto_180081 ?auto_180087 ) ) ( not ( = ?auto_180082 ?auto_180087 ) ) ( not ( = ?auto_180083 ?auto_180087 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180087 ?auto_180086 ?auto_180085 )
      ( MAKE-7PILE ?auto_180079 ?auto_180080 ?auto_180081 ?auto_180082 ?auto_180083 ?auto_180084 ?auto_180085 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180088 - BLOCK
      ?auto_180089 - BLOCK
      ?auto_180090 - BLOCK
      ?auto_180091 - BLOCK
      ?auto_180092 - BLOCK
      ?auto_180093 - BLOCK
      ?auto_180094 - BLOCK
    )
    :vars
    (
      ?auto_180096 - BLOCK
      ?auto_180095 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180088 ) ( ON ?auto_180089 ?auto_180088 ) ( ON ?auto_180090 ?auto_180089 ) ( ON ?auto_180091 ?auto_180090 ) ( not ( = ?auto_180088 ?auto_180089 ) ) ( not ( = ?auto_180088 ?auto_180090 ) ) ( not ( = ?auto_180088 ?auto_180091 ) ) ( not ( = ?auto_180088 ?auto_180092 ) ) ( not ( = ?auto_180088 ?auto_180093 ) ) ( not ( = ?auto_180088 ?auto_180094 ) ) ( not ( = ?auto_180089 ?auto_180090 ) ) ( not ( = ?auto_180089 ?auto_180091 ) ) ( not ( = ?auto_180089 ?auto_180092 ) ) ( not ( = ?auto_180089 ?auto_180093 ) ) ( not ( = ?auto_180089 ?auto_180094 ) ) ( not ( = ?auto_180090 ?auto_180091 ) ) ( not ( = ?auto_180090 ?auto_180092 ) ) ( not ( = ?auto_180090 ?auto_180093 ) ) ( not ( = ?auto_180090 ?auto_180094 ) ) ( not ( = ?auto_180091 ?auto_180092 ) ) ( not ( = ?auto_180091 ?auto_180093 ) ) ( not ( = ?auto_180091 ?auto_180094 ) ) ( not ( = ?auto_180092 ?auto_180093 ) ) ( not ( = ?auto_180092 ?auto_180094 ) ) ( not ( = ?auto_180093 ?auto_180094 ) ) ( ON ?auto_180094 ?auto_180096 ) ( not ( = ?auto_180088 ?auto_180096 ) ) ( not ( = ?auto_180089 ?auto_180096 ) ) ( not ( = ?auto_180090 ?auto_180096 ) ) ( not ( = ?auto_180091 ?auto_180096 ) ) ( not ( = ?auto_180092 ?auto_180096 ) ) ( not ( = ?auto_180093 ?auto_180096 ) ) ( not ( = ?auto_180094 ?auto_180096 ) ) ( ON ?auto_180093 ?auto_180094 ) ( CLEAR ?auto_180093 ) ( ON-TABLE ?auto_180095 ) ( ON ?auto_180096 ?auto_180095 ) ( not ( = ?auto_180095 ?auto_180096 ) ) ( not ( = ?auto_180095 ?auto_180094 ) ) ( not ( = ?auto_180095 ?auto_180093 ) ) ( not ( = ?auto_180088 ?auto_180095 ) ) ( not ( = ?auto_180089 ?auto_180095 ) ) ( not ( = ?auto_180090 ?auto_180095 ) ) ( not ( = ?auto_180091 ?auto_180095 ) ) ( not ( = ?auto_180092 ?auto_180095 ) ) ( HOLDING ?auto_180092 ) ( CLEAR ?auto_180091 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180088 ?auto_180089 ?auto_180090 ?auto_180091 ?auto_180092 )
      ( MAKE-7PILE ?auto_180088 ?auto_180089 ?auto_180090 ?auto_180091 ?auto_180092 ?auto_180093 ?auto_180094 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180097 - BLOCK
      ?auto_180098 - BLOCK
      ?auto_180099 - BLOCK
      ?auto_180100 - BLOCK
      ?auto_180101 - BLOCK
      ?auto_180102 - BLOCK
      ?auto_180103 - BLOCK
    )
    :vars
    (
      ?auto_180104 - BLOCK
      ?auto_180105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180097 ) ( ON ?auto_180098 ?auto_180097 ) ( ON ?auto_180099 ?auto_180098 ) ( ON ?auto_180100 ?auto_180099 ) ( not ( = ?auto_180097 ?auto_180098 ) ) ( not ( = ?auto_180097 ?auto_180099 ) ) ( not ( = ?auto_180097 ?auto_180100 ) ) ( not ( = ?auto_180097 ?auto_180101 ) ) ( not ( = ?auto_180097 ?auto_180102 ) ) ( not ( = ?auto_180097 ?auto_180103 ) ) ( not ( = ?auto_180098 ?auto_180099 ) ) ( not ( = ?auto_180098 ?auto_180100 ) ) ( not ( = ?auto_180098 ?auto_180101 ) ) ( not ( = ?auto_180098 ?auto_180102 ) ) ( not ( = ?auto_180098 ?auto_180103 ) ) ( not ( = ?auto_180099 ?auto_180100 ) ) ( not ( = ?auto_180099 ?auto_180101 ) ) ( not ( = ?auto_180099 ?auto_180102 ) ) ( not ( = ?auto_180099 ?auto_180103 ) ) ( not ( = ?auto_180100 ?auto_180101 ) ) ( not ( = ?auto_180100 ?auto_180102 ) ) ( not ( = ?auto_180100 ?auto_180103 ) ) ( not ( = ?auto_180101 ?auto_180102 ) ) ( not ( = ?auto_180101 ?auto_180103 ) ) ( not ( = ?auto_180102 ?auto_180103 ) ) ( ON ?auto_180103 ?auto_180104 ) ( not ( = ?auto_180097 ?auto_180104 ) ) ( not ( = ?auto_180098 ?auto_180104 ) ) ( not ( = ?auto_180099 ?auto_180104 ) ) ( not ( = ?auto_180100 ?auto_180104 ) ) ( not ( = ?auto_180101 ?auto_180104 ) ) ( not ( = ?auto_180102 ?auto_180104 ) ) ( not ( = ?auto_180103 ?auto_180104 ) ) ( ON ?auto_180102 ?auto_180103 ) ( ON-TABLE ?auto_180105 ) ( ON ?auto_180104 ?auto_180105 ) ( not ( = ?auto_180105 ?auto_180104 ) ) ( not ( = ?auto_180105 ?auto_180103 ) ) ( not ( = ?auto_180105 ?auto_180102 ) ) ( not ( = ?auto_180097 ?auto_180105 ) ) ( not ( = ?auto_180098 ?auto_180105 ) ) ( not ( = ?auto_180099 ?auto_180105 ) ) ( not ( = ?auto_180100 ?auto_180105 ) ) ( not ( = ?auto_180101 ?auto_180105 ) ) ( CLEAR ?auto_180100 ) ( ON ?auto_180101 ?auto_180102 ) ( CLEAR ?auto_180101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180105 ?auto_180104 ?auto_180103 ?auto_180102 )
      ( MAKE-7PILE ?auto_180097 ?auto_180098 ?auto_180099 ?auto_180100 ?auto_180101 ?auto_180102 ?auto_180103 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180106 - BLOCK
      ?auto_180107 - BLOCK
      ?auto_180108 - BLOCK
      ?auto_180109 - BLOCK
      ?auto_180110 - BLOCK
      ?auto_180111 - BLOCK
      ?auto_180112 - BLOCK
    )
    :vars
    (
      ?auto_180113 - BLOCK
      ?auto_180114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180106 ) ( ON ?auto_180107 ?auto_180106 ) ( ON ?auto_180108 ?auto_180107 ) ( not ( = ?auto_180106 ?auto_180107 ) ) ( not ( = ?auto_180106 ?auto_180108 ) ) ( not ( = ?auto_180106 ?auto_180109 ) ) ( not ( = ?auto_180106 ?auto_180110 ) ) ( not ( = ?auto_180106 ?auto_180111 ) ) ( not ( = ?auto_180106 ?auto_180112 ) ) ( not ( = ?auto_180107 ?auto_180108 ) ) ( not ( = ?auto_180107 ?auto_180109 ) ) ( not ( = ?auto_180107 ?auto_180110 ) ) ( not ( = ?auto_180107 ?auto_180111 ) ) ( not ( = ?auto_180107 ?auto_180112 ) ) ( not ( = ?auto_180108 ?auto_180109 ) ) ( not ( = ?auto_180108 ?auto_180110 ) ) ( not ( = ?auto_180108 ?auto_180111 ) ) ( not ( = ?auto_180108 ?auto_180112 ) ) ( not ( = ?auto_180109 ?auto_180110 ) ) ( not ( = ?auto_180109 ?auto_180111 ) ) ( not ( = ?auto_180109 ?auto_180112 ) ) ( not ( = ?auto_180110 ?auto_180111 ) ) ( not ( = ?auto_180110 ?auto_180112 ) ) ( not ( = ?auto_180111 ?auto_180112 ) ) ( ON ?auto_180112 ?auto_180113 ) ( not ( = ?auto_180106 ?auto_180113 ) ) ( not ( = ?auto_180107 ?auto_180113 ) ) ( not ( = ?auto_180108 ?auto_180113 ) ) ( not ( = ?auto_180109 ?auto_180113 ) ) ( not ( = ?auto_180110 ?auto_180113 ) ) ( not ( = ?auto_180111 ?auto_180113 ) ) ( not ( = ?auto_180112 ?auto_180113 ) ) ( ON ?auto_180111 ?auto_180112 ) ( ON-TABLE ?auto_180114 ) ( ON ?auto_180113 ?auto_180114 ) ( not ( = ?auto_180114 ?auto_180113 ) ) ( not ( = ?auto_180114 ?auto_180112 ) ) ( not ( = ?auto_180114 ?auto_180111 ) ) ( not ( = ?auto_180106 ?auto_180114 ) ) ( not ( = ?auto_180107 ?auto_180114 ) ) ( not ( = ?auto_180108 ?auto_180114 ) ) ( not ( = ?auto_180109 ?auto_180114 ) ) ( not ( = ?auto_180110 ?auto_180114 ) ) ( ON ?auto_180110 ?auto_180111 ) ( CLEAR ?auto_180110 ) ( HOLDING ?auto_180109 ) ( CLEAR ?auto_180108 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180106 ?auto_180107 ?auto_180108 ?auto_180109 )
      ( MAKE-7PILE ?auto_180106 ?auto_180107 ?auto_180108 ?auto_180109 ?auto_180110 ?auto_180111 ?auto_180112 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180115 - BLOCK
      ?auto_180116 - BLOCK
      ?auto_180117 - BLOCK
      ?auto_180118 - BLOCK
      ?auto_180119 - BLOCK
      ?auto_180120 - BLOCK
      ?auto_180121 - BLOCK
    )
    :vars
    (
      ?auto_180122 - BLOCK
      ?auto_180123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180115 ) ( ON ?auto_180116 ?auto_180115 ) ( ON ?auto_180117 ?auto_180116 ) ( not ( = ?auto_180115 ?auto_180116 ) ) ( not ( = ?auto_180115 ?auto_180117 ) ) ( not ( = ?auto_180115 ?auto_180118 ) ) ( not ( = ?auto_180115 ?auto_180119 ) ) ( not ( = ?auto_180115 ?auto_180120 ) ) ( not ( = ?auto_180115 ?auto_180121 ) ) ( not ( = ?auto_180116 ?auto_180117 ) ) ( not ( = ?auto_180116 ?auto_180118 ) ) ( not ( = ?auto_180116 ?auto_180119 ) ) ( not ( = ?auto_180116 ?auto_180120 ) ) ( not ( = ?auto_180116 ?auto_180121 ) ) ( not ( = ?auto_180117 ?auto_180118 ) ) ( not ( = ?auto_180117 ?auto_180119 ) ) ( not ( = ?auto_180117 ?auto_180120 ) ) ( not ( = ?auto_180117 ?auto_180121 ) ) ( not ( = ?auto_180118 ?auto_180119 ) ) ( not ( = ?auto_180118 ?auto_180120 ) ) ( not ( = ?auto_180118 ?auto_180121 ) ) ( not ( = ?auto_180119 ?auto_180120 ) ) ( not ( = ?auto_180119 ?auto_180121 ) ) ( not ( = ?auto_180120 ?auto_180121 ) ) ( ON ?auto_180121 ?auto_180122 ) ( not ( = ?auto_180115 ?auto_180122 ) ) ( not ( = ?auto_180116 ?auto_180122 ) ) ( not ( = ?auto_180117 ?auto_180122 ) ) ( not ( = ?auto_180118 ?auto_180122 ) ) ( not ( = ?auto_180119 ?auto_180122 ) ) ( not ( = ?auto_180120 ?auto_180122 ) ) ( not ( = ?auto_180121 ?auto_180122 ) ) ( ON ?auto_180120 ?auto_180121 ) ( ON-TABLE ?auto_180123 ) ( ON ?auto_180122 ?auto_180123 ) ( not ( = ?auto_180123 ?auto_180122 ) ) ( not ( = ?auto_180123 ?auto_180121 ) ) ( not ( = ?auto_180123 ?auto_180120 ) ) ( not ( = ?auto_180115 ?auto_180123 ) ) ( not ( = ?auto_180116 ?auto_180123 ) ) ( not ( = ?auto_180117 ?auto_180123 ) ) ( not ( = ?auto_180118 ?auto_180123 ) ) ( not ( = ?auto_180119 ?auto_180123 ) ) ( ON ?auto_180119 ?auto_180120 ) ( CLEAR ?auto_180117 ) ( ON ?auto_180118 ?auto_180119 ) ( CLEAR ?auto_180118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180123 ?auto_180122 ?auto_180121 ?auto_180120 ?auto_180119 )
      ( MAKE-7PILE ?auto_180115 ?auto_180116 ?auto_180117 ?auto_180118 ?auto_180119 ?auto_180120 ?auto_180121 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180124 - BLOCK
      ?auto_180125 - BLOCK
      ?auto_180126 - BLOCK
      ?auto_180127 - BLOCK
      ?auto_180128 - BLOCK
      ?auto_180129 - BLOCK
      ?auto_180130 - BLOCK
    )
    :vars
    (
      ?auto_180132 - BLOCK
      ?auto_180131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180124 ) ( ON ?auto_180125 ?auto_180124 ) ( not ( = ?auto_180124 ?auto_180125 ) ) ( not ( = ?auto_180124 ?auto_180126 ) ) ( not ( = ?auto_180124 ?auto_180127 ) ) ( not ( = ?auto_180124 ?auto_180128 ) ) ( not ( = ?auto_180124 ?auto_180129 ) ) ( not ( = ?auto_180124 ?auto_180130 ) ) ( not ( = ?auto_180125 ?auto_180126 ) ) ( not ( = ?auto_180125 ?auto_180127 ) ) ( not ( = ?auto_180125 ?auto_180128 ) ) ( not ( = ?auto_180125 ?auto_180129 ) ) ( not ( = ?auto_180125 ?auto_180130 ) ) ( not ( = ?auto_180126 ?auto_180127 ) ) ( not ( = ?auto_180126 ?auto_180128 ) ) ( not ( = ?auto_180126 ?auto_180129 ) ) ( not ( = ?auto_180126 ?auto_180130 ) ) ( not ( = ?auto_180127 ?auto_180128 ) ) ( not ( = ?auto_180127 ?auto_180129 ) ) ( not ( = ?auto_180127 ?auto_180130 ) ) ( not ( = ?auto_180128 ?auto_180129 ) ) ( not ( = ?auto_180128 ?auto_180130 ) ) ( not ( = ?auto_180129 ?auto_180130 ) ) ( ON ?auto_180130 ?auto_180132 ) ( not ( = ?auto_180124 ?auto_180132 ) ) ( not ( = ?auto_180125 ?auto_180132 ) ) ( not ( = ?auto_180126 ?auto_180132 ) ) ( not ( = ?auto_180127 ?auto_180132 ) ) ( not ( = ?auto_180128 ?auto_180132 ) ) ( not ( = ?auto_180129 ?auto_180132 ) ) ( not ( = ?auto_180130 ?auto_180132 ) ) ( ON ?auto_180129 ?auto_180130 ) ( ON-TABLE ?auto_180131 ) ( ON ?auto_180132 ?auto_180131 ) ( not ( = ?auto_180131 ?auto_180132 ) ) ( not ( = ?auto_180131 ?auto_180130 ) ) ( not ( = ?auto_180131 ?auto_180129 ) ) ( not ( = ?auto_180124 ?auto_180131 ) ) ( not ( = ?auto_180125 ?auto_180131 ) ) ( not ( = ?auto_180126 ?auto_180131 ) ) ( not ( = ?auto_180127 ?auto_180131 ) ) ( not ( = ?auto_180128 ?auto_180131 ) ) ( ON ?auto_180128 ?auto_180129 ) ( ON ?auto_180127 ?auto_180128 ) ( CLEAR ?auto_180127 ) ( HOLDING ?auto_180126 ) ( CLEAR ?auto_180125 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180124 ?auto_180125 ?auto_180126 )
      ( MAKE-7PILE ?auto_180124 ?auto_180125 ?auto_180126 ?auto_180127 ?auto_180128 ?auto_180129 ?auto_180130 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180133 - BLOCK
      ?auto_180134 - BLOCK
      ?auto_180135 - BLOCK
      ?auto_180136 - BLOCK
      ?auto_180137 - BLOCK
      ?auto_180138 - BLOCK
      ?auto_180139 - BLOCK
    )
    :vars
    (
      ?auto_180140 - BLOCK
      ?auto_180141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180133 ) ( ON ?auto_180134 ?auto_180133 ) ( not ( = ?auto_180133 ?auto_180134 ) ) ( not ( = ?auto_180133 ?auto_180135 ) ) ( not ( = ?auto_180133 ?auto_180136 ) ) ( not ( = ?auto_180133 ?auto_180137 ) ) ( not ( = ?auto_180133 ?auto_180138 ) ) ( not ( = ?auto_180133 ?auto_180139 ) ) ( not ( = ?auto_180134 ?auto_180135 ) ) ( not ( = ?auto_180134 ?auto_180136 ) ) ( not ( = ?auto_180134 ?auto_180137 ) ) ( not ( = ?auto_180134 ?auto_180138 ) ) ( not ( = ?auto_180134 ?auto_180139 ) ) ( not ( = ?auto_180135 ?auto_180136 ) ) ( not ( = ?auto_180135 ?auto_180137 ) ) ( not ( = ?auto_180135 ?auto_180138 ) ) ( not ( = ?auto_180135 ?auto_180139 ) ) ( not ( = ?auto_180136 ?auto_180137 ) ) ( not ( = ?auto_180136 ?auto_180138 ) ) ( not ( = ?auto_180136 ?auto_180139 ) ) ( not ( = ?auto_180137 ?auto_180138 ) ) ( not ( = ?auto_180137 ?auto_180139 ) ) ( not ( = ?auto_180138 ?auto_180139 ) ) ( ON ?auto_180139 ?auto_180140 ) ( not ( = ?auto_180133 ?auto_180140 ) ) ( not ( = ?auto_180134 ?auto_180140 ) ) ( not ( = ?auto_180135 ?auto_180140 ) ) ( not ( = ?auto_180136 ?auto_180140 ) ) ( not ( = ?auto_180137 ?auto_180140 ) ) ( not ( = ?auto_180138 ?auto_180140 ) ) ( not ( = ?auto_180139 ?auto_180140 ) ) ( ON ?auto_180138 ?auto_180139 ) ( ON-TABLE ?auto_180141 ) ( ON ?auto_180140 ?auto_180141 ) ( not ( = ?auto_180141 ?auto_180140 ) ) ( not ( = ?auto_180141 ?auto_180139 ) ) ( not ( = ?auto_180141 ?auto_180138 ) ) ( not ( = ?auto_180133 ?auto_180141 ) ) ( not ( = ?auto_180134 ?auto_180141 ) ) ( not ( = ?auto_180135 ?auto_180141 ) ) ( not ( = ?auto_180136 ?auto_180141 ) ) ( not ( = ?auto_180137 ?auto_180141 ) ) ( ON ?auto_180137 ?auto_180138 ) ( ON ?auto_180136 ?auto_180137 ) ( CLEAR ?auto_180134 ) ( ON ?auto_180135 ?auto_180136 ) ( CLEAR ?auto_180135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180141 ?auto_180140 ?auto_180139 ?auto_180138 ?auto_180137 ?auto_180136 )
      ( MAKE-7PILE ?auto_180133 ?auto_180134 ?auto_180135 ?auto_180136 ?auto_180137 ?auto_180138 ?auto_180139 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180142 - BLOCK
      ?auto_180143 - BLOCK
      ?auto_180144 - BLOCK
      ?auto_180145 - BLOCK
      ?auto_180146 - BLOCK
      ?auto_180147 - BLOCK
      ?auto_180148 - BLOCK
    )
    :vars
    (
      ?auto_180149 - BLOCK
      ?auto_180150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180142 ) ( not ( = ?auto_180142 ?auto_180143 ) ) ( not ( = ?auto_180142 ?auto_180144 ) ) ( not ( = ?auto_180142 ?auto_180145 ) ) ( not ( = ?auto_180142 ?auto_180146 ) ) ( not ( = ?auto_180142 ?auto_180147 ) ) ( not ( = ?auto_180142 ?auto_180148 ) ) ( not ( = ?auto_180143 ?auto_180144 ) ) ( not ( = ?auto_180143 ?auto_180145 ) ) ( not ( = ?auto_180143 ?auto_180146 ) ) ( not ( = ?auto_180143 ?auto_180147 ) ) ( not ( = ?auto_180143 ?auto_180148 ) ) ( not ( = ?auto_180144 ?auto_180145 ) ) ( not ( = ?auto_180144 ?auto_180146 ) ) ( not ( = ?auto_180144 ?auto_180147 ) ) ( not ( = ?auto_180144 ?auto_180148 ) ) ( not ( = ?auto_180145 ?auto_180146 ) ) ( not ( = ?auto_180145 ?auto_180147 ) ) ( not ( = ?auto_180145 ?auto_180148 ) ) ( not ( = ?auto_180146 ?auto_180147 ) ) ( not ( = ?auto_180146 ?auto_180148 ) ) ( not ( = ?auto_180147 ?auto_180148 ) ) ( ON ?auto_180148 ?auto_180149 ) ( not ( = ?auto_180142 ?auto_180149 ) ) ( not ( = ?auto_180143 ?auto_180149 ) ) ( not ( = ?auto_180144 ?auto_180149 ) ) ( not ( = ?auto_180145 ?auto_180149 ) ) ( not ( = ?auto_180146 ?auto_180149 ) ) ( not ( = ?auto_180147 ?auto_180149 ) ) ( not ( = ?auto_180148 ?auto_180149 ) ) ( ON ?auto_180147 ?auto_180148 ) ( ON-TABLE ?auto_180150 ) ( ON ?auto_180149 ?auto_180150 ) ( not ( = ?auto_180150 ?auto_180149 ) ) ( not ( = ?auto_180150 ?auto_180148 ) ) ( not ( = ?auto_180150 ?auto_180147 ) ) ( not ( = ?auto_180142 ?auto_180150 ) ) ( not ( = ?auto_180143 ?auto_180150 ) ) ( not ( = ?auto_180144 ?auto_180150 ) ) ( not ( = ?auto_180145 ?auto_180150 ) ) ( not ( = ?auto_180146 ?auto_180150 ) ) ( ON ?auto_180146 ?auto_180147 ) ( ON ?auto_180145 ?auto_180146 ) ( ON ?auto_180144 ?auto_180145 ) ( CLEAR ?auto_180144 ) ( HOLDING ?auto_180143 ) ( CLEAR ?auto_180142 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180142 ?auto_180143 )
      ( MAKE-7PILE ?auto_180142 ?auto_180143 ?auto_180144 ?auto_180145 ?auto_180146 ?auto_180147 ?auto_180148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180151 - BLOCK
      ?auto_180152 - BLOCK
      ?auto_180153 - BLOCK
      ?auto_180154 - BLOCK
      ?auto_180155 - BLOCK
      ?auto_180156 - BLOCK
      ?auto_180157 - BLOCK
    )
    :vars
    (
      ?auto_180158 - BLOCK
      ?auto_180159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180151 ) ( not ( = ?auto_180151 ?auto_180152 ) ) ( not ( = ?auto_180151 ?auto_180153 ) ) ( not ( = ?auto_180151 ?auto_180154 ) ) ( not ( = ?auto_180151 ?auto_180155 ) ) ( not ( = ?auto_180151 ?auto_180156 ) ) ( not ( = ?auto_180151 ?auto_180157 ) ) ( not ( = ?auto_180152 ?auto_180153 ) ) ( not ( = ?auto_180152 ?auto_180154 ) ) ( not ( = ?auto_180152 ?auto_180155 ) ) ( not ( = ?auto_180152 ?auto_180156 ) ) ( not ( = ?auto_180152 ?auto_180157 ) ) ( not ( = ?auto_180153 ?auto_180154 ) ) ( not ( = ?auto_180153 ?auto_180155 ) ) ( not ( = ?auto_180153 ?auto_180156 ) ) ( not ( = ?auto_180153 ?auto_180157 ) ) ( not ( = ?auto_180154 ?auto_180155 ) ) ( not ( = ?auto_180154 ?auto_180156 ) ) ( not ( = ?auto_180154 ?auto_180157 ) ) ( not ( = ?auto_180155 ?auto_180156 ) ) ( not ( = ?auto_180155 ?auto_180157 ) ) ( not ( = ?auto_180156 ?auto_180157 ) ) ( ON ?auto_180157 ?auto_180158 ) ( not ( = ?auto_180151 ?auto_180158 ) ) ( not ( = ?auto_180152 ?auto_180158 ) ) ( not ( = ?auto_180153 ?auto_180158 ) ) ( not ( = ?auto_180154 ?auto_180158 ) ) ( not ( = ?auto_180155 ?auto_180158 ) ) ( not ( = ?auto_180156 ?auto_180158 ) ) ( not ( = ?auto_180157 ?auto_180158 ) ) ( ON ?auto_180156 ?auto_180157 ) ( ON-TABLE ?auto_180159 ) ( ON ?auto_180158 ?auto_180159 ) ( not ( = ?auto_180159 ?auto_180158 ) ) ( not ( = ?auto_180159 ?auto_180157 ) ) ( not ( = ?auto_180159 ?auto_180156 ) ) ( not ( = ?auto_180151 ?auto_180159 ) ) ( not ( = ?auto_180152 ?auto_180159 ) ) ( not ( = ?auto_180153 ?auto_180159 ) ) ( not ( = ?auto_180154 ?auto_180159 ) ) ( not ( = ?auto_180155 ?auto_180159 ) ) ( ON ?auto_180155 ?auto_180156 ) ( ON ?auto_180154 ?auto_180155 ) ( ON ?auto_180153 ?auto_180154 ) ( CLEAR ?auto_180151 ) ( ON ?auto_180152 ?auto_180153 ) ( CLEAR ?auto_180152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180159 ?auto_180158 ?auto_180157 ?auto_180156 ?auto_180155 ?auto_180154 ?auto_180153 )
      ( MAKE-7PILE ?auto_180151 ?auto_180152 ?auto_180153 ?auto_180154 ?auto_180155 ?auto_180156 ?auto_180157 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180160 - BLOCK
      ?auto_180161 - BLOCK
      ?auto_180162 - BLOCK
      ?auto_180163 - BLOCK
      ?auto_180164 - BLOCK
      ?auto_180165 - BLOCK
      ?auto_180166 - BLOCK
    )
    :vars
    (
      ?auto_180167 - BLOCK
      ?auto_180168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180160 ?auto_180161 ) ) ( not ( = ?auto_180160 ?auto_180162 ) ) ( not ( = ?auto_180160 ?auto_180163 ) ) ( not ( = ?auto_180160 ?auto_180164 ) ) ( not ( = ?auto_180160 ?auto_180165 ) ) ( not ( = ?auto_180160 ?auto_180166 ) ) ( not ( = ?auto_180161 ?auto_180162 ) ) ( not ( = ?auto_180161 ?auto_180163 ) ) ( not ( = ?auto_180161 ?auto_180164 ) ) ( not ( = ?auto_180161 ?auto_180165 ) ) ( not ( = ?auto_180161 ?auto_180166 ) ) ( not ( = ?auto_180162 ?auto_180163 ) ) ( not ( = ?auto_180162 ?auto_180164 ) ) ( not ( = ?auto_180162 ?auto_180165 ) ) ( not ( = ?auto_180162 ?auto_180166 ) ) ( not ( = ?auto_180163 ?auto_180164 ) ) ( not ( = ?auto_180163 ?auto_180165 ) ) ( not ( = ?auto_180163 ?auto_180166 ) ) ( not ( = ?auto_180164 ?auto_180165 ) ) ( not ( = ?auto_180164 ?auto_180166 ) ) ( not ( = ?auto_180165 ?auto_180166 ) ) ( ON ?auto_180166 ?auto_180167 ) ( not ( = ?auto_180160 ?auto_180167 ) ) ( not ( = ?auto_180161 ?auto_180167 ) ) ( not ( = ?auto_180162 ?auto_180167 ) ) ( not ( = ?auto_180163 ?auto_180167 ) ) ( not ( = ?auto_180164 ?auto_180167 ) ) ( not ( = ?auto_180165 ?auto_180167 ) ) ( not ( = ?auto_180166 ?auto_180167 ) ) ( ON ?auto_180165 ?auto_180166 ) ( ON-TABLE ?auto_180168 ) ( ON ?auto_180167 ?auto_180168 ) ( not ( = ?auto_180168 ?auto_180167 ) ) ( not ( = ?auto_180168 ?auto_180166 ) ) ( not ( = ?auto_180168 ?auto_180165 ) ) ( not ( = ?auto_180160 ?auto_180168 ) ) ( not ( = ?auto_180161 ?auto_180168 ) ) ( not ( = ?auto_180162 ?auto_180168 ) ) ( not ( = ?auto_180163 ?auto_180168 ) ) ( not ( = ?auto_180164 ?auto_180168 ) ) ( ON ?auto_180164 ?auto_180165 ) ( ON ?auto_180163 ?auto_180164 ) ( ON ?auto_180162 ?auto_180163 ) ( ON ?auto_180161 ?auto_180162 ) ( CLEAR ?auto_180161 ) ( HOLDING ?auto_180160 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180160 )
      ( MAKE-7PILE ?auto_180160 ?auto_180161 ?auto_180162 ?auto_180163 ?auto_180164 ?auto_180165 ?auto_180166 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180169 - BLOCK
      ?auto_180170 - BLOCK
      ?auto_180171 - BLOCK
      ?auto_180172 - BLOCK
      ?auto_180173 - BLOCK
      ?auto_180174 - BLOCK
      ?auto_180175 - BLOCK
    )
    :vars
    (
      ?auto_180176 - BLOCK
      ?auto_180177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180169 ?auto_180170 ) ) ( not ( = ?auto_180169 ?auto_180171 ) ) ( not ( = ?auto_180169 ?auto_180172 ) ) ( not ( = ?auto_180169 ?auto_180173 ) ) ( not ( = ?auto_180169 ?auto_180174 ) ) ( not ( = ?auto_180169 ?auto_180175 ) ) ( not ( = ?auto_180170 ?auto_180171 ) ) ( not ( = ?auto_180170 ?auto_180172 ) ) ( not ( = ?auto_180170 ?auto_180173 ) ) ( not ( = ?auto_180170 ?auto_180174 ) ) ( not ( = ?auto_180170 ?auto_180175 ) ) ( not ( = ?auto_180171 ?auto_180172 ) ) ( not ( = ?auto_180171 ?auto_180173 ) ) ( not ( = ?auto_180171 ?auto_180174 ) ) ( not ( = ?auto_180171 ?auto_180175 ) ) ( not ( = ?auto_180172 ?auto_180173 ) ) ( not ( = ?auto_180172 ?auto_180174 ) ) ( not ( = ?auto_180172 ?auto_180175 ) ) ( not ( = ?auto_180173 ?auto_180174 ) ) ( not ( = ?auto_180173 ?auto_180175 ) ) ( not ( = ?auto_180174 ?auto_180175 ) ) ( ON ?auto_180175 ?auto_180176 ) ( not ( = ?auto_180169 ?auto_180176 ) ) ( not ( = ?auto_180170 ?auto_180176 ) ) ( not ( = ?auto_180171 ?auto_180176 ) ) ( not ( = ?auto_180172 ?auto_180176 ) ) ( not ( = ?auto_180173 ?auto_180176 ) ) ( not ( = ?auto_180174 ?auto_180176 ) ) ( not ( = ?auto_180175 ?auto_180176 ) ) ( ON ?auto_180174 ?auto_180175 ) ( ON-TABLE ?auto_180177 ) ( ON ?auto_180176 ?auto_180177 ) ( not ( = ?auto_180177 ?auto_180176 ) ) ( not ( = ?auto_180177 ?auto_180175 ) ) ( not ( = ?auto_180177 ?auto_180174 ) ) ( not ( = ?auto_180169 ?auto_180177 ) ) ( not ( = ?auto_180170 ?auto_180177 ) ) ( not ( = ?auto_180171 ?auto_180177 ) ) ( not ( = ?auto_180172 ?auto_180177 ) ) ( not ( = ?auto_180173 ?auto_180177 ) ) ( ON ?auto_180173 ?auto_180174 ) ( ON ?auto_180172 ?auto_180173 ) ( ON ?auto_180171 ?auto_180172 ) ( ON ?auto_180170 ?auto_180171 ) ( ON ?auto_180169 ?auto_180170 ) ( CLEAR ?auto_180169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180177 ?auto_180176 ?auto_180175 ?auto_180174 ?auto_180173 ?auto_180172 ?auto_180171 ?auto_180170 )
      ( MAKE-7PILE ?auto_180169 ?auto_180170 ?auto_180171 ?auto_180172 ?auto_180173 ?auto_180174 ?auto_180175 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180179 - BLOCK
    )
    :vars
    (
      ?auto_180180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180180 ?auto_180179 ) ( CLEAR ?auto_180180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180179 ) ( not ( = ?auto_180179 ?auto_180180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180180 ?auto_180179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180181 - BLOCK
    )
    :vars
    (
      ?auto_180182 - BLOCK
      ?auto_180183 - BLOCK
      ?auto_180184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180182 ?auto_180181 ) ( CLEAR ?auto_180182 ) ( ON-TABLE ?auto_180181 ) ( not ( = ?auto_180181 ?auto_180182 ) ) ( HOLDING ?auto_180183 ) ( CLEAR ?auto_180184 ) ( not ( = ?auto_180181 ?auto_180183 ) ) ( not ( = ?auto_180181 ?auto_180184 ) ) ( not ( = ?auto_180182 ?auto_180183 ) ) ( not ( = ?auto_180182 ?auto_180184 ) ) ( not ( = ?auto_180183 ?auto_180184 ) ) )
    :subtasks
    ( ( !STACK ?auto_180183 ?auto_180184 )
      ( MAKE-1PILE ?auto_180181 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180185 - BLOCK
    )
    :vars
    (
      ?auto_180187 - BLOCK
      ?auto_180188 - BLOCK
      ?auto_180186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180187 ?auto_180185 ) ( ON-TABLE ?auto_180185 ) ( not ( = ?auto_180185 ?auto_180187 ) ) ( CLEAR ?auto_180188 ) ( not ( = ?auto_180185 ?auto_180186 ) ) ( not ( = ?auto_180185 ?auto_180188 ) ) ( not ( = ?auto_180187 ?auto_180186 ) ) ( not ( = ?auto_180187 ?auto_180188 ) ) ( not ( = ?auto_180186 ?auto_180188 ) ) ( ON ?auto_180186 ?auto_180187 ) ( CLEAR ?auto_180186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180185 ?auto_180187 )
      ( MAKE-1PILE ?auto_180185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180189 - BLOCK
    )
    :vars
    (
      ?auto_180192 - BLOCK
      ?auto_180190 - BLOCK
      ?auto_180191 - BLOCK
      ?auto_180194 - BLOCK
      ?auto_180195 - BLOCK
      ?auto_180196 - BLOCK
      ?auto_180193 - BLOCK
      ?auto_180197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180192 ?auto_180189 ) ( ON-TABLE ?auto_180189 ) ( not ( = ?auto_180189 ?auto_180192 ) ) ( not ( = ?auto_180189 ?auto_180190 ) ) ( not ( = ?auto_180189 ?auto_180191 ) ) ( not ( = ?auto_180192 ?auto_180190 ) ) ( not ( = ?auto_180192 ?auto_180191 ) ) ( not ( = ?auto_180190 ?auto_180191 ) ) ( ON ?auto_180190 ?auto_180192 ) ( CLEAR ?auto_180190 ) ( HOLDING ?auto_180191 ) ( CLEAR ?auto_180194 ) ( ON-TABLE ?auto_180195 ) ( ON ?auto_180196 ?auto_180195 ) ( ON ?auto_180193 ?auto_180196 ) ( ON ?auto_180197 ?auto_180193 ) ( ON ?auto_180194 ?auto_180197 ) ( not ( = ?auto_180195 ?auto_180196 ) ) ( not ( = ?auto_180195 ?auto_180193 ) ) ( not ( = ?auto_180195 ?auto_180197 ) ) ( not ( = ?auto_180195 ?auto_180194 ) ) ( not ( = ?auto_180195 ?auto_180191 ) ) ( not ( = ?auto_180196 ?auto_180193 ) ) ( not ( = ?auto_180196 ?auto_180197 ) ) ( not ( = ?auto_180196 ?auto_180194 ) ) ( not ( = ?auto_180196 ?auto_180191 ) ) ( not ( = ?auto_180193 ?auto_180197 ) ) ( not ( = ?auto_180193 ?auto_180194 ) ) ( not ( = ?auto_180193 ?auto_180191 ) ) ( not ( = ?auto_180197 ?auto_180194 ) ) ( not ( = ?auto_180197 ?auto_180191 ) ) ( not ( = ?auto_180194 ?auto_180191 ) ) ( not ( = ?auto_180189 ?auto_180194 ) ) ( not ( = ?auto_180189 ?auto_180195 ) ) ( not ( = ?auto_180189 ?auto_180196 ) ) ( not ( = ?auto_180189 ?auto_180193 ) ) ( not ( = ?auto_180189 ?auto_180197 ) ) ( not ( = ?auto_180192 ?auto_180194 ) ) ( not ( = ?auto_180192 ?auto_180195 ) ) ( not ( = ?auto_180192 ?auto_180196 ) ) ( not ( = ?auto_180192 ?auto_180193 ) ) ( not ( = ?auto_180192 ?auto_180197 ) ) ( not ( = ?auto_180190 ?auto_180194 ) ) ( not ( = ?auto_180190 ?auto_180195 ) ) ( not ( = ?auto_180190 ?auto_180196 ) ) ( not ( = ?auto_180190 ?auto_180193 ) ) ( not ( = ?auto_180190 ?auto_180197 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180195 ?auto_180196 ?auto_180193 ?auto_180197 ?auto_180194 ?auto_180191 )
      ( MAKE-1PILE ?auto_180189 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180198 - BLOCK
    )
    :vars
    (
      ?auto_180204 - BLOCK
      ?auto_180199 - BLOCK
      ?auto_180205 - BLOCK
      ?auto_180200 - BLOCK
      ?auto_180206 - BLOCK
      ?auto_180201 - BLOCK
      ?auto_180203 - BLOCK
      ?auto_180202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180204 ?auto_180198 ) ( ON-TABLE ?auto_180198 ) ( not ( = ?auto_180198 ?auto_180204 ) ) ( not ( = ?auto_180198 ?auto_180199 ) ) ( not ( = ?auto_180198 ?auto_180205 ) ) ( not ( = ?auto_180204 ?auto_180199 ) ) ( not ( = ?auto_180204 ?auto_180205 ) ) ( not ( = ?auto_180199 ?auto_180205 ) ) ( ON ?auto_180199 ?auto_180204 ) ( CLEAR ?auto_180200 ) ( ON-TABLE ?auto_180206 ) ( ON ?auto_180201 ?auto_180206 ) ( ON ?auto_180203 ?auto_180201 ) ( ON ?auto_180202 ?auto_180203 ) ( ON ?auto_180200 ?auto_180202 ) ( not ( = ?auto_180206 ?auto_180201 ) ) ( not ( = ?auto_180206 ?auto_180203 ) ) ( not ( = ?auto_180206 ?auto_180202 ) ) ( not ( = ?auto_180206 ?auto_180200 ) ) ( not ( = ?auto_180206 ?auto_180205 ) ) ( not ( = ?auto_180201 ?auto_180203 ) ) ( not ( = ?auto_180201 ?auto_180202 ) ) ( not ( = ?auto_180201 ?auto_180200 ) ) ( not ( = ?auto_180201 ?auto_180205 ) ) ( not ( = ?auto_180203 ?auto_180202 ) ) ( not ( = ?auto_180203 ?auto_180200 ) ) ( not ( = ?auto_180203 ?auto_180205 ) ) ( not ( = ?auto_180202 ?auto_180200 ) ) ( not ( = ?auto_180202 ?auto_180205 ) ) ( not ( = ?auto_180200 ?auto_180205 ) ) ( not ( = ?auto_180198 ?auto_180200 ) ) ( not ( = ?auto_180198 ?auto_180206 ) ) ( not ( = ?auto_180198 ?auto_180201 ) ) ( not ( = ?auto_180198 ?auto_180203 ) ) ( not ( = ?auto_180198 ?auto_180202 ) ) ( not ( = ?auto_180204 ?auto_180200 ) ) ( not ( = ?auto_180204 ?auto_180206 ) ) ( not ( = ?auto_180204 ?auto_180201 ) ) ( not ( = ?auto_180204 ?auto_180203 ) ) ( not ( = ?auto_180204 ?auto_180202 ) ) ( not ( = ?auto_180199 ?auto_180200 ) ) ( not ( = ?auto_180199 ?auto_180206 ) ) ( not ( = ?auto_180199 ?auto_180201 ) ) ( not ( = ?auto_180199 ?auto_180203 ) ) ( not ( = ?auto_180199 ?auto_180202 ) ) ( ON ?auto_180205 ?auto_180199 ) ( CLEAR ?auto_180205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180198 ?auto_180204 ?auto_180199 )
      ( MAKE-1PILE ?auto_180198 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180207 - BLOCK
    )
    :vars
    (
      ?auto_180209 - BLOCK
      ?auto_180210 - BLOCK
      ?auto_180212 - BLOCK
      ?auto_180215 - BLOCK
      ?auto_180208 - BLOCK
      ?auto_180213 - BLOCK
      ?auto_180211 - BLOCK
      ?auto_180214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180209 ?auto_180207 ) ( ON-TABLE ?auto_180207 ) ( not ( = ?auto_180207 ?auto_180209 ) ) ( not ( = ?auto_180207 ?auto_180210 ) ) ( not ( = ?auto_180207 ?auto_180212 ) ) ( not ( = ?auto_180209 ?auto_180210 ) ) ( not ( = ?auto_180209 ?auto_180212 ) ) ( not ( = ?auto_180210 ?auto_180212 ) ) ( ON ?auto_180210 ?auto_180209 ) ( ON-TABLE ?auto_180215 ) ( ON ?auto_180208 ?auto_180215 ) ( ON ?auto_180213 ?auto_180208 ) ( ON ?auto_180211 ?auto_180213 ) ( not ( = ?auto_180215 ?auto_180208 ) ) ( not ( = ?auto_180215 ?auto_180213 ) ) ( not ( = ?auto_180215 ?auto_180211 ) ) ( not ( = ?auto_180215 ?auto_180214 ) ) ( not ( = ?auto_180215 ?auto_180212 ) ) ( not ( = ?auto_180208 ?auto_180213 ) ) ( not ( = ?auto_180208 ?auto_180211 ) ) ( not ( = ?auto_180208 ?auto_180214 ) ) ( not ( = ?auto_180208 ?auto_180212 ) ) ( not ( = ?auto_180213 ?auto_180211 ) ) ( not ( = ?auto_180213 ?auto_180214 ) ) ( not ( = ?auto_180213 ?auto_180212 ) ) ( not ( = ?auto_180211 ?auto_180214 ) ) ( not ( = ?auto_180211 ?auto_180212 ) ) ( not ( = ?auto_180214 ?auto_180212 ) ) ( not ( = ?auto_180207 ?auto_180214 ) ) ( not ( = ?auto_180207 ?auto_180215 ) ) ( not ( = ?auto_180207 ?auto_180208 ) ) ( not ( = ?auto_180207 ?auto_180213 ) ) ( not ( = ?auto_180207 ?auto_180211 ) ) ( not ( = ?auto_180209 ?auto_180214 ) ) ( not ( = ?auto_180209 ?auto_180215 ) ) ( not ( = ?auto_180209 ?auto_180208 ) ) ( not ( = ?auto_180209 ?auto_180213 ) ) ( not ( = ?auto_180209 ?auto_180211 ) ) ( not ( = ?auto_180210 ?auto_180214 ) ) ( not ( = ?auto_180210 ?auto_180215 ) ) ( not ( = ?auto_180210 ?auto_180208 ) ) ( not ( = ?auto_180210 ?auto_180213 ) ) ( not ( = ?auto_180210 ?auto_180211 ) ) ( ON ?auto_180212 ?auto_180210 ) ( CLEAR ?auto_180212 ) ( HOLDING ?auto_180214 ) ( CLEAR ?auto_180211 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180215 ?auto_180208 ?auto_180213 ?auto_180211 ?auto_180214 )
      ( MAKE-1PILE ?auto_180207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180216 - BLOCK
    )
    :vars
    (
      ?auto_180220 - BLOCK
      ?auto_180217 - BLOCK
      ?auto_180218 - BLOCK
      ?auto_180222 - BLOCK
      ?auto_180221 - BLOCK
      ?auto_180224 - BLOCK
      ?auto_180219 - BLOCK
      ?auto_180223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180220 ?auto_180216 ) ( ON-TABLE ?auto_180216 ) ( not ( = ?auto_180216 ?auto_180220 ) ) ( not ( = ?auto_180216 ?auto_180217 ) ) ( not ( = ?auto_180216 ?auto_180218 ) ) ( not ( = ?auto_180220 ?auto_180217 ) ) ( not ( = ?auto_180220 ?auto_180218 ) ) ( not ( = ?auto_180217 ?auto_180218 ) ) ( ON ?auto_180217 ?auto_180220 ) ( ON-TABLE ?auto_180222 ) ( ON ?auto_180221 ?auto_180222 ) ( ON ?auto_180224 ?auto_180221 ) ( ON ?auto_180219 ?auto_180224 ) ( not ( = ?auto_180222 ?auto_180221 ) ) ( not ( = ?auto_180222 ?auto_180224 ) ) ( not ( = ?auto_180222 ?auto_180219 ) ) ( not ( = ?auto_180222 ?auto_180223 ) ) ( not ( = ?auto_180222 ?auto_180218 ) ) ( not ( = ?auto_180221 ?auto_180224 ) ) ( not ( = ?auto_180221 ?auto_180219 ) ) ( not ( = ?auto_180221 ?auto_180223 ) ) ( not ( = ?auto_180221 ?auto_180218 ) ) ( not ( = ?auto_180224 ?auto_180219 ) ) ( not ( = ?auto_180224 ?auto_180223 ) ) ( not ( = ?auto_180224 ?auto_180218 ) ) ( not ( = ?auto_180219 ?auto_180223 ) ) ( not ( = ?auto_180219 ?auto_180218 ) ) ( not ( = ?auto_180223 ?auto_180218 ) ) ( not ( = ?auto_180216 ?auto_180223 ) ) ( not ( = ?auto_180216 ?auto_180222 ) ) ( not ( = ?auto_180216 ?auto_180221 ) ) ( not ( = ?auto_180216 ?auto_180224 ) ) ( not ( = ?auto_180216 ?auto_180219 ) ) ( not ( = ?auto_180220 ?auto_180223 ) ) ( not ( = ?auto_180220 ?auto_180222 ) ) ( not ( = ?auto_180220 ?auto_180221 ) ) ( not ( = ?auto_180220 ?auto_180224 ) ) ( not ( = ?auto_180220 ?auto_180219 ) ) ( not ( = ?auto_180217 ?auto_180223 ) ) ( not ( = ?auto_180217 ?auto_180222 ) ) ( not ( = ?auto_180217 ?auto_180221 ) ) ( not ( = ?auto_180217 ?auto_180224 ) ) ( not ( = ?auto_180217 ?auto_180219 ) ) ( ON ?auto_180218 ?auto_180217 ) ( CLEAR ?auto_180219 ) ( ON ?auto_180223 ?auto_180218 ) ( CLEAR ?auto_180223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180216 ?auto_180220 ?auto_180217 ?auto_180218 )
      ( MAKE-1PILE ?auto_180216 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180225 - BLOCK
    )
    :vars
    (
      ?auto_180227 - BLOCK
      ?auto_180232 - BLOCK
      ?auto_180226 - BLOCK
      ?auto_180228 - BLOCK
      ?auto_180233 - BLOCK
      ?auto_180229 - BLOCK
      ?auto_180230 - BLOCK
      ?auto_180231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180227 ?auto_180225 ) ( ON-TABLE ?auto_180225 ) ( not ( = ?auto_180225 ?auto_180227 ) ) ( not ( = ?auto_180225 ?auto_180232 ) ) ( not ( = ?auto_180225 ?auto_180226 ) ) ( not ( = ?auto_180227 ?auto_180232 ) ) ( not ( = ?auto_180227 ?auto_180226 ) ) ( not ( = ?auto_180232 ?auto_180226 ) ) ( ON ?auto_180232 ?auto_180227 ) ( ON-TABLE ?auto_180228 ) ( ON ?auto_180233 ?auto_180228 ) ( ON ?auto_180229 ?auto_180233 ) ( not ( = ?auto_180228 ?auto_180233 ) ) ( not ( = ?auto_180228 ?auto_180229 ) ) ( not ( = ?auto_180228 ?auto_180230 ) ) ( not ( = ?auto_180228 ?auto_180231 ) ) ( not ( = ?auto_180228 ?auto_180226 ) ) ( not ( = ?auto_180233 ?auto_180229 ) ) ( not ( = ?auto_180233 ?auto_180230 ) ) ( not ( = ?auto_180233 ?auto_180231 ) ) ( not ( = ?auto_180233 ?auto_180226 ) ) ( not ( = ?auto_180229 ?auto_180230 ) ) ( not ( = ?auto_180229 ?auto_180231 ) ) ( not ( = ?auto_180229 ?auto_180226 ) ) ( not ( = ?auto_180230 ?auto_180231 ) ) ( not ( = ?auto_180230 ?auto_180226 ) ) ( not ( = ?auto_180231 ?auto_180226 ) ) ( not ( = ?auto_180225 ?auto_180231 ) ) ( not ( = ?auto_180225 ?auto_180228 ) ) ( not ( = ?auto_180225 ?auto_180233 ) ) ( not ( = ?auto_180225 ?auto_180229 ) ) ( not ( = ?auto_180225 ?auto_180230 ) ) ( not ( = ?auto_180227 ?auto_180231 ) ) ( not ( = ?auto_180227 ?auto_180228 ) ) ( not ( = ?auto_180227 ?auto_180233 ) ) ( not ( = ?auto_180227 ?auto_180229 ) ) ( not ( = ?auto_180227 ?auto_180230 ) ) ( not ( = ?auto_180232 ?auto_180231 ) ) ( not ( = ?auto_180232 ?auto_180228 ) ) ( not ( = ?auto_180232 ?auto_180233 ) ) ( not ( = ?auto_180232 ?auto_180229 ) ) ( not ( = ?auto_180232 ?auto_180230 ) ) ( ON ?auto_180226 ?auto_180232 ) ( ON ?auto_180231 ?auto_180226 ) ( CLEAR ?auto_180231 ) ( HOLDING ?auto_180230 ) ( CLEAR ?auto_180229 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180228 ?auto_180233 ?auto_180229 ?auto_180230 )
      ( MAKE-1PILE ?auto_180225 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180234 - BLOCK
    )
    :vars
    (
      ?auto_180241 - BLOCK
      ?auto_180237 - BLOCK
      ?auto_180239 - BLOCK
      ?auto_180242 - BLOCK
      ?auto_180238 - BLOCK
      ?auto_180240 - BLOCK
      ?auto_180235 - BLOCK
      ?auto_180236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180241 ?auto_180234 ) ( ON-TABLE ?auto_180234 ) ( not ( = ?auto_180234 ?auto_180241 ) ) ( not ( = ?auto_180234 ?auto_180237 ) ) ( not ( = ?auto_180234 ?auto_180239 ) ) ( not ( = ?auto_180241 ?auto_180237 ) ) ( not ( = ?auto_180241 ?auto_180239 ) ) ( not ( = ?auto_180237 ?auto_180239 ) ) ( ON ?auto_180237 ?auto_180241 ) ( ON-TABLE ?auto_180242 ) ( ON ?auto_180238 ?auto_180242 ) ( ON ?auto_180240 ?auto_180238 ) ( not ( = ?auto_180242 ?auto_180238 ) ) ( not ( = ?auto_180242 ?auto_180240 ) ) ( not ( = ?auto_180242 ?auto_180235 ) ) ( not ( = ?auto_180242 ?auto_180236 ) ) ( not ( = ?auto_180242 ?auto_180239 ) ) ( not ( = ?auto_180238 ?auto_180240 ) ) ( not ( = ?auto_180238 ?auto_180235 ) ) ( not ( = ?auto_180238 ?auto_180236 ) ) ( not ( = ?auto_180238 ?auto_180239 ) ) ( not ( = ?auto_180240 ?auto_180235 ) ) ( not ( = ?auto_180240 ?auto_180236 ) ) ( not ( = ?auto_180240 ?auto_180239 ) ) ( not ( = ?auto_180235 ?auto_180236 ) ) ( not ( = ?auto_180235 ?auto_180239 ) ) ( not ( = ?auto_180236 ?auto_180239 ) ) ( not ( = ?auto_180234 ?auto_180236 ) ) ( not ( = ?auto_180234 ?auto_180242 ) ) ( not ( = ?auto_180234 ?auto_180238 ) ) ( not ( = ?auto_180234 ?auto_180240 ) ) ( not ( = ?auto_180234 ?auto_180235 ) ) ( not ( = ?auto_180241 ?auto_180236 ) ) ( not ( = ?auto_180241 ?auto_180242 ) ) ( not ( = ?auto_180241 ?auto_180238 ) ) ( not ( = ?auto_180241 ?auto_180240 ) ) ( not ( = ?auto_180241 ?auto_180235 ) ) ( not ( = ?auto_180237 ?auto_180236 ) ) ( not ( = ?auto_180237 ?auto_180242 ) ) ( not ( = ?auto_180237 ?auto_180238 ) ) ( not ( = ?auto_180237 ?auto_180240 ) ) ( not ( = ?auto_180237 ?auto_180235 ) ) ( ON ?auto_180239 ?auto_180237 ) ( ON ?auto_180236 ?auto_180239 ) ( CLEAR ?auto_180240 ) ( ON ?auto_180235 ?auto_180236 ) ( CLEAR ?auto_180235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180234 ?auto_180241 ?auto_180237 ?auto_180239 ?auto_180236 )
      ( MAKE-1PILE ?auto_180234 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180243 - BLOCK
    )
    :vars
    (
      ?auto_180246 - BLOCK
      ?auto_180251 - BLOCK
      ?auto_180249 - BLOCK
      ?auto_180247 - BLOCK
      ?auto_180244 - BLOCK
      ?auto_180248 - BLOCK
      ?auto_180245 - BLOCK
      ?auto_180250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180246 ?auto_180243 ) ( ON-TABLE ?auto_180243 ) ( not ( = ?auto_180243 ?auto_180246 ) ) ( not ( = ?auto_180243 ?auto_180251 ) ) ( not ( = ?auto_180243 ?auto_180249 ) ) ( not ( = ?auto_180246 ?auto_180251 ) ) ( not ( = ?auto_180246 ?auto_180249 ) ) ( not ( = ?auto_180251 ?auto_180249 ) ) ( ON ?auto_180251 ?auto_180246 ) ( ON-TABLE ?auto_180247 ) ( ON ?auto_180244 ?auto_180247 ) ( not ( = ?auto_180247 ?auto_180244 ) ) ( not ( = ?auto_180247 ?auto_180248 ) ) ( not ( = ?auto_180247 ?auto_180245 ) ) ( not ( = ?auto_180247 ?auto_180250 ) ) ( not ( = ?auto_180247 ?auto_180249 ) ) ( not ( = ?auto_180244 ?auto_180248 ) ) ( not ( = ?auto_180244 ?auto_180245 ) ) ( not ( = ?auto_180244 ?auto_180250 ) ) ( not ( = ?auto_180244 ?auto_180249 ) ) ( not ( = ?auto_180248 ?auto_180245 ) ) ( not ( = ?auto_180248 ?auto_180250 ) ) ( not ( = ?auto_180248 ?auto_180249 ) ) ( not ( = ?auto_180245 ?auto_180250 ) ) ( not ( = ?auto_180245 ?auto_180249 ) ) ( not ( = ?auto_180250 ?auto_180249 ) ) ( not ( = ?auto_180243 ?auto_180250 ) ) ( not ( = ?auto_180243 ?auto_180247 ) ) ( not ( = ?auto_180243 ?auto_180244 ) ) ( not ( = ?auto_180243 ?auto_180248 ) ) ( not ( = ?auto_180243 ?auto_180245 ) ) ( not ( = ?auto_180246 ?auto_180250 ) ) ( not ( = ?auto_180246 ?auto_180247 ) ) ( not ( = ?auto_180246 ?auto_180244 ) ) ( not ( = ?auto_180246 ?auto_180248 ) ) ( not ( = ?auto_180246 ?auto_180245 ) ) ( not ( = ?auto_180251 ?auto_180250 ) ) ( not ( = ?auto_180251 ?auto_180247 ) ) ( not ( = ?auto_180251 ?auto_180244 ) ) ( not ( = ?auto_180251 ?auto_180248 ) ) ( not ( = ?auto_180251 ?auto_180245 ) ) ( ON ?auto_180249 ?auto_180251 ) ( ON ?auto_180250 ?auto_180249 ) ( ON ?auto_180245 ?auto_180250 ) ( CLEAR ?auto_180245 ) ( HOLDING ?auto_180248 ) ( CLEAR ?auto_180244 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180247 ?auto_180244 ?auto_180248 )
      ( MAKE-1PILE ?auto_180243 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180252 - BLOCK
    )
    :vars
    (
      ?auto_180254 - BLOCK
      ?auto_180253 - BLOCK
      ?auto_180257 - BLOCK
      ?auto_180260 - BLOCK
      ?auto_180259 - BLOCK
      ?auto_180258 - BLOCK
      ?auto_180255 - BLOCK
      ?auto_180256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180254 ?auto_180252 ) ( ON-TABLE ?auto_180252 ) ( not ( = ?auto_180252 ?auto_180254 ) ) ( not ( = ?auto_180252 ?auto_180253 ) ) ( not ( = ?auto_180252 ?auto_180257 ) ) ( not ( = ?auto_180254 ?auto_180253 ) ) ( not ( = ?auto_180254 ?auto_180257 ) ) ( not ( = ?auto_180253 ?auto_180257 ) ) ( ON ?auto_180253 ?auto_180254 ) ( ON-TABLE ?auto_180260 ) ( ON ?auto_180259 ?auto_180260 ) ( not ( = ?auto_180260 ?auto_180259 ) ) ( not ( = ?auto_180260 ?auto_180258 ) ) ( not ( = ?auto_180260 ?auto_180255 ) ) ( not ( = ?auto_180260 ?auto_180256 ) ) ( not ( = ?auto_180260 ?auto_180257 ) ) ( not ( = ?auto_180259 ?auto_180258 ) ) ( not ( = ?auto_180259 ?auto_180255 ) ) ( not ( = ?auto_180259 ?auto_180256 ) ) ( not ( = ?auto_180259 ?auto_180257 ) ) ( not ( = ?auto_180258 ?auto_180255 ) ) ( not ( = ?auto_180258 ?auto_180256 ) ) ( not ( = ?auto_180258 ?auto_180257 ) ) ( not ( = ?auto_180255 ?auto_180256 ) ) ( not ( = ?auto_180255 ?auto_180257 ) ) ( not ( = ?auto_180256 ?auto_180257 ) ) ( not ( = ?auto_180252 ?auto_180256 ) ) ( not ( = ?auto_180252 ?auto_180260 ) ) ( not ( = ?auto_180252 ?auto_180259 ) ) ( not ( = ?auto_180252 ?auto_180258 ) ) ( not ( = ?auto_180252 ?auto_180255 ) ) ( not ( = ?auto_180254 ?auto_180256 ) ) ( not ( = ?auto_180254 ?auto_180260 ) ) ( not ( = ?auto_180254 ?auto_180259 ) ) ( not ( = ?auto_180254 ?auto_180258 ) ) ( not ( = ?auto_180254 ?auto_180255 ) ) ( not ( = ?auto_180253 ?auto_180256 ) ) ( not ( = ?auto_180253 ?auto_180260 ) ) ( not ( = ?auto_180253 ?auto_180259 ) ) ( not ( = ?auto_180253 ?auto_180258 ) ) ( not ( = ?auto_180253 ?auto_180255 ) ) ( ON ?auto_180257 ?auto_180253 ) ( ON ?auto_180256 ?auto_180257 ) ( ON ?auto_180255 ?auto_180256 ) ( CLEAR ?auto_180259 ) ( ON ?auto_180258 ?auto_180255 ) ( CLEAR ?auto_180258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180252 ?auto_180254 ?auto_180253 ?auto_180257 ?auto_180256 ?auto_180255 )
      ( MAKE-1PILE ?auto_180252 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180261 - BLOCK
    )
    :vars
    (
      ?auto_180267 - BLOCK
      ?auto_180263 - BLOCK
      ?auto_180268 - BLOCK
      ?auto_180265 - BLOCK
      ?auto_180266 - BLOCK
      ?auto_180262 - BLOCK
      ?auto_180269 - BLOCK
      ?auto_180264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180267 ?auto_180261 ) ( ON-TABLE ?auto_180261 ) ( not ( = ?auto_180261 ?auto_180267 ) ) ( not ( = ?auto_180261 ?auto_180263 ) ) ( not ( = ?auto_180261 ?auto_180268 ) ) ( not ( = ?auto_180267 ?auto_180263 ) ) ( not ( = ?auto_180267 ?auto_180268 ) ) ( not ( = ?auto_180263 ?auto_180268 ) ) ( ON ?auto_180263 ?auto_180267 ) ( ON-TABLE ?auto_180265 ) ( not ( = ?auto_180265 ?auto_180266 ) ) ( not ( = ?auto_180265 ?auto_180262 ) ) ( not ( = ?auto_180265 ?auto_180269 ) ) ( not ( = ?auto_180265 ?auto_180264 ) ) ( not ( = ?auto_180265 ?auto_180268 ) ) ( not ( = ?auto_180266 ?auto_180262 ) ) ( not ( = ?auto_180266 ?auto_180269 ) ) ( not ( = ?auto_180266 ?auto_180264 ) ) ( not ( = ?auto_180266 ?auto_180268 ) ) ( not ( = ?auto_180262 ?auto_180269 ) ) ( not ( = ?auto_180262 ?auto_180264 ) ) ( not ( = ?auto_180262 ?auto_180268 ) ) ( not ( = ?auto_180269 ?auto_180264 ) ) ( not ( = ?auto_180269 ?auto_180268 ) ) ( not ( = ?auto_180264 ?auto_180268 ) ) ( not ( = ?auto_180261 ?auto_180264 ) ) ( not ( = ?auto_180261 ?auto_180265 ) ) ( not ( = ?auto_180261 ?auto_180266 ) ) ( not ( = ?auto_180261 ?auto_180262 ) ) ( not ( = ?auto_180261 ?auto_180269 ) ) ( not ( = ?auto_180267 ?auto_180264 ) ) ( not ( = ?auto_180267 ?auto_180265 ) ) ( not ( = ?auto_180267 ?auto_180266 ) ) ( not ( = ?auto_180267 ?auto_180262 ) ) ( not ( = ?auto_180267 ?auto_180269 ) ) ( not ( = ?auto_180263 ?auto_180264 ) ) ( not ( = ?auto_180263 ?auto_180265 ) ) ( not ( = ?auto_180263 ?auto_180266 ) ) ( not ( = ?auto_180263 ?auto_180262 ) ) ( not ( = ?auto_180263 ?auto_180269 ) ) ( ON ?auto_180268 ?auto_180263 ) ( ON ?auto_180264 ?auto_180268 ) ( ON ?auto_180269 ?auto_180264 ) ( ON ?auto_180262 ?auto_180269 ) ( CLEAR ?auto_180262 ) ( HOLDING ?auto_180266 ) ( CLEAR ?auto_180265 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180265 ?auto_180266 )
      ( MAKE-1PILE ?auto_180261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180270 - BLOCK
    )
    :vars
    (
      ?auto_180271 - BLOCK
      ?auto_180276 - BLOCK
      ?auto_180277 - BLOCK
      ?auto_180278 - BLOCK
      ?auto_180273 - BLOCK
      ?auto_180272 - BLOCK
      ?auto_180275 - BLOCK
      ?auto_180274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180271 ?auto_180270 ) ( ON-TABLE ?auto_180270 ) ( not ( = ?auto_180270 ?auto_180271 ) ) ( not ( = ?auto_180270 ?auto_180276 ) ) ( not ( = ?auto_180270 ?auto_180277 ) ) ( not ( = ?auto_180271 ?auto_180276 ) ) ( not ( = ?auto_180271 ?auto_180277 ) ) ( not ( = ?auto_180276 ?auto_180277 ) ) ( ON ?auto_180276 ?auto_180271 ) ( ON-TABLE ?auto_180278 ) ( not ( = ?auto_180278 ?auto_180273 ) ) ( not ( = ?auto_180278 ?auto_180272 ) ) ( not ( = ?auto_180278 ?auto_180275 ) ) ( not ( = ?auto_180278 ?auto_180274 ) ) ( not ( = ?auto_180278 ?auto_180277 ) ) ( not ( = ?auto_180273 ?auto_180272 ) ) ( not ( = ?auto_180273 ?auto_180275 ) ) ( not ( = ?auto_180273 ?auto_180274 ) ) ( not ( = ?auto_180273 ?auto_180277 ) ) ( not ( = ?auto_180272 ?auto_180275 ) ) ( not ( = ?auto_180272 ?auto_180274 ) ) ( not ( = ?auto_180272 ?auto_180277 ) ) ( not ( = ?auto_180275 ?auto_180274 ) ) ( not ( = ?auto_180275 ?auto_180277 ) ) ( not ( = ?auto_180274 ?auto_180277 ) ) ( not ( = ?auto_180270 ?auto_180274 ) ) ( not ( = ?auto_180270 ?auto_180278 ) ) ( not ( = ?auto_180270 ?auto_180273 ) ) ( not ( = ?auto_180270 ?auto_180272 ) ) ( not ( = ?auto_180270 ?auto_180275 ) ) ( not ( = ?auto_180271 ?auto_180274 ) ) ( not ( = ?auto_180271 ?auto_180278 ) ) ( not ( = ?auto_180271 ?auto_180273 ) ) ( not ( = ?auto_180271 ?auto_180272 ) ) ( not ( = ?auto_180271 ?auto_180275 ) ) ( not ( = ?auto_180276 ?auto_180274 ) ) ( not ( = ?auto_180276 ?auto_180278 ) ) ( not ( = ?auto_180276 ?auto_180273 ) ) ( not ( = ?auto_180276 ?auto_180272 ) ) ( not ( = ?auto_180276 ?auto_180275 ) ) ( ON ?auto_180277 ?auto_180276 ) ( ON ?auto_180274 ?auto_180277 ) ( ON ?auto_180275 ?auto_180274 ) ( ON ?auto_180272 ?auto_180275 ) ( CLEAR ?auto_180278 ) ( ON ?auto_180273 ?auto_180272 ) ( CLEAR ?auto_180273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180270 ?auto_180271 ?auto_180276 ?auto_180277 ?auto_180274 ?auto_180275 ?auto_180272 )
      ( MAKE-1PILE ?auto_180270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180279 - BLOCK
    )
    :vars
    (
      ?auto_180281 - BLOCK
      ?auto_180282 - BLOCK
      ?auto_180283 - BLOCK
      ?auto_180285 - BLOCK
      ?auto_180286 - BLOCK
      ?auto_180287 - BLOCK
      ?auto_180280 - BLOCK
      ?auto_180284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180281 ?auto_180279 ) ( ON-TABLE ?auto_180279 ) ( not ( = ?auto_180279 ?auto_180281 ) ) ( not ( = ?auto_180279 ?auto_180282 ) ) ( not ( = ?auto_180279 ?auto_180283 ) ) ( not ( = ?auto_180281 ?auto_180282 ) ) ( not ( = ?auto_180281 ?auto_180283 ) ) ( not ( = ?auto_180282 ?auto_180283 ) ) ( ON ?auto_180282 ?auto_180281 ) ( not ( = ?auto_180285 ?auto_180286 ) ) ( not ( = ?auto_180285 ?auto_180287 ) ) ( not ( = ?auto_180285 ?auto_180280 ) ) ( not ( = ?auto_180285 ?auto_180284 ) ) ( not ( = ?auto_180285 ?auto_180283 ) ) ( not ( = ?auto_180286 ?auto_180287 ) ) ( not ( = ?auto_180286 ?auto_180280 ) ) ( not ( = ?auto_180286 ?auto_180284 ) ) ( not ( = ?auto_180286 ?auto_180283 ) ) ( not ( = ?auto_180287 ?auto_180280 ) ) ( not ( = ?auto_180287 ?auto_180284 ) ) ( not ( = ?auto_180287 ?auto_180283 ) ) ( not ( = ?auto_180280 ?auto_180284 ) ) ( not ( = ?auto_180280 ?auto_180283 ) ) ( not ( = ?auto_180284 ?auto_180283 ) ) ( not ( = ?auto_180279 ?auto_180284 ) ) ( not ( = ?auto_180279 ?auto_180285 ) ) ( not ( = ?auto_180279 ?auto_180286 ) ) ( not ( = ?auto_180279 ?auto_180287 ) ) ( not ( = ?auto_180279 ?auto_180280 ) ) ( not ( = ?auto_180281 ?auto_180284 ) ) ( not ( = ?auto_180281 ?auto_180285 ) ) ( not ( = ?auto_180281 ?auto_180286 ) ) ( not ( = ?auto_180281 ?auto_180287 ) ) ( not ( = ?auto_180281 ?auto_180280 ) ) ( not ( = ?auto_180282 ?auto_180284 ) ) ( not ( = ?auto_180282 ?auto_180285 ) ) ( not ( = ?auto_180282 ?auto_180286 ) ) ( not ( = ?auto_180282 ?auto_180287 ) ) ( not ( = ?auto_180282 ?auto_180280 ) ) ( ON ?auto_180283 ?auto_180282 ) ( ON ?auto_180284 ?auto_180283 ) ( ON ?auto_180280 ?auto_180284 ) ( ON ?auto_180287 ?auto_180280 ) ( ON ?auto_180286 ?auto_180287 ) ( CLEAR ?auto_180286 ) ( HOLDING ?auto_180285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180285 )
      ( MAKE-1PILE ?auto_180279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180288 - BLOCK
    )
    :vars
    (
      ?auto_180290 - BLOCK
      ?auto_180296 - BLOCK
      ?auto_180295 - BLOCK
      ?auto_180292 - BLOCK
      ?auto_180289 - BLOCK
      ?auto_180293 - BLOCK
      ?auto_180294 - BLOCK
      ?auto_180291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180290 ?auto_180288 ) ( ON-TABLE ?auto_180288 ) ( not ( = ?auto_180288 ?auto_180290 ) ) ( not ( = ?auto_180288 ?auto_180296 ) ) ( not ( = ?auto_180288 ?auto_180295 ) ) ( not ( = ?auto_180290 ?auto_180296 ) ) ( not ( = ?auto_180290 ?auto_180295 ) ) ( not ( = ?auto_180296 ?auto_180295 ) ) ( ON ?auto_180296 ?auto_180290 ) ( not ( = ?auto_180292 ?auto_180289 ) ) ( not ( = ?auto_180292 ?auto_180293 ) ) ( not ( = ?auto_180292 ?auto_180294 ) ) ( not ( = ?auto_180292 ?auto_180291 ) ) ( not ( = ?auto_180292 ?auto_180295 ) ) ( not ( = ?auto_180289 ?auto_180293 ) ) ( not ( = ?auto_180289 ?auto_180294 ) ) ( not ( = ?auto_180289 ?auto_180291 ) ) ( not ( = ?auto_180289 ?auto_180295 ) ) ( not ( = ?auto_180293 ?auto_180294 ) ) ( not ( = ?auto_180293 ?auto_180291 ) ) ( not ( = ?auto_180293 ?auto_180295 ) ) ( not ( = ?auto_180294 ?auto_180291 ) ) ( not ( = ?auto_180294 ?auto_180295 ) ) ( not ( = ?auto_180291 ?auto_180295 ) ) ( not ( = ?auto_180288 ?auto_180291 ) ) ( not ( = ?auto_180288 ?auto_180292 ) ) ( not ( = ?auto_180288 ?auto_180289 ) ) ( not ( = ?auto_180288 ?auto_180293 ) ) ( not ( = ?auto_180288 ?auto_180294 ) ) ( not ( = ?auto_180290 ?auto_180291 ) ) ( not ( = ?auto_180290 ?auto_180292 ) ) ( not ( = ?auto_180290 ?auto_180289 ) ) ( not ( = ?auto_180290 ?auto_180293 ) ) ( not ( = ?auto_180290 ?auto_180294 ) ) ( not ( = ?auto_180296 ?auto_180291 ) ) ( not ( = ?auto_180296 ?auto_180292 ) ) ( not ( = ?auto_180296 ?auto_180289 ) ) ( not ( = ?auto_180296 ?auto_180293 ) ) ( not ( = ?auto_180296 ?auto_180294 ) ) ( ON ?auto_180295 ?auto_180296 ) ( ON ?auto_180291 ?auto_180295 ) ( ON ?auto_180294 ?auto_180291 ) ( ON ?auto_180293 ?auto_180294 ) ( ON ?auto_180289 ?auto_180293 ) ( ON ?auto_180292 ?auto_180289 ) ( CLEAR ?auto_180292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180288 ?auto_180290 ?auto_180296 ?auto_180295 ?auto_180291 ?auto_180294 ?auto_180293 ?auto_180289 )
      ( MAKE-1PILE ?auto_180288 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180305 - BLOCK
      ?auto_180306 - BLOCK
      ?auto_180307 - BLOCK
      ?auto_180308 - BLOCK
      ?auto_180309 - BLOCK
      ?auto_180310 - BLOCK
      ?auto_180311 - BLOCK
      ?auto_180312 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_180312 ) ( CLEAR ?auto_180311 ) ( ON-TABLE ?auto_180305 ) ( ON ?auto_180306 ?auto_180305 ) ( ON ?auto_180307 ?auto_180306 ) ( ON ?auto_180308 ?auto_180307 ) ( ON ?auto_180309 ?auto_180308 ) ( ON ?auto_180310 ?auto_180309 ) ( ON ?auto_180311 ?auto_180310 ) ( not ( = ?auto_180305 ?auto_180306 ) ) ( not ( = ?auto_180305 ?auto_180307 ) ) ( not ( = ?auto_180305 ?auto_180308 ) ) ( not ( = ?auto_180305 ?auto_180309 ) ) ( not ( = ?auto_180305 ?auto_180310 ) ) ( not ( = ?auto_180305 ?auto_180311 ) ) ( not ( = ?auto_180305 ?auto_180312 ) ) ( not ( = ?auto_180306 ?auto_180307 ) ) ( not ( = ?auto_180306 ?auto_180308 ) ) ( not ( = ?auto_180306 ?auto_180309 ) ) ( not ( = ?auto_180306 ?auto_180310 ) ) ( not ( = ?auto_180306 ?auto_180311 ) ) ( not ( = ?auto_180306 ?auto_180312 ) ) ( not ( = ?auto_180307 ?auto_180308 ) ) ( not ( = ?auto_180307 ?auto_180309 ) ) ( not ( = ?auto_180307 ?auto_180310 ) ) ( not ( = ?auto_180307 ?auto_180311 ) ) ( not ( = ?auto_180307 ?auto_180312 ) ) ( not ( = ?auto_180308 ?auto_180309 ) ) ( not ( = ?auto_180308 ?auto_180310 ) ) ( not ( = ?auto_180308 ?auto_180311 ) ) ( not ( = ?auto_180308 ?auto_180312 ) ) ( not ( = ?auto_180309 ?auto_180310 ) ) ( not ( = ?auto_180309 ?auto_180311 ) ) ( not ( = ?auto_180309 ?auto_180312 ) ) ( not ( = ?auto_180310 ?auto_180311 ) ) ( not ( = ?auto_180310 ?auto_180312 ) ) ( not ( = ?auto_180311 ?auto_180312 ) ) )
    :subtasks
    ( ( !STACK ?auto_180312 ?auto_180311 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180313 - BLOCK
      ?auto_180314 - BLOCK
      ?auto_180315 - BLOCK
      ?auto_180316 - BLOCK
      ?auto_180317 - BLOCK
      ?auto_180318 - BLOCK
      ?auto_180319 - BLOCK
      ?auto_180320 - BLOCK
    )
    :vars
    (
      ?auto_180321 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180319 ) ( ON-TABLE ?auto_180313 ) ( ON ?auto_180314 ?auto_180313 ) ( ON ?auto_180315 ?auto_180314 ) ( ON ?auto_180316 ?auto_180315 ) ( ON ?auto_180317 ?auto_180316 ) ( ON ?auto_180318 ?auto_180317 ) ( ON ?auto_180319 ?auto_180318 ) ( not ( = ?auto_180313 ?auto_180314 ) ) ( not ( = ?auto_180313 ?auto_180315 ) ) ( not ( = ?auto_180313 ?auto_180316 ) ) ( not ( = ?auto_180313 ?auto_180317 ) ) ( not ( = ?auto_180313 ?auto_180318 ) ) ( not ( = ?auto_180313 ?auto_180319 ) ) ( not ( = ?auto_180313 ?auto_180320 ) ) ( not ( = ?auto_180314 ?auto_180315 ) ) ( not ( = ?auto_180314 ?auto_180316 ) ) ( not ( = ?auto_180314 ?auto_180317 ) ) ( not ( = ?auto_180314 ?auto_180318 ) ) ( not ( = ?auto_180314 ?auto_180319 ) ) ( not ( = ?auto_180314 ?auto_180320 ) ) ( not ( = ?auto_180315 ?auto_180316 ) ) ( not ( = ?auto_180315 ?auto_180317 ) ) ( not ( = ?auto_180315 ?auto_180318 ) ) ( not ( = ?auto_180315 ?auto_180319 ) ) ( not ( = ?auto_180315 ?auto_180320 ) ) ( not ( = ?auto_180316 ?auto_180317 ) ) ( not ( = ?auto_180316 ?auto_180318 ) ) ( not ( = ?auto_180316 ?auto_180319 ) ) ( not ( = ?auto_180316 ?auto_180320 ) ) ( not ( = ?auto_180317 ?auto_180318 ) ) ( not ( = ?auto_180317 ?auto_180319 ) ) ( not ( = ?auto_180317 ?auto_180320 ) ) ( not ( = ?auto_180318 ?auto_180319 ) ) ( not ( = ?auto_180318 ?auto_180320 ) ) ( not ( = ?auto_180319 ?auto_180320 ) ) ( ON ?auto_180320 ?auto_180321 ) ( CLEAR ?auto_180320 ) ( HAND-EMPTY ) ( not ( = ?auto_180313 ?auto_180321 ) ) ( not ( = ?auto_180314 ?auto_180321 ) ) ( not ( = ?auto_180315 ?auto_180321 ) ) ( not ( = ?auto_180316 ?auto_180321 ) ) ( not ( = ?auto_180317 ?auto_180321 ) ) ( not ( = ?auto_180318 ?auto_180321 ) ) ( not ( = ?auto_180319 ?auto_180321 ) ) ( not ( = ?auto_180320 ?auto_180321 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180320 ?auto_180321 )
      ( MAKE-8PILE ?auto_180313 ?auto_180314 ?auto_180315 ?auto_180316 ?auto_180317 ?auto_180318 ?auto_180319 ?auto_180320 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180322 - BLOCK
      ?auto_180323 - BLOCK
      ?auto_180324 - BLOCK
      ?auto_180325 - BLOCK
      ?auto_180326 - BLOCK
      ?auto_180327 - BLOCK
      ?auto_180328 - BLOCK
      ?auto_180329 - BLOCK
    )
    :vars
    (
      ?auto_180330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180322 ) ( ON ?auto_180323 ?auto_180322 ) ( ON ?auto_180324 ?auto_180323 ) ( ON ?auto_180325 ?auto_180324 ) ( ON ?auto_180326 ?auto_180325 ) ( ON ?auto_180327 ?auto_180326 ) ( not ( = ?auto_180322 ?auto_180323 ) ) ( not ( = ?auto_180322 ?auto_180324 ) ) ( not ( = ?auto_180322 ?auto_180325 ) ) ( not ( = ?auto_180322 ?auto_180326 ) ) ( not ( = ?auto_180322 ?auto_180327 ) ) ( not ( = ?auto_180322 ?auto_180328 ) ) ( not ( = ?auto_180322 ?auto_180329 ) ) ( not ( = ?auto_180323 ?auto_180324 ) ) ( not ( = ?auto_180323 ?auto_180325 ) ) ( not ( = ?auto_180323 ?auto_180326 ) ) ( not ( = ?auto_180323 ?auto_180327 ) ) ( not ( = ?auto_180323 ?auto_180328 ) ) ( not ( = ?auto_180323 ?auto_180329 ) ) ( not ( = ?auto_180324 ?auto_180325 ) ) ( not ( = ?auto_180324 ?auto_180326 ) ) ( not ( = ?auto_180324 ?auto_180327 ) ) ( not ( = ?auto_180324 ?auto_180328 ) ) ( not ( = ?auto_180324 ?auto_180329 ) ) ( not ( = ?auto_180325 ?auto_180326 ) ) ( not ( = ?auto_180325 ?auto_180327 ) ) ( not ( = ?auto_180325 ?auto_180328 ) ) ( not ( = ?auto_180325 ?auto_180329 ) ) ( not ( = ?auto_180326 ?auto_180327 ) ) ( not ( = ?auto_180326 ?auto_180328 ) ) ( not ( = ?auto_180326 ?auto_180329 ) ) ( not ( = ?auto_180327 ?auto_180328 ) ) ( not ( = ?auto_180327 ?auto_180329 ) ) ( not ( = ?auto_180328 ?auto_180329 ) ) ( ON ?auto_180329 ?auto_180330 ) ( CLEAR ?auto_180329 ) ( not ( = ?auto_180322 ?auto_180330 ) ) ( not ( = ?auto_180323 ?auto_180330 ) ) ( not ( = ?auto_180324 ?auto_180330 ) ) ( not ( = ?auto_180325 ?auto_180330 ) ) ( not ( = ?auto_180326 ?auto_180330 ) ) ( not ( = ?auto_180327 ?auto_180330 ) ) ( not ( = ?auto_180328 ?auto_180330 ) ) ( not ( = ?auto_180329 ?auto_180330 ) ) ( HOLDING ?auto_180328 ) ( CLEAR ?auto_180327 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180322 ?auto_180323 ?auto_180324 ?auto_180325 ?auto_180326 ?auto_180327 ?auto_180328 )
      ( MAKE-8PILE ?auto_180322 ?auto_180323 ?auto_180324 ?auto_180325 ?auto_180326 ?auto_180327 ?auto_180328 ?auto_180329 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180331 - BLOCK
      ?auto_180332 - BLOCK
      ?auto_180333 - BLOCK
      ?auto_180334 - BLOCK
      ?auto_180335 - BLOCK
      ?auto_180336 - BLOCK
      ?auto_180337 - BLOCK
      ?auto_180338 - BLOCK
    )
    :vars
    (
      ?auto_180339 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180331 ) ( ON ?auto_180332 ?auto_180331 ) ( ON ?auto_180333 ?auto_180332 ) ( ON ?auto_180334 ?auto_180333 ) ( ON ?auto_180335 ?auto_180334 ) ( ON ?auto_180336 ?auto_180335 ) ( not ( = ?auto_180331 ?auto_180332 ) ) ( not ( = ?auto_180331 ?auto_180333 ) ) ( not ( = ?auto_180331 ?auto_180334 ) ) ( not ( = ?auto_180331 ?auto_180335 ) ) ( not ( = ?auto_180331 ?auto_180336 ) ) ( not ( = ?auto_180331 ?auto_180337 ) ) ( not ( = ?auto_180331 ?auto_180338 ) ) ( not ( = ?auto_180332 ?auto_180333 ) ) ( not ( = ?auto_180332 ?auto_180334 ) ) ( not ( = ?auto_180332 ?auto_180335 ) ) ( not ( = ?auto_180332 ?auto_180336 ) ) ( not ( = ?auto_180332 ?auto_180337 ) ) ( not ( = ?auto_180332 ?auto_180338 ) ) ( not ( = ?auto_180333 ?auto_180334 ) ) ( not ( = ?auto_180333 ?auto_180335 ) ) ( not ( = ?auto_180333 ?auto_180336 ) ) ( not ( = ?auto_180333 ?auto_180337 ) ) ( not ( = ?auto_180333 ?auto_180338 ) ) ( not ( = ?auto_180334 ?auto_180335 ) ) ( not ( = ?auto_180334 ?auto_180336 ) ) ( not ( = ?auto_180334 ?auto_180337 ) ) ( not ( = ?auto_180334 ?auto_180338 ) ) ( not ( = ?auto_180335 ?auto_180336 ) ) ( not ( = ?auto_180335 ?auto_180337 ) ) ( not ( = ?auto_180335 ?auto_180338 ) ) ( not ( = ?auto_180336 ?auto_180337 ) ) ( not ( = ?auto_180336 ?auto_180338 ) ) ( not ( = ?auto_180337 ?auto_180338 ) ) ( ON ?auto_180338 ?auto_180339 ) ( not ( = ?auto_180331 ?auto_180339 ) ) ( not ( = ?auto_180332 ?auto_180339 ) ) ( not ( = ?auto_180333 ?auto_180339 ) ) ( not ( = ?auto_180334 ?auto_180339 ) ) ( not ( = ?auto_180335 ?auto_180339 ) ) ( not ( = ?auto_180336 ?auto_180339 ) ) ( not ( = ?auto_180337 ?auto_180339 ) ) ( not ( = ?auto_180338 ?auto_180339 ) ) ( CLEAR ?auto_180336 ) ( ON ?auto_180337 ?auto_180338 ) ( CLEAR ?auto_180337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180339 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180339 ?auto_180338 )
      ( MAKE-8PILE ?auto_180331 ?auto_180332 ?auto_180333 ?auto_180334 ?auto_180335 ?auto_180336 ?auto_180337 ?auto_180338 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180340 - BLOCK
      ?auto_180341 - BLOCK
      ?auto_180342 - BLOCK
      ?auto_180343 - BLOCK
      ?auto_180344 - BLOCK
      ?auto_180345 - BLOCK
      ?auto_180346 - BLOCK
      ?auto_180347 - BLOCK
    )
    :vars
    (
      ?auto_180348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180340 ) ( ON ?auto_180341 ?auto_180340 ) ( ON ?auto_180342 ?auto_180341 ) ( ON ?auto_180343 ?auto_180342 ) ( ON ?auto_180344 ?auto_180343 ) ( not ( = ?auto_180340 ?auto_180341 ) ) ( not ( = ?auto_180340 ?auto_180342 ) ) ( not ( = ?auto_180340 ?auto_180343 ) ) ( not ( = ?auto_180340 ?auto_180344 ) ) ( not ( = ?auto_180340 ?auto_180345 ) ) ( not ( = ?auto_180340 ?auto_180346 ) ) ( not ( = ?auto_180340 ?auto_180347 ) ) ( not ( = ?auto_180341 ?auto_180342 ) ) ( not ( = ?auto_180341 ?auto_180343 ) ) ( not ( = ?auto_180341 ?auto_180344 ) ) ( not ( = ?auto_180341 ?auto_180345 ) ) ( not ( = ?auto_180341 ?auto_180346 ) ) ( not ( = ?auto_180341 ?auto_180347 ) ) ( not ( = ?auto_180342 ?auto_180343 ) ) ( not ( = ?auto_180342 ?auto_180344 ) ) ( not ( = ?auto_180342 ?auto_180345 ) ) ( not ( = ?auto_180342 ?auto_180346 ) ) ( not ( = ?auto_180342 ?auto_180347 ) ) ( not ( = ?auto_180343 ?auto_180344 ) ) ( not ( = ?auto_180343 ?auto_180345 ) ) ( not ( = ?auto_180343 ?auto_180346 ) ) ( not ( = ?auto_180343 ?auto_180347 ) ) ( not ( = ?auto_180344 ?auto_180345 ) ) ( not ( = ?auto_180344 ?auto_180346 ) ) ( not ( = ?auto_180344 ?auto_180347 ) ) ( not ( = ?auto_180345 ?auto_180346 ) ) ( not ( = ?auto_180345 ?auto_180347 ) ) ( not ( = ?auto_180346 ?auto_180347 ) ) ( ON ?auto_180347 ?auto_180348 ) ( not ( = ?auto_180340 ?auto_180348 ) ) ( not ( = ?auto_180341 ?auto_180348 ) ) ( not ( = ?auto_180342 ?auto_180348 ) ) ( not ( = ?auto_180343 ?auto_180348 ) ) ( not ( = ?auto_180344 ?auto_180348 ) ) ( not ( = ?auto_180345 ?auto_180348 ) ) ( not ( = ?auto_180346 ?auto_180348 ) ) ( not ( = ?auto_180347 ?auto_180348 ) ) ( ON ?auto_180346 ?auto_180347 ) ( CLEAR ?auto_180346 ) ( ON-TABLE ?auto_180348 ) ( HOLDING ?auto_180345 ) ( CLEAR ?auto_180344 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180340 ?auto_180341 ?auto_180342 ?auto_180343 ?auto_180344 ?auto_180345 )
      ( MAKE-8PILE ?auto_180340 ?auto_180341 ?auto_180342 ?auto_180343 ?auto_180344 ?auto_180345 ?auto_180346 ?auto_180347 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180349 - BLOCK
      ?auto_180350 - BLOCK
      ?auto_180351 - BLOCK
      ?auto_180352 - BLOCK
      ?auto_180353 - BLOCK
      ?auto_180354 - BLOCK
      ?auto_180355 - BLOCK
      ?auto_180356 - BLOCK
    )
    :vars
    (
      ?auto_180357 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180349 ) ( ON ?auto_180350 ?auto_180349 ) ( ON ?auto_180351 ?auto_180350 ) ( ON ?auto_180352 ?auto_180351 ) ( ON ?auto_180353 ?auto_180352 ) ( not ( = ?auto_180349 ?auto_180350 ) ) ( not ( = ?auto_180349 ?auto_180351 ) ) ( not ( = ?auto_180349 ?auto_180352 ) ) ( not ( = ?auto_180349 ?auto_180353 ) ) ( not ( = ?auto_180349 ?auto_180354 ) ) ( not ( = ?auto_180349 ?auto_180355 ) ) ( not ( = ?auto_180349 ?auto_180356 ) ) ( not ( = ?auto_180350 ?auto_180351 ) ) ( not ( = ?auto_180350 ?auto_180352 ) ) ( not ( = ?auto_180350 ?auto_180353 ) ) ( not ( = ?auto_180350 ?auto_180354 ) ) ( not ( = ?auto_180350 ?auto_180355 ) ) ( not ( = ?auto_180350 ?auto_180356 ) ) ( not ( = ?auto_180351 ?auto_180352 ) ) ( not ( = ?auto_180351 ?auto_180353 ) ) ( not ( = ?auto_180351 ?auto_180354 ) ) ( not ( = ?auto_180351 ?auto_180355 ) ) ( not ( = ?auto_180351 ?auto_180356 ) ) ( not ( = ?auto_180352 ?auto_180353 ) ) ( not ( = ?auto_180352 ?auto_180354 ) ) ( not ( = ?auto_180352 ?auto_180355 ) ) ( not ( = ?auto_180352 ?auto_180356 ) ) ( not ( = ?auto_180353 ?auto_180354 ) ) ( not ( = ?auto_180353 ?auto_180355 ) ) ( not ( = ?auto_180353 ?auto_180356 ) ) ( not ( = ?auto_180354 ?auto_180355 ) ) ( not ( = ?auto_180354 ?auto_180356 ) ) ( not ( = ?auto_180355 ?auto_180356 ) ) ( ON ?auto_180356 ?auto_180357 ) ( not ( = ?auto_180349 ?auto_180357 ) ) ( not ( = ?auto_180350 ?auto_180357 ) ) ( not ( = ?auto_180351 ?auto_180357 ) ) ( not ( = ?auto_180352 ?auto_180357 ) ) ( not ( = ?auto_180353 ?auto_180357 ) ) ( not ( = ?auto_180354 ?auto_180357 ) ) ( not ( = ?auto_180355 ?auto_180357 ) ) ( not ( = ?auto_180356 ?auto_180357 ) ) ( ON ?auto_180355 ?auto_180356 ) ( ON-TABLE ?auto_180357 ) ( CLEAR ?auto_180353 ) ( ON ?auto_180354 ?auto_180355 ) ( CLEAR ?auto_180354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180357 ?auto_180356 ?auto_180355 )
      ( MAKE-8PILE ?auto_180349 ?auto_180350 ?auto_180351 ?auto_180352 ?auto_180353 ?auto_180354 ?auto_180355 ?auto_180356 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180358 - BLOCK
      ?auto_180359 - BLOCK
      ?auto_180360 - BLOCK
      ?auto_180361 - BLOCK
      ?auto_180362 - BLOCK
      ?auto_180363 - BLOCK
      ?auto_180364 - BLOCK
      ?auto_180365 - BLOCK
    )
    :vars
    (
      ?auto_180366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180358 ) ( ON ?auto_180359 ?auto_180358 ) ( ON ?auto_180360 ?auto_180359 ) ( ON ?auto_180361 ?auto_180360 ) ( not ( = ?auto_180358 ?auto_180359 ) ) ( not ( = ?auto_180358 ?auto_180360 ) ) ( not ( = ?auto_180358 ?auto_180361 ) ) ( not ( = ?auto_180358 ?auto_180362 ) ) ( not ( = ?auto_180358 ?auto_180363 ) ) ( not ( = ?auto_180358 ?auto_180364 ) ) ( not ( = ?auto_180358 ?auto_180365 ) ) ( not ( = ?auto_180359 ?auto_180360 ) ) ( not ( = ?auto_180359 ?auto_180361 ) ) ( not ( = ?auto_180359 ?auto_180362 ) ) ( not ( = ?auto_180359 ?auto_180363 ) ) ( not ( = ?auto_180359 ?auto_180364 ) ) ( not ( = ?auto_180359 ?auto_180365 ) ) ( not ( = ?auto_180360 ?auto_180361 ) ) ( not ( = ?auto_180360 ?auto_180362 ) ) ( not ( = ?auto_180360 ?auto_180363 ) ) ( not ( = ?auto_180360 ?auto_180364 ) ) ( not ( = ?auto_180360 ?auto_180365 ) ) ( not ( = ?auto_180361 ?auto_180362 ) ) ( not ( = ?auto_180361 ?auto_180363 ) ) ( not ( = ?auto_180361 ?auto_180364 ) ) ( not ( = ?auto_180361 ?auto_180365 ) ) ( not ( = ?auto_180362 ?auto_180363 ) ) ( not ( = ?auto_180362 ?auto_180364 ) ) ( not ( = ?auto_180362 ?auto_180365 ) ) ( not ( = ?auto_180363 ?auto_180364 ) ) ( not ( = ?auto_180363 ?auto_180365 ) ) ( not ( = ?auto_180364 ?auto_180365 ) ) ( ON ?auto_180365 ?auto_180366 ) ( not ( = ?auto_180358 ?auto_180366 ) ) ( not ( = ?auto_180359 ?auto_180366 ) ) ( not ( = ?auto_180360 ?auto_180366 ) ) ( not ( = ?auto_180361 ?auto_180366 ) ) ( not ( = ?auto_180362 ?auto_180366 ) ) ( not ( = ?auto_180363 ?auto_180366 ) ) ( not ( = ?auto_180364 ?auto_180366 ) ) ( not ( = ?auto_180365 ?auto_180366 ) ) ( ON ?auto_180364 ?auto_180365 ) ( ON-TABLE ?auto_180366 ) ( ON ?auto_180363 ?auto_180364 ) ( CLEAR ?auto_180363 ) ( HOLDING ?auto_180362 ) ( CLEAR ?auto_180361 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180358 ?auto_180359 ?auto_180360 ?auto_180361 ?auto_180362 )
      ( MAKE-8PILE ?auto_180358 ?auto_180359 ?auto_180360 ?auto_180361 ?auto_180362 ?auto_180363 ?auto_180364 ?auto_180365 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180367 - BLOCK
      ?auto_180368 - BLOCK
      ?auto_180369 - BLOCK
      ?auto_180370 - BLOCK
      ?auto_180371 - BLOCK
      ?auto_180372 - BLOCK
      ?auto_180373 - BLOCK
      ?auto_180374 - BLOCK
    )
    :vars
    (
      ?auto_180375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180367 ) ( ON ?auto_180368 ?auto_180367 ) ( ON ?auto_180369 ?auto_180368 ) ( ON ?auto_180370 ?auto_180369 ) ( not ( = ?auto_180367 ?auto_180368 ) ) ( not ( = ?auto_180367 ?auto_180369 ) ) ( not ( = ?auto_180367 ?auto_180370 ) ) ( not ( = ?auto_180367 ?auto_180371 ) ) ( not ( = ?auto_180367 ?auto_180372 ) ) ( not ( = ?auto_180367 ?auto_180373 ) ) ( not ( = ?auto_180367 ?auto_180374 ) ) ( not ( = ?auto_180368 ?auto_180369 ) ) ( not ( = ?auto_180368 ?auto_180370 ) ) ( not ( = ?auto_180368 ?auto_180371 ) ) ( not ( = ?auto_180368 ?auto_180372 ) ) ( not ( = ?auto_180368 ?auto_180373 ) ) ( not ( = ?auto_180368 ?auto_180374 ) ) ( not ( = ?auto_180369 ?auto_180370 ) ) ( not ( = ?auto_180369 ?auto_180371 ) ) ( not ( = ?auto_180369 ?auto_180372 ) ) ( not ( = ?auto_180369 ?auto_180373 ) ) ( not ( = ?auto_180369 ?auto_180374 ) ) ( not ( = ?auto_180370 ?auto_180371 ) ) ( not ( = ?auto_180370 ?auto_180372 ) ) ( not ( = ?auto_180370 ?auto_180373 ) ) ( not ( = ?auto_180370 ?auto_180374 ) ) ( not ( = ?auto_180371 ?auto_180372 ) ) ( not ( = ?auto_180371 ?auto_180373 ) ) ( not ( = ?auto_180371 ?auto_180374 ) ) ( not ( = ?auto_180372 ?auto_180373 ) ) ( not ( = ?auto_180372 ?auto_180374 ) ) ( not ( = ?auto_180373 ?auto_180374 ) ) ( ON ?auto_180374 ?auto_180375 ) ( not ( = ?auto_180367 ?auto_180375 ) ) ( not ( = ?auto_180368 ?auto_180375 ) ) ( not ( = ?auto_180369 ?auto_180375 ) ) ( not ( = ?auto_180370 ?auto_180375 ) ) ( not ( = ?auto_180371 ?auto_180375 ) ) ( not ( = ?auto_180372 ?auto_180375 ) ) ( not ( = ?auto_180373 ?auto_180375 ) ) ( not ( = ?auto_180374 ?auto_180375 ) ) ( ON ?auto_180373 ?auto_180374 ) ( ON-TABLE ?auto_180375 ) ( ON ?auto_180372 ?auto_180373 ) ( CLEAR ?auto_180370 ) ( ON ?auto_180371 ?auto_180372 ) ( CLEAR ?auto_180371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180375 ?auto_180374 ?auto_180373 ?auto_180372 )
      ( MAKE-8PILE ?auto_180367 ?auto_180368 ?auto_180369 ?auto_180370 ?auto_180371 ?auto_180372 ?auto_180373 ?auto_180374 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180376 - BLOCK
      ?auto_180377 - BLOCK
      ?auto_180378 - BLOCK
      ?auto_180379 - BLOCK
      ?auto_180380 - BLOCK
      ?auto_180381 - BLOCK
      ?auto_180382 - BLOCK
      ?auto_180383 - BLOCK
    )
    :vars
    (
      ?auto_180384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180376 ) ( ON ?auto_180377 ?auto_180376 ) ( ON ?auto_180378 ?auto_180377 ) ( not ( = ?auto_180376 ?auto_180377 ) ) ( not ( = ?auto_180376 ?auto_180378 ) ) ( not ( = ?auto_180376 ?auto_180379 ) ) ( not ( = ?auto_180376 ?auto_180380 ) ) ( not ( = ?auto_180376 ?auto_180381 ) ) ( not ( = ?auto_180376 ?auto_180382 ) ) ( not ( = ?auto_180376 ?auto_180383 ) ) ( not ( = ?auto_180377 ?auto_180378 ) ) ( not ( = ?auto_180377 ?auto_180379 ) ) ( not ( = ?auto_180377 ?auto_180380 ) ) ( not ( = ?auto_180377 ?auto_180381 ) ) ( not ( = ?auto_180377 ?auto_180382 ) ) ( not ( = ?auto_180377 ?auto_180383 ) ) ( not ( = ?auto_180378 ?auto_180379 ) ) ( not ( = ?auto_180378 ?auto_180380 ) ) ( not ( = ?auto_180378 ?auto_180381 ) ) ( not ( = ?auto_180378 ?auto_180382 ) ) ( not ( = ?auto_180378 ?auto_180383 ) ) ( not ( = ?auto_180379 ?auto_180380 ) ) ( not ( = ?auto_180379 ?auto_180381 ) ) ( not ( = ?auto_180379 ?auto_180382 ) ) ( not ( = ?auto_180379 ?auto_180383 ) ) ( not ( = ?auto_180380 ?auto_180381 ) ) ( not ( = ?auto_180380 ?auto_180382 ) ) ( not ( = ?auto_180380 ?auto_180383 ) ) ( not ( = ?auto_180381 ?auto_180382 ) ) ( not ( = ?auto_180381 ?auto_180383 ) ) ( not ( = ?auto_180382 ?auto_180383 ) ) ( ON ?auto_180383 ?auto_180384 ) ( not ( = ?auto_180376 ?auto_180384 ) ) ( not ( = ?auto_180377 ?auto_180384 ) ) ( not ( = ?auto_180378 ?auto_180384 ) ) ( not ( = ?auto_180379 ?auto_180384 ) ) ( not ( = ?auto_180380 ?auto_180384 ) ) ( not ( = ?auto_180381 ?auto_180384 ) ) ( not ( = ?auto_180382 ?auto_180384 ) ) ( not ( = ?auto_180383 ?auto_180384 ) ) ( ON ?auto_180382 ?auto_180383 ) ( ON-TABLE ?auto_180384 ) ( ON ?auto_180381 ?auto_180382 ) ( ON ?auto_180380 ?auto_180381 ) ( CLEAR ?auto_180380 ) ( HOLDING ?auto_180379 ) ( CLEAR ?auto_180378 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180376 ?auto_180377 ?auto_180378 ?auto_180379 )
      ( MAKE-8PILE ?auto_180376 ?auto_180377 ?auto_180378 ?auto_180379 ?auto_180380 ?auto_180381 ?auto_180382 ?auto_180383 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180385 - BLOCK
      ?auto_180386 - BLOCK
      ?auto_180387 - BLOCK
      ?auto_180388 - BLOCK
      ?auto_180389 - BLOCK
      ?auto_180390 - BLOCK
      ?auto_180391 - BLOCK
      ?auto_180392 - BLOCK
    )
    :vars
    (
      ?auto_180393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180385 ) ( ON ?auto_180386 ?auto_180385 ) ( ON ?auto_180387 ?auto_180386 ) ( not ( = ?auto_180385 ?auto_180386 ) ) ( not ( = ?auto_180385 ?auto_180387 ) ) ( not ( = ?auto_180385 ?auto_180388 ) ) ( not ( = ?auto_180385 ?auto_180389 ) ) ( not ( = ?auto_180385 ?auto_180390 ) ) ( not ( = ?auto_180385 ?auto_180391 ) ) ( not ( = ?auto_180385 ?auto_180392 ) ) ( not ( = ?auto_180386 ?auto_180387 ) ) ( not ( = ?auto_180386 ?auto_180388 ) ) ( not ( = ?auto_180386 ?auto_180389 ) ) ( not ( = ?auto_180386 ?auto_180390 ) ) ( not ( = ?auto_180386 ?auto_180391 ) ) ( not ( = ?auto_180386 ?auto_180392 ) ) ( not ( = ?auto_180387 ?auto_180388 ) ) ( not ( = ?auto_180387 ?auto_180389 ) ) ( not ( = ?auto_180387 ?auto_180390 ) ) ( not ( = ?auto_180387 ?auto_180391 ) ) ( not ( = ?auto_180387 ?auto_180392 ) ) ( not ( = ?auto_180388 ?auto_180389 ) ) ( not ( = ?auto_180388 ?auto_180390 ) ) ( not ( = ?auto_180388 ?auto_180391 ) ) ( not ( = ?auto_180388 ?auto_180392 ) ) ( not ( = ?auto_180389 ?auto_180390 ) ) ( not ( = ?auto_180389 ?auto_180391 ) ) ( not ( = ?auto_180389 ?auto_180392 ) ) ( not ( = ?auto_180390 ?auto_180391 ) ) ( not ( = ?auto_180390 ?auto_180392 ) ) ( not ( = ?auto_180391 ?auto_180392 ) ) ( ON ?auto_180392 ?auto_180393 ) ( not ( = ?auto_180385 ?auto_180393 ) ) ( not ( = ?auto_180386 ?auto_180393 ) ) ( not ( = ?auto_180387 ?auto_180393 ) ) ( not ( = ?auto_180388 ?auto_180393 ) ) ( not ( = ?auto_180389 ?auto_180393 ) ) ( not ( = ?auto_180390 ?auto_180393 ) ) ( not ( = ?auto_180391 ?auto_180393 ) ) ( not ( = ?auto_180392 ?auto_180393 ) ) ( ON ?auto_180391 ?auto_180392 ) ( ON-TABLE ?auto_180393 ) ( ON ?auto_180390 ?auto_180391 ) ( ON ?auto_180389 ?auto_180390 ) ( CLEAR ?auto_180387 ) ( ON ?auto_180388 ?auto_180389 ) ( CLEAR ?auto_180388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180393 ?auto_180392 ?auto_180391 ?auto_180390 ?auto_180389 )
      ( MAKE-8PILE ?auto_180385 ?auto_180386 ?auto_180387 ?auto_180388 ?auto_180389 ?auto_180390 ?auto_180391 ?auto_180392 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180394 - BLOCK
      ?auto_180395 - BLOCK
      ?auto_180396 - BLOCK
      ?auto_180397 - BLOCK
      ?auto_180398 - BLOCK
      ?auto_180399 - BLOCK
      ?auto_180400 - BLOCK
      ?auto_180401 - BLOCK
    )
    :vars
    (
      ?auto_180402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180394 ) ( ON ?auto_180395 ?auto_180394 ) ( not ( = ?auto_180394 ?auto_180395 ) ) ( not ( = ?auto_180394 ?auto_180396 ) ) ( not ( = ?auto_180394 ?auto_180397 ) ) ( not ( = ?auto_180394 ?auto_180398 ) ) ( not ( = ?auto_180394 ?auto_180399 ) ) ( not ( = ?auto_180394 ?auto_180400 ) ) ( not ( = ?auto_180394 ?auto_180401 ) ) ( not ( = ?auto_180395 ?auto_180396 ) ) ( not ( = ?auto_180395 ?auto_180397 ) ) ( not ( = ?auto_180395 ?auto_180398 ) ) ( not ( = ?auto_180395 ?auto_180399 ) ) ( not ( = ?auto_180395 ?auto_180400 ) ) ( not ( = ?auto_180395 ?auto_180401 ) ) ( not ( = ?auto_180396 ?auto_180397 ) ) ( not ( = ?auto_180396 ?auto_180398 ) ) ( not ( = ?auto_180396 ?auto_180399 ) ) ( not ( = ?auto_180396 ?auto_180400 ) ) ( not ( = ?auto_180396 ?auto_180401 ) ) ( not ( = ?auto_180397 ?auto_180398 ) ) ( not ( = ?auto_180397 ?auto_180399 ) ) ( not ( = ?auto_180397 ?auto_180400 ) ) ( not ( = ?auto_180397 ?auto_180401 ) ) ( not ( = ?auto_180398 ?auto_180399 ) ) ( not ( = ?auto_180398 ?auto_180400 ) ) ( not ( = ?auto_180398 ?auto_180401 ) ) ( not ( = ?auto_180399 ?auto_180400 ) ) ( not ( = ?auto_180399 ?auto_180401 ) ) ( not ( = ?auto_180400 ?auto_180401 ) ) ( ON ?auto_180401 ?auto_180402 ) ( not ( = ?auto_180394 ?auto_180402 ) ) ( not ( = ?auto_180395 ?auto_180402 ) ) ( not ( = ?auto_180396 ?auto_180402 ) ) ( not ( = ?auto_180397 ?auto_180402 ) ) ( not ( = ?auto_180398 ?auto_180402 ) ) ( not ( = ?auto_180399 ?auto_180402 ) ) ( not ( = ?auto_180400 ?auto_180402 ) ) ( not ( = ?auto_180401 ?auto_180402 ) ) ( ON ?auto_180400 ?auto_180401 ) ( ON-TABLE ?auto_180402 ) ( ON ?auto_180399 ?auto_180400 ) ( ON ?auto_180398 ?auto_180399 ) ( ON ?auto_180397 ?auto_180398 ) ( CLEAR ?auto_180397 ) ( HOLDING ?auto_180396 ) ( CLEAR ?auto_180395 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180394 ?auto_180395 ?auto_180396 )
      ( MAKE-8PILE ?auto_180394 ?auto_180395 ?auto_180396 ?auto_180397 ?auto_180398 ?auto_180399 ?auto_180400 ?auto_180401 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180403 - BLOCK
      ?auto_180404 - BLOCK
      ?auto_180405 - BLOCK
      ?auto_180406 - BLOCK
      ?auto_180407 - BLOCK
      ?auto_180408 - BLOCK
      ?auto_180409 - BLOCK
      ?auto_180410 - BLOCK
    )
    :vars
    (
      ?auto_180411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180403 ) ( ON ?auto_180404 ?auto_180403 ) ( not ( = ?auto_180403 ?auto_180404 ) ) ( not ( = ?auto_180403 ?auto_180405 ) ) ( not ( = ?auto_180403 ?auto_180406 ) ) ( not ( = ?auto_180403 ?auto_180407 ) ) ( not ( = ?auto_180403 ?auto_180408 ) ) ( not ( = ?auto_180403 ?auto_180409 ) ) ( not ( = ?auto_180403 ?auto_180410 ) ) ( not ( = ?auto_180404 ?auto_180405 ) ) ( not ( = ?auto_180404 ?auto_180406 ) ) ( not ( = ?auto_180404 ?auto_180407 ) ) ( not ( = ?auto_180404 ?auto_180408 ) ) ( not ( = ?auto_180404 ?auto_180409 ) ) ( not ( = ?auto_180404 ?auto_180410 ) ) ( not ( = ?auto_180405 ?auto_180406 ) ) ( not ( = ?auto_180405 ?auto_180407 ) ) ( not ( = ?auto_180405 ?auto_180408 ) ) ( not ( = ?auto_180405 ?auto_180409 ) ) ( not ( = ?auto_180405 ?auto_180410 ) ) ( not ( = ?auto_180406 ?auto_180407 ) ) ( not ( = ?auto_180406 ?auto_180408 ) ) ( not ( = ?auto_180406 ?auto_180409 ) ) ( not ( = ?auto_180406 ?auto_180410 ) ) ( not ( = ?auto_180407 ?auto_180408 ) ) ( not ( = ?auto_180407 ?auto_180409 ) ) ( not ( = ?auto_180407 ?auto_180410 ) ) ( not ( = ?auto_180408 ?auto_180409 ) ) ( not ( = ?auto_180408 ?auto_180410 ) ) ( not ( = ?auto_180409 ?auto_180410 ) ) ( ON ?auto_180410 ?auto_180411 ) ( not ( = ?auto_180403 ?auto_180411 ) ) ( not ( = ?auto_180404 ?auto_180411 ) ) ( not ( = ?auto_180405 ?auto_180411 ) ) ( not ( = ?auto_180406 ?auto_180411 ) ) ( not ( = ?auto_180407 ?auto_180411 ) ) ( not ( = ?auto_180408 ?auto_180411 ) ) ( not ( = ?auto_180409 ?auto_180411 ) ) ( not ( = ?auto_180410 ?auto_180411 ) ) ( ON ?auto_180409 ?auto_180410 ) ( ON-TABLE ?auto_180411 ) ( ON ?auto_180408 ?auto_180409 ) ( ON ?auto_180407 ?auto_180408 ) ( ON ?auto_180406 ?auto_180407 ) ( CLEAR ?auto_180404 ) ( ON ?auto_180405 ?auto_180406 ) ( CLEAR ?auto_180405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180411 ?auto_180410 ?auto_180409 ?auto_180408 ?auto_180407 ?auto_180406 )
      ( MAKE-8PILE ?auto_180403 ?auto_180404 ?auto_180405 ?auto_180406 ?auto_180407 ?auto_180408 ?auto_180409 ?auto_180410 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180412 - BLOCK
      ?auto_180413 - BLOCK
      ?auto_180414 - BLOCK
      ?auto_180415 - BLOCK
      ?auto_180416 - BLOCK
      ?auto_180417 - BLOCK
      ?auto_180418 - BLOCK
      ?auto_180419 - BLOCK
    )
    :vars
    (
      ?auto_180420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180412 ) ( not ( = ?auto_180412 ?auto_180413 ) ) ( not ( = ?auto_180412 ?auto_180414 ) ) ( not ( = ?auto_180412 ?auto_180415 ) ) ( not ( = ?auto_180412 ?auto_180416 ) ) ( not ( = ?auto_180412 ?auto_180417 ) ) ( not ( = ?auto_180412 ?auto_180418 ) ) ( not ( = ?auto_180412 ?auto_180419 ) ) ( not ( = ?auto_180413 ?auto_180414 ) ) ( not ( = ?auto_180413 ?auto_180415 ) ) ( not ( = ?auto_180413 ?auto_180416 ) ) ( not ( = ?auto_180413 ?auto_180417 ) ) ( not ( = ?auto_180413 ?auto_180418 ) ) ( not ( = ?auto_180413 ?auto_180419 ) ) ( not ( = ?auto_180414 ?auto_180415 ) ) ( not ( = ?auto_180414 ?auto_180416 ) ) ( not ( = ?auto_180414 ?auto_180417 ) ) ( not ( = ?auto_180414 ?auto_180418 ) ) ( not ( = ?auto_180414 ?auto_180419 ) ) ( not ( = ?auto_180415 ?auto_180416 ) ) ( not ( = ?auto_180415 ?auto_180417 ) ) ( not ( = ?auto_180415 ?auto_180418 ) ) ( not ( = ?auto_180415 ?auto_180419 ) ) ( not ( = ?auto_180416 ?auto_180417 ) ) ( not ( = ?auto_180416 ?auto_180418 ) ) ( not ( = ?auto_180416 ?auto_180419 ) ) ( not ( = ?auto_180417 ?auto_180418 ) ) ( not ( = ?auto_180417 ?auto_180419 ) ) ( not ( = ?auto_180418 ?auto_180419 ) ) ( ON ?auto_180419 ?auto_180420 ) ( not ( = ?auto_180412 ?auto_180420 ) ) ( not ( = ?auto_180413 ?auto_180420 ) ) ( not ( = ?auto_180414 ?auto_180420 ) ) ( not ( = ?auto_180415 ?auto_180420 ) ) ( not ( = ?auto_180416 ?auto_180420 ) ) ( not ( = ?auto_180417 ?auto_180420 ) ) ( not ( = ?auto_180418 ?auto_180420 ) ) ( not ( = ?auto_180419 ?auto_180420 ) ) ( ON ?auto_180418 ?auto_180419 ) ( ON-TABLE ?auto_180420 ) ( ON ?auto_180417 ?auto_180418 ) ( ON ?auto_180416 ?auto_180417 ) ( ON ?auto_180415 ?auto_180416 ) ( ON ?auto_180414 ?auto_180415 ) ( CLEAR ?auto_180414 ) ( HOLDING ?auto_180413 ) ( CLEAR ?auto_180412 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180412 ?auto_180413 )
      ( MAKE-8PILE ?auto_180412 ?auto_180413 ?auto_180414 ?auto_180415 ?auto_180416 ?auto_180417 ?auto_180418 ?auto_180419 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180421 - BLOCK
      ?auto_180422 - BLOCK
      ?auto_180423 - BLOCK
      ?auto_180424 - BLOCK
      ?auto_180425 - BLOCK
      ?auto_180426 - BLOCK
      ?auto_180427 - BLOCK
      ?auto_180428 - BLOCK
    )
    :vars
    (
      ?auto_180429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180421 ) ( not ( = ?auto_180421 ?auto_180422 ) ) ( not ( = ?auto_180421 ?auto_180423 ) ) ( not ( = ?auto_180421 ?auto_180424 ) ) ( not ( = ?auto_180421 ?auto_180425 ) ) ( not ( = ?auto_180421 ?auto_180426 ) ) ( not ( = ?auto_180421 ?auto_180427 ) ) ( not ( = ?auto_180421 ?auto_180428 ) ) ( not ( = ?auto_180422 ?auto_180423 ) ) ( not ( = ?auto_180422 ?auto_180424 ) ) ( not ( = ?auto_180422 ?auto_180425 ) ) ( not ( = ?auto_180422 ?auto_180426 ) ) ( not ( = ?auto_180422 ?auto_180427 ) ) ( not ( = ?auto_180422 ?auto_180428 ) ) ( not ( = ?auto_180423 ?auto_180424 ) ) ( not ( = ?auto_180423 ?auto_180425 ) ) ( not ( = ?auto_180423 ?auto_180426 ) ) ( not ( = ?auto_180423 ?auto_180427 ) ) ( not ( = ?auto_180423 ?auto_180428 ) ) ( not ( = ?auto_180424 ?auto_180425 ) ) ( not ( = ?auto_180424 ?auto_180426 ) ) ( not ( = ?auto_180424 ?auto_180427 ) ) ( not ( = ?auto_180424 ?auto_180428 ) ) ( not ( = ?auto_180425 ?auto_180426 ) ) ( not ( = ?auto_180425 ?auto_180427 ) ) ( not ( = ?auto_180425 ?auto_180428 ) ) ( not ( = ?auto_180426 ?auto_180427 ) ) ( not ( = ?auto_180426 ?auto_180428 ) ) ( not ( = ?auto_180427 ?auto_180428 ) ) ( ON ?auto_180428 ?auto_180429 ) ( not ( = ?auto_180421 ?auto_180429 ) ) ( not ( = ?auto_180422 ?auto_180429 ) ) ( not ( = ?auto_180423 ?auto_180429 ) ) ( not ( = ?auto_180424 ?auto_180429 ) ) ( not ( = ?auto_180425 ?auto_180429 ) ) ( not ( = ?auto_180426 ?auto_180429 ) ) ( not ( = ?auto_180427 ?auto_180429 ) ) ( not ( = ?auto_180428 ?auto_180429 ) ) ( ON ?auto_180427 ?auto_180428 ) ( ON-TABLE ?auto_180429 ) ( ON ?auto_180426 ?auto_180427 ) ( ON ?auto_180425 ?auto_180426 ) ( ON ?auto_180424 ?auto_180425 ) ( ON ?auto_180423 ?auto_180424 ) ( CLEAR ?auto_180421 ) ( ON ?auto_180422 ?auto_180423 ) ( CLEAR ?auto_180422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180429 ?auto_180428 ?auto_180427 ?auto_180426 ?auto_180425 ?auto_180424 ?auto_180423 )
      ( MAKE-8PILE ?auto_180421 ?auto_180422 ?auto_180423 ?auto_180424 ?auto_180425 ?auto_180426 ?auto_180427 ?auto_180428 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180430 - BLOCK
      ?auto_180431 - BLOCK
      ?auto_180432 - BLOCK
      ?auto_180433 - BLOCK
      ?auto_180434 - BLOCK
      ?auto_180435 - BLOCK
      ?auto_180436 - BLOCK
      ?auto_180437 - BLOCK
    )
    :vars
    (
      ?auto_180438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180430 ?auto_180431 ) ) ( not ( = ?auto_180430 ?auto_180432 ) ) ( not ( = ?auto_180430 ?auto_180433 ) ) ( not ( = ?auto_180430 ?auto_180434 ) ) ( not ( = ?auto_180430 ?auto_180435 ) ) ( not ( = ?auto_180430 ?auto_180436 ) ) ( not ( = ?auto_180430 ?auto_180437 ) ) ( not ( = ?auto_180431 ?auto_180432 ) ) ( not ( = ?auto_180431 ?auto_180433 ) ) ( not ( = ?auto_180431 ?auto_180434 ) ) ( not ( = ?auto_180431 ?auto_180435 ) ) ( not ( = ?auto_180431 ?auto_180436 ) ) ( not ( = ?auto_180431 ?auto_180437 ) ) ( not ( = ?auto_180432 ?auto_180433 ) ) ( not ( = ?auto_180432 ?auto_180434 ) ) ( not ( = ?auto_180432 ?auto_180435 ) ) ( not ( = ?auto_180432 ?auto_180436 ) ) ( not ( = ?auto_180432 ?auto_180437 ) ) ( not ( = ?auto_180433 ?auto_180434 ) ) ( not ( = ?auto_180433 ?auto_180435 ) ) ( not ( = ?auto_180433 ?auto_180436 ) ) ( not ( = ?auto_180433 ?auto_180437 ) ) ( not ( = ?auto_180434 ?auto_180435 ) ) ( not ( = ?auto_180434 ?auto_180436 ) ) ( not ( = ?auto_180434 ?auto_180437 ) ) ( not ( = ?auto_180435 ?auto_180436 ) ) ( not ( = ?auto_180435 ?auto_180437 ) ) ( not ( = ?auto_180436 ?auto_180437 ) ) ( ON ?auto_180437 ?auto_180438 ) ( not ( = ?auto_180430 ?auto_180438 ) ) ( not ( = ?auto_180431 ?auto_180438 ) ) ( not ( = ?auto_180432 ?auto_180438 ) ) ( not ( = ?auto_180433 ?auto_180438 ) ) ( not ( = ?auto_180434 ?auto_180438 ) ) ( not ( = ?auto_180435 ?auto_180438 ) ) ( not ( = ?auto_180436 ?auto_180438 ) ) ( not ( = ?auto_180437 ?auto_180438 ) ) ( ON ?auto_180436 ?auto_180437 ) ( ON-TABLE ?auto_180438 ) ( ON ?auto_180435 ?auto_180436 ) ( ON ?auto_180434 ?auto_180435 ) ( ON ?auto_180433 ?auto_180434 ) ( ON ?auto_180432 ?auto_180433 ) ( ON ?auto_180431 ?auto_180432 ) ( CLEAR ?auto_180431 ) ( HOLDING ?auto_180430 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180430 )
      ( MAKE-8PILE ?auto_180430 ?auto_180431 ?auto_180432 ?auto_180433 ?auto_180434 ?auto_180435 ?auto_180436 ?auto_180437 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180439 - BLOCK
      ?auto_180440 - BLOCK
      ?auto_180441 - BLOCK
      ?auto_180442 - BLOCK
      ?auto_180443 - BLOCK
      ?auto_180444 - BLOCK
      ?auto_180445 - BLOCK
      ?auto_180446 - BLOCK
    )
    :vars
    (
      ?auto_180447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180439 ?auto_180440 ) ) ( not ( = ?auto_180439 ?auto_180441 ) ) ( not ( = ?auto_180439 ?auto_180442 ) ) ( not ( = ?auto_180439 ?auto_180443 ) ) ( not ( = ?auto_180439 ?auto_180444 ) ) ( not ( = ?auto_180439 ?auto_180445 ) ) ( not ( = ?auto_180439 ?auto_180446 ) ) ( not ( = ?auto_180440 ?auto_180441 ) ) ( not ( = ?auto_180440 ?auto_180442 ) ) ( not ( = ?auto_180440 ?auto_180443 ) ) ( not ( = ?auto_180440 ?auto_180444 ) ) ( not ( = ?auto_180440 ?auto_180445 ) ) ( not ( = ?auto_180440 ?auto_180446 ) ) ( not ( = ?auto_180441 ?auto_180442 ) ) ( not ( = ?auto_180441 ?auto_180443 ) ) ( not ( = ?auto_180441 ?auto_180444 ) ) ( not ( = ?auto_180441 ?auto_180445 ) ) ( not ( = ?auto_180441 ?auto_180446 ) ) ( not ( = ?auto_180442 ?auto_180443 ) ) ( not ( = ?auto_180442 ?auto_180444 ) ) ( not ( = ?auto_180442 ?auto_180445 ) ) ( not ( = ?auto_180442 ?auto_180446 ) ) ( not ( = ?auto_180443 ?auto_180444 ) ) ( not ( = ?auto_180443 ?auto_180445 ) ) ( not ( = ?auto_180443 ?auto_180446 ) ) ( not ( = ?auto_180444 ?auto_180445 ) ) ( not ( = ?auto_180444 ?auto_180446 ) ) ( not ( = ?auto_180445 ?auto_180446 ) ) ( ON ?auto_180446 ?auto_180447 ) ( not ( = ?auto_180439 ?auto_180447 ) ) ( not ( = ?auto_180440 ?auto_180447 ) ) ( not ( = ?auto_180441 ?auto_180447 ) ) ( not ( = ?auto_180442 ?auto_180447 ) ) ( not ( = ?auto_180443 ?auto_180447 ) ) ( not ( = ?auto_180444 ?auto_180447 ) ) ( not ( = ?auto_180445 ?auto_180447 ) ) ( not ( = ?auto_180446 ?auto_180447 ) ) ( ON ?auto_180445 ?auto_180446 ) ( ON-TABLE ?auto_180447 ) ( ON ?auto_180444 ?auto_180445 ) ( ON ?auto_180443 ?auto_180444 ) ( ON ?auto_180442 ?auto_180443 ) ( ON ?auto_180441 ?auto_180442 ) ( ON ?auto_180440 ?auto_180441 ) ( ON ?auto_180439 ?auto_180440 ) ( CLEAR ?auto_180439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180447 ?auto_180446 ?auto_180445 ?auto_180444 ?auto_180443 ?auto_180442 ?auto_180441 ?auto_180440 )
      ( MAKE-8PILE ?auto_180439 ?auto_180440 ?auto_180441 ?auto_180442 ?auto_180443 ?auto_180444 ?auto_180445 ?auto_180446 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180455 - BLOCK
      ?auto_180456 - BLOCK
      ?auto_180457 - BLOCK
      ?auto_180458 - BLOCK
      ?auto_180459 - BLOCK
      ?auto_180460 - BLOCK
      ?auto_180461 - BLOCK
    )
    :vars
    (
      ?auto_180462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180462 ?auto_180461 ) ( CLEAR ?auto_180462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180455 ) ( ON ?auto_180456 ?auto_180455 ) ( ON ?auto_180457 ?auto_180456 ) ( ON ?auto_180458 ?auto_180457 ) ( ON ?auto_180459 ?auto_180458 ) ( ON ?auto_180460 ?auto_180459 ) ( ON ?auto_180461 ?auto_180460 ) ( not ( = ?auto_180455 ?auto_180456 ) ) ( not ( = ?auto_180455 ?auto_180457 ) ) ( not ( = ?auto_180455 ?auto_180458 ) ) ( not ( = ?auto_180455 ?auto_180459 ) ) ( not ( = ?auto_180455 ?auto_180460 ) ) ( not ( = ?auto_180455 ?auto_180461 ) ) ( not ( = ?auto_180455 ?auto_180462 ) ) ( not ( = ?auto_180456 ?auto_180457 ) ) ( not ( = ?auto_180456 ?auto_180458 ) ) ( not ( = ?auto_180456 ?auto_180459 ) ) ( not ( = ?auto_180456 ?auto_180460 ) ) ( not ( = ?auto_180456 ?auto_180461 ) ) ( not ( = ?auto_180456 ?auto_180462 ) ) ( not ( = ?auto_180457 ?auto_180458 ) ) ( not ( = ?auto_180457 ?auto_180459 ) ) ( not ( = ?auto_180457 ?auto_180460 ) ) ( not ( = ?auto_180457 ?auto_180461 ) ) ( not ( = ?auto_180457 ?auto_180462 ) ) ( not ( = ?auto_180458 ?auto_180459 ) ) ( not ( = ?auto_180458 ?auto_180460 ) ) ( not ( = ?auto_180458 ?auto_180461 ) ) ( not ( = ?auto_180458 ?auto_180462 ) ) ( not ( = ?auto_180459 ?auto_180460 ) ) ( not ( = ?auto_180459 ?auto_180461 ) ) ( not ( = ?auto_180459 ?auto_180462 ) ) ( not ( = ?auto_180460 ?auto_180461 ) ) ( not ( = ?auto_180460 ?auto_180462 ) ) ( not ( = ?auto_180461 ?auto_180462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180462 ?auto_180461 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180480 - BLOCK
      ?auto_180481 - BLOCK
      ?auto_180482 - BLOCK
      ?auto_180483 - BLOCK
      ?auto_180484 - BLOCK
      ?auto_180485 - BLOCK
      ?auto_180486 - BLOCK
    )
    :vars
    (
      ?auto_180487 - BLOCK
      ?auto_180488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180480 ) ( ON ?auto_180481 ?auto_180480 ) ( ON ?auto_180482 ?auto_180481 ) ( ON ?auto_180483 ?auto_180482 ) ( ON ?auto_180484 ?auto_180483 ) ( ON ?auto_180485 ?auto_180484 ) ( not ( = ?auto_180480 ?auto_180481 ) ) ( not ( = ?auto_180480 ?auto_180482 ) ) ( not ( = ?auto_180480 ?auto_180483 ) ) ( not ( = ?auto_180480 ?auto_180484 ) ) ( not ( = ?auto_180480 ?auto_180485 ) ) ( not ( = ?auto_180480 ?auto_180486 ) ) ( not ( = ?auto_180480 ?auto_180487 ) ) ( not ( = ?auto_180481 ?auto_180482 ) ) ( not ( = ?auto_180481 ?auto_180483 ) ) ( not ( = ?auto_180481 ?auto_180484 ) ) ( not ( = ?auto_180481 ?auto_180485 ) ) ( not ( = ?auto_180481 ?auto_180486 ) ) ( not ( = ?auto_180481 ?auto_180487 ) ) ( not ( = ?auto_180482 ?auto_180483 ) ) ( not ( = ?auto_180482 ?auto_180484 ) ) ( not ( = ?auto_180482 ?auto_180485 ) ) ( not ( = ?auto_180482 ?auto_180486 ) ) ( not ( = ?auto_180482 ?auto_180487 ) ) ( not ( = ?auto_180483 ?auto_180484 ) ) ( not ( = ?auto_180483 ?auto_180485 ) ) ( not ( = ?auto_180483 ?auto_180486 ) ) ( not ( = ?auto_180483 ?auto_180487 ) ) ( not ( = ?auto_180484 ?auto_180485 ) ) ( not ( = ?auto_180484 ?auto_180486 ) ) ( not ( = ?auto_180484 ?auto_180487 ) ) ( not ( = ?auto_180485 ?auto_180486 ) ) ( not ( = ?auto_180485 ?auto_180487 ) ) ( not ( = ?auto_180486 ?auto_180487 ) ) ( ON ?auto_180487 ?auto_180488 ) ( CLEAR ?auto_180487 ) ( not ( = ?auto_180480 ?auto_180488 ) ) ( not ( = ?auto_180481 ?auto_180488 ) ) ( not ( = ?auto_180482 ?auto_180488 ) ) ( not ( = ?auto_180483 ?auto_180488 ) ) ( not ( = ?auto_180484 ?auto_180488 ) ) ( not ( = ?auto_180485 ?auto_180488 ) ) ( not ( = ?auto_180486 ?auto_180488 ) ) ( not ( = ?auto_180487 ?auto_180488 ) ) ( HOLDING ?auto_180486 ) ( CLEAR ?auto_180485 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180480 ?auto_180481 ?auto_180482 ?auto_180483 ?auto_180484 ?auto_180485 ?auto_180486 ?auto_180487 )
      ( MAKE-7PILE ?auto_180480 ?auto_180481 ?auto_180482 ?auto_180483 ?auto_180484 ?auto_180485 ?auto_180486 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180489 - BLOCK
      ?auto_180490 - BLOCK
      ?auto_180491 - BLOCK
      ?auto_180492 - BLOCK
      ?auto_180493 - BLOCK
      ?auto_180494 - BLOCK
      ?auto_180495 - BLOCK
    )
    :vars
    (
      ?auto_180497 - BLOCK
      ?auto_180496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180489 ) ( ON ?auto_180490 ?auto_180489 ) ( ON ?auto_180491 ?auto_180490 ) ( ON ?auto_180492 ?auto_180491 ) ( ON ?auto_180493 ?auto_180492 ) ( ON ?auto_180494 ?auto_180493 ) ( not ( = ?auto_180489 ?auto_180490 ) ) ( not ( = ?auto_180489 ?auto_180491 ) ) ( not ( = ?auto_180489 ?auto_180492 ) ) ( not ( = ?auto_180489 ?auto_180493 ) ) ( not ( = ?auto_180489 ?auto_180494 ) ) ( not ( = ?auto_180489 ?auto_180495 ) ) ( not ( = ?auto_180489 ?auto_180497 ) ) ( not ( = ?auto_180490 ?auto_180491 ) ) ( not ( = ?auto_180490 ?auto_180492 ) ) ( not ( = ?auto_180490 ?auto_180493 ) ) ( not ( = ?auto_180490 ?auto_180494 ) ) ( not ( = ?auto_180490 ?auto_180495 ) ) ( not ( = ?auto_180490 ?auto_180497 ) ) ( not ( = ?auto_180491 ?auto_180492 ) ) ( not ( = ?auto_180491 ?auto_180493 ) ) ( not ( = ?auto_180491 ?auto_180494 ) ) ( not ( = ?auto_180491 ?auto_180495 ) ) ( not ( = ?auto_180491 ?auto_180497 ) ) ( not ( = ?auto_180492 ?auto_180493 ) ) ( not ( = ?auto_180492 ?auto_180494 ) ) ( not ( = ?auto_180492 ?auto_180495 ) ) ( not ( = ?auto_180492 ?auto_180497 ) ) ( not ( = ?auto_180493 ?auto_180494 ) ) ( not ( = ?auto_180493 ?auto_180495 ) ) ( not ( = ?auto_180493 ?auto_180497 ) ) ( not ( = ?auto_180494 ?auto_180495 ) ) ( not ( = ?auto_180494 ?auto_180497 ) ) ( not ( = ?auto_180495 ?auto_180497 ) ) ( ON ?auto_180497 ?auto_180496 ) ( not ( = ?auto_180489 ?auto_180496 ) ) ( not ( = ?auto_180490 ?auto_180496 ) ) ( not ( = ?auto_180491 ?auto_180496 ) ) ( not ( = ?auto_180492 ?auto_180496 ) ) ( not ( = ?auto_180493 ?auto_180496 ) ) ( not ( = ?auto_180494 ?auto_180496 ) ) ( not ( = ?auto_180495 ?auto_180496 ) ) ( not ( = ?auto_180497 ?auto_180496 ) ) ( CLEAR ?auto_180494 ) ( ON ?auto_180495 ?auto_180497 ) ( CLEAR ?auto_180495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180496 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180496 ?auto_180497 )
      ( MAKE-7PILE ?auto_180489 ?auto_180490 ?auto_180491 ?auto_180492 ?auto_180493 ?auto_180494 ?auto_180495 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180498 - BLOCK
      ?auto_180499 - BLOCK
      ?auto_180500 - BLOCK
      ?auto_180501 - BLOCK
      ?auto_180502 - BLOCK
      ?auto_180503 - BLOCK
      ?auto_180504 - BLOCK
    )
    :vars
    (
      ?auto_180506 - BLOCK
      ?auto_180505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180498 ) ( ON ?auto_180499 ?auto_180498 ) ( ON ?auto_180500 ?auto_180499 ) ( ON ?auto_180501 ?auto_180500 ) ( ON ?auto_180502 ?auto_180501 ) ( not ( = ?auto_180498 ?auto_180499 ) ) ( not ( = ?auto_180498 ?auto_180500 ) ) ( not ( = ?auto_180498 ?auto_180501 ) ) ( not ( = ?auto_180498 ?auto_180502 ) ) ( not ( = ?auto_180498 ?auto_180503 ) ) ( not ( = ?auto_180498 ?auto_180504 ) ) ( not ( = ?auto_180498 ?auto_180506 ) ) ( not ( = ?auto_180499 ?auto_180500 ) ) ( not ( = ?auto_180499 ?auto_180501 ) ) ( not ( = ?auto_180499 ?auto_180502 ) ) ( not ( = ?auto_180499 ?auto_180503 ) ) ( not ( = ?auto_180499 ?auto_180504 ) ) ( not ( = ?auto_180499 ?auto_180506 ) ) ( not ( = ?auto_180500 ?auto_180501 ) ) ( not ( = ?auto_180500 ?auto_180502 ) ) ( not ( = ?auto_180500 ?auto_180503 ) ) ( not ( = ?auto_180500 ?auto_180504 ) ) ( not ( = ?auto_180500 ?auto_180506 ) ) ( not ( = ?auto_180501 ?auto_180502 ) ) ( not ( = ?auto_180501 ?auto_180503 ) ) ( not ( = ?auto_180501 ?auto_180504 ) ) ( not ( = ?auto_180501 ?auto_180506 ) ) ( not ( = ?auto_180502 ?auto_180503 ) ) ( not ( = ?auto_180502 ?auto_180504 ) ) ( not ( = ?auto_180502 ?auto_180506 ) ) ( not ( = ?auto_180503 ?auto_180504 ) ) ( not ( = ?auto_180503 ?auto_180506 ) ) ( not ( = ?auto_180504 ?auto_180506 ) ) ( ON ?auto_180506 ?auto_180505 ) ( not ( = ?auto_180498 ?auto_180505 ) ) ( not ( = ?auto_180499 ?auto_180505 ) ) ( not ( = ?auto_180500 ?auto_180505 ) ) ( not ( = ?auto_180501 ?auto_180505 ) ) ( not ( = ?auto_180502 ?auto_180505 ) ) ( not ( = ?auto_180503 ?auto_180505 ) ) ( not ( = ?auto_180504 ?auto_180505 ) ) ( not ( = ?auto_180506 ?auto_180505 ) ) ( ON ?auto_180504 ?auto_180506 ) ( CLEAR ?auto_180504 ) ( ON-TABLE ?auto_180505 ) ( HOLDING ?auto_180503 ) ( CLEAR ?auto_180502 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180498 ?auto_180499 ?auto_180500 ?auto_180501 ?auto_180502 ?auto_180503 )
      ( MAKE-7PILE ?auto_180498 ?auto_180499 ?auto_180500 ?auto_180501 ?auto_180502 ?auto_180503 ?auto_180504 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180507 - BLOCK
      ?auto_180508 - BLOCK
      ?auto_180509 - BLOCK
      ?auto_180510 - BLOCK
      ?auto_180511 - BLOCK
      ?auto_180512 - BLOCK
      ?auto_180513 - BLOCK
    )
    :vars
    (
      ?auto_180514 - BLOCK
      ?auto_180515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180507 ) ( ON ?auto_180508 ?auto_180507 ) ( ON ?auto_180509 ?auto_180508 ) ( ON ?auto_180510 ?auto_180509 ) ( ON ?auto_180511 ?auto_180510 ) ( not ( = ?auto_180507 ?auto_180508 ) ) ( not ( = ?auto_180507 ?auto_180509 ) ) ( not ( = ?auto_180507 ?auto_180510 ) ) ( not ( = ?auto_180507 ?auto_180511 ) ) ( not ( = ?auto_180507 ?auto_180512 ) ) ( not ( = ?auto_180507 ?auto_180513 ) ) ( not ( = ?auto_180507 ?auto_180514 ) ) ( not ( = ?auto_180508 ?auto_180509 ) ) ( not ( = ?auto_180508 ?auto_180510 ) ) ( not ( = ?auto_180508 ?auto_180511 ) ) ( not ( = ?auto_180508 ?auto_180512 ) ) ( not ( = ?auto_180508 ?auto_180513 ) ) ( not ( = ?auto_180508 ?auto_180514 ) ) ( not ( = ?auto_180509 ?auto_180510 ) ) ( not ( = ?auto_180509 ?auto_180511 ) ) ( not ( = ?auto_180509 ?auto_180512 ) ) ( not ( = ?auto_180509 ?auto_180513 ) ) ( not ( = ?auto_180509 ?auto_180514 ) ) ( not ( = ?auto_180510 ?auto_180511 ) ) ( not ( = ?auto_180510 ?auto_180512 ) ) ( not ( = ?auto_180510 ?auto_180513 ) ) ( not ( = ?auto_180510 ?auto_180514 ) ) ( not ( = ?auto_180511 ?auto_180512 ) ) ( not ( = ?auto_180511 ?auto_180513 ) ) ( not ( = ?auto_180511 ?auto_180514 ) ) ( not ( = ?auto_180512 ?auto_180513 ) ) ( not ( = ?auto_180512 ?auto_180514 ) ) ( not ( = ?auto_180513 ?auto_180514 ) ) ( ON ?auto_180514 ?auto_180515 ) ( not ( = ?auto_180507 ?auto_180515 ) ) ( not ( = ?auto_180508 ?auto_180515 ) ) ( not ( = ?auto_180509 ?auto_180515 ) ) ( not ( = ?auto_180510 ?auto_180515 ) ) ( not ( = ?auto_180511 ?auto_180515 ) ) ( not ( = ?auto_180512 ?auto_180515 ) ) ( not ( = ?auto_180513 ?auto_180515 ) ) ( not ( = ?auto_180514 ?auto_180515 ) ) ( ON ?auto_180513 ?auto_180514 ) ( ON-TABLE ?auto_180515 ) ( CLEAR ?auto_180511 ) ( ON ?auto_180512 ?auto_180513 ) ( CLEAR ?auto_180512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180515 ?auto_180514 ?auto_180513 )
      ( MAKE-7PILE ?auto_180507 ?auto_180508 ?auto_180509 ?auto_180510 ?auto_180511 ?auto_180512 ?auto_180513 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180516 - BLOCK
      ?auto_180517 - BLOCK
      ?auto_180518 - BLOCK
      ?auto_180519 - BLOCK
      ?auto_180520 - BLOCK
      ?auto_180521 - BLOCK
      ?auto_180522 - BLOCK
    )
    :vars
    (
      ?auto_180523 - BLOCK
      ?auto_180524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180516 ) ( ON ?auto_180517 ?auto_180516 ) ( ON ?auto_180518 ?auto_180517 ) ( ON ?auto_180519 ?auto_180518 ) ( not ( = ?auto_180516 ?auto_180517 ) ) ( not ( = ?auto_180516 ?auto_180518 ) ) ( not ( = ?auto_180516 ?auto_180519 ) ) ( not ( = ?auto_180516 ?auto_180520 ) ) ( not ( = ?auto_180516 ?auto_180521 ) ) ( not ( = ?auto_180516 ?auto_180522 ) ) ( not ( = ?auto_180516 ?auto_180523 ) ) ( not ( = ?auto_180517 ?auto_180518 ) ) ( not ( = ?auto_180517 ?auto_180519 ) ) ( not ( = ?auto_180517 ?auto_180520 ) ) ( not ( = ?auto_180517 ?auto_180521 ) ) ( not ( = ?auto_180517 ?auto_180522 ) ) ( not ( = ?auto_180517 ?auto_180523 ) ) ( not ( = ?auto_180518 ?auto_180519 ) ) ( not ( = ?auto_180518 ?auto_180520 ) ) ( not ( = ?auto_180518 ?auto_180521 ) ) ( not ( = ?auto_180518 ?auto_180522 ) ) ( not ( = ?auto_180518 ?auto_180523 ) ) ( not ( = ?auto_180519 ?auto_180520 ) ) ( not ( = ?auto_180519 ?auto_180521 ) ) ( not ( = ?auto_180519 ?auto_180522 ) ) ( not ( = ?auto_180519 ?auto_180523 ) ) ( not ( = ?auto_180520 ?auto_180521 ) ) ( not ( = ?auto_180520 ?auto_180522 ) ) ( not ( = ?auto_180520 ?auto_180523 ) ) ( not ( = ?auto_180521 ?auto_180522 ) ) ( not ( = ?auto_180521 ?auto_180523 ) ) ( not ( = ?auto_180522 ?auto_180523 ) ) ( ON ?auto_180523 ?auto_180524 ) ( not ( = ?auto_180516 ?auto_180524 ) ) ( not ( = ?auto_180517 ?auto_180524 ) ) ( not ( = ?auto_180518 ?auto_180524 ) ) ( not ( = ?auto_180519 ?auto_180524 ) ) ( not ( = ?auto_180520 ?auto_180524 ) ) ( not ( = ?auto_180521 ?auto_180524 ) ) ( not ( = ?auto_180522 ?auto_180524 ) ) ( not ( = ?auto_180523 ?auto_180524 ) ) ( ON ?auto_180522 ?auto_180523 ) ( ON-TABLE ?auto_180524 ) ( ON ?auto_180521 ?auto_180522 ) ( CLEAR ?auto_180521 ) ( HOLDING ?auto_180520 ) ( CLEAR ?auto_180519 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180516 ?auto_180517 ?auto_180518 ?auto_180519 ?auto_180520 )
      ( MAKE-7PILE ?auto_180516 ?auto_180517 ?auto_180518 ?auto_180519 ?auto_180520 ?auto_180521 ?auto_180522 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180525 - BLOCK
      ?auto_180526 - BLOCK
      ?auto_180527 - BLOCK
      ?auto_180528 - BLOCK
      ?auto_180529 - BLOCK
      ?auto_180530 - BLOCK
      ?auto_180531 - BLOCK
    )
    :vars
    (
      ?auto_180532 - BLOCK
      ?auto_180533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180525 ) ( ON ?auto_180526 ?auto_180525 ) ( ON ?auto_180527 ?auto_180526 ) ( ON ?auto_180528 ?auto_180527 ) ( not ( = ?auto_180525 ?auto_180526 ) ) ( not ( = ?auto_180525 ?auto_180527 ) ) ( not ( = ?auto_180525 ?auto_180528 ) ) ( not ( = ?auto_180525 ?auto_180529 ) ) ( not ( = ?auto_180525 ?auto_180530 ) ) ( not ( = ?auto_180525 ?auto_180531 ) ) ( not ( = ?auto_180525 ?auto_180532 ) ) ( not ( = ?auto_180526 ?auto_180527 ) ) ( not ( = ?auto_180526 ?auto_180528 ) ) ( not ( = ?auto_180526 ?auto_180529 ) ) ( not ( = ?auto_180526 ?auto_180530 ) ) ( not ( = ?auto_180526 ?auto_180531 ) ) ( not ( = ?auto_180526 ?auto_180532 ) ) ( not ( = ?auto_180527 ?auto_180528 ) ) ( not ( = ?auto_180527 ?auto_180529 ) ) ( not ( = ?auto_180527 ?auto_180530 ) ) ( not ( = ?auto_180527 ?auto_180531 ) ) ( not ( = ?auto_180527 ?auto_180532 ) ) ( not ( = ?auto_180528 ?auto_180529 ) ) ( not ( = ?auto_180528 ?auto_180530 ) ) ( not ( = ?auto_180528 ?auto_180531 ) ) ( not ( = ?auto_180528 ?auto_180532 ) ) ( not ( = ?auto_180529 ?auto_180530 ) ) ( not ( = ?auto_180529 ?auto_180531 ) ) ( not ( = ?auto_180529 ?auto_180532 ) ) ( not ( = ?auto_180530 ?auto_180531 ) ) ( not ( = ?auto_180530 ?auto_180532 ) ) ( not ( = ?auto_180531 ?auto_180532 ) ) ( ON ?auto_180532 ?auto_180533 ) ( not ( = ?auto_180525 ?auto_180533 ) ) ( not ( = ?auto_180526 ?auto_180533 ) ) ( not ( = ?auto_180527 ?auto_180533 ) ) ( not ( = ?auto_180528 ?auto_180533 ) ) ( not ( = ?auto_180529 ?auto_180533 ) ) ( not ( = ?auto_180530 ?auto_180533 ) ) ( not ( = ?auto_180531 ?auto_180533 ) ) ( not ( = ?auto_180532 ?auto_180533 ) ) ( ON ?auto_180531 ?auto_180532 ) ( ON-TABLE ?auto_180533 ) ( ON ?auto_180530 ?auto_180531 ) ( CLEAR ?auto_180528 ) ( ON ?auto_180529 ?auto_180530 ) ( CLEAR ?auto_180529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180533 ?auto_180532 ?auto_180531 ?auto_180530 )
      ( MAKE-7PILE ?auto_180525 ?auto_180526 ?auto_180527 ?auto_180528 ?auto_180529 ?auto_180530 ?auto_180531 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180534 - BLOCK
      ?auto_180535 - BLOCK
      ?auto_180536 - BLOCK
      ?auto_180537 - BLOCK
      ?auto_180538 - BLOCK
      ?auto_180539 - BLOCK
      ?auto_180540 - BLOCK
    )
    :vars
    (
      ?auto_180541 - BLOCK
      ?auto_180542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180534 ) ( ON ?auto_180535 ?auto_180534 ) ( ON ?auto_180536 ?auto_180535 ) ( not ( = ?auto_180534 ?auto_180535 ) ) ( not ( = ?auto_180534 ?auto_180536 ) ) ( not ( = ?auto_180534 ?auto_180537 ) ) ( not ( = ?auto_180534 ?auto_180538 ) ) ( not ( = ?auto_180534 ?auto_180539 ) ) ( not ( = ?auto_180534 ?auto_180540 ) ) ( not ( = ?auto_180534 ?auto_180541 ) ) ( not ( = ?auto_180535 ?auto_180536 ) ) ( not ( = ?auto_180535 ?auto_180537 ) ) ( not ( = ?auto_180535 ?auto_180538 ) ) ( not ( = ?auto_180535 ?auto_180539 ) ) ( not ( = ?auto_180535 ?auto_180540 ) ) ( not ( = ?auto_180535 ?auto_180541 ) ) ( not ( = ?auto_180536 ?auto_180537 ) ) ( not ( = ?auto_180536 ?auto_180538 ) ) ( not ( = ?auto_180536 ?auto_180539 ) ) ( not ( = ?auto_180536 ?auto_180540 ) ) ( not ( = ?auto_180536 ?auto_180541 ) ) ( not ( = ?auto_180537 ?auto_180538 ) ) ( not ( = ?auto_180537 ?auto_180539 ) ) ( not ( = ?auto_180537 ?auto_180540 ) ) ( not ( = ?auto_180537 ?auto_180541 ) ) ( not ( = ?auto_180538 ?auto_180539 ) ) ( not ( = ?auto_180538 ?auto_180540 ) ) ( not ( = ?auto_180538 ?auto_180541 ) ) ( not ( = ?auto_180539 ?auto_180540 ) ) ( not ( = ?auto_180539 ?auto_180541 ) ) ( not ( = ?auto_180540 ?auto_180541 ) ) ( ON ?auto_180541 ?auto_180542 ) ( not ( = ?auto_180534 ?auto_180542 ) ) ( not ( = ?auto_180535 ?auto_180542 ) ) ( not ( = ?auto_180536 ?auto_180542 ) ) ( not ( = ?auto_180537 ?auto_180542 ) ) ( not ( = ?auto_180538 ?auto_180542 ) ) ( not ( = ?auto_180539 ?auto_180542 ) ) ( not ( = ?auto_180540 ?auto_180542 ) ) ( not ( = ?auto_180541 ?auto_180542 ) ) ( ON ?auto_180540 ?auto_180541 ) ( ON-TABLE ?auto_180542 ) ( ON ?auto_180539 ?auto_180540 ) ( ON ?auto_180538 ?auto_180539 ) ( CLEAR ?auto_180538 ) ( HOLDING ?auto_180537 ) ( CLEAR ?auto_180536 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180534 ?auto_180535 ?auto_180536 ?auto_180537 )
      ( MAKE-7PILE ?auto_180534 ?auto_180535 ?auto_180536 ?auto_180537 ?auto_180538 ?auto_180539 ?auto_180540 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180543 - BLOCK
      ?auto_180544 - BLOCK
      ?auto_180545 - BLOCK
      ?auto_180546 - BLOCK
      ?auto_180547 - BLOCK
      ?auto_180548 - BLOCK
      ?auto_180549 - BLOCK
    )
    :vars
    (
      ?auto_180550 - BLOCK
      ?auto_180551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180543 ) ( ON ?auto_180544 ?auto_180543 ) ( ON ?auto_180545 ?auto_180544 ) ( not ( = ?auto_180543 ?auto_180544 ) ) ( not ( = ?auto_180543 ?auto_180545 ) ) ( not ( = ?auto_180543 ?auto_180546 ) ) ( not ( = ?auto_180543 ?auto_180547 ) ) ( not ( = ?auto_180543 ?auto_180548 ) ) ( not ( = ?auto_180543 ?auto_180549 ) ) ( not ( = ?auto_180543 ?auto_180550 ) ) ( not ( = ?auto_180544 ?auto_180545 ) ) ( not ( = ?auto_180544 ?auto_180546 ) ) ( not ( = ?auto_180544 ?auto_180547 ) ) ( not ( = ?auto_180544 ?auto_180548 ) ) ( not ( = ?auto_180544 ?auto_180549 ) ) ( not ( = ?auto_180544 ?auto_180550 ) ) ( not ( = ?auto_180545 ?auto_180546 ) ) ( not ( = ?auto_180545 ?auto_180547 ) ) ( not ( = ?auto_180545 ?auto_180548 ) ) ( not ( = ?auto_180545 ?auto_180549 ) ) ( not ( = ?auto_180545 ?auto_180550 ) ) ( not ( = ?auto_180546 ?auto_180547 ) ) ( not ( = ?auto_180546 ?auto_180548 ) ) ( not ( = ?auto_180546 ?auto_180549 ) ) ( not ( = ?auto_180546 ?auto_180550 ) ) ( not ( = ?auto_180547 ?auto_180548 ) ) ( not ( = ?auto_180547 ?auto_180549 ) ) ( not ( = ?auto_180547 ?auto_180550 ) ) ( not ( = ?auto_180548 ?auto_180549 ) ) ( not ( = ?auto_180548 ?auto_180550 ) ) ( not ( = ?auto_180549 ?auto_180550 ) ) ( ON ?auto_180550 ?auto_180551 ) ( not ( = ?auto_180543 ?auto_180551 ) ) ( not ( = ?auto_180544 ?auto_180551 ) ) ( not ( = ?auto_180545 ?auto_180551 ) ) ( not ( = ?auto_180546 ?auto_180551 ) ) ( not ( = ?auto_180547 ?auto_180551 ) ) ( not ( = ?auto_180548 ?auto_180551 ) ) ( not ( = ?auto_180549 ?auto_180551 ) ) ( not ( = ?auto_180550 ?auto_180551 ) ) ( ON ?auto_180549 ?auto_180550 ) ( ON-TABLE ?auto_180551 ) ( ON ?auto_180548 ?auto_180549 ) ( ON ?auto_180547 ?auto_180548 ) ( CLEAR ?auto_180545 ) ( ON ?auto_180546 ?auto_180547 ) ( CLEAR ?auto_180546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180551 ?auto_180550 ?auto_180549 ?auto_180548 ?auto_180547 )
      ( MAKE-7PILE ?auto_180543 ?auto_180544 ?auto_180545 ?auto_180546 ?auto_180547 ?auto_180548 ?auto_180549 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180552 - BLOCK
      ?auto_180553 - BLOCK
      ?auto_180554 - BLOCK
      ?auto_180555 - BLOCK
      ?auto_180556 - BLOCK
      ?auto_180557 - BLOCK
      ?auto_180558 - BLOCK
    )
    :vars
    (
      ?auto_180559 - BLOCK
      ?auto_180560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180552 ) ( ON ?auto_180553 ?auto_180552 ) ( not ( = ?auto_180552 ?auto_180553 ) ) ( not ( = ?auto_180552 ?auto_180554 ) ) ( not ( = ?auto_180552 ?auto_180555 ) ) ( not ( = ?auto_180552 ?auto_180556 ) ) ( not ( = ?auto_180552 ?auto_180557 ) ) ( not ( = ?auto_180552 ?auto_180558 ) ) ( not ( = ?auto_180552 ?auto_180559 ) ) ( not ( = ?auto_180553 ?auto_180554 ) ) ( not ( = ?auto_180553 ?auto_180555 ) ) ( not ( = ?auto_180553 ?auto_180556 ) ) ( not ( = ?auto_180553 ?auto_180557 ) ) ( not ( = ?auto_180553 ?auto_180558 ) ) ( not ( = ?auto_180553 ?auto_180559 ) ) ( not ( = ?auto_180554 ?auto_180555 ) ) ( not ( = ?auto_180554 ?auto_180556 ) ) ( not ( = ?auto_180554 ?auto_180557 ) ) ( not ( = ?auto_180554 ?auto_180558 ) ) ( not ( = ?auto_180554 ?auto_180559 ) ) ( not ( = ?auto_180555 ?auto_180556 ) ) ( not ( = ?auto_180555 ?auto_180557 ) ) ( not ( = ?auto_180555 ?auto_180558 ) ) ( not ( = ?auto_180555 ?auto_180559 ) ) ( not ( = ?auto_180556 ?auto_180557 ) ) ( not ( = ?auto_180556 ?auto_180558 ) ) ( not ( = ?auto_180556 ?auto_180559 ) ) ( not ( = ?auto_180557 ?auto_180558 ) ) ( not ( = ?auto_180557 ?auto_180559 ) ) ( not ( = ?auto_180558 ?auto_180559 ) ) ( ON ?auto_180559 ?auto_180560 ) ( not ( = ?auto_180552 ?auto_180560 ) ) ( not ( = ?auto_180553 ?auto_180560 ) ) ( not ( = ?auto_180554 ?auto_180560 ) ) ( not ( = ?auto_180555 ?auto_180560 ) ) ( not ( = ?auto_180556 ?auto_180560 ) ) ( not ( = ?auto_180557 ?auto_180560 ) ) ( not ( = ?auto_180558 ?auto_180560 ) ) ( not ( = ?auto_180559 ?auto_180560 ) ) ( ON ?auto_180558 ?auto_180559 ) ( ON-TABLE ?auto_180560 ) ( ON ?auto_180557 ?auto_180558 ) ( ON ?auto_180556 ?auto_180557 ) ( ON ?auto_180555 ?auto_180556 ) ( CLEAR ?auto_180555 ) ( HOLDING ?auto_180554 ) ( CLEAR ?auto_180553 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180552 ?auto_180553 ?auto_180554 )
      ( MAKE-7PILE ?auto_180552 ?auto_180553 ?auto_180554 ?auto_180555 ?auto_180556 ?auto_180557 ?auto_180558 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180561 - BLOCK
      ?auto_180562 - BLOCK
      ?auto_180563 - BLOCK
      ?auto_180564 - BLOCK
      ?auto_180565 - BLOCK
      ?auto_180566 - BLOCK
      ?auto_180567 - BLOCK
    )
    :vars
    (
      ?auto_180568 - BLOCK
      ?auto_180569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180561 ) ( ON ?auto_180562 ?auto_180561 ) ( not ( = ?auto_180561 ?auto_180562 ) ) ( not ( = ?auto_180561 ?auto_180563 ) ) ( not ( = ?auto_180561 ?auto_180564 ) ) ( not ( = ?auto_180561 ?auto_180565 ) ) ( not ( = ?auto_180561 ?auto_180566 ) ) ( not ( = ?auto_180561 ?auto_180567 ) ) ( not ( = ?auto_180561 ?auto_180568 ) ) ( not ( = ?auto_180562 ?auto_180563 ) ) ( not ( = ?auto_180562 ?auto_180564 ) ) ( not ( = ?auto_180562 ?auto_180565 ) ) ( not ( = ?auto_180562 ?auto_180566 ) ) ( not ( = ?auto_180562 ?auto_180567 ) ) ( not ( = ?auto_180562 ?auto_180568 ) ) ( not ( = ?auto_180563 ?auto_180564 ) ) ( not ( = ?auto_180563 ?auto_180565 ) ) ( not ( = ?auto_180563 ?auto_180566 ) ) ( not ( = ?auto_180563 ?auto_180567 ) ) ( not ( = ?auto_180563 ?auto_180568 ) ) ( not ( = ?auto_180564 ?auto_180565 ) ) ( not ( = ?auto_180564 ?auto_180566 ) ) ( not ( = ?auto_180564 ?auto_180567 ) ) ( not ( = ?auto_180564 ?auto_180568 ) ) ( not ( = ?auto_180565 ?auto_180566 ) ) ( not ( = ?auto_180565 ?auto_180567 ) ) ( not ( = ?auto_180565 ?auto_180568 ) ) ( not ( = ?auto_180566 ?auto_180567 ) ) ( not ( = ?auto_180566 ?auto_180568 ) ) ( not ( = ?auto_180567 ?auto_180568 ) ) ( ON ?auto_180568 ?auto_180569 ) ( not ( = ?auto_180561 ?auto_180569 ) ) ( not ( = ?auto_180562 ?auto_180569 ) ) ( not ( = ?auto_180563 ?auto_180569 ) ) ( not ( = ?auto_180564 ?auto_180569 ) ) ( not ( = ?auto_180565 ?auto_180569 ) ) ( not ( = ?auto_180566 ?auto_180569 ) ) ( not ( = ?auto_180567 ?auto_180569 ) ) ( not ( = ?auto_180568 ?auto_180569 ) ) ( ON ?auto_180567 ?auto_180568 ) ( ON-TABLE ?auto_180569 ) ( ON ?auto_180566 ?auto_180567 ) ( ON ?auto_180565 ?auto_180566 ) ( ON ?auto_180564 ?auto_180565 ) ( CLEAR ?auto_180562 ) ( ON ?auto_180563 ?auto_180564 ) ( CLEAR ?auto_180563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180569 ?auto_180568 ?auto_180567 ?auto_180566 ?auto_180565 ?auto_180564 )
      ( MAKE-7PILE ?auto_180561 ?auto_180562 ?auto_180563 ?auto_180564 ?auto_180565 ?auto_180566 ?auto_180567 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180570 - BLOCK
      ?auto_180571 - BLOCK
      ?auto_180572 - BLOCK
      ?auto_180573 - BLOCK
      ?auto_180574 - BLOCK
      ?auto_180575 - BLOCK
      ?auto_180576 - BLOCK
    )
    :vars
    (
      ?auto_180578 - BLOCK
      ?auto_180577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180570 ) ( not ( = ?auto_180570 ?auto_180571 ) ) ( not ( = ?auto_180570 ?auto_180572 ) ) ( not ( = ?auto_180570 ?auto_180573 ) ) ( not ( = ?auto_180570 ?auto_180574 ) ) ( not ( = ?auto_180570 ?auto_180575 ) ) ( not ( = ?auto_180570 ?auto_180576 ) ) ( not ( = ?auto_180570 ?auto_180578 ) ) ( not ( = ?auto_180571 ?auto_180572 ) ) ( not ( = ?auto_180571 ?auto_180573 ) ) ( not ( = ?auto_180571 ?auto_180574 ) ) ( not ( = ?auto_180571 ?auto_180575 ) ) ( not ( = ?auto_180571 ?auto_180576 ) ) ( not ( = ?auto_180571 ?auto_180578 ) ) ( not ( = ?auto_180572 ?auto_180573 ) ) ( not ( = ?auto_180572 ?auto_180574 ) ) ( not ( = ?auto_180572 ?auto_180575 ) ) ( not ( = ?auto_180572 ?auto_180576 ) ) ( not ( = ?auto_180572 ?auto_180578 ) ) ( not ( = ?auto_180573 ?auto_180574 ) ) ( not ( = ?auto_180573 ?auto_180575 ) ) ( not ( = ?auto_180573 ?auto_180576 ) ) ( not ( = ?auto_180573 ?auto_180578 ) ) ( not ( = ?auto_180574 ?auto_180575 ) ) ( not ( = ?auto_180574 ?auto_180576 ) ) ( not ( = ?auto_180574 ?auto_180578 ) ) ( not ( = ?auto_180575 ?auto_180576 ) ) ( not ( = ?auto_180575 ?auto_180578 ) ) ( not ( = ?auto_180576 ?auto_180578 ) ) ( ON ?auto_180578 ?auto_180577 ) ( not ( = ?auto_180570 ?auto_180577 ) ) ( not ( = ?auto_180571 ?auto_180577 ) ) ( not ( = ?auto_180572 ?auto_180577 ) ) ( not ( = ?auto_180573 ?auto_180577 ) ) ( not ( = ?auto_180574 ?auto_180577 ) ) ( not ( = ?auto_180575 ?auto_180577 ) ) ( not ( = ?auto_180576 ?auto_180577 ) ) ( not ( = ?auto_180578 ?auto_180577 ) ) ( ON ?auto_180576 ?auto_180578 ) ( ON-TABLE ?auto_180577 ) ( ON ?auto_180575 ?auto_180576 ) ( ON ?auto_180574 ?auto_180575 ) ( ON ?auto_180573 ?auto_180574 ) ( ON ?auto_180572 ?auto_180573 ) ( CLEAR ?auto_180572 ) ( HOLDING ?auto_180571 ) ( CLEAR ?auto_180570 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180570 ?auto_180571 )
      ( MAKE-7PILE ?auto_180570 ?auto_180571 ?auto_180572 ?auto_180573 ?auto_180574 ?auto_180575 ?auto_180576 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180579 - BLOCK
      ?auto_180580 - BLOCK
      ?auto_180581 - BLOCK
      ?auto_180582 - BLOCK
      ?auto_180583 - BLOCK
      ?auto_180584 - BLOCK
      ?auto_180585 - BLOCK
    )
    :vars
    (
      ?auto_180586 - BLOCK
      ?auto_180587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180579 ) ( not ( = ?auto_180579 ?auto_180580 ) ) ( not ( = ?auto_180579 ?auto_180581 ) ) ( not ( = ?auto_180579 ?auto_180582 ) ) ( not ( = ?auto_180579 ?auto_180583 ) ) ( not ( = ?auto_180579 ?auto_180584 ) ) ( not ( = ?auto_180579 ?auto_180585 ) ) ( not ( = ?auto_180579 ?auto_180586 ) ) ( not ( = ?auto_180580 ?auto_180581 ) ) ( not ( = ?auto_180580 ?auto_180582 ) ) ( not ( = ?auto_180580 ?auto_180583 ) ) ( not ( = ?auto_180580 ?auto_180584 ) ) ( not ( = ?auto_180580 ?auto_180585 ) ) ( not ( = ?auto_180580 ?auto_180586 ) ) ( not ( = ?auto_180581 ?auto_180582 ) ) ( not ( = ?auto_180581 ?auto_180583 ) ) ( not ( = ?auto_180581 ?auto_180584 ) ) ( not ( = ?auto_180581 ?auto_180585 ) ) ( not ( = ?auto_180581 ?auto_180586 ) ) ( not ( = ?auto_180582 ?auto_180583 ) ) ( not ( = ?auto_180582 ?auto_180584 ) ) ( not ( = ?auto_180582 ?auto_180585 ) ) ( not ( = ?auto_180582 ?auto_180586 ) ) ( not ( = ?auto_180583 ?auto_180584 ) ) ( not ( = ?auto_180583 ?auto_180585 ) ) ( not ( = ?auto_180583 ?auto_180586 ) ) ( not ( = ?auto_180584 ?auto_180585 ) ) ( not ( = ?auto_180584 ?auto_180586 ) ) ( not ( = ?auto_180585 ?auto_180586 ) ) ( ON ?auto_180586 ?auto_180587 ) ( not ( = ?auto_180579 ?auto_180587 ) ) ( not ( = ?auto_180580 ?auto_180587 ) ) ( not ( = ?auto_180581 ?auto_180587 ) ) ( not ( = ?auto_180582 ?auto_180587 ) ) ( not ( = ?auto_180583 ?auto_180587 ) ) ( not ( = ?auto_180584 ?auto_180587 ) ) ( not ( = ?auto_180585 ?auto_180587 ) ) ( not ( = ?auto_180586 ?auto_180587 ) ) ( ON ?auto_180585 ?auto_180586 ) ( ON-TABLE ?auto_180587 ) ( ON ?auto_180584 ?auto_180585 ) ( ON ?auto_180583 ?auto_180584 ) ( ON ?auto_180582 ?auto_180583 ) ( ON ?auto_180581 ?auto_180582 ) ( CLEAR ?auto_180579 ) ( ON ?auto_180580 ?auto_180581 ) ( CLEAR ?auto_180580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180587 ?auto_180586 ?auto_180585 ?auto_180584 ?auto_180583 ?auto_180582 ?auto_180581 )
      ( MAKE-7PILE ?auto_180579 ?auto_180580 ?auto_180581 ?auto_180582 ?auto_180583 ?auto_180584 ?auto_180585 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180588 - BLOCK
      ?auto_180589 - BLOCK
      ?auto_180590 - BLOCK
      ?auto_180591 - BLOCK
      ?auto_180592 - BLOCK
      ?auto_180593 - BLOCK
      ?auto_180594 - BLOCK
    )
    :vars
    (
      ?auto_180595 - BLOCK
      ?auto_180596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180588 ?auto_180589 ) ) ( not ( = ?auto_180588 ?auto_180590 ) ) ( not ( = ?auto_180588 ?auto_180591 ) ) ( not ( = ?auto_180588 ?auto_180592 ) ) ( not ( = ?auto_180588 ?auto_180593 ) ) ( not ( = ?auto_180588 ?auto_180594 ) ) ( not ( = ?auto_180588 ?auto_180595 ) ) ( not ( = ?auto_180589 ?auto_180590 ) ) ( not ( = ?auto_180589 ?auto_180591 ) ) ( not ( = ?auto_180589 ?auto_180592 ) ) ( not ( = ?auto_180589 ?auto_180593 ) ) ( not ( = ?auto_180589 ?auto_180594 ) ) ( not ( = ?auto_180589 ?auto_180595 ) ) ( not ( = ?auto_180590 ?auto_180591 ) ) ( not ( = ?auto_180590 ?auto_180592 ) ) ( not ( = ?auto_180590 ?auto_180593 ) ) ( not ( = ?auto_180590 ?auto_180594 ) ) ( not ( = ?auto_180590 ?auto_180595 ) ) ( not ( = ?auto_180591 ?auto_180592 ) ) ( not ( = ?auto_180591 ?auto_180593 ) ) ( not ( = ?auto_180591 ?auto_180594 ) ) ( not ( = ?auto_180591 ?auto_180595 ) ) ( not ( = ?auto_180592 ?auto_180593 ) ) ( not ( = ?auto_180592 ?auto_180594 ) ) ( not ( = ?auto_180592 ?auto_180595 ) ) ( not ( = ?auto_180593 ?auto_180594 ) ) ( not ( = ?auto_180593 ?auto_180595 ) ) ( not ( = ?auto_180594 ?auto_180595 ) ) ( ON ?auto_180595 ?auto_180596 ) ( not ( = ?auto_180588 ?auto_180596 ) ) ( not ( = ?auto_180589 ?auto_180596 ) ) ( not ( = ?auto_180590 ?auto_180596 ) ) ( not ( = ?auto_180591 ?auto_180596 ) ) ( not ( = ?auto_180592 ?auto_180596 ) ) ( not ( = ?auto_180593 ?auto_180596 ) ) ( not ( = ?auto_180594 ?auto_180596 ) ) ( not ( = ?auto_180595 ?auto_180596 ) ) ( ON ?auto_180594 ?auto_180595 ) ( ON-TABLE ?auto_180596 ) ( ON ?auto_180593 ?auto_180594 ) ( ON ?auto_180592 ?auto_180593 ) ( ON ?auto_180591 ?auto_180592 ) ( ON ?auto_180590 ?auto_180591 ) ( ON ?auto_180589 ?auto_180590 ) ( CLEAR ?auto_180589 ) ( HOLDING ?auto_180588 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180588 )
      ( MAKE-7PILE ?auto_180588 ?auto_180589 ?auto_180590 ?auto_180591 ?auto_180592 ?auto_180593 ?auto_180594 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180597 - BLOCK
      ?auto_180598 - BLOCK
      ?auto_180599 - BLOCK
      ?auto_180600 - BLOCK
      ?auto_180601 - BLOCK
      ?auto_180602 - BLOCK
      ?auto_180603 - BLOCK
    )
    :vars
    (
      ?auto_180604 - BLOCK
      ?auto_180605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180597 ?auto_180598 ) ) ( not ( = ?auto_180597 ?auto_180599 ) ) ( not ( = ?auto_180597 ?auto_180600 ) ) ( not ( = ?auto_180597 ?auto_180601 ) ) ( not ( = ?auto_180597 ?auto_180602 ) ) ( not ( = ?auto_180597 ?auto_180603 ) ) ( not ( = ?auto_180597 ?auto_180604 ) ) ( not ( = ?auto_180598 ?auto_180599 ) ) ( not ( = ?auto_180598 ?auto_180600 ) ) ( not ( = ?auto_180598 ?auto_180601 ) ) ( not ( = ?auto_180598 ?auto_180602 ) ) ( not ( = ?auto_180598 ?auto_180603 ) ) ( not ( = ?auto_180598 ?auto_180604 ) ) ( not ( = ?auto_180599 ?auto_180600 ) ) ( not ( = ?auto_180599 ?auto_180601 ) ) ( not ( = ?auto_180599 ?auto_180602 ) ) ( not ( = ?auto_180599 ?auto_180603 ) ) ( not ( = ?auto_180599 ?auto_180604 ) ) ( not ( = ?auto_180600 ?auto_180601 ) ) ( not ( = ?auto_180600 ?auto_180602 ) ) ( not ( = ?auto_180600 ?auto_180603 ) ) ( not ( = ?auto_180600 ?auto_180604 ) ) ( not ( = ?auto_180601 ?auto_180602 ) ) ( not ( = ?auto_180601 ?auto_180603 ) ) ( not ( = ?auto_180601 ?auto_180604 ) ) ( not ( = ?auto_180602 ?auto_180603 ) ) ( not ( = ?auto_180602 ?auto_180604 ) ) ( not ( = ?auto_180603 ?auto_180604 ) ) ( ON ?auto_180604 ?auto_180605 ) ( not ( = ?auto_180597 ?auto_180605 ) ) ( not ( = ?auto_180598 ?auto_180605 ) ) ( not ( = ?auto_180599 ?auto_180605 ) ) ( not ( = ?auto_180600 ?auto_180605 ) ) ( not ( = ?auto_180601 ?auto_180605 ) ) ( not ( = ?auto_180602 ?auto_180605 ) ) ( not ( = ?auto_180603 ?auto_180605 ) ) ( not ( = ?auto_180604 ?auto_180605 ) ) ( ON ?auto_180603 ?auto_180604 ) ( ON-TABLE ?auto_180605 ) ( ON ?auto_180602 ?auto_180603 ) ( ON ?auto_180601 ?auto_180602 ) ( ON ?auto_180600 ?auto_180601 ) ( ON ?auto_180599 ?auto_180600 ) ( ON ?auto_180598 ?auto_180599 ) ( ON ?auto_180597 ?auto_180598 ) ( CLEAR ?auto_180597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180605 ?auto_180604 ?auto_180603 ?auto_180602 ?auto_180601 ?auto_180600 ?auto_180599 ?auto_180598 )
      ( MAKE-7PILE ?auto_180597 ?auto_180598 ?auto_180599 ?auto_180600 ?auto_180601 ?auto_180602 ?auto_180603 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180607 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_180607 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_180607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180608 - BLOCK
    )
    :vars
    (
      ?auto_180609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180608 ?auto_180609 ) ( CLEAR ?auto_180608 ) ( HAND-EMPTY ) ( not ( = ?auto_180608 ?auto_180609 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180608 ?auto_180609 )
      ( MAKE-1PILE ?auto_180608 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180610 - BLOCK
    )
    :vars
    (
      ?auto_180611 - BLOCK
      ?auto_180617 - BLOCK
      ?auto_180616 - BLOCK
      ?auto_180615 - BLOCK
      ?auto_180613 - BLOCK
      ?auto_180612 - BLOCK
      ?auto_180614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180610 ?auto_180611 ) ) ( HOLDING ?auto_180610 ) ( CLEAR ?auto_180611 ) ( ON-TABLE ?auto_180617 ) ( ON ?auto_180616 ?auto_180617 ) ( ON ?auto_180615 ?auto_180616 ) ( ON ?auto_180613 ?auto_180615 ) ( ON ?auto_180612 ?auto_180613 ) ( ON ?auto_180614 ?auto_180612 ) ( ON ?auto_180611 ?auto_180614 ) ( not ( = ?auto_180617 ?auto_180616 ) ) ( not ( = ?auto_180617 ?auto_180615 ) ) ( not ( = ?auto_180617 ?auto_180613 ) ) ( not ( = ?auto_180617 ?auto_180612 ) ) ( not ( = ?auto_180617 ?auto_180614 ) ) ( not ( = ?auto_180617 ?auto_180611 ) ) ( not ( = ?auto_180617 ?auto_180610 ) ) ( not ( = ?auto_180616 ?auto_180615 ) ) ( not ( = ?auto_180616 ?auto_180613 ) ) ( not ( = ?auto_180616 ?auto_180612 ) ) ( not ( = ?auto_180616 ?auto_180614 ) ) ( not ( = ?auto_180616 ?auto_180611 ) ) ( not ( = ?auto_180616 ?auto_180610 ) ) ( not ( = ?auto_180615 ?auto_180613 ) ) ( not ( = ?auto_180615 ?auto_180612 ) ) ( not ( = ?auto_180615 ?auto_180614 ) ) ( not ( = ?auto_180615 ?auto_180611 ) ) ( not ( = ?auto_180615 ?auto_180610 ) ) ( not ( = ?auto_180613 ?auto_180612 ) ) ( not ( = ?auto_180613 ?auto_180614 ) ) ( not ( = ?auto_180613 ?auto_180611 ) ) ( not ( = ?auto_180613 ?auto_180610 ) ) ( not ( = ?auto_180612 ?auto_180614 ) ) ( not ( = ?auto_180612 ?auto_180611 ) ) ( not ( = ?auto_180612 ?auto_180610 ) ) ( not ( = ?auto_180614 ?auto_180611 ) ) ( not ( = ?auto_180614 ?auto_180610 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180617 ?auto_180616 ?auto_180615 ?auto_180613 ?auto_180612 ?auto_180614 ?auto_180611 ?auto_180610 )
      ( MAKE-1PILE ?auto_180610 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180618 - BLOCK
    )
    :vars
    (
      ?auto_180623 - BLOCK
      ?auto_180624 - BLOCK
      ?auto_180625 - BLOCK
      ?auto_180622 - BLOCK
      ?auto_180619 - BLOCK
      ?auto_180621 - BLOCK
      ?auto_180620 - BLOCK
      ?auto_180626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180618 ?auto_180623 ) ) ( CLEAR ?auto_180623 ) ( ON-TABLE ?auto_180624 ) ( ON ?auto_180625 ?auto_180624 ) ( ON ?auto_180622 ?auto_180625 ) ( ON ?auto_180619 ?auto_180622 ) ( ON ?auto_180621 ?auto_180619 ) ( ON ?auto_180620 ?auto_180621 ) ( ON ?auto_180623 ?auto_180620 ) ( not ( = ?auto_180624 ?auto_180625 ) ) ( not ( = ?auto_180624 ?auto_180622 ) ) ( not ( = ?auto_180624 ?auto_180619 ) ) ( not ( = ?auto_180624 ?auto_180621 ) ) ( not ( = ?auto_180624 ?auto_180620 ) ) ( not ( = ?auto_180624 ?auto_180623 ) ) ( not ( = ?auto_180624 ?auto_180618 ) ) ( not ( = ?auto_180625 ?auto_180622 ) ) ( not ( = ?auto_180625 ?auto_180619 ) ) ( not ( = ?auto_180625 ?auto_180621 ) ) ( not ( = ?auto_180625 ?auto_180620 ) ) ( not ( = ?auto_180625 ?auto_180623 ) ) ( not ( = ?auto_180625 ?auto_180618 ) ) ( not ( = ?auto_180622 ?auto_180619 ) ) ( not ( = ?auto_180622 ?auto_180621 ) ) ( not ( = ?auto_180622 ?auto_180620 ) ) ( not ( = ?auto_180622 ?auto_180623 ) ) ( not ( = ?auto_180622 ?auto_180618 ) ) ( not ( = ?auto_180619 ?auto_180621 ) ) ( not ( = ?auto_180619 ?auto_180620 ) ) ( not ( = ?auto_180619 ?auto_180623 ) ) ( not ( = ?auto_180619 ?auto_180618 ) ) ( not ( = ?auto_180621 ?auto_180620 ) ) ( not ( = ?auto_180621 ?auto_180623 ) ) ( not ( = ?auto_180621 ?auto_180618 ) ) ( not ( = ?auto_180620 ?auto_180623 ) ) ( not ( = ?auto_180620 ?auto_180618 ) ) ( ON ?auto_180618 ?auto_180626 ) ( CLEAR ?auto_180618 ) ( HAND-EMPTY ) ( not ( = ?auto_180618 ?auto_180626 ) ) ( not ( = ?auto_180623 ?auto_180626 ) ) ( not ( = ?auto_180624 ?auto_180626 ) ) ( not ( = ?auto_180625 ?auto_180626 ) ) ( not ( = ?auto_180622 ?auto_180626 ) ) ( not ( = ?auto_180619 ?auto_180626 ) ) ( not ( = ?auto_180621 ?auto_180626 ) ) ( not ( = ?auto_180620 ?auto_180626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180618 ?auto_180626 )
      ( MAKE-1PILE ?auto_180618 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180627 - BLOCK
    )
    :vars
    (
      ?auto_180631 - BLOCK
      ?auto_180634 - BLOCK
      ?auto_180628 - BLOCK
      ?auto_180629 - BLOCK
      ?auto_180632 - BLOCK
      ?auto_180635 - BLOCK
      ?auto_180633 - BLOCK
      ?auto_180630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180627 ?auto_180631 ) ) ( ON-TABLE ?auto_180634 ) ( ON ?auto_180628 ?auto_180634 ) ( ON ?auto_180629 ?auto_180628 ) ( ON ?auto_180632 ?auto_180629 ) ( ON ?auto_180635 ?auto_180632 ) ( ON ?auto_180633 ?auto_180635 ) ( not ( = ?auto_180634 ?auto_180628 ) ) ( not ( = ?auto_180634 ?auto_180629 ) ) ( not ( = ?auto_180634 ?auto_180632 ) ) ( not ( = ?auto_180634 ?auto_180635 ) ) ( not ( = ?auto_180634 ?auto_180633 ) ) ( not ( = ?auto_180634 ?auto_180631 ) ) ( not ( = ?auto_180634 ?auto_180627 ) ) ( not ( = ?auto_180628 ?auto_180629 ) ) ( not ( = ?auto_180628 ?auto_180632 ) ) ( not ( = ?auto_180628 ?auto_180635 ) ) ( not ( = ?auto_180628 ?auto_180633 ) ) ( not ( = ?auto_180628 ?auto_180631 ) ) ( not ( = ?auto_180628 ?auto_180627 ) ) ( not ( = ?auto_180629 ?auto_180632 ) ) ( not ( = ?auto_180629 ?auto_180635 ) ) ( not ( = ?auto_180629 ?auto_180633 ) ) ( not ( = ?auto_180629 ?auto_180631 ) ) ( not ( = ?auto_180629 ?auto_180627 ) ) ( not ( = ?auto_180632 ?auto_180635 ) ) ( not ( = ?auto_180632 ?auto_180633 ) ) ( not ( = ?auto_180632 ?auto_180631 ) ) ( not ( = ?auto_180632 ?auto_180627 ) ) ( not ( = ?auto_180635 ?auto_180633 ) ) ( not ( = ?auto_180635 ?auto_180631 ) ) ( not ( = ?auto_180635 ?auto_180627 ) ) ( not ( = ?auto_180633 ?auto_180631 ) ) ( not ( = ?auto_180633 ?auto_180627 ) ) ( ON ?auto_180627 ?auto_180630 ) ( CLEAR ?auto_180627 ) ( not ( = ?auto_180627 ?auto_180630 ) ) ( not ( = ?auto_180631 ?auto_180630 ) ) ( not ( = ?auto_180634 ?auto_180630 ) ) ( not ( = ?auto_180628 ?auto_180630 ) ) ( not ( = ?auto_180629 ?auto_180630 ) ) ( not ( = ?auto_180632 ?auto_180630 ) ) ( not ( = ?auto_180635 ?auto_180630 ) ) ( not ( = ?auto_180633 ?auto_180630 ) ) ( HOLDING ?auto_180631 ) ( CLEAR ?auto_180633 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180634 ?auto_180628 ?auto_180629 ?auto_180632 ?auto_180635 ?auto_180633 ?auto_180631 )
      ( MAKE-1PILE ?auto_180627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180636 - BLOCK
    )
    :vars
    (
      ?auto_180638 - BLOCK
      ?auto_180642 - BLOCK
      ?auto_180637 - BLOCK
      ?auto_180639 - BLOCK
      ?auto_180641 - BLOCK
      ?auto_180643 - BLOCK
      ?auto_180644 - BLOCK
      ?auto_180640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180636 ?auto_180638 ) ) ( ON-TABLE ?auto_180642 ) ( ON ?auto_180637 ?auto_180642 ) ( ON ?auto_180639 ?auto_180637 ) ( ON ?auto_180641 ?auto_180639 ) ( ON ?auto_180643 ?auto_180641 ) ( ON ?auto_180644 ?auto_180643 ) ( not ( = ?auto_180642 ?auto_180637 ) ) ( not ( = ?auto_180642 ?auto_180639 ) ) ( not ( = ?auto_180642 ?auto_180641 ) ) ( not ( = ?auto_180642 ?auto_180643 ) ) ( not ( = ?auto_180642 ?auto_180644 ) ) ( not ( = ?auto_180642 ?auto_180638 ) ) ( not ( = ?auto_180642 ?auto_180636 ) ) ( not ( = ?auto_180637 ?auto_180639 ) ) ( not ( = ?auto_180637 ?auto_180641 ) ) ( not ( = ?auto_180637 ?auto_180643 ) ) ( not ( = ?auto_180637 ?auto_180644 ) ) ( not ( = ?auto_180637 ?auto_180638 ) ) ( not ( = ?auto_180637 ?auto_180636 ) ) ( not ( = ?auto_180639 ?auto_180641 ) ) ( not ( = ?auto_180639 ?auto_180643 ) ) ( not ( = ?auto_180639 ?auto_180644 ) ) ( not ( = ?auto_180639 ?auto_180638 ) ) ( not ( = ?auto_180639 ?auto_180636 ) ) ( not ( = ?auto_180641 ?auto_180643 ) ) ( not ( = ?auto_180641 ?auto_180644 ) ) ( not ( = ?auto_180641 ?auto_180638 ) ) ( not ( = ?auto_180641 ?auto_180636 ) ) ( not ( = ?auto_180643 ?auto_180644 ) ) ( not ( = ?auto_180643 ?auto_180638 ) ) ( not ( = ?auto_180643 ?auto_180636 ) ) ( not ( = ?auto_180644 ?auto_180638 ) ) ( not ( = ?auto_180644 ?auto_180636 ) ) ( ON ?auto_180636 ?auto_180640 ) ( not ( = ?auto_180636 ?auto_180640 ) ) ( not ( = ?auto_180638 ?auto_180640 ) ) ( not ( = ?auto_180642 ?auto_180640 ) ) ( not ( = ?auto_180637 ?auto_180640 ) ) ( not ( = ?auto_180639 ?auto_180640 ) ) ( not ( = ?auto_180641 ?auto_180640 ) ) ( not ( = ?auto_180643 ?auto_180640 ) ) ( not ( = ?auto_180644 ?auto_180640 ) ) ( CLEAR ?auto_180644 ) ( ON ?auto_180638 ?auto_180636 ) ( CLEAR ?auto_180638 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180640 ?auto_180636 )
      ( MAKE-1PILE ?auto_180636 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180645 - BLOCK
    )
    :vars
    (
      ?auto_180652 - BLOCK
      ?auto_180648 - BLOCK
      ?auto_180646 - BLOCK
      ?auto_180651 - BLOCK
      ?auto_180647 - BLOCK
      ?auto_180649 - BLOCK
      ?auto_180653 - BLOCK
      ?auto_180650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180645 ?auto_180652 ) ) ( ON-TABLE ?auto_180648 ) ( ON ?auto_180646 ?auto_180648 ) ( ON ?auto_180651 ?auto_180646 ) ( ON ?auto_180647 ?auto_180651 ) ( ON ?auto_180649 ?auto_180647 ) ( not ( = ?auto_180648 ?auto_180646 ) ) ( not ( = ?auto_180648 ?auto_180651 ) ) ( not ( = ?auto_180648 ?auto_180647 ) ) ( not ( = ?auto_180648 ?auto_180649 ) ) ( not ( = ?auto_180648 ?auto_180653 ) ) ( not ( = ?auto_180648 ?auto_180652 ) ) ( not ( = ?auto_180648 ?auto_180645 ) ) ( not ( = ?auto_180646 ?auto_180651 ) ) ( not ( = ?auto_180646 ?auto_180647 ) ) ( not ( = ?auto_180646 ?auto_180649 ) ) ( not ( = ?auto_180646 ?auto_180653 ) ) ( not ( = ?auto_180646 ?auto_180652 ) ) ( not ( = ?auto_180646 ?auto_180645 ) ) ( not ( = ?auto_180651 ?auto_180647 ) ) ( not ( = ?auto_180651 ?auto_180649 ) ) ( not ( = ?auto_180651 ?auto_180653 ) ) ( not ( = ?auto_180651 ?auto_180652 ) ) ( not ( = ?auto_180651 ?auto_180645 ) ) ( not ( = ?auto_180647 ?auto_180649 ) ) ( not ( = ?auto_180647 ?auto_180653 ) ) ( not ( = ?auto_180647 ?auto_180652 ) ) ( not ( = ?auto_180647 ?auto_180645 ) ) ( not ( = ?auto_180649 ?auto_180653 ) ) ( not ( = ?auto_180649 ?auto_180652 ) ) ( not ( = ?auto_180649 ?auto_180645 ) ) ( not ( = ?auto_180653 ?auto_180652 ) ) ( not ( = ?auto_180653 ?auto_180645 ) ) ( ON ?auto_180645 ?auto_180650 ) ( not ( = ?auto_180645 ?auto_180650 ) ) ( not ( = ?auto_180652 ?auto_180650 ) ) ( not ( = ?auto_180648 ?auto_180650 ) ) ( not ( = ?auto_180646 ?auto_180650 ) ) ( not ( = ?auto_180651 ?auto_180650 ) ) ( not ( = ?auto_180647 ?auto_180650 ) ) ( not ( = ?auto_180649 ?auto_180650 ) ) ( not ( = ?auto_180653 ?auto_180650 ) ) ( ON ?auto_180652 ?auto_180645 ) ( CLEAR ?auto_180652 ) ( ON-TABLE ?auto_180650 ) ( HOLDING ?auto_180653 ) ( CLEAR ?auto_180649 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180648 ?auto_180646 ?auto_180651 ?auto_180647 ?auto_180649 ?auto_180653 )
      ( MAKE-1PILE ?auto_180645 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180654 - BLOCK
    )
    :vars
    (
      ?auto_180655 - BLOCK
      ?auto_180661 - BLOCK
      ?auto_180657 - BLOCK
      ?auto_180656 - BLOCK
      ?auto_180662 - BLOCK
      ?auto_180660 - BLOCK
      ?auto_180658 - BLOCK
      ?auto_180659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180654 ?auto_180655 ) ) ( ON-TABLE ?auto_180661 ) ( ON ?auto_180657 ?auto_180661 ) ( ON ?auto_180656 ?auto_180657 ) ( ON ?auto_180662 ?auto_180656 ) ( ON ?auto_180660 ?auto_180662 ) ( not ( = ?auto_180661 ?auto_180657 ) ) ( not ( = ?auto_180661 ?auto_180656 ) ) ( not ( = ?auto_180661 ?auto_180662 ) ) ( not ( = ?auto_180661 ?auto_180660 ) ) ( not ( = ?auto_180661 ?auto_180658 ) ) ( not ( = ?auto_180661 ?auto_180655 ) ) ( not ( = ?auto_180661 ?auto_180654 ) ) ( not ( = ?auto_180657 ?auto_180656 ) ) ( not ( = ?auto_180657 ?auto_180662 ) ) ( not ( = ?auto_180657 ?auto_180660 ) ) ( not ( = ?auto_180657 ?auto_180658 ) ) ( not ( = ?auto_180657 ?auto_180655 ) ) ( not ( = ?auto_180657 ?auto_180654 ) ) ( not ( = ?auto_180656 ?auto_180662 ) ) ( not ( = ?auto_180656 ?auto_180660 ) ) ( not ( = ?auto_180656 ?auto_180658 ) ) ( not ( = ?auto_180656 ?auto_180655 ) ) ( not ( = ?auto_180656 ?auto_180654 ) ) ( not ( = ?auto_180662 ?auto_180660 ) ) ( not ( = ?auto_180662 ?auto_180658 ) ) ( not ( = ?auto_180662 ?auto_180655 ) ) ( not ( = ?auto_180662 ?auto_180654 ) ) ( not ( = ?auto_180660 ?auto_180658 ) ) ( not ( = ?auto_180660 ?auto_180655 ) ) ( not ( = ?auto_180660 ?auto_180654 ) ) ( not ( = ?auto_180658 ?auto_180655 ) ) ( not ( = ?auto_180658 ?auto_180654 ) ) ( ON ?auto_180654 ?auto_180659 ) ( not ( = ?auto_180654 ?auto_180659 ) ) ( not ( = ?auto_180655 ?auto_180659 ) ) ( not ( = ?auto_180661 ?auto_180659 ) ) ( not ( = ?auto_180657 ?auto_180659 ) ) ( not ( = ?auto_180656 ?auto_180659 ) ) ( not ( = ?auto_180662 ?auto_180659 ) ) ( not ( = ?auto_180660 ?auto_180659 ) ) ( not ( = ?auto_180658 ?auto_180659 ) ) ( ON ?auto_180655 ?auto_180654 ) ( ON-TABLE ?auto_180659 ) ( CLEAR ?auto_180660 ) ( ON ?auto_180658 ?auto_180655 ) ( CLEAR ?auto_180658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180659 ?auto_180654 ?auto_180655 )
      ( MAKE-1PILE ?auto_180654 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180663 - BLOCK
    )
    :vars
    (
      ?auto_180671 - BLOCK
      ?auto_180665 - BLOCK
      ?auto_180670 - BLOCK
      ?auto_180666 - BLOCK
      ?auto_180664 - BLOCK
      ?auto_180669 - BLOCK
      ?auto_180667 - BLOCK
      ?auto_180668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180663 ?auto_180671 ) ) ( ON-TABLE ?auto_180665 ) ( ON ?auto_180670 ?auto_180665 ) ( ON ?auto_180666 ?auto_180670 ) ( ON ?auto_180664 ?auto_180666 ) ( not ( = ?auto_180665 ?auto_180670 ) ) ( not ( = ?auto_180665 ?auto_180666 ) ) ( not ( = ?auto_180665 ?auto_180664 ) ) ( not ( = ?auto_180665 ?auto_180669 ) ) ( not ( = ?auto_180665 ?auto_180667 ) ) ( not ( = ?auto_180665 ?auto_180671 ) ) ( not ( = ?auto_180665 ?auto_180663 ) ) ( not ( = ?auto_180670 ?auto_180666 ) ) ( not ( = ?auto_180670 ?auto_180664 ) ) ( not ( = ?auto_180670 ?auto_180669 ) ) ( not ( = ?auto_180670 ?auto_180667 ) ) ( not ( = ?auto_180670 ?auto_180671 ) ) ( not ( = ?auto_180670 ?auto_180663 ) ) ( not ( = ?auto_180666 ?auto_180664 ) ) ( not ( = ?auto_180666 ?auto_180669 ) ) ( not ( = ?auto_180666 ?auto_180667 ) ) ( not ( = ?auto_180666 ?auto_180671 ) ) ( not ( = ?auto_180666 ?auto_180663 ) ) ( not ( = ?auto_180664 ?auto_180669 ) ) ( not ( = ?auto_180664 ?auto_180667 ) ) ( not ( = ?auto_180664 ?auto_180671 ) ) ( not ( = ?auto_180664 ?auto_180663 ) ) ( not ( = ?auto_180669 ?auto_180667 ) ) ( not ( = ?auto_180669 ?auto_180671 ) ) ( not ( = ?auto_180669 ?auto_180663 ) ) ( not ( = ?auto_180667 ?auto_180671 ) ) ( not ( = ?auto_180667 ?auto_180663 ) ) ( ON ?auto_180663 ?auto_180668 ) ( not ( = ?auto_180663 ?auto_180668 ) ) ( not ( = ?auto_180671 ?auto_180668 ) ) ( not ( = ?auto_180665 ?auto_180668 ) ) ( not ( = ?auto_180670 ?auto_180668 ) ) ( not ( = ?auto_180666 ?auto_180668 ) ) ( not ( = ?auto_180664 ?auto_180668 ) ) ( not ( = ?auto_180669 ?auto_180668 ) ) ( not ( = ?auto_180667 ?auto_180668 ) ) ( ON ?auto_180671 ?auto_180663 ) ( ON-TABLE ?auto_180668 ) ( ON ?auto_180667 ?auto_180671 ) ( CLEAR ?auto_180667 ) ( HOLDING ?auto_180669 ) ( CLEAR ?auto_180664 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180665 ?auto_180670 ?auto_180666 ?auto_180664 ?auto_180669 )
      ( MAKE-1PILE ?auto_180663 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180672 - BLOCK
    )
    :vars
    (
      ?auto_180680 - BLOCK
      ?auto_180678 - BLOCK
      ?auto_180677 - BLOCK
      ?auto_180675 - BLOCK
      ?auto_180679 - BLOCK
      ?auto_180673 - BLOCK
      ?auto_180674 - BLOCK
      ?auto_180676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180672 ?auto_180680 ) ) ( ON-TABLE ?auto_180678 ) ( ON ?auto_180677 ?auto_180678 ) ( ON ?auto_180675 ?auto_180677 ) ( ON ?auto_180679 ?auto_180675 ) ( not ( = ?auto_180678 ?auto_180677 ) ) ( not ( = ?auto_180678 ?auto_180675 ) ) ( not ( = ?auto_180678 ?auto_180679 ) ) ( not ( = ?auto_180678 ?auto_180673 ) ) ( not ( = ?auto_180678 ?auto_180674 ) ) ( not ( = ?auto_180678 ?auto_180680 ) ) ( not ( = ?auto_180678 ?auto_180672 ) ) ( not ( = ?auto_180677 ?auto_180675 ) ) ( not ( = ?auto_180677 ?auto_180679 ) ) ( not ( = ?auto_180677 ?auto_180673 ) ) ( not ( = ?auto_180677 ?auto_180674 ) ) ( not ( = ?auto_180677 ?auto_180680 ) ) ( not ( = ?auto_180677 ?auto_180672 ) ) ( not ( = ?auto_180675 ?auto_180679 ) ) ( not ( = ?auto_180675 ?auto_180673 ) ) ( not ( = ?auto_180675 ?auto_180674 ) ) ( not ( = ?auto_180675 ?auto_180680 ) ) ( not ( = ?auto_180675 ?auto_180672 ) ) ( not ( = ?auto_180679 ?auto_180673 ) ) ( not ( = ?auto_180679 ?auto_180674 ) ) ( not ( = ?auto_180679 ?auto_180680 ) ) ( not ( = ?auto_180679 ?auto_180672 ) ) ( not ( = ?auto_180673 ?auto_180674 ) ) ( not ( = ?auto_180673 ?auto_180680 ) ) ( not ( = ?auto_180673 ?auto_180672 ) ) ( not ( = ?auto_180674 ?auto_180680 ) ) ( not ( = ?auto_180674 ?auto_180672 ) ) ( ON ?auto_180672 ?auto_180676 ) ( not ( = ?auto_180672 ?auto_180676 ) ) ( not ( = ?auto_180680 ?auto_180676 ) ) ( not ( = ?auto_180678 ?auto_180676 ) ) ( not ( = ?auto_180677 ?auto_180676 ) ) ( not ( = ?auto_180675 ?auto_180676 ) ) ( not ( = ?auto_180679 ?auto_180676 ) ) ( not ( = ?auto_180673 ?auto_180676 ) ) ( not ( = ?auto_180674 ?auto_180676 ) ) ( ON ?auto_180680 ?auto_180672 ) ( ON-TABLE ?auto_180676 ) ( ON ?auto_180674 ?auto_180680 ) ( CLEAR ?auto_180679 ) ( ON ?auto_180673 ?auto_180674 ) ( CLEAR ?auto_180673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180676 ?auto_180672 ?auto_180680 ?auto_180674 )
      ( MAKE-1PILE ?auto_180672 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180681 - BLOCK
    )
    :vars
    (
      ?auto_180685 - BLOCK
      ?auto_180689 - BLOCK
      ?auto_180688 - BLOCK
      ?auto_180682 - BLOCK
      ?auto_180684 - BLOCK
      ?auto_180683 - BLOCK
      ?auto_180686 - BLOCK
      ?auto_180687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180681 ?auto_180685 ) ) ( ON-TABLE ?auto_180689 ) ( ON ?auto_180688 ?auto_180689 ) ( ON ?auto_180682 ?auto_180688 ) ( not ( = ?auto_180689 ?auto_180688 ) ) ( not ( = ?auto_180689 ?auto_180682 ) ) ( not ( = ?auto_180689 ?auto_180684 ) ) ( not ( = ?auto_180689 ?auto_180683 ) ) ( not ( = ?auto_180689 ?auto_180686 ) ) ( not ( = ?auto_180689 ?auto_180685 ) ) ( not ( = ?auto_180689 ?auto_180681 ) ) ( not ( = ?auto_180688 ?auto_180682 ) ) ( not ( = ?auto_180688 ?auto_180684 ) ) ( not ( = ?auto_180688 ?auto_180683 ) ) ( not ( = ?auto_180688 ?auto_180686 ) ) ( not ( = ?auto_180688 ?auto_180685 ) ) ( not ( = ?auto_180688 ?auto_180681 ) ) ( not ( = ?auto_180682 ?auto_180684 ) ) ( not ( = ?auto_180682 ?auto_180683 ) ) ( not ( = ?auto_180682 ?auto_180686 ) ) ( not ( = ?auto_180682 ?auto_180685 ) ) ( not ( = ?auto_180682 ?auto_180681 ) ) ( not ( = ?auto_180684 ?auto_180683 ) ) ( not ( = ?auto_180684 ?auto_180686 ) ) ( not ( = ?auto_180684 ?auto_180685 ) ) ( not ( = ?auto_180684 ?auto_180681 ) ) ( not ( = ?auto_180683 ?auto_180686 ) ) ( not ( = ?auto_180683 ?auto_180685 ) ) ( not ( = ?auto_180683 ?auto_180681 ) ) ( not ( = ?auto_180686 ?auto_180685 ) ) ( not ( = ?auto_180686 ?auto_180681 ) ) ( ON ?auto_180681 ?auto_180687 ) ( not ( = ?auto_180681 ?auto_180687 ) ) ( not ( = ?auto_180685 ?auto_180687 ) ) ( not ( = ?auto_180689 ?auto_180687 ) ) ( not ( = ?auto_180688 ?auto_180687 ) ) ( not ( = ?auto_180682 ?auto_180687 ) ) ( not ( = ?auto_180684 ?auto_180687 ) ) ( not ( = ?auto_180683 ?auto_180687 ) ) ( not ( = ?auto_180686 ?auto_180687 ) ) ( ON ?auto_180685 ?auto_180681 ) ( ON-TABLE ?auto_180687 ) ( ON ?auto_180686 ?auto_180685 ) ( ON ?auto_180683 ?auto_180686 ) ( CLEAR ?auto_180683 ) ( HOLDING ?auto_180684 ) ( CLEAR ?auto_180682 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180689 ?auto_180688 ?auto_180682 ?auto_180684 )
      ( MAKE-1PILE ?auto_180681 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180690 - BLOCK
    )
    :vars
    (
      ?auto_180693 - BLOCK
      ?auto_180697 - BLOCK
      ?auto_180695 - BLOCK
      ?auto_180698 - BLOCK
      ?auto_180694 - BLOCK
      ?auto_180696 - BLOCK
      ?auto_180692 - BLOCK
      ?auto_180691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180690 ?auto_180693 ) ) ( ON-TABLE ?auto_180697 ) ( ON ?auto_180695 ?auto_180697 ) ( ON ?auto_180698 ?auto_180695 ) ( not ( = ?auto_180697 ?auto_180695 ) ) ( not ( = ?auto_180697 ?auto_180698 ) ) ( not ( = ?auto_180697 ?auto_180694 ) ) ( not ( = ?auto_180697 ?auto_180696 ) ) ( not ( = ?auto_180697 ?auto_180692 ) ) ( not ( = ?auto_180697 ?auto_180693 ) ) ( not ( = ?auto_180697 ?auto_180690 ) ) ( not ( = ?auto_180695 ?auto_180698 ) ) ( not ( = ?auto_180695 ?auto_180694 ) ) ( not ( = ?auto_180695 ?auto_180696 ) ) ( not ( = ?auto_180695 ?auto_180692 ) ) ( not ( = ?auto_180695 ?auto_180693 ) ) ( not ( = ?auto_180695 ?auto_180690 ) ) ( not ( = ?auto_180698 ?auto_180694 ) ) ( not ( = ?auto_180698 ?auto_180696 ) ) ( not ( = ?auto_180698 ?auto_180692 ) ) ( not ( = ?auto_180698 ?auto_180693 ) ) ( not ( = ?auto_180698 ?auto_180690 ) ) ( not ( = ?auto_180694 ?auto_180696 ) ) ( not ( = ?auto_180694 ?auto_180692 ) ) ( not ( = ?auto_180694 ?auto_180693 ) ) ( not ( = ?auto_180694 ?auto_180690 ) ) ( not ( = ?auto_180696 ?auto_180692 ) ) ( not ( = ?auto_180696 ?auto_180693 ) ) ( not ( = ?auto_180696 ?auto_180690 ) ) ( not ( = ?auto_180692 ?auto_180693 ) ) ( not ( = ?auto_180692 ?auto_180690 ) ) ( ON ?auto_180690 ?auto_180691 ) ( not ( = ?auto_180690 ?auto_180691 ) ) ( not ( = ?auto_180693 ?auto_180691 ) ) ( not ( = ?auto_180697 ?auto_180691 ) ) ( not ( = ?auto_180695 ?auto_180691 ) ) ( not ( = ?auto_180698 ?auto_180691 ) ) ( not ( = ?auto_180694 ?auto_180691 ) ) ( not ( = ?auto_180696 ?auto_180691 ) ) ( not ( = ?auto_180692 ?auto_180691 ) ) ( ON ?auto_180693 ?auto_180690 ) ( ON-TABLE ?auto_180691 ) ( ON ?auto_180692 ?auto_180693 ) ( ON ?auto_180696 ?auto_180692 ) ( CLEAR ?auto_180698 ) ( ON ?auto_180694 ?auto_180696 ) ( CLEAR ?auto_180694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180691 ?auto_180690 ?auto_180693 ?auto_180692 ?auto_180696 )
      ( MAKE-1PILE ?auto_180690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180699 - BLOCK
    )
    :vars
    (
      ?auto_180700 - BLOCK
      ?auto_180702 - BLOCK
      ?auto_180704 - BLOCK
      ?auto_180705 - BLOCK
      ?auto_180703 - BLOCK
      ?auto_180701 - BLOCK
      ?auto_180706 - BLOCK
      ?auto_180707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180699 ?auto_180700 ) ) ( ON-TABLE ?auto_180702 ) ( ON ?auto_180704 ?auto_180702 ) ( not ( = ?auto_180702 ?auto_180704 ) ) ( not ( = ?auto_180702 ?auto_180705 ) ) ( not ( = ?auto_180702 ?auto_180703 ) ) ( not ( = ?auto_180702 ?auto_180701 ) ) ( not ( = ?auto_180702 ?auto_180706 ) ) ( not ( = ?auto_180702 ?auto_180700 ) ) ( not ( = ?auto_180702 ?auto_180699 ) ) ( not ( = ?auto_180704 ?auto_180705 ) ) ( not ( = ?auto_180704 ?auto_180703 ) ) ( not ( = ?auto_180704 ?auto_180701 ) ) ( not ( = ?auto_180704 ?auto_180706 ) ) ( not ( = ?auto_180704 ?auto_180700 ) ) ( not ( = ?auto_180704 ?auto_180699 ) ) ( not ( = ?auto_180705 ?auto_180703 ) ) ( not ( = ?auto_180705 ?auto_180701 ) ) ( not ( = ?auto_180705 ?auto_180706 ) ) ( not ( = ?auto_180705 ?auto_180700 ) ) ( not ( = ?auto_180705 ?auto_180699 ) ) ( not ( = ?auto_180703 ?auto_180701 ) ) ( not ( = ?auto_180703 ?auto_180706 ) ) ( not ( = ?auto_180703 ?auto_180700 ) ) ( not ( = ?auto_180703 ?auto_180699 ) ) ( not ( = ?auto_180701 ?auto_180706 ) ) ( not ( = ?auto_180701 ?auto_180700 ) ) ( not ( = ?auto_180701 ?auto_180699 ) ) ( not ( = ?auto_180706 ?auto_180700 ) ) ( not ( = ?auto_180706 ?auto_180699 ) ) ( ON ?auto_180699 ?auto_180707 ) ( not ( = ?auto_180699 ?auto_180707 ) ) ( not ( = ?auto_180700 ?auto_180707 ) ) ( not ( = ?auto_180702 ?auto_180707 ) ) ( not ( = ?auto_180704 ?auto_180707 ) ) ( not ( = ?auto_180705 ?auto_180707 ) ) ( not ( = ?auto_180703 ?auto_180707 ) ) ( not ( = ?auto_180701 ?auto_180707 ) ) ( not ( = ?auto_180706 ?auto_180707 ) ) ( ON ?auto_180700 ?auto_180699 ) ( ON-TABLE ?auto_180707 ) ( ON ?auto_180706 ?auto_180700 ) ( ON ?auto_180701 ?auto_180706 ) ( ON ?auto_180703 ?auto_180701 ) ( CLEAR ?auto_180703 ) ( HOLDING ?auto_180705 ) ( CLEAR ?auto_180704 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180702 ?auto_180704 ?auto_180705 )
      ( MAKE-1PILE ?auto_180699 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180708 - BLOCK
    )
    :vars
    (
      ?auto_180711 - BLOCK
      ?auto_180712 - BLOCK
      ?auto_180716 - BLOCK
      ?auto_180715 - BLOCK
      ?auto_180710 - BLOCK
      ?auto_180709 - BLOCK
      ?auto_180713 - BLOCK
      ?auto_180714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180708 ?auto_180711 ) ) ( ON-TABLE ?auto_180712 ) ( ON ?auto_180716 ?auto_180712 ) ( not ( = ?auto_180712 ?auto_180716 ) ) ( not ( = ?auto_180712 ?auto_180715 ) ) ( not ( = ?auto_180712 ?auto_180710 ) ) ( not ( = ?auto_180712 ?auto_180709 ) ) ( not ( = ?auto_180712 ?auto_180713 ) ) ( not ( = ?auto_180712 ?auto_180711 ) ) ( not ( = ?auto_180712 ?auto_180708 ) ) ( not ( = ?auto_180716 ?auto_180715 ) ) ( not ( = ?auto_180716 ?auto_180710 ) ) ( not ( = ?auto_180716 ?auto_180709 ) ) ( not ( = ?auto_180716 ?auto_180713 ) ) ( not ( = ?auto_180716 ?auto_180711 ) ) ( not ( = ?auto_180716 ?auto_180708 ) ) ( not ( = ?auto_180715 ?auto_180710 ) ) ( not ( = ?auto_180715 ?auto_180709 ) ) ( not ( = ?auto_180715 ?auto_180713 ) ) ( not ( = ?auto_180715 ?auto_180711 ) ) ( not ( = ?auto_180715 ?auto_180708 ) ) ( not ( = ?auto_180710 ?auto_180709 ) ) ( not ( = ?auto_180710 ?auto_180713 ) ) ( not ( = ?auto_180710 ?auto_180711 ) ) ( not ( = ?auto_180710 ?auto_180708 ) ) ( not ( = ?auto_180709 ?auto_180713 ) ) ( not ( = ?auto_180709 ?auto_180711 ) ) ( not ( = ?auto_180709 ?auto_180708 ) ) ( not ( = ?auto_180713 ?auto_180711 ) ) ( not ( = ?auto_180713 ?auto_180708 ) ) ( ON ?auto_180708 ?auto_180714 ) ( not ( = ?auto_180708 ?auto_180714 ) ) ( not ( = ?auto_180711 ?auto_180714 ) ) ( not ( = ?auto_180712 ?auto_180714 ) ) ( not ( = ?auto_180716 ?auto_180714 ) ) ( not ( = ?auto_180715 ?auto_180714 ) ) ( not ( = ?auto_180710 ?auto_180714 ) ) ( not ( = ?auto_180709 ?auto_180714 ) ) ( not ( = ?auto_180713 ?auto_180714 ) ) ( ON ?auto_180711 ?auto_180708 ) ( ON-TABLE ?auto_180714 ) ( ON ?auto_180713 ?auto_180711 ) ( ON ?auto_180709 ?auto_180713 ) ( ON ?auto_180710 ?auto_180709 ) ( CLEAR ?auto_180716 ) ( ON ?auto_180715 ?auto_180710 ) ( CLEAR ?auto_180715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180714 ?auto_180708 ?auto_180711 ?auto_180713 ?auto_180709 ?auto_180710 )
      ( MAKE-1PILE ?auto_180708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180717 - BLOCK
    )
    :vars
    (
      ?auto_180718 - BLOCK
      ?auto_180722 - BLOCK
      ?auto_180725 - BLOCK
      ?auto_180719 - BLOCK
      ?auto_180724 - BLOCK
      ?auto_180721 - BLOCK
      ?auto_180723 - BLOCK
      ?auto_180720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180717 ?auto_180718 ) ) ( ON-TABLE ?auto_180722 ) ( not ( = ?auto_180722 ?auto_180725 ) ) ( not ( = ?auto_180722 ?auto_180719 ) ) ( not ( = ?auto_180722 ?auto_180724 ) ) ( not ( = ?auto_180722 ?auto_180721 ) ) ( not ( = ?auto_180722 ?auto_180723 ) ) ( not ( = ?auto_180722 ?auto_180718 ) ) ( not ( = ?auto_180722 ?auto_180717 ) ) ( not ( = ?auto_180725 ?auto_180719 ) ) ( not ( = ?auto_180725 ?auto_180724 ) ) ( not ( = ?auto_180725 ?auto_180721 ) ) ( not ( = ?auto_180725 ?auto_180723 ) ) ( not ( = ?auto_180725 ?auto_180718 ) ) ( not ( = ?auto_180725 ?auto_180717 ) ) ( not ( = ?auto_180719 ?auto_180724 ) ) ( not ( = ?auto_180719 ?auto_180721 ) ) ( not ( = ?auto_180719 ?auto_180723 ) ) ( not ( = ?auto_180719 ?auto_180718 ) ) ( not ( = ?auto_180719 ?auto_180717 ) ) ( not ( = ?auto_180724 ?auto_180721 ) ) ( not ( = ?auto_180724 ?auto_180723 ) ) ( not ( = ?auto_180724 ?auto_180718 ) ) ( not ( = ?auto_180724 ?auto_180717 ) ) ( not ( = ?auto_180721 ?auto_180723 ) ) ( not ( = ?auto_180721 ?auto_180718 ) ) ( not ( = ?auto_180721 ?auto_180717 ) ) ( not ( = ?auto_180723 ?auto_180718 ) ) ( not ( = ?auto_180723 ?auto_180717 ) ) ( ON ?auto_180717 ?auto_180720 ) ( not ( = ?auto_180717 ?auto_180720 ) ) ( not ( = ?auto_180718 ?auto_180720 ) ) ( not ( = ?auto_180722 ?auto_180720 ) ) ( not ( = ?auto_180725 ?auto_180720 ) ) ( not ( = ?auto_180719 ?auto_180720 ) ) ( not ( = ?auto_180724 ?auto_180720 ) ) ( not ( = ?auto_180721 ?auto_180720 ) ) ( not ( = ?auto_180723 ?auto_180720 ) ) ( ON ?auto_180718 ?auto_180717 ) ( ON-TABLE ?auto_180720 ) ( ON ?auto_180723 ?auto_180718 ) ( ON ?auto_180721 ?auto_180723 ) ( ON ?auto_180724 ?auto_180721 ) ( ON ?auto_180719 ?auto_180724 ) ( CLEAR ?auto_180719 ) ( HOLDING ?auto_180725 ) ( CLEAR ?auto_180722 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180722 ?auto_180725 )
      ( MAKE-1PILE ?auto_180717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180726 - BLOCK
    )
    :vars
    (
      ?auto_180730 - BLOCK
      ?auto_180731 - BLOCK
      ?auto_180727 - BLOCK
      ?auto_180733 - BLOCK
      ?auto_180732 - BLOCK
      ?auto_180728 - BLOCK
      ?auto_180729 - BLOCK
      ?auto_180734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180726 ?auto_180730 ) ) ( ON-TABLE ?auto_180731 ) ( not ( = ?auto_180731 ?auto_180727 ) ) ( not ( = ?auto_180731 ?auto_180733 ) ) ( not ( = ?auto_180731 ?auto_180732 ) ) ( not ( = ?auto_180731 ?auto_180728 ) ) ( not ( = ?auto_180731 ?auto_180729 ) ) ( not ( = ?auto_180731 ?auto_180730 ) ) ( not ( = ?auto_180731 ?auto_180726 ) ) ( not ( = ?auto_180727 ?auto_180733 ) ) ( not ( = ?auto_180727 ?auto_180732 ) ) ( not ( = ?auto_180727 ?auto_180728 ) ) ( not ( = ?auto_180727 ?auto_180729 ) ) ( not ( = ?auto_180727 ?auto_180730 ) ) ( not ( = ?auto_180727 ?auto_180726 ) ) ( not ( = ?auto_180733 ?auto_180732 ) ) ( not ( = ?auto_180733 ?auto_180728 ) ) ( not ( = ?auto_180733 ?auto_180729 ) ) ( not ( = ?auto_180733 ?auto_180730 ) ) ( not ( = ?auto_180733 ?auto_180726 ) ) ( not ( = ?auto_180732 ?auto_180728 ) ) ( not ( = ?auto_180732 ?auto_180729 ) ) ( not ( = ?auto_180732 ?auto_180730 ) ) ( not ( = ?auto_180732 ?auto_180726 ) ) ( not ( = ?auto_180728 ?auto_180729 ) ) ( not ( = ?auto_180728 ?auto_180730 ) ) ( not ( = ?auto_180728 ?auto_180726 ) ) ( not ( = ?auto_180729 ?auto_180730 ) ) ( not ( = ?auto_180729 ?auto_180726 ) ) ( ON ?auto_180726 ?auto_180734 ) ( not ( = ?auto_180726 ?auto_180734 ) ) ( not ( = ?auto_180730 ?auto_180734 ) ) ( not ( = ?auto_180731 ?auto_180734 ) ) ( not ( = ?auto_180727 ?auto_180734 ) ) ( not ( = ?auto_180733 ?auto_180734 ) ) ( not ( = ?auto_180732 ?auto_180734 ) ) ( not ( = ?auto_180728 ?auto_180734 ) ) ( not ( = ?auto_180729 ?auto_180734 ) ) ( ON ?auto_180730 ?auto_180726 ) ( ON-TABLE ?auto_180734 ) ( ON ?auto_180729 ?auto_180730 ) ( ON ?auto_180728 ?auto_180729 ) ( ON ?auto_180732 ?auto_180728 ) ( ON ?auto_180733 ?auto_180732 ) ( CLEAR ?auto_180731 ) ( ON ?auto_180727 ?auto_180733 ) ( CLEAR ?auto_180727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180734 ?auto_180726 ?auto_180730 ?auto_180729 ?auto_180728 ?auto_180732 ?auto_180733 )
      ( MAKE-1PILE ?auto_180726 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180735 - BLOCK
    )
    :vars
    (
      ?auto_180743 - BLOCK
      ?auto_180742 - BLOCK
      ?auto_180741 - BLOCK
      ?auto_180739 - BLOCK
      ?auto_180738 - BLOCK
      ?auto_180737 - BLOCK
      ?auto_180740 - BLOCK
      ?auto_180736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180735 ?auto_180743 ) ) ( not ( = ?auto_180742 ?auto_180741 ) ) ( not ( = ?auto_180742 ?auto_180739 ) ) ( not ( = ?auto_180742 ?auto_180738 ) ) ( not ( = ?auto_180742 ?auto_180737 ) ) ( not ( = ?auto_180742 ?auto_180740 ) ) ( not ( = ?auto_180742 ?auto_180743 ) ) ( not ( = ?auto_180742 ?auto_180735 ) ) ( not ( = ?auto_180741 ?auto_180739 ) ) ( not ( = ?auto_180741 ?auto_180738 ) ) ( not ( = ?auto_180741 ?auto_180737 ) ) ( not ( = ?auto_180741 ?auto_180740 ) ) ( not ( = ?auto_180741 ?auto_180743 ) ) ( not ( = ?auto_180741 ?auto_180735 ) ) ( not ( = ?auto_180739 ?auto_180738 ) ) ( not ( = ?auto_180739 ?auto_180737 ) ) ( not ( = ?auto_180739 ?auto_180740 ) ) ( not ( = ?auto_180739 ?auto_180743 ) ) ( not ( = ?auto_180739 ?auto_180735 ) ) ( not ( = ?auto_180738 ?auto_180737 ) ) ( not ( = ?auto_180738 ?auto_180740 ) ) ( not ( = ?auto_180738 ?auto_180743 ) ) ( not ( = ?auto_180738 ?auto_180735 ) ) ( not ( = ?auto_180737 ?auto_180740 ) ) ( not ( = ?auto_180737 ?auto_180743 ) ) ( not ( = ?auto_180737 ?auto_180735 ) ) ( not ( = ?auto_180740 ?auto_180743 ) ) ( not ( = ?auto_180740 ?auto_180735 ) ) ( ON ?auto_180735 ?auto_180736 ) ( not ( = ?auto_180735 ?auto_180736 ) ) ( not ( = ?auto_180743 ?auto_180736 ) ) ( not ( = ?auto_180742 ?auto_180736 ) ) ( not ( = ?auto_180741 ?auto_180736 ) ) ( not ( = ?auto_180739 ?auto_180736 ) ) ( not ( = ?auto_180738 ?auto_180736 ) ) ( not ( = ?auto_180737 ?auto_180736 ) ) ( not ( = ?auto_180740 ?auto_180736 ) ) ( ON ?auto_180743 ?auto_180735 ) ( ON-TABLE ?auto_180736 ) ( ON ?auto_180740 ?auto_180743 ) ( ON ?auto_180737 ?auto_180740 ) ( ON ?auto_180738 ?auto_180737 ) ( ON ?auto_180739 ?auto_180738 ) ( ON ?auto_180741 ?auto_180739 ) ( CLEAR ?auto_180741 ) ( HOLDING ?auto_180742 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180742 )
      ( MAKE-1PILE ?auto_180735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180744 - BLOCK
    )
    :vars
    (
      ?auto_180752 - BLOCK
      ?auto_180746 - BLOCK
      ?auto_180748 - BLOCK
      ?auto_180749 - BLOCK
      ?auto_180747 - BLOCK
      ?auto_180745 - BLOCK
      ?auto_180750 - BLOCK
      ?auto_180751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180744 ?auto_180752 ) ) ( not ( = ?auto_180746 ?auto_180748 ) ) ( not ( = ?auto_180746 ?auto_180749 ) ) ( not ( = ?auto_180746 ?auto_180747 ) ) ( not ( = ?auto_180746 ?auto_180745 ) ) ( not ( = ?auto_180746 ?auto_180750 ) ) ( not ( = ?auto_180746 ?auto_180752 ) ) ( not ( = ?auto_180746 ?auto_180744 ) ) ( not ( = ?auto_180748 ?auto_180749 ) ) ( not ( = ?auto_180748 ?auto_180747 ) ) ( not ( = ?auto_180748 ?auto_180745 ) ) ( not ( = ?auto_180748 ?auto_180750 ) ) ( not ( = ?auto_180748 ?auto_180752 ) ) ( not ( = ?auto_180748 ?auto_180744 ) ) ( not ( = ?auto_180749 ?auto_180747 ) ) ( not ( = ?auto_180749 ?auto_180745 ) ) ( not ( = ?auto_180749 ?auto_180750 ) ) ( not ( = ?auto_180749 ?auto_180752 ) ) ( not ( = ?auto_180749 ?auto_180744 ) ) ( not ( = ?auto_180747 ?auto_180745 ) ) ( not ( = ?auto_180747 ?auto_180750 ) ) ( not ( = ?auto_180747 ?auto_180752 ) ) ( not ( = ?auto_180747 ?auto_180744 ) ) ( not ( = ?auto_180745 ?auto_180750 ) ) ( not ( = ?auto_180745 ?auto_180752 ) ) ( not ( = ?auto_180745 ?auto_180744 ) ) ( not ( = ?auto_180750 ?auto_180752 ) ) ( not ( = ?auto_180750 ?auto_180744 ) ) ( ON ?auto_180744 ?auto_180751 ) ( not ( = ?auto_180744 ?auto_180751 ) ) ( not ( = ?auto_180752 ?auto_180751 ) ) ( not ( = ?auto_180746 ?auto_180751 ) ) ( not ( = ?auto_180748 ?auto_180751 ) ) ( not ( = ?auto_180749 ?auto_180751 ) ) ( not ( = ?auto_180747 ?auto_180751 ) ) ( not ( = ?auto_180745 ?auto_180751 ) ) ( not ( = ?auto_180750 ?auto_180751 ) ) ( ON ?auto_180752 ?auto_180744 ) ( ON-TABLE ?auto_180751 ) ( ON ?auto_180750 ?auto_180752 ) ( ON ?auto_180745 ?auto_180750 ) ( ON ?auto_180747 ?auto_180745 ) ( ON ?auto_180749 ?auto_180747 ) ( ON ?auto_180748 ?auto_180749 ) ( ON ?auto_180746 ?auto_180748 ) ( CLEAR ?auto_180746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180751 ?auto_180744 ?auto_180752 ?auto_180750 ?auto_180745 ?auto_180747 ?auto_180749 ?auto_180748 )
      ( MAKE-1PILE ?auto_180744 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180759 - BLOCK
      ?auto_180760 - BLOCK
      ?auto_180761 - BLOCK
      ?auto_180762 - BLOCK
      ?auto_180763 - BLOCK
      ?auto_180764 - BLOCK
    )
    :vars
    (
      ?auto_180765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180765 ?auto_180764 ) ( CLEAR ?auto_180765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180759 ) ( ON ?auto_180760 ?auto_180759 ) ( ON ?auto_180761 ?auto_180760 ) ( ON ?auto_180762 ?auto_180761 ) ( ON ?auto_180763 ?auto_180762 ) ( ON ?auto_180764 ?auto_180763 ) ( not ( = ?auto_180759 ?auto_180760 ) ) ( not ( = ?auto_180759 ?auto_180761 ) ) ( not ( = ?auto_180759 ?auto_180762 ) ) ( not ( = ?auto_180759 ?auto_180763 ) ) ( not ( = ?auto_180759 ?auto_180764 ) ) ( not ( = ?auto_180759 ?auto_180765 ) ) ( not ( = ?auto_180760 ?auto_180761 ) ) ( not ( = ?auto_180760 ?auto_180762 ) ) ( not ( = ?auto_180760 ?auto_180763 ) ) ( not ( = ?auto_180760 ?auto_180764 ) ) ( not ( = ?auto_180760 ?auto_180765 ) ) ( not ( = ?auto_180761 ?auto_180762 ) ) ( not ( = ?auto_180761 ?auto_180763 ) ) ( not ( = ?auto_180761 ?auto_180764 ) ) ( not ( = ?auto_180761 ?auto_180765 ) ) ( not ( = ?auto_180762 ?auto_180763 ) ) ( not ( = ?auto_180762 ?auto_180764 ) ) ( not ( = ?auto_180762 ?auto_180765 ) ) ( not ( = ?auto_180763 ?auto_180764 ) ) ( not ( = ?auto_180763 ?auto_180765 ) ) ( not ( = ?auto_180764 ?auto_180765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180765 ?auto_180764 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180766 - BLOCK
      ?auto_180767 - BLOCK
      ?auto_180768 - BLOCK
      ?auto_180769 - BLOCK
      ?auto_180770 - BLOCK
      ?auto_180771 - BLOCK
    )
    :vars
    (
      ?auto_180772 - BLOCK
      ?auto_180773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180772 ?auto_180771 ) ( CLEAR ?auto_180772 ) ( ON-TABLE ?auto_180766 ) ( ON ?auto_180767 ?auto_180766 ) ( ON ?auto_180768 ?auto_180767 ) ( ON ?auto_180769 ?auto_180768 ) ( ON ?auto_180770 ?auto_180769 ) ( ON ?auto_180771 ?auto_180770 ) ( not ( = ?auto_180766 ?auto_180767 ) ) ( not ( = ?auto_180766 ?auto_180768 ) ) ( not ( = ?auto_180766 ?auto_180769 ) ) ( not ( = ?auto_180766 ?auto_180770 ) ) ( not ( = ?auto_180766 ?auto_180771 ) ) ( not ( = ?auto_180766 ?auto_180772 ) ) ( not ( = ?auto_180767 ?auto_180768 ) ) ( not ( = ?auto_180767 ?auto_180769 ) ) ( not ( = ?auto_180767 ?auto_180770 ) ) ( not ( = ?auto_180767 ?auto_180771 ) ) ( not ( = ?auto_180767 ?auto_180772 ) ) ( not ( = ?auto_180768 ?auto_180769 ) ) ( not ( = ?auto_180768 ?auto_180770 ) ) ( not ( = ?auto_180768 ?auto_180771 ) ) ( not ( = ?auto_180768 ?auto_180772 ) ) ( not ( = ?auto_180769 ?auto_180770 ) ) ( not ( = ?auto_180769 ?auto_180771 ) ) ( not ( = ?auto_180769 ?auto_180772 ) ) ( not ( = ?auto_180770 ?auto_180771 ) ) ( not ( = ?auto_180770 ?auto_180772 ) ) ( not ( = ?auto_180771 ?auto_180772 ) ) ( HOLDING ?auto_180773 ) ( not ( = ?auto_180766 ?auto_180773 ) ) ( not ( = ?auto_180767 ?auto_180773 ) ) ( not ( = ?auto_180768 ?auto_180773 ) ) ( not ( = ?auto_180769 ?auto_180773 ) ) ( not ( = ?auto_180770 ?auto_180773 ) ) ( not ( = ?auto_180771 ?auto_180773 ) ) ( not ( = ?auto_180772 ?auto_180773 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_180773 )
      ( MAKE-6PILE ?auto_180766 ?auto_180767 ?auto_180768 ?auto_180769 ?auto_180770 ?auto_180771 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180774 - BLOCK
      ?auto_180775 - BLOCK
      ?auto_180776 - BLOCK
      ?auto_180777 - BLOCK
      ?auto_180778 - BLOCK
      ?auto_180779 - BLOCK
    )
    :vars
    (
      ?auto_180781 - BLOCK
      ?auto_180780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180781 ?auto_180779 ) ( ON-TABLE ?auto_180774 ) ( ON ?auto_180775 ?auto_180774 ) ( ON ?auto_180776 ?auto_180775 ) ( ON ?auto_180777 ?auto_180776 ) ( ON ?auto_180778 ?auto_180777 ) ( ON ?auto_180779 ?auto_180778 ) ( not ( = ?auto_180774 ?auto_180775 ) ) ( not ( = ?auto_180774 ?auto_180776 ) ) ( not ( = ?auto_180774 ?auto_180777 ) ) ( not ( = ?auto_180774 ?auto_180778 ) ) ( not ( = ?auto_180774 ?auto_180779 ) ) ( not ( = ?auto_180774 ?auto_180781 ) ) ( not ( = ?auto_180775 ?auto_180776 ) ) ( not ( = ?auto_180775 ?auto_180777 ) ) ( not ( = ?auto_180775 ?auto_180778 ) ) ( not ( = ?auto_180775 ?auto_180779 ) ) ( not ( = ?auto_180775 ?auto_180781 ) ) ( not ( = ?auto_180776 ?auto_180777 ) ) ( not ( = ?auto_180776 ?auto_180778 ) ) ( not ( = ?auto_180776 ?auto_180779 ) ) ( not ( = ?auto_180776 ?auto_180781 ) ) ( not ( = ?auto_180777 ?auto_180778 ) ) ( not ( = ?auto_180777 ?auto_180779 ) ) ( not ( = ?auto_180777 ?auto_180781 ) ) ( not ( = ?auto_180778 ?auto_180779 ) ) ( not ( = ?auto_180778 ?auto_180781 ) ) ( not ( = ?auto_180779 ?auto_180781 ) ) ( not ( = ?auto_180774 ?auto_180780 ) ) ( not ( = ?auto_180775 ?auto_180780 ) ) ( not ( = ?auto_180776 ?auto_180780 ) ) ( not ( = ?auto_180777 ?auto_180780 ) ) ( not ( = ?auto_180778 ?auto_180780 ) ) ( not ( = ?auto_180779 ?auto_180780 ) ) ( not ( = ?auto_180781 ?auto_180780 ) ) ( ON ?auto_180780 ?auto_180781 ) ( CLEAR ?auto_180780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180774 ?auto_180775 ?auto_180776 ?auto_180777 ?auto_180778 ?auto_180779 ?auto_180781 )
      ( MAKE-6PILE ?auto_180774 ?auto_180775 ?auto_180776 ?auto_180777 ?auto_180778 ?auto_180779 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180782 - BLOCK
      ?auto_180783 - BLOCK
      ?auto_180784 - BLOCK
      ?auto_180785 - BLOCK
      ?auto_180786 - BLOCK
      ?auto_180787 - BLOCK
    )
    :vars
    (
      ?auto_180789 - BLOCK
      ?auto_180788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180789 ?auto_180787 ) ( ON-TABLE ?auto_180782 ) ( ON ?auto_180783 ?auto_180782 ) ( ON ?auto_180784 ?auto_180783 ) ( ON ?auto_180785 ?auto_180784 ) ( ON ?auto_180786 ?auto_180785 ) ( ON ?auto_180787 ?auto_180786 ) ( not ( = ?auto_180782 ?auto_180783 ) ) ( not ( = ?auto_180782 ?auto_180784 ) ) ( not ( = ?auto_180782 ?auto_180785 ) ) ( not ( = ?auto_180782 ?auto_180786 ) ) ( not ( = ?auto_180782 ?auto_180787 ) ) ( not ( = ?auto_180782 ?auto_180789 ) ) ( not ( = ?auto_180783 ?auto_180784 ) ) ( not ( = ?auto_180783 ?auto_180785 ) ) ( not ( = ?auto_180783 ?auto_180786 ) ) ( not ( = ?auto_180783 ?auto_180787 ) ) ( not ( = ?auto_180783 ?auto_180789 ) ) ( not ( = ?auto_180784 ?auto_180785 ) ) ( not ( = ?auto_180784 ?auto_180786 ) ) ( not ( = ?auto_180784 ?auto_180787 ) ) ( not ( = ?auto_180784 ?auto_180789 ) ) ( not ( = ?auto_180785 ?auto_180786 ) ) ( not ( = ?auto_180785 ?auto_180787 ) ) ( not ( = ?auto_180785 ?auto_180789 ) ) ( not ( = ?auto_180786 ?auto_180787 ) ) ( not ( = ?auto_180786 ?auto_180789 ) ) ( not ( = ?auto_180787 ?auto_180789 ) ) ( not ( = ?auto_180782 ?auto_180788 ) ) ( not ( = ?auto_180783 ?auto_180788 ) ) ( not ( = ?auto_180784 ?auto_180788 ) ) ( not ( = ?auto_180785 ?auto_180788 ) ) ( not ( = ?auto_180786 ?auto_180788 ) ) ( not ( = ?auto_180787 ?auto_180788 ) ) ( not ( = ?auto_180789 ?auto_180788 ) ) ( HOLDING ?auto_180788 ) ( CLEAR ?auto_180789 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180782 ?auto_180783 ?auto_180784 ?auto_180785 ?auto_180786 ?auto_180787 ?auto_180789 ?auto_180788 )
      ( MAKE-6PILE ?auto_180782 ?auto_180783 ?auto_180784 ?auto_180785 ?auto_180786 ?auto_180787 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180790 - BLOCK
      ?auto_180791 - BLOCK
      ?auto_180792 - BLOCK
      ?auto_180793 - BLOCK
      ?auto_180794 - BLOCK
      ?auto_180795 - BLOCK
    )
    :vars
    (
      ?auto_180796 - BLOCK
      ?auto_180797 - BLOCK
      ?auto_180798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180796 ?auto_180795 ) ( ON-TABLE ?auto_180790 ) ( ON ?auto_180791 ?auto_180790 ) ( ON ?auto_180792 ?auto_180791 ) ( ON ?auto_180793 ?auto_180792 ) ( ON ?auto_180794 ?auto_180793 ) ( ON ?auto_180795 ?auto_180794 ) ( not ( = ?auto_180790 ?auto_180791 ) ) ( not ( = ?auto_180790 ?auto_180792 ) ) ( not ( = ?auto_180790 ?auto_180793 ) ) ( not ( = ?auto_180790 ?auto_180794 ) ) ( not ( = ?auto_180790 ?auto_180795 ) ) ( not ( = ?auto_180790 ?auto_180796 ) ) ( not ( = ?auto_180791 ?auto_180792 ) ) ( not ( = ?auto_180791 ?auto_180793 ) ) ( not ( = ?auto_180791 ?auto_180794 ) ) ( not ( = ?auto_180791 ?auto_180795 ) ) ( not ( = ?auto_180791 ?auto_180796 ) ) ( not ( = ?auto_180792 ?auto_180793 ) ) ( not ( = ?auto_180792 ?auto_180794 ) ) ( not ( = ?auto_180792 ?auto_180795 ) ) ( not ( = ?auto_180792 ?auto_180796 ) ) ( not ( = ?auto_180793 ?auto_180794 ) ) ( not ( = ?auto_180793 ?auto_180795 ) ) ( not ( = ?auto_180793 ?auto_180796 ) ) ( not ( = ?auto_180794 ?auto_180795 ) ) ( not ( = ?auto_180794 ?auto_180796 ) ) ( not ( = ?auto_180795 ?auto_180796 ) ) ( not ( = ?auto_180790 ?auto_180797 ) ) ( not ( = ?auto_180791 ?auto_180797 ) ) ( not ( = ?auto_180792 ?auto_180797 ) ) ( not ( = ?auto_180793 ?auto_180797 ) ) ( not ( = ?auto_180794 ?auto_180797 ) ) ( not ( = ?auto_180795 ?auto_180797 ) ) ( not ( = ?auto_180796 ?auto_180797 ) ) ( CLEAR ?auto_180796 ) ( ON ?auto_180797 ?auto_180798 ) ( CLEAR ?auto_180797 ) ( HAND-EMPTY ) ( not ( = ?auto_180790 ?auto_180798 ) ) ( not ( = ?auto_180791 ?auto_180798 ) ) ( not ( = ?auto_180792 ?auto_180798 ) ) ( not ( = ?auto_180793 ?auto_180798 ) ) ( not ( = ?auto_180794 ?auto_180798 ) ) ( not ( = ?auto_180795 ?auto_180798 ) ) ( not ( = ?auto_180796 ?auto_180798 ) ) ( not ( = ?auto_180797 ?auto_180798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180797 ?auto_180798 )
      ( MAKE-6PILE ?auto_180790 ?auto_180791 ?auto_180792 ?auto_180793 ?auto_180794 ?auto_180795 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180817 - BLOCK
      ?auto_180818 - BLOCK
      ?auto_180819 - BLOCK
      ?auto_180820 - BLOCK
      ?auto_180821 - BLOCK
      ?auto_180822 - BLOCK
    )
    :vars
    (
      ?auto_180825 - BLOCK
      ?auto_180823 - BLOCK
      ?auto_180824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180817 ) ( ON ?auto_180818 ?auto_180817 ) ( ON ?auto_180819 ?auto_180818 ) ( ON ?auto_180820 ?auto_180819 ) ( ON ?auto_180821 ?auto_180820 ) ( not ( = ?auto_180817 ?auto_180818 ) ) ( not ( = ?auto_180817 ?auto_180819 ) ) ( not ( = ?auto_180817 ?auto_180820 ) ) ( not ( = ?auto_180817 ?auto_180821 ) ) ( not ( = ?auto_180817 ?auto_180822 ) ) ( not ( = ?auto_180817 ?auto_180825 ) ) ( not ( = ?auto_180818 ?auto_180819 ) ) ( not ( = ?auto_180818 ?auto_180820 ) ) ( not ( = ?auto_180818 ?auto_180821 ) ) ( not ( = ?auto_180818 ?auto_180822 ) ) ( not ( = ?auto_180818 ?auto_180825 ) ) ( not ( = ?auto_180819 ?auto_180820 ) ) ( not ( = ?auto_180819 ?auto_180821 ) ) ( not ( = ?auto_180819 ?auto_180822 ) ) ( not ( = ?auto_180819 ?auto_180825 ) ) ( not ( = ?auto_180820 ?auto_180821 ) ) ( not ( = ?auto_180820 ?auto_180822 ) ) ( not ( = ?auto_180820 ?auto_180825 ) ) ( not ( = ?auto_180821 ?auto_180822 ) ) ( not ( = ?auto_180821 ?auto_180825 ) ) ( not ( = ?auto_180822 ?auto_180825 ) ) ( not ( = ?auto_180817 ?auto_180823 ) ) ( not ( = ?auto_180818 ?auto_180823 ) ) ( not ( = ?auto_180819 ?auto_180823 ) ) ( not ( = ?auto_180820 ?auto_180823 ) ) ( not ( = ?auto_180821 ?auto_180823 ) ) ( not ( = ?auto_180822 ?auto_180823 ) ) ( not ( = ?auto_180825 ?auto_180823 ) ) ( ON ?auto_180823 ?auto_180824 ) ( not ( = ?auto_180817 ?auto_180824 ) ) ( not ( = ?auto_180818 ?auto_180824 ) ) ( not ( = ?auto_180819 ?auto_180824 ) ) ( not ( = ?auto_180820 ?auto_180824 ) ) ( not ( = ?auto_180821 ?auto_180824 ) ) ( not ( = ?auto_180822 ?auto_180824 ) ) ( not ( = ?auto_180825 ?auto_180824 ) ) ( not ( = ?auto_180823 ?auto_180824 ) ) ( ON ?auto_180825 ?auto_180823 ) ( CLEAR ?auto_180825 ) ( HOLDING ?auto_180822 ) ( CLEAR ?auto_180821 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180817 ?auto_180818 ?auto_180819 ?auto_180820 ?auto_180821 ?auto_180822 ?auto_180825 )
      ( MAKE-6PILE ?auto_180817 ?auto_180818 ?auto_180819 ?auto_180820 ?auto_180821 ?auto_180822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180826 - BLOCK
      ?auto_180827 - BLOCK
      ?auto_180828 - BLOCK
      ?auto_180829 - BLOCK
      ?auto_180830 - BLOCK
      ?auto_180831 - BLOCK
    )
    :vars
    (
      ?auto_180834 - BLOCK
      ?auto_180833 - BLOCK
      ?auto_180832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180826 ) ( ON ?auto_180827 ?auto_180826 ) ( ON ?auto_180828 ?auto_180827 ) ( ON ?auto_180829 ?auto_180828 ) ( ON ?auto_180830 ?auto_180829 ) ( not ( = ?auto_180826 ?auto_180827 ) ) ( not ( = ?auto_180826 ?auto_180828 ) ) ( not ( = ?auto_180826 ?auto_180829 ) ) ( not ( = ?auto_180826 ?auto_180830 ) ) ( not ( = ?auto_180826 ?auto_180831 ) ) ( not ( = ?auto_180826 ?auto_180834 ) ) ( not ( = ?auto_180827 ?auto_180828 ) ) ( not ( = ?auto_180827 ?auto_180829 ) ) ( not ( = ?auto_180827 ?auto_180830 ) ) ( not ( = ?auto_180827 ?auto_180831 ) ) ( not ( = ?auto_180827 ?auto_180834 ) ) ( not ( = ?auto_180828 ?auto_180829 ) ) ( not ( = ?auto_180828 ?auto_180830 ) ) ( not ( = ?auto_180828 ?auto_180831 ) ) ( not ( = ?auto_180828 ?auto_180834 ) ) ( not ( = ?auto_180829 ?auto_180830 ) ) ( not ( = ?auto_180829 ?auto_180831 ) ) ( not ( = ?auto_180829 ?auto_180834 ) ) ( not ( = ?auto_180830 ?auto_180831 ) ) ( not ( = ?auto_180830 ?auto_180834 ) ) ( not ( = ?auto_180831 ?auto_180834 ) ) ( not ( = ?auto_180826 ?auto_180833 ) ) ( not ( = ?auto_180827 ?auto_180833 ) ) ( not ( = ?auto_180828 ?auto_180833 ) ) ( not ( = ?auto_180829 ?auto_180833 ) ) ( not ( = ?auto_180830 ?auto_180833 ) ) ( not ( = ?auto_180831 ?auto_180833 ) ) ( not ( = ?auto_180834 ?auto_180833 ) ) ( ON ?auto_180833 ?auto_180832 ) ( not ( = ?auto_180826 ?auto_180832 ) ) ( not ( = ?auto_180827 ?auto_180832 ) ) ( not ( = ?auto_180828 ?auto_180832 ) ) ( not ( = ?auto_180829 ?auto_180832 ) ) ( not ( = ?auto_180830 ?auto_180832 ) ) ( not ( = ?auto_180831 ?auto_180832 ) ) ( not ( = ?auto_180834 ?auto_180832 ) ) ( not ( = ?auto_180833 ?auto_180832 ) ) ( ON ?auto_180834 ?auto_180833 ) ( CLEAR ?auto_180830 ) ( ON ?auto_180831 ?auto_180834 ) ( CLEAR ?auto_180831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180832 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180832 ?auto_180833 ?auto_180834 )
      ( MAKE-6PILE ?auto_180826 ?auto_180827 ?auto_180828 ?auto_180829 ?auto_180830 ?auto_180831 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180835 - BLOCK
      ?auto_180836 - BLOCK
      ?auto_180837 - BLOCK
      ?auto_180838 - BLOCK
      ?auto_180839 - BLOCK
      ?auto_180840 - BLOCK
    )
    :vars
    (
      ?auto_180841 - BLOCK
      ?auto_180842 - BLOCK
      ?auto_180843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180835 ) ( ON ?auto_180836 ?auto_180835 ) ( ON ?auto_180837 ?auto_180836 ) ( ON ?auto_180838 ?auto_180837 ) ( not ( = ?auto_180835 ?auto_180836 ) ) ( not ( = ?auto_180835 ?auto_180837 ) ) ( not ( = ?auto_180835 ?auto_180838 ) ) ( not ( = ?auto_180835 ?auto_180839 ) ) ( not ( = ?auto_180835 ?auto_180840 ) ) ( not ( = ?auto_180835 ?auto_180841 ) ) ( not ( = ?auto_180836 ?auto_180837 ) ) ( not ( = ?auto_180836 ?auto_180838 ) ) ( not ( = ?auto_180836 ?auto_180839 ) ) ( not ( = ?auto_180836 ?auto_180840 ) ) ( not ( = ?auto_180836 ?auto_180841 ) ) ( not ( = ?auto_180837 ?auto_180838 ) ) ( not ( = ?auto_180837 ?auto_180839 ) ) ( not ( = ?auto_180837 ?auto_180840 ) ) ( not ( = ?auto_180837 ?auto_180841 ) ) ( not ( = ?auto_180838 ?auto_180839 ) ) ( not ( = ?auto_180838 ?auto_180840 ) ) ( not ( = ?auto_180838 ?auto_180841 ) ) ( not ( = ?auto_180839 ?auto_180840 ) ) ( not ( = ?auto_180839 ?auto_180841 ) ) ( not ( = ?auto_180840 ?auto_180841 ) ) ( not ( = ?auto_180835 ?auto_180842 ) ) ( not ( = ?auto_180836 ?auto_180842 ) ) ( not ( = ?auto_180837 ?auto_180842 ) ) ( not ( = ?auto_180838 ?auto_180842 ) ) ( not ( = ?auto_180839 ?auto_180842 ) ) ( not ( = ?auto_180840 ?auto_180842 ) ) ( not ( = ?auto_180841 ?auto_180842 ) ) ( ON ?auto_180842 ?auto_180843 ) ( not ( = ?auto_180835 ?auto_180843 ) ) ( not ( = ?auto_180836 ?auto_180843 ) ) ( not ( = ?auto_180837 ?auto_180843 ) ) ( not ( = ?auto_180838 ?auto_180843 ) ) ( not ( = ?auto_180839 ?auto_180843 ) ) ( not ( = ?auto_180840 ?auto_180843 ) ) ( not ( = ?auto_180841 ?auto_180843 ) ) ( not ( = ?auto_180842 ?auto_180843 ) ) ( ON ?auto_180841 ?auto_180842 ) ( ON ?auto_180840 ?auto_180841 ) ( CLEAR ?auto_180840 ) ( ON-TABLE ?auto_180843 ) ( HOLDING ?auto_180839 ) ( CLEAR ?auto_180838 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180835 ?auto_180836 ?auto_180837 ?auto_180838 ?auto_180839 )
      ( MAKE-6PILE ?auto_180835 ?auto_180836 ?auto_180837 ?auto_180838 ?auto_180839 ?auto_180840 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180844 - BLOCK
      ?auto_180845 - BLOCK
      ?auto_180846 - BLOCK
      ?auto_180847 - BLOCK
      ?auto_180848 - BLOCK
      ?auto_180849 - BLOCK
    )
    :vars
    (
      ?auto_180852 - BLOCK
      ?auto_180850 - BLOCK
      ?auto_180851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180844 ) ( ON ?auto_180845 ?auto_180844 ) ( ON ?auto_180846 ?auto_180845 ) ( ON ?auto_180847 ?auto_180846 ) ( not ( = ?auto_180844 ?auto_180845 ) ) ( not ( = ?auto_180844 ?auto_180846 ) ) ( not ( = ?auto_180844 ?auto_180847 ) ) ( not ( = ?auto_180844 ?auto_180848 ) ) ( not ( = ?auto_180844 ?auto_180849 ) ) ( not ( = ?auto_180844 ?auto_180852 ) ) ( not ( = ?auto_180845 ?auto_180846 ) ) ( not ( = ?auto_180845 ?auto_180847 ) ) ( not ( = ?auto_180845 ?auto_180848 ) ) ( not ( = ?auto_180845 ?auto_180849 ) ) ( not ( = ?auto_180845 ?auto_180852 ) ) ( not ( = ?auto_180846 ?auto_180847 ) ) ( not ( = ?auto_180846 ?auto_180848 ) ) ( not ( = ?auto_180846 ?auto_180849 ) ) ( not ( = ?auto_180846 ?auto_180852 ) ) ( not ( = ?auto_180847 ?auto_180848 ) ) ( not ( = ?auto_180847 ?auto_180849 ) ) ( not ( = ?auto_180847 ?auto_180852 ) ) ( not ( = ?auto_180848 ?auto_180849 ) ) ( not ( = ?auto_180848 ?auto_180852 ) ) ( not ( = ?auto_180849 ?auto_180852 ) ) ( not ( = ?auto_180844 ?auto_180850 ) ) ( not ( = ?auto_180845 ?auto_180850 ) ) ( not ( = ?auto_180846 ?auto_180850 ) ) ( not ( = ?auto_180847 ?auto_180850 ) ) ( not ( = ?auto_180848 ?auto_180850 ) ) ( not ( = ?auto_180849 ?auto_180850 ) ) ( not ( = ?auto_180852 ?auto_180850 ) ) ( ON ?auto_180850 ?auto_180851 ) ( not ( = ?auto_180844 ?auto_180851 ) ) ( not ( = ?auto_180845 ?auto_180851 ) ) ( not ( = ?auto_180846 ?auto_180851 ) ) ( not ( = ?auto_180847 ?auto_180851 ) ) ( not ( = ?auto_180848 ?auto_180851 ) ) ( not ( = ?auto_180849 ?auto_180851 ) ) ( not ( = ?auto_180852 ?auto_180851 ) ) ( not ( = ?auto_180850 ?auto_180851 ) ) ( ON ?auto_180852 ?auto_180850 ) ( ON ?auto_180849 ?auto_180852 ) ( ON-TABLE ?auto_180851 ) ( CLEAR ?auto_180847 ) ( ON ?auto_180848 ?auto_180849 ) ( CLEAR ?auto_180848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180851 ?auto_180850 ?auto_180852 ?auto_180849 )
      ( MAKE-6PILE ?auto_180844 ?auto_180845 ?auto_180846 ?auto_180847 ?auto_180848 ?auto_180849 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180853 - BLOCK
      ?auto_180854 - BLOCK
      ?auto_180855 - BLOCK
      ?auto_180856 - BLOCK
      ?auto_180857 - BLOCK
      ?auto_180858 - BLOCK
    )
    :vars
    (
      ?auto_180860 - BLOCK
      ?auto_180861 - BLOCK
      ?auto_180859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180853 ) ( ON ?auto_180854 ?auto_180853 ) ( ON ?auto_180855 ?auto_180854 ) ( not ( = ?auto_180853 ?auto_180854 ) ) ( not ( = ?auto_180853 ?auto_180855 ) ) ( not ( = ?auto_180853 ?auto_180856 ) ) ( not ( = ?auto_180853 ?auto_180857 ) ) ( not ( = ?auto_180853 ?auto_180858 ) ) ( not ( = ?auto_180853 ?auto_180860 ) ) ( not ( = ?auto_180854 ?auto_180855 ) ) ( not ( = ?auto_180854 ?auto_180856 ) ) ( not ( = ?auto_180854 ?auto_180857 ) ) ( not ( = ?auto_180854 ?auto_180858 ) ) ( not ( = ?auto_180854 ?auto_180860 ) ) ( not ( = ?auto_180855 ?auto_180856 ) ) ( not ( = ?auto_180855 ?auto_180857 ) ) ( not ( = ?auto_180855 ?auto_180858 ) ) ( not ( = ?auto_180855 ?auto_180860 ) ) ( not ( = ?auto_180856 ?auto_180857 ) ) ( not ( = ?auto_180856 ?auto_180858 ) ) ( not ( = ?auto_180856 ?auto_180860 ) ) ( not ( = ?auto_180857 ?auto_180858 ) ) ( not ( = ?auto_180857 ?auto_180860 ) ) ( not ( = ?auto_180858 ?auto_180860 ) ) ( not ( = ?auto_180853 ?auto_180861 ) ) ( not ( = ?auto_180854 ?auto_180861 ) ) ( not ( = ?auto_180855 ?auto_180861 ) ) ( not ( = ?auto_180856 ?auto_180861 ) ) ( not ( = ?auto_180857 ?auto_180861 ) ) ( not ( = ?auto_180858 ?auto_180861 ) ) ( not ( = ?auto_180860 ?auto_180861 ) ) ( ON ?auto_180861 ?auto_180859 ) ( not ( = ?auto_180853 ?auto_180859 ) ) ( not ( = ?auto_180854 ?auto_180859 ) ) ( not ( = ?auto_180855 ?auto_180859 ) ) ( not ( = ?auto_180856 ?auto_180859 ) ) ( not ( = ?auto_180857 ?auto_180859 ) ) ( not ( = ?auto_180858 ?auto_180859 ) ) ( not ( = ?auto_180860 ?auto_180859 ) ) ( not ( = ?auto_180861 ?auto_180859 ) ) ( ON ?auto_180860 ?auto_180861 ) ( ON ?auto_180858 ?auto_180860 ) ( ON-TABLE ?auto_180859 ) ( ON ?auto_180857 ?auto_180858 ) ( CLEAR ?auto_180857 ) ( HOLDING ?auto_180856 ) ( CLEAR ?auto_180855 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180853 ?auto_180854 ?auto_180855 ?auto_180856 )
      ( MAKE-6PILE ?auto_180853 ?auto_180854 ?auto_180855 ?auto_180856 ?auto_180857 ?auto_180858 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180862 - BLOCK
      ?auto_180863 - BLOCK
      ?auto_180864 - BLOCK
      ?auto_180865 - BLOCK
      ?auto_180866 - BLOCK
      ?auto_180867 - BLOCK
    )
    :vars
    (
      ?auto_180868 - BLOCK
      ?auto_180870 - BLOCK
      ?auto_180869 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180862 ) ( ON ?auto_180863 ?auto_180862 ) ( ON ?auto_180864 ?auto_180863 ) ( not ( = ?auto_180862 ?auto_180863 ) ) ( not ( = ?auto_180862 ?auto_180864 ) ) ( not ( = ?auto_180862 ?auto_180865 ) ) ( not ( = ?auto_180862 ?auto_180866 ) ) ( not ( = ?auto_180862 ?auto_180867 ) ) ( not ( = ?auto_180862 ?auto_180868 ) ) ( not ( = ?auto_180863 ?auto_180864 ) ) ( not ( = ?auto_180863 ?auto_180865 ) ) ( not ( = ?auto_180863 ?auto_180866 ) ) ( not ( = ?auto_180863 ?auto_180867 ) ) ( not ( = ?auto_180863 ?auto_180868 ) ) ( not ( = ?auto_180864 ?auto_180865 ) ) ( not ( = ?auto_180864 ?auto_180866 ) ) ( not ( = ?auto_180864 ?auto_180867 ) ) ( not ( = ?auto_180864 ?auto_180868 ) ) ( not ( = ?auto_180865 ?auto_180866 ) ) ( not ( = ?auto_180865 ?auto_180867 ) ) ( not ( = ?auto_180865 ?auto_180868 ) ) ( not ( = ?auto_180866 ?auto_180867 ) ) ( not ( = ?auto_180866 ?auto_180868 ) ) ( not ( = ?auto_180867 ?auto_180868 ) ) ( not ( = ?auto_180862 ?auto_180870 ) ) ( not ( = ?auto_180863 ?auto_180870 ) ) ( not ( = ?auto_180864 ?auto_180870 ) ) ( not ( = ?auto_180865 ?auto_180870 ) ) ( not ( = ?auto_180866 ?auto_180870 ) ) ( not ( = ?auto_180867 ?auto_180870 ) ) ( not ( = ?auto_180868 ?auto_180870 ) ) ( ON ?auto_180870 ?auto_180869 ) ( not ( = ?auto_180862 ?auto_180869 ) ) ( not ( = ?auto_180863 ?auto_180869 ) ) ( not ( = ?auto_180864 ?auto_180869 ) ) ( not ( = ?auto_180865 ?auto_180869 ) ) ( not ( = ?auto_180866 ?auto_180869 ) ) ( not ( = ?auto_180867 ?auto_180869 ) ) ( not ( = ?auto_180868 ?auto_180869 ) ) ( not ( = ?auto_180870 ?auto_180869 ) ) ( ON ?auto_180868 ?auto_180870 ) ( ON ?auto_180867 ?auto_180868 ) ( ON-TABLE ?auto_180869 ) ( ON ?auto_180866 ?auto_180867 ) ( CLEAR ?auto_180864 ) ( ON ?auto_180865 ?auto_180866 ) ( CLEAR ?auto_180865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180869 ?auto_180870 ?auto_180868 ?auto_180867 ?auto_180866 )
      ( MAKE-6PILE ?auto_180862 ?auto_180863 ?auto_180864 ?auto_180865 ?auto_180866 ?auto_180867 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180871 - BLOCK
      ?auto_180872 - BLOCK
      ?auto_180873 - BLOCK
      ?auto_180874 - BLOCK
      ?auto_180875 - BLOCK
      ?auto_180876 - BLOCK
    )
    :vars
    (
      ?auto_180879 - BLOCK
      ?auto_180877 - BLOCK
      ?auto_180878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180871 ) ( ON ?auto_180872 ?auto_180871 ) ( not ( = ?auto_180871 ?auto_180872 ) ) ( not ( = ?auto_180871 ?auto_180873 ) ) ( not ( = ?auto_180871 ?auto_180874 ) ) ( not ( = ?auto_180871 ?auto_180875 ) ) ( not ( = ?auto_180871 ?auto_180876 ) ) ( not ( = ?auto_180871 ?auto_180879 ) ) ( not ( = ?auto_180872 ?auto_180873 ) ) ( not ( = ?auto_180872 ?auto_180874 ) ) ( not ( = ?auto_180872 ?auto_180875 ) ) ( not ( = ?auto_180872 ?auto_180876 ) ) ( not ( = ?auto_180872 ?auto_180879 ) ) ( not ( = ?auto_180873 ?auto_180874 ) ) ( not ( = ?auto_180873 ?auto_180875 ) ) ( not ( = ?auto_180873 ?auto_180876 ) ) ( not ( = ?auto_180873 ?auto_180879 ) ) ( not ( = ?auto_180874 ?auto_180875 ) ) ( not ( = ?auto_180874 ?auto_180876 ) ) ( not ( = ?auto_180874 ?auto_180879 ) ) ( not ( = ?auto_180875 ?auto_180876 ) ) ( not ( = ?auto_180875 ?auto_180879 ) ) ( not ( = ?auto_180876 ?auto_180879 ) ) ( not ( = ?auto_180871 ?auto_180877 ) ) ( not ( = ?auto_180872 ?auto_180877 ) ) ( not ( = ?auto_180873 ?auto_180877 ) ) ( not ( = ?auto_180874 ?auto_180877 ) ) ( not ( = ?auto_180875 ?auto_180877 ) ) ( not ( = ?auto_180876 ?auto_180877 ) ) ( not ( = ?auto_180879 ?auto_180877 ) ) ( ON ?auto_180877 ?auto_180878 ) ( not ( = ?auto_180871 ?auto_180878 ) ) ( not ( = ?auto_180872 ?auto_180878 ) ) ( not ( = ?auto_180873 ?auto_180878 ) ) ( not ( = ?auto_180874 ?auto_180878 ) ) ( not ( = ?auto_180875 ?auto_180878 ) ) ( not ( = ?auto_180876 ?auto_180878 ) ) ( not ( = ?auto_180879 ?auto_180878 ) ) ( not ( = ?auto_180877 ?auto_180878 ) ) ( ON ?auto_180879 ?auto_180877 ) ( ON ?auto_180876 ?auto_180879 ) ( ON-TABLE ?auto_180878 ) ( ON ?auto_180875 ?auto_180876 ) ( ON ?auto_180874 ?auto_180875 ) ( CLEAR ?auto_180874 ) ( HOLDING ?auto_180873 ) ( CLEAR ?auto_180872 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180871 ?auto_180872 ?auto_180873 )
      ( MAKE-6PILE ?auto_180871 ?auto_180872 ?auto_180873 ?auto_180874 ?auto_180875 ?auto_180876 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180880 - BLOCK
      ?auto_180881 - BLOCK
      ?auto_180882 - BLOCK
      ?auto_180883 - BLOCK
      ?auto_180884 - BLOCK
      ?auto_180885 - BLOCK
    )
    :vars
    (
      ?auto_180886 - BLOCK
      ?auto_180887 - BLOCK
      ?auto_180888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180880 ) ( ON ?auto_180881 ?auto_180880 ) ( not ( = ?auto_180880 ?auto_180881 ) ) ( not ( = ?auto_180880 ?auto_180882 ) ) ( not ( = ?auto_180880 ?auto_180883 ) ) ( not ( = ?auto_180880 ?auto_180884 ) ) ( not ( = ?auto_180880 ?auto_180885 ) ) ( not ( = ?auto_180880 ?auto_180886 ) ) ( not ( = ?auto_180881 ?auto_180882 ) ) ( not ( = ?auto_180881 ?auto_180883 ) ) ( not ( = ?auto_180881 ?auto_180884 ) ) ( not ( = ?auto_180881 ?auto_180885 ) ) ( not ( = ?auto_180881 ?auto_180886 ) ) ( not ( = ?auto_180882 ?auto_180883 ) ) ( not ( = ?auto_180882 ?auto_180884 ) ) ( not ( = ?auto_180882 ?auto_180885 ) ) ( not ( = ?auto_180882 ?auto_180886 ) ) ( not ( = ?auto_180883 ?auto_180884 ) ) ( not ( = ?auto_180883 ?auto_180885 ) ) ( not ( = ?auto_180883 ?auto_180886 ) ) ( not ( = ?auto_180884 ?auto_180885 ) ) ( not ( = ?auto_180884 ?auto_180886 ) ) ( not ( = ?auto_180885 ?auto_180886 ) ) ( not ( = ?auto_180880 ?auto_180887 ) ) ( not ( = ?auto_180881 ?auto_180887 ) ) ( not ( = ?auto_180882 ?auto_180887 ) ) ( not ( = ?auto_180883 ?auto_180887 ) ) ( not ( = ?auto_180884 ?auto_180887 ) ) ( not ( = ?auto_180885 ?auto_180887 ) ) ( not ( = ?auto_180886 ?auto_180887 ) ) ( ON ?auto_180887 ?auto_180888 ) ( not ( = ?auto_180880 ?auto_180888 ) ) ( not ( = ?auto_180881 ?auto_180888 ) ) ( not ( = ?auto_180882 ?auto_180888 ) ) ( not ( = ?auto_180883 ?auto_180888 ) ) ( not ( = ?auto_180884 ?auto_180888 ) ) ( not ( = ?auto_180885 ?auto_180888 ) ) ( not ( = ?auto_180886 ?auto_180888 ) ) ( not ( = ?auto_180887 ?auto_180888 ) ) ( ON ?auto_180886 ?auto_180887 ) ( ON ?auto_180885 ?auto_180886 ) ( ON-TABLE ?auto_180888 ) ( ON ?auto_180884 ?auto_180885 ) ( ON ?auto_180883 ?auto_180884 ) ( CLEAR ?auto_180881 ) ( ON ?auto_180882 ?auto_180883 ) ( CLEAR ?auto_180882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180888 ?auto_180887 ?auto_180886 ?auto_180885 ?auto_180884 ?auto_180883 )
      ( MAKE-6PILE ?auto_180880 ?auto_180881 ?auto_180882 ?auto_180883 ?auto_180884 ?auto_180885 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180889 - BLOCK
      ?auto_180890 - BLOCK
      ?auto_180891 - BLOCK
      ?auto_180892 - BLOCK
      ?auto_180893 - BLOCK
      ?auto_180894 - BLOCK
    )
    :vars
    (
      ?auto_180896 - BLOCK
      ?auto_180897 - BLOCK
      ?auto_180895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180889 ) ( not ( = ?auto_180889 ?auto_180890 ) ) ( not ( = ?auto_180889 ?auto_180891 ) ) ( not ( = ?auto_180889 ?auto_180892 ) ) ( not ( = ?auto_180889 ?auto_180893 ) ) ( not ( = ?auto_180889 ?auto_180894 ) ) ( not ( = ?auto_180889 ?auto_180896 ) ) ( not ( = ?auto_180890 ?auto_180891 ) ) ( not ( = ?auto_180890 ?auto_180892 ) ) ( not ( = ?auto_180890 ?auto_180893 ) ) ( not ( = ?auto_180890 ?auto_180894 ) ) ( not ( = ?auto_180890 ?auto_180896 ) ) ( not ( = ?auto_180891 ?auto_180892 ) ) ( not ( = ?auto_180891 ?auto_180893 ) ) ( not ( = ?auto_180891 ?auto_180894 ) ) ( not ( = ?auto_180891 ?auto_180896 ) ) ( not ( = ?auto_180892 ?auto_180893 ) ) ( not ( = ?auto_180892 ?auto_180894 ) ) ( not ( = ?auto_180892 ?auto_180896 ) ) ( not ( = ?auto_180893 ?auto_180894 ) ) ( not ( = ?auto_180893 ?auto_180896 ) ) ( not ( = ?auto_180894 ?auto_180896 ) ) ( not ( = ?auto_180889 ?auto_180897 ) ) ( not ( = ?auto_180890 ?auto_180897 ) ) ( not ( = ?auto_180891 ?auto_180897 ) ) ( not ( = ?auto_180892 ?auto_180897 ) ) ( not ( = ?auto_180893 ?auto_180897 ) ) ( not ( = ?auto_180894 ?auto_180897 ) ) ( not ( = ?auto_180896 ?auto_180897 ) ) ( ON ?auto_180897 ?auto_180895 ) ( not ( = ?auto_180889 ?auto_180895 ) ) ( not ( = ?auto_180890 ?auto_180895 ) ) ( not ( = ?auto_180891 ?auto_180895 ) ) ( not ( = ?auto_180892 ?auto_180895 ) ) ( not ( = ?auto_180893 ?auto_180895 ) ) ( not ( = ?auto_180894 ?auto_180895 ) ) ( not ( = ?auto_180896 ?auto_180895 ) ) ( not ( = ?auto_180897 ?auto_180895 ) ) ( ON ?auto_180896 ?auto_180897 ) ( ON ?auto_180894 ?auto_180896 ) ( ON-TABLE ?auto_180895 ) ( ON ?auto_180893 ?auto_180894 ) ( ON ?auto_180892 ?auto_180893 ) ( ON ?auto_180891 ?auto_180892 ) ( CLEAR ?auto_180891 ) ( HOLDING ?auto_180890 ) ( CLEAR ?auto_180889 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180889 ?auto_180890 )
      ( MAKE-6PILE ?auto_180889 ?auto_180890 ?auto_180891 ?auto_180892 ?auto_180893 ?auto_180894 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180898 - BLOCK
      ?auto_180899 - BLOCK
      ?auto_180900 - BLOCK
      ?auto_180901 - BLOCK
      ?auto_180902 - BLOCK
      ?auto_180903 - BLOCK
    )
    :vars
    (
      ?auto_180904 - BLOCK
      ?auto_180906 - BLOCK
      ?auto_180905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180898 ) ( not ( = ?auto_180898 ?auto_180899 ) ) ( not ( = ?auto_180898 ?auto_180900 ) ) ( not ( = ?auto_180898 ?auto_180901 ) ) ( not ( = ?auto_180898 ?auto_180902 ) ) ( not ( = ?auto_180898 ?auto_180903 ) ) ( not ( = ?auto_180898 ?auto_180904 ) ) ( not ( = ?auto_180899 ?auto_180900 ) ) ( not ( = ?auto_180899 ?auto_180901 ) ) ( not ( = ?auto_180899 ?auto_180902 ) ) ( not ( = ?auto_180899 ?auto_180903 ) ) ( not ( = ?auto_180899 ?auto_180904 ) ) ( not ( = ?auto_180900 ?auto_180901 ) ) ( not ( = ?auto_180900 ?auto_180902 ) ) ( not ( = ?auto_180900 ?auto_180903 ) ) ( not ( = ?auto_180900 ?auto_180904 ) ) ( not ( = ?auto_180901 ?auto_180902 ) ) ( not ( = ?auto_180901 ?auto_180903 ) ) ( not ( = ?auto_180901 ?auto_180904 ) ) ( not ( = ?auto_180902 ?auto_180903 ) ) ( not ( = ?auto_180902 ?auto_180904 ) ) ( not ( = ?auto_180903 ?auto_180904 ) ) ( not ( = ?auto_180898 ?auto_180906 ) ) ( not ( = ?auto_180899 ?auto_180906 ) ) ( not ( = ?auto_180900 ?auto_180906 ) ) ( not ( = ?auto_180901 ?auto_180906 ) ) ( not ( = ?auto_180902 ?auto_180906 ) ) ( not ( = ?auto_180903 ?auto_180906 ) ) ( not ( = ?auto_180904 ?auto_180906 ) ) ( ON ?auto_180906 ?auto_180905 ) ( not ( = ?auto_180898 ?auto_180905 ) ) ( not ( = ?auto_180899 ?auto_180905 ) ) ( not ( = ?auto_180900 ?auto_180905 ) ) ( not ( = ?auto_180901 ?auto_180905 ) ) ( not ( = ?auto_180902 ?auto_180905 ) ) ( not ( = ?auto_180903 ?auto_180905 ) ) ( not ( = ?auto_180904 ?auto_180905 ) ) ( not ( = ?auto_180906 ?auto_180905 ) ) ( ON ?auto_180904 ?auto_180906 ) ( ON ?auto_180903 ?auto_180904 ) ( ON-TABLE ?auto_180905 ) ( ON ?auto_180902 ?auto_180903 ) ( ON ?auto_180901 ?auto_180902 ) ( ON ?auto_180900 ?auto_180901 ) ( CLEAR ?auto_180898 ) ( ON ?auto_180899 ?auto_180900 ) ( CLEAR ?auto_180899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180905 ?auto_180906 ?auto_180904 ?auto_180903 ?auto_180902 ?auto_180901 ?auto_180900 )
      ( MAKE-6PILE ?auto_180898 ?auto_180899 ?auto_180900 ?auto_180901 ?auto_180902 ?auto_180903 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180907 - BLOCK
      ?auto_180908 - BLOCK
      ?auto_180909 - BLOCK
      ?auto_180910 - BLOCK
      ?auto_180911 - BLOCK
      ?auto_180912 - BLOCK
    )
    :vars
    (
      ?auto_180914 - BLOCK
      ?auto_180915 - BLOCK
      ?auto_180913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180907 ?auto_180908 ) ) ( not ( = ?auto_180907 ?auto_180909 ) ) ( not ( = ?auto_180907 ?auto_180910 ) ) ( not ( = ?auto_180907 ?auto_180911 ) ) ( not ( = ?auto_180907 ?auto_180912 ) ) ( not ( = ?auto_180907 ?auto_180914 ) ) ( not ( = ?auto_180908 ?auto_180909 ) ) ( not ( = ?auto_180908 ?auto_180910 ) ) ( not ( = ?auto_180908 ?auto_180911 ) ) ( not ( = ?auto_180908 ?auto_180912 ) ) ( not ( = ?auto_180908 ?auto_180914 ) ) ( not ( = ?auto_180909 ?auto_180910 ) ) ( not ( = ?auto_180909 ?auto_180911 ) ) ( not ( = ?auto_180909 ?auto_180912 ) ) ( not ( = ?auto_180909 ?auto_180914 ) ) ( not ( = ?auto_180910 ?auto_180911 ) ) ( not ( = ?auto_180910 ?auto_180912 ) ) ( not ( = ?auto_180910 ?auto_180914 ) ) ( not ( = ?auto_180911 ?auto_180912 ) ) ( not ( = ?auto_180911 ?auto_180914 ) ) ( not ( = ?auto_180912 ?auto_180914 ) ) ( not ( = ?auto_180907 ?auto_180915 ) ) ( not ( = ?auto_180908 ?auto_180915 ) ) ( not ( = ?auto_180909 ?auto_180915 ) ) ( not ( = ?auto_180910 ?auto_180915 ) ) ( not ( = ?auto_180911 ?auto_180915 ) ) ( not ( = ?auto_180912 ?auto_180915 ) ) ( not ( = ?auto_180914 ?auto_180915 ) ) ( ON ?auto_180915 ?auto_180913 ) ( not ( = ?auto_180907 ?auto_180913 ) ) ( not ( = ?auto_180908 ?auto_180913 ) ) ( not ( = ?auto_180909 ?auto_180913 ) ) ( not ( = ?auto_180910 ?auto_180913 ) ) ( not ( = ?auto_180911 ?auto_180913 ) ) ( not ( = ?auto_180912 ?auto_180913 ) ) ( not ( = ?auto_180914 ?auto_180913 ) ) ( not ( = ?auto_180915 ?auto_180913 ) ) ( ON ?auto_180914 ?auto_180915 ) ( ON ?auto_180912 ?auto_180914 ) ( ON-TABLE ?auto_180913 ) ( ON ?auto_180911 ?auto_180912 ) ( ON ?auto_180910 ?auto_180911 ) ( ON ?auto_180909 ?auto_180910 ) ( ON ?auto_180908 ?auto_180909 ) ( CLEAR ?auto_180908 ) ( HOLDING ?auto_180907 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180907 )
      ( MAKE-6PILE ?auto_180907 ?auto_180908 ?auto_180909 ?auto_180910 ?auto_180911 ?auto_180912 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180916 - BLOCK
      ?auto_180917 - BLOCK
      ?auto_180918 - BLOCK
      ?auto_180919 - BLOCK
      ?auto_180920 - BLOCK
      ?auto_180921 - BLOCK
    )
    :vars
    (
      ?auto_180924 - BLOCK
      ?auto_180923 - BLOCK
      ?auto_180922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180916 ?auto_180917 ) ) ( not ( = ?auto_180916 ?auto_180918 ) ) ( not ( = ?auto_180916 ?auto_180919 ) ) ( not ( = ?auto_180916 ?auto_180920 ) ) ( not ( = ?auto_180916 ?auto_180921 ) ) ( not ( = ?auto_180916 ?auto_180924 ) ) ( not ( = ?auto_180917 ?auto_180918 ) ) ( not ( = ?auto_180917 ?auto_180919 ) ) ( not ( = ?auto_180917 ?auto_180920 ) ) ( not ( = ?auto_180917 ?auto_180921 ) ) ( not ( = ?auto_180917 ?auto_180924 ) ) ( not ( = ?auto_180918 ?auto_180919 ) ) ( not ( = ?auto_180918 ?auto_180920 ) ) ( not ( = ?auto_180918 ?auto_180921 ) ) ( not ( = ?auto_180918 ?auto_180924 ) ) ( not ( = ?auto_180919 ?auto_180920 ) ) ( not ( = ?auto_180919 ?auto_180921 ) ) ( not ( = ?auto_180919 ?auto_180924 ) ) ( not ( = ?auto_180920 ?auto_180921 ) ) ( not ( = ?auto_180920 ?auto_180924 ) ) ( not ( = ?auto_180921 ?auto_180924 ) ) ( not ( = ?auto_180916 ?auto_180923 ) ) ( not ( = ?auto_180917 ?auto_180923 ) ) ( not ( = ?auto_180918 ?auto_180923 ) ) ( not ( = ?auto_180919 ?auto_180923 ) ) ( not ( = ?auto_180920 ?auto_180923 ) ) ( not ( = ?auto_180921 ?auto_180923 ) ) ( not ( = ?auto_180924 ?auto_180923 ) ) ( ON ?auto_180923 ?auto_180922 ) ( not ( = ?auto_180916 ?auto_180922 ) ) ( not ( = ?auto_180917 ?auto_180922 ) ) ( not ( = ?auto_180918 ?auto_180922 ) ) ( not ( = ?auto_180919 ?auto_180922 ) ) ( not ( = ?auto_180920 ?auto_180922 ) ) ( not ( = ?auto_180921 ?auto_180922 ) ) ( not ( = ?auto_180924 ?auto_180922 ) ) ( not ( = ?auto_180923 ?auto_180922 ) ) ( ON ?auto_180924 ?auto_180923 ) ( ON ?auto_180921 ?auto_180924 ) ( ON-TABLE ?auto_180922 ) ( ON ?auto_180920 ?auto_180921 ) ( ON ?auto_180919 ?auto_180920 ) ( ON ?auto_180918 ?auto_180919 ) ( ON ?auto_180917 ?auto_180918 ) ( ON ?auto_180916 ?auto_180917 ) ( CLEAR ?auto_180916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180922 ?auto_180923 ?auto_180924 ?auto_180921 ?auto_180920 ?auto_180919 ?auto_180918 ?auto_180917 )
      ( MAKE-6PILE ?auto_180916 ?auto_180917 ?auto_180918 ?auto_180919 ?auto_180920 ?auto_180921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180927 - BLOCK
      ?auto_180928 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_180928 ) ( CLEAR ?auto_180927 ) ( ON-TABLE ?auto_180927 ) ( not ( = ?auto_180927 ?auto_180928 ) ) )
    :subtasks
    ( ( !STACK ?auto_180928 ?auto_180927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180929 - BLOCK
      ?auto_180930 - BLOCK
    )
    :vars
    (
      ?auto_180931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180929 ) ( ON-TABLE ?auto_180929 ) ( not ( = ?auto_180929 ?auto_180930 ) ) ( ON ?auto_180930 ?auto_180931 ) ( CLEAR ?auto_180930 ) ( HAND-EMPTY ) ( not ( = ?auto_180929 ?auto_180931 ) ) ( not ( = ?auto_180930 ?auto_180931 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180930 ?auto_180931 )
      ( MAKE-2PILE ?auto_180929 ?auto_180930 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180932 - BLOCK
      ?auto_180933 - BLOCK
    )
    :vars
    (
      ?auto_180934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180932 ?auto_180933 ) ) ( ON ?auto_180933 ?auto_180934 ) ( CLEAR ?auto_180933 ) ( not ( = ?auto_180932 ?auto_180934 ) ) ( not ( = ?auto_180933 ?auto_180934 ) ) ( HOLDING ?auto_180932 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180932 )
      ( MAKE-2PILE ?auto_180932 ?auto_180933 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180935 - BLOCK
      ?auto_180936 - BLOCK
    )
    :vars
    (
      ?auto_180937 - BLOCK
      ?auto_180939 - BLOCK
      ?auto_180938 - BLOCK
      ?auto_180942 - BLOCK
      ?auto_180940 - BLOCK
      ?auto_180941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180935 ?auto_180936 ) ) ( ON ?auto_180936 ?auto_180937 ) ( not ( = ?auto_180935 ?auto_180937 ) ) ( not ( = ?auto_180936 ?auto_180937 ) ) ( ON ?auto_180935 ?auto_180936 ) ( CLEAR ?auto_180935 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180939 ) ( ON ?auto_180938 ?auto_180939 ) ( ON ?auto_180942 ?auto_180938 ) ( ON ?auto_180940 ?auto_180942 ) ( ON ?auto_180941 ?auto_180940 ) ( ON ?auto_180937 ?auto_180941 ) ( not ( = ?auto_180939 ?auto_180938 ) ) ( not ( = ?auto_180939 ?auto_180942 ) ) ( not ( = ?auto_180939 ?auto_180940 ) ) ( not ( = ?auto_180939 ?auto_180941 ) ) ( not ( = ?auto_180939 ?auto_180937 ) ) ( not ( = ?auto_180939 ?auto_180936 ) ) ( not ( = ?auto_180939 ?auto_180935 ) ) ( not ( = ?auto_180938 ?auto_180942 ) ) ( not ( = ?auto_180938 ?auto_180940 ) ) ( not ( = ?auto_180938 ?auto_180941 ) ) ( not ( = ?auto_180938 ?auto_180937 ) ) ( not ( = ?auto_180938 ?auto_180936 ) ) ( not ( = ?auto_180938 ?auto_180935 ) ) ( not ( = ?auto_180942 ?auto_180940 ) ) ( not ( = ?auto_180942 ?auto_180941 ) ) ( not ( = ?auto_180942 ?auto_180937 ) ) ( not ( = ?auto_180942 ?auto_180936 ) ) ( not ( = ?auto_180942 ?auto_180935 ) ) ( not ( = ?auto_180940 ?auto_180941 ) ) ( not ( = ?auto_180940 ?auto_180937 ) ) ( not ( = ?auto_180940 ?auto_180936 ) ) ( not ( = ?auto_180940 ?auto_180935 ) ) ( not ( = ?auto_180941 ?auto_180937 ) ) ( not ( = ?auto_180941 ?auto_180936 ) ) ( not ( = ?auto_180941 ?auto_180935 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180939 ?auto_180938 ?auto_180942 ?auto_180940 ?auto_180941 ?auto_180937 ?auto_180936 )
      ( MAKE-2PILE ?auto_180935 ?auto_180936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180943 - BLOCK
      ?auto_180944 - BLOCK
    )
    :vars
    (
      ?auto_180945 - BLOCK
      ?auto_180948 - BLOCK
      ?auto_180950 - BLOCK
      ?auto_180946 - BLOCK
      ?auto_180947 - BLOCK
      ?auto_180949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180943 ?auto_180944 ) ) ( ON ?auto_180944 ?auto_180945 ) ( not ( = ?auto_180943 ?auto_180945 ) ) ( not ( = ?auto_180944 ?auto_180945 ) ) ( ON-TABLE ?auto_180948 ) ( ON ?auto_180950 ?auto_180948 ) ( ON ?auto_180946 ?auto_180950 ) ( ON ?auto_180947 ?auto_180946 ) ( ON ?auto_180949 ?auto_180947 ) ( ON ?auto_180945 ?auto_180949 ) ( not ( = ?auto_180948 ?auto_180950 ) ) ( not ( = ?auto_180948 ?auto_180946 ) ) ( not ( = ?auto_180948 ?auto_180947 ) ) ( not ( = ?auto_180948 ?auto_180949 ) ) ( not ( = ?auto_180948 ?auto_180945 ) ) ( not ( = ?auto_180948 ?auto_180944 ) ) ( not ( = ?auto_180948 ?auto_180943 ) ) ( not ( = ?auto_180950 ?auto_180946 ) ) ( not ( = ?auto_180950 ?auto_180947 ) ) ( not ( = ?auto_180950 ?auto_180949 ) ) ( not ( = ?auto_180950 ?auto_180945 ) ) ( not ( = ?auto_180950 ?auto_180944 ) ) ( not ( = ?auto_180950 ?auto_180943 ) ) ( not ( = ?auto_180946 ?auto_180947 ) ) ( not ( = ?auto_180946 ?auto_180949 ) ) ( not ( = ?auto_180946 ?auto_180945 ) ) ( not ( = ?auto_180946 ?auto_180944 ) ) ( not ( = ?auto_180946 ?auto_180943 ) ) ( not ( = ?auto_180947 ?auto_180949 ) ) ( not ( = ?auto_180947 ?auto_180945 ) ) ( not ( = ?auto_180947 ?auto_180944 ) ) ( not ( = ?auto_180947 ?auto_180943 ) ) ( not ( = ?auto_180949 ?auto_180945 ) ) ( not ( = ?auto_180949 ?auto_180944 ) ) ( not ( = ?auto_180949 ?auto_180943 ) ) ( HOLDING ?auto_180943 ) ( CLEAR ?auto_180944 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180948 ?auto_180950 ?auto_180946 ?auto_180947 ?auto_180949 ?auto_180945 ?auto_180944 ?auto_180943 )
      ( MAKE-2PILE ?auto_180943 ?auto_180944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180951 - BLOCK
      ?auto_180952 - BLOCK
    )
    :vars
    (
      ?auto_180953 - BLOCK
      ?auto_180954 - BLOCK
      ?auto_180958 - BLOCK
      ?auto_180957 - BLOCK
      ?auto_180955 - BLOCK
      ?auto_180956 - BLOCK
      ?auto_180959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180951 ?auto_180952 ) ) ( ON ?auto_180952 ?auto_180953 ) ( not ( = ?auto_180951 ?auto_180953 ) ) ( not ( = ?auto_180952 ?auto_180953 ) ) ( ON-TABLE ?auto_180954 ) ( ON ?auto_180958 ?auto_180954 ) ( ON ?auto_180957 ?auto_180958 ) ( ON ?auto_180955 ?auto_180957 ) ( ON ?auto_180956 ?auto_180955 ) ( ON ?auto_180953 ?auto_180956 ) ( not ( = ?auto_180954 ?auto_180958 ) ) ( not ( = ?auto_180954 ?auto_180957 ) ) ( not ( = ?auto_180954 ?auto_180955 ) ) ( not ( = ?auto_180954 ?auto_180956 ) ) ( not ( = ?auto_180954 ?auto_180953 ) ) ( not ( = ?auto_180954 ?auto_180952 ) ) ( not ( = ?auto_180954 ?auto_180951 ) ) ( not ( = ?auto_180958 ?auto_180957 ) ) ( not ( = ?auto_180958 ?auto_180955 ) ) ( not ( = ?auto_180958 ?auto_180956 ) ) ( not ( = ?auto_180958 ?auto_180953 ) ) ( not ( = ?auto_180958 ?auto_180952 ) ) ( not ( = ?auto_180958 ?auto_180951 ) ) ( not ( = ?auto_180957 ?auto_180955 ) ) ( not ( = ?auto_180957 ?auto_180956 ) ) ( not ( = ?auto_180957 ?auto_180953 ) ) ( not ( = ?auto_180957 ?auto_180952 ) ) ( not ( = ?auto_180957 ?auto_180951 ) ) ( not ( = ?auto_180955 ?auto_180956 ) ) ( not ( = ?auto_180955 ?auto_180953 ) ) ( not ( = ?auto_180955 ?auto_180952 ) ) ( not ( = ?auto_180955 ?auto_180951 ) ) ( not ( = ?auto_180956 ?auto_180953 ) ) ( not ( = ?auto_180956 ?auto_180952 ) ) ( not ( = ?auto_180956 ?auto_180951 ) ) ( CLEAR ?auto_180952 ) ( ON ?auto_180951 ?auto_180959 ) ( CLEAR ?auto_180951 ) ( HAND-EMPTY ) ( not ( = ?auto_180951 ?auto_180959 ) ) ( not ( = ?auto_180952 ?auto_180959 ) ) ( not ( = ?auto_180953 ?auto_180959 ) ) ( not ( = ?auto_180954 ?auto_180959 ) ) ( not ( = ?auto_180958 ?auto_180959 ) ) ( not ( = ?auto_180957 ?auto_180959 ) ) ( not ( = ?auto_180955 ?auto_180959 ) ) ( not ( = ?auto_180956 ?auto_180959 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180951 ?auto_180959 )
      ( MAKE-2PILE ?auto_180951 ?auto_180952 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180960 - BLOCK
      ?auto_180961 - BLOCK
    )
    :vars
    (
      ?auto_180966 - BLOCK
      ?auto_180968 - BLOCK
      ?auto_180964 - BLOCK
      ?auto_180963 - BLOCK
      ?auto_180965 - BLOCK
      ?auto_180962 - BLOCK
      ?auto_180967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180960 ?auto_180961 ) ) ( not ( = ?auto_180960 ?auto_180966 ) ) ( not ( = ?auto_180961 ?auto_180966 ) ) ( ON-TABLE ?auto_180968 ) ( ON ?auto_180964 ?auto_180968 ) ( ON ?auto_180963 ?auto_180964 ) ( ON ?auto_180965 ?auto_180963 ) ( ON ?auto_180962 ?auto_180965 ) ( ON ?auto_180966 ?auto_180962 ) ( not ( = ?auto_180968 ?auto_180964 ) ) ( not ( = ?auto_180968 ?auto_180963 ) ) ( not ( = ?auto_180968 ?auto_180965 ) ) ( not ( = ?auto_180968 ?auto_180962 ) ) ( not ( = ?auto_180968 ?auto_180966 ) ) ( not ( = ?auto_180968 ?auto_180961 ) ) ( not ( = ?auto_180968 ?auto_180960 ) ) ( not ( = ?auto_180964 ?auto_180963 ) ) ( not ( = ?auto_180964 ?auto_180965 ) ) ( not ( = ?auto_180964 ?auto_180962 ) ) ( not ( = ?auto_180964 ?auto_180966 ) ) ( not ( = ?auto_180964 ?auto_180961 ) ) ( not ( = ?auto_180964 ?auto_180960 ) ) ( not ( = ?auto_180963 ?auto_180965 ) ) ( not ( = ?auto_180963 ?auto_180962 ) ) ( not ( = ?auto_180963 ?auto_180966 ) ) ( not ( = ?auto_180963 ?auto_180961 ) ) ( not ( = ?auto_180963 ?auto_180960 ) ) ( not ( = ?auto_180965 ?auto_180962 ) ) ( not ( = ?auto_180965 ?auto_180966 ) ) ( not ( = ?auto_180965 ?auto_180961 ) ) ( not ( = ?auto_180965 ?auto_180960 ) ) ( not ( = ?auto_180962 ?auto_180966 ) ) ( not ( = ?auto_180962 ?auto_180961 ) ) ( not ( = ?auto_180962 ?auto_180960 ) ) ( ON ?auto_180960 ?auto_180967 ) ( CLEAR ?auto_180960 ) ( not ( = ?auto_180960 ?auto_180967 ) ) ( not ( = ?auto_180961 ?auto_180967 ) ) ( not ( = ?auto_180966 ?auto_180967 ) ) ( not ( = ?auto_180968 ?auto_180967 ) ) ( not ( = ?auto_180964 ?auto_180967 ) ) ( not ( = ?auto_180963 ?auto_180967 ) ) ( not ( = ?auto_180965 ?auto_180967 ) ) ( not ( = ?auto_180962 ?auto_180967 ) ) ( HOLDING ?auto_180961 ) ( CLEAR ?auto_180966 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180968 ?auto_180964 ?auto_180963 ?auto_180965 ?auto_180962 ?auto_180966 ?auto_180961 )
      ( MAKE-2PILE ?auto_180960 ?auto_180961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180969 - BLOCK
      ?auto_180970 - BLOCK
    )
    :vars
    (
      ?auto_180975 - BLOCK
      ?auto_180977 - BLOCK
      ?auto_180973 - BLOCK
      ?auto_180971 - BLOCK
      ?auto_180972 - BLOCK
      ?auto_180974 - BLOCK
      ?auto_180976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180969 ?auto_180970 ) ) ( not ( = ?auto_180969 ?auto_180975 ) ) ( not ( = ?auto_180970 ?auto_180975 ) ) ( ON-TABLE ?auto_180977 ) ( ON ?auto_180973 ?auto_180977 ) ( ON ?auto_180971 ?auto_180973 ) ( ON ?auto_180972 ?auto_180971 ) ( ON ?auto_180974 ?auto_180972 ) ( ON ?auto_180975 ?auto_180974 ) ( not ( = ?auto_180977 ?auto_180973 ) ) ( not ( = ?auto_180977 ?auto_180971 ) ) ( not ( = ?auto_180977 ?auto_180972 ) ) ( not ( = ?auto_180977 ?auto_180974 ) ) ( not ( = ?auto_180977 ?auto_180975 ) ) ( not ( = ?auto_180977 ?auto_180970 ) ) ( not ( = ?auto_180977 ?auto_180969 ) ) ( not ( = ?auto_180973 ?auto_180971 ) ) ( not ( = ?auto_180973 ?auto_180972 ) ) ( not ( = ?auto_180973 ?auto_180974 ) ) ( not ( = ?auto_180973 ?auto_180975 ) ) ( not ( = ?auto_180973 ?auto_180970 ) ) ( not ( = ?auto_180973 ?auto_180969 ) ) ( not ( = ?auto_180971 ?auto_180972 ) ) ( not ( = ?auto_180971 ?auto_180974 ) ) ( not ( = ?auto_180971 ?auto_180975 ) ) ( not ( = ?auto_180971 ?auto_180970 ) ) ( not ( = ?auto_180971 ?auto_180969 ) ) ( not ( = ?auto_180972 ?auto_180974 ) ) ( not ( = ?auto_180972 ?auto_180975 ) ) ( not ( = ?auto_180972 ?auto_180970 ) ) ( not ( = ?auto_180972 ?auto_180969 ) ) ( not ( = ?auto_180974 ?auto_180975 ) ) ( not ( = ?auto_180974 ?auto_180970 ) ) ( not ( = ?auto_180974 ?auto_180969 ) ) ( ON ?auto_180969 ?auto_180976 ) ( not ( = ?auto_180969 ?auto_180976 ) ) ( not ( = ?auto_180970 ?auto_180976 ) ) ( not ( = ?auto_180975 ?auto_180976 ) ) ( not ( = ?auto_180977 ?auto_180976 ) ) ( not ( = ?auto_180973 ?auto_180976 ) ) ( not ( = ?auto_180971 ?auto_180976 ) ) ( not ( = ?auto_180972 ?auto_180976 ) ) ( not ( = ?auto_180974 ?auto_180976 ) ) ( CLEAR ?auto_180975 ) ( ON ?auto_180970 ?auto_180969 ) ( CLEAR ?auto_180970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180976 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180976 ?auto_180969 )
      ( MAKE-2PILE ?auto_180969 ?auto_180970 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180978 - BLOCK
      ?auto_180979 - BLOCK
    )
    :vars
    (
      ?auto_180981 - BLOCK
      ?auto_180980 - BLOCK
      ?auto_180985 - BLOCK
      ?auto_180986 - BLOCK
      ?auto_180983 - BLOCK
      ?auto_180982 - BLOCK
      ?auto_180984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180978 ?auto_180979 ) ) ( not ( = ?auto_180978 ?auto_180981 ) ) ( not ( = ?auto_180979 ?auto_180981 ) ) ( ON-TABLE ?auto_180980 ) ( ON ?auto_180985 ?auto_180980 ) ( ON ?auto_180986 ?auto_180985 ) ( ON ?auto_180983 ?auto_180986 ) ( ON ?auto_180982 ?auto_180983 ) ( not ( = ?auto_180980 ?auto_180985 ) ) ( not ( = ?auto_180980 ?auto_180986 ) ) ( not ( = ?auto_180980 ?auto_180983 ) ) ( not ( = ?auto_180980 ?auto_180982 ) ) ( not ( = ?auto_180980 ?auto_180981 ) ) ( not ( = ?auto_180980 ?auto_180979 ) ) ( not ( = ?auto_180980 ?auto_180978 ) ) ( not ( = ?auto_180985 ?auto_180986 ) ) ( not ( = ?auto_180985 ?auto_180983 ) ) ( not ( = ?auto_180985 ?auto_180982 ) ) ( not ( = ?auto_180985 ?auto_180981 ) ) ( not ( = ?auto_180985 ?auto_180979 ) ) ( not ( = ?auto_180985 ?auto_180978 ) ) ( not ( = ?auto_180986 ?auto_180983 ) ) ( not ( = ?auto_180986 ?auto_180982 ) ) ( not ( = ?auto_180986 ?auto_180981 ) ) ( not ( = ?auto_180986 ?auto_180979 ) ) ( not ( = ?auto_180986 ?auto_180978 ) ) ( not ( = ?auto_180983 ?auto_180982 ) ) ( not ( = ?auto_180983 ?auto_180981 ) ) ( not ( = ?auto_180983 ?auto_180979 ) ) ( not ( = ?auto_180983 ?auto_180978 ) ) ( not ( = ?auto_180982 ?auto_180981 ) ) ( not ( = ?auto_180982 ?auto_180979 ) ) ( not ( = ?auto_180982 ?auto_180978 ) ) ( ON ?auto_180978 ?auto_180984 ) ( not ( = ?auto_180978 ?auto_180984 ) ) ( not ( = ?auto_180979 ?auto_180984 ) ) ( not ( = ?auto_180981 ?auto_180984 ) ) ( not ( = ?auto_180980 ?auto_180984 ) ) ( not ( = ?auto_180985 ?auto_180984 ) ) ( not ( = ?auto_180986 ?auto_180984 ) ) ( not ( = ?auto_180983 ?auto_180984 ) ) ( not ( = ?auto_180982 ?auto_180984 ) ) ( ON ?auto_180979 ?auto_180978 ) ( CLEAR ?auto_180979 ) ( ON-TABLE ?auto_180984 ) ( HOLDING ?auto_180981 ) ( CLEAR ?auto_180982 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180980 ?auto_180985 ?auto_180986 ?auto_180983 ?auto_180982 ?auto_180981 )
      ( MAKE-2PILE ?auto_180978 ?auto_180979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180987 - BLOCK
      ?auto_180988 - BLOCK
    )
    :vars
    (
      ?auto_180994 - BLOCK
      ?auto_180991 - BLOCK
      ?auto_180993 - BLOCK
      ?auto_180990 - BLOCK
      ?auto_180989 - BLOCK
      ?auto_180992 - BLOCK
      ?auto_180995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180987 ?auto_180988 ) ) ( not ( = ?auto_180987 ?auto_180994 ) ) ( not ( = ?auto_180988 ?auto_180994 ) ) ( ON-TABLE ?auto_180991 ) ( ON ?auto_180993 ?auto_180991 ) ( ON ?auto_180990 ?auto_180993 ) ( ON ?auto_180989 ?auto_180990 ) ( ON ?auto_180992 ?auto_180989 ) ( not ( = ?auto_180991 ?auto_180993 ) ) ( not ( = ?auto_180991 ?auto_180990 ) ) ( not ( = ?auto_180991 ?auto_180989 ) ) ( not ( = ?auto_180991 ?auto_180992 ) ) ( not ( = ?auto_180991 ?auto_180994 ) ) ( not ( = ?auto_180991 ?auto_180988 ) ) ( not ( = ?auto_180991 ?auto_180987 ) ) ( not ( = ?auto_180993 ?auto_180990 ) ) ( not ( = ?auto_180993 ?auto_180989 ) ) ( not ( = ?auto_180993 ?auto_180992 ) ) ( not ( = ?auto_180993 ?auto_180994 ) ) ( not ( = ?auto_180993 ?auto_180988 ) ) ( not ( = ?auto_180993 ?auto_180987 ) ) ( not ( = ?auto_180990 ?auto_180989 ) ) ( not ( = ?auto_180990 ?auto_180992 ) ) ( not ( = ?auto_180990 ?auto_180994 ) ) ( not ( = ?auto_180990 ?auto_180988 ) ) ( not ( = ?auto_180990 ?auto_180987 ) ) ( not ( = ?auto_180989 ?auto_180992 ) ) ( not ( = ?auto_180989 ?auto_180994 ) ) ( not ( = ?auto_180989 ?auto_180988 ) ) ( not ( = ?auto_180989 ?auto_180987 ) ) ( not ( = ?auto_180992 ?auto_180994 ) ) ( not ( = ?auto_180992 ?auto_180988 ) ) ( not ( = ?auto_180992 ?auto_180987 ) ) ( ON ?auto_180987 ?auto_180995 ) ( not ( = ?auto_180987 ?auto_180995 ) ) ( not ( = ?auto_180988 ?auto_180995 ) ) ( not ( = ?auto_180994 ?auto_180995 ) ) ( not ( = ?auto_180991 ?auto_180995 ) ) ( not ( = ?auto_180993 ?auto_180995 ) ) ( not ( = ?auto_180990 ?auto_180995 ) ) ( not ( = ?auto_180989 ?auto_180995 ) ) ( not ( = ?auto_180992 ?auto_180995 ) ) ( ON ?auto_180988 ?auto_180987 ) ( ON-TABLE ?auto_180995 ) ( CLEAR ?auto_180992 ) ( ON ?auto_180994 ?auto_180988 ) ( CLEAR ?auto_180994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180995 ?auto_180987 ?auto_180988 )
      ( MAKE-2PILE ?auto_180987 ?auto_180988 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180996 - BLOCK
      ?auto_180997 - BLOCK
    )
    :vars
    (
      ?auto_180999 - BLOCK
      ?auto_181002 - BLOCK
      ?auto_181000 - BLOCK
      ?auto_180998 - BLOCK
      ?auto_181004 - BLOCK
      ?auto_181001 - BLOCK
      ?auto_181003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180996 ?auto_180997 ) ) ( not ( = ?auto_180996 ?auto_180999 ) ) ( not ( = ?auto_180997 ?auto_180999 ) ) ( ON-TABLE ?auto_181002 ) ( ON ?auto_181000 ?auto_181002 ) ( ON ?auto_180998 ?auto_181000 ) ( ON ?auto_181004 ?auto_180998 ) ( not ( = ?auto_181002 ?auto_181000 ) ) ( not ( = ?auto_181002 ?auto_180998 ) ) ( not ( = ?auto_181002 ?auto_181004 ) ) ( not ( = ?auto_181002 ?auto_181001 ) ) ( not ( = ?auto_181002 ?auto_180999 ) ) ( not ( = ?auto_181002 ?auto_180997 ) ) ( not ( = ?auto_181002 ?auto_180996 ) ) ( not ( = ?auto_181000 ?auto_180998 ) ) ( not ( = ?auto_181000 ?auto_181004 ) ) ( not ( = ?auto_181000 ?auto_181001 ) ) ( not ( = ?auto_181000 ?auto_180999 ) ) ( not ( = ?auto_181000 ?auto_180997 ) ) ( not ( = ?auto_181000 ?auto_180996 ) ) ( not ( = ?auto_180998 ?auto_181004 ) ) ( not ( = ?auto_180998 ?auto_181001 ) ) ( not ( = ?auto_180998 ?auto_180999 ) ) ( not ( = ?auto_180998 ?auto_180997 ) ) ( not ( = ?auto_180998 ?auto_180996 ) ) ( not ( = ?auto_181004 ?auto_181001 ) ) ( not ( = ?auto_181004 ?auto_180999 ) ) ( not ( = ?auto_181004 ?auto_180997 ) ) ( not ( = ?auto_181004 ?auto_180996 ) ) ( not ( = ?auto_181001 ?auto_180999 ) ) ( not ( = ?auto_181001 ?auto_180997 ) ) ( not ( = ?auto_181001 ?auto_180996 ) ) ( ON ?auto_180996 ?auto_181003 ) ( not ( = ?auto_180996 ?auto_181003 ) ) ( not ( = ?auto_180997 ?auto_181003 ) ) ( not ( = ?auto_180999 ?auto_181003 ) ) ( not ( = ?auto_181002 ?auto_181003 ) ) ( not ( = ?auto_181000 ?auto_181003 ) ) ( not ( = ?auto_180998 ?auto_181003 ) ) ( not ( = ?auto_181004 ?auto_181003 ) ) ( not ( = ?auto_181001 ?auto_181003 ) ) ( ON ?auto_180997 ?auto_180996 ) ( ON-TABLE ?auto_181003 ) ( ON ?auto_180999 ?auto_180997 ) ( CLEAR ?auto_180999 ) ( HOLDING ?auto_181001 ) ( CLEAR ?auto_181004 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181002 ?auto_181000 ?auto_180998 ?auto_181004 ?auto_181001 )
      ( MAKE-2PILE ?auto_180996 ?auto_180997 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181005 - BLOCK
      ?auto_181006 - BLOCK
    )
    :vars
    (
      ?auto_181007 - BLOCK
      ?auto_181009 - BLOCK
      ?auto_181013 - BLOCK
      ?auto_181010 - BLOCK
      ?auto_181008 - BLOCK
      ?auto_181011 - BLOCK
      ?auto_181012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181005 ?auto_181006 ) ) ( not ( = ?auto_181005 ?auto_181007 ) ) ( not ( = ?auto_181006 ?auto_181007 ) ) ( ON-TABLE ?auto_181009 ) ( ON ?auto_181013 ?auto_181009 ) ( ON ?auto_181010 ?auto_181013 ) ( ON ?auto_181008 ?auto_181010 ) ( not ( = ?auto_181009 ?auto_181013 ) ) ( not ( = ?auto_181009 ?auto_181010 ) ) ( not ( = ?auto_181009 ?auto_181008 ) ) ( not ( = ?auto_181009 ?auto_181011 ) ) ( not ( = ?auto_181009 ?auto_181007 ) ) ( not ( = ?auto_181009 ?auto_181006 ) ) ( not ( = ?auto_181009 ?auto_181005 ) ) ( not ( = ?auto_181013 ?auto_181010 ) ) ( not ( = ?auto_181013 ?auto_181008 ) ) ( not ( = ?auto_181013 ?auto_181011 ) ) ( not ( = ?auto_181013 ?auto_181007 ) ) ( not ( = ?auto_181013 ?auto_181006 ) ) ( not ( = ?auto_181013 ?auto_181005 ) ) ( not ( = ?auto_181010 ?auto_181008 ) ) ( not ( = ?auto_181010 ?auto_181011 ) ) ( not ( = ?auto_181010 ?auto_181007 ) ) ( not ( = ?auto_181010 ?auto_181006 ) ) ( not ( = ?auto_181010 ?auto_181005 ) ) ( not ( = ?auto_181008 ?auto_181011 ) ) ( not ( = ?auto_181008 ?auto_181007 ) ) ( not ( = ?auto_181008 ?auto_181006 ) ) ( not ( = ?auto_181008 ?auto_181005 ) ) ( not ( = ?auto_181011 ?auto_181007 ) ) ( not ( = ?auto_181011 ?auto_181006 ) ) ( not ( = ?auto_181011 ?auto_181005 ) ) ( ON ?auto_181005 ?auto_181012 ) ( not ( = ?auto_181005 ?auto_181012 ) ) ( not ( = ?auto_181006 ?auto_181012 ) ) ( not ( = ?auto_181007 ?auto_181012 ) ) ( not ( = ?auto_181009 ?auto_181012 ) ) ( not ( = ?auto_181013 ?auto_181012 ) ) ( not ( = ?auto_181010 ?auto_181012 ) ) ( not ( = ?auto_181008 ?auto_181012 ) ) ( not ( = ?auto_181011 ?auto_181012 ) ) ( ON ?auto_181006 ?auto_181005 ) ( ON-TABLE ?auto_181012 ) ( ON ?auto_181007 ?auto_181006 ) ( CLEAR ?auto_181008 ) ( ON ?auto_181011 ?auto_181007 ) ( CLEAR ?auto_181011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181012 ?auto_181005 ?auto_181006 ?auto_181007 )
      ( MAKE-2PILE ?auto_181005 ?auto_181006 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181014 - BLOCK
      ?auto_181015 - BLOCK
    )
    :vars
    (
      ?auto_181019 - BLOCK
      ?auto_181016 - BLOCK
      ?auto_181018 - BLOCK
      ?auto_181017 - BLOCK
      ?auto_181020 - BLOCK
      ?auto_181022 - BLOCK
      ?auto_181021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181014 ?auto_181015 ) ) ( not ( = ?auto_181014 ?auto_181019 ) ) ( not ( = ?auto_181015 ?auto_181019 ) ) ( ON-TABLE ?auto_181016 ) ( ON ?auto_181018 ?auto_181016 ) ( ON ?auto_181017 ?auto_181018 ) ( not ( = ?auto_181016 ?auto_181018 ) ) ( not ( = ?auto_181016 ?auto_181017 ) ) ( not ( = ?auto_181016 ?auto_181020 ) ) ( not ( = ?auto_181016 ?auto_181022 ) ) ( not ( = ?auto_181016 ?auto_181019 ) ) ( not ( = ?auto_181016 ?auto_181015 ) ) ( not ( = ?auto_181016 ?auto_181014 ) ) ( not ( = ?auto_181018 ?auto_181017 ) ) ( not ( = ?auto_181018 ?auto_181020 ) ) ( not ( = ?auto_181018 ?auto_181022 ) ) ( not ( = ?auto_181018 ?auto_181019 ) ) ( not ( = ?auto_181018 ?auto_181015 ) ) ( not ( = ?auto_181018 ?auto_181014 ) ) ( not ( = ?auto_181017 ?auto_181020 ) ) ( not ( = ?auto_181017 ?auto_181022 ) ) ( not ( = ?auto_181017 ?auto_181019 ) ) ( not ( = ?auto_181017 ?auto_181015 ) ) ( not ( = ?auto_181017 ?auto_181014 ) ) ( not ( = ?auto_181020 ?auto_181022 ) ) ( not ( = ?auto_181020 ?auto_181019 ) ) ( not ( = ?auto_181020 ?auto_181015 ) ) ( not ( = ?auto_181020 ?auto_181014 ) ) ( not ( = ?auto_181022 ?auto_181019 ) ) ( not ( = ?auto_181022 ?auto_181015 ) ) ( not ( = ?auto_181022 ?auto_181014 ) ) ( ON ?auto_181014 ?auto_181021 ) ( not ( = ?auto_181014 ?auto_181021 ) ) ( not ( = ?auto_181015 ?auto_181021 ) ) ( not ( = ?auto_181019 ?auto_181021 ) ) ( not ( = ?auto_181016 ?auto_181021 ) ) ( not ( = ?auto_181018 ?auto_181021 ) ) ( not ( = ?auto_181017 ?auto_181021 ) ) ( not ( = ?auto_181020 ?auto_181021 ) ) ( not ( = ?auto_181022 ?auto_181021 ) ) ( ON ?auto_181015 ?auto_181014 ) ( ON-TABLE ?auto_181021 ) ( ON ?auto_181019 ?auto_181015 ) ( ON ?auto_181022 ?auto_181019 ) ( CLEAR ?auto_181022 ) ( HOLDING ?auto_181020 ) ( CLEAR ?auto_181017 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181016 ?auto_181018 ?auto_181017 ?auto_181020 )
      ( MAKE-2PILE ?auto_181014 ?auto_181015 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181023 - BLOCK
      ?auto_181024 - BLOCK
    )
    :vars
    (
      ?auto_181030 - BLOCK
      ?auto_181027 - BLOCK
      ?auto_181029 - BLOCK
      ?auto_181025 - BLOCK
      ?auto_181026 - BLOCK
      ?auto_181031 - BLOCK
      ?auto_181028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181023 ?auto_181024 ) ) ( not ( = ?auto_181023 ?auto_181030 ) ) ( not ( = ?auto_181024 ?auto_181030 ) ) ( ON-TABLE ?auto_181027 ) ( ON ?auto_181029 ?auto_181027 ) ( ON ?auto_181025 ?auto_181029 ) ( not ( = ?auto_181027 ?auto_181029 ) ) ( not ( = ?auto_181027 ?auto_181025 ) ) ( not ( = ?auto_181027 ?auto_181026 ) ) ( not ( = ?auto_181027 ?auto_181031 ) ) ( not ( = ?auto_181027 ?auto_181030 ) ) ( not ( = ?auto_181027 ?auto_181024 ) ) ( not ( = ?auto_181027 ?auto_181023 ) ) ( not ( = ?auto_181029 ?auto_181025 ) ) ( not ( = ?auto_181029 ?auto_181026 ) ) ( not ( = ?auto_181029 ?auto_181031 ) ) ( not ( = ?auto_181029 ?auto_181030 ) ) ( not ( = ?auto_181029 ?auto_181024 ) ) ( not ( = ?auto_181029 ?auto_181023 ) ) ( not ( = ?auto_181025 ?auto_181026 ) ) ( not ( = ?auto_181025 ?auto_181031 ) ) ( not ( = ?auto_181025 ?auto_181030 ) ) ( not ( = ?auto_181025 ?auto_181024 ) ) ( not ( = ?auto_181025 ?auto_181023 ) ) ( not ( = ?auto_181026 ?auto_181031 ) ) ( not ( = ?auto_181026 ?auto_181030 ) ) ( not ( = ?auto_181026 ?auto_181024 ) ) ( not ( = ?auto_181026 ?auto_181023 ) ) ( not ( = ?auto_181031 ?auto_181030 ) ) ( not ( = ?auto_181031 ?auto_181024 ) ) ( not ( = ?auto_181031 ?auto_181023 ) ) ( ON ?auto_181023 ?auto_181028 ) ( not ( = ?auto_181023 ?auto_181028 ) ) ( not ( = ?auto_181024 ?auto_181028 ) ) ( not ( = ?auto_181030 ?auto_181028 ) ) ( not ( = ?auto_181027 ?auto_181028 ) ) ( not ( = ?auto_181029 ?auto_181028 ) ) ( not ( = ?auto_181025 ?auto_181028 ) ) ( not ( = ?auto_181026 ?auto_181028 ) ) ( not ( = ?auto_181031 ?auto_181028 ) ) ( ON ?auto_181024 ?auto_181023 ) ( ON-TABLE ?auto_181028 ) ( ON ?auto_181030 ?auto_181024 ) ( ON ?auto_181031 ?auto_181030 ) ( CLEAR ?auto_181025 ) ( ON ?auto_181026 ?auto_181031 ) ( CLEAR ?auto_181026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181028 ?auto_181023 ?auto_181024 ?auto_181030 ?auto_181031 )
      ( MAKE-2PILE ?auto_181023 ?auto_181024 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181032 - BLOCK
      ?auto_181033 - BLOCK
    )
    :vars
    (
      ?auto_181036 - BLOCK
      ?auto_181035 - BLOCK
      ?auto_181037 - BLOCK
      ?auto_181034 - BLOCK
      ?auto_181039 - BLOCK
      ?auto_181038 - BLOCK
      ?auto_181040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181032 ?auto_181033 ) ) ( not ( = ?auto_181032 ?auto_181036 ) ) ( not ( = ?auto_181033 ?auto_181036 ) ) ( ON-TABLE ?auto_181035 ) ( ON ?auto_181037 ?auto_181035 ) ( not ( = ?auto_181035 ?auto_181037 ) ) ( not ( = ?auto_181035 ?auto_181034 ) ) ( not ( = ?auto_181035 ?auto_181039 ) ) ( not ( = ?auto_181035 ?auto_181038 ) ) ( not ( = ?auto_181035 ?auto_181036 ) ) ( not ( = ?auto_181035 ?auto_181033 ) ) ( not ( = ?auto_181035 ?auto_181032 ) ) ( not ( = ?auto_181037 ?auto_181034 ) ) ( not ( = ?auto_181037 ?auto_181039 ) ) ( not ( = ?auto_181037 ?auto_181038 ) ) ( not ( = ?auto_181037 ?auto_181036 ) ) ( not ( = ?auto_181037 ?auto_181033 ) ) ( not ( = ?auto_181037 ?auto_181032 ) ) ( not ( = ?auto_181034 ?auto_181039 ) ) ( not ( = ?auto_181034 ?auto_181038 ) ) ( not ( = ?auto_181034 ?auto_181036 ) ) ( not ( = ?auto_181034 ?auto_181033 ) ) ( not ( = ?auto_181034 ?auto_181032 ) ) ( not ( = ?auto_181039 ?auto_181038 ) ) ( not ( = ?auto_181039 ?auto_181036 ) ) ( not ( = ?auto_181039 ?auto_181033 ) ) ( not ( = ?auto_181039 ?auto_181032 ) ) ( not ( = ?auto_181038 ?auto_181036 ) ) ( not ( = ?auto_181038 ?auto_181033 ) ) ( not ( = ?auto_181038 ?auto_181032 ) ) ( ON ?auto_181032 ?auto_181040 ) ( not ( = ?auto_181032 ?auto_181040 ) ) ( not ( = ?auto_181033 ?auto_181040 ) ) ( not ( = ?auto_181036 ?auto_181040 ) ) ( not ( = ?auto_181035 ?auto_181040 ) ) ( not ( = ?auto_181037 ?auto_181040 ) ) ( not ( = ?auto_181034 ?auto_181040 ) ) ( not ( = ?auto_181039 ?auto_181040 ) ) ( not ( = ?auto_181038 ?auto_181040 ) ) ( ON ?auto_181033 ?auto_181032 ) ( ON-TABLE ?auto_181040 ) ( ON ?auto_181036 ?auto_181033 ) ( ON ?auto_181038 ?auto_181036 ) ( ON ?auto_181039 ?auto_181038 ) ( CLEAR ?auto_181039 ) ( HOLDING ?auto_181034 ) ( CLEAR ?auto_181037 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181035 ?auto_181037 ?auto_181034 )
      ( MAKE-2PILE ?auto_181032 ?auto_181033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181041 - BLOCK
      ?auto_181042 - BLOCK
    )
    :vars
    (
      ?auto_181044 - BLOCK
      ?auto_181046 - BLOCK
      ?auto_181048 - BLOCK
      ?auto_181049 - BLOCK
      ?auto_181043 - BLOCK
      ?auto_181047 - BLOCK
      ?auto_181045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181041 ?auto_181042 ) ) ( not ( = ?auto_181041 ?auto_181044 ) ) ( not ( = ?auto_181042 ?auto_181044 ) ) ( ON-TABLE ?auto_181046 ) ( ON ?auto_181048 ?auto_181046 ) ( not ( = ?auto_181046 ?auto_181048 ) ) ( not ( = ?auto_181046 ?auto_181049 ) ) ( not ( = ?auto_181046 ?auto_181043 ) ) ( not ( = ?auto_181046 ?auto_181047 ) ) ( not ( = ?auto_181046 ?auto_181044 ) ) ( not ( = ?auto_181046 ?auto_181042 ) ) ( not ( = ?auto_181046 ?auto_181041 ) ) ( not ( = ?auto_181048 ?auto_181049 ) ) ( not ( = ?auto_181048 ?auto_181043 ) ) ( not ( = ?auto_181048 ?auto_181047 ) ) ( not ( = ?auto_181048 ?auto_181044 ) ) ( not ( = ?auto_181048 ?auto_181042 ) ) ( not ( = ?auto_181048 ?auto_181041 ) ) ( not ( = ?auto_181049 ?auto_181043 ) ) ( not ( = ?auto_181049 ?auto_181047 ) ) ( not ( = ?auto_181049 ?auto_181044 ) ) ( not ( = ?auto_181049 ?auto_181042 ) ) ( not ( = ?auto_181049 ?auto_181041 ) ) ( not ( = ?auto_181043 ?auto_181047 ) ) ( not ( = ?auto_181043 ?auto_181044 ) ) ( not ( = ?auto_181043 ?auto_181042 ) ) ( not ( = ?auto_181043 ?auto_181041 ) ) ( not ( = ?auto_181047 ?auto_181044 ) ) ( not ( = ?auto_181047 ?auto_181042 ) ) ( not ( = ?auto_181047 ?auto_181041 ) ) ( ON ?auto_181041 ?auto_181045 ) ( not ( = ?auto_181041 ?auto_181045 ) ) ( not ( = ?auto_181042 ?auto_181045 ) ) ( not ( = ?auto_181044 ?auto_181045 ) ) ( not ( = ?auto_181046 ?auto_181045 ) ) ( not ( = ?auto_181048 ?auto_181045 ) ) ( not ( = ?auto_181049 ?auto_181045 ) ) ( not ( = ?auto_181043 ?auto_181045 ) ) ( not ( = ?auto_181047 ?auto_181045 ) ) ( ON ?auto_181042 ?auto_181041 ) ( ON-TABLE ?auto_181045 ) ( ON ?auto_181044 ?auto_181042 ) ( ON ?auto_181047 ?auto_181044 ) ( ON ?auto_181043 ?auto_181047 ) ( CLEAR ?auto_181048 ) ( ON ?auto_181049 ?auto_181043 ) ( CLEAR ?auto_181049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181045 ?auto_181041 ?auto_181042 ?auto_181044 ?auto_181047 ?auto_181043 )
      ( MAKE-2PILE ?auto_181041 ?auto_181042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181050 - BLOCK
      ?auto_181051 - BLOCK
    )
    :vars
    (
      ?auto_181054 - BLOCK
      ?auto_181052 - BLOCK
      ?auto_181053 - BLOCK
      ?auto_181057 - BLOCK
      ?auto_181056 - BLOCK
      ?auto_181055 - BLOCK
      ?auto_181058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181050 ?auto_181051 ) ) ( not ( = ?auto_181050 ?auto_181054 ) ) ( not ( = ?auto_181051 ?auto_181054 ) ) ( ON-TABLE ?auto_181052 ) ( not ( = ?auto_181052 ?auto_181053 ) ) ( not ( = ?auto_181052 ?auto_181057 ) ) ( not ( = ?auto_181052 ?auto_181056 ) ) ( not ( = ?auto_181052 ?auto_181055 ) ) ( not ( = ?auto_181052 ?auto_181054 ) ) ( not ( = ?auto_181052 ?auto_181051 ) ) ( not ( = ?auto_181052 ?auto_181050 ) ) ( not ( = ?auto_181053 ?auto_181057 ) ) ( not ( = ?auto_181053 ?auto_181056 ) ) ( not ( = ?auto_181053 ?auto_181055 ) ) ( not ( = ?auto_181053 ?auto_181054 ) ) ( not ( = ?auto_181053 ?auto_181051 ) ) ( not ( = ?auto_181053 ?auto_181050 ) ) ( not ( = ?auto_181057 ?auto_181056 ) ) ( not ( = ?auto_181057 ?auto_181055 ) ) ( not ( = ?auto_181057 ?auto_181054 ) ) ( not ( = ?auto_181057 ?auto_181051 ) ) ( not ( = ?auto_181057 ?auto_181050 ) ) ( not ( = ?auto_181056 ?auto_181055 ) ) ( not ( = ?auto_181056 ?auto_181054 ) ) ( not ( = ?auto_181056 ?auto_181051 ) ) ( not ( = ?auto_181056 ?auto_181050 ) ) ( not ( = ?auto_181055 ?auto_181054 ) ) ( not ( = ?auto_181055 ?auto_181051 ) ) ( not ( = ?auto_181055 ?auto_181050 ) ) ( ON ?auto_181050 ?auto_181058 ) ( not ( = ?auto_181050 ?auto_181058 ) ) ( not ( = ?auto_181051 ?auto_181058 ) ) ( not ( = ?auto_181054 ?auto_181058 ) ) ( not ( = ?auto_181052 ?auto_181058 ) ) ( not ( = ?auto_181053 ?auto_181058 ) ) ( not ( = ?auto_181057 ?auto_181058 ) ) ( not ( = ?auto_181056 ?auto_181058 ) ) ( not ( = ?auto_181055 ?auto_181058 ) ) ( ON ?auto_181051 ?auto_181050 ) ( ON-TABLE ?auto_181058 ) ( ON ?auto_181054 ?auto_181051 ) ( ON ?auto_181055 ?auto_181054 ) ( ON ?auto_181056 ?auto_181055 ) ( ON ?auto_181057 ?auto_181056 ) ( CLEAR ?auto_181057 ) ( HOLDING ?auto_181053 ) ( CLEAR ?auto_181052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181052 ?auto_181053 )
      ( MAKE-2PILE ?auto_181050 ?auto_181051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181059 - BLOCK
      ?auto_181060 - BLOCK
    )
    :vars
    (
      ?auto_181067 - BLOCK
      ?auto_181065 - BLOCK
      ?auto_181062 - BLOCK
      ?auto_181064 - BLOCK
      ?auto_181063 - BLOCK
      ?auto_181061 - BLOCK
      ?auto_181066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181059 ?auto_181060 ) ) ( not ( = ?auto_181059 ?auto_181067 ) ) ( not ( = ?auto_181060 ?auto_181067 ) ) ( ON-TABLE ?auto_181065 ) ( not ( = ?auto_181065 ?auto_181062 ) ) ( not ( = ?auto_181065 ?auto_181064 ) ) ( not ( = ?auto_181065 ?auto_181063 ) ) ( not ( = ?auto_181065 ?auto_181061 ) ) ( not ( = ?auto_181065 ?auto_181067 ) ) ( not ( = ?auto_181065 ?auto_181060 ) ) ( not ( = ?auto_181065 ?auto_181059 ) ) ( not ( = ?auto_181062 ?auto_181064 ) ) ( not ( = ?auto_181062 ?auto_181063 ) ) ( not ( = ?auto_181062 ?auto_181061 ) ) ( not ( = ?auto_181062 ?auto_181067 ) ) ( not ( = ?auto_181062 ?auto_181060 ) ) ( not ( = ?auto_181062 ?auto_181059 ) ) ( not ( = ?auto_181064 ?auto_181063 ) ) ( not ( = ?auto_181064 ?auto_181061 ) ) ( not ( = ?auto_181064 ?auto_181067 ) ) ( not ( = ?auto_181064 ?auto_181060 ) ) ( not ( = ?auto_181064 ?auto_181059 ) ) ( not ( = ?auto_181063 ?auto_181061 ) ) ( not ( = ?auto_181063 ?auto_181067 ) ) ( not ( = ?auto_181063 ?auto_181060 ) ) ( not ( = ?auto_181063 ?auto_181059 ) ) ( not ( = ?auto_181061 ?auto_181067 ) ) ( not ( = ?auto_181061 ?auto_181060 ) ) ( not ( = ?auto_181061 ?auto_181059 ) ) ( ON ?auto_181059 ?auto_181066 ) ( not ( = ?auto_181059 ?auto_181066 ) ) ( not ( = ?auto_181060 ?auto_181066 ) ) ( not ( = ?auto_181067 ?auto_181066 ) ) ( not ( = ?auto_181065 ?auto_181066 ) ) ( not ( = ?auto_181062 ?auto_181066 ) ) ( not ( = ?auto_181064 ?auto_181066 ) ) ( not ( = ?auto_181063 ?auto_181066 ) ) ( not ( = ?auto_181061 ?auto_181066 ) ) ( ON ?auto_181060 ?auto_181059 ) ( ON-TABLE ?auto_181066 ) ( ON ?auto_181067 ?auto_181060 ) ( ON ?auto_181061 ?auto_181067 ) ( ON ?auto_181063 ?auto_181061 ) ( ON ?auto_181064 ?auto_181063 ) ( CLEAR ?auto_181065 ) ( ON ?auto_181062 ?auto_181064 ) ( CLEAR ?auto_181062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181066 ?auto_181059 ?auto_181060 ?auto_181067 ?auto_181061 ?auto_181063 ?auto_181064 )
      ( MAKE-2PILE ?auto_181059 ?auto_181060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181068 - BLOCK
      ?auto_181069 - BLOCK
    )
    :vars
    (
      ?auto_181075 - BLOCK
      ?auto_181073 - BLOCK
      ?auto_181076 - BLOCK
      ?auto_181071 - BLOCK
      ?auto_181070 - BLOCK
      ?auto_181072 - BLOCK
      ?auto_181074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181068 ?auto_181069 ) ) ( not ( = ?auto_181068 ?auto_181075 ) ) ( not ( = ?auto_181069 ?auto_181075 ) ) ( not ( = ?auto_181073 ?auto_181076 ) ) ( not ( = ?auto_181073 ?auto_181071 ) ) ( not ( = ?auto_181073 ?auto_181070 ) ) ( not ( = ?auto_181073 ?auto_181072 ) ) ( not ( = ?auto_181073 ?auto_181075 ) ) ( not ( = ?auto_181073 ?auto_181069 ) ) ( not ( = ?auto_181073 ?auto_181068 ) ) ( not ( = ?auto_181076 ?auto_181071 ) ) ( not ( = ?auto_181076 ?auto_181070 ) ) ( not ( = ?auto_181076 ?auto_181072 ) ) ( not ( = ?auto_181076 ?auto_181075 ) ) ( not ( = ?auto_181076 ?auto_181069 ) ) ( not ( = ?auto_181076 ?auto_181068 ) ) ( not ( = ?auto_181071 ?auto_181070 ) ) ( not ( = ?auto_181071 ?auto_181072 ) ) ( not ( = ?auto_181071 ?auto_181075 ) ) ( not ( = ?auto_181071 ?auto_181069 ) ) ( not ( = ?auto_181071 ?auto_181068 ) ) ( not ( = ?auto_181070 ?auto_181072 ) ) ( not ( = ?auto_181070 ?auto_181075 ) ) ( not ( = ?auto_181070 ?auto_181069 ) ) ( not ( = ?auto_181070 ?auto_181068 ) ) ( not ( = ?auto_181072 ?auto_181075 ) ) ( not ( = ?auto_181072 ?auto_181069 ) ) ( not ( = ?auto_181072 ?auto_181068 ) ) ( ON ?auto_181068 ?auto_181074 ) ( not ( = ?auto_181068 ?auto_181074 ) ) ( not ( = ?auto_181069 ?auto_181074 ) ) ( not ( = ?auto_181075 ?auto_181074 ) ) ( not ( = ?auto_181073 ?auto_181074 ) ) ( not ( = ?auto_181076 ?auto_181074 ) ) ( not ( = ?auto_181071 ?auto_181074 ) ) ( not ( = ?auto_181070 ?auto_181074 ) ) ( not ( = ?auto_181072 ?auto_181074 ) ) ( ON ?auto_181069 ?auto_181068 ) ( ON-TABLE ?auto_181074 ) ( ON ?auto_181075 ?auto_181069 ) ( ON ?auto_181072 ?auto_181075 ) ( ON ?auto_181070 ?auto_181072 ) ( ON ?auto_181071 ?auto_181070 ) ( ON ?auto_181076 ?auto_181071 ) ( CLEAR ?auto_181076 ) ( HOLDING ?auto_181073 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181073 )
      ( MAKE-2PILE ?auto_181068 ?auto_181069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181077 - BLOCK
      ?auto_181078 - BLOCK
    )
    :vars
    (
      ?auto_181079 - BLOCK
      ?auto_181081 - BLOCK
      ?auto_181080 - BLOCK
      ?auto_181083 - BLOCK
      ?auto_181085 - BLOCK
      ?auto_181082 - BLOCK
      ?auto_181084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181077 ?auto_181078 ) ) ( not ( = ?auto_181077 ?auto_181079 ) ) ( not ( = ?auto_181078 ?auto_181079 ) ) ( not ( = ?auto_181081 ?auto_181080 ) ) ( not ( = ?auto_181081 ?auto_181083 ) ) ( not ( = ?auto_181081 ?auto_181085 ) ) ( not ( = ?auto_181081 ?auto_181082 ) ) ( not ( = ?auto_181081 ?auto_181079 ) ) ( not ( = ?auto_181081 ?auto_181078 ) ) ( not ( = ?auto_181081 ?auto_181077 ) ) ( not ( = ?auto_181080 ?auto_181083 ) ) ( not ( = ?auto_181080 ?auto_181085 ) ) ( not ( = ?auto_181080 ?auto_181082 ) ) ( not ( = ?auto_181080 ?auto_181079 ) ) ( not ( = ?auto_181080 ?auto_181078 ) ) ( not ( = ?auto_181080 ?auto_181077 ) ) ( not ( = ?auto_181083 ?auto_181085 ) ) ( not ( = ?auto_181083 ?auto_181082 ) ) ( not ( = ?auto_181083 ?auto_181079 ) ) ( not ( = ?auto_181083 ?auto_181078 ) ) ( not ( = ?auto_181083 ?auto_181077 ) ) ( not ( = ?auto_181085 ?auto_181082 ) ) ( not ( = ?auto_181085 ?auto_181079 ) ) ( not ( = ?auto_181085 ?auto_181078 ) ) ( not ( = ?auto_181085 ?auto_181077 ) ) ( not ( = ?auto_181082 ?auto_181079 ) ) ( not ( = ?auto_181082 ?auto_181078 ) ) ( not ( = ?auto_181082 ?auto_181077 ) ) ( ON ?auto_181077 ?auto_181084 ) ( not ( = ?auto_181077 ?auto_181084 ) ) ( not ( = ?auto_181078 ?auto_181084 ) ) ( not ( = ?auto_181079 ?auto_181084 ) ) ( not ( = ?auto_181081 ?auto_181084 ) ) ( not ( = ?auto_181080 ?auto_181084 ) ) ( not ( = ?auto_181083 ?auto_181084 ) ) ( not ( = ?auto_181085 ?auto_181084 ) ) ( not ( = ?auto_181082 ?auto_181084 ) ) ( ON ?auto_181078 ?auto_181077 ) ( ON-TABLE ?auto_181084 ) ( ON ?auto_181079 ?auto_181078 ) ( ON ?auto_181082 ?auto_181079 ) ( ON ?auto_181085 ?auto_181082 ) ( ON ?auto_181083 ?auto_181085 ) ( ON ?auto_181080 ?auto_181083 ) ( ON ?auto_181081 ?auto_181080 ) ( CLEAR ?auto_181081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181084 ?auto_181077 ?auto_181078 ?auto_181079 ?auto_181082 ?auto_181085 ?auto_181083 ?auto_181080 )
      ( MAKE-2PILE ?auto_181077 ?auto_181078 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181091 - BLOCK
      ?auto_181092 - BLOCK
      ?auto_181093 - BLOCK
      ?auto_181094 - BLOCK
      ?auto_181095 - BLOCK
    )
    :vars
    (
      ?auto_181096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181096 ?auto_181095 ) ( CLEAR ?auto_181096 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181091 ) ( ON ?auto_181092 ?auto_181091 ) ( ON ?auto_181093 ?auto_181092 ) ( ON ?auto_181094 ?auto_181093 ) ( ON ?auto_181095 ?auto_181094 ) ( not ( = ?auto_181091 ?auto_181092 ) ) ( not ( = ?auto_181091 ?auto_181093 ) ) ( not ( = ?auto_181091 ?auto_181094 ) ) ( not ( = ?auto_181091 ?auto_181095 ) ) ( not ( = ?auto_181091 ?auto_181096 ) ) ( not ( = ?auto_181092 ?auto_181093 ) ) ( not ( = ?auto_181092 ?auto_181094 ) ) ( not ( = ?auto_181092 ?auto_181095 ) ) ( not ( = ?auto_181092 ?auto_181096 ) ) ( not ( = ?auto_181093 ?auto_181094 ) ) ( not ( = ?auto_181093 ?auto_181095 ) ) ( not ( = ?auto_181093 ?auto_181096 ) ) ( not ( = ?auto_181094 ?auto_181095 ) ) ( not ( = ?auto_181094 ?auto_181096 ) ) ( not ( = ?auto_181095 ?auto_181096 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181096 ?auto_181095 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181097 - BLOCK
      ?auto_181098 - BLOCK
      ?auto_181099 - BLOCK
      ?auto_181100 - BLOCK
      ?auto_181101 - BLOCK
    )
    :vars
    (
      ?auto_181102 - BLOCK
      ?auto_181103 - BLOCK
      ?auto_181104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181102 ?auto_181101 ) ( CLEAR ?auto_181102 ) ( ON-TABLE ?auto_181097 ) ( ON ?auto_181098 ?auto_181097 ) ( ON ?auto_181099 ?auto_181098 ) ( ON ?auto_181100 ?auto_181099 ) ( ON ?auto_181101 ?auto_181100 ) ( not ( = ?auto_181097 ?auto_181098 ) ) ( not ( = ?auto_181097 ?auto_181099 ) ) ( not ( = ?auto_181097 ?auto_181100 ) ) ( not ( = ?auto_181097 ?auto_181101 ) ) ( not ( = ?auto_181097 ?auto_181102 ) ) ( not ( = ?auto_181098 ?auto_181099 ) ) ( not ( = ?auto_181098 ?auto_181100 ) ) ( not ( = ?auto_181098 ?auto_181101 ) ) ( not ( = ?auto_181098 ?auto_181102 ) ) ( not ( = ?auto_181099 ?auto_181100 ) ) ( not ( = ?auto_181099 ?auto_181101 ) ) ( not ( = ?auto_181099 ?auto_181102 ) ) ( not ( = ?auto_181100 ?auto_181101 ) ) ( not ( = ?auto_181100 ?auto_181102 ) ) ( not ( = ?auto_181101 ?auto_181102 ) ) ( HOLDING ?auto_181103 ) ( CLEAR ?auto_181104 ) ( not ( = ?auto_181097 ?auto_181103 ) ) ( not ( = ?auto_181097 ?auto_181104 ) ) ( not ( = ?auto_181098 ?auto_181103 ) ) ( not ( = ?auto_181098 ?auto_181104 ) ) ( not ( = ?auto_181099 ?auto_181103 ) ) ( not ( = ?auto_181099 ?auto_181104 ) ) ( not ( = ?auto_181100 ?auto_181103 ) ) ( not ( = ?auto_181100 ?auto_181104 ) ) ( not ( = ?auto_181101 ?auto_181103 ) ) ( not ( = ?auto_181101 ?auto_181104 ) ) ( not ( = ?auto_181102 ?auto_181103 ) ) ( not ( = ?auto_181102 ?auto_181104 ) ) ( not ( = ?auto_181103 ?auto_181104 ) ) )
    :subtasks
    ( ( !STACK ?auto_181103 ?auto_181104 )
      ( MAKE-5PILE ?auto_181097 ?auto_181098 ?auto_181099 ?auto_181100 ?auto_181101 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181105 - BLOCK
      ?auto_181106 - BLOCK
      ?auto_181107 - BLOCK
      ?auto_181108 - BLOCK
      ?auto_181109 - BLOCK
    )
    :vars
    (
      ?auto_181110 - BLOCK
      ?auto_181111 - BLOCK
      ?auto_181112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181110 ?auto_181109 ) ( ON-TABLE ?auto_181105 ) ( ON ?auto_181106 ?auto_181105 ) ( ON ?auto_181107 ?auto_181106 ) ( ON ?auto_181108 ?auto_181107 ) ( ON ?auto_181109 ?auto_181108 ) ( not ( = ?auto_181105 ?auto_181106 ) ) ( not ( = ?auto_181105 ?auto_181107 ) ) ( not ( = ?auto_181105 ?auto_181108 ) ) ( not ( = ?auto_181105 ?auto_181109 ) ) ( not ( = ?auto_181105 ?auto_181110 ) ) ( not ( = ?auto_181106 ?auto_181107 ) ) ( not ( = ?auto_181106 ?auto_181108 ) ) ( not ( = ?auto_181106 ?auto_181109 ) ) ( not ( = ?auto_181106 ?auto_181110 ) ) ( not ( = ?auto_181107 ?auto_181108 ) ) ( not ( = ?auto_181107 ?auto_181109 ) ) ( not ( = ?auto_181107 ?auto_181110 ) ) ( not ( = ?auto_181108 ?auto_181109 ) ) ( not ( = ?auto_181108 ?auto_181110 ) ) ( not ( = ?auto_181109 ?auto_181110 ) ) ( CLEAR ?auto_181111 ) ( not ( = ?auto_181105 ?auto_181112 ) ) ( not ( = ?auto_181105 ?auto_181111 ) ) ( not ( = ?auto_181106 ?auto_181112 ) ) ( not ( = ?auto_181106 ?auto_181111 ) ) ( not ( = ?auto_181107 ?auto_181112 ) ) ( not ( = ?auto_181107 ?auto_181111 ) ) ( not ( = ?auto_181108 ?auto_181112 ) ) ( not ( = ?auto_181108 ?auto_181111 ) ) ( not ( = ?auto_181109 ?auto_181112 ) ) ( not ( = ?auto_181109 ?auto_181111 ) ) ( not ( = ?auto_181110 ?auto_181112 ) ) ( not ( = ?auto_181110 ?auto_181111 ) ) ( not ( = ?auto_181112 ?auto_181111 ) ) ( ON ?auto_181112 ?auto_181110 ) ( CLEAR ?auto_181112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181105 ?auto_181106 ?auto_181107 ?auto_181108 ?auto_181109 ?auto_181110 )
      ( MAKE-5PILE ?auto_181105 ?auto_181106 ?auto_181107 ?auto_181108 ?auto_181109 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181113 - BLOCK
      ?auto_181114 - BLOCK
      ?auto_181115 - BLOCK
      ?auto_181116 - BLOCK
      ?auto_181117 - BLOCK
    )
    :vars
    (
      ?auto_181118 - BLOCK
      ?auto_181120 - BLOCK
      ?auto_181119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181118 ?auto_181117 ) ( ON-TABLE ?auto_181113 ) ( ON ?auto_181114 ?auto_181113 ) ( ON ?auto_181115 ?auto_181114 ) ( ON ?auto_181116 ?auto_181115 ) ( ON ?auto_181117 ?auto_181116 ) ( not ( = ?auto_181113 ?auto_181114 ) ) ( not ( = ?auto_181113 ?auto_181115 ) ) ( not ( = ?auto_181113 ?auto_181116 ) ) ( not ( = ?auto_181113 ?auto_181117 ) ) ( not ( = ?auto_181113 ?auto_181118 ) ) ( not ( = ?auto_181114 ?auto_181115 ) ) ( not ( = ?auto_181114 ?auto_181116 ) ) ( not ( = ?auto_181114 ?auto_181117 ) ) ( not ( = ?auto_181114 ?auto_181118 ) ) ( not ( = ?auto_181115 ?auto_181116 ) ) ( not ( = ?auto_181115 ?auto_181117 ) ) ( not ( = ?auto_181115 ?auto_181118 ) ) ( not ( = ?auto_181116 ?auto_181117 ) ) ( not ( = ?auto_181116 ?auto_181118 ) ) ( not ( = ?auto_181117 ?auto_181118 ) ) ( not ( = ?auto_181113 ?auto_181120 ) ) ( not ( = ?auto_181113 ?auto_181119 ) ) ( not ( = ?auto_181114 ?auto_181120 ) ) ( not ( = ?auto_181114 ?auto_181119 ) ) ( not ( = ?auto_181115 ?auto_181120 ) ) ( not ( = ?auto_181115 ?auto_181119 ) ) ( not ( = ?auto_181116 ?auto_181120 ) ) ( not ( = ?auto_181116 ?auto_181119 ) ) ( not ( = ?auto_181117 ?auto_181120 ) ) ( not ( = ?auto_181117 ?auto_181119 ) ) ( not ( = ?auto_181118 ?auto_181120 ) ) ( not ( = ?auto_181118 ?auto_181119 ) ) ( not ( = ?auto_181120 ?auto_181119 ) ) ( ON ?auto_181120 ?auto_181118 ) ( CLEAR ?auto_181120 ) ( HOLDING ?auto_181119 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181119 )
      ( MAKE-5PILE ?auto_181113 ?auto_181114 ?auto_181115 ?auto_181116 ?auto_181117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181121 - BLOCK
      ?auto_181122 - BLOCK
      ?auto_181123 - BLOCK
      ?auto_181124 - BLOCK
      ?auto_181125 - BLOCK
    )
    :vars
    (
      ?auto_181127 - BLOCK
      ?auto_181126 - BLOCK
      ?auto_181128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181127 ?auto_181125 ) ( ON-TABLE ?auto_181121 ) ( ON ?auto_181122 ?auto_181121 ) ( ON ?auto_181123 ?auto_181122 ) ( ON ?auto_181124 ?auto_181123 ) ( ON ?auto_181125 ?auto_181124 ) ( not ( = ?auto_181121 ?auto_181122 ) ) ( not ( = ?auto_181121 ?auto_181123 ) ) ( not ( = ?auto_181121 ?auto_181124 ) ) ( not ( = ?auto_181121 ?auto_181125 ) ) ( not ( = ?auto_181121 ?auto_181127 ) ) ( not ( = ?auto_181122 ?auto_181123 ) ) ( not ( = ?auto_181122 ?auto_181124 ) ) ( not ( = ?auto_181122 ?auto_181125 ) ) ( not ( = ?auto_181122 ?auto_181127 ) ) ( not ( = ?auto_181123 ?auto_181124 ) ) ( not ( = ?auto_181123 ?auto_181125 ) ) ( not ( = ?auto_181123 ?auto_181127 ) ) ( not ( = ?auto_181124 ?auto_181125 ) ) ( not ( = ?auto_181124 ?auto_181127 ) ) ( not ( = ?auto_181125 ?auto_181127 ) ) ( not ( = ?auto_181121 ?auto_181126 ) ) ( not ( = ?auto_181121 ?auto_181128 ) ) ( not ( = ?auto_181122 ?auto_181126 ) ) ( not ( = ?auto_181122 ?auto_181128 ) ) ( not ( = ?auto_181123 ?auto_181126 ) ) ( not ( = ?auto_181123 ?auto_181128 ) ) ( not ( = ?auto_181124 ?auto_181126 ) ) ( not ( = ?auto_181124 ?auto_181128 ) ) ( not ( = ?auto_181125 ?auto_181126 ) ) ( not ( = ?auto_181125 ?auto_181128 ) ) ( not ( = ?auto_181127 ?auto_181126 ) ) ( not ( = ?auto_181127 ?auto_181128 ) ) ( not ( = ?auto_181126 ?auto_181128 ) ) ( ON ?auto_181126 ?auto_181127 ) ( ON ?auto_181128 ?auto_181126 ) ( CLEAR ?auto_181128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181121 ?auto_181122 ?auto_181123 ?auto_181124 ?auto_181125 ?auto_181127 ?auto_181126 )
      ( MAKE-5PILE ?auto_181121 ?auto_181122 ?auto_181123 ?auto_181124 ?auto_181125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181129 - BLOCK
      ?auto_181130 - BLOCK
      ?auto_181131 - BLOCK
      ?auto_181132 - BLOCK
      ?auto_181133 - BLOCK
    )
    :vars
    (
      ?auto_181136 - BLOCK
      ?auto_181135 - BLOCK
      ?auto_181134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181136 ?auto_181133 ) ( ON-TABLE ?auto_181129 ) ( ON ?auto_181130 ?auto_181129 ) ( ON ?auto_181131 ?auto_181130 ) ( ON ?auto_181132 ?auto_181131 ) ( ON ?auto_181133 ?auto_181132 ) ( not ( = ?auto_181129 ?auto_181130 ) ) ( not ( = ?auto_181129 ?auto_181131 ) ) ( not ( = ?auto_181129 ?auto_181132 ) ) ( not ( = ?auto_181129 ?auto_181133 ) ) ( not ( = ?auto_181129 ?auto_181136 ) ) ( not ( = ?auto_181130 ?auto_181131 ) ) ( not ( = ?auto_181130 ?auto_181132 ) ) ( not ( = ?auto_181130 ?auto_181133 ) ) ( not ( = ?auto_181130 ?auto_181136 ) ) ( not ( = ?auto_181131 ?auto_181132 ) ) ( not ( = ?auto_181131 ?auto_181133 ) ) ( not ( = ?auto_181131 ?auto_181136 ) ) ( not ( = ?auto_181132 ?auto_181133 ) ) ( not ( = ?auto_181132 ?auto_181136 ) ) ( not ( = ?auto_181133 ?auto_181136 ) ) ( not ( = ?auto_181129 ?auto_181135 ) ) ( not ( = ?auto_181129 ?auto_181134 ) ) ( not ( = ?auto_181130 ?auto_181135 ) ) ( not ( = ?auto_181130 ?auto_181134 ) ) ( not ( = ?auto_181131 ?auto_181135 ) ) ( not ( = ?auto_181131 ?auto_181134 ) ) ( not ( = ?auto_181132 ?auto_181135 ) ) ( not ( = ?auto_181132 ?auto_181134 ) ) ( not ( = ?auto_181133 ?auto_181135 ) ) ( not ( = ?auto_181133 ?auto_181134 ) ) ( not ( = ?auto_181136 ?auto_181135 ) ) ( not ( = ?auto_181136 ?auto_181134 ) ) ( not ( = ?auto_181135 ?auto_181134 ) ) ( ON ?auto_181135 ?auto_181136 ) ( HOLDING ?auto_181134 ) ( CLEAR ?auto_181135 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181129 ?auto_181130 ?auto_181131 ?auto_181132 ?auto_181133 ?auto_181136 ?auto_181135 ?auto_181134 )
      ( MAKE-5PILE ?auto_181129 ?auto_181130 ?auto_181131 ?auto_181132 ?auto_181133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181137 - BLOCK
      ?auto_181138 - BLOCK
      ?auto_181139 - BLOCK
      ?auto_181140 - BLOCK
      ?auto_181141 - BLOCK
    )
    :vars
    (
      ?auto_181144 - BLOCK
      ?auto_181142 - BLOCK
      ?auto_181143 - BLOCK
      ?auto_181145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181144 ?auto_181141 ) ( ON-TABLE ?auto_181137 ) ( ON ?auto_181138 ?auto_181137 ) ( ON ?auto_181139 ?auto_181138 ) ( ON ?auto_181140 ?auto_181139 ) ( ON ?auto_181141 ?auto_181140 ) ( not ( = ?auto_181137 ?auto_181138 ) ) ( not ( = ?auto_181137 ?auto_181139 ) ) ( not ( = ?auto_181137 ?auto_181140 ) ) ( not ( = ?auto_181137 ?auto_181141 ) ) ( not ( = ?auto_181137 ?auto_181144 ) ) ( not ( = ?auto_181138 ?auto_181139 ) ) ( not ( = ?auto_181138 ?auto_181140 ) ) ( not ( = ?auto_181138 ?auto_181141 ) ) ( not ( = ?auto_181138 ?auto_181144 ) ) ( not ( = ?auto_181139 ?auto_181140 ) ) ( not ( = ?auto_181139 ?auto_181141 ) ) ( not ( = ?auto_181139 ?auto_181144 ) ) ( not ( = ?auto_181140 ?auto_181141 ) ) ( not ( = ?auto_181140 ?auto_181144 ) ) ( not ( = ?auto_181141 ?auto_181144 ) ) ( not ( = ?auto_181137 ?auto_181142 ) ) ( not ( = ?auto_181137 ?auto_181143 ) ) ( not ( = ?auto_181138 ?auto_181142 ) ) ( not ( = ?auto_181138 ?auto_181143 ) ) ( not ( = ?auto_181139 ?auto_181142 ) ) ( not ( = ?auto_181139 ?auto_181143 ) ) ( not ( = ?auto_181140 ?auto_181142 ) ) ( not ( = ?auto_181140 ?auto_181143 ) ) ( not ( = ?auto_181141 ?auto_181142 ) ) ( not ( = ?auto_181141 ?auto_181143 ) ) ( not ( = ?auto_181144 ?auto_181142 ) ) ( not ( = ?auto_181144 ?auto_181143 ) ) ( not ( = ?auto_181142 ?auto_181143 ) ) ( ON ?auto_181142 ?auto_181144 ) ( CLEAR ?auto_181142 ) ( ON ?auto_181143 ?auto_181145 ) ( CLEAR ?auto_181143 ) ( HAND-EMPTY ) ( not ( = ?auto_181137 ?auto_181145 ) ) ( not ( = ?auto_181138 ?auto_181145 ) ) ( not ( = ?auto_181139 ?auto_181145 ) ) ( not ( = ?auto_181140 ?auto_181145 ) ) ( not ( = ?auto_181141 ?auto_181145 ) ) ( not ( = ?auto_181144 ?auto_181145 ) ) ( not ( = ?auto_181142 ?auto_181145 ) ) ( not ( = ?auto_181143 ?auto_181145 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181143 ?auto_181145 )
      ( MAKE-5PILE ?auto_181137 ?auto_181138 ?auto_181139 ?auto_181140 ?auto_181141 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181146 - BLOCK
      ?auto_181147 - BLOCK
      ?auto_181148 - BLOCK
      ?auto_181149 - BLOCK
      ?auto_181150 - BLOCK
    )
    :vars
    (
      ?auto_181151 - BLOCK
      ?auto_181152 - BLOCK
      ?auto_181153 - BLOCK
      ?auto_181154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181151 ?auto_181150 ) ( ON-TABLE ?auto_181146 ) ( ON ?auto_181147 ?auto_181146 ) ( ON ?auto_181148 ?auto_181147 ) ( ON ?auto_181149 ?auto_181148 ) ( ON ?auto_181150 ?auto_181149 ) ( not ( = ?auto_181146 ?auto_181147 ) ) ( not ( = ?auto_181146 ?auto_181148 ) ) ( not ( = ?auto_181146 ?auto_181149 ) ) ( not ( = ?auto_181146 ?auto_181150 ) ) ( not ( = ?auto_181146 ?auto_181151 ) ) ( not ( = ?auto_181147 ?auto_181148 ) ) ( not ( = ?auto_181147 ?auto_181149 ) ) ( not ( = ?auto_181147 ?auto_181150 ) ) ( not ( = ?auto_181147 ?auto_181151 ) ) ( not ( = ?auto_181148 ?auto_181149 ) ) ( not ( = ?auto_181148 ?auto_181150 ) ) ( not ( = ?auto_181148 ?auto_181151 ) ) ( not ( = ?auto_181149 ?auto_181150 ) ) ( not ( = ?auto_181149 ?auto_181151 ) ) ( not ( = ?auto_181150 ?auto_181151 ) ) ( not ( = ?auto_181146 ?auto_181152 ) ) ( not ( = ?auto_181146 ?auto_181153 ) ) ( not ( = ?auto_181147 ?auto_181152 ) ) ( not ( = ?auto_181147 ?auto_181153 ) ) ( not ( = ?auto_181148 ?auto_181152 ) ) ( not ( = ?auto_181148 ?auto_181153 ) ) ( not ( = ?auto_181149 ?auto_181152 ) ) ( not ( = ?auto_181149 ?auto_181153 ) ) ( not ( = ?auto_181150 ?auto_181152 ) ) ( not ( = ?auto_181150 ?auto_181153 ) ) ( not ( = ?auto_181151 ?auto_181152 ) ) ( not ( = ?auto_181151 ?auto_181153 ) ) ( not ( = ?auto_181152 ?auto_181153 ) ) ( ON ?auto_181153 ?auto_181154 ) ( CLEAR ?auto_181153 ) ( not ( = ?auto_181146 ?auto_181154 ) ) ( not ( = ?auto_181147 ?auto_181154 ) ) ( not ( = ?auto_181148 ?auto_181154 ) ) ( not ( = ?auto_181149 ?auto_181154 ) ) ( not ( = ?auto_181150 ?auto_181154 ) ) ( not ( = ?auto_181151 ?auto_181154 ) ) ( not ( = ?auto_181152 ?auto_181154 ) ) ( not ( = ?auto_181153 ?auto_181154 ) ) ( HOLDING ?auto_181152 ) ( CLEAR ?auto_181151 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181146 ?auto_181147 ?auto_181148 ?auto_181149 ?auto_181150 ?auto_181151 ?auto_181152 )
      ( MAKE-5PILE ?auto_181146 ?auto_181147 ?auto_181148 ?auto_181149 ?auto_181150 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181155 - BLOCK
      ?auto_181156 - BLOCK
      ?auto_181157 - BLOCK
      ?auto_181158 - BLOCK
      ?auto_181159 - BLOCK
    )
    :vars
    (
      ?auto_181161 - BLOCK
      ?auto_181160 - BLOCK
      ?auto_181162 - BLOCK
      ?auto_181163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181161 ?auto_181159 ) ( ON-TABLE ?auto_181155 ) ( ON ?auto_181156 ?auto_181155 ) ( ON ?auto_181157 ?auto_181156 ) ( ON ?auto_181158 ?auto_181157 ) ( ON ?auto_181159 ?auto_181158 ) ( not ( = ?auto_181155 ?auto_181156 ) ) ( not ( = ?auto_181155 ?auto_181157 ) ) ( not ( = ?auto_181155 ?auto_181158 ) ) ( not ( = ?auto_181155 ?auto_181159 ) ) ( not ( = ?auto_181155 ?auto_181161 ) ) ( not ( = ?auto_181156 ?auto_181157 ) ) ( not ( = ?auto_181156 ?auto_181158 ) ) ( not ( = ?auto_181156 ?auto_181159 ) ) ( not ( = ?auto_181156 ?auto_181161 ) ) ( not ( = ?auto_181157 ?auto_181158 ) ) ( not ( = ?auto_181157 ?auto_181159 ) ) ( not ( = ?auto_181157 ?auto_181161 ) ) ( not ( = ?auto_181158 ?auto_181159 ) ) ( not ( = ?auto_181158 ?auto_181161 ) ) ( not ( = ?auto_181159 ?auto_181161 ) ) ( not ( = ?auto_181155 ?auto_181160 ) ) ( not ( = ?auto_181155 ?auto_181162 ) ) ( not ( = ?auto_181156 ?auto_181160 ) ) ( not ( = ?auto_181156 ?auto_181162 ) ) ( not ( = ?auto_181157 ?auto_181160 ) ) ( not ( = ?auto_181157 ?auto_181162 ) ) ( not ( = ?auto_181158 ?auto_181160 ) ) ( not ( = ?auto_181158 ?auto_181162 ) ) ( not ( = ?auto_181159 ?auto_181160 ) ) ( not ( = ?auto_181159 ?auto_181162 ) ) ( not ( = ?auto_181161 ?auto_181160 ) ) ( not ( = ?auto_181161 ?auto_181162 ) ) ( not ( = ?auto_181160 ?auto_181162 ) ) ( ON ?auto_181162 ?auto_181163 ) ( not ( = ?auto_181155 ?auto_181163 ) ) ( not ( = ?auto_181156 ?auto_181163 ) ) ( not ( = ?auto_181157 ?auto_181163 ) ) ( not ( = ?auto_181158 ?auto_181163 ) ) ( not ( = ?auto_181159 ?auto_181163 ) ) ( not ( = ?auto_181161 ?auto_181163 ) ) ( not ( = ?auto_181160 ?auto_181163 ) ) ( not ( = ?auto_181162 ?auto_181163 ) ) ( CLEAR ?auto_181161 ) ( ON ?auto_181160 ?auto_181162 ) ( CLEAR ?auto_181160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181163 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181163 ?auto_181162 )
      ( MAKE-5PILE ?auto_181155 ?auto_181156 ?auto_181157 ?auto_181158 ?auto_181159 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181182 - BLOCK
      ?auto_181183 - BLOCK
      ?auto_181184 - BLOCK
      ?auto_181185 - BLOCK
      ?auto_181186 - BLOCK
    )
    :vars
    (
      ?auto_181190 - BLOCK
      ?auto_181187 - BLOCK
      ?auto_181189 - BLOCK
      ?auto_181188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181182 ) ( ON ?auto_181183 ?auto_181182 ) ( ON ?auto_181184 ?auto_181183 ) ( ON ?auto_181185 ?auto_181184 ) ( not ( = ?auto_181182 ?auto_181183 ) ) ( not ( = ?auto_181182 ?auto_181184 ) ) ( not ( = ?auto_181182 ?auto_181185 ) ) ( not ( = ?auto_181182 ?auto_181186 ) ) ( not ( = ?auto_181182 ?auto_181190 ) ) ( not ( = ?auto_181183 ?auto_181184 ) ) ( not ( = ?auto_181183 ?auto_181185 ) ) ( not ( = ?auto_181183 ?auto_181186 ) ) ( not ( = ?auto_181183 ?auto_181190 ) ) ( not ( = ?auto_181184 ?auto_181185 ) ) ( not ( = ?auto_181184 ?auto_181186 ) ) ( not ( = ?auto_181184 ?auto_181190 ) ) ( not ( = ?auto_181185 ?auto_181186 ) ) ( not ( = ?auto_181185 ?auto_181190 ) ) ( not ( = ?auto_181186 ?auto_181190 ) ) ( not ( = ?auto_181182 ?auto_181187 ) ) ( not ( = ?auto_181182 ?auto_181189 ) ) ( not ( = ?auto_181183 ?auto_181187 ) ) ( not ( = ?auto_181183 ?auto_181189 ) ) ( not ( = ?auto_181184 ?auto_181187 ) ) ( not ( = ?auto_181184 ?auto_181189 ) ) ( not ( = ?auto_181185 ?auto_181187 ) ) ( not ( = ?auto_181185 ?auto_181189 ) ) ( not ( = ?auto_181186 ?auto_181187 ) ) ( not ( = ?auto_181186 ?auto_181189 ) ) ( not ( = ?auto_181190 ?auto_181187 ) ) ( not ( = ?auto_181190 ?auto_181189 ) ) ( not ( = ?auto_181187 ?auto_181189 ) ) ( ON ?auto_181189 ?auto_181188 ) ( not ( = ?auto_181182 ?auto_181188 ) ) ( not ( = ?auto_181183 ?auto_181188 ) ) ( not ( = ?auto_181184 ?auto_181188 ) ) ( not ( = ?auto_181185 ?auto_181188 ) ) ( not ( = ?auto_181186 ?auto_181188 ) ) ( not ( = ?auto_181190 ?auto_181188 ) ) ( not ( = ?auto_181187 ?auto_181188 ) ) ( not ( = ?auto_181189 ?auto_181188 ) ) ( ON ?auto_181187 ?auto_181189 ) ( ON-TABLE ?auto_181188 ) ( ON ?auto_181190 ?auto_181187 ) ( CLEAR ?auto_181190 ) ( HOLDING ?auto_181186 ) ( CLEAR ?auto_181185 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181182 ?auto_181183 ?auto_181184 ?auto_181185 ?auto_181186 ?auto_181190 )
      ( MAKE-5PILE ?auto_181182 ?auto_181183 ?auto_181184 ?auto_181185 ?auto_181186 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181191 - BLOCK
      ?auto_181192 - BLOCK
      ?auto_181193 - BLOCK
      ?auto_181194 - BLOCK
      ?auto_181195 - BLOCK
    )
    :vars
    (
      ?auto_181196 - BLOCK
      ?auto_181198 - BLOCK
      ?auto_181197 - BLOCK
      ?auto_181199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181191 ) ( ON ?auto_181192 ?auto_181191 ) ( ON ?auto_181193 ?auto_181192 ) ( ON ?auto_181194 ?auto_181193 ) ( not ( = ?auto_181191 ?auto_181192 ) ) ( not ( = ?auto_181191 ?auto_181193 ) ) ( not ( = ?auto_181191 ?auto_181194 ) ) ( not ( = ?auto_181191 ?auto_181195 ) ) ( not ( = ?auto_181191 ?auto_181196 ) ) ( not ( = ?auto_181192 ?auto_181193 ) ) ( not ( = ?auto_181192 ?auto_181194 ) ) ( not ( = ?auto_181192 ?auto_181195 ) ) ( not ( = ?auto_181192 ?auto_181196 ) ) ( not ( = ?auto_181193 ?auto_181194 ) ) ( not ( = ?auto_181193 ?auto_181195 ) ) ( not ( = ?auto_181193 ?auto_181196 ) ) ( not ( = ?auto_181194 ?auto_181195 ) ) ( not ( = ?auto_181194 ?auto_181196 ) ) ( not ( = ?auto_181195 ?auto_181196 ) ) ( not ( = ?auto_181191 ?auto_181198 ) ) ( not ( = ?auto_181191 ?auto_181197 ) ) ( not ( = ?auto_181192 ?auto_181198 ) ) ( not ( = ?auto_181192 ?auto_181197 ) ) ( not ( = ?auto_181193 ?auto_181198 ) ) ( not ( = ?auto_181193 ?auto_181197 ) ) ( not ( = ?auto_181194 ?auto_181198 ) ) ( not ( = ?auto_181194 ?auto_181197 ) ) ( not ( = ?auto_181195 ?auto_181198 ) ) ( not ( = ?auto_181195 ?auto_181197 ) ) ( not ( = ?auto_181196 ?auto_181198 ) ) ( not ( = ?auto_181196 ?auto_181197 ) ) ( not ( = ?auto_181198 ?auto_181197 ) ) ( ON ?auto_181197 ?auto_181199 ) ( not ( = ?auto_181191 ?auto_181199 ) ) ( not ( = ?auto_181192 ?auto_181199 ) ) ( not ( = ?auto_181193 ?auto_181199 ) ) ( not ( = ?auto_181194 ?auto_181199 ) ) ( not ( = ?auto_181195 ?auto_181199 ) ) ( not ( = ?auto_181196 ?auto_181199 ) ) ( not ( = ?auto_181198 ?auto_181199 ) ) ( not ( = ?auto_181197 ?auto_181199 ) ) ( ON ?auto_181198 ?auto_181197 ) ( ON-TABLE ?auto_181199 ) ( ON ?auto_181196 ?auto_181198 ) ( CLEAR ?auto_181194 ) ( ON ?auto_181195 ?auto_181196 ) ( CLEAR ?auto_181195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181199 ?auto_181197 ?auto_181198 ?auto_181196 )
      ( MAKE-5PILE ?auto_181191 ?auto_181192 ?auto_181193 ?auto_181194 ?auto_181195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181200 - BLOCK
      ?auto_181201 - BLOCK
      ?auto_181202 - BLOCK
      ?auto_181203 - BLOCK
      ?auto_181204 - BLOCK
    )
    :vars
    (
      ?auto_181205 - BLOCK
      ?auto_181208 - BLOCK
      ?auto_181207 - BLOCK
      ?auto_181206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181200 ) ( ON ?auto_181201 ?auto_181200 ) ( ON ?auto_181202 ?auto_181201 ) ( not ( = ?auto_181200 ?auto_181201 ) ) ( not ( = ?auto_181200 ?auto_181202 ) ) ( not ( = ?auto_181200 ?auto_181203 ) ) ( not ( = ?auto_181200 ?auto_181204 ) ) ( not ( = ?auto_181200 ?auto_181205 ) ) ( not ( = ?auto_181201 ?auto_181202 ) ) ( not ( = ?auto_181201 ?auto_181203 ) ) ( not ( = ?auto_181201 ?auto_181204 ) ) ( not ( = ?auto_181201 ?auto_181205 ) ) ( not ( = ?auto_181202 ?auto_181203 ) ) ( not ( = ?auto_181202 ?auto_181204 ) ) ( not ( = ?auto_181202 ?auto_181205 ) ) ( not ( = ?auto_181203 ?auto_181204 ) ) ( not ( = ?auto_181203 ?auto_181205 ) ) ( not ( = ?auto_181204 ?auto_181205 ) ) ( not ( = ?auto_181200 ?auto_181208 ) ) ( not ( = ?auto_181200 ?auto_181207 ) ) ( not ( = ?auto_181201 ?auto_181208 ) ) ( not ( = ?auto_181201 ?auto_181207 ) ) ( not ( = ?auto_181202 ?auto_181208 ) ) ( not ( = ?auto_181202 ?auto_181207 ) ) ( not ( = ?auto_181203 ?auto_181208 ) ) ( not ( = ?auto_181203 ?auto_181207 ) ) ( not ( = ?auto_181204 ?auto_181208 ) ) ( not ( = ?auto_181204 ?auto_181207 ) ) ( not ( = ?auto_181205 ?auto_181208 ) ) ( not ( = ?auto_181205 ?auto_181207 ) ) ( not ( = ?auto_181208 ?auto_181207 ) ) ( ON ?auto_181207 ?auto_181206 ) ( not ( = ?auto_181200 ?auto_181206 ) ) ( not ( = ?auto_181201 ?auto_181206 ) ) ( not ( = ?auto_181202 ?auto_181206 ) ) ( not ( = ?auto_181203 ?auto_181206 ) ) ( not ( = ?auto_181204 ?auto_181206 ) ) ( not ( = ?auto_181205 ?auto_181206 ) ) ( not ( = ?auto_181208 ?auto_181206 ) ) ( not ( = ?auto_181207 ?auto_181206 ) ) ( ON ?auto_181208 ?auto_181207 ) ( ON-TABLE ?auto_181206 ) ( ON ?auto_181205 ?auto_181208 ) ( ON ?auto_181204 ?auto_181205 ) ( CLEAR ?auto_181204 ) ( HOLDING ?auto_181203 ) ( CLEAR ?auto_181202 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181200 ?auto_181201 ?auto_181202 ?auto_181203 )
      ( MAKE-5PILE ?auto_181200 ?auto_181201 ?auto_181202 ?auto_181203 ?auto_181204 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181209 - BLOCK
      ?auto_181210 - BLOCK
      ?auto_181211 - BLOCK
      ?auto_181212 - BLOCK
      ?auto_181213 - BLOCK
    )
    :vars
    (
      ?auto_181214 - BLOCK
      ?auto_181215 - BLOCK
      ?auto_181216 - BLOCK
      ?auto_181217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181209 ) ( ON ?auto_181210 ?auto_181209 ) ( ON ?auto_181211 ?auto_181210 ) ( not ( = ?auto_181209 ?auto_181210 ) ) ( not ( = ?auto_181209 ?auto_181211 ) ) ( not ( = ?auto_181209 ?auto_181212 ) ) ( not ( = ?auto_181209 ?auto_181213 ) ) ( not ( = ?auto_181209 ?auto_181214 ) ) ( not ( = ?auto_181210 ?auto_181211 ) ) ( not ( = ?auto_181210 ?auto_181212 ) ) ( not ( = ?auto_181210 ?auto_181213 ) ) ( not ( = ?auto_181210 ?auto_181214 ) ) ( not ( = ?auto_181211 ?auto_181212 ) ) ( not ( = ?auto_181211 ?auto_181213 ) ) ( not ( = ?auto_181211 ?auto_181214 ) ) ( not ( = ?auto_181212 ?auto_181213 ) ) ( not ( = ?auto_181212 ?auto_181214 ) ) ( not ( = ?auto_181213 ?auto_181214 ) ) ( not ( = ?auto_181209 ?auto_181215 ) ) ( not ( = ?auto_181209 ?auto_181216 ) ) ( not ( = ?auto_181210 ?auto_181215 ) ) ( not ( = ?auto_181210 ?auto_181216 ) ) ( not ( = ?auto_181211 ?auto_181215 ) ) ( not ( = ?auto_181211 ?auto_181216 ) ) ( not ( = ?auto_181212 ?auto_181215 ) ) ( not ( = ?auto_181212 ?auto_181216 ) ) ( not ( = ?auto_181213 ?auto_181215 ) ) ( not ( = ?auto_181213 ?auto_181216 ) ) ( not ( = ?auto_181214 ?auto_181215 ) ) ( not ( = ?auto_181214 ?auto_181216 ) ) ( not ( = ?auto_181215 ?auto_181216 ) ) ( ON ?auto_181216 ?auto_181217 ) ( not ( = ?auto_181209 ?auto_181217 ) ) ( not ( = ?auto_181210 ?auto_181217 ) ) ( not ( = ?auto_181211 ?auto_181217 ) ) ( not ( = ?auto_181212 ?auto_181217 ) ) ( not ( = ?auto_181213 ?auto_181217 ) ) ( not ( = ?auto_181214 ?auto_181217 ) ) ( not ( = ?auto_181215 ?auto_181217 ) ) ( not ( = ?auto_181216 ?auto_181217 ) ) ( ON ?auto_181215 ?auto_181216 ) ( ON-TABLE ?auto_181217 ) ( ON ?auto_181214 ?auto_181215 ) ( ON ?auto_181213 ?auto_181214 ) ( CLEAR ?auto_181211 ) ( ON ?auto_181212 ?auto_181213 ) ( CLEAR ?auto_181212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181217 ?auto_181216 ?auto_181215 ?auto_181214 ?auto_181213 )
      ( MAKE-5PILE ?auto_181209 ?auto_181210 ?auto_181211 ?auto_181212 ?auto_181213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181218 - BLOCK
      ?auto_181219 - BLOCK
      ?auto_181220 - BLOCK
      ?auto_181221 - BLOCK
      ?auto_181222 - BLOCK
    )
    :vars
    (
      ?auto_181226 - BLOCK
      ?auto_181224 - BLOCK
      ?auto_181225 - BLOCK
      ?auto_181223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181218 ) ( ON ?auto_181219 ?auto_181218 ) ( not ( = ?auto_181218 ?auto_181219 ) ) ( not ( = ?auto_181218 ?auto_181220 ) ) ( not ( = ?auto_181218 ?auto_181221 ) ) ( not ( = ?auto_181218 ?auto_181222 ) ) ( not ( = ?auto_181218 ?auto_181226 ) ) ( not ( = ?auto_181219 ?auto_181220 ) ) ( not ( = ?auto_181219 ?auto_181221 ) ) ( not ( = ?auto_181219 ?auto_181222 ) ) ( not ( = ?auto_181219 ?auto_181226 ) ) ( not ( = ?auto_181220 ?auto_181221 ) ) ( not ( = ?auto_181220 ?auto_181222 ) ) ( not ( = ?auto_181220 ?auto_181226 ) ) ( not ( = ?auto_181221 ?auto_181222 ) ) ( not ( = ?auto_181221 ?auto_181226 ) ) ( not ( = ?auto_181222 ?auto_181226 ) ) ( not ( = ?auto_181218 ?auto_181224 ) ) ( not ( = ?auto_181218 ?auto_181225 ) ) ( not ( = ?auto_181219 ?auto_181224 ) ) ( not ( = ?auto_181219 ?auto_181225 ) ) ( not ( = ?auto_181220 ?auto_181224 ) ) ( not ( = ?auto_181220 ?auto_181225 ) ) ( not ( = ?auto_181221 ?auto_181224 ) ) ( not ( = ?auto_181221 ?auto_181225 ) ) ( not ( = ?auto_181222 ?auto_181224 ) ) ( not ( = ?auto_181222 ?auto_181225 ) ) ( not ( = ?auto_181226 ?auto_181224 ) ) ( not ( = ?auto_181226 ?auto_181225 ) ) ( not ( = ?auto_181224 ?auto_181225 ) ) ( ON ?auto_181225 ?auto_181223 ) ( not ( = ?auto_181218 ?auto_181223 ) ) ( not ( = ?auto_181219 ?auto_181223 ) ) ( not ( = ?auto_181220 ?auto_181223 ) ) ( not ( = ?auto_181221 ?auto_181223 ) ) ( not ( = ?auto_181222 ?auto_181223 ) ) ( not ( = ?auto_181226 ?auto_181223 ) ) ( not ( = ?auto_181224 ?auto_181223 ) ) ( not ( = ?auto_181225 ?auto_181223 ) ) ( ON ?auto_181224 ?auto_181225 ) ( ON-TABLE ?auto_181223 ) ( ON ?auto_181226 ?auto_181224 ) ( ON ?auto_181222 ?auto_181226 ) ( ON ?auto_181221 ?auto_181222 ) ( CLEAR ?auto_181221 ) ( HOLDING ?auto_181220 ) ( CLEAR ?auto_181219 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181218 ?auto_181219 ?auto_181220 )
      ( MAKE-5PILE ?auto_181218 ?auto_181219 ?auto_181220 ?auto_181221 ?auto_181222 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181227 - BLOCK
      ?auto_181228 - BLOCK
      ?auto_181229 - BLOCK
      ?auto_181230 - BLOCK
      ?auto_181231 - BLOCK
    )
    :vars
    (
      ?auto_181233 - BLOCK
      ?auto_181232 - BLOCK
      ?auto_181235 - BLOCK
      ?auto_181234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181227 ) ( ON ?auto_181228 ?auto_181227 ) ( not ( = ?auto_181227 ?auto_181228 ) ) ( not ( = ?auto_181227 ?auto_181229 ) ) ( not ( = ?auto_181227 ?auto_181230 ) ) ( not ( = ?auto_181227 ?auto_181231 ) ) ( not ( = ?auto_181227 ?auto_181233 ) ) ( not ( = ?auto_181228 ?auto_181229 ) ) ( not ( = ?auto_181228 ?auto_181230 ) ) ( not ( = ?auto_181228 ?auto_181231 ) ) ( not ( = ?auto_181228 ?auto_181233 ) ) ( not ( = ?auto_181229 ?auto_181230 ) ) ( not ( = ?auto_181229 ?auto_181231 ) ) ( not ( = ?auto_181229 ?auto_181233 ) ) ( not ( = ?auto_181230 ?auto_181231 ) ) ( not ( = ?auto_181230 ?auto_181233 ) ) ( not ( = ?auto_181231 ?auto_181233 ) ) ( not ( = ?auto_181227 ?auto_181232 ) ) ( not ( = ?auto_181227 ?auto_181235 ) ) ( not ( = ?auto_181228 ?auto_181232 ) ) ( not ( = ?auto_181228 ?auto_181235 ) ) ( not ( = ?auto_181229 ?auto_181232 ) ) ( not ( = ?auto_181229 ?auto_181235 ) ) ( not ( = ?auto_181230 ?auto_181232 ) ) ( not ( = ?auto_181230 ?auto_181235 ) ) ( not ( = ?auto_181231 ?auto_181232 ) ) ( not ( = ?auto_181231 ?auto_181235 ) ) ( not ( = ?auto_181233 ?auto_181232 ) ) ( not ( = ?auto_181233 ?auto_181235 ) ) ( not ( = ?auto_181232 ?auto_181235 ) ) ( ON ?auto_181235 ?auto_181234 ) ( not ( = ?auto_181227 ?auto_181234 ) ) ( not ( = ?auto_181228 ?auto_181234 ) ) ( not ( = ?auto_181229 ?auto_181234 ) ) ( not ( = ?auto_181230 ?auto_181234 ) ) ( not ( = ?auto_181231 ?auto_181234 ) ) ( not ( = ?auto_181233 ?auto_181234 ) ) ( not ( = ?auto_181232 ?auto_181234 ) ) ( not ( = ?auto_181235 ?auto_181234 ) ) ( ON ?auto_181232 ?auto_181235 ) ( ON-TABLE ?auto_181234 ) ( ON ?auto_181233 ?auto_181232 ) ( ON ?auto_181231 ?auto_181233 ) ( ON ?auto_181230 ?auto_181231 ) ( CLEAR ?auto_181228 ) ( ON ?auto_181229 ?auto_181230 ) ( CLEAR ?auto_181229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181234 ?auto_181235 ?auto_181232 ?auto_181233 ?auto_181231 ?auto_181230 )
      ( MAKE-5PILE ?auto_181227 ?auto_181228 ?auto_181229 ?auto_181230 ?auto_181231 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181236 - BLOCK
      ?auto_181237 - BLOCK
      ?auto_181238 - BLOCK
      ?auto_181239 - BLOCK
      ?auto_181240 - BLOCK
    )
    :vars
    (
      ?auto_181241 - BLOCK
      ?auto_181244 - BLOCK
      ?auto_181243 - BLOCK
      ?auto_181242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181236 ) ( not ( = ?auto_181236 ?auto_181237 ) ) ( not ( = ?auto_181236 ?auto_181238 ) ) ( not ( = ?auto_181236 ?auto_181239 ) ) ( not ( = ?auto_181236 ?auto_181240 ) ) ( not ( = ?auto_181236 ?auto_181241 ) ) ( not ( = ?auto_181237 ?auto_181238 ) ) ( not ( = ?auto_181237 ?auto_181239 ) ) ( not ( = ?auto_181237 ?auto_181240 ) ) ( not ( = ?auto_181237 ?auto_181241 ) ) ( not ( = ?auto_181238 ?auto_181239 ) ) ( not ( = ?auto_181238 ?auto_181240 ) ) ( not ( = ?auto_181238 ?auto_181241 ) ) ( not ( = ?auto_181239 ?auto_181240 ) ) ( not ( = ?auto_181239 ?auto_181241 ) ) ( not ( = ?auto_181240 ?auto_181241 ) ) ( not ( = ?auto_181236 ?auto_181244 ) ) ( not ( = ?auto_181236 ?auto_181243 ) ) ( not ( = ?auto_181237 ?auto_181244 ) ) ( not ( = ?auto_181237 ?auto_181243 ) ) ( not ( = ?auto_181238 ?auto_181244 ) ) ( not ( = ?auto_181238 ?auto_181243 ) ) ( not ( = ?auto_181239 ?auto_181244 ) ) ( not ( = ?auto_181239 ?auto_181243 ) ) ( not ( = ?auto_181240 ?auto_181244 ) ) ( not ( = ?auto_181240 ?auto_181243 ) ) ( not ( = ?auto_181241 ?auto_181244 ) ) ( not ( = ?auto_181241 ?auto_181243 ) ) ( not ( = ?auto_181244 ?auto_181243 ) ) ( ON ?auto_181243 ?auto_181242 ) ( not ( = ?auto_181236 ?auto_181242 ) ) ( not ( = ?auto_181237 ?auto_181242 ) ) ( not ( = ?auto_181238 ?auto_181242 ) ) ( not ( = ?auto_181239 ?auto_181242 ) ) ( not ( = ?auto_181240 ?auto_181242 ) ) ( not ( = ?auto_181241 ?auto_181242 ) ) ( not ( = ?auto_181244 ?auto_181242 ) ) ( not ( = ?auto_181243 ?auto_181242 ) ) ( ON ?auto_181244 ?auto_181243 ) ( ON-TABLE ?auto_181242 ) ( ON ?auto_181241 ?auto_181244 ) ( ON ?auto_181240 ?auto_181241 ) ( ON ?auto_181239 ?auto_181240 ) ( ON ?auto_181238 ?auto_181239 ) ( CLEAR ?auto_181238 ) ( HOLDING ?auto_181237 ) ( CLEAR ?auto_181236 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181236 ?auto_181237 )
      ( MAKE-5PILE ?auto_181236 ?auto_181237 ?auto_181238 ?auto_181239 ?auto_181240 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181245 - BLOCK
      ?auto_181246 - BLOCK
      ?auto_181247 - BLOCK
      ?auto_181248 - BLOCK
      ?auto_181249 - BLOCK
    )
    :vars
    (
      ?auto_181250 - BLOCK
      ?auto_181252 - BLOCK
      ?auto_181251 - BLOCK
      ?auto_181253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181245 ) ( not ( = ?auto_181245 ?auto_181246 ) ) ( not ( = ?auto_181245 ?auto_181247 ) ) ( not ( = ?auto_181245 ?auto_181248 ) ) ( not ( = ?auto_181245 ?auto_181249 ) ) ( not ( = ?auto_181245 ?auto_181250 ) ) ( not ( = ?auto_181246 ?auto_181247 ) ) ( not ( = ?auto_181246 ?auto_181248 ) ) ( not ( = ?auto_181246 ?auto_181249 ) ) ( not ( = ?auto_181246 ?auto_181250 ) ) ( not ( = ?auto_181247 ?auto_181248 ) ) ( not ( = ?auto_181247 ?auto_181249 ) ) ( not ( = ?auto_181247 ?auto_181250 ) ) ( not ( = ?auto_181248 ?auto_181249 ) ) ( not ( = ?auto_181248 ?auto_181250 ) ) ( not ( = ?auto_181249 ?auto_181250 ) ) ( not ( = ?auto_181245 ?auto_181252 ) ) ( not ( = ?auto_181245 ?auto_181251 ) ) ( not ( = ?auto_181246 ?auto_181252 ) ) ( not ( = ?auto_181246 ?auto_181251 ) ) ( not ( = ?auto_181247 ?auto_181252 ) ) ( not ( = ?auto_181247 ?auto_181251 ) ) ( not ( = ?auto_181248 ?auto_181252 ) ) ( not ( = ?auto_181248 ?auto_181251 ) ) ( not ( = ?auto_181249 ?auto_181252 ) ) ( not ( = ?auto_181249 ?auto_181251 ) ) ( not ( = ?auto_181250 ?auto_181252 ) ) ( not ( = ?auto_181250 ?auto_181251 ) ) ( not ( = ?auto_181252 ?auto_181251 ) ) ( ON ?auto_181251 ?auto_181253 ) ( not ( = ?auto_181245 ?auto_181253 ) ) ( not ( = ?auto_181246 ?auto_181253 ) ) ( not ( = ?auto_181247 ?auto_181253 ) ) ( not ( = ?auto_181248 ?auto_181253 ) ) ( not ( = ?auto_181249 ?auto_181253 ) ) ( not ( = ?auto_181250 ?auto_181253 ) ) ( not ( = ?auto_181252 ?auto_181253 ) ) ( not ( = ?auto_181251 ?auto_181253 ) ) ( ON ?auto_181252 ?auto_181251 ) ( ON-TABLE ?auto_181253 ) ( ON ?auto_181250 ?auto_181252 ) ( ON ?auto_181249 ?auto_181250 ) ( ON ?auto_181248 ?auto_181249 ) ( ON ?auto_181247 ?auto_181248 ) ( CLEAR ?auto_181245 ) ( ON ?auto_181246 ?auto_181247 ) ( CLEAR ?auto_181246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181253 ?auto_181251 ?auto_181252 ?auto_181250 ?auto_181249 ?auto_181248 ?auto_181247 )
      ( MAKE-5PILE ?auto_181245 ?auto_181246 ?auto_181247 ?auto_181248 ?auto_181249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181254 - BLOCK
      ?auto_181255 - BLOCK
      ?auto_181256 - BLOCK
      ?auto_181257 - BLOCK
      ?auto_181258 - BLOCK
    )
    :vars
    (
      ?auto_181261 - BLOCK
      ?auto_181260 - BLOCK
      ?auto_181262 - BLOCK
      ?auto_181259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181254 ?auto_181255 ) ) ( not ( = ?auto_181254 ?auto_181256 ) ) ( not ( = ?auto_181254 ?auto_181257 ) ) ( not ( = ?auto_181254 ?auto_181258 ) ) ( not ( = ?auto_181254 ?auto_181261 ) ) ( not ( = ?auto_181255 ?auto_181256 ) ) ( not ( = ?auto_181255 ?auto_181257 ) ) ( not ( = ?auto_181255 ?auto_181258 ) ) ( not ( = ?auto_181255 ?auto_181261 ) ) ( not ( = ?auto_181256 ?auto_181257 ) ) ( not ( = ?auto_181256 ?auto_181258 ) ) ( not ( = ?auto_181256 ?auto_181261 ) ) ( not ( = ?auto_181257 ?auto_181258 ) ) ( not ( = ?auto_181257 ?auto_181261 ) ) ( not ( = ?auto_181258 ?auto_181261 ) ) ( not ( = ?auto_181254 ?auto_181260 ) ) ( not ( = ?auto_181254 ?auto_181262 ) ) ( not ( = ?auto_181255 ?auto_181260 ) ) ( not ( = ?auto_181255 ?auto_181262 ) ) ( not ( = ?auto_181256 ?auto_181260 ) ) ( not ( = ?auto_181256 ?auto_181262 ) ) ( not ( = ?auto_181257 ?auto_181260 ) ) ( not ( = ?auto_181257 ?auto_181262 ) ) ( not ( = ?auto_181258 ?auto_181260 ) ) ( not ( = ?auto_181258 ?auto_181262 ) ) ( not ( = ?auto_181261 ?auto_181260 ) ) ( not ( = ?auto_181261 ?auto_181262 ) ) ( not ( = ?auto_181260 ?auto_181262 ) ) ( ON ?auto_181262 ?auto_181259 ) ( not ( = ?auto_181254 ?auto_181259 ) ) ( not ( = ?auto_181255 ?auto_181259 ) ) ( not ( = ?auto_181256 ?auto_181259 ) ) ( not ( = ?auto_181257 ?auto_181259 ) ) ( not ( = ?auto_181258 ?auto_181259 ) ) ( not ( = ?auto_181261 ?auto_181259 ) ) ( not ( = ?auto_181260 ?auto_181259 ) ) ( not ( = ?auto_181262 ?auto_181259 ) ) ( ON ?auto_181260 ?auto_181262 ) ( ON-TABLE ?auto_181259 ) ( ON ?auto_181261 ?auto_181260 ) ( ON ?auto_181258 ?auto_181261 ) ( ON ?auto_181257 ?auto_181258 ) ( ON ?auto_181256 ?auto_181257 ) ( ON ?auto_181255 ?auto_181256 ) ( CLEAR ?auto_181255 ) ( HOLDING ?auto_181254 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181254 )
      ( MAKE-5PILE ?auto_181254 ?auto_181255 ?auto_181256 ?auto_181257 ?auto_181258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181263 - BLOCK
      ?auto_181264 - BLOCK
      ?auto_181265 - BLOCK
      ?auto_181266 - BLOCK
      ?auto_181267 - BLOCK
    )
    :vars
    (
      ?auto_181271 - BLOCK
      ?auto_181268 - BLOCK
      ?auto_181270 - BLOCK
      ?auto_181269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181263 ?auto_181264 ) ) ( not ( = ?auto_181263 ?auto_181265 ) ) ( not ( = ?auto_181263 ?auto_181266 ) ) ( not ( = ?auto_181263 ?auto_181267 ) ) ( not ( = ?auto_181263 ?auto_181271 ) ) ( not ( = ?auto_181264 ?auto_181265 ) ) ( not ( = ?auto_181264 ?auto_181266 ) ) ( not ( = ?auto_181264 ?auto_181267 ) ) ( not ( = ?auto_181264 ?auto_181271 ) ) ( not ( = ?auto_181265 ?auto_181266 ) ) ( not ( = ?auto_181265 ?auto_181267 ) ) ( not ( = ?auto_181265 ?auto_181271 ) ) ( not ( = ?auto_181266 ?auto_181267 ) ) ( not ( = ?auto_181266 ?auto_181271 ) ) ( not ( = ?auto_181267 ?auto_181271 ) ) ( not ( = ?auto_181263 ?auto_181268 ) ) ( not ( = ?auto_181263 ?auto_181270 ) ) ( not ( = ?auto_181264 ?auto_181268 ) ) ( not ( = ?auto_181264 ?auto_181270 ) ) ( not ( = ?auto_181265 ?auto_181268 ) ) ( not ( = ?auto_181265 ?auto_181270 ) ) ( not ( = ?auto_181266 ?auto_181268 ) ) ( not ( = ?auto_181266 ?auto_181270 ) ) ( not ( = ?auto_181267 ?auto_181268 ) ) ( not ( = ?auto_181267 ?auto_181270 ) ) ( not ( = ?auto_181271 ?auto_181268 ) ) ( not ( = ?auto_181271 ?auto_181270 ) ) ( not ( = ?auto_181268 ?auto_181270 ) ) ( ON ?auto_181270 ?auto_181269 ) ( not ( = ?auto_181263 ?auto_181269 ) ) ( not ( = ?auto_181264 ?auto_181269 ) ) ( not ( = ?auto_181265 ?auto_181269 ) ) ( not ( = ?auto_181266 ?auto_181269 ) ) ( not ( = ?auto_181267 ?auto_181269 ) ) ( not ( = ?auto_181271 ?auto_181269 ) ) ( not ( = ?auto_181268 ?auto_181269 ) ) ( not ( = ?auto_181270 ?auto_181269 ) ) ( ON ?auto_181268 ?auto_181270 ) ( ON-TABLE ?auto_181269 ) ( ON ?auto_181271 ?auto_181268 ) ( ON ?auto_181267 ?auto_181271 ) ( ON ?auto_181266 ?auto_181267 ) ( ON ?auto_181265 ?auto_181266 ) ( ON ?auto_181264 ?auto_181265 ) ( ON ?auto_181263 ?auto_181264 ) ( CLEAR ?auto_181263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181269 ?auto_181270 ?auto_181268 ?auto_181271 ?auto_181267 ?auto_181266 ?auto_181265 ?auto_181264 )
      ( MAKE-5PILE ?auto_181263 ?auto_181264 ?auto_181265 ?auto_181266 ?auto_181267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181275 - BLOCK
      ?auto_181276 - BLOCK
      ?auto_181277 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_181277 ) ( CLEAR ?auto_181276 ) ( ON-TABLE ?auto_181275 ) ( ON ?auto_181276 ?auto_181275 ) ( not ( = ?auto_181275 ?auto_181276 ) ) ( not ( = ?auto_181275 ?auto_181277 ) ) ( not ( = ?auto_181276 ?auto_181277 ) ) )
    :subtasks
    ( ( !STACK ?auto_181277 ?auto_181276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181278 - BLOCK
      ?auto_181279 - BLOCK
      ?auto_181280 - BLOCK
    )
    :vars
    (
      ?auto_181281 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181279 ) ( ON-TABLE ?auto_181278 ) ( ON ?auto_181279 ?auto_181278 ) ( not ( = ?auto_181278 ?auto_181279 ) ) ( not ( = ?auto_181278 ?auto_181280 ) ) ( not ( = ?auto_181279 ?auto_181280 ) ) ( ON ?auto_181280 ?auto_181281 ) ( CLEAR ?auto_181280 ) ( HAND-EMPTY ) ( not ( = ?auto_181278 ?auto_181281 ) ) ( not ( = ?auto_181279 ?auto_181281 ) ) ( not ( = ?auto_181280 ?auto_181281 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181280 ?auto_181281 )
      ( MAKE-3PILE ?auto_181278 ?auto_181279 ?auto_181280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181282 - BLOCK
      ?auto_181283 - BLOCK
      ?auto_181284 - BLOCK
    )
    :vars
    (
      ?auto_181285 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181282 ) ( not ( = ?auto_181282 ?auto_181283 ) ) ( not ( = ?auto_181282 ?auto_181284 ) ) ( not ( = ?auto_181283 ?auto_181284 ) ) ( ON ?auto_181284 ?auto_181285 ) ( CLEAR ?auto_181284 ) ( not ( = ?auto_181282 ?auto_181285 ) ) ( not ( = ?auto_181283 ?auto_181285 ) ) ( not ( = ?auto_181284 ?auto_181285 ) ) ( HOLDING ?auto_181283 ) ( CLEAR ?auto_181282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181282 ?auto_181283 )
      ( MAKE-3PILE ?auto_181282 ?auto_181283 ?auto_181284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181286 - BLOCK
      ?auto_181287 - BLOCK
      ?auto_181288 - BLOCK
    )
    :vars
    (
      ?auto_181289 - BLOCK
      ?auto_181292 - BLOCK
      ?auto_181293 - BLOCK
      ?auto_181290 - BLOCK
      ?auto_181291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181286 ) ( not ( = ?auto_181286 ?auto_181287 ) ) ( not ( = ?auto_181286 ?auto_181288 ) ) ( not ( = ?auto_181287 ?auto_181288 ) ) ( ON ?auto_181288 ?auto_181289 ) ( not ( = ?auto_181286 ?auto_181289 ) ) ( not ( = ?auto_181287 ?auto_181289 ) ) ( not ( = ?auto_181288 ?auto_181289 ) ) ( CLEAR ?auto_181286 ) ( ON ?auto_181287 ?auto_181288 ) ( CLEAR ?auto_181287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181292 ) ( ON ?auto_181293 ?auto_181292 ) ( ON ?auto_181290 ?auto_181293 ) ( ON ?auto_181291 ?auto_181290 ) ( ON ?auto_181289 ?auto_181291 ) ( not ( = ?auto_181292 ?auto_181293 ) ) ( not ( = ?auto_181292 ?auto_181290 ) ) ( not ( = ?auto_181292 ?auto_181291 ) ) ( not ( = ?auto_181292 ?auto_181289 ) ) ( not ( = ?auto_181292 ?auto_181288 ) ) ( not ( = ?auto_181292 ?auto_181287 ) ) ( not ( = ?auto_181293 ?auto_181290 ) ) ( not ( = ?auto_181293 ?auto_181291 ) ) ( not ( = ?auto_181293 ?auto_181289 ) ) ( not ( = ?auto_181293 ?auto_181288 ) ) ( not ( = ?auto_181293 ?auto_181287 ) ) ( not ( = ?auto_181290 ?auto_181291 ) ) ( not ( = ?auto_181290 ?auto_181289 ) ) ( not ( = ?auto_181290 ?auto_181288 ) ) ( not ( = ?auto_181290 ?auto_181287 ) ) ( not ( = ?auto_181291 ?auto_181289 ) ) ( not ( = ?auto_181291 ?auto_181288 ) ) ( not ( = ?auto_181291 ?auto_181287 ) ) ( not ( = ?auto_181286 ?auto_181292 ) ) ( not ( = ?auto_181286 ?auto_181293 ) ) ( not ( = ?auto_181286 ?auto_181290 ) ) ( not ( = ?auto_181286 ?auto_181291 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181292 ?auto_181293 ?auto_181290 ?auto_181291 ?auto_181289 ?auto_181288 )
      ( MAKE-3PILE ?auto_181286 ?auto_181287 ?auto_181288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181294 - BLOCK
      ?auto_181295 - BLOCK
      ?auto_181296 - BLOCK
    )
    :vars
    (
      ?auto_181299 - BLOCK
      ?auto_181300 - BLOCK
      ?auto_181297 - BLOCK
      ?auto_181298 - BLOCK
      ?auto_181301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181294 ?auto_181295 ) ) ( not ( = ?auto_181294 ?auto_181296 ) ) ( not ( = ?auto_181295 ?auto_181296 ) ) ( ON ?auto_181296 ?auto_181299 ) ( not ( = ?auto_181294 ?auto_181299 ) ) ( not ( = ?auto_181295 ?auto_181299 ) ) ( not ( = ?auto_181296 ?auto_181299 ) ) ( ON ?auto_181295 ?auto_181296 ) ( CLEAR ?auto_181295 ) ( ON-TABLE ?auto_181300 ) ( ON ?auto_181297 ?auto_181300 ) ( ON ?auto_181298 ?auto_181297 ) ( ON ?auto_181301 ?auto_181298 ) ( ON ?auto_181299 ?auto_181301 ) ( not ( = ?auto_181300 ?auto_181297 ) ) ( not ( = ?auto_181300 ?auto_181298 ) ) ( not ( = ?auto_181300 ?auto_181301 ) ) ( not ( = ?auto_181300 ?auto_181299 ) ) ( not ( = ?auto_181300 ?auto_181296 ) ) ( not ( = ?auto_181300 ?auto_181295 ) ) ( not ( = ?auto_181297 ?auto_181298 ) ) ( not ( = ?auto_181297 ?auto_181301 ) ) ( not ( = ?auto_181297 ?auto_181299 ) ) ( not ( = ?auto_181297 ?auto_181296 ) ) ( not ( = ?auto_181297 ?auto_181295 ) ) ( not ( = ?auto_181298 ?auto_181301 ) ) ( not ( = ?auto_181298 ?auto_181299 ) ) ( not ( = ?auto_181298 ?auto_181296 ) ) ( not ( = ?auto_181298 ?auto_181295 ) ) ( not ( = ?auto_181301 ?auto_181299 ) ) ( not ( = ?auto_181301 ?auto_181296 ) ) ( not ( = ?auto_181301 ?auto_181295 ) ) ( not ( = ?auto_181294 ?auto_181300 ) ) ( not ( = ?auto_181294 ?auto_181297 ) ) ( not ( = ?auto_181294 ?auto_181298 ) ) ( not ( = ?auto_181294 ?auto_181301 ) ) ( HOLDING ?auto_181294 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181294 )
      ( MAKE-3PILE ?auto_181294 ?auto_181295 ?auto_181296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181302 - BLOCK
      ?auto_181303 - BLOCK
      ?auto_181304 - BLOCK
    )
    :vars
    (
      ?auto_181308 - BLOCK
      ?auto_181306 - BLOCK
      ?auto_181307 - BLOCK
      ?auto_181305 - BLOCK
      ?auto_181309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181302 ?auto_181303 ) ) ( not ( = ?auto_181302 ?auto_181304 ) ) ( not ( = ?auto_181303 ?auto_181304 ) ) ( ON ?auto_181304 ?auto_181308 ) ( not ( = ?auto_181302 ?auto_181308 ) ) ( not ( = ?auto_181303 ?auto_181308 ) ) ( not ( = ?auto_181304 ?auto_181308 ) ) ( ON ?auto_181303 ?auto_181304 ) ( ON-TABLE ?auto_181306 ) ( ON ?auto_181307 ?auto_181306 ) ( ON ?auto_181305 ?auto_181307 ) ( ON ?auto_181309 ?auto_181305 ) ( ON ?auto_181308 ?auto_181309 ) ( not ( = ?auto_181306 ?auto_181307 ) ) ( not ( = ?auto_181306 ?auto_181305 ) ) ( not ( = ?auto_181306 ?auto_181309 ) ) ( not ( = ?auto_181306 ?auto_181308 ) ) ( not ( = ?auto_181306 ?auto_181304 ) ) ( not ( = ?auto_181306 ?auto_181303 ) ) ( not ( = ?auto_181307 ?auto_181305 ) ) ( not ( = ?auto_181307 ?auto_181309 ) ) ( not ( = ?auto_181307 ?auto_181308 ) ) ( not ( = ?auto_181307 ?auto_181304 ) ) ( not ( = ?auto_181307 ?auto_181303 ) ) ( not ( = ?auto_181305 ?auto_181309 ) ) ( not ( = ?auto_181305 ?auto_181308 ) ) ( not ( = ?auto_181305 ?auto_181304 ) ) ( not ( = ?auto_181305 ?auto_181303 ) ) ( not ( = ?auto_181309 ?auto_181308 ) ) ( not ( = ?auto_181309 ?auto_181304 ) ) ( not ( = ?auto_181309 ?auto_181303 ) ) ( not ( = ?auto_181302 ?auto_181306 ) ) ( not ( = ?auto_181302 ?auto_181307 ) ) ( not ( = ?auto_181302 ?auto_181305 ) ) ( not ( = ?auto_181302 ?auto_181309 ) ) ( ON ?auto_181302 ?auto_181303 ) ( CLEAR ?auto_181302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181306 ?auto_181307 ?auto_181305 ?auto_181309 ?auto_181308 ?auto_181304 ?auto_181303 )
      ( MAKE-3PILE ?auto_181302 ?auto_181303 ?auto_181304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181310 - BLOCK
      ?auto_181311 - BLOCK
      ?auto_181312 - BLOCK
    )
    :vars
    (
      ?auto_181317 - BLOCK
      ?auto_181315 - BLOCK
      ?auto_181313 - BLOCK
      ?auto_181316 - BLOCK
      ?auto_181314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181310 ?auto_181311 ) ) ( not ( = ?auto_181310 ?auto_181312 ) ) ( not ( = ?auto_181311 ?auto_181312 ) ) ( ON ?auto_181312 ?auto_181317 ) ( not ( = ?auto_181310 ?auto_181317 ) ) ( not ( = ?auto_181311 ?auto_181317 ) ) ( not ( = ?auto_181312 ?auto_181317 ) ) ( ON ?auto_181311 ?auto_181312 ) ( ON-TABLE ?auto_181315 ) ( ON ?auto_181313 ?auto_181315 ) ( ON ?auto_181316 ?auto_181313 ) ( ON ?auto_181314 ?auto_181316 ) ( ON ?auto_181317 ?auto_181314 ) ( not ( = ?auto_181315 ?auto_181313 ) ) ( not ( = ?auto_181315 ?auto_181316 ) ) ( not ( = ?auto_181315 ?auto_181314 ) ) ( not ( = ?auto_181315 ?auto_181317 ) ) ( not ( = ?auto_181315 ?auto_181312 ) ) ( not ( = ?auto_181315 ?auto_181311 ) ) ( not ( = ?auto_181313 ?auto_181316 ) ) ( not ( = ?auto_181313 ?auto_181314 ) ) ( not ( = ?auto_181313 ?auto_181317 ) ) ( not ( = ?auto_181313 ?auto_181312 ) ) ( not ( = ?auto_181313 ?auto_181311 ) ) ( not ( = ?auto_181316 ?auto_181314 ) ) ( not ( = ?auto_181316 ?auto_181317 ) ) ( not ( = ?auto_181316 ?auto_181312 ) ) ( not ( = ?auto_181316 ?auto_181311 ) ) ( not ( = ?auto_181314 ?auto_181317 ) ) ( not ( = ?auto_181314 ?auto_181312 ) ) ( not ( = ?auto_181314 ?auto_181311 ) ) ( not ( = ?auto_181310 ?auto_181315 ) ) ( not ( = ?auto_181310 ?auto_181313 ) ) ( not ( = ?auto_181310 ?auto_181316 ) ) ( not ( = ?auto_181310 ?auto_181314 ) ) ( HOLDING ?auto_181310 ) ( CLEAR ?auto_181311 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181315 ?auto_181313 ?auto_181316 ?auto_181314 ?auto_181317 ?auto_181312 ?auto_181311 ?auto_181310 )
      ( MAKE-3PILE ?auto_181310 ?auto_181311 ?auto_181312 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181318 - BLOCK
      ?auto_181319 - BLOCK
      ?auto_181320 - BLOCK
    )
    :vars
    (
      ?auto_181324 - BLOCK
      ?auto_181322 - BLOCK
      ?auto_181323 - BLOCK
      ?auto_181321 - BLOCK
      ?auto_181325 - BLOCK
      ?auto_181326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181318 ?auto_181319 ) ) ( not ( = ?auto_181318 ?auto_181320 ) ) ( not ( = ?auto_181319 ?auto_181320 ) ) ( ON ?auto_181320 ?auto_181324 ) ( not ( = ?auto_181318 ?auto_181324 ) ) ( not ( = ?auto_181319 ?auto_181324 ) ) ( not ( = ?auto_181320 ?auto_181324 ) ) ( ON ?auto_181319 ?auto_181320 ) ( ON-TABLE ?auto_181322 ) ( ON ?auto_181323 ?auto_181322 ) ( ON ?auto_181321 ?auto_181323 ) ( ON ?auto_181325 ?auto_181321 ) ( ON ?auto_181324 ?auto_181325 ) ( not ( = ?auto_181322 ?auto_181323 ) ) ( not ( = ?auto_181322 ?auto_181321 ) ) ( not ( = ?auto_181322 ?auto_181325 ) ) ( not ( = ?auto_181322 ?auto_181324 ) ) ( not ( = ?auto_181322 ?auto_181320 ) ) ( not ( = ?auto_181322 ?auto_181319 ) ) ( not ( = ?auto_181323 ?auto_181321 ) ) ( not ( = ?auto_181323 ?auto_181325 ) ) ( not ( = ?auto_181323 ?auto_181324 ) ) ( not ( = ?auto_181323 ?auto_181320 ) ) ( not ( = ?auto_181323 ?auto_181319 ) ) ( not ( = ?auto_181321 ?auto_181325 ) ) ( not ( = ?auto_181321 ?auto_181324 ) ) ( not ( = ?auto_181321 ?auto_181320 ) ) ( not ( = ?auto_181321 ?auto_181319 ) ) ( not ( = ?auto_181325 ?auto_181324 ) ) ( not ( = ?auto_181325 ?auto_181320 ) ) ( not ( = ?auto_181325 ?auto_181319 ) ) ( not ( = ?auto_181318 ?auto_181322 ) ) ( not ( = ?auto_181318 ?auto_181323 ) ) ( not ( = ?auto_181318 ?auto_181321 ) ) ( not ( = ?auto_181318 ?auto_181325 ) ) ( CLEAR ?auto_181319 ) ( ON ?auto_181318 ?auto_181326 ) ( CLEAR ?auto_181318 ) ( HAND-EMPTY ) ( not ( = ?auto_181318 ?auto_181326 ) ) ( not ( = ?auto_181319 ?auto_181326 ) ) ( not ( = ?auto_181320 ?auto_181326 ) ) ( not ( = ?auto_181324 ?auto_181326 ) ) ( not ( = ?auto_181322 ?auto_181326 ) ) ( not ( = ?auto_181323 ?auto_181326 ) ) ( not ( = ?auto_181321 ?auto_181326 ) ) ( not ( = ?auto_181325 ?auto_181326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181318 ?auto_181326 )
      ( MAKE-3PILE ?auto_181318 ?auto_181319 ?auto_181320 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181327 - BLOCK
      ?auto_181328 - BLOCK
      ?auto_181329 - BLOCK
    )
    :vars
    (
      ?auto_181331 - BLOCK
      ?auto_181333 - BLOCK
      ?auto_181334 - BLOCK
      ?auto_181330 - BLOCK
      ?auto_181335 - BLOCK
      ?auto_181332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181327 ?auto_181328 ) ) ( not ( = ?auto_181327 ?auto_181329 ) ) ( not ( = ?auto_181328 ?auto_181329 ) ) ( ON ?auto_181329 ?auto_181331 ) ( not ( = ?auto_181327 ?auto_181331 ) ) ( not ( = ?auto_181328 ?auto_181331 ) ) ( not ( = ?auto_181329 ?auto_181331 ) ) ( ON-TABLE ?auto_181333 ) ( ON ?auto_181334 ?auto_181333 ) ( ON ?auto_181330 ?auto_181334 ) ( ON ?auto_181335 ?auto_181330 ) ( ON ?auto_181331 ?auto_181335 ) ( not ( = ?auto_181333 ?auto_181334 ) ) ( not ( = ?auto_181333 ?auto_181330 ) ) ( not ( = ?auto_181333 ?auto_181335 ) ) ( not ( = ?auto_181333 ?auto_181331 ) ) ( not ( = ?auto_181333 ?auto_181329 ) ) ( not ( = ?auto_181333 ?auto_181328 ) ) ( not ( = ?auto_181334 ?auto_181330 ) ) ( not ( = ?auto_181334 ?auto_181335 ) ) ( not ( = ?auto_181334 ?auto_181331 ) ) ( not ( = ?auto_181334 ?auto_181329 ) ) ( not ( = ?auto_181334 ?auto_181328 ) ) ( not ( = ?auto_181330 ?auto_181335 ) ) ( not ( = ?auto_181330 ?auto_181331 ) ) ( not ( = ?auto_181330 ?auto_181329 ) ) ( not ( = ?auto_181330 ?auto_181328 ) ) ( not ( = ?auto_181335 ?auto_181331 ) ) ( not ( = ?auto_181335 ?auto_181329 ) ) ( not ( = ?auto_181335 ?auto_181328 ) ) ( not ( = ?auto_181327 ?auto_181333 ) ) ( not ( = ?auto_181327 ?auto_181334 ) ) ( not ( = ?auto_181327 ?auto_181330 ) ) ( not ( = ?auto_181327 ?auto_181335 ) ) ( ON ?auto_181327 ?auto_181332 ) ( CLEAR ?auto_181327 ) ( not ( = ?auto_181327 ?auto_181332 ) ) ( not ( = ?auto_181328 ?auto_181332 ) ) ( not ( = ?auto_181329 ?auto_181332 ) ) ( not ( = ?auto_181331 ?auto_181332 ) ) ( not ( = ?auto_181333 ?auto_181332 ) ) ( not ( = ?auto_181334 ?auto_181332 ) ) ( not ( = ?auto_181330 ?auto_181332 ) ) ( not ( = ?auto_181335 ?auto_181332 ) ) ( HOLDING ?auto_181328 ) ( CLEAR ?auto_181329 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181333 ?auto_181334 ?auto_181330 ?auto_181335 ?auto_181331 ?auto_181329 ?auto_181328 )
      ( MAKE-3PILE ?auto_181327 ?auto_181328 ?auto_181329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181336 - BLOCK
      ?auto_181337 - BLOCK
      ?auto_181338 - BLOCK
    )
    :vars
    (
      ?auto_181339 - BLOCK
      ?auto_181343 - BLOCK
      ?auto_181340 - BLOCK
      ?auto_181344 - BLOCK
      ?auto_181341 - BLOCK
      ?auto_181342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181336 ?auto_181337 ) ) ( not ( = ?auto_181336 ?auto_181338 ) ) ( not ( = ?auto_181337 ?auto_181338 ) ) ( ON ?auto_181338 ?auto_181339 ) ( not ( = ?auto_181336 ?auto_181339 ) ) ( not ( = ?auto_181337 ?auto_181339 ) ) ( not ( = ?auto_181338 ?auto_181339 ) ) ( ON-TABLE ?auto_181343 ) ( ON ?auto_181340 ?auto_181343 ) ( ON ?auto_181344 ?auto_181340 ) ( ON ?auto_181341 ?auto_181344 ) ( ON ?auto_181339 ?auto_181341 ) ( not ( = ?auto_181343 ?auto_181340 ) ) ( not ( = ?auto_181343 ?auto_181344 ) ) ( not ( = ?auto_181343 ?auto_181341 ) ) ( not ( = ?auto_181343 ?auto_181339 ) ) ( not ( = ?auto_181343 ?auto_181338 ) ) ( not ( = ?auto_181343 ?auto_181337 ) ) ( not ( = ?auto_181340 ?auto_181344 ) ) ( not ( = ?auto_181340 ?auto_181341 ) ) ( not ( = ?auto_181340 ?auto_181339 ) ) ( not ( = ?auto_181340 ?auto_181338 ) ) ( not ( = ?auto_181340 ?auto_181337 ) ) ( not ( = ?auto_181344 ?auto_181341 ) ) ( not ( = ?auto_181344 ?auto_181339 ) ) ( not ( = ?auto_181344 ?auto_181338 ) ) ( not ( = ?auto_181344 ?auto_181337 ) ) ( not ( = ?auto_181341 ?auto_181339 ) ) ( not ( = ?auto_181341 ?auto_181338 ) ) ( not ( = ?auto_181341 ?auto_181337 ) ) ( not ( = ?auto_181336 ?auto_181343 ) ) ( not ( = ?auto_181336 ?auto_181340 ) ) ( not ( = ?auto_181336 ?auto_181344 ) ) ( not ( = ?auto_181336 ?auto_181341 ) ) ( ON ?auto_181336 ?auto_181342 ) ( not ( = ?auto_181336 ?auto_181342 ) ) ( not ( = ?auto_181337 ?auto_181342 ) ) ( not ( = ?auto_181338 ?auto_181342 ) ) ( not ( = ?auto_181339 ?auto_181342 ) ) ( not ( = ?auto_181343 ?auto_181342 ) ) ( not ( = ?auto_181340 ?auto_181342 ) ) ( not ( = ?auto_181344 ?auto_181342 ) ) ( not ( = ?auto_181341 ?auto_181342 ) ) ( CLEAR ?auto_181338 ) ( ON ?auto_181337 ?auto_181336 ) ( CLEAR ?auto_181337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181342 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181342 ?auto_181336 )
      ( MAKE-3PILE ?auto_181336 ?auto_181337 ?auto_181338 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181345 - BLOCK
      ?auto_181346 - BLOCK
      ?auto_181347 - BLOCK
    )
    :vars
    (
      ?auto_181349 - BLOCK
      ?auto_181348 - BLOCK
      ?auto_181352 - BLOCK
      ?auto_181350 - BLOCK
      ?auto_181353 - BLOCK
      ?auto_181351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181345 ?auto_181346 ) ) ( not ( = ?auto_181345 ?auto_181347 ) ) ( not ( = ?auto_181346 ?auto_181347 ) ) ( not ( = ?auto_181345 ?auto_181349 ) ) ( not ( = ?auto_181346 ?auto_181349 ) ) ( not ( = ?auto_181347 ?auto_181349 ) ) ( ON-TABLE ?auto_181348 ) ( ON ?auto_181352 ?auto_181348 ) ( ON ?auto_181350 ?auto_181352 ) ( ON ?auto_181353 ?auto_181350 ) ( ON ?auto_181349 ?auto_181353 ) ( not ( = ?auto_181348 ?auto_181352 ) ) ( not ( = ?auto_181348 ?auto_181350 ) ) ( not ( = ?auto_181348 ?auto_181353 ) ) ( not ( = ?auto_181348 ?auto_181349 ) ) ( not ( = ?auto_181348 ?auto_181347 ) ) ( not ( = ?auto_181348 ?auto_181346 ) ) ( not ( = ?auto_181352 ?auto_181350 ) ) ( not ( = ?auto_181352 ?auto_181353 ) ) ( not ( = ?auto_181352 ?auto_181349 ) ) ( not ( = ?auto_181352 ?auto_181347 ) ) ( not ( = ?auto_181352 ?auto_181346 ) ) ( not ( = ?auto_181350 ?auto_181353 ) ) ( not ( = ?auto_181350 ?auto_181349 ) ) ( not ( = ?auto_181350 ?auto_181347 ) ) ( not ( = ?auto_181350 ?auto_181346 ) ) ( not ( = ?auto_181353 ?auto_181349 ) ) ( not ( = ?auto_181353 ?auto_181347 ) ) ( not ( = ?auto_181353 ?auto_181346 ) ) ( not ( = ?auto_181345 ?auto_181348 ) ) ( not ( = ?auto_181345 ?auto_181352 ) ) ( not ( = ?auto_181345 ?auto_181350 ) ) ( not ( = ?auto_181345 ?auto_181353 ) ) ( ON ?auto_181345 ?auto_181351 ) ( not ( = ?auto_181345 ?auto_181351 ) ) ( not ( = ?auto_181346 ?auto_181351 ) ) ( not ( = ?auto_181347 ?auto_181351 ) ) ( not ( = ?auto_181349 ?auto_181351 ) ) ( not ( = ?auto_181348 ?auto_181351 ) ) ( not ( = ?auto_181352 ?auto_181351 ) ) ( not ( = ?auto_181350 ?auto_181351 ) ) ( not ( = ?auto_181353 ?auto_181351 ) ) ( ON ?auto_181346 ?auto_181345 ) ( CLEAR ?auto_181346 ) ( ON-TABLE ?auto_181351 ) ( HOLDING ?auto_181347 ) ( CLEAR ?auto_181349 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181348 ?auto_181352 ?auto_181350 ?auto_181353 ?auto_181349 ?auto_181347 )
      ( MAKE-3PILE ?auto_181345 ?auto_181346 ?auto_181347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181354 - BLOCK
      ?auto_181355 - BLOCK
      ?auto_181356 - BLOCK
    )
    :vars
    (
      ?auto_181357 - BLOCK
      ?auto_181361 - BLOCK
      ?auto_181358 - BLOCK
      ?auto_181359 - BLOCK
      ?auto_181362 - BLOCK
      ?auto_181360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181354 ?auto_181355 ) ) ( not ( = ?auto_181354 ?auto_181356 ) ) ( not ( = ?auto_181355 ?auto_181356 ) ) ( not ( = ?auto_181354 ?auto_181357 ) ) ( not ( = ?auto_181355 ?auto_181357 ) ) ( not ( = ?auto_181356 ?auto_181357 ) ) ( ON-TABLE ?auto_181361 ) ( ON ?auto_181358 ?auto_181361 ) ( ON ?auto_181359 ?auto_181358 ) ( ON ?auto_181362 ?auto_181359 ) ( ON ?auto_181357 ?auto_181362 ) ( not ( = ?auto_181361 ?auto_181358 ) ) ( not ( = ?auto_181361 ?auto_181359 ) ) ( not ( = ?auto_181361 ?auto_181362 ) ) ( not ( = ?auto_181361 ?auto_181357 ) ) ( not ( = ?auto_181361 ?auto_181356 ) ) ( not ( = ?auto_181361 ?auto_181355 ) ) ( not ( = ?auto_181358 ?auto_181359 ) ) ( not ( = ?auto_181358 ?auto_181362 ) ) ( not ( = ?auto_181358 ?auto_181357 ) ) ( not ( = ?auto_181358 ?auto_181356 ) ) ( not ( = ?auto_181358 ?auto_181355 ) ) ( not ( = ?auto_181359 ?auto_181362 ) ) ( not ( = ?auto_181359 ?auto_181357 ) ) ( not ( = ?auto_181359 ?auto_181356 ) ) ( not ( = ?auto_181359 ?auto_181355 ) ) ( not ( = ?auto_181362 ?auto_181357 ) ) ( not ( = ?auto_181362 ?auto_181356 ) ) ( not ( = ?auto_181362 ?auto_181355 ) ) ( not ( = ?auto_181354 ?auto_181361 ) ) ( not ( = ?auto_181354 ?auto_181358 ) ) ( not ( = ?auto_181354 ?auto_181359 ) ) ( not ( = ?auto_181354 ?auto_181362 ) ) ( ON ?auto_181354 ?auto_181360 ) ( not ( = ?auto_181354 ?auto_181360 ) ) ( not ( = ?auto_181355 ?auto_181360 ) ) ( not ( = ?auto_181356 ?auto_181360 ) ) ( not ( = ?auto_181357 ?auto_181360 ) ) ( not ( = ?auto_181361 ?auto_181360 ) ) ( not ( = ?auto_181358 ?auto_181360 ) ) ( not ( = ?auto_181359 ?auto_181360 ) ) ( not ( = ?auto_181362 ?auto_181360 ) ) ( ON ?auto_181355 ?auto_181354 ) ( ON-TABLE ?auto_181360 ) ( CLEAR ?auto_181357 ) ( ON ?auto_181356 ?auto_181355 ) ( CLEAR ?auto_181356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181360 ?auto_181354 ?auto_181355 )
      ( MAKE-3PILE ?auto_181354 ?auto_181355 ?auto_181356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181363 - BLOCK
      ?auto_181364 - BLOCK
      ?auto_181365 - BLOCK
    )
    :vars
    (
      ?auto_181366 - BLOCK
      ?auto_181369 - BLOCK
      ?auto_181367 - BLOCK
      ?auto_181370 - BLOCK
      ?auto_181368 - BLOCK
      ?auto_181371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181363 ?auto_181364 ) ) ( not ( = ?auto_181363 ?auto_181365 ) ) ( not ( = ?auto_181364 ?auto_181365 ) ) ( not ( = ?auto_181363 ?auto_181366 ) ) ( not ( = ?auto_181364 ?auto_181366 ) ) ( not ( = ?auto_181365 ?auto_181366 ) ) ( ON-TABLE ?auto_181369 ) ( ON ?auto_181367 ?auto_181369 ) ( ON ?auto_181370 ?auto_181367 ) ( ON ?auto_181368 ?auto_181370 ) ( not ( = ?auto_181369 ?auto_181367 ) ) ( not ( = ?auto_181369 ?auto_181370 ) ) ( not ( = ?auto_181369 ?auto_181368 ) ) ( not ( = ?auto_181369 ?auto_181366 ) ) ( not ( = ?auto_181369 ?auto_181365 ) ) ( not ( = ?auto_181369 ?auto_181364 ) ) ( not ( = ?auto_181367 ?auto_181370 ) ) ( not ( = ?auto_181367 ?auto_181368 ) ) ( not ( = ?auto_181367 ?auto_181366 ) ) ( not ( = ?auto_181367 ?auto_181365 ) ) ( not ( = ?auto_181367 ?auto_181364 ) ) ( not ( = ?auto_181370 ?auto_181368 ) ) ( not ( = ?auto_181370 ?auto_181366 ) ) ( not ( = ?auto_181370 ?auto_181365 ) ) ( not ( = ?auto_181370 ?auto_181364 ) ) ( not ( = ?auto_181368 ?auto_181366 ) ) ( not ( = ?auto_181368 ?auto_181365 ) ) ( not ( = ?auto_181368 ?auto_181364 ) ) ( not ( = ?auto_181363 ?auto_181369 ) ) ( not ( = ?auto_181363 ?auto_181367 ) ) ( not ( = ?auto_181363 ?auto_181370 ) ) ( not ( = ?auto_181363 ?auto_181368 ) ) ( ON ?auto_181363 ?auto_181371 ) ( not ( = ?auto_181363 ?auto_181371 ) ) ( not ( = ?auto_181364 ?auto_181371 ) ) ( not ( = ?auto_181365 ?auto_181371 ) ) ( not ( = ?auto_181366 ?auto_181371 ) ) ( not ( = ?auto_181369 ?auto_181371 ) ) ( not ( = ?auto_181367 ?auto_181371 ) ) ( not ( = ?auto_181370 ?auto_181371 ) ) ( not ( = ?auto_181368 ?auto_181371 ) ) ( ON ?auto_181364 ?auto_181363 ) ( ON-TABLE ?auto_181371 ) ( ON ?auto_181365 ?auto_181364 ) ( CLEAR ?auto_181365 ) ( HOLDING ?auto_181366 ) ( CLEAR ?auto_181368 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181369 ?auto_181367 ?auto_181370 ?auto_181368 ?auto_181366 )
      ( MAKE-3PILE ?auto_181363 ?auto_181364 ?auto_181365 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181372 - BLOCK
      ?auto_181373 - BLOCK
      ?auto_181374 - BLOCK
    )
    :vars
    (
      ?auto_181375 - BLOCK
      ?auto_181376 - BLOCK
      ?auto_181379 - BLOCK
      ?auto_181378 - BLOCK
      ?auto_181380 - BLOCK
      ?auto_181377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181372 ?auto_181373 ) ) ( not ( = ?auto_181372 ?auto_181374 ) ) ( not ( = ?auto_181373 ?auto_181374 ) ) ( not ( = ?auto_181372 ?auto_181375 ) ) ( not ( = ?auto_181373 ?auto_181375 ) ) ( not ( = ?auto_181374 ?auto_181375 ) ) ( ON-TABLE ?auto_181376 ) ( ON ?auto_181379 ?auto_181376 ) ( ON ?auto_181378 ?auto_181379 ) ( ON ?auto_181380 ?auto_181378 ) ( not ( = ?auto_181376 ?auto_181379 ) ) ( not ( = ?auto_181376 ?auto_181378 ) ) ( not ( = ?auto_181376 ?auto_181380 ) ) ( not ( = ?auto_181376 ?auto_181375 ) ) ( not ( = ?auto_181376 ?auto_181374 ) ) ( not ( = ?auto_181376 ?auto_181373 ) ) ( not ( = ?auto_181379 ?auto_181378 ) ) ( not ( = ?auto_181379 ?auto_181380 ) ) ( not ( = ?auto_181379 ?auto_181375 ) ) ( not ( = ?auto_181379 ?auto_181374 ) ) ( not ( = ?auto_181379 ?auto_181373 ) ) ( not ( = ?auto_181378 ?auto_181380 ) ) ( not ( = ?auto_181378 ?auto_181375 ) ) ( not ( = ?auto_181378 ?auto_181374 ) ) ( not ( = ?auto_181378 ?auto_181373 ) ) ( not ( = ?auto_181380 ?auto_181375 ) ) ( not ( = ?auto_181380 ?auto_181374 ) ) ( not ( = ?auto_181380 ?auto_181373 ) ) ( not ( = ?auto_181372 ?auto_181376 ) ) ( not ( = ?auto_181372 ?auto_181379 ) ) ( not ( = ?auto_181372 ?auto_181378 ) ) ( not ( = ?auto_181372 ?auto_181380 ) ) ( ON ?auto_181372 ?auto_181377 ) ( not ( = ?auto_181372 ?auto_181377 ) ) ( not ( = ?auto_181373 ?auto_181377 ) ) ( not ( = ?auto_181374 ?auto_181377 ) ) ( not ( = ?auto_181375 ?auto_181377 ) ) ( not ( = ?auto_181376 ?auto_181377 ) ) ( not ( = ?auto_181379 ?auto_181377 ) ) ( not ( = ?auto_181378 ?auto_181377 ) ) ( not ( = ?auto_181380 ?auto_181377 ) ) ( ON ?auto_181373 ?auto_181372 ) ( ON-TABLE ?auto_181377 ) ( ON ?auto_181374 ?auto_181373 ) ( CLEAR ?auto_181380 ) ( ON ?auto_181375 ?auto_181374 ) ( CLEAR ?auto_181375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181377 ?auto_181372 ?auto_181373 ?auto_181374 )
      ( MAKE-3PILE ?auto_181372 ?auto_181373 ?auto_181374 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181381 - BLOCK
      ?auto_181382 - BLOCK
      ?auto_181383 - BLOCK
    )
    :vars
    (
      ?auto_181385 - BLOCK
      ?auto_181387 - BLOCK
      ?auto_181384 - BLOCK
      ?auto_181389 - BLOCK
      ?auto_181386 - BLOCK
      ?auto_181388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181381 ?auto_181382 ) ) ( not ( = ?auto_181381 ?auto_181383 ) ) ( not ( = ?auto_181382 ?auto_181383 ) ) ( not ( = ?auto_181381 ?auto_181385 ) ) ( not ( = ?auto_181382 ?auto_181385 ) ) ( not ( = ?auto_181383 ?auto_181385 ) ) ( ON-TABLE ?auto_181387 ) ( ON ?auto_181384 ?auto_181387 ) ( ON ?auto_181389 ?auto_181384 ) ( not ( = ?auto_181387 ?auto_181384 ) ) ( not ( = ?auto_181387 ?auto_181389 ) ) ( not ( = ?auto_181387 ?auto_181386 ) ) ( not ( = ?auto_181387 ?auto_181385 ) ) ( not ( = ?auto_181387 ?auto_181383 ) ) ( not ( = ?auto_181387 ?auto_181382 ) ) ( not ( = ?auto_181384 ?auto_181389 ) ) ( not ( = ?auto_181384 ?auto_181386 ) ) ( not ( = ?auto_181384 ?auto_181385 ) ) ( not ( = ?auto_181384 ?auto_181383 ) ) ( not ( = ?auto_181384 ?auto_181382 ) ) ( not ( = ?auto_181389 ?auto_181386 ) ) ( not ( = ?auto_181389 ?auto_181385 ) ) ( not ( = ?auto_181389 ?auto_181383 ) ) ( not ( = ?auto_181389 ?auto_181382 ) ) ( not ( = ?auto_181386 ?auto_181385 ) ) ( not ( = ?auto_181386 ?auto_181383 ) ) ( not ( = ?auto_181386 ?auto_181382 ) ) ( not ( = ?auto_181381 ?auto_181387 ) ) ( not ( = ?auto_181381 ?auto_181384 ) ) ( not ( = ?auto_181381 ?auto_181389 ) ) ( not ( = ?auto_181381 ?auto_181386 ) ) ( ON ?auto_181381 ?auto_181388 ) ( not ( = ?auto_181381 ?auto_181388 ) ) ( not ( = ?auto_181382 ?auto_181388 ) ) ( not ( = ?auto_181383 ?auto_181388 ) ) ( not ( = ?auto_181385 ?auto_181388 ) ) ( not ( = ?auto_181387 ?auto_181388 ) ) ( not ( = ?auto_181384 ?auto_181388 ) ) ( not ( = ?auto_181389 ?auto_181388 ) ) ( not ( = ?auto_181386 ?auto_181388 ) ) ( ON ?auto_181382 ?auto_181381 ) ( ON-TABLE ?auto_181388 ) ( ON ?auto_181383 ?auto_181382 ) ( ON ?auto_181385 ?auto_181383 ) ( CLEAR ?auto_181385 ) ( HOLDING ?auto_181386 ) ( CLEAR ?auto_181389 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181387 ?auto_181384 ?auto_181389 ?auto_181386 )
      ( MAKE-3PILE ?auto_181381 ?auto_181382 ?auto_181383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181390 - BLOCK
      ?auto_181391 - BLOCK
      ?auto_181392 - BLOCK
    )
    :vars
    (
      ?auto_181395 - BLOCK
      ?auto_181396 - BLOCK
      ?auto_181394 - BLOCK
      ?auto_181393 - BLOCK
      ?auto_181397 - BLOCK
      ?auto_181398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181390 ?auto_181391 ) ) ( not ( = ?auto_181390 ?auto_181392 ) ) ( not ( = ?auto_181391 ?auto_181392 ) ) ( not ( = ?auto_181390 ?auto_181395 ) ) ( not ( = ?auto_181391 ?auto_181395 ) ) ( not ( = ?auto_181392 ?auto_181395 ) ) ( ON-TABLE ?auto_181396 ) ( ON ?auto_181394 ?auto_181396 ) ( ON ?auto_181393 ?auto_181394 ) ( not ( = ?auto_181396 ?auto_181394 ) ) ( not ( = ?auto_181396 ?auto_181393 ) ) ( not ( = ?auto_181396 ?auto_181397 ) ) ( not ( = ?auto_181396 ?auto_181395 ) ) ( not ( = ?auto_181396 ?auto_181392 ) ) ( not ( = ?auto_181396 ?auto_181391 ) ) ( not ( = ?auto_181394 ?auto_181393 ) ) ( not ( = ?auto_181394 ?auto_181397 ) ) ( not ( = ?auto_181394 ?auto_181395 ) ) ( not ( = ?auto_181394 ?auto_181392 ) ) ( not ( = ?auto_181394 ?auto_181391 ) ) ( not ( = ?auto_181393 ?auto_181397 ) ) ( not ( = ?auto_181393 ?auto_181395 ) ) ( not ( = ?auto_181393 ?auto_181392 ) ) ( not ( = ?auto_181393 ?auto_181391 ) ) ( not ( = ?auto_181397 ?auto_181395 ) ) ( not ( = ?auto_181397 ?auto_181392 ) ) ( not ( = ?auto_181397 ?auto_181391 ) ) ( not ( = ?auto_181390 ?auto_181396 ) ) ( not ( = ?auto_181390 ?auto_181394 ) ) ( not ( = ?auto_181390 ?auto_181393 ) ) ( not ( = ?auto_181390 ?auto_181397 ) ) ( ON ?auto_181390 ?auto_181398 ) ( not ( = ?auto_181390 ?auto_181398 ) ) ( not ( = ?auto_181391 ?auto_181398 ) ) ( not ( = ?auto_181392 ?auto_181398 ) ) ( not ( = ?auto_181395 ?auto_181398 ) ) ( not ( = ?auto_181396 ?auto_181398 ) ) ( not ( = ?auto_181394 ?auto_181398 ) ) ( not ( = ?auto_181393 ?auto_181398 ) ) ( not ( = ?auto_181397 ?auto_181398 ) ) ( ON ?auto_181391 ?auto_181390 ) ( ON-TABLE ?auto_181398 ) ( ON ?auto_181392 ?auto_181391 ) ( ON ?auto_181395 ?auto_181392 ) ( CLEAR ?auto_181393 ) ( ON ?auto_181397 ?auto_181395 ) ( CLEAR ?auto_181397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181398 ?auto_181390 ?auto_181391 ?auto_181392 ?auto_181395 )
      ( MAKE-3PILE ?auto_181390 ?auto_181391 ?auto_181392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181399 - BLOCK
      ?auto_181400 - BLOCK
      ?auto_181401 - BLOCK
    )
    :vars
    (
      ?auto_181406 - BLOCK
      ?auto_181405 - BLOCK
      ?auto_181403 - BLOCK
      ?auto_181402 - BLOCK
      ?auto_181407 - BLOCK
      ?auto_181404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181399 ?auto_181400 ) ) ( not ( = ?auto_181399 ?auto_181401 ) ) ( not ( = ?auto_181400 ?auto_181401 ) ) ( not ( = ?auto_181399 ?auto_181406 ) ) ( not ( = ?auto_181400 ?auto_181406 ) ) ( not ( = ?auto_181401 ?auto_181406 ) ) ( ON-TABLE ?auto_181405 ) ( ON ?auto_181403 ?auto_181405 ) ( not ( = ?auto_181405 ?auto_181403 ) ) ( not ( = ?auto_181405 ?auto_181402 ) ) ( not ( = ?auto_181405 ?auto_181407 ) ) ( not ( = ?auto_181405 ?auto_181406 ) ) ( not ( = ?auto_181405 ?auto_181401 ) ) ( not ( = ?auto_181405 ?auto_181400 ) ) ( not ( = ?auto_181403 ?auto_181402 ) ) ( not ( = ?auto_181403 ?auto_181407 ) ) ( not ( = ?auto_181403 ?auto_181406 ) ) ( not ( = ?auto_181403 ?auto_181401 ) ) ( not ( = ?auto_181403 ?auto_181400 ) ) ( not ( = ?auto_181402 ?auto_181407 ) ) ( not ( = ?auto_181402 ?auto_181406 ) ) ( not ( = ?auto_181402 ?auto_181401 ) ) ( not ( = ?auto_181402 ?auto_181400 ) ) ( not ( = ?auto_181407 ?auto_181406 ) ) ( not ( = ?auto_181407 ?auto_181401 ) ) ( not ( = ?auto_181407 ?auto_181400 ) ) ( not ( = ?auto_181399 ?auto_181405 ) ) ( not ( = ?auto_181399 ?auto_181403 ) ) ( not ( = ?auto_181399 ?auto_181402 ) ) ( not ( = ?auto_181399 ?auto_181407 ) ) ( ON ?auto_181399 ?auto_181404 ) ( not ( = ?auto_181399 ?auto_181404 ) ) ( not ( = ?auto_181400 ?auto_181404 ) ) ( not ( = ?auto_181401 ?auto_181404 ) ) ( not ( = ?auto_181406 ?auto_181404 ) ) ( not ( = ?auto_181405 ?auto_181404 ) ) ( not ( = ?auto_181403 ?auto_181404 ) ) ( not ( = ?auto_181402 ?auto_181404 ) ) ( not ( = ?auto_181407 ?auto_181404 ) ) ( ON ?auto_181400 ?auto_181399 ) ( ON-TABLE ?auto_181404 ) ( ON ?auto_181401 ?auto_181400 ) ( ON ?auto_181406 ?auto_181401 ) ( ON ?auto_181407 ?auto_181406 ) ( CLEAR ?auto_181407 ) ( HOLDING ?auto_181402 ) ( CLEAR ?auto_181403 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181405 ?auto_181403 ?auto_181402 )
      ( MAKE-3PILE ?auto_181399 ?auto_181400 ?auto_181401 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181408 - BLOCK
      ?auto_181409 - BLOCK
      ?auto_181410 - BLOCK
    )
    :vars
    (
      ?auto_181413 - BLOCK
      ?auto_181411 - BLOCK
      ?auto_181414 - BLOCK
      ?auto_181416 - BLOCK
      ?auto_181412 - BLOCK
      ?auto_181415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181408 ?auto_181409 ) ) ( not ( = ?auto_181408 ?auto_181410 ) ) ( not ( = ?auto_181409 ?auto_181410 ) ) ( not ( = ?auto_181408 ?auto_181413 ) ) ( not ( = ?auto_181409 ?auto_181413 ) ) ( not ( = ?auto_181410 ?auto_181413 ) ) ( ON-TABLE ?auto_181411 ) ( ON ?auto_181414 ?auto_181411 ) ( not ( = ?auto_181411 ?auto_181414 ) ) ( not ( = ?auto_181411 ?auto_181416 ) ) ( not ( = ?auto_181411 ?auto_181412 ) ) ( not ( = ?auto_181411 ?auto_181413 ) ) ( not ( = ?auto_181411 ?auto_181410 ) ) ( not ( = ?auto_181411 ?auto_181409 ) ) ( not ( = ?auto_181414 ?auto_181416 ) ) ( not ( = ?auto_181414 ?auto_181412 ) ) ( not ( = ?auto_181414 ?auto_181413 ) ) ( not ( = ?auto_181414 ?auto_181410 ) ) ( not ( = ?auto_181414 ?auto_181409 ) ) ( not ( = ?auto_181416 ?auto_181412 ) ) ( not ( = ?auto_181416 ?auto_181413 ) ) ( not ( = ?auto_181416 ?auto_181410 ) ) ( not ( = ?auto_181416 ?auto_181409 ) ) ( not ( = ?auto_181412 ?auto_181413 ) ) ( not ( = ?auto_181412 ?auto_181410 ) ) ( not ( = ?auto_181412 ?auto_181409 ) ) ( not ( = ?auto_181408 ?auto_181411 ) ) ( not ( = ?auto_181408 ?auto_181414 ) ) ( not ( = ?auto_181408 ?auto_181416 ) ) ( not ( = ?auto_181408 ?auto_181412 ) ) ( ON ?auto_181408 ?auto_181415 ) ( not ( = ?auto_181408 ?auto_181415 ) ) ( not ( = ?auto_181409 ?auto_181415 ) ) ( not ( = ?auto_181410 ?auto_181415 ) ) ( not ( = ?auto_181413 ?auto_181415 ) ) ( not ( = ?auto_181411 ?auto_181415 ) ) ( not ( = ?auto_181414 ?auto_181415 ) ) ( not ( = ?auto_181416 ?auto_181415 ) ) ( not ( = ?auto_181412 ?auto_181415 ) ) ( ON ?auto_181409 ?auto_181408 ) ( ON-TABLE ?auto_181415 ) ( ON ?auto_181410 ?auto_181409 ) ( ON ?auto_181413 ?auto_181410 ) ( ON ?auto_181412 ?auto_181413 ) ( CLEAR ?auto_181414 ) ( ON ?auto_181416 ?auto_181412 ) ( CLEAR ?auto_181416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181415 ?auto_181408 ?auto_181409 ?auto_181410 ?auto_181413 ?auto_181412 )
      ( MAKE-3PILE ?auto_181408 ?auto_181409 ?auto_181410 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181417 - BLOCK
      ?auto_181418 - BLOCK
      ?auto_181419 - BLOCK
    )
    :vars
    (
      ?auto_181422 - BLOCK
      ?auto_181420 - BLOCK
      ?auto_181423 - BLOCK
      ?auto_181425 - BLOCK
      ?auto_181424 - BLOCK
      ?auto_181421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181417 ?auto_181418 ) ) ( not ( = ?auto_181417 ?auto_181419 ) ) ( not ( = ?auto_181418 ?auto_181419 ) ) ( not ( = ?auto_181417 ?auto_181422 ) ) ( not ( = ?auto_181418 ?auto_181422 ) ) ( not ( = ?auto_181419 ?auto_181422 ) ) ( ON-TABLE ?auto_181420 ) ( not ( = ?auto_181420 ?auto_181423 ) ) ( not ( = ?auto_181420 ?auto_181425 ) ) ( not ( = ?auto_181420 ?auto_181424 ) ) ( not ( = ?auto_181420 ?auto_181422 ) ) ( not ( = ?auto_181420 ?auto_181419 ) ) ( not ( = ?auto_181420 ?auto_181418 ) ) ( not ( = ?auto_181423 ?auto_181425 ) ) ( not ( = ?auto_181423 ?auto_181424 ) ) ( not ( = ?auto_181423 ?auto_181422 ) ) ( not ( = ?auto_181423 ?auto_181419 ) ) ( not ( = ?auto_181423 ?auto_181418 ) ) ( not ( = ?auto_181425 ?auto_181424 ) ) ( not ( = ?auto_181425 ?auto_181422 ) ) ( not ( = ?auto_181425 ?auto_181419 ) ) ( not ( = ?auto_181425 ?auto_181418 ) ) ( not ( = ?auto_181424 ?auto_181422 ) ) ( not ( = ?auto_181424 ?auto_181419 ) ) ( not ( = ?auto_181424 ?auto_181418 ) ) ( not ( = ?auto_181417 ?auto_181420 ) ) ( not ( = ?auto_181417 ?auto_181423 ) ) ( not ( = ?auto_181417 ?auto_181425 ) ) ( not ( = ?auto_181417 ?auto_181424 ) ) ( ON ?auto_181417 ?auto_181421 ) ( not ( = ?auto_181417 ?auto_181421 ) ) ( not ( = ?auto_181418 ?auto_181421 ) ) ( not ( = ?auto_181419 ?auto_181421 ) ) ( not ( = ?auto_181422 ?auto_181421 ) ) ( not ( = ?auto_181420 ?auto_181421 ) ) ( not ( = ?auto_181423 ?auto_181421 ) ) ( not ( = ?auto_181425 ?auto_181421 ) ) ( not ( = ?auto_181424 ?auto_181421 ) ) ( ON ?auto_181418 ?auto_181417 ) ( ON-TABLE ?auto_181421 ) ( ON ?auto_181419 ?auto_181418 ) ( ON ?auto_181422 ?auto_181419 ) ( ON ?auto_181424 ?auto_181422 ) ( ON ?auto_181425 ?auto_181424 ) ( CLEAR ?auto_181425 ) ( HOLDING ?auto_181423 ) ( CLEAR ?auto_181420 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181420 ?auto_181423 )
      ( MAKE-3PILE ?auto_181417 ?auto_181418 ?auto_181419 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181426 - BLOCK
      ?auto_181427 - BLOCK
      ?auto_181428 - BLOCK
    )
    :vars
    (
      ?auto_181434 - BLOCK
      ?auto_181431 - BLOCK
      ?auto_181433 - BLOCK
      ?auto_181430 - BLOCK
      ?auto_181429 - BLOCK
      ?auto_181432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181426 ?auto_181427 ) ) ( not ( = ?auto_181426 ?auto_181428 ) ) ( not ( = ?auto_181427 ?auto_181428 ) ) ( not ( = ?auto_181426 ?auto_181434 ) ) ( not ( = ?auto_181427 ?auto_181434 ) ) ( not ( = ?auto_181428 ?auto_181434 ) ) ( ON-TABLE ?auto_181431 ) ( not ( = ?auto_181431 ?auto_181433 ) ) ( not ( = ?auto_181431 ?auto_181430 ) ) ( not ( = ?auto_181431 ?auto_181429 ) ) ( not ( = ?auto_181431 ?auto_181434 ) ) ( not ( = ?auto_181431 ?auto_181428 ) ) ( not ( = ?auto_181431 ?auto_181427 ) ) ( not ( = ?auto_181433 ?auto_181430 ) ) ( not ( = ?auto_181433 ?auto_181429 ) ) ( not ( = ?auto_181433 ?auto_181434 ) ) ( not ( = ?auto_181433 ?auto_181428 ) ) ( not ( = ?auto_181433 ?auto_181427 ) ) ( not ( = ?auto_181430 ?auto_181429 ) ) ( not ( = ?auto_181430 ?auto_181434 ) ) ( not ( = ?auto_181430 ?auto_181428 ) ) ( not ( = ?auto_181430 ?auto_181427 ) ) ( not ( = ?auto_181429 ?auto_181434 ) ) ( not ( = ?auto_181429 ?auto_181428 ) ) ( not ( = ?auto_181429 ?auto_181427 ) ) ( not ( = ?auto_181426 ?auto_181431 ) ) ( not ( = ?auto_181426 ?auto_181433 ) ) ( not ( = ?auto_181426 ?auto_181430 ) ) ( not ( = ?auto_181426 ?auto_181429 ) ) ( ON ?auto_181426 ?auto_181432 ) ( not ( = ?auto_181426 ?auto_181432 ) ) ( not ( = ?auto_181427 ?auto_181432 ) ) ( not ( = ?auto_181428 ?auto_181432 ) ) ( not ( = ?auto_181434 ?auto_181432 ) ) ( not ( = ?auto_181431 ?auto_181432 ) ) ( not ( = ?auto_181433 ?auto_181432 ) ) ( not ( = ?auto_181430 ?auto_181432 ) ) ( not ( = ?auto_181429 ?auto_181432 ) ) ( ON ?auto_181427 ?auto_181426 ) ( ON-TABLE ?auto_181432 ) ( ON ?auto_181428 ?auto_181427 ) ( ON ?auto_181434 ?auto_181428 ) ( ON ?auto_181429 ?auto_181434 ) ( ON ?auto_181430 ?auto_181429 ) ( CLEAR ?auto_181431 ) ( ON ?auto_181433 ?auto_181430 ) ( CLEAR ?auto_181433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181432 ?auto_181426 ?auto_181427 ?auto_181428 ?auto_181434 ?auto_181429 ?auto_181430 )
      ( MAKE-3PILE ?auto_181426 ?auto_181427 ?auto_181428 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181435 - BLOCK
      ?auto_181436 - BLOCK
      ?auto_181437 - BLOCK
    )
    :vars
    (
      ?auto_181442 - BLOCK
      ?auto_181438 - BLOCK
      ?auto_181441 - BLOCK
      ?auto_181440 - BLOCK
      ?auto_181443 - BLOCK
      ?auto_181439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181435 ?auto_181436 ) ) ( not ( = ?auto_181435 ?auto_181437 ) ) ( not ( = ?auto_181436 ?auto_181437 ) ) ( not ( = ?auto_181435 ?auto_181442 ) ) ( not ( = ?auto_181436 ?auto_181442 ) ) ( not ( = ?auto_181437 ?auto_181442 ) ) ( not ( = ?auto_181438 ?auto_181441 ) ) ( not ( = ?auto_181438 ?auto_181440 ) ) ( not ( = ?auto_181438 ?auto_181443 ) ) ( not ( = ?auto_181438 ?auto_181442 ) ) ( not ( = ?auto_181438 ?auto_181437 ) ) ( not ( = ?auto_181438 ?auto_181436 ) ) ( not ( = ?auto_181441 ?auto_181440 ) ) ( not ( = ?auto_181441 ?auto_181443 ) ) ( not ( = ?auto_181441 ?auto_181442 ) ) ( not ( = ?auto_181441 ?auto_181437 ) ) ( not ( = ?auto_181441 ?auto_181436 ) ) ( not ( = ?auto_181440 ?auto_181443 ) ) ( not ( = ?auto_181440 ?auto_181442 ) ) ( not ( = ?auto_181440 ?auto_181437 ) ) ( not ( = ?auto_181440 ?auto_181436 ) ) ( not ( = ?auto_181443 ?auto_181442 ) ) ( not ( = ?auto_181443 ?auto_181437 ) ) ( not ( = ?auto_181443 ?auto_181436 ) ) ( not ( = ?auto_181435 ?auto_181438 ) ) ( not ( = ?auto_181435 ?auto_181441 ) ) ( not ( = ?auto_181435 ?auto_181440 ) ) ( not ( = ?auto_181435 ?auto_181443 ) ) ( ON ?auto_181435 ?auto_181439 ) ( not ( = ?auto_181435 ?auto_181439 ) ) ( not ( = ?auto_181436 ?auto_181439 ) ) ( not ( = ?auto_181437 ?auto_181439 ) ) ( not ( = ?auto_181442 ?auto_181439 ) ) ( not ( = ?auto_181438 ?auto_181439 ) ) ( not ( = ?auto_181441 ?auto_181439 ) ) ( not ( = ?auto_181440 ?auto_181439 ) ) ( not ( = ?auto_181443 ?auto_181439 ) ) ( ON ?auto_181436 ?auto_181435 ) ( ON-TABLE ?auto_181439 ) ( ON ?auto_181437 ?auto_181436 ) ( ON ?auto_181442 ?auto_181437 ) ( ON ?auto_181443 ?auto_181442 ) ( ON ?auto_181440 ?auto_181443 ) ( ON ?auto_181441 ?auto_181440 ) ( CLEAR ?auto_181441 ) ( HOLDING ?auto_181438 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181438 )
      ( MAKE-3PILE ?auto_181435 ?auto_181436 ?auto_181437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181444 - BLOCK
      ?auto_181445 - BLOCK
      ?auto_181446 - BLOCK
    )
    :vars
    (
      ?auto_181449 - BLOCK
      ?auto_181452 - BLOCK
      ?auto_181451 - BLOCK
      ?auto_181447 - BLOCK
      ?auto_181450 - BLOCK
      ?auto_181448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181444 ?auto_181445 ) ) ( not ( = ?auto_181444 ?auto_181446 ) ) ( not ( = ?auto_181445 ?auto_181446 ) ) ( not ( = ?auto_181444 ?auto_181449 ) ) ( not ( = ?auto_181445 ?auto_181449 ) ) ( not ( = ?auto_181446 ?auto_181449 ) ) ( not ( = ?auto_181452 ?auto_181451 ) ) ( not ( = ?auto_181452 ?auto_181447 ) ) ( not ( = ?auto_181452 ?auto_181450 ) ) ( not ( = ?auto_181452 ?auto_181449 ) ) ( not ( = ?auto_181452 ?auto_181446 ) ) ( not ( = ?auto_181452 ?auto_181445 ) ) ( not ( = ?auto_181451 ?auto_181447 ) ) ( not ( = ?auto_181451 ?auto_181450 ) ) ( not ( = ?auto_181451 ?auto_181449 ) ) ( not ( = ?auto_181451 ?auto_181446 ) ) ( not ( = ?auto_181451 ?auto_181445 ) ) ( not ( = ?auto_181447 ?auto_181450 ) ) ( not ( = ?auto_181447 ?auto_181449 ) ) ( not ( = ?auto_181447 ?auto_181446 ) ) ( not ( = ?auto_181447 ?auto_181445 ) ) ( not ( = ?auto_181450 ?auto_181449 ) ) ( not ( = ?auto_181450 ?auto_181446 ) ) ( not ( = ?auto_181450 ?auto_181445 ) ) ( not ( = ?auto_181444 ?auto_181452 ) ) ( not ( = ?auto_181444 ?auto_181451 ) ) ( not ( = ?auto_181444 ?auto_181447 ) ) ( not ( = ?auto_181444 ?auto_181450 ) ) ( ON ?auto_181444 ?auto_181448 ) ( not ( = ?auto_181444 ?auto_181448 ) ) ( not ( = ?auto_181445 ?auto_181448 ) ) ( not ( = ?auto_181446 ?auto_181448 ) ) ( not ( = ?auto_181449 ?auto_181448 ) ) ( not ( = ?auto_181452 ?auto_181448 ) ) ( not ( = ?auto_181451 ?auto_181448 ) ) ( not ( = ?auto_181447 ?auto_181448 ) ) ( not ( = ?auto_181450 ?auto_181448 ) ) ( ON ?auto_181445 ?auto_181444 ) ( ON-TABLE ?auto_181448 ) ( ON ?auto_181446 ?auto_181445 ) ( ON ?auto_181449 ?auto_181446 ) ( ON ?auto_181450 ?auto_181449 ) ( ON ?auto_181447 ?auto_181450 ) ( ON ?auto_181451 ?auto_181447 ) ( ON ?auto_181452 ?auto_181451 ) ( CLEAR ?auto_181452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181448 ?auto_181444 ?auto_181445 ?auto_181446 ?auto_181449 ?auto_181450 ?auto_181447 ?auto_181451 )
      ( MAKE-3PILE ?auto_181444 ?auto_181445 ?auto_181446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181457 - BLOCK
      ?auto_181458 - BLOCK
      ?auto_181459 - BLOCK
      ?auto_181460 - BLOCK
    )
    :vars
    (
      ?auto_181461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181461 ?auto_181460 ) ( CLEAR ?auto_181461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181457 ) ( ON ?auto_181458 ?auto_181457 ) ( ON ?auto_181459 ?auto_181458 ) ( ON ?auto_181460 ?auto_181459 ) ( not ( = ?auto_181457 ?auto_181458 ) ) ( not ( = ?auto_181457 ?auto_181459 ) ) ( not ( = ?auto_181457 ?auto_181460 ) ) ( not ( = ?auto_181457 ?auto_181461 ) ) ( not ( = ?auto_181458 ?auto_181459 ) ) ( not ( = ?auto_181458 ?auto_181460 ) ) ( not ( = ?auto_181458 ?auto_181461 ) ) ( not ( = ?auto_181459 ?auto_181460 ) ) ( not ( = ?auto_181459 ?auto_181461 ) ) ( not ( = ?auto_181460 ?auto_181461 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181461 ?auto_181460 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181462 - BLOCK
      ?auto_181463 - BLOCK
      ?auto_181464 - BLOCK
      ?auto_181465 - BLOCK
    )
    :vars
    (
      ?auto_181466 - BLOCK
      ?auto_181467 - BLOCK
      ?auto_181468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181466 ?auto_181465 ) ( CLEAR ?auto_181466 ) ( ON-TABLE ?auto_181462 ) ( ON ?auto_181463 ?auto_181462 ) ( ON ?auto_181464 ?auto_181463 ) ( ON ?auto_181465 ?auto_181464 ) ( not ( = ?auto_181462 ?auto_181463 ) ) ( not ( = ?auto_181462 ?auto_181464 ) ) ( not ( = ?auto_181462 ?auto_181465 ) ) ( not ( = ?auto_181462 ?auto_181466 ) ) ( not ( = ?auto_181463 ?auto_181464 ) ) ( not ( = ?auto_181463 ?auto_181465 ) ) ( not ( = ?auto_181463 ?auto_181466 ) ) ( not ( = ?auto_181464 ?auto_181465 ) ) ( not ( = ?auto_181464 ?auto_181466 ) ) ( not ( = ?auto_181465 ?auto_181466 ) ) ( HOLDING ?auto_181467 ) ( CLEAR ?auto_181468 ) ( not ( = ?auto_181462 ?auto_181467 ) ) ( not ( = ?auto_181462 ?auto_181468 ) ) ( not ( = ?auto_181463 ?auto_181467 ) ) ( not ( = ?auto_181463 ?auto_181468 ) ) ( not ( = ?auto_181464 ?auto_181467 ) ) ( not ( = ?auto_181464 ?auto_181468 ) ) ( not ( = ?auto_181465 ?auto_181467 ) ) ( not ( = ?auto_181465 ?auto_181468 ) ) ( not ( = ?auto_181466 ?auto_181467 ) ) ( not ( = ?auto_181466 ?auto_181468 ) ) ( not ( = ?auto_181467 ?auto_181468 ) ) )
    :subtasks
    ( ( !STACK ?auto_181467 ?auto_181468 )
      ( MAKE-4PILE ?auto_181462 ?auto_181463 ?auto_181464 ?auto_181465 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181469 - BLOCK
      ?auto_181470 - BLOCK
      ?auto_181471 - BLOCK
      ?auto_181472 - BLOCK
    )
    :vars
    (
      ?auto_181473 - BLOCK
      ?auto_181474 - BLOCK
      ?auto_181475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181473 ?auto_181472 ) ( ON-TABLE ?auto_181469 ) ( ON ?auto_181470 ?auto_181469 ) ( ON ?auto_181471 ?auto_181470 ) ( ON ?auto_181472 ?auto_181471 ) ( not ( = ?auto_181469 ?auto_181470 ) ) ( not ( = ?auto_181469 ?auto_181471 ) ) ( not ( = ?auto_181469 ?auto_181472 ) ) ( not ( = ?auto_181469 ?auto_181473 ) ) ( not ( = ?auto_181470 ?auto_181471 ) ) ( not ( = ?auto_181470 ?auto_181472 ) ) ( not ( = ?auto_181470 ?auto_181473 ) ) ( not ( = ?auto_181471 ?auto_181472 ) ) ( not ( = ?auto_181471 ?auto_181473 ) ) ( not ( = ?auto_181472 ?auto_181473 ) ) ( CLEAR ?auto_181474 ) ( not ( = ?auto_181469 ?auto_181475 ) ) ( not ( = ?auto_181469 ?auto_181474 ) ) ( not ( = ?auto_181470 ?auto_181475 ) ) ( not ( = ?auto_181470 ?auto_181474 ) ) ( not ( = ?auto_181471 ?auto_181475 ) ) ( not ( = ?auto_181471 ?auto_181474 ) ) ( not ( = ?auto_181472 ?auto_181475 ) ) ( not ( = ?auto_181472 ?auto_181474 ) ) ( not ( = ?auto_181473 ?auto_181475 ) ) ( not ( = ?auto_181473 ?auto_181474 ) ) ( not ( = ?auto_181475 ?auto_181474 ) ) ( ON ?auto_181475 ?auto_181473 ) ( CLEAR ?auto_181475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181469 ?auto_181470 ?auto_181471 ?auto_181472 ?auto_181473 )
      ( MAKE-4PILE ?auto_181469 ?auto_181470 ?auto_181471 ?auto_181472 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181476 - BLOCK
      ?auto_181477 - BLOCK
      ?auto_181478 - BLOCK
      ?auto_181479 - BLOCK
    )
    :vars
    (
      ?auto_181481 - BLOCK
      ?auto_181482 - BLOCK
      ?auto_181480 - BLOCK
      ?auto_181483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181481 ?auto_181479 ) ( ON-TABLE ?auto_181476 ) ( ON ?auto_181477 ?auto_181476 ) ( ON ?auto_181478 ?auto_181477 ) ( ON ?auto_181479 ?auto_181478 ) ( not ( = ?auto_181476 ?auto_181477 ) ) ( not ( = ?auto_181476 ?auto_181478 ) ) ( not ( = ?auto_181476 ?auto_181479 ) ) ( not ( = ?auto_181476 ?auto_181481 ) ) ( not ( = ?auto_181477 ?auto_181478 ) ) ( not ( = ?auto_181477 ?auto_181479 ) ) ( not ( = ?auto_181477 ?auto_181481 ) ) ( not ( = ?auto_181478 ?auto_181479 ) ) ( not ( = ?auto_181478 ?auto_181481 ) ) ( not ( = ?auto_181479 ?auto_181481 ) ) ( not ( = ?auto_181476 ?auto_181482 ) ) ( not ( = ?auto_181476 ?auto_181480 ) ) ( not ( = ?auto_181477 ?auto_181482 ) ) ( not ( = ?auto_181477 ?auto_181480 ) ) ( not ( = ?auto_181478 ?auto_181482 ) ) ( not ( = ?auto_181478 ?auto_181480 ) ) ( not ( = ?auto_181479 ?auto_181482 ) ) ( not ( = ?auto_181479 ?auto_181480 ) ) ( not ( = ?auto_181481 ?auto_181482 ) ) ( not ( = ?auto_181481 ?auto_181480 ) ) ( not ( = ?auto_181482 ?auto_181480 ) ) ( ON ?auto_181482 ?auto_181481 ) ( CLEAR ?auto_181482 ) ( HOLDING ?auto_181480 ) ( CLEAR ?auto_181483 ) ( ON-TABLE ?auto_181483 ) ( not ( = ?auto_181483 ?auto_181480 ) ) ( not ( = ?auto_181476 ?auto_181483 ) ) ( not ( = ?auto_181477 ?auto_181483 ) ) ( not ( = ?auto_181478 ?auto_181483 ) ) ( not ( = ?auto_181479 ?auto_181483 ) ) ( not ( = ?auto_181481 ?auto_181483 ) ) ( not ( = ?auto_181482 ?auto_181483 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181483 ?auto_181480 )
      ( MAKE-4PILE ?auto_181476 ?auto_181477 ?auto_181478 ?auto_181479 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181484 - BLOCK
      ?auto_181485 - BLOCK
      ?auto_181486 - BLOCK
      ?auto_181487 - BLOCK
    )
    :vars
    (
      ?auto_181489 - BLOCK
      ?auto_181491 - BLOCK
      ?auto_181490 - BLOCK
      ?auto_181488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181489 ?auto_181487 ) ( ON-TABLE ?auto_181484 ) ( ON ?auto_181485 ?auto_181484 ) ( ON ?auto_181486 ?auto_181485 ) ( ON ?auto_181487 ?auto_181486 ) ( not ( = ?auto_181484 ?auto_181485 ) ) ( not ( = ?auto_181484 ?auto_181486 ) ) ( not ( = ?auto_181484 ?auto_181487 ) ) ( not ( = ?auto_181484 ?auto_181489 ) ) ( not ( = ?auto_181485 ?auto_181486 ) ) ( not ( = ?auto_181485 ?auto_181487 ) ) ( not ( = ?auto_181485 ?auto_181489 ) ) ( not ( = ?auto_181486 ?auto_181487 ) ) ( not ( = ?auto_181486 ?auto_181489 ) ) ( not ( = ?auto_181487 ?auto_181489 ) ) ( not ( = ?auto_181484 ?auto_181491 ) ) ( not ( = ?auto_181484 ?auto_181490 ) ) ( not ( = ?auto_181485 ?auto_181491 ) ) ( not ( = ?auto_181485 ?auto_181490 ) ) ( not ( = ?auto_181486 ?auto_181491 ) ) ( not ( = ?auto_181486 ?auto_181490 ) ) ( not ( = ?auto_181487 ?auto_181491 ) ) ( not ( = ?auto_181487 ?auto_181490 ) ) ( not ( = ?auto_181489 ?auto_181491 ) ) ( not ( = ?auto_181489 ?auto_181490 ) ) ( not ( = ?auto_181491 ?auto_181490 ) ) ( ON ?auto_181491 ?auto_181489 ) ( CLEAR ?auto_181488 ) ( ON-TABLE ?auto_181488 ) ( not ( = ?auto_181488 ?auto_181490 ) ) ( not ( = ?auto_181484 ?auto_181488 ) ) ( not ( = ?auto_181485 ?auto_181488 ) ) ( not ( = ?auto_181486 ?auto_181488 ) ) ( not ( = ?auto_181487 ?auto_181488 ) ) ( not ( = ?auto_181489 ?auto_181488 ) ) ( not ( = ?auto_181491 ?auto_181488 ) ) ( ON ?auto_181490 ?auto_181491 ) ( CLEAR ?auto_181490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181484 ?auto_181485 ?auto_181486 ?auto_181487 ?auto_181489 ?auto_181491 )
      ( MAKE-4PILE ?auto_181484 ?auto_181485 ?auto_181486 ?auto_181487 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181492 - BLOCK
      ?auto_181493 - BLOCK
      ?auto_181494 - BLOCK
      ?auto_181495 - BLOCK
    )
    :vars
    (
      ?auto_181498 - BLOCK
      ?auto_181499 - BLOCK
      ?auto_181497 - BLOCK
      ?auto_181496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181498 ?auto_181495 ) ( ON-TABLE ?auto_181492 ) ( ON ?auto_181493 ?auto_181492 ) ( ON ?auto_181494 ?auto_181493 ) ( ON ?auto_181495 ?auto_181494 ) ( not ( = ?auto_181492 ?auto_181493 ) ) ( not ( = ?auto_181492 ?auto_181494 ) ) ( not ( = ?auto_181492 ?auto_181495 ) ) ( not ( = ?auto_181492 ?auto_181498 ) ) ( not ( = ?auto_181493 ?auto_181494 ) ) ( not ( = ?auto_181493 ?auto_181495 ) ) ( not ( = ?auto_181493 ?auto_181498 ) ) ( not ( = ?auto_181494 ?auto_181495 ) ) ( not ( = ?auto_181494 ?auto_181498 ) ) ( not ( = ?auto_181495 ?auto_181498 ) ) ( not ( = ?auto_181492 ?auto_181499 ) ) ( not ( = ?auto_181492 ?auto_181497 ) ) ( not ( = ?auto_181493 ?auto_181499 ) ) ( not ( = ?auto_181493 ?auto_181497 ) ) ( not ( = ?auto_181494 ?auto_181499 ) ) ( not ( = ?auto_181494 ?auto_181497 ) ) ( not ( = ?auto_181495 ?auto_181499 ) ) ( not ( = ?auto_181495 ?auto_181497 ) ) ( not ( = ?auto_181498 ?auto_181499 ) ) ( not ( = ?auto_181498 ?auto_181497 ) ) ( not ( = ?auto_181499 ?auto_181497 ) ) ( ON ?auto_181499 ?auto_181498 ) ( not ( = ?auto_181496 ?auto_181497 ) ) ( not ( = ?auto_181492 ?auto_181496 ) ) ( not ( = ?auto_181493 ?auto_181496 ) ) ( not ( = ?auto_181494 ?auto_181496 ) ) ( not ( = ?auto_181495 ?auto_181496 ) ) ( not ( = ?auto_181498 ?auto_181496 ) ) ( not ( = ?auto_181499 ?auto_181496 ) ) ( ON ?auto_181497 ?auto_181499 ) ( CLEAR ?auto_181497 ) ( HOLDING ?auto_181496 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181496 )
      ( MAKE-4PILE ?auto_181492 ?auto_181493 ?auto_181494 ?auto_181495 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181500 - BLOCK
      ?auto_181501 - BLOCK
      ?auto_181502 - BLOCK
      ?auto_181503 - BLOCK
    )
    :vars
    (
      ?auto_181505 - BLOCK
      ?auto_181504 - BLOCK
      ?auto_181507 - BLOCK
      ?auto_181506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181505 ?auto_181503 ) ( ON-TABLE ?auto_181500 ) ( ON ?auto_181501 ?auto_181500 ) ( ON ?auto_181502 ?auto_181501 ) ( ON ?auto_181503 ?auto_181502 ) ( not ( = ?auto_181500 ?auto_181501 ) ) ( not ( = ?auto_181500 ?auto_181502 ) ) ( not ( = ?auto_181500 ?auto_181503 ) ) ( not ( = ?auto_181500 ?auto_181505 ) ) ( not ( = ?auto_181501 ?auto_181502 ) ) ( not ( = ?auto_181501 ?auto_181503 ) ) ( not ( = ?auto_181501 ?auto_181505 ) ) ( not ( = ?auto_181502 ?auto_181503 ) ) ( not ( = ?auto_181502 ?auto_181505 ) ) ( not ( = ?auto_181503 ?auto_181505 ) ) ( not ( = ?auto_181500 ?auto_181504 ) ) ( not ( = ?auto_181500 ?auto_181507 ) ) ( not ( = ?auto_181501 ?auto_181504 ) ) ( not ( = ?auto_181501 ?auto_181507 ) ) ( not ( = ?auto_181502 ?auto_181504 ) ) ( not ( = ?auto_181502 ?auto_181507 ) ) ( not ( = ?auto_181503 ?auto_181504 ) ) ( not ( = ?auto_181503 ?auto_181507 ) ) ( not ( = ?auto_181505 ?auto_181504 ) ) ( not ( = ?auto_181505 ?auto_181507 ) ) ( not ( = ?auto_181504 ?auto_181507 ) ) ( ON ?auto_181504 ?auto_181505 ) ( not ( = ?auto_181506 ?auto_181507 ) ) ( not ( = ?auto_181500 ?auto_181506 ) ) ( not ( = ?auto_181501 ?auto_181506 ) ) ( not ( = ?auto_181502 ?auto_181506 ) ) ( not ( = ?auto_181503 ?auto_181506 ) ) ( not ( = ?auto_181505 ?auto_181506 ) ) ( not ( = ?auto_181504 ?auto_181506 ) ) ( ON ?auto_181507 ?auto_181504 ) ( ON ?auto_181506 ?auto_181507 ) ( CLEAR ?auto_181506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181500 ?auto_181501 ?auto_181502 ?auto_181503 ?auto_181505 ?auto_181504 ?auto_181507 )
      ( MAKE-4PILE ?auto_181500 ?auto_181501 ?auto_181502 ?auto_181503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181508 - BLOCK
      ?auto_181509 - BLOCK
      ?auto_181510 - BLOCK
      ?auto_181511 - BLOCK
    )
    :vars
    (
      ?auto_181512 - BLOCK
      ?auto_181514 - BLOCK
      ?auto_181515 - BLOCK
      ?auto_181513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181512 ?auto_181511 ) ( ON-TABLE ?auto_181508 ) ( ON ?auto_181509 ?auto_181508 ) ( ON ?auto_181510 ?auto_181509 ) ( ON ?auto_181511 ?auto_181510 ) ( not ( = ?auto_181508 ?auto_181509 ) ) ( not ( = ?auto_181508 ?auto_181510 ) ) ( not ( = ?auto_181508 ?auto_181511 ) ) ( not ( = ?auto_181508 ?auto_181512 ) ) ( not ( = ?auto_181509 ?auto_181510 ) ) ( not ( = ?auto_181509 ?auto_181511 ) ) ( not ( = ?auto_181509 ?auto_181512 ) ) ( not ( = ?auto_181510 ?auto_181511 ) ) ( not ( = ?auto_181510 ?auto_181512 ) ) ( not ( = ?auto_181511 ?auto_181512 ) ) ( not ( = ?auto_181508 ?auto_181514 ) ) ( not ( = ?auto_181508 ?auto_181515 ) ) ( not ( = ?auto_181509 ?auto_181514 ) ) ( not ( = ?auto_181509 ?auto_181515 ) ) ( not ( = ?auto_181510 ?auto_181514 ) ) ( not ( = ?auto_181510 ?auto_181515 ) ) ( not ( = ?auto_181511 ?auto_181514 ) ) ( not ( = ?auto_181511 ?auto_181515 ) ) ( not ( = ?auto_181512 ?auto_181514 ) ) ( not ( = ?auto_181512 ?auto_181515 ) ) ( not ( = ?auto_181514 ?auto_181515 ) ) ( ON ?auto_181514 ?auto_181512 ) ( not ( = ?auto_181513 ?auto_181515 ) ) ( not ( = ?auto_181508 ?auto_181513 ) ) ( not ( = ?auto_181509 ?auto_181513 ) ) ( not ( = ?auto_181510 ?auto_181513 ) ) ( not ( = ?auto_181511 ?auto_181513 ) ) ( not ( = ?auto_181512 ?auto_181513 ) ) ( not ( = ?auto_181514 ?auto_181513 ) ) ( ON ?auto_181515 ?auto_181514 ) ( HOLDING ?auto_181513 ) ( CLEAR ?auto_181515 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181508 ?auto_181509 ?auto_181510 ?auto_181511 ?auto_181512 ?auto_181514 ?auto_181515 ?auto_181513 )
      ( MAKE-4PILE ?auto_181508 ?auto_181509 ?auto_181510 ?auto_181511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181516 - BLOCK
      ?auto_181517 - BLOCK
      ?auto_181518 - BLOCK
      ?auto_181519 - BLOCK
    )
    :vars
    (
      ?auto_181522 - BLOCK
      ?auto_181523 - BLOCK
      ?auto_181520 - BLOCK
      ?auto_181521 - BLOCK
      ?auto_181524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181522 ?auto_181519 ) ( ON-TABLE ?auto_181516 ) ( ON ?auto_181517 ?auto_181516 ) ( ON ?auto_181518 ?auto_181517 ) ( ON ?auto_181519 ?auto_181518 ) ( not ( = ?auto_181516 ?auto_181517 ) ) ( not ( = ?auto_181516 ?auto_181518 ) ) ( not ( = ?auto_181516 ?auto_181519 ) ) ( not ( = ?auto_181516 ?auto_181522 ) ) ( not ( = ?auto_181517 ?auto_181518 ) ) ( not ( = ?auto_181517 ?auto_181519 ) ) ( not ( = ?auto_181517 ?auto_181522 ) ) ( not ( = ?auto_181518 ?auto_181519 ) ) ( not ( = ?auto_181518 ?auto_181522 ) ) ( not ( = ?auto_181519 ?auto_181522 ) ) ( not ( = ?auto_181516 ?auto_181523 ) ) ( not ( = ?auto_181516 ?auto_181520 ) ) ( not ( = ?auto_181517 ?auto_181523 ) ) ( not ( = ?auto_181517 ?auto_181520 ) ) ( not ( = ?auto_181518 ?auto_181523 ) ) ( not ( = ?auto_181518 ?auto_181520 ) ) ( not ( = ?auto_181519 ?auto_181523 ) ) ( not ( = ?auto_181519 ?auto_181520 ) ) ( not ( = ?auto_181522 ?auto_181523 ) ) ( not ( = ?auto_181522 ?auto_181520 ) ) ( not ( = ?auto_181523 ?auto_181520 ) ) ( ON ?auto_181523 ?auto_181522 ) ( not ( = ?auto_181521 ?auto_181520 ) ) ( not ( = ?auto_181516 ?auto_181521 ) ) ( not ( = ?auto_181517 ?auto_181521 ) ) ( not ( = ?auto_181518 ?auto_181521 ) ) ( not ( = ?auto_181519 ?auto_181521 ) ) ( not ( = ?auto_181522 ?auto_181521 ) ) ( not ( = ?auto_181523 ?auto_181521 ) ) ( ON ?auto_181520 ?auto_181523 ) ( CLEAR ?auto_181520 ) ( ON ?auto_181521 ?auto_181524 ) ( CLEAR ?auto_181521 ) ( HAND-EMPTY ) ( not ( = ?auto_181516 ?auto_181524 ) ) ( not ( = ?auto_181517 ?auto_181524 ) ) ( not ( = ?auto_181518 ?auto_181524 ) ) ( not ( = ?auto_181519 ?auto_181524 ) ) ( not ( = ?auto_181522 ?auto_181524 ) ) ( not ( = ?auto_181523 ?auto_181524 ) ) ( not ( = ?auto_181520 ?auto_181524 ) ) ( not ( = ?auto_181521 ?auto_181524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181521 ?auto_181524 )
      ( MAKE-4PILE ?auto_181516 ?auto_181517 ?auto_181518 ?auto_181519 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181525 - BLOCK
      ?auto_181526 - BLOCK
      ?auto_181527 - BLOCK
      ?auto_181528 - BLOCK
    )
    :vars
    (
      ?auto_181530 - BLOCK
      ?auto_181533 - BLOCK
      ?auto_181532 - BLOCK
      ?auto_181529 - BLOCK
      ?auto_181531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181530 ?auto_181528 ) ( ON-TABLE ?auto_181525 ) ( ON ?auto_181526 ?auto_181525 ) ( ON ?auto_181527 ?auto_181526 ) ( ON ?auto_181528 ?auto_181527 ) ( not ( = ?auto_181525 ?auto_181526 ) ) ( not ( = ?auto_181525 ?auto_181527 ) ) ( not ( = ?auto_181525 ?auto_181528 ) ) ( not ( = ?auto_181525 ?auto_181530 ) ) ( not ( = ?auto_181526 ?auto_181527 ) ) ( not ( = ?auto_181526 ?auto_181528 ) ) ( not ( = ?auto_181526 ?auto_181530 ) ) ( not ( = ?auto_181527 ?auto_181528 ) ) ( not ( = ?auto_181527 ?auto_181530 ) ) ( not ( = ?auto_181528 ?auto_181530 ) ) ( not ( = ?auto_181525 ?auto_181533 ) ) ( not ( = ?auto_181525 ?auto_181532 ) ) ( not ( = ?auto_181526 ?auto_181533 ) ) ( not ( = ?auto_181526 ?auto_181532 ) ) ( not ( = ?auto_181527 ?auto_181533 ) ) ( not ( = ?auto_181527 ?auto_181532 ) ) ( not ( = ?auto_181528 ?auto_181533 ) ) ( not ( = ?auto_181528 ?auto_181532 ) ) ( not ( = ?auto_181530 ?auto_181533 ) ) ( not ( = ?auto_181530 ?auto_181532 ) ) ( not ( = ?auto_181533 ?auto_181532 ) ) ( ON ?auto_181533 ?auto_181530 ) ( not ( = ?auto_181529 ?auto_181532 ) ) ( not ( = ?auto_181525 ?auto_181529 ) ) ( not ( = ?auto_181526 ?auto_181529 ) ) ( not ( = ?auto_181527 ?auto_181529 ) ) ( not ( = ?auto_181528 ?auto_181529 ) ) ( not ( = ?auto_181530 ?auto_181529 ) ) ( not ( = ?auto_181533 ?auto_181529 ) ) ( ON ?auto_181529 ?auto_181531 ) ( CLEAR ?auto_181529 ) ( not ( = ?auto_181525 ?auto_181531 ) ) ( not ( = ?auto_181526 ?auto_181531 ) ) ( not ( = ?auto_181527 ?auto_181531 ) ) ( not ( = ?auto_181528 ?auto_181531 ) ) ( not ( = ?auto_181530 ?auto_181531 ) ) ( not ( = ?auto_181533 ?auto_181531 ) ) ( not ( = ?auto_181532 ?auto_181531 ) ) ( not ( = ?auto_181529 ?auto_181531 ) ) ( HOLDING ?auto_181532 ) ( CLEAR ?auto_181533 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181525 ?auto_181526 ?auto_181527 ?auto_181528 ?auto_181530 ?auto_181533 ?auto_181532 )
      ( MAKE-4PILE ?auto_181525 ?auto_181526 ?auto_181527 ?auto_181528 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181534 - BLOCK
      ?auto_181535 - BLOCK
      ?auto_181536 - BLOCK
      ?auto_181537 - BLOCK
    )
    :vars
    (
      ?auto_181540 - BLOCK
      ?auto_181542 - BLOCK
      ?auto_181538 - BLOCK
      ?auto_181541 - BLOCK
      ?auto_181539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181540 ?auto_181537 ) ( ON-TABLE ?auto_181534 ) ( ON ?auto_181535 ?auto_181534 ) ( ON ?auto_181536 ?auto_181535 ) ( ON ?auto_181537 ?auto_181536 ) ( not ( = ?auto_181534 ?auto_181535 ) ) ( not ( = ?auto_181534 ?auto_181536 ) ) ( not ( = ?auto_181534 ?auto_181537 ) ) ( not ( = ?auto_181534 ?auto_181540 ) ) ( not ( = ?auto_181535 ?auto_181536 ) ) ( not ( = ?auto_181535 ?auto_181537 ) ) ( not ( = ?auto_181535 ?auto_181540 ) ) ( not ( = ?auto_181536 ?auto_181537 ) ) ( not ( = ?auto_181536 ?auto_181540 ) ) ( not ( = ?auto_181537 ?auto_181540 ) ) ( not ( = ?auto_181534 ?auto_181542 ) ) ( not ( = ?auto_181534 ?auto_181538 ) ) ( not ( = ?auto_181535 ?auto_181542 ) ) ( not ( = ?auto_181535 ?auto_181538 ) ) ( not ( = ?auto_181536 ?auto_181542 ) ) ( not ( = ?auto_181536 ?auto_181538 ) ) ( not ( = ?auto_181537 ?auto_181542 ) ) ( not ( = ?auto_181537 ?auto_181538 ) ) ( not ( = ?auto_181540 ?auto_181542 ) ) ( not ( = ?auto_181540 ?auto_181538 ) ) ( not ( = ?auto_181542 ?auto_181538 ) ) ( ON ?auto_181542 ?auto_181540 ) ( not ( = ?auto_181541 ?auto_181538 ) ) ( not ( = ?auto_181534 ?auto_181541 ) ) ( not ( = ?auto_181535 ?auto_181541 ) ) ( not ( = ?auto_181536 ?auto_181541 ) ) ( not ( = ?auto_181537 ?auto_181541 ) ) ( not ( = ?auto_181540 ?auto_181541 ) ) ( not ( = ?auto_181542 ?auto_181541 ) ) ( ON ?auto_181541 ?auto_181539 ) ( not ( = ?auto_181534 ?auto_181539 ) ) ( not ( = ?auto_181535 ?auto_181539 ) ) ( not ( = ?auto_181536 ?auto_181539 ) ) ( not ( = ?auto_181537 ?auto_181539 ) ) ( not ( = ?auto_181540 ?auto_181539 ) ) ( not ( = ?auto_181542 ?auto_181539 ) ) ( not ( = ?auto_181538 ?auto_181539 ) ) ( not ( = ?auto_181541 ?auto_181539 ) ) ( CLEAR ?auto_181542 ) ( ON ?auto_181538 ?auto_181541 ) ( CLEAR ?auto_181538 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181539 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181539 ?auto_181541 )
      ( MAKE-4PILE ?auto_181534 ?auto_181535 ?auto_181536 ?auto_181537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181543 - BLOCK
      ?auto_181544 - BLOCK
      ?auto_181545 - BLOCK
      ?auto_181546 - BLOCK
    )
    :vars
    (
      ?auto_181550 - BLOCK
      ?auto_181549 - BLOCK
      ?auto_181547 - BLOCK
      ?auto_181548 - BLOCK
      ?auto_181551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181550 ?auto_181546 ) ( ON-TABLE ?auto_181543 ) ( ON ?auto_181544 ?auto_181543 ) ( ON ?auto_181545 ?auto_181544 ) ( ON ?auto_181546 ?auto_181545 ) ( not ( = ?auto_181543 ?auto_181544 ) ) ( not ( = ?auto_181543 ?auto_181545 ) ) ( not ( = ?auto_181543 ?auto_181546 ) ) ( not ( = ?auto_181543 ?auto_181550 ) ) ( not ( = ?auto_181544 ?auto_181545 ) ) ( not ( = ?auto_181544 ?auto_181546 ) ) ( not ( = ?auto_181544 ?auto_181550 ) ) ( not ( = ?auto_181545 ?auto_181546 ) ) ( not ( = ?auto_181545 ?auto_181550 ) ) ( not ( = ?auto_181546 ?auto_181550 ) ) ( not ( = ?auto_181543 ?auto_181549 ) ) ( not ( = ?auto_181543 ?auto_181547 ) ) ( not ( = ?auto_181544 ?auto_181549 ) ) ( not ( = ?auto_181544 ?auto_181547 ) ) ( not ( = ?auto_181545 ?auto_181549 ) ) ( not ( = ?auto_181545 ?auto_181547 ) ) ( not ( = ?auto_181546 ?auto_181549 ) ) ( not ( = ?auto_181546 ?auto_181547 ) ) ( not ( = ?auto_181550 ?auto_181549 ) ) ( not ( = ?auto_181550 ?auto_181547 ) ) ( not ( = ?auto_181549 ?auto_181547 ) ) ( not ( = ?auto_181548 ?auto_181547 ) ) ( not ( = ?auto_181543 ?auto_181548 ) ) ( not ( = ?auto_181544 ?auto_181548 ) ) ( not ( = ?auto_181545 ?auto_181548 ) ) ( not ( = ?auto_181546 ?auto_181548 ) ) ( not ( = ?auto_181550 ?auto_181548 ) ) ( not ( = ?auto_181549 ?auto_181548 ) ) ( ON ?auto_181548 ?auto_181551 ) ( not ( = ?auto_181543 ?auto_181551 ) ) ( not ( = ?auto_181544 ?auto_181551 ) ) ( not ( = ?auto_181545 ?auto_181551 ) ) ( not ( = ?auto_181546 ?auto_181551 ) ) ( not ( = ?auto_181550 ?auto_181551 ) ) ( not ( = ?auto_181549 ?auto_181551 ) ) ( not ( = ?auto_181547 ?auto_181551 ) ) ( not ( = ?auto_181548 ?auto_181551 ) ) ( ON ?auto_181547 ?auto_181548 ) ( CLEAR ?auto_181547 ) ( ON-TABLE ?auto_181551 ) ( HOLDING ?auto_181549 ) ( CLEAR ?auto_181550 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181543 ?auto_181544 ?auto_181545 ?auto_181546 ?auto_181550 ?auto_181549 )
      ( MAKE-4PILE ?auto_181543 ?auto_181544 ?auto_181545 ?auto_181546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181552 - BLOCK
      ?auto_181553 - BLOCK
      ?auto_181554 - BLOCK
      ?auto_181555 - BLOCK
    )
    :vars
    (
      ?auto_181558 - BLOCK
      ?auto_181559 - BLOCK
      ?auto_181560 - BLOCK
      ?auto_181557 - BLOCK
      ?auto_181556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181558 ?auto_181555 ) ( ON-TABLE ?auto_181552 ) ( ON ?auto_181553 ?auto_181552 ) ( ON ?auto_181554 ?auto_181553 ) ( ON ?auto_181555 ?auto_181554 ) ( not ( = ?auto_181552 ?auto_181553 ) ) ( not ( = ?auto_181552 ?auto_181554 ) ) ( not ( = ?auto_181552 ?auto_181555 ) ) ( not ( = ?auto_181552 ?auto_181558 ) ) ( not ( = ?auto_181553 ?auto_181554 ) ) ( not ( = ?auto_181553 ?auto_181555 ) ) ( not ( = ?auto_181553 ?auto_181558 ) ) ( not ( = ?auto_181554 ?auto_181555 ) ) ( not ( = ?auto_181554 ?auto_181558 ) ) ( not ( = ?auto_181555 ?auto_181558 ) ) ( not ( = ?auto_181552 ?auto_181559 ) ) ( not ( = ?auto_181552 ?auto_181560 ) ) ( not ( = ?auto_181553 ?auto_181559 ) ) ( not ( = ?auto_181553 ?auto_181560 ) ) ( not ( = ?auto_181554 ?auto_181559 ) ) ( not ( = ?auto_181554 ?auto_181560 ) ) ( not ( = ?auto_181555 ?auto_181559 ) ) ( not ( = ?auto_181555 ?auto_181560 ) ) ( not ( = ?auto_181558 ?auto_181559 ) ) ( not ( = ?auto_181558 ?auto_181560 ) ) ( not ( = ?auto_181559 ?auto_181560 ) ) ( not ( = ?auto_181557 ?auto_181560 ) ) ( not ( = ?auto_181552 ?auto_181557 ) ) ( not ( = ?auto_181553 ?auto_181557 ) ) ( not ( = ?auto_181554 ?auto_181557 ) ) ( not ( = ?auto_181555 ?auto_181557 ) ) ( not ( = ?auto_181558 ?auto_181557 ) ) ( not ( = ?auto_181559 ?auto_181557 ) ) ( ON ?auto_181557 ?auto_181556 ) ( not ( = ?auto_181552 ?auto_181556 ) ) ( not ( = ?auto_181553 ?auto_181556 ) ) ( not ( = ?auto_181554 ?auto_181556 ) ) ( not ( = ?auto_181555 ?auto_181556 ) ) ( not ( = ?auto_181558 ?auto_181556 ) ) ( not ( = ?auto_181559 ?auto_181556 ) ) ( not ( = ?auto_181560 ?auto_181556 ) ) ( not ( = ?auto_181557 ?auto_181556 ) ) ( ON ?auto_181560 ?auto_181557 ) ( ON-TABLE ?auto_181556 ) ( CLEAR ?auto_181558 ) ( ON ?auto_181559 ?auto_181560 ) ( CLEAR ?auto_181559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181556 ?auto_181557 ?auto_181560 )
      ( MAKE-4PILE ?auto_181552 ?auto_181553 ?auto_181554 ?auto_181555 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181579 - BLOCK
      ?auto_181580 - BLOCK
      ?auto_181581 - BLOCK
      ?auto_181582 - BLOCK
    )
    :vars
    (
      ?auto_181585 - BLOCK
      ?auto_181584 - BLOCK
      ?auto_181587 - BLOCK
      ?auto_181586 - BLOCK
      ?auto_181583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181579 ) ( ON ?auto_181580 ?auto_181579 ) ( ON ?auto_181581 ?auto_181580 ) ( not ( = ?auto_181579 ?auto_181580 ) ) ( not ( = ?auto_181579 ?auto_181581 ) ) ( not ( = ?auto_181579 ?auto_181582 ) ) ( not ( = ?auto_181579 ?auto_181585 ) ) ( not ( = ?auto_181580 ?auto_181581 ) ) ( not ( = ?auto_181580 ?auto_181582 ) ) ( not ( = ?auto_181580 ?auto_181585 ) ) ( not ( = ?auto_181581 ?auto_181582 ) ) ( not ( = ?auto_181581 ?auto_181585 ) ) ( not ( = ?auto_181582 ?auto_181585 ) ) ( not ( = ?auto_181579 ?auto_181584 ) ) ( not ( = ?auto_181579 ?auto_181587 ) ) ( not ( = ?auto_181580 ?auto_181584 ) ) ( not ( = ?auto_181580 ?auto_181587 ) ) ( not ( = ?auto_181581 ?auto_181584 ) ) ( not ( = ?auto_181581 ?auto_181587 ) ) ( not ( = ?auto_181582 ?auto_181584 ) ) ( not ( = ?auto_181582 ?auto_181587 ) ) ( not ( = ?auto_181585 ?auto_181584 ) ) ( not ( = ?auto_181585 ?auto_181587 ) ) ( not ( = ?auto_181584 ?auto_181587 ) ) ( not ( = ?auto_181586 ?auto_181587 ) ) ( not ( = ?auto_181579 ?auto_181586 ) ) ( not ( = ?auto_181580 ?auto_181586 ) ) ( not ( = ?auto_181581 ?auto_181586 ) ) ( not ( = ?auto_181582 ?auto_181586 ) ) ( not ( = ?auto_181585 ?auto_181586 ) ) ( not ( = ?auto_181584 ?auto_181586 ) ) ( ON ?auto_181586 ?auto_181583 ) ( not ( = ?auto_181579 ?auto_181583 ) ) ( not ( = ?auto_181580 ?auto_181583 ) ) ( not ( = ?auto_181581 ?auto_181583 ) ) ( not ( = ?auto_181582 ?auto_181583 ) ) ( not ( = ?auto_181585 ?auto_181583 ) ) ( not ( = ?auto_181584 ?auto_181583 ) ) ( not ( = ?auto_181587 ?auto_181583 ) ) ( not ( = ?auto_181586 ?auto_181583 ) ) ( ON ?auto_181587 ?auto_181586 ) ( ON-TABLE ?auto_181583 ) ( ON ?auto_181584 ?auto_181587 ) ( ON ?auto_181585 ?auto_181584 ) ( CLEAR ?auto_181585 ) ( HOLDING ?auto_181582 ) ( CLEAR ?auto_181581 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181579 ?auto_181580 ?auto_181581 ?auto_181582 ?auto_181585 )
      ( MAKE-4PILE ?auto_181579 ?auto_181580 ?auto_181581 ?auto_181582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181588 - BLOCK
      ?auto_181589 - BLOCK
      ?auto_181590 - BLOCK
      ?auto_181591 - BLOCK
    )
    :vars
    (
      ?auto_181593 - BLOCK
      ?auto_181596 - BLOCK
      ?auto_181595 - BLOCK
      ?auto_181594 - BLOCK
      ?auto_181592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181588 ) ( ON ?auto_181589 ?auto_181588 ) ( ON ?auto_181590 ?auto_181589 ) ( not ( = ?auto_181588 ?auto_181589 ) ) ( not ( = ?auto_181588 ?auto_181590 ) ) ( not ( = ?auto_181588 ?auto_181591 ) ) ( not ( = ?auto_181588 ?auto_181593 ) ) ( not ( = ?auto_181589 ?auto_181590 ) ) ( not ( = ?auto_181589 ?auto_181591 ) ) ( not ( = ?auto_181589 ?auto_181593 ) ) ( not ( = ?auto_181590 ?auto_181591 ) ) ( not ( = ?auto_181590 ?auto_181593 ) ) ( not ( = ?auto_181591 ?auto_181593 ) ) ( not ( = ?auto_181588 ?auto_181596 ) ) ( not ( = ?auto_181588 ?auto_181595 ) ) ( not ( = ?auto_181589 ?auto_181596 ) ) ( not ( = ?auto_181589 ?auto_181595 ) ) ( not ( = ?auto_181590 ?auto_181596 ) ) ( not ( = ?auto_181590 ?auto_181595 ) ) ( not ( = ?auto_181591 ?auto_181596 ) ) ( not ( = ?auto_181591 ?auto_181595 ) ) ( not ( = ?auto_181593 ?auto_181596 ) ) ( not ( = ?auto_181593 ?auto_181595 ) ) ( not ( = ?auto_181596 ?auto_181595 ) ) ( not ( = ?auto_181594 ?auto_181595 ) ) ( not ( = ?auto_181588 ?auto_181594 ) ) ( not ( = ?auto_181589 ?auto_181594 ) ) ( not ( = ?auto_181590 ?auto_181594 ) ) ( not ( = ?auto_181591 ?auto_181594 ) ) ( not ( = ?auto_181593 ?auto_181594 ) ) ( not ( = ?auto_181596 ?auto_181594 ) ) ( ON ?auto_181594 ?auto_181592 ) ( not ( = ?auto_181588 ?auto_181592 ) ) ( not ( = ?auto_181589 ?auto_181592 ) ) ( not ( = ?auto_181590 ?auto_181592 ) ) ( not ( = ?auto_181591 ?auto_181592 ) ) ( not ( = ?auto_181593 ?auto_181592 ) ) ( not ( = ?auto_181596 ?auto_181592 ) ) ( not ( = ?auto_181595 ?auto_181592 ) ) ( not ( = ?auto_181594 ?auto_181592 ) ) ( ON ?auto_181595 ?auto_181594 ) ( ON-TABLE ?auto_181592 ) ( ON ?auto_181596 ?auto_181595 ) ( ON ?auto_181593 ?auto_181596 ) ( CLEAR ?auto_181590 ) ( ON ?auto_181591 ?auto_181593 ) ( CLEAR ?auto_181591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181592 ?auto_181594 ?auto_181595 ?auto_181596 ?auto_181593 )
      ( MAKE-4PILE ?auto_181588 ?auto_181589 ?auto_181590 ?auto_181591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181597 - BLOCK
      ?auto_181598 - BLOCK
      ?auto_181599 - BLOCK
      ?auto_181600 - BLOCK
    )
    :vars
    (
      ?auto_181601 - BLOCK
      ?auto_181602 - BLOCK
      ?auto_181605 - BLOCK
      ?auto_181603 - BLOCK
      ?auto_181604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181597 ) ( ON ?auto_181598 ?auto_181597 ) ( not ( = ?auto_181597 ?auto_181598 ) ) ( not ( = ?auto_181597 ?auto_181599 ) ) ( not ( = ?auto_181597 ?auto_181600 ) ) ( not ( = ?auto_181597 ?auto_181601 ) ) ( not ( = ?auto_181598 ?auto_181599 ) ) ( not ( = ?auto_181598 ?auto_181600 ) ) ( not ( = ?auto_181598 ?auto_181601 ) ) ( not ( = ?auto_181599 ?auto_181600 ) ) ( not ( = ?auto_181599 ?auto_181601 ) ) ( not ( = ?auto_181600 ?auto_181601 ) ) ( not ( = ?auto_181597 ?auto_181602 ) ) ( not ( = ?auto_181597 ?auto_181605 ) ) ( not ( = ?auto_181598 ?auto_181602 ) ) ( not ( = ?auto_181598 ?auto_181605 ) ) ( not ( = ?auto_181599 ?auto_181602 ) ) ( not ( = ?auto_181599 ?auto_181605 ) ) ( not ( = ?auto_181600 ?auto_181602 ) ) ( not ( = ?auto_181600 ?auto_181605 ) ) ( not ( = ?auto_181601 ?auto_181602 ) ) ( not ( = ?auto_181601 ?auto_181605 ) ) ( not ( = ?auto_181602 ?auto_181605 ) ) ( not ( = ?auto_181603 ?auto_181605 ) ) ( not ( = ?auto_181597 ?auto_181603 ) ) ( not ( = ?auto_181598 ?auto_181603 ) ) ( not ( = ?auto_181599 ?auto_181603 ) ) ( not ( = ?auto_181600 ?auto_181603 ) ) ( not ( = ?auto_181601 ?auto_181603 ) ) ( not ( = ?auto_181602 ?auto_181603 ) ) ( ON ?auto_181603 ?auto_181604 ) ( not ( = ?auto_181597 ?auto_181604 ) ) ( not ( = ?auto_181598 ?auto_181604 ) ) ( not ( = ?auto_181599 ?auto_181604 ) ) ( not ( = ?auto_181600 ?auto_181604 ) ) ( not ( = ?auto_181601 ?auto_181604 ) ) ( not ( = ?auto_181602 ?auto_181604 ) ) ( not ( = ?auto_181605 ?auto_181604 ) ) ( not ( = ?auto_181603 ?auto_181604 ) ) ( ON ?auto_181605 ?auto_181603 ) ( ON-TABLE ?auto_181604 ) ( ON ?auto_181602 ?auto_181605 ) ( ON ?auto_181601 ?auto_181602 ) ( ON ?auto_181600 ?auto_181601 ) ( CLEAR ?auto_181600 ) ( HOLDING ?auto_181599 ) ( CLEAR ?auto_181598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181597 ?auto_181598 ?auto_181599 )
      ( MAKE-4PILE ?auto_181597 ?auto_181598 ?auto_181599 ?auto_181600 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181606 - BLOCK
      ?auto_181607 - BLOCK
      ?auto_181608 - BLOCK
      ?auto_181609 - BLOCK
    )
    :vars
    (
      ?auto_181614 - BLOCK
      ?auto_181611 - BLOCK
      ?auto_181610 - BLOCK
      ?auto_181612 - BLOCK
      ?auto_181613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181606 ) ( ON ?auto_181607 ?auto_181606 ) ( not ( = ?auto_181606 ?auto_181607 ) ) ( not ( = ?auto_181606 ?auto_181608 ) ) ( not ( = ?auto_181606 ?auto_181609 ) ) ( not ( = ?auto_181606 ?auto_181614 ) ) ( not ( = ?auto_181607 ?auto_181608 ) ) ( not ( = ?auto_181607 ?auto_181609 ) ) ( not ( = ?auto_181607 ?auto_181614 ) ) ( not ( = ?auto_181608 ?auto_181609 ) ) ( not ( = ?auto_181608 ?auto_181614 ) ) ( not ( = ?auto_181609 ?auto_181614 ) ) ( not ( = ?auto_181606 ?auto_181611 ) ) ( not ( = ?auto_181606 ?auto_181610 ) ) ( not ( = ?auto_181607 ?auto_181611 ) ) ( not ( = ?auto_181607 ?auto_181610 ) ) ( not ( = ?auto_181608 ?auto_181611 ) ) ( not ( = ?auto_181608 ?auto_181610 ) ) ( not ( = ?auto_181609 ?auto_181611 ) ) ( not ( = ?auto_181609 ?auto_181610 ) ) ( not ( = ?auto_181614 ?auto_181611 ) ) ( not ( = ?auto_181614 ?auto_181610 ) ) ( not ( = ?auto_181611 ?auto_181610 ) ) ( not ( = ?auto_181612 ?auto_181610 ) ) ( not ( = ?auto_181606 ?auto_181612 ) ) ( not ( = ?auto_181607 ?auto_181612 ) ) ( not ( = ?auto_181608 ?auto_181612 ) ) ( not ( = ?auto_181609 ?auto_181612 ) ) ( not ( = ?auto_181614 ?auto_181612 ) ) ( not ( = ?auto_181611 ?auto_181612 ) ) ( ON ?auto_181612 ?auto_181613 ) ( not ( = ?auto_181606 ?auto_181613 ) ) ( not ( = ?auto_181607 ?auto_181613 ) ) ( not ( = ?auto_181608 ?auto_181613 ) ) ( not ( = ?auto_181609 ?auto_181613 ) ) ( not ( = ?auto_181614 ?auto_181613 ) ) ( not ( = ?auto_181611 ?auto_181613 ) ) ( not ( = ?auto_181610 ?auto_181613 ) ) ( not ( = ?auto_181612 ?auto_181613 ) ) ( ON ?auto_181610 ?auto_181612 ) ( ON-TABLE ?auto_181613 ) ( ON ?auto_181611 ?auto_181610 ) ( ON ?auto_181614 ?auto_181611 ) ( ON ?auto_181609 ?auto_181614 ) ( CLEAR ?auto_181607 ) ( ON ?auto_181608 ?auto_181609 ) ( CLEAR ?auto_181608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181613 ?auto_181612 ?auto_181610 ?auto_181611 ?auto_181614 ?auto_181609 )
      ( MAKE-4PILE ?auto_181606 ?auto_181607 ?auto_181608 ?auto_181609 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181615 - BLOCK
      ?auto_181616 - BLOCK
      ?auto_181617 - BLOCK
      ?auto_181618 - BLOCK
    )
    :vars
    (
      ?auto_181621 - BLOCK
      ?auto_181623 - BLOCK
      ?auto_181622 - BLOCK
      ?auto_181619 - BLOCK
      ?auto_181620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181615 ) ( not ( = ?auto_181615 ?auto_181616 ) ) ( not ( = ?auto_181615 ?auto_181617 ) ) ( not ( = ?auto_181615 ?auto_181618 ) ) ( not ( = ?auto_181615 ?auto_181621 ) ) ( not ( = ?auto_181616 ?auto_181617 ) ) ( not ( = ?auto_181616 ?auto_181618 ) ) ( not ( = ?auto_181616 ?auto_181621 ) ) ( not ( = ?auto_181617 ?auto_181618 ) ) ( not ( = ?auto_181617 ?auto_181621 ) ) ( not ( = ?auto_181618 ?auto_181621 ) ) ( not ( = ?auto_181615 ?auto_181623 ) ) ( not ( = ?auto_181615 ?auto_181622 ) ) ( not ( = ?auto_181616 ?auto_181623 ) ) ( not ( = ?auto_181616 ?auto_181622 ) ) ( not ( = ?auto_181617 ?auto_181623 ) ) ( not ( = ?auto_181617 ?auto_181622 ) ) ( not ( = ?auto_181618 ?auto_181623 ) ) ( not ( = ?auto_181618 ?auto_181622 ) ) ( not ( = ?auto_181621 ?auto_181623 ) ) ( not ( = ?auto_181621 ?auto_181622 ) ) ( not ( = ?auto_181623 ?auto_181622 ) ) ( not ( = ?auto_181619 ?auto_181622 ) ) ( not ( = ?auto_181615 ?auto_181619 ) ) ( not ( = ?auto_181616 ?auto_181619 ) ) ( not ( = ?auto_181617 ?auto_181619 ) ) ( not ( = ?auto_181618 ?auto_181619 ) ) ( not ( = ?auto_181621 ?auto_181619 ) ) ( not ( = ?auto_181623 ?auto_181619 ) ) ( ON ?auto_181619 ?auto_181620 ) ( not ( = ?auto_181615 ?auto_181620 ) ) ( not ( = ?auto_181616 ?auto_181620 ) ) ( not ( = ?auto_181617 ?auto_181620 ) ) ( not ( = ?auto_181618 ?auto_181620 ) ) ( not ( = ?auto_181621 ?auto_181620 ) ) ( not ( = ?auto_181623 ?auto_181620 ) ) ( not ( = ?auto_181622 ?auto_181620 ) ) ( not ( = ?auto_181619 ?auto_181620 ) ) ( ON ?auto_181622 ?auto_181619 ) ( ON-TABLE ?auto_181620 ) ( ON ?auto_181623 ?auto_181622 ) ( ON ?auto_181621 ?auto_181623 ) ( ON ?auto_181618 ?auto_181621 ) ( ON ?auto_181617 ?auto_181618 ) ( CLEAR ?auto_181617 ) ( HOLDING ?auto_181616 ) ( CLEAR ?auto_181615 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181615 ?auto_181616 )
      ( MAKE-4PILE ?auto_181615 ?auto_181616 ?auto_181617 ?auto_181618 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181624 - BLOCK
      ?auto_181625 - BLOCK
      ?auto_181626 - BLOCK
      ?auto_181627 - BLOCK
    )
    :vars
    (
      ?auto_181631 - BLOCK
      ?auto_181629 - BLOCK
      ?auto_181630 - BLOCK
      ?auto_181632 - BLOCK
      ?auto_181628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181624 ) ( not ( = ?auto_181624 ?auto_181625 ) ) ( not ( = ?auto_181624 ?auto_181626 ) ) ( not ( = ?auto_181624 ?auto_181627 ) ) ( not ( = ?auto_181624 ?auto_181631 ) ) ( not ( = ?auto_181625 ?auto_181626 ) ) ( not ( = ?auto_181625 ?auto_181627 ) ) ( not ( = ?auto_181625 ?auto_181631 ) ) ( not ( = ?auto_181626 ?auto_181627 ) ) ( not ( = ?auto_181626 ?auto_181631 ) ) ( not ( = ?auto_181627 ?auto_181631 ) ) ( not ( = ?auto_181624 ?auto_181629 ) ) ( not ( = ?auto_181624 ?auto_181630 ) ) ( not ( = ?auto_181625 ?auto_181629 ) ) ( not ( = ?auto_181625 ?auto_181630 ) ) ( not ( = ?auto_181626 ?auto_181629 ) ) ( not ( = ?auto_181626 ?auto_181630 ) ) ( not ( = ?auto_181627 ?auto_181629 ) ) ( not ( = ?auto_181627 ?auto_181630 ) ) ( not ( = ?auto_181631 ?auto_181629 ) ) ( not ( = ?auto_181631 ?auto_181630 ) ) ( not ( = ?auto_181629 ?auto_181630 ) ) ( not ( = ?auto_181632 ?auto_181630 ) ) ( not ( = ?auto_181624 ?auto_181632 ) ) ( not ( = ?auto_181625 ?auto_181632 ) ) ( not ( = ?auto_181626 ?auto_181632 ) ) ( not ( = ?auto_181627 ?auto_181632 ) ) ( not ( = ?auto_181631 ?auto_181632 ) ) ( not ( = ?auto_181629 ?auto_181632 ) ) ( ON ?auto_181632 ?auto_181628 ) ( not ( = ?auto_181624 ?auto_181628 ) ) ( not ( = ?auto_181625 ?auto_181628 ) ) ( not ( = ?auto_181626 ?auto_181628 ) ) ( not ( = ?auto_181627 ?auto_181628 ) ) ( not ( = ?auto_181631 ?auto_181628 ) ) ( not ( = ?auto_181629 ?auto_181628 ) ) ( not ( = ?auto_181630 ?auto_181628 ) ) ( not ( = ?auto_181632 ?auto_181628 ) ) ( ON ?auto_181630 ?auto_181632 ) ( ON-TABLE ?auto_181628 ) ( ON ?auto_181629 ?auto_181630 ) ( ON ?auto_181631 ?auto_181629 ) ( ON ?auto_181627 ?auto_181631 ) ( ON ?auto_181626 ?auto_181627 ) ( CLEAR ?auto_181624 ) ( ON ?auto_181625 ?auto_181626 ) ( CLEAR ?auto_181625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181628 ?auto_181632 ?auto_181630 ?auto_181629 ?auto_181631 ?auto_181627 ?auto_181626 )
      ( MAKE-4PILE ?auto_181624 ?auto_181625 ?auto_181626 ?auto_181627 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181633 - BLOCK
      ?auto_181634 - BLOCK
      ?auto_181635 - BLOCK
      ?auto_181636 - BLOCK
    )
    :vars
    (
      ?auto_181640 - BLOCK
      ?auto_181638 - BLOCK
      ?auto_181637 - BLOCK
      ?auto_181641 - BLOCK
      ?auto_181639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181633 ?auto_181634 ) ) ( not ( = ?auto_181633 ?auto_181635 ) ) ( not ( = ?auto_181633 ?auto_181636 ) ) ( not ( = ?auto_181633 ?auto_181640 ) ) ( not ( = ?auto_181634 ?auto_181635 ) ) ( not ( = ?auto_181634 ?auto_181636 ) ) ( not ( = ?auto_181634 ?auto_181640 ) ) ( not ( = ?auto_181635 ?auto_181636 ) ) ( not ( = ?auto_181635 ?auto_181640 ) ) ( not ( = ?auto_181636 ?auto_181640 ) ) ( not ( = ?auto_181633 ?auto_181638 ) ) ( not ( = ?auto_181633 ?auto_181637 ) ) ( not ( = ?auto_181634 ?auto_181638 ) ) ( not ( = ?auto_181634 ?auto_181637 ) ) ( not ( = ?auto_181635 ?auto_181638 ) ) ( not ( = ?auto_181635 ?auto_181637 ) ) ( not ( = ?auto_181636 ?auto_181638 ) ) ( not ( = ?auto_181636 ?auto_181637 ) ) ( not ( = ?auto_181640 ?auto_181638 ) ) ( not ( = ?auto_181640 ?auto_181637 ) ) ( not ( = ?auto_181638 ?auto_181637 ) ) ( not ( = ?auto_181641 ?auto_181637 ) ) ( not ( = ?auto_181633 ?auto_181641 ) ) ( not ( = ?auto_181634 ?auto_181641 ) ) ( not ( = ?auto_181635 ?auto_181641 ) ) ( not ( = ?auto_181636 ?auto_181641 ) ) ( not ( = ?auto_181640 ?auto_181641 ) ) ( not ( = ?auto_181638 ?auto_181641 ) ) ( ON ?auto_181641 ?auto_181639 ) ( not ( = ?auto_181633 ?auto_181639 ) ) ( not ( = ?auto_181634 ?auto_181639 ) ) ( not ( = ?auto_181635 ?auto_181639 ) ) ( not ( = ?auto_181636 ?auto_181639 ) ) ( not ( = ?auto_181640 ?auto_181639 ) ) ( not ( = ?auto_181638 ?auto_181639 ) ) ( not ( = ?auto_181637 ?auto_181639 ) ) ( not ( = ?auto_181641 ?auto_181639 ) ) ( ON ?auto_181637 ?auto_181641 ) ( ON-TABLE ?auto_181639 ) ( ON ?auto_181638 ?auto_181637 ) ( ON ?auto_181640 ?auto_181638 ) ( ON ?auto_181636 ?auto_181640 ) ( ON ?auto_181635 ?auto_181636 ) ( ON ?auto_181634 ?auto_181635 ) ( CLEAR ?auto_181634 ) ( HOLDING ?auto_181633 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181633 )
      ( MAKE-4PILE ?auto_181633 ?auto_181634 ?auto_181635 ?auto_181636 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181642 - BLOCK
      ?auto_181643 - BLOCK
      ?auto_181644 - BLOCK
      ?auto_181645 - BLOCK
    )
    :vars
    (
      ?auto_181647 - BLOCK
      ?auto_181649 - BLOCK
      ?auto_181646 - BLOCK
      ?auto_181650 - BLOCK
      ?auto_181648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181642 ?auto_181643 ) ) ( not ( = ?auto_181642 ?auto_181644 ) ) ( not ( = ?auto_181642 ?auto_181645 ) ) ( not ( = ?auto_181642 ?auto_181647 ) ) ( not ( = ?auto_181643 ?auto_181644 ) ) ( not ( = ?auto_181643 ?auto_181645 ) ) ( not ( = ?auto_181643 ?auto_181647 ) ) ( not ( = ?auto_181644 ?auto_181645 ) ) ( not ( = ?auto_181644 ?auto_181647 ) ) ( not ( = ?auto_181645 ?auto_181647 ) ) ( not ( = ?auto_181642 ?auto_181649 ) ) ( not ( = ?auto_181642 ?auto_181646 ) ) ( not ( = ?auto_181643 ?auto_181649 ) ) ( not ( = ?auto_181643 ?auto_181646 ) ) ( not ( = ?auto_181644 ?auto_181649 ) ) ( not ( = ?auto_181644 ?auto_181646 ) ) ( not ( = ?auto_181645 ?auto_181649 ) ) ( not ( = ?auto_181645 ?auto_181646 ) ) ( not ( = ?auto_181647 ?auto_181649 ) ) ( not ( = ?auto_181647 ?auto_181646 ) ) ( not ( = ?auto_181649 ?auto_181646 ) ) ( not ( = ?auto_181650 ?auto_181646 ) ) ( not ( = ?auto_181642 ?auto_181650 ) ) ( not ( = ?auto_181643 ?auto_181650 ) ) ( not ( = ?auto_181644 ?auto_181650 ) ) ( not ( = ?auto_181645 ?auto_181650 ) ) ( not ( = ?auto_181647 ?auto_181650 ) ) ( not ( = ?auto_181649 ?auto_181650 ) ) ( ON ?auto_181650 ?auto_181648 ) ( not ( = ?auto_181642 ?auto_181648 ) ) ( not ( = ?auto_181643 ?auto_181648 ) ) ( not ( = ?auto_181644 ?auto_181648 ) ) ( not ( = ?auto_181645 ?auto_181648 ) ) ( not ( = ?auto_181647 ?auto_181648 ) ) ( not ( = ?auto_181649 ?auto_181648 ) ) ( not ( = ?auto_181646 ?auto_181648 ) ) ( not ( = ?auto_181650 ?auto_181648 ) ) ( ON ?auto_181646 ?auto_181650 ) ( ON-TABLE ?auto_181648 ) ( ON ?auto_181649 ?auto_181646 ) ( ON ?auto_181647 ?auto_181649 ) ( ON ?auto_181645 ?auto_181647 ) ( ON ?auto_181644 ?auto_181645 ) ( ON ?auto_181643 ?auto_181644 ) ( ON ?auto_181642 ?auto_181643 ) ( CLEAR ?auto_181642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181648 ?auto_181650 ?auto_181646 ?auto_181649 ?auto_181647 ?auto_181645 ?auto_181644 ?auto_181643 )
      ( MAKE-4PILE ?auto_181642 ?auto_181643 ?auto_181644 ?auto_181645 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181655 - BLOCK
      ?auto_181656 - BLOCK
      ?auto_181657 - BLOCK
      ?auto_181658 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_181658 ) ( CLEAR ?auto_181657 ) ( ON-TABLE ?auto_181655 ) ( ON ?auto_181656 ?auto_181655 ) ( ON ?auto_181657 ?auto_181656 ) ( not ( = ?auto_181655 ?auto_181656 ) ) ( not ( = ?auto_181655 ?auto_181657 ) ) ( not ( = ?auto_181655 ?auto_181658 ) ) ( not ( = ?auto_181656 ?auto_181657 ) ) ( not ( = ?auto_181656 ?auto_181658 ) ) ( not ( = ?auto_181657 ?auto_181658 ) ) )
    :subtasks
    ( ( !STACK ?auto_181658 ?auto_181657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181659 - BLOCK
      ?auto_181660 - BLOCK
      ?auto_181661 - BLOCK
      ?auto_181662 - BLOCK
    )
    :vars
    (
      ?auto_181663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181661 ) ( ON-TABLE ?auto_181659 ) ( ON ?auto_181660 ?auto_181659 ) ( ON ?auto_181661 ?auto_181660 ) ( not ( = ?auto_181659 ?auto_181660 ) ) ( not ( = ?auto_181659 ?auto_181661 ) ) ( not ( = ?auto_181659 ?auto_181662 ) ) ( not ( = ?auto_181660 ?auto_181661 ) ) ( not ( = ?auto_181660 ?auto_181662 ) ) ( not ( = ?auto_181661 ?auto_181662 ) ) ( ON ?auto_181662 ?auto_181663 ) ( CLEAR ?auto_181662 ) ( HAND-EMPTY ) ( not ( = ?auto_181659 ?auto_181663 ) ) ( not ( = ?auto_181660 ?auto_181663 ) ) ( not ( = ?auto_181661 ?auto_181663 ) ) ( not ( = ?auto_181662 ?auto_181663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181662 ?auto_181663 )
      ( MAKE-4PILE ?auto_181659 ?auto_181660 ?auto_181661 ?auto_181662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181664 - BLOCK
      ?auto_181665 - BLOCK
      ?auto_181666 - BLOCK
      ?auto_181667 - BLOCK
    )
    :vars
    (
      ?auto_181668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181664 ) ( ON ?auto_181665 ?auto_181664 ) ( not ( = ?auto_181664 ?auto_181665 ) ) ( not ( = ?auto_181664 ?auto_181666 ) ) ( not ( = ?auto_181664 ?auto_181667 ) ) ( not ( = ?auto_181665 ?auto_181666 ) ) ( not ( = ?auto_181665 ?auto_181667 ) ) ( not ( = ?auto_181666 ?auto_181667 ) ) ( ON ?auto_181667 ?auto_181668 ) ( CLEAR ?auto_181667 ) ( not ( = ?auto_181664 ?auto_181668 ) ) ( not ( = ?auto_181665 ?auto_181668 ) ) ( not ( = ?auto_181666 ?auto_181668 ) ) ( not ( = ?auto_181667 ?auto_181668 ) ) ( HOLDING ?auto_181666 ) ( CLEAR ?auto_181665 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181664 ?auto_181665 ?auto_181666 )
      ( MAKE-4PILE ?auto_181664 ?auto_181665 ?auto_181666 ?auto_181667 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181669 - BLOCK
      ?auto_181670 - BLOCK
      ?auto_181671 - BLOCK
      ?auto_181672 - BLOCK
    )
    :vars
    (
      ?auto_181673 - BLOCK
      ?auto_181675 - BLOCK
      ?auto_181674 - BLOCK
      ?auto_181676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181669 ) ( ON ?auto_181670 ?auto_181669 ) ( not ( = ?auto_181669 ?auto_181670 ) ) ( not ( = ?auto_181669 ?auto_181671 ) ) ( not ( = ?auto_181669 ?auto_181672 ) ) ( not ( = ?auto_181670 ?auto_181671 ) ) ( not ( = ?auto_181670 ?auto_181672 ) ) ( not ( = ?auto_181671 ?auto_181672 ) ) ( ON ?auto_181672 ?auto_181673 ) ( not ( = ?auto_181669 ?auto_181673 ) ) ( not ( = ?auto_181670 ?auto_181673 ) ) ( not ( = ?auto_181671 ?auto_181673 ) ) ( not ( = ?auto_181672 ?auto_181673 ) ) ( CLEAR ?auto_181670 ) ( ON ?auto_181671 ?auto_181672 ) ( CLEAR ?auto_181671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181675 ) ( ON ?auto_181674 ?auto_181675 ) ( ON ?auto_181676 ?auto_181674 ) ( ON ?auto_181673 ?auto_181676 ) ( not ( = ?auto_181675 ?auto_181674 ) ) ( not ( = ?auto_181675 ?auto_181676 ) ) ( not ( = ?auto_181675 ?auto_181673 ) ) ( not ( = ?auto_181675 ?auto_181672 ) ) ( not ( = ?auto_181675 ?auto_181671 ) ) ( not ( = ?auto_181674 ?auto_181676 ) ) ( not ( = ?auto_181674 ?auto_181673 ) ) ( not ( = ?auto_181674 ?auto_181672 ) ) ( not ( = ?auto_181674 ?auto_181671 ) ) ( not ( = ?auto_181676 ?auto_181673 ) ) ( not ( = ?auto_181676 ?auto_181672 ) ) ( not ( = ?auto_181676 ?auto_181671 ) ) ( not ( = ?auto_181669 ?auto_181675 ) ) ( not ( = ?auto_181669 ?auto_181674 ) ) ( not ( = ?auto_181669 ?auto_181676 ) ) ( not ( = ?auto_181670 ?auto_181675 ) ) ( not ( = ?auto_181670 ?auto_181674 ) ) ( not ( = ?auto_181670 ?auto_181676 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181675 ?auto_181674 ?auto_181676 ?auto_181673 ?auto_181672 )
      ( MAKE-4PILE ?auto_181669 ?auto_181670 ?auto_181671 ?auto_181672 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181677 - BLOCK
      ?auto_181678 - BLOCK
      ?auto_181679 - BLOCK
      ?auto_181680 - BLOCK
    )
    :vars
    (
      ?auto_181683 - BLOCK
      ?auto_181681 - BLOCK
      ?auto_181684 - BLOCK
      ?auto_181682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181677 ) ( not ( = ?auto_181677 ?auto_181678 ) ) ( not ( = ?auto_181677 ?auto_181679 ) ) ( not ( = ?auto_181677 ?auto_181680 ) ) ( not ( = ?auto_181678 ?auto_181679 ) ) ( not ( = ?auto_181678 ?auto_181680 ) ) ( not ( = ?auto_181679 ?auto_181680 ) ) ( ON ?auto_181680 ?auto_181683 ) ( not ( = ?auto_181677 ?auto_181683 ) ) ( not ( = ?auto_181678 ?auto_181683 ) ) ( not ( = ?auto_181679 ?auto_181683 ) ) ( not ( = ?auto_181680 ?auto_181683 ) ) ( ON ?auto_181679 ?auto_181680 ) ( CLEAR ?auto_181679 ) ( ON-TABLE ?auto_181681 ) ( ON ?auto_181684 ?auto_181681 ) ( ON ?auto_181682 ?auto_181684 ) ( ON ?auto_181683 ?auto_181682 ) ( not ( = ?auto_181681 ?auto_181684 ) ) ( not ( = ?auto_181681 ?auto_181682 ) ) ( not ( = ?auto_181681 ?auto_181683 ) ) ( not ( = ?auto_181681 ?auto_181680 ) ) ( not ( = ?auto_181681 ?auto_181679 ) ) ( not ( = ?auto_181684 ?auto_181682 ) ) ( not ( = ?auto_181684 ?auto_181683 ) ) ( not ( = ?auto_181684 ?auto_181680 ) ) ( not ( = ?auto_181684 ?auto_181679 ) ) ( not ( = ?auto_181682 ?auto_181683 ) ) ( not ( = ?auto_181682 ?auto_181680 ) ) ( not ( = ?auto_181682 ?auto_181679 ) ) ( not ( = ?auto_181677 ?auto_181681 ) ) ( not ( = ?auto_181677 ?auto_181684 ) ) ( not ( = ?auto_181677 ?auto_181682 ) ) ( not ( = ?auto_181678 ?auto_181681 ) ) ( not ( = ?auto_181678 ?auto_181684 ) ) ( not ( = ?auto_181678 ?auto_181682 ) ) ( HOLDING ?auto_181678 ) ( CLEAR ?auto_181677 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181677 ?auto_181678 )
      ( MAKE-4PILE ?auto_181677 ?auto_181678 ?auto_181679 ?auto_181680 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181685 - BLOCK
      ?auto_181686 - BLOCK
      ?auto_181687 - BLOCK
      ?auto_181688 - BLOCK
    )
    :vars
    (
      ?auto_181691 - BLOCK
      ?auto_181692 - BLOCK
      ?auto_181690 - BLOCK
      ?auto_181689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181685 ) ( not ( = ?auto_181685 ?auto_181686 ) ) ( not ( = ?auto_181685 ?auto_181687 ) ) ( not ( = ?auto_181685 ?auto_181688 ) ) ( not ( = ?auto_181686 ?auto_181687 ) ) ( not ( = ?auto_181686 ?auto_181688 ) ) ( not ( = ?auto_181687 ?auto_181688 ) ) ( ON ?auto_181688 ?auto_181691 ) ( not ( = ?auto_181685 ?auto_181691 ) ) ( not ( = ?auto_181686 ?auto_181691 ) ) ( not ( = ?auto_181687 ?auto_181691 ) ) ( not ( = ?auto_181688 ?auto_181691 ) ) ( ON ?auto_181687 ?auto_181688 ) ( ON-TABLE ?auto_181692 ) ( ON ?auto_181690 ?auto_181692 ) ( ON ?auto_181689 ?auto_181690 ) ( ON ?auto_181691 ?auto_181689 ) ( not ( = ?auto_181692 ?auto_181690 ) ) ( not ( = ?auto_181692 ?auto_181689 ) ) ( not ( = ?auto_181692 ?auto_181691 ) ) ( not ( = ?auto_181692 ?auto_181688 ) ) ( not ( = ?auto_181692 ?auto_181687 ) ) ( not ( = ?auto_181690 ?auto_181689 ) ) ( not ( = ?auto_181690 ?auto_181691 ) ) ( not ( = ?auto_181690 ?auto_181688 ) ) ( not ( = ?auto_181690 ?auto_181687 ) ) ( not ( = ?auto_181689 ?auto_181691 ) ) ( not ( = ?auto_181689 ?auto_181688 ) ) ( not ( = ?auto_181689 ?auto_181687 ) ) ( not ( = ?auto_181685 ?auto_181692 ) ) ( not ( = ?auto_181685 ?auto_181690 ) ) ( not ( = ?auto_181685 ?auto_181689 ) ) ( not ( = ?auto_181686 ?auto_181692 ) ) ( not ( = ?auto_181686 ?auto_181690 ) ) ( not ( = ?auto_181686 ?auto_181689 ) ) ( CLEAR ?auto_181685 ) ( ON ?auto_181686 ?auto_181687 ) ( CLEAR ?auto_181686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181692 ?auto_181690 ?auto_181689 ?auto_181691 ?auto_181688 ?auto_181687 )
      ( MAKE-4PILE ?auto_181685 ?auto_181686 ?auto_181687 ?auto_181688 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181693 - BLOCK
      ?auto_181694 - BLOCK
      ?auto_181695 - BLOCK
      ?auto_181696 - BLOCK
    )
    :vars
    (
      ?auto_181699 - BLOCK
      ?auto_181700 - BLOCK
      ?auto_181697 - BLOCK
      ?auto_181698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181693 ?auto_181694 ) ) ( not ( = ?auto_181693 ?auto_181695 ) ) ( not ( = ?auto_181693 ?auto_181696 ) ) ( not ( = ?auto_181694 ?auto_181695 ) ) ( not ( = ?auto_181694 ?auto_181696 ) ) ( not ( = ?auto_181695 ?auto_181696 ) ) ( ON ?auto_181696 ?auto_181699 ) ( not ( = ?auto_181693 ?auto_181699 ) ) ( not ( = ?auto_181694 ?auto_181699 ) ) ( not ( = ?auto_181695 ?auto_181699 ) ) ( not ( = ?auto_181696 ?auto_181699 ) ) ( ON ?auto_181695 ?auto_181696 ) ( ON-TABLE ?auto_181700 ) ( ON ?auto_181697 ?auto_181700 ) ( ON ?auto_181698 ?auto_181697 ) ( ON ?auto_181699 ?auto_181698 ) ( not ( = ?auto_181700 ?auto_181697 ) ) ( not ( = ?auto_181700 ?auto_181698 ) ) ( not ( = ?auto_181700 ?auto_181699 ) ) ( not ( = ?auto_181700 ?auto_181696 ) ) ( not ( = ?auto_181700 ?auto_181695 ) ) ( not ( = ?auto_181697 ?auto_181698 ) ) ( not ( = ?auto_181697 ?auto_181699 ) ) ( not ( = ?auto_181697 ?auto_181696 ) ) ( not ( = ?auto_181697 ?auto_181695 ) ) ( not ( = ?auto_181698 ?auto_181699 ) ) ( not ( = ?auto_181698 ?auto_181696 ) ) ( not ( = ?auto_181698 ?auto_181695 ) ) ( not ( = ?auto_181693 ?auto_181700 ) ) ( not ( = ?auto_181693 ?auto_181697 ) ) ( not ( = ?auto_181693 ?auto_181698 ) ) ( not ( = ?auto_181694 ?auto_181700 ) ) ( not ( = ?auto_181694 ?auto_181697 ) ) ( not ( = ?auto_181694 ?auto_181698 ) ) ( ON ?auto_181694 ?auto_181695 ) ( CLEAR ?auto_181694 ) ( HOLDING ?auto_181693 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181693 )
      ( MAKE-4PILE ?auto_181693 ?auto_181694 ?auto_181695 ?auto_181696 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181701 - BLOCK
      ?auto_181702 - BLOCK
      ?auto_181703 - BLOCK
      ?auto_181704 - BLOCK
    )
    :vars
    (
      ?auto_181706 - BLOCK
      ?auto_181708 - BLOCK
      ?auto_181707 - BLOCK
      ?auto_181705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181701 ?auto_181702 ) ) ( not ( = ?auto_181701 ?auto_181703 ) ) ( not ( = ?auto_181701 ?auto_181704 ) ) ( not ( = ?auto_181702 ?auto_181703 ) ) ( not ( = ?auto_181702 ?auto_181704 ) ) ( not ( = ?auto_181703 ?auto_181704 ) ) ( ON ?auto_181704 ?auto_181706 ) ( not ( = ?auto_181701 ?auto_181706 ) ) ( not ( = ?auto_181702 ?auto_181706 ) ) ( not ( = ?auto_181703 ?auto_181706 ) ) ( not ( = ?auto_181704 ?auto_181706 ) ) ( ON ?auto_181703 ?auto_181704 ) ( ON-TABLE ?auto_181708 ) ( ON ?auto_181707 ?auto_181708 ) ( ON ?auto_181705 ?auto_181707 ) ( ON ?auto_181706 ?auto_181705 ) ( not ( = ?auto_181708 ?auto_181707 ) ) ( not ( = ?auto_181708 ?auto_181705 ) ) ( not ( = ?auto_181708 ?auto_181706 ) ) ( not ( = ?auto_181708 ?auto_181704 ) ) ( not ( = ?auto_181708 ?auto_181703 ) ) ( not ( = ?auto_181707 ?auto_181705 ) ) ( not ( = ?auto_181707 ?auto_181706 ) ) ( not ( = ?auto_181707 ?auto_181704 ) ) ( not ( = ?auto_181707 ?auto_181703 ) ) ( not ( = ?auto_181705 ?auto_181706 ) ) ( not ( = ?auto_181705 ?auto_181704 ) ) ( not ( = ?auto_181705 ?auto_181703 ) ) ( not ( = ?auto_181701 ?auto_181708 ) ) ( not ( = ?auto_181701 ?auto_181707 ) ) ( not ( = ?auto_181701 ?auto_181705 ) ) ( not ( = ?auto_181702 ?auto_181708 ) ) ( not ( = ?auto_181702 ?auto_181707 ) ) ( not ( = ?auto_181702 ?auto_181705 ) ) ( ON ?auto_181702 ?auto_181703 ) ( ON ?auto_181701 ?auto_181702 ) ( CLEAR ?auto_181701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181708 ?auto_181707 ?auto_181705 ?auto_181706 ?auto_181704 ?auto_181703 ?auto_181702 )
      ( MAKE-4PILE ?auto_181701 ?auto_181702 ?auto_181703 ?auto_181704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181709 - BLOCK
      ?auto_181710 - BLOCK
      ?auto_181711 - BLOCK
      ?auto_181712 - BLOCK
    )
    :vars
    (
      ?auto_181716 - BLOCK
      ?auto_181713 - BLOCK
      ?auto_181714 - BLOCK
      ?auto_181715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181709 ?auto_181710 ) ) ( not ( = ?auto_181709 ?auto_181711 ) ) ( not ( = ?auto_181709 ?auto_181712 ) ) ( not ( = ?auto_181710 ?auto_181711 ) ) ( not ( = ?auto_181710 ?auto_181712 ) ) ( not ( = ?auto_181711 ?auto_181712 ) ) ( ON ?auto_181712 ?auto_181716 ) ( not ( = ?auto_181709 ?auto_181716 ) ) ( not ( = ?auto_181710 ?auto_181716 ) ) ( not ( = ?auto_181711 ?auto_181716 ) ) ( not ( = ?auto_181712 ?auto_181716 ) ) ( ON ?auto_181711 ?auto_181712 ) ( ON-TABLE ?auto_181713 ) ( ON ?auto_181714 ?auto_181713 ) ( ON ?auto_181715 ?auto_181714 ) ( ON ?auto_181716 ?auto_181715 ) ( not ( = ?auto_181713 ?auto_181714 ) ) ( not ( = ?auto_181713 ?auto_181715 ) ) ( not ( = ?auto_181713 ?auto_181716 ) ) ( not ( = ?auto_181713 ?auto_181712 ) ) ( not ( = ?auto_181713 ?auto_181711 ) ) ( not ( = ?auto_181714 ?auto_181715 ) ) ( not ( = ?auto_181714 ?auto_181716 ) ) ( not ( = ?auto_181714 ?auto_181712 ) ) ( not ( = ?auto_181714 ?auto_181711 ) ) ( not ( = ?auto_181715 ?auto_181716 ) ) ( not ( = ?auto_181715 ?auto_181712 ) ) ( not ( = ?auto_181715 ?auto_181711 ) ) ( not ( = ?auto_181709 ?auto_181713 ) ) ( not ( = ?auto_181709 ?auto_181714 ) ) ( not ( = ?auto_181709 ?auto_181715 ) ) ( not ( = ?auto_181710 ?auto_181713 ) ) ( not ( = ?auto_181710 ?auto_181714 ) ) ( not ( = ?auto_181710 ?auto_181715 ) ) ( ON ?auto_181710 ?auto_181711 ) ( HOLDING ?auto_181709 ) ( CLEAR ?auto_181710 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181713 ?auto_181714 ?auto_181715 ?auto_181716 ?auto_181712 ?auto_181711 ?auto_181710 ?auto_181709 )
      ( MAKE-4PILE ?auto_181709 ?auto_181710 ?auto_181711 ?auto_181712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181717 - BLOCK
      ?auto_181718 - BLOCK
      ?auto_181719 - BLOCK
      ?auto_181720 - BLOCK
    )
    :vars
    (
      ?auto_181724 - BLOCK
      ?auto_181721 - BLOCK
      ?auto_181722 - BLOCK
      ?auto_181723 - BLOCK
      ?auto_181725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181717 ?auto_181718 ) ) ( not ( = ?auto_181717 ?auto_181719 ) ) ( not ( = ?auto_181717 ?auto_181720 ) ) ( not ( = ?auto_181718 ?auto_181719 ) ) ( not ( = ?auto_181718 ?auto_181720 ) ) ( not ( = ?auto_181719 ?auto_181720 ) ) ( ON ?auto_181720 ?auto_181724 ) ( not ( = ?auto_181717 ?auto_181724 ) ) ( not ( = ?auto_181718 ?auto_181724 ) ) ( not ( = ?auto_181719 ?auto_181724 ) ) ( not ( = ?auto_181720 ?auto_181724 ) ) ( ON ?auto_181719 ?auto_181720 ) ( ON-TABLE ?auto_181721 ) ( ON ?auto_181722 ?auto_181721 ) ( ON ?auto_181723 ?auto_181722 ) ( ON ?auto_181724 ?auto_181723 ) ( not ( = ?auto_181721 ?auto_181722 ) ) ( not ( = ?auto_181721 ?auto_181723 ) ) ( not ( = ?auto_181721 ?auto_181724 ) ) ( not ( = ?auto_181721 ?auto_181720 ) ) ( not ( = ?auto_181721 ?auto_181719 ) ) ( not ( = ?auto_181722 ?auto_181723 ) ) ( not ( = ?auto_181722 ?auto_181724 ) ) ( not ( = ?auto_181722 ?auto_181720 ) ) ( not ( = ?auto_181722 ?auto_181719 ) ) ( not ( = ?auto_181723 ?auto_181724 ) ) ( not ( = ?auto_181723 ?auto_181720 ) ) ( not ( = ?auto_181723 ?auto_181719 ) ) ( not ( = ?auto_181717 ?auto_181721 ) ) ( not ( = ?auto_181717 ?auto_181722 ) ) ( not ( = ?auto_181717 ?auto_181723 ) ) ( not ( = ?auto_181718 ?auto_181721 ) ) ( not ( = ?auto_181718 ?auto_181722 ) ) ( not ( = ?auto_181718 ?auto_181723 ) ) ( ON ?auto_181718 ?auto_181719 ) ( CLEAR ?auto_181718 ) ( ON ?auto_181717 ?auto_181725 ) ( CLEAR ?auto_181717 ) ( HAND-EMPTY ) ( not ( = ?auto_181717 ?auto_181725 ) ) ( not ( = ?auto_181718 ?auto_181725 ) ) ( not ( = ?auto_181719 ?auto_181725 ) ) ( not ( = ?auto_181720 ?auto_181725 ) ) ( not ( = ?auto_181724 ?auto_181725 ) ) ( not ( = ?auto_181721 ?auto_181725 ) ) ( not ( = ?auto_181722 ?auto_181725 ) ) ( not ( = ?auto_181723 ?auto_181725 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181717 ?auto_181725 )
      ( MAKE-4PILE ?auto_181717 ?auto_181718 ?auto_181719 ?auto_181720 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181726 - BLOCK
      ?auto_181727 - BLOCK
      ?auto_181728 - BLOCK
      ?auto_181729 - BLOCK
    )
    :vars
    (
      ?auto_181732 - BLOCK
      ?auto_181733 - BLOCK
      ?auto_181734 - BLOCK
      ?auto_181730 - BLOCK
      ?auto_181731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181726 ?auto_181727 ) ) ( not ( = ?auto_181726 ?auto_181728 ) ) ( not ( = ?auto_181726 ?auto_181729 ) ) ( not ( = ?auto_181727 ?auto_181728 ) ) ( not ( = ?auto_181727 ?auto_181729 ) ) ( not ( = ?auto_181728 ?auto_181729 ) ) ( ON ?auto_181729 ?auto_181732 ) ( not ( = ?auto_181726 ?auto_181732 ) ) ( not ( = ?auto_181727 ?auto_181732 ) ) ( not ( = ?auto_181728 ?auto_181732 ) ) ( not ( = ?auto_181729 ?auto_181732 ) ) ( ON ?auto_181728 ?auto_181729 ) ( ON-TABLE ?auto_181733 ) ( ON ?auto_181734 ?auto_181733 ) ( ON ?auto_181730 ?auto_181734 ) ( ON ?auto_181732 ?auto_181730 ) ( not ( = ?auto_181733 ?auto_181734 ) ) ( not ( = ?auto_181733 ?auto_181730 ) ) ( not ( = ?auto_181733 ?auto_181732 ) ) ( not ( = ?auto_181733 ?auto_181729 ) ) ( not ( = ?auto_181733 ?auto_181728 ) ) ( not ( = ?auto_181734 ?auto_181730 ) ) ( not ( = ?auto_181734 ?auto_181732 ) ) ( not ( = ?auto_181734 ?auto_181729 ) ) ( not ( = ?auto_181734 ?auto_181728 ) ) ( not ( = ?auto_181730 ?auto_181732 ) ) ( not ( = ?auto_181730 ?auto_181729 ) ) ( not ( = ?auto_181730 ?auto_181728 ) ) ( not ( = ?auto_181726 ?auto_181733 ) ) ( not ( = ?auto_181726 ?auto_181734 ) ) ( not ( = ?auto_181726 ?auto_181730 ) ) ( not ( = ?auto_181727 ?auto_181733 ) ) ( not ( = ?auto_181727 ?auto_181734 ) ) ( not ( = ?auto_181727 ?auto_181730 ) ) ( ON ?auto_181726 ?auto_181731 ) ( CLEAR ?auto_181726 ) ( not ( = ?auto_181726 ?auto_181731 ) ) ( not ( = ?auto_181727 ?auto_181731 ) ) ( not ( = ?auto_181728 ?auto_181731 ) ) ( not ( = ?auto_181729 ?auto_181731 ) ) ( not ( = ?auto_181732 ?auto_181731 ) ) ( not ( = ?auto_181733 ?auto_181731 ) ) ( not ( = ?auto_181734 ?auto_181731 ) ) ( not ( = ?auto_181730 ?auto_181731 ) ) ( HOLDING ?auto_181727 ) ( CLEAR ?auto_181728 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181733 ?auto_181734 ?auto_181730 ?auto_181732 ?auto_181729 ?auto_181728 ?auto_181727 )
      ( MAKE-4PILE ?auto_181726 ?auto_181727 ?auto_181728 ?auto_181729 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181735 - BLOCK
      ?auto_181736 - BLOCK
      ?auto_181737 - BLOCK
      ?auto_181738 - BLOCK
    )
    :vars
    (
      ?auto_181739 - BLOCK
      ?auto_181742 - BLOCK
      ?auto_181743 - BLOCK
      ?auto_181741 - BLOCK
      ?auto_181740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181735 ?auto_181736 ) ) ( not ( = ?auto_181735 ?auto_181737 ) ) ( not ( = ?auto_181735 ?auto_181738 ) ) ( not ( = ?auto_181736 ?auto_181737 ) ) ( not ( = ?auto_181736 ?auto_181738 ) ) ( not ( = ?auto_181737 ?auto_181738 ) ) ( ON ?auto_181738 ?auto_181739 ) ( not ( = ?auto_181735 ?auto_181739 ) ) ( not ( = ?auto_181736 ?auto_181739 ) ) ( not ( = ?auto_181737 ?auto_181739 ) ) ( not ( = ?auto_181738 ?auto_181739 ) ) ( ON ?auto_181737 ?auto_181738 ) ( ON-TABLE ?auto_181742 ) ( ON ?auto_181743 ?auto_181742 ) ( ON ?auto_181741 ?auto_181743 ) ( ON ?auto_181739 ?auto_181741 ) ( not ( = ?auto_181742 ?auto_181743 ) ) ( not ( = ?auto_181742 ?auto_181741 ) ) ( not ( = ?auto_181742 ?auto_181739 ) ) ( not ( = ?auto_181742 ?auto_181738 ) ) ( not ( = ?auto_181742 ?auto_181737 ) ) ( not ( = ?auto_181743 ?auto_181741 ) ) ( not ( = ?auto_181743 ?auto_181739 ) ) ( not ( = ?auto_181743 ?auto_181738 ) ) ( not ( = ?auto_181743 ?auto_181737 ) ) ( not ( = ?auto_181741 ?auto_181739 ) ) ( not ( = ?auto_181741 ?auto_181738 ) ) ( not ( = ?auto_181741 ?auto_181737 ) ) ( not ( = ?auto_181735 ?auto_181742 ) ) ( not ( = ?auto_181735 ?auto_181743 ) ) ( not ( = ?auto_181735 ?auto_181741 ) ) ( not ( = ?auto_181736 ?auto_181742 ) ) ( not ( = ?auto_181736 ?auto_181743 ) ) ( not ( = ?auto_181736 ?auto_181741 ) ) ( ON ?auto_181735 ?auto_181740 ) ( not ( = ?auto_181735 ?auto_181740 ) ) ( not ( = ?auto_181736 ?auto_181740 ) ) ( not ( = ?auto_181737 ?auto_181740 ) ) ( not ( = ?auto_181738 ?auto_181740 ) ) ( not ( = ?auto_181739 ?auto_181740 ) ) ( not ( = ?auto_181742 ?auto_181740 ) ) ( not ( = ?auto_181743 ?auto_181740 ) ) ( not ( = ?auto_181741 ?auto_181740 ) ) ( CLEAR ?auto_181737 ) ( ON ?auto_181736 ?auto_181735 ) ( CLEAR ?auto_181736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181740 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181740 ?auto_181735 )
      ( MAKE-4PILE ?auto_181735 ?auto_181736 ?auto_181737 ?auto_181738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181744 - BLOCK
      ?auto_181745 - BLOCK
      ?auto_181746 - BLOCK
      ?auto_181747 - BLOCK
    )
    :vars
    (
      ?auto_181752 - BLOCK
      ?auto_181748 - BLOCK
      ?auto_181751 - BLOCK
      ?auto_181749 - BLOCK
      ?auto_181750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181744 ?auto_181745 ) ) ( not ( = ?auto_181744 ?auto_181746 ) ) ( not ( = ?auto_181744 ?auto_181747 ) ) ( not ( = ?auto_181745 ?auto_181746 ) ) ( not ( = ?auto_181745 ?auto_181747 ) ) ( not ( = ?auto_181746 ?auto_181747 ) ) ( ON ?auto_181747 ?auto_181752 ) ( not ( = ?auto_181744 ?auto_181752 ) ) ( not ( = ?auto_181745 ?auto_181752 ) ) ( not ( = ?auto_181746 ?auto_181752 ) ) ( not ( = ?auto_181747 ?auto_181752 ) ) ( ON-TABLE ?auto_181748 ) ( ON ?auto_181751 ?auto_181748 ) ( ON ?auto_181749 ?auto_181751 ) ( ON ?auto_181752 ?auto_181749 ) ( not ( = ?auto_181748 ?auto_181751 ) ) ( not ( = ?auto_181748 ?auto_181749 ) ) ( not ( = ?auto_181748 ?auto_181752 ) ) ( not ( = ?auto_181748 ?auto_181747 ) ) ( not ( = ?auto_181748 ?auto_181746 ) ) ( not ( = ?auto_181751 ?auto_181749 ) ) ( not ( = ?auto_181751 ?auto_181752 ) ) ( not ( = ?auto_181751 ?auto_181747 ) ) ( not ( = ?auto_181751 ?auto_181746 ) ) ( not ( = ?auto_181749 ?auto_181752 ) ) ( not ( = ?auto_181749 ?auto_181747 ) ) ( not ( = ?auto_181749 ?auto_181746 ) ) ( not ( = ?auto_181744 ?auto_181748 ) ) ( not ( = ?auto_181744 ?auto_181751 ) ) ( not ( = ?auto_181744 ?auto_181749 ) ) ( not ( = ?auto_181745 ?auto_181748 ) ) ( not ( = ?auto_181745 ?auto_181751 ) ) ( not ( = ?auto_181745 ?auto_181749 ) ) ( ON ?auto_181744 ?auto_181750 ) ( not ( = ?auto_181744 ?auto_181750 ) ) ( not ( = ?auto_181745 ?auto_181750 ) ) ( not ( = ?auto_181746 ?auto_181750 ) ) ( not ( = ?auto_181747 ?auto_181750 ) ) ( not ( = ?auto_181752 ?auto_181750 ) ) ( not ( = ?auto_181748 ?auto_181750 ) ) ( not ( = ?auto_181751 ?auto_181750 ) ) ( not ( = ?auto_181749 ?auto_181750 ) ) ( ON ?auto_181745 ?auto_181744 ) ( CLEAR ?auto_181745 ) ( ON-TABLE ?auto_181750 ) ( HOLDING ?auto_181746 ) ( CLEAR ?auto_181747 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181748 ?auto_181751 ?auto_181749 ?auto_181752 ?auto_181747 ?auto_181746 )
      ( MAKE-4PILE ?auto_181744 ?auto_181745 ?auto_181746 ?auto_181747 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181753 - BLOCK
      ?auto_181754 - BLOCK
      ?auto_181755 - BLOCK
      ?auto_181756 - BLOCK
    )
    :vars
    (
      ?auto_181761 - BLOCK
      ?auto_181760 - BLOCK
      ?auto_181758 - BLOCK
      ?auto_181759 - BLOCK
      ?auto_181757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181753 ?auto_181754 ) ) ( not ( = ?auto_181753 ?auto_181755 ) ) ( not ( = ?auto_181753 ?auto_181756 ) ) ( not ( = ?auto_181754 ?auto_181755 ) ) ( not ( = ?auto_181754 ?auto_181756 ) ) ( not ( = ?auto_181755 ?auto_181756 ) ) ( ON ?auto_181756 ?auto_181761 ) ( not ( = ?auto_181753 ?auto_181761 ) ) ( not ( = ?auto_181754 ?auto_181761 ) ) ( not ( = ?auto_181755 ?auto_181761 ) ) ( not ( = ?auto_181756 ?auto_181761 ) ) ( ON-TABLE ?auto_181760 ) ( ON ?auto_181758 ?auto_181760 ) ( ON ?auto_181759 ?auto_181758 ) ( ON ?auto_181761 ?auto_181759 ) ( not ( = ?auto_181760 ?auto_181758 ) ) ( not ( = ?auto_181760 ?auto_181759 ) ) ( not ( = ?auto_181760 ?auto_181761 ) ) ( not ( = ?auto_181760 ?auto_181756 ) ) ( not ( = ?auto_181760 ?auto_181755 ) ) ( not ( = ?auto_181758 ?auto_181759 ) ) ( not ( = ?auto_181758 ?auto_181761 ) ) ( not ( = ?auto_181758 ?auto_181756 ) ) ( not ( = ?auto_181758 ?auto_181755 ) ) ( not ( = ?auto_181759 ?auto_181761 ) ) ( not ( = ?auto_181759 ?auto_181756 ) ) ( not ( = ?auto_181759 ?auto_181755 ) ) ( not ( = ?auto_181753 ?auto_181760 ) ) ( not ( = ?auto_181753 ?auto_181758 ) ) ( not ( = ?auto_181753 ?auto_181759 ) ) ( not ( = ?auto_181754 ?auto_181760 ) ) ( not ( = ?auto_181754 ?auto_181758 ) ) ( not ( = ?auto_181754 ?auto_181759 ) ) ( ON ?auto_181753 ?auto_181757 ) ( not ( = ?auto_181753 ?auto_181757 ) ) ( not ( = ?auto_181754 ?auto_181757 ) ) ( not ( = ?auto_181755 ?auto_181757 ) ) ( not ( = ?auto_181756 ?auto_181757 ) ) ( not ( = ?auto_181761 ?auto_181757 ) ) ( not ( = ?auto_181760 ?auto_181757 ) ) ( not ( = ?auto_181758 ?auto_181757 ) ) ( not ( = ?auto_181759 ?auto_181757 ) ) ( ON ?auto_181754 ?auto_181753 ) ( ON-TABLE ?auto_181757 ) ( CLEAR ?auto_181756 ) ( ON ?auto_181755 ?auto_181754 ) ( CLEAR ?auto_181755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181757 ?auto_181753 ?auto_181754 )
      ( MAKE-4PILE ?auto_181753 ?auto_181754 ?auto_181755 ?auto_181756 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181762 - BLOCK
      ?auto_181763 - BLOCK
      ?auto_181764 - BLOCK
      ?auto_181765 - BLOCK
    )
    :vars
    (
      ?auto_181769 - BLOCK
      ?auto_181770 - BLOCK
      ?auto_181766 - BLOCK
      ?auto_181768 - BLOCK
      ?auto_181767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181762 ?auto_181763 ) ) ( not ( = ?auto_181762 ?auto_181764 ) ) ( not ( = ?auto_181762 ?auto_181765 ) ) ( not ( = ?auto_181763 ?auto_181764 ) ) ( not ( = ?auto_181763 ?auto_181765 ) ) ( not ( = ?auto_181764 ?auto_181765 ) ) ( not ( = ?auto_181762 ?auto_181769 ) ) ( not ( = ?auto_181763 ?auto_181769 ) ) ( not ( = ?auto_181764 ?auto_181769 ) ) ( not ( = ?auto_181765 ?auto_181769 ) ) ( ON-TABLE ?auto_181770 ) ( ON ?auto_181766 ?auto_181770 ) ( ON ?auto_181768 ?auto_181766 ) ( ON ?auto_181769 ?auto_181768 ) ( not ( = ?auto_181770 ?auto_181766 ) ) ( not ( = ?auto_181770 ?auto_181768 ) ) ( not ( = ?auto_181770 ?auto_181769 ) ) ( not ( = ?auto_181770 ?auto_181765 ) ) ( not ( = ?auto_181770 ?auto_181764 ) ) ( not ( = ?auto_181766 ?auto_181768 ) ) ( not ( = ?auto_181766 ?auto_181769 ) ) ( not ( = ?auto_181766 ?auto_181765 ) ) ( not ( = ?auto_181766 ?auto_181764 ) ) ( not ( = ?auto_181768 ?auto_181769 ) ) ( not ( = ?auto_181768 ?auto_181765 ) ) ( not ( = ?auto_181768 ?auto_181764 ) ) ( not ( = ?auto_181762 ?auto_181770 ) ) ( not ( = ?auto_181762 ?auto_181766 ) ) ( not ( = ?auto_181762 ?auto_181768 ) ) ( not ( = ?auto_181763 ?auto_181770 ) ) ( not ( = ?auto_181763 ?auto_181766 ) ) ( not ( = ?auto_181763 ?auto_181768 ) ) ( ON ?auto_181762 ?auto_181767 ) ( not ( = ?auto_181762 ?auto_181767 ) ) ( not ( = ?auto_181763 ?auto_181767 ) ) ( not ( = ?auto_181764 ?auto_181767 ) ) ( not ( = ?auto_181765 ?auto_181767 ) ) ( not ( = ?auto_181769 ?auto_181767 ) ) ( not ( = ?auto_181770 ?auto_181767 ) ) ( not ( = ?auto_181766 ?auto_181767 ) ) ( not ( = ?auto_181768 ?auto_181767 ) ) ( ON ?auto_181763 ?auto_181762 ) ( ON-TABLE ?auto_181767 ) ( ON ?auto_181764 ?auto_181763 ) ( CLEAR ?auto_181764 ) ( HOLDING ?auto_181765 ) ( CLEAR ?auto_181769 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181770 ?auto_181766 ?auto_181768 ?auto_181769 ?auto_181765 )
      ( MAKE-4PILE ?auto_181762 ?auto_181763 ?auto_181764 ?auto_181765 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181771 - BLOCK
      ?auto_181772 - BLOCK
      ?auto_181773 - BLOCK
      ?auto_181774 - BLOCK
    )
    :vars
    (
      ?auto_181776 - BLOCK
      ?auto_181778 - BLOCK
      ?auto_181775 - BLOCK
      ?auto_181777 - BLOCK
      ?auto_181779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181771 ?auto_181772 ) ) ( not ( = ?auto_181771 ?auto_181773 ) ) ( not ( = ?auto_181771 ?auto_181774 ) ) ( not ( = ?auto_181772 ?auto_181773 ) ) ( not ( = ?auto_181772 ?auto_181774 ) ) ( not ( = ?auto_181773 ?auto_181774 ) ) ( not ( = ?auto_181771 ?auto_181776 ) ) ( not ( = ?auto_181772 ?auto_181776 ) ) ( not ( = ?auto_181773 ?auto_181776 ) ) ( not ( = ?auto_181774 ?auto_181776 ) ) ( ON-TABLE ?auto_181778 ) ( ON ?auto_181775 ?auto_181778 ) ( ON ?auto_181777 ?auto_181775 ) ( ON ?auto_181776 ?auto_181777 ) ( not ( = ?auto_181778 ?auto_181775 ) ) ( not ( = ?auto_181778 ?auto_181777 ) ) ( not ( = ?auto_181778 ?auto_181776 ) ) ( not ( = ?auto_181778 ?auto_181774 ) ) ( not ( = ?auto_181778 ?auto_181773 ) ) ( not ( = ?auto_181775 ?auto_181777 ) ) ( not ( = ?auto_181775 ?auto_181776 ) ) ( not ( = ?auto_181775 ?auto_181774 ) ) ( not ( = ?auto_181775 ?auto_181773 ) ) ( not ( = ?auto_181777 ?auto_181776 ) ) ( not ( = ?auto_181777 ?auto_181774 ) ) ( not ( = ?auto_181777 ?auto_181773 ) ) ( not ( = ?auto_181771 ?auto_181778 ) ) ( not ( = ?auto_181771 ?auto_181775 ) ) ( not ( = ?auto_181771 ?auto_181777 ) ) ( not ( = ?auto_181772 ?auto_181778 ) ) ( not ( = ?auto_181772 ?auto_181775 ) ) ( not ( = ?auto_181772 ?auto_181777 ) ) ( ON ?auto_181771 ?auto_181779 ) ( not ( = ?auto_181771 ?auto_181779 ) ) ( not ( = ?auto_181772 ?auto_181779 ) ) ( not ( = ?auto_181773 ?auto_181779 ) ) ( not ( = ?auto_181774 ?auto_181779 ) ) ( not ( = ?auto_181776 ?auto_181779 ) ) ( not ( = ?auto_181778 ?auto_181779 ) ) ( not ( = ?auto_181775 ?auto_181779 ) ) ( not ( = ?auto_181777 ?auto_181779 ) ) ( ON ?auto_181772 ?auto_181771 ) ( ON-TABLE ?auto_181779 ) ( ON ?auto_181773 ?auto_181772 ) ( CLEAR ?auto_181776 ) ( ON ?auto_181774 ?auto_181773 ) ( CLEAR ?auto_181774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181779 ?auto_181771 ?auto_181772 ?auto_181773 )
      ( MAKE-4PILE ?auto_181771 ?auto_181772 ?auto_181773 ?auto_181774 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181780 - BLOCK
      ?auto_181781 - BLOCK
      ?auto_181782 - BLOCK
      ?auto_181783 - BLOCK
    )
    :vars
    (
      ?auto_181785 - BLOCK
      ?auto_181786 - BLOCK
      ?auto_181784 - BLOCK
      ?auto_181788 - BLOCK
      ?auto_181787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181780 ?auto_181781 ) ) ( not ( = ?auto_181780 ?auto_181782 ) ) ( not ( = ?auto_181780 ?auto_181783 ) ) ( not ( = ?auto_181781 ?auto_181782 ) ) ( not ( = ?auto_181781 ?auto_181783 ) ) ( not ( = ?auto_181782 ?auto_181783 ) ) ( not ( = ?auto_181780 ?auto_181785 ) ) ( not ( = ?auto_181781 ?auto_181785 ) ) ( not ( = ?auto_181782 ?auto_181785 ) ) ( not ( = ?auto_181783 ?auto_181785 ) ) ( ON-TABLE ?auto_181786 ) ( ON ?auto_181784 ?auto_181786 ) ( ON ?auto_181788 ?auto_181784 ) ( not ( = ?auto_181786 ?auto_181784 ) ) ( not ( = ?auto_181786 ?auto_181788 ) ) ( not ( = ?auto_181786 ?auto_181785 ) ) ( not ( = ?auto_181786 ?auto_181783 ) ) ( not ( = ?auto_181786 ?auto_181782 ) ) ( not ( = ?auto_181784 ?auto_181788 ) ) ( not ( = ?auto_181784 ?auto_181785 ) ) ( not ( = ?auto_181784 ?auto_181783 ) ) ( not ( = ?auto_181784 ?auto_181782 ) ) ( not ( = ?auto_181788 ?auto_181785 ) ) ( not ( = ?auto_181788 ?auto_181783 ) ) ( not ( = ?auto_181788 ?auto_181782 ) ) ( not ( = ?auto_181780 ?auto_181786 ) ) ( not ( = ?auto_181780 ?auto_181784 ) ) ( not ( = ?auto_181780 ?auto_181788 ) ) ( not ( = ?auto_181781 ?auto_181786 ) ) ( not ( = ?auto_181781 ?auto_181784 ) ) ( not ( = ?auto_181781 ?auto_181788 ) ) ( ON ?auto_181780 ?auto_181787 ) ( not ( = ?auto_181780 ?auto_181787 ) ) ( not ( = ?auto_181781 ?auto_181787 ) ) ( not ( = ?auto_181782 ?auto_181787 ) ) ( not ( = ?auto_181783 ?auto_181787 ) ) ( not ( = ?auto_181785 ?auto_181787 ) ) ( not ( = ?auto_181786 ?auto_181787 ) ) ( not ( = ?auto_181784 ?auto_181787 ) ) ( not ( = ?auto_181788 ?auto_181787 ) ) ( ON ?auto_181781 ?auto_181780 ) ( ON-TABLE ?auto_181787 ) ( ON ?auto_181782 ?auto_181781 ) ( ON ?auto_181783 ?auto_181782 ) ( CLEAR ?auto_181783 ) ( HOLDING ?auto_181785 ) ( CLEAR ?auto_181788 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181786 ?auto_181784 ?auto_181788 ?auto_181785 )
      ( MAKE-4PILE ?auto_181780 ?auto_181781 ?auto_181782 ?auto_181783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181789 - BLOCK
      ?auto_181790 - BLOCK
      ?auto_181791 - BLOCK
      ?auto_181792 - BLOCK
    )
    :vars
    (
      ?auto_181797 - BLOCK
      ?auto_181794 - BLOCK
      ?auto_181793 - BLOCK
      ?auto_181796 - BLOCK
      ?auto_181795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181789 ?auto_181790 ) ) ( not ( = ?auto_181789 ?auto_181791 ) ) ( not ( = ?auto_181789 ?auto_181792 ) ) ( not ( = ?auto_181790 ?auto_181791 ) ) ( not ( = ?auto_181790 ?auto_181792 ) ) ( not ( = ?auto_181791 ?auto_181792 ) ) ( not ( = ?auto_181789 ?auto_181797 ) ) ( not ( = ?auto_181790 ?auto_181797 ) ) ( not ( = ?auto_181791 ?auto_181797 ) ) ( not ( = ?auto_181792 ?auto_181797 ) ) ( ON-TABLE ?auto_181794 ) ( ON ?auto_181793 ?auto_181794 ) ( ON ?auto_181796 ?auto_181793 ) ( not ( = ?auto_181794 ?auto_181793 ) ) ( not ( = ?auto_181794 ?auto_181796 ) ) ( not ( = ?auto_181794 ?auto_181797 ) ) ( not ( = ?auto_181794 ?auto_181792 ) ) ( not ( = ?auto_181794 ?auto_181791 ) ) ( not ( = ?auto_181793 ?auto_181796 ) ) ( not ( = ?auto_181793 ?auto_181797 ) ) ( not ( = ?auto_181793 ?auto_181792 ) ) ( not ( = ?auto_181793 ?auto_181791 ) ) ( not ( = ?auto_181796 ?auto_181797 ) ) ( not ( = ?auto_181796 ?auto_181792 ) ) ( not ( = ?auto_181796 ?auto_181791 ) ) ( not ( = ?auto_181789 ?auto_181794 ) ) ( not ( = ?auto_181789 ?auto_181793 ) ) ( not ( = ?auto_181789 ?auto_181796 ) ) ( not ( = ?auto_181790 ?auto_181794 ) ) ( not ( = ?auto_181790 ?auto_181793 ) ) ( not ( = ?auto_181790 ?auto_181796 ) ) ( ON ?auto_181789 ?auto_181795 ) ( not ( = ?auto_181789 ?auto_181795 ) ) ( not ( = ?auto_181790 ?auto_181795 ) ) ( not ( = ?auto_181791 ?auto_181795 ) ) ( not ( = ?auto_181792 ?auto_181795 ) ) ( not ( = ?auto_181797 ?auto_181795 ) ) ( not ( = ?auto_181794 ?auto_181795 ) ) ( not ( = ?auto_181793 ?auto_181795 ) ) ( not ( = ?auto_181796 ?auto_181795 ) ) ( ON ?auto_181790 ?auto_181789 ) ( ON-TABLE ?auto_181795 ) ( ON ?auto_181791 ?auto_181790 ) ( ON ?auto_181792 ?auto_181791 ) ( CLEAR ?auto_181796 ) ( ON ?auto_181797 ?auto_181792 ) ( CLEAR ?auto_181797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181795 ?auto_181789 ?auto_181790 ?auto_181791 ?auto_181792 )
      ( MAKE-4PILE ?auto_181789 ?auto_181790 ?auto_181791 ?auto_181792 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181798 - BLOCK
      ?auto_181799 - BLOCK
      ?auto_181800 - BLOCK
      ?auto_181801 - BLOCK
    )
    :vars
    (
      ?auto_181806 - BLOCK
      ?auto_181803 - BLOCK
      ?auto_181804 - BLOCK
      ?auto_181802 - BLOCK
      ?auto_181805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181798 ?auto_181799 ) ) ( not ( = ?auto_181798 ?auto_181800 ) ) ( not ( = ?auto_181798 ?auto_181801 ) ) ( not ( = ?auto_181799 ?auto_181800 ) ) ( not ( = ?auto_181799 ?auto_181801 ) ) ( not ( = ?auto_181800 ?auto_181801 ) ) ( not ( = ?auto_181798 ?auto_181806 ) ) ( not ( = ?auto_181799 ?auto_181806 ) ) ( not ( = ?auto_181800 ?auto_181806 ) ) ( not ( = ?auto_181801 ?auto_181806 ) ) ( ON-TABLE ?auto_181803 ) ( ON ?auto_181804 ?auto_181803 ) ( not ( = ?auto_181803 ?auto_181804 ) ) ( not ( = ?auto_181803 ?auto_181802 ) ) ( not ( = ?auto_181803 ?auto_181806 ) ) ( not ( = ?auto_181803 ?auto_181801 ) ) ( not ( = ?auto_181803 ?auto_181800 ) ) ( not ( = ?auto_181804 ?auto_181802 ) ) ( not ( = ?auto_181804 ?auto_181806 ) ) ( not ( = ?auto_181804 ?auto_181801 ) ) ( not ( = ?auto_181804 ?auto_181800 ) ) ( not ( = ?auto_181802 ?auto_181806 ) ) ( not ( = ?auto_181802 ?auto_181801 ) ) ( not ( = ?auto_181802 ?auto_181800 ) ) ( not ( = ?auto_181798 ?auto_181803 ) ) ( not ( = ?auto_181798 ?auto_181804 ) ) ( not ( = ?auto_181798 ?auto_181802 ) ) ( not ( = ?auto_181799 ?auto_181803 ) ) ( not ( = ?auto_181799 ?auto_181804 ) ) ( not ( = ?auto_181799 ?auto_181802 ) ) ( ON ?auto_181798 ?auto_181805 ) ( not ( = ?auto_181798 ?auto_181805 ) ) ( not ( = ?auto_181799 ?auto_181805 ) ) ( not ( = ?auto_181800 ?auto_181805 ) ) ( not ( = ?auto_181801 ?auto_181805 ) ) ( not ( = ?auto_181806 ?auto_181805 ) ) ( not ( = ?auto_181803 ?auto_181805 ) ) ( not ( = ?auto_181804 ?auto_181805 ) ) ( not ( = ?auto_181802 ?auto_181805 ) ) ( ON ?auto_181799 ?auto_181798 ) ( ON-TABLE ?auto_181805 ) ( ON ?auto_181800 ?auto_181799 ) ( ON ?auto_181801 ?auto_181800 ) ( ON ?auto_181806 ?auto_181801 ) ( CLEAR ?auto_181806 ) ( HOLDING ?auto_181802 ) ( CLEAR ?auto_181804 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181803 ?auto_181804 ?auto_181802 )
      ( MAKE-4PILE ?auto_181798 ?auto_181799 ?auto_181800 ?auto_181801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181807 - BLOCK
      ?auto_181808 - BLOCK
      ?auto_181809 - BLOCK
      ?auto_181810 - BLOCK
    )
    :vars
    (
      ?auto_181815 - BLOCK
      ?auto_181811 - BLOCK
      ?auto_181813 - BLOCK
      ?auto_181812 - BLOCK
      ?auto_181814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181807 ?auto_181808 ) ) ( not ( = ?auto_181807 ?auto_181809 ) ) ( not ( = ?auto_181807 ?auto_181810 ) ) ( not ( = ?auto_181808 ?auto_181809 ) ) ( not ( = ?auto_181808 ?auto_181810 ) ) ( not ( = ?auto_181809 ?auto_181810 ) ) ( not ( = ?auto_181807 ?auto_181815 ) ) ( not ( = ?auto_181808 ?auto_181815 ) ) ( not ( = ?auto_181809 ?auto_181815 ) ) ( not ( = ?auto_181810 ?auto_181815 ) ) ( ON-TABLE ?auto_181811 ) ( ON ?auto_181813 ?auto_181811 ) ( not ( = ?auto_181811 ?auto_181813 ) ) ( not ( = ?auto_181811 ?auto_181812 ) ) ( not ( = ?auto_181811 ?auto_181815 ) ) ( not ( = ?auto_181811 ?auto_181810 ) ) ( not ( = ?auto_181811 ?auto_181809 ) ) ( not ( = ?auto_181813 ?auto_181812 ) ) ( not ( = ?auto_181813 ?auto_181815 ) ) ( not ( = ?auto_181813 ?auto_181810 ) ) ( not ( = ?auto_181813 ?auto_181809 ) ) ( not ( = ?auto_181812 ?auto_181815 ) ) ( not ( = ?auto_181812 ?auto_181810 ) ) ( not ( = ?auto_181812 ?auto_181809 ) ) ( not ( = ?auto_181807 ?auto_181811 ) ) ( not ( = ?auto_181807 ?auto_181813 ) ) ( not ( = ?auto_181807 ?auto_181812 ) ) ( not ( = ?auto_181808 ?auto_181811 ) ) ( not ( = ?auto_181808 ?auto_181813 ) ) ( not ( = ?auto_181808 ?auto_181812 ) ) ( ON ?auto_181807 ?auto_181814 ) ( not ( = ?auto_181807 ?auto_181814 ) ) ( not ( = ?auto_181808 ?auto_181814 ) ) ( not ( = ?auto_181809 ?auto_181814 ) ) ( not ( = ?auto_181810 ?auto_181814 ) ) ( not ( = ?auto_181815 ?auto_181814 ) ) ( not ( = ?auto_181811 ?auto_181814 ) ) ( not ( = ?auto_181813 ?auto_181814 ) ) ( not ( = ?auto_181812 ?auto_181814 ) ) ( ON ?auto_181808 ?auto_181807 ) ( ON-TABLE ?auto_181814 ) ( ON ?auto_181809 ?auto_181808 ) ( ON ?auto_181810 ?auto_181809 ) ( ON ?auto_181815 ?auto_181810 ) ( CLEAR ?auto_181813 ) ( ON ?auto_181812 ?auto_181815 ) ( CLEAR ?auto_181812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181814 ?auto_181807 ?auto_181808 ?auto_181809 ?auto_181810 ?auto_181815 )
      ( MAKE-4PILE ?auto_181807 ?auto_181808 ?auto_181809 ?auto_181810 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181816 - BLOCK
      ?auto_181817 - BLOCK
      ?auto_181818 - BLOCK
      ?auto_181819 - BLOCK
    )
    :vars
    (
      ?auto_181824 - BLOCK
      ?auto_181822 - BLOCK
      ?auto_181821 - BLOCK
      ?auto_181820 - BLOCK
      ?auto_181823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181816 ?auto_181817 ) ) ( not ( = ?auto_181816 ?auto_181818 ) ) ( not ( = ?auto_181816 ?auto_181819 ) ) ( not ( = ?auto_181817 ?auto_181818 ) ) ( not ( = ?auto_181817 ?auto_181819 ) ) ( not ( = ?auto_181818 ?auto_181819 ) ) ( not ( = ?auto_181816 ?auto_181824 ) ) ( not ( = ?auto_181817 ?auto_181824 ) ) ( not ( = ?auto_181818 ?auto_181824 ) ) ( not ( = ?auto_181819 ?auto_181824 ) ) ( ON-TABLE ?auto_181822 ) ( not ( = ?auto_181822 ?auto_181821 ) ) ( not ( = ?auto_181822 ?auto_181820 ) ) ( not ( = ?auto_181822 ?auto_181824 ) ) ( not ( = ?auto_181822 ?auto_181819 ) ) ( not ( = ?auto_181822 ?auto_181818 ) ) ( not ( = ?auto_181821 ?auto_181820 ) ) ( not ( = ?auto_181821 ?auto_181824 ) ) ( not ( = ?auto_181821 ?auto_181819 ) ) ( not ( = ?auto_181821 ?auto_181818 ) ) ( not ( = ?auto_181820 ?auto_181824 ) ) ( not ( = ?auto_181820 ?auto_181819 ) ) ( not ( = ?auto_181820 ?auto_181818 ) ) ( not ( = ?auto_181816 ?auto_181822 ) ) ( not ( = ?auto_181816 ?auto_181821 ) ) ( not ( = ?auto_181816 ?auto_181820 ) ) ( not ( = ?auto_181817 ?auto_181822 ) ) ( not ( = ?auto_181817 ?auto_181821 ) ) ( not ( = ?auto_181817 ?auto_181820 ) ) ( ON ?auto_181816 ?auto_181823 ) ( not ( = ?auto_181816 ?auto_181823 ) ) ( not ( = ?auto_181817 ?auto_181823 ) ) ( not ( = ?auto_181818 ?auto_181823 ) ) ( not ( = ?auto_181819 ?auto_181823 ) ) ( not ( = ?auto_181824 ?auto_181823 ) ) ( not ( = ?auto_181822 ?auto_181823 ) ) ( not ( = ?auto_181821 ?auto_181823 ) ) ( not ( = ?auto_181820 ?auto_181823 ) ) ( ON ?auto_181817 ?auto_181816 ) ( ON-TABLE ?auto_181823 ) ( ON ?auto_181818 ?auto_181817 ) ( ON ?auto_181819 ?auto_181818 ) ( ON ?auto_181824 ?auto_181819 ) ( ON ?auto_181820 ?auto_181824 ) ( CLEAR ?auto_181820 ) ( HOLDING ?auto_181821 ) ( CLEAR ?auto_181822 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181822 ?auto_181821 )
      ( MAKE-4PILE ?auto_181816 ?auto_181817 ?auto_181818 ?auto_181819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181825 - BLOCK
      ?auto_181826 - BLOCK
      ?auto_181827 - BLOCK
      ?auto_181828 - BLOCK
    )
    :vars
    (
      ?auto_181830 - BLOCK
      ?auto_181831 - BLOCK
      ?auto_181829 - BLOCK
      ?auto_181833 - BLOCK
      ?auto_181832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181825 ?auto_181826 ) ) ( not ( = ?auto_181825 ?auto_181827 ) ) ( not ( = ?auto_181825 ?auto_181828 ) ) ( not ( = ?auto_181826 ?auto_181827 ) ) ( not ( = ?auto_181826 ?auto_181828 ) ) ( not ( = ?auto_181827 ?auto_181828 ) ) ( not ( = ?auto_181825 ?auto_181830 ) ) ( not ( = ?auto_181826 ?auto_181830 ) ) ( not ( = ?auto_181827 ?auto_181830 ) ) ( not ( = ?auto_181828 ?auto_181830 ) ) ( ON-TABLE ?auto_181831 ) ( not ( = ?auto_181831 ?auto_181829 ) ) ( not ( = ?auto_181831 ?auto_181833 ) ) ( not ( = ?auto_181831 ?auto_181830 ) ) ( not ( = ?auto_181831 ?auto_181828 ) ) ( not ( = ?auto_181831 ?auto_181827 ) ) ( not ( = ?auto_181829 ?auto_181833 ) ) ( not ( = ?auto_181829 ?auto_181830 ) ) ( not ( = ?auto_181829 ?auto_181828 ) ) ( not ( = ?auto_181829 ?auto_181827 ) ) ( not ( = ?auto_181833 ?auto_181830 ) ) ( not ( = ?auto_181833 ?auto_181828 ) ) ( not ( = ?auto_181833 ?auto_181827 ) ) ( not ( = ?auto_181825 ?auto_181831 ) ) ( not ( = ?auto_181825 ?auto_181829 ) ) ( not ( = ?auto_181825 ?auto_181833 ) ) ( not ( = ?auto_181826 ?auto_181831 ) ) ( not ( = ?auto_181826 ?auto_181829 ) ) ( not ( = ?auto_181826 ?auto_181833 ) ) ( ON ?auto_181825 ?auto_181832 ) ( not ( = ?auto_181825 ?auto_181832 ) ) ( not ( = ?auto_181826 ?auto_181832 ) ) ( not ( = ?auto_181827 ?auto_181832 ) ) ( not ( = ?auto_181828 ?auto_181832 ) ) ( not ( = ?auto_181830 ?auto_181832 ) ) ( not ( = ?auto_181831 ?auto_181832 ) ) ( not ( = ?auto_181829 ?auto_181832 ) ) ( not ( = ?auto_181833 ?auto_181832 ) ) ( ON ?auto_181826 ?auto_181825 ) ( ON-TABLE ?auto_181832 ) ( ON ?auto_181827 ?auto_181826 ) ( ON ?auto_181828 ?auto_181827 ) ( ON ?auto_181830 ?auto_181828 ) ( ON ?auto_181833 ?auto_181830 ) ( CLEAR ?auto_181831 ) ( ON ?auto_181829 ?auto_181833 ) ( CLEAR ?auto_181829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181832 ?auto_181825 ?auto_181826 ?auto_181827 ?auto_181828 ?auto_181830 ?auto_181833 )
      ( MAKE-4PILE ?auto_181825 ?auto_181826 ?auto_181827 ?auto_181828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181834 - BLOCK
      ?auto_181835 - BLOCK
      ?auto_181836 - BLOCK
      ?auto_181837 - BLOCK
    )
    :vars
    (
      ?auto_181842 - BLOCK
      ?auto_181841 - BLOCK
      ?auto_181839 - BLOCK
      ?auto_181838 - BLOCK
      ?auto_181840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181834 ?auto_181835 ) ) ( not ( = ?auto_181834 ?auto_181836 ) ) ( not ( = ?auto_181834 ?auto_181837 ) ) ( not ( = ?auto_181835 ?auto_181836 ) ) ( not ( = ?auto_181835 ?auto_181837 ) ) ( not ( = ?auto_181836 ?auto_181837 ) ) ( not ( = ?auto_181834 ?auto_181842 ) ) ( not ( = ?auto_181835 ?auto_181842 ) ) ( not ( = ?auto_181836 ?auto_181842 ) ) ( not ( = ?auto_181837 ?auto_181842 ) ) ( not ( = ?auto_181841 ?auto_181839 ) ) ( not ( = ?auto_181841 ?auto_181838 ) ) ( not ( = ?auto_181841 ?auto_181842 ) ) ( not ( = ?auto_181841 ?auto_181837 ) ) ( not ( = ?auto_181841 ?auto_181836 ) ) ( not ( = ?auto_181839 ?auto_181838 ) ) ( not ( = ?auto_181839 ?auto_181842 ) ) ( not ( = ?auto_181839 ?auto_181837 ) ) ( not ( = ?auto_181839 ?auto_181836 ) ) ( not ( = ?auto_181838 ?auto_181842 ) ) ( not ( = ?auto_181838 ?auto_181837 ) ) ( not ( = ?auto_181838 ?auto_181836 ) ) ( not ( = ?auto_181834 ?auto_181841 ) ) ( not ( = ?auto_181834 ?auto_181839 ) ) ( not ( = ?auto_181834 ?auto_181838 ) ) ( not ( = ?auto_181835 ?auto_181841 ) ) ( not ( = ?auto_181835 ?auto_181839 ) ) ( not ( = ?auto_181835 ?auto_181838 ) ) ( ON ?auto_181834 ?auto_181840 ) ( not ( = ?auto_181834 ?auto_181840 ) ) ( not ( = ?auto_181835 ?auto_181840 ) ) ( not ( = ?auto_181836 ?auto_181840 ) ) ( not ( = ?auto_181837 ?auto_181840 ) ) ( not ( = ?auto_181842 ?auto_181840 ) ) ( not ( = ?auto_181841 ?auto_181840 ) ) ( not ( = ?auto_181839 ?auto_181840 ) ) ( not ( = ?auto_181838 ?auto_181840 ) ) ( ON ?auto_181835 ?auto_181834 ) ( ON-TABLE ?auto_181840 ) ( ON ?auto_181836 ?auto_181835 ) ( ON ?auto_181837 ?auto_181836 ) ( ON ?auto_181842 ?auto_181837 ) ( ON ?auto_181838 ?auto_181842 ) ( ON ?auto_181839 ?auto_181838 ) ( CLEAR ?auto_181839 ) ( HOLDING ?auto_181841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181841 )
      ( MAKE-4PILE ?auto_181834 ?auto_181835 ?auto_181836 ?auto_181837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181843 - BLOCK
      ?auto_181844 - BLOCK
      ?auto_181845 - BLOCK
      ?auto_181846 - BLOCK
    )
    :vars
    (
      ?auto_181850 - BLOCK
      ?auto_181848 - BLOCK
      ?auto_181849 - BLOCK
      ?auto_181847 - BLOCK
      ?auto_181851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181843 ?auto_181844 ) ) ( not ( = ?auto_181843 ?auto_181845 ) ) ( not ( = ?auto_181843 ?auto_181846 ) ) ( not ( = ?auto_181844 ?auto_181845 ) ) ( not ( = ?auto_181844 ?auto_181846 ) ) ( not ( = ?auto_181845 ?auto_181846 ) ) ( not ( = ?auto_181843 ?auto_181850 ) ) ( not ( = ?auto_181844 ?auto_181850 ) ) ( not ( = ?auto_181845 ?auto_181850 ) ) ( not ( = ?auto_181846 ?auto_181850 ) ) ( not ( = ?auto_181848 ?auto_181849 ) ) ( not ( = ?auto_181848 ?auto_181847 ) ) ( not ( = ?auto_181848 ?auto_181850 ) ) ( not ( = ?auto_181848 ?auto_181846 ) ) ( not ( = ?auto_181848 ?auto_181845 ) ) ( not ( = ?auto_181849 ?auto_181847 ) ) ( not ( = ?auto_181849 ?auto_181850 ) ) ( not ( = ?auto_181849 ?auto_181846 ) ) ( not ( = ?auto_181849 ?auto_181845 ) ) ( not ( = ?auto_181847 ?auto_181850 ) ) ( not ( = ?auto_181847 ?auto_181846 ) ) ( not ( = ?auto_181847 ?auto_181845 ) ) ( not ( = ?auto_181843 ?auto_181848 ) ) ( not ( = ?auto_181843 ?auto_181849 ) ) ( not ( = ?auto_181843 ?auto_181847 ) ) ( not ( = ?auto_181844 ?auto_181848 ) ) ( not ( = ?auto_181844 ?auto_181849 ) ) ( not ( = ?auto_181844 ?auto_181847 ) ) ( ON ?auto_181843 ?auto_181851 ) ( not ( = ?auto_181843 ?auto_181851 ) ) ( not ( = ?auto_181844 ?auto_181851 ) ) ( not ( = ?auto_181845 ?auto_181851 ) ) ( not ( = ?auto_181846 ?auto_181851 ) ) ( not ( = ?auto_181850 ?auto_181851 ) ) ( not ( = ?auto_181848 ?auto_181851 ) ) ( not ( = ?auto_181849 ?auto_181851 ) ) ( not ( = ?auto_181847 ?auto_181851 ) ) ( ON ?auto_181844 ?auto_181843 ) ( ON-TABLE ?auto_181851 ) ( ON ?auto_181845 ?auto_181844 ) ( ON ?auto_181846 ?auto_181845 ) ( ON ?auto_181850 ?auto_181846 ) ( ON ?auto_181847 ?auto_181850 ) ( ON ?auto_181849 ?auto_181847 ) ( ON ?auto_181848 ?auto_181849 ) ( CLEAR ?auto_181848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181851 ?auto_181843 ?auto_181844 ?auto_181845 ?auto_181846 ?auto_181850 ?auto_181847 ?auto_181849 )
      ( MAKE-4PILE ?auto_181843 ?auto_181844 ?auto_181845 ?auto_181846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181855 - BLOCK
      ?auto_181856 - BLOCK
      ?auto_181857 - BLOCK
    )
    :vars
    (
      ?auto_181858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181858 ?auto_181857 ) ( CLEAR ?auto_181858 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181855 ) ( ON ?auto_181856 ?auto_181855 ) ( ON ?auto_181857 ?auto_181856 ) ( not ( = ?auto_181855 ?auto_181856 ) ) ( not ( = ?auto_181855 ?auto_181857 ) ) ( not ( = ?auto_181855 ?auto_181858 ) ) ( not ( = ?auto_181856 ?auto_181857 ) ) ( not ( = ?auto_181856 ?auto_181858 ) ) ( not ( = ?auto_181857 ?auto_181858 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181858 ?auto_181857 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181859 - BLOCK
      ?auto_181860 - BLOCK
      ?auto_181861 - BLOCK
    )
    :vars
    (
      ?auto_181862 - BLOCK
      ?auto_181863 - BLOCK
      ?auto_181864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181862 ?auto_181861 ) ( CLEAR ?auto_181862 ) ( ON-TABLE ?auto_181859 ) ( ON ?auto_181860 ?auto_181859 ) ( ON ?auto_181861 ?auto_181860 ) ( not ( = ?auto_181859 ?auto_181860 ) ) ( not ( = ?auto_181859 ?auto_181861 ) ) ( not ( = ?auto_181859 ?auto_181862 ) ) ( not ( = ?auto_181860 ?auto_181861 ) ) ( not ( = ?auto_181860 ?auto_181862 ) ) ( not ( = ?auto_181861 ?auto_181862 ) ) ( HOLDING ?auto_181863 ) ( CLEAR ?auto_181864 ) ( not ( = ?auto_181859 ?auto_181863 ) ) ( not ( = ?auto_181859 ?auto_181864 ) ) ( not ( = ?auto_181860 ?auto_181863 ) ) ( not ( = ?auto_181860 ?auto_181864 ) ) ( not ( = ?auto_181861 ?auto_181863 ) ) ( not ( = ?auto_181861 ?auto_181864 ) ) ( not ( = ?auto_181862 ?auto_181863 ) ) ( not ( = ?auto_181862 ?auto_181864 ) ) ( not ( = ?auto_181863 ?auto_181864 ) ) )
    :subtasks
    ( ( !STACK ?auto_181863 ?auto_181864 )
      ( MAKE-3PILE ?auto_181859 ?auto_181860 ?auto_181861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181865 - BLOCK
      ?auto_181866 - BLOCK
      ?auto_181867 - BLOCK
    )
    :vars
    (
      ?auto_181868 - BLOCK
      ?auto_181870 - BLOCK
      ?auto_181869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181868 ?auto_181867 ) ( ON-TABLE ?auto_181865 ) ( ON ?auto_181866 ?auto_181865 ) ( ON ?auto_181867 ?auto_181866 ) ( not ( = ?auto_181865 ?auto_181866 ) ) ( not ( = ?auto_181865 ?auto_181867 ) ) ( not ( = ?auto_181865 ?auto_181868 ) ) ( not ( = ?auto_181866 ?auto_181867 ) ) ( not ( = ?auto_181866 ?auto_181868 ) ) ( not ( = ?auto_181867 ?auto_181868 ) ) ( CLEAR ?auto_181870 ) ( not ( = ?auto_181865 ?auto_181869 ) ) ( not ( = ?auto_181865 ?auto_181870 ) ) ( not ( = ?auto_181866 ?auto_181869 ) ) ( not ( = ?auto_181866 ?auto_181870 ) ) ( not ( = ?auto_181867 ?auto_181869 ) ) ( not ( = ?auto_181867 ?auto_181870 ) ) ( not ( = ?auto_181868 ?auto_181869 ) ) ( not ( = ?auto_181868 ?auto_181870 ) ) ( not ( = ?auto_181869 ?auto_181870 ) ) ( ON ?auto_181869 ?auto_181868 ) ( CLEAR ?auto_181869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181865 ?auto_181866 ?auto_181867 ?auto_181868 )
      ( MAKE-3PILE ?auto_181865 ?auto_181866 ?auto_181867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181871 - BLOCK
      ?auto_181872 - BLOCK
      ?auto_181873 - BLOCK
    )
    :vars
    (
      ?auto_181874 - BLOCK
      ?auto_181875 - BLOCK
      ?auto_181876 - BLOCK
      ?auto_181877 - BLOCK
      ?auto_181878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181874 ?auto_181873 ) ( ON-TABLE ?auto_181871 ) ( ON ?auto_181872 ?auto_181871 ) ( ON ?auto_181873 ?auto_181872 ) ( not ( = ?auto_181871 ?auto_181872 ) ) ( not ( = ?auto_181871 ?auto_181873 ) ) ( not ( = ?auto_181871 ?auto_181874 ) ) ( not ( = ?auto_181872 ?auto_181873 ) ) ( not ( = ?auto_181872 ?auto_181874 ) ) ( not ( = ?auto_181873 ?auto_181874 ) ) ( not ( = ?auto_181871 ?auto_181875 ) ) ( not ( = ?auto_181871 ?auto_181876 ) ) ( not ( = ?auto_181872 ?auto_181875 ) ) ( not ( = ?auto_181872 ?auto_181876 ) ) ( not ( = ?auto_181873 ?auto_181875 ) ) ( not ( = ?auto_181873 ?auto_181876 ) ) ( not ( = ?auto_181874 ?auto_181875 ) ) ( not ( = ?auto_181874 ?auto_181876 ) ) ( not ( = ?auto_181875 ?auto_181876 ) ) ( ON ?auto_181875 ?auto_181874 ) ( CLEAR ?auto_181875 ) ( HOLDING ?auto_181876 ) ( CLEAR ?auto_181877 ) ( ON-TABLE ?auto_181878 ) ( ON ?auto_181877 ?auto_181878 ) ( not ( = ?auto_181878 ?auto_181877 ) ) ( not ( = ?auto_181878 ?auto_181876 ) ) ( not ( = ?auto_181877 ?auto_181876 ) ) ( not ( = ?auto_181871 ?auto_181877 ) ) ( not ( = ?auto_181871 ?auto_181878 ) ) ( not ( = ?auto_181872 ?auto_181877 ) ) ( not ( = ?auto_181872 ?auto_181878 ) ) ( not ( = ?auto_181873 ?auto_181877 ) ) ( not ( = ?auto_181873 ?auto_181878 ) ) ( not ( = ?auto_181874 ?auto_181877 ) ) ( not ( = ?auto_181874 ?auto_181878 ) ) ( not ( = ?auto_181875 ?auto_181877 ) ) ( not ( = ?auto_181875 ?auto_181878 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181878 ?auto_181877 ?auto_181876 )
      ( MAKE-3PILE ?auto_181871 ?auto_181872 ?auto_181873 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181879 - BLOCK
      ?auto_181880 - BLOCK
      ?auto_181881 - BLOCK
    )
    :vars
    (
      ?auto_181883 - BLOCK
      ?auto_181882 - BLOCK
      ?auto_181886 - BLOCK
      ?auto_181885 - BLOCK
      ?auto_181884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181883 ?auto_181881 ) ( ON-TABLE ?auto_181879 ) ( ON ?auto_181880 ?auto_181879 ) ( ON ?auto_181881 ?auto_181880 ) ( not ( = ?auto_181879 ?auto_181880 ) ) ( not ( = ?auto_181879 ?auto_181881 ) ) ( not ( = ?auto_181879 ?auto_181883 ) ) ( not ( = ?auto_181880 ?auto_181881 ) ) ( not ( = ?auto_181880 ?auto_181883 ) ) ( not ( = ?auto_181881 ?auto_181883 ) ) ( not ( = ?auto_181879 ?auto_181882 ) ) ( not ( = ?auto_181879 ?auto_181886 ) ) ( not ( = ?auto_181880 ?auto_181882 ) ) ( not ( = ?auto_181880 ?auto_181886 ) ) ( not ( = ?auto_181881 ?auto_181882 ) ) ( not ( = ?auto_181881 ?auto_181886 ) ) ( not ( = ?auto_181883 ?auto_181882 ) ) ( not ( = ?auto_181883 ?auto_181886 ) ) ( not ( = ?auto_181882 ?auto_181886 ) ) ( ON ?auto_181882 ?auto_181883 ) ( CLEAR ?auto_181885 ) ( ON-TABLE ?auto_181884 ) ( ON ?auto_181885 ?auto_181884 ) ( not ( = ?auto_181884 ?auto_181885 ) ) ( not ( = ?auto_181884 ?auto_181886 ) ) ( not ( = ?auto_181885 ?auto_181886 ) ) ( not ( = ?auto_181879 ?auto_181885 ) ) ( not ( = ?auto_181879 ?auto_181884 ) ) ( not ( = ?auto_181880 ?auto_181885 ) ) ( not ( = ?auto_181880 ?auto_181884 ) ) ( not ( = ?auto_181881 ?auto_181885 ) ) ( not ( = ?auto_181881 ?auto_181884 ) ) ( not ( = ?auto_181883 ?auto_181885 ) ) ( not ( = ?auto_181883 ?auto_181884 ) ) ( not ( = ?auto_181882 ?auto_181885 ) ) ( not ( = ?auto_181882 ?auto_181884 ) ) ( ON ?auto_181886 ?auto_181882 ) ( CLEAR ?auto_181886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181879 ?auto_181880 ?auto_181881 ?auto_181883 ?auto_181882 )
      ( MAKE-3PILE ?auto_181879 ?auto_181880 ?auto_181881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181887 - BLOCK
      ?auto_181888 - BLOCK
      ?auto_181889 - BLOCK
    )
    :vars
    (
      ?auto_181894 - BLOCK
      ?auto_181891 - BLOCK
      ?auto_181890 - BLOCK
      ?auto_181893 - BLOCK
      ?auto_181892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181894 ?auto_181889 ) ( ON-TABLE ?auto_181887 ) ( ON ?auto_181888 ?auto_181887 ) ( ON ?auto_181889 ?auto_181888 ) ( not ( = ?auto_181887 ?auto_181888 ) ) ( not ( = ?auto_181887 ?auto_181889 ) ) ( not ( = ?auto_181887 ?auto_181894 ) ) ( not ( = ?auto_181888 ?auto_181889 ) ) ( not ( = ?auto_181888 ?auto_181894 ) ) ( not ( = ?auto_181889 ?auto_181894 ) ) ( not ( = ?auto_181887 ?auto_181891 ) ) ( not ( = ?auto_181887 ?auto_181890 ) ) ( not ( = ?auto_181888 ?auto_181891 ) ) ( not ( = ?auto_181888 ?auto_181890 ) ) ( not ( = ?auto_181889 ?auto_181891 ) ) ( not ( = ?auto_181889 ?auto_181890 ) ) ( not ( = ?auto_181894 ?auto_181891 ) ) ( not ( = ?auto_181894 ?auto_181890 ) ) ( not ( = ?auto_181891 ?auto_181890 ) ) ( ON ?auto_181891 ?auto_181894 ) ( ON-TABLE ?auto_181893 ) ( not ( = ?auto_181893 ?auto_181892 ) ) ( not ( = ?auto_181893 ?auto_181890 ) ) ( not ( = ?auto_181892 ?auto_181890 ) ) ( not ( = ?auto_181887 ?auto_181892 ) ) ( not ( = ?auto_181887 ?auto_181893 ) ) ( not ( = ?auto_181888 ?auto_181892 ) ) ( not ( = ?auto_181888 ?auto_181893 ) ) ( not ( = ?auto_181889 ?auto_181892 ) ) ( not ( = ?auto_181889 ?auto_181893 ) ) ( not ( = ?auto_181894 ?auto_181892 ) ) ( not ( = ?auto_181894 ?auto_181893 ) ) ( not ( = ?auto_181891 ?auto_181892 ) ) ( not ( = ?auto_181891 ?auto_181893 ) ) ( ON ?auto_181890 ?auto_181891 ) ( CLEAR ?auto_181890 ) ( HOLDING ?auto_181892 ) ( CLEAR ?auto_181893 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181893 ?auto_181892 )
      ( MAKE-3PILE ?auto_181887 ?auto_181888 ?auto_181889 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181895 - BLOCK
      ?auto_181896 - BLOCK
      ?auto_181897 - BLOCK
    )
    :vars
    (
      ?auto_181900 - BLOCK
      ?auto_181898 - BLOCK
      ?auto_181902 - BLOCK
      ?auto_181901 - BLOCK
      ?auto_181899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181900 ?auto_181897 ) ( ON-TABLE ?auto_181895 ) ( ON ?auto_181896 ?auto_181895 ) ( ON ?auto_181897 ?auto_181896 ) ( not ( = ?auto_181895 ?auto_181896 ) ) ( not ( = ?auto_181895 ?auto_181897 ) ) ( not ( = ?auto_181895 ?auto_181900 ) ) ( not ( = ?auto_181896 ?auto_181897 ) ) ( not ( = ?auto_181896 ?auto_181900 ) ) ( not ( = ?auto_181897 ?auto_181900 ) ) ( not ( = ?auto_181895 ?auto_181898 ) ) ( not ( = ?auto_181895 ?auto_181902 ) ) ( not ( = ?auto_181896 ?auto_181898 ) ) ( not ( = ?auto_181896 ?auto_181902 ) ) ( not ( = ?auto_181897 ?auto_181898 ) ) ( not ( = ?auto_181897 ?auto_181902 ) ) ( not ( = ?auto_181900 ?auto_181898 ) ) ( not ( = ?auto_181900 ?auto_181902 ) ) ( not ( = ?auto_181898 ?auto_181902 ) ) ( ON ?auto_181898 ?auto_181900 ) ( ON-TABLE ?auto_181901 ) ( not ( = ?auto_181901 ?auto_181899 ) ) ( not ( = ?auto_181901 ?auto_181902 ) ) ( not ( = ?auto_181899 ?auto_181902 ) ) ( not ( = ?auto_181895 ?auto_181899 ) ) ( not ( = ?auto_181895 ?auto_181901 ) ) ( not ( = ?auto_181896 ?auto_181899 ) ) ( not ( = ?auto_181896 ?auto_181901 ) ) ( not ( = ?auto_181897 ?auto_181899 ) ) ( not ( = ?auto_181897 ?auto_181901 ) ) ( not ( = ?auto_181900 ?auto_181899 ) ) ( not ( = ?auto_181900 ?auto_181901 ) ) ( not ( = ?auto_181898 ?auto_181899 ) ) ( not ( = ?auto_181898 ?auto_181901 ) ) ( ON ?auto_181902 ?auto_181898 ) ( CLEAR ?auto_181901 ) ( ON ?auto_181899 ?auto_181902 ) ( CLEAR ?auto_181899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181895 ?auto_181896 ?auto_181897 ?auto_181900 ?auto_181898 ?auto_181902 )
      ( MAKE-3PILE ?auto_181895 ?auto_181896 ?auto_181897 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181903 - BLOCK
      ?auto_181904 - BLOCK
      ?auto_181905 - BLOCK
    )
    :vars
    (
      ?auto_181908 - BLOCK
      ?auto_181909 - BLOCK
      ?auto_181910 - BLOCK
      ?auto_181907 - BLOCK
      ?auto_181906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181908 ?auto_181905 ) ( ON-TABLE ?auto_181903 ) ( ON ?auto_181904 ?auto_181903 ) ( ON ?auto_181905 ?auto_181904 ) ( not ( = ?auto_181903 ?auto_181904 ) ) ( not ( = ?auto_181903 ?auto_181905 ) ) ( not ( = ?auto_181903 ?auto_181908 ) ) ( not ( = ?auto_181904 ?auto_181905 ) ) ( not ( = ?auto_181904 ?auto_181908 ) ) ( not ( = ?auto_181905 ?auto_181908 ) ) ( not ( = ?auto_181903 ?auto_181909 ) ) ( not ( = ?auto_181903 ?auto_181910 ) ) ( not ( = ?auto_181904 ?auto_181909 ) ) ( not ( = ?auto_181904 ?auto_181910 ) ) ( not ( = ?auto_181905 ?auto_181909 ) ) ( not ( = ?auto_181905 ?auto_181910 ) ) ( not ( = ?auto_181908 ?auto_181909 ) ) ( not ( = ?auto_181908 ?auto_181910 ) ) ( not ( = ?auto_181909 ?auto_181910 ) ) ( ON ?auto_181909 ?auto_181908 ) ( not ( = ?auto_181907 ?auto_181906 ) ) ( not ( = ?auto_181907 ?auto_181910 ) ) ( not ( = ?auto_181906 ?auto_181910 ) ) ( not ( = ?auto_181903 ?auto_181906 ) ) ( not ( = ?auto_181903 ?auto_181907 ) ) ( not ( = ?auto_181904 ?auto_181906 ) ) ( not ( = ?auto_181904 ?auto_181907 ) ) ( not ( = ?auto_181905 ?auto_181906 ) ) ( not ( = ?auto_181905 ?auto_181907 ) ) ( not ( = ?auto_181908 ?auto_181906 ) ) ( not ( = ?auto_181908 ?auto_181907 ) ) ( not ( = ?auto_181909 ?auto_181906 ) ) ( not ( = ?auto_181909 ?auto_181907 ) ) ( ON ?auto_181910 ?auto_181909 ) ( ON ?auto_181906 ?auto_181910 ) ( CLEAR ?auto_181906 ) ( HOLDING ?auto_181907 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181907 )
      ( MAKE-3PILE ?auto_181903 ?auto_181904 ?auto_181905 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181911 - BLOCK
      ?auto_181912 - BLOCK
      ?auto_181913 - BLOCK
    )
    :vars
    (
      ?auto_181917 - BLOCK
      ?auto_181915 - BLOCK
      ?auto_181918 - BLOCK
      ?auto_181916 - BLOCK
      ?auto_181914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181917 ?auto_181913 ) ( ON-TABLE ?auto_181911 ) ( ON ?auto_181912 ?auto_181911 ) ( ON ?auto_181913 ?auto_181912 ) ( not ( = ?auto_181911 ?auto_181912 ) ) ( not ( = ?auto_181911 ?auto_181913 ) ) ( not ( = ?auto_181911 ?auto_181917 ) ) ( not ( = ?auto_181912 ?auto_181913 ) ) ( not ( = ?auto_181912 ?auto_181917 ) ) ( not ( = ?auto_181913 ?auto_181917 ) ) ( not ( = ?auto_181911 ?auto_181915 ) ) ( not ( = ?auto_181911 ?auto_181918 ) ) ( not ( = ?auto_181912 ?auto_181915 ) ) ( not ( = ?auto_181912 ?auto_181918 ) ) ( not ( = ?auto_181913 ?auto_181915 ) ) ( not ( = ?auto_181913 ?auto_181918 ) ) ( not ( = ?auto_181917 ?auto_181915 ) ) ( not ( = ?auto_181917 ?auto_181918 ) ) ( not ( = ?auto_181915 ?auto_181918 ) ) ( ON ?auto_181915 ?auto_181917 ) ( not ( = ?auto_181916 ?auto_181914 ) ) ( not ( = ?auto_181916 ?auto_181918 ) ) ( not ( = ?auto_181914 ?auto_181918 ) ) ( not ( = ?auto_181911 ?auto_181914 ) ) ( not ( = ?auto_181911 ?auto_181916 ) ) ( not ( = ?auto_181912 ?auto_181914 ) ) ( not ( = ?auto_181912 ?auto_181916 ) ) ( not ( = ?auto_181913 ?auto_181914 ) ) ( not ( = ?auto_181913 ?auto_181916 ) ) ( not ( = ?auto_181917 ?auto_181914 ) ) ( not ( = ?auto_181917 ?auto_181916 ) ) ( not ( = ?auto_181915 ?auto_181914 ) ) ( not ( = ?auto_181915 ?auto_181916 ) ) ( ON ?auto_181918 ?auto_181915 ) ( ON ?auto_181914 ?auto_181918 ) ( ON ?auto_181916 ?auto_181914 ) ( CLEAR ?auto_181916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181911 ?auto_181912 ?auto_181913 ?auto_181917 ?auto_181915 ?auto_181918 ?auto_181914 )
      ( MAKE-3PILE ?auto_181911 ?auto_181912 ?auto_181913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181919 - BLOCK
      ?auto_181920 - BLOCK
      ?auto_181921 - BLOCK
    )
    :vars
    (
      ?auto_181925 - BLOCK
      ?auto_181922 - BLOCK
      ?auto_181926 - BLOCK
      ?auto_181923 - BLOCK
      ?auto_181924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181925 ?auto_181921 ) ( ON-TABLE ?auto_181919 ) ( ON ?auto_181920 ?auto_181919 ) ( ON ?auto_181921 ?auto_181920 ) ( not ( = ?auto_181919 ?auto_181920 ) ) ( not ( = ?auto_181919 ?auto_181921 ) ) ( not ( = ?auto_181919 ?auto_181925 ) ) ( not ( = ?auto_181920 ?auto_181921 ) ) ( not ( = ?auto_181920 ?auto_181925 ) ) ( not ( = ?auto_181921 ?auto_181925 ) ) ( not ( = ?auto_181919 ?auto_181922 ) ) ( not ( = ?auto_181919 ?auto_181926 ) ) ( not ( = ?auto_181920 ?auto_181922 ) ) ( not ( = ?auto_181920 ?auto_181926 ) ) ( not ( = ?auto_181921 ?auto_181922 ) ) ( not ( = ?auto_181921 ?auto_181926 ) ) ( not ( = ?auto_181925 ?auto_181922 ) ) ( not ( = ?auto_181925 ?auto_181926 ) ) ( not ( = ?auto_181922 ?auto_181926 ) ) ( ON ?auto_181922 ?auto_181925 ) ( not ( = ?auto_181923 ?auto_181924 ) ) ( not ( = ?auto_181923 ?auto_181926 ) ) ( not ( = ?auto_181924 ?auto_181926 ) ) ( not ( = ?auto_181919 ?auto_181924 ) ) ( not ( = ?auto_181919 ?auto_181923 ) ) ( not ( = ?auto_181920 ?auto_181924 ) ) ( not ( = ?auto_181920 ?auto_181923 ) ) ( not ( = ?auto_181921 ?auto_181924 ) ) ( not ( = ?auto_181921 ?auto_181923 ) ) ( not ( = ?auto_181925 ?auto_181924 ) ) ( not ( = ?auto_181925 ?auto_181923 ) ) ( not ( = ?auto_181922 ?auto_181924 ) ) ( not ( = ?auto_181922 ?auto_181923 ) ) ( ON ?auto_181926 ?auto_181922 ) ( ON ?auto_181924 ?auto_181926 ) ( HOLDING ?auto_181923 ) ( CLEAR ?auto_181924 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181919 ?auto_181920 ?auto_181921 ?auto_181925 ?auto_181922 ?auto_181926 ?auto_181924 ?auto_181923 )
      ( MAKE-3PILE ?auto_181919 ?auto_181920 ?auto_181921 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181927 - BLOCK
      ?auto_181928 - BLOCK
      ?auto_181929 - BLOCK
    )
    :vars
    (
      ?auto_181934 - BLOCK
      ?auto_181933 - BLOCK
      ?auto_181932 - BLOCK
      ?auto_181930 - BLOCK
      ?auto_181931 - BLOCK
      ?auto_181935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181934 ?auto_181929 ) ( ON-TABLE ?auto_181927 ) ( ON ?auto_181928 ?auto_181927 ) ( ON ?auto_181929 ?auto_181928 ) ( not ( = ?auto_181927 ?auto_181928 ) ) ( not ( = ?auto_181927 ?auto_181929 ) ) ( not ( = ?auto_181927 ?auto_181934 ) ) ( not ( = ?auto_181928 ?auto_181929 ) ) ( not ( = ?auto_181928 ?auto_181934 ) ) ( not ( = ?auto_181929 ?auto_181934 ) ) ( not ( = ?auto_181927 ?auto_181933 ) ) ( not ( = ?auto_181927 ?auto_181932 ) ) ( not ( = ?auto_181928 ?auto_181933 ) ) ( not ( = ?auto_181928 ?auto_181932 ) ) ( not ( = ?auto_181929 ?auto_181933 ) ) ( not ( = ?auto_181929 ?auto_181932 ) ) ( not ( = ?auto_181934 ?auto_181933 ) ) ( not ( = ?auto_181934 ?auto_181932 ) ) ( not ( = ?auto_181933 ?auto_181932 ) ) ( ON ?auto_181933 ?auto_181934 ) ( not ( = ?auto_181930 ?auto_181931 ) ) ( not ( = ?auto_181930 ?auto_181932 ) ) ( not ( = ?auto_181931 ?auto_181932 ) ) ( not ( = ?auto_181927 ?auto_181931 ) ) ( not ( = ?auto_181927 ?auto_181930 ) ) ( not ( = ?auto_181928 ?auto_181931 ) ) ( not ( = ?auto_181928 ?auto_181930 ) ) ( not ( = ?auto_181929 ?auto_181931 ) ) ( not ( = ?auto_181929 ?auto_181930 ) ) ( not ( = ?auto_181934 ?auto_181931 ) ) ( not ( = ?auto_181934 ?auto_181930 ) ) ( not ( = ?auto_181933 ?auto_181931 ) ) ( not ( = ?auto_181933 ?auto_181930 ) ) ( ON ?auto_181932 ?auto_181933 ) ( ON ?auto_181931 ?auto_181932 ) ( CLEAR ?auto_181931 ) ( ON ?auto_181930 ?auto_181935 ) ( CLEAR ?auto_181930 ) ( HAND-EMPTY ) ( not ( = ?auto_181927 ?auto_181935 ) ) ( not ( = ?auto_181928 ?auto_181935 ) ) ( not ( = ?auto_181929 ?auto_181935 ) ) ( not ( = ?auto_181934 ?auto_181935 ) ) ( not ( = ?auto_181933 ?auto_181935 ) ) ( not ( = ?auto_181932 ?auto_181935 ) ) ( not ( = ?auto_181930 ?auto_181935 ) ) ( not ( = ?auto_181931 ?auto_181935 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181930 ?auto_181935 )
      ( MAKE-3PILE ?auto_181927 ?auto_181928 ?auto_181929 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181936 - BLOCK
      ?auto_181937 - BLOCK
      ?auto_181938 - BLOCK
    )
    :vars
    (
      ?auto_181941 - BLOCK
      ?auto_181939 - BLOCK
      ?auto_181942 - BLOCK
      ?auto_181944 - BLOCK
      ?auto_181940 - BLOCK
      ?auto_181943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181941 ?auto_181938 ) ( ON-TABLE ?auto_181936 ) ( ON ?auto_181937 ?auto_181936 ) ( ON ?auto_181938 ?auto_181937 ) ( not ( = ?auto_181936 ?auto_181937 ) ) ( not ( = ?auto_181936 ?auto_181938 ) ) ( not ( = ?auto_181936 ?auto_181941 ) ) ( not ( = ?auto_181937 ?auto_181938 ) ) ( not ( = ?auto_181937 ?auto_181941 ) ) ( not ( = ?auto_181938 ?auto_181941 ) ) ( not ( = ?auto_181936 ?auto_181939 ) ) ( not ( = ?auto_181936 ?auto_181942 ) ) ( not ( = ?auto_181937 ?auto_181939 ) ) ( not ( = ?auto_181937 ?auto_181942 ) ) ( not ( = ?auto_181938 ?auto_181939 ) ) ( not ( = ?auto_181938 ?auto_181942 ) ) ( not ( = ?auto_181941 ?auto_181939 ) ) ( not ( = ?auto_181941 ?auto_181942 ) ) ( not ( = ?auto_181939 ?auto_181942 ) ) ( ON ?auto_181939 ?auto_181941 ) ( not ( = ?auto_181944 ?auto_181940 ) ) ( not ( = ?auto_181944 ?auto_181942 ) ) ( not ( = ?auto_181940 ?auto_181942 ) ) ( not ( = ?auto_181936 ?auto_181940 ) ) ( not ( = ?auto_181936 ?auto_181944 ) ) ( not ( = ?auto_181937 ?auto_181940 ) ) ( not ( = ?auto_181937 ?auto_181944 ) ) ( not ( = ?auto_181938 ?auto_181940 ) ) ( not ( = ?auto_181938 ?auto_181944 ) ) ( not ( = ?auto_181941 ?auto_181940 ) ) ( not ( = ?auto_181941 ?auto_181944 ) ) ( not ( = ?auto_181939 ?auto_181940 ) ) ( not ( = ?auto_181939 ?auto_181944 ) ) ( ON ?auto_181942 ?auto_181939 ) ( ON ?auto_181944 ?auto_181943 ) ( CLEAR ?auto_181944 ) ( not ( = ?auto_181936 ?auto_181943 ) ) ( not ( = ?auto_181937 ?auto_181943 ) ) ( not ( = ?auto_181938 ?auto_181943 ) ) ( not ( = ?auto_181941 ?auto_181943 ) ) ( not ( = ?auto_181939 ?auto_181943 ) ) ( not ( = ?auto_181942 ?auto_181943 ) ) ( not ( = ?auto_181944 ?auto_181943 ) ) ( not ( = ?auto_181940 ?auto_181943 ) ) ( HOLDING ?auto_181940 ) ( CLEAR ?auto_181942 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181936 ?auto_181937 ?auto_181938 ?auto_181941 ?auto_181939 ?auto_181942 ?auto_181940 )
      ( MAKE-3PILE ?auto_181936 ?auto_181937 ?auto_181938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181945 - BLOCK
      ?auto_181946 - BLOCK
      ?auto_181947 - BLOCK
    )
    :vars
    (
      ?auto_181952 - BLOCK
      ?auto_181948 - BLOCK
      ?auto_181951 - BLOCK
      ?auto_181950 - BLOCK
      ?auto_181949 - BLOCK
      ?auto_181953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181952 ?auto_181947 ) ( ON-TABLE ?auto_181945 ) ( ON ?auto_181946 ?auto_181945 ) ( ON ?auto_181947 ?auto_181946 ) ( not ( = ?auto_181945 ?auto_181946 ) ) ( not ( = ?auto_181945 ?auto_181947 ) ) ( not ( = ?auto_181945 ?auto_181952 ) ) ( not ( = ?auto_181946 ?auto_181947 ) ) ( not ( = ?auto_181946 ?auto_181952 ) ) ( not ( = ?auto_181947 ?auto_181952 ) ) ( not ( = ?auto_181945 ?auto_181948 ) ) ( not ( = ?auto_181945 ?auto_181951 ) ) ( not ( = ?auto_181946 ?auto_181948 ) ) ( not ( = ?auto_181946 ?auto_181951 ) ) ( not ( = ?auto_181947 ?auto_181948 ) ) ( not ( = ?auto_181947 ?auto_181951 ) ) ( not ( = ?auto_181952 ?auto_181948 ) ) ( not ( = ?auto_181952 ?auto_181951 ) ) ( not ( = ?auto_181948 ?auto_181951 ) ) ( ON ?auto_181948 ?auto_181952 ) ( not ( = ?auto_181950 ?auto_181949 ) ) ( not ( = ?auto_181950 ?auto_181951 ) ) ( not ( = ?auto_181949 ?auto_181951 ) ) ( not ( = ?auto_181945 ?auto_181949 ) ) ( not ( = ?auto_181945 ?auto_181950 ) ) ( not ( = ?auto_181946 ?auto_181949 ) ) ( not ( = ?auto_181946 ?auto_181950 ) ) ( not ( = ?auto_181947 ?auto_181949 ) ) ( not ( = ?auto_181947 ?auto_181950 ) ) ( not ( = ?auto_181952 ?auto_181949 ) ) ( not ( = ?auto_181952 ?auto_181950 ) ) ( not ( = ?auto_181948 ?auto_181949 ) ) ( not ( = ?auto_181948 ?auto_181950 ) ) ( ON ?auto_181951 ?auto_181948 ) ( ON ?auto_181950 ?auto_181953 ) ( not ( = ?auto_181945 ?auto_181953 ) ) ( not ( = ?auto_181946 ?auto_181953 ) ) ( not ( = ?auto_181947 ?auto_181953 ) ) ( not ( = ?auto_181952 ?auto_181953 ) ) ( not ( = ?auto_181948 ?auto_181953 ) ) ( not ( = ?auto_181951 ?auto_181953 ) ) ( not ( = ?auto_181950 ?auto_181953 ) ) ( not ( = ?auto_181949 ?auto_181953 ) ) ( CLEAR ?auto_181951 ) ( ON ?auto_181949 ?auto_181950 ) ( CLEAR ?auto_181949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181953 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181953 ?auto_181950 )
      ( MAKE-3PILE ?auto_181945 ?auto_181946 ?auto_181947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181954 - BLOCK
      ?auto_181955 - BLOCK
      ?auto_181956 - BLOCK
    )
    :vars
    (
      ?auto_181957 - BLOCK
      ?auto_181960 - BLOCK
      ?auto_181959 - BLOCK
      ?auto_181961 - BLOCK
      ?auto_181958 - BLOCK
      ?auto_181962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181957 ?auto_181956 ) ( ON-TABLE ?auto_181954 ) ( ON ?auto_181955 ?auto_181954 ) ( ON ?auto_181956 ?auto_181955 ) ( not ( = ?auto_181954 ?auto_181955 ) ) ( not ( = ?auto_181954 ?auto_181956 ) ) ( not ( = ?auto_181954 ?auto_181957 ) ) ( not ( = ?auto_181955 ?auto_181956 ) ) ( not ( = ?auto_181955 ?auto_181957 ) ) ( not ( = ?auto_181956 ?auto_181957 ) ) ( not ( = ?auto_181954 ?auto_181960 ) ) ( not ( = ?auto_181954 ?auto_181959 ) ) ( not ( = ?auto_181955 ?auto_181960 ) ) ( not ( = ?auto_181955 ?auto_181959 ) ) ( not ( = ?auto_181956 ?auto_181960 ) ) ( not ( = ?auto_181956 ?auto_181959 ) ) ( not ( = ?auto_181957 ?auto_181960 ) ) ( not ( = ?auto_181957 ?auto_181959 ) ) ( not ( = ?auto_181960 ?auto_181959 ) ) ( ON ?auto_181960 ?auto_181957 ) ( not ( = ?auto_181961 ?auto_181958 ) ) ( not ( = ?auto_181961 ?auto_181959 ) ) ( not ( = ?auto_181958 ?auto_181959 ) ) ( not ( = ?auto_181954 ?auto_181958 ) ) ( not ( = ?auto_181954 ?auto_181961 ) ) ( not ( = ?auto_181955 ?auto_181958 ) ) ( not ( = ?auto_181955 ?auto_181961 ) ) ( not ( = ?auto_181956 ?auto_181958 ) ) ( not ( = ?auto_181956 ?auto_181961 ) ) ( not ( = ?auto_181957 ?auto_181958 ) ) ( not ( = ?auto_181957 ?auto_181961 ) ) ( not ( = ?auto_181960 ?auto_181958 ) ) ( not ( = ?auto_181960 ?auto_181961 ) ) ( ON ?auto_181961 ?auto_181962 ) ( not ( = ?auto_181954 ?auto_181962 ) ) ( not ( = ?auto_181955 ?auto_181962 ) ) ( not ( = ?auto_181956 ?auto_181962 ) ) ( not ( = ?auto_181957 ?auto_181962 ) ) ( not ( = ?auto_181960 ?auto_181962 ) ) ( not ( = ?auto_181959 ?auto_181962 ) ) ( not ( = ?auto_181961 ?auto_181962 ) ) ( not ( = ?auto_181958 ?auto_181962 ) ) ( ON ?auto_181958 ?auto_181961 ) ( CLEAR ?auto_181958 ) ( ON-TABLE ?auto_181962 ) ( HOLDING ?auto_181959 ) ( CLEAR ?auto_181960 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181954 ?auto_181955 ?auto_181956 ?auto_181957 ?auto_181960 ?auto_181959 )
      ( MAKE-3PILE ?auto_181954 ?auto_181955 ?auto_181956 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181963 - BLOCK
      ?auto_181964 - BLOCK
      ?auto_181965 - BLOCK
    )
    :vars
    (
      ?auto_181967 - BLOCK
      ?auto_181968 - BLOCK
      ?auto_181969 - BLOCK
      ?auto_181970 - BLOCK
      ?auto_181966 - BLOCK
      ?auto_181971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181967 ?auto_181965 ) ( ON-TABLE ?auto_181963 ) ( ON ?auto_181964 ?auto_181963 ) ( ON ?auto_181965 ?auto_181964 ) ( not ( = ?auto_181963 ?auto_181964 ) ) ( not ( = ?auto_181963 ?auto_181965 ) ) ( not ( = ?auto_181963 ?auto_181967 ) ) ( not ( = ?auto_181964 ?auto_181965 ) ) ( not ( = ?auto_181964 ?auto_181967 ) ) ( not ( = ?auto_181965 ?auto_181967 ) ) ( not ( = ?auto_181963 ?auto_181968 ) ) ( not ( = ?auto_181963 ?auto_181969 ) ) ( not ( = ?auto_181964 ?auto_181968 ) ) ( not ( = ?auto_181964 ?auto_181969 ) ) ( not ( = ?auto_181965 ?auto_181968 ) ) ( not ( = ?auto_181965 ?auto_181969 ) ) ( not ( = ?auto_181967 ?auto_181968 ) ) ( not ( = ?auto_181967 ?auto_181969 ) ) ( not ( = ?auto_181968 ?auto_181969 ) ) ( ON ?auto_181968 ?auto_181967 ) ( not ( = ?auto_181970 ?auto_181966 ) ) ( not ( = ?auto_181970 ?auto_181969 ) ) ( not ( = ?auto_181966 ?auto_181969 ) ) ( not ( = ?auto_181963 ?auto_181966 ) ) ( not ( = ?auto_181963 ?auto_181970 ) ) ( not ( = ?auto_181964 ?auto_181966 ) ) ( not ( = ?auto_181964 ?auto_181970 ) ) ( not ( = ?auto_181965 ?auto_181966 ) ) ( not ( = ?auto_181965 ?auto_181970 ) ) ( not ( = ?auto_181967 ?auto_181966 ) ) ( not ( = ?auto_181967 ?auto_181970 ) ) ( not ( = ?auto_181968 ?auto_181966 ) ) ( not ( = ?auto_181968 ?auto_181970 ) ) ( ON ?auto_181970 ?auto_181971 ) ( not ( = ?auto_181963 ?auto_181971 ) ) ( not ( = ?auto_181964 ?auto_181971 ) ) ( not ( = ?auto_181965 ?auto_181971 ) ) ( not ( = ?auto_181967 ?auto_181971 ) ) ( not ( = ?auto_181968 ?auto_181971 ) ) ( not ( = ?auto_181969 ?auto_181971 ) ) ( not ( = ?auto_181970 ?auto_181971 ) ) ( not ( = ?auto_181966 ?auto_181971 ) ) ( ON ?auto_181966 ?auto_181970 ) ( ON-TABLE ?auto_181971 ) ( CLEAR ?auto_181968 ) ( ON ?auto_181969 ?auto_181966 ) ( CLEAR ?auto_181969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181971 ?auto_181970 ?auto_181966 )
      ( MAKE-3PILE ?auto_181963 ?auto_181964 ?auto_181965 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181972 - BLOCK
      ?auto_181973 - BLOCK
      ?auto_181974 - BLOCK
    )
    :vars
    (
      ?auto_181976 - BLOCK
      ?auto_181975 - BLOCK
      ?auto_181980 - BLOCK
      ?auto_181977 - BLOCK
      ?auto_181979 - BLOCK
      ?auto_181978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181976 ?auto_181974 ) ( ON-TABLE ?auto_181972 ) ( ON ?auto_181973 ?auto_181972 ) ( ON ?auto_181974 ?auto_181973 ) ( not ( = ?auto_181972 ?auto_181973 ) ) ( not ( = ?auto_181972 ?auto_181974 ) ) ( not ( = ?auto_181972 ?auto_181976 ) ) ( not ( = ?auto_181973 ?auto_181974 ) ) ( not ( = ?auto_181973 ?auto_181976 ) ) ( not ( = ?auto_181974 ?auto_181976 ) ) ( not ( = ?auto_181972 ?auto_181975 ) ) ( not ( = ?auto_181972 ?auto_181980 ) ) ( not ( = ?auto_181973 ?auto_181975 ) ) ( not ( = ?auto_181973 ?auto_181980 ) ) ( not ( = ?auto_181974 ?auto_181975 ) ) ( not ( = ?auto_181974 ?auto_181980 ) ) ( not ( = ?auto_181976 ?auto_181975 ) ) ( not ( = ?auto_181976 ?auto_181980 ) ) ( not ( = ?auto_181975 ?auto_181980 ) ) ( not ( = ?auto_181977 ?auto_181979 ) ) ( not ( = ?auto_181977 ?auto_181980 ) ) ( not ( = ?auto_181979 ?auto_181980 ) ) ( not ( = ?auto_181972 ?auto_181979 ) ) ( not ( = ?auto_181972 ?auto_181977 ) ) ( not ( = ?auto_181973 ?auto_181979 ) ) ( not ( = ?auto_181973 ?auto_181977 ) ) ( not ( = ?auto_181974 ?auto_181979 ) ) ( not ( = ?auto_181974 ?auto_181977 ) ) ( not ( = ?auto_181976 ?auto_181979 ) ) ( not ( = ?auto_181976 ?auto_181977 ) ) ( not ( = ?auto_181975 ?auto_181979 ) ) ( not ( = ?auto_181975 ?auto_181977 ) ) ( ON ?auto_181977 ?auto_181978 ) ( not ( = ?auto_181972 ?auto_181978 ) ) ( not ( = ?auto_181973 ?auto_181978 ) ) ( not ( = ?auto_181974 ?auto_181978 ) ) ( not ( = ?auto_181976 ?auto_181978 ) ) ( not ( = ?auto_181975 ?auto_181978 ) ) ( not ( = ?auto_181980 ?auto_181978 ) ) ( not ( = ?auto_181977 ?auto_181978 ) ) ( not ( = ?auto_181979 ?auto_181978 ) ) ( ON ?auto_181979 ?auto_181977 ) ( ON-TABLE ?auto_181978 ) ( ON ?auto_181980 ?auto_181979 ) ( CLEAR ?auto_181980 ) ( HOLDING ?auto_181975 ) ( CLEAR ?auto_181976 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181972 ?auto_181973 ?auto_181974 ?auto_181976 ?auto_181975 )
      ( MAKE-3PILE ?auto_181972 ?auto_181973 ?auto_181974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181981 - BLOCK
      ?auto_181982 - BLOCK
      ?auto_181983 - BLOCK
    )
    :vars
    (
      ?auto_181986 - BLOCK
      ?auto_181984 - BLOCK
      ?auto_181985 - BLOCK
      ?auto_181989 - BLOCK
      ?auto_181988 - BLOCK
      ?auto_181987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181986 ?auto_181983 ) ( ON-TABLE ?auto_181981 ) ( ON ?auto_181982 ?auto_181981 ) ( ON ?auto_181983 ?auto_181982 ) ( not ( = ?auto_181981 ?auto_181982 ) ) ( not ( = ?auto_181981 ?auto_181983 ) ) ( not ( = ?auto_181981 ?auto_181986 ) ) ( not ( = ?auto_181982 ?auto_181983 ) ) ( not ( = ?auto_181982 ?auto_181986 ) ) ( not ( = ?auto_181983 ?auto_181986 ) ) ( not ( = ?auto_181981 ?auto_181984 ) ) ( not ( = ?auto_181981 ?auto_181985 ) ) ( not ( = ?auto_181982 ?auto_181984 ) ) ( not ( = ?auto_181982 ?auto_181985 ) ) ( not ( = ?auto_181983 ?auto_181984 ) ) ( not ( = ?auto_181983 ?auto_181985 ) ) ( not ( = ?auto_181986 ?auto_181984 ) ) ( not ( = ?auto_181986 ?auto_181985 ) ) ( not ( = ?auto_181984 ?auto_181985 ) ) ( not ( = ?auto_181989 ?auto_181988 ) ) ( not ( = ?auto_181989 ?auto_181985 ) ) ( not ( = ?auto_181988 ?auto_181985 ) ) ( not ( = ?auto_181981 ?auto_181988 ) ) ( not ( = ?auto_181981 ?auto_181989 ) ) ( not ( = ?auto_181982 ?auto_181988 ) ) ( not ( = ?auto_181982 ?auto_181989 ) ) ( not ( = ?auto_181983 ?auto_181988 ) ) ( not ( = ?auto_181983 ?auto_181989 ) ) ( not ( = ?auto_181986 ?auto_181988 ) ) ( not ( = ?auto_181986 ?auto_181989 ) ) ( not ( = ?auto_181984 ?auto_181988 ) ) ( not ( = ?auto_181984 ?auto_181989 ) ) ( ON ?auto_181989 ?auto_181987 ) ( not ( = ?auto_181981 ?auto_181987 ) ) ( not ( = ?auto_181982 ?auto_181987 ) ) ( not ( = ?auto_181983 ?auto_181987 ) ) ( not ( = ?auto_181986 ?auto_181987 ) ) ( not ( = ?auto_181984 ?auto_181987 ) ) ( not ( = ?auto_181985 ?auto_181987 ) ) ( not ( = ?auto_181989 ?auto_181987 ) ) ( not ( = ?auto_181988 ?auto_181987 ) ) ( ON ?auto_181988 ?auto_181989 ) ( ON-TABLE ?auto_181987 ) ( ON ?auto_181985 ?auto_181988 ) ( CLEAR ?auto_181986 ) ( ON ?auto_181984 ?auto_181985 ) ( CLEAR ?auto_181984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181987 ?auto_181989 ?auto_181988 ?auto_181985 )
      ( MAKE-3PILE ?auto_181981 ?auto_181982 ?auto_181983 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182008 - BLOCK
      ?auto_182009 - BLOCK
      ?auto_182010 - BLOCK
    )
    :vars
    (
      ?auto_182016 - BLOCK
      ?auto_182014 - BLOCK
      ?auto_182013 - BLOCK
      ?auto_182015 - BLOCK
      ?auto_182011 - BLOCK
      ?auto_182012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182008 ) ( ON ?auto_182009 ?auto_182008 ) ( not ( = ?auto_182008 ?auto_182009 ) ) ( not ( = ?auto_182008 ?auto_182010 ) ) ( not ( = ?auto_182008 ?auto_182016 ) ) ( not ( = ?auto_182009 ?auto_182010 ) ) ( not ( = ?auto_182009 ?auto_182016 ) ) ( not ( = ?auto_182010 ?auto_182016 ) ) ( not ( = ?auto_182008 ?auto_182014 ) ) ( not ( = ?auto_182008 ?auto_182013 ) ) ( not ( = ?auto_182009 ?auto_182014 ) ) ( not ( = ?auto_182009 ?auto_182013 ) ) ( not ( = ?auto_182010 ?auto_182014 ) ) ( not ( = ?auto_182010 ?auto_182013 ) ) ( not ( = ?auto_182016 ?auto_182014 ) ) ( not ( = ?auto_182016 ?auto_182013 ) ) ( not ( = ?auto_182014 ?auto_182013 ) ) ( not ( = ?auto_182015 ?auto_182011 ) ) ( not ( = ?auto_182015 ?auto_182013 ) ) ( not ( = ?auto_182011 ?auto_182013 ) ) ( not ( = ?auto_182008 ?auto_182011 ) ) ( not ( = ?auto_182008 ?auto_182015 ) ) ( not ( = ?auto_182009 ?auto_182011 ) ) ( not ( = ?auto_182009 ?auto_182015 ) ) ( not ( = ?auto_182010 ?auto_182011 ) ) ( not ( = ?auto_182010 ?auto_182015 ) ) ( not ( = ?auto_182016 ?auto_182011 ) ) ( not ( = ?auto_182016 ?auto_182015 ) ) ( not ( = ?auto_182014 ?auto_182011 ) ) ( not ( = ?auto_182014 ?auto_182015 ) ) ( ON ?auto_182015 ?auto_182012 ) ( not ( = ?auto_182008 ?auto_182012 ) ) ( not ( = ?auto_182009 ?auto_182012 ) ) ( not ( = ?auto_182010 ?auto_182012 ) ) ( not ( = ?auto_182016 ?auto_182012 ) ) ( not ( = ?auto_182014 ?auto_182012 ) ) ( not ( = ?auto_182013 ?auto_182012 ) ) ( not ( = ?auto_182015 ?auto_182012 ) ) ( not ( = ?auto_182011 ?auto_182012 ) ) ( ON ?auto_182011 ?auto_182015 ) ( ON-TABLE ?auto_182012 ) ( ON ?auto_182013 ?auto_182011 ) ( ON ?auto_182014 ?auto_182013 ) ( ON ?auto_182016 ?auto_182014 ) ( CLEAR ?auto_182016 ) ( HOLDING ?auto_182010 ) ( CLEAR ?auto_182009 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182008 ?auto_182009 ?auto_182010 ?auto_182016 )
      ( MAKE-3PILE ?auto_182008 ?auto_182009 ?auto_182010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182017 - BLOCK
      ?auto_182018 - BLOCK
      ?auto_182019 - BLOCK
    )
    :vars
    (
      ?auto_182021 - BLOCK
      ?auto_182024 - BLOCK
      ?auto_182025 - BLOCK
      ?auto_182020 - BLOCK
      ?auto_182023 - BLOCK
      ?auto_182022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182017 ) ( ON ?auto_182018 ?auto_182017 ) ( not ( = ?auto_182017 ?auto_182018 ) ) ( not ( = ?auto_182017 ?auto_182019 ) ) ( not ( = ?auto_182017 ?auto_182021 ) ) ( not ( = ?auto_182018 ?auto_182019 ) ) ( not ( = ?auto_182018 ?auto_182021 ) ) ( not ( = ?auto_182019 ?auto_182021 ) ) ( not ( = ?auto_182017 ?auto_182024 ) ) ( not ( = ?auto_182017 ?auto_182025 ) ) ( not ( = ?auto_182018 ?auto_182024 ) ) ( not ( = ?auto_182018 ?auto_182025 ) ) ( not ( = ?auto_182019 ?auto_182024 ) ) ( not ( = ?auto_182019 ?auto_182025 ) ) ( not ( = ?auto_182021 ?auto_182024 ) ) ( not ( = ?auto_182021 ?auto_182025 ) ) ( not ( = ?auto_182024 ?auto_182025 ) ) ( not ( = ?auto_182020 ?auto_182023 ) ) ( not ( = ?auto_182020 ?auto_182025 ) ) ( not ( = ?auto_182023 ?auto_182025 ) ) ( not ( = ?auto_182017 ?auto_182023 ) ) ( not ( = ?auto_182017 ?auto_182020 ) ) ( not ( = ?auto_182018 ?auto_182023 ) ) ( not ( = ?auto_182018 ?auto_182020 ) ) ( not ( = ?auto_182019 ?auto_182023 ) ) ( not ( = ?auto_182019 ?auto_182020 ) ) ( not ( = ?auto_182021 ?auto_182023 ) ) ( not ( = ?auto_182021 ?auto_182020 ) ) ( not ( = ?auto_182024 ?auto_182023 ) ) ( not ( = ?auto_182024 ?auto_182020 ) ) ( ON ?auto_182020 ?auto_182022 ) ( not ( = ?auto_182017 ?auto_182022 ) ) ( not ( = ?auto_182018 ?auto_182022 ) ) ( not ( = ?auto_182019 ?auto_182022 ) ) ( not ( = ?auto_182021 ?auto_182022 ) ) ( not ( = ?auto_182024 ?auto_182022 ) ) ( not ( = ?auto_182025 ?auto_182022 ) ) ( not ( = ?auto_182020 ?auto_182022 ) ) ( not ( = ?auto_182023 ?auto_182022 ) ) ( ON ?auto_182023 ?auto_182020 ) ( ON-TABLE ?auto_182022 ) ( ON ?auto_182025 ?auto_182023 ) ( ON ?auto_182024 ?auto_182025 ) ( ON ?auto_182021 ?auto_182024 ) ( CLEAR ?auto_182018 ) ( ON ?auto_182019 ?auto_182021 ) ( CLEAR ?auto_182019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182022 ?auto_182020 ?auto_182023 ?auto_182025 ?auto_182024 ?auto_182021 )
      ( MAKE-3PILE ?auto_182017 ?auto_182018 ?auto_182019 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182026 - BLOCK
      ?auto_182027 - BLOCK
      ?auto_182028 - BLOCK
    )
    :vars
    (
      ?auto_182030 - BLOCK
      ?auto_182034 - BLOCK
      ?auto_182029 - BLOCK
      ?auto_182032 - BLOCK
      ?auto_182031 - BLOCK
      ?auto_182033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182026 ) ( not ( = ?auto_182026 ?auto_182027 ) ) ( not ( = ?auto_182026 ?auto_182028 ) ) ( not ( = ?auto_182026 ?auto_182030 ) ) ( not ( = ?auto_182027 ?auto_182028 ) ) ( not ( = ?auto_182027 ?auto_182030 ) ) ( not ( = ?auto_182028 ?auto_182030 ) ) ( not ( = ?auto_182026 ?auto_182034 ) ) ( not ( = ?auto_182026 ?auto_182029 ) ) ( not ( = ?auto_182027 ?auto_182034 ) ) ( not ( = ?auto_182027 ?auto_182029 ) ) ( not ( = ?auto_182028 ?auto_182034 ) ) ( not ( = ?auto_182028 ?auto_182029 ) ) ( not ( = ?auto_182030 ?auto_182034 ) ) ( not ( = ?auto_182030 ?auto_182029 ) ) ( not ( = ?auto_182034 ?auto_182029 ) ) ( not ( = ?auto_182032 ?auto_182031 ) ) ( not ( = ?auto_182032 ?auto_182029 ) ) ( not ( = ?auto_182031 ?auto_182029 ) ) ( not ( = ?auto_182026 ?auto_182031 ) ) ( not ( = ?auto_182026 ?auto_182032 ) ) ( not ( = ?auto_182027 ?auto_182031 ) ) ( not ( = ?auto_182027 ?auto_182032 ) ) ( not ( = ?auto_182028 ?auto_182031 ) ) ( not ( = ?auto_182028 ?auto_182032 ) ) ( not ( = ?auto_182030 ?auto_182031 ) ) ( not ( = ?auto_182030 ?auto_182032 ) ) ( not ( = ?auto_182034 ?auto_182031 ) ) ( not ( = ?auto_182034 ?auto_182032 ) ) ( ON ?auto_182032 ?auto_182033 ) ( not ( = ?auto_182026 ?auto_182033 ) ) ( not ( = ?auto_182027 ?auto_182033 ) ) ( not ( = ?auto_182028 ?auto_182033 ) ) ( not ( = ?auto_182030 ?auto_182033 ) ) ( not ( = ?auto_182034 ?auto_182033 ) ) ( not ( = ?auto_182029 ?auto_182033 ) ) ( not ( = ?auto_182032 ?auto_182033 ) ) ( not ( = ?auto_182031 ?auto_182033 ) ) ( ON ?auto_182031 ?auto_182032 ) ( ON-TABLE ?auto_182033 ) ( ON ?auto_182029 ?auto_182031 ) ( ON ?auto_182034 ?auto_182029 ) ( ON ?auto_182030 ?auto_182034 ) ( ON ?auto_182028 ?auto_182030 ) ( CLEAR ?auto_182028 ) ( HOLDING ?auto_182027 ) ( CLEAR ?auto_182026 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182026 ?auto_182027 )
      ( MAKE-3PILE ?auto_182026 ?auto_182027 ?auto_182028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182035 - BLOCK
      ?auto_182036 - BLOCK
      ?auto_182037 - BLOCK
    )
    :vars
    (
      ?auto_182039 - BLOCK
      ?auto_182042 - BLOCK
      ?auto_182038 - BLOCK
      ?auto_182043 - BLOCK
      ?auto_182040 - BLOCK
      ?auto_182041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182035 ) ( not ( = ?auto_182035 ?auto_182036 ) ) ( not ( = ?auto_182035 ?auto_182037 ) ) ( not ( = ?auto_182035 ?auto_182039 ) ) ( not ( = ?auto_182036 ?auto_182037 ) ) ( not ( = ?auto_182036 ?auto_182039 ) ) ( not ( = ?auto_182037 ?auto_182039 ) ) ( not ( = ?auto_182035 ?auto_182042 ) ) ( not ( = ?auto_182035 ?auto_182038 ) ) ( not ( = ?auto_182036 ?auto_182042 ) ) ( not ( = ?auto_182036 ?auto_182038 ) ) ( not ( = ?auto_182037 ?auto_182042 ) ) ( not ( = ?auto_182037 ?auto_182038 ) ) ( not ( = ?auto_182039 ?auto_182042 ) ) ( not ( = ?auto_182039 ?auto_182038 ) ) ( not ( = ?auto_182042 ?auto_182038 ) ) ( not ( = ?auto_182043 ?auto_182040 ) ) ( not ( = ?auto_182043 ?auto_182038 ) ) ( not ( = ?auto_182040 ?auto_182038 ) ) ( not ( = ?auto_182035 ?auto_182040 ) ) ( not ( = ?auto_182035 ?auto_182043 ) ) ( not ( = ?auto_182036 ?auto_182040 ) ) ( not ( = ?auto_182036 ?auto_182043 ) ) ( not ( = ?auto_182037 ?auto_182040 ) ) ( not ( = ?auto_182037 ?auto_182043 ) ) ( not ( = ?auto_182039 ?auto_182040 ) ) ( not ( = ?auto_182039 ?auto_182043 ) ) ( not ( = ?auto_182042 ?auto_182040 ) ) ( not ( = ?auto_182042 ?auto_182043 ) ) ( ON ?auto_182043 ?auto_182041 ) ( not ( = ?auto_182035 ?auto_182041 ) ) ( not ( = ?auto_182036 ?auto_182041 ) ) ( not ( = ?auto_182037 ?auto_182041 ) ) ( not ( = ?auto_182039 ?auto_182041 ) ) ( not ( = ?auto_182042 ?auto_182041 ) ) ( not ( = ?auto_182038 ?auto_182041 ) ) ( not ( = ?auto_182043 ?auto_182041 ) ) ( not ( = ?auto_182040 ?auto_182041 ) ) ( ON ?auto_182040 ?auto_182043 ) ( ON-TABLE ?auto_182041 ) ( ON ?auto_182038 ?auto_182040 ) ( ON ?auto_182042 ?auto_182038 ) ( ON ?auto_182039 ?auto_182042 ) ( ON ?auto_182037 ?auto_182039 ) ( CLEAR ?auto_182035 ) ( ON ?auto_182036 ?auto_182037 ) ( CLEAR ?auto_182036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182041 ?auto_182043 ?auto_182040 ?auto_182038 ?auto_182042 ?auto_182039 ?auto_182037 )
      ( MAKE-3PILE ?auto_182035 ?auto_182036 ?auto_182037 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182044 - BLOCK
      ?auto_182045 - BLOCK
      ?auto_182046 - BLOCK
    )
    :vars
    (
      ?auto_182052 - BLOCK
      ?auto_182048 - BLOCK
      ?auto_182049 - BLOCK
      ?auto_182051 - BLOCK
      ?auto_182050 - BLOCK
      ?auto_182047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182044 ?auto_182045 ) ) ( not ( = ?auto_182044 ?auto_182046 ) ) ( not ( = ?auto_182044 ?auto_182052 ) ) ( not ( = ?auto_182045 ?auto_182046 ) ) ( not ( = ?auto_182045 ?auto_182052 ) ) ( not ( = ?auto_182046 ?auto_182052 ) ) ( not ( = ?auto_182044 ?auto_182048 ) ) ( not ( = ?auto_182044 ?auto_182049 ) ) ( not ( = ?auto_182045 ?auto_182048 ) ) ( not ( = ?auto_182045 ?auto_182049 ) ) ( not ( = ?auto_182046 ?auto_182048 ) ) ( not ( = ?auto_182046 ?auto_182049 ) ) ( not ( = ?auto_182052 ?auto_182048 ) ) ( not ( = ?auto_182052 ?auto_182049 ) ) ( not ( = ?auto_182048 ?auto_182049 ) ) ( not ( = ?auto_182051 ?auto_182050 ) ) ( not ( = ?auto_182051 ?auto_182049 ) ) ( not ( = ?auto_182050 ?auto_182049 ) ) ( not ( = ?auto_182044 ?auto_182050 ) ) ( not ( = ?auto_182044 ?auto_182051 ) ) ( not ( = ?auto_182045 ?auto_182050 ) ) ( not ( = ?auto_182045 ?auto_182051 ) ) ( not ( = ?auto_182046 ?auto_182050 ) ) ( not ( = ?auto_182046 ?auto_182051 ) ) ( not ( = ?auto_182052 ?auto_182050 ) ) ( not ( = ?auto_182052 ?auto_182051 ) ) ( not ( = ?auto_182048 ?auto_182050 ) ) ( not ( = ?auto_182048 ?auto_182051 ) ) ( ON ?auto_182051 ?auto_182047 ) ( not ( = ?auto_182044 ?auto_182047 ) ) ( not ( = ?auto_182045 ?auto_182047 ) ) ( not ( = ?auto_182046 ?auto_182047 ) ) ( not ( = ?auto_182052 ?auto_182047 ) ) ( not ( = ?auto_182048 ?auto_182047 ) ) ( not ( = ?auto_182049 ?auto_182047 ) ) ( not ( = ?auto_182051 ?auto_182047 ) ) ( not ( = ?auto_182050 ?auto_182047 ) ) ( ON ?auto_182050 ?auto_182051 ) ( ON-TABLE ?auto_182047 ) ( ON ?auto_182049 ?auto_182050 ) ( ON ?auto_182048 ?auto_182049 ) ( ON ?auto_182052 ?auto_182048 ) ( ON ?auto_182046 ?auto_182052 ) ( ON ?auto_182045 ?auto_182046 ) ( CLEAR ?auto_182045 ) ( HOLDING ?auto_182044 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182044 )
      ( MAKE-3PILE ?auto_182044 ?auto_182045 ?auto_182046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182053 - BLOCK
      ?auto_182054 - BLOCK
      ?auto_182055 - BLOCK
    )
    :vars
    (
      ?auto_182059 - BLOCK
      ?auto_182056 - BLOCK
      ?auto_182060 - BLOCK
      ?auto_182057 - BLOCK
      ?auto_182058 - BLOCK
      ?auto_182061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182053 ?auto_182054 ) ) ( not ( = ?auto_182053 ?auto_182055 ) ) ( not ( = ?auto_182053 ?auto_182059 ) ) ( not ( = ?auto_182054 ?auto_182055 ) ) ( not ( = ?auto_182054 ?auto_182059 ) ) ( not ( = ?auto_182055 ?auto_182059 ) ) ( not ( = ?auto_182053 ?auto_182056 ) ) ( not ( = ?auto_182053 ?auto_182060 ) ) ( not ( = ?auto_182054 ?auto_182056 ) ) ( not ( = ?auto_182054 ?auto_182060 ) ) ( not ( = ?auto_182055 ?auto_182056 ) ) ( not ( = ?auto_182055 ?auto_182060 ) ) ( not ( = ?auto_182059 ?auto_182056 ) ) ( not ( = ?auto_182059 ?auto_182060 ) ) ( not ( = ?auto_182056 ?auto_182060 ) ) ( not ( = ?auto_182057 ?auto_182058 ) ) ( not ( = ?auto_182057 ?auto_182060 ) ) ( not ( = ?auto_182058 ?auto_182060 ) ) ( not ( = ?auto_182053 ?auto_182058 ) ) ( not ( = ?auto_182053 ?auto_182057 ) ) ( not ( = ?auto_182054 ?auto_182058 ) ) ( not ( = ?auto_182054 ?auto_182057 ) ) ( not ( = ?auto_182055 ?auto_182058 ) ) ( not ( = ?auto_182055 ?auto_182057 ) ) ( not ( = ?auto_182059 ?auto_182058 ) ) ( not ( = ?auto_182059 ?auto_182057 ) ) ( not ( = ?auto_182056 ?auto_182058 ) ) ( not ( = ?auto_182056 ?auto_182057 ) ) ( ON ?auto_182057 ?auto_182061 ) ( not ( = ?auto_182053 ?auto_182061 ) ) ( not ( = ?auto_182054 ?auto_182061 ) ) ( not ( = ?auto_182055 ?auto_182061 ) ) ( not ( = ?auto_182059 ?auto_182061 ) ) ( not ( = ?auto_182056 ?auto_182061 ) ) ( not ( = ?auto_182060 ?auto_182061 ) ) ( not ( = ?auto_182057 ?auto_182061 ) ) ( not ( = ?auto_182058 ?auto_182061 ) ) ( ON ?auto_182058 ?auto_182057 ) ( ON-TABLE ?auto_182061 ) ( ON ?auto_182060 ?auto_182058 ) ( ON ?auto_182056 ?auto_182060 ) ( ON ?auto_182059 ?auto_182056 ) ( ON ?auto_182055 ?auto_182059 ) ( ON ?auto_182054 ?auto_182055 ) ( ON ?auto_182053 ?auto_182054 ) ( CLEAR ?auto_182053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182061 ?auto_182057 ?auto_182058 ?auto_182060 ?auto_182056 ?auto_182059 ?auto_182055 ?auto_182054 )
      ( MAKE-3PILE ?auto_182053 ?auto_182054 ?auto_182055 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182067 - BLOCK
      ?auto_182068 - BLOCK
      ?auto_182069 - BLOCK
      ?auto_182070 - BLOCK
      ?auto_182071 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_182071 ) ( CLEAR ?auto_182070 ) ( ON-TABLE ?auto_182067 ) ( ON ?auto_182068 ?auto_182067 ) ( ON ?auto_182069 ?auto_182068 ) ( ON ?auto_182070 ?auto_182069 ) ( not ( = ?auto_182067 ?auto_182068 ) ) ( not ( = ?auto_182067 ?auto_182069 ) ) ( not ( = ?auto_182067 ?auto_182070 ) ) ( not ( = ?auto_182067 ?auto_182071 ) ) ( not ( = ?auto_182068 ?auto_182069 ) ) ( not ( = ?auto_182068 ?auto_182070 ) ) ( not ( = ?auto_182068 ?auto_182071 ) ) ( not ( = ?auto_182069 ?auto_182070 ) ) ( not ( = ?auto_182069 ?auto_182071 ) ) ( not ( = ?auto_182070 ?auto_182071 ) ) )
    :subtasks
    ( ( !STACK ?auto_182071 ?auto_182070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182072 - BLOCK
      ?auto_182073 - BLOCK
      ?auto_182074 - BLOCK
      ?auto_182075 - BLOCK
      ?auto_182076 - BLOCK
    )
    :vars
    (
      ?auto_182077 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_182075 ) ( ON-TABLE ?auto_182072 ) ( ON ?auto_182073 ?auto_182072 ) ( ON ?auto_182074 ?auto_182073 ) ( ON ?auto_182075 ?auto_182074 ) ( not ( = ?auto_182072 ?auto_182073 ) ) ( not ( = ?auto_182072 ?auto_182074 ) ) ( not ( = ?auto_182072 ?auto_182075 ) ) ( not ( = ?auto_182072 ?auto_182076 ) ) ( not ( = ?auto_182073 ?auto_182074 ) ) ( not ( = ?auto_182073 ?auto_182075 ) ) ( not ( = ?auto_182073 ?auto_182076 ) ) ( not ( = ?auto_182074 ?auto_182075 ) ) ( not ( = ?auto_182074 ?auto_182076 ) ) ( not ( = ?auto_182075 ?auto_182076 ) ) ( ON ?auto_182076 ?auto_182077 ) ( CLEAR ?auto_182076 ) ( HAND-EMPTY ) ( not ( = ?auto_182072 ?auto_182077 ) ) ( not ( = ?auto_182073 ?auto_182077 ) ) ( not ( = ?auto_182074 ?auto_182077 ) ) ( not ( = ?auto_182075 ?auto_182077 ) ) ( not ( = ?auto_182076 ?auto_182077 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182076 ?auto_182077 )
      ( MAKE-5PILE ?auto_182072 ?auto_182073 ?auto_182074 ?auto_182075 ?auto_182076 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182078 - BLOCK
      ?auto_182079 - BLOCK
      ?auto_182080 - BLOCK
      ?auto_182081 - BLOCK
      ?auto_182082 - BLOCK
    )
    :vars
    (
      ?auto_182083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182078 ) ( ON ?auto_182079 ?auto_182078 ) ( ON ?auto_182080 ?auto_182079 ) ( not ( = ?auto_182078 ?auto_182079 ) ) ( not ( = ?auto_182078 ?auto_182080 ) ) ( not ( = ?auto_182078 ?auto_182081 ) ) ( not ( = ?auto_182078 ?auto_182082 ) ) ( not ( = ?auto_182079 ?auto_182080 ) ) ( not ( = ?auto_182079 ?auto_182081 ) ) ( not ( = ?auto_182079 ?auto_182082 ) ) ( not ( = ?auto_182080 ?auto_182081 ) ) ( not ( = ?auto_182080 ?auto_182082 ) ) ( not ( = ?auto_182081 ?auto_182082 ) ) ( ON ?auto_182082 ?auto_182083 ) ( CLEAR ?auto_182082 ) ( not ( = ?auto_182078 ?auto_182083 ) ) ( not ( = ?auto_182079 ?auto_182083 ) ) ( not ( = ?auto_182080 ?auto_182083 ) ) ( not ( = ?auto_182081 ?auto_182083 ) ) ( not ( = ?auto_182082 ?auto_182083 ) ) ( HOLDING ?auto_182081 ) ( CLEAR ?auto_182080 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182078 ?auto_182079 ?auto_182080 ?auto_182081 )
      ( MAKE-5PILE ?auto_182078 ?auto_182079 ?auto_182080 ?auto_182081 ?auto_182082 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182084 - BLOCK
      ?auto_182085 - BLOCK
      ?auto_182086 - BLOCK
      ?auto_182087 - BLOCK
      ?auto_182088 - BLOCK
    )
    :vars
    (
      ?auto_182089 - BLOCK
      ?auto_182091 - BLOCK
      ?auto_182090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182084 ) ( ON ?auto_182085 ?auto_182084 ) ( ON ?auto_182086 ?auto_182085 ) ( not ( = ?auto_182084 ?auto_182085 ) ) ( not ( = ?auto_182084 ?auto_182086 ) ) ( not ( = ?auto_182084 ?auto_182087 ) ) ( not ( = ?auto_182084 ?auto_182088 ) ) ( not ( = ?auto_182085 ?auto_182086 ) ) ( not ( = ?auto_182085 ?auto_182087 ) ) ( not ( = ?auto_182085 ?auto_182088 ) ) ( not ( = ?auto_182086 ?auto_182087 ) ) ( not ( = ?auto_182086 ?auto_182088 ) ) ( not ( = ?auto_182087 ?auto_182088 ) ) ( ON ?auto_182088 ?auto_182089 ) ( not ( = ?auto_182084 ?auto_182089 ) ) ( not ( = ?auto_182085 ?auto_182089 ) ) ( not ( = ?auto_182086 ?auto_182089 ) ) ( not ( = ?auto_182087 ?auto_182089 ) ) ( not ( = ?auto_182088 ?auto_182089 ) ) ( CLEAR ?auto_182086 ) ( ON ?auto_182087 ?auto_182088 ) ( CLEAR ?auto_182087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182091 ) ( ON ?auto_182090 ?auto_182091 ) ( ON ?auto_182089 ?auto_182090 ) ( not ( = ?auto_182091 ?auto_182090 ) ) ( not ( = ?auto_182091 ?auto_182089 ) ) ( not ( = ?auto_182091 ?auto_182088 ) ) ( not ( = ?auto_182091 ?auto_182087 ) ) ( not ( = ?auto_182090 ?auto_182089 ) ) ( not ( = ?auto_182090 ?auto_182088 ) ) ( not ( = ?auto_182090 ?auto_182087 ) ) ( not ( = ?auto_182084 ?auto_182091 ) ) ( not ( = ?auto_182084 ?auto_182090 ) ) ( not ( = ?auto_182085 ?auto_182091 ) ) ( not ( = ?auto_182085 ?auto_182090 ) ) ( not ( = ?auto_182086 ?auto_182091 ) ) ( not ( = ?auto_182086 ?auto_182090 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182091 ?auto_182090 ?auto_182089 ?auto_182088 )
      ( MAKE-5PILE ?auto_182084 ?auto_182085 ?auto_182086 ?auto_182087 ?auto_182088 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182092 - BLOCK
      ?auto_182093 - BLOCK
      ?auto_182094 - BLOCK
      ?auto_182095 - BLOCK
      ?auto_182096 - BLOCK
    )
    :vars
    (
      ?auto_182099 - BLOCK
      ?auto_182097 - BLOCK
      ?auto_182098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182092 ) ( ON ?auto_182093 ?auto_182092 ) ( not ( = ?auto_182092 ?auto_182093 ) ) ( not ( = ?auto_182092 ?auto_182094 ) ) ( not ( = ?auto_182092 ?auto_182095 ) ) ( not ( = ?auto_182092 ?auto_182096 ) ) ( not ( = ?auto_182093 ?auto_182094 ) ) ( not ( = ?auto_182093 ?auto_182095 ) ) ( not ( = ?auto_182093 ?auto_182096 ) ) ( not ( = ?auto_182094 ?auto_182095 ) ) ( not ( = ?auto_182094 ?auto_182096 ) ) ( not ( = ?auto_182095 ?auto_182096 ) ) ( ON ?auto_182096 ?auto_182099 ) ( not ( = ?auto_182092 ?auto_182099 ) ) ( not ( = ?auto_182093 ?auto_182099 ) ) ( not ( = ?auto_182094 ?auto_182099 ) ) ( not ( = ?auto_182095 ?auto_182099 ) ) ( not ( = ?auto_182096 ?auto_182099 ) ) ( ON ?auto_182095 ?auto_182096 ) ( CLEAR ?auto_182095 ) ( ON-TABLE ?auto_182097 ) ( ON ?auto_182098 ?auto_182097 ) ( ON ?auto_182099 ?auto_182098 ) ( not ( = ?auto_182097 ?auto_182098 ) ) ( not ( = ?auto_182097 ?auto_182099 ) ) ( not ( = ?auto_182097 ?auto_182096 ) ) ( not ( = ?auto_182097 ?auto_182095 ) ) ( not ( = ?auto_182098 ?auto_182099 ) ) ( not ( = ?auto_182098 ?auto_182096 ) ) ( not ( = ?auto_182098 ?auto_182095 ) ) ( not ( = ?auto_182092 ?auto_182097 ) ) ( not ( = ?auto_182092 ?auto_182098 ) ) ( not ( = ?auto_182093 ?auto_182097 ) ) ( not ( = ?auto_182093 ?auto_182098 ) ) ( not ( = ?auto_182094 ?auto_182097 ) ) ( not ( = ?auto_182094 ?auto_182098 ) ) ( HOLDING ?auto_182094 ) ( CLEAR ?auto_182093 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182092 ?auto_182093 ?auto_182094 )
      ( MAKE-5PILE ?auto_182092 ?auto_182093 ?auto_182094 ?auto_182095 ?auto_182096 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182100 - BLOCK
      ?auto_182101 - BLOCK
      ?auto_182102 - BLOCK
      ?auto_182103 - BLOCK
      ?auto_182104 - BLOCK
    )
    :vars
    (
      ?auto_182106 - BLOCK
      ?auto_182107 - BLOCK
      ?auto_182105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182100 ) ( ON ?auto_182101 ?auto_182100 ) ( not ( = ?auto_182100 ?auto_182101 ) ) ( not ( = ?auto_182100 ?auto_182102 ) ) ( not ( = ?auto_182100 ?auto_182103 ) ) ( not ( = ?auto_182100 ?auto_182104 ) ) ( not ( = ?auto_182101 ?auto_182102 ) ) ( not ( = ?auto_182101 ?auto_182103 ) ) ( not ( = ?auto_182101 ?auto_182104 ) ) ( not ( = ?auto_182102 ?auto_182103 ) ) ( not ( = ?auto_182102 ?auto_182104 ) ) ( not ( = ?auto_182103 ?auto_182104 ) ) ( ON ?auto_182104 ?auto_182106 ) ( not ( = ?auto_182100 ?auto_182106 ) ) ( not ( = ?auto_182101 ?auto_182106 ) ) ( not ( = ?auto_182102 ?auto_182106 ) ) ( not ( = ?auto_182103 ?auto_182106 ) ) ( not ( = ?auto_182104 ?auto_182106 ) ) ( ON ?auto_182103 ?auto_182104 ) ( ON-TABLE ?auto_182107 ) ( ON ?auto_182105 ?auto_182107 ) ( ON ?auto_182106 ?auto_182105 ) ( not ( = ?auto_182107 ?auto_182105 ) ) ( not ( = ?auto_182107 ?auto_182106 ) ) ( not ( = ?auto_182107 ?auto_182104 ) ) ( not ( = ?auto_182107 ?auto_182103 ) ) ( not ( = ?auto_182105 ?auto_182106 ) ) ( not ( = ?auto_182105 ?auto_182104 ) ) ( not ( = ?auto_182105 ?auto_182103 ) ) ( not ( = ?auto_182100 ?auto_182107 ) ) ( not ( = ?auto_182100 ?auto_182105 ) ) ( not ( = ?auto_182101 ?auto_182107 ) ) ( not ( = ?auto_182101 ?auto_182105 ) ) ( not ( = ?auto_182102 ?auto_182107 ) ) ( not ( = ?auto_182102 ?auto_182105 ) ) ( CLEAR ?auto_182101 ) ( ON ?auto_182102 ?auto_182103 ) ( CLEAR ?auto_182102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182107 ?auto_182105 ?auto_182106 ?auto_182104 ?auto_182103 )
      ( MAKE-5PILE ?auto_182100 ?auto_182101 ?auto_182102 ?auto_182103 ?auto_182104 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182108 - BLOCK
      ?auto_182109 - BLOCK
      ?auto_182110 - BLOCK
      ?auto_182111 - BLOCK
      ?auto_182112 - BLOCK
    )
    :vars
    (
      ?auto_182114 - BLOCK
      ?auto_182115 - BLOCK
      ?auto_182113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182108 ) ( not ( = ?auto_182108 ?auto_182109 ) ) ( not ( = ?auto_182108 ?auto_182110 ) ) ( not ( = ?auto_182108 ?auto_182111 ) ) ( not ( = ?auto_182108 ?auto_182112 ) ) ( not ( = ?auto_182109 ?auto_182110 ) ) ( not ( = ?auto_182109 ?auto_182111 ) ) ( not ( = ?auto_182109 ?auto_182112 ) ) ( not ( = ?auto_182110 ?auto_182111 ) ) ( not ( = ?auto_182110 ?auto_182112 ) ) ( not ( = ?auto_182111 ?auto_182112 ) ) ( ON ?auto_182112 ?auto_182114 ) ( not ( = ?auto_182108 ?auto_182114 ) ) ( not ( = ?auto_182109 ?auto_182114 ) ) ( not ( = ?auto_182110 ?auto_182114 ) ) ( not ( = ?auto_182111 ?auto_182114 ) ) ( not ( = ?auto_182112 ?auto_182114 ) ) ( ON ?auto_182111 ?auto_182112 ) ( ON-TABLE ?auto_182115 ) ( ON ?auto_182113 ?auto_182115 ) ( ON ?auto_182114 ?auto_182113 ) ( not ( = ?auto_182115 ?auto_182113 ) ) ( not ( = ?auto_182115 ?auto_182114 ) ) ( not ( = ?auto_182115 ?auto_182112 ) ) ( not ( = ?auto_182115 ?auto_182111 ) ) ( not ( = ?auto_182113 ?auto_182114 ) ) ( not ( = ?auto_182113 ?auto_182112 ) ) ( not ( = ?auto_182113 ?auto_182111 ) ) ( not ( = ?auto_182108 ?auto_182115 ) ) ( not ( = ?auto_182108 ?auto_182113 ) ) ( not ( = ?auto_182109 ?auto_182115 ) ) ( not ( = ?auto_182109 ?auto_182113 ) ) ( not ( = ?auto_182110 ?auto_182115 ) ) ( not ( = ?auto_182110 ?auto_182113 ) ) ( ON ?auto_182110 ?auto_182111 ) ( CLEAR ?auto_182110 ) ( HOLDING ?auto_182109 ) ( CLEAR ?auto_182108 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182108 ?auto_182109 )
      ( MAKE-5PILE ?auto_182108 ?auto_182109 ?auto_182110 ?auto_182111 ?auto_182112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182116 - BLOCK
      ?auto_182117 - BLOCK
      ?auto_182118 - BLOCK
      ?auto_182119 - BLOCK
      ?auto_182120 - BLOCK
    )
    :vars
    (
      ?auto_182122 - BLOCK
      ?auto_182123 - BLOCK
      ?auto_182121 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182116 ) ( not ( = ?auto_182116 ?auto_182117 ) ) ( not ( = ?auto_182116 ?auto_182118 ) ) ( not ( = ?auto_182116 ?auto_182119 ) ) ( not ( = ?auto_182116 ?auto_182120 ) ) ( not ( = ?auto_182117 ?auto_182118 ) ) ( not ( = ?auto_182117 ?auto_182119 ) ) ( not ( = ?auto_182117 ?auto_182120 ) ) ( not ( = ?auto_182118 ?auto_182119 ) ) ( not ( = ?auto_182118 ?auto_182120 ) ) ( not ( = ?auto_182119 ?auto_182120 ) ) ( ON ?auto_182120 ?auto_182122 ) ( not ( = ?auto_182116 ?auto_182122 ) ) ( not ( = ?auto_182117 ?auto_182122 ) ) ( not ( = ?auto_182118 ?auto_182122 ) ) ( not ( = ?auto_182119 ?auto_182122 ) ) ( not ( = ?auto_182120 ?auto_182122 ) ) ( ON ?auto_182119 ?auto_182120 ) ( ON-TABLE ?auto_182123 ) ( ON ?auto_182121 ?auto_182123 ) ( ON ?auto_182122 ?auto_182121 ) ( not ( = ?auto_182123 ?auto_182121 ) ) ( not ( = ?auto_182123 ?auto_182122 ) ) ( not ( = ?auto_182123 ?auto_182120 ) ) ( not ( = ?auto_182123 ?auto_182119 ) ) ( not ( = ?auto_182121 ?auto_182122 ) ) ( not ( = ?auto_182121 ?auto_182120 ) ) ( not ( = ?auto_182121 ?auto_182119 ) ) ( not ( = ?auto_182116 ?auto_182123 ) ) ( not ( = ?auto_182116 ?auto_182121 ) ) ( not ( = ?auto_182117 ?auto_182123 ) ) ( not ( = ?auto_182117 ?auto_182121 ) ) ( not ( = ?auto_182118 ?auto_182123 ) ) ( not ( = ?auto_182118 ?auto_182121 ) ) ( ON ?auto_182118 ?auto_182119 ) ( CLEAR ?auto_182116 ) ( ON ?auto_182117 ?auto_182118 ) ( CLEAR ?auto_182117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182123 ?auto_182121 ?auto_182122 ?auto_182120 ?auto_182119 ?auto_182118 )
      ( MAKE-5PILE ?auto_182116 ?auto_182117 ?auto_182118 ?auto_182119 ?auto_182120 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182124 - BLOCK
      ?auto_182125 - BLOCK
      ?auto_182126 - BLOCK
      ?auto_182127 - BLOCK
      ?auto_182128 - BLOCK
    )
    :vars
    (
      ?auto_182131 - BLOCK
      ?auto_182130 - BLOCK
      ?auto_182129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182124 ?auto_182125 ) ) ( not ( = ?auto_182124 ?auto_182126 ) ) ( not ( = ?auto_182124 ?auto_182127 ) ) ( not ( = ?auto_182124 ?auto_182128 ) ) ( not ( = ?auto_182125 ?auto_182126 ) ) ( not ( = ?auto_182125 ?auto_182127 ) ) ( not ( = ?auto_182125 ?auto_182128 ) ) ( not ( = ?auto_182126 ?auto_182127 ) ) ( not ( = ?auto_182126 ?auto_182128 ) ) ( not ( = ?auto_182127 ?auto_182128 ) ) ( ON ?auto_182128 ?auto_182131 ) ( not ( = ?auto_182124 ?auto_182131 ) ) ( not ( = ?auto_182125 ?auto_182131 ) ) ( not ( = ?auto_182126 ?auto_182131 ) ) ( not ( = ?auto_182127 ?auto_182131 ) ) ( not ( = ?auto_182128 ?auto_182131 ) ) ( ON ?auto_182127 ?auto_182128 ) ( ON-TABLE ?auto_182130 ) ( ON ?auto_182129 ?auto_182130 ) ( ON ?auto_182131 ?auto_182129 ) ( not ( = ?auto_182130 ?auto_182129 ) ) ( not ( = ?auto_182130 ?auto_182131 ) ) ( not ( = ?auto_182130 ?auto_182128 ) ) ( not ( = ?auto_182130 ?auto_182127 ) ) ( not ( = ?auto_182129 ?auto_182131 ) ) ( not ( = ?auto_182129 ?auto_182128 ) ) ( not ( = ?auto_182129 ?auto_182127 ) ) ( not ( = ?auto_182124 ?auto_182130 ) ) ( not ( = ?auto_182124 ?auto_182129 ) ) ( not ( = ?auto_182125 ?auto_182130 ) ) ( not ( = ?auto_182125 ?auto_182129 ) ) ( not ( = ?auto_182126 ?auto_182130 ) ) ( not ( = ?auto_182126 ?auto_182129 ) ) ( ON ?auto_182126 ?auto_182127 ) ( ON ?auto_182125 ?auto_182126 ) ( CLEAR ?auto_182125 ) ( HOLDING ?auto_182124 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182124 )
      ( MAKE-5PILE ?auto_182124 ?auto_182125 ?auto_182126 ?auto_182127 ?auto_182128 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182132 - BLOCK
      ?auto_182133 - BLOCK
      ?auto_182134 - BLOCK
      ?auto_182135 - BLOCK
      ?auto_182136 - BLOCK
    )
    :vars
    (
      ?auto_182137 - BLOCK
      ?auto_182138 - BLOCK
      ?auto_182139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182132 ?auto_182133 ) ) ( not ( = ?auto_182132 ?auto_182134 ) ) ( not ( = ?auto_182132 ?auto_182135 ) ) ( not ( = ?auto_182132 ?auto_182136 ) ) ( not ( = ?auto_182133 ?auto_182134 ) ) ( not ( = ?auto_182133 ?auto_182135 ) ) ( not ( = ?auto_182133 ?auto_182136 ) ) ( not ( = ?auto_182134 ?auto_182135 ) ) ( not ( = ?auto_182134 ?auto_182136 ) ) ( not ( = ?auto_182135 ?auto_182136 ) ) ( ON ?auto_182136 ?auto_182137 ) ( not ( = ?auto_182132 ?auto_182137 ) ) ( not ( = ?auto_182133 ?auto_182137 ) ) ( not ( = ?auto_182134 ?auto_182137 ) ) ( not ( = ?auto_182135 ?auto_182137 ) ) ( not ( = ?auto_182136 ?auto_182137 ) ) ( ON ?auto_182135 ?auto_182136 ) ( ON-TABLE ?auto_182138 ) ( ON ?auto_182139 ?auto_182138 ) ( ON ?auto_182137 ?auto_182139 ) ( not ( = ?auto_182138 ?auto_182139 ) ) ( not ( = ?auto_182138 ?auto_182137 ) ) ( not ( = ?auto_182138 ?auto_182136 ) ) ( not ( = ?auto_182138 ?auto_182135 ) ) ( not ( = ?auto_182139 ?auto_182137 ) ) ( not ( = ?auto_182139 ?auto_182136 ) ) ( not ( = ?auto_182139 ?auto_182135 ) ) ( not ( = ?auto_182132 ?auto_182138 ) ) ( not ( = ?auto_182132 ?auto_182139 ) ) ( not ( = ?auto_182133 ?auto_182138 ) ) ( not ( = ?auto_182133 ?auto_182139 ) ) ( not ( = ?auto_182134 ?auto_182138 ) ) ( not ( = ?auto_182134 ?auto_182139 ) ) ( ON ?auto_182134 ?auto_182135 ) ( ON ?auto_182133 ?auto_182134 ) ( ON ?auto_182132 ?auto_182133 ) ( CLEAR ?auto_182132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182138 ?auto_182139 ?auto_182137 ?auto_182136 ?auto_182135 ?auto_182134 ?auto_182133 )
      ( MAKE-5PILE ?auto_182132 ?auto_182133 ?auto_182134 ?auto_182135 ?auto_182136 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182140 - BLOCK
      ?auto_182141 - BLOCK
      ?auto_182142 - BLOCK
      ?auto_182143 - BLOCK
      ?auto_182144 - BLOCK
    )
    :vars
    (
      ?auto_182145 - BLOCK
      ?auto_182146 - BLOCK
      ?auto_182147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182140 ?auto_182141 ) ) ( not ( = ?auto_182140 ?auto_182142 ) ) ( not ( = ?auto_182140 ?auto_182143 ) ) ( not ( = ?auto_182140 ?auto_182144 ) ) ( not ( = ?auto_182141 ?auto_182142 ) ) ( not ( = ?auto_182141 ?auto_182143 ) ) ( not ( = ?auto_182141 ?auto_182144 ) ) ( not ( = ?auto_182142 ?auto_182143 ) ) ( not ( = ?auto_182142 ?auto_182144 ) ) ( not ( = ?auto_182143 ?auto_182144 ) ) ( ON ?auto_182144 ?auto_182145 ) ( not ( = ?auto_182140 ?auto_182145 ) ) ( not ( = ?auto_182141 ?auto_182145 ) ) ( not ( = ?auto_182142 ?auto_182145 ) ) ( not ( = ?auto_182143 ?auto_182145 ) ) ( not ( = ?auto_182144 ?auto_182145 ) ) ( ON ?auto_182143 ?auto_182144 ) ( ON-TABLE ?auto_182146 ) ( ON ?auto_182147 ?auto_182146 ) ( ON ?auto_182145 ?auto_182147 ) ( not ( = ?auto_182146 ?auto_182147 ) ) ( not ( = ?auto_182146 ?auto_182145 ) ) ( not ( = ?auto_182146 ?auto_182144 ) ) ( not ( = ?auto_182146 ?auto_182143 ) ) ( not ( = ?auto_182147 ?auto_182145 ) ) ( not ( = ?auto_182147 ?auto_182144 ) ) ( not ( = ?auto_182147 ?auto_182143 ) ) ( not ( = ?auto_182140 ?auto_182146 ) ) ( not ( = ?auto_182140 ?auto_182147 ) ) ( not ( = ?auto_182141 ?auto_182146 ) ) ( not ( = ?auto_182141 ?auto_182147 ) ) ( not ( = ?auto_182142 ?auto_182146 ) ) ( not ( = ?auto_182142 ?auto_182147 ) ) ( ON ?auto_182142 ?auto_182143 ) ( ON ?auto_182141 ?auto_182142 ) ( HOLDING ?auto_182140 ) ( CLEAR ?auto_182141 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182146 ?auto_182147 ?auto_182145 ?auto_182144 ?auto_182143 ?auto_182142 ?auto_182141 ?auto_182140 )
      ( MAKE-5PILE ?auto_182140 ?auto_182141 ?auto_182142 ?auto_182143 ?auto_182144 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182148 - BLOCK
      ?auto_182149 - BLOCK
      ?auto_182150 - BLOCK
      ?auto_182151 - BLOCK
      ?auto_182152 - BLOCK
    )
    :vars
    (
      ?auto_182155 - BLOCK
      ?auto_182153 - BLOCK
      ?auto_182154 - BLOCK
      ?auto_182156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182148 ?auto_182149 ) ) ( not ( = ?auto_182148 ?auto_182150 ) ) ( not ( = ?auto_182148 ?auto_182151 ) ) ( not ( = ?auto_182148 ?auto_182152 ) ) ( not ( = ?auto_182149 ?auto_182150 ) ) ( not ( = ?auto_182149 ?auto_182151 ) ) ( not ( = ?auto_182149 ?auto_182152 ) ) ( not ( = ?auto_182150 ?auto_182151 ) ) ( not ( = ?auto_182150 ?auto_182152 ) ) ( not ( = ?auto_182151 ?auto_182152 ) ) ( ON ?auto_182152 ?auto_182155 ) ( not ( = ?auto_182148 ?auto_182155 ) ) ( not ( = ?auto_182149 ?auto_182155 ) ) ( not ( = ?auto_182150 ?auto_182155 ) ) ( not ( = ?auto_182151 ?auto_182155 ) ) ( not ( = ?auto_182152 ?auto_182155 ) ) ( ON ?auto_182151 ?auto_182152 ) ( ON-TABLE ?auto_182153 ) ( ON ?auto_182154 ?auto_182153 ) ( ON ?auto_182155 ?auto_182154 ) ( not ( = ?auto_182153 ?auto_182154 ) ) ( not ( = ?auto_182153 ?auto_182155 ) ) ( not ( = ?auto_182153 ?auto_182152 ) ) ( not ( = ?auto_182153 ?auto_182151 ) ) ( not ( = ?auto_182154 ?auto_182155 ) ) ( not ( = ?auto_182154 ?auto_182152 ) ) ( not ( = ?auto_182154 ?auto_182151 ) ) ( not ( = ?auto_182148 ?auto_182153 ) ) ( not ( = ?auto_182148 ?auto_182154 ) ) ( not ( = ?auto_182149 ?auto_182153 ) ) ( not ( = ?auto_182149 ?auto_182154 ) ) ( not ( = ?auto_182150 ?auto_182153 ) ) ( not ( = ?auto_182150 ?auto_182154 ) ) ( ON ?auto_182150 ?auto_182151 ) ( ON ?auto_182149 ?auto_182150 ) ( CLEAR ?auto_182149 ) ( ON ?auto_182148 ?auto_182156 ) ( CLEAR ?auto_182148 ) ( HAND-EMPTY ) ( not ( = ?auto_182148 ?auto_182156 ) ) ( not ( = ?auto_182149 ?auto_182156 ) ) ( not ( = ?auto_182150 ?auto_182156 ) ) ( not ( = ?auto_182151 ?auto_182156 ) ) ( not ( = ?auto_182152 ?auto_182156 ) ) ( not ( = ?auto_182155 ?auto_182156 ) ) ( not ( = ?auto_182153 ?auto_182156 ) ) ( not ( = ?auto_182154 ?auto_182156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182148 ?auto_182156 )
      ( MAKE-5PILE ?auto_182148 ?auto_182149 ?auto_182150 ?auto_182151 ?auto_182152 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182157 - BLOCK
      ?auto_182158 - BLOCK
      ?auto_182159 - BLOCK
      ?auto_182160 - BLOCK
      ?auto_182161 - BLOCK
    )
    :vars
    (
      ?auto_182165 - BLOCK
      ?auto_182164 - BLOCK
      ?auto_182162 - BLOCK
      ?auto_182163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182157 ?auto_182158 ) ) ( not ( = ?auto_182157 ?auto_182159 ) ) ( not ( = ?auto_182157 ?auto_182160 ) ) ( not ( = ?auto_182157 ?auto_182161 ) ) ( not ( = ?auto_182158 ?auto_182159 ) ) ( not ( = ?auto_182158 ?auto_182160 ) ) ( not ( = ?auto_182158 ?auto_182161 ) ) ( not ( = ?auto_182159 ?auto_182160 ) ) ( not ( = ?auto_182159 ?auto_182161 ) ) ( not ( = ?auto_182160 ?auto_182161 ) ) ( ON ?auto_182161 ?auto_182165 ) ( not ( = ?auto_182157 ?auto_182165 ) ) ( not ( = ?auto_182158 ?auto_182165 ) ) ( not ( = ?auto_182159 ?auto_182165 ) ) ( not ( = ?auto_182160 ?auto_182165 ) ) ( not ( = ?auto_182161 ?auto_182165 ) ) ( ON ?auto_182160 ?auto_182161 ) ( ON-TABLE ?auto_182164 ) ( ON ?auto_182162 ?auto_182164 ) ( ON ?auto_182165 ?auto_182162 ) ( not ( = ?auto_182164 ?auto_182162 ) ) ( not ( = ?auto_182164 ?auto_182165 ) ) ( not ( = ?auto_182164 ?auto_182161 ) ) ( not ( = ?auto_182164 ?auto_182160 ) ) ( not ( = ?auto_182162 ?auto_182165 ) ) ( not ( = ?auto_182162 ?auto_182161 ) ) ( not ( = ?auto_182162 ?auto_182160 ) ) ( not ( = ?auto_182157 ?auto_182164 ) ) ( not ( = ?auto_182157 ?auto_182162 ) ) ( not ( = ?auto_182158 ?auto_182164 ) ) ( not ( = ?auto_182158 ?auto_182162 ) ) ( not ( = ?auto_182159 ?auto_182164 ) ) ( not ( = ?auto_182159 ?auto_182162 ) ) ( ON ?auto_182159 ?auto_182160 ) ( ON ?auto_182157 ?auto_182163 ) ( CLEAR ?auto_182157 ) ( not ( = ?auto_182157 ?auto_182163 ) ) ( not ( = ?auto_182158 ?auto_182163 ) ) ( not ( = ?auto_182159 ?auto_182163 ) ) ( not ( = ?auto_182160 ?auto_182163 ) ) ( not ( = ?auto_182161 ?auto_182163 ) ) ( not ( = ?auto_182165 ?auto_182163 ) ) ( not ( = ?auto_182164 ?auto_182163 ) ) ( not ( = ?auto_182162 ?auto_182163 ) ) ( HOLDING ?auto_182158 ) ( CLEAR ?auto_182159 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182164 ?auto_182162 ?auto_182165 ?auto_182161 ?auto_182160 ?auto_182159 ?auto_182158 )
      ( MAKE-5PILE ?auto_182157 ?auto_182158 ?auto_182159 ?auto_182160 ?auto_182161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182166 - BLOCK
      ?auto_182167 - BLOCK
      ?auto_182168 - BLOCK
      ?auto_182169 - BLOCK
      ?auto_182170 - BLOCK
    )
    :vars
    (
      ?auto_182172 - BLOCK
      ?auto_182171 - BLOCK
      ?auto_182173 - BLOCK
      ?auto_182174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182166 ?auto_182167 ) ) ( not ( = ?auto_182166 ?auto_182168 ) ) ( not ( = ?auto_182166 ?auto_182169 ) ) ( not ( = ?auto_182166 ?auto_182170 ) ) ( not ( = ?auto_182167 ?auto_182168 ) ) ( not ( = ?auto_182167 ?auto_182169 ) ) ( not ( = ?auto_182167 ?auto_182170 ) ) ( not ( = ?auto_182168 ?auto_182169 ) ) ( not ( = ?auto_182168 ?auto_182170 ) ) ( not ( = ?auto_182169 ?auto_182170 ) ) ( ON ?auto_182170 ?auto_182172 ) ( not ( = ?auto_182166 ?auto_182172 ) ) ( not ( = ?auto_182167 ?auto_182172 ) ) ( not ( = ?auto_182168 ?auto_182172 ) ) ( not ( = ?auto_182169 ?auto_182172 ) ) ( not ( = ?auto_182170 ?auto_182172 ) ) ( ON ?auto_182169 ?auto_182170 ) ( ON-TABLE ?auto_182171 ) ( ON ?auto_182173 ?auto_182171 ) ( ON ?auto_182172 ?auto_182173 ) ( not ( = ?auto_182171 ?auto_182173 ) ) ( not ( = ?auto_182171 ?auto_182172 ) ) ( not ( = ?auto_182171 ?auto_182170 ) ) ( not ( = ?auto_182171 ?auto_182169 ) ) ( not ( = ?auto_182173 ?auto_182172 ) ) ( not ( = ?auto_182173 ?auto_182170 ) ) ( not ( = ?auto_182173 ?auto_182169 ) ) ( not ( = ?auto_182166 ?auto_182171 ) ) ( not ( = ?auto_182166 ?auto_182173 ) ) ( not ( = ?auto_182167 ?auto_182171 ) ) ( not ( = ?auto_182167 ?auto_182173 ) ) ( not ( = ?auto_182168 ?auto_182171 ) ) ( not ( = ?auto_182168 ?auto_182173 ) ) ( ON ?auto_182168 ?auto_182169 ) ( ON ?auto_182166 ?auto_182174 ) ( not ( = ?auto_182166 ?auto_182174 ) ) ( not ( = ?auto_182167 ?auto_182174 ) ) ( not ( = ?auto_182168 ?auto_182174 ) ) ( not ( = ?auto_182169 ?auto_182174 ) ) ( not ( = ?auto_182170 ?auto_182174 ) ) ( not ( = ?auto_182172 ?auto_182174 ) ) ( not ( = ?auto_182171 ?auto_182174 ) ) ( not ( = ?auto_182173 ?auto_182174 ) ) ( CLEAR ?auto_182168 ) ( ON ?auto_182167 ?auto_182166 ) ( CLEAR ?auto_182167 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182174 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182174 ?auto_182166 )
      ( MAKE-5PILE ?auto_182166 ?auto_182167 ?auto_182168 ?auto_182169 ?auto_182170 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182175 - BLOCK
      ?auto_182176 - BLOCK
      ?auto_182177 - BLOCK
      ?auto_182178 - BLOCK
      ?auto_182179 - BLOCK
    )
    :vars
    (
      ?auto_182180 - BLOCK
      ?auto_182182 - BLOCK
      ?auto_182183 - BLOCK
      ?auto_182181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182175 ?auto_182176 ) ) ( not ( = ?auto_182175 ?auto_182177 ) ) ( not ( = ?auto_182175 ?auto_182178 ) ) ( not ( = ?auto_182175 ?auto_182179 ) ) ( not ( = ?auto_182176 ?auto_182177 ) ) ( not ( = ?auto_182176 ?auto_182178 ) ) ( not ( = ?auto_182176 ?auto_182179 ) ) ( not ( = ?auto_182177 ?auto_182178 ) ) ( not ( = ?auto_182177 ?auto_182179 ) ) ( not ( = ?auto_182178 ?auto_182179 ) ) ( ON ?auto_182179 ?auto_182180 ) ( not ( = ?auto_182175 ?auto_182180 ) ) ( not ( = ?auto_182176 ?auto_182180 ) ) ( not ( = ?auto_182177 ?auto_182180 ) ) ( not ( = ?auto_182178 ?auto_182180 ) ) ( not ( = ?auto_182179 ?auto_182180 ) ) ( ON ?auto_182178 ?auto_182179 ) ( ON-TABLE ?auto_182182 ) ( ON ?auto_182183 ?auto_182182 ) ( ON ?auto_182180 ?auto_182183 ) ( not ( = ?auto_182182 ?auto_182183 ) ) ( not ( = ?auto_182182 ?auto_182180 ) ) ( not ( = ?auto_182182 ?auto_182179 ) ) ( not ( = ?auto_182182 ?auto_182178 ) ) ( not ( = ?auto_182183 ?auto_182180 ) ) ( not ( = ?auto_182183 ?auto_182179 ) ) ( not ( = ?auto_182183 ?auto_182178 ) ) ( not ( = ?auto_182175 ?auto_182182 ) ) ( not ( = ?auto_182175 ?auto_182183 ) ) ( not ( = ?auto_182176 ?auto_182182 ) ) ( not ( = ?auto_182176 ?auto_182183 ) ) ( not ( = ?auto_182177 ?auto_182182 ) ) ( not ( = ?auto_182177 ?auto_182183 ) ) ( ON ?auto_182175 ?auto_182181 ) ( not ( = ?auto_182175 ?auto_182181 ) ) ( not ( = ?auto_182176 ?auto_182181 ) ) ( not ( = ?auto_182177 ?auto_182181 ) ) ( not ( = ?auto_182178 ?auto_182181 ) ) ( not ( = ?auto_182179 ?auto_182181 ) ) ( not ( = ?auto_182180 ?auto_182181 ) ) ( not ( = ?auto_182182 ?auto_182181 ) ) ( not ( = ?auto_182183 ?auto_182181 ) ) ( ON ?auto_182176 ?auto_182175 ) ( CLEAR ?auto_182176 ) ( ON-TABLE ?auto_182181 ) ( HOLDING ?auto_182177 ) ( CLEAR ?auto_182178 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182182 ?auto_182183 ?auto_182180 ?auto_182179 ?auto_182178 ?auto_182177 )
      ( MAKE-5PILE ?auto_182175 ?auto_182176 ?auto_182177 ?auto_182178 ?auto_182179 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182184 - BLOCK
      ?auto_182185 - BLOCK
      ?auto_182186 - BLOCK
      ?auto_182187 - BLOCK
      ?auto_182188 - BLOCK
    )
    :vars
    (
      ?auto_182192 - BLOCK
      ?auto_182190 - BLOCK
      ?auto_182191 - BLOCK
      ?auto_182189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182184 ?auto_182185 ) ) ( not ( = ?auto_182184 ?auto_182186 ) ) ( not ( = ?auto_182184 ?auto_182187 ) ) ( not ( = ?auto_182184 ?auto_182188 ) ) ( not ( = ?auto_182185 ?auto_182186 ) ) ( not ( = ?auto_182185 ?auto_182187 ) ) ( not ( = ?auto_182185 ?auto_182188 ) ) ( not ( = ?auto_182186 ?auto_182187 ) ) ( not ( = ?auto_182186 ?auto_182188 ) ) ( not ( = ?auto_182187 ?auto_182188 ) ) ( ON ?auto_182188 ?auto_182192 ) ( not ( = ?auto_182184 ?auto_182192 ) ) ( not ( = ?auto_182185 ?auto_182192 ) ) ( not ( = ?auto_182186 ?auto_182192 ) ) ( not ( = ?auto_182187 ?auto_182192 ) ) ( not ( = ?auto_182188 ?auto_182192 ) ) ( ON ?auto_182187 ?auto_182188 ) ( ON-TABLE ?auto_182190 ) ( ON ?auto_182191 ?auto_182190 ) ( ON ?auto_182192 ?auto_182191 ) ( not ( = ?auto_182190 ?auto_182191 ) ) ( not ( = ?auto_182190 ?auto_182192 ) ) ( not ( = ?auto_182190 ?auto_182188 ) ) ( not ( = ?auto_182190 ?auto_182187 ) ) ( not ( = ?auto_182191 ?auto_182192 ) ) ( not ( = ?auto_182191 ?auto_182188 ) ) ( not ( = ?auto_182191 ?auto_182187 ) ) ( not ( = ?auto_182184 ?auto_182190 ) ) ( not ( = ?auto_182184 ?auto_182191 ) ) ( not ( = ?auto_182185 ?auto_182190 ) ) ( not ( = ?auto_182185 ?auto_182191 ) ) ( not ( = ?auto_182186 ?auto_182190 ) ) ( not ( = ?auto_182186 ?auto_182191 ) ) ( ON ?auto_182184 ?auto_182189 ) ( not ( = ?auto_182184 ?auto_182189 ) ) ( not ( = ?auto_182185 ?auto_182189 ) ) ( not ( = ?auto_182186 ?auto_182189 ) ) ( not ( = ?auto_182187 ?auto_182189 ) ) ( not ( = ?auto_182188 ?auto_182189 ) ) ( not ( = ?auto_182192 ?auto_182189 ) ) ( not ( = ?auto_182190 ?auto_182189 ) ) ( not ( = ?auto_182191 ?auto_182189 ) ) ( ON ?auto_182185 ?auto_182184 ) ( ON-TABLE ?auto_182189 ) ( CLEAR ?auto_182187 ) ( ON ?auto_182186 ?auto_182185 ) ( CLEAR ?auto_182186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182189 ?auto_182184 ?auto_182185 )
      ( MAKE-5PILE ?auto_182184 ?auto_182185 ?auto_182186 ?auto_182187 ?auto_182188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182193 - BLOCK
      ?auto_182194 - BLOCK
      ?auto_182195 - BLOCK
      ?auto_182196 - BLOCK
      ?auto_182197 - BLOCK
    )
    :vars
    (
      ?auto_182201 - BLOCK
      ?auto_182198 - BLOCK
      ?auto_182200 - BLOCK
      ?auto_182199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182193 ?auto_182194 ) ) ( not ( = ?auto_182193 ?auto_182195 ) ) ( not ( = ?auto_182193 ?auto_182196 ) ) ( not ( = ?auto_182193 ?auto_182197 ) ) ( not ( = ?auto_182194 ?auto_182195 ) ) ( not ( = ?auto_182194 ?auto_182196 ) ) ( not ( = ?auto_182194 ?auto_182197 ) ) ( not ( = ?auto_182195 ?auto_182196 ) ) ( not ( = ?auto_182195 ?auto_182197 ) ) ( not ( = ?auto_182196 ?auto_182197 ) ) ( ON ?auto_182197 ?auto_182201 ) ( not ( = ?auto_182193 ?auto_182201 ) ) ( not ( = ?auto_182194 ?auto_182201 ) ) ( not ( = ?auto_182195 ?auto_182201 ) ) ( not ( = ?auto_182196 ?auto_182201 ) ) ( not ( = ?auto_182197 ?auto_182201 ) ) ( ON-TABLE ?auto_182198 ) ( ON ?auto_182200 ?auto_182198 ) ( ON ?auto_182201 ?auto_182200 ) ( not ( = ?auto_182198 ?auto_182200 ) ) ( not ( = ?auto_182198 ?auto_182201 ) ) ( not ( = ?auto_182198 ?auto_182197 ) ) ( not ( = ?auto_182198 ?auto_182196 ) ) ( not ( = ?auto_182200 ?auto_182201 ) ) ( not ( = ?auto_182200 ?auto_182197 ) ) ( not ( = ?auto_182200 ?auto_182196 ) ) ( not ( = ?auto_182193 ?auto_182198 ) ) ( not ( = ?auto_182193 ?auto_182200 ) ) ( not ( = ?auto_182194 ?auto_182198 ) ) ( not ( = ?auto_182194 ?auto_182200 ) ) ( not ( = ?auto_182195 ?auto_182198 ) ) ( not ( = ?auto_182195 ?auto_182200 ) ) ( ON ?auto_182193 ?auto_182199 ) ( not ( = ?auto_182193 ?auto_182199 ) ) ( not ( = ?auto_182194 ?auto_182199 ) ) ( not ( = ?auto_182195 ?auto_182199 ) ) ( not ( = ?auto_182196 ?auto_182199 ) ) ( not ( = ?auto_182197 ?auto_182199 ) ) ( not ( = ?auto_182201 ?auto_182199 ) ) ( not ( = ?auto_182198 ?auto_182199 ) ) ( not ( = ?auto_182200 ?auto_182199 ) ) ( ON ?auto_182194 ?auto_182193 ) ( ON-TABLE ?auto_182199 ) ( ON ?auto_182195 ?auto_182194 ) ( CLEAR ?auto_182195 ) ( HOLDING ?auto_182196 ) ( CLEAR ?auto_182197 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182198 ?auto_182200 ?auto_182201 ?auto_182197 ?auto_182196 )
      ( MAKE-5PILE ?auto_182193 ?auto_182194 ?auto_182195 ?auto_182196 ?auto_182197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182202 - BLOCK
      ?auto_182203 - BLOCK
      ?auto_182204 - BLOCK
      ?auto_182205 - BLOCK
      ?auto_182206 - BLOCK
    )
    :vars
    (
      ?auto_182207 - BLOCK
      ?auto_182208 - BLOCK
      ?auto_182209 - BLOCK
      ?auto_182210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182202 ?auto_182203 ) ) ( not ( = ?auto_182202 ?auto_182204 ) ) ( not ( = ?auto_182202 ?auto_182205 ) ) ( not ( = ?auto_182202 ?auto_182206 ) ) ( not ( = ?auto_182203 ?auto_182204 ) ) ( not ( = ?auto_182203 ?auto_182205 ) ) ( not ( = ?auto_182203 ?auto_182206 ) ) ( not ( = ?auto_182204 ?auto_182205 ) ) ( not ( = ?auto_182204 ?auto_182206 ) ) ( not ( = ?auto_182205 ?auto_182206 ) ) ( ON ?auto_182206 ?auto_182207 ) ( not ( = ?auto_182202 ?auto_182207 ) ) ( not ( = ?auto_182203 ?auto_182207 ) ) ( not ( = ?auto_182204 ?auto_182207 ) ) ( not ( = ?auto_182205 ?auto_182207 ) ) ( not ( = ?auto_182206 ?auto_182207 ) ) ( ON-TABLE ?auto_182208 ) ( ON ?auto_182209 ?auto_182208 ) ( ON ?auto_182207 ?auto_182209 ) ( not ( = ?auto_182208 ?auto_182209 ) ) ( not ( = ?auto_182208 ?auto_182207 ) ) ( not ( = ?auto_182208 ?auto_182206 ) ) ( not ( = ?auto_182208 ?auto_182205 ) ) ( not ( = ?auto_182209 ?auto_182207 ) ) ( not ( = ?auto_182209 ?auto_182206 ) ) ( not ( = ?auto_182209 ?auto_182205 ) ) ( not ( = ?auto_182202 ?auto_182208 ) ) ( not ( = ?auto_182202 ?auto_182209 ) ) ( not ( = ?auto_182203 ?auto_182208 ) ) ( not ( = ?auto_182203 ?auto_182209 ) ) ( not ( = ?auto_182204 ?auto_182208 ) ) ( not ( = ?auto_182204 ?auto_182209 ) ) ( ON ?auto_182202 ?auto_182210 ) ( not ( = ?auto_182202 ?auto_182210 ) ) ( not ( = ?auto_182203 ?auto_182210 ) ) ( not ( = ?auto_182204 ?auto_182210 ) ) ( not ( = ?auto_182205 ?auto_182210 ) ) ( not ( = ?auto_182206 ?auto_182210 ) ) ( not ( = ?auto_182207 ?auto_182210 ) ) ( not ( = ?auto_182208 ?auto_182210 ) ) ( not ( = ?auto_182209 ?auto_182210 ) ) ( ON ?auto_182203 ?auto_182202 ) ( ON-TABLE ?auto_182210 ) ( ON ?auto_182204 ?auto_182203 ) ( CLEAR ?auto_182206 ) ( ON ?auto_182205 ?auto_182204 ) ( CLEAR ?auto_182205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182210 ?auto_182202 ?auto_182203 ?auto_182204 )
      ( MAKE-5PILE ?auto_182202 ?auto_182203 ?auto_182204 ?auto_182205 ?auto_182206 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182211 - BLOCK
      ?auto_182212 - BLOCK
      ?auto_182213 - BLOCK
      ?auto_182214 - BLOCK
      ?auto_182215 - BLOCK
    )
    :vars
    (
      ?auto_182219 - BLOCK
      ?auto_182216 - BLOCK
      ?auto_182217 - BLOCK
      ?auto_182218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182211 ?auto_182212 ) ) ( not ( = ?auto_182211 ?auto_182213 ) ) ( not ( = ?auto_182211 ?auto_182214 ) ) ( not ( = ?auto_182211 ?auto_182215 ) ) ( not ( = ?auto_182212 ?auto_182213 ) ) ( not ( = ?auto_182212 ?auto_182214 ) ) ( not ( = ?auto_182212 ?auto_182215 ) ) ( not ( = ?auto_182213 ?auto_182214 ) ) ( not ( = ?auto_182213 ?auto_182215 ) ) ( not ( = ?auto_182214 ?auto_182215 ) ) ( not ( = ?auto_182211 ?auto_182219 ) ) ( not ( = ?auto_182212 ?auto_182219 ) ) ( not ( = ?auto_182213 ?auto_182219 ) ) ( not ( = ?auto_182214 ?auto_182219 ) ) ( not ( = ?auto_182215 ?auto_182219 ) ) ( ON-TABLE ?auto_182216 ) ( ON ?auto_182217 ?auto_182216 ) ( ON ?auto_182219 ?auto_182217 ) ( not ( = ?auto_182216 ?auto_182217 ) ) ( not ( = ?auto_182216 ?auto_182219 ) ) ( not ( = ?auto_182216 ?auto_182215 ) ) ( not ( = ?auto_182216 ?auto_182214 ) ) ( not ( = ?auto_182217 ?auto_182219 ) ) ( not ( = ?auto_182217 ?auto_182215 ) ) ( not ( = ?auto_182217 ?auto_182214 ) ) ( not ( = ?auto_182211 ?auto_182216 ) ) ( not ( = ?auto_182211 ?auto_182217 ) ) ( not ( = ?auto_182212 ?auto_182216 ) ) ( not ( = ?auto_182212 ?auto_182217 ) ) ( not ( = ?auto_182213 ?auto_182216 ) ) ( not ( = ?auto_182213 ?auto_182217 ) ) ( ON ?auto_182211 ?auto_182218 ) ( not ( = ?auto_182211 ?auto_182218 ) ) ( not ( = ?auto_182212 ?auto_182218 ) ) ( not ( = ?auto_182213 ?auto_182218 ) ) ( not ( = ?auto_182214 ?auto_182218 ) ) ( not ( = ?auto_182215 ?auto_182218 ) ) ( not ( = ?auto_182219 ?auto_182218 ) ) ( not ( = ?auto_182216 ?auto_182218 ) ) ( not ( = ?auto_182217 ?auto_182218 ) ) ( ON ?auto_182212 ?auto_182211 ) ( ON-TABLE ?auto_182218 ) ( ON ?auto_182213 ?auto_182212 ) ( ON ?auto_182214 ?auto_182213 ) ( CLEAR ?auto_182214 ) ( HOLDING ?auto_182215 ) ( CLEAR ?auto_182219 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182216 ?auto_182217 ?auto_182219 ?auto_182215 )
      ( MAKE-5PILE ?auto_182211 ?auto_182212 ?auto_182213 ?auto_182214 ?auto_182215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182220 - BLOCK
      ?auto_182221 - BLOCK
      ?auto_182222 - BLOCK
      ?auto_182223 - BLOCK
      ?auto_182224 - BLOCK
    )
    :vars
    (
      ?auto_182226 - BLOCK
      ?auto_182227 - BLOCK
      ?auto_182225 - BLOCK
      ?auto_182228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182220 ?auto_182221 ) ) ( not ( = ?auto_182220 ?auto_182222 ) ) ( not ( = ?auto_182220 ?auto_182223 ) ) ( not ( = ?auto_182220 ?auto_182224 ) ) ( not ( = ?auto_182221 ?auto_182222 ) ) ( not ( = ?auto_182221 ?auto_182223 ) ) ( not ( = ?auto_182221 ?auto_182224 ) ) ( not ( = ?auto_182222 ?auto_182223 ) ) ( not ( = ?auto_182222 ?auto_182224 ) ) ( not ( = ?auto_182223 ?auto_182224 ) ) ( not ( = ?auto_182220 ?auto_182226 ) ) ( not ( = ?auto_182221 ?auto_182226 ) ) ( not ( = ?auto_182222 ?auto_182226 ) ) ( not ( = ?auto_182223 ?auto_182226 ) ) ( not ( = ?auto_182224 ?auto_182226 ) ) ( ON-TABLE ?auto_182227 ) ( ON ?auto_182225 ?auto_182227 ) ( ON ?auto_182226 ?auto_182225 ) ( not ( = ?auto_182227 ?auto_182225 ) ) ( not ( = ?auto_182227 ?auto_182226 ) ) ( not ( = ?auto_182227 ?auto_182224 ) ) ( not ( = ?auto_182227 ?auto_182223 ) ) ( not ( = ?auto_182225 ?auto_182226 ) ) ( not ( = ?auto_182225 ?auto_182224 ) ) ( not ( = ?auto_182225 ?auto_182223 ) ) ( not ( = ?auto_182220 ?auto_182227 ) ) ( not ( = ?auto_182220 ?auto_182225 ) ) ( not ( = ?auto_182221 ?auto_182227 ) ) ( not ( = ?auto_182221 ?auto_182225 ) ) ( not ( = ?auto_182222 ?auto_182227 ) ) ( not ( = ?auto_182222 ?auto_182225 ) ) ( ON ?auto_182220 ?auto_182228 ) ( not ( = ?auto_182220 ?auto_182228 ) ) ( not ( = ?auto_182221 ?auto_182228 ) ) ( not ( = ?auto_182222 ?auto_182228 ) ) ( not ( = ?auto_182223 ?auto_182228 ) ) ( not ( = ?auto_182224 ?auto_182228 ) ) ( not ( = ?auto_182226 ?auto_182228 ) ) ( not ( = ?auto_182227 ?auto_182228 ) ) ( not ( = ?auto_182225 ?auto_182228 ) ) ( ON ?auto_182221 ?auto_182220 ) ( ON-TABLE ?auto_182228 ) ( ON ?auto_182222 ?auto_182221 ) ( ON ?auto_182223 ?auto_182222 ) ( CLEAR ?auto_182226 ) ( ON ?auto_182224 ?auto_182223 ) ( CLEAR ?auto_182224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182228 ?auto_182220 ?auto_182221 ?auto_182222 ?auto_182223 )
      ( MAKE-5PILE ?auto_182220 ?auto_182221 ?auto_182222 ?auto_182223 ?auto_182224 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182229 - BLOCK
      ?auto_182230 - BLOCK
      ?auto_182231 - BLOCK
      ?auto_182232 - BLOCK
      ?auto_182233 - BLOCK
    )
    :vars
    (
      ?auto_182235 - BLOCK
      ?auto_182236 - BLOCK
      ?auto_182234 - BLOCK
      ?auto_182237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182229 ?auto_182230 ) ) ( not ( = ?auto_182229 ?auto_182231 ) ) ( not ( = ?auto_182229 ?auto_182232 ) ) ( not ( = ?auto_182229 ?auto_182233 ) ) ( not ( = ?auto_182230 ?auto_182231 ) ) ( not ( = ?auto_182230 ?auto_182232 ) ) ( not ( = ?auto_182230 ?auto_182233 ) ) ( not ( = ?auto_182231 ?auto_182232 ) ) ( not ( = ?auto_182231 ?auto_182233 ) ) ( not ( = ?auto_182232 ?auto_182233 ) ) ( not ( = ?auto_182229 ?auto_182235 ) ) ( not ( = ?auto_182230 ?auto_182235 ) ) ( not ( = ?auto_182231 ?auto_182235 ) ) ( not ( = ?auto_182232 ?auto_182235 ) ) ( not ( = ?auto_182233 ?auto_182235 ) ) ( ON-TABLE ?auto_182236 ) ( ON ?auto_182234 ?auto_182236 ) ( not ( = ?auto_182236 ?auto_182234 ) ) ( not ( = ?auto_182236 ?auto_182235 ) ) ( not ( = ?auto_182236 ?auto_182233 ) ) ( not ( = ?auto_182236 ?auto_182232 ) ) ( not ( = ?auto_182234 ?auto_182235 ) ) ( not ( = ?auto_182234 ?auto_182233 ) ) ( not ( = ?auto_182234 ?auto_182232 ) ) ( not ( = ?auto_182229 ?auto_182236 ) ) ( not ( = ?auto_182229 ?auto_182234 ) ) ( not ( = ?auto_182230 ?auto_182236 ) ) ( not ( = ?auto_182230 ?auto_182234 ) ) ( not ( = ?auto_182231 ?auto_182236 ) ) ( not ( = ?auto_182231 ?auto_182234 ) ) ( ON ?auto_182229 ?auto_182237 ) ( not ( = ?auto_182229 ?auto_182237 ) ) ( not ( = ?auto_182230 ?auto_182237 ) ) ( not ( = ?auto_182231 ?auto_182237 ) ) ( not ( = ?auto_182232 ?auto_182237 ) ) ( not ( = ?auto_182233 ?auto_182237 ) ) ( not ( = ?auto_182235 ?auto_182237 ) ) ( not ( = ?auto_182236 ?auto_182237 ) ) ( not ( = ?auto_182234 ?auto_182237 ) ) ( ON ?auto_182230 ?auto_182229 ) ( ON-TABLE ?auto_182237 ) ( ON ?auto_182231 ?auto_182230 ) ( ON ?auto_182232 ?auto_182231 ) ( ON ?auto_182233 ?auto_182232 ) ( CLEAR ?auto_182233 ) ( HOLDING ?auto_182235 ) ( CLEAR ?auto_182234 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182236 ?auto_182234 ?auto_182235 )
      ( MAKE-5PILE ?auto_182229 ?auto_182230 ?auto_182231 ?auto_182232 ?auto_182233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182238 - BLOCK
      ?auto_182239 - BLOCK
      ?auto_182240 - BLOCK
      ?auto_182241 - BLOCK
      ?auto_182242 - BLOCK
    )
    :vars
    (
      ?auto_182243 - BLOCK
      ?auto_182245 - BLOCK
      ?auto_182244 - BLOCK
      ?auto_182246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182238 ?auto_182239 ) ) ( not ( = ?auto_182238 ?auto_182240 ) ) ( not ( = ?auto_182238 ?auto_182241 ) ) ( not ( = ?auto_182238 ?auto_182242 ) ) ( not ( = ?auto_182239 ?auto_182240 ) ) ( not ( = ?auto_182239 ?auto_182241 ) ) ( not ( = ?auto_182239 ?auto_182242 ) ) ( not ( = ?auto_182240 ?auto_182241 ) ) ( not ( = ?auto_182240 ?auto_182242 ) ) ( not ( = ?auto_182241 ?auto_182242 ) ) ( not ( = ?auto_182238 ?auto_182243 ) ) ( not ( = ?auto_182239 ?auto_182243 ) ) ( not ( = ?auto_182240 ?auto_182243 ) ) ( not ( = ?auto_182241 ?auto_182243 ) ) ( not ( = ?auto_182242 ?auto_182243 ) ) ( ON-TABLE ?auto_182245 ) ( ON ?auto_182244 ?auto_182245 ) ( not ( = ?auto_182245 ?auto_182244 ) ) ( not ( = ?auto_182245 ?auto_182243 ) ) ( not ( = ?auto_182245 ?auto_182242 ) ) ( not ( = ?auto_182245 ?auto_182241 ) ) ( not ( = ?auto_182244 ?auto_182243 ) ) ( not ( = ?auto_182244 ?auto_182242 ) ) ( not ( = ?auto_182244 ?auto_182241 ) ) ( not ( = ?auto_182238 ?auto_182245 ) ) ( not ( = ?auto_182238 ?auto_182244 ) ) ( not ( = ?auto_182239 ?auto_182245 ) ) ( not ( = ?auto_182239 ?auto_182244 ) ) ( not ( = ?auto_182240 ?auto_182245 ) ) ( not ( = ?auto_182240 ?auto_182244 ) ) ( ON ?auto_182238 ?auto_182246 ) ( not ( = ?auto_182238 ?auto_182246 ) ) ( not ( = ?auto_182239 ?auto_182246 ) ) ( not ( = ?auto_182240 ?auto_182246 ) ) ( not ( = ?auto_182241 ?auto_182246 ) ) ( not ( = ?auto_182242 ?auto_182246 ) ) ( not ( = ?auto_182243 ?auto_182246 ) ) ( not ( = ?auto_182245 ?auto_182246 ) ) ( not ( = ?auto_182244 ?auto_182246 ) ) ( ON ?auto_182239 ?auto_182238 ) ( ON-TABLE ?auto_182246 ) ( ON ?auto_182240 ?auto_182239 ) ( ON ?auto_182241 ?auto_182240 ) ( ON ?auto_182242 ?auto_182241 ) ( CLEAR ?auto_182244 ) ( ON ?auto_182243 ?auto_182242 ) ( CLEAR ?auto_182243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182246 ?auto_182238 ?auto_182239 ?auto_182240 ?auto_182241 ?auto_182242 )
      ( MAKE-5PILE ?auto_182238 ?auto_182239 ?auto_182240 ?auto_182241 ?auto_182242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182247 - BLOCK
      ?auto_182248 - BLOCK
      ?auto_182249 - BLOCK
      ?auto_182250 - BLOCK
      ?auto_182251 - BLOCK
    )
    :vars
    (
      ?auto_182253 - BLOCK
      ?auto_182255 - BLOCK
      ?auto_182254 - BLOCK
      ?auto_182252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182247 ?auto_182248 ) ) ( not ( = ?auto_182247 ?auto_182249 ) ) ( not ( = ?auto_182247 ?auto_182250 ) ) ( not ( = ?auto_182247 ?auto_182251 ) ) ( not ( = ?auto_182248 ?auto_182249 ) ) ( not ( = ?auto_182248 ?auto_182250 ) ) ( not ( = ?auto_182248 ?auto_182251 ) ) ( not ( = ?auto_182249 ?auto_182250 ) ) ( not ( = ?auto_182249 ?auto_182251 ) ) ( not ( = ?auto_182250 ?auto_182251 ) ) ( not ( = ?auto_182247 ?auto_182253 ) ) ( not ( = ?auto_182248 ?auto_182253 ) ) ( not ( = ?auto_182249 ?auto_182253 ) ) ( not ( = ?auto_182250 ?auto_182253 ) ) ( not ( = ?auto_182251 ?auto_182253 ) ) ( ON-TABLE ?auto_182255 ) ( not ( = ?auto_182255 ?auto_182254 ) ) ( not ( = ?auto_182255 ?auto_182253 ) ) ( not ( = ?auto_182255 ?auto_182251 ) ) ( not ( = ?auto_182255 ?auto_182250 ) ) ( not ( = ?auto_182254 ?auto_182253 ) ) ( not ( = ?auto_182254 ?auto_182251 ) ) ( not ( = ?auto_182254 ?auto_182250 ) ) ( not ( = ?auto_182247 ?auto_182255 ) ) ( not ( = ?auto_182247 ?auto_182254 ) ) ( not ( = ?auto_182248 ?auto_182255 ) ) ( not ( = ?auto_182248 ?auto_182254 ) ) ( not ( = ?auto_182249 ?auto_182255 ) ) ( not ( = ?auto_182249 ?auto_182254 ) ) ( ON ?auto_182247 ?auto_182252 ) ( not ( = ?auto_182247 ?auto_182252 ) ) ( not ( = ?auto_182248 ?auto_182252 ) ) ( not ( = ?auto_182249 ?auto_182252 ) ) ( not ( = ?auto_182250 ?auto_182252 ) ) ( not ( = ?auto_182251 ?auto_182252 ) ) ( not ( = ?auto_182253 ?auto_182252 ) ) ( not ( = ?auto_182255 ?auto_182252 ) ) ( not ( = ?auto_182254 ?auto_182252 ) ) ( ON ?auto_182248 ?auto_182247 ) ( ON-TABLE ?auto_182252 ) ( ON ?auto_182249 ?auto_182248 ) ( ON ?auto_182250 ?auto_182249 ) ( ON ?auto_182251 ?auto_182250 ) ( ON ?auto_182253 ?auto_182251 ) ( CLEAR ?auto_182253 ) ( HOLDING ?auto_182254 ) ( CLEAR ?auto_182255 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182255 ?auto_182254 )
      ( MAKE-5PILE ?auto_182247 ?auto_182248 ?auto_182249 ?auto_182250 ?auto_182251 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182256 - BLOCK
      ?auto_182257 - BLOCK
      ?auto_182258 - BLOCK
      ?auto_182259 - BLOCK
      ?auto_182260 - BLOCK
    )
    :vars
    (
      ?auto_182261 - BLOCK
      ?auto_182262 - BLOCK
      ?auto_182264 - BLOCK
      ?auto_182263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182256 ?auto_182257 ) ) ( not ( = ?auto_182256 ?auto_182258 ) ) ( not ( = ?auto_182256 ?auto_182259 ) ) ( not ( = ?auto_182256 ?auto_182260 ) ) ( not ( = ?auto_182257 ?auto_182258 ) ) ( not ( = ?auto_182257 ?auto_182259 ) ) ( not ( = ?auto_182257 ?auto_182260 ) ) ( not ( = ?auto_182258 ?auto_182259 ) ) ( not ( = ?auto_182258 ?auto_182260 ) ) ( not ( = ?auto_182259 ?auto_182260 ) ) ( not ( = ?auto_182256 ?auto_182261 ) ) ( not ( = ?auto_182257 ?auto_182261 ) ) ( not ( = ?auto_182258 ?auto_182261 ) ) ( not ( = ?auto_182259 ?auto_182261 ) ) ( not ( = ?auto_182260 ?auto_182261 ) ) ( ON-TABLE ?auto_182262 ) ( not ( = ?auto_182262 ?auto_182264 ) ) ( not ( = ?auto_182262 ?auto_182261 ) ) ( not ( = ?auto_182262 ?auto_182260 ) ) ( not ( = ?auto_182262 ?auto_182259 ) ) ( not ( = ?auto_182264 ?auto_182261 ) ) ( not ( = ?auto_182264 ?auto_182260 ) ) ( not ( = ?auto_182264 ?auto_182259 ) ) ( not ( = ?auto_182256 ?auto_182262 ) ) ( not ( = ?auto_182256 ?auto_182264 ) ) ( not ( = ?auto_182257 ?auto_182262 ) ) ( not ( = ?auto_182257 ?auto_182264 ) ) ( not ( = ?auto_182258 ?auto_182262 ) ) ( not ( = ?auto_182258 ?auto_182264 ) ) ( ON ?auto_182256 ?auto_182263 ) ( not ( = ?auto_182256 ?auto_182263 ) ) ( not ( = ?auto_182257 ?auto_182263 ) ) ( not ( = ?auto_182258 ?auto_182263 ) ) ( not ( = ?auto_182259 ?auto_182263 ) ) ( not ( = ?auto_182260 ?auto_182263 ) ) ( not ( = ?auto_182261 ?auto_182263 ) ) ( not ( = ?auto_182262 ?auto_182263 ) ) ( not ( = ?auto_182264 ?auto_182263 ) ) ( ON ?auto_182257 ?auto_182256 ) ( ON-TABLE ?auto_182263 ) ( ON ?auto_182258 ?auto_182257 ) ( ON ?auto_182259 ?auto_182258 ) ( ON ?auto_182260 ?auto_182259 ) ( ON ?auto_182261 ?auto_182260 ) ( CLEAR ?auto_182262 ) ( ON ?auto_182264 ?auto_182261 ) ( CLEAR ?auto_182264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182263 ?auto_182256 ?auto_182257 ?auto_182258 ?auto_182259 ?auto_182260 ?auto_182261 )
      ( MAKE-5PILE ?auto_182256 ?auto_182257 ?auto_182258 ?auto_182259 ?auto_182260 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182265 - BLOCK
      ?auto_182266 - BLOCK
      ?auto_182267 - BLOCK
      ?auto_182268 - BLOCK
      ?auto_182269 - BLOCK
    )
    :vars
    (
      ?auto_182270 - BLOCK
      ?auto_182271 - BLOCK
      ?auto_182273 - BLOCK
      ?auto_182272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182265 ?auto_182266 ) ) ( not ( = ?auto_182265 ?auto_182267 ) ) ( not ( = ?auto_182265 ?auto_182268 ) ) ( not ( = ?auto_182265 ?auto_182269 ) ) ( not ( = ?auto_182266 ?auto_182267 ) ) ( not ( = ?auto_182266 ?auto_182268 ) ) ( not ( = ?auto_182266 ?auto_182269 ) ) ( not ( = ?auto_182267 ?auto_182268 ) ) ( not ( = ?auto_182267 ?auto_182269 ) ) ( not ( = ?auto_182268 ?auto_182269 ) ) ( not ( = ?auto_182265 ?auto_182270 ) ) ( not ( = ?auto_182266 ?auto_182270 ) ) ( not ( = ?auto_182267 ?auto_182270 ) ) ( not ( = ?auto_182268 ?auto_182270 ) ) ( not ( = ?auto_182269 ?auto_182270 ) ) ( not ( = ?auto_182271 ?auto_182273 ) ) ( not ( = ?auto_182271 ?auto_182270 ) ) ( not ( = ?auto_182271 ?auto_182269 ) ) ( not ( = ?auto_182271 ?auto_182268 ) ) ( not ( = ?auto_182273 ?auto_182270 ) ) ( not ( = ?auto_182273 ?auto_182269 ) ) ( not ( = ?auto_182273 ?auto_182268 ) ) ( not ( = ?auto_182265 ?auto_182271 ) ) ( not ( = ?auto_182265 ?auto_182273 ) ) ( not ( = ?auto_182266 ?auto_182271 ) ) ( not ( = ?auto_182266 ?auto_182273 ) ) ( not ( = ?auto_182267 ?auto_182271 ) ) ( not ( = ?auto_182267 ?auto_182273 ) ) ( ON ?auto_182265 ?auto_182272 ) ( not ( = ?auto_182265 ?auto_182272 ) ) ( not ( = ?auto_182266 ?auto_182272 ) ) ( not ( = ?auto_182267 ?auto_182272 ) ) ( not ( = ?auto_182268 ?auto_182272 ) ) ( not ( = ?auto_182269 ?auto_182272 ) ) ( not ( = ?auto_182270 ?auto_182272 ) ) ( not ( = ?auto_182271 ?auto_182272 ) ) ( not ( = ?auto_182273 ?auto_182272 ) ) ( ON ?auto_182266 ?auto_182265 ) ( ON-TABLE ?auto_182272 ) ( ON ?auto_182267 ?auto_182266 ) ( ON ?auto_182268 ?auto_182267 ) ( ON ?auto_182269 ?auto_182268 ) ( ON ?auto_182270 ?auto_182269 ) ( ON ?auto_182273 ?auto_182270 ) ( CLEAR ?auto_182273 ) ( HOLDING ?auto_182271 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182271 )
      ( MAKE-5PILE ?auto_182265 ?auto_182266 ?auto_182267 ?auto_182268 ?auto_182269 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182274 - BLOCK
      ?auto_182275 - BLOCK
      ?auto_182276 - BLOCK
      ?auto_182277 - BLOCK
      ?auto_182278 - BLOCK
    )
    :vars
    (
      ?auto_182281 - BLOCK
      ?auto_182282 - BLOCK
      ?auto_182280 - BLOCK
      ?auto_182279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182274 ?auto_182275 ) ) ( not ( = ?auto_182274 ?auto_182276 ) ) ( not ( = ?auto_182274 ?auto_182277 ) ) ( not ( = ?auto_182274 ?auto_182278 ) ) ( not ( = ?auto_182275 ?auto_182276 ) ) ( not ( = ?auto_182275 ?auto_182277 ) ) ( not ( = ?auto_182275 ?auto_182278 ) ) ( not ( = ?auto_182276 ?auto_182277 ) ) ( not ( = ?auto_182276 ?auto_182278 ) ) ( not ( = ?auto_182277 ?auto_182278 ) ) ( not ( = ?auto_182274 ?auto_182281 ) ) ( not ( = ?auto_182275 ?auto_182281 ) ) ( not ( = ?auto_182276 ?auto_182281 ) ) ( not ( = ?auto_182277 ?auto_182281 ) ) ( not ( = ?auto_182278 ?auto_182281 ) ) ( not ( = ?auto_182282 ?auto_182280 ) ) ( not ( = ?auto_182282 ?auto_182281 ) ) ( not ( = ?auto_182282 ?auto_182278 ) ) ( not ( = ?auto_182282 ?auto_182277 ) ) ( not ( = ?auto_182280 ?auto_182281 ) ) ( not ( = ?auto_182280 ?auto_182278 ) ) ( not ( = ?auto_182280 ?auto_182277 ) ) ( not ( = ?auto_182274 ?auto_182282 ) ) ( not ( = ?auto_182274 ?auto_182280 ) ) ( not ( = ?auto_182275 ?auto_182282 ) ) ( not ( = ?auto_182275 ?auto_182280 ) ) ( not ( = ?auto_182276 ?auto_182282 ) ) ( not ( = ?auto_182276 ?auto_182280 ) ) ( ON ?auto_182274 ?auto_182279 ) ( not ( = ?auto_182274 ?auto_182279 ) ) ( not ( = ?auto_182275 ?auto_182279 ) ) ( not ( = ?auto_182276 ?auto_182279 ) ) ( not ( = ?auto_182277 ?auto_182279 ) ) ( not ( = ?auto_182278 ?auto_182279 ) ) ( not ( = ?auto_182281 ?auto_182279 ) ) ( not ( = ?auto_182282 ?auto_182279 ) ) ( not ( = ?auto_182280 ?auto_182279 ) ) ( ON ?auto_182275 ?auto_182274 ) ( ON-TABLE ?auto_182279 ) ( ON ?auto_182276 ?auto_182275 ) ( ON ?auto_182277 ?auto_182276 ) ( ON ?auto_182278 ?auto_182277 ) ( ON ?auto_182281 ?auto_182278 ) ( ON ?auto_182280 ?auto_182281 ) ( ON ?auto_182282 ?auto_182280 ) ( CLEAR ?auto_182282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182279 ?auto_182274 ?auto_182275 ?auto_182276 ?auto_182277 ?auto_182278 ?auto_182281 ?auto_182280 )
      ( MAKE-5PILE ?auto_182274 ?auto_182275 ?auto_182276 ?auto_182277 ?auto_182278 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182285 - BLOCK
      ?auto_182286 - BLOCK
    )
    :vars
    (
      ?auto_182287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182287 ?auto_182286 ) ( CLEAR ?auto_182287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182285 ) ( ON ?auto_182286 ?auto_182285 ) ( not ( = ?auto_182285 ?auto_182286 ) ) ( not ( = ?auto_182285 ?auto_182287 ) ) ( not ( = ?auto_182286 ?auto_182287 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182287 ?auto_182286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182288 - BLOCK
      ?auto_182289 - BLOCK
    )
    :vars
    (
      ?auto_182290 - BLOCK
      ?auto_182291 - BLOCK
      ?auto_182292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182290 ?auto_182289 ) ( CLEAR ?auto_182290 ) ( ON-TABLE ?auto_182288 ) ( ON ?auto_182289 ?auto_182288 ) ( not ( = ?auto_182288 ?auto_182289 ) ) ( not ( = ?auto_182288 ?auto_182290 ) ) ( not ( = ?auto_182289 ?auto_182290 ) ) ( HOLDING ?auto_182291 ) ( CLEAR ?auto_182292 ) ( not ( = ?auto_182288 ?auto_182291 ) ) ( not ( = ?auto_182288 ?auto_182292 ) ) ( not ( = ?auto_182289 ?auto_182291 ) ) ( not ( = ?auto_182289 ?auto_182292 ) ) ( not ( = ?auto_182290 ?auto_182291 ) ) ( not ( = ?auto_182290 ?auto_182292 ) ) ( not ( = ?auto_182291 ?auto_182292 ) ) )
    :subtasks
    ( ( !STACK ?auto_182291 ?auto_182292 )
      ( MAKE-2PILE ?auto_182288 ?auto_182289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182293 - BLOCK
      ?auto_182294 - BLOCK
    )
    :vars
    (
      ?auto_182296 - BLOCK
      ?auto_182297 - BLOCK
      ?auto_182295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182296 ?auto_182294 ) ( ON-TABLE ?auto_182293 ) ( ON ?auto_182294 ?auto_182293 ) ( not ( = ?auto_182293 ?auto_182294 ) ) ( not ( = ?auto_182293 ?auto_182296 ) ) ( not ( = ?auto_182294 ?auto_182296 ) ) ( CLEAR ?auto_182297 ) ( not ( = ?auto_182293 ?auto_182295 ) ) ( not ( = ?auto_182293 ?auto_182297 ) ) ( not ( = ?auto_182294 ?auto_182295 ) ) ( not ( = ?auto_182294 ?auto_182297 ) ) ( not ( = ?auto_182296 ?auto_182295 ) ) ( not ( = ?auto_182296 ?auto_182297 ) ) ( not ( = ?auto_182295 ?auto_182297 ) ) ( ON ?auto_182295 ?auto_182296 ) ( CLEAR ?auto_182295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182293 ?auto_182294 ?auto_182296 )
      ( MAKE-2PILE ?auto_182293 ?auto_182294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182298 - BLOCK
      ?auto_182299 - BLOCK
    )
    :vars
    (
      ?auto_182300 - BLOCK
      ?auto_182302 - BLOCK
      ?auto_182301 - BLOCK
      ?auto_182303 - BLOCK
      ?auto_182304 - BLOCK
      ?auto_182305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182300 ?auto_182299 ) ( ON-TABLE ?auto_182298 ) ( ON ?auto_182299 ?auto_182298 ) ( not ( = ?auto_182298 ?auto_182299 ) ) ( not ( = ?auto_182298 ?auto_182300 ) ) ( not ( = ?auto_182299 ?auto_182300 ) ) ( not ( = ?auto_182298 ?auto_182302 ) ) ( not ( = ?auto_182298 ?auto_182301 ) ) ( not ( = ?auto_182299 ?auto_182302 ) ) ( not ( = ?auto_182299 ?auto_182301 ) ) ( not ( = ?auto_182300 ?auto_182302 ) ) ( not ( = ?auto_182300 ?auto_182301 ) ) ( not ( = ?auto_182302 ?auto_182301 ) ) ( ON ?auto_182302 ?auto_182300 ) ( CLEAR ?auto_182302 ) ( HOLDING ?auto_182301 ) ( CLEAR ?auto_182303 ) ( ON-TABLE ?auto_182304 ) ( ON ?auto_182305 ?auto_182304 ) ( ON ?auto_182303 ?auto_182305 ) ( not ( = ?auto_182304 ?auto_182305 ) ) ( not ( = ?auto_182304 ?auto_182303 ) ) ( not ( = ?auto_182304 ?auto_182301 ) ) ( not ( = ?auto_182305 ?auto_182303 ) ) ( not ( = ?auto_182305 ?auto_182301 ) ) ( not ( = ?auto_182303 ?auto_182301 ) ) ( not ( = ?auto_182298 ?auto_182303 ) ) ( not ( = ?auto_182298 ?auto_182304 ) ) ( not ( = ?auto_182298 ?auto_182305 ) ) ( not ( = ?auto_182299 ?auto_182303 ) ) ( not ( = ?auto_182299 ?auto_182304 ) ) ( not ( = ?auto_182299 ?auto_182305 ) ) ( not ( = ?auto_182300 ?auto_182303 ) ) ( not ( = ?auto_182300 ?auto_182304 ) ) ( not ( = ?auto_182300 ?auto_182305 ) ) ( not ( = ?auto_182302 ?auto_182303 ) ) ( not ( = ?auto_182302 ?auto_182304 ) ) ( not ( = ?auto_182302 ?auto_182305 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182304 ?auto_182305 ?auto_182303 ?auto_182301 )
      ( MAKE-2PILE ?auto_182298 ?auto_182299 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182306 - BLOCK
      ?auto_182307 - BLOCK
    )
    :vars
    (
      ?auto_182309 - BLOCK
      ?auto_182312 - BLOCK
      ?auto_182313 - BLOCK
      ?auto_182311 - BLOCK
      ?auto_182310 - BLOCK
      ?auto_182308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182309 ?auto_182307 ) ( ON-TABLE ?auto_182306 ) ( ON ?auto_182307 ?auto_182306 ) ( not ( = ?auto_182306 ?auto_182307 ) ) ( not ( = ?auto_182306 ?auto_182309 ) ) ( not ( = ?auto_182307 ?auto_182309 ) ) ( not ( = ?auto_182306 ?auto_182312 ) ) ( not ( = ?auto_182306 ?auto_182313 ) ) ( not ( = ?auto_182307 ?auto_182312 ) ) ( not ( = ?auto_182307 ?auto_182313 ) ) ( not ( = ?auto_182309 ?auto_182312 ) ) ( not ( = ?auto_182309 ?auto_182313 ) ) ( not ( = ?auto_182312 ?auto_182313 ) ) ( ON ?auto_182312 ?auto_182309 ) ( CLEAR ?auto_182311 ) ( ON-TABLE ?auto_182310 ) ( ON ?auto_182308 ?auto_182310 ) ( ON ?auto_182311 ?auto_182308 ) ( not ( = ?auto_182310 ?auto_182308 ) ) ( not ( = ?auto_182310 ?auto_182311 ) ) ( not ( = ?auto_182310 ?auto_182313 ) ) ( not ( = ?auto_182308 ?auto_182311 ) ) ( not ( = ?auto_182308 ?auto_182313 ) ) ( not ( = ?auto_182311 ?auto_182313 ) ) ( not ( = ?auto_182306 ?auto_182311 ) ) ( not ( = ?auto_182306 ?auto_182310 ) ) ( not ( = ?auto_182306 ?auto_182308 ) ) ( not ( = ?auto_182307 ?auto_182311 ) ) ( not ( = ?auto_182307 ?auto_182310 ) ) ( not ( = ?auto_182307 ?auto_182308 ) ) ( not ( = ?auto_182309 ?auto_182311 ) ) ( not ( = ?auto_182309 ?auto_182310 ) ) ( not ( = ?auto_182309 ?auto_182308 ) ) ( not ( = ?auto_182312 ?auto_182311 ) ) ( not ( = ?auto_182312 ?auto_182310 ) ) ( not ( = ?auto_182312 ?auto_182308 ) ) ( ON ?auto_182313 ?auto_182312 ) ( CLEAR ?auto_182313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182306 ?auto_182307 ?auto_182309 ?auto_182312 )
      ( MAKE-2PILE ?auto_182306 ?auto_182307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182314 - BLOCK
      ?auto_182315 - BLOCK
    )
    :vars
    (
      ?auto_182320 - BLOCK
      ?auto_182318 - BLOCK
      ?auto_182321 - BLOCK
      ?auto_182316 - BLOCK
      ?auto_182319 - BLOCK
      ?auto_182317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182320 ?auto_182315 ) ( ON-TABLE ?auto_182314 ) ( ON ?auto_182315 ?auto_182314 ) ( not ( = ?auto_182314 ?auto_182315 ) ) ( not ( = ?auto_182314 ?auto_182320 ) ) ( not ( = ?auto_182315 ?auto_182320 ) ) ( not ( = ?auto_182314 ?auto_182318 ) ) ( not ( = ?auto_182314 ?auto_182321 ) ) ( not ( = ?auto_182315 ?auto_182318 ) ) ( not ( = ?auto_182315 ?auto_182321 ) ) ( not ( = ?auto_182320 ?auto_182318 ) ) ( not ( = ?auto_182320 ?auto_182321 ) ) ( not ( = ?auto_182318 ?auto_182321 ) ) ( ON ?auto_182318 ?auto_182320 ) ( ON-TABLE ?auto_182316 ) ( ON ?auto_182319 ?auto_182316 ) ( not ( = ?auto_182316 ?auto_182319 ) ) ( not ( = ?auto_182316 ?auto_182317 ) ) ( not ( = ?auto_182316 ?auto_182321 ) ) ( not ( = ?auto_182319 ?auto_182317 ) ) ( not ( = ?auto_182319 ?auto_182321 ) ) ( not ( = ?auto_182317 ?auto_182321 ) ) ( not ( = ?auto_182314 ?auto_182317 ) ) ( not ( = ?auto_182314 ?auto_182316 ) ) ( not ( = ?auto_182314 ?auto_182319 ) ) ( not ( = ?auto_182315 ?auto_182317 ) ) ( not ( = ?auto_182315 ?auto_182316 ) ) ( not ( = ?auto_182315 ?auto_182319 ) ) ( not ( = ?auto_182320 ?auto_182317 ) ) ( not ( = ?auto_182320 ?auto_182316 ) ) ( not ( = ?auto_182320 ?auto_182319 ) ) ( not ( = ?auto_182318 ?auto_182317 ) ) ( not ( = ?auto_182318 ?auto_182316 ) ) ( not ( = ?auto_182318 ?auto_182319 ) ) ( ON ?auto_182321 ?auto_182318 ) ( CLEAR ?auto_182321 ) ( HOLDING ?auto_182317 ) ( CLEAR ?auto_182319 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182316 ?auto_182319 ?auto_182317 )
      ( MAKE-2PILE ?auto_182314 ?auto_182315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182322 - BLOCK
      ?auto_182323 - BLOCK
    )
    :vars
    (
      ?auto_182329 - BLOCK
      ?auto_182328 - BLOCK
      ?auto_182326 - BLOCK
      ?auto_182327 - BLOCK
      ?auto_182325 - BLOCK
      ?auto_182324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182329 ?auto_182323 ) ( ON-TABLE ?auto_182322 ) ( ON ?auto_182323 ?auto_182322 ) ( not ( = ?auto_182322 ?auto_182323 ) ) ( not ( = ?auto_182322 ?auto_182329 ) ) ( not ( = ?auto_182323 ?auto_182329 ) ) ( not ( = ?auto_182322 ?auto_182328 ) ) ( not ( = ?auto_182322 ?auto_182326 ) ) ( not ( = ?auto_182323 ?auto_182328 ) ) ( not ( = ?auto_182323 ?auto_182326 ) ) ( not ( = ?auto_182329 ?auto_182328 ) ) ( not ( = ?auto_182329 ?auto_182326 ) ) ( not ( = ?auto_182328 ?auto_182326 ) ) ( ON ?auto_182328 ?auto_182329 ) ( ON-TABLE ?auto_182327 ) ( ON ?auto_182325 ?auto_182327 ) ( not ( = ?auto_182327 ?auto_182325 ) ) ( not ( = ?auto_182327 ?auto_182324 ) ) ( not ( = ?auto_182327 ?auto_182326 ) ) ( not ( = ?auto_182325 ?auto_182324 ) ) ( not ( = ?auto_182325 ?auto_182326 ) ) ( not ( = ?auto_182324 ?auto_182326 ) ) ( not ( = ?auto_182322 ?auto_182324 ) ) ( not ( = ?auto_182322 ?auto_182327 ) ) ( not ( = ?auto_182322 ?auto_182325 ) ) ( not ( = ?auto_182323 ?auto_182324 ) ) ( not ( = ?auto_182323 ?auto_182327 ) ) ( not ( = ?auto_182323 ?auto_182325 ) ) ( not ( = ?auto_182329 ?auto_182324 ) ) ( not ( = ?auto_182329 ?auto_182327 ) ) ( not ( = ?auto_182329 ?auto_182325 ) ) ( not ( = ?auto_182328 ?auto_182324 ) ) ( not ( = ?auto_182328 ?auto_182327 ) ) ( not ( = ?auto_182328 ?auto_182325 ) ) ( ON ?auto_182326 ?auto_182328 ) ( CLEAR ?auto_182325 ) ( ON ?auto_182324 ?auto_182326 ) ( CLEAR ?auto_182324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182322 ?auto_182323 ?auto_182329 ?auto_182328 ?auto_182326 )
      ( MAKE-2PILE ?auto_182322 ?auto_182323 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182330 - BLOCK
      ?auto_182331 - BLOCK
    )
    :vars
    (
      ?auto_182337 - BLOCK
      ?auto_182335 - BLOCK
      ?auto_182336 - BLOCK
      ?auto_182333 - BLOCK
      ?auto_182334 - BLOCK
      ?auto_182332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182337 ?auto_182331 ) ( ON-TABLE ?auto_182330 ) ( ON ?auto_182331 ?auto_182330 ) ( not ( = ?auto_182330 ?auto_182331 ) ) ( not ( = ?auto_182330 ?auto_182337 ) ) ( not ( = ?auto_182331 ?auto_182337 ) ) ( not ( = ?auto_182330 ?auto_182335 ) ) ( not ( = ?auto_182330 ?auto_182336 ) ) ( not ( = ?auto_182331 ?auto_182335 ) ) ( not ( = ?auto_182331 ?auto_182336 ) ) ( not ( = ?auto_182337 ?auto_182335 ) ) ( not ( = ?auto_182337 ?auto_182336 ) ) ( not ( = ?auto_182335 ?auto_182336 ) ) ( ON ?auto_182335 ?auto_182337 ) ( ON-TABLE ?auto_182333 ) ( not ( = ?auto_182333 ?auto_182334 ) ) ( not ( = ?auto_182333 ?auto_182332 ) ) ( not ( = ?auto_182333 ?auto_182336 ) ) ( not ( = ?auto_182334 ?auto_182332 ) ) ( not ( = ?auto_182334 ?auto_182336 ) ) ( not ( = ?auto_182332 ?auto_182336 ) ) ( not ( = ?auto_182330 ?auto_182332 ) ) ( not ( = ?auto_182330 ?auto_182333 ) ) ( not ( = ?auto_182330 ?auto_182334 ) ) ( not ( = ?auto_182331 ?auto_182332 ) ) ( not ( = ?auto_182331 ?auto_182333 ) ) ( not ( = ?auto_182331 ?auto_182334 ) ) ( not ( = ?auto_182337 ?auto_182332 ) ) ( not ( = ?auto_182337 ?auto_182333 ) ) ( not ( = ?auto_182337 ?auto_182334 ) ) ( not ( = ?auto_182335 ?auto_182332 ) ) ( not ( = ?auto_182335 ?auto_182333 ) ) ( not ( = ?auto_182335 ?auto_182334 ) ) ( ON ?auto_182336 ?auto_182335 ) ( ON ?auto_182332 ?auto_182336 ) ( CLEAR ?auto_182332 ) ( HOLDING ?auto_182334 ) ( CLEAR ?auto_182333 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182333 ?auto_182334 )
      ( MAKE-2PILE ?auto_182330 ?auto_182331 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182338 - BLOCK
      ?auto_182339 - BLOCK
    )
    :vars
    (
      ?auto_182340 - BLOCK
      ?auto_182344 - BLOCK
      ?auto_182343 - BLOCK
      ?auto_182341 - BLOCK
      ?auto_182342 - BLOCK
      ?auto_182345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182340 ?auto_182339 ) ( ON-TABLE ?auto_182338 ) ( ON ?auto_182339 ?auto_182338 ) ( not ( = ?auto_182338 ?auto_182339 ) ) ( not ( = ?auto_182338 ?auto_182340 ) ) ( not ( = ?auto_182339 ?auto_182340 ) ) ( not ( = ?auto_182338 ?auto_182344 ) ) ( not ( = ?auto_182338 ?auto_182343 ) ) ( not ( = ?auto_182339 ?auto_182344 ) ) ( not ( = ?auto_182339 ?auto_182343 ) ) ( not ( = ?auto_182340 ?auto_182344 ) ) ( not ( = ?auto_182340 ?auto_182343 ) ) ( not ( = ?auto_182344 ?auto_182343 ) ) ( ON ?auto_182344 ?auto_182340 ) ( ON-TABLE ?auto_182341 ) ( not ( = ?auto_182341 ?auto_182342 ) ) ( not ( = ?auto_182341 ?auto_182345 ) ) ( not ( = ?auto_182341 ?auto_182343 ) ) ( not ( = ?auto_182342 ?auto_182345 ) ) ( not ( = ?auto_182342 ?auto_182343 ) ) ( not ( = ?auto_182345 ?auto_182343 ) ) ( not ( = ?auto_182338 ?auto_182345 ) ) ( not ( = ?auto_182338 ?auto_182341 ) ) ( not ( = ?auto_182338 ?auto_182342 ) ) ( not ( = ?auto_182339 ?auto_182345 ) ) ( not ( = ?auto_182339 ?auto_182341 ) ) ( not ( = ?auto_182339 ?auto_182342 ) ) ( not ( = ?auto_182340 ?auto_182345 ) ) ( not ( = ?auto_182340 ?auto_182341 ) ) ( not ( = ?auto_182340 ?auto_182342 ) ) ( not ( = ?auto_182344 ?auto_182345 ) ) ( not ( = ?auto_182344 ?auto_182341 ) ) ( not ( = ?auto_182344 ?auto_182342 ) ) ( ON ?auto_182343 ?auto_182344 ) ( ON ?auto_182345 ?auto_182343 ) ( CLEAR ?auto_182341 ) ( ON ?auto_182342 ?auto_182345 ) ( CLEAR ?auto_182342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182338 ?auto_182339 ?auto_182340 ?auto_182344 ?auto_182343 ?auto_182345 )
      ( MAKE-2PILE ?auto_182338 ?auto_182339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182346 - BLOCK
      ?auto_182347 - BLOCK
    )
    :vars
    (
      ?auto_182352 - BLOCK
      ?auto_182349 - BLOCK
      ?auto_182351 - BLOCK
      ?auto_182350 - BLOCK
      ?auto_182348 - BLOCK
      ?auto_182353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182352 ?auto_182347 ) ( ON-TABLE ?auto_182346 ) ( ON ?auto_182347 ?auto_182346 ) ( not ( = ?auto_182346 ?auto_182347 ) ) ( not ( = ?auto_182346 ?auto_182352 ) ) ( not ( = ?auto_182347 ?auto_182352 ) ) ( not ( = ?auto_182346 ?auto_182349 ) ) ( not ( = ?auto_182346 ?auto_182351 ) ) ( not ( = ?auto_182347 ?auto_182349 ) ) ( not ( = ?auto_182347 ?auto_182351 ) ) ( not ( = ?auto_182352 ?auto_182349 ) ) ( not ( = ?auto_182352 ?auto_182351 ) ) ( not ( = ?auto_182349 ?auto_182351 ) ) ( ON ?auto_182349 ?auto_182352 ) ( not ( = ?auto_182350 ?auto_182348 ) ) ( not ( = ?auto_182350 ?auto_182353 ) ) ( not ( = ?auto_182350 ?auto_182351 ) ) ( not ( = ?auto_182348 ?auto_182353 ) ) ( not ( = ?auto_182348 ?auto_182351 ) ) ( not ( = ?auto_182353 ?auto_182351 ) ) ( not ( = ?auto_182346 ?auto_182353 ) ) ( not ( = ?auto_182346 ?auto_182350 ) ) ( not ( = ?auto_182346 ?auto_182348 ) ) ( not ( = ?auto_182347 ?auto_182353 ) ) ( not ( = ?auto_182347 ?auto_182350 ) ) ( not ( = ?auto_182347 ?auto_182348 ) ) ( not ( = ?auto_182352 ?auto_182353 ) ) ( not ( = ?auto_182352 ?auto_182350 ) ) ( not ( = ?auto_182352 ?auto_182348 ) ) ( not ( = ?auto_182349 ?auto_182353 ) ) ( not ( = ?auto_182349 ?auto_182350 ) ) ( not ( = ?auto_182349 ?auto_182348 ) ) ( ON ?auto_182351 ?auto_182349 ) ( ON ?auto_182353 ?auto_182351 ) ( ON ?auto_182348 ?auto_182353 ) ( CLEAR ?auto_182348 ) ( HOLDING ?auto_182350 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182350 )
      ( MAKE-2PILE ?auto_182346 ?auto_182347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182354 - BLOCK
      ?auto_182355 - BLOCK
    )
    :vars
    (
      ?auto_182360 - BLOCK
      ?auto_182359 - BLOCK
      ?auto_182357 - BLOCK
      ?auto_182361 - BLOCK
      ?auto_182358 - BLOCK
      ?auto_182356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182360 ?auto_182355 ) ( ON-TABLE ?auto_182354 ) ( ON ?auto_182355 ?auto_182354 ) ( not ( = ?auto_182354 ?auto_182355 ) ) ( not ( = ?auto_182354 ?auto_182360 ) ) ( not ( = ?auto_182355 ?auto_182360 ) ) ( not ( = ?auto_182354 ?auto_182359 ) ) ( not ( = ?auto_182354 ?auto_182357 ) ) ( not ( = ?auto_182355 ?auto_182359 ) ) ( not ( = ?auto_182355 ?auto_182357 ) ) ( not ( = ?auto_182360 ?auto_182359 ) ) ( not ( = ?auto_182360 ?auto_182357 ) ) ( not ( = ?auto_182359 ?auto_182357 ) ) ( ON ?auto_182359 ?auto_182360 ) ( not ( = ?auto_182361 ?auto_182358 ) ) ( not ( = ?auto_182361 ?auto_182356 ) ) ( not ( = ?auto_182361 ?auto_182357 ) ) ( not ( = ?auto_182358 ?auto_182356 ) ) ( not ( = ?auto_182358 ?auto_182357 ) ) ( not ( = ?auto_182356 ?auto_182357 ) ) ( not ( = ?auto_182354 ?auto_182356 ) ) ( not ( = ?auto_182354 ?auto_182361 ) ) ( not ( = ?auto_182354 ?auto_182358 ) ) ( not ( = ?auto_182355 ?auto_182356 ) ) ( not ( = ?auto_182355 ?auto_182361 ) ) ( not ( = ?auto_182355 ?auto_182358 ) ) ( not ( = ?auto_182360 ?auto_182356 ) ) ( not ( = ?auto_182360 ?auto_182361 ) ) ( not ( = ?auto_182360 ?auto_182358 ) ) ( not ( = ?auto_182359 ?auto_182356 ) ) ( not ( = ?auto_182359 ?auto_182361 ) ) ( not ( = ?auto_182359 ?auto_182358 ) ) ( ON ?auto_182357 ?auto_182359 ) ( ON ?auto_182356 ?auto_182357 ) ( ON ?auto_182358 ?auto_182356 ) ( ON ?auto_182361 ?auto_182358 ) ( CLEAR ?auto_182361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182354 ?auto_182355 ?auto_182360 ?auto_182359 ?auto_182357 ?auto_182356 ?auto_182358 )
      ( MAKE-2PILE ?auto_182354 ?auto_182355 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182362 - BLOCK
      ?auto_182363 - BLOCK
    )
    :vars
    (
      ?auto_182364 - BLOCK
      ?auto_182368 - BLOCK
      ?auto_182369 - BLOCK
      ?auto_182367 - BLOCK
      ?auto_182365 - BLOCK
      ?auto_182366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182364 ?auto_182363 ) ( ON-TABLE ?auto_182362 ) ( ON ?auto_182363 ?auto_182362 ) ( not ( = ?auto_182362 ?auto_182363 ) ) ( not ( = ?auto_182362 ?auto_182364 ) ) ( not ( = ?auto_182363 ?auto_182364 ) ) ( not ( = ?auto_182362 ?auto_182368 ) ) ( not ( = ?auto_182362 ?auto_182369 ) ) ( not ( = ?auto_182363 ?auto_182368 ) ) ( not ( = ?auto_182363 ?auto_182369 ) ) ( not ( = ?auto_182364 ?auto_182368 ) ) ( not ( = ?auto_182364 ?auto_182369 ) ) ( not ( = ?auto_182368 ?auto_182369 ) ) ( ON ?auto_182368 ?auto_182364 ) ( not ( = ?auto_182367 ?auto_182365 ) ) ( not ( = ?auto_182367 ?auto_182366 ) ) ( not ( = ?auto_182367 ?auto_182369 ) ) ( not ( = ?auto_182365 ?auto_182366 ) ) ( not ( = ?auto_182365 ?auto_182369 ) ) ( not ( = ?auto_182366 ?auto_182369 ) ) ( not ( = ?auto_182362 ?auto_182366 ) ) ( not ( = ?auto_182362 ?auto_182367 ) ) ( not ( = ?auto_182362 ?auto_182365 ) ) ( not ( = ?auto_182363 ?auto_182366 ) ) ( not ( = ?auto_182363 ?auto_182367 ) ) ( not ( = ?auto_182363 ?auto_182365 ) ) ( not ( = ?auto_182364 ?auto_182366 ) ) ( not ( = ?auto_182364 ?auto_182367 ) ) ( not ( = ?auto_182364 ?auto_182365 ) ) ( not ( = ?auto_182368 ?auto_182366 ) ) ( not ( = ?auto_182368 ?auto_182367 ) ) ( not ( = ?auto_182368 ?auto_182365 ) ) ( ON ?auto_182369 ?auto_182368 ) ( ON ?auto_182366 ?auto_182369 ) ( ON ?auto_182365 ?auto_182366 ) ( HOLDING ?auto_182367 ) ( CLEAR ?auto_182365 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182362 ?auto_182363 ?auto_182364 ?auto_182368 ?auto_182369 ?auto_182366 ?auto_182365 ?auto_182367 )
      ( MAKE-2PILE ?auto_182362 ?auto_182363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182370 - BLOCK
      ?auto_182371 - BLOCK
    )
    :vars
    (
      ?auto_182376 - BLOCK
      ?auto_182377 - BLOCK
      ?auto_182373 - BLOCK
      ?auto_182372 - BLOCK
      ?auto_182374 - BLOCK
      ?auto_182375 - BLOCK
      ?auto_182378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182376 ?auto_182371 ) ( ON-TABLE ?auto_182370 ) ( ON ?auto_182371 ?auto_182370 ) ( not ( = ?auto_182370 ?auto_182371 ) ) ( not ( = ?auto_182370 ?auto_182376 ) ) ( not ( = ?auto_182371 ?auto_182376 ) ) ( not ( = ?auto_182370 ?auto_182377 ) ) ( not ( = ?auto_182370 ?auto_182373 ) ) ( not ( = ?auto_182371 ?auto_182377 ) ) ( not ( = ?auto_182371 ?auto_182373 ) ) ( not ( = ?auto_182376 ?auto_182377 ) ) ( not ( = ?auto_182376 ?auto_182373 ) ) ( not ( = ?auto_182377 ?auto_182373 ) ) ( ON ?auto_182377 ?auto_182376 ) ( not ( = ?auto_182372 ?auto_182374 ) ) ( not ( = ?auto_182372 ?auto_182375 ) ) ( not ( = ?auto_182372 ?auto_182373 ) ) ( not ( = ?auto_182374 ?auto_182375 ) ) ( not ( = ?auto_182374 ?auto_182373 ) ) ( not ( = ?auto_182375 ?auto_182373 ) ) ( not ( = ?auto_182370 ?auto_182375 ) ) ( not ( = ?auto_182370 ?auto_182372 ) ) ( not ( = ?auto_182370 ?auto_182374 ) ) ( not ( = ?auto_182371 ?auto_182375 ) ) ( not ( = ?auto_182371 ?auto_182372 ) ) ( not ( = ?auto_182371 ?auto_182374 ) ) ( not ( = ?auto_182376 ?auto_182375 ) ) ( not ( = ?auto_182376 ?auto_182372 ) ) ( not ( = ?auto_182376 ?auto_182374 ) ) ( not ( = ?auto_182377 ?auto_182375 ) ) ( not ( = ?auto_182377 ?auto_182372 ) ) ( not ( = ?auto_182377 ?auto_182374 ) ) ( ON ?auto_182373 ?auto_182377 ) ( ON ?auto_182375 ?auto_182373 ) ( ON ?auto_182374 ?auto_182375 ) ( CLEAR ?auto_182374 ) ( ON ?auto_182372 ?auto_182378 ) ( CLEAR ?auto_182372 ) ( HAND-EMPTY ) ( not ( = ?auto_182370 ?auto_182378 ) ) ( not ( = ?auto_182371 ?auto_182378 ) ) ( not ( = ?auto_182376 ?auto_182378 ) ) ( not ( = ?auto_182377 ?auto_182378 ) ) ( not ( = ?auto_182373 ?auto_182378 ) ) ( not ( = ?auto_182372 ?auto_182378 ) ) ( not ( = ?auto_182374 ?auto_182378 ) ) ( not ( = ?auto_182375 ?auto_182378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182372 ?auto_182378 )
      ( MAKE-2PILE ?auto_182370 ?auto_182371 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182379 - BLOCK
      ?auto_182380 - BLOCK
    )
    :vars
    (
      ?auto_182384 - BLOCK
      ?auto_182386 - BLOCK
      ?auto_182383 - BLOCK
      ?auto_182387 - BLOCK
      ?auto_182385 - BLOCK
      ?auto_182381 - BLOCK
      ?auto_182382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182384 ?auto_182380 ) ( ON-TABLE ?auto_182379 ) ( ON ?auto_182380 ?auto_182379 ) ( not ( = ?auto_182379 ?auto_182380 ) ) ( not ( = ?auto_182379 ?auto_182384 ) ) ( not ( = ?auto_182380 ?auto_182384 ) ) ( not ( = ?auto_182379 ?auto_182386 ) ) ( not ( = ?auto_182379 ?auto_182383 ) ) ( not ( = ?auto_182380 ?auto_182386 ) ) ( not ( = ?auto_182380 ?auto_182383 ) ) ( not ( = ?auto_182384 ?auto_182386 ) ) ( not ( = ?auto_182384 ?auto_182383 ) ) ( not ( = ?auto_182386 ?auto_182383 ) ) ( ON ?auto_182386 ?auto_182384 ) ( not ( = ?auto_182387 ?auto_182385 ) ) ( not ( = ?auto_182387 ?auto_182381 ) ) ( not ( = ?auto_182387 ?auto_182383 ) ) ( not ( = ?auto_182385 ?auto_182381 ) ) ( not ( = ?auto_182385 ?auto_182383 ) ) ( not ( = ?auto_182381 ?auto_182383 ) ) ( not ( = ?auto_182379 ?auto_182381 ) ) ( not ( = ?auto_182379 ?auto_182387 ) ) ( not ( = ?auto_182379 ?auto_182385 ) ) ( not ( = ?auto_182380 ?auto_182381 ) ) ( not ( = ?auto_182380 ?auto_182387 ) ) ( not ( = ?auto_182380 ?auto_182385 ) ) ( not ( = ?auto_182384 ?auto_182381 ) ) ( not ( = ?auto_182384 ?auto_182387 ) ) ( not ( = ?auto_182384 ?auto_182385 ) ) ( not ( = ?auto_182386 ?auto_182381 ) ) ( not ( = ?auto_182386 ?auto_182387 ) ) ( not ( = ?auto_182386 ?auto_182385 ) ) ( ON ?auto_182383 ?auto_182386 ) ( ON ?auto_182381 ?auto_182383 ) ( ON ?auto_182387 ?auto_182382 ) ( CLEAR ?auto_182387 ) ( not ( = ?auto_182379 ?auto_182382 ) ) ( not ( = ?auto_182380 ?auto_182382 ) ) ( not ( = ?auto_182384 ?auto_182382 ) ) ( not ( = ?auto_182386 ?auto_182382 ) ) ( not ( = ?auto_182383 ?auto_182382 ) ) ( not ( = ?auto_182387 ?auto_182382 ) ) ( not ( = ?auto_182385 ?auto_182382 ) ) ( not ( = ?auto_182381 ?auto_182382 ) ) ( HOLDING ?auto_182385 ) ( CLEAR ?auto_182381 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182379 ?auto_182380 ?auto_182384 ?auto_182386 ?auto_182383 ?auto_182381 ?auto_182385 )
      ( MAKE-2PILE ?auto_182379 ?auto_182380 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182388 - BLOCK
      ?auto_182389 - BLOCK
    )
    :vars
    (
      ?auto_182395 - BLOCK
      ?auto_182394 - BLOCK
      ?auto_182396 - BLOCK
      ?auto_182390 - BLOCK
      ?auto_182391 - BLOCK
      ?auto_182393 - BLOCK
      ?auto_182392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182395 ?auto_182389 ) ( ON-TABLE ?auto_182388 ) ( ON ?auto_182389 ?auto_182388 ) ( not ( = ?auto_182388 ?auto_182389 ) ) ( not ( = ?auto_182388 ?auto_182395 ) ) ( not ( = ?auto_182389 ?auto_182395 ) ) ( not ( = ?auto_182388 ?auto_182394 ) ) ( not ( = ?auto_182388 ?auto_182396 ) ) ( not ( = ?auto_182389 ?auto_182394 ) ) ( not ( = ?auto_182389 ?auto_182396 ) ) ( not ( = ?auto_182395 ?auto_182394 ) ) ( not ( = ?auto_182395 ?auto_182396 ) ) ( not ( = ?auto_182394 ?auto_182396 ) ) ( ON ?auto_182394 ?auto_182395 ) ( not ( = ?auto_182390 ?auto_182391 ) ) ( not ( = ?auto_182390 ?auto_182393 ) ) ( not ( = ?auto_182390 ?auto_182396 ) ) ( not ( = ?auto_182391 ?auto_182393 ) ) ( not ( = ?auto_182391 ?auto_182396 ) ) ( not ( = ?auto_182393 ?auto_182396 ) ) ( not ( = ?auto_182388 ?auto_182393 ) ) ( not ( = ?auto_182388 ?auto_182390 ) ) ( not ( = ?auto_182388 ?auto_182391 ) ) ( not ( = ?auto_182389 ?auto_182393 ) ) ( not ( = ?auto_182389 ?auto_182390 ) ) ( not ( = ?auto_182389 ?auto_182391 ) ) ( not ( = ?auto_182395 ?auto_182393 ) ) ( not ( = ?auto_182395 ?auto_182390 ) ) ( not ( = ?auto_182395 ?auto_182391 ) ) ( not ( = ?auto_182394 ?auto_182393 ) ) ( not ( = ?auto_182394 ?auto_182390 ) ) ( not ( = ?auto_182394 ?auto_182391 ) ) ( ON ?auto_182396 ?auto_182394 ) ( ON ?auto_182393 ?auto_182396 ) ( ON ?auto_182390 ?auto_182392 ) ( not ( = ?auto_182388 ?auto_182392 ) ) ( not ( = ?auto_182389 ?auto_182392 ) ) ( not ( = ?auto_182395 ?auto_182392 ) ) ( not ( = ?auto_182394 ?auto_182392 ) ) ( not ( = ?auto_182396 ?auto_182392 ) ) ( not ( = ?auto_182390 ?auto_182392 ) ) ( not ( = ?auto_182391 ?auto_182392 ) ) ( not ( = ?auto_182393 ?auto_182392 ) ) ( CLEAR ?auto_182393 ) ( ON ?auto_182391 ?auto_182390 ) ( CLEAR ?auto_182391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182392 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182392 ?auto_182390 )
      ( MAKE-2PILE ?auto_182388 ?auto_182389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182397 - BLOCK
      ?auto_182398 - BLOCK
    )
    :vars
    (
      ?auto_182401 - BLOCK
      ?auto_182400 - BLOCK
      ?auto_182399 - BLOCK
      ?auto_182404 - BLOCK
      ?auto_182403 - BLOCK
      ?auto_182402 - BLOCK
      ?auto_182405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182401 ?auto_182398 ) ( ON-TABLE ?auto_182397 ) ( ON ?auto_182398 ?auto_182397 ) ( not ( = ?auto_182397 ?auto_182398 ) ) ( not ( = ?auto_182397 ?auto_182401 ) ) ( not ( = ?auto_182398 ?auto_182401 ) ) ( not ( = ?auto_182397 ?auto_182400 ) ) ( not ( = ?auto_182397 ?auto_182399 ) ) ( not ( = ?auto_182398 ?auto_182400 ) ) ( not ( = ?auto_182398 ?auto_182399 ) ) ( not ( = ?auto_182401 ?auto_182400 ) ) ( not ( = ?auto_182401 ?auto_182399 ) ) ( not ( = ?auto_182400 ?auto_182399 ) ) ( ON ?auto_182400 ?auto_182401 ) ( not ( = ?auto_182404 ?auto_182403 ) ) ( not ( = ?auto_182404 ?auto_182402 ) ) ( not ( = ?auto_182404 ?auto_182399 ) ) ( not ( = ?auto_182403 ?auto_182402 ) ) ( not ( = ?auto_182403 ?auto_182399 ) ) ( not ( = ?auto_182402 ?auto_182399 ) ) ( not ( = ?auto_182397 ?auto_182402 ) ) ( not ( = ?auto_182397 ?auto_182404 ) ) ( not ( = ?auto_182397 ?auto_182403 ) ) ( not ( = ?auto_182398 ?auto_182402 ) ) ( not ( = ?auto_182398 ?auto_182404 ) ) ( not ( = ?auto_182398 ?auto_182403 ) ) ( not ( = ?auto_182401 ?auto_182402 ) ) ( not ( = ?auto_182401 ?auto_182404 ) ) ( not ( = ?auto_182401 ?auto_182403 ) ) ( not ( = ?auto_182400 ?auto_182402 ) ) ( not ( = ?auto_182400 ?auto_182404 ) ) ( not ( = ?auto_182400 ?auto_182403 ) ) ( ON ?auto_182399 ?auto_182400 ) ( ON ?auto_182404 ?auto_182405 ) ( not ( = ?auto_182397 ?auto_182405 ) ) ( not ( = ?auto_182398 ?auto_182405 ) ) ( not ( = ?auto_182401 ?auto_182405 ) ) ( not ( = ?auto_182400 ?auto_182405 ) ) ( not ( = ?auto_182399 ?auto_182405 ) ) ( not ( = ?auto_182404 ?auto_182405 ) ) ( not ( = ?auto_182403 ?auto_182405 ) ) ( not ( = ?auto_182402 ?auto_182405 ) ) ( ON ?auto_182403 ?auto_182404 ) ( CLEAR ?auto_182403 ) ( ON-TABLE ?auto_182405 ) ( HOLDING ?auto_182402 ) ( CLEAR ?auto_182399 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182397 ?auto_182398 ?auto_182401 ?auto_182400 ?auto_182399 ?auto_182402 )
      ( MAKE-2PILE ?auto_182397 ?auto_182398 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182406 - BLOCK
      ?auto_182407 - BLOCK
    )
    :vars
    (
      ?auto_182410 - BLOCK
      ?auto_182413 - BLOCK
      ?auto_182409 - BLOCK
      ?auto_182411 - BLOCK
      ?auto_182414 - BLOCK
      ?auto_182412 - BLOCK
      ?auto_182408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182410 ?auto_182407 ) ( ON-TABLE ?auto_182406 ) ( ON ?auto_182407 ?auto_182406 ) ( not ( = ?auto_182406 ?auto_182407 ) ) ( not ( = ?auto_182406 ?auto_182410 ) ) ( not ( = ?auto_182407 ?auto_182410 ) ) ( not ( = ?auto_182406 ?auto_182413 ) ) ( not ( = ?auto_182406 ?auto_182409 ) ) ( not ( = ?auto_182407 ?auto_182413 ) ) ( not ( = ?auto_182407 ?auto_182409 ) ) ( not ( = ?auto_182410 ?auto_182413 ) ) ( not ( = ?auto_182410 ?auto_182409 ) ) ( not ( = ?auto_182413 ?auto_182409 ) ) ( ON ?auto_182413 ?auto_182410 ) ( not ( = ?auto_182411 ?auto_182414 ) ) ( not ( = ?auto_182411 ?auto_182412 ) ) ( not ( = ?auto_182411 ?auto_182409 ) ) ( not ( = ?auto_182414 ?auto_182412 ) ) ( not ( = ?auto_182414 ?auto_182409 ) ) ( not ( = ?auto_182412 ?auto_182409 ) ) ( not ( = ?auto_182406 ?auto_182412 ) ) ( not ( = ?auto_182406 ?auto_182411 ) ) ( not ( = ?auto_182406 ?auto_182414 ) ) ( not ( = ?auto_182407 ?auto_182412 ) ) ( not ( = ?auto_182407 ?auto_182411 ) ) ( not ( = ?auto_182407 ?auto_182414 ) ) ( not ( = ?auto_182410 ?auto_182412 ) ) ( not ( = ?auto_182410 ?auto_182411 ) ) ( not ( = ?auto_182410 ?auto_182414 ) ) ( not ( = ?auto_182413 ?auto_182412 ) ) ( not ( = ?auto_182413 ?auto_182411 ) ) ( not ( = ?auto_182413 ?auto_182414 ) ) ( ON ?auto_182409 ?auto_182413 ) ( ON ?auto_182411 ?auto_182408 ) ( not ( = ?auto_182406 ?auto_182408 ) ) ( not ( = ?auto_182407 ?auto_182408 ) ) ( not ( = ?auto_182410 ?auto_182408 ) ) ( not ( = ?auto_182413 ?auto_182408 ) ) ( not ( = ?auto_182409 ?auto_182408 ) ) ( not ( = ?auto_182411 ?auto_182408 ) ) ( not ( = ?auto_182414 ?auto_182408 ) ) ( not ( = ?auto_182412 ?auto_182408 ) ) ( ON ?auto_182414 ?auto_182411 ) ( ON-TABLE ?auto_182408 ) ( CLEAR ?auto_182409 ) ( ON ?auto_182412 ?auto_182414 ) ( CLEAR ?auto_182412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182408 ?auto_182411 ?auto_182414 )
      ( MAKE-2PILE ?auto_182406 ?auto_182407 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182415 - BLOCK
      ?auto_182416 - BLOCK
    )
    :vars
    (
      ?auto_182422 - BLOCK
      ?auto_182418 - BLOCK
      ?auto_182417 - BLOCK
      ?auto_182419 - BLOCK
      ?auto_182420 - BLOCK
      ?auto_182421 - BLOCK
      ?auto_182423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182422 ?auto_182416 ) ( ON-TABLE ?auto_182415 ) ( ON ?auto_182416 ?auto_182415 ) ( not ( = ?auto_182415 ?auto_182416 ) ) ( not ( = ?auto_182415 ?auto_182422 ) ) ( not ( = ?auto_182416 ?auto_182422 ) ) ( not ( = ?auto_182415 ?auto_182418 ) ) ( not ( = ?auto_182415 ?auto_182417 ) ) ( not ( = ?auto_182416 ?auto_182418 ) ) ( not ( = ?auto_182416 ?auto_182417 ) ) ( not ( = ?auto_182422 ?auto_182418 ) ) ( not ( = ?auto_182422 ?auto_182417 ) ) ( not ( = ?auto_182418 ?auto_182417 ) ) ( ON ?auto_182418 ?auto_182422 ) ( not ( = ?auto_182419 ?auto_182420 ) ) ( not ( = ?auto_182419 ?auto_182421 ) ) ( not ( = ?auto_182419 ?auto_182417 ) ) ( not ( = ?auto_182420 ?auto_182421 ) ) ( not ( = ?auto_182420 ?auto_182417 ) ) ( not ( = ?auto_182421 ?auto_182417 ) ) ( not ( = ?auto_182415 ?auto_182421 ) ) ( not ( = ?auto_182415 ?auto_182419 ) ) ( not ( = ?auto_182415 ?auto_182420 ) ) ( not ( = ?auto_182416 ?auto_182421 ) ) ( not ( = ?auto_182416 ?auto_182419 ) ) ( not ( = ?auto_182416 ?auto_182420 ) ) ( not ( = ?auto_182422 ?auto_182421 ) ) ( not ( = ?auto_182422 ?auto_182419 ) ) ( not ( = ?auto_182422 ?auto_182420 ) ) ( not ( = ?auto_182418 ?auto_182421 ) ) ( not ( = ?auto_182418 ?auto_182419 ) ) ( not ( = ?auto_182418 ?auto_182420 ) ) ( ON ?auto_182419 ?auto_182423 ) ( not ( = ?auto_182415 ?auto_182423 ) ) ( not ( = ?auto_182416 ?auto_182423 ) ) ( not ( = ?auto_182422 ?auto_182423 ) ) ( not ( = ?auto_182418 ?auto_182423 ) ) ( not ( = ?auto_182417 ?auto_182423 ) ) ( not ( = ?auto_182419 ?auto_182423 ) ) ( not ( = ?auto_182420 ?auto_182423 ) ) ( not ( = ?auto_182421 ?auto_182423 ) ) ( ON ?auto_182420 ?auto_182419 ) ( ON-TABLE ?auto_182423 ) ( ON ?auto_182421 ?auto_182420 ) ( CLEAR ?auto_182421 ) ( HOLDING ?auto_182417 ) ( CLEAR ?auto_182418 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182415 ?auto_182416 ?auto_182422 ?auto_182418 ?auto_182417 )
      ( MAKE-2PILE ?auto_182415 ?auto_182416 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182424 - BLOCK
      ?auto_182425 - BLOCK
    )
    :vars
    (
      ?auto_182427 - BLOCK
      ?auto_182429 - BLOCK
      ?auto_182432 - BLOCK
      ?auto_182431 - BLOCK
      ?auto_182428 - BLOCK
      ?auto_182430 - BLOCK
      ?auto_182426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182427 ?auto_182425 ) ( ON-TABLE ?auto_182424 ) ( ON ?auto_182425 ?auto_182424 ) ( not ( = ?auto_182424 ?auto_182425 ) ) ( not ( = ?auto_182424 ?auto_182427 ) ) ( not ( = ?auto_182425 ?auto_182427 ) ) ( not ( = ?auto_182424 ?auto_182429 ) ) ( not ( = ?auto_182424 ?auto_182432 ) ) ( not ( = ?auto_182425 ?auto_182429 ) ) ( not ( = ?auto_182425 ?auto_182432 ) ) ( not ( = ?auto_182427 ?auto_182429 ) ) ( not ( = ?auto_182427 ?auto_182432 ) ) ( not ( = ?auto_182429 ?auto_182432 ) ) ( ON ?auto_182429 ?auto_182427 ) ( not ( = ?auto_182431 ?auto_182428 ) ) ( not ( = ?auto_182431 ?auto_182430 ) ) ( not ( = ?auto_182431 ?auto_182432 ) ) ( not ( = ?auto_182428 ?auto_182430 ) ) ( not ( = ?auto_182428 ?auto_182432 ) ) ( not ( = ?auto_182430 ?auto_182432 ) ) ( not ( = ?auto_182424 ?auto_182430 ) ) ( not ( = ?auto_182424 ?auto_182431 ) ) ( not ( = ?auto_182424 ?auto_182428 ) ) ( not ( = ?auto_182425 ?auto_182430 ) ) ( not ( = ?auto_182425 ?auto_182431 ) ) ( not ( = ?auto_182425 ?auto_182428 ) ) ( not ( = ?auto_182427 ?auto_182430 ) ) ( not ( = ?auto_182427 ?auto_182431 ) ) ( not ( = ?auto_182427 ?auto_182428 ) ) ( not ( = ?auto_182429 ?auto_182430 ) ) ( not ( = ?auto_182429 ?auto_182431 ) ) ( not ( = ?auto_182429 ?auto_182428 ) ) ( ON ?auto_182431 ?auto_182426 ) ( not ( = ?auto_182424 ?auto_182426 ) ) ( not ( = ?auto_182425 ?auto_182426 ) ) ( not ( = ?auto_182427 ?auto_182426 ) ) ( not ( = ?auto_182429 ?auto_182426 ) ) ( not ( = ?auto_182432 ?auto_182426 ) ) ( not ( = ?auto_182431 ?auto_182426 ) ) ( not ( = ?auto_182428 ?auto_182426 ) ) ( not ( = ?auto_182430 ?auto_182426 ) ) ( ON ?auto_182428 ?auto_182431 ) ( ON-TABLE ?auto_182426 ) ( ON ?auto_182430 ?auto_182428 ) ( CLEAR ?auto_182429 ) ( ON ?auto_182432 ?auto_182430 ) ( CLEAR ?auto_182432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182426 ?auto_182431 ?auto_182428 ?auto_182430 )
      ( MAKE-2PILE ?auto_182424 ?auto_182425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182433 - BLOCK
      ?auto_182434 - BLOCK
    )
    :vars
    (
      ?auto_182437 - BLOCK
      ?auto_182436 - BLOCK
      ?auto_182441 - BLOCK
      ?auto_182438 - BLOCK
      ?auto_182439 - BLOCK
      ?auto_182440 - BLOCK
      ?auto_182435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182437 ?auto_182434 ) ( ON-TABLE ?auto_182433 ) ( ON ?auto_182434 ?auto_182433 ) ( not ( = ?auto_182433 ?auto_182434 ) ) ( not ( = ?auto_182433 ?auto_182437 ) ) ( not ( = ?auto_182434 ?auto_182437 ) ) ( not ( = ?auto_182433 ?auto_182436 ) ) ( not ( = ?auto_182433 ?auto_182441 ) ) ( not ( = ?auto_182434 ?auto_182436 ) ) ( not ( = ?auto_182434 ?auto_182441 ) ) ( not ( = ?auto_182437 ?auto_182436 ) ) ( not ( = ?auto_182437 ?auto_182441 ) ) ( not ( = ?auto_182436 ?auto_182441 ) ) ( not ( = ?auto_182438 ?auto_182439 ) ) ( not ( = ?auto_182438 ?auto_182440 ) ) ( not ( = ?auto_182438 ?auto_182441 ) ) ( not ( = ?auto_182439 ?auto_182440 ) ) ( not ( = ?auto_182439 ?auto_182441 ) ) ( not ( = ?auto_182440 ?auto_182441 ) ) ( not ( = ?auto_182433 ?auto_182440 ) ) ( not ( = ?auto_182433 ?auto_182438 ) ) ( not ( = ?auto_182433 ?auto_182439 ) ) ( not ( = ?auto_182434 ?auto_182440 ) ) ( not ( = ?auto_182434 ?auto_182438 ) ) ( not ( = ?auto_182434 ?auto_182439 ) ) ( not ( = ?auto_182437 ?auto_182440 ) ) ( not ( = ?auto_182437 ?auto_182438 ) ) ( not ( = ?auto_182437 ?auto_182439 ) ) ( not ( = ?auto_182436 ?auto_182440 ) ) ( not ( = ?auto_182436 ?auto_182438 ) ) ( not ( = ?auto_182436 ?auto_182439 ) ) ( ON ?auto_182438 ?auto_182435 ) ( not ( = ?auto_182433 ?auto_182435 ) ) ( not ( = ?auto_182434 ?auto_182435 ) ) ( not ( = ?auto_182437 ?auto_182435 ) ) ( not ( = ?auto_182436 ?auto_182435 ) ) ( not ( = ?auto_182441 ?auto_182435 ) ) ( not ( = ?auto_182438 ?auto_182435 ) ) ( not ( = ?auto_182439 ?auto_182435 ) ) ( not ( = ?auto_182440 ?auto_182435 ) ) ( ON ?auto_182439 ?auto_182438 ) ( ON-TABLE ?auto_182435 ) ( ON ?auto_182440 ?auto_182439 ) ( ON ?auto_182441 ?auto_182440 ) ( CLEAR ?auto_182441 ) ( HOLDING ?auto_182436 ) ( CLEAR ?auto_182437 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182433 ?auto_182434 ?auto_182437 ?auto_182436 )
      ( MAKE-2PILE ?auto_182433 ?auto_182434 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182442 - BLOCK
      ?auto_182443 - BLOCK
    )
    :vars
    (
      ?auto_182444 - BLOCK
      ?auto_182445 - BLOCK
      ?auto_182446 - BLOCK
      ?auto_182450 - BLOCK
      ?auto_182447 - BLOCK
      ?auto_182448 - BLOCK
      ?auto_182449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182444 ?auto_182443 ) ( ON-TABLE ?auto_182442 ) ( ON ?auto_182443 ?auto_182442 ) ( not ( = ?auto_182442 ?auto_182443 ) ) ( not ( = ?auto_182442 ?auto_182444 ) ) ( not ( = ?auto_182443 ?auto_182444 ) ) ( not ( = ?auto_182442 ?auto_182445 ) ) ( not ( = ?auto_182442 ?auto_182446 ) ) ( not ( = ?auto_182443 ?auto_182445 ) ) ( not ( = ?auto_182443 ?auto_182446 ) ) ( not ( = ?auto_182444 ?auto_182445 ) ) ( not ( = ?auto_182444 ?auto_182446 ) ) ( not ( = ?auto_182445 ?auto_182446 ) ) ( not ( = ?auto_182450 ?auto_182447 ) ) ( not ( = ?auto_182450 ?auto_182448 ) ) ( not ( = ?auto_182450 ?auto_182446 ) ) ( not ( = ?auto_182447 ?auto_182448 ) ) ( not ( = ?auto_182447 ?auto_182446 ) ) ( not ( = ?auto_182448 ?auto_182446 ) ) ( not ( = ?auto_182442 ?auto_182448 ) ) ( not ( = ?auto_182442 ?auto_182450 ) ) ( not ( = ?auto_182442 ?auto_182447 ) ) ( not ( = ?auto_182443 ?auto_182448 ) ) ( not ( = ?auto_182443 ?auto_182450 ) ) ( not ( = ?auto_182443 ?auto_182447 ) ) ( not ( = ?auto_182444 ?auto_182448 ) ) ( not ( = ?auto_182444 ?auto_182450 ) ) ( not ( = ?auto_182444 ?auto_182447 ) ) ( not ( = ?auto_182445 ?auto_182448 ) ) ( not ( = ?auto_182445 ?auto_182450 ) ) ( not ( = ?auto_182445 ?auto_182447 ) ) ( ON ?auto_182450 ?auto_182449 ) ( not ( = ?auto_182442 ?auto_182449 ) ) ( not ( = ?auto_182443 ?auto_182449 ) ) ( not ( = ?auto_182444 ?auto_182449 ) ) ( not ( = ?auto_182445 ?auto_182449 ) ) ( not ( = ?auto_182446 ?auto_182449 ) ) ( not ( = ?auto_182450 ?auto_182449 ) ) ( not ( = ?auto_182447 ?auto_182449 ) ) ( not ( = ?auto_182448 ?auto_182449 ) ) ( ON ?auto_182447 ?auto_182450 ) ( ON-TABLE ?auto_182449 ) ( ON ?auto_182448 ?auto_182447 ) ( ON ?auto_182446 ?auto_182448 ) ( CLEAR ?auto_182444 ) ( ON ?auto_182445 ?auto_182446 ) ( CLEAR ?auto_182445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182449 ?auto_182450 ?auto_182447 ?auto_182448 ?auto_182446 )
      ( MAKE-2PILE ?auto_182442 ?auto_182443 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182469 - BLOCK
      ?auto_182470 - BLOCK
    )
    :vars
    (
      ?auto_182474 - BLOCK
      ?auto_182472 - BLOCK
      ?auto_182471 - BLOCK
      ?auto_182475 - BLOCK
      ?auto_182476 - BLOCK
      ?auto_182473 - BLOCK
      ?auto_182477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182469 ) ( not ( = ?auto_182469 ?auto_182470 ) ) ( not ( = ?auto_182469 ?auto_182474 ) ) ( not ( = ?auto_182470 ?auto_182474 ) ) ( not ( = ?auto_182469 ?auto_182472 ) ) ( not ( = ?auto_182469 ?auto_182471 ) ) ( not ( = ?auto_182470 ?auto_182472 ) ) ( not ( = ?auto_182470 ?auto_182471 ) ) ( not ( = ?auto_182474 ?auto_182472 ) ) ( not ( = ?auto_182474 ?auto_182471 ) ) ( not ( = ?auto_182472 ?auto_182471 ) ) ( not ( = ?auto_182475 ?auto_182476 ) ) ( not ( = ?auto_182475 ?auto_182473 ) ) ( not ( = ?auto_182475 ?auto_182471 ) ) ( not ( = ?auto_182476 ?auto_182473 ) ) ( not ( = ?auto_182476 ?auto_182471 ) ) ( not ( = ?auto_182473 ?auto_182471 ) ) ( not ( = ?auto_182469 ?auto_182473 ) ) ( not ( = ?auto_182469 ?auto_182475 ) ) ( not ( = ?auto_182469 ?auto_182476 ) ) ( not ( = ?auto_182470 ?auto_182473 ) ) ( not ( = ?auto_182470 ?auto_182475 ) ) ( not ( = ?auto_182470 ?auto_182476 ) ) ( not ( = ?auto_182474 ?auto_182473 ) ) ( not ( = ?auto_182474 ?auto_182475 ) ) ( not ( = ?auto_182474 ?auto_182476 ) ) ( not ( = ?auto_182472 ?auto_182473 ) ) ( not ( = ?auto_182472 ?auto_182475 ) ) ( not ( = ?auto_182472 ?auto_182476 ) ) ( ON ?auto_182475 ?auto_182477 ) ( not ( = ?auto_182469 ?auto_182477 ) ) ( not ( = ?auto_182470 ?auto_182477 ) ) ( not ( = ?auto_182474 ?auto_182477 ) ) ( not ( = ?auto_182472 ?auto_182477 ) ) ( not ( = ?auto_182471 ?auto_182477 ) ) ( not ( = ?auto_182475 ?auto_182477 ) ) ( not ( = ?auto_182476 ?auto_182477 ) ) ( not ( = ?auto_182473 ?auto_182477 ) ) ( ON ?auto_182476 ?auto_182475 ) ( ON-TABLE ?auto_182477 ) ( ON ?auto_182473 ?auto_182476 ) ( ON ?auto_182471 ?auto_182473 ) ( ON ?auto_182472 ?auto_182471 ) ( ON ?auto_182474 ?auto_182472 ) ( CLEAR ?auto_182474 ) ( HOLDING ?auto_182470 ) ( CLEAR ?auto_182469 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182469 ?auto_182470 ?auto_182474 )
      ( MAKE-2PILE ?auto_182469 ?auto_182470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182478 - BLOCK
      ?auto_182479 - BLOCK
    )
    :vars
    (
      ?auto_182484 - BLOCK
      ?auto_182482 - BLOCK
      ?auto_182486 - BLOCK
      ?auto_182485 - BLOCK
      ?auto_182480 - BLOCK
      ?auto_182481 - BLOCK
      ?auto_182483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182478 ) ( not ( = ?auto_182478 ?auto_182479 ) ) ( not ( = ?auto_182478 ?auto_182484 ) ) ( not ( = ?auto_182479 ?auto_182484 ) ) ( not ( = ?auto_182478 ?auto_182482 ) ) ( not ( = ?auto_182478 ?auto_182486 ) ) ( not ( = ?auto_182479 ?auto_182482 ) ) ( not ( = ?auto_182479 ?auto_182486 ) ) ( not ( = ?auto_182484 ?auto_182482 ) ) ( not ( = ?auto_182484 ?auto_182486 ) ) ( not ( = ?auto_182482 ?auto_182486 ) ) ( not ( = ?auto_182485 ?auto_182480 ) ) ( not ( = ?auto_182485 ?auto_182481 ) ) ( not ( = ?auto_182485 ?auto_182486 ) ) ( not ( = ?auto_182480 ?auto_182481 ) ) ( not ( = ?auto_182480 ?auto_182486 ) ) ( not ( = ?auto_182481 ?auto_182486 ) ) ( not ( = ?auto_182478 ?auto_182481 ) ) ( not ( = ?auto_182478 ?auto_182485 ) ) ( not ( = ?auto_182478 ?auto_182480 ) ) ( not ( = ?auto_182479 ?auto_182481 ) ) ( not ( = ?auto_182479 ?auto_182485 ) ) ( not ( = ?auto_182479 ?auto_182480 ) ) ( not ( = ?auto_182484 ?auto_182481 ) ) ( not ( = ?auto_182484 ?auto_182485 ) ) ( not ( = ?auto_182484 ?auto_182480 ) ) ( not ( = ?auto_182482 ?auto_182481 ) ) ( not ( = ?auto_182482 ?auto_182485 ) ) ( not ( = ?auto_182482 ?auto_182480 ) ) ( ON ?auto_182485 ?auto_182483 ) ( not ( = ?auto_182478 ?auto_182483 ) ) ( not ( = ?auto_182479 ?auto_182483 ) ) ( not ( = ?auto_182484 ?auto_182483 ) ) ( not ( = ?auto_182482 ?auto_182483 ) ) ( not ( = ?auto_182486 ?auto_182483 ) ) ( not ( = ?auto_182485 ?auto_182483 ) ) ( not ( = ?auto_182480 ?auto_182483 ) ) ( not ( = ?auto_182481 ?auto_182483 ) ) ( ON ?auto_182480 ?auto_182485 ) ( ON-TABLE ?auto_182483 ) ( ON ?auto_182481 ?auto_182480 ) ( ON ?auto_182486 ?auto_182481 ) ( ON ?auto_182482 ?auto_182486 ) ( ON ?auto_182484 ?auto_182482 ) ( CLEAR ?auto_182478 ) ( ON ?auto_182479 ?auto_182484 ) ( CLEAR ?auto_182479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182483 ?auto_182485 ?auto_182480 ?auto_182481 ?auto_182486 ?auto_182482 ?auto_182484 )
      ( MAKE-2PILE ?auto_182478 ?auto_182479 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182487 - BLOCK
      ?auto_182488 - BLOCK
    )
    :vars
    (
      ?auto_182490 - BLOCK
      ?auto_182493 - BLOCK
      ?auto_182495 - BLOCK
      ?auto_182492 - BLOCK
      ?auto_182491 - BLOCK
      ?auto_182489 - BLOCK
      ?auto_182494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182487 ?auto_182488 ) ) ( not ( = ?auto_182487 ?auto_182490 ) ) ( not ( = ?auto_182488 ?auto_182490 ) ) ( not ( = ?auto_182487 ?auto_182493 ) ) ( not ( = ?auto_182487 ?auto_182495 ) ) ( not ( = ?auto_182488 ?auto_182493 ) ) ( not ( = ?auto_182488 ?auto_182495 ) ) ( not ( = ?auto_182490 ?auto_182493 ) ) ( not ( = ?auto_182490 ?auto_182495 ) ) ( not ( = ?auto_182493 ?auto_182495 ) ) ( not ( = ?auto_182492 ?auto_182491 ) ) ( not ( = ?auto_182492 ?auto_182489 ) ) ( not ( = ?auto_182492 ?auto_182495 ) ) ( not ( = ?auto_182491 ?auto_182489 ) ) ( not ( = ?auto_182491 ?auto_182495 ) ) ( not ( = ?auto_182489 ?auto_182495 ) ) ( not ( = ?auto_182487 ?auto_182489 ) ) ( not ( = ?auto_182487 ?auto_182492 ) ) ( not ( = ?auto_182487 ?auto_182491 ) ) ( not ( = ?auto_182488 ?auto_182489 ) ) ( not ( = ?auto_182488 ?auto_182492 ) ) ( not ( = ?auto_182488 ?auto_182491 ) ) ( not ( = ?auto_182490 ?auto_182489 ) ) ( not ( = ?auto_182490 ?auto_182492 ) ) ( not ( = ?auto_182490 ?auto_182491 ) ) ( not ( = ?auto_182493 ?auto_182489 ) ) ( not ( = ?auto_182493 ?auto_182492 ) ) ( not ( = ?auto_182493 ?auto_182491 ) ) ( ON ?auto_182492 ?auto_182494 ) ( not ( = ?auto_182487 ?auto_182494 ) ) ( not ( = ?auto_182488 ?auto_182494 ) ) ( not ( = ?auto_182490 ?auto_182494 ) ) ( not ( = ?auto_182493 ?auto_182494 ) ) ( not ( = ?auto_182495 ?auto_182494 ) ) ( not ( = ?auto_182492 ?auto_182494 ) ) ( not ( = ?auto_182491 ?auto_182494 ) ) ( not ( = ?auto_182489 ?auto_182494 ) ) ( ON ?auto_182491 ?auto_182492 ) ( ON-TABLE ?auto_182494 ) ( ON ?auto_182489 ?auto_182491 ) ( ON ?auto_182495 ?auto_182489 ) ( ON ?auto_182493 ?auto_182495 ) ( ON ?auto_182490 ?auto_182493 ) ( ON ?auto_182488 ?auto_182490 ) ( CLEAR ?auto_182488 ) ( HOLDING ?auto_182487 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182487 )
      ( MAKE-2PILE ?auto_182487 ?auto_182488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182496 - BLOCK
      ?auto_182497 - BLOCK
    )
    :vars
    (
      ?auto_182501 - BLOCK
      ?auto_182502 - BLOCK
      ?auto_182499 - BLOCK
      ?auto_182503 - BLOCK
      ?auto_182498 - BLOCK
      ?auto_182504 - BLOCK
      ?auto_182500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182496 ?auto_182497 ) ) ( not ( = ?auto_182496 ?auto_182501 ) ) ( not ( = ?auto_182497 ?auto_182501 ) ) ( not ( = ?auto_182496 ?auto_182502 ) ) ( not ( = ?auto_182496 ?auto_182499 ) ) ( not ( = ?auto_182497 ?auto_182502 ) ) ( not ( = ?auto_182497 ?auto_182499 ) ) ( not ( = ?auto_182501 ?auto_182502 ) ) ( not ( = ?auto_182501 ?auto_182499 ) ) ( not ( = ?auto_182502 ?auto_182499 ) ) ( not ( = ?auto_182503 ?auto_182498 ) ) ( not ( = ?auto_182503 ?auto_182504 ) ) ( not ( = ?auto_182503 ?auto_182499 ) ) ( not ( = ?auto_182498 ?auto_182504 ) ) ( not ( = ?auto_182498 ?auto_182499 ) ) ( not ( = ?auto_182504 ?auto_182499 ) ) ( not ( = ?auto_182496 ?auto_182504 ) ) ( not ( = ?auto_182496 ?auto_182503 ) ) ( not ( = ?auto_182496 ?auto_182498 ) ) ( not ( = ?auto_182497 ?auto_182504 ) ) ( not ( = ?auto_182497 ?auto_182503 ) ) ( not ( = ?auto_182497 ?auto_182498 ) ) ( not ( = ?auto_182501 ?auto_182504 ) ) ( not ( = ?auto_182501 ?auto_182503 ) ) ( not ( = ?auto_182501 ?auto_182498 ) ) ( not ( = ?auto_182502 ?auto_182504 ) ) ( not ( = ?auto_182502 ?auto_182503 ) ) ( not ( = ?auto_182502 ?auto_182498 ) ) ( ON ?auto_182503 ?auto_182500 ) ( not ( = ?auto_182496 ?auto_182500 ) ) ( not ( = ?auto_182497 ?auto_182500 ) ) ( not ( = ?auto_182501 ?auto_182500 ) ) ( not ( = ?auto_182502 ?auto_182500 ) ) ( not ( = ?auto_182499 ?auto_182500 ) ) ( not ( = ?auto_182503 ?auto_182500 ) ) ( not ( = ?auto_182498 ?auto_182500 ) ) ( not ( = ?auto_182504 ?auto_182500 ) ) ( ON ?auto_182498 ?auto_182503 ) ( ON-TABLE ?auto_182500 ) ( ON ?auto_182504 ?auto_182498 ) ( ON ?auto_182499 ?auto_182504 ) ( ON ?auto_182502 ?auto_182499 ) ( ON ?auto_182501 ?auto_182502 ) ( ON ?auto_182497 ?auto_182501 ) ( ON ?auto_182496 ?auto_182497 ) ( CLEAR ?auto_182496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182500 ?auto_182503 ?auto_182498 ?auto_182504 ?auto_182499 ?auto_182502 ?auto_182501 ?auto_182497 )
      ( MAKE-2PILE ?auto_182496 ?auto_182497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182511 - BLOCK
      ?auto_182512 - BLOCK
      ?auto_182513 - BLOCK
      ?auto_182514 - BLOCK
      ?auto_182515 - BLOCK
      ?auto_182516 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_182516 ) ( CLEAR ?auto_182515 ) ( ON-TABLE ?auto_182511 ) ( ON ?auto_182512 ?auto_182511 ) ( ON ?auto_182513 ?auto_182512 ) ( ON ?auto_182514 ?auto_182513 ) ( ON ?auto_182515 ?auto_182514 ) ( not ( = ?auto_182511 ?auto_182512 ) ) ( not ( = ?auto_182511 ?auto_182513 ) ) ( not ( = ?auto_182511 ?auto_182514 ) ) ( not ( = ?auto_182511 ?auto_182515 ) ) ( not ( = ?auto_182511 ?auto_182516 ) ) ( not ( = ?auto_182512 ?auto_182513 ) ) ( not ( = ?auto_182512 ?auto_182514 ) ) ( not ( = ?auto_182512 ?auto_182515 ) ) ( not ( = ?auto_182512 ?auto_182516 ) ) ( not ( = ?auto_182513 ?auto_182514 ) ) ( not ( = ?auto_182513 ?auto_182515 ) ) ( not ( = ?auto_182513 ?auto_182516 ) ) ( not ( = ?auto_182514 ?auto_182515 ) ) ( not ( = ?auto_182514 ?auto_182516 ) ) ( not ( = ?auto_182515 ?auto_182516 ) ) )
    :subtasks
    ( ( !STACK ?auto_182516 ?auto_182515 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182517 - BLOCK
      ?auto_182518 - BLOCK
      ?auto_182519 - BLOCK
      ?auto_182520 - BLOCK
      ?auto_182521 - BLOCK
      ?auto_182522 - BLOCK
    )
    :vars
    (
      ?auto_182523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_182521 ) ( ON-TABLE ?auto_182517 ) ( ON ?auto_182518 ?auto_182517 ) ( ON ?auto_182519 ?auto_182518 ) ( ON ?auto_182520 ?auto_182519 ) ( ON ?auto_182521 ?auto_182520 ) ( not ( = ?auto_182517 ?auto_182518 ) ) ( not ( = ?auto_182517 ?auto_182519 ) ) ( not ( = ?auto_182517 ?auto_182520 ) ) ( not ( = ?auto_182517 ?auto_182521 ) ) ( not ( = ?auto_182517 ?auto_182522 ) ) ( not ( = ?auto_182518 ?auto_182519 ) ) ( not ( = ?auto_182518 ?auto_182520 ) ) ( not ( = ?auto_182518 ?auto_182521 ) ) ( not ( = ?auto_182518 ?auto_182522 ) ) ( not ( = ?auto_182519 ?auto_182520 ) ) ( not ( = ?auto_182519 ?auto_182521 ) ) ( not ( = ?auto_182519 ?auto_182522 ) ) ( not ( = ?auto_182520 ?auto_182521 ) ) ( not ( = ?auto_182520 ?auto_182522 ) ) ( not ( = ?auto_182521 ?auto_182522 ) ) ( ON ?auto_182522 ?auto_182523 ) ( CLEAR ?auto_182522 ) ( HAND-EMPTY ) ( not ( = ?auto_182517 ?auto_182523 ) ) ( not ( = ?auto_182518 ?auto_182523 ) ) ( not ( = ?auto_182519 ?auto_182523 ) ) ( not ( = ?auto_182520 ?auto_182523 ) ) ( not ( = ?auto_182521 ?auto_182523 ) ) ( not ( = ?auto_182522 ?auto_182523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182522 ?auto_182523 )
      ( MAKE-6PILE ?auto_182517 ?auto_182518 ?auto_182519 ?auto_182520 ?auto_182521 ?auto_182522 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182524 - BLOCK
      ?auto_182525 - BLOCK
      ?auto_182526 - BLOCK
      ?auto_182527 - BLOCK
      ?auto_182528 - BLOCK
      ?auto_182529 - BLOCK
    )
    :vars
    (
      ?auto_182530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182524 ) ( ON ?auto_182525 ?auto_182524 ) ( ON ?auto_182526 ?auto_182525 ) ( ON ?auto_182527 ?auto_182526 ) ( not ( = ?auto_182524 ?auto_182525 ) ) ( not ( = ?auto_182524 ?auto_182526 ) ) ( not ( = ?auto_182524 ?auto_182527 ) ) ( not ( = ?auto_182524 ?auto_182528 ) ) ( not ( = ?auto_182524 ?auto_182529 ) ) ( not ( = ?auto_182525 ?auto_182526 ) ) ( not ( = ?auto_182525 ?auto_182527 ) ) ( not ( = ?auto_182525 ?auto_182528 ) ) ( not ( = ?auto_182525 ?auto_182529 ) ) ( not ( = ?auto_182526 ?auto_182527 ) ) ( not ( = ?auto_182526 ?auto_182528 ) ) ( not ( = ?auto_182526 ?auto_182529 ) ) ( not ( = ?auto_182527 ?auto_182528 ) ) ( not ( = ?auto_182527 ?auto_182529 ) ) ( not ( = ?auto_182528 ?auto_182529 ) ) ( ON ?auto_182529 ?auto_182530 ) ( CLEAR ?auto_182529 ) ( not ( = ?auto_182524 ?auto_182530 ) ) ( not ( = ?auto_182525 ?auto_182530 ) ) ( not ( = ?auto_182526 ?auto_182530 ) ) ( not ( = ?auto_182527 ?auto_182530 ) ) ( not ( = ?auto_182528 ?auto_182530 ) ) ( not ( = ?auto_182529 ?auto_182530 ) ) ( HOLDING ?auto_182528 ) ( CLEAR ?auto_182527 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182524 ?auto_182525 ?auto_182526 ?auto_182527 ?auto_182528 )
      ( MAKE-6PILE ?auto_182524 ?auto_182525 ?auto_182526 ?auto_182527 ?auto_182528 ?auto_182529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182531 - BLOCK
      ?auto_182532 - BLOCK
      ?auto_182533 - BLOCK
      ?auto_182534 - BLOCK
      ?auto_182535 - BLOCK
      ?auto_182536 - BLOCK
    )
    :vars
    (
      ?auto_182537 - BLOCK
      ?auto_182538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182531 ) ( ON ?auto_182532 ?auto_182531 ) ( ON ?auto_182533 ?auto_182532 ) ( ON ?auto_182534 ?auto_182533 ) ( not ( = ?auto_182531 ?auto_182532 ) ) ( not ( = ?auto_182531 ?auto_182533 ) ) ( not ( = ?auto_182531 ?auto_182534 ) ) ( not ( = ?auto_182531 ?auto_182535 ) ) ( not ( = ?auto_182531 ?auto_182536 ) ) ( not ( = ?auto_182532 ?auto_182533 ) ) ( not ( = ?auto_182532 ?auto_182534 ) ) ( not ( = ?auto_182532 ?auto_182535 ) ) ( not ( = ?auto_182532 ?auto_182536 ) ) ( not ( = ?auto_182533 ?auto_182534 ) ) ( not ( = ?auto_182533 ?auto_182535 ) ) ( not ( = ?auto_182533 ?auto_182536 ) ) ( not ( = ?auto_182534 ?auto_182535 ) ) ( not ( = ?auto_182534 ?auto_182536 ) ) ( not ( = ?auto_182535 ?auto_182536 ) ) ( ON ?auto_182536 ?auto_182537 ) ( not ( = ?auto_182531 ?auto_182537 ) ) ( not ( = ?auto_182532 ?auto_182537 ) ) ( not ( = ?auto_182533 ?auto_182537 ) ) ( not ( = ?auto_182534 ?auto_182537 ) ) ( not ( = ?auto_182535 ?auto_182537 ) ) ( not ( = ?auto_182536 ?auto_182537 ) ) ( CLEAR ?auto_182534 ) ( ON ?auto_182535 ?auto_182536 ) ( CLEAR ?auto_182535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182538 ) ( ON ?auto_182537 ?auto_182538 ) ( not ( = ?auto_182538 ?auto_182537 ) ) ( not ( = ?auto_182538 ?auto_182536 ) ) ( not ( = ?auto_182538 ?auto_182535 ) ) ( not ( = ?auto_182531 ?auto_182538 ) ) ( not ( = ?auto_182532 ?auto_182538 ) ) ( not ( = ?auto_182533 ?auto_182538 ) ) ( not ( = ?auto_182534 ?auto_182538 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182538 ?auto_182537 ?auto_182536 )
      ( MAKE-6PILE ?auto_182531 ?auto_182532 ?auto_182533 ?auto_182534 ?auto_182535 ?auto_182536 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182539 - BLOCK
      ?auto_182540 - BLOCK
      ?auto_182541 - BLOCK
      ?auto_182542 - BLOCK
      ?auto_182543 - BLOCK
      ?auto_182544 - BLOCK
    )
    :vars
    (
      ?auto_182545 - BLOCK
      ?auto_182546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182539 ) ( ON ?auto_182540 ?auto_182539 ) ( ON ?auto_182541 ?auto_182540 ) ( not ( = ?auto_182539 ?auto_182540 ) ) ( not ( = ?auto_182539 ?auto_182541 ) ) ( not ( = ?auto_182539 ?auto_182542 ) ) ( not ( = ?auto_182539 ?auto_182543 ) ) ( not ( = ?auto_182539 ?auto_182544 ) ) ( not ( = ?auto_182540 ?auto_182541 ) ) ( not ( = ?auto_182540 ?auto_182542 ) ) ( not ( = ?auto_182540 ?auto_182543 ) ) ( not ( = ?auto_182540 ?auto_182544 ) ) ( not ( = ?auto_182541 ?auto_182542 ) ) ( not ( = ?auto_182541 ?auto_182543 ) ) ( not ( = ?auto_182541 ?auto_182544 ) ) ( not ( = ?auto_182542 ?auto_182543 ) ) ( not ( = ?auto_182542 ?auto_182544 ) ) ( not ( = ?auto_182543 ?auto_182544 ) ) ( ON ?auto_182544 ?auto_182545 ) ( not ( = ?auto_182539 ?auto_182545 ) ) ( not ( = ?auto_182540 ?auto_182545 ) ) ( not ( = ?auto_182541 ?auto_182545 ) ) ( not ( = ?auto_182542 ?auto_182545 ) ) ( not ( = ?auto_182543 ?auto_182545 ) ) ( not ( = ?auto_182544 ?auto_182545 ) ) ( ON ?auto_182543 ?auto_182544 ) ( CLEAR ?auto_182543 ) ( ON-TABLE ?auto_182546 ) ( ON ?auto_182545 ?auto_182546 ) ( not ( = ?auto_182546 ?auto_182545 ) ) ( not ( = ?auto_182546 ?auto_182544 ) ) ( not ( = ?auto_182546 ?auto_182543 ) ) ( not ( = ?auto_182539 ?auto_182546 ) ) ( not ( = ?auto_182540 ?auto_182546 ) ) ( not ( = ?auto_182541 ?auto_182546 ) ) ( not ( = ?auto_182542 ?auto_182546 ) ) ( HOLDING ?auto_182542 ) ( CLEAR ?auto_182541 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182539 ?auto_182540 ?auto_182541 ?auto_182542 )
      ( MAKE-6PILE ?auto_182539 ?auto_182540 ?auto_182541 ?auto_182542 ?auto_182543 ?auto_182544 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182547 - BLOCK
      ?auto_182548 - BLOCK
      ?auto_182549 - BLOCK
      ?auto_182550 - BLOCK
      ?auto_182551 - BLOCK
      ?auto_182552 - BLOCK
    )
    :vars
    (
      ?auto_182553 - BLOCK
      ?auto_182554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182547 ) ( ON ?auto_182548 ?auto_182547 ) ( ON ?auto_182549 ?auto_182548 ) ( not ( = ?auto_182547 ?auto_182548 ) ) ( not ( = ?auto_182547 ?auto_182549 ) ) ( not ( = ?auto_182547 ?auto_182550 ) ) ( not ( = ?auto_182547 ?auto_182551 ) ) ( not ( = ?auto_182547 ?auto_182552 ) ) ( not ( = ?auto_182548 ?auto_182549 ) ) ( not ( = ?auto_182548 ?auto_182550 ) ) ( not ( = ?auto_182548 ?auto_182551 ) ) ( not ( = ?auto_182548 ?auto_182552 ) ) ( not ( = ?auto_182549 ?auto_182550 ) ) ( not ( = ?auto_182549 ?auto_182551 ) ) ( not ( = ?auto_182549 ?auto_182552 ) ) ( not ( = ?auto_182550 ?auto_182551 ) ) ( not ( = ?auto_182550 ?auto_182552 ) ) ( not ( = ?auto_182551 ?auto_182552 ) ) ( ON ?auto_182552 ?auto_182553 ) ( not ( = ?auto_182547 ?auto_182553 ) ) ( not ( = ?auto_182548 ?auto_182553 ) ) ( not ( = ?auto_182549 ?auto_182553 ) ) ( not ( = ?auto_182550 ?auto_182553 ) ) ( not ( = ?auto_182551 ?auto_182553 ) ) ( not ( = ?auto_182552 ?auto_182553 ) ) ( ON ?auto_182551 ?auto_182552 ) ( ON-TABLE ?auto_182554 ) ( ON ?auto_182553 ?auto_182554 ) ( not ( = ?auto_182554 ?auto_182553 ) ) ( not ( = ?auto_182554 ?auto_182552 ) ) ( not ( = ?auto_182554 ?auto_182551 ) ) ( not ( = ?auto_182547 ?auto_182554 ) ) ( not ( = ?auto_182548 ?auto_182554 ) ) ( not ( = ?auto_182549 ?auto_182554 ) ) ( not ( = ?auto_182550 ?auto_182554 ) ) ( CLEAR ?auto_182549 ) ( ON ?auto_182550 ?auto_182551 ) ( CLEAR ?auto_182550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182554 ?auto_182553 ?auto_182552 ?auto_182551 )
      ( MAKE-6PILE ?auto_182547 ?auto_182548 ?auto_182549 ?auto_182550 ?auto_182551 ?auto_182552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182555 - BLOCK
      ?auto_182556 - BLOCK
      ?auto_182557 - BLOCK
      ?auto_182558 - BLOCK
      ?auto_182559 - BLOCK
      ?auto_182560 - BLOCK
    )
    :vars
    (
      ?auto_182561 - BLOCK
      ?auto_182562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182555 ) ( ON ?auto_182556 ?auto_182555 ) ( not ( = ?auto_182555 ?auto_182556 ) ) ( not ( = ?auto_182555 ?auto_182557 ) ) ( not ( = ?auto_182555 ?auto_182558 ) ) ( not ( = ?auto_182555 ?auto_182559 ) ) ( not ( = ?auto_182555 ?auto_182560 ) ) ( not ( = ?auto_182556 ?auto_182557 ) ) ( not ( = ?auto_182556 ?auto_182558 ) ) ( not ( = ?auto_182556 ?auto_182559 ) ) ( not ( = ?auto_182556 ?auto_182560 ) ) ( not ( = ?auto_182557 ?auto_182558 ) ) ( not ( = ?auto_182557 ?auto_182559 ) ) ( not ( = ?auto_182557 ?auto_182560 ) ) ( not ( = ?auto_182558 ?auto_182559 ) ) ( not ( = ?auto_182558 ?auto_182560 ) ) ( not ( = ?auto_182559 ?auto_182560 ) ) ( ON ?auto_182560 ?auto_182561 ) ( not ( = ?auto_182555 ?auto_182561 ) ) ( not ( = ?auto_182556 ?auto_182561 ) ) ( not ( = ?auto_182557 ?auto_182561 ) ) ( not ( = ?auto_182558 ?auto_182561 ) ) ( not ( = ?auto_182559 ?auto_182561 ) ) ( not ( = ?auto_182560 ?auto_182561 ) ) ( ON ?auto_182559 ?auto_182560 ) ( ON-TABLE ?auto_182562 ) ( ON ?auto_182561 ?auto_182562 ) ( not ( = ?auto_182562 ?auto_182561 ) ) ( not ( = ?auto_182562 ?auto_182560 ) ) ( not ( = ?auto_182562 ?auto_182559 ) ) ( not ( = ?auto_182555 ?auto_182562 ) ) ( not ( = ?auto_182556 ?auto_182562 ) ) ( not ( = ?auto_182557 ?auto_182562 ) ) ( not ( = ?auto_182558 ?auto_182562 ) ) ( ON ?auto_182558 ?auto_182559 ) ( CLEAR ?auto_182558 ) ( HOLDING ?auto_182557 ) ( CLEAR ?auto_182556 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182555 ?auto_182556 ?auto_182557 )
      ( MAKE-6PILE ?auto_182555 ?auto_182556 ?auto_182557 ?auto_182558 ?auto_182559 ?auto_182560 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182563 - BLOCK
      ?auto_182564 - BLOCK
      ?auto_182565 - BLOCK
      ?auto_182566 - BLOCK
      ?auto_182567 - BLOCK
      ?auto_182568 - BLOCK
    )
    :vars
    (
      ?auto_182570 - BLOCK
      ?auto_182569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182563 ) ( ON ?auto_182564 ?auto_182563 ) ( not ( = ?auto_182563 ?auto_182564 ) ) ( not ( = ?auto_182563 ?auto_182565 ) ) ( not ( = ?auto_182563 ?auto_182566 ) ) ( not ( = ?auto_182563 ?auto_182567 ) ) ( not ( = ?auto_182563 ?auto_182568 ) ) ( not ( = ?auto_182564 ?auto_182565 ) ) ( not ( = ?auto_182564 ?auto_182566 ) ) ( not ( = ?auto_182564 ?auto_182567 ) ) ( not ( = ?auto_182564 ?auto_182568 ) ) ( not ( = ?auto_182565 ?auto_182566 ) ) ( not ( = ?auto_182565 ?auto_182567 ) ) ( not ( = ?auto_182565 ?auto_182568 ) ) ( not ( = ?auto_182566 ?auto_182567 ) ) ( not ( = ?auto_182566 ?auto_182568 ) ) ( not ( = ?auto_182567 ?auto_182568 ) ) ( ON ?auto_182568 ?auto_182570 ) ( not ( = ?auto_182563 ?auto_182570 ) ) ( not ( = ?auto_182564 ?auto_182570 ) ) ( not ( = ?auto_182565 ?auto_182570 ) ) ( not ( = ?auto_182566 ?auto_182570 ) ) ( not ( = ?auto_182567 ?auto_182570 ) ) ( not ( = ?auto_182568 ?auto_182570 ) ) ( ON ?auto_182567 ?auto_182568 ) ( ON-TABLE ?auto_182569 ) ( ON ?auto_182570 ?auto_182569 ) ( not ( = ?auto_182569 ?auto_182570 ) ) ( not ( = ?auto_182569 ?auto_182568 ) ) ( not ( = ?auto_182569 ?auto_182567 ) ) ( not ( = ?auto_182563 ?auto_182569 ) ) ( not ( = ?auto_182564 ?auto_182569 ) ) ( not ( = ?auto_182565 ?auto_182569 ) ) ( not ( = ?auto_182566 ?auto_182569 ) ) ( ON ?auto_182566 ?auto_182567 ) ( CLEAR ?auto_182564 ) ( ON ?auto_182565 ?auto_182566 ) ( CLEAR ?auto_182565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182569 ?auto_182570 ?auto_182568 ?auto_182567 ?auto_182566 )
      ( MAKE-6PILE ?auto_182563 ?auto_182564 ?auto_182565 ?auto_182566 ?auto_182567 ?auto_182568 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182571 - BLOCK
      ?auto_182572 - BLOCK
      ?auto_182573 - BLOCK
      ?auto_182574 - BLOCK
      ?auto_182575 - BLOCK
      ?auto_182576 - BLOCK
    )
    :vars
    (
      ?auto_182577 - BLOCK
      ?auto_182578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182571 ) ( not ( = ?auto_182571 ?auto_182572 ) ) ( not ( = ?auto_182571 ?auto_182573 ) ) ( not ( = ?auto_182571 ?auto_182574 ) ) ( not ( = ?auto_182571 ?auto_182575 ) ) ( not ( = ?auto_182571 ?auto_182576 ) ) ( not ( = ?auto_182572 ?auto_182573 ) ) ( not ( = ?auto_182572 ?auto_182574 ) ) ( not ( = ?auto_182572 ?auto_182575 ) ) ( not ( = ?auto_182572 ?auto_182576 ) ) ( not ( = ?auto_182573 ?auto_182574 ) ) ( not ( = ?auto_182573 ?auto_182575 ) ) ( not ( = ?auto_182573 ?auto_182576 ) ) ( not ( = ?auto_182574 ?auto_182575 ) ) ( not ( = ?auto_182574 ?auto_182576 ) ) ( not ( = ?auto_182575 ?auto_182576 ) ) ( ON ?auto_182576 ?auto_182577 ) ( not ( = ?auto_182571 ?auto_182577 ) ) ( not ( = ?auto_182572 ?auto_182577 ) ) ( not ( = ?auto_182573 ?auto_182577 ) ) ( not ( = ?auto_182574 ?auto_182577 ) ) ( not ( = ?auto_182575 ?auto_182577 ) ) ( not ( = ?auto_182576 ?auto_182577 ) ) ( ON ?auto_182575 ?auto_182576 ) ( ON-TABLE ?auto_182578 ) ( ON ?auto_182577 ?auto_182578 ) ( not ( = ?auto_182578 ?auto_182577 ) ) ( not ( = ?auto_182578 ?auto_182576 ) ) ( not ( = ?auto_182578 ?auto_182575 ) ) ( not ( = ?auto_182571 ?auto_182578 ) ) ( not ( = ?auto_182572 ?auto_182578 ) ) ( not ( = ?auto_182573 ?auto_182578 ) ) ( not ( = ?auto_182574 ?auto_182578 ) ) ( ON ?auto_182574 ?auto_182575 ) ( ON ?auto_182573 ?auto_182574 ) ( CLEAR ?auto_182573 ) ( HOLDING ?auto_182572 ) ( CLEAR ?auto_182571 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182571 ?auto_182572 )
      ( MAKE-6PILE ?auto_182571 ?auto_182572 ?auto_182573 ?auto_182574 ?auto_182575 ?auto_182576 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182579 - BLOCK
      ?auto_182580 - BLOCK
      ?auto_182581 - BLOCK
      ?auto_182582 - BLOCK
      ?auto_182583 - BLOCK
      ?auto_182584 - BLOCK
    )
    :vars
    (
      ?auto_182586 - BLOCK
      ?auto_182585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182579 ) ( not ( = ?auto_182579 ?auto_182580 ) ) ( not ( = ?auto_182579 ?auto_182581 ) ) ( not ( = ?auto_182579 ?auto_182582 ) ) ( not ( = ?auto_182579 ?auto_182583 ) ) ( not ( = ?auto_182579 ?auto_182584 ) ) ( not ( = ?auto_182580 ?auto_182581 ) ) ( not ( = ?auto_182580 ?auto_182582 ) ) ( not ( = ?auto_182580 ?auto_182583 ) ) ( not ( = ?auto_182580 ?auto_182584 ) ) ( not ( = ?auto_182581 ?auto_182582 ) ) ( not ( = ?auto_182581 ?auto_182583 ) ) ( not ( = ?auto_182581 ?auto_182584 ) ) ( not ( = ?auto_182582 ?auto_182583 ) ) ( not ( = ?auto_182582 ?auto_182584 ) ) ( not ( = ?auto_182583 ?auto_182584 ) ) ( ON ?auto_182584 ?auto_182586 ) ( not ( = ?auto_182579 ?auto_182586 ) ) ( not ( = ?auto_182580 ?auto_182586 ) ) ( not ( = ?auto_182581 ?auto_182586 ) ) ( not ( = ?auto_182582 ?auto_182586 ) ) ( not ( = ?auto_182583 ?auto_182586 ) ) ( not ( = ?auto_182584 ?auto_182586 ) ) ( ON ?auto_182583 ?auto_182584 ) ( ON-TABLE ?auto_182585 ) ( ON ?auto_182586 ?auto_182585 ) ( not ( = ?auto_182585 ?auto_182586 ) ) ( not ( = ?auto_182585 ?auto_182584 ) ) ( not ( = ?auto_182585 ?auto_182583 ) ) ( not ( = ?auto_182579 ?auto_182585 ) ) ( not ( = ?auto_182580 ?auto_182585 ) ) ( not ( = ?auto_182581 ?auto_182585 ) ) ( not ( = ?auto_182582 ?auto_182585 ) ) ( ON ?auto_182582 ?auto_182583 ) ( ON ?auto_182581 ?auto_182582 ) ( CLEAR ?auto_182579 ) ( ON ?auto_182580 ?auto_182581 ) ( CLEAR ?auto_182580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182585 ?auto_182586 ?auto_182584 ?auto_182583 ?auto_182582 ?auto_182581 )
      ( MAKE-6PILE ?auto_182579 ?auto_182580 ?auto_182581 ?auto_182582 ?auto_182583 ?auto_182584 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182587 - BLOCK
      ?auto_182588 - BLOCK
      ?auto_182589 - BLOCK
      ?auto_182590 - BLOCK
      ?auto_182591 - BLOCK
      ?auto_182592 - BLOCK
    )
    :vars
    (
      ?auto_182594 - BLOCK
      ?auto_182593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182587 ?auto_182588 ) ) ( not ( = ?auto_182587 ?auto_182589 ) ) ( not ( = ?auto_182587 ?auto_182590 ) ) ( not ( = ?auto_182587 ?auto_182591 ) ) ( not ( = ?auto_182587 ?auto_182592 ) ) ( not ( = ?auto_182588 ?auto_182589 ) ) ( not ( = ?auto_182588 ?auto_182590 ) ) ( not ( = ?auto_182588 ?auto_182591 ) ) ( not ( = ?auto_182588 ?auto_182592 ) ) ( not ( = ?auto_182589 ?auto_182590 ) ) ( not ( = ?auto_182589 ?auto_182591 ) ) ( not ( = ?auto_182589 ?auto_182592 ) ) ( not ( = ?auto_182590 ?auto_182591 ) ) ( not ( = ?auto_182590 ?auto_182592 ) ) ( not ( = ?auto_182591 ?auto_182592 ) ) ( ON ?auto_182592 ?auto_182594 ) ( not ( = ?auto_182587 ?auto_182594 ) ) ( not ( = ?auto_182588 ?auto_182594 ) ) ( not ( = ?auto_182589 ?auto_182594 ) ) ( not ( = ?auto_182590 ?auto_182594 ) ) ( not ( = ?auto_182591 ?auto_182594 ) ) ( not ( = ?auto_182592 ?auto_182594 ) ) ( ON ?auto_182591 ?auto_182592 ) ( ON-TABLE ?auto_182593 ) ( ON ?auto_182594 ?auto_182593 ) ( not ( = ?auto_182593 ?auto_182594 ) ) ( not ( = ?auto_182593 ?auto_182592 ) ) ( not ( = ?auto_182593 ?auto_182591 ) ) ( not ( = ?auto_182587 ?auto_182593 ) ) ( not ( = ?auto_182588 ?auto_182593 ) ) ( not ( = ?auto_182589 ?auto_182593 ) ) ( not ( = ?auto_182590 ?auto_182593 ) ) ( ON ?auto_182590 ?auto_182591 ) ( ON ?auto_182589 ?auto_182590 ) ( ON ?auto_182588 ?auto_182589 ) ( CLEAR ?auto_182588 ) ( HOLDING ?auto_182587 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182587 )
      ( MAKE-6PILE ?auto_182587 ?auto_182588 ?auto_182589 ?auto_182590 ?auto_182591 ?auto_182592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182595 - BLOCK
      ?auto_182596 - BLOCK
      ?auto_182597 - BLOCK
      ?auto_182598 - BLOCK
      ?auto_182599 - BLOCK
      ?auto_182600 - BLOCK
    )
    :vars
    (
      ?auto_182601 - BLOCK
      ?auto_182602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182595 ?auto_182596 ) ) ( not ( = ?auto_182595 ?auto_182597 ) ) ( not ( = ?auto_182595 ?auto_182598 ) ) ( not ( = ?auto_182595 ?auto_182599 ) ) ( not ( = ?auto_182595 ?auto_182600 ) ) ( not ( = ?auto_182596 ?auto_182597 ) ) ( not ( = ?auto_182596 ?auto_182598 ) ) ( not ( = ?auto_182596 ?auto_182599 ) ) ( not ( = ?auto_182596 ?auto_182600 ) ) ( not ( = ?auto_182597 ?auto_182598 ) ) ( not ( = ?auto_182597 ?auto_182599 ) ) ( not ( = ?auto_182597 ?auto_182600 ) ) ( not ( = ?auto_182598 ?auto_182599 ) ) ( not ( = ?auto_182598 ?auto_182600 ) ) ( not ( = ?auto_182599 ?auto_182600 ) ) ( ON ?auto_182600 ?auto_182601 ) ( not ( = ?auto_182595 ?auto_182601 ) ) ( not ( = ?auto_182596 ?auto_182601 ) ) ( not ( = ?auto_182597 ?auto_182601 ) ) ( not ( = ?auto_182598 ?auto_182601 ) ) ( not ( = ?auto_182599 ?auto_182601 ) ) ( not ( = ?auto_182600 ?auto_182601 ) ) ( ON ?auto_182599 ?auto_182600 ) ( ON-TABLE ?auto_182602 ) ( ON ?auto_182601 ?auto_182602 ) ( not ( = ?auto_182602 ?auto_182601 ) ) ( not ( = ?auto_182602 ?auto_182600 ) ) ( not ( = ?auto_182602 ?auto_182599 ) ) ( not ( = ?auto_182595 ?auto_182602 ) ) ( not ( = ?auto_182596 ?auto_182602 ) ) ( not ( = ?auto_182597 ?auto_182602 ) ) ( not ( = ?auto_182598 ?auto_182602 ) ) ( ON ?auto_182598 ?auto_182599 ) ( ON ?auto_182597 ?auto_182598 ) ( ON ?auto_182596 ?auto_182597 ) ( ON ?auto_182595 ?auto_182596 ) ( CLEAR ?auto_182595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182602 ?auto_182601 ?auto_182600 ?auto_182599 ?auto_182598 ?auto_182597 ?auto_182596 )
      ( MAKE-6PILE ?auto_182595 ?auto_182596 ?auto_182597 ?auto_182598 ?auto_182599 ?auto_182600 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182603 - BLOCK
      ?auto_182604 - BLOCK
      ?auto_182605 - BLOCK
      ?auto_182606 - BLOCK
      ?auto_182607 - BLOCK
      ?auto_182608 - BLOCK
    )
    :vars
    (
      ?auto_182609 - BLOCK
      ?auto_182610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182603 ?auto_182604 ) ) ( not ( = ?auto_182603 ?auto_182605 ) ) ( not ( = ?auto_182603 ?auto_182606 ) ) ( not ( = ?auto_182603 ?auto_182607 ) ) ( not ( = ?auto_182603 ?auto_182608 ) ) ( not ( = ?auto_182604 ?auto_182605 ) ) ( not ( = ?auto_182604 ?auto_182606 ) ) ( not ( = ?auto_182604 ?auto_182607 ) ) ( not ( = ?auto_182604 ?auto_182608 ) ) ( not ( = ?auto_182605 ?auto_182606 ) ) ( not ( = ?auto_182605 ?auto_182607 ) ) ( not ( = ?auto_182605 ?auto_182608 ) ) ( not ( = ?auto_182606 ?auto_182607 ) ) ( not ( = ?auto_182606 ?auto_182608 ) ) ( not ( = ?auto_182607 ?auto_182608 ) ) ( ON ?auto_182608 ?auto_182609 ) ( not ( = ?auto_182603 ?auto_182609 ) ) ( not ( = ?auto_182604 ?auto_182609 ) ) ( not ( = ?auto_182605 ?auto_182609 ) ) ( not ( = ?auto_182606 ?auto_182609 ) ) ( not ( = ?auto_182607 ?auto_182609 ) ) ( not ( = ?auto_182608 ?auto_182609 ) ) ( ON ?auto_182607 ?auto_182608 ) ( ON-TABLE ?auto_182610 ) ( ON ?auto_182609 ?auto_182610 ) ( not ( = ?auto_182610 ?auto_182609 ) ) ( not ( = ?auto_182610 ?auto_182608 ) ) ( not ( = ?auto_182610 ?auto_182607 ) ) ( not ( = ?auto_182603 ?auto_182610 ) ) ( not ( = ?auto_182604 ?auto_182610 ) ) ( not ( = ?auto_182605 ?auto_182610 ) ) ( not ( = ?auto_182606 ?auto_182610 ) ) ( ON ?auto_182606 ?auto_182607 ) ( ON ?auto_182605 ?auto_182606 ) ( ON ?auto_182604 ?auto_182605 ) ( HOLDING ?auto_182603 ) ( CLEAR ?auto_182604 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182610 ?auto_182609 ?auto_182608 ?auto_182607 ?auto_182606 ?auto_182605 ?auto_182604 ?auto_182603 )
      ( MAKE-6PILE ?auto_182603 ?auto_182604 ?auto_182605 ?auto_182606 ?auto_182607 ?auto_182608 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182611 - BLOCK
      ?auto_182612 - BLOCK
      ?auto_182613 - BLOCK
      ?auto_182614 - BLOCK
      ?auto_182615 - BLOCK
      ?auto_182616 - BLOCK
    )
    :vars
    (
      ?auto_182618 - BLOCK
      ?auto_182617 - BLOCK
      ?auto_182619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182611 ?auto_182612 ) ) ( not ( = ?auto_182611 ?auto_182613 ) ) ( not ( = ?auto_182611 ?auto_182614 ) ) ( not ( = ?auto_182611 ?auto_182615 ) ) ( not ( = ?auto_182611 ?auto_182616 ) ) ( not ( = ?auto_182612 ?auto_182613 ) ) ( not ( = ?auto_182612 ?auto_182614 ) ) ( not ( = ?auto_182612 ?auto_182615 ) ) ( not ( = ?auto_182612 ?auto_182616 ) ) ( not ( = ?auto_182613 ?auto_182614 ) ) ( not ( = ?auto_182613 ?auto_182615 ) ) ( not ( = ?auto_182613 ?auto_182616 ) ) ( not ( = ?auto_182614 ?auto_182615 ) ) ( not ( = ?auto_182614 ?auto_182616 ) ) ( not ( = ?auto_182615 ?auto_182616 ) ) ( ON ?auto_182616 ?auto_182618 ) ( not ( = ?auto_182611 ?auto_182618 ) ) ( not ( = ?auto_182612 ?auto_182618 ) ) ( not ( = ?auto_182613 ?auto_182618 ) ) ( not ( = ?auto_182614 ?auto_182618 ) ) ( not ( = ?auto_182615 ?auto_182618 ) ) ( not ( = ?auto_182616 ?auto_182618 ) ) ( ON ?auto_182615 ?auto_182616 ) ( ON-TABLE ?auto_182617 ) ( ON ?auto_182618 ?auto_182617 ) ( not ( = ?auto_182617 ?auto_182618 ) ) ( not ( = ?auto_182617 ?auto_182616 ) ) ( not ( = ?auto_182617 ?auto_182615 ) ) ( not ( = ?auto_182611 ?auto_182617 ) ) ( not ( = ?auto_182612 ?auto_182617 ) ) ( not ( = ?auto_182613 ?auto_182617 ) ) ( not ( = ?auto_182614 ?auto_182617 ) ) ( ON ?auto_182614 ?auto_182615 ) ( ON ?auto_182613 ?auto_182614 ) ( ON ?auto_182612 ?auto_182613 ) ( CLEAR ?auto_182612 ) ( ON ?auto_182611 ?auto_182619 ) ( CLEAR ?auto_182611 ) ( HAND-EMPTY ) ( not ( = ?auto_182611 ?auto_182619 ) ) ( not ( = ?auto_182612 ?auto_182619 ) ) ( not ( = ?auto_182613 ?auto_182619 ) ) ( not ( = ?auto_182614 ?auto_182619 ) ) ( not ( = ?auto_182615 ?auto_182619 ) ) ( not ( = ?auto_182616 ?auto_182619 ) ) ( not ( = ?auto_182618 ?auto_182619 ) ) ( not ( = ?auto_182617 ?auto_182619 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182611 ?auto_182619 )
      ( MAKE-6PILE ?auto_182611 ?auto_182612 ?auto_182613 ?auto_182614 ?auto_182615 ?auto_182616 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182620 - BLOCK
      ?auto_182621 - BLOCK
      ?auto_182622 - BLOCK
      ?auto_182623 - BLOCK
      ?auto_182624 - BLOCK
      ?auto_182625 - BLOCK
    )
    :vars
    (
      ?auto_182628 - BLOCK
      ?auto_182627 - BLOCK
      ?auto_182626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182620 ?auto_182621 ) ) ( not ( = ?auto_182620 ?auto_182622 ) ) ( not ( = ?auto_182620 ?auto_182623 ) ) ( not ( = ?auto_182620 ?auto_182624 ) ) ( not ( = ?auto_182620 ?auto_182625 ) ) ( not ( = ?auto_182621 ?auto_182622 ) ) ( not ( = ?auto_182621 ?auto_182623 ) ) ( not ( = ?auto_182621 ?auto_182624 ) ) ( not ( = ?auto_182621 ?auto_182625 ) ) ( not ( = ?auto_182622 ?auto_182623 ) ) ( not ( = ?auto_182622 ?auto_182624 ) ) ( not ( = ?auto_182622 ?auto_182625 ) ) ( not ( = ?auto_182623 ?auto_182624 ) ) ( not ( = ?auto_182623 ?auto_182625 ) ) ( not ( = ?auto_182624 ?auto_182625 ) ) ( ON ?auto_182625 ?auto_182628 ) ( not ( = ?auto_182620 ?auto_182628 ) ) ( not ( = ?auto_182621 ?auto_182628 ) ) ( not ( = ?auto_182622 ?auto_182628 ) ) ( not ( = ?auto_182623 ?auto_182628 ) ) ( not ( = ?auto_182624 ?auto_182628 ) ) ( not ( = ?auto_182625 ?auto_182628 ) ) ( ON ?auto_182624 ?auto_182625 ) ( ON-TABLE ?auto_182627 ) ( ON ?auto_182628 ?auto_182627 ) ( not ( = ?auto_182627 ?auto_182628 ) ) ( not ( = ?auto_182627 ?auto_182625 ) ) ( not ( = ?auto_182627 ?auto_182624 ) ) ( not ( = ?auto_182620 ?auto_182627 ) ) ( not ( = ?auto_182621 ?auto_182627 ) ) ( not ( = ?auto_182622 ?auto_182627 ) ) ( not ( = ?auto_182623 ?auto_182627 ) ) ( ON ?auto_182623 ?auto_182624 ) ( ON ?auto_182622 ?auto_182623 ) ( ON ?auto_182620 ?auto_182626 ) ( CLEAR ?auto_182620 ) ( not ( = ?auto_182620 ?auto_182626 ) ) ( not ( = ?auto_182621 ?auto_182626 ) ) ( not ( = ?auto_182622 ?auto_182626 ) ) ( not ( = ?auto_182623 ?auto_182626 ) ) ( not ( = ?auto_182624 ?auto_182626 ) ) ( not ( = ?auto_182625 ?auto_182626 ) ) ( not ( = ?auto_182628 ?auto_182626 ) ) ( not ( = ?auto_182627 ?auto_182626 ) ) ( HOLDING ?auto_182621 ) ( CLEAR ?auto_182622 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182627 ?auto_182628 ?auto_182625 ?auto_182624 ?auto_182623 ?auto_182622 ?auto_182621 )
      ( MAKE-6PILE ?auto_182620 ?auto_182621 ?auto_182622 ?auto_182623 ?auto_182624 ?auto_182625 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182629 - BLOCK
      ?auto_182630 - BLOCK
      ?auto_182631 - BLOCK
      ?auto_182632 - BLOCK
      ?auto_182633 - BLOCK
      ?auto_182634 - BLOCK
    )
    :vars
    (
      ?auto_182637 - BLOCK
      ?auto_182635 - BLOCK
      ?auto_182636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182629 ?auto_182630 ) ) ( not ( = ?auto_182629 ?auto_182631 ) ) ( not ( = ?auto_182629 ?auto_182632 ) ) ( not ( = ?auto_182629 ?auto_182633 ) ) ( not ( = ?auto_182629 ?auto_182634 ) ) ( not ( = ?auto_182630 ?auto_182631 ) ) ( not ( = ?auto_182630 ?auto_182632 ) ) ( not ( = ?auto_182630 ?auto_182633 ) ) ( not ( = ?auto_182630 ?auto_182634 ) ) ( not ( = ?auto_182631 ?auto_182632 ) ) ( not ( = ?auto_182631 ?auto_182633 ) ) ( not ( = ?auto_182631 ?auto_182634 ) ) ( not ( = ?auto_182632 ?auto_182633 ) ) ( not ( = ?auto_182632 ?auto_182634 ) ) ( not ( = ?auto_182633 ?auto_182634 ) ) ( ON ?auto_182634 ?auto_182637 ) ( not ( = ?auto_182629 ?auto_182637 ) ) ( not ( = ?auto_182630 ?auto_182637 ) ) ( not ( = ?auto_182631 ?auto_182637 ) ) ( not ( = ?auto_182632 ?auto_182637 ) ) ( not ( = ?auto_182633 ?auto_182637 ) ) ( not ( = ?auto_182634 ?auto_182637 ) ) ( ON ?auto_182633 ?auto_182634 ) ( ON-TABLE ?auto_182635 ) ( ON ?auto_182637 ?auto_182635 ) ( not ( = ?auto_182635 ?auto_182637 ) ) ( not ( = ?auto_182635 ?auto_182634 ) ) ( not ( = ?auto_182635 ?auto_182633 ) ) ( not ( = ?auto_182629 ?auto_182635 ) ) ( not ( = ?auto_182630 ?auto_182635 ) ) ( not ( = ?auto_182631 ?auto_182635 ) ) ( not ( = ?auto_182632 ?auto_182635 ) ) ( ON ?auto_182632 ?auto_182633 ) ( ON ?auto_182631 ?auto_182632 ) ( ON ?auto_182629 ?auto_182636 ) ( not ( = ?auto_182629 ?auto_182636 ) ) ( not ( = ?auto_182630 ?auto_182636 ) ) ( not ( = ?auto_182631 ?auto_182636 ) ) ( not ( = ?auto_182632 ?auto_182636 ) ) ( not ( = ?auto_182633 ?auto_182636 ) ) ( not ( = ?auto_182634 ?auto_182636 ) ) ( not ( = ?auto_182637 ?auto_182636 ) ) ( not ( = ?auto_182635 ?auto_182636 ) ) ( CLEAR ?auto_182631 ) ( ON ?auto_182630 ?auto_182629 ) ( CLEAR ?auto_182630 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182636 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182636 ?auto_182629 )
      ( MAKE-6PILE ?auto_182629 ?auto_182630 ?auto_182631 ?auto_182632 ?auto_182633 ?auto_182634 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182638 - BLOCK
      ?auto_182639 - BLOCK
      ?auto_182640 - BLOCK
      ?auto_182641 - BLOCK
      ?auto_182642 - BLOCK
      ?auto_182643 - BLOCK
    )
    :vars
    (
      ?auto_182645 - BLOCK
      ?auto_182644 - BLOCK
      ?auto_182646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182638 ?auto_182639 ) ) ( not ( = ?auto_182638 ?auto_182640 ) ) ( not ( = ?auto_182638 ?auto_182641 ) ) ( not ( = ?auto_182638 ?auto_182642 ) ) ( not ( = ?auto_182638 ?auto_182643 ) ) ( not ( = ?auto_182639 ?auto_182640 ) ) ( not ( = ?auto_182639 ?auto_182641 ) ) ( not ( = ?auto_182639 ?auto_182642 ) ) ( not ( = ?auto_182639 ?auto_182643 ) ) ( not ( = ?auto_182640 ?auto_182641 ) ) ( not ( = ?auto_182640 ?auto_182642 ) ) ( not ( = ?auto_182640 ?auto_182643 ) ) ( not ( = ?auto_182641 ?auto_182642 ) ) ( not ( = ?auto_182641 ?auto_182643 ) ) ( not ( = ?auto_182642 ?auto_182643 ) ) ( ON ?auto_182643 ?auto_182645 ) ( not ( = ?auto_182638 ?auto_182645 ) ) ( not ( = ?auto_182639 ?auto_182645 ) ) ( not ( = ?auto_182640 ?auto_182645 ) ) ( not ( = ?auto_182641 ?auto_182645 ) ) ( not ( = ?auto_182642 ?auto_182645 ) ) ( not ( = ?auto_182643 ?auto_182645 ) ) ( ON ?auto_182642 ?auto_182643 ) ( ON-TABLE ?auto_182644 ) ( ON ?auto_182645 ?auto_182644 ) ( not ( = ?auto_182644 ?auto_182645 ) ) ( not ( = ?auto_182644 ?auto_182643 ) ) ( not ( = ?auto_182644 ?auto_182642 ) ) ( not ( = ?auto_182638 ?auto_182644 ) ) ( not ( = ?auto_182639 ?auto_182644 ) ) ( not ( = ?auto_182640 ?auto_182644 ) ) ( not ( = ?auto_182641 ?auto_182644 ) ) ( ON ?auto_182641 ?auto_182642 ) ( ON ?auto_182638 ?auto_182646 ) ( not ( = ?auto_182638 ?auto_182646 ) ) ( not ( = ?auto_182639 ?auto_182646 ) ) ( not ( = ?auto_182640 ?auto_182646 ) ) ( not ( = ?auto_182641 ?auto_182646 ) ) ( not ( = ?auto_182642 ?auto_182646 ) ) ( not ( = ?auto_182643 ?auto_182646 ) ) ( not ( = ?auto_182645 ?auto_182646 ) ) ( not ( = ?auto_182644 ?auto_182646 ) ) ( ON ?auto_182639 ?auto_182638 ) ( CLEAR ?auto_182639 ) ( ON-TABLE ?auto_182646 ) ( HOLDING ?auto_182640 ) ( CLEAR ?auto_182641 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182644 ?auto_182645 ?auto_182643 ?auto_182642 ?auto_182641 ?auto_182640 )
      ( MAKE-6PILE ?auto_182638 ?auto_182639 ?auto_182640 ?auto_182641 ?auto_182642 ?auto_182643 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182647 - BLOCK
      ?auto_182648 - BLOCK
      ?auto_182649 - BLOCK
      ?auto_182650 - BLOCK
      ?auto_182651 - BLOCK
      ?auto_182652 - BLOCK
    )
    :vars
    (
      ?auto_182654 - BLOCK
      ?auto_182655 - BLOCK
      ?auto_182653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182647 ?auto_182648 ) ) ( not ( = ?auto_182647 ?auto_182649 ) ) ( not ( = ?auto_182647 ?auto_182650 ) ) ( not ( = ?auto_182647 ?auto_182651 ) ) ( not ( = ?auto_182647 ?auto_182652 ) ) ( not ( = ?auto_182648 ?auto_182649 ) ) ( not ( = ?auto_182648 ?auto_182650 ) ) ( not ( = ?auto_182648 ?auto_182651 ) ) ( not ( = ?auto_182648 ?auto_182652 ) ) ( not ( = ?auto_182649 ?auto_182650 ) ) ( not ( = ?auto_182649 ?auto_182651 ) ) ( not ( = ?auto_182649 ?auto_182652 ) ) ( not ( = ?auto_182650 ?auto_182651 ) ) ( not ( = ?auto_182650 ?auto_182652 ) ) ( not ( = ?auto_182651 ?auto_182652 ) ) ( ON ?auto_182652 ?auto_182654 ) ( not ( = ?auto_182647 ?auto_182654 ) ) ( not ( = ?auto_182648 ?auto_182654 ) ) ( not ( = ?auto_182649 ?auto_182654 ) ) ( not ( = ?auto_182650 ?auto_182654 ) ) ( not ( = ?auto_182651 ?auto_182654 ) ) ( not ( = ?auto_182652 ?auto_182654 ) ) ( ON ?auto_182651 ?auto_182652 ) ( ON-TABLE ?auto_182655 ) ( ON ?auto_182654 ?auto_182655 ) ( not ( = ?auto_182655 ?auto_182654 ) ) ( not ( = ?auto_182655 ?auto_182652 ) ) ( not ( = ?auto_182655 ?auto_182651 ) ) ( not ( = ?auto_182647 ?auto_182655 ) ) ( not ( = ?auto_182648 ?auto_182655 ) ) ( not ( = ?auto_182649 ?auto_182655 ) ) ( not ( = ?auto_182650 ?auto_182655 ) ) ( ON ?auto_182650 ?auto_182651 ) ( ON ?auto_182647 ?auto_182653 ) ( not ( = ?auto_182647 ?auto_182653 ) ) ( not ( = ?auto_182648 ?auto_182653 ) ) ( not ( = ?auto_182649 ?auto_182653 ) ) ( not ( = ?auto_182650 ?auto_182653 ) ) ( not ( = ?auto_182651 ?auto_182653 ) ) ( not ( = ?auto_182652 ?auto_182653 ) ) ( not ( = ?auto_182654 ?auto_182653 ) ) ( not ( = ?auto_182655 ?auto_182653 ) ) ( ON ?auto_182648 ?auto_182647 ) ( ON-TABLE ?auto_182653 ) ( CLEAR ?auto_182650 ) ( ON ?auto_182649 ?auto_182648 ) ( CLEAR ?auto_182649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182653 ?auto_182647 ?auto_182648 )
      ( MAKE-6PILE ?auto_182647 ?auto_182648 ?auto_182649 ?auto_182650 ?auto_182651 ?auto_182652 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182656 - BLOCK
      ?auto_182657 - BLOCK
      ?auto_182658 - BLOCK
      ?auto_182659 - BLOCK
      ?auto_182660 - BLOCK
      ?auto_182661 - BLOCK
    )
    :vars
    (
      ?auto_182663 - BLOCK
      ?auto_182662 - BLOCK
      ?auto_182664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182656 ?auto_182657 ) ) ( not ( = ?auto_182656 ?auto_182658 ) ) ( not ( = ?auto_182656 ?auto_182659 ) ) ( not ( = ?auto_182656 ?auto_182660 ) ) ( not ( = ?auto_182656 ?auto_182661 ) ) ( not ( = ?auto_182657 ?auto_182658 ) ) ( not ( = ?auto_182657 ?auto_182659 ) ) ( not ( = ?auto_182657 ?auto_182660 ) ) ( not ( = ?auto_182657 ?auto_182661 ) ) ( not ( = ?auto_182658 ?auto_182659 ) ) ( not ( = ?auto_182658 ?auto_182660 ) ) ( not ( = ?auto_182658 ?auto_182661 ) ) ( not ( = ?auto_182659 ?auto_182660 ) ) ( not ( = ?auto_182659 ?auto_182661 ) ) ( not ( = ?auto_182660 ?auto_182661 ) ) ( ON ?auto_182661 ?auto_182663 ) ( not ( = ?auto_182656 ?auto_182663 ) ) ( not ( = ?auto_182657 ?auto_182663 ) ) ( not ( = ?auto_182658 ?auto_182663 ) ) ( not ( = ?auto_182659 ?auto_182663 ) ) ( not ( = ?auto_182660 ?auto_182663 ) ) ( not ( = ?auto_182661 ?auto_182663 ) ) ( ON ?auto_182660 ?auto_182661 ) ( ON-TABLE ?auto_182662 ) ( ON ?auto_182663 ?auto_182662 ) ( not ( = ?auto_182662 ?auto_182663 ) ) ( not ( = ?auto_182662 ?auto_182661 ) ) ( not ( = ?auto_182662 ?auto_182660 ) ) ( not ( = ?auto_182656 ?auto_182662 ) ) ( not ( = ?auto_182657 ?auto_182662 ) ) ( not ( = ?auto_182658 ?auto_182662 ) ) ( not ( = ?auto_182659 ?auto_182662 ) ) ( ON ?auto_182656 ?auto_182664 ) ( not ( = ?auto_182656 ?auto_182664 ) ) ( not ( = ?auto_182657 ?auto_182664 ) ) ( not ( = ?auto_182658 ?auto_182664 ) ) ( not ( = ?auto_182659 ?auto_182664 ) ) ( not ( = ?auto_182660 ?auto_182664 ) ) ( not ( = ?auto_182661 ?auto_182664 ) ) ( not ( = ?auto_182663 ?auto_182664 ) ) ( not ( = ?auto_182662 ?auto_182664 ) ) ( ON ?auto_182657 ?auto_182656 ) ( ON-TABLE ?auto_182664 ) ( ON ?auto_182658 ?auto_182657 ) ( CLEAR ?auto_182658 ) ( HOLDING ?auto_182659 ) ( CLEAR ?auto_182660 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182662 ?auto_182663 ?auto_182661 ?auto_182660 ?auto_182659 )
      ( MAKE-6PILE ?auto_182656 ?auto_182657 ?auto_182658 ?auto_182659 ?auto_182660 ?auto_182661 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182665 - BLOCK
      ?auto_182666 - BLOCK
      ?auto_182667 - BLOCK
      ?auto_182668 - BLOCK
      ?auto_182669 - BLOCK
      ?auto_182670 - BLOCK
    )
    :vars
    (
      ?auto_182672 - BLOCK
      ?auto_182671 - BLOCK
      ?auto_182673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182665 ?auto_182666 ) ) ( not ( = ?auto_182665 ?auto_182667 ) ) ( not ( = ?auto_182665 ?auto_182668 ) ) ( not ( = ?auto_182665 ?auto_182669 ) ) ( not ( = ?auto_182665 ?auto_182670 ) ) ( not ( = ?auto_182666 ?auto_182667 ) ) ( not ( = ?auto_182666 ?auto_182668 ) ) ( not ( = ?auto_182666 ?auto_182669 ) ) ( not ( = ?auto_182666 ?auto_182670 ) ) ( not ( = ?auto_182667 ?auto_182668 ) ) ( not ( = ?auto_182667 ?auto_182669 ) ) ( not ( = ?auto_182667 ?auto_182670 ) ) ( not ( = ?auto_182668 ?auto_182669 ) ) ( not ( = ?auto_182668 ?auto_182670 ) ) ( not ( = ?auto_182669 ?auto_182670 ) ) ( ON ?auto_182670 ?auto_182672 ) ( not ( = ?auto_182665 ?auto_182672 ) ) ( not ( = ?auto_182666 ?auto_182672 ) ) ( not ( = ?auto_182667 ?auto_182672 ) ) ( not ( = ?auto_182668 ?auto_182672 ) ) ( not ( = ?auto_182669 ?auto_182672 ) ) ( not ( = ?auto_182670 ?auto_182672 ) ) ( ON ?auto_182669 ?auto_182670 ) ( ON-TABLE ?auto_182671 ) ( ON ?auto_182672 ?auto_182671 ) ( not ( = ?auto_182671 ?auto_182672 ) ) ( not ( = ?auto_182671 ?auto_182670 ) ) ( not ( = ?auto_182671 ?auto_182669 ) ) ( not ( = ?auto_182665 ?auto_182671 ) ) ( not ( = ?auto_182666 ?auto_182671 ) ) ( not ( = ?auto_182667 ?auto_182671 ) ) ( not ( = ?auto_182668 ?auto_182671 ) ) ( ON ?auto_182665 ?auto_182673 ) ( not ( = ?auto_182665 ?auto_182673 ) ) ( not ( = ?auto_182666 ?auto_182673 ) ) ( not ( = ?auto_182667 ?auto_182673 ) ) ( not ( = ?auto_182668 ?auto_182673 ) ) ( not ( = ?auto_182669 ?auto_182673 ) ) ( not ( = ?auto_182670 ?auto_182673 ) ) ( not ( = ?auto_182672 ?auto_182673 ) ) ( not ( = ?auto_182671 ?auto_182673 ) ) ( ON ?auto_182666 ?auto_182665 ) ( ON-TABLE ?auto_182673 ) ( ON ?auto_182667 ?auto_182666 ) ( CLEAR ?auto_182669 ) ( ON ?auto_182668 ?auto_182667 ) ( CLEAR ?auto_182668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182673 ?auto_182665 ?auto_182666 ?auto_182667 )
      ( MAKE-6PILE ?auto_182665 ?auto_182666 ?auto_182667 ?auto_182668 ?auto_182669 ?auto_182670 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182674 - BLOCK
      ?auto_182675 - BLOCK
      ?auto_182676 - BLOCK
      ?auto_182677 - BLOCK
      ?auto_182678 - BLOCK
      ?auto_182679 - BLOCK
    )
    :vars
    (
      ?auto_182682 - BLOCK
      ?auto_182681 - BLOCK
      ?auto_182680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182674 ?auto_182675 ) ) ( not ( = ?auto_182674 ?auto_182676 ) ) ( not ( = ?auto_182674 ?auto_182677 ) ) ( not ( = ?auto_182674 ?auto_182678 ) ) ( not ( = ?auto_182674 ?auto_182679 ) ) ( not ( = ?auto_182675 ?auto_182676 ) ) ( not ( = ?auto_182675 ?auto_182677 ) ) ( not ( = ?auto_182675 ?auto_182678 ) ) ( not ( = ?auto_182675 ?auto_182679 ) ) ( not ( = ?auto_182676 ?auto_182677 ) ) ( not ( = ?auto_182676 ?auto_182678 ) ) ( not ( = ?auto_182676 ?auto_182679 ) ) ( not ( = ?auto_182677 ?auto_182678 ) ) ( not ( = ?auto_182677 ?auto_182679 ) ) ( not ( = ?auto_182678 ?auto_182679 ) ) ( ON ?auto_182679 ?auto_182682 ) ( not ( = ?auto_182674 ?auto_182682 ) ) ( not ( = ?auto_182675 ?auto_182682 ) ) ( not ( = ?auto_182676 ?auto_182682 ) ) ( not ( = ?auto_182677 ?auto_182682 ) ) ( not ( = ?auto_182678 ?auto_182682 ) ) ( not ( = ?auto_182679 ?auto_182682 ) ) ( ON-TABLE ?auto_182681 ) ( ON ?auto_182682 ?auto_182681 ) ( not ( = ?auto_182681 ?auto_182682 ) ) ( not ( = ?auto_182681 ?auto_182679 ) ) ( not ( = ?auto_182681 ?auto_182678 ) ) ( not ( = ?auto_182674 ?auto_182681 ) ) ( not ( = ?auto_182675 ?auto_182681 ) ) ( not ( = ?auto_182676 ?auto_182681 ) ) ( not ( = ?auto_182677 ?auto_182681 ) ) ( ON ?auto_182674 ?auto_182680 ) ( not ( = ?auto_182674 ?auto_182680 ) ) ( not ( = ?auto_182675 ?auto_182680 ) ) ( not ( = ?auto_182676 ?auto_182680 ) ) ( not ( = ?auto_182677 ?auto_182680 ) ) ( not ( = ?auto_182678 ?auto_182680 ) ) ( not ( = ?auto_182679 ?auto_182680 ) ) ( not ( = ?auto_182682 ?auto_182680 ) ) ( not ( = ?auto_182681 ?auto_182680 ) ) ( ON ?auto_182675 ?auto_182674 ) ( ON-TABLE ?auto_182680 ) ( ON ?auto_182676 ?auto_182675 ) ( ON ?auto_182677 ?auto_182676 ) ( CLEAR ?auto_182677 ) ( HOLDING ?auto_182678 ) ( CLEAR ?auto_182679 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182681 ?auto_182682 ?auto_182679 ?auto_182678 )
      ( MAKE-6PILE ?auto_182674 ?auto_182675 ?auto_182676 ?auto_182677 ?auto_182678 ?auto_182679 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182683 - BLOCK
      ?auto_182684 - BLOCK
      ?auto_182685 - BLOCK
      ?auto_182686 - BLOCK
      ?auto_182687 - BLOCK
      ?auto_182688 - BLOCK
    )
    :vars
    (
      ?auto_182690 - BLOCK
      ?auto_182689 - BLOCK
      ?auto_182691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182683 ?auto_182684 ) ) ( not ( = ?auto_182683 ?auto_182685 ) ) ( not ( = ?auto_182683 ?auto_182686 ) ) ( not ( = ?auto_182683 ?auto_182687 ) ) ( not ( = ?auto_182683 ?auto_182688 ) ) ( not ( = ?auto_182684 ?auto_182685 ) ) ( not ( = ?auto_182684 ?auto_182686 ) ) ( not ( = ?auto_182684 ?auto_182687 ) ) ( not ( = ?auto_182684 ?auto_182688 ) ) ( not ( = ?auto_182685 ?auto_182686 ) ) ( not ( = ?auto_182685 ?auto_182687 ) ) ( not ( = ?auto_182685 ?auto_182688 ) ) ( not ( = ?auto_182686 ?auto_182687 ) ) ( not ( = ?auto_182686 ?auto_182688 ) ) ( not ( = ?auto_182687 ?auto_182688 ) ) ( ON ?auto_182688 ?auto_182690 ) ( not ( = ?auto_182683 ?auto_182690 ) ) ( not ( = ?auto_182684 ?auto_182690 ) ) ( not ( = ?auto_182685 ?auto_182690 ) ) ( not ( = ?auto_182686 ?auto_182690 ) ) ( not ( = ?auto_182687 ?auto_182690 ) ) ( not ( = ?auto_182688 ?auto_182690 ) ) ( ON-TABLE ?auto_182689 ) ( ON ?auto_182690 ?auto_182689 ) ( not ( = ?auto_182689 ?auto_182690 ) ) ( not ( = ?auto_182689 ?auto_182688 ) ) ( not ( = ?auto_182689 ?auto_182687 ) ) ( not ( = ?auto_182683 ?auto_182689 ) ) ( not ( = ?auto_182684 ?auto_182689 ) ) ( not ( = ?auto_182685 ?auto_182689 ) ) ( not ( = ?auto_182686 ?auto_182689 ) ) ( ON ?auto_182683 ?auto_182691 ) ( not ( = ?auto_182683 ?auto_182691 ) ) ( not ( = ?auto_182684 ?auto_182691 ) ) ( not ( = ?auto_182685 ?auto_182691 ) ) ( not ( = ?auto_182686 ?auto_182691 ) ) ( not ( = ?auto_182687 ?auto_182691 ) ) ( not ( = ?auto_182688 ?auto_182691 ) ) ( not ( = ?auto_182690 ?auto_182691 ) ) ( not ( = ?auto_182689 ?auto_182691 ) ) ( ON ?auto_182684 ?auto_182683 ) ( ON-TABLE ?auto_182691 ) ( ON ?auto_182685 ?auto_182684 ) ( ON ?auto_182686 ?auto_182685 ) ( CLEAR ?auto_182688 ) ( ON ?auto_182687 ?auto_182686 ) ( CLEAR ?auto_182687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182691 ?auto_182683 ?auto_182684 ?auto_182685 ?auto_182686 )
      ( MAKE-6PILE ?auto_182683 ?auto_182684 ?auto_182685 ?auto_182686 ?auto_182687 ?auto_182688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182692 - BLOCK
      ?auto_182693 - BLOCK
      ?auto_182694 - BLOCK
      ?auto_182695 - BLOCK
      ?auto_182696 - BLOCK
      ?auto_182697 - BLOCK
    )
    :vars
    (
      ?auto_182700 - BLOCK
      ?auto_182699 - BLOCK
      ?auto_182698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182692 ?auto_182693 ) ) ( not ( = ?auto_182692 ?auto_182694 ) ) ( not ( = ?auto_182692 ?auto_182695 ) ) ( not ( = ?auto_182692 ?auto_182696 ) ) ( not ( = ?auto_182692 ?auto_182697 ) ) ( not ( = ?auto_182693 ?auto_182694 ) ) ( not ( = ?auto_182693 ?auto_182695 ) ) ( not ( = ?auto_182693 ?auto_182696 ) ) ( not ( = ?auto_182693 ?auto_182697 ) ) ( not ( = ?auto_182694 ?auto_182695 ) ) ( not ( = ?auto_182694 ?auto_182696 ) ) ( not ( = ?auto_182694 ?auto_182697 ) ) ( not ( = ?auto_182695 ?auto_182696 ) ) ( not ( = ?auto_182695 ?auto_182697 ) ) ( not ( = ?auto_182696 ?auto_182697 ) ) ( not ( = ?auto_182692 ?auto_182700 ) ) ( not ( = ?auto_182693 ?auto_182700 ) ) ( not ( = ?auto_182694 ?auto_182700 ) ) ( not ( = ?auto_182695 ?auto_182700 ) ) ( not ( = ?auto_182696 ?auto_182700 ) ) ( not ( = ?auto_182697 ?auto_182700 ) ) ( ON-TABLE ?auto_182699 ) ( ON ?auto_182700 ?auto_182699 ) ( not ( = ?auto_182699 ?auto_182700 ) ) ( not ( = ?auto_182699 ?auto_182697 ) ) ( not ( = ?auto_182699 ?auto_182696 ) ) ( not ( = ?auto_182692 ?auto_182699 ) ) ( not ( = ?auto_182693 ?auto_182699 ) ) ( not ( = ?auto_182694 ?auto_182699 ) ) ( not ( = ?auto_182695 ?auto_182699 ) ) ( ON ?auto_182692 ?auto_182698 ) ( not ( = ?auto_182692 ?auto_182698 ) ) ( not ( = ?auto_182693 ?auto_182698 ) ) ( not ( = ?auto_182694 ?auto_182698 ) ) ( not ( = ?auto_182695 ?auto_182698 ) ) ( not ( = ?auto_182696 ?auto_182698 ) ) ( not ( = ?auto_182697 ?auto_182698 ) ) ( not ( = ?auto_182700 ?auto_182698 ) ) ( not ( = ?auto_182699 ?auto_182698 ) ) ( ON ?auto_182693 ?auto_182692 ) ( ON-TABLE ?auto_182698 ) ( ON ?auto_182694 ?auto_182693 ) ( ON ?auto_182695 ?auto_182694 ) ( ON ?auto_182696 ?auto_182695 ) ( CLEAR ?auto_182696 ) ( HOLDING ?auto_182697 ) ( CLEAR ?auto_182700 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182699 ?auto_182700 ?auto_182697 )
      ( MAKE-6PILE ?auto_182692 ?auto_182693 ?auto_182694 ?auto_182695 ?auto_182696 ?auto_182697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182701 - BLOCK
      ?auto_182702 - BLOCK
      ?auto_182703 - BLOCK
      ?auto_182704 - BLOCK
      ?auto_182705 - BLOCK
      ?auto_182706 - BLOCK
    )
    :vars
    (
      ?auto_182708 - BLOCK
      ?auto_182707 - BLOCK
      ?auto_182709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182701 ?auto_182702 ) ) ( not ( = ?auto_182701 ?auto_182703 ) ) ( not ( = ?auto_182701 ?auto_182704 ) ) ( not ( = ?auto_182701 ?auto_182705 ) ) ( not ( = ?auto_182701 ?auto_182706 ) ) ( not ( = ?auto_182702 ?auto_182703 ) ) ( not ( = ?auto_182702 ?auto_182704 ) ) ( not ( = ?auto_182702 ?auto_182705 ) ) ( not ( = ?auto_182702 ?auto_182706 ) ) ( not ( = ?auto_182703 ?auto_182704 ) ) ( not ( = ?auto_182703 ?auto_182705 ) ) ( not ( = ?auto_182703 ?auto_182706 ) ) ( not ( = ?auto_182704 ?auto_182705 ) ) ( not ( = ?auto_182704 ?auto_182706 ) ) ( not ( = ?auto_182705 ?auto_182706 ) ) ( not ( = ?auto_182701 ?auto_182708 ) ) ( not ( = ?auto_182702 ?auto_182708 ) ) ( not ( = ?auto_182703 ?auto_182708 ) ) ( not ( = ?auto_182704 ?auto_182708 ) ) ( not ( = ?auto_182705 ?auto_182708 ) ) ( not ( = ?auto_182706 ?auto_182708 ) ) ( ON-TABLE ?auto_182707 ) ( ON ?auto_182708 ?auto_182707 ) ( not ( = ?auto_182707 ?auto_182708 ) ) ( not ( = ?auto_182707 ?auto_182706 ) ) ( not ( = ?auto_182707 ?auto_182705 ) ) ( not ( = ?auto_182701 ?auto_182707 ) ) ( not ( = ?auto_182702 ?auto_182707 ) ) ( not ( = ?auto_182703 ?auto_182707 ) ) ( not ( = ?auto_182704 ?auto_182707 ) ) ( ON ?auto_182701 ?auto_182709 ) ( not ( = ?auto_182701 ?auto_182709 ) ) ( not ( = ?auto_182702 ?auto_182709 ) ) ( not ( = ?auto_182703 ?auto_182709 ) ) ( not ( = ?auto_182704 ?auto_182709 ) ) ( not ( = ?auto_182705 ?auto_182709 ) ) ( not ( = ?auto_182706 ?auto_182709 ) ) ( not ( = ?auto_182708 ?auto_182709 ) ) ( not ( = ?auto_182707 ?auto_182709 ) ) ( ON ?auto_182702 ?auto_182701 ) ( ON-TABLE ?auto_182709 ) ( ON ?auto_182703 ?auto_182702 ) ( ON ?auto_182704 ?auto_182703 ) ( ON ?auto_182705 ?auto_182704 ) ( CLEAR ?auto_182708 ) ( ON ?auto_182706 ?auto_182705 ) ( CLEAR ?auto_182706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182709 ?auto_182701 ?auto_182702 ?auto_182703 ?auto_182704 ?auto_182705 )
      ( MAKE-6PILE ?auto_182701 ?auto_182702 ?auto_182703 ?auto_182704 ?auto_182705 ?auto_182706 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182710 - BLOCK
      ?auto_182711 - BLOCK
      ?auto_182712 - BLOCK
      ?auto_182713 - BLOCK
      ?auto_182714 - BLOCK
      ?auto_182715 - BLOCK
    )
    :vars
    (
      ?auto_182718 - BLOCK
      ?auto_182716 - BLOCK
      ?auto_182717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182710 ?auto_182711 ) ) ( not ( = ?auto_182710 ?auto_182712 ) ) ( not ( = ?auto_182710 ?auto_182713 ) ) ( not ( = ?auto_182710 ?auto_182714 ) ) ( not ( = ?auto_182710 ?auto_182715 ) ) ( not ( = ?auto_182711 ?auto_182712 ) ) ( not ( = ?auto_182711 ?auto_182713 ) ) ( not ( = ?auto_182711 ?auto_182714 ) ) ( not ( = ?auto_182711 ?auto_182715 ) ) ( not ( = ?auto_182712 ?auto_182713 ) ) ( not ( = ?auto_182712 ?auto_182714 ) ) ( not ( = ?auto_182712 ?auto_182715 ) ) ( not ( = ?auto_182713 ?auto_182714 ) ) ( not ( = ?auto_182713 ?auto_182715 ) ) ( not ( = ?auto_182714 ?auto_182715 ) ) ( not ( = ?auto_182710 ?auto_182718 ) ) ( not ( = ?auto_182711 ?auto_182718 ) ) ( not ( = ?auto_182712 ?auto_182718 ) ) ( not ( = ?auto_182713 ?auto_182718 ) ) ( not ( = ?auto_182714 ?auto_182718 ) ) ( not ( = ?auto_182715 ?auto_182718 ) ) ( ON-TABLE ?auto_182716 ) ( not ( = ?auto_182716 ?auto_182718 ) ) ( not ( = ?auto_182716 ?auto_182715 ) ) ( not ( = ?auto_182716 ?auto_182714 ) ) ( not ( = ?auto_182710 ?auto_182716 ) ) ( not ( = ?auto_182711 ?auto_182716 ) ) ( not ( = ?auto_182712 ?auto_182716 ) ) ( not ( = ?auto_182713 ?auto_182716 ) ) ( ON ?auto_182710 ?auto_182717 ) ( not ( = ?auto_182710 ?auto_182717 ) ) ( not ( = ?auto_182711 ?auto_182717 ) ) ( not ( = ?auto_182712 ?auto_182717 ) ) ( not ( = ?auto_182713 ?auto_182717 ) ) ( not ( = ?auto_182714 ?auto_182717 ) ) ( not ( = ?auto_182715 ?auto_182717 ) ) ( not ( = ?auto_182718 ?auto_182717 ) ) ( not ( = ?auto_182716 ?auto_182717 ) ) ( ON ?auto_182711 ?auto_182710 ) ( ON-TABLE ?auto_182717 ) ( ON ?auto_182712 ?auto_182711 ) ( ON ?auto_182713 ?auto_182712 ) ( ON ?auto_182714 ?auto_182713 ) ( ON ?auto_182715 ?auto_182714 ) ( CLEAR ?auto_182715 ) ( HOLDING ?auto_182718 ) ( CLEAR ?auto_182716 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182716 ?auto_182718 )
      ( MAKE-6PILE ?auto_182710 ?auto_182711 ?auto_182712 ?auto_182713 ?auto_182714 ?auto_182715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182719 - BLOCK
      ?auto_182720 - BLOCK
      ?auto_182721 - BLOCK
      ?auto_182722 - BLOCK
      ?auto_182723 - BLOCK
      ?auto_182724 - BLOCK
    )
    :vars
    (
      ?auto_182725 - BLOCK
      ?auto_182726 - BLOCK
      ?auto_182727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182719 ?auto_182720 ) ) ( not ( = ?auto_182719 ?auto_182721 ) ) ( not ( = ?auto_182719 ?auto_182722 ) ) ( not ( = ?auto_182719 ?auto_182723 ) ) ( not ( = ?auto_182719 ?auto_182724 ) ) ( not ( = ?auto_182720 ?auto_182721 ) ) ( not ( = ?auto_182720 ?auto_182722 ) ) ( not ( = ?auto_182720 ?auto_182723 ) ) ( not ( = ?auto_182720 ?auto_182724 ) ) ( not ( = ?auto_182721 ?auto_182722 ) ) ( not ( = ?auto_182721 ?auto_182723 ) ) ( not ( = ?auto_182721 ?auto_182724 ) ) ( not ( = ?auto_182722 ?auto_182723 ) ) ( not ( = ?auto_182722 ?auto_182724 ) ) ( not ( = ?auto_182723 ?auto_182724 ) ) ( not ( = ?auto_182719 ?auto_182725 ) ) ( not ( = ?auto_182720 ?auto_182725 ) ) ( not ( = ?auto_182721 ?auto_182725 ) ) ( not ( = ?auto_182722 ?auto_182725 ) ) ( not ( = ?auto_182723 ?auto_182725 ) ) ( not ( = ?auto_182724 ?auto_182725 ) ) ( ON-TABLE ?auto_182726 ) ( not ( = ?auto_182726 ?auto_182725 ) ) ( not ( = ?auto_182726 ?auto_182724 ) ) ( not ( = ?auto_182726 ?auto_182723 ) ) ( not ( = ?auto_182719 ?auto_182726 ) ) ( not ( = ?auto_182720 ?auto_182726 ) ) ( not ( = ?auto_182721 ?auto_182726 ) ) ( not ( = ?auto_182722 ?auto_182726 ) ) ( ON ?auto_182719 ?auto_182727 ) ( not ( = ?auto_182719 ?auto_182727 ) ) ( not ( = ?auto_182720 ?auto_182727 ) ) ( not ( = ?auto_182721 ?auto_182727 ) ) ( not ( = ?auto_182722 ?auto_182727 ) ) ( not ( = ?auto_182723 ?auto_182727 ) ) ( not ( = ?auto_182724 ?auto_182727 ) ) ( not ( = ?auto_182725 ?auto_182727 ) ) ( not ( = ?auto_182726 ?auto_182727 ) ) ( ON ?auto_182720 ?auto_182719 ) ( ON-TABLE ?auto_182727 ) ( ON ?auto_182721 ?auto_182720 ) ( ON ?auto_182722 ?auto_182721 ) ( ON ?auto_182723 ?auto_182722 ) ( ON ?auto_182724 ?auto_182723 ) ( CLEAR ?auto_182726 ) ( ON ?auto_182725 ?auto_182724 ) ( CLEAR ?auto_182725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182727 ?auto_182719 ?auto_182720 ?auto_182721 ?auto_182722 ?auto_182723 ?auto_182724 )
      ( MAKE-6PILE ?auto_182719 ?auto_182720 ?auto_182721 ?auto_182722 ?auto_182723 ?auto_182724 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182728 - BLOCK
      ?auto_182729 - BLOCK
      ?auto_182730 - BLOCK
      ?auto_182731 - BLOCK
      ?auto_182732 - BLOCK
      ?auto_182733 - BLOCK
    )
    :vars
    (
      ?auto_182734 - BLOCK
      ?auto_182735 - BLOCK
      ?auto_182736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182728 ?auto_182729 ) ) ( not ( = ?auto_182728 ?auto_182730 ) ) ( not ( = ?auto_182728 ?auto_182731 ) ) ( not ( = ?auto_182728 ?auto_182732 ) ) ( not ( = ?auto_182728 ?auto_182733 ) ) ( not ( = ?auto_182729 ?auto_182730 ) ) ( not ( = ?auto_182729 ?auto_182731 ) ) ( not ( = ?auto_182729 ?auto_182732 ) ) ( not ( = ?auto_182729 ?auto_182733 ) ) ( not ( = ?auto_182730 ?auto_182731 ) ) ( not ( = ?auto_182730 ?auto_182732 ) ) ( not ( = ?auto_182730 ?auto_182733 ) ) ( not ( = ?auto_182731 ?auto_182732 ) ) ( not ( = ?auto_182731 ?auto_182733 ) ) ( not ( = ?auto_182732 ?auto_182733 ) ) ( not ( = ?auto_182728 ?auto_182734 ) ) ( not ( = ?auto_182729 ?auto_182734 ) ) ( not ( = ?auto_182730 ?auto_182734 ) ) ( not ( = ?auto_182731 ?auto_182734 ) ) ( not ( = ?auto_182732 ?auto_182734 ) ) ( not ( = ?auto_182733 ?auto_182734 ) ) ( not ( = ?auto_182735 ?auto_182734 ) ) ( not ( = ?auto_182735 ?auto_182733 ) ) ( not ( = ?auto_182735 ?auto_182732 ) ) ( not ( = ?auto_182728 ?auto_182735 ) ) ( not ( = ?auto_182729 ?auto_182735 ) ) ( not ( = ?auto_182730 ?auto_182735 ) ) ( not ( = ?auto_182731 ?auto_182735 ) ) ( ON ?auto_182728 ?auto_182736 ) ( not ( = ?auto_182728 ?auto_182736 ) ) ( not ( = ?auto_182729 ?auto_182736 ) ) ( not ( = ?auto_182730 ?auto_182736 ) ) ( not ( = ?auto_182731 ?auto_182736 ) ) ( not ( = ?auto_182732 ?auto_182736 ) ) ( not ( = ?auto_182733 ?auto_182736 ) ) ( not ( = ?auto_182734 ?auto_182736 ) ) ( not ( = ?auto_182735 ?auto_182736 ) ) ( ON ?auto_182729 ?auto_182728 ) ( ON-TABLE ?auto_182736 ) ( ON ?auto_182730 ?auto_182729 ) ( ON ?auto_182731 ?auto_182730 ) ( ON ?auto_182732 ?auto_182731 ) ( ON ?auto_182733 ?auto_182732 ) ( ON ?auto_182734 ?auto_182733 ) ( CLEAR ?auto_182734 ) ( HOLDING ?auto_182735 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182735 )
      ( MAKE-6PILE ?auto_182728 ?auto_182729 ?auto_182730 ?auto_182731 ?auto_182732 ?auto_182733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182737 - BLOCK
      ?auto_182738 - BLOCK
      ?auto_182739 - BLOCK
      ?auto_182740 - BLOCK
      ?auto_182741 - BLOCK
      ?auto_182742 - BLOCK
    )
    :vars
    (
      ?auto_182745 - BLOCK
      ?auto_182743 - BLOCK
      ?auto_182744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182737 ?auto_182738 ) ) ( not ( = ?auto_182737 ?auto_182739 ) ) ( not ( = ?auto_182737 ?auto_182740 ) ) ( not ( = ?auto_182737 ?auto_182741 ) ) ( not ( = ?auto_182737 ?auto_182742 ) ) ( not ( = ?auto_182738 ?auto_182739 ) ) ( not ( = ?auto_182738 ?auto_182740 ) ) ( not ( = ?auto_182738 ?auto_182741 ) ) ( not ( = ?auto_182738 ?auto_182742 ) ) ( not ( = ?auto_182739 ?auto_182740 ) ) ( not ( = ?auto_182739 ?auto_182741 ) ) ( not ( = ?auto_182739 ?auto_182742 ) ) ( not ( = ?auto_182740 ?auto_182741 ) ) ( not ( = ?auto_182740 ?auto_182742 ) ) ( not ( = ?auto_182741 ?auto_182742 ) ) ( not ( = ?auto_182737 ?auto_182745 ) ) ( not ( = ?auto_182738 ?auto_182745 ) ) ( not ( = ?auto_182739 ?auto_182745 ) ) ( not ( = ?auto_182740 ?auto_182745 ) ) ( not ( = ?auto_182741 ?auto_182745 ) ) ( not ( = ?auto_182742 ?auto_182745 ) ) ( not ( = ?auto_182743 ?auto_182745 ) ) ( not ( = ?auto_182743 ?auto_182742 ) ) ( not ( = ?auto_182743 ?auto_182741 ) ) ( not ( = ?auto_182737 ?auto_182743 ) ) ( not ( = ?auto_182738 ?auto_182743 ) ) ( not ( = ?auto_182739 ?auto_182743 ) ) ( not ( = ?auto_182740 ?auto_182743 ) ) ( ON ?auto_182737 ?auto_182744 ) ( not ( = ?auto_182737 ?auto_182744 ) ) ( not ( = ?auto_182738 ?auto_182744 ) ) ( not ( = ?auto_182739 ?auto_182744 ) ) ( not ( = ?auto_182740 ?auto_182744 ) ) ( not ( = ?auto_182741 ?auto_182744 ) ) ( not ( = ?auto_182742 ?auto_182744 ) ) ( not ( = ?auto_182745 ?auto_182744 ) ) ( not ( = ?auto_182743 ?auto_182744 ) ) ( ON ?auto_182738 ?auto_182737 ) ( ON-TABLE ?auto_182744 ) ( ON ?auto_182739 ?auto_182738 ) ( ON ?auto_182740 ?auto_182739 ) ( ON ?auto_182741 ?auto_182740 ) ( ON ?auto_182742 ?auto_182741 ) ( ON ?auto_182745 ?auto_182742 ) ( ON ?auto_182743 ?auto_182745 ) ( CLEAR ?auto_182743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182744 ?auto_182737 ?auto_182738 ?auto_182739 ?auto_182740 ?auto_182741 ?auto_182742 ?auto_182745 )
      ( MAKE-6PILE ?auto_182737 ?auto_182738 ?auto_182739 ?auto_182740 ?auto_182741 ?auto_182742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182747 - BLOCK
    )
    :vars
    (
      ?auto_182748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182748 ?auto_182747 ) ( CLEAR ?auto_182748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182747 ) ( not ( = ?auto_182747 ?auto_182748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182748 ?auto_182747 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182749 - BLOCK
    )
    :vars
    (
      ?auto_182750 - BLOCK
      ?auto_182751 - BLOCK
      ?auto_182752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182750 ?auto_182749 ) ( CLEAR ?auto_182750 ) ( ON-TABLE ?auto_182749 ) ( not ( = ?auto_182749 ?auto_182750 ) ) ( HOLDING ?auto_182751 ) ( CLEAR ?auto_182752 ) ( not ( = ?auto_182749 ?auto_182751 ) ) ( not ( = ?auto_182749 ?auto_182752 ) ) ( not ( = ?auto_182750 ?auto_182751 ) ) ( not ( = ?auto_182750 ?auto_182752 ) ) ( not ( = ?auto_182751 ?auto_182752 ) ) )
    :subtasks
    ( ( !STACK ?auto_182751 ?auto_182752 )
      ( MAKE-1PILE ?auto_182749 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182753 - BLOCK
    )
    :vars
    (
      ?auto_182756 - BLOCK
      ?auto_182754 - BLOCK
      ?auto_182755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182756 ?auto_182753 ) ( ON-TABLE ?auto_182753 ) ( not ( = ?auto_182753 ?auto_182756 ) ) ( CLEAR ?auto_182754 ) ( not ( = ?auto_182753 ?auto_182755 ) ) ( not ( = ?auto_182753 ?auto_182754 ) ) ( not ( = ?auto_182756 ?auto_182755 ) ) ( not ( = ?auto_182756 ?auto_182754 ) ) ( not ( = ?auto_182755 ?auto_182754 ) ) ( ON ?auto_182755 ?auto_182756 ) ( CLEAR ?auto_182755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182753 ?auto_182756 )
      ( MAKE-1PILE ?auto_182753 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182757 - BLOCK
    )
    :vars
    (
      ?auto_182758 - BLOCK
      ?auto_182759 - BLOCK
      ?auto_182760 - BLOCK
      ?auto_182762 - BLOCK
      ?auto_182763 - BLOCK
      ?auto_182764 - BLOCK
      ?auto_182761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182758 ?auto_182757 ) ( ON-TABLE ?auto_182757 ) ( not ( = ?auto_182757 ?auto_182758 ) ) ( not ( = ?auto_182757 ?auto_182759 ) ) ( not ( = ?auto_182757 ?auto_182760 ) ) ( not ( = ?auto_182758 ?auto_182759 ) ) ( not ( = ?auto_182758 ?auto_182760 ) ) ( not ( = ?auto_182759 ?auto_182760 ) ) ( ON ?auto_182759 ?auto_182758 ) ( CLEAR ?auto_182759 ) ( HOLDING ?auto_182760 ) ( CLEAR ?auto_182762 ) ( ON-TABLE ?auto_182763 ) ( ON ?auto_182764 ?auto_182763 ) ( ON ?auto_182761 ?auto_182764 ) ( ON ?auto_182762 ?auto_182761 ) ( not ( = ?auto_182763 ?auto_182764 ) ) ( not ( = ?auto_182763 ?auto_182761 ) ) ( not ( = ?auto_182763 ?auto_182762 ) ) ( not ( = ?auto_182763 ?auto_182760 ) ) ( not ( = ?auto_182764 ?auto_182761 ) ) ( not ( = ?auto_182764 ?auto_182762 ) ) ( not ( = ?auto_182764 ?auto_182760 ) ) ( not ( = ?auto_182761 ?auto_182762 ) ) ( not ( = ?auto_182761 ?auto_182760 ) ) ( not ( = ?auto_182762 ?auto_182760 ) ) ( not ( = ?auto_182757 ?auto_182762 ) ) ( not ( = ?auto_182757 ?auto_182763 ) ) ( not ( = ?auto_182757 ?auto_182764 ) ) ( not ( = ?auto_182757 ?auto_182761 ) ) ( not ( = ?auto_182758 ?auto_182762 ) ) ( not ( = ?auto_182758 ?auto_182763 ) ) ( not ( = ?auto_182758 ?auto_182764 ) ) ( not ( = ?auto_182758 ?auto_182761 ) ) ( not ( = ?auto_182759 ?auto_182762 ) ) ( not ( = ?auto_182759 ?auto_182763 ) ) ( not ( = ?auto_182759 ?auto_182764 ) ) ( not ( = ?auto_182759 ?auto_182761 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182763 ?auto_182764 ?auto_182761 ?auto_182762 ?auto_182760 )
      ( MAKE-1PILE ?auto_182757 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182765 - BLOCK
    )
    :vars
    (
      ?auto_182769 - BLOCK
      ?auto_182771 - BLOCK
      ?auto_182770 - BLOCK
      ?auto_182768 - BLOCK
      ?auto_182767 - BLOCK
      ?auto_182766 - BLOCK
      ?auto_182772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182769 ?auto_182765 ) ( ON-TABLE ?auto_182765 ) ( not ( = ?auto_182765 ?auto_182769 ) ) ( not ( = ?auto_182765 ?auto_182771 ) ) ( not ( = ?auto_182765 ?auto_182770 ) ) ( not ( = ?auto_182769 ?auto_182771 ) ) ( not ( = ?auto_182769 ?auto_182770 ) ) ( not ( = ?auto_182771 ?auto_182770 ) ) ( ON ?auto_182771 ?auto_182769 ) ( CLEAR ?auto_182768 ) ( ON-TABLE ?auto_182767 ) ( ON ?auto_182766 ?auto_182767 ) ( ON ?auto_182772 ?auto_182766 ) ( ON ?auto_182768 ?auto_182772 ) ( not ( = ?auto_182767 ?auto_182766 ) ) ( not ( = ?auto_182767 ?auto_182772 ) ) ( not ( = ?auto_182767 ?auto_182768 ) ) ( not ( = ?auto_182767 ?auto_182770 ) ) ( not ( = ?auto_182766 ?auto_182772 ) ) ( not ( = ?auto_182766 ?auto_182768 ) ) ( not ( = ?auto_182766 ?auto_182770 ) ) ( not ( = ?auto_182772 ?auto_182768 ) ) ( not ( = ?auto_182772 ?auto_182770 ) ) ( not ( = ?auto_182768 ?auto_182770 ) ) ( not ( = ?auto_182765 ?auto_182768 ) ) ( not ( = ?auto_182765 ?auto_182767 ) ) ( not ( = ?auto_182765 ?auto_182766 ) ) ( not ( = ?auto_182765 ?auto_182772 ) ) ( not ( = ?auto_182769 ?auto_182768 ) ) ( not ( = ?auto_182769 ?auto_182767 ) ) ( not ( = ?auto_182769 ?auto_182766 ) ) ( not ( = ?auto_182769 ?auto_182772 ) ) ( not ( = ?auto_182771 ?auto_182768 ) ) ( not ( = ?auto_182771 ?auto_182767 ) ) ( not ( = ?auto_182771 ?auto_182766 ) ) ( not ( = ?auto_182771 ?auto_182772 ) ) ( ON ?auto_182770 ?auto_182771 ) ( CLEAR ?auto_182770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182765 ?auto_182769 ?auto_182771 )
      ( MAKE-1PILE ?auto_182765 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182773 - BLOCK
    )
    :vars
    (
      ?auto_182774 - BLOCK
      ?auto_182777 - BLOCK
      ?auto_182780 - BLOCK
      ?auto_182776 - BLOCK
      ?auto_182779 - BLOCK
      ?auto_182778 - BLOCK
      ?auto_182775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182774 ?auto_182773 ) ( ON-TABLE ?auto_182773 ) ( not ( = ?auto_182773 ?auto_182774 ) ) ( not ( = ?auto_182773 ?auto_182777 ) ) ( not ( = ?auto_182773 ?auto_182780 ) ) ( not ( = ?auto_182774 ?auto_182777 ) ) ( not ( = ?auto_182774 ?auto_182780 ) ) ( not ( = ?auto_182777 ?auto_182780 ) ) ( ON ?auto_182777 ?auto_182774 ) ( ON-TABLE ?auto_182776 ) ( ON ?auto_182779 ?auto_182776 ) ( ON ?auto_182778 ?auto_182779 ) ( not ( = ?auto_182776 ?auto_182779 ) ) ( not ( = ?auto_182776 ?auto_182778 ) ) ( not ( = ?auto_182776 ?auto_182775 ) ) ( not ( = ?auto_182776 ?auto_182780 ) ) ( not ( = ?auto_182779 ?auto_182778 ) ) ( not ( = ?auto_182779 ?auto_182775 ) ) ( not ( = ?auto_182779 ?auto_182780 ) ) ( not ( = ?auto_182778 ?auto_182775 ) ) ( not ( = ?auto_182778 ?auto_182780 ) ) ( not ( = ?auto_182775 ?auto_182780 ) ) ( not ( = ?auto_182773 ?auto_182775 ) ) ( not ( = ?auto_182773 ?auto_182776 ) ) ( not ( = ?auto_182773 ?auto_182779 ) ) ( not ( = ?auto_182773 ?auto_182778 ) ) ( not ( = ?auto_182774 ?auto_182775 ) ) ( not ( = ?auto_182774 ?auto_182776 ) ) ( not ( = ?auto_182774 ?auto_182779 ) ) ( not ( = ?auto_182774 ?auto_182778 ) ) ( not ( = ?auto_182777 ?auto_182775 ) ) ( not ( = ?auto_182777 ?auto_182776 ) ) ( not ( = ?auto_182777 ?auto_182779 ) ) ( not ( = ?auto_182777 ?auto_182778 ) ) ( ON ?auto_182780 ?auto_182777 ) ( CLEAR ?auto_182780 ) ( HOLDING ?auto_182775 ) ( CLEAR ?auto_182778 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182776 ?auto_182779 ?auto_182778 ?auto_182775 )
      ( MAKE-1PILE ?auto_182773 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182781 - BLOCK
    )
    :vars
    (
      ?auto_182787 - BLOCK
      ?auto_182786 - BLOCK
      ?auto_182783 - BLOCK
      ?auto_182785 - BLOCK
      ?auto_182784 - BLOCK
      ?auto_182782 - BLOCK
      ?auto_182788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182787 ?auto_182781 ) ( ON-TABLE ?auto_182781 ) ( not ( = ?auto_182781 ?auto_182787 ) ) ( not ( = ?auto_182781 ?auto_182786 ) ) ( not ( = ?auto_182781 ?auto_182783 ) ) ( not ( = ?auto_182787 ?auto_182786 ) ) ( not ( = ?auto_182787 ?auto_182783 ) ) ( not ( = ?auto_182786 ?auto_182783 ) ) ( ON ?auto_182786 ?auto_182787 ) ( ON-TABLE ?auto_182785 ) ( ON ?auto_182784 ?auto_182785 ) ( ON ?auto_182782 ?auto_182784 ) ( not ( = ?auto_182785 ?auto_182784 ) ) ( not ( = ?auto_182785 ?auto_182782 ) ) ( not ( = ?auto_182785 ?auto_182788 ) ) ( not ( = ?auto_182785 ?auto_182783 ) ) ( not ( = ?auto_182784 ?auto_182782 ) ) ( not ( = ?auto_182784 ?auto_182788 ) ) ( not ( = ?auto_182784 ?auto_182783 ) ) ( not ( = ?auto_182782 ?auto_182788 ) ) ( not ( = ?auto_182782 ?auto_182783 ) ) ( not ( = ?auto_182788 ?auto_182783 ) ) ( not ( = ?auto_182781 ?auto_182788 ) ) ( not ( = ?auto_182781 ?auto_182785 ) ) ( not ( = ?auto_182781 ?auto_182784 ) ) ( not ( = ?auto_182781 ?auto_182782 ) ) ( not ( = ?auto_182787 ?auto_182788 ) ) ( not ( = ?auto_182787 ?auto_182785 ) ) ( not ( = ?auto_182787 ?auto_182784 ) ) ( not ( = ?auto_182787 ?auto_182782 ) ) ( not ( = ?auto_182786 ?auto_182788 ) ) ( not ( = ?auto_182786 ?auto_182785 ) ) ( not ( = ?auto_182786 ?auto_182784 ) ) ( not ( = ?auto_182786 ?auto_182782 ) ) ( ON ?auto_182783 ?auto_182786 ) ( CLEAR ?auto_182782 ) ( ON ?auto_182788 ?auto_182783 ) ( CLEAR ?auto_182788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182781 ?auto_182787 ?auto_182786 ?auto_182783 )
      ( MAKE-1PILE ?auto_182781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182789 - BLOCK
    )
    :vars
    (
      ?auto_182792 - BLOCK
      ?auto_182790 - BLOCK
      ?auto_182793 - BLOCK
      ?auto_182794 - BLOCK
      ?auto_182795 - BLOCK
      ?auto_182796 - BLOCK
      ?auto_182791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182792 ?auto_182789 ) ( ON-TABLE ?auto_182789 ) ( not ( = ?auto_182789 ?auto_182792 ) ) ( not ( = ?auto_182789 ?auto_182790 ) ) ( not ( = ?auto_182789 ?auto_182793 ) ) ( not ( = ?auto_182792 ?auto_182790 ) ) ( not ( = ?auto_182792 ?auto_182793 ) ) ( not ( = ?auto_182790 ?auto_182793 ) ) ( ON ?auto_182790 ?auto_182792 ) ( ON-TABLE ?auto_182794 ) ( ON ?auto_182795 ?auto_182794 ) ( not ( = ?auto_182794 ?auto_182795 ) ) ( not ( = ?auto_182794 ?auto_182796 ) ) ( not ( = ?auto_182794 ?auto_182791 ) ) ( not ( = ?auto_182794 ?auto_182793 ) ) ( not ( = ?auto_182795 ?auto_182796 ) ) ( not ( = ?auto_182795 ?auto_182791 ) ) ( not ( = ?auto_182795 ?auto_182793 ) ) ( not ( = ?auto_182796 ?auto_182791 ) ) ( not ( = ?auto_182796 ?auto_182793 ) ) ( not ( = ?auto_182791 ?auto_182793 ) ) ( not ( = ?auto_182789 ?auto_182791 ) ) ( not ( = ?auto_182789 ?auto_182794 ) ) ( not ( = ?auto_182789 ?auto_182795 ) ) ( not ( = ?auto_182789 ?auto_182796 ) ) ( not ( = ?auto_182792 ?auto_182791 ) ) ( not ( = ?auto_182792 ?auto_182794 ) ) ( not ( = ?auto_182792 ?auto_182795 ) ) ( not ( = ?auto_182792 ?auto_182796 ) ) ( not ( = ?auto_182790 ?auto_182791 ) ) ( not ( = ?auto_182790 ?auto_182794 ) ) ( not ( = ?auto_182790 ?auto_182795 ) ) ( not ( = ?auto_182790 ?auto_182796 ) ) ( ON ?auto_182793 ?auto_182790 ) ( ON ?auto_182791 ?auto_182793 ) ( CLEAR ?auto_182791 ) ( HOLDING ?auto_182796 ) ( CLEAR ?auto_182795 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182794 ?auto_182795 ?auto_182796 )
      ( MAKE-1PILE ?auto_182789 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182797 - BLOCK
    )
    :vars
    (
      ?auto_182799 - BLOCK
      ?auto_182803 - BLOCK
      ?auto_182800 - BLOCK
      ?auto_182804 - BLOCK
      ?auto_182802 - BLOCK
      ?auto_182801 - BLOCK
      ?auto_182798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182799 ?auto_182797 ) ( ON-TABLE ?auto_182797 ) ( not ( = ?auto_182797 ?auto_182799 ) ) ( not ( = ?auto_182797 ?auto_182803 ) ) ( not ( = ?auto_182797 ?auto_182800 ) ) ( not ( = ?auto_182799 ?auto_182803 ) ) ( not ( = ?auto_182799 ?auto_182800 ) ) ( not ( = ?auto_182803 ?auto_182800 ) ) ( ON ?auto_182803 ?auto_182799 ) ( ON-TABLE ?auto_182804 ) ( ON ?auto_182802 ?auto_182804 ) ( not ( = ?auto_182804 ?auto_182802 ) ) ( not ( = ?auto_182804 ?auto_182801 ) ) ( not ( = ?auto_182804 ?auto_182798 ) ) ( not ( = ?auto_182804 ?auto_182800 ) ) ( not ( = ?auto_182802 ?auto_182801 ) ) ( not ( = ?auto_182802 ?auto_182798 ) ) ( not ( = ?auto_182802 ?auto_182800 ) ) ( not ( = ?auto_182801 ?auto_182798 ) ) ( not ( = ?auto_182801 ?auto_182800 ) ) ( not ( = ?auto_182798 ?auto_182800 ) ) ( not ( = ?auto_182797 ?auto_182798 ) ) ( not ( = ?auto_182797 ?auto_182804 ) ) ( not ( = ?auto_182797 ?auto_182802 ) ) ( not ( = ?auto_182797 ?auto_182801 ) ) ( not ( = ?auto_182799 ?auto_182798 ) ) ( not ( = ?auto_182799 ?auto_182804 ) ) ( not ( = ?auto_182799 ?auto_182802 ) ) ( not ( = ?auto_182799 ?auto_182801 ) ) ( not ( = ?auto_182803 ?auto_182798 ) ) ( not ( = ?auto_182803 ?auto_182804 ) ) ( not ( = ?auto_182803 ?auto_182802 ) ) ( not ( = ?auto_182803 ?auto_182801 ) ) ( ON ?auto_182800 ?auto_182803 ) ( ON ?auto_182798 ?auto_182800 ) ( CLEAR ?auto_182802 ) ( ON ?auto_182801 ?auto_182798 ) ( CLEAR ?auto_182801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182797 ?auto_182799 ?auto_182803 ?auto_182800 ?auto_182798 )
      ( MAKE-1PILE ?auto_182797 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182805 - BLOCK
    )
    :vars
    (
      ?auto_182810 - BLOCK
      ?auto_182811 - BLOCK
      ?auto_182806 - BLOCK
      ?auto_182808 - BLOCK
      ?auto_182809 - BLOCK
      ?auto_182812 - BLOCK
      ?auto_182807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182810 ?auto_182805 ) ( ON-TABLE ?auto_182805 ) ( not ( = ?auto_182805 ?auto_182810 ) ) ( not ( = ?auto_182805 ?auto_182811 ) ) ( not ( = ?auto_182805 ?auto_182806 ) ) ( not ( = ?auto_182810 ?auto_182811 ) ) ( not ( = ?auto_182810 ?auto_182806 ) ) ( not ( = ?auto_182811 ?auto_182806 ) ) ( ON ?auto_182811 ?auto_182810 ) ( ON-TABLE ?auto_182808 ) ( not ( = ?auto_182808 ?auto_182809 ) ) ( not ( = ?auto_182808 ?auto_182812 ) ) ( not ( = ?auto_182808 ?auto_182807 ) ) ( not ( = ?auto_182808 ?auto_182806 ) ) ( not ( = ?auto_182809 ?auto_182812 ) ) ( not ( = ?auto_182809 ?auto_182807 ) ) ( not ( = ?auto_182809 ?auto_182806 ) ) ( not ( = ?auto_182812 ?auto_182807 ) ) ( not ( = ?auto_182812 ?auto_182806 ) ) ( not ( = ?auto_182807 ?auto_182806 ) ) ( not ( = ?auto_182805 ?auto_182807 ) ) ( not ( = ?auto_182805 ?auto_182808 ) ) ( not ( = ?auto_182805 ?auto_182809 ) ) ( not ( = ?auto_182805 ?auto_182812 ) ) ( not ( = ?auto_182810 ?auto_182807 ) ) ( not ( = ?auto_182810 ?auto_182808 ) ) ( not ( = ?auto_182810 ?auto_182809 ) ) ( not ( = ?auto_182810 ?auto_182812 ) ) ( not ( = ?auto_182811 ?auto_182807 ) ) ( not ( = ?auto_182811 ?auto_182808 ) ) ( not ( = ?auto_182811 ?auto_182809 ) ) ( not ( = ?auto_182811 ?auto_182812 ) ) ( ON ?auto_182806 ?auto_182811 ) ( ON ?auto_182807 ?auto_182806 ) ( ON ?auto_182812 ?auto_182807 ) ( CLEAR ?auto_182812 ) ( HOLDING ?auto_182809 ) ( CLEAR ?auto_182808 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182808 ?auto_182809 )
      ( MAKE-1PILE ?auto_182805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182813 - BLOCK
    )
    :vars
    (
      ?auto_182818 - BLOCK
      ?auto_182815 - BLOCK
      ?auto_182816 - BLOCK
      ?auto_182819 - BLOCK
      ?auto_182820 - BLOCK
      ?auto_182814 - BLOCK
      ?auto_182817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182818 ?auto_182813 ) ( ON-TABLE ?auto_182813 ) ( not ( = ?auto_182813 ?auto_182818 ) ) ( not ( = ?auto_182813 ?auto_182815 ) ) ( not ( = ?auto_182813 ?auto_182816 ) ) ( not ( = ?auto_182818 ?auto_182815 ) ) ( not ( = ?auto_182818 ?auto_182816 ) ) ( not ( = ?auto_182815 ?auto_182816 ) ) ( ON ?auto_182815 ?auto_182818 ) ( ON-TABLE ?auto_182819 ) ( not ( = ?auto_182819 ?auto_182820 ) ) ( not ( = ?auto_182819 ?auto_182814 ) ) ( not ( = ?auto_182819 ?auto_182817 ) ) ( not ( = ?auto_182819 ?auto_182816 ) ) ( not ( = ?auto_182820 ?auto_182814 ) ) ( not ( = ?auto_182820 ?auto_182817 ) ) ( not ( = ?auto_182820 ?auto_182816 ) ) ( not ( = ?auto_182814 ?auto_182817 ) ) ( not ( = ?auto_182814 ?auto_182816 ) ) ( not ( = ?auto_182817 ?auto_182816 ) ) ( not ( = ?auto_182813 ?auto_182817 ) ) ( not ( = ?auto_182813 ?auto_182819 ) ) ( not ( = ?auto_182813 ?auto_182820 ) ) ( not ( = ?auto_182813 ?auto_182814 ) ) ( not ( = ?auto_182818 ?auto_182817 ) ) ( not ( = ?auto_182818 ?auto_182819 ) ) ( not ( = ?auto_182818 ?auto_182820 ) ) ( not ( = ?auto_182818 ?auto_182814 ) ) ( not ( = ?auto_182815 ?auto_182817 ) ) ( not ( = ?auto_182815 ?auto_182819 ) ) ( not ( = ?auto_182815 ?auto_182820 ) ) ( not ( = ?auto_182815 ?auto_182814 ) ) ( ON ?auto_182816 ?auto_182815 ) ( ON ?auto_182817 ?auto_182816 ) ( ON ?auto_182814 ?auto_182817 ) ( CLEAR ?auto_182819 ) ( ON ?auto_182820 ?auto_182814 ) ( CLEAR ?auto_182820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182813 ?auto_182818 ?auto_182815 ?auto_182816 ?auto_182817 ?auto_182814 )
      ( MAKE-1PILE ?auto_182813 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182821 - BLOCK
    )
    :vars
    (
      ?auto_182823 - BLOCK
      ?auto_182822 - BLOCK
      ?auto_182824 - BLOCK
      ?auto_182825 - BLOCK
      ?auto_182827 - BLOCK
      ?auto_182828 - BLOCK
      ?auto_182826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182823 ?auto_182821 ) ( ON-TABLE ?auto_182821 ) ( not ( = ?auto_182821 ?auto_182823 ) ) ( not ( = ?auto_182821 ?auto_182822 ) ) ( not ( = ?auto_182821 ?auto_182824 ) ) ( not ( = ?auto_182823 ?auto_182822 ) ) ( not ( = ?auto_182823 ?auto_182824 ) ) ( not ( = ?auto_182822 ?auto_182824 ) ) ( ON ?auto_182822 ?auto_182823 ) ( not ( = ?auto_182825 ?auto_182827 ) ) ( not ( = ?auto_182825 ?auto_182828 ) ) ( not ( = ?auto_182825 ?auto_182826 ) ) ( not ( = ?auto_182825 ?auto_182824 ) ) ( not ( = ?auto_182827 ?auto_182828 ) ) ( not ( = ?auto_182827 ?auto_182826 ) ) ( not ( = ?auto_182827 ?auto_182824 ) ) ( not ( = ?auto_182828 ?auto_182826 ) ) ( not ( = ?auto_182828 ?auto_182824 ) ) ( not ( = ?auto_182826 ?auto_182824 ) ) ( not ( = ?auto_182821 ?auto_182826 ) ) ( not ( = ?auto_182821 ?auto_182825 ) ) ( not ( = ?auto_182821 ?auto_182827 ) ) ( not ( = ?auto_182821 ?auto_182828 ) ) ( not ( = ?auto_182823 ?auto_182826 ) ) ( not ( = ?auto_182823 ?auto_182825 ) ) ( not ( = ?auto_182823 ?auto_182827 ) ) ( not ( = ?auto_182823 ?auto_182828 ) ) ( not ( = ?auto_182822 ?auto_182826 ) ) ( not ( = ?auto_182822 ?auto_182825 ) ) ( not ( = ?auto_182822 ?auto_182827 ) ) ( not ( = ?auto_182822 ?auto_182828 ) ) ( ON ?auto_182824 ?auto_182822 ) ( ON ?auto_182826 ?auto_182824 ) ( ON ?auto_182828 ?auto_182826 ) ( ON ?auto_182827 ?auto_182828 ) ( CLEAR ?auto_182827 ) ( HOLDING ?auto_182825 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182825 )
      ( MAKE-1PILE ?auto_182821 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182829 - BLOCK
    )
    :vars
    (
      ?auto_182836 - BLOCK
      ?auto_182834 - BLOCK
      ?auto_182831 - BLOCK
      ?auto_182832 - BLOCK
      ?auto_182833 - BLOCK
      ?auto_182830 - BLOCK
      ?auto_182835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182836 ?auto_182829 ) ( ON-TABLE ?auto_182829 ) ( not ( = ?auto_182829 ?auto_182836 ) ) ( not ( = ?auto_182829 ?auto_182834 ) ) ( not ( = ?auto_182829 ?auto_182831 ) ) ( not ( = ?auto_182836 ?auto_182834 ) ) ( not ( = ?auto_182836 ?auto_182831 ) ) ( not ( = ?auto_182834 ?auto_182831 ) ) ( ON ?auto_182834 ?auto_182836 ) ( not ( = ?auto_182832 ?auto_182833 ) ) ( not ( = ?auto_182832 ?auto_182830 ) ) ( not ( = ?auto_182832 ?auto_182835 ) ) ( not ( = ?auto_182832 ?auto_182831 ) ) ( not ( = ?auto_182833 ?auto_182830 ) ) ( not ( = ?auto_182833 ?auto_182835 ) ) ( not ( = ?auto_182833 ?auto_182831 ) ) ( not ( = ?auto_182830 ?auto_182835 ) ) ( not ( = ?auto_182830 ?auto_182831 ) ) ( not ( = ?auto_182835 ?auto_182831 ) ) ( not ( = ?auto_182829 ?auto_182835 ) ) ( not ( = ?auto_182829 ?auto_182832 ) ) ( not ( = ?auto_182829 ?auto_182833 ) ) ( not ( = ?auto_182829 ?auto_182830 ) ) ( not ( = ?auto_182836 ?auto_182835 ) ) ( not ( = ?auto_182836 ?auto_182832 ) ) ( not ( = ?auto_182836 ?auto_182833 ) ) ( not ( = ?auto_182836 ?auto_182830 ) ) ( not ( = ?auto_182834 ?auto_182835 ) ) ( not ( = ?auto_182834 ?auto_182832 ) ) ( not ( = ?auto_182834 ?auto_182833 ) ) ( not ( = ?auto_182834 ?auto_182830 ) ) ( ON ?auto_182831 ?auto_182834 ) ( ON ?auto_182835 ?auto_182831 ) ( ON ?auto_182830 ?auto_182835 ) ( ON ?auto_182833 ?auto_182830 ) ( ON ?auto_182832 ?auto_182833 ) ( CLEAR ?auto_182832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182829 ?auto_182836 ?auto_182834 ?auto_182831 ?auto_182835 ?auto_182830 ?auto_182833 )
      ( MAKE-1PILE ?auto_182829 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182837 - BLOCK
    )
    :vars
    (
      ?auto_182842 - BLOCK
      ?auto_182840 - BLOCK
      ?auto_182838 - BLOCK
      ?auto_182841 - BLOCK
      ?auto_182839 - BLOCK
      ?auto_182843 - BLOCK
      ?auto_182844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182842 ?auto_182837 ) ( ON-TABLE ?auto_182837 ) ( not ( = ?auto_182837 ?auto_182842 ) ) ( not ( = ?auto_182837 ?auto_182840 ) ) ( not ( = ?auto_182837 ?auto_182838 ) ) ( not ( = ?auto_182842 ?auto_182840 ) ) ( not ( = ?auto_182842 ?auto_182838 ) ) ( not ( = ?auto_182840 ?auto_182838 ) ) ( ON ?auto_182840 ?auto_182842 ) ( not ( = ?auto_182841 ?auto_182839 ) ) ( not ( = ?auto_182841 ?auto_182843 ) ) ( not ( = ?auto_182841 ?auto_182844 ) ) ( not ( = ?auto_182841 ?auto_182838 ) ) ( not ( = ?auto_182839 ?auto_182843 ) ) ( not ( = ?auto_182839 ?auto_182844 ) ) ( not ( = ?auto_182839 ?auto_182838 ) ) ( not ( = ?auto_182843 ?auto_182844 ) ) ( not ( = ?auto_182843 ?auto_182838 ) ) ( not ( = ?auto_182844 ?auto_182838 ) ) ( not ( = ?auto_182837 ?auto_182844 ) ) ( not ( = ?auto_182837 ?auto_182841 ) ) ( not ( = ?auto_182837 ?auto_182839 ) ) ( not ( = ?auto_182837 ?auto_182843 ) ) ( not ( = ?auto_182842 ?auto_182844 ) ) ( not ( = ?auto_182842 ?auto_182841 ) ) ( not ( = ?auto_182842 ?auto_182839 ) ) ( not ( = ?auto_182842 ?auto_182843 ) ) ( not ( = ?auto_182840 ?auto_182844 ) ) ( not ( = ?auto_182840 ?auto_182841 ) ) ( not ( = ?auto_182840 ?auto_182839 ) ) ( not ( = ?auto_182840 ?auto_182843 ) ) ( ON ?auto_182838 ?auto_182840 ) ( ON ?auto_182844 ?auto_182838 ) ( ON ?auto_182843 ?auto_182844 ) ( ON ?auto_182839 ?auto_182843 ) ( HOLDING ?auto_182841 ) ( CLEAR ?auto_182839 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182837 ?auto_182842 ?auto_182840 ?auto_182838 ?auto_182844 ?auto_182843 ?auto_182839 ?auto_182841 )
      ( MAKE-1PILE ?auto_182837 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182845 - BLOCK
    )
    :vars
    (
      ?auto_182848 - BLOCK
      ?auto_182852 - BLOCK
      ?auto_182850 - BLOCK
      ?auto_182851 - BLOCK
      ?auto_182846 - BLOCK
      ?auto_182849 - BLOCK
      ?auto_182847 - BLOCK
      ?auto_182853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182848 ?auto_182845 ) ( ON-TABLE ?auto_182845 ) ( not ( = ?auto_182845 ?auto_182848 ) ) ( not ( = ?auto_182845 ?auto_182852 ) ) ( not ( = ?auto_182845 ?auto_182850 ) ) ( not ( = ?auto_182848 ?auto_182852 ) ) ( not ( = ?auto_182848 ?auto_182850 ) ) ( not ( = ?auto_182852 ?auto_182850 ) ) ( ON ?auto_182852 ?auto_182848 ) ( not ( = ?auto_182851 ?auto_182846 ) ) ( not ( = ?auto_182851 ?auto_182849 ) ) ( not ( = ?auto_182851 ?auto_182847 ) ) ( not ( = ?auto_182851 ?auto_182850 ) ) ( not ( = ?auto_182846 ?auto_182849 ) ) ( not ( = ?auto_182846 ?auto_182847 ) ) ( not ( = ?auto_182846 ?auto_182850 ) ) ( not ( = ?auto_182849 ?auto_182847 ) ) ( not ( = ?auto_182849 ?auto_182850 ) ) ( not ( = ?auto_182847 ?auto_182850 ) ) ( not ( = ?auto_182845 ?auto_182847 ) ) ( not ( = ?auto_182845 ?auto_182851 ) ) ( not ( = ?auto_182845 ?auto_182846 ) ) ( not ( = ?auto_182845 ?auto_182849 ) ) ( not ( = ?auto_182848 ?auto_182847 ) ) ( not ( = ?auto_182848 ?auto_182851 ) ) ( not ( = ?auto_182848 ?auto_182846 ) ) ( not ( = ?auto_182848 ?auto_182849 ) ) ( not ( = ?auto_182852 ?auto_182847 ) ) ( not ( = ?auto_182852 ?auto_182851 ) ) ( not ( = ?auto_182852 ?auto_182846 ) ) ( not ( = ?auto_182852 ?auto_182849 ) ) ( ON ?auto_182850 ?auto_182852 ) ( ON ?auto_182847 ?auto_182850 ) ( ON ?auto_182849 ?auto_182847 ) ( ON ?auto_182846 ?auto_182849 ) ( CLEAR ?auto_182846 ) ( ON ?auto_182851 ?auto_182853 ) ( CLEAR ?auto_182851 ) ( HAND-EMPTY ) ( not ( = ?auto_182845 ?auto_182853 ) ) ( not ( = ?auto_182848 ?auto_182853 ) ) ( not ( = ?auto_182852 ?auto_182853 ) ) ( not ( = ?auto_182850 ?auto_182853 ) ) ( not ( = ?auto_182851 ?auto_182853 ) ) ( not ( = ?auto_182846 ?auto_182853 ) ) ( not ( = ?auto_182849 ?auto_182853 ) ) ( not ( = ?auto_182847 ?auto_182853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182851 ?auto_182853 )
      ( MAKE-1PILE ?auto_182845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182854 - BLOCK
    )
    :vars
    (
      ?auto_182860 - BLOCK
      ?auto_182857 - BLOCK
      ?auto_182856 - BLOCK
      ?auto_182858 - BLOCK
      ?auto_182862 - BLOCK
      ?auto_182859 - BLOCK
      ?auto_182861 - BLOCK
      ?auto_182855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182860 ?auto_182854 ) ( ON-TABLE ?auto_182854 ) ( not ( = ?auto_182854 ?auto_182860 ) ) ( not ( = ?auto_182854 ?auto_182857 ) ) ( not ( = ?auto_182854 ?auto_182856 ) ) ( not ( = ?auto_182860 ?auto_182857 ) ) ( not ( = ?auto_182860 ?auto_182856 ) ) ( not ( = ?auto_182857 ?auto_182856 ) ) ( ON ?auto_182857 ?auto_182860 ) ( not ( = ?auto_182858 ?auto_182862 ) ) ( not ( = ?auto_182858 ?auto_182859 ) ) ( not ( = ?auto_182858 ?auto_182861 ) ) ( not ( = ?auto_182858 ?auto_182856 ) ) ( not ( = ?auto_182862 ?auto_182859 ) ) ( not ( = ?auto_182862 ?auto_182861 ) ) ( not ( = ?auto_182862 ?auto_182856 ) ) ( not ( = ?auto_182859 ?auto_182861 ) ) ( not ( = ?auto_182859 ?auto_182856 ) ) ( not ( = ?auto_182861 ?auto_182856 ) ) ( not ( = ?auto_182854 ?auto_182861 ) ) ( not ( = ?auto_182854 ?auto_182858 ) ) ( not ( = ?auto_182854 ?auto_182862 ) ) ( not ( = ?auto_182854 ?auto_182859 ) ) ( not ( = ?auto_182860 ?auto_182861 ) ) ( not ( = ?auto_182860 ?auto_182858 ) ) ( not ( = ?auto_182860 ?auto_182862 ) ) ( not ( = ?auto_182860 ?auto_182859 ) ) ( not ( = ?auto_182857 ?auto_182861 ) ) ( not ( = ?auto_182857 ?auto_182858 ) ) ( not ( = ?auto_182857 ?auto_182862 ) ) ( not ( = ?auto_182857 ?auto_182859 ) ) ( ON ?auto_182856 ?auto_182857 ) ( ON ?auto_182861 ?auto_182856 ) ( ON ?auto_182859 ?auto_182861 ) ( ON ?auto_182858 ?auto_182855 ) ( CLEAR ?auto_182858 ) ( not ( = ?auto_182854 ?auto_182855 ) ) ( not ( = ?auto_182860 ?auto_182855 ) ) ( not ( = ?auto_182857 ?auto_182855 ) ) ( not ( = ?auto_182856 ?auto_182855 ) ) ( not ( = ?auto_182858 ?auto_182855 ) ) ( not ( = ?auto_182862 ?auto_182855 ) ) ( not ( = ?auto_182859 ?auto_182855 ) ) ( not ( = ?auto_182861 ?auto_182855 ) ) ( HOLDING ?auto_182862 ) ( CLEAR ?auto_182859 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182854 ?auto_182860 ?auto_182857 ?auto_182856 ?auto_182861 ?auto_182859 ?auto_182862 )
      ( MAKE-1PILE ?auto_182854 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182863 - BLOCK
    )
    :vars
    (
      ?auto_182867 - BLOCK
      ?auto_182870 - BLOCK
      ?auto_182868 - BLOCK
      ?auto_182871 - BLOCK
      ?auto_182864 - BLOCK
      ?auto_182865 - BLOCK
      ?auto_182869 - BLOCK
      ?auto_182866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182867 ?auto_182863 ) ( ON-TABLE ?auto_182863 ) ( not ( = ?auto_182863 ?auto_182867 ) ) ( not ( = ?auto_182863 ?auto_182870 ) ) ( not ( = ?auto_182863 ?auto_182868 ) ) ( not ( = ?auto_182867 ?auto_182870 ) ) ( not ( = ?auto_182867 ?auto_182868 ) ) ( not ( = ?auto_182870 ?auto_182868 ) ) ( ON ?auto_182870 ?auto_182867 ) ( not ( = ?auto_182871 ?auto_182864 ) ) ( not ( = ?auto_182871 ?auto_182865 ) ) ( not ( = ?auto_182871 ?auto_182869 ) ) ( not ( = ?auto_182871 ?auto_182868 ) ) ( not ( = ?auto_182864 ?auto_182865 ) ) ( not ( = ?auto_182864 ?auto_182869 ) ) ( not ( = ?auto_182864 ?auto_182868 ) ) ( not ( = ?auto_182865 ?auto_182869 ) ) ( not ( = ?auto_182865 ?auto_182868 ) ) ( not ( = ?auto_182869 ?auto_182868 ) ) ( not ( = ?auto_182863 ?auto_182869 ) ) ( not ( = ?auto_182863 ?auto_182871 ) ) ( not ( = ?auto_182863 ?auto_182864 ) ) ( not ( = ?auto_182863 ?auto_182865 ) ) ( not ( = ?auto_182867 ?auto_182869 ) ) ( not ( = ?auto_182867 ?auto_182871 ) ) ( not ( = ?auto_182867 ?auto_182864 ) ) ( not ( = ?auto_182867 ?auto_182865 ) ) ( not ( = ?auto_182870 ?auto_182869 ) ) ( not ( = ?auto_182870 ?auto_182871 ) ) ( not ( = ?auto_182870 ?auto_182864 ) ) ( not ( = ?auto_182870 ?auto_182865 ) ) ( ON ?auto_182868 ?auto_182870 ) ( ON ?auto_182869 ?auto_182868 ) ( ON ?auto_182865 ?auto_182869 ) ( ON ?auto_182871 ?auto_182866 ) ( not ( = ?auto_182863 ?auto_182866 ) ) ( not ( = ?auto_182867 ?auto_182866 ) ) ( not ( = ?auto_182870 ?auto_182866 ) ) ( not ( = ?auto_182868 ?auto_182866 ) ) ( not ( = ?auto_182871 ?auto_182866 ) ) ( not ( = ?auto_182864 ?auto_182866 ) ) ( not ( = ?auto_182865 ?auto_182866 ) ) ( not ( = ?auto_182869 ?auto_182866 ) ) ( CLEAR ?auto_182865 ) ( ON ?auto_182864 ?auto_182871 ) ( CLEAR ?auto_182864 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182866 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182866 ?auto_182871 )
      ( MAKE-1PILE ?auto_182863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182872 - BLOCK
    )
    :vars
    (
      ?auto_182875 - BLOCK
      ?auto_182873 - BLOCK
      ?auto_182878 - BLOCK
      ?auto_182879 - BLOCK
      ?auto_182877 - BLOCK
      ?auto_182876 - BLOCK
      ?auto_182874 - BLOCK
      ?auto_182880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182875 ?auto_182872 ) ( ON-TABLE ?auto_182872 ) ( not ( = ?auto_182872 ?auto_182875 ) ) ( not ( = ?auto_182872 ?auto_182873 ) ) ( not ( = ?auto_182872 ?auto_182878 ) ) ( not ( = ?auto_182875 ?auto_182873 ) ) ( not ( = ?auto_182875 ?auto_182878 ) ) ( not ( = ?auto_182873 ?auto_182878 ) ) ( ON ?auto_182873 ?auto_182875 ) ( not ( = ?auto_182879 ?auto_182877 ) ) ( not ( = ?auto_182879 ?auto_182876 ) ) ( not ( = ?auto_182879 ?auto_182874 ) ) ( not ( = ?auto_182879 ?auto_182878 ) ) ( not ( = ?auto_182877 ?auto_182876 ) ) ( not ( = ?auto_182877 ?auto_182874 ) ) ( not ( = ?auto_182877 ?auto_182878 ) ) ( not ( = ?auto_182876 ?auto_182874 ) ) ( not ( = ?auto_182876 ?auto_182878 ) ) ( not ( = ?auto_182874 ?auto_182878 ) ) ( not ( = ?auto_182872 ?auto_182874 ) ) ( not ( = ?auto_182872 ?auto_182879 ) ) ( not ( = ?auto_182872 ?auto_182877 ) ) ( not ( = ?auto_182872 ?auto_182876 ) ) ( not ( = ?auto_182875 ?auto_182874 ) ) ( not ( = ?auto_182875 ?auto_182879 ) ) ( not ( = ?auto_182875 ?auto_182877 ) ) ( not ( = ?auto_182875 ?auto_182876 ) ) ( not ( = ?auto_182873 ?auto_182874 ) ) ( not ( = ?auto_182873 ?auto_182879 ) ) ( not ( = ?auto_182873 ?auto_182877 ) ) ( not ( = ?auto_182873 ?auto_182876 ) ) ( ON ?auto_182878 ?auto_182873 ) ( ON ?auto_182874 ?auto_182878 ) ( ON ?auto_182879 ?auto_182880 ) ( not ( = ?auto_182872 ?auto_182880 ) ) ( not ( = ?auto_182875 ?auto_182880 ) ) ( not ( = ?auto_182873 ?auto_182880 ) ) ( not ( = ?auto_182878 ?auto_182880 ) ) ( not ( = ?auto_182879 ?auto_182880 ) ) ( not ( = ?auto_182877 ?auto_182880 ) ) ( not ( = ?auto_182876 ?auto_182880 ) ) ( not ( = ?auto_182874 ?auto_182880 ) ) ( ON ?auto_182877 ?auto_182879 ) ( CLEAR ?auto_182877 ) ( ON-TABLE ?auto_182880 ) ( HOLDING ?auto_182876 ) ( CLEAR ?auto_182874 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182872 ?auto_182875 ?auto_182873 ?auto_182878 ?auto_182874 ?auto_182876 )
      ( MAKE-1PILE ?auto_182872 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182881 - BLOCK
    )
    :vars
    (
      ?auto_182884 - BLOCK
      ?auto_182887 - BLOCK
      ?auto_182882 - BLOCK
      ?auto_182888 - BLOCK
      ?auto_182889 - BLOCK
      ?auto_182886 - BLOCK
      ?auto_182883 - BLOCK
      ?auto_182885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182884 ?auto_182881 ) ( ON-TABLE ?auto_182881 ) ( not ( = ?auto_182881 ?auto_182884 ) ) ( not ( = ?auto_182881 ?auto_182887 ) ) ( not ( = ?auto_182881 ?auto_182882 ) ) ( not ( = ?auto_182884 ?auto_182887 ) ) ( not ( = ?auto_182884 ?auto_182882 ) ) ( not ( = ?auto_182887 ?auto_182882 ) ) ( ON ?auto_182887 ?auto_182884 ) ( not ( = ?auto_182888 ?auto_182889 ) ) ( not ( = ?auto_182888 ?auto_182886 ) ) ( not ( = ?auto_182888 ?auto_182883 ) ) ( not ( = ?auto_182888 ?auto_182882 ) ) ( not ( = ?auto_182889 ?auto_182886 ) ) ( not ( = ?auto_182889 ?auto_182883 ) ) ( not ( = ?auto_182889 ?auto_182882 ) ) ( not ( = ?auto_182886 ?auto_182883 ) ) ( not ( = ?auto_182886 ?auto_182882 ) ) ( not ( = ?auto_182883 ?auto_182882 ) ) ( not ( = ?auto_182881 ?auto_182883 ) ) ( not ( = ?auto_182881 ?auto_182888 ) ) ( not ( = ?auto_182881 ?auto_182889 ) ) ( not ( = ?auto_182881 ?auto_182886 ) ) ( not ( = ?auto_182884 ?auto_182883 ) ) ( not ( = ?auto_182884 ?auto_182888 ) ) ( not ( = ?auto_182884 ?auto_182889 ) ) ( not ( = ?auto_182884 ?auto_182886 ) ) ( not ( = ?auto_182887 ?auto_182883 ) ) ( not ( = ?auto_182887 ?auto_182888 ) ) ( not ( = ?auto_182887 ?auto_182889 ) ) ( not ( = ?auto_182887 ?auto_182886 ) ) ( ON ?auto_182882 ?auto_182887 ) ( ON ?auto_182883 ?auto_182882 ) ( ON ?auto_182888 ?auto_182885 ) ( not ( = ?auto_182881 ?auto_182885 ) ) ( not ( = ?auto_182884 ?auto_182885 ) ) ( not ( = ?auto_182887 ?auto_182885 ) ) ( not ( = ?auto_182882 ?auto_182885 ) ) ( not ( = ?auto_182888 ?auto_182885 ) ) ( not ( = ?auto_182889 ?auto_182885 ) ) ( not ( = ?auto_182886 ?auto_182885 ) ) ( not ( = ?auto_182883 ?auto_182885 ) ) ( ON ?auto_182889 ?auto_182888 ) ( ON-TABLE ?auto_182885 ) ( CLEAR ?auto_182883 ) ( ON ?auto_182886 ?auto_182889 ) ( CLEAR ?auto_182886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182885 ?auto_182888 ?auto_182889 )
      ( MAKE-1PILE ?auto_182881 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182890 - BLOCK
    )
    :vars
    (
      ?auto_182896 - BLOCK
      ?auto_182891 - BLOCK
      ?auto_182893 - BLOCK
      ?auto_182894 - BLOCK
      ?auto_182892 - BLOCK
      ?auto_182895 - BLOCK
      ?auto_182898 - BLOCK
      ?auto_182897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182896 ?auto_182890 ) ( ON-TABLE ?auto_182890 ) ( not ( = ?auto_182890 ?auto_182896 ) ) ( not ( = ?auto_182890 ?auto_182891 ) ) ( not ( = ?auto_182890 ?auto_182893 ) ) ( not ( = ?auto_182896 ?auto_182891 ) ) ( not ( = ?auto_182896 ?auto_182893 ) ) ( not ( = ?auto_182891 ?auto_182893 ) ) ( ON ?auto_182891 ?auto_182896 ) ( not ( = ?auto_182894 ?auto_182892 ) ) ( not ( = ?auto_182894 ?auto_182895 ) ) ( not ( = ?auto_182894 ?auto_182898 ) ) ( not ( = ?auto_182894 ?auto_182893 ) ) ( not ( = ?auto_182892 ?auto_182895 ) ) ( not ( = ?auto_182892 ?auto_182898 ) ) ( not ( = ?auto_182892 ?auto_182893 ) ) ( not ( = ?auto_182895 ?auto_182898 ) ) ( not ( = ?auto_182895 ?auto_182893 ) ) ( not ( = ?auto_182898 ?auto_182893 ) ) ( not ( = ?auto_182890 ?auto_182898 ) ) ( not ( = ?auto_182890 ?auto_182894 ) ) ( not ( = ?auto_182890 ?auto_182892 ) ) ( not ( = ?auto_182890 ?auto_182895 ) ) ( not ( = ?auto_182896 ?auto_182898 ) ) ( not ( = ?auto_182896 ?auto_182894 ) ) ( not ( = ?auto_182896 ?auto_182892 ) ) ( not ( = ?auto_182896 ?auto_182895 ) ) ( not ( = ?auto_182891 ?auto_182898 ) ) ( not ( = ?auto_182891 ?auto_182894 ) ) ( not ( = ?auto_182891 ?auto_182892 ) ) ( not ( = ?auto_182891 ?auto_182895 ) ) ( ON ?auto_182893 ?auto_182891 ) ( ON ?auto_182894 ?auto_182897 ) ( not ( = ?auto_182890 ?auto_182897 ) ) ( not ( = ?auto_182896 ?auto_182897 ) ) ( not ( = ?auto_182891 ?auto_182897 ) ) ( not ( = ?auto_182893 ?auto_182897 ) ) ( not ( = ?auto_182894 ?auto_182897 ) ) ( not ( = ?auto_182892 ?auto_182897 ) ) ( not ( = ?auto_182895 ?auto_182897 ) ) ( not ( = ?auto_182898 ?auto_182897 ) ) ( ON ?auto_182892 ?auto_182894 ) ( ON-TABLE ?auto_182897 ) ( ON ?auto_182895 ?auto_182892 ) ( CLEAR ?auto_182895 ) ( HOLDING ?auto_182898 ) ( CLEAR ?auto_182893 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182890 ?auto_182896 ?auto_182891 ?auto_182893 ?auto_182898 )
      ( MAKE-1PILE ?auto_182890 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182899 - BLOCK
    )
    :vars
    (
      ?auto_182900 - BLOCK
      ?auto_182907 - BLOCK
      ?auto_182903 - BLOCK
      ?auto_182905 - BLOCK
      ?auto_182901 - BLOCK
      ?auto_182906 - BLOCK
      ?auto_182904 - BLOCK
      ?auto_182902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182900 ?auto_182899 ) ( ON-TABLE ?auto_182899 ) ( not ( = ?auto_182899 ?auto_182900 ) ) ( not ( = ?auto_182899 ?auto_182907 ) ) ( not ( = ?auto_182899 ?auto_182903 ) ) ( not ( = ?auto_182900 ?auto_182907 ) ) ( not ( = ?auto_182900 ?auto_182903 ) ) ( not ( = ?auto_182907 ?auto_182903 ) ) ( ON ?auto_182907 ?auto_182900 ) ( not ( = ?auto_182905 ?auto_182901 ) ) ( not ( = ?auto_182905 ?auto_182906 ) ) ( not ( = ?auto_182905 ?auto_182904 ) ) ( not ( = ?auto_182905 ?auto_182903 ) ) ( not ( = ?auto_182901 ?auto_182906 ) ) ( not ( = ?auto_182901 ?auto_182904 ) ) ( not ( = ?auto_182901 ?auto_182903 ) ) ( not ( = ?auto_182906 ?auto_182904 ) ) ( not ( = ?auto_182906 ?auto_182903 ) ) ( not ( = ?auto_182904 ?auto_182903 ) ) ( not ( = ?auto_182899 ?auto_182904 ) ) ( not ( = ?auto_182899 ?auto_182905 ) ) ( not ( = ?auto_182899 ?auto_182901 ) ) ( not ( = ?auto_182899 ?auto_182906 ) ) ( not ( = ?auto_182900 ?auto_182904 ) ) ( not ( = ?auto_182900 ?auto_182905 ) ) ( not ( = ?auto_182900 ?auto_182901 ) ) ( not ( = ?auto_182900 ?auto_182906 ) ) ( not ( = ?auto_182907 ?auto_182904 ) ) ( not ( = ?auto_182907 ?auto_182905 ) ) ( not ( = ?auto_182907 ?auto_182901 ) ) ( not ( = ?auto_182907 ?auto_182906 ) ) ( ON ?auto_182903 ?auto_182907 ) ( ON ?auto_182905 ?auto_182902 ) ( not ( = ?auto_182899 ?auto_182902 ) ) ( not ( = ?auto_182900 ?auto_182902 ) ) ( not ( = ?auto_182907 ?auto_182902 ) ) ( not ( = ?auto_182903 ?auto_182902 ) ) ( not ( = ?auto_182905 ?auto_182902 ) ) ( not ( = ?auto_182901 ?auto_182902 ) ) ( not ( = ?auto_182906 ?auto_182902 ) ) ( not ( = ?auto_182904 ?auto_182902 ) ) ( ON ?auto_182901 ?auto_182905 ) ( ON-TABLE ?auto_182902 ) ( ON ?auto_182906 ?auto_182901 ) ( CLEAR ?auto_182903 ) ( ON ?auto_182904 ?auto_182906 ) ( CLEAR ?auto_182904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182902 ?auto_182905 ?auto_182901 ?auto_182906 )
      ( MAKE-1PILE ?auto_182899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182908 - BLOCK
    )
    :vars
    (
      ?auto_182916 - BLOCK
      ?auto_182915 - BLOCK
      ?auto_182913 - BLOCK
      ?auto_182912 - BLOCK
      ?auto_182911 - BLOCK
      ?auto_182914 - BLOCK
      ?auto_182909 - BLOCK
      ?auto_182910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182916 ?auto_182908 ) ( ON-TABLE ?auto_182908 ) ( not ( = ?auto_182908 ?auto_182916 ) ) ( not ( = ?auto_182908 ?auto_182915 ) ) ( not ( = ?auto_182908 ?auto_182913 ) ) ( not ( = ?auto_182916 ?auto_182915 ) ) ( not ( = ?auto_182916 ?auto_182913 ) ) ( not ( = ?auto_182915 ?auto_182913 ) ) ( ON ?auto_182915 ?auto_182916 ) ( not ( = ?auto_182912 ?auto_182911 ) ) ( not ( = ?auto_182912 ?auto_182914 ) ) ( not ( = ?auto_182912 ?auto_182909 ) ) ( not ( = ?auto_182912 ?auto_182913 ) ) ( not ( = ?auto_182911 ?auto_182914 ) ) ( not ( = ?auto_182911 ?auto_182909 ) ) ( not ( = ?auto_182911 ?auto_182913 ) ) ( not ( = ?auto_182914 ?auto_182909 ) ) ( not ( = ?auto_182914 ?auto_182913 ) ) ( not ( = ?auto_182909 ?auto_182913 ) ) ( not ( = ?auto_182908 ?auto_182909 ) ) ( not ( = ?auto_182908 ?auto_182912 ) ) ( not ( = ?auto_182908 ?auto_182911 ) ) ( not ( = ?auto_182908 ?auto_182914 ) ) ( not ( = ?auto_182916 ?auto_182909 ) ) ( not ( = ?auto_182916 ?auto_182912 ) ) ( not ( = ?auto_182916 ?auto_182911 ) ) ( not ( = ?auto_182916 ?auto_182914 ) ) ( not ( = ?auto_182915 ?auto_182909 ) ) ( not ( = ?auto_182915 ?auto_182912 ) ) ( not ( = ?auto_182915 ?auto_182911 ) ) ( not ( = ?auto_182915 ?auto_182914 ) ) ( ON ?auto_182912 ?auto_182910 ) ( not ( = ?auto_182908 ?auto_182910 ) ) ( not ( = ?auto_182916 ?auto_182910 ) ) ( not ( = ?auto_182915 ?auto_182910 ) ) ( not ( = ?auto_182913 ?auto_182910 ) ) ( not ( = ?auto_182912 ?auto_182910 ) ) ( not ( = ?auto_182911 ?auto_182910 ) ) ( not ( = ?auto_182914 ?auto_182910 ) ) ( not ( = ?auto_182909 ?auto_182910 ) ) ( ON ?auto_182911 ?auto_182912 ) ( ON-TABLE ?auto_182910 ) ( ON ?auto_182914 ?auto_182911 ) ( ON ?auto_182909 ?auto_182914 ) ( CLEAR ?auto_182909 ) ( HOLDING ?auto_182913 ) ( CLEAR ?auto_182915 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182908 ?auto_182916 ?auto_182915 ?auto_182913 )
      ( MAKE-1PILE ?auto_182908 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182917 - BLOCK
    )
    :vars
    (
      ?auto_182925 - BLOCK
      ?auto_182923 - BLOCK
      ?auto_182924 - BLOCK
      ?auto_182919 - BLOCK
      ?auto_182920 - BLOCK
      ?auto_182921 - BLOCK
      ?auto_182922 - BLOCK
      ?auto_182918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182925 ?auto_182917 ) ( ON-TABLE ?auto_182917 ) ( not ( = ?auto_182917 ?auto_182925 ) ) ( not ( = ?auto_182917 ?auto_182923 ) ) ( not ( = ?auto_182917 ?auto_182924 ) ) ( not ( = ?auto_182925 ?auto_182923 ) ) ( not ( = ?auto_182925 ?auto_182924 ) ) ( not ( = ?auto_182923 ?auto_182924 ) ) ( ON ?auto_182923 ?auto_182925 ) ( not ( = ?auto_182919 ?auto_182920 ) ) ( not ( = ?auto_182919 ?auto_182921 ) ) ( not ( = ?auto_182919 ?auto_182922 ) ) ( not ( = ?auto_182919 ?auto_182924 ) ) ( not ( = ?auto_182920 ?auto_182921 ) ) ( not ( = ?auto_182920 ?auto_182922 ) ) ( not ( = ?auto_182920 ?auto_182924 ) ) ( not ( = ?auto_182921 ?auto_182922 ) ) ( not ( = ?auto_182921 ?auto_182924 ) ) ( not ( = ?auto_182922 ?auto_182924 ) ) ( not ( = ?auto_182917 ?auto_182922 ) ) ( not ( = ?auto_182917 ?auto_182919 ) ) ( not ( = ?auto_182917 ?auto_182920 ) ) ( not ( = ?auto_182917 ?auto_182921 ) ) ( not ( = ?auto_182925 ?auto_182922 ) ) ( not ( = ?auto_182925 ?auto_182919 ) ) ( not ( = ?auto_182925 ?auto_182920 ) ) ( not ( = ?auto_182925 ?auto_182921 ) ) ( not ( = ?auto_182923 ?auto_182922 ) ) ( not ( = ?auto_182923 ?auto_182919 ) ) ( not ( = ?auto_182923 ?auto_182920 ) ) ( not ( = ?auto_182923 ?auto_182921 ) ) ( ON ?auto_182919 ?auto_182918 ) ( not ( = ?auto_182917 ?auto_182918 ) ) ( not ( = ?auto_182925 ?auto_182918 ) ) ( not ( = ?auto_182923 ?auto_182918 ) ) ( not ( = ?auto_182924 ?auto_182918 ) ) ( not ( = ?auto_182919 ?auto_182918 ) ) ( not ( = ?auto_182920 ?auto_182918 ) ) ( not ( = ?auto_182921 ?auto_182918 ) ) ( not ( = ?auto_182922 ?auto_182918 ) ) ( ON ?auto_182920 ?auto_182919 ) ( ON-TABLE ?auto_182918 ) ( ON ?auto_182921 ?auto_182920 ) ( ON ?auto_182922 ?auto_182921 ) ( CLEAR ?auto_182923 ) ( ON ?auto_182924 ?auto_182922 ) ( CLEAR ?auto_182924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182918 ?auto_182919 ?auto_182920 ?auto_182921 ?auto_182922 )
      ( MAKE-1PILE ?auto_182917 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182926 - BLOCK
    )
    :vars
    (
      ?auto_182927 - BLOCK
      ?auto_182933 - BLOCK
      ?auto_182931 - BLOCK
      ?auto_182932 - BLOCK
      ?auto_182934 - BLOCK
      ?auto_182929 - BLOCK
      ?auto_182930 - BLOCK
      ?auto_182928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182927 ?auto_182926 ) ( ON-TABLE ?auto_182926 ) ( not ( = ?auto_182926 ?auto_182927 ) ) ( not ( = ?auto_182926 ?auto_182933 ) ) ( not ( = ?auto_182926 ?auto_182931 ) ) ( not ( = ?auto_182927 ?auto_182933 ) ) ( not ( = ?auto_182927 ?auto_182931 ) ) ( not ( = ?auto_182933 ?auto_182931 ) ) ( not ( = ?auto_182932 ?auto_182934 ) ) ( not ( = ?auto_182932 ?auto_182929 ) ) ( not ( = ?auto_182932 ?auto_182930 ) ) ( not ( = ?auto_182932 ?auto_182931 ) ) ( not ( = ?auto_182934 ?auto_182929 ) ) ( not ( = ?auto_182934 ?auto_182930 ) ) ( not ( = ?auto_182934 ?auto_182931 ) ) ( not ( = ?auto_182929 ?auto_182930 ) ) ( not ( = ?auto_182929 ?auto_182931 ) ) ( not ( = ?auto_182930 ?auto_182931 ) ) ( not ( = ?auto_182926 ?auto_182930 ) ) ( not ( = ?auto_182926 ?auto_182932 ) ) ( not ( = ?auto_182926 ?auto_182934 ) ) ( not ( = ?auto_182926 ?auto_182929 ) ) ( not ( = ?auto_182927 ?auto_182930 ) ) ( not ( = ?auto_182927 ?auto_182932 ) ) ( not ( = ?auto_182927 ?auto_182934 ) ) ( not ( = ?auto_182927 ?auto_182929 ) ) ( not ( = ?auto_182933 ?auto_182930 ) ) ( not ( = ?auto_182933 ?auto_182932 ) ) ( not ( = ?auto_182933 ?auto_182934 ) ) ( not ( = ?auto_182933 ?auto_182929 ) ) ( ON ?auto_182932 ?auto_182928 ) ( not ( = ?auto_182926 ?auto_182928 ) ) ( not ( = ?auto_182927 ?auto_182928 ) ) ( not ( = ?auto_182933 ?auto_182928 ) ) ( not ( = ?auto_182931 ?auto_182928 ) ) ( not ( = ?auto_182932 ?auto_182928 ) ) ( not ( = ?auto_182934 ?auto_182928 ) ) ( not ( = ?auto_182929 ?auto_182928 ) ) ( not ( = ?auto_182930 ?auto_182928 ) ) ( ON ?auto_182934 ?auto_182932 ) ( ON-TABLE ?auto_182928 ) ( ON ?auto_182929 ?auto_182934 ) ( ON ?auto_182930 ?auto_182929 ) ( ON ?auto_182931 ?auto_182930 ) ( CLEAR ?auto_182931 ) ( HOLDING ?auto_182933 ) ( CLEAR ?auto_182927 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182926 ?auto_182927 ?auto_182933 )
      ( MAKE-1PILE ?auto_182926 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182935 - BLOCK
    )
    :vars
    (
      ?auto_182940 - BLOCK
      ?auto_182936 - BLOCK
      ?auto_182941 - BLOCK
      ?auto_182939 - BLOCK
      ?auto_182937 - BLOCK
      ?auto_182942 - BLOCK
      ?auto_182938 - BLOCK
      ?auto_182943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182940 ?auto_182935 ) ( ON-TABLE ?auto_182935 ) ( not ( = ?auto_182935 ?auto_182940 ) ) ( not ( = ?auto_182935 ?auto_182936 ) ) ( not ( = ?auto_182935 ?auto_182941 ) ) ( not ( = ?auto_182940 ?auto_182936 ) ) ( not ( = ?auto_182940 ?auto_182941 ) ) ( not ( = ?auto_182936 ?auto_182941 ) ) ( not ( = ?auto_182939 ?auto_182937 ) ) ( not ( = ?auto_182939 ?auto_182942 ) ) ( not ( = ?auto_182939 ?auto_182938 ) ) ( not ( = ?auto_182939 ?auto_182941 ) ) ( not ( = ?auto_182937 ?auto_182942 ) ) ( not ( = ?auto_182937 ?auto_182938 ) ) ( not ( = ?auto_182937 ?auto_182941 ) ) ( not ( = ?auto_182942 ?auto_182938 ) ) ( not ( = ?auto_182942 ?auto_182941 ) ) ( not ( = ?auto_182938 ?auto_182941 ) ) ( not ( = ?auto_182935 ?auto_182938 ) ) ( not ( = ?auto_182935 ?auto_182939 ) ) ( not ( = ?auto_182935 ?auto_182937 ) ) ( not ( = ?auto_182935 ?auto_182942 ) ) ( not ( = ?auto_182940 ?auto_182938 ) ) ( not ( = ?auto_182940 ?auto_182939 ) ) ( not ( = ?auto_182940 ?auto_182937 ) ) ( not ( = ?auto_182940 ?auto_182942 ) ) ( not ( = ?auto_182936 ?auto_182938 ) ) ( not ( = ?auto_182936 ?auto_182939 ) ) ( not ( = ?auto_182936 ?auto_182937 ) ) ( not ( = ?auto_182936 ?auto_182942 ) ) ( ON ?auto_182939 ?auto_182943 ) ( not ( = ?auto_182935 ?auto_182943 ) ) ( not ( = ?auto_182940 ?auto_182943 ) ) ( not ( = ?auto_182936 ?auto_182943 ) ) ( not ( = ?auto_182941 ?auto_182943 ) ) ( not ( = ?auto_182939 ?auto_182943 ) ) ( not ( = ?auto_182937 ?auto_182943 ) ) ( not ( = ?auto_182942 ?auto_182943 ) ) ( not ( = ?auto_182938 ?auto_182943 ) ) ( ON ?auto_182937 ?auto_182939 ) ( ON-TABLE ?auto_182943 ) ( ON ?auto_182942 ?auto_182937 ) ( ON ?auto_182938 ?auto_182942 ) ( ON ?auto_182941 ?auto_182938 ) ( CLEAR ?auto_182940 ) ( ON ?auto_182936 ?auto_182941 ) ( CLEAR ?auto_182936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182943 ?auto_182939 ?auto_182937 ?auto_182942 ?auto_182938 ?auto_182941 )
      ( MAKE-1PILE ?auto_182935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182962 - BLOCK
    )
    :vars
    (
      ?auto_182965 - BLOCK
      ?auto_182969 - BLOCK
      ?auto_182964 - BLOCK
      ?auto_182966 - BLOCK
      ?auto_182963 - BLOCK
      ?auto_182968 - BLOCK
      ?auto_182970 - BLOCK
      ?auto_182967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182962 ?auto_182965 ) ) ( not ( = ?auto_182962 ?auto_182969 ) ) ( not ( = ?auto_182962 ?auto_182964 ) ) ( not ( = ?auto_182965 ?auto_182969 ) ) ( not ( = ?auto_182965 ?auto_182964 ) ) ( not ( = ?auto_182969 ?auto_182964 ) ) ( not ( = ?auto_182966 ?auto_182963 ) ) ( not ( = ?auto_182966 ?auto_182968 ) ) ( not ( = ?auto_182966 ?auto_182970 ) ) ( not ( = ?auto_182966 ?auto_182964 ) ) ( not ( = ?auto_182963 ?auto_182968 ) ) ( not ( = ?auto_182963 ?auto_182970 ) ) ( not ( = ?auto_182963 ?auto_182964 ) ) ( not ( = ?auto_182968 ?auto_182970 ) ) ( not ( = ?auto_182968 ?auto_182964 ) ) ( not ( = ?auto_182970 ?auto_182964 ) ) ( not ( = ?auto_182962 ?auto_182970 ) ) ( not ( = ?auto_182962 ?auto_182966 ) ) ( not ( = ?auto_182962 ?auto_182963 ) ) ( not ( = ?auto_182962 ?auto_182968 ) ) ( not ( = ?auto_182965 ?auto_182970 ) ) ( not ( = ?auto_182965 ?auto_182966 ) ) ( not ( = ?auto_182965 ?auto_182963 ) ) ( not ( = ?auto_182965 ?auto_182968 ) ) ( not ( = ?auto_182969 ?auto_182970 ) ) ( not ( = ?auto_182969 ?auto_182966 ) ) ( not ( = ?auto_182969 ?auto_182963 ) ) ( not ( = ?auto_182969 ?auto_182968 ) ) ( ON ?auto_182966 ?auto_182967 ) ( not ( = ?auto_182962 ?auto_182967 ) ) ( not ( = ?auto_182965 ?auto_182967 ) ) ( not ( = ?auto_182969 ?auto_182967 ) ) ( not ( = ?auto_182964 ?auto_182967 ) ) ( not ( = ?auto_182966 ?auto_182967 ) ) ( not ( = ?auto_182963 ?auto_182967 ) ) ( not ( = ?auto_182968 ?auto_182967 ) ) ( not ( = ?auto_182970 ?auto_182967 ) ) ( ON ?auto_182963 ?auto_182966 ) ( ON-TABLE ?auto_182967 ) ( ON ?auto_182968 ?auto_182963 ) ( ON ?auto_182970 ?auto_182968 ) ( ON ?auto_182964 ?auto_182970 ) ( ON ?auto_182969 ?auto_182964 ) ( ON ?auto_182965 ?auto_182969 ) ( CLEAR ?auto_182965 ) ( HOLDING ?auto_182962 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182962 ?auto_182965 )
      ( MAKE-1PILE ?auto_182962 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182971 - BLOCK
    )
    :vars
    (
      ?auto_182972 - BLOCK
      ?auto_182973 - BLOCK
      ?auto_182979 - BLOCK
      ?auto_182978 - BLOCK
      ?auto_182976 - BLOCK
      ?auto_182975 - BLOCK
      ?auto_182974 - BLOCK
      ?auto_182977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182971 ?auto_182972 ) ) ( not ( = ?auto_182971 ?auto_182973 ) ) ( not ( = ?auto_182971 ?auto_182979 ) ) ( not ( = ?auto_182972 ?auto_182973 ) ) ( not ( = ?auto_182972 ?auto_182979 ) ) ( not ( = ?auto_182973 ?auto_182979 ) ) ( not ( = ?auto_182978 ?auto_182976 ) ) ( not ( = ?auto_182978 ?auto_182975 ) ) ( not ( = ?auto_182978 ?auto_182974 ) ) ( not ( = ?auto_182978 ?auto_182979 ) ) ( not ( = ?auto_182976 ?auto_182975 ) ) ( not ( = ?auto_182976 ?auto_182974 ) ) ( not ( = ?auto_182976 ?auto_182979 ) ) ( not ( = ?auto_182975 ?auto_182974 ) ) ( not ( = ?auto_182975 ?auto_182979 ) ) ( not ( = ?auto_182974 ?auto_182979 ) ) ( not ( = ?auto_182971 ?auto_182974 ) ) ( not ( = ?auto_182971 ?auto_182978 ) ) ( not ( = ?auto_182971 ?auto_182976 ) ) ( not ( = ?auto_182971 ?auto_182975 ) ) ( not ( = ?auto_182972 ?auto_182974 ) ) ( not ( = ?auto_182972 ?auto_182978 ) ) ( not ( = ?auto_182972 ?auto_182976 ) ) ( not ( = ?auto_182972 ?auto_182975 ) ) ( not ( = ?auto_182973 ?auto_182974 ) ) ( not ( = ?auto_182973 ?auto_182978 ) ) ( not ( = ?auto_182973 ?auto_182976 ) ) ( not ( = ?auto_182973 ?auto_182975 ) ) ( ON ?auto_182978 ?auto_182977 ) ( not ( = ?auto_182971 ?auto_182977 ) ) ( not ( = ?auto_182972 ?auto_182977 ) ) ( not ( = ?auto_182973 ?auto_182977 ) ) ( not ( = ?auto_182979 ?auto_182977 ) ) ( not ( = ?auto_182978 ?auto_182977 ) ) ( not ( = ?auto_182976 ?auto_182977 ) ) ( not ( = ?auto_182975 ?auto_182977 ) ) ( not ( = ?auto_182974 ?auto_182977 ) ) ( ON ?auto_182976 ?auto_182978 ) ( ON-TABLE ?auto_182977 ) ( ON ?auto_182975 ?auto_182976 ) ( ON ?auto_182974 ?auto_182975 ) ( ON ?auto_182979 ?auto_182974 ) ( ON ?auto_182973 ?auto_182979 ) ( ON ?auto_182972 ?auto_182973 ) ( ON ?auto_182971 ?auto_182972 ) ( CLEAR ?auto_182971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182977 ?auto_182978 ?auto_182976 ?auto_182975 ?auto_182974 ?auto_182979 ?auto_182973 ?auto_182972 )
      ( MAKE-1PILE ?auto_182971 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_182987 - BLOCK
      ?auto_182988 - BLOCK
      ?auto_182989 - BLOCK
      ?auto_182990 - BLOCK
      ?auto_182991 - BLOCK
      ?auto_182992 - BLOCK
      ?auto_182993 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_182993 ) ( CLEAR ?auto_182992 ) ( ON-TABLE ?auto_182987 ) ( ON ?auto_182988 ?auto_182987 ) ( ON ?auto_182989 ?auto_182988 ) ( ON ?auto_182990 ?auto_182989 ) ( ON ?auto_182991 ?auto_182990 ) ( ON ?auto_182992 ?auto_182991 ) ( not ( = ?auto_182987 ?auto_182988 ) ) ( not ( = ?auto_182987 ?auto_182989 ) ) ( not ( = ?auto_182987 ?auto_182990 ) ) ( not ( = ?auto_182987 ?auto_182991 ) ) ( not ( = ?auto_182987 ?auto_182992 ) ) ( not ( = ?auto_182987 ?auto_182993 ) ) ( not ( = ?auto_182988 ?auto_182989 ) ) ( not ( = ?auto_182988 ?auto_182990 ) ) ( not ( = ?auto_182988 ?auto_182991 ) ) ( not ( = ?auto_182988 ?auto_182992 ) ) ( not ( = ?auto_182988 ?auto_182993 ) ) ( not ( = ?auto_182989 ?auto_182990 ) ) ( not ( = ?auto_182989 ?auto_182991 ) ) ( not ( = ?auto_182989 ?auto_182992 ) ) ( not ( = ?auto_182989 ?auto_182993 ) ) ( not ( = ?auto_182990 ?auto_182991 ) ) ( not ( = ?auto_182990 ?auto_182992 ) ) ( not ( = ?auto_182990 ?auto_182993 ) ) ( not ( = ?auto_182991 ?auto_182992 ) ) ( not ( = ?auto_182991 ?auto_182993 ) ) ( not ( = ?auto_182992 ?auto_182993 ) ) )
    :subtasks
    ( ( !STACK ?auto_182993 ?auto_182992 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_182994 - BLOCK
      ?auto_182995 - BLOCK
      ?auto_182996 - BLOCK
      ?auto_182997 - BLOCK
      ?auto_182998 - BLOCK
      ?auto_182999 - BLOCK
      ?auto_183000 - BLOCK
    )
    :vars
    (
      ?auto_183001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_182999 ) ( ON-TABLE ?auto_182994 ) ( ON ?auto_182995 ?auto_182994 ) ( ON ?auto_182996 ?auto_182995 ) ( ON ?auto_182997 ?auto_182996 ) ( ON ?auto_182998 ?auto_182997 ) ( ON ?auto_182999 ?auto_182998 ) ( not ( = ?auto_182994 ?auto_182995 ) ) ( not ( = ?auto_182994 ?auto_182996 ) ) ( not ( = ?auto_182994 ?auto_182997 ) ) ( not ( = ?auto_182994 ?auto_182998 ) ) ( not ( = ?auto_182994 ?auto_182999 ) ) ( not ( = ?auto_182994 ?auto_183000 ) ) ( not ( = ?auto_182995 ?auto_182996 ) ) ( not ( = ?auto_182995 ?auto_182997 ) ) ( not ( = ?auto_182995 ?auto_182998 ) ) ( not ( = ?auto_182995 ?auto_182999 ) ) ( not ( = ?auto_182995 ?auto_183000 ) ) ( not ( = ?auto_182996 ?auto_182997 ) ) ( not ( = ?auto_182996 ?auto_182998 ) ) ( not ( = ?auto_182996 ?auto_182999 ) ) ( not ( = ?auto_182996 ?auto_183000 ) ) ( not ( = ?auto_182997 ?auto_182998 ) ) ( not ( = ?auto_182997 ?auto_182999 ) ) ( not ( = ?auto_182997 ?auto_183000 ) ) ( not ( = ?auto_182998 ?auto_182999 ) ) ( not ( = ?auto_182998 ?auto_183000 ) ) ( not ( = ?auto_182999 ?auto_183000 ) ) ( ON ?auto_183000 ?auto_183001 ) ( CLEAR ?auto_183000 ) ( HAND-EMPTY ) ( not ( = ?auto_182994 ?auto_183001 ) ) ( not ( = ?auto_182995 ?auto_183001 ) ) ( not ( = ?auto_182996 ?auto_183001 ) ) ( not ( = ?auto_182997 ?auto_183001 ) ) ( not ( = ?auto_182998 ?auto_183001 ) ) ( not ( = ?auto_182999 ?auto_183001 ) ) ( not ( = ?auto_183000 ?auto_183001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183000 ?auto_183001 )
      ( MAKE-7PILE ?auto_182994 ?auto_182995 ?auto_182996 ?auto_182997 ?auto_182998 ?auto_182999 ?auto_183000 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183002 - BLOCK
      ?auto_183003 - BLOCK
      ?auto_183004 - BLOCK
      ?auto_183005 - BLOCK
      ?auto_183006 - BLOCK
      ?auto_183007 - BLOCK
      ?auto_183008 - BLOCK
    )
    :vars
    (
      ?auto_183009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183002 ) ( ON ?auto_183003 ?auto_183002 ) ( ON ?auto_183004 ?auto_183003 ) ( ON ?auto_183005 ?auto_183004 ) ( ON ?auto_183006 ?auto_183005 ) ( not ( = ?auto_183002 ?auto_183003 ) ) ( not ( = ?auto_183002 ?auto_183004 ) ) ( not ( = ?auto_183002 ?auto_183005 ) ) ( not ( = ?auto_183002 ?auto_183006 ) ) ( not ( = ?auto_183002 ?auto_183007 ) ) ( not ( = ?auto_183002 ?auto_183008 ) ) ( not ( = ?auto_183003 ?auto_183004 ) ) ( not ( = ?auto_183003 ?auto_183005 ) ) ( not ( = ?auto_183003 ?auto_183006 ) ) ( not ( = ?auto_183003 ?auto_183007 ) ) ( not ( = ?auto_183003 ?auto_183008 ) ) ( not ( = ?auto_183004 ?auto_183005 ) ) ( not ( = ?auto_183004 ?auto_183006 ) ) ( not ( = ?auto_183004 ?auto_183007 ) ) ( not ( = ?auto_183004 ?auto_183008 ) ) ( not ( = ?auto_183005 ?auto_183006 ) ) ( not ( = ?auto_183005 ?auto_183007 ) ) ( not ( = ?auto_183005 ?auto_183008 ) ) ( not ( = ?auto_183006 ?auto_183007 ) ) ( not ( = ?auto_183006 ?auto_183008 ) ) ( not ( = ?auto_183007 ?auto_183008 ) ) ( ON ?auto_183008 ?auto_183009 ) ( CLEAR ?auto_183008 ) ( not ( = ?auto_183002 ?auto_183009 ) ) ( not ( = ?auto_183003 ?auto_183009 ) ) ( not ( = ?auto_183004 ?auto_183009 ) ) ( not ( = ?auto_183005 ?auto_183009 ) ) ( not ( = ?auto_183006 ?auto_183009 ) ) ( not ( = ?auto_183007 ?auto_183009 ) ) ( not ( = ?auto_183008 ?auto_183009 ) ) ( HOLDING ?auto_183007 ) ( CLEAR ?auto_183006 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183002 ?auto_183003 ?auto_183004 ?auto_183005 ?auto_183006 ?auto_183007 )
      ( MAKE-7PILE ?auto_183002 ?auto_183003 ?auto_183004 ?auto_183005 ?auto_183006 ?auto_183007 ?auto_183008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183010 - BLOCK
      ?auto_183011 - BLOCK
      ?auto_183012 - BLOCK
      ?auto_183013 - BLOCK
      ?auto_183014 - BLOCK
      ?auto_183015 - BLOCK
      ?auto_183016 - BLOCK
    )
    :vars
    (
      ?auto_183017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183010 ) ( ON ?auto_183011 ?auto_183010 ) ( ON ?auto_183012 ?auto_183011 ) ( ON ?auto_183013 ?auto_183012 ) ( ON ?auto_183014 ?auto_183013 ) ( not ( = ?auto_183010 ?auto_183011 ) ) ( not ( = ?auto_183010 ?auto_183012 ) ) ( not ( = ?auto_183010 ?auto_183013 ) ) ( not ( = ?auto_183010 ?auto_183014 ) ) ( not ( = ?auto_183010 ?auto_183015 ) ) ( not ( = ?auto_183010 ?auto_183016 ) ) ( not ( = ?auto_183011 ?auto_183012 ) ) ( not ( = ?auto_183011 ?auto_183013 ) ) ( not ( = ?auto_183011 ?auto_183014 ) ) ( not ( = ?auto_183011 ?auto_183015 ) ) ( not ( = ?auto_183011 ?auto_183016 ) ) ( not ( = ?auto_183012 ?auto_183013 ) ) ( not ( = ?auto_183012 ?auto_183014 ) ) ( not ( = ?auto_183012 ?auto_183015 ) ) ( not ( = ?auto_183012 ?auto_183016 ) ) ( not ( = ?auto_183013 ?auto_183014 ) ) ( not ( = ?auto_183013 ?auto_183015 ) ) ( not ( = ?auto_183013 ?auto_183016 ) ) ( not ( = ?auto_183014 ?auto_183015 ) ) ( not ( = ?auto_183014 ?auto_183016 ) ) ( not ( = ?auto_183015 ?auto_183016 ) ) ( ON ?auto_183016 ?auto_183017 ) ( not ( = ?auto_183010 ?auto_183017 ) ) ( not ( = ?auto_183011 ?auto_183017 ) ) ( not ( = ?auto_183012 ?auto_183017 ) ) ( not ( = ?auto_183013 ?auto_183017 ) ) ( not ( = ?auto_183014 ?auto_183017 ) ) ( not ( = ?auto_183015 ?auto_183017 ) ) ( not ( = ?auto_183016 ?auto_183017 ) ) ( CLEAR ?auto_183014 ) ( ON ?auto_183015 ?auto_183016 ) ( CLEAR ?auto_183015 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183017 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183017 ?auto_183016 )
      ( MAKE-7PILE ?auto_183010 ?auto_183011 ?auto_183012 ?auto_183013 ?auto_183014 ?auto_183015 ?auto_183016 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183018 - BLOCK
      ?auto_183019 - BLOCK
      ?auto_183020 - BLOCK
      ?auto_183021 - BLOCK
      ?auto_183022 - BLOCK
      ?auto_183023 - BLOCK
      ?auto_183024 - BLOCK
    )
    :vars
    (
      ?auto_183025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183018 ) ( ON ?auto_183019 ?auto_183018 ) ( ON ?auto_183020 ?auto_183019 ) ( ON ?auto_183021 ?auto_183020 ) ( not ( = ?auto_183018 ?auto_183019 ) ) ( not ( = ?auto_183018 ?auto_183020 ) ) ( not ( = ?auto_183018 ?auto_183021 ) ) ( not ( = ?auto_183018 ?auto_183022 ) ) ( not ( = ?auto_183018 ?auto_183023 ) ) ( not ( = ?auto_183018 ?auto_183024 ) ) ( not ( = ?auto_183019 ?auto_183020 ) ) ( not ( = ?auto_183019 ?auto_183021 ) ) ( not ( = ?auto_183019 ?auto_183022 ) ) ( not ( = ?auto_183019 ?auto_183023 ) ) ( not ( = ?auto_183019 ?auto_183024 ) ) ( not ( = ?auto_183020 ?auto_183021 ) ) ( not ( = ?auto_183020 ?auto_183022 ) ) ( not ( = ?auto_183020 ?auto_183023 ) ) ( not ( = ?auto_183020 ?auto_183024 ) ) ( not ( = ?auto_183021 ?auto_183022 ) ) ( not ( = ?auto_183021 ?auto_183023 ) ) ( not ( = ?auto_183021 ?auto_183024 ) ) ( not ( = ?auto_183022 ?auto_183023 ) ) ( not ( = ?auto_183022 ?auto_183024 ) ) ( not ( = ?auto_183023 ?auto_183024 ) ) ( ON ?auto_183024 ?auto_183025 ) ( not ( = ?auto_183018 ?auto_183025 ) ) ( not ( = ?auto_183019 ?auto_183025 ) ) ( not ( = ?auto_183020 ?auto_183025 ) ) ( not ( = ?auto_183021 ?auto_183025 ) ) ( not ( = ?auto_183022 ?auto_183025 ) ) ( not ( = ?auto_183023 ?auto_183025 ) ) ( not ( = ?auto_183024 ?auto_183025 ) ) ( ON ?auto_183023 ?auto_183024 ) ( CLEAR ?auto_183023 ) ( ON-TABLE ?auto_183025 ) ( HOLDING ?auto_183022 ) ( CLEAR ?auto_183021 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183018 ?auto_183019 ?auto_183020 ?auto_183021 ?auto_183022 )
      ( MAKE-7PILE ?auto_183018 ?auto_183019 ?auto_183020 ?auto_183021 ?auto_183022 ?auto_183023 ?auto_183024 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183026 - BLOCK
      ?auto_183027 - BLOCK
      ?auto_183028 - BLOCK
      ?auto_183029 - BLOCK
      ?auto_183030 - BLOCK
      ?auto_183031 - BLOCK
      ?auto_183032 - BLOCK
    )
    :vars
    (
      ?auto_183033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183026 ) ( ON ?auto_183027 ?auto_183026 ) ( ON ?auto_183028 ?auto_183027 ) ( ON ?auto_183029 ?auto_183028 ) ( not ( = ?auto_183026 ?auto_183027 ) ) ( not ( = ?auto_183026 ?auto_183028 ) ) ( not ( = ?auto_183026 ?auto_183029 ) ) ( not ( = ?auto_183026 ?auto_183030 ) ) ( not ( = ?auto_183026 ?auto_183031 ) ) ( not ( = ?auto_183026 ?auto_183032 ) ) ( not ( = ?auto_183027 ?auto_183028 ) ) ( not ( = ?auto_183027 ?auto_183029 ) ) ( not ( = ?auto_183027 ?auto_183030 ) ) ( not ( = ?auto_183027 ?auto_183031 ) ) ( not ( = ?auto_183027 ?auto_183032 ) ) ( not ( = ?auto_183028 ?auto_183029 ) ) ( not ( = ?auto_183028 ?auto_183030 ) ) ( not ( = ?auto_183028 ?auto_183031 ) ) ( not ( = ?auto_183028 ?auto_183032 ) ) ( not ( = ?auto_183029 ?auto_183030 ) ) ( not ( = ?auto_183029 ?auto_183031 ) ) ( not ( = ?auto_183029 ?auto_183032 ) ) ( not ( = ?auto_183030 ?auto_183031 ) ) ( not ( = ?auto_183030 ?auto_183032 ) ) ( not ( = ?auto_183031 ?auto_183032 ) ) ( ON ?auto_183032 ?auto_183033 ) ( not ( = ?auto_183026 ?auto_183033 ) ) ( not ( = ?auto_183027 ?auto_183033 ) ) ( not ( = ?auto_183028 ?auto_183033 ) ) ( not ( = ?auto_183029 ?auto_183033 ) ) ( not ( = ?auto_183030 ?auto_183033 ) ) ( not ( = ?auto_183031 ?auto_183033 ) ) ( not ( = ?auto_183032 ?auto_183033 ) ) ( ON ?auto_183031 ?auto_183032 ) ( ON-TABLE ?auto_183033 ) ( CLEAR ?auto_183029 ) ( ON ?auto_183030 ?auto_183031 ) ( CLEAR ?auto_183030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183033 ?auto_183032 ?auto_183031 )
      ( MAKE-7PILE ?auto_183026 ?auto_183027 ?auto_183028 ?auto_183029 ?auto_183030 ?auto_183031 ?auto_183032 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183034 - BLOCK
      ?auto_183035 - BLOCK
      ?auto_183036 - BLOCK
      ?auto_183037 - BLOCK
      ?auto_183038 - BLOCK
      ?auto_183039 - BLOCK
      ?auto_183040 - BLOCK
    )
    :vars
    (
      ?auto_183041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183034 ) ( ON ?auto_183035 ?auto_183034 ) ( ON ?auto_183036 ?auto_183035 ) ( not ( = ?auto_183034 ?auto_183035 ) ) ( not ( = ?auto_183034 ?auto_183036 ) ) ( not ( = ?auto_183034 ?auto_183037 ) ) ( not ( = ?auto_183034 ?auto_183038 ) ) ( not ( = ?auto_183034 ?auto_183039 ) ) ( not ( = ?auto_183034 ?auto_183040 ) ) ( not ( = ?auto_183035 ?auto_183036 ) ) ( not ( = ?auto_183035 ?auto_183037 ) ) ( not ( = ?auto_183035 ?auto_183038 ) ) ( not ( = ?auto_183035 ?auto_183039 ) ) ( not ( = ?auto_183035 ?auto_183040 ) ) ( not ( = ?auto_183036 ?auto_183037 ) ) ( not ( = ?auto_183036 ?auto_183038 ) ) ( not ( = ?auto_183036 ?auto_183039 ) ) ( not ( = ?auto_183036 ?auto_183040 ) ) ( not ( = ?auto_183037 ?auto_183038 ) ) ( not ( = ?auto_183037 ?auto_183039 ) ) ( not ( = ?auto_183037 ?auto_183040 ) ) ( not ( = ?auto_183038 ?auto_183039 ) ) ( not ( = ?auto_183038 ?auto_183040 ) ) ( not ( = ?auto_183039 ?auto_183040 ) ) ( ON ?auto_183040 ?auto_183041 ) ( not ( = ?auto_183034 ?auto_183041 ) ) ( not ( = ?auto_183035 ?auto_183041 ) ) ( not ( = ?auto_183036 ?auto_183041 ) ) ( not ( = ?auto_183037 ?auto_183041 ) ) ( not ( = ?auto_183038 ?auto_183041 ) ) ( not ( = ?auto_183039 ?auto_183041 ) ) ( not ( = ?auto_183040 ?auto_183041 ) ) ( ON ?auto_183039 ?auto_183040 ) ( ON-TABLE ?auto_183041 ) ( ON ?auto_183038 ?auto_183039 ) ( CLEAR ?auto_183038 ) ( HOLDING ?auto_183037 ) ( CLEAR ?auto_183036 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183034 ?auto_183035 ?auto_183036 ?auto_183037 )
      ( MAKE-7PILE ?auto_183034 ?auto_183035 ?auto_183036 ?auto_183037 ?auto_183038 ?auto_183039 ?auto_183040 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183042 - BLOCK
      ?auto_183043 - BLOCK
      ?auto_183044 - BLOCK
      ?auto_183045 - BLOCK
      ?auto_183046 - BLOCK
      ?auto_183047 - BLOCK
      ?auto_183048 - BLOCK
    )
    :vars
    (
      ?auto_183049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183042 ) ( ON ?auto_183043 ?auto_183042 ) ( ON ?auto_183044 ?auto_183043 ) ( not ( = ?auto_183042 ?auto_183043 ) ) ( not ( = ?auto_183042 ?auto_183044 ) ) ( not ( = ?auto_183042 ?auto_183045 ) ) ( not ( = ?auto_183042 ?auto_183046 ) ) ( not ( = ?auto_183042 ?auto_183047 ) ) ( not ( = ?auto_183042 ?auto_183048 ) ) ( not ( = ?auto_183043 ?auto_183044 ) ) ( not ( = ?auto_183043 ?auto_183045 ) ) ( not ( = ?auto_183043 ?auto_183046 ) ) ( not ( = ?auto_183043 ?auto_183047 ) ) ( not ( = ?auto_183043 ?auto_183048 ) ) ( not ( = ?auto_183044 ?auto_183045 ) ) ( not ( = ?auto_183044 ?auto_183046 ) ) ( not ( = ?auto_183044 ?auto_183047 ) ) ( not ( = ?auto_183044 ?auto_183048 ) ) ( not ( = ?auto_183045 ?auto_183046 ) ) ( not ( = ?auto_183045 ?auto_183047 ) ) ( not ( = ?auto_183045 ?auto_183048 ) ) ( not ( = ?auto_183046 ?auto_183047 ) ) ( not ( = ?auto_183046 ?auto_183048 ) ) ( not ( = ?auto_183047 ?auto_183048 ) ) ( ON ?auto_183048 ?auto_183049 ) ( not ( = ?auto_183042 ?auto_183049 ) ) ( not ( = ?auto_183043 ?auto_183049 ) ) ( not ( = ?auto_183044 ?auto_183049 ) ) ( not ( = ?auto_183045 ?auto_183049 ) ) ( not ( = ?auto_183046 ?auto_183049 ) ) ( not ( = ?auto_183047 ?auto_183049 ) ) ( not ( = ?auto_183048 ?auto_183049 ) ) ( ON ?auto_183047 ?auto_183048 ) ( ON-TABLE ?auto_183049 ) ( ON ?auto_183046 ?auto_183047 ) ( CLEAR ?auto_183044 ) ( ON ?auto_183045 ?auto_183046 ) ( CLEAR ?auto_183045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183049 ?auto_183048 ?auto_183047 ?auto_183046 )
      ( MAKE-7PILE ?auto_183042 ?auto_183043 ?auto_183044 ?auto_183045 ?auto_183046 ?auto_183047 ?auto_183048 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183050 - BLOCK
      ?auto_183051 - BLOCK
      ?auto_183052 - BLOCK
      ?auto_183053 - BLOCK
      ?auto_183054 - BLOCK
      ?auto_183055 - BLOCK
      ?auto_183056 - BLOCK
    )
    :vars
    (
      ?auto_183057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183050 ) ( ON ?auto_183051 ?auto_183050 ) ( not ( = ?auto_183050 ?auto_183051 ) ) ( not ( = ?auto_183050 ?auto_183052 ) ) ( not ( = ?auto_183050 ?auto_183053 ) ) ( not ( = ?auto_183050 ?auto_183054 ) ) ( not ( = ?auto_183050 ?auto_183055 ) ) ( not ( = ?auto_183050 ?auto_183056 ) ) ( not ( = ?auto_183051 ?auto_183052 ) ) ( not ( = ?auto_183051 ?auto_183053 ) ) ( not ( = ?auto_183051 ?auto_183054 ) ) ( not ( = ?auto_183051 ?auto_183055 ) ) ( not ( = ?auto_183051 ?auto_183056 ) ) ( not ( = ?auto_183052 ?auto_183053 ) ) ( not ( = ?auto_183052 ?auto_183054 ) ) ( not ( = ?auto_183052 ?auto_183055 ) ) ( not ( = ?auto_183052 ?auto_183056 ) ) ( not ( = ?auto_183053 ?auto_183054 ) ) ( not ( = ?auto_183053 ?auto_183055 ) ) ( not ( = ?auto_183053 ?auto_183056 ) ) ( not ( = ?auto_183054 ?auto_183055 ) ) ( not ( = ?auto_183054 ?auto_183056 ) ) ( not ( = ?auto_183055 ?auto_183056 ) ) ( ON ?auto_183056 ?auto_183057 ) ( not ( = ?auto_183050 ?auto_183057 ) ) ( not ( = ?auto_183051 ?auto_183057 ) ) ( not ( = ?auto_183052 ?auto_183057 ) ) ( not ( = ?auto_183053 ?auto_183057 ) ) ( not ( = ?auto_183054 ?auto_183057 ) ) ( not ( = ?auto_183055 ?auto_183057 ) ) ( not ( = ?auto_183056 ?auto_183057 ) ) ( ON ?auto_183055 ?auto_183056 ) ( ON-TABLE ?auto_183057 ) ( ON ?auto_183054 ?auto_183055 ) ( ON ?auto_183053 ?auto_183054 ) ( CLEAR ?auto_183053 ) ( HOLDING ?auto_183052 ) ( CLEAR ?auto_183051 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183050 ?auto_183051 ?auto_183052 )
      ( MAKE-7PILE ?auto_183050 ?auto_183051 ?auto_183052 ?auto_183053 ?auto_183054 ?auto_183055 ?auto_183056 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183058 - BLOCK
      ?auto_183059 - BLOCK
      ?auto_183060 - BLOCK
      ?auto_183061 - BLOCK
      ?auto_183062 - BLOCK
      ?auto_183063 - BLOCK
      ?auto_183064 - BLOCK
    )
    :vars
    (
      ?auto_183065 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183058 ) ( ON ?auto_183059 ?auto_183058 ) ( not ( = ?auto_183058 ?auto_183059 ) ) ( not ( = ?auto_183058 ?auto_183060 ) ) ( not ( = ?auto_183058 ?auto_183061 ) ) ( not ( = ?auto_183058 ?auto_183062 ) ) ( not ( = ?auto_183058 ?auto_183063 ) ) ( not ( = ?auto_183058 ?auto_183064 ) ) ( not ( = ?auto_183059 ?auto_183060 ) ) ( not ( = ?auto_183059 ?auto_183061 ) ) ( not ( = ?auto_183059 ?auto_183062 ) ) ( not ( = ?auto_183059 ?auto_183063 ) ) ( not ( = ?auto_183059 ?auto_183064 ) ) ( not ( = ?auto_183060 ?auto_183061 ) ) ( not ( = ?auto_183060 ?auto_183062 ) ) ( not ( = ?auto_183060 ?auto_183063 ) ) ( not ( = ?auto_183060 ?auto_183064 ) ) ( not ( = ?auto_183061 ?auto_183062 ) ) ( not ( = ?auto_183061 ?auto_183063 ) ) ( not ( = ?auto_183061 ?auto_183064 ) ) ( not ( = ?auto_183062 ?auto_183063 ) ) ( not ( = ?auto_183062 ?auto_183064 ) ) ( not ( = ?auto_183063 ?auto_183064 ) ) ( ON ?auto_183064 ?auto_183065 ) ( not ( = ?auto_183058 ?auto_183065 ) ) ( not ( = ?auto_183059 ?auto_183065 ) ) ( not ( = ?auto_183060 ?auto_183065 ) ) ( not ( = ?auto_183061 ?auto_183065 ) ) ( not ( = ?auto_183062 ?auto_183065 ) ) ( not ( = ?auto_183063 ?auto_183065 ) ) ( not ( = ?auto_183064 ?auto_183065 ) ) ( ON ?auto_183063 ?auto_183064 ) ( ON-TABLE ?auto_183065 ) ( ON ?auto_183062 ?auto_183063 ) ( ON ?auto_183061 ?auto_183062 ) ( CLEAR ?auto_183059 ) ( ON ?auto_183060 ?auto_183061 ) ( CLEAR ?auto_183060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183065 ?auto_183064 ?auto_183063 ?auto_183062 ?auto_183061 )
      ( MAKE-7PILE ?auto_183058 ?auto_183059 ?auto_183060 ?auto_183061 ?auto_183062 ?auto_183063 ?auto_183064 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183066 - BLOCK
      ?auto_183067 - BLOCK
      ?auto_183068 - BLOCK
      ?auto_183069 - BLOCK
      ?auto_183070 - BLOCK
      ?auto_183071 - BLOCK
      ?auto_183072 - BLOCK
    )
    :vars
    (
      ?auto_183073 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183066 ) ( not ( = ?auto_183066 ?auto_183067 ) ) ( not ( = ?auto_183066 ?auto_183068 ) ) ( not ( = ?auto_183066 ?auto_183069 ) ) ( not ( = ?auto_183066 ?auto_183070 ) ) ( not ( = ?auto_183066 ?auto_183071 ) ) ( not ( = ?auto_183066 ?auto_183072 ) ) ( not ( = ?auto_183067 ?auto_183068 ) ) ( not ( = ?auto_183067 ?auto_183069 ) ) ( not ( = ?auto_183067 ?auto_183070 ) ) ( not ( = ?auto_183067 ?auto_183071 ) ) ( not ( = ?auto_183067 ?auto_183072 ) ) ( not ( = ?auto_183068 ?auto_183069 ) ) ( not ( = ?auto_183068 ?auto_183070 ) ) ( not ( = ?auto_183068 ?auto_183071 ) ) ( not ( = ?auto_183068 ?auto_183072 ) ) ( not ( = ?auto_183069 ?auto_183070 ) ) ( not ( = ?auto_183069 ?auto_183071 ) ) ( not ( = ?auto_183069 ?auto_183072 ) ) ( not ( = ?auto_183070 ?auto_183071 ) ) ( not ( = ?auto_183070 ?auto_183072 ) ) ( not ( = ?auto_183071 ?auto_183072 ) ) ( ON ?auto_183072 ?auto_183073 ) ( not ( = ?auto_183066 ?auto_183073 ) ) ( not ( = ?auto_183067 ?auto_183073 ) ) ( not ( = ?auto_183068 ?auto_183073 ) ) ( not ( = ?auto_183069 ?auto_183073 ) ) ( not ( = ?auto_183070 ?auto_183073 ) ) ( not ( = ?auto_183071 ?auto_183073 ) ) ( not ( = ?auto_183072 ?auto_183073 ) ) ( ON ?auto_183071 ?auto_183072 ) ( ON-TABLE ?auto_183073 ) ( ON ?auto_183070 ?auto_183071 ) ( ON ?auto_183069 ?auto_183070 ) ( ON ?auto_183068 ?auto_183069 ) ( CLEAR ?auto_183068 ) ( HOLDING ?auto_183067 ) ( CLEAR ?auto_183066 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183066 ?auto_183067 )
      ( MAKE-7PILE ?auto_183066 ?auto_183067 ?auto_183068 ?auto_183069 ?auto_183070 ?auto_183071 ?auto_183072 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183074 - BLOCK
      ?auto_183075 - BLOCK
      ?auto_183076 - BLOCK
      ?auto_183077 - BLOCK
      ?auto_183078 - BLOCK
      ?auto_183079 - BLOCK
      ?auto_183080 - BLOCK
    )
    :vars
    (
      ?auto_183081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183074 ) ( not ( = ?auto_183074 ?auto_183075 ) ) ( not ( = ?auto_183074 ?auto_183076 ) ) ( not ( = ?auto_183074 ?auto_183077 ) ) ( not ( = ?auto_183074 ?auto_183078 ) ) ( not ( = ?auto_183074 ?auto_183079 ) ) ( not ( = ?auto_183074 ?auto_183080 ) ) ( not ( = ?auto_183075 ?auto_183076 ) ) ( not ( = ?auto_183075 ?auto_183077 ) ) ( not ( = ?auto_183075 ?auto_183078 ) ) ( not ( = ?auto_183075 ?auto_183079 ) ) ( not ( = ?auto_183075 ?auto_183080 ) ) ( not ( = ?auto_183076 ?auto_183077 ) ) ( not ( = ?auto_183076 ?auto_183078 ) ) ( not ( = ?auto_183076 ?auto_183079 ) ) ( not ( = ?auto_183076 ?auto_183080 ) ) ( not ( = ?auto_183077 ?auto_183078 ) ) ( not ( = ?auto_183077 ?auto_183079 ) ) ( not ( = ?auto_183077 ?auto_183080 ) ) ( not ( = ?auto_183078 ?auto_183079 ) ) ( not ( = ?auto_183078 ?auto_183080 ) ) ( not ( = ?auto_183079 ?auto_183080 ) ) ( ON ?auto_183080 ?auto_183081 ) ( not ( = ?auto_183074 ?auto_183081 ) ) ( not ( = ?auto_183075 ?auto_183081 ) ) ( not ( = ?auto_183076 ?auto_183081 ) ) ( not ( = ?auto_183077 ?auto_183081 ) ) ( not ( = ?auto_183078 ?auto_183081 ) ) ( not ( = ?auto_183079 ?auto_183081 ) ) ( not ( = ?auto_183080 ?auto_183081 ) ) ( ON ?auto_183079 ?auto_183080 ) ( ON-TABLE ?auto_183081 ) ( ON ?auto_183078 ?auto_183079 ) ( ON ?auto_183077 ?auto_183078 ) ( ON ?auto_183076 ?auto_183077 ) ( CLEAR ?auto_183074 ) ( ON ?auto_183075 ?auto_183076 ) ( CLEAR ?auto_183075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183081 ?auto_183080 ?auto_183079 ?auto_183078 ?auto_183077 ?auto_183076 )
      ( MAKE-7PILE ?auto_183074 ?auto_183075 ?auto_183076 ?auto_183077 ?auto_183078 ?auto_183079 ?auto_183080 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183082 - BLOCK
      ?auto_183083 - BLOCK
      ?auto_183084 - BLOCK
      ?auto_183085 - BLOCK
      ?auto_183086 - BLOCK
      ?auto_183087 - BLOCK
      ?auto_183088 - BLOCK
    )
    :vars
    (
      ?auto_183089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183082 ?auto_183083 ) ) ( not ( = ?auto_183082 ?auto_183084 ) ) ( not ( = ?auto_183082 ?auto_183085 ) ) ( not ( = ?auto_183082 ?auto_183086 ) ) ( not ( = ?auto_183082 ?auto_183087 ) ) ( not ( = ?auto_183082 ?auto_183088 ) ) ( not ( = ?auto_183083 ?auto_183084 ) ) ( not ( = ?auto_183083 ?auto_183085 ) ) ( not ( = ?auto_183083 ?auto_183086 ) ) ( not ( = ?auto_183083 ?auto_183087 ) ) ( not ( = ?auto_183083 ?auto_183088 ) ) ( not ( = ?auto_183084 ?auto_183085 ) ) ( not ( = ?auto_183084 ?auto_183086 ) ) ( not ( = ?auto_183084 ?auto_183087 ) ) ( not ( = ?auto_183084 ?auto_183088 ) ) ( not ( = ?auto_183085 ?auto_183086 ) ) ( not ( = ?auto_183085 ?auto_183087 ) ) ( not ( = ?auto_183085 ?auto_183088 ) ) ( not ( = ?auto_183086 ?auto_183087 ) ) ( not ( = ?auto_183086 ?auto_183088 ) ) ( not ( = ?auto_183087 ?auto_183088 ) ) ( ON ?auto_183088 ?auto_183089 ) ( not ( = ?auto_183082 ?auto_183089 ) ) ( not ( = ?auto_183083 ?auto_183089 ) ) ( not ( = ?auto_183084 ?auto_183089 ) ) ( not ( = ?auto_183085 ?auto_183089 ) ) ( not ( = ?auto_183086 ?auto_183089 ) ) ( not ( = ?auto_183087 ?auto_183089 ) ) ( not ( = ?auto_183088 ?auto_183089 ) ) ( ON ?auto_183087 ?auto_183088 ) ( ON-TABLE ?auto_183089 ) ( ON ?auto_183086 ?auto_183087 ) ( ON ?auto_183085 ?auto_183086 ) ( ON ?auto_183084 ?auto_183085 ) ( ON ?auto_183083 ?auto_183084 ) ( CLEAR ?auto_183083 ) ( HOLDING ?auto_183082 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183082 )
      ( MAKE-7PILE ?auto_183082 ?auto_183083 ?auto_183084 ?auto_183085 ?auto_183086 ?auto_183087 ?auto_183088 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183090 - BLOCK
      ?auto_183091 - BLOCK
      ?auto_183092 - BLOCK
      ?auto_183093 - BLOCK
      ?auto_183094 - BLOCK
      ?auto_183095 - BLOCK
      ?auto_183096 - BLOCK
    )
    :vars
    (
      ?auto_183097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183090 ?auto_183091 ) ) ( not ( = ?auto_183090 ?auto_183092 ) ) ( not ( = ?auto_183090 ?auto_183093 ) ) ( not ( = ?auto_183090 ?auto_183094 ) ) ( not ( = ?auto_183090 ?auto_183095 ) ) ( not ( = ?auto_183090 ?auto_183096 ) ) ( not ( = ?auto_183091 ?auto_183092 ) ) ( not ( = ?auto_183091 ?auto_183093 ) ) ( not ( = ?auto_183091 ?auto_183094 ) ) ( not ( = ?auto_183091 ?auto_183095 ) ) ( not ( = ?auto_183091 ?auto_183096 ) ) ( not ( = ?auto_183092 ?auto_183093 ) ) ( not ( = ?auto_183092 ?auto_183094 ) ) ( not ( = ?auto_183092 ?auto_183095 ) ) ( not ( = ?auto_183092 ?auto_183096 ) ) ( not ( = ?auto_183093 ?auto_183094 ) ) ( not ( = ?auto_183093 ?auto_183095 ) ) ( not ( = ?auto_183093 ?auto_183096 ) ) ( not ( = ?auto_183094 ?auto_183095 ) ) ( not ( = ?auto_183094 ?auto_183096 ) ) ( not ( = ?auto_183095 ?auto_183096 ) ) ( ON ?auto_183096 ?auto_183097 ) ( not ( = ?auto_183090 ?auto_183097 ) ) ( not ( = ?auto_183091 ?auto_183097 ) ) ( not ( = ?auto_183092 ?auto_183097 ) ) ( not ( = ?auto_183093 ?auto_183097 ) ) ( not ( = ?auto_183094 ?auto_183097 ) ) ( not ( = ?auto_183095 ?auto_183097 ) ) ( not ( = ?auto_183096 ?auto_183097 ) ) ( ON ?auto_183095 ?auto_183096 ) ( ON-TABLE ?auto_183097 ) ( ON ?auto_183094 ?auto_183095 ) ( ON ?auto_183093 ?auto_183094 ) ( ON ?auto_183092 ?auto_183093 ) ( ON ?auto_183091 ?auto_183092 ) ( ON ?auto_183090 ?auto_183091 ) ( CLEAR ?auto_183090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183097 ?auto_183096 ?auto_183095 ?auto_183094 ?auto_183093 ?auto_183092 ?auto_183091 )
      ( MAKE-7PILE ?auto_183090 ?auto_183091 ?auto_183092 ?auto_183093 ?auto_183094 ?auto_183095 ?auto_183096 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183098 - BLOCK
      ?auto_183099 - BLOCK
      ?auto_183100 - BLOCK
      ?auto_183101 - BLOCK
      ?auto_183102 - BLOCK
      ?auto_183103 - BLOCK
      ?auto_183104 - BLOCK
    )
    :vars
    (
      ?auto_183105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183098 ?auto_183099 ) ) ( not ( = ?auto_183098 ?auto_183100 ) ) ( not ( = ?auto_183098 ?auto_183101 ) ) ( not ( = ?auto_183098 ?auto_183102 ) ) ( not ( = ?auto_183098 ?auto_183103 ) ) ( not ( = ?auto_183098 ?auto_183104 ) ) ( not ( = ?auto_183099 ?auto_183100 ) ) ( not ( = ?auto_183099 ?auto_183101 ) ) ( not ( = ?auto_183099 ?auto_183102 ) ) ( not ( = ?auto_183099 ?auto_183103 ) ) ( not ( = ?auto_183099 ?auto_183104 ) ) ( not ( = ?auto_183100 ?auto_183101 ) ) ( not ( = ?auto_183100 ?auto_183102 ) ) ( not ( = ?auto_183100 ?auto_183103 ) ) ( not ( = ?auto_183100 ?auto_183104 ) ) ( not ( = ?auto_183101 ?auto_183102 ) ) ( not ( = ?auto_183101 ?auto_183103 ) ) ( not ( = ?auto_183101 ?auto_183104 ) ) ( not ( = ?auto_183102 ?auto_183103 ) ) ( not ( = ?auto_183102 ?auto_183104 ) ) ( not ( = ?auto_183103 ?auto_183104 ) ) ( ON ?auto_183104 ?auto_183105 ) ( not ( = ?auto_183098 ?auto_183105 ) ) ( not ( = ?auto_183099 ?auto_183105 ) ) ( not ( = ?auto_183100 ?auto_183105 ) ) ( not ( = ?auto_183101 ?auto_183105 ) ) ( not ( = ?auto_183102 ?auto_183105 ) ) ( not ( = ?auto_183103 ?auto_183105 ) ) ( not ( = ?auto_183104 ?auto_183105 ) ) ( ON ?auto_183103 ?auto_183104 ) ( ON-TABLE ?auto_183105 ) ( ON ?auto_183102 ?auto_183103 ) ( ON ?auto_183101 ?auto_183102 ) ( ON ?auto_183100 ?auto_183101 ) ( ON ?auto_183099 ?auto_183100 ) ( HOLDING ?auto_183098 ) ( CLEAR ?auto_183099 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183105 ?auto_183104 ?auto_183103 ?auto_183102 ?auto_183101 ?auto_183100 ?auto_183099 ?auto_183098 )
      ( MAKE-7PILE ?auto_183098 ?auto_183099 ?auto_183100 ?auto_183101 ?auto_183102 ?auto_183103 ?auto_183104 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183106 - BLOCK
      ?auto_183107 - BLOCK
      ?auto_183108 - BLOCK
      ?auto_183109 - BLOCK
      ?auto_183110 - BLOCK
      ?auto_183111 - BLOCK
      ?auto_183112 - BLOCK
    )
    :vars
    (
      ?auto_183113 - BLOCK
      ?auto_183114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183106 ?auto_183107 ) ) ( not ( = ?auto_183106 ?auto_183108 ) ) ( not ( = ?auto_183106 ?auto_183109 ) ) ( not ( = ?auto_183106 ?auto_183110 ) ) ( not ( = ?auto_183106 ?auto_183111 ) ) ( not ( = ?auto_183106 ?auto_183112 ) ) ( not ( = ?auto_183107 ?auto_183108 ) ) ( not ( = ?auto_183107 ?auto_183109 ) ) ( not ( = ?auto_183107 ?auto_183110 ) ) ( not ( = ?auto_183107 ?auto_183111 ) ) ( not ( = ?auto_183107 ?auto_183112 ) ) ( not ( = ?auto_183108 ?auto_183109 ) ) ( not ( = ?auto_183108 ?auto_183110 ) ) ( not ( = ?auto_183108 ?auto_183111 ) ) ( not ( = ?auto_183108 ?auto_183112 ) ) ( not ( = ?auto_183109 ?auto_183110 ) ) ( not ( = ?auto_183109 ?auto_183111 ) ) ( not ( = ?auto_183109 ?auto_183112 ) ) ( not ( = ?auto_183110 ?auto_183111 ) ) ( not ( = ?auto_183110 ?auto_183112 ) ) ( not ( = ?auto_183111 ?auto_183112 ) ) ( ON ?auto_183112 ?auto_183113 ) ( not ( = ?auto_183106 ?auto_183113 ) ) ( not ( = ?auto_183107 ?auto_183113 ) ) ( not ( = ?auto_183108 ?auto_183113 ) ) ( not ( = ?auto_183109 ?auto_183113 ) ) ( not ( = ?auto_183110 ?auto_183113 ) ) ( not ( = ?auto_183111 ?auto_183113 ) ) ( not ( = ?auto_183112 ?auto_183113 ) ) ( ON ?auto_183111 ?auto_183112 ) ( ON-TABLE ?auto_183113 ) ( ON ?auto_183110 ?auto_183111 ) ( ON ?auto_183109 ?auto_183110 ) ( ON ?auto_183108 ?auto_183109 ) ( ON ?auto_183107 ?auto_183108 ) ( CLEAR ?auto_183107 ) ( ON ?auto_183106 ?auto_183114 ) ( CLEAR ?auto_183106 ) ( HAND-EMPTY ) ( not ( = ?auto_183106 ?auto_183114 ) ) ( not ( = ?auto_183107 ?auto_183114 ) ) ( not ( = ?auto_183108 ?auto_183114 ) ) ( not ( = ?auto_183109 ?auto_183114 ) ) ( not ( = ?auto_183110 ?auto_183114 ) ) ( not ( = ?auto_183111 ?auto_183114 ) ) ( not ( = ?auto_183112 ?auto_183114 ) ) ( not ( = ?auto_183113 ?auto_183114 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183106 ?auto_183114 )
      ( MAKE-7PILE ?auto_183106 ?auto_183107 ?auto_183108 ?auto_183109 ?auto_183110 ?auto_183111 ?auto_183112 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183115 - BLOCK
      ?auto_183116 - BLOCK
      ?auto_183117 - BLOCK
      ?auto_183118 - BLOCK
      ?auto_183119 - BLOCK
      ?auto_183120 - BLOCK
      ?auto_183121 - BLOCK
    )
    :vars
    (
      ?auto_183123 - BLOCK
      ?auto_183122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183115 ?auto_183116 ) ) ( not ( = ?auto_183115 ?auto_183117 ) ) ( not ( = ?auto_183115 ?auto_183118 ) ) ( not ( = ?auto_183115 ?auto_183119 ) ) ( not ( = ?auto_183115 ?auto_183120 ) ) ( not ( = ?auto_183115 ?auto_183121 ) ) ( not ( = ?auto_183116 ?auto_183117 ) ) ( not ( = ?auto_183116 ?auto_183118 ) ) ( not ( = ?auto_183116 ?auto_183119 ) ) ( not ( = ?auto_183116 ?auto_183120 ) ) ( not ( = ?auto_183116 ?auto_183121 ) ) ( not ( = ?auto_183117 ?auto_183118 ) ) ( not ( = ?auto_183117 ?auto_183119 ) ) ( not ( = ?auto_183117 ?auto_183120 ) ) ( not ( = ?auto_183117 ?auto_183121 ) ) ( not ( = ?auto_183118 ?auto_183119 ) ) ( not ( = ?auto_183118 ?auto_183120 ) ) ( not ( = ?auto_183118 ?auto_183121 ) ) ( not ( = ?auto_183119 ?auto_183120 ) ) ( not ( = ?auto_183119 ?auto_183121 ) ) ( not ( = ?auto_183120 ?auto_183121 ) ) ( ON ?auto_183121 ?auto_183123 ) ( not ( = ?auto_183115 ?auto_183123 ) ) ( not ( = ?auto_183116 ?auto_183123 ) ) ( not ( = ?auto_183117 ?auto_183123 ) ) ( not ( = ?auto_183118 ?auto_183123 ) ) ( not ( = ?auto_183119 ?auto_183123 ) ) ( not ( = ?auto_183120 ?auto_183123 ) ) ( not ( = ?auto_183121 ?auto_183123 ) ) ( ON ?auto_183120 ?auto_183121 ) ( ON-TABLE ?auto_183123 ) ( ON ?auto_183119 ?auto_183120 ) ( ON ?auto_183118 ?auto_183119 ) ( ON ?auto_183117 ?auto_183118 ) ( ON ?auto_183115 ?auto_183122 ) ( CLEAR ?auto_183115 ) ( not ( = ?auto_183115 ?auto_183122 ) ) ( not ( = ?auto_183116 ?auto_183122 ) ) ( not ( = ?auto_183117 ?auto_183122 ) ) ( not ( = ?auto_183118 ?auto_183122 ) ) ( not ( = ?auto_183119 ?auto_183122 ) ) ( not ( = ?auto_183120 ?auto_183122 ) ) ( not ( = ?auto_183121 ?auto_183122 ) ) ( not ( = ?auto_183123 ?auto_183122 ) ) ( HOLDING ?auto_183116 ) ( CLEAR ?auto_183117 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183123 ?auto_183121 ?auto_183120 ?auto_183119 ?auto_183118 ?auto_183117 ?auto_183116 )
      ( MAKE-7PILE ?auto_183115 ?auto_183116 ?auto_183117 ?auto_183118 ?auto_183119 ?auto_183120 ?auto_183121 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183124 - BLOCK
      ?auto_183125 - BLOCK
      ?auto_183126 - BLOCK
      ?auto_183127 - BLOCK
      ?auto_183128 - BLOCK
      ?auto_183129 - BLOCK
      ?auto_183130 - BLOCK
    )
    :vars
    (
      ?auto_183131 - BLOCK
      ?auto_183132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183124 ?auto_183125 ) ) ( not ( = ?auto_183124 ?auto_183126 ) ) ( not ( = ?auto_183124 ?auto_183127 ) ) ( not ( = ?auto_183124 ?auto_183128 ) ) ( not ( = ?auto_183124 ?auto_183129 ) ) ( not ( = ?auto_183124 ?auto_183130 ) ) ( not ( = ?auto_183125 ?auto_183126 ) ) ( not ( = ?auto_183125 ?auto_183127 ) ) ( not ( = ?auto_183125 ?auto_183128 ) ) ( not ( = ?auto_183125 ?auto_183129 ) ) ( not ( = ?auto_183125 ?auto_183130 ) ) ( not ( = ?auto_183126 ?auto_183127 ) ) ( not ( = ?auto_183126 ?auto_183128 ) ) ( not ( = ?auto_183126 ?auto_183129 ) ) ( not ( = ?auto_183126 ?auto_183130 ) ) ( not ( = ?auto_183127 ?auto_183128 ) ) ( not ( = ?auto_183127 ?auto_183129 ) ) ( not ( = ?auto_183127 ?auto_183130 ) ) ( not ( = ?auto_183128 ?auto_183129 ) ) ( not ( = ?auto_183128 ?auto_183130 ) ) ( not ( = ?auto_183129 ?auto_183130 ) ) ( ON ?auto_183130 ?auto_183131 ) ( not ( = ?auto_183124 ?auto_183131 ) ) ( not ( = ?auto_183125 ?auto_183131 ) ) ( not ( = ?auto_183126 ?auto_183131 ) ) ( not ( = ?auto_183127 ?auto_183131 ) ) ( not ( = ?auto_183128 ?auto_183131 ) ) ( not ( = ?auto_183129 ?auto_183131 ) ) ( not ( = ?auto_183130 ?auto_183131 ) ) ( ON ?auto_183129 ?auto_183130 ) ( ON-TABLE ?auto_183131 ) ( ON ?auto_183128 ?auto_183129 ) ( ON ?auto_183127 ?auto_183128 ) ( ON ?auto_183126 ?auto_183127 ) ( ON ?auto_183124 ?auto_183132 ) ( not ( = ?auto_183124 ?auto_183132 ) ) ( not ( = ?auto_183125 ?auto_183132 ) ) ( not ( = ?auto_183126 ?auto_183132 ) ) ( not ( = ?auto_183127 ?auto_183132 ) ) ( not ( = ?auto_183128 ?auto_183132 ) ) ( not ( = ?auto_183129 ?auto_183132 ) ) ( not ( = ?auto_183130 ?auto_183132 ) ) ( not ( = ?auto_183131 ?auto_183132 ) ) ( CLEAR ?auto_183126 ) ( ON ?auto_183125 ?auto_183124 ) ( CLEAR ?auto_183125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183132 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183132 ?auto_183124 )
      ( MAKE-7PILE ?auto_183124 ?auto_183125 ?auto_183126 ?auto_183127 ?auto_183128 ?auto_183129 ?auto_183130 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183133 - BLOCK
      ?auto_183134 - BLOCK
      ?auto_183135 - BLOCK
      ?auto_183136 - BLOCK
      ?auto_183137 - BLOCK
      ?auto_183138 - BLOCK
      ?auto_183139 - BLOCK
    )
    :vars
    (
      ?auto_183140 - BLOCK
      ?auto_183141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183133 ?auto_183134 ) ) ( not ( = ?auto_183133 ?auto_183135 ) ) ( not ( = ?auto_183133 ?auto_183136 ) ) ( not ( = ?auto_183133 ?auto_183137 ) ) ( not ( = ?auto_183133 ?auto_183138 ) ) ( not ( = ?auto_183133 ?auto_183139 ) ) ( not ( = ?auto_183134 ?auto_183135 ) ) ( not ( = ?auto_183134 ?auto_183136 ) ) ( not ( = ?auto_183134 ?auto_183137 ) ) ( not ( = ?auto_183134 ?auto_183138 ) ) ( not ( = ?auto_183134 ?auto_183139 ) ) ( not ( = ?auto_183135 ?auto_183136 ) ) ( not ( = ?auto_183135 ?auto_183137 ) ) ( not ( = ?auto_183135 ?auto_183138 ) ) ( not ( = ?auto_183135 ?auto_183139 ) ) ( not ( = ?auto_183136 ?auto_183137 ) ) ( not ( = ?auto_183136 ?auto_183138 ) ) ( not ( = ?auto_183136 ?auto_183139 ) ) ( not ( = ?auto_183137 ?auto_183138 ) ) ( not ( = ?auto_183137 ?auto_183139 ) ) ( not ( = ?auto_183138 ?auto_183139 ) ) ( ON ?auto_183139 ?auto_183140 ) ( not ( = ?auto_183133 ?auto_183140 ) ) ( not ( = ?auto_183134 ?auto_183140 ) ) ( not ( = ?auto_183135 ?auto_183140 ) ) ( not ( = ?auto_183136 ?auto_183140 ) ) ( not ( = ?auto_183137 ?auto_183140 ) ) ( not ( = ?auto_183138 ?auto_183140 ) ) ( not ( = ?auto_183139 ?auto_183140 ) ) ( ON ?auto_183138 ?auto_183139 ) ( ON-TABLE ?auto_183140 ) ( ON ?auto_183137 ?auto_183138 ) ( ON ?auto_183136 ?auto_183137 ) ( ON ?auto_183133 ?auto_183141 ) ( not ( = ?auto_183133 ?auto_183141 ) ) ( not ( = ?auto_183134 ?auto_183141 ) ) ( not ( = ?auto_183135 ?auto_183141 ) ) ( not ( = ?auto_183136 ?auto_183141 ) ) ( not ( = ?auto_183137 ?auto_183141 ) ) ( not ( = ?auto_183138 ?auto_183141 ) ) ( not ( = ?auto_183139 ?auto_183141 ) ) ( not ( = ?auto_183140 ?auto_183141 ) ) ( ON ?auto_183134 ?auto_183133 ) ( CLEAR ?auto_183134 ) ( ON-TABLE ?auto_183141 ) ( HOLDING ?auto_183135 ) ( CLEAR ?auto_183136 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183140 ?auto_183139 ?auto_183138 ?auto_183137 ?auto_183136 ?auto_183135 )
      ( MAKE-7PILE ?auto_183133 ?auto_183134 ?auto_183135 ?auto_183136 ?auto_183137 ?auto_183138 ?auto_183139 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183142 - BLOCK
      ?auto_183143 - BLOCK
      ?auto_183144 - BLOCK
      ?auto_183145 - BLOCK
      ?auto_183146 - BLOCK
      ?auto_183147 - BLOCK
      ?auto_183148 - BLOCK
    )
    :vars
    (
      ?auto_183150 - BLOCK
      ?auto_183149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183142 ?auto_183143 ) ) ( not ( = ?auto_183142 ?auto_183144 ) ) ( not ( = ?auto_183142 ?auto_183145 ) ) ( not ( = ?auto_183142 ?auto_183146 ) ) ( not ( = ?auto_183142 ?auto_183147 ) ) ( not ( = ?auto_183142 ?auto_183148 ) ) ( not ( = ?auto_183143 ?auto_183144 ) ) ( not ( = ?auto_183143 ?auto_183145 ) ) ( not ( = ?auto_183143 ?auto_183146 ) ) ( not ( = ?auto_183143 ?auto_183147 ) ) ( not ( = ?auto_183143 ?auto_183148 ) ) ( not ( = ?auto_183144 ?auto_183145 ) ) ( not ( = ?auto_183144 ?auto_183146 ) ) ( not ( = ?auto_183144 ?auto_183147 ) ) ( not ( = ?auto_183144 ?auto_183148 ) ) ( not ( = ?auto_183145 ?auto_183146 ) ) ( not ( = ?auto_183145 ?auto_183147 ) ) ( not ( = ?auto_183145 ?auto_183148 ) ) ( not ( = ?auto_183146 ?auto_183147 ) ) ( not ( = ?auto_183146 ?auto_183148 ) ) ( not ( = ?auto_183147 ?auto_183148 ) ) ( ON ?auto_183148 ?auto_183150 ) ( not ( = ?auto_183142 ?auto_183150 ) ) ( not ( = ?auto_183143 ?auto_183150 ) ) ( not ( = ?auto_183144 ?auto_183150 ) ) ( not ( = ?auto_183145 ?auto_183150 ) ) ( not ( = ?auto_183146 ?auto_183150 ) ) ( not ( = ?auto_183147 ?auto_183150 ) ) ( not ( = ?auto_183148 ?auto_183150 ) ) ( ON ?auto_183147 ?auto_183148 ) ( ON-TABLE ?auto_183150 ) ( ON ?auto_183146 ?auto_183147 ) ( ON ?auto_183145 ?auto_183146 ) ( ON ?auto_183142 ?auto_183149 ) ( not ( = ?auto_183142 ?auto_183149 ) ) ( not ( = ?auto_183143 ?auto_183149 ) ) ( not ( = ?auto_183144 ?auto_183149 ) ) ( not ( = ?auto_183145 ?auto_183149 ) ) ( not ( = ?auto_183146 ?auto_183149 ) ) ( not ( = ?auto_183147 ?auto_183149 ) ) ( not ( = ?auto_183148 ?auto_183149 ) ) ( not ( = ?auto_183150 ?auto_183149 ) ) ( ON ?auto_183143 ?auto_183142 ) ( ON-TABLE ?auto_183149 ) ( CLEAR ?auto_183145 ) ( ON ?auto_183144 ?auto_183143 ) ( CLEAR ?auto_183144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183149 ?auto_183142 ?auto_183143 )
      ( MAKE-7PILE ?auto_183142 ?auto_183143 ?auto_183144 ?auto_183145 ?auto_183146 ?auto_183147 ?auto_183148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183151 - BLOCK
      ?auto_183152 - BLOCK
      ?auto_183153 - BLOCK
      ?auto_183154 - BLOCK
      ?auto_183155 - BLOCK
      ?auto_183156 - BLOCK
      ?auto_183157 - BLOCK
    )
    :vars
    (
      ?auto_183158 - BLOCK
      ?auto_183159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183151 ?auto_183152 ) ) ( not ( = ?auto_183151 ?auto_183153 ) ) ( not ( = ?auto_183151 ?auto_183154 ) ) ( not ( = ?auto_183151 ?auto_183155 ) ) ( not ( = ?auto_183151 ?auto_183156 ) ) ( not ( = ?auto_183151 ?auto_183157 ) ) ( not ( = ?auto_183152 ?auto_183153 ) ) ( not ( = ?auto_183152 ?auto_183154 ) ) ( not ( = ?auto_183152 ?auto_183155 ) ) ( not ( = ?auto_183152 ?auto_183156 ) ) ( not ( = ?auto_183152 ?auto_183157 ) ) ( not ( = ?auto_183153 ?auto_183154 ) ) ( not ( = ?auto_183153 ?auto_183155 ) ) ( not ( = ?auto_183153 ?auto_183156 ) ) ( not ( = ?auto_183153 ?auto_183157 ) ) ( not ( = ?auto_183154 ?auto_183155 ) ) ( not ( = ?auto_183154 ?auto_183156 ) ) ( not ( = ?auto_183154 ?auto_183157 ) ) ( not ( = ?auto_183155 ?auto_183156 ) ) ( not ( = ?auto_183155 ?auto_183157 ) ) ( not ( = ?auto_183156 ?auto_183157 ) ) ( ON ?auto_183157 ?auto_183158 ) ( not ( = ?auto_183151 ?auto_183158 ) ) ( not ( = ?auto_183152 ?auto_183158 ) ) ( not ( = ?auto_183153 ?auto_183158 ) ) ( not ( = ?auto_183154 ?auto_183158 ) ) ( not ( = ?auto_183155 ?auto_183158 ) ) ( not ( = ?auto_183156 ?auto_183158 ) ) ( not ( = ?auto_183157 ?auto_183158 ) ) ( ON ?auto_183156 ?auto_183157 ) ( ON-TABLE ?auto_183158 ) ( ON ?auto_183155 ?auto_183156 ) ( ON ?auto_183151 ?auto_183159 ) ( not ( = ?auto_183151 ?auto_183159 ) ) ( not ( = ?auto_183152 ?auto_183159 ) ) ( not ( = ?auto_183153 ?auto_183159 ) ) ( not ( = ?auto_183154 ?auto_183159 ) ) ( not ( = ?auto_183155 ?auto_183159 ) ) ( not ( = ?auto_183156 ?auto_183159 ) ) ( not ( = ?auto_183157 ?auto_183159 ) ) ( not ( = ?auto_183158 ?auto_183159 ) ) ( ON ?auto_183152 ?auto_183151 ) ( ON-TABLE ?auto_183159 ) ( ON ?auto_183153 ?auto_183152 ) ( CLEAR ?auto_183153 ) ( HOLDING ?auto_183154 ) ( CLEAR ?auto_183155 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183158 ?auto_183157 ?auto_183156 ?auto_183155 ?auto_183154 )
      ( MAKE-7PILE ?auto_183151 ?auto_183152 ?auto_183153 ?auto_183154 ?auto_183155 ?auto_183156 ?auto_183157 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183160 - BLOCK
      ?auto_183161 - BLOCK
      ?auto_183162 - BLOCK
      ?auto_183163 - BLOCK
      ?auto_183164 - BLOCK
      ?auto_183165 - BLOCK
      ?auto_183166 - BLOCK
    )
    :vars
    (
      ?auto_183168 - BLOCK
      ?auto_183167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183160 ?auto_183161 ) ) ( not ( = ?auto_183160 ?auto_183162 ) ) ( not ( = ?auto_183160 ?auto_183163 ) ) ( not ( = ?auto_183160 ?auto_183164 ) ) ( not ( = ?auto_183160 ?auto_183165 ) ) ( not ( = ?auto_183160 ?auto_183166 ) ) ( not ( = ?auto_183161 ?auto_183162 ) ) ( not ( = ?auto_183161 ?auto_183163 ) ) ( not ( = ?auto_183161 ?auto_183164 ) ) ( not ( = ?auto_183161 ?auto_183165 ) ) ( not ( = ?auto_183161 ?auto_183166 ) ) ( not ( = ?auto_183162 ?auto_183163 ) ) ( not ( = ?auto_183162 ?auto_183164 ) ) ( not ( = ?auto_183162 ?auto_183165 ) ) ( not ( = ?auto_183162 ?auto_183166 ) ) ( not ( = ?auto_183163 ?auto_183164 ) ) ( not ( = ?auto_183163 ?auto_183165 ) ) ( not ( = ?auto_183163 ?auto_183166 ) ) ( not ( = ?auto_183164 ?auto_183165 ) ) ( not ( = ?auto_183164 ?auto_183166 ) ) ( not ( = ?auto_183165 ?auto_183166 ) ) ( ON ?auto_183166 ?auto_183168 ) ( not ( = ?auto_183160 ?auto_183168 ) ) ( not ( = ?auto_183161 ?auto_183168 ) ) ( not ( = ?auto_183162 ?auto_183168 ) ) ( not ( = ?auto_183163 ?auto_183168 ) ) ( not ( = ?auto_183164 ?auto_183168 ) ) ( not ( = ?auto_183165 ?auto_183168 ) ) ( not ( = ?auto_183166 ?auto_183168 ) ) ( ON ?auto_183165 ?auto_183166 ) ( ON-TABLE ?auto_183168 ) ( ON ?auto_183164 ?auto_183165 ) ( ON ?auto_183160 ?auto_183167 ) ( not ( = ?auto_183160 ?auto_183167 ) ) ( not ( = ?auto_183161 ?auto_183167 ) ) ( not ( = ?auto_183162 ?auto_183167 ) ) ( not ( = ?auto_183163 ?auto_183167 ) ) ( not ( = ?auto_183164 ?auto_183167 ) ) ( not ( = ?auto_183165 ?auto_183167 ) ) ( not ( = ?auto_183166 ?auto_183167 ) ) ( not ( = ?auto_183168 ?auto_183167 ) ) ( ON ?auto_183161 ?auto_183160 ) ( ON-TABLE ?auto_183167 ) ( ON ?auto_183162 ?auto_183161 ) ( CLEAR ?auto_183164 ) ( ON ?auto_183163 ?auto_183162 ) ( CLEAR ?auto_183163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183167 ?auto_183160 ?auto_183161 ?auto_183162 )
      ( MAKE-7PILE ?auto_183160 ?auto_183161 ?auto_183162 ?auto_183163 ?auto_183164 ?auto_183165 ?auto_183166 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183169 - BLOCK
      ?auto_183170 - BLOCK
      ?auto_183171 - BLOCK
      ?auto_183172 - BLOCK
      ?auto_183173 - BLOCK
      ?auto_183174 - BLOCK
      ?auto_183175 - BLOCK
    )
    :vars
    (
      ?auto_183176 - BLOCK
      ?auto_183177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183169 ?auto_183170 ) ) ( not ( = ?auto_183169 ?auto_183171 ) ) ( not ( = ?auto_183169 ?auto_183172 ) ) ( not ( = ?auto_183169 ?auto_183173 ) ) ( not ( = ?auto_183169 ?auto_183174 ) ) ( not ( = ?auto_183169 ?auto_183175 ) ) ( not ( = ?auto_183170 ?auto_183171 ) ) ( not ( = ?auto_183170 ?auto_183172 ) ) ( not ( = ?auto_183170 ?auto_183173 ) ) ( not ( = ?auto_183170 ?auto_183174 ) ) ( not ( = ?auto_183170 ?auto_183175 ) ) ( not ( = ?auto_183171 ?auto_183172 ) ) ( not ( = ?auto_183171 ?auto_183173 ) ) ( not ( = ?auto_183171 ?auto_183174 ) ) ( not ( = ?auto_183171 ?auto_183175 ) ) ( not ( = ?auto_183172 ?auto_183173 ) ) ( not ( = ?auto_183172 ?auto_183174 ) ) ( not ( = ?auto_183172 ?auto_183175 ) ) ( not ( = ?auto_183173 ?auto_183174 ) ) ( not ( = ?auto_183173 ?auto_183175 ) ) ( not ( = ?auto_183174 ?auto_183175 ) ) ( ON ?auto_183175 ?auto_183176 ) ( not ( = ?auto_183169 ?auto_183176 ) ) ( not ( = ?auto_183170 ?auto_183176 ) ) ( not ( = ?auto_183171 ?auto_183176 ) ) ( not ( = ?auto_183172 ?auto_183176 ) ) ( not ( = ?auto_183173 ?auto_183176 ) ) ( not ( = ?auto_183174 ?auto_183176 ) ) ( not ( = ?auto_183175 ?auto_183176 ) ) ( ON ?auto_183174 ?auto_183175 ) ( ON-TABLE ?auto_183176 ) ( ON ?auto_183169 ?auto_183177 ) ( not ( = ?auto_183169 ?auto_183177 ) ) ( not ( = ?auto_183170 ?auto_183177 ) ) ( not ( = ?auto_183171 ?auto_183177 ) ) ( not ( = ?auto_183172 ?auto_183177 ) ) ( not ( = ?auto_183173 ?auto_183177 ) ) ( not ( = ?auto_183174 ?auto_183177 ) ) ( not ( = ?auto_183175 ?auto_183177 ) ) ( not ( = ?auto_183176 ?auto_183177 ) ) ( ON ?auto_183170 ?auto_183169 ) ( ON-TABLE ?auto_183177 ) ( ON ?auto_183171 ?auto_183170 ) ( ON ?auto_183172 ?auto_183171 ) ( CLEAR ?auto_183172 ) ( HOLDING ?auto_183173 ) ( CLEAR ?auto_183174 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183176 ?auto_183175 ?auto_183174 ?auto_183173 )
      ( MAKE-7PILE ?auto_183169 ?auto_183170 ?auto_183171 ?auto_183172 ?auto_183173 ?auto_183174 ?auto_183175 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183178 - BLOCK
      ?auto_183179 - BLOCK
      ?auto_183180 - BLOCK
      ?auto_183181 - BLOCK
      ?auto_183182 - BLOCK
      ?auto_183183 - BLOCK
      ?auto_183184 - BLOCK
    )
    :vars
    (
      ?auto_183186 - BLOCK
      ?auto_183185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183178 ?auto_183179 ) ) ( not ( = ?auto_183178 ?auto_183180 ) ) ( not ( = ?auto_183178 ?auto_183181 ) ) ( not ( = ?auto_183178 ?auto_183182 ) ) ( not ( = ?auto_183178 ?auto_183183 ) ) ( not ( = ?auto_183178 ?auto_183184 ) ) ( not ( = ?auto_183179 ?auto_183180 ) ) ( not ( = ?auto_183179 ?auto_183181 ) ) ( not ( = ?auto_183179 ?auto_183182 ) ) ( not ( = ?auto_183179 ?auto_183183 ) ) ( not ( = ?auto_183179 ?auto_183184 ) ) ( not ( = ?auto_183180 ?auto_183181 ) ) ( not ( = ?auto_183180 ?auto_183182 ) ) ( not ( = ?auto_183180 ?auto_183183 ) ) ( not ( = ?auto_183180 ?auto_183184 ) ) ( not ( = ?auto_183181 ?auto_183182 ) ) ( not ( = ?auto_183181 ?auto_183183 ) ) ( not ( = ?auto_183181 ?auto_183184 ) ) ( not ( = ?auto_183182 ?auto_183183 ) ) ( not ( = ?auto_183182 ?auto_183184 ) ) ( not ( = ?auto_183183 ?auto_183184 ) ) ( ON ?auto_183184 ?auto_183186 ) ( not ( = ?auto_183178 ?auto_183186 ) ) ( not ( = ?auto_183179 ?auto_183186 ) ) ( not ( = ?auto_183180 ?auto_183186 ) ) ( not ( = ?auto_183181 ?auto_183186 ) ) ( not ( = ?auto_183182 ?auto_183186 ) ) ( not ( = ?auto_183183 ?auto_183186 ) ) ( not ( = ?auto_183184 ?auto_183186 ) ) ( ON ?auto_183183 ?auto_183184 ) ( ON-TABLE ?auto_183186 ) ( ON ?auto_183178 ?auto_183185 ) ( not ( = ?auto_183178 ?auto_183185 ) ) ( not ( = ?auto_183179 ?auto_183185 ) ) ( not ( = ?auto_183180 ?auto_183185 ) ) ( not ( = ?auto_183181 ?auto_183185 ) ) ( not ( = ?auto_183182 ?auto_183185 ) ) ( not ( = ?auto_183183 ?auto_183185 ) ) ( not ( = ?auto_183184 ?auto_183185 ) ) ( not ( = ?auto_183186 ?auto_183185 ) ) ( ON ?auto_183179 ?auto_183178 ) ( ON-TABLE ?auto_183185 ) ( ON ?auto_183180 ?auto_183179 ) ( ON ?auto_183181 ?auto_183180 ) ( CLEAR ?auto_183183 ) ( ON ?auto_183182 ?auto_183181 ) ( CLEAR ?auto_183182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183185 ?auto_183178 ?auto_183179 ?auto_183180 ?auto_183181 )
      ( MAKE-7PILE ?auto_183178 ?auto_183179 ?auto_183180 ?auto_183181 ?auto_183182 ?auto_183183 ?auto_183184 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183187 - BLOCK
      ?auto_183188 - BLOCK
      ?auto_183189 - BLOCK
      ?auto_183190 - BLOCK
      ?auto_183191 - BLOCK
      ?auto_183192 - BLOCK
      ?auto_183193 - BLOCK
    )
    :vars
    (
      ?auto_183195 - BLOCK
      ?auto_183194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183187 ?auto_183188 ) ) ( not ( = ?auto_183187 ?auto_183189 ) ) ( not ( = ?auto_183187 ?auto_183190 ) ) ( not ( = ?auto_183187 ?auto_183191 ) ) ( not ( = ?auto_183187 ?auto_183192 ) ) ( not ( = ?auto_183187 ?auto_183193 ) ) ( not ( = ?auto_183188 ?auto_183189 ) ) ( not ( = ?auto_183188 ?auto_183190 ) ) ( not ( = ?auto_183188 ?auto_183191 ) ) ( not ( = ?auto_183188 ?auto_183192 ) ) ( not ( = ?auto_183188 ?auto_183193 ) ) ( not ( = ?auto_183189 ?auto_183190 ) ) ( not ( = ?auto_183189 ?auto_183191 ) ) ( not ( = ?auto_183189 ?auto_183192 ) ) ( not ( = ?auto_183189 ?auto_183193 ) ) ( not ( = ?auto_183190 ?auto_183191 ) ) ( not ( = ?auto_183190 ?auto_183192 ) ) ( not ( = ?auto_183190 ?auto_183193 ) ) ( not ( = ?auto_183191 ?auto_183192 ) ) ( not ( = ?auto_183191 ?auto_183193 ) ) ( not ( = ?auto_183192 ?auto_183193 ) ) ( ON ?auto_183193 ?auto_183195 ) ( not ( = ?auto_183187 ?auto_183195 ) ) ( not ( = ?auto_183188 ?auto_183195 ) ) ( not ( = ?auto_183189 ?auto_183195 ) ) ( not ( = ?auto_183190 ?auto_183195 ) ) ( not ( = ?auto_183191 ?auto_183195 ) ) ( not ( = ?auto_183192 ?auto_183195 ) ) ( not ( = ?auto_183193 ?auto_183195 ) ) ( ON-TABLE ?auto_183195 ) ( ON ?auto_183187 ?auto_183194 ) ( not ( = ?auto_183187 ?auto_183194 ) ) ( not ( = ?auto_183188 ?auto_183194 ) ) ( not ( = ?auto_183189 ?auto_183194 ) ) ( not ( = ?auto_183190 ?auto_183194 ) ) ( not ( = ?auto_183191 ?auto_183194 ) ) ( not ( = ?auto_183192 ?auto_183194 ) ) ( not ( = ?auto_183193 ?auto_183194 ) ) ( not ( = ?auto_183195 ?auto_183194 ) ) ( ON ?auto_183188 ?auto_183187 ) ( ON-TABLE ?auto_183194 ) ( ON ?auto_183189 ?auto_183188 ) ( ON ?auto_183190 ?auto_183189 ) ( ON ?auto_183191 ?auto_183190 ) ( CLEAR ?auto_183191 ) ( HOLDING ?auto_183192 ) ( CLEAR ?auto_183193 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183195 ?auto_183193 ?auto_183192 )
      ( MAKE-7PILE ?auto_183187 ?auto_183188 ?auto_183189 ?auto_183190 ?auto_183191 ?auto_183192 ?auto_183193 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183196 - BLOCK
      ?auto_183197 - BLOCK
      ?auto_183198 - BLOCK
      ?auto_183199 - BLOCK
      ?auto_183200 - BLOCK
      ?auto_183201 - BLOCK
      ?auto_183202 - BLOCK
    )
    :vars
    (
      ?auto_183204 - BLOCK
      ?auto_183203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183196 ?auto_183197 ) ) ( not ( = ?auto_183196 ?auto_183198 ) ) ( not ( = ?auto_183196 ?auto_183199 ) ) ( not ( = ?auto_183196 ?auto_183200 ) ) ( not ( = ?auto_183196 ?auto_183201 ) ) ( not ( = ?auto_183196 ?auto_183202 ) ) ( not ( = ?auto_183197 ?auto_183198 ) ) ( not ( = ?auto_183197 ?auto_183199 ) ) ( not ( = ?auto_183197 ?auto_183200 ) ) ( not ( = ?auto_183197 ?auto_183201 ) ) ( not ( = ?auto_183197 ?auto_183202 ) ) ( not ( = ?auto_183198 ?auto_183199 ) ) ( not ( = ?auto_183198 ?auto_183200 ) ) ( not ( = ?auto_183198 ?auto_183201 ) ) ( not ( = ?auto_183198 ?auto_183202 ) ) ( not ( = ?auto_183199 ?auto_183200 ) ) ( not ( = ?auto_183199 ?auto_183201 ) ) ( not ( = ?auto_183199 ?auto_183202 ) ) ( not ( = ?auto_183200 ?auto_183201 ) ) ( not ( = ?auto_183200 ?auto_183202 ) ) ( not ( = ?auto_183201 ?auto_183202 ) ) ( ON ?auto_183202 ?auto_183204 ) ( not ( = ?auto_183196 ?auto_183204 ) ) ( not ( = ?auto_183197 ?auto_183204 ) ) ( not ( = ?auto_183198 ?auto_183204 ) ) ( not ( = ?auto_183199 ?auto_183204 ) ) ( not ( = ?auto_183200 ?auto_183204 ) ) ( not ( = ?auto_183201 ?auto_183204 ) ) ( not ( = ?auto_183202 ?auto_183204 ) ) ( ON-TABLE ?auto_183204 ) ( ON ?auto_183196 ?auto_183203 ) ( not ( = ?auto_183196 ?auto_183203 ) ) ( not ( = ?auto_183197 ?auto_183203 ) ) ( not ( = ?auto_183198 ?auto_183203 ) ) ( not ( = ?auto_183199 ?auto_183203 ) ) ( not ( = ?auto_183200 ?auto_183203 ) ) ( not ( = ?auto_183201 ?auto_183203 ) ) ( not ( = ?auto_183202 ?auto_183203 ) ) ( not ( = ?auto_183204 ?auto_183203 ) ) ( ON ?auto_183197 ?auto_183196 ) ( ON-TABLE ?auto_183203 ) ( ON ?auto_183198 ?auto_183197 ) ( ON ?auto_183199 ?auto_183198 ) ( ON ?auto_183200 ?auto_183199 ) ( CLEAR ?auto_183202 ) ( ON ?auto_183201 ?auto_183200 ) ( CLEAR ?auto_183201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183203 ?auto_183196 ?auto_183197 ?auto_183198 ?auto_183199 ?auto_183200 )
      ( MAKE-7PILE ?auto_183196 ?auto_183197 ?auto_183198 ?auto_183199 ?auto_183200 ?auto_183201 ?auto_183202 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183205 - BLOCK
      ?auto_183206 - BLOCK
      ?auto_183207 - BLOCK
      ?auto_183208 - BLOCK
      ?auto_183209 - BLOCK
      ?auto_183210 - BLOCK
      ?auto_183211 - BLOCK
    )
    :vars
    (
      ?auto_183212 - BLOCK
      ?auto_183213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183205 ?auto_183206 ) ) ( not ( = ?auto_183205 ?auto_183207 ) ) ( not ( = ?auto_183205 ?auto_183208 ) ) ( not ( = ?auto_183205 ?auto_183209 ) ) ( not ( = ?auto_183205 ?auto_183210 ) ) ( not ( = ?auto_183205 ?auto_183211 ) ) ( not ( = ?auto_183206 ?auto_183207 ) ) ( not ( = ?auto_183206 ?auto_183208 ) ) ( not ( = ?auto_183206 ?auto_183209 ) ) ( not ( = ?auto_183206 ?auto_183210 ) ) ( not ( = ?auto_183206 ?auto_183211 ) ) ( not ( = ?auto_183207 ?auto_183208 ) ) ( not ( = ?auto_183207 ?auto_183209 ) ) ( not ( = ?auto_183207 ?auto_183210 ) ) ( not ( = ?auto_183207 ?auto_183211 ) ) ( not ( = ?auto_183208 ?auto_183209 ) ) ( not ( = ?auto_183208 ?auto_183210 ) ) ( not ( = ?auto_183208 ?auto_183211 ) ) ( not ( = ?auto_183209 ?auto_183210 ) ) ( not ( = ?auto_183209 ?auto_183211 ) ) ( not ( = ?auto_183210 ?auto_183211 ) ) ( not ( = ?auto_183205 ?auto_183212 ) ) ( not ( = ?auto_183206 ?auto_183212 ) ) ( not ( = ?auto_183207 ?auto_183212 ) ) ( not ( = ?auto_183208 ?auto_183212 ) ) ( not ( = ?auto_183209 ?auto_183212 ) ) ( not ( = ?auto_183210 ?auto_183212 ) ) ( not ( = ?auto_183211 ?auto_183212 ) ) ( ON-TABLE ?auto_183212 ) ( ON ?auto_183205 ?auto_183213 ) ( not ( = ?auto_183205 ?auto_183213 ) ) ( not ( = ?auto_183206 ?auto_183213 ) ) ( not ( = ?auto_183207 ?auto_183213 ) ) ( not ( = ?auto_183208 ?auto_183213 ) ) ( not ( = ?auto_183209 ?auto_183213 ) ) ( not ( = ?auto_183210 ?auto_183213 ) ) ( not ( = ?auto_183211 ?auto_183213 ) ) ( not ( = ?auto_183212 ?auto_183213 ) ) ( ON ?auto_183206 ?auto_183205 ) ( ON-TABLE ?auto_183213 ) ( ON ?auto_183207 ?auto_183206 ) ( ON ?auto_183208 ?auto_183207 ) ( ON ?auto_183209 ?auto_183208 ) ( ON ?auto_183210 ?auto_183209 ) ( CLEAR ?auto_183210 ) ( HOLDING ?auto_183211 ) ( CLEAR ?auto_183212 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183212 ?auto_183211 )
      ( MAKE-7PILE ?auto_183205 ?auto_183206 ?auto_183207 ?auto_183208 ?auto_183209 ?auto_183210 ?auto_183211 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183214 - BLOCK
      ?auto_183215 - BLOCK
      ?auto_183216 - BLOCK
      ?auto_183217 - BLOCK
      ?auto_183218 - BLOCK
      ?auto_183219 - BLOCK
      ?auto_183220 - BLOCK
    )
    :vars
    (
      ?auto_183221 - BLOCK
      ?auto_183222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183214 ?auto_183215 ) ) ( not ( = ?auto_183214 ?auto_183216 ) ) ( not ( = ?auto_183214 ?auto_183217 ) ) ( not ( = ?auto_183214 ?auto_183218 ) ) ( not ( = ?auto_183214 ?auto_183219 ) ) ( not ( = ?auto_183214 ?auto_183220 ) ) ( not ( = ?auto_183215 ?auto_183216 ) ) ( not ( = ?auto_183215 ?auto_183217 ) ) ( not ( = ?auto_183215 ?auto_183218 ) ) ( not ( = ?auto_183215 ?auto_183219 ) ) ( not ( = ?auto_183215 ?auto_183220 ) ) ( not ( = ?auto_183216 ?auto_183217 ) ) ( not ( = ?auto_183216 ?auto_183218 ) ) ( not ( = ?auto_183216 ?auto_183219 ) ) ( not ( = ?auto_183216 ?auto_183220 ) ) ( not ( = ?auto_183217 ?auto_183218 ) ) ( not ( = ?auto_183217 ?auto_183219 ) ) ( not ( = ?auto_183217 ?auto_183220 ) ) ( not ( = ?auto_183218 ?auto_183219 ) ) ( not ( = ?auto_183218 ?auto_183220 ) ) ( not ( = ?auto_183219 ?auto_183220 ) ) ( not ( = ?auto_183214 ?auto_183221 ) ) ( not ( = ?auto_183215 ?auto_183221 ) ) ( not ( = ?auto_183216 ?auto_183221 ) ) ( not ( = ?auto_183217 ?auto_183221 ) ) ( not ( = ?auto_183218 ?auto_183221 ) ) ( not ( = ?auto_183219 ?auto_183221 ) ) ( not ( = ?auto_183220 ?auto_183221 ) ) ( ON-TABLE ?auto_183221 ) ( ON ?auto_183214 ?auto_183222 ) ( not ( = ?auto_183214 ?auto_183222 ) ) ( not ( = ?auto_183215 ?auto_183222 ) ) ( not ( = ?auto_183216 ?auto_183222 ) ) ( not ( = ?auto_183217 ?auto_183222 ) ) ( not ( = ?auto_183218 ?auto_183222 ) ) ( not ( = ?auto_183219 ?auto_183222 ) ) ( not ( = ?auto_183220 ?auto_183222 ) ) ( not ( = ?auto_183221 ?auto_183222 ) ) ( ON ?auto_183215 ?auto_183214 ) ( ON-TABLE ?auto_183222 ) ( ON ?auto_183216 ?auto_183215 ) ( ON ?auto_183217 ?auto_183216 ) ( ON ?auto_183218 ?auto_183217 ) ( ON ?auto_183219 ?auto_183218 ) ( CLEAR ?auto_183221 ) ( ON ?auto_183220 ?auto_183219 ) ( CLEAR ?auto_183220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183222 ?auto_183214 ?auto_183215 ?auto_183216 ?auto_183217 ?auto_183218 ?auto_183219 )
      ( MAKE-7PILE ?auto_183214 ?auto_183215 ?auto_183216 ?auto_183217 ?auto_183218 ?auto_183219 ?auto_183220 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183223 - BLOCK
      ?auto_183224 - BLOCK
      ?auto_183225 - BLOCK
      ?auto_183226 - BLOCK
      ?auto_183227 - BLOCK
      ?auto_183228 - BLOCK
      ?auto_183229 - BLOCK
    )
    :vars
    (
      ?auto_183230 - BLOCK
      ?auto_183231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183223 ?auto_183224 ) ) ( not ( = ?auto_183223 ?auto_183225 ) ) ( not ( = ?auto_183223 ?auto_183226 ) ) ( not ( = ?auto_183223 ?auto_183227 ) ) ( not ( = ?auto_183223 ?auto_183228 ) ) ( not ( = ?auto_183223 ?auto_183229 ) ) ( not ( = ?auto_183224 ?auto_183225 ) ) ( not ( = ?auto_183224 ?auto_183226 ) ) ( not ( = ?auto_183224 ?auto_183227 ) ) ( not ( = ?auto_183224 ?auto_183228 ) ) ( not ( = ?auto_183224 ?auto_183229 ) ) ( not ( = ?auto_183225 ?auto_183226 ) ) ( not ( = ?auto_183225 ?auto_183227 ) ) ( not ( = ?auto_183225 ?auto_183228 ) ) ( not ( = ?auto_183225 ?auto_183229 ) ) ( not ( = ?auto_183226 ?auto_183227 ) ) ( not ( = ?auto_183226 ?auto_183228 ) ) ( not ( = ?auto_183226 ?auto_183229 ) ) ( not ( = ?auto_183227 ?auto_183228 ) ) ( not ( = ?auto_183227 ?auto_183229 ) ) ( not ( = ?auto_183228 ?auto_183229 ) ) ( not ( = ?auto_183223 ?auto_183230 ) ) ( not ( = ?auto_183224 ?auto_183230 ) ) ( not ( = ?auto_183225 ?auto_183230 ) ) ( not ( = ?auto_183226 ?auto_183230 ) ) ( not ( = ?auto_183227 ?auto_183230 ) ) ( not ( = ?auto_183228 ?auto_183230 ) ) ( not ( = ?auto_183229 ?auto_183230 ) ) ( ON ?auto_183223 ?auto_183231 ) ( not ( = ?auto_183223 ?auto_183231 ) ) ( not ( = ?auto_183224 ?auto_183231 ) ) ( not ( = ?auto_183225 ?auto_183231 ) ) ( not ( = ?auto_183226 ?auto_183231 ) ) ( not ( = ?auto_183227 ?auto_183231 ) ) ( not ( = ?auto_183228 ?auto_183231 ) ) ( not ( = ?auto_183229 ?auto_183231 ) ) ( not ( = ?auto_183230 ?auto_183231 ) ) ( ON ?auto_183224 ?auto_183223 ) ( ON-TABLE ?auto_183231 ) ( ON ?auto_183225 ?auto_183224 ) ( ON ?auto_183226 ?auto_183225 ) ( ON ?auto_183227 ?auto_183226 ) ( ON ?auto_183228 ?auto_183227 ) ( ON ?auto_183229 ?auto_183228 ) ( CLEAR ?auto_183229 ) ( HOLDING ?auto_183230 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183230 )
      ( MAKE-7PILE ?auto_183223 ?auto_183224 ?auto_183225 ?auto_183226 ?auto_183227 ?auto_183228 ?auto_183229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183232 - BLOCK
      ?auto_183233 - BLOCK
      ?auto_183234 - BLOCK
      ?auto_183235 - BLOCK
      ?auto_183236 - BLOCK
      ?auto_183237 - BLOCK
      ?auto_183238 - BLOCK
    )
    :vars
    (
      ?auto_183239 - BLOCK
      ?auto_183240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183232 ?auto_183233 ) ) ( not ( = ?auto_183232 ?auto_183234 ) ) ( not ( = ?auto_183232 ?auto_183235 ) ) ( not ( = ?auto_183232 ?auto_183236 ) ) ( not ( = ?auto_183232 ?auto_183237 ) ) ( not ( = ?auto_183232 ?auto_183238 ) ) ( not ( = ?auto_183233 ?auto_183234 ) ) ( not ( = ?auto_183233 ?auto_183235 ) ) ( not ( = ?auto_183233 ?auto_183236 ) ) ( not ( = ?auto_183233 ?auto_183237 ) ) ( not ( = ?auto_183233 ?auto_183238 ) ) ( not ( = ?auto_183234 ?auto_183235 ) ) ( not ( = ?auto_183234 ?auto_183236 ) ) ( not ( = ?auto_183234 ?auto_183237 ) ) ( not ( = ?auto_183234 ?auto_183238 ) ) ( not ( = ?auto_183235 ?auto_183236 ) ) ( not ( = ?auto_183235 ?auto_183237 ) ) ( not ( = ?auto_183235 ?auto_183238 ) ) ( not ( = ?auto_183236 ?auto_183237 ) ) ( not ( = ?auto_183236 ?auto_183238 ) ) ( not ( = ?auto_183237 ?auto_183238 ) ) ( not ( = ?auto_183232 ?auto_183239 ) ) ( not ( = ?auto_183233 ?auto_183239 ) ) ( not ( = ?auto_183234 ?auto_183239 ) ) ( not ( = ?auto_183235 ?auto_183239 ) ) ( not ( = ?auto_183236 ?auto_183239 ) ) ( not ( = ?auto_183237 ?auto_183239 ) ) ( not ( = ?auto_183238 ?auto_183239 ) ) ( ON ?auto_183232 ?auto_183240 ) ( not ( = ?auto_183232 ?auto_183240 ) ) ( not ( = ?auto_183233 ?auto_183240 ) ) ( not ( = ?auto_183234 ?auto_183240 ) ) ( not ( = ?auto_183235 ?auto_183240 ) ) ( not ( = ?auto_183236 ?auto_183240 ) ) ( not ( = ?auto_183237 ?auto_183240 ) ) ( not ( = ?auto_183238 ?auto_183240 ) ) ( not ( = ?auto_183239 ?auto_183240 ) ) ( ON ?auto_183233 ?auto_183232 ) ( ON-TABLE ?auto_183240 ) ( ON ?auto_183234 ?auto_183233 ) ( ON ?auto_183235 ?auto_183234 ) ( ON ?auto_183236 ?auto_183235 ) ( ON ?auto_183237 ?auto_183236 ) ( ON ?auto_183238 ?auto_183237 ) ( ON ?auto_183239 ?auto_183238 ) ( CLEAR ?auto_183239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183240 ?auto_183232 ?auto_183233 ?auto_183234 ?auto_183235 ?auto_183236 ?auto_183237 ?auto_183238 )
      ( MAKE-7PILE ?auto_183232 ?auto_183233 ?auto_183234 ?auto_183235 ?auto_183236 ?auto_183237 ?auto_183238 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183249 - BLOCK
      ?auto_183250 - BLOCK
      ?auto_183251 - BLOCK
      ?auto_183252 - BLOCK
      ?auto_183253 - BLOCK
      ?auto_183254 - BLOCK
      ?auto_183255 - BLOCK
      ?auto_183256 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_183256 ) ( CLEAR ?auto_183255 ) ( ON-TABLE ?auto_183249 ) ( ON ?auto_183250 ?auto_183249 ) ( ON ?auto_183251 ?auto_183250 ) ( ON ?auto_183252 ?auto_183251 ) ( ON ?auto_183253 ?auto_183252 ) ( ON ?auto_183254 ?auto_183253 ) ( ON ?auto_183255 ?auto_183254 ) ( not ( = ?auto_183249 ?auto_183250 ) ) ( not ( = ?auto_183249 ?auto_183251 ) ) ( not ( = ?auto_183249 ?auto_183252 ) ) ( not ( = ?auto_183249 ?auto_183253 ) ) ( not ( = ?auto_183249 ?auto_183254 ) ) ( not ( = ?auto_183249 ?auto_183255 ) ) ( not ( = ?auto_183249 ?auto_183256 ) ) ( not ( = ?auto_183250 ?auto_183251 ) ) ( not ( = ?auto_183250 ?auto_183252 ) ) ( not ( = ?auto_183250 ?auto_183253 ) ) ( not ( = ?auto_183250 ?auto_183254 ) ) ( not ( = ?auto_183250 ?auto_183255 ) ) ( not ( = ?auto_183250 ?auto_183256 ) ) ( not ( = ?auto_183251 ?auto_183252 ) ) ( not ( = ?auto_183251 ?auto_183253 ) ) ( not ( = ?auto_183251 ?auto_183254 ) ) ( not ( = ?auto_183251 ?auto_183255 ) ) ( not ( = ?auto_183251 ?auto_183256 ) ) ( not ( = ?auto_183252 ?auto_183253 ) ) ( not ( = ?auto_183252 ?auto_183254 ) ) ( not ( = ?auto_183252 ?auto_183255 ) ) ( not ( = ?auto_183252 ?auto_183256 ) ) ( not ( = ?auto_183253 ?auto_183254 ) ) ( not ( = ?auto_183253 ?auto_183255 ) ) ( not ( = ?auto_183253 ?auto_183256 ) ) ( not ( = ?auto_183254 ?auto_183255 ) ) ( not ( = ?auto_183254 ?auto_183256 ) ) ( not ( = ?auto_183255 ?auto_183256 ) ) )
    :subtasks
    ( ( !STACK ?auto_183256 ?auto_183255 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183257 - BLOCK
      ?auto_183258 - BLOCK
      ?auto_183259 - BLOCK
      ?auto_183260 - BLOCK
      ?auto_183261 - BLOCK
      ?auto_183262 - BLOCK
      ?auto_183263 - BLOCK
      ?auto_183264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183263 ) ( ON-TABLE ?auto_183257 ) ( ON ?auto_183258 ?auto_183257 ) ( ON ?auto_183259 ?auto_183258 ) ( ON ?auto_183260 ?auto_183259 ) ( ON ?auto_183261 ?auto_183260 ) ( ON ?auto_183262 ?auto_183261 ) ( ON ?auto_183263 ?auto_183262 ) ( not ( = ?auto_183257 ?auto_183258 ) ) ( not ( = ?auto_183257 ?auto_183259 ) ) ( not ( = ?auto_183257 ?auto_183260 ) ) ( not ( = ?auto_183257 ?auto_183261 ) ) ( not ( = ?auto_183257 ?auto_183262 ) ) ( not ( = ?auto_183257 ?auto_183263 ) ) ( not ( = ?auto_183257 ?auto_183264 ) ) ( not ( = ?auto_183258 ?auto_183259 ) ) ( not ( = ?auto_183258 ?auto_183260 ) ) ( not ( = ?auto_183258 ?auto_183261 ) ) ( not ( = ?auto_183258 ?auto_183262 ) ) ( not ( = ?auto_183258 ?auto_183263 ) ) ( not ( = ?auto_183258 ?auto_183264 ) ) ( not ( = ?auto_183259 ?auto_183260 ) ) ( not ( = ?auto_183259 ?auto_183261 ) ) ( not ( = ?auto_183259 ?auto_183262 ) ) ( not ( = ?auto_183259 ?auto_183263 ) ) ( not ( = ?auto_183259 ?auto_183264 ) ) ( not ( = ?auto_183260 ?auto_183261 ) ) ( not ( = ?auto_183260 ?auto_183262 ) ) ( not ( = ?auto_183260 ?auto_183263 ) ) ( not ( = ?auto_183260 ?auto_183264 ) ) ( not ( = ?auto_183261 ?auto_183262 ) ) ( not ( = ?auto_183261 ?auto_183263 ) ) ( not ( = ?auto_183261 ?auto_183264 ) ) ( not ( = ?auto_183262 ?auto_183263 ) ) ( not ( = ?auto_183262 ?auto_183264 ) ) ( not ( = ?auto_183263 ?auto_183264 ) ) ( ON-TABLE ?auto_183264 ) ( CLEAR ?auto_183264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_183264 )
      ( MAKE-8PILE ?auto_183257 ?auto_183258 ?auto_183259 ?auto_183260 ?auto_183261 ?auto_183262 ?auto_183263 ?auto_183264 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183265 - BLOCK
      ?auto_183266 - BLOCK
      ?auto_183267 - BLOCK
      ?auto_183268 - BLOCK
      ?auto_183269 - BLOCK
      ?auto_183270 - BLOCK
      ?auto_183271 - BLOCK
      ?auto_183272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183265 ) ( ON ?auto_183266 ?auto_183265 ) ( ON ?auto_183267 ?auto_183266 ) ( ON ?auto_183268 ?auto_183267 ) ( ON ?auto_183269 ?auto_183268 ) ( ON ?auto_183270 ?auto_183269 ) ( not ( = ?auto_183265 ?auto_183266 ) ) ( not ( = ?auto_183265 ?auto_183267 ) ) ( not ( = ?auto_183265 ?auto_183268 ) ) ( not ( = ?auto_183265 ?auto_183269 ) ) ( not ( = ?auto_183265 ?auto_183270 ) ) ( not ( = ?auto_183265 ?auto_183271 ) ) ( not ( = ?auto_183265 ?auto_183272 ) ) ( not ( = ?auto_183266 ?auto_183267 ) ) ( not ( = ?auto_183266 ?auto_183268 ) ) ( not ( = ?auto_183266 ?auto_183269 ) ) ( not ( = ?auto_183266 ?auto_183270 ) ) ( not ( = ?auto_183266 ?auto_183271 ) ) ( not ( = ?auto_183266 ?auto_183272 ) ) ( not ( = ?auto_183267 ?auto_183268 ) ) ( not ( = ?auto_183267 ?auto_183269 ) ) ( not ( = ?auto_183267 ?auto_183270 ) ) ( not ( = ?auto_183267 ?auto_183271 ) ) ( not ( = ?auto_183267 ?auto_183272 ) ) ( not ( = ?auto_183268 ?auto_183269 ) ) ( not ( = ?auto_183268 ?auto_183270 ) ) ( not ( = ?auto_183268 ?auto_183271 ) ) ( not ( = ?auto_183268 ?auto_183272 ) ) ( not ( = ?auto_183269 ?auto_183270 ) ) ( not ( = ?auto_183269 ?auto_183271 ) ) ( not ( = ?auto_183269 ?auto_183272 ) ) ( not ( = ?auto_183270 ?auto_183271 ) ) ( not ( = ?auto_183270 ?auto_183272 ) ) ( not ( = ?auto_183271 ?auto_183272 ) ) ( ON-TABLE ?auto_183272 ) ( CLEAR ?auto_183272 ) ( HOLDING ?auto_183271 ) ( CLEAR ?auto_183270 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183265 ?auto_183266 ?auto_183267 ?auto_183268 ?auto_183269 ?auto_183270 ?auto_183271 )
      ( MAKE-8PILE ?auto_183265 ?auto_183266 ?auto_183267 ?auto_183268 ?auto_183269 ?auto_183270 ?auto_183271 ?auto_183272 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183273 - BLOCK
      ?auto_183274 - BLOCK
      ?auto_183275 - BLOCK
      ?auto_183276 - BLOCK
      ?auto_183277 - BLOCK
      ?auto_183278 - BLOCK
      ?auto_183279 - BLOCK
      ?auto_183280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183273 ) ( ON ?auto_183274 ?auto_183273 ) ( ON ?auto_183275 ?auto_183274 ) ( ON ?auto_183276 ?auto_183275 ) ( ON ?auto_183277 ?auto_183276 ) ( ON ?auto_183278 ?auto_183277 ) ( not ( = ?auto_183273 ?auto_183274 ) ) ( not ( = ?auto_183273 ?auto_183275 ) ) ( not ( = ?auto_183273 ?auto_183276 ) ) ( not ( = ?auto_183273 ?auto_183277 ) ) ( not ( = ?auto_183273 ?auto_183278 ) ) ( not ( = ?auto_183273 ?auto_183279 ) ) ( not ( = ?auto_183273 ?auto_183280 ) ) ( not ( = ?auto_183274 ?auto_183275 ) ) ( not ( = ?auto_183274 ?auto_183276 ) ) ( not ( = ?auto_183274 ?auto_183277 ) ) ( not ( = ?auto_183274 ?auto_183278 ) ) ( not ( = ?auto_183274 ?auto_183279 ) ) ( not ( = ?auto_183274 ?auto_183280 ) ) ( not ( = ?auto_183275 ?auto_183276 ) ) ( not ( = ?auto_183275 ?auto_183277 ) ) ( not ( = ?auto_183275 ?auto_183278 ) ) ( not ( = ?auto_183275 ?auto_183279 ) ) ( not ( = ?auto_183275 ?auto_183280 ) ) ( not ( = ?auto_183276 ?auto_183277 ) ) ( not ( = ?auto_183276 ?auto_183278 ) ) ( not ( = ?auto_183276 ?auto_183279 ) ) ( not ( = ?auto_183276 ?auto_183280 ) ) ( not ( = ?auto_183277 ?auto_183278 ) ) ( not ( = ?auto_183277 ?auto_183279 ) ) ( not ( = ?auto_183277 ?auto_183280 ) ) ( not ( = ?auto_183278 ?auto_183279 ) ) ( not ( = ?auto_183278 ?auto_183280 ) ) ( not ( = ?auto_183279 ?auto_183280 ) ) ( ON-TABLE ?auto_183280 ) ( CLEAR ?auto_183278 ) ( ON ?auto_183279 ?auto_183280 ) ( CLEAR ?auto_183279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183280 )
      ( MAKE-8PILE ?auto_183273 ?auto_183274 ?auto_183275 ?auto_183276 ?auto_183277 ?auto_183278 ?auto_183279 ?auto_183280 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183281 - BLOCK
      ?auto_183282 - BLOCK
      ?auto_183283 - BLOCK
      ?auto_183284 - BLOCK
      ?auto_183285 - BLOCK
      ?auto_183286 - BLOCK
      ?auto_183287 - BLOCK
      ?auto_183288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183281 ) ( ON ?auto_183282 ?auto_183281 ) ( ON ?auto_183283 ?auto_183282 ) ( ON ?auto_183284 ?auto_183283 ) ( ON ?auto_183285 ?auto_183284 ) ( not ( = ?auto_183281 ?auto_183282 ) ) ( not ( = ?auto_183281 ?auto_183283 ) ) ( not ( = ?auto_183281 ?auto_183284 ) ) ( not ( = ?auto_183281 ?auto_183285 ) ) ( not ( = ?auto_183281 ?auto_183286 ) ) ( not ( = ?auto_183281 ?auto_183287 ) ) ( not ( = ?auto_183281 ?auto_183288 ) ) ( not ( = ?auto_183282 ?auto_183283 ) ) ( not ( = ?auto_183282 ?auto_183284 ) ) ( not ( = ?auto_183282 ?auto_183285 ) ) ( not ( = ?auto_183282 ?auto_183286 ) ) ( not ( = ?auto_183282 ?auto_183287 ) ) ( not ( = ?auto_183282 ?auto_183288 ) ) ( not ( = ?auto_183283 ?auto_183284 ) ) ( not ( = ?auto_183283 ?auto_183285 ) ) ( not ( = ?auto_183283 ?auto_183286 ) ) ( not ( = ?auto_183283 ?auto_183287 ) ) ( not ( = ?auto_183283 ?auto_183288 ) ) ( not ( = ?auto_183284 ?auto_183285 ) ) ( not ( = ?auto_183284 ?auto_183286 ) ) ( not ( = ?auto_183284 ?auto_183287 ) ) ( not ( = ?auto_183284 ?auto_183288 ) ) ( not ( = ?auto_183285 ?auto_183286 ) ) ( not ( = ?auto_183285 ?auto_183287 ) ) ( not ( = ?auto_183285 ?auto_183288 ) ) ( not ( = ?auto_183286 ?auto_183287 ) ) ( not ( = ?auto_183286 ?auto_183288 ) ) ( not ( = ?auto_183287 ?auto_183288 ) ) ( ON-TABLE ?auto_183288 ) ( ON ?auto_183287 ?auto_183288 ) ( CLEAR ?auto_183287 ) ( HOLDING ?auto_183286 ) ( CLEAR ?auto_183285 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183281 ?auto_183282 ?auto_183283 ?auto_183284 ?auto_183285 ?auto_183286 )
      ( MAKE-8PILE ?auto_183281 ?auto_183282 ?auto_183283 ?auto_183284 ?auto_183285 ?auto_183286 ?auto_183287 ?auto_183288 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183289 - BLOCK
      ?auto_183290 - BLOCK
      ?auto_183291 - BLOCK
      ?auto_183292 - BLOCK
      ?auto_183293 - BLOCK
      ?auto_183294 - BLOCK
      ?auto_183295 - BLOCK
      ?auto_183296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183289 ) ( ON ?auto_183290 ?auto_183289 ) ( ON ?auto_183291 ?auto_183290 ) ( ON ?auto_183292 ?auto_183291 ) ( ON ?auto_183293 ?auto_183292 ) ( not ( = ?auto_183289 ?auto_183290 ) ) ( not ( = ?auto_183289 ?auto_183291 ) ) ( not ( = ?auto_183289 ?auto_183292 ) ) ( not ( = ?auto_183289 ?auto_183293 ) ) ( not ( = ?auto_183289 ?auto_183294 ) ) ( not ( = ?auto_183289 ?auto_183295 ) ) ( not ( = ?auto_183289 ?auto_183296 ) ) ( not ( = ?auto_183290 ?auto_183291 ) ) ( not ( = ?auto_183290 ?auto_183292 ) ) ( not ( = ?auto_183290 ?auto_183293 ) ) ( not ( = ?auto_183290 ?auto_183294 ) ) ( not ( = ?auto_183290 ?auto_183295 ) ) ( not ( = ?auto_183290 ?auto_183296 ) ) ( not ( = ?auto_183291 ?auto_183292 ) ) ( not ( = ?auto_183291 ?auto_183293 ) ) ( not ( = ?auto_183291 ?auto_183294 ) ) ( not ( = ?auto_183291 ?auto_183295 ) ) ( not ( = ?auto_183291 ?auto_183296 ) ) ( not ( = ?auto_183292 ?auto_183293 ) ) ( not ( = ?auto_183292 ?auto_183294 ) ) ( not ( = ?auto_183292 ?auto_183295 ) ) ( not ( = ?auto_183292 ?auto_183296 ) ) ( not ( = ?auto_183293 ?auto_183294 ) ) ( not ( = ?auto_183293 ?auto_183295 ) ) ( not ( = ?auto_183293 ?auto_183296 ) ) ( not ( = ?auto_183294 ?auto_183295 ) ) ( not ( = ?auto_183294 ?auto_183296 ) ) ( not ( = ?auto_183295 ?auto_183296 ) ) ( ON-TABLE ?auto_183296 ) ( ON ?auto_183295 ?auto_183296 ) ( CLEAR ?auto_183293 ) ( ON ?auto_183294 ?auto_183295 ) ( CLEAR ?auto_183294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183296 ?auto_183295 )
      ( MAKE-8PILE ?auto_183289 ?auto_183290 ?auto_183291 ?auto_183292 ?auto_183293 ?auto_183294 ?auto_183295 ?auto_183296 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183297 - BLOCK
      ?auto_183298 - BLOCK
      ?auto_183299 - BLOCK
      ?auto_183300 - BLOCK
      ?auto_183301 - BLOCK
      ?auto_183302 - BLOCK
      ?auto_183303 - BLOCK
      ?auto_183304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183297 ) ( ON ?auto_183298 ?auto_183297 ) ( ON ?auto_183299 ?auto_183298 ) ( ON ?auto_183300 ?auto_183299 ) ( not ( = ?auto_183297 ?auto_183298 ) ) ( not ( = ?auto_183297 ?auto_183299 ) ) ( not ( = ?auto_183297 ?auto_183300 ) ) ( not ( = ?auto_183297 ?auto_183301 ) ) ( not ( = ?auto_183297 ?auto_183302 ) ) ( not ( = ?auto_183297 ?auto_183303 ) ) ( not ( = ?auto_183297 ?auto_183304 ) ) ( not ( = ?auto_183298 ?auto_183299 ) ) ( not ( = ?auto_183298 ?auto_183300 ) ) ( not ( = ?auto_183298 ?auto_183301 ) ) ( not ( = ?auto_183298 ?auto_183302 ) ) ( not ( = ?auto_183298 ?auto_183303 ) ) ( not ( = ?auto_183298 ?auto_183304 ) ) ( not ( = ?auto_183299 ?auto_183300 ) ) ( not ( = ?auto_183299 ?auto_183301 ) ) ( not ( = ?auto_183299 ?auto_183302 ) ) ( not ( = ?auto_183299 ?auto_183303 ) ) ( not ( = ?auto_183299 ?auto_183304 ) ) ( not ( = ?auto_183300 ?auto_183301 ) ) ( not ( = ?auto_183300 ?auto_183302 ) ) ( not ( = ?auto_183300 ?auto_183303 ) ) ( not ( = ?auto_183300 ?auto_183304 ) ) ( not ( = ?auto_183301 ?auto_183302 ) ) ( not ( = ?auto_183301 ?auto_183303 ) ) ( not ( = ?auto_183301 ?auto_183304 ) ) ( not ( = ?auto_183302 ?auto_183303 ) ) ( not ( = ?auto_183302 ?auto_183304 ) ) ( not ( = ?auto_183303 ?auto_183304 ) ) ( ON-TABLE ?auto_183304 ) ( ON ?auto_183303 ?auto_183304 ) ( ON ?auto_183302 ?auto_183303 ) ( CLEAR ?auto_183302 ) ( HOLDING ?auto_183301 ) ( CLEAR ?auto_183300 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183297 ?auto_183298 ?auto_183299 ?auto_183300 ?auto_183301 )
      ( MAKE-8PILE ?auto_183297 ?auto_183298 ?auto_183299 ?auto_183300 ?auto_183301 ?auto_183302 ?auto_183303 ?auto_183304 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183305 - BLOCK
      ?auto_183306 - BLOCK
      ?auto_183307 - BLOCK
      ?auto_183308 - BLOCK
      ?auto_183309 - BLOCK
      ?auto_183310 - BLOCK
      ?auto_183311 - BLOCK
      ?auto_183312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183305 ) ( ON ?auto_183306 ?auto_183305 ) ( ON ?auto_183307 ?auto_183306 ) ( ON ?auto_183308 ?auto_183307 ) ( not ( = ?auto_183305 ?auto_183306 ) ) ( not ( = ?auto_183305 ?auto_183307 ) ) ( not ( = ?auto_183305 ?auto_183308 ) ) ( not ( = ?auto_183305 ?auto_183309 ) ) ( not ( = ?auto_183305 ?auto_183310 ) ) ( not ( = ?auto_183305 ?auto_183311 ) ) ( not ( = ?auto_183305 ?auto_183312 ) ) ( not ( = ?auto_183306 ?auto_183307 ) ) ( not ( = ?auto_183306 ?auto_183308 ) ) ( not ( = ?auto_183306 ?auto_183309 ) ) ( not ( = ?auto_183306 ?auto_183310 ) ) ( not ( = ?auto_183306 ?auto_183311 ) ) ( not ( = ?auto_183306 ?auto_183312 ) ) ( not ( = ?auto_183307 ?auto_183308 ) ) ( not ( = ?auto_183307 ?auto_183309 ) ) ( not ( = ?auto_183307 ?auto_183310 ) ) ( not ( = ?auto_183307 ?auto_183311 ) ) ( not ( = ?auto_183307 ?auto_183312 ) ) ( not ( = ?auto_183308 ?auto_183309 ) ) ( not ( = ?auto_183308 ?auto_183310 ) ) ( not ( = ?auto_183308 ?auto_183311 ) ) ( not ( = ?auto_183308 ?auto_183312 ) ) ( not ( = ?auto_183309 ?auto_183310 ) ) ( not ( = ?auto_183309 ?auto_183311 ) ) ( not ( = ?auto_183309 ?auto_183312 ) ) ( not ( = ?auto_183310 ?auto_183311 ) ) ( not ( = ?auto_183310 ?auto_183312 ) ) ( not ( = ?auto_183311 ?auto_183312 ) ) ( ON-TABLE ?auto_183312 ) ( ON ?auto_183311 ?auto_183312 ) ( ON ?auto_183310 ?auto_183311 ) ( CLEAR ?auto_183308 ) ( ON ?auto_183309 ?auto_183310 ) ( CLEAR ?auto_183309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183312 ?auto_183311 ?auto_183310 )
      ( MAKE-8PILE ?auto_183305 ?auto_183306 ?auto_183307 ?auto_183308 ?auto_183309 ?auto_183310 ?auto_183311 ?auto_183312 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183313 - BLOCK
      ?auto_183314 - BLOCK
      ?auto_183315 - BLOCK
      ?auto_183316 - BLOCK
      ?auto_183317 - BLOCK
      ?auto_183318 - BLOCK
      ?auto_183319 - BLOCK
      ?auto_183320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183313 ) ( ON ?auto_183314 ?auto_183313 ) ( ON ?auto_183315 ?auto_183314 ) ( not ( = ?auto_183313 ?auto_183314 ) ) ( not ( = ?auto_183313 ?auto_183315 ) ) ( not ( = ?auto_183313 ?auto_183316 ) ) ( not ( = ?auto_183313 ?auto_183317 ) ) ( not ( = ?auto_183313 ?auto_183318 ) ) ( not ( = ?auto_183313 ?auto_183319 ) ) ( not ( = ?auto_183313 ?auto_183320 ) ) ( not ( = ?auto_183314 ?auto_183315 ) ) ( not ( = ?auto_183314 ?auto_183316 ) ) ( not ( = ?auto_183314 ?auto_183317 ) ) ( not ( = ?auto_183314 ?auto_183318 ) ) ( not ( = ?auto_183314 ?auto_183319 ) ) ( not ( = ?auto_183314 ?auto_183320 ) ) ( not ( = ?auto_183315 ?auto_183316 ) ) ( not ( = ?auto_183315 ?auto_183317 ) ) ( not ( = ?auto_183315 ?auto_183318 ) ) ( not ( = ?auto_183315 ?auto_183319 ) ) ( not ( = ?auto_183315 ?auto_183320 ) ) ( not ( = ?auto_183316 ?auto_183317 ) ) ( not ( = ?auto_183316 ?auto_183318 ) ) ( not ( = ?auto_183316 ?auto_183319 ) ) ( not ( = ?auto_183316 ?auto_183320 ) ) ( not ( = ?auto_183317 ?auto_183318 ) ) ( not ( = ?auto_183317 ?auto_183319 ) ) ( not ( = ?auto_183317 ?auto_183320 ) ) ( not ( = ?auto_183318 ?auto_183319 ) ) ( not ( = ?auto_183318 ?auto_183320 ) ) ( not ( = ?auto_183319 ?auto_183320 ) ) ( ON-TABLE ?auto_183320 ) ( ON ?auto_183319 ?auto_183320 ) ( ON ?auto_183318 ?auto_183319 ) ( ON ?auto_183317 ?auto_183318 ) ( CLEAR ?auto_183317 ) ( HOLDING ?auto_183316 ) ( CLEAR ?auto_183315 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183313 ?auto_183314 ?auto_183315 ?auto_183316 )
      ( MAKE-8PILE ?auto_183313 ?auto_183314 ?auto_183315 ?auto_183316 ?auto_183317 ?auto_183318 ?auto_183319 ?auto_183320 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183321 - BLOCK
      ?auto_183322 - BLOCK
      ?auto_183323 - BLOCK
      ?auto_183324 - BLOCK
      ?auto_183325 - BLOCK
      ?auto_183326 - BLOCK
      ?auto_183327 - BLOCK
      ?auto_183328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183321 ) ( ON ?auto_183322 ?auto_183321 ) ( ON ?auto_183323 ?auto_183322 ) ( not ( = ?auto_183321 ?auto_183322 ) ) ( not ( = ?auto_183321 ?auto_183323 ) ) ( not ( = ?auto_183321 ?auto_183324 ) ) ( not ( = ?auto_183321 ?auto_183325 ) ) ( not ( = ?auto_183321 ?auto_183326 ) ) ( not ( = ?auto_183321 ?auto_183327 ) ) ( not ( = ?auto_183321 ?auto_183328 ) ) ( not ( = ?auto_183322 ?auto_183323 ) ) ( not ( = ?auto_183322 ?auto_183324 ) ) ( not ( = ?auto_183322 ?auto_183325 ) ) ( not ( = ?auto_183322 ?auto_183326 ) ) ( not ( = ?auto_183322 ?auto_183327 ) ) ( not ( = ?auto_183322 ?auto_183328 ) ) ( not ( = ?auto_183323 ?auto_183324 ) ) ( not ( = ?auto_183323 ?auto_183325 ) ) ( not ( = ?auto_183323 ?auto_183326 ) ) ( not ( = ?auto_183323 ?auto_183327 ) ) ( not ( = ?auto_183323 ?auto_183328 ) ) ( not ( = ?auto_183324 ?auto_183325 ) ) ( not ( = ?auto_183324 ?auto_183326 ) ) ( not ( = ?auto_183324 ?auto_183327 ) ) ( not ( = ?auto_183324 ?auto_183328 ) ) ( not ( = ?auto_183325 ?auto_183326 ) ) ( not ( = ?auto_183325 ?auto_183327 ) ) ( not ( = ?auto_183325 ?auto_183328 ) ) ( not ( = ?auto_183326 ?auto_183327 ) ) ( not ( = ?auto_183326 ?auto_183328 ) ) ( not ( = ?auto_183327 ?auto_183328 ) ) ( ON-TABLE ?auto_183328 ) ( ON ?auto_183327 ?auto_183328 ) ( ON ?auto_183326 ?auto_183327 ) ( ON ?auto_183325 ?auto_183326 ) ( CLEAR ?auto_183323 ) ( ON ?auto_183324 ?auto_183325 ) ( CLEAR ?auto_183324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183328 ?auto_183327 ?auto_183326 ?auto_183325 )
      ( MAKE-8PILE ?auto_183321 ?auto_183322 ?auto_183323 ?auto_183324 ?auto_183325 ?auto_183326 ?auto_183327 ?auto_183328 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183329 - BLOCK
      ?auto_183330 - BLOCK
      ?auto_183331 - BLOCK
      ?auto_183332 - BLOCK
      ?auto_183333 - BLOCK
      ?auto_183334 - BLOCK
      ?auto_183335 - BLOCK
      ?auto_183336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183329 ) ( ON ?auto_183330 ?auto_183329 ) ( not ( = ?auto_183329 ?auto_183330 ) ) ( not ( = ?auto_183329 ?auto_183331 ) ) ( not ( = ?auto_183329 ?auto_183332 ) ) ( not ( = ?auto_183329 ?auto_183333 ) ) ( not ( = ?auto_183329 ?auto_183334 ) ) ( not ( = ?auto_183329 ?auto_183335 ) ) ( not ( = ?auto_183329 ?auto_183336 ) ) ( not ( = ?auto_183330 ?auto_183331 ) ) ( not ( = ?auto_183330 ?auto_183332 ) ) ( not ( = ?auto_183330 ?auto_183333 ) ) ( not ( = ?auto_183330 ?auto_183334 ) ) ( not ( = ?auto_183330 ?auto_183335 ) ) ( not ( = ?auto_183330 ?auto_183336 ) ) ( not ( = ?auto_183331 ?auto_183332 ) ) ( not ( = ?auto_183331 ?auto_183333 ) ) ( not ( = ?auto_183331 ?auto_183334 ) ) ( not ( = ?auto_183331 ?auto_183335 ) ) ( not ( = ?auto_183331 ?auto_183336 ) ) ( not ( = ?auto_183332 ?auto_183333 ) ) ( not ( = ?auto_183332 ?auto_183334 ) ) ( not ( = ?auto_183332 ?auto_183335 ) ) ( not ( = ?auto_183332 ?auto_183336 ) ) ( not ( = ?auto_183333 ?auto_183334 ) ) ( not ( = ?auto_183333 ?auto_183335 ) ) ( not ( = ?auto_183333 ?auto_183336 ) ) ( not ( = ?auto_183334 ?auto_183335 ) ) ( not ( = ?auto_183334 ?auto_183336 ) ) ( not ( = ?auto_183335 ?auto_183336 ) ) ( ON-TABLE ?auto_183336 ) ( ON ?auto_183335 ?auto_183336 ) ( ON ?auto_183334 ?auto_183335 ) ( ON ?auto_183333 ?auto_183334 ) ( ON ?auto_183332 ?auto_183333 ) ( CLEAR ?auto_183332 ) ( HOLDING ?auto_183331 ) ( CLEAR ?auto_183330 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183329 ?auto_183330 ?auto_183331 )
      ( MAKE-8PILE ?auto_183329 ?auto_183330 ?auto_183331 ?auto_183332 ?auto_183333 ?auto_183334 ?auto_183335 ?auto_183336 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183337 - BLOCK
      ?auto_183338 - BLOCK
      ?auto_183339 - BLOCK
      ?auto_183340 - BLOCK
      ?auto_183341 - BLOCK
      ?auto_183342 - BLOCK
      ?auto_183343 - BLOCK
      ?auto_183344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183337 ) ( ON ?auto_183338 ?auto_183337 ) ( not ( = ?auto_183337 ?auto_183338 ) ) ( not ( = ?auto_183337 ?auto_183339 ) ) ( not ( = ?auto_183337 ?auto_183340 ) ) ( not ( = ?auto_183337 ?auto_183341 ) ) ( not ( = ?auto_183337 ?auto_183342 ) ) ( not ( = ?auto_183337 ?auto_183343 ) ) ( not ( = ?auto_183337 ?auto_183344 ) ) ( not ( = ?auto_183338 ?auto_183339 ) ) ( not ( = ?auto_183338 ?auto_183340 ) ) ( not ( = ?auto_183338 ?auto_183341 ) ) ( not ( = ?auto_183338 ?auto_183342 ) ) ( not ( = ?auto_183338 ?auto_183343 ) ) ( not ( = ?auto_183338 ?auto_183344 ) ) ( not ( = ?auto_183339 ?auto_183340 ) ) ( not ( = ?auto_183339 ?auto_183341 ) ) ( not ( = ?auto_183339 ?auto_183342 ) ) ( not ( = ?auto_183339 ?auto_183343 ) ) ( not ( = ?auto_183339 ?auto_183344 ) ) ( not ( = ?auto_183340 ?auto_183341 ) ) ( not ( = ?auto_183340 ?auto_183342 ) ) ( not ( = ?auto_183340 ?auto_183343 ) ) ( not ( = ?auto_183340 ?auto_183344 ) ) ( not ( = ?auto_183341 ?auto_183342 ) ) ( not ( = ?auto_183341 ?auto_183343 ) ) ( not ( = ?auto_183341 ?auto_183344 ) ) ( not ( = ?auto_183342 ?auto_183343 ) ) ( not ( = ?auto_183342 ?auto_183344 ) ) ( not ( = ?auto_183343 ?auto_183344 ) ) ( ON-TABLE ?auto_183344 ) ( ON ?auto_183343 ?auto_183344 ) ( ON ?auto_183342 ?auto_183343 ) ( ON ?auto_183341 ?auto_183342 ) ( ON ?auto_183340 ?auto_183341 ) ( CLEAR ?auto_183338 ) ( ON ?auto_183339 ?auto_183340 ) ( CLEAR ?auto_183339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183344 ?auto_183343 ?auto_183342 ?auto_183341 ?auto_183340 )
      ( MAKE-8PILE ?auto_183337 ?auto_183338 ?auto_183339 ?auto_183340 ?auto_183341 ?auto_183342 ?auto_183343 ?auto_183344 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183345 - BLOCK
      ?auto_183346 - BLOCK
      ?auto_183347 - BLOCK
      ?auto_183348 - BLOCK
      ?auto_183349 - BLOCK
      ?auto_183350 - BLOCK
      ?auto_183351 - BLOCK
      ?auto_183352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183345 ) ( not ( = ?auto_183345 ?auto_183346 ) ) ( not ( = ?auto_183345 ?auto_183347 ) ) ( not ( = ?auto_183345 ?auto_183348 ) ) ( not ( = ?auto_183345 ?auto_183349 ) ) ( not ( = ?auto_183345 ?auto_183350 ) ) ( not ( = ?auto_183345 ?auto_183351 ) ) ( not ( = ?auto_183345 ?auto_183352 ) ) ( not ( = ?auto_183346 ?auto_183347 ) ) ( not ( = ?auto_183346 ?auto_183348 ) ) ( not ( = ?auto_183346 ?auto_183349 ) ) ( not ( = ?auto_183346 ?auto_183350 ) ) ( not ( = ?auto_183346 ?auto_183351 ) ) ( not ( = ?auto_183346 ?auto_183352 ) ) ( not ( = ?auto_183347 ?auto_183348 ) ) ( not ( = ?auto_183347 ?auto_183349 ) ) ( not ( = ?auto_183347 ?auto_183350 ) ) ( not ( = ?auto_183347 ?auto_183351 ) ) ( not ( = ?auto_183347 ?auto_183352 ) ) ( not ( = ?auto_183348 ?auto_183349 ) ) ( not ( = ?auto_183348 ?auto_183350 ) ) ( not ( = ?auto_183348 ?auto_183351 ) ) ( not ( = ?auto_183348 ?auto_183352 ) ) ( not ( = ?auto_183349 ?auto_183350 ) ) ( not ( = ?auto_183349 ?auto_183351 ) ) ( not ( = ?auto_183349 ?auto_183352 ) ) ( not ( = ?auto_183350 ?auto_183351 ) ) ( not ( = ?auto_183350 ?auto_183352 ) ) ( not ( = ?auto_183351 ?auto_183352 ) ) ( ON-TABLE ?auto_183352 ) ( ON ?auto_183351 ?auto_183352 ) ( ON ?auto_183350 ?auto_183351 ) ( ON ?auto_183349 ?auto_183350 ) ( ON ?auto_183348 ?auto_183349 ) ( ON ?auto_183347 ?auto_183348 ) ( CLEAR ?auto_183347 ) ( HOLDING ?auto_183346 ) ( CLEAR ?auto_183345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183345 ?auto_183346 )
      ( MAKE-8PILE ?auto_183345 ?auto_183346 ?auto_183347 ?auto_183348 ?auto_183349 ?auto_183350 ?auto_183351 ?auto_183352 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183353 - BLOCK
      ?auto_183354 - BLOCK
      ?auto_183355 - BLOCK
      ?auto_183356 - BLOCK
      ?auto_183357 - BLOCK
      ?auto_183358 - BLOCK
      ?auto_183359 - BLOCK
      ?auto_183360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183353 ) ( not ( = ?auto_183353 ?auto_183354 ) ) ( not ( = ?auto_183353 ?auto_183355 ) ) ( not ( = ?auto_183353 ?auto_183356 ) ) ( not ( = ?auto_183353 ?auto_183357 ) ) ( not ( = ?auto_183353 ?auto_183358 ) ) ( not ( = ?auto_183353 ?auto_183359 ) ) ( not ( = ?auto_183353 ?auto_183360 ) ) ( not ( = ?auto_183354 ?auto_183355 ) ) ( not ( = ?auto_183354 ?auto_183356 ) ) ( not ( = ?auto_183354 ?auto_183357 ) ) ( not ( = ?auto_183354 ?auto_183358 ) ) ( not ( = ?auto_183354 ?auto_183359 ) ) ( not ( = ?auto_183354 ?auto_183360 ) ) ( not ( = ?auto_183355 ?auto_183356 ) ) ( not ( = ?auto_183355 ?auto_183357 ) ) ( not ( = ?auto_183355 ?auto_183358 ) ) ( not ( = ?auto_183355 ?auto_183359 ) ) ( not ( = ?auto_183355 ?auto_183360 ) ) ( not ( = ?auto_183356 ?auto_183357 ) ) ( not ( = ?auto_183356 ?auto_183358 ) ) ( not ( = ?auto_183356 ?auto_183359 ) ) ( not ( = ?auto_183356 ?auto_183360 ) ) ( not ( = ?auto_183357 ?auto_183358 ) ) ( not ( = ?auto_183357 ?auto_183359 ) ) ( not ( = ?auto_183357 ?auto_183360 ) ) ( not ( = ?auto_183358 ?auto_183359 ) ) ( not ( = ?auto_183358 ?auto_183360 ) ) ( not ( = ?auto_183359 ?auto_183360 ) ) ( ON-TABLE ?auto_183360 ) ( ON ?auto_183359 ?auto_183360 ) ( ON ?auto_183358 ?auto_183359 ) ( ON ?auto_183357 ?auto_183358 ) ( ON ?auto_183356 ?auto_183357 ) ( ON ?auto_183355 ?auto_183356 ) ( CLEAR ?auto_183353 ) ( ON ?auto_183354 ?auto_183355 ) ( CLEAR ?auto_183354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183360 ?auto_183359 ?auto_183358 ?auto_183357 ?auto_183356 ?auto_183355 )
      ( MAKE-8PILE ?auto_183353 ?auto_183354 ?auto_183355 ?auto_183356 ?auto_183357 ?auto_183358 ?auto_183359 ?auto_183360 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183361 - BLOCK
      ?auto_183362 - BLOCK
      ?auto_183363 - BLOCK
      ?auto_183364 - BLOCK
      ?auto_183365 - BLOCK
      ?auto_183366 - BLOCK
      ?auto_183367 - BLOCK
      ?auto_183368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183361 ?auto_183362 ) ) ( not ( = ?auto_183361 ?auto_183363 ) ) ( not ( = ?auto_183361 ?auto_183364 ) ) ( not ( = ?auto_183361 ?auto_183365 ) ) ( not ( = ?auto_183361 ?auto_183366 ) ) ( not ( = ?auto_183361 ?auto_183367 ) ) ( not ( = ?auto_183361 ?auto_183368 ) ) ( not ( = ?auto_183362 ?auto_183363 ) ) ( not ( = ?auto_183362 ?auto_183364 ) ) ( not ( = ?auto_183362 ?auto_183365 ) ) ( not ( = ?auto_183362 ?auto_183366 ) ) ( not ( = ?auto_183362 ?auto_183367 ) ) ( not ( = ?auto_183362 ?auto_183368 ) ) ( not ( = ?auto_183363 ?auto_183364 ) ) ( not ( = ?auto_183363 ?auto_183365 ) ) ( not ( = ?auto_183363 ?auto_183366 ) ) ( not ( = ?auto_183363 ?auto_183367 ) ) ( not ( = ?auto_183363 ?auto_183368 ) ) ( not ( = ?auto_183364 ?auto_183365 ) ) ( not ( = ?auto_183364 ?auto_183366 ) ) ( not ( = ?auto_183364 ?auto_183367 ) ) ( not ( = ?auto_183364 ?auto_183368 ) ) ( not ( = ?auto_183365 ?auto_183366 ) ) ( not ( = ?auto_183365 ?auto_183367 ) ) ( not ( = ?auto_183365 ?auto_183368 ) ) ( not ( = ?auto_183366 ?auto_183367 ) ) ( not ( = ?auto_183366 ?auto_183368 ) ) ( not ( = ?auto_183367 ?auto_183368 ) ) ( ON-TABLE ?auto_183368 ) ( ON ?auto_183367 ?auto_183368 ) ( ON ?auto_183366 ?auto_183367 ) ( ON ?auto_183365 ?auto_183366 ) ( ON ?auto_183364 ?auto_183365 ) ( ON ?auto_183363 ?auto_183364 ) ( ON ?auto_183362 ?auto_183363 ) ( CLEAR ?auto_183362 ) ( HOLDING ?auto_183361 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183361 )
      ( MAKE-8PILE ?auto_183361 ?auto_183362 ?auto_183363 ?auto_183364 ?auto_183365 ?auto_183366 ?auto_183367 ?auto_183368 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183369 - BLOCK
      ?auto_183370 - BLOCK
      ?auto_183371 - BLOCK
      ?auto_183372 - BLOCK
      ?auto_183373 - BLOCK
      ?auto_183374 - BLOCK
      ?auto_183375 - BLOCK
      ?auto_183376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183369 ?auto_183370 ) ) ( not ( = ?auto_183369 ?auto_183371 ) ) ( not ( = ?auto_183369 ?auto_183372 ) ) ( not ( = ?auto_183369 ?auto_183373 ) ) ( not ( = ?auto_183369 ?auto_183374 ) ) ( not ( = ?auto_183369 ?auto_183375 ) ) ( not ( = ?auto_183369 ?auto_183376 ) ) ( not ( = ?auto_183370 ?auto_183371 ) ) ( not ( = ?auto_183370 ?auto_183372 ) ) ( not ( = ?auto_183370 ?auto_183373 ) ) ( not ( = ?auto_183370 ?auto_183374 ) ) ( not ( = ?auto_183370 ?auto_183375 ) ) ( not ( = ?auto_183370 ?auto_183376 ) ) ( not ( = ?auto_183371 ?auto_183372 ) ) ( not ( = ?auto_183371 ?auto_183373 ) ) ( not ( = ?auto_183371 ?auto_183374 ) ) ( not ( = ?auto_183371 ?auto_183375 ) ) ( not ( = ?auto_183371 ?auto_183376 ) ) ( not ( = ?auto_183372 ?auto_183373 ) ) ( not ( = ?auto_183372 ?auto_183374 ) ) ( not ( = ?auto_183372 ?auto_183375 ) ) ( not ( = ?auto_183372 ?auto_183376 ) ) ( not ( = ?auto_183373 ?auto_183374 ) ) ( not ( = ?auto_183373 ?auto_183375 ) ) ( not ( = ?auto_183373 ?auto_183376 ) ) ( not ( = ?auto_183374 ?auto_183375 ) ) ( not ( = ?auto_183374 ?auto_183376 ) ) ( not ( = ?auto_183375 ?auto_183376 ) ) ( ON-TABLE ?auto_183376 ) ( ON ?auto_183375 ?auto_183376 ) ( ON ?auto_183374 ?auto_183375 ) ( ON ?auto_183373 ?auto_183374 ) ( ON ?auto_183372 ?auto_183373 ) ( ON ?auto_183371 ?auto_183372 ) ( ON ?auto_183370 ?auto_183371 ) ( ON ?auto_183369 ?auto_183370 ) ( CLEAR ?auto_183369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183376 ?auto_183375 ?auto_183374 ?auto_183373 ?auto_183372 ?auto_183371 ?auto_183370 )
      ( MAKE-8PILE ?auto_183369 ?auto_183370 ?auto_183371 ?auto_183372 ?auto_183373 ?auto_183374 ?auto_183375 ?auto_183376 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183377 - BLOCK
      ?auto_183378 - BLOCK
      ?auto_183379 - BLOCK
      ?auto_183380 - BLOCK
      ?auto_183381 - BLOCK
      ?auto_183382 - BLOCK
      ?auto_183383 - BLOCK
      ?auto_183384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183377 ?auto_183378 ) ) ( not ( = ?auto_183377 ?auto_183379 ) ) ( not ( = ?auto_183377 ?auto_183380 ) ) ( not ( = ?auto_183377 ?auto_183381 ) ) ( not ( = ?auto_183377 ?auto_183382 ) ) ( not ( = ?auto_183377 ?auto_183383 ) ) ( not ( = ?auto_183377 ?auto_183384 ) ) ( not ( = ?auto_183378 ?auto_183379 ) ) ( not ( = ?auto_183378 ?auto_183380 ) ) ( not ( = ?auto_183378 ?auto_183381 ) ) ( not ( = ?auto_183378 ?auto_183382 ) ) ( not ( = ?auto_183378 ?auto_183383 ) ) ( not ( = ?auto_183378 ?auto_183384 ) ) ( not ( = ?auto_183379 ?auto_183380 ) ) ( not ( = ?auto_183379 ?auto_183381 ) ) ( not ( = ?auto_183379 ?auto_183382 ) ) ( not ( = ?auto_183379 ?auto_183383 ) ) ( not ( = ?auto_183379 ?auto_183384 ) ) ( not ( = ?auto_183380 ?auto_183381 ) ) ( not ( = ?auto_183380 ?auto_183382 ) ) ( not ( = ?auto_183380 ?auto_183383 ) ) ( not ( = ?auto_183380 ?auto_183384 ) ) ( not ( = ?auto_183381 ?auto_183382 ) ) ( not ( = ?auto_183381 ?auto_183383 ) ) ( not ( = ?auto_183381 ?auto_183384 ) ) ( not ( = ?auto_183382 ?auto_183383 ) ) ( not ( = ?auto_183382 ?auto_183384 ) ) ( not ( = ?auto_183383 ?auto_183384 ) ) ( ON-TABLE ?auto_183384 ) ( ON ?auto_183383 ?auto_183384 ) ( ON ?auto_183382 ?auto_183383 ) ( ON ?auto_183381 ?auto_183382 ) ( ON ?auto_183380 ?auto_183381 ) ( ON ?auto_183379 ?auto_183380 ) ( ON ?auto_183378 ?auto_183379 ) ( HOLDING ?auto_183377 ) ( CLEAR ?auto_183378 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183384 ?auto_183383 ?auto_183382 ?auto_183381 ?auto_183380 ?auto_183379 ?auto_183378 ?auto_183377 )
      ( MAKE-8PILE ?auto_183377 ?auto_183378 ?auto_183379 ?auto_183380 ?auto_183381 ?auto_183382 ?auto_183383 ?auto_183384 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183385 - BLOCK
      ?auto_183386 - BLOCK
      ?auto_183387 - BLOCK
      ?auto_183388 - BLOCK
      ?auto_183389 - BLOCK
      ?auto_183390 - BLOCK
      ?auto_183391 - BLOCK
      ?auto_183392 - BLOCK
    )
    :vars
    (
      ?auto_183393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183385 ?auto_183386 ) ) ( not ( = ?auto_183385 ?auto_183387 ) ) ( not ( = ?auto_183385 ?auto_183388 ) ) ( not ( = ?auto_183385 ?auto_183389 ) ) ( not ( = ?auto_183385 ?auto_183390 ) ) ( not ( = ?auto_183385 ?auto_183391 ) ) ( not ( = ?auto_183385 ?auto_183392 ) ) ( not ( = ?auto_183386 ?auto_183387 ) ) ( not ( = ?auto_183386 ?auto_183388 ) ) ( not ( = ?auto_183386 ?auto_183389 ) ) ( not ( = ?auto_183386 ?auto_183390 ) ) ( not ( = ?auto_183386 ?auto_183391 ) ) ( not ( = ?auto_183386 ?auto_183392 ) ) ( not ( = ?auto_183387 ?auto_183388 ) ) ( not ( = ?auto_183387 ?auto_183389 ) ) ( not ( = ?auto_183387 ?auto_183390 ) ) ( not ( = ?auto_183387 ?auto_183391 ) ) ( not ( = ?auto_183387 ?auto_183392 ) ) ( not ( = ?auto_183388 ?auto_183389 ) ) ( not ( = ?auto_183388 ?auto_183390 ) ) ( not ( = ?auto_183388 ?auto_183391 ) ) ( not ( = ?auto_183388 ?auto_183392 ) ) ( not ( = ?auto_183389 ?auto_183390 ) ) ( not ( = ?auto_183389 ?auto_183391 ) ) ( not ( = ?auto_183389 ?auto_183392 ) ) ( not ( = ?auto_183390 ?auto_183391 ) ) ( not ( = ?auto_183390 ?auto_183392 ) ) ( not ( = ?auto_183391 ?auto_183392 ) ) ( ON-TABLE ?auto_183392 ) ( ON ?auto_183391 ?auto_183392 ) ( ON ?auto_183390 ?auto_183391 ) ( ON ?auto_183389 ?auto_183390 ) ( ON ?auto_183388 ?auto_183389 ) ( ON ?auto_183387 ?auto_183388 ) ( ON ?auto_183386 ?auto_183387 ) ( CLEAR ?auto_183386 ) ( ON ?auto_183385 ?auto_183393 ) ( CLEAR ?auto_183385 ) ( HAND-EMPTY ) ( not ( = ?auto_183385 ?auto_183393 ) ) ( not ( = ?auto_183386 ?auto_183393 ) ) ( not ( = ?auto_183387 ?auto_183393 ) ) ( not ( = ?auto_183388 ?auto_183393 ) ) ( not ( = ?auto_183389 ?auto_183393 ) ) ( not ( = ?auto_183390 ?auto_183393 ) ) ( not ( = ?auto_183391 ?auto_183393 ) ) ( not ( = ?auto_183392 ?auto_183393 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183385 ?auto_183393 )
      ( MAKE-8PILE ?auto_183385 ?auto_183386 ?auto_183387 ?auto_183388 ?auto_183389 ?auto_183390 ?auto_183391 ?auto_183392 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183394 - BLOCK
      ?auto_183395 - BLOCK
      ?auto_183396 - BLOCK
      ?auto_183397 - BLOCK
      ?auto_183398 - BLOCK
      ?auto_183399 - BLOCK
      ?auto_183400 - BLOCK
      ?auto_183401 - BLOCK
    )
    :vars
    (
      ?auto_183402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183394 ?auto_183395 ) ) ( not ( = ?auto_183394 ?auto_183396 ) ) ( not ( = ?auto_183394 ?auto_183397 ) ) ( not ( = ?auto_183394 ?auto_183398 ) ) ( not ( = ?auto_183394 ?auto_183399 ) ) ( not ( = ?auto_183394 ?auto_183400 ) ) ( not ( = ?auto_183394 ?auto_183401 ) ) ( not ( = ?auto_183395 ?auto_183396 ) ) ( not ( = ?auto_183395 ?auto_183397 ) ) ( not ( = ?auto_183395 ?auto_183398 ) ) ( not ( = ?auto_183395 ?auto_183399 ) ) ( not ( = ?auto_183395 ?auto_183400 ) ) ( not ( = ?auto_183395 ?auto_183401 ) ) ( not ( = ?auto_183396 ?auto_183397 ) ) ( not ( = ?auto_183396 ?auto_183398 ) ) ( not ( = ?auto_183396 ?auto_183399 ) ) ( not ( = ?auto_183396 ?auto_183400 ) ) ( not ( = ?auto_183396 ?auto_183401 ) ) ( not ( = ?auto_183397 ?auto_183398 ) ) ( not ( = ?auto_183397 ?auto_183399 ) ) ( not ( = ?auto_183397 ?auto_183400 ) ) ( not ( = ?auto_183397 ?auto_183401 ) ) ( not ( = ?auto_183398 ?auto_183399 ) ) ( not ( = ?auto_183398 ?auto_183400 ) ) ( not ( = ?auto_183398 ?auto_183401 ) ) ( not ( = ?auto_183399 ?auto_183400 ) ) ( not ( = ?auto_183399 ?auto_183401 ) ) ( not ( = ?auto_183400 ?auto_183401 ) ) ( ON-TABLE ?auto_183401 ) ( ON ?auto_183400 ?auto_183401 ) ( ON ?auto_183399 ?auto_183400 ) ( ON ?auto_183398 ?auto_183399 ) ( ON ?auto_183397 ?auto_183398 ) ( ON ?auto_183396 ?auto_183397 ) ( ON ?auto_183394 ?auto_183402 ) ( CLEAR ?auto_183394 ) ( not ( = ?auto_183394 ?auto_183402 ) ) ( not ( = ?auto_183395 ?auto_183402 ) ) ( not ( = ?auto_183396 ?auto_183402 ) ) ( not ( = ?auto_183397 ?auto_183402 ) ) ( not ( = ?auto_183398 ?auto_183402 ) ) ( not ( = ?auto_183399 ?auto_183402 ) ) ( not ( = ?auto_183400 ?auto_183402 ) ) ( not ( = ?auto_183401 ?auto_183402 ) ) ( HOLDING ?auto_183395 ) ( CLEAR ?auto_183396 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183401 ?auto_183400 ?auto_183399 ?auto_183398 ?auto_183397 ?auto_183396 ?auto_183395 )
      ( MAKE-8PILE ?auto_183394 ?auto_183395 ?auto_183396 ?auto_183397 ?auto_183398 ?auto_183399 ?auto_183400 ?auto_183401 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183403 - BLOCK
      ?auto_183404 - BLOCK
      ?auto_183405 - BLOCK
      ?auto_183406 - BLOCK
      ?auto_183407 - BLOCK
      ?auto_183408 - BLOCK
      ?auto_183409 - BLOCK
      ?auto_183410 - BLOCK
    )
    :vars
    (
      ?auto_183411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183403 ?auto_183404 ) ) ( not ( = ?auto_183403 ?auto_183405 ) ) ( not ( = ?auto_183403 ?auto_183406 ) ) ( not ( = ?auto_183403 ?auto_183407 ) ) ( not ( = ?auto_183403 ?auto_183408 ) ) ( not ( = ?auto_183403 ?auto_183409 ) ) ( not ( = ?auto_183403 ?auto_183410 ) ) ( not ( = ?auto_183404 ?auto_183405 ) ) ( not ( = ?auto_183404 ?auto_183406 ) ) ( not ( = ?auto_183404 ?auto_183407 ) ) ( not ( = ?auto_183404 ?auto_183408 ) ) ( not ( = ?auto_183404 ?auto_183409 ) ) ( not ( = ?auto_183404 ?auto_183410 ) ) ( not ( = ?auto_183405 ?auto_183406 ) ) ( not ( = ?auto_183405 ?auto_183407 ) ) ( not ( = ?auto_183405 ?auto_183408 ) ) ( not ( = ?auto_183405 ?auto_183409 ) ) ( not ( = ?auto_183405 ?auto_183410 ) ) ( not ( = ?auto_183406 ?auto_183407 ) ) ( not ( = ?auto_183406 ?auto_183408 ) ) ( not ( = ?auto_183406 ?auto_183409 ) ) ( not ( = ?auto_183406 ?auto_183410 ) ) ( not ( = ?auto_183407 ?auto_183408 ) ) ( not ( = ?auto_183407 ?auto_183409 ) ) ( not ( = ?auto_183407 ?auto_183410 ) ) ( not ( = ?auto_183408 ?auto_183409 ) ) ( not ( = ?auto_183408 ?auto_183410 ) ) ( not ( = ?auto_183409 ?auto_183410 ) ) ( ON-TABLE ?auto_183410 ) ( ON ?auto_183409 ?auto_183410 ) ( ON ?auto_183408 ?auto_183409 ) ( ON ?auto_183407 ?auto_183408 ) ( ON ?auto_183406 ?auto_183407 ) ( ON ?auto_183405 ?auto_183406 ) ( ON ?auto_183403 ?auto_183411 ) ( not ( = ?auto_183403 ?auto_183411 ) ) ( not ( = ?auto_183404 ?auto_183411 ) ) ( not ( = ?auto_183405 ?auto_183411 ) ) ( not ( = ?auto_183406 ?auto_183411 ) ) ( not ( = ?auto_183407 ?auto_183411 ) ) ( not ( = ?auto_183408 ?auto_183411 ) ) ( not ( = ?auto_183409 ?auto_183411 ) ) ( not ( = ?auto_183410 ?auto_183411 ) ) ( CLEAR ?auto_183405 ) ( ON ?auto_183404 ?auto_183403 ) ( CLEAR ?auto_183404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183411 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183411 ?auto_183403 )
      ( MAKE-8PILE ?auto_183403 ?auto_183404 ?auto_183405 ?auto_183406 ?auto_183407 ?auto_183408 ?auto_183409 ?auto_183410 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183412 - BLOCK
      ?auto_183413 - BLOCK
      ?auto_183414 - BLOCK
      ?auto_183415 - BLOCK
      ?auto_183416 - BLOCK
      ?auto_183417 - BLOCK
      ?auto_183418 - BLOCK
      ?auto_183419 - BLOCK
    )
    :vars
    (
      ?auto_183420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183412 ?auto_183413 ) ) ( not ( = ?auto_183412 ?auto_183414 ) ) ( not ( = ?auto_183412 ?auto_183415 ) ) ( not ( = ?auto_183412 ?auto_183416 ) ) ( not ( = ?auto_183412 ?auto_183417 ) ) ( not ( = ?auto_183412 ?auto_183418 ) ) ( not ( = ?auto_183412 ?auto_183419 ) ) ( not ( = ?auto_183413 ?auto_183414 ) ) ( not ( = ?auto_183413 ?auto_183415 ) ) ( not ( = ?auto_183413 ?auto_183416 ) ) ( not ( = ?auto_183413 ?auto_183417 ) ) ( not ( = ?auto_183413 ?auto_183418 ) ) ( not ( = ?auto_183413 ?auto_183419 ) ) ( not ( = ?auto_183414 ?auto_183415 ) ) ( not ( = ?auto_183414 ?auto_183416 ) ) ( not ( = ?auto_183414 ?auto_183417 ) ) ( not ( = ?auto_183414 ?auto_183418 ) ) ( not ( = ?auto_183414 ?auto_183419 ) ) ( not ( = ?auto_183415 ?auto_183416 ) ) ( not ( = ?auto_183415 ?auto_183417 ) ) ( not ( = ?auto_183415 ?auto_183418 ) ) ( not ( = ?auto_183415 ?auto_183419 ) ) ( not ( = ?auto_183416 ?auto_183417 ) ) ( not ( = ?auto_183416 ?auto_183418 ) ) ( not ( = ?auto_183416 ?auto_183419 ) ) ( not ( = ?auto_183417 ?auto_183418 ) ) ( not ( = ?auto_183417 ?auto_183419 ) ) ( not ( = ?auto_183418 ?auto_183419 ) ) ( ON-TABLE ?auto_183419 ) ( ON ?auto_183418 ?auto_183419 ) ( ON ?auto_183417 ?auto_183418 ) ( ON ?auto_183416 ?auto_183417 ) ( ON ?auto_183415 ?auto_183416 ) ( ON ?auto_183412 ?auto_183420 ) ( not ( = ?auto_183412 ?auto_183420 ) ) ( not ( = ?auto_183413 ?auto_183420 ) ) ( not ( = ?auto_183414 ?auto_183420 ) ) ( not ( = ?auto_183415 ?auto_183420 ) ) ( not ( = ?auto_183416 ?auto_183420 ) ) ( not ( = ?auto_183417 ?auto_183420 ) ) ( not ( = ?auto_183418 ?auto_183420 ) ) ( not ( = ?auto_183419 ?auto_183420 ) ) ( ON ?auto_183413 ?auto_183412 ) ( CLEAR ?auto_183413 ) ( ON-TABLE ?auto_183420 ) ( HOLDING ?auto_183414 ) ( CLEAR ?auto_183415 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183419 ?auto_183418 ?auto_183417 ?auto_183416 ?auto_183415 ?auto_183414 )
      ( MAKE-8PILE ?auto_183412 ?auto_183413 ?auto_183414 ?auto_183415 ?auto_183416 ?auto_183417 ?auto_183418 ?auto_183419 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183421 - BLOCK
      ?auto_183422 - BLOCK
      ?auto_183423 - BLOCK
      ?auto_183424 - BLOCK
      ?auto_183425 - BLOCK
      ?auto_183426 - BLOCK
      ?auto_183427 - BLOCK
      ?auto_183428 - BLOCK
    )
    :vars
    (
      ?auto_183429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183421 ?auto_183422 ) ) ( not ( = ?auto_183421 ?auto_183423 ) ) ( not ( = ?auto_183421 ?auto_183424 ) ) ( not ( = ?auto_183421 ?auto_183425 ) ) ( not ( = ?auto_183421 ?auto_183426 ) ) ( not ( = ?auto_183421 ?auto_183427 ) ) ( not ( = ?auto_183421 ?auto_183428 ) ) ( not ( = ?auto_183422 ?auto_183423 ) ) ( not ( = ?auto_183422 ?auto_183424 ) ) ( not ( = ?auto_183422 ?auto_183425 ) ) ( not ( = ?auto_183422 ?auto_183426 ) ) ( not ( = ?auto_183422 ?auto_183427 ) ) ( not ( = ?auto_183422 ?auto_183428 ) ) ( not ( = ?auto_183423 ?auto_183424 ) ) ( not ( = ?auto_183423 ?auto_183425 ) ) ( not ( = ?auto_183423 ?auto_183426 ) ) ( not ( = ?auto_183423 ?auto_183427 ) ) ( not ( = ?auto_183423 ?auto_183428 ) ) ( not ( = ?auto_183424 ?auto_183425 ) ) ( not ( = ?auto_183424 ?auto_183426 ) ) ( not ( = ?auto_183424 ?auto_183427 ) ) ( not ( = ?auto_183424 ?auto_183428 ) ) ( not ( = ?auto_183425 ?auto_183426 ) ) ( not ( = ?auto_183425 ?auto_183427 ) ) ( not ( = ?auto_183425 ?auto_183428 ) ) ( not ( = ?auto_183426 ?auto_183427 ) ) ( not ( = ?auto_183426 ?auto_183428 ) ) ( not ( = ?auto_183427 ?auto_183428 ) ) ( ON-TABLE ?auto_183428 ) ( ON ?auto_183427 ?auto_183428 ) ( ON ?auto_183426 ?auto_183427 ) ( ON ?auto_183425 ?auto_183426 ) ( ON ?auto_183424 ?auto_183425 ) ( ON ?auto_183421 ?auto_183429 ) ( not ( = ?auto_183421 ?auto_183429 ) ) ( not ( = ?auto_183422 ?auto_183429 ) ) ( not ( = ?auto_183423 ?auto_183429 ) ) ( not ( = ?auto_183424 ?auto_183429 ) ) ( not ( = ?auto_183425 ?auto_183429 ) ) ( not ( = ?auto_183426 ?auto_183429 ) ) ( not ( = ?auto_183427 ?auto_183429 ) ) ( not ( = ?auto_183428 ?auto_183429 ) ) ( ON ?auto_183422 ?auto_183421 ) ( ON-TABLE ?auto_183429 ) ( CLEAR ?auto_183424 ) ( ON ?auto_183423 ?auto_183422 ) ( CLEAR ?auto_183423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183429 ?auto_183421 ?auto_183422 )
      ( MAKE-8PILE ?auto_183421 ?auto_183422 ?auto_183423 ?auto_183424 ?auto_183425 ?auto_183426 ?auto_183427 ?auto_183428 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183430 - BLOCK
      ?auto_183431 - BLOCK
      ?auto_183432 - BLOCK
      ?auto_183433 - BLOCK
      ?auto_183434 - BLOCK
      ?auto_183435 - BLOCK
      ?auto_183436 - BLOCK
      ?auto_183437 - BLOCK
    )
    :vars
    (
      ?auto_183438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183430 ?auto_183431 ) ) ( not ( = ?auto_183430 ?auto_183432 ) ) ( not ( = ?auto_183430 ?auto_183433 ) ) ( not ( = ?auto_183430 ?auto_183434 ) ) ( not ( = ?auto_183430 ?auto_183435 ) ) ( not ( = ?auto_183430 ?auto_183436 ) ) ( not ( = ?auto_183430 ?auto_183437 ) ) ( not ( = ?auto_183431 ?auto_183432 ) ) ( not ( = ?auto_183431 ?auto_183433 ) ) ( not ( = ?auto_183431 ?auto_183434 ) ) ( not ( = ?auto_183431 ?auto_183435 ) ) ( not ( = ?auto_183431 ?auto_183436 ) ) ( not ( = ?auto_183431 ?auto_183437 ) ) ( not ( = ?auto_183432 ?auto_183433 ) ) ( not ( = ?auto_183432 ?auto_183434 ) ) ( not ( = ?auto_183432 ?auto_183435 ) ) ( not ( = ?auto_183432 ?auto_183436 ) ) ( not ( = ?auto_183432 ?auto_183437 ) ) ( not ( = ?auto_183433 ?auto_183434 ) ) ( not ( = ?auto_183433 ?auto_183435 ) ) ( not ( = ?auto_183433 ?auto_183436 ) ) ( not ( = ?auto_183433 ?auto_183437 ) ) ( not ( = ?auto_183434 ?auto_183435 ) ) ( not ( = ?auto_183434 ?auto_183436 ) ) ( not ( = ?auto_183434 ?auto_183437 ) ) ( not ( = ?auto_183435 ?auto_183436 ) ) ( not ( = ?auto_183435 ?auto_183437 ) ) ( not ( = ?auto_183436 ?auto_183437 ) ) ( ON-TABLE ?auto_183437 ) ( ON ?auto_183436 ?auto_183437 ) ( ON ?auto_183435 ?auto_183436 ) ( ON ?auto_183434 ?auto_183435 ) ( ON ?auto_183430 ?auto_183438 ) ( not ( = ?auto_183430 ?auto_183438 ) ) ( not ( = ?auto_183431 ?auto_183438 ) ) ( not ( = ?auto_183432 ?auto_183438 ) ) ( not ( = ?auto_183433 ?auto_183438 ) ) ( not ( = ?auto_183434 ?auto_183438 ) ) ( not ( = ?auto_183435 ?auto_183438 ) ) ( not ( = ?auto_183436 ?auto_183438 ) ) ( not ( = ?auto_183437 ?auto_183438 ) ) ( ON ?auto_183431 ?auto_183430 ) ( ON-TABLE ?auto_183438 ) ( ON ?auto_183432 ?auto_183431 ) ( CLEAR ?auto_183432 ) ( HOLDING ?auto_183433 ) ( CLEAR ?auto_183434 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183437 ?auto_183436 ?auto_183435 ?auto_183434 ?auto_183433 )
      ( MAKE-8PILE ?auto_183430 ?auto_183431 ?auto_183432 ?auto_183433 ?auto_183434 ?auto_183435 ?auto_183436 ?auto_183437 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183439 - BLOCK
      ?auto_183440 - BLOCK
      ?auto_183441 - BLOCK
      ?auto_183442 - BLOCK
      ?auto_183443 - BLOCK
      ?auto_183444 - BLOCK
      ?auto_183445 - BLOCK
      ?auto_183446 - BLOCK
    )
    :vars
    (
      ?auto_183447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183439 ?auto_183440 ) ) ( not ( = ?auto_183439 ?auto_183441 ) ) ( not ( = ?auto_183439 ?auto_183442 ) ) ( not ( = ?auto_183439 ?auto_183443 ) ) ( not ( = ?auto_183439 ?auto_183444 ) ) ( not ( = ?auto_183439 ?auto_183445 ) ) ( not ( = ?auto_183439 ?auto_183446 ) ) ( not ( = ?auto_183440 ?auto_183441 ) ) ( not ( = ?auto_183440 ?auto_183442 ) ) ( not ( = ?auto_183440 ?auto_183443 ) ) ( not ( = ?auto_183440 ?auto_183444 ) ) ( not ( = ?auto_183440 ?auto_183445 ) ) ( not ( = ?auto_183440 ?auto_183446 ) ) ( not ( = ?auto_183441 ?auto_183442 ) ) ( not ( = ?auto_183441 ?auto_183443 ) ) ( not ( = ?auto_183441 ?auto_183444 ) ) ( not ( = ?auto_183441 ?auto_183445 ) ) ( not ( = ?auto_183441 ?auto_183446 ) ) ( not ( = ?auto_183442 ?auto_183443 ) ) ( not ( = ?auto_183442 ?auto_183444 ) ) ( not ( = ?auto_183442 ?auto_183445 ) ) ( not ( = ?auto_183442 ?auto_183446 ) ) ( not ( = ?auto_183443 ?auto_183444 ) ) ( not ( = ?auto_183443 ?auto_183445 ) ) ( not ( = ?auto_183443 ?auto_183446 ) ) ( not ( = ?auto_183444 ?auto_183445 ) ) ( not ( = ?auto_183444 ?auto_183446 ) ) ( not ( = ?auto_183445 ?auto_183446 ) ) ( ON-TABLE ?auto_183446 ) ( ON ?auto_183445 ?auto_183446 ) ( ON ?auto_183444 ?auto_183445 ) ( ON ?auto_183443 ?auto_183444 ) ( ON ?auto_183439 ?auto_183447 ) ( not ( = ?auto_183439 ?auto_183447 ) ) ( not ( = ?auto_183440 ?auto_183447 ) ) ( not ( = ?auto_183441 ?auto_183447 ) ) ( not ( = ?auto_183442 ?auto_183447 ) ) ( not ( = ?auto_183443 ?auto_183447 ) ) ( not ( = ?auto_183444 ?auto_183447 ) ) ( not ( = ?auto_183445 ?auto_183447 ) ) ( not ( = ?auto_183446 ?auto_183447 ) ) ( ON ?auto_183440 ?auto_183439 ) ( ON-TABLE ?auto_183447 ) ( ON ?auto_183441 ?auto_183440 ) ( CLEAR ?auto_183443 ) ( ON ?auto_183442 ?auto_183441 ) ( CLEAR ?auto_183442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183447 ?auto_183439 ?auto_183440 ?auto_183441 )
      ( MAKE-8PILE ?auto_183439 ?auto_183440 ?auto_183441 ?auto_183442 ?auto_183443 ?auto_183444 ?auto_183445 ?auto_183446 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183448 - BLOCK
      ?auto_183449 - BLOCK
      ?auto_183450 - BLOCK
      ?auto_183451 - BLOCK
      ?auto_183452 - BLOCK
      ?auto_183453 - BLOCK
      ?auto_183454 - BLOCK
      ?auto_183455 - BLOCK
    )
    :vars
    (
      ?auto_183456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183448 ?auto_183449 ) ) ( not ( = ?auto_183448 ?auto_183450 ) ) ( not ( = ?auto_183448 ?auto_183451 ) ) ( not ( = ?auto_183448 ?auto_183452 ) ) ( not ( = ?auto_183448 ?auto_183453 ) ) ( not ( = ?auto_183448 ?auto_183454 ) ) ( not ( = ?auto_183448 ?auto_183455 ) ) ( not ( = ?auto_183449 ?auto_183450 ) ) ( not ( = ?auto_183449 ?auto_183451 ) ) ( not ( = ?auto_183449 ?auto_183452 ) ) ( not ( = ?auto_183449 ?auto_183453 ) ) ( not ( = ?auto_183449 ?auto_183454 ) ) ( not ( = ?auto_183449 ?auto_183455 ) ) ( not ( = ?auto_183450 ?auto_183451 ) ) ( not ( = ?auto_183450 ?auto_183452 ) ) ( not ( = ?auto_183450 ?auto_183453 ) ) ( not ( = ?auto_183450 ?auto_183454 ) ) ( not ( = ?auto_183450 ?auto_183455 ) ) ( not ( = ?auto_183451 ?auto_183452 ) ) ( not ( = ?auto_183451 ?auto_183453 ) ) ( not ( = ?auto_183451 ?auto_183454 ) ) ( not ( = ?auto_183451 ?auto_183455 ) ) ( not ( = ?auto_183452 ?auto_183453 ) ) ( not ( = ?auto_183452 ?auto_183454 ) ) ( not ( = ?auto_183452 ?auto_183455 ) ) ( not ( = ?auto_183453 ?auto_183454 ) ) ( not ( = ?auto_183453 ?auto_183455 ) ) ( not ( = ?auto_183454 ?auto_183455 ) ) ( ON-TABLE ?auto_183455 ) ( ON ?auto_183454 ?auto_183455 ) ( ON ?auto_183453 ?auto_183454 ) ( ON ?auto_183448 ?auto_183456 ) ( not ( = ?auto_183448 ?auto_183456 ) ) ( not ( = ?auto_183449 ?auto_183456 ) ) ( not ( = ?auto_183450 ?auto_183456 ) ) ( not ( = ?auto_183451 ?auto_183456 ) ) ( not ( = ?auto_183452 ?auto_183456 ) ) ( not ( = ?auto_183453 ?auto_183456 ) ) ( not ( = ?auto_183454 ?auto_183456 ) ) ( not ( = ?auto_183455 ?auto_183456 ) ) ( ON ?auto_183449 ?auto_183448 ) ( ON-TABLE ?auto_183456 ) ( ON ?auto_183450 ?auto_183449 ) ( ON ?auto_183451 ?auto_183450 ) ( CLEAR ?auto_183451 ) ( HOLDING ?auto_183452 ) ( CLEAR ?auto_183453 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183455 ?auto_183454 ?auto_183453 ?auto_183452 )
      ( MAKE-8PILE ?auto_183448 ?auto_183449 ?auto_183450 ?auto_183451 ?auto_183452 ?auto_183453 ?auto_183454 ?auto_183455 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183457 - BLOCK
      ?auto_183458 - BLOCK
      ?auto_183459 - BLOCK
      ?auto_183460 - BLOCK
      ?auto_183461 - BLOCK
      ?auto_183462 - BLOCK
      ?auto_183463 - BLOCK
      ?auto_183464 - BLOCK
    )
    :vars
    (
      ?auto_183465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183457 ?auto_183458 ) ) ( not ( = ?auto_183457 ?auto_183459 ) ) ( not ( = ?auto_183457 ?auto_183460 ) ) ( not ( = ?auto_183457 ?auto_183461 ) ) ( not ( = ?auto_183457 ?auto_183462 ) ) ( not ( = ?auto_183457 ?auto_183463 ) ) ( not ( = ?auto_183457 ?auto_183464 ) ) ( not ( = ?auto_183458 ?auto_183459 ) ) ( not ( = ?auto_183458 ?auto_183460 ) ) ( not ( = ?auto_183458 ?auto_183461 ) ) ( not ( = ?auto_183458 ?auto_183462 ) ) ( not ( = ?auto_183458 ?auto_183463 ) ) ( not ( = ?auto_183458 ?auto_183464 ) ) ( not ( = ?auto_183459 ?auto_183460 ) ) ( not ( = ?auto_183459 ?auto_183461 ) ) ( not ( = ?auto_183459 ?auto_183462 ) ) ( not ( = ?auto_183459 ?auto_183463 ) ) ( not ( = ?auto_183459 ?auto_183464 ) ) ( not ( = ?auto_183460 ?auto_183461 ) ) ( not ( = ?auto_183460 ?auto_183462 ) ) ( not ( = ?auto_183460 ?auto_183463 ) ) ( not ( = ?auto_183460 ?auto_183464 ) ) ( not ( = ?auto_183461 ?auto_183462 ) ) ( not ( = ?auto_183461 ?auto_183463 ) ) ( not ( = ?auto_183461 ?auto_183464 ) ) ( not ( = ?auto_183462 ?auto_183463 ) ) ( not ( = ?auto_183462 ?auto_183464 ) ) ( not ( = ?auto_183463 ?auto_183464 ) ) ( ON-TABLE ?auto_183464 ) ( ON ?auto_183463 ?auto_183464 ) ( ON ?auto_183462 ?auto_183463 ) ( ON ?auto_183457 ?auto_183465 ) ( not ( = ?auto_183457 ?auto_183465 ) ) ( not ( = ?auto_183458 ?auto_183465 ) ) ( not ( = ?auto_183459 ?auto_183465 ) ) ( not ( = ?auto_183460 ?auto_183465 ) ) ( not ( = ?auto_183461 ?auto_183465 ) ) ( not ( = ?auto_183462 ?auto_183465 ) ) ( not ( = ?auto_183463 ?auto_183465 ) ) ( not ( = ?auto_183464 ?auto_183465 ) ) ( ON ?auto_183458 ?auto_183457 ) ( ON-TABLE ?auto_183465 ) ( ON ?auto_183459 ?auto_183458 ) ( ON ?auto_183460 ?auto_183459 ) ( CLEAR ?auto_183462 ) ( ON ?auto_183461 ?auto_183460 ) ( CLEAR ?auto_183461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183465 ?auto_183457 ?auto_183458 ?auto_183459 ?auto_183460 )
      ( MAKE-8PILE ?auto_183457 ?auto_183458 ?auto_183459 ?auto_183460 ?auto_183461 ?auto_183462 ?auto_183463 ?auto_183464 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183466 - BLOCK
      ?auto_183467 - BLOCK
      ?auto_183468 - BLOCK
      ?auto_183469 - BLOCK
      ?auto_183470 - BLOCK
      ?auto_183471 - BLOCK
      ?auto_183472 - BLOCK
      ?auto_183473 - BLOCK
    )
    :vars
    (
      ?auto_183474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183466 ?auto_183467 ) ) ( not ( = ?auto_183466 ?auto_183468 ) ) ( not ( = ?auto_183466 ?auto_183469 ) ) ( not ( = ?auto_183466 ?auto_183470 ) ) ( not ( = ?auto_183466 ?auto_183471 ) ) ( not ( = ?auto_183466 ?auto_183472 ) ) ( not ( = ?auto_183466 ?auto_183473 ) ) ( not ( = ?auto_183467 ?auto_183468 ) ) ( not ( = ?auto_183467 ?auto_183469 ) ) ( not ( = ?auto_183467 ?auto_183470 ) ) ( not ( = ?auto_183467 ?auto_183471 ) ) ( not ( = ?auto_183467 ?auto_183472 ) ) ( not ( = ?auto_183467 ?auto_183473 ) ) ( not ( = ?auto_183468 ?auto_183469 ) ) ( not ( = ?auto_183468 ?auto_183470 ) ) ( not ( = ?auto_183468 ?auto_183471 ) ) ( not ( = ?auto_183468 ?auto_183472 ) ) ( not ( = ?auto_183468 ?auto_183473 ) ) ( not ( = ?auto_183469 ?auto_183470 ) ) ( not ( = ?auto_183469 ?auto_183471 ) ) ( not ( = ?auto_183469 ?auto_183472 ) ) ( not ( = ?auto_183469 ?auto_183473 ) ) ( not ( = ?auto_183470 ?auto_183471 ) ) ( not ( = ?auto_183470 ?auto_183472 ) ) ( not ( = ?auto_183470 ?auto_183473 ) ) ( not ( = ?auto_183471 ?auto_183472 ) ) ( not ( = ?auto_183471 ?auto_183473 ) ) ( not ( = ?auto_183472 ?auto_183473 ) ) ( ON-TABLE ?auto_183473 ) ( ON ?auto_183472 ?auto_183473 ) ( ON ?auto_183466 ?auto_183474 ) ( not ( = ?auto_183466 ?auto_183474 ) ) ( not ( = ?auto_183467 ?auto_183474 ) ) ( not ( = ?auto_183468 ?auto_183474 ) ) ( not ( = ?auto_183469 ?auto_183474 ) ) ( not ( = ?auto_183470 ?auto_183474 ) ) ( not ( = ?auto_183471 ?auto_183474 ) ) ( not ( = ?auto_183472 ?auto_183474 ) ) ( not ( = ?auto_183473 ?auto_183474 ) ) ( ON ?auto_183467 ?auto_183466 ) ( ON-TABLE ?auto_183474 ) ( ON ?auto_183468 ?auto_183467 ) ( ON ?auto_183469 ?auto_183468 ) ( ON ?auto_183470 ?auto_183469 ) ( CLEAR ?auto_183470 ) ( HOLDING ?auto_183471 ) ( CLEAR ?auto_183472 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183473 ?auto_183472 ?auto_183471 )
      ( MAKE-8PILE ?auto_183466 ?auto_183467 ?auto_183468 ?auto_183469 ?auto_183470 ?auto_183471 ?auto_183472 ?auto_183473 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183475 - BLOCK
      ?auto_183476 - BLOCK
      ?auto_183477 - BLOCK
      ?auto_183478 - BLOCK
      ?auto_183479 - BLOCK
      ?auto_183480 - BLOCK
      ?auto_183481 - BLOCK
      ?auto_183482 - BLOCK
    )
    :vars
    (
      ?auto_183483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183475 ?auto_183476 ) ) ( not ( = ?auto_183475 ?auto_183477 ) ) ( not ( = ?auto_183475 ?auto_183478 ) ) ( not ( = ?auto_183475 ?auto_183479 ) ) ( not ( = ?auto_183475 ?auto_183480 ) ) ( not ( = ?auto_183475 ?auto_183481 ) ) ( not ( = ?auto_183475 ?auto_183482 ) ) ( not ( = ?auto_183476 ?auto_183477 ) ) ( not ( = ?auto_183476 ?auto_183478 ) ) ( not ( = ?auto_183476 ?auto_183479 ) ) ( not ( = ?auto_183476 ?auto_183480 ) ) ( not ( = ?auto_183476 ?auto_183481 ) ) ( not ( = ?auto_183476 ?auto_183482 ) ) ( not ( = ?auto_183477 ?auto_183478 ) ) ( not ( = ?auto_183477 ?auto_183479 ) ) ( not ( = ?auto_183477 ?auto_183480 ) ) ( not ( = ?auto_183477 ?auto_183481 ) ) ( not ( = ?auto_183477 ?auto_183482 ) ) ( not ( = ?auto_183478 ?auto_183479 ) ) ( not ( = ?auto_183478 ?auto_183480 ) ) ( not ( = ?auto_183478 ?auto_183481 ) ) ( not ( = ?auto_183478 ?auto_183482 ) ) ( not ( = ?auto_183479 ?auto_183480 ) ) ( not ( = ?auto_183479 ?auto_183481 ) ) ( not ( = ?auto_183479 ?auto_183482 ) ) ( not ( = ?auto_183480 ?auto_183481 ) ) ( not ( = ?auto_183480 ?auto_183482 ) ) ( not ( = ?auto_183481 ?auto_183482 ) ) ( ON-TABLE ?auto_183482 ) ( ON ?auto_183481 ?auto_183482 ) ( ON ?auto_183475 ?auto_183483 ) ( not ( = ?auto_183475 ?auto_183483 ) ) ( not ( = ?auto_183476 ?auto_183483 ) ) ( not ( = ?auto_183477 ?auto_183483 ) ) ( not ( = ?auto_183478 ?auto_183483 ) ) ( not ( = ?auto_183479 ?auto_183483 ) ) ( not ( = ?auto_183480 ?auto_183483 ) ) ( not ( = ?auto_183481 ?auto_183483 ) ) ( not ( = ?auto_183482 ?auto_183483 ) ) ( ON ?auto_183476 ?auto_183475 ) ( ON-TABLE ?auto_183483 ) ( ON ?auto_183477 ?auto_183476 ) ( ON ?auto_183478 ?auto_183477 ) ( ON ?auto_183479 ?auto_183478 ) ( CLEAR ?auto_183481 ) ( ON ?auto_183480 ?auto_183479 ) ( CLEAR ?auto_183480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183483 ?auto_183475 ?auto_183476 ?auto_183477 ?auto_183478 ?auto_183479 )
      ( MAKE-8PILE ?auto_183475 ?auto_183476 ?auto_183477 ?auto_183478 ?auto_183479 ?auto_183480 ?auto_183481 ?auto_183482 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183484 - BLOCK
      ?auto_183485 - BLOCK
      ?auto_183486 - BLOCK
      ?auto_183487 - BLOCK
      ?auto_183488 - BLOCK
      ?auto_183489 - BLOCK
      ?auto_183490 - BLOCK
      ?auto_183491 - BLOCK
    )
    :vars
    (
      ?auto_183492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183484 ?auto_183485 ) ) ( not ( = ?auto_183484 ?auto_183486 ) ) ( not ( = ?auto_183484 ?auto_183487 ) ) ( not ( = ?auto_183484 ?auto_183488 ) ) ( not ( = ?auto_183484 ?auto_183489 ) ) ( not ( = ?auto_183484 ?auto_183490 ) ) ( not ( = ?auto_183484 ?auto_183491 ) ) ( not ( = ?auto_183485 ?auto_183486 ) ) ( not ( = ?auto_183485 ?auto_183487 ) ) ( not ( = ?auto_183485 ?auto_183488 ) ) ( not ( = ?auto_183485 ?auto_183489 ) ) ( not ( = ?auto_183485 ?auto_183490 ) ) ( not ( = ?auto_183485 ?auto_183491 ) ) ( not ( = ?auto_183486 ?auto_183487 ) ) ( not ( = ?auto_183486 ?auto_183488 ) ) ( not ( = ?auto_183486 ?auto_183489 ) ) ( not ( = ?auto_183486 ?auto_183490 ) ) ( not ( = ?auto_183486 ?auto_183491 ) ) ( not ( = ?auto_183487 ?auto_183488 ) ) ( not ( = ?auto_183487 ?auto_183489 ) ) ( not ( = ?auto_183487 ?auto_183490 ) ) ( not ( = ?auto_183487 ?auto_183491 ) ) ( not ( = ?auto_183488 ?auto_183489 ) ) ( not ( = ?auto_183488 ?auto_183490 ) ) ( not ( = ?auto_183488 ?auto_183491 ) ) ( not ( = ?auto_183489 ?auto_183490 ) ) ( not ( = ?auto_183489 ?auto_183491 ) ) ( not ( = ?auto_183490 ?auto_183491 ) ) ( ON-TABLE ?auto_183491 ) ( ON ?auto_183484 ?auto_183492 ) ( not ( = ?auto_183484 ?auto_183492 ) ) ( not ( = ?auto_183485 ?auto_183492 ) ) ( not ( = ?auto_183486 ?auto_183492 ) ) ( not ( = ?auto_183487 ?auto_183492 ) ) ( not ( = ?auto_183488 ?auto_183492 ) ) ( not ( = ?auto_183489 ?auto_183492 ) ) ( not ( = ?auto_183490 ?auto_183492 ) ) ( not ( = ?auto_183491 ?auto_183492 ) ) ( ON ?auto_183485 ?auto_183484 ) ( ON-TABLE ?auto_183492 ) ( ON ?auto_183486 ?auto_183485 ) ( ON ?auto_183487 ?auto_183486 ) ( ON ?auto_183488 ?auto_183487 ) ( ON ?auto_183489 ?auto_183488 ) ( CLEAR ?auto_183489 ) ( HOLDING ?auto_183490 ) ( CLEAR ?auto_183491 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183491 ?auto_183490 )
      ( MAKE-8PILE ?auto_183484 ?auto_183485 ?auto_183486 ?auto_183487 ?auto_183488 ?auto_183489 ?auto_183490 ?auto_183491 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183493 - BLOCK
      ?auto_183494 - BLOCK
      ?auto_183495 - BLOCK
      ?auto_183496 - BLOCK
      ?auto_183497 - BLOCK
      ?auto_183498 - BLOCK
      ?auto_183499 - BLOCK
      ?auto_183500 - BLOCK
    )
    :vars
    (
      ?auto_183501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183493 ?auto_183494 ) ) ( not ( = ?auto_183493 ?auto_183495 ) ) ( not ( = ?auto_183493 ?auto_183496 ) ) ( not ( = ?auto_183493 ?auto_183497 ) ) ( not ( = ?auto_183493 ?auto_183498 ) ) ( not ( = ?auto_183493 ?auto_183499 ) ) ( not ( = ?auto_183493 ?auto_183500 ) ) ( not ( = ?auto_183494 ?auto_183495 ) ) ( not ( = ?auto_183494 ?auto_183496 ) ) ( not ( = ?auto_183494 ?auto_183497 ) ) ( not ( = ?auto_183494 ?auto_183498 ) ) ( not ( = ?auto_183494 ?auto_183499 ) ) ( not ( = ?auto_183494 ?auto_183500 ) ) ( not ( = ?auto_183495 ?auto_183496 ) ) ( not ( = ?auto_183495 ?auto_183497 ) ) ( not ( = ?auto_183495 ?auto_183498 ) ) ( not ( = ?auto_183495 ?auto_183499 ) ) ( not ( = ?auto_183495 ?auto_183500 ) ) ( not ( = ?auto_183496 ?auto_183497 ) ) ( not ( = ?auto_183496 ?auto_183498 ) ) ( not ( = ?auto_183496 ?auto_183499 ) ) ( not ( = ?auto_183496 ?auto_183500 ) ) ( not ( = ?auto_183497 ?auto_183498 ) ) ( not ( = ?auto_183497 ?auto_183499 ) ) ( not ( = ?auto_183497 ?auto_183500 ) ) ( not ( = ?auto_183498 ?auto_183499 ) ) ( not ( = ?auto_183498 ?auto_183500 ) ) ( not ( = ?auto_183499 ?auto_183500 ) ) ( ON-TABLE ?auto_183500 ) ( ON ?auto_183493 ?auto_183501 ) ( not ( = ?auto_183493 ?auto_183501 ) ) ( not ( = ?auto_183494 ?auto_183501 ) ) ( not ( = ?auto_183495 ?auto_183501 ) ) ( not ( = ?auto_183496 ?auto_183501 ) ) ( not ( = ?auto_183497 ?auto_183501 ) ) ( not ( = ?auto_183498 ?auto_183501 ) ) ( not ( = ?auto_183499 ?auto_183501 ) ) ( not ( = ?auto_183500 ?auto_183501 ) ) ( ON ?auto_183494 ?auto_183493 ) ( ON-TABLE ?auto_183501 ) ( ON ?auto_183495 ?auto_183494 ) ( ON ?auto_183496 ?auto_183495 ) ( ON ?auto_183497 ?auto_183496 ) ( ON ?auto_183498 ?auto_183497 ) ( CLEAR ?auto_183500 ) ( ON ?auto_183499 ?auto_183498 ) ( CLEAR ?auto_183499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183501 ?auto_183493 ?auto_183494 ?auto_183495 ?auto_183496 ?auto_183497 ?auto_183498 )
      ( MAKE-8PILE ?auto_183493 ?auto_183494 ?auto_183495 ?auto_183496 ?auto_183497 ?auto_183498 ?auto_183499 ?auto_183500 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183502 - BLOCK
      ?auto_183503 - BLOCK
      ?auto_183504 - BLOCK
      ?auto_183505 - BLOCK
      ?auto_183506 - BLOCK
      ?auto_183507 - BLOCK
      ?auto_183508 - BLOCK
      ?auto_183509 - BLOCK
    )
    :vars
    (
      ?auto_183510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183502 ?auto_183503 ) ) ( not ( = ?auto_183502 ?auto_183504 ) ) ( not ( = ?auto_183502 ?auto_183505 ) ) ( not ( = ?auto_183502 ?auto_183506 ) ) ( not ( = ?auto_183502 ?auto_183507 ) ) ( not ( = ?auto_183502 ?auto_183508 ) ) ( not ( = ?auto_183502 ?auto_183509 ) ) ( not ( = ?auto_183503 ?auto_183504 ) ) ( not ( = ?auto_183503 ?auto_183505 ) ) ( not ( = ?auto_183503 ?auto_183506 ) ) ( not ( = ?auto_183503 ?auto_183507 ) ) ( not ( = ?auto_183503 ?auto_183508 ) ) ( not ( = ?auto_183503 ?auto_183509 ) ) ( not ( = ?auto_183504 ?auto_183505 ) ) ( not ( = ?auto_183504 ?auto_183506 ) ) ( not ( = ?auto_183504 ?auto_183507 ) ) ( not ( = ?auto_183504 ?auto_183508 ) ) ( not ( = ?auto_183504 ?auto_183509 ) ) ( not ( = ?auto_183505 ?auto_183506 ) ) ( not ( = ?auto_183505 ?auto_183507 ) ) ( not ( = ?auto_183505 ?auto_183508 ) ) ( not ( = ?auto_183505 ?auto_183509 ) ) ( not ( = ?auto_183506 ?auto_183507 ) ) ( not ( = ?auto_183506 ?auto_183508 ) ) ( not ( = ?auto_183506 ?auto_183509 ) ) ( not ( = ?auto_183507 ?auto_183508 ) ) ( not ( = ?auto_183507 ?auto_183509 ) ) ( not ( = ?auto_183508 ?auto_183509 ) ) ( ON ?auto_183502 ?auto_183510 ) ( not ( = ?auto_183502 ?auto_183510 ) ) ( not ( = ?auto_183503 ?auto_183510 ) ) ( not ( = ?auto_183504 ?auto_183510 ) ) ( not ( = ?auto_183505 ?auto_183510 ) ) ( not ( = ?auto_183506 ?auto_183510 ) ) ( not ( = ?auto_183507 ?auto_183510 ) ) ( not ( = ?auto_183508 ?auto_183510 ) ) ( not ( = ?auto_183509 ?auto_183510 ) ) ( ON ?auto_183503 ?auto_183502 ) ( ON-TABLE ?auto_183510 ) ( ON ?auto_183504 ?auto_183503 ) ( ON ?auto_183505 ?auto_183504 ) ( ON ?auto_183506 ?auto_183505 ) ( ON ?auto_183507 ?auto_183506 ) ( ON ?auto_183508 ?auto_183507 ) ( CLEAR ?auto_183508 ) ( HOLDING ?auto_183509 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183509 )
      ( MAKE-8PILE ?auto_183502 ?auto_183503 ?auto_183504 ?auto_183505 ?auto_183506 ?auto_183507 ?auto_183508 ?auto_183509 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183511 - BLOCK
      ?auto_183512 - BLOCK
      ?auto_183513 - BLOCK
      ?auto_183514 - BLOCK
      ?auto_183515 - BLOCK
      ?auto_183516 - BLOCK
      ?auto_183517 - BLOCK
      ?auto_183518 - BLOCK
    )
    :vars
    (
      ?auto_183519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183511 ?auto_183512 ) ) ( not ( = ?auto_183511 ?auto_183513 ) ) ( not ( = ?auto_183511 ?auto_183514 ) ) ( not ( = ?auto_183511 ?auto_183515 ) ) ( not ( = ?auto_183511 ?auto_183516 ) ) ( not ( = ?auto_183511 ?auto_183517 ) ) ( not ( = ?auto_183511 ?auto_183518 ) ) ( not ( = ?auto_183512 ?auto_183513 ) ) ( not ( = ?auto_183512 ?auto_183514 ) ) ( not ( = ?auto_183512 ?auto_183515 ) ) ( not ( = ?auto_183512 ?auto_183516 ) ) ( not ( = ?auto_183512 ?auto_183517 ) ) ( not ( = ?auto_183512 ?auto_183518 ) ) ( not ( = ?auto_183513 ?auto_183514 ) ) ( not ( = ?auto_183513 ?auto_183515 ) ) ( not ( = ?auto_183513 ?auto_183516 ) ) ( not ( = ?auto_183513 ?auto_183517 ) ) ( not ( = ?auto_183513 ?auto_183518 ) ) ( not ( = ?auto_183514 ?auto_183515 ) ) ( not ( = ?auto_183514 ?auto_183516 ) ) ( not ( = ?auto_183514 ?auto_183517 ) ) ( not ( = ?auto_183514 ?auto_183518 ) ) ( not ( = ?auto_183515 ?auto_183516 ) ) ( not ( = ?auto_183515 ?auto_183517 ) ) ( not ( = ?auto_183515 ?auto_183518 ) ) ( not ( = ?auto_183516 ?auto_183517 ) ) ( not ( = ?auto_183516 ?auto_183518 ) ) ( not ( = ?auto_183517 ?auto_183518 ) ) ( ON ?auto_183511 ?auto_183519 ) ( not ( = ?auto_183511 ?auto_183519 ) ) ( not ( = ?auto_183512 ?auto_183519 ) ) ( not ( = ?auto_183513 ?auto_183519 ) ) ( not ( = ?auto_183514 ?auto_183519 ) ) ( not ( = ?auto_183515 ?auto_183519 ) ) ( not ( = ?auto_183516 ?auto_183519 ) ) ( not ( = ?auto_183517 ?auto_183519 ) ) ( not ( = ?auto_183518 ?auto_183519 ) ) ( ON ?auto_183512 ?auto_183511 ) ( ON-TABLE ?auto_183519 ) ( ON ?auto_183513 ?auto_183512 ) ( ON ?auto_183514 ?auto_183513 ) ( ON ?auto_183515 ?auto_183514 ) ( ON ?auto_183516 ?auto_183515 ) ( ON ?auto_183517 ?auto_183516 ) ( ON ?auto_183518 ?auto_183517 ) ( CLEAR ?auto_183518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183519 ?auto_183511 ?auto_183512 ?auto_183513 ?auto_183514 ?auto_183515 ?auto_183516 ?auto_183517 )
      ( MAKE-8PILE ?auto_183511 ?auto_183512 ?auto_183513 ?auto_183514 ?auto_183515 ?auto_183516 ?auto_183517 ?auto_183518 ) )
  )

)

