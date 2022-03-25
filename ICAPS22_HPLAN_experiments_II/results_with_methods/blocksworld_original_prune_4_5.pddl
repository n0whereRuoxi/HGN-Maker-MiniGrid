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
      ?auto_8384 - BLOCK
      ?auto_8385 - BLOCK
      ?auto_8386 - BLOCK
      ?auto_8387 - BLOCK
    )
    :vars
    (
      ?auto_8388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8388 ?auto_8387 ) ( CLEAR ?auto_8388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8384 ) ( ON ?auto_8385 ?auto_8384 ) ( ON ?auto_8386 ?auto_8385 ) ( ON ?auto_8387 ?auto_8386 ) ( not ( = ?auto_8384 ?auto_8385 ) ) ( not ( = ?auto_8384 ?auto_8386 ) ) ( not ( = ?auto_8384 ?auto_8387 ) ) ( not ( = ?auto_8384 ?auto_8388 ) ) ( not ( = ?auto_8385 ?auto_8386 ) ) ( not ( = ?auto_8385 ?auto_8387 ) ) ( not ( = ?auto_8385 ?auto_8388 ) ) ( not ( = ?auto_8386 ?auto_8387 ) ) ( not ( = ?auto_8386 ?auto_8388 ) ) ( not ( = ?auto_8387 ?auto_8388 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8388 ?auto_8387 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8390 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8390 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8390 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8391 - BLOCK
    )
    :vars
    (
      ?auto_8392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8391 ?auto_8392 ) ( CLEAR ?auto_8391 ) ( HAND-EMPTY ) ( not ( = ?auto_8391 ?auto_8392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8391 ?auto_8392 )
      ( MAKE-1PILE ?auto_8391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8396 - BLOCK
      ?auto_8397 - BLOCK
      ?auto_8398 - BLOCK
    )
    :vars
    (
      ?auto_8399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8399 ?auto_8398 ) ( CLEAR ?auto_8399 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8396 ) ( ON ?auto_8397 ?auto_8396 ) ( ON ?auto_8398 ?auto_8397 ) ( not ( = ?auto_8396 ?auto_8397 ) ) ( not ( = ?auto_8396 ?auto_8398 ) ) ( not ( = ?auto_8396 ?auto_8399 ) ) ( not ( = ?auto_8397 ?auto_8398 ) ) ( not ( = ?auto_8397 ?auto_8399 ) ) ( not ( = ?auto_8398 ?auto_8399 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8399 ?auto_8398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8400 - BLOCK
      ?auto_8401 - BLOCK
      ?auto_8402 - BLOCK
    )
    :vars
    (
      ?auto_8403 - BLOCK
      ?auto_8404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8403 ?auto_8402 ) ( CLEAR ?auto_8403 ) ( ON-TABLE ?auto_8400 ) ( ON ?auto_8401 ?auto_8400 ) ( ON ?auto_8402 ?auto_8401 ) ( not ( = ?auto_8400 ?auto_8401 ) ) ( not ( = ?auto_8400 ?auto_8402 ) ) ( not ( = ?auto_8400 ?auto_8403 ) ) ( not ( = ?auto_8401 ?auto_8402 ) ) ( not ( = ?auto_8401 ?auto_8403 ) ) ( not ( = ?auto_8402 ?auto_8403 ) ) ( HOLDING ?auto_8404 ) ( not ( = ?auto_8400 ?auto_8404 ) ) ( not ( = ?auto_8401 ?auto_8404 ) ) ( not ( = ?auto_8402 ?auto_8404 ) ) ( not ( = ?auto_8403 ?auto_8404 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8404 )
      ( MAKE-3PILE ?auto_8400 ?auto_8401 ?auto_8402 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8405 - BLOCK
      ?auto_8406 - BLOCK
      ?auto_8407 - BLOCK
    )
    :vars
    (
      ?auto_8408 - BLOCK
      ?auto_8409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8408 ?auto_8407 ) ( ON-TABLE ?auto_8405 ) ( ON ?auto_8406 ?auto_8405 ) ( ON ?auto_8407 ?auto_8406 ) ( not ( = ?auto_8405 ?auto_8406 ) ) ( not ( = ?auto_8405 ?auto_8407 ) ) ( not ( = ?auto_8405 ?auto_8408 ) ) ( not ( = ?auto_8406 ?auto_8407 ) ) ( not ( = ?auto_8406 ?auto_8408 ) ) ( not ( = ?auto_8407 ?auto_8408 ) ) ( not ( = ?auto_8405 ?auto_8409 ) ) ( not ( = ?auto_8406 ?auto_8409 ) ) ( not ( = ?auto_8407 ?auto_8409 ) ) ( not ( = ?auto_8408 ?auto_8409 ) ) ( ON ?auto_8409 ?auto_8408 ) ( CLEAR ?auto_8409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8405 ?auto_8406 ?auto_8407 ?auto_8408 )
      ( MAKE-3PILE ?auto_8405 ?auto_8406 ?auto_8407 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8412 - BLOCK
      ?auto_8413 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8413 ) ( CLEAR ?auto_8412 ) ( ON-TABLE ?auto_8412 ) ( not ( = ?auto_8412 ?auto_8413 ) ) )
    :subtasks
    ( ( !STACK ?auto_8413 ?auto_8412 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8414 - BLOCK
      ?auto_8415 - BLOCK
    )
    :vars
    (
      ?auto_8416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8414 ) ( ON-TABLE ?auto_8414 ) ( not ( = ?auto_8414 ?auto_8415 ) ) ( ON ?auto_8415 ?auto_8416 ) ( CLEAR ?auto_8415 ) ( HAND-EMPTY ) ( not ( = ?auto_8414 ?auto_8416 ) ) ( not ( = ?auto_8415 ?auto_8416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8415 ?auto_8416 )
      ( MAKE-2PILE ?auto_8414 ?auto_8415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8417 - BLOCK
      ?auto_8418 - BLOCK
    )
    :vars
    (
      ?auto_8419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8417 ?auto_8418 ) ) ( ON ?auto_8418 ?auto_8419 ) ( CLEAR ?auto_8418 ) ( not ( = ?auto_8417 ?auto_8419 ) ) ( not ( = ?auto_8418 ?auto_8419 ) ) ( HOLDING ?auto_8417 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8417 )
      ( MAKE-2PILE ?auto_8417 ?auto_8418 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8420 - BLOCK
      ?auto_8421 - BLOCK
    )
    :vars
    (
      ?auto_8422 - BLOCK
      ?auto_8423 - BLOCK
      ?auto_8424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8420 ?auto_8421 ) ) ( ON ?auto_8421 ?auto_8422 ) ( not ( = ?auto_8420 ?auto_8422 ) ) ( not ( = ?auto_8421 ?auto_8422 ) ) ( ON ?auto_8420 ?auto_8421 ) ( CLEAR ?auto_8420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8423 ) ( ON ?auto_8424 ?auto_8423 ) ( ON ?auto_8422 ?auto_8424 ) ( not ( = ?auto_8423 ?auto_8424 ) ) ( not ( = ?auto_8423 ?auto_8422 ) ) ( not ( = ?auto_8423 ?auto_8421 ) ) ( not ( = ?auto_8423 ?auto_8420 ) ) ( not ( = ?auto_8424 ?auto_8422 ) ) ( not ( = ?auto_8424 ?auto_8421 ) ) ( not ( = ?auto_8424 ?auto_8420 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8423 ?auto_8424 ?auto_8422 ?auto_8421 )
      ( MAKE-2PILE ?auto_8420 ?auto_8421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8427 - BLOCK
      ?auto_8428 - BLOCK
    )
    :vars
    (
      ?auto_8429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8429 ?auto_8428 ) ( CLEAR ?auto_8429 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8427 ) ( ON ?auto_8428 ?auto_8427 ) ( not ( = ?auto_8427 ?auto_8428 ) ) ( not ( = ?auto_8427 ?auto_8429 ) ) ( not ( = ?auto_8428 ?auto_8429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8429 ?auto_8428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8430 - BLOCK
      ?auto_8431 - BLOCK
    )
    :vars
    (
      ?auto_8432 - BLOCK
      ?auto_8433 - BLOCK
      ?auto_8434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8432 ?auto_8431 ) ( CLEAR ?auto_8432 ) ( ON-TABLE ?auto_8430 ) ( ON ?auto_8431 ?auto_8430 ) ( not ( = ?auto_8430 ?auto_8431 ) ) ( not ( = ?auto_8430 ?auto_8432 ) ) ( not ( = ?auto_8431 ?auto_8432 ) ) ( HOLDING ?auto_8433 ) ( CLEAR ?auto_8434 ) ( not ( = ?auto_8430 ?auto_8433 ) ) ( not ( = ?auto_8430 ?auto_8434 ) ) ( not ( = ?auto_8431 ?auto_8433 ) ) ( not ( = ?auto_8431 ?auto_8434 ) ) ( not ( = ?auto_8432 ?auto_8433 ) ) ( not ( = ?auto_8432 ?auto_8434 ) ) ( not ( = ?auto_8433 ?auto_8434 ) ) )
    :subtasks
    ( ( !STACK ?auto_8433 ?auto_8434 )
      ( MAKE-2PILE ?auto_8430 ?auto_8431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8630 - BLOCK
      ?auto_8631 - BLOCK
    )
    :vars
    (
      ?auto_8633 - BLOCK
      ?auto_8632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8633 ?auto_8631 ) ( ON-TABLE ?auto_8630 ) ( ON ?auto_8631 ?auto_8630 ) ( not ( = ?auto_8630 ?auto_8631 ) ) ( not ( = ?auto_8630 ?auto_8633 ) ) ( not ( = ?auto_8631 ?auto_8633 ) ) ( not ( = ?auto_8630 ?auto_8632 ) ) ( not ( = ?auto_8631 ?auto_8632 ) ) ( not ( = ?auto_8633 ?auto_8632 ) ) ( ON ?auto_8632 ?auto_8633 ) ( CLEAR ?auto_8632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8630 ?auto_8631 ?auto_8633 )
      ( MAKE-2PILE ?auto_8630 ?auto_8631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8440 - BLOCK
      ?auto_8441 - BLOCK
    )
    :vars
    (
      ?auto_8444 - BLOCK
      ?auto_8442 - BLOCK
      ?auto_8443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8444 ?auto_8441 ) ( ON-TABLE ?auto_8440 ) ( ON ?auto_8441 ?auto_8440 ) ( not ( = ?auto_8440 ?auto_8441 ) ) ( not ( = ?auto_8440 ?auto_8444 ) ) ( not ( = ?auto_8441 ?auto_8444 ) ) ( not ( = ?auto_8440 ?auto_8442 ) ) ( not ( = ?auto_8440 ?auto_8443 ) ) ( not ( = ?auto_8441 ?auto_8442 ) ) ( not ( = ?auto_8441 ?auto_8443 ) ) ( not ( = ?auto_8444 ?auto_8442 ) ) ( not ( = ?auto_8444 ?auto_8443 ) ) ( not ( = ?auto_8442 ?auto_8443 ) ) ( ON ?auto_8442 ?auto_8444 ) ( CLEAR ?auto_8442 ) ( HOLDING ?auto_8443 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8443 )
      ( MAKE-2PILE ?auto_8440 ?auto_8441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8445 - BLOCK
      ?auto_8446 - BLOCK
    )
    :vars
    (
      ?auto_8449 - BLOCK
      ?auto_8448 - BLOCK
      ?auto_8447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8449 ?auto_8446 ) ( ON-TABLE ?auto_8445 ) ( ON ?auto_8446 ?auto_8445 ) ( not ( = ?auto_8445 ?auto_8446 ) ) ( not ( = ?auto_8445 ?auto_8449 ) ) ( not ( = ?auto_8446 ?auto_8449 ) ) ( not ( = ?auto_8445 ?auto_8448 ) ) ( not ( = ?auto_8445 ?auto_8447 ) ) ( not ( = ?auto_8446 ?auto_8448 ) ) ( not ( = ?auto_8446 ?auto_8447 ) ) ( not ( = ?auto_8449 ?auto_8448 ) ) ( not ( = ?auto_8449 ?auto_8447 ) ) ( not ( = ?auto_8448 ?auto_8447 ) ) ( ON ?auto_8448 ?auto_8449 ) ( ON ?auto_8447 ?auto_8448 ) ( CLEAR ?auto_8447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8445 ?auto_8446 ?auto_8449 ?auto_8448 )
      ( MAKE-2PILE ?auto_8445 ?auto_8446 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8453 - BLOCK
      ?auto_8454 - BLOCK
      ?auto_8455 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8455 ) ( CLEAR ?auto_8454 ) ( ON-TABLE ?auto_8453 ) ( ON ?auto_8454 ?auto_8453 ) ( not ( = ?auto_8453 ?auto_8454 ) ) ( not ( = ?auto_8453 ?auto_8455 ) ) ( not ( = ?auto_8454 ?auto_8455 ) ) )
    :subtasks
    ( ( !STACK ?auto_8455 ?auto_8454 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8456 - BLOCK
      ?auto_8457 - BLOCK
      ?auto_8458 - BLOCK
    )
    :vars
    (
      ?auto_8459 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8457 ) ( ON-TABLE ?auto_8456 ) ( ON ?auto_8457 ?auto_8456 ) ( not ( = ?auto_8456 ?auto_8457 ) ) ( not ( = ?auto_8456 ?auto_8458 ) ) ( not ( = ?auto_8457 ?auto_8458 ) ) ( ON ?auto_8458 ?auto_8459 ) ( CLEAR ?auto_8458 ) ( HAND-EMPTY ) ( not ( = ?auto_8456 ?auto_8459 ) ) ( not ( = ?auto_8457 ?auto_8459 ) ) ( not ( = ?auto_8458 ?auto_8459 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8458 ?auto_8459 )
      ( MAKE-3PILE ?auto_8456 ?auto_8457 ?auto_8458 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8460 - BLOCK
      ?auto_8461 - BLOCK
      ?auto_8462 - BLOCK
    )
    :vars
    (
      ?auto_8463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8460 ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( not ( = ?auto_8460 ?auto_8462 ) ) ( not ( = ?auto_8461 ?auto_8462 ) ) ( ON ?auto_8462 ?auto_8463 ) ( CLEAR ?auto_8462 ) ( not ( = ?auto_8460 ?auto_8463 ) ) ( not ( = ?auto_8461 ?auto_8463 ) ) ( not ( = ?auto_8462 ?auto_8463 ) ) ( HOLDING ?auto_8461 ) ( CLEAR ?auto_8460 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8460 ?auto_8461 )
      ( MAKE-3PILE ?auto_8460 ?auto_8461 ?auto_8462 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8464 - BLOCK
      ?auto_8465 - BLOCK
      ?auto_8466 - BLOCK
    )
    :vars
    (
      ?auto_8467 - BLOCK
      ?auto_8468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8464 ) ( not ( = ?auto_8464 ?auto_8465 ) ) ( not ( = ?auto_8464 ?auto_8466 ) ) ( not ( = ?auto_8465 ?auto_8466 ) ) ( ON ?auto_8466 ?auto_8467 ) ( not ( = ?auto_8464 ?auto_8467 ) ) ( not ( = ?auto_8465 ?auto_8467 ) ) ( not ( = ?auto_8466 ?auto_8467 ) ) ( CLEAR ?auto_8464 ) ( ON ?auto_8465 ?auto_8466 ) ( CLEAR ?auto_8465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8468 ) ( ON ?auto_8467 ?auto_8468 ) ( not ( = ?auto_8468 ?auto_8467 ) ) ( not ( = ?auto_8468 ?auto_8466 ) ) ( not ( = ?auto_8468 ?auto_8465 ) ) ( not ( = ?auto_8464 ?auto_8468 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8468 ?auto_8467 ?auto_8466 )
      ( MAKE-3PILE ?auto_8464 ?auto_8465 ?auto_8466 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8469 - BLOCK
      ?auto_8470 - BLOCK
      ?auto_8471 - BLOCK
    )
    :vars
    (
      ?auto_8472 - BLOCK
      ?auto_8473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8469 ?auto_8470 ) ) ( not ( = ?auto_8469 ?auto_8471 ) ) ( not ( = ?auto_8470 ?auto_8471 ) ) ( ON ?auto_8471 ?auto_8472 ) ( not ( = ?auto_8469 ?auto_8472 ) ) ( not ( = ?auto_8470 ?auto_8472 ) ) ( not ( = ?auto_8471 ?auto_8472 ) ) ( ON ?auto_8470 ?auto_8471 ) ( CLEAR ?auto_8470 ) ( ON-TABLE ?auto_8473 ) ( ON ?auto_8472 ?auto_8473 ) ( not ( = ?auto_8473 ?auto_8472 ) ) ( not ( = ?auto_8473 ?auto_8471 ) ) ( not ( = ?auto_8473 ?auto_8470 ) ) ( not ( = ?auto_8469 ?auto_8473 ) ) ( HOLDING ?auto_8469 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8469 )
      ( MAKE-3PILE ?auto_8469 ?auto_8470 ?auto_8471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8474 - BLOCK
      ?auto_8475 - BLOCK
      ?auto_8476 - BLOCK
    )
    :vars
    (
      ?auto_8477 - BLOCK
      ?auto_8478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8474 ?auto_8475 ) ) ( not ( = ?auto_8474 ?auto_8476 ) ) ( not ( = ?auto_8475 ?auto_8476 ) ) ( ON ?auto_8476 ?auto_8477 ) ( not ( = ?auto_8474 ?auto_8477 ) ) ( not ( = ?auto_8475 ?auto_8477 ) ) ( not ( = ?auto_8476 ?auto_8477 ) ) ( ON ?auto_8475 ?auto_8476 ) ( ON-TABLE ?auto_8478 ) ( ON ?auto_8477 ?auto_8478 ) ( not ( = ?auto_8478 ?auto_8477 ) ) ( not ( = ?auto_8478 ?auto_8476 ) ) ( not ( = ?auto_8478 ?auto_8475 ) ) ( not ( = ?auto_8474 ?auto_8478 ) ) ( ON ?auto_8474 ?auto_8475 ) ( CLEAR ?auto_8474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8478 ?auto_8477 ?auto_8476 ?auto_8475 )
      ( MAKE-3PILE ?auto_8474 ?auto_8475 ?auto_8476 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8480 - BLOCK
    )
    :vars
    (
      ?auto_8481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8481 ?auto_8480 ) ( CLEAR ?auto_8481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8480 ) ( not ( = ?auto_8480 ?auto_8481 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8481 ?auto_8480 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8482 - BLOCK
    )
    :vars
    (
      ?auto_8483 - BLOCK
      ?auto_8484 - BLOCK
      ?auto_8485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8483 ?auto_8482 ) ( CLEAR ?auto_8483 ) ( ON-TABLE ?auto_8482 ) ( not ( = ?auto_8482 ?auto_8483 ) ) ( HOLDING ?auto_8484 ) ( CLEAR ?auto_8485 ) ( not ( = ?auto_8482 ?auto_8484 ) ) ( not ( = ?auto_8482 ?auto_8485 ) ) ( not ( = ?auto_8483 ?auto_8484 ) ) ( not ( = ?auto_8483 ?auto_8485 ) ) ( not ( = ?auto_8484 ?auto_8485 ) ) )
    :subtasks
    ( ( !STACK ?auto_8484 ?auto_8485 )
      ( MAKE-1PILE ?auto_8482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8486 - BLOCK
    )
    :vars
    (
      ?auto_8488 - BLOCK
      ?auto_8489 - BLOCK
      ?auto_8487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8488 ?auto_8486 ) ( ON-TABLE ?auto_8486 ) ( not ( = ?auto_8486 ?auto_8488 ) ) ( CLEAR ?auto_8489 ) ( not ( = ?auto_8486 ?auto_8487 ) ) ( not ( = ?auto_8486 ?auto_8489 ) ) ( not ( = ?auto_8488 ?auto_8487 ) ) ( not ( = ?auto_8488 ?auto_8489 ) ) ( not ( = ?auto_8487 ?auto_8489 ) ) ( ON ?auto_8487 ?auto_8488 ) ( CLEAR ?auto_8487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8486 ?auto_8488 )
      ( MAKE-1PILE ?auto_8486 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8490 - BLOCK
    )
    :vars
    (
      ?auto_8491 - BLOCK
      ?auto_8492 - BLOCK
      ?auto_8493 - BLOCK
      ?auto_8494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8491 ?auto_8490 ) ( ON-TABLE ?auto_8490 ) ( not ( = ?auto_8490 ?auto_8491 ) ) ( not ( = ?auto_8490 ?auto_8492 ) ) ( not ( = ?auto_8490 ?auto_8493 ) ) ( not ( = ?auto_8491 ?auto_8492 ) ) ( not ( = ?auto_8491 ?auto_8493 ) ) ( not ( = ?auto_8492 ?auto_8493 ) ) ( ON ?auto_8492 ?auto_8491 ) ( CLEAR ?auto_8492 ) ( HOLDING ?auto_8493 ) ( CLEAR ?auto_8494 ) ( ON-TABLE ?auto_8494 ) ( not ( = ?auto_8494 ?auto_8493 ) ) ( not ( = ?auto_8490 ?auto_8494 ) ) ( not ( = ?auto_8491 ?auto_8494 ) ) ( not ( = ?auto_8492 ?auto_8494 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8494 ?auto_8493 )
      ( MAKE-1PILE ?auto_8490 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8718 - BLOCK
    )
    :vars
    (
      ?auto_8719 - BLOCK
      ?auto_8721 - BLOCK
      ?auto_8720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8719 ?auto_8718 ) ( ON-TABLE ?auto_8718 ) ( not ( = ?auto_8718 ?auto_8719 ) ) ( not ( = ?auto_8718 ?auto_8721 ) ) ( not ( = ?auto_8718 ?auto_8720 ) ) ( not ( = ?auto_8719 ?auto_8721 ) ) ( not ( = ?auto_8719 ?auto_8720 ) ) ( not ( = ?auto_8721 ?auto_8720 ) ) ( ON ?auto_8721 ?auto_8719 ) ( ON ?auto_8720 ?auto_8721 ) ( CLEAR ?auto_8720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8718 ?auto_8719 ?auto_8721 )
      ( MAKE-1PILE ?auto_8718 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8500 - BLOCK
    )
    :vars
    (
      ?auto_8504 - BLOCK
      ?auto_8503 - BLOCK
      ?auto_8502 - BLOCK
      ?auto_8501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8504 ?auto_8500 ) ( ON-TABLE ?auto_8500 ) ( not ( = ?auto_8500 ?auto_8504 ) ) ( not ( = ?auto_8500 ?auto_8503 ) ) ( not ( = ?auto_8500 ?auto_8502 ) ) ( not ( = ?auto_8504 ?auto_8503 ) ) ( not ( = ?auto_8504 ?auto_8502 ) ) ( not ( = ?auto_8503 ?auto_8502 ) ) ( ON ?auto_8503 ?auto_8504 ) ( not ( = ?auto_8501 ?auto_8502 ) ) ( not ( = ?auto_8500 ?auto_8501 ) ) ( not ( = ?auto_8504 ?auto_8501 ) ) ( not ( = ?auto_8503 ?auto_8501 ) ) ( ON ?auto_8502 ?auto_8503 ) ( CLEAR ?auto_8502 ) ( HOLDING ?auto_8501 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8501 )
      ( MAKE-1PILE ?auto_8500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8505 - BLOCK
    )
    :vars
    (
      ?auto_8506 - BLOCK
      ?auto_8507 - BLOCK
      ?auto_8509 - BLOCK
      ?auto_8508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8506 ?auto_8505 ) ( ON-TABLE ?auto_8505 ) ( not ( = ?auto_8505 ?auto_8506 ) ) ( not ( = ?auto_8505 ?auto_8507 ) ) ( not ( = ?auto_8505 ?auto_8509 ) ) ( not ( = ?auto_8506 ?auto_8507 ) ) ( not ( = ?auto_8506 ?auto_8509 ) ) ( not ( = ?auto_8507 ?auto_8509 ) ) ( ON ?auto_8507 ?auto_8506 ) ( not ( = ?auto_8508 ?auto_8509 ) ) ( not ( = ?auto_8505 ?auto_8508 ) ) ( not ( = ?auto_8506 ?auto_8508 ) ) ( not ( = ?auto_8507 ?auto_8508 ) ) ( ON ?auto_8509 ?auto_8507 ) ( ON ?auto_8508 ?auto_8509 ) ( CLEAR ?auto_8508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8505 ?auto_8506 ?auto_8507 ?auto_8509 )
      ( MAKE-1PILE ?auto_8505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8514 - BLOCK
      ?auto_8515 - BLOCK
      ?auto_8516 - BLOCK
      ?auto_8517 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8517 ) ( CLEAR ?auto_8516 ) ( ON-TABLE ?auto_8514 ) ( ON ?auto_8515 ?auto_8514 ) ( ON ?auto_8516 ?auto_8515 ) ( not ( = ?auto_8514 ?auto_8515 ) ) ( not ( = ?auto_8514 ?auto_8516 ) ) ( not ( = ?auto_8514 ?auto_8517 ) ) ( not ( = ?auto_8515 ?auto_8516 ) ) ( not ( = ?auto_8515 ?auto_8517 ) ) ( not ( = ?auto_8516 ?auto_8517 ) ) )
    :subtasks
    ( ( !STACK ?auto_8517 ?auto_8516 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8518 - BLOCK
      ?auto_8519 - BLOCK
      ?auto_8520 - BLOCK
      ?auto_8521 - BLOCK
    )
    :vars
    (
      ?auto_8522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8520 ) ( ON-TABLE ?auto_8518 ) ( ON ?auto_8519 ?auto_8518 ) ( ON ?auto_8520 ?auto_8519 ) ( not ( = ?auto_8518 ?auto_8519 ) ) ( not ( = ?auto_8518 ?auto_8520 ) ) ( not ( = ?auto_8518 ?auto_8521 ) ) ( not ( = ?auto_8519 ?auto_8520 ) ) ( not ( = ?auto_8519 ?auto_8521 ) ) ( not ( = ?auto_8520 ?auto_8521 ) ) ( ON ?auto_8521 ?auto_8522 ) ( CLEAR ?auto_8521 ) ( HAND-EMPTY ) ( not ( = ?auto_8518 ?auto_8522 ) ) ( not ( = ?auto_8519 ?auto_8522 ) ) ( not ( = ?auto_8520 ?auto_8522 ) ) ( not ( = ?auto_8521 ?auto_8522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8521 ?auto_8522 )
      ( MAKE-4PILE ?auto_8518 ?auto_8519 ?auto_8520 ?auto_8521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8523 - BLOCK
      ?auto_8524 - BLOCK
      ?auto_8525 - BLOCK
      ?auto_8526 - BLOCK
    )
    :vars
    (
      ?auto_8527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8523 ) ( ON ?auto_8524 ?auto_8523 ) ( not ( = ?auto_8523 ?auto_8524 ) ) ( not ( = ?auto_8523 ?auto_8525 ) ) ( not ( = ?auto_8523 ?auto_8526 ) ) ( not ( = ?auto_8524 ?auto_8525 ) ) ( not ( = ?auto_8524 ?auto_8526 ) ) ( not ( = ?auto_8525 ?auto_8526 ) ) ( ON ?auto_8526 ?auto_8527 ) ( CLEAR ?auto_8526 ) ( not ( = ?auto_8523 ?auto_8527 ) ) ( not ( = ?auto_8524 ?auto_8527 ) ) ( not ( = ?auto_8525 ?auto_8527 ) ) ( not ( = ?auto_8526 ?auto_8527 ) ) ( HOLDING ?auto_8525 ) ( CLEAR ?auto_8524 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8523 ?auto_8524 ?auto_8525 )
      ( MAKE-4PILE ?auto_8523 ?auto_8524 ?auto_8525 ?auto_8526 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8528 - BLOCK
      ?auto_8529 - BLOCK
      ?auto_8530 - BLOCK
      ?auto_8531 - BLOCK
    )
    :vars
    (
      ?auto_8532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8528 ) ( ON ?auto_8529 ?auto_8528 ) ( not ( = ?auto_8528 ?auto_8529 ) ) ( not ( = ?auto_8528 ?auto_8530 ) ) ( not ( = ?auto_8528 ?auto_8531 ) ) ( not ( = ?auto_8529 ?auto_8530 ) ) ( not ( = ?auto_8529 ?auto_8531 ) ) ( not ( = ?auto_8530 ?auto_8531 ) ) ( ON ?auto_8531 ?auto_8532 ) ( not ( = ?auto_8528 ?auto_8532 ) ) ( not ( = ?auto_8529 ?auto_8532 ) ) ( not ( = ?auto_8530 ?auto_8532 ) ) ( not ( = ?auto_8531 ?auto_8532 ) ) ( CLEAR ?auto_8529 ) ( ON ?auto_8530 ?auto_8531 ) ( CLEAR ?auto_8530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8532 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8532 ?auto_8531 )
      ( MAKE-4PILE ?auto_8528 ?auto_8529 ?auto_8530 ?auto_8531 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8533 - BLOCK
      ?auto_8534 - BLOCK
      ?auto_8535 - BLOCK
      ?auto_8536 - BLOCK
    )
    :vars
    (
      ?auto_8537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8533 ) ( not ( = ?auto_8533 ?auto_8534 ) ) ( not ( = ?auto_8533 ?auto_8535 ) ) ( not ( = ?auto_8533 ?auto_8536 ) ) ( not ( = ?auto_8534 ?auto_8535 ) ) ( not ( = ?auto_8534 ?auto_8536 ) ) ( not ( = ?auto_8535 ?auto_8536 ) ) ( ON ?auto_8536 ?auto_8537 ) ( not ( = ?auto_8533 ?auto_8537 ) ) ( not ( = ?auto_8534 ?auto_8537 ) ) ( not ( = ?auto_8535 ?auto_8537 ) ) ( not ( = ?auto_8536 ?auto_8537 ) ) ( ON ?auto_8535 ?auto_8536 ) ( CLEAR ?auto_8535 ) ( ON-TABLE ?auto_8537 ) ( HOLDING ?auto_8534 ) ( CLEAR ?auto_8533 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8533 ?auto_8534 )
      ( MAKE-4PILE ?auto_8533 ?auto_8534 ?auto_8535 ?auto_8536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8538 - BLOCK
      ?auto_8539 - BLOCK
      ?auto_8540 - BLOCK
      ?auto_8541 - BLOCK
    )
    :vars
    (
      ?auto_8542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8538 ) ( not ( = ?auto_8538 ?auto_8539 ) ) ( not ( = ?auto_8538 ?auto_8540 ) ) ( not ( = ?auto_8538 ?auto_8541 ) ) ( not ( = ?auto_8539 ?auto_8540 ) ) ( not ( = ?auto_8539 ?auto_8541 ) ) ( not ( = ?auto_8540 ?auto_8541 ) ) ( ON ?auto_8541 ?auto_8542 ) ( not ( = ?auto_8538 ?auto_8542 ) ) ( not ( = ?auto_8539 ?auto_8542 ) ) ( not ( = ?auto_8540 ?auto_8542 ) ) ( not ( = ?auto_8541 ?auto_8542 ) ) ( ON ?auto_8540 ?auto_8541 ) ( ON-TABLE ?auto_8542 ) ( CLEAR ?auto_8538 ) ( ON ?auto_8539 ?auto_8540 ) ( CLEAR ?auto_8539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8542 ?auto_8541 ?auto_8540 )
      ( MAKE-4PILE ?auto_8538 ?auto_8539 ?auto_8540 ?auto_8541 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8543 - BLOCK
      ?auto_8544 - BLOCK
      ?auto_8545 - BLOCK
      ?auto_8546 - BLOCK
    )
    :vars
    (
      ?auto_8547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8543 ?auto_8544 ) ) ( not ( = ?auto_8543 ?auto_8545 ) ) ( not ( = ?auto_8543 ?auto_8546 ) ) ( not ( = ?auto_8544 ?auto_8545 ) ) ( not ( = ?auto_8544 ?auto_8546 ) ) ( not ( = ?auto_8545 ?auto_8546 ) ) ( ON ?auto_8546 ?auto_8547 ) ( not ( = ?auto_8543 ?auto_8547 ) ) ( not ( = ?auto_8544 ?auto_8547 ) ) ( not ( = ?auto_8545 ?auto_8547 ) ) ( not ( = ?auto_8546 ?auto_8547 ) ) ( ON ?auto_8545 ?auto_8546 ) ( ON-TABLE ?auto_8547 ) ( ON ?auto_8544 ?auto_8545 ) ( CLEAR ?auto_8544 ) ( HOLDING ?auto_8543 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8543 )
      ( MAKE-4PILE ?auto_8543 ?auto_8544 ?auto_8545 ?auto_8546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8548 - BLOCK
      ?auto_8549 - BLOCK
      ?auto_8550 - BLOCK
      ?auto_8551 - BLOCK
    )
    :vars
    (
      ?auto_8552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8548 ?auto_8549 ) ) ( not ( = ?auto_8548 ?auto_8550 ) ) ( not ( = ?auto_8548 ?auto_8551 ) ) ( not ( = ?auto_8549 ?auto_8550 ) ) ( not ( = ?auto_8549 ?auto_8551 ) ) ( not ( = ?auto_8550 ?auto_8551 ) ) ( ON ?auto_8551 ?auto_8552 ) ( not ( = ?auto_8548 ?auto_8552 ) ) ( not ( = ?auto_8549 ?auto_8552 ) ) ( not ( = ?auto_8550 ?auto_8552 ) ) ( not ( = ?auto_8551 ?auto_8552 ) ) ( ON ?auto_8550 ?auto_8551 ) ( ON-TABLE ?auto_8552 ) ( ON ?auto_8549 ?auto_8550 ) ( ON ?auto_8548 ?auto_8549 ) ( CLEAR ?auto_8548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8552 ?auto_8551 ?auto_8550 ?auto_8549 )
      ( MAKE-4PILE ?auto_8548 ?auto_8549 ?auto_8550 ?auto_8551 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8593 - BLOCK
    )
    :vars
    (
      ?auto_8594 - BLOCK
      ?auto_8595 - BLOCK
      ?auto_8596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8593 ?auto_8594 ) ( CLEAR ?auto_8593 ) ( not ( = ?auto_8593 ?auto_8594 ) ) ( HOLDING ?auto_8595 ) ( CLEAR ?auto_8596 ) ( not ( = ?auto_8593 ?auto_8595 ) ) ( not ( = ?auto_8593 ?auto_8596 ) ) ( not ( = ?auto_8594 ?auto_8595 ) ) ( not ( = ?auto_8594 ?auto_8596 ) ) ( not ( = ?auto_8595 ?auto_8596 ) ) )
    :subtasks
    ( ( !STACK ?auto_8595 ?auto_8596 )
      ( MAKE-1PILE ?auto_8593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8597 - BLOCK
    )
    :vars
    (
      ?auto_8599 - BLOCK
      ?auto_8600 - BLOCK
      ?auto_8598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8597 ?auto_8599 ) ( not ( = ?auto_8597 ?auto_8599 ) ) ( CLEAR ?auto_8600 ) ( not ( = ?auto_8597 ?auto_8598 ) ) ( not ( = ?auto_8597 ?auto_8600 ) ) ( not ( = ?auto_8599 ?auto_8598 ) ) ( not ( = ?auto_8599 ?auto_8600 ) ) ( not ( = ?auto_8598 ?auto_8600 ) ) ( ON ?auto_8598 ?auto_8597 ) ( CLEAR ?auto_8598 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8599 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8599 ?auto_8597 )
      ( MAKE-1PILE ?auto_8597 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8601 - BLOCK
    )
    :vars
    (
      ?auto_8602 - BLOCK
      ?auto_8603 - BLOCK
      ?auto_8604 - BLOCK
      ?auto_8605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8601 ?auto_8602 ) ( not ( = ?auto_8601 ?auto_8602 ) ) ( not ( = ?auto_8601 ?auto_8603 ) ) ( not ( = ?auto_8601 ?auto_8604 ) ) ( not ( = ?auto_8602 ?auto_8603 ) ) ( not ( = ?auto_8602 ?auto_8604 ) ) ( not ( = ?auto_8603 ?auto_8604 ) ) ( ON ?auto_8603 ?auto_8601 ) ( CLEAR ?auto_8603 ) ( ON-TABLE ?auto_8602 ) ( HOLDING ?auto_8604 ) ( CLEAR ?auto_8605 ) ( ON-TABLE ?auto_8605 ) ( not ( = ?auto_8605 ?auto_8604 ) ) ( not ( = ?auto_8601 ?auto_8605 ) ) ( not ( = ?auto_8602 ?auto_8605 ) ) ( not ( = ?auto_8603 ?auto_8605 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8605 ?auto_8604 )
      ( MAKE-1PILE ?auto_8601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8606 - BLOCK
    )
    :vars
    (
      ?auto_8609 - BLOCK
      ?auto_8608 - BLOCK
      ?auto_8607 - BLOCK
      ?auto_8610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8606 ?auto_8609 ) ( not ( = ?auto_8606 ?auto_8609 ) ) ( not ( = ?auto_8606 ?auto_8608 ) ) ( not ( = ?auto_8606 ?auto_8607 ) ) ( not ( = ?auto_8609 ?auto_8608 ) ) ( not ( = ?auto_8609 ?auto_8607 ) ) ( not ( = ?auto_8608 ?auto_8607 ) ) ( ON ?auto_8608 ?auto_8606 ) ( ON-TABLE ?auto_8609 ) ( CLEAR ?auto_8610 ) ( ON-TABLE ?auto_8610 ) ( not ( = ?auto_8610 ?auto_8607 ) ) ( not ( = ?auto_8606 ?auto_8610 ) ) ( not ( = ?auto_8609 ?auto_8610 ) ) ( not ( = ?auto_8608 ?auto_8610 ) ) ( ON ?auto_8607 ?auto_8608 ) ( CLEAR ?auto_8607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8609 ?auto_8606 ?auto_8608 )
      ( MAKE-1PILE ?auto_8606 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8611 - BLOCK
    )
    :vars
    (
      ?auto_8615 - BLOCK
      ?auto_8613 - BLOCK
      ?auto_8614 - BLOCK
      ?auto_8612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8611 ?auto_8615 ) ( not ( = ?auto_8611 ?auto_8615 ) ) ( not ( = ?auto_8611 ?auto_8613 ) ) ( not ( = ?auto_8611 ?auto_8614 ) ) ( not ( = ?auto_8615 ?auto_8613 ) ) ( not ( = ?auto_8615 ?auto_8614 ) ) ( not ( = ?auto_8613 ?auto_8614 ) ) ( ON ?auto_8613 ?auto_8611 ) ( ON-TABLE ?auto_8615 ) ( not ( = ?auto_8612 ?auto_8614 ) ) ( not ( = ?auto_8611 ?auto_8612 ) ) ( not ( = ?auto_8615 ?auto_8612 ) ) ( not ( = ?auto_8613 ?auto_8612 ) ) ( ON ?auto_8614 ?auto_8613 ) ( CLEAR ?auto_8614 ) ( HOLDING ?auto_8612 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8612 )
      ( MAKE-1PILE ?auto_8611 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8616 - BLOCK
    )
    :vars
    (
      ?auto_8620 - BLOCK
      ?auto_8617 - BLOCK
      ?auto_8618 - BLOCK
      ?auto_8619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8616 ?auto_8620 ) ( not ( = ?auto_8616 ?auto_8620 ) ) ( not ( = ?auto_8616 ?auto_8617 ) ) ( not ( = ?auto_8616 ?auto_8618 ) ) ( not ( = ?auto_8620 ?auto_8617 ) ) ( not ( = ?auto_8620 ?auto_8618 ) ) ( not ( = ?auto_8617 ?auto_8618 ) ) ( ON ?auto_8617 ?auto_8616 ) ( ON-TABLE ?auto_8620 ) ( not ( = ?auto_8619 ?auto_8618 ) ) ( not ( = ?auto_8616 ?auto_8619 ) ) ( not ( = ?auto_8620 ?auto_8619 ) ) ( not ( = ?auto_8617 ?auto_8619 ) ) ( ON ?auto_8618 ?auto_8617 ) ( ON ?auto_8619 ?auto_8618 ) ( CLEAR ?auto_8619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8620 ?auto_8616 ?auto_8617 ?auto_8618 )
      ( MAKE-1PILE ?auto_8616 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8626 - BLOCK
      ?auto_8627 - BLOCK
    )
    :vars
    (
      ?auto_8628 - BLOCK
      ?auto_8629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8628 ?auto_8627 ) ( CLEAR ?auto_8628 ) ( ON-TABLE ?auto_8626 ) ( ON ?auto_8627 ?auto_8626 ) ( not ( = ?auto_8626 ?auto_8627 ) ) ( not ( = ?auto_8626 ?auto_8628 ) ) ( not ( = ?auto_8627 ?auto_8628 ) ) ( HOLDING ?auto_8629 ) ( not ( = ?auto_8626 ?auto_8629 ) ) ( not ( = ?auto_8627 ?auto_8629 ) ) ( not ( = ?auto_8628 ?auto_8629 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8629 )
      ( MAKE-2PILE ?auto_8626 ?auto_8627 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8663 - BLOCK
      ?auto_8664 - BLOCK
    )
    :vars
    (
      ?auto_8665 - BLOCK
      ?auto_8666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8663 ?auto_8664 ) ) ( ON ?auto_8664 ?auto_8665 ) ( not ( = ?auto_8663 ?auto_8665 ) ) ( not ( = ?auto_8664 ?auto_8665 ) ) ( ON ?auto_8663 ?auto_8664 ) ( CLEAR ?auto_8663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8666 ) ( ON ?auto_8665 ?auto_8666 ) ( not ( = ?auto_8666 ?auto_8665 ) ) ( not ( = ?auto_8666 ?auto_8664 ) ) ( not ( = ?auto_8666 ?auto_8663 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8666 ?auto_8665 ?auto_8664 )
      ( MAKE-2PILE ?auto_8663 ?auto_8664 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8669 - BLOCK
      ?auto_8670 - BLOCK
    )
    :vars
    (
      ?auto_8671 - BLOCK
      ?auto_8672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8669 ?auto_8670 ) ) ( ON ?auto_8670 ?auto_8671 ) ( CLEAR ?auto_8670 ) ( not ( = ?auto_8669 ?auto_8671 ) ) ( not ( = ?auto_8670 ?auto_8671 ) ) ( ON ?auto_8669 ?auto_8672 ) ( CLEAR ?auto_8669 ) ( HAND-EMPTY ) ( not ( = ?auto_8669 ?auto_8672 ) ) ( not ( = ?auto_8670 ?auto_8672 ) ) ( not ( = ?auto_8671 ?auto_8672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8669 ?auto_8672 )
      ( MAKE-2PILE ?auto_8669 ?auto_8670 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8673 - BLOCK
      ?auto_8674 - BLOCK
    )
    :vars
    (
      ?auto_8676 - BLOCK
      ?auto_8675 - BLOCK
      ?auto_8677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8673 ?auto_8674 ) ) ( not ( = ?auto_8673 ?auto_8676 ) ) ( not ( = ?auto_8674 ?auto_8676 ) ) ( ON ?auto_8673 ?auto_8675 ) ( CLEAR ?auto_8673 ) ( not ( = ?auto_8673 ?auto_8675 ) ) ( not ( = ?auto_8674 ?auto_8675 ) ) ( not ( = ?auto_8676 ?auto_8675 ) ) ( HOLDING ?auto_8674 ) ( CLEAR ?auto_8676 ) ( ON-TABLE ?auto_8677 ) ( ON ?auto_8676 ?auto_8677 ) ( not ( = ?auto_8677 ?auto_8676 ) ) ( not ( = ?auto_8677 ?auto_8674 ) ) ( not ( = ?auto_8673 ?auto_8677 ) ) ( not ( = ?auto_8675 ?auto_8677 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8677 ?auto_8676 ?auto_8674 )
      ( MAKE-2PILE ?auto_8673 ?auto_8674 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8678 - BLOCK
      ?auto_8679 - BLOCK
    )
    :vars
    (
      ?auto_8682 - BLOCK
      ?auto_8680 - BLOCK
      ?auto_8681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8678 ?auto_8679 ) ) ( not ( = ?auto_8678 ?auto_8682 ) ) ( not ( = ?auto_8679 ?auto_8682 ) ) ( ON ?auto_8678 ?auto_8680 ) ( not ( = ?auto_8678 ?auto_8680 ) ) ( not ( = ?auto_8679 ?auto_8680 ) ) ( not ( = ?auto_8682 ?auto_8680 ) ) ( CLEAR ?auto_8682 ) ( ON-TABLE ?auto_8681 ) ( ON ?auto_8682 ?auto_8681 ) ( not ( = ?auto_8681 ?auto_8682 ) ) ( not ( = ?auto_8681 ?auto_8679 ) ) ( not ( = ?auto_8678 ?auto_8681 ) ) ( not ( = ?auto_8680 ?auto_8681 ) ) ( ON ?auto_8679 ?auto_8678 ) ( CLEAR ?auto_8679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8680 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8680 ?auto_8678 )
      ( MAKE-2PILE ?auto_8678 ?auto_8679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8683 - BLOCK
      ?auto_8684 - BLOCK
    )
    :vars
    (
      ?auto_8685 - BLOCK
      ?auto_8686 - BLOCK
      ?auto_8687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8683 ?auto_8684 ) ) ( not ( = ?auto_8683 ?auto_8685 ) ) ( not ( = ?auto_8684 ?auto_8685 ) ) ( ON ?auto_8683 ?auto_8686 ) ( not ( = ?auto_8683 ?auto_8686 ) ) ( not ( = ?auto_8684 ?auto_8686 ) ) ( not ( = ?auto_8685 ?auto_8686 ) ) ( ON-TABLE ?auto_8687 ) ( not ( = ?auto_8687 ?auto_8685 ) ) ( not ( = ?auto_8687 ?auto_8684 ) ) ( not ( = ?auto_8683 ?auto_8687 ) ) ( not ( = ?auto_8686 ?auto_8687 ) ) ( ON ?auto_8684 ?auto_8683 ) ( CLEAR ?auto_8684 ) ( ON-TABLE ?auto_8686 ) ( HOLDING ?auto_8685 ) ( CLEAR ?auto_8687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8687 ?auto_8685 )
      ( MAKE-2PILE ?auto_8683 ?auto_8684 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8688 - BLOCK
      ?auto_8689 - BLOCK
    )
    :vars
    (
      ?auto_8690 - BLOCK
      ?auto_8691 - BLOCK
      ?auto_8692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8688 ?auto_8689 ) ) ( not ( = ?auto_8688 ?auto_8690 ) ) ( not ( = ?auto_8689 ?auto_8690 ) ) ( ON ?auto_8688 ?auto_8691 ) ( not ( = ?auto_8688 ?auto_8691 ) ) ( not ( = ?auto_8689 ?auto_8691 ) ) ( not ( = ?auto_8690 ?auto_8691 ) ) ( ON-TABLE ?auto_8692 ) ( not ( = ?auto_8692 ?auto_8690 ) ) ( not ( = ?auto_8692 ?auto_8689 ) ) ( not ( = ?auto_8688 ?auto_8692 ) ) ( not ( = ?auto_8691 ?auto_8692 ) ) ( ON ?auto_8689 ?auto_8688 ) ( ON-TABLE ?auto_8691 ) ( CLEAR ?auto_8692 ) ( ON ?auto_8690 ?auto_8689 ) ( CLEAR ?auto_8690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8691 ?auto_8688 ?auto_8689 )
      ( MAKE-2PILE ?auto_8688 ?auto_8689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8693 - BLOCK
      ?auto_8694 - BLOCK
    )
    :vars
    (
      ?auto_8696 - BLOCK
      ?auto_8697 - BLOCK
      ?auto_8695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8693 ?auto_8694 ) ) ( not ( = ?auto_8693 ?auto_8696 ) ) ( not ( = ?auto_8694 ?auto_8696 ) ) ( ON ?auto_8693 ?auto_8697 ) ( not ( = ?auto_8693 ?auto_8697 ) ) ( not ( = ?auto_8694 ?auto_8697 ) ) ( not ( = ?auto_8696 ?auto_8697 ) ) ( not ( = ?auto_8695 ?auto_8696 ) ) ( not ( = ?auto_8695 ?auto_8694 ) ) ( not ( = ?auto_8693 ?auto_8695 ) ) ( not ( = ?auto_8697 ?auto_8695 ) ) ( ON ?auto_8694 ?auto_8693 ) ( ON-TABLE ?auto_8697 ) ( ON ?auto_8696 ?auto_8694 ) ( CLEAR ?auto_8696 ) ( HOLDING ?auto_8695 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8695 )
      ( MAKE-2PILE ?auto_8693 ?auto_8694 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8698 - BLOCK
      ?auto_8699 - BLOCK
    )
    :vars
    (
      ?auto_8701 - BLOCK
      ?auto_8700 - BLOCK
      ?auto_8702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8698 ?auto_8699 ) ) ( not ( = ?auto_8698 ?auto_8701 ) ) ( not ( = ?auto_8699 ?auto_8701 ) ) ( ON ?auto_8698 ?auto_8700 ) ( not ( = ?auto_8698 ?auto_8700 ) ) ( not ( = ?auto_8699 ?auto_8700 ) ) ( not ( = ?auto_8701 ?auto_8700 ) ) ( not ( = ?auto_8702 ?auto_8701 ) ) ( not ( = ?auto_8702 ?auto_8699 ) ) ( not ( = ?auto_8698 ?auto_8702 ) ) ( not ( = ?auto_8700 ?auto_8702 ) ) ( ON ?auto_8699 ?auto_8698 ) ( ON-TABLE ?auto_8700 ) ( ON ?auto_8701 ?auto_8699 ) ( ON ?auto_8702 ?auto_8701 ) ( CLEAR ?auto_8702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8700 ?auto_8698 ?auto_8699 ?auto_8701 )
      ( MAKE-2PILE ?auto_8698 ?auto_8699 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8714 - BLOCK
    )
    :vars
    (
      ?auto_8717 - BLOCK
      ?auto_8716 - BLOCK
      ?auto_8715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8717 ?auto_8714 ) ( ON-TABLE ?auto_8714 ) ( not ( = ?auto_8714 ?auto_8717 ) ) ( not ( = ?auto_8714 ?auto_8716 ) ) ( not ( = ?auto_8714 ?auto_8715 ) ) ( not ( = ?auto_8717 ?auto_8716 ) ) ( not ( = ?auto_8717 ?auto_8715 ) ) ( not ( = ?auto_8716 ?auto_8715 ) ) ( ON ?auto_8716 ?auto_8717 ) ( CLEAR ?auto_8716 ) ( HOLDING ?auto_8715 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8715 )
      ( MAKE-1PILE ?auto_8714 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8747 - BLOCK
      ?auto_8748 - BLOCK
      ?auto_8749 - BLOCK
    )
    :vars
    (
      ?auto_8750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8747 ) ( not ( = ?auto_8747 ?auto_8748 ) ) ( not ( = ?auto_8747 ?auto_8749 ) ) ( not ( = ?auto_8748 ?auto_8749 ) ) ( ON ?auto_8749 ?auto_8750 ) ( not ( = ?auto_8747 ?auto_8750 ) ) ( not ( = ?auto_8748 ?auto_8750 ) ) ( not ( = ?auto_8749 ?auto_8750 ) ) ( CLEAR ?auto_8747 ) ( ON ?auto_8748 ?auto_8749 ) ( CLEAR ?auto_8748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8750 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8750 ?auto_8749 )
      ( MAKE-3PILE ?auto_8747 ?auto_8748 ?auto_8749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8751 - BLOCK
      ?auto_8752 - BLOCK
      ?auto_8753 - BLOCK
    )
    :vars
    (
      ?auto_8754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8751 ?auto_8752 ) ) ( not ( = ?auto_8751 ?auto_8753 ) ) ( not ( = ?auto_8752 ?auto_8753 ) ) ( ON ?auto_8753 ?auto_8754 ) ( not ( = ?auto_8751 ?auto_8754 ) ) ( not ( = ?auto_8752 ?auto_8754 ) ) ( not ( = ?auto_8753 ?auto_8754 ) ) ( ON ?auto_8752 ?auto_8753 ) ( CLEAR ?auto_8752 ) ( ON-TABLE ?auto_8754 ) ( HOLDING ?auto_8751 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8751 )
      ( MAKE-3PILE ?auto_8751 ?auto_8752 ?auto_8753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8755 - BLOCK
      ?auto_8756 - BLOCK
      ?auto_8757 - BLOCK
    )
    :vars
    (
      ?auto_8758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8755 ?auto_8756 ) ) ( not ( = ?auto_8755 ?auto_8757 ) ) ( not ( = ?auto_8756 ?auto_8757 ) ) ( ON ?auto_8757 ?auto_8758 ) ( not ( = ?auto_8755 ?auto_8758 ) ) ( not ( = ?auto_8756 ?auto_8758 ) ) ( not ( = ?auto_8757 ?auto_8758 ) ) ( ON ?auto_8756 ?auto_8757 ) ( ON-TABLE ?auto_8758 ) ( ON ?auto_8755 ?auto_8756 ) ( CLEAR ?auto_8755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8758 ?auto_8757 ?auto_8756 )
      ( MAKE-3PILE ?auto_8755 ?auto_8756 ?auto_8757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8762 - BLOCK
      ?auto_8763 - BLOCK
      ?auto_8764 - BLOCK
    )
    :vars
    (
      ?auto_8765 - BLOCK
      ?auto_8766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8762 ?auto_8763 ) ) ( not ( = ?auto_8762 ?auto_8764 ) ) ( not ( = ?auto_8763 ?auto_8764 ) ) ( ON ?auto_8764 ?auto_8765 ) ( not ( = ?auto_8762 ?auto_8765 ) ) ( not ( = ?auto_8763 ?auto_8765 ) ) ( not ( = ?auto_8764 ?auto_8765 ) ) ( ON ?auto_8763 ?auto_8764 ) ( CLEAR ?auto_8763 ) ( ON-TABLE ?auto_8765 ) ( ON ?auto_8762 ?auto_8766 ) ( CLEAR ?auto_8762 ) ( HAND-EMPTY ) ( not ( = ?auto_8762 ?auto_8766 ) ) ( not ( = ?auto_8763 ?auto_8766 ) ) ( not ( = ?auto_8764 ?auto_8766 ) ) ( not ( = ?auto_8765 ?auto_8766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8762 ?auto_8766 )
      ( MAKE-3PILE ?auto_8762 ?auto_8763 ?auto_8764 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8767 - BLOCK
      ?auto_8768 - BLOCK
      ?auto_8769 - BLOCK
    )
    :vars
    (
      ?auto_8771 - BLOCK
      ?auto_8770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8767 ?auto_8768 ) ) ( not ( = ?auto_8767 ?auto_8769 ) ) ( not ( = ?auto_8768 ?auto_8769 ) ) ( ON ?auto_8769 ?auto_8771 ) ( not ( = ?auto_8767 ?auto_8771 ) ) ( not ( = ?auto_8768 ?auto_8771 ) ) ( not ( = ?auto_8769 ?auto_8771 ) ) ( ON-TABLE ?auto_8771 ) ( ON ?auto_8767 ?auto_8770 ) ( CLEAR ?auto_8767 ) ( not ( = ?auto_8767 ?auto_8770 ) ) ( not ( = ?auto_8768 ?auto_8770 ) ) ( not ( = ?auto_8769 ?auto_8770 ) ) ( not ( = ?auto_8771 ?auto_8770 ) ) ( HOLDING ?auto_8768 ) ( CLEAR ?auto_8769 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8771 ?auto_8769 ?auto_8768 )
      ( MAKE-3PILE ?auto_8767 ?auto_8768 ?auto_8769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8772 - BLOCK
      ?auto_8773 - BLOCK
      ?auto_8774 - BLOCK
    )
    :vars
    (
      ?auto_8776 - BLOCK
      ?auto_8775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8772 ?auto_8773 ) ) ( not ( = ?auto_8772 ?auto_8774 ) ) ( not ( = ?auto_8773 ?auto_8774 ) ) ( ON ?auto_8774 ?auto_8776 ) ( not ( = ?auto_8772 ?auto_8776 ) ) ( not ( = ?auto_8773 ?auto_8776 ) ) ( not ( = ?auto_8774 ?auto_8776 ) ) ( ON-TABLE ?auto_8776 ) ( ON ?auto_8772 ?auto_8775 ) ( not ( = ?auto_8772 ?auto_8775 ) ) ( not ( = ?auto_8773 ?auto_8775 ) ) ( not ( = ?auto_8774 ?auto_8775 ) ) ( not ( = ?auto_8776 ?auto_8775 ) ) ( CLEAR ?auto_8774 ) ( ON ?auto_8773 ?auto_8772 ) ( CLEAR ?auto_8773 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8775 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8775 ?auto_8772 )
      ( MAKE-3PILE ?auto_8772 ?auto_8773 ?auto_8774 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8777 - BLOCK
      ?auto_8778 - BLOCK
      ?auto_8779 - BLOCK
    )
    :vars
    (
      ?auto_8780 - BLOCK
      ?auto_8781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8777 ?auto_8778 ) ) ( not ( = ?auto_8777 ?auto_8779 ) ) ( not ( = ?auto_8778 ?auto_8779 ) ) ( not ( = ?auto_8777 ?auto_8780 ) ) ( not ( = ?auto_8778 ?auto_8780 ) ) ( not ( = ?auto_8779 ?auto_8780 ) ) ( ON-TABLE ?auto_8780 ) ( ON ?auto_8777 ?auto_8781 ) ( not ( = ?auto_8777 ?auto_8781 ) ) ( not ( = ?auto_8778 ?auto_8781 ) ) ( not ( = ?auto_8779 ?auto_8781 ) ) ( not ( = ?auto_8780 ?auto_8781 ) ) ( ON ?auto_8778 ?auto_8777 ) ( CLEAR ?auto_8778 ) ( ON-TABLE ?auto_8781 ) ( HOLDING ?auto_8779 ) ( CLEAR ?auto_8780 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8780 ?auto_8779 )
      ( MAKE-3PILE ?auto_8777 ?auto_8778 ?auto_8779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8782 - BLOCK
      ?auto_8783 - BLOCK
      ?auto_8784 - BLOCK
    )
    :vars
    (
      ?auto_8785 - BLOCK
      ?auto_8786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8782 ?auto_8783 ) ) ( not ( = ?auto_8782 ?auto_8784 ) ) ( not ( = ?auto_8783 ?auto_8784 ) ) ( not ( = ?auto_8782 ?auto_8785 ) ) ( not ( = ?auto_8783 ?auto_8785 ) ) ( not ( = ?auto_8784 ?auto_8785 ) ) ( ON-TABLE ?auto_8785 ) ( ON ?auto_8782 ?auto_8786 ) ( not ( = ?auto_8782 ?auto_8786 ) ) ( not ( = ?auto_8783 ?auto_8786 ) ) ( not ( = ?auto_8784 ?auto_8786 ) ) ( not ( = ?auto_8785 ?auto_8786 ) ) ( ON ?auto_8783 ?auto_8782 ) ( ON-TABLE ?auto_8786 ) ( CLEAR ?auto_8785 ) ( ON ?auto_8784 ?auto_8783 ) ( CLEAR ?auto_8784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8786 ?auto_8782 ?auto_8783 )
      ( MAKE-3PILE ?auto_8782 ?auto_8783 ?auto_8784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8787 - BLOCK
      ?auto_8788 - BLOCK
      ?auto_8789 - BLOCK
    )
    :vars
    (
      ?auto_8790 - BLOCK
      ?auto_8791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8787 ?auto_8788 ) ) ( not ( = ?auto_8787 ?auto_8789 ) ) ( not ( = ?auto_8788 ?auto_8789 ) ) ( not ( = ?auto_8787 ?auto_8790 ) ) ( not ( = ?auto_8788 ?auto_8790 ) ) ( not ( = ?auto_8789 ?auto_8790 ) ) ( ON ?auto_8787 ?auto_8791 ) ( not ( = ?auto_8787 ?auto_8791 ) ) ( not ( = ?auto_8788 ?auto_8791 ) ) ( not ( = ?auto_8789 ?auto_8791 ) ) ( not ( = ?auto_8790 ?auto_8791 ) ) ( ON ?auto_8788 ?auto_8787 ) ( ON-TABLE ?auto_8791 ) ( ON ?auto_8789 ?auto_8788 ) ( CLEAR ?auto_8789 ) ( HOLDING ?auto_8790 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8790 )
      ( MAKE-3PILE ?auto_8787 ?auto_8788 ?auto_8789 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8792 - BLOCK
      ?auto_8793 - BLOCK
      ?auto_8794 - BLOCK
    )
    :vars
    (
      ?auto_8795 - BLOCK
      ?auto_8796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8792 ?auto_8793 ) ) ( not ( = ?auto_8792 ?auto_8794 ) ) ( not ( = ?auto_8793 ?auto_8794 ) ) ( not ( = ?auto_8792 ?auto_8795 ) ) ( not ( = ?auto_8793 ?auto_8795 ) ) ( not ( = ?auto_8794 ?auto_8795 ) ) ( ON ?auto_8792 ?auto_8796 ) ( not ( = ?auto_8792 ?auto_8796 ) ) ( not ( = ?auto_8793 ?auto_8796 ) ) ( not ( = ?auto_8794 ?auto_8796 ) ) ( not ( = ?auto_8795 ?auto_8796 ) ) ( ON ?auto_8793 ?auto_8792 ) ( ON-TABLE ?auto_8796 ) ( ON ?auto_8794 ?auto_8793 ) ( ON ?auto_8795 ?auto_8794 ) ( CLEAR ?auto_8795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8796 ?auto_8792 ?auto_8793 ?auto_8794 )
      ( MAKE-3PILE ?auto_8792 ?auto_8793 ?auto_8794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8805 - BLOCK
      ?auto_8806 - BLOCK
      ?auto_8807 - BLOCK
      ?auto_8808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8807 ) ( ON-TABLE ?auto_8805 ) ( ON ?auto_8806 ?auto_8805 ) ( ON ?auto_8807 ?auto_8806 ) ( not ( = ?auto_8805 ?auto_8806 ) ) ( not ( = ?auto_8805 ?auto_8807 ) ) ( not ( = ?auto_8805 ?auto_8808 ) ) ( not ( = ?auto_8806 ?auto_8807 ) ) ( not ( = ?auto_8806 ?auto_8808 ) ) ( not ( = ?auto_8807 ?auto_8808 ) ) ( ON-TABLE ?auto_8808 ) ( CLEAR ?auto_8808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_8808 )
      ( MAKE-4PILE ?auto_8805 ?auto_8806 ?auto_8807 ?auto_8808 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8809 - BLOCK
      ?auto_8810 - BLOCK
      ?auto_8811 - BLOCK
      ?auto_8812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8809 ) ( ON ?auto_8810 ?auto_8809 ) ( not ( = ?auto_8809 ?auto_8810 ) ) ( not ( = ?auto_8809 ?auto_8811 ) ) ( not ( = ?auto_8809 ?auto_8812 ) ) ( not ( = ?auto_8810 ?auto_8811 ) ) ( not ( = ?auto_8810 ?auto_8812 ) ) ( not ( = ?auto_8811 ?auto_8812 ) ) ( ON-TABLE ?auto_8812 ) ( CLEAR ?auto_8812 ) ( HOLDING ?auto_8811 ) ( CLEAR ?auto_8810 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8809 ?auto_8810 ?auto_8811 )
      ( MAKE-4PILE ?auto_8809 ?auto_8810 ?auto_8811 ?auto_8812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8813 - BLOCK
      ?auto_8814 - BLOCK
      ?auto_8815 - BLOCK
      ?auto_8816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8813 ) ( ON ?auto_8814 ?auto_8813 ) ( not ( = ?auto_8813 ?auto_8814 ) ) ( not ( = ?auto_8813 ?auto_8815 ) ) ( not ( = ?auto_8813 ?auto_8816 ) ) ( not ( = ?auto_8814 ?auto_8815 ) ) ( not ( = ?auto_8814 ?auto_8816 ) ) ( not ( = ?auto_8815 ?auto_8816 ) ) ( ON-TABLE ?auto_8816 ) ( CLEAR ?auto_8814 ) ( ON ?auto_8815 ?auto_8816 ) ( CLEAR ?auto_8815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8816 )
      ( MAKE-4PILE ?auto_8813 ?auto_8814 ?auto_8815 ?auto_8816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8817 - BLOCK
      ?auto_8818 - BLOCK
      ?auto_8819 - BLOCK
      ?auto_8820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8817 ) ( not ( = ?auto_8817 ?auto_8818 ) ) ( not ( = ?auto_8817 ?auto_8819 ) ) ( not ( = ?auto_8817 ?auto_8820 ) ) ( not ( = ?auto_8818 ?auto_8819 ) ) ( not ( = ?auto_8818 ?auto_8820 ) ) ( not ( = ?auto_8819 ?auto_8820 ) ) ( ON-TABLE ?auto_8820 ) ( ON ?auto_8819 ?auto_8820 ) ( CLEAR ?auto_8819 ) ( HOLDING ?auto_8818 ) ( CLEAR ?auto_8817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8817 ?auto_8818 )
      ( MAKE-4PILE ?auto_8817 ?auto_8818 ?auto_8819 ?auto_8820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8821 - BLOCK
      ?auto_8822 - BLOCK
      ?auto_8823 - BLOCK
      ?auto_8824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8821 ) ( not ( = ?auto_8821 ?auto_8822 ) ) ( not ( = ?auto_8821 ?auto_8823 ) ) ( not ( = ?auto_8821 ?auto_8824 ) ) ( not ( = ?auto_8822 ?auto_8823 ) ) ( not ( = ?auto_8822 ?auto_8824 ) ) ( not ( = ?auto_8823 ?auto_8824 ) ) ( ON-TABLE ?auto_8824 ) ( ON ?auto_8823 ?auto_8824 ) ( CLEAR ?auto_8821 ) ( ON ?auto_8822 ?auto_8823 ) ( CLEAR ?auto_8822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8824 ?auto_8823 )
      ( MAKE-4PILE ?auto_8821 ?auto_8822 ?auto_8823 ?auto_8824 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8825 - BLOCK
      ?auto_8826 - BLOCK
      ?auto_8827 - BLOCK
      ?auto_8828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8825 ?auto_8826 ) ) ( not ( = ?auto_8825 ?auto_8827 ) ) ( not ( = ?auto_8825 ?auto_8828 ) ) ( not ( = ?auto_8826 ?auto_8827 ) ) ( not ( = ?auto_8826 ?auto_8828 ) ) ( not ( = ?auto_8827 ?auto_8828 ) ) ( ON-TABLE ?auto_8828 ) ( ON ?auto_8827 ?auto_8828 ) ( ON ?auto_8826 ?auto_8827 ) ( CLEAR ?auto_8826 ) ( HOLDING ?auto_8825 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8825 )
      ( MAKE-4PILE ?auto_8825 ?auto_8826 ?auto_8827 ?auto_8828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8829 - BLOCK
      ?auto_8830 - BLOCK
      ?auto_8831 - BLOCK
      ?auto_8832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8829 ?auto_8830 ) ) ( not ( = ?auto_8829 ?auto_8831 ) ) ( not ( = ?auto_8829 ?auto_8832 ) ) ( not ( = ?auto_8830 ?auto_8831 ) ) ( not ( = ?auto_8830 ?auto_8832 ) ) ( not ( = ?auto_8831 ?auto_8832 ) ) ( ON-TABLE ?auto_8832 ) ( ON ?auto_8831 ?auto_8832 ) ( ON ?auto_8830 ?auto_8831 ) ( ON ?auto_8829 ?auto_8830 ) ( CLEAR ?auto_8829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8832 ?auto_8831 ?auto_8830 )
      ( MAKE-4PILE ?auto_8829 ?auto_8830 ?auto_8831 ?auto_8832 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8837 - BLOCK
      ?auto_8838 - BLOCK
      ?auto_8839 - BLOCK
      ?auto_8840 - BLOCK
    )
    :vars
    (
      ?auto_8841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8837 ?auto_8838 ) ) ( not ( = ?auto_8837 ?auto_8839 ) ) ( not ( = ?auto_8837 ?auto_8840 ) ) ( not ( = ?auto_8838 ?auto_8839 ) ) ( not ( = ?auto_8838 ?auto_8840 ) ) ( not ( = ?auto_8839 ?auto_8840 ) ) ( ON-TABLE ?auto_8840 ) ( ON ?auto_8839 ?auto_8840 ) ( ON ?auto_8838 ?auto_8839 ) ( CLEAR ?auto_8838 ) ( ON ?auto_8837 ?auto_8841 ) ( CLEAR ?auto_8837 ) ( HAND-EMPTY ) ( not ( = ?auto_8837 ?auto_8841 ) ) ( not ( = ?auto_8838 ?auto_8841 ) ) ( not ( = ?auto_8839 ?auto_8841 ) ) ( not ( = ?auto_8840 ?auto_8841 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8837 ?auto_8841 )
      ( MAKE-4PILE ?auto_8837 ?auto_8838 ?auto_8839 ?auto_8840 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8842 - BLOCK
      ?auto_8843 - BLOCK
      ?auto_8844 - BLOCK
      ?auto_8845 - BLOCK
    )
    :vars
    (
      ?auto_8846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8842 ?auto_8843 ) ) ( not ( = ?auto_8842 ?auto_8844 ) ) ( not ( = ?auto_8842 ?auto_8845 ) ) ( not ( = ?auto_8843 ?auto_8844 ) ) ( not ( = ?auto_8843 ?auto_8845 ) ) ( not ( = ?auto_8844 ?auto_8845 ) ) ( ON-TABLE ?auto_8845 ) ( ON ?auto_8844 ?auto_8845 ) ( ON ?auto_8842 ?auto_8846 ) ( CLEAR ?auto_8842 ) ( not ( = ?auto_8842 ?auto_8846 ) ) ( not ( = ?auto_8843 ?auto_8846 ) ) ( not ( = ?auto_8844 ?auto_8846 ) ) ( not ( = ?auto_8845 ?auto_8846 ) ) ( HOLDING ?auto_8843 ) ( CLEAR ?auto_8844 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8845 ?auto_8844 ?auto_8843 )
      ( MAKE-4PILE ?auto_8842 ?auto_8843 ?auto_8844 ?auto_8845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8847 - BLOCK
      ?auto_8848 - BLOCK
      ?auto_8849 - BLOCK
      ?auto_8850 - BLOCK
    )
    :vars
    (
      ?auto_8851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8847 ?auto_8848 ) ) ( not ( = ?auto_8847 ?auto_8849 ) ) ( not ( = ?auto_8847 ?auto_8850 ) ) ( not ( = ?auto_8848 ?auto_8849 ) ) ( not ( = ?auto_8848 ?auto_8850 ) ) ( not ( = ?auto_8849 ?auto_8850 ) ) ( ON-TABLE ?auto_8850 ) ( ON ?auto_8849 ?auto_8850 ) ( ON ?auto_8847 ?auto_8851 ) ( not ( = ?auto_8847 ?auto_8851 ) ) ( not ( = ?auto_8848 ?auto_8851 ) ) ( not ( = ?auto_8849 ?auto_8851 ) ) ( not ( = ?auto_8850 ?auto_8851 ) ) ( CLEAR ?auto_8849 ) ( ON ?auto_8848 ?auto_8847 ) ( CLEAR ?auto_8848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8851 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8851 ?auto_8847 )
      ( MAKE-4PILE ?auto_8847 ?auto_8848 ?auto_8849 ?auto_8850 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8852 - BLOCK
      ?auto_8853 - BLOCK
      ?auto_8854 - BLOCK
      ?auto_8855 - BLOCK
    )
    :vars
    (
      ?auto_8856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8852 ?auto_8853 ) ) ( not ( = ?auto_8852 ?auto_8854 ) ) ( not ( = ?auto_8852 ?auto_8855 ) ) ( not ( = ?auto_8853 ?auto_8854 ) ) ( not ( = ?auto_8853 ?auto_8855 ) ) ( not ( = ?auto_8854 ?auto_8855 ) ) ( ON-TABLE ?auto_8855 ) ( ON ?auto_8852 ?auto_8856 ) ( not ( = ?auto_8852 ?auto_8856 ) ) ( not ( = ?auto_8853 ?auto_8856 ) ) ( not ( = ?auto_8854 ?auto_8856 ) ) ( not ( = ?auto_8855 ?auto_8856 ) ) ( ON ?auto_8853 ?auto_8852 ) ( CLEAR ?auto_8853 ) ( ON-TABLE ?auto_8856 ) ( HOLDING ?auto_8854 ) ( CLEAR ?auto_8855 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8855 ?auto_8854 )
      ( MAKE-4PILE ?auto_8852 ?auto_8853 ?auto_8854 ?auto_8855 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8857 - BLOCK
      ?auto_8858 - BLOCK
      ?auto_8859 - BLOCK
      ?auto_8860 - BLOCK
    )
    :vars
    (
      ?auto_8861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8857 ?auto_8858 ) ) ( not ( = ?auto_8857 ?auto_8859 ) ) ( not ( = ?auto_8857 ?auto_8860 ) ) ( not ( = ?auto_8858 ?auto_8859 ) ) ( not ( = ?auto_8858 ?auto_8860 ) ) ( not ( = ?auto_8859 ?auto_8860 ) ) ( ON-TABLE ?auto_8860 ) ( ON ?auto_8857 ?auto_8861 ) ( not ( = ?auto_8857 ?auto_8861 ) ) ( not ( = ?auto_8858 ?auto_8861 ) ) ( not ( = ?auto_8859 ?auto_8861 ) ) ( not ( = ?auto_8860 ?auto_8861 ) ) ( ON ?auto_8858 ?auto_8857 ) ( ON-TABLE ?auto_8861 ) ( CLEAR ?auto_8860 ) ( ON ?auto_8859 ?auto_8858 ) ( CLEAR ?auto_8859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8861 ?auto_8857 ?auto_8858 )
      ( MAKE-4PILE ?auto_8857 ?auto_8858 ?auto_8859 ?auto_8860 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8862 - BLOCK
      ?auto_8863 - BLOCK
      ?auto_8864 - BLOCK
      ?auto_8865 - BLOCK
    )
    :vars
    (
      ?auto_8866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8862 ?auto_8863 ) ) ( not ( = ?auto_8862 ?auto_8864 ) ) ( not ( = ?auto_8862 ?auto_8865 ) ) ( not ( = ?auto_8863 ?auto_8864 ) ) ( not ( = ?auto_8863 ?auto_8865 ) ) ( not ( = ?auto_8864 ?auto_8865 ) ) ( ON ?auto_8862 ?auto_8866 ) ( not ( = ?auto_8862 ?auto_8866 ) ) ( not ( = ?auto_8863 ?auto_8866 ) ) ( not ( = ?auto_8864 ?auto_8866 ) ) ( not ( = ?auto_8865 ?auto_8866 ) ) ( ON ?auto_8863 ?auto_8862 ) ( ON-TABLE ?auto_8866 ) ( ON ?auto_8864 ?auto_8863 ) ( CLEAR ?auto_8864 ) ( HOLDING ?auto_8865 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8865 )
      ( MAKE-4PILE ?auto_8862 ?auto_8863 ?auto_8864 ?auto_8865 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8867 - BLOCK
      ?auto_8868 - BLOCK
      ?auto_8869 - BLOCK
      ?auto_8870 - BLOCK
    )
    :vars
    (
      ?auto_8871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8867 ?auto_8868 ) ) ( not ( = ?auto_8867 ?auto_8869 ) ) ( not ( = ?auto_8867 ?auto_8870 ) ) ( not ( = ?auto_8868 ?auto_8869 ) ) ( not ( = ?auto_8868 ?auto_8870 ) ) ( not ( = ?auto_8869 ?auto_8870 ) ) ( ON ?auto_8867 ?auto_8871 ) ( not ( = ?auto_8867 ?auto_8871 ) ) ( not ( = ?auto_8868 ?auto_8871 ) ) ( not ( = ?auto_8869 ?auto_8871 ) ) ( not ( = ?auto_8870 ?auto_8871 ) ) ( ON ?auto_8868 ?auto_8867 ) ( ON-TABLE ?auto_8871 ) ( ON ?auto_8869 ?auto_8868 ) ( ON ?auto_8870 ?auto_8869 ) ( CLEAR ?auto_8870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8871 ?auto_8867 ?auto_8868 ?auto_8869 )
      ( MAKE-4PILE ?auto_8867 ?auto_8868 ?auto_8869 ?auto_8870 ) )
  )

)

