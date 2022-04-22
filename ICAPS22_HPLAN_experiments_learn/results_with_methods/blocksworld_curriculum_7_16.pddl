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
      ?auto_28285 - BLOCK
    )
    :vars
    (
      ?auto_28286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28285 ?auto_28286 ) ( CLEAR ?auto_28285 ) ( HAND-EMPTY ) ( not ( = ?auto_28285 ?auto_28286 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28285 ?auto_28286 )
      ( !PUTDOWN ?auto_28285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28288 - BLOCK
    )
    :vars
    (
      ?auto_28289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28288 ?auto_28289 ) ( CLEAR ?auto_28288 ) ( HAND-EMPTY ) ( not ( = ?auto_28288 ?auto_28289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28288 ?auto_28289 )
      ( !PUTDOWN ?auto_28288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28292 - BLOCK
      ?auto_28293 - BLOCK
    )
    :vars
    (
      ?auto_28294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28292 ) ( ON ?auto_28293 ?auto_28294 ) ( CLEAR ?auto_28293 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28292 ) ( not ( = ?auto_28292 ?auto_28293 ) ) ( not ( = ?auto_28292 ?auto_28294 ) ) ( not ( = ?auto_28293 ?auto_28294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28293 ?auto_28294 )
      ( !STACK ?auto_28293 ?auto_28292 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28297 - BLOCK
      ?auto_28298 - BLOCK
    )
    :vars
    (
      ?auto_28299 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28297 ) ( ON ?auto_28298 ?auto_28299 ) ( CLEAR ?auto_28298 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28297 ) ( not ( = ?auto_28297 ?auto_28298 ) ) ( not ( = ?auto_28297 ?auto_28299 ) ) ( not ( = ?auto_28298 ?auto_28299 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28298 ?auto_28299 )
      ( !STACK ?auto_28298 ?auto_28297 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28302 - BLOCK
      ?auto_28303 - BLOCK
    )
    :vars
    (
      ?auto_28304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28303 ?auto_28304 ) ( not ( = ?auto_28302 ?auto_28303 ) ) ( not ( = ?auto_28302 ?auto_28304 ) ) ( not ( = ?auto_28303 ?auto_28304 ) ) ( ON ?auto_28302 ?auto_28303 ) ( CLEAR ?auto_28302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28302 )
      ( MAKE-2PILE ?auto_28302 ?auto_28303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28307 - BLOCK
      ?auto_28308 - BLOCK
    )
    :vars
    (
      ?auto_28309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28308 ?auto_28309 ) ( not ( = ?auto_28307 ?auto_28308 ) ) ( not ( = ?auto_28307 ?auto_28309 ) ) ( not ( = ?auto_28308 ?auto_28309 ) ) ( ON ?auto_28307 ?auto_28308 ) ( CLEAR ?auto_28307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28307 )
      ( MAKE-2PILE ?auto_28307 ?auto_28308 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28313 - BLOCK
      ?auto_28314 - BLOCK
      ?auto_28315 - BLOCK
    )
    :vars
    (
      ?auto_28316 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28314 ) ( ON ?auto_28315 ?auto_28316 ) ( CLEAR ?auto_28315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28313 ) ( ON ?auto_28314 ?auto_28313 ) ( not ( = ?auto_28313 ?auto_28314 ) ) ( not ( = ?auto_28313 ?auto_28315 ) ) ( not ( = ?auto_28313 ?auto_28316 ) ) ( not ( = ?auto_28314 ?auto_28315 ) ) ( not ( = ?auto_28314 ?auto_28316 ) ) ( not ( = ?auto_28315 ?auto_28316 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28315 ?auto_28316 )
      ( !STACK ?auto_28315 ?auto_28314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28320 - BLOCK
      ?auto_28321 - BLOCK
      ?auto_28322 - BLOCK
    )
    :vars
    (
      ?auto_28323 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28321 ) ( ON ?auto_28322 ?auto_28323 ) ( CLEAR ?auto_28322 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28320 ) ( ON ?auto_28321 ?auto_28320 ) ( not ( = ?auto_28320 ?auto_28321 ) ) ( not ( = ?auto_28320 ?auto_28322 ) ) ( not ( = ?auto_28320 ?auto_28323 ) ) ( not ( = ?auto_28321 ?auto_28322 ) ) ( not ( = ?auto_28321 ?auto_28323 ) ) ( not ( = ?auto_28322 ?auto_28323 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28322 ?auto_28323 )
      ( !STACK ?auto_28322 ?auto_28321 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28327 - BLOCK
      ?auto_28328 - BLOCK
      ?auto_28329 - BLOCK
    )
    :vars
    (
      ?auto_28330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28329 ?auto_28330 ) ( ON-TABLE ?auto_28327 ) ( not ( = ?auto_28327 ?auto_28328 ) ) ( not ( = ?auto_28327 ?auto_28329 ) ) ( not ( = ?auto_28327 ?auto_28330 ) ) ( not ( = ?auto_28328 ?auto_28329 ) ) ( not ( = ?auto_28328 ?auto_28330 ) ) ( not ( = ?auto_28329 ?auto_28330 ) ) ( CLEAR ?auto_28327 ) ( ON ?auto_28328 ?auto_28329 ) ( CLEAR ?auto_28328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28327 ?auto_28328 )
      ( MAKE-3PILE ?auto_28327 ?auto_28328 ?auto_28329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28334 - BLOCK
      ?auto_28335 - BLOCK
      ?auto_28336 - BLOCK
    )
    :vars
    (
      ?auto_28337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28336 ?auto_28337 ) ( ON-TABLE ?auto_28334 ) ( not ( = ?auto_28334 ?auto_28335 ) ) ( not ( = ?auto_28334 ?auto_28336 ) ) ( not ( = ?auto_28334 ?auto_28337 ) ) ( not ( = ?auto_28335 ?auto_28336 ) ) ( not ( = ?auto_28335 ?auto_28337 ) ) ( not ( = ?auto_28336 ?auto_28337 ) ) ( CLEAR ?auto_28334 ) ( ON ?auto_28335 ?auto_28336 ) ( CLEAR ?auto_28335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28334 ?auto_28335 )
      ( MAKE-3PILE ?auto_28334 ?auto_28335 ?auto_28336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28341 - BLOCK
      ?auto_28342 - BLOCK
      ?auto_28343 - BLOCK
    )
    :vars
    (
      ?auto_28344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28343 ?auto_28344 ) ( not ( = ?auto_28341 ?auto_28342 ) ) ( not ( = ?auto_28341 ?auto_28343 ) ) ( not ( = ?auto_28341 ?auto_28344 ) ) ( not ( = ?auto_28342 ?auto_28343 ) ) ( not ( = ?auto_28342 ?auto_28344 ) ) ( not ( = ?auto_28343 ?auto_28344 ) ) ( ON ?auto_28342 ?auto_28343 ) ( ON ?auto_28341 ?auto_28342 ) ( CLEAR ?auto_28341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28341 )
      ( MAKE-3PILE ?auto_28341 ?auto_28342 ?auto_28343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28348 - BLOCK
      ?auto_28349 - BLOCK
      ?auto_28350 - BLOCK
    )
    :vars
    (
      ?auto_28351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28350 ?auto_28351 ) ( not ( = ?auto_28348 ?auto_28349 ) ) ( not ( = ?auto_28348 ?auto_28350 ) ) ( not ( = ?auto_28348 ?auto_28351 ) ) ( not ( = ?auto_28349 ?auto_28350 ) ) ( not ( = ?auto_28349 ?auto_28351 ) ) ( not ( = ?auto_28350 ?auto_28351 ) ) ( ON ?auto_28349 ?auto_28350 ) ( ON ?auto_28348 ?auto_28349 ) ( CLEAR ?auto_28348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28348 )
      ( MAKE-3PILE ?auto_28348 ?auto_28349 ?auto_28350 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28356 - BLOCK
      ?auto_28357 - BLOCK
      ?auto_28358 - BLOCK
      ?auto_28359 - BLOCK
    )
    :vars
    (
      ?auto_28360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28358 ) ( ON ?auto_28359 ?auto_28360 ) ( CLEAR ?auto_28359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28356 ) ( ON ?auto_28357 ?auto_28356 ) ( ON ?auto_28358 ?auto_28357 ) ( not ( = ?auto_28356 ?auto_28357 ) ) ( not ( = ?auto_28356 ?auto_28358 ) ) ( not ( = ?auto_28356 ?auto_28359 ) ) ( not ( = ?auto_28356 ?auto_28360 ) ) ( not ( = ?auto_28357 ?auto_28358 ) ) ( not ( = ?auto_28357 ?auto_28359 ) ) ( not ( = ?auto_28357 ?auto_28360 ) ) ( not ( = ?auto_28358 ?auto_28359 ) ) ( not ( = ?auto_28358 ?auto_28360 ) ) ( not ( = ?auto_28359 ?auto_28360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28359 ?auto_28360 )
      ( !STACK ?auto_28359 ?auto_28358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28365 - BLOCK
      ?auto_28366 - BLOCK
      ?auto_28367 - BLOCK
      ?auto_28368 - BLOCK
    )
    :vars
    (
      ?auto_28369 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28367 ) ( ON ?auto_28368 ?auto_28369 ) ( CLEAR ?auto_28368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28365 ) ( ON ?auto_28366 ?auto_28365 ) ( ON ?auto_28367 ?auto_28366 ) ( not ( = ?auto_28365 ?auto_28366 ) ) ( not ( = ?auto_28365 ?auto_28367 ) ) ( not ( = ?auto_28365 ?auto_28368 ) ) ( not ( = ?auto_28365 ?auto_28369 ) ) ( not ( = ?auto_28366 ?auto_28367 ) ) ( not ( = ?auto_28366 ?auto_28368 ) ) ( not ( = ?auto_28366 ?auto_28369 ) ) ( not ( = ?auto_28367 ?auto_28368 ) ) ( not ( = ?auto_28367 ?auto_28369 ) ) ( not ( = ?auto_28368 ?auto_28369 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28368 ?auto_28369 )
      ( !STACK ?auto_28368 ?auto_28367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28374 - BLOCK
      ?auto_28375 - BLOCK
      ?auto_28376 - BLOCK
      ?auto_28377 - BLOCK
    )
    :vars
    (
      ?auto_28378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28377 ?auto_28378 ) ( ON-TABLE ?auto_28374 ) ( ON ?auto_28375 ?auto_28374 ) ( not ( = ?auto_28374 ?auto_28375 ) ) ( not ( = ?auto_28374 ?auto_28376 ) ) ( not ( = ?auto_28374 ?auto_28377 ) ) ( not ( = ?auto_28374 ?auto_28378 ) ) ( not ( = ?auto_28375 ?auto_28376 ) ) ( not ( = ?auto_28375 ?auto_28377 ) ) ( not ( = ?auto_28375 ?auto_28378 ) ) ( not ( = ?auto_28376 ?auto_28377 ) ) ( not ( = ?auto_28376 ?auto_28378 ) ) ( not ( = ?auto_28377 ?auto_28378 ) ) ( CLEAR ?auto_28375 ) ( ON ?auto_28376 ?auto_28377 ) ( CLEAR ?auto_28376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28374 ?auto_28375 ?auto_28376 )
      ( MAKE-4PILE ?auto_28374 ?auto_28375 ?auto_28376 ?auto_28377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28383 - BLOCK
      ?auto_28384 - BLOCK
      ?auto_28385 - BLOCK
      ?auto_28386 - BLOCK
    )
    :vars
    (
      ?auto_28387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28386 ?auto_28387 ) ( ON-TABLE ?auto_28383 ) ( ON ?auto_28384 ?auto_28383 ) ( not ( = ?auto_28383 ?auto_28384 ) ) ( not ( = ?auto_28383 ?auto_28385 ) ) ( not ( = ?auto_28383 ?auto_28386 ) ) ( not ( = ?auto_28383 ?auto_28387 ) ) ( not ( = ?auto_28384 ?auto_28385 ) ) ( not ( = ?auto_28384 ?auto_28386 ) ) ( not ( = ?auto_28384 ?auto_28387 ) ) ( not ( = ?auto_28385 ?auto_28386 ) ) ( not ( = ?auto_28385 ?auto_28387 ) ) ( not ( = ?auto_28386 ?auto_28387 ) ) ( CLEAR ?auto_28384 ) ( ON ?auto_28385 ?auto_28386 ) ( CLEAR ?auto_28385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28383 ?auto_28384 ?auto_28385 )
      ( MAKE-4PILE ?auto_28383 ?auto_28384 ?auto_28385 ?auto_28386 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28392 - BLOCK
      ?auto_28393 - BLOCK
      ?auto_28394 - BLOCK
      ?auto_28395 - BLOCK
    )
    :vars
    (
      ?auto_28396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28395 ?auto_28396 ) ( ON-TABLE ?auto_28392 ) ( not ( = ?auto_28392 ?auto_28393 ) ) ( not ( = ?auto_28392 ?auto_28394 ) ) ( not ( = ?auto_28392 ?auto_28395 ) ) ( not ( = ?auto_28392 ?auto_28396 ) ) ( not ( = ?auto_28393 ?auto_28394 ) ) ( not ( = ?auto_28393 ?auto_28395 ) ) ( not ( = ?auto_28393 ?auto_28396 ) ) ( not ( = ?auto_28394 ?auto_28395 ) ) ( not ( = ?auto_28394 ?auto_28396 ) ) ( not ( = ?auto_28395 ?auto_28396 ) ) ( ON ?auto_28394 ?auto_28395 ) ( CLEAR ?auto_28392 ) ( ON ?auto_28393 ?auto_28394 ) ( CLEAR ?auto_28393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28392 ?auto_28393 )
      ( MAKE-4PILE ?auto_28392 ?auto_28393 ?auto_28394 ?auto_28395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28401 - BLOCK
      ?auto_28402 - BLOCK
      ?auto_28403 - BLOCK
      ?auto_28404 - BLOCK
    )
    :vars
    (
      ?auto_28405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28404 ?auto_28405 ) ( ON-TABLE ?auto_28401 ) ( not ( = ?auto_28401 ?auto_28402 ) ) ( not ( = ?auto_28401 ?auto_28403 ) ) ( not ( = ?auto_28401 ?auto_28404 ) ) ( not ( = ?auto_28401 ?auto_28405 ) ) ( not ( = ?auto_28402 ?auto_28403 ) ) ( not ( = ?auto_28402 ?auto_28404 ) ) ( not ( = ?auto_28402 ?auto_28405 ) ) ( not ( = ?auto_28403 ?auto_28404 ) ) ( not ( = ?auto_28403 ?auto_28405 ) ) ( not ( = ?auto_28404 ?auto_28405 ) ) ( ON ?auto_28403 ?auto_28404 ) ( CLEAR ?auto_28401 ) ( ON ?auto_28402 ?auto_28403 ) ( CLEAR ?auto_28402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28401 ?auto_28402 )
      ( MAKE-4PILE ?auto_28401 ?auto_28402 ?auto_28403 ?auto_28404 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28410 - BLOCK
      ?auto_28411 - BLOCK
      ?auto_28412 - BLOCK
      ?auto_28413 - BLOCK
    )
    :vars
    (
      ?auto_28414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28413 ?auto_28414 ) ( not ( = ?auto_28410 ?auto_28411 ) ) ( not ( = ?auto_28410 ?auto_28412 ) ) ( not ( = ?auto_28410 ?auto_28413 ) ) ( not ( = ?auto_28410 ?auto_28414 ) ) ( not ( = ?auto_28411 ?auto_28412 ) ) ( not ( = ?auto_28411 ?auto_28413 ) ) ( not ( = ?auto_28411 ?auto_28414 ) ) ( not ( = ?auto_28412 ?auto_28413 ) ) ( not ( = ?auto_28412 ?auto_28414 ) ) ( not ( = ?auto_28413 ?auto_28414 ) ) ( ON ?auto_28412 ?auto_28413 ) ( ON ?auto_28411 ?auto_28412 ) ( ON ?auto_28410 ?auto_28411 ) ( CLEAR ?auto_28410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28410 )
      ( MAKE-4PILE ?auto_28410 ?auto_28411 ?auto_28412 ?auto_28413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28419 - BLOCK
      ?auto_28420 - BLOCK
      ?auto_28421 - BLOCK
      ?auto_28422 - BLOCK
    )
    :vars
    (
      ?auto_28423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28422 ?auto_28423 ) ( not ( = ?auto_28419 ?auto_28420 ) ) ( not ( = ?auto_28419 ?auto_28421 ) ) ( not ( = ?auto_28419 ?auto_28422 ) ) ( not ( = ?auto_28419 ?auto_28423 ) ) ( not ( = ?auto_28420 ?auto_28421 ) ) ( not ( = ?auto_28420 ?auto_28422 ) ) ( not ( = ?auto_28420 ?auto_28423 ) ) ( not ( = ?auto_28421 ?auto_28422 ) ) ( not ( = ?auto_28421 ?auto_28423 ) ) ( not ( = ?auto_28422 ?auto_28423 ) ) ( ON ?auto_28421 ?auto_28422 ) ( ON ?auto_28420 ?auto_28421 ) ( ON ?auto_28419 ?auto_28420 ) ( CLEAR ?auto_28419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28419 )
      ( MAKE-4PILE ?auto_28419 ?auto_28420 ?auto_28421 ?auto_28422 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28429 - BLOCK
      ?auto_28430 - BLOCK
      ?auto_28431 - BLOCK
      ?auto_28432 - BLOCK
      ?auto_28433 - BLOCK
    )
    :vars
    (
      ?auto_28434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28432 ) ( ON ?auto_28433 ?auto_28434 ) ( CLEAR ?auto_28433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28429 ) ( ON ?auto_28430 ?auto_28429 ) ( ON ?auto_28431 ?auto_28430 ) ( ON ?auto_28432 ?auto_28431 ) ( not ( = ?auto_28429 ?auto_28430 ) ) ( not ( = ?auto_28429 ?auto_28431 ) ) ( not ( = ?auto_28429 ?auto_28432 ) ) ( not ( = ?auto_28429 ?auto_28433 ) ) ( not ( = ?auto_28429 ?auto_28434 ) ) ( not ( = ?auto_28430 ?auto_28431 ) ) ( not ( = ?auto_28430 ?auto_28432 ) ) ( not ( = ?auto_28430 ?auto_28433 ) ) ( not ( = ?auto_28430 ?auto_28434 ) ) ( not ( = ?auto_28431 ?auto_28432 ) ) ( not ( = ?auto_28431 ?auto_28433 ) ) ( not ( = ?auto_28431 ?auto_28434 ) ) ( not ( = ?auto_28432 ?auto_28433 ) ) ( not ( = ?auto_28432 ?auto_28434 ) ) ( not ( = ?auto_28433 ?auto_28434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28433 ?auto_28434 )
      ( !STACK ?auto_28433 ?auto_28432 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28440 - BLOCK
      ?auto_28441 - BLOCK
      ?auto_28442 - BLOCK
      ?auto_28443 - BLOCK
      ?auto_28444 - BLOCK
    )
    :vars
    (
      ?auto_28445 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28443 ) ( ON ?auto_28444 ?auto_28445 ) ( CLEAR ?auto_28444 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28440 ) ( ON ?auto_28441 ?auto_28440 ) ( ON ?auto_28442 ?auto_28441 ) ( ON ?auto_28443 ?auto_28442 ) ( not ( = ?auto_28440 ?auto_28441 ) ) ( not ( = ?auto_28440 ?auto_28442 ) ) ( not ( = ?auto_28440 ?auto_28443 ) ) ( not ( = ?auto_28440 ?auto_28444 ) ) ( not ( = ?auto_28440 ?auto_28445 ) ) ( not ( = ?auto_28441 ?auto_28442 ) ) ( not ( = ?auto_28441 ?auto_28443 ) ) ( not ( = ?auto_28441 ?auto_28444 ) ) ( not ( = ?auto_28441 ?auto_28445 ) ) ( not ( = ?auto_28442 ?auto_28443 ) ) ( not ( = ?auto_28442 ?auto_28444 ) ) ( not ( = ?auto_28442 ?auto_28445 ) ) ( not ( = ?auto_28443 ?auto_28444 ) ) ( not ( = ?auto_28443 ?auto_28445 ) ) ( not ( = ?auto_28444 ?auto_28445 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28444 ?auto_28445 )
      ( !STACK ?auto_28444 ?auto_28443 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28451 - BLOCK
      ?auto_28452 - BLOCK
      ?auto_28453 - BLOCK
      ?auto_28454 - BLOCK
      ?auto_28455 - BLOCK
    )
    :vars
    (
      ?auto_28456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28455 ?auto_28456 ) ( ON-TABLE ?auto_28451 ) ( ON ?auto_28452 ?auto_28451 ) ( ON ?auto_28453 ?auto_28452 ) ( not ( = ?auto_28451 ?auto_28452 ) ) ( not ( = ?auto_28451 ?auto_28453 ) ) ( not ( = ?auto_28451 ?auto_28454 ) ) ( not ( = ?auto_28451 ?auto_28455 ) ) ( not ( = ?auto_28451 ?auto_28456 ) ) ( not ( = ?auto_28452 ?auto_28453 ) ) ( not ( = ?auto_28452 ?auto_28454 ) ) ( not ( = ?auto_28452 ?auto_28455 ) ) ( not ( = ?auto_28452 ?auto_28456 ) ) ( not ( = ?auto_28453 ?auto_28454 ) ) ( not ( = ?auto_28453 ?auto_28455 ) ) ( not ( = ?auto_28453 ?auto_28456 ) ) ( not ( = ?auto_28454 ?auto_28455 ) ) ( not ( = ?auto_28454 ?auto_28456 ) ) ( not ( = ?auto_28455 ?auto_28456 ) ) ( CLEAR ?auto_28453 ) ( ON ?auto_28454 ?auto_28455 ) ( CLEAR ?auto_28454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28451 ?auto_28452 ?auto_28453 ?auto_28454 )
      ( MAKE-5PILE ?auto_28451 ?auto_28452 ?auto_28453 ?auto_28454 ?auto_28455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28462 - BLOCK
      ?auto_28463 - BLOCK
      ?auto_28464 - BLOCK
      ?auto_28465 - BLOCK
      ?auto_28466 - BLOCK
    )
    :vars
    (
      ?auto_28467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28466 ?auto_28467 ) ( ON-TABLE ?auto_28462 ) ( ON ?auto_28463 ?auto_28462 ) ( ON ?auto_28464 ?auto_28463 ) ( not ( = ?auto_28462 ?auto_28463 ) ) ( not ( = ?auto_28462 ?auto_28464 ) ) ( not ( = ?auto_28462 ?auto_28465 ) ) ( not ( = ?auto_28462 ?auto_28466 ) ) ( not ( = ?auto_28462 ?auto_28467 ) ) ( not ( = ?auto_28463 ?auto_28464 ) ) ( not ( = ?auto_28463 ?auto_28465 ) ) ( not ( = ?auto_28463 ?auto_28466 ) ) ( not ( = ?auto_28463 ?auto_28467 ) ) ( not ( = ?auto_28464 ?auto_28465 ) ) ( not ( = ?auto_28464 ?auto_28466 ) ) ( not ( = ?auto_28464 ?auto_28467 ) ) ( not ( = ?auto_28465 ?auto_28466 ) ) ( not ( = ?auto_28465 ?auto_28467 ) ) ( not ( = ?auto_28466 ?auto_28467 ) ) ( CLEAR ?auto_28464 ) ( ON ?auto_28465 ?auto_28466 ) ( CLEAR ?auto_28465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28462 ?auto_28463 ?auto_28464 ?auto_28465 )
      ( MAKE-5PILE ?auto_28462 ?auto_28463 ?auto_28464 ?auto_28465 ?auto_28466 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28473 - BLOCK
      ?auto_28474 - BLOCK
      ?auto_28475 - BLOCK
      ?auto_28476 - BLOCK
      ?auto_28477 - BLOCK
    )
    :vars
    (
      ?auto_28478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28477 ?auto_28478 ) ( ON-TABLE ?auto_28473 ) ( ON ?auto_28474 ?auto_28473 ) ( not ( = ?auto_28473 ?auto_28474 ) ) ( not ( = ?auto_28473 ?auto_28475 ) ) ( not ( = ?auto_28473 ?auto_28476 ) ) ( not ( = ?auto_28473 ?auto_28477 ) ) ( not ( = ?auto_28473 ?auto_28478 ) ) ( not ( = ?auto_28474 ?auto_28475 ) ) ( not ( = ?auto_28474 ?auto_28476 ) ) ( not ( = ?auto_28474 ?auto_28477 ) ) ( not ( = ?auto_28474 ?auto_28478 ) ) ( not ( = ?auto_28475 ?auto_28476 ) ) ( not ( = ?auto_28475 ?auto_28477 ) ) ( not ( = ?auto_28475 ?auto_28478 ) ) ( not ( = ?auto_28476 ?auto_28477 ) ) ( not ( = ?auto_28476 ?auto_28478 ) ) ( not ( = ?auto_28477 ?auto_28478 ) ) ( ON ?auto_28476 ?auto_28477 ) ( CLEAR ?auto_28474 ) ( ON ?auto_28475 ?auto_28476 ) ( CLEAR ?auto_28475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28473 ?auto_28474 ?auto_28475 )
      ( MAKE-5PILE ?auto_28473 ?auto_28474 ?auto_28475 ?auto_28476 ?auto_28477 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28484 - BLOCK
      ?auto_28485 - BLOCK
      ?auto_28486 - BLOCK
      ?auto_28487 - BLOCK
      ?auto_28488 - BLOCK
    )
    :vars
    (
      ?auto_28489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28488 ?auto_28489 ) ( ON-TABLE ?auto_28484 ) ( ON ?auto_28485 ?auto_28484 ) ( not ( = ?auto_28484 ?auto_28485 ) ) ( not ( = ?auto_28484 ?auto_28486 ) ) ( not ( = ?auto_28484 ?auto_28487 ) ) ( not ( = ?auto_28484 ?auto_28488 ) ) ( not ( = ?auto_28484 ?auto_28489 ) ) ( not ( = ?auto_28485 ?auto_28486 ) ) ( not ( = ?auto_28485 ?auto_28487 ) ) ( not ( = ?auto_28485 ?auto_28488 ) ) ( not ( = ?auto_28485 ?auto_28489 ) ) ( not ( = ?auto_28486 ?auto_28487 ) ) ( not ( = ?auto_28486 ?auto_28488 ) ) ( not ( = ?auto_28486 ?auto_28489 ) ) ( not ( = ?auto_28487 ?auto_28488 ) ) ( not ( = ?auto_28487 ?auto_28489 ) ) ( not ( = ?auto_28488 ?auto_28489 ) ) ( ON ?auto_28487 ?auto_28488 ) ( CLEAR ?auto_28485 ) ( ON ?auto_28486 ?auto_28487 ) ( CLEAR ?auto_28486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28484 ?auto_28485 ?auto_28486 )
      ( MAKE-5PILE ?auto_28484 ?auto_28485 ?auto_28486 ?auto_28487 ?auto_28488 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28495 - BLOCK
      ?auto_28496 - BLOCK
      ?auto_28497 - BLOCK
      ?auto_28498 - BLOCK
      ?auto_28499 - BLOCK
    )
    :vars
    (
      ?auto_28500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28499 ?auto_28500 ) ( ON-TABLE ?auto_28495 ) ( not ( = ?auto_28495 ?auto_28496 ) ) ( not ( = ?auto_28495 ?auto_28497 ) ) ( not ( = ?auto_28495 ?auto_28498 ) ) ( not ( = ?auto_28495 ?auto_28499 ) ) ( not ( = ?auto_28495 ?auto_28500 ) ) ( not ( = ?auto_28496 ?auto_28497 ) ) ( not ( = ?auto_28496 ?auto_28498 ) ) ( not ( = ?auto_28496 ?auto_28499 ) ) ( not ( = ?auto_28496 ?auto_28500 ) ) ( not ( = ?auto_28497 ?auto_28498 ) ) ( not ( = ?auto_28497 ?auto_28499 ) ) ( not ( = ?auto_28497 ?auto_28500 ) ) ( not ( = ?auto_28498 ?auto_28499 ) ) ( not ( = ?auto_28498 ?auto_28500 ) ) ( not ( = ?auto_28499 ?auto_28500 ) ) ( ON ?auto_28498 ?auto_28499 ) ( ON ?auto_28497 ?auto_28498 ) ( CLEAR ?auto_28495 ) ( ON ?auto_28496 ?auto_28497 ) ( CLEAR ?auto_28496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28495 ?auto_28496 )
      ( MAKE-5PILE ?auto_28495 ?auto_28496 ?auto_28497 ?auto_28498 ?auto_28499 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28506 - BLOCK
      ?auto_28507 - BLOCK
      ?auto_28508 - BLOCK
      ?auto_28509 - BLOCK
      ?auto_28510 - BLOCK
    )
    :vars
    (
      ?auto_28511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28510 ?auto_28511 ) ( ON-TABLE ?auto_28506 ) ( not ( = ?auto_28506 ?auto_28507 ) ) ( not ( = ?auto_28506 ?auto_28508 ) ) ( not ( = ?auto_28506 ?auto_28509 ) ) ( not ( = ?auto_28506 ?auto_28510 ) ) ( not ( = ?auto_28506 ?auto_28511 ) ) ( not ( = ?auto_28507 ?auto_28508 ) ) ( not ( = ?auto_28507 ?auto_28509 ) ) ( not ( = ?auto_28507 ?auto_28510 ) ) ( not ( = ?auto_28507 ?auto_28511 ) ) ( not ( = ?auto_28508 ?auto_28509 ) ) ( not ( = ?auto_28508 ?auto_28510 ) ) ( not ( = ?auto_28508 ?auto_28511 ) ) ( not ( = ?auto_28509 ?auto_28510 ) ) ( not ( = ?auto_28509 ?auto_28511 ) ) ( not ( = ?auto_28510 ?auto_28511 ) ) ( ON ?auto_28509 ?auto_28510 ) ( ON ?auto_28508 ?auto_28509 ) ( CLEAR ?auto_28506 ) ( ON ?auto_28507 ?auto_28508 ) ( CLEAR ?auto_28507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28506 ?auto_28507 )
      ( MAKE-5PILE ?auto_28506 ?auto_28507 ?auto_28508 ?auto_28509 ?auto_28510 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28517 - BLOCK
      ?auto_28518 - BLOCK
      ?auto_28519 - BLOCK
      ?auto_28520 - BLOCK
      ?auto_28521 - BLOCK
    )
    :vars
    (
      ?auto_28522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28521 ?auto_28522 ) ( not ( = ?auto_28517 ?auto_28518 ) ) ( not ( = ?auto_28517 ?auto_28519 ) ) ( not ( = ?auto_28517 ?auto_28520 ) ) ( not ( = ?auto_28517 ?auto_28521 ) ) ( not ( = ?auto_28517 ?auto_28522 ) ) ( not ( = ?auto_28518 ?auto_28519 ) ) ( not ( = ?auto_28518 ?auto_28520 ) ) ( not ( = ?auto_28518 ?auto_28521 ) ) ( not ( = ?auto_28518 ?auto_28522 ) ) ( not ( = ?auto_28519 ?auto_28520 ) ) ( not ( = ?auto_28519 ?auto_28521 ) ) ( not ( = ?auto_28519 ?auto_28522 ) ) ( not ( = ?auto_28520 ?auto_28521 ) ) ( not ( = ?auto_28520 ?auto_28522 ) ) ( not ( = ?auto_28521 ?auto_28522 ) ) ( ON ?auto_28520 ?auto_28521 ) ( ON ?auto_28519 ?auto_28520 ) ( ON ?auto_28518 ?auto_28519 ) ( ON ?auto_28517 ?auto_28518 ) ( CLEAR ?auto_28517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28517 )
      ( MAKE-5PILE ?auto_28517 ?auto_28518 ?auto_28519 ?auto_28520 ?auto_28521 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28528 - BLOCK
      ?auto_28529 - BLOCK
      ?auto_28530 - BLOCK
      ?auto_28531 - BLOCK
      ?auto_28532 - BLOCK
    )
    :vars
    (
      ?auto_28533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28532 ?auto_28533 ) ( not ( = ?auto_28528 ?auto_28529 ) ) ( not ( = ?auto_28528 ?auto_28530 ) ) ( not ( = ?auto_28528 ?auto_28531 ) ) ( not ( = ?auto_28528 ?auto_28532 ) ) ( not ( = ?auto_28528 ?auto_28533 ) ) ( not ( = ?auto_28529 ?auto_28530 ) ) ( not ( = ?auto_28529 ?auto_28531 ) ) ( not ( = ?auto_28529 ?auto_28532 ) ) ( not ( = ?auto_28529 ?auto_28533 ) ) ( not ( = ?auto_28530 ?auto_28531 ) ) ( not ( = ?auto_28530 ?auto_28532 ) ) ( not ( = ?auto_28530 ?auto_28533 ) ) ( not ( = ?auto_28531 ?auto_28532 ) ) ( not ( = ?auto_28531 ?auto_28533 ) ) ( not ( = ?auto_28532 ?auto_28533 ) ) ( ON ?auto_28531 ?auto_28532 ) ( ON ?auto_28530 ?auto_28531 ) ( ON ?auto_28529 ?auto_28530 ) ( ON ?auto_28528 ?auto_28529 ) ( CLEAR ?auto_28528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28528 )
      ( MAKE-5PILE ?auto_28528 ?auto_28529 ?auto_28530 ?auto_28531 ?auto_28532 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28540 - BLOCK
      ?auto_28541 - BLOCK
      ?auto_28542 - BLOCK
      ?auto_28543 - BLOCK
      ?auto_28544 - BLOCK
      ?auto_28545 - BLOCK
    )
    :vars
    (
      ?auto_28546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28544 ) ( ON ?auto_28545 ?auto_28546 ) ( CLEAR ?auto_28545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28540 ) ( ON ?auto_28541 ?auto_28540 ) ( ON ?auto_28542 ?auto_28541 ) ( ON ?auto_28543 ?auto_28542 ) ( ON ?auto_28544 ?auto_28543 ) ( not ( = ?auto_28540 ?auto_28541 ) ) ( not ( = ?auto_28540 ?auto_28542 ) ) ( not ( = ?auto_28540 ?auto_28543 ) ) ( not ( = ?auto_28540 ?auto_28544 ) ) ( not ( = ?auto_28540 ?auto_28545 ) ) ( not ( = ?auto_28540 ?auto_28546 ) ) ( not ( = ?auto_28541 ?auto_28542 ) ) ( not ( = ?auto_28541 ?auto_28543 ) ) ( not ( = ?auto_28541 ?auto_28544 ) ) ( not ( = ?auto_28541 ?auto_28545 ) ) ( not ( = ?auto_28541 ?auto_28546 ) ) ( not ( = ?auto_28542 ?auto_28543 ) ) ( not ( = ?auto_28542 ?auto_28544 ) ) ( not ( = ?auto_28542 ?auto_28545 ) ) ( not ( = ?auto_28542 ?auto_28546 ) ) ( not ( = ?auto_28543 ?auto_28544 ) ) ( not ( = ?auto_28543 ?auto_28545 ) ) ( not ( = ?auto_28543 ?auto_28546 ) ) ( not ( = ?auto_28544 ?auto_28545 ) ) ( not ( = ?auto_28544 ?auto_28546 ) ) ( not ( = ?auto_28545 ?auto_28546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28545 ?auto_28546 )
      ( !STACK ?auto_28545 ?auto_28544 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28553 - BLOCK
      ?auto_28554 - BLOCK
      ?auto_28555 - BLOCK
      ?auto_28556 - BLOCK
      ?auto_28557 - BLOCK
      ?auto_28558 - BLOCK
    )
    :vars
    (
      ?auto_28559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28557 ) ( ON ?auto_28558 ?auto_28559 ) ( CLEAR ?auto_28558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28553 ) ( ON ?auto_28554 ?auto_28553 ) ( ON ?auto_28555 ?auto_28554 ) ( ON ?auto_28556 ?auto_28555 ) ( ON ?auto_28557 ?auto_28556 ) ( not ( = ?auto_28553 ?auto_28554 ) ) ( not ( = ?auto_28553 ?auto_28555 ) ) ( not ( = ?auto_28553 ?auto_28556 ) ) ( not ( = ?auto_28553 ?auto_28557 ) ) ( not ( = ?auto_28553 ?auto_28558 ) ) ( not ( = ?auto_28553 ?auto_28559 ) ) ( not ( = ?auto_28554 ?auto_28555 ) ) ( not ( = ?auto_28554 ?auto_28556 ) ) ( not ( = ?auto_28554 ?auto_28557 ) ) ( not ( = ?auto_28554 ?auto_28558 ) ) ( not ( = ?auto_28554 ?auto_28559 ) ) ( not ( = ?auto_28555 ?auto_28556 ) ) ( not ( = ?auto_28555 ?auto_28557 ) ) ( not ( = ?auto_28555 ?auto_28558 ) ) ( not ( = ?auto_28555 ?auto_28559 ) ) ( not ( = ?auto_28556 ?auto_28557 ) ) ( not ( = ?auto_28556 ?auto_28558 ) ) ( not ( = ?auto_28556 ?auto_28559 ) ) ( not ( = ?auto_28557 ?auto_28558 ) ) ( not ( = ?auto_28557 ?auto_28559 ) ) ( not ( = ?auto_28558 ?auto_28559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28558 ?auto_28559 )
      ( !STACK ?auto_28558 ?auto_28557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28566 - BLOCK
      ?auto_28567 - BLOCK
      ?auto_28568 - BLOCK
      ?auto_28569 - BLOCK
      ?auto_28570 - BLOCK
      ?auto_28571 - BLOCK
    )
    :vars
    (
      ?auto_28572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28571 ?auto_28572 ) ( ON-TABLE ?auto_28566 ) ( ON ?auto_28567 ?auto_28566 ) ( ON ?auto_28568 ?auto_28567 ) ( ON ?auto_28569 ?auto_28568 ) ( not ( = ?auto_28566 ?auto_28567 ) ) ( not ( = ?auto_28566 ?auto_28568 ) ) ( not ( = ?auto_28566 ?auto_28569 ) ) ( not ( = ?auto_28566 ?auto_28570 ) ) ( not ( = ?auto_28566 ?auto_28571 ) ) ( not ( = ?auto_28566 ?auto_28572 ) ) ( not ( = ?auto_28567 ?auto_28568 ) ) ( not ( = ?auto_28567 ?auto_28569 ) ) ( not ( = ?auto_28567 ?auto_28570 ) ) ( not ( = ?auto_28567 ?auto_28571 ) ) ( not ( = ?auto_28567 ?auto_28572 ) ) ( not ( = ?auto_28568 ?auto_28569 ) ) ( not ( = ?auto_28568 ?auto_28570 ) ) ( not ( = ?auto_28568 ?auto_28571 ) ) ( not ( = ?auto_28568 ?auto_28572 ) ) ( not ( = ?auto_28569 ?auto_28570 ) ) ( not ( = ?auto_28569 ?auto_28571 ) ) ( not ( = ?auto_28569 ?auto_28572 ) ) ( not ( = ?auto_28570 ?auto_28571 ) ) ( not ( = ?auto_28570 ?auto_28572 ) ) ( not ( = ?auto_28571 ?auto_28572 ) ) ( CLEAR ?auto_28569 ) ( ON ?auto_28570 ?auto_28571 ) ( CLEAR ?auto_28570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28566 ?auto_28567 ?auto_28568 ?auto_28569 ?auto_28570 )
      ( MAKE-6PILE ?auto_28566 ?auto_28567 ?auto_28568 ?auto_28569 ?auto_28570 ?auto_28571 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28579 - BLOCK
      ?auto_28580 - BLOCK
      ?auto_28581 - BLOCK
      ?auto_28582 - BLOCK
      ?auto_28583 - BLOCK
      ?auto_28584 - BLOCK
    )
    :vars
    (
      ?auto_28585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28584 ?auto_28585 ) ( ON-TABLE ?auto_28579 ) ( ON ?auto_28580 ?auto_28579 ) ( ON ?auto_28581 ?auto_28580 ) ( ON ?auto_28582 ?auto_28581 ) ( not ( = ?auto_28579 ?auto_28580 ) ) ( not ( = ?auto_28579 ?auto_28581 ) ) ( not ( = ?auto_28579 ?auto_28582 ) ) ( not ( = ?auto_28579 ?auto_28583 ) ) ( not ( = ?auto_28579 ?auto_28584 ) ) ( not ( = ?auto_28579 ?auto_28585 ) ) ( not ( = ?auto_28580 ?auto_28581 ) ) ( not ( = ?auto_28580 ?auto_28582 ) ) ( not ( = ?auto_28580 ?auto_28583 ) ) ( not ( = ?auto_28580 ?auto_28584 ) ) ( not ( = ?auto_28580 ?auto_28585 ) ) ( not ( = ?auto_28581 ?auto_28582 ) ) ( not ( = ?auto_28581 ?auto_28583 ) ) ( not ( = ?auto_28581 ?auto_28584 ) ) ( not ( = ?auto_28581 ?auto_28585 ) ) ( not ( = ?auto_28582 ?auto_28583 ) ) ( not ( = ?auto_28582 ?auto_28584 ) ) ( not ( = ?auto_28582 ?auto_28585 ) ) ( not ( = ?auto_28583 ?auto_28584 ) ) ( not ( = ?auto_28583 ?auto_28585 ) ) ( not ( = ?auto_28584 ?auto_28585 ) ) ( CLEAR ?auto_28582 ) ( ON ?auto_28583 ?auto_28584 ) ( CLEAR ?auto_28583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28579 ?auto_28580 ?auto_28581 ?auto_28582 ?auto_28583 )
      ( MAKE-6PILE ?auto_28579 ?auto_28580 ?auto_28581 ?auto_28582 ?auto_28583 ?auto_28584 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28592 - BLOCK
      ?auto_28593 - BLOCK
      ?auto_28594 - BLOCK
      ?auto_28595 - BLOCK
      ?auto_28596 - BLOCK
      ?auto_28597 - BLOCK
    )
    :vars
    (
      ?auto_28598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28597 ?auto_28598 ) ( ON-TABLE ?auto_28592 ) ( ON ?auto_28593 ?auto_28592 ) ( ON ?auto_28594 ?auto_28593 ) ( not ( = ?auto_28592 ?auto_28593 ) ) ( not ( = ?auto_28592 ?auto_28594 ) ) ( not ( = ?auto_28592 ?auto_28595 ) ) ( not ( = ?auto_28592 ?auto_28596 ) ) ( not ( = ?auto_28592 ?auto_28597 ) ) ( not ( = ?auto_28592 ?auto_28598 ) ) ( not ( = ?auto_28593 ?auto_28594 ) ) ( not ( = ?auto_28593 ?auto_28595 ) ) ( not ( = ?auto_28593 ?auto_28596 ) ) ( not ( = ?auto_28593 ?auto_28597 ) ) ( not ( = ?auto_28593 ?auto_28598 ) ) ( not ( = ?auto_28594 ?auto_28595 ) ) ( not ( = ?auto_28594 ?auto_28596 ) ) ( not ( = ?auto_28594 ?auto_28597 ) ) ( not ( = ?auto_28594 ?auto_28598 ) ) ( not ( = ?auto_28595 ?auto_28596 ) ) ( not ( = ?auto_28595 ?auto_28597 ) ) ( not ( = ?auto_28595 ?auto_28598 ) ) ( not ( = ?auto_28596 ?auto_28597 ) ) ( not ( = ?auto_28596 ?auto_28598 ) ) ( not ( = ?auto_28597 ?auto_28598 ) ) ( ON ?auto_28596 ?auto_28597 ) ( CLEAR ?auto_28594 ) ( ON ?auto_28595 ?auto_28596 ) ( CLEAR ?auto_28595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28592 ?auto_28593 ?auto_28594 ?auto_28595 )
      ( MAKE-6PILE ?auto_28592 ?auto_28593 ?auto_28594 ?auto_28595 ?auto_28596 ?auto_28597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28605 - BLOCK
      ?auto_28606 - BLOCK
      ?auto_28607 - BLOCK
      ?auto_28608 - BLOCK
      ?auto_28609 - BLOCK
      ?auto_28610 - BLOCK
    )
    :vars
    (
      ?auto_28611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28610 ?auto_28611 ) ( ON-TABLE ?auto_28605 ) ( ON ?auto_28606 ?auto_28605 ) ( ON ?auto_28607 ?auto_28606 ) ( not ( = ?auto_28605 ?auto_28606 ) ) ( not ( = ?auto_28605 ?auto_28607 ) ) ( not ( = ?auto_28605 ?auto_28608 ) ) ( not ( = ?auto_28605 ?auto_28609 ) ) ( not ( = ?auto_28605 ?auto_28610 ) ) ( not ( = ?auto_28605 ?auto_28611 ) ) ( not ( = ?auto_28606 ?auto_28607 ) ) ( not ( = ?auto_28606 ?auto_28608 ) ) ( not ( = ?auto_28606 ?auto_28609 ) ) ( not ( = ?auto_28606 ?auto_28610 ) ) ( not ( = ?auto_28606 ?auto_28611 ) ) ( not ( = ?auto_28607 ?auto_28608 ) ) ( not ( = ?auto_28607 ?auto_28609 ) ) ( not ( = ?auto_28607 ?auto_28610 ) ) ( not ( = ?auto_28607 ?auto_28611 ) ) ( not ( = ?auto_28608 ?auto_28609 ) ) ( not ( = ?auto_28608 ?auto_28610 ) ) ( not ( = ?auto_28608 ?auto_28611 ) ) ( not ( = ?auto_28609 ?auto_28610 ) ) ( not ( = ?auto_28609 ?auto_28611 ) ) ( not ( = ?auto_28610 ?auto_28611 ) ) ( ON ?auto_28609 ?auto_28610 ) ( CLEAR ?auto_28607 ) ( ON ?auto_28608 ?auto_28609 ) ( CLEAR ?auto_28608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28605 ?auto_28606 ?auto_28607 ?auto_28608 )
      ( MAKE-6PILE ?auto_28605 ?auto_28606 ?auto_28607 ?auto_28608 ?auto_28609 ?auto_28610 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28618 - BLOCK
      ?auto_28619 - BLOCK
      ?auto_28620 - BLOCK
      ?auto_28621 - BLOCK
      ?auto_28622 - BLOCK
      ?auto_28623 - BLOCK
    )
    :vars
    (
      ?auto_28624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28623 ?auto_28624 ) ( ON-TABLE ?auto_28618 ) ( ON ?auto_28619 ?auto_28618 ) ( not ( = ?auto_28618 ?auto_28619 ) ) ( not ( = ?auto_28618 ?auto_28620 ) ) ( not ( = ?auto_28618 ?auto_28621 ) ) ( not ( = ?auto_28618 ?auto_28622 ) ) ( not ( = ?auto_28618 ?auto_28623 ) ) ( not ( = ?auto_28618 ?auto_28624 ) ) ( not ( = ?auto_28619 ?auto_28620 ) ) ( not ( = ?auto_28619 ?auto_28621 ) ) ( not ( = ?auto_28619 ?auto_28622 ) ) ( not ( = ?auto_28619 ?auto_28623 ) ) ( not ( = ?auto_28619 ?auto_28624 ) ) ( not ( = ?auto_28620 ?auto_28621 ) ) ( not ( = ?auto_28620 ?auto_28622 ) ) ( not ( = ?auto_28620 ?auto_28623 ) ) ( not ( = ?auto_28620 ?auto_28624 ) ) ( not ( = ?auto_28621 ?auto_28622 ) ) ( not ( = ?auto_28621 ?auto_28623 ) ) ( not ( = ?auto_28621 ?auto_28624 ) ) ( not ( = ?auto_28622 ?auto_28623 ) ) ( not ( = ?auto_28622 ?auto_28624 ) ) ( not ( = ?auto_28623 ?auto_28624 ) ) ( ON ?auto_28622 ?auto_28623 ) ( ON ?auto_28621 ?auto_28622 ) ( CLEAR ?auto_28619 ) ( ON ?auto_28620 ?auto_28621 ) ( CLEAR ?auto_28620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28618 ?auto_28619 ?auto_28620 )
      ( MAKE-6PILE ?auto_28618 ?auto_28619 ?auto_28620 ?auto_28621 ?auto_28622 ?auto_28623 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28631 - BLOCK
      ?auto_28632 - BLOCK
      ?auto_28633 - BLOCK
      ?auto_28634 - BLOCK
      ?auto_28635 - BLOCK
      ?auto_28636 - BLOCK
    )
    :vars
    (
      ?auto_28637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28636 ?auto_28637 ) ( ON-TABLE ?auto_28631 ) ( ON ?auto_28632 ?auto_28631 ) ( not ( = ?auto_28631 ?auto_28632 ) ) ( not ( = ?auto_28631 ?auto_28633 ) ) ( not ( = ?auto_28631 ?auto_28634 ) ) ( not ( = ?auto_28631 ?auto_28635 ) ) ( not ( = ?auto_28631 ?auto_28636 ) ) ( not ( = ?auto_28631 ?auto_28637 ) ) ( not ( = ?auto_28632 ?auto_28633 ) ) ( not ( = ?auto_28632 ?auto_28634 ) ) ( not ( = ?auto_28632 ?auto_28635 ) ) ( not ( = ?auto_28632 ?auto_28636 ) ) ( not ( = ?auto_28632 ?auto_28637 ) ) ( not ( = ?auto_28633 ?auto_28634 ) ) ( not ( = ?auto_28633 ?auto_28635 ) ) ( not ( = ?auto_28633 ?auto_28636 ) ) ( not ( = ?auto_28633 ?auto_28637 ) ) ( not ( = ?auto_28634 ?auto_28635 ) ) ( not ( = ?auto_28634 ?auto_28636 ) ) ( not ( = ?auto_28634 ?auto_28637 ) ) ( not ( = ?auto_28635 ?auto_28636 ) ) ( not ( = ?auto_28635 ?auto_28637 ) ) ( not ( = ?auto_28636 ?auto_28637 ) ) ( ON ?auto_28635 ?auto_28636 ) ( ON ?auto_28634 ?auto_28635 ) ( CLEAR ?auto_28632 ) ( ON ?auto_28633 ?auto_28634 ) ( CLEAR ?auto_28633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28631 ?auto_28632 ?auto_28633 )
      ( MAKE-6PILE ?auto_28631 ?auto_28632 ?auto_28633 ?auto_28634 ?auto_28635 ?auto_28636 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28644 - BLOCK
      ?auto_28645 - BLOCK
      ?auto_28646 - BLOCK
      ?auto_28647 - BLOCK
      ?auto_28648 - BLOCK
      ?auto_28649 - BLOCK
    )
    :vars
    (
      ?auto_28650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28649 ?auto_28650 ) ( ON-TABLE ?auto_28644 ) ( not ( = ?auto_28644 ?auto_28645 ) ) ( not ( = ?auto_28644 ?auto_28646 ) ) ( not ( = ?auto_28644 ?auto_28647 ) ) ( not ( = ?auto_28644 ?auto_28648 ) ) ( not ( = ?auto_28644 ?auto_28649 ) ) ( not ( = ?auto_28644 ?auto_28650 ) ) ( not ( = ?auto_28645 ?auto_28646 ) ) ( not ( = ?auto_28645 ?auto_28647 ) ) ( not ( = ?auto_28645 ?auto_28648 ) ) ( not ( = ?auto_28645 ?auto_28649 ) ) ( not ( = ?auto_28645 ?auto_28650 ) ) ( not ( = ?auto_28646 ?auto_28647 ) ) ( not ( = ?auto_28646 ?auto_28648 ) ) ( not ( = ?auto_28646 ?auto_28649 ) ) ( not ( = ?auto_28646 ?auto_28650 ) ) ( not ( = ?auto_28647 ?auto_28648 ) ) ( not ( = ?auto_28647 ?auto_28649 ) ) ( not ( = ?auto_28647 ?auto_28650 ) ) ( not ( = ?auto_28648 ?auto_28649 ) ) ( not ( = ?auto_28648 ?auto_28650 ) ) ( not ( = ?auto_28649 ?auto_28650 ) ) ( ON ?auto_28648 ?auto_28649 ) ( ON ?auto_28647 ?auto_28648 ) ( ON ?auto_28646 ?auto_28647 ) ( CLEAR ?auto_28644 ) ( ON ?auto_28645 ?auto_28646 ) ( CLEAR ?auto_28645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28644 ?auto_28645 )
      ( MAKE-6PILE ?auto_28644 ?auto_28645 ?auto_28646 ?auto_28647 ?auto_28648 ?auto_28649 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28657 - BLOCK
      ?auto_28658 - BLOCK
      ?auto_28659 - BLOCK
      ?auto_28660 - BLOCK
      ?auto_28661 - BLOCK
      ?auto_28662 - BLOCK
    )
    :vars
    (
      ?auto_28663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28662 ?auto_28663 ) ( ON-TABLE ?auto_28657 ) ( not ( = ?auto_28657 ?auto_28658 ) ) ( not ( = ?auto_28657 ?auto_28659 ) ) ( not ( = ?auto_28657 ?auto_28660 ) ) ( not ( = ?auto_28657 ?auto_28661 ) ) ( not ( = ?auto_28657 ?auto_28662 ) ) ( not ( = ?auto_28657 ?auto_28663 ) ) ( not ( = ?auto_28658 ?auto_28659 ) ) ( not ( = ?auto_28658 ?auto_28660 ) ) ( not ( = ?auto_28658 ?auto_28661 ) ) ( not ( = ?auto_28658 ?auto_28662 ) ) ( not ( = ?auto_28658 ?auto_28663 ) ) ( not ( = ?auto_28659 ?auto_28660 ) ) ( not ( = ?auto_28659 ?auto_28661 ) ) ( not ( = ?auto_28659 ?auto_28662 ) ) ( not ( = ?auto_28659 ?auto_28663 ) ) ( not ( = ?auto_28660 ?auto_28661 ) ) ( not ( = ?auto_28660 ?auto_28662 ) ) ( not ( = ?auto_28660 ?auto_28663 ) ) ( not ( = ?auto_28661 ?auto_28662 ) ) ( not ( = ?auto_28661 ?auto_28663 ) ) ( not ( = ?auto_28662 ?auto_28663 ) ) ( ON ?auto_28661 ?auto_28662 ) ( ON ?auto_28660 ?auto_28661 ) ( ON ?auto_28659 ?auto_28660 ) ( CLEAR ?auto_28657 ) ( ON ?auto_28658 ?auto_28659 ) ( CLEAR ?auto_28658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28657 ?auto_28658 )
      ( MAKE-6PILE ?auto_28657 ?auto_28658 ?auto_28659 ?auto_28660 ?auto_28661 ?auto_28662 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28670 - BLOCK
      ?auto_28671 - BLOCK
      ?auto_28672 - BLOCK
      ?auto_28673 - BLOCK
      ?auto_28674 - BLOCK
      ?auto_28675 - BLOCK
    )
    :vars
    (
      ?auto_28676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28675 ?auto_28676 ) ( not ( = ?auto_28670 ?auto_28671 ) ) ( not ( = ?auto_28670 ?auto_28672 ) ) ( not ( = ?auto_28670 ?auto_28673 ) ) ( not ( = ?auto_28670 ?auto_28674 ) ) ( not ( = ?auto_28670 ?auto_28675 ) ) ( not ( = ?auto_28670 ?auto_28676 ) ) ( not ( = ?auto_28671 ?auto_28672 ) ) ( not ( = ?auto_28671 ?auto_28673 ) ) ( not ( = ?auto_28671 ?auto_28674 ) ) ( not ( = ?auto_28671 ?auto_28675 ) ) ( not ( = ?auto_28671 ?auto_28676 ) ) ( not ( = ?auto_28672 ?auto_28673 ) ) ( not ( = ?auto_28672 ?auto_28674 ) ) ( not ( = ?auto_28672 ?auto_28675 ) ) ( not ( = ?auto_28672 ?auto_28676 ) ) ( not ( = ?auto_28673 ?auto_28674 ) ) ( not ( = ?auto_28673 ?auto_28675 ) ) ( not ( = ?auto_28673 ?auto_28676 ) ) ( not ( = ?auto_28674 ?auto_28675 ) ) ( not ( = ?auto_28674 ?auto_28676 ) ) ( not ( = ?auto_28675 ?auto_28676 ) ) ( ON ?auto_28674 ?auto_28675 ) ( ON ?auto_28673 ?auto_28674 ) ( ON ?auto_28672 ?auto_28673 ) ( ON ?auto_28671 ?auto_28672 ) ( ON ?auto_28670 ?auto_28671 ) ( CLEAR ?auto_28670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28670 )
      ( MAKE-6PILE ?auto_28670 ?auto_28671 ?auto_28672 ?auto_28673 ?auto_28674 ?auto_28675 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28683 - BLOCK
      ?auto_28684 - BLOCK
      ?auto_28685 - BLOCK
      ?auto_28686 - BLOCK
      ?auto_28687 - BLOCK
      ?auto_28688 - BLOCK
    )
    :vars
    (
      ?auto_28689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28688 ?auto_28689 ) ( not ( = ?auto_28683 ?auto_28684 ) ) ( not ( = ?auto_28683 ?auto_28685 ) ) ( not ( = ?auto_28683 ?auto_28686 ) ) ( not ( = ?auto_28683 ?auto_28687 ) ) ( not ( = ?auto_28683 ?auto_28688 ) ) ( not ( = ?auto_28683 ?auto_28689 ) ) ( not ( = ?auto_28684 ?auto_28685 ) ) ( not ( = ?auto_28684 ?auto_28686 ) ) ( not ( = ?auto_28684 ?auto_28687 ) ) ( not ( = ?auto_28684 ?auto_28688 ) ) ( not ( = ?auto_28684 ?auto_28689 ) ) ( not ( = ?auto_28685 ?auto_28686 ) ) ( not ( = ?auto_28685 ?auto_28687 ) ) ( not ( = ?auto_28685 ?auto_28688 ) ) ( not ( = ?auto_28685 ?auto_28689 ) ) ( not ( = ?auto_28686 ?auto_28687 ) ) ( not ( = ?auto_28686 ?auto_28688 ) ) ( not ( = ?auto_28686 ?auto_28689 ) ) ( not ( = ?auto_28687 ?auto_28688 ) ) ( not ( = ?auto_28687 ?auto_28689 ) ) ( not ( = ?auto_28688 ?auto_28689 ) ) ( ON ?auto_28687 ?auto_28688 ) ( ON ?auto_28686 ?auto_28687 ) ( ON ?auto_28685 ?auto_28686 ) ( ON ?auto_28684 ?auto_28685 ) ( ON ?auto_28683 ?auto_28684 ) ( CLEAR ?auto_28683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28683 )
      ( MAKE-6PILE ?auto_28683 ?auto_28684 ?auto_28685 ?auto_28686 ?auto_28687 ?auto_28688 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28697 - BLOCK
      ?auto_28698 - BLOCK
      ?auto_28699 - BLOCK
      ?auto_28700 - BLOCK
      ?auto_28701 - BLOCK
      ?auto_28702 - BLOCK
      ?auto_28703 - BLOCK
    )
    :vars
    (
      ?auto_28704 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28702 ) ( ON ?auto_28703 ?auto_28704 ) ( CLEAR ?auto_28703 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28697 ) ( ON ?auto_28698 ?auto_28697 ) ( ON ?auto_28699 ?auto_28698 ) ( ON ?auto_28700 ?auto_28699 ) ( ON ?auto_28701 ?auto_28700 ) ( ON ?auto_28702 ?auto_28701 ) ( not ( = ?auto_28697 ?auto_28698 ) ) ( not ( = ?auto_28697 ?auto_28699 ) ) ( not ( = ?auto_28697 ?auto_28700 ) ) ( not ( = ?auto_28697 ?auto_28701 ) ) ( not ( = ?auto_28697 ?auto_28702 ) ) ( not ( = ?auto_28697 ?auto_28703 ) ) ( not ( = ?auto_28697 ?auto_28704 ) ) ( not ( = ?auto_28698 ?auto_28699 ) ) ( not ( = ?auto_28698 ?auto_28700 ) ) ( not ( = ?auto_28698 ?auto_28701 ) ) ( not ( = ?auto_28698 ?auto_28702 ) ) ( not ( = ?auto_28698 ?auto_28703 ) ) ( not ( = ?auto_28698 ?auto_28704 ) ) ( not ( = ?auto_28699 ?auto_28700 ) ) ( not ( = ?auto_28699 ?auto_28701 ) ) ( not ( = ?auto_28699 ?auto_28702 ) ) ( not ( = ?auto_28699 ?auto_28703 ) ) ( not ( = ?auto_28699 ?auto_28704 ) ) ( not ( = ?auto_28700 ?auto_28701 ) ) ( not ( = ?auto_28700 ?auto_28702 ) ) ( not ( = ?auto_28700 ?auto_28703 ) ) ( not ( = ?auto_28700 ?auto_28704 ) ) ( not ( = ?auto_28701 ?auto_28702 ) ) ( not ( = ?auto_28701 ?auto_28703 ) ) ( not ( = ?auto_28701 ?auto_28704 ) ) ( not ( = ?auto_28702 ?auto_28703 ) ) ( not ( = ?auto_28702 ?auto_28704 ) ) ( not ( = ?auto_28703 ?auto_28704 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28703 ?auto_28704 )
      ( !STACK ?auto_28703 ?auto_28702 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28712 - BLOCK
      ?auto_28713 - BLOCK
      ?auto_28714 - BLOCK
      ?auto_28715 - BLOCK
      ?auto_28716 - BLOCK
      ?auto_28717 - BLOCK
      ?auto_28718 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28717 ) ( ON-TABLE ?auto_28718 ) ( CLEAR ?auto_28718 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28712 ) ( ON ?auto_28713 ?auto_28712 ) ( ON ?auto_28714 ?auto_28713 ) ( ON ?auto_28715 ?auto_28714 ) ( ON ?auto_28716 ?auto_28715 ) ( ON ?auto_28717 ?auto_28716 ) ( not ( = ?auto_28712 ?auto_28713 ) ) ( not ( = ?auto_28712 ?auto_28714 ) ) ( not ( = ?auto_28712 ?auto_28715 ) ) ( not ( = ?auto_28712 ?auto_28716 ) ) ( not ( = ?auto_28712 ?auto_28717 ) ) ( not ( = ?auto_28712 ?auto_28718 ) ) ( not ( = ?auto_28713 ?auto_28714 ) ) ( not ( = ?auto_28713 ?auto_28715 ) ) ( not ( = ?auto_28713 ?auto_28716 ) ) ( not ( = ?auto_28713 ?auto_28717 ) ) ( not ( = ?auto_28713 ?auto_28718 ) ) ( not ( = ?auto_28714 ?auto_28715 ) ) ( not ( = ?auto_28714 ?auto_28716 ) ) ( not ( = ?auto_28714 ?auto_28717 ) ) ( not ( = ?auto_28714 ?auto_28718 ) ) ( not ( = ?auto_28715 ?auto_28716 ) ) ( not ( = ?auto_28715 ?auto_28717 ) ) ( not ( = ?auto_28715 ?auto_28718 ) ) ( not ( = ?auto_28716 ?auto_28717 ) ) ( not ( = ?auto_28716 ?auto_28718 ) ) ( not ( = ?auto_28717 ?auto_28718 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_28718 )
      ( !STACK ?auto_28718 ?auto_28717 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28726 - BLOCK
      ?auto_28727 - BLOCK
      ?auto_28728 - BLOCK
      ?auto_28729 - BLOCK
      ?auto_28730 - BLOCK
      ?auto_28731 - BLOCK
      ?auto_28732 - BLOCK
    )
    :vars
    (
      ?auto_28733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28732 ?auto_28733 ) ( ON-TABLE ?auto_28726 ) ( ON ?auto_28727 ?auto_28726 ) ( ON ?auto_28728 ?auto_28727 ) ( ON ?auto_28729 ?auto_28728 ) ( ON ?auto_28730 ?auto_28729 ) ( not ( = ?auto_28726 ?auto_28727 ) ) ( not ( = ?auto_28726 ?auto_28728 ) ) ( not ( = ?auto_28726 ?auto_28729 ) ) ( not ( = ?auto_28726 ?auto_28730 ) ) ( not ( = ?auto_28726 ?auto_28731 ) ) ( not ( = ?auto_28726 ?auto_28732 ) ) ( not ( = ?auto_28726 ?auto_28733 ) ) ( not ( = ?auto_28727 ?auto_28728 ) ) ( not ( = ?auto_28727 ?auto_28729 ) ) ( not ( = ?auto_28727 ?auto_28730 ) ) ( not ( = ?auto_28727 ?auto_28731 ) ) ( not ( = ?auto_28727 ?auto_28732 ) ) ( not ( = ?auto_28727 ?auto_28733 ) ) ( not ( = ?auto_28728 ?auto_28729 ) ) ( not ( = ?auto_28728 ?auto_28730 ) ) ( not ( = ?auto_28728 ?auto_28731 ) ) ( not ( = ?auto_28728 ?auto_28732 ) ) ( not ( = ?auto_28728 ?auto_28733 ) ) ( not ( = ?auto_28729 ?auto_28730 ) ) ( not ( = ?auto_28729 ?auto_28731 ) ) ( not ( = ?auto_28729 ?auto_28732 ) ) ( not ( = ?auto_28729 ?auto_28733 ) ) ( not ( = ?auto_28730 ?auto_28731 ) ) ( not ( = ?auto_28730 ?auto_28732 ) ) ( not ( = ?auto_28730 ?auto_28733 ) ) ( not ( = ?auto_28731 ?auto_28732 ) ) ( not ( = ?auto_28731 ?auto_28733 ) ) ( not ( = ?auto_28732 ?auto_28733 ) ) ( CLEAR ?auto_28730 ) ( ON ?auto_28731 ?auto_28732 ) ( CLEAR ?auto_28731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_28726 ?auto_28727 ?auto_28728 ?auto_28729 ?auto_28730 ?auto_28731 )
      ( MAKE-7PILE ?auto_28726 ?auto_28727 ?auto_28728 ?auto_28729 ?auto_28730 ?auto_28731 ?auto_28732 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28741 - BLOCK
      ?auto_28742 - BLOCK
      ?auto_28743 - BLOCK
      ?auto_28744 - BLOCK
      ?auto_28745 - BLOCK
      ?auto_28746 - BLOCK
      ?auto_28747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28747 ) ( ON-TABLE ?auto_28741 ) ( ON ?auto_28742 ?auto_28741 ) ( ON ?auto_28743 ?auto_28742 ) ( ON ?auto_28744 ?auto_28743 ) ( ON ?auto_28745 ?auto_28744 ) ( not ( = ?auto_28741 ?auto_28742 ) ) ( not ( = ?auto_28741 ?auto_28743 ) ) ( not ( = ?auto_28741 ?auto_28744 ) ) ( not ( = ?auto_28741 ?auto_28745 ) ) ( not ( = ?auto_28741 ?auto_28746 ) ) ( not ( = ?auto_28741 ?auto_28747 ) ) ( not ( = ?auto_28742 ?auto_28743 ) ) ( not ( = ?auto_28742 ?auto_28744 ) ) ( not ( = ?auto_28742 ?auto_28745 ) ) ( not ( = ?auto_28742 ?auto_28746 ) ) ( not ( = ?auto_28742 ?auto_28747 ) ) ( not ( = ?auto_28743 ?auto_28744 ) ) ( not ( = ?auto_28743 ?auto_28745 ) ) ( not ( = ?auto_28743 ?auto_28746 ) ) ( not ( = ?auto_28743 ?auto_28747 ) ) ( not ( = ?auto_28744 ?auto_28745 ) ) ( not ( = ?auto_28744 ?auto_28746 ) ) ( not ( = ?auto_28744 ?auto_28747 ) ) ( not ( = ?auto_28745 ?auto_28746 ) ) ( not ( = ?auto_28745 ?auto_28747 ) ) ( not ( = ?auto_28746 ?auto_28747 ) ) ( CLEAR ?auto_28745 ) ( ON ?auto_28746 ?auto_28747 ) ( CLEAR ?auto_28746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_28741 ?auto_28742 ?auto_28743 ?auto_28744 ?auto_28745 ?auto_28746 )
      ( MAKE-7PILE ?auto_28741 ?auto_28742 ?auto_28743 ?auto_28744 ?auto_28745 ?auto_28746 ?auto_28747 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28755 - BLOCK
      ?auto_28756 - BLOCK
      ?auto_28757 - BLOCK
      ?auto_28758 - BLOCK
      ?auto_28759 - BLOCK
      ?auto_28760 - BLOCK
      ?auto_28761 - BLOCK
    )
    :vars
    (
      ?auto_28762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28761 ?auto_28762 ) ( ON-TABLE ?auto_28755 ) ( ON ?auto_28756 ?auto_28755 ) ( ON ?auto_28757 ?auto_28756 ) ( ON ?auto_28758 ?auto_28757 ) ( not ( = ?auto_28755 ?auto_28756 ) ) ( not ( = ?auto_28755 ?auto_28757 ) ) ( not ( = ?auto_28755 ?auto_28758 ) ) ( not ( = ?auto_28755 ?auto_28759 ) ) ( not ( = ?auto_28755 ?auto_28760 ) ) ( not ( = ?auto_28755 ?auto_28761 ) ) ( not ( = ?auto_28755 ?auto_28762 ) ) ( not ( = ?auto_28756 ?auto_28757 ) ) ( not ( = ?auto_28756 ?auto_28758 ) ) ( not ( = ?auto_28756 ?auto_28759 ) ) ( not ( = ?auto_28756 ?auto_28760 ) ) ( not ( = ?auto_28756 ?auto_28761 ) ) ( not ( = ?auto_28756 ?auto_28762 ) ) ( not ( = ?auto_28757 ?auto_28758 ) ) ( not ( = ?auto_28757 ?auto_28759 ) ) ( not ( = ?auto_28757 ?auto_28760 ) ) ( not ( = ?auto_28757 ?auto_28761 ) ) ( not ( = ?auto_28757 ?auto_28762 ) ) ( not ( = ?auto_28758 ?auto_28759 ) ) ( not ( = ?auto_28758 ?auto_28760 ) ) ( not ( = ?auto_28758 ?auto_28761 ) ) ( not ( = ?auto_28758 ?auto_28762 ) ) ( not ( = ?auto_28759 ?auto_28760 ) ) ( not ( = ?auto_28759 ?auto_28761 ) ) ( not ( = ?auto_28759 ?auto_28762 ) ) ( not ( = ?auto_28760 ?auto_28761 ) ) ( not ( = ?auto_28760 ?auto_28762 ) ) ( not ( = ?auto_28761 ?auto_28762 ) ) ( ON ?auto_28760 ?auto_28761 ) ( CLEAR ?auto_28758 ) ( ON ?auto_28759 ?auto_28760 ) ( CLEAR ?auto_28759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28755 ?auto_28756 ?auto_28757 ?auto_28758 ?auto_28759 )
      ( MAKE-7PILE ?auto_28755 ?auto_28756 ?auto_28757 ?auto_28758 ?auto_28759 ?auto_28760 ?auto_28761 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28770 - BLOCK
      ?auto_28771 - BLOCK
      ?auto_28772 - BLOCK
      ?auto_28773 - BLOCK
      ?auto_28774 - BLOCK
      ?auto_28775 - BLOCK
      ?auto_28776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28776 ) ( ON-TABLE ?auto_28770 ) ( ON ?auto_28771 ?auto_28770 ) ( ON ?auto_28772 ?auto_28771 ) ( ON ?auto_28773 ?auto_28772 ) ( not ( = ?auto_28770 ?auto_28771 ) ) ( not ( = ?auto_28770 ?auto_28772 ) ) ( not ( = ?auto_28770 ?auto_28773 ) ) ( not ( = ?auto_28770 ?auto_28774 ) ) ( not ( = ?auto_28770 ?auto_28775 ) ) ( not ( = ?auto_28770 ?auto_28776 ) ) ( not ( = ?auto_28771 ?auto_28772 ) ) ( not ( = ?auto_28771 ?auto_28773 ) ) ( not ( = ?auto_28771 ?auto_28774 ) ) ( not ( = ?auto_28771 ?auto_28775 ) ) ( not ( = ?auto_28771 ?auto_28776 ) ) ( not ( = ?auto_28772 ?auto_28773 ) ) ( not ( = ?auto_28772 ?auto_28774 ) ) ( not ( = ?auto_28772 ?auto_28775 ) ) ( not ( = ?auto_28772 ?auto_28776 ) ) ( not ( = ?auto_28773 ?auto_28774 ) ) ( not ( = ?auto_28773 ?auto_28775 ) ) ( not ( = ?auto_28773 ?auto_28776 ) ) ( not ( = ?auto_28774 ?auto_28775 ) ) ( not ( = ?auto_28774 ?auto_28776 ) ) ( not ( = ?auto_28775 ?auto_28776 ) ) ( ON ?auto_28775 ?auto_28776 ) ( CLEAR ?auto_28773 ) ( ON ?auto_28774 ?auto_28775 ) ( CLEAR ?auto_28774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28770 ?auto_28771 ?auto_28772 ?auto_28773 ?auto_28774 )
      ( MAKE-7PILE ?auto_28770 ?auto_28771 ?auto_28772 ?auto_28773 ?auto_28774 ?auto_28775 ?auto_28776 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28784 - BLOCK
      ?auto_28785 - BLOCK
      ?auto_28786 - BLOCK
      ?auto_28787 - BLOCK
      ?auto_28788 - BLOCK
      ?auto_28789 - BLOCK
      ?auto_28790 - BLOCK
    )
    :vars
    (
      ?auto_28791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28790 ?auto_28791 ) ( ON-TABLE ?auto_28784 ) ( ON ?auto_28785 ?auto_28784 ) ( ON ?auto_28786 ?auto_28785 ) ( not ( = ?auto_28784 ?auto_28785 ) ) ( not ( = ?auto_28784 ?auto_28786 ) ) ( not ( = ?auto_28784 ?auto_28787 ) ) ( not ( = ?auto_28784 ?auto_28788 ) ) ( not ( = ?auto_28784 ?auto_28789 ) ) ( not ( = ?auto_28784 ?auto_28790 ) ) ( not ( = ?auto_28784 ?auto_28791 ) ) ( not ( = ?auto_28785 ?auto_28786 ) ) ( not ( = ?auto_28785 ?auto_28787 ) ) ( not ( = ?auto_28785 ?auto_28788 ) ) ( not ( = ?auto_28785 ?auto_28789 ) ) ( not ( = ?auto_28785 ?auto_28790 ) ) ( not ( = ?auto_28785 ?auto_28791 ) ) ( not ( = ?auto_28786 ?auto_28787 ) ) ( not ( = ?auto_28786 ?auto_28788 ) ) ( not ( = ?auto_28786 ?auto_28789 ) ) ( not ( = ?auto_28786 ?auto_28790 ) ) ( not ( = ?auto_28786 ?auto_28791 ) ) ( not ( = ?auto_28787 ?auto_28788 ) ) ( not ( = ?auto_28787 ?auto_28789 ) ) ( not ( = ?auto_28787 ?auto_28790 ) ) ( not ( = ?auto_28787 ?auto_28791 ) ) ( not ( = ?auto_28788 ?auto_28789 ) ) ( not ( = ?auto_28788 ?auto_28790 ) ) ( not ( = ?auto_28788 ?auto_28791 ) ) ( not ( = ?auto_28789 ?auto_28790 ) ) ( not ( = ?auto_28789 ?auto_28791 ) ) ( not ( = ?auto_28790 ?auto_28791 ) ) ( ON ?auto_28789 ?auto_28790 ) ( ON ?auto_28788 ?auto_28789 ) ( CLEAR ?auto_28786 ) ( ON ?auto_28787 ?auto_28788 ) ( CLEAR ?auto_28787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28784 ?auto_28785 ?auto_28786 ?auto_28787 )
      ( MAKE-7PILE ?auto_28784 ?auto_28785 ?auto_28786 ?auto_28787 ?auto_28788 ?auto_28789 ?auto_28790 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28799 - BLOCK
      ?auto_28800 - BLOCK
      ?auto_28801 - BLOCK
      ?auto_28802 - BLOCK
      ?auto_28803 - BLOCK
      ?auto_28804 - BLOCK
      ?auto_28805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28805 ) ( ON-TABLE ?auto_28799 ) ( ON ?auto_28800 ?auto_28799 ) ( ON ?auto_28801 ?auto_28800 ) ( not ( = ?auto_28799 ?auto_28800 ) ) ( not ( = ?auto_28799 ?auto_28801 ) ) ( not ( = ?auto_28799 ?auto_28802 ) ) ( not ( = ?auto_28799 ?auto_28803 ) ) ( not ( = ?auto_28799 ?auto_28804 ) ) ( not ( = ?auto_28799 ?auto_28805 ) ) ( not ( = ?auto_28800 ?auto_28801 ) ) ( not ( = ?auto_28800 ?auto_28802 ) ) ( not ( = ?auto_28800 ?auto_28803 ) ) ( not ( = ?auto_28800 ?auto_28804 ) ) ( not ( = ?auto_28800 ?auto_28805 ) ) ( not ( = ?auto_28801 ?auto_28802 ) ) ( not ( = ?auto_28801 ?auto_28803 ) ) ( not ( = ?auto_28801 ?auto_28804 ) ) ( not ( = ?auto_28801 ?auto_28805 ) ) ( not ( = ?auto_28802 ?auto_28803 ) ) ( not ( = ?auto_28802 ?auto_28804 ) ) ( not ( = ?auto_28802 ?auto_28805 ) ) ( not ( = ?auto_28803 ?auto_28804 ) ) ( not ( = ?auto_28803 ?auto_28805 ) ) ( not ( = ?auto_28804 ?auto_28805 ) ) ( ON ?auto_28804 ?auto_28805 ) ( ON ?auto_28803 ?auto_28804 ) ( CLEAR ?auto_28801 ) ( ON ?auto_28802 ?auto_28803 ) ( CLEAR ?auto_28802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28799 ?auto_28800 ?auto_28801 ?auto_28802 )
      ( MAKE-7PILE ?auto_28799 ?auto_28800 ?auto_28801 ?auto_28802 ?auto_28803 ?auto_28804 ?auto_28805 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28813 - BLOCK
      ?auto_28814 - BLOCK
      ?auto_28815 - BLOCK
      ?auto_28816 - BLOCK
      ?auto_28817 - BLOCK
      ?auto_28818 - BLOCK
      ?auto_28819 - BLOCK
    )
    :vars
    (
      ?auto_28820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28819 ?auto_28820 ) ( ON-TABLE ?auto_28813 ) ( ON ?auto_28814 ?auto_28813 ) ( not ( = ?auto_28813 ?auto_28814 ) ) ( not ( = ?auto_28813 ?auto_28815 ) ) ( not ( = ?auto_28813 ?auto_28816 ) ) ( not ( = ?auto_28813 ?auto_28817 ) ) ( not ( = ?auto_28813 ?auto_28818 ) ) ( not ( = ?auto_28813 ?auto_28819 ) ) ( not ( = ?auto_28813 ?auto_28820 ) ) ( not ( = ?auto_28814 ?auto_28815 ) ) ( not ( = ?auto_28814 ?auto_28816 ) ) ( not ( = ?auto_28814 ?auto_28817 ) ) ( not ( = ?auto_28814 ?auto_28818 ) ) ( not ( = ?auto_28814 ?auto_28819 ) ) ( not ( = ?auto_28814 ?auto_28820 ) ) ( not ( = ?auto_28815 ?auto_28816 ) ) ( not ( = ?auto_28815 ?auto_28817 ) ) ( not ( = ?auto_28815 ?auto_28818 ) ) ( not ( = ?auto_28815 ?auto_28819 ) ) ( not ( = ?auto_28815 ?auto_28820 ) ) ( not ( = ?auto_28816 ?auto_28817 ) ) ( not ( = ?auto_28816 ?auto_28818 ) ) ( not ( = ?auto_28816 ?auto_28819 ) ) ( not ( = ?auto_28816 ?auto_28820 ) ) ( not ( = ?auto_28817 ?auto_28818 ) ) ( not ( = ?auto_28817 ?auto_28819 ) ) ( not ( = ?auto_28817 ?auto_28820 ) ) ( not ( = ?auto_28818 ?auto_28819 ) ) ( not ( = ?auto_28818 ?auto_28820 ) ) ( not ( = ?auto_28819 ?auto_28820 ) ) ( ON ?auto_28818 ?auto_28819 ) ( ON ?auto_28817 ?auto_28818 ) ( ON ?auto_28816 ?auto_28817 ) ( CLEAR ?auto_28814 ) ( ON ?auto_28815 ?auto_28816 ) ( CLEAR ?auto_28815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28813 ?auto_28814 ?auto_28815 )
      ( MAKE-7PILE ?auto_28813 ?auto_28814 ?auto_28815 ?auto_28816 ?auto_28817 ?auto_28818 ?auto_28819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28828 - BLOCK
      ?auto_28829 - BLOCK
      ?auto_28830 - BLOCK
      ?auto_28831 - BLOCK
      ?auto_28832 - BLOCK
      ?auto_28833 - BLOCK
      ?auto_28834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28834 ) ( ON-TABLE ?auto_28828 ) ( ON ?auto_28829 ?auto_28828 ) ( not ( = ?auto_28828 ?auto_28829 ) ) ( not ( = ?auto_28828 ?auto_28830 ) ) ( not ( = ?auto_28828 ?auto_28831 ) ) ( not ( = ?auto_28828 ?auto_28832 ) ) ( not ( = ?auto_28828 ?auto_28833 ) ) ( not ( = ?auto_28828 ?auto_28834 ) ) ( not ( = ?auto_28829 ?auto_28830 ) ) ( not ( = ?auto_28829 ?auto_28831 ) ) ( not ( = ?auto_28829 ?auto_28832 ) ) ( not ( = ?auto_28829 ?auto_28833 ) ) ( not ( = ?auto_28829 ?auto_28834 ) ) ( not ( = ?auto_28830 ?auto_28831 ) ) ( not ( = ?auto_28830 ?auto_28832 ) ) ( not ( = ?auto_28830 ?auto_28833 ) ) ( not ( = ?auto_28830 ?auto_28834 ) ) ( not ( = ?auto_28831 ?auto_28832 ) ) ( not ( = ?auto_28831 ?auto_28833 ) ) ( not ( = ?auto_28831 ?auto_28834 ) ) ( not ( = ?auto_28832 ?auto_28833 ) ) ( not ( = ?auto_28832 ?auto_28834 ) ) ( not ( = ?auto_28833 ?auto_28834 ) ) ( ON ?auto_28833 ?auto_28834 ) ( ON ?auto_28832 ?auto_28833 ) ( ON ?auto_28831 ?auto_28832 ) ( CLEAR ?auto_28829 ) ( ON ?auto_28830 ?auto_28831 ) ( CLEAR ?auto_28830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28828 ?auto_28829 ?auto_28830 )
      ( MAKE-7PILE ?auto_28828 ?auto_28829 ?auto_28830 ?auto_28831 ?auto_28832 ?auto_28833 ?auto_28834 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28842 - BLOCK
      ?auto_28843 - BLOCK
      ?auto_28844 - BLOCK
      ?auto_28845 - BLOCK
      ?auto_28846 - BLOCK
      ?auto_28847 - BLOCK
      ?auto_28848 - BLOCK
    )
    :vars
    (
      ?auto_28849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28848 ?auto_28849 ) ( ON-TABLE ?auto_28842 ) ( not ( = ?auto_28842 ?auto_28843 ) ) ( not ( = ?auto_28842 ?auto_28844 ) ) ( not ( = ?auto_28842 ?auto_28845 ) ) ( not ( = ?auto_28842 ?auto_28846 ) ) ( not ( = ?auto_28842 ?auto_28847 ) ) ( not ( = ?auto_28842 ?auto_28848 ) ) ( not ( = ?auto_28842 ?auto_28849 ) ) ( not ( = ?auto_28843 ?auto_28844 ) ) ( not ( = ?auto_28843 ?auto_28845 ) ) ( not ( = ?auto_28843 ?auto_28846 ) ) ( not ( = ?auto_28843 ?auto_28847 ) ) ( not ( = ?auto_28843 ?auto_28848 ) ) ( not ( = ?auto_28843 ?auto_28849 ) ) ( not ( = ?auto_28844 ?auto_28845 ) ) ( not ( = ?auto_28844 ?auto_28846 ) ) ( not ( = ?auto_28844 ?auto_28847 ) ) ( not ( = ?auto_28844 ?auto_28848 ) ) ( not ( = ?auto_28844 ?auto_28849 ) ) ( not ( = ?auto_28845 ?auto_28846 ) ) ( not ( = ?auto_28845 ?auto_28847 ) ) ( not ( = ?auto_28845 ?auto_28848 ) ) ( not ( = ?auto_28845 ?auto_28849 ) ) ( not ( = ?auto_28846 ?auto_28847 ) ) ( not ( = ?auto_28846 ?auto_28848 ) ) ( not ( = ?auto_28846 ?auto_28849 ) ) ( not ( = ?auto_28847 ?auto_28848 ) ) ( not ( = ?auto_28847 ?auto_28849 ) ) ( not ( = ?auto_28848 ?auto_28849 ) ) ( ON ?auto_28847 ?auto_28848 ) ( ON ?auto_28846 ?auto_28847 ) ( ON ?auto_28845 ?auto_28846 ) ( ON ?auto_28844 ?auto_28845 ) ( CLEAR ?auto_28842 ) ( ON ?auto_28843 ?auto_28844 ) ( CLEAR ?auto_28843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28842 ?auto_28843 )
      ( MAKE-7PILE ?auto_28842 ?auto_28843 ?auto_28844 ?auto_28845 ?auto_28846 ?auto_28847 ?auto_28848 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28857 - BLOCK
      ?auto_28858 - BLOCK
      ?auto_28859 - BLOCK
      ?auto_28860 - BLOCK
      ?auto_28861 - BLOCK
      ?auto_28862 - BLOCK
      ?auto_28863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28863 ) ( ON-TABLE ?auto_28857 ) ( not ( = ?auto_28857 ?auto_28858 ) ) ( not ( = ?auto_28857 ?auto_28859 ) ) ( not ( = ?auto_28857 ?auto_28860 ) ) ( not ( = ?auto_28857 ?auto_28861 ) ) ( not ( = ?auto_28857 ?auto_28862 ) ) ( not ( = ?auto_28857 ?auto_28863 ) ) ( not ( = ?auto_28858 ?auto_28859 ) ) ( not ( = ?auto_28858 ?auto_28860 ) ) ( not ( = ?auto_28858 ?auto_28861 ) ) ( not ( = ?auto_28858 ?auto_28862 ) ) ( not ( = ?auto_28858 ?auto_28863 ) ) ( not ( = ?auto_28859 ?auto_28860 ) ) ( not ( = ?auto_28859 ?auto_28861 ) ) ( not ( = ?auto_28859 ?auto_28862 ) ) ( not ( = ?auto_28859 ?auto_28863 ) ) ( not ( = ?auto_28860 ?auto_28861 ) ) ( not ( = ?auto_28860 ?auto_28862 ) ) ( not ( = ?auto_28860 ?auto_28863 ) ) ( not ( = ?auto_28861 ?auto_28862 ) ) ( not ( = ?auto_28861 ?auto_28863 ) ) ( not ( = ?auto_28862 ?auto_28863 ) ) ( ON ?auto_28862 ?auto_28863 ) ( ON ?auto_28861 ?auto_28862 ) ( ON ?auto_28860 ?auto_28861 ) ( ON ?auto_28859 ?auto_28860 ) ( CLEAR ?auto_28857 ) ( ON ?auto_28858 ?auto_28859 ) ( CLEAR ?auto_28858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28857 ?auto_28858 )
      ( MAKE-7PILE ?auto_28857 ?auto_28858 ?auto_28859 ?auto_28860 ?auto_28861 ?auto_28862 ?auto_28863 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28871 - BLOCK
      ?auto_28872 - BLOCK
      ?auto_28873 - BLOCK
      ?auto_28874 - BLOCK
      ?auto_28875 - BLOCK
      ?auto_28876 - BLOCK
      ?auto_28877 - BLOCK
    )
    :vars
    (
      ?auto_28878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28877 ?auto_28878 ) ( not ( = ?auto_28871 ?auto_28872 ) ) ( not ( = ?auto_28871 ?auto_28873 ) ) ( not ( = ?auto_28871 ?auto_28874 ) ) ( not ( = ?auto_28871 ?auto_28875 ) ) ( not ( = ?auto_28871 ?auto_28876 ) ) ( not ( = ?auto_28871 ?auto_28877 ) ) ( not ( = ?auto_28871 ?auto_28878 ) ) ( not ( = ?auto_28872 ?auto_28873 ) ) ( not ( = ?auto_28872 ?auto_28874 ) ) ( not ( = ?auto_28872 ?auto_28875 ) ) ( not ( = ?auto_28872 ?auto_28876 ) ) ( not ( = ?auto_28872 ?auto_28877 ) ) ( not ( = ?auto_28872 ?auto_28878 ) ) ( not ( = ?auto_28873 ?auto_28874 ) ) ( not ( = ?auto_28873 ?auto_28875 ) ) ( not ( = ?auto_28873 ?auto_28876 ) ) ( not ( = ?auto_28873 ?auto_28877 ) ) ( not ( = ?auto_28873 ?auto_28878 ) ) ( not ( = ?auto_28874 ?auto_28875 ) ) ( not ( = ?auto_28874 ?auto_28876 ) ) ( not ( = ?auto_28874 ?auto_28877 ) ) ( not ( = ?auto_28874 ?auto_28878 ) ) ( not ( = ?auto_28875 ?auto_28876 ) ) ( not ( = ?auto_28875 ?auto_28877 ) ) ( not ( = ?auto_28875 ?auto_28878 ) ) ( not ( = ?auto_28876 ?auto_28877 ) ) ( not ( = ?auto_28876 ?auto_28878 ) ) ( not ( = ?auto_28877 ?auto_28878 ) ) ( ON ?auto_28876 ?auto_28877 ) ( ON ?auto_28875 ?auto_28876 ) ( ON ?auto_28874 ?auto_28875 ) ( ON ?auto_28873 ?auto_28874 ) ( ON ?auto_28872 ?auto_28873 ) ( ON ?auto_28871 ?auto_28872 ) ( CLEAR ?auto_28871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28871 )
      ( MAKE-7PILE ?auto_28871 ?auto_28872 ?auto_28873 ?auto_28874 ?auto_28875 ?auto_28876 ?auto_28877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28886 - BLOCK
      ?auto_28887 - BLOCK
      ?auto_28888 - BLOCK
      ?auto_28889 - BLOCK
      ?auto_28890 - BLOCK
      ?auto_28891 - BLOCK
      ?auto_28892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28892 ) ( not ( = ?auto_28886 ?auto_28887 ) ) ( not ( = ?auto_28886 ?auto_28888 ) ) ( not ( = ?auto_28886 ?auto_28889 ) ) ( not ( = ?auto_28886 ?auto_28890 ) ) ( not ( = ?auto_28886 ?auto_28891 ) ) ( not ( = ?auto_28886 ?auto_28892 ) ) ( not ( = ?auto_28887 ?auto_28888 ) ) ( not ( = ?auto_28887 ?auto_28889 ) ) ( not ( = ?auto_28887 ?auto_28890 ) ) ( not ( = ?auto_28887 ?auto_28891 ) ) ( not ( = ?auto_28887 ?auto_28892 ) ) ( not ( = ?auto_28888 ?auto_28889 ) ) ( not ( = ?auto_28888 ?auto_28890 ) ) ( not ( = ?auto_28888 ?auto_28891 ) ) ( not ( = ?auto_28888 ?auto_28892 ) ) ( not ( = ?auto_28889 ?auto_28890 ) ) ( not ( = ?auto_28889 ?auto_28891 ) ) ( not ( = ?auto_28889 ?auto_28892 ) ) ( not ( = ?auto_28890 ?auto_28891 ) ) ( not ( = ?auto_28890 ?auto_28892 ) ) ( not ( = ?auto_28891 ?auto_28892 ) ) ( ON ?auto_28891 ?auto_28892 ) ( ON ?auto_28890 ?auto_28891 ) ( ON ?auto_28889 ?auto_28890 ) ( ON ?auto_28888 ?auto_28889 ) ( ON ?auto_28887 ?auto_28888 ) ( ON ?auto_28886 ?auto_28887 ) ( CLEAR ?auto_28886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28886 )
      ( MAKE-7PILE ?auto_28886 ?auto_28887 ?auto_28888 ?auto_28889 ?auto_28890 ?auto_28891 ?auto_28892 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28900 - BLOCK
      ?auto_28901 - BLOCK
      ?auto_28902 - BLOCK
      ?auto_28903 - BLOCK
      ?auto_28904 - BLOCK
      ?auto_28905 - BLOCK
      ?auto_28906 - BLOCK
    )
    :vars
    (
      ?auto_28907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28900 ?auto_28901 ) ) ( not ( = ?auto_28900 ?auto_28902 ) ) ( not ( = ?auto_28900 ?auto_28903 ) ) ( not ( = ?auto_28900 ?auto_28904 ) ) ( not ( = ?auto_28900 ?auto_28905 ) ) ( not ( = ?auto_28900 ?auto_28906 ) ) ( not ( = ?auto_28901 ?auto_28902 ) ) ( not ( = ?auto_28901 ?auto_28903 ) ) ( not ( = ?auto_28901 ?auto_28904 ) ) ( not ( = ?auto_28901 ?auto_28905 ) ) ( not ( = ?auto_28901 ?auto_28906 ) ) ( not ( = ?auto_28902 ?auto_28903 ) ) ( not ( = ?auto_28902 ?auto_28904 ) ) ( not ( = ?auto_28902 ?auto_28905 ) ) ( not ( = ?auto_28902 ?auto_28906 ) ) ( not ( = ?auto_28903 ?auto_28904 ) ) ( not ( = ?auto_28903 ?auto_28905 ) ) ( not ( = ?auto_28903 ?auto_28906 ) ) ( not ( = ?auto_28904 ?auto_28905 ) ) ( not ( = ?auto_28904 ?auto_28906 ) ) ( not ( = ?auto_28905 ?auto_28906 ) ) ( ON ?auto_28900 ?auto_28907 ) ( not ( = ?auto_28906 ?auto_28907 ) ) ( not ( = ?auto_28905 ?auto_28907 ) ) ( not ( = ?auto_28904 ?auto_28907 ) ) ( not ( = ?auto_28903 ?auto_28907 ) ) ( not ( = ?auto_28902 ?auto_28907 ) ) ( not ( = ?auto_28901 ?auto_28907 ) ) ( not ( = ?auto_28900 ?auto_28907 ) ) ( ON ?auto_28901 ?auto_28900 ) ( ON ?auto_28902 ?auto_28901 ) ( ON ?auto_28903 ?auto_28902 ) ( ON ?auto_28904 ?auto_28903 ) ( ON ?auto_28905 ?auto_28904 ) ( ON ?auto_28906 ?auto_28905 ) ( CLEAR ?auto_28906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_28906 ?auto_28905 ?auto_28904 ?auto_28903 ?auto_28902 ?auto_28901 ?auto_28900 )
      ( MAKE-7PILE ?auto_28900 ?auto_28901 ?auto_28902 ?auto_28903 ?auto_28904 ?auto_28905 ?auto_28906 ) )
  )

)

