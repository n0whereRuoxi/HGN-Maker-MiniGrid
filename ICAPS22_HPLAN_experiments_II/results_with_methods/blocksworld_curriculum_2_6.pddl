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
      ?auto_175 - BLOCK
    )
    :vars
    (
      ?auto_176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175 ?auto_176 ) ( CLEAR ?auto_175 ) ( HAND-EMPTY ) ( not ( = ?auto_175 ?auto_176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175 ?auto_176 )
      ( !PUTDOWN ?auto_175 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178 - BLOCK
    )
    :vars
    (
      ?auto_179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178 ?auto_179 ) ( CLEAR ?auto_178 ) ( HAND-EMPTY ) ( not ( = ?auto_178 ?auto_179 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178 ?auto_179 )
      ( !PUTDOWN ?auto_178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182 - BLOCK
      ?auto_183 - BLOCK
    )
    :vars
    (
      ?auto_184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_182 ) ( ON ?auto_183 ?auto_184 ) ( CLEAR ?auto_183 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182 ) ( not ( = ?auto_182 ?auto_183 ) ) ( not ( = ?auto_182 ?auto_184 ) ) ( not ( = ?auto_183 ?auto_184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183 ?auto_184 )
      ( !STACK ?auto_183 ?auto_182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187 - BLOCK
      ?auto_188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187 ) ( ON-TABLE ?auto_188 ) ( CLEAR ?auto_188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187 ) ( not ( = ?auto_187 ?auto_188 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_188 )
      ( !STACK ?auto_188 ?auto_187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_191 - BLOCK
      ?auto_192 - BLOCK
    )
    :vars
    (
      ?auto_193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192 ?auto_193 ) ( not ( = ?auto_191 ?auto_192 ) ) ( not ( = ?auto_191 ?auto_193 ) ) ( not ( = ?auto_192 ?auto_193 ) ) ( ON ?auto_191 ?auto_192 ) ( CLEAR ?auto_191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191 )
      ( MAKE-2PILE ?auto_191 ?auto_192 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196 - BLOCK
      ?auto_197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197 ) ( not ( = ?auto_196 ?auto_197 ) ) ( ON ?auto_196 ?auto_197 ) ( CLEAR ?auto_196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196 )
      ( MAKE-2PILE ?auto_196 ?auto_197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_200 - BLOCK
      ?auto_201 - BLOCK
    )
    :vars
    (
      ?auto_202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200 ?auto_201 ) ) ( ON ?auto_200 ?auto_202 ) ( not ( = ?auto_201 ?auto_202 ) ) ( not ( = ?auto_200 ?auto_202 ) ) ( ON ?auto_201 ?auto_200 ) ( CLEAR ?auto_201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201 ?auto_200 )
      ( MAKE-2PILE ?auto_200 ?auto_201 ) )
  )

)

