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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59375 - BLOCK
      ?auto_59376 - BLOCK
      ?auto_59377 - BLOCK
      ?auto_59378 - BLOCK
      ?auto_59379 - BLOCK
      ?auto_59380 - BLOCK
    )
    :vars
    (
      ?auto_59381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59381 ?auto_59380 ) ( CLEAR ?auto_59381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59375 ) ( ON ?auto_59376 ?auto_59375 ) ( ON ?auto_59377 ?auto_59376 ) ( ON ?auto_59378 ?auto_59377 ) ( ON ?auto_59379 ?auto_59378 ) ( ON ?auto_59380 ?auto_59379 ) ( not ( = ?auto_59375 ?auto_59376 ) ) ( not ( = ?auto_59375 ?auto_59377 ) ) ( not ( = ?auto_59375 ?auto_59378 ) ) ( not ( = ?auto_59375 ?auto_59379 ) ) ( not ( = ?auto_59375 ?auto_59380 ) ) ( not ( = ?auto_59375 ?auto_59381 ) ) ( not ( = ?auto_59376 ?auto_59377 ) ) ( not ( = ?auto_59376 ?auto_59378 ) ) ( not ( = ?auto_59376 ?auto_59379 ) ) ( not ( = ?auto_59376 ?auto_59380 ) ) ( not ( = ?auto_59376 ?auto_59381 ) ) ( not ( = ?auto_59377 ?auto_59378 ) ) ( not ( = ?auto_59377 ?auto_59379 ) ) ( not ( = ?auto_59377 ?auto_59380 ) ) ( not ( = ?auto_59377 ?auto_59381 ) ) ( not ( = ?auto_59378 ?auto_59379 ) ) ( not ( = ?auto_59378 ?auto_59380 ) ) ( not ( = ?auto_59378 ?auto_59381 ) ) ( not ( = ?auto_59379 ?auto_59380 ) ) ( not ( = ?auto_59379 ?auto_59381 ) ) ( not ( = ?auto_59380 ?auto_59381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59381 ?auto_59380 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59383 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_59383 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_59383 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59384 - BLOCK
    )
    :vars
    (
      ?auto_59385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59384 ?auto_59385 ) ( CLEAR ?auto_59384 ) ( HAND-EMPTY ) ( not ( = ?auto_59384 ?auto_59385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59384 ?auto_59385 )
      ( MAKE-1PILE ?auto_59384 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59391 - BLOCK
      ?auto_59392 - BLOCK
      ?auto_59393 - BLOCK
      ?auto_59394 - BLOCK
      ?auto_59395 - BLOCK
    )
    :vars
    (
      ?auto_59396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59396 ?auto_59395 ) ( CLEAR ?auto_59396 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59391 ) ( ON ?auto_59392 ?auto_59391 ) ( ON ?auto_59393 ?auto_59392 ) ( ON ?auto_59394 ?auto_59393 ) ( ON ?auto_59395 ?auto_59394 ) ( not ( = ?auto_59391 ?auto_59392 ) ) ( not ( = ?auto_59391 ?auto_59393 ) ) ( not ( = ?auto_59391 ?auto_59394 ) ) ( not ( = ?auto_59391 ?auto_59395 ) ) ( not ( = ?auto_59391 ?auto_59396 ) ) ( not ( = ?auto_59392 ?auto_59393 ) ) ( not ( = ?auto_59392 ?auto_59394 ) ) ( not ( = ?auto_59392 ?auto_59395 ) ) ( not ( = ?auto_59392 ?auto_59396 ) ) ( not ( = ?auto_59393 ?auto_59394 ) ) ( not ( = ?auto_59393 ?auto_59395 ) ) ( not ( = ?auto_59393 ?auto_59396 ) ) ( not ( = ?auto_59394 ?auto_59395 ) ) ( not ( = ?auto_59394 ?auto_59396 ) ) ( not ( = ?auto_59395 ?auto_59396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59396 ?auto_59395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59397 - BLOCK
      ?auto_59398 - BLOCK
      ?auto_59399 - BLOCK
      ?auto_59400 - BLOCK
      ?auto_59401 - BLOCK
    )
    :vars
    (
      ?auto_59402 - BLOCK
      ?auto_59403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59402 ?auto_59401 ) ( CLEAR ?auto_59402 ) ( ON-TABLE ?auto_59397 ) ( ON ?auto_59398 ?auto_59397 ) ( ON ?auto_59399 ?auto_59398 ) ( ON ?auto_59400 ?auto_59399 ) ( ON ?auto_59401 ?auto_59400 ) ( not ( = ?auto_59397 ?auto_59398 ) ) ( not ( = ?auto_59397 ?auto_59399 ) ) ( not ( = ?auto_59397 ?auto_59400 ) ) ( not ( = ?auto_59397 ?auto_59401 ) ) ( not ( = ?auto_59397 ?auto_59402 ) ) ( not ( = ?auto_59398 ?auto_59399 ) ) ( not ( = ?auto_59398 ?auto_59400 ) ) ( not ( = ?auto_59398 ?auto_59401 ) ) ( not ( = ?auto_59398 ?auto_59402 ) ) ( not ( = ?auto_59399 ?auto_59400 ) ) ( not ( = ?auto_59399 ?auto_59401 ) ) ( not ( = ?auto_59399 ?auto_59402 ) ) ( not ( = ?auto_59400 ?auto_59401 ) ) ( not ( = ?auto_59400 ?auto_59402 ) ) ( not ( = ?auto_59401 ?auto_59402 ) ) ( HOLDING ?auto_59403 ) ( not ( = ?auto_59397 ?auto_59403 ) ) ( not ( = ?auto_59398 ?auto_59403 ) ) ( not ( = ?auto_59399 ?auto_59403 ) ) ( not ( = ?auto_59400 ?auto_59403 ) ) ( not ( = ?auto_59401 ?auto_59403 ) ) ( not ( = ?auto_59402 ?auto_59403 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_59403 )
      ( MAKE-5PILE ?auto_59397 ?auto_59398 ?auto_59399 ?auto_59400 ?auto_59401 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59404 - BLOCK
      ?auto_59405 - BLOCK
      ?auto_59406 - BLOCK
      ?auto_59407 - BLOCK
      ?auto_59408 - BLOCK
    )
    :vars
    (
      ?auto_59410 - BLOCK
      ?auto_59409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59410 ?auto_59408 ) ( ON-TABLE ?auto_59404 ) ( ON ?auto_59405 ?auto_59404 ) ( ON ?auto_59406 ?auto_59405 ) ( ON ?auto_59407 ?auto_59406 ) ( ON ?auto_59408 ?auto_59407 ) ( not ( = ?auto_59404 ?auto_59405 ) ) ( not ( = ?auto_59404 ?auto_59406 ) ) ( not ( = ?auto_59404 ?auto_59407 ) ) ( not ( = ?auto_59404 ?auto_59408 ) ) ( not ( = ?auto_59404 ?auto_59410 ) ) ( not ( = ?auto_59405 ?auto_59406 ) ) ( not ( = ?auto_59405 ?auto_59407 ) ) ( not ( = ?auto_59405 ?auto_59408 ) ) ( not ( = ?auto_59405 ?auto_59410 ) ) ( not ( = ?auto_59406 ?auto_59407 ) ) ( not ( = ?auto_59406 ?auto_59408 ) ) ( not ( = ?auto_59406 ?auto_59410 ) ) ( not ( = ?auto_59407 ?auto_59408 ) ) ( not ( = ?auto_59407 ?auto_59410 ) ) ( not ( = ?auto_59408 ?auto_59410 ) ) ( not ( = ?auto_59404 ?auto_59409 ) ) ( not ( = ?auto_59405 ?auto_59409 ) ) ( not ( = ?auto_59406 ?auto_59409 ) ) ( not ( = ?auto_59407 ?auto_59409 ) ) ( not ( = ?auto_59408 ?auto_59409 ) ) ( not ( = ?auto_59410 ?auto_59409 ) ) ( ON ?auto_59409 ?auto_59410 ) ( CLEAR ?auto_59409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59404 ?auto_59405 ?auto_59406 ?auto_59407 ?auto_59408 ?auto_59410 )
      ( MAKE-5PILE ?auto_59404 ?auto_59405 ?auto_59406 ?auto_59407 ?auto_59408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59413 - BLOCK
      ?auto_59414 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_59414 ) ( CLEAR ?auto_59413 ) ( ON-TABLE ?auto_59413 ) ( not ( = ?auto_59413 ?auto_59414 ) ) )
    :subtasks
    ( ( !STACK ?auto_59414 ?auto_59413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59415 - BLOCK
      ?auto_59416 - BLOCK
    )
    :vars
    (
      ?auto_59417 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59415 ) ( ON-TABLE ?auto_59415 ) ( not ( = ?auto_59415 ?auto_59416 ) ) ( ON ?auto_59416 ?auto_59417 ) ( CLEAR ?auto_59416 ) ( HAND-EMPTY ) ( not ( = ?auto_59415 ?auto_59417 ) ) ( not ( = ?auto_59416 ?auto_59417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59416 ?auto_59417 )
      ( MAKE-2PILE ?auto_59415 ?auto_59416 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59418 - BLOCK
      ?auto_59419 - BLOCK
    )
    :vars
    (
      ?auto_59420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59418 ?auto_59419 ) ) ( ON ?auto_59419 ?auto_59420 ) ( CLEAR ?auto_59419 ) ( not ( = ?auto_59418 ?auto_59420 ) ) ( not ( = ?auto_59419 ?auto_59420 ) ) ( HOLDING ?auto_59418 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59418 )
      ( MAKE-2PILE ?auto_59418 ?auto_59419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59421 - BLOCK
      ?auto_59422 - BLOCK
    )
    :vars
    (
      ?auto_59423 - BLOCK
      ?auto_59425 - BLOCK
      ?auto_59427 - BLOCK
      ?auto_59426 - BLOCK
      ?auto_59424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59421 ?auto_59422 ) ) ( ON ?auto_59422 ?auto_59423 ) ( not ( = ?auto_59421 ?auto_59423 ) ) ( not ( = ?auto_59422 ?auto_59423 ) ) ( ON ?auto_59421 ?auto_59422 ) ( CLEAR ?auto_59421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59425 ) ( ON ?auto_59427 ?auto_59425 ) ( ON ?auto_59426 ?auto_59427 ) ( ON ?auto_59424 ?auto_59426 ) ( ON ?auto_59423 ?auto_59424 ) ( not ( = ?auto_59425 ?auto_59427 ) ) ( not ( = ?auto_59425 ?auto_59426 ) ) ( not ( = ?auto_59425 ?auto_59424 ) ) ( not ( = ?auto_59425 ?auto_59423 ) ) ( not ( = ?auto_59425 ?auto_59422 ) ) ( not ( = ?auto_59425 ?auto_59421 ) ) ( not ( = ?auto_59427 ?auto_59426 ) ) ( not ( = ?auto_59427 ?auto_59424 ) ) ( not ( = ?auto_59427 ?auto_59423 ) ) ( not ( = ?auto_59427 ?auto_59422 ) ) ( not ( = ?auto_59427 ?auto_59421 ) ) ( not ( = ?auto_59426 ?auto_59424 ) ) ( not ( = ?auto_59426 ?auto_59423 ) ) ( not ( = ?auto_59426 ?auto_59422 ) ) ( not ( = ?auto_59426 ?auto_59421 ) ) ( not ( = ?auto_59424 ?auto_59423 ) ) ( not ( = ?auto_59424 ?auto_59422 ) ) ( not ( = ?auto_59424 ?auto_59421 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59425 ?auto_59427 ?auto_59426 ?auto_59424 ?auto_59423 ?auto_59422 )
      ( MAKE-2PILE ?auto_59421 ?auto_59422 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59432 - BLOCK
      ?auto_59433 - BLOCK
      ?auto_59434 - BLOCK
      ?auto_59435 - BLOCK
    )
    :vars
    (
      ?auto_59436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59436 ?auto_59435 ) ( CLEAR ?auto_59436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59432 ) ( ON ?auto_59433 ?auto_59432 ) ( ON ?auto_59434 ?auto_59433 ) ( ON ?auto_59435 ?auto_59434 ) ( not ( = ?auto_59432 ?auto_59433 ) ) ( not ( = ?auto_59432 ?auto_59434 ) ) ( not ( = ?auto_59432 ?auto_59435 ) ) ( not ( = ?auto_59432 ?auto_59436 ) ) ( not ( = ?auto_59433 ?auto_59434 ) ) ( not ( = ?auto_59433 ?auto_59435 ) ) ( not ( = ?auto_59433 ?auto_59436 ) ) ( not ( = ?auto_59434 ?auto_59435 ) ) ( not ( = ?auto_59434 ?auto_59436 ) ) ( not ( = ?auto_59435 ?auto_59436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59436 ?auto_59435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59437 - BLOCK
      ?auto_59438 - BLOCK
      ?auto_59439 - BLOCK
      ?auto_59440 - BLOCK
    )
    :vars
    (
      ?auto_59441 - BLOCK
      ?auto_59442 - BLOCK
      ?auto_59443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59441 ?auto_59440 ) ( CLEAR ?auto_59441 ) ( ON-TABLE ?auto_59437 ) ( ON ?auto_59438 ?auto_59437 ) ( ON ?auto_59439 ?auto_59438 ) ( ON ?auto_59440 ?auto_59439 ) ( not ( = ?auto_59437 ?auto_59438 ) ) ( not ( = ?auto_59437 ?auto_59439 ) ) ( not ( = ?auto_59437 ?auto_59440 ) ) ( not ( = ?auto_59437 ?auto_59441 ) ) ( not ( = ?auto_59438 ?auto_59439 ) ) ( not ( = ?auto_59438 ?auto_59440 ) ) ( not ( = ?auto_59438 ?auto_59441 ) ) ( not ( = ?auto_59439 ?auto_59440 ) ) ( not ( = ?auto_59439 ?auto_59441 ) ) ( not ( = ?auto_59440 ?auto_59441 ) ) ( HOLDING ?auto_59442 ) ( CLEAR ?auto_59443 ) ( not ( = ?auto_59437 ?auto_59442 ) ) ( not ( = ?auto_59437 ?auto_59443 ) ) ( not ( = ?auto_59438 ?auto_59442 ) ) ( not ( = ?auto_59438 ?auto_59443 ) ) ( not ( = ?auto_59439 ?auto_59442 ) ) ( not ( = ?auto_59439 ?auto_59443 ) ) ( not ( = ?auto_59440 ?auto_59442 ) ) ( not ( = ?auto_59440 ?auto_59443 ) ) ( not ( = ?auto_59441 ?auto_59442 ) ) ( not ( = ?auto_59441 ?auto_59443 ) ) ( not ( = ?auto_59442 ?auto_59443 ) ) )
    :subtasks
    ( ( !STACK ?auto_59442 ?auto_59443 )
      ( MAKE-4PILE ?auto_59437 ?auto_59438 ?auto_59439 ?auto_59440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59444 - BLOCK
      ?auto_59445 - BLOCK
      ?auto_59446 - BLOCK
      ?auto_59447 - BLOCK
    )
    :vars
    (
      ?auto_59450 - BLOCK
      ?auto_59449 - BLOCK
      ?auto_59448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59450 ?auto_59447 ) ( ON-TABLE ?auto_59444 ) ( ON ?auto_59445 ?auto_59444 ) ( ON ?auto_59446 ?auto_59445 ) ( ON ?auto_59447 ?auto_59446 ) ( not ( = ?auto_59444 ?auto_59445 ) ) ( not ( = ?auto_59444 ?auto_59446 ) ) ( not ( = ?auto_59444 ?auto_59447 ) ) ( not ( = ?auto_59444 ?auto_59450 ) ) ( not ( = ?auto_59445 ?auto_59446 ) ) ( not ( = ?auto_59445 ?auto_59447 ) ) ( not ( = ?auto_59445 ?auto_59450 ) ) ( not ( = ?auto_59446 ?auto_59447 ) ) ( not ( = ?auto_59446 ?auto_59450 ) ) ( not ( = ?auto_59447 ?auto_59450 ) ) ( CLEAR ?auto_59449 ) ( not ( = ?auto_59444 ?auto_59448 ) ) ( not ( = ?auto_59444 ?auto_59449 ) ) ( not ( = ?auto_59445 ?auto_59448 ) ) ( not ( = ?auto_59445 ?auto_59449 ) ) ( not ( = ?auto_59446 ?auto_59448 ) ) ( not ( = ?auto_59446 ?auto_59449 ) ) ( not ( = ?auto_59447 ?auto_59448 ) ) ( not ( = ?auto_59447 ?auto_59449 ) ) ( not ( = ?auto_59450 ?auto_59448 ) ) ( not ( = ?auto_59450 ?auto_59449 ) ) ( not ( = ?auto_59448 ?auto_59449 ) ) ( ON ?auto_59448 ?auto_59450 ) ( CLEAR ?auto_59448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59444 ?auto_59445 ?auto_59446 ?auto_59447 ?auto_59450 )
      ( MAKE-4PILE ?auto_59444 ?auto_59445 ?auto_59446 ?auto_59447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59451 - BLOCK
      ?auto_59452 - BLOCK
      ?auto_59453 - BLOCK
      ?auto_59454 - BLOCK
    )
    :vars
    (
      ?auto_59457 - BLOCK
      ?auto_59455 - BLOCK
      ?auto_59456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59457 ?auto_59454 ) ( ON-TABLE ?auto_59451 ) ( ON ?auto_59452 ?auto_59451 ) ( ON ?auto_59453 ?auto_59452 ) ( ON ?auto_59454 ?auto_59453 ) ( not ( = ?auto_59451 ?auto_59452 ) ) ( not ( = ?auto_59451 ?auto_59453 ) ) ( not ( = ?auto_59451 ?auto_59454 ) ) ( not ( = ?auto_59451 ?auto_59457 ) ) ( not ( = ?auto_59452 ?auto_59453 ) ) ( not ( = ?auto_59452 ?auto_59454 ) ) ( not ( = ?auto_59452 ?auto_59457 ) ) ( not ( = ?auto_59453 ?auto_59454 ) ) ( not ( = ?auto_59453 ?auto_59457 ) ) ( not ( = ?auto_59454 ?auto_59457 ) ) ( not ( = ?auto_59451 ?auto_59455 ) ) ( not ( = ?auto_59451 ?auto_59456 ) ) ( not ( = ?auto_59452 ?auto_59455 ) ) ( not ( = ?auto_59452 ?auto_59456 ) ) ( not ( = ?auto_59453 ?auto_59455 ) ) ( not ( = ?auto_59453 ?auto_59456 ) ) ( not ( = ?auto_59454 ?auto_59455 ) ) ( not ( = ?auto_59454 ?auto_59456 ) ) ( not ( = ?auto_59457 ?auto_59455 ) ) ( not ( = ?auto_59457 ?auto_59456 ) ) ( not ( = ?auto_59455 ?auto_59456 ) ) ( ON ?auto_59455 ?auto_59457 ) ( CLEAR ?auto_59455 ) ( HOLDING ?auto_59456 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59456 )
      ( MAKE-4PILE ?auto_59451 ?auto_59452 ?auto_59453 ?auto_59454 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59458 - BLOCK
      ?auto_59459 - BLOCK
      ?auto_59460 - BLOCK
      ?auto_59461 - BLOCK
    )
    :vars
    (
      ?auto_59463 - BLOCK
      ?auto_59462 - BLOCK
      ?auto_59464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59463 ?auto_59461 ) ( ON-TABLE ?auto_59458 ) ( ON ?auto_59459 ?auto_59458 ) ( ON ?auto_59460 ?auto_59459 ) ( ON ?auto_59461 ?auto_59460 ) ( not ( = ?auto_59458 ?auto_59459 ) ) ( not ( = ?auto_59458 ?auto_59460 ) ) ( not ( = ?auto_59458 ?auto_59461 ) ) ( not ( = ?auto_59458 ?auto_59463 ) ) ( not ( = ?auto_59459 ?auto_59460 ) ) ( not ( = ?auto_59459 ?auto_59461 ) ) ( not ( = ?auto_59459 ?auto_59463 ) ) ( not ( = ?auto_59460 ?auto_59461 ) ) ( not ( = ?auto_59460 ?auto_59463 ) ) ( not ( = ?auto_59461 ?auto_59463 ) ) ( not ( = ?auto_59458 ?auto_59462 ) ) ( not ( = ?auto_59458 ?auto_59464 ) ) ( not ( = ?auto_59459 ?auto_59462 ) ) ( not ( = ?auto_59459 ?auto_59464 ) ) ( not ( = ?auto_59460 ?auto_59462 ) ) ( not ( = ?auto_59460 ?auto_59464 ) ) ( not ( = ?auto_59461 ?auto_59462 ) ) ( not ( = ?auto_59461 ?auto_59464 ) ) ( not ( = ?auto_59463 ?auto_59462 ) ) ( not ( = ?auto_59463 ?auto_59464 ) ) ( not ( = ?auto_59462 ?auto_59464 ) ) ( ON ?auto_59462 ?auto_59463 ) ( ON ?auto_59464 ?auto_59462 ) ( CLEAR ?auto_59464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59458 ?auto_59459 ?auto_59460 ?auto_59461 ?auto_59463 ?auto_59462 )
      ( MAKE-4PILE ?auto_59458 ?auto_59459 ?auto_59460 ?auto_59461 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59468 - BLOCK
      ?auto_59469 - BLOCK
      ?auto_59470 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_59470 ) ( CLEAR ?auto_59469 ) ( ON-TABLE ?auto_59468 ) ( ON ?auto_59469 ?auto_59468 ) ( not ( = ?auto_59468 ?auto_59469 ) ) ( not ( = ?auto_59468 ?auto_59470 ) ) ( not ( = ?auto_59469 ?auto_59470 ) ) )
    :subtasks
    ( ( !STACK ?auto_59470 ?auto_59469 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59471 - BLOCK
      ?auto_59472 - BLOCK
      ?auto_59473 - BLOCK
    )
    :vars
    (
      ?auto_59474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59472 ) ( ON-TABLE ?auto_59471 ) ( ON ?auto_59472 ?auto_59471 ) ( not ( = ?auto_59471 ?auto_59472 ) ) ( not ( = ?auto_59471 ?auto_59473 ) ) ( not ( = ?auto_59472 ?auto_59473 ) ) ( ON ?auto_59473 ?auto_59474 ) ( CLEAR ?auto_59473 ) ( HAND-EMPTY ) ( not ( = ?auto_59471 ?auto_59474 ) ) ( not ( = ?auto_59472 ?auto_59474 ) ) ( not ( = ?auto_59473 ?auto_59474 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59473 ?auto_59474 )
      ( MAKE-3PILE ?auto_59471 ?auto_59472 ?auto_59473 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59475 - BLOCK
      ?auto_59476 - BLOCK
      ?auto_59477 - BLOCK
    )
    :vars
    (
      ?auto_59478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59475 ) ( not ( = ?auto_59475 ?auto_59476 ) ) ( not ( = ?auto_59475 ?auto_59477 ) ) ( not ( = ?auto_59476 ?auto_59477 ) ) ( ON ?auto_59477 ?auto_59478 ) ( CLEAR ?auto_59477 ) ( not ( = ?auto_59475 ?auto_59478 ) ) ( not ( = ?auto_59476 ?auto_59478 ) ) ( not ( = ?auto_59477 ?auto_59478 ) ) ( HOLDING ?auto_59476 ) ( CLEAR ?auto_59475 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59475 ?auto_59476 )
      ( MAKE-3PILE ?auto_59475 ?auto_59476 ?auto_59477 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59479 - BLOCK
      ?auto_59480 - BLOCK
      ?auto_59481 - BLOCK
    )
    :vars
    (
      ?auto_59482 - BLOCK
      ?auto_59484 - BLOCK
      ?auto_59485 - BLOCK
      ?auto_59483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59479 ) ( not ( = ?auto_59479 ?auto_59480 ) ) ( not ( = ?auto_59479 ?auto_59481 ) ) ( not ( = ?auto_59480 ?auto_59481 ) ) ( ON ?auto_59481 ?auto_59482 ) ( not ( = ?auto_59479 ?auto_59482 ) ) ( not ( = ?auto_59480 ?auto_59482 ) ) ( not ( = ?auto_59481 ?auto_59482 ) ) ( CLEAR ?auto_59479 ) ( ON ?auto_59480 ?auto_59481 ) ( CLEAR ?auto_59480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59484 ) ( ON ?auto_59485 ?auto_59484 ) ( ON ?auto_59483 ?auto_59485 ) ( ON ?auto_59482 ?auto_59483 ) ( not ( = ?auto_59484 ?auto_59485 ) ) ( not ( = ?auto_59484 ?auto_59483 ) ) ( not ( = ?auto_59484 ?auto_59482 ) ) ( not ( = ?auto_59484 ?auto_59481 ) ) ( not ( = ?auto_59484 ?auto_59480 ) ) ( not ( = ?auto_59485 ?auto_59483 ) ) ( not ( = ?auto_59485 ?auto_59482 ) ) ( not ( = ?auto_59485 ?auto_59481 ) ) ( not ( = ?auto_59485 ?auto_59480 ) ) ( not ( = ?auto_59483 ?auto_59482 ) ) ( not ( = ?auto_59483 ?auto_59481 ) ) ( not ( = ?auto_59483 ?auto_59480 ) ) ( not ( = ?auto_59479 ?auto_59484 ) ) ( not ( = ?auto_59479 ?auto_59485 ) ) ( not ( = ?auto_59479 ?auto_59483 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59484 ?auto_59485 ?auto_59483 ?auto_59482 ?auto_59481 )
      ( MAKE-3PILE ?auto_59479 ?auto_59480 ?auto_59481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59486 - BLOCK
      ?auto_59487 - BLOCK
      ?auto_59488 - BLOCK
    )
    :vars
    (
      ?auto_59491 - BLOCK
      ?auto_59490 - BLOCK
      ?auto_59489 - BLOCK
      ?auto_59492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59486 ?auto_59487 ) ) ( not ( = ?auto_59486 ?auto_59488 ) ) ( not ( = ?auto_59487 ?auto_59488 ) ) ( ON ?auto_59488 ?auto_59491 ) ( not ( = ?auto_59486 ?auto_59491 ) ) ( not ( = ?auto_59487 ?auto_59491 ) ) ( not ( = ?auto_59488 ?auto_59491 ) ) ( ON ?auto_59487 ?auto_59488 ) ( CLEAR ?auto_59487 ) ( ON-TABLE ?auto_59490 ) ( ON ?auto_59489 ?auto_59490 ) ( ON ?auto_59492 ?auto_59489 ) ( ON ?auto_59491 ?auto_59492 ) ( not ( = ?auto_59490 ?auto_59489 ) ) ( not ( = ?auto_59490 ?auto_59492 ) ) ( not ( = ?auto_59490 ?auto_59491 ) ) ( not ( = ?auto_59490 ?auto_59488 ) ) ( not ( = ?auto_59490 ?auto_59487 ) ) ( not ( = ?auto_59489 ?auto_59492 ) ) ( not ( = ?auto_59489 ?auto_59491 ) ) ( not ( = ?auto_59489 ?auto_59488 ) ) ( not ( = ?auto_59489 ?auto_59487 ) ) ( not ( = ?auto_59492 ?auto_59491 ) ) ( not ( = ?auto_59492 ?auto_59488 ) ) ( not ( = ?auto_59492 ?auto_59487 ) ) ( not ( = ?auto_59486 ?auto_59490 ) ) ( not ( = ?auto_59486 ?auto_59489 ) ) ( not ( = ?auto_59486 ?auto_59492 ) ) ( HOLDING ?auto_59486 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59486 )
      ( MAKE-3PILE ?auto_59486 ?auto_59487 ?auto_59488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59493 - BLOCK
      ?auto_59494 - BLOCK
      ?auto_59495 - BLOCK
    )
    :vars
    (
      ?auto_59497 - BLOCK
      ?auto_59499 - BLOCK
      ?auto_59498 - BLOCK
      ?auto_59496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59493 ?auto_59494 ) ) ( not ( = ?auto_59493 ?auto_59495 ) ) ( not ( = ?auto_59494 ?auto_59495 ) ) ( ON ?auto_59495 ?auto_59497 ) ( not ( = ?auto_59493 ?auto_59497 ) ) ( not ( = ?auto_59494 ?auto_59497 ) ) ( not ( = ?auto_59495 ?auto_59497 ) ) ( ON ?auto_59494 ?auto_59495 ) ( ON-TABLE ?auto_59499 ) ( ON ?auto_59498 ?auto_59499 ) ( ON ?auto_59496 ?auto_59498 ) ( ON ?auto_59497 ?auto_59496 ) ( not ( = ?auto_59499 ?auto_59498 ) ) ( not ( = ?auto_59499 ?auto_59496 ) ) ( not ( = ?auto_59499 ?auto_59497 ) ) ( not ( = ?auto_59499 ?auto_59495 ) ) ( not ( = ?auto_59499 ?auto_59494 ) ) ( not ( = ?auto_59498 ?auto_59496 ) ) ( not ( = ?auto_59498 ?auto_59497 ) ) ( not ( = ?auto_59498 ?auto_59495 ) ) ( not ( = ?auto_59498 ?auto_59494 ) ) ( not ( = ?auto_59496 ?auto_59497 ) ) ( not ( = ?auto_59496 ?auto_59495 ) ) ( not ( = ?auto_59496 ?auto_59494 ) ) ( not ( = ?auto_59493 ?auto_59499 ) ) ( not ( = ?auto_59493 ?auto_59498 ) ) ( not ( = ?auto_59493 ?auto_59496 ) ) ( ON ?auto_59493 ?auto_59494 ) ( CLEAR ?auto_59493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59499 ?auto_59498 ?auto_59496 ?auto_59497 ?auto_59495 ?auto_59494 )
      ( MAKE-3PILE ?auto_59493 ?auto_59494 ?auto_59495 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59503 - BLOCK
      ?auto_59504 - BLOCK
      ?auto_59505 - BLOCK
    )
    :vars
    (
      ?auto_59506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59506 ?auto_59505 ) ( CLEAR ?auto_59506 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59503 ) ( ON ?auto_59504 ?auto_59503 ) ( ON ?auto_59505 ?auto_59504 ) ( not ( = ?auto_59503 ?auto_59504 ) ) ( not ( = ?auto_59503 ?auto_59505 ) ) ( not ( = ?auto_59503 ?auto_59506 ) ) ( not ( = ?auto_59504 ?auto_59505 ) ) ( not ( = ?auto_59504 ?auto_59506 ) ) ( not ( = ?auto_59505 ?auto_59506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59506 ?auto_59505 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59507 - BLOCK
      ?auto_59508 - BLOCK
      ?auto_59509 - BLOCK
    )
    :vars
    (
      ?auto_59510 - BLOCK
      ?auto_59511 - BLOCK
      ?auto_59512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59510 ?auto_59509 ) ( CLEAR ?auto_59510 ) ( ON-TABLE ?auto_59507 ) ( ON ?auto_59508 ?auto_59507 ) ( ON ?auto_59509 ?auto_59508 ) ( not ( = ?auto_59507 ?auto_59508 ) ) ( not ( = ?auto_59507 ?auto_59509 ) ) ( not ( = ?auto_59507 ?auto_59510 ) ) ( not ( = ?auto_59508 ?auto_59509 ) ) ( not ( = ?auto_59508 ?auto_59510 ) ) ( not ( = ?auto_59509 ?auto_59510 ) ) ( HOLDING ?auto_59511 ) ( CLEAR ?auto_59512 ) ( not ( = ?auto_59507 ?auto_59511 ) ) ( not ( = ?auto_59507 ?auto_59512 ) ) ( not ( = ?auto_59508 ?auto_59511 ) ) ( not ( = ?auto_59508 ?auto_59512 ) ) ( not ( = ?auto_59509 ?auto_59511 ) ) ( not ( = ?auto_59509 ?auto_59512 ) ) ( not ( = ?auto_59510 ?auto_59511 ) ) ( not ( = ?auto_59510 ?auto_59512 ) ) ( not ( = ?auto_59511 ?auto_59512 ) ) )
    :subtasks
    ( ( !STACK ?auto_59511 ?auto_59512 )
      ( MAKE-3PILE ?auto_59507 ?auto_59508 ?auto_59509 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59513 - BLOCK
      ?auto_59514 - BLOCK
      ?auto_59515 - BLOCK
    )
    :vars
    (
      ?auto_59517 - BLOCK
      ?auto_59518 - BLOCK
      ?auto_59516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59517 ?auto_59515 ) ( ON-TABLE ?auto_59513 ) ( ON ?auto_59514 ?auto_59513 ) ( ON ?auto_59515 ?auto_59514 ) ( not ( = ?auto_59513 ?auto_59514 ) ) ( not ( = ?auto_59513 ?auto_59515 ) ) ( not ( = ?auto_59513 ?auto_59517 ) ) ( not ( = ?auto_59514 ?auto_59515 ) ) ( not ( = ?auto_59514 ?auto_59517 ) ) ( not ( = ?auto_59515 ?auto_59517 ) ) ( CLEAR ?auto_59518 ) ( not ( = ?auto_59513 ?auto_59516 ) ) ( not ( = ?auto_59513 ?auto_59518 ) ) ( not ( = ?auto_59514 ?auto_59516 ) ) ( not ( = ?auto_59514 ?auto_59518 ) ) ( not ( = ?auto_59515 ?auto_59516 ) ) ( not ( = ?auto_59515 ?auto_59518 ) ) ( not ( = ?auto_59517 ?auto_59516 ) ) ( not ( = ?auto_59517 ?auto_59518 ) ) ( not ( = ?auto_59516 ?auto_59518 ) ) ( ON ?auto_59516 ?auto_59517 ) ( CLEAR ?auto_59516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59513 ?auto_59514 ?auto_59515 ?auto_59517 )
      ( MAKE-3PILE ?auto_59513 ?auto_59514 ?auto_59515 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59519 - BLOCK
      ?auto_59520 - BLOCK
      ?auto_59521 - BLOCK
    )
    :vars
    (
      ?auto_59524 - BLOCK
      ?auto_59522 - BLOCK
      ?auto_59523 - BLOCK
      ?auto_59525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59524 ?auto_59521 ) ( ON-TABLE ?auto_59519 ) ( ON ?auto_59520 ?auto_59519 ) ( ON ?auto_59521 ?auto_59520 ) ( not ( = ?auto_59519 ?auto_59520 ) ) ( not ( = ?auto_59519 ?auto_59521 ) ) ( not ( = ?auto_59519 ?auto_59524 ) ) ( not ( = ?auto_59520 ?auto_59521 ) ) ( not ( = ?auto_59520 ?auto_59524 ) ) ( not ( = ?auto_59521 ?auto_59524 ) ) ( not ( = ?auto_59519 ?auto_59522 ) ) ( not ( = ?auto_59519 ?auto_59523 ) ) ( not ( = ?auto_59520 ?auto_59522 ) ) ( not ( = ?auto_59520 ?auto_59523 ) ) ( not ( = ?auto_59521 ?auto_59522 ) ) ( not ( = ?auto_59521 ?auto_59523 ) ) ( not ( = ?auto_59524 ?auto_59522 ) ) ( not ( = ?auto_59524 ?auto_59523 ) ) ( not ( = ?auto_59522 ?auto_59523 ) ) ( ON ?auto_59522 ?auto_59524 ) ( CLEAR ?auto_59522 ) ( HOLDING ?auto_59523 ) ( CLEAR ?auto_59525 ) ( ON-TABLE ?auto_59525 ) ( not ( = ?auto_59525 ?auto_59523 ) ) ( not ( = ?auto_59519 ?auto_59525 ) ) ( not ( = ?auto_59520 ?auto_59525 ) ) ( not ( = ?auto_59521 ?auto_59525 ) ) ( not ( = ?auto_59524 ?auto_59525 ) ) ( not ( = ?auto_59522 ?auto_59525 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59525 ?auto_59523 )
      ( MAKE-3PILE ?auto_59519 ?auto_59520 ?auto_59521 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59526 - BLOCK
      ?auto_59527 - BLOCK
      ?auto_59528 - BLOCK
    )
    :vars
    (
      ?auto_59531 - BLOCK
      ?auto_59530 - BLOCK
      ?auto_59529 - BLOCK
      ?auto_59532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59531 ?auto_59528 ) ( ON-TABLE ?auto_59526 ) ( ON ?auto_59527 ?auto_59526 ) ( ON ?auto_59528 ?auto_59527 ) ( not ( = ?auto_59526 ?auto_59527 ) ) ( not ( = ?auto_59526 ?auto_59528 ) ) ( not ( = ?auto_59526 ?auto_59531 ) ) ( not ( = ?auto_59527 ?auto_59528 ) ) ( not ( = ?auto_59527 ?auto_59531 ) ) ( not ( = ?auto_59528 ?auto_59531 ) ) ( not ( = ?auto_59526 ?auto_59530 ) ) ( not ( = ?auto_59526 ?auto_59529 ) ) ( not ( = ?auto_59527 ?auto_59530 ) ) ( not ( = ?auto_59527 ?auto_59529 ) ) ( not ( = ?auto_59528 ?auto_59530 ) ) ( not ( = ?auto_59528 ?auto_59529 ) ) ( not ( = ?auto_59531 ?auto_59530 ) ) ( not ( = ?auto_59531 ?auto_59529 ) ) ( not ( = ?auto_59530 ?auto_59529 ) ) ( ON ?auto_59530 ?auto_59531 ) ( CLEAR ?auto_59532 ) ( ON-TABLE ?auto_59532 ) ( not ( = ?auto_59532 ?auto_59529 ) ) ( not ( = ?auto_59526 ?auto_59532 ) ) ( not ( = ?auto_59527 ?auto_59532 ) ) ( not ( = ?auto_59528 ?auto_59532 ) ) ( not ( = ?auto_59531 ?auto_59532 ) ) ( not ( = ?auto_59530 ?auto_59532 ) ) ( ON ?auto_59529 ?auto_59530 ) ( CLEAR ?auto_59529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59526 ?auto_59527 ?auto_59528 ?auto_59531 ?auto_59530 )
      ( MAKE-3PILE ?auto_59526 ?auto_59527 ?auto_59528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59533 - BLOCK
      ?auto_59534 - BLOCK
      ?auto_59535 - BLOCK
    )
    :vars
    (
      ?auto_59537 - BLOCK
      ?auto_59538 - BLOCK
      ?auto_59539 - BLOCK
      ?auto_59536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59537 ?auto_59535 ) ( ON-TABLE ?auto_59533 ) ( ON ?auto_59534 ?auto_59533 ) ( ON ?auto_59535 ?auto_59534 ) ( not ( = ?auto_59533 ?auto_59534 ) ) ( not ( = ?auto_59533 ?auto_59535 ) ) ( not ( = ?auto_59533 ?auto_59537 ) ) ( not ( = ?auto_59534 ?auto_59535 ) ) ( not ( = ?auto_59534 ?auto_59537 ) ) ( not ( = ?auto_59535 ?auto_59537 ) ) ( not ( = ?auto_59533 ?auto_59538 ) ) ( not ( = ?auto_59533 ?auto_59539 ) ) ( not ( = ?auto_59534 ?auto_59538 ) ) ( not ( = ?auto_59534 ?auto_59539 ) ) ( not ( = ?auto_59535 ?auto_59538 ) ) ( not ( = ?auto_59535 ?auto_59539 ) ) ( not ( = ?auto_59537 ?auto_59538 ) ) ( not ( = ?auto_59537 ?auto_59539 ) ) ( not ( = ?auto_59538 ?auto_59539 ) ) ( ON ?auto_59538 ?auto_59537 ) ( not ( = ?auto_59536 ?auto_59539 ) ) ( not ( = ?auto_59533 ?auto_59536 ) ) ( not ( = ?auto_59534 ?auto_59536 ) ) ( not ( = ?auto_59535 ?auto_59536 ) ) ( not ( = ?auto_59537 ?auto_59536 ) ) ( not ( = ?auto_59538 ?auto_59536 ) ) ( ON ?auto_59539 ?auto_59538 ) ( CLEAR ?auto_59539 ) ( HOLDING ?auto_59536 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59536 )
      ( MAKE-3PILE ?auto_59533 ?auto_59534 ?auto_59535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59540 - BLOCK
      ?auto_59541 - BLOCK
      ?auto_59542 - BLOCK
    )
    :vars
    (
      ?auto_59545 - BLOCK
      ?auto_59543 - BLOCK
      ?auto_59546 - BLOCK
      ?auto_59544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59545 ?auto_59542 ) ( ON-TABLE ?auto_59540 ) ( ON ?auto_59541 ?auto_59540 ) ( ON ?auto_59542 ?auto_59541 ) ( not ( = ?auto_59540 ?auto_59541 ) ) ( not ( = ?auto_59540 ?auto_59542 ) ) ( not ( = ?auto_59540 ?auto_59545 ) ) ( not ( = ?auto_59541 ?auto_59542 ) ) ( not ( = ?auto_59541 ?auto_59545 ) ) ( not ( = ?auto_59542 ?auto_59545 ) ) ( not ( = ?auto_59540 ?auto_59543 ) ) ( not ( = ?auto_59540 ?auto_59546 ) ) ( not ( = ?auto_59541 ?auto_59543 ) ) ( not ( = ?auto_59541 ?auto_59546 ) ) ( not ( = ?auto_59542 ?auto_59543 ) ) ( not ( = ?auto_59542 ?auto_59546 ) ) ( not ( = ?auto_59545 ?auto_59543 ) ) ( not ( = ?auto_59545 ?auto_59546 ) ) ( not ( = ?auto_59543 ?auto_59546 ) ) ( ON ?auto_59543 ?auto_59545 ) ( not ( = ?auto_59544 ?auto_59546 ) ) ( not ( = ?auto_59540 ?auto_59544 ) ) ( not ( = ?auto_59541 ?auto_59544 ) ) ( not ( = ?auto_59542 ?auto_59544 ) ) ( not ( = ?auto_59545 ?auto_59544 ) ) ( not ( = ?auto_59543 ?auto_59544 ) ) ( ON ?auto_59546 ?auto_59543 ) ( ON ?auto_59544 ?auto_59546 ) ( CLEAR ?auto_59544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59540 ?auto_59541 ?auto_59542 ?auto_59545 ?auto_59543 ?auto_59546 )
      ( MAKE-3PILE ?auto_59540 ?auto_59541 ?auto_59542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59551 - BLOCK
      ?auto_59552 - BLOCK
      ?auto_59553 - BLOCK
      ?auto_59554 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_59554 ) ( CLEAR ?auto_59553 ) ( ON-TABLE ?auto_59551 ) ( ON ?auto_59552 ?auto_59551 ) ( ON ?auto_59553 ?auto_59552 ) ( not ( = ?auto_59551 ?auto_59552 ) ) ( not ( = ?auto_59551 ?auto_59553 ) ) ( not ( = ?auto_59551 ?auto_59554 ) ) ( not ( = ?auto_59552 ?auto_59553 ) ) ( not ( = ?auto_59552 ?auto_59554 ) ) ( not ( = ?auto_59553 ?auto_59554 ) ) )
    :subtasks
    ( ( !STACK ?auto_59554 ?auto_59553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59555 - BLOCK
      ?auto_59556 - BLOCK
      ?auto_59557 - BLOCK
      ?auto_59558 - BLOCK
    )
    :vars
    (
      ?auto_59559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59557 ) ( ON-TABLE ?auto_59555 ) ( ON ?auto_59556 ?auto_59555 ) ( ON ?auto_59557 ?auto_59556 ) ( not ( = ?auto_59555 ?auto_59556 ) ) ( not ( = ?auto_59555 ?auto_59557 ) ) ( not ( = ?auto_59555 ?auto_59558 ) ) ( not ( = ?auto_59556 ?auto_59557 ) ) ( not ( = ?auto_59556 ?auto_59558 ) ) ( not ( = ?auto_59557 ?auto_59558 ) ) ( ON ?auto_59558 ?auto_59559 ) ( CLEAR ?auto_59558 ) ( HAND-EMPTY ) ( not ( = ?auto_59555 ?auto_59559 ) ) ( not ( = ?auto_59556 ?auto_59559 ) ) ( not ( = ?auto_59557 ?auto_59559 ) ) ( not ( = ?auto_59558 ?auto_59559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59558 ?auto_59559 )
      ( MAKE-4PILE ?auto_59555 ?auto_59556 ?auto_59557 ?auto_59558 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59560 - BLOCK
      ?auto_59561 - BLOCK
      ?auto_59562 - BLOCK
      ?auto_59563 - BLOCK
    )
    :vars
    (
      ?auto_59564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59560 ) ( ON ?auto_59561 ?auto_59560 ) ( not ( = ?auto_59560 ?auto_59561 ) ) ( not ( = ?auto_59560 ?auto_59562 ) ) ( not ( = ?auto_59560 ?auto_59563 ) ) ( not ( = ?auto_59561 ?auto_59562 ) ) ( not ( = ?auto_59561 ?auto_59563 ) ) ( not ( = ?auto_59562 ?auto_59563 ) ) ( ON ?auto_59563 ?auto_59564 ) ( CLEAR ?auto_59563 ) ( not ( = ?auto_59560 ?auto_59564 ) ) ( not ( = ?auto_59561 ?auto_59564 ) ) ( not ( = ?auto_59562 ?auto_59564 ) ) ( not ( = ?auto_59563 ?auto_59564 ) ) ( HOLDING ?auto_59562 ) ( CLEAR ?auto_59561 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59560 ?auto_59561 ?auto_59562 )
      ( MAKE-4PILE ?auto_59560 ?auto_59561 ?auto_59562 ?auto_59563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59565 - BLOCK
      ?auto_59566 - BLOCK
      ?auto_59567 - BLOCK
      ?auto_59568 - BLOCK
    )
    :vars
    (
      ?auto_59569 - BLOCK
      ?auto_59570 - BLOCK
      ?auto_59571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59565 ) ( ON ?auto_59566 ?auto_59565 ) ( not ( = ?auto_59565 ?auto_59566 ) ) ( not ( = ?auto_59565 ?auto_59567 ) ) ( not ( = ?auto_59565 ?auto_59568 ) ) ( not ( = ?auto_59566 ?auto_59567 ) ) ( not ( = ?auto_59566 ?auto_59568 ) ) ( not ( = ?auto_59567 ?auto_59568 ) ) ( ON ?auto_59568 ?auto_59569 ) ( not ( = ?auto_59565 ?auto_59569 ) ) ( not ( = ?auto_59566 ?auto_59569 ) ) ( not ( = ?auto_59567 ?auto_59569 ) ) ( not ( = ?auto_59568 ?auto_59569 ) ) ( CLEAR ?auto_59566 ) ( ON ?auto_59567 ?auto_59568 ) ( CLEAR ?auto_59567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59570 ) ( ON ?auto_59571 ?auto_59570 ) ( ON ?auto_59569 ?auto_59571 ) ( not ( = ?auto_59570 ?auto_59571 ) ) ( not ( = ?auto_59570 ?auto_59569 ) ) ( not ( = ?auto_59570 ?auto_59568 ) ) ( not ( = ?auto_59570 ?auto_59567 ) ) ( not ( = ?auto_59571 ?auto_59569 ) ) ( not ( = ?auto_59571 ?auto_59568 ) ) ( not ( = ?auto_59571 ?auto_59567 ) ) ( not ( = ?auto_59565 ?auto_59570 ) ) ( not ( = ?auto_59565 ?auto_59571 ) ) ( not ( = ?auto_59566 ?auto_59570 ) ) ( not ( = ?auto_59566 ?auto_59571 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59570 ?auto_59571 ?auto_59569 ?auto_59568 )
      ( MAKE-4PILE ?auto_59565 ?auto_59566 ?auto_59567 ?auto_59568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59572 - BLOCK
      ?auto_59573 - BLOCK
      ?auto_59574 - BLOCK
      ?auto_59575 - BLOCK
    )
    :vars
    (
      ?auto_59576 - BLOCK
      ?auto_59577 - BLOCK
      ?auto_59578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59572 ) ( not ( = ?auto_59572 ?auto_59573 ) ) ( not ( = ?auto_59572 ?auto_59574 ) ) ( not ( = ?auto_59572 ?auto_59575 ) ) ( not ( = ?auto_59573 ?auto_59574 ) ) ( not ( = ?auto_59573 ?auto_59575 ) ) ( not ( = ?auto_59574 ?auto_59575 ) ) ( ON ?auto_59575 ?auto_59576 ) ( not ( = ?auto_59572 ?auto_59576 ) ) ( not ( = ?auto_59573 ?auto_59576 ) ) ( not ( = ?auto_59574 ?auto_59576 ) ) ( not ( = ?auto_59575 ?auto_59576 ) ) ( ON ?auto_59574 ?auto_59575 ) ( CLEAR ?auto_59574 ) ( ON-TABLE ?auto_59577 ) ( ON ?auto_59578 ?auto_59577 ) ( ON ?auto_59576 ?auto_59578 ) ( not ( = ?auto_59577 ?auto_59578 ) ) ( not ( = ?auto_59577 ?auto_59576 ) ) ( not ( = ?auto_59577 ?auto_59575 ) ) ( not ( = ?auto_59577 ?auto_59574 ) ) ( not ( = ?auto_59578 ?auto_59576 ) ) ( not ( = ?auto_59578 ?auto_59575 ) ) ( not ( = ?auto_59578 ?auto_59574 ) ) ( not ( = ?auto_59572 ?auto_59577 ) ) ( not ( = ?auto_59572 ?auto_59578 ) ) ( not ( = ?auto_59573 ?auto_59577 ) ) ( not ( = ?auto_59573 ?auto_59578 ) ) ( HOLDING ?auto_59573 ) ( CLEAR ?auto_59572 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59572 ?auto_59573 )
      ( MAKE-4PILE ?auto_59572 ?auto_59573 ?auto_59574 ?auto_59575 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59579 - BLOCK
      ?auto_59580 - BLOCK
      ?auto_59581 - BLOCK
      ?auto_59582 - BLOCK
    )
    :vars
    (
      ?auto_59583 - BLOCK
      ?auto_59585 - BLOCK
      ?auto_59584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59579 ) ( not ( = ?auto_59579 ?auto_59580 ) ) ( not ( = ?auto_59579 ?auto_59581 ) ) ( not ( = ?auto_59579 ?auto_59582 ) ) ( not ( = ?auto_59580 ?auto_59581 ) ) ( not ( = ?auto_59580 ?auto_59582 ) ) ( not ( = ?auto_59581 ?auto_59582 ) ) ( ON ?auto_59582 ?auto_59583 ) ( not ( = ?auto_59579 ?auto_59583 ) ) ( not ( = ?auto_59580 ?auto_59583 ) ) ( not ( = ?auto_59581 ?auto_59583 ) ) ( not ( = ?auto_59582 ?auto_59583 ) ) ( ON ?auto_59581 ?auto_59582 ) ( ON-TABLE ?auto_59585 ) ( ON ?auto_59584 ?auto_59585 ) ( ON ?auto_59583 ?auto_59584 ) ( not ( = ?auto_59585 ?auto_59584 ) ) ( not ( = ?auto_59585 ?auto_59583 ) ) ( not ( = ?auto_59585 ?auto_59582 ) ) ( not ( = ?auto_59585 ?auto_59581 ) ) ( not ( = ?auto_59584 ?auto_59583 ) ) ( not ( = ?auto_59584 ?auto_59582 ) ) ( not ( = ?auto_59584 ?auto_59581 ) ) ( not ( = ?auto_59579 ?auto_59585 ) ) ( not ( = ?auto_59579 ?auto_59584 ) ) ( not ( = ?auto_59580 ?auto_59585 ) ) ( not ( = ?auto_59580 ?auto_59584 ) ) ( CLEAR ?auto_59579 ) ( ON ?auto_59580 ?auto_59581 ) ( CLEAR ?auto_59580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59585 ?auto_59584 ?auto_59583 ?auto_59582 ?auto_59581 )
      ( MAKE-4PILE ?auto_59579 ?auto_59580 ?auto_59581 ?auto_59582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59586 - BLOCK
      ?auto_59587 - BLOCK
      ?auto_59588 - BLOCK
      ?auto_59589 - BLOCK
    )
    :vars
    (
      ?auto_59592 - BLOCK
      ?auto_59591 - BLOCK
      ?auto_59590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59586 ?auto_59587 ) ) ( not ( = ?auto_59586 ?auto_59588 ) ) ( not ( = ?auto_59586 ?auto_59589 ) ) ( not ( = ?auto_59587 ?auto_59588 ) ) ( not ( = ?auto_59587 ?auto_59589 ) ) ( not ( = ?auto_59588 ?auto_59589 ) ) ( ON ?auto_59589 ?auto_59592 ) ( not ( = ?auto_59586 ?auto_59592 ) ) ( not ( = ?auto_59587 ?auto_59592 ) ) ( not ( = ?auto_59588 ?auto_59592 ) ) ( not ( = ?auto_59589 ?auto_59592 ) ) ( ON ?auto_59588 ?auto_59589 ) ( ON-TABLE ?auto_59591 ) ( ON ?auto_59590 ?auto_59591 ) ( ON ?auto_59592 ?auto_59590 ) ( not ( = ?auto_59591 ?auto_59590 ) ) ( not ( = ?auto_59591 ?auto_59592 ) ) ( not ( = ?auto_59591 ?auto_59589 ) ) ( not ( = ?auto_59591 ?auto_59588 ) ) ( not ( = ?auto_59590 ?auto_59592 ) ) ( not ( = ?auto_59590 ?auto_59589 ) ) ( not ( = ?auto_59590 ?auto_59588 ) ) ( not ( = ?auto_59586 ?auto_59591 ) ) ( not ( = ?auto_59586 ?auto_59590 ) ) ( not ( = ?auto_59587 ?auto_59591 ) ) ( not ( = ?auto_59587 ?auto_59590 ) ) ( ON ?auto_59587 ?auto_59588 ) ( CLEAR ?auto_59587 ) ( HOLDING ?auto_59586 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59586 )
      ( MAKE-4PILE ?auto_59586 ?auto_59587 ?auto_59588 ?auto_59589 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59593 - BLOCK
      ?auto_59594 - BLOCK
      ?auto_59595 - BLOCK
      ?auto_59596 - BLOCK
    )
    :vars
    (
      ?auto_59597 - BLOCK
      ?auto_59599 - BLOCK
      ?auto_59598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59593 ?auto_59594 ) ) ( not ( = ?auto_59593 ?auto_59595 ) ) ( not ( = ?auto_59593 ?auto_59596 ) ) ( not ( = ?auto_59594 ?auto_59595 ) ) ( not ( = ?auto_59594 ?auto_59596 ) ) ( not ( = ?auto_59595 ?auto_59596 ) ) ( ON ?auto_59596 ?auto_59597 ) ( not ( = ?auto_59593 ?auto_59597 ) ) ( not ( = ?auto_59594 ?auto_59597 ) ) ( not ( = ?auto_59595 ?auto_59597 ) ) ( not ( = ?auto_59596 ?auto_59597 ) ) ( ON ?auto_59595 ?auto_59596 ) ( ON-TABLE ?auto_59599 ) ( ON ?auto_59598 ?auto_59599 ) ( ON ?auto_59597 ?auto_59598 ) ( not ( = ?auto_59599 ?auto_59598 ) ) ( not ( = ?auto_59599 ?auto_59597 ) ) ( not ( = ?auto_59599 ?auto_59596 ) ) ( not ( = ?auto_59599 ?auto_59595 ) ) ( not ( = ?auto_59598 ?auto_59597 ) ) ( not ( = ?auto_59598 ?auto_59596 ) ) ( not ( = ?auto_59598 ?auto_59595 ) ) ( not ( = ?auto_59593 ?auto_59599 ) ) ( not ( = ?auto_59593 ?auto_59598 ) ) ( not ( = ?auto_59594 ?auto_59599 ) ) ( not ( = ?auto_59594 ?auto_59598 ) ) ( ON ?auto_59594 ?auto_59595 ) ( ON ?auto_59593 ?auto_59594 ) ( CLEAR ?auto_59593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59599 ?auto_59598 ?auto_59597 ?auto_59596 ?auto_59595 ?auto_59594 )
      ( MAKE-4PILE ?auto_59593 ?auto_59594 ?auto_59595 ?auto_59596 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59602 - BLOCK
      ?auto_59603 - BLOCK
    )
    :vars
    (
      ?auto_59604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59604 ?auto_59603 ) ( CLEAR ?auto_59604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59602 ) ( ON ?auto_59603 ?auto_59602 ) ( not ( = ?auto_59602 ?auto_59603 ) ) ( not ( = ?auto_59602 ?auto_59604 ) ) ( not ( = ?auto_59603 ?auto_59604 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59604 ?auto_59603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59605 - BLOCK
      ?auto_59606 - BLOCK
    )
    :vars
    (
      ?auto_59607 - BLOCK
      ?auto_59608 - BLOCK
      ?auto_59609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59607 ?auto_59606 ) ( CLEAR ?auto_59607 ) ( ON-TABLE ?auto_59605 ) ( ON ?auto_59606 ?auto_59605 ) ( not ( = ?auto_59605 ?auto_59606 ) ) ( not ( = ?auto_59605 ?auto_59607 ) ) ( not ( = ?auto_59606 ?auto_59607 ) ) ( HOLDING ?auto_59608 ) ( CLEAR ?auto_59609 ) ( not ( = ?auto_59605 ?auto_59608 ) ) ( not ( = ?auto_59605 ?auto_59609 ) ) ( not ( = ?auto_59606 ?auto_59608 ) ) ( not ( = ?auto_59606 ?auto_59609 ) ) ( not ( = ?auto_59607 ?auto_59608 ) ) ( not ( = ?auto_59607 ?auto_59609 ) ) ( not ( = ?auto_59608 ?auto_59609 ) ) )
    :subtasks
    ( ( !STACK ?auto_59608 ?auto_59609 )
      ( MAKE-2PILE ?auto_59605 ?auto_59606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59610 - BLOCK
      ?auto_59611 - BLOCK
    )
    :vars
    (
      ?auto_59613 - BLOCK
      ?auto_59614 - BLOCK
      ?auto_59612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59613 ?auto_59611 ) ( ON-TABLE ?auto_59610 ) ( ON ?auto_59611 ?auto_59610 ) ( not ( = ?auto_59610 ?auto_59611 ) ) ( not ( = ?auto_59610 ?auto_59613 ) ) ( not ( = ?auto_59611 ?auto_59613 ) ) ( CLEAR ?auto_59614 ) ( not ( = ?auto_59610 ?auto_59612 ) ) ( not ( = ?auto_59610 ?auto_59614 ) ) ( not ( = ?auto_59611 ?auto_59612 ) ) ( not ( = ?auto_59611 ?auto_59614 ) ) ( not ( = ?auto_59613 ?auto_59612 ) ) ( not ( = ?auto_59613 ?auto_59614 ) ) ( not ( = ?auto_59612 ?auto_59614 ) ) ( ON ?auto_59612 ?auto_59613 ) ( CLEAR ?auto_59612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59610 ?auto_59611 ?auto_59613 )
      ( MAKE-2PILE ?auto_59610 ?auto_59611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59615 - BLOCK
      ?auto_59616 - BLOCK
    )
    :vars
    (
      ?auto_59617 - BLOCK
      ?auto_59618 - BLOCK
      ?auto_59619 - BLOCK
      ?auto_59621 - BLOCK
      ?auto_59620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59617 ?auto_59616 ) ( ON-TABLE ?auto_59615 ) ( ON ?auto_59616 ?auto_59615 ) ( not ( = ?auto_59615 ?auto_59616 ) ) ( not ( = ?auto_59615 ?auto_59617 ) ) ( not ( = ?auto_59616 ?auto_59617 ) ) ( not ( = ?auto_59615 ?auto_59618 ) ) ( not ( = ?auto_59615 ?auto_59619 ) ) ( not ( = ?auto_59616 ?auto_59618 ) ) ( not ( = ?auto_59616 ?auto_59619 ) ) ( not ( = ?auto_59617 ?auto_59618 ) ) ( not ( = ?auto_59617 ?auto_59619 ) ) ( not ( = ?auto_59618 ?auto_59619 ) ) ( ON ?auto_59618 ?auto_59617 ) ( CLEAR ?auto_59618 ) ( HOLDING ?auto_59619 ) ( CLEAR ?auto_59621 ) ( ON-TABLE ?auto_59620 ) ( ON ?auto_59621 ?auto_59620 ) ( not ( = ?auto_59620 ?auto_59621 ) ) ( not ( = ?auto_59620 ?auto_59619 ) ) ( not ( = ?auto_59621 ?auto_59619 ) ) ( not ( = ?auto_59615 ?auto_59621 ) ) ( not ( = ?auto_59615 ?auto_59620 ) ) ( not ( = ?auto_59616 ?auto_59621 ) ) ( not ( = ?auto_59616 ?auto_59620 ) ) ( not ( = ?auto_59617 ?auto_59621 ) ) ( not ( = ?auto_59617 ?auto_59620 ) ) ( not ( = ?auto_59618 ?auto_59621 ) ) ( not ( = ?auto_59618 ?auto_59620 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59620 ?auto_59621 ?auto_59619 )
      ( MAKE-2PILE ?auto_59615 ?auto_59616 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59622 - BLOCK
      ?auto_59623 - BLOCK
    )
    :vars
    (
      ?auto_59628 - BLOCK
      ?auto_59624 - BLOCK
      ?auto_59627 - BLOCK
      ?auto_59626 - BLOCK
      ?auto_59625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59628 ?auto_59623 ) ( ON-TABLE ?auto_59622 ) ( ON ?auto_59623 ?auto_59622 ) ( not ( = ?auto_59622 ?auto_59623 ) ) ( not ( = ?auto_59622 ?auto_59628 ) ) ( not ( = ?auto_59623 ?auto_59628 ) ) ( not ( = ?auto_59622 ?auto_59624 ) ) ( not ( = ?auto_59622 ?auto_59627 ) ) ( not ( = ?auto_59623 ?auto_59624 ) ) ( not ( = ?auto_59623 ?auto_59627 ) ) ( not ( = ?auto_59628 ?auto_59624 ) ) ( not ( = ?auto_59628 ?auto_59627 ) ) ( not ( = ?auto_59624 ?auto_59627 ) ) ( ON ?auto_59624 ?auto_59628 ) ( CLEAR ?auto_59626 ) ( ON-TABLE ?auto_59625 ) ( ON ?auto_59626 ?auto_59625 ) ( not ( = ?auto_59625 ?auto_59626 ) ) ( not ( = ?auto_59625 ?auto_59627 ) ) ( not ( = ?auto_59626 ?auto_59627 ) ) ( not ( = ?auto_59622 ?auto_59626 ) ) ( not ( = ?auto_59622 ?auto_59625 ) ) ( not ( = ?auto_59623 ?auto_59626 ) ) ( not ( = ?auto_59623 ?auto_59625 ) ) ( not ( = ?auto_59628 ?auto_59626 ) ) ( not ( = ?auto_59628 ?auto_59625 ) ) ( not ( = ?auto_59624 ?auto_59626 ) ) ( not ( = ?auto_59624 ?auto_59625 ) ) ( ON ?auto_59627 ?auto_59624 ) ( CLEAR ?auto_59627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59622 ?auto_59623 ?auto_59628 ?auto_59624 )
      ( MAKE-2PILE ?auto_59622 ?auto_59623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59629 - BLOCK
      ?auto_59630 - BLOCK
    )
    :vars
    (
      ?auto_59634 - BLOCK
      ?auto_59633 - BLOCK
      ?auto_59632 - BLOCK
      ?auto_59635 - BLOCK
      ?auto_59631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59634 ?auto_59630 ) ( ON-TABLE ?auto_59629 ) ( ON ?auto_59630 ?auto_59629 ) ( not ( = ?auto_59629 ?auto_59630 ) ) ( not ( = ?auto_59629 ?auto_59634 ) ) ( not ( = ?auto_59630 ?auto_59634 ) ) ( not ( = ?auto_59629 ?auto_59633 ) ) ( not ( = ?auto_59629 ?auto_59632 ) ) ( not ( = ?auto_59630 ?auto_59633 ) ) ( not ( = ?auto_59630 ?auto_59632 ) ) ( not ( = ?auto_59634 ?auto_59633 ) ) ( not ( = ?auto_59634 ?auto_59632 ) ) ( not ( = ?auto_59633 ?auto_59632 ) ) ( ON ?auto_59633 ?auto_59634 ) ( ON-TABLE ?auto_59635 ) ( not ( = ?auto_59635 ?auto_59631 ) ) ( not ( = ?auto_59635 ?auto_59632 ) ) ( not ( = ?auto_59631 ?auto_59632 ) ) ( not ( = ?auto_59629 ?auto_59631 ) ) ( not ( = ?auto_59629 ?auto_59635 ) ) ( not ( = ?auto_59630 ?auto_59631 ) ) ( not ( = ?auto_59630 ?auto_59635 ) ) ( not ( = ?auto_59634 ?auto_59631 ) ) ( not ( = ?auto_59634 ?auto_59635 ) ) ( not ( = ?auto_59633 ?auto_59631 ) ) ( not ( = ?auto_59633 ?auto_59635 ) ) ( ON ?auto_59632 ?auto_59633 ) ( CLEAR ?auto_59632 ) ( HOLDING ?auto_59631 ) ( CLEAR ?auto_59635 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59635 ?auto_59631 )
      ( MAKE-2PILE ?auto_59629 ?auto_59630 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59636 - BLOCK
      ?auto_59637 - BLOCK
    )
    :vars
    (
      ?auto_59638 - BLOCK
      ?auto_59640 - BLOCK
      ?auto_59641 - BLOCK
      ?auto_59642 - BLOCK
      ?auto_59639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59638 ?auto_59637 ) ( ON-TABLE ?auto_59636 ) ( ON ?auto_59637 ?auto_59636 ) ( not ( = ?auto_59636 ?auto_59637 ) ) ( not ( = ?auto_59636 ?auto_59638 ) ) ( not ( = ?auto_59637 ?auto_59638 ) ) ( not ( = ?auto_59636 ?auto_59640 ) ) ( not ( = ?auto_59636 ?auto_59641 ) ) ( not ( = ?auto_59637 ?auto_59640 ) ) ( not ( = ?auto_59637 ?auto_59641 ) ) ( not ( = ?auto_59638 ?auto_59640 ) ) ( not ( = ?auto_59638 ?auto_59641 ) ) ( not ( = ?auto_59640 ?auto_59641 ) ) ( ON ?auto_59640 ?auto_59638 ) ( ON-TABLE ?auto_59642 ) ( not ( = ?auto_59642 ?auto_59639 ) ) ( not ( = ?auto_59642 ?auto_59641 ) ) ( not ( = ?auto_59639 ?auto_59641 ) ) ( not ( = ?auto_59636 ?auto_59639 ) ) ( not ( = ?auto_59636 ?auto_59642 ) ) ( not ( = ?auto_59637 ?auto_59639 ) ) ( not ( = ?auto_59637 ?auto_59642 ) ) ( not ( = ?auto_59638 ?auto_59639 ) ) ( not ( = ?auto_59638 ?auto_59642 ) ) ( not ( = ?auto_59640 ?auto_59639 ) ) ( not ( = ?auto_59640 ?auto_59642 ) ) ( ON ?auto_59641 ?auto_59640 ) ( CLEAR ?auto_59642 ) ( ON ?auto_59639 ?auto_59641 ) ( CLEAR ?auto_59639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59636 ?auto_59637 ?auto_59638 ?auto_59640 ?auto_59641 )
      ( MAKE-2PILE ?auto_59636 ?auto_59637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59643 - BLOCK
      ?auto_59644 - BLOCK
    )
    :vars
    (
      ?auto_59647 - BLOCK
      ?auto_59648 - BLOCK
      ?auto_59646 - BLOCK
      ?auto_59645 - BLOCK
      ?auto_59649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59647 ?auto_59644 ) ( ON-TABLE ?auto_59643 ) ( ON ?auto_59644 ?auto_59643 ) ( not ( = ?auto_59643 ?auto_59644 ) ) ( not ( = ?auto_59643 ?auto_59647 ) ) ( not ( = ?auto_59644 ?auto_59647 ) ) ( not ( = ?auto_59643 ?auto_59648 ) ) ( not ( = ?auto_59643 ?auto_59646 ) ) ( not ( = ?auto_59644 ?auto_59648 ) ) ( not ( = ?auto_59644 ?auto_59646 ) ) ( not ( = ?auto_59647 ?auto_59648 ) ) ( not ( = ?auto_59647 ?auto_59646 ) ) ( not ( = ?auto_59648 ?auto_59646 ) ) ( ON ?auto_59648 ?auto_59647 ) ( not ( = ?auto_59645 ?auto_59649 ) ) ( not ( = ?auto_59645 ?auto_59646 ) ) ( not ( = ?auto_59649 ?auto_59646 ) ) ( not ( = ?auto_59643 ?auto_59649 ) ) ( not ( = ?auto_59643 ?auto_59645 ) ) ( not ( = ?auto_59644 ?auto_59649 ) ) ( not ( = ?auto_59644 ?auto_59645 ) ) ( not ( = ?auto_59647 ?auto_59649 ) ) ( not ( = ?auto_59647 ?auto_59645 ) ) ( not ( = ?auto_59648 ?auto_59649 ) ) ( not ( = ?auto_59648 ?auto_59645 ) ) ( ON ?auto_59646 ?auto_59648 ) ( ON ?auto_59649 ?auto_59646 ) ( CLEAR ?auto_59649 ) ( HOLDING ?auto_59645 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59645 )
      ( MAKE-2PILE ?auto_59643 ?auto_59644 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59650 - BLOCK
      ?auto_59651 - BLOCK
    )
    :vars
    (
      ?auto_59652 - BLOCK
      ?auto_59653 - BLOCK
      ?auto_59656 - BLOCK
      ?auto_59655 - BLOCK
      ?auto_59654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59652 ?auto_59651 ) ( ON-TABLE ?auto_59650 ) ( ON ?auto_59651 ?auto_59650 ) ( not ( = ?auto_59650 ?auto_59651 ) ) ( not ( = ?auto_59650 ?auto_59652 ) ) ( not ( = ?auto_59651 ?auto_59652 ) ) ( not ( = ?auto_59650 ?auto_59653 ) ) ( not ( = ?auto_59650 ?auto_59656 ) ) ( not ( = ?auto_59651 ?auto_59653 ) ) ( not ( = ?auto_59651 ?auto_59656 ) ) ( not ( = ?auto_59652 ?auto_59653 ) ) ( not ( = ?auto_59652 ?auto_59656 ) ) ( not ( = ?auto_59653 ?auto_59656 ) ) ( ON ?auto_59653 ?auto_59652 ) ( not ( = ?auto_59655 ?auto_59654 ) ) ( not ( = ?auto_59655 ?auto_59656 ) ) ( not ( = ?auto_59654 ?auto_59656 ) ) ( not ( = ?auto_59650 ?auto_59654 ) ) ( not ( = ?auto_59650 ?auto_59655 ) ) ( not ( = ?auto_59651 ?auto_59654 ) ) ( not ( = ?auto_59651 ?auto_59655 ) ) ( not ( = ?auto_59652 ?auto_59654 ) ) ( not ( = ?auto_59652 ?auto_59655 ) ) ( not ( = ?auto_59653 ?auto_59654 ) ) ( not ( = ?auto_59653 ?auto_59655 ) ) ( ON ?auto_59656 ?auto_59653 ) ( ON ?auto_59654 ?auto_59656 ) ( ON ?auto_59655 ?auto_59654 ) ( CLEAR ?auto_59655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59650 ?auto_59651 ?auto_59652 ?auto_59653 ?auto_59656 ?auto_59654 )
      ( MAKE-2PILE ?auto_59650 ?auto_59651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59662 - BLOCK
      ?auto_59663 - BLOCK
      ?auto_59664 - BLOCK
      ?auto_59665 - BLOCK
      ?auto_59666 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_59666 ) ( CLEAR ?auto_59665 ) ( ON-TABLE ?auto_59662 ) ( ON ?auto_59663 ?auto_59662 ) ( ON ?auto_59664 ?auto_59663 ) ( ON ?auto_59665 ?auto_59664 ) ( not ( = ?auto_59662 ?auto_59663 ) ) ( not ( = ?auto_59662 ?auto_59664 ) ) ( not ( = ?auto_59662 ?auto_59665 ) ) ( not ( = ?auto_59662 ?auto_59666 ) ) ( not ( = ?auto_59663 ?auto_59664 ) ) ( not ( = ?auto_59663 ?auto_59665 ) ) ( not ( = ?auto_59663 ?auto_59666 ) ) ( not ( = ?auto_59664 ?auto_59665 ) ) ( not ( = ?auto_59664 ?auto_59666 ) ) ( not ( = ?auto_59665 ?auto_59666 ) ) )
    :subtasks
    ( ( !STACK ?auto_59666 ?auto_59665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59667 - BLOCK
      ?auto_59668 - BLOCK
      ?auto_59669 - BLOCK
      ?auto_59670 - BLOCK
      ?auto_59671 - BLOCK
    )
    :vars
    (
      ?auto_59672 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59670 ) ( ON-TABLE ?auto_59667 ) ( ON ?auto_59668 ?auto_59667 ) ( ON ?auto_59669 ?auto_59668 ) ( ON ?auto_59670 ?auto_59669 ) ( not ( = ?auto_59667 ?auto_59668 ) ) ( not ( = ?auto_59667 ?auto_59669 ) ) ( not ( = ?auto_59667 ?auto_59670 ) ) ( not ( = ?auto_59667 ?auto_59671 ) ) ( not ( = ?auto_59668 ?auto_59669 ) ) ( not ( = ?auto_59668 ?auto_59670 ) ) ( not ( = ?auto_59668 ?auto_59671 ) ) ( not ( = ?auto_59669 ?auto_59670 ) ) ( not ( = ?auto_59669 ?auto_59671 ) ) ( not ( = ?auto_59670 ?auto_59671 ) ) ( ON ?auto_59671 ?auto_59672 ) ( CLEAR ?auto_59671 ) ( HAND-EMPTY ) ( not ( = ?auto_59667 ?auto_59672 ) ) ( not ( = ?auto_59668 ?auto_59672 ) ) ( not ( = ?auto_59669 ?auto_59672 ) ) ( not ( = ?auto_59670 ?auto_59672 ) ) ( not ( = ?auto_59671 ?auto_59672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59671 ?auto_59672 )
      ( MAKE-5PILE ?auto_59667 ?auto_59668 ?auto_59669 ?auto_59670 ?auto_59671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59673 - BLOCK
      ?auto_59674 - BLOCK
      ?auto_59675 - BLOCK
      ?auto_59676 - BLOCK
      ?auto_59677 - BLOCK
    )
    :vars
    (
      ?auto_59678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59673 ) ( ON ?auto_59674 ?auto_59673 ) ( ON ?auto_59675 ?auto_59674 ) ( not ( = ?auto_59673 ?auto_59674 ) ) ( not ( = ?auto_59673 ?auto_59675 ) ) ( not ( = ?auto_59673 ?auto_59676 ) ) ( not ( = ?auto_59673 ?auto_59677 ) ) ( not ( = ?auto_59674 ?auto_59675 ) ) ( not ( = ?auto_59674 ?auto_59676 ) ) ( not ( = ?auto_59674 ?auto_59677 ) ) ( not ( = ?auto_59675 ?auto_59676 ) ) ( not ( = ?auto_59675 ?auto_59677 ) ) ( not ( = ?auto_59676 ?auto_59677 ) ) ( ON ?auto_59677 ?auto_59678 ) ( CLEAR ?auto_59677 ) ( not ( = ?auto_59673 ?auto_59678 ) ) ( not ( = ?auto_59674 ?auto_59678 ) ) ( not ( = ?auto_59675 ?auto_59678 ) ) ( not ( = ?auto_59676 ?auto_59678 ) ) ( not ( = ?auto_59677 ?auto_59678 ) ) ( HOLDING ?auto_59676 ) ( CLEAR ?auto_59675 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59673 ?auto_59674 ?auto_59675 ?auto_59676 )
      ( MAKE-5PILE ?auto_59673 ?auto_59674 ?auto_59675 ?auto_59676 ?auto_59677 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59679 - BLOCK
      ?auto_59680 - BLOCK
      ?auto_59681 - BLOCK
      ?auto_59682 - BLOCK
      ?auto_59683 - BLOCK
    )
    :vars
    (
      ?auto_59684 - BLOCK
      ?auto_59685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59679 ) ( ON ?auto_59680 ?auto_59679 ) ( ON ?auto_59681 ?auto_59680 ) ( not ( = ?auto_59679 ?auto_59680 ) ) ( not ( = ?auto_59679 ?auto_59681 ) ) ( not ( = ?auto_59679 ?auto_59682 ) ) ( not ( = ?auto_59679 ?auto_59683 ) ) ( not ( = ?auto_59680 ?auto_59681 ) ) ( not ( = ?auto_59680 ?auto_59682 ) ) ( not ( = ?auto_59680 ?auto_59683 ) ) ( not ( = ?auto_59681 ?auto_59682 ) ) ( not ( = ?auto_59681 ?auto_59683 ) ) ( not ( = ?auto_59682 ?auto_59683 ) ) ( ON ?auto_59683 ?auto_59684 ) ( not ( = ?auto_59679 ?auto_59684 ) ) ( not ( = ?auto_59680 ?auto_59684 ) ) ( not ( = ?auto_59681 ?auto_59684 ) ) ( not ( = ?auto_59682 ?auto_59684 ) ) ( not ( = ?auto_59683 ?auto_59684 ) ) ( CLEAR ?auto_59681 ) ( ON ?auto_59682 ?auto_59683 ) ( CLEAR ?auto_59682 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59685 ) ( ON ?auto_59684 ?auto_59685 ) ( not ( = ?auto_59685 ?auto_59684 ) ) ( not ( = ?auto_59685 ?auto_59683 ) ) ( not ( = ?auto_59685 ?auto_59682 ) ) ( not ( = ?auto_59679 ?auto_59685 ) ) ( not ( = ?auto_59680 ?auto_59685 ) ) ( not ( = ?auto_59681 ?auto_59685 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59685 ?auto_59684 ?auto_59683 )
      ( MAKE-5PILE ?auto_59679 ?auto_59680 ?auto_59681 ?auto_59682 ?auto_59683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59686 - BLOCK
      ?auto_59687 - BLOCK
      ?auto_59688 - BLOCK
      ?auto_59689 - BLOCK
      ?auto_59690 - BLOCK
    )
    :vars
    (
      ?auto_59692 - BLOCK
      ?auto_59691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59686 ) ( ON ?auto_59687 ?auto_59686 ) ( not ( = ?auto_59686 ?auto_59687 ) ) ( not ( = ?auto_59686 ?auto_59688 ) ) ( not ( = ?auto_59686 ?auto_59689 ) ) ( not ( = ?auto_59686 ?auto_59690 ) ) ( not ( = ?auto_59687 ?auto_59688 ) ) ( not ( = ?auto_59687 ?auto_59689 ) ) ( not ( = ?auto_59687 ?auto_59690 ) ) ( not ( = ?auto_59688 ?auto_59689 ) ) ( not ( = ?auto_59688 ?auto_59690 ) ) ( not ( = ?auto_59689 ?auto_59690 ) ) ( ON ?auto_59690 ?auto_59692 ) ( not ( = ?auto_59686 ?auto_59692 ) ) ( not ( = ?auto_59687 ?auto_59692 ) ) ( not ( = ?auto_59688 ?auto_59692 ) ) ( not ( = ?auto_59689 ?auto_59692 ) ) ( not ( = ?auto_59690 ?auto_59692 ) ) ( ON ?auto_59689 ?auto_59690 ) ( CLEAR ?auto_59689 ) ( ON-TABLE ?auto_59691 ) ( ON ?auto_59692 ?auto_59691 ) ( not ( = ?auto_59691 ?auto_59692 ) ) ( not ( = ?auto_59691 ?auto_59690 ) ) ( not ( = ?auto_59691 ?auto_59689 ) ) ( not ( = ?auto_59686 ?auto_59691 ) ) ( not ( = ?auto_59687 ?auto_59691 ) ) ( not ( = ?auto_59688 ?auto_59691 ) ) ( HOLDING ?auto_59688 ) ( CLEAR ?auto_59687 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59686 ?auto_59687 ?auto_59688 )
      ( MAKE-5PILE ?auto_59686 ?auto_59687 ?auto_59688 ?auto_59689 ?auto_59690 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59693 - BLOCK
      ?auto_59694 - BLOCK
      ?auto_59695 - BLOCK
      ?auto_59696 - BLOCK
      ?auto_59697 - BLOCK
    )
    :vars
    (
      ?auto_59698 - BLOCK
      ?auto_59699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59693 ) ( ON ?auto_59694 ?auto_59693 ) ( not ( = ?auto_59693 ?auto_59694 ) ) ( not ( = ?auto_59693 ?auto_59695 ) ) ( not ( = ?auto_59693 ?auto_59696 ) ) ( not ( = ?auto_59693 ?auto_59697 ) ) ( not ( = ?auto_59694 ?auto_59695 ) ) ( not ( = ?auto_59694 ?auto_59696 ) ) ( not ( = ?auto_59694 ?auto_59697 ) ) ( not ( = ?auto_59695 ?auto_59696 ) ) ( not ( = ?auto_59695 ?auto_59697 ) ) ( not ( = ?auto_59696 ?auto_59697 ) ) ( ON ?auto_59697 ?auto_59698 ) ( not ( = ?auto_59693 ?auto_59698 ) ) ( not ( = ?auto_59694 ?auto_59698 ) ) ( not ( = ?auto_59695 ?auto_59698 ) ) ( not ( = ?auto_59696 ?auto_59698 ) ) ( not ( = ?auto_59697 ?auto_59698 ) ) ( ON ?auto_59696 ?auto_59697 ) ( ON-TABLE ?auto_59699 ) ( ON ?auto_59698 ?auto_59699 ) ( not ( = ?auto_59699 ?auto_59698 ) ) ( not ( = ?auto_59699 ?auto_59697 ) ) ( not ( = ?auto_59699 ?auto_59696 ) ) ( not ( = ?auto_59693 ?auto_59699 ) ) ( not ( = ?auto_59694 ?auto_59699 ) ) ( not ( = ?auto_59695 ?auto_59699 ) ) ( CLEAR ?auto_59694 ) ( ON ?auto_59695 ?auto_59696 ) ( CLEAR ?auto_59695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59699 ?auto_59698 ?auto_59697 ?auto_59696 )
      ( MAKE-5PILE ?auto_59693 ?auto_59694 ?auto_59695 ?auto_59696 ?auto_59697 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59700 - BLOCK
      ?auto_59701 - BLOCK
      ?auto_59702 - BLOCK
      ?auto_59703 - BLOCK
      ?auto_59704 - BLOCK
    )
    :vars
    (
      ?auto_59706 - BLOCK
      ?auto_59705 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59700 ) ( not ( = ?auto_59700 ?auto_59701 ) ) ( not ( = ?auto_59700 ?auto_59702 ) ) ( not ( = ?auto_59700 ?auto_59703 ) ) ( not ( = ?auto_59700 ?auto_59704 ) ) ( not ( = ?auto_59701 ?auto_59702 ) ) ( not ( = ?auto_59701 ?auto_59703 ) ) ( not ( = ?auto_59701 ?auto_59704 ) ) ( not ( = ?auto_59702 ?auto_59703 ) ) ( not ( = ?auto_59702 ?auto_59704 ) ) ( not ( = ?auto_59703 ?auto_59704 ) ) ( ON ?auto_59704 ?auto_59706 ) ( not ( = ?auto_59700 ?auto_59706 ) ) ( not ( = ?auto_59701 ?auto_59706 ) ) ( not ( = ?auto_59702 ?auto_59706 ) ) ( not ( = ?auto_59703 ?auto_59706 ) ) ( not ( = ?auto_59704 ?auto_59706 ) ) ( ON ?auto_59703 ?auto_59704 ) ( ON-TABLE ?auto_59705 ) ( ON ?auto_59706 ?auto_59705 ) ( not ( = ?auto_59705 ?auto_59706 ) ) ( not ( = ?auto_59705 ?auto_59704 ) ) ( not ( = ?auto_59705 ?auto_59703 ) ) ( not ( = ?auto_59700 ?auto_59705 ) ) ( not ( = ?auto_59701 ?auto_59705 ) ) ( not ( = ?auto_59702 ?auto_59705 ) ) ( ON ?auto_59702 ?auto_59703 ) ( CLEAR ?auto_59702 ) ( HOLDING ?auto_59701 ) ( CLEAR ?auto_59700 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59700 ?auto_59701 )
      ( MAKE-5PILE ?auto_59700 ?auto_59701 ?auto_59702 ?auto_59703 ?auto_59704 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59707 - BLOCK
      ?auto_59708 - BLOCK
      ?auto_59709 - BLOCK
      ?auto_59710 - BLOCK
      ?auto_59711 - BLOCK
    )
    :vars
    (
      ?auto_59713 - BLOCK
      ?auto_59712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59707 ) ( not ( = ?auto_59707 ?auto_59708 ) ) ( not ( = ?auto_59707 ?auto_59709 ) ) ( not ( = ?auto_59707 ?auto_59710 ) ) ( not ( = ?auto_59707 ?auto_59711 ) ) ( not ( = ?auto_59708 ?auto_59709 ) ) ( not ( = ?auto_59708 ?auto_59710 ) ) ( not ( = ?auto_59708 ?auto_59711 ) ) ( not ( = ?auto_59709 ?auto_59710 ) ) ( not ( = ?auto_59709 ?auto_59711 ) ) ( not ( = ?auto_59710 ?auto_59711 ) ) ( ON ?auto_59711 ?auto_59713 ) ( not ( = ?auto_59707 ?auto_59713 ) ) ( not ( = ?auto_59708 ?auto_59713 ) ) ( not ( = ?auto_59709 ?auto_59713 ) ) ( not ( = ?auto_59710 ?auto_59713 ) ) ( not ( = ?auto_59711 ?auto_59713 ) ) ( ON ?auto_59710 ?auto_59711 ) ( ON-TABLE ?auto_59712 ) ( ON ?auto_59713 ?auto_59712 ) ( not ( = ?auto_59712 ?auto_59713 ) ) ( not ( = ?auto_59712 ?auto_59711 ) ) ( not ( = ?auto_59712 ?auto_59710 ) ) ( not ( = ?auto_59707 ?auto_59712 ) ) ( not ( = ?auto_59708 ?auto_59712 ) ) ( not ( = ?auto_59709 ?auto_59712 ) ) ( ON ?auto_59709 ?auto_59710 ) ( CLEAR ?auto_59707 ) ( ON ?auto_59708 ?auto_59709 ) ( CLEAR ?auto_59708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59712 ?auto_59713 ?auto_59711 ?auto_59710 ?auto_59709 )
      ( MAKE-5PILE ?auto_59707 ?auto_59708 ?auto_59709 ?auto_59710 ?auto_59711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59714 - BLOCK
      ?auto_59715 - BLOCK
      ?auto_59716 - BLOCK
      ?auto_59717 - BLOCK
      ?auto_59718 - BLOCK
    )
    :vars
    (
      ?auto_59719 - BLOCK
      ?auto_59720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59714 ?auto_59715 ) ) ( not ( = ?auto_59714 ?auto_59716 ) ) ( not ( = ?auto_59714 ?auto_59717 ) ) ( not ( = ?auto_59714 ?auto_59718 ) ) ( not ( = ?auto_59715 ?auto_59716 ) ) ( not ( = ?auto_59715 ?auto_59717 ) ) ( not ( = ?auto_59715 ?auto_59718 ) ) ( not ( = ?auto_59716 ?auto_59717 ) ) ( not ( = ?auto_59716 ?auto_59718 ) ) ( not ( = ?auto_59717 ?auto_59718 ) ) ( ON ?auto_59718 ?auto_59719 ) ( not ( = ?auto_59714 ?auto_59719 ) ) ( not ( = ?auto_59715 ?auto_59719 ) ) ( not ( = ?auto_59716 ?auto_59719 ) ) ( not ( = ?auto_59717 ?auto_59719 ) ) ( not ( = ?auto_59718 ?auto_59719 ) ) ( ON ?auto_59717 ?auto_59718 ) ( ON-TABLE ?auto_59720 ) ( ON ?auto_59719 ?auto_59720 ) ( not ( = ?auto_59720 ?auto_59719 ) ) ( not ( = ?auto_59720 ?auto_59718 ) ) ( not ( = ?auto_59720 ?auto_59717 ) ) ( not ( = ?auto_59714 ?auto_59720 ) ) ( not ( = ?auto_59715 ?auto_59720 ) ) ( not ( = ?auto_59716 ?auto_59720 ) ) ( ON ?auto_59716 ?auto_59717 ) ( ON ?auto_59715 ?auto_59716 ) ( CLEAR ?auto_59715 ) ( HOLDING ?auto_59714 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59714 )
      ( MAKE-5PILE ?auto_59714 ?auto_59715 ?auto_59716 ?auto_59717 ?auto_59718 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59721 - BLOCK
      ?auto_59722 - BLOCK
      ?auto_59723 - BLOCK
      ?auto_59724 - BLOCK
      ?auto_59725 - BLOCK
    )
    :vars
    (
      ?auto_59727 - BLOCK
      ?auto_59726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59721 ?auto_59722 ) ) ( not ( = ?auto_59721 ?auto_59723 ) ) ( not ( = ?auto_59721 ?auto_59724 ) ) ( not ( = ?auto_59721 ?auto_59725 ) ) ( not ( = ?auto_59722 ?auto_59723 ) ) ( not ( = ?auto_59722 ?auto_59724 ) ) ( not ( = ?auto_59722 ?auto_59725 ) ) ( not ( = ?auto_59723 ?auto_59724 ) ) ( not ( = ?auto_59723 ?auto_59725 ) ) ( not ( = ?auto_59724 ?auto_59725 ) ) ( ON ?auto_59725 ?auto_59727 ) ( not ( = ?auto_59721 ?auto_59727 ) ) ( not ( = ?auto_59722 ?auto_59727 ) ) ( not ( = ?auto_59723 ?auto_59727 ) ) ( not ( = ?auto_59724 ?auto_59727 ) ) ( not ( = ?auto_59725 ?auto_59727 ) ) ( ON ?auto_59724 ?auto_59725 ) ( ON-TABLE ?auto_59726 ) ( ON ?auto_59727 ?auto_59726 ) ( not ( = ?auto_59726 ?auto_59727 ) ) ( not ( = ?auto_59726 ?auto_59725 ) ) ( not ( = ?auto_59726 ?auto_59724 ) ) ( not ( = ?auto_59721 ?auto_59726 ) ) ( not ( = ?auto_59722 ?auto_59726 ) ) ( not ( = ?auto_59723 ?auto_59726 ) ) ( ON ?auto_59723 ?auto_59724 ) ( ON ?auto_59722 ?auto_59723 ) ( ON ?auto_59721 ?auto_59722 ) ( CLEAR ?auto_59721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59726 ?auto_59727 ?auto_59725 ?auto_59724 ?auto_59723 ?auto_59722 )
      ( MAKE-5PILE ?auto_59721 ?auto_59722 ?auto_59723 ?auto_59724 ?auto_59725 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59729 - BLOCK
    )
    :vars
    (
      ?auto_59730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59730 ?auto_59729 ) ( CLEAR ?auto_59730 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59729 ) ( not ( = ?auto_59729 ?auto_59730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59730 ?auto_59729 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59731 - BLOCK
    )
    :vars
    (
      ?auto_59732 - BLOCK
      ?auto_59733 - BLOCK
      ?auto_59734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59732 ?auto_59731 ) ( CLEAR ?auto_59732 ) ( ON-TABLE ?auto_59731 ) ( not ( = ?auto_59731 ?auto_59732 ) ) ( HOLDING ?auto_59733 ) ( CLEAR ?auto_59734 ) ( not ( = ?auto_59731 ?auto_59733 ) ) ( not ( = ?auto_59731 ?auto_59734 ) ) ( not ( = ?auto_59732 ?auto_59733 ) ) ( not ( = ?auto_59732 ?auto_59734 ) ) ( not ( = ?auto_59733 ?auto_59734 ) ) )
    :subtasks
    ( ( !STACK ?auto_59733 ?auto_59734 )
      ( MAKE-1PILE ?auto_59731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59735 - BLOCK
    )
    :vars
    (
      ?auto_59736 - BLOCK
      ?auto_59737 - BLOCK
      ?auto_59738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59736 ?auto_59735 ) ( ON-TABLE ?auto_59735 ) ( not ( = ?auto_59735 ?auto_59736 ) ) ( CLEAR ?auto_59737 ) ( not ( = ?auto_59735 ?auto_59738 ) ) ( not ( = ?auto_59735 ?auto_59737 ) ) ( not ( = ?auto_59736 ?auto_59738 ) ) ( not ( = ?auto_59736 ?auto_59737 ) ) ( not ( = ?auto_59738 ?auto_59737 ) ) ( ON ?auto_59738 ?auto_59736 ) ( CLEAR ?auto_59738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59735 ?auto_59736 )
      ( MAKE-1PILE ?auto_59735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59739 - BLOCK
    )
    :vars
    (
      ?auto_59742 - BLOCK
      ?auto_59741 - BLOCK
      ?auto_59740 - BLOCK
      ?auto_59743 - BLOCK
      ?auto_59744 - BLOCK
      ?auto_59745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59742 ?auto_59739 ) ( ON-TABLE ?auto_59739 ) ( not ( = ?auto_59739 ?auto_59742 ) ) ( not ( = ?auto_59739 ?auto_59741 ) ) ( not ( = ?auto_59739 ?auto_59740 ) ) ( not ( = ?auto_59742 ?auto_59741 ) ) ( not ( = ?auto_59742 ?auto_59740 ) ) ( not ( = ?auto_59741 ?auto_59740 ) ) ( ON ?auto_59741 ?auto_59742 ) ( CLEAR ?auto_59741 ) ( HOLDING ?auto_59740 ) ( CLEAR ?auto_59743 ) ( ON-TABLE ?auto_59744 ) ( ON ?auto_59745 ?auto_59744 ) ( ON ?auto_59743 ?auto_59745 ) ( not ( = ?auto_59744 ?auto_59745 ) ) ( not ( = ?auto_59744 ?auto_59743 ) ) ( not ( = ?auto_59744 ?auto_59740 ) ) ( not ( = ?auto_59745 ?auto_59743 ) ) ( not ( = ?auto_59745 ?auto_59740 ) ) ( not ( = ?auto_59743 ?auto_59740 ) ) ( not ( = ?auto_59739 ?auto_59743 ) ) ( not ( = ?auto_59739 ?auto_59744 ) ) ( not ( = ?auto_59739 ?auto_59745 ) ) ( not ( = ?auto_59742 ?auto_59743 ) ) ( not ( = ?auto_59742 ?auto_59744 ) ) ( not ( = ?auto_59742 ?auto_59745 ) ) ( not ( = ?auto_59741 ?auto_59743 ) ) ( not ( = ?auto_59741 ?auto_59744 ) ) ( not ( = ?auto_59741 ?auto_59745 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59744 ?auto_59745 ?auto_59743 ?auto_59740 )
      ( MAKE-1PILE ?auto_59739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59746 - BLOCK
    )
    :vars
    (
      ?auto_59752 - BLOCK
      ?auto_59751 - BLOCK
      ?auto_59747 - BLOCK
      ?auto_59748 - BLOCK
      ?auto_59750 - BLOCK
      ?auto_59749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59752 ?auto_59746 ) ( ON-TABLE ?auto_59746 ) ( not ( = ?auto_59746 ?auto_59752 ) ) ( not ( = ?auto_59746 ?auto_59751 ) ) ( not ( = ?auto_59746 ?auto_59747 ) ) ( not ( = ?auto_59752 ?auto_59751 ) ) ( not ( = ?auto_59752 ?auto_59747 ) ) ( not ( = ?auto_59751 ?auto_59747 ) ) ( ON ?auto_59751 ?auto_59752 ) ( CLEAR ?auto_59748 ) ( ON-TABLE ?auto_59750 ) ( ON ?auto_59749 ?auto_59750 ) ( ON ?auto_59748 ?auto_59749 ) ( not ( = ?auto_59750 ?auto_59749 ) ) ( not ( = ?auto_59750 ?auto_59748 ) ) ( not ( = ?auto_59750 ?auto_59747 ) ) ( not ( = ?auto_59749 ?auto_59748 ) ) ( not ( = ?auto_59749 ?auto_59747 ) ) ( not ( = ?auto_59748 ?auto_59747 ) ) ( not ( = ?auto_59746 ?auto_59748 ) ) ( not ( = ?auto_59746 ?auto_59750 ) ) ( not ( = ?auto_59746 ?auto_59749 ) ) ( not ( = ?auto_59752 ?auto_59748 ) ) ( not ( = ?auto_59752 ?auto_59750 ) ) ( not ( = ?auto_59752 ?auto_59749 ) ) ( not ( = ?auto_59751 ?auto_59748 ) ) ( not ( = ?auto_59751 ?auto_59750 ) ) ( not ( = ?auto_59751 ?auto_59749 ) ) ( ON ?auto_59747 ?auto_59751 ) ( CLEAR ?auto_59747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59746 ?auto_59752 ?auto_59751 )
      ( MAKE-1PILE ?auto_59746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59753 - BLOCK
    )
    :vars
    (
      ?auto_59756 - BLOCK
      ?auto_59754 - BLOCK
      ?auto_59755 - BLOCK
      ?auto_59757 - BLOCK
      ?auto_59759 - BLOCK
      ?auto_59758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59756 ?auto_59753 ) ( ON-TABLE ?auto_59753 ) ( not ( = ?auto_59753 ?auto_59756 ) ) ( not ( = ?auto_59753 ?auto_59754 ) ) ( not ( = ?auto_59753 ?auto_59755 ) ) ( not ( = ?auto_59756 ?auto_59754 ) ) ( not ( = ?auto_59756 ?auto_59755 ) ) ( not ( = ?auto_59754 ?auto_59755 ) ) ( ON ?auto_59754 ?auto_59756 ) ( ON-TABLE ?auto_59757 ) ( ON ?auto_59759 ?auto_59757 ) ( not ( = ?auto_59757 ?auto_59759 ) ) ( not ( = ?auto_59757 ?auto_59758 ) ) ( not ( = ?auto_59757 ?auto_59755 ) ) ( not ( = ?auto_59759 ?auto_59758 ) ) ( not ( = ?auto_59759 ?auto_59755 ) ) ( not ( = ?auto_59758 ?auto_59755 ) ) ( not ( = ?auto_59753 ?auto_59758 ) ) ( not ( = ?auto_59753 ?auto_59757 ) ) ( not ( = ?auto_59753 ?auto_59759 ) ) ( not ( = ?auto_59756 ?auto_59758 ) ) ( not ( = ?auto_59756 ?auto_59757 ) ) ( not ( = ?auto_59756 ?auto_59759 ) ) ( not ( = ?auto_59754 ?auto_59758 ) ) ( not ( = ?auto_59754 ?auto_59757 ) ) ( not ( = ?auto_59754 ?auto_59759 ) ) ( ON ?auto_59755 ?auto_59754 ) ( CLEAR ?auto_59755 ) ( HOLDING ?auto_59758 ) ( CLEAR ?auto_59759 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59757 ?auto_59759 ?auto_59758 )
      ( MAKE-1PILE ?auto_59753 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59760 - BLOCK
    )
    :vars
    (
      ?auto_59764 - BLOCK
      ?auto_59766 - BLOCK
      ?auto_59763 - BLOCK
      ?auto_59761 - BLOCK
      ?auto_59765 - BLOCK
      ?auto_59762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59764 ?auto_59760 ) ( ON-TABLE ?auto_59760 ) ( not ( = ?auto_59760 ?auto_59764 ) ) ( not ( = ?auto_59760 ?auto_59766 ) ) ( not ( = ?auto_59760 ?auto_59763 ) ) ( not ( = ?auto_59764 ?auto_59766 ) ) ( not ( = ?auto_59764 ?auto_59763 ) ) ( not ( = ?auto_59766 ?auto_59763 ) ) ( ON ?auto_59766 ?auto_59764 ) ( ON-TABLE ?auto_59761 ) ( ON ?auto_59765 ?auto_59761 ) ( not ( = ?auto_59761 ?auto_59765 ) ) ( not ( = ?auto_59761 ?auto_59762 ) ) ( not ( = ?auto_59761 ?auto_59763 ) ) ( not ( = ?auto_59765 ?auto_59762 ) ) ( not ( = ?auto_59765 ?auto_59763 ) ) ( not ( = ?auto_59762 ?auto_59763 ) ) ( not ( = ?auto_59760 ?auto_59762 ) ) ( not ( = ?auto_59760 ?auto_59761 ) ) ( not ( = ?auto_59760 ?auto_59765 ) ) ( not ( = ?auto_59764 ?auto_59762 ) ) ( not ( = ?auto_59764 ?auto_59761 ) ) ( not ( = ?auto_59764 ?auto_59765 ) ) ( not ( = ?auto_59766 ?auto_59762 ) ) ( not ( = ?auto_59766 ?auto_59761 ) ) ( not ( = ?auto_59766 ?auto_59765 ) ) ( ON ?auto_59763 ?auto_59766 ) ( CLEAR ?auto_59765 ) ( ON ?auto_59762 ?auto_59763 ) ( CLEAR ?auto_59762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59760 ?auto_59764 ?auto_59766 ?auto_59763 )
      ( MAKE-1PILE ?auto_59760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59767 - BLOCK
    )
    :vars
    (
      ?auto_59773 - BLOCK
      ?auto_59769 - BLOCK
      ?auto_59768 - BLOCK
      ?auto_59771 - BLOCK
      ?auto_59770 - BLOCK
      ?auto_59772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59773 ?auto_59767 ) ( ON-TABLE ?auto_59767 ) ( not ( = ?auto_59767 ?auto_59773 ) ) ( not ( = ?auto_59767 ?auto_59769 ) ) ( not ( = ?auto_59767 ?auto_59768 ) ) ( not ( = ?auto_59773 ?auto_59769 ) ) ( not ( = ?auto_59773 ?auto_59768 ) ) ( not ( = ?auto_59769 ?auto_59768 ) ) ( ON ?auto_59769 ?auto_59773 ) ( ON-TABLE ?auto_59771 ) ( not ( = ?auto_59771 ?auto_59770 ) ) ( not ( = ?auto_59771 ?auto_59772 ) ) ( not ( = ?auto_59771 ?auto_59768 ) ) ( not ( = ?auto_59770 ?auto_59772 ) ) ( not ( = ?auto_59770 ?auto_59768 ) ) ( not ( = ?auto_59772 ?auto_59768 ) ) ( not ( = ?auto_59767 ?auto_59772 ) ) ( not ( = ?auto_59767 ?auto_59771 ) ) ( not ( = ?auto_59767 ?auto_59770 ) ) ( not ( = ?auto_59773 ?auto_59772 ) ) ( not ( = ?auto_59773 ?auto_59771 ) ) ( not ( = ?auto_59773 ?auto_59770 ) ) ( not ( = ?auto_59769 ?auto_59772 ) ) ( not ( = ?auto_59769 ?auto_59771 ) ) ( not ( = ?auto_59769 ?auto_59770 ) ) ( ON ?auto_59768 ?auto_59769 ) ( ON ?auto_59772 ?auto_59768 ) ( CLEAR ?auto_59772 ) ( HOLDING ?auto_59770 ) ( CLEAR ?auto_59771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59771 ?auto_59770 )
      ( MAKE-1PILE ?auto_59767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59774 - BLOCK
    )
    :vars
    (
      ?auto_59776 - BLOCK
      ?auto_59778 - BLOCK
      ?auto_59780 - BLOCK
      ?auto_59779 - BLOCK
      ?auto_59777 - BLOCK
      ?auto_59775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59776 ?auto_59774 ) ( ON-TABLE ?auto_59774 ) ( not ( = ?auto_59774 ?auto_59776 ) ) ( not ( = ?auto_59774 ?auto_59778 ) ) ( not ( = ?auto_59774 ?auto_59780 ) ) ( not ( = ?auto_59776 ?auto_59778 ) ) ( not ( = ?auto_59776 ?auto_59780 ) ) ( not ( = ?auto_59778 ?auto_59780 ) ) ( ON ?auto_59778 ?auto_59776 ) ( ON-TABLE ?auto_59779 ) ( not ( = ?auto_59779 ?auto_59777 ) ) ( not ( = ?auto_59779 ?auto_59775 ) ) ( not ( = ?auto_59779 ?auto_59780 ) ) ( not ( = ?auto_59777 ?auto_59775 ) ) ( not ( = ?auto_59777 ?auto_59780 ) ) ( not ( = ?auto_59775 ?auto_59780 ) ) ( not ( = ?auto_59774 ?auto_59775 ) ) ( not ( = ?auto_59774 ?auto_59779 ) ) ( not ( = ?auto_59774 ?auto_59777 ) ) ( not ( = ?auto_59776 ?auto_59775 ) ) ( not ( = ?auto_59776 ?auto_59779 ) ) ( not ( = ?auto_59776 ?auto_59777 ) ) ( not ( = ?auto_59778 ?auto_59775 ) ) ( not ( = ?auto_59778 ?auto_59779 ) ) ( not ( = ?auto_59778 ?auto_59777 ) ) ( ON ?auto_59780 ?auto_59778 ) ( ON ?auto_59775 ?auto_59780 ) ( CLEAR ?auto_59779 ) ( ON ?auto_59777 ?auto_59775 ) ( CLEAR ?auto_59777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59774 ?auto_59776 ?auto_59778 ?auto_59780 ?auto_59775 )
      ( MAKE-1PILE ?auto_59774 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59781 - BLOCK
    )
    :vars
    (
      ?auto_59784 - BLOCK
      ?auto_59785 - BLOCK
      ?auto_59786 - BLOCK
      ?auto_59783 - BLOCK
      ?auto_59787 - BLOCK
      ?auto_59782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59784 ?auto_59781 ) ( ON-TABLE ?auto_59781 ) ( not ( = ?auto_59781 ?auto_59784 ) ) ( not ( = ?auto_59781 ?auto_59785 ) ) ( not ( = ?auto_59781 ?auto_59786 ) ) ( not ( = ?auto_59784 ?auto_59785 ) ) ( not ( = ?auto_59784 ?auto_59786 ) ) ( not ( = ?auto_59785 ?auto_59786 ) ) ( ON ?auto_59785 ?auto_59784 ) ( not ( = ?auto_59783 ?auto_59787 ) ) ( not ( = ?auto_59783 ?auto_59782 ) ) ( not ( = ?auto_59783 ?auto_59786 ) ) ( not ( = ?auto_59787 ?auto_59782 ) ) ( not ( = ?auto_59787 ?auto_59786 ) ) ( not ( = ?auto_59782 ?auto_59786 ) ) ( not ( = ?auto_59781 ?auto_59782 ) ) ( not ( = ?auto_59781 ?auto_59783 ) ) ( not ( = ?auto_59781 ?auto_59787 ) ) ( not ( = ?auto_59784 ?auto_59782 ) ) ( not ( = ?auto_59784 ?auto_59783 ) ) ( not ( = ?auto_59784 ?auto_59787 ) ) ( not ( = ?auto_59785 ?auto_59782 ) ) ( not ( = ?auto_59785 ?auto_59783 ) ) ( not ( = ?auto_59785 ?auto_59787 ) ) ( ON ?auto_59786 ?auto_59785 ) ( ON ?auto_59782 ?auto_59786 ) ( ON ?auto_59787 ?auto_59782 ) ( CLEAR ?auto_59787 ) ( HOLDING ?auto_59783 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59783 )
      ( MAKE-1PILE ?auto_59781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59788 - BLOCK
    )
    :vars
    (
      ?auto_59789 - BLOCK
      ?auto_59794 - BLOCK
      ?auto_59791 - BLOCK
      ?auto_59792 - BLOCK
      ?auto_59793 - BLOCK
      ?auto_59790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59789 ?auto_59788 ) ( ON-TABLE ?auto_59788 ) ( not ( = ?auto_59788 ?auto_59789 ) ) ( not ( = ?auto_59788 ?auto_59794 ) ) ( not ( = ?auto_59788 ?auto_59791 ) ) ( not ( = ?auto_59789 ?auto_59794 ) ) ( not ( = ?auto_59789 ?auto_59791 ) ) ( not ( = ?auto_59794 ?auto_59791 ) ) ( ON ?auto_59794 ?auto_59789 ) ( not ( = ?auto_59792 ?auto_59793 ) ) ( not ( = ?auto_59792 ?auto_59790 ) ) ( not ( = ?auto_59792 ?auto_59791 ) ) ( not ( = ?auto_59793 ?auto_59790 ) ) ( not ( = ?auto_59793 ?auto_59791 ) ) ( not ( = ?auto_59790 ?auto_59791 ) ) ( not ( = ?auto_59788 ?auto_59790 ) ) ( not ( = ?auto_59788 ?auto_59792 ) ) ( not ( = ?auto_59788 ?auto_59793 ) ) ( not ( = ?auto_59789 ?auto_59790 ) ) ( not ( = ?auto_59789 ?auto_59792 ) ) ( not ( = ?auto_59789 ?auto_59793 ) ) ( not ( = ?auto_59794 ?auto_59790 ) ) ( not ( = ?auto_59794 ?auto_59792 ) ) ( not ( = ?auto_59794 ?auto_59793 ) ) ( ON ?auto_59791 ?auto_59794 ) ( ON ?auto_59790 ?auto_59791 ) ( ON ?auto_59793 ?auto_59790 ) ( ON ?auto_59792 ?auto_59793 ) ( CLEAR ?auto_59792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59788 ?auto_59789 ?auto_59794 ?auto_59791 ?auto_59790 ?auto_59793 )
      ( MAKE-1PILE ?auto_59788 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59801 - BLOCK
      ?auto_59802 - BLOCK
      ?auto_59803 - BLOCK
      ?auto_59804 - BLOCK
      ?auto_59805 - BLOCK
      ?auto_59806 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_59806 ) ( CLEAR ?auto_59805 ) ( ON-TABLE ?auto_59801 ) ( ON ?auto_59802 ?auto_59801 ) ( ON ?auto_59803 ?auto_59802 ) ( ON ?auto_59804 ?auto_59803 ) ( ON ?auto_59805 ?auto_59804 ) ( not ( = ?auto_59801 ?auto_59802 ) ) ( not ( = ?auto_59801 ?auto_59803 ) ) ( not ( = ?auto_59801 ?auto_59804 ) ) ( not ( = ?auto_59801 ?auto_59805 ) ) ( not ( = ?auto_59801 ?auto_59806 ) ) ( not ( = ?auto_59802 ?auto_59803 ) ) ( not ( = ?auto_59802 ?auto_59804 ) ) ( not ( = ?auto_59802 ?auto_59805 ) ) ( not ( = ?auto_59802 ?auto_59806 ) ) ( not ( = ?auto_59803 ?auto_59804 ) ) ( not ( = ?auto_59803 ?auto_59805 ) ) ( not ( = ?auto_59803 ?auto_59806 ) ) ( not ( = ?auto_59804 ?auto_59805 ) ) ( not ( = ?auto_59804 ?auto_59806 ) ) ( not ( = ?auto_59805 ?auto_59806 ) ) )
    :subtasks
    ( ( !STACK ?auto_59806 ?auto_59805 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59807 - BLOCK
      ?auto_59808 - BLOCK
      ?auto_59809 - BLOCK
      ?auto_59810 - BLOCK
      ?auto_59811 - BLOCK
      ?auto_59812 - BLOCK
    )
    :vars
    (
      ?auto_59813 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59811 ) ( ON-TABLE ?auto_59807 ) ( ON ?auto_59808 ?auto_59807 ) ( ON ?auto_59809 ?auto_59808 ) ( ON ?auto_59810 ?auto_59809 ) ( ON ?auto_59811 ?auto_59810 ) ( not ( = ?auto_59807 ?auto_59808 ) ) ( not ( = ?auto_59807 ?auto_59809 ) ) ( not ( = ?auto_59807 ?auto_59810 ) ) ( not ( = ?auto_59807 ?auto_59811 ) ) ( not ( = ?auto_59807 ?auto_59812 ) ) ( not ( = ?auto_59808 ?auto_59809 ) ) ( not ( = ?auto_59808 ?auto_59810 ) ) ( not ( = ?auto_59808 ?auto_59811 ) ) ( not ( = ?auto_59808 ?auto_59812 ) ) ( not ( = ?auto_59809 ?auto_59810 ) ) ( not ( = ?auto_59809 ?auto_59811 ) ) ( not ( = ?auto_59809 ?auto_59812 ) ) ( not ( = ?auto_59810 ?auto_59811 ) ) ( not ( = ?auto_59810 ?auto_59812 ) ) ( not ( = ?auto_59811 ?auto_59812 ) ) ( ON ?auto_59812 ?auto_59813 ) ( CLEAR ?auto_59812 ) ( HAND-EMPTY ) ( not ( = ?auto_59807 ?auto_59813 ) ) ( not ( = ?auto_59808 ?auto_59813 ) ) ( not ( = ?auto_59809 ?auto_59813 ) ) ( not ( = ?auto_59810 ?auto_59813 ) ) ( not ( = ?auto_59811 ?auto_59813 ) ) ( not ( = ?auto_59812 ?auto_59813 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59812 ?auto_59813 )
      ( MAKE-6PILE ?auto_59807 ?auto_59808 ?auto_59809 ?auto_59810 ?auto_59811 ?auto_59812 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59814 - BLOCK
      ?auto_59815 - BLOCK
      ?auto_59816 - BLOCK
      ?auto_59817 - BLOCK
      ?auto_59818 - BLOCK
      ?auto_59819 - BLOCK
    )
    :vars
    (
      ?auto_59820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59814 ) ( ON ?auto_59815 ?auto_59814 ) ( ON ?auto_59816 ?auto_59815 ) ( ON ?auto_59817 ?auto_59816 ) ( not ( = ?auto_59814 ?auto_59815 ) ) ( not ( = ?auto_59814 ?auto_59816 ) ) ( not ( = ?auto_59814 ?auto_59817 ) ) ( not ( = ?auto_59814 ?auto_59818 ) ) ( not ( = ?auto_59814 ?auto_59819 ) ) ( not ( = ?auto_59815 ?auto_59816 ) ) ( not ( = ?auto_59815 ?auto_59817 ) ) ( not ( = ?auto_59815 ?auto_59818 ) ) ( not ( = ?auto_59815 ?auto_59819 ) ) ( not ( = ?auto_59816 ?auto_59817 ) ) ( not ( = ?auto_59816 ?auto_59818 ) ) ( not ( = ?auto_59816 ?auto_59819 ) ) ( not ( = ?auto_59817 ?auto_59818 ) ) ( not ( = ?auto_59817 ?auto_59819 ) ) ( not ( = ?auto_59818 ?auto_59819 ) ) ( ON ?auto_59819 ?auto_59820 ) ( CLEAR ?auto_59819 ) ( not ( = ?auto_59814 ?auto_59820 ) ) ( not ( = ?auto_59815 ?auto_59820 ) ) ( not ( = ?auto_59816 ?auto_59820 ) ) ( not ( = ?auto_59817 ?auto_59820 ) ) ( not ( = ?auto_59818 ?auto_59820 ) ) ( not ( = ?auto_59819 ?auto_59820 ) ) ( HOLDING ?auto_59818 ) ( CLEAR ?auto_59817 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59814 ?auto_59815 ?auto_59816 ?auto_59817 ?auto_59818 )
      ( MAKE-6PILE ?auto_59814 ?auto_59815 ?auto_59816 ?auto_59817 ?auto_59818 ?auto_59819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59821 - BLOCK
      ?auto_59822 - BLOCK
      ?auto_59823 - BLOCK
      ?auto_59824 - BLOCK
      ?auto_59825 - BLOCK
      ?auto_59826 - BLOCK
    )
    :vars
    (
      ?auto_59827 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59821 ) ( ON ?auto_59822 ?auto_59821 ) ( ON ?auto_59823 ?auto_59822 ) ( ON ?auto_59824 ?auto_59823 ) ( not ( = ?auto_59821 ?auto_59822 ) ) ( not ( = ?auto_59821 ?auto_59823 ) ) ( not ( = ?auto_59821 ?auto_59824 ) ) ( not ( = ?auto_59821 ?auto_59825 ) ) ( not ( = ?auto_59821 ?auto_59826 ) ) ( not ( = ?auto_59822 ?auto_59823 ) ) ( not ( = ?auto_59822 ?auto_59824 ) ) ( not ( = ?auto_59822 ?auto_59825 ) ) ( not ( = ?auto_59822 ?auto_59826 ) ) ( not ( = ?auto_59823 ?auto_59824 ) ) ( not ( = ?auto_59823 ?auto_59825 ) ) ( not ( = ?auto_59823 ?auto_59826 ) ) ( not ( = ?auto_59824 ?auto_59825 ) ) ( not ( = ?auto_59824 ?auto_59826 ) ) ( not ( = ?auto_59825 ?auto_59826 ) ) ( ON ?auto_59826 ?auto_59827 ) ( not ( = ?auto_59821 ?auto_59827 ) ) ( not ( = ?auto_59822 ?auto_59827 ) ) ( not ( = ?auto_59823 ?auto_59827 ) ) ( not ( = ?auto_59824 ?auto_59827 ) ) ( not ( = ?auto_59825 ?auto_59827 ) ) ( not ( = ?auto_59826 ?auto_59827 ) ) ( CLEAR ?auto_59824 ) ( ON ?auto_59825 ?auto_59826 ) ( CLEAR ?auto_59825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59827 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59827 ?auto_59826 )
      ( MAKE-6PILE ?auto_59821 ?auto_59822 ?auto_59823 ?auto_59824 ?auto_59825 ?auto_59826 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59828 - BLOCK
      ?auto_59829 - BLOCK
      ?auto_59830 - BLOCK
      ?auto_59831 - BLOCK
      ?auto_59832 - BLOCK
      ?auto_59833 - BLOCK
    )
    :vars
    (
      ?auto_59834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59828 ) ( ON ?auto_59829 ?auto_59828 ) ( ON ?auto_59830 ?auto_59829 ) ( not ( = ?auto_59828 ?auto_59829 ) ) ( not ( = ?auto_59828 ?auto_59830 ) ) ( not ( = ?auto_59828 ?auto_59831 ) ) ( not ( = ?auto_59828 ?auto_59832 ) ) ( not ( = ?auto_59828 ?auto_59833 ) ) ( not ( = ?auto_59829 ?auto_59830 ) ) ( not ( = ?auto_59829 ?auto_59831 ) ) ( not ( = ?auto_59829 ?auto_59832 ) ) ( not ( = ?auto_59829 ?auto_59833 ) ) ( not ( = ?auto_59830 ?auto_59831 ) ) ( not ( = ?auto_59830 ?auto_59832 ) ) ( not ( = ?auto_59830 ?auto_59833 ) ) ( not ( = ?auto_59831 ?auto_59832 ) ) ( not ( = ?auto_59831 ?auto_59833 ) ) ( not ( = ?auto_59832 ?auto_59833 ) ) ( ON ?auto_59833 ?auto_59834 ) ( not ( = ?auto_59828 ?auto_59834 ) ) ( not ( = ?auto_59829 ?auto_59834 ) ) ( not ( = ?auto_59830 ?auto_59834 ) ) ( not ( = ?auto_59831 ?auto_59834 ) ) ( not ( = ?auto_59832 ?auto_59834 ) ) ( not ( = ?auto_59833 ?auto_59834 ) ) ( ON ?auto_59832 ?auto_59833 ) ( CLEAR ?auto_59832 ) ( ON-TABLE ?auto_59834 ) ( HOLDING ?auto_59831 ) ( CLEAR ?auto_59830 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59828 ?auto_59829 ?auto_59830 ?auto_59831 )
      ( MAKE-6PILE ?auto_59828 ?auto_59829 ?auto_59830 ?auto_59831 ?auto_59832 ?auto_59833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59835 - BLOCK
      ?auto_59836 - BLOCK
      ?auto_59837 - BLOCK
      ?auto_59838 - BLOCK
      ?auto_59839 - BLOCK
      ?auto_59840 - BLOCK
    )
    :vars
    (
      ?auto_59841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59835 ) ( ON ?auto_59836 ?auto_59835 ) ( ON ?auto_59837 ?auto_59836 ) ( not ( = ?auto_59835 ?auto_59836 ) ) ( not ( = ?auto_59835 ?auto_59837 ) ) ( not ( = ?auto_59835 ?auto_59838 ) ) ( not ( = ?auto_59835 ?auto_59839 ) ) ( not ( = ?auto_59835 ?auto_59840 ) ) ( not ( = ?auto_59836 ?auto_59837 ) ) ( not ( = ?auto_59836 ?auto_59838 ) ) ( not ( = ?auto_59836 ?auto_59839 ) ) ( not ( = ?auto_59836 ?auto_59840 ) ) ( not ( = ?auto_59837 ?auto_59838 ) ) ( not ( = ?auto_59837 ?auto_59839 ) ) ( not ( = ?auto_59837 ?auto_59840 ) ) ( not ( = ?auto_59838 ?auto_59839 ) ) ( not ( = ?auto_59838 ?auto_59840 ) ) ( not ( = ?auto_59839 ?auto_59840 ) ) ( ON ?auto_59840 ?auto_59841 ) ( not ( = ?auto_59835 ?auto_59841 ) ) ( not ( = ?auto_59836 ?auto_59841 ) ) ( not ( = ?auto_59837 ?auto_59841 ) ) ( not ( = ?auto_59838 ?auto_59841 ) ) ( not ( = ?auto_59839 ?auto_59841 ) ) ( not ( = ?auto_59840 ?auto_59841 ) ) ( ON ?auto_59839 ?auto_59840 ) ( ON-TABLE ?auto_59841 ) ( CLEAR ?auto_59837 ) ( ON ?auto_59838 ?auto_59839 ) ( CLEAR ?auto_59838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59841 ?auto_59840 ?auto_59839 )
      ( MAKE-6PILE ?auto_59835 ?auto_59836 ?auto_59837 ?auto_59838 ?auto_59839 ?auto_59840 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59842 - BLOCK
      ?auto_59843 - BLOCK
      ?auto_59844 - BLOCK
      ?auto_59845 - BLOCK
      ?auto_59846 - BLOCK
      ?auto_59847 - BLOCK
    )
    :vars
    (
      ?auto_59848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59842 ) ( ON ?auto_59843 ?auto_59842 ) ( not ( = ?auto_59842 ?auto_59843 ) ) ( not ( = ?auto_59842 ?auto_59844 ) ) ( not ( = ?auto_59842 ?auto_59845 ) ) ( not ( = ?auto_59842 ?auto_59846 ) ) ( not ( = ?auto_59842 ?auto_59847 ) ) ( not ( = ?auto_59843 ?auto_59844 ) ) ( not ( = ?auto_59843 ?auto_59845 ) ) ( not ( = ?auto_59843 ?auto_59846 ) ) ( not ( = ?auto_59843 ?auto_59847 ) ) ( not ( = ?auto_59844 ?auto_59845 ) ) ( not ( = ?auto_59844 ?auto_59846 ) ) ( not ( = ?auto_59844 ?auto_59847 ) ) ( not ( = ?auto_59845 ?auto_59846 ) ) ( not ( = ?auto_59845 ?auto_59847 ) ) ( not ( = ?auto_59846 ?auto_59847 ) ) ( ON ?auto_59847 ?auto_59848 ) ( not ( = ?auto_59842 ?auto_59848 ) ) ( not ( = ?auto_59843 ?auto_59848 ) ) ( not ( = ?auto_59844 ?auto_59848 ) ) ( not ( = ?auto_59845 ?auto_59848 ) ) ( not ( = ?auto_59846 ?auto_59848 ) ) ( not ( = ?auto_59847 ?auto_59848 ) ) ( ON ?auto_59846 ?auto_59847 ) ( ON-TABLE ?auto_59848 ) ( ON ?auto_59845 ?auto_59846 ) ( CLEAR ?auto_59845 ) ( HOLDING ?auto_59844 ) ( CLEAR ?auto_59843 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59842 ?auto_59843 ?auto_59844 )
      ( MAKE-6PILE ?auto_59842 ?auto_59843 ?auto_59844 ?auto_59845 ?auto_59846 ?auto_59847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59849 - BLOCK
      ?auto_59850 - BLOCK
      ?auto_59851 - BLOCK
      ?auto_59852 - BLOCK
      ?auto_59853 - BLOCK
      ?auto_59854 - BLOCK
    )
    :vars
    (
      ?auto_59855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59849 ) ( ON ?auto_59850 ?auto_59849 ) ( not ( = ?auto_59849 ?auto_59850 ) ) ( not ( = ?auto_59849 ?auto_59851 ) ) ( not ( = ?auto_59849 ?auto_59852 ) ) ( not ( = ?auto_59849 ?auto_59853 ) ) ( not ( = ?auto_59849 ?auto_59854 ) ) ( not ( = ?auto_59850 ?auto_59851 ) ) ( not ( = ?auto_59850 ?auto_59852 ) ) ( not ( = ?auto_59850 ?auto_59853 ) ) ( not ( = ?auto_59850 ?auto_59854 ) ) ( not ( = ?auto_59851 ?auto_59852 ) ) ( not ( = ?auto_59851 ?auto_59853 ) ) ( not ( = ?auto_59851 ?auto_59854 ) ) ( not ( = ?auto_59852 ?auto_59853 ) ) ( not ( = ?auto_59852 ?auto_59854 ) ) ( not ( = ?auto_59853 ?auto_59854 ) ) ( ON ?auto_59854 ?auto_59855 ) ( not ( = ?auto_59849 ?auto_59855 ) ) ( not ( = ?auto_59850 ?auto_59855 ) ) ( not ( = ?auto_59851 ?auto_59855 ) ) ( not ( = ?auto_59852 ?auto_59855 ) ) ( not ( = ?auto_59853 ?auto_59855 ) ) ( not ( = ?auto_59854 ?auto_59855 ) ) ( ON ?auto_59853 ?auto_59854 ) ( ON-TABLE ?auto_59855 ) ( ON ?auto_59852 ?auto_59853 ) ( CLEAR ?auto_59850 ) ( ON ?auto_59851 ?auto_59852 ) ( CLEAR ?auto_59851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59855 ?auto_59854 ?auto_59853 ?auto_59852 )
      ( MAKE-6PILE ?auto_59849 ?auto_59850 ?auto_59851 ?auto_59852 ?auto_59853 ?auto_59854 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59856 - BLOCK
      ?auto_59857 - BLOCK
      ?auto_59858 - BLOCK
      ?auto_59859 - BLOCK
      ?auto_59860 - BLOCK
      ?auto_59861 - BLOCK
    )
    :vars
    (
      ?auto_59862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59856 ) ( not ( = ?auto_59856 ?auto_59857 ) ) ( not ( = ?auto_59856 ?auto_59858 ) ) ( not ( = ?auto_59856 ?auto_59859 ) ) ( not ( = ?auto_59856 ?auto_59860 ) ) ( not ( = ?auto_59856 ?auto_59861 ) ) ( not ( = ?auto_59857 ?auto_59858 ) ) ( not ( = ?auto_59857 ?auto_59859 ) ) ( not ( = ?auto_59857 ?auto_59860 ) ) ( not ( = ?auto_59857 ?auto_59861 ) ) ( not ( = ?auto_59858 ?auto_59859 ) ) ( not ( = ?auto_59858 ?auto_59860 ) ) ( not ( = ?auto_59858 ?auto_59861 ) ) ( not ( = ?auto_59859 ?auto_59860 ) ) ( not ( = ?auto_59859 ?auto_59861 ) ) ( not ( = ?auto_59860 ?auto_59861 ) ) ( ON ?auto_59861 ?auto_59862 ) ( not ( = ?auto_59856 ?auto_59862 ) ) ( not ( = ?auto_59857 ?auto_59862 ) ) ( not ( = ?auto_59858 ?auto_59862 ) ) ( not ( = ?auto_59859 ?auto_59862 ) ) ( not ( = ?auto_59860 ?auto_59862 ) ) ( not ( = ?auto_59861 ?auto_59862 ) ) ( ON ?auto_59860 ?auto_59861 ) ( ON-TABLE ?auto_59862 ) ( ON ?auto_59859 ?auto_59860 ) ( ON ?auto_59858 ?auto_59859 ) ( CLEAR ?auto_59858 ) ( HOLDING ?auto_59857 ) ( CLEAR ?auto_59856 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59856 ?auto_59857 )
      ( MAKE-6PILE ?auto_59856 ?auto_59857 ?auto_59858 ?auto_59859 ?auto_59860 ?auto_59861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59863 - BLOCK
      ?auto_59864 - BLOCK
      ?auto_59865 - BLOCK
      ?auto_59866 - BLOCK
      ?auto_59867 - BLOCK
      ?auto_59868 - BLOCK
    )
    :vars
    (
      ?auto_59869 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59863 ) ( not ( = ?auto_59863 ?auto_59864 ) ) ( not ( = ?auto_59863 ?auto_59865 ) ) ( not ( = ?auto_59863 ?auto_59866 ) ) ( not ( = ?auto_59863 ?auto_59867 ) ) ( not ( = ?auto_59863 ?auto_59868 ) ) ( not ( = ?auto_59864 ?auto_59865 ) ) ( not ( = ?auto_59864 ?auto_59866 ) ) ( not ( = ?auto_59864 ?auto_59867 ) ) ( not ( = ?auto_59864 ?auto_59868 ) ) ( not ( = ?auto_59865 ?auto_59866 ) ) ( not ( = ?auto_59865 ?auto_59867 ) ) ( not ( = ?auto_59865 ?auto_59868 ) ) ( not ( = ?auto_59866 ?auto_59867 ) ) ( not ( = ?auto_59866 ?auto_59868 ) ) ( not ( = ?auto_59867 ?auto_59868 ) ) ( ON ?auto_59868 ?auto_59869 ) ( not ( = ?auto_59863 ?auto_59869 ) ) ( not ( = ?auto_59864 ?auto_59869 ) ) ( not ( = ?auto_59865 ?auto_59869 ) ) ( not ( = ?auto_59866 ?auto_59869 ) ) ( not ( = ?auto_59867 ?auto_59869 ) ) ( not ( = ?auto_59868 ?auto_59869 ) ) ( ON ?auto_59867 ?auto_59868 ) ( ON-TABLE ?auto_59869 ) ( ON ?auto_59866 ?auto_59867 ) ( ON ?auto_59865 ?auto_59866 ) ( CLEAR ?auto_59863 ) ( ON ?auto_59864 ?auto_59865 ) ( CLEAR ?auto_59864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59869 ?auto_59868 ?auto_59867 ?auto_59866 ?auto_59865 )
      ( MAKE-6PILE ?auto_59863 ?auto_59864 ?auto_59865 ?auto_59866 ?auto_59867 ?auto_59868 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59870 - BLOCK
      ?auto_59871 - BLOCK
      ?auto_59872 - BLOCK
      ?auto_59873 - BLOCK
      ?auto_59874 - BLOCK
      ?auto_59875 - BLOCK
    )
    :vars
    (
      ?auto_59876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59870 ?auto_59871 ) ) ( not ( = ?auto_59870 ?auto_59872 ) ) ( not ( = ?auto_59870 ?auto_59873 ) ) ( not ( = ?auto_59870 ?auto_59874 ) ) ( not ( = ?auto_59870 ?auto_59875 ) ) ( not ( = ?auto_59871 ?auto_59872 ) ) ( not ( = ?auto_59871 ?auto_59873 ) ) ( not ( = ?auto_59871 ?auto_59874 ) ) ( not ( = ?auto_59871 ?auto_59875 ) ) ( not ( = ?auto_59872 ?auto_59873 ) ) ( not ( = ?auto_59872 ?auto_59874 ) ) ( not ( = ?auto_59872 ?auto_59875 ) ) ( not ( = ?auto_59873 ?auto_59874 ) ) ( not ( = ?auto_59873 ?auto_59875 ) ) ( not ( = ?auto_59874 ?auto_59875 ) ) ( ON ?auto_59875 ?auto_59876 ) ( not ( = ?auto_59870 ?auto_59876 ) ) ( not ( = ?auto_59871 ?auto_59876 ) ) ( not ( = ?auto_59872 ?auto_59876 ) ) ( not ( = ?auto_59873 ?auto_59876 ) ) ( not ( = ?auto_59874 ?auto_59876 ) ) ( not ( = ?auto_59875 ?auto_59876 ) ) ( ON ?auto_59874 ?auto_59875 ) ( ON-TABLE ?auto_59876 ) ( ON ?auto_59873 ?auto_59874 ) ( ON ?auto_59872 ?auto_59873 ) ( ON ?auto_59871 ?auto_59872 ) ( CLEAR ?auto_59871 ) ( HOLDING ?auto_59870 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59870 )
      ( MAKE-6PILE ?auto_59870 ?auto_59871 ?auto_59872 ?auto_59873 ?auto_59874 ?auto_59875 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59877 - BLOCK
      ?auto_59878 - BLOCK
      ?auto_59879 - BLOCK
      ?auto_59880 - BLOCK
      ?auto_59881 - BLOCK
      ?auto_59882 - BLOCK
    )
    :vars
    (
      ?auto_59883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59877 ?auto_59878 ) ) ( not ( = ?auto_59877 ?auto_59879 ) ) ( not ( = ?auto_59877 ?auto_59880 ) ) ( not ( = ?auto_59877 ?auto_59881 ) ) ( not ( = ?auto_59877 ?auto_59882 ) ) ( not ( = ?auto_59878 ?auto_59879 ) ) ( not ( = ?auto_59878 ?auto_59880 ) ) ( not ( = ?auto_59878 ?auto_59881 ) ) ( not ( = ?auto_59878 ?auto_59882 ) ) ( not ( = ?auto_59879 ?auto_59880 ) ) ( not ( = ?auto_59879 ?auto_59881 ) ) ( not ( = ?auto_59879 ?auto_59882 ) ) ( not ( = ?auto_59880 ?auto_59881 ) ) ( not ( = ?auto_59880 ?auto_59882 ) ) ( not ( = ?auto_59881 ?auto_59882 ) ) ( ON ?auto_59882 ?auto_59883 ) ( not ( = ?auto_59877 ?auto_59883 ) ) ( not ( = ?auto_59878 ?auto_59883 ) ) ( not ( = ?auto_59879 ?auto_59883 ) ) ( not ( = ?auto_59880 ?auto_59883 ) ) ( not ( = ?auto_59881 ?auto_59883 ) ) ( not ( = ?auto_59882 ?auto_59883 ) ) ( ON ?auto_59881 ?auto_59882 ) ( ON-TABLE ?auto_59883 ) ( ON ?auto_59880 ?auto_59881 ) ( ON ?auto_59879 ?auto_59880 ) ( ON ?auto_59878 ?auto_59879 ) ( ON ?auto_59877 ?auto_59878 ) ( CLEAR ?auto_59877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59883 ?auto_59882 ?auto_59881 ?auto_59880 ?auto_59879 ?auto_59878 )
      ( MAKE-6PILE ?auto_59877 ?auto_59878 ?auto_59879 ?auto_59880 ?auto_59881 ?auto_59882 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59889 - BLOCK
      ?auto_59890 - BLOCK
      ?auto_59891 - BLOCK
      ?auto_59892 - BLOCK
      ?auto_59893 - BLOCK
    )
    :vars
    (
      ?auto_59894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59894 ?auto_59893 ) ( CLEAR ?auto_59894 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59889 ) ( ON ?auto_59890 ?auto_59889 ) ( ON ?auto_59891 ?auto_59890 ) ( ON ?auto_59892 ?auto_59891 ) ( ON ?auto_59893 ?auto_59892 ) ( not ( = ?auto_59889 ?auto_59890 ) ) ( not ( = ?auto_59889 ?auto_59891 ) ) ( not ( = ?auto_59889 ?auto_59892 ) ) ( not ( = ?auto_59889 ?auto_59893 ) ) ( not ( = ?auto_59889 ?auto_59894 ) ) ( not ( = ?auto_59890 ?auto_59891 ) ) ( not ( = ?auto_59890 ?auto_59892 ) ) ( not ( = ?auto_59890 ?auto_59893 ) ) ( not ( = ?auto_59890 ?auto_59894 ) ) ( not ( = ?auto_59891 ?auto_59892 ) ) ( not ( = ?auto_59891 ?auto_59893 ) ) ( not ( = ?auto_59891 ?auto_59894 ) ) ( not ( = ?auto_59892 ?auto_59893 ) ) ( not ( = ?auto_59892 ?auto_59894 ) ) ( not ( = ?auto_59893 ?auto_59894 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59894 ?auto_59893 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59908 - BLOCK
      ?auto_59909 - BLOCK
      ?auto_59910 - BLOCK
      ?auto_59911 - BLOCK
      ?auto_59912 - BLOCK
    )
    :vars
    (
      ?auto_59913 - BLOCK
      ?auto_59914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59908 ) ( ON ?auto_59909 ?auto_59908 ) ( ON ?auto_59910 ?auto_59909 ) ( ON ?auto_59911 ?auto_59910 ) ( not ( = ?auto_59908 ?auto_59909 ) ) ( not ( = ?auto_59908 ?auto_59910 ) ) ( not ( = ?auto_59908 ?auto_59911 ) ) ( not ( = ?auto_59908 ?auto_59912 ) ) ( not ( = ?auto_59908 ?auto_59913 ) ) ( not ( = ?auto_59909 ?auto_59910 ) ) ( not ( = ?auto_59909 ?auto_59911 ) ) ( not ( = ?auto_59909 ?auto_59912 ) ) ( not ( = ?auto_59909 ?auto_59913 ) ) ( not ( = ?auto_59910 ?auto_59911 ) ) ( not ( = ?auto_59910 ?auto_59912 ) ) ( not ( = ?auto_59910 ?auto_59913 ) ) ( not ( = ?auto_59911 ?auto_59912 ) ) ( not ( = ?auto_59911 ?auto_59913 ) ) ( not ( = ?auto_59912 ?auto_59913 ) ) ( ON ?auto_59913 ?auto_59914 ) ( CLEAR ?auto_59913 ) ( not ( = ?auto_59908 ?auto_59914 ) ) ( not ( = ?auto_59909 ?auto_59914 ) ) ( not ( = ?auto_59910 ?auto_59914 ) ) ( not ( = ?auto_59911 ?auto_59914 ) ) ( not ( = ?auto_59912 ?auto_59914 ) ) ( not ( = ?auto_59913 ?auto_59914 ) ) ( HOLDING ?auto_59912 ) ( CLEAR ?auto_59911 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59908 ?auto_59909 ?auto_59910 ?auto_59911 ?auto_59912 ?auto_59913 )
      ( MAKE-5PILE ?auto_59908 ?auto_59909 ?auto_59910 ?auto_59911 ?auto_59912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59915 - BLOCK
      ?auto_59916 - BLOCK
      ?auto_59917 - BLOCK
      ?auto_59918 - BLOCK
      ?auto_59919 - BLOCK
    )
    :vars
    (
      ?auto_59920 - BLOCK
      ?auto_59921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59915 ) ( ON ?auto_59916 ?auto_59915 ) ( ON ?auto_59917 ?auto_59916 ) ( ON ?auto_59918 ?auto_59917 ) ( not ( = ?auto_59915 ?auto_59916 ) ) ( not ( = ?auto_59915 ?auto_59917 ) ) ( not ( = ?auto_59915 ?auto_59918 ) ) ( not ( = ?auto_59915 ?auto_59919 ) ) ( not ( = ?auto_59915 ?auto_59920 ) ) ( not ( = ?auto_59916 ?auto_59917 ) ) ( not ( = ?auto_59916 ?auto_59918 ) ) ( not ( = ?auto_59916 ?auto_59919 ) ) ( not ( = ?auto_59916 ?auto_59920 ) ) ( not ( = ?auto_59917 ?auto_59918 ) ) ( not ( = ?auto_59917 ?auto_59919 ) ) ( not ( = ?auto_59917 ?auto_59920 ) ) ( not ( = ?auto_59918 ?auto_59919 ) ) ( not ( = ?auto_59918 ?auto_59920 ) ) ( not ( = ?auto_59919 ?auto_59920 ) ) ( ON ?auto_59920 ?auto_59921 ) ( not ( = ?auto_59915 ?auto_59921 ) ) ( not ( = ?auto_59916 ?auto_59921 ) ) ( not ( = ?auto_59917 ?auto_59921 ) ) ( not ( = ?auto_59918 ?auto_59921 ) ) ( not ( = ?auto_59919 ?auto_59921 ) ) ( not ( = ?auto_59920 ?auto_59921 ) ) ( CLEAR ?auto_59918 ) ( ON ?auto_59919 ?auto_59920 ) ( CLEAR ?auto_59919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59921 ?auto_59920 )
      ( MAKE-5PILE ?auto_59915 ?auto_59916 ?auto_59917 ?auto_59918 ?auto_59919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59922 - BLOCK
      ?auto_59923 - BLOCK
      ?auto_59924 - BLOCK
      ?auto_59925 - BLOCK
      ?auto_59926 - BLOCK
    )
    :vars
    (
      ?auto_59928 - BLOCK
      ?auto_59927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59922 ) ( ON ?auto_59923 ?auto_59922 ) ( ON ?auto_59924 ?auto_59923 ) ( not ( = ?auto_59922 ?auto_59923 ) ) ( not ( = ?auto_59922 ?auto_59924 ) ) ( not ( = ?auto_59922 ?auto_59925 ) ) ( not ( = ?auto_59922 ?auto_59926 ) ) ( not ( = ?auto_59922 ?auto_59928 ) ) ( not ( = ?auto_59923 ?auto_59924 ) ) ( not ( = ?auto_59923 ?auto_59925 ) ) ( not ( = ?auto_59923 ?auto_59926 ) ) ( not ( = ?auto_59923 ?auto_59928 ) ) ( not ( = ?auto_59924 ?auto_59925 ) ) ( not ( = ?auto_59924 ?auto_59926 ) ) ( not ( = ?auto_59924 ?auto_59928 ) ) ( not ( = ?auto_59925 ?auto_59926 ) ) ( not ( = ?auto_59925 ?auto_59928 ) ) ( not ( = ?auto_59926 ?auto_59928 ) ) ( ON ?auto_59928 ?auto_59927 ) ( not ( = ?auto_59922 ?auto_59927 ) ) ( not ( = ?auto_59923 ?auto_59927 ) ) ( not ( = ?auto_59924 ?auto_59927 ) ) ( not ( = ?auto_59925 ?auto_59927 ) ) ( not ( = ?auto_59926 ?auto_59927 ) ) ( not ( = ?auto_59928 ?auto_59927 ) ) ( ON ?auto_59926 ?auto_59928 ) ( CLEAR ?auto_59926 ) ( ON-TABLE ?auto_59927 ) ( HOLDING ?auto_59925 ) ( CLEAR ?auto_59924 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59922 ?auto_59923 ?auto_59924 ?auto_59925 )
      ( MAKE-5PILE ?auto_59922 ?auto_59923 ?auto_59924 ?auto_59925 ?auto_59926 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59929 - BLOCK
      ?auto_59930 - BLOCK
      ?auto_59931 - BLOCK
      ?auto_59932 - BLOCK
      ?auto_59933 - BLOCK
    )
    :vars
    (
      ?auto_59934 - BLOCK
      ?auto_59935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59929 ) ( ON ?auto_59930 ?auto_59929 ) ( ON ?auto_59931 ?auto_59930 ) ( not ( = ?auto_59929 ?auto_59930 ) ) ( not ( = ?auto_59929 ?auto_59931 ) ) ( not ( = ?auto_59929 ?auto_59932 ) ) ( not ( = ?auto_59929 ?auto_59933 ) ) ( not ( = ?auto_59929 ?auto_59934 ) ) ( not ( = ?auto_59930 ?auto_59931 ) ) ( not ( = ?auto_59930 ?auto_59932 ) ) ( not ( = ?auto_59930 ?auto_59933 ) ) ( not ( = ?auto_59930 ?auto_59934 ) ) ( not ( = ?auto_59931 ?auto_59932 ) ) ( not ( = ?auto_59931 ?auto_59933 ) ) ( not ( = ?auto_59931 ?auto_59934 ) ) ( not ( = ?auto_59932 ?auto_59933 ) ) ( not ( = ?auto_59932 ?auto_59934 ) ) ( not ( = ?auto_59933 ?auto_59934 ) ) ( ON ?auto_59934 ?auto_59935 ) ( not ( = ?auto_59929 ?auto_59935 ) ) ( not ( = ?auto_59930 ?auto_59935 ) ) ( not ( = ?auto_59931 ?auto_59935 ) ) ( not ( = ?auto_59932 ?auto_59935 ) ) ( not ( = ?auto_59933 ?auto_59935 ) ) ( not ( = ?auto_59934 ?auto_59935 ) ) ( ON ?auto_59933 ?auto_59934 ) ( ON-TABLE ?auto_59935 ) ( CLEAR ?auto_59931 ) ( ON ?auto_59932 ?auto_59933 ) ( CLEAR ?auto_59932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59935 ?auto_59934 ?auto_59933 )
      ( MAKE-5PILE ?auto_59929 ?auto_59930 ?auto_59931 ?auto_59932 ?auto_59933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59936 - BLOCK
      ?auto_59937 - BLOCK
      ?auto_59938 - BLOCK
      ?auto_59939 - BLOCK
      ?auto_59940 - BLOCK
    )
    :vars
    (
      ?auto_59942 - BLOCK
      ?auto_59941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59936 ) ( ON ?auto_59937 ?auto_59936 ) ( not ( = ?auto_59936 ?auto_59937 ) ) ( not ( = ?auto_59936 ?auto_59938 ) ) ( not ( = ?auto_59936 ?auto_59939 ) ) ( not ( = ?auto_59936 ?auto_59940 ) ) ( not ( = ?auto_59936 ?auto_59942 ) ) ( not ( = ?auto_59937 ?auto_59938 ) ) ( not ( = ?auto_59937 ?auto_59939 ) ) ( not ( = ?auto_59937 ?auto_59940 ) ) ( not ( = ?auto_59937 ?auto_59942 ) ) ( not ( = ?auto_59938 ?auto_59939 ) ) ( not ( = ?auto_59938 ?auto_59940 ) ) ( not ( = ?auto_59938 ?auto_59942 ) ) ( not ( = ?auto_59939 ?auto_59940 ) ) ( not ( = ?auto_59939 ?auto_59942 ) ) ( not ( = ?auto_59940 ?auto_59942 ) ) ( ON ?auto_59942 ?auto_59941 ) ( not ( = ?auto_59936 ?auto_59941 ) ) ( not ( = ?auto_59937 ?auto_59941 ) ) ( not ( = ?auto_59938 ?auto_59941 ) ) ( not ( = ?auto_59939 ?auto_59941 ) ) ( not ( = ?auto_59940 ?auto_59941 ) ) ( not ( = ?auto_59942 ?auto_59941 ) ) ( ON ?auto_59940 ?auto_59942 ) ( ON-TABLE ?auto_59941 ) ( ON ?auto_59939 ?auto_59940 ) ( CLEAR ?auto_59939 ) ( HOLDING ?auto_59938 ) ( CLEAR ?auto_59937 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59936 ?auto_59937 ?auto_59938 )
      ( MAKE-5PILE ?auto_59936 ?auto_59937 ?auto_59938 ?auto_59939 ?auto_59940 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59943 - BLOCK
      ?auto_59944 - BLOCK
      ?auto_59945 - BLOCK
      ?auto_59946 - BLOCK
      ?auto_59947 - BLOCK
    )
    :vars
    (
      ?auto_59948 - BLOCK
      ?auto_59949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59943 ) ( ON ?auto_59944 ?auto_59943 ) ( not ( = ?auto_59943 ?auto_59944 ) ) ( not ( = ?auto_59943 ?auto_59945 ) ) ( not ( = ?auto_59943 ?auto_59946 ) ) ( not ( = ?auto_59943 ?auto_59947 ) ) ( not ( = ?auto_59943 ?auto_59948 ) ) ( not ( = ?auto_59944 ?auto_59945 ) ) ( not ( = ?auto_59944 ?auto_59946 ) ) ( not ( = ?auto_59944 ?auto_59947 ) ) ( not ( = ?auto_59944 ?auto_59948 ) ) ( not ( = ?auto_59945 ?auto_59946 ) ) ( not ( = ?auto_59945 ?auto_59947 ) ) ( not ( = ?auto_59945 ?auto_59948 ) ) ( not ( = ?auto_59946 ?auto_59947 ) ) ( not ( = ?auto_59946 ?auto_59948 ) ) ( not ( = ?auto_59947 ?auto_59948 ) ) ( ON ?auto_59948 ?auto_59949 ) ( not ( = ?auto_59943 ?auto_59949 ) ) ( not ( = ?auto_59944 ?auto_59949 ) ) ( not ( = ?auto_59945 ?auto_59949 ) ) ( not ( = ?auto_59946 ?auto_59949 ) ) ( not ( = ?auto_59947 ?auto_59949 ) ) ( not ( = ?auto_59948 ?auto_59949 ) ) ( ON ?auto_59947 ?auto_59948 ) ( ON-TABLE ?auto_59949 ) ( ON ?auto_59946 ?auto_59947 ) ( CLEAR ?auto_59944 ) ( ON ?auto_59945 ?auto_59946 ) ( CLEAR ?auto_59945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59949 ?auto_59948 ?auto_59947 ?auto_59946 )
      ( MAKE-5PILE ?auto_59943 ?auto_59944 ?auto_59945 ?auto_59946 ?auto_59947 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59950 - BLOCK
      ?auto_59951 - BLOCK
      ?auto_59952 - BLOCK
      ?auto_59953 - BLOCK
      ?auto_59954 - BLOCK
    )
    :vars
    (
      ?auto_59955 - BLOCK
      ?auto_59956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59950 ) ( not ( = ?auto_59950 ?auto_59951 ) ) ( not ( = ?auto_59950 ?auto_59952 ) ) ( not ( = ?auto_59950 ?auto_59953 ) ) ( not ( = ?auto_59950 ?auto_59954 ) ) ( not ( = ?auto_59950 ?auto_59955 ) ) ( not ( = ?auto_59951 ?auto_59952 ) ) ( not ( = ?auto_59951 ?auto_59953 ) ) ( not ( = ?auto_59951 ?auto_59954 ) ) ( not ( = ?auto_59951 ?auto_59955 ) ) ( not ( = ?auto_59952 ?auto_59953 ) ) ( not ( = ?auto_59952 ?auto_59954 ) ) ( not ( = ?auto_59952 ?auto_59955 ) ) ( not ( = ?auto_59953 ?auto_59954 ) ) ( not ( = ?auto_59953 ?auto_59955 ) ) ( not ( = ?auto_59954 ?auto_59955 ) ) ( ON ?auto_59955 ?auto_59956 ) ( not ( = ?auto_59950 ?auto_59956 ) ) ( not ( = ?auto_59951 ?auto_59956 ) ) ( not ( = ?auto_59952 ?auto_59956 ) ) ( not ( = ?auto_59953 ?auto_59956 ) ) ( not ( = ?auto_59954 ?auto_59956 ) ) ( not ( = ?auto_59955 ?auto_59956 ) ) ( ON ?auto_59954 ?auto_59955 ) ( ON-TABLE ?auto_59956 ) ( ON ?auto_59953 ?auto_59954 ) ( ON ?auto_59952 ?auto_59953 ) ( CLEAR ?auto_59952 ) ( HOLDING ?auto_59951 ) ( CLEAR ?auto_59950 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59950 ?auto_59951 )
      ( MAKE-5PILE ?auto_59950 ?auto_59951 ?auto_59952 ?auto_59953 ?auto_59954 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59957 - BLOCK
      ?auto_59958 - BLOCK
      ?auto_59959 - BLOCK
      ?auto_59960 - BLOCK
      ?auto_59961 - BLOCK
    )
    :vars
    (
      ?auto_59962 - BLOCK
      ?auto_59963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59957 ) ( not ( = ?auto_59957 ?auto_59958 ) ) ( not ( = ?auto_59957 ?auto_59959 ) ) ( not ( = ?auto_59957 ?auto_59960 ) ) ( not ( = ?auto_59957 ?auto_59961 ) ) ( not ( = ?auto_59957 ?auto_59962 ) ) ( not ( = ?auto_59958 ?auto_59959 ) ) ( not ( = ?auto_59958 ?auto_59960 ) ) ( not ( = ?auto_59958 ?auto_59961 ) ) ( not ( = ?auto_59958 ?auto_59962 ) ) ( not ( = ?auto_59959 ?auto_59960 ) ) ( not ( = ?auto_59959 ?auto_59961 ) ) ( not ( = ?auto_59959 ?auto_59962 ) ) ( not ( = ?auto_59960 ?auto_59961 ) ) ( not ( = ?auto_59960 ?auto_59962 ) ) ( not ( = ?auto_59961 ?auto_59962 ) ) ( ON ?auto_59962 ?auto_59963 ) ( not ( = ?auto_59957 ?auto_59963 ) ) ( not ( = ?auto_59958 ?auto_59963 ) ) ( not ( = ?auto_59959 ?auto_59963 ) ) ( not ( = ?auto_59960 ?auto_59963 ) ) ( not ( = ?auto_59961 ?auto_59963 ) ) ( not ( = ?auto_59962 ?auto_59963 ) ) ( ON ?auto_59961 ?auto_59962 ) ( ON-TABLE ?auto_59963 ) ( ON ?auto_59960 ?auto_59961 ) ( ON ?auto_59959 ?auto_59960 ) ( CLEAR ?auto_59957 ) ( ON ?auto_59958 ?auto_59959 ) ( CLEAR ?auto_59958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59963 ?auto_59962 ?auto_59961 ?auto_59960 ?auto_59959 )
      ( MAKE-5PILE ?auto_59957 ?auto_59958 ?auto_59959 ?auto_59960 ?auto_59961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59964 - BLOCK
      ?auto_59965 - BLOCK
      ?auto_59966 - BLOCK
      ?auto_59967 - BLOCK
      ?auto_59968 - BLOCK
    )
    :vars
    (
      ?auto_59970 - BLOCK
      ?auto_59969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59964 ?auto_59965 ) ) ( not ( = ?auto_59964 ?auto_59966 ) ) ( not ( = ?auto_59964 ?auto_59967 ) ) ( not ( = ?auto_59964 ?auto_59968 ) ) ( not ( = ?auto_59964 ?auto_59970 ) ) ( not ( = ?auto_59965 ?auto_59966 ) ) ( not ( = ?auto_59965 ?auto_59967 ) ) ( not ( = ?auto_59965 ?auto_59968 ) ) ( not ( = ?auto_59965 ?auto_59970 ) ) ( not ( = ?auto_59966 ?auto_59967 ) ) ( not ( = ?auto_59966 ?auto_59968 ) ) ( not ( = ?auto_59966 ?auto_59970 ) ) ( not ( = ?auto_59967 ?auto_59968 ) ) ( not ( = ?auto_59967 ?auto_59970 ) ) ( not ( = ?auto_59968 ?auto_59970 ) ) ( ON ?auto_59970 ?auto_59969 ) ( not ( = ?auto_59964 ?auto_59969 ) ) ( not ( = ?auto_59965 ?auto_59969 ) ) ( not ( = ?auto_59966 ?auto_59969 ) ) ( not ( = ?auto_59967 ?auto_59969 ) ) ( not ( = ?auto_59968 ?auto_59969 ) ) ( not ( = ?auto_59970 ?auto_59969 ) ) ( ON ?auto_59968 ?auto_59970 ) ( ON-TABLE ?auto_59969 ) ( ON ?auto_59967 ?auto_59968 ) ( ON ?auto_59966 ?auto_59967 ) ( ON ?auto_59965 ?auto_59966 ) ( CLEAR ?auto_59965 ) ( HOLDING ?auto_59964 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59964 )
      ( MAKE-5PILE ?auto_59964 ?auto_59965 ?auto_59966 ?auto_59967 ?auto_59968 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59971 - BLOCK
      ?auto_59972 - BLOCK
      ?auto_59973 - BLOCK
      ?auto_59974 - BLOCK
      ?auto_59975 - BLOCK
    )
    :vars
    (
      ?auto_59977 - BLOCK
      ?auto_59976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59971 ?auto_59972 ) ) ( not ( = ?auto_59971 ?auto_59973 ) ) ( not ( = ?auto_59971 ?auto_59974 ) ) ( not ( = ?auto_59971 ?auto_59975 ) ) ( not ( = ?auto_59971 ?auto_59977 ) ) ( not ( = ?auto_59972 ?auto_59973 ) ) ( not ( = ?auto_59972 ?auto_59974 ) ) ( not ( = ?auto_59972 ?auto_59975 ) ) ( not ( = ?auto_59972 ?auto_59977 ) ) ( not ( = ?auto_59973 ?auto_59974 ) ) ( not ( = ?auto_59973 ?auto_59975 ) ) ( not ( = ?auto_59973 ?auto_59977 ) ) ( not ( = ?auto_59974 ?auto_59975 ) ) ( not ( = ?auto_59974 ?auto_59977 ) ) ( not ( = ?auto_59975 ?auto_59977 ) ) ( ON ?auto_59977 ?auto_59976 ) ( not ( = ?auto_59971 ?auto_59976 ) ) ( not ( = ?auto_59972 ?auto_59976 ) ) ( not ( = ?auto_59973 ?auto_59976 ) ) ( not ( = ?auto_59974 ?auto_59976 ) ) ( not ( = ?auto_59975 ?auto_59976 ) ) ( not ( = ?auto_59977 ?auto_59976 ) ) ( ON ?auto_59975 ?auto_59977 ) ( ON-TABLE ?auto_59976 ) ( ON ?auto_59974 ?auto_59975 ) ( ON ?auto_59973 ?auto_59974 ) ( ON ?auto_59972 ?auto_59973 ) ( ON ?auto_59971 ?auto_59972 ) ( CLEAR ?auto_59971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59976 ?auto_59977 ?auto_59975 ?auto_59974 ?auto_59973 ?auto_59972 )
      ( MAKE-5PILE ?auto_59971 ?auto_59972 ?auto_59973 ?auto_59974 ?auto_59975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59979 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_59979 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_59979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59980 - BLOCK
    )
    :vars
    (
      ?auto_59981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59980 ?auto_59981 ) ( CLEAR ?auto_59980 ) ( HAND-EMPTY ) ( not ( = ?auto_59980 ?auto_59981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59980 ?auto_59981 )
      ( MAKE-1PILE ?auto_59980 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59982 - BLOCK
    )
    :vars
    (
      ?auto_59983 - BLOCK
      ?auto_59987 - BLOCK
      ?auto_59985 - BLOCK
      ?auto_59984 - BLOCK
      ?auto_59986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59982 ?auto_59983 ) ) ( HOLDING ?auto_59982 ) ( CLEAR ?auto_59983 ) ( ON-TABLE ?auto_59987 ) ( ON ?auto_59985 ?auto_59987 ) ( ON ?auto_59984 ?auto_59985 ) ( ON ?auto_59986 ?auto_59984 ) ( ON ?auto_59983 ?auto_59986 ) ( not ( = ?auto_59987 ?auto_59985 ) ) ( not ( = ?auto_59987 ?auto_59984 ) ) ( not ( = ?auto_59987 ?auto_59986 ) ) ( not ( = ?auto_59987 ?auto_59983 ) ) ( not ( = ?auto_59987 ?auto_59982 ) ) ( not ( = ?auto_59985 ?auto_59984 ) ) ( not ( = ?auto_59985 ?auto_59986 ) ) ( not ( = ?auto_59985 ?auto_59983 ) ) ( not ( = ?auto_59985 ?auto_59982 ) ) ( not ( = ?auto_59984 ?auto_59986 ) ) ( not ( = ?auto_59984 ?auto_59983 ) ) ( not ( = ?auto_59984 ?auto_59982 ) ) ( not ( = ?auto_59986 ?auto_59983 ) ) ( not ( = ?auto_59986 ?auto_59982 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59987 ?auto_59985 ?auto_59984 ?auto_59986 ?auto_59983 ?auto_59982 )
      ( MAKE-1PILE ?auto_59982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59988 - BLOCK
    )
    :vars
    (
      ?auto_59991 - BLOCK
      ?auto_59990 - BLOCK
      ?auto_59989 - BLOCK
      ?auto_59992 - BLOCK
      ?auto_59993 - BLOCK
      ?auto_59994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59988 ?auto_59991 ) ) ( CLEAR ?auto_59991 ) ( ON-TABLE ?auto_59990 ) ( ON ?auto_59989 ?auto_59990 ) ( ON ?auto_59992 ?auto_59989 ) ( ON ?auto_59993 ?auto_59992 ) ( ON ?auto_59991 ?auto_59993 ) ( not ( = ?auto_59990 ?auto_59989 ) ) ( not ( = ?auto_59990 ?auto_59992 ) ) ( not ( = ?auto_59990 ?auto_59993 ) ) ( not ( = ?auto_59990 ?auto_59991 ) ) ( not ( = ?auto_59990 ?auto_59988 ) ) ( not ( = ?auto_59989 ?auto_59992 ) ) ( not ( = ?auto_59989 ?auto_59993 ) ) ( not ( = ?auto_59989 ?auto_59991 ) ) ( not ( = ?auto_59989 ?auto_59988 ) ) ( not ( = ?auto_59992 ?auto_59993 ) ) ( not ( = ?auto_59992 ?auto_59991 ) ) ( not ( = ?auto_59992 ?auto_59988 ) ) ( not ( = ?auto_59993 ?auto_59991 ) ) ( not ( = ?auto_59993 ?auto_59988 ) ) ( ON ?auto_59988 ?auto_59994 ) ( CLEAR ?auto_59988 ) ( HAND-EMPTY ) ( not ( = ?auto_59988 ?auto_59994 ) ) ( not ( = ?auto_59991 ?auto_59994 ) ) ( not ( = ?auto_59990 ?auto_59994 ) ) ( not ( = ?auto_59989 ?auto_59994 ) ) ( not ( = ?auto_59992 ?auto_59994 ) ) ( not ( = ?auto_59993 ?auto_59994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59988 ?auto_59994 )
      ( MAKE-1PILE ?auto_59988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59995 - BLOCK
    )
    :vars
    (
      ?auto_60001 - BLOCK
      ?auto_60000 - BLOCK
      ?auto_59998 - BLOCK
      ?auto_59996 - BLOCK
      ?auto_59999 - BLOCK
      ?auto_59997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59995 ?auto_60001 ) ) ( ON-TABLE ?auto_60000 ) ( ON ?auto_59998 ?auto_60000 ) ( ON ?auto_59996 ?auto_59998 ) ( ON ?auto_59999 ?auto_59996 ) ( not ( = ?auto_60000 ?auto_59998 ) ) ( not ( = ?auto_60000 ?auto_59996 ) ) ( not ( = ?auto_60000 ?auto_59999 ) ) ( not ( = ?auto_60000 ?auto_60001 ) ) ( not ( = ?auto_60000 ?auto_59995 ) ) ( not ( = ?auto_59998 ?auto_59996 ) ) ( not ( = ?auto_59998 ?auto_59999 ) ) ( not ( = ?auto_59998 ?auto_60001 ) ) ( not ( = ?auto_59998 ?auto_59995 ) ) ( not ( = ?auto_59996 ?auto_59999 ) ) ( not ( = ?auto_59996 ?auto_60001 ) ) ( not ( = ?auto_59996 ?auto_59995 ) ) ( not ( = ?auto_59999 ?auto_60001 ) ) ( not ( = ?auto_59999 ?auto_59995 ) ) ( ON ?auto_59995 ?auto_59997 ) ( CLEAR ?auto_59995 ) ( not ( = ?auto_59995 ?auto_59997 ) ) ( not ( = ?auto_60001 ?auto_59997 ) ) ( not ( = ?auto_60000 ?auto_59997 ) ) ( not ( = ?auto_59998 ?auto_59997 ) ) ( not ( = ?auto_59996 ?auto_59997 ) ) ( not ( = ?auto_59999 ?auto_59997 ) ) ( HOLDING ?auto_60001 ) ( CLEAR ?auto_59999 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60000 ?auto_59998 ?auto_59996 ?auto_59999 ?auto_60001 )
      ( MAKE-1PILE ?auto_59995 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60002 - BLOCK
    )
    :vars
    (
      ?auto_60003 - BLOCK
      ?auto_60007 - BLOCK
      ?auto_60006 - BLOCK
      ?auto_60004 - BLOCK
      ?auto_60005 - BLOCK
      ?auto_60008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60002 ?auto_60003 ) ) ( ON-TABLE ?auto_60007 ) ( ON ?auto_60006 ?auto_60007 ) ( ON ?auto_60004 ?auto_60006 ) ( ON ?auto_60005 ?auto_60004 ) ( not ( = ?auto_60007 ?auto_60006 ) ) ( not ( = ?auto_60007 ?auto_60004 ) ) ( not ( = ?auto_60007 ?auto_60005 ) ) ( not ( = ?auto_60007 ?auto_60003 ) ) ( not ( = ?auto_60007 ?auto_60002 ) ) ( not ( = ?auto_60006 ?auto_60004 ) ) ( not ( = ?auto_60006 ?auto_60005 ) ) ( not ( = ?auto_60006 ?auto_60003 ) ) ( not ( = ?auto_60006 ?auto_60002 ) ) ( not ( = ?auto_60004 ?auto_60005 ) ) ( not ( = ?auto_60004 ?auto_60003 ) ) ( not ( = ?auto_60004 ?auto_60002 ) ) ( not ( = ?auto_60005 ?auto_60003 ) ) ( not ( = ?auto_60005 ?auto_60002 ) ) ( ON ?auto_60002 ?auto_60008 ) ( not ( = ?auto_60002 ?auto_60008 ) ) ( not ( = ?auto_60003 ?auto_60008 ) ) ( not ( = ?auto_60007 ?auto_60008 ) ) ( not ( = ?auto_60006 ?auto_60008 ) ) ( not ( = ?auto_60004 ?auto_60008 ) ) ( not ( = ?auto_60005 ?auto_60008 ) ) ( CLEAR ?auto_60005 ) ( ON ?auto_60003 ?auto_60002 ) ( CLEAR ?auto_60003 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60008 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60008 ?auto_60002 )
      ( MAKE-1PILE ?auto_60002 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60009 - BLOCK
    )
    :vars
    (
      ?auto_60015 - BLOCK
      ?auto_60013 - BLOCK
      ?auto_60011 - BLOCK
      ?auto_60010 - BLOCK
      ?auto_60012 - BLOCK
      ?auto_60014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60009 ?auto_60015 ) ) ( ON-TABLE ?auto_60013 ) ( ON ?auto_60011 ?auto_60013 ) ( ON ?auto_60010 ?auto_60011 ) ( not ( = ?auto_60013 ?auto_60011 ) ) ( not ( = ?auto_60013 ?auto_60010 ) ) ( not ( = ?auto_60013 ?auto_60012 ) ) ( not ( = ?auto_60013 ?auto_60015 ) ) ( not ( = ?auto_60013 ?auto_60009 ) ) ( not ( = ?auto_60011 ?auto_60010 ) ) ( not ( = ?auto_60011 ?auto_60012 ) ) ( not ( = ?auto_60011 ?auto_60015 ) ) ( not ( = ?auto_60011 ?auto_60009 ) ) ( not ( = ?auto_60010 ?auto_60012 ) ) ( not ( = ?auto_60010 ?auto_60015 ) ) ( not ( = ?auto_60010 ?auto_60009 ) ) ( not ( = ?auto_60012 ?auto_60015 ) ) ( not ( = ?auto_60012 ?auto_60009 ) ) ( ON ?auto_60009 ?auto_60014 ) ( not ( = ?auto_60009 ?auto_60014 ) ) ( not ( = ?auto_60015 ?auto_60014 ) ) ( not ( = ?auto_60013 ?auto_60014 ) ) ( not ( = ?auto_60011 ?auto_60014 ) ) ( not ( = ?auto_60010 ?auto_60014 ) ) ( not ( = ?auto_60012 ?auto_60014 ) ) ( ON ?auto_60015 ?auto_60009 ) ( CLEAR ?auto_60015 ) ( ON-TABLE ?auto_60014 ) ( HOLDING ?auto_60012 ) ( CLEAR ?auto_60010 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60013 ?auto_60011 ?auto_60010 ?auto_60012 )
      ( MAKE-1PILE ?auto_60009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60016 - BLOCK
    )
    :vars
    (
      ?auto_60018 - BLOCK
      ?auto_60021 - BLOCK
      ?auto_60017 - BLOCK
      ?auto_60019 - BLOCK
      ?auto_60022 - BLOCK
      ?auto_60020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60016 ?auto_60018 ) ) ( ON-TABLE ?auto_60021 ) ( ON ?auto_60017 ?auto_60021 ) ( ON ?auto_60019 ?auto_60017 ) ( not ( = ?auto_60021 ?auto_60017 ) ) ( not ( = ?auto_60021 ?auto_60019 ) ) ( not ( = ?auto_60021 ?auto_60022 ) ) ( not ( = ?auto_60021 ?auto_60018 ) ) ( not ( = ?auto_60021 ?auto_60016 ) ) ( not ( = ?auto_60017 ?auto_60019 ) ) ( not ( = ?auto_60017 ?auto_60022 ) ) ( not ( = ?auto_60017 ?auto_60018 ) ) ( not ( = ?auto_60017 ?auto_60016 ) ) ( not ( = ?auto_60019 ?auto_60022 ) ) ( not ( = ?auto_60019 ?auto_60018 ) ) ( not ( = ?auto_60019 ?auto_60016 ) ) ( not ( = ?auto_60022 ?auto_60018 ) ) ( not ( = ?auto_60022 ?auto_60016 ) ) ( ON ?auto_60016 ?auto_60020 ) ( not ( = ?auto_60016 ?auto_60020 ) ) ( not ( = ?auto_60018 ?auto_60020 ) ) ( not ( = ?auto_60021 ?auto_60020 ) ) ( not ( = ?auto_60017 ?auto_60020 ) ) ( not ( = ?auto_60019 ?auto_60020 ) ) ( not ( = ?auto_60022 ?auto_60020 ) ) ( ON ?auto_60018 ?auto_60016 ) ( ON-TABLE ?auto_60020 ) ( CLEAR ?auto_60019 ) ( ON ?auto_60022 ?auto_60018 ) ( CLEAR ?auto_60022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60020 ?auto_60016 ?auto_60018 )
      ( MAKE-1PILE ?auto_60016 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60023 - BLOCK
    )
    :vars
    (
      ?auto_60025 - BLOCK
      ?auto_60029 - BLOCK
      ?auto_60027 - BLOCK
      ?auto_60028 - BLOCK
      ?auto_60026 - BLOCK
      ?auto_60024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60023 ?auto_60025 ) ) ( ON-TABLE ?auto_60029 ) ( ON ?auto_60027 ?auto_60029 ) ( not ( = ?auto_60029 ?auto_60027 ) ) ( not ( = ?auto_60029 ?auto_60028 ) ) ( not ( = ?auto_60029 ?auto_60026 ) ) ( not ( = ?auto_60029 ?auto_60025 ) ) ( not ( = ?auto_60029 ?auto_60023 ) ) ( not ( = ?auto_60027 ?auto_60028 ) ) ( not ( = ?auto_60027 ?auto_60026 ) ) ( not ( = ?auto_60027 ?auto_60025 ) ) ( not ( = ?auto_60027 ?auto_60023 ) ) ( not ( = ?auto_60028 ?auto_60026 ) ) ( not ( = ?auto_60028 ?auto_60025 ) ) ( not ( = ?auto_60028 ?auto_60023 ) ) ( not ( = ?auto_60026 ?auto_60025 ) ) ( not ( = ?auto_60026 ?auto_60023 ) ) ( ON ?auto_60023 ?auto_60024 ) ( not ( = ?auto_60023 ?auto_60024 ) ) ( not ( = ?auto_60025 ?auto_60024 ) ) ( not ( = ?auto_60029 ?auto_60024 ) ) ( not ( = ?auto_60027 ?auto_60024 ) ) ( not ( = ?auto_60028 ?auto_60024 ) ) ( not ( = ?auto_60026 ?auto_60024 ) ) ( ON ?auto_60025 ?auto_60023 ) ( ON-TABLE ?auto_60024 ) ( ON ?auto_60026 ?auto_60025 ) ( CLEAR ?auto_60026 ) ( HOLDING ?auto_60028 ) ( CLEAR ?auto_60027 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60029 ?auto_60027 ?auto_60028 )
      ( MAKE-1PILE ?auto_60023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60030 - BLOCK
    )
    :vars
    (
      ?auto_60033 - BLOCK
      ?auto_60032 - BLOCK
      ?auto_60035 - BLOCK
      ?auto_60031 - BLOCK
      ?auto_60034 - BLOCK
      ?auto_60036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60030 ?auto_60033 ) ) ( ON-TABLE ?auto_60032 ) ( ON ?auto_60035 ?auto_60032 ) ( not ( = ?auto_60032 ?auto_60035 ) ) ( not ( = ?auto_60032 ?auto_60031 ) ) ( not ( = ?auto_60032 ?auto_60034 ) ) ( not ( = ?auto_60032 ?auto_60033 ) ) ( not ( = ?auto_60032 ?auto_60030 ) ) ( not ( = ?auto_60035 ?auto_60031 ) ) ( not ( = ?auto_60035 ?auto_60034 ) ) ( not ( = ?auto_60035 ?auto_60033 ) ) ( not ( = ?auto_60035 ?auto_60030 ) ) ( not ( = ?auto_60031 ?auto_60034 ) ) ( not ( = ?auto_60031 ?auto_60033 ) ) ( not ( = ?auto_60031 ?auto_60030 ) ) ( not ( = ?auto_60034 ?auto_60033 ) ) ( not ( = ?auto_60034 ?auto_60030 ) ) ( ON ?auto_60030 ?auto_60036 ) ( not ( = ?auto_60030 ?auto_60036 ) ) ( not ( = ?auto_60033 ?auto_60036 ) ) ( not ( = ?auto_60032 ?auto_60036 ) ) ( not ( = ?auto_60035 ?auto_60036 ) ) ( not ( = ?auto_60031 ?auto_60036 ) ) ( not ( = ?auto_60034 ?auto_60036 ) ) ( ON ?auto_60033 ?auto_60030 ) ( ON-TABLE ?auto_60036 ) ( ON ?auto_60034 ?auto_60033 ) ( CLEAR ?auto_60035 ) ( ON ?auto_60031 ?auto_60034 ) ( CLEAR ?auto_60031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60036 ?auto_60030 ?auto_60033 ?auto_60034 )
      ( MAKE-1PILE ?auto_60030 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60037 - BLOCK
    )
    :vars
    (
      ?auto_60041 - BLOCK
      ?auto_60043 - BLOCK
      ?auto_60040 - BLOCK
      ?auto_60039 - BLOCK
      ?auto_60038 - BLOCK
      ?auto_60042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60037 ?auto_60041 ) ) ( ON-TABLE ?auto_60043 ) ( not ( = ?auto_60043 ?auto_60040 ) ) ( not ( = ?auto_60043 ?auto_60039 ) ) ( not ( = ?auto_60043 ?auto_60038 ) ) ( not ( = ?auto_60043 ?auto_60041 ) ) ( not ( = ?auto_60043 ?auto_60037 ) ) ( not ( = ?auto_60040 ?auto_60039 ) ) ( not ( = ?auto_60040 ?auto_60038 ) ) ( not ( = ?auto_60040 ?auto_60041 ) ) ( not ( = ?auto_60040 ?auto_60037 ) ) ( not ( = ?auto_60039 ?auto_60038 ) ) ( not ( = ?auto_60039 ?auto_60041 ) ) ( not ( = ?auto_60039 ?auto_60037 ) ) ( not ( = ?auto_60038 ?auto_60041 ) ) ( not ( = ?auto_60038 ?auto_60037 ) ) ( ON ?auto_60037 ?auto_60042 ) ( not ( = ?auto_60037 ?auto_60042 ) ) ( not ( = ?auto_60041 ?auto_60042 ) ) ( not ( = ?auto_60043 ?auto_60042 ) ) ( not ( = ?auto_60040 ?auto_60042 ) ) ( not ( = ?auto_60039 ?auto_60042 ) ) ( not ( = ?auto_60038 ?auto_60042 ) ) ( ON ?auto_60041 ?auto_60037 ) ( ON-TABLE ?auto_60042 ) ( ON ?auto_60038 ?auto_60041 ) ( ON ?auto_60039 ?auto_60038 ) ( CLEAR ?auto_60039 ) ( HOLDING ?auto_60040 ) ( CLEAR ?auto_60043 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60043 ?auto_60040 )
      ( MAKE-1PILE ?auto_60037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60044 - BLOCK
    )
    :vars
    (
      ?auto_60047 - BLOCK
      ?auto_60048 - BLOCK
      ?auto_60049 - BLOCK
      ?auto_60050 - BLOCK
      ?auto_60046 - BLOCK
      ?auto_60045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60044 ?auto_60047 ) ) ( ON-TABLE ?auto_60048 ) ( not ( = ?auto_60048 ?auto_60049 ) ) ( not ( = ?auto_60048 ?auto_60050 ) ) ( not ( = ?auto_60048 ?auto_60046 ) ) ( not ( = ?auto_60048 ?auto_60047 ) ) ( not ( = ?auto_60048 ?auto_60044 ) ) ( not ( = ?auto_60049 ?auto_60050 ) ) ( not ( = ?auto_60049 ?auto_60046 ) ) ( not ( = ?auto_60049 ?auto_60047 ) ) ( not ( = ?auto_60049 ?auto_60044 ) ) ( not ( = ?auto_60050 ?auto_60046 ) ) ( not ( = ?auto_60050 ?auto_60047 ) ) ( not ( = ?auto_60050 ?auto_60044 ) ) ( not ( = ?auto_60046 ?auto_60047 ) ) ( not ( = ?auto_60046 ?auto_60044 ) ) ( ON ?auto_60044 ?auto_60045 ) ( not ( = ?auto_60044 ?auto_60045 ) ) ( not ( = ?auto_60047 ?auto_60045 ) ) ( not ( = ?auto_60048 ?auto_60045 ) ) ( not ( = ?auto_60049 ?auto_60045 ) ) ( not ( = ?auto_60050 ?auto_60045 ) ) ( not ( = ?auto_60046 ?auto_60045 ) ) ( ON ?auto_60047 ?auto_60044 ) ( ON-TABLE ?auto_60045 ) ( ON ?auto_60046 ?auto_60047 ) ( ON ?auto_60050 ?auto_60046 ) ( CLEAR ?auto_60048 ) ( ON ?auto_60049 ?auto_60050 ) ( CLEAR ?auto_60049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60045 ?auto_60044 ?auto_60047 ?auto_60046 ?auto_60050 )
      ( MAKE-1PILE ?auto_60044 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60051 - BLOCK
    )
    :vars
    (
      ?auto_60053 - BLOCK
      ?auto_60056 - BLOCK
      ?auto_60057 - BLOCK
      ?auto_60054 - BLOCK
      ?auto_60052 - BLOCK
      ?auto_60055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60051 ?auto_60053 ) ) ( not ( = ?auto_60056 ?auto_60057 ) ) ( not ( = ?auto_60056 ?auto_60054 ) ) ( not ( = ?auto_60056 ?auto_60052 ) ) ( not ( = ?auto_60056 ?auto_60053 ) ) ( not ( = ?auto_60056 ?auto_60051 ) ) ( not ( = ?auto_60057 ?auto_60054 ) ) ( not ( = ?auto_60057 ?auto_60052 ) ) ( not ( = ?auto_60057 ?auto_60053 ) ) ( not ( = ?auto_60057 ?auto_60051 ) ) ( not ( = ?auto_60054 ?auto_60052 ) ) ( not ( = ?auto_60054 ?auto_60053 ) ) ( not ( = ?auto_60054 ?auto_60051 ) ) ( not ( = ?auto_60052 ?auto_60053 ) ) ( not ( = ?auto_60052 ?auto_60051 ) ) ( ON ?auto_60051 ?auto_60055 ) ( not ( = ?auto_60051 ?auto_60055 ) ) ( not ( = ?auto_60053 ?auto_60055 ) ) ( not ( = ?auto_60056 ?auto_60055 ) ) ( not ( = ?auto_60057 ?auto_60055 ) ) ( not ( = ?auto_60054 ?auto_60055 ) ) ( not ( = ?auto_60052 ?auto_60055 ) ) ( ON ?auto_60053 ?auto_60051 ) ( ON-TABLE ?auto_60055 ) ( ON ?auto_60052 ?auto_60053 ) ( ON ?auto_60054 ?auto_60052 ) ( ON ?auto_60057 ?auto_60054 ) ( CLEAR ?auto_60057 ) ( HOLDING ?auto_60056 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60056 )
      ( MAKE-1PILE ?auto_60051 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60058 - BLOCK
    )
    :vars
    (
      ?auto_60059 - BLOCK
      ?auto_60064 - BLOCK
      ?auto_60063 - BLOCK
      ?auto_60060 - BLOCK
      ?auto_60061 - BLOCK
      ?auto_60062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60058 ?auto_60059 ) ) ( not ( = ?auto_60064 ?auto_60063 ) ) ( not ( = ?auto_60064 ?auto_60060 ) ) ( not ( = ?auto_60064 ?auto_60061 ) ) ( not ( = ?auto_60064 ?auto_60059 ) ) ( not ( = ?auto_60064 ?auto_60058 ) ) ( not ( = ?auto_60063 ?auto_60060 ) ) ( not ( = ?auto_60063 ?auto_60061 ) ) ( not ( = ?auto_60063 ?auto_60059 ) ) ( not ( = ?auto_60063 ?auto_60058 ) ) ( not ( = ?auto_60060 ?auto_60061 ) ) ( not ( = ?auto_60060 ?auto_60059 ) ) ( not ( = ?auto_60060 ?auto_60058 ) ) ( not ( = ?auto_60061 ?auto_60059 ) ) ( not ( = ?auto_60061 ?auto_60058 ) ) ( ON ?auto_60058 ?auto_60062 ) ( not ( = ?auto_60058 ?auto_60062 ) ) ( not ( = ?auto_60059 ?auto_60062 ) ) ( not ( = ?auto_60064 ?auto_60062 ) ) ( not ( = ?auto_60063 ?auto_60062 ) ) ( not ( = ?auto_60060 ?auto_60062 ) ) ( not ( = ?auto_60061 ?auto_60062 ) ) ( ON ?auto_60059 ?auto_60058 ) ( ON-TABLE ?auto_60062 ) ( ON ?auto_60061 ?auto_60059 ) ( ON ?auto_60060 ?auto_60061 ) ( ON ?auto_60063 ?auto_60060 ) ( ON ?auto_60064 ?auto_60063 ) ( CLEAR ?auto_60064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60062 ?auto_60058 ?auto_60059 ?auto_60061 ?auto_60060 ?auto_60063 )
      ( MAKE-1PILE ?auto_60058 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60069 - BLOCK
      ?auto_60070 - BLOCK
      ?auto_60071 - BLOCK
      ?auto_60072 - BLOCK
    )
    :vars
    (
      ?auto_60073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60073 ?auto_60072 ) ( CLEAR ?auto_60073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60069 ) ( ON ?auto_60070 ?auto_60069 ) ( ON ?auto_60071 ?auto_60070 ) ( ON ?auto_60072 ?auto_60071 ) ( not ( = ?auto_60069 ?auto_60070 ) ) ( not ( = ?auto_60069 ?auto_60071 ) ) ( not ( = ?auto_60069 ?auto_60072 ) ) ( not ( = ?auto_60069 ?auto_60073 ) ) ( not ( = ?auto_60070 ?auto_60071 ) ) ( not ( = ?auto_60070 ?auto_60072 ) ) ( not ( = ?auto_60070 ?auto_60073 ) ) ( not ( = ?auto_60071 ?auto_60072 ) ) ( not ( = ?auto_60071 ?auto_60073 ) ) ( not ( = ?auto_60072 ?auto_60073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60073 ?auto_60072 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60074 - BLOCK
      ?auto_60075 - BLOCK
      ?auto_60076 - BLOCK
      ?auto_60077 - BLOCK
    )
    :vars
    (
      ?auto_60078 - BLOCK
      ?auto_60079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60078 ?auto_60077 ) ( CLEAR ?auto_60078 ) ( ON-TABLE ?auto_60074 ) ( ON ?auto_60075 ?auto_60074 ) ( ON ?auto_60076 ?auto_60075 ) ( ON ?auto_60077 ?auto_60076 ) ( not ( = ?auto_60074 ?auto_60075 ) ) ( not ( = ?auto_60074 ?auto_60076 ) ) ( not ( = ?auto_60074 ?auto_60077 ) ) ( not ( = ?auto_60074 ?auto_60078 ) ) ( not ( = ?auto_60075 ?auto_60076 ) ) ( not ( = ?auto_60075 ?auto_60077 ) ) ( not ( = ?auto_60075 ?auto_60078 ) ) ( not ( = ?auto_60076 ?auto_60077 ) ) ( not ( = ?auto_60076 ?auto_60078 ) ) ( not ( = ?auto_60077 ?auto_60078 ) ) ( HOLDING ?auto_60079 ) ( not ( = ?auto_60074 ?auto_60079 ) ) ( not ( = ?auto_60075 ?auto_60079 ) ) ( not ( = ?auto_60076 ?auto_60079 ) ) ( not ( = ?auto_60077 ?auto_60079 ) ) ( not ( = ?auto_60078 ?auto_60079 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_60079 )
      ( MAKE-4PILE ?auto_60074 ?auto_60075 ?auto_60076 ?auto_60077 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60080 - BLOCK
      ?auto_60081 - BLOCK
      ?auto_60082 - BLOCK
      ?auto_60083 - BLOCK
    )
    :vars
    (
      ?auto_60084 - BLOCK
      ?auto_60085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60084 ?auto_60083 ) ( ON-TABLE ?auto_60080 ) ( ON ?auto_60081 ?auto_60080 ) ( ON ?auto_60082 ?auto_60081 ) ( ON ?auto_60083 ?auto_60082 ) ( not ( = ?auto_60080 ?auto_60081 ) ) ( not ( = ?auto_60080 ?auto_60082 ) ) ( not ( = ?auto_60080 ?auto_60083 ) ) ( not ( = ?auto_60080 ?auto_60084 ) ) ( not ( = ?auto_60081 ?auto_60082 ) ) ( not ( = ?auto_60081 ?auto_60083 ) ) ( not ( = ?auto_60081 ?auto_60084 ) ) ( not ( = ?auto_60082 ?auto_60083 ) ) ( not ( = ?auto_60082 ?auto_60084 ) ) ( not ( = ?auto_60083 ?auto_60084 ) ) ( not ( = ?auto_60080 ?auto_60085 ) ) ( not ( = ?auto_60081 ?auto_60085 ) ) ( not ( = ?auto_60082 ?auto_60085 ) ) ( not ( = ?auto_60083 ?auto_60085 ) ) ( not ( = ?auto_60084 ?auto_60085 ) ) ( ON ?auto_60085 ?auto_60084 ) ( CLEAR ?auto_60085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60080 ?auto_60081 ?auto_60082 ?auto_60083 ?auto_60084 )
      ( MAKE-4PILE ?auto_60080 ?auto_60081 ?auto_60082 ?auto_60083 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60086 - BLOCK
      ?auto_60087 - BLOCK
      ?auto_60088 - BLOCK
      ?auto_60089 - BLOCK
    )
    :vars
    (
      ?auto_60091 - BLOCK
      ?auto_60090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60091 ?auto_60089 ) ( ON-TABLE ?auto_60086 ) ( ON ?auto_60087 ?auto_60086 ) ( ON ?auto_60088 ?auto_60087 ) ( ON ?auto_60089 ?auto_60088 ) ( not ( = ?auto_60086 ?auto_60087 ) ) ( not ( = ?auto_60086 ?auto_60088 ) ) ( not ( = ?auto_60086 ?auto_60089 ) ) ( not ( = ?auto_60086 ?auto_60091 ) ) ( not ( = ?auto_60087 ?auto_60088 ) ) ( not ( = ?auto_60087 ?auto_60089 ) ) ( not ( = ?auto_60087 ?auto_60091 ) ) ( not ( = ?auto_60088 ?auto_60089 ) ) ( not ( = ?auto_60088 ?auto_60091 ) ) ( not ( = ?auto_60089 ?auto_60091 ) ) ( not ( = ?auto_60086 ?auto_60090 ) ) ( not ( = ?auto_60087 ?auto_60090 ) ) ( not ( = ?auto_60088 ?auto_60090 ) ) ( not ( = ?auto_60089 ?auto_60090 ) ) ( not ( = ?auto_60091 ?auto_60090 ) ) ( HOLDING ?auto_60090 ) ( CLEAR ?auto_60091 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60086 ?auto_60087 ?auto_60088 ?auto_60089 ?auto_60091 ?auto_60090 )
      ( MAKE-4PILE ?auto_60086 ?auto_60087 ?auto_60088 ?auto_60089 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60092 - BLOCK
      ?auto_60093 - BLOCK
      ?auto_60094 - BLOCK
      ?auto_60095 - BLOCK
    )
    :vars
    (
      ?auto_60096 - BLOCK
      ?auto_60097 - BLOCK
      ?auto_60098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60096 ?auto_60095 ) ( ON-TABLE ?auto_60092 ) ( ON ?auto_60093 ?auto_60092 ) ( ON ?auto_60094 ?auto_60093 ) ( ON ?auto_60095 ?auto_60094 ) ( not ( = ?auto_60092 ?auto_60093 ) ) ( not ( = ?auto_60092 ?auto_60094 ) ) ( not ( = ?auto_60092 ?auto_60095 ) ) ( not ( = ?auto_60092 ?auto_60096 ) ) ( not ( = ?auto_60093 ?auto_60094 ) ) ( not ( = ?auto_60093 ?auto_60095 ) ) ( not ( = ?auto_60093 ?auto_60096 ) ) ( not ( = ?auto_60094 ?auto_60095 ) ) ( not ( = ?auto_60094 ?auto_60096 ) ) ( not ( = ?auto_60095 ?auto_60096 ) ) ( not ( = ?auto_60092 ?auto_60097 ) ) ( not ( = ?auto_60093 ?auto_60097 ) ) ( not ( = ?auto_60094 ?auto_60097 ) ) ( not ( = ?auto_60095 ?auto_60097 ) ) ( not ( = ?auto_60096 ?auto_60097 ) ) ( CLEAR ?auto_60096 ) ( ON ?auto_60097 ?auto_60098 ) ( CLEAR ?auto_60097 ) ( HAND-EMPTY ) ( not ( = ?auto_60092 ?auto_60098 ) ) ( not ( = ?auto_60093 ?auto_60098 ) ) ( not ( = ?auto_60094 ?auto_60098 ) ) ( not ( = ?auto_60095 ?auto_60098 ) ) ( not ( = ?auto_60096 ?auto_60098 ) ) ( not ( = ?auto_60097 ?auto_60098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60097 ?auto_60098 )
      ( MAKE-4PILE ?auto_60092 ?auto_60093 ?auto_60094 ?auto_60095 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60113 - BLOCK
      ?auto_60114 - BLOCK
      ?auto_60115 - BLOCK
      ?auto_60116 - BLOCK
    )
    :vars
    (
      ?auto_60118 - BLOCK
      ?auto_60117 - BLOCK
      ?auto_60119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60113 ) ( ON ?auto_60114 ?auto_60113 ) ( ON ?auto_60115 ?auto_60114 ) ( not ( = ?auto_60113 ?auto_60114 ) ) ( not ( = ?auto_60113 ?auto_60115 ) ) ( not ( = ?auto_60113 ?auto_60116 ) ) ( not ( = ?auto_60113 ?auto_60118 ) ) ( not ( = ?auto_60114 ?auto_60115 ) ) ( not ( = ?auto_60114 ?auto_60116 ) ) ( not ( = ?auto_60114 ?auto_60118 ) ) ( not ( = ?auto_60115 ?auto_60116 ) ) ( not ( = ?auto_60115 ?auto_60118 ) ) ( not ( = ?auto_60116 ?auto_60118 ) ) ( not ( = ?auto_60113 ?auto_60117 ) ) ( not ( = ?auto_60114 ?auto_60117 ) ) ( not ( = ?auto_60115 ?auto_60117 ) ) ( not ( = ?auto_60116 ?auto_60117 ) ) ( not ( = ?auto_60118 ?auto_60117 ) ) ( ON ?auto_60117 ?auto_60119 ) ( not ( = ?auto_60113 ?auto_60119 ) ) ( not ( = ?auto_60114 ?auto_60119 ) ) ( not ( = ?auto_60115 ?auto_60119 ) ) ( not ( = ?auto_60116 ?auto_60119 ) ) ( not ( = ?auto_60118 ?auto_60119 ) ) ( not ( = ?auto_60117 ?auto_60119 ) ) ( ON ?auto_60118 ?auto_60117 ) ( CLEAR ?auto_60118 ) ( HOLDING ?auto_60116 ) ( CLEAR ?auto_60115 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60113 ?auto_60114 ?auto_60115 ?auto_60116 ?auto_60118 )
      ( MAKE-4PILE ?auto_60113 ?auto_60114 ?auto_60115 ?auto_60116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60120 - BLOCK
      ?auto_60121 - BLOCK
      ?auto_60122 - BLOCK
      ?auto_60123 - BLOCK
    )
    :vars
    (
      ?auto_60125 - BLOCK
      ?auto_60126 - BLOCK
      ?auto_60124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60120 ) ( ON ?auto_60121 ?auto_60120 ) ( ON ?auto_60122 ?auto_60121 ) ( not ( = ?auto_60120 ?auto_60121 ) ) ( not ( = ?auto_60120 ?auto_60122 ) ) ( not ( = ?auto_60120 ?auto_60123 ) ) ( not ( = ?auto_60120 ?auto_60125 ) ) ( not ( = ?auto_60121 ?auto_60122 ) ) ( not ( = ?auto_60121 ?auto_60123 ) ) ( not ( = ?auto_60121 ?auto_60125 ) ) ( not ( = ?auto_60122 ?auto_60123 ) ) ( not ( = ?auto_60122 ?auto_60125 ) ) ( not ( = ?auto_60123 ?auto_60125 ) ) ( not ( = ?auto_60120 ?auto_60126 ) ) ( not ( = ?auto_60121 ?auto_60126 ) ) ( not ( = ?auto_60122 ?auto_60126 ) ) ( not ( = ?auto_60123 ?auto_60126 ) ) ( not ( = ?auto_60125 ?auto_60126 ) ) ( ON ?auto_60126 ?auto_60124 ) ( not ( = ?auto_60120 ?auto_60124 ) ) ( not ( = ?auto_60121 ?auto_60124 ) ) ( not ( = ?auto_60122 ?auto_60124 ) ) ( not ( = ?auto_60123 ?auto_60124 ) ) ( not ( = ?auto_60125 ?auto_60124 ) ) ( not ( = ?auto_60126 ?auto_60124 ) ) ( ON ?auto_60125 ?auto_60126 ) ( CLEAR ?auto_60122 ) ( ON ?auto_60123 ?auto_60125 ) ( CLEAR ?auto_60123 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60124 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60124 ?auto_60126 ?auto_60125 )
      ( MAKE-4PILE ?auto_60120 ?auto_60121 ?auto_60122 ?auto_60123 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60127 - BLOCK
      ?auto_60128 - BLOCK
      ?auto_60129 - BLOCK
      ?auto_60130 - BLOCK
    )
    :vars
    (
      ?auto_60131 - BLOCK
      ?auto_60133 - BLOCK
      ?auto_60132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60127 ) ( ON ?auto_60128 ?auto_60127 ) ( not ( = ?auto_60127 ?auto_60128 ) ) ( not ( = ?auto_60127 ?auto_60129 ) ) ( not ( = ?auto_60127 ?auto_60130 ) ) ( not ( = ?auto_60127 ?auto_60131 ) ) ( not ( = ?auto_60128 ?auto_60129 ) ) ( not ( = ?auto_60128 ?auto_60130 ) ) ( not ( = ?auto_60128 ?auto_60131 ) ) ( not ( = ?auto_60129 ?auto_60130 ) ) ( not ( = ?auto_60129 ?auto_60131 ) ) ( not ( = ?auto_60130 ?auto_60131 ) ) ( not ( = ?auto_60127 ?auto_60133 ) ) ( not ( = ?auto_60128 ?auto_60133 ) ) ( not ( = ?auto_60129 ?auto_60133 ) ) ( not ( = ?auto_60130 ?auto_60133 ) ) ( not ( = ?auto_60131 ?auto_60133 ) ) ( ON ?auto_60133 ?auto_60132 ) ( not ( = ?auto_60127 ?auto_60132 ) ) ( not ( = ?auto_60128 ?auto_60132 ) ) ( not ( = ?auto_60129 ?auto_60132 ) ) ( not ( = ?auto_60130 ?auto_60132 ) ) ( not ( = ?auto_60131 ?auto_60132 ) ) ( not ( = ?auto_60133 ?auto_60132 ) ) ( ON ?auto_60131 ?auto_60133 ) ( ON ?auto_60130 ?auto_60131 ) ( CLEAR ?auto_60130 ) ( ON-TABLE ?auto_60132 ) ( HOLDING ?auto_60129 ) ( CLEAR ?auto_60128 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60127 ?auto_60128 ?auto_60129 )
      ( MAKE-4PILE ?auto_60127 ?auto_60128 ?auto_60129 ?auto_60130 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60134 - BLOCK
      ?auto_60135 - BLOCK
      ?auto_60136 - BLOCK
      ?auto_60137 - BLOCK
    )
    :vars
    (
      ?auto_60138 - BLOCK
      ?auto_60139 - BLOCK
      ?auto_60140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60134 ) ( ON ?auto_60135 ?auto_60134 ) ( not ( = ?auto_60134 ?auto_60135 ) ) ( not ( = ?auto_60134 ?auto_60136 ) ) ( not ( = ?auto_60134 ?auto_60137 ) ) ( not ( = ?auto_60134 ?auto_60138 ) ) ( not ( = ?auto_60135 ?auto_60136 ) ) ( not ( = ?auto_60135 ?auto_60137 ) ) ( not ( = ?auto_60135 ?auto_60138 ) ) ( not ( = ?auto_60136 ?auto_60137 ) ) ( not ( = ?auto_60136 ?auto_60138 ) ) ( not ( = ?auto_60137 ?auto_60138 ) ) ( not ( = ?auto_60134 ?auto_60139 ) ) ( not ( = ?auto_60135 ?auto_60139 ) ) ( not ( = ?auto_60136 ?auto_60139 ) ) ( not ( = ?auto_60137 ?auto_60139 ) ) ( not ( = ?auto_60138 ?auto_60139 ) ) ( ON ?auto_60139 ?auto_60140 ) ( not ( = ?auto_60134 ?auto_60140 ) ) ( not ( = ?auto_60135 ?auto_60140 ) ) ( not ( = ?auto_60136 ?auto_60140 ) ) ( not ( = ?auto_60137 ?auto_60140 ) ) ( not ( = ?auto_60138 ?auto_60140 ) ) ( not ( = ?auto_60139 ?auto_60140 ) ) ( ON ?auto_60138 ?auto_60139 ) ( ON ?auto_60137 ?auto_60138 ) ( ON-TABLE ?auto_60140 ) ( CLEAR ?auto_60135 ) ( ON ?auto_60136 ?auto_60137 ) ( CLEAR ?auto_60136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60140 ?auto_60139 ?auto_60138 ?auto_60137 )
      ( MAKE-4PILE ?auto_60134 ?auto_60135 ?auto_60136 ?auto_60137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60141 - BLOCK
      ?auto_60142 - BLOCK
      ?auto_60143 - BLOCK
      ?auto_60144 - BLOCK
    )
    :vars
    (
      ?auto_60145 - BLOCK
      ?auto_60147 - BLOCK
      ?auto_60146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60141 ) ( not ( = ?auto_60141 ?auto_60142 ) ) ( not ( = ?auto_60141 ?auto_60143 ) ) ( not ( = ?auto_60141 ?auto_60144 ) ) ( not ( = ?auto_60141 ?auto_60145 ) ) ( not ( = ?auto_60142 ?auto_60143 ) ) ( not ( = ?auto_60142 ?auto_60144 ) ) ( not ( = ?auto_60142 ?auto_60145 ) ) ( not ( = ?auto_60143 ?auto_60144 ) ) ( not ( = ?auto_60143 ?auto_60145 ) ) ( not ( = ?auto_60144 ?auto_60145 ) ) ( not ( = ?auto_60141 ?auto_60147 ) ) ( not ( = ?auto_60142 ?auto_60147 ) ) ( not ( = ?auto_60143 ?auto_60147 ) ) ( not ( = ?auto_60144 ?auto_60147 ) ) ( not ( = ?auto_60145 ?auto_60147 ) ) ( ON ?auto_60147 ?auto_60146 ) ( not ( = ?auto_60141 ?auto_60146 ) ) ( not ( = ?auto_60142 ?auto_60146 ) ) ( not ( = ?auto_60143 ?auto_60146 ) ) ( not ( = ?auto_60144 ?auto_60146 ) ) ( not ( = ?auto_60145 ?auto_60146 ) ) ( not ( = ?auto_60147 ?auto_60146 ) ) ( ON ?auto_60145 ?auto_60147 ) ( ON ?auto_60144 ?auto_60145 ) ( ON-TABLE ?auto_60146 ) ( ON ?auto_60143 ?auto_60144 ) ( CLEAR ?auto_60143 ) ( HOLDING ?auto_60142 ) ( CLEAR ?auto_60141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60141 ?auto_60142 )
      ( MAKE-4PILE ?auto_60141 ?auto_60142 ?auto_60143 ?auto_60144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60148 - BLOCK
      ?auto_60149 - BLOCK
      ?auto_60150 - BLOCK
      ?auto_60151 - BLOCK
    )
    :vars
    (
      ?auto_60152 - BLOCK
      ?auto_60154 - BLOCK
      ?auto_60153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60148 ) ( not ( = ?auto_60148 ?auto_60149 ) ) ( not ( = ?auto_60148 ?auto_60150 ) ) ( not ( = ?auto_60148 ?auto_60151 ) ) ( not ( = ?auto_60148 ?auto_60152 ) ) ( not ( = ?auto_60149 ?auto_60150 ) ) ( not ( = ?auto_60149 ?auto_60151 ) ) ( not ( = ?auto_60149 ?auto_60152 ) ) ( not ( = ?auto_60150 ?auto_60151 ) ) ( not ( = ?auto_60150 ?auto_60152 ) ) ( not ( = ?auto_60151 ?auto_60152 ) ) ( not ( = ?auto_60148 ?auto_60154 ) ) ( not ( = ?auto_60149 ?auto_60154 ) ) ( not ( = ?auto_60150 ?auto_60154 ) ) ( not ( = ?auto_60151 ?auto_60154 ) ) ( not ( = ?auto_60152 ?auto_60154 ) ) ( ON ?auto_60154 ?auto_60153 ) ( not ( = ?auto_60148 ?auto_60153 ) ) ( not ( = ?auto_60149 ?auto_60153 ) ) ( not ( = ?auto_60150 ?auto_60153 ) ) ( not ( = ?auto_60151 ?auto_60153 ) ) ( not ( = ?auto_60152 ?auto_60153 ) ) ( not ( = ?auto_60154 ?auto_60153 ) ) ( ON ?auto_60152 ?auto_60154 ) ( ON ?auto_60151 ?auto_60152 ) ( ON-TABLE ?auto_60153 ) ( ON ?auto_60150 ?auto_60151 ) ( CLEAR ?auto_60148 ) ( ON ?auto_60149 ?auto_60150 ) ( CLEAR ?auto_60149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60153 ?auto_60154 ?auto_60152 ?auto_60151 ?auto_60150 )
      ( MAKE-4PILE ?auto_60148 ?auto_60149 ?auto_60150 ?auto_60151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60155 - BLOCK
      ?auto_60156 - BLOCK
      ?auto_60157 - BLOCK
      ?auto_60158 - BLOCK
    )
    :vars
    (
      ?auto_60160 - BLOCK
      ?auto_60159 - BLOCK
      ?auto_60161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60155 ?auto_60156 ) ) ( not ( = ?auto_60155 ?auto_60157 ) ) ( not ( = ?auto_60155 ?auto_60158 ) ) ( not ( = ?auto_60155 ?auto_60160 ) ) ( not ( = ?auto_60156 ?auto_60157 ) ) ( not ( = ?auto_60156 ?auto_60158 ) ) ( not ( = ?auto_60156 ?auto_60160 ) ) ( not ( = ?auto_60157 ?auto_60158 ) ) ( not ( = ?auto_60157 ?auto_60160 ) ) ( not ( = ?auto_60158 ?auto_60160 ) ) ( not ( = ?auto_60155 ?auto_60159 ) ) ( not ( = ?auto_60156 ?auto_60159 ) ) ( not ( = ?auto_60157 ?auto_60159 ) ) ( not ( = ?auto_60158 ?auto_60159 ) ) ( not ( = ?auto_60160 ?auto_60159 ) ) ( ON ?auto_60159 ?auto_60161 ) ( not ( = ?auto_60155 ?auto_60161 ) ) ( not ( = ?auto_60156 ?auto_60161 ) ) ( not ( = ?auto_60157 ?auto_60161 ) ) ( not ( = ?auto_60158 ?auto_60161 ) ) ( not ( = ?auto_60160 ?auto_60161 ) ) ( not ( = ?auto_60159 ?auto_60161 ) ) ( ON ?auto_60160 ?auto_60159 ) ( ON ?auto_60158 ?auto_60160 ) ( ON-TABLE ?auto_60161 ) ( ON ?auto_60157 ?auto_60158 ) ( ON ?auto_60156 ?auto_60157 ) ( CLEAR ?auto_60156 ) ( HOLDING ?auto_60155 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60155 )
      ( MAKE-4PILE ?auto_60155 ?auto_60156 ?auto_60157 ?auto_60158 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60162 - BLOCK
      ?auto_60163 - BLOCK
      ?auto_60164 - BLOCK
      ?auto_60165 - BLOCK
    )
    :vars
    (
      ?auto_60168 - BLOCK
      ?auto_60166 - BLOCK
      ?auto_60167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60162 ?auto_60163 ) ) ( not ( = ?auto_60162 ?auto_60164 ) ) ( not ( = ?auto_60162 ?auto_60165 ) ) ( not ( = ?auto_60162 ?auto_60168 ) ) ( not ( = ?auto_60163 ?auto_60164 ) ) ( not ( = ?auto_60163 ?auto_60165 ) ) ( not ( = ?auto_60163 ?auto_60168 ) ) ( not ( = ?auto_60164 ?auto_60165 ) ) ( not ( = ?auto_60164 ?auto_60168 ) ) ( not ( = ?auto_60165 ?auto_60168 ) ) ( not ( = ?auto_60162 ?auto_60166 ) ) ( not ( = ?auto_60163 ?auto_60166 ) ) ( not ( = ?auto_60164 ?auto_60166 ) ) ( not ( = ?auto_60165 ?auto_60166 ) ) ( not ( = ?auto_60168 ?auto_60166 ) ) ( ON ?auto_60166 ?auto_60167 ) ( not ( = ?auto_60162 ?auto_60167 ) ) ( not ( = ?auto_60163 ?auto_60167 ) ) ( not ( = ?auto_60164 ?auto_60167 ) ) ( not ( = ?auto_60165 ?auto_60167 ) ) ( not ( = ?auto_60168 ?auto_60167 ) ) ( not ( = ?auto_60166 ?auto_60167 ) ) ( ON ?auto_60168 ?auto_60166 ) ( ON ?auto_60165 ?auto_60168 ) ( ON-TABLE ?auto_60167 ) ( ON ?auto_60164 ?auto_60165 ) ( ON ?auto_60163 ?auto_60164 ) ( ON ?auto_60162 ?auto_60163 ) ( CLEAR ?auto_60162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60167 ?auto_60166 ?auto_60168 ?auto_60165 ?auto_60164 ?auto_60163 )
      ( MAKE-4PILE ?auto_60162 ?auto_60163 ?auto_60164 ?auto_60165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60171 - BLOCK
      ?auto_60172 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_60172 ) ( CLEAR ?auto_60171 ) ( ON-TABLE ?auto_60171 ) ( not ( = ?auto_60171 ?auto_60172 ) ) )
    :subtasks
    ( ( !STACK ?auto_60172 ?auto_60171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60173 - BLOCK
      ?auto_60174 - BLOCK
    )
    :vars
    (
      ?auto_60175 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60173 ) ( ON-TABLE ?auto_60173 ) ( not ( = ?auto_60173 ?auto_60174 ) ) ( ON ?auto_60174 ?auto_60175 ) ( CLEAR ?auto_60174 ) ( HAND-EMPTY ) ( not ( = ?auto_60173 ?auto_60175 ) ) ( not ( = ?auto_60174 ?auto_60175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60174 ?auto_60175 )
      ( MAKE-2PILE ?auto_60173 ?auto_60174 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60176 - BLOCK
      ?auto_60177 - BLOCK
    )
    :vars
    (
      ?auto_60178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60176 ?auto_60177 ) ) ( ON ?auto_60177 ?auto_60178 ) ( CLEAR ?auto_60177 ) ( not ( = ?auto_60176 ?auto_60178 ) ) ( not ( = ?auto_60177 ?auto_60178 ) ) ( HOLDING ?auto_60176 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60176 )
      ( MAKE-2PILE ?auto_60176 ?auto_60177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60179 - BLOCK
      ?auto_60180 - BLOCK
    )
    :vars
    (
      ?auto_60181 - BLOCK
      ?auto_60182 - BLOCK
      ?auto_60184 - BLOCK
      ?auto_60183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60179 ?auto_60180 ) ) ( ON ?auto_60180 ?auto_60181 ) ( not ( = ?auto_60179 ?auto_60181 ) ) ( not ( = ?auto_60180 ?auto_60181 ) ) ( ON ?auto_60179 ?auto_60180 ) ( CLEAR ?auto_60179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60182 ) ( ON ?auto_60184 ?auto_60182 ) ( ON ?auto_60183 ?auto_60184 ) ( ON ?auto_60181 ?auto_60183 ) ( not ( = ?auto_60182 ?auto_60184 ) ) ( not ( = ?auto_60182 ?auto_60183 ) ) ( not ( = ?auto_60182 ?auto_60181 ) ) ( not ( = ?auto_60182 ?auto_60180 ) ) ( not ( = ?auto_60182 ?auto_60179 ) ) ( not ( = ?auto_60184 ?auto_60183 ) ) ( not ( = ?auto_60184 ?auto_60181 ) ) ( not ( = ?auto_60184 ?auto_60180 ) ) ( not ( = ?auto_60184 ?auto_60179 ) ) ( not ( = ?auto_60183 ?auto_60181 ) ) ( not ( = ?auto_60183 ?auto_60180 ) ) ( not ( = ?auto_60183 ?auto_60179 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60182 ?auto_60184 ?auto_60183 ?auto_60181 ?auto_60180 )
      ( MAKE-2PILE ?auto_60179 ?auto_60180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60185 - BLOCK
      ?auto_60186 - BLOCK
    )
    :vars
    (
      ?auto_60190 - BLOCK
      ?auto_60188 - BLOCK
      ?auto_60187 - BLOCK
      ?auto_60189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60185 ?auto_60186 ) ) ( ON ?auto_60186 ?auto_60190 ) ( not ( = ?auto_60185 ?auto_60190 ) ) ( not ( = ?auto_60186 ?auto_60190 ) ) ( ON-TABLE ?auto_60188 ) ( ON ?auto_60187 ?auto_60188 ) ( ON ?auto_60189 ?auto_60187 ) ( ON ?auto_60190 ?auto_60189 ) ( not ( = ?auto_60188 ?auto_60187 ) ) ( not ( = ?auto_60188 ?auto_60189 ) ) ( not ( = ?auto_60188 ?auto_60190 ) ) ( not ( = ?auto_60188 ?auto_60186 ) ) ( not ( = ?auto_60188 ?auto_60185 ) ) ( not ( = ?auto_60187 ?auto_60189 ) ) ( not ( = ?auto_60187 ?auto_60190 ) ) ( not ( = ?auto_60187 ?auto_60186 ) ) ( not ( = ?auto_60187 ?auto_60185 ) ) ( not ( = ?auto_60189 ?auto_60190 ) ) ( not ( = ?auto_60189 ?auto_60186 ) ) ( not ( = ?auto_60189 ?auto_60185 ) ) ( HOLDING ?auto_60185 ) ( CLEAR ?auto_60186 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60188 ?auto_60187 ?auto_60189 ?auto_60190 ?auto_60186 ?auto_60185 )
      ( MAKE-2PILE ?auto_60185 ?auto_60186 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60191 - BLOCK
      ?auto_60192 - BLOCK
    )
    :vars
    (
      ?auto_60194 - BLOCK
      ?auto_60193 - BLOCK
      ?auto_60195 - BLOCK
      ?auto_60196 - BLOCK
      ?auto_60197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60191 ?auto_60192 ) ) ( ON ?auto_60192 ?auto_60194 ) ( not ( = ?auto_60191 ?auto_60194 ) ) ( not ( = ?auto_60192 ?auto_60194 ) ) ( ON-TABLE ?auto_60193 ) ( ON ?auto_60195 ?auto_60193 ) ( ON ?auto_60196 ?auto_60195 ) ( ON ?auto_60194 ?auto_60196 ) ( not ( = ?auto_60193 ?auto_60195 ) ) ( not ( = ?auto_60193 ?auto_60196 ) ) ( not ( = ?auto_60193 ?auto_60194 ) ) ( not ( = ?auto_60193 ?auto_60192 ) ) ( not ( = ?auto_60193 ?auto_60191 ) ) ( not ( = ?auto_60195 ?auto_60196 ) ) ( not ( = ?auto_60195 ?auto_60194 ) ) ( not ( = ?auto_60195 ?auto_60192 ) ) ( not ( = ?auto_60195 ?auto_60191 ) ) ( not ( = ?auto_60196 ?auto_60194 ) ) ( not ( = ?auto_60196 ?auto_60192 ) ) ( not ( = ?auto_60196 ?auto_60191 ) ) ( CLEAR ?auto_60192 ) ( ON ?auto_60191 ?auto_60197 ) ( CLEAR ?auto_60191 ) ( HAND-EMPTY ) ( not ( = ?auto_60191 ?auto_60197 ) ) ( not ( = ?auto_60192 ?auto_60197 ) ) ( not ( = ?auto_60194 ?auto_60197 ) ) ( not ( = ?auto_60193 ?auto_60197 ) ) ( not ( = ?auto_60195 ?auto_60197 ) ) ( not ( = ?auto_60196 ?auto_60197 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60191 ?auto_60197 )
      ( MAKE-2PILE ?auto_60191 ?auto_60192 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60198 - BLOCK
      ?auto_60199 - BLOCK
    )
    :vars
    (
      ?auto_60203 - BLOCK
      ?auto_60202 - BLOCK
      ?auto_60200 - BLOCK
      ?auto_60201 - BLOCK
      ?auto_60204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60198 ?auto_60199 ) ) ( not ( = ?auto_60198 ?auto_60203 ) ) ( not ( = ?auto_60199 ?auto_60203 ) ) ( ON-TABLE ?auto_60202 ) ( ON ?auto_60200 ?auto_60202 ) ( ON ?auto_60201 ?auto_60200 ) ( ON ?auto_60203 ?auto_60201 ) ( not ( = ?auto_60202 ?auto_60200 ) ) ( not ( = ?auto_60202 ?auto_60201 ) ) ( not ( = ?auto_60202 ?auto_60203 ) ) ( not ( = ?auto_60202 ?auto_60199 ) ) ( not ( = ?auto_60202 ?auto_60198 ) ) ( not ( = ?auto_60200 ?auto_60201 ) ) ( not ( = ?auto_60200 ?auto_60203 ) ) ( not ( = ?auto_60200 ?auto_60199 ) ) ( not ( = ?auto_60200 ?auto_60198 ) ) ( not ( = ?auto_60201 ?auto_60203 ) ) ( not ( = ?auto_60201 ?auto_60199 ) ) ( not ( = ?auto_60201 ?auto_60198 ) ) ( ON ?auto_60198 ?auto_60204 ) ( CLEAR ?auto_60198 ) ( not ( = ?auto_60198 ?auto_60204 ) ) ( not ( = ?auto_60199 ?auto_60204 ) ) ( not ( = ?auto_60203 ?auto_60204 ) ) ( not ( = ?auto_60202 ?auto_60204 ) ) ( not ( = ?auto_60200 ?auto_60204 ) ) ( not ( = ?auto_60201 ?auto_60204 ) ) ( HOLDING ?auto_60199 ) ( CLEAR ?auto_60203 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60202 ?auto_60200 ?auto_60201 ?auto_60203 ?auto_60199 )
      ( MAKE-2PILE ?auto_60198 ?auto_60199 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60205 - BLOCK
      ?auto_60206 - BLOCK
    )
    :vars
    (
      ?auto_60207 - BLOCK
      ?auto_60210 - BLOCK
      ?auto_60211 - BLOCK
      ?auto_60208 - BLOCK
      ?auto_60209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60205 ?auto_60206 ) ) ( not ( = ?auto_60205 ?auto_60207 ) ) ( not ( = ?auto_60206 ?auto_60207 ) ) ( ON-TABLE ?auto_60210 ) ( ON ?auto_60211 ?auto_60210 ) ( ON ?auto_60208 ?auto_60211 ) ( ON ?auto_60207 ?auto_60208 ) ( not ( = ?auto_60210 ?auto_60211 ) ) ( not ( = ?auto_60210 ?auto_60208 ) ) ( not ( = ?auto_60210 ?auto_60207 ) ) ( not ( = ?auto_60210 ?auto_60206 ) ) ( not ( = ?auto_60210 ?auto_60205 ) ) ( not ( = ?auto_60211 ?auto_60208 ) ) ( not ( = ?auto_60211 ?auto_60207 ) ) ( not ( = ?auto_60211 ?auto_60206 ) ) ( not ( = ?auto_60211 ?auto_60205 ) ) ( not ( = ?auto_60208 ?auto_60207 ) ) ( not ( = ?auto_60208 ?auto_60206 ) ) ( not ( = ?auto_60208 ?auto_60205 ) ) ( ON ?auto_60205 ?auto_60209 ) ( not ( = ?auto_60205 ?auto_60209 ) ) ( not ( = ?auto_60206 ?auto_60209 ) ) ( not ( = ?auto_60207 ?auto_60209 ) ) ( not ( = ?auto_60210 ?auto_60209 ) ) ( not ( = ?auto_60211 ?auto_60209 ) ) ( not ( = ?auto_60208 ?auto_60209 ) ) ( CLEAR ?auto_60207 ) ( ON ?auto_60206 ?auto_60205 ) ( CLEAR ?auto_60206 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60209 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60209 ?auto_60205 )
      ( MAKE-2PILE ?auto_60205 ?auto_60206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60212 - BLOCK
      ?auto_60213 - BLOCK
    )
    :vars
    (
      ?auto_60217 - BLOCK
      ?auto_60214 - BLOCK
      ?auto_60215 - BLOCK
      ?auto_60218 - BLOCK
      ?auto_60216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60212 ?auto_60213 ) ) ( not ( = ?auto_60212 ?auto_60217 ) ) ( not ( = ?auto_60213 ?auto_60217 ) ) ( ON-TABLE ?auto_60214 ) ( ON ?auto_60215 ?auto_60214 ) ( ON ?auto_60218 ?auto_60215 ) ( not ( = ?auto_60214 ?auto_60215 ) ) ( not ( = ?auto_60214 ?auto_60218 ) ) ( not ( = ?auto_60214 ?auto_60217 ) ) ( not ( = ?auto_60214 ?auto_60213 ) ) ( not ( = ?auto_60214 ?auto_60212 ) ) ( not ( = ?auto_60215 ?auto_60218 ) ) ( not ( = ?auto_60215 ?auto_60217 ) ) ( not ( = ?auto_60215 ?auto_60213 ) ) ( not ( = ?auto_60215 ?auto_60212 ) ) ( not ( = ?auto_60218 ?auto_60217 ) ) ( not ( = ?auto_60218 ?auto_60213 ) ) ( not ( = ?auto_60218 ?auto_60212 ) ) ( ON ?auto_60212 ?auto_60216 ) ( not ( = ?auto_60212 ?auto_60216 ) ) ( not ( = ?auto_60213 ?auto_60216 ) ) ( not ( = ?auto_60217 ?auto_60216 ) ) ( not ( = ?auto_60214 ?auto_60216 ) ) ( not ( = ?auto_60215 ?auto_60216 ) ) ( not ( = ?auto_60218 ?auto_60216 ) ) ( ON ?auto_60213 ?auto_60212 ) ( CLEAR ?auto_60213 ) ( ON-TABLE ?auto_60216 ) ( HOLDING ?auto_60217 ) ( CLEAR ?auto_60218 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60214 ?auto_60215 ?auto_60218 ?auto_60217 )
      ( MAKE-2PILE ?auto_60212 ?auto_60213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60219 - BLOCK
      ?auto_60220 - BLOCK
    )
    :vars
    (
      ?auto_60222 - BLOCK
      ?auto_60221 - BLOCK
      ?auto_60223 - BLOCK
      ?auto_60225 - BLOCK
      ?auto_60224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60219 ?auto_60220 ) ) ( not ( = ?auto_60219 ?auto_60222 ) ) ( not ( = ?auto_60220 ?auto_60222 ) ) ( ON-TABLE ?auto_60221 ) ( ON ?auto_60223 ?auto_60221 ) ( ON ?auto_60225 ?auto_60223 ) ( not ( = ?auto_60221 ?auto_60223 ) ) ( not ( = ?auto_60221 ?auto_60225 ) ) ( not ( = ?auto_60221 ?auto_60222 ) ) ( not ( = ?auto_60221 ?auto_60220 ) ) ( not ( = ?auto_60221 ?auto_60219 ) ) ( not ( = ?auto_60223 ?auto_60225 ) ) ( not ( = ?auto_60223 ?auto_60222 ) ) ( not ( = ?auto_60223 ?auto_60220 ) ) ( not ( = ?auto_60223 ?auto_60219 ) ) ( not ( = ?auto_60225 ?auto_60222 ) ) ( not ( = ?auto_60225 ?auto_60220 ) ) ( not ( = ?auto_60225 ?auto_60219 ) ) ( ON ?auto_60219 ?auto_60224 ) ( not ( = ?auto_60219 ?auto_60224 ) ) ( not ( = ?auto_60220 ?auto_60224 ) ) ( not ( = ?auto_60222 ?auto_60224 ) ) ( not ( = ?auto_60221 ?auto_60224 ) ) ( not ( = ?auto_60223 ?auto_60224 ) ) ( not ( = ?auto_60225 ?auto_60224 ) ) ( ON ?auto_60220 ?auto_60219 ) ( ON-TABLE ?auto_60224 ) ( CLEAR ?auto_60225 ) ( ON ?auto_60222 ?auto_60220 ) ( CLEAR ?auto_60222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60224 ?auto_60219 ?auto_60220 )
      ( MAKE-2PILE ?auto_60219 ?auto_60220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60226 - BLOCK
      ?auto_60227 - BLOCK
    )
    :vars
    (
      ?auto_60228 - BLOCK
      ?auto_60230 - BLOCK
      ?auto_60232 - BLOCK
      ?auto_60231 - BLOCK
      ?auto_60229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60226 ?auto_60227 ) ) ( not ( = ?auto_60226 ?auto_60228 ) ) ( not ( = ?auto_60227 ?auto_60228 ) ) ( ON-TABLE ?auto_60230 ) ( ON ?auto_60232 ?auto_60230 ) ( not ( = ?auto_60230 ?auto_60232 ) ) ( not ( = ?auto_60230 ?auto_60231 ) ) ( not ( = ?auto_60230 ?auto_60228 ) ) ( not ( = ?auto_60230 ?auto_60227 ) ) ( not ( = ?auto_60230 ?auto_60226 ) ) ( not ( = ?auto_60232 ?auto_60231 ) ) ( not ( = ?auto_60232 ?auto_60228 ) ) ( not ( = ?auto_60232 ?auto_60227 ) ) ( not ( = ?auto_60232 ?auto_60226 ) ) ( not ( = ?auto_60231 ?auto_60228 ) ) ( not ( = ?auto_60231 ?auto_60227 ) ) ( not ( = ?auto_60231 ?auto_60226 ) ) ( ON ?auto_60226 ?auto_60229 ) ( not ( = ?auto_60226 ?auto_60229 ) ) ( not ( = ?auto_60227 ?auto_60229 ) ) ( not ( = ?auto_60228 ?auto_60229 ) ) ( not ( = ?auto_60230 ?auto_60229 ) ) ( not ( = ?auto_60232 ?auto_60229 ) ) ( not ( = ?auto_60231 ?auto_60229 ) ) ( ON ?auto_60227 ?auto_60226 ) ( ON-TABLE ?auto_60229 ) ( ON ?auto_60228 ?auto_60227 ) ( CLEAR ?auto_60228 ) ( HOLDING ?auto_60231 ) ( CLEAR ?auto_60232 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60230 ?auto_60232 ?auto_60231 )
      ( MAKE-2PILE ?auto_60226 ?auto_60227 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60233 - BLOCK
      ?auto_60234 - BLOCK
    )
    :vars
    (
      ?auto_60239 - BLOCK
      ?auto_60237 - BLOCK
      ?auto_60235 - BLOCK
      ?auto_60238 - BLOCK
      ?auto_60236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60233 ?auto_60234 ) ) ( not ( = ?auto_60233 ?auto_60239 ) ) ( not ( = ?auto_60234 ?auto_60239 ) ) ( ON-TABLE ?auto_60237 ) ( ON ?auto_60235 ?auto_60237 ) ( not ( = ?auto_60237 ?auto_60235 ) ) ( not ( = ?auto_60237 ?auto_60238 ) ) ( not ( = ?auto_60237 ?auto_60239 ) ) ( not ( = ?auto_60237 ?auto_60234 ) ) ( not ( = ?auto_60237 ?auto_60233 ) ) ( not ( = ?auto_60235 ?auto_60238 ) ) ( not ( = ?auto_60235 ?auto_60239 ) ) ( not ( = ?auto_60235 ?auto_60234 ) ) ( not ( = ?auto_60235 ?auto_60233 ) ) ( not ( = ?auto_60238 ?auto_60239 ) ) ( not ( = ?auto_60238 ?auto_60234 ) ) ( not ( = ?auto_60238 ?auto_60233 ) ) ( ON ?auto_60233 ?auto_60236 ) ( not ( = ?auto_60233 ?auto_60236 ) ) ( not ( = ?auto_60234 ?auto_60236 ) ) ( not ( = ?auto_60239 ?auto_60236 ) ) ( not ( = ?auto_60237 ?auto_60236 ) ) ( not ( = ?auto_60235 ?auto_60236 ) ) ( not ( = ?auto_60238 ?auto_60236 ) ) ( ON ?auto_60234 ?auto_60233 ) ( ON-TABLE ?auto_60236 ) ( ON ?auto_60239 ?auto_60234 ) ( CLEAR ?auto_60235 ) ( ON ?auto_60238 ?auto_60239 ) ( CLEAR ?auto_60238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60236 ?auto_60233 ?auto_60234 ?auto_60239 )
      ( MAKE-2PILE ?auto_60233 ?auto_60234 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60240 - BLOCK
      ?auto_60241 - BLOCK
    )
    :vars
    (
      ?auto_60242 - BLOCK
      ?auto_60246 - BLOCK
      ?auto_60243 - BLOCK
      ?auto_60245 - BLOCK
      ?auto_60244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60240 ?auto_60241 ) ) ( not ( = ?auto_60240 ?auto_60242 ) ) ( not ( = ?auto_60241 ?auto_60242 ) ) ( ON-TABLE ?auto_60246 ) ( not ( = ?auto_60246 ?auto_60243 ) ) ( not ( = ?auto_60246 ?auto_60245 ) ) ( not ( = ?auto_60246 ?auto_60242 ) ) ( not ( = ?auto_60246 ?auto_60241 ) ) ( not ( = ?auto_60246 ?auto_60240 ) ) ( not ( = ?auto_60243 ?auto_60245 ) ) ( not ( = ?auto_60243 ?auto_60242 ) ) ( not ( = ?auto_60243 ?auto_60241 ) ) ( not ( = ?auto_60243 ?auto_60240 ) ) ( not ( = ?auto_60245 ?auto_60242 ) ) ( not ( = ?auto_60245 ?auto_60241 ) ) ( not ( = ?auto_60245 ?auto_60240 ) ) ( ON ?auto_60240 ?auto_60244 ) ( not ( = ?auto_60240 ?auto_60244 ) ) ( not ( = ?auto_60241 ?auto_60244 ) ) ( not ( = ?auto_60242 ?auto_60244 ) ) ( not ( = ?auto_60246 ?auto_60244 ) ) ( not ( = ?auto_60243 ?auto_60244 ) ) ( not ( = ?auto_60245 ?auto_60244 ) ) ( ON ?auto_60241 ?auto_60240 ) ( ON-TABLE ?auto_60244 ) ( ON ?auto_60242 ?auto_60241 ) ( ON ?auto_60245 ?auto_60242 ) ( CLEAR ?auto_60245 ) ( HOLDING ?auto_60243 ) ( CLEAR ?auto_60246 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60246 ?auto_60243 )
      ( MAKE-2PILE ?auto_60240 ?auto_60241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60247 - BLOCK
      ?auto_60248 - BLOCK
    )
    :vars
    (
      ?auto_60249 - BLOCK
      ?auto_60250 - BLOCK
      ?auto_60252 - BLOCK
      ?auto_60253 - BLOCK
      ?auto_60251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60247 ?auto_60248 ) ) ( not ( = ?auto_60247 ?auto_60249 ) ) ( not ( = ?auto_60248 ?auto_60249 ) ) ( ON-TABLE ?auto_60250 ) ( not ( = ?auto_60250 ?auto_60252 ) ) ( not ( = ?auto_60250 ?auto_60253 ) ) ( not ( = ?auto_60250 ?auto_60249 ) ) ( not ( = ?auto_60250 ?auto_60248 ) ) ( not ( = ?auto_60250 ?auto_60247 ) ) ( not ( = ?auto_60252 ?auto_60253 ) ) ( not ( = ?auto_60252 ?auto_60249 ) ) ( not ( = ?auto_60252 ?auto_60248 ) ) ( not ( = ?auto_60252 ?auto_60247 ) ) ( not ( = ?auto_60253 ?auto_60249 ) ) ( not ( = ?auto_60253 ?auto_60248 ) ) ( not ( = ?auto_60253 ?auto_60247 ) ) ( ON ?auto_60247 ?auto_60251 ) ( not ( = ?auto_60247 ?auto_60251 ) ) ( not ( = ?auto_60248 ?auto_60251 ) ) ( not ( = ?auto_60249 ?auto_60251 ) ) ( not ( = ?auto_60250 ?auto_60251 ) ) ( not ( = ?auto_60252 ?auto_60251 ) ) ( not ( = ?auto_60253 ?auto_60251 ) ) ( ON ?auto_60248 ?auto_60247 ) ( ON-TABLE ?auto_60251 ) ( ON ?auto_60249 ?auto_60248 ) ( ON ?auto_60253 ?auto_60249 ) ( CLEAR ?auto_60250 ) ( ON ?auto_60252 ?auto_60253 ) ( CLEAR ?auto_60252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60251 ?auto_60247 ?auto_60248 ?auto_60249 ?auto_60253 )
      ( MAKE-2PILE ?auto_60247 ?auto_60248 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60254 - BLOCK
      ?auto_60255 - BLOCK
    )
    :vars
    (
      ?auto_60260 - BLOCK
      ?auto_60258 - BLOCK
      ?auto_60257 - BLOCK
      ?auto_60259 - BLOCK
      ?auto_60256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60254 ?auto_60255 ) ) ( not ( = ?auto_60254 ?auto_60260 ) ) ( not ( = ?auto_60255 ?auto_60260 ) ) ( not ( = ?auto_60258 ?auto_60257 ) ) ( not ( = ?auto_60258 ?auto_60259 ) ) ( not ( = ?auto_60258 ?auto_60260 ) ) ( not ( = ?auto_60258 ?auto_60255 ) ) ( not ( = ?auto_60258 ?auto_60254 ) ) ( not ( = ?auto_60257 ?auto_60259 ) ) ( not ( = ?auto_60257 ?auto_60260 ) ) ( not ( = ?auto_60257 ?auto_60255 ) ) ( not ( = ?auto_60257 ?auto_60254 ) ) ( not ( = ?auto_60259 ?auto_60260 ) ) ( not ( = ?auto_60259 ?auto_60255 ) ) ( not ( = ?auto_60259 ?auto_60254 ) ) ( ON ?auto_60254 ?auto_60256 ) ( not ( = ?auto_60254 ?auto_60256 ) ) ( not ( = ?auto_60255 ?auto_60256 ) ) ( not ( = ?auto_60260 ?auto_60256 ) ) ( not ( = ?auto_60258 ?auto_60256 ) ) ( not ( = ?auto_60257 ?auto_60256 ) ) ( not ( = ?auto_60259 ?auto_60256 ) ) ( ON ?auto_60255 ?auto_60254 ) ( ON-TABLE ?auto_60256 ) ( ON ?auto_60260 ?auto_60255 ) ( ON ?auto_60259 ?auto_60260 ) ( ON ?auto_60257 ?auto_60259 ) ( CLEAR ?auto_60257 ) ( HOLDING ?auto_60258 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60258 )
      ( MAKE-2PILE ?auto_60254 ?auto_60255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60261 - BLOCK
      ?auto_60262 - BLOCK
    )
    :vars
    (
      ?auto_60265 - BLOCK
      ?auto_60267 - BLOCK
      ?auto_60263 - BLOCK
      ?auto_60266 - BLOCK
      ?auto_60264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60261 ?auto_60262 ) ) ( not ( = ?auto_60261 ?auto_60265 ) ) ( not ( = ?auto_60262 ?auto_60265 ) ) ( not ( = ?auto_60267 ?auto_60263 ) ) ( not ( = ?auto_60267 ?auto_60266 ) ) ( not ( = ?auto_60267 ?auto_60265 ) ) ( not ( = ?auto_60267 ?auto_60262 ) ) ( not ( = ?auto_60267 ?auto_60261 ) ) ( not ( = ?auto_60263 ?auto_60266 ) ) ( not ( = ?auto_60263 ?auto_60265 ) ) ( not ( = ?auto_60263 ?auto_60262 ) ) ( not ( = ?auto_60263 ?auto_60261 ) ) ( not ( = ?auto_60266 ?auto_60265 ) ) ( not ( = ?auto_60266 ?auto_60262 ) ) ( not ( = ?auto_60266 ?auto_60261 ) ) ( ON ?auto_60261 ?auto_60264 ) ( not ( = ?auto_60261 ?auto_60264 ) ) ( not ( = ?auto_60262 ?auto_60264 ) ) ( not ( = ?auto_60265 ?auto_60264 ) ) ( not ( = ?auto_60267 ?auto_60264 ) ) ( not ( = ?auto_60263 ?auto_60264 ) ) ( not ( = ?auto_60266 ?auto_60264 ) ) ( ON ?auto_60262 ?auto_60261 ) ( ON-TABLE ?auto_60264 ) ( ON ?auto_60265 ?auto_60262 ) ( ON ?auto_60266 ?auto_60265 ) ( ON ?auto_60263 ?auto_60266 ) ( ON ?auto_60267 ?auto_60263 ) ( CLEAR ?auto_60267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60264 ?auto_60261 ?auto_60262 ?auto_60265 ?auto_60266 ?auto_60263 )
      ( MAKE-2PILE ?auto_60261 ?auto_60262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60271 - BLOCK
      ?auto_60272 - BLOCK
      ?auto_60273 - BLOCK
    )
    :vars
    (
      ?auto_60274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60274 ?auto_60273 ) ( CLEAR ?auto_60274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60271 ) ( ON ?auto_60272 ?auto_60271 ) ( ON ?auto_60273 ?auto_60272 ) ( not ( = ?auto_60271 ?auto_60272 ) ) ( not ( = ?auto_60271 ?auto_60273 ) ) ( not ( = ?auto_60271 ?auto_60274 ) ) ( not ( = ?auto_60272 ?auto_60273 ) ) ( not ( = ?auto_60272 ?auto_60274 ) ) ( not ( = ?auto_60273 ?auto_60274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60274 ?auto_60273 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60275 - BLOCK
      ?auto_60276 - BLOCK
      ?auto_60277 - BLOCK
    )
    :vars
    (
      ?auto_60278 - BLOCK
      ?auto_60279 - BLOCK
      ?auto_60280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60278 ?auto_60277 ) ( CLEAR ?auto_60278 ) ( ON-TABLE ?auto_60275 ) ( ON ?auto_60276 ?auto_60275 ) ( ON ?auto_60277 ?auto_60276 ) ( not ( = ?auto_60275 ?auto_60276 ) ) ( not ( = ?auto_60275 ?auto_60277 ) ) ( not ( = ?auto_60275 ?auto_60278 ) ) ( not ( = ?auto_60276 ?auto_60277 ) ) ( not ( = ?auto_60276 ?auto_60278 ) ) ( not ( = ?auto_60277 ?auto_60278 ) ) ( HOLDING ?auto_60279 ) ( CLEAR ?auto_60280 ) ( not ( = ?auto_60275 ?auto_60279 ) ) ( not ( = ?auto_60275 ?auto_60280 ) ) ( not ( = ?auto_60276 ?auto_60279 ) ) ( not ( = ?auto_60276 ?auto_60280 ) ) ( not ( = ?auto_60277 ?auto_60279 ) ) ( not ( = ?auto_60277 ?auto_60280 ) ) ( not ( = ?auto_60278 ?auto_60279 ) ) ( not ( = ?auto_60278 ?auto_60280 ) ) ( not ( = ?auto_60279 ?auto_60280 ) ) )
    :subtasks
    ( ( !STACK ?auto_60279 ?auto_60280 )
      ( MAKE-3PILE ?auto_60275 ?auto_60276 ?auto_60277 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60281 - BLOCK
      ?auto_60282 - BLOCK
      ?auto_60283 - BLOCK
    )
    :vars
    (
      ?auto_60286 - BLOCK
      ?auto_60284 - BLOCK
      ?auto_60285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60286 ?auto_60283 ) ( ON-TABLE ?auto_60281 ) ( ON ?auto_60282 ?auto_60281 ) ( ON ?auto_60283 ?auto_60282 ) ( not ( = ?auto_60281 ?auto_60282 ) ) ( not ( = ?auto_60281 ?auto_60283 ) ) ( not ( = ?auto_60281 ?auto_60286 ) ) ( not ( = ?auto_60282 ?auto_60283 ) ) ( not ( = ?auto_60282 ?auto_60286 ) ) ( not ( = ?auto_60283 ?auto_60286 ) ) ( CLEAR ?auto_60284 ) ( not ( = ?auto_60281 ?auto_60285 ) ) ( not ( = ?auto_60281 ?auto_60284 ) ) ( not ( = ?auto_60282 ?auto_60285 ) ) ( not ( = ?auto_60282 ?auto_60284 ) ) ( not ( = ?auto_60283 ?auto_60285 ) ) ( not ( = ?auto_60283 ?auto_60284 ) ) ( not ( = ?auto_60286 ?auto_60285 ) ) ( not ( = ?auto_60286 ?auto_60284 ) ) ( not ( = ?auto_60285 ?auto_60284 ) ) ( ON ?auto_60285 ?auto_60286 ) ( CLEAR ?auto_60285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60281 ?auto_60282 ?auto_60283 ?auto_60286 )
      ( MAKE-3PILE ?auto_60281 ?auto_60282 ?auto_60283 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60287 - BLOCK
      ?auto_60288 - BLOCK
      ?auto_60289 - BLOCK
    )
    :vars
    (
      ?auto_60290 - BLOCK
      ?auto_60292 - BLOCK
      ?auto_60291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60290 ?auto_60289 ) ( ON-TABLE ?auto_60287 ) ( ON ?auto_60288 ?auto_60287 ) ( ON ?auto_60289 ?auto_60288 ) ( not ( = ?auto_60287 ?auto_60288 ) ) ( not ( = ?auto_60287 ?auto_60289 ) ) ( not ( = ?auto_60287 ?auto_60290 ) ) ( not ( = ?auto_60288 ?auto_60289 ) ) ( not ( = ?auto_60288 ?auto_60290 ) ) ( not ( = ?auto_60289 ?auto_60290 ) ) ( not ( = ?auto_60287 ?auto_60292 ) ) ( not ( = ?auto_60287 ?auto_60291 ) ) ( not ( = ?auto_60288 ?auto_60292 ) ) ( not ( = ?auto_60288 ?auto_60291 ) ) ( not ( = ?auto_60289 ?auto_60292 ) ) ( not ( = ?auto_60289 ?auto_60291 ) ) ( not ( = ?auto_60290 ?auto_60292 ) ) ( not ( = ?auto_60290 ?auto_60291 ) ) ( not ( = ?auto_60292 ?auto_60291 ) ) ( ON ?auto_60292 ?auto_60290 ) ( CLEAR ?auto_60292 ) ( HOLDING ?auto_60291 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60291 )
      ( MAKE-3PILE ?auto_60287 ?auto_60288 ?auto_60289 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60293 - BLOCK
      ?auto_60294 - BLOCK
      ?auto_60295 - BLOCK
    )
    :vars
    (
      ?auto_60297 - BLOCK
      ?auto_60296 - BLOCK
      ?auto_60298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60297 ?auto_60295 ) ( ON-TABLE ?auto_60293 ) ( ON ?auto_60294 ?auto_60293 ) ( ON ?auto_60295 ?auto_60294 ) ( not ( = ?auto_60293 ?auto_60294 ) ) ( not ( = ?auto_60293 ?auto_60295 ) ) ( not ( = ?auto_60293 ?auto_60297 ) ) ( not ( = ?auto_60294 ?auto_60295 ) ) ( not ( = ?auto_60294 ?auto_60297 ) ) ( not ( = ?auto_60295 ?auto_60297 ) ) ( not ( = ?auto_60293 ?auto_60296 ) ) ( not ( = ?auto_60293 ?auto_60298 ) ) ( not ( = ?auto_60294 ?auto_60296 ) ) ( not ( = ?auto_60294 ?auto_60298 ) ) ( not ( = ?auto_60295 ?auto_60296 ) ) ( not ( = ?auto_60295 ?auto_60298 ) ) ( not ( = ?auto_60297 ?auto_60296 ) ) ( not ( = ?auto_60297 ?auto_60298 ) ) ( not ( = ?auto_60296 ?auto_60298 ) ) ( ON ?auto_60296 ?auto_60297 ) ( ON ?auto_60298 ?auto_60296 ) ( CLEAR ?auto_60298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60293 ?auto_60294 ?auto_60295 ?auto_60297 ?auto_60296 )
      ( MAKE-3PILE ?auto_60293 ?auto_60294 ?auto_60295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60299 - BLOCK
      ?auto_60300 - BLOCK
      ?auto_60301 - BLOCK
    )
    :vars
    (
      ?auto_60303 - BLOCK
      ?auto_60304 - BLOCK
      ?auto_60302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60303 ?auto_60301 ) ( ON-TABLE ?auto_60299 ) ( ON ?auto_60300 ?auto_60299 ) ( ON ?auto_60301 ?auto_60300 ) ( not ( = ?auto_60299 ?auto_60300 ) ) ( not ( = ?auto_60299 ?auto_60301 ) ) ( not ( = ?auto_60299 ?auto_60303 ) ) ( not ( = ?auto_60300 ?auto_60301 ) ) ( not ( = ?auto_60300 ?auto_60303 ) ) ( not ( = ?auto_60301 ?auto_60303 ) ) ( not ( = ?auto_60299 ?auto_60304 ) ) ( not ( = ?auto_60299 ?auto_60302 ) ) ( not ( = ?auto_60300 ?auto_60304 ) ) ( not ( = ?auto_60300 ?auto_60302 ) ) ( not ( = ?auto_60301 ?auto_60304 ) ) ( not ( = ?auto_60301 ?auto_60302 ) ) ( not ( = ?auto_60303 ?auto_60304 ) ) ( not ( = ?auto_60303 ?auto_60302 ) ) ( not ( = ?auto_60304 ?auto_60302 ) ) ( ON ?auto_60304 ?auto_60303 ) ( HOLDING ?auto_60302 ) ( CLEAR ?auto_60304 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60299 ?auto_60300 ?auto_60301 ?auto_60303 ?auto_60304 ?auto_60302 )
      ( MAKE-3PILE ?auto_60299 ?auto_60300 ?auto_60301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60305 - BLOCK
      ?auto_60306 - BLOCK
      ?auto_60307 - BLOCK
    )
    :vars
    (
      ?auto_60309 - BLOCK
      ?auto_60310 - BLOCK
      ?auto_60308 - BLOCK
      ?auto_60311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60309 ?auto_60307 ) ( ON-TABLE ?auto_60305 ) ( ON ?auto_60306 ?auto_60305 ) ( ON ?auto_60307 ?auto_60306 ) ( not ( = ?auto_60305 ?auto_60306 ) ) ( not ( = ?auto_60305 ?auto_60307 ) ) ( not ( = ?auto_60305 ?auto_60309 ) ) ( not ( = ?auto_60306 ?auto_60307 ) ) ( not ( = ?auto_60306 ?auto_60309 ) ) ( not ( = ?auto_60307 ?auto_60309 ) ) ( not ( = ?auto_60305 ?auto_60310 ) ) ( not ( = ?auto_60305 ?auto_60308 ) ) ( not ( = ?auto_60306 ?auto_60310 ) ) ( not ( = ?auto_60306 ?auto_60308 ) ) ( not ( = ?auto_60307 ?auto_60310 ) ) ( not ( = ?auto_60307 ?auto_60308 ) ) ( not ( = ?auto_60309 ?auto_60310 ) ) ( not ( = ?auto_60309 ?auto_60308 ) ) ( not ( = ?auto_60310 ?auto_60308 ) ) ( ON ?auto_60310 ?auto_60309 ) ( CLEAR ?auto_60310 ) ( ON ?auto_60308 ?auto_60311 ) ( CLEAR ?auto_60308 ) ( HAND-EMPTY ) ( not ( = ?auto_60305 ?auto_60311 ) ) ( not ( = ?auto_60306 ?auto_60311 ) ) ( not ( = ?auto_60307 ?auto_60311 ) ) ( not ( = ?auto_60309 ?auto_60311 ) ) ( not ( = ?auto_60310 ?auto_60311 ) ) ( not ( = ?auto_60308 ?auto_60311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60308 ?auto_60311 )
      ( MAKE-3PILE ?auto_60305 ?auto_60306 ?auto_60307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60312 - BLOCK
      ?auto_60313 - BLOCK
      ?auto_60314 - BLOCK
    )
    :vars
    (
      ?auto_60315 - BLOCK
      ?auto_60317 - BLOCK
      ?auto_60316 - BLOCK
      ?auto_60318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60315 ?auto_60314 ) ( ON-TABLE ?auto_60312 ) ( ON ?auto_60313 ?auto_60312 ) ( ON ?auto_60314 ?auto_60313 ) ( not ( = ?auto_60312 ?auto_60313 ) ) ( not ( = ?auto_60312 ?auto_60314 ) ) ( not ( = ?auto_60312 ?auto_60315 ) ) ( not ( = ?auto_60313 ?auto_60314 ) ) ( not ( = ?auto_60313 ?auto_60315 ) ) ( not ( = ?auto_60314 ?auto_60315 ) ) ( not ( = ?auto_60312 ?auto_60317 ) ) ( not ( = ?auto_60312 ?auto_60316 ) ) ( not ( = ?auto_60313 ?auto_60317 ) ) ( not ( = ?auto_60313 ?auto_60316 ) ) ( not ( = ?auto_60314 ?auto_60317 ) ) ( not ( = ?auto_60314 ?auto_60316 ) ) ( not ( = ?auto_60315 ?auto_60317 ) ) ( not ( = ?auto_60315 ?auto_60316 ) ) ( not ( = ?auto_60317 ?auto_60316 ) ) ( ON ?auto_60316 ?auto_60318 ) ( CLEAR ?auto_60316 ) ( not ( = ?auto_60312 ?auto_60318 ) ) ( not ( = ?auto_60313 ?auto_60318 ) ) ( not ( = ?auto_60314 ?auto_60318 ) ) ( not ( = ?auto_60315 ?auto_60318 ) ) ( not ( = ?auto_60317 ?auto_60318 ) ) ( not ( = ?auto_60316 ?auto_60318 ) ) ( HOLDING ?auto_60317 ) ( CLEAR ?auto_60315 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60312 ?auto_60313 ?auto_60314 ?auto_60315 ?auto_60317 )
      ( MAKE-3PILE ?auto_60312 ?auto_60313 ?auto_60314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60319 - BLOCK
      ?auto_60320 - BLOCK
      ?auto_60321 - BLOCK
    )
    :vars
    (
      ?auto_60324 - BLOCK
      ?auto_60322 - BLOCK
      ?auto_60325 - BLOCK
      ?auto_60323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60324 ?auto_60321 ) ( ON-TABLE ?auto_60319 ) ( ON ?auto_60320 ?auto_60319 ) ( ON ?auto_60321 ?auto_60320 ) ( not ( = ?auto_60319 ?auto_60320 ) ) ( not ( = ?auto_60319 ?auto_60321 ) ) ( not ( = ?auto_60319 ?auto_60324 ) ) ( not ( = ?auto_60320 ?auto_60321 ) ) ( not ( = ?auto_60320 ?auto_60324 ) ) ( not ( = ?auto_60321 ?auto_60324 ) ) ( not ( = ?auto_60319 ?auto_60322 ) ) ( not ( = ?auto_60319 ?auto_60325 ) ) ( not ( = ?auto_60320 ?auto_60322 ) ) ( not ( = ?auto_60320 ?auto_60325 ) ) ( not ( = ?auto_60321 ?auto_60322 ) ) ( not ( = ?auto_60321 ?auto_60325 ) ) ( not ( = ?auto_60324 ?auto_60322 ) ) ( not ( = ?auto_60324 ?auto_60325 ) ) ( not ( = ?auto_60322 ?auto_60325 ) ) ( ON ?auto_60325 ?auto_60323 ) ( not ( = ?auto_60319 ?auto_60323 ) ) ( not ( = ?auto_60320 ?auto_60323 ) ) ( not ( = ?auto_60321 ?auto_60323 ) ) ( not ( = ?auto_60324 ?auto_60323 ) ) ( not ( = ?auto_60322 ?auto_60323 ) ) ( not ( = ?auto_60325 ?auto_60323 ) ) ( CLEAR ?auto_60324 ) ( ON ?auto_60322 ?auto_60325 ) ( CLEAR ?auto_60322 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60323 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60323 ?auto_60325 )
      ( MAKE-3PILE ?auto_60319 ?auto_60320 ?auto_60321 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60340 - BLOCK
      ?auto_60341 - BLOCK
      ?auto_60342 - BLOCK
    )
    :vars
    (
      ?auto_60344 - BLOCK
      ?auto_60345 - BLOCK
      ?auto_60343 - BLOCK
      ?auto_60346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60340 ) ( ON ?auto_60341 ?auto_60340 ) ( not ( = ?auto_60340 ?auto_60341 ) ) ( not ( = ?auto_60340 ?auto_60342 ) ) ( not ( = ?auto_60340 ?auto_60344 ) ) ( not ( = ?auto_60341 ?auto_60342 ) ) ( not ( = ?auto_60341 ?auto_60344 ) ) ( not ( = ?auto_60342 ?auto_60344 ) ) ( not ( = ?auto_60340 ?auto_60345 ) ) ( not ( = ?auto_60340 ?auto_60343 ) ) ( not ( = ?auto_60341 ?auto_60345 ) ) ( not ( = ?auto_60341 ?auto_60343 ) ) ( not ( = ?auto_60342 ?auto_60345 ) ) ( not ( = ?auto_60342 ?auto_60343 ) ) ( not ( = ?auto_60344 ?auto_60345 ) ) ( not ( = ?auto_60344 ?auto_60343 ) ) ( not ( = ?auto_60345 ?auto_60343 ) ) ( ON ?auto_60343 ?auto_60346 ) ( not ( = ?auto_60340 ?auto_60346 ) ) ( not ( = ?auto_60341 ?auto_60346 ) ) ( not ( = ?auto_60342 ?auto_60346 ) ) ( not ( = ?auto_60344 ?auto_60346 ) ) ( not ( = ?auto_60345 ?auto_60346 ) ) ( not ( = ?auto_60343 ?auto_60346 ) ) ( ON ?auto_60345 ?auto_60343 ) ( ON-TABLE ?auto_60346 ) ( ON ?auto_60344 ?auto_60345 ) ( CLEAR ?auto_60344 ) ( HOLDING ?auto_60342 ) ( CLEAR ?auto_60341 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60340 ?auto_60341 ?auto_60342 ?auto_60344 )
      ( MAKE-3PILE ?auto_60340 ?auto_60341 ?auto_60342 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60347 - BLOCK
      ?auto_60348 - BLOCK
      ?auto_60349 - BLOCK
    )
    :vars
    (
      ?auto_60352 - BLOCK
      ?auto_60350 - BLOCK
      ?auto_60351 - BLOCK
      ?auto_60353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60347 ) ( ON ?auto_60348 ?auto_60347 ) ( not ( = ?auto_60347 ?auto_60348 ) ) ( not ( = ?auto_60347 ?auto_60349 ) ) ( not ( = ?auto_60347 ?auto_60352 ) ) ( not ( = ?auto_60348 ?auto_60349 ) ) ( not ( = ?auto_60348 ?auto_60352 ) ) ( not ( = ?auto_60349 ?auto_60352 ) ) ( not ( = ?auto_60347 ?auto_60350 ) ) ( not ( = ?auto_60347 ?auto_60351 ) ) ( not ( = ?auto_60348 ?auto_60350 ) ) ( not ( = ?auto_60348 ?auto_60351 ) ) ( not ( = ?auto_60349 ?auto_60350 ) ) ( not ( = ?auto_60349 ?auto_60351 ) ) ( not ( = ?auto_60352 ?auto_60350 ) ) ( not ( = ?auto_60352 ?auto_60351 ) ) ( not ( = ?auto_60350 ?auto_60351 ) ) ( ON ?auto_60351 ?auto_60353 ) ( not ( = ?auto_60347 ?auto_60353 ) ) ( not ( = ?auto_60348 ?auto_60353 ) ) ( not ( = ?auto_60349 ?auto_60353 ) ) ( not ( = ?auto_60352 ?auto_60353 ) ) ( not ( = ?auto_60350 ?auto_60353 ) ) ( not ( = ?auto_60351 ?auto_60353 ) ) ( ON ?auto_60350 ?auto_60351 ) ( ON-TABLE ?auto_60353 ) ( ON ?auto_60352 ?auto_60350 ) ( CLEAR ?auto_60348 ) ( ON ?auto_60349 ?auto_60352 ) ( CLEAR ?auto_60349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60353 ?auto_60351 ?auto_60350 ?auto_60352 )
      ( MAKE-3PILE ?auto_60347 ?auto_60348 ?auto_60349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60354 - BLOCK
      ?auto_60355 - BLOCK
      ?auto_60356 - BLOCK
    )
    :vars
    (
      ?auto_60357 - BLOCK
      ?auto_60359 - BLOCK
      ?auto_60360 - BLOCK
      ?auto_60358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60354 ) ( not ( = ?auto_60354 ?auto_60355 ) ) ( not ( = ?auto_60354 ?auto_60356 ) ) ( not ( = ?auto_60354 ?auto_60357 ) ) ( not ( = ?auto_60355 ?auto_60356 ) ) ( not ( = ?auto_60355 ?auto_60357 ) ) ( not ( = ?auto_60356 ?auto_60357 ) ) ( not ( = ?auto_60354 ?auto_60359 ) ) ( not ( = ?auto_60354 ?auto_60360 ) ) ( not ( = ?auto_60355 ?auto_60359 ) ) ( not ( = ?auto_60355 ?auto_60360 ) ) ( not ( = ?auto_60356 ?auto_60359 ) ) ( not ( = ?auto_60356 ?auto_60360 ) ) ( not ( = ?auto_60357 ?auto_60359 ) ) ( not ( = ?auto_60357 ?auto_60360 ) ) ( not ( = ?auto_60359 ?auto_60360 ) ) ( ON ?auto_60360 ?auto_60358 ) ( not ( = ?auto_60354 ?auto_60358 ) ) ( not ( = ?auto_60355 ?auto_60358 ) ) ( not ( = ?auto_60356 ?auto_60358 ) ) ( not ( = ?auto_60357 ?auto_60358 ) ) ( not ( = ?auto_60359 ?auto_60358 ) ) ( not ( = ?auto_60360 ?auto_60358 ) ) ( ON ?auto_60359 ?auto_60360 ) ( ON-TABLE ?auto_60358 ) ( ON ?auto_60357 ?auto_60359 ) ( ON ?auto_60356 ?auto_60357 ) ( CLEAR ?auto_60356 ) ( HOLDING ?auto_60355 ) ( CLEAR ?auto_60354 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60354 ?auto_60355 )
      ( MAKE-3PILE ?auto_60354 ?auto_60355 ?auto_60356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60361 - BLOCK
      ?auto_60362 - BLOCK
      ?auto_60363 - BLOCK
    )
    :vars
    (
      ?auto_60364 - BLOCK
      ?auto_60365 - BLOCK
      ?auto_60366 - BLOCK
      ?auto_60367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60361 ) ( not ( = ?auto_60361 ?auto_60362 ) ) ( not ( = ?auto_60361 ?auto_60363 ) ) ( not ( = ?auto_60361 ?auto_60364 ) ) ( not ( = ?auto_60362 ?auto_60363 ) ) ( not ( = ?auto_60362 ?auto_60364 ) ) ( not ( = ?auto_60363 ?auto_60364 ) ) ( not ( = ?auto_60361 ?auto_60365 ) ) ( not ( = ?auto_60361 ?auto_60366 ) ) ( not ( = ?auto_60362 ?auto_60365 ) ) ( not ( = ?auto_60362 ?auto_60366 ) ) ( not ( = ?auto_60363 ?auto_60365 ) ) ( not ( = ?auto_60363 ?auto_60366 ) ) ( not ( = ?auto_60364 ?auto_60365 ) ) ( not ( = ?auto_60364 ?auto_60366 ) ) ( not ( = ?auto_60365 ?auto_60366 ) ) ( ON ?auto_60366 ?auto_60367 ) ( not ( = ?auto_60361 ?auto_60367 ) ) ( not ( = ?auto_60362 ?auto_60367 ) ) ( not ( = ?auto_60363 ?auto_60367 ) ) ( not ( = ?auto_60364 ?auto_60367 ) ) ( not ( = ?auto_60365 ?auto_60367 ) ) ( not ( = ?auto_60366 ?auto_60367 ) ) ( ON ?auto_60365 ?auto_60366 ) ( ON-TABLE ?auto_60367 ) ( ON ?auto_60364 ?auto_60365 ) ( ON ?auto_60363 ?auto_60364 ) ( CLEAR ?auto_60361 ) ( ON ?auto_60362 ?auto_60363 ) ( CLEAR ?auto_60362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60367 ?auto_60366 ?auto_60365 ?auto_60364 ?auto_60363 )
      ( MAKE-3PILE ?auto_60361 ?auto_60362 ?auto_60363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60368 - BLOCK
      ?auto_60369 - BLOCK
      ?auto_60370 - BLOCK
    )
    :vars
    (
      ?auto_60371 - BLOCK
      ?auto_60373 - BLOCK
      ?auto_60374 - BLOCK
      ?auto_60372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60368 ?auto_60369 ) ) ( not ( = ?auto_60368 ?auto_60370 ) ) ( not ( = ?auto_60368 ?auto_60371 ) ) ( not ( = ?auto_60369 ?auto_60370 ) ) ( not ( = ?auto_60369 ?auto_60371 ) ) ( not ( = ?auto_60370 ?auto_60371 ) ) ( not ( = ?auto_60368 ?auto_60373 ) ) ( not ( = ?auto_60368 ?auto_60374 ) ) ( not ( = ?auto_60369 ?auto_60373 ) ) ( not ( = ?auto_60369 ?auto_60374 ) ) ( not ( = ?auto_60370 ?auto_60373 ) ) ( not ( = ?auto_60370 ?auto_60374 ) ) ( not ( = ?auto_60371 ?auto_60373 ) ) ( not ( = ?auto_60371 ?auto_60374 ) ) ( not ( = ?auto_60373 ?auto_60374 ) ) ( ON ?auto_60374 ?auto_60372 ) ( not ( = ?auto_60368 ?auto_60372 ) ) ( not ( = ?auto_60369 ?auto_60372 ) ) ( not ( = ?auto_60370 ?auto_60372 ) ) ( not ( = ?auto_60371 ?auto_60372 ) ) ( not ( = ?auto_60373 ?auto_60372 ) ) ( not ( = ?auto_60374 ?auto_60372 ) ) ( ON ?auto_60373 ?auto_60374 ) ( ON-TABLE ?auto_60372 ) ( ON ?auto_60371 ?auto_60373 ) ( ON ?auto_60370 ?auto_60371 ) ( ON ?auto_60369 ?auto_60370 ) ( CLEAR ?auto_60369 ) ( HOLDING ?auto_60368 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60368 )
      ( MAKE-3PILE ?auto_60368 ?auto_60369 ?auto_60370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60375 - BLOCK
      ?auto_60376 - BLOCK
      ?auto_60377 - BLOCK
    )
    :vars
    (
      ?auto_60380 - BLOCK
      ?auto_60378 - BLOCK
      ?auto_60379 - BLOCK
      ?auto_60381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60375 ?auto_60376 ) ) ( not ( = ?auto_60375 ?auto_60377 ) ) ( not ( = ?auto_60375 ?auto_60380 ) ) ( not ( = ?auto_60376 ?auto_60377 ) ) ( not ( = ?auto_60376 ?auto_60380 ) ) ( not ( = ?auto_60377 ?auto_60380 ) ) ( not ( = ?auto_60375 ?auto_60378 ) ) ( not ( = ?auto_60375 ?auto_60379 ) ) ( not ( = ?auto_60376 ?auto_60378 ) ) ( not ( = ?auto_60376 ?auto_60379 ) ) ( not ( = ?auto_60377 ?auto_60378 ) ) ( not ( = ?auto_60377 ?auto_60379 ) ) ( not ( = ?auto_60380 ?auto_60378 ) ) ( not ( = ?auto_60380 ?auto_60379 ) ) ( not ( = ?auto_60378 ?auto_60379 ) ) ( ON ?auto_60379 ?auto_60381 ) ( not ( = ?auto_60375 ?auto_60381 ) ) ( not ( = ?auto_60376 ?auto_60381 ) ) ( not ( = ?auto_60377 ?auto_60381 ) ) ( not ( = ?auto_60380 ?auto_60381 ) ) ( not ( = ?auto_60378 ?auto_60381 ) ) ( not ( = ?auto_60379 ?auto_60381 ) ) ( ON ?auto_60378 ?auto_60379 ) ( ON-TABLE ?auto_60381 ) ( ON ?auto_60380 ?auto_60378 ) ( ON ?auto_60377 ?auto_60380 ) ( ON ?auto_60376 ?auto_60377 ) ( ON ?auto_60375 ?auto_60376 ) ( CLEAR ?auto_60375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60381 ?auto_60379 ?auto_60378 ?auto_60380 ?auto_60377 ?auto_60376 )
      ( MAKE-3PILE ?auto_60375 ?auto_60376 ?auto_60377 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60385 - BLOCK
      ?auto_60386 - BLOCK
      ?auto_60387 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_60387 ) ( CLEAR ?auto_60386 ) ( ON-TABLE ?auto_60385 ) ( ON ?auto_60386 ?auto_60385 ) ( not ( = ?auto_60385 ?auto_60386 ) ) ( not ( = ?auto_60385 ?auto_60387 ) ) ( not ( = ?auto_60386 ?auto_60387 ) ) )
    :subtasks
    ( ( !STACK ?auto_60387 ?auto_60386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60388 - BLOCK
      ?auto_60389 - BLOCK
      ?auto_60390 - BLOCK
    )
    :vars
    (
      ?auto_60391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60389 ) ( ON-TABLE ?auto_60388 ) ( ON ?auto_60389 ?auto_60388 ) ( not ( = ?auto_60388 ?auto_60389 ) ) ( not ( = ?auto_60388 ?auto_60390 ) ) ( not ( = ?auto_60389 ?auto_60390 ) ) ( ON ?auto_60390 ?auto_60391 ) ( CLEAR ?auto_60390 ) ( HAND-EMPTY ) ( not ( = ?auto_60388 ?auto_60391 ) ) ( not ( = ?auto_60389 ?auto_60391 ) ) ( not ( = ?auto_60390 ?auto_60391 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60390 ?auto_60391 )
      ( MAKE-3PILE ?auto_60388 ?auto_60389 ?auto_60390 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60392 - BLOCK
      ?auto_60393 - BLOCK
      ?auto_60394 - BLOCK
    )
    :vars
    (
      ?auto_60395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60392 ) ( not ( = ?auto_60392 ?auto_60393 ) ) ( not ( = ?auto_60392 ?auto_60394 ) ) ( not ( = ?auto_60393 ?auto_60394 ) ) ( ON ?auto_60394 ?auto_60395 ) ( CLEAR ?auto_60394 ) ( not ( = ?auto_60392 ?auto_60395 ) ) ( not ( = ?auto_60393 ?auto_60395 ) ) ( not ( = ?auto_60394 ?auto_60395 ) ) ( HOLDING ?auto_60393 ) ( CLEAR ?auto_60392 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60392 ?auto_60393 )
      ( MAKE-3PILE ?auto_60392 ?auto_60393 ?auto_60394 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60396 - BLOCK
      ?auto_60397 - BLOCK
      ?auto_60398 - BLOCK
    )
    :vars
    (
      ?auto_60399 - BLOCK
      ?auto_60401 - BLOCK
      ?auto_60400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60396 ) ( not ( = ?auto_60396 ?auto_60397 ) ) ( not ( = ?auto_60396 ?auto_60398 ) ) ( not ( = ?auto_60397 ?auto_60398 ) ) ( ON ?auto_60398 ?auto_60399 ) ( not ( = ?auto_60396 ?auto_60399 ) ) ( not ( = ?auto_60397 ?auto_60399 ) ) ( not ( = ?auto_60398 ?auto_60399 ) ) ( CLEAR ?auto_60396 ) ( ON ?auto_60397 ?auto_60398 ) ( CLEAR ?auto_60397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60401 ) ( ON ?auto_60400 ?auto_60401 ) ( ON ?auto_60399 ?auto_60400 ) ( not ( = ?auto_60401 ?auto_60400 ) ) ( not ( = ?auto_60401 ?auto_60399 ) ) ( not ( = ?auto_60401 ?auto_60398 ) ) ( not ( = ?auto_60401 ?auto_60397 ) ) ( not ( = ?auto_60400 ?auto_60399 ) ) ( not ( = ?auto_60400 ?auto_60398 ) ) ( not ( = ?auto_60400 ?auto_60397 ) ) ( not ( = ?auto_60396 ?auto_60401 ) ) ( not ( = ?auto_60396 ?auto_60400 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60401 ?auto_60400 ?auto_60399 ?auto_60398 )
      ( MAKE-3PILE ?auto_60396 ?auto_60397 ?auto_60398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60402 - BLOCK
      ?auto_60403 - BLOCK
      ?auto_60404 - BLOCK
    )
    :vars
    (
      ?auto_60407 - BLOCK
      ?auto_60405 - BLOCK
      ?auto_60406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60402 ?auto_60403 ) ) ( not ( = ?auto_60402 ?auto_60404 ) ) ( not ( = ?auto_60403 ?auto_60404 ) ) ( ON ?auto_60404 ?auto_60407 ) ( not ( = ?auto_60402 ?auto_60407 ) ) ( not ( = ?auto_60403 ?auto_60407 ) ) ( not ( = ?auto_60404 ?auto_60407 ) ) ( ON ?auto_60403 ?auto_60404 ) ( CLEAR ?auto_60403 ) ( ON-TABLE ?auto_60405 ) ( ON ?auto_60406 ?auto_60405 ) ( ON ?auto_60407 ?auto_60406 ) ( not ( = ?auto_60405 ?auto_60406 ) ) ( not ( = ?auto_60405 ?auto_60407 ) ) ( not ( = ?auto_60405 ?auto_60404 ) ) ( not ( = ?auto_60405 ?auto_60403 ) ) ( not ( = ?auto_60406 ?auto_60407 ) ) ( not ( = ?auto_60406 ?auto_60404 ) ) ( not ( = ?auto_60406 ?auto_60403 ) ) ( not ( = ?auto_60402 ?auto_60405 ) ) ( not ( = ?auto_60402 ?auto_60406 ) ) ( HOLDING ?auto_60402 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60402 )
      ( MAKE-3PILE ?auto_60402 ?auto_60403 ?auto_60404 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60408 - BLOCK
      ?auto_60409 - BLOCK
      ?auto_60410 - BLOCK
    )
    :vars
    (
      ?auto_60413 - BLOCK
      ?auto_60412 - BLOCK
      ?auto_60411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60408 ?auto_60409 ) ) ( not ( = ?auto_60408 ?auto_60410 ) ) ( not ( = ?auto_60409 ?auto_60410 ) ) ( ON ?auto_60410 ?auto_60413 ) ( not ( = ?auto_60408 ?auto_60413 ) ) ( not ( = ?auto_60409 ?auto_60413 ) ) ( not ( = ?auto_60410 ?auto_60413 ) ) ( ON ?auto_60409 ?auto_60410 ) ( ON-TABLE ?auto_60412 ) ( ON ?auto_60411 ?auto_60412 ) ( ON ?auto_60413 ?auto_60411 ) ( not ( = ?auto_60412 ?auto_60411 ) ) ( not ( = ?auto_60412 ?auto_60413 ) ) ( not ( = ?auto_60412 ?auto_60410 ) ) ( not ( = ?auto_60412 ?auto_60409 ) ) ( not ( = ?auto_60411 ?auto_60413 ) ) ( not ( = ?auto_60411 ?auto_60410 ) ) ( not ( = ?auto_60411 ?auto_60409 ) ) ( not ( = ?auto_60408 ?auto_60412 ) ) ( not ( = ?auto_60408 ?auto_60411 ) ) ( ON ?auto_60408 ?auto_60409 ) ( CLEAR ?auto_60408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60412 ?auto_60411 ?auto_60413 ?auto_60410 ?auto_60409 )
      ( MAKE-3PILE ?auto_60408 ?auto_60409 ?auto_60410 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60414 - BLOCK
      ?auto_60415 - BLOCK
      ?auto_60416 - BLOCK
    )
    :vars
    (
      ?auto_60418 - BLOCK
      ?auto_60419 - BLOCK
      ?auto_60417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60414 ?auto_60415 ) ) ( not ( = ?auto_60414 ?auto_60416 ) ) ( not ( = ?auto_60415 ?auto_60416 ) ) ( ON ?auto_60416 ?auto_60418 ) ( not ( = ?auto_60414 ?auto_60418 ) ) ( not ( = ?auto_60415 ?auto_60418 ) ) ( not ( = ?auto_60416 ?auto_60418 ) ) ( ON ?auto_60415 ?auto_60416 ) ( ON-TABLE ?auto_60419 ) ( ON ?auto_60417 ?auto_60419 ) ( ON ?auto_60418 ?auto_60417 ) ( not ( = ?auto_60419 ?auto_60417 ) ) ( not ( = ?auto_60419 ?auto_60418 ) ) ( not ( = ?auto_60419 ?auto_60416 ) ) ( not ( = ?auto_60419 ?auto_60415 ) ) ( not ( = ?auto_60417 ?auto_60418 ) ) ( not ( = ?auto_60417 ?auto_60416 ) ) ( not ( = ?auto_60417 ?auto_60415 ) ) ( not ( = ?auto_60414 ?auto_60419 ) ) ( not ( = ?auto_60414 ?auto_60417 ) ) ( HOLDING ?auto_60414 ) ( CLEAR ?auto_60415 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60419 ?auto_60417 ?auto_60418 ?auto_60416 ?auto_60415 ?auto_60414 )
      ( MAKE-3PILE ?auto_60414 ?auto_60415 ?auto_60416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60420 - BLOCK
      ?auto_60421 - BLOCK
      ?auto_60422 - BLOCK
    )
    :vars
    (
      ?auto_60424 - BLOCK
      ?auto_60423 - BLOCK
      ?auto_60425 - BLOCK
      ?auto_60426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60420 ?auto_60421 ) ) ( not ( = ?auto_60420 ?auto_60422 ) ) ( not ( = ?auto_60421 ?auto_60422 ) ) ( ON ?auto_60422 ?auto_60424 ) ( not ( = ?auto_60420 ?auto_60424 ) ) ( not ( = ?auto_60421 ?auto_60424 ) ) ( not ( = ?auto_60422 ?auto_60424 ) ) ( ON ?auto_60421 ?auto_60422 ) ( ON-TABLE ?auto_60423 ) ( ON ?auto_60425 ?auto_60423 ) ( ON ?auto_60424 ?auto_60425 ) ( not ( = ?auto_60423 ?auto_60425 ) ) ( not ( = ?auto_60423 ?auto_60424 ) ) ( not ( = ?auto_60423 ?auto_60422 ) ) ( not ( = ?auto_60423 ?auto_60421 ) ) ( not ( = ?auto_60425 ?auto_60424 ) ) ( not ( = ?auto_60425 ?auto_60422 ) ) ( not ( = ?auto_60425 ?auto_60421 ) ) ( not ( = ?auto_60420 ?auto_60423 ) ) ( not ( = ?auto_60420 ?auto_60425 ) ) ( CLEAR ?auto_60421 ) ( ON ?auto_60420 ?auto_60426 ) ( CLEAR ?auto_60420 ) ( HAND-EMPTY ) ( not ( = ?auto_60420 ?auto_60426 ) ) ( not ( = ?auto_60421 ?auto_60426 ) ) ( not ( = ?auto_60422 ?auto_60426 ) ) ( not ( = ?auto_60424 ?auto_60426 ) ) ( not ( = ?auto_60423 ?auto_60426 ) ) ( not ( = ?auto_60425 ?auto_60426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60420 ?auto_60426 )
      ( MAKE-3PILE ?auto_60420 ?auto_60421 ?auto_60422 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60427 - BLOCK
      ?auto_60428 - BLOCK
      ?auto_60429 - BLOCK
    )
    :vars
    (
      ?auto_60430 - BLOCK
      ?auto_60431 - BLOCK
      ?auto_60432 - BLOCK
      ?auto_60433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60427 ?auto_60428 ) ) ( not ( = ?auto_60427 ?auto_60429 ) ) ( not ( = ?auto_60428 ?auto_60429 ) ) ( ON ?auto_60429 ?auto_60430 ) ( not ( = ?auto_60427 ?auto_60430 ) ) ( not ( = ?auto_60428 ?auto_60430 ) ) ( not ( = ?auto_60429 ?auto_60430 ) ) ( ON-TABLE ?auto_60431 ) ( ON ?auto_60432 ?auto_60431 ) ( ON ?auto_60430 ?auto_60432 ) ( not ( = ?auto_60431 ?auto_60432 ) ) ( not ( = ?auto_60431 ?auto_60430 ) ) ( not ( = ?auto_60431 ?auto_60429 ) ) ( not ( = ?auto_60431 ?auto_60428 ) ) ( not ( = ?auto_60432 ?auto_60430 ) ) ( not ( = ?auto_60432 ?auto_60429 ) ) ( not ( = ?auto_60432 ?auto_60428 ) ) ( not ( = ?auto_60427 ?auto_60431 ) ) ( not ( = ?auto_60427 ?auto_60432 ) ) ( ON ?auto_60427 ?auto_60433 ) ( CLEAR ?auto_60427 ) ( not ( = ?auto_60427 ?auto_60433 ) ) ( not ( = ?auto_60428 ?auto_60433 ) ) ( not ( = ?auto_60429 ?auto_60433 ) ) ( not ( = ?auto_60430 ?auto_60433 ) ) ( not ( = ?auto_60431 ?auto_60433 ) ) ( not ( = ?auto_60432 ?auto_60433 ) ) ( HOLDING ?auto_60428 ) ( CLEAR ?auto_60429 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60431 ?auto_60432 ?auto_60430 ?auto_60429 ?auto_60428 )
      ( MAKE-3PILE ?auto_60427 ?auto_60428 ?auto_60429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60434 - BLOCK
      ?auto_60435 - BLOCK
      ?auto_60436 - BLOCK
    )
    :vars
    (
      ?auto_60439 - BLOCK
      ?auto_60437 - BLOCK
      ?auto_60440 - BLOCK
      ?auto_60438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60434 ?auto_60435 ) ) ( not ( = ?auto_60434 ?auto_60436 ) ) ( not ( = ?auto_60435 ?auto_60436 ) ) ( ON ?auto_60436 ?auto_60439 ) ( not ( = ?auto_60434 ?auto_60439 ) ) ( not ( = ?auto_60435 ?auto_60439 ) ) ( not ( = ?auto_60436 ?auto_60439 ) ) ( ON-TABLE ?auto_60437 ) ( ON ?auto_60440 ?auto_60437 ) ( ON ?auto_60439 ?auto_60440 ) ( not ( = ?auto_60437 ?auto_60440 ) ) ( not ( = ?auto_60437 ?auto_60439 ) ) ( not ( = ?auto_60437 ?auto_60436 ) ) ( not ( = ?auto_60437 ?auto_60435 ) ) ( not ( = ?auto_60440 ?auto_60439 ) ) ( not ( = ?auto_60440 ?auto_60436 ) ) ( not ( = ?auto_60440 ?auto_60435 ) ) ( not ( = ?auto_60434 ?auto_60437 ) ) ( not ( = ?auto_60434 ?auto_60440 ) ) ( ON ?auto_60434 ?auto_60438 ) ( not ( = ?auto_60434 ?auto_60438 ) ) ( not ( = ?auto_60435 ?auto_60438 ) ) ( not ( = ?auto_60436 ?auto_60438 ) ) ( not ( = ?auto_60439 ?auto_60438 ) ) ( not ( = ?auto_60437 ?auto_60438 ) ) ( not ( = ?auto_60440 ?auto_60438 ) ) ( CLEAR ?auto_60436 ) ( ON ?auto_60435 ?auto_60434 ) ( CLEAR ?auto_60435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60438 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60438 ?auto_60434 )
      ( MAKE-3PILE ?auto_60434 ?auto_60435 ?auto_60436 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60441 - BLOCK
      ?auto_60442 - BLOCK
      ?auto_60443 - BLOCK
    )
    :vars
    (
      ?auto_60446 - BLOCK
      ?auto_60447 - BLOCK
      ?auto_60445 - BLOCK
      ?auto_60444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60441 ?auto_60442 ) ) ( not ( = ?auto_60441 ?auto_60443 ) ) ( not ( = ?auto_60442 ?auto_60443 ) ) ( not ( = ?auto_60441 ?auto_60446 ) ) ( not ( = ?auto_60442 ?auto_60446 ) ) ( not ( = ?auto_60443 ?auto_60446 ) ) ( ON-TABLE ?auto_60447 ) ( ON ?auto_60445 ?auto_60447 ) ( ON ?auto_60446 ?auto_60445 ) ( not ( = ?auto_60447 ?auto_60445 ) ) ( not ( = ?auto_60447 ?auto_60446 ) ) ( not ( = ?auto_60447 ?auto_60443 ) ) ( not ( = ?auto_60447 ?auto_60442 ) ) ( not ( = ?auto_60445 ?auto_60446 ) ) ( not ( = ?auto_60445 ?auto_60443 ) ) ( not ( = ?auto_60445 ?auto_60442 ) ) ( not ( = ?auto_60441 ?auto_60447 ) ) ( not ( = ?auto_60441 ?auto_60445 ) ) ( ON ?auto_60441 ?auto_60444 ) ( not ( = ?auto_60441 ?auto_60444 ) ) ( not ( = ?auto_60442 ?auto_60444 ) ) ( not ( = ?auto_60443 ?auto_60444 ) ) ( not ( = ?auto_60446 ?auto_60444 ) ) ( not ( = ?auto_60447 ?auto_60444 ) ) ( not ( = ?auto_60445 ?auto_60444 ) ) ( ON ?auto_60442 ?auto_60441 ) ( CLEAR ?auto_60442 ) ( ON-TABLE ?auto_60444 ) ( HOLDING ?auto_60443 ) ( CLEAR ?auto_60446 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60447 ?auto_60445 ?auto_60446 ?auto_60443 )
      ( MAKE-3PILE ?auto_60441 ?auto_60442 ?auto_60443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60448 - BLOCK
      ?auto_60449 - BLOCK
      ?auto_60450 - BLOCK
    )
    :vars
    (
      ?auto_60454 - BLOCK
      ?auto_60452 - BLOCK
      ?auto_60453 - BLOCK
      ?auto_60451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60448 ?auto_60449 ) ) ( not ( = ?auto_60448 ?auto_60450 ) ) ( not ( = ?auto_60449 ?auto_60450 ) ) ( not ( = ?auto_60448 ?auto_60454 ) ) ( not ( = ?auto_60449 ?auto_60454 ) ) ( not ( = ?auto_60450 ?auto_60454 ) ) ( ON-TABLE ?auto_60452 ) ( ON ?auto_60453 ?auto_60452 ) ( ON ?auto_60454 ?auto_60453 ) ( not ( = ?auto_60452 ?auto_60453 ) ) ( not ( = ?auto_60452 ?auto_60454 ) ) ( not ( = ?auto_60452 ?auto_60450 ) ) ( not ( = ?auto_60452 ?auto_60449 ) ) ( not ( = ?auto_60453 ?auto_60454 ) ) ( not ( = ?auto_60453 ?auto_60450 ) ) ( not ( = ?auto_60453 ?auto_60449 ) ) ( not ( = ?auto_60448 ?auto_60452 ) ) ( not ( = ?auto_60448 ?auto_60453 ) ) ( ON ?auto_60448 ?auto_60451 ) ( not ( = ?auto_60448 ?auto_60451 ) ) ( not ( = ?auto_60449 ?auto_60451 ) ) ( not ( = ?auto_60450 ?auto_60451 ) ) ( not ( = ?auto_60454 ?auto_60451 ) ) ( not ( = ?auto_60452 ?auto_60451 ) ) ( not ( = ?auto_60453 ?auto_60451 ) ) ( ON ?auto_60449 ?auto_60448 ) ( ON-TABLE ?auto_60451 ) ( CLEAR ?auto_60454 ) ( ON ?auto_60450 ?auto_60449 ) ( CLEAR ?auto_60450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60451 ?auto_60448 ?auto_60449 )
      ( MAKE-3PILE ?auto_60448 ?auto_60449 ?auto_60450 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60455 - BLOCK
      ?auto_60456 - BLOCK
      ?auto_60457 - BLOCK
    )
    :vars
    (
      ?auto_60459 - BLOCK
      ?auto_60458 - BLOCK
      ?auto_60461 - BLOCK
      ?auto_60460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60455 ?auto_60456 ) ) ( not ( = ?auto_60455 ?auto_60457 ) ) ( not ( = ?auto_60456 ?auto_60457 ) ) ( not ( = ?auto_60455 ?auto_60459 ) ) ( not ( = ?auto_60456 ?auto_60459 ) ) ( not ( = ?auto_60457 ?auto_60459 ) ) ( ON-TABLE ?auto_60458 ) ( ON ?auto_60461 ?auto_60458 ) ( not ( = ?auto_60458 ?auto_60461 ) ) ( not ( = ?auto_60458 ?auto_60459 ) ) ( not ( = ?auto_60458 ?auto_60457 ) ) ( not ( = ?auto_60458 ?auto_60456 ) ) ( not ( = ?auto_60461 ?auto_60459 ) ) ( not ( = ?auto_60461 ?auto_60457 ) ) ( not ( = ?auto_60461 ?auto_60456 ) ) ( not ( = ?auto_60455 ?auto_60458 ) ) ( not ( = ?auto_60455 ?auto_60461 ) ) ( ON ?auto_60455 ?auto_60460 ) ( not ( = ?auto_60455 ?auto_60460 ) ) ( not ( = ?auto_60456 ?auto_60460 ) ) ( not ( = ?auto_60457 ?auto_60460 ) ) ( not ( = ?auto_60459 ?auto_60460 ) ) ( not ( = ?auto_60458 ?auto_60460 ) ) ( not ( = ?auto_60461 ?auto_60460 ) ) ( ON ?auto_60456 ?auto_60455 ) ( ON-TABLE ?auto_60460 ) ( ON ?auto_60457 ?auto_60456 ) ( CLEAR ?auto_60457 ) ( HOLDING ?auto_60459 ) ( CLEAR ?auto_60461 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60458 ?auto_60461 ?auto_60459 )
      ( MAKE-3PILE ?auto_60455 ?auto_60456 ?auto_60457 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60462 - BLOCK
      ?auto_60463 - BLOCK
      ?auto_60464 - BLOCK
    )
    :vars
    (
      ?auto_60468 - BLOCK
      ?auto_60467 - BLOCK
      ?auto_60465 - BLOCK
      ?auto_60466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60462 ?auto_60463 ) ) ( not ( = ?auto_60462 ?auto_60464 ) ) ( not ( = ?auto_60463 ?auto_60464 ) ) ( not ( = ?auto_60462 ?auto_60468 ) ) ( not ( = ?auto_60463 ?auto_60468 ) ) ( not ( = ?auto_60464 ?auto_60468 ) ) ( ON-TABLE ?auto_60467 ) ( ON ?auto_60465 ?auto_60467 ) ( not ( = ?auto_60467 ?auto_60465 ) ) ( not ( = ?auto_60467 ?auto_60468 ) ) ( not ( = ?auto_60467 ?auto_60464 ) ) ( not ( = ?auto_60467 ?auto_60463 ) ) ( not ( = ?auto_60465 ?auto_60468 ) ) ( not ( = ?auto_60465 ?auto_60464 ) ) ( not ( = ?auto_60465 ?auto_60463 ) ) ( not ( = ?auto_60462 ?auto_60467 ) ) ( not ( = ?auto_60462 ?auto_60465 ) ) ( ON ?auto_60462 ?auto_60466 ) ( not ( = ?auto_60462 ?auto_60466 ) ) ( not ( = ?auto_60463 ?auto_60466 ) ) ( not ( = ?auto_60464 ?auto_60466 ) ) ( not ( = ?auto_60468 ?auto_60466 ) ) ( not ( = ?auto_60467 ?auto_60466 ) ) ( not ( = ?auto_60465 ?auto_60466 ) ) ( ON ?auto_60463 ?auto_60462 ) ( ON-TABLE ?auto_60466 ) ( ON ?auto_60464 ?auto_60463 ) ( CLEAR ?auto_60465 ) ( ON ?auto_60468 ?auto_60464 ) ( CLEAR ?auto_60468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60466 ?auto_60462 ?auto_60463 ?auto_60464 )
      ( MAKE-3PILE ?auto_60462 ?auto_60463 ?auto_60464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60469 - BLOCK
      ?auto_60470 - BLOCK
      ?auto_60471 - BLOCK
    )
    :vars
    (
      ?auto_60472 - BLOCK
      ?auto_60474 - BLOCK
      ?auto_60473 - BLOCK
      ?auto_60475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60469 ?auto_60470 ) ) ( not ( = ?auto_60469 ?auto_60471 ) ) ( not ( = ?auto_60470 ?auto_60471 ) ) ( not ( = ?auto_60469 ?auto_60472 ) ) ( not ( = ?auto_60470 ?auto_60472 ) ) ( not ( = ?auto_60471 ?auto_60472 ) ) ( ON-TABLE ?auto_60474 ) ( not ( = ?auto_60474 ?auto_60473 ) ) ( not ( = ?auto_60474 ?auto_60472 ) ) ( not ( = ?auto_60474 ?auto_60471 ) ) ( not ( = ?auto_60474 ?auto_60470 ) ) ( not ( = ?auto_60473 ?auto_60472 ) ) ( not ( = ?auto_60473 ?auto_60471 ) ) ( not ( = ?auto_60473 ?auto_60470 ) ) ( not ( = ?auto_60469 ?auto_60474 ) ) ( not ( = ?auto_60469 ?auto_60473 ) ) ( ON ?auto_60469 ?auto_60475 ) ( not ( = ?auto_60469 ?auto_60475 ) ) ( not ( = ?auto_60470 ?auto_60475 ) ) ( not ( = ?auto_60471 ?auto_60475 ) ) ( not ( = ?auto_60472 ?auto_60475 ) ) ( not ( = ?auto_60474 ?auto_60475 ) ) ( not ( = ?auto_60473 ?auto_60475 ) ) ( ON ?auto_60470 ?auto_60469 ) ( ON-TABLE ?auto_60475 ) ( ON ?auto_60471 ?auto_60470 ) ( ON ?auto_60472 ?auto_60471 ) ( CLEAR ?auto_60472 ) ( HOLDING ?auto_60473 ) ( CLEAR ?auto_60474 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60474 ?auto_60473 )
      ( MAKE-3PILE ?auto_60469 ?auto_60470 ?auto_60471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60476 - BLOCK
      ?auto_60477 - BLOCK
      ?auto_60478 - BLOCK
    )
    :vars
    (
      ?auto_60482 - BLOCK
      ?auto_60480 - BLOCK
      ?auto_60481 - BLOCK
      ?auto_60479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60476 ?auto_60477 ) ) ( not ( = ?auto_60476 ?auto_60478 ) ) ( not ( = ?auto_60477 ?auto_60478 ) ) ( not ( = ?auto_60476 ?auto_60482 ) ) ( not ( = ?auto_60477 ?auto_60482 ) ) ( not ( = ?auto_60478 ?auto_60482 ) ) ( ON-TABLE ?auto_60480 ) ( not ( = ?auto_60480 ?auto_60481 ) ) ( not ( = ?auto_60480 ?auto_60482 ) ) ( not ( = ?auto_60480 ?auto_60478 ) ) ( not ( = ?auto_60480 ?auto_60477 ) ) ( not ( = ?auto_60481 ?auto_60482 ) ) ( not ( = ?auto_60481 ?auto_60478 ) ) ( not ( = ?auto_60481 ?auto_60477 ) ) ( not ( = ?auto_60476 ?auto_60480 ) ) ( not ( = ?auto_60476 ?auto_60481 ) ) ( ON ?auto_60476 ?auto_60479 ) ( not ( = ?auto_60476 ?auto_60479 ) ) ( not ( = ?auto_60477 ?auto_60479 ) ) ( not ( = ?auto_60478 ?auto_60479 ) ) ( not ( = ?auto_60482 ?auto_60479 ) ) ( not ( = ?auto_60480 ?auto_60479 ) ) ( not ( = ?auto_60481 ?auto_60479 ) ) ( ON ?auto_60477 ?auto_60476 ) ( ON-TABLE ?auto_60479 ) ( ON ?auto_60478 ?auto_60477 ) ( ON ?auto_60482 ?auto_60478 ) ( CLEAR ?auto_60480 ) ( ON ?auto_60481 ?auto_60482 ) ( CLEAR ?auto_60481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60479 ?auto_60476 ?auto_60477 ?auto_60478 ?auto_60482 )
      ( MAKE-3PILE ?auto_60476 ?auto_60477 ?auto_60478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60483 - BLOCK
      ?auto_60484 - BLOCK
      ?auto_60485 - BLOCK
    )
    :vars
    (
      ?auto_60486 - BLOCK
      ?auto_60487 - BLOCK
      ?auto_60489 - BLOCK
      ?auto_60488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60483 ?auto_60484 ) ) ( not ( = ?auto_60483 ?auto_60485 ) ) ( not ( = ?auto_60484 ?auto_60485 ) ) ( not ( = ?auto_60483 ?auto_60486 ) ) ( not ( = ?auto_60484 ?auto_60486 ) ) ( not ( = ?auto_60485 ?auto_60486 ) ) ( not ( = ?auto_60487 ?auto_60489 ) ) ( not ( = ?auto_60487 ?auto_60486 ) ) ( not ( = ?auto_60487 ?auto_60485 ) ) ( not ( = ?auto_60487 ?auto_60484 ) ) ( not ( = ?auto_60489 ?auto_60486 ) ) ( not ( = ?auto_60489 ?auto_60485 ) ) ( not ( = ?auto_60489 ?auto_60484 ) ) ( not ( = ?auto_60483 ?auto_60487 ) ) ( not ( = ?auto_60483 ?auto_60489 ) ) ( ON ?auto_60483 ?auto_60488 ) ( not ( = ?auto_60483 ?auto_60488 ) ) ( not ( = ?auto_60484 ?auto_60488 ) ) ( not ( = ?auto_60485 ?auto_60488 ) ) ( not ( = ?auto_60486 ?auto_60488 ) ) ( not ( = ?auto_60487 ?auto_60488 ) ) ( not ( = ?auto_60489 ?auto_60488 ) ) ( ON ?auto_60484 ?auto_60483 ) ( ON-TABLE ?auto_60488 ) ( ON ?auto_60485 ?auto_60484 ) ( ON ?auto_60486 ?auto_60485 ) ( ON ?auto_60489 ?auto_60486 ) ( CLEAR ?auto_60489 ) ( HOLDING ?auto_60487 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60487 )
      ( MAKE-3PILE ?auto_60483 ?auto_60484 ?auto_60485 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60490 - BLOCK
      ?auto_60491 - BLOCK
      ?auto_60492 - BLOCK
    )
    :vars
    (
      ?auto_60496 - BLOCK
      ?auto_60494 - BLOCK
      ?auto_60495 - BLOCK
      ?auto_60493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60490 ?auto_60491 ) ) ( not ( = ?auto_60490 ?auto_60492 ) ) ( not ( = ?auto_60491 ?auto_60492 ) ) ( not ( = ?auto_60490 ?auto_60496 ) ) ( not ( = ?auto_60491 ?auto_60496 ) ) ( not ( = ?auto_60492 ?auto_60496 ) ) ( not ( = ?auto_60494 ?auto_60495 ) ) ( not ( = ?auto_60494 ?auto_60496 ) ) ( not ( = ?auto_60494 ?auto_60492 ) ) ( not ( = ?auto_60494 ?auto_60491 ) ) ( not ( = ?auto_60495 ?auto_60496 ) ) ( not ( = ?auto_60495 ?auto_60492 ) ) ( not ( = ?auto_60495 ?auto_60491 ) ) ( not ( = ?auto_60490 ?auto_60494 ) ) ( not ( = ?auto_60490 ?auto_60495 ) ) ( ON ?auto_60490 ?auto_60493 ) ( not ( = ?auto_60490 ?auto_60493 ) ) ( not ( = ?auto_60491 ?auto_60493 ) ) ( not ( = ?auto_60492 ?auto_60493 ) ) ( not ( = ?auto_60496 ?auto_60493 ) ) ( not ( = ?auto_60494 ?auto_60493 ) ) ( not ( = ?auto_60495 ?auto_60493 ) ) ( ON ?auto_60491 ?auto_60490 ) ( ON-TABLE ?auto_60493 ) ( ON ?auto_60492 ?auto_60491 ) ( ON ?auto_60496 ?auto_60492 ) ( ON ?auto_60495 ?auto_60496 ) ( ON ?auto_60494 ?auto_60495 ) ( CLEAR ?auto_60494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60493 ?auto_60490 ?auto_60491 ?auto_60492 ?auto_60496 ?auto_60495 )
      ( MAKE-3PILE ?auto_60490 ?auto_60491 ?auto_60492 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60499 - BLOCK
      ?auto_60500 - BLOCK
    )
    :vars
    (
      ?auto_60501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60501 ?auto_60500 ) ( CLEAR ?auto_60501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60499 ) ( ON ?auto_60500 ?auto_60499 ) ( not ( = ?auto_60499 ?auto_60500 ) ) ( not ( = ?auto_60499 ?auto_60501 ) ) ( not ( = ?auto_60500 ?auto_60501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60501 ?auto_60500 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60502 - BLOCK
      ?auto_60503 - BLOCK
    )
    :vars
    (
      ?auto_60504 - BLOCK
      ?auto_60505 - BLOCK
      ?auto_60506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60504 ?auto_60503 ) ( CLEAR ?auto_60504 ) ( ON-TABLE ?auto_60502 ) ( ON ?auto_60503 ?auto_60502 ) ( not ( = ?auto_60502 ?auto_60503 ) ) ( not ( = ?auto_60502 ?auto_60504 ) ) ( not ( = ?auto_60503 ?auto_60504 ) ) ( HOLDING ?auto_60505 ) ( CLEAR ?auto_60506 ) ( not ( = ?auto_60502 ?auto_60505 ) ) ( not ( = ?auto_60502 ?auto_60506 ) ) ( not ( = ?auto_60503 ?auto_60505 ) ) ( not ( = ?auto_60503 ?auto_60506 ) ) ( not ( = ?auto_60504 ?auto_60505 ) ) ( not ( = ?auto_60504 ?auto_60506 ) ) ( not ( = ?auto_60505 ?auto_60506 ) ) )
    :subtasks
    ( ( !STACK ?auto_60505 ?auto_60506 )
      ( MAKE-2PILE ?auto_60502 ?auto_60503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60507 - BLOCK
      ?auto_60508 - BLOCK
    )
    :vars
    (
      ?auto_60511 - BLOCK
      ?auto_60509 - BLOCK
      ?auto_60510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60511 ?auto_60508 ) ( ON-TABLE ?auto_60507 ) ( ON ?auto_60508 ?auto_60507 ) ( not ( = ?auto_60507 ?auto_60508 ) ) ( not ( = ?auto_60507 ?auto_60511 ) ) ( not ( = ?auto_60508 ?auto_60511 ) ) ( CLEAR ?auto_60509 ) ( not ( = ?auto_60507 ?auto_60510 ) ) ( not ( = ?auto_60507 ?auto_60509 ) ) ( not ( = ?auto_60508 ?auto_60510 ) ) ( not ( = ?auto_60508 ?auto_60509 ) ) ( not ( = ?auto_60511 ?auto_60510 ) ) ( not ( = ?auto_60511 ?auto_60509 ) ) ( not ( = ?auto_60510 ?auto_60509 ) ) ( ON ?auto_60510 ?auto_60511 ) ( CLEAR ?auto_60510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60507 ?auto_60508 ?auto_60511 )
      ( MAKE-2PILE ?auto_60507 ?auto_60508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60512 - BLOCK
      ?auto_60513 - BLOCK
    )
    :vars
    (
      ?auto_60514 - BLOCK
      ?auto_60515 - BLOCK
      ?auto_60516 - BLOCK
      ?auto_60517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60514 ?auto_60513 ) ( ON-TABLE ?auto_60512 ) ( ON ?auto_60513 ?auto_60512 ) ( not ( = ?auto_60512 ?auto_60513 ) ) ( not ( = ?auto_60512 ?auto_60514 ) ) ( not ( = ?auto_60513 ?auto_60514 ) ) ( not ( = ?auto_60512 ?auto_60515 ) ) ( not ( = ?auto_60512 ?auto_60516 ) ) ( not ( = ?auto_60513 ?auto_60515 ) ) ( not ( = ?auto_60513 ?auto_60516 ) ) ( not ( = ?auto_60514 ?auto_60515 ) ) ( not ( = ?auto_60514 ?auto_60516 ) ) ( not ( = ?auto_60515 ?auto_60516 ) ) ( ON ?auto_60515 ?auto_60514 ) ( CLEAR ?auto_60515 ) ( HOLDING ?auto_60516 ) ( CLEAR ?auto_60517 ) ( ON-TABLE ?auto_60517 ) ( not ( = ?auto_60517 ?auto_60516 ) ) ( not ( = ?auto_60512 ?auto_60517 ) ) ( not ( = ?auto_60513 ?auto_60517 ) ) ( not ( = ?auto_60514 ?auto_60517 ) ) ( not ( = ?auto_60515 ?auto_60517 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60517 ?auto_60516 )
      ( MAKE-2PILE ?auto_60512 ?auto_60513 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60518 - BLOCK
      ?auto_60519 - BLOCK
    )
    :vars
    (
      ?auto_60521 - BLOCK
      ?auto_60523 - BLOCK
      ?auto_60522 - BLOCK
      ?auto_60520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60521 ?auto_60519 ) ( ON-TABLE ?auto_60518 ) ( ON ?auto_60519 ?auto_60518 ) ( not ( = ?auto_60518 ?auto_60519 ) ) ( not ( = ?auto_60518 ?auto_60521 ) ) ( not ( = ?auto_60519 ?auto_60521 ) ) ( not ( = ?auto_60518 ?auto_60523 ) ) ( not ( = ?auto_60518 ?auto_60522 ) ) ( not ( = ?auto_60519 ?auto_60523 ) ) ( not ( = ?auto_60519 ?auto_60522 ) ) ( not ( = ?auto_60521 ?auto_60523 ) ) ( not ( = ?auto_60521 ?auto_60522 ) ) ( not ( = ?auto_60523 ?auto_60522 ) ) ( ON ?auto_60523 ?auto_60521 ) ( CLEAR ?auto_60520 ) ( ON-TABLE ?auto_60520 ) ( not ( = ?auto_60520 ?auto_60522 ) ) ( not ( = ?auto_60518 ?auto_60520 ) ) ( not ( = ?auto_60519 ?auto_60520 ) ) ( not ( = ?auto_60521 ?auto_60520 ) ) ( not ( = ?auto_60523 ?auto_60520 ) ) ( ON ?auto_60522 ?auto_60523 ) ( CLEAR ?auto_60522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60518 ?auto_60519 ?auto_60521 ?auto_60523 )
      ( MAKE-2PILE ?auto_60518 ?auto_60519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60524 - BLOCK
      ?auto_60525 - BLOCK
    )
    :vars
    (
      ?auto_60526 - BLOCK
      ?auto_60527 - BLOCK
      ?auto_60528 - BLOCK
      ?auto_60529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60526 ?auto_60525 ) ( ON-TABLE ?auto_60524 ) ( ON ?auto_60525 ?auto_60524 ) ( not ( = ?auto_60524 ?auto_60525 ) ) ( not ( = ?auto_60524 ?auto_60526 ) ) ( not ( = ?auto_60525 ?auto_60526 ) ) ( not ( = ?auto_60524 ?auto_60527 ) ) ( not ( = ?auto_60524 ?auto_60528 ) ) ( not ( = ?auto_60525 ?auto_60527 ) ) ( not ( = ?auto_60525 ?auto_60528 ) ) ( not ( = ?auto_60526 ?auto_60527 ) ) ( not ( = ?auto_60526 ?auto_60528 ) ) ( not ( = ?auto_60527 ?auto_60528 ) ) ( ON ?auto_60527 ?auto_60526 ) ( not ( = ?auto_60529 ?auto_60528 ) ) ( not ( = ?auto_60524 ?auto_60529 ) ) ( not ( = ?auto_60525 ?auto_60529 ) ) ( not ( = ?auto_60526 ?auto_60529 ) ) ( not ( = ?auto_60527 ?auto_60529 ) ) ( ON ?auto_60528 ?auto_60527 ) ( CLEAR ?auto_60528 ) ( HOLDING ?auto_60529 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60529 )
      ( MAKE-2PILE ?auto_60524 ?auto_60525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60530 - BLOCK
      ?auto_60531 - BLOCK
    )
    :vars
    (
      ?auto_60533 - BLOCK
      ?auto_60535 - BLOCK
      ?auto_60532 - BLOCK
      ?auto_60534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60533 ?auto_60531 ) ( ON-TABLE ?auto_60530 ) ( ON ?auto_60531 ?auto_60530 ) ( not ( = ?auto_60530 ?auto_60531 ) ) ( not ( = ?auto_60530 ?auto_60533 ) ) ( not ( = ?auto_60531 ?auto_60533 ) ) ( not ( = ?auto_60530 ?auto_60535 ) ) ( not ( = ?auto_60530 ?auto_60532 ) ) ( not ( = ?auto_60531 ?auto_60535 ) ) ( not ( = ?auto_60531 ?auto_60532 ) ) ( not ( = ?auto_60533 ?auto_60535 ) ) ( not ( = ?auto_60533 ?auto_60532 ) ) ( not ( = ?auto_60535 ?auto_60532 ) ) ( ON ?auto_60535 ?auto_60533 ) ( not ( = ?auto_60534 ?auto_60532 ) ) ( not ( = ?auto_60530 ?auto_60534 ) ) ( not ( = ?auto_60531 ?auto_60534 ) ) ( not ( = ?auto_60533 ?auto_60534 ) ) ( not ( = ?auto_60535 ?auto_60534 ) ) ( ON ?auto_60532 ?auto_60535 ) ( ON ?auto_60534 ?auto_60532 ) ( CLEAR ?auto_60534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60530 ?auto_60531 ?auto_60533 ?auto_60535 ?auto_60532 )
      ( MAKE-2PILE ?auto_60530 ?auto_60531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60536 - BLOCK
      ?auto_60537 - BLOCK
    )
    :vars
    (
      ?auto_60541 - BLOCK
      ?auto_60538 - BLOCK
      ?auto_60539 - BLOCK
      ?auto_60540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60541 ?auto_60537 ) ( ON-TABLE ?auto_60536 ) ( ON ?auto_60537 ?auto_60536 ) ( not ( = ?auto_60536 ?auto_60537 ) ) ( not ( = ?auto_60536 ?auto_60541 ) ) ( not ( = ?auto_60537 ?auto_60541 ) ) ( not ( = ?auto_60536 ?auto_60538 ) ) ( not ( = ?auto_60536 ?auto_60539 ) ) ( not ( = ?auto_60537 ?auto_60538 ) ) ( not ( = ?auto_60537 ?auto_60539 ) ) ( not ( = ?auto_60541 ?auto_60538 ) ) ( not ( = ?auto_60541 ?auto_60539 ) ) ( not ( = ?auto_60538 ?auto_60539 ) ) ( ON ?auto_60538 ?auto_60541 ) ( not ( = ?auto_60540 ?auto_60539 ) ) ( not ( = ?auto_60536 ?auto_60540 ) ) ( not ( = ?auto_60537 ?auto_60540 ) ) ( not ( = ?auto_60541 ?auto_60540 ) ) ( not ( = ?auto_60538 ?auto_60540 ) ) ( ON ?auto_60539 ?auto_60538 ) ( HOLDING ?auto_60540 ) ( CLEAR ?auto_60539 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60536 ?auto_60537 ?auto_60541 ?auto_60538 ?auto_60539 ?auto_60540 )
      ( MAKE-2PILE ?auto_60536 ?auto_60537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60542 - BLOCK
      ?auto_60543 - BLOCK
    )
    :vars
    (
      ?auto_60546 - BLOCK
      ?auto_60545 - BLOCK
      ?auto_60547 - BLOCK
      ?auto_60544 - BLOCK
      ?auto_60548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60546 ?auto_60543 ) ( ON-TABLE ?auto_60542 ) ( ON ?auto_60543 ?auto_60542 ) ( not ( = ?auto_60542 ?auto_60543 ) ) ( not ( = ?auto_60542 ?auto_60546 ) ) ( not ( = ?auto_60543 ?auto_60546 ) ) ( not ( = ?auto_60542 ?auto_60545 ) ) ( not ( = ?auto_60542 ?auto_60547 ) ) ( not ( = ?auto_60543 ?auto_60545 ) ) ( not ( = ?auto_60543 ?auto_60547 ) ) ( not ( = ?auto_60546 ?auto_60545 ) ) ( not ( = ?auto_60546 ?auto_60547 ) ) ( not ( = ?auto_60545 ?auto_60547 ) ) ( ON ?auto_60545 ?auto_60546 ) ( not ( = ?auto_60544 ?auto_60547 ) ) ( not ( = ?auto_60542 ?auto_60544 ) ) ( not ( = ?auto_60543 ?auto_60544 ) ) ( not ( = ?auto_60546 ?auto_60544 ) ) ( not ( = ?auto_60545 ?auto_60544 ) ) ( ON ?auto_60547 ?auto_60545 ) ( CLEAR ?auto_60547 ) ( ON ?auto_60544 ?auto_60548 ) ( CLEAR ?auto_60544 ) ( HAND-EMPTY ) ( not ( = ?auto_60542 ?auto_60548 ) ) ( not ( = ?auto_60543 ?auto_60548 ) ) ( not ( = ?auto_60546 ?auto_60548 ) ) ( not ( = ?auto_60545 ?auto_60548 ) ) ( not ( = ?auto_60547 ?auto_60548 ) ) ( not ( = ?auto_60544 ?auto_60548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60544 ?auto_60548 )
      ( MAKE-2PILE ?auto_60542 ?auto_60543 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60549 - BLOCK
      ?auto_60550 - BLOCK
    )
    :vars
    (
      ?auto_60552 - BLOCK
      ?auto_60551 - BLOCK
      ?auto_60554 - BLOCK
      ?auto_60555 - BLOCK
      ?auto_60553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60552 ?auto_60550 ) ( ON-TABLE ?auto_60549 ) ( ON ?auto_60550 ?auto_60549 ) ( not ( = ?auto_60549 ?auto_60550 ) ) ( not ( = ?auto_60549 ?auto_60552 ) ) ( not ( = ?auto_60550 ?auto_60552 ) ) ( not ( = ?auto_60549 ?auto_60551 ) ) ( not ( = ?auto_60549 ?auto_60554 ) ) ( not ( = ?auto_60550 ?auto_60551 ) ) ( not ( = ?auto_60550 ?auto_60554 ) ) ( not ( = ?auto_60552 ?auto_60551 ) ) ( not ( = ?auto_60552 ?auto_60554 ) ) ( not ( = ?auto_60551 ?auto_60554 ) ) ( ON ?auto_60551 ?auto_60552 ) ( not ( = ?auto_60555 ?auto_60554 ) ) ( not ( = ?auto_60549 ?auto_60555 ) ) ( not ( = ?auto_60550 ?auto_60555 ) ) ( not ( = ?auto_60552 ?auto_60555 ) ) ( not ( = ?auto_60551 ?auto_60555 ) ) ( ON ?auto_60555 ?auto_60553 ) ( CLEAR ?auto_60555 ) ( not ( = ?auto_60549 ?auto_60553 ) ) ( not ( = ?auto_60550 ?auto_60553 ) ) ( not ( = ?auto_60552 ?auto_60553 ) ) ( not ( = ?auto_60551 ?auto_60553 ) ) ( not ( = ?auto_60554 ?auto_60553 ) ) ( not ( = ?auto_60555 ?auto_60553 ) ) ( HOLDING ?auto_60554 ) ( CLEAR ?auto_60551 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60549 ?auto_60550 ?auto_60552 ?auto_60551 ?auto_60554 )
      ( MAKE-2PILE ?auto_60549 ?auto_60550 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60556 - BLOCK
      ?auto_60557 - BLOCK
    )
    :vars
    (
      ?auto_60560 - BLOCK
      ?auto_60562 - BLOCK
      ?auto_60558 - BLOCK
      ?auto_60559 - BLOCK
      ?auto_60561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60560 ?auto_60557 ) ( ON-TABLE ?auto_60556 ) ( ON ?auto_60557 ?auto_60556 ) ( not ( = ?auto_60556 ?auto_60557 ) ) ( not ( = ?auto_60556 ?auto_60560 ) ) ( not ( = ?auto_60557 ?auto_60560 ) ) ( not ( = ?auto_60556 ?auto_60562 ) ) ( not ( = ?auto_60556 ?auto_60558 ) ) ( not ( = ?auto_60557 ?auto_60562 ) ) ( not ( = ?auto_60557 ?auto_60558 ) ) ( not ( = ?auto_60560 ?auto_60562 ) ) ( not ( = ?auto_60560 ?auto_60558 ) ) ( not ( = ?auto_60562 ?auto_60558 ) ) ( ON ?auto_60562 ?auto_60560 ) ( not ( = ?auto_60559 ?auto_60558 ) ) ( not ( = ?auto_60556 ?auto_60559 ) ) ( not ( = ?auto_60557 ?auto_60559 ) ) ( not ( = ?auto_60560 ?auto_60559 ) ) ( not ( = ?auto_60562 ?auto_60559 ) ) ( ON ?auto_60559 ?auto_60561 ) ( not ( = ?auto_60556 ?auto_60561 ) ) ( not ( = ?auto_60557 ?auto_60561 ) ) ( not ( = ?auto_60560 ?auto_60561 ) ) ( not ( = ?auto_60562 ?auto_60561 ) ) ( not ( = ?auto_60558 ?auto_60561 ) ) ( not ( = ?auto_60559 ?auto_60561 ) ) ( CLEAR ?auto_60562 ) ( ON ?auto_60558 ?auto_60559 ) ( CLEAR ?auto_60558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60561 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60561 ?auto_60559 )
      ( MAKE-2PILE ?auto_60556 ?auto_60557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60563 - BLOCK
      ?auto_60564 - BLOCK
    )
    :vars
    (
      ?auto_60567 - BLOCK
      ?auto_60569 - BLOCK
      ?auto_60566 - BLOCK
      ?auto_60568 - BLOCK
      ?auto_60565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60567 ?auto_60564 ) ( ON-TABLE ?auto_60563 ) ( ON ?auto_60564 ?auto_60563 ) ( not ( = ?auto_60563 ?auto_60564 ) ) ( not ( = ?auto_60563 ?auto_60567 ) ) ( not ( = ?auto_60564 ?auto_60567 ) ) ( not ( = ?auto_60563 ?auto_60569 ) ) ( not ( = ?auto_60563 ?auto_60566 ) ) ( not ( = ?auto_60564 ?auto_60569 ) ) ( not ( = ?auto_60564 ?auto_60566 ) ) ( not ( = ?auto_60567 ?auto_60569 ) ) ( not ( = ?auto_60567 ?auto_60566 ) ) ( not ( = ?auto_60569 ?auto_60566 ) ) ( not ( = ?auto_60568 ?auto_60566 ) ) ( not ( = ?auto_60563 ?auto_60568 ) ) ( not ( = ?auto_60564 ?auto_60568 ) ) ( not ( = ?auto_60567 ?auto_60568 ) ) ( not ( = ?auto_60569 ?auto_60568 ) ) ( ON ?auto_60568 ?auto_60565 ) ( not ( = ?auto_60563 ?auto_60565 ) ) ( not ( = ?auto_60564 ?auto_60565 ) ) ( not ( = ?auto_60567 ?auto_60565 ) ) ( not ( = ?auto_60569 ?auto_60565 ) ) ( not ( = ?auto_60566 ?auto_60565 ) ) ( not ( = ?auto_60568 ?auto_60565 ) ) ( ON ?auto_60566 ?auto_60568 ) ( CLEAR ?auto_60566 ) ( ON-TABLE ?auto_60565 ) ( HOLDING ?auto_60569 ) ( CLEAR ?auto_60567 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60563 ?auto_60564 ?auto_60567 ?auto_60569 )
      ( MAKE-2PILE ?auto_60563 ?auto_60564 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60570 - BLOCK
      ?auto_60571 - BLOCK
    )
    :vars
    (
      ?auto_60573 - BLOCK
      ?auto_60575 - BLOCK
      ?auto_60574 - BLOCK
      ?auto_60572 - BLOCK
      ?auto_60576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60573 ?auto_60571 ) ( ON-TABLE ?auto_60570 ) ( ON ?auto_60571 ?auto_60570 ) ( not ( = ?auto_60570 ?auto_60571 ) ) ( not ( = ?auto_60570 ?auto_60573 ) ) ( not ( = ?auto_60571 ?auto_60573 ) ) ( not ( = ?auto_60570 ?auto_60575 ) ) ( not ( = ?auto_60570 ?auto_60574 ) ) ( not ( = ?auto_60571 ?auto_60575 ) ) ( not ( = ?auto_60571 ?auto_60574 ) ) ( not ( = ?auto_60573 ?auto_60575 ) ) ( not ( = ?auto_60573 ?auto_60574 ) ) ( not ( = ?auto_60575 ?auto_60574 ) ) ( not ( = ?auto_60572 ?auto_60574 ) ) ( not ( = ?auto_60570 ?auto_60572 ) ) ( not ( = ?auto_60571 ?auto_60572 ) ) ( not ( = ?auto_60573 ?auto_60572 ) ) ( not ( = ?auto_60575 ?auto_60572 ) ) ( ON ?auto_60572 ?auto_60576 ) ( not ( = ?auto_60570 ?auto_60576 ) ) ( not ( = ?auto_60571 ?auto_60576 ) ) ( not ( = ?auto_60573 ?auto_60576 ) ) ( not ( = ?auto_60575 ?auto_60576 ) ) ( not ( = ?auto_60574 ?auto_60576 ) ) ( not ( = ?auto_60572 ?auto_60576 ) ) ( ON ?auto_60574 ?auto_60572 ) ( ON-TABLE ?auto_60576 ) ( CLEAR ?auto_60573 ) ( ON ?auto_60575 ?auto_60574 ) ( CLEAR ?auto_60575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60576 ?auto_60572 ?auto_60574 )
      ( MAKE-2PILE ?auto_60570 ?auto_60571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60591 - BLOCK
      ?auto_60592 - BLOCK
    )
    :vars
    (
      ?auto_60596 - BLOCK
      ?auto_60597 - BLOCK
      ?auto_60593 - BLOCK
      ?auto_60594 - BLOCK
      ?auto_60595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60591 ) ( not ( = ?auto_60591 ?auto_60592 ) ) ( not ( = ?auto_60591 ?auto_60596 ) ) ( not ( = ?auto_60592 ?auto_60596 ) ) ( not ( = ?auto_60591 ?auto_60597 ) ) ( not ( = ?auto_60591 ?auto_60593 ) ) ( not ( = ?auto_60592 ?auto_60597 ) ) ( not ( = ?auto_60592 ?auto_60593 ) ) ( not ( = ?auto_60596 ?auto_60597 ) ) ( not ( = ?auto_60596 ?auto_60593 ) ) ( not ( = ?auto_60597 ?auto_60593 ) ) ( not ( = ?auto_60594 ?auto_60593 ) ) ( not ( = ?auto_60591 ?auto_60594 ) ) ( not ( = ?auto_60592 ?auto_60594 ) ) ( not ( = ?auto_60596 ?auto_60594 ) ) ( not ( = ?auto_60597 ?auto_60594 ) ) ( ON ?auto_60594 ?auto_60595 ) ( not ( = ?auto_60591 ?auto_60595 ) ) ( not ( = ?auto_60592 ?auto_60595 ) ) ( not ( = ?auto_60596 ?auto_60595 ) ) ( not ( = ?auto_60597 ?auto_60595 ) ) ( not ( = ?auto_60593 ?auto_60595 ) ) ( not ( = ?auto_60594 ?auto_60595 ) ) ( ON ?auto_60593 ?auto_60594 ) ( ON-TABLE ?auto_60595 ) ( ON ?auto_60597 ?auto_60593 ) ( ON ?auto_60596 ?auto_60597 ) ( CLEAR ?auto_60596 ) ( HOLDING ?auto_60592 ) ( CLEAR ?auto_60591 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60591 ?auto_60592 ?auto_60596 )
      ( MAKE-2PILE ?auto_60591 ?auto_60592 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60598 - BLOCK
      ?auto_60599 - BLOCK
    )
    :vars
    (
      ?auto_60602 - BLOCK
      ?auto_60603 - BLOCK
      ?auto_60601 - BLOCK
      ?auto_60600 - BLOCK
      ?auto_60604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60598 ) ( not ( = ?auto_60598 ?auto_60599 ) ) ( not ( = ?auto_60598 ?auto_60602 ) ) ( not ( = ?auto_60599 ?auto_60602 ) ) ( not ( = ?auto_60598 ?auto_60603 ) ) ( not ( = ?auto_60598 ?auto_60601 ) ) ( not ( = ?auto_60599 ?auto_60603 ) ) ( not ( = ?auto_60599 ?auto_60601 ) ) ( not ( = ?auto_60602 ?auto_60603 ) ) ( not ( = ?auto_60602 ?auto_60601 ) ) ( not ( = ?auto_60603 ?auto_60601 ) ) ( not ( = ?auto_60600 ?auto_60601 ) ) ( not ( = ?auto_60598 ?auto_60600 ) ) ( not ( = ?auto_60599 ?auto_60600 ) ) ( not ( = ?auto_60602 ?auto_60600 ) ) ( not ( = ?auto_60603 ?auto_60600 ) ) ( ON ?auto_60600 ?auto_60604 ) ( not ( = ?auto_60598 ?auto_60604 ) ) ( not ( = ?auto_60599 ?auto_60604 ) ) ( not ( = ?auto_60602 ?auto_60604 ) ) ( not ( = ?auto_60603 ?auto_60604 ) ) ( not ( = ?auto_60601 ?auto_60604 ) ) ( not ( = ?auto_60600 ?auto_60604 ) ) ( ON ?auto_60601 ?auto_60600 ) ( ON-TABLE ?auto_60604 ) ( ON ?auto_60603 ?auto_60601 ) ( ON ?auto_60602 ?auto_60603 ) ( CLEAR ?auto_60598 ) ( ON ?auto_60599 ?auto_60602 ) ( CLEAR ?auto_60599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60604 ?auto_60600 ?auto_60601 ?auto_60603 ?auto_60602 )
      ( MAKE-2PILE ?auto_60598 ?auto_60599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60605 - BLOCK
      ?auto_60606 - BLOCK
    )
    :vars
    (
      ?auto_60607 - BLOCK
      ?auto_60610 - BLOCK
      ?auto_60611 - BLOCK
      ?auto_60609 - BLOCK
      ?auto_60608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60605 ?auto_60606 ) ) ( not ( = ?auto_60605 ?auto_60607 ) ) ( not ( = ?auto_60606 ?auto_60607 ) ) ( not ( = ?auto_60605 ?auto_60610 ) ) ( not ( = ?auto_60605 ?auto_60611 ) ) ( not ( = ?auto_60606 ?auto_60610 ) ) ( not ( = ?auto_60606 ?auto_60611 ) ) ( not ( = ?auto_60607 ?auto_60610 ) ) ( not ( = ?auto_60607 ?auto_60611 ) ) ( not ( = ?auto_60610 ?auto_60611 ) ) ( not ( = ?auto_60609 ?auto_60611 ) ) ( not ( = ?auto_60605 ?auto_60609 ) ) ( not ( = ?auto_60606 ?auto_60609 ) ) ( not ( = ?auto_60607 ?auto_60609 ) ) ( not ( = ?auto_60610 ?auto_60609 ) ) ( ON ?auto_60609 ?auto_60608 ) ( not ( = ?auto_60605 ?auto_60608 ) ) ( not ( = ?auto_60606 ?auto_60608 ) ) ( not ( = ?auto_60607 ?auto_60608 ) ) ( not ( = ?auto_60610 ?auto_60608 ) ) ( not ( = ?auto_60611 ?auto_60608 ) ) ( not ( = ?auto_60609 ?auto_60608 ) ) ( ON ?auto_60611 ?auto_60609 ) ( ON-TABLE ?auto_60608 ) ( ON ?auto_60610 ?auto_60611 ) ( ON ?auto_60607 ?auto_60610 ) ( ON ?auto_60606 ?auto_60607 ) ( CLEAR ?auto_60606 ) ( HOLDING ?auto_60605 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60605 )
      ( MAKE-2PILE ?auto_60605 ?auto_60606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60612 - BLOCK
      ?auto_60613 - BLOCK
    )
    :vars
    (
      ?auto_60617 - BLOCK
      ?auto_60615 - BLOCK
      ?auto_60614 - BLOCK
      ?auto_60618 - BLOCK
      ?auto_60616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60612 ?auto_60613 ) ) ( not ( = ?auto_60612 ?auto_60617 ) ) ( not ( = ?auto_60613 ?auto_60617 ) ) ( not ( = ?auto_60612 ?auto_60615 ) ) ( not ( = ?auto_60612 ?auto_60614 ) ) ( not ( = ?auto_60613 ?auto_60615 ) ) ( not ( = ?auto_60613 ?auto_60614 ) ) ( not ( = ?auto_60617 ?auto_60615 ) ) ( not ( = ?auto_60617 ?auto_60614 ) ) ( not ( = ?auto_60615 ?auto_60614 ) ) ( not ( = ?auto_60618 ?auto_60614 ) ) ( not ( = ?auto_60612 ?auto_60618 ) ) ( not ( = ?auto_60613 ?auto_60618 ) ) ( not ( = ?auto_60617 ?auto_60618 ) ) ( not ( = ?auto_60615 ?auto_60618 ) ) ( ON ?auto_60618 ?auto_60616 ) ( not ( = ?auto_60612 ?auto_60616 ) ) ( not ( = ?auto_60613 ?auto_60616 ) ) ( not ( = ?auto_60617 ?auto_60616 ) ) ( not ( = ?auto_60615 ?auto_60616 ) ) ( not ( = ?auto_60614 ?auto_60616 ) ) ( not ( = ?auto_60618 ?auto_60616 ) ) ( ON ?auto_60614 ?auto_60618 ) ( ON-TABLE ?auto_60616 ) ( ON ?auto_60615 ?auto_60614 ) ( ON ?auto_60617 ?auto_60615 ) ( ON ?auto_60613 ?auto_60617 ) ( ON ?auto_60612 ?auto_60613 ) ( CLEAR ?auto_60612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60616 ?auto_60618 ?auto_60614 ?auto_60615 ?auto_60617 ?auto_60613 )
      ( MAKE-2PILE ?auto_60612 ?auto_60613 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60623 - BLOCK
      ?auto_60624 - BLOCK
      ?auto_60625 - BLOCK
      ?auto_60626 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_60626 ) ( CLEAR ?auto_60625 ) ( ON-TABLE ?auto_60623 ) ( ON ?auto_60624 ?auto_60623 ) ( ON ?auto_60625 ?auto_60624 ) ( not ( = ?auto_60623 ?auto_60624 ) ) ( not ( = ?auto_60623 ?auto_60625 ) ) ( not ( = ?auto_60623 ?auto_60626 ) ) ( not ( = ?auto_60624 ?auto_60625 ) ) ( not ( = ?auto_60624 ?auto_60626 ) ) ( not ( = ?auto_60625 ?auto_60626 ) ) )
    :subtasks
    ( ( !STACK ?auto_60626 ?auto_60625 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60627 - BLOCK
      ?auto_60628 - BLOCK
      ?auto_60629 - BLOCK
      ?auto_60630 - BLOCK
    )
    :vars
    (
      ?auto_60631 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60629 ) ( ON-TABLE ?auto_60627 ) ( ON ?auto_60628 ?auto_60627 ) ( ON ?auto_60629 ?auto_60628 ) ( not ( = ?auto_60627 ?auto_60628 ) ) ( not ( = ?auto_60627 ?auto_60629 ) ) ( not ( = ?auto_60627 ?auto_60630 ) ) ( not ( = ?auto_60628 ?auto_60629 ) ) ( not ( = ?auto_60628 ?auto_60630 ) ) ( not ( = ?auto_60629 ?auto_60630 ) ) ( ON ?auto_60630 ?auto_60631 ) ( CLEAR ?auto_60630 ) ( HAND-EMPTY ) ( not ( = ?auto_60627 ?auto_60631 ) ) ( not ( = ?auto_60628 ?auto_60631 ) ) ( not ( = ?auto_60629 ?auto_60631 ) ) ( not ( = ?auto_60630 ?auto_60631 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60630 ?auto_60631 )
      ( MAKE-4PILE ?auto_60627 ?auto_60628 ?auto_60629 ?auto_60630 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60632 - BLOCK
      ?auto_60633 - BLOCK
      ?auto_60634 - BLOCK
      ?auto_60635 - BLOCK
    )
    :vars
    (
      ?auto_60636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60632 ) ( ON ?auto_60633 ?auto_60632 ) ( not ( = ?auto_60632 ?auto_60633 ) ) ( not ( = ?auto_60632 ?auto_60634 ) ) ( not ( = ?auto_60632 ?auto_60635 ) ) ( not ( = ?auto_60633 ?auto_60634 ) ) ( not ( = ?auto_60633 ?auto_60635 ) ) ( not ( = ?auto_60634 ?auto_60635 ) ) ( ON ?auto_60635 ?auto_60636 ) ( CLEAR ?auto_60635 ) ( not ( = ?auto_60632 ?auto_60636 ) ) ( not ( = ?auto_60633 ?auto_60636 ) ) ( not ( = ?auto_60634 ?auto_60636 ) ) ( not ( = ?auto_60635 ?auto_60636 ) ) ( HOLDING ?auto_60634 ) ( CLEAR ?auto_60633 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60632 ?auto_60633 ?auto_60634 )
      ( MAKE-4PILE ?auto_60632 ?auto_60633 ?auto_60634 ?auto_60635 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60637 - BLOCK
      ?auto_60638 - BLOCK
      ?auto_60639 - BLOCK
      ?auto_60640 - BLOCK
    )
    :vars
    (
      ?auto_60641 - BLOCK
      ?auto_60642 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60637 ) ( ON ?auto_60638 ?auto_60637 ) ( not ( = ?auto_60637 ?auto_60638 ) ) ( not ( = ?auto_60637 ?auto_60639 ) ) ( not ( = ?auto_60637 ?auto_60640 ) ) ( not ( = ?auto_60638 ?auto_60639 ) ) ( not ( = ?auto_60638 ?auto_60640 ) ) ( not ( = ?auto_60639 ?auto_60640 ) ) ( ON ?auto_60640 ?auto_60641 ) ( not ( = ?auto_60637 ?auto_60641 ) ) ( not ( = ?auto_60638 ?auto_60641 ) ) ( not ( = ?auto_60639 ?auto_60641 ) ) ( not ( = ?auto_60640 ?auto_60641 ) ) ( CLEAR ?auto_60638 ) ( ON ?auto_60639 ?auto_60640 ) ( CLEAR ?auto_60639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60642 ) ( ON ?auto_60641 ?auto_60642 ) ( not ( = ?auto_60642 ?auto_60641 ) ) ( not ( = ?auto_60642 ?auto_60640 ) ) ( not ( = ?auto_60642 ?auto_60639 ) ) ( not ( = ?auto_60637 ?auto_60642 ) ) ( not ( = ?auto_60638 ?auto_60642 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60642 ?auto_60641 ?auto_60640 )
      ( MAKE-4PILE ?auto_60637 ?auto_60638 ?auto_60639 ?auto_60640 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60643 - BLOCK
      ?auto_60644 - BLOCK
      ?auto_60645 - BLOCK
      ?auto_60646 - BLOCK
    )
    :vars
    (
      ?auto_60648 - BLOCK
      ?auto_60647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60643 ) ( not ( = ?auto_60643 ?auto_60644 ) ) ( not ( = ?auto_60643 ?auto_60645 ) ) ( not ( = ?auto_60643 ?auto_60646 ) ) ( not ( = ?auto_60644 ?auto_60645 ) ) ( not ( = ?auto_60644 ?auto_60646 ) ) ( not ( = ?auto_60645 ?auto_60646 ) ) ( ON ?auto_60646 ?auto_60648 ) ( not ( = ?auto_60643 ?auto_60648 ) ) ( not ( = ?auto_60644 ?auto_60648 ) ) ( not ( = ?auto_60645 ?auto_60648 ) ) ( not ( = ?auto_60646 ?auto_60648 ) ) ( ON ?auto_60645 ?auto_60646 ) ( CLEAR ?auto_60645 ) ( ON-TABLE ?auto_60647 ) ( ON ?auto_60648 ?auto_60647 ) ( not ( = ?auto_60647 ?auto_60648 ) ) ( not ( = ?auto_60647 ?auto_60646 ) ) ( not ( = ?auto_60647 ?auto_60645 ) ) ( not ( = ?auto_60643 ?auto_60647 ) ) ( not ( = ?auto_60644 ?auto_60647 ) ) ( HOLDING ?auto_60644 ) ( CLEAR ?auto_60643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60643 ?auto_60644 )
      ( MAKE-4PILE ?auto_60643 ?auto_60644 ?auto_60645 ?auto_60646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60649 - BLOCK
      ?auto_60650 - BLOCK
      ?auto_60651 - BLOCK
      ?auto_60652 - BLOCK
    )
    :vars
    (
      ?auto_60653 - BLOCK
      ?auto_60654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60649 ) ( not ( = ?auto_60649 ?auto_60650 ) ) ( not ( = ?auto_60649 ?auto_60651 ) ) ( not ( = ?auto_60649 ?auto_60652 ) ) ( not ( = ?auto_60650 ?auto_60651 ) ) ( not ( = ?auto_60650 ?auto_60652 ) ) ( not ( = ?auto_60651 ?auto_60652 ) ) ( ON ?auto_60652 ?auto_60653 ) ( not ( = ?auto_60649 ?auto_60653 ) ) ( not ( = ?auto_60650 ?auto_60653 ) ) ( not ( = ?auto_60651 ?auto_60653 ) ) ( not ( = ?auto_60652 ?auto_60653 ) ) ( ON ?auto_60651 ?auto_60652 ) ( ON-TABLE ?auto_60654 ) ( ON ?auto_60653 ?auto_60654 ) ( not ( = ?auto_60654 ?auto_60653 ) ) ( not ( = ?auto_60654 ?auto_60652 ) ) ( not ( = ?auto_60654 ?auto_60651 ) ) ( not ( = ?auto_60649 ?auto_60654 ) ) ( not ( = ?auto_60650 ?auto_60654 ) ) ( CLEAR ?auto_60649 ) ( ON ?auto_60650 ?auto_60651 ) ( CLEAR ?auto_60650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60654 ?auto_60653 ?auto_60652 ?auto_60651 )
      ( MAKE-4PILE ?auto_60649 ?auto_60650 ?auto_60651 ?auto_60652 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60655 - BLOCK
      ?auto_60656 - BLOCK
      ?auto_60657 - BLOCK
      ?auto_60658 - BLOCK
    )
    :vars
    (
      ?auto_60660 - BLOCK
      ?auto_60659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60655 ?auto_60656 ) ) ( not ( = ?auto_60655 ?auto_60657 ) ) ( not ( = ?auto_60655 ?auto_60658 ) ) ( not ( = ?auto_60656 ?auto_60657 ) ) ( not ( = ?auto_60656 ?auto_60658 ) ) ( not ( = ?auto_60657 ?auto_60658 ) ) ( ON ?auto_60658 ?auto_60660 ) ( not ( = ?auto_60655 ?auto_60660 ) ) ( not ( = ?auto_60656 ?auto_60660 ) ) ( not ( = ?auto_60657 ?auto_60660 ) ) ( not ( = ?auto_60658 ?auto_60660 ) ) ( ON ?auto_60657 ?auto_60658 ) ( ON-TABLE ?auto_60659 ) ( ON ?auto_60660 ?auto_60659 ) ( not ( = ?auto_60659 ?auto_60660 ) ) ( not ( = ?auto_60659 ?auto_60658 ) ) ( not ( = ?auto_60659 ?auto_60657 ) ) ( not ( = ?auto_60655 ?auto_60659 ) ) ( not ( = ?auto_60656 ?auto_60659 ) ) ( ON ?auto_60656 ?auto_60657 ) ( CLEAR ?auto_60656 ) ( HOLDING ?auto_60655 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60655 )
      ( MAKE-4PILE ?auto_60655 ?auto_60656 ?auto_60657 ?auto_60658 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60661 - BLOCK
      ?auto_60662 - BLOCK
      ?auto_60663 - BLOCK
      ?auto_60664 - BLOCK
    )
    :vars
    (
      ?auto_60666 - BLOCK
      ?auto_60665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60661 ?auto_60662 ) ) ( not ( = ?auto_60661 ?auto_60663 ) ) ( not ( = ?auto_60661 ?auto_60664 ) ) ( not ( = ?auto_60662 ?auto_60663 ) ) ( not ( = ?auto_60662 ?auto_60664 ) ) ( not ( = ?auto_60663 ?auto_60664 ) ) ( ON ?auto_60664 ?auto_60666 ) ( not ( = ?auto_60661 ?auto_60666 ) ) ( not ( = ?auto_60662 ?auto_60666 ) ) ( not ( = ?auto_60663 ?auto_60666 ) ) ( not ( = ?auto_60664 ?auto_60666 ) ) ( ON ?auto_60663 ?auto_60664 ) ( ON-TABLE ?auto_60665 ) ( ON ?auto_60666 ?auto_60665 ) ( not ( = ?auto_60665 ?auto_60666 ) ) ( not ( = ?auto_60665 ?auto_60664 ) ) ( not ( = ?auto_60665 ?auto_60663 ) ) ( not ( = ?auto_60661 ?auto_60665 ) ) ( not ( = ?auto_60662 ?auto_60665 ) ) ( ON ?auto_60662 ?auto_60663 ) ( ON ?auto_60661 ?auto_60662 ) ( CLEAR ?auto_60661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60665 ?auto_60666 ?auto_60664 ?auto_60663 ?auto_60662 )
      ( MAKE-4PILE ?auto_60661 ?auto_60662 ?auto_60663 ?auto_60664 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60667 - BLOCK
      ?auto_60668 - BLOCK
      ?auto_60669 - BLOCK
      ?auto_60670 - BLOCK
    )
    :vars
    (
      ?auto_60672 - BLOCK
      ?auto_60671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60667 ?auto_60668 ) ) ( not ( = ?auto_60667 ?auto_60669 ) ) ( not ( = ?auto_60667 ?auto_60670 ) ) ( not ( = ?auto_60668 ?auto_60669 ) ) ( not ( = ?auto_60668 ?auto_60670 ) ) ( not ( = ?auto_60669 ?auto_60670 ) ) ( ON ?auto_60670 ?auto_60672 ) ( not ( = ?auto_60667 ?auto_60672 ) ) ( not ( = ?auto_60668 ?auto_60672 ) ) ( not ( = ?auto_60669 ?auto_60672 ) ) ( not ( = ?auto_60670 ?auto_60672 ) ) ( ON ?auto_60669 ?auto_60670 ) ( ON-TABLE ?auto_60671 ) ( ON ?auto_60672 ?auto_60671 ) ( not ( = ?auto_60671 ?auto_60672 ) ) ( not ( = ?auto_60671 ?auto_60670 ) ) ( not ( = ?auto_60671 ?auto_60669 ) ) ( not ( = ?auto_60667 ?auto_60671 ) ) ( not ( = ?auto_60668 ?auto_60671 ) ) ( ON ?auto_60668 ?auto_60669 ) ( HOLDING ?auto_60667 ) ( CLEAR ?auto_60668 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60671 ?auto_60672 ?auto_60670 ?auto_60669 ?auto_60668 ?auto_60667 )
      ( MAKE-4PILE ?auto_60667 ?auto_60668 ?auto_60669 ?auto_60670 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60673 - BLOCK
      ?auto_60674 - BLOCK
      ?auto_60675 - BLOCK
      ?auto_60676 - BLOCK
    )
    :vars
    (
      ?auto_60678 - BLOCK
      ?auto_60677 - BLOCK
      ?auto_60679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60673 ?auto_60674 ) ) ( not ( = ?auto_60673 ?auto_60675 ) ) ( not ( = ?auto_60673 ?auto_60676 ) ) ( not ( = ?auto_60674 ?auto_60675 ) ) ( not ( = ?auto_60674 ?auto_60676 ) ) ( not ( = ?auto_60675 ?auto_60676 ) ) ( ON ?auto_60676 ?auto_60678 ) ( not ( = ?auto_60673 ?auto_60678 ) ) ( not ( = ?auto_60674 ?auto_60678 ) ) ( not ( = ?auto_60675 ?auto_60678 ) ) ( not ( = ?auto_60676 ?auto_60678 ) ) ( ON ?auto_60675 ?auto_60676 ) ( ON-TABLE ?auto_60677 ) ( ON ?auto_60678 ?auto_60677 ) ( not ( = ?auto_60677 ?auto_60678 ) ) ( not ( = ?auto_60677 ?auto_60676 ) ) ( not ( = ?auto_60677 ?auto_60675 ) ) ( not ( = ?auto_60673 ?auto_60677 ) ) ( not ( = ?auto_60674 ?auto_60677 ) ) ( ON ?auto_60674 ?auto_60675 ) ( CLEAR ?auto_60674 ) ( ON ?auto_60673 ?auto_60679 ) ( CLEAR ?auto_60673 ) ( HAND-EMPTY ) ( not ( = ?auto_60673 ?auto_60679 ) ) ( not ( = ?auto_60674 ?auto_60679 ) ) ( not ( = ?auto_60675 ?auto_60679 ) ) ( not ( = ?auto_60676 ?auto_60679 ) ) ( not ( = ?auto_60678 ?auto_60679 ) ) ( not ( = ?auto_60677 ?auto_60679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60673 ?auto_60679 )
      ( MAKE-4PILE ?auto_60673 ?auto_60674 ?auto_60675 ?auto_60676 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60680 - BLOCK
      ?auto_60681 - BLOCK
      ?auto_60682 - BLOCK
      ?auto_60683 - BLOCK
    )
    :vars
    (
      ?auto_60685 - BLOCK
      ?auto_60684 - BLOCK
      ?auto_60686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60680 ?auto_60681 ) ) ( not ( = ?auto_60680 ?auto_60682 ) ) ( not ( = ?auto_60680 ?auto_60683 ) ) ( not ( = ?auto_60681 ?auto_60682 ) ) ( not ( = ?auto_60681 ?auto_60683 ) ) ( not ( = ?auto_60682 ?auto_60683 ) ) ( ON ?auto_60683 ?auto_60685 ) ( not ( = ?auto_60680 ?auto_60685 ) ) ( not ( = ?auto_60681 ?auto_60685 ) ) ( not ( = ?auto_60682 ?auto_60685 ) ) ( not ( = ?auto_60683 ?auto_60685 ) ) ( ON ?auto_60682 ?auto_60683 ) ( ON-TABLE ?auto_60684 ) ( ON ?auto_60685 ?auto_60684 ) ( not ( = ?auto_60684 ?auto_60685 ) ) ( not ( = ?auto_60684 ?auto_60683 ) ) ( not ( = ?auto_60684 ?auto_60682 ) ) ( not ( = ?auto_60680 ?auto_60684 ) ) ( not ( = ?auto_60681 ?auto_60684 ) ) ( ON ?auto_60680 ?auto_60686 ) ( CLEAR ?auto_60680 ) ( not ( = ?auto_60680 ?auto_60686 ) ) ( not ( = ?auto_60681 ?auto_60686 ) ) ( not ( = ?auto_60682 ?auto_60686 ) ) ( not ( = ?auto_60683 ?auto_60686 ) ) ( not ( = ?auto_60685 ?auto_60686 ) ) ( not ( = ?auto_60684 ?auto_60686 ) ) ( HOLDING ?auto_60681 ) ( CLEAR ?auto_60682 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60684 ?auto_60685 ?auto_60683 ?auto_60682 ?auto_60681 )
      ( MAKE-4PILE ?auto_60680 ?auto_60681 ?auto_60682 ?auto_60683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60687 - BLOCK
      ?auto_60688 - BLOCK
      ?auto_60689 - BLOCK
      ?auto_60690 - BLOCK
    )
    :vars
    (
      ?auto_60693 - BLOCK
      ?auto_60691 - BLOCK
      ?auto_60692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60687 ?auto_60688 ) ) ( not ( = ?auto_60687 ?auto_60689 ) ) ( not ( = ?auto_60687 ?auto_60690 ) ) ( not ( = ?auto_60688 ?auto_60689 ) ) ( not ( = ?auto_60688 ?auto_60690 ) ) ( not ( = ?auto_60689 ?auto_60690 ) ) ( ON ?auto_60690 ?auto_60693 ) ( not ( = ?auto_60687 ?auto_60693 ) ) ( not ( = ?auto_60688 ?auto_60693 ) ) ( not ( = ?auto_60689 ?auto_60693 ) ) ( not ( = ?auto_60690 ?auto_60693 ) ) ( ON ?auto_60689 ?auto_60690 ) ( ON-TABLE ?auto_60691 ) ( ON ?auto_60693 ?auto_60691 ) ( not ( = ?auto_60691 ?auto_60693 ) ) ( not ( = ?auto_60691 ?auto_60690 ) ) ( not ( = ?auto_60691 ?auto_60689 ) ) ( not ( = ?auto_60687 ?auto_60691 ) ) ( not ( = ?auto_60688 ?auto_60691 ) ) ( ON ?auto_60687 ?auto_60692 ) ( not ( = ?auto_60687 ?auto_60692 ) ) ( not ( = ?auto_60688 ?auto_60692 ) ) ( not ( = ?auto_60689 ?auto_60692 ) ) ( not ( = ?auto_60690 ?auto_60692 ) ) ( not ( = ?auto_60693 ?auto_60692 ) ) ( not ( = ?auto_60691 ?auto_60692 ) ) ( CLEAR ?auto_60689 ) ( ON ?auto_60688 ?auto_60687 ) ( CLEAR ?auto_60688 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60692 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60692 ?auto_60687 )
      ( MAKE-4PILE ?auto_60687 ?auto_60688 ?auto_60689 ?auto_60690 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60694 - BLOCK
      ?auto_60695 - BLOCK
      ?auto_60696 - BLOCK
      ?auto_60697 - BLOCK
    )
    :vars
    (
      ?auto_60698 - BLOCK
      ?auto_60700 - BLOCK
      ?auto_60699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60694 ?auto_60695 ) ) ( not ( = ?auto_60694 ?auto_60696 ) ) ( not ( = ?auto_60694 ?auto_60697 ) ) ( not ( = ?auto_60695 ?auto_60696 ) ) ( not ( = ?auto_60695 ?auto_60697 ) ) ( not ( = ?auto_60696 ?auto_60697 ) ) ( ON ?auto_60697 ?auto_60698 ) ( not ( = ?auto_60694 ?auto_60698 ) ) ( not ( = ?auto_60695 ?auto_60698 ) ) ( not ( = ?auto_60696 ?auto_60698 ) ) ( not ( = ?auto_60697 ?auto_60698 ) ) ( ON-TABLE ?auto_60700 ) ( ON ?auto_60698 ?auto_60700 ) ( not ( = ?auto_60700 ?auto_60698 ) ) ( not ( = ?auto_60700 ?auto_60697 ) ) ( not ( = ?auto_60700 ?auto_60696 ) ) ( not ( = ?auto_60694 ?auto_60700 ) ) ( not ( = ?auto_60695 ?auto_60700 ) ) ( ON ?auto_60694 ?auto_60699 ) ( not ( = ?auto_60694 ?auto_60699 ) ) ( not ( = ?auto_60695 ?auto_60699 ) ) ( not ( = ?auto_60696 ?auto_60699 ) ) ( not ( = ?auto_60697 ?auto_60699 ) ) ( not ( = ?auto_60698 ?auto_60699 ) ) ( not ( = ?auto_60700 ?auto_60699 ) ) ( ON ?auto_60695 ?auto_60694 ) ( CLEAR ?auto_60695 ) ( ON-TABLE ?auto_60699 ) ( HOLDING ?auto_60696 ) ( CLEAR ?auto_60697 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60700 ?auto_60698 ?auto_60697 ?auto_60696 )
      ( MAKE-4PILE ?auto_60694 ?auto_60695 ?auto_60696 ?auto_60697 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60701 - BLOCK
      ?auto_60702 - BLOCK
      ?auto_60703 - BLOCK
      ?auto_60704 - BLOCK
    )
    :vars
    (
      ?auto_60705 - BLOCK
      ?auto_60706 - BLOCK
      ?auto_60707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60701 ?auto_60702 ) ) ( not ( = ?auto_60701 ?auto_60703 ) ) ( not ( = ?auto_60701 ?auto_60704 ) ) ( not ( = ?auto_60702 ?auto_60703 ) ) ( not ( = ?auto_60702 ?auto_60704 ) ) ( not ( = ?auto_60703 ?auto_60704 ) ) ( ON ?auto_60704 ?auto_60705 ) ( not ( = ?auto_60701 ?auto_60705 ) ) ( not ( = ?auto_60702 ?auto_60705 ) ) ( not ( = ?auto_60703 ?auto_60705 ) ) ( not ( = ?auto_60704 ?auto_60705 ) ) ( ON-TABLE ?auto_60706 ) ( ON ?auto_60705 ?auto_60706 ) ( not ( = ?auto_60706 ?auto_60705 ) ) ( not ( = ?auto_60706 ?auto_60704 ) ) ( not ( = ?auto_60706 ?auto_60703 ) ) ( not ( = ?auto_60701 ?auto_60706 ) ) ( not ( = ?auto_60702 ?auto_60706 ) ) ( ON ?auto_60701 ?auto_60707 ) ( not ( = ?auto_60701 ?auto_60707 ) ) ( not ( = ?auto_60702 ?auto_60707 ) ) ( not ( = ?auto_60703 ?auto_60707 ) ) ( not ( = ?auto_60704 ?auto_60707 ) ) ( not ( = ?auto_60705 ?auto_60707 ) ) ( not ( = ?auto_60706 ?auto_60707 ) ) ( ON ?auto_60702 ?auto_60701 ) ( ON-TABLE ?auto_60707 ) ( CLEAR ?auto_60704 ) ( ON ?auto_60703 ?auto_60702 ) ( CLEAR ?auto_60703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60707 ?auto_60701 ?auto_60702 )
      ( MAKE-4PILE ?auto_60701 ?auto_60702 ?auto_60703 ?auto_60704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60708 - BLOCK
      ?auto_60709 - BLOCK
      ?auto_60710 - BLOCK
      ?auto_60711 - BLOCK
    )
    :vars
    (
      ?auto_60712 - BLOCK
      ?auto_60714 - BLOCK
      ?auto_60713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60708 ?auto_60709 ) ) ( not ( = ?auto_60708 ?auto_60710 ) ) ( not ( = ?auto_60708 ?auto_60711 ) ) ( not ( = ?auto_60709 ?auto_60710 ) ) ( not ( = ?auto_60709 ?auto_60711 ) ) ( not ( = ?auto_60710 ?auto_60711 ) ) ( not ( = ?auto_60708 ?auto_60712 ) ) ( not ( = ?auto_60709 ?auto_60712 ) ) ( not ( = ?auto_60710 ?auto_60712 ) ) ( not ( = ?auto_60711 ?auto_60712 ) ) ( ON-TABLE ?auto_60714 ) ( ON ?auto_60712 ?auto_60714 ) ( not ( = ?auto_60714 ?auto_60712 ) ) ( not ( = ?auto_60714 ?auto_60711 ) ) ( not ( = ?auto_60714 ?auto_60710 ) ) ( not ( = ?auto_60708 ?auto_60714 ) ) ( not ( = ?auto_60709 ?auto_60714 ) ) ( ON ?auto_60708 ?auto_60713 ) ( not ( = ?auto_60708 ?auto_60713 ) ) ( not ( = ?auto_60709 ?auto_60713 ) ) ( not ( = ?auto_60710 ?auto_60713 ) ) ( not ( = ?auto_60711 ?auto_60713 ) ) ( not ( = ?auto_60712 ?auto_60713 ) ) ( not ( = ?auto_60714 ?auto_60713 ) ) ( ON ?auto_60709 ?auto_60708 ) ( ON-TABLE ?auto_60713 ) ( ON ?auto_60710 ?auto_60709 ) ( CLEAR ?auto_60710 ) ( HOLDING ?auto_60711 ) ( CLEAR ?auto_60712 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60714 ?auto_60712 ?auto_60711 )
      ( MAKE-4PILE ?auto_60708 ?auto_60709 ?auto_60710 ?auto_60711 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60715 - BLOCK
      ?auto_60716 - BLOCK
      ?auto_60717 - BLOCK
      ?auto_60718 - BLOCK
    )
    :vars
    (
      ?auto_60720 - BLOCK
      ?auto_60721 - BLOCK
      ?auto_60719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60715 ?auto_60716 ) ) ( not ( = ?auto_60715 ?auto_60717 ) ) ( not ( = ?auto_60715 ?auto_60718 ) ) ( not ( = ?auto_60716 ?auto_60717 ) ) ( not ( = ?auto_60716 ?auto_60718 ) ) ( not ( = ?auto_60717 ?auto_60718 ) ) ( not ( = ?auto_60715 ?auto_60720 ) ) ( not ( = ?auto_60716 ?auto_60720 ) ) ( not ( = ?auto_60717 ?auto_60720 ) ) ( not ( = ?auto_60718 ?auto_60720 ) ) ( ON-TABLE ?auto_60721 ) ( ON ?auto_60720 ?auto_60721 ) ( not ( = ?auto_60721 ?auto_60720 ) ) ( not ( = ?auto_60721 ?auto_60718 ) ) ( not ( = ?auto_60721 ?auto_60717 ) ) ( not ( = ?auto_60715 ?auto_60721 ) ) ( not ( = ?auto_60716 ?auto_60721 ) ) ( ON ?auto_60715 ?auto_60719 ) ( not ( = ?auto_60715 ?auto_60719 ) ) ( not ( = ?auto_60716 ?auto_60719 ) ) ( not ( = ?auto_60717 ?auto_60719 ) ) ( not ( = ?auto_60718 ?auto_60719 ) ) ( not ( = ?auto_60720 ?auto_60719 ) ) ( not ( = ?auto_60721 ?auto_60719 ) ) ( ON ?auto_60716 ?auto_60715 ) ( ON-TABLE ?auto_60719 ) ( ON ?auto_60717 ?auto_60716 ) ( CLEAR ?auto_60720 ) ( ON ?auto_60718 ?auto_60717 ) ( CLEAR ?auto_60718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60719 ?auto_60715 ?auto_60716 ?auto_60717 )
      ( MAKE-4PILE ?auto_60715 ?auto_60716 ?auto_60717 ?auto_60718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60722 - BLOCK
      ?auto_60723 - BLOCK
      ?auto_60724 - BLOCK
      ?auto_60725 - BLOCK
    )
    :vars
    (
      ?auto_60727 - BLOCK
      ?auto_60726 - BLOCK
      ?auto_60728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60722 ?auto_60723 ) ) ( not ( = ?auto_60722 ?auto_60724 ) ) ( not ( = ?auto_60722 ?auto_60725 ) ) ( not ( = ?auto_60723 ?auto_60724 ) ) ( not ( = ?auto_60723 ?auto_60725 ) ) ( not ( = ?auto_60724 ?auto_60725 ) ) ( not ( = ?auto_60722 ?auto_60727 ) ) ( not ( = ?auto_60723 ?auto_60727 ) ) ( not ( = ?auto_60724 ?auto_60727 ) ) ( not ( = ?auto_60725 ?auto_60727 ) ) ( ON-TABLE ?auto_60726 ) ( not ( = ?auto_60726 ?auto_60727 ) ) ( not ( = ?auto_60726 ?auto_60725 ) ) ( not ( = ?auto_60726 ?auto_60724 ) ) ( not ( = ?auto_60722 ?auto_60726 ) ) ( not ( = ?auto_60723 ?auto_60726 ) ) ( ON ?auto_60722 ?auto_60728 ) ( not ( = ?auto_60722 ?auto_60728 ) ) ( not ( = ?auto_60723 ?auto_60728 ) ) ( not ( = ?auto_60724 ?auto_60728 ) ) ( not ( = ?auto_60725 ?auto_60728 ) ) ( not ( = ?auto_60727 ?auto_60728 ) ) ( not ( = ?auto_60726 ?auto_60728 ) ) ( ON ?auto_60723 ?auto_60722 ) ( ON-TABLE ?auto_60728 ) ( ON ?auto_60724 ?auto_60723 ) ( ON ?auto_60725 ?auto_60724 ) ( CLEAR ?auto_60725 ) ( HOLDING ?auto_60727 ) ( CLEAR ?auto_60726 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60726 ?auto_60727 )
      ( MAKE-4PILE ?auto_60722 ?auto_60723 ?auto_60724 ?auto_60725 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60729 - BLOCK
      ?auto_60730 - BLOCK
      ?auto_60731 - BLOCK
      ?auto_60732 - BLOCK
    )
    :vars
    (
      ?auto_60734 - BLOCK
      ?auto_60733 - BLOCK
      ?auto_60735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60729 ?auto_60730 ) ) ( not ( = ?auto_60729 ?auto_60731 ) ) ( not ( = ?auto_60729 ?auto_60732 ) ) ( not ( = ?auto_60730 ?auto_60731 ) ) ( not ( = ?auto_60730 ?auto_60732 ) ) ( not ( = ?auto_60731 ?auto_60732 ) ) ( not ( = ?auto_60729 ?auto_60734 ) ) ( not ( = ?auto_60730 ?auto_60734 ) ) ( not ( = ?auto_60731 ?auto_60734 ) ) ( not ( = ?auto_60732 ?auto_60734 ) ) ( ON-TABLE ?auto_60733 ) ( not ( = ?auto_60733 ?auto_60734 ) ) ( not ( = ?auto_60733 ?auto_60732 ) ) ( not ( = ?auto_60733 ?auto_60731 ) ) ( not ( = ?auto_60729 ?auto_60733 ) ) ( not ( = ?auto_60730 ?auto_60733 ) ) ( ON ?auto_60729 ?auto_60735 ) ( not ( = ?auto_60729 ?auto_60735 ) ) ( not ( = ?auto_60730 ?auto_60735 ) ) ( not ( = ?auto_60731 ?auto_60735 ) ) ( not ( = ?auto_60732 ?auto_60735 ) ) ( not ( = ?auto_60734 ?auto_60735 ) ) ( not ( = ?auto_60733 ?auto_60735 ) ) ( ON ?auto_60730 ?auto_60729 ) ( ON-TABLE ?auto_60735 ) ( ON ?auto_60731 ?auto_60730 ) ( ON ?auto_60732 ?auto_60731 ) ( CLEAR ?auto_60733 ) ( ON ?auto_60734 ?auto_60732 ) ( CLEAR ?auto_60734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60735 ?auto_60729 ?auto_60730 ?auto_60731 ?auto_60732 )
      ( MAKE-4PILE ?auto_60729 ?auto_60730 ?auto_60731 ?auto_60732 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60736 - BLOCK
      ?auto_60737 - BLOCK
      ?auto_60738 - BLOCK
      ?auto_60739 - BLOCK
    )
    :vars
    (
      ?auto_60742 - BLOCK
      ?auto_60740 - BLOCK
      ?auto_60741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60736 ?auto_60737 ) ) ( not ( = ?auto_60736 ?auto_60738 ) ) ( not ( = ?auto_60736 ?auto_60739 ) ) ( not ( = ?auto_60737 ?auto_60738 ) ) ( not ( = ?auto_60737 ?auto_60739 ) ) ( not ( = ?auto_60738 ?auto_60739 ) ) ( not ( = ?auto_60736 ?auto_60742 ) ) ( not ( = ?auto_60737 ?auto_60742 ) ) ( not ( = ?auto_60738 ?auto_60742 ) ) ( not ( = ?auto_60739 ?auto_60742 ) ) ( not ( = ?auto_60740 ?auto_60742 ) ) ( not ( = ?auto_60740 ?auto_60739 ) ) ( not ( = ?auto_60740 ?auto_60738 ) ) ( not ( = ?auto_60736 ?auto_60740 ) ) ( not ( = ?auto_60737 ?auto_60740 ) ) ( ON ?auto_60736 ?auto_60741 ) ( not ( = ?auto_60736 ?auto_60741 ) ) ( not ( = ?auto_60737 ?auto_60741 ) ) ( not ( = ?auto_60738 ?auto_60741 ) ) ( not ( = ?auto_60739 ?auto_60741 ) ) ( not ( = ?auto_60742 ?auto_60741 ) ) ( not ( = ?auto_60740 ?auto_60741 ) ) ( ON ?auto_60737 ?auto_60736 ) ( ON-TABLE ?auto_60741 ) ( ON ?auto_60738 ?auto_60737 ) ( ON ?auto_60739 ?auto_60738 ) ( ON ?auto_60742 ?auto_60739 ) ( CLEAR ?auto_60742 ) ( HOLDING ?auto_60740 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60740 )
      ( MAKE-4PILE ?auto_60736 ?auto_60737 ?auto_60738 ?auto_60739 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60743 - BLOCK
      ?auto_60744 - BLOCK
      ?auto_60745 - BLOCK
      ?auto_60746 - BLOCK
    )
    :vars
    (
      ?auto_60748 - BLOCK
      ?auto_60749 - BLOCK
      ?auto_60747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60743 ?auto_60744 ) ) ( not ( = ?auto_60743 ?auto_60745 ) ) ( not ( = ?auto_60743 ?auto_60746 ) ) ( not ( = ?auto_60744 ?auto_60745 ) ) ( not ( = ?auto_60744 ?auto_60746 ) ) ( not ( = ?auto_60745 ?auto_60746 ) ) ( not ( = ?auto_60743 ?auto_60748 ) ) ( not ( = ?auto_60744 ?auto_60748 ) ) ( not ( = ?auto_60745 ?auto_60748 ) ) ( not ( = ?auto_60746 ?auto_60748 ) ) ( not ( = ?auto_60749 ?auto_60748 ) ) ( not ( = ?auto_60749 ?auto_60746 ) ) ( not ( = ?auto_60749 ?auto_60745 ) ) ( not ( = ?auto_60743 ?auto_60749 ) ) ( not ( = ?auto_60744 ?auto_60749 ) ) ( ON ?auto_60743 ?auto_60747 ) ( not ( = ?auto_60743 ?auto_60747 ) ) ( not ( = ?auto_60744 ?auto_60747 ) ) ( not ( = ?auto_60745 ?auto_60747 ) ) ( not ( = ?auto_60746 ?auto_60747 ) ) ( not ( = ?auto_60748 ?auto_60747 ) ) ( not ( = ?auto_60749 ?auto_60747 ) ) ( ON ?auto_60744 ?auto_60743 ) ( ON-TABLE ?auto_60747 ) ( ON ?auto_60745 ?auto_60744 ) ( ON ?auto_60746 ?auto_60745 ) ( ON ?auto_60748 ?auto_60746 ) ( ON ?auto_60749 ?auto_60748 ) ( CLEAR ?auto_60749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60747 ?auto_60743 ?auto_60744 ?auto_60745 ?auto_60746 ?auto_60748 )
      ( MAKE-4PILE ?auto_60743 ?auto_60744 ?auto_60745 ?auto_60746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60751 - BLOCK
    )
    :vars
    (
      ?auto_60752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60752 ?auto_60751 ) ( CLEAR ?auto_60752 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60751 ) ( not ( = ?auto_60751 ?auto_60752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60752 ?auto_60751 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60753 - BLOCK
    )
    :vars
    (
      ?auto_60754 - BLOCK
      ?auto_60755 - BLOCK
      ?auto_60756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60754 ?auto_60753 ) ( CLEAR ?auto_60754 ) ( ON-TABLE ?auto_60753 ) ( not ( = ?auto_60753 ?auto_60754 ) ) ( HOLDING ?auto_60755 ) ( CLEAR ?auto_60756 ) ( not ( = ?auto_60753 ?auto_60755 ) ) ( not ( = ?auto_60753 ?auto_60756 ) ) ( not ( = ?auto_60754 ?auto_60755 ) ) ( not ( = ?auto_60754 ?auto_60756 ) ) ( not ( = ?auto_60755 ?auto_60756 ) ) )
    :subtasks
    ( ( !STACK ?auto_60755 ?auto_60756 )
      ( MAKE-1PILE ?auto_60753 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60757 - BLOCK
    )
    :vars
    (
      ?auto_60758 - BLOCK
      ?auto_60759 - BLOCK
      ?auto_60760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60758 ?auto_60757 ) ( ON-TABLE ?auto_60757 ) ( not ( = ?auto_60757 ?auto_60758 ) ) ( CLEAR ?auto_60759 ) ( not ( = ?auto_60757 ?auto_60760 ) ) ( not ( = ?auto_60757 ?auto_60759 ) ) ( not ( = ?auto_60758 ?auto_60760 ) ) ( not ( = ?auto_60758 ?auto_60759 ) ) ( not ( = ?auto_60760 ?auto_60759 ) ) ( ON ?auto_60760 ?auto_60758 ) ( CLEAR ?auto_60760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60757 ?auto_60758 )
      ( MAKE-1PILE ?auto_60757 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60761 - BLOCK
    )
    :vars
    (
      ?auto_60763 - BLOCK
      ?auto_60762 - BLOCK
      ?auto_60764 - BLOCK
      ?auto_60765 - BLOCK
      ?auto_60766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60763 ?auto_60761 ) ( ON-TABLE ?auto_60761 ) ( not ( = ?auto_60761 ?auto_60763 ) ) ( not ( = ?auto_60761 ?auto_60762 ) ) ( not ( = ?auto_60761 ?auto_60764 ) ) ( not ( = ?auto_60763 ?auto_60762 ) ) ( not ( = ?auto_60763 ?auto_60764 ) ) ( not ( = ?auto_60762 ?auto_60764 ) ) ( ON ?auto_60762 ?auto_60763 ) ( CLEAR ?auto_60762 ) ( HOLDING ?auto_60764 ) ( CLEAR ?auto_60765 ) ( ON-TABLE ?auto_60766 ) ( ON ?auto_60765 ?auto_60766 ) ( not ( = ?auto_60766 ?auto_60765 ) ) ( not ( = ?auto_60766 ?auto_60764 ) ) ( not ( = ?auto_60765 ?auto_60764 ) ) ( not ( = ?auto_60761 ?auto_60765 ) ) ( not ( = ?auto_60761 ?auto_60766 ) ) ( not ( = ?auto_60763 ?auto_60765 ) ) ( not ( = ?auto_60763 ?auto_60766 ) ) ( not ( = ?auto_60762 ?auto_60765 ) ) ( not ( = ?auto_60762 ?auto_60766 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60766 ?auto_60765 ?auto_60764 )
      ( MAKE-1PILE ?auto_60761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60767 - BLOCK
    )
    :vars
    (
      ?auto_60770 - BLOCK
      ?auto_60768 - BLOCK
      ?auto_60769 - BLOCK
      ?auto_60771 - BLOCK
      ?auto_60772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60770 ?auto_60767 ) ( ON-TABLE ?auto_60767 ) ( not ( = ?auto_60767 ?auto_60770 ) ) ( not ( = ?auto_60767 ?auto_60768 ) ) ( not ( = ?auto_60767 ?auto_60769 ) ) ( not ( = ?auto_60770 ?auto_60768 ) ) ( not ( = ?auto_60770 ?auto_60769 ) ) ( not ( = ?auto_60768 ?auto_60769 ) ) ( ON ?auto_60768 ?auto_60770 ) ( CLEAR ?auto_60771 ) ( ON-TABLE ?auto_60772 ) ( ON ?auto_60771 ?auto_60772 ) ( not ( = ?auto_60772 ?auto_60771 ) ) ( not ( = ?auto_60772 ?auto_60769 ) ) ( not ( = ?auto_60771 ?auto_60769 ) ) ( not ( = ?auto_60767 ?auto_60771 ) ) ( not ( = ?auto_60767 ?auto_60772 ) ) ( not ( = ?auto_60770 ?auto_60771 ) ) ( not ( = ?auto_60770 ?auto_60772 ) ) ( not ( = ?auto_60768 ?auto_60771 ) ) ( not ( = ?auto_60768 ?auto_60772 ) ) ( ON ?auto_60769 ?auto_60768 ) ( CLEAR ?auto_60769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60767 ?auto_60770 ?auto_60768 )
      ( MAKE-1PILE ?auto_60767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60773 - BLOCK
    )
    :vars
    (
      ?auto_60776 - BLOCK
      ?auto_60778 - BLOCK
      ?auto_60774 - BLOCK
      ?auto_60777 - BLOCK
      ?auto_60775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60776 ?auto_60773 ) ( ON-TABLE ?auto_60773 ) ( not ( = ?auto_60773 ?auto_60776 ) ) ( not ( = ?auto_60773 ?auto_60778 ) ) ( not ( = ?auto_60773 ?auto_60774 ) ) ( not ( = ?auto_60776 ?auto_60778 ) ) ( not ( = ?auto_60776 ?auto_60774 ) ) ( not ( = ?auto_60778 ?auto_60774 ) ) ( ON ?auto_60778 ?auto_60776 ) ( ON-TABLE ?auto_60777 ) ( not ( = ?auto_60777 ?auto_60775 ) ) ( not ( = ?auto_60777 ?auto_60774 ) ) ( not ( = ?auto_60775 ?auto_60774 ) ) ( not ( = ?auto_60773 ?auto_60775 ) ) ( not ( = ?auto_60773 ?auto_60777 ) ) ( not ( = ?auto_60776 ?auto_60775 ) ) ( not ( = ?auto_60776 ?auto_60777 ) ) ( not ( = ?auto_60778 ?auto_60775 ) ) ( not ( = ?auto_60778 ?auto_60777 ) ) ( ON ?auto_60774 ?auto_60778 ) ( CLEAR ?auto_60774 ) ( HOLDING ?auto_60775 ) ( CLEAR ?auto_60777 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60777 ?auto_60775 )
      ( MAKE-1PILE ?auto_60773 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60779 - BLOCK
    )
    :vars
    (
      ?auto_60780 - BLOCK
      ?auto_60782 - BLOCK
      ?auto_60784 - BLOCK
      ?auto_60781 - BLOCK
      ?auto_60783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60780 ?auto_60779 ) ( ON-TABLE ?auto_60779 ) ( not ( = ?auto_60779 ?auto_60780 ) ) ( not ( = ?auto_60779 ?auto_60782 ) ) ( not ( = ?auto_60779 ?auto_60784 ) ) ( not ( = ?auto_60780 ?auto_60782 ) ) ( not ( = ?auto_60780 ?auto_60784 ) ) ( not ( = ?auto_60782 ?auto_60784 ) ) ( ON ?auto_60782 ?auto_60780 ) ( ON-TABLE ?auto_60781 ) ( not ( = ?auto_60781 ?auto_60783 ) ) ( not ( = ?auto_60781 ?auto_60784 ) ) ( not ( = ?auto_60783 ?auto_60784 ) ) ( not ( = ?auto_60779 ?auto_60783 ) ) ( not ( = ?auto_60779 ?auto_60781 ) ) ( not ( = ?auto_60780 ?auto_60783 ) ) ( not ( = ?auto_60780 ?auto_60781 ) ) ( not ( = ?auto_60782 ?auto_60783 ) ) ( not ( = ?auto_60782 ?auto_60781 ) ) ( ON ?auto_60784 ?auto_60782 ) ( CLEAR ?auto_60781 ) ( ON ?auto_60783 ?auto_60784 ) ( CLEAR ?auto_60783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60779 ?auto_60780 ?auto_60782 ?auto_60784 )
      ( MAKE-1PILE ?auto_60779 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60785 - BLOCK
    )
    :vars
    (
      ?auto_60786 - BLOCK
      ?auto_60788 - BLOCK
      ?auto_60790 - BLOCK
      ?auto_60787 - BLOCK
      ?auto_60789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60786 ?auto_60785 ) ( ON-TABLE ?auto_60785 ) ( not ( = ?auto_60785 ?auto_60786 ) ) ( not ( = ?auto_60785 ?auto_60788 ) ) ( not ( = ?auto_60785 ?auto_60790 ) ) ( not ( = ?auto_60786 ?auto_60788 ) ) ( not ( = ?auto_60786 ?auto_60790 ) ) ( not ( = ?auto_60788 ?auto_60790 ) ) ( ON ?auto_60788 ?auto_60786 ) ( not ( = ?auto_60787 ?auto_60789 ) ) ( not ( = ?auto_60787 ?auto_60790 ) ) ( not ( = ?auto_60789 ?auto_60790 ) ) ( not ( = ?auto_60785 ?auto_60789 ) ) ( not ( = ?auto_60785 ?auto_60787 ) ) ( not ( = ?auto_60786 ?auto_60789 ) ) ( not ( = ?auto_60786 ?auto_60787 ) ) ( not ( = ?auto_60788 ?auto_60789 ) ) ( not ( = ?auto_60788 ?auto_60787 ) ) ( ON ?auto_60790 ?auto_60788 ) ( ON ?auto_60789 ?auto_60790 ) ( CLEAR ?auto_60789 ) ( HOLDING ?auto_60787 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60787 )
      ( MAKE-1PILE ?auto_60785 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60791 - BLOCK
    )
    :vars
    (
      ?auto_60793 - BLOCK
      ?auto_60795 - BLOCK
      ?auto_60794 - BLOCK
      ?auto_60796 - BLOCK
      ?auto_60792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60793 ?auto_60791 ) ( ON-TABLE ?auto_60791 ) ( not ( = ?auto_60791 ?auto_60793 ) ) ( not ( = ?auto_60791 ?auto_60795 ) ) ( not ( = ?auto_60791 ?auto_60794 ) ) ( not ( = ?auto_60793 ?auto_60795 ) ) ( not ( = ?auto_60793 ?auto_60794 ) ) ( not ( = ?auto_60795 ?auto_60794 ) ) ( ON ?auto_60795 ?auto_60793 ) ( not ( = ?auto_60796 ?auto_60792 ) ) ( not ( = ?auto_60796 ?auto_60794 ) ) ( not ( = ?auto_60792 ?auto_60794 ) ) ( not ( = ?auto_60791 ?auto_60792 ) ) ( not ( = ?auto_60791 ?auto_60796 ) ) ( not ( = ?auto_60793 ?auto_60792 ) ) ( not ( = ?auto_60793 ?auto_60796 ) ) ( not ( = ?auto_60795 ?auto_60792 ) ) ( not ( = ?auto_60795 ?auto_60796 ) ) ( ON ?auto_60794 ?auto_60795 ) ( ON ?auto_60792 ?auto_60794 ) ( ON ?auto_60796 ?auto_60792 ) ( CLEAR ?auto_60796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60791 ?auto_60793 ?auto_60795 ?auto_60794 ?auto_60792 )
      ( MAKE-1PILE ?auto_60791 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60797 - BLOCK
    )
    :vars
    (
      ?auto_60800 - BLOCK
      ?auto_60801 - BLOCK
      ?auto_60799 - BLOCK
      ?auto_60798 - BLOCK
      ?auto_60802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60800 ?auto_60797 ) ( ON-TABLE ?auto_60797 ) ( not ( = ?auto_60797 ?auto_60800 ) ) ( not ( = ?auto_60797 ?auto_60801 ) ) ( not ( = ?auto_60797 ?auto_60799 ) ) ( not ( = ?auto_60800 ?auto_60801 ) ) ( not ( = ?auto_60800 ?auto_60799 ) ) ( not ( = ?auto_60801 ?auto_60799 ) ) ( ON ?auto_60801 ?auto_60800 ) ( not ( = ?auto_60798 ?auto_60802 ) ) ( not ( = ?auto_60798 ?auto_60799 ) ) ( not ( = ?auto_60802 ?auto_60799 ) ) ( not ( = ?auto_60797 ?auto_60802 ) ) ( not ( = ?auto_60797 ?auto_60798 ) ) ( not ( = ?auto_60800 ?auto_60802 ) ) ( not ( = ?auto_60800 ?auto_60798 ) ) ( not ( = ?auto_60801 ?auto_60802 ) ) ( not ( = ?auto_60801 ?auto_60798 ) ) ( ON ?auto_60799 ?auto_60801 ) ( ON ?auto_60802 ?auto_60799 ) ( HOLDING ?auto_60798 ) ( CLEAR ?auto_60802 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60797 ?auto_60800 ?auto_60801 ?auto_60799 ?auto_60802 ?auto_60798 )
      ( MAKE-1PILE ?auto_60797 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60803 - BLOCK
    )
    :vars
    (
      ?auto_60804 - BLOCK
      ?auto_60806 - BLOCK
      ?auto_60808 - BLOCK
      ?auto_60807 - BLOCK
      ?auto_60805 - BLOCK
      ?auto_60809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60804 ?auto_60803 ) ( ON-TABLE ?auto_60803 ) ( not ( = ?auto_60803 ?auto_60804 ) ) ( not ( = ?auto_60803 ?auto_60806 ) ) ( not ( = ?auto_60803 ?auto_60808 ) ) ( not ( = ?auto_60804 ?auto_60806 ) ) ( not ( = ?auto_60804 ?auto_60808 ) ) ( not ( = ?auto_60806 ?auto_60808 ) ) ( ON ?auto_60806 ?auto_60804 ) ( not ( = ?auto_60807 ?auto_60805 ) ) ( not ( = ?auto_60807 ?auto_60808 ) ) ( not ( = ?auto_60805 ?auto_60808 ) ) ( not ( = ?auto_60803 ?auto_60805 ) ) ( not ( = ?auto_60803 ?auto_60807 ) ) ( not ( = ?auto_60804 ?auto_60805 ) ) ( not ( = ?auto_60804 ?auto_60807 ) ) ( not ( = ?auto_60806 ?auto_60805 ) ) ( not ( = ?auto_60806 ?auto_60807 ) ) ( ON ?auto_60808 ?auto_60806 ) ( ON ?auto_60805 ?auto_60808 ) ( CLEAR ?auto_60805 ) ( ON ?auto_60807 ?auto_60809 ) ( CLEAR ?auto_60807 ) ( HAND-EMPTY ) ( not ( = ?auto_60803 ?auto_60809 ) ) ( not ( = ?auto_60804 ?auto_60809 ) ) ( not ( = ?auto_60806 ?auto_60809 ) ) ( not ( = ?auto_60808 ?auto_60809 ) ) ( not ( = ?auto_60807 ?auto_60809 ) ) ( not ( = ?auto_60805 ?auto_60809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60807 ?auto_60809 )
      ( MAKE-1PILE ?auto_60803 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60810 - BLOCK
    )
    :vars
    (
      ?auto_60815 - BLOCK
      ?auto_60813 - BLOCK
      ?auto_60812 - BLOCK
      ?auto_60811 - BLOCK
      ?auto_60814 - BLOCK
      ?auto_60816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60815 ?auto_60810 ) ( ON-TABLE ?auto_60810 ) ( not ( = ?auto_60810 ?auto_60815 ) ) ( not ( = ?auto_60810 ?auto_60813 ) ) ( not ( = ?auto_60810 ?auto_60812 ) ) ( not ( = ?auto_60815 ?auto_60813 ) ) ( not ( = ?auto_60815 ?auto_60812 ) ) ( not ( = ?auto_60813 ?auto_60812 ) ) ( ON ?auto_60813 ?auto_60815 ) ( not ( = ?auto_60811 ?auto_60814 ) ) ( not ( = ?auto_60811 ?auto_60812 ) ) ( not ( = ?auto_60814 ?auto_60812 ) ) ( not ( = ?auto_60810 ?auto_60814 ) ) ( not ( = ?auto_60810 ?auto_60811 ) ) ( not ( = ?auto_60815 ?auto_60814 ) ) ( not ( = ?auto_60815 ?auto_60811 ) ) ( not ( = ?auto_60813 ?auto_60814 ) ) ( not ( = ?auto_60813 ?auto_60811 ) ) ( ON ?auto_60812 ?auto_60813 ) ( ON ?auto_60811 ?auto_60816 ) ( CLEAR ?auto_60811 ) ( not ( = ?auto_60810 ?auto_60816 ) ) ( not ( = ?auto_60815 ?auto_60816 ) ) ( not ( = ?auto_60813 ?auto_60816 ) ) ( not ( = ?auto_60812 ?auto_60816 ) ) ( not ( = ?auto_60811 ?auto_60816 ) ) ( not ( = ?auto_60814 ?auto_60816 ) ) ( HOLDING ?auto_60814 ) ( CLEAR ?auto_60812 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60810 ?auto_60815 ?auto_60813 ?auto_60812 ?auto_60814 )
      ( MAKE-1PILE ?auto_60810 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60817 - BLOCK
    )
    :vars
    (
      ?auto_60822 - BLOCK
      ?auto_60821 - BLOCK
      ?auto_60819 - BLOCK
      ?auto_60823 - BLOCK
      ?auto_60820 - BLOCK
      ?auto_60818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60822 ?auto_60817 ) ( ON-TABLE ?auto_60817 ) ( not ( = ?auto_60817 ?auto_60822 ) ) ( not ( = ?auto_60817 ?auto_60821 ) ) ( not ( = ?auto_60817 ?auto_60819 ) ) ( not ( = ?auto_60822 ?auto_60821 ) ) ( not ( = ?auto_60822 ?auto_60819 ) ) ( not ( = ?auto_60821 ?auto_60819 ) ) ( ON ?auto_60821 ?auto_60822 ) ( not ( = ?auto_60823 ?auto_60820 ) ) ( not ( = ?auto_60823 ?auto_60819 ) ) ( not ( = ?auto_60820 ?auto_60819 ) ) ( not ( = ?auto_60817 ?auto_60820 ) ) ( not ( = ?auto_60817 ?auto_60823 ) ) ( not ( = ?auto_60822 ?auto_60820 ) ) ( not ( = ?auto_60822 ?auto_60823 ) ) ( not ( = ?auto_60821 ?auto_60820 ) ) ( not ( = ?auto_60821 ?auto_60823 ) ) ( ON ?auto_60819 ?auto_60821 ) ( ON ?auto_60823 ?auto_60818 ) ( not ( = ?auto_60817 ?auto_60818 ) ) ( not ( = ?auto_60822 ?auto_60818 ) ) ( not ( = ?auto_60821 ?auto_60818 ) ) ( not ( = ?auto_60819 ?auto_60818 ) ) ( not ( = ?auto_60823 ?auto_60818 ) ) ( not ( = ?auto_60820 ?auto_60818 ) ) ( CLEAR ?auto_60819 ) ( ON ?auto_60820 ?auto_60823 ) ( CLEAR ?auto_60820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60818 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60818 ?auto_60823 )
      ( MAKE-1PILE ?auto_60817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60824 - BLOCK
    )
    :vars
    (
      ?auto_60826 - BLOCK
      ?auto_60828 - BLOCK
      ?auto_60829 - BLOCK
      ?auto_60830 - BLOCK
      ?auto_60827 - BLOCK
      ?auto_60825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60826 ?auto_60824 ) ( ON-TABLE ?auto_60824 ) ( not ( = ?auto_60824 ?auto_60826 ) ) ( not ( = ?auto_60824 ?auto_60828 ) ) ( not ( = ?auto_60824 ?auto_60829 ) ) ( not ( = ?auto_60826 ?auto_60828 ) ) ( not ( = ?auto_60826 ?auto_60829 ) ) ( not ( = ?auto_60828 ?auto_60829 ) ) ( ON ?auto_60828 ?auto_60826 ) ( not ( = ?auto_60830 ?auto_60827 ) ) ( not ( = ?auto_60830 ?auto_60829 ) ) ( not ( = ?auto_60827 ?auto_60829 ) ) ( not ( = ?auto_60824 ?auto_60827 ) ) ( not ( = ?auto_60824 ?auto_60830 ) ) ( not ( = ?auto_60826 ?auto_60827 ) ) ( not ( = ?auto_60826 ?auto_60830 ) ) ( not ( = ?auto_60828 ?auto_60827 ) ) ( not ( = ?auto_60828 ?auto_60830 ) ) ( ON ?auto_60830 ?auto_60825 ) ( not ( = ?auto_60824 ?auto_60825 ) ) ( not ( = ?auto_60826 ?auto_60825 ) ) ( not ( = ?auto_60828 ?auto_60825 ) ) ( not ( = ?auto_60829 ?auto_60825 ) ) ( not ( = ?auto_60830 ?auto_60825 ) ) ( not ( = ?auto_60827 ?auto_60825 ) ) ( ON ?auto_60827 ?auto_60830 ) ( CLEAR ?auto_60827 ) ( ON-TABLE ?auto_60825 ) ( HOLDING ?auto_60829 ) ( CLEAR ?auto_60828 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60824 ?auto_60826 ?auto_60828 ?auto_60829 )
      ( MAKE-1PILE ?auto_60824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60831 - BLOCK
    )
    :vars
    (
      ?auto_60837 - BLOCK
      ?auto_60832 - BLOCK
      ?auto_60835 - BLOCK
      ?auto_60834 - BLOCK
      ?auto_60833 - BLOCK
      ?auto_60836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60837 ?auto_60831 ) ( ON-TABLE ?auto_60831 ) ( not ( = ?auto_60831 ?auto_60837 ) ) ( not ( = ?auto_60831 ?auto_60832 ) ) ( not ( = ?auto_60831 ?auto_60835 ) ) ( not ( = ?auto_60837 ?auto_60832 ) ) ( not ( = ?auto_60837 ?auto_60835 ) ) ( not ( = ?auto_60832 ?auto_60835 ) ) ( ON ?auto_60832 ?auto_60837 ) ( not ( = ?auto_60834 ?auto_60833 ) ) ( not ( = ?auto_60834 ?auto_60835 ) ) ( not ( = ?auto_60833 ?auto_60835 ) ) ( not ( = ?auto_60831 ?auto_60833 ) ) ( not ( = ?auto_60831 ?auto_60834 ) ) ( not ( = ?auto_60837 ?auto_60833 ) ) ( not ( = ?auto_60837 ?auto_60834 ) ) ( not ( = ?auto_60832 ?auto_60833 ) ) ( not ( = ?auto_60832 ?auto_60834 ) ) ( ON ?auto_60834 ?auto_60836 ) ( not ( = ?auto_60831 ?auto_60836 ) ) ( not ( = ?auto_60837 ?auto_60836 ) ) ( not ( = ?auto_60832 ?auto_60836 ) ) ( not ( = ?auto_60835 ?auto_60836 ) ) ( not ( = ?auto_60834 ?auto_60836 ) ) ( not ( = ?auto_60833 ?auto_60836 ) ) ( ON ?auto_60833 ?auto_60834 ) ( ON-TABLE ?auto_60836 ) ( CLEAR ?auto_60832 ) ( ON ?auto_60835 ?auto_60833 ) ( CLEAR ?auto_60835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60836 ?auto_60834 ?auto_60833 )
      ( MAKE-1PILE ?auto_60831 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60838 - BLOCK
    )
    :vars
    (
      ?auto_60842 - BLOCK
      ?auto_60844 - BLOCK
      ?auto_60839 - BLOCK
      ?auto_60843 - BLOCK
      ?auto_60841 - BLOCK
      ?auto_60840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60842 ?auto_60838 ) ( ON-TABLE ?auto_60838 ) ( not ( = ?auto_60838 ?auto_60842 ) ) ( not ( = ?auto_60838 ?auto_60844 ) ) ( not ( = ?auto_60838 ?auto_60839 ) ) ( not ( = ?auto_60842 ?auto_60844 ) ) ( not ( = ?auto_60842 ?auto_60839 ) ) ( not ( = ?auto_60844 ?auto_60839 ) ) ( not ( = ?auto_60843 ?auto_60841 ) ) ( not ( = ?auto_60843 ?auto_60839 ) ) ( not ( = ?auto_60841 ?auto_60839 ) ) ( not ( = ?auto_60838 ?auto_60841 ) ) ( not ( = ?auto_60838 ?auto_60843 ) ) ( not ( = ?auto_60842 ?auto_60841 ) ) ( not ( = ?auto_60842 ?auto_60843 ) ) ( not ( = ?auto_60844 ?auto_60841 ) ) ( not ( = ?auto_60844 ?auto_60843 ) ) ( ON ?auto_60843 ?auto_60840 ) ( not ( = ?auto_60838 ?auto_60840 ) ) ( not ( = ?auto_60842 ?auto_60840 ) ) ( not ( = ?auto_60844 ?auto_60840 ) ) ( not ( = ?auto_60839 ?auto_60840 ) ) ( not ( = ?auto_60843 ?auto_60840 ) ) ( not ( = ?auto_60841 ?auto_60840 ) ) ( ON ?auto_60841 ?auto_60843 ) ( ON-TABLE ?auto_60840 ) ( ON ?auto_60839 ?auto_60841 ) ( CLEAR ?auto_60839 ) ( HOLDING ?auto_60844 ) ( CLEAR ?auto_60842 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60838 ?auto_60842 ?auto_60844 )
      ( MAKE-1PILE ?auto_60838 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60845 - BLOCK
    )
    :vars
    (
      ?auto_60850 - BLOCK
      ?auto_60848 - BLOCK
      ?auto_60846 - BLOCK
      ?auto_60851 - BLOCK
      ?auto_60849 - BLOCK
      ?auto_60847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60850 ?auto_60845 ) ( ON-TABLE ?auto_60845 ) ( not ( = ?auto_60845 ?auto_60850 ) ) ( not ( = ?auto_60845 ?auto_60848 ) ) ( not ( = ?auto_60845 ?auto_60846 ) ) ( not ( = ?auto_60850 ?auto_60848 ) ) ( not ( = ?auto_60850 ?auto_60846 ) ) ( not ( = ?auto_60848 ?auto_60846 ) ) ( not ( = ?auto_60851 ?auto_60849 ) ) ( not ( = ?auto_60851 ?auto_60846 ) ) ( not ( = ?auto_60849 ?auto_60846 ) ) ( not ( = ?auto_60845 ?auto_60849 ) ) ( not ( = ?auto_60845 ?auto_60851 ) ) ( not ( = ?auto_60850 ?auto_60849 ) ) ( not ( = ?auto_60850 ?auto_60851 ) ) ( not ( = ?auto_60848 ?auto_60849 ) ) ( not ( = ?auto_60848 ?auto_60851 ) ) ( ON ?auto_60851 ?auto_60847 ) ( not ( = ?auto_60845 ?auto_60847 ) ) ( not ( = ?auto_60850 ?auto_60847 ) ) ( not ( = ?auto_60848 ?auto_60847 ) ) ( not ( = ?auto_60846 ?auto_60847 ) ) ( not ( = ?auto_60851 ?auto_60847 ) ) ( not ( = ?auto_60849 ?auto_60847 ) ) ( ON ?auto_60849 ?auto_60851 ) ( ON-TABLE ?auto_60847 ) ( ON ?auto_60846 ?auto_60849 ) ( CLEAR ?auto_60850 ) ( ON ?auto_60848 ?auto_60846 ) ( CLEAR ?auto_60848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60847 ?auto_60851 ?auto_60849 ?auto_60846 )
      ( MAKE-1PILE ?auto_60845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60866 - BLOCK
    )
    :vars
    (
      ?auto_60871 - BLOCK
      ?auto_60867 - BLOCK
      ?auto_60872 - BLOCK
      ?auto_60870 - BLOCK
      ?auto_60868 - BLOCK
      ?auto_60869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60866 ?auto_60871 ) ) ( not ( = ?auto_60866 ?auto_60867 ) ) ( not ( = ?auto_60866 ?auto_60872 ) ) ( not ( = ?auto_60871 ?auto_60867 ) ) ( not ( = ?auto_60871 ?auto_60872 ) ) ( not ( = ?auto_60867 ?auto_60872 ) ) ( not ( = ?auto_60870 ?auto_60868 ) ) ( not ( = ?auto_60870 ?auto_60872 ) ) ( not ( = ?auto_60868 ?auto_60872 ) ) ( not ( = ?auto_60866 ?auto_60868 ) ) ( not ( = ?auto_60866 ?auto_60870 ) ) ( not ( = ?auto_60871 ?auto_60868 ) ) ( not ( = ?auto_60871 ?auto_60870 ) ) ( not ( = ?auto_60867 ?auto_60868 ) ) ( not ( = ?auto_60867 ?auto_60870 ) ) ( ON ?auto_60870 ?auto_60869 ) ( not ( = ?auto_60866 ?auto_60869 ) ) ( not ( = ?auto_60871 ?auto_60869 ) ) ( not ( = ?auto_60867 ?auto_60869 ) ) ( not ( = ?auto_60872 ?auto_60869 ) ) ( not ( = ?auto_60870 ?auto_60869 ) ) ( not ( = ?auto_60868 ?auto_60869 ) ) ( ON ?auto_60868 ?auto_60870 ) ( ON-TABLE ?auto_60869 ) ( ON ?auto_60872 ?auto_60868 ) ( ON ?auto_60867 ?auto_60872 ) ( ON ?auto_60871 ?auto_60867 ) ( CLEAR ?auto_60871 ) ( HOLDING ?auto_60866 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60866 ?auto_60871 )
      ( MAKE-1PILE ?auto_60866 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60873 - BLOCK
    )
    :vars
    (
      ?auto_60876 - BLOCK
      ?auto_60874 - BLOCK
      ?auto_60878 - BLOCK
      ?auto_60875 - BLOCK
      ?auto_60877 - BLOCK
      ?auto_60879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60873 ?auto_60876 ) ) ( not ( = ?auto_60873 ?auto_60874 ) ) ( not ( = ?auto_60873 ?auto_60878 ) ) ( not ( = ?auto_60876 ?auto_60874 ) ) ( not ( = ?auto_60876 ?auto_60878 ) ) ( not ( = ?auto_60874 ?auto_60878 ) ) ( not ( = ?auto_60875 ?auto_60877 ) ) ( not ( = ?auto_60875 ?auto_60878 ) ) ( not ( = ?auto_60877 ?auto_60878 ) ) ( not ( = ?auto_60873 ?auto_60877 ) ) ( not ( = ?auto_60873 ?auto_60875 ) ) ( not ( = ?auto_60876 ?auto_60877 ) ) ( not ( = ?auto_60876 ?auto_60875 ) ) ( not ( = ?auto_60874 ?auto_60877 ) ) ( not ( = ?auto_60874 ?auto_60875 ) ) ( ON ?auto_60875 ?auto_60879 ) ( not ( = ?auto_60873 ?auto_60879 ) ) ( not ( = ?auto_60876 ?auto_60879 ) ) ( not ( = ?auto_60874 ?auto_60879 ) ) ( not ( = ?auto_60878 ?auto_60879 ) ) ( not ( = ?auto_60875 ?auto_60879 ) ) ( not ( = ?auto_60877 ?auto_60879 ) ) ( ON ?auto_60877 ?auto_60875 ) ( ON-TABLE ?auto_60879 ) ( ON ?auto_60878 ?auto_60877 ) ( ON ?auto_60874 ?auto_60878 ) ( ON ?auto_60876 ?auto_60874 ) ( ON ?auto_60873 ?auto_60876 ) ( CLEAR ?auto_60873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60879 ?auto_60875 ?auto_60877 ?auto_60878 ?auto_60874 ?auto_60876 )
      ( MAKE-1PILE ?auto_60873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60885 - BLOCK
      ?auto_60886 - BLOCK
      ?auto_60887 - BLOCK
      ?auto_60888 - BLOCK
      ?auto_60889 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_60889 ) ( CLEAR ?auto_60888 ) ( ON-TABLE ?auto_60885 ) ( ON ?auto_60886 ?auto_60885 ) ( ON ?auto_60887 ?auto_60886 ) ( ON ?auto_60888 ?auto_60887 ) ( not ( = ?auto_60885 ?auto_60886 ) ) ( not ( = ?auto_60885 ?auto_60887 ) ) ( not ( = ?auto_60885 ?auto_60888 ) ) ( not ( = ?auto_60885 ?auto_60889 ) ) ( not ( = ?auto_60886 ?auto_60887 ) ) ( not ( = ?auto_60886 ?auto_60888 ) ) ( not ( = ?auto_60886 ?auto_60889 ) ) ( not ( = ?auto_60887 ?auto_60888 ) ) ( not ( = ?auto_60887 ?auto_60889 ) ) ( not ( = ?auto_60888 ?auto_60889 ) ) )
    :subtasks
    ( ( !STACK ?auto_60889 ?auto_60888 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60890 - BLOCK
      ?auto_60891 - BLOCK
      ?auto_60892 - BLOCK
      ?auto_60893 - BLOCK
      ?auto_60894 - BLOCK
    )
    :vars
    (
      ?auto_60895 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60893 ) ( ON-TABLE ?auto_60890 ) ( ON ?auto_60891 ?auto_60890 ) ( ON ?auto_60892 ?auto_60891 ) ( ON ?auto_60893 ?auto_60892 ) ( not ( = ?auto_60890 ?auto_60891 ) ) ( not ( = ?auto_60890 ?auto_60892 ) ) ( not ( = ?auto_60890 ?auto_60893 ) ) ( not ( = ?auto_60890 ?auto_60894 ) ) ( not ( = ?auto_60891 ?auto_60892 ) ) ( not ( = ?auto_60891 ?auto_60893 ) ) ( not ( = ?auto_60891 ?auto_60894 ) ) ( not ( = ?auto_60892 ?auto_60893 ) ) ( not ( = ?auto_60892 ?auto_60894 ) ) ( not ( = ?auto_60893 ?auto_60894 ) ) ( ON ?auto_60894 ?auto_60895 ) ( CLEAR ?auto_60894 ) ( HAND-EMPTY ) ( not ( = ?auto_60890 ?auto_60895 ) ) ( not ( = ?auto_60891 ?auto_60895 ) ) ( not ( = ?auto_60892 ?auto_60895 ) ) ( not ( = ?auto_60893 ?auto_60895 ) ) ( not ( = ?auto_60894 ?auto_60895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60894 ?auto_60895 )
      ( MAKE-5PILE ?auto_60890 ?auto_60891 ?auto_60892 ?auto_60893 ?auto_60894 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60896 - BLOCK
      ?auto_60897 - BLOCK
      ?auto_60898 - BLOCK
      ?auto_60899 - BLOCK
      ?auto_60900 - BLOCK
    )
    :vars
    (
      ?auto_60901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60896 ) ( ON ?auto_60897 ?auto_60896 ) ( ON ?auto_60898 ?auto_60897 ) ( not ( = ?auto_60896 ?auto_60897 ) ) ( not ( = ?auto_60896 ?auto_60898 ) ) ( not ( = ?auto_60896 ?auto_60899 ) ) ( not ( = ?auto_60896 ?auto_60900 ) ) ( not ( = ?auto_60897 ?auto_60898 ) ) ( not ( = ?auto_60897 ?auto_60899 ) ) ( not ( = ?auto_60897 ?auto_60900 ) ) ( not ( = ?auto_60898 ?auto_60899 ) ) ( not ( = ?auto_60898 ?auto_60900 ) ) ( not ( = ?auto_60899 ?auto_60900 ) ) ( ON ?auto_60900 ?auto_60901 ) ( CLEAR ?auto_60900 ) ( not ( = ?auto_60896 ?auto_60901 ) ) ( not ( = ?auto_60897 ?auto_60901 ) ) ( not ( = ?auto_60898 ?auto_60901 ) ) ( not ( = ?auto_60899 ?auto_60901 ) ) ( not ( = ?auto_60900 ?auto_60901 ) ) ( HOLDING ?auto_60899 ) ( CLEAR ?auto_60898 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60896 ?auto_60897 ?auto_60898 ?auto_60899 )
      ( MAKE-5PILE ?auto_60896 ?auto_60897 ?auto_60898 ?auto_60899 ?auto_60900 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60902 - BLOCK
      ?auto_60903 - BLOCK
      ?auto_60904 - BLOCK
      ?auto_60905 - BLOCK
      ?auto_60906 - BLOCK
    )
    :vars
    (
      ?auto_60907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60902 ) ( ON ?auto_60903 ?auto_60902 ) ( ON ?auto_60904 ?auto_60903 ) ( not ( = ?auto_60902 ?auto_60903 ) ) ( not ( = ?auto_60902 ?auto_60904 ) ) ( not ( = ?auto_60902 ?auto_60905 ) ) ( not ( = ?auto_60902 ?auto_60906 ) ) ( not ( = ?auto_60903 ?auto_60904 ) ) ( not ( = ?auto_60903 ?auto_60905 ) ) ( not ( = ?auto_60903 ?auto_60906 ) ) ( not ( = ?auto_60904 ?auto_60905 ) ) ( not ( = ?auto_60904 ?auto_60906 ) ) ( not ( = ?auto_60905 ?auto_60906 ) ) ( ON ?auto_60906 ?auto_60907 ) ( not ( = ?auto_60902 ?auto_60907 ) ) ( not ( = ?auto_60903 ?auto_60907 ) ) ( not ( = ?auto_60904 ?auto_60907 ) ) ( not ( = ?auto_60905 ?auto_60907 ) ) ( not ( = ?auto_60906 ?auto_60907 ) ) ( CLEAR ?auto_60904 ) ( ON ?auto_60905 ?auto_60906 ) ( CLEAR ?auto_60905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60907 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60907 ?auto_60906 )
      ( MAKE-5PILE ?auto_60902 ?auto_60903 ?auto_60904 ?auto_60905 ?auto_60906 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60908 - BLOCK
      ?auto_60909 - BLOCK
      ?auto_60910 - BLOCK
      ?auto_60911 - BLOCK
      ?auto_60912 - BLOCK
    )
    :vars
    (
      ?auto_60913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60908 ) ( ON ?auto_60909 ?auto_60908 ) ( not ( = ?auto_60908 ?auto_60909 ) ) ( not ( = ?auto_60908 ?auto_60910 ) ) ( not ( = ?auto_60908 ?auto_60911 ) ) ( not ( = ?auto_60908 ?auto_60912 ) ) ( not ( = ?auto_60909 ?auto_60910 ) ) ( not ( = ?auto_60909 ?auto_60911 ) ) ( not ( = ?auto_60909 ?auto_60912 ) ) ( not ( = ?auto_60910 ?auto_60911 ) ) ( not ( = ?auto_60910 ?auto_60912 ) ) ( not ( = ?auto_60911 ?auto_60912 ) ) ( ON ?auto_60912 ?auto_60913 ) ( not ( = ?auto_60908 ?auto_60913 ) ) ( not ( = ?auto_60909 ?auto_60913 ) ) ( not ( = ?auto_60910 ?auto_60913 ) ) ( not ( = ?auto_60911 ?auto_60913 ) ) ( not ( = ?auto_60912 ?auto_60913 ) ) ( ON ?auto_60911 ?auto_60912 ) ( CLEAR ?auto_60911 ) ( ON-TABLE ?auto_60913 ) ( HOLDING ?auto_60910 ) ( CLEAR ?auto_60909 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60908 ?auto_60909 ?auto_60910 )
      ( MAKE-5PILE ?auto_60908 ?auto_60909 ?auto_60910 ?auto_60911 ?auto_60912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60914 - BLOCK
      ?auto_60915 - BLOCK
      ?auto_60916 - BLOCK
      ?auto_60917 - BLOCK
      ?auto_60918 - BLOCK
    )
    :vars
    (
      ?auto_60919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60914 ) ( ON ?auto_60915 ?auto_60914 ) ( not ( = ?auto_60914 ?auto_60915 ) ) ( not ( = ?auto_60914 ?auto_60916 ) ) ( not ( = ?auto_60914 ?auto_60917 ) ) ( not ( = ?auto_60914 ?auto_60918 ) ) ( not ( = ?auto_60915 ?auto_60916 ) ) ( not ( = ?auto_60915 ?auto_60917 ) ) ( not ( = ?auto_60915 ?auto_60918 ) ) ( not ( = ?auto_60916 ?auto_60917 ) ) ( not ( = ?auto_60916 ?auto_60918 ) ) ( not ( = ?auto_60917 ?auto_60918 ) ) ( ON ?auto_60918 ?auto_60919 ) ( not ( = ?auto_60914 ?auto_60919 ) ) ( not ( = ?auto_60915 ?auto_60919 ) ) ( not ( = ?auto_60916 ?auto_60919 ) ) ( not ( = ?auto_60917 ?auto_60919 ) ) ( not ( = ?auto_60918 ?auto_60919 ) ) ( ON ?auto_60917 ?auto_60918 ) ( ON-TABLE ?auto_60919 ) ( CLEAR ?auto_60915 ) ( ON ?auto_60916 ?auto_60917 ) ( CLEAR ?auto_60916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60919 ?auto_60918 ?auto_60917 )
      ( MAKE-5PILE ?auto_60914 ?auto_60915 ?auto_60916 ?auto_60917 ?auto_60918 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60920 - BLOCK
      ?auto_60921 - BLOCK
      ?auto_60922 - BLOCK
      ?auto_60923 - BLOCK
      ?auto_60924 - BLOCK
    )
    :vars
    (
      ?auto_60925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60920 ) ( not ( = ?auto_60920 ?auto_60921 ) ) ( not ( = ?auto_60920 ?auto_60922 ) ) ( not ( = ?auto_60920 ?auto_60923 ) ) ( not ( = ?auto_60920 ?auto_60924 ) ) ( not ( = ?auto_60921 ?auto_60922 ) ) ( not ( = ?auto_60921 ?auto_60923 ) ) ( not ( = ?auto_60921 ?auto_60924 ) ) ( not ( = ?auto_60922 ?auto_60923 ) ) ( not ( = ?auto_60922 ?auto_60924 ) ) ( not ( = ?auto_60923 ?auto_60924 ) ) ( ON ?auto_60924 ?auto_60925 ) ( not ( = ?auto_60920 ?auto_60925 ) ) ( not ( = ?auto_60921 ?auto_60925 ) ) ( not ( = ?auto_60922 ?auto_60925 ) ) ( not ( = ?auto_60923 ?auto_60925 ) ) ( not ( = ?auto_60924 ?auto_60925 ) ) ( ON ?auto_60923 ?auto_60924 ) ( ON-TABLE ?auto_60925 ) ( ON ?auto_60922 ?auto_60923 ) ( CLEAR ?auto_60922 ) ( HOLDING ?auto_60921 ) ( CLEAR ?auto_60920 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60920 ?auto_60921 )
      ( MAKE-5PILE ?auto_60920 ?auto_60921 ?auto_60922 ?auto_60923 ?auto_60924 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60926 - BLOCK
      ?auto_60927 - BLOCK
      ?auto_60928 - BLOCK
      ?auto_60929 - BLOCK
      ?auto_60930 - BLOCK
    )
    :vars
    (
      ?auto_60931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60926 ) ( not ( = ?auto_60926 ?auto_60927 ) ) ( not ( = ?auto_60926 ?auto_60928 ) ) ( not ( = ?auto_60926 ?auto_60929 ) ) ( not ( = ?auto_60926 ?auto_60930 ) ) ( not ( = ?auto_60927 ?auto_60928 ) ) ( not ( = ?auto_60927 ?auto_60929 ) ) ( not ( = ?auto_60927 ?auto_60930 ) ) ( not ( = ?auto_60928 ?auto_60929 ) ) ( not ( = ?auto_60928 ?auto_60930 ) ) ( not ( = ?auto_60929 ?auto_60930 ) ) ( ON ?auto_60930 ?auto_60931 ) ( not ( = ?auto_60926 ?auto_60931 ) ) ( not ( = ?auto_60927 ?auto_60931 ) ) ( not ( = ?auto_60928 ?auto_60931 ) ) ( not ( = ?auto_60929 ?auto_60931 ) ) ( not ( = ?auto_60930 ?auto_60931 ) ) ( ON ?auto_60929 ?auto_60930 ) ( ON-TABLE ?auto_60931 ) ( ON ?auto_60928 ?auto_60929 ) ( CLEAR ?auto_60926 ) ( ON ?auto_60927 ?auto_60928 ) ( CLEAR ?auto_60927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60931 ?auto_60930 ?auto_60929 ?auto_60928 )
      ( MAKE-5PILE ?auto_60926 ?auto_60927 ?auto_60928 ?auto_60929 ?auto_60930 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60932 - BLOCK
      ?auto_60933 - BLOCK
      ?auto_60934 - BLOCK
      ?auto_60935 - BLOCK
      ?auto_60936 - BLOCK
    )
    :vars
    (
      ?auto_60937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60932 ?auto_60933 ) ) ( not ( = ?auto_60932 ?auto_60934 ) ) ( not ( = ?auto_60932 ?auto_60935 ) ) ( not ( = ?auto_60932 ?auto_60936 ) ) ( not ( = ?auto_60933 ?auto_60934 ) ) ( not ( = ?auto_60933 ?auto_60935 ) ) ( not ( = ?auto_60933 ?auto_60936 ) ) ( not ( = ?auto_60934 ?auto_60935 ) ) ( not ( = ?auto_60934 ?auto_60936 ) ) ( not ( = ?auto_60935 ?auto_60936 ) ) ( ON ?auto_60936 ?auto_60937 ) ( not ( = ?auto_60932 ?auto_60937 ) ) ( not ( = ?auto_60933 ?auto_60937 ) ) ( not ( = ?auto_60934 ?auto_60937 ) ) ( not ( = ?auto_60935 ?auto_60937 ) ) ( not ( = ?auto_60936 ?auto_60937 ) ) ( ON ?auto_60935 ?auto_60936 ) ( ON-TABLE ?auto_60937 ) ( ON ?auto_60934 ?auto_60935 ) ( ON ?auto_60933 ?auto_60934 ) ( CLEAR ?auto_60933 ) ( HOLDING ?auto_60932 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60932 )
      ( MAKE-5PILE ?auto_60932 ?auto_60933 ?auto_60934 ?auto_60935 ?auto_60936 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60938 - BLOCK
      ?auto_60939 - BLOCK
      ?auto_60940 - BLOCK
      ?auto_60941 - BLOCK
      ?auto_60942 - BLOCK
    )
    :vars
    (
      ?auto_60943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60938 ?auto_60939 ) ) ( not ( = ?auto_60938 ?auto_60940 ) ) ( not ( = ?auto_60938 ?auto_60941 ) ) ( not ( = ?auto_60938 ?auto_60942 ) ) ( not ( = ?auto_60939 ?auto_60940 ) ) ( not ( = ?auto_60939 ?auto_60941 ) ) ( not ( = ?auto_60939 ?auto_60942 ) ) ( not ( = ?auto_60940 ?auto_60941 ) ) ( not ( = ?auto_60940 ?auto_60942 ) ) ( not ( = ?auto_60941 ?auto_60942 ) ) ( ON ?auto_60942 ?auto_60943 ) ( not ( = ?auto_60938 ?auto_60943 ) ) ( not ( = ?auto_60939 ?auto_60943 ) ) ( not ( = ?auto_60940 ?auto_60943 ) ) ( not ( = ?auto_60941 ?auto_60943 ) ) ( not ( = ?auto_60942 ?auto_60943 ) ) ( ON ?auto_60941 ?auto_60942 ) ( ON-TABLE ?auto_60943 ) ( ON ?auto_60940 ?auto_60941 ) ( ON ?auto_60939 ?auto_60940 ) ( ON ?auto_60938 ?auto_60939 ) ( CLEAR ?auto_60938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60943 ?auto_60942 ?auto_60941 ?auto_60940 ?auto_60939 )
      ( MAKE-5PILE ?auto_60938 ?auto_60939 ?auto_60940 ?auto_60941 ?auto_60942 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60944 - BLOCK
      ?auto_60945 - BLOCK
      ?auto_60946 - BLOCK
      ?auto_60947 - BLOCK
      ?auto_60948 - BLOCK
    )
    :vars
    (
      ?auto_60949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60944 ?auto_60945 ) ) ( not ( = ?auto_60944 ?auto_60946 ) ) ( not ( = ?auto_60944 ?auto_60947 ) ) ( not ( = ?auto_60944 ?auto_60948 ) ) ( not ( = ?auto_60945 ?auto_60946 ) ) ( not ( = ?auto_60945 ?auto_60947 ) ) ( not ( = ?auto_60945 ?auto_60948 ) ) ( not ( = ?auto_60946 ?auto_60947 ) ) ( not ( = ?auto_60946 ?auto_60948 ) ) ( not ( = ?auto_60947 ?auto_60948 ) ) ( ON ?auto_60948 ?auto_60949 ) ( not ( = ?auto_60944 ?auto_60949 ) ) ( not ( = ?auto_60945 ?auto_60949 ) ) ( not ( = ?auto_60946 ?auto_60949 ) ) ( not ( = ?auto_60947 ?auto_60949 ) ) ( not ( = ?auto_60948 ?auto_60949 ) ) ( ON ?auto_60947 ?auto_60948 ) ( ON-TABLE ?auto_60949 ) ( ON ?auto_60946 ?auto_60947 ) ( ON ?auto_60945 ?auto_60946 ) ( HOLDING ?auto_60944 ) ( CLEAR ?auto_60945 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60949 ?auto_60948 ?auto_60947 ?auto_60946 ?auto_60945 ?auto_60944 )
      ( MAKE-5PILE ?auto_60944 ?auto_60945 ?auto_60946 ?auto_60947 ?auto_60948 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60950 - BLOCK
      ?auto_60951 - BLOCK
      ?auto_60952 - BLOCK
      ?auto_60953 - BLOCK
      ?auto_60954 - BLOCK
    )
    :vars
    (
      ?auto_60955 - BLOCK
      ?auto_60956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60950 ?auto_60951 ) ) ( not ( = ?auto_60950 ?auto_60952 ) ) ( not ( = ?auto_60950 ?auto_60953 ) ) ( not ( = ?auto_60950 ?auto_60954 ) ) ( not ( = ?auto_60951 ?auto_60952 ) ) ( not ( = ?auto_60951 ?auto_60953 ) ) ( not ( = ?auto_60951 ?auto_60954 ) ) ( not ( = ?auto_60952 ?auto_60953 ) ) ( not ( = ?auto_60952 ?auto_60954 ) ) ( not ( = ?auto_60953 ?auto_60954 ) ) ( ON ?auto_60954 ?auto_60955 ) ( not ( = ?auto_60950 ?auto_60955 ) ) ( not ( = ?auto_60951 ?auto_60955 ) ) ( not ( = ?auto_60952 ?auto_60955 ) ) ( not ( = ?auto_60953 ?auto_60955 ) ) ( not ( = ?auto_60954 ?auto_60955 ) ) ( ON ?auto_60953 ?auto_60954 ) ( ON-TABLE ?auto_60955 ) ( ON ?auto_60952 ?auto_60953 ) ( ON ?auto_60951 ?auto_60952 ) ( CLEAR ?auto_60951 ) ( ON ?auto_60950 ?auto_60956 ) ( CLEAR ?auto_60950 ) ( HAND-EMPTY ) ( not ( = ?auto_60950 ?auto_60956 ) ) ( not ( = ?auto_60951 ?auto_60956 ) ) ( not ( = ?auto_60952 ?auto_60956 ) ) ( not ( = ?auto_60953 ?auto_60956 ) ) ( not ( = ?auto_60954 ?auto_60956 ) ) ( not ( = ?auto_60955 ?auto_60956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60950 ?auto_60956 )
      ( MAKE-5PILE ?auto_60950 ?auto_60951 ?auto_60952 ?auto_60953 ?auto_60954 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60957 - BLOCK
      ?auto_60958 - BLOCK
      ?auto_60959 - BLOCK
      ?auto_60960 - BLOCK
      ?auto_60961 - BLOCK
    )
    :vars
    (
      ?auto_60963 - BLOCK
      ?auto_60962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60957 ?auto_60958 ) ) ( not ( = ?auto_60957 ?auto_60959 ) ) ( not ( = ?auto_60957 ?auto_60960 ) ) ( not ( = ?auto_60957 ?auto_60961 ) ) ( not ( = ?auto_60958 ?auto_60959 ) ) ( not ( = ?auto_60958 ?auto_60960 ) ) ( not ( = ?auto_60958 ?auto_60961 ) ) ( not ( = ?auto_60959 ?auto_60960 ) ) ( not ( = ?auto_60959 ?auto_60961 ) ) ( not ( = ?auto_60960 ?auto_60961 ) ) ( ON ?auto_60961 ?auto_60963 ) ( not ( = ?auto_60957 ?auto_60963 ) ) ( not ( = ?auto_60958 ?auto_60963 ) ) ( not ( = ?auto_60959 ?auto_60963 ) ) ( not ( = ?auto_60960 ?auto_60963 ) ) ( not ( = ?auto_60961 ?auto_60963 ) ) ( ON ?auto_60960 ?auto_60961 ) ( ON-TABLE ?auto_60963 ) ( ON ?auto_60959 ?auto_60960 ) ( ON ?auto_60957 ?auto_60962 ) ( CLEAR ?auto_60957 ) ( not ( = ?auto_60957 ?auto_60962 ) ) ( not ( = ?auto_60958 ?auto_60962 ) ) ( not ( = ?auto_60959 ?auto_60962 ) ) ( not ( = ?auto_60960 ?auto_60962 ) ) ( not ( = ?auto_60961 ?auto_60962 ) ) ( not ( = ?auto_60963 ?auto_60962 ) ) ( HOLDING ?auto_60958 ) ( CLEAR ?auto_60959 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60963 ?auto_60961 ?auto_60960 ?auto_60959 ?auto_60958 )
      ( MAKE-5PILE ?auto_60957 ?auto_60958 ?auto_60959 ?auto_60960 ?auto_60961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60964 - BLOCK
      ?auto_60965 - BLOCK
      ?auto_60966 - BLOCK
      ?auto_60967 - BLOCK
      ?auto_60968 - BLOCK
    )
    :vars
    (
      ?auto_60969 - BLOCK
      ?auto_60970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60964 ?auto_60965 ) ) ( not ( = ?auto_60964 ?auto_60966 ) ) ( not ( = ?auto_60964 ?auto_60967 ) ) ( not ( = ?auto_60964 ?auto_60968 ) ) ( not ( = ?auto_60965 ?auto_60966 ) ) ( not ( = ?auto_60965 ?auto_60967 ) ) ( not ( = ?auto_60965 ?auto_60968 ) ) ( not ( = ?auto_60966 ?auto_60967 ) ) ( not ( = ?auto_60966 ?auto_60968 ) ) ( not ( = ?auto_60967 ?auto_60968 ) ) ( ON ?auto_60968 ?auto_60969 ) ( not ( = ?auto_60964 ?auto_60969 ) ) ( not ( = ?auto_60965 ?auto_60969 ) ) ( not ( = ?auto_60966 ?auto_60969 ) ) ( not ( = ?auto_60967 ?auto_60969 ) ) ( not ( = ?auto_60968 ?auto_60969 ) ) ( ON ?auto_60967 ?auto_60968 ) ( ON-TABLE ?auto_60969 ) ( ON ?auto_60966 ?auto_60967 ) ( ON ?auto_60964 ?auto_60970 ) ( not ( = ?auto_60964 ?auto_60970 ) ) ( not ( = ?auto_60965 ?auto_60970 ) ) ( not ( = ?auto_60966 ?auto_60970 ) ) ( not ( = ?auto_60967 ?auto_60970 ) ) ( not ( = ?auto_60968 ?auto_60970 ) ) ( not ( = ?auto_60969 ?auto_60970 ) ) ( CLEAR ?auto_60966 ) ( ON ?auto_60965 ?auto_60964 ) ( CLEAR ?auto_60965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60970 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60970 ?auto_60964 )
      ( MAKE-5PILE ?auto_60964 ?auto_60965 ?auto_60966 ?auto_60967 ?auto_60968 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60971 - BLOCK
      ?auto_60972 - BLOCK
      ?auto_60973 - BLOCK
      ?auto_60974 - BLOCK
      ?auto_60975 - BLOCK
    )
    :vars
    (
      ?auto_60976 - BLOCK
      ?auto_60977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60971 ?auto_60972 ) ) ( not ( = ?auto_60971 ?auto_60973 ) ) ( not ( = ?auto_60971 ?auto_60974 ) ) ( not ( = ?auto_60971 ?auto_60975 ) ) ( not ( = ?auto_60972 ?auto_60973 ) ) ( not ( = ?auto_60972 ?auto_60974 ) ) ( not ( = ?auto_60972 ?auto_60975 ) ) ( not ( = ?auto_60973 ?auto_60974 ) ) ( not ( = ?auto_60973 ?auto_60975 ) ) ( not ( = ?auto_60974 ?auto_60975 ) ) ( ON ?auto_60975 ?auto_60976 ) ( not ( = ?auto_60971 ?auto_60976 ) ) ( not ( = ?auto_60972 ?auto_60976 ) ) ( not ( = ?auto_60973 ?auto_60976 ) ) ( not ( = ?auto_60974 ?auto_60976 ) ) ( not ( = ?auto_60975 ?auto_60976 ) ) ( ON ?auto_60974 ?auto_60975 ) ( ON-TABLE ?auto_60976 ) ( ON ?auto_60971 ?auto_60977 ) ( not ( = ?auto_60971 ?auto_60977 ) ) ( not ( = ?auto_60972 ?auto_60977 ) ) ( not ( = ?auto_60973 ?auto_60977 ) ) ( not ( = ?auto_60974 ?auto_60977 ) ) ( not ( = ?auto_60975 ?auto_60977 ) ) ( not ( = ?auto_60976 ?auto_60977 ) ) ( ON ?auto_60972 ?auto_60971 ) ( CLEAR ?auto_60972 ) ( ON-TABLE ?auto_60977 ) ( HOLDING ?auto_60973 ) ( CLEAR ?auto_60974 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60976 ?auto_60975 ?auto_60974 ?auto_60973 )
      ( MAKE-5PILE ?auto_60971 ?auto_60972 ?auto_60973 ?auto_60974 ?auto_60975 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60978 - BLOCK
      ?auto_60979 - BLOCK
      ?auto_60980 - BLOCK
      ?auto_60981 - BLOCK
      ?auto_60982 - BLOCK
    )
    :vars
    (
      ?auto_60983 - BLOCK
      ?auto_60984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60978 ?auto_60979 ) ) ( not ( = ?auto_60978 ?auto_60980 ) ) ( not ( = ?auto_60978 ?auto_60981 ) ) ( not ( = ?auto_60978 ?auto_60982 ) ) ( not ( = ?auto_60979 ?auto_60980 ) ) ( not ( = ?auto_60979 ?auto_60981 ) ) ( not ( = ?auto_60979 ?auto_60982 ) ) ( not ( = ?auto_60980 ?auto_60981 ) ) ( not ( = ?auto_60980 ?auto_60982 ) ) ( not ( = ?auto_60981 ?auto_60982 ) ) ( ON ?auto_60982 ?auto_60983 ) ( not ( = ?auto_60978 ?auto_60983 ) ) ( not ( = ?auto_60979 ?auto_60983 ) ) ( not ( = ?auto_60980 ?auto_60983 ) ) ( not ( = ?auto_60981 ?auto_60983 ) ) ( not ( = ?auto_60982 ?auto_60983 ) ) ( ON ?auto_60981 ?auto_60982 ) ( ON-TABLE ?auto_60983 ) ( ON ?auto_60978 ?auto_60984 ) ( not ( = ?auto_60978 ?auto_60984 ) ) ( not ( = ?auto_60979 ?auto_60984 ) ) ( not ( = ?auto_60980 ?auto_60984 ) ) ( not ( = ?auto_60981 ?auto_60984 ) ) ( not ( = ?auto_60982 ?auto_60984 ) ) ( not ( = ?auto_60983 ?auto_60984 ) ) ( ON ?auto_60979 ?auto_60978 ) ( ON-TABLE ?auto_60984 ) ( CLEAR ?auto_60981 ) ( ON ?auto_60980 ?auto_60979 ) ( CLEAR ?auto_60980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60984 ?auto_60978 ?auto_60979 )
      ( MAKE-5PILE ?auto_60978 ?auto_60979 ?auto_60980 ?auto_60981 ?auto_60982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60985 - BLOCK
      ?auto_60986 - BLOCK
      ?auto_60987 - BLOCK
      ?auto_60988 - BLOCK
      ?auto_60989 - BLOCK
    )
    :vars
    (
      ?auto_60990 - BLOCK
      ?auto_60991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60985 ?auto_60986 ) ) ( not ( = ?auto_60985 ?auto_60987 ) ) ( not ( = ?auto_60985 ?auto_60988 ) ) ( not ( = ?auto_60985 ?auto_60989 ) ) ( not ( = ?auto_60986 ?auto_60987 ) ) ( not ( = ?auto_60986 ?auto_60988 ) ) ( not ( = ?auto_60986 ?auto_60989 ) ) ( not ( = ?auto_60987 ?auto_60988 ) ) ( not ( = ?auto_60987 ?auto_60989 ) ) ( not ( = ?auto_60988 ?auto_60989 ) ) ( ON ?auto_60989 ?auto_60990 ) ( not ( = ?auto_60985 ?auto_60990 ) ) ( not ( = ?auto_60986 ?auto_60990 ) ) ( not ( = ?auto_60987 ?auto_60990 ) ) ( not ( = ?auto_60988 ?auto_60990 ) ) ( not ( = ?auto_60989 ?auto_60990 ) ) ( ON-TABLE ?auto_60990 ) ( ON ?auto_60985 ?auto_60991 ) ( not ( = ?auto_60985 ?auto_60991 ) ) ( not ( = ?auto_60986 ?auto_60991 ) ) ( not ( = ?auto_60987 ?auto_60991 ) ) ( not ( = ?auto_60988 ?auto_60991 ) ) ( not ( = ?auto_60989 ?auto_60991 ) ) ( not ( = ?auto_60990 ?auto_60991 ) ) ( ON ?auto_60986 ?auto_60985 ) ( ON-TABLE ?auto_60991 ) ( ON ?auto_60987 ?auto_60986 ) ( CLEAR ?auto_60987 ) ( HOLDING ?auto_60988 ) ( CLEAR ?auto_60989 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60990 ?auto_60989 ?auto_60988 )
      ( MAKE-5PILE ?auto_60985 ?auto_60986 ?auto_60987 ?auto_60988 ?auto_60989 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60992 - BLOCK
      ?auto_60993 - BLOCK
      ?auto_60994 - BLOCK
      ?auto_60995 - BLOCK
      ?auto_60996 - BLOCK
    )
    :vars
    (
      ?auto_60998 - BLOCK
      ?auto_60997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60992 ?auto_60993 ) ) ( not ( = ?auto_60992 ?auto_60994 ) ) ( not ( = ?auto_60992 ?auto_60995 ) ) ( not ( = ?auto_60992 ?auto_60996 ) ) ( not ( = ?auto_60993 ?auto_60994 ) ) ( not ( = ?auto_60993 ?auto_60995 ) ) ( not ( = ?auto_60993 ?auto_60996 ) ) ( not ( = ?auto_60994 ?auto_60995 ) ) ( not ( = ?auto_60994 ?auto_60996 ) ) ( not ( = ?auto_60995 ?auto_60996 ) ) ( ON ?auto_60996 ?auto_60998 ) ( not ( = ?auto_60992 ?auto_60998 ) ) ( not ( = ?auto_60993 ?auto_60998 ) ) ( not ( = ?auto_60994 ?auto_60998 ) ) ( not ( = ?auto_60995 ?auto_60998 ) ) ( not ( = ?auto_60996 ?auto_60998 ) ) ( ON-TABLE ?auto_60998 ) ( ON ?auto_60992 ?auto_60997 ) ( not ( = ?auto_60992 ?auto_60997 ) ) ( not ( = ?auto_60993 ?auto_60997 ) ) ( not ( = ?auto_60994 ?auto_60997 ) ) ( not ( = ?auto_60995 ?auto_60997 ) ) ( not ( = ?auto_60996 ?auto_60997 ) ) ( not ( = ?auto_60998 ?auto_60997 ) ) ( ON ?auto_60993 ?auto_60992 ) ( ON-TABLE ?auto_60997 ) ( ON ?auto_60994 ?auto_60993 ) ( CLEAR ?auto_60996 ) ( ON ?auto_60995 ?auto_60994 ) ( CLEAR ?auto_60995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60997 ?auto_60992 ?auto_60993 ?auto_60994 )
      ( MAKE-5PILE ?auto_60992 ?auto_60993 ?auto_60994 ?auto_60995 ?auto_60996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60999 - BLOCK
      ?auto_61000 - BLOCK
      ?auto_61001 - BLOCK
      ?auto_61002 - BLOCK
      ?auto_61003 - BLOCK
    )
    :vars
    (
      ?auto_61004 - BLOCK
      ?auto_61005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60999 ?auto_61000 ) ) ( not ( = ?auto_60999 ?auto_61001 ) ) ( not ( = ?auto_60999 ?auto_61002 ) ) ( not ( = ?auto_60999 ?auto_61003 ) ) ( not ( = ?auto_61000 ?auto_61001 ) ) ( not ( = ?auto_61000 ?auto_61002 ) ) ( not ( = ?auto_61000 ?auto_61003 ) ) ( not ( = ?auto_61001 ?auto_61002 ) ) ( not ( = ?auto_61001 ?auto_61003 ) ) ( not ( = ?auto_61002 ?auto_61003 ) ) ( not ( = ?auto_60999 ?auto_61004 ) ) ( not ( = ?auto_61000 ?auto_61004 ) ) ( not ( = ?auto_61001 ?auto_61004 ) ) ( not ( = ?auto_61002 ?auto_61004 ) ) ( not ( = ?auto_61003 ?auto_61004 ) ) ( ON-TABLE ?auto_61004 ) ( ON ?auto_60999 ?auto_61005 ) ( not ( = ?auto_60999 ?auto_61005 ) ) ( not ( = ?auto_61000 ?auto_61005 ) ) ( not ( = ?auto_61001 ?auto_61005 ) ) ( not ( = ?auto_61002 ?auto_61005 ) ) ( not ( = ?auto_61003 ?auto_61005 ) ) ( not ( = ?auto_61004 ?auto_61005 ) ) ( ON ?auto_61000 ?auto_60999 ) ( ON-TABLE ?auto_61005 ) ( ON ?auto_61001 ?auto_61000 ) ( ON ?auto_61002 ?auto_61001 ) ( CLEAR ?auto_61002 ) ( HOLDING ?auto_61003 ) ( CLEAR ?auto_61004 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61004 ?auto_61003 )
      ( MAKE-5PILE ?auto_60999 ?auto_61000 ?auto_61001 ?auto_61002 ?auto_61003 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61006 - BLOCK
      ?auto_61007 - BLOCK
      ?auto_61008 - BLOCK
      ?auto_61009 - BLOCK
      ?auto_61010 - BLOCK
    )
    :vars
    (
      ?auto_61011 - BLOCK
      ?auto_61012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61006 ?auto_61007 ) ) ( not ( = ?auto_61006 ?auto_61008 ) ) ( not ( = ?auto_61006 ?auto_61009 ) ) ( not ( = ?auto_61006 ?auto_61010 ) ) ( not ( = ?auto_61007 ?auto_61008 ) ) ( not ( = ?auto_61007 ?auto_61009 ) ) ( not ( = ?auto_61007 ?auto_61010 ) ) ( not ( = ?auto_61008 ?auto_61009 ) ) ( not ( = ?auto_61008 ?auto_61010 ) ) ( not ( = ?auto_61009 ?auto_61010 ) ) ( not ( = ?auto_61006 ?auto_61011 ) ) ( not ( = ?auto_61007 ?auto_61011 ) ) ( not ( = ?auto_61008 ?auto_61011 ) ) ( not ( = ?auto_61009 ?auto_61011 ) ) ( not ( = ?auto_61010 ?auto_61011 ) ) ( ON-TABLE ?auto_61011 ) ( ON ?auto_61006 ?auto_61012 ) ( not ( = ?auto_61006 ?auto_61012 ) ) ( not ( = ?auto_61007 ?auto_61012 ) ) ( not ( = ?auto_61008 ?auto_61012 ) ) ( not ( = ?auto_61009 ?auto_61012 ) ) ( not ( = ?auto_61010 ?auto_61012 ) ) ( not ( = ?auto_61011 ?auto_61012 ) ) ( ON ?auto_61007 ?auto_61006 ) ( ON-TABLE ?auto_61012 ) ( ON ?auto_61008 ?auto_61007 ) ( ON ?auto_61009 ?auto_61008 ) ( CLEAR ?auto_61011 ) ( ON ?auto_61010 ?auto_61009 ) ( CLEAR ?auto_61010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61012 ?auto_61006 ?auto_61007 ?auto_61008 ?auto_61009 )
      ( MAKE-5PILE ?auto_61006 ?auto_61007 ?auto_61008 ?auto_61009 ?auto_61010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61013 - BLOCK
      ?auto_61014 - BLOCK
      ?auto_61015 - BLOCK
      ?auto_61016 - BLOCK
      ?auto_61017 - BLOCK
    )
    :vars
    (
      ?auto_61018 - BLOCK
      ?auto_61019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61013 ?auto_61014 ) ) ( not ( = ?auto_61013 ?auto_61015 ) ) ( not ( = ?auto_61013 ?auto_61016 ) ) ( not ( = ?auto_61013 ?auto_61017 ) ) ( not ( = ?auto_61014 ?auto_61015 ) ) ( not ( = ?auto_61014 ?auto_61016 ) ) ( not ( = ?auto_61014 ?auto_61017 ) ) ( not ( = ?auto_61015 ?auto_61016 ) ) ( not ( = ?auto_61015 ?auto_61017 ) ) ( not ( = ?auto_61016 ?auto_61017 ) ) ( not ( = ?auto_61013 ?auto_61018 ) ) ( not ( = ?auto_61014 ?auto_61018 ) ) ( not ( = ?auto_61015 ?auto_61018 ) ) ( not ( = ?auto_61016 ?auto_61018 ) ) ( not ( = ?auto_61017 ?auto_61018 ) ) ( ON ?auto_61013 ?auto_61019 ) ( not ( = ?auto_61013 ?auto_61019 ) ) ( not ( = ?auto_61014 ?auto_61019 ) ) ( not ( = ?auto_61015 ?auto_61019 ) ) ( not ( = ?auto_61016 ?auto_61019 ) ) ( not ( = ?auto_61017 ?auto_61019 ) ) ( not ( = ?auto_61018 ?auto_61019 ) ) ( ON ?auto_61014 ?auto_61013 ) ( ON-TABLE ?auto_61019 ) ( ON ?auto_61015 ?auto_61014 ) ( ON ?auto_61016 ?auto_61015 ) ( ON ?auto_61017 ?auto_61016 ) ( CLEAR ?auto_61017 ) ( HOLDING ?auto_61018 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61018 )
      ( MAKE-5PILE ?auto_61013 ?auto_61014 ?auto_61015 ?auto_61016 ?auto_61017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61020 - BLOCK
      ?auto_61021 - BLOCK
      ?auto_61022 - BLOCK
      ?auto_61023 - BLOCK
      ?auto_61024 - BLOCK
    )
    :vars
    (
      ?auto_61026 - BLOCK
      ?auto_61025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61020 ?auto_61021 ) ) ( not ( = ?auto_61020 ?auto_61022 ) ) ( not ( = ?auto_61020 ?auto_61023 ) ) ( not ( = ?auto_61020 ?auto_61024 ) ) ( not ( = ?auto_61021 ?auto_61022 ) ) ( not ( = ?auto_61021 ?auto_61023 ) ) ( not ( = ?auto_61021 ?auto_61024 ) ) ( not ( = ?auto_61022 ?auto_61023 ) ) ( not ( = ?auto_61022 ?auto_61024 ) ) ( not ( = ?auto_61023 ?auto_61024 ) ) ( not ( = ?auto_61020 ?auto_61026 ) ) ( not ( = ?auto_61021 ?auto_61026 ) ) ( not ( = ?auto_61022 ?auto_61026 ) ) ( not ( = ?auto_61023 ?auto_61026 ) ) ( not ( = ?auto_61024 ?auto_61026 ) ) ( ON ?auto_61020 ?auto_61025 ) ( not ( = ?auto_61020 ?auto_61025 ) ) ( not ( = ?auto_61021 ?auto_61025 ) ) ( not ( = ?auto_61022 ?auto_61025 ) ) ( not ( = ?auto_61023 ?auto_61025 ) ) ( not ( = ?auto_61024 ?auto_61025 ) ) ( not ( = ?auto_61026 ?auto_61025 ) ) ( ON ?auto_61021 ?auto_61020 ) ( ON-TABLE ?auto_61025 ) ( ON ?auto_61022 ?auto_61021 ) ( ON ?auto_61023 ?auto_61022 ) ( ON ?auto_61024 ?auto_61023 ) ( ON ?auto_61026 ?auto_61024 ) ( CLEAR ?auto_61026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61025 ?auto_61020 ?auto_61021 ?auto_61022 ?auto_61023 ?auto_61024 )
      ( MAKE-5PILE ?auto_61020 ?auto_61021 ?auto_61022 ?auto_61023 ?auto_61024 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61033 - BLOCK
      ?auto_61034 - BLOCK
      ?auto_61035 - BLOCK
      ?auto_61036 - BLOCK
      ?auto_61037 - BLOCK
      ?auto_61038 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61038 ) ( CLEAR ?auto_61037 ) ( ON-TABLE ?auto_61033 ) ( ON ?auto_61034 ?auto_61033 ) ( ON ?auto_61035 ?auto_61034 ) ( ON ?auto_61036 ?auto_61035 ) ( ON ?auto_61037 ?auto_61036 ) ( not ( = ?auto_61033 ?auto_61034 ) ) ( not ( = ?auto_61033 ?auto_61035 ) ) ( not ( = ?auto_61033 ?auto_61036 ) ) ( not ( = ?auto_61033 ?auto_61037 ) ) ( not ( = ?auto_61033 ?auto_61038 ) ) ( not ( = ?auto_61034 ?auto_61035 ) ) ( not ( = ?auto_61034 ?auto_61036 ) ) ( not ( = ?auto_61034 ?auto_61037 ) ) ( not ( = ?auto_61034 ?auto_61038 ) ) ( not ( = ?auto_61035 ?auto_61036 ) ) ( not ( = ?auto_61035 ?auto_61037 ) ) ( not ( = ?auto_61035 ?auto_61038 ) ) ( not ( = ?auto_61036 ?auto_61037 ) ) ( not ( = ?auto_61036 ?auto_61038 ) ) ( not ( = ?auto_61037 ?auto_61038 ) ) )
    :subtasks
    ( ( !STACK ?auto_61038 ?auto_61037 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61039 - BLOCK
      ?auto_61040 - BLOCK
      ?auto_61041 - BLOCK
      ?auto_61042 - BLOCK
      ?auto_61043 - BLOCK
      ?auto_61044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61043 ) ( ON-TABLE ?auto_61039 ) ( ON ?auto_61040 ?auto_61039 ) ( ON ?auto_61041 ?auto_61040 ) ( ON ?auto_61042 ?auto_61041 ) ( ON ?auto_61043 ?auto_61042 ) ( not ( = ?auto_61039 ?auto_61040 ) ) ( not ( = ?auto_61039 ?auto_61041 ) ) ( not ( = ?auto_61039 ?auto_61042 ) ) ( not ( = ?auto_61039 ?auto_61043 ) ) ( not ( = ?auto_61039 ?auto_61044 ) ) ( not ( = ?auto_61040 ?auto_61041 ) ) ( not ( = ?auto_61040 ?auto_61042 ) ) ( not ( = ?auto_61040 ?auto_61043 ) ) ( not ( = ?auto_61040 ?auto_61044 ) ) ( not ( = ?auto_61041 ?auto_61042 ) ) ( not ( = ?auto_61041 ?auto_61043 ) ) ( not ( = ?auto_61041 ?auto_61044 ) ) ( not ( = ?auto_61042 ?auto_61043 ) ) ( not ( = ?auto_61042 ?auto_61044 ) ) ( not ( = ?auto_61043 ?auto_61044 ) ) ( ON-TABLE ?auto_61044 ) ( CLEAR ?auto_61044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_61044 )
      ( MAKE-6PILE ?auto_61039 ?auto_61040 ?auto_61041 ?auto_61042 ?auto_61043 ?auto_61044 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61045 - BLOCK
      ?auto_61046 - BLOCK
      ?auto_61047 - BLOCK
      ?auto_61048 - BLOCK
      ?auto_61049 - BLOCK
      ?auto_61050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61045 ) ( ON ?auto_61046 ?auto_61045 ) ( ON ?auto_61047 ?auto_61046 ) ( ON ?auto_61048 ?auto_61047 ) ( not ( = ?auto_61045 ?auto_61046 ) ) ( not ( = ?auto_61045 ?auto_61047 ) ) ( not ( = ?auto_61045 ?auto_61048 ) ) ( not ( = ?auto_61045 ?auto_61049 ) ) ( not ( = ?auto_61045 ?auto_61050 ) ) ( not ( = ?auto_61046 ?auto_61047 ) ) ( not ( = ?auto_61046 ?auto_61048 ) ) ( not ( = ?auto_61046 ?auto_61049 ) ) ( not ( = ?auto_61046 ?auto_61050 ) ) ( not ( = ?auto_61047 ?auto_61048 ) ) ( not ( = ?auto_61047 ?auto_61049 ) ) ( not ( = ?auto_61047 ?auto_61050 ) ) ( not ( = ?auto_61048 ?auto_61049 ) ) ( not ( = ?auto_61048 ?auto_61050 ) ) ( not ( = ?auto_61049 ?auto_61050 ) ) ( ON-TABLE ?auto_61050 ) ( CLEAR ?auto_61050 ) ( HOLDING ?auto_61049 ) ( CLEAR ?auto_61048 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61045 ?auto_61046 ?auto_61047 ?auto_61048 ?auto_61049 )
      ( MAKE-6PILE ?auto_61045 ?auto_61046 ?auto_61047 ?auto_61048 ?auto_61049 ?auto_61050 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61051 - BLOCK
      ?auto_61052 - BLOCK
      ?auto_61053 - BLOCK
      ?auto_61054 - BLOCK
      ?auto_61055 - BLOCK
      ?auto_61056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61051 ) ( ON ?auto_61052 ?auto_61051 ) ( ON ?auto_61053 ?auto_61052 ) ( ON ?auto_61054 ?auto_61053 ) ( not ( = ?auto_61051 ?auto_61052 ) ) ( not ( = ?auto_61051 ?auto_61053 ) ) ( not ( = ?auto_61051 ?auto_61054 ) ) ( not ( = ?auto_61051 ?auto_61055 ) ) ( not ( = ?auto_61051 ?auto_61056 ) ) ( not ( = ?auto_61052 ?auto_61053 ) ) ( not ( = ?auto_61052 ?auto_61054 ) ) ( not ( = ?auto_61052 ?auto_61055 ) ) ( not ( = ?auto_61052 ?auto_61056 ) ) ( not ( = ?auto_61053 ?auto_61054 ) ) ( not ( = ?auto_61053 ?auto_61055 ) ) ( not ( = ?auto_61053 ?auto_61056 ) ) ( not ( = ?auto_61054 ?auto_61055 ) ) ( not ( = ?auto_61054 ?auto_61056 ) ) ( not ( = ?auto_61055 ?auto_61056 ) ) ( ON-TABLE ?auto_61056 ) ( CLEAR ?auto_61054 ) ( ON ?auto_61055 ?auto_61056 ) ( CLEAR ?auto_61055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61056 )
      ( MAKE-6PILE ?auto_61051 ?auto_61052 ?auto_61053 ?auto_61054 ?auto_61055 ?auto_61056 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61057 - BLOCK
      ?auto_61058 - BLOCK
      ?auto_61059 - BLOCK
      ?auto_61060 - BLOCK
      ?auto_61061 - BLOCK
      ?auto_61062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61057 ) ( ON ?auto_61058 ?auto_61057 ) ( ON ?auto_61059 ?auto_61058 ) ( not ( = ?auto_61057 ?auto_61058 ) ) ( not ( = ?auto_61057 ?auto_61059 ) ) ( not ( = ?auto_61057 ?auto_61060 ) ) ( not ( = ?auto_61057 ?auto_61061 ) ) ( not ( = ?auto_61057 ?auto_61062 ) ) ( not ( = ?auto_61058 ?auto_61059 ) ) ( not ( = ?auto_61058 ?auto_61060 ) ) ( not ( = ?auto_61058 ?auto_61061 ) ) ( not ( = ?auto_61058 ?auto_61062 ) ) ( not ( = ?auto_61059 ?auto_61060 ) ) ( not ( = ?auto_61059 ?auto_61061 ) ) ( not ( = ?auto_61059 ?auto_61062 ) ) ( not ( = ?auto_61060 ?auto_61061 ) ) ( not ( = ?auto_61060 ?auto_61062 ) ) ( not ( = ?auto_61061 ?auto_61062 ) ) ( ON-TABLE ?auto_61062 ) ( ON ?auto_61061 ?auto_61062 ) ( CLEAR ?auto_61061 ) ( HOLDING ?auto_61060 ) ( CLEAR ?auto_61059 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61057 ?auto_61058 ?auto_61059 ?auto_61060 )
      ( MAKE-6PILE ?auto_61057 ?auto_61058 ?auto_61059 ?auto_61060 ?auto_61061 ?auto_61062 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61063 - BLOCK
      ?auto_61064 - BLOCK
      ?auto_61065 - BLOCK
      ?auto_61066 - BLOCK
      ?auto_61067 - BLOCK
      ?auto_61068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61063 ) ( ON ?auto_61064 ?auto_61063 ) ( ON ?auto_61065 ?auto_61064 ) ( not ( = ?auto_61063 ?auto_61064 ) ) ( not ( = ?auto_61063 ?auto_61065 ) ) ( not ( = ?auto_61063 ?auto_61066 ) ) ( not ( = ?auto_61063 ?auto_61067 ) ) ( not ( = ?auto_61063 ?auto_61068 ) ) ( not ( = ?auto_61064 ?auto_61065 ) ) ( not ( = ?auto_61064 ?auto_61066 ) ) ( not ( = ?auto_61064 ?auto_61067 ) ) ( not ( = ?auto_61064 ?auto_61068 ) ) ( not ( = ?auto_61065 ?auto_61066 ) ) ( not ( = ?auto_61065 ?auto_61067 ) ) ( not ( = ?auto_61065 ?auto_61068 ) ) ( not ( = ?auto_61066 ?auto_61067 ) ) ( not ( = ?auto_61066 ?auto_61068 ) ) ( not ( = ?auto_61067 ?auto_61068 ) ) ( ON-TABLE ?auto_61068 ) ( ON ?auto_61067 ?auto_61068 ) ( CLEAR ?auto_61065 ) ( ON ?auto_61066 ?auto_61067 ) ( CLEAR ?auto_61066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61068 ?auto_61067 )
      ( MAKE-6PILE ?auto_61063 ?auto_61064 ?auto_61065 ?auto_61066 ?auto_61067 ?auto_61068 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61069 - BLOCK
      ?auto_61070 - BLOCK
      ?auto_61071 - BLOCK
      ?auto_61072 - BLOCK
      ?auto_61073 - BLOCK
      ?auto_61074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61069 ) ( ON ?auto_61070 ?auto_61069 ) ( not ( = ?auto_61069 ?auto_61070 ) ) ( not ( = ?auto_61069 ?auto_61071 ) ) ( not ( = ?auto_61069 ?auto_61072 ) ) ( not ( = ?auto_61069 ?auto_61073 ) ) ( not ( = ?auto_61069 ?auto_61074 ) ) ( not ( = ?auto_61070 ?auto_61071 ) ) ( not ( = ?auto_61070 ?auto_61072 ) ) ( not ( = ?auto_61070 ?auto_61073 ) ) ( not ( = ?auto_61070 ?auto_61074 ) ) ( not ( = ?auto_61071 ?auto_61072 ) ) ( not ( = ?auto_61071 ?auto_61073 ) ) ( not ( = ?auto_61071 ?auto_61074 ) ) ( not ( = ?auto_61072 ?auto_61073 ) ) ( not ( = ?auto_61072 ?auto_61074 ) ) ( not ( = ?auto_61073 ?auto_61074 ) ) ( ON-TABLE ?auto_61074 ) ( ON ?auto_61073 ?auto_61074 ) ( ON ?auto_61072 ?auto_61073 ) ( CLEAR ?auto_61072 ) ( HOLDING ?auto_61071 ) ( CLEAR ?auto_61070 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61069 ?auto_61070 ?auto_61071 )
      ( MAKE-6PILE ?auto_61069 ?auto_61070 ?auto_61071 ?auto_61072 ?auto_61073 ?auto_61074 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61075 - BLOCK
      ?auto_61076 - BLOCK
      ?auto_61077 - BLOCK
      ?auto_61078 - BLOCK
      ?auto_61079 - BLOCK
      ?auto_61080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61075 ) ( ON ?auto_61076 ?auto_61075 ) ( not ( = ?auto_61075 ?auto_61076 ) ) ( not ( = ?auto_61075 ?auto_61077 ) ) ( not ( = ?auto_61075 ?auto_61078 ) ) ( not ( = ?auto_61075 ?auto_61079 ) ) ( not ( = ?auto_61075 ?auto_61080 ) ) ( not ( = ?auto_61076 ?auto_61077 ) ) ( not ( = ?auto_61076 ?auto_61078 ) ) ( not ( = ?auto_61076 ?auto_61079 ) ) ( not ( = ?auto_61076 ?auto_61080 ) ) ( not ( = ?auto_61077 ?auto_61078 ) ) ( not ( = ?auto_61077 ?auto_61079 ) ) ( not ( = ?auto_61077 ?auto_61080 ) ) ( not ( = ?auto_61078 ?auto_61079 ) ) ( not ( = ?auto_61078 ?auto_61080 ) ) ( not ( = ?auto_61079 ?auto_61080 ) ) ( ON-TABLE ?auto_61080 ) ( ON ?auto_61079 ?auto_61080 ) ( ON ?auto_61078 ?auto_61079 ) ( CLEAR ?auto_61076 ) ( ON ?auto_61077 ?auto_61078 ) ( CLEAR ?auto_61077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61080 ?auto_61079 ?auto_61078 )
      ( MAKE-6PILE ?auto_61075 ?auto_61076 ?auto_61077 ?auto_61078 ?auto_61079 ?auto_61080 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61081 - BLOCK
      ?auto_61082 - BLOCK
      ?auto_61083 - BLOCK
      ?auto_61084 - BLOCK
      ?auto_61085 - BLOCK
      ?auto_61086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61081 ) ( not ( = ?auto_61081 ?auto_61082 ) ) ( not ( = ?auto_61081 ?auto_61083 ) ) ( not ( = ?auto_61081 ?auto_61084 ) ) ( not ( = ?auto_61081 ?auto_61085 ) ) ( not ( = ?auto_61081 ?auto_61086 ) ) ( not ( = ?auto_61082 ?auto_61083 ) ) ( not ( = ?auto_61082 ?auto_61084 ) ) ( not ( = ?auto_61082 ?auto_61085 ) ) ( not ( = ?auto_61082 ?auto_61086 ) ) ( not ( = ?auto_61083 ?auto_61084 ) ) ( not ( = ?auto_61083 ?auto_61085 ) ) ( not ( = ?auto_61083 ?auto_61086 ) ) ( not ( = ?auto_61084 ?auto_61085 ) ) ( not ( = ?auto_61084 ?auto_61086 ) ) ( not ( = ?auto_61085 ?auto_61086 ) ) ( ON-TABLE ?auto_61086 ) ( ON ?auto_61085 ?auto_61086 ) ( ON ?auto_61084 ?auto_61085 ) ( ON ?auto_61083 ?auto_61084 ) ( CLEAR ?auto_61083 ) ( HOLDING ?auto_61082 ) ( CLEAR ?auto_61081 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61081 ?auto_61082 )
      ( MAKE-6PILE ?auto_61081 ?auto_61082 ?auto_61083 ?auto_61084 ?auto_61085 ?auto_61086 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61087 - BLOCK
      ?auto_61088 - BLOCK
      ?auto_61089 - BLOCK
      ?auto_61090 - BLOCK
      ?auto_61091 - BLOCK
      ?auto_61092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61087 ) ( not ( = ?auto_61087 ?auto_61088 ) ) ( not ( = ?auto_61087 ?auto_61089 ) ) ( not ( = ?auto_61087 ?auto_61090 ) ) ( not ( = ?auto_61087 ?auto_61091 ) ) ( not ( = ?auto_61087 ?auto_61092 ) ) ( not ( = ?auto_61088 ?auto_61089 ) ) ( not ( = ?auto_61088 ?auto_61090 ) ) ( not ( = ?auto_61088 ?auto_61091 ) ) ( not ( = ?auto_61088 ?auto_61092 ) ) ( not ( = ?auto_61089 ?auto_61090 ) ) ( not ( = ?auto_61089 ?auto_61091 ) ) ( not ( = ?auto_61089 ?auto_61092 ) ) ( not ( = ?auto_61090 ?auto_61091 ) ) ( not ( = ?auto_61090 ?auto_61092 ) ) ( not ( = ?auto_61091 ?auto_61092 ) ) ( ON-TABLE ?auto_61092 ) ( ON ?auto_61091 ?auto_61092 ) ( ON ?auto_61090 ?auto_61091 ) ( ON ?auto_61089 ?auto_61090 ) ( CLEAR ?auto_61087 ) ( ON ?auto_61088 ?auto_61089 ) ( CLEAR ?auto_61088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61092 ?auto_61091 ?auto_61090 ?auto_61089 )
      ( MAKE-6PILE ?auto_61087 ?auto_61088 ?auto_61089 ?auto_61090 ?auto_61091 ?auto_61092 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61093 - BLOCK
      ?auto_61094 - BLOCK
      ?auto_61095 - BLOCK
      ?auto_61096 - BLOCK
      ?auto_61097 - BLOCK
      ?auto_61098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61093 ?auto_61094 ) ) ( not ( = ?auto_61093 ?auto_61095 ) ) ( not ( = ?auto_61093 ?auto_61096 ) ) ( not ( = ?auto_61093 ?auto_61097 ) ) ( not ( = ?auto_61093 ?auto_61098 ) ) ( not ( = ?auto_61094 ?auto_61095 ) ) ( not ( = ?auto_61094 ?auto_61096 ) ) ( not ( = ?auto_61094 ?auto_61097 ) ) ( not ( = ?auto_61094 ?auto_61098 ) ) ( not ( = ?auto_61095 ?auto_61096 ) ) ( not ( = ?auto_61095 ?auto_61097 ) ) ( not ( = ?auto_61095 ?auto_61098 ) ) ( not ( = ?auto_61096 ?auto_61097 ) ) ( not ( = ?auto_61096 ?auto_61098 ) ) ( not ( = ?auto_61097 ?auto_61098 ) ) ( ON-TABLE ?auto_61098 ) ( ON ?auto_61097 ?auto_61098 ) ( ON ?auto_61096 ?auto_61097 ) ( ON ?auto_61095 ?auto_61096 ) ( ON ?auto_61094 ?auto_61095 ) ( CLEAR ?auto_61094 ) ( HOLDING ?auto_61093 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61093 )
      ( MAKE-6PILE ?auto_61093 ?auto_61094 ?auto_61095 ?auto_61096 ?auto_61097 ?auto_61098 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61099 - BLOCK
      ?auto_61100 - BLOCK
      ?auto_61101 - BLOCK
      ?auto_61102 - BLOCK
      ?auto_61103 - BLOCK
      ?auto_61104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61099 ?auto_61100 ) ) ( not ( = ?auto_61099 ?auto_61101 ) ) ( not ( = ?auto_61099 ?auto_61102 ) ) ( not ( = ?auto_61099 ?auto_61103 ) ) ( not ( = ?auto_61099 ?auto_61104 ) ) ( not ( = ?auto_61100 ?auto_61101 ) ) ( not ( = ?auto_61100 ?auto_61102 ) ) ( not ( = ?auto_61100 ?auto_61103 ) ) ( not ( = ?auto_61100 ?auto_61104 ) ) ( not ( = ?auto_61101 ?auto_61102 ) ) ( not ( = ?auto_61101 ?auto_61103 ) ) ( not ( = ?auto_61101 ?auto_61104 ) ) ( not ( = ?auto_61102 ?auto_61103 ) ) ( not ( = ?auto_61102 ?auto_61104 ) ) ( not ( = ?auto_61103 ?auto_61104 ) ) ( ON-TABLE ?auto_61104 ) ( ON ?auto_61103 ?auto_61104 ) ( ON ?auto_61102 ?auto_61103 ) ( ON ?auto_61101 ?auto_61102 ) ( ON ?auto_61100 ?auto_61101 ) ( ON ?auto_61099 ?auto_61100 ) ( CLEAR ?auto_61099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61104 ?auto_61103 ?auto_61102 ?auto_61101 ?auto_61100 )
      ( MAKE-6PILE ?auto_61099 ?auto_61100 ?auto_61101 ?auto_61102 ?auto_61103 ?auto_61104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61105 - BLOCK
      ?auto_61106 - BLOCK
      ?auto_61107 - BLOCK
      ?auto_61108 - BLOCK
      ?auto_61109 - BLOCK
      ?auto_61110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61105 ?auto_61106 ) ) ( not ( = ?auto_61105 ?auto_61107 ) ) ( not ( = ?auto_61105 ?auto_61108 ) ) ( not ( = ?auto_61105 ?auto_61109 ) ) ( not ( = ?auto_61105 ?auto_61110 ) ) ( not ( = ?auto_61106 ?auto_61107 ) ) ( not ( = ?auto_61106 ?auto_61108 ) ) ( not ( = ?auto_61106 ?auto_61109 ) ) ( not ( = ?auto_61106 ?auto_61110 ) ) ( not ( = ?auto_61107 ?auto_61108 ) ) ( not ( = ?auto_61107 ?auto_61109 ) ) ( not ( = ?auto_61107 ?auto_61110 ) ) ( not ( = ?auto_61108 ?auto_61109 ) ) ( not ( = ?auto_61108 ?auto_61110 ) ) ( not ( = ?auto_61109 ?auto_61110 ) ) ( ON-TABLE ?auto_61110 ) ( ON ?auto_61109 ?auto_61110 ) ( ON ?auto_61108 ?auto_61109 ) ( ON ?auto_61107 ?auto_61108 ) ( ON ?auto_61106 ?auto_61107 ) ( HOLDING ?auto_61105 ) ( CLEAR ?auto_61106 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61110 ?auto_61109 ?auto_61108 ?auto_61107 ?auto_61106 ?auto_61105 )
      ( MAKE-6PILE ?auto_61105 ?auto_61106 ?auto_61107 ?auto_61108 ?auto_61109 ?auto_61110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61111 - BLOCK
      ?auto_61112 - BLOCK
      ?auto_61113 - BLOCK
      ?auto_61114 - BLOCK
      ?auto_61115 - BLOCK
      ?auto_61116 - BLOCK
    )
    :vars
    (
      ?auto_61117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61111 ?auto_61112 ) ) ( not ( = ?auto_61111 ?auto_61113 ) ) ( not ( = ?auto_61111 ?auto_61114 ) ) ( not ( = ?auto_61111 ?auto_61115 ) ) ( not ( = ?auto_61111 ?auto_61116 ) ) ( not ( = ?auto_61112 ?auto_61113 ) ) ( not ( = ?auto_61112 ?auto_61114 ) ) ( not ( = ?auto_61112 ?auto_61115 ) ) ( not ( = ?auto_61112 ?auto_61116 ) ) ( not ( = ?auto_61113 ?auto_61114 ) ) ( not ( = ?auto_61113 ?auto_61115 ) ) ( not ( = ?auto_61113 ?auto_61116 ) ) ( not ( = ?auto_61114 ?auto_61115 ) ) ( not ( = ?auto_61114 ?auto_61116 ) ) ( not ( = ?auto_61115 ?auto_61116 ) ) ( ON-TABLE ?auto_61116 ) ( ON ?auto_61115 ?auto_61116 ) ( ON ?auto_61114 ?auto_61115 ) ( ON ?auto_61113 ?auto_61114 ) ( ON ?auto_61112 ?auto_61113 ) ( CLEAR ?auto_61112 ) ( ON ?auto_61111 ?auto_61117 ) ( CLEAR ?auto_61111 ) ( HAND-EMPTY ) ( not ( = ?auto_61111 ?auto_61117 ) ) ( not ( = ?auto_61112 ?auto_61117 ) ) ( not ( = ?auto_61113 ?auto_61117 ) ) ( not ( = ?auto_61114 ?auto_61117 ) ) ( not ( = ?auto_61115 ?auto_61117 ) ) ( not ( = ?auto_61116 ?auto_61117 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61111 ?auto_61117 )
      ( MAKE-6PILE ?auto_61111 ?auto_61112 ?auto_61113 ?auto_61114 ?auto_61115 ?auto_61116 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61118 - BLOCK
      ?auto_61119 - BLOCK
      ?auto_61120 - BLOCK
      ?auto_61121 - BLOCK
      ?auto_61122 - BLOCK
      ?auto_61123 - BLOCK
    )
    :vars
    (
      ?auto_61124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61118 ?auto_61119 ) ) ( not ( = ?auto_61118 ?auto_61120 ) ) ( not ( = ?auto_61118 ?auto_61121 ) ) ( not ( = ?auto_61118 ?auto_61122 ) ) ( not ( = ?auto_61118 ?auto_61123 ) ) ( not ( = ?auto_61119 ?auto_61120 ) ) ( not ( = ?auto_61119 ?auto_61121 ) ) ( not ( = ?auto_61119 ?auto_61122 ) ) ( not ( = ?auto_61119 ?auto_61123 ) ) ( not ( = ?auto_61120 ?auto_61121 ) ) ( not ( = ?auto_61120 ?auto_61122 ) ) ( not ( = ?auto_61120 ?auto_61123 ) ) ( not ( = ?auto_61121 ?auto_61122 ) ) ( not ( = ?auto_61121 ?auto_61123 ) ) ( not ( = ?auto_61122 ?auto_61123 ) ) ( ON-TABLE ?auto_61123 ) ( ON ?auto_61122 ?auto_61123 ) ( ON ?auto_61121 ?auto_61122 ) ( ON ?auto_61120 ?auto_61121 ) ( ON ?auto_61118 ?auto_61124 ) ( CLEAR ?auto_61118 ) ( not ( = ?auto_61118 ?auto_61124 ) ) ( not ( = ?auto_61119 ?auto_61124 ) ) ( not ( = ?auto_61120 ?auto_61124 ) ) ( not ( = ?auto_61121 ?auto_61124 ) ) ( not ( = ?auto_61122 ?auto_61124 ) ) ( not ( = ?auto_61123 ?auto_61124 ) ) ( HOLDING ?auto_61119 ) ( CLEAR ?auto_61120 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61123 ?auto_61122 ?auto_61121 ?auto_61120 ?auto_61119 )
      ( MAKE-6PILE ?auto_61118 ?auto_61119 ?auto_61120 ?auto_61121 ?auto_61122 ?auto_61123 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61125 - BLOCK
      ?auto_61126 - BLOCK
      ?auto_61127 - BLOCK
      ?auto_61128 - BLOCK
      ?auto_61129 - BLOCK
      ?auto_61130 - BLOCK
    )
    :vars
    (
      ?auto_61131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61125 ?auto_61126 ) ) ( not ( = ?auto_61125 ?auto_61127 ) ) ( not ( = ?auto_61125 ?auto_61128 ) ) ( not ( = ?auto_61125 ?auto_61129 ) ) ( not ( = ?auto_61125 ?auto_61130 ) ) ( not ( = ?auto_61126 ?auto_61127 ) ) ( not ( = ?auto_61126 ?auto_61128 ) ) ( not ( = ?auto_61126 ?auto_61129 ) ) ( not ( = ?auto_61126 ?auto_61130 ) ) ( not ( = ?auto_61127 ?auto_61128 ) ) ( not ( = ?auto_61127 ?auto_61129 ) ) ( not ( = ?auto_61127 ?auto_61130 ) ) ( not ( = ?auto_61128 ?auto_61129 ) ) ( not ( = ?auto_61128 ?auto_61130 ) ) ( not ( = ?auto_61129 ?auto_61130 ) ) ( ON-TABLE ?auto_61130 ) ( ON ?auto_61129 ?auto_61130 ) ( ON ?auto_61128 ?auto_61129 ) ( ON ?auto_61127 ?auto_61128 ) ( ON ?auto_61125 ?auto_61131 ) ( not ( = ?auto_61125 ?auto_61131 ) ) ( not ( = ?auto_61126 ?auto_61131 ) ) ( not ( = ?auto_61127 ?auto_61131 ) ) ( not ( = ?auto_61128 ?auto_61131 ) ) ( not ( = ?auto_61129 ?auto_61131 ) ) ( not ( = ?auto_61130 ?auto_61131 ) ) ( CLEAR ?auto_61127 ) ( ON ?auto_61126 ?auto_61125 ) ( CLEAR ?auto_61126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61131 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61131 ?auto_61125 )
      ( MAKE-6PILE ?auto_61125 ?auto_61126 ?auto_61127 ?auto_61128 ?auto_61129 ?auto_61130 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61132 - BLOCK
      ?auto_61133 - BLOCK
      ?auto_61134 - BLOCK
      ?auto_61135 - BLOCK
      ?auto_61136 - BLOCK
      ?auto_61137 - BLOCK
    )
    :vars
    (
      ?auto_61138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61132 ?auto_61133 ) ) ( not ( = ?auto_61132 ?auto_61134 ) ) ( not ( = ?auto_61132 ?auto_61135 ) ) ( not ( = ?auto_61132 ?auto_61136 ) ) ( not ( = ?auto_61132 ?auto_61137 ) ) ( not ( = ?auto_61133 ?auto_61134 ) ) ( not ( = ?auto_61133 ?auto_61135 ) ) ( not ( = ?auto_61133 ?auto_61136 ) ) ( not ( = ?auto_61133 ?auto_61137 ) ) ( not ( = ?auto_61134 ?auto_61135 ) ) ( not ( = ?auto_61134 ?auto_61136 ) ) ( not ( = ?auto_61134 ?auto_61137 ) ) ( not ( = ?auto_61135 ?auto_61136 ) ) ( not ( = ?auto_61135 ?auto_61137 ) ) ( not ( = ?auto_61136 ?auto_61137 ) ) ( ON-TABLE ?auto_61137 ) ( ON ?auto_61136 ?auto_61137 ) ( ON ?auto_61135 ?auto_61136 ) ( ON ?auto_61132 ?auto_61138 ) ( not ( = ?auto_61132 ?auto_61138 ) ) ( not ( = ?auto_61133 ?auto_61138 ) ) ( not ( = ?auto_61134 ?auto_61138 ) ) ( not ( = ?auto_61135 ?auto_61138 ) ) ( not ( = ?auto_61136 ?auto_61138 ) ) ( not ( = ?auto_61137 ?auto_61138 ) ) ( ON ?auto_61133 ?auto_61132 ) ( CLEAR ?auto_61133 ) ( ON-TABLE ?auto_61138 ) ( HOLDING ?auto_61134 ) ( CLEAR ?auto_61135 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61137 ?auto_61136 ?auto_61135 ?auto_61134 )
      ( MAKE-6PILE ?auto_61132 ?auto_61133 ?auto_61134 ?auto_61135 ?auto_61136 ?auto_61137 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61139 - BLOCK
      ?auto_61140 - BLOCK
      ?auto_61141 - BLOCK
      ?auto_61142 - BLOCK
      ?auto_61143 - BLOCK
      ?auto_61144 - BLOCK
    )
    :vars
    (
      ?auto_61145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61139 ?auto_61140 ) ) ( not ( = ?auto_61139 ?auto_61141 ) ) ( not ( = ?auto_61139 ?auto_61142 ) ) ( not ( = ?auto_61139 ?auto_61143 ) ) ( not ( = ?auto_61139 ?auto_61144 ) ) ( not ( = ?auto_61140 ?auto_61141 ) ) ( not ( = ?auto_61140 ?auto_61142 ) ) ( not ( = ?auto_61140 ?auto_61143 ) ) ( not ( = ?auto_61140 ?auto_61144 ) ) ( not ( = ?auto_61141 ?auto_61142 ) ) ( not ( = ?auto_61141 ?auto_61143 ) ) ( not ( = ?auto_61141 ?auto_61144 ) ) ( not ( = ?auto_61142 ?auto_61143 ) ) ( not ( = ?auto_61142 ?auto_61144 ) ) ( not ( = ?auto_61143 ?auto_61144 ) ) ( ON-TABLE ?auto_61144 ) ( ON ?auto_61143 ?auto_61144 ) ( ON ?auto_61142 ?auto_61143 ) ( ON ?auto_61139 ?auto_61145 ) ( not ( = ?auto_61139 ?auto_61145 ) ) ( not ( = ?auto_61140 ?auto_61145 ) ) ( not ( = ?auto_61141 ?auto_61145 ) ) ( not ( = ?auto_61142 ?auto_61145 ) ) ( not ( = ?auto_61143 ?auto_61145 ) ) ( not ( = ?auto_61144 ?auto_61145 ) ) ( ON ?auto_61140 ?auto_61139 ) ( ON-TABLE ?auto_61145 ) ( CLEAR ?auto_61142 ) ( ON ?auto_61141 ?auto_61140 ) ( CLEAR ?auto_61141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61145 ?auto_61139 ?auto_61140 )
      ( MAKE-6PILE ?auto_61139 ?auto_61140 ?auto_61141 ?auto_61142 ?auto_61143 ?auto_61144 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61146 - BLOCK
      ?auto_61147 - BLOCK
      ?auto_61148 - BLOCK
      ?auto_61149 - BLOCK
      ?auto_61150 - BLOCK
      ?auto_61151 - BLOCK
    )
    :vars
    (
      ?auto_61152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61146 ?auto_61147 ) ) ( not ( = ?auto_61146 ?auto_61148 ) ) ( not ( = ?auto_61146 ?auto_61149 ) ) ( not ( = ?auto_61146 ?auto_61150 ) ) ( not ( = ?auto_61146 ?auto_61151 ) ) ( not ( = ?auto_61147 ?auto_61148 ) ) ( not ( = ?auto_61147 ?auto_61149 ) ) ( not ( = ?auto_61147 ?auto_61150 ) ) ( not ( = ?auto_61147 ?auto_61151 ) ) ( not ( = ?auto_61148 ?auto_61149 ) ) ( not ( = ?auto_61148 ?auto_61150 ) ) ( not ( = ?auto_61148 ?auto_61151 ) ) ( not ( = ?auto_61149 ?auto_61150 ) ) ( not ( = ?auto_61149 ?auto_61151 ) ) ( not ( = ?auto_61150 ?auto_61151 ) ) ( ON-TABLE ?auto_61151 ) ( ON ?auto_61150 ?auto_61151 ) ( ON ?auto_61146 ?auto_61152 ) ( not ( = ?auto_61146 ?auto_61152 ) ) ( not ( = ?auto_61147 ?auto_61152 ) ) ( not ( = ?auto_61148 ?auto_61152 ) ) ( not ( = ?auto_61149 ?auto_61152 ) ) ( not ( = ?auto_61150 ?auto_61152 ) ) ( not ( = ?auto_61151 ?auto_61152 ) ) ( ON ?auto_61147 ?auto_61146 ) ( ON-TABLE ?auto_61152 ) ( ON ?auto_61148 ?auto_61147 ) ( CLEAR ?auto_61148 ) ( HOLDING ?auto_61149 ) ( CLEAR ?auto_61150 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61151 ?auto_61150 ?auto_61149 )
      ( MAKE-6PILE ?auto_61146 ?auto_61147 ?auto_61148 ?auto_61149 ?auto_61150 ?auto_61151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61153 - BLOCK
      ?auto_61154 - BLOCK
      ?auto_61155 - BLOCK
      ?auto_61156 - BLOCK
      ?auto_61157 - BLOCK
      ?auto_61158 - BLOCK
    )
    :vars
    (
      ?auto_61159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61153 ?auto_61154 ) ) ( not ( = ?auto_61153 ?auto_61155 ) ) ( not ( = ?auto_61153 ?auto_61156 ) ) ( not ( = ?auto_61153 ?auto_61157 ) ) ( not ( = ?auto_61153 ?auto_61158 ) ) ( not ( = ?auto_61154 ?auto_61155 ) ) ( not ( = ?auto_61154 ?auto_61156 ) ) ( not ( = ?auto_61154 ?auto_61157 ) ) ( not ( = ?auto_61154 ?auto_61158 ) ) ( not ( = ?auto_61155 ?auto_61156 ) ) ( not ( = ?auto_61155 ?auto_61157 ) ) ( not ( = ?auto_61155 ?auto_61158 ) ) ( not ( = ?auto_61156 ?auto_61157 ) ) ( not ( = ?auto_61156 ?auto_61158 ) ) ( not ( = ?auto_61157 ?auto_61158 ) ) ( ON-TABLE ?auto_61158 ) ( ON ?auto_61157 ?auto_61158 ) ( ON ?auto_61153 ?auto_61159 ) ( not ( = ?auto_61153 ?auto_61159 ) ) ( not ( = ?auto_61154 ?auto_61159 ) ) ( not ( = ?auto_61155 ?auto_61159 ) ) ( not ( = ?auto_61156 ?auto_61159 ) ) ( not ( = ?auto_61157 ?auto_61159 ) ) ( not ( = ?auto_61158 ?auto_61159 ) ) ( ON ?auto_61154 ?auto_61153 ) ( ON-TABLE ?auto_61159 ) ( ON ?auto_61155 ?auto_61154 ) ( CLEAR ?auto_61157 ) ( ON ?auto_61156 ?auto_61155 ) ( CLEAR ?auto_61156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61159 ?auto_61153 ?auto_61154 ?auto_61155 )
      ( MAKE-6PILE ?auto_61153 ?auto_61154 ?auto_61155 ?auto_61156 ?auto_61157 ?auto_61158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61160 - BLOCK
      ?auto_61161 - BLOCK
      ?auto_61162 - BLOCK
      ?auto_61163 - BLOCK
      ?auto_61164 - BLOCK
      ?auto_61165 - BLOCK
    )
    :vars
    (
      ?auto_61166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61160 ?auto_61161 ) ) ( not ( = ?auto_61160 ?auto_61162 ) ) ( not ( = ?auto_61160 ?auto_61163 ) ) ( not ( = ?auto_61160 ?auto_61164 ) ) ( not ( = ?auto_61160 ?auto_61165 ) ) ( not ( = ?auto_61161 ?auto_61162 ) ) ( not ( = ?auto_61161 ?auto_61163 ) ) ( not ( = ?auto_61161 ?auto_61164 ) ) ( not ( = ?auto_61161 ?auto_61165 ) ) ( not ( = ?auto_61162 ?auto_61163 ) ) ( not ( = ?auto_61162 ?auto_61164 ) ) ( not ( = ?auto_61162 ?auto_61165 ) ) ( not ( = ?auto_61163 ?auto_61164 ) ) ( not ( = ?auto_61163 ?auto_61165 ) ) ( not ( = ?auto_61164 ?auto_61165 ) ) ( ON-TABLE ?auto_61165 ) ( ON ?auto_61160 ?auto_61166 ) ( not ( = ?auto_61160 ?auto_61166 ) ) ( not ( = ?auto_61161 ?auto_61166 ) ) ( not ( = ?auto_61162 ?auto_61166 ) ) ( not ( = ?auto_61163 ?auto_61166 ) ) ( not ( = ?auto_61164 ?auto_61166 ) ) ( not ( = ?auto_61165 ?auto_61166 ) ) ( ON ?auto_61161 ?auto_61160 ) ( ON-TABLE ?auto_61166 ) ( ON ?auto_61162 ?auto_61161 ) ( ON ?auto_61163 ?auto_61162 ) ( CLEAR ?auto_61163 ) ( HOLDING ?auto_61164 ) ( CLEAR ?auto_61165 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61165 ?auto_61164 )
      ( MAKE-6PILE ?auto_61160 ?auto_61161 ?auto_61162 ?auto_61163 ?auto_61164 ?auto_61165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61167 - BLOCK
      ?auto_61168 - BLOCK
      ?auto_61169 - BLOCK
      ?auto_61170 - BLOCK
      ?auto_61171 - BLOCK
      ?auto_61172 - BLOCK
    )
    :vars
    (
      ?auto_61173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61167 ?auto_61168 ) ) ( not ( = ?auto_61167 ?auto_61169 ) ) ( not ( = ?auto_61167 ?auto_61170 ) ) ( not ( = ?auto_61167 ?auto_61171 ) ) ( not ( = ?auto_61167 ?auto_61172 ) ) ( not ( = ?auto_61168 ?auto_61169 ) ) ( not ( = ?auto_61168 ?auto_61170 ) ) ( not ( = ?auto_61168 ?auto_61171 ) ) ( not ( = ?auto_61168 ?auto_61172 ) ) ( not ( = ?auto_61169 ?auto_61170 ) ) ( not ( = ?auto_61169 ?auto_61171 ) ) ( not ( = ?auto_61169 ?auto_61172 ) ) ( not ( = ?auto_61170 ?auto_61171 ) ) ( not ( = ?auto_61170 ?auto_61172 ) ) ( not ( = ?auto_61171 ?auto_61172 ) ) ( ON-TABLE ?auto_61172 ) ( ON ?auto_61167 ?auto_61173 ) ( not ( = ?auto_61167 ?auto_61173 ) ) ( not ( = ?auto_61168 ?auto_61173 ) ) ( not ( = ?auto_61169 ?auto_61173 ) ) ( not ( = ?auto_61170 ?auto_61173 ) ) ( not ( = ?auto_61171 ?auto_61173 ) ) ( not ( = ?auto_61172 ?auto_61173 ) ) ( ON ?auto_61168 ?auto_61167 ) ( ON-TABLE ?auto_61173 ) ( ON ?auto_61169 ?auto_61168 ) ( ON ?auto_61170 ?auto_61169 ) ( CLEAR ?auto_61172 ) ( ON ?auto_61171 ?auto_61170 ) ( CLEAR ?auto_61171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61173 ?auto_61167 ?auto_61168 ?auto_61169 ?auto_61170 )
      ( MAKE-6PILE ?auto_61167 ?auto_61168 ?auto_61169 ?auto_61170 ?auto_61171 ?auto_61172 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61174 - BLOCK
      ?auto_61175 - BLOCK
      ?auto_61176 - BLOCK
      ?auto_61177 - BLOCK
      ?auto_61178 - BLOCK
      ?auto_61179 - BLOCK
    )
    :vars
    (
      ?auto_61180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61174 ?auto_61175 ) ) ( not ( = ?auto_61174 ?auto_61176 ) ) ( not ( = ?auto_61174 ?auto_61177 ) ) ( not ( = ?auto_61174 ?auto_61178 ) ) ( not ( = ?auto_61174 ?auto_61179 ) ) ( not ( = ?auto_61175 ?auto_61176 ) ) ( not ( = ?auto_61175 ?auto_61177 ) ) ( not ( = ?auto_61175 ?auto_61178 ) ) ( not ( = ?auto_61175 ?auto_61179 ) ) ( not ( = ?auto_61176 ?auto_61177 ) ) ( not ( = ?auto_61176 ?auto_61178 ) ) ( not ( = ?auto_61176 ?auto_61179 ) ) ( not ( = ?auto_61177 ?auto_61178 ) ) ( not ( = ?auto_61177 ?auto_61179 ) ) ( not ( = ?auto_61178 ?auto_61179 ) ) ( ON ?auto_61174 ?auto_61180 ) ( not ( = ?auto_61174 ?auto_61180 ) ) ( not ( = ?auto_61175 ?auto_61180 ) ) ( not ( = ?auto_61176 ?auto_61180 ) ) ( not ( = ?auto_61177 ?auto_61180 ) ) ( not ( = ?auto_61178 ?auto_61180 ) ) ( not ( = ?auto_61179 ?auto_61180 ) ) ( ON ?auto_61175 ?auto_61174 ) ( ON-TABLE ?auto_61180 ) ( ON ?auto_61176 ?auto_61175 ) ( ON ?auto_61177 ?auto_61176 ) ( ON ?auto_61178 ?auto_61177 ) ( CLEAR ?auto_61178 ) ( HOLDING ?auto_61179 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61179 )
      ( MAKE-6PILE ?auto_61174 ?auto_61175 ?auto_61176 ?auto_61177 ?auto_61178 ?auto_61179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61181 - BLOCK
      ?auto_61182 - BLOCK
      ?auto_61183 - BLOCK
      ?auto_61184 - BLOCK
      ?auto_61185 - BLOCK
      ?auto_61186 - BLOCK
    )
    :vars
    (
      ?auto_61187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61181 ?auto_61182 ) ) ( not ( = ?auto_61181 ?auto_61183 ) ) ( not ( = ?auto_61181 ?auto_61184 ) ) ( not ( = ?auto_61181 ?auto_61185 ) ) ( not ( = ?auto_61181 ?auto_61186 ) ) ( not ( = ?auto_61182 ?auto_61183 ) ) ( not ( = ?auto_61182 ?auto_61184 ) ) ( not ( = ?auto_61182 ?auto_61185 ) ) ( not ( = ?auto_61182 ?auto_61186 ) ) ( not ( = ?auto_61183 ?auto_61184 ) ) ( not ( = ?auto_61183 ?auto_61185 ) ) ( not ( = ?auto_61183 ?auto_61186 ) ) ( not ( = ?auto_61184 ?auto_61185 ) ) ( not ( = ?auto_61184 ?auto_61186 ) ) ( not ( = ?auto_61185 ?auto_61186 ) ) ( ON ?auto_61181 ?auto_61187 ) ( not ( = ?auto_61181 ?auto_61187 ) ) ( not ( = ?auto_61182 ?auto_61187 ) ) ( not ( = ?auto_61183 ?auto_61187 ) ) ( not ( = ?auto_61184 ?auto_61187 ) ) ( not ( = ?auto_61185 ?auto_61187 ) ) ( not ( = ?auto_61186 ?auto_61187 ) ) ( ON ?auto_61182 ?auto_61181 ) ( ON-TABLE ?auto_61187 ) ( ON ?auto_61183 ?auto_61182 ) ( ON ?auto_61184 ?auto_61183 ) ( ON ?auto_61185 ?auto_61184 ) ( ON ?auto_61186 ?auto_61185 ) ( CLEAR ?auto_61186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61187 ?auto_61181 ?auto_61182 ?auto_61183 ?auto_61184 ?auto_61185 )
      ( MAKE-6PILE ?auto_61181 ?auto_61182 ?auto_61183 ?auto_61184 ?auto_61185 ?auto_61186 ) )
  )

)

