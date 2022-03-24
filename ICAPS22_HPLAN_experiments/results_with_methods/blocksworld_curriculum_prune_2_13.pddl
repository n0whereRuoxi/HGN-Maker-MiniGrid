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
      ?auto_378 - BLOCK
    )
    :vars
    (
      ?auto_379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_378 ?auto_379 ) ( CLEAR ?auto_378 ) ( HAND-EMPTY ) ( not ( = ?auto_378 ?auto_379 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_378 ?auto_379 )
      ( !PUTDOWN ?auto_378 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_385 - BLOCK
      ?auto_386 - BLOCK
    )
    :vars
    (
      ?auto_387 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_385 ) ( ON ?auto_386 ?auto_387 ) ( CLEAR ?auto_386 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_385 ) ( not ( = ?auto_385 ?auto_386 ) ) ( not ( = ?auto_385 ?auto_387 ) ) ( not ( = ?auto_386 ?auto_387 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386 ?auto_387 )
      ( !STACK ?auto_386 ?auto_385 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_390 - BLOCK
      ?auto_391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_390 ) ( ON-TABLE ?auto_391 ) ( CLEAR ?auto_391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_390 ) ( not ( = ?auto_390 ?auto_391 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_391 )
      ( !STACK ?auto_391 ?auto_390 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_394 - BLOCK
      ?auto_395 - BLOCK
    )
    :vars
    (
      ?auto_396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_395 ?auto_396 ) ( not ( = ?auto_394 ?auto_395 ) ) ( not ( = ?auto_394 ?auto_396 ) ) ( not ( = ?auto_395 ?auto_396 ) ) ( ON ?auto_394 ?auto_395 ) ( CLEAR ?auto_394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_394 )
      ( MAKE-2PILE ?auto_394 ?auto_395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_399 - BLOCK
      ?auto_400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_400 ) ( not ( = ?auto_399 ?auto_400 ) ) ( ON ?auto_399 ?auto_400 ) ( CLEAR ?auto_399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_399 )
      ( MAKE-2PILE ?auto_399 ?auto_400 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_403 - BLOCK
      ?auto_404 - BLOCK
    )
    :vars
    (
      ?auto_405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_403 ?auto_404 ) ) ( ON ?auto_403 ?auto_405 ) ( not ( = ?auto_404 ?auto_405 ) ) ( not ( = ?auto_403 ?auto_405 ) ) ( ON ?auto_404 ?auto_403 ) ( CLEAR ?auto_404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_404 ?auto_403 )
      ( MAKE-2PILE ?auto_403 ?auto_404 ) )
  )

)

