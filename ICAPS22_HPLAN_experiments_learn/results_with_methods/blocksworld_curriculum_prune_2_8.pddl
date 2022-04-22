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
      ?auto_233 - BLOCK
    )
    :vars
    (
      ?auto_234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233 ?auto_234 ) ( CLEAR ?auto_233 ) ( HAND-EMPTY ) ( not ( = ?auto_233 ?auto_234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233 ?auto_234 )
      ( !PUTDOWN ?auto_233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_240 - BLOCK
      ?auto_241 - BLOCK
    )
    :vars
    (
      ?auto_242 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240 ) ( ON ?auto_241 ?auto_242 ) ( CLEAR ?auto_241 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240 ) ( not ( = ?auto_240 ?auto_241 ) ) ( not ( = ?auto_240 ?auto_242 ) ) ( not ( = ?auto_241 ?auto_242 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_241 ?auto_242 )
      ( !STACK ?auto_241 ?auto_240 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_245 - BLOCK
      ?auto_246 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_245 ) ( ON-TABLE ?auto_246 ) ( CLEAR ?auto_246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_245 ) ( not ( = ?auto_245 ?auto_246 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_246 )
      ( !STACK ?auto_246 ?auto_245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_249 - BLOCK
      ?auto_250 - BLOCK
    )
    :vars
    (
      ?auto_251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250 ?auto_251 ) ( not ( = ?auto_249 ?auto_250 ) ) ( not ( = ?auto_249 ?auto_251 ) ) ( not ( = ?auto_250 ?auto_251 ) ) ( ON ?auto_249 ?auto_250 ) ( CLEAR ?auto_249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_249 )
      ( MAKE-2PILE ?auto_249 ?auto_250 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_254 - BLOCK
      ?auto_255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_255 ) ( not ( = ?auto_254 ?auto_255 ) ) ( ON ?auto_254 ?auto_255 ) ( CLEAR ?auto_254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254 )
      ( MAKE-2PILE ?auto_254 ?auto_255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_258 - BLOCK
      ?auto_259 - BLOCK
    )
    :vars
    (
      ?auto_260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_258 ?auto_259 ) ) ( ON ?auto_258 ?auto_260 ) ( not ( = ?auto_259 ?auto_260 ) ) ( not ( = ?auto_258 ?auto_260 ) ) ( ON ?auto_259 ?auto_258 ) ( CLEAR ?auto_259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_259 ?auto_258 )
      ( MAKE-2PILE ?auto_258 ?auto_259 ) )
  )

)

