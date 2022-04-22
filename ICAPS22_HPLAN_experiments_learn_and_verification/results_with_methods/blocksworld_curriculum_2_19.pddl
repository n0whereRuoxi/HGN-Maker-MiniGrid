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
      ?auto_552 - BLOCK
    )
    :vars
    (
      ?auto_553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552 ?auto_553 ) ( CLEAR ?auto_552 ) ( HAND-EMPTY ) ( not ( = ?auto_552 ?auto_553 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_552 ?auto_553 )
      ( !PUTDOWN ?auto_552 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_555 - BLOCK
    )
    :vars
    (
      ?auto_556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555 ?auto_556 ) ( CLEAR ?auto_555 ) ( HAND-EMPTY ) ( not ( = ?auto_555 ?auto_556 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_555 ?auto_556 )
      ( !PUTDOWN ?auto_555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_559 - BLOCK
      ?auto_560 - BLOCK
    )
    :vars
    (
      ?auto_561 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_559 ) ( ON ?auto_560 ?auto_561 ) ( CLEAR ?auto_560 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_559 ) ( not ( = ?auto_559 ?auto_560 ) ) ( not ( = ?auto_559 ?auto_561 ) ) ( not ( = ?auto_560 ?auto_561 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_560 ?auto_561 )
      ( !STACK ?auto_560 ?auto_559 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_564 - BLOCK
      ?auto_565 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_564 ) ( ON-TABLE ?auto_565 ) ( CLEAR ?auto_565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_564 ) ( not ( = ?auto_564 ?auto_565 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_565 )
      ( !STACK ?auto_565 ?auto_564 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_568 - BLOCK
      ?auto_569 - BLOCK
    )
    :vars
    (
      ?auto_570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569 ?auto_570 ) ( not ( = ?auto_568 ?auto_569 ) ) ( not ( = ?auto_568 ?auto_570 ) ) ( not ( = ?auto_569 ?auto_570 ) ) ( ON ?auto_568 ?auto_569 ) ( CLEAR ?auto_568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_568 )
      ( MAKE-2PILE ?auto_568 ?auto_569 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_573 - BLOCK
      ?auto_574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_574 ) ( not ( = ?auto_573 ?auto_574 ) ) ( ON ?auto_573 ?auto_574 ) ( CLEAR ?auto_573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_573 )
      ( MAKE-2PILE ?auto_573 ?auto_574 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_577 - BLOCK
      ?auto_578 - BLOCK
    )
    :vars
    (
      ?auto_579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_577 ?auto_578 ) ) ( ON ?auto_577 ?auto_579 ) ( not ( = ?auto_578 ?auto_579 ) ) ( not ( = ?auto_577 ?auto_579 ) ) ( ON ?auto_578 ?auto_577 ) ( CLEAR ?auto_578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_578 ?auto_577 )
      ( MAKE-2PILE ?auto_577 ?auto_578 ) )
  )

)

