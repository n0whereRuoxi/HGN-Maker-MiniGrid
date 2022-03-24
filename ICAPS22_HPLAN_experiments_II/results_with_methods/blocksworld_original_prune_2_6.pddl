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
      ?auto_446 - BLOCK
      ?auto_447 - BLOCK
    )
    :vars
    (
      ?auto_448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448 ?auto_447 ) ( CLEAR ?auto_448 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_446 ) ( ON ?auto_447 ?auto_446 ) ( not ( = ?auto_446 ?auto_447 ) ) ( not ( = ?auto_446 ?auto_448 ) ) ( not ( = ?auto_447 ?auto_448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_448 ?auto_447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_450 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_450 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_450 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_451 - BLOCK
    )
    :vars
    (
      ?auto_452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451 ?auto_452 ) ( CLEAR ?auto_451 ) ( HAND-EMPTY ) ( not ( = ?auto_451 ?auto_452 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_451 ?auto_452 )
      ( MAKE-1PILE ?auto_451 ) )
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
    ( and ( ON ?auto_455 ?auto_454 ) ( CLEAR ?auto_455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_454 ) ( not ( = ?auto_454 ?auto_455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_455 ?auto_454 ) )
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
    ( and ( ON ?auto_457 ?auto_456 ) ( CLEAR ?auto_457 ) ( ON-TABLE ?auto_456 ) ( not ( = ?auto_456 ?auto_457 ) ) ( HOLDING ?auto_458 ) ( not ( = ?auto_456 ?auto_458 ) ) ( not ( = ?auto_457 ?auto_458 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_458 )
      ( MAKE-1PILE ?auto_456 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_459 - BLOCK
    )
    :vars
    (
      ?auto_461 - BLOCK
      ?auto_460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_461 ?auto_459 ) ( ON-TABLE ?auto_459 ) ( not ( = ?auto_459 ?auto_461 ) ) ( not ( = ?auto_459 ?auto_460 ) ) ( not ( = ?auto_461 ?auto_460 ) ) ( ON ?auto_460 ?auto_461 ) ( CLEAR ?auto_460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_459 ?auto_461 )
      ( MAKE-1PILE ?auto_459 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_464 - BLOCK
      ?auto_465 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_465 ) ( CLEAR ?auto_464 ) ( ON-TABLE ?auto_464 ) ( not ( = ?auto_464 ?auto_465 ) ) )
    :subtasks
    ( ( !STACK ?auto_465 ?auto_464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_466 - BLOCK
      ?auto_467 - BLOCK
    )
    :vars
    (
      ?auto_468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_466 ) ( ON-TABLE ?auto_466 ) ( not ( = ?auto_466 ?auto_467 ) ) ( ON ?auto_467 ?auto_468 ) ( CLEAR ?auto_467 ) ( HAND-EMPTY ) ( not ( = ?auto_466 ?auto_468 ) ) ( not ( = ?auto_467 ?auto_468 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_467 ?auto_468 )
      ( MAKE-2PILE ?auto_466 ?auto_467 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_469 - BLOCK
      ?auto_470 - BLOCK
    )
    :vars
    (
      ?auto_471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_469 ?auto_470 ) ) ( ON ?auto_470 ?auto_471 ) ( CLEAR ?auto_470 ) ( not ( = ?auto_469 ?auto_471 ) ) ( not ( = ?auto_470 ?auto_471 ) ) ( HOLDING ?auto_469 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_469 )
      ( MAKE-2PILE ?auto_469 ?auto_470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_472 - BLOCK
      ?auto_473 - BLOCK
    )
    :vars
    (
      ?auto_474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_472 ?auto_473 ) ) ( ON ?auto_473 ?auto_474 ) ( not ( = ?auto_472 ?auto_474 ) ) ( not ( = ?auto_473 ?auto_474 ) ) ( ON ?auto_472 ?auto_473 ) ( CLEAR ?auto_472 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_474 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_474 ?auto_473 )
      ( MAKE-2PILE ?auto_472 ?auto_473 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_491 - BLOCK
    )
    :vars
    (
      ?auto_492 - BLOCK
      ?auto_493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491 ?auto_492 ) ( CLEAR ?auto_491 ) ( not ( = ?auto_491 ?auto_492 ) ) ( HOLDING ?auto_493 ) ( not ( = ?auto_491 ?auto_493 ) ) ( not ( = ?auto_492 ?auto_493 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_493 )
      ( MAKE-1PILE ?auto_491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_494 - BLOCK
    )
    :vars
    (
      ?auto_496 - BLOCK
      ?auto_495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494 ?auto_496 ) ( not ( = ?auto_494 ?auto_496 ) ) ( not ( = ?auto_494 ?auto_495 ) ) ( not ( = ?auto_496 ?auto_495 ) ) ( ON ?auto_495 ?auto_494 ) ( CLEAR ?auto_495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_496 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_496 ?auto_494 )
      ( MAKE-1PILE ?auto_494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_501 - BLOCK
      ?auto_502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_501 ) ( ON-TABLE ?auto_501 ) ( not ( = ?auto_501 ?auto_502 ) ) ( ON-TABLE ?auto_502 ) ( CLEAR ?auto_502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_502 )
      ( MAKE-2PILE ?auto_501 ?auto_502 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_503 - BLOCK
      ?auto_504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_503 ?auto_504 ) ) ( ON-TABLE ?auto_504 ) ( CLEAR ?auto_504 ) ( HOLDING ?auto_503 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_503 )
      ( MAKE-2PILE ?auto_503 ?auto_504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_505 - BLOCK
      ?auto_506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_505 ?auto_506 ) ) ( ON-TABLE ?auto_506 ) ( ON ?auto_505 ?auto_506 ) ( CLEAR ?auto_505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_506 )
      ( MAKE-2PILE ?auto_505 ?auto_506 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_509 - BLOCK
      ?auto_510 - BLOCK
    )
    :vars
    (
      ?auto_511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_509 ?auto_510 ) ) ( ON-TABLE ?auto_510 ) ( CLEAR ?auto_510 ) ( ON ?auto_509 ?auto_511 ) ( CLEAR ?auto_509 ) ( HAND-EMPTY ) ( not ( = ?auto_509 ?auto_511 ) ) ( not ( = ?auto_510 ?auto_511 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_509 ?auto_511 )
      ( MAKE-2PILE ?auto_509 ?auto_510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_512 - BLOCK
      ?auto_513 - BLOCK
    )
    :vars
    (
      ?auto_514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_512 ?auto_513 ) ) ( ON ?auto_512 ?auto_514 ) ( CLEAR ?auto_512 ) ( not ( = ?auto_512 ?auto_514 ) ) ( not ( = ?auto_513 ?auto_514 ) ) ( HOLDING ?auto_513 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_513 )
      ( MAKE-2PILE ?auto_512 ?auto_513 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_515 - BLOCK
      ?auto_516 - BLOCK
    )
    :vars
    (
      ?auto_517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_515 ?auto_516 ) ) ( ON ?auto_515 ?auto_517 ) ( not ( = ?auto_515 ?auto_517 ) ) ( not ( = ?auto_516 ?auto_517 ) ) ( ON ?auto_516 ?auto_515 ) ( CLEAR ?auto_516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_517 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_517 ?auto_515 )
      ( MAKE-2PILE ?auto_515 ?auto_516 ) )
  )

)

