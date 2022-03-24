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
      ?auto_465 - BLOCK
    )
    :vars
    (
      ?auto_466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465 ?auto_466 ) ( CLEAR ?auto_465 ) ( HAND-EMPTY ) ( not ( = ?auto_465 ?auto_466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_465 ?auto_466 )
      ( !PUTDOWN ?auto_465 ) )
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
    ( and ( CLEAR ?auto_472 ) ( ON ?auto_473 ?auto_474 ) ( CLEAR ?auto_473 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_472 ) ( not ( = ?auto_472 ?auto_473 ) ) ( not ( = ?auto_472 ?auto_474 ) ) ( not ( = ?auto_473 ?auto_474 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_473 ?auto_474 )
      ( !STACK ?auto_473 ?auto_472 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_477 - BLOCK
      ?auto_478 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_477 ) ( ON-TABLE ?auto_478 ) ( CLEAR ?auto_478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_477 ) ( not ( = ?auto_477 ?auto_478 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_478 )
      ( !STACK ?auto_478 ?auto_477 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_481 - BLOCK
      ?auto_482 - BLOCK
    )
    :vars
    (
      ?auto_483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482 ?auto_483 ) ( not ( = ?auto_481 ?auto_482 ) ) ( not ( = ?auto_481 ?auto_483 ) ) ( not ( = ?auto_482 ?auto_483 ) ) ( ON ?auto_481 ?auto_482 ) ( CLEAR ?auto_481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_481 )
      ( MAKE-2PILE ?auto_481 ?auto_482 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_486 - BLOCK
      ?auto_487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_487 ) ( not ( = ?auto_486 ?auto_487 ) ) ( ON ?auto_486 ?auto_487 ) ( CLEAR ?auto_486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_486 )
      ( MAKE-2PILE ?auto_486 ?auto_487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_490 - BLOCK
      ?auto_491 - BLOCK
    )
    :vars
    (
      ?auto_492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_490 ?auto_491 ) ) ( ON ?auto_490 ?auto_492 ) ( not ( = ?auto_491 ?auto_492 ) ) ( not ( = ?auto_490 ?auto_492 ) ) ( ON ?auto_491 ?auto_490 ) ( CLEAR ?auto_491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_491 ?auto_490 )
      ( MAKE-2PILE ?auto_490 ?auto_491 ) )
  )

)

