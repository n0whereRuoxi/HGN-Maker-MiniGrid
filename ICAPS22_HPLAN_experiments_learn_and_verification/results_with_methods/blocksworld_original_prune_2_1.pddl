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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76 - BLOCK
      ?auto_77 - BLOCK
    )
    :vars
    (
      ?auto_78 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78 ?auto_77 ) ( CLEAR ?auto_78 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76 ) ( ON ?auto_77 ?auto_76 ) ( not ( = ?auto_76 ?auto_77 ) ) ( not ( = ?auto_76 ?auto_78 ) ) ( not ( = ?auto_77 ?auto_78 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78 ?auto_77 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_80 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_80 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81 - BLOCK
    )
    :vars
    (
      ?auto_82 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81 ?auto_82 ) ( CLEAR ?auto_81 ) ( HAND-EMPTY ) ( not ( = ?auto_81 ?auto_82 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81 ?auto_82 )
      ( MAKE-1PILE ?auto_81 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84 - BLOCK
    )
    :vars
    (
      ?auto_85 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85 ?auto_84 ) ( CLEAR ?auto_85 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84 ) ( not ( = ?auto_84 ?auto_85 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85 ?auto_84 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86 - BLOCK
    )
    :vars
    (
      ?auto_87 - BLOCK
      ?auto_88 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87 ?auto_86 ) ( CLEAR ?auto_87 ) ( ON-TABLE ?auto_86 ) ( not ( = ?auto_86 ?auto_87 ) ) ( HOLDING ?auto_88 ) ( not ( = ?auto_86 ?auto_88 ) ) ( not ( = ?auto_87 ?auto_88 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_88 )
      ( MAKE-1PILE ?auto_86 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89 - BLOCK
    )
    :vars
    (
      ?auto_91 - BLOCK
      ?auto_90 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91 ?auto_89 ) ( ON-TABLE ?auto_89 ) ( not ( = ?auto_89 ?auto_91 ) ) ( not ( = ?auto_89 ?auto_90 ) ) ( not ( = ?auto_91 ?auto_90 ) ) ( ON ?auto_90 ?auto_91 ) ( CLEAR ?auto_90 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89 ?auto_91 )
      ( MAKE-1PILE ?auto_89 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94 - BLOCK
      ?auto_95 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_95 ) ( CLEAR ?auto_94 ) ( ON-TABLE ?auto_94 ) ( not ( = ?auto_94 ?auto_95 ) ) )
    :subtasks
    ( ( !STACK ?auto_95 ?auto_94 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96 - BLOCK
      ?auto_97 - BLOCK
    )
    :vars
    (
      ?auto_98 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96 ) ( ON-TABLE ?auto_96 ) ( not ( = ?auto_96 ?auto_97 ) ) ( ON ?auto_97 ?auto_98 ) ( CLEAR ?auto_97 ) ( HAND-EMPTY ) ( not ( = ?auto_96 ?auto_98 ) ) ( not ( = ?auto_97 ?auto_98 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97 ?auto_98 )
      ( MAKE-2PILE ?auto_96 ?auto_97 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99 - BLOCK
      ?auto_100 - BLOCK
    )
    :vars
    (
      ?auto_101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99 ?auto_100 ) ) ( ON ?auto_100 ?auto_101 ) ( CLEAR ?auto_100 ) ( not ( = ?auto_99 ?auto_101 ) ) ( not ( = ?auto_100 ?auto_101 ) ) ( HOLDING ?auto_99 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99 )
      ( MAKE-2PILE ?auto_99 ?auto_100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102 - BLOCK
      ?auto_103 - BLOCK
    )
    :vars
    (
      ?auto_104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102 ?auto_103 ) ) ( ON ?auto_103 ?auto_104 ) ( not ( = ?auto_102 ?auto_104 ) ) ( not ( = ?auto_103 ?auto_104 ) ) ( ON ?auto_102 ?auto_103 ) ( CLEAR ?auto_102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104 ?auto_103 )
      ( MAKE-2PILE ?auto_102 ?auto_103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121 - BLOCK
    )
    :vars
    (
      ?auto_122 - BLOCK
      ?auto_123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121 ?auto_122 ) ( CLEAR ?auto_121 ) ( not ( = ?auto_121 ?auto_122 ) ) ( HOLDING ?auto_123 ) ( not ( = ?auto_121 ?auto_123 ) ) ( not ( = ?auto_122 ?auto_123 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_123 )
      ( MAKE-1PILE ?auto_121 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124 - BLOCK
    )
    :vars
    (
      ?auto_125 - BLOCK
      ?auto_126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124 ?auto_125 ) ( not ( = ?auto_124 ?auto_125 ) ) ( not ( = ?auto_124 ?auto_126 ) ) ( not ( = ?auto_125 ?auto_126 ) ) ( ON ?auto_126 ?auto_124 ) ( CLEAR ?auto_126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125 ?auto_124 )
      ( MAKE-1PILE ?auto_124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131 - BLOCK
      ?auto_132 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_131 ) ( ON-TABLE ?auto_131 ) ( not ( = ?auto_131 ?auto_132 ) ) ( ON-TABLE ?auto_132 ) ( CLEAR ?auto_132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_132 )
      ( MAKE-2PILE ?auto_131 ?auto_132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133 - BLOCK
      ?auto_134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133 ?auto_134 ) ) ( ON-TABLE ?auto_134 ) ( CLEAR ?auto_134 ) ( HOLDING ?auto_133 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133 )
      ( MAKE-2PILE ?auto_133 ?auto_134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135 - BLOCK
      ?auto_136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135 ?auto_136 ) ) ( ON-TABLE ?auto_136 ) ( ON ?auto_135 ?auto_136 ) ( CLEAR ?auto_135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136 )
      ( MAKE-2PILE ?auto_135 ?auto_136 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_139 - BLOCK
      ?auto_140 - BLOCK
    )
    :vars
    (
      ?auto_141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139 ?auto_140 ) ) ( ON-TABLE ?auto_140 ) ( CLEAR ?auto_140 ) ( ON ?auto_139 ?auto_141 ) ( CLEAR ?auto_139 ) ( HAND-EMPTY ) ( not ( = ?auto_139 ?auto_141 ) ) ( not ( = ?auto_140 ?auto_141 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139 ?auto_141 )
      ( MAKE-2PILE ?auto_139 ?auto_140 ) )
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
    ( and ( not ( = ?auto_142 ?auto_143 ) ) ( ON ?auto_142 ?auto_144 ) ( CLEAR ?auto_142 ) ( not ( = ?auto_142 ?auto_144 ) ) ( not ( = ?auto_143 ?auto_144 ) ) ( HOLDING ?auto_143 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143 )
      ( MAKE-2PILE ?auto_142 ?auto_143 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145 - BLOCK
      ?auto_146 - BLOCK
    )
    :vars
    (
      ?auto_147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145 ?auto_146 ) ) ( ON ?auto_145 ?auto_147 ) ( not ( = ?auto_145 ?auto_147 ) ) ( not ( = ?auto_146 ?auto_147 ) ) ( ON ?auto_146 ?auto_145 ) ( CLEAR ?auto_146 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147 ?auto_145 )
      ( MAKE-2PILE ?auto_145 ?auto_146 ) )
  )

)

