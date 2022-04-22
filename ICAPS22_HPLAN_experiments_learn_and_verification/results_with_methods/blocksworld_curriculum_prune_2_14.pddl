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
      ?auto_407 - BLOCK
    )
    :vars
    (
      ?auto_408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407 ?auto_408 ) ( CLEAR ?auto_407 ) ( HAND-EMPTY ) ( not ( = ?auto_407 ?auto_408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407 ?auto_408 )
      ( !PUTDOWN ?auto_407 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_414 - BLOCK
      ?auto_415 - BLOCK
    )
    :vars
    (
      ?auto_416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_414 ) ( ON ?auto_415 ?auto_416 ) ( CLEAR ?auto_415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_414 ) ( not ( = ?auto_414 ?auto_415 ) ) ( not ( = ?auto_414 ?auto_416 ) ) ( not ( = ?auto_415 ?auto_416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_415 ?auto_416 )
      ( !STACK ?auto_415 ?auto_414 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_419 - BLOCK
      ?auto_420 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_419 ) ( ON-TABLE ?auto_420 ) ( CLEAR ?auto_420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_419 ) ( not ( = ?auto_419 ?auto_420 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_420 )
      ( !STACK ?auto_420 ?auto_419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_423 - BLOCK
      ?auto_424 - BLOCK
    )
    :vars
    (
      ?auto_425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_424 ?auto_425 ) ( not ( = ?auto_423 ?auto_424 ) ) ( not ( = ?auto_423 ?auto_425 ) ) ( not ( = ?auto_424 ?auto_425 ) ) ( ON ?auto_423 ?auto_424 ) ( CLEAR ?auto_423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423 )
      ( MAKE-2PILE ?auto_423 ?auto_424 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_428 - BLOCK
      ?auto_429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_429 ) ( not ( = ?auto_428 ?auto_429 ) ) ( ON ?auto_428 ?auto_429 ) ( CLEAR ?auto_428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428 )
      ( MAKE-2PILE ?auto_428 ?auto_429 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_432 - BLOCK
      ?auto_433 - BLOCK
    )
    :vars
    (
      ?auto_434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_432 ?auto_433 ) ) ( ON ?auto_432 ?auto_434 ) ( not ( = ?auto_433 ?auto_434 ) ) ( not ( = ?auto_432 ?auto_434 ) ) ( ON ?auto_433 ?auto_432 ) ( CLEAR ?auto_433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433 ?auto_432 )
      ( MAKE-2PILE ?auto_432 ?auto_433 ) )
  )

)

