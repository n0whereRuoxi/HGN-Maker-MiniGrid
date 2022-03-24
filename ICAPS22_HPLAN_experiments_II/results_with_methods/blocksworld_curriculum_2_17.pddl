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
      ?auto_494 - BLOCK
    )
    :vars
    (
      ?auto_495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494 ?auto_495 ) ( CLEAR ?auto_494 ) ( HAND-EMPTY ) ( not ( = ?auto_494 ?auto_495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_494 ?auto_495 )
      ( !PUTDOWN ?auto_494 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_497 - BLOCK
    )
    :vars
    (
      ?auto_498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_497 ?auto_498 ) ( CLEAR ?auto_497 ) ( HAND-EMPTY ) ( not ( = ?auto_497 ?auto_498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_497 ?auto_498 )
      ( !PUTDOWN ?auto_497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_501 - BLOCK
      ?auto_502 - BLOCK
    )
    :vars
    (
      ?auto_503 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_501 ) ( ON ?auto_502 ?auto_503 ) ( CLEAR ?auto_502 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_501 ) ( not ( = ?auto_501 ?auto_502 ) ) ( not ( = ?auto_501 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_503 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_502 ?auto_503 )
      ( !STACK ?auto_502 ?auto_501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_506 - BLOCK
      ?auto_507 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_506 ) ( ON-TABLE ?auto_507 ) ( CLEAR ?auto_507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_506 ) ( not ( = ?auto_506 ?auto_507 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_507 )
      ( !STACK ?auto_507 ?auto_506 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_510 - BLOCK
      ?auto_511 - BLOCK
    )
    :vars
    (
      ?auto_512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511 ?auto_512 ) ( not ( = ?auto_510 ?auto_511 ) ) ( not ( = ?auto_510 ?auto_512 ) ) ( not ( = ?auto_511 ?auto_512 ) ) ( ON ?auto_510 ?auto_511 ) ( CLEAR ?auto_510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_510 )
      ( MAKE-2PILE ?auto_510 ?auto_511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_515 - BLOCK
      ?auto_516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_516 ) ( not ( = ?auto_515 ?auto_516 ) ) ( ON ?auto_515 ?auto_516 ) ( CLEAR ?auto_515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_515 )
      ( MAKE-2PILE ?auto_515 ?auto_516 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_519 - BLOCK
      ?auto_520 - BLOCK
    )
    :vars
    (
      ?auto_521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_519 ?auto_520 ) ) ( ON ?auto_519 ?auto_521 ) ( not ( = ?auto_520 ?auto_521 ) ) ( not ( = ?auto_519 ?auto_521 ) ) ( ON ?auto_520 ?auto_519 ) ( CLEAR ?auto_520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_520 ?auto_519 )
      ( MAKE-2PILE ?auto_519 ?auto_520 ) )
  )

)

