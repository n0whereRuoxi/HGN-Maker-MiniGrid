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
      ?auto_226313 - BLOCK
    )
    :vars
    (
      ?auto_226314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226313 ?auto_226314 ) ( CLEAR ?auto_226313 ) ( HAND-EMPTY ) ( not ( = ?auto_226313 ?auto_226314 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226313 ?auto_226314 )
      ( !PUTDOWN ?auto_226313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_226316 - BLOCK
    )
    :vars
    (
      ?auto_226317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226316 ?auto_226317 ) ( CLEAR ?auto_226316 ) ( HAND-EMPTY ) ( not ( = ?auto_226316 ?auto_226317 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226316 ?auto_226317 )
      ( !PUTDOWN ?auto_226316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_226320 - BLOCK
      ?auto_226321 - BLOCK
    )
    :vars
    (
      ?auto_226322 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226320 ) ( ON ?auto_226321 ?auto_226322 ) ( CLEAR ?auto_226321 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226320 ) ( not ( = ?auto_226320 ?auto_226321 ) ) ( not ( = ?auto_226320 ?auto_226322 ) ) ( not ( = ?auto_226321 ?auto_226322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226321 ?auto_226322 )
      ( !STACK ?auto_226321 ?auto_226320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_226325 - BLOCK
      ?auto_226326 - BLOCK
    )
    :vars
    (
      ?auto_226327 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226325 ) ( ON ?auto_226326 ?auto_226327 ) ( CLEAR ?auto_226326 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226325 ) ( not ( = ?auto_226325 ?auto_226326 ) ) ( not ( = ?auto_226325 ?auto_226327 ) ) ( not ( = ?auto_226326 ?auto_226327 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226326 ?auto_226327 )
      ( !STACK ?auto_226326 ?auto_226325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_226330 - BLOCK
      ?auto_226331 - BLOCK
    )
    :vars
    (
      ?auto_226332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226331 ?auto_226332 ) ( not ( = ?auto_226330 ?auto_226331 ) ) ( not ( = ?auto_226330 ?auto_226332 ) ) ( not ( = ?auto_226331 ?auto_226332 ) ) ( ON ?auto_226330 ?auto_226331 ) ( CLEAR ?auto_226330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226330 )
      ( MAKE-2PILE ?auto_226330 ?auto_226331 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_226335 - BLOCK
      ?auto_226336 - BLOCK
    )
    :vars
    (
      ?auto_226337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226336 ?auto_226337 ) ( not ( = ?auto_226335 ?auto_226336 ) ) ( not ( = ?auto_226335 ?auto_226337 ) ) ( not ( = ?auto_226336 ?auto_226337 ) ) ( ON ?auto_226335 ?auto_226336 ) ( CLEAR ?auto_226335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226335 )
      ( MAKE-2PILE ?auto_226335 ?auto_226336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_226341 - BLOCK
      ?auto_226342 - BLOCK
      ?auto_226343 - BLOCK
    )
    :vars
    (
      ?auto_226344 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226342 ) ( ON ?auto_226343 ?auto_226344 ) ( CLEAR ?auto_226343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226341 ) ( ON ?auto_226342 ?auto_226341 ) ( not ( = ?auto_226341 ?auto_226342 ) ) ( not ( = ?auto_226341 ?auto_226343 ) ) ( not ( = ?auto_226341 ?auto_226344 ) ) ( not ( = ?auto_226342 ?auto_226343 ) ) ( not ( = ?auto_226342 ?auto_226344 ) ) ( not ( = ?auto_226343 ?auto_226344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226343 ?auto_226344 )
      ( !STACK ?auto_226343 ?auto_226342 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_226348 - BLOCK
      ?auto_226349 - BLOCK
      ?auto_226350 - BLOCK
    )
    :vars
    (
      ?auto_226351 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226349 ) ( ON ?auto_226350 ?auto_226351 ) ( CLEAR ?auto_226350 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226348 ) ( ON ?auto_226349 ?auto_226348 ) ( not ( = ?auto_226348 ?auto_226349 ) ) ( not ( = ?auto_226348 ?auto_226350 ) ) ( not ( = ?auto_226348 ?auto_226351 ) ) ( not ( = ?auto_226349 ?auto_226350 ) ) ( not ( = ?auto_226349 ?auto_226351 ) ) ( not ( = ?auto_226350 ?auto_226351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226350 ?auto_226351 )
      ( !STACK ?auto_226350 ?auto_226349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_226355 - BLOCK
      ?auto_226356 - BLOCK
      ?auto_226357 - BLOCK
    )
    :vars
    (
      ?auto_226358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226357 ?auto_226358 ) ( ON-TABLE ?auto_226355 ) ( not ( = ?auto_226355 ?auto_226356 ) ) ( not ( = ?auto_226355 ?auto_226357 ) ) ( not ( = ?auto_226355 ?auto_226358 ) ) ( not ( = ?auto_226356 ?auto_226357 ) ) ( not ( = ?auto_226356 ?auto_226358 ) ) ( not ( = ?auto_226357 ?auto_226358 ) ) ( CLEAR ?auto_226355 ) ( ON ?auto_226356 ?auto_226357 ) ( CLEAR ?auto_226356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226355 ?auto_226356 )
      ( MAKE-3PILE ?auto_226355 ?auto_226356 ?auto_226357 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_226362 - BLOCK
      ?auto_226363 - BLOCK
      ?auto_226364 - BLOCK
    )
    :vars
    (
      ?auto_226365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226364 ?auto_226365 ) ( ON-TABLE ?auto_226362 ) ( not ( = ?auto_226362 ?auto_226363 ) ) ( not ( = ?auto_226362 ?auto_226364 ) ) ( not ( = ?auto_226362 ?auto_226365 ) ) ( not ( = ?auto_226363 ?auto_226364 ) ) ( not ( = ?auto_226363 ?auto_226365 ) ) ( not ( = ?auto_226364 ?auto_226365 ) ) ( CLEAR ?auto_226362 ) ( ON ?auto_226363 ?auto_226364 ) ( CLEAR ?auto_226363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226362 ?auto_226363 )
      ( MAKE-3PILE ?auto_226362 ?auto_226363 ?auto_226364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_226369 - BLOCK
      ?auto_226370 - BLOCK
      ?auto_226371 - BLOCK
    )
    :vars
    (
      ?auto_226372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226371 ?auto_226372 ) ( not ( = ?auto_226369 ?auto_226370 ) ) ( not ( = ?auto_226369 ?auto_226371 ) ) ( not ( = ?auto_226369 ?auto_226372 ) ) ( not ( = ?auto_226370 ?auto_226371 ) ) ( not ( = ?auto_226370 ?auto_226372 ) ) ( not ( = ?auto_226371 ?auto_226372 ) ) ( ON ?auto_226370 ?auto_226371 ) ( ON ?auto_226369 ?auto_226370 ) ( CLEAR ?auto_226369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226369 )
      ( MAKE-3PILE ?auto_226369 ?auto_226370 ?auto_226371 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_226376 - BLOCK
      ?auto_226377 - BLOCK
      ?auto_226378 - BLOCK
    )
    :vars
    (
      ?auto_226379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226378 ?auto_226379 ) ( not ( = ?auto_226376 ?auto_226377 ) ) ( not ( = ?auto_226376 ?auto_226378 ) ) ( not ( = ?auto_226376 ?auto_226379 ) ) ( not ( = ?auto_226377 ?auto_226378 ) ) ( not ( = ?auto_226377 ?auto_226379 ) ) ( not ( = ?auto_226378 ?auto_226379 ) ) ( ON ?auto_226377 ?auto_226378 ) ( ON ?auto_226376 ?auto_226377 ) ( CLEAR ?auto_226376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226376 )
      ( MAKE-3PILE ?auto_226376 ?auto_226377 ?auto_226378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_226384 - BLOCK
      ?auto_226385 - BLOCK
      ?auto_226386 - BLOCK
      ?auto_226387 - BLOCK
    )
    :vars
    (
      ?auto_226388 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226386 ) ( ON ?auto_226387 ?auto_226388 ) ( CLEAR ?auto_226387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226384 ) ( ON ?auto_226385 ?auto_226384 ) ( ON ?auto_226386 ?auto_226385 ) ( not ( = ?auto_226384 ?auto_226385 ) ) ( not ( = ?auto_226384 ?auto_226386 ) ) ( not ( = ?auto_226384 ?auto_226387 ) ) ( not ( = ?auto_226384 ?auto_226388 ) ) ( not ( = ?auto_226385 ?auto_226386 ) ) ( not ( = ?auto_226385 ?auto_226387 ) ) ( not ( = ?auto_226385 ?auto_226388 ) ) ( not ( = ?auto_226386 ?auto_226387 ) ) ( not ( = ?auto_226386 ?auto_226388 ) ) ( not ( = ?auto_226387 ?auto_226388 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226387 ?auto_226388 )
      ( !STACK ?auto_226387 ?auto_226386 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_226393 - BLOCK
      ?auto_226394 - BLOCK
      ?auto_226395 - BLOCK
      ?auto_226396 - BLOCK
    )
    :vars
    (
      ?auto_226397 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226395 ) ( ON ?auto_226396 ?auto_226397 ) ( CLEAR ?auto_226396 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226393 ) ( ON ?auto_226394 ?auto_226393 ) ( ON ?auto_226395 ?auto_226394 ) ( not ( = ?auto_226393 ?auto_226394 ) ) ( not ( = ?auto_226393 ?auto_226395 ) ) ( not ( = ?auto_226393 ?auto_226396 ) ) ( not ( = ?auto_226393 ?auto_226397 ) ) ( not ( = ?auto_226394 ?auto_226395 ) ) ( not ( = ?auto_226394 ?auto_226396 ) ) ( not ( = ?auto_226394 ?auto_226397 ) ) ( not ( = ?auto_226395 ?auto_226396 ) ) ( not ( = ?auto_226395 ?auto_226397 ) ) ( not ( = ?auto_226396 ?auto_226397 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226396 ?auto_226397 )
      ( !STACK ?auto_226396 ?auto_226395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_226402 - BLOCK
      ?auto_226403 - BLOCK
      ?auto_226404 - BLOCK
      ?auto_226405 - BLOCK
    )
    :vars
    (
      ?auto_226406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226405 ?auto_226406 ) ( ON-TABLE ?auto_226402 ) ( ON ?auto_226403 ?auto_226402 ) ( not ( = ?auto_226402 ?auto_226403 ) ) ( not ( = ?auto_226402 ?auto_226404 ) ) ( not ( = ?auto_226402 ?auto_226405 ) ) ( not ( = ?auto_226402 ?auto_226406 ) ) ( not ( = ?auto_226403 ?auto_226404 ) ) ( not ( = ?auto_226403 ?auto_226405 ) ) ( not ( = ?auto_226403 ?auto_226406 ) ) ( not ( = ?auto_226404 ?auto_226405 ) ) ( not ( = ?auto_226404 ?auto_226406 ) ) ( not ( = ?auto_226405 ?auto_226406 ) ) ( CLEAR ?auto_226403 ) ( ON ?auto_226404 ?auto_226405 ) ( CLEAR ?auto_226404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_226402 ?auto_226403 ?auto_226404 )
      ( MAKE-4PILE ?auto_226402 ?auto_226403 ?auto_226404 ?auto_226405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_226411 - BLOCK
      ?auto_226412 - BLOCK
      ?auto_226413 - BLOCK
      ?auto_226414 - BLOCK
    )
    :vars
    (
      ?auto_226415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226414 ?auto_226415 ) ( ON-TABLE ?auto_226411 ) ( ON ?auto_226412 ?auto_226411 ) ( not ( = ?auto_226411 ?auto_226412 ) ) ( not ( = ?auto_226411 ?auto_226413 ) ) ( not ( = ?auto_226411 ?auto_226414 ) ) ( not ( = ?auto_226411 ?auto_226415 ) ) ( not ( = ?auto_226412 ?auto_226413 ) ) ( not ( = ?auto_226412 ?auto_226414 ) ) ( not ( = ?auto_226412 ?auto_226415 ) ) ( not ( = ?auto_226413 ?auto_226414 ) ) ( not ( = ?auto_226413 ?auto_226415 ) ) ( not ( = ?auto_226414 ?auto_226415 ) ) ( CLEAR ?auto_226412 ) ( ON ?auto_226413 ?auto_226414 ) ( CLEAR ?auto_226413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_226411 ?auto_226412 ?auto_226413 )
      ( MAKE-4PILE ?auto_226411 ?auto_226412 ?auto_226413 ?auto_226414 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_226420 - BLOCK
      ?auto_226421 - BLOCK
      ?auto_226422 - BLOCK
      ?auto_226423 - BLOCK
    )
    :vars
    (
      ?auto_226424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226423 ?auto_226424 ) ( ON-TABLE ?auto_226420 ) ( not ( = ?auto_226420 ?auto_226421 ) ) ( not ( = ?auto_226420 ?auto_226422 ) ) ( not ( = ?auto_226420 ?auto_226423 ) ) ( not ( = ?auto_226420 ?auto_226424 ) ) ( not ( = ?auto_226421 ?auto_226422 ) ) ( not ( = ?auto_226421 ?auto_226423 ) ) ( not ( = ?auto_226421 ?auto_226424 ) ) ( not ( = ?auto_226422 ?auto_226423 ) ) ( not ( = ?auto_226422 ?auto_226424 ) ) ( not ( = ?auto_226423 ?auto_226424 ) ) ( ON ?auto_226422 ?auto_226423 ) ( CLEAR ?auto_226420 ) ( ON ?auto_226421 ?auto_226422 ) ( CLEAR ?auto_226421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226420 ?auto_226421 )
      ( MAKE-4PILE ?auto_226420 ?auto_226421 ?auto_226422 ?auto_226423 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_226429 - BLOCK
      ?auto_226430 - BLOCK
      ?auto_226431 - BLOCK
      ?auto_226432 - BLOCK
    )
    :vars
    (
      ?auto_226433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226432 ?auto_226433 ) ( ON-TABLE ?auto_226429 ) ( not ( = ?auto_226429 ?auto_226430 ) ) ( not ( = ?auto_226429 ?auto_226431 ) ) ( not ( = ?auto_226429 ?auto_226432 ) ) ( not ( = ?auto_226429 ?auto_226433 ) ) ( not ( = ?auto_226430 ?auto_226431 ) ) ( not ( = ?auto_226430 ?auto_226432 ) ) ( not ( = ?auto_226430 ?auto_226433 ) ) ( not ( = ?auto_226431 ?auto_226432 ) ) ( not ( = ?auto_226431 ?auto_226433 ) ) ( not ( = ?auto_226432 ?auto_226433 ) ) ( ON ?auto_226431 ?auto_226432 ) ( CLEAR ?auto_226429 ) ( ON ?auto_226430 ?auto_226431 ) ( CLEAR ?auto_226430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226429 ?auto_226430 )
      ( MAKE-4PILE ?auto_226429 ?auto_226430 ?auto_226431 ?auto_226432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_226438 - BLOCK
      ?auto_226439 - BLOCK
      ?auto_226440 - BLOCK
      ?auto_226441 - BLOCK
    )
    :vars
    (
      ?auto_226442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226441 ?auto_226442 ) ( not ( = ?auto_226438 ?auto_226439 ) ) ( not ( = ?auto_226438 ?auto_226440 ) ) ( not ( = ?auto_226438 ?auto_226441 ) ) ( not ( = ?auto_226438 ?auto_226442 ) ) ( not ( = ?auto_226439 ?auto_226440 ) ) ( not ( = ?auto_226439 ?auto_226441 ) ) ( not ( = ?auto_226439 ?auto_226442 ) ) ( not ( = ?auto_226440 ?auto_226441 ) ) ( not ( = ?auto_226440 ?auto_226442 ) ) ( not ( = ?auto_226441 ?auto_226442 ) ) ( ON ?auto_226440 ?auto_226441 ) ( ON ?auto_226439 ?auto_226440 ) ( ON ?auto_226438 ?auto_226439 ) ( CLEAR ?auto_226438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226438 )
      ( MAKE-4PILE ?auto_226438 ?auto_226439 ?auto_226440 ?auto_226441 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_226447 - BLOCK
      ?auto_226448 - BLOCK
      ?auto_226449 - BLOCK
      ?auto_226450 - BLOCK
    )
    :vars
    (
      ?auto_226451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226450 ?auto_226451 ) ( not ( = ?auto_226447 ?auto_226448 ) ) ( not ( = ?auto_226447 ?auto_226449 ) ) ( not ( = ?auto_226447 ?auto_226450 ) ) ( not ( = ?auto_226447 ?auto_226451 ) ) ( not ( = ?auto_226448 ?auto_226449 ) ) ( not ( = ?auto_226448 ?auto_226450 ) ) ( not ( = ?auto_226448 ?auto_226451 ) ) ( not ( = ?auto_226449 ?auto_226450 ) ) ( not ( = ?auto_226449 ?auto_226451 ) ) ( not ( = ?auto_226450 ?auto_226451 ) ) ( ON ?auto_226449 ?auto_226450 ) ( ON ?auto_226448 ?auto_226449 ) ( ON ?auto_226447 ?auto_226448 ) ( CLEAR ?auto_226447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226447 )
      ( MAKE-4PILE ?auto_226447 ?auto_226448 ?auto_226449 ?auto_226450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_226457 - BLOCK
      ?auto_226458 - BLOCK
      ?auto_226459 - BLOCK
      ?auto_226460 - BLOCK
      ?auto_226461 - BLOCK
    )
    :vars
    (
      ?auto_226462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226460 ) ( ON ?auto_226461 ?auto_226462 ) ( CLEAR ?auto_226461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226457 ) ( ON ?auto_226458 ?auto_226457 ) ( ON ?auto_226459 ?auto_226458 ) ( ON ?auto_226460 ?auto_226459 ) ( not ( = ?auto_226457 ?auto_226458 ) ) ( not ( = ?auto_226457 ?auto_226459 ) ) ( not ( = ?auto_226457 ?auto_226460 ) ) ( not ( = ?auto_226457 ?auto_226461 ) ) ( not ( = ?auto_226457 ?auto_226462 ) ) ( not ( = ?auto_226458 ?auto_226459 ) ) ( not ( = ?auto_226458 ?auto_226460 ) ) ( not ( = ?auto_226458 ?auto_226461 ) ) ( not ( = ?auto_226458 ?auto_226462 ) ) ( not ( = ?auto_226459 ?auto_226460 ) ) ( not ( = ?auto_226459 ?auto_226461 ) ) ( not ( = ?auto_226459 ?auto_226462 ) ) ( not ( = ?auto_226460 ?auto_226461 ) ) ( not ( = ?auto_226460 ?auto_226462 ) ) ( not ( = ?auto_226461 ?auto_226462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226461 ?auto_226462 )
      ( !STACK ?auto_226461 ?auto_226460 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_226468 - BLOCK
      ?auto_226469 - BLOCK
      ?auto_226470 - BLOCK
      ?auto_226471 - BLOCK
      ?auto_226472 - BLOCK
    )
    :vars
    (
      ?auto_226473 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226471 ) ( ON ?auto_226472 ?auto_226473 ) ( CLEAR ?auto_226472 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226468 ) ( ON ?auto_226469 ?auto_226468 ) ( ON ?auto_226470 ?auto_226469 ) ( ON ?auto_226471 ?auto_226470 ) ( not ( = ?auto_226468 ?auto_226469 ) ) ( not ( = ?auto_226468 ?auto_226470 ) ) ( not ( = ?auto_226468 ?auto_226471 ) ) ( not ( = ?auto_226468 ?auto_226472 ) ) ( not ( = ?auto_226468 ?auto_226473 ) ) ( not ( = ?auto_226469 ?auto_226470 ) ) ( not ( = ?auto_226469 ?auto_226471 ) ) ( not ( = ?auto_226469 ?auto_226472 ) ) ( not ( = ?auto_226469 ?auto_226473 ) ) ( not ( = ?auto_226470 ?auto_226471 ) ) ( not ( = ?auto_226470 ?auto_226472 ) ) ( not ( = ?auto_226470 ?auto_226473 ) ) ( not ( = ?auto_226471 ?auto_226472 ) ) ( not ( = ?auto_226471 ?auto_226473 ) ) ( not ( = ?auto_226472 ?auto_226473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226472 ?auto_226473 )
      ( !STACK ?auto_226472 ?auto_226471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_226479 - BLOCK
      ?auto_226480 - BLOCK
      ?auto_226481 - BLOCK
      ?auto_226482 - BLOCK
      ?auto_226483 - BLOCK
    )
    :vars
    (
      ?auto_226484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226483 ?auto_226484 ) ( ON-TABLE ?auto_226479 ) ( ON ?auto_226480 ?auto_226479 ) ( ON ?auto_226481 ?auto_226480 ) ( not ( = ?auto_226479 ?auto_226480 ) ) ( not ( = ?auto_226479 ?auto_226481 ) ) ( not ( = ?auto_226479 ?auto_226482 ) ) ( not ( = ?auto_226479 ?auto_226483 ) ) ( not ( = ?auto_226479 ?auto_226484 ) ) ( not ( = ?auto_226480 ?auto_226481 ) ) ( not ( = ?auto_226480 ?auto_226482 ) ) ( not ( = ?auto_226480 ?auto_226483 ) ) ( not ( = ?auto_226480 ?auto_226484 ) ) ( not ( = ?auto_226481 ?auto_226482 ) ) ( not ( = ?auto_226481 ?auto_226483 ) ) ( not ( = ?auto_226481 ?auto_226484 ) ) ( not ( = ?auto_226482 ?auto_226483 ) ) ( not ( = ?auto_226482 ?auto_226484 ) ) ( not ( = ?auto_226483 ?auto_226484 ) ) ( CLEAR ?auto_226481 ) ( ON ?auto_226482 ?auto_226483 ) ( CLEAR ?auto_226482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_226479 ?auto_226480 ?auto_226481 ?auto_226482 )
      ( MAKE-5PILE ?auto_226479 ?auto_226480 ?auto_226481 ?auto_226482 ?auto_226483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_226490 - BLOCK
      ?auto_226491 - BLOCK
      ?auto_226492 - BLOCK
      ?auto_226493 - BLOCK
      ?auto_226494 - BLOCK
    )
    :vars
    (
      ?auto_226495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226494 ?auto_226495 ) ( ON-TABLE ?auto_226490 ) ( ON ?auto_226491 ?auto_226490 ) ( ON ?auto_226492 ?auto_226491 ) ( not ( = ?auto_226490 ?auto_226491 ) ) ( not ( = ?auto_226490 ?auto_226492 ) ) ( not ( = ?auto_226490 ?auto_226493 ) ) ( not ( = ?auto_226490 ?auto_226494 ) ) ( not ( = ?auto_226490 ?auto_226495 ) ) ( not ( = ?auto_226491 ?auto_226492 ) ) ( not ( = ?auto_226491 ?auto_226493 ) ) ( not ( = ?auto_226491 ?auto_226494 ) ) ( not ( = ?auto_226491 ?auto_226495 ) ) ( not ( = ?auto_226492 ?auto_226493 ) ) ( not ( = ?auto_226492 ?auto_226494 ) ) ( not ( = ?auto_226492 ?auto_226495 ) ) ( not ( = ?auto_226493 ?auto_226494 ) ) ( not ( = ?auto_226493 ?auto_226495 ) ) ( not ( = ?auto_226494 ?auto_226495 ) ) ( CLEAR ?auto_226492 ) ( ON ?auto_226493 ?auto_226494 ) ( CLEAR ?auto_226493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_226490 ?auto_226491 ?auto_226492 ?auto_226493 )
      ( MAKE-5PILE ?auto_226490 ?auto_226491 ?auto_226492 ?auto_226493 ?auto_226494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_226501 - BLOCK
      ?auto_226502 - BLOCK
      ?auto_226503 - BLOCK
      ?auto_226504 - BLOCK
      ?auto_226505 - BLOCK
    )
    :vars
    (
      ?auto_226506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226505 ?auto_226506 ) ( ON-TABLE ?auto_226501 ) ( ON ?auto_226502 ?auto_226501 ) ( not ( = ?auto_226501 ?auto_226502 ) ) ( not ( = ?auto_226501 ?auto_226503 ) ) ( not ( = ?auto_226501 ?auto_226504 ) ) ( not ( = ?auto_226501 ?auto_226505 ) ) ( not ( = ?auto_226501 ?auto_226506 ) ) ( not ( = ?auto_226502 ?auto_226503 ) ) ( not ( = ?auto_226502 ?auto_226504 ) ) ( not ( = ?auto_226502 ?auto_226505 ) ) ( not ( = ?auto_226502 ?auto_226506 ) ) ( not ( = ?auto_226503 ?auto_226504 ) ) ( not ( = ?auto_226503 ?auto_226505 ) ) ( not ( = ?auto_226503 ?auto_226506 ) ) ( not ( = ?auto_226504 ?auto_226505 ) ) ( not ( = ?auto_226504 ?auto_226506 ) ) ( not ( = ?auto_226505 ?auto_226506 ) ) ( ON ?auto_226504 ?auto_226505 ) ( CLEAR ?auto_226502 ) ( ON ?auto_226503 ?auto_226504 ) ( CLEAR ?auto_226503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_226501 ?auto_226502 ?auto_226503 )
      ( MAKE-5PILE ?auto_226501 ?auto_226502 ?auto_226503 ?auto_226504 ?auto_226505 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_226512 - BLOCK
      ?auto_226513 - BLOCK
      ?auto_226514 - BLOCK
      ?auto_226515 - BLOCK
      ?auto_226516 - BLOCK
    )
    :vars
    (
      ?auto_226517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226516 ?auto_226517 ) ( ON-TABLE ?auto_226512 ) ( ON ?auto_226513 ?auto_226512 ) ( not ( = ?auto_226512 ?auto_226513 ) ) ( not ( = ?auto_226512 ?auto_226514 ) ) ( not ( = ?auto_226512 ?auto_226515 ) ) ( not ( = ?auto_226512 ?auto_226516 ) ) ( not ( = ?auto_226512 ?auto_226517 ) ) ( not ( = ?auto_226513 ?auto_226514 ) ) ( not ( = ?auto_226513 ?auto_226515 ) ) ( not ( = ?auto_226513 ?auto_226516 ) ) ( not ( = ?auto_226513 ?auto_226517 ) ) ( not ( = ?auto_226514 ?auto_226515 ) ) ( not ( = ?auto_226514 ?auto_226516 ) ) ( not ( = ?auto_226514 ?auto_226517 ) ) ( not ( = ?auto_226515 ?auto_226516 ) ) ( not ( = ?auto_226515 ?auto_226517 ) ) ( not ( = ?auto_226516 ?auto_226517 ) ) ( ON ?auto_226515 ?auto_226516 ) ( CLEAR ?auto_226513 ) ( ON ?auto_226514 ?auto_226515 ) ( CLEAR ?auto_226514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_226512 ?auto_226513 ?auto_226514 )
      ( MAKE-5PILE ?auto_226512 ?auto_226513 ?auto_226514 ?auto_226515 ?auto_226516 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_226523 - BLOCK
      ?auto_226524 - BLOCK
      ?auto_226525 - BLOCK
      ?auto_226526 - BLOCK
      ?auto_226527 - BLOCK
    )
    :vars
    (
      ?auto_226528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226527 ?auto_226528 ) ( ON-TABLE ?auto_226523 ) ( not ( = ?auto_226523 ?auto_226524 ) ) ( not ( = ?auto_226523 ?auto_226525 ) ) ( not ( = ?auto_226523 ?auto_226526 ) ) ( not ( = ?auto_226523 ?auto_226527 ) ) ( not ( = ?auto_226523 ?auto_226528 ) ) ( not ( = ?auto_226524 ?auto_226525 ) ) ( not ( = ?auto_226524 ?auto_226526 ) ) ( not ( = ?auto_226524 ?auto_226527 ) ) ( not ( = ?auto_226524 ?auto_226528 ) ) ( not ( = ?auto_226525 ?auto_226526 ) ) ( not ( = ?auto_226525 ?auto_226527 ) ) ( not ( = ?auto_226525 ?auto_226528 ) ) ( not ( = ?auto_226526 ?auto_226527 ) ) ( not ( = ?auto_226526 ?auto_226528 ) ) ( not ( = ?auto_226527 ?auto_226528 ) ) ( ON ?auto_226526 ?auto_226527 ) ( ON ?auto_226525 ?auto_226526 ) ( CLEAR ?auto_226523 ) ( ON ?auto_226524 ?auto_226525 ) ( CLEAR ?auto_226524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226523 ?auto_226524 )
      ( MAKE-5PILE ?auto_226523 ?auto_226524 ?auto_226525 ?auto_226526 ?auto_226527 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_226534 - BLOCK
      ?auto_226535 - BLOCK
      ?auto_226536 - BLOCK
      ?auto_226537 - BLOCK
      ?auto_226538 - BLOCK
    )
    :vars
    (
      ?auto_226539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226538 ?auto_226539 ) ( ON-TABLE ?auto_226534 ) ( not ( = ?auto_226534 ?auto_226535 ) ) ( not ( = ?auto_226534 ?auto_226536 ) ) ( not ( = ?auto_226534 ?auto_226537 ) ) ( not ( = ?auto_226534 ?auto_226538 ) ) ( not ( = ?auto_226534 ?auto_226539 ) ) ( not ( = ?auto_226535 ?auto_226536 ) ) ( not ( = ?auto_226535 ?auto_226537 ) ) ( not ( = ?auto_226535 ?auto_226538 ) ) ( not ( = ?auto_226535 ?auto_226539 ) ) ( not ( = ?auto_226536 ?auto_226537 ) ) ( not ( = ?auto_226536 ?auto_226538 ) ) ( not ( = ?auto_226536 ?auto_226539 ) ) ( not ( = ?auto_226537 ?auto_226538 ) ) ( not ( = ?auto_226537 ?auto_226539 ) ) ( not ( = ?auto_226538 ?auto_226539 ) ) ( ON ?auto_226537 ?auto_226538 ) ( ON ?auto_226536 ?auto_226537 ) ( CLEAR ?auto_226534 ) ( ON ?auto_226535 ?auto_226536 ) ( CLEAR ?auto_226535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226534 ?auto_226535 )
      ( MAKE-5PILE ?auto_226534 ?auto_226535 ?auto_226536 ?auto_226537 ?auto_226538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_226545 - BLOCK
      ?auto_226546 - BLOCK
      ?auto_226547 - BLOCK
      ?auto_226548 - BLOCK
      ?auto_226549 - BLOCK
    )
    :vars
    (
      ?auto_226550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226549 ?auto_226550 ) ( not ( = ?auto_226545 ?auto_226546 ) ) ( not ( = ?auto_226545 ?auto_226547 ) ) ( not ( = ?auto_226545 ?auto_226548 ) ) ( not ( = ?auto_226545 ?auto_226549 ) ) ( not ( = ?auto_226545 ?auto_226550 ) ) ( not ( = ?auto_226546 ?auto_226547 ) ) ( not ( = ?auto_226546 ?auto_226548 ) ) ( not ( = ?auto_226546 ?auto_226549 ) ) ( not ( = ?auto_226546 ?auto_226550 ) ) ( not ( = ?auto_226547 ?auto_226548 ) ) ( not ( = ?auto_226547 ?auto_226549 ) ) ( not ( = ?auto_226547 ?auto_226550 ) ) ( not ( = ?auto_226548 ?auto_226549 ) ) ( not ( = ?auto_226548 ?auto_226550 ) ) ( not ( = ?auto_226549 ?auto_226550 ) ) ( ON ?auto_226548 ?auto_226549 ) ( ON ?auto_226547 ?auto_226548 ) ( ON ?auto_226546 ?auto_226547 ) ( ON ?auto_226545 ?auto_226546 ) ( CLEAR ?auto_226545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226545 )
      ( MAKE-5PILE ?auto_226545 ?auto_226546 ?auto_226547 ?auto_226548 ?auto_226549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_226556 - BLOCK
      ?auto_226557 - BLOCK
      ?auto_226558 - BLOCK
      ?auto_226559 - BLOCK
      ?auto_226560 - BLOCK
    )
    :vars
    (
      ?auto_226561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226560 ?auto_226561 ) ( not ( = ?auto_226556 ?auto_226557 ) ) ( not ( = ?auto_226556 ?auto_226558 ) ) ( not ( = ?auto_226556 ?auto_226559 ) ) ( not ( = ?auto_226556 ?auto_226560 ) ) ( not ( = ?auto_226556 ?auto_226561 ) ) ( not ( = ?auto_226557 ?auto_226558 ) ) ( not ( = ?auto_226557 ?auto_226559 ) ) ( not ( = ?auto_226557 ?auto_226560 ) ) ( not ( = ?auto_226557 ?auto_226561 ) ) ( not ( = ?auto_226558 ?auto_226559 ) ) ( not ( = ?auto_226558 ?auto_226560 ) ) ( not ( = ?auto_226558 ?auto_226561 ) ) ( not ( = ?auto_226559 ?auto_226560 ) ) ( not ( = ?auto_226559 ?auto_226561 ) ) ( not ( = ?auto_226560 ?auto_226561 ) ) ( ON ?auto_226559 ?auto_226560 ) ( ON ?auto_226558 ?auto_226559 ) ( ON ?auto_226557 ?auto_226558 ) ( ON ?auto_226556 ?auto_226557 ) ( CLEAR ?auto_226556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226556 )
      ( MAKE-5PILE ?auto_226556 ?auto_226557 ?auto_226558 ?auto_226559 ?auto_226560 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226568 - BLOCK
      ?auto_226569 - BLOCK
      ?auto_226570 - BLOCK
      ?auto_226571 - BLOCK
      ?auto_226572 - BLOCK
      ?auto_226573 - BLOCK
    )
    :vars
    (
      ?auto_226574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226572 ) ( ON ?auto_226573 ?auto_226574 ) ( CLEAR ?auto_226573 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226568 ) ( ON ?auto_226569 ?auto_226568 ) ( ON ?auto_226570 ?auto_226569 ) ( ON ?auto_226571 ?auto_226570 ) ( ON ?auto_226572 ?auto_226571 ) ( not ( = ?auto_226568 ?auto_226569 ) ) ( not ( = ?auto_226568 ?auto_226570 ) ) ( not ( = ?auto_226568 ?auto_226571 ) ) ( not ( = ?auto_226568 ?auto_226572 ) ) ( not ( = ?auto_226568 ?auto_226573 ) ) ( not ( = ?auto_226568 ?auto_226574 ) ) ( not ( = ?auto_226569 ?auto_226570 ) ) ( not ( = ?auto_226569 ?auto_226571 ) ) ( not ( = ?auto_226569 ?auto_226572 ) ) ( not ( = ?auto_226569 ?auto_226573 ) ) ( not ( = ?auto_226569 ?auto_226574 ) ) ( not ( = ?auto_226570 ?auto_226571 ) ) ( not ( = ?auto_226570 ?auto_226572 ) ) ( not ( = ?auto_226570 ?auto_226573 ) ) ( not ( = ?auto_226570 ?auto_226574 ) ) ( not ( = ?auto_226571 ?auto_226572 ) ) ( not ( = ?auto_226571 ?auto_226573 ) ) ( not ( = ?auto_226571 ?auto_226574 ) ) ( not ( = ?auto_226572 ?auto_226573 ) ) ( not ( = ?auto_226572 ?auto_226574 ) ) ( not ( = ?auto_226573 ?auto_226574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226573 ?auto_226574 )
      ( !STACK ?auto_226573 ?auto_226572 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226581 - BLOCK
      ?auto_226582 - BLOCK
      ?auto_226583 - BLOCK
      ?auto_226584 - BLOCK
      ?auto_226585 - BLOCK
      ?auto_226586 - BLOCK
    )
    :vars
    (
      ?auto_226587 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226585 ) ( ON ?auto_226586 ?auto_226587 ) ( CLEAR ?auto_226586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226581 ) ( ON ?auto_226582 ?auto_226581 ) ( ON ?auto_226583 ?auto_226582 ) ( ON ?auto_226584 ?auto_226583 ) ( ON ?auto_226585 ?auto_226584 ) ( not ( = ?auto_226581 ?auto_226582 ) ) ( not ( = ?auto_226581 ?auto_226583 ) ) ( not ( = ?auto_226581 ?auto_226584 ) ) ( not ( = ?auto_226581 ?auto_226585 ) ) ( not ( = ?auto_226581 ?auto_226586 ) ) ( not ( = ?auto_226581 ?auto_226587 ) ) ( not ( = ?auto_226582 ?auto_226583 ) ) ( not ( = ?auto_226582 ?auto_226584 ) ) ( not ( = ?auto_226582 ?auto_226585 ) ) ( not ( = ?auto_226582 ?auto_226586 ) ) ( not ( = ?auto_226582 ?auto_226587 ) ) ( not ( = ?auto_226583 ?auto_226584 ) ) ( not ( = ?auto_226583 ?auto_226585 ) ) ( not ( = ?auto_226583 ?auto_226586 ) ) ( not ( = ?auto_226583 ?auto_226587 ) ) ( not ( = ?auto_226584 ?auto_226585 ) ) ( not ( = ?auto_226584 ?auto_226586 ) ) ( not ( = ?auto_226584 ?auto_226587 ) ) ( not ( = ?auto_226585 ?auto_226586 ) ) ( not ( = ?auto_226585 ?auto_226587 ) ) ( not ( = ?auto_226586 ?auto_226587 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226586 ?auto_226587 )
      ( !STACK ?auto_226586 ?auto_226585 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226594 - BLOCK
      ?auto_226595 - BLOCK
      ?auto_226596 - BLOCK
      ?auto_226597 - BLOCK
      ?auto_226598 - BLOCK
      ?auto_226599 - BLOCK
    )
    :vars
    (
      ?auto_226600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226599 ?auto_226600 ) ( ON-TABLE ?auto_226594 ) ( ON ?auto_226595 ?auto_226594 ) ( ON ?auto_226596 ?auto_226595 ) ( ON ?auto_226597 ?auto_226596 ) ( not ( = ?auto_226594 ?auto_226595 ) ) ( not ( = ?auto_226594 ?auto_226596 ) ) ( not ( = ?auto_226594 ?auto_226597 ) ) ( not ( = ?auto_226594 ?auto_226598 ) ) ( not ( = ?auto_226594 ?auto_226599 ) ) ( not ( = ?auto_226594 ?auto_226600 ) ) ( not ( = ?auto_226595 ?auto_226596 ) ) ( not ( = ?auto_226595 ?auto_226597 ) ) ( not ( = ?auto_226595 ?auto_226598 ) ) ( not ( = ?auto_226595 ?auto_226599 ) ) ( not ( = ?auto_226595 ?auto_226600 ) ) ( not ( = ?auto_226596 ?auto_226597 ) ) ( not ( = ?auto_226596 ?auto_226598 ) ) ( not ( = ?auto_226596 ?auto_226599 ) ) ( not ( = ?auto_226596 ?auto_226600 ) ) ( not ( = ?auto_226597 ?auto_226598 ) ) ( not ( = ?auto_226597 ?auto_226599 ) ) ( not ( = ?auto_226597 ?auto_226600 ) ) ( not ( = ?auto_226598 ?auto_226599 ) ) ( not ( = ?auto_226598 ?auto_226600 ) ) ( not ( = ?auto_226599 ?auto_226600 ) ) ( CLEAR ?auto_226597 ) ( ON ?auto_226598 ?auto_226599 ) ( CLEAR ?auto_226598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_226594 ?auto_226595 ?auto_226596 ?auto_226597 ?auto_226598 )
      ( MAKE-6PILE ?auto_226594 ?auto_226595 ?auto_226596 ?auto_226597 ?auto_226598 ?auto_226599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226607 - BLOCK
      ?auto_226608 - BLOCK
      ?auto_226609 - BLOCK
      ?auto_226610 - BLOCK
      ?auto_226611 - BLOCK
      ?auto_226612 - BLOCK
    )
    :vars
    (
      ?auto_226613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226612 ?auto_226613 ) ( ON-TABLE ?auto_226607 ) ( ON ?auto_226608 ?auto_226607 ) ( ON ?auto_226609 ?auto_226608 ) ( ON ?auto_226610 ?auto_226609 ) ( not ( = ?auto_226607 ?auto_226608 ) ) ( not ( = ?auto_226607 ?auto_226609 ) ) ( not ( = ?auto_226607 ?auto_226610 ) ) ( not ( = ?auto_226607 ?auto_226611 ) ) ( not ( = ?auto_226607 ?auto_226612 ) ) ( not ( = ?auto_226607 ?auto_226613 ) ) ( not ( = ?auto_226608 ?auto_226609 ) ) ( not ( = ?auto_226608 ?auto_226610 ) ) ( not ( = ?auto_226608 ?auto_226611 ) ) ( not ( = ?auto_226608 ?auto_226612 ) ) ( not ( = ?auto_226608 ?auto_226613 ) ) ( not ( = ?auto_226609 ?auto_226610 ) ) ( not ( = ?auto_226609 ?auto_226611 ) ) ( not ( = ?auto_226609 ?auto_226612 ) ) ( not ( = ?auto_226609 ?auto_226613 ) ) ( not ( = ?auto_226610 ?auto_226611 ) ) ( not ( = ?auto_226610 ?auto_226612 ) ) ( not ( = ?auto_226610 ?auto_226613 ) ) ( not ( = ?auto_226611 ?auto_226612 ) ) ( not ( = ?auto_226611 ?auto_226613 ) ) ( not ( = ?auto_226612 ?auto_226613 ) ) ( CLEAR ?auto_226610 ) ( ON ?auto_226611 ?auto_226612 ) ( CLEAR ?auto_226611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_226607 ?auto_226608 ?auto_226609 ?auto_226610 ?auto_226611 )
      ( MAKE-6PILE ?auto_226607 ?auto_226608 ?auto_226609 ?auto_226610 ?auto_226611 ?auto_226612 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226620 - BLOCK
      ?auto_226621 - BLOCK
      ?auto_226622 - BLOCK
      ?auto_226623 - BLOCK
      ?auto_226624 - BLOCK
      ?auto_226625 - BLOCK
    )
    :vars
    (
      ?auto_226626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226625 ?auto_226626 ) ( ON-TABLE ?auto_226620 ) ( ON ?auto_226621 ?auto_226620 ) ( ON ?auto_226622 ?auto_226621 ) ( not ( = ?auto_226620 ?auto_226621 ) ) ( not ( = ?auto_226620 ?auto_226622 ) ) ( not ( = ?auto_226620 ?auto_226623 ) ) ( not ( = ?auto_226620 ?auto_226624 ) ) ( not ( = ?auto_226620 ?auto_226625 ) ) ( not ( = ?auto_226620 ?auto_226626 ) ) ( not ( = ?auto_226621 ?auto_226622 ) ) ( not ( = ?auto_226621 ?auto_226623 ) ) ( not ( = ?auto_226621 ?auto_226624 ) ) ( not ( = ?auto_226621 ?auto_226625 ) ) ( not ( = ?auto_226621 ?auto_226626 ) ) ( not ( = ?auto_226622 ?auto_226623 ) ) ( not ( = ?auto_226622 ?auto_226624 ) ) ( not ( = ?auto_226622 ?auto_226625 ) ) ( not ( = ?auto_226622 ?auto_226626 ) ) ( not ( = ?auto_226623 ?auto_226624 ) ) ( not ( = ?auto_226623 ?auto_226625 ) ) ( not ( = ?auto_226623 ?auto_226626 ) ) ( not ( = ?auto_226624 ?auto_226625 ) ) ( not ( = ?auto_226624 ?auto_226626 ) ) ( not ( = ?auto_226625 ?auto_226626 ) ) ( ON ?auto_226624 ?auto_226625 ) ( CLEAR ?auto_226622 ) ( ON ?auto_226623 ?auto_226624 ) ( CLEAR ?auto_226623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_226620 ?auto_226621 ?auto_226622 ?auto_226623 )
      ( MAKE-6PILE ?auto_226620 ?auto_226621 ?auto_226622 ?auto_226623 ?auto_226624 ?auto_226625 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226633 - BLOCK
      ?auto_226634 - BLOCK
      ?auto_226635 - BLOCK
      ?auto_226636 - BLOCK
      ?auto_226637 - BLOCK
      ?auto_226638 - BLOCK
    )
    :vars
    (
      ?auto_226639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226638 ?auto_226639 ) ( ON-TABLE ?auto_226633 ) ( ON ?auto_226634 ?auto_226633 ) ( ON ?auto_226635 ?auto_226634 ) ( not ( = ?auto_226633 ?auto_226634 ) ) ( not ( = ?auto_226633 ?auto_226635 ) ) ( not ( = ?auto_226633 ?auto_226636 ) ) ( not ( = ?auto_226633 ?auto_226637 ) ) ( not ( = ?auto_226633 ?auto_226638 ) ) ( not ( = ?auto_226633 ?auto_226639 ) ) ( not ( = ?auto_226634 ?auto_226635 ) ) ( not ( = ?auto_226634 ?auto_226636 ) ) ( not ( = ?auto_226634 ?auto_226637 ) ) ( not ( = ?auto_226634 ?auto_226638 ) ) ( not ( = ?auto_226634 ?auto_226639 ) ) ( not ( = ?auto_226635 ?auto_226636 ) ) ( not ( = ?auto_226635 ?auto_226637 ) ) ( not ( = ?auto_226635 ?auto_226638 ) ) ( not ( = ?auto_226635 ?auto_226639 ) ) ( not ( = ?auto_226636 ?auto_226637 ) ) ( not ( = ?auto_226636 ?auto_226638 ) ) ( not ( = ?auto_226636 ?auto_226639 ) ) ( not ( = ?auto_226637 ?auto_226638 ) ) ( not ( = ?auto_226637 ?auto_226639 ) ) ( not ( = ?auto_226638 ?auto_226639 ) ) ( ON ?auto_226637 ?auto_226638 ) ( CLEAR ?auto_226635 ) ( ON ?auto_226636 ?auto_226637 ) ( CLEAR ?auto_226636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_226633 ?auto_226634 ?auto_226635 ?auto_226636 )
      ( MAKE-6PILE ?auto_226633 ?auto_226634 ?auto_226635 ?auto_226636 ?auto_226637 ?auto_226638 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226646 - BLOCK
      ?auto_226647 - BLOCK
      ?auto_226648 - BLOCK
      ?auto_226649 - BLOCK
      ?auto_226650 - BLOCK
      ?auto_226651 - BLOCK
    )
    :vars
    (
      ?auto_226652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226651 ?auto_226652 ) ( ON-TABLE ?auto_226646 ) ( ON ?auto_226647 ?auto_226646 ) ( not ( = ?auto_226646 ?auto_226647 ) ) ( not ( = ?auto_226646 ?auto_226648 ) ) ( not ( = ?auto_226646 ?auto_226649 ) ) ( not ( = ?auto_226646 ?auto_226650 ) ) ( not ( = ?auto_226646 ?auto_226651 ) ) ( not ( = ?auto_226646 ?auto_226652 ) ) ( not ( = ?auto_226647 ?auto_226648 ) ) ( not ( = ?auto_226647 ?auto_226649 ) ) ( not ( = ?auto_226647 ?auto_226650 ) ) ( not ( = ?auto_226647 ?auto_226651 ) ) ( not ( = ?auto_226647 ?auto_226652 ) ) ( not ( = ?auto_226648 ?auto_226649 ) ) ( not ( = ?auto_226648 ?auto_226650 ) ) ( not ( = ?auto_226648 ?auto_226651 ) ) ( not ( = ?auto_226648 ?auto_226652 ) ) ( not ( = ?auto_226649 ?auto_226650 ) ) ( not ( = ?auto_226649 ?auto_226651 ) ) ( not ( = ?auto_226649 ?auto_226652 ) ) ( not ( = ?auto_226650 ?auto_226651 ) ) ( not ( = ?auto_226650 ?auto_226652 ) ) ( not ( = ?auto_226651 ?auto_226652 ) ) ( ON ?auto_226650 ?auto_226651 ) ( ON ?auto_226649 ?auto_226650 ) ( CLEAR ?auto_226647 ) ( ON ?auto_226648 ?auto_226649 ) ( CLEAR ?auto_226648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_226646 ?auto_226647 ?auto_226648 )
      ( MAKE-6PILE ?auto_226646 ?auto_226647 ?auto_226648 ?auto_226649 ?auto_226650 ?auto_226651 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226659 - BLOCK
      ?auto_226660 - BLOCK
      ?auto_226661 - BLOCK
      ?auto_226662 - BLOCK
      ?auto_226663 - BLOCK
      ?auto_226664 - BLOCK
    )
    :vars
    (
      ?auto_226665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226664 ?auto_226665 ) ( ON-TABLE ?auto_226659 ) ( ON ?auto_226660 ?auto_226659 ) ( not ( = ?auto_226659 ?auto_226660 ) ) ( not ( = ?auto_226659 ?auto_226661 ) ) ( not ( = ?auto_226659 ?auto_226662 ) ) ( not ( = ?auto_226659 ?auto_226663 ) ) ( not ( = ?auto_226659 ?auto_226664 ) ) ( not ( = ?auto_226659 ?auto_226665 ) ) ( not ( = ?auto_226660 ?auto_226661 ) ) ( not ( = ?auto_226660 ?auto_226662 ) ) ( not ( = ?auto_226660 ?auto_226663 ) ) ( not ( = ?auto_226660 ?auto_226664 ) ) ( not ( = ?auto_226660 ?auto_226665 ) ) ( not ( = ?auto_226661 ?auto_226662 ) ) ( not ( = ?auto_226661 ?auto_226663 ) ) ( not ( = ?auto_226661 ?auto_226664 ) ) ( not ( = ?auto_226661 ?auto_226665 ) ) ( not ( = ?auto_226662 ?auto_226663 ) ) ( not ( = ?auto_226662 ?auto_226664 ) ) ( not ( = ?auto_226662 ?auto_226665 ) ) ( not ( = ?auto_226663 ?auto_226664 ) ) ( not ( = ?auto_226663 ?auto_226665 ) ) ( not ( = ?auto_226664 ?auto_226665 ) ) ( ON ?auto_226663 ?auto_226664 ) ( ON ?auto_226662 ?auto_226663 ) ( CLEAR ?auto_226660 ) ( ON ?auto_226661 ?auto_226662 ) ( CLEAR ?auto_226661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_226659 ?auto_226660 ?auto_226661 )
      ( MAKE-6PILE ?auto_226659 ?auto_226660 ?auto_226661 ?auto_226662 ?auto_226663 ?auto_226664 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226672 - BLOCK
      ?auto_226673 - BLOCK
      ?auto_226674 - BLOCK
      ?auto_226675 - BLOCK
      ?auto_226676 - BLOCK
      ?auto_226677 - BLOCK
    )
    :vars
    (
      ?auto_226678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226677 ?auto_226678 ) ( ON-TABLE ?auto_226672 ) ( not ( = ?auto_226672 ?auto_226673 ) ) ( not ( = ?auto_226672 ?auto_226674 ) ) ( not ( = ?auto_226672 ?auto_226675 ) ) ( not ( = ?auto_226672 ?auto_226676 ) ) ( not ( = ?auto_226672 ?auto_226677 ) ) ( not ( = ?auto_226672 ?auto_226678 ) ) ( not ( = ?auto_226673 ?auto_226674 ) ) ( not ( = ?auto_226673 ?auto_226675 ) ) ( not ( = ?auto_226673 ?auto_226676 ) ) ( not ( = ?auto_226673 ?auto_226677 ) ) ( not ( = ?auto_226673 ?auto_226678 ) ) ( not ( = ?auto_226674 ?auto_226675 ) ) ( not ( = ?auto_226674 ?auto_226676 ) ) ( not ( = ?auto_226674 ?auto_226677 ) ) ( not ( = ?auto_226674 ?auto_226678 ) ) ( not ( = ?auto_226675 ?auto_226676 ) ) ( not ( = ?auto_226675 ?auto_226677 ) ) ( not ( = ?auto_226675 ?auto_226678 ) ) ( not ( = ?auto_226676 ?auto_226677 ) ) ( not ( = ?auto_226676 ?auto_226678 ) ) ( not ( = ?auto_226677 ?auto_226678 ) ) ( ON ?auto_226676 ?auto_226677 ) ( ON ?auto_226675 ?auto_226676 ) ( ON ?auto_226674 ?auto_226675 ) ( CLEAR ?auto_226672 ) ( ON ?auto_226673 ?auto_226674 ) ( CLEAR ?auto_226673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226672 ?auto_226673 )
      ( MAKE-6PILE ?auto_226672 ?auto_226673 ?auto_226674 ?auto_226675 ?auto_226676 ?auto_226677 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226685 - BLOCK
      ?auto_226686 - BLOCK
      ?auto_226687 - BLOCK
      ?auto_226688 - BLOCK
      ?auto_226689 - BLOCK
      ?auto_226690 - BLOCK
    )
    :vars
    (
      ?auto_226691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226690 ?auto_226691 ) ( ON-TABLE ?auto_226685 ) ( not ( = ?auto_226685 ?auto_226686 ) ) ( not ( = ?auto_226685 ?auto_226687 ) ) ( not ( = ?auto_226685 ?auto_226688 ) ) ( not ( = ?auto_226685 ?auto_226689 ) ) ( not ( = ?auto_226685 ?auto_226690 ) ) ( not ( = ?auto_226685 ?auto_226691 ) ) ( not ( = ?auto_226686 ?auto_226687 ) ) ( not ( = ?auto_226686 ?auto_226688 ) ) ( not ( = ?auto_226686 ?auto_226689 ) ) ( not ( = ?auto_226686 ?auto_226690 ) ) ( not ( = ?auto_226686 ?auto_226691 ) ) ( not ( = ?auto_226687 ?auto_226688 ) ) ( not ( = ?auto_226687 ?auto_226689 ) ) ( not ( = ?auto_226687 ?auto_226690 ) ) ( not ( = ?auto_226687 ?auto_226691 ) ) ( not ( = ?auto_226688 ?auto_226689 ) ) ( not ( = ?auto_226688 ?auto_226690 ) ) ( not ( = ?auto_226688 ?auto_226691 ) ) ( not ( = ?auto_226689 ?auto_226690 ) ) ( not ( = ?auto_226689 ?auto_226691 ) ) ( not ( = ?auto_226690 ?auto_226691 ) ) ( ON ?auto_226689 ?auto_226690 ) ( ON ?auto_226688 ?auto_226689 ) ( ON ?auto_226687 ?auto_226688 ) ( CLEAR ?auto_226685 ) ( ON ?auto_226686 ?auto_226687 ) ( CLEAR ?auto_226686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226685 ?auto_226686 )
      ( MAKE-6PILE ?auto_226685 ?auto_226686 ?auto_226687 ?auto_226688 ?auto_226689 ?auto_226690 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226698 - BLOCK
      ?auto_226699 - BLOCK
      ?auto_226700 - BLOCK
      ?auto_226701 - BLOCK
      ?auto_226702 - BLOCK
      ?auto_226703 - BLOCK
    )
    :vars
    (
      ?auto_226704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226703 ?auto_226704 ) ( not ( = ?auto_226698 ?auto_226699 ) ) ( not ( = ?auto_226698 ?auto_226700 ) ) ( not ( = ?auto_226698 ?auto_226701 ) ) ( not ( = ?auto_226698 ?auto_226702 ) ) ( not ( = ?auto_226698 ?auto_226703 ) ) ( not ( = ?auto_226698 ?auto_226704 ) ) ( not ( = ?auto_226699 ?auto_226700 ) ) ( not ( = ?auto_226699 ?auto_226701 ) ) ( not ( = ?auto_226699 ?auto_226702 ) ) ( not ( = ?auto_226699 ?auto_226703 ) ) ( not ( = ?auto_226699 ?auto_226704 ) ) ( not ( = ?auto_226700 ?auto_226701 ) ) ( not ( = ?auto_226700 ?auto_226702 ) ) ( not ( = ?auto_226700 ?auto_226703 ) ) ( not ( = ?auto_226700 ?auto_226704 ) ) ( not ( = ?auto_226701 ?auto_226702 ) ) ( not ( = ?auto_226701 ?auto_226703 ) ) ( not ( = ?auto_226701 ?auto_226704 ) ) ( not ( = ?auto_226702 ?auto_226703 ) ) ( not ( = ?auto_226702 ?auto_226704 ) ) ( not ( = ?auto_226703 ?auto_226704 ) ) ( ON ?auto_226702 ?auto_226703 ) ( ON ?auto_226701 ?auto_226702 ) ( ON ?auto_226700 ?auto_226701 ) ( ON ?auto_226699 ?auto_226700 ) ( ON ?auto_226698 ?auto_226699 ) ( CLEAR ?auto_226698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226698 )
      ( MAKE-6PILE ?auto_226698 ?auto_226699 ?auto_226700 ?auto_226701 ?auto_226702 ?auto_226703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_226711 - BLOCK
      ?auto_226712 - BLOCK
      ?auto_226713 - BLOCK
      ?auto_226714 - BLOCK
      ?auto_226715 - BLOCK
      ?auto_226716 - BLOCK
    )
    :vars
    (
      ?auto_226717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226716 ?auto_226717 ) ( not ( = ?auto_226711 ?auto_226712 ) ) ( not ( = ?auto_226711 ?auto_226713 ) ) ( not ( = ?auto_226711 ?auto_226714 ) ) ( not ( = ?auto_226711 ?auto_226715 ) ) ( not ( = ?auto_226711 ?auto_226716 ) ) ( not ( = ?auto_226711 ?auto_226717 ) ) ( not ( = ?auto_226712 ?auto_226713 ) ) ( not ( = ?auto_226712 ?auto_226714 ) ) ( not ( = ?auto_226712 ?auto_226715 ) ) ( not ( = ?auto_226712 ?auto_226716 ) ) ( not ( = ?auto_226712 ?auto_226717 ) ) ( not ( = ?auto_226713 ?auto_226714 ) ) ( not ( = ?auto_226713 ?auto_226715 ) ) ( not ( = ?auto_226713 ?auto_226716 ) ) ( not ( = ?auto_226713 ?auto_226717 ) ) ( not ( = ?auto_226714 ?auto_226715 ) ) ( not ( = ?auto_226714 ?auto_226716 ) ) ( not ( = ?auto_226714 ?auto_226717 ) ) ( not ( = ?auto_226715 ?auto_226716 ) ) ( not ( = ?auto_226715 ?auto_226717 ) ) ( not ( = ?auto_226716 ?auto_226717 ) ) ( ON ?auto_226715 ?auto_226716 ) ( ON ?auto_226714 ?auto_226715 ) ( ON ?auto_226713 ?auto_226714 ) ( ON ?auto_226712 ?auto_226713 ) ( ON ?auto_226711 ?auto_226712 ) ( CLEAR ?auto_226711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226711 )
      ( MAKE-6PILE ?auto_226711 ?auto_226712 ?auto_226713 ?auto_226714 ?auto_226715 ?auto_226716 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226725 - BLOCK
      ?auto_226726 - BLOCK
      ?auto_226727 - BLOCK
      ?auto_226728 - BLOCK
      ?auto_226729 - BLOCK
      ?auto_226730 - BLOCK
      ?auto_226731 - BLOCK
    )
    :vars
    (
      ?auto_226732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226730 ) ( ON ?auto_226731 ?auto_226732 ) ( CLEAR ?auto_226731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226725 ) ( ON ?auto_226726 ?auto_226725 ) ( ON ?auto_226727 ?auto_226726 ) ( ON ?auto_226728 ?auto_226727 ) ( ON ?auto_226729 ?auto_226728 ) ( ON ?auto_226730 ?auto_226729 ) ( not ( = ?auto_226725 ?auto_226726 ) ) ( not ( = ?auto_226725 ?auto_226727 ) ) ( not ( = ?auto_226725 ?auto_226728 ) ) ( not ( = ?auto_226725 ?auto_226729 ) ) ( not ( = ?auto_226725 ?auto_226730 ) ) ( not ( = ?auto_226725 ?auto_226731 ) ) ( not ( = ?auto_226725 ?auto_226732 ) ) ( not ( = ?auto_226726 ?auto_226727 ) ) ( not ( = ?auto_226726 ?auto_226728 ) ) ( not ( = ?auto_226726 ?auto_226729 ) ) ( not ( = ?auto_226726 ?auto_226730 ) ) ( not ( = ?auto_226726 ?auto_226731 ) ) ( not ( = ?auto_226726 ?auto_226732 ) ) ( not ( = ?auto_226727 ?auto_226728 ) ) ( not ( = ?auto_226727 ?auto_226729 ) ) ( not ( = ?auto_226727 ?auto_226730 ) ) ( not ( = ?auto_226727 ?auto_226731 ) ) ( not ( = ?auto_226727 ?auto_226732 ) ) ( not ( = ?auto_226728 ?auto_226729 ) ) ( not ( = ?auto_226728 ?auto_226730 ) ) ( not ( = ?auto_226728 ?auto_226731 ) ) ( not ( = ?auto_226728 ?auto_226732 ) ) ( not ( = ?auto_226729 ?auto_226730 ) ) ( not ( = ?auto_226729 ?auto_226731 ) ) ( not ( = ?auto_226729 ?auto_226732 ) ) ( not ( = ?auto_226730 ?auto_226731 ) ) ( not ( = ?auto_226730 ?auto_226732 ) ) ( not ( = ?auto_226731 ?auto_226732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226731 ?auto_226732 )
      ( !STACK ?auto_226731 ?auto_226730 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226740 - BLOCK
      ?auto_226741 - BLOCK
      ?auto_226742 - BLOCK
      ?auto_226743 - BLOCK
      ?auto_226744 - BLOCK
      ?auto_226745 - BLOCK
      ?auto_226746 - BLOCK
    )
    :vars
    (
      ?auto_226747 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226745 ) ( ON ?auto_226746 ?auto_226747 ) ( CLEAR ?auto_226746 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226740 ) ( ON ?auto_226741 ?auto_226740 ) ( ON ?auto_226742 ?auto_226741 ) ( ON ?auto_226743 ?auto_226742 ) ( ON ?auto_226744 ?auto_226743 ) ( ON ?auto_226745 ?auto_226744 ) ( not ( = ?auto_226740 ?auto_226741 ) ) ( not ( = ?auto_226740 ?auto_226742 ) ) ( not ( = ?auto_226740 ?auto_226743 ) ) ( not ( = ?auto_226740 ?auto_226744 ) ) ( not ( = ?auto_226740 ?auto_226745 ) ) ( not ( = ?auto_226740 ?auto_226746 ) ) ( not ( = ?auto_226740 ?auto_226747 ) ) ( not ( = ?auto_226741 ?auto_226742 ) ) ( not ( = ?auto_226741 ?auto_226743 ) ) ( not ( = ?auto_226741 ?auto_226744 ) ) ( not ( = ?auto_226741 ?auto_226745 ) ) ( not ( = ?auto_226741 ?auto_226746 ) ) ( not ( = ?auto_226741 ?auto_226747 ) ) ( not ( = ?auto_226742 ?auto_226743 ) ) ( not ( = ?auto_226742 ?auto_226744 ) ) ( not ( = ?auto_226742 ?auto_226745 ) ) ( not ( = ?auto_226742 ?auto_226746 ) ) ( not ( = ?auto_226742 ?auto_226747 ) ) ( not ( = ?auto_226743 ?auto_226744 ) ) ( not ( = ?auto_226743 ?auto_226745 ) ) ( not ( = ?auto_226743 ?auto_226746 ) ) ( not ( = ?auto_226743 ?auto_226747 ) ) ( not ( = ?auto_226744 ?auto_226745 ) ) ( not ( = ?auto_226744 ?auto_226746 ) ) ( not ( = ?auto_226744 ?auto_226747 ) ) ( not ( = ?auto_226745 ?auto_226746 ) ) ( not ( = ?auto_226745 ?auto_226747 ) ) ( not ( = ?auto_226746 ?auto_226747 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226746 ?auto_226747 )
      ( !STACK ?auto_226746 ?auto_226745 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226755 - BLOCK
      ?auto_226756 - BLOCK
      ?auto_226757 - BLOCK
      ?auto_226758 - BLOCK
      ?auto_226759 - BLOCK
      ?auto_226760 - BLOCK
      ?auto_226761 - BLOCK
    )
    :vars
    (
      ?auto_226762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226761 ?auto_226762 ) ( ON-TABLE ?auto_226755 ) ( ON ?auto_226756 ?auto_226755 ) ( ON ?auto_226757 ?auto_226756 ) ( ON ?auto_226758 ?auto_226757 ) ( ON ?auto_226759 ?auto_226758 ) ( not ( = ?auto_226755 ?auto_226756 ) ) ( not ( = ?auto_226755 ?auto_226757 ) ) ( not ( = ?auto_226755 ?auto_226758 ) ) ( not ( = ?auto_226755 ?auto_226759 ) ) ( not ( = ?auto_226755 ?auto_226760 ) ) ( not ( = ?auto_226755 ?auto_226761 ) ) ( not ( = ?auto_226755 ?auto_226762 ) ) ( not ( = ?auto_226756 ?auto_226757 ) ) ( not ( = ?auto_226756 ?auto_226758 ) ) ( not ( = ?auto_226756 ?auto_226759 ) ) ( not ( = ?auto_226756 ?auto_226760 ) ) ( not ( = ?auto_226756 ?auto_226761 ) ) ( not ( = ?auto_226756 ?auto_226762 ) ) ( not ( = ?auto_226757 ?auto_226758 ) ) ( not ( = ?auto_226757 ?auto_226759 ) ) ( not ( = ?auto_226757 ?auto_226760 ) ) ( not ( = ?auto_226757 ?auto_226761 ) ) ( not ( = ?auto_226757 ?auto_226762 ) ) ( not ( = ?auto_226758 ?auto_226759 ) ) ( not ( = ?auto_226758 ?auto_226760 ) ) ( not ( = ?auto_226758 ?auto_226761 ) ) ( not ( = ?auto_226758 ?auto_226762 ) ) ( not ( = ?auto_226759 ?auto_226760 ) ) ( not ( = ?auto_226759 ?auto_226761 ) ) ( not ( = ?auto_226759 ?auto_226762 ) ) ( not ( = ?auto_226760 ?auto_226761 ) ) ( not ( = ?auto_226760 ?auto_226762 ) ) ( not ( = ?auto_226761 ?auto_226762 ) ) ( CLEAR ?auto_226759 ) ( ON ?auto_226760 ?auto_226761 ) ( CLEAR ?auto_226760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_226755 ?auto_226756 ?auto_226757 ?auto_226758 ?auto_226759 ?auto_226760 )
      ( MAKE-7PILE ?auto_226755 ?auto_226756 ?auto_226757 ?auto_226758 ?auto_226759 ?auto_226760 ?auto_226761 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226770 - BLOCK
      ?auto_226771 - BLOCK
      ?auto_226772 - BLOCK
      ?auto_226773 - BLOCK
      ?auto_226774 - BLOCK
      ?auto_226775 - BLOCK
      ?auto_226776 - BLOCK
    )
    :vars
    (
      ?auto_226777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226776 ?auto_226777 ) ( ON-TABLE ?auto_226770 ) ( ON ?auto_226771 ?auto_226770 ) ( ON ?auto_226772 ?auto_226771 ) ( ON ?auto_226773 ?auto_226772 ) ( ON ?auto_226774 ?auto_226773 ) ( not ( = ?auto_226770 ?auto_226771 ) ) ( not ( = ?auto_226770 ?auto_226772 ) ) ( not ( = ?auto_226770 ?auto_226773 ) ) ( not ( = ?auto_226770 ?auto_226774 ) ) ( not ( = ?auto_226770 ?auto_226775 ) ) ( not ( = ?auto_226770 ?auto_226776 ) ) ( not ( = ?auto_226770 ?auto_226777 ) ) ( not ( = ?auto_226771 ?auto_226772 ) ) ( not ( = ?auto_226771 ?auto_226773 ) ) ( not ( = ?auto_226771 ?auto_226774 ) ) ( not ( = ?auto_226771 ?auto_226775 ) ) ( not ( = ?auto_226771 ?auto_226776 ) ) ( not ( = ?auto_226771 ?auto_226777 ) ) ( not ( = ?auto_226772 ?auto_226773 ) ) ( not ( = ?auto_226772 ?auto_226774 ) ) ( not ( = ?auto_226772 ?auto_226775 ) ) ( not ( = ?auto_226772 ?auto_226776 ) ) ( not ( = ?auto_226772 ?auto_226777 ) ) ( not ( = ?auto_226773 ?auto_226774 ) ) ( not ( = ?auto_226773 ?auto_226775 ) ) ( not ( = ?auto_226773 ?auto_226776 ) ) ( not ( = ?auto_226773 ?auto_226777 ) ) ( not ( = ?auto_226774 ?auto_226775 ) ) ( not ( = ?auto_226774 ?auto_226776 ) ) ( not ( = ?auto_226774 ?auto_226777 ) ) ( not ( = ?auto_226775 ?auto_226776 ) ) ( not ( = ?auto_226775 ?auto_226777 ) ) ( not ( = ?auto_226776 ?auto_226777 ) ) ( CLEAR ?auto_226774 ) ( ON ?auto_226775 ?auto_226776 ) ( CLEAR ?auto_226775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_226770 ?auto_226771 ?auto_226772 ?auto_226773 ?auto_226774 ?auto_226775 )
      ( MAKE-7PILE ?auto_226770 ?auto_226771 ?auto_226772 ?auto_226773 ?auto_226774 ?auto_226775 ?auto_226776 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226785 - BLOCK
      ?auto_226786 - BLOCK
      ?auto_226787 - BLOCK
      ?auto_226788 - BLOCK
      ?auto_226789 - BLOCK
      ?auto_226790 - BLOCK
      ?auto_226791 - BLOCK
    )
    :vars
    (
      ?auto_226792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226791 ?auto_226792 ) ( ON-TABLE ?auto_226785 ) ( ON ?auto_226786 ?auto_226785 ) ( ON ?auto_226787 ?auto_226786 ) ( ON ?auto_226788 ?auto_226787 ) ( not ( = ?auto_226785 ?auto_226786 ) ) ( not ( = ?auto_226785 ?auto_226787 ) ) ( not ( = ?auto_226785 ?auto_226788 ) ) ( not ( = ?auto_226785 ?auto_226789 ) ) ( not ( = ?auto_226785 ?auto_226790 ) ) ( not ( = ?auto_226785 ?auto_226791 ) ) ( not ( = ?auto_226785 ?auto_226792 ) ) ( not ( = ?auto_226786 ?auto_226787 ) ) ( not ( = ?auto_226786 ?auto_226788 ) ) ( not ( = ?auto_226786 ?auto_226789 ) ) ( not ( = ?auto_226786 ?auto_226790 ) ) ( not ( = ?auto_226786 ?auto_226791 ) ) ( not ( = ?auto_226786 ?auto_226792 ) ) ( not ( = ?auto_226787 ?auto_226788 ) ) ( not ( = ?auto_226787 ?auto_226789 ) ) ( not ( = ?auto_226787 ?auto_226790 ) ) ( not ( = ?auto_226787 ?auto_226791 ) ) ( not ( = ?auto_226787 ?auto_226792 ) ) ( not ( = ?auto_226788 ?auto_226789 ) ) ( not ( = ?auto_226788 ?auto_226790 ) ) ( not ( = ?auto_226788 ?auto_226791 ) ) ( not ( = ?auto_226788 ?auto_226792 ) ) ( not ( = ?auto_226789 ?auto_226790 ) ) ( not ( = ?auto_226789 ?auto_226791 ) ) ( not ( = ?auto_226789 ?auto_226792 ) ) ( not ( = ?auto_226790 ?auto_226791 ) ) ( not ( = ?auto_226790 ?auto_226792 ) ) ( not ( = ?auto_226791 ?auto_226792 ) ) ( ON ?auto_226790 ?auto_226791 ) ( CLEAR ?auto_226788 ) ( ON ?auto_226789 ?auto_226790 ) ( CLEAR ?auto_226789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_226785 ?auto_226786 ?auto_226787 ?auto_226788 ?auto_226789 )
      ( MAKE-7PILE ?auto_226785 ?auto_226786 ?auto_226787 ?auto_226788 ?auto_226789 ?auto_226790 ?auto_226791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226800 - BLOCK
      ?auto_226801 - BLOCK
      ?auto_226802 - BLOCK
      ?auto_226803 - BLOCK
      ?auto_226804 - BLOCK
      ?auto_226805 - BLOCK
      ?auto_226806 - BLOCK
    )
    :vars
    (
      ?auto_226807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226806 ?auto_226807 ) ( ON-TABLE ?auto_226800 ) ( ON ?auto_226801 ?auto_226800 ) ( ON ?auto_226802 ?auto_226801 ) ( ON ?auto_226803 ?auto_226802 ) ( not ( = ?auto_226800 ?auto_226801 ) ) ( not ( = ?auto_226800 ?auto_226802 ) ) ( not ( = ?auto_226800 ?auto_226803 ) ) ( not ( = ?auto_226800 ?auto_226804 ) ) ( not ( = ?auto_226800 ?auto_226805 ) ) ( not ( = ?auto_226800 ?auto_226806 ) ) ( not ( = ?auto_226800 ?auto_226807 ) ) ( not ( = ?auto_226801 ?auto_226802 ) ) ( not ( = ?auto_226801 ?auto_226803 ) ) ( not ( = ?auto_226801 ?auto_226804 ) ) ( not ( = ?auto_226801 ?auto_226805 ) ) ( not ( = ?auto_226801 ?auto_226806 ) ) ( not ( = ?auto_226801 ?auto_226807 ) ) ( not ( = ?auto_226802 ?auto_226803 ) ) ( not ( = ?auto_226802 ?auto_226804 ) ) ( not ( = ?auto_226802 ?auto_226805 ) ) ( not ( = ?auto_226802 ?auto_226806 ) ) ( not ( = ?auto_226802 ?auto_226807 ) ) ( not ( = ?auto_226803 ?auto_226804 ) ) ( not ( = ?auto_226803 ?auto_226805 ) ) ( not ( = ?auto_226803 ?auto_226806 ) ) ( not ( = ?auto_226803 ?auto_226807 ) ) ( not ( = ?auto_226804 ?auto_226805 ) ) ( not ( = ?auto_226804 ?auto_226806 ) ) ( not ( = ?auto_226804 ?auto_226807 ) ) ( not ( = ?auto_226805 ?auto_226806 ) ) ( not ( = ?auto_226805 ?auto_226807 ) ) ( not ( = ?auto_226806 ?auto_226807 ) ) ( ON ?auto_226805 ?auto_226806 ) ( CLEAR ?auto_226803 ) ( ON ?auto_226804 ?auto_226805 ) ( CLEAR ?auto_226804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_226800 ?auto_226801 ?auto_226802 ?auto_226803 ?auto_226804 )
      ( MAKE-7PILE ?auto_226800 ?auto_226801 ?auto_226802 ?auto_226803 ?auto_226804 ?auto_226805 ?auto_226806 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226815 - BLOCK
      ?auto_226816 - BLOCK
      ?auto_226817 - BLOCK
      ?auto_226818 - BLOCK
      ?auto_226819 - BLOCK
      ?auto_226820 - BLOCK
      ?auto_226821 - BLOCK
    )
    :vars
    (
      ?auto_226822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226821 ?auto_226822 ) ( ON-TABLE ?auto_226815 ) ( ON ?auto_226816 ?auto_226815 ) ( ON ?auto_226817 ?auto_226816 ) ( not ( = ?auto_226815 ?auto_226816 ) ) ( not ( = ?auto_226815 ?auto_226817 ) ) ( not ( = ?auto_226815 ?auto_226818 ) ) ( not ( = ?auto_226815 ?auto_226819 ) ) ( not ( = ?auto_226815 ?auto_226820 ) ) ( not ( = ?auto_226815 ?auto_226821 ) ) ( not ( = ?auto_226815 ?auto_226822 ) ) ( not ( = ?auto_226816 ?auto_226817 ) ) ( not ( = ?auto_226816 ?auto_226818 ) ) ( not ( = ?auto_226816 ?auto_226819 ) ) ( not ( = ?auto_226816 ?auto_226820 ) ) ( not ( = ?auto_226816 ?auto_226821 ) ) ( not ( = ?auto_226816 ?auto_226822 ) ) ( not ( = ?auto_226817 ?auto_226818 ) ) ( not ( = ?auto_226817 ?auto_226819 ) ) ( not ( = ?auto_226817 ?auto_226820 ) ) ( not ( = ?auto_226817 ?auto_226821 ) ) ( not ( = ?auto_226817 ?auto_226822 ) ) ( not ( = ?auto_226818 ?auto_226819 ) ) ( not ( = ?auto_226818 ?auto_226820 ) ) ( not ( = ?auto_226818 ?auto_226821 ) ) ( not ( = ?auto_226818 ?auto_226822 ) ) ( not ( = ?auto_226819 ?auto_226820 ) ) ( not ( = ?auto_226819 ?auto_226821 ) ) ( not ( = ?auto_226819 ?auto_226822 ) ) ( not ( = ?auto_226820 ?auto_226821 ) ) ( not ( = ?auto_226820 ?auto_226822 ) ) ( not ( = ?auto_226821 ?auto_226822 ) ) ( ON ?auto_226820 ?auto_226821 ) ( ON ?auto_226819 ?auto_226820 ) ( CLEAR ?auto_226817 ) ( ON ?auto_226818 ?auto_226819 ) ( CLEAR ?auto_226818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_226815 ?auto_226816 ?auto_226817 ?auto_226818 )
      ( MAKE-7PILE ?auto_226815 ?auto_226816 ?auto_226817 ?auto_226818 ?auto_226819 ?auto_226820 ?auto_226821 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226830 - BLOCK
      ?auto_226831 - BLOCK
      ?auto_226832 - BLOCK
      ?auto_226833 - BLOCK
      ?auto_226834 - BLOCK
      ?auto_226835 - BLOCK
      ?auto_226836 - BLOCK
    )
    :vars
    (
      ?auto_226837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226836 ?auto_226837 ) ( ON-TABLE ?auto_226830 ) ( ON ?auto_226831 ?auto_226830 ) ( ON ?auto_226832 ?auto_226831 ) ( not ( = ?auto_226830 ?auto_226831 ) ) ( not ( = ?auto_226830 ?auto_226832 ) ) ( not ( = ?auto_226830 ?auto_226833 ) ) ( not ( = ?auto_226830 ?auto_226834 ) ) ( not ( = ?auto_226830 ?auto_226835 ) ) ( not ( = ?auto_226830 ?auto_226836 ) ) ( not ( = ?auto_226830 ?auto_226837 ) ) ( not ( = ?auto_226831 ?auto_226832 ) ) ( not ( = ?auto_226831 ?auto_226833 ) ) ( not ( = ?auto_226831 ?auto_226834 ) ) ( not ( = ?auto_226831 ?auto_226835 ) ) ( not ( = ?auto_226831 ?auto_226836 ) ) ( not ( = ?auto_226831 ?auto_226837 ) ) ( not ( = ?auto_226832 ?auto_226833 ) ) ( not ( = ?auto_226832 ?auto_226834 ) ) ( not ( = ?auto_226832 ?auto_226835 ) ) ( not ( = ?auto_226832 ?auto_226836 ) ) ( not ( = ?auto_226832 ?auto_226837 ) ) ( not ( = ?auto_226833 ?auto_226834 ) ) ( not ( = ?auto_226833 ?auto_226835 ) ) ( not ( = ?auto_226833 ?auto_226836 ) ) ( not ( = ?auto_226833 ?auto_226837 ) ) ( not ( = ?auto_226834 ?auto_226835 ) ) ( not ( = ?auto_226834 ?auto_226836 ) ) ( not ( = ?auto_226834 ?auto_226837 ) ) ( not ( = ?auto_226835 ?auto_226836 ) ) ( not ( = ?auto_226835 ?auto_226837 ) ) ( not ( = ?auto_226836 ?auto_226837 ) ) ( ON ?auto_226835 ?auto_226836 ) ( ON ?auto_226834 ?auto_226835 ) ( CLEAR ?auto_226832 ) ( ON ?auto_226833 ?auto_226834 ) ( CLEAR ?auto_226833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_226830 ?auto_226831 ?auto_226832 ?auto_226833 )
      ( MAKE-7PILE ?auto_226830 ?auto_226831 ?auto_226832 ?auto_226833 ?auto_226834 ?auto_226835 ?auto_226836 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226845 - BLOCK
      ?auto_226846 - BLOCK
      ?auto_226847 - BLOCK
      ?auto_226848 - BLOCK
      ?auto_226849 - BLOCK
      ?auto_226850 - BLOCK
      ?auto_226851 - BLOCK
    )
    :vars
    (
      ?auto_226852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226851 ?auto_226852 ) ( ON-TABLE ?auto_226845 ) ( ON ?auto_226846 ?auto_226845 ) ( not ( = ?auto_226845 ?auto_226846 ) ) ( not ( = ?auto_226845 ?auto_226847 ) ) ( not ( = ?auto_226845 ?auto_226848 ) ) ( not ( = ?auto_226845 ?auto_226849 ) ) ( not ( = ?auto_226845 ?auto_226850 ) ) ( not ( = ?auto_226845 ?auto_226851 ) ) ( not ( = ?auto_226845 ?auto_226852 ) ) ( not ( = ?auto_226846 ?auto_226847 ) ) ( not ( = ?auto_226846 ?auto_226848 ) ) ( not ( = ?auto_226846 ?auto_226849 ) ) ( not ( = ?auto_226846 ?auto_226850 ) ) ( not ( = ?auto_226846 ?auto_226851 ) ) ( not ( = ?auto_226846 ?auto_226852 ) ) ( not ( = ?auto_226847 ?auto_226848 ) ) ( not ( = ?auto_226847 ?auto_226849 ) ) ( not ( = ?auto_226847 ?auto_226850 ) ) ( not ( = ?auto_226847 ?auto_226851 ) ) ( not ( = ?auto_226847 ?auto_226852 ) ) ( not ( = ?auto_226848 ?auto_226849 ) ) ( not ( = ?auto_226848 ?auto_226850 ) ) ( not ( = ?auto_226848 ?auto_226851 ) ) ( not ( = ?auto_226848 ?auto_226852 ) ) ( not ( = ?auto_226849 ?auto_226850 ) ) ( not ( = ?auto_226849 ?auto_226851 ) ) ( not ( = ?auto_226849 ?auto_226852 ) ) ( not ( = ?auto_226850 ?auto_226851 ) ) ( not ( = ?auto_226850 ?auto_226852 ) ) ( not ( = ?auto_226851 ?auto_226852 ) ) ( ON ?auto_226850 ?auto_226851 ) ( ON ?auto_226849 ?auto_226850 ) ( ON ?auto_226848 ?auto_226849 ) ( CLEAR ?auto_226846 ) ( ON ?auto_226847 ?auto_226848 ) ( CLEAR ?auto_226847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_226845 ?auto_226846 ?auto_226847 )
      ( MAKE-7PILE ?auto_226845 ?auto_226846 ?auto_226847 ?auto_226848 ?auto_226849 ?auto_226850 ?auto_226851 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226860 - BLOCK
      ?auto_226861 - BLOCK
      ?auto_226862 - BLOCK
      ?auto_226863 - BLOCK
      ?auto_226864 - BLOCK
      ?auto_226865 - BLOCK
      ?auto_226866 - BLOCK
    )
    :vars
    (
      ?auto_226867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226866 ?auto_226867 ) ( ON-TABLE ?auto_226860 ) ( ON ?auto_226861 ?auto_226860 ) ( not ( = ?auto_226860 ?auto_226861 ) ) ( not ( = ?auto_226860 ?auto_226862 ) ) ( not ( = ?auto_226860 ?auto_226863 ) ) ( not ( = ?auto_226860 ?auto_226864 ) ) ( not ( = ?auto_226860 ?auto_226865 ) ) ( not ( = ?auto_226860 ?auto_226866 ) ) ( not ( = ?auto_226860 ?auto_226867 ) ) ( not ( = ?auto_226861 ?auto_226862 ) ) ( not ( = ?auto_226861 ?auto_226863 ) ) ( not ( = ?auto_226861 ?auto_226864 ) ) ( not ( = ?auto_226861 ?auto_226865 ) ) ( not ( = ?auto_226861 ?auto_226866 ) ) ( not ( = ?auto_226861 ?auto_226867 ) ) ( not ( = ?auto_226862 ?auto_226863 ) ) ( not ( = ?auto_226862 ?auto_226864 ) ) ( not ( = ?auto_226862 ?auto_226865 ) ) ( not ( = ?auto_226862 ?auto_226866 ) ) ( not ( = ?auto_226862 ?auto_226867 ) ) ( not ( = ?auto_226863 ?auto_226864 ) ) ( not ( = ?auto_226863 ?auto_226865 ) ) ( not ( = ?auto_226863 ?auto_226866 ) ) ( not ( = ?auto_226863 ?auto_226867 ) ) ( not ( = ?auto_226864 ?auto_226865 ) ) ( not ( = ?auto_226864 ?auto_226866 ) ) ( not ( = ?auto_226864 ?auto_226867 ) ) ( not ( = ?auto_226865 ?auto_226866 ) ) ( not ( = ?auto_226865 ?auto_226867 ) ) ( not ( = ?auto_226866 ?auto_226867 ) ) ( ON ?auto_226865 ?auto_226866 ) ( ON ?auto_226864 ?auto_226865 ) ( ON ?auto_226863 ?auto_226864 ) ( CLEAR ?auto_226861 ) ( ON ?auto_226862 ?auto_226863 ) ( CLEAR ?auto_226862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_226860 ?auto_226861 ?auto_226862 )
      ( MAKE-7PILE ?auto_226860 ?auto_226861 ?auto_226862 ?auto_226863 ?auto_226864 ?auto_226865 ?auto_226866 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226875 - BLOCK
      ?auto_226876 - BLOCK
      ?auto_226877 - BLOCK
      ?auto_226878 - BLOCK
      ?auto_226879 - BLOCK
      ?auto_226880 - BLOCK
      ?auto_226881 - BLOCK
    )
    :vars
    (
      ?auto_226882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226881 ?auto_226882 ) ( ON-TABLE ?auto_226875 ) ( not ( = ?auto_226875 ?auto_226876 ) ) ( not ( = ?auto_226875 ?auto_226877 ) ) ( not ( = ?auto_226875 ?auto_226878 ) ) ( not ( = ?auto_226875 ?auto_226879 ) ) ( not ( = ?auto_226875 ?auto_226880 ) ) ( not ( = ?auto_226875 ?auto_226881 ) ) ( not ( = ?auto_226875 ?auto_226882 ) ) ( not ( = ?auto_226876 ?auto_226877 ) ) ( not ( = ?auto_226876 ?auto_226878 ) ) ( not ( = ?auto_226876 ?auto_226879 ) ) ( not ( = ?auto_226876 ?auto_226880 ) ) ( not ( = ?auto_226876 ?auto_226881 ) ) ( not ( = ?auto_226876 ?auto_226882 ) ) ( not ( = ?auto_226877 ?auto_226878 ) ) ( not ( = ?auto_226877 ?auto_226879 ) ) ( not ( = ?auto_226877 ?auto_226880 ) ) ( not ( = ?auto_226877 ?auto_226881 ) ) ( not ( = ?auto_226877 ?auto_226882 ) ) ( not ( = ?auto_226878 ?auto_226879 ) ) ( not ( = ?auto_226878 ?auto_226880 ) ) ( not ( = ?auto_226878 ?auto_226881 ) ) ( not ( = ?auto_226878 ?auto_226882 ) ) ( not ( = ?auto_226879 ?auto_226880 ) ) ( not ( = ?auto_226879 ?auto_226881 ) ) ( not ( = ?auto_226879 ?auto_226882 ) ) ( not ( = ?auto_226880 ?auto_226881 ) ) ( not ( = ?auto_226880 ?auto_226882 ) ) ( not ( = ?auto_226881 ?auto_226882 ) ) ( ON ?auto_226880 ?auto_226881 ) ( ON ?auto_226879 ?auto_226880 ) ( ON ?auto_226878 ?auto_226879 ) ( ON ?auto_226877 ?auto_226878 ) ( CLEAR ?auto_226875 ) ( ON ?auto_226876 ?auto_226877 ) ( CLEAR ?auto_226876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226875 ?auto_226876 )
      ( MAKE-7PILE ?auto_226875 ?auto_226876 ?auto_226877 ?auto_226878 ?auto_226879 ?auto_226880 ?auto_226881 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226890 - BLOCK
      ?auto_226891 - BLOCK
      ?auto_226892 - BLOCK
      ?auto_226893 - BLOCK
      ?auto_226894 - BLOCK
      ?auto_226895 - BLOCK
      ?auto_226896 - BLOCK
    )
    :vars
    (
      ?auto_226897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226896 ?auto_226897 ) ( ON-TABLE ?auto_226890 ) ( not ( = ?auto_226890 ?auto_226891 ) ) ( not ( = ?auto_226890 ?auto_226892 ) ) ( not ( = ?auto_226890 ?auto_226893 ) ) ( not ( = ?auto_226890 ?auto_226894 ) ) ( not ( = ?auto_226890 ?auto_226895 ) ) ( not ( = ?auto_226890 ?auto_226896 ) ) ( not ( = ?auto_226890 ?auto_226897 ) ) ( not ( = ?auto_226891 ?auto_226892 ) ) ( not ( = ?auto_226891 ?auto_226893 ) ) ( not ( = ?auto_226891 ?auto_226894 ) ) ( not ( = ?auto_226891 ?auto_226895 ) ) ( not ( = ?auto_226891 ?auto_226896 ) ) ( not ( = ?auto_226891 ?auto_226897 ) ) ( not ( = ?auto_226892 ?auto_226893 ) ) ( not ( = ?auto_226892 ?auto_226894 ) ) ( not ( = ?auto_226892 ?auto_226895 ) ) ( not ( = ?auto_226892 ?auto_226896 ) ) ( not ( = ?auto_226892 ?auto_226897 ) ) ( not ( = ?auto_226893 ?auto_226894 ) ) ( not ( = ?auto_226893 ?auto_226895 ) ) ( not ( = ?auto_226893 ?auto_226896 ) ) ( not ( = ?auto_226893 ?auto_226897 ) ) ( not ( = ?auto_226894 ?auto_226895 ) ) ( not ( = ?auto_226894 ?auto_226896 ) ) ( not ( = ?auto_226894 ?auto_226897 ) ) ( not ( = ?auto_226895 ?auto_226896 ) ) ( not ( = ?auto_226895 ?auto_226897 ) ) ( not ( = ?auto_226896 ?auto_226897 ) ) ( ON ?auto_226895 ?auto_226896 ) ( ON ?auto_226894 ?auto_226895 ) ( ON ?auto_226893 ?auto_226894 ) ( ON ?auto_226892 ?auto_226893 ) ( CLEAR ?auto_226890 ) ( ON ?auto_226891 ?auto_226892 ) ( CLEAR ?auto_226891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_226890 ?auto_226891 )
      ( MAKE-7PILE ?auto_226890 ?auto_226891 ?auto_226892 ?auto_226893 ?auto_226894 ?auto_226895 ?auto_226896 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226905 - BLOCK
      ?auto_226906 - BLOCK
      ?auto_226907 - BLOCK
      ?auto_226908 - BLOCK
      ?auto_226909 - BLOCK
      ?auto_226910 - BLOCK
      ?auto_226911 - BLOCK
    )
    :vars
    (
      ?auto_226912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226911 ?auto_226912 ) ( not ( = ?auto_226905 ?auto_226906 ) ) ( not ( = ?auto_226905 ?auto_226907 ) ) ( not ( = ?auto_226905 ?auto_226908 ) ) ( not ( = ?auto_226905 ?auto_226909 ) ) ( not ( = ?auto_226905 ?auto_226910 ) ) ( not ( = ?auto_226905 ?auto_226911 ) ) ( not ( = ?auto_226905 ?auto_226912 ) ) ( not ( = ?auto_226906 ?auto_226907 ) ) ( not ( = ?auto_226906 ?auto_226908 ) ) ( not ( = ?auto_226906 ?auto_226909 ) ) ( not ( = ?auto_226906 ?auto_226910 ) ) ( not ( = ?auto_226906 ?auto_226911 ) ) ( not ( = ?auto_226906 ?auto_226912 ) ) ( not ( = ?auto_226907 ?auto_226908 ) ) ( not ( = ?auto_226907 ?auto_226909 ) ) ( not ( = ?auto_226907 ?auto_226910 ) ) ( not ( = ?auto_226907 ?auto_226911 ) ) ( not ( = ?auto_226907 ?auto_226912 ) ) ( not ( = ?auto_226908 ?auto_226909 ) ) ( not ( = ?auto_226908 ?auto_226910 ) ) ( not ( = ?auto_226908 ?auto_226911 ) ) ( not ( = ?auto_226908 ?auto_226912 ) ) ( not ( = ?auto_226909 ?auto_226910 ) ) ( not ( = ?auto_226909 ?auto_226911 ) ) ( not ( = ?auto_226909 ?auto_226912 ) ) ( not ( = ?auto_226910 ?auto_226911 ) ) ( not ( = ?auto_226910 ?auto_226912 ) ) ( not ( = ?auto_226911 ?auto_226912 ) ) ( ON ?auto_226910 ?auto_226911 ) ( ON ?auto_226909 ?auto_226910 ) ( ON ?auto_226908 ?auto_226909 ) ( ON ?auto_226907 ?auto_226908 ) ( ON ?auto_226906 ?auto_226907 ) ( ON ?auto_226905 ?auto_226906 ) ( CLEAR ?auto_226905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226905 )
      ( MAKE-7PILE ?auto_226905 ?auto_226906 ?auto_226907 ?auto_226908 ?auto_226909 ?auto_226910 ?auto_226911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_226920 - BLOCK
      ?auto_226921 - BLOCK
      ?auto_226922 - BLOCK
      ?auto_226923 - BLOCK
      ?auto_226924 - BLOCK
      ?auto_226925 - BLOCK
      ?auto_226926 - BLOCK
    )
    :vars
    (
      ?auto_226927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226926 ?auto_226927 ) ( not ( = ?auto_226920 ?auto_226921 ) ) ( not ( = ?auto_226920 ?auto_226922 ) ) ( not ( = ?auto_226920 ?auto_226923 ) ) ( not ( = ?auto_226920 ?auto_226924 ) ) ( not ( = ?auto_226920 ?auto_226925 ) ) ( not ( = ?auto_226920 ?auto_226926 ) ) ( not ( = ?auto_226920 ?auto_226927 ) ) ( not ( = ?auto_226921 ?auto_226922 ) ) ( not ( = ?auto_226921 ?auto_226923 ) ) ( not ( = ?auto_226921 ?auto_226924 ) ) ( not ( = ?auto_226921 ?auto_226925 ) ) ( not ( = ?auto_226921 ?auto_226926 ) ) ( not ( = ?auto_226921 ?auto_226927 ) ) ( not ( = ?auto_226922 ?auto_226923 ) ) ( not ( = ?auto_226922 ?auto_226924 ) ) ( not ( = ?auto_226922 ?auto_226925 ) ) ( not ( = ?auto_226922 ?auto_226926 ) ) ( not ( = ?auto_226922 ?auto_226927 ) ) ( not ( = ?auto_226923 ?auto_226924 ) ) ( not ( = ?auto_226923 ?auto_226925 ) ) ( not ( = ?auto_226923 ?auto_226926 ) ) ( not ( = ?auto_226923 ?auto_226927 ) ) ( not ( = ?auto_226924 ?auto_226925 ) ) ( not ( = ?auto_226924 ?auto_226926 ) ) ( not ( = ?auto_226924 ?auto_226927 ) ) ( not ( = ?auto_226925 ?auto_226926 ) ) ( not ( = ?auto_226925 ?auto_226927 ) ) ( not ( = ?auto_226926 ?auto_226927 ) ) ( ON ?auto_226925 ?auto_226926 ) ( ON ?auto_226924 ?auto_226925 ) ( ON ?auto_226923 ?auto_226924 ) ( ON ?auto_226922 ?auto_226923 ) ( ON ?auto_226921 ?auto_226922 ) ( ON ?auto_226920 ?auto_226921 ) ( CLEAR ?auto_226920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_226920 )
      ( MAKE-7PILE ?auto_226920 ?auto_226921 ?auto_226922 ?auto_226923 ?auto_226924 ?auto_226925 ?auto_226926 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_226936 - BLOCK
      ?auto_226937 - BLOCK
      ?auto_226938 - BLOCK
      ?auto_226939 - BLOCK
      ?auto_226940 - BLOCK
      ?auto_226941 - BLOCK
      ?auto_226942 - BLOCK
      ?auto_226943 - BLOCK
    )
    :vars
    (
      ?auto_226944 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226942 ) ( ON ?auto_226943 ?auto_226944 ) ( CLEAR ?auto_226943 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226936 ) ( ON ?auto_226937 ?auto_226936 ) ( ON ?auto_226938 ?auto_226937 ) ( ON ?auto_226939 ?auto_226938 ) ( ON ?auto_226940 ?auto_226939 ) ( ON ?auto_226941 ?auto_226940 ) ( ON ?auto_226942 ?auto_226941 ) ( not ( = ?auto_226936 ?auto_226937 ) ) ( not ( = ?auto_226936 ?auto_226938 ) ) ( not ( = ?auto_226936 ?auto_226939 ) ) ( not ( = ?auto_226936 ?auto_226940 ) ) ( not ( = ?auto_226936 ?auto_226941 ) ) ( not ( = ?auto_226936 ?auto_226942 ) ) ( not ( = ?auto_226936 ?auto_226943 ) ) ( not ( = ?auto_226936 ?auto_226944 ) ) ( not ( = ?auto_226937 ?auto_226938 ) ) ( not ( = ?auto_226937 ?auto_226939 ) ) ( not ( = ?auto_226937 ?auto_226940 ) ) ( not ( = ?auto_226937 ?auto_226941 ) ) ( not ( = ?auto_226937 ?auto_226942 ) ) ( not ( = ?auto_226937 ?auto_226943 ) ) ( not ( = ?auto_226937 ?auto_226944 ) ) ( not ( = ?auto_226938 ?auto_226939 ) ) ( not ( = ?auto_226938 ?auto_226940 ) ) ( not ( = ?auto_226938 ?auto_226941 ) ) ( not ( = ?auto_226938 ?auto_226942 ) ) ( not ( = ?auto_226938 ?auto_226943 ) ) ( not ( = ?auto_226938 ?auto_226944 ) ) ( not ( = ?auto_226939 ?auto_226940 ) ) ( not ( = ?auto_226939 ?auto_226941 ) ) ( not ( = ?auto_226939 ?auto_226942 ) ) ( not ( = ?auto_226939 ?auto_226943 ) ) ( not ( = ?auto_226939 ?auto_226944 ) ) ( not ( = ?auto_226940 ?auto_226941 ) ) ( not ( = ?auto_226940 ?auto_226942 ) ) ( not ( = ?auto_226940 ?auto_226943 ) ) ( not ( = ?auto_226940 ?auto_226944 ) ) ( not ( = ?auto_226941 ?auto_226942 ) ) ( not ( = ?auto_226941 ?auto_226943 ) ) ( not ( = ?auto_226941 ?auto_226944 ) ) ( not ( = ?auto_226942 ?auto_226943 ) ) ( not ( = ?auto_226942 ?auto_226944 ) ) ( not ( = ?auto_226943 ?auto_226944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226943 ?auto_226944 )
      ( !STACK ?auto_226943 ?auto_226942 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_226953 - BLOCK
      ?auto_226954 - BLOCK
      ?auto_226955 - BLOCK
      ?auto_226956 - BLOCK
      ?auto_226957 - BLOCK
      ?auto_226958 - BLOCK
      ?auto_226959 - BLOCK
      ?auto_226960 - BLOCK
    )
    :vars
    (
      ?auto_226961 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226959 ) ( ON ?auto_226960 ?auto_226961 ) ( CLEAR ?auto_226960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_226953 ) ( ON ?auto_226954 ?auto_226953 ) ( ON ?auto_226955 ?auto_226954 ) ( ON ?auto_226956 ?auto_226955 ) ( ON ?auto_226957 ?auto_226956 ) ( ON ?auto_226958 ?auto_226957 ) ( ON ?auto_226959 ?auto_226958 ) ( not ( = ?auto_226953 ?auto_226954 ) ) ( not ( = ?auto_226953 ?auto_226955 ) ) ( not ( = ?auto_226953 ?auto_226956 ) ) ( not ( = ?auto_226953 ?auto_226957 ) ) ( not ( = ?auto_226953 ?auto_226958 ) ) ( not ( = ?auto_226953 ?auto_226959 ) ) ( not ( = ?auto_226953 ?auto_226960 ) ) ( not ( = ?auto_226953 ?auto_226961 ) ) ( not ( = ?auto_226954 ?auto_226955 ) ) ( not ( = ?auto_226954 ?auto_226956 ) ) ( not ( = ?auto_226954 ?auto_226957 ) ) ( not ( = ?auto_226954 ?auto_226958 ) ) ( not ( = ?auto_226954 ?auto_226959 ) ) ( not ( = ?auto_226954 ?auto_226960 ) ) ( not ( = ?auto_226954 ?auto_226961 ) ) ( not ( = ?auto_226955 ?auto_226956 ) ) ( not ( = ?auto_226955 ?auto_226957 ) ) ( not ( = ?auto_226955 ?auto_226958 ) ) ( not ( = ?auto_226955 ?auto_226959 ) ) ( not ( = ?auto_226955 ?auto_226960 ) ) ( not ( = ?auto_226955 ?auto_226961 ) ) ( not ( = ?auto_226956 ?auto_226957 ) ) ( not ( = ?auto_226956 ?auto_226958 ) ) ( not ( = ?auto_226956 ?auto_226959 ) ) ( not ( = ?auto_226956 ?auto_226960 ) ) ( not ( = ?auto_226956 ?auto_226961 ) ) ( not ( = ?auto_226957 ?auto_226958 ) ) ( not ( = ?auto_226957 ?auto_226959 ) ) ( not ( = ?auto_226957 ?auto_226960 ) ) ( not ( = ?auto_226957 ?auto_226961 ) ) ( not ( = ?auto_226958 ?auto_226959 ) ) ( not ( = ?auto_226958 ?auto_226960 ) ) ( not ( = ?auto_226958 ?auto_226961 ) ) ( not ( = ?auto_226959 ?auto_226960 ) ) ( not ( = ?auto_226959 ?auto_226961 ) ) ( not ( = ?auto_226960 ?auto_226961 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226960 ?auto_226961 )
      ( !STACK ?auto_226960 ?auto_226959 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_226970 - BLOCK
      ?auto_226971 - BLOCK
      ?auto_226972 - BLOCK
      ?auto_226973 - BLOCK
      ?auto_226974 - BLOCK
      ?auto_226975 - BLOCK
      ?auto_226976 - BLOCK
      ?auto_226977 - BLOCK
    )
    :vars
    (
      ?auto_226978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226977 ?auto_226978 ) ( ON-TABLE ?auto_226970 ) ( ON ?auto_226971 ?auto_226970 ) ( ON ?auto_226972 ?auto_226971 ) ( ON ?auto_226973 ?auto_226972 ) ( ON ?auto_226974 ?auto_226973 ) ( ON ?auto_226975 ?auto_226974 ) ( not ( = ?auto_226970 ?auto_226971 ) ) ( not ( = ?auto_226970 ?auto_226972 ) ) ( not ( = ?auto_226970 ?auto_226973 ) ) ( not ( = ?auto_226970 ?auto_226974 ) ) ( not ( = ?auto_226970 ?auto_226975 ) ) ( not ( = ?auto_226970 ?auto_226976 ) ) ( not ( = ?auto_226970 ?auto_226977 ) ) ( not ( = ?auto_226970 ?auto_226978 ) ) ( not ( = ?auto_226971 ?auto_226972 ) ) ( not ( = ?auto_226971 ?auto_226973 ) ) ( not ( = ?auto_226971 ?auto_226974 ) ) ( not ( = ?auto_226971 ?auto_226975 ) ) ( not ( = ?auto_226971 ?auto_226976 ) ) ( not ( = ?auto_226971 ?auto_226977 ) ) ( not ( = ?auto_226971 ?auto_226978 ) ) ( not ( = ?auto_226972 ?auto_226973 ) ) ( not ( = ?auto_226972 ?auto_226974 ) ) ( not ( = ?auto_226972 ?auto_226975 ) ) ( not ( = ?auto_226972 ?auto_226976 ) ) ( not ( = ?auto_226972 ?auto_226977 ) ) ( not ( = ?auto_226972 ?auto_226978 ) ) ( not ( = ?auto_226973 ?auto_226974 ) ) ( not ( = ?auto_226973 ?auto_226975 ) ) ( not ( = ?auto_226973 ?auto_226976 ) ) ( not ( = ?auto_226973 ?auto_226977 ) ) ( not ( = ?auto_226973 ?auto_226978 ) ) ( not ( = ?auto_226974 ?auto_226975 ) ) ( not ( = ?auto_226974 ?auto_226976 ) ) ( not ( = ?auto_226974 ?auto_226977 ) ) ( not ( = ?auto_226974 ?auto_226978 ) ) ( not ( = ?auto_226975 ?auto_226976 ) ) ( not ( = ?auto_226975 ?auto_226977 ) ) ( not ( = ?auto_226975 ?auto_226978 ) ) ( not ( = ?auto_226976 ?auto_226977 ) ) ( not ( = ?auto_226976 ?auto_226978 ) ) ( not ( = ?auto_226977 ?auto_226978 ) ) ( CLEAR ?auto_226975 ) ( ON ?auto_226976 ?auto_226977 ) ( CLEAR ?auto_226976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_226970 ?auto_226971 ?auto_226972 ?auto_226973 ?auto_226974 ?auto_226975 ?auto_226976 )
      ( MAKE-8PILE ?auto_226970 ?auto_226971 ?auto_226972 ?auto_226973 ?auto_226974 ?auto_226975 ?auto_226976 ?auto_226977 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_226987 - BLOCK
      ?auto_226988 - BLOCK
      ?auto_226989 - BLOCK
      ?auto_226990 - BLOCK
      ?auto_226991 - BLOCK
      ?auto_226992 - BLOCK
      ?auto_226993 - BLOCK
      ?auto_226994 - BLOCK
    )
    :vars
    (
      ?auto_226995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226994 ?auto_226995 ) ( ON-TABLE ?auto_226987 ) ( ON ?auto_226988 ?auto_226987 ) ( ON ?auto_226989 ?auto_226988 ) ( ON ?auto_226990 ?auto_226989 ) ( ON ?auto_226991 ?auto_226990 ) ( ON ?auto_226992 ?auto_226991 ) ( not ( = ?auto_226987 ?auto_226988 ) ) ( not ( = ?auto_226987 ?auto_226989 ) ) ( not ( = ?auto_226987 ?auto_226990 ) ) ( not ( = ?auto_226987 ?auto_226991 ) ) ( not ( = ?auto_226987 ?auto_226992 ) ) ( not ( = ?auto_226987 ?auto_226993 ) ) ( not ( = ?auto_226987 ?auto_226994 ) ) ( not ( = ?auto_226987 ?auto_226995 ) ) ( not ( = ?auto_226988 ?auto_226989 ) ) ( not ( = ?auto_226988 ?auto_226990 ) ) ( not ( = ?auto_226988 ?auto_226991 ) ) ( not ( = ?auto_226988 ?auto_226992 ) ) ( not ( = ?auto_226988 ?auto_226993 ) ) ( not ( = ?auto_226988 ?auto_226994 ) ) ( not ( = ?auto_226988 ?auto_226995 ) ) ( not ( = ?auto_226989 ?auto_226990 ) ) ( not ( = ?auto_226989 ?auto_226991 ) ) ( not ( = ?auto_226989 ?auto_226992 ) ) ( not ( = ?auto_226989 ?auto_226993 ) ) ( not ( = ?auto_226989 ?auto_226994 ) ) ( not ( = ?auto_226989 ?auto_226995 ) ) ( not ( = ?auto_226990 ?auto_226991 ) ) ( not ( = ?auto_226990 ?auto_226992 ) ) ( not ( = ?auto_226990 ?auto_226993 ) ) ( not ( = ?auto_226990 ?auto_226994 ) ) ( not ( = ?auto_226990 ?auto_226995 ) ) ( not ( = ?auto_226991 ?auto_226992 ) ) ( not ( = ?auto_226991 ?auto_226993 ) ) ( not ( = ?auto_226991 ?auto_226994 ) ) ( not ( = ?auto_226991 ?auto_226995 ) ) ( not ( = ?auto_226992 ?auto_226993 ) ) ( not ( = ?auto_226992 ?auto_226994 ) ) ( not ( = ?auto_226992 ?auto_226995 ) ) ( not ( = ?auto_226993 ?auto_226994 ) ) ( not ( = ?auto_226993 ?auto_226995 ) ) ( not ( = ?auto_226994 ?auto_226995 ) ) ( CLEAR ?auto_226992 ) ( ON ?auto_226993 ?auto_226994 ) ( CLEAR ?auto_226993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_226987 ?auto_226988 ?auto_226989 ?auto_226990 ?auto_226991 ?auto_226992 ?auto_226993 )
      ( MAKE-8PILE ?auto_226987 ?auto_226988 ?auto_226989 ?auto_226990 ?auto_226991 ?auto_226992 ?auto_226993 ?auto_226994 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227004 - BLOCK
      ?auto_227005 - BLOCK
      ?auto_227006 - BLOCK
      ?auto_227007 - BLOCK
      ?auto_227008 - BLOCK
      ?auto_227009 - BLOCK
      ?auto_227010 - BLOCK
      ?auto_227011 - BLOCK
    )
    :vars
    (
      ?auto_227012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227011 ?auto_227012 ) ( ON-TABLE ?auto_227004 ) ( ON ?auto_227005 ?auto_227004 ) ( ON ?auto_227006 ?auto_227005 ) ( ON ?auto_227007 ?auto_227006 ) ( ON ?auto_227008 ?auto_227007 ) ( not ( = ?auto_227004 ?auto_227005 ) ) ( not ( = ?auto_227004 ?auto_227006 ) ) ( not ( = ?auto_227004 ?auto_227007 ) ) ( not ( = ?auto_227004 ?auto_227008 ) ) ( not ( = ?auto_227004 ?auto_227009 ) ) ( not ( = ?auto_227004 ?auto_227010 ) ) ( not ( = ?auto_227004 ?auto_227011 ) ) ( not ( = ?auto_227004 ?auto_227012 ) ) ( not ( = ?auto_227005 ?auto_227006 ) ) ( not ( = ?auto_227005 ?auto_227007 ) ) ( not ( = ?auto_227005 ?auto_227008 ) ) ( not ( = ?auto_227005 ?auto_227009 ) ) ( not ( = ?auto_227005 ?auto_227010 ) ) ( not ( = ?auto_227005 ?auto_227011 ) ) ( not ( = ?auto_227005 ?auto_227012 ) ) ( not ( = ?auto_227006 ?auto_227007 ) ) ( not ( = ?auto_227006 ?auto_227008 ) ) ( not ( = ?auto_227006 ?auto_227009 ) ) ( not ( = ?auto_227006 ?auto_227010 ) ) ( not ( = ?auto_227006 ?auto_227011 ) ) ( not ( = ?auto_227006 ?auto_227012 ) ) ( not ( = ?auto_227007 ?auto_227008 ) ) ( not ( = ?auto_227007 ?auto_227009 ) ) ( not ( = ?auto_227007 ?auto_227010 ) ) ( not ( = ?auto_227007 ?auto_227011 ) ) ( not ( = ?auto_227007 ?auto_227012 ) ) ( not ( = ?auto_227008 ?auto_227009 ) ) ( not ( = ?auto_227008 ?auto_227010 ) ) ( not ( = ?auto_227008 ?auto_227011 ) ) ( not ( = ?auto_227008 ?auto_227012 ) ) ( not ( = ?auto_227009 ?auto_227010 ) ) ( not ( = ?auto_227009 ?auto_227011 ) ) ( not ( = ?auto_227009 ?auto_227012 ) ) ( not ( = ?auto_227010 ?auto_227011 ) ) ( not ( = ?auto_227010 ?auto_227012 ) ) ( not ( = ?auto_227011 ?auto_227012 ) ) ( ON ?auto_227010 ?auto_227011 ) ( CLEAR ?auto_227008 ) ( ON ?auto_227009 ?auto_227010 ) ( CLEAR ?auto_227009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_227004 ?auto_227005 ?auto_227006 ?auto_227007 ?auto_227008 ?auto_227009 )
      ( MAKE-8PILE ?auto_227004 ?auto_227005 ?auto_227006 ?auto_227007 ?auto_227008 ?auto_227009 ?auto_227010 ?auto_227011 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227021 - BLOCK
      ?auto_227022 - BLOCK
      ?auto_227023 - BLOCK
      ?auto_227024 - BLOCK
      ?auto_227025 - BLOCK
      ?auto_227026 - BLOCK
      ?auto_227027 - BLOCK
      ?auto_227028 - BLOCK
    )
    :vars
    (
      ?auto_227029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227028 ?auto_227029 ) ( ON-TABLE ?auto_227021 ) ( ON ?auto_227022 ?auto_227021 ) ( ON ?auto_227023 ?auto_227022 ) ( ON ?auto_227024 ?auto_227023 ) ( ON ?auto_227025 ?auto_227024 ) ( not ( = ?auto_227021 ?auto_227022 ) ) ( not ( = ?auto_227021 ?auto_227023 ) ) ( not ( = ?auto_227021 ?auto_227024 ) ) ( not ( = ?auto_227021 ?auto_227025 ) ) ( not ( = ?auto_227021 ?auto_227026 ) ) ( not ( = ?auto_227021 ?auto_227027 ) ) ( not ( = ?auto_227021 ?auto_227028 ) ) ( not ( = ?auto_227021 ?auto_227029 ) ) ( not ( = ?auto_227022 ?auto_227023 ) ) ( not ( = ?auto_227022 ?auto_227024 ) ) ( not ( = ?auto_227022 ?auto_227025 ) ) ( not ( = ?auto_227022 ?auto_227026 ) ) ( not ( = ?auto_227022 ?auto_227027 ) ) ( not ( = ?auto_227022 ?auto_227028 ) ) ( not ( = ?auto_227022 ?auto_227029 ) ) ( not ( = ?auto_227023 ?auto_227024 ) ) ( not ( = ?auto_227023 ?auto_227025 ) ) ( not ( = ?auto_227023 ?auto_227026 ) ) ( not ( = ?auto_227023 ?auto_227027 ) ) ( not ( = ?auto_227023 ?auto_227028 ) ) ( not ( = ?auto_227023 ?auto_227029 ) ) ( not ( = ?auto_227024 ?auto_227025 ) ) ( not ( = ?auto_227024 ?auto_227026 ) ) ( not ( = ?auto_227024 ?auto_227027 ) ) ( not ( = ?auto_227024 ?auto_227028 ) ) ( not ( = ?auto_227024 ?auto_227029 ) ) ( not ( = ?auto_227025 ?auto_227026 ) ) ( not ( = ?auto_227025 ?auto_227027 ) ) ( not ( = ?auto_227025 ?auto_227028 ) ) ( not ( = ?auto_227025 ?auto_227029 ) ) ( not ( = ?auto_227026 ?auto_227027 ) ) ( not ( = ?auto_227026 ?auto_227028 ) ) ( not ( = ?auto_227026 ?auto_227029 ) ) ( not ( = ?auto_227027 ?auto_227028 ) ) ( not ( = ?auto_227027 ?auto_227029 ) ) ( not ( = ?auto_227028 ?auto_227029 ) ) ( ON ?auto_227027 ?auto_227028 ) ( CLEAR ?auto_227025 ) ( ON ?auto_227026 ?auto_227027 ) ( CLEAR ?auto_227026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_227021 ?auto_227022 ?auto_227023 ?auto_227024 ?auto_227025 ?auto_227026 )
      ( MAKE-8PILE ?auto_227021 ?auto_227022 ?auto_227023 ?auto_227024 ?auto_227025 ?auto_227026 ?auto_227027 ?auto_227028 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227038 - BLOCK
      ?auto_227039 - BLOCK
      ?auto_227040 - BLOCK
      ?auto_227041 - BLOCK
      ?auto_227042 - BLOCK
      ?auto_227043 - BLOCK
      ?auto_227044 - BLOCK
      ?auto_227045 - BLOCK
    )
    :vars
    (
      ?auto_227046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227045 ?auto_227046 ) ( ON-TABLE ?auto_227038 ) ( ON ?auto_227039 ?auto_227038 ) ( ON ?auto_227040 ?auto_227039 ) ( ON ?auto_227041 ?auto_227040 ) ( not ( = ?auto_227038 ?auto_227039 ) ) ( not ( = ?auto_227038 ?auto_227040 ) ) ( not ( = ?auto_227038 ?auto_227041 ) ) ( not ( = ?auto_227038 ?auto_227042 ) ) ( not ( = ?auto_227038 ?auto_227043 ) ) ( not ( = ?auto_227038 ?auto_227044 ) ) ( not ( = ?auto_227038 ?auto_227045 ) ) ( not ( = ?auto_227038 ?auto_227046 ) ) ( not ( = ?auto_227039 ?auto_227040 ) ) ( not ( = ?auto_227039 ?auto_227041 ) ) ( not ( = ?auto_227039 ?auto_227042 ) ) ( not ( = ?auto_227039 ?auto_227043 ) ) ( not ( = ?auto_227039 ?auto_227044 ) ) ( not ( = ?auto_227039 ?auto_227045 ) ) ( not ( = ?auto_227039 ?auto_227046 ) ) ( not ( = ?auto_227040 ?auto_227041 ) ) ( not ( = ?auto_227040 ?auto_227042 ) ) ( not ( = ?auto_227040 ?auto_227043 ) ) ( not ( = ?auto_227040 ?auto_227044 ) ) ( not ( = ?auto_227040 ?auto_227045 ) ) ( not ( = ?auto_227040 ?auto_227046 ) ) ( not ( = ?auto_227041 ?auto_227042 ) ) ( not ( = ?auto_227041 ?auto_227043 ) ) ( not ( = ?auto_227041 ?auto_227044 ) ) ( not ( = ?auto_227041 ?auto_227045 ) ) ( not ( = ?auto_227041 ?auto_227046 ) ) ( not ( = ?auto_227042 ?auto_227043 ) ) ( not ( = ?auto_227042 ?auto_227044 ) ) ( not ( = ?auto_227042 ?auto_227045 ) ) ( not ( = ?auto_227042 ?auto_227046 ) ) ( not ( = ?auto_227043 ?auto_227044 ) ) ( not ( = ?auto_227043 ?auto_227045 ) ) ( not ( = ?auto_227043 ?auto_227046 ) ) ( not ( = ?auto_227044 ?auto_227045 ) ) ( not ( = ?auto_227044 ?auto_227046 ) ) ( not ( = ?auto_227045 ?auto_227046 ) ) ( ON ?auto_227044 ?auto_227045 ) ( ON ?auto_227043 ?auto_227044 ) ( CLEAR ?auto_227041 ) ( ON ?auto_227042 ?auto_227043 ) ( CLEAR ?auto_227042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_227038 ?auto_227039 ?auto_227040 ?auto_227041 ?auto_227042 )
      ( MAKE-8PILE ?auto_227038 ?auto_227039 ?auto_227040 ?auto_227041 ?auto_227042 ?auto_227043 ?auto_227044 ?auto_227045 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227055 - BLOCK
      ?auto_227056 - BLOCK
      ?auto_227057 - BLOCK
      ?auto_227058 - BLOCK
      ?auto_227059 - BLOCK
      ?auto_227060 - BLOCK
      ?auto_227061 - BLOCK
      ?auto_227062 - BLOCK
    )
    :vars
    (
      ?auto_227063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227062 ?auto_227063 ) ( ON-TABLE ?auto_227055 ) ( ON ?auto_227056 ?auto_227055 ) ( ON ?auto_227057 ?auto_227056 ) ( ON ?auto_227058 ?auto_227057 ) ( not ( = ?auto_227055 ?auto_227056 ) ) ( not ( = ?auto_227055 ?auto_227057 ) ) ( not ( = ?auto_227055 ?auto_227058 ) ) ( not ( = ?auto_227055 ?auto_227059 ) ) ( not ( = ?auto_227055 ?auto_227060 ) ) ( not ( = ?auto_227055 ?auto_227061 ) ) ( not ( = ?auto_227055 ?auto_227062 ) ) ( not ( = ?auto_227055 ?auto_227063 ) ) ( not ( = ?auto_227056 ?auto_227057 ) ) ( not ( = ?auto_227056 ?auto_227058 ) ) ( not ( = ?auto_227056 ?auto_227059 ) ) ( not ( = ?auto_227056 ?auto_227060 ) ) ( not ( = ?auto_227056 ?auto_227061 ) ) ( not ( = ?auto_227056 ?auto_227062 ) ) ( not ( = ?auto_227056 ?auto_227063 ) ) ( not ( = ?auto_227057 ?auto_227058 ) ) ( not ( = ?auto_227057 ?auto_227059 ) ) ( not ( = ?auto_227057 ?auto_227060 ) ) ( not ( = ?auto_227057 ?auto_227061 ) ) ( not ( = ?auto_227057 ?auto_227062 ) ) ( not ( = ?auto_227057 ?auto_227063 ) ) ( not ( = ?auto_227058 ?auto_227059 ) ) ( not ( = ?auto_227058 ?auto_227060 ) ) ( not ( = ?auto_227058 ?auto_227061 ) ) ( not ( = ?auto_227058 ?auto_227062 ) ) ( not ( = ?auto_227058 ?auto_227063 ) ) ( not ( = ?auto_227059 ?auto_227060 ) ) ( not ( = ?auto_227059 ?auto_227061 ) ) ( not ( = ?auto_227059 ?auto_227062 ) ) ( not ( = ?auto_227059 ?auto_227063 ) ) ( not ( = ?auto_227060 ?auto_227061 ) ) ( not ( = ?auto_227060 ?auto_227062 ) ) ( not ( = ?auto_227060 ?auto_227063 ) ) ( not ( = ?auto_227061 ?auto_227062 ) ) ( not ( = ?auto_227061 ?auto_227063 ) ) ( not ( = ?auto_227062 ?auto_227063 ) ) ( ON ?auto_227061 ?auto_227062 ) ( ON ?auto_227060 ?auto_227061 ) ( CLEAR ?auto_227058 ) ( ON ?auto_227059 ?auto_227060 ) ( CLEAR ?auto_227059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_227055 ?auto_227056 ?auto_227057 ?auto_227058 ?auto_227059 )
      ( MAKE-8PILE ?auto_227055 ?auto_227056 ?auto_227057 ?auto_227058 ?auto_227059 ?auto_227060 ?auto_227061 ?auto_227062 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227072 - BLOCK
      ?auto_227073 - BLOCK
      ?auto_227074 - BLOCK
      ?auto_227075 - BLOCK
      ?auto_227076 - BLOCK
      ?auto_227077 - BLOCK
      ?auto_227078 - BLOCK
      ?auto_227079 - BLOCK
    )
    :vars
    (
      ?auto_227080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227079 ?auto_227080 ) ( ON-TABLE ?auto_227072 ) ( ON ?auto_227073 ?auto_227072 ) ( ON ?auto_227074 ?auto_227073 ) ( not ( = ?auto_227072 ?auto_227073 ) ) ( not ( = ?auto_227072 ?auto_227074 ) ) ( not ( = ?auto_227072 ?auto_227075 ) ) ( not ( = ?auto_227072 ?auto_227076 ) ) ( not ( = ?auto_227072 ?auto_227077 ) ) ( not ( = ?auto_227072 ?auto_227078 ) ) ( not ( = ?auto_227072 ?auto_227079 ) ) ( not ( = ?auto_227072 ?auto_227080 ) ) ( not ( = ?auto_227073 ?auto_227074 ) ) ( not ( = ?auto_227073 ?auto_227075 ) ) ( not ( = ?auto_227073 ?auto_227076 ) ) ( not ( = ?auto_227073 ?auto_227077 ) ) ( not ( = ?auto_227073 ?auto_227078 ) ) ( not ( = ?auto_227073 ?auto_227079 ) ) ( not ( = ?auto_227073 ?auto_227080 ) ) ( not ( = ?auto_227074 ?auto_227075 ) ) ( not ( = ?auto_227074 ?auto_227076 ) ) ( not ( = ?auto_227074 ?auto_227077 ) ) ( not ( = ?auto_227074 ?auto_227078 ) ) ( not ( = ?auto_227074 ?auto_227079 ) ) ( not ( = ?auto_227074 ?auto_227080 ) ) ( not ( = ?auto_227075 ?auto_227076 ) ) ( not ( = ?auto_227075 ?auto_227077 ) ) ( not ( = ?auto_227075 ?auto_227078 ) ) ( not ( = ?auto_227075 ?auto_227079 ) ) ( not ( = ?auto_227075 ?auto_227080 ) ) ( not ( = ?auto_227076 ?auto_227077 ) ) ( not ( = ?auto_227076 ?auto_227078 ) ) ( not ( = ?auto_227076 ?auto_227079 ) ) ( not ( = ?auto_227076 ?auto_227080 ) ) ( not ( = ?auto_227077 ?auto_227078 ) ) ( not ( = ?auto_227077 ?auto_227079 ) ) ( not ( = ?auto_227077 ?auto_227080 ) ) ( not ( = ?auto_227078 ?auto_227079 ) ) ( not ( = ?auto_227078 ?auto_227080 ) ) ( not ( = ?auto_227079 ?auto_227080 ) ) ( ON ?auto_227078 ?auto_227079 ) ( ON ?auto_227077 ?auto_227078 ) ( ON ?auto_227076 ?auto_227077 ) ( CLEAR ?auto_227074 ) ( ON ?auto_227075 ?auto_227076 ) ( CLEAR ?auto_227075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_227072 ?auto_227073 ?auto_227074 ?auto_227075 )
      ( MAKE-8PILE ?auto_227072 ?auto_227073 ?auto_227074 ?auto_227075 ?auto_227076 ?auto_227077 ?auto_227078 ?auto_227079 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227089 - BLOCK
      ?auto_227090 - BLOCK
      ?auto_227091 - BLOCK
      ?auto_227092 - BLOCK
      ?auto_227093 - BLOCK
      ?auto_227094 - BLOCK
      ?auto_227095 - BLOCK
      ?auto_227096 - BLOCK
    )
    :vars
    (
      ?auto_227097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227096 ?auto_227097 ) ( ON-TABLE ?auto_227089 ) ( ON ?auto_227090 ?auto_227089 ) ( ON ?auto_227091 ?auto_227090 ) ( not ( = ?auto_227089 ?auto_227090 ) ) ( not ( = ?auto_227089 ?auto_227091 ) ) ( not ( = ?auto_227089 ?auto_227092 ) ) ( not ( = ?auto_227089 ?auto_227093 ) ) ( not ( = ?auto_227089 ?auto_227094 ) ) ( not ( = ?auto_227089 ?auto_227095 ) ) ( not ( = ?auto_227089 ?auto_227096 ) ) ( not ( = ?auto_227089 ?auto_227097 ) ) ( not ( = ?auto_227090 ?auto_227091 ) ) ( not ( = ?auto_227090 ?auto_227092 ) ) ( not ( = ?auto_227090 ?auto_227093 ) ) ( not ( = ?auto_227090 ?auto_227094 ) ) ( not ( = ?auto_227090 ?auto_227095 ) ) ( not ( = ?auto_227090 ?auto_227096 ) ) ( not ( = ?auto_227090 ?auto_227097 ) ) ( not ( = ?auto_227091 ?auto_227092 ) ) ( not ( = ?auto_227091 ?auto_227093 ) ) ( not ( = ?auto_227091 ?auto_227094 ) ) ( not ( = ?auto_227091 ?auto_227095 ) ) ( not ( = ?auto_227091 ?auto_227096 ) ) ( not ( = ?auto_227091 ?auto_227097 ) ) ( not ( = ?auto_227092 ?auto_227093 ) ) ( not ( = ?auto_227092 ?auto_227094 ) ) ( not ( = ?auto_227092 ?auto_227095 ) ) ( not ( = ?auto_227092 ?auto_227096 ) ) ( not ( = ?auto_227092 ?auto_227097 ) ) ( not ( = ?auto_227093 ?auto_227094 ) ) ( not ( = ?auto_227093 ?auto_227095 ) ) ( not ( = ?auto_227093 ?auto_227096 ) ) ( not ( = ?auto_227093 ?auto_227097 ) ) ( not ( = ?auto_227094 ?auto_227095 ) ) ( not ( = ?auto_227094 ?auto_227096 ) ) ( not ( = ?auto_227094 ?auto_227097 ) ) ( not ( = ?auto_227095 ?auto_227096 ) ) ( not ( = ?auto_227095 ?auto_227097 ) ) ( not ( = ?auto_227096 ?auto_227097 ) ) ( ON ?auto_227095 ?auto_227096 ) ( ON ?auto_227094 ?auto_227095 ) ( ON ?auto_227093 ?auto_227094 ) ( CLEAR ?auto_227091 ) ( ON ?auto_227092 ?auto_227093 ) ( CLEAR ?auto_227092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_227089 ?auto_227090 ?auto_227091 ?auto_227092 )
      ( MAKE-8PILE ?auto_227089 ?auto_227090 ?auto_227091 ?auto_227092 ?auto_227093 ?auto_227094 ?auto_227095 ?auto_227096 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227106 - BLOCK
      ?auto_227107 - BLOCK
      ?auto_227108 - BLOCK
      ?auto_227109 - BLOCK
      ?auto_227110 - BLOCK
      ?auto_227111 - BLOCK
      ?auto_227112 - BLOCK
      ?auto_227113 - BLOCK
    )
    :vars
    (
      ?auto_227114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227113 ?auto_227114 ) ( ON-TABLE ?auto_227106 ) ( ON ?auto_227107 ?auto_227106 ) ( not ( = ?auto_227106 ?auto_227107 ) ) ( not ( = ?auto_227106 ?auto_227108 ) ) ( not ( = ?auto_227106 ?auto_227109 ) ) ( not ( = ?auto_227106 ?auto_227110 ) ) ( not ( = ?auto_227106 ?auto_227111 ) ) ( not ( = ?auto_227106 ?auto_227112 ) ) ( not ( = ?auto_227106 ?auto_227113 ) ) ( not ( = ?auto_227106 ?auto_227114 ) ) ( not ( = ?auto_227107 ?auto_227108 ) ) ( not ( = ?auto_227107 ?auto_227109 ) ) ( not ( = ?auto_227107 ?auto_227110 ) ) ( not ( = ?auto_227107 ?auto_227111 ) ) ( not ( = ?auto_227107 ?auto_227112 ) ) ( not ( = ?auto_227107 ?auto_227113 ) ) ( not ( = ?auto_227107 ?auto_227114 ) ) ( not ( = ?auto_227108 ?auto_227109 ) ) ( not ( = ?auto_227108 ?auto_227110 ) ) ( not ( = ?auto_227108 ?auto_227111 ) ) ( not ( = ?auto_227108 ?auto_227112 ) ) ( not ( = ?auto_227108 ?auto_227113 ) ) ( not ( = ?auto_227108 ?auto_227114 ) ) ( not ( = ?auto_227109 ?auto_227110 ) ) ( not ( = ?auto_227109 ?auto_227111 ) ) ( not ( = ?auto_227109 ?auto_227112 ) ) ( not ( = ?auto_227109 ?auto_227113 ) ) ( not ( = ?auto_227109 ?auto_227114 ) ) ( not ( = ?auto_227110 ?auto_227111 ) ) ( not ( = ?auto_227110 ?auto_227112 ) ) ( not ( = ?auto_227110 ?auto_227113 ) ) ( not ( = ?auto_227110 ?auto_227114 ) ) ( not ( = ?auto_227111 ?auto_227112 ) ) ( not ( = ?auto_227111 ?auto_227113 ) ) ( not ( = ?auto_227111 ?auto_227114 ) ) ( not ( = ?auto_227112 ?auto_227113 ) ) ( not ( = ?auto_227112 ?auto_227114 ) ) ( not ( = ?auto_227113 ?auto_227114 ) ) ( ON ?auto_227112 ?auto_227113 ) ( ON ?auto_227111 ?auto_227112 ) ( ON ?auto_227110 ?auto_227111 ) ( ON ?auto_227109 ?auto_227110 ) ( CLEAR ?auto_227107 ) ( ON ?auto_227108 ?auto_227109 ) ( CLEAR ?auto_227108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_227106 ?auto_227107 ?auto_227108 )
      ( MAKE-8PILE ?auto_227106 ?auto_227107 ?auto_227108 ?auto_227109 ?auto_227110 ?auto_227111 ?auto_227112 ?auto_227113 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227123 - BLOCK
      ?auto_227124 - BLOCK
      ?auto_227125 - BLOCK
      ?auto_227126 - BLOCK
      ?auto_227127 - BLOCK
      ?auto_227128 - BLOCK
      ?auto_227129 - BLOCK
      ?auto_227130 - BLOCK
    )
    :vars
    (
      ?auto_227131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227130 ?auto_227131 ) ( ON-TABLE ?auto_227123 ) ( ON ?auto_227124 ?auto_227123 ) ( not ( = ?auto_227123 ?auto_227124 ) ) ( not ( = ?auto_227123 ?auto_227125 ) ) ( not ( = ?auto_227123 ?auto_227126 ) ) ( not ( = ?auto_227123 ?auto_227127 ) ) ( not ( = ?auto_227123 ?auto_227128 ) ) ( not ( = ?auto_227123 ?auto_227129 ) ) ( not ( = ?auto_227123 ?auto_227130 ) ) ( not ( = ?auto_227123 ?auto_227131 ) ) ( not ( = ?auto_227124 ?auto_227125 ) ) ( not ( = ?auto_227124 ?auto_227126 ) ) ( not ( = ?auto_227124 ?auto_227127 ) ) ( not ( = ?auto_227124 ?auto_227128 ) ) ( not ( = ?auto_227124 ?auto_227129 ) ) ( not ( = ?auto_227124 ?auto_227130 ) ) ( not ( = ?auto_227124 ?auto_227131 ) ) ( not ( = ?auto_227125 ?auto_227126 ) ) ( not ( = ?auto_227125 ?auto_227127 ) ) ( not ( = ?auto_227125 ?auto_227128 ) ) ( not ( = ?auto_227125 ?auto_227129 ) ) ( not ( = ?auto_227125 ?auto_227130 ) ) ( not ( = ?auto_227125 ?auto_227131 ) ) ( not ( = ?auto_227126 ?auto_227127 ) ) ( not ( = ?auto_227126 ?auto_227128 ) ) ( not ( = ?auto_227126 ?auto_227129 ) ) ( not ( = ?auto_227126 ?auto_227130 ) ) ( not ( = ?auto_227126 ?auto_227131 ) ) ( not ( = ?auto_227127 ?auto_227128 ) ) ( not ( = ?auto_227127 ?auto_227129 ) ) ( not ( = ?auto_227127 ?auto_227130 ) ) ( not ( = ?auto_227127 ?auto_227131 ) ) ( not ( = ?auto_227128 ?auto_227129 ) ) ( not ( = ?auto_227128 ?auto_227130 ) ) ( not ( = ?auto_227128 ?auto_227131 ) ) ( not ( = ?auto_227129 ?auto_227130 ) ) ( not ( = ?auto_227129 ?auto_227131 ) ) ( not ( = ?auto_227130 ?auto_227131 ) ) ( ON ?auto_227129 ?auto_227130 ) ( ON ?auto_227128 ?auto_227129 ) ( ON ?auto_227127 ?auto_227128 ) ( ON ?auto_227126 ?auto_227127 ) ( CLEAR ?auto_227124 ) ( ON ?auto_227125 ?auto_227126 ) ( CLEAR ?auto_227125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_227123 ?auto_227124 ?auto_227125 )
      ( MAKE-8PILE ?auto_227123 ?auto_227124 ?auto_227125 ?auto_227126 ?auto_227127 ?auto_227128 ?auto_227129 ?auto_227130 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227140 - BLOCK
      ?auto_227141 - BLOCK
      ?auto_227142 - BLOCK
      ?auto_227143 - BLOCK
      ?auto_227144 - BLOCK
      ?auto_227145 - BLOCK
      ?auto_227146 - BLOCK
      ?auto_227147 - BLOCK
    )
    :vars
    (
      ?auto_227148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227147 ?auto_227148 ) ( ON-TABLE ?auto_227140 ) ( not ( = ?auto_227140 ?auto_227141 ) ) ( not ( = ?auto_227140 ?auto_227142 ) ) ( not ( = ?auto_227140 ?auto_227143 ) ) ( not ( = ?auto_227140 ?auto_227144 ) ) ( not ( = ?auto_227140 ?auto_227145 ) ) ( not ( = ?auto_227140 ?auto_227146 ) ) ( not ( = ?auto_227140 ?auto_227147 ) ) ( not ( = ?auto_227140 ?auto_227148 ) ) ( not ( = ?auto_227141 ?auto_227142 ) ) ( not ( = ?auto_227141 ?auto_227143 ) ) ( not ( = ?auto_227141 ?auto_227144 ) ) ( not ( = ?auto_227141 ?auto_227145 ) ) ( not ( = ?auto_227141 ?auto_227146 ) ) ( not ( = ?auto_227141 ?auto_227147 ) ) ( not ( = ?auto_227141 ?auto_227148 ) ) ( not ( = ?auto_227142 ?auto_227143 ) ) ( not ( = ?auto_227142 ?auto_227144 ) ) ( not ( = ?auto_227142 ?auto_227145 ) ) ( not ( = ?auto_227142 ?auto_227146 ) ) ( not ( = ?auto_227142 ?auto_227147 ) ) ( not ( = ?auto_227142 ?auto_227148 ) ) ( not ( = ?auto_227143 ?auto_227144 ) ) ( not ( = ?auto_227143 ?auto_227145 ) ) ( not ( = ?auto_227143 ?auto_227146 ) ) ( not ( = ?auto_227143 ?auto_227147 ) ) ( not ( = ?auto_227143 ?auto_227148 ) ) ( not ( = ?auto_227144 ?auto_227145 ) ) ( not ( = ?auto_227144 ?auto_227146 ) ) ( not ( = ?auto_227144 ?auto_227147 ) ) ( not ( = ?auto_227144 ?auto_227148 ) ) ( not ( = ?auto_227145 ?auto_227146 ) ) ( not ( = ?auto_227145 ?auto_227147 ) ) ( not ( = ?auto_227145 ?auto_227148 ) ) ( not ( = ?auto_227146 ?auto_227147 ) ) ( not ( = ?auto_227146 ?auto_227148 ) ) ( not ( = ?auto_227147 ?auto_227148 ) ) ( ON ?auto_227146 ?auto_227147 ) ( ON ?auto_227145 ?auto_227146 ) ( ON ?auto_227144 ?auto_227145 ) ( ON ?auto_227143 ?auto_227144 ) ( ON ?auto_227142 ?auto_227143 ) ( CLEAR ?auto_227140 ) ( ON ?auto_227141 ?auto_227142 ) ( CLEAR ?auto_227141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_227140 ?auto_227141 )
      ( MAKE-8PILE ?auto_227140 ?auto_227141 ?auto_227142 ?auto_227143 ?auto_227144 ?auto_227145 ?auto_227146 ?auto_227147 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227157 - BLOCK
      ?auto_227158 - BLOCK
      ?auto_227159 - BLOCK
      ?auto_227160 - BLOCK
      ?auto_227161 - BLOCK
      ?auto_227162 - BLOCK
      ?auto_227163 - BLOCK
      ?auto_227164 - BLOCK
    )
    :vars
    (
      ?auto_227165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227164 ?auto_227165 ) ( ON-TABLE ?auto_227157 ) ( not ( = ?auto_227157 ?auto_227158 ) ) ( not ( = ?auto_227157 ?auto_227159 ) ) ( not ( = ?auto_227157 ?auto_227160 ) ) ( not ( = ?auto_227157 ?auto_227161 ) ) ( not ( = ?auto_227157 ?auto_227162 ) ) ( not ( = ?auto_227157 ?auto_227163 ) ) ( not ( = ?auto_227157 ?auto_227164 ) ) ( not ( = ?auto_227157 ?auto_227165 ) ) ( not ( = ?auto_227158 ?auto_227159 ) ) ( not ( = ?auto_227158 ?auto_227160 ) ) ( not ( = ?auto_227158 ?auto_227161 ) ) ( not ( = ?auto_227158 ?auto_227162 ) ) ( not ( = ?auto_227158 ?auto_227163 ) ) ( not ( = ?auto_227158 ?auto_227164 ) ) ( not ( = ?auto_227158 ?auto_227165 ) ) ( not ( = ?auto_227159 ?auto_227160 ) ) ( not ( = ?auto_227159 ?auto_227161 ) ) ( not ( = ?auto_227159 ?auto_227162 ) ) ( not ( = ?auto_227159 ?auto_227163 ) ) ( not ( = ?auto_227159 ?auto_227164 ) ) ( not ( = ?auto_227159 ?auto_227165 ) ) ( not ( = ?auto_227160 ?auto_227161 ) ) ( not ( = ?auto_227160 ?auto_227162 ) ) ( not ( = ?auto_227160 ?auto_227163 ) ) ( not ( = ?auto_227160 ?auto_227164 ) ) ( not ( = ?auto_227160 ?auto_227165 ) ) ( not ( = ?auto_227161 ?auto_227162 ) ) ( not ( = ?auto_227161 ?auto_227163 ) ) ( not ( = ?auto_227161 ?auto_227164 ) ) ( not ( = ?auto_227161 ?auto_227165 ) ) ( not ( = ?auto_227162 ?auto_227163 ) ) ( not ( = ?auto_227162 ?auto_227164 ) ) ( not ( = ?auto_227162 ?auto_227165 ) ) ( not ( = ?auto_227163 ?auto_227164 ) ) ( not ( = ?auto_227163 ?auto_227165 ) ) ( not ( = ?auto_227164 ?auto_227165 ) ) ( ON ?auto_227163 ?auto_227164 ) ( ON ?auto_227162 ?auto_227163 ) ( ON ?auto_227161 ?auto_227162 ) ( ON ?auto_227160 ?auto_227161 ) ( ON ?auto_227159 ?auto_227160 ) ( CLEAR ?auto_227157 ) ( ON ?auto_227158 ?auto_227159 ) ( CLEAR ?auto_227158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_227157 ?auto_227158 )
      ( MAKE-8PILE ?auto_227157 ?auto_227158 ?auto_227159 ?auto_227160 ?auto_227161 ?auto_227162 ?auto_227163 ?auto_227164 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227174 - BLOCK
      ?auto_227175 - BLOCK
      ?auto_227176 - BLOCK
      ?auto_227177 - BLOCK
      ?auto_227178 - BLOCK
      ?auto_227179 - BLOCK
      ?auto_227180 - BLOCK
      ?auto_227181 - BLOCK
    )
    :vars
    (
      ?auto_227182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227181 ?auto_227182 ) ( not ( = ?auto_227174 ?auto_227175 ) ) ( not ( = ?auto_227174 ?auto_227176 ) ) ( not ( = ?auto_227174 ?auto_227177 ) ) ( not ( = ?auto_227174 ?auto_227178 ) ) ( not ( = ?auto_227174 ?auto_227179 ) ) ( not ( = ?auto_227174 ?auto_227180 ) ) ( not ( = ?auto_227174 ?auto_227181 ) ) ( not ( = ?auto_227174 ?auto_227182 ) ) ( not ( = ?auto_227175 ?auto_227176 ) ) ( not ( = ?auto_227175 ?auto_227177 ) ) ( not ( = ?auto_227175 ?auto_227178 ) ) ( not ( = ?auto_227175 ?auto_227179 ) ) ( not ( = ?auto_227175 ?auto_227180 ) ) ( not ( = ?auto_227175 ?auto_227181 ) ) ( not ( = ?auto_227175 ?auto_227182 ) ) ( not ( = ?auto_227176 ?auto_227177 ) ) ( not ( = ?auto_227176 ?auto_227178 ) ) ( not ( = ?auto_227176 ?auto_227179 ) ) ( not ( = ?auto_227176 ?auto_227180 ) ) ( not ( = ?auto_227176 ?auto_227181 ) ) ( not ( = ?auto_227176 ?auto_227182 ) ) ( not ( = ?auto_227177 ?auto_227178 ) ) ( not ( = ?auto_227177 ?auto_227179 ) ) ( not ( = ?auto_227177 ?auto_227180 ) ) ( not ( = ?auto_227177 ?auto_227181 ) ) ( not ( = ?auto_227177 ?auto_227182 ) ) ( not ( = ?auto_227178 ?auto_227179 ) ) ( not ( = ?auto_227178 ?auto_227180 ) ) ( not ( = ?auto_227178 ?auto_227181 ) ) ( not ( = ?auto_227178 ?auto_227182 ) ) ( not ( = ?auto_227179 ?auto_227180 ) ) ( not ( = ?auto_227179 ?auto_227181 ) ) ( not ( = ?auto_227179 ?auto_227182 ) ) ( not ( = ?auto_227180 ?auto_227181 ) ) ( not ( = ?auto_227180 ?auto_227182 ) ) ( not ( = ?auto_227181 ?auto_227182 ) ) ( ON ?auto_227180 ?auto_227181 ) ( ON ?auto_227179 ?auto_227180 ) ( ON ?auto_227178 ?auto_227179 ) ( ON ?auto_227177 ?auto_227178 ) ( ON ?auto_227176 ?auto_227177 ) ( ON ?auto_227175 ?auto_227176 ) ( ON ?auto_227174 ?auto_227175 ) ( CLEAR ?auto_227174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_227174 )
      ( MAKE-8PILE ?auto_227174 ?auto_227175 ?auto_227176 ?auto_227177 ?auto_227178 ?auto_227179 ?auto_227180 ?auto_227181 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_227191 - BLOCK
      ?auto_227192 - BLOCK
      ?auto_227193 - BLOCK
      ?auto_227194 - BLOCK
      ?auto_227195 - BLOCK
      ?auto_227196 - BLOCK
      ?auto_227197 - BLOCK
      ?auto_227198 - BLOCK
    )
    :vars
    (
      ?auto_227199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227198 ?auto_227199 ) ( not ( = ?auto_227191 ?auto_227192 ) ) ( not ( = ?auto_227191 ?auto_227193 ) ) ( not ( = ?auto_227191 ?auto_227194 ) ) ( not ( = ?auto_227191 ?auto_227195 ) ) ( not ( = ?auto_227191 ?auto_227196 ) ) ( not ( = ?auto_227191 ?auto_227197 ) ) ( not ( = ?auto_227191 ?auto_227198 ) ) ( not ( = ?auto_227191 ?auto_227199 ) ) ( not ( = ?auto_227192 ?auto_227193 ) ) ( not ( = ?auto_227192 ?auto_227194 ) ) ( not ( = ?auto_227192 ?auto_227195 ) ) ( not ( = ?auto_227192 ?auto_227196 ) ) ( not ( = ?auto_227192 ?auto_227197 ) ) ( not ( = ?auto_227192 ?auto_227198 ) ) ( not ( = ?auto_227192 ?auto_227199 ) ) ( not ( = ?auto_227193 ?auto_227194 ) ) ( not ( = ?auto_227193 ?auto_227195 ) ) ( not ( = ?auto_227193 ?auto_227196 ) ) ( not ( = ?auto_227193 ?auto_227197 ) ) ( not ( = ?auto_227193 ?auto_227198 ) ) ( not ( = ?auto_227193 ?auto_227199 ) ) ( not ( = ?auto_227194 ?auto_227195 ) ) ( not ( = ?auto_227194 ?auto_227196 ) ) ( not ( = ?auto_227194 ?auto_227197 ) ) ( not ( = ?auto_227194 ?auto_227198 ) ) ( not ( = ?auto_227194 ?auto_227199 ) ) ( not ( = ?auto_227195 ?auto_227196 ) ) ( not ( = ?auto_227195 ?auto_227197 ) ) ( not ( = ?auto_227195 ?auto_227198 ) ) ( not ( = ?auto_227195 ?auto_227199 ) ) ( not ( = ?auto_227196 ?auto_227197 ) ) ( not ( = ?auto_227196 ?auto_227198 ) ) ( not ( = ?auto_227196 ?auto_227199 ) ) ( not ( = ?auto_227197 ?auto_227198 ) ) ( not ( = ?auto_227197 ?auto_227199 ) ) ( not ( = ?auto_227198 ?auto_227199 ) ) ( ON ?auto_227197 ?auto_227198 ) ( ON ?auto_227196 ?auto_227197 ) ( ON ?auto_227195 ?auto_227196 ) ( ON ?auto_227194 ?auto_227195 ) ( ON ?auto_227193 ?auto_227194 ) ( ON ?auto_227192 ?auto_227193 ) ( ON ?auto_227191 ?auto_227192 ) ( CLEAR ?auto_227191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_227191 )
      ( MAKE-8PILE ?auto_227191 ?auto_227192 ?auto_227193 ?auto_227194 ?auto_227195 ?auto_227196 ?auto_227197 ?auto_227198 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227209 - BLOCK
      ?auto_227210 - BLOCK
      ?auto_227211 - BLOCK
      ?auto_227212 - BLOCK
      ?auto_227213 - BLOCK
      ?auto_227214 - BLOCK
      ?auto_227215 - BLOCK
      ?auto_227216 - BLOCK
      ?auto_227217 - BLOCK
    )
    :vars
    (
      ?auto_227218 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_227216 ) ( ON ?auto_227217 ?auto_227218 ) ( CLEAR ?auto_227217 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_227209 ) ( ON ?auto_227210 ?auto_227209 ) ( ON ?auto_227211 ?auto_227210 ) ( ON ?auto_227212 ?auto_227211 ) ( ON ?auto_227213 ?auto_227212 ) ( ON ?auto_227214 ?auto_227213 ) ( ON ?auto_227215 ?auto_227214 ) ( ON ?auto_227216 ?auto_227215 ) ( not ( = ?auto_227209 ?auto_227210 ) ) ( not ( = ?auto_227209 ?auto_227211 ) ) ( not ( = ?auto_227209 ?auto_227212 ) ) ( not ( = ?auto_227209 ?auto_227213 ) ) ( not ( = ?auto_227209 ?auto_227214 ) ) ( not ( = ?auto_227209 ?auto_227215 ) ) ( not ( = ?auto_227209 ?auto_227216 ) ) ( not ( = ?auto_227209 ?auto_227217 ) ) ( not ( = ?auto_227209 ?auto_227218 ) ) ( not ( = ?auto_227210 ?auto_227211 ) ) ( not ( = ?auto_227210 ?auto_227212 ) ) ( not ( = ?auto_227210 ?auto_227213 ) ) ( not ( = ?auto_227210 ?auto_227214 ) ) ( not ( = ?auto_227210 ?auto_227215 ) ) ( not ( = ?auto_227210 ?auto_227216 ) ) ( not ( = ?auto_227210 ?auto_227217 ) ) ( not ( = ?auto_227210 ?auto_227218 ) ) ( not ( = ?auto_227211 ?auto_227212 ) ) ( not ( = ?auto_227211 ?auto_227213 ) ) ( not ( = ?auto_227211 ?auto_227214 ) ) ( not ( = ?auto_227211 ?auto_227215 ) ) ( not ( = ?auto_227211 ?auto_227216 ) ) ( not ( = ?auto_227211 ?auto_227217 ) ) ( not ( = ?auto_227211 ?auto_227218 ) ) ( not ( = ?auto_227212 ?auto_227213 ) ) ( not ( = ?auto_227212 ?auto_227214 ) ) ( not ( = ?auto_227212 ?auto_227215 ) ) ( not ( = ?auto_227212 ?auto_227216 ) ) ( not ( = ?auto_227212 ?auto_227217 ) ) ( not ( = ?auto_227212 ?auto_227218 ) ) ( not ( = ?auto_227213 ?auto_227214 ) ) ( not ( = ?auto_227213 ?auto_227215 ) ) ( not ( = ?auto_227213 ?auto_227216 ) ) ( not ( = ?auto_227213 ?auto_227217 ) ) ( not ( = ?auto_227213 ?auto_227218 ) ) ( not ( = ?auto_227214 ?auto_227215 ) ) ( not ( = ?auto_227214 ?auto_227216 ) ) ( not ( = ?auto_227214 ?auto_227217 ) ) ( not ( = ?auto_227214 ?auto_227218 ) ) ( not ( = ?auto_227215 ?auto_227216 ) ) ( not ( = ?auto_227215 ?auto_227217 ) ) ( not ( = ?auto_227215 ?auto_227218 ) ) ( not ( = ?auto_227216 ?auto_227217 ) ) ( not ( = ?auto_227216 ?auto_227218 ) ) ( not ( = ?auto_227217 ?auto_227218 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_227217 ?auto_227218 )
      ( !STACK ?auto_227217 ?auto_227216 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227228 - BLOCK
      ?auto_227229 - BLOCK
      ?auto_227230 - BLOCK
      ?auto_227231 - BLOCK
      ?auto_227232 - BLOCK
      ?auto_227233 - BLOCK
      ?auto_227234 - BLOCK
      ?auto_227235 - BLOCK
      ?auto_227236 - BLOCK
    )
    :vars
    (
      ?auto_227237 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_227235 ) ( ON ?auto_227236 ?auto_227237 ) ( CLEAR ?auto_227236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_227228 ) ( ON ?auto_227229 ?auto_227228 ) ( ON ?auto_227230 ?auto_227229 ) ( ON ?auto_227231 ?auto_227230 ) ( ON ?auto_227232 ?auto_227231 ) ( ON ?auto_227233 ?auto_227232 ) ( ON ?auto_227234 ?auto_227233 ) ( ON ?auto_227235 ?auto_227234 ) ( not ( = ?auto_227228 ?auto_227229 ) ) ( not ( = ?auto_227228 ?auto_227230 ) ) ( not ( = ?auto_227228 ?auto_227231 ) ) ( not ( = ?auto_227228 ?auto_227232 ) ) ( not ( = ?auto_227228 ?auto_227233 ) ) ( not ( = ?auto_227228 ?auto_227234 ) ) ( not ( = ?auto_227228 ?auto_227235 ) ) ( not ( = ?auto_227228 ?auto_227236 ) ) ( not ( = ?auto_227228 ?auto_227237 ) ) ( not ( = ?auto_227229 ?auto_227230 ) ) ( not ( = ?auto_227229 ?auto_227231 ) ) ( not ( = ?auto_227229 ?auto_227232 ) ) ( not ( = ?auto_227229 ?auto_227233 ) ) ( not ( = ?auto_227229 ?auto_227234 ) ) ( not ( = ?auto_227229 ?auto_227235 ) ) ( not ( = ?auto_227229 ?auto_227236 ) ) ( not ( = ?auto_227229 ?auto_227237 ) ) ( not ( = ?auto_227230 ?auto_227231 ) ) ( not ( = ?auto_227230 ?auto_227232 ) ) ( not ( = ?auto_227230 ?auto_227233 ) ) ( not ( = ?auto_227230 ?auto_227234 ) ) ( not ( = ?auto_227230 ?auto_227235 ) ) ( not ( = ?auto_227230 ?auto_227236 ) ) ( not ( = ?auto_227230 ?auto_227237 ) ) ( not ( = ?auto_227231 ?auto_227232 ) ) ( not ( = ?auto_227231 ?auto_227233 ) ) ( not ( = ?auto_227231 ?auto_227234 ) ) ( not ( = ?auto_227231 ?auto_227235 ) ) ( not ( = ?auto_227231 ?auto_227236 ) ) ( not ( = ?auto_227231 ?auto_227237 ) ) ( not ( = ?auto_227232 ?auto_227233 ) ) ( not ( = ?auto_227232 ?auto_227234 ) ) ( not ( = ?auto_227232 ?auto_227235 ) ) ( not ( = ?auto_227232 ?auto_227236 ) ) ( not ( = ?auto_227232 ?auto_227237 ) ) ( not ( = ?auto_227233 ?auto_227234 ) ) ( not ( = ?auto_227233 ?auto_227235 ) ) ( not ( = ?auto_227233 ?auto_227236 ) ) ( not ( = ?auto_227233 ?auto_227237 ) ) ( not ( = ?auto_227234 ?auto_227235 ) ) ( not ( = ?auto_227234 ?auto_227236 ) ) ( not ( = ?auto_227234 ?auto_227237 ) ) ( not ( = ?auto_227235 ?auto_227236 ) ) ( not ( = ?auto_227235 ?auto_227237 ) ) ( not ( = ?auto_227236 ?auto_227237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_227236 ?auto_227237 )
      ( !STACK ?auto_227236 ?auto_227235 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227247 - BLOCK
      ?auto_227248 - BLOCK
      ?auto_227249 - BLOCK
      ?auto_227250 - BLOCK
      ?auto_227251 - BLOCK
      ?auto_227252 - BLOCK
      ?auto_227253 - BLOCK
      ?auto_227254 - BLOCK
      ?auto_227255 - BLOCK
    )
    :vars
    (
      ?auto_227256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227255 ?auto_227256 ) ( ON-TABLE ?auto_227247 ) ( ON ?auto_227248 ?auto_227247 ) ( ON ?auto_227249 ?auto_227248 ) ( ON ?auto_227250 ?auto_227249 ) ( ON ?auto_227251 ?auto_227250 ) ( ON ?auto_227252 ?auto_227251 ) ( ON ?auto_227253 ?auto_227252 ) ( not ( = ?auto_227247 ?auto_227248 ) ) ( not ( = ?auto_227247 ?auto_227249 ) ) ( not ( = ?auto_227247 ?auto_227250 ) ) ( not ( = ?auto_227247 ?auto_227251 ) ) ( not ( = ?auto_227247 ?auto_227252 ) ) ( not ( = ?auto_227247 ?auto_227253 ) ) ( not ( = ?auto_227247 ?auto_227254 ) ) ( not ( = ?auto_227247 ?auto_227255 ) ) ( not ( = ?auto_227247 ?auto_227256 ) ) ( not ( = ?auto_227248 ?auto_227249 ) ) ( not ( = ?auto_227248 ?auto_227250 ) ) ( not ( = ?auto_227248 ?auto_227251 ) ) ( not ( = ?auto_227248 ?auto_227252 ) ) ( not ( = ?auto_227248 ?auto_227253 ) ) ( not ( = ?auto_227248 ?auto_227254 ) ) ( not ( = ?auto_227248 ?auto_227255 ) ) ( not ( = ?auto_227248 ?auto_227256 ) ) ( not ( = ?auto_227249 ?auto_227250 ) ) ( not ( = ?auto_227249 ?auto_227251 ) ) ( not ( = ?auto_227249 ?auto_227252 ) ) ( not ( = ?auto_227249 ?auto_227253 ) ) ( not ( = ?auto_227249 ?auto_227254 ) ) ( not ( = ?auto_227249 ?auto_227255 ) ) ( not ( = ?auto_227249 ?auto_227256 ) ) ( not ( = ?auto_227250 ?auto_227251 ) ) ( not ( = ?auto_227250 ?auto_227252 ) ) ( not ( = ?auto_227250 ?auto_227253 ) ) ( not ( = ?auto_227250 ?auto_227254 ) ) ( not ( = ?auto_227250 ?auto_227255 ) ) ( not ( = ?auto_227250 ?auto_227256 ) ) ( not ( = ?auto_227251 ?auto_227252 ) ) ( not ( = ?auto_227251 ?auto_227253 ) ) ( not ( = ?auto_227251 ?auto_227254 ) ) ( not ( = ?auto_227251 ?auto_227255 ) ) ( not ( = ?auto_227251 ?auto_227256 ) ) ( not ( = ?auto_227252 ?auto_227253 ) ) ( not ( = ?auto_227252 ?auto_227254 ) ) ( not ( = ?auto_227252 ?auto_227255 ) ) ( not ( = ?auto_227252 ?auto_227256 ) ) ( not ( = ?auto_227253 ?auto_227254 ) ) ( not ( = ?auto_227253 ?auto_227255 ) ) ( not ( = ?auto_227253 ?auto_227256 ) ) ( not ( = ?auto_227254 ?auto_227255 ) ) ( not ( = ?auto_227254 ?auto_227256 ) ) ( not ( = ?auto_227255 ?auto_227256 ) ) ( CLEAR ?auto_227253 ) ( ON ?auto_227254 ?auto_227255 ) ( CLEAR ?auto_227254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_227247 ?auto_227248 ?auto_227249 ?auto_227250 ?auto_227251 ?auto_227252 ?auto_227253 ?auto_227254 )
      ( MAKE-9PILE ?auto_227247 ?auto_227248 ?auto_227249 ?auto_227250 ?auto_227251 ?auto_227252 ?auto_227253 ?auto_227254 ?auto_227255 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227266 - BLOCK
      ?auto_227267 - BLOCK
      ?auto_227268 - BLOCK
      ?auto_227269 - BLOCK
      ?auto_227270 - BLOCK
      ?auto_227271 - BLOCK
      ?auto_227272 - BLOCK
      ?auto_227273 - BLOCK
      ?auto_227274 - BLOCK
    )
    :vars
    (
      ?auto_227275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227274 ?auto_227275 ) ( ON-TABLE ?auto_227266 ) ( ON ?auto_227267 ?auto_227266 ) ( ON ?auto_227268 ?auto_227267 ) ( ON ?auto_227269 ?auto_227268 ) ( ON ?auto_227270 ?auto_227269 ) ( ON ?auto_227271 ?auto_227270 ) ( ON ?auto_227272 ?auto_227271 ) ( not ( = ?auto_227266 ?auto_227267 ) ) ( not ( = ?auto_227266 ?auto_227268 ) ) ( not ( = ?auto_227266 ?auto_227269 ) ) ( not ( = ?auto_227266 ?auto_227270 ) ) ( not ( = ?auto_227266 ?auto_227271 ) ) ( not ( = ?auto_227266 ?auto_227272 ) ) ( not ( = ?auto_227266 ?auto_227273 ) ) ( not ( = ?auto_227266 ?auto_227274 ) ) ( not ( = ?auto_227266 ?auto_227275 ) ) ( not ( = ?auto_227267 ?auto_227268 ) ) ( not ( = ?auto_227267 ?auto_227269 ) ) ( not ( = ?auto_227267 ?auto_227270 ) ) ( not ( = ?auto_227267 ?auto_227271 ) ) ( not ( = ?auto_227267 ?auto_227272 ) ) ( not ( = ?auto_227267 ?auto_227273 ) ) ( not ( = ?auto_227267 ?auto_227274 ) ) ( not ( = ?auto_227267 ?auto_227275 ) ) ( not ( = ?auto_227268 ?auto_227269 ) ) ( not ( = ?auto_227268 ?auto_227270 ) ) ( not ( = ?auto_227268 ?auto_227271 ) ) ( not ( = ?auto_227268 ?auto_227272 ) ) ( not ( = ?auto_227268 ?auto_227273 ) ) ( not ( = ?auto_227268 ?auto_227274 ) ) ( not ( = ?auto_227268 ?auto_227275 ) ) ( not ( = ?auto_227269 ?auto_227270 ) ) ( not ( = ?auto_227269 ?auto_227271 ) ) ( not ( = ?auto_227269 ?auto_227272 ) ) ( not ( = ?auto_227269 ?auto_227273 ) ) ( not ( = ?auto_227269 ?auto_227274 ) ) ( not ( = ?auto_227269 ?auto_227275 ) ) ( not ( = ?auto_227270 ?auto_227271 ) ) ( not ( = ?auto_227270 ?auto_227272 ) ) ( not ( = ?auto_227270 ?auto_227273 ) ) ( not ( = ?auto_227270 ?auto_227274 ) ) ( not ( = ?auto_227270 ?auto_227275 ) ) ( not ( = ?auto_227271 ?auto_227272 ) ) ( not ( = ?auto_227271 ?auto_227273 ) ) ( not ( = ?auto_227271 ?auto_227274 ) ) ( not ( = ?auto_227271 ?auto_227275 ) ) ( not ( = ?auto_227272 ?auto_227273 ) ) ( not ( = ?auto_227272 ?auto_227274 ) ) ( not ( = ?auto_227272 ?auto_227275 ) ) ( not ( = ?auto_227273 ?auto_227274 ) ) ( not ( = ?auto_227273 ?auto_227275 ) ) ( not ( = ?auto_227274 ?auto_227275 ) ) ( CLEAR ?auto_227272 ) ( ON ?auto_227273 ?auto_227274 ) ( CLEAR ?auto_227273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_227266 ?auto_227267 ?auto_227268 ?auto_227269 ?auto_227270 ?auto_227271 ?auto_227272 ?auto_227273 )
      ( MAKE-9PILE ?auto_227266 ?auto_227267 ?auto_227268 ?auto_227269 ?auto_227270 ?auto_227271 ?auto_227272 ?auto_227273 ?auto_227274 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227285 - BLOCK
      ?auto_227286 - BLOCK
      ?auto_227287 - BLOCK
      ?auto_227288 - BLOCK
      ?auto_227289 - BLOCK
      ?auto_227290 - BLOCK
      ?auto_227291 - BLOCK
      ?auto_227292 - BLOCK
      ?auto_227293 - BLOCK
    )
    :vars
    (
      ?auto_227294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227293 ?auto_227294 ) ( ON-TABLE ?auto_227285 ) ( ON ?auto_227286 ?auto_227285 ) ( ON ?auto_227287 ?auto_227286 ) ( ON ?auto_227288 ?auto_227287 ) ( ON ?auto_227289 ?auto_227288 ) ( ON ?auto_227290 ?auto_227289 ) ( not ( = ?auto_227285 ?auto_227286 ) ) ( not ( = ?auto_227285 ?auto_227287 ) ) ( not ( = ?auto_227285 ?auto_227288 ) ) ( not ( = ?auto_227285 ?auto_227289 ) ) ( not ( = ?auto_227285 ?auto_227290 ) ) ( not ( = ?auto_227285 ?auto_227291 ) ) ( not ( = ?auto_227285 ?auto_227292 ) ) ( not ( = ?auto_227285 ?auto_227293 ) ) ( not ( = ?auto_227285 ?auto_227294 ) ) ( not ( = ?auto_227286 ?auto_227287 ) ) ( not ( = ?auto_227286 ?auto_227288 ) ) ( not ( = ?auto_227286 ?auto_227289 ) ) ( not ( = ?auto_227286 ?auto_227290 ) ) ( not ( = ?auto_227286 ?auto_227291 ) ) ( not ( = ?auto_227286 ?auto_227292 ) ) ( not ( = ?auto_227286 ?auto_227293 ) ) ( not ( = ?auto_227286 ?auto_227294 ) ) ( not ( = ?auto_227287 ?auto_227288 ) ) ( not ( = ?auto_227287 ?auto_227289 ) ) ( not ( = ?auto_227287 ?auto_227290 ) ) ( not ( = ?auto_227287 ?auto_227291 ) ) ( not ( = ?auto_227287 ?auto_227292 ) ) ( not ( = ?auto_227287 ?auto_227293 ) ) ( not ( = ?auto_227287 ?auto_227294 ) ) ( not ( = ?auto_227288 ?auto_227289 ) ) ( not ( = ?auto_227288 ?auto_227290 ) ) ( not ( = ?auto_227288 ?auto_227291 ) ) ( not ( = ?auto_227288 ?auto_227292 ) ) ( not ( = ?auto_227288 ?auto_227293 ) ) ( not ( = ?auto_227288 ?auto_227294 ) ) ( not ( = ?auto_227289 ?auto_227290 ) ) ( not ( = ?auto_227289 ?auto_227291 ) ) ( not ( = ?auto_227289 ?auto_227292 ) ) ( not ( = ?auto_227289 ?auto_227293 ) ) ( not ( = ?auto_227289 ?auto_227294 ) ) ( not ( = ?auto_227290 ?auto_227291 ) ) ( not ( = ?auto_227290 ?auto_227292 ) ) ( not ( = ?auto_227290 ?auto_227293 ) ) ( not ( = ?auto_227290 ?auto_227294 ) ) ( not ( = ?auto_227291 ?auto_227292 ) ) ( not ( = ?auto_227291 ?auto_227293 ) ) ( not ( = ?auto_227291 ?auto_227294 ) ) ( not ( = ?auto_227292 ?auto_227293 ) ) ( not ( = ?auto_227292 ?auto_227294 ) ) ( not ( = ?auto_227293 ?auto_227294 ) ) ( ON ?auto_227292 ?auto_227293 ) ( CLEAR ?auto_227290 ) ( ON ?auto_227291 ?auto_227292 ) ( CLEAR ?auto_227291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_227285 ?auto_227286 ?auto_227287 ?auto_227288 ?auto_227289 ?auto_227290 ?auto_227291 )
      ( MAKE-9PILE ?auto_227285 ?auto_227286 ?auto_227287 ?auto_227288 ?auto_227289 ?auto_227290 ?auto_227291 ?auto_227292 ?auto_227293 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227304 - BLOCK
      ?auto_227305 - BLOCK
      ?auto_227306 - BLOCK
      ?auto_227307 - BLOCK
      ?auto_227308 - BLOCK
      ?auto_227309 - BLOCK
      ?auto_227310 - BLOCK
      ?auto_227311 - BLOCK
      ?auto_227312 - BLOCK
    )
    :vars
    (
      ?auto_227313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227312 ?auto_227313 ) ( ON-TABLE ?auto_227304 ) ( ON ?auto_227305 ?auto_227304 ) ( ON ?auto_227306 ?auto_227305 ) ( ON ?auto_227307 ?auto_227306 ) ( ON ?auto_227308 ?auto_227307 ) ( ON ?auto_227309 ?auto_227308 ) ( not ( = ?auto_227304 ?auto_227305 ) ) ( not ( = ?auto_227304 ?auto_227306 ) ) ( not ( = ?auto_227304 ?auto_227307 ) ) ( not ( = ?auto_227304 ?auto_227308 ) ) ( not ( = ?auto_227304 ?auto_227309 ) ) ( not ( = ?auto_227304 ?auto_227310 ) ) ( not ( = ?auto_227304 ?auto_227311 ) ) ( not ( = ?auto_227304 ?auto_227312 ) ) ( not ( = ?auto_227304 ?auto_227313 ) ) ( not ( = ?auto_227305 ?auto_227306 ) ) ( not ( = ?auto_227305 ?auto_227307 ) ) ( not ( = ?auto_227305 ?auto_227308 ) ) ( not ( = ?auto_227305 ?auto_227309 ) ) ( not ( = ?auto_227305 ?auto_227310 ) ) ( not ( = ?auto_227305 ?auto_227311 ) ) ( not ( = ?auto_227305 ?auto_227312 ) ) ( not ( = ?auto_227305 ?auto_227313 ) ) ( not ( = ?auto_227306 ?auto_227307 ) ) ( not ( = ?auto_227306 ?auto_227308 ) ) ( not ( = ?auto_227306 ?auto_227309 ) ) ( not ( = ?auto_227306 ?auto_227310 ) ) ( not ( = ?auto_227306 ?auto_227311 ) ) ( not ( = ?auto_227306 ?auto_227312 ) ) ( not ( = ?auto_227306 ?auto_227313 ) ) ( not ( = ?auto_227307 ?auto_227308 ) ) ( not ( = ?auto_227307 ?auto_227309 ) ) ( not ( = ?auto_227307 ?auto_227310 ) ) ( not ( = ?auto_227307 ?auto_227311 ) ) ( not ( = ?auto_227307 ?auto_227312 ) ) ( not ( = ?auto_227307 ?auto_227313 ) ) ( not ( = ?auto_227308 ?auto_227309 ) ) ( not ( = ?auto_227308 ?auto_227310 ) ) ( not ( = ?auto_227308 ?auto_227311 ) ) ( not ( = ?auto_227308 ?auto_227312 ) ) ( not ( = ?auto_227308 ?auto_227313 ) ) ( not ( = ?auto_227309 ?auto_227310 ) ) ( not ( = ?auto_227309 ?auto_227311 ) ) ( not ( = ?auto_227309 ?auto_227312 ) ) ( not ( = ?auto_227309 ?auto_227313 ) ) ( not ( = ?auto_227310 ?auto_227311 ) ) ( not ( = ?auto_227310 ?auto_227312 ) ) ( not ( = ?auto_227310 ?auto_227313 ) ) ( not ( = ?auto_227311 ?auto_227312 ) ) ( not ( = ?auto_227311 ?auto_227313 ) ) ( not ( = ?auto_227312 ?auto_227313 ) ) ( ON ?auto_227311 ?auto_227312 ) ( CLEAR ?auto_227309 ) ( ON ?auto_227310 ?auto_227311 ) ( CLEAR ?auto_227310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_227304 ?auto_227305 ?auto_227306 ?auto_227307 ?auto_227308 ?auto_227309 ?auto_227310 )
      ( MAKE-9PILE ?auto_227304 ?auto_227305 ?auto_227306 ?auto_227307 ?auto_227308 ?auto_227309 ?auto_227310 ?auto_227311 ?auto_227312 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227323 - BLOCK
      ?auto_227324 - BLOCK
      ?auto_227325 - BLOCK
      ?auto_227326 - BLOCK
      ?auto_227327 - BLOCK
      ?auto_227328 - BLOCK
      ?auto_227329 - BLOCK
      ?auto_227330 - BLOCK
      ?auto_227331 - BLOCK
    )
    :vars
    (
      ?auto_227332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227331 ?auto_227332 ) ( ON-TABLE ?auto_227323 ) ( ON ?auto_227324 ?auto_227323 ) ( ON ?auto_227325 ?auto_227324 ) ( ON ?auto_227326 ?auto_227325 ) ( ON ?auto_227327 ?auto_227326 ) ( not ( = ?auto_227323 ?auto_227324 ) ) ( not ( = ?auto_227323 ?auto_227325 ) ) ( not ( = ?auto_227323 ?auto_227326 ) ) ( not ( = ?auto_227323 ?auto_227327 ) ) ( not ( = ?auto_227323 ?auto_227328 ) ) ( not ( = ?auto_227323 ?auto_227329 ) ) ( not ( = ?auto_227323 ?auto_227330 ) ) ( not ( = ?auto_227323 ?auto_227331 ) ) ( not ( = ?auto_227323 ?auto_227332 ) ) ( not ( = ?auto_227324 ?auto_227325 ) ) ( not ( = ?auto_227324 ?auto_227326 ) ) ( not ( = ?auto_227324 ?auto_227327 ) ) ( not ( = ?auto_227324 ?auto_227328 ) ) ( not ( = ?auto_227324 ?auto_227329 ) ) ( not ( = ?auto_227324 ?auto_227330 ) ) ( not ( = ?auto_227324 ?auto_227331 ) ) ( not ( = ?auto_227324 ?auto_227332 ) ) ( not ( = ?auto_227325 ?auto_227326 ) ) ( not ( = ?auto_227325 ?auto_227327 ) ) ( not ( = ?auto_227325 ?auto_227328 ) ) ( not ( = ?auto_227325 ?auto_227329 ) ) ( not ( = ?auto_227325 ?auto_227330 ) ) ( not ( = ?auto_227325 ?auto_227331 ) ) ( not ( = ?auto_227325 ?auto_227332 ) ) ( not ( = ?auto_227326 ?auto_227327 ) ) ( not ( = ?auto_227326 ?auto_227328 ) ) ( not ( = ?auto_227326 ?auto_227329 ) ) ( not ( = ?auto_227326 ?auto_227330 ) ) ( not ( = ?auto_227326 ?auto_227331 ) ) ( not ( = ?auto_227326 ?auto_227332 ) ) ( not ( = ?auto_227327 ?auto_227328 ) ) ( not ( = ?auto_227327 ?auto_227329 ) ) ( not ( = ?auto_227327 ?auto_227330 ) ) ( not ( = ?auto_227327 ?auto_227331 ) ) ( not ( = ?auto_227327 ?auto_227332 ) ) ( not ( = ?auto_227328 ?auto_227329 ) ) ( not ( = ?auto_227328 ?auto_227330 ) ) ( not ( = ?auto_227328 ?auto_227331 ) ) ( not ( = ?auto_227328 ?auto_227332 ) ) ( not ( = ?auto_227329 ?auto_227330 ) ) ( not ( = ?auto_227329 ?auto_227331 ) ) ( not ( = ?auto_227329 ?auto_227332 ) ) ( not ( = ?auto_227330 ?auto_227331 ) ) ( not ( = ?auto_227330 ?auto_227332 ) ) ( not ( = ?auto_227331 ?auto_227332 ) ) ( ON ?auto_227330 ?auto_227331 ) ( ON ?auto_227329 ?auto_227330 ) ( CLEAR ?auto_227327 ) ( ON ?auto_227328 ?auto_227329 ) ( CLEAR ?auto_227328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_227323 ?auto_227324 ?auto_227325 ?auto_227326 ?auto_227327 ?auto_227328 )
      ( MAKE-9PILE ?auto_227323 ?auto_227324 ?auto_227325 ?auto_227326 ?auto_227327 ?auto_227328 ?auto_227329 ?auto_227330 ?auto_227331 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227342 - BLOCK
      ?auto_227343 - BLOCK
      ?auto_227344 - BLOCK
      ?auto_227345 - BLOCK
      ?auto_227346 - BLOCK
      ?auto_227347 - BLOCK
      ?auto_227348 - BLOCK
      ?auto_227349 - BLOCK
      ?auto_227350 - BLOCK
    )
    :vars
    (
      ?auto_227351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227350 ?auto_227351 ) ( ON-TABLE ?auto_227342 ) ( ON ?auto_227343 ?auto_227342 ) ( ON ?auto_227344 ?auto_227343 ) ( ON ?auto_227345 ?auto_227344 ) ( ON ?auto_227346 ?auto_227345 ) ( not ( = ?auto_227342 ?auto_227343 ) ) ( not ( = ?auto_227342 ?auto_227344 ) ) ( not ( = ?auto_227342 ?auto_227345 ) ) ( not ( = ?auto_227342 ?auto_227346 ) ) ( not ( = ?auto_227342 ?auto_227347 ) ) ( not ( = ?auto_227342 ?auto_227348 ) ) ( not ( = ?auto_227342 ?auto_227349 ) ) ( not ( = ?auto_227342 ?auto_227350 ) ) ( not ( = ?auto_227342 ?auto_227351 ) ) ( not ( = ?auto_227343 ?auto_227344 ) ) ( not ( = ?auto_227343 ?auto_227345 ) ) ( not ( = ?auto_227343 ?auto_227346 ) ) ( not ( = ?auto_227343 ?auto_227347 ) ) ( not ( = ?auto_227343 ?auto_227348 ) ) ( not ( = ?auto_227343 ?auto_227349 ) ) ( not ( = ?auto_227343 ?auto_227350 ) ) ( not ( = ?auto_227343 ?auto_227351 ) ) ( not ( = ?auto_227344 ?auto_227345 ) ) ( not ( = ?auto_227344 ?auto_227346 ) ) ( not ( = ?auto_227344 ?auto_227347 ) ) ( not ( = ?auto_227344 ?auto_227348 ) ) ( not ( = ?auto_227344 ?auto_227349 ) ) ( not ( = ?auto_227344 ?auto_227350 ) ) ( not ( = ?auto_227344 ?auto_227351 ) ) ( not ( = ?auto_227345 ?auto_227346 ) ) ( not ( = ?auto_227345 ?auto_227347 ) ) ( not ( = ?auto_227345 ?auto_227348 ) ) ( not ( = ?auto_227345 ?auto_227349 ) ) ( not ( = ?auto_227345 ?auto_227350 ) ) ( not ( = ?auto_227345 ?auto_227351 ) ) ( not ( = ?auto_227346 ?auto_227347 ) ) ( not ( = ?auto_227346 ?auto_227348 ) ) ( not ( = ?auto_227346 ?auto_227349 ) ) ( not ( = ?auto_227346 ?auto_227350 ) ) ( not ( = ?auto_227346 ?auto_227351 ) ) ( not ( = ?auto_227347 ?auto_227348 ) ) ( not ( = ?auto_227347 ?auto_227349 ) ) ( not ( = ?auto_227347 ?auto_227350 ) ) ( not ( = ?auto_227347 ?auto_227351 ) ) ( not ( = ?auto_227348 ?auto_227349 ) ) ( not ( = ?auto_227348 ?auto_227350 ) ) ( not ( = ?auto_227348 ?auto_227351 ) ) ( not ( = ?auto_227349 ?auto_227350 ) ) ( not ( = ?auto_227349 ?auto_227351 ) ) ( not ( = ?auto_227350 ?auto_227351 ) ) ( ON ?auto_227349 ?auto_227350 ) ( ON ?auto_227348 ?auto_227349 ) ( CLEAR ?auto_227346 ) ( ON ?auto_227347 ?auto_227348 ) ( CLEAR ?auto_227347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_227342 ?auto_227343 ?auto_227344 ?auto_227345 ?auto_227346 ?auto_227347 )
      ( MAKE-9PILE ?auto_227342 ?auto_227343 ?auto_227344 ?auto_227345 ?auto_227346 ?auto_227347 ?auto_227348 ?auto_227349 ?auto_227350 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227361 - BLOCK
      ?auto_227362 - BLOCK
      ?auto_227363 - BLOCK
      ?auto_227364 - BLOCK
      ?auto_227365 - BLOCK
      ?auto_227366 - BLOCK
      ?auto_227367 - BLOCK
      ?auto_227368 - BLOCK
      ?auto_227369 - BLOCK
    )
    :vars
    (
      ?auto_227370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227369 ?auto_227370 ) ( ON-TABLE ?auto_227361 ) ( ON ?auto_227362 ?auto_227361 ) ( ON ?auto_227363 ?auto_227362 ) ( ON ?auto_227364 ?auto_227363 ) ( not ( = ?auto_227361 ?auto_227362 ) ) ( not ( = ?auto_227361 ?auto_227363 ) ) ( not ( = ?auto_227361 ?auto_227364 ) ) ( not ( = ?auto_227361 ?auto_227365 ) ) ( not ( = ?auto_227361 ?auto_227366 ) ) ( not ( = ?auto_227361 ?auto_227367 ) ) ( not ( = ?auto_227361 ?auto_227368 ) ) ( not ( = ?auto_227361 ?auto_227369 ) ) ( not ( = ?auto_227361 ?auto_227370 ) ) ( not ( = ?auto_227362 ?auto_227363 ) ) ( not ( = ?auto_227362 ?auto_227364 ) ) ( not ( = ?auto_227362 ?auto_227365 ) ) ( not ( = ?auto_227362 ?auto_227366 ) ) ( not ( = ?auto_227362 ?auto_227367 ) ) ( not ( = ?auto_227362 ?auto_227368 ) ) ( not ( = ?auto_227362 ?auto_227369 ) ) ( not ( = ?auto_227362 ?auto_227370 ) ) ( not ( = ?auto_227363 ?auto_227364 ) ) ( not ( = ?auto_227363 ?auto_227365 ) ) ( not ( = ?auto_227363 ?auto_227366 ) ) ( not ( = ?auto_227363 ?auto_227367 ) ) ( not ( = ?auto_227363 ?auto_227368 ) ) ( not ( = ?auto_227363 ?auto_227369 ) ) ( not ( = ?auto_227363 ?auto_227370 ) ) ( not ( = ?auto_227364 ?auto_227365 ) ) ( not ( = ?auto_227364 ?auto_227366 ) ) ( not ( = ?auto_227364 ?auto_227367 ) ) ( not ( = ?auto_227364 ?auto_227368 ) ) ( not ( = ?auto_227364 ?auto_227369 ) ) ( not ( = ?auto_227364 ?auto_227370 ) ) ( not ( = ?auto_227365 ?auto_227366 ) ) ( not ( = ?auto_227365 ?auto_227367 ) ) ( not ( = ?auto_227365 ?auto_227368 ) ) ( not ( = ?auto_227365 ?auto_227369 ) ) ( not ( = ?auto_227365 ?auto_227370 ) ) ( not ( = ?auto_227366 ?auto_227367 ) ) ( not ( = ?auto_227366 ?auto_227368 ) ) ( not ( = ?auto_227366 ?auto_227369 ) ) ( not ( = ?auto_227366 ?auto_227370 ) ) ( not ( = ?auto_227367 ?auto_227368 ) ) ( not ( = ?auto_227367 ?auto_227369 ) ) ( not ( = ?auto_227367 ?auto_227370 ) ) ( not ( = ?auto_227368 ?auto_227369 ) ) ( not ( = ?auto_227368 ?auto_227370 ) ) ( not ( = ?auto_227369 ?auto_227370 ) ) ( ON ?auto_227368 ?auto_227369 ) ( ON ?auto_227367 ?auto_227368 ) ( ON ?auto_227366 ?auto_227367 ) ( CLEAR ?auto_227364 ) ( ON ?auto_227365 ?auto_227366 ) ( CLEAR ?auto_227365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_227361 ?auto_227362 ?auto_227363 ?auto_227364 ?auto_227365 )
      ( MAKE-9PILE ?auto_227361 ?auto_227362 ?auto_227363 ?auto_227364 ?auto_227365 ?auto_227366 ?auto_227367 ?auto_227368 ?auto_227369 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227380 - BLOCK
      ?auto_227381 - BLOCK
      ?auto_227382 - BLOCK
      ?auto_227383 - BLOCK
      ?auto_227384 - BLOCK
      ?auto_227385 - BLOCK
      ?auto_227386 - BLOCK
      ?auto_227387 - BLOCK
      ?auto_227388 - BLOCK
    )
    :vars
    (
      ?auto_227389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227388 ?auto_227389 ) ( ON-TABLE ?auto_227380 ) ( ON ?auto_227381 ?auto_227380 ) ( ON ?auto_227382 ?auto_227381 ) ( ON ?auto_227383 ?auto_227382 ) ( not ( = ?auto_227380 ?auto_227381 ) ) ( not ( = ?auto_227380 ?auto_227382 ) ) ( not ( = ?auto_227380 ?auto_227383 ) ) ( not ( = ?auto_227380 ?auto_227384 ) ) ( not ( = ?auto_227380 ?auto_227385 ) ) ( not ( = ?auto_227380 ?auto_227386 ) ) ( not ( = ?auto_227380 ?auto_227387 ) ) ( not ( = ?auto_227380 ?auto_227388 ) ) ( not ( = ?auto_227380 ?auto_227389 ) ) ( not ( = ?auto_227381 ?auto_227382 ) ) ( not ( = ?auto_227381 ?auto_227383 ) ) ( not ( = ?auto_227381 ?auto_227384 ) ) ( not ( = ?auto_227381 ?auto_227385 ) ) ( not ( = ?auto_227381 ?auto_227386 ) ) ( not ( = ?auto_227381 ?auto_227387 ) ) ( not ( = ?auto_227381 ?auto_227388 ) ) ( not ( = ?auto_227381 ?auto_227389 ) ) ( not ( = ?auto_227382 ?auto_227383 ) ) ( not ( = ?auto_227382 ?auto_227384 ) ) ( not ( = ?auto_227382 ?auto_227385 ) ) ( not ( = ?auto_227382 ?auto_227386 ) ) ( not ( = ?auto_227382 ?auto_227387 ) ) ( not ( = ?auto_227382 ?auto_227388 ) ) ( not ( = ?auto_227382 ?auto_227389 ) ) ( not ( = ?auto_227383 ?auto_227384 ) ) ( not ( = ?auto_227383 ?auto_227385 ) ) ( not ( = ?auto_227383 ?auto_227386 ) ) ( not ( = ?auto_227383 ?auto_227387 ) ) ( not ( = ?auto_227383 ?auto_227388 ) ) ( not ( = ?auto_227383 ?auto_227389 ) ) ( not ( = ?auto_227384 ?auto_227385 ) ) ( not ( = ?auto_227384 ?auto_227386 ) ) ( not ( = ?auto_227384 ?auto_227387 ) ) ( not ( = ?auto_227384 ?auto_227388 ) ) ( not ( = ?auto_227384 ?auto_227389 ) ) ( not ( = ?auto_227385 ?auto_227386 ) ) ( not ( = ?auto_227385 ?auto_227387 ) ) ( not ( = ?auto_227385 ?auto_227388 ) ) ( not ( = ?auto_227385 ?auto_227389 ) ) ( not ( = ?auto_227386 ?auto_227387 ) ) ( not ( = ?auto_227386 ?auto_227388 ) ) ( not ( = ?auto_227386 ?auto_227389 ) ) ( not ( = ?auto_227387 ?auto_227388 ) ) ( not ( = ?auto_227387 ?auto_227389 ) ) ( not ( = ?auto_227388 ?auto_227389 ) ) ( ON ?auto_227387 ?auto_227388 ) ( ON ?auto_227386 ?auto_227387 ) ( ON ?auto_227385 ?auto_227386 ) ( CLEAR ?auto_227383 ) ( ON ?auto_227384 ?auto_227385 ) ( CLEAR ?auto_227384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_227380 ?auto_227381 ?auto_227382 ?auto_227383 ?auto_227384 )
      ( MAKE-9PILE ?auto_227380 ?auto_227381 ?auto_227382 ?auto_227383 ?auto_227384 ?auto_227385 ?auto_227386 ?auto_227387 ?auto_227388 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227399 - BLOCK
      ?auto_227400 - BLOCK
      ?auto_227401 - BLOCK
      ?auto_227402 - BLOCK
      ?auto_227403 - BLOCK
      ?auto_227404 - BLOCK
      ?auto_227405 - BLOCK
      ?auto_227406 - BLOCK
      ?auto_227407 - BLOCK
    )
    :vars
    (
      ?auto_227408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227407 ?auto_227408 ) ( ON-TABLE ?auto_227399 ) ( ON ?auto_227400 ?auto_227399 ) ( ON ?auto_227401 ?auto_227400 ) ( not ( = ?auto_227399 ?auto_227400 ) ) ( not ( = ?auto_227399 ?auto_227401 ) ) ( not ( = ?auto_227399 ?auto_227402 ) ) ( not ( = ?auto_227399 ?auto_227403 ) ) ( not ( = ?auto_227399 ?auto_227404 ) ) ( not ( = ?auto_227399 ?auto_227405 ) ) ( not ( = ?auto_227399 ?auto_227406 ) ) ( not ( = ?auto_227399 ?auto_227407 ) ) ( not ( = ?auto_227399 ?auto_227408 ) ) ( not ( = ?auto_227400 ?auto_227401 ) ) ( not ( = ?auto_227400 ?auto_227402 ) ) ( not ( = ?auto_227400 ?auto_227403 ) ) ( not ( = ?auto_227400 ?auto_227404 ) ) ( not ( = ?auto_227400 ?auto_227405 ) ) ( not ( = ?auto_227400 ?auto_227406 ) ) ( not ( = ?auto_227400 ?auto_227407 ) ) ( not ( = ?auto_227400 ?auto_227408 ) ) ( not ( = ?auto_227401 ?auto_227402 ) ) ( not ( = ?auto_227401 ?auto_227403 ) ) ( not ( = ?auto_227401 ?auto_227404 ) ) ( not ( = ?auto_227401 ?auto_227405 ) ) ( not ( = ?auto_227401 ?auto_227406 ) ) ( not ( = ?auto_227401 ?auto_227407 ) ) ( not ( = ?auto_227401 ?auto_227408 ) ) ( not ( = ?auto_227402 ?auto_227403 ) ) ( not ( = ?auto_227402 ?auto_227404 ) ) ( not ( = ?auto_227402 ?auto_227405 ) ) ( not ( = ?auto_227402 ?auto_227406 ) ) ( not ( = ?auto_227402 ?auto_227407 ) ) ( not ( = ?auto_227402 ?auto_227408 ) ) ( not ( = ?auto_227403 ?auto_227404 ) ) ( not ( = ?auto_227403 ?auto_227405 ) ) ( not ( = ?auto_227403 ?auto_227406 ) ) ( not ( = ?auto_227403 ?auto_227407 ) ) ( not ( = ?auto_227403 ?auto_227408 ) ) ( not ( = ?auto_227404 ?auto_227405 ) ) ( not ( = ?auto_227404 ?auto_227406 ) ) ( not ( = ?auto_227404 ?auto_227407 ) ) ( not ( = ?auto_227404 ?auto_227408 ) ) ( not ( = ?auto_227405 ?auto_227406 ) ) ( not ( = ?auto_227405 ?auto_227407 ) ) ( not ( = ?auto_227405 ?auto_227408 ) ) ( not ( = ?auto_227406 ?auto_227407 ) ) ( not ( = ?auto_227406 ?auto_227408 ) ) ( not ( = ?auto_227407 ?auto_227408 ) ) ( ON ?auto_227406 ?auto_227407 ) ( ON ?auto_227405 ?auto_227406 ) ( ON ?auto_227404 ?auto_227405 ) ( ON ?auto_227403 ?auto_227404 ) ( CLEAR ?auto_227401 ) ( ON ?auto_227402 ?auto_227403 ) ( CLEAR ?auto_227402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_227399 ?auto_227400 ?auto_227401 ?auto_227402 )
      ( MAKE-9PILE ?auto_227399 ?auto_227400 ?auto_227401 ?auto_227402 ?auto_227403 ?auto_227404 ?auto_227405 ?auto_227406 ?auto_227407 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227418 - BLOCK
      ?auto_227419 - BLOCK
      ?auto_227420 - BLOCK
      ?auto_227421 - BLOCK
      ?auto_227422 - BLOCK
      ?auto_227423 - BLOCK
      ?auto_227424 - BLOCK
      ?auto_227425 - BLOCK
      ?auto_227426 - BLOCK
    )
    :vars
    (
      ?auto_227427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227426 ?auto_227427 ) ( ON-TABLE ?auto_227418 ) ( ON ?auto_227419 ?auto_227418 ) ( ON ?auto_227420 ?auto_227419 ) ( not ( = ?auto_227418 ?auto_227419 ) ) ( not ( = ?auto_227418 ?auto_227420 ) ) ( not ( = ?auto_227418 ?auto_227421 ) ) ( not ( = ?auto_227418 ?auto_227422 ) ) ( not ( = ?auto_227418 ?auto_227423 ) ) ( not ( = ?auto_227418 ?auto_227424 ) ) ( not ( = ?auto_227418 ?auto_227425 ) ) ( not ( = ?auto_227418 ?auto_227426 ) ) ( not ( = ?auto_227418 ?auto_227427 ) ) ( not ( = ?auto_227419 ?auto_227420 ) ) ( not ( = ?auto_227419 ?auto_227421 ) ) ( not ( = ?auto_227419 ?auto_227422 ) ) ( not ( = ?auto_227419 ?auto_227423 ) ) ( not ( = ?auto_227419 ?auto_227424 ) ) ( not ( = ?auto_227419 ?auto_227425 ) ) ( not ( = ?auto_227419 ?auto_227426 ) ) ( not ( = ?auto_227419 ?auto_227427 ) ) ( not ( = ?auto_227420 ?auto_227421 ) ) ( not ( = ?auto_227420 ?auto_227422 ) ) ( not ( = ?auto_227420 ?auto_227423 ) ) ( not ( = ?auto_227420 ?auto_227424 ) ) ( not ( = ?auto_227420 ?auto_227425 ) ) ( not ( = ?auto_227420 ?auto_227426 ) ) ( not ( = ?auto_227420 ?auto_227427 ) ) ( not ( = ?auto_227421 ?auto_227422 ) ) ( not ( = ?auto_227421 ?auto_227423 ) ) ( not ( = ?auto_227421 ?auto_227424 ) ) ( not ( = ?auto_227421 ?auto_227425 ) ) ( not ( = ?auto_227421 ?auto_227426 ) ) ( not ( = ?auto_227421 ?auto_227427 ) ) ( not ( = ?auto_227422 ?auto_227423 ) ) ( not ( = ?auto_227422 ?auto_227424 ) ) ( not ( = ?auto_227422 ?auto_227425 ) ) ( not ( = ?auto_227422 ?auto_227426 ) ) ( not ( = ?auto_227422 ?auto_227427 ) ) ( not ( = ?auto_227423 ?auto_227424 ) ) ( not ( = ?auto_227423 ?auto_227425 ) ) ( not ( = ?auto_227423 ?auto_227426 ) ) ( not ( = ?auto_227423 ?auto_227427 ) ) ( not ( = ?auto_227424 ?auto_227425 ) ) ( not ( = ?auto_227424 ?auto_227426 ) ) ( not ( = ?auto_227424 ?auto_227427 ) ) ( not ( = ?auto_227425 ?auto_227426 ) ) ( not ( = ?auto_227425 ?auto_227427 ) ) ( not ( = ?auto_227426 ?auto_227427 ) ) ( ON ?auto_227425 ?auto_227426 ) ( ON ?auto_227424 ?auto_227425 ) ( ON ?auto_227423 ?auto_227424 ) ( ON ?auto_227422 ?auto_227423 ) ( CLEAR ?auto_227420 ) ( ON ?auto_227421 ?auto_227422 ) ( CLEAR ?auto_227421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_227418 ?auto_227419 ?auto_227420 ?auto_227421 )
      ( MAKE-9PILE ?auto_227418 ?auto_227419 ?auto_227420 ?auto_227421 ?auto_227422 ?auto_227423 ?auto_227424 ?auto_227425 ?auto_227426 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227437 - BLOCK
      ?auto_227438 - BLOCK
      ?auto_227439 - BLOCK
      ?auto_227440 - BLOCK
      ?auto_227441 - BLOCK
      ?auto_227442 - BLOCK
      ?auto_227443 - BLOCK
      ?auto_227444 - BLOCK
      ?auto_227445 - BLOCK
    )
    :vars
    (
      ?auto_227446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227445 ?auto_227446 ) ( ON-TABLE ?auto_227437 ) ( ON ?auto_227438 ?auto_227437 ) ( not ( = ?auto_227437 ?auto_227438 ) ) ( not ( = ?auto_227437 ?auto_227439 ) ) ( not ( = ?auto_227437 ?auto_227440 ) ) ( not ( = ?auto_227437 ?auto_227441 ) ) ( not ( = ?auto_227437 ?auto_227442 ) ) ( not ( = ?auto_227437 ?auto_227443 ) ) ( not ( = ?auto_227437 ?auto_227444 ) ) ( not ( = ?auto_227437 ?auto_227445 ) ) ( not ( = ?auto_227437 ?auto_227446 ) ) ( not ( = ?auto_227438 ?auto_227439 ) ) ( not ( = ?auto_227438 ?auto_227440 ) ) ( not ( = ?auto_227438 ?auto_227441 ) ) ( not ( = ?auto_227438 ?auto_227442 ) ) ( not ( = ?auto_227438 ?auto_227443 ) ) ( not ( = ?auto_227438 ?auto_227444 ) ) ( not ( = ?auto_227438 ?auto_227445 ) ) ( not ( = ?auto_227438 ?auto_227446 ) ) ( not ( = ?auto_227439 ?auto_227440 ) ) ( not ( = ?auto_227439 ?auto_227441 ) ) ( not ( = ?auto_227439 ?auto_227442 ) ) ( not ( = ?auto_227439 ?auto_227443 ) ) ( not ( = ?auto_227439 ?auto_227444 ) ) ( not ( = ?auto_227439 ?auto_227445 ) ) ( not ( = ?auto_227439 ?auto_227446 ) ) ( not ( = ?auto_227440 ?auto_227441 ) ) ( not ( = ?auto_227440 ?auto_227442 ) ) ( not ( = ?auto_227440 ?auto_227443 ) ) ( not ( = ?auto_227440 ?auto_227444 ) ) ( not ( = ?auto_227440 ?auto_227445 ) ) ( not ( = ?auto_227440 ?auto_227446 ) ) ( not ( = ?auto_227441 ?auto_227442 ) ) ( not ( = ?auto_227441 ?auto_227443 ) ) ( not ( = ?auto_227441 ?auto_227444 ) ) ( not ( = ?auto_227441 ?auto_227445 ) ) ( not ( = ?auto_227441 ?auto_227446 ) ) ( not ( = ?auto_227442 ?auto_227443 ) ) ( not ( = ?auto_227442 ?auto_227444 ) ) ( not ( = ?auto_227442 ?auto_227445 ) ) ( not ( = ?auto_227442 ?auto_227446 ) ) ( not ( = ?auto_227443 ?auto_227444 ) ) ( not ( = ?auto_227443 ?auto_227445 ) ) ( not ( = ?auto_227443 ?auto_227446 ) ) ( not ( = ?auto_227444 ?auto_227445 ) ) ( not ( = ?auto_227444 ?auto_227446 ) ) ( not ( = ?auto_227445 ?auto_227446 ) ) ( ON ?auto_227444 ?auto_227445 ) ( ON ?auto_227443 ?auto_227444 ) ( ON ?auto_227442 ?auto_227443 ) ( ON ?auto_227441 ?auto_227442 ) ( ON ?auto_227440 ?auto_227441 ) ( CLEAR ?auto_227438 ) ( ON ?auto_227439 ?auto_227440 ) ( CLEAR ?auto_227439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_227437 ?auto_227438 ?auto_227439 )
      ( MAKE-9PILE ?auto_227437 ?auto_227438 ?auto_227439 ?auto_227440 ?auto_227441 ?auto_227442 ?auto_227443 ?auto_227444 ?auto_227445 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227456 - BLOCK
      ?auto_227457 - BLOCK
      ?auto_227458 - BLOCK
      ?auto_227459 - BLOCK
      ?auto_227460 - BLOCK
      ?auto_227461 - BLOCK
      ?auto_227462 - BLOCK
      ?auto_227463 - BLOCK
      ?auto_227464 - BLOCK
    )
    :vars
    (
      ?auto_227465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227464 ?auto_227465 ) ( ON-TABLE ?auto_227456 ) ( ON ?auto_227457 ?auto_227456 ) ( not ( = ?auto_227456 ?auto_227457 ) ) ( not ( = ?auto_227456 ?auto_227458 ) ) ( not ( = ?auto_227456 ?auto_227459 ) ) ( not ( = ?auto_227456 ?auto_227460 ) ) ( not ( = ?auto_227456 ?auto_227461 ) ) ( not ( = ?auto_227456 ?auto_227462 ) ) ( not ( = ?auto_227456 ?auto_227463 ) ) ( not ( = ?auto_227456 ?auto_227464 ) ) ( not ( = ?auto_227456 ?auto_227465 ) ) ( not ( = ?auto_227457 ?auto_227458 ) ) ( not ( = ?auto_227457 ?auto_227459 ) ) ( not ( = ?auto_227457 ?auto_227460 ) ) ( not ( = ?auto_227457 ?auto_227461 ) ) ( not ( = ?auto_227457 ?auto_227462 ) ) ( not ( = ?auto_227457 ?auto_227463 ) ) ( not ( = ?auto_227457 ?auto_227464 ) ) ( not ( = ?auto_227457 ?auto_227465 ) ) ( not ( = ?auto_227458 ?auto_227459 ) ) ( not ( = ?auto_227458 ?auto_227460 ) ) ( not ( = ?auto_227458 ?auto_227461 ) ) ( not ( = ?auto_227458 ?auto_227462 ) ) ( not ( = ?auto_227458 ?auto_227463 ) ) ( not ( = ?auto_227458 ?auto_227464 ) ) ( not ( = ?auto_227458 ?auto_227465 ) ) ( not ( = ?auto_227459 ?auto_227460 ) ) ( not ( = ?auto_227459 ?auto_227461 ) ) ( not ( = ?auto_227459 ?auto_227462 ) ) ( not ( = ?auto_227459 ?auto_227463 ) ) ( not ( = ?auto_227459 ?auto_227464 ) ) ( not ( = ?auto_227459 ?auto_227465 ) ) ( not ( = ?auto_227460 ?auto_227461 ) ) ( not ( = ?auto_227460 ?auto_227462 ) ) ( not ( = ?auto_227460 ?auto_227463 ) ) ( not ( = ?auto_227460 ?auto_227464 ) ) ( not ( = ?auto_227460 ?auto_227465 ) ) ( not ( = ?auto_227461 ?auto_227462 ) ) ( not ( = ?auto_227461 ?auto_227463 ) ) ( not ( = ?auto_227461 ?auto_227464 ) ) ( not ( = ?auto_227461 ?auto_227465 ) ) ( not ( = ?auto_227462 ?auto_227463 ) ) ( not ( = ?auto_227462 ?auto_227464 ) ) ( not ( = ?auto_227462 ?auto_227465 ) ) ( not ( = ?auto_227463 ?auto_227464 ) ) ( not ( = ?auto_227463 ?auto_227465 ) ) ( not ( = ?auto_227464 ?auto_227465 ) ) ( ON ?auto_227463 ?auto_227464 ) ( ON ?auto_227462 ?auto_227463 ) ( ON ?auto_227461 ?auto_227462 ) ( ON ?auto_227460 ?auto_227461 ) ( ON ?auto_227459 ?auto_227460 ) ( CLEAR ?auto_227457 ) ( ON ?auto_227458 ?auto_227459 ) ( CLEAR ?auto_227458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_227456 ?auto_227457 ?auto_227458 )
      ( MAKE-9PILE ?auto_227456 ?auto_227457 ?auto_227458 ?auto_227459 ?auto_227460 ?auto_227461 ?auto_227462 ?auto_227463 ?auto_227464 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227475 - BLOCK
      ?auto_227476 - BLOCK
      ?auto_227477 - BLOCK
      ?auto_227478 - BLOCK
      ?auto_227479 - BLOCK
      ?auto_227480 - BLOCK
      ?auto_227481 - BLOCK
      ?auto_227482 - BLOCK
      ?auto_227483 - BLOCK
    )
    :vars
    (
      ?auto_227484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227483 ?auto_227484 ) ( ON-TABLE ?auto_227475 ) ( not ( = ?auto_227475 ?auto_227476 ) ) ( not ( = ?auto_227475 ?auto_227477 ) ) ( not ( = ?auto_227475 ?auto_227478 ) ) ( not ( = ?auto_227475 ?auto_227479 ) ) ( not ( = ?auto_227475 ?auto_227480 ) ) ( not ( = ?auto_227475 ?auto_227481 ) ) ( not ( = ?auto_227475 ?auto_227482 ) ) ( not ( = ?auto_227475 ?auto_227483 ) ) ( not ( = ?auto_227475 ?auto_227484 ) ) ( not ( = ?auto_227476 ?auto_227477 ) ) ( not ( = ?auto_227476 ?auto_227478 ) ) ( not ( = ?auto_227476 ?auto_227479 ) ) ( not ( = ?auto_227476 ?auto_227480 ) ) ( not ( = ?auto_227476 ?auto_227481 ) ) ( not ( = ?auto_227476 ?auto_227482 ) ) ( not ( = ?auto_227476 ?auto_227483 ) ) ( not ( = ?auto_227476 ?auto_227484 ) ) ( not ( = ?auto_227477 ?auto_227478 ) ) ( not ( = ?auto_227477 ?auto_227479 ) ) ( not ( = ?auto_227477 ?auto_227480 ) ) ( not ( = ?auto_227477 ?auto_227481 ) ) ( not ( = ?auto_227477 ?auto_227482 ) ) ( not ( = ?auto_227477 ?auto_227483 ) ) ( not ( = ?auto_227477 ?auto_227484 ) ) ( not ( = ?auto_227478 ?auto_227479 ) ) ( not ( = ?auto_227478 ?auto_227480 ) ) ( not ( = ?auto_227478 ?auto_227481 ) ) ( not ( = ?auto_227478 ?auto_227482 ) ) ( not ( = ?auto_227478 ?auto_227483 ) ) ( not ( = ?auto_227478 ?auto_227484 ) ) ( not ( = ?auto_227479 ?auto_227480 ) ) ( not ( = ?auto_227479 ?auto_227481 ) ) ( not ( = ?auto_227479 ?auto_227482 ) ) ( not ( = ?auto_227479 ?auto_227483 ) ) ( not ( = ?auto_227479 ?auto_227484 ) ) ( not ( = ?auto_227480 ?auto_227481 ) ) ( not ( = ?auto_227480 ?auto_227482 ) ) ( not ( = ?auto_227480 ?auto_227483 ) ) ( not ( = ?auto_227480 ?auto_227484 ) ) ( not ( = ?auto_227481 ?auto_227482 ) ) ( not ( = ?auto_227481 ?auto_227483 ) ) ( not ( = ?auto_227481 ?auto_227484 ) ) ( not ( = ?auto_227482 ?auto_227483 ) ) ( not ( = ?auto_227482 ?auto_227484 ) ) ( not ( = ?auto_227483 ?auto_227484 ) ) ( ON ?auto_227482 ?auto_227483 ) ( ON ?auto_227481 ?auto_227482 ) ( ON ?auto_227480 ?auto_227481 ) ( ON ?auto_227479 ?auto_227480 ) ( ON ?auto_227478 ?auto_227479 ) ( ON ?auto_227477 ?auto_227478 ) ( CLEAR ?auto_227475 ) ( ON ?auto_227476 ?auto_227477 ) ( CLEAR ?auto_227476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_227475 ?auto_227476 )
      ( MAKE-9PILE ?auto_227475 ?auto_227476 ?auto_227477 ?auto_227478 ?auto_227479 ?auto_227480 ?auto_227481 ?auto_227482 ?auto_227483 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227494 - BLOCK
      ?auto_227495 - BLOCK
      ?auto_227496 - BLOCK
      ?auto_227497 - BLOCK
      ?auto_227498 - BLOCK
      ?auto_227499 - BLOCK
      ?auto_227500 - BLOCK
      ?auto_227501 - BLOCK
      ?auto_227502 - BLOCK
    )
    :vars
    (
      ?auto_227503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227502 ?auto_227503 ) ( ON-TABLE ?auto_227494 ) ( not ( = ?auto_227494 ?auto_227495 ) ) ( not ( = ?auto_227494 ?auto_227496 ) ) ( not ( = ?auto_227494 ?auto_227497 ) ) ( not ( = ?auto_227494 ?auto_227498 ) ) ( not ( = ?auto_227494 ?auto_227499 ) ) ( not ( = ?auto_227494 ?auto_227500 ) ) ( not ( = ?auto_227494 ?auto_227501 ) ) ( not ( = ?auto_227494 ?auto_227502 ) ) ( not ( = ?auto_227494 ?auto_227503 ) ) ( not ( = ?auto_227495 ?auto_227496 ) ) ( not ( = ?auto_227495 ?auto_227497 ) ) ( not ( = ?auto_227495 ?auto_227498 ) ) ( not ( = ?auto_227495 ?auto_227499 ) ) ( not ( = ?auto_227495 ?auto_227500 ) ) ( not ( = ?auto_227495 ?auto_227501 ) ) ( not ( = ?auto_227495 ?auto_227502 ) ) ( not ( = ?auto_227495 ?auto_227503 ) ) ( not ( = ?auto_227496 ?auto_227497 ) ) ( not ( = ?auto_227496 ?auto_227498 ) ) ( not ( = ?auto_227496 ?auto_227499 ) ) ( not ( = ?auto_227496 ?auto_227500 ) ) ( not ( = ?auto_227496 ?auto_227501 ) ) ( not ( = ?auto_227496 ?auto_227502 ) ) ( not ( = ?auto_227496 ?auto_227503 ) ) ( not ( = ?auto_227497 ?auto_227498 ) ) ( not ( = ?auto_227497 ?auto_227499 ) ) ( not ( = ?auto_227497 ?auto_227500 ) ) ( not ( = ?auto_227497 ?auto_227501 ) ) ( not ( = ?auto_227497 ?auto_227502 ) ) ( not ( = ?auto_227497 ?auto_227503 ) ) ( not ( = ?auto_227498 ?auto_227499 ) ) ( not ( = ?auto_227498 ?auto_227500 ) ) ( not ( = ?auto_227498 ?auto_227501 ) ) ( not ( = ?auto_227498 ?auto_227502 ) ) ( not ( = ?auto_227498 ?auto_227503 ) ) ( not ( = ?auto_227499 ?auto_227500 ) ) ( not ( = ?auto_227499 ?auto_227501 ) ) ( not ( = ?auto_227499 ?auto_227502 ) ) ( not ( = ?auto_227499 ?auto_227503 ) ) ( not ( = ?auto_227500 ?auto_227501 ) ) ( not ( = ?auto_227500 ?auto_227502 ) ) ( not ( = ?auto_227500 ?auto_227503 ) ) ( not ( = ?auto_227501 ?auto_227502 ) ) ( not ( = ?auto_227501 ?auto_227503 ) ) ( not ( = ?auto_227502 ?auto_227503 ) ) ( ON ?auto_227501 ?auto_227502 ) ( ON ?auto_227500 ?auto_227501 ) ( ON ?auto_227499 ?auto_227500 ) ( ON ?auto_227498 ?auto_227499 ) ( ON ?auto_227497 ?auto_227498 ) ( ON ?auto_227496 ?auto_227497 ) ( CLEAR ?auto_227494 ) ( ON ?auto_227495 ?auto_227496 ) ( CLEAR ?auto_227495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_227494 ?auto_227495 )
      ( MAKE-9PILE ?auto_227494 ?auto_227495 ?auto_227496 ?auto_227497 ?auto_227498 ?auto_227499 ?auto_227500 ?auto_227501 ?auto_227502 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227513 - BLOCK
      ?auto_227514 - BLOCK
      ?auto_227515 - BLOCK
      ?auto_227516 - BLOCK
      ?auto_227517 - BLOCK
      ?auto_227518 - BLOCK
      ?auto_227519 - BLOCK
      ?auto_227520 - BLOCK
      ?auto_227521 - BLOCK
    )
    :vars
    (
      ?auto_227522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227521 ?auto_227522 ) ( not ( = ?auto_227513 ?auto_227514 ) ) ( not ( = ?auto_227513 ?auto_227515 ) ) ( not ( = ?auto_227513 ?auto_227516 ) ) ( not ( = ?auto_227513 ?auto_227517 ) ) ( not ( = ?auto_227513 ?auto_227518 ) ) ( not ( = ?auto_227513 ?auto_227519 ) ) ( not ( = ?auto_227513 ?auto_227520 ) ) ( not ( = ?auto_227513 ?auto_227521 ) ) ( not ( = ?auto_227513 ?auto_227522 ) ) ( not ( = ?auto_227514 ?auto_227515 ) ) ( not ( = ?auto_227514 ?auto_227516 ) ) ( not ( = ?auto_227514 ?auto_227517 ) ) ( not ( = ?auto_227514 ?auto_227518 ) ) ( not ( = ?auto_227514 ?auto_227519 ) ) ( not ( = ?auto_227514 ?auto_227520 ) ) ( not ( = ?auto_227514 ?auto_227521 ) ) ( not ( = ?auto_227514 ?auto_227522 ) ) ( not ( = ?auto_227515 ?auto_227516 ) ) ( not ( = ?auto_227515 ?auto_227517 ) ) ( not ( = ?auto_227515 ?auto_227518 ) ) ( not ( = ?auto_227515 ?auto_227519 ) ) ( not ( = ?auto_227515 ?auto_227520 ) ) ( not ( = ?auto_227515 ?auto_227521 ) ) ( not ( = ?auto_227515 ?auto_227522 ) ) ( not ( = ?auto_227516 ?auto_227517 ) ) ( not ( = ?auto_227516 ?auto_227518 ) ) ( not ( = ?auto_227516 ?auto_227519 ) ) ( not ( = ?auto_227516 ?auto_227520 ) ) ( not ( = ?auto_227516 ?auto_227521 ) ) ( not ( = ?auto_227516 ?auto_227522 ) ) ( not ( = ?auto_227517 ?auto_227518 ) ) ( not ( = ?auto_227517 ?auto_227519 ) ) ( not ( = ?auto_227517 ?auto_227520 ) ) ( not ( = ?auto_227517 ?auto_227521 ) ) ( not ( = ?auto_227517 ?auto_227522 ) ) ( not ( = ?auto_227518 ?auto_227519 ) ) ( not ( = ?auto_227518 ?auto_227520 ) ) ( not ( = ?auto_227518 ?auto_227521 ) ) ( not ( = ?auto_227518 ?auto_227522 ) ) ( not ( = ?auto_227519 ?auto_227520 ) ) ( not ( = ?auto_227519 ?auto_227521 ) ) ( not ( = ?auto_227519 ?auto_227522 ) ) ( not ( = ?auto_227520 ?auto_227521 ) ) ( not ( = ?auto_227520 ?auto_227522 ) ) ( not ( = ?auto_227521 ?auto_227522 ) ) ( ON ?auto_227520 ?auto_227521 ) ( ON ?auto_227519 ?auto_227520 ) ( ON ?auto_227518 ?auto_227519 ) ( ON ?auto_227517 ?auto_227518 ) ( ON ?auto_227516 ?auto_227517 ) ( ON ?auto_227515 ?auto_227516 ) ( ON ?auto_227514 ?auto_227515 ) ( ON ?auto_227513 ?auto_227514 ) ( CLEAR ?auto_227513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_227513 )
      ( MAKE-9PILE ?auto_227513 ?auto_227514 ?auto_227515 ?auto_227516 ?auto_227517 ?auto_227518 ?auto_227519 ?auto_227520 ?auto_227521 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_227532 - BLOCK
      ?auto_227533 - BLOCK
      ?auto_227534 - BLOCK
      ?auto_227535 - BLOCK
      ?auto_227536 - BLOCK
      ?auto_227537 - BLOCK
      ?auto_227538 - BLOCK
      ?auto_227539 - BLOCK
      ?auto_227540 - BLOCK
    )
    :vars
    (
      ?auto_227541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227540 ?auto_227541 ) ( not ( = ?auto_227532 ?auto_227533 ) ) ( not ( = ?auto_227532 ?auto_227534 ) ) ( not ( = ?auto_227532 ?auto_227535 ) ) ( not ( = ?auto_227532 ?auto_227536 ) ) ( not ( = ?auto_227532 ?auto_227537 ) ) ( not ( = ?auto_227532 ?auto_227538 ) ) ( not ( = ?auto_227532 ?auto_227539 ) ) ( not ( = ?auto_227532 ?auto_227540 ) ) ( not ( = ?auto_227532 ?auto_227541 ) ) ( not ( = ?auto_227533 ?auto_227534 ) ) ( not ( = ?auto_227533 ?auto_227535 ) ) ( not ( = ?auto_227533 ?auto_227536 ) ) ( not ( = ?auto_227533 ?auto_227537 ) ) ( not ( = ?auto_227533 ?auto_227538 ) ) ( not ( = ?auto_227533 ?auto_227539 ) ) ( not ( = ?auto_227533 ?auto_227540 ) ) ( not ( = ?auto_227533 ?auto_227541 ) ) ( not ( = ?auto_227534 ?auto_227535 ) ) ( not ( = ?auto_227534 ?auto_227536 ) ) ( not ( = ?auto_227534 ?auto_227537 ) ) ( not ( = ?auto_227534 ?auto_227538 ) ) ( not ( = ?auto_227534 ?auto_227539 ) ) ( not ( = ?auto_227534 ?auto_227540 ) ) ( not ( = ?auto_227534 ?auto_227541 ) ) ( not ( = ?auto_227535 ?auto_227536 ) ) ( not ( = ?auto_227535 ?auto_227537 ) ) ( not ( = ?auto_227535 ?auto_227538 ) ) ( not ( = ?auto_227535 ?auto_227539 ) ) ( not ( = ?auto_227535 ?auto_227540 ) ) ( not ( = ?auto_227535 ?auto_227541 ) ) ( not ( = ?auto_227536 ?auto_227537 ) ) ( not ( = ?auto_227536 ?auto_227538 ) ) ( not ( = ?auto_227536 ?auto_227539 ) ) ( not ( = ?auto_227536 ?auto_227540 ) ) ( not ( = ?auto_227536 ?auto_227541 ) ) ( not ( = ?auto_227537 ?auto_227538 ) ) ( not ( = ?auto_227537 ?auto_227539 ) ) ( not ( = ?auto_227537 ?auto_227540 ) ) ( not ( = ?auto_227537 ?auto_227541 ) ) ( not ( = ?auto_227538 ?auto_227539 ) ) ( not ( = ?auto_227538 ?auto_227540 ) ) ( not ( = ?auto_227538 ?auto_227541 ) ) ( not ( = ?auto_227539 ?auto_227540 ) ) ( not ( = ?auto_227539 ?auto_227541 ) ) ( not ( = ?auto_227540 ?auto_227541 ) ) ( ON ?auto_227539 ?auto_227540 ) ( ON ?auto_227538 ?auto_227539 ) ( ON ?auto_227537 ?auto_227538 ) ( ON ?auto_227536 ?auto_227537 ) ( ON ?auto_227535 ?auto_227536 ) ( ON ?auto_227534 ?auto_227535 ) ( ON ?auto_227533 ?auto_227534 ) ( ON ?auto_227532 ?auto_227533 ) ( CLEAR ?auto_227532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_227532 )
      ( MAKE-9PILE ?auto_227532 ?auto_227533 ?auto_227534 ?auto_227535 ?auto_227536 ?auto_227537 ?auto_227538 ?auto_227539 ?auto_227540 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227552 - BLOCK
      ?auto_227553 - BLOCK
      ?auto_227554 - BLOCK
      ?auto_227555 - BLOCK
      ?auto_227556 - BLOCK
      ?auto_227557 - BLOCK
      ?auto_227558 - BLOCK
      ?auto_227559 - BLOCK
      ?auto_227560 - BLOCK
      ?auto_227561 - BLOCK
    )
    :vars
    (
      ?auto_227562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_227560 ) ( ON ?auto_227561 ?auto_227562 ) ( CLEAR ?auto_227561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_227552 ) ( ON ?auto_227553 ?auto_227552 ) ( ON ?auto_227554 ?auto_227553 ) ( ON ?auto_227555 ?auto_227554 ) ( ON ?auto_227556 ?auto_227555 ) ( ON ?auto_227557 ?auto_227556 ) ( ON ?auto_227558 ?auto_227557 ) ( ON ?auto_227559 ?auto_227558 ) ( ON ?auto_227560 ?auto_227559 ) ( not ( = ?auto_227552 ?auto_227553 ) ) ( not ( = ?auto_227552 ?auto_227554 ) ) ( not ( = ?auto_227552 ?auto_227555 ) ) ( not ( = ?auto_227552 ?auto_227556 ) ) ( not ( = ?auto_227552 ?auto_227557 ) ) ( not ( = ?auto_227552 ?auto_227558 ) ) ( not ( = ?auto_227552 ?auto_227559 ) ) ( not ( = ?auto_227552 ?auto_227560 ) ) ( not ( = ?auto_227552 ?auto_227561 ) ) ( not ( = ?auto_227552 ?auto_227562 ) ) ( not ( = ?auto_227553 ?auto_227554 ) ) ( not ( = ?auto_227553 ?auto_227555 ) ) ( not ( = ?auto_227553 ?auto_227556 ) ) ( not ( = ?auto_227553 ?auto_227557 ) ) ( not ( = ?auto_227553 ?auto_227558 ) ) ( not ( = ?auto_227553 ?auto_227559 ) ) ( not ( = ?auto_227553 ?auto_227560 ) ) ( not ( = ?auto_227553 ?auto_227561 ) ) ( not ( = ?auto_227553 ?auto_227562 ) ) ( not ( = ?auto_227554 ?auto_227555 ) ) ( not ( = ?auto_227554 ?auto_227556 ) ) ( not ( = ?auto_227554 ?auto_227557 ) ) ( not ( = ?auto_227554 ?auto_227558 ) ) ( not ( = ?auto_227554 ?auto_227559 ) ) ( not ( = ?auto_227554 ?auto_227560 ) ) ( not ( = ?auto_227554 ?auto_227561 ) ) ( not ( = ?auto_227554 ?auto_227562 ) ) ( not ( = ?auto_227555 ?auto_227556 ) ) ( not ( = ?auto_227555 ?auto_227557 ) ) ( not ( = ?auto_227555 ?auto_227558 ) ) ( not ( = ?auto_227555 ?auto_227559 ) ) ( not ( = ?auto_227555 ?auto_227560 ) ) ( not ( = ?auto_227555 ?auto_227561 ) ) ( not ( = ?auto_227555 ?auto_227562 ) ) ( not ( = ?auto_227556 ?auto_227557 ) ) ( not ( = ?auto_227556 ?auto_227558 ) ) ( not ( = ?auto_227556 ?auto_227559 ) ) ( not ( = ?auto_227556 ?auto_227560 ) ) ( not ( = ?auto_227556 ?auto_227561 ) ) ( not ( = ?auto_227556 ?auto_227562 ) ) ( not ( = ?auto_227557 ?auto_227558 ) ) ( not ( = ?auto_227557 ?auto_227559 ) ) ( not ( = ?auto_227557 ?auto_227560 ) ) ( not ( = ?auto_227557 ?auto_227561 ) ) ( not ( = ?auto_227557 ?auto_227562 ) ) ( not ( = ?auto_227558 ?auto_227559 ) ) ( not ( = ?auto_227558 ?auto_227560 ) ) ( not ( = ?auto_227558 ?auto_227561 ) ) ( not ( = ?auto_227558 ?auto_227562 ) ) ( not ( = ?auto_227559 ?auto_227560 ) ) ( not ( = ?auto_227559 ?auto_227561 ) ) ( not ( = ?auto_227559 ?auto_227562 ) ) ( not ( = ?auto_227560 ?auto_227561 ) ) ( not ( = ?auto_227560 ?auto_227562 ) ) ( not ( = ?auto_227561 ?auto_227562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_227561 ?auto_227562 )
      ( !STACK ?auto_227561 ?auto_227560 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227573 - BLOCK
      ?auto_227574 - BLOCK
      ?auto_227575 - BLOCK
      ?auto_227576 - BLOCK
      ?auto_227577 - BLOCK
      ?auto_227578 - BLOCK
      ?auto_227579 - BLOCK
      ?auto_227580 - BLOCK
      ?auto_227581 - BLOCK
      ?auto_227582 - BLOCK
    )
    :vars
    (
      ?auto_227583 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_227581 ) ( ON ?auto_227582 ?auto_227583 ) ( CLEAR ?auto_227582 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_227573 ) ( ON ?auto_227574 ?auto_227573 ) ( ON ?auto_227575 ?auto_227574 ) ( ON ?auto_227576 ?auto_227575 ) ( ON ?auto_227577 ?auto_227576 ) ( ON ?auto_227578 ?auto_227577 ) ( ON ?auto_227579 ?auto_227578 ) ( ON ?auto_227580 ?auto_227579 ) ( ON ?auto_227581 ?auto_227580 ) ( not ( = ?auto_227573 ?auto_227574 ) ) ( not ( = ?auto_227573 ?auto_227575 ) ) ( not ( = ?auto_227573 ?auto_227576 ) ) ( not ( = ?auto_227573 ?auto_227577 ) ) ( not ( = ?auto_227573 ?auto_227578 ) ) ( not ( = ?auto_227573 ?auto_227579 ) ) ( not ( = ?auto_227573 ?auto_227580 ) ) ( not ( = ?auto_227573 ?auto_227581 ) ) ( not ( = ?auto_227573 ?auto_227582 ) ) ( not ( = ?auto_227573 ?auto_227583 ) ) ( not ( = ?auto_227574 ?auto_227575 ) ) ( not ( = ?auto_227574 ?auto_227576 ) ) ( not ( = ?auto_227574 ?auto_227577 ) ) ( not ( = ?auto_227574 ?auto_227578 ) ) ( not ( = ?auto_227574 ?auto_227579 ) ) ( not ( = ?auto_227574 ?auto_227580 ) ) ( not ( = ?auto_227574 ?auto_227581 ) ) ( not ( = ?auto_227574 ?auto_227582 ) ) ( not ( = ?auto_227574 ?auto_227583 ) ) ( not ( = ?auto_227575 ?auto_227576 ) ) ( not ( = ?auto_227575 ?auto_227577 ) ) ( not ( = ?auto_227575 ?auto_227578 ) ) ( not ( = ?auto_227575 ?auto_227579 ) ) ( not ( = ?auto_227575 ?auto_227580 ) ) ( not ( = ?auto_227575 ?auto_227581 ) ) ( not ( = ?auto_227575 ?auto_227582 ) ) ( not ( = ?auto_227575 ?auto_227583 ) ) ( not ( = ?auto_227576 ?auto_227577 ) ) ( not ( = ?auto_227576 ?auto_227578 ) ) ( not ( = ?auto_227576 ?auto_227579 ) ) ( not ( = ?auto_227576 ?auto_227580 ) ) ( not ( = ?auto_227576 ?auto_227581 ) ) ( not ( = ?auto_227576 ?auto_227582 ) ) ( not ( = ?auto_227576 ?auto_227583 ) ) ( not ( = ?auto_227577 ?auto_227578 ) ) ( not ( = ?auto_227577 ?auto_227579 ) ) ( not ( = ?auto_227577 ?auto_227580 ) ) ( not ( = ?auto_227577 ?auto_227581 ) ) ( not ( = ?auto_227577 ?auto_227582 ) ) ( not ( = ?auto_227577 ?auto_227583 ) ) ( not ( = ?auto_227578 ?auto_227579 ) ) ( not ( = ?auto_227578 ?auto_227580 ) ) ( not ( = ?auto_227578 ?auto_227581 ) ) ( not ( = ?auto_227578 ?auto_227582 ) ) ( not ( = ?auto_227578 ?auto_227583 ) ) ( not ( = ?auto_227579 ?auto_227580 ) ) ( not ( = ?auto_227579 ?auto_227581 ) ) ( not ( = ?auto_227579 ?auto_227582 ) ) ( not ( = ?auto_227579 ?auto_227583 ) ) ( not ( = ?auto_227580 ?auto_227581 ) ) ( not ( = ?auto_227580 ?auto_227582 ) ) ( not ( = ?auto_227580 ?auto_227583 ) ) ( not ( = ?auto_227581 ?auto_227582 ) ) ( not ( = ?auto_227581 ?auto_227583 ) ) ( not ( = ?auto_227582 ?auto_227583 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_227582 ?auto_227583 )
      ( !STACK ?auto_227582 ?auto_227581 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227594 - BLOCK
      ?auto_227595 - BLOCK
      ?auto_227596 - BLOCK
      ?auto_227597 - BLOCK
      ?auto_227598 - BLOCK
      ?auto_227599 - BLOCK
      ?auto_227600 - BLOCK
      ?auto_227601 - BLOCK
      ?auto_227602 - BLOCK
      ?auto_227603 - BLOCK
    )
    :vars
    (
      ?auto_227604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227603 ?auto_227604 ) ( ON-TABLE ?auto_227594 ) ( ON ?auto_227595 ?auto_227594 ) ( ON ?auto_227596 ?auto_227595 ) ( ON ?auto_227597 ?auto_227596 ) ( ON ?auto_227598 ?auto_227597 ) ( ON ?auto_227599 ?auto_227598 ) ( ON ?auto_227600 ?auto_227599 ) ( ON ?auto_227601 ?auto_227600 ) ( not ( = ?auto_227594 ?auto_227595 ) ) ( not ( = ?auto_227594 ?auto_227596 ) ) ( not ( = ?auto_227594 ?auto_227597 ) ) ( not ( = ?auto_227594 ?auto_227598 ) ) ( not ( = ?auto_227594 ?auto_227599 ) ) ( not ( = ?auto_227594 ?auto_227600 ) ) ( not ( = ?auto_227594 ?auto_227601 ) ) ( not ( = ?auto_227594 ?auto_227602 ) ) ( not ( = ?auto_227594 ?auto_227603 ) ) ( not ( = ?auto_227594 ?auto_227604 ) ) ( not ( = ?auto_227595 ?auto_227596 ) ) ( not ( = ?auto_227595 ?auto_227597 ) ) ( not ( = ?auto_227595 ?auto_227598 ) ) ( not ( = ?auto_227595 ?auto_227599 ) ) ( not ( = ?auto_227595 ?auto_227600 ) ) ( not ( = ?auto_227595 ?auto_227601 ) ) ( not ( = ?auto_227595 ?auto_227602 ) ) ( not ( = ?auto_227595 ?auto_227603 ) ) ( not ( = ?auto_227595 ?auto_227604 ) ) ( not ( = ?auto_227596 ?auto_227597 ) ) ( not ( = ?auto_227596 ?auto_227598 ) ) ( not ( = ?auto_227596 ?auto_227599 ) ) ( not ( = ?auto_227596 ?auto_227600 ) ) ( not ( = ?auto_227596 ?auto_227601 ) ) ( not ( = ?auto_227596 ?auto_227602 ) ) ( not ( = ?auto_227596 ?auto_227603 ) ) ( not ( = ?auto_227596 ?auto_227604 ) ) ( not ( = ?auto_227597 ?auto_227598 ) ) ( not ( = ?auto_227597 ?auto_227599 ) ) ( not ( = ?auto_227597 ?auto_227600 ) ) ( not ( = ?auto_227597 ?auto_227601 ) ) ( not ( = ?auto_227597 ?auto_227602 ) ) ( not ( = ?auto_227597 ?auto_227603 ) ) ( not ( = ?auto_227597 ?auto_227604 ) ) ( not ( = ?auto_227598 ?auto_227599 ) ) ( not ( = ?auto_227598 ?auto_227600 ) ) ( not ( = ?auto_227598 ?auto_227601 ) ) ( not ( = ?auto_227598 ?auto_227602 ) ) ( not ( = ?auto_227598 ?auto_227603 ) ) ( not ( = ?auto_227598 ?auto_227604 ) ) ( not ( = ?auto_227599 ?auto_227600 ) ) ( not ( = ?auto_227599 ?auto_227601 ) ) ( not ( = ?auto_227599 ?auto_227602 ) ) ( not ( = ?auto_227599 ?auto_227603 ) ) ( not ( = ?auto_227599 ?auto_227604 ) ) ( not ( = ?auto_227600 ?auto_227601 ) ) ( not ( = ?auto_227600 ?auto_227602 ) ) ( not ( = ?auto_227600 ?auto_227603 ) ) ( not ( = ?auto_227600 ?auto_227604 ) ) ( not ( = ?auto_227601 ?auto_227602 ) ) ( not ( = ?auto_227601 ?auto_227603 ) ) ( not ( = ?auto_227601 ?auto_227604 ) ) ( not ( = ?auto_227602 ?auto_227603 ) ) ( not ( = ?auto_227602 ?auto_227604 ) ) ( not ( = ?auto_227603 ?auto_227604 ) ) ( CLEAR ?auto_227601 ) ( ON ?auto_227602 ?auto_227603 ) ( CLEAR ?auto_227602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_227594 ?auto_227595 ?auto_227596 ?auto_227597 ?auto_227598 ?auto_227599 ?auto_227600 ?auto_227601 ?auto_227602 )
      ( MAKE-10PILE ?auto_227594 ?auto_227595 ?auto_227596 ?auto_227597 ?auto_227598 ?auto_227599 ?auto_227600 ?auto_227601 ?auto_227602 ?auto_227603 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227615 - BLOCK
      ?auto_227616 - BLOCK
      ?auto_227617 - BLOCK
      ?auto_227618 - BLOCK
      ?auto_227619 - BLOCK
      ?auto_227620 - BLOCK
      ?auto_227621 - BLOCK
      ?auto_227622 - BLOCK
      ?auto_227623 - BLOCK
      ?auto_227624 - BLOCK
    )
    :vars
    (
      ?auto_227625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227624 ?auto_227625 ) ( ON-TABLE ?auto_227615 ) ( ON ?auto_227616 ?auto_227615 ) ( ON ?auto_227617 ?auto_227616 ) ( ON ?auto_227618 ?auto_227617 ) ( ON ?auto_227619 ?auto_227618 ) ( ON ?auto_227620 ?auto_227619 ) ( ON ?auto_227621 ?auto_227620 ) ( ON ?auto_227622 ?auto_227621 ) ( not ( = ?auto_227615 ?auto_227616 ) ) ( not ( = ?auto_227615 ?auto_227617 ) ) ( not ( = ?auto_227615 ?auto_227618 ) ) ( not ( = ?auto_227615 ?auto_227619 ) ) ( not ( = ?auto_227615 ?auto_227620 ) ) ( not ( = ?auto_227615 ?auto_227621 ) ) ( not ( = ?auto_227615 ?auto_227622 ) ) ( not ( = ?auto_227615 ?auto_227623 ) ) ( not ( = ?auto_227615 ?auto_227624 ) ) ( not ( = ?auto_227615 ?auto_227625 ) ) ( not ( = ?auto_227616 ?auto_227617 ) ) ( not ( = ?auto_227616 ?auto_227618 ) ) ( not ( = ?auto_227616 ?auto_227619 ) ) ( not ( = ?auto_227616 ?auto_227620 ) ) ( not ( = ?auto_227616 ?auto_227621 ) ) ( not ( = ?auto_227616 ?auto_227622 ) ) ( not ( = ?auto_227616 ?auto_227623 ) ) ( not ( = ?auto_227616 ?auto_227624 ) ) ( not ( = ?auto_227616 ?auto_227625 ) ) ( not ( = ?auto_227617 ?auto_227618 ) ) ( not ( = ?auto_227617 ?auto_227619 ) ) ( not ( = ?auto_227617 ?auto_227620 ) ) ( not ( = ?auto_227617 ?auto_227621 ) ) ( not ( = ?auto_227617 ?auto_227622 ) ) ( not ( = ?auto_227617 ?auto_227623 ) ) ( not ( = ?auto_227617 ?auto_227624 ) ) ( not ( = ?auto_227617 ?auto_227625 ) ) ( not ( = ?auto_227618 ?auto_227619 ) ) ( not ( = ?auto_227618 ?auto_227620 ) ) ( not ( = ?auto_227618 ?auto_227621 ) ) ( not ( = ?auto_227618 ?auto_227622 ) ) ( not ( = ?auto_227618 ?auto_227623 ) ) ( not ( = ?auto_227618 ?auto_227624 ) ) ( not ( = ?auto_227618 ?auto_227625 ) ) ( not ( = ?auto_227619 ?auto_227620 ) ) ( not ( = ?auto_227619 ?auto_227621 ) ) ( not ( = ?auto_227619 ?auto_227622 ) ) ( not ( = ?auto_227619 ?auto_227623 ) ) ( not ( = ?auto_227619 ?auto_227624 ) ) ( not ( = ?auto_227619 ?auto_227625 ) ) ( not ( = ?auto_227620 ?auto_227621 ) ) ( not ( = ?auto_227620 ?auto_227622 ) ) ( not ( = ?auto_227620 ?auto_227623 ) ) ( not ( = ?auto_227620 ?auto_227624 ) ) ( not ( = ?auto_227620 ?auto_227625 ) ) ( not ( = ?auto_227621 ?auto_227622 ) ) ( not ( = ?auto_227621 ?auto_227623 ) ) ( not ( = ?auto_227621 ?auto_227624 ) ) ( not ( = ?auto_227621 ?auto_227625 ) ) ( not ( = ?auto_227622 ?auto_227623 ) ) ( not ( = ?auto_227622 ?auto_227624 ) ) ( not ( = ?auto_227622 ?auto_227625 ) ) ( not ( = ?auto_227623 ?auto_227624 ) ) ( not ( = ?auto_227623 ?auto_227625 ) ) ( not ( = ?auto_227624 ?auto_227625 ) ) ( CLEAR ?auto_227622 ) ( ON ?auto_227623 ?auto_227624 ) ( CLEAR ?auto_227623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_227615 ?auto_227616 ?auto_227617 ?auto_227618 ?auto_227619 ?auto_227620 ?auto_227621 ?auto_227622 ?auto_227623 )
      ( MAKE-10PILE ?auto_227615 ?auto_227616 ?auto_227617 ?auto_227618 ?auto_227619 ?auto_227620 ?auto_227621 ?auto_227622 ?auto_227623 ?auto_227624 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227636 - BLOCK
      ?auto_227637 - BLOCK
      ?auto_227638 - BLOCK
      ?auto_227639 - BLOCK
      ?auto_227640 - BLOCK
      ?auto_227641 - BLOCK
      ?auto_227642 - BLOCK
      ?auto_227643 - BLOCK
      ?auto_227644 - BLOCK
      ?auto_227645 - BLOCK
    )
    :vars
    (
      ?auto_227646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227645 ?auto_227646 ) ( ON-TABLE ?auto_227636 ) ( ON ?auto_227637 ?auto_227636 ) ( ON ?auto_227638 ?auto_227637 ) ( ON ?auto_227639 ?auto_227638 ) ( ON ?auto_227640 ?auto_227639 ) ( ON ?auto_227641 ?auto_227640 ) ( ON ?auto_227642 ?auto_227641 ) ( not ( = ?auto_227636 ?auto_227637 ) ) ( not ( = ?auto_227636 ?auto_227638 ) ) ( not ( = ?auto_227636 ?auto_227639 ) ) ( not ( = ?auto_227636 ?auto_227640 ) ) ( not ( = ?auto_227636 ?auto_227641 ) ) ( not ( = ?auto_227636 ?auto_227642 ) ) ( not ( = ?auto_227636 ?auto_227643 ) ) ( not ( = ?auto_227636 ?auto_227644 ) ) ( not ( = ?auto_227636 ?auto_227645 ) ) ( not ( = ?auto_227636 ?auto_227646 ) ) ( not ( = ?auto_227637 ?auto_227638 ) ) ( not ( = ?auto_227637 ?auto_227639 ) ) ( not ( = ?auto_227637 ?auto_227640 ) ) ( not ( = ?auto_227637 ?auto_227641 ) ) ( not ( = ?auto_227637 ?auto_227642 ) ) ( not ( = ?auto_227637 ?auto_227643 ) ) ( not ( = ?auto_227637 ?auto_227644 ) ) ( not ( = ?auto_227637 ?auto_227645 ) ) ( not ( = ?auto_227637 ?auto_227646 ) ) ( not ( = ?auto_227638 ?auto_227639 ) ) ( not ( = ?auto_227638 ?auto_227640 ) ) ( not ( = ?auto_227638 ?auto_227641 ) ) ( not ( = ?auto_227638 ?auto_227642 ) ) ( not ( = ?auto_227638 ?auto_227643 ) ) ( not ( = ?auto_227638 ?auto_227644 ) ) ( not ( = ?auto_227638 ?auto_227645 ) ) ( not ( = ?auto_227638 ?auto_227646 ) ) ( not ( = ?auto_227639 ?auto_227640 ) ) ( not ( = ?auto_227639 ?auto_227641 ) ) ( not ( = ?auto_227639 ?auto_227642 ) ) ( not ( = ?auto_227639 ?auto_227643 ) ) ( not ( = ?auto_227639 ?auto_227644 ) ) ( not ( = ?auto_227639 ?auto_227645 ) ) ( not ( = ?auto_227639 ?auto_227646 ) ) ( not ( = ?auto_227640 ?auto_227641 ) ) ( not ( = ?auto_227640 ?auto_227642 ) ) ( not ( = ?auto_227640 ?auto_227643 ) ) ( not ( = ?auto_227640 ?auto_227644 ) ) ( not ( = ?auto_227640 ?auto_227645 ) ) ( not ( = ?auto_227640 ?auto_227646 ) ) ( not ( = ?auto_227641 ?auto_227642 ) ) ( not ( = ?auto_227641 ?auto_227643 ) ) ( not ( = ?auto_227641 ?auto_227644 ) ) ( not ( = ?auto_227641 ?auto_227645 ) ) ( not ( = ?auto_227641 ?auto_227646 ) ) ( not ( = ?auto_227642 ?auto_227643 ) ) ( not ( = ?auto_227642 ?auto_227644 ) ) ( not ( = ?auto_227642 ?auto_227645 ) ) ( not ( = ?auto_227642 ?auto_227646 ) ) ( not ( = ?auto_227643 ?auto_227644 ) ) ( not ( = ?auto_227643 ?auto_227645 ) ) ( not ( = ?auto_227643 ?auto_227646 ) ) ( not ( = ?auto_227644 ?auto_227645 ) ) ( not ( = ?auto_227644 ?auto_227646 ) ) ( not ( = ?auto_227645 ?auto_227646 ) ) ( ON ?auto_227644 ?auto_227645 ) ( CLEAR ?auto_227642 ) ( ON ?auto_227643 ?auto_227644 ) ( CLEAR ?auto_227643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_227636 ?auto_227637 ?auto_227638 ?auto_227639 ?auto_227640 ?auto_227641 ?auto_227642 ?auto_227643 )
      ( MAKE-10PILE ?auto_227636 ?auto_227637 ?auto_227638 ?auto_227639 ?auto_227640 ?auto_227641 ?auto_227642 ?auto_227643 ?auto_227644 ?auto_227645 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227657 - BLOCK
      ?auto_227658 - BLOCK
      ?auto_227659 - BLOCK
      ?auto_227660 - BLOCK
      ?auto_227661 - BLOCK
      ?auto_227662 - BLOCK
      ?auto_227663 - BLOCK
      ?auto_227664 - BLOCK
      ?auto_227665 - BLOCK
      ?auto_227666 - BLOCK
    )
    :vars
    (
      ?auto_227667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227666 ?auto_227667 ) ( ON-TABLE ?auto_227657 ) ( ON ?auto_227658 ?auto_227657 ) ( ON ?auto_227659 ?auto_227658 ) ( ON ?auto_227660 ?auto_227659 ) ( ON ?auto_227661 ?auto_227660 ) ( ON ?auto_227662 ?auto_227661 ) ( ON ?auto_227663 ?auto_227662 ) ( not ( = ?auto_227657 ?auto_227658 ) ) ( not ( = ?auto_227657 ?auto_227659 ) ) ( not ( = ?auto_227657 ?auto_227660 ) ) ( not ( = ?auto_227657 ?auto_227661 ) ) ( not ( = ?auto_227657 ?auto_227662 ) ) ( not ( = ?auto_227657 ?auto_227663 ) ) ( not ( = ?auto_227657 ?auto_227664 ) ) ( not ( = ?auto_227657 ?auto_227665 ) ) ( not ( = ?auto_227657 ?auto_227666 ) ) ( not ( = ?auto_227657 ?auto_227667 ) ) ( not ( = ?auto_227658 ?auto_227659 ) ) ( not ( = ?auto_227658 ?auto_227660 ) ) ( not ( = ?auto_227658 ?auto_227661 ) ) ( not ( = ?auto_227658 ?auto_227662 ) ) ( not ( = ?auto_227658 ?auto_227663 ) ) ( not ( = ?auto_227658 ?auto_227664 ) ) ( not ( = ?auto_227658 ?auto_227665 ) ) ( not ( = ?auto_227658 ?auto_227666 ) ) ( not ( = ?auto_227658 ?auto_227667 ) ) ( not ( = ?auto_227659 ?auto_227660 ) ) ( not ( = ?auto_227659 ?auto_227661 ) ) ( not ( = ?auto_227659 ?auto_227662 ) ) ( not ( = ?auto_227659 ?auto_227663 ) ) ( not ( = ?auto_227659 ?auto_227664 ) ) ( not ( = ?auto_227659 ?auto_227665 ) ) ( not ( = ?auto_227659 ?auto_227666 ) ) ( not ( = ?auto_227659 ?auto_227667 ) ) ( not ( = ?auto_227660 ?auto_227661 ) ) ( not ( = ?auto_227660 ?auto_227662 ) ) ( not ( = ?auto_227660 ?auto_227663 ) ) ( not ( = ?auto_227660 ?auto_227664 ) ) ( not ( = ?auto_227660 ?auto_227665 ) ) ( not ( = ?auto_227660 ?auto_227666 ) ) ( not ( = ?auto_227660 ?auto_227667 ) ) ( not ( = ?auto_227661 ?auto_227662 ) ) ( not ( = ?auto_227661 ?auto_227663 ) ) ( not ( = ?auto_227661 ?auto_227664 ) ) ( not ( = ?auto_227661 ?auto_227665 ) ) ( not ( = ?auto_227661 ?auto_227666 ) ) ( not ( = ?auto_227661 ?auto_227667 ) ) ( not ( = ?auto_227662 ?auto_227663 ) ) ( not ( = ?auto_227662 ?auto_227664 ) ) ( not ( = ?auto_227662 ?auto_227665 ) ) ( not ( = ?auto_227662 ?auto_227666 ) ) ( not ( = ?auto_227662 ?auto_227667 ) ) ( not ( = ?auto_227663 ?auto_227664 ) ) ( not ( = ?auto_227663 ?auto_227665 ) ) ( not ( = ?auto_227663 ?auto_227666 ) ) ( not ( = ?auto_227663 ?auto_227667 ) ) ( not ( = ?auto_227664 ?auto_227665 ) ) ( not ( = ?auto_227664 ?auto_227666 ) ) ( not ( = ?auto_227664 ?auto_227667 ) ) ( not ( = ?auto_227665 ?auto_227666 ) ) ( not ( = ?auto_227665 ?auto_227667 ) ) ( not ( = ?auto_227666 ?auto_227667 ) ) ( ON ?auto_227665 ?auto_227666 ) ( CLEAR ?auto_227663 ) ( ON ?auto_227664 ?auto_227665 ) ( CLEAR ?auto_227664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_227657 ?auto_227658 ?auto_227659 ?auto_227660 ?auto_227661 ?auto_227662 ?auto_227663 ?auto_227664 )
      ( MAKE-10PILE ?auto_227657 ?auto_227658 ?auto_227659 ?auto_227660 ?auto_227661 ?auto_227662 ?auto_227663 ?auto_227664 ?auto_227665 ?auto_227666 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227678 - BLOCK
      ?auto_227679 - BLOCK
      ?auto_227680 - BLOCK
      ?auto_227681 - BLOCK
      ?auto_227682 - BLOCK
      ?auto_227683 - BLOCK
      ?auto_227684 - BLOCK
      ?auto_227685 - BLOCK
      ?auto_227686 - BLOCK
      ?auto_227687 - BLOCK
    )
    :vars
    (
      ?auto_227688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227687 ?auto_227688 ) ( ON-TABLE ?auto_227678 ) ( ON ?auto_227679 ?auto_227678 ) ( ON ?auto_227680 ?auto_227679 ) ( ON ?auto_227681 ?auto_227680 ) ( ON ?auto_227682 ?auto_227681 ) ( ON ?auto_227683 ?auto_227682 ) ( not ( = ?auto_227678 ?auto_227679 ) ) ( not ( = ?auto_227678 ?auto_227680 ) ) ( not ( = ?auto_227678 ?auto_227681 ) ) ( not ( = ?auto_227678 ?auto_227682 ) ) ( not ( = ?auto_227678 ?auto_227683 ) ) ( not ( = ?auto_227678 ?auto_227684 ) ) ( not ( = ?auto_227678 ?auto_227685 ) ) ( not ( = ?auto_227678 ?auto_227686 ) ) ( not ( = ?auto_227678 ?auto_227687 ) ) ( not ( = ?auto_227678 ?auto_227688 ) ) ( not ( = ?auto_227679 ?auto_227680 ) ) ( not ( = ?auto_227679 ?auto_227681 ) ) ( not ( = ?auto_227679 ?auto_227682 ) ) ( not ( = ?auto_227679 ?auto_227683 ) ) ( not ( = ?auto_227679 ?auto_227684 ) ) ( not ( = ?auto_227679 ?auto_227685 ) ) ( not ( = ?auto_227679 ?auto_227686 ) ) ( not ( = ?auto_227679 ?auto_227687 ) ) ( not ( = ?auto_227679 ?auto_227688 ) ) ( not ( = ?auto_227680 ?auto_227681 ) ) ( not ( = ?auto_227680 ?auto_227682 ) ) ( not ( = ?auto_227680 ?auto_227683 ) ) ( not ( = ?auto_227680 ?auto_227684 ) ) ( not ( = ?auto_227680 ?auto_227685 ) ) ( not ( = ?auto_227680 ?auto_227686 ) ) ( not ( = ?auto_227680 ?auto_227687 ) ) ( not ( = ?auto_227680 ?auto_227688 ) ) ( not ( = ?auto_227681 ?auto_227682 ) ) ( not ( = ?auto_227681 ?auto_227683 ) ) ( not ( = ?auto_227681 ?auto_227684 ) ) ( not ( = ?auto_227681 ?auto_227685 ) ) ( not ( = ?auto_227681 ?auto_227686 ) ) ( not ( = ?auto_227681 ?auto_227687 ) ) ( not ( = ?auto_227681 ?auto_227688 ) ) ( not ( = ?auto_227682 ?auto_227683 ) ) ( not ( = ?auto_227682 ?auto_227684 ) ) ( not ( = ?auto_227682 ?auto_227685 ) ) ( not ( = ?auto_227682 ?auto_227686 ) ) ( not ( = ?auto_227682 ?auto_227687 ) ) ( not ( = ?auto_227682 ?auto_227688 ) ) ( not ( = ?auto_227683 ?auto_227684 ) ) ( not ( = ?auto_227683 ?auto_227685 ) ) ( not ( = ?auto_227683 ?auto_227686 ) ) ( not ( = ?auto_227683 ?auto_227687 ) ) ( not ( = ?auto_227683 ?auto_227688 ) ) ( not ( = ?auto_227684 ?auto_227685 ) ) ( not ( = ?auto_227684 ?auto_227686 ) ) ( not ( = ?auto_227684 ?auto_227687 ) ) ( not ( = ?auto_227684 ?auto_227688 ) ) ( not ( = ?auto_227685 ?auto_227686 ) ) ( not ( = ?auto_227685 ?auto_227687 ) ) ( not ( = ?auto_227685 ?auto_227688 ) ) ( not ( = ?auto_227686 ?auto_227687 ) ) ( not ( = ?auto_227686 ?auto_227688 ) ) ( not ( = ?auto_227687 ?auto_227688 ) ) ( ON ?auto_227686 ?auto_227687 ) ( ON ?auto_227685 ?auto_227686 ) ( CLEAR ?auto_227683 ) ( ON ?auto_227684 ?auto_227685 ) ( CLEAR ?auto_227684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_227678 ?auto_227679 ?auto_227680 ?auto_227681 ?auto_227682 ?auto_227683 ?auto_227684 )
      ( MAKE-10PILE ?auto_227678 ?auto_227679 ?auto_227680 ?auto_227681 ?auto_227682 ?auto_227683 ?auto_227684 ?auto_227685 ?auto_227686 ?auto_227687 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227699 - BLOCK
      ?auto_227700 - BLOCK
      ?auto_227701 - BLOCK
      ?auto_227702 - BLOCK
      ?auto_227703 - BLOCK
      ?auto_227704 - BLOCK
      ?auto_227705 - BLOCK
      ?auto_227706 - BLOCK
      ?auto_227707 - BLOCK
      ?auto_227708 - BLOCK
    )
    :vars
    (
      ?auto_227709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227708 ?auto_227709 ) ( ON-TABLE ?auto_227699 ) ( ON ?auto_227700 ?auto_227699 ) ( ON ?auto_227701 ?auto_227700 ) ( ON ?auto_227702 ?auto_227701 ) ( ON ?auto_227703 ?auto_227702 ) ( ON ?auto_227704 ?auto_227703 ) ( not ( = ?auto_227699 ?auto_227700 ) ) ( not ( = ?auto_227699 ?auto_227701 ) ) ( not ( = ?auto_227699 ?auto_227702 ) ) ( not ( = ?auto_227699 ?auto_227703 ) ) ( not ( = ?auto_227699 ?auto_227704 ) ) ( not ( = ?auto_227699 ?auto_227705 ) ) ( not ( = ?auto_227699 ?auto_227706 ) ) ( not ( = ?auto_227699 ?auto_227707 ) ) ( not ( = ?auto_227699 ?auto_227708 ) ) ( not ( = ?auto_227699 ?auto_227709 ) ) ( not ( = ?auto_227700 ?auto_227701 ) ) ( not ( = ?auto_227700 ?auto_227702 ) ) ( not ( = ?auto_227700 ?auto_227703 ) ) ( not ( = ?auto_227700 ?auto_227704 ) ) ( not ( = ?auto_227700 ?auto_227705 ) ) ( not ( = ?auto_227700 ?auto_227706 ) ) ( not ( = ?auto_227700 ?auto_227707 ) ) ( not ( = ?auto_227700 ?auto_227708 ) ) ( not ( = ?auto_227700 ?auto_227709 ) ) ( not ( = ?auto_227701 ?auto_227702 ) ) ( not ( = ?auto_227701 ?auto_227703 ) ) ( not ( = ?auto_227701 ?auto_227704 ) ) ( not ( = ?auto_227701 ?auto_227705 ) ) ( not ( = ?auto_227701 ?auto_227706 ) ) ( not ( = ?auto_227701 ?auto_227707 ) ) ( not ( = ?auto_227701 ?auto_227708 ) ) ( not ( = ?auto_227701 ?auto_227709 ) ) ( not ( = ?auto_227702 ?auto_227703 ) ) ( not ( = ?auto_227702 ?auto_227704 ) ) ( not ( = ?auto_227702 ?auto_227705 ) ) ( not ( = ?auto_227702 ?auto_227706 ) ) ( not ( = ?auto_227702 ?auto_227707 ) ) ( not ( = ?auto_227702 ?auto_227708 ) ) ( not ( = ?auto_227702 ?auto_227709 ) ) ( not ( = ?auto_227703 ?auto_227704 ) ) ( not ( = ?auto_227703 ?auto_227705 ) ) ( not ( = ?auto_227703 ?auto_227706 ) ) ( not ( = ?auto_227703 ?auto_227707 ) ) ( not ( = ?auto_227703 ?auto_227708 ) ) ( not ( = ?auto_227703 ?auto_227709 ) ) ( not ( = ?auto_227704 ?auto_227705 ) ) ( not ( = ?auto_227704 ?auto_227706 ) ) ( not ( = ?auto_227704 ?auto_227707 ) ) ( not ( = ?auto_227704 ?auto_227708 ) ) ( not ( = ?auto_227704 ?auto_227709 ) ) ( not ( = ?auto_227705 ?auto_227706 ) ) ( not ( = ?auto_227705 ?auto_227707 ) ) ( not ( = ?auto_227705 ?auto_227708 ) ) ( not ( = ?auto_227705 ?auto_227709 ) ) ( not ( = ?auto_227706 ?auto_227707 ) ) ( not ( = ?auto_227706 ?auto_227708 ) ) ( not ( = ?auto_227706 ?auto_227709 ) ) ( not ( = ?auto_227707 ?auto_227708 ) ) ( not ( = ?auto_227707 ?auto_227709 ) ) ( not ( = ?auto_227708 ?auto_227709 ) ) ( ON ?auto_227707 ?auto_227708 ) ( ON ?auto_227706 ?auto_227707 ) ( CLEAR ?auto_227704 ) ( ON ?auto_227705 ?auto_227706 ) ( CLEAR ?auto_227705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_227699 ?auto_227700 ?auto_227701 ?auto_227702 ?auto_227703 ?auto_227704 ?auto_227705 )
      ( MAKE-10PILE ?auto_227699 ?auto_227700 ?auto_227701 ?auto_227702 ?auto_227703 ?auto_227704 ?auto_227705 ?auto_227706 ?auto_227707 ?auto_227708 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227720 - BLOCK
      ?auto_227721 - BLOCK
      ?auto_227722 - BLOCK
      ?auto_227723 - BLOCK
      ?auto_227724 - BLOCK
      ?auto_227725 - BLOCK
      ?auto_227726 - BLOCK
      ?auto_227727 - BLOCK
      ?auto_227728 - BLOCK
      ?auto_227729 - BLOCK
    )
    :vars
    (
      ?auto_227730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227729 ?auto_227730 ) ( ON-TABLE ?auto_227720 ) ( ON ?auto_227721 ?auto_227720 ) ( ON ?auto_227722 ?auto_227721 ) ( ON ?auto_227723 ?auto_227722 ) ( ON ?auto_227724 ?auto_227723 ) ( not ( = ?auto_227720 ?auto_227721 ) ) ( not ( = ?auto_227720 ?auto_227722 ) ) ( not ( = ?auto_227720 ?auto_227723 ) ) ( not ( = ?auto_227720 ?auto_227724 ) ) ( not ( = ?auto_227720 ?auto_227725 ) ) ( not ( = ?auto_227720 ?auto_227726 ) ) ( not ( = ?auto_227720 ?auto_227727 ) ) ( not ( = ?auto_227720 ?auto_227728 ) ) ( not ( = ?auto_227720 ?auto_227729 ) ) ( not ( = ?auto_227720 ?auto_227730 ) ) ( not ( = ?auto_227721 ?auto_227722 ) ) ( not ( = ?auto_227721 ?auto_227723 ) ) ( not ( = ?auto_227721 ?auto_227724 ) ) ( not ( = ?auto_227721 ?auto_227725 ) ) ( not ( = ?auto_227721 ?auto_227726 ) ) ( not ( = ?auto_227721 ?auto_227727 ) ) ( not ( = ?auto_227721 ?auto_227728 ) ) ( not ( = ?auto_227721 ?auto_227729 ) ) ( not ( = ?auto_227721 ?auto_227730 ) ) ( not ( = ?auto_227722 ?auto_227723 ) ) ( not ( = ?auto_227722 ?auto_227724 ) ) ( not ( = ?auto_227722 ?auto_227725 ) ) ( not ( = ?auto_227722 ?auto_227726 ) ) ( not ( = ?auto_227722 ?auto_227727 ) ) ( not ( = ?auto_227722 ?auto_227728 ) ) ( not ( = ?auto_227722 ?auto_227729 ) ) ( not ( = ?auto_227722 ?auto_227730 ) ) ( not ( = ?auto_227723 ?auto_227724 ) ) ( not ( = ?auto_227723 ?auto_227725 ) ) ( not ( = ?auto_227723 ?auto_227726 ) ) ( not ( = ?auto_227723 ?auto_227727 ) ) ( not ( = ?auto_227723 ?auto_227728 ) ) ( not ( = ?auto_227723 ?auto_227729 ) ) ( not ( = ?auto_227723 ?auto_227730 ) ) ( not ( = ?auto_227724 ?auto_227725 ) ) ( not ( = ?auto_227724 ?auto_227726 ) ) ( not ( = ?auto_227724 ?auto_227727 ) ) ( not ( = ?auto_227724 ?auto_227728 ) ) ( not ( = ?auto_227724 ?auto_227729 ) ) ( not ( = ?auto_227724 ?auto_227730 ) ) ( not ( = ?auto_227725 ?auto_227726 ) ) ( not ( = ?auto_227725 ?auto_227727 ) ) ( not ( = ?auto_227725 ?auto_227728 ) ) ( not ( = ?auto_227725 ?auto_227729 ) ) ( not ( = ?auto_227725 ?auto_227730 ) ) ( not ( = ?auto_227726 ?auto_227727 ) ) ( not ( = ?auto_227726 ?auto_227728 ) ) ( not ( = ?auto_227726 ?auto_227729 ) ) ( not ( = ?auto_227726 ?auto_227730 ) ) ( not ( = ?auto_227727 ?auto_227728 ) ) ( not ( = ?auto_227727 ?auto_227729 ) ) ( not ( = ?auto_227727 ?auto_227730 ) ) ( not ( = ?auto_227728 ?auto_227729 ) ) ( not ( = ?auto_227728 ?auto_227730 ) ) ( not ( = ?auto_227729 ?auto_227730 ) ) ( ON ?auto_227728 ?auto_227729 ) ( ON ?auto_227727 ?auto_227728 ) ( ON ?auto_227726 ?auto_227727 ) ( CLEAR ?auto_227724 ) ( ON ?auto_227725 ?auto_227726 ) ( CLEAR ?auto_227725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_227720 ?auto_227721 ?auto_227722 ?auto_227723 ?auto_227724 ?auto_227725 )
      ( MAKE-10PILE ?auto_227720 ?auto_227721 ?auto_227722 ?auto_227723 ?auto_227724 ?auto_227725 ?auto_227726 ?auto_227727 ?auto_227728 ?auto_227729 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227741 - BLOCK
      ?auto_227742 - BLOCK
      ?auto_227743 - BLOCK
      ?auto_227744 - BLOCK
      ?auto_227745 - BLOCK
      ?auto_227746 - BLOCK
      ?auto_227747 - BLOCK
      ?auto_227748 - BLOCK
      ?auto_227749 - BLOCK
      ?auto_227750 - BLOCK
    )
    :vars
    (
      ?auto_227751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227750 ?auto_227751 ) ( ON-TABLE ?auto_227741 ) ( ON ?auto_227742 ?auto_227741 ) ( ON ?auto_227743 ?auto_227742 ) ( ON ?auto_227744 ?auto_227743 ) ( ON ?auto_227745 ?auto_227744 ) ( not ( = ?auto_227741 ?auto_227742 ) ) ( not ( = ?auto_227741 ?auto_227743 ) ) ( not ( = ?auto_227741 ?auto_227744 ) ) ( not ( = ?auto_227741 ?auto_227745 ) ) ( not ( = ?auto_227741 ?auto_227746 ) ) ( not ( = ?auto_227741 ?auto_227747 ) ) ( not ( = ?auto_227741 ?auto_227748 ) ) ( not ( = ?auto_227741 ?auto_227749 ) ) ( not ( = ?auto_227741 ?auto_227750 ) ) ( not ( = ?auto_227741 ?auto_227751 ) ) ( not ( = ?auto_227742 ?auto_227743 ) ) ( not ( = ?auto_227742 ?auto_227744 ) ) ( not ( = ?auto_227742 ?auto_227745 ) ) ( not ( = ?auto_227742 ?auto_227746 ) ) ( not ( = ?auto_227742 ?auto_227747 ) ) ( not ( = ?auto_227742 ?auto_227748 ) ) ( not ( = ?auto_227742 ?auto_227749 ) ) ( not ( = ?auto_227742 ?auto_227750 ) ) ( not ( = ?auto_227742 ?auto_227751 ) ) ( not ( = ?auto_227743 ?auto_227744 ) ) ( not ( = ?auto_227743 ?auto_227745 ) ) ( not ( = ?auto_227743 ?auto_227746 ) ) ( not ( = ?auto_227743 ?auto_227747 ) ) ( not ( = ?auto_227743 ?auto_227748 ) ) ( not ( = ?auto_227743 ?auto_227749 ) ) ( not ( = ?auto_227743 ?auto_227750 ) ) ( not ( = ?auto_227743 ?auto_227751 ) ) ( not ( = ?auto_227744 ?auto_227745 ) ) ( not ( = ?auto_227744 ?auto_227746 ) ) ( not ( = ?auto_227744 ?auto_227747 ) ) ( not ( = ?auto_227744 ?auto_227748 ) ) ( not ( = ?auto_227744 ?auto_227749 ) ) ( not ( = ?auto_227744 ?auto_227750 ) ) ( not ( = ?auto_227744 ?auto_227751 ) ) ( not ( = ?auto_227745 ?auto_227746 ) ) ( not ( = ?auto_227745 ?auto_227747 ) ) ( not ( = ?auto_227745 ?auto_227748 ) ) ( not ( = ?auto_227745 ?auto_227749 ) ) ( not ( = ?auto_227745 ?auto_227750 ) ) ( not ( = ?auto_227745 ?auto_227751 ) ) ( not ( = ?auto_227746 ?auto_227747 ) ) ( not ( = ?auto_227746 ?auto_227748 ) ) ( not ( = ?auto_227746 ?auto_227749 ) ) ( not ( = ?auto_227746 ?auto_227750 ) ) ( not ( = ?auto_227746 ?auto_227751 ) ) ( not ( = ?auto_227747 ?auto_227748 ) ) ( not ( = ?auto_227747 ?auto_227749 ) ) ( not ( = ?auto_227747 ?auto_227750 ) ) ( not ( = ?auto_227747 ?auto_227751 ) ) ( not ( = ?auto_227748 ?auto_227749 ) ) ( not ( = ?auto_227748 ?auto_227750 ) ) ( not ( = ?auto_227748 ?auto_227751 ) ) ( not ( = ?auto_227749 ?auto_227750 ) ) ( not ( = ?auto_227749 ?auto_227751 ) ) ( not ( = ?auto_227750 ?auto_227751 ) ) ( ON ?auto_227749 ?auto_227750 ) ( ON ?auto_227748 ?auto_227749 ) ( ON ?auto_227747 ?auto_227748 ) ( CLEAR ?auto_227745 ) ( ON ?auto_227746 ?auto_227747 ) ( CLEAR ?auto_227746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_227741 ?auto_227742 ?auto_227743 ?auto_227744 ?auto_227745 ?auto_227746 )
      ( MAKE-10PILE ?auto_227741 ?auto_227742 ?auto_227743 ?auto_227744 ?auto_227745 ?auto_227746 ?auto_227747 ?auto_227748 ?auto_227749 ?auto_227750 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227762 - BLOCK
      ?auto_227763 - BLOCK
      ?auto_227764 - BLOCK
      ?auto_227765 - BLOCK
      ?auto_227766 - BLOCK
      ?auto_227767 - BLOCK
      ?auto_227768 - BLOCK
      ?auto_227769 - BLOCK
      ?auto_227770 - BLOCK
      ?auto_227771 - BLOCK
    )
    :vars
    (
      ?auto_227772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227771 ?auto_227772 ) ( ON-TABLE ?auto_227762 ) ( ON ?auto_227763 ?auto_227762 ) ( ON ?auto_227764 ?auto_227763 ) ( ON ?auto_227765 ?auto_227764 ) ( not ( = ?auto_227762 ?auto_227763 ) ) ( not ( = ?auto_227762 ?auto_227764 ) ) ( not ( = ?auto_227762 ?auto_227765 ) ) ( not ( = ?auto_227762 ?auto_227766 ) ) ( not ( = ?auto_227762 ?auto_227767 ) ) ( not ( = ?auto_227762 ?auto_227768 ) ) ( not ( = ?auto_227762 ?auto_227769 ) ) ( not ( = ?auto_227762 ?auto_227770 ) ) ( not ( = ?auto_227762 ?auto_227771 ) ) ( not ( = ?auto_227762 ?auto_227772 ) ) ( not ( = ?auto_227763 ?auto_227764 ) ) ( not ( = ?auto_227763 ?auto_227765 ) ) ( not ( = ?auto_227763 ?auto_227766 ) ) ( not ( = ?auto_227763 ?auto_227767 ) ) ( not ( = ?auto_227763 ?auto_227768 ) ) ( not ( = ?auto_227763 ?auto_227769 ) ) ( not ( = ?auto_227763 ?auto_227770 ) ) ( not ( = ?auto_227763 ?auto_227771 ) ) ( not ( = ?auto_227763 ?auto_227772 ) ) ( not ( = ?auto_227764 ?auto_227765 ) ) ( not ( = ?auto_227764 ?auto_227766 ) ) ( not ( = ?auto_227764 ?auto_227767 ) ) ( not ( = ?auto_227764 ?auto_227768 ) ) ( not ( = ?auto_227764 ?auto_227769 ) ) ( not ( = ?auto_227764 ?auto_227770 ) ) ( not ( = ?auto_227764 ?auto_227771 ) ) ( not ( = ?auto_227764 ?auto_227772 ) ) ( not ( = ?auto_227765 ?auto_227766 ) ) ( not ( = ?auto_227765 ?auto_227767 ) ) ( not ( = ?auto_227765 ?auto_227768 ) ) ( not ( = ?auto_227765 ?auto_227769 ) ) ( not ( = ?auto_227765 ?auto_227770 ) ) ( not ( = ?auto_227765 ?auto_227771 ) ) ( not ( = ?auto_227765 ?auto_227772 ) ) ( not ( = ?auto_227766 ?auto_227767 ) ) ( not ( = ?auto_227766 ?auto_227768 ) ) ( not ( = ?auto_227766 ?auto_227769 ) ) ( not ( = ?auto_227766 ?auto_227770 ) ) ( not ( = ?auto_227766 ?auto_227771 ) ) ( not ( = ?auto_227766 ?auto_227772 ) ) ( not ( = ?auto_227767 ?auto_227768 ) ) ( not ( = ?auto_227767 ?auto_227769 ) ) ( not ( = ?auto_227767 ?auto_227770 ) ) ( not ( = ?auto_227767 ?auto_227771 ) ) ( not ( = ?auto_227767 ?auto_227772 ) ) ( not ( = ?auto_227768 ?auto_227769 ) ) ( not ( = ?auto_227768 ?auto_227770 ) ) ( not ( = ?auto_227768 ?auto_227771 ) ) ( not ( = ?auto_227768 ?auto_227772 ) ) ( not ( = ?auto_227769 ?auto_227770 ) ) ( not ( = ?auto_227769 ?auto_227771 ) ) ( not ( = ?auto_227769 ?auto_227772 ) ) ( not ( = ?auto_227770 ?auto_227771 ) ) ( not ( = ?auto_227770 ?auto_227772 ) ) ( not ( = ?auto_227771 ?auto_227772 ) ) ( ON ?auto_227770 ?auto_227771 ) ( ON ?auto_227769 ?auto_227770 ) ( ON ?auto_227768 ?auto_227769 ) ( ON ?auto_227767 ?auto_227768 ) ( CLEAR ?auto_227765 ) ( ON ?auto_227766 ?auto_227767 ) ( CLEAR ?auto_227766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_227762 ?auto_227763 ?auto_227764 ?auto_227765 ?auto_227766 )
      ( MAKE-10PILE ?auto_227762 ?auto_227763 ?auto_227764 ?auto_227765 ?auto_227766 ?auto_227767 ?auto_227768 ?auto_227769 ?auto_227770 ?auto_227771 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227783 - BLOCK
      ?auto_227784 - BLOCK
      ?auto_227785 - BLOCK
      ?auto_227786 - BLOCK
      ?auto_227787 - BLOCK
      ?auto_227788 - BLOCK
      ?auto_227789 - BLOCK
      ?auto_227790 - BLOCK
      ?auto_227791 - BLOCK
      ?auto_227792 - BLOCK
    )
    :vars
    (
      ?auto_227793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227792 ?auto_227793 ) ( ON-TABLE ?auto_227783 ) ( ON ?auto_227784 ?auto_227783 ) ( ON ?auto_227785 ?auto_227784 ) ( ON ?auto_227786 ?auto_227785 ) ( not ( = ?auto_227783 ?auto_227784 ) ) ( not ( = ?auto_227783 ?auto_227785 ) ) ( not ( = ?auto_227783 ?auto_227786 ) ) ( not ( = ?auto_227783 ?auto_227787 ) ) ( not ( = ?auto_227783 ?auto_227788 ) ) ( not ( = ?auto_227783 ?auto_227789 ) ) ( not ( = ?auto_227783 ?auto_227790 ) ) ( not ( = ?auto_227783 ?auto_227791 ) ) ( not ( = ?auto_227783 ?auto_227792 ) ) ( not ( = ?auto_227783 ?auto_227793 ) ) ( not ( = ?auto_227784 ?auto_227785 ) ) ( not ( = ?auto_227784 ?auto_227786 ) ) ( not ( = ?auto_227784 ?auto_227787 ) ) ( not ( = ?auto_227784 ?auto_227788 ) ) ( not ( = ?auto_227784 ?auto_227789 ) ) ( not ( = ?auto_227784 ?auto_227790 ) ) ( not ( = ?auto_227784 ?auto_227791 ) ) ( not ( = ?auto_227784 ?auto_227792 ) ) ( not ( = ?auto_227784 ?auto_227793 ) ) ( not ( = ?auto_227785 ?auto_227786 ) ) ( not ( = ?auto_227785 ?auto_227787 ) ) ( not ( = ?auto_227785 ?auto_227788 ) ) ( not ( = ?auto_227785 ?auto_227789 ) ) ( not ( = ?auto_227785 ?auto_227790 ) ) ( not ( = ?auto_227785 ?auto_227791 ) ) ( not ( = ?auto_227785 ?auto_227792 ) ) ( not ( = ?auto_227785 ?auto_227793 ) ) ( not ( = ?auto_227786 ?auto_227787 ) ) ( not ( = ?auto_227786 ?auto_227788 ) ) ( not ( = ?auto_227786 ?auto_227789 ) ) ( not ( = ?auto_227786 ?auto_227790 ) ) ( not ( = ?auto_227786 ?auto_227791 ) ) ( not ( = ?auto_227786 ?auto_227792 ) ) ( not ( = ?auto_227786 ?auto_227793 ) ) ( not ( = ?auto_227787 ?auto_227788 ) ) ( not ( = ?auto_227787 ?auto_227789 ) ) ( not ( = ?auto_227787 ?auto_227790 ) ) ( not ( = ?auto_227787 ?auto_227791 ) ) ( not ( = ?auto_227787 ?auto_227792 ) ) ( not ( = ?auto_227787 ?auto_227793 ) ) ( not ( = ?auto_227788 ?auto_227789 ) ) ( not ( = ?auto_227788 ?auto_227790 ) ) ( not ( = ?auto_227788 ?auto_227791 ) ) ( not ( = ?auto_227788 ?auto_227792 ) ) ( not ( = ?auto_227788 ?auto_227793 ) ) ( not ( = ?auto_227789 ?auto_227790 ) ) ( not ( = ?auto_227789 ?auto_227791 ) ) ( not ( = ?auto_227789 ?auto_227792 ) ) ( not ( = ?auto_227789 ?auto_227793 ) ) ( not ( = ?auto_227790 ?auto_227791 ) ) ( not ( = ?auto_227790 ?auto_227792 ) ) ( not ( = ?auto_227790 ?auto_227793 ) ) ( not ( = ?auto_227791 ?auto_227792 ) ) ( not ( = ?auto_227791 ?auto_227793 ) ) ( not ( = ?auto_227792 ?auto_227793 ) ) ( ON ?auto_227791 ?auto_227792 ) ( ON ?auto_227790 ?auto_227791 ) ( ON ?auto_227789 ?auto_227790 ) ( ON ?auto_227788 ?auto_227789 ) ( CLEAR ?auto_227786 ) ( ON ?auto_227787 ?auto_227788 ) ( CLEAR ?auto_227787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_227783 ?auto_227784 ?auto_227785 ?auto_227786 ?auto_227787 )
      ( MAKE-10PILE ?auto_227783 ?auto_227784 ?auto_227785 ?auto_227786 ?auto_227787 ?auto_227788 ?auto_227789 ?auto_227790 ?auto_227791 ?auto_227792 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227804 - BLOCK
      ?auto_227805 - BLOCK
      ?auto_227806 - BLOCK
      ?auto_227807 - BLOCK
      ?auto_227808 - BLOCK
      ?auto_227809 - BLOCK
      ?auto_227810 - BLOCK
      ?auto_227811 - BLOCK
      ?auto_227812 - BLOCK
      ?auto_227813 - BLOCK
    )
    :vars
    (
      ?auto_227814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227813 ?auto_227814 ) ( ON-TABLE ?auto_227804 ) ( ON ?auto_227805 ?auto_227804 ) ( ON ?auto_227806 ?auto_227805 ) ( not ( = ?auto_227804 ?auto_227805 ) ) ( not ( = ?auto_227804 ?auto_227806 ) ) ( not ( = ?auto_227804 ?auto_227807 ) ) ( not ( = ?auto_227804 ?auto_227808 ) ) ( not ( = ?auto_227804 ?auto_227809 ) ) ( not ( = ?auto_227804 ?auto_227810 ) ) ( not ( = ?auto_227804 ?auto_227811 ) ) ( not ( = ?auto_227804 ?auto_227812 ) ) ( not ( = ?auto_227804 ?auto_227813 ) ) ( not ( = ?auto_227804 ?auto_227814 ) ) ( not ( = ?auto_227805 ?auto_227806 ) ) ( not ( = ?auto_227805 ?auto_227807 ) ) ( not ( = ?auto_227805 ?auto_227808 ) ) ( not ( = ?auto_227805 ?auto_227809 ) ) ( not ( = ?auto_227805 ?auto_227810 ) ) ( not ( = ?auto_227805 ?auto_227811 ) ) ( not ( = ?auto_227805 ?auto_227812 ) ) ( not ( = ?auto_227805 ?auto_227813 ) ) ( not ( = ?auto_227805 ?auto_227814 ) ) ( not ( = ?auto_227806 ?auto_227807 ) ) ( not ( = ?auto_227806 ?auto_227808 ) ) ( not ( = ?auto_227806 ?auto_227809 ) ) ( not ( = ?auto_227806 ?auto_227810 ) ) ( not ( = ?auto_227806 ?auto_227811 ) ) ( not ( = ?auto_227806 ?auto_227812 ) ) ( not ( = ?auto_227806 ?auto_227813 ) ) ( not ( = ?auto_227806 ?auto_227814 ) ) ( not ( = ?auto_227807 ?auto_227808 ) ) ( not ( = ?auto_227807 ?auto_227809 ) ) ( not ( = ?auto_227807 ?auto_227810 ) ) ( not ( = ?auto_227807 ?auto_227811 ) ) ( not ( = ?auto_227807 ?auto_227812 ) ) ( not ( = ?auto_227807 ?auto_227813 ) ) ( not ( = ?auto_227807 ?auto_227814 ) ) ( not ( = ?auto_227808 ?auto_227809 ) ) ( not ( = ?auto_227808 ?auto_227810 ) ) ( not ( = ?auto_227808 ?auto_227811 ) ) ( not ( = ?auto_227808 ?auto_227812 ) ) ( not ( = ?auto_227808 ?auto_227813 ) ) ( not ( = ?auto_227808 ?auto_227814 ) ) ( not ( = ?auto_227809 ?auto_227810 ) ) ( not ( = ?auto_227809 ?auto_227811 ) ) ( not ( = ?auto_227809 ?auto_227812 ) ) ( not ( = ?auto_227809 ?auto_227813 ) ) ( not ( = ?auto_227809 ?auto_227814 ) ) ( not ( = ?auto_227810 ?auto_227811 ) ) ( not ( = ?auto_227810 ?auto_227812 ) ) ( not ( = ?auto_227810 ?auto_227813 ) ) ( not ( = ?auto_227810 ?auto_227814 ) ) ( not ( = ?auto_227811 ?auto_227812 ) ) ( not ( = ?auto_227811 ?auto_227813 ) ) ( not ( = ?auto_227811 ?auto_227814 ) ) ( not ( = ?auto_227812 ?auto_227813 ) ) ( not ( = ?auto_227812 ?auto_227814 ) ) ( not ( = ?auto_227813 ?auto_227814 ) ) ( ON ?auto_227812 ?auto_227813 ) ( ON ?auto_227811 ?auto_227812 ) ( ON ?auto_227810 ?auto_227811 ) ( ON ?auto_227809 ?auto_227810 ) ( ON ?auto_227808 ?auto_227809 ) ( CLEAR ?auto_227806 ) ( ON ?auto_227807 ?auto_227808 ) ( CLEAR ?auto_227807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_227804 ?auto_227805 ?auto_227806 ?auto_227807 )
      ( MAKE-10PILE ?auto_227804 ?auto_227805 ?auto_227806 ?auto_227807 ?auto_227808 ?auto_227809 ?auto_227810 ?auto_227811 ?auto_227812 ?auto_227813 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227825 - BLOCK
      ?auto_227826 - BLOCK
      ?auto_227827 - BLOCK
      ?auto_227828 - BLOCK
      ?auto_227829 - BLOCK
      ?auto_227830 - BLOCK
      ?auto_227831 - BLOCK
      ?auto_227832 - BLOCK
      ?auto_227833 - BLOCK
      ?auto_227834 - BLOCK
    )
    :vars
    (
      ?auto_227835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227834 ?auto_227835 ) ( ON-TABLE ?auto_227825 ) ( ON ?auto_227826 ?auto_227825 ) ( ON ?auto_227827 ?auto_227826 ) ( not ( = ?auto_227825 ?auto_227826 ) ) ( not ( = ?auto_227825 ?auto_227827 ) ) ( not ( = ?auto_227825 ?auto_227828 ) ) ( not ( = ?auto_227825 ?auto_227829 ) ) ( not ( = ?auto_227825 ?auto_227830 ) ) ( not ( = ?auto_227825 ?auto_227831 ) ) ( not ( = ?auto_227825 ?auto_227832 ) ) ( not ( = ?auto_227825 ?auto_227833 ) ) ( not ( = ?auto_227825 ?auto_227834 ) ) ( not ( = ?auto_227825 ?auto_227835 ) ) ( not ( = ?auto_227826 ?auto_227827 ) ) ( not ( = ?auto_227826 ?auto_227828 ) ) ( not ( = ?auto_227826 ?auto_227829 ) ) ( not ( = ?auto_227826 ?auto_227830 ) ) ( not ( = ?auto_227826 ?auto_227831 ) ) ( not ( = ?auto_227826 ?auto_227832 ) ) ( not ( = ?auto_227826 ?auto_227833 ) ) ( not ( = ?auto_227826 ?auto_227834 ) ) ( not ( = ?auto_227826 ?auto_227835 ) ) ( not ( = ?auto_227827 ?auto_227828 ) ) ( not ( = ?auto_227827 ?auto_227829 ) ) ( not ( = ?auto_227827 ?auto_227830 ) ) ( not ( = ?auto_227827 ?auto_227831 ) ) ( not ( = ?auto_227827 ?auto_227832 ) ) ( not ( = ?auto_227827 ?auto_227833 ) ) ( not ( = ?auto_227827 ?auto_227834 ) ) ( not ( = ?auto_227827 ?auto_227835 ) ) ( not ( = ?auto_227828 ?auto_227829 ) ) ( not ( = ?auto_227828 ?auto_227830 ) ) ( not ( = ?auto_227828 ?auto_227831 ) ) ( not ( = ?auto_227828 ?auto_227832 ) ) ( not ( = ?auto_227828 ?auto_227833 ) ) ( not ( = ?auto_227828 ?auto_227834 ) ) ( not ( = ?auto_227828 ?auto_227835 ) ) ( not ( = ?auto_227829 ?auto_227830 ) ) ( not ( = ?auto_227829 ?auto_227831 ) ) ( not ( = ?auto_227829 ?auto_227832 ) ) ( not ( = ?auto_227829 ?auto_227833 ) ) ( not ( = ?auto_227829 ?auto_227834 ) ) ( not ( = ?auto_227829 ?auto_227835 ) ) ( not ( = ?auto_227830 ?auto_227831 ) ) ( not ( = ?auto_227830 ?auto_227832 ) ) ( not ( = ?auto_227830 ?auto_227833 ) ) ( not ( = ?auto_227830 ?auto_227834 ) ) ( not ( = ?auto_227830 ?auto_227835 ) ) ( not ( = ?auto_227831 ?auto_227832 ) ) ( not ( = ?auto_227831 ?auto_227833 ) ) ( not ( = ?auto_227831 ?auto_227834 ) ) ( not ( = ?auto_227831 ?auto_227835 ) ) ( not ( = ?auto_227832 ?auto_227833 ) ) ( not ( = ?auto_227832 ?auto_227834 ) ) ( not ( = ?auto_227832 ?auto_227835 ) ) ( not ( = ?auto_227833 ?auto_227834 ) ) ( not ( = ?auto_227833 ?auto_227835 ) ) ( not ( = ?auto_227834 ?auto_227835 ) ) ( ON ?auto_227833 ?auto_227834 ) ( ON ?auto_227832 ?auto_227833 ) ( ON ?auto_227831 ?auto_227832 ) ( ON ?auto_227830 ?auto_227831 ) ( ON ?auto_227829 ?auto_227830 ) ( CLEAR ?auto_227827 ) ( ON ?auto_227828 ?auto_227829 ) ( CLEAR ?auto_227828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_227825 ?auto_227826 ?auto_227827 ?auto_227828 )
      ( MAKE-10PILE ?auto_227825 ?auto_227826 ?auto_227827 ?auto_227828 ?auto_227829 ?auto_227830 ?auto_227831 ?auto_227832 ?auto_227833 ?auto_227834 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227846 - BLOCK
      ?auto_227847 - BLOCK
      ?auto_227848 - BLOCK
      ?auto_227849 - BLOCK
      ?auto_227850 - BLOCK
      ?auto_227851 - BLOCK
      ?auto_227852 - BLOCK
      ?auto_227853 - BLOCK
      ?auto_227854 - BLOCK
      ?auto_227855 - BLOCK
    )
    :vars
    (
      ?auto_227856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227855 ?auto_227856 ) ( ON-TABLE ?auto_227846 ) ( ON ?auto_227847 ?auto_227846 ) ( not ( = ?auto_227846 ?auto_227847 ) ) ( not ( = ?auto_227846 ?auto_227848 ) ) ( not ( = ?auto_227846 ?auto_227849 ) ) ( not ( = ?auto_227846 ?auto_227850 ) ) ( not ( = ?auto_227846 ?auto_227851 ) ) ( not ( = ?auto_227846 ?auto_227852 ) ) ( not ( = ?auto_227846 ?auto_227853 ) ) ( not ( = ?auto_227846 ?auto_227854 ) ) ( not ( = ?auto_227846 ?auto_227855 ) ) ( not ( = ?auto_227846 ?auto_227856 ) ) ( not ( = ?auto_227847 ?auto_227848 ) ) ( not ( = ?auto_227847 ?auto_227849 ) ) ( not ( = ?auto_227847 ?auto_227850 ) ) ( not ( = ?auto_227847 ?auto_227851 ) ) ( not ( = ?auto_227847 ?auto_227852 ) ) ( not ( = ?auto_227847 ?auto_227853 ) ) ( not ( = ?auto_227847 ?auto_227854 ) ) ( not ( = ?auto_227847 ?auto_227855 ) ) ( not ( = ?auto_227847 ?auto_227856 ) ) ( not ( = ?auto_227848 ?auto_227849 ) ) ( not ( = ?auto_227848 ?auto_227850 ) ) ( not ( = ?auto_227848 ?auto_227851 ) ) ( not ( = ?auto_227848 ?auto_227852 ) ) ( not ( = ?auto_227848 ?auto_227853 ) ) ( not ( = ?auto_227848 ?auto_227854 ) ) ( not ( = ?auto_227848 ?auto_227855 ) ) ( not ( = ?auto_227848 ?auto_227856 ) ) ( not ( = ?auto_227849 ?auto_227850 ) ) ( not ( = ?auto_227849 ?auto_227851 ) ) ( not ( = ?auto_227849 ?auto_227852 ) ) ( not ( = ?auto_227849 ?auto_227853 ) ) ( not ( = ?auto_227849 ?auto_227854 ) ) ( not ( = ?auto_227849 ?auto_227855 ) ) ( not ( = ?auto_227849 ?auto_227856 ) ) ( not ( = ?auto_227850 ?auto_227851 ) ) ( not ( = ?auto_227850 ?auto_227852 ) ) ( not ( = ?auto_227850 ?auto_227853 ) ) ( not ( = ?auto_227850 ?auto_227854 ) ) ( not ( = ?auto_227850 ?auto_227855 ) ) ( not ( = ?auto_227850 ?auto_227856 ) ) ( not ( = ?auto_227851 ?auto_227852 ) ) ( not ( = ?auto_227851 ?auto_227853 ) ) ( not ( = ?auto_227851 ?auto_227854 ) ) ( not ( = ?auto_227851 ?auto_227855 ) ) ( not ( = ?auto_227851 ?auto_227856 ) ) ( not ( = ?auto_227852 ?auto_227853 ) ) ( not ( = ?auto_227852 ?auto_227854 ) ) ( not ( = ?auto_227852 ?auto_227855 ) ) ( not ( = ?auto_227852 ?auto_227856 ) ) ( not ( = ?auto_227853 ?auto_227854 ) ) ( not ( = ?auto_227853 ?auto_227855 ) ) ( not ( = ?auto_227853 ?auto_227856 ) ) ( not ( = ?auto_227854 ?auto_227855 ) ) ( not ( = ?auto_227854 ?auto_227856 ) ) ( not ( = ?auto_227855 ?auto_227856 ) ) ( ON ?auto_227854 ?auto_227855 ) ( ON ?auto_227853 ?auto_227854 ) ( ON ?auto_227852 ?auto_227853 ) ( ON ?auto_227851 ?auto_227852 ) ( ON ?auto_227850 ?auto_227851 ) ( ON ?auto_227849 ?auto_227850 ) ( CLEAR ?auto_227847 ) ( ON ?auto_227848 ?auto_227849 ) ( CLEAR ?auto_227848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_227846 ?auto_227847 ?auto_227848 )
      ( MAKE-10PILE ?auto_227846 ?auto_227847 ?auto_227848 ?auto_227849 ?auto_227850 ?auto_227851 ?auto_227852 ?auto_227853 ?auto_227854 ?auto_227855 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227867 - BLOCK
      ?auto_227868 - BLOCK
      ?auto_227869 - BLOCK
      ?auto_227870 - BLOCK
      ?auto_227871 - BLOCK
      ?auto_227872 - BLOCK
      ?auto_227873 - BLOCK
      ?auto_227874 - BLOCK
      ?auto_227875 - BLOCK
      ?auto_227876 - BLOCK
    )
    :vars
    (
      ?auto_227877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227876 ?auto_227877 ) ( ON-TABLE ?auto_227867 ) ( ON ?auto_227868 ?auto_227867 ) ( not ( = ?auto_227867 ?auto_227868 ) ) ( not ( = ?auto_227867 ?auto_227869 ) ) ( not ( = ?auto_227867 ?auto_227870 ) ) ( not ( = ?auto_227867 ?auto_227871 ) ) ( not ( = ?auto_227867 ?auto_227872 ) ) ( not ( = ?auto_227867 ?auto_227873 ) ) ( not ( = ?auto_227867 ?auto_227874 ) ) ( not ( = ?auto_227867 ?auto_227875 ) ) ( not ( = ?auto_227867 ?auto_227876 ) ) ( not ( = ?auto_227867 ?auto_227877 ) ) ( not ( = ?auto_227868 ?auto_227869 ) ) ( not ( = ?auto_227868 ?auto_227870 ) ) ( not ( = ?auto_227868 ?auto_227871 ) ) ( not ( = ?auto_227868 ?auto_227872 ) ) ( not ( = ?auto_227868 ?auto_227873 ) ) ( not ( = ?auto_227868 ?auto_227874 ) ) ( not ( = ?auto_227868 ?auto_227875 ) ) ( not ( = ?auto_227868 ?auto_227876 ) ) ( not ( = ?auto_227868 ?auto_227877 ) ) ( not ( = ?auto_227869 ?auto_227870 ) ) ( not ( = ?auto_227869 ?auto_227871 ) ) ( not ( = ?auto_227869 ?auto_227872 ) ) ( not ( = ?auto_227869 ?auto_227873 ) ) ( not ( = ?auto_227869 ?auto_227874 ) ) ( not ( = ?auto_227869 ?auto_227875 ) ) ( not ( = ?auto_227869 ?auto_227876 ) ) ( not ( = ?auto_227869 ?auto_227877 ) ) ( not ( = ?auto_227870 ?auto_227871 ) ) ( not ( = ?auto_227870 ?auto_227872 ) ) ( not ( = ?auto_227870 ?auto_227873 ) ) ( not ( = ?auto_227870 ?auto_227874 ) ) ( not ( = ?auto_227870 ?auto_227875 ) ) ( not ( = ?auto_227870 ?auto_227876 ) ) ( not ( = ?auto_227870 ?auto_227877 ) ) ( not ( = ?auto_227871 ?auto_227872 ) ) ( not ( = ?auto_227871 ?auto_227873 ) ) ( not ( = ?auto_227871 ?auto_227874 ) ) ( not ( = ?auto_227871 ?auto_227875 ) ) ( not ( = ?auto_227871 ?auto_227876 ) ) ( not ( = ?auto_227871 ?auto_227877 ) ) ( not ( = ?auto_227872 ?auto_227873 ) ) ( not ( = ?auto_227872 ?auto_227874 ) ) ( not ( = ?auto_227872 ?auto_227875 ) ) ( not ( = ?auto_227872 ?auto_227876 ) ) ( not ( = ?auto_227872 ?auto_227877 ) ) ( not ( = ?auto_227873 ?auto_227874 ) ) ( not ( = ?auto_227873 ?auto_227875 ) ) ( not ( = ?auto_227873 ?auto_227876 ) ) ( not ( = ?auto_227873 ?auto_227877 ) ) ( not ( = ?auto_227874 ?auto_227875 ) ) ( not ( = ?auto_227874 ?auto_227876 ) ) ( not ( = ?auto_227874 ?auto_227877 ) ) ( not ( = ?auto_227875 ?auto_227876 ) ) ( not ( = ?auto_227875 ?auto_227877 ) ) ( not ( = ?auto_227876 ?auto_227877 ) ) ( ON ?auto_227875 ?auto_227876 ) ( ON ?auto_227874 ?auto_227875 ) ( ON ?auto_227873 ?auto_227874 ) ( ON ?auto_227872 ?auto_227873 ) ( ON ?auto_227871 ?auto_227872 ) ( ON ?auto_227870 ?auto_227871 ) ( CLEAR ?auto_227868 ) ( ON ?auto_227869 ?auto_227870 ) ( CLEAR ?auto_227869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_227867 ?auto_227868 ?auto_227869 )
      ( MAKE-10PILE ?auto_227867 ?auto_227868 ?auto_227869 ?auto_227870 ?auto_227871 ?auto_227872 ?auto_227873 ?auto_227874 ?auto_227875 ?auto_227876 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227888 - BLOCK
      ?auto_227889 - BLOCK
      ?auto_227890 - BLOCK
      ?auto_227891 - BLOCK
      ?auto_227892 - BLOCK
      ?auto_227893 - BLOCK
      ?auto_227894 - BLOCK
      ?auto_227895 - BLOCK
      ?auto_227896 - BLOCK
      ?auto_227897 - BLOCK
    )
    :vars
    (
      ?auto_227898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227897 ?auto_227898 ) ( ON-TABLE ?auto_227888 ) ( not ( = ?auto_227888 ?auto_227889 ) ) ( not ( = ?auto_227888 ?auto_227890 ) ) ( not ( = ?auto_227888 ?auto_227891 ) ) ( not ( = ?auto_227888 ?auto_227892 ) ) ( not ( = ?auto_227888 ?auto_227893 ) ) ( not ( = ?auto_227888 ?auto_227894 ) ) ( not ( = ?auto_227888 ?auto_227895 ) ) ( not ( = ?auto_227888 ?auto_227896 ) ) ( not ( = ?auto_227888 ?auto_227897 ) ) ( not ( = ?auto_227888 ?auto_227898 ) ) ( not ( = ?auto_227889 ?auto_227890 ) ) ( not ( = ?auto_227889 ?auto_227891 ) ) ( not ( = ?auto_227889 ?auto_227892 ) ) ( not ( = ?auto_227889 ?auto_227893 ) ) ( not ( = ?auto_227889 ?auto_227894 ) ) ( not ( = ?auto_227889 ?auto_227895 ) ) ( not ( = ?auto_227889 ?auto_227896 ) ) ( not ( = ?auto_227889 ?auto_227897 ) ) ( not ( = ?auto_227889 ?auto_227898 ) ) ( not ( = ?auto_227890 ?auto_227891 ) ) ( not ( = ?auto_227890 ?auto_227892 ) ) ( not ( = ?auto_227890 ?auto_227893 ) ) ( not ( = ?auto_227890 ?auto_227894 ) ) ( not ( = ?auto_227890 ?auto_227895 ) ) ( not ( = ?auto_227890 ?auto_227896 ) ) ( not ( = ?auto_227890 ?auto_227897 ) ) ( not ( = ?auto_227890 ?auto_227898 ) ) ( not ( = ?auto_227891 ?auto_227892 ) ) ( not ( = ?auto_227891 ?auto_227893 ) ) ( not ( = ?auto_227891 ?auto_227894 ) ) ( not ( = ?auto_227891 ?auto_227895 ) ) ( not ( = ?auto_227891 ?auto_227896 ) ) ( not ( = ?auto_227891 ?auto_227897 ) ) ( not ( = ?auto_227891 ?auto_227898 ) ) ( not ( = ?auto_227892 ?auto_227893 ) ) ( not ( = ?auto_227892 ?auto_227894 ) ) ( not ( = ?auto_227892 ?auto_227895 ) ) ( not ( = ?auto_227892 ?auto_227896 ) ) ( not ( = ?auto_227892 ?auto_227897 ) ) ( not ( = ?auto_227892 ?auto_227898 ) ) ( not ( = ?auto_227893 ?auto_227894 ) ) ( not ( = ?auto_227893 ?auto_227895 ) ) ( not ( = ?auto_227893 ?auto_227896 ) ) ( not ( = ?auto_227893 ?auto_227897 ) ) ( not ( = ?auto_227893 ?auto_227898 ) ) ( not ( = ?auto_227894 ?auto_227895 ) ) ( not ( = ?auto_227894 ?auto_227896 ) ) ( not ( = ?auto_227894 ?auto_227897 ) ) ( not ( = ?auto_227894 ?auto_227898 ) ) ( not ( = ?auto_227895 ?auto_227896 ) ) ( not ( = ?auto_227895 ?auto_227897 ) ) ( not ( = ?auto_227895 ?auto_227898 ) ) ( not ( = ?auto_227896 ?auto_227897 ) ) ( not ( = ?auto_227896 ?auto_227898 ) ) ( not ( = ?auto_227897 ?auto_227898 ) ) ( ON ?auto_227896 ?auto_227897 ) ( ON ?auto_227895 ?auto_227896 ) ( ON ?auto_227894 ?auto_227895 ) ( ON ?auto_227893 ?auto_227894 ) ( ON ?auto_227892 ?auto_227893 ) ( ON ?auto_227891 ?auto_227892 ) ( ON ?auto_227890 ?auto_227891 ) ( CLEAR ?auto_227888 ) ( ON ?auto_227889 ?auto_227890 ) ( CLEAR ?auto_227889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_227888 ?auto_227889 )
      ( MAKE-10PILE ?auto_227888 ?auto_227889 ?auto_227890 ?auto_227891 ?auto_227892 ?auto_227893 ?auto_227894 ?auto_227895 ?auto_227896 ?auto_227897 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227909 - BLOCK
      ?auto_227910 - BLOCK
      ?auto_227911 - BLOCK
      ?auto_227912 - BLOCK
      ?auto_227913 - BLOCK
      ?auto_227914 - BLOCK
      ?auto_227915 - BLOCK
      ?auto_227916 - BLOCK
      ?auto_227917 - BLOCK
      ?auto_227918 - BLOCK
    )
    :vars
    (
      ?auto_227919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227918 ?auto_227919 ) ( ON-TABLE ?auto_227909 ) ( not ( = ?auto_227909 ?auto_227910 ) ) ( not ( = ?auto_227909 ?auto_227911 ) ) ( not ( = ?auto_227909 ?auto_227912 ) ) ( not ( = ?auto_227909 ?auto_227913 ) ) ( not ( = ?auto_227909 ?auto_227914 ) ) ( not ( = ?auto_227909 ?auto_227915 ) ) ( not ( = ?auto_227909 ?auto_227916 ) ) ( not ( = ?auto_227909 ?auto_227917 ) ) ( not ( = ?auto_227909 ?auto_227918 ) ) ( not ( = ?auto_227909 ?auto_227919 ) ) ( not ( = ?auto_227910 ?auto_227911 ) ) ( not ( = ?auto_227910 ?auto_227912 ) ) ( not ( = ?auto_227910 ?auto_227913 ) ) ( not ( = ?auto_227910 ?auto_227914 ) ) ( not ( = ?auto_227910 ?auto_227915 ) ) ( not ( = ?auto_227910 ?auto_227916 ) ) ( not ( = ?auto_227910 ?auto_227917 ) ) ( not ( = ?auto_227910 ?auto_227918 ) ) ( not ( = ?auto_227910 ?auto_227919 ) ) ( not ( = ?auto_227911 ?auto_227912 ) ) ( not ( = ?auto_227911 ?auto_227913 ) ) ( not ( = ?auto_227911 ?auto_227914 ) ) ( not ( = ?auto_227911 ?auto_227915 ) ) ( not ( = ?auto_227911 ?auto_227916 ) ) ( not ( = ?auto_227911 ?auto_227917 ) ) ( not ( = ?auto_227911 ?auto_227918 ) ) ( not ( = ?auto_227911 ?auto_227919 ) ) ( not ( = ?auto_227912 ?auto_227913 ) ) ( not ( = ?auto_227912 ?auto_227914 ) ) ( not ( = ?auto_227912 ?auto_227915 ) ) ( not ( = ?auto_227912 ?auto_227916 ) ) ( not ( = ?auto_227912 ?auto_227917 ) ) ( not ( = ?auto_227912 ?auto_227918 ) ) ( not ( = ?auto_227912 ?auto_227919 ) ) ( not ( = ?auto_227913 ?auto_227914 ) ) ( not ( = ?auto_227913 ?auto_227915 ) ) ( not ( = ?auto_227913 ?auto_227916 ) ) ( not ( = ?auto_227913 ?auto_227917 ) ) ( not ( = ?auto_227913 ?auto_227918 ) ) ( not ( = ?auto_227913 ?auto_227919 ) ) ( not ( = ?auto_227914 ?auto_227915 ) ) ( not ( = ?auto_227914 ?auto_227916 ) ) ( not ( = ?auto_227914 ?auto_227917 ) ) ( not ( = ?auto_227914 ?auto_227918 ) ) ( not ( = ?auto_227914 ?auto_227919 ) ) ( not ( = ?auto_227915 ?auto_227916 ) ) ( not ( = ?auto_227915 ?auto_227917 ) ) ( not ( = ?auto_227915 ?auto_227918 ) ) ( not ( = ?auto_227915 ?auto_227919 ) ) ( not ( = ?auto_227916 ?auto_227917 ) ) ( not ( = ?auto_227916 ?auto_227918 ) ) ( not ( = ?auto_227916 ?auto_227919 ) ) ( not ( = ?auto_227917 ?auto_227918 ) ) ( not ( = ?auto_227917 ?auto_227919 ) ) ( not ( = ?auto_227918 ?auto_227919 ) ) ( ON ?auto_227917 ?auto_227918 ) ( ON ?auto_227916 ?auto_227917 ) ( ON ?auto_227915 ?auto_227916 ) ( ON ?auto_227914 ?auto_227915 ) ( ON ?auto_227913 ?auto_227914 ) ( ON ?auto_227912 ?auto_227913 ) ( ON ?auto_227911 ?auto_227912 ) ( CLEAR ?auto_227909 ) ( ON ?auto_227910 ?auto_227911 ) ( CLEAR ?auto_227910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_227909 ?auto_227910 )
      ( MAKE-10PILE ?auto_227909 ?auto_227910 ?auto_227911 ?auto_227912 ?auto_227913 ?auto_227914 ?auto_227915 ?auto_227916 ?auto_227917 ?auto_227918 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227930 - BLOCK
      ?auto_227931 - BLOCK
      ?auto_227932 - BLOCK
      ?auto_227933 - BLOCK
      ?auto_227934 - BLOCK
      ?auto_227935 - BLOCK
      ?auto_227936 - BLOCK
      ?auto_227937 - BLOCK
      ?auto_227938 - BLOCK
      ?auto_227939 - BLOCK
    )
    :vars
    (
      ?auto_227940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227939 ?auto_227940 ) ( not ( = ?auto_227930 ?auto_227931 ) ) ( not ( = ?auto_227930 ?auto_227932 ) ) ( not ( = ?auto_227930 ?auto_227933 ) ) ( not ( = ?auto_227930 ?auto_227934 ) ) ( not ( = ?auto_227930 ?auto_227935 ) ) ( not ( = ?auto_227930 ?auto_227936 ) ) ( not ( = ?auto_227930 ?auto_227937 ) ) ( not ( = ?auto_227930 ?auto_227938 ) ) ( not ( = ?auto_227930 ?auto_227939 ) ) ( not ( = ?auto_227930 ?auto_227940 ) ) ( not ( = ?auto_227931 ?auto_227932 ) ) ( not ( = ?auto_227931 ?auto_227933 ) ) ( not ( = ?auto_227931 ?auto_227934 ) ) ( not ( = ?auto_227931 ?auto_227935 ) ) ( not ( = ?auto_227931 ?auto_227936 ) ) ( not ( = ?auto_227931 ?auto_227937 ) ) ( not ( = ?auto_227931 ?auto_227938 ) ) ( not ( = ?auto_227931 ?auto_227939 ) ) ( not ( = ?auto_227931 ?auto_227940 ) ) ( not ( = ?auto_227932 ?auto_227933 ) ) ( not ( = ?auto_227932 ?auto_227934 ) ) ( not ( = ?auto_227932 ?auto_227935 ) ) ( not ( = ?auto_227932 ?auto_227936 ) ) ( not ( = ?auto_227932 ?auto_227937 ) ) ( not ( = ?auto_227932 ?auto_227938 ) ) ( not ( = ?auto_227932 ?auto_227939 ) ) ( not ( = ?auto_227932 ?auto_227940 ) ) ( not ( = ?auto_227933 ?auto_227934 ) ) ( not ( = ?auto_227933 ?auto_227935 ) ) ( not ( = ?auto_227933 ?auto_227936 ) ) ( not ( = ?auto_227933 ?auto_227937 ) ) ( not ( = ?auto_227933 ?auto_227938 ) ) ( not ( = ?auto_227933 ?auto_227939 ) ) ( not ( = ?auto_227933 ?auto_227940 ) ) ( not ( = ?auto_227934 ?auto_227935 ) ) ( not ( = ?auto_227934 ?auto_227936 ) ) ( not ( = ?auto_227934 ?auto_227937 ) ) ( not ( = ?auto_227934 ?auto_227938 ) ) ( not ( = ?auto_227934 ?auto_227939 ) ) ( not ( = ?auto_227934 ?auto_227940 ) ) ( not ( = ?auto_227935 ?auto_227936 ) ) ( not ( = ?auto_227935 ?auto_227937 ) ) ( not ( = ?auto_227935 ?auto_227938 ) ) ( not ( = ?auto_227935 ?auto_227939 ) ) ( not ( = ?auto_227935 ?auto_227940 ) ) ( not ( = ?auto_227936 ?auto_227937 ) ) ( not ( = ?auto_227936 ?auto_227938 ) ) ( not ( = ?auto_227936 ?auto_227939 ) ) ( not ( = ?auto_227936 ?auto_227940 ) ) ( not ( = ?auto_227937 ?auto_227938 ) ) ( not ( = ?auto_227937 ?auto_227939 ) ) ( not ( = ?auto_227937 ?auto_227940 ) ) ( not ( = ?auto_227938 ?auto_227939 ) ) ( not ( = ?auto_227938 ?auto_227940 ) ) ( not ( = ?auto_227939 ?auto_227940 ) ) ( ON ?auto_227938 ?auto_227939 ) ( ON ?auto_227937 ?auto_227938 ) ( ON ?auto_227936 ?auto_227937 ) ( ON ?auto_227935 ?auto_227936 ) ( ON ?auto_227934 ?auto_227935 ) ( ON ?auto_227933 ?auto_227934 ) ( ON ?auto_227932 ?auto_227933 ) ( ON ?auto_227931 ?auto_227932 ) ( ON ?auto_227930 ?auto_227931 ) ( CLEAR ?auto_227930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_227930 )
      ( MAKE-10PILE ?auto_227930 ?auto_227931 ?auto_227932 ?auto_227933 ?auto_227934 ?auto_227935 ?auto_227936 ?auto_227937 ?auto_227938 ?auto_227939 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_227951 - BLOCK
      ?auto_227952 - BLOCK
      ?auto_227953 - BLOCK
      ?auto_227954 - BLOCK
      ?auto_227955 - BLOCK
      ?auto_227956 - BLOCK
      ?auto_227957 - BLOCK
      ?auto_227958 - BLOCK
      ?auto_227959 - BLOCK
      ?auto_227960 - BLOCK
    )
    :vars
    (
      ?auto_227961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_227960 ?auto_227961 ) ( not ( = ?auto_227951 ?auto_227952 ) ) ( not ( = ?auto_227951 ?auto_227953 ) ) ( not ( = ?auto_227951 ?auto_227954 ) ) ( not ( = ?auto_227951 ?auto_227955 ) ) ( not ( = ?auto_227951 ?auto_227956 ) ) ( not ( = ?auto_227951 ?auto_227957 ) ) ( not ( = ?auto_227951 ?auto_227958 ) ) ( not ( = ?auto_227951 ?auto_227959 ) ) ( not ( = ?auto_227951 ?auto_227960 ) ) ( not ( = ?auto_227951 ?auto_227961 ) ) ( not ( = ?auto_227952 ?auto_227953 ) ) ( not ( = ?auto_227952 ?auto_227954 ) ) ( not ( = ?auto_227952 ?auto_227955 ) ) ( not ( = ?auto_227952 ?auto_227956 ) ) ( not ( = ?auto_227952 ?auto_227957 ) ) ( not ( = ?auto_227952 ?auto_227958 ) ) ( not ( = ?auto_227952 ?auto_227959 ) ) ( not ( = ?auto_227952 ?auto_227960 ) ) ( not ( = ?auto_227952 ?auto_227961 ) ) ( not ( = ?auto_227953 ?auto_227954 ) ) ( not ( = ?auto_227953 ?auto_227955 ) ) ( not ( = ?auto_227953 ?auto_227956 ) ) ( not ( = ?auto_227953 ?auto_227957 ) ) ( not ( = ?auto_227953 ?auto_227958 ) ) ( not ( = ?auto_227953 ?auto_227959 ) ) ( not ( = ?auto_227953 ?auto_227960 ) ) ( not ( = ?auto_227953 ?auto_227961 ) ) ( not ( = ?auto_227954 ?auto_227955 ) ) ( not ( = ?auto_227954 ?auto_227956 ) ) ( not ( = ?auto_227954 ?auto_227957 ) ) ( not ( = ?auto_227954 ?auto_227958 ) ) ( not ( = ?auto_227954 ?auto_227959 ) ) ( not ( = ?auto_227954 ?auto_227960 ) ) ( not ( = ?auto_227954 ?auto_227961 ) ) ( not ( = ?auto_227955 ?auto_227956 ) ) ( not ( = ?auto_227955 ?auto_227957 ) ) ( not ( = ?auto_227955 ?auto_227958 ) ) ( not ( = ?auto_227955 ?auto_227959 ) ) ( not ( = ?auto_227955 ?auto_227960 ) ) ( not ( = ?auto_227955 ?auto_227961 ) ) ( not ( = ?auto_227956 ?auto_227957 ) ) ( not ( = ?auto_227956 ?auto_227958 ) ) ( not ( = ?auto_227956 ?auto_227959 ) ) ( not ( = ?auto_227956 ?auto_227960 ) ) ( not ( = ?auto_227956 ?auto_227961 ) ) ( not ( = ?auto_227957 ?auto_227958 ) ) ( not ( = ?auto_227957 ?auto_227959 ) ) ( not ( = ?auto_227957 ?auto_227960 ) ) ( not ( = ?auto_227957 ?auto_227961 ) ) ( not ( = ?auto_227958 ?auto_227959 ) ) ( not ( = ?auto_227958 ?auto_227960 ) ) ( not ( = ?auto_227958 ?auto_227961 ) ) ( not ( = ?auto_227959 ?auto_227960 ) ) ( not ( = ?auto_227959 ?auto_227961 ) ) ( not ( = ?auto_227960 ?auto_227961 ) ) ( ON ?auto_227959 ?auto_227960 ) ( ON ?auto_227958 ?auto_227959 ) ( ON ?auto_227957 ?auto_227958 ) ( ON ?auto_227956 ?auto_227957 ) ( ON ?auto_227955 ?auto_227956 ) ( ON ?auto_227954 ?auto_227955 ) ( ON ?auto_227953 ?auto_227954 ) ( ON ?auto_227952 ?auto_227953 ) ( ON ?auto_227951 ?auto_227952 ) ( CLEAR ?auto_227951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_227951 )
      ( MAKE-10PILE ?auto_227951 ?auto_227952 ?auto_227953 ?auto_227954 ?auto_227955 ?auto_227956 ?auto_227957 ?auto_227958 ?auto_227959 ?auto_227960 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_227973 - BLOCK
      ?auto_227974 - BLOCK
      ?auto_227975 - BLOCK
      ?auto_227976 - BLOCK
      ?auto_227977 - BLOCK
      ?auto_227978 - BLOCK
      ?auto_227979 - BLOCK
      ?auto_227980 - BLOCK
      ?auto_227981 - BLOCK
      ?auto_227982 - BLOCK
      ?auto_227983 - BLOCK
    )
    :vars
    (
      ?auto_227984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_227982 ) ( ON ?auto_227983 ?auto_227984 ) ( CLEAR ?auto_227983 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_227973 ) ( ON ?auto_227974 ?auto_227973 ) ( ON ?auto_227975 ?auto_227974 ) ( ON ?auto_227976 ?auto_227975 ) ( ON ?auto_227977 ?auto_227976 ) ( ON ?auto_227978 ?auto_227977 ) ( ON ?auto_227979 ?auto_227978 ) ( ON ?auto_227980 ?auto_227979 ) ( ON ?auto_227981 ?auto_227980 ) ( ON ?auto_227982 ?auto_227981 ) ( not ( = ?auto_227973 ?auto_227974 ) ) ( not ( = ?auto_227973 ?auto_227975 ) ) ( not ( = ?auto_227973 ?auto_227976 ) ) ( not ( = ?auto_227973 ?auto_227977 ) ) ( not ( = ?auto_227973 ?auto_227978 ) ) ( not ( = ?auto_227973 ?auto_227979 ) ) ( not ( = ?auto_227973 ?auto_227980 ) ) ( not ( = ?auto_227973 ?auto_227981 ) ) ( not ( = ?auto_227973 ?auto_227982 ) ) ( not ( = ?auto_227973 ?auto_227983 ) ) ( not ( = ?auto_227973 ?auto_227984 ) ) ( not ( = ?auto_227974 ?auto_227975 ) ) ( not ( = ?auto_227974 ?auto_227976 ) ) ( not ( = ?auto_227974 ?auto_227977 ) ) ( not ( = ?auto_227974 ?auto_227978 ) ) ( not ( = ?auto_227974 ?auto_227979 ) ) ( not ( = ?auto_227974 ?auto_227980 ) ) ( not ( = ?auto_227974 ?auto_227981 ) ) ( not ( = ?auto_227974 ?auto_227982 ) ) ( not ( = ?auto_227974 ?auto_227983 ) ) ( not ( = ?auto_227974 ?auto_227984 ) ) ( not ( = ?auto_227975 ?auto_227976 ) ) ( not ( = ?auto_227975 ?auto_227977 ) ) ( not ( = ?auto_227975 ?auto_227978 ) ) ( not ( = ?auto_227975 ?auto_227979 ) ) ( not ( = ?auto_227975 ?auto_227980 ) ) ( not ( = ?auto_227975 ?auto_227981 ) ) ( not ( = ?auto_227975 ?auto_227982 ) ) ( not ( = ?auto_227975 ?auto_227983 ) ) ( not ( = ?auto_227975 ?auto_227984 ) ) ( not ( = ?auto_227976 ?auto_227977 ) ) ( not ( = ?auto_227976 ?auto_227978 ) ) ( not ( = ?auto_227976 ?auto_227979 ) ) ( not ( = ?auto_227976 ?auto_227980 ) ) ( not ( = ?auto_227976 ?auto_227981 ) ) ( not ( = ?auto_227976 ?auto_227982 ) ) ( not ( = ?auto_227976 ?auto_227983 ) ) ( not ( = ?auto_227976 ?auto_227984 ) ) ( not ( = ?auto_227977 ?auto_227978 ) ) ( not ( = ?auto_227977 ?auto_227979 ) ) ( not ( = ?auto_227977 ?auto_227980 ) ) ( not ( = ?auto_227977 ?auto_227981 ) ) ( not ( = ?auto_227977 ?auto_227982 ) ) ( not ( = ?auto_227977 ?auto_227983 ) ) ( not ( = ?auto_227977 ?auto_227984 ) ) ( not ( = ?auto_227978 ?auto_227979 ) ) ( not ( = ?auto_227978 ?auto_227980 ) ) ( not ( = ?auto_227978 ?auto_227981 ) ) ( not ( = ?auto_227978 ?auto_227982 ) ) ( not ( = ?auto_227978 ?auto_227983 ) ) ( not ( = ?auto_227978 ?auto_227984 ) ) ( not ( = ?auto_227979 ?auto_227980 ) ) ( not ( = ?auto_227979 ?auto_227981 ) ) ( not ( = ?auto_227979 ?auto_227982 ) ) ( not ( = ?auto_227979 ?auto_227983 ) ) ( not ( = ?auto_227979 ?auto_227984 ) ) ( not ( = ?auto_227980 ?auto_227981 ) ) ( not ( = ?auto_227980 ?auto_227982 ) ) ( not ( = ?auto_227980 ?auto_227983 ) ) ( not ( = ?auto_227980 ?auto_227984 ) ) ( not ( = ?auto_227981 ?auto_227982 ) ) ( not ( = ?auto_227981 ?auto_227983 ) ) ( not ( = ?auto_227981 ?auto_227984 ) ) ( not ( = ?auto_227982 ?auto_227983 ) ) ( not ( = ?auto_227982 ?auto_227984 ) ) ( not ( = ?auto_227983 ?auto_227984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_227983 ?auto_227984 )
      ( !STACK ?auto_227983 ?auto_227982 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_227996 - BLOCK
      ?auto_227997 - BLOCK
      ?auto_227998 - BLOCK
      ?auto_227999 - BLOCK
      ?auto_228000 - BLOCK
      ?auto_228001 - BLOCK
      ?auto_228002 - BLOCK
      ?auto_228003 - BLOCK
      ?auto_228004 - BLOCK
      ?auto_228005 - BLOCK
      ?auto_228006 - BLOCK
    )
    :vars
    (
      ?auto_228007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_228005 ) ( ON ?auto_228006 ?auto_228007 ) ( CLEAR ?auto_228006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_227996 ) ( ON ?auto_227997 ?auto_227996 ) ( ON ?auto_227998 ?auto_227997 ) ( ON ?auto_227999 ?auto_227998 ) ( ON ?auto_228000 ?auto_227999 ) ( ON ?auto_228001 ?auto_228000 ) ( ON ?auto_228002 ?auto_228001 ) ( ON ?auto_228003 ?auto_228002 ) ( ON ?auto_228004 ?auto_228003 ) ( ON ?auto_228005 ?auto_228004 ) ( not ( = ?auto_227996 ?auto_227997 ) ) ( not ( = ?auto_227996 ?auto_227998 ) ) ( not ( = ?auto_227996 ?auto_227999 ) ) ( not ( = ?auto_227996 ?auto_228000 ) ) ( not ( = ?auto_227996 ?auto_228001 ) ) ( not ( = ?auto_227996 ?auto_228002 ) ) ( not ( = ?auto_227996 ?auto_228003 ) ) ( not ( = ?auto_227996 ?auto_228004 ) ) ( not ( = ?auto_227996 ?auto_228005 ) ) ( not ( = ?auto_227996 ?auto_228006 ) ) ( not ( = ?auto_227996 ?auto_228007 ) ) ( not ( = ?auto_227997 ?auto_227998 ) ) ( not ( = ?auto_227997 ?auto_227999 ) ) ( not ( = ?auto_227997 ?auto_228000 ) ) ( not ( = ?auto_227997 ?auto_228001 ) ) ( not ( = ?auto_227997 ?auto_228002 ) ) ( not ( = ?auto_227997 ?auto_228003 ) ) ( not ( = ?auto_227997 ?auto_228004 ) ) ( not ( = ?auto_227997 ?auto_228005 ) ) ( not ( = ?auto_227997 ?auto_228006 ) ) ( not ( = ?auto_227997 ?auto_228007 ) ) ( not ( = ?auto_227998 ?auto_227999 ) ) ( not ( = ?auto_227998 ?auto_228000 ) ) ( not ( = ?auto_227998 ?auto_228001 ) ) ( not ( = ?auto_227998 ?auto_228002 ) ) ( not ( = ?auto_227998 ?auto_228003 ) ) ( not ( = ?auto_227998 ?auto_228004 ) ) ( not ( = ?auto_227998 ?auto_228005 ) ) ( not ( = ?auto_227998 ?auto_228006 ) ) ( not ( = ?auto_227998 ?auto_228007 ) ) ( not ( = ?auto_227999 ?auto_228000 ) ) ( not ( = ?auto_227999 ?auto_228001 ) ) ( not ( = ?auto_227999 ?auto_228002 ) ) ( not ( = ?auto_227999 ?auto_228003 ) ) ( not ( = ?auto_227999 ?auto_228004 ) ) ( not ( = ?auto_227999 ?auto_228005 ) ) ( not ( = ?auto_227999 ?auto_228006 ) ) ( not ( = ?auto_227999 ?auto_228007 ) ) ( not ( = ?auto_228000 ?auto_228001 ) ) ( not ( = ?auto_228000 ?auto_228002 ) ) ( not ( = ?auto_228000 ?auto_228003 ) ) ( not ( = ?auto_228000 ?auto_228004 ) ) ( not ( = ?auto_228000 ?auto_228005 ) ) ( not ( = ?auto_228000 ?auto_228006 ) ) ( not ( = ?auto_228000 ?auto_228007 ) ) ( not ( = ?auto_228001 ?auto_228002 ) ) ( not ( = ?auto_228001 ?auto_228003 ) ) ( not ( = ?auto_228001 ?auto_228004 ) ) ( not ( = ?auto_228001 ?auto_228005 ) ) ( not ( = ?auto_228001 ?auto_228006 ) ) ( not ( = ?auto_228001 ?auto_228007 ) ) ( not ( = ?auto_228002 ?auto_228003 ) ) ( not ( = ?auto_228002 ?auto_228004 ) ) ( not ( = ?auto_228002 ?auto_228005 ) ) ( not ( = ?auto_228002 ?auto_228006 ) ) ( not ( = ?auto_228002 ?auto_228007 ) ) ( not ( = ?auto_228003 ?auto_228004 ) ) ( not ( = ?auto_228003 ?auto_228005 ) ) ( not ( = ?auto_228003 ?auto_228006 ) ) ( not ( = ?auto_228003 ?auto_228007 ) ) ( not ( = ?auto_228004 ?auto_228005 ) ) ( not ( = ?auto_228004 ?auto_228006 ) ) ( not ( = ?auto_228004 ?auto_228007 ) ) ( not ( = ?auto_228005 ?auto_228006 ) ) ( not ( = ?auto_228005 ?auto_228007 ) ) ( not ( = ?auto_228006 ?auto_228007 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_228006 ?auto_228007 )
      ( !STACK ?auto_228006 ?auto_228005 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228019 - BLOCK
      ?auto_228020 - BLOCK
      ?auto_228021 - BLOCK
      ?auto_228022 - BLOCK
      ?auto_228023 - BLOCK
      ?auto_228024 - BLOCK
      ?auto_228025 - BLOCK
      ?auto_228026 - BLOCK
      ?auto_228027 - BLOCK
      ?auto_228028 - BLOCK
      ?auto_228029 - BLOCK
    )
    :vars
    (
      ?auto_228030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228029 ?auto_228030 ) ( ON-TABLE ?auto_228019 ) ( ON ?auto_228020 ?auto_228019 ) ( ON ?auto_228021 ?auto_228020 ) ( ON ?auto_228022 ?auto_228021 ) ( ON ?auto_228023 ?auto_228022 ) ( ON ?auto_228024 ?auto_228023 ) ( ON ?auto_228025 ?auto_228024 ) ( ON ?auto_228026 ?auto_228025 ) ( ON ?auto_228027 ?auto_228026 ) ( not ( = ?auto_228019 ?auto_228020 ) ) ( not ( = ?auto_228019 ?auto_228021 ) ) ( not ( = ?auto_228019 ?auto_228022 ) ) ( not ( = ?auto_228019 ?auto_228023 ) ) ( not ( = ?auto_228019 ?auto_228024 ) ) ( not ( = ?auto_228019 ?auto_228025 ) ) ( not ( = ?auto_228019 ?auto_228026 ) ) ( not ( = ?auto_228019 ?auto_228027 ) ) ( not ( = ?auto_228019 ?auto_228028 ) ) ( not ( = ?auto_228019 ?auto_228029 ) ) ( not ( = ?auto_228019 ?auto_228030 ) ) ( not ( = ?auto_228020 ?auto_228021 ) ) ( not ( = ?auto_228020 ?auto_228022 ) ) ( not ( = ?auto_228020 ?auto_228023 ) ) ( not ( = ?auto_228020 ?auto_228024 ) ) ( not ( = ?auto_228020 ?auto_228025 ) ) ( not ( = ?auto_228020 ?auto_228026 ) ) ( not ( = ?auto_228020 ?auto_228027 ) ) ( not ( = ?auto_228020 ?auto_228028 ) ) ( not ( = ?auto_228020 ?auto_228029 ) ) ( not ( = ?auto_228020 ?auto_228030 ) ) ( not ( = ?auto_228021 ?auto_228022 ) ) ( not ( = ?auto_228021 ?auto_228023 ) ) ( not ( = ?auto_228021 ?auto_228024 ) ) ( not ( = ?auto_228021 ?auto_228025 ) ) ( not ( = ?auto_228021 ?auto_228026 ) ) ( not ( = ?auto_228021 ?auto_228027 ) ) ( not ( = ?auto_228021 ?auto_228028 ) ) ( not ( = ?auto_228021 ?auto_228029 ) ) ( not ( = ?auto_228021 ?auto_228030 ) ) ( not ( = ?auto_228022 ?auto_228023 ) ) ( not ( = ?auto_228022 ?auto_228024 ) ) ( not ( = ?auto_228022 ?auto_228025 ) ) ( not ( = ?auto_228022 ?auto_228026 ) ) ( not ( = ?auto_228022 ?auto_228027 ) ) ( not ( = ?auto_228022 ?auto_228028 ) ) ( not ( = ?auto_228022 ?auto_228029 ) ) ( not ( = ?auto_228022 ?auto_228030 ) ) ( not ( = ?auto_228023 ?auto_228024 ) ) ( not ( = ?auto_228023 ?auto_228025 ) ) ( not ( = ?auto_228023 ?auto_228026 ) ) ( not ( = ?auto_228023 ?auto_228027 ) ) ( not ( = ?auto_228023 ?auto_228028 ) ) ( not ( = ?auto_228023 ?auto_228029 ) ) ( not ( = ?auto_228023 ?auto_228030 ) ) ( not ( = ?auto_228024 ?auto_228025 ) ) ( not ( = ?auto_228024 ?auto_228026 ) ) ( not ( = ?auto_228024 ?auto_228027 ) ) ( not ( = ?auto_228024 ?auto_228028 ) ) ( not ( = ?auto_228024 ?auto_228029 ) ) ( not ( = ?auto_228024 ?auto_228030 ) ) ( not ( = ?auto_228025 ?auto_228026 ) ) ( not ( = ?auto_228025 ?auto_228027 ) ) ( not ( = ?auto_228025 ?auto_228028 ) ) ( not ( = ?auto_228025 ?auto_228029 ) ) ( not ( = ?auto_228025 ?auto_228030 ) ) ( not ( = ?auto_228026 ?auto_228027 ) ) ( not ( = ?auto_228026 ?auto_228028 ) ) ( not ( = ?auto_228026 ?auto_228029 ) ) ( not ( = ?auto_228026 ?auto_228030 ) ) ( not ( = ?auto_228027 ?auto_228028 ) ) ( not ( = ?auto_228027 ?auto_228029 ) ) ( not ( = ?auto_228027 ?auto_228030 ) ) ( not ( = ?auto_228028 ?auto_228029 ) ) ( not ( = ?auto_228028 ?auto_228030 ) ) ( not ( = ?auto_228029 ?auto_228030 ) ) ( CLEAR ?auto_228027 ) ( ON ?auto_228028 ?auto_228029 ) ( CLEAR ?auto_228028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_228019 ?auto_228020 ?auto_228021 ?auto_228022 ?auto_228023 ?auto_228024 ?auto_228025 ?auto_228026 ?auto_228027 ?auto_228028 )
      ( MAKE-11PILE ?auto_228019 ?auto_228020 ?auto_228021 ?auto_228022 ?auto_228023 ?auto_228024 ?auto_228025 ?auto_228026 ?auto_228027 ?auto_228028 ?auto_228029 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228042 - BLOCK
      ?auto_228043 - BLOCK
      ?auto_228044 - BLOCK
      ?auto_228045 - BLOCK
      ?auto_228046 - BLOCK
      ?auto_228047 - BLOCK
      ?auto_228048 - BLOCK
      ?auto_228049 - BLOCK
      ?auto_228050 - BLOCK
      ?auto_228051 - BLOCK
      ?auto_228052 - BLOCK
    )
    :vars
    (
      ?auto_228053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228052 ?auto_228053 ) ( ON-TABLE ?auto_228042 ) ( ON ?auto_228043 ?auto_228042 ) ( ON ?auto_228044 ?auto_228043 ) ( ON ?auto_228045 ?auto_228044 ) ( ON ?auto_228046 ?auto_228045 ) ( ON ?auto_228047 ?auto_228046 ) ( ON ?auto_228048 ?auto_228047 ) ( ON ?auto_228049 ?auto_228048 ) ( ON ?auto_228050 ?auto_228049 ) ( not ( = ?auto_228042 ?auto_228043 ) ) ( not ( = ?auto_228042 ?auto_228044 ) ) ( not ( = ?auto_228042 ?auto_228045 ) ) ( not ( = ?auto_228042 ?auto_228046 ) ) ( not ( = ?auto_228042 ?auto_228047 ) ) ( not ( = ?auto_228042 ?auto_228048 ) ) ( not ( = ?auto_228042 ?auto_228049 ) ) ( not ( = ?auto_228042 ?auto_228050 ) ) ( not ( = ?auto_228042 ?auto_228051 ) ) ( not ( = ?auto_228042 ?auto_228052 ) ) ( not ( = ?auto_228042 ?auto_228053 ) ) ( not ( = ?auto_228043 ?auto_228044 ) ) ( not ( = ?auto_228043 ?auto_228045 ) ) ( not ( = ?auto_228043 ?auto_228046 ) ) ( not ( = ?auto_228043 ?auto_228047 ) ) ( not ( = ?auto_228043 ?auto_228048 ) ) ( not ( = ?auto_228043 ?auto_228049 ) ) ( not ( = ?auto_228043 ?auto_228050 ) ) ( not ( = ?auto_228043 ?auto_228051 ) ) ( not ( = ?auto_228043 ?auto_228052 ) ) ( not ( = ?auto_228043 ?auto_228053 ) ) ( not ( = ?auto_228044 ?auto_228045 ) ) ( not ( = ?auto_228044 ?auto_228046 ) ) ( not ( = ?auto_228044 ?auto_228047 ) ) ( not ( = ?auto_228044 ?auto_228048 ) ) ( not ( = ?auto_228044 ?auto_228049 ) ) ( not ( = ?auto_228044 ?auto_228050 ) ) ( not ( = ?auto_228044 ?auto_228051 ) ) ( not ( = ?auto_228044 ?auto_228052 ) ) ( not ( = ?auto_228044 ?auto_228053 ) ) ( not ( = ?auto_228045 ?auto_228046 ) ) ( not ( = ?auto_228045 ?auto_228047 ) ) ( not ( = ?auto_228045 ?auto_228048 ) ) ( not ( = ?auto_228045 ?auto_228049 ) ) ( not ( = ?auto_228045 ?auto_228050 ) ) ( not ( = ?auto_228045 ?auto_228051 ) ) ( not ( = ?auto_228045 ?auto_228052 ) ) ( not ( = ?auto_228045 ?auto_228053 ) ) ( not ( = ?auto_228046 ?auto_228047 ) ) ( not ( = ?auto_228046 ?auto_228048 ) ) ( not ( = ?auto_228046 ?auto_228049 ) ) ( not ( = ?auto_228046 ?auto_228050 ) ) ( not ( = ?auto_228046 ?auto_228051 ) ) ( not ( = ?auto_228046 ?auto_228052 ) ) ( not ( = ?auto_228046 ?auto_228053 ) ) ( not ( = ?auto_228047 ?auto_228048 ) ) ( not ( = ?auto_228047 ?auto_228049 ) ) ( not ( = ?auto_228047 ?auto_228050 ) ) ( not ( = ?auto_228047 ?auto_228051 ) ) ( not ( = ?auto_228047 ?auto_228052 ) ) ( not ( = ?auto_228047 ?auto_228053 ) ) ( not ( = ?auto_228048 ?auto_228049 ) ) ( not ( = ?auto_228048 ?auto_228050 ) ) ( not ( = ?auto_228048 ?auto_228051 ) ) ( not ( = ?auto_228048 ?auto_228052 ) ) ( not ( = ?auto_228048 ?auto_228053 ) ) ( not ( = ?auto_228049 ?auto_228050 ) ) ( not ( = ?auto_228049 ?auto_228051 ) ) ( not ( = ?auto_228049 ?auto_228052 ) ) ( not ( = ?auto_228049 ?auto_228053 ) ) ( not ( = ?auto_228050 ?auto_228051 ) ) ( not ( = ?auto_228050 ?auto_228052 ) ) ( not ( = ?auto_228050 ?auto_228053 ) ) ( not ( = ?auto_228051 ?auto_228052 ) ) ( not ( = ?auto_228051 ?auto_228053 ) ) ( not ( = ?auto_228052 ?auto_228053 ) ) ( CLEAR ?auto_228050 ) ( ON ?auto_228051 ?auto_228052 ) ( CLEAR ?auto_228051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_228042 ?auto_228043 ?auto_228044 ?auto_228045 ?auto_228046 ?auto_228047 ?auto_228048 ?auto_228049 ?auto_228050 ?auto_228051 )
      ( MAKE-11PILE ?auto_228042 ?auto_228043 ?auto_228044 ?auto_228045 ?auto_228046 ?auto_228047 ?auto_228048 ?auto_228049 ?auto_228050 ?auto_228051 ?auto_228052 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228065 - BLOCK
      ?auto_228066 - BLOCK
      ?auto_228067 - BLOCK
      ?auto_228068 - BLOCK
      ?auto_228069 - BLOCK
      ?auto_228070 - BLOCK
      ?auto_228071 - BLOCK
      ?auto_228072 - BLOCK
      ?auto_228073 - BLOCK
      ?auto_228074 - BLOCK
      ?auto_228075 - BLOCK
    )
    :vars
    (
      ?auto_228076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228075 ?auto_228076 ) ( ON-TABLE ?auto_228065 ) ( ON ?auto_228066 ?auto_228065 ) ( ON ?auto_228067 ?auto_228066 ) ( ON ?auto_228068 ?auto_228067 ) ( ON ?auto_228069 ?auto_228068 ) ( ON ?auto_228070 ?auto_228069 ) ( ON ?auto_228071 ?auto_228070 ) ( ON ?auto_228072 ?auto_228071 ) ( not ( = ?auto_228065 ?auto_228066 ) ) ( not ( = ?auto_228065 ?auto_228067 ) ) ( not ( = ?auto_228065 ?auto_228068 ) ) ( not ( = ?auto_228065 ?auto_228069 ) ) ( not ( = ?auto_228065 ?auto_228070 ) ) ( not ( = ?auto_228065 ?auto_228071 ) ) ( not ( = ?auto_228065 ?auto_228072 ) ) ( not ( = ?auto_228065 ?auto_228073 ) ) ( not ( = ?auto_228065 ?auto_228074 ) ) ( not ( = ?auto_228065 ?auto_228075 ) ) ( not ( = ?auto_228065 ?auto_228076 ) ) ( not ( = ?auto_228066 ?auto_228067 ) ) ( not ( = ?auto_228066 ?auto_228068 ) ) ( not ( = ?auto_228066 ?auto_228069 ) ) ( not ( = ?auto_228066 ?auto_228070 ) ) ( not ( = ?auto_228066 ?auto_228071 ) ) ( not ( = ?auto_228066 ?auto_228072 ) ) ( not ( = ?auto_228066 ?auto_228073 ) ) ( not ( = ?auto_228066 ?auto_228074 ) ) ( not ( = ?auto_228066 ?auto_228075 ) ) ( not ( = ?auto_228066 ?auto_228076 ) ) ( not ( = ?auto_228067 ?auto_228068 ) ) ( not ( = ?auto_228067 ?auto_228069 ) ) ( not ( = ?auto_228067 ?auto_228070 ) ) ( not ( = ?auto_228067 ?auto_228071 ) ) ( not ( = ?auto_228067 ?auto_228072 ) ) ( not ( = ?auto_228067 ?auto_228073 ) ) ( not ( = ?auto_228067 ?auto_228074 ) ) ( not ( = ?auto_228067 ?auto_228075 ) ) ( not ( = ?auto_228067 ?auto_228076 ) ) ( not ( = ?auto_228068 ?auto_228069 ) ) ( not ( = ?auto_228068 ?auto_228070 ) ) ( not ( = ?auto_228068 ?auto_228071 ) ) ( not ( = ?auto_228068 ?auto_228072 ) ) ( not ( = ?auto_228068 ?auto_228073 ) ) ( not ( = ?auto_228068 ?auto_228074 ) ) ( not ( = ?auto_228068 ?auto_228075 ) ) ( not ( = ?auto_228068 ?auto_228076 ) ) ( not ( = ?auto_228069 ?auto_228070 ) ) ( not ( = ?auto_228069 ?auto_228071 ) ) ( not ( = ?auto_228069 ?auto_228072 ) ) ( not ( = ?auto_228069 ?auto_228073 ) ) ( not ( = ?auto_228069 ?auto_228074 ) ) ( not ( = ?auto_228069 ?auto_228075 ) ) ( not ( = ?auto_228069 ?auto_228076 ) ) ( not ( = ?auto_228070 ?auto_228071 ) ) ( not ( = ?auto_228070 ?auto_228072 ) ) ( not ( = ?auto_228070 ?auto_228073 ) ) ( not ( = ?auto_228070 ?auto_228074 ) ) ( not ( = ?auto_228070 ?auto_228075 ) ) ( not ( = ?auto_228070 ?auto_228076 ) ) ( not ( = ?auto_228071 ?auto_228072 ) ) ( not ( = ?auto_228071 ?auto_228073 ) ) ( not ( = ?auto_228071 ?auto_228074 ) ) ( not ( = ?auto_228071 ?auto_228075 ) ) ( not ( = ?auto_228071 ?auto_228076 ) ) ( not ( = ?auto_228072 ?auto_228073 ) ) ( not ( = ?auto_228072 ?auto_228074 ) ) ( not ( = ?auto_228072 ?auto_228075 ) ) ( not ( = ?auto_228072 ?auto_228076 ) ) ( not ( = ?auto_228073 ?auto_228074 ) ) ( not ( = ?auto_228073 ?auto_228075 ) ) ( not ( = ?auto_228073 ?auto_228076 ) ) ( not ( = ?auto_228074 ?auto_228075 ) ) ( not ( = ?auto_228074 ?auto_228076 ) ) ( not ( = ?auto_228075 ?auto_228076 ) ) ( ON ?auto_228074 ?auto_228075 ) ( CLEAR ?auto_228072 ) ( ON ?auto_228073 ?auto_228074 ) ( CLEAR ?auto_228073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_228065 ?auto_228066 ?auto_228067 ?auto_228068 ?auto_228069 ?auto_228070 ?auto_228071 ?auto_228072 ?auto_228073 )
      ( MAKE-11PILE ?auto_228065 ?auto_228066 ?auto_228067 ?auto_228068 ?auto_228069 ?auto_228070 ?auto_228071 ?auto_228072 ?auto_228073 ?auto_228074 ?auto_228075 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228088 - BLOCK
      ?auto_228089 - BLOCK
      ?auto_228090 - BLOCK
      ?auto_228091 - BLOCK
      ?auto_228092 - BLOCK
      ?auto_228093 - BLOCK
      ?auto_228094 - BLOCK
      ?auto_228095 - BLOCK
      ?auto_228096 - BLOCK
      ?auto_228097 - BLOCK
      ?auto_228098 - BLOCK
    )
    :vars
    (
      ?auto_228099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228098 ?auto_228099 ) ( ON-TABLE ?auto_228088 ) ( ON ?auto_228089 ?auto_228088 ) ( ON ?auto_228090 ?auto_228089 ) ( ON ?auto_228091 ?auto_228090 ) ( ON ?auto_228092 ?auto_228091 ) ( ON ?auto_228093 ?auto_228092 ) ( ON ?auto_228094 ?auto_228093 ) ( ON ?auto_228095 ?auto_228094 ) ( not ( = ?auto_228088 ?auto_228089 ) ) ( not ( = ?auto_228088 ?auto_228090 ) ) ( not ( = ?auto_228088 ?auto_228091 ) ) ( not ( = ?auto_228088 ?auto_228092 ) ) ( not ( = ?auto_228088 ?auto_228093 ) ) ( not ( = ?auto_228088 ?auto_228094 ) ) ( not ( = ?auto_228088 ?auto_228095 ) ) ( not ( = ?auto_228088 ?auto_228096 ) ) ( not ( = ?auto_228088 ?auto_228097 ) ) ( not ( = ?auto_228088 ?auto_228098 ) ) ( not ( = ?auto_228088 ?auto_228099 ) ) ( not ( = ?auto_228089 ?auto_228090 ) ) ( not ( = ?auto_228089 ?auto_228091 ) ) ( not ( = ?auto_228089 ?auto_228092 ) ) ( not ( = ?auto_228089 ?auto_228093 ) ) ( not ( = ?auto_228089 ?auto_228094 ) ) ( not ( = ?auto_228089 ?auto_228095 ) ) ( not ( = ?auto_228089 ?auto_228096 ) ) ( not ( = ?auto_228089 ?auto_228097 ) ) ( not ( = ?auto_228089 ?auto_228098 ) ) ( not ( = ?auto_228089 ?auto_228099 ) ) ( not ( = ?auto_228090 ?auto_228091 ) ) ( not ( = ?auto_228090 ?auto_228092 ) ) ( not ( = ?auto_228090 ?auto_228093 ) ) ( not ( = ?auto_228090 ?auto_228094 ) ) ( not ( = ?auto_228090 ?auto_228095 ) ) ( not ( = ?auto_228090 ?auto_228096 ) ) ( not ( = ?auto_228090 ?auto_228097 ) ) ( not ( = ?auto_228090 ?auto_228098 ) ) ( not ( = ?auto_228090 ?auto_228099 ) ) ( not ( = ?auto_228091 ?auto_228092 ) ) ( not ( = ?auto_228091 ?auto_228093 ) ) ( not ( = ?auto_228091 ?auto_228094 ) ) ( not ( = ?auto_228091 ?auto_228095 ) ) ( not ( = ?auto_228091 ?auto_228096 ) ) ( not ( = ?auto_228091 ?auto_228097 ) ) ( not ( = ?auto_228091 ?auto_228098 ) ) ( not ( = ?auto_228091 ?auto_228099 ) ) ( not ( = ?auto_228092 ?auto_228093 ) ) ( not ( = ?auto_228092 ?auto_228094 ) ) ( not ( = ?auto_228092 ?auto_228095 ) ) ( not ( = ?auto_228092 ?auto_228096 ) ) ( not ( = ?auto_228092 ?auto_228097 ) ) ( not ( = ?auto_228092 ?auto_228098 ) ) ( not ( = ?auto_228092 ?auto_228099 ) ) ( not ( = ?auto_228093 ?auto_228094 ) ) ( not ( = ?auto_228093 ?auto_228095 ) ) ( not ( = ?auto_228093 ?auto_228096 ) ) ( not ( = ?auto_228093 ?auto_228097 ) ) ( not ( = ?auto_228093 ?auto_228098 ) ) ( not ( = ?auto_228093 ?auto_228099 ) ) ( not ( = ?auto_228094 ?auto_228095 ) ) ( not ( = ?auto_228094 ?auto_228096 ) ) ( not ( = ?auto_228094 ?auto_228097 ) ) ( not ( = ?auto_228094 ?auto_228098 ) ) ( not ( = ?auto_228094 ?auto_228099 ) ) ( not ( = ?auto_228095 ?auto_228096 ) ) ( not ( = ?auto_228095 ?auto_228097 ) ) ( not ( = ?auto_228095 ?auto_228098 ) ) ( not ( = ?auto_228095 ?auto_228099 ) ) ( not ( = ?auto_228096 ?auto_228097 ) ) ( not ( = ?auto_228096 ?auto_228098 ) ) ( not ( = ?auto_228096 ?auto_228099 ) ) ( not ( = ?auto_228097 ?auto_228098 ) ) ( not ( = ?auto_228097 ?auto_228099 ) ) ( not ( = ?auto_228098 ?auto_228099 ) ) ( ON ?auto_228097 ?auto_228098 ) ( CLEAR ?auto_228095 ) ( ON ?auto_228096 ?auto_228097 ) ( CLEAR ?auto_228096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_228088 ?auto_228089 ?auto_228090 ?auto_228091 ?auto_228092 ?auto_228093 ?auto_228094 ?auto_228095 ?auto_228096 )
      ( MAKE-11PILE ?auto_228088 ?auto_228089 ?auto_228090 ?auto_228091 ?auto_228092 ?auto_228093 ?auto_228094 ?auto_228095 ?auto_228096 ?auto_228097 ?auto_228098 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228111 - BLOCK
      ?auto_228112 - BLOCK
      ?auto_228113 - BLOCK
      ?auto_228114 - BLOCK
      ?auto_228115 - BLOCK
      ?auto_228116 - BLOCK
      ?auto_228117 - BLOCK
      ?auto_228118 - BLOCK
      ?auto_228119 - BLOCK
      ?auto_228120 - BLOCK
      ?auto_228121 - BLOCK
    )
    :vars
    (
      ?auto_228122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228121 ?auto_228122 ) ( ON-TABLE ?auto_228111 ) ( ON ?auto_228112 ?auto_228111 ) ( ON ?auto_228113 ?auto_228112 ) ( ON ?auto_228114 ?auto_228113 ) ( ON ?auto_228115 ?auto_228114 ) ( ON ?auto_228116 ?auto_228115 ) ( ON ?auto_228117 ?auto_228116 ) ( not ( = ?auto_228111 ?auto_228112 ) ) ( not ( = ?auto_228111 ?auto_228113 ) ) ( not ( = ?auto_228111 ?auto_228114 ) ) ( not ( = ?auto_228111 ?auto_228115 ) ) ( not ( = ?auto_228111 ?auto_228116 ) ) ( not ( = ?auto_228111 ?auto_228117 ) ) ( not ( = ?auto_228111 ?auto_228118 ) ) ( not ( = ?auto_228111 ?auto_228119 ) ) ( not ( = ?auto_228111 ?auto_228120 ) ) ( not ( = ?auto_228111 ?auto_228121 ) ) ( not ( = ?auto_228111 ?auto_228122 ) ) ( not ( = ?auto_228112 ?auto_228113 ) ) ( not ( = ?auto_228112 ?auto_228114 ) ) ( not ( = ?auto_228112 ?auto_228115 ) ) ( not ( = ?auto_228112 ?auto_228116 ) ) ( not ( = ?auto_228112 ?auto_228117 ) ) ( not ( = ?auto_228112 ?auto_228118 ) ) ( not ( = ?auto_228112 ?auto_228119 ) ) ( not ( = ?auto_228112 ?auto_228120 ) ) ( not ( = ?auto_228112 ?auto_228121 ) ) ( not ( = ?auto_228112 ?auto_228122 ) ) ( not ( = ?auto_228113 ?auto_228114 ) ) ( not ( = ?auto_228113 ?auto_228115 ) ) ( not ( = ?auto_228113 ?auto_228116 ) ) ( not ( = ?auto_228113 ?auto_228117 ) ) ( not ( = ?auto_228113 ?auto_228118 ) ) ( not ( = ?auto_228113 ?auto_228119 ) ) ( not ( = ?auto_228113 ?auto_228120 ) ) ( not ( = ?auto_228113 ?auto_228121 ) ) ( not ( = ?auto_228113 ?auto_228122 ) ) ( not ( = ?auto_228114 ?auto_228115 ) ) ( not ( = ?auto_228114 ?auto_228116 ) ) ( not ( = ?auto_228114 ?auto_228117 ) ) ( not ( = ?auto_228114 ?auto_228118 ) ) ( not ( = ?auto_228114 ?auto_228119 ) ) ( not ( = ?auto_228114 ?auto_228120 ) ) ( not ( = ?auto_228114 ?auto_228121 ) ) ( not ( = ?auto_228114 ?auto_228122 ) ) ( not ( = ?auto_228115 ?auto_228116 ) ) ( not ( = ?auto_228115 ?auto_228117 ) ) ( not ( = ?auto_228115 ?auto_228118 ) ) ( not ( = ?auto_228115 ?auto_228119 ) ) ( not ( = ?auto_228115 ?auto_228120 ) ) ( not ( = ?auto_228115 ?auto_228121 ) ) ( not ( = ?auto_228115 ?auto_228122 ) ) ( not ( = ?auto_228116 ?auto_228117 ) ) ( not ( = ?auto_228116 ?auto_228118 ) ) ( not ( = ?auto_228116 ?auto_228119 ) ) ( not ( = ?auto_228116 ?auto_228120 ) ) ( not ( = ?auto_228116 ?auto_228121 ) ) ( not ( = ?auto_228116 ?auto_228122 ) ) ( not ( = ?auto_228117 ?auto_228118 ) ) ( not ( = ?auto_228117 ?auto_228119 ) ) ( not ( = ?auto_228117 ?auto_228120 ) ) ( not ( = ?auto_228117 ?auto_228121 ) ) ( not ( = ?auto_228117 ?auto_228122 ) ) ( not ( = ?auto_228118 ?auto_228119 ) ) ( not ( = ?auto_228118 ?auto_228120 ) ) ( not ( = ?auto_228118 ?auto_228121 ) ) ( not ( = ?auto_228118 ?auto_228122 ) ) ( not ( = ?auto_228119 ?auto_228120 ) ) ( not ( = ?auto_228119 ?auto_228121 ) ) ( not ( = ?auto_228119 ?auto_228122 ) ) ( not ( = ?auto_228120 ?auto_228121 ) ) ( not ( = ?auto_228120 ?auto_228122 ) ) ( not ( = ?auto_228121 ?auto_228122 ) ) ( ON ?auto_228120 ?auto_228121 ) ( ON ?auto_228119 ?auto_228120 ) ( CLEAR ?auto_228117 ) ( ON ?auto_228118 ?auto_228119 ) ( CLEAR ?auto_228118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_228111 ?auto_228112 ?auto_228113 ?auto_228114 ?auto_228115 ?auto_228116 ?auto_228117 ?auto_228118 )
      ( MAKE-11PILE ?auto_228111 ?auto_228112 ?auto_228113 ?auto_228114 ?auto_228115 ?auto_228116 ?auto_228117 ?auto_228118 ?auto_228119 ?auto_228120 ?auto_228121 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228134 - BLOCK
      ?auto_228135 - BLOCK
      ?auto_228136 - BLOCK
      ?auto_228137 - BLOCK
      ?auto_228138 - BLOCK
      ?auto_228139 - BLOCK
      ?auto_228140 - BLOCK
      ?auto_228141 - BLOCK
      ?auto_228142 - BLOCK
      ?auto_228143 - BLOCK
      ?auto_228144 - BLOCK
    )
    :vars
    (
      ?auto_228145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228144 ?auto_228145 ) ( ON-TABLE ?auto_228134 ) ( ON ?auto_228135 ?auto_228134 ) ( ON ?auto_228136 ?auto_228135 ) ( ON ?auto_228137 ?auto_228136 ) ( ON ?auto_228138 ?auto_228137 ) ( ON ?auto_228139 ?auto_228138 ) ( ON ?auto_228140 ?auto_228139 ) ( not ( = ?auto_228134 ?auto_228135 ) ) ( not ( = ?auto_228134 ?auto_228136 ) ) ( not ( = ?auto_228134 ?auto_228137 ) ) ( not ( = ?auto_228134 ?auto_228138 ) ) ( not ( = ?auto_228134 ?auto_228139 ) ) ( not ( = ?auto_228134 ?auto_228140 ) ) ( not ( = ?auto_228134 ?auto_228141 ) ) ( not ( = ?auto_228134 ?auto_228142 ) ) ( not ( = ?auto_228134 ?auto_228143 ) ) ( not ( = ?auto_228134 ?auto_228144 ) ) ( not ( = ?auto_228134 ?auto_228145 ) ) ( not ( = ?auto_228135 ?auto_228136 ) ) ( not ( = ?auto_228135 ?auto_228137 ) ) ( not ( = ?auto_228135 ?auto_228138 ) ) ( not ( = ?auto_228135 ?auto_228139 ) ) ( not ( = ?auto_228135 ?auto_228140 ) ) ( not ( = ?auto_228135 ?auto_228141 ) ) ( not ( = ?auto_228135 ?auto_228142 ) ) ( not ( = ?auto_228135 ?auto_228143 ) ) ( not ( = ?auto_228135 ?auto_228144 ) ) ( not ( = ?auto_228135 ?auto_228145 ) ) ( not ( = ?auto_228136 ?auto_228137 ) ) ( not ( = ?auto_228136 ?auto_228138 ) ) ( not ( = ?auto_228136 ?auto_228139 ) ) ( not ( = ?auto_228136 ?auto_228140 ) ) ( not ( = ?auto_228136 ?auto_228141 ) ) ( not ( = ?auto_228136 ?auto_228142 ) ) ( not ( = ?auto_228136 ?auto_228143 ) ) ( not ( = ?auto_228136 ?auto_228144 ) ) ( not ( = ?auto_228136 ?auto_228145 ) ) ( not ( = ?auto_228137 ?auto_228138 ) ) ( not ( = ?auto_228137 ?auto_228139 ) ) ( not ( = ?auto_228137 ?auto_228140 ) ) ( not ( = ?auto_228137 ?auto_228141 ) ) ( not ( = ?auto_228137 ?auto_228142 ) ) ( not ( = ?auto_228137 ?auto_228143 ) ) ( not ( = ?auto_228137 ?auto_228144 ) ) ( not ( = ?auto_228137 ?auto_228145 ) ) ( not ( = ?auto_228138 ?auto_228139 ) ) ( not ( = ?auto_228138 ?auto_228140 ) ) ( not ( = ?auto_228138 ?auto_228141 ) ) ( not ( = ?auto_228138 ?auto_228142 ) ) ( not ( = ?auto_228138 ?auto_228143 ) ) ( not ( = ?auto_228138 ?auto_228144 ) ) ( not ( = ?auto_228138 ?auto_228145 ) ) ( not ( = ?auto_228139 ?auto_228140 ) ) ( not ( = ?auto_228139 ?auto_228141 ) ) ( not ( = ?auto_228139 ?auto_228142 ) ) ( not ( = ?auto_228139 ?auto_228143 ) ) ( not ( = ?auto_228139 ?auto_228144 ) ) ( not ( = ?auto_228139 ?auto_228145 ) ) ( not ( = ?auto_228140 ?auto_228141 ) ) ( not ( = ?auto_228140 ?auto_228142 ) ) ( not ( = ?auto_228140 ?auto_228143 ) ) ( not ( = ?auto_228140 ?auto_228144 ) ) ( not ( = ?auto_228140 ?auto_228145 ) ) ( not ( = ?auto_228141 ?auto_228142 ) ) ( not ( = ?auto_228141 ?auto_228143 ) ) ( not ( = ?auto_228141 ?auto_228144 ) ) ( not ( = ?auto_228141 ?auto_228145 ) ) ( not ( = ?auto_228142 ?auto_228143 ) ) ( not ( = ?auto_228142 ?auto_228144 ) ) ( not ( = ?auto_228142 ?auto_228145 ) ) ( not ( = ?auto_228143 ?auto_228144 ) ) ( not ( = ?auto_228143 ?auto_228145 ) ) ( not ( = ?auto_228144 ?auto_228145 ) ) ( ON ?auto_228143 ?auto_228144 ) ( ON ?auto_228142 ?auto_228143 ) ( CLEAR ?auto_228140 ) ( ON ?auto_228141 ?auto_228142 ) ( CLEAR ?auto_228141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_228134 ?auto_228135 ?auto_228136 ?auto_228137 ?auto_228138 ?auto_228139 ?auto_228140 ?auto_228141 )
      ( MAKE-11PILE ?auto_228134 ?auto_228135 ?auto_228136 ?auto_228137 ?auto_228138 ?auto_228139 ?auto_228140 ?auto_228141 ?auto_228142 ?auto_228143 ?auto_228144 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228157 - BLOCK
      ?auto_228158 - BLOCK
      ?auto_228159 - BLOCK
      ?auto_228160 - BLOCK
      ?auto_228161 - BLOCK
      ?auto_228162 - BLOCK
      ?auto_228163 - BLOCK
      ?auto_228164 - BLOCK
      ?auto_228165 - BLOCK
      ?auto_228166 - BLOCK
      ?auto_228167 - BLOCK
    )
    :vars
    (
      ?auto_228168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228167 ?auto_228168 ) ( ON-TABLE ?auto_228157 ) ( ON ?auto_228158 ?auto_228157 ) ( ON ?auto_228159 ?auto_228158 ) ( ON ?auto_228160 ?auto_228159 ) ( ON ?auto_228161 ?auto_228160 ) ( ON ?auto_228162 ?auto_228161 ) ( not ( = ?auto_228157 ?auto_228158 ) ) ( not ( = ?auto_228157 ?auto_228159 ) ) ( not ( = ?auto_228157 ?auto_228160 ) ) ( not ( = ?auto_228157 ?auto_228161 ) ) ( not ( = ?auto_228157 ?auto_228162 ) ) ( not ( = ?auto_228157 ?auto_228163 ) ) ( not ( = ?auto_228157 ?auto_228164 ) ) ( not ( = ?auto_228157 ?auto_228165 ) ) ( not ( = ?auto_228157 ?auto_228166 ) ) ( not ( = ?auto_228157 ?auto_228167 ) ) ( not ( = ?auto_228157 ?auto_228168 ) ) ( not ( = ?auto_228158 ?auto_228159 ) ) ( not ( = ?auto_228158 ?auto_228160 ) ) ( not ( = ?auto_228158 ?auto_228161 ) ) ( not ( = ?auto_228158 ?auto_228162 ) ) ( not ( = ?auto_228158 ?auto_228163 ) ) ( not ( = ?auto_228158 ?auto_228164 ) ) ( not ( = ?auto_228158 ?auto_228165 ) ) ( not ( = ?auto_228158 ?auto_228166 ) ) ( not ( = ?auto_228158 ?auto_228167 ) ) ( not ( = ?auto_228158 ?auto_228168 ) ) ( not ( = ?auto_228159 ?auto_228160 ) ) ( not ( = ?auto_228159 ?auto_228161 ) ) ( not ( = ?auto_228159 ?auto_228162 ) ) ( not ( = ?auto_228159 ?auto_228163 ) ) ( not ( = ?auto_228159 ?auto_228164 ) ) ( not ( = ?auto_228159 ?auto_228165 ) ) ( not ( = ?auto_228159 ?auto_228166 ) ) ( not ( = ?auto_228159 ?auto_228167 ) ) ( not ( = ?auto_228159 ?auto_228168 ) ) ( not ( = ?auto_228160 ?auto_228161 ) ) ( not ( = ?auto_228160 ?auto_228162 ) ) ( not ( = ?auto_228160 ?auto_228163 ) ) ( not ( = ?auto_228160 ?auto_228164 ) ) ( not ( = ?auto_228160 ?auto_228165 ) ) ( not ( = ?auto_228160 ?auto_228166 ) ) ( not ( = ?auto_228160 ?auto_228167 ) ) ( not ( = ?auto_228160 ?auto_228168 ) ) ( not ( = ?auto_228161 ?auto_228162 ) ) ( not ( = ?auto_228161 ?auto_228163 ) ) ( not ( = ?auto_228161 ?auto_228164 ) ) ( not ( = ?auto_228161 ?auto_228165 ) ) ( not ( = ?auto_228161 ?auto_228166 ) ) ( not ( = ?auto_228161 ?auto_228167 ) ) ( not ( = ?auto_228161 ?auto_228168 ) ) ( not ( = ?auto_228162 ?auto_228163 ) ) ( not ( = ?auto_228162 ?auto_228164 ) ) ( not ( = ?auto_228162 ?auto_228165 ) ) ( not ( = ?auto_228162 ?auto_228166 ) ) ( not ( = ?auto_228162 ?auto_228167 ) ) ( not ( = ?auto_228162 ?auto_228168 ) ) ( not ( = ?auto_228163 ?auto_228164 ) ) ( not ( = ?auto_228163 ?auto_228165 ) ) ( not ( = ?auto_228163 ?auto_228166 ) ) ( not ( = ?auto_228163 ?auto_228167 ) ) ( not ( = ?auto_228163 ?auto_228168 ) ) ( not ( = ?auto_228164 ?auto_228165 ) ) ( not ( = ?auto_228164 ?auto_228166 ) ) ( not ( = ?auto_228164 ?auto_228167 ) ) ( not ( = ?auto_228164 ?auto_228168 ) ) ( not ( = ?auto_228165 ?auto_228166 ) ) ( not ( = ?auto_228165 ?auto_228167 ) ) ( not ( = ?auto_228165 ?auto_228168 ) ) ( not ( = ?auto_228166 ?auto_228167 ) ) ( not ( = ?auto_228166 ?auto_228168 ) ) ( not ( = ?auto_228167 ?auto_228168 ) ) ( ON ?auto_228166 ?auto_228167 ) ( ON ?auto_228165 ?auto_228166 ) ( ON ?auto_228164 ?auto_228165 ) ( CLEAR ?auto_228162 ) ( ON ?auto_228163 ?auto_228164 ) ( CLEAR ?auto_228163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_228157 ?auto_228158 ?auto_228159 ?auto_228160 ?auto_228161 ?auto_228162 ?auto_228163 )
      ( MAKE-11PILE ?auto_228157 ?auto_228158 ?auto_228159 ?auto_228160 ?auto_228161 ?auto_228162 ?auto_228163 ?auto_228164 ?auto_228165 ?auto_228166 ?auto_228167 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228180 - BLOCK
      ?auto_228181 - BLOCK
      ?auto_228182 - BLOCK
      ?auto_228183 - BLOCK
      ?auto_228184 - BLOCK
      ?auto_228185 - BLOCK
      ?auto_228186 - BLOCK
      ?auto_228187 - BLOCK
      ?auto_228188 - BLOCK
      ?auto_228189 - BLOCK
      ?auto_228190 - BLOCK
    )
    :vars
    (
      ?auto_228191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228190 ?auto_228191 ) ( ON-TABLE ?auto_228180 ) ( ON ?auto_228181 ?auto_228180 ) ( ON ?auto_228182 ?auto_228181 ) ( ON ?auto_228183 ?auto_228182 ) ( ON ?auto_228184 ?auto_228183 ) ( ON ?auto_228185 ?auto_228184 ) ( not ( = ?auto_228180 ?auto_228181 ) ) ( not ( = ?auto_228180 ?auto_228182 ) ) ( not ( = ?auto_228180 ?auto_228183 ) ) ( not ( = ?auto_228180 ?auto_228184 ) ) ( not ( = ?auto_228180 ?auto_228185 ) ) ( not ( = ?auto_228180 ?auto_228186 ) ) ( not ( = ?auto_228180 ?auto_228187 ) ) ( not ( = ?auto_228180 ?auto_228188 ) ) ( not ( = ?auto_228180 ?auto_228189 ) ) ( not ( = ?auto_228180 ?auto_228190 ) ) ( not ( = ?auto_228180 ?auto_228191 ) ) ( not ( = ?auto_228181 ?auto_228182 ) ) ( not ( = ?auto_228181 ?auto_228183 ) ) ( not ( = ?auto_228181 ?auto_228184 ) ) ( not ( = ?auto_228181 ?auto_228185 ) ) ( not ( = ?auto_228181 ?auto_228186 ) ) ( not ( = ?auto_228181 ?auto_228187 ) ) ( not ( = ?auto_228181 ?auto_228188 ) ) ( not ( = ?auto_228181 ?auto_228189 ) ) ( not ( = ?auto_228181 ?auto_228190 ) ) ( not ( = ?auto_228181 ?auto_228191 ) ) ( not ( = ?auto_228182 ?auto_228183 ) ) ( not ( = ?auto_228182 ?auto_228184 ) ) ( not ( = ?auto_228182 ?auto_228185 ) ) ( not ( = ?auto_228182 ?auto_228186 ) ) ( not ( = ?auto_228182 ?auto_228187 ) ) ( not ( = ?auto_228182 ?auto_228188 ) ) ( not ( = ?auto_228182 ?auto_228189 ) ) ( not ( = ?auto_228182 ?auto_228190 ) ) ( not ( = ?auto_228182 ?auto_228191 ) ) ( not ( = ?auto_228183 ?auto_228184 ) ) ( not ( = ?auto_228183 ?auto_228185 ) ) ( not ( = ?auto_228183 ?auto_228186 ) ) ( not ( = ?auto_228183 ?auto_228187 ) ) ( not ( = ?auto_228183 ?auto_228188 ) ) ( not ( = ?auto_228183 ?auto_228189 ) ) ( not ( = ?auto_228183 ?auto_228190 ) ) ( not ( = ?auto_228183 ?auto_228191 ) ) ( not ( = ?auto_228184 ?auto_228185 ) ) ( not ( = ?auto_228184 ?auto_228186 ) ) ( not ( = ?auto_228184 ?auto_228187 ) ) ( not ( = ?auto_228184 ?auto_228188 ) ) ( not ( = ?auto_228184 ?auto_228189 ) ) ( not ( = ?auto_228184 ?auto_228190 ) ) ( not ( = ?auto_228184 ?auto_228191 ) ) ( not ( = ?auto_228185 ?auto_228186 ) ) ( not ( = ?auto_228185 ?auto_228187 ) ) ( not ( = ?auto_228185 ?auto_228188 ) ) ( not ( = ?auto_228185 ?auto_228189 ) ) ( not ( = ?auto_228185 ?auto_228190 ) ) ( not ( = ?auto_228185 ?auto_228191 ) ) ( not ( = ?auto_228186 ?auto_228187 ) ) ( not ( = ?auto_228186 ?auto_228188 ) ) ( not ( = ?auto_228186 ?auto_228189 ) ) ( not ( = ?auto_228186 ?auto_228190 ) ) ( not ( = ?auto_228186 ?auto_228191 ) ) ( not ( = ?auto_228187 ?auto_228188 ) ) ( not ( = ?auto_228187 ?auto_228189 ) ) ( not ( = ?auto_228187 ?auto_228190 ) ) ( not ( = ?auto_228187 ?auto_228191 ) ) ( not ( = ?auto_228188 ?auto_228189 ) ) ( not ( = ?auto_228188 ?auto_228190 ) ) ( not ( = ?auto_228188 ?auto_228191 ) ) ( not ( = ?auto_228189 ?auto_228190 ) ) ( not ( = ?auto_228189 ?auto_228191 ) ) ( not ( = ?auto_228190 ?auto_228191 ) ) ( ON ?auto_228189 ?auto_228190 ) ( ON ?auto_228188 ?auto_228189 ) ( ON ?auto_228187 ?auto_228188 ) ( CLEAR ?auto_228185 ) ( ON ?auto_228186 ?auto_228187 ) ( CLEAR ?auto_228186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_228180 ?auto_228181 ?auto_228182 ?auto_228183 ?auto_228184 ?auto_228185 ?auto_228186 )
      ( MAKE-11PILE ?auto_228180 ?auto_228181 ?auto_228182 ?auto_228183 ?auto_228184 ?auto_228185 ?auto_228186 ?auto_228187 ?auto_228188 ?auto_228189 ?auto_228190 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228203 - BLOCK
      ?auto_228204 - BLOCK
      ?auto_228205 - BLOCK
      ?auto_228206 - BLOCK
      ?auto_228207 - BLOCK
      ?auto_228208 - BLOCK
      ?auto_228209 - BLOCK
      ?auto_228210 - BLOCK
      ?auto_228211 - BLOCK
      ?auto_228212 - BLOCK
      ?auto_228213 - BLOCK
    )
    :vars
    (
      ?auto_228214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228213 ?auto_228214 ) ( ON-TABLE ?auto_228203 ) ( ON ?auto_228204 ?auto_228203 ) ( ON ?auto_228205 ?auto_228204 ) ( ON ?auto_228206 ?auto_228205 ) ( ON ?auto_228207 ?auto_228206 ) ( not ( = ?auto_228203 ?auto_228204 ) ) ( not ( = ?auto_228203 ?auto_228205 ) ) ( not ( = ?auto_228203 ?auto_228206 ) ) ( not ( = ?auto_228203 ?auto_228207 ) ) ( not ( = ?auto_228203 ?auto_228208 ) ) ( not ( = ?auto_228203 ?auto_228209 ) ) ( not ( = ?auto_228203 ?auto_228210 ) ) ( not ( = ?auto_228203 ?auto_228211 ) ) ( not ( = ?auto_228203 ?auto_228212 ) ) ( not ( = ?auto_228203 ?auto_228213 ) ) ( not ( = ?auto_228203 ?auto_228214 ) ) ( not ( = ?auto_228204 ?auto_228205 ) ) ( not ( = ?auto_228204 ?auto_228206 ) ) ( not ( = ?auto_228204 ?auto_228207 ) ) ( not ( = ?auto_228204 ?auto_228208 ) ) ( not ( = ?auto_228204 ?auto_228209 ) ) ( not ( = ?auto_228204 ?auto_228210 ) ) ( not ( = ?auto_228204 ?auto_228211 ) ) ( not ( = ?auto_228204 ?auto_228212 ) ) ( not ( = ?auto_228204 ?auto_228213 ) ) ( not ( = ?auto_228204 ?auto_228214 ) ) ( not ( = ?auto_228205 ?auto_228206 ) ) ( not ( = ?auto_228205 ?auto_228207 ) ) ( not ( = ?auto_228205 ?auto_228208 ) ) ( not ( = ?auto_228205 ?auto_228209 ) ) ( not ( = ?auto_228205 ?auto_228210 ) ) ( not ( = ?auto_228205 ?auto_228211 ) ) ( not ( = ?auto_228205 ?auto_228212 ) ) ( not ( = ?auto_228205 ?auto_228213 ) ) ( not ( = ?auto_228205 ?auto_228214 ) ) ( not ( = ?auto_228206 ?auto_228207 ) ) ( not ( = ?auto_228206 ?auto_228208 ) ) ( not ( = ?auto_228206 ?auto_228209 ) ) ( not ( = ?auto_228206 ?auto_228210 ) ) ( not ( = ?auto_228206 ?auto_228211 ) ) ( not ( = ?auto_228206 ?auto_228212 ) ) ( not ( = ?auto_228206 ?auto_228213 ) ) ( not ( = ?auto_228206 ?auto_228214 ) ) ( not ( = ?auto_228207 ?auto_228208 ) ) ( not ( = ?auto_228207 ?auto_228209 ) ) ( not ( = ?auto_228207 ?auto_228210 ) ) ( not ( = ?auto_228207 ?auto_228211 ) ) ( not ( = ?auto_228207 ?auto_228212 ) ) ( not ( = ?auto_228207 ?auto_228213 ) ) ( not ( = ?auto_228207 ?auto_228214 ) ) ( not ( = ?auto_228208 ?auto_228209 ) ) ( not ( = ?auto_228208 ?auto_228210 ) ) ( not ( = ?auto_228208 ?auto_228211 ) ) ( not ( = ?auto_228208 ?auto_228212 ) ) ( not ( = ?auto_228208 ?auto_228213 ) ) ( not ( = ?auto_228208 ?auto_228214 ) ) ( not ( = ?auto_228209 ?auto_228210 ) ) ( not ( = ?auto_228209 ?auto_228211 ) ) ( not ( = ?auto_228209 ?auto_228212 ) ) ( not ( = ?auto_228209 ?auto_228213 ) ) ( not ( = ?auto_228209 ?auto_228214 ) ) ( not ( = ?auto_228210 ?auto_228211 ) ) ( not ( = ?auto_228210 ?auto_228212 ) ) ( not ( = ?auto_228210 ?auto_228213 ) ) ( not ( = ?auto_228210 ?auto_228214 ) ) ( not ( = ?auto_228211 ?auto_228212 ) ) ( not ( = ?auto_228211 ?auto_228213 ) ) ( not ( = ?auto_228211 ?auto_228214 ) ) ( not ( = ?auto_228212 ?auto_228213 ) ) ( not ( = ?auto_228212 ?auto_228214 ) ) ( not ( = ?auto_228213 ?auto_228214 ) ) ( ON ?auto_228212 ?auto_228213 ) ( ON ?auto_228211 ?auto_228212 ) ( ON ?auto_228210 ?auto_228211 ) ( ON ?auto_228209 ?auto_228210 ) ( CLEAR ?auto_228207 ) ( ON ?auto_228208 ?auto_228209 ) ( CLEAR ?auto_228208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_228203 ?auto_228204 ?auto_228205 ?auto_228206 ?auto_228207 ?auto_228208 )
      ( MAKE-11PILE ?auto_228203 ?auto_228204 ?auto_228205 ?auto_228206 ?auto_228207 ?auto_228208 ?auto_228209 ?auto_228210 ?auto_228211 ?auto_228212 ?auto_228213 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228226 - BLOCK
      ?auto_228227 - BLOCK
      ?auto_228228 - BLOCK
      ?auto_228229 - BLOCK
      ?auto_228230 - BLOCK
      ?auto_228231 - BLOCK
      ?auto_228232 - BLOCK
      ?auto_228233 - BLOCK
      ?auto_228234 - BLOCK
      ?auto_228235 - BLOCK
      ?auto_228236 - BLOCK
    )
    :vars
    (
      ?auto_228237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228236 ?auto_228237 ) ( ON-TABLE ?auto_228226 ) ( ON ?auto_228227 ?auto_228226 ) ( ON ?auto_228228 ?auto_228227 ) ( ON ?auto_228229 ?auto_228228 ) ( ON ?auto_228230 ?auto_228229 ) ( not ( = ?auto_228226 ?auto_228227 ) ) ( not ( = ?auto_228226 ?auto_228228 ) ) ( not ( = ?auto_228226 ?auto_228229 ) ) ( not ( = ?auto_228226 ?auto_228230 ) ) ( not ( = ?auto_228226 ?auto_228231 ) ) ( not ( = ?auto_228226 ?auto_228232 ) ) ( not ( = ?auto_228226 ?auto_228233 ) ) ( not ( = ?auto_228226 ?auto_228234 ) ) ( not ( = ?auto_228226 ?auto_228235 ) ) ( not ( = ?auto_228226 ?auto_228236 ) ) ( not ( = ?auto_228226 ?auto_228237 ) ) ( not ( = ?auto_228227 ?auto_228228 ) ) ( not ( = ?auto_228227 ?auto_228229 ) ) ( not ( = ?auto_228227 ?auto_228230 ) ) ( not ( = ?auto_228227 ?auto_228231 ) ) ( not ( = ?auto_228227 ?auto_228232 ) ) ( not ( = ?auto_228227 ?auto_228233 ) ) ( not ( = ?auto_228227 ?auto_228234 ) ) ( not ( = ?auto_228227 ?auto_228235 ) ) ( not ( = ?auto_228227 ?auto_228236 ) ) ( not ( = ?auto_228227 ?auto_228237 ) ) ( not ( = ?auto_228228 ?auto_228229 ) ) ( not ( = ?auto_228228 ?auto_228230 ) ) ( not ( = ?auto_228228 ?auto_228231 ) ) ( not ( = ?auto_228228 ?auto_228232 ) ) ( not ( = ?auto_228228 ?auto_228233 ) ) ( not ( = ?auto_228228 ?auto_228234 ) ) ( not ( = ?auto_228228 ?auto_228235 ) ) ( not ( = ?auto_228228 ?auto_228236 ) ) ( not ( = ?auto_228228 ?auto_228237 ) ) ( not ( = ?auto_228229 ?auto_228230 ) ) ( not ( = ?auto_228229 ?auto_228231 ) ) ( not ( = ?auto_228229 ?auto_228232 ) ) ( not ( = ?auto_228229 ?auto_228233 ) ) ( not ( = ?auto_228229 ?auto_228234 ) ) ( not ( = ?auto_228229 ?auto_228235 ) ) ( not ( = ?auto_228229 ?auto_228236 ) ) ( not ( = ?auto_228229 ?auto_228237 ) ) ( not ( = ?auto_228230 ?auto_228231 ) ) ( not ( = ?auto_228230 ?auto_228232 ) ) ( not ( = ?auto_228230 ?auto_228233 ) ) ( not ( = ?auto_228230 ?auto_228234 ) ) ( not ( = ?auto_228230 ?auto_228235 ) ) ( not ( = ?auto_228230 ?auto_228236 ) ) ( not ( = ?auto_228230 ?auto_228237 ) ) ( not ( = ?auto_228231 ?auto_228232 ) ) ( not ( = ?auto_228231 ?auto_228233 ) ) ( not ( = ?auto_228231 ?auto_228234 ) ) ( not ( = ?auto_228231 ?auto_228235 ) ) ( not ( = ?auto_228231 ?auto_228236 ) ) ( not ( = ?auto_228231 ?auto_228237 ) ) ( not ( = ?auto_228232 ?auto_228233 ) ) ( not ( = ?auto_228232 ?auto_228234 ) ) ( not ( = ?auto_228232 ?auto_228235 ) ) ( not ( = ?auto_228232 ?auto_228236 ) ) ( not ( = ?auto_228232 ?auto_228237 ) ) ( not ( = ?auto_228233 ?auto_228234 ) ) ( not ( = ?auto_228233 ?auto_228235 ) ) ( not ( = ?auto_228233 ?auto_228236 ) ) ( not ( = ?auto_228233 ?auto_228237 ) ) ( not ( = ?auto_228234 ?auto_228235 ) ) ( not ( = ?auto_228234 ?auto_228236 ) ) ( not ( = ?auto_228234 ?auto_228237 ) ) ( not ( = ?auto_228235 ?auto_228236 ) ) ( not ( = ?auto_228235 ?auto_228237 ) ) ( not ( = ?auto_228236 ?auto_228237 ) ) ( ON ?auto_228235 ?auto_228236 ) ( ON ?auto_228234 ?auto_228235 ) ( ON ?auto_228233 ?auto_228234 ) ( ON ?auto_228232 ?auto_228233 ) ( CLEAR ?auto_228230 ) ( ON ?auto_228231 ?auto_228232 ) ( CLEAR ?auto_228231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_228226 ?auto_228227 ?auto_228228 ?auto_228229 ?auto_228230 ?auto_228231 )
      ( MAKE-11PILE ?auto_228226 ?auto_228227 ?auto_228228 ?auto_228229 ?auto_228230 ?auto_228231 ?auto_228232 ?auto_228233 ?auto_228234 ?auto_228235 ?auto_228236 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228249 - BLOCK
      ?auto_228250 - BLOCK
      ?auto_228251 - BLOCK
      ?auto_228252 - BLOCK
      ?auto_228253 - BLOCK
      ?auto_228254 - BLOCK
      ?auto_228255 - BLOCK
      ?auto_228256 - BLOCK
      ?auto_228257 - BLOCK
      ?auto_228258 - BLOCK
      ?auto_228259 - BLOCK
    )
    :vars
    (
      ?auto_228260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228259 ?auto_228260 ) ( ON-TABLE ?auto_228249 ) ( ON ?auto_228250 ?auto_228249 ) ( ON ?auto_228251 ?auto_228250 ) ( ON ?auto_228252 ?auto_228251 ) ( not ( = ?auto_228249 ?auto_228250 ) ) ( not ( = ?auto_228249 ?auto_228251 ) ) ( not ( = ?auto_228249 ?auto_228252 ) ) ( not ( = ?auto_228249 ?auto_228253 ) ) ( not ( = ?auto_228249 ?auto_228254 ) ) ( not ( = ?auto_228249 ?auto_228255 ) ) ( not ( = ?auto_228249 ?auto_228256 ) ) ( not ( = ?auto_228249 ?auto_228257 ) ) ( not ( = ?auto_228249 ?auto_228258 ) ) ( not ( = ?auto_228249 ?auto_228259 ) ) ( not ( = ?auto_228249 ?auto_228260 ) ) ( not ( = ?auto_228250 ?auto_228251 ) ) ( not ( = ?auto_228250 ?auto_228252 ) ) ( not ( = ?auto_228250 ?auto_228253 ) ) ( not ( = ?auto_228250 ?auto_228254 ) ) ( not ( = ?auto_228250 ?auto_228255 ) ) ( not ( = ?auto_228250 ?auto_228256 ) ) ( not ( = ?auto_228250 ?auto_228257 ) ) ( not ( = ?auto_228250 ?auto_228258 ) ) ( not ( = ?auto_228250 ?auto_228259 ) ) ( not ( = ?auto_228250 ?auto_228260 ) ) ( not ( = ?auto_228251 ?auto_228252 ) ) ( not ( = ?auto_228251 ?auto_228253 ) ) ( not ( = ?auto_228251 ?auto_228254 ) ) ( not ( = ?auto_228251 ?auto_228255 ) ) ( not ( = ?auto_228251 ?auto_228256 ) ) ( not ( = ?auto_228251 ?auto_228257 ) ) ( not ( = ?auto_228251 ?auto_228258 ) ) ( not ( = ?auto_228251 ?auto_228259 ) ) ( not ( = ?auto_228251 ?auto_228260 ) ) ( not ( = ?auto_228252 ?auto_228253 ) ) ( not ( = ?auto_228252 ?auto_228254 ) ) ( not ( = ?auto_228252 ?auto_228255 ) ) ( not ( = ?auto_228252 ?auto_228256 ) ) ( not ( = ?auto_228252 ?auto_228257 ) ) ( not ( = ?auto_228252 ?auto_228258 ) ) ( not ( = ?auto_228252 ?auto_228259 ) ) ( not ( = ?auto_228252 ?auto_228260 ) ) ( not ( = ?auto_228253 ?auto_228254 ) ) ( not ( = ?auto_228253 ?auto_228255 ) ) ( not ( = ?auto_228253 ?auto_228256 ) ) ( not ( = ?auto_228253 ?auto_228257 ) ) ( not ( = ?auto_228253 ?auto_228258 ) ) ( not ( = ?auto_228253 ?auto_228259 ) ) ( not ( = ?auto_228253 ?auto_228260 ) ) ( not ( = ?auto_228254 ?auto_228255 ) ) ( not ( = ?auto_228254 ?auto_228256 ) ) ( not ( = ?auto_228254 ?auto_228257 ) ) ( not ( = ?auto_228254 ?auto_228258 ) ) ( not ( = ?auto_228254 ?auto_228259 ) ) ( not ( = ?auto_228254 ?auto_228260 ) ) ( not ( = ?auto_228255 ?auto_228256 ) ) ( not ( = ?auto_228255 ?auto_228257 ) ) ( not ( = ?auto_228255 ?auto_228258 ) ) ( not ( = ?auto_228255 ?auto_228259 ) ) ( not ( = ?auto_228255 ?auto_228260 ) ) ( not ( = ?auto_228256 ?auto_228257 ) ) ( not ( = ?auto_228256 ?auto_228258 ) ) ( not ( = ?auto_228256 ?auto_228259 ) ) ( not ( = ?auto_228256 ?auto_228260 ) ) ( not ( = ?auto_228257 ?auto_228258 ) ) ( not ( = ?auto_228257 ?auto_228259 ) ) ( not ( = ?auto_228257 ?auto_228260 ) ) ( not ( = ?auto_228258 ?auto_228259 ) ) ( not ( = ?auto_228258 ?auto_228260 ) ) ( not ( = ?auto_228259 ?auto_228260 ) ) ( ON ?auto_228258 ?auto_228259 ) ( ON ?auto_228257 ?auto_228258 ) ( ON ?auto_228256 ?auto_228257 ) ( ON ?auto_228255 ?auto_228256 ) ( ON ?auto_228254 ?auto_228255 ) ( CLEAR ?auto_228252 ) ( ON ?auto_228253 ?auto_228254 ) ( CLEAR ?auto_228253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_228249 ?auto_228250 ?auto_228251 ?auto_228252 ?auto_228253 )
      ( MAKE-11PILE ?auto_228249 ?auto_228250 ?auto_228251 ?auto_228252 ?auto_228253 ?auto_228254 ?auto_228255 ?auto_228256 ?auto_228257 ?auto_228258 ?auto_228259 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228272 - BLOCK
      ?auto_228273 - BLOCK
      ?auto_228274 - BLOCK
      ?auto_228275 - BLOCK
      ?auto_228276 - BLOCK
      ?auto_228277 - BLOCK
      ?auto_228278 - BLOCK
      ?auto_228279 - BLOCK
      ?auto_228280 - BLOCK
      ?auto_228281 - BLOCK
      ?auto_228282 - BLOCK
    )
    :vars
    (
      ?auto_228283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228282 ?auto_228283 ) ( ON-TABLE ?auto_228272 ) ( ON ?auto_228273 ?auto_228272 ) ( ON ?auto_228274 ?auto_228273 ) ( ON ?auto_228275 ?auto_228274 ) ( not ( = ?auto_228272 ?auto_228273 ) ) ( not ( = ?auto_228272 ?auto_228274 ) ) ( not ( = ?auto_228272 ?auto_228275 ) ) ( not ( = ?auto_228272 ?auto_228276 ) ) ( not ( = ?auto_228272 ?auto_228277 ) ) ( not ( = ?auto_228272 ?auto_228278 ) ) ( not ( = ?auto_228272 ?auto_228279 ) ) ( not ( = ?auto_228272 ?auto_228280 ) ) ( not ( = ?auto_228272 ?auto_228281 ) ) ( not ( = ?auto_228272 ?auto_228282 ) ) ( not ( = ?auto_228272 ?auto_228283 ) ) ( not ( = ?auto_228273 ?auto_228274 ) ) ( not ( = ?auto_228273 ?auto_228275 ) ) ( not ( = ?auto_228273 ?auto_228276 ) ) ( not ( = ?auto_228273 ?auto_228277 ) ) ( not ( = ?auto_228273 ?auto_228278 ) ) ( not ( = ?auto_228273 ?auto_228279 ) ) ( not ( = ?auto_228273 ?auto_228280 ) ) ( not ( = ?auto_228273 ?auto_228281 ) ) ( not ( = ?auto_228273 ?auto_228282 ) ) ( not ( = ?auto_228273 ?auto_228283 ) ) ( not ( = ?auto_228274 ?auto_228275 ) ) ( not ( = ?auto_228274 ?auto_228276 ) ) ( not ( = ?auto_228274 ?auto_228277 ) ) ( not ( = ?auto_228274 ?auto_228278 ) ) ( not ( = ?auto_228274 ?auto_228279 ) ) ( not ( = ?auto_228274 ?auto_228280 ) ) ( not ( = ?auto_228274 ?auto_228281 ) ) ( not ( = ?auto_228274 ?auto_228282 ) ) ( not ( = ?auto_228274 ?auto_228283 ) ) ( not ( = ?auto_228275 ?auto_228276 ) ) ( not ( = ?auto_228275 ?auto_228277 ) ) ( not ( = ?auto_228275 ?auto_228278 ) ) ( not ( = ?auto_228275 ?auto_228279 ) ) ( not ( = ?auto_228275 ?auto_228280 ) ) ( not ( = ?auto_228275 ?auto_228281 ) ) ( not ( = ?auto_228275 ?auto_228282 ) ) ( not ( = ?auto_228275 ?auto_228283 ) ) ( not ( = ?auto_228276 ?auto_228277 ) ) ( not ( = ?auto_228276 ?auto_228278 ) ) ( not ( = ?auto_228276 ?auto_228279 ) ) ( not ( = ?auto_228276 ?auto_228280 ) ) ( not ( = ?auto_228276 ?auto_228281 ) ) ( not ( = ?auto_228276 ?auto_228282 ) ) ( not ( = ?auto_228276 ?auto_228283 ) ) ( not ( = ?auto_228277 ?auto_228278 ) ) ( not ( = ?auto_228277 ?auto_228279 ) ) ( not ( = ?auto_228277 ?auto_228280 ) ) ( not ( = ?auto_228277 ?auto_228281 ) ) ( not ( = ?auto_228277 ?auto_228282 ) ) ( not ( = ?auto_228277 ?auto_228283 ) ) ( not ( = ?auto_228278 ?auto_228279 ) ) ( not ( = ?auto_228278 ?auto_228280 ) ) ( not ( = ?auto_228278 ?auto_228281 ) ) ( not ( = ?auto_228278 ?auto_228282 ) ) ( not ( = ?auto_228278 ?auto_228283 ) ) ( not ( = ?auto_228279 ?auto_228280 ) ) ( not ( = ?auto_228279 ?auto_228281 ) ) ( not ( = ?auto_228279 ?auto_228282 ) ) ( not ( = ?auto_228279 ?auto_228283 ) ) ( not ( = ?auto_228280 ?auto_228281 ) ) ( not ( = ?auto_228280 ?auto_228282 ) ) ( not ( = ?auto_228280 ?auto_228283 ) ) ( not ( = ?auto_228281 ?auto_228282 ) ) ( not ( = ?auto_228281 ?auto_228283 ) ) ( not ( = ?auto_228282 ?auto_228283 ) ) ( ON ?auto_228281 ?auto_228282 ) ( ON ?auto_228280 ?auto_228281 ) ( ON ?auto_228279 ?auto_228280 ) ( ON ?auto_228278 ?auto_228279 ) ( ON ?auto_228277 ?auto_228278 ) ( CLEAR ?auto_228275 ) ( ON ?auto_228276 ?auto_228277 ) ( CLEAR ?auto_228276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_228272 ?auto_228273 ?auto_228274 ?auto_228275 ?auto_228276 )
      ( MAKE-11PILE ?auto_228272 ?auto_228273 ?auto_228274 ?auto_228275 ?auto_228276 ?auto_228277 ?auto_228278 ?auto_228279 ?auto_228280 ?auto_228281 ?auto_228282 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228295 - BLOCK
      ?auto_228296 - BLOCK
      ?auto_228297 - BLOCK
      ?auto_228298 - BLOCK
      ?auto_228299 - BLOCK
      ?auto_228300 - BLOCK
      ?auto_228301 - BLOCK
      ?auto_228302 - BLOCK
      ?auto_228303 - BLOCK
      ?auto_228304 - BLOCK
      ?auto_228305 - BLOCK
    )
    :vars
    (
      ?auto_228306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228305 ?auto_228306 ) ( ON-TABLE ?auto_228295 ) ( ON ?auto_228296 ?auto_228295 ) ( ON ?auto_228297 ?auto_228296 ) ( not ( = ?auto_228295 ?auto_228296 ) ) ( not ( = ?auto_228295 ?auto_228297 ) ) ( not ( = ?auto_228295 ?auto_228298 ) ) ( not ( = ?auto_228295 ?auto_228299 ) ) ( not ( = ?auto_228295 ?auto_228300 ) ) ( not ( = ?auto_228295 ?auto_228301 ) ) ( not ( = ?auto_228295 ?auto_228302 ) ) ( not ( = ?auto_228295 ?auto_228303 ) ) ( not ( = ?auto_228295 ?auto_228304 ) ) ( not ( = ?auto_228295 ?auto_228305 ) ) ( not ( = ?auto_228295 ?auto_228306 ) ) ( not ( = ?auto_228296 ?auto_228297 ) ) ( not ( = ?auto_228296 ?auto_228298 ) ) ( not ( = ?auto_228296 ?auto_228299 ) ) ( not ( = ?auto_228296 ?auto_228300 ) ) ( not ( = ?auto_228296 ?auto_228301 ) ) ( not ( = ?auto_228296 ?auto_228302 ) ) ( not ( = ?auto_228296 ?auto_228303 ) ) ( not ( = ?auto_228296 ?auto_228304 ) ) ( not ( = ?auto_228296 ?auto_228305 ) ) ( not ( = ?auto_228296 ?auto_228306 ) ) ( not ( = ?auto_228297 ?auto_228298 ) ) ( not ( = ?auto_228297 ?auto_228299 ) ) ( not ( = ?auto_228297 ?auto_228300 ) ) ( not ( = ?auto_228297 ?auto_228301 ) ) ( not ( = ?auto_228297 ?auto_228302 ) ) ( not ( = ?auto_228297 ?auto_228303 ) ) ( not ( = ?auto_228297 ?auto_228304 ) ) ( not ( = ?auto_228297 ?auto_228305 ) ) ( not ( = ?auto_228297 ?auto_228306 ) ) ( not ( = ?auto_228298 ?auto_228299 ) ) ( not ( = ?auto_228298 ?auto_228300 ) ) ( not ( = ?auto_228298 ?auto_228301 ) ) ( not ( = ?auto_228298 ?auto_228302 ) ) ( not ( = ?auto_228298 ?auto_228303 ) ) ( not ( = ?auto_228298 ?auto_228304 ) ) ( not ( = ?auto_228298 ?auto_228305 ) ) ( not ( = ?auto_228298 ?auto_228306 ) ) ( not ( = ?auto_228299 ?auto_228300 ) ) ( not ( = ?auto_228299 ?auto_228301 ) ) ( not ( = ?auto_228299 ?auto_228302 ) ) ( not ( = ?auto_228299 ?auto_228303 ) ) ( not ( = ?auto_228299 ?auto_228304 ) ) ( not ( = ?auto_228299 ?auto_228305 ) ) ( not ( = ?auto_228299 ?auto_228306 ) ) ( not ( = ?auto_228300 ?auto_228301 ) ) ( not ( = ?auto_228300 ?auto_228302 ) ) ( not ( = ?auto_228300 ?auto_228303 ) ) ( not ( = ?auto_228300 ?auto_228304 ) ) ( not ( = ?auto_228300 ?auto_228305 ) ) ( not ( = ?auto_228300 ?auto_228306 ) ) ( not ( = ?auto_228301 ?auto_228302 ) ) ( not ( = ?auto_228301 ?auto_228303 ) ) ( not ( = ?auto_228301 ?auto_228304 ) ) ( not ( = ?auto_228301 ?auto_228305 ) ) ( not ( = ?auto_228301 ?auto_228306 ) ) ( not ( = ?auto_228302 ?auto_228303 ) ) ( not ( = ?auto_228302 ?auto_228304 ) ) ( not ( = ?auto_228302 ?auto_228305 ) ) ( not ( = ?auto_228302 ?auto_228306 ) ) ( not ( = ?auto_228303 ?auto_228304 ) ) ( not ( = ?auto_228303 ?auto_228305 ) ) ( not ( = ?auto_228303 ?auto_228306 ) ) ( not ( = ?auto_228304 ?auto_228305 ) ) ( not ( = ?auto_228304 ?auto_228306 ) ) ( not ( = ?auto_228305 ?auto_228306 ) ) ( ON ?auto_228304 ?auto_228305 ) ( ON ?auto_228303 ?auto_228304 ) ( ON ?auto_228302 ?auto_228303 ) ( ON ?auto_228301 ?auto_228302 ) ( ON ?auto_228300 ?auto_228301 ) ( ON ?auto_228299 ?auto_228300 ) ( CLEAR ?auto_228297 ) ( ON ?auto_228298 ?auto_228299 ) ( CLEAR ?auto_228298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_228295 ?auto_228296 ?auto_228297 ?auto_228298 )
      ( MAKE-11PILE ?auto_228295 ?auto_228296 ?auto_228297 ?auto_228298 ?auto_228299 ?auto_228300 ?auto_228301 ?auto_228302 ?auto_228303 ?auto_228304 ?auto_228305 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228318 - BLOCK
      ?auto_228319 - BLOCK
      ?auto_228320 - BLOCK
      ?auto_228321 - BLOCK
      ?auto_228322 - BLOCK
      ?auto_228323 - BLOCK
      ?auto_228324 - BLOCK
      ?auto_228325 - BLOCK
      ?auto_228326 - BLOCK
      ?auto_228327 - BLOCK
      ?auto_228328 - BLOCK
    )
    :vars
    (
      ?auto_228329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228328 ?auto_228329 ) ( ON-TABLE ?auto_228318 ) ( ON ?auto_228319 ?auto_228318 ) ( ON ?auto_228320 ?auto_228319 ) ( not ( = ?auto_228318 ?auto_228319 ) ) ( not ( = ?auto_228318 ?auto_228320 ) ) ( not ( = ?auto_228318 ?auto_228321 ) ) ( not ( = ?auto_228318 ?auto_228322 ) ) ( not ( = ?auto_228318 ?auto_228323 ) ) ( not ( = ?auto_228318 ?auto_228324 ) ) ( not ( = ?auto_228318 ?auto_228325 ) ) ( not ( = ?auto_228318 ?auto_228326 ) ) ( not ( = ?auto_228318 ?auto_228327 ) ) ( not ( = ?auto_228318 ?auto_228328 ) ) ( not ( = ?auto_228318 ?auto_228329 ) ) ( not ( = ?auto_228319 ?auto_228320 ) ) ( not ( = ?auto_228319 ?auto_228321 ) ) ( not ( = ?auto_228319 ?auto_228322 ) ) ( not ( = ?auto_228319 ?auto_228323 ) ) ( not ( = ?auto_228319 ?auto_228324 ) ) ( not ( = ?auto_228319 ?auto_228325 ) ) ( not ( = ?auto_228319 ?auto_228326 ) ) ( not ( = ?auto_228319 ?auto_228327 ) ) ( not ( = ?auto_228319 ?auto_228328 ) ) ( not ( = ?auto_228319 ?auto_228329 ) ) ( not ( = ?auto_228320 ?auto_228321 ) ) ( not ( = ?auto_228320 ?auto_228322 ) ) ( not ( = ?auto_228320 ?auto_228323 ) ) ( not ( = ?auto_228320 ?auto_228324 ) ) ( not ( = ?auto_228320 ?auto_228325 ) ) ( not ( = ?auto_228320 ?auto_228326 ) ) ( not ( = ?auto_228320 ?auto_228327 ) ) ( not ( = ?auto_228320 ?auto_228328 ) ) ( not ( = ?auto_228320 ?auto_228329 ) ) ( not ( = ?auto_228321 ?auto_228322 ) ) ( not ( = ?auto_228321 ?auto_228323 ) ) ( not ( = ?auto_228321 ?auto_228324 ) ) ( not ( = ?auto_228321 ?auto_228325 ) ) ( not ( = ?auto_228321 ?auto_228326 ) ) ( not ( = ?auto_228321 ?auto_228327 ) ) ( not ( = ?auto_228321 ?auto_228328 ) ) ( not ( = ?auto_228321 ?auto_228329 ) ) ( not ( = ?auto_228322 ?auto_228323 ) ) ( not ( = ?auto_228322 ?auto_228324 ) ) ( not ( = ?auto_228322 ?auto_228325 ) ) ( not ( = ?auto_228322 ?auto_228326 ) ) ( not ( = ?auto_228322 ?auto_228327 ) ) ( not ( = ?auto_228322 ?auto_228328 ) ) ( not ( = ?auto_228322 ?auto_228329 ) ) ( not ( = ?auto_228323 ?auto_228324 ) ) ( not ( = ?auto_228323 ?auto_228325 ) ) ( not ( = ?auto_228323 ?auto_228326 ) ) ( not ( = ?auto_228323 ?auto_228327 ) ) ( not ( = ?auto_228323 ?auto_228328 ) ) ( not ( = ?auto_228323 ?auto_228329 ) ) ( not ( = ?auto_228324 ?auto_228325 ) ) ( not ( = ?auto_228324 ?auto_228326 ) ) ( not ( = ?auto_228324 ?auto_228327 ) ) ( not ( = ?auto_228324 ?auto_228328 ) ) ( not ( = ?auto_228324 ?auto_228329 ) ) ( not ( = ?auto_228325 ?auto_228326 ) ) ( not ( = ?auto_228325 ?auto_228327 ) ) ( not ( = ?auto_228325 ?auto_228328 ) ) ( not ( = ?auto_228325 ?auto_228329 ) ) ( not ( = ?auto_228326 ?auto_228327 ) ) ( not ( = ?auto_228326 ?auto_228328 ) ) ( not ( = ?auto_228326 ?auto_228329 ) ) ( not ( = ?auto_228327 ?auto_228328 ) ) ( not ( = ?auto_228327 ?auto_228329 ) ) ( not ( = ?auto_228328 ?auto_228329 ) ) ( ON ?auto_228327 ?auto_228328 ) ( ON ?auto_228326 ?auto_228327 ) ( ON ?auto_228325 ?auto_228326 ) ( ON ?auto_228324 ?auto_228325 ) ( ON ?auto_228323 ?auto_228324 ) ( ON ?auto_228322 ?auto_228323 ) ( CLEAR ?auto_228320 ) ( ON ?auto_228321 ?auto_228322 ) ( CLEAR ?auto_228321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_228318 ?auto_228319 ?auto_228320 ?auto_228321 )
      ( MAKE-11PILE ?auto_228318 ?auto_228319 ?auto_228320 ?auto_228321 ?auto_228322 ?auto_228323 ?auto_228324 ?auto_228325 ?auto_228326 ?auto_228327 ?auto_228328 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228341 - BLOCK
      ?auto_228342 - BLOCK
      ?auto_228343 - BLOCK
      ?auto_228344 - BLOCK
      ?auto_228345 - BLOCK
      ?auto_228346 - BLOCK
      ?auto_228347 - BLOCK
      ?auto_228348 - BLOCK
      ?auto_228349 - BLOCK
      ?auto_228350 - BLOCK
      ?auto_228351 - BLOCK
    )
    :vars
    (
      ?auto_228352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228351 ?auto_228352 ) ( ON-TABLE ?auto_228341 ) ( ON ?auto_228342 ?auto_228341 ) ( not ( = ?auto_228341 ?auto_228342 ) ) ( not ( = ?auto_228341 ?auto_228343 ) ) ( not ( = ?auto_228341 ?auto_228344 ) ) ( not ( = ?auto_228341 ?auto_228345 ) ) ( not ( = ?auto_228341 ?auto_228346 ) ) ( not ( = ?auto_228341 ?auto_228347 ) ) ( not ( = ?auto_228341 ?auto_228348 ) ) ( not ( = ?auto_228341 ?auto_228349 ) ) ( not ( = ?auto_228341 ?auto_228350 ) ) ( not ( = ?auto_228341 ?auto_228351 ) ) ( not ( = ?auto_228341 ?auto_228352 ) ) ( not ( = ?auto_228342 ?auto_228343 ) ) ( not ( = ?auto_228342 ?auto_228344 ) ) ( not ( = ?auto_228342 ?auto_228345 ) ) ( not ( = ?auto_228342 ?auto_228346 ) ) ( not ( = ?auto_228342 ?auto_228347 ) ) ( not ( = ?auto_228342 ?auto_228348 ) ) ( not ( = ?auto_228342 ?auto_228349 ) ) ( not ( = ?auto_228342 ?auto_228350 ) ) ( not ( = ?auto_228342 ?auto_228351 ) ) ( not ( = ?auto_228342 ?auto_228352 ) ) ( not ( = ?auto_228343 ?auto_228344 ) ) ( not ( = ?auto_228343 ?auto_228345 ) ) ( not ( = ?auto_228343 ?auto_228346 ) ) ( not ( = ?auto_228343 ?auto_228347 ) ) ( not ( = ?auto_228343 ?auto_228348 ) ) ( not ( = ?auto_228343 ?auto_228349 ) ) ( not ( = ?auto_228343 ?auto_228350 ) ) ( not ( = ?auto_228343 ?auto_228351 ) ) ( not ( = ?auto_228343 ?auto_228352 ) ) ( not ( = ?auto_228344 ?auto_228345 ) ) ( not ( = ?auto_228344 ?auto_228346 ) ) ( not ( = ?auto_228344 ?auto_228347 ) ) ( not ( = ?auto_228344 ?auto_228348 ) ) ( not ( = ?auto_228344 ?auto_228349 ) ) ( not ( = ?auto_228344 ?auto_228350 ) ) ( not ( = ?auto_228344 ?auto_228351 ) ) ( not ( = ?auto_228344 ?auto_228352 ) ) ( not ( = ?auto_228345 ?auto_228346 ) ) ( not ( = ?auto_228345 ?auto_228347 ) ) ( not ( = ?auto_228345 ?auto_228348 ) ) ( not ( = ?auto_228345 ?auto_228349 ) ) ( not ( = ?auto_228345 ?auto_228350 ) ) ( not ( = ?auto_228345 ?auto_228351 ) ) ( not ( = ?auto_228345 ?auto_228352 ) ) ( not ( = ?auto_228346 ?auto_228347 ) ) ( not ( = ?auto_228346 ?auto_228348 ) ) ( not ( = ?auto_228346 ?auto_228349 ) ) ( not ( = ?auto_228346 ?auto_228350 ) ) ( not ( = ?auto_228346 ?auto_228351 ) ) ( not ( = ?auto_228346 ?auto_228352 ) ) ( not ( = ?auto_228347 ?auto_228348 ) ) ( not ( = ?auto_228347 ?auto_228349 ) ) ( not ( = ?auto_228347 ?auto_228350 ) ) ( not ( = ?auto_228347 ?auto_228351 ) ) ( not ( = ?auto_228347 ?auto_228352 ) ) ( not ( = ?auto_228348 ?auto_228349 ) ) ( not ( = ?auto_228348 ?auto_228350 ) ) ( not ( = ?auto_228348 ?auto_228351 ) ) ( not ( = ?auto_228348 ?auto_228352 ) ) ( not ( = ?auto_228349 ?auto_228350 ) ) ( not ( = ?auto_228349 ?auto_228351 ) ) ( not ( = ?auto_228349 ?auto_228352 ) ) ( not ( = ?auto_228350 ?auto_228351 ) ) ( not ( = ?auto_228350 ?auto_228352 ) ) ( not ( = ?auto_228351 ?auto_228352 ) ) ( ON ?auto_228350 ?auto_228351 ) ( ON ?auto_228349 ?auto_228350 ) ( ON ?auto_228348 ?auto_228349 ) ( ON ?auto_228347 ?auto_228348 ) ( ON ?auto_228346 ?auto_228347 ) ( ON ?auto_228345 ?auto_228346 ) ( ON ?auto_228344 ?auto_228345 ) ( CLEAR ?auto_228342 ) ( ON ?auto_228343 ?auto_228344 ) ( CLEAR ?auto_228343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_228341 ?auto_228342 ?auto_228343 )
      ( MAKE-11PILE ?auto_228341 ?auto_228342 ?auto_228343 ?auto_228344 ?auto_228345 ?auto_228346 ?auto_228347 ?auto_228348 ?auto_228349 ?auto_228350 ?auto_228351 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228364 - BLOCK
      ?auto_228365 - BLOCK
      ?auto_228366 - BLOCK
      ?auto_228367 - BLOCK
      ?auto_228368 - BLOCK
      ?auto_228369 - BLOCK
      ?auto_228370 - BLOCK
      ?auto_228371 - BLOCK
      ?auto_228372 - BLOCK
      ?auto_228373 - BLOCK
      ?auto_228374 - BLOCK
    )
    :vars
    (
      ?auto_228375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228374 ?auto_228375 ) ( ON-TABLE ?auto_228364 ) ( ON ?auto_228365 ?auto_228364 ) ( not ( = ?auto_228364 ?auto_228365 ) ) ( not ( = ?auto_228364 ?auto_228366 ) ) ( not ( = ?auto_228364 ?auto_228367 ) ) ( not ( = ?auto_228364 ?auto_228368 ) ) ( not ( = ?auto_228364 ?auto_228369 ) ) ( not ( = ?auto_228364 ?auto_228370 ) ) ( not ( = ?auto_228364 ?auto_228371 ) ) ( not ( = ?auto_228364 ?auto_228372 ) ) ( not ( = ?auto_228364 ?auto_228373 ) ) ( not ( = ?auto_228364 ?auto_228374 ) ) ( not ( = ?auto_228364 ?auto_228375 ) ) ( not ( = ?auto_228365 ?auto_228366 ) ) ( not ( = ?auto_228365 ?auto_228367 ) ) ( not ( = ?auto_228365 ?auto_228368 ) ) ( not ( = ?auto_228365 ?auto_228369 ) ) ( not ( = ?auto_228365 ?auto_228370 ) ) ( not ( = ?auto_228365 ?auto_228371 ) ) ( not ( = ?auto_228365 ?auto_228372 ) ) ( not ( = ?auto_228365 ?auto_228373 ) ) ( not ( = ?auto_228365 ?auto_228374 ) ) ( not ( = ?auto_228365 ?auto_228375 ) ) ( not ( = ?auto_228366 ?auto_228367 ) ) ( not ( = ?auto_228366 ?auto_228368 ) ) ( not ( = ?auto_228366 ?auto_228369 ) ) ( not ( = ?auto_228366 ?auto_228370 ) ) ( not ( = ?auto_228366 ?auto_228371 ) ) ( not ( = ?auto_228366 ?auto_228372 ) ) ( not ( = ?auto_228366 ?auto_228373 ) ) ( not ( = ?auto_228366 ?auto_228374 ) ) ( not ( = ?auto_228366 ?auto_228375 ) ) ( not ( = ?auto_228367 ?auto_228368 ) ) ( not ( = ?auto_228367 ?auto_228369 ) ) ( not ( = ?auto_228367 ?auto_228370 ) ) ( not ( = ?auto_228367 ?auto_228371 ) ) ( not ( = ?auto_228367 ?auto_228372 ) ) ( not ( = ?auto_228367 ?auto_228373 ) ) ( not ( = ?auto_228367 ?auto_228374 ) ) ( not ( = ?auto_228367 ?auto_228375 ) ) ( not ( = ?auto_228368 ?auto_228369 ) ) ( not ( = ?auto_228368 ?auto_228370 ) ) ( not ( = ?auto_228368 ?auto_228371 ) ) ( not ( = ?auto_228368 ?auto_228372 ) ) ( not ( = ?auto_228368 ?auto_228373 ) ) ( not ( = ?auto_228368 ?auto_228374 ) ) ( not ( = ?auto_228368 ?auto_228375 ) ) ( not ( = ?auto_228369 ?auto_228370 ) ) ( not ( = ?auto_228369 ?auto_228371 ) ) ( not ( = ?auto_228369 ?auto_228372 ) ) ( not ( = ?auto_228369 ?auto_228373 ) ) ( not ( = ?auto_228369 ?auto_228374 ) ) ( not ( = ?auto_228369 ?auto_228375 ) ) ( not ( = ?auto_228370 ?auto_228371 ) ) ( not ( = ?auto_228370 ?auto_228372 ) ) ( not ( = ?auto_228370 ?auto_228373 ) ) ( not ( = ?auto_228370 ?auto_228374 ) ) ( not ( = ?auto_228370 ?auto_228375 ) ) ( not ( = ?auto_228371 ?auto_228372 ) ) ( not ( = ?auto_228371 ?auto_228373 ) ) ( not ( = ?auto_228371 ?auto_228374 ) ) ( not ( = ?auto_228371 ?auto_228375 ) ) ( not ( = ?auto_228372 ?auto_228373 ) ) ( not ( = ?auto_228372 ?auto_228374 ) ) ( not ( = ?auto_228372 ?auto_228375 ) ) ( not ( = ?auto_228373 ?auto_228374 ) ) ( not ( = ?auto_228373 ?auto_228375 ) ) ( not ( = ?auto_228374 ?auto_228375 ) ) ( ON ?auto_228373 ?auto_228374 ) ( ON ?auto_228372 ?auto_228373 ) ( ON ?auto_228371 ?auto_228372 ) ( ON ?auto_228370 ?auto_228371 ) ( ON ?auto_228369 ?auto_228370 ) ( ON ?auto_228368 ?auto_228369 ) ( ON ?auto_228367 ?auto_228368 ) ( CLEAR ?auto_228365 ) ( ON ?auto_228366 ?auto_228367 ) ( CLEAR ?auto_228366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_228364 ?auto_228365 ?auto_228366 )
      ( MAKE-11PILE ?auto_228364 ?auto_228365 ?auto_228366 ?auto_228367 ?auto_228368 ?auto_228369 ?auto_228370 ?auto_228371 ?auto_228372 ?auto_228373 ?auto_228374 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228387 - BLOCK
      ?auto_228388 - BLOCK
      ?auto_228389 - BLOCK
      ?auto_228390 - BLOCK
      ?auto_228391 - BLOCK
      ?auto_228392 - BLOCK
      ?auto_228393 - BLOCK
      ?auto_228394 - BLOCK
      ?auto_228395 - BLOCK
      ?auto_228396 - BLOCK
      ?auto_228397 - BLOCK
    )
    :vars
    (
      ?auto_228398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228397 ?auto_228398 ) ( ON-TABLE ?auto_228387 ) ( not ( = ?auto_228387 ?auto_228388 ) ) ( not ( = ?auto_228387 ?auto_228389 ) ) ( not ( = ?auto_228387 ?auto_228390 ) ) ( not ( = ?auto_228387 ?auto_228391 ) ) ( not ( = ?auto_228387 ?auto_228392 ) ) ( not ( = ?auto_228387 ?auto_228393 ) ) ( not ( = ?auto_228387 ?auto_228394 ) ) ( not ( = ?auto_228387 ?auto_228395 ) ) ( not ( = ?auto_228387 ?auto_228396 ) ) ( not ( = ?auto_228387 ?auto_228397 ) ) ( not ( = ?auto_228387 ?auto_228398 ) ) ( not ( = ?auto_228388 ?auto_228389 ) ) ( not ( = ?auto_228388 ?auto_228390 ) ) ( not ( = ?auto_228388 ?auto_228391 ) ) ( not ( = ?auto_228388 ?auto_228392 ) ) ( not ( = ?auto_228388 ?auto_228393 ) ) ( not ( = ?auto_228388 ?auto_228394 ) ) ( not ( = ?auto_228388 ?auto_228395 ) ) ( not ( = ?auto_228388 ?auto_228396 ) ) ( not ( = ?auto_228388 ?auto_228397 ) ) ( not ( = ?auto_228388 ?auto_228398 ) ) ( not ( = ?auto_228389 ?auto_228390 ) ) ( not ( = ?auto_228389 ?auto_228391 ) ) ( not ( = ?auto_228389 ?auto_228392 ) ) ( not ( = ?auto_228389 ?auto_228393 ) ) ( not ( = ?auto_228389 ?auto_228394 ) ) ( not ( = ?auto_228389 ?auto_228395 ) ) ( not ( = ?auto_228389 ?auto_228396 ) ) ( not ( = ?auto_228389 ?auto_228397 ) ) ( not ( = ?auto_228389 ?auto_228398 ) ) ( not ( = ?auto_228390 ?auto_228391 ) ) ( not ( = ?auto_228390 ?auto_228392 ) ) ( not ( = ?auto_228390 ?auto_228393 ) ) ( not ( = ?auto_228390 ?auto_228394 ) ) ( not ( = ?auto_228390 ?auto_228395 ) ) ( not ( = ?auto_228390 ?auto_228396 ) ) ( not ( = ?auto_228390 ?auto_228397 ) ) ( not ( = ?auto_228390 ?auto_228398 ) ) ( not ( = ?auto_228391 ?auto_228392 ) ) ( not ( = ?auto_228391 ?auto_228393 ) ) ( not ( = ?auto_228391 ?auto_228394 ) ) ( not ( = ?auto_228391 ?auto_228395 ) ) ( not ( = ?auto_228391 ?auto_228396 ) ) ( not ( = ?auto_228391 ?auto_228397 ) ) ( not ( = ?auto_228391 ?auto_228398 ) ) ( not ( = ?auto_228392 ?auto_228393 ) ) ( not ( = ?auto_228392 ?auto_228394 ) ) ( not ( = ?auto_228392 ?auto_228395 ) ) ( not ( = ?auto_228392 ?auto_228396 ) ) ( not ( = ?auto_228392 ?auto_228397 ) ) ( not ( = ?auto_228392 ?auto_228398 ) ) ( not ( = ?auto_228393 ?auto_228394 ) ) ( not ( = ?auto_228393 ?auto_228395 ) ) ( not ( = ?auto_228393 ?auto_228396 ) ) ( not ( = ?auto_228393 ?auto_228397 ) ) ( not ( = ?auto_228393 ?auto_228398 ) ) ( not ( = ?auto_228394 ?auto_228395 ) ) ( not ( = ?auto_228394 ?auto_228396 ) ) ( not ( = ?auto_228394 ?auto_228397 ) ) ( not ( = ?auto_228394 ?auto_228398 ) ) ( not ( = ?auto_228395 ?auto_228396 ) ) ( not ( = ?auto_228395 ?auto_228397 ) ) ( not ( = ?auto_228395 ?auto_228398 ) ) ( not ( = ?auto_228396 ?auto_228397 ) ) ( not ( = ?auto_228396 ?auto_228398 ) ) ( not ( = ?auto_228397 ?auto_228398 ) ) ( ON ?auto_228396 ?auto_228397 ) ( ON ?auto_228395 ?auto_228396 ) ( ON ?auto_228394 ?auto_228395 ) ( ON ?auto_228393 ?auto_228394 ) ( ON ?auto_228392 ?auto_228393 ) ( ON ?auto_228391 ?auto_228392 ) ( ON ?auto_228390 ?auto_228391 ) ( ON ?auto_228389 ?auto_228390 ) ( CLEAR ?auto_228387 ) ( ON ?auto_228388 ?auto_228389 ) ( CLEAR ?auto_228388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_228387 ?auto_228388 )
      ( MAKE-11PILE ?auto_228387 ?auto_228388 ?auto_228389 ?auto_228390 ?auto_228391 ?auto_228392 ?auto_228393 ?auto_228394 ?auto_228395 ?auto_228396 ?auto_228397 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228410 - BLOCK
      ?auto_228411 - BLOCK
      ?auto_228412 - BLOCK
      ?auto_228413 - BLOCK
      ?auto_228414 - BLOCK
      ?auto_228415 - BLOCK
      ?auto_228416 - BLOCK
      ?auto_228417 - BLOCK
      ?auto_228418 - BLOCK
      ?auto_228419 - BLOCK
      ?auto_228420 - BLOCK
    )
    :vars
    (
      ?auto_228421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228420 ?auto_228421 ) ( ON-TABLE ?auto_228410 ) ( not ( = ?auto_228410 ?auto_228411 ) ) ( not ( = ?auto_228410 ?auto_228412 ) ) ( not ( = ?auto_228410 ?auto_228413 ) ) ( not ( = ?auto_228410 ?auto_228414 ) ) ( not ( = ?auto_228410 ?auto_228415 ) ) ( not ( = ?auto_228410 ?auto_228416 ) ) ( not ( = ?auto_228410 ?auto_228417 ) ) ( not ( = ?auto_228410 ?auto_228418 ) ) ( not ( = ?auto_228410 ?auto_228419 ) ) ( not ( = ?auto_228410 ?auto_228420 ) ) ( not ( = ?auto_228410 ?auto_228421 ) ) ( not ( = ?auto_228411 ?auto_228412 ) ) ( not ( = ?auto_228411 ?auto_228413 ) ) ( not ( = ?auto_228411 ?auto_228414 ) ) ( not ( = ?auto_228411 ?auto_228415 ) ) ( not ( = ?auto_228411 ?auto_228416 ) ) ( not ( = ?auto_228411 ?auto_228417 ) ) ( not ( = ?auto_228411 ?auto_228418 ) ) ( not ( = ?auto_228411 ?auto_228419 ) ) ( not ( = ?auto_228411 ?auto_228420 ) ) ( not ( = ?auto_228411 ?auto_228421 ) ) ( not ( = ?auto_228412 ?auto_228413 ) ) ( not ( = ?auto_228412 ?auto_228414 ) ) ( not ( = ?auto_228412 ?auto_228415 ) ) ( not ( = ?auto_228412 ?auto_228416 ) ) ( not ( = ?auto_228412 ?auto_228417 ) ) ( not ( = ?auto_228412 ?auto_228418 ) ) ( not ( = ?auto_228412 ?auto_228419 ) ) ( not ( = ?auto_228412 ?auto_228420 ) ) ( not ( = ?auto_228412 ?auto_228421 ) ) ( not ( = ?auto_228413 ?auto_228414 ) ) ( not ( = ?auto_228413 ?auto_228415 ) ) ( not ( = ?auto_228413 ?auto_228416 ) ) ( not ( = ?auto_228413 ?auto_228417 ) ) ( not ( = ?auto_228413 ?auto_228418 ) ) ( not ( = ?auto_228413 ?auto_228419 ) ) ( not ( = ?auto_228413 ?auto_228420 ) ) ( not ( = ?auto_228413 ?auto_228421 ) ) ( not ( = ?auto_228414 ?auto_228415 ) ) ( not ( = ?auto_228414 ?auto_228416 ) ) ( not ( = ?auto_228414 ?auto_228417 ) ) ( not ( = ?auto_228414 ?auto_228418 ) ) ( not ( = ?auto_228414 ?auto_228419 ) ) ( not ( = ?auto_228414 ?auto_228420 ) ) ( not ( = ?auto_228414 ?auto_228421 ) ) ( not ( = ?auto_228415 ?auto_228416 ) ) ( not ( = ?auto_228415 ?auto_228417 ) ) ( not ( = ?auto_228415 ?auto_228418 ) ) ( not ( = ?auto_228415 ?auto_228419 ) ) ( not ( = ?auto_228415 ?auto_228420 ) ) ( not ( = ?auto_228415 ?auto_228421 ) ) ( not ( = ?auto_228416 ?auto_228417 ) ) ( not ( = ?auto_228416 ?auto_228418 ) ) ( not ( = ?auto_228416 ?auto_228419 ) ) ( not ( = ?auto_228416 ?auto_228420 ) ) ( not ( = ?auto_228416 ?auto_228421 ) ) ( not ( = ?auto_228417 ?auto_228418 ) ) ( not ( = ?auto_228417 ?auto_228419 ) ) ( not ( = ?auto_228417 ?auto_228420 ) ) ( not ( = ?auto_228417 ?auto_228421 ) ) ( not ( = ?auto_228418 ?auto_228419 ) ) ( not ( = ?auto_228418 ?auto_228420 ) ) ( not ( = ?auto_228418 ?auto_228421 ) ) ( not ( = ?auto_228419 ?auto_228420 ) ) ( not ( = ?auto_228419 ?auto_228421 ) ) ( not ( = ?auto_228420 ?auto_228421 ) ) ( ON ?auto_228419 ?auto_228420 ) ( ON ?auto_228418 ?auto_228419 ) ( ON ?auto_228417 ?auto_228418 ) ( ON ?auto_228416 ?auto_228417 ) ( ON ?auto_228415 ?auto_228416 ) ( ON ?auto_228414 ?auto_228415 ) ( ON ?auto_228413 ?auto_228414 ) ( ON ?auto_228412 ?auto_228413 ) ( CLEAR ?auto_228410 ) ( ON ?auto_228411 ?auto_228412 ) ( CLEAR ?auto_228411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_228410 ?auto_228411 )
      ( MAKE-11PILE ?auto_228410 ?auto_228411 ?auto_228412 ?auto_228413 ?auto_228414 ?auto_228415 ?auto_228416 ?auto_228417 ?auto_228418 ?auto_228419 ?auto_228420 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228433 - BLOCK
      ?auto_228434 - BLOCK
      ?auto_228435 - BLOCK
      ?auto_228436 - BLOCK
      ?auto_228437 - BLOCK
      ?auto_228438 - BLOCK
      ?auto_228439 - BLOCK
      ?auto_228440 - BLOCK
      ?auto_228441 - BLOCK
      ?auto_228442 - BLOCK
      ?auto_228443 - BLOCK
    )
    :vars
    (
      ?auto_228444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228443 ?auto_228444 ) ( not ( = ?auto_228433 ?auto_228434 ) ) ( not ( = ?auto_228433 ?auto_228435 ) ) ( not ( = ?auto_228433 ?auto_228436 ) ) ( not ( = ?auto_228433 ?auto_228437 ) ) ( not ( = ?auto_228433 ?auto_228438 ) ) ( not ( = ?auto_228433 ?auto_228439 ) ) ( not ( = ?auto_228433 ?auto_228440 ) ) ( not ( = ?auto_228433 ?auto_228441 ) ) ( not ( = ?auto_228433 ?auto_228442 ) ) ( not ( = ?auto_228433 ?auto_228443 ) ) ( not ( = ?auto_228433 ?auto_228444 ) ) ( not ( = ?auto_228434 ?auto_228435 ) ) ( not ( = ?auto_228434 ?auto_228436 ) ) ( not ( = ?auto_228434 ?auto_228437 ) ) ( not ( = ?auto_228434 ?auto_228438 ) ) ( not ( = ?auto_228434 ?auto_228439 ) ) ( not ( = ?auto_228434 ?auto_228440 ) ) ( not ( = ?auto_228434 ?auto_228441 ) ) ( not ( = ?auto_228434 ?auto_228442 ) ) ( not ( = ?auto_228434 ?auto_228443 ) ) ( not ( = ?auto_228434 ?auto_228444 ) ) ( not ( = ?auto_228435 ?auto_228436 ) ) ( not ( = ?auto_228435 ?auto_228437 ) ) ( not ( = ?auto_228435 ?auto_228438 ) ) ( not ( = ?auto_228435 ?auto_228439 ) ) ( not ( = ?auto_228435 ?auto_228440 ) ) ( not ( = ?auto_228435 ?auto_228441 ) ) ( not ( = ?auto_228435 ?auto_228442 ) ) ( not ( = ?auto_228435 ?auto_228443 ) ) ( not ( = ?auto_228435 ?auto_228444 ) ) ( not ( = ?auto_228436 ?auto_228437 ) ) ( not ( = ?auto_228436 ?auto_228438 ) ) ( not ( = ?auto_228436 ?auto_228439 ) ) ( not ( = ?auto_228436 ?auto_228440 ) ) ( not ( = ?auto_228436 ?auto_228441 ) ) ( not ( = ?auto_228436 ?auto_228442 ) ) ( not ( = ?auto_228436 ?auto_228443 ) ) ( not ( = ?auto_228436 ?auto_228444 ) ) ( not ( = ?auto_228437 ?auto_228438 ) ) ( not ( = ?auto_228437 ?auto_228439 ) ) ( not ( = ?auto_228437 ?auto_228440 ) ) ( not ( = ?auto_228437 ?auto_228441 ) ) ( not ( = ?auto_228437 ?auto_228442 ) ) ( not ( = ?auto_228437 ?auto_228443 ) ) ( not ( = ?auto_228437 ?auto_228444 ) ) ( not ( = ?auto_228438 ?auto_228439 ) ) ( not ( = ?auto_228438 ?auto_228440 ) ) ( not ( = ?auto_228438 ?auto_228441 ) ) ( not ( = ?auto_228438 ?auto_228442 ) ) ( not ( = ?auto_228438 ?auto_228443 ) ) ( not ( = ?auto_228438 ?auto_228444 ) ) ( not ( = ?auto_228439 ?auto_228440 ) ) ( not ( = ?auto_228439 ?auto_228441 ) ) ( not ( = ?auto_228439 ?auto_228442 ) ) ( not ( = ?auto_228439 ?auto_228443 ) ) ( not ( = ?auto_228439 ?auto_228444 ) ) ( not ( = ?auto_228440 ?auto_228441 ) ) ( not ( = ?auto_228440 ?auto_228442 ) ) ( not ( = ?auto_228440 ?auto_228443 ) ) ( not ( = ?auto_228440 ?auto_228444 ) ) ( not ( = ?auto_228441 ?auto_228442 ) ) ( not ( = ?auto_228441 ?auto_228443 ) ) ( not ( = ?auto_228441 ?auto_228444 ) ) ( not ( = ?auto_228442 ?auto_228443 ) ) ( not ( = ?auto_228442 ?auto_228444 ) ) ( not ( = ?auto_228443 ?auto_228444 ) ) ( ON ?auto_228442 ?auto_228443 ) ( ON ?auto_228441 ?auto_228442 ) ( ON ?auto_228440 ?auto_228441 ) ( ON ?auto_228439 ?auto_228440 ) ( ON ?auto_228438 ?auto_228439 ) ( ON ?auto_228437 ?auto_228438 ) ( ON ?auto_228436 ?auto_228437 ) ( ON ?auto_228435 ?auto_228436 ) ( ON ?auto_228434 ?auto_228435 ) ( ON ?auto_228433 ?auto_228434 ) ( CLEAR ?auto_228433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_228433 )
      ( MAKE-11PILE ?auto_228433 ?auto_228434 ?auto_228435 ?auto_228436 ?auto_228437 ?auto_228438 ?auto_228439 ?auto_228440 ?auto_228441 ?auto_228442 ?auto_228443 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_228456 - BLOCK
      ?auto_228457 - BLOCK
      ?auto_228458 - BLOCK
      ?auto_228459 - BLOCK
      ?auto_228460 - BLOCK
      ?auto_228461 - BLOCK
      ?auto_228462 - BLOCK
      ?auto_228463 - BLOCK
      ?auto_228464 - BLOCK
      ?auto_228465 - BLOCK
      ?auto_228466 - BLOCK
    )
    :vars
    (
      ?auto_228467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228466 ?auto_228467 ) ( not ( = ?auto_228456 ?auto_228457 ) ) ( not ( = ?auto_228456 ?auto_228458 ) ) ( not ( = ?auto_228456 ?auto_228459 ) ) ( not ( = ?auto_228456 ?auto_228460 ) ) ( not ( = ?auto_228456 ?auto_228461 ) ) ( not ( = ?auto_228456 ?auto_228462 ) ) ( not ( = ?auto_228456 ?auto_228463 ) ) ( not ( = ?auto_228456 ?auto_228464 ) ) ( not ( = ?auto_228456 ?auto_228465 ) ) ( not ( = ?auto_228456 ?auto_228466 ) ) ( not ( = ?auto_228456 ?auto_228467 ) ) ( not ( = ?auto_228457 ?auto_228458 ) ) ( not ( = ?auto_228457 ?auto_228459 ) ) ( not ( = ?auto_228457 ?auto_228460 ) ) ( not ( = ?auto_228457 ?auto_228461 ) ) ( not ( = ?auto_228457 ?auto_228462 ) ) ( not ( = ?auto_228457 ?auto_228463 ) ) ( not ( = ?auto_228457 ?auto_228464 ) ) ( not ( = ?auto_228457 ?auto_228465 ) ) ( not ( = ?auto_228457 ?auto_228466 ) ) ( not ( = ?auto_228457 ?auto_228467 ) ) ( not ( = ?auto_228458 ?auto_228459 ) ) ( not ( = ?auto_228458 ?auto_228460 ) ) ( not ( = ?auto_228458 ?auto_228461 ) ) ( not ( = ?auto_228458 ?auto_228462 ) ) ( not ( = ?auto_228458 ?auto_228463 ) ) ( not ( = ?auto_228458 ?auto_228464 ) ) ( not ( = ?auto_228458 ?auto_228465 ) ) ( not ( = ?auto_228458 ?auto_228466 ) ) ( not ( = ?auto_228458 ?auto_228467 ) ) ( not ( = ?auto_228459 ?auto_228460 ) ) ( not ( = ?auto_228459 ?auto_228461 ) ) ( not ( = ?auto_228459 ?auto_228462 ) ) ( not ( = ?auto_228459 ?auto_228463 ) ) ( not ( = ?auto_228459 ?auto_228464 ) ) ( not ( = ?auto_228459 ?auto_228465 ) ) ( not ( = ?auto_228459 ?auto_228466 ) ) ( not ( = ?auto_228459 ?auto_228467 ) ) ( not ( = ?auto_228460 ?auto_228461 ) ) ( not ( = ?auto_228460 ?auto_228462 ) ) ( not ( = ?auto_228460 ?auto_228463 ) ) ( not ( = ?auto_228460 ?auto_228464 ) ) ( not ( = ?auto_228460 ?auto_228465 ) ) ( not ( = ?auto_228460 ?auto_228466 ) ) ( not ( = ?auto_228460 ?auto_228467 ) ) ( not ( = ?auto_228461 ?auto_228462 ) ) ( not ( = ?auto_228461 ?auto_228463 ) ) ( not ( = ?auto_228461 ?auto_228464 ) ) ( not ( = ?auto_228461 ?auto_228465 ) ) ( not ( = ?auto_228461 ?auto_228466 ) ) ( not ( = ?auto_228461 ?auto_228467 ) ) ( not ( = ?auto_228462 ?auto_228463 ) ) ( not ( = ?auto_228462 ?auto_228464 ) ) ( not ( = ?auto_228462 ?auto_228465 ) ) ( not ( = ?auto_228462 ?auto_228466 ) ) ( not ( = ?auto_228462 ?auto_228467 ) ) ( not ( = ?auto_228463 ?auto_228464 ) ) ( not ( = ?auto_228463 ?auto_228465 ) ) ( not ( = ?auto_228463 ?auto_228466 ) ) ( not ( = ?auto_228463 ?auto_228467 ) ) ( not ( = ?auto_228464 ?auto_228465 ) ) ( not ( = ?auto_228464 ?auto_228466 ) ) ( not ( = ?auto_228464 ?auto_228467 ) ) ( not ( = ?auto_228465 ?auto_228466 ) ) ( not ( = ?auto_228465 ?auto_228467 ) ) ( not ( = ?auto_228466 ?auto_228467 ) ) ( ON ?auto_228465 ?auto_228466 ) ( ON ?auto_228464 ?auto_228465 ) ( ON ?auto_228463 ?auto_228464 ) ( ON ?auto_228462 ?auto_228463 ) ( ON ?auto_228461 ?auto_228462 ) ( ON ?auto_228460 ?auto_228461 ) ( ON ?auto_228459 ?auto_228460 ) ( ON ?auto_228458 ?auto_228459 ) ( ON ?auto_228457 ?auto_228458 ) ( ON ?auto_228456 ?auto_228457 ) ( CLEAR ?auto_228456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_228456 )
      ( MAKE-11PILE ?auto_228456 ?auto_228457 ?auto_228458 ?auto_228459 ?auto_228460 ?auto_228461 ?auto_228462 ?auto_228463 ?auto_228464 ?auto_228465 ?auto_228466 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228480 - BLOCK
      ?auto_228481 - BLOCK
      ?auto_228482 - BLOCK
      ?auto_228483 - BLOCK
      ?auto_228484 - BLOCK
      ?auto_228485 - BLOCK
      ?auto_228486 - BLOCK
      ?auto_228487 - BLOCK
      ?auto_228488 - BLOCK
      ?auto_228489 - BLOCK
      ?auto_228490 - BLOCK
      ?auto_228491 - BLOCK
    )
    :vars
    (
      ?auto_228492 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_228490 ) ( ON ?auto_228491 ?auto_228492 ) ( CLEAR ?auto_228491 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_228480 ) ( ON ?auto_228481 ?auto_228480 ) ( ON ?auto_228482 ?auto_228481 ) ( ON ?auto_228483 ?auto_228482 ) ( ON ?auto_228484 ?auto_228483 ) ( ON ?auto_228485 ?auto_228484 ) ( ON ?auto_228486 ?auto_228485 ) ( ON ?auto_228487 ?auto_228486 ) ( ON ?auto_228488 ?auto_228487 ) ( ON ?auto_228489 ?auto_228488 ) ( ON ?auto_228490 ?auto_228489 ) ( not ( = ?auto_228480 ?auto_228481 ) ) ( not ( = ?auto_228480 ?auto_228482 ) ) ( not ( = ?auto_228480 ?auto_228483 ) ) ( not ( = ?auto_228480 ?auto_228484 ) ) ( not ( = ?auto_228480 ?auto_228485 ) ) ( not ( = ?auto_228480 ?auto_228486 ) ) ( not ( = ?auto_228480 ?auto_228487 ) ) ( not ( = ?auto_228480 ?auto_228488 ) ) ( not ( = ?auto_228480 ?auto_228489 ) ) ( not ( = ?auto_228480 ?auto_228490 ) ) ( not ( = ?auto_228480 ?auto_228491 ) ) ( not ( = ?auto_228480 ?auto_228492 ) ) ( not ( = ?auto_228481 ?auto_228482 ) ) ( not ( = ?auto_228481 ?auto_228483 ) ) ( not ( = ?auto_228481 ?auto_228484 ) ) ( not ( = ?auto_228481 ?auto_228485 ) ) ( not ( = ?auto_228481 ?auto_228486 ) ) ( not ( = ?auto_228481 ?auto_228487 ) ) ( not ( = ?auto_228481 ?auto_228488 ) ) ( not ( = ?auto_228481 ?auto_228489 ) ) ( not ( = ?auto_228481 ?auto_228490 ) ) ( not ( = ?auto_228481 ?auto_228491 ) ) ( not ( = ?auto_228481 ?auto_228492 ) ) ( not ( = ?auto_228482 ?auto_228483 ) ) ( not ( = ?auto_228482 ?auto_228484 ) ) ( not ( = ?auto_228482 ?auto_228485 ) ) ( not ( = ?auto_228482 ?auto_228486 ) ) ( not ( = ?auto_228482 ?auto_228487 ) ) ( not ( = ?auto_228482 ?auto_228488 ) ) ( not ( = ?auto_228482 ?auto_228489 ) ) ( not ( = ?auto_228482 ?auto_228490 ) ) ( not ( = ?auto_228482 ?auto_228491 ) ) ( not ( = ?auto_228482 ?auto_228492 ) ) ( not ( = ?auto_228483 ?auto_228484 ) ) ( not ( = ?auto_228483 ?auto_228485 ) ) ( not ( = ?auto_228483 ?auto_228486 ) ) ( not ( = ?auto_228483 ?auto_228487 ) ) ( not ( = ?auto_228483 ?auto_228488 ) ) ( not ( = ?auto_228483 ?auto_228489 ) ) ( not ( = ?auto_228483 ?auto_228490 ) ) ( not ( = ?auto_228483 ?auto_228491 ) ) ( not ( = ?auto_228483 ?auto_228492 ) ) ( not ( = ?auto_228484 ?auto_228485 ) ) ( not ( = ?auto_228484 ?auto_228486 ) ) ( not ( = ?auto_228484 ?auto_228487 ) ) ( not ( = ?auto_228484 ?auto_228488 ) ) ( not ( = ?auto_228484 ?auto_228489 ) ) ( not ( = ?auto_228484 ?auto_228490 ) ) ( not ( = ?auto_228484 ?auto_228491 ) ) ( not ( = ?auto_228484 ?auto_228492 ) ) ( not ( = ?auto_228485 ?auto_228486 ) ) ( not ( = ?auto_228485 ?auto_228487 ) ) ( not ( = ?auto_228485 ?auto_228488 ) ) ( not ( = ?auto_228485 ?auto_228489 ) ) ( not ( = ?auto_228485 ?auto_228490 ) ) ( not ( = ?auto_228485 ?auto_228491 ) ) ( not ( = ?auto_228485 ?auto_228492 ) ) ( not ( = ?auto_228486 ?auto_228487 ) ) ( not ( = ?auto_228486 ?auto_228488 ) ) ( not ( = ?auto_228486 ?auto_228489 ) ) ( not ( = ?auto_228486 ?auto_228490 ) ) ( not ( = ?auto_228486 ?auto_228491 ) ) ( not ( = ?auto_228486 ?auto_228492 ) ) ( not ( = ?auto_228487 ?auto_228488 ) ) ( not ( = ?auto_228487 ?auto_228489 ) ) ( not ( = ?auto_228487 ?auto_228490 ) ) ( not ( = ?auto_228487 ?auto_228491 ) ) ( not ( = ?auto_228487 ?auto_228492 ) ) ( not ( = ?auto_228488 ?auto_228489 ) ) ( not ( = ?auto_228488 ?auto_228490 ) ) ( not ( = ?auto_228488 ?auto_228491 ) ) ( not ( = ?auto_228488 ?auto_228492 ) ) ( not ( = ?auto_228489 ?auto_228490 ) ) ( not ( = ?auto_228489 ?auto_228491 ) ) ( not ( = ?auto_228489 ?auto_228492 ) ) ( not ( = ?auto_228490 ?auto_228491 ) ) ( not ( = ?auto_228490 ?auto_228492 ) ) ( not ( = ?auto_228491 ?auto_228492 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_228491 ?auto_228492 )
      ( !STACK ?auto_228491 ?auto_228490 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228505 - BLOCK
      ?auto_228506 - BLOCK
      ?auto_228507 - BLOCK
      ?auto_228508 - BLOCK
      ?auto_228509 - BLOCK
      ?auto_228510 - BLOCK
      ?auto_228511 - BLOCK
      ?auto_228512 - BLOCK
      ?auto_228513 - BLOCK
      ?auto_228514 - BLOCK
      ?auto_228515 - BLOCK
      ?auto_228516 - BLOCK
    )
    :vars
    (
      ?auto_228517 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_228515 ) ( ON ?auto_228516 ?auto_228517 ) ( CLEAR ?auto_228516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_228505 ) ( ON ?auto_228506 ?auto_228505 ) ( ON ?auto_228507 ?auto_228506 ) ( ON ?auto_228508 ?auto_228507 ) ( ON ?auto_228509 ?auto_228508 ) ( ON ?auto_228510 ?auto_228509 ) ( ON ?auto_228511 ?auto_228510 ) ( ON ?auto_228512 ?auto_228511 ) ( ON ?auto_228513 ?auto_228512 ) ( ON ?auto_228514 ?auto_228513 ) ( ON ?auto_228515 ?auto_228514 ) ( not ( = ?auto_228505 ?auto_228506 ) ) ( not ( = ?auto_228505 ?auto_228507 ) ) ( not ( = ?auto_228505 ?auto_228508 ) ) ( not ( = ?auto_228505 ?auto_228509 ) ) ( not ( = ?auto_228505 ?auto_228510 ) ) ( not ( = ?auto_228505 ?auto_228511 ) ) ( not ( = ?auto_228505 ?auto_228512 ) ) ( not ( = ?auto_228505 ?auto_228513 ) ) ( not ( = ?auto_228505 ?auto_228514 ) ) ( not ( = ?auto_228505 ?auto_228515 ) ) ( not ( = ?auto_228505 ?auto_228516 ) ) ( not ( = ?auto_228505 ?auto_228517 ) ) ( not ( = ?auto_228506 ?auto_228507 ) ) ( not ( = ?auto_228506 ?auto_228508 ) ) ( not ( = ?auto_228506 ?auto_228509 ) ) ( not ( = ?auto_228506 ?auto_228510 ) ) ( not ( = ?auto_228506 ?auto_228511 ) ) ( not ( = ?auto_228506 ?auto_228512 ) ) ( not ( = ?auto_228506 ?auto_228513 ) ) ( not ( = ?auto_228506 ?auto_228514 ) ) ( not ( = ?auto_228506 ?auto_228515 ) ) ( not ( = ?auto_228506 ?auto_228516 ) ) ( not ( = ?auto_228506 ?auto_228517 ) ) ( not ( = ?auto_228507 ?auto_228508 ) ) ( not ( = ?auto_228507 ?auto_228509 ) ) ( not ( = ?auto_228507 ?auto_228510 ) ) ( not ( = ?auto_228507 ?auto_228511 ) ) ( not ( = ?auto_228507 ?auto_228512 ) ) ( not ( = ?auto_228507 ?auto_228513 ) ) ( not ( = ?auto_228507 ?auto_228514 ) ) ( not ( = ?auto_228507 ?auto_228515 ) ) ( not ( = ?auto_228507 ?auto_228516 ) ) ( not ( = ?auto_228507 ?auto_228517 ) ) ( not ( = ?auto_228508 ?auto_228509 ) ) ( not ( = ?auto_228508 ?auto_228510 ) ) ( not ( = ?auto_228508 ?auto_228511 ) ) ( not ( = ?auto_228508 ?auto_228512 ) ) ( not ( = ?auto_228508 ?auto_228513 ) ) ( not ( = ?auto_228508 ?auto_228514 ) ) ( not ( = ?auto_228508 ?auto_228515 ) ) ( not ( = ?auto_228508 ?auto_228516 ) ) ( not ( = ?auto_228508 ?auto_228517 ) ) ( not ( = ?auto_228509 ?auto_228510 ) ) ( not ( = ?auto_228509 ?auto_228511 ) ) ( not ( = ?auto_228509 ?auto_228512 ) ) ( not ( = ?auto_228509 ?auto_228513 ) ) ( not ( = ?auto_228509 ?auto_228514 ) ) ( not ( = ?auto_228509 ?auto_228515 ) ) ( not ( = ?auto_228509 ?auto_228516 ) ) ( not ( = ?auto_228509 ?auto_228517 ) ) ( not ( = ?auto_228510 ?auto_228511 ) ) ( not ( = ?auto_228510 ?auto_228512 ) ) ( not ( = ?auto_228510 ?auto_228513 ) ) ( not ( = ?auto_228510 ?auto_228514 ) ) ( not ( = ?auto_228510 ?auto_228515 ) ) ( not ( = ?auto_228510 ?auto_228516 ) ) ( not ( = ?auto_228510 ?auto_228517 ) ) ( not ( = ?auto_228511 ?auto_228512 ) ) ( not ( = ?auto_228511 ?auto_228513 ) ) ( not ( = ?auto_228511 ?auto_228514 ) ) ( not ( = ?auto_228511 ?auto_228515 ) ) ( not ( = ?auto_228511 ?auto_228516 ) ) ( not ( = ?auto_228511 ?auto_228517 ) ) ( not ( = ?auto_228512 ?auto_228513 ) ) ( not ( = ?auto_228512 ?auto_228514 ) ) ( not ( = ?auto_228512 ?auto_228515 ) ) ( not ( = ?auto_228512 ?auto_228516 ) ) ( not ( = ?auto_228512 ?auto_228517 ) ) ( not ( = ?auto_228513 ?auto_228514 ) ) ( not ( = ?auto_228513 ?auto_228515 ) ) ( not ( = ?auto_228513 ?auto_228516 ) ) ( not ( = ?auto_228513 ?auto_228517 ) ) ( not ( = ?auto_228514 ?auto_228515 ) ) ( not ( = ?auto_228514 ?auto_228516 ) ) ( not ( = ?auto_228514 ?auto_228517 ) ) ( not ( = ?auto_228515 ?auto_228516 ) ) ( not ( = ?auto_228515 ?auto_228517 ) ) ( not ( = ?auto_228516 ?auto_228517 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_228516 ?auto_228517 )
      ( !STACK ?auto_228516 ?auto_228515 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228530 - BLOCK
      ?auto_228531 - BLOCK
      ?auto_228532 - BLOCK
      ?auto_228533 - BLOCK
      ?auto_228534 - BLOCK
      ?auto_228535 - BLOCK
      ?auto_228536 - BLOCK
      ?auto_228537 - BLOCK
      ?auto_228538 - BLOCK
      ?auto_228539 - BLOCK
      ?auto_228540 - BLOCK
      ?auto_228541 - BLOCK
    )
    :vars
    (
      ?auto_228542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228541 ?auto_228542 ) ( ON-TABLE ?auto_228530 ) ( ON ?auto_228531 ?auto_228530 ) ( ON ?auto_228532 ?auto_228531 ) ( ON ?auto_228533 ?auto_228532 ) ( ON ?auto_228534 ?auto_228533 ) ( ON ?auto_228535 ?auto_228534 ) ( ON ?auto_228536 ?auto_228535 ) ( ON ?auto_228537 ?auto_228536 ) ( ON ?auto_228538 ?auto_228537 ) ( ON ?auto_228539 ?auto_228538 ) ( not ( = ?auto_228530 ?auto_228531 ) ) ( not ( = ?auto_228530 ?auto_228532 ) ) ( not ( = ?auto_228530 ?auto_228533 ) ) ( not ( = ?auto_228530 ?auto_228534 ) ) ( not ( = ?auto_228530 ?auto_228535 ) ) ( not ( = ?auto_228530 ?auto_228536 ) ) ( not ( = ?auto_228530 ?auto_228537 ) ) ( not ( = ?auto_228530 ?auto_228538 ) ) ( not ( = ?auto_228530 ?auto_228539 ) ) ( not ( = ?auto_228530 ?auto_228540 ) ) ( not ( = ?auto_228530 ?auto_228541 ) ) ( not ( = ?auto_228530 ?auto_228542 ) ) ( not ( = ?auto_228531 ?auto_228532 ) ) ( not ( = ?auto_228531 ?auto_228533 ) ) ( not ( = ?auto_228531 ?auto_228534 ) ) ( not ( = ?auto_228531 ?auto_228535 ) ) ( not ( = ?auto_228531 ?auto_228536 ) ) ( not ( = ?auto_228531 ?auto_228537 ) ) ( not ( = ?auto_228531 ?auto_228538 ) ) ( not ( = ?auto_228531 ?auto_228539 ) ) ( not ( = ?auto_228531 ?auto_228540 ) ) ( not ( = ?auto_228531 ?auto_228541 ) ) ( not ( = ?auto_228531 ?auto_228542 ) ) ( not ( = ?auto_228532 ?auto_228533 ) ) ( not ( = ?auto_228532 ?auto_228534 ) ) ( not ( = ?auto_228532 ?auto_228535 ) ) ( not ( = ?auto_228532 ?auto_228536 ) ) ( not ( = ?auto_228532 ?auto_228537 ) ) ( not ( = ?auto_228532 ?auto_228538 ) ) ( not ( = ?auto_228532 ?auto_228539 ) ) ( not ( = ?auto_228532 ?auto_228540 ) ) ( not ( = ?auto_228532 ?auto_228541 ) ) ( not ( = ?auto_228532 ?auto_228542 ) ) ( not ( = ?auto_228533 ?auto_228534 ) ) ( not ( = ?auto_228533 ?auto_228535 ) ) ( not ( = ?auto_228533 ?auto_228536 ) ) ( not ( = ?auto_228533 ?auto_228537 ) ) ( not ( = ?auto_228533 ?auto_228538 ) ) ( not ( = ?auto_228533 ?auto_228539 ) ) ( not ( = ?auto_228533 ?auto_228540 ) ) ( not ( = ?auto_228533 ?auto_228541 ) ) ( not ( = ?auto_228533 ?auto_228542 ) ) ( not ( = ?auto_228534 ?auto_228535 ) ) ( not ( = ?auto_228534 ?auto_228536 ) ) ( not ( = ?auto_228534 ?auto_228537 ) ) ( not ( = ?auto_228534 ?auto_228538 ) ) ( not ( = ?auto_228534 ?auto_228539 ) ) ( not ( = ?auto_228534 ?auto_228540 ) ) ( not ( = ?auto_228534 ?auto_228541 ) ) ( not ( = ?auto_228534 ?auto_228542 ) ) ( not ( = ?auto_228535 ?auto_228536 ) ) ( not ( = ?auto_228535 ?auto_228537 ) ) ( not ( = ?auto_228535 ?auto_228538 ) ) ( not ( = ?auto_228535 ?auto_228539 ) ) ( not ( = ?auto_228535 ?auto_228540 ) ) ( not ( = ?auto_228535 ?auto_228541 ) ) ( not ( = ?auto_228535 ?auto_228542 ) ) ( not ( = ?auto_228536 ?auto_228537 ) ) ( not ( = ?auto_228536 ?auto_228538 ) ) ( not ( = ?auto_228536 ?auto_228539 ) ) ( not ( = ?auto_228536 ?auto_228540 ) ) ( not ( = ?auto_228536 ?auto_228541 ) ) ( not ( = ?auto_228536 ?auto_228542 ) ) ( not ( = ?auto_228537 ?auto_228538 ) ) ( not ( = ?auto_228537 ?auto_228539 ) ) ( not ( = ?auto_228537 ?auto_228540 ) ) ( not ( = ?auto_228537 ?auto_228541 ) ) ( not ( = ?auto_228537 ?auto_228542 ) ) ( not ( = ?auto_228538 ?auto_228539 ) ) ( not ( = ?auto_228538 ?auto_228540 ) ) ( not ( = ?auto_228538 ?auto_228541 ) ) ( not ( = ?auto_228538 ?auto_228542 ) ) ( not ( = ?auto_228539 ?auto_228540 ) ) ( not ( = ?auto_228539 ?auto_228541 ) ) ( not ( = ?auto_228539 ?auto_228542 ) ) ( not ( = ?auto_228540 ?auto_228541 ) ) ( not ( = ?auto_228540 ?auto_228542 ) ) ( not ( = ?auto_228541 ?auto_228542 ) ) ( CLEAR ?auto_228539 ) ( ON ?auto_228540 ?auto_228541 ) ( CLEAR ?auto_228540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_228530 ?auto_228531 ?auto_228532 ?auto_228533 ?auto_228534 ?auto_228535 ?auto_228536 ?auto_228537 ?auto_228538 ?auto_228539 ?auto_228540 )
      ( MAKE-12PILE ?auto_228530 ?auto_228531 ?auto_228532 ?auto_228533 ?auto_228534 ?auto_228535 ?auto_228536 ?auto_228537 ?auto_228538 ?auto_228539 ?auto_228540 ?auto_228541 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228555 - BLOCK
      ?auto_228556 - BLOCK
      ?auto_228557 - BLOCK
      ?auto_228558 - BLOCK
      ?auto_228559 - BLOCK
      ?auto_228560 - BLOCK
      ?auto_228561 - BLOCK
      ?auto_228562 - BLOCK
      ?auto_228563 - BLOCK
      ?auto_228564 - BLOCK
      ?auto_228565 - BLOCK
      ?auto_228566 - BLOCK
    )
    :vars
    (
      ?auto_228567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228566 ?auto_228567 ) ( ON-TABLE ?auto_228555 ) ( ON ?auto_228556 ?auto_228555 ) ( ON ?auto_228557 ?auto_228556 ) ( ON ?auto_228558 ?auto_228557 ) ( ON ?auto_228559 ?auto_228558 ) ( ON ?auto_228560 ?auto_228559 ) ( ON ?auto_228561 ?auto_228560 ) ( ON ?auto_228562 ?auto_228561 ) ( ON ?auto_228563 ?auto_228562 ) ( ON ?auto_228564 ?auto_228563 ) ( not ( = ?auto_228555 ?auto_228556 ) ) ( not ( = ?auto_228555 ?auto_228557 ) ) ( not ( = ?auto_228555 ?auto_228558 ) ) ( not ( = ?auto_228555 ?auto_228559 ) ) ( not ( = ?auto_228555 ?auto_228560 ) ) ( not ( = ?auto_228555 ?auto_228561 ) ) ( not ( = ?auto_228555 ?auto_228562 ) ) ( not ( = ?auto_228555 ?auto_228563 ) ) ( not ( = ?auto_228555 ?auto_228564 ) ) ( not ( = ?auto_228555 ?auto_228565 ) ) ( not ( = ?auto_228555 ?auto_228566 ) ) ( not ( = ?auto_228555 ?auto_228567 ) ) ( not ( = ?auto_228556 ?auto_228557 ) ) ( not ( = ?auto_228556 ?auto_228558 ) ) ( not ( = ?auto_228556 ?auto_228559 ) ) ( not ( = ?auto_228556 ?auto_228560 ) ) ( not ( = ?auto_228556 ?auto_228561 ) ) ( not ( = ?auto_228556 ?auto_228562 ) ) ( not ( = ?auto_228556 ?auto_228563 ) ) ( not ( = ?auto_228556 ?auto_228564 ) ) ( not ( = ?auto_228556 ?auto_228565 ) ) ( not ( = ?auto_228556 ?auto_228566 ) ) ( not ( = ?auto_228556 ?auto_228567 ) ) ( not ( = ?auto_228557 ?auto_228558 ) ) ( not ( = ?auto_228557 ?auto_228559 ) ) ( not ( = ?auto_228557 ?auto_228560 ) ) ( not ( = ?auto_228557 ?auto_228561 ) ) ( not ( = ?auto_228557 ?auto_228562 ) ) ( not ( = ?auto_228557 ?auto_228563 ) ) ( not ( = ?auto_228557 ?auto_228564 ) ) ( not ( = ?auto_228557 ?auto_228565 ) ) ( not ( = ?auto_228557 ?auto_228566 ) ) ( not ( = ?auto_228557 ?auto_228567 ) ) ( not ( = ?auto_228558 ?auto_228559 ) ) ( not ( = ?auto_228558 ?auto_228560 ) ) ( not ( = ?auto_228558 ?auto_228561 ) ) ( not ( = ?auto_228558 ?auto_228562 ) ) ( not ( = ?auto_228558 ?auto_228563 ) ) ( not ( = ?auto_228558 ?auto_228564 ) ) ( not ( = ?auto_228558 ?auto_228565 ) ) ( not ( = ?auto_228558 ?auto_228566 ) ) ( not ( = ?auto_228558 ?auto_228567 ) ) ( not ( = ?auto_228559 ?auto_228560 ) ) ( not ( = ?auto_228559 ?auto_228561 ) ) ( not ( = ?auto_228559 ?auto_228562 ) ) ( not ( = ?auto_228559 ?auto_228563 ) ) ( not ( = ?auto_228559 ?auto_228564 ) ) ( not ( = ?auto_228559 ?auto_228565 ) ) ( not ( = ?auto_228559 ?auto_228566 ) ) ( not ( = ?auto_228559 ?auto_228567 ) ) ( not ( = ?auto_228560 ?auto_228561 ) ) ( not ( = ?auto_228560 ?auto_228562 ) ) ( not ( = ?auto_228560 ?auto_228563 ) ) ( not ( = ?auto_228560 ?auto_228564 ) ) ( not ( = ?auto_228560 ?auto_228565 ) ) ( not ( = ?auto_228560 ?auto_228566 ) ) ( not ( = ?auto_228560 ?auto_228567 ) ) ( not ( = ?auto_228561 ?auto_228562 ) ) ( not ( = ?auto_228561 ?auto_228563 ) ) ( not ( = ?auto_228561 ?auto_228564 ) ) ( not ( = ?auto_228561 ?auto_228565 ) ) ( not ( = ?auto_228561 ?auto_228566 ) ) ( not ( = ?auto_228561 ?auto_228567 ) ) ( not ( = ?auto_228562 ?auto_228563 ) ) ( not ( = ?auto_228562 ?auto_228564 ) ) ( not ( = ?auto_228562 ?auto_228565 ) ) ( not ( = ?auto_228562 ?auto_228566 ) ) ( not ( = ?auto_228562 ?auto_228567 ) ) ( not ( = ?auto_228563 ?auto_228564 ) ) ( not ( = ?auto_228563 ?auto_228565 ) ) ( not ( = ?auto_228563 ?auto_228566 ) ) ( not ( = ?auto_228563 ?auto_228567 ) ) ( not ( = ?auto_228564 ?auto_228565 ) ) ( not ( = ?auto_228564 ?auto_228566 ) ) ( not ( = ?auto_228564 ?auto_228567 ) ) ( not ( = ?auto_228565 ?auto_228566 ) ) ( not ( = ?auto_228565 ?auto_228567 ) ) ( not ( = ?auto_228566 ?auto_228567 ) ) ( CLEAR ?auto_228564 ) ( ON ?auto_228565 ?auto_228566 ) ( CLEAR ?auto_228565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_228555 ?auto_228556 ?auto_228557 ?auto_228558 ?auto_228559 ?auto_228560 ?auto_228561 ?auto_228562 ?auto_228563 ?auto_228564 ?auto_228565 )
      ( MAKE-12PILE ?auto_228555 ?auto_228556 ?auto_228557 ?auto_228558 ?auto_228559 ?auto_228560 ?auto_228561 ?auto_228562 ?auto_228563 ?auto_228564 ?auto_228565 ?auto_228566 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228580 - BLOCK
      ?auto_228581 - BLOCK
      ?auto_228582 - BLOCK
      ?auto_228583 - BLOCK
      ?auto_228584 - BLOCK
      ?auto_228585 - BLOCK
      ?auto_228586 - BLOCK
      ?auto_228587 - BLOCK
      ?auto_228588 - BLOCK
      ?auto_228589 - BLOCK
      ?auto_228590 - BLOCK
      ?auto_228591 - BLOCK
    )
    :vars
    (
      ?auto_228592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228591 ?auto_228592 ) ( ON-TABLE ?auto_228580 ) ( ON ?auto_228581 ?auto_228580 ) ( ON ?auto_228582 ?auto_228581 ) ( ON ?auto_228583 ?auto_228582 ) ( ON ?auto_228584 ?auto_228583 ) ( ON ?auto_228585 ?auto_228584 ) ( ON ?auto_228586 ?auto_228585 ) ( ON ?auto_228587 ?auto_228586 ) ( ON ?auto_228588 ?auto_228587 ) ( not ( = ?auto_228580 ?auto_228581 ) ) ( not ( = ?auto_228580 ?auto_228582 ) ) ( not ( = ?auto_228580 ?auto_228583 ) ) ( not ( = ?auto_228580 ?auto_228584 ) ) ( not ( = ?auto_228580 ?auto_228585 ) ) ( not ( = ?auto_228580 ?auto_228586 ) ) ( not ( = ?auto_228580 ?auto_228587 ) ) ( not ( = ?auto_228580 ?auto_228588 ) ) ( not ( = ?auto_228580 ?auto_228589 ) ) ( not ( = ?auto_228580 ?auto_228590 ) ) ( not ( = ?auto_228580 ?auto_228591 ) ) ( not ( = ?auto_228580 ?auto_228592 ) ) ( not ( = ?auto_228581 ?auto_228582 ) ) ( not ( = ?auto_228581 ?auto_228583 ) ) ( not ( = ?auto_228581 ?auto_228584 ) ) ( not ( = ?auto_228581 ?auto_228585 ) ) ( not ( = ?auto_228581 ?auto_228586 ) ) ( not ( = ?auto_228581 ?auto_228587 ) ) ( not ( = ?auto_228581 ?auto_228588 ) ) ( not ( = ?auto_228581 ?auto_228589 ) ) ( not ( = ?auto_228581 ?auto_228590 ) ) ( not ( = ?auto_228581 ?auto_228591 ) ) ( not ( = ?auto_228581 ?auto_228592 ) ) ( not ( = ?auto_228582 ?auto_228583 ) ) ( not ( = ?auto_228582 ?auto_228584 ) ) ( not ( = ?auto_228582 ?auto_228585 ) ) ( not ( = ?auto_228582 ?auto_228586 ) ) ( not ( = ?auto_228582 ?auto_228587 ) ) ( not ( = ?auto_228582 ?auto_228588 ) ) ( not ( = ?auto_228582 ?auto_228589 ) ) ( not ( = ?auto_228582 ?auto_228590 ) ) ( not ( = ?auto_228582 ?auto_228591 ) ) ( not ( = ?auto_228582 ?auto_228592 ) ) ( not ( = ?auto_228583 ?auto_228584 ) ) ( not ( = ?auto_228583 ?auto_228585 ) ) ( not ( = ?auto_228583 ?auto_228586 ) ) ( not ( = ?auto_228583 ?auto_228587 ) ) ( not ( = ?auto_228583 ?auto_228588 ) ) ( not ( = ?auto_228583 ?auto_228589 ) ) ( not ( = ?auto_228583 ?auto_228590 ) ) ( not ( = ?auto_228583 ?auto_228591 ) ) ( not ( = ?auto_228583 ?auto_228592 ) ) ( not ( = ?auto_228584 ?auto_228585 ) ) ( not ( = ?auto_228584 ?auto_228586 ) ) ( not ( = ?auto_228584 ?auto_228587 ) ) ( not ( = ?auto_228584 ?auto_228588 ) ) ( not ( = ?auto_228584 ?auto_228589 ) ) ( not ( = ?auto_228584 ?auto_228590 ) ) ( not ( = ?auto_228584 ?auto_228591 ) ) ( not ( = ?auto_228584 ?auto_228592 ) ) ( not ( = ?auto_228585 ?auto_228586 ) ) ( not ( = ?auto_228585 ?auto_228587 ) ) ( not ( = ?auto_228585 ?auto_228588 ) ) ( not ( = ?auto_228585 ?auto_228589 ) ) ( not ( = ?auto_228585 ?auto_228590 ) ) ( not ( = ?auto_228585 ?auto_228591 ) ) ( not ( = ?auto_228585 ?auto_228592 ) ) ( not ( = ?auto_228586 ?auto_228587 ) ) ( not ( = ?auto_228586 ?auto_228588 ) ) ( not ( = ?auto_228586 ?auto_228589 ) ) ( not ( = ?auto_228586 ?auto_228590 ) ) ( not ( = ?auto_228586 ?auto_228591 ) ) ( not ( = ?auto_228586 ?auto_228592 ) ) ( not ( = ?auto_228587 ?auto_228588 ) ) ( not ( = ?auto_228587 ?auto_228589 ) ) ( not ( = ?auto_228587 ?auto_228590 ) ) ( not ( = ?auto_228587 ?auto_228591 ) ) ( not ( = ?auto_228587 ?auto_228592 ) ) ( not ( = ?auto_228588 ?auto_228589 ) ) ( not ( = ?auto_228588 ?auto_228590 ) ) ( not ( = ?auto_228588 ?auto_228591 ) ) ( not ( = ?auto_228588 ?auto_228592 ) ) ( not ( = ?auto_228589 ?auto_228590 ) ) ( not ( = ?auto_228589 ?auto_228591 ) ) ( not ( = ?auto_228589 ?auto_228592 ) ) ( not ( = ?auto_228590 ?auto_228591 ) ) ( not ( = ?auto_228590 ?auto_228592 ) ) ( not ( = ?auto_228591 ?auto_228592 ) ) ( ON ?auto_228590 ?auto_228591 ) ( CLEAR ?auto_228588 ) ( ON ?auto_228589 ?auto_228590 ) ( CLEAR ?auto_228589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_228580 ?auto_228581 ?auto_228582 ?auto_228583 ?auto_228584 ?auto_228585 ?auto_228586 ?auto_228587 ?auto_228588 ?auto_228589 )
      ( MAKE-12PILE ?auto_228580 ?auto_228581 ?auto_228582 ?auto_228583 ?auto_228584 ?auto_228585 ?auto_228586 ?auto_228587 ?auto_228588 ?auto_228589 ?auto_228590 ?auto_228591 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228605 - BLOCK
      ?auto_228606 - BLOCK
      ?auto_228607 - BLOCK
      ?auto_228608 - BLOCK
      ?auto_228609 - BLOCK
      ?auto_228610 - BLOCK
      ?auto_228611 - BLOCK
      ?auto_228612 - BLOCK
      ?auto_228613 - BLOCK
      ?auto_228614 - BLOCK
      ?auto_228615 - BLOCK
      ?auto_228616 - BLOCK
    )
    :vars
    (
      ?auto_228617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228616 ?auto_228617 ) ( ON-TABLE ?auto_228605 ) ( ON ?auto_228606 ?auto_228605 ) ( ON ?auto_228607 ?auto_228606 ) ( ON ?auto_228608 ?auto_228607 ) ( ON ?auto_228609 ?auto_228608 ) ( ON ?auto_228610 ?auto_228609 ) ( ON ?auto_228611 ?auto_228610 ) ( ON ?auto_228612 ?auto_228611 ) ( ON ?auto_228613 ?auto_228612 ) ( not ( = ?auto_228605 ?auto_228606 ) ) ( not ( = ?auto_228605 ?auto_228607 ) ) ( not ( = ?auto_228605 ?auto_228608 ) ) ( not ( = ?auto_228605 ?auto_228609 ) ) ( not ( = ?auto_228605 ?auto_228610 ) ) ( not ( = ?auto_228605 ?auto_228611 ) ) ( not ( = ?auto_228605 ?auto_228612 ) ) ( not ( = ?auto_228605 ?auto_228613 ) ) ( not ( = ?auto_228605 ?auto_228614 ) ) ( not ( = ?auto_228605 ?auto_228615 ) ) ( not ( = ?auto_228605 ?auto_228616 ) ) ( not ( = ?auto_228605 ?auto_228617 ) ) ( not ( = ?auto_228606 ?auto_228607 ) ) ( not ( = ?auto_228606 ?auto_228608 ) ) ( not ( = ?auto_228606 ?auto_228609 ) ) ( not ( = ?auto_228606 ?auto_228610 ) ) ( not ( = ?auto_228606 ?auto_228611 ) ) ( not ( = ?auto_228606 ?auto_228612 ) ) ( not ( = ?auto_228606 ?auto_228613 ) ) ( not ( = ?auto_228606 ?auto_228614 ) ) ( not ( = ?auto_228606 ?auto_228615 ) ) ( not ( = ?auto_228606 ?auto_228616 ) ) ( not ( = ?auto_228606 ?auto_228617 ) ) ( not ( = ?auto_228607 ?auto_228608 ) ) ( not ( = ?auto_228607 ?auto_228609 ) ) ( not ( = ?auto_228607 ?auto_228610 ) ) ( not ( = ?auto_228607 ?auto_228611 ) ) ( not ( = ?auto_228607 ?auto_228612 ) ) ( not ( = ?auto_228607 ?auto_228613 ) ) ( not ( = ?auto_228607 ?auto_228614 ) ) ( not ( = ?auto_228607 ?auto_228615 ) ) ( not ( = ?auto_228607 ?auto_228616 ) ) ( not ( = ?auto_228607 ?auto_228617 ) ) ( not ( = ?auto_228608 ?auto_228609 ) ) ( not ( = ?auto_228608 ?auto_228610 ) ) ( not ( = ?auto_228608 ?auto_228611 ) ) ( not ( = ?auto_228608 ?auto_228612 ) ) ( not ( = ?auto_228608 ?auto_228613 ) ) ( not ( = ?auto_228608 ?auto_228614 ) ) ( not ( = ?auto_228608 ?auto_228615 ) ) ( not ( = ?auto_228608 ?auto_228616 ) ) ( not ( = ?auto_228608 ?auto_228617 ) ) ( not ( = ?auto_228609 ?auto_228610 ) ) ( not ( = ?auto_228609 ?auto_228611 ) ) ( not ( = ?auto_228609 ?auto_228612 ) ) ( not ( = ?auto_228609 ?auto_228613 ) ) ( not ( = ?auto_228609 ?auto_228614 ) ) ( not ( = ?auto_228609 ?auto_228615 ) ) ( not ( = ?auto_228609 ?auto_228616 ) ) ( not ( = ?auto_228609 ?auto_228617 ) ) ( not ( = ?auto_228610 ?auto_228611 ) ) ( not ( = ?auto_228610 ?auto_228612 ) ) ( not ( = ?auto_228610 ?auto_228613 ) ) ( not ( = ?auto_228610 ?auto_228614 ) ) ( not ( = ?auto_228610 ?auto_228615 ) ) ( not ( = ?auto_228610 ?auto_228616 ) ) ( not ( = ?auto_228610 ?auto_228617 ) ) ( not ( = ?auto_228611 ?auto_228612 ) ) ( not ( = ?auto_228611 ?auto_228613 ) ) ( not ( = ?auto_228611 ?auto_228614 ) ) ( not ( = ?auto_228611 ?auto_228615 ) ) ( not ( = ?auto_228611 ?auto_228616 ) ) ( not ( = ?auto_228611 ?auto_228617 ) ) ( not ( = ?auto_228612 ?auto_228613 ) ) ( not ( = ?auto_228612 ?auto_228614 ) ) ( not ( = ?auto_228612 ?auto_228615 ) ) ( not ( = ?auto_228612 ?auto_228616 ) ) ( not ( = ?auto_228612 ?auto_228617 ) ) ( not ( = ?auto_228613 ?auto_228614 ) ) ( not ( = ?auto_228613 ?auto_228615 ) ) ( not ( = ?auto_228613 ?auto_228616 ) ) ( not ( = ?auto_228613 ?auto_228617 ) ) ( not ( = ?auto_228614 ?auto_228615 ) ) ( not ( = ?auto_228614 ?auto_228616 ) ) ( not ( = ?auto_228614 ?auto_228617 ) ) ( not ( = ?auto_228615 ?auto_228616 ) ) ( not ( = ?auto_228615 ?auto_228617 ) ) ( not ( = ?auto_228616 ?auto_228617 ) ) ( ON ?auto_228615 ?auto_228616 ) ( CLEAR ?auto_228613 ) ( ON ?auto_228614 ?auto_228615 ) ( CLEAR ?auto_228614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_228605 ?auto_228606 ?auto_228607 ?auto_228608 ?auto_228609 ?auto_228610 ?auto_228611 ?auto_228612 ?auto_228613 ?auto_228614 )
      ( MAKE-12PILE ?auto_228605 ?auto_228606 ?auto_228607 ?auto_228608 ?auto_228609 ?auto_228610 ?auto_228611 ?auto_228612 ?auto_228613 ?auto_228614 ?auto_228615 ?auto_228616 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228630 - BLOCK
      ?auto_228631 - BLOCK
      ?auto_228632 - BLOCK
      ?auto_228633 - BLOCK
      ?auto_228634 - BLOCK
      ?auto_228635 - BLOCK
      ?auto_228636 - BLOCK
      ?auto_228637 - BLOCK
      ?auto_228638 - BLOCK
      ?auto_228639 - BLOCK
      ?auto_228640 - BLOCK
      ?auto_228641 - BLOCK
    )
    :vars
    (
      ?auto_228642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228641 ?auto_228642 ) ( ON-TABLE ?auto_228630 ) ( ON ?auto_228631 ?auto_228630 ) ( ON ?auto_228632 ?auto_228631 ) ( ON ?auto_228633 ?auto_228632 ) ( ON ?auto_228634 ?auto_228633 ) ( ON ?auto_228635 ?auto_228634 ) ( ON ?auto_228636 ?auto_228635 ) ( ON ?auto_228637 ?auto_228636 ) ( not ( = ?auto_228630 ?auto_228631 ) ) ( not ( = ?auto_228630 ?auto_228632 ) ) ( not ( = ?auto_228630 ?auto_228633 ) ) ( not ( = ?auto_228630 ?auto_228634 ) ) ( not ( = ?auto_228630 ?auto_228635 ) ) ( not ( = ?auto_228630 ?auto_228636 ) ) ( not ( = ?auto_228630 ?auto_228637 ) ) ( not ( = ?auto_228630 ?auto_228638 ) ) ( not ( = ?auto_228630 ?auto_228639 ) ) ( not ( = ?auto_228630 ?auto_228640 ) ) ( not ( = ?auto_228630 ?auto_228641 ) ) ( not ( = ?auto_228630 ?auto_228642 ) ) ( not ( = ?auto_228631 ?auto_228632 ) ) ( not ( = ?auto_228631 ?auto_228633 ) ) ( not ( = ?auto_228631 ?auto_228634 ) ) ( not ( = ?auto_228631 ?auto_228635 ) ) ( not ( = ?auto_228631 ?auto_228636 ) ) ( not ( = ?auto_228631 ?auto_228637 ) ) ( not ( = ?auto_228631 ?auto_228638 ) ) ( not ( = ?auto_228631 ?auto_228639 ) ) ( not ( = ?auto_228631 ?auto_228640 ) ) ( not ( = ?auto_228631 ?auto_228641 ) ) ( not ( = ?auto_228631 ?auto_228642 ) ) ( not ( = ?auto_228632 ?auto_228633 ) ) ( not ( = ?auto_228632 ?auto_228634 ) ) ( not ( = ?auto_228632 ?auto_228635 ) ) ( not ( = ?auto_228632 ?auto_228636 ) ) ( not ( = ?auto_228632 ?auto_228637 ) ) ( not ( = ?auto_228632 ?auto_228638 ) ) ( not ( = ?auto_228632 ?auto_228639 ) ) ( not ( = ?auto_228632 ?auto_228640 ) ) ( not ( = ?auto_228632 ?auto_228641 ) ) ( not ( = ?auto_228632 ?auto_228642 ) ) ( not ( = ?auto_228633 ?auto_228634 ) ) ( not ( = ?auto_228633 ?auto_228635 ) ) ( not ( = ?auto_228633 ?auto_228636 ) ) ( not ( = ?auto_228633 ?auto_228637 ) ) ( not ( = ?auto_228633 ?auto_228638 ) ) ( not ( = ?auto_228633 ?auto_228639 ) ) ( not ( = ?auto_228633 ?auto_228640 ) ) ( not ( = ?auto_228633 ?auto_228641 ) ) ( not ( = ?auto_228633 ?auto_228642 ) ) ( not ( = ?auto_228634 ?auto_228635 ) ) ( not ( = ?auto_228634 ?auto_228636 ) ) ( not ( = ?auto_228634 ?auto_228637 ) ) ( not ( = ?auto_228634 ?auto_228638 ) ) ( not ( = ?auto_228634 ?auto_228639 ) ) ( not ( = ?auto_228634 ?auto_228640 ) ) ( not ( = ?auto_228634 ?auto_228641 ) ) ( not ( = ?auto_228634 ?auto_228642 ) ) ( not ( = ?auto_228635 ?auto_228636 ) ) ( not ( = ?auto_228635 ?auto_228637 ) ) ( not ( = ?auto_228635 ?auto_228638 ) ) ( not ( = ?auto_228635 ?auto_228639 ) ) ( not ( = ?auto_228635 ?auto_228640 ) ) ( not ( = ?auto_228635 ?auto_228641 ) ) ( not ( = ?auto_228635 ?auto_228642 ) ) ( not ( = ?auto_228636 ?auto_228637 ) ) ( not ( = ?auto_228636 ?auto_228638 ) ) ( not ( = ?auto_228636 ?auto_228639 ) ) ( not ( = ?auto_228636 ?auto_228640 ) ) ( not ( = ?auto_228636 ?auto_228641 ) ) ( not ( = ?auto_228636 ?auto_228642 ) ) ( not ( = ?auto_228637 ?auto_228638 ) ) ( not ( = ?auto_228637 ?auto_228639 ) ) ( not ( = ?auto_228637 ?auto_228640 ) ) ( not ( = ?auto_228637 ?auto_228641 ) ) ( not ( = ?auto_228637 ?auto_228642 ) ) ( not ( = ?auto_228638 ?auto_228639 ) ) ( not ( = ?auto_228638 ?auto_228640 ) ) ( not ( = ?auto_228638 ?auto_228641 ) ) ( not ( = ?auto_228638 ?auto_228642 ) ) ( not ( = ?auto_228639 ?auto_228640 ) ) ( not ( = ?auto_228639 ?auto_228641 ) ) ( not ( = ?auto_228639 ?auto_228642 ) ) ( not ( = ?auto_228640 ?auto_228641 ) ) ( not ( = ?auto_228640 ?auto_228642 ) ) ( not ( = ?auto_228641 ?auto_228642 ) ) ( ON ?auto_228640 ?auto_228641 ) ( ON ?auto_228639 ?auto_228640 ) ( CLEAR ?auto_228637 ) ( ON ?auto_228638 ?auto_228639 ) ( CLEAR ?auto_228638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_228630 ?auto_228631 ?auto_228632 ?auto_228633 ?auto_228634 ?auto_228635 ?auto_228636 ?auto_228637 ?auto_228638 )
      ( MAKE-12PILE ?auto_228630 ?auto_228631 ?auto_228632 ?auto_228633 ?auto_228634 ?auto_228635 ?auto_228636 ?auto_228637 ?auto_228638 ?auto_228639 ?auto_228640 ?auto_228641 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228655 - BLOCK
      ?auto_228656 - BLOCK
      ?auto_228657 - BLOCK
      ?auto_228658 - BLOCK
      ?auto_228659 - BLOCK
      ?auto_228660 - BLOCK
      ?auto_228661 - BLOCK
      ?auto_228662 - BLOCK
      ?auto_228663 - BLOCK
      ?auto_228664 - BLOCK
      ?auto_228665 - BLOCK
      ?auto_228666 - BLOCK
    )
    :vars
    (
      ?auto_228667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228666 ?auto_228667 ) ( ON-TABLE ?auto_228655 ) ( ON ?auto_228656 ?auto_228655 ) ( ON ?auto_228657 ?auto_228656 ) ( ON ?auto_228658 ?auto_228657 ) ( ON ?auto_228659 ?auto_228658 ) ( ON ?auto_228660 ?auto_228659 ) ( ON ?auto_228661 ?auto_228660 ) ( ON ?auto_228662 ?auto_228661 ) ( not ( = ?auto_228655 ?auto_228656 ) ) ( not ( = ?auto_228655 ?auto_228657 ) ) ( not ( = ?auto_228655 ?auto_228658 ) ) ( not ( = ?auto_228655 ?auto_228659 ) ) ( not ( = ?auto_228655 ?auto_228660 ) ) ( not ( = ?auto_228655 ?auto_228661 ) ) ( not ( = ?auto_228655 ?auto_228662 ) ) ( not ( = ?auto_228655 ?auto_228663 ) ) ( not ( = ?auto_228655 ?auto_228664 ) ) ( not ( = ?auto_228655 ?auto_228665 ) ) ( not ( = ?auto_228655 ?auto_228666 ) ) ( not ( = ?auto_228655 ?auto_228667 ) ) ( not ( = ?auto_228656 ?auto_228657 ) ) ( not ( = ?auto_228656 ?auto_228658 ) ) ( not ( = ?auto_228656 ?auto_228659 ) ) ( not ( = ?auto_228656 ?auto_228660 ) ) ( not ( = ?auto_228656 ?auto_228661 ) ) ( not ( = ?auto_228656 ?auto_228662 ) ) ( not ( = ?auto_228656 ?auto_228663 ) ) ( not ( = ?auto_228656 ?auto_228664 ) ) ( not ( = ?auto_228656 ?auto_228665 ) ) ( not ( = ?auto_228656 ?auto_228666 ) ) ( not ( = ?auto_228656 ?auto_228667 ) ) ( not ( = ?auto_228657 ?auto_228658 ) ) ( not ( = ?auto_228657 ?auto_228659 ) ) ( not ( = ?auto_228657 ?auto_228660 ) ) ( not ( = ?auto_228657 ?auto_228661 ) ) ( not ( = ?auto_228657 ?auto_228662 ) ) ( not ( = ?auto_228657 ?auto_228663 ) ) ( not ( = ?auto_228657 ?auto_228664 ) ) ( not ( = ?auto_228657 ?auto_228665 ) ) ( not ( = ?auto_228657 ?auto_228666 ) ) ( not ( = ?auto_228657 ?auto_228667 ) ) ( not ( = ?auto_228658 ?auto_228659 ) ) ( not ( = ?auto_228658 ?auto_228660 ) ) ( not ( = ?auto_228658 ?auto_228661 ) ) ( not ( = ?auto_228658 ?auto_228662 ) ) ( not ( = ?auto_228658 ?auto_228663 ) ) ( not ( = ?auto_228658 ?auto_228664 ) ) ( not ( = ?auto_228658 ?auto_228665 ) ) ( not ( = ?auto_228658 ?auto_228666 ) ) ( not ( = ?auto_228658 ?auto_228667 ) ) ( not ( = ?auto_228659 ?auto_228660 ) ) ( not ( = ?auto_228659 ?auto_228661 ) ) ( not ( = ?auto_228659 ?auto_228662 ) ) ( not ( = ?auto_228659 ?auto_228663 ) ) ( not ( = ?auto_228659 ?auto_228664 ) ) ( not ( = ?auto_228659 ?auto_228665 ) ) ( not ( = ?auto_228659 ?auto_228666 ) ) ( not ( = ?auto_228659 ?auto_228667 ) ) ( not ( = ?auto_228660 ?auto_228661 ) ) ( not ( = ?auto_228660 ?auto_228662 ) ) ( not ( = ?auto_228660 ?auto_228663 ) ) ( not ( = ?auto_228660 ?auto_228664 ) ) ( not ( = ?auto_228660 ?auto_228665 ) ) ( not ( = ?auto_228660 ?auto_228666 ) ) ( not ( = ?auto_228660 ?auto_228667 ) ) ( not ( = ?auto_228661 ?auto_228662 ) ) ( not ( = ?auto_228661 ?auto_228663 ) ) ( not ( = ?auto_228661 ?auto_228664 ) ) ( not ( = ?auto_228661 ?auto_228665 ) ) ( not ( = ?auto_228661 ?auto_228666 ) ) ( not ( = ?auto_228661 ?auto_228667 ) ) ( not ( = ?auto_228662 ?auto_228663 ) ) ( not ( = ?auto_228662 ?auto_228664 ) ) ( not ( = ?auto_228662 ?auto_228665 ) ) ( not ( = ?auto_228662 ?auto_228666 ) ) ( not ( = ?auto_228662 ?auto_228667 ) ) ( not ( = ?auto_228663 ?auto_228664 ) ) ( not ( = ?auto_228663 ?auto_228665 ) ) ( not ( = ?auto_228663 ?auto_228666 ) ) ( not ( = ?auto_228663 ?auto_228667 ) ) ( not ( = ?auto_228664 ?auto_228665 ) ) ( not ( = ?auto_228664 ?auto_228666 ) ) ( not ( = ?auto_228664 ?auto_228667 ) ) ( not ( = ?auto_228665 ?auto_228666 ) ) ( not ( = ?auto_228665 ?auto_228667 ) ) ( not ( = ?auto_228666 ?auto_228667 ) ) ( ON ?auto_228665 ?auto_228666 ) ( ON ?auto_228664 ?auto_228665 ) ( CLEAR ?auto_228662 ) ( ON ?auto_228663 ?auto_228664 ) ( CLEAR ?auto_228663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_228655 ?auto_228656 ?auto_228657 ?auto_228658 ?auto_228659 ?auto_228660 ?auto_228661 ?auto_228662 ?auto_228663 )
      ( MAKE-12PILE ?auto_228655 ?auto_228656 ?auto_228657 ?auto_228658 ?auto_228659 ?auto_228660 ?auto_228661 ?auto_228662 ?auto_228663 ?auto_228664 ?auto_228665 ?auto_228666 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228680 - BLOCK
      ?auto_228681 - BLOCK
      ?auto_228682 - BLOCK
      ?auto_228683 - BLOCK
      ?auto_228684 - BLOCK
      ?auto_228685 - BLOCK
      ?auto_228686 - BLOCK
      ?auto_228687 - BLOCK
      ?auto_228688 - BLOCK
      ?auto_228689 - BLOCK
      ?auto_228690 - BLOCK
      ?auto_228691 - BLOCK
    )
    :vars
    (
      ?auto_228692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228691 ?auto_228692 ) ( ON-TABLE ?auto_228680 ) ( ON ?auto_228681 ?auto_228680 ) ( ON ?auto_228682 ?auto_228681 ) ( ON ?auto_228683 ?auto_228682 ) ( ON ?auto_228684 ?auto_228683 ) ( ON ?auto_228685 ?auto_228684 ) ( ON ?auto_228686 ?auto_228685 ) ( not ( = ?auto_228680 ?auto_228681 ) ) ( not ( = ?auto_228680 ?auto_228682 ) ) ( not ( = ?auto_228680 ?auto_228683 ) ) ( not ( = ?auto_228680 ?auto_228684 ) ) ( not ( = ?auto_228680 ?auto_228685 ) ) ( not ( = ?auto_228680 ?auto_228686 ) ) ( not ( = ?auto_228680 ?auto_228687 ) ) ( not ( = ?auto_228680 ?auto_228688 ) ) ( not ( = ?auto_228680 ?auto_228689 ) ) ( not ( = ?auto_228680 ?auto_228690 ) ) ( not ( = ?auto_228680 ?auto_228691 ) ) ( not ( = ?auto_228680 ?auto_228692 ) ) ( not ( = ?auto_228681 ?auto_228682 ) ) ( not ( = ?auto_228681 ?auto_228683 ) ) ( not ( = ?auto_228681 ?auto_228684 ) ) ( not ( = ?auto_228681 ?auto_228685 ) ) ( not ( = ?auto_228681 ?auto_228686 ) ) ( not ( = ?auto_228681 ?auto_228687 ) ) ( not ( = ?auto_228681 ?auto_228688 ) ) ( not ( = ?auto_228681 ?auto_228689 ) ) ( not ( = ?auto_228681 ?auto_228690 ) ) ( not ( = ?auto_228681 ?auto_228691 ) ) ( not ( = ?auto_228681 ?auto_228692 ) ) ( not ( = ?auto_228682 ?auto_228683 ) ) ( not ( = ?auto_228682 ?auto_228684 ) ) ( not ( = ?auto_228682 ?auto_228685 ) ) ( not ( = ?auto_228682 ?auto_228686 ) ) ( not ( = ?auto_228682 ?auto_228687 ) ) ( not ( = ?auto_228682 ?auto_228688 ) ) ( not ( = ?auto_228682 ?auto_228689 ) ) ( not ( = ?auto_228682 ?auto_228690 ) ) ( not ( = ?auto_228682 ?auto_228691 ) ) ( not ( = ?auto_228682 ?auto_228692 ) ) ( not ( = ?auto_228683 ?auto_228684 ) ) ( not ( = ?auto_228683 ?auto_228685 ) ) ( not ( = ?auto_228683 ?auto_228686 ) ) ( not ( = ?auto_228683 ?auto_228687 ) ) ( not ( = ?auto_228683 ?auto_228688 ) ) ( not ( = ?auto_228683 ?auto_228689 ) ) ( not ( = ?auto_228683 ?auto_228690 ) ) ( not ( = ?auto_228683 ?auto_228691 ) ) ( not ( = ?auto_228683 ?auto_228692 ) ) ( not ( = ?auto_228684 ?auto_228685 ) ) ( not ( = ?auto_228684 ?auto_228686 ) ) ( not ( = ?auto_228684 ?auto_228687 ) ) ( not ( = ?auto_228684 ?auto_228688 ) ) ( not ( = ?auto_228684 ?auto_228689 ) ) ( not ( = ?auto_228684 ?auto_228690 ) ) ( not ( = ?auto_228684 ?auto_228691 ) ) ( not ( = ?auto_228684 ?auto_228692 ) ) ( not ( = ?auto_228685 ?auto_228686 ) ) ( not ( = ?auto_228685 ?auto_228687 ) ) ( not ( = ?auto_228685 ?auto_228688 ) ) ( not ( = ?auto_228685 ?auto_228689 ) ) ( not ( = ?auto_228685 ?auto_228690 ) ) ( not ( = ?auto_228685 ?auto_228691 ) ) ( not ( = ?auto_228685 ?auto_228692 ) ) ( not ( = ?auto_228686 ?auto_228687 ) ) ( not ( = ?auto_228686 ?auto_228688 ) ) ( not ( = ?auto_228686 ?auto_228689 ) ) ( not ( = ?auto_228686 ?auto_228690 ) ) ( not ( = ?auto_228686 ?auto_228691 ) ) ( not ( = ?auto_228686 ?auto_228692 ) ) ( not ( = ?auto_228687 ?auto_228688 ) ) ( not ( = ?auto_228687 ?auto_228689 ) ) ( not ( = ?auto_228687 ?auto_228690 ) ) ( not ( = ?auto_228687 ?auto_228691 ) ) ( not ( = ?auto_228687 ?auto_228692 ) ) ( not ( = ?auto_228688 ?auto_228689 ) ) ( not ( = ?auto_228688 ?auto_228690 ) ) ( not ( = ?auto_228688 ?auto_228691 ) ) ( not ( = ?auto_228688 ?auto_228692 ) ) ( not ( = ?auto_228689 ?auto_228690 ) ) ( not ( = ?auto_228689 ?auto_228691 ) ) ( not ( = ?auto_228689 ?auto_228692 ) ) ( not ( = ?auto_228690 ?auto_228691 ) ) ( not ( = ?auto_228690 ?auto_228692 ) ) ( not ( = ?auto_228691 ?auto_228692 ) ) ( ON ?auto_228690 ?auto_228691 ) ( ON ?auto_228689 ?auto_228690 ) ( ON ?auto_228688 ?auto_228689 ) ( CLEAR ?auto_228686 ) ( ON ?auto_228687 ?auto_228688 ) ( CLEAR ?auto_228687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_228680 ?auto_228681 ?auto_228682 ?auto_228683 ?auto_228684 ?auto_228685 ?auto_228686 ?auto_228687 )
      ( MAKE-12PILE ?auto_228680 ?auto_228681 ?auto_228682 ?auto_228683 ?auto_228684 ?auto_228685 ?auto_228686 ?auto_228687 ?auto_228688 ?auto_228689 ?auto_228690 ?auto_228691 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228705 - BLOCK
      ?auto_228706 - BLOCK
      ?auto_228707 - BLOCK
      ?auto_228708 - BLOCK
      ?auto_228709 - BLOCK
      ?auto_228710 - BLOCK
      ?auto_228711 - BLOCK
      ?auto_228712 - BLOCK
      ?auto_228713 - BLOCK
      ?auto_228714 - BLOCK
      ?auto_228715 - BLOCK
      ?auto_228716 - BLOCK
    )
    :vars
    (
      ?auto_228717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228716 ?auto_228717 ) ( ON-TABLE ?auto_228705 ) ( ON ?auto_228706 ?auto_228705 ) ( ON ?auto_228707 ?auto_228706 ) ( ON ?auto_228708 ?auto_228707 ) ( ON ?auto_228709 ?auto_228708 ) ( ON ?auto_228710 ?auto_228709 ) ( ON ?auto_228711 ?auto_228710 ) ( not ( = ?auto_228705 ?auto_228706 ) ) ( not ( = ?auto_228705 ?auto_228707 ) ) ( not ( = ?auto_228705 ?auto_228708 ) ) ( not ( = ?auto_228705 ?auto_228709 ) ) ( not ( = ?auto_228705 ?auto_228710 ) ) ( not ( = ?auto_228705 ?auto_228711 ) ) ( not ( = ?auto_228705 ?auto_228712 ) ) ( not ( = ?auto_228705 ?auto_228713 ) ) ( not ( = ?auto_228705 ?auto_228714 ) ) ( not ( = ?auto_228705 ?auto_228715 ) ) ( not ( = ?auto_228705 ?auto_228716 ) ) ( not ( = ?auto_228705 ?auto_228717 ) ) ( not ( = ?auto_228706 ?auto_228707 ) ) ( not ( = ?auto_228706 ?auto_228708 ) ) ( not ( = ?auto_228706 ?auto_228709 ) ) ( not ( = ?auto_228706 ?auto_228710 ) ) ( not ( = ?auto_228706 ?auto_228711 ) ) ( not ( = ?auto_228706 ?auto_228712 ) ) ( not ( = ?auto_228706 ?auto_228713 ) ) ( not ( = ?auto_228706 ?auto_228714 ) ) ( not ( = ?auto_228706 ?auto_228715 ) ) ( not ( = ?auto_228706 ?auto_228716 ) ) ( not ( = ?auto_228706 ?auto_228717 ) ) ( not ( = ?auto_228707 ?auto_228708 ) ) ( not ( = ?auto_228707 ?auto_228709 ) ) ( not ( = ?auto_228707 ?auto_228710 ) ) ( not ( = ?auto_228707 ?auto_228711 ) ) ( not ( = ?auto_228707 ?auto_228712 ) ) ( not ( = ?auto_228707 ?auto_228713 ) ) ( not ( = ?auto_228707 ?auto_228714 ) ) ( not ( = ?auto_228707 ?auto_228715 ) ) ( not ( = ?auto_228707 ?auto_228716 ) ) ( not ( = ?auto_228707 ?auto_228717 ) ) ( not ( = ?auto_228708 ?auto_228709 ) ) ( not ( = ?auto_228708 ?auto_228710 ) ) ( not ( = ?auto_228708 ?auto_228711 ) ) ( not ( = ?auto_228708 ?auto_228712 ) ) ( not ( = ?auto_228708 ?auto_228713 ) ) ( not ( = ?auto_228708 ?auto_228714 ) ) ( not ( = ?auto_228708 ?auto_228715 ) ) ( not ( = ?auto_228708 ?auto_228716 ) ) ( not ( = ?auto_228708 ?auto_228717 ) ) ( not ( = ?auto_228709 ?auto_228710 ) ) ( not ( = ?auto_228709 ?auto_228711 ) ) ( not ( = ?auto_228709 ?auto_228712 ) ) ( not ( = ?auto_228709 ?auto_228713 ) ) ( not ( = ?auto_228709 ?auto_228714 ) ) ( not ( = ?auto_228709 ?auto_228715 ) ) ( not ( = ?auto_228709 ?auto_228716 ) ) ( not ( = ?auto_228709 ?auto_228717 ) ) ( not ( = ?auto_228710 ?auto_228711 ) ) ( not ( = ?auto_228710 ?auto_228712 ) ) ( not ( = ?auto_228710 ?auto_228713 ) ) ( not ( = ?auto_228710 ?auto_228714 ) ) ( not ( = ?auto_228710 ?auto_228715 ) ) ( not ( = ?auto_228710 ?auto_228716 ) ) ( not ( = ?auto_228710 ?auto_228717 ) ) ( not ( = ?auto_228711 ?auto_228712 ) ) ( not ( = ?auto_228711 ?auto_228713 ) ) ( not ( = ?auto_228711 ?auto_228714 ) ) ( not ( = ?auto_228711 ?auto_228715 ) ) ( not ( = ?auto_228711 ?auto_228716 ) ) ( not ( = ?auto_228711 ?auto_228717 ) ) ( not ( = ?auto_228712 ?auto_228713 ) ) ( not ( = ?auto_228712 ?auto_228714 ) ) ( not ( = ?auto_228712 ?auto_228715 ) ) ( not ( = ?auto_228712 ?auto_228716 ) ) ( not ( = ?auto_228712 ?auto_228717 ) ) ( not ( = ?auto_228713 ?auto_228714 ) ) ( not ( = ?auto_228713 ?auto_228715 ) ) ( not ( = ?auto_228713 ?auto_228716 ) ) ( not ( = ?auto_228713 ?auto_228717 ) ) ( not ( = ?auto_228714 ?auto_228715 ) ) ( not ( = ?auto_228714 ?auto_228716 ) ) ( not ( = ?auto_228714 ?auto_228717 ) ) ( not ( = ?auto_228715 ?auto_228716 ) ) ( not ( = ?auto_228715 ?auto_228717 ) ) ( not ( = ?auto_228716 ?auto_228717 ) ) ( ON ?auto_228715 ?auto_228716 ) ( ON ?auto_228714 ?auto_228715 ) ( ON ?auto_228713 ?auto_228714 ) ( CLEAR ?auto_228711 ) ( ON ?auto_228712 ?auto_228713 ) ( CLEAR ?auto_228712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_228705 ?auto_228706 ?auto_228707 ?auto_228708 ?auto_228709 ?auto_228710 ?auto_228711 ?auto_228712 )
      ( MAKE-12PILE ?auto_228705 ?auto_228706 ?auto_228707 ?auto_228708 ?auto_228709 ?auto_228710 ?auto_228711 ?auto_228712 ?auto_228713 ?auto_228714 ?auto_228715 ?auto_228716 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228730 - BLOCK
      ?auto_228731 - BLOCK
      ?auto_228732 - BLOCK
      ?auto_228733 - BLOCK
      ?auto_228734 - BLOCK
      ?auto_228735 - BLOCK
      ?auto_228736 - BLOCK
      ?auto_228737 - BLOCK
      ?auto_228738 - BLOCK
      ?auto_228739 - BLOCK
      ?auto_228740 - BLOCK
      ?auto_228741 - BLOCK
    )
    :vars
    (
      ?auto_228742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228741 ?auto_228742 ) ( ON-TABLE ?auto_228730 ) ( ON ?auto_228731 ?auto_228730 ) ( ON ?auto_228732 ?auto_228731 ) ( ON ?auto_228733 ?auto_228732 ) ( ON ?auto_228734 ?auto_228733 ) ( ON ?auto_228735 ?auto_228734 ) ( not ( = ?auto_228730 ?auto_228731 ) ) ( not ( = ?auto_228730 ?auto_228732 ) ) ( not ( = ?auto_228730 ?auto_228733 ) ) ( not ( = ?auto_228730 ?auto_228734 ) ) ( not ( = ?auto_228730 ?auto_228735 ) ) ( not ( = ?auto_228730 ?auto_228736 ) ) ( not ( = ?auto_228730 ?auto_228737 ) ) ( not ( = ?auto_228730 ?auto_228738 ) ) ( not ( = ?auto_228730 ?auto_228739 ) ) ( not ( = ?auto_228730 ?auto_228740 ) ) ( not ( = ?auto_228730 ?auto_228741 ) ) ( not ( = ?auto_228730 ?auto_228742 ) ) ( not ( = ?auto_228731 ?auto_228732 ) ) ( not ( = ?auto_228731 ?auto_228733 ) ) ( not ( = ?auto_228731 ?auto_228734 ) ) ( not ( = ?auto_228731 ?auto_228735 ) ) ( not ( = ?auto_228731 ?auto_228736 ) ) ( not ( = ?auto_228731 ?auto_228737 ) ) ( not ( = ?auto_228731 ?auto_228738 ) ) ( not ( = ?auto_228731 ?auto_228739 ) ) ( not ( = ?auto_228731 ?auto_228740 ) ) ( not ( = ?auto_228731 ?auto_228741 ) ) ( not ( = ?auto_228731 ?auto_228742 ) ) ( not ( = ?auto_228732 ?auto_228733 ) ) ( not ( = ?auto_228732 ?auto_228734 ) ) ( not ( = ?auto_228732 ?auto_228735 ) ) ( not ( = ?auto_228732 ?auto_228736 ) ) ( not ( = ?auto_228732 ?auto_228737 ) ) ( not ( = ?auto_228732 ?auto_228738 ) ) ( not ( = ?auto_228732 ?auto_228739 ) ) ( not ( = ?auto_228732 ?auto_228740 ) ) ( not ( = ?auto_228732 ?auto_228741 ) ) ( not ( = ?auto_228732 ?auto_228742 ) ) ( not ( = ?auto_228733 ?auto_228734 ) ) ( not ( = ?auto_228733 ?auto_228735 ) ) ( not ( = ?auto_228733 ?auto_228736 ) ) ( not ( = ?auto_228733 ?auto_228737 ) ) ( not ( = ?auto_228733 ?auto_228738 ) ) ( not ( = ?auto_228733 ?auto_228739 ) ) ( not ( = ?auto_228733 ?auto_228740 ) ) ( not ( = ?auto_228733 ?auto_228741 ) ) ( not ( = ?auto_228733 ?auto_228742 ) ) ( not ( = ?auto_228734 ?auto_228735 ) ) ( not ( = ?auto_228734 ?auto_228736 ) ) ( not ( = ?auto_228734 ?auto_228737 ) ) ( not ( = ?auto_228734 ?auto_228738 ) ) ( not ( = ?auto_228734 ?auto_228739 ) ) ( not ( = ?auto_228734 ?auto_228740 ) ) ( not ( = ?auto_228734 ?auto_228741 ) ) ( not ( = ?auto_228734 ?auto_228742 ) ) ( not ( = ?auto_228735 ?auto_228736 ) ) ( not ( = ?auto_228735 ?auto_228737 ) ) ( not ( = ?auto_228735 ?auto_228738 ) ) ( not ( = ?auto_228735 ?auto_228739 ) ) ( not ( = ?auto_228735 ?auto_228740 ) ) ( not ( = ?auto_228735 ?auto_228741 ) ) ( not ( = ?auto_228735 ?auto_228742 ) ) ( not ( = ?auto_228736 ?auto_228737 ) ) ( not ( = ?auto_228736 ?auto_228738 ) ) ( not ( = ?auto_228736 ?auto_228739 ) ) ( not ( = ?auto_228736 ?auto_228740 ) ) ( not ( = ?auto_228736 ?auto_228741 ) ) ( not ( = ?auto_228736 ?auto_228742 ) ) ( not ( = ?auto_228737 ?auto_228738 ) ) ( not ( = ?auto_228737 ?auto_228739 ) ) ( not ( = ?auto_228737 ?auto_228740 ) ) ( not ( = ?auto_228737 ?auto_228741 ) ) ( not ( = ?auto_228737 ?auto_228742 ) ) ( not ( = ?auto_228738 ?auto_228739 ) ) ( not ( = ?auto_228738 ?auto_228740 ) ) ( not ( = ?auto_228738 ?auto_228741 ) ) ( not ( = ?auto_228738 ?auto_228742 ) ) ( not ( = ?auto_228739 ?auto_228740 ) ) ( not ( = ?auto_228739 ?auto_228741 ) ) ( not ( = ?auto_228739 ?auto_228742 ) ) ( not ( = ?auto_228740 ?auto_228741 ) ) ( not ( = ?auto_228740 ?auto_228742 ) ) ( not ( = ?auto_228741 ?auto_228742 ) ) ( ON ?auto_228740 ?auto_228741 ) ( ON ?auto_228739 ?auto_228740 ) ( ON ?auto_228738 ?auto_228739 ) ( ON ?auto_228737 ?auto_228738 ) ( CLEAR ?auto_228735 ) ( ON ?auto_228736 ?auto_228737 ) ( CLEAR ?auto_228736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_228730 ?auto_228731 ?auto_228732 ?auto_228733 ?auto_228734 ?auto_228735 ?auto_228736 )
      ( MAKE-12PILE ?auto_228730 ?auto_228731 ?auto_228732 ?auto_228733 ?auto_228734 ?auto_228735 ?auto_228736 ?auto_228737 ?auto_228738 ?auto_228739 ?auto_228740 ?auto_228741 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228755 - BLOCK
      ?auto_228756 - BLOCK
      ?auto_228757 - BLOCK
      ?auto_228758 - BLOCK
      ?auto_228759 - BLOCK
      ?auto_228760 - BLOCK
      ?auto_228761 - BLOCK
      ?auto_228762 - BLOCK
      ?auto_228763 - BLOCK
      ?auto_228764 - BLOCK
      ?auto_228765 - BLOCK
      ?auto_228766 - BLOCK
    )
    :vars
    (
      ?auto_228767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228766 ?auto_228767 ) ( ON-TABLE ?auto_228755 ) ( ON ?auto_228756 ?auto_228755 ) ( ON ?auto_228757 ?auto_228756 ) ( ON ?auto_228758 ?auto_228757 ) ( ON ?auto_228759 ?auto_228758 ) ( ON ?auto_228760 ?auto_228759 ) ( not ( = ?auto_228755 ?auto_228756 ) ) ( not ( = ?auto_228755 ?auto_228757 ) ) ( not ( = ?auto_228755 ?auto_228758 ) ) ( not ( = ?auto_228755 ?auto_228759 ) ) ( not ( = ?auto_228755 ?auto_228760 ) ) ( not ( = ?auto_228755 ?auto_228761 ) ) ( not ( = ?auto_228755 ?auto_228762 ) ) ( not ( = ?auto_228755 ?auto_228763 ) ) ( not ( = ?auto_228755 ?auto_228764 ) ) ( not ( = ?auto_228755 ?auto_228765 ) ) ( not ( = ?auto_228755 ?auto_228766 ) ) ( not ( = ?auto_228755 ?auto_228767 ) ) ( not ( = ?auto_228756 ?auto_228757 ) ) ( not ( = ?auto_228756 ?auto_228758 ) ) ( not ( = ?auto_228756 ?auto_228759 ) ) ( not ( = ?auto_228756 ?auto_228760 ) ) ( not ( = ?auto_228756 ?auto_228761 ) ) ( not ( = ?auto_228756 ?auto_228762 ) ) ( not ( = ?auto_228756 ?auto_228763 ) ) ( not ( = ?auto_228756 ?auto_228764 ) ) ( not ( = ?auto_228756 ?auto_228765 ) ) ( not ( = ?auto_228756 ?auto_228766 ) ) ( not ( = ?auto_228756 ?auto_228767 ) ) ( not ( = ?auto_228757 ?auto_228758 ) ) ( not ( = ?auto_228757 ?auto_228759 ) ) ( not ( = ?auto_228757 ?auto_228760 ) ) ( not ( = ?auto_228757 ?auto_228761 ) ) ( not ( = ?auto_228757 ?auto_228762 ) ) ( not ( = ?auto_228757 ?auto_228763 ) ) ( not ( = ?auto_228757 ?auto_228764 ) ) ( not ( = ?auto_228757 ?auto_228765 ) ) ( not ( = ?auto_228757 ?auto_228766 ) ) ( not ( = ?auto_228757 ?auto_228767 ) ) ( not ( = ?auto_228758 ?auto_228759 ) ) ( not ( = ?auto_228758 ?auto_228760 ) ) ( not ( = ?auto_228758 ?auto_228761 ) ) ( not ( = ?auto_228758 ?auto_228762 ) ) ( not ( = ?auto_228758 ?auto_228763 ) ) ( not ( = ?auto_228758 ?auto_228764 ) ) ( not ( = ?auto_228758 ?auto_228765 ) ) ( not ( = ?auto_228758 ?auto_228766 ) ) ( not ( = ?auto_228758 ?auto_228767 ) ) ( not ( = ?auto_228759 ?auto_228760 ) ) ( not ( = ?auto_228759 ?auto_228761 ) ) ( not ( = ?auto_228759 ?auto_228762 ) ) ( not ( = ?auto_228759 ?auto_228763 ) ) ( not ( = ?auto_228759 ?auto_228764 ) ) ( not ( = ?auto_228759 ?auto_228765 ) ) ( not ( = ?auto_228759 ?auto_228766 ) ) ( not ( = ?auto_228759 ?auto_228767 ) ) ( not ( = ?auto_228760 ?auto_228761 ) ) ( not ( = ?auto_228760 ?auto_228762 ) ) ( not ( = ?auto_228760 ?auto_228763 ) ) ( not ( = ?auto_228760 ?auto_228764 ) ) ( not ( = ?auto_228760 ?auto_228765 ) ) ( not ( = ?auto_228760 ?auto_228766 ) ) ( not ( = ?auto_228760 ?auto_228767 ) ) ( not ( = ?auto_228761 ?auto_228762 ) ) ( not ( = ?auto_228761 ?auto_228763 ) ) ( not ( = ?auto_228761 ?auto_228764 ) ) ( not ( = ?auto_228761 ?auto_228765 ) ) ( not ( = ?auto_228761 ?auto_228766 ) ) ( not ( = ?auto_228761 ?auto_228767 ) ) ( not ( = ?auto_228762 ?auto_228763 ) ) ( not ( = ?auto_228762 ?auto_228764 ) ) ( not ( = ?auto_228762 ?auto_228765 ) ) ( not ( = ?auto_228762 ?auto_228766 ) ) ( not ( = ?auto_228762 ?auto_228767 ) ) ( not ( = ?auto_228763 ?auto_228764 ) ) ( not ( = ?auto_228763 ?auto_228765 ) ) ( not ( = ?auto_228763 ?auto_228766 ) ) ( not ( = ?auto_228763 ?auto_228767 ) ) ( not ( = ?auto_228764 ?auto_228765 ) ) ( not ( = ?auto_228764 ?auto_228766 ) ) ( not ( = ?auto_228764 ?auto_228767 ) ) ( not ( = ?auto_228765 ?auto_228766 ) ) ( not ( = ?auto_228765 ?auto_228767 ) ) ( not ( = ?auto_228766 ?auto_228767 ) ) ( ON ?auto_228765 ?auto_228766 ) ( ON ?auto_228764 ?auto_228765 ) ( ON ?auto_228763 ?auto_228764 ) ( ON ?auto_228762 ?auto_228763 ) ( CLEAR ?auto_228760 ) ( ON ?auto_228761 ?auto_228762 ) ( CLEAR ?auto_228761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_228755 ?auto_228756 ?auto_228757 ?auto_228758 ?auto_228759 ?auto_228760 ?auto_228761 )
      ( MAKE-12PILE ?auto_228755 ?auto_228756 ?auto_228757 ?auto_228758 ?auto_228759 ?auto_228760 ?auto_228761 ?auto_228762 ?auto_228763 ?auto_228764 ?auto_228765 ?auto_228766 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228780 - BLOCK
      ?auto_228781 - BLOCK
      ?auto_228782 - BLOCK
      ?auto_228783 - BLOCK
      ?auto_228784 - BLOCK
      ?auto_228785 - BLOCK
      ?auto_228786 - BLOCK
      ?auto_228787 - BLOCK
      ?auto_228788 - BLOCK
      ?auto_228789 - BLOCK
      ?auto_228790 - BLOCK
      ?auto_228791 - BLOCK
    )
    :vars
    (
      ?auto_228792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228791 ?auto_228792 ) ( ON-TABLE ?auto_228780 ) ( ON ?auto_228781 ?auto_228780 ) ( ON ?auto_228782 ?auto_228781 ) ( ON ?auto_228783 ?auto_228782 ) ( ON ?auto_228784 ?auto_228783 ) ( not ( = ?auto_228780 ?auto_228781 ) ) ( not ( = ?auto_228780 ?auto_228782 ) ) ( not ( = ?auto_228780 ?auto_228783 ) ) ( not ( = ?auto_228780 ?auto_228784 ) ) ( not ( = ?auto_228780 ?auto_228785 ) ) ( not ( = ?auto_228780 ?auto_228786 ) ) ( not ( = ?auto_228780 ?auto_228787 ) ) ( not ( = ?auto_228780 ?auto_228788 ) ) ( not ( = ?auto_228780 ?auto_228789 ) ) ( not ( = ?auto_228780 ?auto_228790 ) ) ( not ( = ?auto_228780 ?auto_228791 ) ) ( not ( = ?auto_228780 ?auto_228792 ) ) ( not ( = ?auto_228781 ?auto_228782 ) ) ( not ( = ?auto_228781 ?auto_228783 ) ) ( not ( = ?auto_228781 ?auto_228784 ) ) ( not ( = ?auto_228781 ?auto_228785 ) ) ( not ( = ?auto_228781 ?auto_228786 ) ) ( not ( = ?auto_228781 ?auto_228787 ) ) ( not ( = ?auto_228781 ?auto_228788 ) ) ( not ( = ?auto_228781 ?auto_228789 ) ) ( not ( = ?auto_228781 ?auto_228790 ) ) ( not ( = ?auto_228781 ?auto_228791 ) ) ( not ( = ?auto_228781 ?auto_228792 ) ) ( not ( = ?auto_228782 ?auto_228783 ) ) ( not ( = ?auto_228782 ?auto_228784 ) ) ( not ( = ?auto_228782 ?auto_228785 ) ) ( not ( = ?auto_228782 ?auto_228786 ) ) ( not ( = ?auto_228782 ?auto_228787 ) ) ( not ( = ?auto_228782 ?auto_228788 ) ) ( not ( = ?auto_228782 ?auto_228789 ) ) ( not ( = ?auto_228782 ?auto_228790 ) ) ( not ( = ?auto_228782 ?auto_228791 ) ) ( not ( = ?auto_228782 ?auto_228792 ) ) ( not ( = ?auto_228783 ?auto_228784 ) ) ( not ( = ?auto_228783 ?auto_228785 ) ) ( not ( = ?auto_228783 ?auto_228786 ) ) ( not ( = ?auto_228783 ?auto_228787 ) ) ( not ( = ?auto_228783 ?auto_228788 ) ) ( not ( = ?auto_228783 ?auto_228789 ) ) ( not ( = ?auto_228783 ?auto_228790 ) ) ( not ( = ?auto_228783 ?auto_228791 ) ) ( not ( = ?auto_228783 ?auto_228792 ) ) ( not ( = ?auto_228784 ?auto_228785 ) ) ( not ( = ?auto_228784 ?auto_228786 ) ) ( not ( = ?auto_228784 ?auto_228787 ) ) ( not ( = ?auto_228784 ?auto_228788 ) ) ( not ( = ?auto_228784 ?auto_228789 ) ) ( not ( = ?auto_228784 ?auto_228790 ) ) ( not ( = ?auto_228784 ?auto_228791 ) ) ( not ( = ?auto_228784 ?auto_228792 ) ) ( not ( = ?auto_228785 ?auto_228786 ) ) ( not ( = ?auto_228785 ?auto_228787 ) ) ( not ( = ?auto_228785 ?auto_228788 ) ) ( not ( = ?auto_228785 ?auto_228789 ) ) ( not ( = ?auto_228785 ?auto_228790 ) ) ( not ( = ?auto_228785 ?auto_228791 ) ) ( not ( = ?auto_228785 ?auto_228792 ) ) ( not ( = ?auto_228786 ?auto_228787 ) ) ( not ( = ?auto_228786 ?auto_228788 ) ) ( not ( = ?auto_228786 ?auto_228789 ) ) ( not ( = ?auto_228786 ?auto_228790 ) ) ( not ( = ?auto_228786 ?auto_228791 ) ) ( not ( = ?auto_228786 ?auto_228792 ) ) ( not ( = ?auto_228787 ?auto_228788 ) ) ( not ( = ?auto_228787 ?auto_228789 ) ) ( not ( = ?auto_228787 ?auto_228790 ) ) ( not ( = ?auto_228787 ?auto_228791 ) ) ( not ( = ?auto_228787 ?auto_228792 ) ) ( not ( = ?auto_228788 ?auto_228789 ) ) ( not ( = ?auto_228788 ?auto_228790 ) ) ( not ( = ?auto_228788 ?auto_228791 ) ) ( not ( = ?auto_228788 ?auto_228792 ) ) ( not ( = ?auto_228789 ?auto_228790 ) ) ( not ( = ?auto_228789 ?auto_228791 ) ) ( not ( = ?auto_228789 ?auto_228792 ) ) ( not ( = ?auto_228790 ?auto_228791 ) ) ( not ( = ?auto_228790 ?auto_228792 ) ) ( not ( = ?auto_228791 ?auto_228792 ) ) ( ON ?auto_228790 ?auto_228791 ) ( ON ?auto_228789 ?auto_228790 ) ( ON ?auto_228788 ?auto_228789 ) ( ON ?auto_228787 ?auto_228788 ) ( ON ?auto_228786 ?auto_228787 ) ( CLEAR ?auto_228784 ) ( ON ?auto_228785 ?auto_228786 ) ( CLEAR ?auto_228785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_228780 ?auto_228781 ?auto_228782 ?auto_228783 ?auto_228784 ?auto_228785 )
      ( MAKE-12PILE ?auto_228780 ?auto_228781 ?auto_228782 ?auto_228783 ?auto_228784 ?auto_228785 ?auto_228786 ?auto_228787 ?auto_228788 ?auto_228789 ?auto_228790 ?auto_228791 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228805 - BLOCK
      ?auto_228806 - BLOCK
      ?auto_228807 - BLOCK
      ?auto_228808 - BLOCK
      ?auto_228809 - BLOCK
      ?auto_228810 - BLOCK
      ?auto_228811 - BLOCK
      ?auto_228812 - BLOCK
      ?auto_228813 - BLOCK
      ?auto_228814 - BLOCK
      ?auto_228815 - BLOCK
      ?auto_228816 - BLOCK
    )
    :vars
    (
      ?auto_228817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228816 ?auto_228817 ) ( ON-TABLE ?auto_228805 ) ( ON ?auto_228806 ?auto_228805 ) ( ON ?auto_228807 ?auto_228806 ) ( ON ?auto_228808 ?auto_228807 ) ( ON ?auto_228809 ?auto_228808 ) ( not ( = ?auto_228805 ?auto_228806 ) ) ( not ( = ?auto_228805 ?auto_228807 ) ) ( not ( = ?auto_228805 ?auto_228808 ) ) ( not ( = ?auto_228805 ?auto_228809 ) ) ( not ( = ?auto_228805 ?auto_228810 ) ) ( not ( = ?auto_228805 ?auto_228811 ) ) ( not ( = ?auto_228805 ?auto_228812 ) ) ( not ( = ?auto_228805 ?auto_228813 ) ) ( not ( = ?auto_228805 ?auto_228814 ) ) ( not ( = ?auto_228805 ?auto_228815 ) ) ( not ( = ?auto_228805 ?auto_228816 ) ) ( not ( = ?auto_228805 ?auto_228817 ) ) ( not ( = ?auto_228806 ?auto_228807 ) ) ( not ( = ?auto_228806 ?auto_228808 ) ) ( not ( = ?auto_228806 ?auto_228809 ) ) ( not ( = ?auto_228806 ?auto_228810 ) ) ( not ( = ?auto_228806 ?auto_228811 ) ) ( not ( = ?auto_228806 ?auto_228812 ) ) ( not ( = ?auto_228806 ?auto_228813 ) ) ( not ( = ?auto_228806 ?auto_228814 ) ) ( not ( = ?auto_228806 ?auto_228815 ) ) ( not ( = ?auto_228806 ?auto_228816 ) ) ( not ( = ?auto_228806 ?auto_228817 ) ) ( not ( = ?auto_228807 ?auto_228808 ) ) ( not ( = ?auto_228807 ?auto_228809 ) ) ( not ( = ?auto_228807 ?auto_228810 ) ) ( not ( = ?auto_228807 ?auto_228811 ) ) ( not ( = ?auto_228807 ?auto_228812 ) ) ( not ( = ?auto_228807 ?auto_228813 ) ) ( not ( = ?auto_228807 ?auto_228814 ) ) ( not ( = ?auto_228807 ?auto_228815 ) ) ( not ( = ?auto_228807 ?auto_228816 ) ) ( not ( = ?auto_228807 ?auto_228817 ) ) ( not ( = ?auto_228808 ?auto_228809 ) ) ( not ( = ?auto_228808 ?auto_228810 ) ) ( not ( = ?auto_228808 ?auto_228811 ) ) ( not ( = ?auto_228808 ?auto_228812 ) ) ( not ( = ?auto_228808 ?auto_228813 ) ) ( not ( = ?auto_228808 ?auto_228814 ) ) ( not ( = ?auto_228808 ?auto_228815 ) ) ( not ( = ?auto_228808 ?auto_228816 ) ) ( not ( = ?auto_228808 ?auto_228817 ) ) ( not ( = ?auto_228809 ?auto_228810 ) ) ( not ( = ?auto_228809 ?auto_228811 ) ) ( not ( = ?auto_228809 ?auto_228812 ) ) ( not ( = ?auto_228809 ?auto_228813 ) ) ( not ( = ?auto_228809 ?auto_228814 ) ) ( not ( = ?auto_228809 ?auto_228815 ) ) ( not ( = ?auto_228809 ?auto_228816 ) ) ( not ( = ?auto_228809 ?auto_228817 ) ) ( not ( = ?auto_228810 ?auto_228811 ) ) ( not ( = ?auto_228810 ?auto_228812 ) ) ( not ( = ?auto_228810 ?auto_228813 ) ) ( not ( = ?auto_228810 ?auto_228814 ) ) ( not ( = ?auto_228810 ?auto_228815 ) ) ( not ( = ?auto_228810 ?auto_228816 ) ) ( not ( = ?auto_228810 ?auto_228817 ) ) ( not ( = ?auto_228811 ?auto_228812 ) ) ( not ( = ?auto_228811 ?auto_228813 ) ) ( not ( = ?auto_228811 ?auto_228814 ) ) ( not ( = ?auto_228811 ?auto_228815 ) ) ( not ( = ?auto_228811 ?auto_228816 ) ) ( not ( = ?auto_228811 ?auto_228817 ) ) ( not ( = ?auto_228812 ?auto_228813 ) ) ( not ( = ?auto_228812 ?auto_228814 ) ) ( not ( = ?auto_228812 ?auto_228815 ) ) ( not ( = ?auto_228812 ?auto_228816 ) ) ( not ( = ?auto_228812 ?auto_228817 ) ) ( not ( = ?auto_228813 ?auto_228814 ) ) ( not ( = ?auto_228813 ?auto_228815 ) ) ( not ( = ?auto_228813 ?auto_228816 ) ) ( not ( = ?auto_228813 ?auto_228817 ) ) ( not ( = ?auto_228814 ?auto_228815 ) ) ( not ( = ?auto_228814 ?auto_228816 ) ) ( not ( = ?auto_228814 ?auto_228817 ) ) ( not ( = ?auto_228815 ?auto_228816 ) ) ( not ( = ?auto_228815 ?auto_228817 ) ) ( not ( = ?auto_228816 ?auto_228817 ) ) ( ON ?auto_228815 ?auto_228816 ) ( ON ?auto_228814 ?auto_228815 ) ( ON ?auto_228813 ?auto_228814 ) ( ON ?auto_228812 ?auto_228813 ) ( ON ?auto_228811 ?auto_228812 ) ( CLEAR ?auto_228809 ) ( ON ?auto_228810 ?auto_228811 ) ( CLEAR ?auto_228810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_228805 ?auto_228806 ?auto_228807 ?auto_228808 ?auto_228809 ?auto_228810 )
      ( MAKE-12PILE ?auto_228805 ?auto_228806 ?auto_228807 ?auto_228808 ?auto_228809 ?auto_228810 ?auto_228811 ?auto_228812 ?auto_228813 ?auto_228814 ?auto_228815 ?auto_228816 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228830 - BLOCK
      ?auto_228831 - BLOCK
      ?auto_228832 - BLOCK
      ?auto_228833 - BLOCK
      ?auto_228834 - BLOCK
      ?auto_228835 - BLOCK
      ?auto_228836 - BLOCK
      ?auto_228837 - BLOCK
      ?auto_228838 - BLOCK
      ?auto_228839 - BLOCK
      ?auto_228840 - BLOCK
      ?auto_228841 - BLOCK
    )
    :vars
    (
      ?auto_228842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228841 ?auto_228842 ) ( ON-TABLE ?auto_228830 ) ( ON ?auto_228831 ?auto_228830 ) ( ON ?auto_228832 ?auto_228831 ) ( ON ?auto_228833 ?auto_228832 ) ( not ( = ?auto_228830 ?auto_228831 ) ) ( not ( = ?auto_228830 ?auto_228832 ) ) ( not ( = ?auto_228830 ?auto_228833 ) ) ( not ( = ?auto_228830 ?auto_228834 ) ) ( not ( = ?auto_228830 ?auto_228835 ) ) ( not ( = ?auto_228830 ?auto_228836 ) ) ( not ( = ?auto_228830 ?auto_228837 ) ) ( not ( = ?auto_228830 ?auto_228838 ) ) ( not ( = ?auto_228830 ?auto_228839 ) ) ( not ( = ?auto_228830 ?auto_228840 ) ) ( not ( = ?auto_228830 ?auto_228841 ) ) ( not ( = ?auto_228830 ?auto_228842 ) ) ( not ( = ?auto_228831 ?auto_228832 ) ) ( not ( = ?auto_228831 ?auto_228833 ) ) ( not ( = ?auto_228831 ?auto_228834 ) ) ( not ( = ?auto_228831 ?auto_228835 ) ) ( not ( = ?auto_228831 ?auto_228836 ) ) ( not ( = ?auto_228831 ?auto_228837 ) ) ( not ( = ?auto_228831 ?auto_228838 ) ) ( not ( = ?auto_228831 ?auto_228839 ) ) ( not ( = ?auto_228831 ?auto_228840 ) ) ( not ( = ?auto_228831 ?auto_228841 ) ) ( not ( = ?auto_228831 ?auto_228842 ) ) ( not ( = ?auto_228832 ?auto_228833 ) ) ( not ( = ?auto_228832 ?auto_228834 ) ) ( not ( = ?auto_228832 ?auto_228835 ) ) ( not ( = ?auto_228832 ?auto_228836 ) ) ( not ( = ?auto_228832 ?auto_228837 ) ) ( not ( = ?auto_228832 ?auto_228838 ) ) ( not ( = ?auto_228832 ?auto_228839 ) ) ( not ( = ?auto_228832 ?auto_228840 ) ) ( not ( = ?auto_228832 ?auto_228841 ) ) ( not ( = ?auto_228832 ?auto_228842 ) ) ( not ( = ?auto_228833 ?auto_228834 ) ) ( not ( = ?auto_228833 ?auto_228835 ) ) ( not ( = ?auto_228833 ?auto_228836 ) ) ( not ( = ?auto_228833 ?auto_228837 ) ) ( not ( = ?auto_228833 ?auto_228838 ) ) ( not ( = ?auto_228833 ?auto_228839 ) ) ( not ( = ?auto_228833 ?auto_228840 ) ) ( not ( = ?auto_228833 ?auto_228841 ) ) ( not ( = ?auto_228833 ?auto_228842 ) ) ( not ( = ?auto_228834 ?auto_228835 ) ) ( not ( = ?auto_228834 ?auto_228836 ) ) ( not ( = ?auto_228834 ?auto_228837 ) ) ( not ( = ?auto_228834 ?auto_228838 ) ) ( not ( = ?auto_228834 ?auto_228839 ) ) ( not ( = ?auto_228834 ?auto_228840 ) ) ( not ( = ?auto_228834 ?auto_228841 ) ) ( not ( = ?auto_228834 ?auto_228842 ) ) ( not ( = ?auto_228835 ?auto_228836 ) ) ( not ( = ?auto_228835 ?auto_228837 ) ) ( not ( = ?auto_228835 ?auto_228838 ) ) ( not ( = ?auto_228835 ?auto_228839 ) ) ( not ( = ?auto_228835 ?auto_228840 ) ) ( not ( = ?auto_228835 ?auto_228841 ) ) ( not ( = ?auto_228835 ?auto_228842 ) ) ( not ( = ?auto_228836 ?auto_228837 ) ) ( not ( = ?auto_228836 ?auto_228838 ) ) ( not ( = ?auto_228836 ?auto_228839 ) ) ( not ( = ?auto_228836 ?auto_228840 ) ) ( not ( = ?auto_228836 ?auto_228841 ) ) ( not ( = ?auto_228836 ?auto_228842 ) ) ( not ( = ?auto_228837 ?auto_228838 ) ) ( not ( = ?auto_228837 ?auto_228839 ) ) ( not ( = ?auto_228837 ?auto_228840 ) ) ( not ( = ?auto_228837 ?auto_228841 ) ) ( not ( = ?auto_228837 ?auto_228842 ) ) ( not ( = ?auto_228838 ?auto_228839 ) ) ( not ( = ?auto_228838 ?auto_228840 ) ) ( not ( = ?auto_228838 ?auto_228841 ) ) ( not ( = ?auto_228838 ?auto_228842 ) ) ( not ( = ?auto_228839 ?auto_228840 ) ) ( not ( = ?auto_228839 ?auto_228841 ) ) ( not ( = ?auto_228839 ?auto_228842 ) ) ( not ( = ?auto_228840 ?auto_228841 ) ) ( not ( = ?auto_228840 ?auto_228842 ) ) ( not ( = ?auto_228841 ?auto_228842 ) ) ( ON ?auto_228840 ?auto_228841 ) ( ON ?auto_228839 ?auto_228840 ) ( ON ?auto_228838 ?auto_228839 ) ( ON ?auto_228837 ?auto_228838 ) ( ON ?auto_228836 ?auto_228837 ) ( ON ?auto_228835 ?auto_228836 ) ( CLEAR ?auto_228833 ) ( ON ?auto_228834 ?auto_228835 ) ( CLEAR ?auto_228834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_228830 ?auto_228831 ?auto_228832 ?auto_228833 ?auto_228834 )
      ( MAKE-12PILE ?auto_228830 ?auto_228831 ?auto_228832 ?auto_228833 ?auto_228834 ?auto_228835 ?auto_228836 ?auto_228837 ?auto_228838 ?auto_228839 ?auto_228840 ?auto_228841 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228855 - BLOCK
      ?auto_228856 - BLOCK
      ?auto_228857 - BLOCK
      ?auto_228858 - BLOCK
      ?auto_228859 - BLOCK
      ?auto_228860 - BLOCK
      ?auto_228861 - BLOCK
      ?auto_228862 - BLOCK
      ?auto_228863 - BLOCK
      ?auto_228864 - BLOCK
      ?auto_228865 - BLOCK
      ?auto_228866 - BLOCK
    )
    :vars
    (
      ?auto_228867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228866 ?auto_228867 ) ( ON-TABLE ?auto_228855 ) ( ON ?auto_228856 ?auto_228855 ) ( ON ?auto_228857 ?auto_228856 ) ( ON ?auto_228858 ?auto_228857 ) ( not ( = ?auto_228855 ?auto_228856 ) ) ( not ( = ?auto_228855 ?auto_228857 ) ) ( not ( = ?auto_228855 ?auto_228858 ) ) ( not ( = ?auto_228855 ?auto_228859 ) ) ( not ( = ?auto_228855 ?auto_228860 ) ) ( not ( = ?auto_228855 ?auto_228861 ) ) ( not ( = ?auto_228855 ?auto_228862 ) ) ( not ( = ?auto_228855 ?auto_228863 ) ) ( not ( = ?auto_228855 ?auto_228864 ) ) ( not ( = ?auto_228855 ?auto_228865 ) ) ( not ( = ?auto_228855 ?auto_228866 ) ) ( not ( = ?auto_228855 ?auto_228867 ) ) ( not ( = ?auto_228856 ?auto_228857 ) ) ( not ( = ?auto_228856 ?auto_228858 ) ) ( not ( = ?auto_228856 ?auto_228859 ) ) ( not ( = ?auto_228856 ?auto_228860 ) ) ( not ( = ?auto_228856 ?auto_228861 ) ) ( not ( = ?auto_228856 ?auto_228862 ) ) ( not ( = ?auto_228856 ?auto_228863 ) ) ( not ( = ?auto_228856 ?auto_228864 ) ) ( not ( = ?auto_228856 ?auto_228865 ) ) ( not ( = ?auto_228856 ?auto_228866 ) ) ( not ( = ?auto_228856 ?auto_228867 ) ) ( not ( = ?auto_228857 ?auto_228858 ) ) ( not ( = ?auto_228857 ?auto_228859 ) ) ( not ( = ?auto_228857 ?auto_228860 ) ) ( not ( = ?auto_228857 ?auto_228861 ) ) ( not ( = ?auto_228857 ?auto_228862 ) ) ( not ( = ?auto_228857 ?auto_228863 ) ) ( not ( = ?auto_228857 ?auto_228864 ) ) ( not ( = ?auto_228857 ?auto_228865 ) ) ( not ( = ?auto_228857 ?auto_228866 ) ) ( not ( = ?auto_228857 ?auto_228867 ) ) ( not ( = ?auto_228858 ?auto_228859 ) ) ( not ( = ?auto_228858 ?auto_228860 ) ) ( not ( = ?auto_228858 ?auto_228861 ) ) ( not ( = ?auto_228858 ?auto_228862 ) ) ( not ( = ?auto_228858 ?auto_228863 ) ) ( not ( = ?auto_228858 ?auto_228864 ) ) ( not ( = ?auto_228858 ?auto_228865 ) ) ( not ( = ?auto_228858 ?auto_228866 ) ) ( not ( = ?auto_228858 ?auto_228867 ) ) ( not ( = ?auto_228859 ?auto_228860 ) ) ( not ( = ?auto_228859 ?auto_228861 ) ) ( not ( = ?auto_228859 ?auto_228862 ) ) ( not ( = ?auto_228859 ?auto_228863 ) ) ( not ( = ?auto_228859 ?auto_228864 ) ) ( not ( = ?auto_228859 ?auto_228865 ) ) ( not ( = ?auto_228859 ?auto_228866 ) ) ( not ( = ?auto_228859 ?auto_228867 ) ) ( not ( = ?auto_228860 ?auto_228861 ) ) ( not ( = ?auto_228860 ?auto_228862 ) ) ( not ( = ?auto_228860 ?auto_228863 ) ) ( not ( = ?auto_228860 ?auto_228864 ) ) ( not ( = ?auto_228860 ?auto_228865 ) ) ( not ( = ?auto_228860 ?auto_228866 ) ) ( not ( = ?auto_228860 ?auto_228867 ) ) ( not ( = ?auto_228861 ?auto_228862 ) ) ( not ( = ?auto_228861 ?auto_228863 ) ) ( not ( = ?auto_228861 ?auto_228864 ) ) ( not ( = ?auto_228861 ?auto_228865 ) ) ( not ( = ?auto_228861 ?auto_228866 ) ) ( not ( = ?auto_228861 ?auto_228867 ) ) ( not ( = ?auto_228862 ?auto_228863 ) ) ( not ( = ?auto_228862 ?auto_228864 ) ) ( not ( = ?auto_228862 ?auto_228865 ) ) ( not ( = ?auto_228862 ?auto_228866 ) ) ( not ( = ?auto_228862 ?auto_228867 ) ) ( not ( = ?auto_228863 ?auto_228864 ) ) ( not ( = ?auto_228863 ?auto_228865 ) ) ( not ( = ?auto_228863 ?auto_228866 ) ) ( not ( = ?auto_228863 ?auto_228867 ) ) ( not ( = ?auto_228864 ?auto_228865 ) ) ( not ( = ?auto_228864 ?auto_228866 ) ) ( not ( = ?auto_228864 ?auto_228867 ) ) ( not ( = ?auto_228865 ?auto_228866 ) ) ( not ( = ?auto_228865 ?auto_228867 ) ) ( not ( = ?auto_228866 ?auto_228867 ) ) ( ON ?auto_228865 ?auto_228866 ) ( ON ?auto_228864 ?auto_228865 ) ( ON ?auto_228863 ?auto_228864 ) ( ON ?auto_228862 ?auto_228863 ) ( ON ?auto_228861 ?auto_228862 ) ( ON ?auto_228860 ?auto_228861 ) ( CLEAR ?auto_228858 ) ( ON ?auto_228859 ?auto_228860 ) ( CLEAR ?auto_228859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_228855 ?auto_228856 ?auto_228857 ?auto_228858 ?auto_228859 )
      ( MAKE-12PILE ?auto_228855 ?auto_228856 ?auto_228857 ?auto_228858 ?auto_228859 ?auto_228860 ?auto_228861 ?auto_228862 ?auto_228863 ?auto_228864 ?auto_228865 ?auto_228866 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228880 - BLOCK
      ?auto_228881 - BLOCK
      ?auto_228882 - BLOCK
      ?auto_228883 - BLOCK
      ?auto_228884 - BLOCK
      ?auto_228885 - BLOCK
      ?auto_228886 - BLOCK
      ?auto_228887 - BLOCK
      ?auto_228888 - BLOCK
      ?auto_228889 - BLOCK
      ?auto_228890 - BLOCK
      ?auto_228891 - BLOCK
    )
    :vars
    (
      ?auto_228892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228891 ?auto_228892 ) ( ON-TABLE ?auto_228880 ) ( ON ?auto_228881 ?auto_228880 ) ( ON ?auto_228882 ?auto_228881 ) ( not ( = ?auto_228880 ?auto_228881 ) ) ( not ( = ?auto_228880 ?auto_228882 ) ) ( not ( = ?auto_228880 ?auto_228883 ) ) ( not ( = ?auto_228880 ?auto_228884 ) ) ( not ( = ?auto_228880 ?auto_228885 ) ) ( not ( = ?auto_228880 ?auto_228886 ) ) ( not ( = ?auto_228880 ?auto_228887 ) ) ( not ( = ?auto_228880 ?auto_228888 ) ) ( not ( = ?auto_228880 ?auto_228889 ) ) ( not ( = ?auto_228880 ?auto_228890 ) ) ( not ( = ?auto_228880 ?auto_228891 ) ) ( not ( = ?auto_228880 ?auto_228892 ) ) ( not ( = ?auto_228881 ?auto_228882 ) ) ( not ( = ?auto_228881 ?auto_228883 ) ) ( not ( = ?auto_228881 ?auto_228884 ) ) ( not ( = ?auto_228881 ?auto_228885 ) ) ( not ( = ?auto_228881 ?auto_228886 ) ) ( not ( = ?auto_228881 ?auto_228887 ) ) ( not ( = ?auto_228881 ?auto_228888 ) ) ( not ( = ?auto_228881 ?auto_228889 ) ) ( not ( = ?auto_228881 ?auto_228890 ) ) ( not ( = ?auto_228881 ?auto_228891 ) ) ( not ( = ?auto_228881 ?auto_228892 ) ) ( not ( = ?auto_228882 ?auto_228883 ) ) ( not ( = ?auto_228882 ?auto_228884 ) ) ( not ( = ?auto_228882 ?auto_228885 ) ) ( not ( = ?auto_228882 ?auto_228886 ) ) ( not ( = ?auto_228882 ?auto_228887 ) ) ( not ( = ?auto_228882 ?auto_228888 ) ) ( not ( = ?auto_228882 ?auto_228889 ) ) ( not ( = ?auto_228882 ?auto_228890 ) ) ( not ( = ?auto_228882 ?auto_228891 ) ) ( not ( = ?auto_228882 ?auto_228892 ) ) ( not ( = ?auto_228883 ?auto_228884 ) ) ( not ( = ?auto_228883 ?auto_228885 ) ) ( not ( = ?auto_228883 ?auto_228886 ) ) ( not ( = ?auto_228883 ?auto_228887 ) ) ( not ( = ?auto_228883 ?auto_228888 ) ) ( not ( = ?auto_228883 ?auto_228889 ) ) ( not ( = ?auto_228883 ?auto_228890 ) ) ( not ( = ?auto_228883 ?auto_228891 ) ) ( not ( = ?auto_228883 ?auto_228892 ) ) ( not ( = ?auto_228884 ?auto_228885 ) ) ( not ( = ?auto_228884 ?auto_228886 ) ) ( not ( = ?auto_228884 ?auto_228887 ) ) ( not ( = ?auto_228884 ?auto_228888 ) ) ( not ( = ?auto_228884 ?auto_228889 ) ) ( not ( = ?auto_228884 ?auto_228890 ) ) ( not ( = ?auto_228884 ?auto_228891 ) ) ( not ( = ?auto_228884 ?auto_228892 ) ) ( not ( = ?auto_228885 ?auto_228886 ) ) ( not ( = ?auto_228885 ?auto_228887 ) ) ( not ( = ?auto_228885 ?auto_228888 ) ) ( not ( = ?auto_228885 ?auto_228889 ) ) ( not ( = ?auto_228885 ?auto_228890 ) ) ( not ( = ?auto_228885 ?auto_228891 ) ) ( not ( = ?auto_228885 ?auto_228892 ) ) ( not ( = ?auto_228886 ?auto_228887 ) ) ( not ( = ?auto_228886 ?auto_228888 ) ) ( not ( = ?auto_228886 ?auto_228889 ) ) ( not ( = ?auto_228886 ?auto_228890 ) ) ( not ( = ?auto_228886 ?auto_228891 ) ) ( not ( = ?auto_228886 ?auto_228892 ) ) ( not ( = ?auto_228887 ?auto_228888 ) ) ( not ( = ?auto_228887 ?auto_228889 ) ) ( not ( = ?auto_228887 ?auto_228890 ) ) ( not ( = ?auto_228887 ?auto_228891 ) ) ( not ( = ?auto_228887 ?auto_228892 ) ) ( not ( = ?auto_228888 ?auto_228889 ) ) ( not ( = ?auto_228888 ?auto_228890 ) ) ( not ( = ?auto_228888 ?auto_228891 ) ) ( not ( = ?auto_228888 ?auto_228892 ) ) ( not ( = ?auto_228889 ?auto_228890 ) ) ( not ( = ?auto_228889 ?auto_228891 ) ) ( not ( = ?auto_228889 ?auto_228892 ) ) ( not ( = ?auto_228890 ?auto_228891 ) ) ( not ( = ?auto_228890 ?auto_228892 ) ) ( not ( = ?auto_228891 ?auto_228892 ) ) ( ON ?auto_228890 ?auto_228891 ) ( ON ?auto_228889 ?auto_228890 ) ( ON ?auto_228888 ?auto_228889 ) ( ON ?auto_228887 ?auto_228888 ) ( ON ?auto_228886 ?auto_228887 ) ( ON ?auto_228885 ?auto_228886 ) ( ON ?auto_228884 ?auto_228885 ) ( CLEAR ?auto_228882 ) ( ON ?auto_228883 ?auto_228884 ) ( CLEAR ?auto_228883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_228880 ?auto_228881 ?auto_228882 ?auto_228883 )
      ( MAKE-12PILE ?auto_228880 ?auto_228881 ?auto_228882 ?auto_228883 ?auto_228884 ?auto_228885 ?auto_228886 ?auto_228887 ?auto_228888 ?auto_228889 ?auto_228890 ?auto_228891 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228905 - BLOCK
      ?auto_228906 - BLOCK
      ?auto_228907 - BLOCK
      ?auto_228908 - BLOCK
      ?auto_228909 - BLOCK
      ?auto_228910 - BLOCK
      ?auto_228911 - BLOCK
      ?auto_228912 - BLOCK
      ?auto_228913 - BLOCK
      ?auto_228914 - BLOCK
      ?auto_228915 - BLOCK
      ?auto_228916 - BLOCK
    )
    :vars
    (
      ?auto_228917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228916 ?auto_228917 ) ( ON-TABLE ?auto_228905 ) ( ON ?auto_228906 ?auto_228905 ) ( ON ?auto_228907 ?auto_228906 ) ( not ( = ?auto_228905 ?auto_228906 ) ) ( not ( = ?auto_228905 ?auto_228907 ) ) ( not ( = ?auto_228905 ?auto_228908 ) ) ( not ( = ?auto_228905 ?auto_228909 ) ) ( not ( = ?auto_228905 ?auto_228910 ) ) ( not ( = ?auto_228905 ?auto_228911 ) ) ( not ( = ?auto_228905 ?auto_228912 ) ) ( not ( = ?auto_228905 ?auto_228913 ) ) ( not ( = ?auto_228905 ?auto_228914 ) ) ( not ( = ?auto_228905 ?auto_228915 ) ) ( not ( = ?auto_228905 ?auto_228916 ) ) ( not ( = ?auto_228905 ?auto_228917 ) ) ( not ( = ?auto_228906 ?auto_228907 ) ) ( not ( = ?auto_228906 ?auto_228908 ) ) ( not ( = ?auto_228906 ?auto_228909 ) ) ( not ( = ?auto_228906 ?auto_228910 ) ) ( not ( = ?auto_228906 ?auto_228911 ) ) ( not ( = ?auto_228906 ?auto_228912 ) ) ( not ( = ?auto_228906 ?auto_228913 ) ) ( not ( = ?auto_228906 ?auto_228914 ) ) ( not ( = ?auto_228906 ?auto_228915 ) ) ( not ( = ?auto_228906 ?auto_228916 ) ) ( not ( = ?auto_228906 ?auto_228917 ) ) ( not ( = ?auto_228907 ?auto_228908 ) ) ( not ( = ?auto_228907 ?auto_228909 ) ) ( not ( = ?auto_228907 ?auto_228910 ) ) ( not ( = ?auto_228907 ?auto_228911 ) ) ( not ( = ?auto_228907 ?auto_228912 ) ) ( not ( = ?auto_228907 ?auto_228913 ) ) ( not ( = ?auto_228907 ?auto_228914 ) ) ( not ( = ?auto_228907 ?auto_228915 ) ) ( not ( = ?auto_228907 ?auto_228916 ) ) ( not ( = ?auto_228907 ?auto_228917 ) ) ( not ( = ?auto_228908 ?auto_228909 ) ) ( not ( = ?auto_228908 ?auto_228910 ) ) ( not ( = ?auto_228908 ?auto_228911 ) ) ( not ( = ?auto_228908 ?auto_228912 ) ) ( not ( = ?auto_228908 ?auto_228913 ) ) ( not ( = ?auto_228908 ?auto_228914 ) ) ( not ( = ?auto_228908 ?auto_228915 ) ) ( not ( = ?auto_228908 ?auto_228916 ) ) ( not ( = ?auto_228908 ?auto_228917 ) ) ( not ( = ?auto_228909 ?auto_228910 ) ) ( not ( = ?auto_228909 ?auto_228911 ) ) ( not ( = ?auto_228909 ?auto_228912 ) ) ( not ( = ?auto_228909 ?auto_228913 ) ) ( not ( = ?auto_228909 ?auto_228914 ) ) ( not ( = ?auto_228909 ?auto_228915 ) ) ( not ( = ?auto_228909 ?auto_228916 ) ) ( not ( = ?auto_228909 ?auto_228917 ) ) ( not ( = ?auto_228910 ?auto_228911 ) ) ( not ( = ?auto_228910 ?auto_228912 ) ) ( not ( = ?auto_228910 ?auto_228913 ) ) ( not ( = ?auto_228910 ?auto_228914 ) ) ( not ( = ?auto_228910 ?auto_228915 ) ) ( not ( = ?auto_228910 ?auto_228916 ) ) ( not ( = ?auto_228910 ?auto_228917 ) ) ( not ( = ?auto_228911 ?auto_228912 ) ) ( not ( = ?auto_228911 ?auto_228913 ) ) ( not ( = ?auto_228911 ?auto_228914 ) ) ( not ( = ?auto_228911 ?auto_228915 ) ) ( not ( = ?auto_228911 ?auto_228916 ) ) ( not ( = ?auto_228911 ?auto_228917 ) ) ( not ( = ?auto_228912 ?auto_228913 ) ) ( not ( = ?auto_228912 ?auto_228914 ) ) ( not ( = ?auto_228912 ?auto_228915 ) ) ( not ( = ?auto_228912 ?auto_228916 ) ) ( not ( = ?auto_228912 ?auto_228917 ) ) ( not ( = ?auto_228913 ?auto_228914 ) ) ( not ( = ?auto_228913 ?auto_228915 ) ) ( not ( = ?auto_228913 ?auto_228916 ) ) ( not ( = ?auto_228913 ?auto_228917 ) ) ( not ( = ?auto_228914 ?auto_228915 ) ) ( not ( = ?auto_228914 ?auto_228916 ) ) ( not ( = ?auto_228914 ?auto_228917 ) ) ( not ( = ?auto_228915 ?auto_228916 ) ) ( not ( = ?auto_228915 ?auto_228917 ) ) ( not ( = ?auto_228916 ?auto_228917 ) ) ( ON ?auto_228915 ?auto_228916 ) ( ON ?auto_228914 ?auto_228915 ) ( ON ?auto_228913 ?auto_228914 ) ( ON ?auto_228912 ?auto_228913 ) ( ON ?auto_228911 ?auto_228912 ) ( ON ?auto_228910 ?auto_228911 ) ( ON ?auto_228909 ?auto_228910 ) ( CLEAR ?auto_228907 ) ( ON ?auto_228908 ?auto_228909 ) ( CLEAR ?auto_228908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_228905 ?auto_228906 ?auto_228907 ?auto_228908 )
      ( MAKE-12PILE ?auto_228905 ?auto_228906 ?auto_228907 ?auto_228908 ?auto_228909 ?auto_228910 ?auto_228911 ?auto_228912 ?auto_228913 ?auto_228914 ?auto_228915 ?auto_228916 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228930 - BLOCK
      ?auto_228931 - BLOCK
      ?auto_228932 - BLOCK
      ?auto_228933 - BLOCK
      ?auto_228934 - BLOCK
      ?auto_228935 - BLOCK
      ?auto_228936 - BLOCK
      ?auto_228937 - BLOCK
      ?auto_228938 - BLOCK
      ?auto_228939 - BLOCK
      ?auto_228940 - BLOCK
      ?auto_228941 - BLOCK
    )
    :vars
    (
      ?auto_228942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228941 ?auto_228942 ) ( ON-TABLE ?auto_228930 ) ( ON ?auto_228931 ?auto_228930 ) ( not ( = ?auto_228930 ?auto_228931 ) ) ( not ( = ?auto_228930 ?auto_228932 ) ) ( not ( = ?auto_228930 ?auto_228933 ) ) ( not ( = ?auto_228930 ?auto_228934 ) ) ( not ( = ?auto_228930 ?auto_228935 ) ) ( not ( = ?auto_228930 ?auto_228936 ) ) ( not ( = ?auto_228930 ?auto_228937 ) ) ( not ( = ?auto_228930 ?auto_228938 ) ) ( not ( = ?auto_228930 ?auto_228939 ) ) ( not ( = ?auto_228930 ?auto_228940 ) ) ( not ( = ?auto_228930 ?auto_228941 ) ) ( not ( = ?auto_228930 ?auto_228942 ) ) ( not ( = ?auto_228931 ?auto_228932 ) ) ( not ( = ?auto_228931 ?auto_228933 ) ) ( not ( = ?auto_228931 ?auto_228934 ) ) ( not ( = ?auto_228931 ?auto_228935 ) ) ( not ( = ?auto_228931 ?auto_228936 ) ) ( not ( = ?auto_228931 ?auto_228937 ) ) ( not ( = ?auto_228931 ?auto_228938 ) ) ( not ( = ?auto_228931 ?auto_228939 ) ) ( not ( = ?auto_228931 ?auto_228940 ) ) ( not ( = ?auto_228931 ?auto_228941 ) ) ( not ( = ?auto_228931 ?auto_228942 ) ) ( not ( = ?auto_228932 ?auto_228933 ) ) ( not ( = ?auto_228932 ?auto_228934 ) ) ( not ( = ?auto_228932 ?auto_228935 ) ) ( not ( = ?auto_228932 ?auto_228936 ) ) ( not ( = ?auto_228932 ?auto_228937 ) ) ( not ( = ?auto_228932 ?auto_228938 ) ) ( not ( = ?auto_228932 ?auto_228939 ) ) ( not ( = ?auto_228932 ?auto_228940 ) ) ( not ( = ?auto_228932 ?auto_228941 ) ) ( not ( = ?auto_228932 ?auto_228942 ) ) ( not ( = ?auto_228933 ?auto_228934 ) ) ( not ( = ?auto_228933 ?auto_228935 ) ) ( not ( = ?auto_228933 ?auto_228936 ) ) ( not ( = ?auto_228933 ?auto_228937 ) ) ( not ( = ?auto_228933 ?auto_228938 ) ) ( not ( = ?auto_228933 ?auto_228939 ) ) ( not ( = ?auto_228933 ?auto_228940 ) ) ( not ( = ?auto_228933 ?auto_228941 ) ) ( not ( = ?auto_228933 ?auto_228942 ) ) ( not ( = ?auto_228934 ?auto_228935 ) ) ( not ( = ?auto_228934 ?auto_228936 ) ) ( not ( = ?auto_228934 ?auto_228937 ) ) ( not ( = ?auto_228934 ?auto_228938 ) ) ( not ( = ?auto_228934 ?auto_228939 ) ) ( not ( = ?auto_228934 ?auto_228940 ) ) ( not ( = ?auto_228934 ?auto_228941 ) ) ( not ( = ?auto_228934 ?auto_228942 ) ) ( not ( = ?auto_228935 ?auto_228936 ) ) ( not ( = ?auto_228935 ?auto_228937 ) ) ( not ( = ?auto_228935 ?auto_228938 ) ) ( not ( = ?auto_228935 ?auto_228939 ) ) ( not ( = ?auto_228935 ?auto_228940 ) ) ( not ( = ?auto_228935 ?auto_228941 ) ) ( not ( = ?auto_228935 ?auto_228942 ) ) ( not ( = ?auto_228936 ?auto_228937 ) ) ( not ( = ?auto_228936 ?auto_228938 ) ) ( not ( = ?auto_228936 ?auto_228939 ) ) ( not ( = ?auto_228936 ?auto_228940 ) ) ( not ( = ?auto_228936 ?auto_228941 ) ) ( not ( = ?auto_228936 ?auto_228942 ) ) ( not ( = ?auto_228937 ?auto_228938 ) ) ( not ( = ?auto_228937 ?auto_228939 ) ) ( not ( = ?auto_228937 ?auto_228940 ) ) ( not ( = ?auto_228937 ?auto_228941 ) ) ( not ( = ?auto_228937 ?auto_228942 ) ) ( not ( = ?auto_228938 ?auto_228939 ) ) ( not ( = ?auto_228938 ?auto_228940 ) ) ( not ( = ?auto_228938 ?auto_228941 ) ) ( not ( = ?auto_228938 ?auto_228942 ) ) ( not ( = ?auto_228939 ?auto_228940 ) ) ( not ( = ?auto_228939 ?auto_228941 ) ) ( not ( = ?auto_228939 ?auto_228942 ) ) ( not ( = ?auto_228940 ?auto_228941 ) ) ( not ( = ?auto_228940 ?auto_228942 ) ) ( not ( = ?auto_228941 ?auto_228942 ) ) ( ON ?auto_228940 ?auto_228941 ) ( ON ?auto_228939 ?auto_228940 ) ( ON ?auto_228938 ?auto_228939 ) ( ON ?auto_228937 ?auto_228938 ) ( ON ?auto_228936 ?auto_228937 ) ( ON ?auto_228935 ?auto_228936 ) ( ON ?auto_228934 ?auto_228935 ) ( ON ?auto_228933 ?auto_228934 ) ( CLEAR ?auto_228931 ) ( ON ?auto_228932 ?auto_228933 ) ( CLEAR ?auto_228932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_228930 ?auto_228931 ?auto_228932 )
      ( MAKE-12PILE ?auto_228930 ?auto_228931 ?auto_228932 ?auto_228933 ?auto_228934 ?auto_228935 ?auto_228936 ?auto_228937 ?auto_228938 ?auto_228939 ?auto_228940 ?auto_228941 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228955 - BLOCK
      ?auto_228956 - BLOCK
      ?auto_228957 - BLOCK
      ?auto_228958 - BLOCK
      ?auto_228959 - BLOCK
      ?auto_228960 - BLOCK
      ?auto_228961 - BLOCK
      ?auto_228962 - BLOCK
      ?auto_228963 - BLOCK
      ?auto_228964 - BLOCK
      ?auto_228965 - BLOCK
      ?auto_228966 - BLOCK
    )
    :vars
    (
      ?auto_228967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228966 ?auto_228967 ) ( ON-TABLE ?auto_228955 ) ( ON ?auto_228956 ?auto_228955 ) ( not ( = ?auto_228955 ?auto_228956 ) ) ( not ( = ?auto_228955 ?auto_228957 ) ) ( not ( = ?auto_228955 ?auto_228958 ) ) ( not ( = ?auto_228955 ?auto_228959 ) ) ( not ( = ?auto_228955 ?auto_228960 ) ) ( not ( = ?auto_228955 ?auto_228961 ) ) ( not ( = ?auto_228955 ?auto_228962 ) ) ( not ( = ?auto_228955 ?auto_228963 ) ) ( not ( = ?auto_228955 ?auto_228964 ) ) ( not ( = ?auto_228955 ?auto_228965 ) ) ( not ( = ?auto_228955 ?auto_228966 ) ) ( not ( = ?auto_228955 ?auto_228967 ) ) ( not ( = ?auto_228956 ?auto_228957 ) ) ( not ( = ?auto_228956 ?auto_228958 ) ) ( not ( = ?auto_228956 ?auto_228959 ) ) ( not ( = ?auto_228956 ?auto_228960 ) ) ( not ( = ?auto_228956 ?auto_228961 ) ) ( not ( = ?auto_228956 ?auto_228962 ) ) ( not ( = ?auto_228956 ?auto_228963 ) ) ( not ( = ?auto_228956 ?auto_228964 ) ) ( not ( = ?auto_228956 ?auto_228965 ) ) ( not ( = ?auto_228956 ?auto_228966 ) ) ( not ( = ?auto_228956 ?auto_228967 ) ) ( not ( = ?auto_228957 ?auto_228958 ) ) ( not ( = ?auto_228957 ?auto_228959 ) ) ( not ( = ?auto_228957 ?auto_228960 ) ) ( not ( = ?auto_228957 ?auto_228961 ) ) ( not ( = ?auto_228957 ?auto_228962 ) ) ( not ( = ?auto_228957 ?auto_228963 ) ) ( not ( = ?auto_228957 ?auto_228964 ) ) ( not ( = ?auto_228957 ?auto_228965 ) ) ( not ( = ?auto_228957 ?auto_228966 ) ) ( not ( = ?auto_228957 ?auto_228967 ) ) ( not ( = ?auto_228958 ?auto_228959 ) ) ( not ( = ?auto_228958 ?auto_228960 ) ) ( not ( = ?auto_228958 ?auto_228961 ) ) ( not ( = ?auto_228958 ?auto_228962 ) ) ( not ( = ?auto_228958 ?auto_228963 ) ) ( not ( = ?auto_228958 ?auto_228964 ) ) ( not ( = ?auto_228958 ?auto_228965 ) ) ( not ( = ?auto_228958 ?auto_228966 ) ) ( not ( = ?auto_228958 ?auto_228967 ) ) ( not ( = ?auto_228959 ?auto_228960 ) ) ( not ( = ?auto_228959 ?auto_228961 ) ) ( not ( = ?auto_228959 ?auto_228962 ) ) ( not ( = ?auto_228959 ?auto_228963 ) ) ( not ( = ?auto_228959 ?auto_228964 ) ) ( not ( = ?auto_228959 ?auto_228965 ) ) ( not ( = ?auto_228959 ?auto_228966 ) ) ( not ( = ?auto_228959 ?auto_228967 ) ) ( not ( = ?auto_228960 ?auto_228961 ) ) ( not ( = ?auto_228960 ?auto_228962 ) ) ( not ( = ?auto_228960 ?auto_228963 ) ) ( not ( = ?auto_228960 ?auto_228964 ) ) ( not ( = ?auto_228960 ?auto_228965 ) ) ( not ( = ?auto_228960 ?auto_228966 ) ) ( not ( = ?auto_228960 ?auto_228967 ) ) ( not ( = ?auto_228961 ?auto_228962 ) ) ( not ( = ?auto_228961 ?auto_228963 ) ) ( not ( = ?auto_228961 ?auto_228964 ) ) ( not ( = ?auto_228961 ?auto_228965 ) ) ( not ( = ?auto_228961 ?auto_228966 ) ) ( not ( = ?auto_228961 ?auto_228967 ) ) ( not ( = ?auto_228962 ?auto_228963 ) ) ( not ( = ?auto_228962 ?auto_228964 ) ) ( not ( = ?auto_228962 ?auto_228965 ) ) ( not ( = ?auto_228962 ?auto_228966 ) ) ( not ( = ?auto_228962 ?auto_228967 ) ) ( not ( = ?auto_228963 ?auto_228964 ) ) ( not ( = ?auto_228963 ?auto_228965 ) ) ( not ( = ?auto_228963 ?auto_228966 ) ) ( not ( = ?auto_228963 ?auto_228967 ) ) ( not ( = ?auto_228964 ?auto_228965 ) ) ( not ( = ?auto_228964 ?auto_228966 ) ) ( not ( = ?auto_228964 ?auto_228967 ) ) ( not ( = ?auto_228965 ?auto_228966 ) ) ( not ( = ?auto_228965 ?auto_228967 ) ) ( not ( = ?auto_228966 ?auto_228967 ) ) ( ON ?auto_228965 ?auto_228966 ) ( ON ?auto_228964 ?auto_228965 ) ( ON ?auto_228963 ?auto_228964 ) ( ON ?auto_228962 ?auto_228963 ) ( ON ?auto_228961 ?auto_228962 ) ( ON ?auto_228960 ?auto_228961 ) ( ON ?auto_228959 ?auto_228960 ) ( ON ?auto_228958 ?auto_228959 ) ( CLEAR ?auto_228956 ) ( ON ?auto_228957 ?auto_228958 ) ( CLEAR ?auto_228957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_228955 ?auto_228956 ?auto_228957 )
      ( MAKE-12PILE ?auto_228955 ?auto_228956 ?auto_228957 ?auto_228958 ?auto_228959 ?auto_228960 ?auto_228961 ?auto_228962 ?auto_228963 ?auto_228964 ?auto_228965 ?auto_228966 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_228980 - BLOCK
      ?auto_228981 - BLOCK
      ?auto_228982 - BLOCK
      ?auto_228983 - BLOCK
      ?auto_228984 - BLOCK
      ?auto_228985 - BLOCK
      ?auto_228986 - BLOCK
      ?auto_228987 - BLOCK
      ?auto_228988 - BLOCK
      ?auto_228989 - BLOCK
      ?auto_228990 - BLOCK
      ?auto_228991 - BLOCK
    )
    :vars
    (
      ?auto_228992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_228991 ?auto_228992 ) ( ON-TABLE ?auto_228980 ) ( not ( = ?auto_228980 ?auto_228981 ) ) ( not ( = ?auto_228980 ?auto_228982 ) ) ( not ( = ?auto_228980 ?auto_228983 ) ) ( not ( = ?auto_228980 ?auto_228984 ) ) ( not ( = ?auto_228980 ?auto_228985 ) ) ( not ( = ?auto_228980 ?auto_228986 ) ) ( not ( = ?auto_228980 ?auto_228987 ) ) ( not ( = ?auto_228980 ?auto_228988 ) ) ( not ( = ?auto_228980 ?auto_228989 ) ) ( not ( = ?auto_228980 ?auto_228990 ) ) ( not ( = ?auto_228980 ?auto_228991 ) ) ( not ( = ?auto_228980 ?auto_228992 ) ) ( not ( = ?auto_228981 ?auto_228982 ) ) ( not ( = ?auto_228981 ?auto_228983 ) ) ( not ( = ?auto_228981 ?auto_228984 ) ) ( not ( = ?auto_228981 ?auto_228985 ) ) ( not ( = ?auto_228981 ?auto_228986 ) ) ( not ( = ?auto_228981 ?auto_228987 ) ) ( not ( = ?auto_228981 ?auto_228988 ) ) ( not ( = ?auto_228981 ?auto_228989 ) ) ( not ( = ?auto_228981 ?auto_228990 ) ) ( not ( = ?auto_228981 ?auto_228991 ) ) ( not ( = ?auto_228981 ?auto_228992 ) ) ( not ( = ?auto_228982 ?auto_228983 ) ) ( not ( = ?auto_228982 ?auto_228984 ) ) ( not ( = ?auto_228982 ?auto_228985 ) ) ( not ( = ?auto_228982 ?auto_228986 ) ) ( not ( = ?auto_228982 ?auto_228987 ) ) ( not ( = ?auto_228982 ?auto_228988 ) ) ( not ( = ?auto_228982 ?auto_228989 ) ) ( not ( = ?auto_228982 ?auto_228990 ) ) ( not ( = ?auto_228982 ?auto_228991 ) ) ( not ( = ?auto_228982 ?auto_228992 ) ) ( not ( = ?auto_228983 ?auto_228984 ) ) ( not ( = ?auto_228983 ?auto_228985 ) ) ( not ( = ?auto_228983 ?auto_228986 ) ) ( not ( = ?auto_228983 ?auto_228987 ) ) ( not ( = ?auto_228983 ?auto_228988 ) ) ( not ( = ?auto_228983 ?auto_228989 ) ) ( not ( = ?auto_228983 ?auto_228990 ) ) ( not ( = ?auto_228983 ?auto_228991 ) ) ( not ( = ?auto_228983 ?auto_228992 ) ) ( not ( = ?auto_228984 ?auto_228985 ) ) ( not ( = ?auto_228984 ?auto_228986 ) ) ( not ( = ?auto_228984 ?auto_228987 ) ) ( not ( = ?auto_228984 ?auto_228988 ) ) ( not ( = ?auto_228984 ?auto_228989 ) ) ( not ( = ?auto_228984 ?auto_228990 ) ) ( not ( = ?auto_228984 ?auto_228991 ) ) ( not ( = ?auto_228984 ?auto_228992 ) ) ( not ( = ?auto_228985 ?auto_228986 ) ) ( not ( = ?auto_228985 ?auto_228987 ) ) ( not ( = ?auto_228985 ?auto_228988 ) ) ( not ( = ?auto_228985 ?auto_228989 ) ) ( not ( = ?auto_228985 ?auto_228990 ) ) ( not ( = ?auto_228985 ?auto_228991 ) ) ( not ( = ?auto_228985 ?auto_228992 ) ) ( not ( = ?auto_228986 ?auto_228987 ) ) ( not ( = ?auto_228986 ?auto_228988 ) ) ( not ( = ?auto_228986 ?auto_228989 ) ) ( not ( = ?auto_228986 ?auto_228990 ) ) ( not ( = ?auto_228986 ?auto_228991 ) ) ( not ( = ?auto_228986 ?auto_228992 ) ) ( not ( = ?auto_228987 ?auto_228988 ) ) ( not ( = ?auto_228987 ?auto_228989 ) ) ( not ( = ?auto_228987 ?auto_228990 ) ) ( not ( = ?auto_228987 ?auto_228991 ) ) ( not ( = ?auto_228987 ?auto_228992 ) ) ( not ( = ?auto_228988 ?auto_228989 ) ) ( not ( = ?auto_228988 ?auto_228990 ) ) ( not ( = ?auto_228988 ?auto_228991 ) ) ( not ( = ?auto_228988 ?auto_228992 ) ) ( not ( = ?auto_228989 ?auto_228990 ) ) ( not ( = ?auto_228989 ?auto_228991 ) ) ( not ( = ?auto_228989 ?auto_228992 ) ) ( not ( = ?auto_228990 ?auto_228991 ) ) ( not ( = ?auto_228990 ?auto_228992 ) ) ( not ( = ?auto_228991 ?auto_228992 ) ) ( ON ?auto_228990 ?auto_228991 ) ( ON ?auto_228989 ?auto_228990 ) ( ON ?auto_228988 ?auto_228989 ) ( ON ?auto_228987 ?auto_228988 ) ( ON ?auto_228986 ?auto_228987 ) ( ON ?auto_228985 ?auto_228986 ) ( ON ?auto_228984 ?auto_228985 ) ( ON ?auto_228983 ?auto_228984 ) ( ON ?auto_228982 ?auto_228983 ) ( CLEAR ?auto_228980 ) ( ON ?auto_228981 ?auto_228982 ) ( CLEAR ?auto_228981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_228980 ?auto_228981 )
      ( MAKE-12PILE ?auto_228980 ?auto_228981 ?auto_228982 ?auto_228983 ?auto_228984 ?auto_228985 ?auto_228986 ?auto_228987 ?auto_228988 ?auto_228989 ?auto_228990 ?auto_228991 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_229005 - BLOCK
      ?auto_229006 - BLOCK
      ?auto_229007 - BLOCK
      ?auto_229008 - BLOCK
      ?auto_229009 - BLOCK
      ?auto_229010 - BLOCK
      ?auto_229011 - BLOCK
      ?auto_229012 - BLOCK
      ?auto_229013 - BLOCK
      ?auto_229014 - BLOCK
      ?auto_229015 - BLOCK
      ?auto_229016 - BLOCK
    )
    :vars
    (
      ?auto_229017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229016 ?auto_229017 ) ( ON-TABLE ?auto_229005 ) ( not ( = ?auto_229005 ?auto_229006 ) ) ( not ( = ?auto_229005 ?auto_229007 ) ) ( not ( = ?auto_229005 ?auto_229008 ) ) ( not ( = ?auto_229005 ?auto_229009 ) ) ( not ( = ?auto_229005 ?auto_229010 ) ) ( not ( = ?auto_229005 ?auto_229011 ) ) ( not ( = ?auto_229005 ?auto_229012 ) ) ( not ( = ?auto_229005 ?auto_229013 ) ) ( not ( = ?auto_229005 ?auto_229014 ) ) ( not ( = ?auto_229005 ?auto_229015 ) ) ( not ( = ?auto_229005 ?auto_229016 ) ) ( not ( = ?auto_229005 ?auto_229017 ) ) ( not ( = ?auto_229006 ?auto_229007 ) ) ( not ( = ?auto_229006 ?auto_229008 ) ) ( not ( = ?auto_229006 ?auto_229009 ) ) ( not ( = ?auto_229006 ?auto_229010 ) ) ( not ( = ?auto_229006 ?auto_229011 ) ) ( not ( = ?auto_229006 ?auto_229012 ) ) ( not ( = ?auto_229006 ?auto_229013 ) ) ( not ( = ?auto_229006 ?auto_229014 ) ) ( not ( = ?auto_229006 ?auto_229015 ) ) ( not ( = ?auto_229006 ?auto_229016 ) ) ( not ( = ?auto_229006 ?auto_229017 ) ) ( not ( = ?auto_229007 ?auto_229008 ) ) ( not ( = ?auto_229007 ?auto_229009 ) ) ( not ( = ?auto_229007 ?auto_229010 ) ) ( not ( = ?auto_229007 ?auto_229011 ) ) ( not ( = ?auto_229007 ?auto_229012 ) ) ( not ( = ?auto_229007 ?auto_229013 ) ) ( not ( = ?auto_229007 ?auto_229014 ) ) ( not ( = ?auto_229007 ?auto_229015 ) ) ( not ( = ?auto_229007 ?auto_229016 ) ) ( not ( = ?auto_229007 ?auto_229017 ) ) ( not ( = ?auto_229008 ?auto_229009 ) ) ( not ( = ?auto_229008 ?auto_229010 ) ) ( not ( = ?auto_229008 ?auto_229011 ) ) ( not ( = ?auto_229008 ?auto_229012 ) ) ( not ( = ?auto_229008 ?auto_229013 ) ) ( not ( = ?auto_229008 ?auto_229014 ) ) ( not ( = ?auto_229008 ?auto_229015 ) ) ( not ( = ?auto_229008 ?auto_229016 ) ) ( not ( = ?auto_229008 ?auto_229017 ) ) ( not ( = ?auto_229009 ?auto_229010 ) ) ( not ( = ?auto_229009 ?auto_229011 ) ) ( not ( = ?auto_229009 ?auto_229012 ) ) ( not ( = ?auto_229009 ?auto_229013 ) ) ( not ( = ?auto_229009 ?auto_229014 ) ) ( not ( = ?auto_229009 ?auto_229015 ) ) ( not ( = ?auto_229009 ?auto_229016 ) ) ( not ( = ?auto_229009 ?auto_229017 ) ) ( not ( = ?auto_229010 ?auto_229011 ) ) ( not ( = ?auto_229010 ?auto_229012 ) ) ( not ( = ?auto_229010 ?auto_229013 ) ) ( not ( = ?auto_229010 ?auto_229014 ) ) ( not ( = ?auto_229010 ?auto_229015 ) ) ( not ( = ?auto_229010 ?auto_229016 ) ) ( not ( = ?auto_229010 ?auto_229017 ) ) ( not ( = ?auto_229011 ?auto_229012 ) ) ( not ( = ?auto_229011 ?auto_229013 ) ) ( not ( = ?auto_229011 ?auto_229014 ) ) ( not ( = ?auto_229011 ?auto_229015 ) ) ( not ( = ?auto_229011 ?auto_229016 ) ) ( not ( = ?auto_229011 ?auto_229017 ) ) ( not ( = ?auto_229012 ?auto_229013 ) ) ( not ( = ?auto_229012 ?auto_229014 ) ) ( not ( = ?auto_229012 ?auto_229015 ) ) ( not ( = ?auto_229012 ?auto_229016 ) ) ( not ( = ?auto_229012 ?auto_229017 ) ) ( not ( = ?auto_229013 ?auto_229014 ) ) ( not ( = ?auto_229013 ?auto_229015 ) ) ( not ( = ?auto_229013 ?auto_229016 ) ) ( not ( = ?auto_229013 ?auto_229017 ) ) ( not ( = ?auto_229014 ?auto_229015 ) ) ( not ( = ?auto_229014 ?auto_229016 ) ) ( not ( = ?auto_229014 ?auto_229017 ) ) ( not ( = ?auto_229015 ?auto_229016 ) ) ( not ( = ?auto_229015 ?auto_229017 ) ) ( not ( = ?auto_229016 ?auto_229017 ) ) ( ON ?auto_229015 ?auto_229016 ) ( ON ?auto_229014 ?auto_229015 ) ( ON ?auto_229013 ?auto_229014 ) ( ON ?auto_229012 ?auto_229013 ) ( ON ?auto_229011 ?auto_229012 ) ( ON ?auto_229010 ?auto_229011 ) ( ON ?auto_229009 ?auto_229010 ) ( ON ?auto_229008 ?auto_229009 ) ( ON ?auto_229007 ?auto_229008 ) ( CLEAR ?auto_229005 ) ( ON ?auto_229006 ?auto_229007 ) ( CLEAR ?auto_229006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_229005 ?auto_229006 )
      ( MAKE-12PILE ?auto_229005 ?auto_229006 ?auto_229007 ?auto_229008 ?auto_229009 ?auto_229010 ?auto_229011 ?auto_229012 ?auto_229013 ?auto_229014 ?auto_229015 ?auto_229016 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_229030 - BLOCK
      ?auto_229031 - BLOCK
      ?auto_229032 - BLOCK
      ?auto_229033 - BLOCK
      ?auto_229034 - BLOCK
      ?auto_229035 - BLOCK
      ?auto_229036 - BLOCK
      ?auto_229037 - BLOCK
      ?auto_229038 - BLOCK
      ?auto_229039 - BLOCK
      ?auto_229040 - BLOCK
      ?auto_229041 - BLOCK
    )
    :vars
    (
      ?auto_229042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229041 ?auto_229042 ) ( not ( = ?auto_229030 ?auto_229031 ) ) ( not ( = ?auto_229030 ?auto_229032 ) ) ( not ( = ?auto_229030 ?auto_229033 ) ) ( not ( = ?auto_229030 ?auto_229034 ) ) ( not ( = ?auto_229030 ?auto_229035 ) ) ( not ( = ?auto_229030 ?auto_229036 ) ) ( not ( = ?auto_229030 ?auto_229037 ) ) ( not ( = ?auto_229030 ?auto_229038 ) ) ( not ( = ?auto_229030 ?auto_229039 ) ) ( not ( = ?auto_229030 ?auto_229040 ) ) ( not ( = ?auto_229030 ?auto_229041 ) ) ( not ( = ?auto_229030 ?auto_229042 ) ) ( not ( = ?auto_229031 ?auto_229032 ) ) ( not ( = ?auto_229031 ?auto_229033 ) ) ( not ( = ?auto_229031 ?auto_229034 ) ) ( not ( = ?auto_229031 ?auto_229035 ) ) ( not ( = ?auto_229031 ?auto_229036 ) ) ( not ( = ?auto_229031 ?auto_229037 ) ) ( not ( = ?auto_229031 ?auto_229038 ) ) ( not ( = ?auto_229031 ?auto_229039 ) ) ( not ( = ?auto_229031 ?auto_229040 ) ) ( not ( = ?auto_229031 ?auto_229041 ) ) ( not ( = ?auto_229031 ?auto_229042 ) ) ( not ( = ?auto_229032 ?auto_229033 ) ) ( not ( = ?auto_229032 ?auto_229034 ) ) ( not ( = ?auto_229032 ?auto_229035 ) ) ( not ( = ?auto_229032 ?auto_229036 ) ) ( not ( = ?auto_229032 ?auto_229037 ) ) ( not ( = ?auto_229032 ?auto_229038 ) ) ( not ( = ?auto_229032 ?auto_229039 ) ) ( not ( = ?auto_229032 ?auto_229040 ) ) ( not ( = ?auto_229032 ?auto_229041 ) ) ( not ( = ?auto_229032 ?auto_229042 ) ) ( not ( = ?auto_229033 ?auto_229034 ) ) ( not ( = ?auto_229033 ?auto_229035 ) ) ( not ( = ?auto_229033 ?auto_229036 ) ) ( not ( = ?auto_229033 ?auto_229037 ) ) ( not ( = ?auto_229033 ?auto_229038 ) ) ( not ( = ?auto_229033 ?auto_229039 ) ) ( not ( = ?auto_229033 ?auto_229040 ) ) ( not ( = ?auto_229033 ?auto_229041 ) ) ( not ( = ?auto_229033 ?auto_229042 ) ) ( not ( = ?auto_229034 ?auto_229035 ) ) ( not ( = ?auto_229034 ?auto_229036 ) ) ( not ( = ?auto_229034 ?auto_229037 ) ) ( not ( = ?auto_229034 ?auto_229038 ) ) ( not ( = ?auto_229034 ?auto_229039 ) ) ( not ( = ?auto_229034 ?auto_229040 ) ) ( not ( = ?auto_229034 ?auto_229041 ) ) ( not ( = ?auto_229034 ?auto_229042 ) ) ( not ( = ?auto_229035 ?auto_229036 ) ) ( not ( = ?auto_229035 ?auto_229037 ) ) ( not ( = ?auto_229035 ?auto_229038 ) ) ( not ( = ?auto_229035 ?auto_229039 ) ) ( not ( = ?auto_229035 ?auto_229040 ) ) ( not ( = ?auto_229035 ?auto_229041 ) ) ( not ( = ?auto_229035 ?auto_229042 ) ) ( not ( = ?auto_229036 ?auto_229037 ) ) ( not ( = ?auto_229036 ?auto_229038 ) ) ( not ( = ?auto_229036 ?auto_229039 ) ) ( not ( = ?auto_229036 ?auto_229040 ) ) ( not ( = ?auto_229036 ?auto_229041 ) ) ( not ( = ?auto_229036 ?auto_229042 ) ) ( not ( = ?auto_229037 ?auto_229038 ) ) ( not ( = ?auto_229037 ?auto_229039 ) ) ( not ( = ?auto_229037 ?auto_229040 ) ) ( not ( = ?auto_229037 ?auto_229041 ) ) ( not ( = ?auto_229037 ?auto_229042 ) ) ( not ( = ?auto_229038 ?auto_229039 ) ) ( not ( = ?auto_229038 ?auto_229040 ) ) ( not ( = ?auto_229038 ?auto_229041 ) ) ( not ( = ?auto_229038 ?auto_229042 ) ) ( not ( = ?auto_229039 ?auto_229040 ) ) ( not ( = ?auto_229039 ?auto_229041 ) ) ( not ( = ?auto_229039 ?auto_229042 ) ) ( not ( = ?auto_229040 ?auto_229041 ) ) ( not ( = ?auto_229040 ?auto_229042 ) ) ( not ( = ?auto_229041 ?auto_229042 ) ) ( ON ?auto_229040 ?auto_229041 ) ( ON ?auto_229039 ?auto_229040 ) ( ON ?auto_229038 ?auto_229039 ) ( ON ?auto_229037 ?auto_229038 ) ( ON ?auto_229036 ?auto_229037 ) ( ON ?auto_229035 ?auto_229036 ) ( ON ?auto_229034 ?auto_229035 ) ( ON ?auto_229033 ?auto_229034 ) ( ON ?auto_229032 ?auto_229033 ) ( ON ?auto_229031 ?auto_229032 ) ( ON ?auto_229030 ?auto_229031 ) ( CLEAR ?auto_229030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_229030 )
      ( MAKE-12PILE ?auto_229030 ?auto_229031 ?auto_229032 ?auto_229033 ?auto_229034 ?auto_229035 ?auto_229036 ?auto_229037 ?auto_229038 ?auto_229039 ?auto_229040 ?auto_229041 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_229055 - BLOCK
      ?auto_229056 - BLOCK
      ?auto_229057 - BLOCK
      ?auto_229058 - BLOCK
      ?auto_229059 - BLOCK
      ?auto_229060 - BLOCK
      ?auto_229061 - BLOCK
      ?auto_229062 - BLOCK
      ?auto_229063 - BLOCK
      ?auto_229064 - BLOCK
      ?auto_229065 - BLOCK
      ?auto_229066 - BLOCK
    )
    :vars
    (
      ?auto_229067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229066 ?auto_229067 ) ( not ( = ?auto_229055 ?auto_229056 ) ) ( not ( = ?auto_229055 ?auto_229057 ) ) ( not ( = ?auto_229055 ?auto_229058 ) ) ( not ( = ?auto_229055 ?auto_229059 ) ) ( not ( = ?auto_229055 ?auto_229060 ) ) ( not ( = ?auto_229055 ?auto_229061 ) ) ( not ( = ?auto_229055 ?auto_229062 ) ) ( not ( = ?auto_229055 ?auto_229063 ) ) ( not ( = ?auto_229055 ?auto_229064 ) ) ( not ( = ?auto_229055 ?auto_229065 ) ) ( not ( = ?auto_229055 ?auto_229066 ) ) ( not ( = ?auto_229055 ?auto_229067 ) ) ( not ( = ?auto_229056 ?auto_229057 ) ) ( not ( = ?auto_229056 ?auto_229058 ) ) ( not ( = ?auto_229056 ?auto_229059 ) ) ( not ( = ?auto_229056 ?auto_229060 ) ) ( not ( = ?auto_229056 ?auto_229061 ) ) ( not ( = ?auto_229056 ?auto_229062 ) ) ( not ( = ?auto_229056 ?auto_229063 ) ) ( not ( = ?auto_229056 ?auto_229064 ) ) ( not ( = ?auto_229056 ?auto_229065 ) ) ( not ( = ?auto_229056 ?auto_229066 ) ) ( not ( = ?auto_229056 ?auto_229067 ) ) ( not ( = ?auto_229057 ?auto_229058 ) ) ( not ( = ?auto_229057 ?auto_229059 ) ) ( not ( = ?auto_229057 ?auto_229060 ) ) ( not ( = ?auto_229057 ?auto_229061 ) ) ( not ( = ?auto_229057 ?auto_229062 ) ) ( not ( = ?auto_229057 ?auto_229063 ) ) ( not ( = ?auto_229057 ?auto_229064 ) ) ( not ( = ?auto_229057 ?auto_229065 ) ) ( not ( = ?auto_229057 ?auto_229066 ) ) ( not ( = ?auto_229057 ?auto_229067 ) ) ( not ( = ?auto_229058 ?auto_229059 ) ) ( not ( = ?auto_229058 ?auto_229060 ) ) ( not ( = ?auto_229058 ?auto_229061 ) ) ( not ( = ?auto_229058 ?auto_229062 ) ) ( not ( = ?auto_229058 ?auto_229063 ) ) ( not ( = ?auto_229058 ?auto_229064 ) ) ( not ( = ?auto_229058 ?auto_229065 ) ) ( not ( = ?auto_229058 ?auto_229066 ) ) ( not ( = ?auto_229058 ?auto_229067 ) ) ( not ( = ?auto_229059 ?auto_229060 ) ) ( not ( = ?auto_229059 ?auto_229061 ) ) ( not ( = ?auto_229059 ?auto_229062 ) ) ( not ( = ?auto_229059 ?auto_229063 ) ) ( not ( = ?auto_229059 ?auto_229064 ) ) ( not ( = ?auto_229059 ?auto_229065 ) ) ( not ( = ?auto_229059 ?auto_229066 ) ) ( not ( = ?auto_229059 ?auto_229067 ) ) ( not ( = ?auto_229060 ?auto_229061 ) ) ( not ( = ?auto_229060 ?auto_229062 ) ) ( not ( = ?auto_229060 ?auto_229063 ) ) ( not ( = ?auto_229060 ?auto_229064 ) ) ( not ( = ?auto_229060 ?auto_229065 ) ) ( not ( = ?auto_229060 ?auto_229066 ) ) ( not ( = ?auto_229060 ?auto_229067 ) ) ( not ( = ?auto_229061 ?auto_229062 ) ) ( not ( = ?auto_229061 ?auto_229063 ) ) ( not ( = ?auto_229061 ?auto_229064 ) ) ( not ( = ?auto_229061 ?auto_229065 ) ) ( not ( = ?auto_229061 ?auto_229066 ) ) ( not ( = ?auto_229061 ?auto_229067 ) ) ( not ( = ?auto_229062 ?auto_229063 ) ) ( not ( = ?auto_229062 ?auto_229064 ) ) ( not ( = ?auto_229062 ?auto_229065 ) ) ( not ( = ?auto_229062 ?auto_229066 ) ) ( not ( = ?auto_229062 ?auto_229067 ) ) ( not ( = ?auto_229063 ?auto_229064 ) ) ( not ( = ?auto_229063 ?auto_229065 ) ) ( not ( = ?auto_229063 ?auto_229066 ) ) ( not ( = ?auto_229063 ?auto_229067 ) ) ( not ( = ?auto_229064 ?auto_229065 ) ) ( not ( = ?auto_229064 ?auto_229066 ) ) ( not ( = ?auto_229064 ?auto_229067 ) ) ( not ( = ?auto_229065 ?auto_229066 ) ) ( not ( = ?auto_229065 ?auto_229067 ) ) ( not ( = ?auto_229066 ?auto_229067 ) ) ( ON ?auto_229065 ?auto_229066 ) ( ON ?auto_229064 ?auto_229065 ) ( ON ?auto_229063 ?auto_229064 ) ( ON ?auto_229062 ?auto_229063 ) ( ON ?auto_229061 ?auto_229062 ) ( ON ?auto_229060 ?auto_229061 ) ( ON ?auto_229059 ?auto_229060 ) ( ON ?auto_229058 ?auto_229059 ) ( ON ?auto_229057 ?auto_229058 ) ( ON ?auto_229056 ?auto_229057 ) ( ON ?auto_229055 ?auto_229056 ) ( CLEAR ?auto_229055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_229055 )
      ( MAKE-12PILE ?auto_229055 ?auto_229056 ?auto_229057 ?auto_229058 ?auto_229059 ?auto_229060 ?auto_229061 ?auto_229062 ?auto_229063 ?auto_229064 ?auto_229065 ?auto_229066 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229081 - BLOCK
      ?auto_229082 - BLOCK
      ?auto_229083 - BLOCK
      ?auto_229084 - BLOCK
      ?auto_229085 - BLOCK
      ?auto_229086 - BLOCK
      ?auto_229087 - BLOCK
      ?auto_229088 - BLOCK
      ?auto_229089 - BLOCK
      ?auto_229090 - BLOCK
      ?auto_229091 - BLOCK
      ?auto_229092 - BLOCK
      ?auto_229093 - BLOCK
    )
    :vars
    (
      ?auto_229094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_229092 ) ( ON ?auto_229093 ?auto_229094 ) ( CLEAR ?auto_229093 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_229081 ) ( ON ?auto_229082 ?auto_229081 ) ( ON ?auto_229083 ?auto_229082 ) ( ON ?auto_229084 ?auto_229083 ) ( ON ?auto_229085 ?auto_229084 ) ( ON ?auto_229086 ?auto_229085 ) ( ON ?auto_229087 ?auto_229086 ) ( ON ?auto_229088 ?auto_229087 ) ( ON ?auto_229089 ?auto_229088 ) ( ON ?auto_229090 ?auto_229089 ) ( ON ?auto_229091 ?auto_229090 ) ( ON ?auto_229092 ?auto_229091 ) ( not ( = ?auto_229081 ?auto_229082 ) ) ( not ( = ?auto_229081 ?auto_229083 ) ) ( not ( = ?auto_229081 ?auto_229084 ) ) ( not ( = ?auto_229081 ?auto_229085 ) ) ( not ( = ?auto_229081 ?auto_229086 ) ) ( not ( = ?auto_229081 ?auto_229087 ) ) ( not ( = ?auto_229081 ?auto_229088 ) ) ( not ( = ?auto_229081 ?auto_229089 ) ) ( not ( = ?auto_229081 ?auto_229090 ) ) ( not ( = ?auto_229081 ?auto_229091 ) ) ( not ( = ?auto_229081 ?auto_229092 ) ) ( not ( = ?auto_229081 ?auto_229093 ) ) ( not ( = ?auto_229081 ?auto_229094 ) ) ( not ( = ?auto_229082 ?auto_229083 ) ) ( not ( = ?auto_229082 ?auto_229084 ) ) ( not ( = ?auto_229082 ?auto_229085 ) ) ( not ( = ?auto_229082 ?auto_229086 ) ) ( not ( = ?auto_229082 ?auto_229087 ) ) ( not ( = ?auto_229082 ?auto_229088 ) ) ( not ( = ?auto_229082 ?auto_229089 ) ) ( not ( = ?auto_229082 ?auto_229090 ) ) ( not ( = ?auto_229082 ?auto_229091 ) ) ( not ( = ?auto_229082 ?auto_229092 ) ) ( not ( = ?auto_229082 ?auto_229093 ) ) ( not ( = ?auto_229082 ?auto_229094 ) ) ( not ( = ?auto_229083 ?auto_229084 ) ) ( not ( = ?auto_229083 ?auto_229085 ) ) ( not ( = ?auto_229083 ?auto_229086 ) ) ( not ( = ?auto_229083 ?auto_229087 ) ) ( not ( = ?auto_229083 ?auto_229088 ) ) ( not ( = ?auto_229083 ?auto_229089 ) ) ( not ( = ?auto_229083 ?auto_229090 ) ) ( not ( = ?auto_229083 ?auto_229091 ) ) ( not ( = ?auto_229083 ?auto_229092 ) ) ( not ( = ?auto_229083 ?auto_229093 ) ) ( not ( = ?auto_229083 ?auto_229094 ) ) ( not ( = ?auto_229084 ?auto_229085 ) ) ( not ( = ?auto_229084 ?auto_229086 ) ) ( not ( = ?auto_229084 ?auto_229087 ) ) ( not ( = ?auto_229084 ?auto_229088 ) ) ( not ( = ?auto_229084 ?auto_229089 ) ) ( not ( = ?auto_229084 ?auto_229090 ) ) ( not ( = ?auto_229084 ?auto_229091 ) ) ( not ( = ?auto_229084 ?auto_229092 ) ) ( not ( = ?auto_229084 ?auto_229093 ) ) ( not ( = ?auto_229084 ?auto_229094 ) ) ( not ( = ?auto_229085 ?auto_229086 ) ) ( not ( = ?auto_229085 ?auto_229087 ) ) ( not ( = ?auto_229085 ?auto_229088 ) ) ( not ( = ?auto_229085 ?auto_229089 ) ) ( not ( = ?auto_229085 ?auto_229090 ) ) ( not ( = ?auto_229085 ?auto_229091 ) ) ( not ( = ?auto_229085 ?auto_229092 ) ) ( not ( = ?auto_229085 ?auto_229093 ) ) ( not ( = ?auto_229085 ?auto_229094 ) ) ( not ( = ?auto_229086 ?auto_229087 ) ) ( not ( = ?auto_229086 ?auto_229088 ) ) ( not ( = ?auto_229086 ?auto_229089 ) ) ( not ( = ?auto_229086 ?auto_229090 ) ) ( not ( = ?auto_229086 ?auto_229091 ) ) ( not ( = ?auto_229086 ?auto_229092 ) ) ( not ( = ?auto_229086 ?auto_229093 ) ) ( not ( = ?auto_229086 ?auto_229094 ) ) ( not ( = ?auto_229087 ?auto_229088 ) ) ( not ( = ?auto_229087 ?auto_229089 ) ) ( not ( = ?auto_229087 ?auto_229090 ) ) ( not ( = ?auto_229087 ?auto_229091 ) ) ( not ( = ?auto_229087 ?auto_229092 ) ) ( not ( = ?auto_229087 ?auto_229093 ) ) ( not ( = ?auto_229087 ?auto_229094 ) ) ( not ( = ?auto_229088 ?auto_229089 ) ) ( not ( = ?auto_229088 ?auto_229090 ) ) ( not ( = ?auto_229088 ?auto_229091 ) ) ( not ( = ?auto_229088 ?auto_229092 ) ) ( not ( = ?auto_229088 ?auto_229093 ) ) ( not ( = ?auto_229088 ?auto_229094 ) ) ( not ( = ?auto_229089 ?auto_229090 ) ) ( not ( = ?auto_229089 ?auto_229091 ) ) ( not ( = ?auto_229089 ?auto_229092 ) ) ( not ( = ?auto_229089 ?auto_229093 ) ) ( not ( = ?auto_229089 ?auto_229094 ) ) ( not ( = ?auto_229090 ?auto_229091 ) ) ( not ( = ?auto_229090 ?auto_229092 ) ) ( not ( = ?auto_229090 ?auto_229093 ) ) ( not ( = ?auto_229090 ?auto_229094 ) ) ( not ( = ?auto_229091 ?auto_229092 ) ) ( not ( = ?auto_229091 ?auto_229093 ) ) ( not ( = ?auto_229091 ?auto_229094 ) ) ( not ( = ?auto_229092 ?auto_229093 ) ) ( not ( = ?auto_229092 ?auto_229094 ) ) ( not ( = ?auto_229093 ?auto_229094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229093 ?auto_229094 )
      ( !STACK ?auto_229093 ?auto_229092 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229108 - BLOCK
      ?auto_229109 - BLOCK
      ?auto_229110 - BLOCK
      ?auto_229111 - BLOCK
      ?auto_229112 - BLOCK
      ?auto_229113 - BLOCK
      ?auto_229114 - BLOCK
      ?auto_229115 - BLOCK
      ?auto_229116 - BLOCK
      ?auto_229117 - BLOCK
      ?auto_229118 - BLOCK
      ?auto_229119 - BLOCK
      ?auto_229120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_229119 ) ( ON-TABLE ?auto_229120 ) ( CLEAR ?auto_229120 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_229108 ) ( ON ?auto_229109 ?auto_229108 ) ( ON ?auto_229110 ?auto_229109 ) ( ON ?auto_229111 ?auto_229110 ) ( ON ?auto_229112 ?auto_229111 ) ( ON ?auto_229113 ?auto_229112 ) ( ON ?auto_229114 ?auto_229113 ) ( ON ?auto_229115 ?auto_229114 ) ( ON ?auto_229116 ?auto_229115 ) ( ON ?auto_229117 ?auto_229116 ) ( ON ?auto_229118 ?auto_229117 ) ( ON ?auto_229119 ?auto_229118 ) ( not ( = ?auto_229108 ?auto_229109 ) ) ( not ( = ?auto_229108 ?auto_229110 ) ) ( not ( = ?auto_229108 ?auto_229111 ) ) ( not ( = ?auto_229108 ?auto_229112 ) ) ( not ( = ?auto_229108 ?auto_229113 ) ) ( not ( = ?auto_229108 ?auto_229114 ) ) ( not ( = ?auto_229108 ?auto_229115 ) ) ( not ( = ?auto_229108 ?auto_229116 ) ) ( not ( = ?auto_229108 ?auto_229117 ) ) ( not ( = ?auto_229108 ?auto_229118 ) ) ( not ( = ?auto_229108 ?auto_229119 ) ) ( not ( = ?auto_229108 ?auto_229120 ) ) ( not ( = ?auto_229109 ?auto_229110 ) ) ( not ( = ?auto_229109 ?auto_229111 ) ) ( not ( = ?auto_229109 ?auto_229112 ) ) ( not ( = ?auto_229109 ?auto_229113 ) ) ( not ( = ?auto_229109 ?auto_229114 ) ) ( not ( = ?auto_229109 ?auto_229115 ) ) ( not ( = ?auto_229109 ?auto_229116 ) ) ( not ( = ?auto_229109 ?auto_229117 ) ) ( not ( = ?auto_229109 ?auto_229118 ) ) ( not ( = ?auto_229109 ?auto_229119 ) ) ( not ( = ?auto_229109 ?auto_229120 ) ) ( not ( = ?auto_229110 ?auto_229111 ) ) ( not ( = ?auto_229110 ?auto_229112 ) ) ( not ( = ?auto_229110 ?auto_229113 ) ) ( not ( = ?auto_229110 ?auto_229114 ) ) ( not ( = ?auto_229110 ?auto_229115 ) ) ( not ( = ?auto_229110 ?auto_229116 ) ) ( not ( = ?auto_229110 ?auto_229117 ) ) ( not ( = ?auto_229110 ?auto_229118 ) ) ( not ( = ?auto_229110 ?auto_229119 ) ) ( not ( = ?auto_229110 ?auto_229120 ) ) ( not ( = ?auto_229111 ?auto_229112 ) ) ( not ( = ?auto_229111 ?auto_229113 ) ) ( not ( = ?auto_229111 ?auto_229114 ) ) ( not ( = ?auto_229111 ?auto_229115 ) ) ( not ( = ?auto_229111 ?auto_229116 ) ) ( not ( = ?auto_229111 ?auto_229117 ) ) ( not ( = ?auto_229111 ?auto_229118 ) ) ( not ( = ?auto_229111 ?auto_229119 ) ) ( not ( = ?auto_229111 ?auto_229120 ) ) ( not ( = ?auto_229112 ?auto_229113 ) ) ( not ( = ?auto_229112 ?auto_229114 ) ) ( not ( = ?auto_229112 ?auto_229115 ) ) ( not ( = ?auto_229112 ?auto_229116 ) ) ( not ( = ?auto_229112 ?auto_229117 ) ) ( not ( = ?auto_229112 ?auto_229118 ) ) ( not ( = ?auto_229112 ?auto_229119 ) ) ( not ( = ?auto_229112 ?auto_229120 ) ) ( not ( = ?auto_229113 ?auto_229114 ) ) ( not ( = ?auto_229113 ?auto_229115 ) ) ( not ( = ?auto_229113 ?auto_229116 ) ) ( not ( = ?auto_229113 ?auto_229117 ) ) ( not ( = ?auto_229113 ?auto_229118 ) ) ( not ( = ?auto_229113 ?auto_229119 ) ) ( not ( = ?auto_229113 ?auto_229120 ) ) ( not ( = ?auto_229114 ?auto_229115 ) ) ( not ( = ?auto_229114 ?auto_229116 ) ) ( not ( = ?auto_229114 ?auto_229117 ) ) ( not ( = ?auto_229114 ?auto_229118 ) ) ( not ( = ?auto_229114 ?auto_229119 ) ) ( not ( = ?auto_229114 ?auto_229120 ) ) ( not ( = ?auto_229115 ?auto_229116 ) ) ( not ( = ?auto_229115 ?auto_229117 ) ) ( not ( = ?auto_229115 ?auto_229118 ) ) ( not ( = ?auto_229115 ?auto_229119 ) ) ( not ( = ?auto_229115 ?auto_229120 ) ) ( not ( = ?auto_229116 ?auto_229117 ) ) ( not ( = ?auto_229116 ?auto_229118 ) ) ( not ( = ?auto_229116 ?auto_229119 ) ) ( not ( = ?auto_229116 ?auto_229120 ) ) ( not ( = ?auto_229117 ?auto_229118 ) ) ( not ( = ?auto_229117 ?auto_229119 ) ) ( not ( = ?auto_229117 ?auto_229120 ) ) ( not ( = ?auto_229118 ?auto_229119 ) ) ( not ( = ?auto_229118 ?auto_229120 ) ) ( not ( = ?auto_229119 ?auto_229120 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_229120 )
      ( !STACK ?auto_229120 ?auto_229119 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229134 - BLOCK
      ?auto_229135 - BLOCK
      ?auto_229136 - BLOCK
      ?auto_229137 - BLOCK
      ?auto_229138 - BLOCK
      ?auto_229139 - BLOCK
      ?auto_229140 - BLOCK
      ?auto_229141 - BLOCK
      ?auto_229142 - BLOCK
      ?auto_229143 - BLOCK
      ?auto_229144 - BLOCK
      ?auto_229145 - BLOCK
      ?auto_229146 - BLOCK
    )
    :vars
    (
      ?auto_229147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229146 ?auto_229147 ) ( ON-TABLE ?auto_229134 ) ( ON ?auto_229135 ?auto_229134 ) ( ON ?auto_229136 ?auto_229135 ) ( ON ?auto_229137 ?auto_229136 ) ( ON ?auto_229138 ?auto_229137 ) ( ON ?auto_229139 ?auto_229138 ) ( ON ?auto_229140 ?auto_229139 ) ( ON ?auto_229141 ?auto_229140 ) ( ON ?auto_229142 ?auto_229141 ) ( ON ?auto_229143 ?auto_229142 ) ( ON ?auto_229144 ?auto_229143 ) ( not ( = ?auto_229134 ?auto_229135 ) ) ( not ( = ?auto_229134 ?auto_229136 ) ) ( not ( = ?auto_229134 ?auto_229137 ) ) ( not ( = ?auto_229134 ?auto_229138 ) ) ( not ( = ?auto_229134 ?auto_229139 ) ) ( not ( = ?auto_229134 ?auto_229140 ) ) ( not ( = ?auto_229134 ?auto_229141 ) ) ( not ( = ?auto_229134 ?auto_229142 ) ) ( not ( = ?auto_229134 ?auto_229143 ) ) ( not ( = ?auto_229134 ?auto_229144 ) ) ( not ( = ?auto_229134 ?auto_229145 ) ) ( not ( = ?auto_229134 ?auto_229146 ) ) ( not ( = ?auto_229134 ?auto_229147 ) ) ( not ( = ?auto_229135 ?auto_229136 ) ) ( not ( = ?auto_229135 ?auto_229137 ) ) ( not ( = ?auto_229135 ?auto_229138 ) ) ( not ( = ?auto_229135 ?auto_229139 ) ) ( not ( = ?auto_229135 ?auto_229140 ) ) ( not ( = ?auto_229135 ?auto_229141 ) ) ( not ( = ?auto_229135 ?auto_229142 ) ) ( not ( = ?auto_229135 ?auto_229143 ) ) ( not ( = ?auto_229135 ?auto_229144 ) ) ( not ( = ?auto_229135 ?auto_229145 ) ) ( not ( = ?auto_229135 ?auto_229146 ) ) ( not ( = ?auto_229135 ?auto_229147 ) ) ( not ( = ?auto_229136 ?auto_229137 ) ) ( not ( = ?auto_229136 ?auto_229138 ) ) ( not ( = ?auto_229136 ?auto_229139 ) ) ( not ( = ?auto_229136 ?auto_229140 ) ) ( not ( = ?auto_229136 ?auto_229141 ) ) ( not ( = ?auto_229136 ?auto_229142 ) ) ( not ( = ?auto_229136 ?auto_229143 ) ) ( not ( = ?auto_229136 ?auto_229144 ) ) ( not ( = ?auto_229136 ?auto_229145 ) ) ( not ( = ?auto_229136 ?auto_229146 ) ) ( not ( = ?auto_229136 ?auto_229147 ) ) ( not ( = ?auto_229137 ?auto_229138 ) ) ( not ( = ?auto_229137 ?auto_229139 ) ) ( not ( = ?auto_229137 ?auto_229140 ) ) ( not ( = ?auto_229137 ?auto_229141 ) ) ( not ( = ?auto_229137 ?auto_229142 ) ) ( not ( = ?auto_229137 ?auto_229143 ) ) ( not ( = ?auto_229137 ?auto_229144 ) ) ( not ( = ?auto_229137 ?auto_229145 ) ) ( not ( = ?auto_229137 ?auto_229146 ) ) ( not ( = ?auto_229137 ?auto_229147 ) ) ( not ( = ?auto_229138 ?auto_229139 ) ) ( not ( = ?auto_229138 ?auto_229140 ) ) ( not ( = ?auto_229138 ?auto_229141 ) ) ( not ( = ?auto_229138 ?auto_229142 ) ) ( not ( = ?auto_229138 ?auto_229143 ) ) ( not ( = ?auto_229138 ?auto_229144 ) ) ( not ( = ?auto_229138 ?auto_229145 ) ) ( not ( = ?auto_229138 ?auto_229146 ) ) ( not ( = ?auto_229138 ?auto_229147 ) ) ( not ( = ?auto_229139 ?auto_229140 ) ) ( not ( = ?auto_229139 ?auto_229141 ) ) ( not ( = ?auto_229139 ?auto_229142 ) ) ( not ( = ?auto_229139 ?auto_229143 ) ) ( not ( = ?auto_229139 ?auto_229144 ) ) ( not ( = ?auto_229139 ?auto_229145 ) ) ( not ( = ?auto_229139 ?auto_229146 ) ) ( not ( = ?auto_229139 ?auto_229147 ) ) ( not ( = ?auto_229140 ?auto_229141 ) ) ( not ( = ?auto_229140 ?auto_229142 ) ) ( not ( = ?auto_229140 ?auto_229143 ) ) ( not ( = ?auto_229140 ?auto_229144 ) ) ( not ( = ?auto_229140 ?auto_229145 ) ) ( not ( = ?auto_229140 ?auto_229146 ) ) ( not ( = ?auto_229140 ?auto_229147 ) ) ( not ( = ?auto_229141 ?auto_229142 ) ) ( not ( = ?auto_229141 ?auto_229143 ) ) ( not ( = ?auto_229141 ?auto_229144 ) ) ( not ( = ?auto_229141 ?auto_229145 ) ) ( not ( = ?auto_229141 ?auto_229146 ) ) ( not ( = ?auto_229141 ?auto_229147 ) ) ( not ( = ?auto_229142 ?auto_229143 ) ) ( not ( = ?auto_229142 ?auto_229144 ) ) ( not ( = ?auto_229142 ?auto_229145 ) ) ( not ( = ?auto_229142 ?auto_229146 ) ) ( not ( = ?auto_229142 ?auto_229147 ) ) ( not ( = ?auto_229143 ?auto_229144 ) ) ( not ( = ?auto_229143 ?auto_229145 ) ) ( not ( = ?auto_229143 ?auto_229146 ) ) ( not ( = ?auto_229143 ?auto_229147 ) ) ( not ( = ?auto_229144 ?auto_229145 ) ) ( not ( = ?auto_229144 ?auto_229146 ) ) ( not ( = ?auto_229144 ?auto_229147 ) ) ( not ( = ?auto_229145 ?auto_229146 ) ) ( not ( = ?auto_229145 ?auto_229147 ) ) ( not ( = ?auto_229146 ?auto_229147 ) ) ( CLEAR ?auto_229144 ) ( ON ?auto_229145 ?auto_229146 ) ( CLEAR ?auto_229145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_229134 ?auto_229135 ?auto_229136 ?auto_229137 ?auto_229138 ?auto_229139 ?auto_229140 ?auto_229141 ?auto_229142 ?auto_229143 ?auto_229144 ?auto_229145 )
      ( MAKE-13PILE ?auto_229134 ?auto_229135 ?auto_229136 ?auto_229137 ?auto_229138 ?auto_229139 ?auto_229140 ?auto_229141 ?auto_229142 ?auto_229143 ?auto_229144 ?auto_229145 ?auto_229146 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229161 - BLOCK
      ?auto_229162 - BLOCK
      ?auto_229163 - BLOCK
      ?auto_229164 - BLOCK
      ?auto_229165 - BLOCK
      ?auto_229166 - BLOCK
      ?auto_229167 - BLOCK
      ?auto_229168 - BLOCK
      ?auto_229169 - BLOCK
      ?auto_229170 - BLOCK
      ?auto_229171 - BLOCK
      ?auto_229172 - BLOCK
      ?auto_229173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229173 ) ( ON-TABLE ?auto_229161 ) ( ON ?auto_229162 ?auto_229161 ) ( ON ?auto_229163 ?auto_229162 ) ( ON ?auto_229164 ?auto_229163 ) ( ON ?auto_229165 ?auto_229164 ) ( ON ?auto_229166 ?auto_229165 ) ( ON ?auto_229167 ?auto_229166 ) ( ON ?auto_229168 ?auto_229167 ) ( ON ?auto_229169 ?auto_229168 ) ( ON ?auto_229170 ?auto_229169 ) ( ON ?auto_229171 ?auto_229170 ) ( not ( = ?auto_229161 ?auto_229162 ) ) ( not ( = ?auto_229161 ?auto_229163 ) ) ( not ( = ?auto_229161 ?auto_229164 ) ) ( not ( = ?auto_229161 ?auto_229165 ) ) ( not ( = ?auto_229161 ?auto_229166 ) ) ( not ( = ?auto_229161 ?auto_229167 ) ) ( not ( = ?auto_229161 ?auto_229168 ) ) ( not ( = ?auto_229161 ?auto_229169 ) ) ( not ( = ?auto_229161 ?auto_229170 ) ) ( not ( = ?auto_229161 ?auto_229171 ) ) ( not ( = ?auto_229161 ?auto_229172 ) ) ( not ( = ?auto_229161 ?auto_229173 ) ) ( not ( = ?auto_229162 ?auto_229163 ) ) ( not ( = ?auto_229162 ?auto_229164 ) ) ( not ( = ?auto_229162 ?auto_229165 ) ) ( not ( = ?auto_229162 ?auto_229166 ) ) ( not ( = ?auto_229162 ?auto_229167 ) ) ( not ( = ?auto_229162 ?auto_229168 ) ) ( not ( = ?auto_229162 ?auto_229169 ) ) ( not ( = ?auto_229162 ?auto_229170 ) ) ( not ( = ?auto_229162 ?auto_229171 ) ) ( not ( = ?auto_229162 ?auto_229172 ) ) ( not ( = ?auto_229162 ?auto_229173 ) ) ( not ( = ?auto_229163 ?auto_229164 ) ) ( not ( = ?auto_229163 ?auto_229165 ) ) ( not ( = ?auto_229163 ?auto_229166 ) ) ( not ( = ?auto_229163 ?auto_229167 ) ) ( not ( = ?auto_229163 ?auto_229168 ) ) ( not ( = ?auto_229163 ?auto_229169 ) ) ( not ( = ?auto_229163 ?auto_229170 ) ) ( not ( = ?auto_229163 ?auto_229171 ) ) ( not ( = ?auto_229163 ?auto_229172 ) ) ( not ( = ?auto_229163 ?auto_229173 ) ) ( not ( = ?auto_229164 ?auto_229165 ) ) ( not ( = ?auto_229164 ?auto_229166 ) ) ( not ( = ?auto_229164 ?auto_229167 ) ) ( not ( = ?auto_229164 ?auto_229168 ) ) ( not ( = ?auto_229164 ?auto_229169 ) ) ( not ( = ?auto_229164 ?auto_229170 ) ) ( not ( = ?auto_229164 ?auto_229171 ) ) ( not ( = ?auto_229164 ?auto_229172 ) ) ( not ( = ?auto_229164 ?auto_229173 ) ) ( not ( = ?auto_229165 ?auto_229166 ) ) ( not ( = ?auto_229165 ?auto_229167 ) ) ( not ( = ?auto_229165 ?auto_229168 ) ) ( not ( = ?auto_229165 ?auto_229169 ) ) ( not ( = ?auto_229165 ?auto_229170 ) ) ( not ( = ?auto_229165 ?auto_229171 ) ) ( not ( = ?auto_229165 ?auto_229172 ) ) ( not ( = ?auto_229165 ?auto_229173 ) ) ( not ( = ?auto_229166 ?auto_229167 ) ) ( not ( = ?auto_229166 ?auto_229168 ) ) ( not ( = ?auto_229166 ?auto_229169 ) ) ( not ( = ?auto_229166 ?auto_229170 ) ) ( not ( = ?auto_229166 ?auto_229171 ) ) ( not ( = ?auto_229166 ?auto_229172 ) ) ( not ( = ?auto_229166 ?auto_229173 ) ) ( not ( = ?auto_229167 ?auto_229168 ) ) ( not ( = ?auto_229167 ?auto_229169 ) ) ( not ( = ?auto_229167 ?auto_229170 ) ) ( not ( = ?auto_229167 ?auto_229171 ) ) ( not ( = ?auto_229167 ?auto_229172 ) ) ( not ( = ?auto_229167 ?auto_229173 ) ) ( not ( = ?auto_229168 ?auto_229169 ) ) ( not ( = ?auto_229168 ?auto_229170 ) ) ( not ( = ?auto_229168 ?auto_229171 ) ) ( not ( = ?auto_229168 ?auto_229172 ) ) ( not ( = ?auto_229168 ?auto_229173 ) ) ( not ( = ?auto_229169 ?auto_229170 ) ) ( not ( = ?auto_229169 ?auto_229171 ) ) ( not ( = ?auto_229169 ?auto_229172 ) ) ( not ( = ?auto_229169 ?auto_229173 ) ) ( not ( = ?auto_229170 ?auto_229171 ) ) ( not ( = ?auto_229170 ?auto_229172 ) ) ( not ( = ?auto_229170 ?auto_229173 ) ) ( not ( = ?auto_229171 ?auto_229172 ) ) ( not ( = ?auto_229171 ?auto_229173 ) ) ( not ( = ?auto_229172 ?auto_229173 ) ) ( CLEAR ?auto_229171 ) ( ON ?auto_229172 ?auto_229173 ) ( CLEAR ?auto_229172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_229161 ?auto_229162 ?auto_229163 ?auto_229164 ?auto_229165 ?auto_229166 ?auto_229167 ?auto_229168 ?auto_229169 ?auto_229170 ?auto_229171 ?auto_229172 )
      ( MAKE-13PILE ?auto_229161 ?auto_229162 ?auto_229163 ?auto_229164 ?auto_229165 ?auto_229166 ?auto_229167 ?auto_229168 ?auto_229169 ?auto_229170 ?auto_229171 ?auto_229172 ?auto_229173 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229187 - BLOCK
      ?auto_229188 - BLOCK
      ?auto_229189 - BLOCK
      ?auto_229190 - BLOCK
      ?auto_229191 - BLOCK
      ?auto_229192 - BLOCK
      ?auto_229193 - BLOCK
      ?auto_229194 - BLOCK
      ?auto_229195 - BLOCK
      ?auto_229196 - BLOCK
      ?auto_229197 - BLOCK
      ?auto_229198 - BLOCK
      ?auto_229199 - BLOCK
    )
    :vars
    (
      ?auto_229200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229199 ?auto_229200 ) ( ON-TABLE ?auto_229187 ) ( ON ?auto_229188 ?auto_229187 ) ( ON ?auto_229189 ?auto_229188 ) ( ON ?auto_229190 ?auto_229189 ) ( ON ?auto_229191 ?auto_229190 ) ( ON ?auto_229192 ?auto_229191 ) ( ON ?auto_229193 ?auto_229192 ) ( ON ?auto_229194 ?auto_229193 ) ( ON ?auto_229195 ?auto_229194 ) ( ON ?auto_229196 ?auto_229195 ) ( not ( = ?auto_229187 ?auto_229188 ) ) ( not ( = ?auto_229187 ?auto_229189 ) ) ( not ( = ?auto_229187 ?auto_229190 ) ) ( not ( = ?auto_229187 ?auto_229191 ) ) ( not ( = ?auto_229187 ?auto_229192 ) ) ( not ( = ?auto_229187 ?auto_229193 ) ) ( not ( = ?auto_229187 ?auto_229194 ) ) ( not ( = ?auto_229187 ?auto_229195 ) ) ( not ( = ?auto_229187 ?auto_229196 ) ) ( not ( = ?auto_229187 ?auto_229197 ) ) ( not ( = ?auto_229187 ?auto_229198 ) ) ( not ( = ?auto_229187 ?auto_229199 ) ) ( not ( = ?auto_229187 ?auto_229200 ) ) ( not ( = ?auto_229188 ?auto_229189 ) ) ( not ( = ?auto_229188 ?auto_229190 ) ) ( not ( = ?auto_229188 ?auto_229191 ) ) ( not ( = ?auto_229188 ?auto_229192 ) ) ( not ( = ?auto_229188 ?auto_229193 ) ) ( not ( = ?auto_229188 ?auto_229194 ) ) ( not ( = ?auto_229188 ?auto_229195 ) ) ( not ( = ?auto_229188 ?auto_229196 ) ) ( not ( = ?auto_229188 ?auto_229197 ) ) ( not ( = ?auto_229188 ?auto_229198 ) ) ( not ( = ?auto_229188 ?auto_229199 ) ) ( not ( = ?auto_229188 ?auto_229200 ) ) ( not ( = ?auto_229189 ?auto_229190 ) ) ( not ( = ?auto_229189 ?auto_229191 ) ) ( not ( = ?auto_229189 ?auto_229192 ) ) ( not ( = ?auto_229189 ?auto_229193 ) ) ( not ( = ?auto_229189 ?auto_229194 ) ) ( not ( = ?auto_229189 ?auto_229195 ) ) ( not ( = ?auto_229189 ?auto_229196 ) ) ( not ( = ?auto_229189 ?auto_229197 ) ) ( not ( = ?auto_229189 ?auto_229198 ) ) ( not ( = ?auto_229189 ?auto_229199 ) ) ( not ( = ?auto_229189 ?auto_229200 ) ) ( not ( = ?auto_229190 ?auto_229191 ) ) ( not ( = ?auto_229190 ?auto_229192 ) ) ( not ( = ?auto_229190 ?auto_229193 ) ) ( not ( = ?auto_229190 ?auto_229194 ) ) ( not ( = ?auto_229190 ?auto_229195 ) ) ( not ( = ?auto_229190 ?auto_229196 ) ) ( not ( = ?auto_229190 ?auto_229197 ) ) ( not ( = ?auto_229190 ?auto_229198 ) ) ( not ( = ?auto_229190 ?auto_229199 ) ) ( not ( = ?auto_229190 ?auto_229200 ) ) ( not ( = ?auto_229191 ?auto_229192 ) ) ( not ( = ?auto_229191 ?auto_229193 ) ) ( not ( = ?auto_229191 ?auto_229194 ) ) ( not ( = ?auto_229191 ?auto_229195 ) ) ( not ( = ?auto_229191 ?auto_229196 ) ) ( not ( = ?auto_229191 ?auto_229197 ) ) ( not ( = ?auto_229191 ?auto_229198 ) ) ( not ( = ?auto_229191 ?auto_229199 ) ) ( not ( = ?auto_229191 ?auto_229200 ) ) ( not ( = ?auto_229192 ?auto_229193 ) ) ( not ( = ?auto_229192 ?auto_229194 ) ) ( not ( = ?auto_229192 ?auto_229195 ) ) ( not ( = ?auto_229192 ?auto_229196 ) ) ( not ( = ?auto_229192 ?auto_229197 ) ) ( not ( = ?auto_229192 ?auto_229198 ) ) ( not ( = ?auto_229192 ?auto_229199 ) ) ( not ( = ?auto_229192 ?auto_229200 ) ) ( not ( = ?auto_229193 ?auto_229194 ) ) ( not ( = ?auto_229193 ?auto_229195 ) ) ( not ( = ?auto_229193 ?auto_229196 ) ) ( not ( = ?auto_229193 ?auto_229197 ) ) ( not ( = ?auto_229193 ?auto_229198 ) ) ( not ( = ?auto_229193 ?auto_229199 ) ) ( not ( = ?auto_229193 ?auto_229200 ) ) ( not ( = ?auto_229194 ?auto_229195 ) ) ( not ( = ?auto_229194 ?auto_229196 ) ) ( not ( = ?auto_229194 ?auto_229197 ) ) ( not ( = ?auto_229194 ?auto_229198 ) ) ( not ( = ?auto_229194 ?auto_229199 ) ) ( not ( = ?auto_229194 ?auto_229200 ) ) ( not ( = ?auto_229195 ?auto_229196 ) ) ( not ( = ?auto_229195 ?auto_229197 ) ) ( not ( = ?auto_229195 ?auto_229198 ) ) ( not ( = ?auto_229195 ?auto_229199 ) ) ( not ( = ?auto_229195 ?auto_229200 ) ) ( not ( = ?auto_229196 ?auto_229197 ) ) ( not ( = ?auto_229196 ?auto_229198 ) ) ( not ( = ?auto_229196 ?auto_229199 ) ) ( not ( = ?auto_229196 ?auto_229200 ) ) ( not ( = ?auto_229197 ?auto_229198 ) ) ( not ( = ?auto_229197 ?auto_229199 ) ) ( not ( = ?auto_229197 ?auto_229200 ) ) ( not ( = ?auto_229198 ?auto_229199 ) ) ( not ( = ?auto_229198 ?auto_229200 ) ) ( not ( = ?auto_229199 ?auto_229200 ) ) ( ON ?auto_229198 ?auto_229199 ) ( CLEAR ?auto_229196 ) ( ON ?auto_229197 ?auto_229198 ) ( CLEAR ?auto_229197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_229187 ?auto_229188 ?auto_229189 ?auto_229190 ?auto_229191 ?auto_229192 ?auto_229193 ?auto_229194 ?auto_229195 ?auto_229196 ?auto_229197 )
      ( MAKE-13PILE ?auto_229187 ?auto_229188 ?auto_229189 ?auto_229190 ?auto_229191 ?auto_229192 ?auto_229193 ?auto_229194 ?auto_229195 ?auto_229196 ?auto_229197 ?auto_229198 ?auto_229199 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229214 - BLOCK
      ?auto_229215 - BLOCK
      ?auto_229216 - BLOCK
      ?auto_229217 - BLOCK
      ?auto_229218 - BLOCK
      ?auto_229219 - BLOCK
      ?auto_229220 - BLOCK
      ?auto_229221 - BLOCK
      ?auto_229222 - BLOCK
      ?auto_229223 - BLOCK
      ?auto_229224 - BLOCK
      ?auto_229225 - BLOCK
      ?auto_229226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229226 ) ( ON-TABLE ?auto_229214 ) ( ON ?auto_229215 ?auto_229214 ) ( ON ?auto_229216 ?auto_229215 ) ( ON ?auto_229217 ?auto_229216 ) ( ON ?auto_229218 ?auto_229217 ) ( ON ?auto_229219 ?auto_229218 ) ( ON ?auto_229220 ?auto_229219 ) ( ON ?auto_229221 ?auto_229220 ) ( ON ?auto_229222 ?auto_229221 ) ( ON ?auto_229223 ?auto_229222 ) ( not ( = ?auto_229214 ?auto_229215 ) ) ( not ( = ?auto_229214 ?auto_229216 ) ) ( not ( = ?auto_229214 ?auto_229217 ) ) ( not ( = ?auto_229214 ?auto_229218 ) ) ( not ( = ?auto_229214 ?auto_229219 ) ) ( not ( = ?auto_229214 ?auto_229220 ) ) ( not ( = ?auto_229214 ?auto_229221 ) ) ( not ( = ?auto_229214 ?auto_229222 ) ) ( not ( = ?auto_229214 ?auto_229223 ) ) ( not ( = ?auto_229214 ?auto_229224 ) ) ( not ( = ?auto_229214 ?auto_229225 ) ) ( not ( = ?auto_229214 ?auto_229226 ) ) ( not ( = ?auto_229215 ?auto_229216 ) ) ( not ( = ?auto_229215 ?auto_229217 ) ) ( not ( = ?auto_229215 ?auto_229218 ) ) ( not ( = ?auto_229215 ?auto_229219 ) ) ( not ( = ?auto_229215 ?auto_229220 ) ) ( not ( = ?auto_229215 ?auto_229221 ) ) ( not ( = ?auto_229215 ?auto_229222 ) ) ( not ( = ?auto_229215 ?auto_229223 ) ) ( not ( = ?auto_229215 ?auto_229224 ) ) ( not ( = ?auto_229215 ?auto_229225 ) ) ( not ( = ?auto_229215 ?auto_229226 ) ) ( not ( = ?auto_229216 ?auto_229217 ) ) ( not ( = ?auto_229216 ?auto_229218 ) ) ( not ( = ?auto_229216 ?auto_229219 ) ) ( not ( = ?auto_229216 ?auto_229220 ) ) ( not ( = ?auto_229216 ?auto_229221 ) ) ( not ( = ?auto_229216 ?auto_229222 ) ) ( not ( = ?auto_229216 ?auto_229223 ) ) ( not ( = ?auto_229216 ?auto_229224 ) ) ( not ( = ?auto_229216 ?auto_229225 ) ) ( not ( = ?auto_229216 ?auto_229226 ) ) ( not ( = ?auto_229217 ?auto_229218 ) ) ( not ( = ?auto_229217 ?auto_229219 ) ) ( not ( = ?auto_229217 ?auto_229220 ) ) ( not ( = ?auto_229217 ?auto_229221 ) ) ( not ( = ?auto_229217 ?auto_229222 ) ) ( not ( = ?auto_229217 ?auto_229223 ) ) ( not ( = ?auto_229217 ?auto_229224 ) ) ( not ( = ?auto_229217 ?auto_229225 ) ) ( not ( = ?auto_229217 ?auto_229226 ) ) ( not ( = ?auto_229218 ?auto_229219 ) ) ( not ( = ?auto_229218 ?auto_229220 ) ) ( not ( = ?auto_229218 ?auto_229221 ) ) ( not ( = ?auto_229218 ?auto_229222 ) ) ( not ( = ?auto_229218 ?auto_229223 ) ) ( not ( = ?auto_229218 ?auto_229224 ) ) ( not ( = ?auto_229218 ?auto_229225 ) ) ( not ( = ?auto_229218 ?auto_229226 ) ) ( not ( = ?auto_229219 ?auto_229220 ) ) ( not ( = ?auto_229219 ?auto_229221 ) ) ( not ( = ?auto_229219 ?auto_229222 ) ) ( not ( = ?auto_229219 ?auto_229223 ) ) ( not ( = ?auto_229219 ?auto_229224 ) ) ( not ( = ?auto_229219 ?auto_229225 ) ) ( not ( = ?auto_229219 ?auto_229226 ) ) ( not ( = ?auto_229220 ?auto_229221 ) ) ( not ( = ?auto_229220 ?auto_229222 ) ) ( not ( = ?auto_229220 ?auto_229223 ) ) ( not ( = ?auto_229220 ?auto_229224 ) ) ( not ( = ?auto_229220 ?auto_229225 ) ) ( not ( = ?auto_229220 ?auto_229226 ) ) ( not ( = ?auto_229221 ?auto_229222 ) ) ( not ( = ?auto_229221 ?auto_229223 ) ) ( not ( = ?auto_229221 ?auto_229224 ) ) ( not ( = ?auto_229221 ?auto_229225 ) ) ( not ( = ?auto_229221 ?auto_229226 ) ) ( not ( = ?auto_229222 ?auto_229223 ) ) ( not ( = ?auto_229222 ?auto_229224 ) ) ( not ( = ?auto_229222 ?auto_229225 ) ) ( not ( = ?auto_229222 ?auto_229226 ) ) ( not ( = ?auto_229223 ?auto_229224 ) ) ( not ( = ?auto_229223 ?auto_229225 ) ) ( not ( = ?auto_229223 ?auto_229226 ) ) ( not ( = ?auto_229224 ?auto_229225 ) ) ( not ( = ?auto_229224 ?auto_229226 ) ) ( not ( = ?auto_229225 ?auto_229226 ) ) ( ON ?auto_229225 ?auto_229226 ) ( CLEAR ?auto_229223 ) ( ON ?auto_229224 ?auto_229225 ) ( CLEAR ?auto_229224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_229214 ?auto_229215 ?auto_229216 ?auto_229217 ?auto_229218 ?auto_229219 ?auto_229220 ?auto_229221 ?auto_229222 ?auto_229223 ?auto_229224 )
      ( MAKE-13PILE ?auto_229214 ?auto_229215 ?auto_229216 ?auto_229217 ?auto_229218 ?auto_229219 ?auto_229220 ?auto_229221 ?auto_229222 ?auto_229223 ?auto_229224 ?auto_229225 ?auto_229226 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229240 - BLOCK
      ?auto_229241 - BLOCK
      ?auto_229242 - BLOCK
      ?auto_229243 - BLOCK
      ?auto_229244 - BLOCK
      ?auto_229245 - BLOCK
      ?auto_229246 - BLOCK
      ?auto_229247 - BLOCK
      ?auto_229248 - BLOCK
      ?auto_229249 - BLOCK
      ?auto_229250 - BLOCK
      ?auto_229251 - BLOCK
      ?auto_229252 - BLOCK
    )
    :vars
    (
      ?auto_229253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229252 ?auto_229253 ) ( ON-TABLE ?auto_229240 ) ( ON ?auto_229241 ?auto_229240 ) ( ON ?auto_229242 ?auto_229241 ) ( ON ?auto_229243 ?auto_229242 ) ( ON ?auto_229244 ?auto_229243 ) ( ON ?auto_229245 ?auto_229244 ) ( ON ?auto_229246 ?auto_229245 ) ( ON ?auto_229247 ?auto_229246 ) ( ON ?auto_229248 ?auto_229247 ) ( not ( = ?auto_229240 ?auto_229241 ) ) ( not ( = ?auto_229240 ?auto_229242 ) ) ( not ( = ?auto_229240 ?auto_229243 ) ) ( not ( = ?auto_229240 ?auto_229244 ) ) ( not ( = ?auto_229240 ?auto_229245 ) ) ( not ( = ?auto_229240 ?auto_229246 ) ) ( not ( = ?auto_229240 ?auto_229247 ) ) ( not ( = ?auto_229240 ?auto_229248 ) ) ( not ( = ?auto_229240 ?auto_229249 ) ) ( not ( = ?auto_229240 ?auto_229250 ) ) ( not ( = ?auto_229240 ?auto_229251 ) ) ( not ( = ?auto_229240 ?auto_229252 ) ) ( not ( = ?auto_229240 ?auto_229253 ) ) ( not ( = ?auto_229241 ?auto_229242 ) ) ( not ( = ?auto_229241 ?auto_229243 ) ) ( not ( = ?auto_229241 ?auto_229244 ) ) ( not ( = ?auto_229241 ?auto_229245 ) ) ( not ( = ?auto_229241 ?auto_229246 ) ) ( not ( = ?auto_229241 ?auto_229247 ) ) ( not ( = ?auto_229241 ?auto_229248 ) ) ( not ( = ?auto_229241 ?auto_229249 ) ) ( not ( = ?auto_229241 ?auto_229250 ) ) ( not ( = ?auto_229241 ?auto_229251 ) ) ( not ( = ?auto_229241 ?auto_229252 ) ) ( not ( = ?auto_229241 ?auto_229253 ) ) ( not ( = ?auto_229242 ?auto_229243 ) ) ( not ( = ?auto_229242 ?auto_229244 ) ) ( not ( = ?auto_229242 ?auto_229245 ) ) ( not ( = ?auto_229242 ?auto_229246 ) ) ( not ( = ?auto_229242 ?auto_229247 ) ) ( not ( = ?auto_229242 ?auto_229248 ) ) ( not ( = ?auto_229242 ?auto_229249 ) ) ( not ( = ?auto_229242 ?auto_229250 ) ) ( not ( = ?auto_229242 ?auto_229251 ) ) ( not ( = ?auto_229242 ?auto_229252 ) ) ( not ( = ?auto_229242 ?auto_229253 ) ) ( not ( = ?auto_229243 ?auto_229244 ) ) ( not ( = ?auto_229243 ?auto_229245 ) ) ( not ( = ?auto_229243 ?auto_229246 ) ) ( not ( = ?auto_229243 ?auto_229247 ) ) ( not ( = ?auto_229243 ?auto_229248 ) ) ( not ( = ?auto_229243 ?auto_229249 ) ) ( not ( = ?auto_229243 ?auto_229250 ) ) ( not ( = ?auto_229243 ?auto_229251 ) ) ( not ( = ?auto_229243 ?auto_229252 ) ) ( not ( = ?auto_229243 ?auto_229253 ) ) ( not ( = ?auto_229244 ?auto_229245 ) ) ( not ( = ?auto_229244 ?auto_229246 ) ) ( not ( = ?auto_229244 ?auto_229247 ) ) ( not ( = ?auto_229244 ?auto_229248 ) ) ( not ( = ?auto_229244 ?auto_229249 ) ) ( not ( = ?auto_229244 ?auto_229250 ) ) ( not ( = ?auto_229244 ?auto_229251 ) ) ( not ( = ?auto_229244 ?auto_229252 ) ) ( not ( = ?auto_229244 ?auto_229253 ) ) ( not ( = ?auto_229245 ?auto_229246 ) ) ( not ( = ?auto_229245 ?auto_229247 ) ) ( not ( = ?auto_229245 ?auto_229248 ) ) ( not ( = ?auto_229245 ?auto_229249 ) ) ( not ( = ?auto_229245 ?auto_229250 ) ) ( not ( = ?auto_229245 ?auto_229251 ) ) ( not ( = ?auto_229245 ?auto_229252 ) ) ( not ( = ?auto_229245 ?auto_229253 ) ) ( not ( = ?auto_229246 ?auto_229247 ) ) ( not ( = ?auto_229246 ?auto_229248 ) ) ( not ( = ?auto_229246 ?auto_229249 ) ) ( not ( = ?auto_229246 ?auto_229250 ) ) ( not ( = ?auto_229246 ?auto_229251 ) ) ( not ( = ?auto_229246 ?auto_229252 ) ) ( not ( = ?auto_229246 ?auto_229253 ) ) ( not ( = ?auto_229247 ?auto_229248 ) ) ( not ( = ?auto_229247 ?auto_229249 ) ) ( not ( = ?auto_229247 ?auto_229250 ) ) ( not ( = ?auto_229247 ?auto_229251 ) ) ( not ( = ?auto_229247 ?auto_229252 ) ) ( not ( = ?auto_229247 ?auto_229253 ) ) ( not ( = ?auto_229248 ?auto_229249 ) ) ( not ( = ?auto_229248 ?auto_229250 ) ) ( not ( = ?auto_229248 ?auto_229251 ) ) ( not ( = ?auto_229248 ?auto_229252 ) ) ( not ( = ?auto_229248 ?auto_229253 ) ) ( not ( = ?auto_229249 ?auto_229250 ) ) ( not ( = ?auto_229249 ?auto_229251 ) ) ( not ( = ?auto_229249 ?auto_229252 ) ) ( not ( = ?auto_229249 ?auto_229253 ) ) ( not ( = ?auto_229250 ?auto_229251 ) ) ( not ( = ?auto_229250 ?auto_229252 ) ) ( not ( = ?auto_229250 ?auto_229253 ) ) ( not ( = ?auto_229251 ?auto_229252 ) ) ( not ( = ?auto_229251 ?auto_229253 ) ) ( not ( = ?auto_229252 ?auto_229253 ) ) ( ON ?auto_229251 ?auto_229252 ) ( ON ?auto_229250 ?auto_229251 ) ( CLEAR ?auto_229248 ) ( ON ?auto_229249 ?auto_229250 ) ( CLEAR ?auto_229249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_229240 ?auto_229241 ?auto_229242 ?auto_229243 ?auto_229244 ?auto_229245 ?auto_229246 ?auto_229247 ?auto_229248 ?auto_229249 )
      ( MAKE-13PILE ?auto_229240 ?auto_229241 ?auto_229242 ?auto_229243 ?auto_229244 ?auto_229245 ?auto_229246 ?auto_229247 ?auto_229248 ?auto_229249 ?auto_229250 ?auto_229251 ?auto_229252 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229267 - BLOCK
      ?auto_229268 - BLOCK
      ?auto_229269 - BLOCK
      ?auto_229270 - BLOCK
      ?auto_229271 - BLOCK
      ?auto_229272 - BLOCK
      ?auto_229273 - BLOCK
      ?auto_229274 - BLOCK
      ?auto_229275 - BLOCK
      ?auto_229276 - BLOCK
      ?auto_229277 - BLOCK
      ?auto_229278 - BLOCK
      ?auto_229279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229279 ) ( ON-TABLE ?auto_229267 ) ( ON ?auto_229268 ?auto_229267 ) ( ON ?auto_229269 ?auto_229268 ) ( ON ?auto_229270 ?auto_229269 ) ( ON ?auto_229271 ?auto_229270 ) ( ON ?auto_229272 ?auto_229271 ) ( ON ?auto_229273 ?auto_229272 ) ( ON ?auto_229274 ?auto_229273 ) ( ON ?auto_229275 ?auto_229274 ) ( not ( = ?auto_229267 ?auto_229268 ) ) ( not ( = ?auto_229267 ?auto_229269 ) ) ( not ( = ?auto_229267 ?auto_229270 ) ) ( not ( = ?auto_229267 ?auto_229271 ) ) ( not ( = ?auto_229267 ?auto_229272 ) ) ( not ( = ?auto_229267 ?auto_229273 ) ) ( not ( = ?auto_229267 ?auto_229274 ) ) ( not ( = ?auto_229267 ?auto_229275 ) ) ( not ( = ?auto_229267 ?auto_229276 ) ) ( not ( = ?auto_229267 ?auto_229277 ) ) ( not ( = ?auto_229267 ?auto_229278 ) ) ( not ( = ?auto_229267 ?auto_229279 ) ) ( not ( = ?auto_229268 ?auto_229269 ) ) ( not ( = ?auto_229268 ?auto_229270 ) ) ( not ( = ?auto_229268 ?auto_229271 ) ) ( not ( = ?auto_229268 ?auto_229272 ) ) ( not ( = ?auto_229268 ?auto_229273 ) ) ( not ( = ?auto_229268 ?auto_229274 ) ) ( not ( = ?auto_229268 ?auto_229275 ) ) ( not ( = ?auto_229268 ?auto_229276 ) ) ( not ( = ?auto_229268 ?auto_229277 ) ) ( not ( = ?auto_229268 ?auto_229278 ) ) ( not ( = ?auto_229268 ?auto_229279 ) ) ( not ( = ?auto_229269 ?auto_229270 ) ) ( not ( = ?auto_229269 ?auto_229271 ) ) ( not ( = ?auto_229269 ?auto_229272 ) ) ( not ( = ?auto_229269 ?auto_229273 ) ) ( not ( = ?auto_229269 ?auto_229274 ) ) ( not ( = ?auto_229269 ?auto_229275 ) ) ( not ( = ?auto_229269 ?auto_229276 ) ) ( not ( = ?auto_229269 ?auto_229277 ) ) ( not ( = ?auto_229269 ?auto_229278 ) ) ( not ( = ?auto_229269 ?auto_229279 ) ) ( not ( = ?auto_229270 ?auto_229271 ) ) ( not ( = ?auto_229270 ?auto_229272 ) ) ( not ( = ?auto_229270 ?auto_229273 ) ) ( not ( = ?auto_229270 ?auto_229274 ) ) ( not ( = ?auto_229270 ?auto_229275 ) ) ( not ( = ?auto_229270 ?auto_229276 ) ) ( not ( = ?auto_229270 ?auto_229277 ) ) ( not ( = ?auto_229270 ?auto_229278 ) ) ( not ( = ?auto_229270 ?auto_229279 ) ) ( not ( = ?auto_229271 ?auto_229272 ) ) ( not ( = ?auto_229271 ?auto_229273 ) ) ( not ( = ?auto_229271 ?auto_229274 ) ) ( not ( = ?auto_229271 ?auto_229275 ) ) ( not ( = ?auto_229271 ?auto_229276 ) ) ( not ( = ?auto_229271 ?auto_229277 ) ) ( not ( = ?auto_229271 ?auto_229278 ) ) ( not ( = ?auto_229271 ?auto_229279 ) ) ( not ( = ?auto_229272 ?auto_229273 ) ) ( not ( = ?auto_229272 ?auto_229274 ) ) ( not ( = ?auto_229272 ?auto_229275 ) ) ( not ( = ?auto_229272 ?auto_229276 ) ) ( not ( = ?auto_229272 ?auto_229277 ) ) ( not ( = ?auto_229272 ?auto_229278 ) ) ( not ( = ?auto_229272 ?auto_229279 ) ) ( not ( = ?auto_229273 ?auto_229274 ) ) ( not ( = ?auto_229273 ?auto_229275 ) ) ( not ( = ?auto_229273 ?auto_229276 ) ) ( not ( = ?auto_229273 ?auto_229277 ) ) ( not ( = ?auto_229273 ?auto_229278 ) ) ( not ( = ?auto_229273 ?auto_229279 ) ) ( not ( = ?auto_229274 ?auto_229275 ) ) ( not ( = ?auto_229274 ?auto_229276 ) ) ( not ( = ?auto_229274 ?auto_229277 ) ) ( not ( = ?auto_229274 ?auto_229278 ) ) ( not ( = ?auto_229274 ?auto_229279 ) ) ( not ( = ?auto_229275 ?auto_229276 ) ) ( not ( = ?auto_229275 ?auto_229277 ) ) ( not ( = ?auto_229275 ?auto_229278 ) ) ( not ( = ?auto_229275 ?auto_229279 ) ) ( not ( = ?auto_229276 ?auto_229277 ) ) ( not ( = ?auto_229276 ?auto_229278 ) ) ( not ( = ?auto_229276 ?auto_229279 ) ) ( not ( = ?auto_229277 ?auto_229278 ) ) ( not ( = ?auto_229277 ?auto_229279 ) ) ( not ( = ?auto_229278 ?auto_229279 ) ) ( ON ?auto_229278 ?auto_229279 ) ( ON ?auto_229277 ?auto_229278 ) ( CLEAR ?auto_229275 ) ( ON ?auto_229276 ?auto_229277 ) ( CLEAR ?auto_229276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_229267 ?auto_229268 ?auto_229269 ?auto_229270 ?auto_229271 ?auto_229272 ?auto_229273 ?auto_229274 ?auto_229275 ?auto_229276 )
      ( MAKE-13PILE ?auto_229267 ?auto_229268 ?auto_229269 ?auto_229270 ?auto_229271 ?auto_229272 ?auto_229273 ?auto_229274 ?auto_229275 ?auto_229276 ?auto_229277 ?auto_229278 ?auto_229279 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229293 - BLOCK
      ?auto_229294 - BLOCK
      ?auto_229295 - BLOCK
      ?auto_229296 - BLOCK
      ?auto_229297 - BLOCK
      ?auto_229298 - BLOCK
      ?auto_229299 - BLOCK
      ?auto_229300 - BLOCK
      ?auto_229301 - BLOCK
      ?auto_229302 - BLOCK
      ?auto_229303 - BLOCK
      ?auto_229304 - BLOCK
      ?auto_229305 - BLOCK
    )
    :vars
    (
      ?auto_229306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229305 ?auto_229306 ) ( ON-TABLE ?auto_229293 ) ( ON ?auto_229294 ?auto_229293 ) ( ON ?auto_229295 ?auto_229294 ) ( ON ?auto_229296 ?auto_229295 ) ( ON ?auto_229297 ?auto_229296 ) ( ON ?auto_229298 ?auto_229297 ) ( ON ?auto_229299 ?auto_229298 ) ( ON ?auto_229300 ?auto_229299 ) ( not ( = ?auto_229293 ?auto_229294 ) ) ( not ( = ?auto_229293 ?auto_229295 ) ) ( not ( = ?auto_229293 ?auto_229296 ) ) ( not ( = ?auto_229293 ?auto_229297 ) ) ( not ( = ?auto_229293 ?auto_229298 ) ) ( not ( = ?auto_229293 ?auto_229299 ) ) ( not ( = ?auto_229293 ?auto_229300 ) ) ( not ( = ?auto_229293 ?auto_229301 ) ) ( not ( = ?auto_229293 ?auto_229302 ) ) ( not ( = ?auto_229293 ?auto_229303 ) ) ( not ( = ?auto_229293 ?auto_229304 ) ) ( not ( = ?auto_229293 ?auto_229305 ) ) ( not ( = ?auto_229293 ?auto_229306 ) ) ( not ( = ?auto_229294 ?auto_229295 ) ) ( not ( = ?auto_229294 ?auto_229296 ) ) ( not ( = ?auto_229294 ?auto_229297 ) ) ( not ( = ?auto_229294 ?auto_229298 ) ) ( not ( = ?auto_229294 ?auto_229299 ) ) ( not ( = ?auto_229294 ?auto_229300 ) ) ( not ( = ?auto_229294 ?auto_229301 ) ) ( not ( = ?auto_229294 ?auto_229302 ) ) ( not ( = ?auto_229294 ?auto_229303 ) ) ( not ( = ?auto_229294 ?auto_229304 ) ) ( not ( = ?auto_229294 ?auto_229305 ) ) ( not ( = ?auto_229294 ?auto_229306 ) ) ( not ( = ?auto_229295 ?auto_229296 ) ) ( not ( = ?auto_229295 ?auto_229297 ) ) ( not ( = ?auto_229295 ?auto_229298 ) ) ( not ( = ?auto_229295 ?auto_229299 ) ) ( not ( = ?auto_229295 ?auto_229300 ) ) ( not ( = ?auto_229295 ?auto_229301 ) ) ( not ( = ?auto_229295 ?auto_229302 ) ) ( not ( = ?auto_229295 ?auto_229303 ) ) ( not ( = ?auto_229295 ?auto_229304 ) ) ( not ( = ?auto_229295 ?auto_229305 ) ) ( not ( = ?auto_229295 ?auto_229306 ) ) ( not ( = ?auto_229296 ?auto_229297 ) ) ( not ( = ?auto_229296 ?auto_229298 ) ) ( not ( = ?auto_229296 ?auto_229299 ) ) ( not ( = ?auto_229296 ?auto_229300 ) ) ( not ( = ?auto_229296 ?auto_229301 ) ) ( not ( = ?auto_229296 ?auto_229302 ) ) ( not ( = ?auto_229296 ?auto_229303 ) ) ( not ( = ?auto_229296 ?auto_229304 ) ) ( not ( = ?auto_229296 ?auto_229305 ) ) ( not ( = ?auto_229296 ?auto_229306 ) ) ( not ( = ?auto_229297 ?auto_229298 ) ) ( not ( = ?auto_229297 ?auto_229299 ) ) ( not ( = ?auto_229297 ?auto_229300 ) ) ( not ( = ?auto_229297 ?auto_229301 ) ) ( not ( = ?auto_229297 ?auto_229302 ) ) ( not ( = ?auto_229297 ?auto_229303 ) ) ( not ( = ?auto_229297 ?auto_229304 ) ) ( not ( = ?auto_229297 ?auto_229305 ) ) ( not ( = ?auto_229297 ?auto_229306 ) ) ( not ( = ?auto_229298 ?auto_229299 ) ) ( not ( = ?auto_229298 ?auto_229300 ) ) ( not ( = ?auto_229298 ?auto_229301 ) ) ( not ( = ?auto_229298 ?auto_229302 ) ) ( not ( = ?auto_229298 ?auto_229303 ) ) ( not ( = ?auto_229298 ?auto_229304 ) ) ( not ( = ?auto_229298 ?auto_229305 ) ) ( not ( = ?auto_229298 ?auto_229306 ) ) ( not ( = ?auto_229299 ?auto_229300 ) ) ( not ( = ?auto_229299 ?auto_229301 ) ) ( not ( = ?auto_229299 ?auto_229302 ) ) ( not ( = ?auto_229299 ?auto_229303 ) ) ( not ( = ?auto_229299 ?auto_229304 ) ) ( not ( = ?auto_229299 ?auto_229305 ) ) ( not ( = ?auto_229299 ?auto_229306 ) ) ( not ( = ?auto_229300 ?auto_229301 ) ) ( not ( = ?auto_229300 ?auto_229302 ) ) ( not ( = ?auto_229300 ?auto_229303 ) ) ( not ( = ?auto_229300 ?auto_229304 ) ) ( not ( = ?auto_229300 ?auto_229305 ) ) ( not ( = ?auto_229300 ?auto_229306 ) ) ( not ( = ?auto_229301 ?auto_229302 ) ) ( not ( = ?auto_229301 ?auto_229303 ) ) ( not ( = ?auto_229301 ?auto_229304 ) ) ( not ( = ?auto_229301 ?auto_229305 ) ) ( not ( = ?auto_229301 ?auto_229306 ) ) ( not ( = ?auto_229302 ?auto_229303 ) ) ( not ( = ?auto_229302 ?auto_229304 ) ) ( not ( = ?auto_229302 ?auto_229305 ) ) ( not ( = ?auto_229302 ?auto_229306 ) ) ( not ( = ?auto_229303 ?auto_229304 ) ) ( not ( = ?auto_229303 ?auto_229305 ) ) ( not ( = ?auto_229303 ?auto_229306 ) ) ( not ( = ?auto_229304 ?auto_229305 ) ) ( not ( = ?auto_229304 ?auto_229306 ) ) ( not ( = ?auto_229305 ?auto_229306 ) ) ( ON ?auto_229304 ?auto_229305 ) ( ON ?auto_229303 ?auto_229304 ) ( ON ?auto_229302 ?auto_229303 ) ( CLEAR ?auto_229300 ) ( ON ?auto_229301 ?auto_229302 ) ( CLEAR ?auto_229301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_229293 ?auto_229294 ?auto_229295 ?auto_229296 ?auto_229297 ?auto_229298 ?auto_229299 ?auto_229300 ?auto_229301 )
      ( MAKE-13PILE ?auto_229293 ?auto_229294 ?auto_229295 ?auto_229296 ?auto_229297 ?auto_229298 ?auto_229299 ?auto_229300 ?auto_229301 ?auto_229302 ?auto_229303 ?auto_229304 ?auto_229305 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229320 - BLOCK
      ?auto_229321 - BLOCK
      ?auto_229322 - BLOCK
      ?auto_229323 - BLOCK
      ?auto_229324 - BLOCK
      ?auto_229325 - BLOCK
      ?auto_229326 - BLOCK
      ?auto_229327 - BLOCK
      ?auto_229328 - BLOCK
      ?auto_229329 - BLOCK
      ?auto_229330 - BLOCK
      ?auto_229331 - BLOCK
      ?auto_229332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229332 ) ( ON-TABLE ?auto_229320 ) ( ON ?auto_229321 ?auto_229320 ) ( ON ?auto_229322 ?auto_229321 ) ( ON ?auto_229323 ?auto_229322 ) ( ON ?auto_229324 ?auto_229323 ) ( ON ?auto_229325 ?auto_229324 ) ( ON ?auto_229326 ?auto_229325 ) ( ON ?auto_229327 ?auto_229326 ) ( not ( = ?auto_229320 ?auto_229321 ) ) ( not ( = ?auto_229320 ?auto_229322 ) ) ( not ( = ?auto_229320 ?auto_229323 ) ) ( not ( = ?auto_229320 ?auto_229324 ) ) ( not ( = ?auto_229320 ?auto_229325 ) ) ( not ( = ?auto_229320 ?auto_229326 ) ) ( not ( = ?auto_229320 ?auto_229327 ) ) ( not ( = ?auto_229320 ?auto_229328 ) ) ( not ( = ?auto_229320 ?auto_229329 ) ) ( not ( = ?auto_229320 ?auto_229330 ) ) ( not ( = ?auto_229320 ?auto_229331 ) ) ( not ( = ?auto_229320 ?auto_229332 ) ) ( not ( = ?auto_229321 ?auto_229322 ) ) ( not ( = ?auto_229321 ?auto_229323 ) ) ( not ( = ?auto_229321 ?auto_229324 ) ) ( not ( = ?auto_229321 ?auto_229325 ) ) ( not ( = ?auto_229321 ?auto_229326 ) ) ( not ( = ?auto_229321 ?auto_229327 ) ) ( not ( = ?auto_229321 ?auto_229328 ) ) ( not ( = ?auto_229321 ?auto_229329 ) ) ( not ( = ?auto_229321 ?auto_229330 ) ) ( not ( = ?auto_229321 ?auto_229331 ) ) ( not ( = ?auto_229321 ?auto_229332 ) ) ( not ( = ?auto_229322 ?auto_229323 ) ) ( not ( = ?auto_229322 ?auto_229324 ) ) ( not ( = ?auto_229322 ?auto_229325 ) ) ( not ( = ?auto_229322 ?auto_229326 ) ) ( not ( = ?auto_229322 ?auto_229327 ) ) ( not ( = ?auto_229322 ?auto_229328 ) ) ( not ( = ?auto_229322 ?auto_229329 ) ) ( not ( = ?auto_229322 ?auto_229330 ) ) ( not ( = ?auto_229322 ?auto_229331 ) ) ( not ( = ?auto_229322 ?auto_229332 ) ) ( not ( = ?auto_229323 ?auto_229324 ) ) ( not ( = ?auto_229323 ?auto_229325 ) ) ( not ( = ?auto_229323 ?auto_229326 ) ) ( not ( = ?auto_229323 ?auto_229327 ) ) ( not ( = ?auto_229323 ?auto_229328 ) ) ( not ( = ?auto_229323 ?auto_229329 ) ) ( not ( = ?auto_229323 ?auto_229330 ) ) ( not ( = ?auto_229323 ?auto_229331 ) ) ( not ( = ?auto_229323 ?auto_229332 ) ) ( not ( = ?auto_229324 ?auto_229325 ) ) ( not ( = ?auto_229324 ?auto_229326 ) ) ( not ( = ?auto_229324 ?auto_229327 ) ) ( not ( = ?auto_229324 ?auto_229328 ) ) ( not ( = ?auto_229324 ?auto_229329 ) ) ( not ( = ?auto_229324 ?auto_229330 ) ) ( not ( = ?auto_229324 ?auto_229331 ) ) ( not ( = ?auto_229324 ?auto_229332 ) ) ( not ( = ?auto_229325 ?auto_229326 ) ) ( not ( = ?auto_229325 ?auto_229327 ) ) ( not ( = ?auto_229325 ?auto_229328 ) ) ( not ( = ?auto_229325 ?auto_229329 ) ) ( not ( = ?auto_229325 ?auto_229330 ) ) ( not ( = ?auto_229325 ?auto_229331 ) ) ( not ( = ?auto_229325 ?auto_229332 ) ) ( not ( = ?auto_229326 ?auto_229327 ) ) ( not ( = ?auto_229326 ?auto_229328 ) ) ( not ( = ?auto_229326 ?auto_229329 ) ) ( not ( = ?auto_229326 ?auto_229330 ) ) ( not ( = ?auto_229326 ?auto_229331 ) ) ( not ( = ?auto_229326 ?auto_229332 ) ) ( not ( = ?auto_229327 ?auto_229328 ) ) ( not ( = ?auto_229327 ?auto_229329 ) ) ( not ( = ?auto_229327 ?auto_229330 ) ) ( not ( = ?auto_229327 ?auto_229331 ) ) ( not ( = ?auto_229327 ?auto_229332 ) ) ( not ( = ?auto_229328 ?auto_229329 ) ) ( not ( = ?auto_229328 ?auto_229330 ) ) ( not ( = ?auto_229328 ?auto_229331 ) ) ( not ( = ?auto_229328 ?auto_229332 ) ) ( not ( = ?auto_229329 ?auto_229330 ) ) ( not ( = ?auto_229329 ?auto_229331 ) ) ( not ( = ?auto_229329 ?auto_229332 ) ) ( not ( = ?auto_229330 ?auto_229331 ) ) ( not ( = ?auto_229330 ?auto_229332 ) ) ( not ( = ?auto_229331 ?auto_229332 ) ) ( ON ?auto_229331 ?auto_229332 ) ( ON ?auto_229330 ?auto_229331 ) ( ON ?auto_229329 ?auto_229330 ) ( CLEAR ?auto_229327 ) ( ON ?auto_229328 ?auto_229329 ) ( CLEAR ?auto_229328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_229320 ?auto_229321 ?auto_229322 ?auto_229323 ?auto_229324 ?auto_229325 ?auto_229326 ?auto_229327 ?auto_229328 )
      ( MAKE-13PILE ?auto_229320 ?auto_229321 ?auto_229322 ?auto_229323 ?auto_229324 ?auto_229325 ?auto_229326 ?auto_229327 ?auto_229328 ?auto_229329 ?auto_229330 ?auto_229331 ?auto_229332 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229346 - BLOCK
      ?auto_229347 - BLOCK
      ?auto_229348 - BLOCK
      ?auto_229349 - BLOCK
      ?auto_229350 - BLOCK
      ?auto_229351 - BLOCK
      ?auto_229352 - BLOCK
      ?auto_229353 - BLOCK
      ?auto_229354 - BLOCK
      ?auto_229355 - BLOCK
      ?auto_229356 - BLOCK
      ?auto_229357 - BLOCK
      ?auto_229358 - BLOCK
    )
    :vars
    (
      ?auto_229359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229358 ?auto_229359 ) ( ON-TABLE ?auto_229346 ) ( ON ?auto_229347 ?auto_229346 ) ( ON ?auto_229348 ?auto_229347 ) ( ON ?auto_229349 ?auto_229348 ) ( ON ?auto_229350 ?auto_229349 ) ( ON ?auto_229351 ?auto_229350 ) ( ON ?auto_229352 ?auto_229351 ) ( not ( = ?auto_229346 ?auto_229347 ) ) ( not ( = ?auto_229346 ?auto_229348 ) ) ( not ( = ?auto_229346 ?auto_229349 ) ) ( not ( = ?auto_229346 ?auto_229350 ) ) ( not ( = ?auto_229346 ?auto_229351 ) ) ( not ( = ?auto_229346 ?auto_229352 ) ) ( not ( = ?auto_229346 ?auto_229353 ) ) ( not ( = ?auto_229346 ?auto_229354 ) ) ( not ( = ?auto_229346 ?auto_229355 ) ) ( not ( = ?auto_229346 ?auto_229356 ) ) ( not ( = ?auto_229346 ?auto_229357 ) ) ( not ( = ?auto_229346 ?auto_229358 ) ) ( not ( = ?auto_229346 ?auto_229359 ) ) ( not ( = ?auto_229347 ?auto_229348 ) ) ( not ( = ?auto_229347 ?auto_229349 ) ) ( not ( = ?auto_229347 ?auto_229350 ) ) ( not ( = ?auto_229347 ?auto_229351 ) ) ( not ( = ?auto_229347 ?auto_229352 ) ) ( not ( = ?auto_229347 ?auto_229353 ) ) ( not ( = ?auto_229347 ?auto_229354 ) ) ( not ( = ?auto_229347 ?auto_229355 ) ) ( not ( = ?auto_229347 ?auto_229356 ) ) ( not ( = ?auto_229347 ?auto_229357 ) ) ( not ( = ?auto_229347 ?auto_229358 ) ) ( not ( = ?auto_229347 ?auto_229359 ) ) ( not ( = ?auto_229348 ?auto_229349 ) ) ( not ( = ?auto_229348 ?auto_229350 ) ) ( not ( = ?auto_229348 ?auto_229351 ) ) ( not ( = ?auto_229348 ?auto_229352 ) ) ( not ( = ?auto_229348 ?auto_229353 ) ) ( not ( = ?auto_229348 ?auto_229354 ) ) ( not ( = ?auto_229348 ?auto_229355 ) ) ( not ( = ?auto_229348 ?auto_229356 ) ) ( not ( = ?auto_229348 ?auto_229357 ) ) ( not ( = ?auto_229348 ?auto_229358 ) ) ( not ( = ?auto_229348 ?auto_229359 ) ) ( not ( = ?auto_229349 ?auto_229350 ) ) ( not ( = ?auto_229349 ?auto_229351 ) ) ( not ( = ?auto_229349 ?auto_229352 ) ) ( not ( = ?auto_229349 ?auto_229353 ) ) ( not ( = ?auto_229349 ?auto_229354 ) ) ( not ( = ?auto_229349 ?auto_229355 ) ) ( not ( = ?auto_229349 ?auto_229356 ) ) ( not ( = ?auto_229349 ?auto_229357 ) ) ( not ( = ?auto_229349 ?auto_229358 ) ) ( not ( = ?auto_229349 ?auto_229359 ) ) ( not ( = ?auto_229350 ?auto_229351 ) ) ( not ( = ?auto_229350 ?auto_229352 ) ) ( not ( = ?auto_229350 ?auto_229353 ) ) ( not ( = ?auto_229350 ?auto_229354 ) ) ( not ( = ?auto_229350 ?auto_229355 ) ) ( not ( = ?auto_229350 ?auto_229356 ) ) ( not ( = ?auto_229350 ?auto_229357 ) ) ( not ( = ?auto_229350 ?auto_229358 ) ) ( not ( = ?auto_229350 ?auto_229359 ) ) ( not ( = ?auto_229351 ?auto_229352 ) ) ( not ( = ?auto_229351 ?auto_229353 ) ) ( not ( = ?auto_229351 ?auto_229354 ) ) ( not ( = ?auto_229351 ?auto_229355 ) ) ( not ( = ?auto_229351 ?auto_229356 ) ) ( not ( = ?auto_229351 ?auto_229357 ) ) ( not ( = ?auto_229351 ?auto_229358 ) ) ( not ( = ?auto_229351 ?auto_229359 ) ) ( not ( = ?auto_229352 ?auto_229353 ) ) ( not ( = ?auto_229352 ?auto_229354 ) ) ( not ( = ?auto_229352 ?auto_229355 ) ) ( not ( = ?auto_229352 ?auto_229356 ) ) ( not ( = ?auto_229352 ?auto_229357 ) ) ( not ( = ?auto_229352 ?auto_229358 ) ) ( not ( = ?auto_229352 ?auto_229359 ) ) ( not ( = ?auto_229353 ?auto_229354 ) ) ( not ( = ?auto_229353 ?auto_229355 ) ) ( not ( = ?auto_229353 ?auto_229356 ) ) ( not ( = ?auto_229353 ?auto_229357 ) ) ( not ( = ?auto_229353 ?auto_229358 ) ) ( not ( = ?auto_229353 ?auto_229359 ) ) ( not ( = ?auto_229354 ?auto_229355 ) ) ( not ( = ?auto_229354 ?auto_229356 ) ) ( not ( = ?auto_229354 ?auto_229357 ) ) ( not ( = ?auto_229354 ?auto_229358 ) ) ( not ( = ?auto_229354 ?auto_229359 ) ) ( not ( = ?auto_229355 ?auto_229356 ) ) ( not ( = ?auto_229355 ?auto_229357 ) ) ( not ( = ?auto_229355 ?auto_229358 ) ) ( not ( = ?auto_229355 ?auto_229359 ) ) ( not ( = ?auto_229356 ?auto_229357 ) ) ( not ( = ?auto_229356 ?auto_229358 ) ) ( not ( = ?auto_229356 ?auto_229359 ) ) ( not ( = ?auto_229357 ?auto_229358 ) ) ( not ( = ?auto_229357 ?auto_229359 ) ) ( not ( = ?auto_229358 ?auto_229359 ) ) ( ON ?auto_229357 ?auto_229358 ) ( ON ?auto_229356 ?auto_229357 ) ( ON ?auto_229355 ?auto_229356 ) ( ON ?auto_229354 ?auto_229355 ) ( CLEAR ?auto_229352 ) ( ON ?auto_229353 ?auto_229354 ) ( CLEAR ?auto_229353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_229346 ?auto_229347 ?auto_229348 ?auto_229349 ?auto_229350 ?auto_229351 ?auto_229352 ?auto_229353 )
      ( MAKE-13PILE ?auto_229346 ?auto_229347 ?auto_229348 ?auto_229349 ?auto_229350 ?auto_229351 ?auto_229352 ?auto_229353 ?auto_229354 ?auto_229355 ?auto_229356 ?auto_229357 ?auto_229358 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229373 - BLOCK
      ?auto_229374 - BLOCK
      ?auto_229375 - BLOCK
      ?auto_229376 - BLOCK
      ?auto_229377 - BLOCK
      ?auto_229378 - BLOCK
      ?auto_229379 - BLOCK
      ?auto_229380 - BLOCK
      ?auto_229381 - BLOCK
      ?auto_229382 - BLOCK
      ?auto_229383 - BLOCK
      ?auto_229384 - BLOCK
      ?auto_229385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229385 ) ( ON-TABLE ?auto_229373 ) ( ON ?auto_229374 ?auto_229373 ) ( ON ?auto_229375 ?auto_229374 ) ( ON ?auto_229376 ?auto_229375 ) ( ON ?auto_229377 ?auto_229376 ) ( ON ?auto_229378 ?auto_229377 ) ( ON ?auto_229379 ?auto_229378 ) ( not ( = ?auto_229373 ?auto_229374 ) ) ( not ( = ?auto_229373 ?auto_229375 ) ) ( not ( = ?auto_229373 ?auto_229376 ) ) ( not ( = ?auto_229373 ?auto_229377 ) ) ( not ( = ?auto_229373 ?auto_229378 ) ) ( not ( = ?auto_229373 ?auto_229379 ) ) ( not ( = ?auto_229373 ?auto_229380 ) ) ( not ( = ?auto_229373 ?auto_229381 ) ) ( not ( = ?auto_229373 ?auto_229382 ) ) ( not ( = ?auto_229373 ?auto_229383 ) ) ( not ( = ?auto_229373 ?auto_229384 ) ) ( not ( = ?auto_229373 ?auto_229385 ) ) ( not ( = ?auto_229374 ?auto_229375 ) ) ( not ( = ?auto_229374 ?auto_229376 ) ) ( not ( = ?auto_229374 ?auto_229377 ) ) ( not ( = ?auto_229374 ?auto_229378 ) ) ( not ( = ?auto_229374 ?auto_229379 ) ) ( not ( = ?auto_229374 ?auto_229380 ) ) ( not ( = ?auto_229374 ?auto_229381 ) ) ( not ( = ?auto_229374 ?auto_229382 ) ) ( not ( = ?auto_229374 ?auto_229383 ) ) ( not ( = ?auto_229374 ?auto_229384 ) ) ( not ( = ?auto_229374 ?auto_229385 ) ) ( not ( = ?auto_229375 ?auto_229376 ) ) ( not ( = ?auto_229375 ?auto_229377 ) ) ( not ( = ?auto_229375 ?auto_229378 ) ) ( not ( = ?auto_229375 ?auto_229379 ) ) ( not ( = ?auto_229375 ?auto_229380 ) ) ( not ( = ?auto_229375 ?auto_229381 ) ) ( not ( = ?auto_229375 ?auto_229382 ) ) ( not ( = ?auto_229375 ?auto_229383 ) ) ( not ( = ?auto_229375 ?auto_229384 ) ) ( not ( = ?auto_229375 ?auto_229385 ) ) ( not ( = ?auto_229376 ?auto_229377 ) ) ( not ( = ?auto_229376 ?auto_229378 ) ) ( not ( = ?auto_229376 ?auto_229379 ) ) ( not ( = ?auto_229376 ?auto_229380 ) ) ( not ( = ?auto_229376 ?auto_229381 ) ) ( not ( = ?auto_229376 ?auto_229382 ) ) ( not ( = ?auto_229376 ?auto_229383 ) ) ( not ( = ?auto_229376 ?auto_229384 ) ) ( not ( = ?auto_229376 ?auto_229385 ) ) ( not ( = ?auto_229377 ?auto_229378 ) ) ( not ( = ?auto_229377 ?auto_229379 ) ) ( not ( = ?auto_229377 ?auto_229380 ) ) ( not ( = ?auto_229377 ?auto_229381 ) ) ( not ( = ?auto_229377 ?auto_229382 ) ) ( not ( = ?auto_229377 ?auto_229383 ) ) ( not ( = ?auto_229377 ?auto_229384 ) ) ( not ( = ?auto_229377 ?auto_229385 ) ) ( not ( = ?auto_229378 ?auto_229379 ) ) ( not ( = ?auto_229378 ?auto_229380 ) ) ( not ( = ?auto_229378 ?auto_229381 ) ) ( not ( = ?auto_229378 ?auto_229382 ) ) ( not ( = ?auto_229378 ?auto_229383 ) ) ( not ( = ?auto_229378 ?auto_229384 ) ) ( not ( = ?auto_229378 ?auto_229385 ) ) ( not ( = ?auto_229379 ?auto_229380 ) ) ( not ( = ?auto_229379 ?auto_229381 ) ) ( not ( = ?auto_229379 ?auto_229382 ) ) ( not ( = ?auto_229379 ?auto_229383 ) ) ( not ( = ?auto_229379 ?auto_229384 ) ) ( not ( = ?auto_229379 ?auto_229385 ) ) ( not ( = ?auto_229380 ?auto_229381 ) ) ( not ( = ?auto_229380 ?auto_229382 ) ) ( not ( = ?auto_229380 ?auto_229383 ) ) ( not ( = ?auto_229380 ?auto_229384 ) ) ( not ( = ?auto_229380 ?auto_229385 ) ) ( not ( = ?auto_229381 ?auto_229382 ) ) ( not ( = ?auto_229381 ?auto_229383 ) ) ( not ( = ?auto_229381 ?auto_229384 ) ) ( not ( = ?auto_229381 ?auto_229385 ) ) ( not ( = ?auto_229382 ?auto_229383 ) ) ( not ( = ?auto_229382 ?auto_229384 ) ) ( not ( = ?auto_229382 ?auto_229385 ) ) ( not ( = ?auto_229383 ?auto_229384 ) ) ( not ( = ?auto_229383 ?auto_229385 ) ) ( not ( = ?auto_229384 ?auto_229385 ) ) ( ON ?auto_229384 ?auto_229385 ) ( ON ?auto_229383 ?auto_229384 ) ( ON ?auto_229382 ?auto_229383 ) ( ON ?auto_229381 ?auto_229382 ) ( CLEAR ?auto_229379 ) ( ON ?auto_229380 ?auto_229381 ) ( CLEAR ?auto_229380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_229373 ?auto_229374 ?auto_229375 ?auto_229376 ?auto_229377 ?auto_229378 ?auto_229379 ?auto_229380 )
      ( MAKE-13PILE ?auto_229373 ?auto_229374 ?auto_229375 ?auto_229376 ?auto_229377 ?auto_229378 ?auto_229379 ?auto_229380 ?auto_229381 ?auto_229382 ?auto_229383 ?auto_229384 ?auto_229385 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229399 - BLOCK
      ?auto_229400 - BLOCK
      ?auto_229401 - BLOCK
      ?auto_229402 - BLOCK
      ?auto_229403 - BLOCK
      ?auto_229404 - BLOCK
      ?auto_229405 - BLOCK
      ?auto_229406 - BLOCK
      ?auto_229407 - BLOCK
      ?auto_229408 - BLOCK
      ?auto_229409 - BLOCK
      ?auto_229410 - BLOCK
      ?auto_229411 - BLOCK
    )
    :vars
    (
      ?auto_229412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229411 ?auto_229412 ) ( ON-TABLE ?auto_229399 ) ( ON ?auto_229400 ?auto_229399 ) ( ON ?auto_229401 ?auto_229400 ) ( ON ?auto_229402 ?auto_229401 ) ( ON ?auto_229403 ?auto_229402 ) ( ON ?auto_229404 ?auto_229403 ) ( not ( = ?auto_229399 ?auto_229400 ) ) ( not ( = ?auto_229399 ?auto_229401 ) ) ( not ( = ?auto_229399 ?auto_229402 ) ) ( not ( = ?auto_229399 ?auto_229403 ) ) ( not ( = ?auto_229399 ?auto_229404 ) ) ( not ( = ?auto_229399 ?auto_229405 ) ) ( not ( = ?auto_229399 ?auto_229406 ) ) ( not ( = ?auto_229399 ?auto_229407 ) ) ( not ( = ?auto_229399 ?auto_229408 ) ) ( not ( = ?auto_229399 ?auto_229409 ) ) ( not ( = ?auto_229399 ?auto_229410 ) ) ( not ( = ?auto_229399 ?auto_229411 ) ) ( not ( = ?auto_229399 ?auto_229412 ) ) ( not ( = ?auto_229400 ?auto_229401 ) ) ( not ( = ?auto_229400 ?auto_229402 ) ) ( not ( = ?auto_229400 ?auto_229403 ) ) ( not ( = ?auto_229400 ?auto_229404 ) ) ( not ( = ?auto_229400 ?auto_229405 ) ) ( not ( = ?auto_229400 ?auto_229406 ) ) ( not ( = ?auto_229400 ?auto_229407 ) ) ( not ( = ?auto_229400 ?auto_229408 ) ) ( not ( = ?auto_229400 ?auto_229409 ) ) ( not ( = ?auto_229400 ?auto_229410 ) ) ( not ( = ?auto_229400 ?auto_229411 ) ) ( not ( = ?auto_229400 ?auto_229412 ) ) ( not ( = ?auto_229401 ?auto_229402 ) ) ( not ( = ?auto_229401 ?auto_229403 ) ) ( not ( = ?auto_229401 ?auto_229404 ) ) ( not ( = ?auto_229401 ?auto_229405 ) ) ( not ( = ?auto_229401 ?auto_229406 ) ) ( not ( = ?auto_229401 ?auto_229407 ) ) ( not ( = ?auto_229401 ?auto_229408 ) ) ( not ( = ?auto_229401 ?auto_229409 ) ) ( not ( = ?auto_229401 ?auto_229410 ) ) ( not ( = ?auto_229401 ?auto_229411 ) ) ( not ( = ?auto_229401 ?auto_229412 ) ) ( not ( = ?auto_229402 ?auto_229403 ) ) ( not ( = ?auto_229402 ?auto_229404 ) ) ( not ( = ?auto_229402 ?auto_229405 ) ) ( not ( = ?auto_229402 ?auto_229406 ) ) ( not ( = ?auto_229402 ?auto_229407 ) ) ( not ( = ?auto_229402 ?auto_229408 ) ) ( not ( = ?auto_229402 ?auto_229409 ) ) ( not ( = ?auto_229402 ?auto_229410 ) ) ( not ( = ?auto_229402 ?auto_229411 ) ) ( not ( = ?auto_229402 ?auto_229412 ) ) ( not ( = ?auto_229403 ?auto_229404 ) ) ( not ( = ?auto_229403 ?auto_229405 ) ) ( not ( = ?auto_229403 ?auto_229406 ) ) ( not ( = ?auto_229403 ?auto_229407 ) ) ( not ( = ?auto_229403 ?auto_229408 ) ) ( not ( = ?auto_229403 ?auto_229409 ) ) ( not ( = ?auto_229403 ?auto_229410 ) ) ( not ( = ?auto_229403 ?auto_229411 ) ) ( not ( = ?auto_229403 ?auto_229412 ) ) ( not ( = ?auto_229404 ?auto_229405 ) ) ( not ( = ?auto_229404 ?auto_229406 ) ) ( not ( = ?auto_229404 ?auto_229407 ) ) ( not ( = ?auto_229404 ?auto_229408 ) ) ( not ( = ?auto_229404 ?auto_229409 ) ) ( not ( = ?auto_229404 ?auto_229410 ) ) ( not ( = ?auto_229404 ?auto_229411 ) ) ( not ( = ?auto_229404 ?auto_229412 ) ) ( not ( = ?auto_229405 ?auto_229406 ) ) ( not ( = ?auto_229405 ?auto_229407 ) ) ( not ( = ?auto_229405 ?auto_229408 ) ) ( not ( = ?auto_229405 ?auto_229409 ) ) ( not ( = ?auto_229405 ?auto_229410 ) ) ( not ( = ?auto_229405 ?auto_229411 ) ) ( not ( = ?auto_229405 ?auto_229412 ) ) ( not ( = ?auto_229406 ?auto_229407 ) ) ( not ( = ?auto_229406 ?auto_229408 ) ) ( not ( = ?auto_229406 ?auto_229409 ) ) ( not ( = ?auto_229406 ?auto_229410 ) ) ( not ( = ?auto_229406 ?auto_229411 ) ) ( not ( = ?auto_229406 ?auto_229412 ) ) ( not ( = ?auto_229407 ?auto_229408 ) ) ( not ( = ?auto_229407 ?auto_229409 ) ) ( not ( = ?auto_229407 ?auto_229410 ) ) ( not ( = ?auto_229407 ?auto_229411 ) ) ( not ( = ?auto_229407 ?auto_229412 ) ) ( not ( = ?auto_229408 ?auto_229409 ) ) ( not ( = ?auto_229408 ?auto_229410 ) ) ( not ( = ?auto_229408 ?auto_229411 ) ) ( not ( = ?auto_229408 ?auto_229412 ) ) ( not ( = ?auto_229409 ?auto_229410 ) ) ( not ( = ?auto_229409 ?auto_229411 ) ) ( not ( = ?auto_229409 ?auto_229412 ) ) ( not ( = ?auto_229410 ?auto_229411 ) ) ( not ( = ?auto_229410 ?auto_229412 ) ) ( not ( = ?auto_229411 ?auto_229412 ) ) ( ON ?auto_229410 ?auto_229411 ) ( ON ?auto_229409 ?auto_229410 ) ( ON ?auto_229408 ?auto_229409 ) ( ON ?auto_229407 ?auto_229408 ) ( ON ?auto_229406 ?auto_229407 ) ( CLEAR ?auto_229404 ) ( ON ?auto_229405 ?auto_229406 ) ( CLEAR ?auto_229405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_229399 ?auto_229400 ?auto_229401 ?auto_229402 ?auto_229403 ?auto_229404 ?auto_229405 )
      ( MAKE-13PILE ?auto_229399 ?auto_229400 ?auto_229401 ?auto_229402 ?auto_229403 ?auto_229404 ?auto_229405 ?auto_229406 ?auto_229407 ?auto_229408 ?auto_229409 ?auto_229410 ?auto_229411 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229426 - BLOCK
      ?auto_229427 - BLOCK
      ?auto_229428 - BLOCK
      ?auto_229429 - BLOCK
      ?auto_229430 - BLOCK
      ?auto_229431 - BLOCK
      ?auto_229432 - BLOCK
      ?auto_229433 - BLOCK
      ?auto_229434 - BLOCK
      ?auto_229435 - BLOCK
      ?auto_229436 - BLOCK
      ?auto_229437 - BLOCK
      ?auto_229438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229438 ) ( ON-TABLE ?auto_229426 ) ( ON ?auto_229427 ?auto_229426 ) ( ON ?auto_229428 ?auto_229427 ) ( ON ?auto_229429 ?auto_229428 ) ( ON ?auto_229430 ?auto_229429 ) ( ON ?auto_229431 ?auto_229430 ) ( not ( = ?auto_229426 ?auto_229427 ) ) ( not ( = ?auto_229426 ?auto_229428 ) ) ( not ( = ?auto_229426 ?auto_229429 ) ) ( not ( = ?auto_229426 ?auto_229430 ) ) ( not ( = ?auto_229426 ?auto_229431 ) ) ( not ( = ?auto_229426 ?auto_229432 ) ) ( not ( = ?auto_229426 ?auto_229433 ) ) ( not ( = ?auto_229426 ?auto_229434 ) ) ( not ( = ?auto_229426 ?auto_229435 ) ) ( not ( = ?auto_229426 ?auto_229436 ) ) ( not ( = ?auto_229426 ?auto_229437 ) ) ( not ( = ?auto_229426 ?auto_229438 ) ) ( not ( = ?auto_229427 ?auto_229428 ) ) ( not ( = ?auto_229427 ?auto_229429 ) ) ( not ( = ?auto_229427 ?auto_229430 ) ) ( not ( = ?auto_229427 ?auto_229431 ) ) ( not ( = ?auto_229427 ?auto_229432 ) ) ( not ( = ?auto_229427 ?auto_229433 ) ) ( not ( = ?auto_229427 ?auto_229434 ) ) ( not ( = ?auto_229427 ?auto_229435 ) ) ( not ( = ?auto_229427 ?auto_229436 ) ) ( not ( = ?auto_229427 ?auto_229437 ) ) ( not ( = ?auto_229427 ?auto_229438 ) ) ( not ( = ?auto_229428 ?auto_229429 ) ) ( not ( = ?auto_229428 ?auto_229430 ) ) ( not ( = ?auto_229428 ?auto_229431 ) ) ( not ( = ?auto_229428 ?auto_229432 ) ) ( not ( = ?auto_229428 ?auto_229433 ) ) ( not ( = ?auto_229428 ?auto_229434 ) ) ( not ( = ?auto_229428 ?auto_229435 ) ) ( not ( = ?auto_229428 ?auto_229436 ) ) ( not ( = ?auto_229428 ?auto_229437 ) ) ( not ( = ?auto_229428 ?auto_229438 ) ) ( not ( = ?auto_229429 ?auto_229430 ) ) ( not ( = ?auto_229429 ?auto_229431 ) ) ( not ( = ?auto_229429 ?auto_229432 ) ) ( not ( = ?auto_229429 ?auto_229433 ) ) ( not ( = ?auto_229429 ?auto_229434 ) ) ( not ( = ?auto_229429 ?auto_229435 ) ) ( not ( = ?auto_229429 ?auto_229436 ) ) ( not ( = ?auto_229429 ?auto_229437 ) ) ( not ( = ?auto_229429 ?auto_229438 ) ) ( not ( = ?auto_229430 ?auto_229431 ) ) ( not ( = ?auto_229430 ?auto_229432 ) ) ( not ( = ?auto_229430 ?auto_229433 ) ) ( not ( = ?auto_229430 ?auto_229434 ) ) ( not ( = ?auto_229430 ?auto_229435 ) ) ( not ( = ?auto_229430 ?auto_229436 ) ) ( not ( = ?auto_229430 ?auto_229437 ) ) ( not ( = ?auto_229430 ?auto_229438 ) ) ( not ( = ?auto_229431 ?auto_229432 ) ) ( not ( = ?auto_229431 ?auto_229433 ) ) ( not ( = ?auto_229431 ?auto_229434 ) ) ( not ( = ?auto_229431 ?auto_229435 ) ) ( not ( = ?auto_229431 ?auto_229436 ) ) ( not ( = ?auto_229431 ?auto_229437 ) ) ( not ( = ?auto_229431 ?auto_229438 ) ) ( not ( = ?auto_229432 ?auto_229433 ) ) ( not ( = ?auto_229432 ?auto_229434 ) ) ( not ( = ?auto_229432 ?auto_229435 ) ) ( not ( = ?auto_229432 ?auto_229436 ) ) ( not ( = ?auto_229432 ?auto_229437 ) ) ( not ( = ?auto_229432 ?auto_229438 ) ) ( not ( = ?auto_229433 ?auto_229434 ) ) ( not ( = ?auto_229433 ?auto_229435 ) ) ( not ( = ?auto_229433 ?auto_229436 ) ) ( not ( = ?auto_229433 ?auto_229437 ) ) ( not ( = ?auto_229433 ?auto_229438 ) ) ( not ( = ?auto_229434 ?auto_229435 ) ) ( not ( = ?auto_229434 ?auto_229436 ) ) ( not ( = ?auto_229434 ?auto_229437 ) ) ( not ( = ?auto_229434 ?auto_229438 ) ) ( not ( = ?auto_229435 ?auto_229436 ) ) ( not ( = ?auto_229435 ?auto_229437 ) ) ( not ( = ?auto_229435 ?auto_229438 ) ) ( not ( = ?auto_229436 ?auto_229437 ) ) ( not ( = ?auto_229436 ?auto_229438 ) ) ( not ( = ?auto_229437 ?auto_229438 ) ) ( ON ?auto_229437 ?auto_229438 ) ( ON ?auto_229436 ?auto_229437 ) ( ON ?auto_229435 ?auto_229436 ) ( ON ?auto_229434 ?auto_229435 ) ( ON ?auto_229433 ?auto_229434 ) ( CLEAR ?auto_229431 ) ( ON ?auto_229432 ?auto_229433 ) ( CLEAR ?auto_229432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_229426 ?auto_229427 ?auto_229428 ?auto_229429 ?auto_229430 ?auto_229431 ?auto_229432 )
      ( MAKE-13PILE ?auto_229426 ?auto_229427 ?auto_229428 ?auto_229429 ?auto_229430 ?auto_229431 ?auto_229432 ?auto_229433 ?auto_229434 ?auto_229435 ?auto_229436 ?auto_229437 ?auto_229438 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229452 - BLOCK
      ?auto_229453 - BLOCK
      ?auto_229454 - BLOCK
      ?auto_229455 - BLOCK
      ?auto_229456 - BLOCK
      ?auto_229457 - BLOCK
      ?auto_229458 - BLOCK
      ?auto_229459 - BLOCK
      ?auto_229460 - BLOCK
      ?auto_229461 - BLOCK
      ?auto_229462 - BLOCK
      ?auto_229463 - BLOCK
      ?auto_229464 - BLOCK
    )
    :vars
    (
      ?auto_229465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229464 ?auto_229465 ) ( ON-TABLE ?auto_229452 ) ( ON ?auto_229453 ?auto_229452 ) ( ON ?auto_229454 ?auto_229453 ) ( ON ?auto_229455 ?auto_229454 ) ( ON ?auto_229456 ?auto_229455 ) ( not ( = ?auto_229452 ?auto_229453 ) ) ( not ( = ?auto_229452 ?auto_229454 ) ) ( not ( = ?auto_229452 ?auto_229455 ) ) ( not ( = ?auto_229452 ?auto_229456 ) ) ( not ( = ?auto_229452 ?auto_229457 ) ) ( not ( = ?auto_229452 ?auto_229458 ) ) ( not ( = ?auto_229452 ?auto_229459 ) ) ( not ( = ?auto_229452 ?auto_229460 ) ) ( not ( = ?auto_229452 ?auto_229461 ) ) ( not ( = ?auto_229452 ?auto_229462 ) ) ( not ( = ?auto_229452 ?auto_229463 ) ) ( not ( = ?auto_229452 ?auto_229464 ) ) ( not ( = ?auto_229452 ?auto_229465 ) ) ( not ( = ?auto_229453 ?auto_229454 ) ) ( not ( = ?auto_229453 ?auto_229455 ) ) ( not ( = ?auto_229453 ?auto_229456 ) ) ( not ( = ?auto_229453 ?auto_229457 ) ) ( not ( = ?auto_229453 ?auto_229458 ) ) ( not ( = ?auto_229453 ?auto_229459 ) ) ( not ( = ?auto_229453 ?auto_229460 ) ) ( not ( = ?auto_229453 ?auto_229461 ) ) ( not ( = ?auto_229453 ?auto_229462 ) ) ( not ( = ?auto_229453 ?auto_229463 ) ) ( not ( = ?auto_229453 ?auto_229464 ) ) ( not ( = ?auto_229453 ?auto_229465 ) ) ( not ( = ?auto_229454 ?auto_229455 ) ) ( not ( = ?auto_229454 ?auto_229456 ) ) ( not ( = ?auto_229454 ?auto_229457 ) ) ( not ( = ?auto_229454 ?auto_229458 ) ) ( not ( = ?auto_229454 ?auto_229459 ) ) ( not ( = ?auto_229454 ?auto_229460 ) ) ( not ( = ?auto_229454 ?auto_229461 ) ) ( not ( = ?auto_229454 ?auto_229462 ) ) ( not ( = ?auto_229454 ?auto_229463 ) ) ( not ( = ?auto_229454 ?auto_229464 ) ) ( not ( = ?auto_229454 ?auto_229465 ) ) ( not ( = ?auto_229455 ?auto_229456 ) ) ( not ( = ?auto_229455 ?auto_229457 ) ) ( not ( = ?auto_229455 ?auto_229458 ) ) ( not ( = ?auto_229455 ?auto_229459 ) ) ( not ( = ?auto_229455 ?auto_229460 ) ) ( not ( = ?auto_229455 ?auto_229461 ) ) ( not ( = ?auto_229455 ?auto_229462 ) ) ( not ( = ?auto_229455 ?auto_229463 ) ) ( not ( = ?auto_229455 ?auto_229464 ) ) ( not ( = ?auto_229455 ?auto_229465 ) ) ( not ( = ?auto_229456 ?auto_229457 ) ) ( not ( = ?auto_229456 ?auto_229458 ) ) ( not ( = ?auto_229456 ?auto_229459 ) ) ( not ( = ?auto_229456 ?auto_229460 ) ) ( not ( = ?auto_229456 ?auto_229461 ) ) ( not ( = ?auto_229456 ?auto_229462 ) ) ( not ( = ?auto_229456 ?auto_229463 ) ) ( not ( = ?auto_229456 ?auto_229464 ) ) ( not ( = ?auto_229456 ?auto_229465 ) ) ( not ( = ?auto_229457 ?auto_229458 ) ) ( not ( = ?auto_229457 ?auto_229459 ) ) ( not ( = ?auto_229457 ?auto_229460 ) ) ( not ( = ?auto_229457 ?auto_229461 ) ) ( not ( = ?auto_229457 ?auto_229462 ) ) ( not ( = ?auto_229457 ?auto_229463 ) ) ( not ( = ?auto_229457 ?auto_229464 ) ) ( not ( = ?auto_229457 ?auto_229465 ) ) ( not ( = ?auto_229458 ?auto_229459 ) ) ( not ( = ?auto_229458 ?auto_229460 ) ) ( not ( = ?auto_229458 ?auto_229461 ) ) ( not ( = ?auto_229458 ?auto_229462 ) ) ( not ( = ?auto_229458 ?auto_229463 ) ) ( not ( = ?auto_229458 ?auto_229464 ) ) ( not ( = ?auto_229458 ?auto_229465 ) ) ( not ( = ?auto_229459 ?auto_229460 ) ) ( not ( = ?auto_229459 ?auto_229461 ) ) ( not ( = ?auto_229459 ?auto_229462 ) ) ( not ( = ?auto_229459 ?auto_229463 ) ) ( not ( = ?auto_229459 ?auto_229464 ) ) ( not ( = ?auto_229459 ?auto_229465 ) ) ( not ( = ?auto_229460 ?auto_229461 ) ) ( not ( = ?auto_229460 ?auto_229462 ) ) ( not ( = ?auto_229460 ?auto_229463 ) ) ( not ( = ?auto_229460 ?auto_229464 ) ) ( not ( = ?auto_229460 ?auto_229465 ) ) ( not ( = ?auto_229461 ?auto_229462 ) ) ( not ( = ?auto_229461 ?auto_229463 ) ) ( not ( = ?auto_229461 ?auto_229464 ) ) ( not ( = ?auto_229461 ?auto_229465 ) ) ( not ( = ?auto_229462 ?auto_229463 ) ) ( not ( = ?auto_229462 ?auto_229464 ) ) ( not ( = ?auto_229462 ?auto_229465 ) ) ( not ( = ?auto_229463 ?auto_229464 ) ) ( not ( = ?auto_229463 ?auto_229465 ) ) ( not ( = ?auto_229464 ?auto_229465 ) ) ( ON ?auto_229463 ?auto_229464 ) ( ON ?auto_229462 ?auto_229463 ) ( ON ?auto_229461 ?auto_229462 ) ( ON ?auto_229460 ?auto_229461 ) ( ON ?auto_229459 ?auto_229460 ) ( ON ?auto_229458 ?auto_229459 ) ( CLEAR ?auto_229456 ) ( ON ?auto_229457 ?auto_229458 ) ( CLEAR ?auto_229457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_229452 ?auto_229453 ?auto_229454 ?auto_229455 ?auto_229456 ?auto_229457 )
      ( MAKE-13PILE ?auto_229452 ?auto_229453 ?auto_229454 ?auto_229455 ?auto_229456 ?auto_229457 ?auto_229458 ?auto_229459 ?auto_229460 ?auto_229461 ?auto_229462 ?auto_229463 ?auto_229464 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229479 - BLOCK
      ?auto_229480 - BLOCK
      ?auto_229481 - BLOCK
      ?auto_229482 - BLOCK
      ?auto_229483 - BLOCK
      ?auto_229484 - BLOCK
      ?auto_229485 - BLOCK
      ?auto_229486 - BLOCK
      ?auto_229487 - BLOCK
      ?auto_229488 - BLOCK
      ?auto_229489 - BLOCK
      ?auto_229490 - BLOCK
      ?auto_229491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229491 ) ( ON-TABLE ?auto_229479 ) ( ON ?auto_229480 ?auto_229479 ) ( ON ?auto_229481 ?auto_229480 ) ( ON ?auto_229482 ?auto_229481 ) ( ON ?auto_229483 ?auto_229482 ) ( not ( = ?auto_229479 ?auto_229480 ) ) ( not ( = ?auto_229479 ?auto_229481 ) ) ( not ( = ?auto_229479 ?auto_229482 ) ) ( not ( = ?auto_229479 ?auto_229483 ) ) ( not ( = ?auto_229479 ?auto_229484 ) ) ( not ( = ?auto_229479 ?auto_229485 ) ) ( not ( = ?auto_229479 ?auto_229486 ) ) ( not ( = ?auto_229479 ?auto_229487 ) ) ( not ( = ?auto_229479 ?auto_229488 ) ) ( not ( = ?auto_229479 ?auto_229489 ) ) ( not ( = ?auto_229479 ?auto_229490 ) ) ( not ( = ?auto_229479 ?auto_229491 ) ) ( not ( = ?auto_229480 ?auto_229481 ) ) ( not ( = ?auto_229480 ?auto_229482 ) ) ( not ( = ?auto_229480 ?auto_229483 ) ) ( not ( = ?auto_229480 ?auto_229484 ) ) ( not ( = ?auto_229480 ?auto_229485 ) ) ( not ( = ?auto_229480 ?auto_229486 ) ) ( not ( = ?auto_229480 ?auto_229487 ) ) ( not ( = ?auto_229480 ?auto_229488 ) ) ( not ( = ?auto_229480 ?auto_229489 ) ) ( not ( = ?auto_229480 ?auto_229490 ) ) ( not ( = ?auto_229480 ?auto_229491 ) ) ( not ( = ?auto_229481 ?auto_229482 ) ) ( not ( = ?auto_229481 ?auto_229483 ) ) ( not ( = ?auto_229481 ?auto_229484 ) ) ( not ( = ?auto_229481 ?auto_229485 ) ) ( not ( = ?auto_229481 ?auto_229486 ) ) ( not ( = ?auto_229481 ?auto_229487 ) ) ( not ( = ?auto_229481 ?auto_229488 ) ) ( not ( = ?auto_229481 ?auto_229489 ) ) ( not ( = ?auto_229481 ?auto_229490 ) ) ( not ( = ?auto_229481 ?auto_229491 ) ) ( not ( = ?auto_229482 ?auto_229483 ) ) ( not ( = ?auto_229482 ?auto_229484 ) ) ( not ( = ?auto_229482 ?auto_229485 ) ) ( not ( = ?auto_229482 ?auto_229486 ) ) ( not ( = ?auto_229482 ?auto_229487 ) ) ( not ( = ?auto_229482 ?auto_229488 ) ) ( not ( = ?auto_229482 ?auto_229489 ) ) ( not ( = ?auto_229482 ?auto_229490 ) ) ( not ( = ?auto_229482 ?auto_229491 ) ) ( not ( = ?auto_229483 ?auto_229484 ) ) ( not ( = ?auto_229483 ?auto_229485 ) ) ( not ( = ?auto_229483 ?auto_229486 ) ) ( not ( = ?auto_229483 ?auto_229487 ) ) ( not ( = ?auto_229483 ?auto_229488 ) ) ( not ( = ?auto_229483 ?auto_229489 ) ) ( not ( = ?auto_229483 ?auto_229490 ) ) ( not ( = ?auto_229483 ?auto_229491 ) ) ( not ( = ?auto_229484 ?auto_229485 ) ) ( not ( = ?auto_229484 ?auto_229486 ) ) ( not ( = ?auto_229484 ?auto_229487 ) ) ( not ( = ?auto_229484 ?auto_229488 ) ) ( not ( = ?auto_229484 ?auto_229489 ) ) ( not ( = ?auto_229484 ?auto_229490 ) ) ( not ( = ?auto_229484 ?auto_229491 ) ) ( not ( = ?auto_229485 ?auto_229486 ) ) ( not ( = ?auto_229485 ?auto_229487 ) ) ( not ( = ?auto_229485 ?auto_229488 ) ) ( not ( = ?auto_229485 ?auto_229489 ) ) ( not ( = ?auto_229485 ?auto_229490 ) ) ( not ( = ?auto_229485 ?auto_229491 ) ) ( not ( = ?auto_229486 ?auto_229487 ) ) ( not ( = ?auto_229486 ?auto_229488 ) ) ( not ( = ?auto_229486 ?auto_229489 ) ) ( not ( = ?auto_229486 ?auto_229490 ) ) ( not ( = ?auto_229486 ?auto_229491 ) ) ( not ( = ?auto_229487 ?auto_229488 ) ) ( not ( = ?auto_229487 ?auto_229489 ) ) ( not ( = ?auto_229487 ?auto_229490 ) ) ( not ( = ?auto_229487 ?auto_229491 ) ) ( not ( = ?auto_229488 ?auto_229489 ) ) ( not ( = ?auto_229488 ?auto_229490 ) ) ( not ( = ?auto_229488 ?auto_229491 ) ) ( not ( = ?auto_229489 ?auto_229490 ) ) ( not ( = ?auto_229489 ?auto_229491 ) ) ( not ( = ?auto_229490 ?auto_229491 ) ) ( ON ?auto_229490 ?auto_229491 ) ( ON ?auto_229489 ?auto_229490 ) ( ON ?auto_229488 ?auto_229489 ) ( ON ?auto_229487 ?auto_229488 ) ( ON ?auto_229486 ?auto_229487 ) ( ON ?auto_229485 ?auto_229486 ) ( CLEAR ?auto_229483 ) ( ON ?auto_229484 ?auto_229485 ) ( CLEAR ?auto_229484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_229479 ?auto_229480 ?auto_229481 ?auto_229482 ?auto_229483 ?auto_229484 )
      ( MAKE-13PILE ?auto_229479 ?auto_229480 ?auto_229481 ?auto_229482 ?auto_229483 ?auto_229484 ?auto_229485 ?auto_229486 ?auto_229487 ?auto_229488 ?auto_229489 ?auto_229490 ?auto_229491 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229505 - BLOCK
      ?auto_229506 - BLOCK
      ?auto_229507 - BLOCK
      ?auto_229508 - BLOCK
      ?auto_229509 - BLOCK
      ?auto_229510 - BLOCK
      ?auto_229511 - BLOCK
      ?auto_229512 - BLOCK
      ?auto_229513 - BLOCK
      ?auto_229514 - BLOCK
      ?auto_229515 - BLOCK
      ?auto_229516 - BLOCK
      ?auto_229517 - BLOCK
    )
    :vars
    (
      ?auto_229518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229517 ?auto_229518 ) ( ON-TABLE ?auto_229505 ) ( ON ?auto_229506 ?auto_229505 ) ( ON ?auto_229507 ?auto_229506 ) ( ON ?auto_229508 ?auto_229507 ) ( not ( = ?auto_229505 ?auto_229506 ) ) ( not ( = ?auto_229505 ?auto_229507 ) ) ( not ( = ?auto_229505 ?auto_229508 ) ) ( not ( = ?auto_229505 ?auto_229509 ) ) ( not ( = ?auto_229505 ?auto_229510 ) ) ( not ( = ?auto_229505 ?auto_229511 ) ) ( not ( = ?auto_229505 ?auto_229512 ) ) ( not ( = ?auto_229505 ?auto_229513 ) ) ( not ( = ?auto_229505 ?auto_229514 ) ) ( not ( = ?auto_229505 ?auto_229515 ) ) ( not ( = ?auto_229505 ?auto_229516 ) ) ( not ( = ?auto_229505 ?auto_229517 ) ) ( not ( = ?auto_229505 ?auto_229518 ) ) ( not ( = ?auto_229506 ?auto_229507 ) ) ( not ( = ?auto_229506 ?auto_229508 ) ) ( not ( = ?auto_229506 ?auto_229509 ) ) ( not ( = ?auto_229506 ?auto_229510 ) ) ( not ( = ?auto_229506 ?auto_229511 ) ) ( not ( = ?auto_229506 ?auto_229512 ) ) ( not ( = ?auto_229506 ?auto_229513 ) ) ( not ( = ?auto_229506 ?auto_229514 ) ) ( not ( = ?auto_229506 ?auto_229515 ) ) ( not ( = ?auto_229506 ?auto_229516 ) ) ( not ( = ?auto_229506 ?auto_229517 ) ) ( not ( = ?auto_229506 ?auto_229518 ) ) ( not ( = ?auto_229507 ?auto_229508 ) ) ( not ( = ?auto_229507 ?auto_229509 ) ) ( not ( = ?auto_229507 ?auto_229510 ) ) ( not ( = ?auto_229507 ?auto_229511 ) ) ( not ( = ?auto_229507 ?auto_229512 ) ) ( not ( = ?auto_229507 ?auto_229513 ) ) ( not ( = ?auto_229507 ?auto_229514 ) ) ( not ( = ?auto_229507 ?auto_229515 ) ) ( not ( = ?auto_229507 ?auto_229516 ) ) ( not ( = ?auto_229507 ?auto_229517 ) ) ( not ( = ?auto_229507 ?auto_229518 ) ) ( not ( = ?auto_229508 ?auto_229509 ) ) ( not ( = ?auto_229508 ?auto_229510 ) ) ( not ( = ?auto_229508 ?auto_229511 ) ) ( not ( = ?auto_229508 ?auto_229512 ) ) ( not ( = ?auto_229508 ?auto_229513 ) ) ( not ( = ?auto_229508 ?auto_229514 ) ) ( not ( = ?auto_229508 ?auto_229515 ) ) ( not ( = ?auto_229508 ?auto_229516 ) ) ( not ( = ?auto_229508 ?auto_229517 ) ) ( not ( = ?auto_229508 ?auto_229518 ) ) ( not ( = ?auto_229509 ?auto_229510 ) ) ( not ( = ?auto_229509 ?auto_229511 ) ) ( not ( = ?auto_229509 ?auto_229512 ) ) ( not ( = ?auto_229509 ?auto_229513 ) ) ( not ( = ?auto_229509 ?auto_229514 ) ) ( not ( = ?auto_229509 ?auto_229515 ) ) ( not ( = ?auto_229509 ?auto_229516 ) ) ( not ( = ?auto_229509 ?auto_229517 ) ) ( not ( = ?auto_229509 ?auto_229518 ) ) ( not ( = ?auto_229510 ?auto_229511 ) ) ( not ( = ?auto_229510 ?auto_229512 ) ) ( not ( = ?auto_229510 ?auto_229513 ) ) ( not ( = ?auto_229510 ?auto_229514 ) ) ( not ( = ?auto_229510 ?auto_229515 ) ) ( not ( = ?auto_229510 ?auto_229516 ) ) ( not ( = ?auto_229510 ?auto_229517 ) ) ( not ( = ?auto_229510 ?auto_229518 ) ) ( not ( = ?auto_229511 ?auto_229512 ) ) ( not ( = ?auto_229511 ?auto_229513 ) ) ( not ( = ?auto_229511 ?auto_229514 ) ) ( not ( = ?auto_229511 ?auto_229515 ) ) ( not ( = ?auto_229511 ?auto_229516 ) ) ( not ( = ?auto_229511 ?auto_229517 ) ) ( not ( = ?auto_229511 ?auto_229518 ) ) ( not ( = ?auto_229512 ?auto_229513 ) ) ( not ( = ?auto_229512 ?auto_229514 ) ) ( not ( = ?auto_229512 ?auto_229515 ) ) ( not ( = ?auto_229512 ?auto_229516 ) ) ( not ( = ?auto_229512 ?auto_229517 ) ) ( not ( = ?auto_229512 ?auto_229518 ) ) ( not ( = ?auto_229513 ?auto_229514 ) ) ( not ( = ?auto_229513 ?auto_229515 ) ) ( not ( = ?auto_229513 ?auto_229516 ) ) ( not ( = ?auto_229513 ?auto_229517 ) ) ( not ( = ?auto_229513 ?auto_229518 ) ) ( not ( = ?auto_229514 ?auto_229515 ) ) ( not ( = ?auto_229514 ?auto_229516 ) ) ( not ( = ?auto_229514 ?auto_229517 ) ) ( not ( = ?auto_229514 ?auto_229518 ) ) ( not ( = ?auto_229515 ?auto_229516 ) ) ( not ( = ?auto_229515 ?auto_229517 ) ) ( not ( = ?auto_229515 ?auto_229518 ) ) ( not ( = ?auto_229516 ?auto_229517 ) ) ( not ( = ?auto_229516 ?auto_229518 ) ) ( not ( = ?auto_229517 ?auto_229518 ) ) ( ON ?auto_229516 ?auto_229517 ) ( ON ?auto_229515 ?auto_229516 ) ( ON ?auto_229514 ?auto_229515 ) ( ON ?auto_229513 ?auto_229514 ) ( ON ?auto_229512 ?auto_229513 ) ( ON ?auto_229511 ?auto_229512 ) ( ON ?auto_229510 ?auto_229511 ) ( CLEAR ?auto_229508 ) ( ON ?auto_229509 ?auto_229510 ) ( CLEAR ?auto_229509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_229505 ?auto_229506 ?auto_229507 ?auto_229508 ?auto_229509 )
      ( MAKE-13PILE ?auto_229505 ?auto_229506 ?auto_229507 ?auto_229508 ?auto_229509 ?auto_229510 ?auto_229511 ?auto_229512 ?auto_229513 ?auto_229514 ?auto_229515 ?auto_229516 ?auto_229517 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229532 - BLOCK
      ?auto_229533 - BLOCK
      ?auto_229534 - BLOCK
      ?auto_229535 - BLOCK
      ?auto_229536 - BLOCK
      ?auto_229537 - BLOCK
      ?auto_229538 - BLOCK
      ?auto_229539 - BLOCK
      ?auto_229540 - BLOCK
      ?auto_229541 - BLOCK
      ?auto_229542 - BLOCK
      ?auto_229543 - BLOCK
      ?auto_229544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229544 ) ( ON-TABLE ?auto_229532 ) ( ON ?auto_229533 ?auto_229532 ) ( ON ?auto_229534 ?auto_229533 ) ( ON ?auto_229535 ?auto_229534 ) ( not ( = ?auto_229532 ?auto_229533 ) ) ( not ( = ?auto_229532 ?auto_229534 ) ) ( not ( = ?auto_229532 ?auto_229535 ) ) ( not ( = ?auto_229532 ?auto_229536 ) ) ( not ( = ?auto_229532 ?auto_229537 ) ) ( not ( = ?auto_229532 ?auto_229538 ) ) ( not ( = ?auto_229532 ?auto_229539 ) ) ( not ( = ?auto_229532 ?auto_229540 ) ) ( not ( = ?auto_229532 ?auto_229541 ) ) ( not ( = ?auto_229532 ?auto_229542 ) ) ( not ( = ?auto_229532 ?auto_229543 ) ) ( not ( = ?auto_229532 ?auto_229544 ) ) ( not ( = ?auto_229533 ?auto_229534 ) ) ( not ( = ?auto_229533 ?auto_229535 ) ) ( not ( = ?auto_229533 ?auto_229536 ) ) ( not ( = ?auto_229533 ?auto_229537 ) ) ( not ( = ?auto_229533 ?auto_229538 ) ) ( not ( = ?auto_229533 ?auto_229539 ) ) ( not ( = ?auto_229533 ?auto_229540 ) ) ( not ( = ?auto_229533 ?auto_229541 ) ) ( not ( = ?auto_229533 ?auto_229542 ) ) ( not ( = ?auto_229533 ?auto_229543 ) ) ( not ( = ?auto_229533 ?auto_229544 ) ) ( not ( = ?auto_229534 ?auto_229535 ) ) ( not ( = ?auto_229534 ?auto_229536 ) ) ( not ( = ?auto_229534 ?auto_229537 ) ) ( not ( = ?auto_229534 ?auto_229538 ) ) ( not ( = ?auto_229534 ?auto_229539 ) ) ( not ( = ?auto_229534 ?auto_229540 ) ) ( not ( = ?auto_229534 ?auto_229541 ) ) ( not ( = ?auto_229534 ?auto_229542 ) ) ( not ( = ?auto_229534 ?auto_229543 ) ) ( not ( = ?auto_229534 ?auto_229544 ) ) ( not ( = ?auto_229535 ?auto_229536 ) ) ( not ( = ?auto_229535 ?auto_229537 ) ) ( not ( = ?auto_229535 ?auto_229538 ) ) ( not ( = ?auto_229535 ?auto_229539 ) ) ( not ( = ?auto_229535 ?auto_229540 ) ) ( not ( = ?auto_229535 ?auto_229541 ) ) ( not ( = ?auto_229535 ?auto_229542 ) ) ( not ( = ?auto_229535 ?auto_229543 ) ) ( not ( = ?auto_229535 ?auto_229544 ) ) ( not ( = ?auto_229536 ?auto_229537 ) ) ( not ( = ?auto_229536 ?auto_229538 ) ) ( not ( = ?auto_229536 ?auto_229539 ) ) ( not ( = ?auto_229536 ?auto_229540 ) ) ( not ( = ?auto_229536 ?auto_229541 ) ) ( not ( = ?auto_229536 ?auto_229542 ) ) ( not ( = ?auto_229536 ?auto_229543 ) ) ( not ( = ?auto_229536 ?auto_229544 ) ) ( not ( = ?auto_229537 ?auto_229538 ) ) ( not ( = ?auto_229537 ?auto_229539 ) ) ( not ( = ?auto_229537 ?auto_229540 ) ) ( not ( = ?auto_229537 ?auto_229541 ) ) ( not ( = ?auto_229537 ?auto_229542 ) ) ( not ( = ?auto_229537 ?auto_229543 ) ) ( not ( = ?auto_229537 ?auto_229544 ) ) ( not ( = ?auto_229538 ?auto_229539 ) ) ( not ( = ?auto_229538 ?auto_229540 ) ) ( not ( = ?auto_229538 ?auto_229541 ) ) ( not ( = ?auto_229538 ?auto_229542 ) ) ( not ( = ?auto_229538 ?auto_229543 ) ) ( not ( = ?auto_229538 ?auto_229544 ) ) ( not ( = ?auto_229539 ?auto_229540 ) ) ( not ( = ?auto_229539 ?auto_229541 ) ) ( not ( = ?auto_229539 ?auto_229542 ) ) ( not ( = ?auto_229539 ?auto_229543 ) ) ( not ( = ?auto_229539 ?auto_229544 ) ) ( not ( = ?auto_229540 ?auto_229541 ) ) ( not ( = ?auto_229540 ?auto_229542 ) ) ( not ( = ?auto_229540 ?auto_229543 ) ) ( not ( = ?auto_229540 ?auto_229544 ) ) ( not ( = ?auto_229541 ?auto_229542 ) ) ( not ( = ?auto_229541 ?auto_229543 ) ) ( not ( = ?auto_229541 ?auto_229544 ) ) ( not ( = ?auto_229542 ?auto_229543 ) ) ( not ( = ?auto_229542 ?auto_229544 ) ) ( not ( = ?auto_229543 ?auto_229544 ) ) ( ON ?auto_229543 ?auto_229544 ) ( ON ?auto_229542 ?auto_229543 ) ( ON ?auto_229541 ?auto_229542 ) ( ON ?auto_229540 ?auto_229541 ) ( ON ?auto_229539 ?auto_229540 ) ( ON ?auto_229538 ?auto_229539 ) ( ON ?auto_229537 ?auto_229538 ) ( CLEAR ?auto_229535 ) ( ON ?auto_229536 ?auto_229537 ) ( CLEAR ?auto_229536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_229532 ?auto_229533 ?auto_229534 ?auto_229535 ?auto_229536 )
      ( MAKE-13PILE ?auto_229532 ?auto_229533 ?auto_229534 ?auto_229535 ?auto_229536 ?auto_229537 ?auto_229538 ?auto_229539 ?auto_229540 ?auto_229541 ?auto_229542 ?auto_229543 ?auto_229544 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229558 - BLOCK
      ?auto_229559 - BLOCK
      ?auto_229560 - BLOCK
      ?auto_229561 - BLOCK
      ?auto_229562 - BLOCK
      ?auto_229563 - BLOCK
      ?auto_229564 - BLOCK
      ?auto_229565 - BLOCK
      ?auto_229566 - BLOCK
      ?auto_229567 - BLOCK
      ?auto_229568 - BLOCK
      ?auto_229569 - BLOCK
      ?auto_229570 - BLOCK
    )
    :vars
    (
      ?auto_229571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229570 ?auto_229571 ) ( ON-TABLE ?auto_229558 ) ( ON ?auto_229559 ?auto_229558 ) ( ON ?auto_229560 ?auto_229559 ) ( not ( = ?auto_229558 ?auto_229559 ) ) ( not ( = ?auto_229558 ?auto_229560 ) ) ( not ( = ?auto_229558 ?auto_229561 ) ) ( not ( = ?auto_229558 ?auto_229562 ) ) ( not ( = ?auto_229558 ?auto_229563 ) ) ( not ( = ?auto_229558 ?auto_229564 ) ) ( not ( = ?auto_229558 ?auto_229565 ) ) ( not ( = ?auto_229558 ?auto_229566 ) ) ( not ( = ?auto_229558 ?auto_229567 ) ) ( not ( = ?auto_229558 ?auto_229568 ) ) ( not ( = ?auto_229558 ?auto_229569 ) ) ( not ( = ?auto_229558 ?auto_229570 ) ) ( not ( = ?auto_229558 ?auto_229571 ) ) ( not ( = ?auto_229559 ?auto_229560 ) ) ( not ( = ?auto_229559 ?auto_229561 ) ) ( not ( = ?auto_229559 ?auto_229562 ) ) ( not ( = ?auto_229559 ?auto_229563 ) ) ( not ( = ?auto_229559 ?auto_229564 ) ) ( not ( = ?auto_229559 ?auto_229565 ) ) ( not ( = ?auto_229559 ?auto_229566 ) ) ( not ( = ?auto_229559 ?auto_229567 ) ) ( not ( = ?auto_229559 ?auto_229568 ) ) ( not ( = ?auto_229559 ?auto_229569 ) ) ( not ( = ?auto_229559 ?auto_229570 ) ) ( not ( = ?auto_229559 ?auto_229571 ) ) ( not ( = ?auto_229560 ?auto_229561 ) ) ( not ( = ?auto_229560 ?auto_229562 ) ) ( not ( = ?auto_229560 ?auto_229563 ) ) ( not ( = ?auto_229560 ?auto_229564 ) ) ( not ( = ?auto_229560 ?auto_229565 ) ) ( not ( = ?auto_229560 ?auto_229566 ) ) ( not ( = ?auto_229560 ?auto_229567 ) ) ( not ( = ?auto_229560 ?auto_229568 ) ) ( not ( = ?auto_229560 ?auto_229569 ) ) ( not ( = ?auto_229560 ?auto_229570 ) ) ( not ( = ?auto_229560 ?auto_229571 ) ) ( not ( = ?auto_229561 ?auto_229562 ) ) ( not ( = ?auto_229561 ?auto_229563 ) ) ( not ( = ?auto_229561 ?auto_229564 ) ) ( not ( = ?auto_229561 ?auto_229565 ) ) ( not ( = ?auto_229561 ?auto_229566 ) ) ( not ( = ?auto_229561 ?auto_229567 ) ) ( not ( = ?auto_229561 ?auto_229568 ) ) ( not ( = ?auto_229561 ?auto_229569 ) ) ( not ( = ?auto_229561 ?auto_229570 ) ) ( not ( = ?auto_229561 ?auto_229571 ) ) ( not ( = ?auto_229562 ?auto_229563 ) ) ( not ( = ?auto_229562 ?auto_229564 ) ) ( not ( = ?auto_229562 ?auto_229565 ) ) ( not ( = ?auto_229562 ?auto_229566 ) ) ( not ( = ?auto_229562 ?auto_229567 ) ) ( not ( = ?auto_229562 ?auto_229568 ) ) ( not ( = ?auto_229562 ?auto_229569 ) ) ( not ( = ?auto_229562 ?auto_229570 ) ) ( not ( = ?auto_229562 ?auto_229571 ) ) ( not ( = ?auto_229563 ?auto_229564 ) ) ( not ( = ?auto_229563 ?auto_229565 ) ) ( not ( = ?auto_229563 ?auto_229566 ) ) ( not ( = ?auto_229563 ?auto_229567 ) ) ( not ( = ?auto_229563 ?auto_229568 ) ) ( not ( = ?auto_229563 ?auto_229569 ) ) ( not ( = ?auto_229563 ?auto_229570 ) ) ( not ( = ?auto_229563 ?auto_229571 ) ) ( not ( = ?auto_229564 ?auto_229565 ) ) ( not ( = ?auto_229564 ?auto_229566 ) ) ( not ( = ?auto_229564 ?auto_229567 ) ) ( not ( = ?auto_229564 ?auto_229568 ) ) ( not ( = ?auto_229564 ?auto_229569 ) ) ( not ( = ?auto_229564 ?auto_229570 ) ) ( not ( = ?auto_229564 ?auto_229571 ) ) ( not ( = ?auto_229565 ?auto_229566 ) ) ( not ( = ?auto_229565 ?auto_229567 ) ) ( not ( = ?auto_229565 ?auto_229568 ) ) ( not ( = ?auto_229565 ?auto_229569 ) ) ( not ( = ?auto_229565 ?auto_229570 ) ) ( not ( = ?auto_229565 ?auto_229571 ) ) ( not ( = ?auto_229566 ?auto_229567 ) ) ( not ( = ?auto_229566 ?auto_229568 ) ) ( not ( = ?auto_229566 ?auto_229569 ) ) ( not ( = ?auto_229566 ?auto_229570 ) ) ( not ( = ?auto_229566 ?auto_229571 ) ) ( not ( = ?auto_229567 ?auto_229568 ) ) ( not ( = ?auto_229567 ?auto_229569 ) ) ( not ( = ?auto_229567 ?auto_229570 ) ) ( not ( = ?auto_229567 ?auto_229571 ) ) ( not ( = ?auto_229568 ?auto_229569 ) ) ( not ( = ?auto_229568 ?auto_229570 ) ) ( not ( = ?auto_229568 ?auto_229571 ) ) ( not ( = ?auto_229569 ?auto_229570 ) ) ( not ( = ?auto_229569 ?auto_229571 ) ) ( not ( = ?auto_229570 ?auto_229571 ) ) ( ON ?auto_229569 ?auto_229570 ) ( ON ?auto_229568 ?auto_229569 ) ( ON ?auto_229567 ?auto_229568 ) ( ON ?auto_229566 ?auto_229567 ) ( ON ?auto_229565 ?auto_229566 ) ( ON ?auto_229564 ?auto_229565 ) ( ON ?auto_229563 ?auto_229564 ) ( ON ?auto_229562 ?auto_229563 ) ( CLEAR ?auto_229560 ) ( ON ?auto_229561 ?auto_229562 ) ( CLEAR ?auto_229561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_229558 ?auto_229559 ?auto_229560 ?auto_229561 )
      ( MAKE-13PILE ?auto_229558 ?auto_229559 ?auto_229560 ?auto_229561 ?auto_229562 ?auto_229563 ?auto_229564 ?auto_229565 ?auto_229566 ?auto_229567 ?auto_229568 ?auto_229569 ?auto_229570 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229585 - BLOCK
      ?auto_229586 - BLOCK
      ?auto_229587 - BLOCK
      ?auto_229588 - BLOCK
      ?auto_229589 - BLOCK
      ?auto_229590 - BLOCK
      ?auto_229591 - BLOCK
      ?auto_229592 - BLOCK
      ?auto_229593 - BLOCK
      ?auto_229594 - BLOCK
      ?auto_229595 - BLOCK
      ?auto_229596 - BLOCK
      ?auto_229597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229597 ) ( ON-TABLE ?auto_229585 ) ( ON ?auto_229586 ?auto_229585 ) ( ON ?auto_229587 ?auto_229586 ) ( not ( = ?auto_229585 ?auto_229586 ) ) ( not ( = ?auto_229585 ?auto_229587 ) ) ( not ( = ?auto_229585 ?auto_229588 ) ) ( not ( = ?auto_229585 ?auto_229589 ) ) ( not ( = ?auto_229585 ?auto_229590 ) ) ( not ( = ?auto_229585 ?auto_229591 ) ) ( not ( = ?auto_229585 ?auto_229592 ) ) ( not ( = ?auto_229585 ?auto_229593 ) ) ( not ( = ?auto_229585 ?auto_229594 ) ) ( not ( = ?auto_229585 ?auto_229595 ) ) ( not ( = ?auto_229585 ?auto_229596 ) ) ( not ( = ?auto_229585 ?auto_229597 ) ) ( not ( = ?auto_229586 ?auto_229587 ) ) ( not ( = ?auto_229586 ?auto_229588 ) ) ( not ( = ?auto_229586 ?auto_229589 ) ) ( not ( = ?auto_229586 ?auto_229590 ) ) ( not ( = ?auto_229586 ?auto_229591 ) ) ( not ( = ?auto_229586 ?auto_229592 ) ) ( not ( = ?auto_229586 ?auto_229593 ) ) ( not ( = ?auto_229586 ?auto_229594 ) ) ( not ( = ?auto_229586 ?auto_229595 ) ) ( not ( = ?auto_229586 ?auto_229596 ) ) ( not ( = ?auto_229586 ?auto_229597 ) ) ( not ( = ?auto_229587 ?auto_229588 ) ) ( not ( = ?auto_229587 ?auto_229589 ) ) ( not ( = ?auto_229587 ?auto_229590 ) ) ( not ( = ?auto_229587 ?auto_229591 ) ) ( not ( = ?auto_229587 ?auto_229592 ) ) ( not ( = ?auto_229587 ?auto_229593 ) ) ( not ( = ?auto_229587 ?auto_229594 ) ) ( not ( = ?auto_229587 ?auto_229595 ) ) ( not ( = ?auto_229587 ?auto_229596 ) ) ( not ( = ?auto_229587 ?auto_229597 ) ) ( not ( = ?auto_229588 ?auto_229589 ) ) ( not ( = ?auto_229588 ?auto_229590 ) ) ( not ( = ?auto_229588 ?auto_229591 ) ) ( not ( = ?auto_229588 ?auto_229592 ) ) ( not ( = ?auto_229588 ?auto_229593 ) ) ( not ( = ?auto_229588 ?auto_229594 ) ) ( not ( = ?auto_229588 ?auto_229595 ) ) ( not ( = ?auto_229588 ?auto_229596 ) ) ( not ( = ?auto_229588 ?auto_229597 ) ) ( not ( = ?auto_229589 ?auto_229590 ) ) ( not ( = ?auto_229589 ?auto_229591 ) ) ( not ( = ?auto_229589 ?auto_229592 ) ) ( not ( = ?auto_229589 ?auto_229593 ) ) ( not ( = ?auto_229589 ?auto_229594 ) ) ( not ( = ?auto_229589 ?auto_229595 ) ) ( not ( = ?auto_229589 ?auto_229596 ) ) ( not ( = ?auto_229589 ?auto_229597 ) ) ( not ( = ?auto_229590 ?auto_229591 ) ) ( not ( = ?auto_229590 ?auto_229592 ) ) ( not ( = ?auto_229590 ?auto_229593 ) ) ( not ( = ?auto_229590 ?auto_229594 ) ) ( not ( = ?auto_229590 ?auto_229595 ) ) ( not ( = ?auto_229590 ?auto_229596 ) ) ( not ( = ?auto_229590 ?auto_229597 ) ) ( not ( = ?auto_229591 ?auto_229592 ) ) ( not ( = ?auto_229591 ?auto_229593 ) ) ( not ( = ?auto_229591 ?auto_229594 ) ) ( not ( = ?auto_229591 ?auto_229595 ) ) ( not ( = ?auto_229591 ?auto_229596 ) ) ( not ( = ?auto_229591 ?auto_229597 ) ) ( not ( = ?auto_229592 ?auto_229593 ) ) ( not ( = ?auto_229592 ?auto_229594 ) ) ( not ( = ?auto_229592 ?auto_229595 ) ) ( not ( = ?auto_229592 ?auto_229596 ) ) ( not ( = ?auto_229592 ?auto_229597 ) ) ( not ( = ?auto_229593 ?auto_229594 ) ) ( not ( = ?auto_229593 ?auto_229595 ) ) ( not ( = ?auto_229593 ?auto_229596 ) ) ( not ( = ?auto_229593 ?auto_229597 ) ) ( not ( = ?auto_229594 ?auto_229595 ) ) ( not ( = ?auto_229594 ?auto_229596 ) ) ( not ( = ?auto_229594 ?auto_229597 ) ) ( not ( = ?auto_229595 ?auto_229596 ) ) ( not ( = ?auto_229595 ?auto_229597 ) ) ( not ( = ?auto_229596 ?auto_229597 ) ) ( ON ?auto_229596 ?auto_229597 ) ( ON ?auto_229595 ?auto_229596 ) ( ON ?auto_229594 ?auto_229595 ) ( ON ?auto_229593 ?auto_229594 ) ( ON ?auto_229592 ?auto_229593 ) ( ON ?auto_229591 ?auto_229592 ) ( ON ?auto_229590 ?auto_229591 ) ( ON ?auto_229589 ?auto_229590 ) ( CLEAR ?auto_229587 ) ( ON ?auto_229588 ?auto_229589 ) ( CLEAR ?auto_229588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_229585 ?auto_229586 ?auto_229587 ?auto_229588 )
      ( MAKE-13PILE ?auto_229585 ?auto_229586 ?auto_229587 ?auto_229588 ?auto_229589 ?auto_229590 ?auto_229591 ?auto_229592 ?auto_229593 ?auto_229594 ?auto_229595 ?auto_229596 ?auto_229597 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229611 - BLOCK
      ?auto_229612 - BLOCK
      ?auto_229613 - BLOCK
      ?auto_229614 - BLOCK
      ?auto_229615 - BLOCK
      ?auto_229616 - BLOCK
      ?auto_229617 - BLOCK
      ?auto_229618 - BLOCK
      ?auto_229619 - BLOCK
      ?auto_229620 - BLOCK
      ?auto_229621 - BLOCK
      ?auto_229622 - BLOCK
      ?auto_229623 - BLOCK
    )
    :vars
    (
      ?auto_229624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229623 ?auto_229624 ) ( ON-TABLE ?auto_229611 ) ( ON ?auto_229612 ?auto_229611 ) ( not ( = ?auto_229611 ?auto_229612 ) ) ( not ( = ?auto_229611 ?auto_229613 ) ) ( not ( = ?auto_229611 ?auto_229614 ) ) ( not ( = ?auto_229611 ?auto_229615 ) ) ( not ( = ?auto_229611 ?auto_229616 ) ) ( not ( = ?auto_229611 ?auto_229617 ) ) ( not ( = ?auto_229611 ?auto_229618 ) ) ( not ( = ?auto_229611 ?auto_229619 ) ) ( not ( = ?auto_229611 ?auto_229620 ) ) ( not ( = ?auto_229611 ?auto_229621 ) ) ( not ( = ?auto_229611 ?auto_229622 ) ) ( not ( = ?auto_229611 ?auto_229623 ) ) ( not ( = ?auto_229611 ?auto_229624 ) ) ( not ( = ?auto_229612 ?auto_229613 ) ) ( not ( = ?auto_229612 ?auto_229614 ) ) ( not ( = ?auto_229612 ?auto_229615 ) ) ( not ( = ?auto_229612 ?auto_229616 ) ) ( not ( = ?auto_229612 ?auto_229617 ) ) ( not ( = ?auto_229612 ?auto_229618 ) ) ( not ( = ?auto_229612 ?auto_229619 ) ) ( not ( = ?auto_229612 ?auto_229620 ) ) ( not ( = ?auto_229612 ?auto_229621 ) ) ( not ( = ?auto_229612 ?auto_229622 ) ) ( not ( = ?auto_229612 ?auto_229623 ) ) ( not ( = ?auto_229612 ?auto_229624 ) ) ( not ( = ?auto_229613 ?auto_229614 ) ) ( not ( = ?auto_229613 ?auto_229615 ) ) ( not ( = ?auto_229613 ?auto_229616 ) ) ( not ( = ?auto_229613 ?auto_229617 ) ) ( not ( = ?auto_229613 ?auto_229618 ) ) ( not ( = ?auto_229613 ?auto_229619 ) ) ( not ( = ?auto_229613 ?auto_229620 ) ) ( not ( = ?auto_229613 ?auto_229621 ) ) ( not ( = ?auto_229613 ?auto_229622 ) ) ( not ( = ?auto_229613 ?auto_229623 ) ) ( not ( = ?auto_229613 ?auto_229624 ) ) ( not ( = ?auto_229614 ?auto_229615 ) ) ( not ( = ?auto_229614 ?auto_229616 ) ) ( not ( = ?auto_229614 ?auto_229617 ) ) ( not ( = ?auto_229614 ?auto_229618 ) ) ( not ( = ?auto_229614 ?auto_229619 ) ) ( not ( = ?auto_229614 ?auto_229620 ) ) ( not ( = ?auto_229614 ?auto_229621 ) ) ( not ( = ?auto_229614 ?auto_229622 ) ) ( not ( = ?auto_229614 ?auto_229623 ) ) ( not ( = ?auto_229614 ?auto_229624 ) ) ( not ( = ?auto_229615 ?auto_229616 ) ) ( not ( = ?auto_229615 ?auto_229617 ) ) ( not ( = ?auto_229615 ?auto_229618 ) ) ( not ( = ?auto_229615 ?auto_229619 ) ) ( not ( = ?auto_229615 ?auto_229620 ) ) ( not ( = ?auto_229615 ?auto_229621 ) ) ( not ( = ?auto_229615 ?auto_229622 ) ) ( not ( = ?auto_229615 ?auto_229623 ) ) ( not ( = ?auto_229615 ?auto_229624 ) ) ( not ( = ?auto_229616 ?auto_229617 ) ) ( not ( = ?auto_229616 ?auto_229618 ) ) ( not ( = ?auto_229616 ?auto_229619 ) ) ( not ( = ?auto_229616 ?auto_229620 ) ) ( not ( = ?auto_229616 ?auto_229621 ) ) ( not ( = ?auto_229616 ?auto_229622 ) ) ( not ( = ?auto_229616 ?auto_229623 ) ) ( not ( = ?auto_229616 ?auto_229624 ) ) ( not ( = ?auto_229617 ?auto_229618 ) ) ( not ( = ?auto_229617 ?auto_229619 ) ) ( not ( = ?auto_229617 ?auto_229620 ) ) ( not ( = ?auto_229617 ?auto_229621 ) ) ( not ( = ?auto_229617 ?auto_229622 ) ) ( not ( = ?auto_229617 ?auto_229623 ) ) ( not ( = ?auto_229617 ?auto_229624 ) ) ( not ( = ?auto_229618 ?auto_229619 ) ) ( not ( = ?auto_229618 ?auto_229620 ) ) ( not ( = ?auto_229618 ?auto_229621 ) ) ( not ( = ?auto_229618 ?auto_229622 ) ) ( not ( = ?auto_229618 ?auto_229623 ) ) ( not ( = ?auto_229618 ?auto_229624 ) ) ( not ( = ?auto_229619 ?auto_229620 ) ) ( not ( = ?auto_229619 ?auto_229621 ) ) ( not ( = ?auto_229619 ?auto_229622 ) ) ( not ( = ?auto_229619 ?auto_229623 ) ) ( not ( = ?auto_229619 ?auto_229624 ) ) ( not ( = ?auto_229620 ?auto_229621 ) ) ( not ( = ?auto_229620 ?auto_229622 ) ) ( not ( = ?auto_229620 ?auto_229623 ) ) ( not ( = ?auto_229620 ?auto_229624 ) ) ( not ( = ?auto_229621 ?auto_229622 ) ) ( not ( = ?auto_229621 ?auto_229623 ) ) ( not ( = ?auto_229621 ?auto_229624 ) ) ( not ( = ?auto_229622 ?auto_229623 ) ) ( not ( = ?auto_229622 ?auto_229624 ) ) ( not ( = ?auto_229623 ?auto_229624 ) ) ( ON ?auto_229622 ?auto_229623 ) ( ON ?auto_229621 ?auto_229622 ) ( ON ?auto_229620 ?auto_229621 ) ( ON ?auto_229619 ?auto_229620 ) ( ON ?auto_229618 ?auto_229619 ) ( ON ?auto_229617 ?auto_229618 ) ( ON ?auto_229616 ?auto_229617 ) ( ON ?auto_229615 ?auto_229616 ) ( ON ?auto_229614 ?auto_229615 ) ( CLEAR ?auto_229612 ) ( ON ?auto_229613 ?auto_229614 ) ( CLEAR ?auto_229613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_229611 ?auto_229612 ?auto_229613 )
      ( MAKE-13PILE ?auto_229611 ?auto_229612 ?auto_229613 ?auto_229614 ?auto_229615 ?auto_229616 ?auto_229617 ?auto_229618 ?auto_229619 ?auto_229620 ?auto_229621 ?auto_229622 ?auto_229623 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229638 - BLOCK
      ?auto_229639 - BLOCK
      ?auto_229640 - BLOCK
      ?auto_229641 - BLOCK
      ?auto_229642 - BLOCK
      ?auto_229643 - BLOCK
      ?auto_229644 - BLOCK
      ?auto_229645 - BLOCK
      ?auto_229646 - BLOCK
      ?auto_229647 - BLOCK
      ?auto_229648 - BLOCK
      ?auto_229649 - BLOCK
      ?auto_229650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229650 ) ( ON-TABLE ?auto_229638 ) ( ON ?auto_229639 ?auto_229638 ) ( not ( = ?auto_229638 ?auto_229639 ) ) ( not ( = ?auto_229638 ?auto_229640 ) ) ( not ( = ?auto_229638 ?auto_229641 ) ) ( not ( = ?auto_229638 ?auto_229642 ) ) ( not ( = ?auto_229638 ?auto_229643 ) ) ( not ( = ?auto_229638 ?auto_229644 ) ) ( not ( = ?auto_229638 ?auto_229645 ) ) ( not ( = ?auto_229638 ?auto_229646 ) ) ( not ( = ?auto_229638 ?auto_229647 ) ) ( not ( = ?auto_229638 ?auto_229648 ) ) ( not ( = ?auto_229638 ?auto_229649 ) ) ( not ( = ?auto_229638 ?auto_229650 ) ) ( not ( = ?auto_229639 ?auto_229640 ) ) ( not ( = ?auto_229639 ?auto_229641 ) ) ( not ( = ?auto_229639 ?auto_229642 ) ) ( not ( = ?auto_229639 ?auto_229643 ) ) ( not ( = ?auto_229639 ?auto_229644 ) ) ( not ( = ?auto_229639 ?auto_229645 ) ) ( not ( = ?auto_229639 ?auto_229646 ) ) ( not ( = ?auto_229639 ?auto_229647 ) ) ( not ( = ?auto_229639 ?auto_229648 ) ) ( not ( = ?auto_229639 ?auto_229649 ) ) ( not ( = ?auto_229639 ?auto_229650 ) ) ( not ( = ?auto_229640 ?auto_229641 ) ) ( not ( = ?auto_229640 ?auto_229642 ) ) ( not ( = ?auto_229640 ?auto_229643 ) ) ( not ( = ?auto_229640 ?auto_229644 ) ) ( not ( = ?auto_229640 ?auto_229645 ) ) ( not ( = ?auto_229640 ?auto_229646 ) ) ( not ( = ?auto_229640 ?auto_229647 ) ) ( not ( = ?auto_229640 ?auto_229648 ) ) ( not ( = ?auto_229640 ?auto_229649 ) ) ( not ( = ?auto_229640 ?auto_229650 ) ) ( not ( = ?auto_229641 ?auto_229642 ) ) ( not ( = ?auto_229641 ?auto_229643 ) ) ( not ( = ?auto_229641 ?auto_229644 ) ) ( not ( = ?auto_229641 ?auto_229645 ) ) ( not ( = ?auto_229641 ?auto_229646 ) ) ( not ( = ?auto_229641 ?auto_229647 ) ) ( not ( = ?auto_229641 ?auto_229648 ) ) ( not ( = ?auto_229641 ?auto_229649 ) ) ( not ( = ?auto_229641 ?auto_229650 ) ) ( not ( = ?auto_229642 ?auto_229643 ) ) ( not ( = ?auto_229642 ?auto_229644 ) ) ( not ( = ?auto_229642 ?auto_229645 ) ) ( not ( = ?auto_229642 ?auto_229646 ) ) ( not ( = ?auto_229642 ?auto_229647 ) ) ( not ( = ?auto_229642 ?auto_229648 ) ) ( not ( = ?auto_229642 ?auto_229649 ) ) ( not ( = ?auto_229642 ?auto_229650 ) ) ( not ( = ?auto_229643 ?auto_229644 ) ) ( not ( = ?auto_229643 ?auto_229645 ) ) ( not ( = ?auto_229643 ?auto_229646 ) ) ( not ( = ?auto_229643 ?auto_229647 ) ) ( not ( = ?auto_229643 ?auto_229648 ) ) ( not ( = ?auto_229643 ?auto_229649 ) ) ( not ( = ?auto_229643 ?auto_229650 ) ) ( not ( = ?auto_229644 ?auto_229645 ) ) ( not ( = ?auto_229644 ?auto_229646 ) ) ( not ( = ?auto_229644 ?auto_229647 ) ) ( not ( = ?auto_229644 ?auto_229648 ) ) ( not ( = ?auto_229644 ?auto_229649 ) ) ( not ( = ?auto_229644 ?auto_229650 ) ) ( not ( = ?auto_229645 ?auto_229646 ) ) ( not ( = ?auto_229645 ?auto_229647 ) ) ( not ( = ?auto_229645 ?auto_229648 ) ) ( not ( = ?auto_229645 ?auto_229649 ) ) ( not ( = ?auto_229645 ?auto_229650 ) ) ( not ( = ?auto_229646 ?auto_229647 ) ) ( not ( = ?auto_229646 ?auto_229648 ) ) ( not ( = ?auto_229646 ?auto_229649 ) ) ( not ( = ?auto_229646 ?auto_229650 ) ) ( not ( = ?auto_229647 ?auto_229648 ) ) ( not ( = ?auto_229647 ?auto_229649 ) ) ( not ( = ?auto_229647 ?auto_229650 ) ) ( not ( = ?auto_229648 ?auto_229649 ) ) ( not ( = ?auto_229648 ?auto_229650 ) ) ( not ( = ?auto_229649 ?auto_229650 ) ) ( ON ?auto_229649 ?auto_229650 ) ( ON ?auto_229648 ?auto_229649 ) ( ON ?auto_229647 ?auto_229648 ) ( ON ?auto_229646 ?auto_229647 ) ( ON ?auto_229645 ?auto_229646 ) ( ON ?auto_229644 ?auto_229645 ) ( ON ?auto_229643 ?auto_229644 ) ( ON ?auto_229642 ?auto_229643 ) ( ON ?auto_229641 ?auto_229642 ) ( CLEAR ?auto_229639 ) ( ON ?auto_229640 ?auto_229641 ) ( CLEAR ?auto_229640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_229638 ?auto_229639 ?auto_229640 )
      ( MAKE-13PILE ?auto_229638 ?auto_229639 ?auto_229640 ?auto_229641 ?auto_229642 ?auto_229643 ?auto_229644 ?auto_229645 ?auto_229646 ?auto_229647 ?auto_229648 ?auto_229649 ?auto_229650 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229664 - BLOCK
      ?auto_229665 - BLOCK
      ?auto_229666 - BLOCK
      ?auto_229667 - BLOCK
      ?auto_229668 - BLOCK
      ?auto_229669 - BLOCK
      ?auto_229670 - BLOCK
      ?auto_229671 - BLOCK
      ?auto_229672 - BLOCK
      ?auto_229673 - BLOCK
      ?auto_229674 - BLOCK
      ?auto_229675 - BLOCK
      ?auto_229676 - BLOCK
    )
    :vars
    (
      ?auto_229677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229676 ?auto_229677 ) ( ON-TABLE ?auto_229664 ) ( not ( = ?auto_229664 ?auto_229665 ) ) ( not ( = ?auto_229664 ?auto_229666 ) ) ( not ( = ?auto_229664 ?auto_229667 ) ) ( not ( = ?auto_229664 ?auto_229668 ) ) ( not ( = ?auto_229664 ?auto_229669 ) ) ( not ( = ?auto_229664 ?auto_229670 ) ) ( not ( = ?auto_229664 ?auto_229671 ) ) ( not ( = ?auto_229664 ?auto_229672 ) ) ( not ( = ?auto_229664 ?auto_229673 ) ) ( not ( = ?auto_229664 ?auto_229674 ) ) ( not ( = ?auto_229664 ?auto_229675 ) ) ( not ( = ?auto_229664 ?auto_229676 ) ) ( not ( = ?auto_229664 ?auto_229677 ) ) ( not ( = ?auto_229665 ?auto_229666 ) ) ( not ( = ?auto_229665 ?auto_229667 ) ) ( not ( = ?auto_229665 ?auto_229668 ) ) ( not ( = ?auto_229665 ?auto_229669 ) ) ( not ( = ?auto_229665 ?auto_229670 ) ) ( not ( = ?auto_229665 ?auto_229671 ) ) ( not ( = ?auto_229665 ?auto_229672 ) ) ( not ( = ?auto_229665 ?auto_229673 ) ) ( not ( = ?auto_229665 ?auto_229674 ) ) ( not ( = ?auto_229665 ?auto_229675 ) ) ( not ( = ?auto_229665 ?auto_229676 ) ) ( not ( = ?auto_229665 ?auto_229677 ) ) ( not ( = ?auto_229666 ?auto_229667 ) ) ( not ( = ?auto_229666 ?auto_229668 ) ) ( not ( = ?auto_229666 ?auto_229669 ) ) ( not ( = ?auto_229666 ?auto_229670 ) ) ( not ( = ?auto_229666 ?auto_229671 ) ) ( not ( = ?auto_229666 ?auto_229672 ) ) ( not ( = ?auto_229666 ?auto_229673 ) ) ( not ( = ?auto_229666 ?auto_229674 ) ) ( not ( = ?auto_229666 ?auto_229675 ) ) ( not ( = ?auto_229666 ?auto_229676 ) ) ( not ( = ?auto_229666 ?auto_229677 ) ) ( not ( = ?auto_229667 ?auto_229668 ) ) ( not ( = ?auto_229667 ?auto_229669 ) ) ( not ( = ?auto_229667 ?auto_229670 ) ) ( not ( = ?auto_229667 ?auto_229671 ) ) ( not ( = ?auto_229667 ?auto_229672 ) ) ( not ( = ?auto_229667 ?auto_229673 ) ) ( not ( = ?auto_229667 ?auto_229674 ) ) ( not ( = ?auto_229667 ?auto_229675 ) ) ( not ( = ?auto_229667 ?auto_229676 ) ) ( not ( = ?auto_229667 ?auto_229677 ) ) ( not ( = ?auto_229668 ?auto_229669 ) ) ( not ( = ?auto_229668 ?auto_229670 ) ) ( not ( = ?auto_229668 ?auto_229671 ) ) ( not ( = ?auto_229668 ?auto_229672 ) ) ( not ( = ?auto_229668 ?auto_229673 ) ) ( not ( = ?auto_229668 ?auto_229674 ) ) ( not ( = ?auto_229668 ?auto_229675 ) ) ( not ( = ?auto_229668 ?auto_229676 ) ) ( not ( = ?auto_229668 ?auto_229677 ) ) ( not ( = ?auto_229669 ?auto_229670 ) ) ( not ( = ?auto_229669 ?auto_229671 ) ) ( not ( = ?auto_229669 ?auto_229672 ) ) ( not ( = ?auto_229669 ?auto_229673 ) ) ( not ( = ?auto_229669 ?auto_229674 ) ) ( not ( = ?auto_229669 ?auto_229675 ) ) ( not ( = ?auto_229669 ?auto_229676 ) ) ( not ( = ?auto_229669 ?auto_229677 ) ) ( not ( = ?auto_229670 ?auto_229671 ) ) ( not ( = ?auto_229670 ?auto_229672 ) ) ( not ( = ?auto_229670 ?auto_229673 ) ) ( not ( = ?auto_229670 ?auto_229674 ) ) ( not ( = ?auto_229670 ?auto_229675 ) ) ( not ( = ?auto_229670 ?auto_229676 ) ) ( not ( = ?auto_229670 ?auto_229677 ) ) ( not ( = ?auto_229671 ?auto_229672 ) ) ( not ( = ?auto_229671 ?auto_229673 ) ) ( not ( = ?auto_229671 ?auto_229674 ) ) ( not ( = ?auto_229671 ?auto_229675 ) ) ( not ( = ?auto_229671 ?auto_229676 ) ) ( not ( = ?auto_229671 ?auto_229677 ) ) ( not ( = ?auto_229672 ?auto_229673 ) ) ( not ( = ?auto_229672 ?auto_229674 ) ) ( not ( = ?auto_229672 ?auto_229675 ) ) ( not ( = ?auto_229672 ?auto_229676 ) ) ( not ( = ?auto_229672 ?auto_229677 ) ) ( not ( = ?auto_229673 ?auto_229674 ) ) ( not ( = ?auto_229673 ?auto_229675 ) ) ( not ( = ?auto_229673 ?auto_229676 ) ) ( not ( = ?auto_229673 ?auto_229677 ) ) ( not ( = ?auto_229674 ?auto_229675 ) ) ( not ( = ?auto_229674 ?auto_229676 ) ) ( not ( = ?auto_229674 ?auto_229677 ) ) ( not ( = ?auto_229675 ?auto_229676 ) ) ( not ( = ?auto_229675 ?auto_229677 ) ) ( not ( = ?auto_229676 ?auto_229677 ) ) ( ON ?auto_229675 ?auto_229676 ) ( ON ?auto_229674 ?auto_229675 ) ( ON ?auto_229673 ?auto_229674 ) ( ON ?auto_229672 ?auto_229673 ) ( ON ?auto_229671 ?auto_229672 ) ( ON ?auto_229670 ?auto_229671 ) ( ON ?auto_229669 ?auto_229670 ) ( ON ?auto_229668 ?auto_229669 ) ( ON ?auto_229667 ?auto_229668 ) ( ON ?auto_229666 ?auto_229667 ) ( CLEAR ?auto_229664 ) ( ON ?auto_229665 ?auto_229666 ) ( CLEAR ?auto_229665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_229664 ?auto_229665 )
      ( MAKE-13PILE ?auto_229664 ?auto_229665 ?auto_229666 ?auto_229667 ?auto_229668 ?auto_229669 ?auto_229670 ?auto_229671 ?auto_229672 ?auto_229673 ?auto_229674 ?auto_229675 ?auto_229676 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229691 - BLOCK
      ?auto_229692 - BLOCK
      ?auto_229693 - BLOCK
      ?auto_229694 - BLOCK
      ?auto_229695 - BLOCK
      ?auto_229696 - BLOCK
      ?auto_229697 - BLOCK
      ?auto_229698 - BLOCK
      ?auto_229699 - BLOCK
      ?auto_229700 - BLOCK
      ?auto_229701 - BLOCK
      ?auto_229702 - BLOCK
      ?auto_229703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229703 ) ( ON-TABLE ?auto_229691 ) ( not ( = ?auto_229691 ?auto_229692 ) ) ( not ( = ?auto_229691 ?auto_229693 ) ) ( not ( = ?auto_229691 ?auto_229694 ) ) ( not ( = ?auto_229691 ?auto_229695 ) ) ( not ( = ?auto_229691 ?auto_229696 ) ) ( not ( = ?auto_229691 ?auto_229697 ) ) ( not ( = ?auto_229691 ?auto_229698 ) ) ( not ( = ?auto_229691 ?auto_229699 ) ) ( not ( = ?auto_229691 ?auto_229700 ) ) ( not ( = ?auto_229691 ?auto_229701 ) ) ( not ( = ?auto_229691 ?auto_229702 ) ) ( not ( = ?auto_229691 ?auto_229703 ) ) ( not ( = ?auto_229692 ?auto_229693 ) ) ( not ( = ?auto_229692 ?auto_229694 ) ) ( not ( = ?auto_229692 ?auto_229695 ) ) ( not ( = ?auto_229692 ?auto_229696 ) ) ( not ( = ?auto_229692 ?auto_229697 ) ) ( not ( = ?auto_229692 ?auto_229698 ) ) ( not ( = ?auto_229692 ?auto_229699 ) ) ( not ( = ?auto_229692 ?auto_229700 ) ) ( not ( = ?auto_229692 ?auto_229701 ) ) ( not ( = ?auto_229692 ?auto_229702 ) ) ( not ( = ?auto_229692 ?auto_229703 ) ) ( not ( = ?auto_229693 ?auto_229694 ) ) ( not ( = ?auto_229693 ?auto_229695 ) ) ( not ( = ?auto_229693 ?auto_229696 ) ) ( not ( = ?auto_229693 ?auto_229697 ) ) ( not ( = ?auto_229693 ?auto_229698 ) ) ( not ( = ?auto_229693 ?auto_229699 ) ) ( not ( = ?auto_229693 ?auto_229700 ) ) ( not ( = ?auto_229693 ?auto_229701 ) ) ( not ( = ?auto_229693 ?auto_229702 ) ) ( not ( = ?auto_229693 ?auto_229703 ) ) ( not ( = ?auto_229694 ?auto_229695 ) ) ( not ( = ?auto_229694 ?auto_229696 ) ) ( not ( = ?auto_229694 ?auto_229697 ) ) ( not ( = ?auto_229694 ?auto_229698 ) ) ( not ( = ?auto_229694 ?auto_229699 ) ) ( not ( = ?auto_229694 ?auto_229700 ) ) ( not ( = ?auto_229694 ?auto_229701 ) ) ( not ( = ?auto_229694 ?auto_229702 ) ) ( not ( = ?auto_229694 ?auto_229703 ) ) ( not ( = ?auto_229695 ?auto_229696 ) ) ( not ( = ?auto_229695 ?auto_229697 ) ) ( not ( = ?auto_229695 ?auto_229698 ) ) ( not ( = ?auto_229695 ?auto_229699 ) ) ( not ( = ?auto_229695 ?auto_229700 ) ) ( not ( = ?auto_229695 ?auto_229701 ) ) ( not ( = ?auto_229695 ?auto_229702 ) ) ( not ( = ?auto_229695 ?auto_229703 ) ) ( not ( = ?auto_229696 ?auto_229697 ) ) ( not ( = ?auto_229696 ?auto_229698 ) ) ( not ( = ?auto_229696 ?auto_229699 ) ) ( not ( = ?auto_229696 ?auto_229700 ) ) ( not ( = ?auto_229696 ?auto_229701 ) ) ( not ( = ?auto_229696 ?auto_229702 ) ) ( not ( = ?auto_229696 ?auto_229703 ) ) ( not ( = ?auto_229697 ?auto_229698 ) ) ( not ( = ?auto_229697 ?auto_229699 ) ) ( not ( = ?auto_229697 ?auto_229700 ) ) ( not ( = ?auto_229697 ?auto_229701 ) ) ( not ( = ?auto_229697 ?auto_229702 ) ) ( not ( = ?auto_229697 ?auto_229703 ) ) ( not ( = ?auto_229698 ?auto_229699 ) ) ( not ( = ?auto_229698 ?auto_229700 ) ) ( not ( = ?auto_229698 ?auto_229701 ) ) ( not ( = ?auto_229698 ?auto_229702 ) ) ( not ( = ?auto_229698 ?auto_229703 ) ) ( not ( = ?auto_229699 ?auto_229700 ) ) ( not ( = ?auto_229699 ?auto_229701 ) ) ( not ( = ?auto_229699 ?auto_229702 ) ) ( not ( = ?auto_229699 ?auto_229703 ) ) ( not ( = ?auto_229700 ?auto_229701 ) ) ( not ( = ?auto_229700 ?auto_229702 ) ) ( not ( = ?auto_229700 ?auto_229703 ) ) ( not ( = ?auto_229701 ?auto_229702 ) ) ( not ( = ?auto_229701 ?auto_229703 ) ) ( not ( = ?auto_229702 ?auto_229703 ) ) ( ON ?auto_229702 ?auto_229703 ) ( ON ?auto_229701 ?auto_229702 ) ( ON ?auto_229700 ?auto_229701 ) ( ON ?auto_229699 ?auto_229700 ) ( ON ?auto_229698 ?auto_229699 ) ( ON ?auto_229697 ?auto_229698 ) ( ON ?auto_229696 ?auto_229697 ) ( ON ?auto_229695 ?auto_229696 ) ( ON ?auto_229694 ?auto_229695 ) ( ON ?auto_229693 ?auto_229694 ) ( CLEAR ?auto_229691 ) ( ON ?auto_229692 ?auto_229693 ) ( CLEAR ?auto_229692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_229691 ?auto_229692 )
      ( MAKE-13PILE ?auto_229691 ?auto_229692 ?auto_229693 ?auto_229694 ?auto_229695 ?auto_229696 ?auto_229697 ?auto_229698 ?auto_229699 ?auto_229700 ?auto_229701 ?auto_229702 ?auto_229703 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229717 - BLOCK
      ?auto_229718 - BLOCK
      ?auto_229719 - BLOCK
      ?auto_229720 - BLOCK
      ?auto_229721 - BLOCK
      ?auto_229722 - BLOCK
      ?auto_229723 - BLOCK
      ?auto_229724 - BLOCK
      ?auto_229725 - BLOCK
      ?auto_229726 - BLOCK
      ?auto_229727 - BLOCK
      ?auto_229728 - BLOCK
      ?auto_229729 - BLOCK
    )
    :vars
    (
      ?auto_229730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229729 ?auto_229730 ) ( not ( = ?auto_229717 ?auto_229718 ) ) ( not ( = ?auto_229717 ?auto_229719 ) ) ( not ( = ?auto_229717 ?auto_229720 ) ) ( not ( = ?auto_229717 ?auto_229721 ) ) ( not ( = ?auto_229717 ?auto_229722 ) ) ( not ( = ?auto_229717 ?auto_229723 ) ) ( not ( = ?auto_229717 ?auto_229724 ) ) ( not ( = ?auto_229717 ?auto_229725 ) ) ( not ( = ?auto_229717 ?auto_229726 ) ) ( not ( = ?auto_229717 ?auto_229727 ) ) ( not ( = ?auto_229717 ?auto_229728 ) ) ( not ( = ?auto_229717 ?auto_229729 ) ) ( not ( = ?auto_229717 ?auto_229730 ) ) ( not ( = ?auto_229718 ?auto_229719 ) ) ( not ( = ?auto_229718 ?auto_229720 ) ) ( not ( = ?auto_229718 ?auto_229721 ) ) ( not ( = ?auto_229718 ?auto_229722 ) ) ( not ( = ?auto_229718 ?auto_229723 ) ) ( not ( = ?auto_229718 ?auto_229724 ) ) ( not ( = ?auto_229718 ?auto_229725 ) ) ( not ( = ?auto_229718 ?auto_229726 ) ) ( not ( = ?auto_229718 ?auto_229727 ) ) ( not ( = ?auto_229718 ?auto_229728 ) ) ( not ( = ?auto_229718 ?auto_229729 ) ) ( not ( = ?auto_229718 ?auto_229730 ) ) ( not ( = ?auto_229719 ?auto_229720 ) ) ( not ( = ?auto_229719 ?auto_229721 ) ) ( not ( = ?auto_229719 ?auto_229722 ) ) ( not ( = ?auto_229719 ?auto_229723 ) ) ( not ( = ?auto_229719 ?auto_229724 ) ) ( not ( = ?auto_229719 ?auto_229725 ) ) ( not ( = ?auto_229719 ?auto_229726 ) ) ( not ( = ?auto_229719 ?auto_229727 ) ) ( not ( = ?auto_229719 ?auto_229728 ) ) ( not ( = ?auto_229719 ?auto_229729 ) ) ( not ( = ?auto_229719 ?auto_229730 ) ) ( not ( = ?auto_229720 ?auto_229721 ) ) ( not ( = ?auto_229720 ?auto_229722 ) ) ( not ( = ?auto_229720 ?auto_229723 ) ) ( not ( = ?auto_229720 ?auto_229724 ) ) ( not ( = ?auto_229720 ?auto_229725 ) ) ( not ( = ?auto_229720 ?auto_229726 ) ) ( not ( = ?auto_229720 ?auto_229727 ) ) ( not ( = ?auto_229720 ?auto_229728 ) ) ( not ( = ?auto_229720 ?auto_229729 ) ) ( not ( = ?auto_229720 ?auto_229730 ) ) ( not ( = ?auto_229721 ?auto_229722 ) ) ( not ( = ?auto_229721 ?auto_229723 ) ) ( not ( = ?auto_229721 ?auto_229724 ) ) ( not ( = ?auto_229721 ?auto_229725 ) ) ( not ( = ?auto_229721 ?auto_229726 ) ) ( not ( = ?auto_229721 ?auto_229727 ) ) ( not ( = ?auto_229721 ?auto_229728 ) ) ( not ( = ?auto_229721 ?auto_229729 ) ) ( not ( = ?auto_229721 ?auto_229730 ) ) ( not ( = ?auto_229722 ?auto_229723 ) ) ( not ( = ?auto_229722 ?auto_229724 ) ) ( not ( = ?auto_229722 ?auto_229725 ) ) ( not ( = ?auto_229722 ?auto_229726 ) ) ( not ( = ?auto_229722 ?auto_229727 ) ) ( not ( = ?auto_229722 ?auto_229728 ) ) ( not ( = ?auto_229722 ?auto_229729 ) ) ( not ( = ?auto_229722 ?auto_229730 ) ) ( not ( = ?auto_229723 ?auto_229724 ) ) ( not ( = ?auto_229723 ?auto_229725 ) ) ( not ( = ?auto_229723 ?auto_229726 ) ) ( not ( = ?auto_229723 ?auto_229727 ) ) ( not ( = ?auto_229723 ?auto_229728 ) ) ( not ( = ?auto_229723 ?auto_229729 ) ) ( not ( = ?auto_229723 ?auto_229730 ) ) ( not ( = ?auto_229724 ?auto_229725 ) ) ( not ( = ?auto_229724 ?auto_229726 ) ) ( not ( = ?auto_229724 ?auto_229727 ) ) ( not ( = ?auto_229724 ?auto_229728 ) ) ( not ( = ?auto_229724 ?auto_229729 ) ) ( not ( = ?auto_229724 ?auto_229730 ) ) ( not ( = ?auto_229725 ?auto_229726 ) ) ( not ( = ?auto_229725 ?auto_229727 ) ) ( not ( = ?auto_229725 ?auto_229728 ) ) ( not ( = ?auto_229725 ?auto_229729 ) ) ( not ( = ?auto_229725 ?auto_229730 ) ) ( not ( = ?auto_229726 ?auto_229727 ) ) ( not ( = ?auto_229726 ?auto_229728 ) ) ( not ( = ?auto_229726 ?auto_229729 ) ) ( not ( = ?auto_229726 ?auto_229730 ) ) ( not ( = ?auto_229727 ?auto_229728 ) ) ( not ( = ?auto_229727 ?auto_229729 ) ) ( not ( = ?auto_229727 ?auto_229730 ) ) ( not ( = ?auto_229728 ?auto_229729 ) ) ( not ( = ?auto_229728 ?auto_229730 ) ) ( not ( = ?auto_229729 ?auto_229730 ) ) ( ON ?auto_229728 ?auto_229729 ) ( ON ?auto_229727 ?auto_229728 ) ( ON ?auto_229726 ?auto_229727 ) ( ON ?auto_229725 ?auto_229726 ) ( ON ?auto_229724 ?auto_229725 ) ( ON ?auto_229723 ?auto_229724 ) ( ON ?auto_229722 ?auto_229723 ) ( ON ?auto_229721 ?auto_229722 ) ( ON ?auto_229720 ?auto_229721 ) ( ON ?auto_229719 ?auto_229720 ) ( ON ?auto_229718 ?auto_229719 ) ( ON ?auto_229717 ?auto_229718 ) ( CLEAR ?auto_229717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_229717 )
      ( MAKE-13PILE ?auto_229717 ?auto_229718 ?auto_229719 ?auto_229720 ?auto_229721 ?auto_229722 ?auto_229723 ?auto_229724 ?auto_229725 ?auto_229726 ?auto_229727 ?auto_229728 ?auto_229729 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229744 - BLOCK
      ?auto_229745 - BLOCK
      ?auto_229746 - BLOCK
      ?auto_229747 - BLOCK
      ?auto_229748 - BLOCK
      ?auto_229749 - BLOCK
      ?auto_229750 - BLOCK
      ?auto_229751 - BLOCK
      ?auto_229752 - BLOCK
      ?auto_229753 - BLOCK
      ?auto_229754 - BLOCK
      ?auto_229755 - BLOCK
      ?auto_229756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_229756 ) ( not ( = ?auto_229744 ?auto_229745 ) ) ( not ( = ?auto_229744 ?auto_229746 ) ) ( not ( = ?auto_229744 ?auto_229747 ) ) ( not ( = ?auto_229744 ?auto_229748 ) ) ( not ( = ?auto_229744 ?auto_229749 ) ) ( not ( = ?auto_229744 ?auto_229750 ) ) ( not ( = ?auto_229744 ?auto_229751 ) ) ( not ( = ?auto_229744 ?auto_229752 ) ) ( not ( = ?auto_229744 ?auto_229753 ) ) ( not ( = ?auto_229744 ?auto_229754 ) ) ( not ( = ?auto_229744 ?auto_229755 ) ) ( not ( = ?auto_229744 ?auto_229756 ) ) ( not ( = ?auto_229745 ?auto_229746 ) ) ( not ( = ?auto_229745 ?auto_229747 ) ) ( not ( = ?auto_229745 ?auto_229748 ) ) ( not ( = ?auto_229745 ?auto_229749 ) ) ( not ( = ?auto_229745 ?auto_229750 ) ) ( not ( = ?auto_229745 ?auto_229751 ) ) ( not ( = ?auto_229745 ?auto_229752 ) ) ( not ( = ?auto_229745 ?auto_229753 ) ) ( not ( = ?auto_229745 ?auto_229754 ) ) ( not ( = ?auto_229745 ?auto_229755 ) ) ( not ( = ?auto_229745 ?auto_229756 ) ) ( not ( = ?auto_229746 ?auto_229747 ) ) ( not ( = ?auto_229746 ?auto_229748 ) ) ( not ( = ?auto_229746 ?auto_229749 ) ) ( not ( = ?auto_229746 ?auto_229750 ) ) ( not ( = ?auto_229746 ?auto_229751 ) ) ( not ( = ?auto_229746 ?auto_229752 ) ) ( not ( = ?auto_229746 ?auto_229753 ) ) ( not ( = ?auto_229746 ?auto_229754 ) ) ( not ( = ?auto_229746 ?auto_229755 ) ) ( not ( = ?auto_229746 ?auto_229756 ) ) ( not ( = ?auto_229747 ?auto_229748 ) ) ( not ( = ?auto_229747 ?auto_229749 ) ) ( not ( = ?auto_229747 ?auto_229750 ) ) ( not ( = ?auto_229747 ?auto_229751 ) ) ( not ( = ?auto_229747 ?auto_229752 ) ) ( not ( = ?auto_229747 ?auto_229753 ) ) ( not ( = ?auto_229747 ?auto_229754 ) ) ( not ( = ?auto_229747 ?auto_229755 ) ) ( not ( = ?auto_229747 ?auto_229756 ) ) ( not ( = ?auto_229748 ?auto_229749 ) ) ( not ( = ?auto_229748 ?auto_229750 ) ) ( not ( = ?auto_229748 ?auto_229751 ) ) ( not ( = ?auto_229748 ?auto_229752 ) ) ( not ( = ?auto_229748 ?auto_229753 ) ) ( not ( = ?auto_229748 ?auto_229754 ) ) ( not ( = ?auto_229748 ?auto_229755 ) ) ( not ( = ?auto_229748 ?auto_229756 ) ) ( not ( = ?auto_229749 ?auto_229750 ) ) ( not ( = ?auto_229749 ?auto_229751 ) ) ( not ( = ?auto_229749 ?auto_229752 ) ) ( not ( = ?auto_229749 ?auto_229753 ) ) ( not ( = ?auto_229749 ?auto_229754 ) ) ( not ( = ?auto_229749 ?auto_229755 ) ) ( not ( = ?auto_229749 ?auto_229756 ) ) ( not ( = ?auto_229750 ?auto_229751 ) ) ( not ( = ?auto_229750 ?auto_229752 ) ) ( not ( = ?auto_229750 ?auto_229753 ) ) ( not ( = ?auto_229750 ?auto_229754 ) ) ( not ( = ?auto_229750 ?auto_229755 ) ) ( not ( = ?auto_229750 ?auto_229756 ) ) ( not ( = ?auto_229751 ?auto_229752 ) ) ( not ( = ?auto_229751 ?auto_229753 ) ) ( not ( = ?auto_229751 ?auto_229754 ) ) ( not ( = ?auto_229751 ?auto_229755 ) ) ( not ( = ?auto_229751 ?auto_229756 ) ) ( not ( = ?auto_229752 ?auto_229753 ) ) ( not ( = ?auto_229752 ?auto_229754 ) ) ( not ( = ?auto_229752 ?auto_229755 ) ) ( not ( = ?auto_229752 ?auto_229756 ) ) ( not ( = ?auto_229753 ?auto_229754 ) ) ( not ( = ?auto_229753 ?auto_229755 ) ) ( not ( = ?auto_229753 ?auto_229756 ) ) ( not ( = ?auto_229754 ?auto_229755 ) ) ( not ( = ?auto_229754 ?auto_229756 ) ) ( not ( = ?auto_229755 ?auto_229756 ) ) ( ON ?auto_229755 ?auto_229756 ) ( ON ?auto_229754 ?auto_229755 ) ( ON ?auto_229753 ?auto_229754 ) ( ON ?auto_229752 ?auto_229753 ) ( ON ?auto_229751 ?auto_229752 ) ( ON ?auto_229750 ?auto_229751 ) ( ON ?auto_229749 ?auto_229750 ) ( ON ?auto_229748 ?auto_229749 ) ( ON ?auto_229747 ?auto_229748 ) ( ON ?auto_229746 ?auto_229747 ) ( ON ?auto_229745 ?auto_229746 ) ( ON ?auto_229744 ?auto_229745 ) ( CLEAR ?auto_229744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_229744 )
      ( MAKE-13PILE ?auto_229744 ?auto_229745 ?auto_229746 ?auto_229747 ?auto_229748 ?auto_229749 ?auto_229750 ?auto_229751 ?auto_229752 ?auto_229753 ?auto_229754 ?auto_229755 ?auto_229756 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_229770 - BLOCK
      ?auto_229771 - BLOCK
      ?auto_229772 - BLOCK
      ?auto_229773 - BLOCK
      ?auto_229774 - BLOCK
      ?auto_229775 - BLOCK
      ?auto_229776 - BLOCK
      ?auto_229777 - BLOCK
      ?auto_229778 - BLOCK
      ?auto_229779 - BLOCK
      ?auto_229780 - BLOCK
      ?auto_229781 - BLOCK
      ?auto_229782 - BLOCK
    )
    :vars
    (
      ?auto_229783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_229770 ?auto_229771 ) ) ( not ( = ?auto_229770 ?auto_229772 ) ) ( not ( = ?auto_229770 ?auto_229773 ) ) ( not ( = ?auto_229770 ?auto_229774 ) ) ( not ( = ?auto_229770 ?auto_229775 ) ) ( not ( = ?auto_229770 ?auto_229776 ) ) ( not ( = ?auto_229770 ?auto_229777 ) ) ( not ( = ?auto_229770 ?auto_229778 ) ) ( not ( = ?auto_229770 ?auto_229779 ) ) ( not ( = ?auto_229770 ?auto_229780 ) ) ( not ( = ?auto_229770 ?auto_229781 ) ) ( not ( = ?auto_229770 ?auto_229782 ) ) ( not ( = ?auto_229771 ?auto_229772 ) ) ( not ( = ?auto_229771 ?auto_229773 ) ) ( not ( = ?auto_229771 ?auto_229774 ) ) ( not ( = ?auto_229771 ?auto_229775 ) ) ( not ( = ?auto_229771 ?auto_229776 ) ) ( not ( = ?auto_229771 ?auto_229777 ) ) ( not ( = ?auto_229771 ?auto_229778 ) ) ( not ( = ?auto_229771 ?auto_229779 ) ) ( not ( = ?auto_229771 ?auto_229780 ) ) ( not ( = ?auto_229771 ?auto_229781 ) ) ( not ( = ?auto_229771 ?auto_229782 ) ) ( not ( = ?auto_229772 ?auto_229773 ) ) ( not ( = ?auto_229772 ?auto_229774 ) ) ( not ( = ?auto_229772 ?auto_229775 ) ) ( not ( = ?auto_229772 ?auto_229776 ) ) ( not ( = ?auto_229772 ?auto_229777 ) ) ( not ( = ?auto_229772 ?auto_229778 ) ) ( not ( = ?auto_229772 ?auto_229779 ) ) ( not ( = ?auto_229772 ?auto_229780 ) ) ( not ( = ?auto_229772 ?auto_229781 ) ) ( not ( = ?auto_229772 ?auto_229782 ) ) ( not ( = ?auto_229773 ?auto_229774 ) ) ( not ( = ?auto_229773 ?auto_229775 ) ) ( not ( = ?auto_229773 ?auto_229776 ) ) ( not ( = ?auto_229773 ?auto_229777 ) ) ( not ( = ?auto_229773 ?auto_229778 ) ) ( not ( = ?auto_229773 ?auto_229779 ) ) ( not ( = ?auto_229773 ?auto_229780 ) ) ( not ( = ?auto_229773 ?auto_229781 ) ) ( not ( = ?auto_229773 ?auto_229782 ) ) ( not ( = ?auto_229774 ?auto_229775 ) ) ( not ( = ?auto_229774 ?auto_229776 ) ) ( not ( = ?auto_229774 ?auto_229777 ) ) ( not ( = ?auto_229774 ?auto_229778 ) ) ( not ( = ?auto_229774 ?auto_229779 ) ) ( not ( = ?auto_229774 ?auto_229780 ) ) ( not ( = ?auto_229774 ?auto_229781 ) ) ( not ( = ?auto_229774 ?auto_229782 ) ) ( not ( = ?auto_229775 ?auto_229776 ) ) ( not ( = ?auto_229775 ?auto_229777 ) ) ( not ( = ?auto_229775 ?auto_229778 ) ) ( not ( = ?auto_229775 ?auto_229779 ) ) ( not ( = ?auto_229775 ?auto_229780 ) ) ( not ( = ?auto_229775 ?auto_229781 ) ) ( not ( = ?auto_229775 ?auto_229782 ) ) ( not ( = ?auto_229776 ?auto_229777 ) ) ( not ( = ?auto_229776 ?auto_229778 ) ) ( not ( = ?auto_229776 ?auto_229779 ) ) ( not ( = ?auto_229776 ?auto_229780 ) ) ( not ( = ?auto_229776 ?auto_229781 ) ) ( not ( = ?auto_229776 ?auto_229782 ) ) ( not ( = ?auto_229777 ?auto_229778 ) ) ( not ( = ?auto_229777 ?auto_229779 ) ) ( not ( = ?auto_229777 ?auto_229780 ) ) ( not ( = ?auto_229777 ?auto_229781 ) ) ( not ( = ?auto_229777 ?auto_229782 ) ) ( not ( = ?auto_229778 ?auto_229779 ) ) ( not ( = ?auto_229778 ?auto_229780 ) ) ( not ( = ?auto_229778 ?auto_229781 ) ) ( not ( = ?auto_229778 ?auto_229782 ) ) ( not ( = ?auto_229779 ?auto_229780 ) ) ( not ( = ?auto_229779 ?auto_229781 ) ) ( not ( = ?auto_229779 ?auto_229782 ) ) ( not ( = ?auto_229780 ?auto_229781 ) ) ( not ( = ?auto_229780 ?auto_229782 ) ) ( not ( = ?auto_229781 ?auto_229782 ) ) ( ON ?auto_229770 ?auto_229783 ) ( not ( = ?auto_229782 ?auto_229783 ) ) ( not ( = ?auto_229781 ?auto_229783 ) ) ( not ( = ?auto_229780 ?auto_229783 ) ) ( not ( = ?auto_229779 ?auto_229783 ) ) ( not ( = ?auto_229778 ?auto_229783 ) ) ( not ( = ?auto_229777 ?auto_229783 ) ) ( not ( = ?auto_229776 ?auto_229783 ) ) ( not ( = ?auto_229775 ?auto_229783 ) ) ( not ( = ?auto_229774 ?auto_229783 ) ) ( not ( = ?auto_229773 ?auto_229783 ) ) ( not ( = ?auto_229772 ?auto_229783 ) ) ( not ( = ?auto_229771 ?auto_229783 ) ) ( not ( = ?auto_229770 ?auto_229783 ) ) ( ON ?auto_229771 ?auto_229770 ) ( ON ?auto_229772 ?auto_229771 ) ( ON ?auto_229773 ?auto_229772 ) ( ON ?auto_229774 ?auto_229773 ) ( ON ?auto_229775 ?auto_229774 ) ( ON ?auto_229776 ?auto_229775 ) ( ON ?auto_229777 ?auto_229776 ) ( ON ?auto_229778 ?auto_229777 ) ( ON ?auto_229779 ?auto_229778 ) ( ON ?auto_229780 ?auto_229779 ) ( ON ?auto_229781 ?auto_229780 ) ( ON ?auto_229782 ?auto_229781 ) ( CLEAR ?auto_229782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_229782 ?auto_229781 ?auto_229780 ?auto_229779 ?auto_229778 ?auto_229777 ?auto_229776 ?auto_229775 ?auto_229774 ?auto_229773 ?auto_229772 ?auto_229771 ?auto_229770 )
      ( MAKE-13PILE ?auto_229770 ?auto_229771 ?auto_229772 ?auto_229773 ?auto_229774 ?auto_229775 ?auto_229776 ?auto_229777 ?auto_229778 ?auto_229779 ?auto_229780 ?auto_229781 ?auto_229782 ) )
  )

)

