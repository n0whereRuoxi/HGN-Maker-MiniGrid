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
      ?auto_488 - BLOCK
      ?auto_489 - BLOCK
    )
    :vars
    (
      ?auto_490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490 ?auto_489 ) ( CLEAR ?auto_490 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_488 ) ( ON ?auto_489 ?auto_488 ) ( not ( = ?auto_488 ?auto_489 ) ) ( not ( = ?auto_488 ?auto_490 ) ) ( not ( = ?auto_489 ?auto_490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_490 ?auto_489 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_492 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_492 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_493 - BLOCK
    )
    :vars
    (
      ?auto_494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493 ?auto_494 ) ( CLEAR ?auto_493 ) ( HAND-EMPTY ) ( not ( = ?auto_493 ?auto_494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_493 ?auto_494 )
      ( MAKE-1PILE ?auto_493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_496 - BLOCK
    )
    :vars
    (
      ?auto_497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497 ?auto_496 ) ( CLEAR ?auto_497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_496 ) ( not ( = ?auto_496 ?auto_497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_497 ?auto_496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_498 - BLOCK
    )
    :vars
    (
      ?auto_499 - BLOCK
      ?auto_500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_499 ?auto_498 ) ( CLEAR ?auto_499 ) ( ON-TABLE ?auto_498 ) ( not ( = ?auto_498 ?auto_499 ) ) ( HOLDING ?auto_500 ) ( not ( = ?auto_498 ?auto_500 ) ) ( not ( = ?auto_499 ?auto_500 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_500 )
      ( MAKE-1PILE ?auto_498 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_501 - BLOCK
    )
    :vars
    (
      ?auto_502 - BLOCK
      ?auto_503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502 ?auto_501 ) ( ON-TABLE ?auto_501 ) ( not ( = ?auto_501 ?auto_502 ) ) ( not ( = ?auto_501 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_503 ) ) ( ON ?auto_503 ?auto_502 ) ( CLEAR ?auto_503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_501 ?auto_502 )
      ( MAKE-1PILE ?auto_501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_506 - BLOCK
      ?auto_507 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_507 ) ( CLEAR ?auto_506 ) ( ON-TABLE ?auto_506 ) ( not ( = ?auto_506 ?auto_507 ) ) )
    :subtasks
    ( ( !STACK ?auto_507 ?auto_506 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_508 - BLOCK
      ?auto_509 - BLOCK
    )
    :vars
    (
      ?auto_510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_508 ) ( ON-TABLE ?auto_508 ) ( not ( = ?auto_508 ?auto_509 ) ) ( ON ?auto_509 ?auto_510 ) ( CLEAR ?auto_509 ) ( HAND-EMPTY ) ( not ( = ?auto_508 ?auto_510 ) ) ( not ( = ?auto_509 ?auto_510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_509 ?auto_510 )
      ( MAKE-2PILE ?auto_508 ?auto_509 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_511 - BLOCK
      ?auto_512 - BLOCK
    )
    :vars
    (
      ?auto_513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_511 ?auto_512 ) ) ( ON ?auto_512 ?auto_513 ) ( CLEAR ?auto_512 ) ( not ( = ?auto_511 ?auto_513 ) ) ( not ( = ?auto_512 ?auto_513 ) ) ( HOLDING ?auto_511 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_511 )
      ( MAKE-2PILE ?auto_511 ?auto_512 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_514 - BLOCK
      ?auto_515 - BLOCK
    )
    :vars
    (
      ?auto_516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_514 ?auto_515 ) ) ( ON ?auto_515 ?auto_516 ) ( not ( = ?auto_514 ?auto_516 ) ) ( not ( = ?auto_515 ?auto_516 ) ) ( ON ?auto_514 ?auto_515 ) ( CLEAR ?auto_514 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_516 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_516 ?auto_515 )
      ( MAKE-2PILE ?auto_514 ?auto_515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_518 - BLOCK
    )
    :vars
    (
      ?auto_519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519 ?auto_518 ) ( CLEAR ?auto_519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_518 ) ( not ( = ?auto_518 ?auto_519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_519 ?auto_518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_525 - BLOCK
    )
    :vars
    (
      ?auto_526 - BLOCK
      ?auto_527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_525 ?auto_526 ) ) ( ON ?auto_526 ?auto_527 ) ( CLEAR ?auto_526 ) ( not ( = ?auto_525 ?auto_527 ) ) ( not ( = ?auto_526 ?auto_527 ) ) ( HOLDING ?auto_525 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_525 ?auto_526 )
      ( MAKE-1PILE ?auto_525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_528 - BLOCK
    )
    :vars
    (
      ?auto_529 - BLOCK
      ?auto_530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_528 ?auto_529 ) ) ( ON ?auto_529 ?auto_530 ) ( not ( = ?auto_528 ?auto_530 ) ) ( not ( = ?auto_529 ?auto_530 ) ) ( ON ?auto_528 ?auto_529 ) ( CLEAR ?auto_528 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_530 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_530 ?auto_529 )
      ( MAKE-1PILE ?auto_528 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_532 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_532 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_533 - BLOCK
    )
    :vars
    (
      ?auto_534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533 ?auto_534 ) ( CLEAR ?auto_533 ) ( HAND-EMPTY ) ( not ( = ?auto_533 ?auto_534 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_533 ?auto_534 )
      ( MAKE-1PILE ?auto_533 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_535 - BLOCK
    )
    :vars
    (
      ?auto_536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_535 ?auto_536 ) ) ( HOLDING ?auto_535 ) ( CLEAR ?auto_536 ) ( ON-TABLE ?auto_536 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_536 ?auto_535 )
      ( MAKE-1PILE ?auto_535 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_537 - BLOCK
    )
    :vars
    (
      ?auto_538 - BLOCK
      ?auto_539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_537 ?auto_538 ) ) ( CLEAR ?auto_538 ) ( ON-TABLE ?auto_538 ) ( ON ?auto_537 ?auto_539 ) ( CLEAR ?auto_537 ) ( HAND-EMPTY ) ( not ( = ?auto_537 ?auto_539 ) ) ( not ( = ?auto_538 ?auto_539 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_537 ?auto_539 )
      ( MAKE-1PILE ?auto_537 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_540 - BLOCK
    )
    :vars
    (
      ?auto_542 - BLOCK
      ?auto_541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_540 ?auto_542 ) ) ( ON ?auto_540 ?auto_541 ) ( CLEAR ?auto_540 ) ( not ( = ?auto_540 ?auto_541 ) ) ( not ( = ?auto_542 ?auto_541 ) ) ( HOLDING ?auto_542 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_542 )
      ( MAKE-1PILE ?auto_540 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_543 - BLOCK
    )
    :vars
    (
      ?auto_545 - BLOCK
      ?auto_544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_543 ?auto_545 ) ) ( ON ?auto_543 ?auto_544 ) ( not ( = ?auto_543 ?auto_544 ) ) ( not ( = ?auto_545 ?auto_544 ) ) ( ON ?auto_545 ?auto_543 ) ( CLEAR ?auto_545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_544 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_544 ?auto_543 )
      ( MAKE-1PILE ?auto_543 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_548 - BLOCK
      ?auto_549 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_549 ) ( CLEAR ?auto_548 ) ( ON-TABLE ?auto_548 ) ( not ( = ?auto_548 ?auto_549 ) ) )
    :subtasks
    ( ( !STACK ?auto_549 ?auto_548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_550 - BLOCK
      ?auto_551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_550 ) ( ON-TABLE ?auto_550 ) ( not ( = ?auto_550 ?auto_551 ) ) ( ON-TABLE ?auto_551 ) ( CLEAR ?auto_551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_551 )
      ( MAKE-2PILE ?auto_550 ?auto_551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_552 - BLOCK
      ?auto_553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_552 ?auto_553 ) ) ( ON-TABLE ?auto_553 ) ( CLEAR ?auto_553 ) ( HOLDING ?auto_552 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_552 )
      ( MAKE-2PILE ?auto_552 ?auto_553 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_554 - BLOCK
      ?auto_555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_554 ?auto_555 ) ) ( ON-TABLE ?auto_555 ) ( ON ?auto_554 ?auto_555 ) ( CLEAR ?auto_554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_555 )
      ( MAKE-2PILE ?auto_554 ?auto_555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_556 - BLOCK
      ?auto_557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_556 ?auto_557 ) ) ( ON-TABLE ?auto_557 ) ( HOLDING ?auto_556 ) ( CLEAR ?auto_557 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_557 ?auto_556 )
      ( MAKE-2PILE ?auto_556 ?auto_557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_558 - BLOCK
      ?auto_559 - BLOCK
    )
    :vars
    (
      ?auto_560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_558 ?auto_559 ) ) ( ON-TABLE ?auto_559 ) ( CLEAR ?auto_559 ) ( ON ?auto_558 ?auto_560 ) ( CLEAR ?auto_558 ) ( HAND-EMPTY ) ( not ( = ?auto_558 ?auto_560 ) ) ( not ( = ?auto_559 ?auto_560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_558 ?auto_560 )
      ( MAKE-2PILE ?auto_558 ?auto_559 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_561 - BLOCK
      ?auto_562 - BLOCK
    )
    :vars
    (
      ?auto_563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_561 ?auto_562 ) ) ( ON ?auto_561 ?auto_563 ) ( CLEAR ?auto_561 ) ( not ( = ?auto_561 ?auto_563 ) ) ( not ( = ?auto_562 ?auto_563 ) ) ( HOLDING ?auto_562 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_562 )
      ( MAKE-2PILE ?auto_561 ?auto_562 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_564 - BLOCK
      ?auto_565 - BLOCK
    )
    :vars
    (
      ?auto_566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_564 ?auto_565 ) ) ( ON ?auto_564 ?auto_566 ) ( not ( = ?auto_564 ?auto_566 ) ) ( not ( = ?auto_565 ?auto_566 ) ) ( ON ?auto_565 ?auto_564 ) ( CLEAR ?auto_565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_566 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_566 ?auto_564 )
      ( MAKE-2PILE ?auto_564 ?auto_565 ) )
  )

)

