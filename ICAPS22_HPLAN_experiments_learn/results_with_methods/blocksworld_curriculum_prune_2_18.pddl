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
      ?auto_523 - BLOCK
    )
    :vars
    (
      ?auto_524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523 ?auto_524 ) ( CLEAR ?auto_523 ) ( HAND-EMPTY ) ( not ( = ?auto_523 ?auto_524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_523 ?auto_524 )
      ( !PUTDOWN ?auto_523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_530 - BLOCK
      ?auto_531 - BLOCK
    )
    :vars
    (
      ?auto_532 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_530 ) ( ON ?auto_531 ?auto_532 ) ( CLEAR ?auto_531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_530 ) ( not ( = ?auto_530 ?auto_531 ) ) ( not ( = ?auto_530 ?auto_532 ) ) ( not ( = ?auto_531 ?auto_532 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_531 ?auto_532 )
      ( !STACK ?auto_531 ?auto_530 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_535 - BLOCK
      ?auto_536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_535 ) ( ON-TABLE ?auto_536 ) ( CLEAR ?auto_536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_535 ) ( not ( = ?auto_535 ?auto_536 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_536 )
      ( !STACK ?auto_536 ?auto_535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_539 - BLOCK
      ?auto_540 - BLOCK
    )
    :vars
    (
      ?auto_541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540 ?auto_541 ) ( not ( = ?auto_539 ?auto_540 ) ) ( not ( = ?auto_539 ?auto_541 ) ) ( not ( = ?auto_540 ?auto_541 ) ) ( ON ?auto_539 ?auto_540 ) ( CLEAR ?auto_539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_539 )
      ( MAKE-2PILE ?auto_539 ?auto_540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_544 - BLOCK
      ?auto_545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_545 ) ( not ( = ?auto_544 ?auto_545 ) ) ( ON ?auto_544 ?auto_545 ) ( CLEAR ?auto_544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_544 )
      ( MAKE-2PILE ?auto_544 ?auto_545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_548 - BLOCK
      ?auto_549 - BLOCK
    )
    :vars
    (
      ?auto_550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_548 ?auto_549 ) ) ( ON ?auto_548 ?auto_550 ) ( not ( = ?auto_549 ?auto_550 ) ) ( not ( = ?auto_548 ?auto_550 ) ) ( ON ?auto_549 ?auto_548 ) ( CLEAR ?auto_549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_549 ?auto_548 )
      ( MAKE-2PILE ?auto_548 ?auto_549 ) )
  )

)

