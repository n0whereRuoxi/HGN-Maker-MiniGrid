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
      ?auto_262 - BLOCK
    )
    :vars
    (
      ?auto_263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_262 ?auto_263 ) ( CLEAR ?auto_262 ) ( HAND-EMPTY ) ( not ( = ?auto_262 ?auto_263 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_262 ?auto_263 )
      ( !PUTDOWN ?auto_262 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_269 - BLOCK
      ?auto_270 - BLOCK
    )
    :vars
    (
      ?auto_271 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_269 ) ( ON ?auto_270 ?auto_271 ) ( CLEAR ?auto_270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_269 ) ( not ( = ?auto_269 ?auto_270 ) ) ( not ( = ?auto_269 ?auto_271 ) ) ( not ( = ?auto_270 ?auto_271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_270 ?auto_271 )
      ( !STACK ?auto_270 ?auto_269 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_274 - BLOCK
      ?auto_275 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_274 ) ( ON-TABLE ?auto_275 ) ( CLEAR ?auto_275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_274 ) ( not ( = ?auto_274 ?auto_275 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_275 )
      ( !STACK ?auto_275 ?auto_274 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_278 - BLOCK
      ?auto_279 - BLOCK
    )
    :vars
    (
      ?auto_280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279 ?auto_280 ) ( not ( = ?auto_278 ?auto_279 ) ) ( not ( = ?auto_278 ?auto_280 ) ) ( not ( = ?auto_279 ?auto_280 ) ) ( ON ?auto_278 ?auto_279 ) ( CLEAR ?auto_278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_278 )
      ( MAKE-2PILE ?auto_278 ?auto_279 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_283 - BLOCK
      ?auto_284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_284 ) ( not ( = ?auto_283 ?auto_284 ) ) ( ON ?auto_283 ?auto_284 ) ( CLEAR ?auto_283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_283 )
      ( MAKE-2PILE ?auto_283 ?auto_284 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_287 - BLOCK
      ?auto_288 - BLOCK
    )
    :vars
    (
      ?auto_289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_287 ?auto_288 ) ) ( ON ?auto_287 ?auto_289 ) ( not ( = ?auto_288 ?auto_289 ) ) ( not ( = ?auto_287 ?auto_289 ) ) ( ON ?auto_288 ?auto_287 ) ( CLEAR ?auto_288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288 ?auto_287 )
      ( MAKE-2PILE ?auto_287 ?auto_288 ) )
  )

)

