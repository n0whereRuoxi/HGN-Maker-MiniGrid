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
      ?auto_291 - BLOCK
    )
    :vars
    (
      ?auto_292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291 ?auto_292 ) ( CLEAR ?auto_291 ) ( HAND-EMPTY ) ( not ( = ?auto_291 ?auto_292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_291 ?auto_292 )
      ( !PUTDOWN ?auto_291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_298 - BLOCK
      ?auto_299 - BLOCK
    )
    :vars
    (
      ?auto_300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_298 ) ( ON ?auto_299 ?auto_300 ) ( CLEAR ?auto_299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_298 ) ( not ( = ?auto_298 ?auto_299 ) ) ( not ( = ?auto_298 ?auto_300 ) ) ( not ( = ?auto_299 ?auto_300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_299 ?auto_300 )
      ( !STACK ?auto_299 ?auto_298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_303 - BLOCK
      ?auto_304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_303 ) ( ON-TABLE ?auto_304 ) ( CLEAR ?auto_304 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_303 ) ( not ( = ?auto_303 ?auto_304 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_304 )
      ( !STACK ?auto_304 ?auto_303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_307 - BLOCK
      ?auto_308 - BLOCK
    )
    :vars
    (
      ?auto_309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308 ?auto_309 ) ( not ( = ?auto_307 ?auto_308 ) ) ( not ( = ?auto_307 ?auto_309 ) ) ( not ( = ?auto_308 ?auto_309 ) ) ( ON ?auto_307 ?auto_308 ) ( CLEAR ?auto_307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_307 )
      ( MAKE-2PILE ?auto_307 ?auto_308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_312 - BLOCK
      ?auto_313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_313 ) ( not ( = ?auto_312 ?auto_313 ) ) ( ON ?auto_312 ?auto_313 ) ( CLEAR ?auto_312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_312 )
      ( MAKE-2PILE ?auto_312 ?auto_313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_316 - BLOCK
      ?auto_317 - BLOCK
    )
    :vars
    (
      ?auto_318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_316 ?auto_317 ) ) ( ON ?auto_316 ?auto_318 ) ( not ( = ?auto_317 ?auto_318 ) ) ( not ( = ?auto_316 ?auto_318 ) ) ( ON ?auto_317 ?auto_316 ) ( CLEAR ?auto_317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_317 ?auto_316 )
      ( MAKE-2PILE ?auto_316 ?auto_317 ) )
  )

)

