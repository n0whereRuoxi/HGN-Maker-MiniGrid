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
      ?auto_520 - BLOCK
      ?auto_521 - BLOCK
    )
    :vars
    (
      ?auto_522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522 ?auto_521 ) ( CLEAR ?auto_522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_520 ) ( ON ?auto_521 ?auto_520 ) ( not ( = ?auto_520 ?auto_521 ) ) ( not ( = ?auto_520 ?auto_522 ) ) ( not ( = ?auto_521 ?auto_522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_522 ?auto_521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_524 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_524 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_524 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_525 - BLOCK
    )
    :vars
    (
      ?auto_526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525 ?auto_526 ) ( CLEAR ?auto_525 ) ( HAND-EMPTY ) ( not ( = ?auto_525 ?auto_526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_525 ?auto_526 )
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
    )
    :precondition
    ( and ( ON ?auto_529 ?auto_528 ) ( CLEAR ?auto_529 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_528 ) ( not ( = ?auto_528 ?auto_529 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_529 ?auto_528 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_530 - BLOCK
    )
    :vars
    (
      ?auto_531 - BLOCK
      ?auto_532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531 ?auto_530 ) ( CLEAR ?auto_531 ) ( ON-TABLE ?auto_530 ) ( not ( = ?auto_530 ?auto_531 ) ) ( HOLDING ?auto_532 ) ( not ( = ?auto_530 ?auto_532 ) ) ( not ( = ?auto_531 ?auto_532 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_532 )
      ( MAKE-1PILE ?auto_530 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_533 - BLOCK
    )
    :vars
    (
      ?auto_535 - BLOCK
      ?auto_534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_535 ?auto_533 ) ( ON-TABLE ?auto_533 ) ( not ( = ?auto_533 ?auto_535 ) ) ( not ( = ?auto_533 ?auto_534 ) ) ( not ( = ?auto_535 ?auto_534 ) ) ( ON ?auto_534 ?auto_535 ) ( CLEAR ?auto_534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_533 ?auto_535 )
      ( MAKE-1PILE ?auto_533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_538 - BLOCK
      ?auto_539 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_539 ) ( CLEAR ?auto_538 ) ( ON-TABLE ?auto_538 ) ( not ( = ?auto_538 ?auto_539 ) ) )
    :subtasks
    ( ( !STACK ?auto_539 ?auto_538 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_540 - BLOCK
      ?auto_541 - BLOCK
    )
    :vars
    (
      ?auto_542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_540 ) ( ON-TABLE ?auto_540 ) ( not ( = ?auto_540 ?auto_541 ) ) ( ON ?auto_541 ?auto_542 ) ( CLEAR ?auto_541 ) ( HAND-EMPTY ) ( not ( = ?auto_540 ?auto_542 ) ) ( not ( = ?auto_541 ?auto_542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_541 ?auto_542 )
      ( MAKE-2PILE ?auto_540 ?auto_541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_543 - BLOCK
      ?auto_544 - BLOCK
    )
    :vars
    (
      ?auto_545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_543 ?auto_544 ) ) ( ON ?auto_544 ?auto_545 ) ( CLEAR ?auto_544 ) ( not ( = ?auto_543 ?auto_545 ) ) ( not ( = ?auto_544 ?auto_545 ) ) ( HOLDING ?auto_543 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_543 )
      ( MAKE-2PILE ?auto_543 ?auto_544 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_546 - BLOCK
      ?auto_547 - BLOCK
    )
    :vars
    (
      ?auto_548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_546 ?auto_547 ) ) ( ON ?auto_547 ?auto_548 ) ( not ( = ?auto_546 ?auto_548 ) ) ( not ( = ?auto_547 ?auto_548 ) ) ( ON ?auto_546 ?auto_547 ) ( CLEAR ?auto_546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_548 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_548 ?auto_547 )
      ( MAKE-2PILE ?auto_546 ?auto_547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_565 - BLOCK
    )
    :vars
    (
      ?auto_566 - BLOCK
      ?auto_567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565 ?auto_566 ) ( CLEAR ?auto_565 ) ( not ( = ?auto_565 ?auto_566 ) ) ( HOLDING ?auto_567 ) ( not ( = ?auto_565 ?auto_567 ) ) ( not ( = ?auto_566 ?auto_567 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_567 )
      ( MAKE-1PILE ?auto_565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_568 - BLOCK
    )
    :vars
    (
      ?auto_569 - BLOCK
      ?auto_570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568 ?auto_569 ) ( not ( = ?auto_568 ?auto_569 ) ) ( not ( = ?auto_568 ?auto_570 ) ) ( not ( = ?auto_569 ?auto_570 ) ) ( ON ?auto_570 ?auto_568 ) ( CLEAR ?auto_570 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_569 ?auto_568 )
      ( MAKE-1PILE ?auto_568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_575 - BLOCK
      ?auto_576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_575 ) ( ON-TABLE ?auto_575 ) ( not ( = ?auto_575 ?auto_576 ) ) ( ON-TABLE ?auto_576 ) ( CLEAR ?auto_576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_576 )
      ( MAKE-2PILE ?auto_575 ?auto_576 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_577 - BLOCK
      ?auto_578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_577 ?auto_578 ) ) ( ON-TABLE ?auto_578 ) ( CLEAR ?auto_578 ) ( HOLDING ?auto_577 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_577 )
      ( MAKE-2PILE ?auto_577 ?auto_578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_579 - BLOCK
      ?auto_580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_579 ?auto_580 ) ) ( ON-TABLE ?auto_580 ) ( ON ?auto_579 ?auto_580 ) ( CLEAR ?auto_579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_580 )
      ( MAKE-2PILE ?auto_579 ?auto_580 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_583 - BLOCK
      ?auto_584 - BLOCK
    )
    :vars
    (
      ?auto_585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_583 ?auto_584 ) ) ( ON-TABLE ?auto_584 ) ( CLEAR ?auto_584 ) ( ON ?auto_583 ?auto_585 ) ( CLEAR ?auto_583 ) ( HAND-EMPTY ) ( not ( = ?auto_583 ?auto_585 ) ) ( not ( = ?auto_584 ?auto_585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_583 ?auto_585 )
      ( MAKE-2PILE ?auto_583 ?auto_584 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_586 - BLOCK
      ?auto_587 - BLOCK
    )
    :vars
    (
      ?auto_588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_586 ?auto_587 ) ) ( ON ?auto_586 ?auto_588 ) ( CLEAR ?auto_586 ) ( not ( = ?auto_586 ?auto_588 ) ) ( not ( = ?auto_587 ?auto_588 ) ) ( HOLDING ?auto_587 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_587 )
      ( MAKE-2PILE ?auto_586 ?auto_587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_589 - BLOCK
      ?auto_590 - BLOCK
    )
    :vars
    (
      ?auto_591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_589 ?auto_590 ) ) ( ON ?auto_589 ?auto_591 ) ( not ( = ?auto_589 ?auto_591 ) ) ( not ( = ?auto_590 ?auto_591 ) ) ( ON ?auto_590 ?auto_589 ) ( CLEAR ?auto_590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_591 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_591 ?auto_589 )
      ( MAKE-2PILE ?auto_589 ?auto_590 ) )
  )

)

