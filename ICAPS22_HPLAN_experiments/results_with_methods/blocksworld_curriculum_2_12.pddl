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
      ?auto_349 - BLOCK
    )
    :vars
    (
      ?auto_350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349 ?auto_350 ) ( CLEAR ?auto_349 ) ( HAND-EMPTY ) ( not ( = ?auto_349 ?auto_350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_349 ?auto_350 )
      ( !PUTDOWN ?auto_349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_352 - BLOCK
    )
    :vars
    (
      ?auto_353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_352 ?auto_353 ) ( CLEAR ?auto_352 ) ( HAND-EMPTY ) ( not ( = ?auto_352 ?auto_353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_352 ?auto_353 )
      ( !PUTDOWN ?auto_352 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_356 - BLOCK
      ?auto_357 - BLOCK
    )
    :vars
    (
      ?auto_358 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_356 ) ( ON ?auto_357 ?auto_358 ) ( CLEAR ?auto_357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_356 ) ( not ( = ?auto_356 ?auto_357 ) ) ( not ( = ?auto_356 ?auto_358 ) ) ( not ( = ?auto_357 ?auto_358 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_357 ?auto_358 )
      ( !STACK ?auto_357 ?auto_356 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_361 - BLOCK
      ?auto_362 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_361 ) ( ON-TABLE ?auto_362 ) ( CLEAR ?auto_362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_361 ) ( not ( = ?auto_361 ?auto_362 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_362 )
      ( !STACK ?auto_362 ?auto_361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_365 - BLOCK
      ?auto_366 - BLOCK
    )
    :vars
    (
      ?auto_367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366 ?auto_367 ) ( not ( = ?auto_365 ?auto_366 ) ) ( not ( = ?auto_365 ?auto_367 ) ) ( not ( = ?auto_366 ?auto_367 ) ) ( ON ?auto_365 ?auto_366 ) ( CLEAR ?auto_365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_365 )
      ( MAKE-2PILE ?auto_365 ?auto_366 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_370 - BLOCK
      ?auto_371 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_371 ) ( not ( = ?auto_370 ?auto_371 ) ) ( ON ?auto_370 ?auto_371 ) ( CLEAR ?auto_370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_370 )
      ( MAKE-2PILE ?auto_370 ?auto_371 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_374 - BLOCK
      ?auto_375 - BLOCK
    )
    :vars
    (
      ?auto_376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_374 ?auto_375 ) ) ( ON ?auto_374 ?auto_376 ) ( not ( = ?auto_375 ?auto_376 ) ) ( not ( = ?auto_374 ?auto_376 ) ) ( ON ?auto_375 ?auto_374 ) ( CLEAR ?auto_375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_375 ?auto_374 )
      ( MAKE-2PILE ?auto_374 ?auto_375 ) )
  )

)

