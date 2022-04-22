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
      ?auto_407 - BLOCK
      ?auto_408 - BLOCK
    )
    :vars
    (
      ?auto_409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409 ?auto_408 ) ( CLEAR ?auto_409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407 ) ( ON ?auto_408 ?auto_407 ) ( not ( = ?auto_407 ?auto_408 ) ) ( not ( = ?auto_407 ?auto_409 ) ) ( not ( = ?auto_408 ?auto_409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_409 ?auto_408 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_411 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_411 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_412 - BLOCK
    )
    :vars
    (
      ?auto_413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412 ?auto_413 ) ( CLEAR ?auto_412 ) ( HAND-EMPTY ) ( not ( = ?auto_412 ?auto_413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412 ?auto_413 )
      ( MAKE-1PILE ?auto_412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_415 - BLOCK
    )
    :vars
    (
      ?auto_416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416 ?auto_415 ) ( CLEAR ?auto_416 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_415 ) ( not ( = ?auto_415 ?auto_416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_416 ?auto_415 ) )
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
    ( and ( ON ?auto_418 ?auto_417 ) ( CLEAR ?auto_418 ) ( ON-TABLE ?auto_417 ) ( not ( = ?auto_417 ?auto_418 ) ) ( HOLDING ?auto_419 ) ( not ( = ?auto_417 ?auto_419 ) ) ( not ( = ?auto_418 ?auto_419 ) ) )
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
    ( and ( ON ?auto_421 ?auto_420 ) ( ON-TABLE ?auto_420 ) ( not ( = ?auto_420 ?auto_421 ) ) ( not ( = ?auto_420 ?auto_422 ) ) ( not ( = ?auto_421 ?auto_422 ) ) ( ON ?auto_422 ?auto_421 ) ( CLEAR ?auto_422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_420 ?auto_421 )
      ( MAKE-1PILE ?auto_420 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_425 - BLOCK
      ?auto_426 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_426 ) ( CLEAR ?auto_425 ) ( ON-TABLE ?auto_425 ) ( not ( = ?auto_425 ?auto_426 ) ) )
    :subtasks
    ( ( !STACK ?auto_426 ?auto_425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_427 - BLOCK
      ?auto_428 - BLOCK
    )
    :vars
    (
      ?auto_429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_427 ) ( ON-TABLE ?auto_427 ) ( not ( = ?auto_427 ?auto_428 ) ) ( ON ?auto_428 ?auto_429 ) ( CLEAR ?auto_428 ) ( HAND-EMPTY ) ( not ( = ?auto_427 ?auto_429 ) ) ( not ( = ?auto_428 ?auto_429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428 ?auto_429 )
      ( MAKE-2PILE ?auto_427 ?auto_428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_430 - BLOCK
      ?auto_431 - BLOCK
    )
    :vars
    (
      ?auto_432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_430 ?auto_431 ) ) ( ON ?auto_431 ?auto_432 ) ( CLEAR ?auto_431 ) ( not ( = ?auto_430 ?auto_432 ) ) ( not ( = ?auto_431 ?auto_432 ) ) ( HOLDING ?auto_430 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_430 )
      ( MAKE-2PILE ?auto_430 ?auto_431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_433 - BLOCK
      ?auto_434 - BLOCK
    )
    :vars
    (
      ?auto_435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_433 ?auto_434 ) ) ( ON ?auto_434 ?auto_435 ) ( not ( = ?auto_433 ?auto_435 ) ) ( not ( = ?auto_434 ?auto_435 ) ) ( ON ?auto_433 ?auto_434 ) ( CLEAR ?auto_433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_435 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_435 ?auto_434 )
      ( MAKE-2PILE ?auto_433 ?auto_434 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_437 - BLOCK
    )
    :vars
    (
      ?auto_438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438 ?auto_437 ) ( CLEAR ?auto_438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_437 ) ( not ( = ?auto_437 ?auto_438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_438 ?auto_437 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_444 - BLOCK
    )
    :vars
    (
      ?auto_445 - BLOCK
      ?auto_446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_444 ?auto_445 ) ) ( ON ?auto_445 ?auto_446 ) ( CLEAR ?auto_445 ) ( not ( = ?auto_444 ?auto_446 ) ) ( not ( = ?auto_445 ?auto_446 ) ) ( HOLDING ?auto_444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_444 ?auto_445 )
      ( MAKE-1PILE ?auto_444 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_447 - BLOCK
    )
    :vars
    (
      ?auto_449 - BLOCK
      ?auto_448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_447 ?auto_449 ) ) ( ON ?auto_449 ?auto_448 ) ( not ( = ?auto_447 ?auto_448 ) ) ( not ( = ?auto_449 ?auto_448 ) ) ( ON ?auto_447 ?auto_449 ) ( CLEAR ?auto_447 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_448 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_448 ?auto_449 )
      ( MAKE-1PILE ?auto_447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_451 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_451 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_451 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_452 - BLOCK
    )
    :vars
    (
      ?auto_453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452 ?auto_453 ) ( CLEAR ?auto_452 ) ( HAND-EMPTY ) ( not ( = ?auto_452 ?auto_453 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_452 ?auto_453 )
      ( MAKE-1PILE ?auto_452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_454 - BLOCK
    )
    :vars
    (
      ?auto_455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_454 ?auto_455 ) ) ( HOLDING ?auto_454 ) ( CLEAR ?auto_455 ) ( ON-TABLE ?auto_455 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_455 ?auto_454 )
      ( MAKE-1PILE ?auto_454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_456 - BLOCK
    )
    :vars
    (
      ?auto_457 - BLOCK
      ?auto_458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_456 ?auto_457 ) ) ( CLEAR ?auto_457 ) ( ON-TABLE ?auto_457 ) ( ON ?auto_456 ?auto_458 ) ( CLEAR ?auto_456 ) ( HAND-EMPTY ) ( not ( = ?auto_456 ?auto_458 ) ) ( not ( = ?auto_457 ?auto_458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_456 ?auto_458 )
      ( MAKE-1PILE ?auto_456 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_459 - BLOCK
    )
    :vars
    (
      ?auto_460 - BLOCK
      ?auto_461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_459 ?auto_460 ) ) ( ON ?auto_459 ?auto_461 ) ( CLEAR ?auto_459 ) ( not ( = ?auto_459 ?auto_461 ) ) ( not ( = ?auto_460 ?auto_461 ) ) ( HOLDING ?auto_460 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_460 )
      ( MAKE-1PILE ?auto_459 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_462 - BLOCK
    )
    :vars
    (
      ?auto_463 - BLOCK
      ?auto_464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_462 ?auto_463 ) ) ( ON ?auto_462 ?auto_464 ) ( not ( = ?auto_462 ?auto_464 ) ) ( not ( = ?auto_463 ?auto_464 ) ) ( ON ?auto_463 ?auto_462 ) ( CLEAR ?auto_463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_464 ?auto_462 )
      ( MAKE-1PILE ?auto_462 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_467 - BLOCK
      ?auto_468 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_468 ) ( CLEAR ?auto_467 ) ( ON-TABLE ?auto_467 ) ( not ( = ?auto_467 ?auto_468 ) ) )
    :subtasks
    ( ( !STACK ?auto_468 ?auto_467 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_469 - BLOCK
      ?auto_470 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_469 ) ( ON-TABLE ?auto_469 ) ( not ( = ?auto_469 ?auto_470 ) ) ( ON-TABLE ?auto_470 ) ( CLEAR ?auto_470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_470 )
      ( MAKE-2PILE ?auto_469 ?auto_470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_471 - BLOCK
      ?auto_472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_471 ?auto_472 ) ) ( ON-TABLE ?auto_472 ) ( CLEAR ?auto_472 ) ( HOLDING ?auto_471 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_471 )
      ( MAKE-2PILE ?auto_471 ?auto_472 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_473 - BLOCK
      ?auto_474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_473 ?auto_474 ) ) ( ON-TABLE ?auto_474 ) ( ON ?auto_473 ?auto_474 ) ( CLEAR ?auto_473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_474 )
      ( MAKE-2PILE ?auto_473 ?auto_474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_475 - BLOCK
      ?auto_476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_475 ?auto_476 ) ) ( ON-TABLE ?auto_476 ) ( HOLDING ?auto_475 ) ( CLEAR ?auto_476 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_476 ?auto_475 )
      ( MAKE-2PILE ?auto_475 ?auto_476 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_477 - BLOCK
      ?auto_478 - BLOCK
    )
    :vars
    (
      ?auto_479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_477 ?auto_478 ) ) ( ON-TABLE ?auto_478 ) ( CLEAR ?auto_478 ) ( ON ?auto_477 ?auto_479 ) ( CLEAR ?auto_477 ) ( HAND-EMPTY ) ( not ( = ?auto_477 ?auto_479 ) ) ( not ( = ?auto_478 ?auto_479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_477 ?auto_479 )
      ( MAKE-2PILE ?auto_477 ?auto_478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_480 - BLOCK
      ?auto_481 - BLOCK
    )
    :vars
    (
      ?auto_482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_480 ?auto_481 ) ) ( ON ?auto_480 ?auto_482 ) ( CLEAR ?auto_480 ) ( not ( = ?auto_480 ?auto_482 ) ) ( not ( = ?auto_481 ?auto_482 ) ) ( HOLDING ?auto_481 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_481 )
      ( MAKE-2PILE ?auto_480 ?auto_481 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_483 - BLOCK
      ?auto_484 - BLOCK
    )
    :vars
    (
      ?auto_485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_483 ?auto_484 ) ) ( ON ?auto_483 ?auto_485 ) ( not ( = ?auto_483 ?auto_485 ) ) ( not ( = ?auto_484 ?auto_485 ) ) ( ON ?auto_484 ?auto_483 ) ( CLEAR ?auto_484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_485 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_485 ?auto_483 )
      ( MAKE-2PILE ?auto_483 ?auto_484 ) )
  )

)

