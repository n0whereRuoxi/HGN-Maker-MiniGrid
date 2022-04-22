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
      ?auto_83 - BLOCK
      ?auto_84 - BLOCK
    )
    :vars
    (
      ?auto_85 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85 ?auto_84 ) ( CLEAR ?auto_85 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83 ) ( ON ?auto_84 ?auto_83 ) ( not ( = ?auto_83 ?auto_84 ) ) ( not ( = ?auto_83 ?auto_85 ) ) ( not ( = ?auto_84 ?auto_85 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85 ?auto_84 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_87 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_87 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88 - BLOCK
    )
    :vars
    (
      ?auto_89 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88 ?auto_89 ) ( CLEAR ?auto_88 ) ( HAND-EMPTY ) ( not ( = ?auto_88 ?auto_89 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88 ?auto_89 )
      ( MAKE-1PILE ?auto_88 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91 - BLOCK
    )
    :vars
    (
      ?auto_92 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92 ?auto_91 ) ( CLEAR ?auto_92 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91 ) ( not ( = ?auto_91 ?auto_92 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92 ?auto_91 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93 - BLOCK
    )
    :vars
    (
      ?auto_94 - BLOCK
      ?auto_95 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94 ?auto_93 ) ( CLEAR ?auto_94 ) ( ON-TABLE ?auto_93 ) ( not ( = ?auto_93 ?auto_94 ) ) ( HOLDING ?auto_95 ) ( not ( = ?auto_93 ?auto_95 ) ) ( not ( = ?auto_94 ?auto_95 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_95 )
      ( MAKE-1PILE ?auto_93 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96 - BLOCK
    )
    :vars
    (
      ?auto_98 - BLOCK
      ?auto_97 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98 ?auto_96 ) ( ON-TABLE ?auto_96 ) ( not ( = ?auto_96 ?auto_98 ) ) ( not ( = ?auto_96 ?auto_97 ) ) ( not ( = ?auto_98 ?auto_97 ) ) ( ON ?auto_97 ?auto_98 ) ( CLEAR ?auto_97 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96 ?auto_98 )
      ( MAKE-1PILE ?auto_96 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101 - BLOCK
      ?auto_102 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_102 ) ( CLEAR ?auto_101 ) ( ON-TABLE ?auto_101 ) ( not ( = ?auto_101 ?auto_102 ) ) )
    :subtasks
    ( ( !STACK ?auto_102 ?auto_101 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103 - BLOCK
      ?auto_104 - BLOCK
    )
    :vars
    (
      ?auto_105 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103 ) ( ON-TABLE ?auto_103 ) ( not ( = ?auto_103 ?auto_104 ) ) ( ON ?auto_104 ?auto_105 ) ( CLEAR ?auto_104 ) ( HAND-EMPTY ) ( not ( = ?auto_103 ?auto_105 ) ) ( not ( = ?auto_104 ?auto_105 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104 ?auto_105 )
      ( MAKE-2PILE ?auto_103 ?auto_104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106 - BLOCK
      ?auto_107 - BLOCK
    )
    :vars
    (
      ?auto_108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106 ?auto_107 ) ) ( ON ?auto_107 ?auto_108 ) ( CLEAR ?auto_107 ) ( not ( = ?auto_106 ?auto_108 ) ) ( not ( = ?auto_107 ?auto_108 ) ) ( HOLDING ?auto_106 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106 )
      ( MAKE-2PILE ?auto_106 ?auto_107 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109 - BLOCK
      ?auto_110 - BLOCK
    )
    :vars
    (
      ?auto_111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109 ?auto_110 ) ) ( ON ?auto_110 ?auto_111 ) ( not ( = ?auto_109 ?auto_111 ) ) ( not ( = ?auto_110 ?auto_111 ) ) ( ON ?auto_109 ?auto_110 ) ( CLEAR ?auto_109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111 ?auto_110 )
      ( MAKE-2PILE ?auto_109 ?auto_110 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113 - BLOCK
    )
    :vars
    (
      ?auto_114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114 ?auto_113 ) ( CLEAR ?auto_114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113 ) ( not ( = ?auto_113 ?auto_114 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114 ?auto_113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120 - BLOCK
    )
    :vars
    (
      ?auto_121 - BLOCK
      ?auto_122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120 ?auto_121 ) ) ( ON ?auto_121 ?auto_122 ) ( CLEAR ?auto_121 ) ( not ( = ?auto_120 ?auto_122 ) ) ( not ( = ?auto_121 ?auto_122 ) ) ( HOLDING ?auto_120 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120 ?auto_121 )
      ( MAKE-1PILE ?auto_120 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123 - BLOCK
    )
    :vars
    (
      ?auto_125 - BLOCK
      ?auto_124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123 ?auto_125 ) ) ( ON ?auto_125 ?auto_124 ) ( not ( = ?auto_123 ?auto_124 ) ) ( not ( = ?auto_125 ?auto_124 ) ) ( ON ?auto_123 ?auto_125 ) ( CLEAR ?auto_123 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124 ?auto_125 )
      ( MAKE-1PILE ?auto_123 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_127 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128 - BLOCK
    )
    :vars
    (
      ?auto_129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128 ?auto_129 ) ( CLEAR ?auto_128 ) ( HAND-EMPTY ) ( not ( = ?auto_128 ?auto_129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128 ?auto_129 )
      ( MAKE-1PILE ?auto_128 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_130 - BLOCK
    )
    :vars
    (
      ?auto_131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130 ?auto_131 ) ) ( HOLDING ?auto_130 ) ( CLEAR ?auto_131 ) ( ON-TABLE ?auto_131 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131 ?auto_130 )
      ( MAKE-1PILE ?auto_130 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132 - BLOCK
    )
    :vars
    (
      ?auto_133 - BLOCK
      ?auto_134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132 ?auto_133 ) ) ( CLEAR ?auto_133 ) ( ON-TABLE ?auto_133 ) ( ON ?auto_132 ?auto_134 ) ( CLEAR ?auto_132 ) ( HAND-EMPTY ) ( not ( = ?auto_132 ?auto_134 ) ) ( not ( = ?auto_133 ?auto_134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132 ?auto_134 )
      ( MAKE-1PILE ?auto_132 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135 - BLOCK
    )
    :vars
    (
      ?auto_136 - BLOCK
      ?auto_137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135 ?auto_136 ) ) ( ON ?auto_135 ?auto_137 ) ( CLEAR ?auto_135 ) ( not ( = ?auto_135 ?auto_137 ) ) ( not ( = ?auto_136 ?auto_137 ) ) ( HOLDING ?auto_136 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136 )
      ( MAKE-1PILE ?auto_135 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138 - BLOCK
    )
    :vars
    (
      ?auto_139 - BLOCK
      ?auto_140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138 ?auto_139 ) ) ( ON ?auto_138 ?auto_140 ) ( not ( = ?auto_138 ?auto_140 ) ) ( not ( = ?auto_139 ?auto_140 ) ) ( ON ?auto_139 ?auto_138 ) ( CLEAR ?auto_139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140 ?auto_138 )
      ( MAKE-1PILE ?auto_138 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143 - BLOCK
      ?auto_144 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_144 ) ( CLEAR ?auto_143 ) ( ON-TABLE ?auto_143 ) ( not ( = ?auto_143 ?auto_144 ) ) )
    :subtasks
    ( ( !STACK ?auto_144 ?auto_143 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145 - BLOCK
      ?auto_146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145 ) ( ON-TABLE ?auto_145 ) ( not ( = ?auto_145 ?auto_146 ) ) ( ON-TABLE ?auto_146 ) ( CLEAR ?auto_146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_146 )
      ( MAKE-2PILE ?auto_145 ?auto_146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147 - BLOCK
      ?auto_148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147 ?auto_148 ) ) ( ON-TABLE ?auto_148 ) ( CLEAR ?auto_148 ) ( HOLDING ?auto_147 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147 )
      ( MAKE-2PILE ?auto_147 ?auto_148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149 - BLOCK
      ?auto_150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149 ?auto_150 ) ) ( ON-TABLE ?auto_150 ) ( ON ?auto_149 ?auto_150 ) ( CLEAR ?auto_149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150 )
      ( MAKE-2PILE ?auto_149 ?auto_150 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151 - BLOCK
      ?auto_152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151 ?auto_152 ) ) ( ON-TABLE ?auto_152 ) ( HOLDING ?auto_151 ) ( CLEAR ?auto_152 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152 ?auto_151 )
      ( MAKE-2PILE ?auto_151 ?auto_152 ) )
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
    ( and ( not ( = ?auto_153 ?auto_154 ) ) ( ON-TABLE ?auto_154 ) ( CLEAR ?auto_154 ) ( ON ?auto_153 ?auto_155 ) ( CLEAR ?auto_153 ) ( HAND-EMPTY ) ( not ( = ?auto_153 ?auto_155 ) ) ( not ( = ?auto_154 ?auto_155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153 ?auto_155 )
      ( MAKE-2PILE ?auto_153 ?auto_154 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156 - BLOCK
      ?auto_157 - BLOCK
    )
    :vars
    (
      ?auto_158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156 ?auto_157 ) ) ( ON ?auto_156 ?auto_158 ) ( CLEAR ?auto_156 ) ( not ( = ?auto_156 ?auto_158 ) ) ( not ( = ?auto_157 ?auto_158 ) ) ( HOLDING ?auto_157 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157 )
      ( MAKE-2PILE ?auto_156 ?auto_157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159 - BLOCK
      ?auto_160 - BLOCK
    )
    :vars
    (
      ?auto_161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159 ?auto_160 ) ) ( ON ?auto_159 ?auto_161 ) ( not ( = ?auto_159 ?auto_161 ) ) ( not ( = ?auto_160 ?auto_161 ) ) ( ON ?auto_160 ?auto_159 ) ( CLEAR ?auto_160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161 ?auto_159 )
      ( MAKE-2PILE ?auto_159 ?auto_160 ) )
  )

)

