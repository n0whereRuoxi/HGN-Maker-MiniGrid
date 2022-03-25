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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_372 - BLOCK
      ?auto_373 - BLOCK
    )
    :vars
    (
      ?auto_374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374 ?auto_373 ) ( CLEAR ?auto_374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_372 ) ( ON ?auto_373 ?auto_372 ) ( not ( = ?auto_372 ?auto_373 ) ) ( not ( = ?auto_372 ?auto_374 ) ) ( not ( = ?auto_373 ?auto_374 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_374 ?auto_373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_376 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_376 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_376 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_377 - BLOCK
    )
    :vars
    (
      ?auto_378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_377 ?auto_378 ) ( CLEAR ?auto_377 ) ( HAND-EMPTY ) ( not ( = ?auto_377 ?auto_378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_377 ?auto_378 )
      ( MAKE-1PILE ?auto_377 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_380 - BLOCK
    )
    :vars
    (
      ?auto_381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381 ?auto_380 ) ( CLEAR ?auto_381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_380 ) ( not ( = ?auto_380 ?auto_381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381 ?auto_380 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_382 - BLOCK
    )
    :vars
    (
      ?auto_383 - BLOCK
      ?auto_384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383 ?auto_382 ) ( CLEAR ?auto_383 ) ( ON-TABLE ?auto_382 ) ( not ( = ?auto_382 ?auto_383 ) ) ( HOLDING ?auto_384 ) ( not ( = ?auto_382 ?auto_384 ) ) ( not ( = ?auto_383 ?auto_384 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_384 )
      ( MAKE-1PILE ?auto_382 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_385 - BLOCK
    )
    :vars
    (
      ?auto_386 - BLOCK
      ?auto_387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386 ?auto_385 ) ( ON-TABLE ?auto_385 ) ( not ( = ?auto_385 ?auto_386 ) ) ( not ( = ?auto_385 ?auto_387 ) ) ( not ( = ?auto_386 ?auto_387 ) ) ( ON ?auto_387 ?auto_386 ) ( CLEAR ?auto_387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_385 ?auto_386 )
      ( MAKE-1PILE ?auto_385 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_390 - BLOCK
      ?auto_391 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_391 ) ( CLEAR ?auto_390 ) ( ON-TABLE ?auto_390 ) ( not ( = ?auto_390 ?auto_391 ) ) )
    :subtasks
    ( ( !STACK ?auto_391 ?auto_390 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_392 - BLOCK
      ?auto_393 - BLOCK
    )
    :vars
    (
      ?auto_394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_392 ) ( ON-TABLE ?auto_392 ) ( not ( = ?auto_392 ?auto_393 ) ) ( ON ?auto_393 ?auto_394 ) ( CLEAR ?auto_393 ) ( HAND-EMPTY ) ( not ( = ?auto_392 ?auto_394 ) ) ( not ( = ?auto_393 ?auto_394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_393 ?auto_394 )
      ( MAKE-2PILE ?auto_392 ?auto_393 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_395 - BLOCK
      ?auto_396 - BLOCK
    )
    :vars
    (
      ?auto_397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_395 ?auto_396 ) ) ( ON ?auto_396 ?auto_397 ) ( CLEAR ?auto_396 ) ( not ( = ?auto_395 ?auto_397 ) ) ( not ( = ?auto_396 ?auto_397 ) ) ( HOLDING ?auto_395 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_395 )
      ( MAKE-2PILE ?auto_395 ?auto_396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_398 - BLOCK
      ?auto_399 - BLOCK
    )
    :vars
    (
      ?auto_400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_398 ?auto_399 ) ) ( ON ?auto_399 ?auto_400 ) ( not ( = ?auto_398 ?auto_400 ) ) ( not ( = ?auto_399 ?auto_400 ) ) ( ON ?auto_398 ?auto_399 ) ( CLEAR ?auto_398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_400 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_400 ?auto_399 )
      ( MAKE-2PILE ?auto_398 ?auto_399 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_417 - BLOCK
    )
    :vars
    (
      ?auto_418 - BLOCK
      ?auto_419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417 ?auto_418 ) ( CLEAR ?auto_417 ) ( not ( = ?auto_417 ?auto_418 ) ) ( HOLDING ?auto_419 ) ( not ( = ?auto_417 ?auto_419 ) ) ( not ( = ?auto_418 ?auto_419 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_419 )
      ( MAKE-1PILE ?auto_417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_420 - BLOCK
    )
    :vars
    (
      ?auto_421 - BLOCK
      ?auto_422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420 ?auto_421 ) ( not ( = ?auto_420 ?auto_421 ) ) ( not ( = ?auto_420 ?auto_422 ) ) ( not ( = ?auto_421 ?auto_422 ) ) ( ON ?auto_422 ?auto_420 ) ( CLEAR ?auto_422 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_421 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_421 ?auto_420 )
      ( MAKE-1PILE ?auto_420 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_427 - BLOCK
      ?auto_428 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_427 ) ( ON-TABLE ?auto_427 ) ( not ( = ?auto_427 ?auto_428 ) ) ( ON-TABLE ?auto_428 ) ( CLEAR ?auto_428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_428 )
      ( MAKE-2PILE ?auto_427 ?auto_428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_429 - BLOCK
      ?auto_430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_429 ?auto_430 ) ) ( ON-TABLE ?auto_430 ) ( CLEAR ?auto_430 ) ( HOLDING ?auto_429 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_429 )
      ( MAKE-2PILE ?auto_429 ?auto_430 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_431 - BLOCK
      ?auto_432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_431 ?auto_432 ) ) ( ON-TABLE ?auto_432 ) ( ON ?auto_431 ?auto_432 ) ( CLEAR ?auto_431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_432 )
      ( MAKE-2PILE ?auto_431 ?auto_432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_435 - BLOCK
      ?auto_436 - BLOCK
    )
    :vars
    (
      ?auto_437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_435 ?auto_436 ) ) ( ON-TABLE ?auto_436 ) ( CLEAR ?auto_436 ) ( ON ?auto_435 ?auto_437 ) ( CLEAR ?auto_435 ) ( HAND-EMPTY ) ( not ( = ?auto_435 ?auto_437 ) ) ( not ( = ?auto_436 ?auto_437 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_435 ?auto_437 )
      ( MAKE-2PILE ?auto_435 ?auto_436 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_438 - BLOCK
      ?auto_439 - BLOCK
    )
    :vars
    (
      ?auto_440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_438 ?auto_439 ) ) ( ON ?auto_438 ?auto_440 ) ( CLEAR ?auto_438 ) ( not ( = ?auto_438 ?auto_440 ) ) ( not ( = ?auto_439 ?auto_440 ) ) ( HOLDING ?auto_439 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_439 )
      ( MAKE-2PILE ?auto_438 ?auto_439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_441 - BLOCK
      ?auto_442 - BLOCK
    )
    :vars
    (
      ?auto_443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_441 ?auto_442 ) ) ( ON ?auto_441 ?auto_443 ) ( not ( = ?auto_441 ?auto_443 ) ) ( not ( = ?auto_442 ?auto_443 ) ) ( ON ?auto_442 ?auto_441 ) ( CLEAR ?auto_442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_443 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_443 ?auto_441 )
      ( MAKE-2PILE ?auto_441 ?auto_442 ) )
  )

)

