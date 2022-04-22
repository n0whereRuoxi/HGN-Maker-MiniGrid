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
      ?auto_117 - BLOCK
    )
    :vars
    (
      ?auto_118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117 ?auto_118 ) ( CLEAR ?auto_117 ) ( HAND-EMPTY ) ( not ( = ?auto_117 ?auto_118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117 ?auto_118 )
      ( !PUTDOWN ?auto_117 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120 - BLOCK
    )
    :vars
    (
      ?auto_121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120 ?auto_121 ) ( CLEAR ?auto_120 ) ( HAND-EMPTY ) ( not ( = ?auto_120 ?auto_121 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120 ?auto_121 )
      ( !PUTDOWN ?auto_120 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124 - BLOCK
      ?auto_125 - BLOCK
    )
    :vars
    (
      ?auto_126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124 ) ( ON ?auto_125 ?auto_126 ) ( CLEAR ?auto_125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124 ) ( not ( = ?auto_124 ?auto_125 ) ) ( not ( = ?auto_124 ?auto_126 ) ) ( not ( = ?auto_125 ?auto_126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125 ?auto_126 )
      ( !STACK ?auto_125 ?auto_124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129 - BLOCK
      ?auto_130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_129 ) ( ON-TABLE ?auto_130 ) ( CLEAR ?auto_130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129 ) ( not ( = ?auto_129 ?auto_130 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_130 )
      ( !STACK ?auto_130 ?auto_129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133 - BLOCK
      ?auto_134 - BLOCK
    )
    :vars
    (
      ?auto_135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134 ?auto_135 ) ( not ( = ?auto_133 ?auto_134 ) ) ( not ( = ?auto_133 ?auto_135 ) ) ( not ( = ?auto_134 ?auto_135 ) ) ( ON ?auto_133 ?auto_134 ) ( CLEAR ?auto_133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133 )
      ( MAKE-2PILE ?auto_133 ?auto_134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138 - BLOCK
      ?auto_139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139 ) ( not ( = ?auto_138 ?auto_139 ) ) ( ON ?auto_138 ?auto_139 ) ( CLEAR ?auto_138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138 )
      ( MAKE-2PILE ?auto_138 ?auto_139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142 - BLOCK
      ?auto_143 - BLOCK
    )
    :vars
    (
      ?auto_144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142 ?auto_143 ) ) ( ON ?auto_142 ?auto_144 ) ( not ( = ?auto_143 ?auto_144 ) ) ( not ( = ?auto_142 ?auto_144 ) ) ( ON ?auto_143 ?auto_142 ) ( CLEAR ?auto_143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143 ?auto_142 )
      ( MAKE-2PILE ?auto_142 ?auto_143 ) )
  )

)

