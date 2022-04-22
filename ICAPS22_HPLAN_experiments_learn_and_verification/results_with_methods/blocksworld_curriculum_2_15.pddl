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
      ?auto_436 - BLOCK
    )
    :vars
    (
      ?auto_437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436 ?auto_437 ) ( CLEAR ?auto_436 ) ( HAND-EMPTY ) ( not ( = ?auto_436 ?auto_437 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_436 ?auto_437 )
      ( !PUTDOWN ?auto_436 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_439 - BLOCK
    )
    :vars
    (
      ?auto_440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_439 ?auto_440 ) ( CLEAR ?auto_439 ) ( HAND-EMPTY ) ( not ( = ?auto_439 ?auto_440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_439 ?auto_440 )
      ( !PUTDOWN ?auto_439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_443 - BLOCK
      ?auto_444 - BLOCK
    )
    :vars
    (
      ?auto_445 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_443 ) ( ON ?auto_444 ?auto_445 ) ( CLEAR ?auto_444 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_443 ) ( not ( = ?auto_443 ?auto_444 ) ) ( not ( = ?auto_443 ?auto_445 ) ) ( not ( = ?auto_444 ?auto_445 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_444 ?auto_445 )
      ( !STACK ?auto_444 ?auto_443 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_448 - BLOCK
      ?auto_449 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_448 ) ( ON-TABLE ?auto_449 ) ( CLEAR ?auto_449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_448 ) ( not ( = ?auto_448 ?auto_449 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_449 )
      ( !STACK ?auto_449 ?auto_448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_452 - BLOCK
      ?auto_453 - BLOCK
    )
    :vars
    (
      ?auto_454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453 ?auto_454 ) ( not ( = ?auto_452 ?auto_453 ) ) ( not ( = ?auto_452 ?auto_454 ) ) ( not ( = ?auto_453 ?auto_454 ) ) ( ON ?auto_452 ?auto_453 ) ( CLEAR ?auto_452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_452 )
      ( MAKE-2PILE ?auto_452 ?auto_453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_457 - BLOCK
      ?auto_458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_458 ) ( not ( = ?auto_457 ?auto_458 ) ) ( ON ?auto_457 ?auto_458 ) ( CLEAR ?auto_457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_457 )
      ( MAKE-2PILE ?auto_457 ?auto_458 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_461 - BLOCK
      ?auto_462 - BLOCK
    )
    :vars
    (
      ?auto_463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_461 ?auto_462 ) ) ( ON ?auto_461 ?auto_463 ) ( not ( = ?auto_462 ?auto_463 ) ) ( not ( = ?auto_461 ?auto_463 ) ) ( ON ?auto_462 ?auto_461 ) ( CLEAR ?auto_462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_462 ?auto_461 )
      ( MAKE-2PILE ?auto_461 ?auto_462 ) )
  )

)

