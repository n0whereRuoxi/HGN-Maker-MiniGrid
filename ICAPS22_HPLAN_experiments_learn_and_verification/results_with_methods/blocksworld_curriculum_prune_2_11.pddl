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
      ?auto_320 - BLOCK
    )
    :vars
    (
      ?auto_321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320 ?auto_321 ) ( CLEAR ?auto_320 ) ( HAND-EMPTY ) ( not ( = ?auto_320 ?auto_321 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_320 ?auto_321 )
      ( !PUTDOWN ?auto_320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_327 - BLOCK
      ?auto_328 - BLOCK
    )
    :vars
    (
      ?auto_329 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_327 ) ( ON ?auto_328 ?auto_329 ) ( CLEAR ?auto_328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_327 ) ( not ( = ?auto_327 ?auto_328 ) ) ( not ( = ?auto_327 ?auto_329 ) ) ( not ( = ?auto_328 ?auto_329 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_328 ?auto_329 )
      ( !STACK ?auto_328 ?auto_327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_332 - BLOCK
      ?auto_333 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_332 ) ( ON-TABLE ?auto_333 ) ( CLEAR ?auto_333 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_332 ) ( not ( = ?auto_332 ?auto_333 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_333 )
      ( !STACK ?auto_333 ?auto_332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_336 - BLOCK
      ?auto_337 - BLOCK
    )
    :vars
    (
      ?auto_338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337 ?auto_338 ) ( not ( = ?auto_336 ?auto_337 ) ) ( not ( = ?auto_336 ?auto_338 ) ) ( not ( = ?auto_337 ?auto_338 ) ) ( ON ?auto_336 ?auto_337 ) ( CLEAR ?auto_336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_336 )
      ( MAKE-2PILE ?auto_336 ?auto_337 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_341 - BLOCK
      ?auto_342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_342 ) ( not ( = ?auto_341 ?auto_342 ) ) ( ON ?auto_341 ?auto_342 ) ( CLEAR ?auto_341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_341 )
      ( MAKE-2PILE ?auto_341 ?auto_342 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_345 - BLOCK
      ?auto_346 - BLOCK
    )
    :vars
    (
      ?auto_347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_345 ?auto_346 ) ) ( ON ?auto_345 ?auto_347 ) ( not ( = ?auto_346 ?auto_347 ) ) ( not ( = ?auto_345 ?auto_347 ) ) ( ON ?auto_346 ?auto_345 ) ( CLEAR ?auto_346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_346 ?auto_345 )
      ( MAKE-2PILE ?auto_345 ?auto_346 ) )
  )

)

