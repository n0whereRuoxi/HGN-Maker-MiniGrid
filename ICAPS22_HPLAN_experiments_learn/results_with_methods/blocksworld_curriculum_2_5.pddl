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
      ?auto_146 - BLOCK
    )
    :vars
    (
      ?auto_147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146 ?auto_147 ) ( CLEAR ?auto_146 ) ( HAND-EMPTY ) ( not ( = ?auto_146 ?auto_147 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146 ?auto_147 )
      ( !PUTDOWN ?auto_146 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149 - BLOCK
    )
    :vars
    (
      ?auto_150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149 ?auto_150 ) ( CLEAR ?auto_149 ) ( HAND-EMPTY ) ( not ( = ?auto_149 ?auto_150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149 ?auto_150 )
      ( !PUTDOWN ?auto_149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153 - BLOCK
      ?auto_154 - BLOCK
    )
    :vars
    (
      ?auto_155 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_153 ) ( ON ?auto_154 ?auto_155 ) ( CLEAR ?auto_154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153 ) ( not ( = ?auto_153 ?auto_154 ) ) ( not ( = ?auto_153 ?auto_155 ) ) ( not ( = ?auto_154 ?auto_155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154 ?auto_155 )
      ( !STACK ?auto_154 ?auto_153 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158 - BLOCK
      ?auto_159 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158 ) ( ON-TABLE ?auto_159 ) ( CLEAR ?auto_159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158 ) ( not ( = ?auto_158 ?auto_159 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_159 )
      ( !STACK ?auto_159 ?auto_158 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162 - BLOCK
      ?auto_163 - BLOCK
    )
    :vars
    (
      ?auto_164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163 ?auto_164 ) ( not ( = ?auto_162 ?auto_163 ) ) ( not ( = ?auto_162 ?auto_164 ) ) ( not ( = ?auto_163 ?auto_164 ) ) ( ON ?auto_162 ?auto_163 ) ( CLEAR ?auto_162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162 )
      ( MAKE-2PILE ?auto_162 ?auto_163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167 - BLOCK
      ?auto_168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168 ) ( not ( = ?auto_167 ?auto_168 ) ) ( ON ?auto_167 ?auto_168 ) ( CLEAR ?auto_167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167 )
      ( MAKE-2PILE ?auto_167 ?auto_168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171 - BLOCK
      ?auto_172 - BLOCK
    )
    :vars
    (
      ?auto_173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171 ?auto_172 ) ) ( ON ?auto_171 ?auto_173 ) ( not ( = ?auto_172 ?auto_173 ) ) ( not ( = ?auto_171 ?auto_173 ) ) ( ON ?auto_172 ?auto_171 ) ( CLEAR ?auto_172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172 ?auto_171 )
      ( MAKE-2PILE ?auto_171 ?auto_172 ) )
  )

)

