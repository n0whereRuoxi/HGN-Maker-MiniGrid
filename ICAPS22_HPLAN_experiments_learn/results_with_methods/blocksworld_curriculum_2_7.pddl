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
      ?auto_204 - BLOCK
    )
    :vars
    (
      ?auto_205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204 ?auto_205 ) ( CLEAR ?auto_204 ) ( HAND-EMPTY ) ( not ( = ?auto_204 ?auto_205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204 ?auto_205 )
      ( !PUTDOWN ?auto_204 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_207 - BLOCK
    )
    :vars
    (
      ?auto_208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207 ?auto_208 ) ( CLEAR ?auto_207 ) ( HAND-EMPTY ) ( not ( = ?auto_207 ?auto_208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207 ?auto_208 )
      ( !PUTDOWN ?auto_207 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211 - BLOCK
      ?auto_212 - BLOCK
    )
    :vars
    (
      ?auto_213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_211 ) ( ON ?auto_212 ?auto_213 ) ( CLEAR ?auto_212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211 ) ( not ( = ?auto_211 ?auto_212 ) ) ( not ( = ?auto_211 ?auto_213 ) ) ( not ( = ?auto_212 ?auto_213 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212 ?auto_213 )
      ( !STACK ?auto_212 ?auto_211 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216 - BLOCK
      ?auto_217 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216 ) ( ON-TABLE ?auto_217 ) ( CLEAR ?auto_217 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216 ) ( not ( = ?auto_216 ?auto_217 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_217 )
      ( !STACK ?auto_217 ?auto_216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_220 - BLOCK
      ?auto_221 - BLOCK
    )
    :vars
    (
      ?auto_222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221 ?auto_222 ) ( not ( = ?auto_220 ?auto_221 ) ) ( not ( = ?auto_220 ?auto_222 ) ) ( not ( = ?auto_221 ?auto_222 ) ) ( ON ?auto_220 ?auto_221 ) ( CLEAR ?auto_220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_220 )
      ( MAKE-2PILE ?auto_220 ?auto_221 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_225 - BLOCK
      ?auto_226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_226 ) ( not ( = ?auto_225 ?auto_226 ) ) ( ON ?auto_225 ?auto_226 ) ( CLEAR ?auto_225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_225 )
      ( MAKE-2PILE ?auto_225 ?auto_226 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_229 - BLOCK
      ?auto_230 - BLOCK
    )
    :vars
    (
      ?auto_231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_229 ?auto_230 ) ) ( ON ?auto_229 ?auto_231 ) ( not ( = ?auto_230 ?auto_231 ) ) ( not ( = ?auto_229 ?auto_231 ) ) ( ON ?auto_230 ?auto_229 ) ( CLEAR ?auto_230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_230 ?auto_229 )
      ( MAKE-2PILE ?auto_229 ?auto_230 ) )
  )

)

