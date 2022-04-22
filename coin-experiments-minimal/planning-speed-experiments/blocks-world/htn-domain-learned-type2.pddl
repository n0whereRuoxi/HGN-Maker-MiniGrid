( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?B - BLOCK )
    ( ON ?B1 - BLOCK ?B2 - BLOCK )
    ( CLEAR ?B - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?B - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?B - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?B ) ( CLEAR ?B ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?B ) ) ( not ( CLEAR ?B ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?B ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?B - BLOCK
    )
    :precondition
    ( and ( HOLDING ?B ) )
    :effect
    ( and ( not ( HOLDING ?B ) ) ( HAND-EMPTY ) ( ON-TABLE ?B ) ( CLEAR ?B ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( ON ?B1 ?B2 ) ( CLEAR ?B1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?B1 ?B2 ) ) ( not ( CLEAR ?B1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?B2 ) ( HOLDING ?B1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?B1 ) ( CLEAR ?B2 ) )
    :effect
    ( and ( not ( HOLDING ?B1 ) ) ( not ( CLEAR ?B2 ) ) ( HAND-EMPTY ) ( ON ?B1 ?B2 ) ( CLEAR ?B1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?GOAL - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?GOAL ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?TOP - BLOCK
      ?BOTTOM - BLOCK
    )
    :precondition
    ( and ( ON ?TOP ?BOTTOM ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-TABLE-VERIFY
    :parameters
    (
      ?BLOCK - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?BLOCK ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( ON ?B1 ?B2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2 - BLOCK
    )
    :vars
    (
      ?AUTO_3 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2 ?AUTO_3 ) ( CLEAR ?AUTO_2 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2 ?AUTO_3 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2 ?AUTO_3 )
      ( MAKE-ON-TABLE ?AUTO_2 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6 - BLOCK
      ?AUTO_7 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6 ) ( CLEAR ?AUTO_7 ) ( not ( = ?AUTO_6 ?AUTO_7 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6 ?AUTO_7 )
      ( MAKE-ON-VERIFY ?AUTO_6 ?AUTO_7 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8 - BLOCK
      ?AUTO_9 - BLOCK
    )
    :vars
    (
      ?AUTO_10 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9 ) ( not ( = ?AUTO_8 ?AUTO_9 ) ) ( ON ?AUTO_8 ?AUTO_10 ) ( CLEAR ?AUTO_8 ) ( HAND-EMPTY ) ( not ( = ?AUTO_8 ?AUTO_10 ) ) ( not ( = ?AUTO_9 ?AUTO_10 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8 ?AUTO_10 )
      ( MAKE-ON ?AUTO_8 ?AUTO_9 )
      ( MAKE-ON-VERIFY ?AUTO_8 ?AUTO_9 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11 - BLOCK
      ?AUTO_12 - BLOCK
    )
    :vars
    (
      ?AUTO_13 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_11 ?AUTO_12 ) ) ( ON ?AUTO_11 ?AUTO_13 ) ( CLEAR ?AUTO_11 ) ( not ( = ?AUTO_11 ?AUTO_13 ) ) ( not ( = ?AUTO_12 ?AUTO_13 ) ) ( HOLDING ?AUTO_12 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_12 )
      ( MAKE-ON ?AUTO_11 ?AUTO_12 )
      ( MAKE-ON-VERIFY ?AUTO_11 ?AUTO_12 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_20 - BLOCK
      ?AUTO_21 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_21 ) ( not ( = ?AUTO_20 ?AUTO_21 ) ) ( ON-TABLE ?AUTO_20 ) ( CLEAR ?AUTO_20 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_20 )
      ( MAKE-ON ?AUTO_20 ?AUTO_21 )
      ( MAKE-ON-VERIFY ?AUTO_20 ?AUTO_21 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_22 - BLOCK
      ?AUTO_23 - BLOCK
    )
    :vars
    (
      ?AUTO_24 - BLOCK
      ?AUTO_25 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_23 ) ( not ( = ?AUTO_22 ?AUTO_23 ) ) ( ON-TABLE ?AUTO_22 ) ( CLEAR ?AUTO_22 ) ( HOLDING ?AUTO_24 ) ( CLEAR ?AUTO_25 ) ( not ( = ?AUTO_22 ?AUTO_24 ) ) ( not ( = ?AUTO_22 ?AUTO_25 ) ) ( not ( = ?AUTO_23 ?AUTO_24 ) ) ( not ( = ?AUTO_23 ?AUTO_25 ) ) ( not ( = ?AUTO_24 ?AUTO_25 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_24 ?AUTO_25 )
      ( MAKE-ON ?AUTO_22 ?AUTO_23 )
      ( MAKE-ON-VERIFY ?AUTO_22 ?AUTO_23 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2138 - BLOCK
      ?AUTO_2139 - BLOCK
    )
    :vars
    (
      ?AUTO_2140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2138 ?AUTO_2139 ) ) ( ON-TABLE ?AUTO_2138 ) ( CLEAR ?AUTO_2138 ) ( not ( = ?AUTO_2138 ?AUTO_2140 ) ) ( not ( = ?AUTO_2139 ?AUTO_2140 ) ) ( ON ?AUTO_2140 ?AUTO_2139 ) ( CLEAR ?AUTO_2140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2140 ?AUTO_2139 )
      ( MAKE-ON ?AUTO_2138 ?AUTO_2139 )
      ( MAKE-ON-VERIFY ?AUTO_2138 ?AUTO_2139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_30 - BLOCK
      ?AUTO_31 - BLOCK
    )
    :vars
    (
      ?AUTO_33 - BLOCK
      ?AUTO_32 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_30 ?AUTO_31 ) ) ( ON-TABLE ?AUTO_30 ) ( CLEAR ?AUTO_30 ) ( not ( = ?AUTO_30 ?AUTO_33 ) ) ( not ( = ?AUTO_30 ?AUTO_32 ) ) ( not ( = ?AUTO_31 ?AUTO_33 ) ) ( not ( = ?AUTO_31 ?AUTO_32 ) ) ( not ( = ?AUTO_33 ?AUTO_32 ) ) ( ON ?AUTO_33 ?AUTO_31 ) ( CLEAR ?AUTO_33 ) ( HOLDING ?AUTO_32 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_32 )
      ( MAKE-ON ?AUTO_30 ?AUTO_31 )
      ( MAKE-ON-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34 - BLOCK
      ?AUTO_35 - BLOCK
    )
    :vars
    (
      ?AUTO_36 - BLOCK
      ?AUTO_37 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_34 ?AUTO_35 ) ) ( ON-TABLE ?AUTO_34 ) ( not ( = ?AUTO_34 ?AUTO_36 ) ) ( not ( = ?AUTO_34 ?AUTO_37 ) ) ( not ( = ?AUTO_35 ?AUTO_36 ) ) ( not ( = ?AUTO_35 ?AUTO_37 ) ) ( not ( = ?AUTO_36 ?AUTO_37 ) ) ( ON ?AUTO_36 ?AUTO_35 ) ( CLEAR ?AUTO_36 ) ( ON ?AUTO_37 ?AUTO_34 ) ( CLEAR ?AUTO_37 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_37 ?AUTO_34 )
      ( MAKE-ON ?AUTO_34 ?AUTO_35 )
      ( MAKE-ON-VERIFY ?AUTO_34 ?AUTO_35 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_50 - BLOCK
      ?AUTO_51 - BLOCK
    )
    :vars
    (
      ?AUTO_52 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_50 ?AUTO_51 ) ) ( ON-TABLE ?AUTO_50 ) ( CLEAR ?AUTO_50 ) ( HOLDING ?AUTO_51 ) ( CLEAR ?AUTO_52 ) ( not ( = ?AUTO_50 ?AUTO_52 ) ) ( not ( = ?AUTO_51 ?AUTO_52 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_51 ?AUTO_52 )
      ( MAKE-ON ?AUTO_50 ?AUTO_51 )
      ( MAKE-ON-VERIFY ?AUTO_50 ?AUTO_51 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_61 - BLOCK
    )
    :vars
    (
      ?AUTO_62 - BLOCK
      ?AUTO_63 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_61 ?AUTO_62 ) ( CLEAR ?AUTO_61 ) ( not ( = ?AUTO_61 ?AUTO_62 ) ) ( HOLDING ?AUTO_63 ) ( not ( = ?AUTO_61 ?AUTO_63 ) ) ( not ( = ?AUTO_62 ?AUTO_63 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_63 )
      ( MAKE-ON-TABLE ?AUTO_61 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_61 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_75 - BLOCK
      ?AUTO_76 - BLOCK
    )
    :vars
    (
      ?AUTO_77 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_75 ?AUTO_76 ) ) ( ON ?AUTO_75 ?AUTO_77 ) ( not ( = ?AUTO_75 ?AUTO_77 ) ) ( not ( = ?AUTO_76 ?AUTO_77 ) ) ( ON ?AUTO_76 ?AUTO_75 ) ( CLEAR ?AUTO_76 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_76 ?AUTO_75 )
      ( MAKE-ON ?AUTO_75 ?AUTO_76 )
      ( MAKE-ON-VERIFY ?AUTO_75 ?AUTO_76 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_78 - BLOCK
      ?AUTO_79 - BLOCK
    )
    :vars
    (
      ?AUTO_80 - BLOCK
      ?AUTO_81 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_78 ?AUTO_79 ) ) ( ON ?AUTO_78 ?AUTO_80 ) ( not ( = ?AUTO_78 ?AUTO_80 ) ) ( not ( = ?AUTO_79 ?AUTO_80 ) ) ( ON ?AUTO_79 ?AUTO_78 ) ( CLEAR ?AUTO_79 ) ( HOLDING ?AUTO_81 ) ( not ( = ?AUTO_78 ?AUTO_81 ) ) ( not ( = ?AUTO_79 ?AUTO_81 ) ) ( not ( = ?AUTO_80 ?AUTO_81 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_81 )
      ( MAKE-ON ?AUTO_78 ?AUTO_79 )
      ( MAKE-ON-VERIFY ?AUTO_78 ?AUTO_79 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_91 - BLOCK
      ?AUTO_92 - BLOCK
    )
    :vars
    (
      ?AUTO_93 - BLOCK
      ?AUTO_94 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_91 ?AUTO_92 ) ) ( ON ?AUTO_91 ?AUTO_93 ) ( CLEAR ?AUTO_91 ) ( not ( = ?AUTO_91 ?AUTO_93 ) ) ( not ( = ?AUTO_92 ?AUTO_93 ) ) ( HOLDING ?AUTO_92 ) ( CLEAR ?AUTO_94 ) ( not ( = ?AUTO_91 ?AUTO_94 ) ) ( not ( = ?AUTO_92 ?AUTO_94 ) ) ( not ( = ?AUTO_93 ?AUTO_94 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_92 ?AUTO_94 )
      ( MAKE-ON ?AUTO_91 ?AUTO_92 )
      ( MAKE-ON-VERIFY ?AUTO_91 ?AUTO_92 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_97 - BLOCK
      ?AUTO_98 - BLOCK
    )
    :vars
    (
      ?AUTO_99 - BLOCK
      ?AUTO_100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_98 ) ( not ( = ?AUTO_97 ?AUTO_98 ) ) ( ON ?AUTO_97 ?AUTO_99 ) ( CLEAR ?AUTO_97 ) ( not ( = ?AUTO_97 ?AUTO_99 ) ) ( not ( = ?AUTO_98 ?AUTO_99 ) ) ( HOLDING ?AUTO_100 ) ( not ( = ?AUTO_97 ?AUTO_100 ) ) ( not ( = ?AUTO_98 ?AUTO_100 ) ) ( not ( = ?AUTO_99 ?AUTO_100 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_100 )
      ( MAKE-ON ?AUTO_97 ?AUTO_98 )
      ( MAKE-ON-VERIFY ?AUTO_97 ?AUTO_98 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_101 - BLOCK
      ?AUTO_102 - BLOCK
    )
    :vars
    (
      ?AUTO_103 - BLOCK
      ?AUTO_104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_101 ?AUTO_102 ) ) ( ON ?AUTO_101 ?AUTO_103 ) ( CLEAR ?AUTO_101 ) ( not ( = ?AUTO_101 ?AUTO_103 ) ) ( not ( = ?AUTO_102 ?AUTO_103 ) ) ( not ( = ?AUTO_101 ?AUTO_104 ) ) ( not ( = ?AUTO_102 ?AUTO_104 ) ) ( not ( = ?AUTO_103 ?AUTO_104 ) ) ( ON ?AUTO_104 ?AUTO_102 ) ( CLEAR ?AUTO_104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_104 ?AUTO_102 )
      ( MAKE-ON ?AUTO_101 ?AUTO_102 )
      ( MAKE-ON-VERIFY ?AUTO_101 ?AUTO_102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_105 - BLOCK
      ?AUTO_106 - BLOCK
    )
    :vars
    (
      ?AUTO_107 - BLOCK
      ?AUTO_108 - BLOCK
      ?AUTO_109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_105 ?AUTO_106 ) ) ( ON ?AUTO_105 ?AUTO_107 ) ( CLEAR ?AUTO_105 ) ( not ( = ?AUTO_105 ?AUTO_107 ) ) ( not ( = ?AUTO_106 ?AUTO_107 ) ) ( not ( = ?AUTO_105 ?AUTO_108 ) ) ( not ( = ?AUTO_106 ?AUTO_108 ) ) ( not ( = ?AUTO_107 ?AUTO_108 ) ) ( ON ?AUTO_108 ?AUTO_106 ) ( CLEAR ?AUTO_108 ) ( HOLDING ?AUTO_109 ) ( not ( = ?AUTO_105 ?AUTO_109 ) ) ( not ( = ?AUTO_106 ?AUTO_109 ) ) ( not ( = ?AUTO_107 ?AUTO_109 ) ) ( not ( = ?AUTO_108 ?AUTO_109 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_109 )
      ( MAKE-ON ?AUTO_105 ?AUTO_106 )
      ( MAKE-ON-VERIFY ?AUTO_105 ?AUTO_106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_110 - BLOCK
      ?AUTO_111 - BLOCK
    )
    :vars
    (
      ?AUTO_112 - BLOCK
      ?AUTO_113 - BLOCK
      ?AUTO_114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_110 ?AUTO_111 ) ) ( ON ?AUTO_110 ?AUTO_112 ) ( not ( = ?AUTO_110 ?AUTO_112 ) ) ( not ( = ?AUTO_111 ?AUTO_112 ) ) ( not ( = ?AUTO_110 ?AUTO_113 ) ) ( not ( = ?AUTO_111 ?AUTO_113 ) ) ( not ( = ?AUTO_112 ?AUTO_113 ) ) ( ON ?AUTO_113 ?AUTO_111 ) ( CLEAR ?AUTO_113 ) ( not ( = ?AUTO_110 ?AUTO_114 ) ) ( not ( = ?AUTO_111 ?AUTO_114 ) ) ( not ( = ?AUTO_112 ?AUTO_114 ) ) ( not ( = ?AUTO_113 ?AUTO_114 ) ) ( ON ?AUTO_114 ?AUTO_110 ) ( CLEAR ?AUTO_114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_114 ?AUTO_110 )
      ( MAKE-ON ?AUTO_110 ?AUTO_111 )
      ( MAKE-ON-VERIFY ?AUTO_110 ?AUTO_111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_122 - BLOCK
      ?AUTO_123 - BLOCK
    )
    :vars
    (
      ?AUTO_124 - BLOCK
      ?AUTO_125 - BLOCK
      ?AUTO_126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_123 ) ( not ( = ?AUTO_122 ?AUTO_123 ) ) ( ON ?AUTO_122 ?AUTO_124 ) ( CLEAR ?AUTO_122 ) ( not ( = ?AUTO_122 ?AUTO_124 ) ) ( not ( = ?AUTO_123 ?AUTO_124 ) ) ( HOLDING ?AUTO_125 ) ( CLEAR ?AUTO_126 ) ( not ( = ?AUTO_122 ?AUTO_125 ) ) ( not ( = ?AUTO_122 ?AUTO_126 ) ) ( not ( = ?AUTO_123 ?AUTO_125 ) ) ( not ( = ?AUTO_123 ?AUTO_126 ) ) ( not ( = ?AUTO_124 ?AUTO_125 ) ) ( not ( = ?AUTO_124 ?AUTO_126 ) ) ( not ( = ?AUTO_125 ?AUTO_126 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_125 ?AUTO_126 )
      ( MAKE-ON ?AUTO_122 ?AUTO_123 )
      ( MAKE-ON-VERIFY ?AUTO_122 ?AUTO_123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_132 - BLOCK
      ?AUTO_133 - BLOCK
    )
    :vars
    (
      ?AUTO_134 - BLOCK
      ?AUTO_135 - BLOCK
      ?AUTO_136 - BLOCK
      ?AUTO_137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_132 ?AUTO_133 ) ) ( ON ?AUTO_132 ?AUTO_134 ) ( CLEAR ?AUTO_132 ) ( not ( = ?AUTO_132 ?AUTO_134 ) ) ( not ( = ?AUTO_133 ?AUTO_134 ) ) ( not ( = ?AUTO_132 ?AUTO_135 ) ) ( not ( = ?AUTO_132 ?AUTO_136 ) ) ( not ( = ?AUTO_133 ?AUTO_135 ) ) ( not ( = ?AUTO_133 ?AUTO_136 ) ) ( not ( = ?AUTO_134 ?AUTO_135 ) ) ( not ( = ?AUTO_134 ?AUTO_136 ) ) ( not ( = ?AUTO_135 ?AUTO_136 ) ) ( ON ?AUTO_135 ?AUTO_133 ) ( CLEAR ?AUTO_135 ) ( HOLDING ?AUTO_136 ) ( CLEAR ?AUTO_137 ) ( not ( = ?AUTO_132 ?AUTO_137 ) ) ( not ( = ?AUTO_133 ?AUTO_137 ) ) ( not ( = ?AUTO_134 ?AUTO_137 ) ) ( not ( = ?AUTO_135 ?AUTO_137 ) ) ( not ( = ?AUTO_136 ?AUTO_137 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_136 ?AUTO_137 )
      ( MAKE-ON ?AUTO_132 ?AUTO_133 )
      ( MAKE-ON-VERIFY ?AUTO_132 ?AUTO_133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_144 - BLOCK
      ?AUTO_145 - BLOCK
    )
    :vars
    (
      ?AUTO_147 - BLOCK
      ?AUTO_146 - BLOCK
      ?AUTO_149 - BLOCK
      ?AUTO_148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_144 ?AUTO_145 ) ) ( ON ?AUTO_144 ?AUTO_147 ) ( not ( = ?AUTO_144 ?AUTO_147 ) ) ( not ( = ?AUTO_145 ?AUTO_147 ) ) ( not ( = ?AUTO_144 ?AUTO_146 ) ) ( not ( = ?AUTO_144 ?AUTO_149 ) ) ( not ( = ?AUTO_145 ?AUTO_146 ) ) ( not ( = ?AUTO_145 ?AUTO_149 ) ) ( not ( = ?AUTO_147 ?AUTO_146 ) ) ( not ( = ?AUTO_147 ?AUTO_149 ) ) ( not ( = ?AUTO_146 ?AUTO_149 ) ) ( ON ?AUTO_146 ?AUTO_145 ) ( CLEAR ?AUTO_146 ) ( not ( = ?AUTO_144 ?AUTO_148 ) ) ( not ( = ?AUTO_145 ?AUTO_148 ) ) ( not ( = ?AUTO_147 ?AUTO_148 ) ) ( not ( = ?AUTO_146 ?AUTO_148 ) ) ( not ( = ?AUTO_149 ?AUTO_148 ) ) ( ON ?AUTO_149 ?AUTO_144 ) ( CLEAR ?AUTO_149 ) ( HOLDING ?AUTO_148 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_148 )
      ( MAKE-ON ?AUTO_144 ?AUTO_145 )
      ( MAKE-ON-VERIFY ?AUTO_144 ?AUTO_145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_150 - BLOCK
      ?AUTO_151 - BLOCK
    )
    :vars
    (
      ?AUTO_153 - BLOCK
      ?AUTO_154 - BLOCK
      ?AUTO_152 - BLOCK
      ?AUTO_155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_150 ?AUTO_151 ) ) ( ON ?AUTO_150 ?AUTO_153 ) ( not ( = ?AUTO_150 ?AUTO_153 ) ) ( not ( = ?AUTO_151 ?AUTO_153 ) ) ( not ( = ?AUTO_150 ?AUTO_154 ) ) ( not ( = ?AUTO_150 ?AUTO_152 ) ) ( not ( = ?AUTO_151 ?AUTO_154 ) ) ( not ( = ?AUTO_151 ?AUTO_152 ) ) ( not ( = ?AUTO_153 ?AUTO_154 ) ) ( not ( = ?AUTO_153 ?AUTO_152 ) ) ( not ( = ?AUTO_154 ?AUTO_152 ) ) ( ON ?AUTO_154 ?AUTO_151 ) ( CLEAR ?AUTO_154 ) ( not ( = ?AUTO_150 ?AUTO_155 ) ) ( not ( = ?AUTO_151 ?AUTO_155 ) ) ( not ( = ?AUTO_153 ?AUTO_155 ) ) ( not ( = ?AUTO_154 ?AUTO_155 ) ) ( not ( = ?AUTO_152 ?AUTO_155 ) ) ( ON ?AUTO_152 ?AUTO_150 ) ( ON ?AUTO_155 ?AUTO_152 ) ( CLEAR ?AUTO_155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_155 ?AUTO_152 )
      ( MAKE-ON ?AUTO_150 ?AUTO_151 )
      ( MAKE-ON-VERIFY ?AUTO_150 ?AUTO_151 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_156 - BLOCK
      ?AUTO_157 - BLOCK
    )
    :vars
    (
      ?AUTO_158 - BLOCK
      ?AUTO_159 - BLOCK
      ?AUTO_160 - BLOCK
      ?AUTO_161 - BLOCK
      ?AUTO_162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_156 ?AUTO_157 ) ) ( ON ?AUTO_156 ?AUTO_158 ) ( not ( = ?AUTO_156 ?AUTO_158 ) ) ( not ( = ?AUTO_157 ?AUTO_158 ) ) ( not ( = ?AUTO_156 ?AUTO_159 ) ) ( not ( = ?AUTO_156 ?AUTO_160 ) ) ( not ( = ?AUTO_157 ?AUTO_159 ) ) ( not ( = ?AUTO_157 ?AUTO_160 ) ) ( not ( = ?AUTO_158 ?AUTO_159 ) ) ( not ( = ?AUTO_158 ?AUTO_160 ) ) ( not ( = ?AUTO_159 ?AUTO_160 ) ) ( ON ?AUTO_159 ?AUTO_157 ) ( CLEAR ?AUTO_159 ) ( not ( = ?AUTO_156 ?AUTO_161 ) ) ( not ( = ?AUTO_157 ?AUTO_161 ) ) ( not ( = ?AUTO_158 ?AUTO_161 ) ) ( not ( = ?AUTO_159 ?AUTO_161 ) ) ( not ( = ?AUTO_160 ?AUTO_161 ) ) ( ON ?AUTO_160 ?AUTO_156 ) ( ON ?AUTO_161 ?AUTO_160 ) ( CLEAR ?AUTO_161 ) ( HOLDING ?AUTO_162 ) ( not ( = ?AUTO_156 ?AUTO_162 ) ) ( not ( = ?AUTO_157 ?AUTO_162 ) ) ( not ( = ?AUTO_158 ?AUTO_162 ) ) ( not ( = ?AUTO_159 ?AUTO_162 ) ) ( not ( = ?AUTO_160 ?AUTO_162 ) ) ( not ( = ?AUTO_161 ?AUTO_162 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_162 )
      ( MAKE-ON ?AUTO_156 ?AUTO_157 )
      ( MAKE-ON-VERIFY ?AUTO_156 ?AUTO_157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_163 - BLOCK
      ?AUTO_164 - BLOCK
    )
    :vars
    (
      ?AUTO_166 - BLOCK
      ?AUTO_165 - BLOCK
      ?AUTO_168 - BLOCK
      ?AUTO_167 - BLOCK
      ?AUTO_169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_163 ?AUTO_164 ) ) ( ON ?AUTO_163 ?AUTO_166 ) ( not ( = ?AUTO_163 ?AUTO_166 ) ) ( not ( = ?AUTO_164 ?AUTO_166 ) ) ( not ( = ?AUTO_163 ?AUTO_165 ) ) ( not ( = ?AUTO_163 ?AUTO_168 ) ) ( not ( = ?AUTO_164 ?AUTO_165 ) ) ( not ( = ?AUTO_164 ?AUTO_168 ) ) ( not ( = ?AUTO_166 ?AUTO_165 ) ) ( not ( = ?AUTO_166 ?AUTO_168 ) ) ( not ( = ?AUTO_165 ?AUTO_168 ) ) ( ON ?AUTO_165 ?AUTO_164 ) ( not ( = ?AUTO_163 ?AUTO_167 ) ) ( not ( = ?AUTO_164 ?AUTO_167 ) ) ( not ( = ?AUTO_166 ?AUTO_167 ) ) ( not ( = ?AUTO_165 ?AUTO_167 ) ) ( not ( = ?AUTO_168 ?AUTO_167 ) ) ( ON ?AUTO_168 ?AUTO_163 ) ( ON ?AUTO_167 ?AUTO_168 ) ( CLEAR ?AUTO_167 ) ( not ( = ?AUTO_163 ?AUTO_169 ) ) ( not ( = ?AUTO_164 ?AUTO_169 ) ) ( not ( = ?AUTO_166 ?AUTO_169 ) ) ( not ( = ?AUTO_165 ?AUTO_169 ) ) ( not ( = ?AUTO_168 ?AUTO_169 ) ) ( not ( = ?AUTO_167 ?AUTO_169 ) ) ( ON ?AUTO_169 ?AUTO_165 ) ( CLEAR ?AUTO_169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_169 ?AUTO_165 )
      ( MAKE-ON ?AUTO_163 ?AUTO_164 )
      ( MAKE-ON-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_286 - BLOCK
      ?AUTO_287 - BLOCK
    )
    :vars
    (
      ?AUTO_288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_287 ) ( not ( = ?AUTO_286 ?AUTO_287 ) ) ( ON-TABLE ?AUTO_286 ) ( not ( = ?AUTO_286 ?AUTO_288 ) ) ( not ( = ?AUTO_287 ?AUTO_288 ) ) ( ON ?AUTO_288 ?AUTO_286 ) ( CLEAR ?AUTO_288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_288 ?AUTO_286 )
      ( MAKE-ON ?AUTO_286 ?AUTO_287 )
      ( MAKE-ON-VERIFY ?AUTO_286 ?AUTO_287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_402 - BLOCK
      ?AUTO_403 - BLOCK
    )
    :vars
    (
      ?AUTO_404 - BLOCK
      ?AUTO_405 - BLOCK
      ?AUTO_406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_403 ) ( not ( = ?AUTO_402 ?AUTO_403 ) ) ( ON-TABLE ?AUTO_402 ) ( not ( = ?AUTO_402 ?AUTO_404 ) ) ( not ( = ?AUTO_403 ?AUTO_404 ) ) ( ON ?AUTO_404 ?AUTO_402 ) ( CLEAR ?AUTO_404 ) ( HOLDING ?AUTO_405 ) ( CLEAR ?AUTO_406 ) ( not ( = ?AUTO_402 ?AUTO_405 ) ) ( not ( = ?AUTO_402 ?AUTO_406 ) ) ( not ( = ?AUTO_403 ?AUTO_405 ) ) ( not ( = ?AUTO_403 ?AUTO_406 ) ) ( not ( = ?AUTO_404 ?AUTO_405 ) ) ( not ( = ?AUTO_404 ?AUTO_406 ) ) ( not ( = ?AUTO_405 ?AUTO_406 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_405 ?AUTO_406 )
      ( MAKE-ON ?AUTO_402 ?AUTO_403 )
      ( MAKE-ON-VERIFY ?AUTO_402 ?AUTO_403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_236 - BLOCK
      ?AUTO_237 - BLOCK
    )
    :vars
    (
      ?AUTO_238 - BLOCK
      ?AUTO_239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_236 ?AUTO_237 ) ) ( ON-TABLE ?AUTO_236 ) ( CLEAR ?AUTO_238 ) ( not ( = ?AUTO_236 ?AUTO_239 ) ) ( not ( = ?AUTO_236 ?AUTO_238 ) ) ( not ( = ?AUTO_237 ?AUTO_239 ) ) ( not ( = ?AUTO_237 ?AUTO_238 ) ) ( not ( = ?AUTO_239 ?AUTO_238 ) ) ( ON ?AUTO_239 ?AUTO_236 ) ( CLEAR ?AUTO_239 ) ( HOLDING ?AUTO_237 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_237 )
      ( MAKE-ON ?AUTO_236 ?AUTO_237 )
      ( MAKE-ON-VERIFY ?AUTO_236 ?AUTO_237 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_263 - BLOCK
    )
    :vars
    (
      ?AUTO_264 - BLOCK
      ?AUTO_265 - BLOCK
      ?AUTO_266 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_263 ?AUTO_264 ) ( CLEAR ?AUTO_263 ) ( not ( = ?AUTO_263 ?AUTO_264 ) ) ( HOLDING ?AUTO_265 ) ( CLEAR ?AUTO_266 ) ( not ( = ?AUTO_263 ?AUTO_265 ) ) ( not ( = ?AUTO_263 ?AUTO_266 ) ) ( not ( = ?AUTO_264 ?AUTO_265 ) ) ( not ( = ?AUTO_264 ?AUTO_266 ) ) ( not ( = ?AUTO_265 ?AUTO_266 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_265 ?AUTO_266 )
      ( MAKE-ON-TABLE ?AUTO_263 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_263 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_550 - BLOCK
    )
    :vars
    (
      ?AUTO_552 - BLOCK
      ?AUTO_551 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_550 ?AUTO_552 ) ( not ( = ?AUTO_550 ?AUTO_552 ) ) ( not ( = ?AUTO_550 ?AUTO_551 ) ) ( not ( = ?AUTO_552 ?AUTO_551 ) ) ( ON ?AUTO_551 ?AUTO_550 ) ( CLEAR ?AUTO_551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_551 ?AUTO_550 )
      ( MAKE-ON-TABLE ?AUTO_550 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_550 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1251 - BLOCK
    )
    :vars
    (
      ?AUTO_1253 - BLOCK
      ?AUTO_1252 - BLOCK
      ?AUTO_1254 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1251 ?AUTO_1253 ) ( not ( = ?AUTO_1251 ?AUTO_1253 ) ) ( not ( = ?AUTO_1251 ?AUTO_1252 ) ) ( not ( = ?AUTO_1253 ?AUTO_1252 ) ) ( ON ?AUTO_1252 ?AUTO_1251 ) ( CLEAR ?AUTO_1252 ) ( HOLDING ?AUTO_1254 ) ( not ( = ?AUTO_1251 ?AUTO_1254 ) ) ( not ( = ?AUTO_1253 ?AUTO_1254 ) ) ( not ( = ?AUTO_1252 ?AUTO_1254 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1254 )
      ( MAKE-ON-TABLE ?AUTO_1251 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1251 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_283 - BLOCK
      ?AUTO_284 - BLOCK
    )
    :vars
    (
      ?AUTO_285 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_284 ) ( not ( = ?AUTO_283 ?AUTO_284 ) ) ( ON-TABLE ?AUTO_283 ) ( CLEAR ?AUTO_283 ) ( HOLDING ?AUTO_285 ) ( not ( = ?AUTO_283 ?AUTO_285 ) ) ( not ( = ?AUTO_284 ?AUTO_285 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_285 )
      ( MAKE-ON ?AUTO_283 ?AUTO_284 )
      ( MAKE-ON-VERIFY ?AUTO_283 ?AUTO_284 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_289 - BLOCK
      ?AUTO_290 - BLOCK
    )
    :vars
    (
      ?AUTO_291 - BLOCK
      ?AUTO_292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_289 ?AUTO_290 ) ) ( ON-TABLE ?AUTO_289 ) ( not ( = ?AUTO_289 ?AUTO_291 ) ) ( not ( = ?AUTO_290 ?AUTO_291 ) ) ( ON ?AUTO_291 ?AUTO_289 ) ( CLEAR ?AUTO_291 ) ( HOLDING ?AUTO_290 ) ( CLEAR ?AUTO_292 ) ( not ( = ?AUTO_289 ?AUTO_292 ) ) ( not ( = ?AUTO_290 ?AUTO_292 ) ) ( not ( = ?AUTO_291 ?AUTO_292 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_290 ?AUTO_292 )
      ( MAKE-ON ?AUTO_289 ?AUTO_290 )
      ( MAKE-ON-VERIFY ?AUTO_289 ?AUTO_290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_293 - BLOCK
      ?AUTO_294 - BLOCK
    )
    :vars
    (
      ?AUTO_295 - BLOCK
      ?AUTO_296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_293 ?AUTO_294 ) ) ( ON-TABLE ?AUTO_293 ) ( not ( = ?AUTO_293 ?AUTO_295 ) ) ( not ( = ?AUTO_294 ?AUTO_295 ) ) ( ON ?AUTO_295 ?AUTO_293 ) ( CLEAR ?AUTO_296 ) ( not ( = ?AUTO_293 ?AUTO_296 ) ) ( not ( = ?AUTO_294 ?AUTO_296 ) ) ( not ( = ?AUTO_295 ?AUTO_296 ) ) ( ON ?AUTO_294 ?AUTO_295 ) ( CLEAR ?AUTO_294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_294 ?AUTO_295 )
      ( MAKE-ON ?AUTO_293 ?AUTO_294 )
      ( MAKE-ON-VERIFY ?AUTO_293 ?AUTO_294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_297 - BLOCK
      ?AUTO_298 - BLOCK
    )
    :vars
    (
      ?AUTO_300 - BLOCK
      ?AUTO_299 - BLOCK
      ?AUTO_301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_297 ?AUTO_298 ) ) ( ON-TABLE ?AUTO_297 ) ( not ( = ?AUTO_297 ?AUTO_300 ) ) ( not ( = ?AUTO_298 ?AUTO_300 ) ) ( ON ?AUTO_300 ?AUTO_297 ) ( CLEAR ?AUTO_299 ) ( not ( = ?AUTO_297 ?AUTO_299 ) ) ( not ( = ?AUTO_298 ?AUTO_299 ) ) ( not ( = ?AUTO_300 ?AUTO_299 ) ) ( ON ?AUTO_298 ?AUTO_300 ) ( CLEAR ?AUTO_298 ) ( HOLDING ?AUTO_301 ) ( not ( = ?AUTO_297 ?AUTO_301 ) ) ( not ( = ?AUTO_298 ?AUTO_301 ) ) ( not ( = ?AUTO_300 ?AUTO_301 ) ) ( not ( = ?AUTO_299 ?AUTO_301 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_301 )
      ( MAKE-ON ?AUTO_297 ?AUTO_298 )
      ( MAKE-ON-VERIFY ?AUTO_297 ?AUTO_298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4821 - BLOCK
      ?AUTO_4822 - BLOCK
    )
    :vars
    (
      ?AUTO_4824 - BLOCK
      ?AUTO_4823 - BLOCK
      ?AUTO_4825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4821 ?AUTO_4822 ) ) ( ON-TABLE ?AUTO_4821 ) ( CLEAR ?AUTO_4821 ) ( not ( = ?AUTO_4821 ?AUTO_4824 ) ) ( not ( = ?AUTO_4821 ?AUTO_4823 ) ) ( not ( = ?AUTO_4822 ?AUTO_4824 ) ) ( not ( = ?AUTO_4822 ?AUTO_4823 ) ) ( not ( = ?AUTO_4824 ?AUTO_4823 ) ) ( ON ?AUTO_4824 ?AUTO_4822 ) ( CLEAR ?AUTO_4824 ) ( HOLDING ?AUTO_4823 ) ( CLEAR ?AUTO_4825 ) ( not ( = ?AUTO_4821 ?AUTO_4825 ) ) ( not ( = ?AUTO_4822 ?AUTO_4825 ) ) ( not ( = ?AUTO_4824 ?AUTO_4825 ) ) ( not ( = ?AUTO_4823 ?AUTO_4825 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4823 ?AUTO_4825 )
      ( MAKE-ON ?AUTO_4821 ?AUTO_4822 )
      ( MAKE-ON-VERIFY ?AUTO_4821 ?AUTO_4822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2141 - BLOCK
      ?AUTO_2142 - BLOCK
    )
    :vars
    (
      ?AUTO_2143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2141 ?AUTO_2142 ) ) ( not ( = ?AUTO_2141 ?AUTO_2143 ) ) ( not ( = ?AUTO_2142 ?AUTO_2143 ) ) ( ON ?AUTO_2143 ?AUTO_2142 ) ( CLEAR ?AUTO_2143 ) ( HOLDING ?AUTO_2141 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2141 )
      ( MAKE-ON ?AUTO_2141 ?AUTO_2142 )
      ( MAKE-ON-VERIFY ?AUTO_2141 ?AUTO_2142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_407 - BLOCK
      ?AUTO_408 - BLOCK
    )
    :vars
    (
      ?AUTO_409 - BLOCK
      ?AUTO_410 - BLOCK
      ?AUTO_411 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_408 ) ( not ( = ?AUTO_407 ?AUTO_408 ) ) ( ON-TABLE ?AUTO_407 ) ( not ( = ?AUTO_407 ?AUTO_409 ) ) ( not ( = ?AUTO_408 ?AUTO_409 ) ) ( ON ?AUTO_409 ?AUTO_407 ) ( CLEAR ?AUTO_410 ) ( not ( = ?AUTO_407 ?AUTO_411 ) ) ( not ( = ?AUTO_407 ?AUTO_410 ) ) ( not ( = ?AUTO_408 ?AUTO_411 ) ) ( not ( = ?AUTO_408 ?AUTO_410 ) ) ( not ( = ?AUTO_409 ?AUTO_411 ) ) ( not ( = ?AUTO_409 ?AUTO_410 ) ) ( not ( = ?AUTO_411 ?AUTO_410 ) ) ( ON ?AUTO_411 ?AUTO_409 ) ( CLEAR ?AUTO_411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_411 ?AUTO_409 )
      ( MAKE-ON ?AUTO_407 ?AUTO_408 )
      ( MAKE-ON-VERIFY ?AUTO_407 ?AUTO_408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_412 - BLOCK
      ?AUTO_413 - BLOCK
    )
    :vars
    (
      ?AUTO_414 - BLOCK
      ?AUTO_415 - BLOCK
      ?AUTO_416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_412 ?AUTO_413 ) ) ( ON-TABLE ?AUTO_412 ) ( not ( = ?AUTO_412 ?AUTO_414 ) ) ( not ( = ?AUTO_413 ?AUTO_414 ) ) ( ON ?AUTO_414 ?AUTO_412 ) ( CLEAR ?AUTO_415 ) ( not ( = ?AUTO_412 ?AUTO_416 ) ) ( not ( = ?AUTO_412 ?AUTO_415 ) ) ( not ( = ?AUTO_413 ?AUTO_416 ) ) ( not ( = ?AUTO_413 ?AUTO_415 ) ) ( not ( = ?AUTO_414 ?AUTO_416 ) ) ( not ( = ?AUTO_414 ?AUTO_415 ) ) ( not ( = ?AUTO_416 ?AUTO_415 ) ) ( ON ?AUTO_416 ?AUTO_414 ) ( CLEAR ?AUTO_416 ) ( HOLDING ?AUTO_413 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_413 )
      ( MAKE-ON ?AUTO_412 ?AUTO_413 )
      ( MAKE-ON-VERIFY ?AUTO_412 ?AUTO_413 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_431 - BLOCK
    )
    :vars
    (
      ?AUTO_433 - BLOCK
      ?AUTO_434 - BLOCK
      ?AUTO_432 - BLOCK
      ?AUTO_435 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_431 ?AUTO_433 ) ( not ( = ?AUTO_431 ?AUTO_433 ) ) ( not ( = ?AUTO_431 ?AUTO_434 ) ) ( not ( = ?AUTO_431 ?AUTO_432 ) ) ( not ( = ?AUTO_433 ?AUTO_434 ) ) ( not ( = ?AUTO_433 ?AUTO_432 ) ) ( not ( = ?AUTO_434 ?AUTO_432 ) ) ( ON ?AUTO_434 ?AUTO_431 ) ( CLEAR ?AUTO_434 ) ( HOLDING ?AUTO_432 ) ( CLEAR ?AUTO_435 ) ( not ( = ?AUTO_431 ?AUTO_435 ) ) ( not ( = ?AUTO_433 ?AUTO_435 ) ) ( not ( = ?AUTO_434 ?AUTO_435 ) ) ( not ( = ?AUTO_432 ?AUTO_435 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_432 ?AUTO_435 )
      ( MAKE-ON-TABLE ?AUTO_431 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_431 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1255 - BLOCK
    )
    :vars
    (
      ?AUTO_1257 - BLOCK
      ?AUTO_1256 - BLOCK
      ?AUTO_1258 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1255 ?AUTO_1257 ) ( not ( = ?AUTO_1255 ?AUTO_1257 ) ) ( not ( = ?AUTO_1255 ?AUTO_1256 ) ) ( not ( = ?AUTO_1257 ?AUTO_1256 ) ) ( ON ?AUTO_1256 ?AUTO_1255 ) ( not ( = ?AUTO_1255 ?AUTO_1258 ) ) ( not ( = ?AUTO_1257 ?AUTO_1258 ) ) ( not ( = ?AUTO_1256 ?AUTO_1258 ) ) ( ON ?AUTO_1258 ?AUTO_1256 ) ( CLEAR ?AUTO_1258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1258 ?AUTO_1256 )
      ( MAKE-ON-TABLE ?AUTO_1255 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1255 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3473 - BLOCK
    )
    :vars
    (
      ?AUTO_3475 - BLOCK
      ?AUTO_3476 - BLOCK
      ?AUTO_3477 - BLOCK
      ?AUTO_3474 - BLOCK
      ?AUTO_3478 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3473 ?AUTO_3475 ) ( not ( = ?AUTO_3473 ?AUTO_3475 ) ) ( not ( = ?AUTO_3473 ?AUTO_3476 ) ) ( not ( = ?AUTO_3475 ?AUTO_3476 ) ) ( ON ?AUTO_3476 ?AUTO_3473 ) ( not ( = ?AUTO_3473 ?AUTO_3477 ) ) ( not ( = ?AUTO_3473 ?AUTO_3474 ) ) ( not ( = ?AUTO_3475 ?AUTO_3477 ) ) ( not ( = ?AUTO_3475 ?AUTO_3474 ) ) ( not ( = ?AUTO_3476 ?AUTO_3477 ) ) ( not ( = ?AUTO_3476 ?AUTO_3474 ) ) ( not ( = ?AUTO_3477 ?AUTO_3474 ) ) ( ON ?AUTO_3477 ?AUTO_3476 ) ( CLEAR ?AUTO_3477 ) ( HOLDING ?AUTO_3474 ) ( CLEAR ?AUTO_3478 ) ( not ( = ?AUTO_3473 ?AUTO_3478 ) ) ( not ( = ?AUTO_3475 ?AUTO_3478 ) ) ( not ( = ?AUTO_3476 ?AUTO_3478 ) ) ( not ( = ?AUTO_3477 ?AUTO_3478 ) ) ( not ( = ?AUTO_3474 ?AUTO_3478 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3474 ?AUTO_3478 )
      ( MAKE-ON-TABLE ?AUTO_3473 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3473 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6037 - BLOCK
    )
    :vars
    (
      ?AUTO_6041 - BLOCK
      ?AUTO_6040 - BLOCK
      ?AUTO_6039 - BLOCK
      ?AUTO_6038 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6037 ?AUTO_6041 ) ( not ( = ?AUTO_6037 ?AUTO_6041 ) ) ( not ( = ?AUTO_6037 ?AUTO_6040 ) ) ( not ( = ?AUTO_6041 ?AUTO_6040 ) ) ( ON ?AUTO_6040 ?AUTO_6037 ) ( not ( = ?AUTO_6037 ?AUTO_6039 ) ) ( not ( = ?AUTO_6037 ?AUTO_6038 ) ) ( not ( = ?AUTO_6041 ?AUTO_6039 ) ) ( not ( = ?AUTO_6041 ?AUTO_6038 ) ) ( not ( = ?AUTO_6040 ?AUTO_6039 ) ) ( not ( = ?AUTO_6040 ?AUTO_6038 ) ) ( not ( = ?AUTO_6039 ?AUTO_6038 ) ) ( ON ?AUTO_6039 ?AUTO_6040 ) ( ON ?AUTO_6038 ?AUTO_6039 ) ( CLEAR ?AUTO_6038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6038 ?AUTO_6039 )
      ( MAKE-ON-TABLE ?AUTO_6037 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6037 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_579 - BLOCK
    )
    :vars
    (
      ?AUTO_585 - BLOCK
      ?AUTO_581 - BLOCK
      ?AUTO_580 - BLOCK
      ?AUTO_583 - BLOCK
      ?AUTO_584 - BLOCK
      ?AUTO_582 - BLOCK
      ?AUTO_586 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_579 ?AUTO_585 ) ( not ( = ?AUTO_579 ?AUTO_585 ) ) ( not ( = ?AUTO_579 ?AUTO_581 ) ) ( not ( = ?AUTO_585 ?AUTO_581 ) ) ( ON ?AUTO_581 ?AUTO_579 ) ( CLEAR ?AUTO_580 ) ( not ( = ?AUTO_579 ?AUTO_583 ) ) ( not ( = ?AUTO_579 ?AUTO_580 ) ) ( not ( = ?AUTO_585 ?AUTO_583 ) ) ( not ( = ?AUTO_585 ?AUTO_580 ) ) ( not ( = ?AUTO_581 ?AUTO_583 ) ) ( not ( = ?AUTO_581 ?AUTO_580 ) ) ( not ( = ?AUTO_583 ?AUTO_580 ) ) ( ON ?AUTO_583 ?AUTO_581 ) ( not ( = ?AUTO_579 ?AUTO_584 ) ) ( not ( = ?AUTO_579 ?AUTO_582 ) ) ( not ( = ?AUTO_585 ?AUTO_584 ) ) ( not ( = ?AUTO_585 ?AUTO_582 ) ) ( not ( = ?AUTO_581 ?AUTO_584 ) ) ( not ( = ?AUTO_581 ?AUTO_582 ) ) ( not ( = ?AUTO_580 ?AUTO_584 ) ) ( not ( = ?AUTO_580 ?AUTO_582 ) ) ( not ( = ?AUTO_583 ?AUTO_584 ) ) ( not ( = ?AUTO_583 ?AUTO_582 ) ) ( not ( = ?AUTO_584 ?AUTO_582 ) ) ( ON ?AUTO_584 ?AUTO_583 ) ( CLEAR ?AUTO_584 ) ( HOLDING ?AUTO_582 ) ( CLEAR ?AUTO_586 ) ( not ( = ?AUTO_579 ?AUTO_586 ) ) ( not ( = ?AUTO_585 ?AUTO_586 ) ) ( not ( = ?AUTO_581 ?AUTO_586 ) ) ( not ( = ?AUTO_580 ?AUTO_586 ) ) ( not ( = ?AUTO_583 ?AUTO_586 ) ) ( not ( = ?AUTO_584 ?AUTO_586 ) ) ( not ( = ?AUTO_582 ?AUTO_586 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_582 ?AUTO_586 )
      ( MAKE-ON-TABLE ?AUTO_579 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_604 - BLOCK
      ?AUTO_605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_604 ?AUTO_605 ) ) ( ON-TABLE ?AUTO_604 ) ( CLEAR ?AUTO_604 ) ( HOLDING ?AUTO_605 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_605 )
      ( MAKE-ON ?AUTO_604 ?AUTO_605 )
      ( MAKE-ON-VERIFY ?AUTO_604 ?AUTO_605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2787 - BLOCK
      ?AUTO_2788 - BLOCK
    )
    :vars
    (
      ?AUTO_2789 - BLOCK
      ?AUTO_2790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2788 ) ( not ( = ?AUTO_2787 ?AUTO_2788 ) ) ( ON-TABLE ?AUTO_2787 ) ( not ( = ?AUTO_2787 ?AUTO_2789 ) ) ( not ( = ?AUTO_2788 ?AUTO_2789 ) ) ( ON ?AUTO_2789 ?AUTO_2787 ) ( CLEAR ?AUTO_2789 ) ( HOLDING ?AUTO_2790 ) ( not ( = ?AUTO_2787 ?AUTO_2790 ) ) ( not ( = ?AUTO_2788 ?AUTO_2790 ) ) ( not ( = ?AUTO_2789 ?AUTO_2790 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2790 )
      ( MAKE-ON ?AUTO_2787 ?AUTO_2788 )
      ( MAKE-ON-VERIFY ?AUTO_2787 ?AUTO_2788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1667 - BLOCK
      ?AUTO_1668 - BLOCK
    )
    :vars
    (
      ?AUTO_1669 - BLOCK
      ?AUTO_1671 - BLOCK
      ?AUTO_1670 - BLOCK
      ?AUTO_1672 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1668 ) ( not ( = ?AUTO_1667 ?AUTO_1668 ) ) ( ON-TABLE ?AUTO_1667 ) ( not ( = ?AUTO_1667 ?AUTO_1669 ) ) ( not ( = ?AUTO_1667 ?AUTO_1671 ) ) ( not ( = ?AUTO_1668 ?AUTO_1669 ) ) ( not ( = ?AUTO_1668 ?AUTO_1671 ) ) ( not ( = ?AUTO_1669 ?AUTO_1671 ) ) ( ON ?AUTO_1669 ?AUTO_1667 ) ( not ( = ?AUTO_1667 ?AUTO_1670 ) ) ( not ( = ?AUTO_1668 ?AUTO_1670 ) ) ( not ( = ?AUTO_1671 ?AUTO_1670 ) ) ( not ( = ?AUTO_1669 ?AUTO_1670 ) ) ( ON ?AUTO_1670 ?AUTO_1669 ) ( CLEAR ?AUTO_1670 ) ( HOLDING ?AUTO_1671 ) ( CLEAR ?AUTO_1672 ) ( not ( = ?AUTO_1667 ?AUTO_1672 ) ) ( not ( = ?AUTO_1668 ?AUTO_1672 ) ) ( not ( = ?AUTO_1669 ?AUTO_1672 ) ) ( not ( = ?AUTO_1671 ?AUTO_1672 ) ) ( not ( = ?AUTO_1670 ?AUTO_1672 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1671 ?AUTO_1672 )
      ( MAKE-ON ?AUTO_1667 ?AUTO_1668 )
      ( MAKE-ON-VERIFY ?AUTO_1667 ?AUTO_1668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3221 - BLOCK
      ?AUTO_3222 - BLOCK
    )
    :vars
    (
      ?AUTO_3223 - BLOCK
      ?AUTO_3225 - BLOCK
      ?AUTO_3224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3221 ?AUTO_3222 ) ) ( ON-TABLE ?AUTO_3221 ) ( not ( = ?AUTO_3221 ?AUTO_3223 ) ) ( not ( = ?AUTO_3222 ?AUTO_3223 ) ) ( ON ?AUTO_3223 ?AUTO_3221 ) ( not ( = ?AUTO_3221 ?AUTO_3225 ) ) ( not ( = ?AUTO_3221 ?AUTO_3224 ) ) ( not ( = ?AUTO_3222 ?AUTO_3225 ) ) ( not ( = ?AUTO_3222 ?AUTO_3224 ) ) ( not ( = ?AUTO_3223 ?AUTO_3225 ) ) ( not ( = ?AUTO_3223 ?AUTO_3224 ) ) ( not ( = ?AUTO_3225 ?AUTO_3224 ) ) ( ON ?AUTO_3225 ?AUTO_3223 ) ( CLEAR ?AUTO_3225 ) ( ON ?AUTO_3224 ?AUTO_3222 ) ( CLEAR ?AUTO_3224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3224 ?AUTO_3222 )
      ( MAKE-ON ?AUTO_3221 ?AUTO_3222 )
      ( MAKE-ON-VERIFY ?AUTO_3221 ?AUTO_3222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1679 - BLOCK
      ?AUTO_1680 - BLOCK
    )
    :vars
    (
      ?AUTO_1682 - BLOCK
      ?AUTO_1683 - BLOCK
      ?AUTO_1684 - BLOCK
      ?AUTO_1681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1679 ?AUTO_1680 ) ) ( ON-TABLE ?AUTO_1679 ) ( not ( = ?AUTO_1679 ?AUTO_1682 ) ) ( not ( = ?AUTO_1679 ?AUTO_1683 ) ) ( not ( = ?AUTO_1680 ?AUTO_1682 ) ) ( not ( = ?AUTO_1680 ?AUTO_1683 ) ) ( not ( = ?AUTO_1682 ?AUTO_1683 ) ) ( ON ?AUTO_1682 ?AUTO_1679 ) ( not ( = ?AUTO_1679 ?AUTO_1684 ) ) ( not ( = ?AUTO_1680 ?AUTO_1684 ) ) ( not ( = ?AUTO_1683 ?AUTO_1684 ) ) ( not ( = ?AUTO_1682 ?AUTO_1684 ) ) ( ON ?AUTO_1684 ?AUTO_1682 ) ( CLEAR ?AUTO_1684 ) ( not ( = ?AUTO_1679 ?AUTO_1681 ) ) ( not ( = ?AUTO_1680 ?AUTO_1681 ) ) ( not ( = ?AUTO_1682 ?AUTO_1681 ) ) ( not ( = ?AUTO_1683 ?AUTO_1681 ) ) ( not ( = ?AUTO_1684 ?AUTO_1681 ) ) ( ON ?AUTO_1683 ?AUTO_1680 ) ( CLEAR ?AUTO_1683 ) ( HOLDING ?AUTO_1681 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1681 )
      ( MAKE-ON ?AUTO_1679 ?AUTO_1680 )
      ( MAKE-ON-VERIFY ?AUTO_1679 ?AUTO_1680 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1685 - BLOCK
      ?AUTO_1686 - BLOCK
    )
    :vars
    (
      ?AUTO_1687 - BLOCK
      ?AUTO_1688 - BLOCK
      ?AUTO_1690 - BLOCK
      ?AUTO_1689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1685 ?AUTO_1686 ) ) ( ON-TABLE ?AUTO_1685 ) ( not ( = ?AUTO_1685 ?AUTO_1687 ) ) ( not ( = ?AUTO_1685 ?AUTO_1688 ) ) ( not ( = ?AUTO_1686 ?AUTO_1687 ) ) ( not ( = ?AUTO_1686 ?AUTO_1688 ) ) ( not ( = ?AUTO_1687 ?AUTO_1688 ) ) ( ON ?AUTO_1687 ?AUTO_1685 ) ( not ( = ?AUTO_1685 ?AUTO_1690 ) ) ( not ( = ?AUTO_1686 ?AUTO_1690 ) ) ( not ( = ?AUTO_1688 ?AUTO_1690 ) ) ( not ( = ?AUTO_1687 ?AUTO_1690 ) ) ( ON ?AUTO_1690 ?AUTO_1687 ) ( not ( = ?AUTO_1685 ?AUTO_1689 ) ) ( not ( = ?AUTO_1686 ?AUTO_1689 ) ) ( not ( = ?AUTO_1687 ?AUTO_1689 ) ) ( not ( = ?AUTO_1688 ?AUTO_1689 ) ) ( not ( = ?AUTO_1690 ?AUTO_1689 ) ) ( ON ?AUTO_1688 ?AUTO_1686 ) ( CLEAR ?AUTO_1688 ) ( ON ?AUTO_1689 ?AUTO_1690 ) ( CLEAR ?AUTO_1689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1689 ?AUTO_1690 )
      ( MAKE-ON ?AUTO_1685 ?AUTO_1686 )
      ( MAKE-ON-VERIFY ?AUTO_1685 ?AUTO_1686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1691 - BLOCK
      ?AUTO_1692 - BLOCK
    )
    :vars
    (
      ?AUTO_1694 - BLOCK
      ?AUTO_1693 - BLOCK
      ?AUTO_1695 - BLOCK
      ?AUTO_1696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1691 ?AUTO_1692 ) ) ( ON-TABLE ?AUTO_1691 ) ( not ( = ?AUTO_1691 ?AUTO_1694 ) ) ( not ( = ?AUTO_1691 ?AUTO_1693 ) ) ( not ( = ?AUTO_1692 ?AUTO_1694 ) ) ( not ( = ?AUTO_1692 ?AUTO_1693 ) ) ( not ( = ?AUTO_1694 ?AUTO_1693 ) ) ( ON ?AUTO_1694 ?AUTO_1691 ) ( not ( = ?AUTO_1691 ?AUTO_1695 ) ) ( not ( = ?AUTO_1692 ?AUTO_1695 ) ) ( not ( = ?AUTO_1693 ?AUTO_1695 ) ) ( not ( = ?AUTO_1694 ?AUTO_1695 ) ) ( ON ?AUTO_1695 ?AUTO_1694 ) ( not ( = ?AUTO_1691 ?AUTO_1696 ) ) ( not ( = ?AUTO_1692 ?AUTO_1696 ) ) ( not ( = ?AUTO_1694 ?AUTO_1696 ) ) ( not ( = ?AUTO_1693 ?AUTO_1696 ) ) ( not ( = ?AUTO_1695 ?AUTO_1696 ) ) ( ON ?AUTO_1696 ?AUTO_1695 ) ( CLEAR ?AUTO_1696 ) ( HOLDING ?AUTO_1693 ) ( CLEAR ?AUTO_1692 ) )
    :subtasks
    ( ( !STACK ?AUTO_1693 ?AUTO_1692 )
      ( MAKE-ON ?AUTO_1691 ?AUTO_1692 )
      ( MAKE-ON-VERIFY ?AUTO_1691 ?AUTO_1692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1697 - BLOCK
      ?AUTO_1698 - BLOCK
    )
    :vars
    (
      ?AUTO_1700 - BLOCK
      ?AUTO_1699 - BLOCK
      ?AUTO_1701 - BLOCK
      ?AUTO_1702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1697 ?AUTO_1698 ) ) ( ON-TABLE ?AUTO_1697 ) ( not ( = ?AUTO_1697 ?AUTO_1700 ) ) ( not ( = ?AUTO_1697 ?AUTO_1699 ) ) ( not ( = ?AUTO_1698 ?AUTO_1700 ) ) ( not ( = ?AUTO_1698 ?AUTO_1699 ) ) ( not ( = ?AUTO_1700 ?AUTO_1699 ) ) ( ON ?AUTO_1700 ?AUTO_1697 ) ( not ( = ?AUTO_1697 ?AUTO_1701 ) ) ( not ( = ?AUTO_1698 ?AUTO_1701 ) ) ( not ( = ?AUTO_1699 ?AUTO_1701 ) ) ( not ( = ?AUTO_1700 ?AUTO_1701 ) ) ( ON ?AUTO_1701 ?AUTO_1700 ) ( not ( = ?AUTO_1697 ?AUTO_1702 ) ) ( not ( = ?AUTO_1698 ?AUTO_1702 ) ) ( not ( = ?AUTO_1700 ?AUTO_1702 ) ) ( not ( = ?AUTO_1699 ?AUTO_1702 ) ) ( not ( = ?AUTO_1701 ?AUTO_1702 ) ) ( ON ?AUTO_1702 ?AUTO_1701 ) ( CLEAR ?AUTO_1698 ) ( ON ?AUTO_1699 ?AUTO_1702 ) ( CLEAR ?AUTO_1699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1699 ?AUTO_1702 )
      ( MAKE-ON ?AUTO_1697 ?AUTO_1698 )
      ( MAKE-ON-VERIFY ?AUTO_1697 ?AUTO_1698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_785 - BLOCK
      ?AUTO_786 - BLOCK
    )
    :vars
    (
      ?AUTO_789 - BLOCK
      ?AUTO_791 - BLOCK
      ?AUTO_790 - BLOCK
      ?AUTO_788 - BLOCK
      ?AUTO_787 - BLOCK
      ?AUTO_792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_785 ?AUTO_786 ) ) ( ON-TABLE ?AUTO_785 ) ( CLEAR ?AUTO_789 ) ( not ( = ?AUTO_785 ?AUTO_791 ) ) ( not ( = ?AUTO_785 ?AUTO_789 ) ) ( not ( = ?AUTO_786 ?AUTO_791 ) ) ( not ( = ?AUTO_786 ?AUTO_789 ) ) ( not ( = ?AUTO_791 ?AUTO_789 ) ) ( ON ?AUTO_791 ?AUTO_785 ) ( not ( = ?AUTO_785 ?AUTO_790 ) ) ( not ( = ?AUTO_786 ?AUTO_790 ) ) ( not ( = ?AUTO_789 ?AUTO_790 ) ) ( not ( = ?AUTO_791 ?AUTO_790 ) ) ( ON ?AUTO_790 ?AUTO_791 ) ( not ( = ?AUTO_785 ?AUTO_788 ) ) ( not ( = ?AUTO_785 ?AUTO_787 ) ) ( not ( = ?AUTO_786 ?AUTO_788 ) ) ( not ( = ?AUTO_786 ?AUTO_787 ) ) ( not ( = ?AUTO_789 ?AUTO_788 ) ) ( not ( = ?AUTO_789 ?AUTO_787 ) ) ( not ( = ?AUTO_791 ?AUTO_788 ) ) ( not ( = ?AUTO_791 ?AUTO_787 ) ) ( not ( = ?AUTO_790 ?AUTO_788 ) ) ( not ( = ?AUTO_790 ?AUTO_787 ) ) ( not ( = ?AUTO_788 ?AUTO_787 ) ) ( ON ?AUTO_787 ?AUTO_790 ) ( ON ?AUTO_788 ?AUTO_787 ) ( CLEAR ?AUTO_788 ) ( HOLDING ?AUTO_786 ) ( CLEAR ?AUTO_792 ) ( not ( = ?AUTO_785 ?AUTO_792 ) ) ( not ( = ?AUTO_786 ?AUTO_792 ) ) ( not ( = ?AUTO_789 ?AUTO_792 ) ) ( not ( = ?AUTO_791 ?AUTO_792 ) ) ( not ( = ?AUTO_790 ?AUTO_792 ) ) ( not ( = ?AUTO_788 ?AUTO_792 ) ) ( not ( = ?AUTO_787 ?AUTO_792 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_786 ?AUTO_792 )
      ( MAKE-ON ?AUTO_785 ?AUTO_786 )
      ( MAKE-ON-VERIFY ?AUTO_785 ?AUTO_786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_795 - BLOCK
      ?AUTO_796 - BLOCK
    )
    :vars
    (
      ?AUTO_799 - BLOCK
      ?AUTO_801 - BLOCK
      ?AUTO_797 - BLOCK
      ?AUTO_800 - BLOCK
      ?AUTO_798 - BLOCK
      ?AUTO_802 - BLOCK
      ?AUTO_803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_795 ?AUTO_796 ) ) ( ON-TABLE ?AUTO_795 ) ( CLEAR ?AUTO_799 ) ( not ( = ?AUTO_795 ?AUTO_801 ) ) ( not ( = ?AUTO_795 ?AUTO_799 ) ) ( not ( = ?AUTO_796 ?AUTO_801 ) ) ( not ( = ?AUTO_796 ?AUTO_799 ) ) ( not ( = ?AUTO_801 ?AUTO_799 ) ) ( ON ?AUTO_801 ?AUTO_795 ) ( not ( = ?AUTO_795 ?AUTO_797 ) ) ( not ( = ?AUTO_796 ?AUTO_797 ) ) ( not ( = ?AUTO_799 ?AUTO_797 ) ) ( not ( = ?AUTO_801 ?AUTO_797 ) ) ( ON ?AUTO_797 ?AUTO_801 ) ( not ( = ?AUTO_795 ?AUTO_800 ) ) ( not ( = ?AUTO_795 ?AUTO_798 ) ) ( not ( = ?AUTO_796 ?AUTO_800 ) ) ( not ( = ?AUTO_796 ?AUTO_798 ) ) ( not ( = ?AUTO_799 ?AUTO_800 ) ) ( not ( = ?AUTO_799 ?AUTO_798 ) ) ( not ( = ?AUTO_801 ?AUTO_800 ) ) ( not ( = ?AUTO_801 ?AUTO_798 ) ) ( not ( = ?AUTO_797 ?AUTO_800 ) ) ( not ( = ?AUTO_797 ?AUTO_798 ) ) ( not ( = ?AUTO_800 ?AUTO_798 ) ) ( ON ?AUTO_798 ?AUTO_797 ) ( CLEAR ?AUTO_796 ) ( ON ?AUTO_800 ?AUTO_798 ) ( CLEAR ?AUTO_800 ) ( HOLDING ?AUTO_802 ) ( CLEAR ?AUTO_803 ) ( not ( = ?AUTO_795 ?AUTO_802 ) ) ( not ( = ?AUTO_795 ?AUTO_803 ) ) ( not ( = ?AUTO_796 ?AUTO_802 ) ) ( not ( = ?AUTO_796 ?AUTO_803 ) ) ( not ( = ?AUTO_799 ?AUTO_802 ) ) ( not ( = ?AUTO_799 ?AUTO_803 ) ) ( not ( = ?AUTO_801 ?AUTO_802 ) ) ( not ( = ?AUTO_801 ?AUTO_803 ) ) ( not ( = ?AUTO_797 ?AUTO_802 ) ) ( not ( = ?AUTO_797 ?AUTO_803 ) ) ( not ( = ?AUTO_800 ?AUTO_802 ) ) ( not ( = ?AUTO_800 ?AUTO_803 ) ) ( not ( = ?AUTO_798 ?AUTO_802 ) ) ( not ( = ?AUTO_798 ?AUTO_803 ) ) ( not ( = ?AUTO_802 ?AUTO_803 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_802 ?AUTO_803 )
      ( MAKE-ON ?AUTO_795 ?AUTO_796 )
      ( MAKE-ON-VERIFY ?AUTO_795 ?AUTO_796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_808 - BLOCK
      ?AUTO_809 - BLOCK
    )
    :vars
    (
      ?AUTO_813 - BLOCK
      ?AUTO_814 - BLOCK
      ?AUTO_811 - BLOCK
      ?AUTO_810 - BLOCK
      ?AUTO_812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_808 ?AUTO_809 ) ) ( ON-TABLE ?AUTO_808 ) ( CLEAR ?AUTO_813 ) ( not ( = ?AUTO_808 ?AUTO_814 ) ) ( not ( = ?AUTO_808 ?AUTO_813 ) ) ( not ( = ?AUTO_809 ?AUTO_814 ) ) ( not ( = ?AUTO_809 ?AUTO_813 ) ) ( not ( = ?AUTO_814 ?AUTO_813 ) ) ( ON ?AUTO_814 ?AUTO_808 ) ( not ( = ?AUTO_808 ?AUTO_811 ) ) ( not ( = ?AUTO_809 ?AUTO_811 ) ) ( not ( = ?AUTO_813 ?AUTO_811 ) ) ( not ( = ?AUTO_814 ?AUTO_811 ) ) ( ON ?AUTO_811 ?AUTO_814 ) ( not ( = ?AUTO_808 ?AUTO_810 ) ) ( not ( = ?AUTO_808 ?AUTO_812 ) ) ( not ( = ?AUTO_809 ?AUTO_810 ) ) ( not ( = ?AUTO_809 ?AUTO_812 ) ) ( not ( = ?AUTO_813 ?AUTO_810 ) ) ( not ( = ?AUTO_813 ?AUTO_812 ) ) ( not ( = ?AUTO_814 ?AUTO_810 ) ) ( not ( = ?AUTO_814 ?AUTO_812 ) ) ( not ( = ?AUTO_811 ?AUTO_810 ) ) ( not ( = ?AUTO_811 ?AUTO_812 ) ) ( not ( = ?AUTO_810 ?AUTO_812 ) ) ( ON ?AUTO_812 ?AUTO_811 ) ( CLEAR ?AUTO_812 ) ( CLEAR ?AUTO_809 ) ( ON-TABLE ?AUTO_810 ) ( CLEAR ?AUTO_810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_810 )
      ( MAKE-ON ?AUTO_808 ?AUTO_809 )
      ( MAKE-ON-VERIFY ?AUTO_808 ?AUTO_809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_817 - BLOCK
      ?AUTO_818 - BLOCK
    )
    :vars
    (
      ?AUTO_819 - BLOCK
      ?AUTO_823 - BLOCK
      ?AUTO_821 - BLOCK
      ?AUTO_822 - BLOCK
      ?AUTO_820 - BLOCK
      ?AUTO_824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_817 ?AUTO_818 ) ) ( ON-TABLE ?AUTO_817 ) ( CLEAR ?AUTO_819 ) ( not ( = ?AUTO_817 ?AUTO_823 ) ) ( not ( = ?AUTO_817 ?AUTO_819 ) ) ( not ( = ?AUTO_818 ?AUTO_823 ) ) ( not ( = ?AUTO_818 ?AUTO_819 ) ) ( not ( = ?AUTO_823 ?AUTO_819 ) ) ( ON ?AUTO_823 ?AUTO_817 ) ( not ( = ?AUTO_817 ?AUTO_821 ) ) ( not ( = ?AUTO_818 ?AUTO_821 ) ) ( not ( = ?AUTO_819 ?AUTO_821 ) ) ( not ( = ?AUTO_823 ?AUTO_821 ) ) ( ON ?AUTO_821 ?AUTO_823 ) ( not ( = ?AUTO_817 ?AUTO_822 ) ) ( not ( = ?AUTO_817 ?AUTO_820 ) ) ( not ( = ?AUTO_818 ?AUTO_822 ) ) ( not ( = ?AUTO_818 ?AUTO_820 ) ) ( not ( = ?AUTO_819 ?AUTO_822 ) ) ( not ( = ?AUTO_819 ?AUTO_820 ) ) ( not ( = ?AUTO_823 ?AUTO_822 ) ) ( not ( = ?AUTO_823 ?AUTO_820 ) ) ( not ( = ?AUTO_821 ?AUTO_822 ) ) ( not ( = ?AUTO_821 ?AUTO_820 ) ) ( not ( = ?AUTO_822 ?AUTO_820 ) ) ( ON ?AUTO_820 ?AUTO_821 ) ( CLEAR ?AUTO_820 ) ( CLEAR ?AUTO_818 ) ( ON ?AUTO_822 ?AUTO_824 ) ( CLEAR ?AUTO_822 ) ( HAND-EMPTY ) ( not ( = ?AUTO_817 ?AUTO_824 ) ) ( not ( = ?AUTO_818 ?AUTO_824 ) ) ( not ( = ?AUTO_819 ?AUTO_824 ) ) ( not ( = ?AUTO_823 ?AUTO_824 ) ) ( not ( = ?AUTO_821 ?AUTO_824 ) ) ( not ( = ?AUTO_822 ?AUTO_824 ) ) ( not ( = ?AUTO_820 ?AUTO_824 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_822 ?AUTO_824 )
      ( MAKE-ON ?AUTO_817 ?AUTO_818 )
      ( MAKE-ON-VERIFY ?AUTO_817 ?AUTO_818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_831 - BLOCK
      ?AUTO_832 - BLOCK
    )
    :vars
    (
      ?AUTO_834 - BLOCK
      ?AUTO_833 - BLOCK
      ?AUTO_835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_831 ?AUTO_832 ) ) ( ON-TABLE ?AUTO_831 ) ( not ( = ?AUTO_831 ?AUTO_834 ) ) ( not ( = ?AUTO_832 ?AUTO_834 ) ) ( ON ?AUTO_834 ?AUTO_831 ) ( CLEAR ?AUTO_833 ) ( not ( = ?AUTO_831 ?AUTO_835 ) ) ( not ( = ?AUTO_831 ?AUTO_833 ) ) ( not ( = ?AUTO_832 ?AUTO_835 ) ) ( not ( = ?AUTO_832 ?AUTO_833 ) ) ( not ( = ?AUTO_834 ?AUTO_835 ) ) ( not ( = ?AUTO_834 ?AUTO_833 ) ) ( not ( = ?AUTO_835 ?AUTO_833 ) ) ( ON ?AUTO_835 ?AUTO_834 ) ( ON ?AUTO_832 ?AUTO_835 ) ( CLEAR ?AUTO_832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_832 ?AUTO_835 )
      ( MAKE-ON ?AUTO_831 ?AUTO_832 )
      ( MAKE-ON-VERIFY ?AUTO_831 ?AUTO_832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2059 - BLOCK
      ?AUTO_2060 - BLOCK
    )
    :vars
    (
      ?AUTO_2061 - BLOCK
      ?AUTO_2063 - BLOCK
      ?AUTO_2062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2059 ?AUTO_2060 ) ) ( ON ?AUTO_2059 ?AUTO_2061 ) ( CLEAR ?AUTO_2059 ) ( not ( = ?AUTO_2059 ?AUTO_2061 ) ) ( not ( = ?AUTO_2060 ?AUTO_2061 ) ) ( not ( = ?AUTO_2059 ?AUTO_2063 ) ) ( not ( = ?AUTO_2060 ?AUTO_2063 ) ) ( not ( = ?AUTO_2061 ?AUTO_2063 ) ) ( ON ?AUTO_2063 ?AUTO_2060 ) ( not ( = ?AUTO_2059 ?AUTO_2062 ) ) ( not ( = ?AUTO_2060 ?AUTO_2062 ) ) ( not ( = ?AUTO_2061 ?AUTO_2062 ) ) ( not ( = ?AUTO_2063 ?AUTO_2062 ) ) ( ON ?AUTO_2062 ?AUTO_2063 ) ( CLEAR ?AUTO_2062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2062 ?AUTO_2063 )
      ( MAKE-ON ?AUTO_2059 ?AUTO_2060 )
      ( MAKE-ON-VERIFY ?AUTO_2059 ?AUTO_2060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_875 - BLOCK
      ?AUTO_876 - BLOCK
    )
    :vars
    (
      ?AUTO_878 - BLOCK
      ?AUTO_880 - BLOCK
      ?AUTO_879 - BLOCK
      ?AUTO_877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_875 ?AUTO_876 ) ) ( not ( = ?AUTO_875 ?AUTO_878 ) ) ( not ( = ?AUTO_876 ?AUTO_878 ) ) ( CLEAR ?AUTO_880 ) ( not ( = ?AUTO_875 ?AUTO_879 ) ) ( not ( = ?AUTO_875 ?AUTO_880 ) ) ( not ( = ?AUTO_876 ?AUTO_879 ) ) ( not ( = ?AUTO_876 ?AUTO_880 ) ) ( not ( = ?AUTO_878 ?AUTO_879 ) ) ( not ( = ?AUTO_878 ?AUTO_880 ) ) ( not ( = ?AUTO_879 ?AUTO_880 ) ) ( ON ?AUTO_879 ?AUTO_876 ) ( not ( = ?AUTO_875 ?AUTO_877 ) ) ( not ( = ?AUTO_876 ?AUTO_877 ) ) ( not ( = ?AUTO_878 ?AUTO_877 ) ) ( not ( = ?AUTO_880 ?AUTO_877 ) ) ( not ( = ?AUTO_879 ?AUTO_877 ) ) ( ON ?AUTO_877 ?AUTO_879 ) ( CLEAR ?AUTO_877 ) ( HOLDING ?AUTO_875 ) ( CLEAR ?AUTO_878 ) )
    :subtasks
    ( ( !STACK ?AUTO_875 ?AUTO_878 )
      ( MAKE-ON ?AUTO_875 ?AUTO_876 )
      ( MAKE-ON-VERIFY ?AUTO_875 ?AUTO_876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1321 - BLOCK
      ?AUTO_1322 - BLOCK
    )
    :vars
    (
      ?AUTO_1325 - BLOCK
      ?AUTO_1326 - BLOCK
      ?AUTO_1323 - BLOCK
      ?AUTO_1324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1321 ?AUTO_1322 ) ) ( ON ?AUTO_1321 ?AUTO_1325 ) ( CLEAR ?AUTO_1321 ) ( not ( = ?AUTO_1321 ?AUTO_1325 ) ) ( not ( = ?AUTO_1322 ?AUTO_1325 ) ) ( not ( = ?AUTO_1321 ?AUTO_1326 ) ) ( not ( = ?AUTO_1321 ?AUTO_1323 ) ) ( not ( = ?AUTO_1322 ?AUTO_1326 ) ) ( not ( = ?AUTO_1322 ?AUTO_1323 ) ) ( not ( = ?AUTO_1325 ?AUTO_1326 ) ) ( not ( = ?AUTO_1325 ?AUTO_1323 ) ) ( not ( = ?AUTO_1326 ?AUTO_1323 ) ) ( ON ?AUTO_1326 ?AUTO_1322 ) ( not ( = ?AUTO_1321 ?AUTO_1324 ) ) ( not ( = ?AUTO_1322 ?AUTO_1324 ) ) ( not ( = ?AUTO_1325 ?AUTO_1324 ) ) ( not ( = ?AUTO_1323 ?AUTO_1324 ) ) ( not ( = ?AUTO_1326 ?AUTO_1324 ) ) ( ON ?AUTO_1324 ?AUTO_1326 ) ( CLEAR ?AUTO_1324 ) ( HOLDING ?AUTO_1323 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1323 )
      ( MAKE-ON ?AUTO_1321 ?AUTO_1322 )
      ( MAKE-ON-VERIFY ?AUTO_1321 ?AUTO_1322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1327 - BLOCK
      ?AUTO_1328 - BLOCK
    )
    :vars
    (
      ?AUTO_1331 - BLOCK
      ?AUTO_1330 - BLOCK
      ?AUTO_1332 - BLOCK
      ?AUTO_1329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1327 ?AUTO_1328 ) ) ( ON ?AUTO_1327 ?AUTO_1331 ) ( CLEAR ?AUTO_1327 ) ( not ( = ?AUTO_1327 ?AUTO_1331 ) ) ( not ( = ?AUTO_1328 ?AUTO_1331 ) ) ( not ( = ?AUTO_1327 ?AUTO_1330 ) ) ( not ( = ?AUTO_1327 ?AUTO_1332 ) ) ( not ( = ?AUTO_1328 ?AUTO_1330 ) ) ( not ( = ?AUTO_1328 ?AUTO_1332 ) ) ( not ( = ?AUTO_1331 ?AUTO_1330 ) ) ( not ( = ?AUTO_1331 ?AUTO_1332 ) ) ( not ( = ?AUTO_1330 ?AUTO_1332 ) ) ( ON ?AUTO_1330 ?AUTO_1328 ) ( not ( = ?AUTO_1327 ?AUTO_1329 ) ) ( not ( = ?AUTO_1328 ?AUTO_1329 ) ) ( not ( = ?AUTO_1331 ?AUTO_1329 ) ) ( not ( = ?AUTO_1332 ?AUTO_1329 ) ) ( not ( = ?AUTO_1330 ?AUTO_1329 ) ) ( ON ?AUTO_1329 ?AUTO_1330 ) ( ON ?AUTO_1332 ?AUTO_1329 ) ( CLEAR ?AUTO_1332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1332 ?AUTO_1329 )
      ( MAKE-ON ?AUTO_1327 ?AUTO_1328 )
      ( MAKE-ON-VERIFY ?AUTO_1327 ?AUTO_1328 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_897 - BLOCK
      ?AUTO_898 - BLOCK
    )
    :vars
    (
      ?AUTO_900 - BLOCK
      ?AUTO_903 - BLOCK
      ?AUTO_902 - BLOCK
      ?AUTO_899 - BLOCK
      ?AUTO_901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_897 ?AUTO_898 ) ) ( not ( = ?AUTO_897 ?AUTO_900 ) ) ( not ( = ?AUTO_898 ?AUTO_900 ) ) ( CLEAR ?AUTO_903 ) ( not ( = ?AUTO_897 ?AUTO_902 ) ) ( not ( = ?AUTO_897 ?AUTO_903 ) ) ( not ( = ?AUTO_898 ?AUTO_902 ) ) ( not ( = ?AUTO_898 ?AUTO_903 ) ) ( not ( = ?AUTO_900 ?AUTO_902 ) ) ( not ( = ?AUTO_900 ?AUTO_903 ) ) ( not ( = ?AUTO_902 ?AUTO_903 ) ) ( ON ?AUTO_902 ?AUTO_898 ) ( not ( = ?AUTO_897 ?AUTO_899 ) ) ( not ( = ?AUTO_898 ?AUTO_899 ) ) ( not ( = ?AUTO_900 ?AUTO_899 ) ) ( not ( = ?AUTO_903 ?AUTO_899 ) ) ( not ( = ?AUTO_902 ?AUTO_899 ) ) ( ON ?AUTO_899 ?AUTO_902 ) ( not ( = ?AUTO_897 ?AUTO_901 ) ) ( not ( = ?AUTO_898 ?AUTO_901 ) ) ( not ( = ?AUTO_900 ?AUTO_901 ) ) ( not ( = ?AUTO_903 ?AUTO_901 ) ) ( not ( = ?AUTO_902 ?AUTO_901 ) ) ( not ( = ?AUTO_899 ?AUTO_901 ) ) ( ON ?AUTO_901 ?AUTO_899 ) ( CLEAR ?AUTO_901 ) ( HOLDING ?AUTO_897 ) ( CLEAR ?AUTO_900 ) )
    :subtasks
    ( ( !STACK ?AUTO_897 ?AUTO_900 )
      ( MAKE-ON ?AUTO_897 ?AUTO_898 )
      ( MAKE-ON-VERIFY ?AUTO_897 ?AUTO_898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6125 - BLOCK
      ?AUTO_6126 - BLOCK
    )
    :vars
    (
      ?AUTO_6129 - BLOCK
      ?AUTO_6127 - BLOCK
      ?AUTO_6128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6125 ?AUTO_6126 ) ) ( not ( = ?AUTO_6125 ?AUTO_6129 ) ) ( not ( = ?AUTO_6125 ?AUTO_6127 ) ) ( not ( = ?AUTO_6126 ?AUTO_6129 ) ) ( not ( = ?AUTO_6126 ?AUTO_6127 ) ) ( not ( = ?AUTO_6129 ?AUTO_6127 ) ) ( ON ?AUTO_6127 ?AUTO_6126 ) ( not ( = ?AUTO_6125 ?AUTO_6128 ) ) ( not ( = ?AUTO_6126 ?AUTO_6128 ) ) ( not ( = ?AUTO_6129 ?AUTO_6128 ) ) ( not ( = ?AUTO_6127 ?AUTO_6128 ) ) ( ON ?AUTO_6128 ?AUTO_6127 ) ( ON ?AUTO_6129 ?AUTO_6128 ) ( ON ?AUTO_6125 ?AUTO_6129 ) ( CLEAR ?AUTO_6125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6125 ?AUTO_6129 )
      ( MAKE-ON ?AUTO_6125 ?AUTO_6126 )
      ( MAKE-ON-VERIFY ?AUTO_6125 ?AUTO_6126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_911 - BLOCK
      ?AUTO_912 - BLOCK
    )
    :vars
    (
      ?AUTO_913 - BLOCK
      ?AUTO_915 - BLOCK
      ?AUTO_917 - BLOCK
      ?AUTO_914 - BLOCK
      ?AUTO_916 - BLOCK
      ?AUTO_918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_911 ?AUTO_912 ) ) ( not ( = ?AUTO_911 ?AUTO_913 ) ) ( not ( = ?AUTO_912 ?AUTO_913 ) ) ( CLEAR ?AUTO_915 ) ( not ( = ?AUTO_911 ?AUTO_917 ) ) ( not ( = ?AUTO_911 ?AUTO_915 ) ) ( not ( = ?AUTO_912 ?AUTO_917 ) ) ( not ( = ?AUTO_912 ?AUTO_915 ) ) ( not ( = ?AUTO_913 ?AUTO_917 ) ) ( not ( = ?AUTO_913 ?AUTO_915 ) ) ( not ( = ?AUTO_917 ?AUTO_915 ) ) ( ON ?AUTO_917 ?AUTO_912 ) ( not ( = ?AUTO_911 ?AUTO_914 ) ) ( not ( = ?AUTO_912 ?AUTO_914 ) ) ( not ( = ?AUTO_913 ?AUTO_914 ) ) ( not ( = ?AUTO_915 ?AUTO_914 ) ) ( not ( = ?AUTO_917 ?AUTO_914 ) ) ( ON ?AUTO_914 ?AUTO_917 ) ( not ( = ?AUTO_911 ?AUTO_916 ) ) ( not ( = ?AUTO_912 ?AUTO_916 ) ) ( not ( = ?AUTO_913 ?AUTO_916 ) ) ( not ( = ?AUTO_915 ?AUTO_916 ) ) ( not ( = ?AUTO_917 ?AUTO_916 ) ) ( not ( = ?AUTO_914 ?AUTO_916 ) ) ( ON ?AUTO_916 ?AUTO_914 ) ( ON ?AUTO_911 ?AUTO_916 ) ( CLEAR ?AUTO_911 ) ( HOLDING ?AUTO_913 ) ( CLEAR ?AUTO_918 ) ( not ( = ?AUTO_911 ?AUTO_918 ) ) ( not ( = ?AUTO_912 ?AUTO_918 ) ) ( not ( = ?AUTO_913 ?AUTO_918 ) ) ( not ( = ?AUTO_915 ?AUTO_918 ) ) ( not ( = ?AUTO_917 ?AUTO_918 ) ) ( not ( = ?AUTO_914 ?AUTO_918 ) ) ( not ( = ?AUTO_916 ?AUTO_918 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_913 ?AUTO_918 )
      ( MAKE-ON ?AUTO_911 ?AUTO_912 )
      ( MAKE-ON-VERIFY ?AUTO_911 ?AUTO_912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_927 - BLOCK
      ?AUTO_928 - BLOCK
    )
    :vars
    (
      ?AUTO_931 - BLOCK
      ?AUTO_930 - BLOCK
      ?AUTO_929 - BLOCK
      ?AUTO_932 - BLOCK
      ?AUTO_933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_927 ?AUTO_928 ) ) ( not ( = ?AUTO_927 ?AUTO_931 ) ) ( not ( = ?AUTO_928 ?AUTO_931 ) ) ( CLEAR ?AUTO_930 ) ( not ( = ?AUTO_927 ?AUTO_929 ) ) ( not ( = ?AUTO_927 ?AUTO_930 ) ) ( not ( = ?AUTO_928 ?AUTO_929 ) ) ( not ( = ?AUTO_928 ?AUTO_930 ) ) ( not ( = ?AUTO_931 ?AUTO_929 ) ) ( not ( = ?AUTO_931 ?AUTO_930 ) ) ( not ( = ?AUTO_929 ?AUTO_930 ) ) ( ON ?AUTO_929 ?AUTO_928 ) ( not ( = ?AUTO_927 ?AUTO_932 ) ) ( not ( = ?AUTO_928 ?AUTO_932 ) ) ( not ( = ?AUTO_931 ?AUTO_932 ) ) ( not ( = ?AUTO_930 ?AUTO_932 ) ) ( not ( = ?AUTO_929 ?AUTO_932 ) ) ( ON ?AUTO_932 ?AUTO_929 ) ( not ( = ?AUTO_927 ?AUTO_933 ) ) ( not ( = ?AUTO_928 ?AUTO_933 ) ) ( not ( = ?AUTO_931 ?AUTO_933 ) ) ( not ( = ?AUTO_930 ?AUTO_933 ) ) ( not ( = ?AUTO_929 ?AUTO_933 ) ) ( not ( = ?AUTO_932 ?AUTO_933 ) ) ( ON ?AUTO_933 ?AUTO_932 ) ( CLEAR ?AUTO_933 ) ( CLEAR ?AUTO_931 ) ( ON-TABLE ?AUTO_927 ) ( CLEAR ?AUTO_927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_927 )
      ( MAKE-ON ?AUTO_927 ?AUTO_928 )
      ( MAKE-ON-VERIFY ?AUTO_927 ?AUTO_928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1882 - BLOCK
      ?AUTO_1883 - BLOCK
    )
    :vars
    (
      ?AUTO_1885 - BLOCK
      ?AUTO_1884 - BLOCK
      ?AUTO_1886 - BLOCK
      ?AUTO_1888 - BLOCK
      ?AUTO_1887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1882 ?AUTO_1883 ) ) ( ON-TABLE ?AUTO_1882 ) ( CLEAR ?AUTO_1882 ) ( not ( = ?AUTO_1882 ?AUTO_1885 ) ) ( not ( = ?AUTO_1882 ?AUTO_1884 ) ) ( not ( = ?AUTO_1883 ?AUTO_1885 ) ) ( not ( = ?AUTO_1883 ?AUTO_1884 ) ) ( not ( = ?AUTO_1885 ?AUTO_1884 ) ) ( ON ?AUTO_1885 ?AUTO_1883 ) ( CLEAR ?AUTO_1886 ) ( not ( = ?AUTO_1882 ?AUTO_1888 ) ) ( not ( = ?AUTO_1882 ?AUTO_1886 ) ) ( not ( = ?AUTO_1883 ?AUTO_1888 ) ) ( not ( = ?AUTO_1883 ?AUTO_1886 ) ) ( not ( = ?AUTO_1884 ?AUTO_1888 ) ) ( not ( = ?AUTO_1884 ?AUTO_1886 ) ) ( not ( = ?AUTO_1885 ?AUTO_1888 ) ) ( not ( = ?AUTO_1885 ?AUTO_1886 ) ) ( not ( = ?AUTO_1888 ?AUTO_1886 ) ) ( ON ?AUTO_1888 ?AUTO_1885 ) ( not ( = ?AUTO_1882 ?AUTO_1887 ) ) ( not ( = ?AUTO_1883 ?AUTO_1887 ) ) ( not ( = ?AUTO_1884 ?AUTO_1887 ) ) ( not ( = ?AUTO_1885 ?AUTO_1887 ) ) ( not ( = ?AUTO_1886 ?AUTO_1887 ) ) ( not ( = ?AUTO_1888 ?AUTO_1887 ) ) ( ON ?AUTO_1887 ?AUTO_1888 ) ( CLEAR ?AUTO_1887 ) ( HOLDING ?AUTO_1884 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1884 )
      ( MAKE-ON ?AUTO_1882 ?AUTO_1883 )
      ( MAKE-ON-VERIFY ?AUTO_1882 ?AUTO_1883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1889 - BLOCK
      ?AUTO_1890 - BLOCK
    )
    :vars
    (
      ?AUTO_1892 - BLOCK
      ?AUTO_1894 - BLOCK
      ?AUTO_1895 - BLOCK
      ?AUTO_1893 - BLOCK
      ?AUTO_1891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1889 ?AUTO_1890 ) ) ( ON-TABLE ?AUTO_1889 ) ( not ( = ?AUTO_1889 ?AUTO_1892 ) ) ( not ( = ?AUTO_1889 ?AUTO_1894 ) ) ( not ( = ?AUTO_1890 ?AUTO_1892 ) ) ( not ( = ?AUTO_1890 ?AUTO_1894 ) ) ( not ( = ?AUTO_1892 ?AUTO_1894 ) ) ( ON ?AUTO_1892 ?AUTO_1890 ) ( CLEAR ?AUTO_1895 ) ( not ( = ?AUTO_1889 ?AUTO_1893 ) ) ( not ( = ?AUTO_1889 ?AUTO_1895 ) ) ( not ( = ?AUTO_1890 ?AUTO_1893 ) ) ( not ( = ?AUTO_1890 ?AUTO_1895 ) ) ( not ( = ?AUTO_1894 ?AUTO_1893 ) ) ( not ( = ?AUTO_1894 ?AUTO_1895 ) ) ( not ( = ?AUTO_1892 ?AUTO_1893 ) ) ( not ( = ?AUTO_1892 ?AUTO_1895 ) ) ( not ( = ?AUTO_1893 ?AUTO_1895 ) ) ( ON ?AUTO_1893 ?AUTO_1892 ) ( not ( = ?AUTO_1889 ?AUTO_1891 ) ) ( not ( = ?AUTO_1890 ?AUTO_1891 ) ) ( not ( = ?AUTO_1894 ?AUTO_1891 ) ) ( not ( = ?AUTO_1892 ?AUTO_1891 ) ) ( not ( = ?AUTO_1895 ?AUTO_1891 ) ) ( not ( = ?AUTO_1893 ?AUTO_1891 ) ) ( ON ?AUTO_1891 ?AUTO_1893 ) ( CLEAR ?AUTO_1891 ) ( ON ?AUTO_1894 ?AUTO_1889 ) ( CLEAR ?AUTO_1894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1894 ?AUTO_1889 )
      ( MAKE-ON ?AUTO_1889 ?AUTO_1890 )
      ( MAKE-ON-VERIFY ?AUTO_1889 ?AUTO_1890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_950 - BLOCK
      ?AUTO_951 - BLOCK
    )
    :vars
    (
      ?AUTO_957 - BLOCK
      ?AUTO_953 - BLOCK
      ?AUTO_956 - BLOCK
      ?AUTO_954 - BLOCK
      ?AUTO_952 - BLOCK
      ?AUTO_955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_950 ?AUTO_951 ) ) ( not ( = ?AUTO_950 ?AUTO_957 ) ) ( not ( = ?AUTO_951 ?AUTO_957 ) ) ( CLEAR ?AUTO_953 ) ( not ( = ?AUTO_950 ?AUTO_956 ) ) ( not ( = ?AUTO_950 ?AUTO_953 ) ) ( not ( = ?AUTO_951 ?AUTO_956 ) ) ( not ( = ?AUTO_951 ?AUTO_953 ) ) ( not ( = ?AUTO_957 ?AUTO_956 ) ) ( not ( = ?AUTO_957 ?AUTO_953 ) ) ( not ( = ?AUTO_956 ?AUTO_953 ) ) ( ON ?AUTO_956 ?AUTO_951 ) ( not ( = ?AUTO_950 ?AUTO_954 ) ) ( not ( = ?AUTO_951 ?AUTO_954 ) ) ( not ( = ?AUTO_957 ?AUTO_954 ) ) ( not ( = ?AUTO_953 ?AUTO_954 ) ) ( not ( = ?AUTO_956 ?AUTO_954 ) ) ( ON ?AUTO_954 ?AUTO_956 ) ( not ( = ?AUTO_950 ?AUTO_952 ) ) ( not ( = ?AUTO_951 ?AUTO_952 ) ) ( not ( = ?AUTO_957 ?AUTO_952 ) ) ( not ( = ?AUTO_953 ?AUTO_952 ) ) ( not ( = ?AUTO_956 ?AUTO_952 ) ) ( not ( = ?AUTO_954 ?AUTO_952 ) ) ( CLEAR ?AUTO_957 ) ( ON-TABLE ?AUTO_950 ) ( not ( = ?AUTO_950 ?AUTO_955 ) ) ( not ( = ?AUTO_951 ?AUTO_955 ) ) ( not ( = ?AUTO_957 ?AUTO_955 ) ) ( not ( = ?AUTO_953 ?AUTO_955 ) ) ( not ( = ?AUTO_956 ?AUTO_955 ) ) ( not ( = ?AUTO_954 ?AUTO_955 ) ) ( not ( = ?AUTO_952 ?AUTO_955 ) ) ( ON ?AUTO_955 ?AUTO_950 ) ( CLEAR ?AUTO_955 ) ( HOLDING ?AUTO_952 ) ( CLEAR ?AUTO_954 ) )
    :subtasks
    ( ( !STACK ?AUTO_952 ?AUTO_954 )
      ( MAKE-ON ?AUTO_950 ?AUTO_951 )
      ( MAKE-ON-VERIFY ?AUTO_950 ?AUTO_951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2821 - BLOCK
      ?AUTO_2822 - BLOCK
    )
    :vars
    (
      ?AUTO_2824 - BLOCK
      ?AUTO_2823 - BLOCK
      ?AUTO_2826 - BLOCK
      ?AUTO_2825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2821 ?AUTO_2822 ) ) ( ON-TABLE ?AUTO_2821 ) ( not ( = ?AUTO_2821 ?AUTO_2824 ) ) ( not ( = ?AUTO_2822 ?AUTO_2824 ) ) ( not ( = ?AUTO_2821 ?AUTO_2823 ) ) ( not ( = ?AUTO_2822 ?AUTO_2823 ) ) ( not ( = ?AUTO_2824 ?AUTO_2823 ) ) ( ON ?AUTO_2823 ?AUTO_2822 ) ( ON ?AUTO_2824 ?AUTO_2823 ) ( CLEAR ?AUTO_2824 ) ( not ( = ?AUTO_2821 ?AUTO_2826 ) ) ( not ( = ?AUTO_2821 ?AUTO_2825 ) ) ( not ( = ?AUTO_2822 ?AUTO_2826 ) ) ( not ( = ?AUTO_2822 ?AUTO_2825 ) ) ( not ( = ?AUTO_2824 ?AUTO_2826 ) ) ( not ( = ?AUTO_2824 ?AUTO_2825 ) ) ( not ( = ?AUTO_2823 ?AUTO_2826 ) ) ( not ( = ?AUTO_2823 ?AUTO_2825 ) ) ( not ( = ?AUTO_2826 ?AUTO_2825 ) ) ( ON ?AUTO_2826 ?AUTO_2821 ) ( ON ?AUTO_2825 ?AUTO_2826 ) ( CLEAR ?AUTO_2825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2825 ?AUTO_2826 )
      ( MAKE-ON ?AUTO_2821 ?AUTO_2822 )
      ( MAKE-ON-VERIFY ?AUTO_2821 ?AUTO_2822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_966 - BLOCK
      ?AUTO_967 - BLOCK
    )
    :vars
    (
      ?AUTO_969 - BLOCK
      ?AUTO_973 - BLOCK
      ?AUTO_971 - BLOCK
      ?AUTO_972 - BLOCK
      ?AUTO_968 - BLOCK
      ?AUTO_970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_966 ?AUTO_967 ) ) ( not ( = ?AUTO_966 ?AUTO_969 ) ) ( not ( = ?AUTO_967 ?AUTO_969 ) ) ( not ( = ?AUTO_966 ?AUTO_973 ) ) ( not ( = ?AUTO_966 ?AUTO_971 ) ) ( not ( = ?AUTO_967 ?AUTO_973 ) ) ( not ( = ?AUTO_967 ?AUTO_971 ) ) ( not ( = ?AUTO_969 ?AUTO_973 ) ) ( not ( = ?AUTO_969 ?AUTO_971 ) ) ( not ( = ?AUTO_973 ?AUTO_971 ) ) ( ON ?AUTO_973 ?AUTO_967 ) ( not ( = ?AUTO_966 ?AUTO_972 ) ) ( not ( = ?AUTO_967 ?AUTO_972 ) ) ( not ( = ?AUTO_969 ?AUTO_972 ) ) ( not ( = ?AUTO_971 ?AUTO_972 ) ) ( not ( = ?AUTO_973 ?AUTO_972 ) ) ( ON ?AUTO_972 ?AUTO_973 ) ( not ( = ?AUTO_966 ?AUTO_968 ) ) ( not ( = ?AUTO_967 ?AUTO_968 ) ) ( not ( = ?AUTO_969 ?AUTO_968 ) ) ( not ( = ?AUTO_971 ?AUTO_968 ) ) ( not ( = ?AUTO_973 ?AUTO_968 ) ) ( not ( = ?AUTO_972 ?AUTO_968 ) ) ( CLEAR ?AUTO_969 ) ( ON-TABLE ?AUTO_966 ) ( not ( = ?AUTO_966 ?AUTO_970 ) ) ( not ( = ?AUTO_967 ?AUTO_970 ) ) ( not ( = ?AUTO_969 ?AUTO_970 ) ) ( not ( = ?AUTO_971 ?AUTO_970 ) ) ( not ( = ?AUTO_973 ?AUTO_970 ) ) ( not ( = ?AUTO_972 ?AUTO_970 ) ) ( not ( = ?AUTO_968 ?AUTO_970 ) ) ( ON ?AUTO_970 ?AUTO_966 ) ( CLEAR ?AUTO_972 ) ( ON ?AUTO_968 ?AUTO_970 ) ( CLEAR ?AUTO_968 ) ( HOLDING ?AUTO_971 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_971 )
      ( MAKE-ON ?AUTO_966 ?AUTO_967 )
      ( MAKE-ON-VERIFY ?AUTO_966 ?AUTO_967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_974 - BLOCK
      ?AUTO_975 - BLOCK
    )
    :vars
    (
      ?AUTO_976 - BLOCK
      ?AUTO_977 - BLOCK
      ?AUTO_981 - BLOCK
      ?AUTO_980 - BLOCK
      ?AUTO_979 - BLOCK
      ?AUTO_978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_974 ?AUTO_975 ) ) ( not ( = ?AUTO_974 ?AUTO_976 ) ) ( not ( = ?AUTO_975 ?AUTO_976 ) ) ( not ( = ?AUTO_974 ?AUTO_977 ) ) ( not ( = ?AUTO_974 ?AUTO_981 ) ) ( not ( = ?AUTO_975 ?AUTO_977 ) ) ( not ( = ?AUTO_975 ?AUTO_981 ) ) ( not ( = ?AUTO_976 ?AUTO_977 ) ) ( not ( = ?AUTO_976 ?AUTO_981 ) ) ( not ( = ?AUTO_977 ?AUTO_981 ) ) ( ON ?AUTO_977 ?AUTO_975 ) ( not ( = ?AUTO_974 ?AUTO_980 ) ) ( not ( = ?AUTO_975 ?AUTO_980 ) ) ( not ( = ?AUTO_976 ?AUTO_980 ) ) ( not ( = ?AUTO_981 ?AUTO_980 ) ) ( not ( = ?AUTO_977 ?AUTO_980 ) ) ( ON ?AUTO_980 ?AUTO_977 ) ( not ( = ?AUTO_974 ?AUTO_979 ) ) ( not ( = ?AUTO_975 ?AUTO_979 ) ) ( not ( = ?AUTO_976 ?AUTO_979 ) ) ( not ( = ?AUTO_981 ?AUTO_979 ) ) ( not ( = ?AUTO_977 ?AUTO_979 ) ) ( not ( = ?AUTO_980 ?AUTO_979 ) ) ( CLEAR ?AUTO_976 ) ( ON-TABLE ?AUTO_974 ) ( not ( = ?AUTO_974 ?AUTO_978 ) ) ( not ( = ?AUTO_975 ?AUTO_978 ) ) ( not ( = ?AUTO_976 ?AUTO_978 ) ) ( not ( = ?AUTO_981 ?AUTO_978 ) ) ( not ( = ?AUTO_977 ?AUTO_978 ) ) ( not ( = ?AUTO_980 ?AUTO_978 ) ) ( not ( = ?AUTO_979 ?AUTO_978 ) ) ( ON ?AUTO_978 ?AUTO_974 ) ( ON ?AUTO_979 ?AUTO_978 ) ( CLEAR ?AUTO_979 ) ( ON ?AUTO_981 ?AUTO_980 ) ( CLEAR ?AUTO_981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_981 ?AUTO_980 )
      ( MAKE-ON ?AUTO_974 ?AUTO_975 )
      ( MAKE-ON-VERIFY ?AUTO_974 ?AUTO_975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_994 - BLOCK
      ?AUTO_995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_994 ?AUTO_995 ) ) ( ON-TABLE ?AUTO_994 ) ( ON ?AUTO_995 ?AUTO_994 ) ( CLEAR ?AUTO_995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_995 ?AUTO_994 )
      ( MAKE-ON ?AUTO_994 ?AUTO_995 )
      ( MAKE-ON-VERIFY ?AUTO_994 ?AUTO_995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2791 - BLOCK
      ?AUTO_2792 - BLOCK
    )
    :vars
    (
      ?AUTO_2794 - BLOCK
      ?AUTO_2793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2791 ?AUTO_2792 ) ) ( ON-TABLE ?AUTO_2791 ) ( not ( = ?AUTO_2791 ?AUTO_2794 ) ) ( not ( = ?AUTO_2792 ?AUTO_2794 ) ) ( ON ?AUTO_2794 ?AUTO_2791 ) ( CLEAR ?AUTO_2794 ) ( not ( = ?AUTO_2791 ?AUTO_2793 ) ) ( not ( = ?AUTO_2792 ?AUTO_2793 ) ) ( not ( = ?AUTO_2794 ?AUTO_2793 ) ) ( ON ?AUTO_2793 ?AUTO_2792 ) ( CLEAR ?AUTO_2793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2793 ?AUTO_2792 )
      ( MAKE-ON ?AUTO_2791 ?AUTO_2792 )
      ( MAKE-ON-VERIFY ?AUTO_2791 ?AUTO_2792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1131 - BLOCK
      ?AUTO_1132 - BLOCK
    )
    :vars
    (
      ?AUTO_1133 - BLOCK
      ?AUTO_1134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1132 ) ( not ( = ?AUTO_1131 ?AUTO_1132 ) ) ( ON ?AUTO_1131 ?AUTO_1133 ) ( not ( = ?AUTO_1131 ?AUTO_1133 ) ) ( not ( = ?AUTO_1132 ?AUTO_1133 ) ) ( not ( = ?AUTO_1131 ?AUTO_1134 ) ) ( not ( = ?AUTO_1132 ?AUTO_1134 ) ) ( not ( = ?AUTO_1133 ?AUTO_1134 ) ) ( ON ?AUTO_1134 ?AUTO_1131 ) ( CLEAR ?AUTO_1134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1134 ?AUTO_1131 )
      ( MAKE-ON ?AUTO_1131 ?AUTO_1132 )
      ( MAKE-ON-VERIFY ?AUTO_1131 ?AUTO_1132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1135 - BLOCK
      ?AUTO_1136 - BLOCK
    )
    :vars
    (
      ?AUTO_1138 - BLOCK
      ?AUTO_1137 - BLOCK
      ?AUTO_1139 - BLOCK
      ?AUTO_1140 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1136 ) ( not ( = ?AUTO_1135 ?AUTO_1136 ) ) ( ON ?AUTO_1135 ?AUTO_1138 ) ( not ( = ?AUTO_1135 ?AUTO_1138 ) ) ( not ( = ?AUTO_1136 ?AUTO_1138 ) ) ( not ( = ?AUTO_1135 ?AUTO_1137 ) ) ( not ( = ?AUTO_1136 ?AUTO_1137 ) ) ( not ( = ?AUTO_1138 ?AUTO_1137 ) ) ( ON ?AUTO_1137 ?AUTO_1135 ) ( CLEAR ?AUTO_1137 ) ( HOLDING ?AUTO_1139 ) ( CLEAR ?AUTO_1140 ) ( not ( = ?AUTO_1135 ?AUTO_1139 ) ) ( not ( = ?AUTO_1135 ?AUTO_1140 ) ) ( not ( = ?AUTO_1136 ?AUTO_1139 ) ) ( not ( = ?AUTO_1136 ?AUTO_1140 ) ) ( not ( = ?AUTO_1138 ?AUTO_1139 ) ) ( not ( = ?AUTO_1138 ?AUTO_1140 ) ) ( not ( = ?AUTO_1137 ?AUTO_1139 ) ) ( not ( = ?AUTO_1137 ?AUTO_1140 ) ) ( not ( = ?AUTO_1139 ?AUTO_1140 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1139 ?AUTO_1140 )
      ( MAKE-ON ?AUTO_1135 ?AUTO_1136 )
      ( MAKE-ON-VERIFY ?AUTO_1135 ?AUTO_1136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1381 - BLOCK
      ?AUTO_1382 - BLOCK
    )
    :vars
    (
      ?AUTO_1383 - BLOCK
      ?AUTO_1385 - BLOCK
      ?AUTO_1384 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1382 ) ( not ( = ?AUTO_1381 ?AUTO_1382 ) ) ( ON ?AUTO_1381 ?AUTO_1383 ) ( not ( = ?AUTO_1381 ?AUTO_1383 ) ) ( not ( = ?AUTO_1382 ?AUTO_1383 ) ) ( not ( = ?AUTO_1381 ?AUTO_1385 ) ) ( not ( = ?AUTO_1382 ?AUTO_1385 ) ) ( not ( = ?AUTO_1383 ?AUTO_1385 ) ) ( ON ?AUTO_1385 ?AUTO_1381 ) ( not ( = ?AUTO_1381 ?AUTO_1384 ) ) ( not ( = ?AUTO_1382 ?AUTO_1384 ) ) ( not ( = ?AUTO_1383 ?AUTO_1384 ) ) ( not ( = ?AUTO_1385 ?AUTO_1384 ) ) ( ON ?AUTO_1384 ?AUTO_1385 ) ( CLEAR ?AUTO_1384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1384 ?AUTO_1385 )
      ( MAKE-ON ?AUTO_1381 ?AUTO_1382 )
      ( MAKE-ON-VERIFY ?AUTO_1381 ?AUTO_1382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2967 - BLOCK
      ?AUTO_2968 - BLOCK
    )
    :vars
    (
      ?AUTO_2969 - BLOCK
      ?AUTO_2971 - BLOCK
      ?AUTO_2970 - BLOCK
      ?AUTO_2972 - BLOCK
      ?AUTO_2973 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2968 ) ( not ( = ?AUTO_2967 ?AUTO_2968 ) ) ( ON ?AUTO_2967 ?AUTO_2969 ) ( not ( = ?AUTO_2967 ?AUTO_2969 ) ) ( not ( = ?AUTO_2968 ?AUTO_2969 ) ) ( not ( = ?AUTO_2967 ?AUTO_2971 ) ) ( not ( = ?AUTO_2968 ?AUTO_2971 ) ) ( not ( = ?AUTO_2969 ?AUTO_2971 ) ) ( ON ?AUTO_2971 ?AUTO_2967 ) ( not ( = ?AUTO_2967 ?AUTO_2970 ) ) ( not ( = ?AUTO_2968 ?AUTO_2970 ) ) ( not ( = ?AUTO_2969 ?AUTO_2970 ) ) ( not ( = ?AUTO_2971 ?AUTO_2970 ) ) ( ON ?AUTO_2970 ?AUTO_2971 ) ( CLEAR ?AUTO_2970 ) ( HOLDING ?AUTO_2972 ) ( CLEAR ?AUTO_2973 ) ( not ( = ?AUTO_2967 ?AUTO_2972 ) ) ( not ( = ?AUTO_2967 ?AUTO_2973 ) ) ( not ( = ?AUTO_2968 ?AUTO_2972 ) ) ( not ( = ?AUTO_2968 ?AUTO_2973 ) ) ( not ( = ?AUTO_2969 ?AUTO_2972 ) ) ( not ( = ?AUTO_2969 ?AUTO_2973 ) ) ( not ( = ?AUTO_2971 ?AUTO_2972 ) ) ( not ( = ?AUTO_2971 ?AUTO_2973 ) ) ( not ( = ?AUTO_2970 ?AUTO_2972 ) ) ( not ( = ?AUTO_2970 ?AUTO_2973 ) ) ( not ( = ?AUTO_2972 ?AUTO_2973 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2972 ?AUTO_2973 )
      ( MAKE-ON ?AUTO_2967 ?AUTO_2968 )
      ( MAKE-ON-VERIFY ?AUTO_2967 ?AUTO_2968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2144 - BLOCK
      ?AUTO_2145 - BLOCK
    )
    :vars
    (
      ?AUTO_2146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2144 ?AUTO_2145 ) ) ( not ( = ?AUTO_2144 ?AUTO_2146 ) ) ( not ( = ?AUTO_2145 ?AUTO_2146 ) ) ( ON ?AUTO_2146 ?AUTO_2145 ) ( ON ?AUTO_2144 ?AUTO_2146 ) ( CLEAR ?AUTO_2144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2144 ?AUTO_2146 )
      ( MAKE-ON ?AUTO_2144 ?AUTO_2145 )
      ( MAKE-ON-VERIFY ?AUTO_2144 ?AUTO_2145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2147 - BLOCK
      ?AUTO_2148 - BLOCK
    )
    :vars
    (
      ?AUTO_2149 - BLOCK
      ?AUTO_2150 - BLOCK
      ?AUTO_2151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2147 ?AUTO_2148 ) ) ( not ( = ?AUTO_2147 ?AUTO_2149 ) ) ( not ( = ?AUTO_2148 ?AUTO_2149 ) ) ( ON ?AUTO_2149 ?AUTO_2148 ) ( ON ?AUTO_2147 ?AUTO_2149 ) ( CLEAR ?AUTO_2147 ) ( HOLDING ?AUTO_2150 ) ( CLEAR ?AUTO_2151 ) ( not ( = ?AUTO_2147 ?AUTO_2150 ) ) ( not ( = ?AUTO_2147 ?AUTO_2151 ) ) ( not ( = ?AUTO_2148 ?AUTO_2150 ) ) ( not ( = ?AUTO_2148 ?AUTO_2151 ) ) ( not ( = ?AUTO_2149 ?AUTO_2150 ) ) ( not ( = ?AUTO_2149 ?AUTO_2151 ) ) ( not ( = ?AUTO_2150 ?AUTO_2151 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2150 ?AUTO_2151 )
      ( MAKE-ON ?AUTO_2147 ?AUTO_2148 )
      ( MAKE-ON-VERIFY ?AUTO_2147 ?AUTO_2148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6074 - BLOCK
      ?AUTO_6075 - BLOCK
    )
    :vars
    (
      ?AUTO_6077 - BLOCK
      ?AUTO_6076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6074 ?AUTO_6075 ) ) ( not ( = ?AUTO_6074 ?AUTO_6077 ) ) ( not ( = ?AUTO_6075 ?AUTO_6077 ) ) ( not ( = ?AUTO_6074 ?AUTO_6076 ) ) ( not ( = ?AUTO_6075 ?AUTO_6076 ) ) ( not ( = ?AUTO_6077 ?AUTO_6076 ) ) ( ON ?AUTO_6076 ?AUTO_6075 ) ( ON ?AUTO_6074 ?AUTO_6076 ) ( ON ?AUTO_6077 ?AUTO_6074 ) ( CLEAR ?AUTO_6077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6077 ?AUTO_6074 )
      ( MAKE-ON ?AUTO_6074 ?AUTO_6075 )
      ( MAKE-ON-VERIFY ?AUTO_6074 ?AUTO_6075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1219 - BLOCK
      ?AUTO_1220 - BLOCK
    )
    :vars
    (
      ?AUTO_1222 - BLOCK
      ?AUTO_1224 - BLOCK
      ?AUTO_1221 - BLOCK
      ?AUTO_1223 - BLOCK
      ?AUTO_1225 - BLOCK
      ?AUTO_1226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1219 ?AUTO_1220 ) ) ( CLEAR ?AUTO_1222 ) ( not ( = ?AUTO_1219 ?AUTO_1224 ) ) ( not ( = ?AUTO_1219 ?AUTO_1222 ) ) ( not ( = ?AUTO_1220 ?AUTO_1224 ) ) ( not ( = ?AUTO_1220 ?AUTO_1222 ) ) ( not ( = ?AUTO_1224 ?AUTO_1222 ) ) ( ON ?AUTO_1224 ?AUTO_1220 ) ( ON ?AUTO_1219 ?AUTO_1224 ) ( CLEAR ?AUTO_1221 ) ( not ( = ?AUTO_1219 ?AUTO_1223 ) ) ( not ( = ?AUTO_1219 ?AUTO_1221 ) ) ( not ( = ?AUTO_1220 ?AUTO_1223 ) ) ( not ( = ?AUTO_1220 ?AUTO_1221 ) ) ( not ( = ?AUTO_1222 ?AUTO_1223 ) ) ( not ( = ?AUTO_1222 ?AUTO_1221 ) ) ( not ( = ?AUTO_1224 ?AUTO_1223 ) ) ( not ( = ?AUTO_1224 ?AUTO_1221 ) ) ( not ( = ?AUTO_1223 ?AUTO_1221 ) ) ( ON ?AUTO_1223 ?AUTO_1219 ) ( CLEAR ?AUTO_1223 ) ( HOLDING ?AUTO_1225 ) ( CLEAR ?AUTO_1226 ) ( not ( = ?AUTO_1219 ?AUTO_1225 ) ) ( not ( = ?AUTO_1219 ?AUTO_1226 ) ) ( not ( = ?AUTO_1220 ?AUTO_1225 ) ) ( not ( = ?AUTO_1220 ?AUTO_1226 ) ) ( not ( = ?AUTO_1222 ?AUTO_1225 ) ) ( not ( = ?AUTO_1222 ?AUTO_1226 ) ) ( not ( = ?AUTO_1224 ?AUTO_1225 ) ) ( not ( = ?AUTO_1224 ?AUTO_1226 ) ) ( not ( = ?AUTO_1221 ?AUTO_1225 ) ) ( not ( = ?AUTO_1221 ?AUTO_1226 ) ) ( not ( = ?AUTO_1223 ?AUTO_1225 ) ) ( not ( = ?AUTO_1223 ?AUTO_1226 ) ) ( not ( = ?AUTO_1225 ?AUTO_1226 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1225 ?AUTO_1226 )
      ( MAKE-ON ?AUTO_1219 ?AUTO_1220 )
      ( MAKE-ON-VERIFY ?AUTO_1219 ?AUTO_1220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1274 - BLOCK
      ?AUTO_1275 - BLOCK
    )
    :vars
    (
      ?AUTO_1276 - BLOCK
      ?AUTO_1277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1274 ?AUTO_1275 ) ) ( ON ?AUTO_1274 ?AUTO_1276 ) ( not ( = ?AUTO_1274 ?AUTO_1276 ) ) ( not ( = ?AUTO_1275 ?AUTO_1276 ) ) ( not ( = ?AUTO_1274 ?AUTO_1277 ) ) ( not ( = ?AUTO_1275 ?AUTO_1277 ) ) ( not ( = ?AUTO_1276 ?AUTO_1277 ) ) ( ON ?AUTO_1277 ?AUTO_1274 ) ( CLEAR ?AUTO_1277 ) ( HOLDING ?AUTO_1275 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1275 )
      ( MAKE-ON ?AUTO_1274 ?AUTO_1275 )
      ( MAKE-ON-VERIFY ?AUTO_1274 ?AUTO_1275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1278 - BLOCK
      ?AUTO_1279 - BLOCK
    )
    :vars
    (
      ?AUTO_1280 - BLOCK
      ?AUTO_1281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1278 ?AUTO_1279 ) ) ( ON ?AUTO_1278 ?AUTO_1280 ) ( not ( = ?AUTO_1278 ?AUTO_1280 ) ) ( not ( = ?AUTO_1279 ?AUTO_1280 ) ) ( not ( = ?AUTO_1278 ?AUTO_1281 ) ) ( not ( = ?AUTO_1279 ?AUTO_1281 ) ) ( not ( = ?AUTO_1280 ?AUTO_1281 ) ) ( ON ?AUTO_1281 ?AUTO_1278 ) ( ON ?AUTO_1279 ?AUTO_1281 ) ( CLEAR ?AUTO_1279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1279 ?AUTO_1281 )
      ( MAKE-ON ?AUTO_1278 ?AUTO_1279 )
      ( MAKE-ON-VERIFY ?AUTO_1278 ?AUTO_1279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1282 - BLOCK
      ?AUTO_1283 - BLOCK
    )
    :vars
    (
      ?AUTO_1285 - BLOCK
      ?AUTO_1284 - BLOCK
      ?AUTO_1286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1282 ?AUTO_1283 ) ) ( ON ?AUTO_1282 ?AUTO_1285 ) ( not ( = ?AUTO_1282 ?AUTO_1285 ) ) ( not ( = ?AUTO_1283 ?AUTO_1285 ) ) ( not ( = ?AUTO_1282 ?AUTO_1284 ) ) ( not ( = ?AUTO_1283 ?AUTO_1284 ) ) ( not ( = ?AUTO_1285 ?AUTO_1284 ) ) ( ON ?AUTO_1284 ?AUTO_1282 ) ( ON ?AUTO_1283 ?AUTO_1284 ) ( CLEAR ?AUTO_1283 ) ( HOLDING ?AUTO_1286 ) ( not ( = ?AUTO_1282 ?AUTO_1286 ) ) ( not ( = ?AUTO_1283 ?AUTO_1286 ) ) ( not ( = ?AUTO_1285 ?AUTO_1286 ) ) ( not ( = ?AUTO_1284 ?AUTO_1286 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1286 )
      ( MAKE-ON ?AUTO_1282 ?AUTO_1283 )
      ( MAKE-ON-VERIFY ?AUTO_1282 ?AUTO_1283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1287 - BLOCK
      ?AUTO_1288 - BLOCK
    )
    :vars
    (
      ?AUTO_1289 - BLOCK
      ?AUTO_1290 - BLOCK
      ?AUTO_1291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1287 ?AUTO_1288 ) ) ( ON ?AUTO_1287 ?AUTO_1289 ) ( not ( = ?AUTO_1287 ?AUTO_1289 ) ) ( not ( = ?AUTO_1288 ?AUTO_1289 ) ) ( not ( = ?AUTO_1287 ?AUTO_1290 ) ) ( not ( = ?AUTO_1288 ?AUTO_1290 ) ) ( not ( = ?AUTO_1289 ?AUTO_1290 ) ) ( ON ?AUTO_1290 ?AUTO_1287 ) ( ON ?AUTO_1288 ?AUTO_1290 ) ( not ( = ?AUTO_1287 ?AUTO_1291 ) ) ( not ( = ?AUTO_1288 ?AUTO_1291 ) ) ( not ( = ?AUTO_1289 ?AUTO_1291 ) ) ( not ( = ?AUTO_1290 ?AUTO_1291 ) ) ( ON ?AUTO_1291 ?AUTO_1288 ) ( CLEAR ?AUTO_1291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1291 ?AUTO_1288 )
      ( MAKE-ON ?AUTO_1287 ?AUTO_1288 )
      ( MAKE-ON-VERIFY ?AUTO_1287 ?AUTO_1288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1333 - BLOCK
      ?AUTO_1334 - BLOCK
    )
    :vars
    (
      ?AUTO_1338 - BLOCK
      ?AUTO_1337 - BLOCK
      ?AUTO_1336 - BLOCK
      ?AUTO_1335 - BLOCK
      ?AUTO_1339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1333 ?AUTO_1334 ) ) ( ON ?AUTO_1333 ?AUTO_1338 ) ( CLEAR ?AUTO_1333 ) ( not ( = ?AUTO_1333 ?AUTO_1338 ) ) ( not ( = ?AUTO_1334 ?AUTO_1338 ) ) ( not ( = ?AUTO_1333 ?AUTO_1337 ) ) ( not ( = ?AUTO_1333 ?AUTO_1336 ) ) ( not ( = ?AUTO_1334 ?AUTO_1337 ) ) ( not ( = ?AUTO_1334 ?AUTO_1336 ) ) ( not ( = ?AUTO_1338 ?AUTO_1337 ) ) ( not ( = ?AUTO_1338 ?AUTO_1336 ) ) ( not ( = ?AUTO_1337 ?AUTO_1336 ) ) ( ON ?AUTO_1337 ?AUTO_1334 ) ( not ( = ?AUTO_1333 ?AUTO_1335 ) ) ( not ( = ?AUTO_1334 ?AUTO_1335 ) ) ( not ( = ?AUTO_1338 ?AUTO_1335 ) ) ( not ( = ?AUTO_1336 ?AUTO_1335 ) ) ( not ( = ?AUTO_1337 ?AUTO_1335 ) ) ( ON ?AUTO_1335 ?AUTO_1337 ) ( ON ?AUTO_1336 ?AUTO_1335 ) ( CLEAR ?AUTO_1336 ) ( HOLDING ?AUTO_1339 ) ( not ( = ?AUTO_1333 ?AUTO_1339 ) ) ( not ( = ?AUTO_1334 ?AUTO_1339 ) ) ( not ( = ?AUTO_1338 ?AUTO_1339 ) ) ( not ( = ?AUTO_1337 ?AUTO_1339 ) ) ( not ( = ?AUTO_1336 ?AUTO_1339 ) ) ( not ( = ?AUTO_1335 ?AUTO_1339 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1339 )
      ( MAKE-ON ?AUTO_1333 ?AUTO_1334 )
      ( MAKE-ON-VERIFY ?AUTO_1333 ?AUTO_1334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1340 - BLOCK
      ?AUTO_1341 - BLOCK
    )
    :vars
    (
      ?AUTO_1343 - BLOCK
      ?AUTO_1345 - BLOCK
      ?AUTO_1344 - BLOCK
      ?AUTO_1342 - BLOCK
      ?AUTO_1346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1340 ?AUTO_1341 ) ) ( ON ?AUTO_1340 ?AUTO_1343 ) ( CLEAR ?AUTO_1340 ) ( not ( = ?AUTO_1340 ?AUTO_1343 ) ) ( not ( = ?AUTO_1341 ?AUTO_1343 ) ) ( not ( = ?AUTO_1340 ?AUTO_1345 ) ) ( not ( = ?AUTO_1340 ?AUTO_1344 ) ) ( not ( = ?AUTO_1341 ?AUTO_1345 ) ) ( not ( = ?AUTO_1341 ?AUTO_1344 ) ) ( not ( = ?AUTO_1343 ?AUTO_1345 ) ) ( not ( = ?AUTO_1343 ?AUTO_1344 ) ) ( not ( = ?AUTO_1345 ?AUTO_1344 ) ) ( ON ?AUTO_1345 ?AUTO_1341 ) ( not ( = ?AUTO_1340 ?AUTO_1342 ) ) ( not ( = ?AUTO_1341 ?AUTO_1342 ) ) ( not ( = ?AUTO_1343 ?AUTO_1342 ) ) ( not ( = ?AUTO_1344 ?AUTO_1342 ) ) ( not ( = ?AUTO_1345 ?AUTO_1342 ) ) ( ON ?AUTO_1342 ?AUTO_1345 ) ( ON ?AUTO_1344 ?AUTO_1342 ) ( not ( = ?AUTO_1340 ?AUTO_1346 ) ) ( not ( = ?AUTO_1341 ?AUTO_1346 ) ) ( not ( = ?AUTO_1343 ?AUTO_1346 ) ) ( not ( = ?AUTO_1345 ?AUTO_1346 ) ) ( not ( = ?AUTO_1344 ?AUTO_1346 ) ) ( not ( = ?AUTO_1342 ?AUTO_1346 ) ) ( ON ?AUTO_1346 ?AUTO_1344 ) ( CLEAR ?AUTO_1346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1346 ?AUTO_1344 )
      ( MAKE-ON ?AUTO_1340 ?AUTO_1341 )
      ( MAKE-ON-VERIFY ?AUTO_1340 ?AUTO_1341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1376 - BLOCK
      ?AUTO_1377 - BLOCK
    )
    :vars
    (
      ?AUTO_1378 - BLOCK
      ?AUTO_1379 - BLOCK
      ?AUTO_1380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1377 ) ( not ( = ?AUTO_1376 ?AUTO_1377 ) ) ( ON ?AUTO_1376 ?AUTO_1378 ) ( not ( = ?AUTO_1376 ?AUTO_1378 ) ) ( not ( = ?AUTO_1377 ?AUTO_1378 ) ) ( not ( = ?AUTO_1376 ?AUTO_1379 ) ) ( not ( = ?AUTO_1377 ?AUTO_1379 ) ) ( not ( = ?AUTO_1378 ?AUTO_1379 ) ) ( ON ?AUTO_1379 ?AUTO_1376 ) ( CLEAR ?AUTO_1379 ) ( HOLDING ?AUTO_1380 ) ( not ( = ?AUTO_1376 ?AUTO_1380 ) ) ( not ( = ?AUTO_1377 ?AUTO_1380 ) ) ( not ( = ?AUTO_1378 ?AUTO_1380 ) ) ( not ( = ?AUTO_1379 ?AUTO_1380 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1380 )
      ( MAKE-ON ?AUTO_1376 ?AUTO_1377 )
      ( MAKE-ON-VERIFY ?AUTO_1376 ?AUTO_1377 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6032 - BLOCK
    )
    :vars
    (
      ?AUTO_6036 - BLOCK
      ?AUTO_6033 - BLOCK
      ?AUTO_6034 - BLOCK
      ?AUTO_6035 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6032 ?AUTO_6036 ) ( not ( = ?AUTO_6032 ?AUTO_6036 ) ) ( not ( = ?AUTO_6032 ?AUTO_6033 ) ) ( not ( = ?AUTO_6036 ?AUTO_6033 ) ) ( ON ?AUTO_6033 ?AUTO_6032 ) ( not ( = ?AUTO_6032 ?AUTO_6034 ) ) ( not ( = ?AUTO_6032 ?AUTO_6035 ) ) ( not ( = ?AUTO_6036 ?AUTO_6034 ) ) ( not ( = ?AUTO_6036 ?AUTO_6035 ) ) ( not ( = ?AUTO_6033 ?AUTO_6034 ) ) ( not ( = ?AUTO_6033 ?AUTO_6035 ) ) ( not ( = ?AUTO_6034 ?AUTO_6035 ) ) ( ON ?AUTO_6034 ?AUTO_6033 ) ( CLEAR ?AUTO_6034 ) ( HOLDING ?AUTO_6035 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6035 )
      ( MAKE-ON-TABLE ?AUTO_6032 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6070 - BLOCK
      ?AUTO_6071 - BLOCK
    )
    :vars
    (
      ?AUTO_6072 - BLOCK
      ?AUTO_6073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6070 ?AUTO_6071 ) ) ( not ( = ?AUTO_6070 ?AUTO_6072 ) ) ( not ( = ?AUTO_6071 ?AUTO_6072 ) ) ( not ( = ?AUTO_6070 ?AUTO_6073 ) ) ( not ( = ?AUTO_6071 ?AUTO_6073 ) ) ( not ( = ?AUTO_6072 ?AUTO_6073 ) ) ( ON ?AUTO_6073 ?AUTO_6071 ) ( ON ?AUTO_6070 ?AUTO_6073 ) ( CLEAR ?AUTO_6070 ) ( HOLDING ?AUTO_6072 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6072 )
      ( MAKE-ON ?AUTO_6070 ?AUTO_6071 )
      ( MAKE-ON-VERIFY ?AUTO_6070 ?AUTO_6071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1493 - BLOCK
      ?AUTO_1494 - BLOCK
    )
    :vars
    (
      ?AUTO_1495 - BLOCK
      ?AUTO_1497 - BLOCK
      ?AUTO_1496 - BLOCK
      ?AUTO_1498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1493 ?AUTO_1494 ) ) ( ON-TABLE ?AUTO_1493 ) ( not ( = ?AUTO_1493 ?AUTO_1495 ) ) ( not ( = ?AUTO_1494 ?AUTO_1495 ) ) ( ON ?AUTO_1495 ?AUTO_1493 ) ( CLEAR ?AUTO_1497 ) ( not ( = ?AUTO_1493 ?AUTO_1496 ) ) ( not ( = ?AUTO_1493 ?AUTO_1497 ) ) ( not ( = ?AUTO_1494 ?AUTO_1496 ) ) ( not ( = ?AUTO_1494 ?AUTO_1497 ) ) ( not ( = ?AUTO_1495 ?AUTO_1496 ) ) ( not ( = ?AUTO_1495 ?AUTO_1497 ) ) ( not ( = ?AUTO_1496 ?AUTO_1497 ) ) ( ON ?AUTO_1496 ?AUTO_1495 ) ( ON ?AUTO_1494 ?AUTO_1496 ) ( CLEAR ?AUTO_1494 ) ( HOLDING ?AUTO_1498 ) ( not ( = ?AUTO_1493 ?AUTO_1498 ) ) ( not ( = ?AUTO_1494 ?AUTO_1498 ) ) ( not ( = ?AUTO_1495 ?AUTO_1498 ) ) ( not ( = ?AUTO_1497 ?AUTO_1498 ) ) ( not ( = ?AUTO_1496 ?AUTO_1498 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1498 )
      ( MAKE-ON ?AUTO_1493 ?AUTO_1494 )
      ( MAKE-ON-VERIFY ?AUTO_1493 ?AUTO_1494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1499 - BLOCK
      ?AUTO_1500 - BLOCK
    )
    :vars
    (
      ?AUTO_1502 - BLOCK
      ?AUTO_1504 - BLOCK
      ?AUTO_1501 - BLOCK
      ?AUTO_1503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1499 ?AUTO_1500 ) ) ( ON-TABLE ?AUTO_1499 ) ( not ( = ?AUTO_1499 ?AUTO_1502 ) ) ( not ( = ?AUTO_1500 ?AUTO_1502 ) ) ( ON ?AUTO_1502 ?AUTO_1499 ) ( CLEAR ?AUTO_1504 ) ( not ( = ?AUTO_1499 ?AUTO_1501 ) ) ( not ( = ?AUTO_1499 ?AUTO_1504 ) ) ( not ( = ?AUTO_1500 ?AUTO_1501 ) ) ( not ( = ?AUTO_1500 ?AUTO_1504 ) ) ( not ( = ?AUTO_1502 ?AUTO_1501 ) ) ( not ( = ?AUTO_1502 ?AUTO_1504 ) ) ( not ( = ?AUTO_1501 ?AUTO_1504 ) ) ( ON ?AUTO_1501 ?AUTO_1502 ) ( ON ?AUTO_1500 ?AUTO_1501 ) ( not ( = ?AUTO_1499 ?AUTO_1503 ) ) ( not ( = ?AUTO_1500 ?AUTO_1503 ) ) ( not ( = ?AUTO_1502 ?AUTO_1503 ) ) ( not ( = ?AUTO_1504 ?AUTO_1503 ) ) ( not ( = ?AUTO_1501 ?AUTO_1503 ) ) ( ON ?AUTO_1503 ?AUTO_1500 ) ( CLEAR ?AUTO_1503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1503 ?AUTO_1500 )
      ( MAKE-ON ?AUTO_1499 ?AUTO_1500 )
      ( MAKE-ON-VERIFY ?AUTO_1499 ?AUTO_1500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1581 - BLOCK
      ?AUTO_1582 - BLOCK
    )
    :vars
    (
      ?AUTO_1583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1581 ?AUTO_1582 ) ) ( ON-TABLE ?AUTO_1581 ) ( not ( = ?AUTO_1581 ?AUTO_1583 ) ) ( not ( = ?AUTO_1582 ?AUTO_1583 ) ) ( ON ?AUTO_1582 ?AUTO_1581 ) ( CLEAR ?AUTO_1582 ) ( HOLDING ?AUTO_1583 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1583 )
      ( MAKE-ON ?AUTO_1581 ?AUTO_1582 )
      ( MAKE-ON-VERIFY ?AUTO_1581 ?AUTO_1582 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1610 - BLOCK
      ?AUTO_1611 - BLOCK
    )
    :vars
    (
      ?AUTO_1612 - BLOCK
      ?AUTO_1613 - BLOCK
      ?AUTO_1614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1610 ?AUTO_1611 ) ) ( ON ?AUTO_1610 ?AUTO_1612 ) ( not ( = ?AUTO_1610 ?AUTO_1612 ) ) ( not ( = ?AUTO_1611 ?AUTO_1612 ) ) ( ON ?AUTO_1611 ?AUTO_1610 ) ( CLEAR ?AUTO_1611 ) ( HOLDING ?AUTO_1613 ) ( CLEAR ?AUTO_1614 ) ( not ( = ?AUTO_1610 ?AUTO_1613 ) ) ( not ( = ?AUTO_1610 ?AUTO_1614 ) ) ( not ( = ?AUTO_1611 ?AUTO_1613 ) ) ( not ( = ?AUTO_1611 ?AUTO_1614 ) ) ( not ( = ?AUTO_1612 ?AUTO_1613 ) ) ( not ( = ?AUTO_1612 ?AUTO_1614 ) ) ( not ( = ?AUTO_1613 ?AUTO_1614 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1613 ?AUTO_1614 )
      ( MAKE-ON ?AUTO_1610 ?AUTO_1611 )
      ( MAKE-ON-VERIFY ?AUTO_1610 ?AUTO_1611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5400 - BLOCK
      ?AUTO_5401 - BLOCK
    )
    :vars
    (
      ?AUTO_5402 - BLOCK
      ?AUTO_5403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5400 ?AUTO_5401 ) ) ( ON ?AUTO_5400 ?AUTO_5402 ) ( not ( = ?AUTO_5400 ?AUTO_5402 ) ) ( not ( = ?AUTO_5401 ?AUTO_5402 ) ) ( ON ?AUTO_5401 ?AUTO_5400 ) ( not ( = ?AUTO_5400 ?AUTO_5403 ) ) ( not ( = ?AUTO_5401 ?AUTO_5403 ) ) ( not ( = ?AUTO_5402 ?AUTO_5403 ) ) ( ON ?AUTO_5403 ?AUTO_5401 ) ( CLEAR ?AUTO_5403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5403 ?AUTO_5401 )
      ( MAKE-ON ?AUTO_5400 ?AUTO_5401 )
      ( MAKE-ON-VERIFY ?AUTO_5400 ?AUTO_5401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1624 - BLOCK
      ?AUTO_1625 - BLOCK
    )
    :vars
    (
      ?AUTO_1627 - BLOCK
      ?AUTO_1626 - BLOCK
      ?AUTO_1628 - BLOCK
      ?AUTO_1629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1624 ?AUTO_1625 ) ) ( ON ?AUTO_1624 ?AUTO_1627 ) ( not ( = ?AUTO_1624 ?AUTO_1627 ) ) ( not ( = ?AUTO_1625 ?AUTO_1627 ) ) ( ON ?AUTO_1625 ?AUTO_1624 ) ( not ( = ?AUTO_1624 ?AUTO_1626 ) ) ( not ( = ?AUTO_1624 ?AUTO_1628 ) ) ( not ( = ?AUTO_1625 ?AUTO_1626 ) ) ( not ( = ?AUTO_1625 ?AUTO_1628 ) ) ( not ( = ?AUTO_1627 ?AUTO_1626 ) ) ( not ( = ?AUTO_1627 ?AUTO_1628 ) ) ( not ( = ?AUTO_1626 ?AUTO_1628 ) ) ( ON ?AUTO_1626 ?AUTO_1625 ) ( CLEAR ?AUTO_1626 ) ( HOLDING ?AUTO_1628 ) ( CLEAR ?AUTO_1629 ) ( not ( = ?AUTO_1624 ?AUTO_1629 ) ) ( not ( = ?AUTO_1625 ?AUTO_1629 ) ) ( not ( = ?AUTO_1627 ?AUTO_1629 ) ) ( not ( = ?AUTO_1626 ?AUTO_1629 ) ) ( not ( = ?AUTO_1628 ?AUTO_1629 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1628 ?AUTO_1629 )
      ( MAKE-ON ?AUTO_1624 ?AUTO_1625 )
      ( MAKE-ON-VERIFY ?AUTO_1624 ?AUTO_1625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5409 - BLOCK
      ?AUTO_5410 - BLOCK
    )
    :vars
    (
      ?AUTO_5413 - BLOCK
      ?AUTO_5411 - BLOCK
      ?AUTO_5412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5409 ?AUTO_5410 ) ) ( ON ?AUTO_5409 ?AUTO_5413 ) ( not ( = ?AUTO_5409 ?AUTO_5413 ) ) ( not ( = ?AUTO_5410 ?AUTO_5413 ) ) ( ON ?AUTO_5410 ?AUTO_5409 ) ( not ( = ?AUTO_5409 ?AUTO_5411 ) ) ( not ( = ?AUTO_5410 ?AUTO_5411 ) ) ( not ( = ?AUTO_5413 ?AUTO_5411 ) ) ( ON ?AUTO_5411 ?AUTO_5410 ) ( not ( = ?AUTO_5409 ?AUTO_5412 ) ) ( not ( = ?AUTO_5410 ?AUTO_5412 ) ) ( not ( = ?AUTO_5413 ?AUTO_5412 ) ) ( not ( = ?AUTO_5411 ?AUTO_5412 ) ) ( ON ?AUTO_5412 ?AUTO_5411 ) ( CLEAR ?AUTO_5412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5412 ?AUTO_5411 )
      ( MAKE-ON ?AUTO_5409 ?AUTO_5410 )
      ( MAKE-ON-VERIFY ?AUTO_5409 ?AUTO_5410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3278 - BLOCK
      ?AUTO_3279 - BLOCK
    )
    :vars
    (
      ?AUTO_3281 - BLOCK
      ?AUTO_3282 - BLOCK
      ?AUTO_3280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3278 ?AUTO_3279 ) ) ( ON ?AUTO_3278 ?AUTO_3281 ) ( not ( = ?AUTO_3278 ?AUTO_3281 ) ) ( not ( = ?AUTO_3279 ?AUTO_3281 ) ) ( not ( = ?AUTO_3278 ?AUTO_3282 ) ) ( not ( = ?AUTO_3279 ?AUTO_3282 ) ) ( not ( = ?AUTO_3281 ?AUTO_3282 ) ) ( ON ?AUTO_3282 ?AUTO_3278 ) ( not ( = ?AUTO_3278 ?AUTO_3280 ) ) ( not ( = ?AUTO_3279 ?AUTO_3280 ) ) ( not ( = ?AUTO_3281 ?AUTO_3280 ) ) ( not ( = ?AUTO_3282 ?AUTO_3280 ) ) ( ON ?AUTO_3280 ?AUTO_3282 ) ( CLEAR ?AUTO_3280 ) ( HOLDING ?AUTO_3279 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3279 )
      ( MAKE-ON ?AUTO_3278 ?AUTO_3279 )
      ( MAKE-ON-VERIFY ?AUTO_3278 ?AUTO_3279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1814 - BLOCK
      ?AUTO_1815 - BLOCK
    )
    :vars
    (
      ?AUTO_1817 - BLOCK
      ?AUTO_1816 - BLOCK
      ?AUTO_1819 - BLOCK
      ?AUTO_1818 - BLOCK
      ?AUTO_1820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1815 ) ( not ( = ?AUTO_1814 ?AUTO_1815 ) ) ( ON ?AUTO_1814 ?AUTO_1817 ) ( not ( = ?AUTO_1814 ?AUTO_1817 ) ) ( not ( = ?AUTO_1815 ?AUTO_1817 ) ) ( CLEAR ?AUTO_1816 ) ( not ( = ?AUTO_1814 ?AUTO_1819 ) ) ( not ( = ?AUTO_1814 ?AUTO_1816 ) ) ( not ( = ?AUTO_1815 ?AUTO_1819 ) ) ( not ( = ?AUTO_1815 ?AUTO_1816 ) ) ( not ( = ?AUTO_1817 ?AUTO_1819 ) ) ( not ( = ?AUTO_1817 ?AUTO_1816 ) ) ( not ( = ?AUTO_1819 ?AUTO_1816 ) ) ( ON ?AUTO_1819 ?AUTO_1814 ) ( not ( = ?AUTO_1814 ?AUTO_1818 ) ) ( not ( = ?AUTO_1815 ?AUTO_1818 ) ) ( not ( = ?AUTO_1817 ?AUTO_1818 ) ) ( not ( = ?AUTO_1816 ?AUTO_1818 ) ) ( not ( = ?AUTO_1819 ?AUTO_1818 ) ) ( ON ?AUTO_1818 ?AUTO_1819 ) ( CLEAR ?AUTO_1818 ) ( HOLDING ?AUTO_1820 ) ( not ( = ?AUTO_1814 ?AUTO_1820 ) ) ( not ( = ?AUTO_1815 ?AUTO_1820 ) ) ( not ( = ?AUTO_1817 ?AUTO_1820 ) ) ( not ( = ?AUTO_1816 ?AUTO_1820 ) ) ( not ( = ?AUTO_1819 ?AUTO_1820 ) ) ( not ( = ?AUTO_1818 ?AUTO_1820 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1820 )
      ( MAKE-ON ?AUTO_1814 ?AUTO_1815 )
      ( MAKE-ON-VERIFY ?AUTO_1814 ?AUTO_1815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1821 - BLOCK
      ?AUTO_1822 - BLOCK
    )
    :vars
    (
      ?AUTO_1823 - BLOCK
      ?AUTO_1824 - BLOCK
      ?AUTO_1827 - BLOCK
      ?AUTO_1825 - BLOCK
      ?AUTO_1826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1821 ?AUTO_1822 ) ) ( ON ?AUTO_1821 ?AUTO_1823 ) ( not ( = ?AUTO_1821 ?AUTO_1823 ) ) ( not ( = ?AUTO_1822 ?AUTO_1823 ) ) ( CLEAR ?AUTO_1824 ) ( not ( = ?AUTO_1821 ?AUTO_1827 ) ) ( not ( = ?AUTO_1821 ?AUTO_1824 ) ) ( not ( = ?AUTO_1822 ?AUTO_1827 ) ) ( not ( = ?AUTO_1822 ?AUTO_1824 ) ) ( not ( = ?AUTO_1823 ?AUTO_1827 ) ) ( not ( = ?AUTO_1823 ?AUTO_1824 ) ) ( not ( = ?AUTO_1827 ?AUTO_1824 ) ) ( ON ?AUTO_1827 ?AUTO_1821 ) ( not ( = ?AUTO_1821 ?AUTO_1825 ) ) ( not ( = ?AUTO_1822 ?AUTO_1825 ) ) ( not ( = ?AUTO_1823 ?AUTO_1825 ) ) ( not ( = ?AUTO_1824 ?AUTO_1825 ) ) ( not ( = ?AUTO_1827 ?AUTO_1825 ) ) ( ON ?AUTO_1825 ?AUTO_1827 ) ( CLEAR ?AUTO_1825 ) ( not ( = ?AUTO_1821 ?AUTO_1826 ) ) ( not ( = ?AUTO_1822 ?AUTO_1826 ) ) ( not ( = ?AUTO_1823 ?AUTO_1826 ) ) ( not ( = ?AUTO_1824 ?AUTO_1826 ) ) ( not ( = ?AUTO_1827 ?AUTO_1826 ) ) ( not ( = ?AUTO_1825 ?AUTO_1826 ) ) ( ON ?AUTO_1826 ?AUTO_1822 ) ( CLEAR ?AUTO_1826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1826 ?AUTO_1822 )
      ( MAKE-ON ?AUTO_1821 ?AUTO_1822 )
      ( MAKE-ON-VERIFY ?AUTO_1821 ?AUTO_1822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1835 - BLOCK
      ?AUTO_1836 - BLOCK
    )
    :vars
    (
      ?AUTO_1841 - BLOCK
      ?AUTO_1837 - BLOCK
      ?AUTO_1839 - BLOCK
      ?AUTO_1838 - BLOCK
      ?AUTO_1840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1835 ?AUTO_1836 ) ) ( ON ?AUTO_1835 ?AUTO_1841 ) ( not ( = ?AUTO_1835 ?AUTO_1841 ) ) ( not ( = ?AUTO_1836 ?AUTO_1841 ) ) ( not ( = ?AUTO_1835 ?AUTO_1837 ) ) ( not ( = ?AUTO_1835 ?AUTO_1839 ) ) ( not ( = ?AUTO_1836 ?AUTO_1837 ) ) ( not ( = ?AUTO_1836 ?AUTO_1839 ) ) ( not ( = ?AUTO_1841 ?AUTO_1837 ) ) ( not ( = ?AUTO_1841 ?AUTO_1839 ) ) ( not ( = ?AUTO_1837 ?AUTO_1839 ) ) ( ON ?AUTO_1837 ?AUTO_1835 ) ( not ( = ?AUTO_1835 ?AUTO_1838 ) ) ( not ( = ?AUTO_1836 ?AUTO_1838 ) ) ( not ( = ?AUTO_1841 ?AUTO_1838 ) ) ( not ( = ?AUTO_1839 ?AUTO_1838 ) ) ( not ( = ?AUTO_1837 ?AUTO_1838 ) ) ( ON ?AUTO_1838 ?AUTO_1837 ) ( not ( = ?AUTO_1835 ?AUTO_1840 ) ) ( not ( = ?AUTO_1836 ?AUTO_1840 ) ) ( not ( = ?AUTO_1841 ?AUTO_1840 ) ) ( not ( = ?AUTO_1839 ?AUTO_1840 ) ) ( not ( = ?AUTO_1837 ?AUTO_1840 ) ) ( not ( = ?AUTO_1838 ?AUTO_1840 ) ) ( ON ?AUTO_1840 ?AUTO_1836 ) ( CLEAR ?AUTO_1840 ) ( ON ?AUTO_1839 ?AUTO_1838 ) ( CLEAR ?AUTO_1839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1839 ?AUTO_1838 )
      ( MAKE-ON ?AUTO_1835 ?AUTO_1836 )
      ( MAKE-ON-VERIFY ?AUTO_1835 ?AUTO_1836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2799 - BLOCK
      ?AUTO_2800 - BLOCK
    )
    :vars
    (
      ?AUTO_2802 - BLOCK
      ?AUTO_2801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2799 ?AUTO_2800 ) ) ( ON-TABLE ?AUTO_2799 ) ( not ( = ?AUTO_2799 ?AUTO_2802 ) ) ( not ( = ?AUTO_2800 ?AUTO_2802 ) ) ( not ( = ?AUTO_2799 ?AUTO_2801 ) ) ( not ( = ?AUTO_2800 ?AUTO_2801 ) ) ( not ( = ?AUTO_2802 ?AUTO_2801 ) ) ( ON ?AUTO_2801 ?AUTO_2800 ) ( CLEAR ?AUTO_2799 ) ( ON ?AUTO_2802 ?AUTO_2801 ) ( CLEAR ?AUTO_2802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2802 ?AUTO_2801 )
      ( MAKE-ON ?AUTO_2799 ?AUTO_2800 )
      ( MAKE-ON-VERIFY ?AUTO_2799 ?AUTO_2800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3118 - BLOCK
      ?AUTO_3119 - BLOCK
    )
    :vars
    (
      ?AUTO_3120 - BLOCK
      ?AUTO_3121 - BLOCK
      ?AUTO_3122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3118 ?AUTO_3119 ) ) ( ON-TABLE ?AUTO_3118 ) ( CLEAR ?AUTO_3118 ) ( not ( = ?AUTO_3118 ?AUTO_3120 ) ) ( not ( = ?AUTO_3119 ?AUTO_3120 ) ) ( ON ?AUTO_3120 ?AUTO_3119 ) ( not ( = ?AUTO_3118 ?AUTO_3121 ) ) ( not ( = ?AUTO_3119 ?AUTO_3121 ) ) ( not ( = ?AUTO_3120 ?AUTO_3121 ) ) ( ON ?AUTO_3121 ?AUTO_3120 ) ( CLEAR ?AUTO_3121 ) ( HOLDING ?AUTO_3122 ) ( not ( = ?AUTO_3118 ?AUTO_3122 ) ) ( not ( = ?AUTO_3119 ?AUTO_3122 ) ) ( not ( = ?AUTO_3120 ?AUTO_3122 ) ) ( not ( = ?AUTO_3121 ?AUTO_3122 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3122 )
      ( MAKE-ON ?AUTO_3118 ?AUTO_3119 )
      ( MAKE-ON-VERIFY ?AUTO_3118 ?AUTO_3119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3123 - BLOCK
      ?AUTO_3124 - BLOCK
    )
    :vars
    (
      ?AUTO_3125 - BLOCK
      ?AUTO_3127 - BLOCK
      ?AUTO_3126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3123 ?AUTO_3124 ) ) ( ON-TABLE ?AUTO_3123 ) ( CLEAR ?AUTO_3123 ) ( not ( = ?AUTO_3123 ?AUTO_3125 ) ) ( not ( = ?AUTO_3124 ?AUTO_3125 ) ) ( ON ?AUTO_3125 ?AUTO_3124 ) ( not ( = ?AUTO_3123 ?AUTO_3127 ) ) ( not ( = ?AUTO_3124 ?AUTO_3127 ) ) ( not ( = ?AUTO_3125 ?AUTO_3127 ) ) ( ON ?AUTO_3127 ?AUTO_3125 ) ( not ( = ?AUTO_3123 ?AUTO_3126 ) ) ( not ( = ?AUTO_3124 ?AUTO_3126 ) ) ( not ( = ?AUTO_3125 ?AUTO_3126 ) ) ( not ( = ?AUTO_3127 ?AUTO_3126 ) ) ( ON ?AUTO_3126 ?AUTO_3127 ) ( CLEAR ?AUTO_3126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3126 ?AUTO_3127 )
      ( MAKE-ON ?AUTO_3123 ?AUTO_3124 )
      ( MAKE-ON-VERIFY ?AUTO_3123 ?AUTO_3124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1896 - BLOCK
      ?AUTO_1897 - BLOCK
    )
    :vars
    (
      ?AUTO_1898 - BLOCK
      ?AUTO_1900 - BLOCK
      ?AUTO_1901 - BLOCK
      ?AUTO_1902 - BLOCK
      ?AUTO_1899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1896 ?AUTO_1897 ) ) ( ON-TABLE ?AUTO_1896 ) ( not ( = ?AUTO_1896 ?AUTO_1898 ) ) ( not ( = ?AUTO_1896 ?AUTO_1900 ) ) ( not ( = ?AUTO_1897 ?AUTO_1898 ) ) ( not ( = ?AUTO_1897 ?AUTO_1900 ) ) ( not ( = ?AUTO_1898 ?AUTO_1900 ) ) ( ON ?AUTO_1898 ?AUTO_1897 ) ( not ( = ?AUTO_1896 ?AUTO_1901 ) ) ( not ( = ?AUTO_1896 ?AUTO_1902 ) ) ( not ( = ?AUTO_1897 ?AUTO_1901 ) ) ( not ( = ?AUTO_1897 ?AUTO_1902 ) ) ( not ( = ?AUTO_1900 ?AUTO_1901 ) ) ( not ( = ?AUTO_1900 ?AUTO_1902 ) ) ( not ( = ?AUTO_1898 ?AUTO_1901 ) ) ( not ( = ?AUTO_1898 ?AUTO_1902 ) ) ( not ( = ?AUTO_1901 ?AUTO_1902 ) ) ( ON ?AUTO_1901 ?AUTO_1898 ) ( not ( = ?AUTO_1896 ?AUTO_1899 ) ) ( not ( = ?AUTO_1897 ?AUTO_1899 ) ) ( not ( = ?AUTO_1900 ?AUTO_1899 ) ) ( not ( = ?AUTO_1898 ?AUTO_1899 ) ) ( not ( = ?AUTO_1902 ?AUTO_1899 ) ) ( not ( = ?AUTO_1901 ?AUTO_1899 ) ) ( ON ?AUTO_1899 ?AUTO_1901 ) ( CLEAR ?AUTO_1899 ) ( ON ?AUTO_1900 ?AUTO_1896 ) ( CLEAR ?AUTO_1900 ) ( HOLDING ?AUTO_1902 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1902 )
      ( MAKE-ON ?AUTO_1896 ?AUTO_1897 )
      ( MAKE-ON-VERIFY ?AUTO_1896 ?AUTO_1897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1903 - BLOCK
      ?AUTO_1904 - BLOCK
    )
    :vars
    (
      ?AUTO_1906 - BLOCK
      ?AUTO_1908 - BLOCK
      ?AUTO_1909 - BLOCK
      ?AUTO_1907 - BLOCK
      ?AUTO_1905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1903 ?AUTO_1904 ) ) ( ON-TABLE ?AUTO_1903 ) ( not ( = ?AUTO_1903 ?AUTO_1906 ) ) ( not ( = ?AUTO_1903 ?AUTO_1908 ) ) ( not ( = ?AUTO_1904 ?AUTO_1906 ) ) ( not ( = ?AUTO_1904 ?AUTO_1908 ) ) ( not ( = ?AUTO_1906 ?AUTO_1908 ) ) ( ON ?AUTO_1906 ?AUTO_1904 ) ( not ( = ?AUTO_1903 ?AUTO_1909 ) ) ( not ( = ?AUTO_1903 ?AUTO_1907 ) ) ( not ( = ?AUTO_1904 ?AUTO_1909 ) ) ( not ( = ?AUTO_1904 ?AUTO_1907 ) ) ( not ( = ?AUTO_1908 ?AUTO_1909 ) ) ( not ( = ?AUTO_1908 ?AUTO_1907 ) ) ( not ( = ?AUTO_1906 ?AUTO_1909 ) ) ( not ( = ?AUTO_1906 ?AUTO_1907 ) ) ( not ( = ?AUTO_1909 ?AUTO_1907 ) ) ( ON ?AUTO_1909 ?AUTO_1906 ) ( not ( = ?AUTO_1903 ?AUTO_1905 ) ) ( not ( = ?AUTO_1904 ?AUTO_1905 ) ) ( not ( = ?AUTO_1908 ?AUTO_1905 ) ) ( not ( = ?AUTO_1906 ?AUTO_1905 ) ) ( not ( = ?AUTO_1907 ?AUTO_1905 ) ) ( not ( = ?AUTO_1909 ?AUTO_1905 ) ) ( ON ?AUTO_1905 ?AUTO_1909 ) ( CLEAR ?AUTO_1905 ) ( ON ?AUTO_1908 ?AUTO_1903 ) ( ON ?AUTO_1907 ?AUTO_1908 ) ( CLEAR ?AUTO_1907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1907 ?AUTO_1908 )
      ( MAKE-ON ?AUTO_1903 ?AUTO_1904 )
      ( MAKE-ON-VERIFY ?AUTO_1903 ?AUTO_1904 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1910 - BLOCK
      ?AUTO_1911 - BLOCK
    )
    :vars
    (
      ?AUTO_1913 - BLOCK
      ?AUTO_1914 - BLOCK
      ?AUTO_1915 - BLOCK
      ?AUTO_1916 - BLOCK
      ?AUTO_1912 - BLOCK
      ?AUTO_1917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1910 ?AUTO_1911 ) ) ( ON-TABLE ?AUTO_1910 ) ( not ( = ?AUTO_1910 ?AUTO_1913 ) ) ( not ( = ?AUTO_1910 ?AUTO_1914 ) ) ( not ( = ?AUTO_1911 ?AUTO_1913 ) ) ( not ( = ?AUTO_1911 ?AUTO_1914 ) ) ( not ( = ?AUTO_1913 ?AUTO_1914 ) ) ( ON ?AUTO_1913 ?AUTO_1911 ) ( not ( = ?AUTO_1910 ?AUTO_1915 ) ) ( not ( = ?AUTO_1910 ?AUTO_1916 ) ) ( not ( = ?AUTO_1911 ?AUTO_1915 ) ) ( not ( = ?AUTO_1911 ?AUTO_1916 ) ) ( not ( = ?AUTO_1914 ?AUTO_1915 ) ) ( not ( = ?AUTO_1914 ?AUTO_1916 ) ) ( not ( = ?AUTO_1913 ?AUTO_1915 ) ) ( not ( = ?AUTO_1913 ?AUTO_1916 ) ) ( not ( = ?AUTO_1915 ?AUTO_1916 ) ) ( ON ?AUTO_1915 ?AUTO_1913 ) ( not ( = ?AUTO_1910 ?AUTO_1912 ) ) ( not ( = ?AUTO_1911 ?AUTO_1912 ) ) ( not ( = ?AUTO_1914 ?AUTO_1912 ) ) ( not ( = ?AUTO_1913 ?AUTO_1912 ) ) ( not ( = ?AUTO_1916 ?AUTO_1912 ) ) ( not ( = ?AUTO_1915 ?AUTO_1912 ) ) ( ON ?AUTO_1912 ?AUTO_1915 ) ( CLEAR ?AUTO_1912 ) ( ON ?AUTO_1914 ?AUTO_1910 ) ( ON ?AUTO_1916 ?AUTO_1914 ) ( CLEAR ?AUTO_1916 ) ( HOLDING ?AUTO_1917 ) ( not ( = ?AUTO_1910 ?AUTO_1917 ) ) ( not ( = ?AUTO_1911 ?AUTO_1917 ) ) ( not ( = ?AUTO_1913 ?AUTO_1917 ) ) ( not ( = ?AUTO_1914 ?AUTO_1917 ) ) ( not ( = ?AUTO_1915 ?AUTO_1917 ) ) ( not ( = ?AUTO_1916 ?AUTO_1917 ) ) ( not ( = ?AUTO_1912 ?AUTO_1917 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1917 )
      ( MAKE-ON ?AUTO_1910 ?AUTO_1911 )
      ( MAKE-ON-VERIFY ?AUTO_1910 ?AUTO_1911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1918 - BLOCK
      ?AUTO_1919 - BLOCK
    )
    :vars
    (
      ?AUTO_1920 - BLOCK
      ?AUTO_1923 - BLOCK
      ?AUTO_1922 - BLOCK
      ?AUTO_1924 - BLOCK
      ?AUTO_1921 - BLOCK
      ?AUTO_1925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1918 ?AUTO_1919 ) ) ( ON-TABLE ?AUTO_1918 ) ( not ( = ?AUTO_1918 ?AUTO_1920 ) ) ( not ( = ?AUTO_1918 ?AUTO_1923 ) ) ( not ( = ?AUTO_1919 ?AUTO_1920 ) ) ( not ( = ?AUTO_1919 ?AUTO_1923 ) ) ( not ( = ?AUTO_1920 ?AUTO_1923 ) ) ( ON ?AUTO_1920 ?AUTO_1919 ) ( not ( = ?AUTO_1918 ?AUTO_1922 ) ) ( not ( = ?AUTO_1918 ?AUTO_1924 ) ) ( not ( = ?AUTO_1919 ?AUTO_1922 ) ) ( not ( = ?AUTO_1919 ?AUTO_1924 ) ) ( not ( = ?AUTO_1923 ?AUTO_1922 ) ) ( not ( = ?AUTO_1923 ?AUTO_1924 ) ) ( not ( = ?AUTO_1920 ?AUTO_1922 ) ) ( not ( = ?AUTO_1920 ?AUTO_1924 ) ) ( not ( = ?AUTO_1922 ?AUTO_1924 ) ) ( ON ?AUTO_1922 ?AUTO_1920 ) ( not ( = ?AUTO_1918 ?AUTO_1921 ) ) ( not ( = ?AUTO_1919 ?AUTO_1921 ) ) ( not ( = ?AUTO_1923 ?AUTO_1921 ) ) ( not ( = ?AUTO_1920 ?AUTO_1921 ) ) ( not ( = ?AUTO_1924 ?AUTO_1921 ) ) ( not ( = ?AUTO_1922 ?AUTO_1921 ) ) ( ON ?AUTO_1921 ?AUTO_1922 ) ( ON ?AUTO_1923 ?AUTO_1918 ) ( ON ?AUTO_1924 ?AUTO_1923 ) ( CLEAR ?AUTO_1924 ) ( not ( = ?AUTO_1918 ?AUTO_1925 ) ) ( not ( = ?AUTO_1919 ?AUTO_1925 ) ) ( not ( = ?AUTO_1920 ?AUTO_1925 ) ) ( not ( = ?AUTO_1923 ?AUTO_1925 ) ) ( not ( = ?AUTO_1922 ?AUTO_1925 ) ) ( not ( = ?AUTO_1924 ?AUTO_1925 ) ) ( not ( = ?AUTO_1921 ?AUTO_1925 ) ) ( ON ?AUTO_1925 ?AUTO_1921 ) ( CLEAR ?AUTO_1925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1925 ?AUTO_1921 )
      ( MAKE-ON ?AUTO_1918 ?AUTO_1919 )
      ( MAKE-ON-VERIFY ?AUTO_1918 ?AUTO_1919 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3141 - BLOCK
      ?AUTO_3142 - BLOCK
    )
    :vars
    (
      ?AUTO_3143 - BLOCK
      ?AUTO_3144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3141 ?AUTO_3142 ) ) ( not ( = ?AUTO_3141 ?AUTO_3143 ) ) ( not ( = ?AUTO_3142 ?AUTO_3143 ) ) ( ON ?AUTO_3143 ?AUTO_3142 ) ( not ( = ?AUTO_3141 ?AUTO_3144 ) ) ( not ( = ?AUTO_3142 ?AUTO_3144 ) ) ( not ( = ?AUTO_3143 ?AUTO_3144 ) ) ( ON ?AUTO_3144 ?AUTO_3143 ) ( CLEAR ?AUTO_3144 ) ( HOLDING ?AUTO_3141 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3141 )
      ( MAKE-ON ?AUTO_3141 ?AUTO_3142 )
      ( MAKE-ON-VERIFY ?AUTO_3141 ?AUTO_3142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2001 - BLOCK
      ?AUTO_2002 - BLOCK
    )
    :vars
    (
      ?AUTO_2005 - BLOCK
      ?AUTO_2004 - BLOCK
      ?AUTO_2006 - BLOCK
      ?AUTO_2003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2001 ?AUTO_2002 ) ) ( not ( = ?AUTO_2001 ?AUTO_2005 ) ) ( not ( = ?AUTO_2001 ?AUTO_2004 ) ) ( not ( = ?AUTO_2002 ?AUTO_2005 ) ) ( not ( = ?AUTO_2002 ?AUTO_2004 ) ) ( not ( = ?AUTO_2005 ?AUTO_2004 ) ) ( ON ?AUTO_2005 ?AUTO_2002 ) ( CLEAR ?AUTO_2006 ) ( not ( = ?AUTO_2001 ?AUTO_2003 ) ) ( not ( = ?AUTO_2001 ?AUTO_2006 ) ) ( not ( = ?AUTO_2002 ?AUTO_2003 ) ) ( not ( = ?AUTO_2002 ?AUTO_2006 ) ) ( not ( = ?AUTO_2004 ?AUTO_2003 ) ) ( not ( = ?AUTO_2004 ?AUTO_2006 ) ) ( not ( = ?AUTO_2005 ?AUTO_2003 ) ) ( not ( = ?AUTO_2005 ?AUTO_2006 ) ) ( not ( = ?AUTO_2003 ?AUTO_2006 ) ) ( ON ?AUTO_2003 ?AUTO_2005 ) ( CLEAR ?AUTO_2003 ) ( ON ?AUTO_2001 ?AUTO_2004 ) ( CLEAR ?AUTO_2001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2001 ?AUTO_2004 )
      ( MAKE-ON ?AUTO_2001 ?AUTO_2002 )
      ( MAKE-ON-VERIFY ?AUTO_2001 ?AUTO_2002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2157 - BLOCK
      ?AUTO_2158 - BLOCK
    )
    :vars
    (
      ?AUTO_2159 - BLOCK
      ?AUTO_2160 - BLOCK
      ?AUTO_2161 - BLOCK
      ?AUTO_2162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2157 ?AUTO_2158 ) ) ( not ( = ?AUTO_2157 ?AUTO_2159 ) ) ( not ( = ?AUTO_2158 ?AUTO_2159 ) ) ( ON ?AUTO_2159 ?AUTO_2158 ) ( ON ?AUTO_2157 ?AUTO_2159 ) ( CLEAR ?AUTO_2160 ) ( not ( = ?AUTO_2157 ?AUTO_2161 ) ) ( not ( = ?AUTO_2157 ?AUTO_2160 ) ) ( not ( = ?AUTO_2158 ?AUTO_2161 ) ) ( not ( = ?AUTO_2158 ?AUTO_2160 ) ) ( not ( = ?AUTO_2159 ?AUTO_2161 ) ) ( not ( = ?AUTO_2159 ?AUTO_2160 ) ) ( not ( = ?AUTO_2161 ?AUTO_2160 ) ) ( ON ?AUTO_2161 ?AUTO_2157 ) ( CLEAR ?AUTO_2161 ) ( HOLDING ?AUTO_2162 ) ( not ( = ?AUTO_2157 ?AUTO_2162 ) ) ( not ( = ?AUTO_2158 ?AUTO_2162 ) ) ( not ( = ?AUTO_2159 ?AUTO_2162 ) ) ( not ( = ?AUTO_2160 ?AUTO_2162 ) ) ( not ( = ?AUTO_2161 ?AUTO_2162 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2162 )
      ( MAKE-ON ?AUTO_2157 ?AUTO_2158 )
      ( MAKE-ON-VERIFY ?AUTO_2157 ?AUTO_2158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2263 - BLOCK
      ?AUTO_2264 - BLOCK
    )
    :vars
    (
      ?AUTO_2267 - BLOCK
      ?AUTO_2265 - BLOCK
      ?AUTO_2266 - BLOCK
      ?AUTO_2268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2263 ?AUTO_2264 ) ) ( ON ?AUTO_2263 ?AUTO_2267 ) ( not ( = ?AUTO_2263 ?AUTO_2267 ) ) ( not ( = ?AUTO_2264 ?AUTO_2267 ) ) ( not ( = ?AUTO_2263 ?AUTO_2265 ) ) ( not ( = ?AUTO_2263 ?AUTO_2266 ) ) ( not ( = ?AUTO_2264 ?AUTO_2265 ) ) ( not ( = ?AUTO_2264 ?AUTO_2266 ) ) ( not ( = ?AUTO_2267 ?AUTO_2265 ) ) ( not ( = ?AUTO_2267 ?AUTO_2266 ) ) ( not ( = ?AUTO_2265 ?AUTO_2266 ) ) ( ON ?AUTO_2265 ?AUTO_2263 ) ( CLEAR ?AUTO_2265 ) ( CLEAR ?AUTO_2268 ) ( not ( = ?AUTO_2263 ?AUTO_2268 ) ) ( not ( = ?AUTO_2264 ?AUTO_2268 ) ) ( not ( = ?AUTO_2267 ?AUTO_2268 ) ) ( not ( = ?AUTO_2265 ?AUTO_2268 ) ) ( not ( = ?AUTO_2266 ?AUTO_2268 ) ) ( ON ?AUTO_2266 ?AUTO_2264 ) ( CLEAR ?AUTO_2266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2266 ?AUTO_2264 )
      ( MAKE-ON ?AUTO_2263 ?AUTO_2264 )
      ( MAKE-ON-VERIFY ?AUTO_2263 ?AUTO_2264 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2269 - BLOCK
      ?AUTO_2270 - BLOCK
    )
    :vars
    (
      ?AUTO_2274 - BLOCK
      ?AUTO_2271 - BLOCK
      ?AUTO_2272 - BLOCK
      ?AUTO_2273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2269 ?AUTO_2270 ) ) ( ON ?AUTO_2269 ?AUTO_2274 ) ( not ( = ?AUTO_2269 ?AUTO_2274 ) ) ( not ( = ?AUTO_2270 ?AUTO_2274 ) ) ( not ( = ?AUTO_2269 ?AUTO_2271 ) ) ( not ( = ?AUTO_2269 ?AUTO_2272 ) ) ( not ( = ?AUTO_2270 ?AUTO_2271 ) ) ( not ( = ?AUTO_2270 ?AUTO_2272 ) ) ( not ( = ?AUTO_2274 ?AUTO_2271 ) ) ( not ( = ?AUTO_2274 ?AUTO_2272 ) ) ( not ( = ?AUTO_2271 ?AUTO_2272 ) ) ( CLEAR ?AUTO_2273 ) ( not ( = ?AUTO_2269 ?AUTO_2273 ) ) ( not ( = ?AUTO_2270 ?AUTO_2273 ) ) ( not ( = ?AUTO_2274 ?AUTO_2273 ) ) ( not ( = ?AUTO_2271 ?AUTO_2273 ) ) ( not ( = ?AUTO_2272 ?AUTO_2273 ) ) ( ON ?AUTO_2272 ?AUTO_2270 ) ( CLEAR ?AUTO_2272 ) ( HOLDING ?AUTO_2271 ) ( CLEAR ?AUTO_2269 ) )
    :subtasks
    ( ( !STACK ?AUTO_2271 ?AUTO_2269 )
      ( MAKE-ON ?AUTO_2269 ?AUTO_2270 )
      ( MAKE-ON-VERIFY ?AUTO_2269 ?AUTO_2270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2288 - BLOCK
      ?AUTO_2289 - BLOCK
    )
    :vars
    (
      ?AUTO_2293 - BLOCK
      ?AUTO_2294 - BLOCK
      ?AUTO_2290 - BLOCK
      ?AUTO_2292 - BLOCK
      ?AUTO_2291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2288 ?AUTO_2289 ) ) ( ON ?AUTO_2288 ?AUTO_2293 ) ( not ( = ?AUTO_2288 ?AUTO_2293 ) ) ( not ( = ?AUTO_2289 ?AUTO_2293 ) ) ( not ( = ?AUTO_2288 ?AUTO_2294 ) ) ( not ( = ?AUTO_2288 ?AUTO_2290 ) ) ( not ( = ?AUTO_2289 ?AUTO_2294 ) ) ( not ( = ?AUTO_2289 ?AUTO_2290 ) ) ( not ( = ?AUTO_2293 ?AUTO_2294 ) ) ( not ( = ?AUTO_2293 ?AUTO_2290 ) ) ( not ( = ?AUTO_2294 ?AUTO_2290 ) ) ( CLEAR ?AUTO_2292 ) ( not ( = ?AUTO_2288 ?AUTO_2292 ) ) ( not ( = ?AUTO_2289 ?AUTO_2292 ) ) ( not ( = ?AUTO_2293 ?AUTO_2292 ) ) ( not ( = ?AUTO_2294 ?AUTO_2292 ) ) ( not ( = ?AUTO_2290 ?AUTO_2292 ) ) ( ON ?AUTO_2290 ?AUTO_2289 ) ( ON ?AUTO_2294 ?AUTO_2290 ) ( CLEAR ?AUTO_2294 ) ( not ( = ?AUTO_2288 ?AUTO_2291 ) ) ( not ( = ?AUTO_2289 ?AUTO_2291 ) ) ( not ( = ?AUTO_2293 ?AUTO_2291 ) ) ( not ( = ?AUTO_2294 ?AUTO_2291 ) ) ( not ( = ?AUTO_2290 ?AUTO_2291 ) ) ( not ( = ?AUTO_2292 ?AUTO_2291 ) ) ( ON ?AUTO_2291 ?AUTO_2288 ) ( CLEAR ?AUTO_2291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2291 ?AUTO_2288 )
      ( MAKE-ON ?AUTO_2288 ?AUTO_2289 )
      ( MAKE-ON-VERIFY ?AUTO_2288 ?AUTO_2289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2295 - BLOCK
      ?AUTO_2296 - BLOCK
    )
    :vars
    (
      ?AUTO_2300 - BLOCK
      ?AUTO_2298 - BLOCK
      ?AUTO_2301 - BLOCK
      ?AUTO_2299 - BLOCK
      ?AUTO_2297 - BLOCK
      ?AUTO_2302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2295 ?AUTO_2296 ) ) ( ON ?AUTO_2295 ?AUTO_2300 ) ( not ( = ?AUTO_2295 ?AUTO_2300 ) ) ( not ( = ?AUTO_2296 ?AUTO_2300 ) ) ( not ( = ?AUTO_2295 ?AUTO_2298 ) ) ( not ( = ?AUTO_2295 ?AUTO_2301 ) ) ( not ( = ?AUTO_2296 ?AUTO_2298 ) ) ( not ( = ?AUTO_2296 ?AUTO_2301 ) ) ( not ( = ?AUTO_2300 ?AUTO_2298 ) ) ( not ( = ?AUTO_2300 ?AUTO_2301 ) ) ( not ( = ?AUTO_2298 ?AUTO_2301 ) ) ( CLEAR ?AUTO_2299 ) ( not ( = ?AUTO_2295 ?AUTO_2299 ) ) ( not ( = ?AUTO_2296 ?AUTO_2299 ) ) ( not ( = ?AUTO_2300 ?AUTO_2299 ) ) ( not ( = ?AUTO_2298 ?AUTO_2299 ) ) ( not ( = ?AUTO_2301 ?AUTO_2299 ) ) ( ON ?AUTO_2301 ?AUTO_2296 ) ( ON ?AUTO_2298 ?AUTO_2301 ) ( CLEAR ?AUTO_2298 ) ( not ( = ?AUTO_2295 ?AUTO_2297 ) ) ( not ( = ?AUTO_2296 ?AUTO_2297 ) ) ( not ( = ?AUTO_2300 ?AUTO_2297 ) ) ( not ( = ?AUTO_2298 ?AUTO_2297 ) ) ( not ( = ?AUTO_2301 ?AUTO_2297 ) ) ( not ( = ?AUTO_2299 ?AUTO_2297 ) ) ( ON ?AUTO_2297 ?AUTO_2295 ) ( CLEAR ?AUTO_2297 ) ( HOLDING ?AUTO_2302 ) ( not ( = ?AUTO_2295 ?AUTO_2302 ) ) ( not ( = ?AUTO_2296 ?AUTO_2302 ) ) ( not ( = ?AUTO_2300 ?AUTO_2302 ) ) ( not ( = ?AUTO_2298 ?AUTO_2302 ) ) ( not ( = ?AUTO_2301 ?AUTO_2302 ) ) ( not ( = ?AUTO_2299 ?AUTO_2302 ) ) ( not ( = ?AUTO_2297 ?AUTO_2302 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2302 )
      ( MAKE-ON ?AUTO_2295 ?AUTO_2296 )
      ( MAKE-ON-VERIFY ?AUTO_2295 ?AUTO_2296 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2303 - BLOCK
      ?AUTO_2304 - BLOCK
    )
    :vars
    (
      ?AUTO_2309 - BLOCK
      ?AUTO_2307 - BLOCK
      ?AUTO_2305 - BLOCK
      ?AUTO_2308 - BLOCK
      ?AUTO_2306 - BLOCK
      ?AUTO_2310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2303 ?AUTO_2304 ) ) ( ON ?AUTO_2303 ?AUTO_2309 ) ( not ( = ?AUTO_2303 ?AUTO_2309 ) ) ( not ( = ?AUTO_2304 ?AUTO_2309 ) ) ( not ( = ?AUTO_2303 ?AUTO_2307 ) ) ( not ( = ?AUTO_2303 ?AUTO_2305 ) ) ( not ( = ?AUTO_2304 ?AUTO_2307 ) ) ( not ( = ?AUTO_2304 ?AUTO_2305 ) ) ( not ( = ?AUTO_2309 ?AUTO_2307 ) ) ( not ( = ?AUTO_2309 ?AUTO_2305 ) ) ( not ( = ?AUTO_2307 ?AUTO_2305 ) ) ( CLEAR ?AUTO_2308 ) ( not ( = ?AUTO_2303 ?AUTO_2308 ) ) ( not ( = ?AUTO_2304 ?AUTO_2308 ) ) ( not ( = ?AUTO_2309 ?AUTO_2308 ) ) ( not ( = ?AUTO_2307 ?AUTO_2308 ) ) ( not ( = ?AUTO_2305 ?AUTO_2308 ) ) ( ON ?AUTO_2305 ?AUTO_2304 ) ( ON ?AUTO_2307 ?AUTO_2305 ) ( CLEAR ?AUTO_2307 ) ( not ( = ?AUTO_2303 ?AUTO_2306 ) ) ( not ( = ?AUTO_2304 ?AUTO_2306 ) ) ( not ( = ?AUTO_2309 ?AUTO_2306 ) ) ( not ( = ?AUTO_2307 ?AUTO_2306 ) ) ( not ( = ?AUTO_2305 ?AUTO_2306 ) ) ( not ( = ?AUTO_2308 ?AUTO_2306 ) ) ( ON ?AUTO_2306 ?AUTO_2303 ) ( not ( = ?AUTO_2303 ?AUTO_2310 ) ) ( not ( = ?AUTO_2304 ?AUTO_2310 ) ) ( not ( = ?AUTO_2309 ?AUTO_2310 ) ) ( not ( = ?AUTO_2307 ?AUTO_2310 ) ) ( not ( = ?AUTO_2305 ?AUTO_2310 ) ) ( not ( = ?AUTO_2308 ?AUTO_2310 ) ) ( not ( = ?AUTO_2306 ?AUTO_2310 ) ) ( ON ?AUTO_2310 ?AUTO_2306 ) ( CLEAR ?AUTO_2310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2310 ?AUTO_2306 )
      ( MAKE-ON ?AUTO_2303 ?AUTO_2304 )
      ( MAKE-ON-VERIFY ?AUTO_2303 ?AUTO_2304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2311 - BLOCK
      ?AUTO_2312 - BLOCK
    )
    :vars
    (
      ?AUTO_2313 - BLOCK
      ?AUTO_2318 - BLOCK
      ?AUTO_2317 - BLOCK
      ?AUTO_2315 - BLOCK
      ?AUTO_2316 - BLOCK
      ?AUTO_2314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2311 ?AUTO_2312 ) ) ( ON ?AUTO_2311 ?AUTO_2313 ) ( not ( = ?AUTO_2311 ?AUTO_2313 ) ) ( not ( = ?AUTO_2312 ?AUTO_2313 ) ) ( not ( = ?AUTO_2311 ?AUTO_2318 ) ) ( not ( = ?AUTO_2311 ?AUTO_2317 ) ) ( not ( = ?AUTO_2312 ?AUTO_2318 ) ) ( not ( = ?AUTO_2312 ?AUTO_2317 ) ) ( not ( = ?AUTO_2313 ?AUTO_2318 ) ) ( not ( = ?AUTO_2313 ?AUTO_2317 ) ) ( not ( = ?AUTO_2318 ?AUTO_2317 ) ) ( not ( = ?AUTO_2311 ?AUTO_2315 ) ) ( not ( = ?AUTO_2312 ?AUTO_2315 ) ) ( not ( = ?AUTO_2313 ?AUTO_2315 ) ) ( not ( = ?AUTO_2318 ?AUTO_2315 ) ) ( not ( = ?AUTO_2317 ?AUTO_2315 ) ) ( ON ?AUTO_2317 ?AUTO_2312 ) ( ON ?AUTO_2318 ?AUTO_2317 ) ( CLEAR ?AUTO_2318 ) ( not ( = ?AUTO_2311 ?AUTO_2316 ) ) ( not ( = ?AUTO_2312 ?AUTO_2316 ) ) ( not ( = ?AUTO_2313 ?AUTO_2316 ) ) ( not ( = ?AUTO_2318 ?AUTO_2316 ) ) ( not ( = ?AUTO_2317 ?AUTO_2316 ) ) ( not ( = ?AUTO_2315 ?AUTO_2316 ) ) ( ON ?AUTO_2316 ?AUTO_2311 ) ( not ( = ?AUTO_2311 ?AUTO_2314 ) ) ( not ( = ?AUTO_2312 ?AUTO_2314 ) ) ( not ( = ?AUTO_2313 ?AUTO_2314 ) ) ( not ( = ?AUTO_2318 ?AUTO_2314 ) ) ( not ( = ?AUTO_2317 ?AUTO_2314 ) ) ( not ( = ?AUTO_2315 ?AUTO_2314 ) ) ( not ( = ?AUTO_2316 ?AUTO_2314 ) ) ( ON ?AUTO_2314 ?AUTO_2316 ) ( CLEAR ?AUTO_2314 ) ( HOLDING ?AUTO_2315 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2315 )
      ( MAKE-ON ?AUTO_2311 ?AUTO_2312 )
      ( MAKE-ON-VERIFY ?AUTO_2311 ?AUTO_2312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2319 - BLOCK
      ?AUTO_2320 - BLOCK
    )
    :vars
    (
      ?AUTO_2326 - BLOCK
      ?AUTO_2322 - BLOCK
      ?AUTO_2323 - BLOCK
      ?AUTO_2321 - BLOCK
      ?AUTO_2324 - BLOCK
      ?AUTO_2325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2319 ?AUTO_2320 ) ) ( ON ?AUTO_2319 ?AUTO_2326 ) ( not ( = ?AUTO_2319 ?AUTO_2326 ) ) ( not ( = ?AUTO_2320 ?AUTO_2326 ) ) ( not ( = ?AUTO_2319 ?AUTO_2322 ) ) ( not ( = ?AUTO_2319 ?AUTO_2323 ) ) ( not ( = ?AUTO_2320 ?AUTO_2322 ) ) ( not ( = ?AUTO_2320 ?AUTO_2323 ) ) ( not ( = ?AUTO_2326 ?AUTO_2322 ) ) ( not ( = ?AUTO_2326 ?AUTO_2323 ) ) ( not ( = ?AUTO_2322 ?AUTO_2323 ) ) ( not ( = ?AUTO_2319 ?AUTO_2321 ) ) ( not ( = ?AUTO_2320 ?AUTO_2321 ) ) ( not ( = ?AUTO_2326 ?AUTO_2321 ) ) ( not ( = ?AUTO_2322 ?AUTO_2321 ) ) ( not ( = ?AUTO_2323 ?AUTO_2321 ) ) ( ON ?AUTO_2323 ?AUTO_2320 ) ( ON ?AUTO_2322 ?AUTO_2323 ) ( CLEAR ?AUTO_2322 ) ( not ( = ?AUTO_2319 ?AUTO_2324 ) ) ( not ( = ?AUTO_2320 ?AUTO_2324 ) ) ( not ( = ?AUTO_2326 ?AUTO_2324 ) ) ( not ( = ?AUTO_2322 ?AUTO_2324 ) ) ( not ( = ?AUTO_2323 ?AUTO_2324 ) ) ( not ( = ?AUTO_2321 ?AUTO_2324 ) ) ( ON ?AUTO_2324 ?AUTO_2319 ) ( not ( = ?AUTO_2319 ?AUTO_2325 ) ) ( not ( = ?AUTO_2320 ?AUTO_2325 ) ) ( not ( = ?AUTO_2326 ?AUTO_2325 ) ) ( not ( = ?AUTO_2322 ?AUTO_2325 ) ) ( not ( = ?AUTO_2323 ?AUTO_2325 ) ) ( not ( = ?AUTO_2321 ?AUTO_2325 ) ) ( not ( = ?AUTO_2324 ?AUTO_2325 ) ) ( ON ?AUTO_2325 ?AUTO_2324 ) ( ON ?AUTO_2321 ?AUTO_2325 ) ( CLEAR ?AUTO_2321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2321 ?AUTO_2325 )
      ( MAKE-ON ?AUTO_2319 ?AUTO_2320 )
      ( MAKE-ON-VERIFY ?AUTO_2319 ?AUTO_2320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6062 - BLOCK
      ?AUTO_6063 - BLOCK
    )
    :vars
    (
      ?AUTO_6065 - BLOCK
      ?AUTO_6064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6062 ?AUTO_6063 ) ) ( not ( = ?AUTO_6062 ?AUTO_6065 ) ) ( not ( = ?AUTO_6063 ?AUTO_6065 ) ) ( not ( = ?AUTO_6062 ?AUTO_6064 ) ) ( not ( = ?AUTO_6063 ?AUTO_6064 ) ) ( not ( = ?AUTO_6065 ?AUTO_6064 ) ) ( ON ?AUTO_6064 ?AUTO_6063 ) ( CLEAR ?AUTO_6064 ) ( HOLDING ?AUTO_6062 ) ( CLEAR ?AUTO_6065 ) )
    :subtasks
    ( ( !STACK ?AUTO_6062 ?AUTO_6065 )
      ( MAKE-ON ?AUTO_6062 ?AUTO_6063 )
      ( MAKE-ON-VERIFY ?AUTO_6062 ?AUTO_6063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2466 - BLOCK
      ?AUTO_2467 - BLOCK
    )
    :vars
    (
      ?AUTO_2471 - BLOCK
      ?AUTO_2468 - BLOCK
      ?AUTO_2469 - BLOCK
      ?AUTO_2470 - BLOCK
      ?AUTO_2472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2466 ?AUTO_2467 ) ) ( ON ?AUTO_2466 ?AUTO_2471 ) ( not ( = ?AUTO_2466 ?AUTO_2471 ) ) ( not ( = ?AUTO_2467 ?AUTO_2471 ) ) ( not ( = ?AUTO_2466 ?AUTO_2468 ) ) ( not ( = ?AUTO_2467 ?AUTO_2468 ) ) ( not ( = ?AUTO_2471 ?AUTO_2468 ) ) ( ON ?AUTO_2468 ?AUTO_2466 ) ( CLEAR ?AUTO_2469 ) ( not ( = ?AUTO_2466 ?AUTO_2470 ) ) ( not ( = ?AUTO_2466 ?AUTO_2469 ) ) ( not ( = ?AUTO_2467 ?AUTO_2470 ) ) ( not ( = ?AUTO_2467 ?AUTO_2469 ) ) ( not ( = ?AUTO_2471 ?AUTO_2470 ) ) ( not ( = ?AUTO_2471 ?AUTO_2469 ) ) ( not ( = ?AUTO_2468 ?AUTO_2470 ) ) ( not ( = ?AUTO_2468 ?AUTO_2469 ) ) ( not ( = ?AUTO_2470 ?AUTO_2469 ) ) ( ON ?AUTO_2470 ?AUTO_2468 ) ( CLEAR ?AUTO_2470 ) ( HOLDING ?AUTO_2467 ) ( CLEAR ?AUTO_2472 ) ( not ( = ?AUTO_2466 ?AUTO_2472 ) ) ( not ( = ?AUTO_2467 ?AUTO_2472 ) ) ( not ( = ?AUTO_2471 ?AUTO_2472 ) ) ( not ( = ?AUTO_2468 ?AUTO_2472 ) ) ( not ( = ?AUTO_2469 ?AUTO_2472 ) ) ( not ( = ?AUTO_2470 ?AUTO_2472 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2467 ?AUTO_2472 )
      ( MAKE-ON ?AUTO_2466 ?AUTO_2467 )
      ( MAKE-ON-VERIFY ?AUTO_2466 ?AUTO_2467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2509 - BLOCK
      ?AUTO_2510 - BLOCK
    )
    :vars
    (
      ?AUTO_2513 - BLOCK
      ?AUTO_2514 - BLOCK
      ?AUTO_2511 - BLOCK
      ?AUTO_2515 - BLOCK
      ?AUTO_2512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2509 ?AUTO_2510 ) ) ( ON ?AUTO_2509 ?AUTO_2513 ) ( not ( = ?AUTO_2509 ?AUTO_2513 ) ) ( not ( = ?AUTO_2510 ?AUTO_2513 ) ) ( not ( = ?AUTO_2509 ?AUTO_2514 ) ) ( not ( = ?AUTO_2510 ?AUTO_2514 ) ) ( not ( = ?AUTO_2513 ?AUTO_2514 ) ) ( ON ?AUTO_2514 ?AUTO_2509 ) ( CLEAR ?AUTO_2511 ) ( not ( = ?AUTO_2509 ?AUTO_2515 ) ) ( not ( = ?AUTO_2509 ?AUTO_2511 ) ) ( not ( = ?AUTO_2510 ?AUTO_2515 ) ) ( not ( = ?AUTO_2510 ?AUTO_2511 ) ) ( not ( = ?AUTO_2513 ?AUTO_2515 ) ) ( not ( = ?AUTO_2513 ?AUTO_2511 ) ) ( not ( = ?AUTO_2514 ?AUTO_2515 ) ) ( not ( = ?AUTO_2514 ?AUTO_2511 ) ) ( not ( = ?AUTO_2515 ?AUTO_2511 ) ) ( not ( = ?AUTO_2509 ?AUTO_2512 ) ) ( not ( = ?AUTO_2510 ?AUTO_2512 ) ) ( not ( = ?AUTO_2513 ?AUTO_2512 ) ) ( not ( = ?AUTO_2514 ?AUTO_2512 ) ) ( not ( = ?AUTO_2511 ?AUTO_2512 ) ) ( not ( = ?AUTO_2515 ?AUTO_2512 ) ) ( ON ?AUTO_2512 ?AUTO_2514 ) ( CLEAR ?AUTO_2512 ) ( HOLDING ?AUTO_2515 ) ( CLEAR ?AUTO_2510 ) )
    :subtasks
    ( ( !STACK ?AUTO_2515 ?AUTO_2510 )
      ( MAKE-ON ?AUTO_2509 ?AUTO_2510 )
      ( MAKE-ON-VERIFY ?AUTO_2509 ?AUTO_2510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2516 - BLOCK
      ?AUTO_2517 - BLOCK
    )
    :vars
    (
      ?AUTO_2521 - BLOCK
      ?AUTO_2522 - BLOCK
      ?AUTO_2520 - BLOCK
      ?AUTO_2519 - BLOCK
      ?AUTO_2518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2516 ?AUTO_2517 ) ) ( ON ?AUTO_2516 ?AUTO_2521 ) ( not ( = ?AUTO_2516 ?AUTO_2521 ) ) ( not ( = ?AUTO_2517 ?AUTO_2521 ) ) ( not ( = ?AUTO_2516 ?AUTO_2522 ) ) ( not ( = ?AUTO_2517 ?AUTO_2522 ) ) ( not ( = ?AUTO_2521 ?AUTO_2522 ) ) ( ON ?AUTO_2522 ?AUTO_2516 ) ( CLEAR ?AUTO_2520 ) ( not ( = ?AUTO_2516 ?AUTO_2519 ) ) ( not ( = ?AUTO_2516 ?AUTO_2520 ) ) ( not ( = ?AUTO_2517 ?AUTO_2519 ) ) ( not ( = ?AUTO_2517 ?AUTO_2520 ) ) ( not ( = ?AUTO_2521 ?AUTO_2519 ) ) ( not ( = ?AUTO_2521 ?AUTO_2520 ) ) ( not ( = ?AUTO_2522 ?AUTO_2519 ) ) ( not ( = ?AUTO_2522 ?AUTO_2520 ) ) ( not ( = ?AUTO_2519 ?AUTO_2520 ) ) ( not ( = ?AUTO_2516 ?AUTO_2518 ) ) ( not ( = ?AUTO_2517 ?AUTO_2518 ) ) ( not ( = ?AUTO_2521 ?AUTO_2518 ) ) ( not ( = ?AUTO_2522 ?AUTO_2518 ) ) ( not ( = ?AUTO_2520 ?AUTO_2518 ) ) ( not ( = ?AUTO_2519 ?AUTO_2518 ) ) ( ON ?AUTO_2518 ?AUTO_2522 ) ( CLEAR ?AUTO_2517 ) ( ON ?AUTO_2519 ?AUTO_2518 ) ( CLEAR ?AUTO_2519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2519 ?AUTO_2518 )
      ( MAKE-ON ?AUTO_2516 ?AUTO_2517 )
      ( MAKE-ON-VERIFY ?AUTO_2516 ?AUTO_2517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5177 - BLOCK
      ?AUTO_5178 - BLOCK
    )
    :vars
    (
      ?AUTO_5179 - BLOCK
      ?AUTO_5181 - BLOCK
      ?AUTO_5183 - BLOCK
      ?AUTO_5180 - BLOCK
      ?AUTO_5182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5178 ) ( not ( = ?AUTO_5177 ?AUTO_5178 ) ) ( ON ?AUTO_5177 ?AUTO_5179 ) ( not ( = ?AUTO_5177 ?AUTO_5179 ) ) ( not ( = ?AUTO_5178 ?AUTO_5179 ) ) ( not ( = ?AUTO_5177 ?AUTO_5181 ) ) ( not ( = ?AUTO_5178 ?AUTO_5181 ) ) ( not ( = ?AUTO_5179 ?AUTO_5181 ) ) ( ON ?AUTO_5181 ?AUTO_5177 ) ( not ( = ?AUTO_5177 ?AUTO_5183 ) ) ( not ( = ?AUTO_5177 ?AUTO_5180 ) ) ( not ( = ?AUTO_5178 ?AUTO_5183 ) ) ( not ( = ?AUTO_5178 ?AUTO_5180 ) ) ( not ( = ?AUTO_5179 ?AUTO_5183 ) ) ( not ( = ?AUTO_5179 ?AUTO_5180 ) ) ( not ( = ?AUTO_5181 ?AUTO_5183 ) ) ( not ( = ?AUTO_5181 ?AUTO_5180 ) ) ( not ( = ?AUTO_5183 ?AUTO_5180 ) ) ( ON ?AUTO_5183 ?AUTO_5181 ) ( not ( = ?AUTO_5177 ?AUTO_5182 ) ) ( not ( = ?AUTO_5178 ?AUTO_5182 ) ) ( not ( = ?AUTO_5179 ?AUTO_5182 ) ) ( not ( = ?AUTO_5181 ?AUTO_5182 ) ) ( not ( = ?AUTO_5180 ?AUTO_5182 ) ) ( not ( = ?AUTO_5183 ?AUTO_5182 ) ) ( ON ?AUTO_5182 ?AUTO_5183 ) ( CLEAR ?AUTO_5182 ) ( HOLDING ?AUTO_5180 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5180 )
      ( MAKE-ON ?AUTO_5177 ?AUTO_5178 )
      ( MAKE-ON-VERIFY ?AUTO_5177 ?AUTO_5178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5184 - BLOCK
      ?AUTO_5185 - BLOCK
    )
    :vars
    (
      ?AUTO_5187 - BLOCK
      ?AUTO_5189 - BLOCK
      ?AUTO_5186 - BLOCK
      ?AUTO_5188 - BLOCK
      ?AUTO_5190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5184 ?AUTO_5185 ) ) ( ON ?AUTO_5184 ?AUTO_5187 ) ( not ( = ?AUTO_5184 ?AUTO_5187 ) ) ( not ( = ?AUTO_5185 ?AUTO_5187 ) ) ( not ( = ?AUTO_5184 ?AUTO_5189 ) ) ( not ( = ?AUTO_5185 ?AUTO_5189 ) ) ( not ( = ?AUTO_5187 ?AUTO_5189 ) ) ( ON ?AUTO_5189 ?AUTO_5184 ) ( not ( = ?AUTO_5184 ?AUTO_5186 ) ) ( not ( = ?AUTO_5184 ?AUTO_5188 ) ) ( not ( = ?AUTO_5185 ?AUTO_5186 ) ) ( not ( = ?AUTO_5185 ?AUTO_5188 ) ) ( not ( = ?AUTO_5187 ?AUTO_5186 ) ) ( not ( = ?AUTO_5187 ?AUTO_5188 ) ) ( not ( = ?AUTO_5189 ?AUTO_5186 ) ) ( not ( = ?AUTO_5189 ?AUTO_5188 ) ) ( not ( = ?AUTO_5186 ?AUTO_5188 ) ) ( ON ?AUTO_5186 ?AUTO_5189 ) ( not ( = ?AUTO_5184 ?AUTO_5190 ) ) ( not ( = ?AUTO_5185 ?AUTO_5190 ) ) ( not ( = ?AUTO_5187 ?AUTO_5190 ) ) ( not ( = ?AUTO_5189 ?AUTO_5190 ) ) ( not ( = ?AUTO_5188 ?AUTO_5190 ) ) ( not ( = ?AUTO_5186 ?AUTO_5190 ) ) ( ON ?AUTO_5190 ?AUTO_5186 ) ( CLEAR ?AUTO_5190 ) ( ON ?AUTO_5188 ?AUTO_5185 ) ( CLEAR ?AUTO_5188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5188 ?AUTO_5185 )
      ( MAKE-ON ?AUTO_5184 ?AUTO_5185 )
      ( MAKE-ON-VERIFY ?AUTO_5184 ?AUTO_5185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2539 - BLOCK
      ?AUTO_2540 - BLOCK
    )
    :vars
    (
      ?AUTO_2545 - BLOCK
      ?AUTO_2543 - BLOCK
      ?AUTO_2546 - BLOCK
      ?AUTO_2541 - BLOCK
      ?AUTO_2544 - BLOCK
      ?AUTO_2542 - BLOCK
      ?AUTO_2547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2539 ?AUTO_2540 ) ) ( ON ?AUTO_2539 ?AUTO_2545 ) ( not ( = ?AUTO_2539 ?AUTO_2545 ) ) ( not ( = ?AUTO_2540 ?AUTO_2545 ) ) ( not ( = ?AUTO_2539 ?AUTO_2543 ) ) ( not ( = ?AUTO_2540 ?AUTO_2543 ) ) ( not ( = ?AUTO_2545 ?AUTO_2543 ) ) ( ON ?AUTO_2543 ?AUTO_2539 ) ( CLEAR ?AUTO_2546 ) ( not ( = ?AUTO_2539 ?AUTO_2541 ) ) ( not ( = ?AUTO_2539 ?AUTO_2546 ) ) ( not ( = ?AUTO_2540 ?AUTO_2541 ) ) ( not ( = ?AUTO_2540 ?AUTO_2546 ) ) ( not ( = ?AUTO_2545 ?AUTO_2541 ) ) ( not ( = ?AUTO_2545 ?AUTO_2546 ) ) ( not ( = ?AUTO_2543 ?AUTO_2541 ) ) ( not ( = ?AUTO_2543 ?AUTO_2546 ) ) ( not ( = ?AUTO_2541 ?AUTO_2546 ) ) ( not ( = ?AUTO_2539 ?AUTO_2544 ) ) ( not ( = ?AUTO_2540 ?AUTO_2544 ) ) ( not ( = ?AUTO_2545 ?AUTO_2544 ) ) ( not ( = ?AUTO_2543 ?AUTO_2544 ) ) ( not ( = ?AUTO_2546 ?AUTO_2544 ) ) ( not ( = ?AUTO_2541 ?AUTO_2544 ) ) ( ON ?AUTO_2544 ?AUTO_2543 ) ( ON ?AUTO_2541 ?AUTO_2544 ) ( CLEAR ?AUTO_2541 ) ( not ( = ?AUTO_2539 ?AUTO_2542 ) ) ( not ( = ?AUTO_2540 ?AUTO_2542 ) ) ( not ( = ?AUTO_2545 ?AUTO_2542 ) ) ( not ( = ?AUTO_2543 ?AUTO_2542 ) ) ( not ( = ?AUTO_2546 ?AUTO_2542 ) ) ( not ( = ?AUTO_2541 ?AUTO_2542 ) ) ( not ( = ?AUTO_2544 ?AUTO_2542 ) ) ( ON ?AUTO_2542 ?AUTO_2540 ) ( CLEAR ?AUTO_2542 ) ( HOLDING ?AUTO_2547 ) ( not ( = ?AUTO_2539 ?AUTO_2547 ) ) ( not ( = ?AUTO_2540 ?AUTO_2547 ) ) ( not ( = ?AUTO_2545 ?AUTO_2547 ) ) ( not ( = ?AUTO_2543 ?AUTO_2547 ) ) ( not ( = ?AUTO_2546 ?AUTO_2547 ) ) ( not ( = ?AUTO_2541 ?AUTO_2547 ) ) ( not ( = ?AUTO_2544 ?AUTO_2547 ) ) ( not ( = ?AUTO_2542 ?AUTO_2547 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2547 )
      ( MAKE-ON ?AUTO_2539 ?AUTO_2540 )
      ( MAKE-ON-VERIFY ?AUTO_2539 ?AUTO_2540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2548 - BLOCK
      ?AUTO_2549 - BLOCK
    )
    :vars
    (
      ?AUTO_2554 - BLOCK
      ?AUTO_2551 - BLOCK
      ?AUTO_2553 - BLOCK
      ?AUTO_2555 - BLOCK
      ?AUTO_2550 - BLOCK
      ?AUTO_2552 - BLOCK
      ?AUTO_2556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2548 ?AUTO_2549 ) ) ( ON ?AUTO_2548 ?AUTO_2554 ) ( not ( = ?AUTO_2548 ?AUTO_2554 ) ) ( not ( = ?AUTO_2549 ?AUTO_2554 ) ) ( not ( = ?AUTO_2548 ?AUTO_2551 ) ) ( not ( = ?AUTO_2549 ?AUTO_2551 ) ) ( not ( = ?AUTO_2554 ?AUTO_2551 ) ) ( ON ?AUTO_2551 ?AUTO_2548 ) ( CLEAR ?AUTO_2553 ) ( not ( = ?AUTO_2548 ?AUTO_2555 ) ) ( not ( = ?AUTO_2548 ?AUTO_2553 ) ) ( not ( = ?AUTO_2549 ?AUTO_2555 ) ) ( not ( = ?AUTO_2549 ?AUTO_2553 ) ) ( not ( = ?AUTO_2554 ?AUTO_2555 ) ) ( not ( = ?AUTO_2554 ?AUTO_2553 ) ) ( not ( = ?AUTO_2551 ?AUTO_2555 ) ) ( not ( = ?AUTO_2551 ?AUTO_2553 ) ) ( not ( = ?AUTO_2555 ?AUTO_2553 ) ) ( not ( = ?AUTO_2548 ?AUTO_2550 ) ) ( not ( = ?AUTO_2549 ?AUTO_2550 ) ) ( not ( = ?AUTO_2554 ?AUTO_2550 ) ) ( not ( = ?AUTO_2551 ?AUTO_2550 ) ) ( not ( = ?AUTO_2553 ?AUTO_2550 ) ) ( not ( = ?AUTO_2555 ?AUTO_2550 ) ) ( ON ?AUTO_2550 ?AUTO_2551 ) ( ON ?AUTO_2555 ?AUTO_2550 ) ( CLEAR ?AUTO_2555 ) ( not ( = ?AUTO_2548 ?AUTO_2552 ) ) ( not ( = ?AUTO_2549 ?AUTO_2552 ) ) ( not ( = ?AUTO_2554 ?AUTO_2552 ) ) ( not ( = ?AUTO_2551 ?AUTO_2552 ) ) ( not ( = ?AUTO_2553 ?AUTO_2552 ) ) ( not ( = ?AUTO_2555 ?AUTO_2552 ) ) ( not ( = ?AUTO_2550 ?AUTO_2552 ) ) ( ON ?AUTO_2552 ?AUTO_2549 ) ( not ( = ?AUTO_2548 ?AUTO_2556 ) ) ( not ( = ?AUTO_2549 ?AUTO_2556 ) ) ( not ( = ?AUTO_2554 ?AUTO_2556 ) ) ( not ( = ?AUTO_2551 ?AUTO_2556 ) ) ( not ( = ?AUTO_2553 ?AUTO_2556 ) ) ( not ( = ?AUTO_2555 ?AUTO_2556 ) ) ( not ( = ?AUTO_2550 ?AUTO_2556 ) ) ( not ( = ?AUTO_2552 ?AUTO_2556 ) ) ( ON ?AUTO_2556 ?AUTO_2552 ) ( CLEAR ?AUTO_2556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2556 ?AUTO_2552 )
      ( MAKE-ON ?AUTO_2548 ?AUTO_2549 )
      ( MAKE-ON-VERIFY ?AUTO_2548 ?AUTO_2549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2557 - BLOCK
      ?AUTO_2558 - BLOCK
    )
    :vars
    (
      ?AUTO_2564 - BLOCK
      ?AUTO_2561 - BLOCK
      ?AUTO_2562 - BLOCK
      ?AUTO_2563 - BLOCK
      ?AUTO_2560 - BLOCK
      ?AUTO_2559 - BLOCK
      ?AUTO_2565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2557 ?AUTO_2558 ) ) ( ON ?AUTO_2557 ?AUTO_2564 ) ( not ( = ?AUTO_2557 ?AUTO_2564 ) ) ( not ( = ?AUTO_2558 ?AUTO_2564 ) ) ( not ( = ?AUTO_2557 ?AUTO_2561 ) ) ( not ( = ?AUTO_2558 ?AUTO_2561 ) ) ( not ( = ?AUTO_2564 ?AUTO_2561 ) ) ( ON ?AUTO_2561 ?AUTO_2557 ) ( not ( = ?AUTO_2557 ?AUTO_2562 ) ) ( not ( = ?AUTO_2557 ?AUTO_2563 ) ) ( not ( = ?AUTO_2558 ?AUTO_2562 ) ) ( not ( = ?AUTO_2558 ?AUTO_2563 ) ) ( not ( = ?AUTO_2564 ?AUTO_2562 ) ) ( not ( = ?AUTO_2564 ?AUTO_2563 ) ) ( not ( = ?AUTO_2561 ?AUTO_2562 ) ) ( not ( = ?AUTO_2561 ?AUTO_2563 ) ) ( not ( = ?AUTO_2562 ?AUTO_2563 ) ) ( not ( = ?AUTO_2557 ?AUTO_2560 ) ) ( not ( = ?AUTO_2558 ?AUTO_2560 ) ) ( not ( = ?AUTO_2564 ?AUTO_2560 ) ) ( not ( = ?AUTO_2561 ?AUTO_2560 ) ) ( not ( = ?AUTO_2563 ?AUTO_2560 ) ) ( not ( = ?AUTO_2562 ?AUTO_2560 ) ) ( ON ?AUTO_2560 ?AUTO_2561 ) ( ON ?AUTO_2562 ?AUTO_2560 ) ( CLEAR ?AUTO_2562 ) ( not ( = ?AUTO_2557 ?AUTO_2559 ) ) ( not ( = ?AUTO_2558 ?AUTO_2559 ) ) ( not ( = ?AUTO_2564 ?AUTO_2559 ) ) ( not ( = ?AUTO_2561 ?AUTO_2559 ) ) ( not ( = ?AUTO_2563 ?AUTO_2559 ) ) ( not ( = ?AUTO_2562 ?AUTO_2559 ) ) ( not ( = ?AUTO_2560 ?AUTO_2559 ) ) ( ON ?AUTO_2559 ?AUTO_2558 ) ( not ( = ?AUTO_2557 ?AUTO_2565 ) ) ( not ( = ?AUTO_2558 ?AUTO_2565 ) ) ( not ( = ?AUTO_2564 ?AUTO_2565 ) ) ( not ( = ?AUTO_2561 ?AUTO_2565 ) ) ( not ( = ?AUTO_2563 ?AUTO_2565 ) ) ( not ( = ?AUTO_2562 ?AUTO_2565 ) ) ( not ( = ?AUTO_2560 ?AUTO_2565 ) ) ( not ( = ?AUTO_2559 ?AUTO_2565 ) ) ( ON ?AUTO_2565 ?AUTO_2559 ) ( CLEAR ?AUTO_2565 ) ( HOLDING ?AUTO_2563 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2563 )
      ( MAKE-ON ?AUTO_2557 ?AUTO_2558 )
      ( MAKE-ON-VERIFY ?AUTO_2557 ?AUTO_2558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2566 - BLOCK
      ?AUTO_2567 - BLOCK
    )
    :vars
    (
      ?AUTO_2572 - BLOCK
      ?AUTO_2573 - BLOCK
      ?AUTO_2569 - BLOCK
      ?AUTO_2571 - BLOCK
      ?AUTO_2570 - BLOCK
      ?AUTO_2574 - BLOCK
      ?AUTO_2568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2566 ?AUTO_2567 ) ) ( ON ?AUTO_2566 ?AUTO_2572 ) ( not ( = ?AUTO_2566 ?AUTO_2572 ) ) ( not ( = ?AUTO_2567 ?AUTO_2572 ) ) ( not ( = ?AUTO_2566 ?AUTO_2573 ) ) ( not ( = ?AUTO_2567 ?AUTO_2573 ) ) ( not ( = ?AUTO_2572 ?AUTO_2573 ) ) ( ON ?AUTO_2573 ?AUTO_2566 ) ( not ( = ?AUTO_2566 ?AUTO_2569 ) ) ( not ( = ?AUTO_2566 ?AUTO_2571 ) ) ( not ( = ?AUTO_2567 ?AUTO_2569 ) ) ( not ( = ?AUTO_2567 ?AUTO_2571 ) ) ( not ( = ?AUTO_2572 ?AUTO_2569 ) ) ( not ( = ?AUTO_2572 ?AUTO_2571 ) ) ( not ( = ?AUTO_2573 ?AUTO_2569 ) ) ( not ( = ?AUTO_2573 ?AUTO_2571 ) ) ( not ( = ?AUTO_2569 ?AUTO_2571 ) ) ( not ( = ?AUTO_2566 ?AUTO_2570 ) ) ( not ( = ?AUTO_2567 ?AUTO_2570 ) ) ( not ( = ?AUTO_2572 ?AUTO_2570 ) ) ( not ( = ?AUTO_2573 ?AUTO_2570 ) ) ( not ( = ?AUTO_2571 ?AUTO_2570 ) ) ( not ( = ?AUTO_2569 ?AUTO_2570 ) ) ( ON ?AUTO_2570 ?AUTO_2573 ) ( ON ?AUTO_2569 ?AUTO_2570 ) ( CLEAR ?AUTO_2569 ) ( not ( = ?AUTO_2566 ?AUTO_2574 ) ) ( not ( = ?AUTO_2567 ?AUTO_2574 ) ) ( not ( = ?AUTO_2572 ?AUTO_2574 ) ) ( not ( = ?AUTO_2573 ?AUTO_2574 ) ) ( not ( = ?AUTO_2571 ?AUTO_2574 ) ) ( not ( = ?AUTO_2569 ?AUTO_2574 ) ) ( not ( = ?AUTO_2570 ?AUTO_2574 ) ) ( ON ?AUTO_2574 ?AUTO_2567 ) ( not ( = ?AUTO_2566 ?AUTO_2568 ) ) ( not ( = ?AUTO_2567 ?AUTO_2568 ) ) ( not ( = ?AUTO_2572 ?AUTO_2568 ) ) ( not ( = ?AUTO_2573 ?AUTO_2568 ) ) ( not ( = ?AUTO_2571 ?AUTO_2568 ) ) ( not ( = ?AUTO_2569 ?AUTO_2568 ) ) ( not ( = ?AUTO_2570 ?AUTO_2568 ) ) ( not ( = ?AUTO_2574 ?AUTO_2568 ) ) ( ON ?AUTO_2568 ?AUTO_2574 ) ( ON ?AUTO_2571 ?AUTO_2568 ) ( CLEAR ?AUTO_2571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2571 ?AUTO_2568 )
      ( MAKE-ON ?AUTO_2566 ?AUTO_2567 )
      ( MAKE-ON-VERIFY ?AUTO_2566 ?AUTO_2567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5346 - BLOCK
      ?AUTO_5347 - BLOCK
    )
    :vars
    (
      ?AUTO_5350 - BLOCK
      ?AUTO_5348 - BLOCK
      ?AUTO_5349 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5347 ) ( not ( = ?AUTO_5346 ?AUTO_5347 ) ) ( ON-TABLE ?AUTO_5346 ) ( not ( = ?AUTO_5346 ?AUTO_5350 ) ) ( not ( = ?AUTO_5346 ?AUTO_5348 ) ) ( not ( = ?AUTO_5347 ?AUTO_5350 ) ) ( not ( = ?AUTO_5347 ?AUTO_5348 ) ) ( not ( = ?AUTO_5350 ?AUTO_5348 ) ) ( ON ?AUTO_5350 ?AUTO_5346 ) ( not ( = ?AUTO_5346 ?AUTO_5349 ) ) ( not ( = ?AUTO_5347 ?AUTO_5349 ) ) ( not ( = ?AUTO_5350 ?AUTO_5349 ) ) ( not ( = ?AUTO_5348 ?AUTO_5349 ) ) ( ON ?AUTO_5348 ?AUTO_5350 ) ( ON ?AUTO_5349 ?AUTO_5348 ) ( CLEAR ?AUTO_5349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5349 ?AUTO_5348 )
      ( MAKE-ON ?AUTO_5346 ?AUTO_5347 )
      ( MAKE-ON-VERIFY ?AUTO_5346 ?AUTO_5347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2613 - BLOCK
      ?AUTO_2614 - BLOCK
    )
    :vars
    (
      ?AUTO_2619 - BLOCK
      ?AUTO_2616 - BLOCK
      ?AUTO_2615 - BLOCK
      ?AUTO_2618 - BLOCK
      ?AUTO_2617 - BLOCK
      ?AUTO_2620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2614 ) ( not ( = ?AUTO_2613 ?AUTO_2614 ) ) ( ON-TABLE ?AUTO_2613 ) ( not ( = ?AUTO_2613 ?AUTO_2619 ) ) ( not ( = ?AUTO_2613 ?AUTO_2616 ) ) ( not ( = ?AUTO_2614 ?AUTO_2619 ) ) ( not ( = ?AUTO_2614 ?AUTO_2616 ) ) ( not ( = ?AUTO_2619 ?AUTO_2616 ) ) ( ON ?AUTO_2619 ?AUTO_2613 ) ( not ( = ?AUTO_2613 ?AUTO_2615 ) ) ( not ( = ?AUTO_2614 ?AUTO_2615 ) ) ( not ( = ?AUTO_2616 ?AUTO_2615 ) ) ( not ( = ?AUTO_2619 ?AUTO_2615 ) ) ( ON ?AUTO_2615 ?AUTO_2619 ) ( CLEAR ?AUTO_2618 ) ( not ( = ?AUTO_2613 ?AUTO_2617 ) ) ( not ( = ?AUTO_2613 ?AUTO_2618 ) ) ( not ( = ?AUTO_2614 ?AUTO_2617 ) ) ( not ( = ?AUTO_2614 ?AUTO_2618 ) ) ( not ( = ?AUTO_2616 ?AUTO_2617 ) ) ( not ( = ?AUTO_2616 ?AUTO_2618 ) ) ( not ( = ?AUTO_2619 ?AUTO_2617 ) ) ( not ( = ?AUTO_2619 ?AUTO_2618 ) ) ( not ( = ?AUTO_2615 ?AUTO_2617 ) ) ( not ( = ?AUTO_2615 ?AUTO_2618 ) ) ( not ( = ?AUTO_2617 ?AUTO_2618 ) ) ( ON ?AUTO_2617 ?AUTO_2615 ) ( CLEAR ?AUTO_2617 ) ( HOLDING ?AUTO_2616 ) ( CLEAR ?AUTO_2620 ) ( not ( = ?AUTO_2613 ?AUTO_2620 ) ) ( not ( = ?AUTO_2614 ?AUTO_2620 ) ) ( not ( = ?AUTO_2619 ?AUTO_2620 ) ) ( not ( = ?AUTO_2616 ?AUTO_2620 ) ) ( not ( = ?AUTO_2615 ?AUTO_2620 ) ) ( not ( = ?AUTO_2618 ?AUTO_2620 ) ) ( not ( = ?AUTO_2617 ?AUTO_2620 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2616 ?AUTO_2620 )
      ( MAKE-ON ?AUTO_2613 ?AUTO_2614 )
      ( MAKE-ON-VERIFY ?AUTO_2613 ?AUTO_2614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2660 - BLOCK
      ?AUTO_2661 - BLOCK
    )
    :vars
    (
      ?AUTO_2662 - BLOCK
      ?AUTO_2667 - BLOCK
      ?AUTO_2665 - BLOCK
      ?AUTO_2666 - BLOCK
      ?AUTO_2664 - BLOCK
      ?AUTO_2663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2661 ) ( not ( = ?AUTO_2660 ?AUTO_2661 ) ) ( ON-TABLE ?AUTO_2660 ) ( not ( = ?AUTO_2660 ?AUTO_2662 ) ) ( not ( = ?AUTO_2660 ?AUTO_2667 ) ) ( not ( = ?AUTO_2661 ?AUTO_2662 ) ) ( not ( = ?AUTO_2661 ?AUTO_2667 ) ) ( not ( = ?AUTO_2662 ?AUTO_2667 ) ) ( ON ?AUTO_2662 ?AUTO_2660 ) ( not ( = ?AUTO_2660 ?AUTO_2665 ) ) ( not ( = ?AUTO_2661 ?AUTO_2665 ) ) ( not ( = ?AUTO_2667 ?AUTO_2665 ) ) ( not ( = ?AUTO_2662 ?AUTO_2665 ) ) ( ON ?AUTO_2665 ?AUTO_2662 ) ( not ( = ?AUTO_2660 ?AUTO_2666 ) ) ( not ( = ?AUTO_2660 ?AUTO_2664 ) ) ( not ( = ?AUTO_2661 ?AUTO_2666 ) ) ( not ( = ?AUTO_2661 ?AUTO_2664 ) ) ( not ( = ?AUTO_2667 ?AUTO_2666 ) ) ( not ( = ?AUTO_2667 ?AUTO_2664 ) ) ( not ( = ?AUTO_2662 ?AUTO_2666 ) ) ( not ( = ?AUTO_2662 ?AUTO_2664 ) ) ( not ( = ?AUTO_2665 ?AUTO_2666 ) ) ( not ( = ?AUTO_2665 ?AUTO_2664 ) ) ( not ( = ?AUTO_2666 ?AUTO_2664 ) ) ( ON ?AUTO_2666 ?AUTO_2665 ) ( CLEAR ?AUTO_2663 ) ( not ( = ?AUTO_2660 ?AUTO_2663 ) ) ( not ( = ?AUTO_2661 ?AUTO_2663 ) ) ( not ( = ?AUTO_2662 ?AUTO_2663 ) ) ( not ( = ?AUTO_2667 ?AUTO_2663 ) ) ( not ( = ?AUTO_2665 ?AUTO_2663 ) ) ( not ( = ?AUTO_2664 ?AUTO_2663 ) ) ( not ( = ?AUTO_2666 ?AUTO_2663 ) ) ( ON ?AUTO_2667 ?AUTO_2666 ) ( CLEAR ?AUTO_2667 ) ( HOLDING ?AUTO_2664 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2664 )
      ( MAKE-ON ?AUTO_2660 ?AUTO_2661 )
      ( MAKE-ON-VERIFY ?AUTO_2660 ?AUTO_2661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2668 - BLOCK
      ?AUTO_2669 - BLOCK
    )
    :vars
    (
      ?AUTO_2671 - BLOCK
      ?AUTO_2674 - BLOCK
      ?AUTO_2672 - BLOCK
      ?AUTO_2670 - BLOCK
      ?AUTO_2673 - BLOCK
      ?AUTO_2675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2669 ) ( not ( = ?AUTO_2668 ?AUTO_2669 ) ) ( ON-TABLE ?AUTO_2668 ) ( not ( = ?AUTO_2668 ?AUTO_2671 ) ) ( not ( = ?AUTO_2668 ?AUTO_2674 ) ) ( not ( = ?AUTO_2669 ?AUTO_2671 ) ) ( not ( = ?AUTO_2669 ?AUTO_2674 ) ) ( not ( = ?AUTO_2671 ?AUTO_2674 ) ) ( ON ?AUTO_2671 ?AUTO_2668 ) ( not ( = ?AUTO_2668 ?AUTO_2672 ) ) ( not ( = ?AUTO_2669 ?AUTO_2672 ) ) ( not ( = ?AUTO_2674 ?AUTO_2672 ) ) ( not ( = ?AUTO_2671 ?AUTO_2672 ) ) ( ON ?AUTO_2672 ?AUTO_2671 ) ( not ( = ?AUTO_2668 ?AUTO_2670 ) ) ( not ( = ?AUTO_2668 ?AUTO_2673 ) ) ( not ( = ?AUTO_2669 ?AUTO_2670 ) ) ( not ( = ?AUTO_2669 ?AUTO_2673 ) ) ( not ( = ?AUTO_2674 ?AUTO_2670 ) ) ( not ( = ?AUTO_2674 ?AUTO_2673 ) ) ( not ( = ?AUTO_2671 ?AUTO_2670 ) ) ( not ( = ?AUTO_2671 ?AUTO_2673 ) ) ( not ( = ?AUTO_2672 ?AUTO_2670 ) ) ( not ( = ?AUTO_2672 ?AUTO_2673 ) ) ( not ( = ?AUTO_2670 ?AUTO_2673 ) ) ( ON ?AUTO_2670 ?AUTO_2672 ) ( not ( = ?AUTO_2668 ?AUTO_2675 ) ) ( not ( = ?AUTO_2669 ?AUTO_2675 ) ) ( not ( = ?AUTO_2671 ?AUTO_2675 ) ) ( not ( = ?AUTO_2674 ?AUTO_2675 ) ) ( not ( = ?AUTO_2672 ?AUTO_2675 ) ) ( not ( = ?AUTO_2673 ?AUTO_2675 ) ) ( not ( = ?AUTO_2670 ?AUTO_2675 ) ) ( ON ?AUTO_2674 ?AUTO_2670 ) ( CLEAR ?AUTO_2674 ) ( ON ?AUTO_2673 ?AUTO_2675 ) ( CLEAR ?AUTO_2673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2673 ?AUTO_2675 )
      ( MAKE-ON ?AUTO_2668 ?AUTO_2669 )
      ( MAKE-ON-VERIFY ?AUTO_2668 ?AUTO_2669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2676 - BLOCK
      ?AUTO_2677 - BLOCK
    )
    :vars
    (
      ?AUTO_2682 - BLOCK
      ?AUTO_2680 - BLOCK
      ?AUTO_2681 - BLOCK
      ?AUTO_2678 - BLOCK
      ?AUTO_2679 - BLOCK
      ?AUTO_2683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2676 ?AUTO_2677 ) ) ( ON-TABLE ?AUTO_2676 ) ( not ( = ?AUTO_2676 ?AUTO_2682 ) ) ( not ( = ?AUTO_2676 ?AUTO_2680 ) ) ( not ( = ?AUTO_2677 ?AUTO_2682 ) ) ( not ( = ?AUTO_2677 ?AUTO_2680 ) ) ( not ( = ?AUTO_2682 ?AUTO_2680 ) ) ( ON ?AUTO_2682 ?AUTO_2676 ) ( not ( = ?AUTO_2676 ?AUTO_2681 ) ) ( not ( = ?AUTO_2677 ?AUTO_2681 ) ) ( not ( = ?AUTO_2680 ?AUTO_2681 ) ) ( not ( = ?AUTO_2682 ?AUTO_2681 ) ) ( ON ?AUTO_2681 ?AUTO_2682 ) ( not ( = ?AUTO_2676 ?AUTO_2678 ) ) ( not ( = ?AUTO_2676 ?AUTO_2679 ) ) ( not ( = ?AUTO_2677 ?AUTO_2678 ) ) ( not ( = ?AUTO_2677 ?AUTO_2679 ) ) ( not ( = ?AUTO_2680 ?AUTO_2678 ) ) ( not ( = ?AUTO_2680 ?AUTO_2679 ) ) ( not ( = ?AUTO_2682 ?AUTO_2678 ) ) ( not ( = ?AUTO_2682 ?AUTO_2679 ) ) ( not ( = ?AUTO_2681 ?AUTO_2678 ) ) ( not ( = ?AUTO_2681 ?AUTO_2679 ) ) ( not ( = ?AUTO_2678 ?AUTO_2679 ) ) ( ON ?AUTO_2678 ?AUTO_2681 ) ( not ( = ?AUTO_2676 ?AUTO_2683 ) ) ( not ( = ?AUTO_2677 ?AUTO_2683 ) ) ( not ( = ?AUTO_2682 ?AUTO_2683 ) ) ( not ( = ?AUTO_2680 ?AUTO_2683 ) ) ( not ( = ?AUTO_2681 ?AUTO_2683 ) ) ( not ( = ?AUTO_2679 ?AUTO_2683 ) ) ( not ( = ?AUTO_2678 ?AUTO_2683 ) ) ( ON ?AUTO_2680 ?AUTO_2678 ) ( CLEAR ?AUTO_2680 ) ( ON ?AUTO_2679 ?AUTO_2683 ) ( CLEAR ?AUTO_2679 ) ( HOLDING ?AUTO_2677 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2677 )
      ( MAKE-ON ?AUTO_2676 ?AUTO_2677 )
      ( MAKE-ON-VERIFY ?AUTO_2676 ?AUTO_2677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2684 - BLOCK
      ?AUTO_2685 - BLOCK
    )
    :vars
    (
      ?AUTO_2687 - BLOCK
      ?AUTO_2691 - BLOCK
      ?AUTO_2689 - BLOCK
      ?AUTO_2688 - BLOCK
      ?AUTO_2690 - BLOCK
      ?AUTO_2686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2684 ?AUTO_2685 ) ) ( ON-TABLE ?AUTO_2684 ) ( not ( = ?AUTO_2684 ?AUTO_2687 ) ) ( not ( = ?AUTO_2684 ?AUTO_2691 ) ) ( not ( = ?AUTO_2685 ?AUTO_2687 ) ) ( not ( = ?AUTO_2685 ?AUTO_2691 ) ) ( not ( = ?AUTO_2687 ?AUTO_2691 ) ) ( ON ?AUTO_2687 ?AUTO_2684 ) ( not ( = ?AUTO_2684 ?AUTO_2689 ) ) ( not ( = ?AUTO_2685 ?AUTO_2689 ) ) ( not ( = ?AUTO_2691 ?AUTO_2689 ) ) ( not ( = ?AUTO_2687 ?AUTO_2689 ) ) ( ON ?AUTO_2689 ?AUTO_2687 ) ( not ( = ?AUTO_2684 ?AUTO_2688 ) ) ( not ( = ?AUTO_2684 ?AUTO_2690 ) ) ( not ( = ?AUTO_2685 ?AUTO_2688 ) ) ( not ( = ?AUTO_2685 ?AUTO_2690 ) ) ( not ( = ?AUTO_2691 ?AUTO_2688 ) ) ( not ( = ?AUTO_2691 ?AUTO_2690 ) ) ( not ( = ?AUTO_2687 ?AUTO_2688 ) ) ( not ( = ?AUTO_2687 ?AUTO_2690 ) ) ( not ( = ?AUTO_2689 ?AUTO_2688 ) ) ( not ( = ?AUTO_2689 ?AUTO_2690 ) ) ( not ( = ?AUTO_2688 ?AUTO_2690 ) ) ( ON ?AUTO_2688 ?AUTO_2689 ) ( not ( = ?AUTO_2684 ?AUTO_2686 ) ) ( not ( = ?AUTO_2685 ?AUTO_2686 ) ) ( not ( = ?AUTO_2687 ?AUTO_2686 ) ) ( not ( = ?AUTO_2691 ?AUTO_2686 ) ) ( not ( = ?AUTO_2689 ?AUTO_2686 ) ) ( not ( = ?AUTO_2690 ?AUTO_2686 ) ) ( not ( = ?AUTO_2688 ?AUTO_2686 ) ) ( ON ?AUTO_2691 ?AUTO_2688 ) ( CLEAR ?AUTO_2691 ) ( ON ?AUTO_2690 ?AUTO_2686 ) ( ON ?AUTO_2685 ?AUTO_2690 ) ( CLEAR ?AUTO_2685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2685 ?AUTO_2690 )
      ( MAKE-ON ?AUTO_2684 ?AUTO_2685 )
      ( MAKE-ON-VERIFY ?AUTO_2684 ?AUTO_2685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2795 - BLOCK
      ?AUTO_2796 - BLOCK
    )
    :vars
    (
      ?AUTO_2798 - BLOCK
      ?AUTO_2797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2795 ?AUTO_2796 ) ) ( ON-TABLE ?AUTO_2795 ) ( not ( = ?AUTO_2795 ?AUTO_2798 ) ) ( not ( = ?AUTO_2796 ?AUTO_2798 ) ) ( not ( = ?AUTO_2795 ?AUTO_2797 ) ) ( not ( = ?AUTO_2796 ?AUTO_2797 ) ) ( not ( = ?AUTO_2798 ?AUTO_2797 ) ) ( ON ?AUTO_2797 ?AUTO_2796 ) ( CLEAR ?AUTO_2797 ) ( HOLDING ?AUTO_2798 ) ( CLEAR ?AUTO_2795 ) )
    :subtasks
    ( ( !STACK ?AUTO_2798 ?AUTO_2795 )
      ( MAKE-ON ?AUTO_2795 ?AUTO_2796 )
      ( MAKE-ON-VERIFY ?AUTO_2795 ?AUTO_2796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2803 - BLOCK
      ?AUTO_2804 - BLOCK
    )
    :vars
    (
      ?AUTO_2805 - BLOCK
      ?AUTO_2806 - BLOCK
      ?AUTO_2807 - BLOCK
      ?AUTO_2808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2803 ?AUTO_2804 ) ) ( ON-TABLE ?AUTO_2803 ) ( not ( = ?AUTO_2803 ?AUTO_2805 ) ) ( not ( = ?AUTO_2804 ?AUTO_2805 ) ) ( not ( = ?AUTO_2803 ?AUTO_2806 ) ) ( not ( = ?AUTO_2804 ?AUTO_2806 ) ) ( not ( = ?AUTO_2805 ?AUTO_2806 ) ) ( ON ?AUTO_2806 ?AUTO_2804 ) ( CLEAR ?AUTO_2803 ) ( ON ?AUTO_2805 ?AUTO_2806 ) ( CLEAR ?AUTO_2805 ) ( HOLDING ?AUTO_2807 ) ( CLEAR ?AUTO_2808 ) ( not ( = ?AUTO_2803 ?AUTO_2807 ) ) ( not ( = ?AUTO_2803 ?AUTO_2808 ) ) ( not ( = ?AUTO_2804 ?AUTO_2807 ) ) ( not ( = ?AUTO_2804 ?AUTO_2808 ) ) ( not ( = ?AUTO_2805 ?AUTO_2807 ) ) ( not ( = ?AUTO_2805 ?AUTO_2808 ) ) ( not ( = ?AUTO_2806 ?AUTO_2807 ) ) ( not ( = ?AUTO_2806 ?AUTO_2808 ) ) ( not ( = ?AUTO_2807 ?AUTO_2808 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2807 ?AUTO_2808 )
      ( MAKE-ON ?AUTO_2803 ?AUTO_2804 )
      ( MAKE-ON-VERIFY ?AUTO_2803 ?AUTO_2804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2809 - BLOCK
      ?AUTO_2810 - BLOCK
    )
    :vars
    (
      ?AUTO_2812 - BLOCK
      ?AUTO_2811 - BLOCK
      ?AUTO_2813 - BLOCK
      ?AUTO_2814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2809 ?AUTO_2810 ) ) ( ON-TABLE ?AUTO_2809 ) ( not ( = ?AUTO_2809 ?AUTO_2812 ) ) ( not ( = ?AUTO_2810 ?AUTO_2812 ) ) ( not ( = ?AUTO_2809 ?AUTO_2811 ) ) ( not ( = ?AUTO_2810 ?AUTO_2811 ) ) ( not ( = ?AUTO_2812 ?AUTO_2811 ) ) ( ON ?AUTO_2811 ?AUTO_2810 ) ( ON ?AUTO_2812 ?AUTO_2811 ) ( CLEAR ?AUTO_2812 ) ( CLEAR ?AUTO_2813 ) ( not ( = ?AUTO_2809 ?AUTO_2814 ) ) ( not ( = ?AUTO_2809 ?AUTO_2813 ) ) ( not ( = ?AUTO_2810 ?AUTO_2814 ) ) ( not ( = ?AUTO_2810 ?AUTO_2813 ) ) ( not ( = ?AUTO_2812 ?AUTO_2814 ) ) ( not ( = ?AUTO_2812 ?AUTO_2813 ) ) ( not ( = ?AUTO_2811 ?AUTO_2814 ) ) ( not ( = ?AUTO_2811 ?AUTO_2813 ) ) ( not ( = ?AUTO_2814 ?AUTO_2813 ) ) ( ON ?AUTO_2814 ?AUTO_2809 ) ( CLEAR ?AUTO_2814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2814 ?AUTO_2809 )
      ( MAKE-ON ?AUTO_2809 ?AUTO_2810 )
      ( MAKE-ON-VERIFY ?AUTO_2809 ?AUTO_2810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2815 - BLOCK
      ?AUTO_2816 - BLOCK
    )
    :vars
    (
      ?AUTO_2818 - BLOCK
      ?AUTO_2817 - BLOCK
      ?AUTO_2819 - BLOCK
      ?AUTO_2820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2815 ?AUTO_2816 ) ) ( ON-TABLE ?AUTO_2815 ) ( not ( = ?AUTO_2815 ?AUTO_2818 ) ) ( not ( = ?AUTO_2816 ?AUTO_2818 ) ) ( not ( = ?AUTO_2815 ?AUTO_2817 ) ) ( not ( = ?AUTO_2816 ?AUTO_2817 ) ) ( not ( = ?AUTO_2818 ?AUTO_2817 ) ) ( ON ?AUTO_2817 ?AUTO_2816 ) ( ON ?AUTO_2818 ?AUTO_2817 ) ( CLEAR ?AUTO_2818 ) ( not ( = ?AUTO_2815 ?AUTO_2819 ) ) ( not ( = ?AUTO_2815 ?AUTO_2820 ) ) ( not ( = ?AUTO_2816 ?AUTO_2819 ) ) ( not ( = ?AUTO_2816 ?AUTO_2820 ) ) ( not ( = ?AUTO_2818 ?AUTO_2819 ) ) ( not ( = ?AUTO_2818 ?AUTO_2820 ) ) ( not ( = ?AUTO_2817 ?AUTO_2819 ) ) ( not ( = ?AUTO_2817 ?AUTO_2820 ) ) ( not ( = ?AUTO_2819 ?AUTO_2820 ) ) ( ON ?AUTO_2819 ?AUTO_2815 ) ( CLEAR ?AUTO_2819 ) ( HOLDING ?AUTO_2820 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2820 )
      ( MAKE-ON ?AUTO_2815 ?AUTO_2816 )
      ( MAKE-ON-VERIFY ?AUTO_2815 ?AUTO_2816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2988 - BLOCK
      ?AUTO_2989 - BLOCK
    )
    :vars
    (
      ?AUTO_2991 - BLOCK
      ?AUTO_2990 - BLOCK
      ?AUTO_2992 - BLOCK
      ?AUTO_2993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2988 ?AUTO_2989 ) ) ( ON ?AUTO_2988 ?AUTO_2991 ) ( not ( = ?AUTO_2988 ?AUTO_2991 ) ) ( not ( = ?AUTO_2989 ?AUTO_2991 ) ) ( not ( = ?AUTO_2988 ?AUTO_2990 ) ) ( not ( = ?AUTO_2989 ?AUTO_2990 ) ) ( not ( = ?AUTO_2991 ?AUTO_2990 ) ) ( ON ?AUTO_2990 ?AUTO_2988 ) ( ON ?AUTO_2989 ?AUTO_2990 ) ( CLEAR ?AUTO_2989 ) ( HOLDING ?AUTO_2992 ) ( CLEAR ?AUTO_2993 ) ( not ( = ?AUTO_2988 ?AUTO_2992 ) ) ( not ( = ?AUTO_2988 ?AUTO_2993 ) ) ( not ( = ?AUTO_2989 ?AUTO_2992 ) ) ( not ( = ?AUTO_2989 ?AUTO_2993 ) ) ( not ( = ?AUTO_2991 ?AUTO_2992 ) ) ( not ( = ?AUTO_2991 ?AUTO_2993 ) ) ( not ( = ?AUTO_2990 ?AUTO_2992 ) ) ( not ( = ?AUTO_2990 ?AUTO_2993 ) ) ( not ( = ?AUTO_2992 ?AUTO_2993 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2992 ?AUTO_2993 )
      ( MAKE-ON ?AUTO_2988 ?AUTO_2989 )
      ( MAKE-ON-VERIFY ?AUTO_2988 ?AUTO_2989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3128 - BLOCK
      ?AUTO_3129 - BLOCK
    )
    :vars
    (
      ?AUTO_3132 - BLOCK
      ?AUTO_3130 - BLOCK
      ?AUTO_3131 - BLOCK
      ?AUTO_3133 - BLOCK
      ?AUTO_3134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3128 ?AUTO_3129 ) ) ( ON-TABLE ?AUTO_3128 ) ( CLEAR ?AUTO_3128 ) ( not ( = ?AUTO_3128 ?AUTO_3132 ) ) ( not ( = ?AUTO_3129 ?AUTO_3132 ) ) ( ON ?AUTO_3132 ?AUTO_3129 ) ( not ( = ?AUTO_3128 ?AUTO_3130 ) ) ( not ( = ?AUTO_3129 ?AUTO_3130 ) ) ( not ( = ?AUTO_3132 ?AUTO_3130 ) ) ( ON ?AUTO_3130 ?AUTO_3132 ) ( not ( = ?AUTO_3128 ?AUTO_3131 ) ) ( not ( = ?AUTO_3129 ?AUTO_3131 ) ) ( not ( = ?AUTO_3132 ?AUTO_3131 ) ) ( not ( = ?AUTO_3130 ?AUTO_3131 ) ) ( ON ?AUTO_3131 ?AUTO_3130 ) ( CLEAR ?AUTO_3131 ) ( HOLDING ?AUTO_3133 ) ( CLEAR ?AUTO_3134 ) ( not ( = ?AUTO_3128 ?AUTO_3133 ) ) ( not ( = ?AUTO_3128 ?AUTO_3134 ) ) ( not ( = ?AUTO_3129 ?AUTO_3133 ) ) ( not ( = ?AUTO_3129 ?AUTO_3134 ) ) ( not ( = ?AUTO_3132 ?AUTO_3133 ) ) ( not ( = ?AUTO_3132 ?AUTO_3134 ) ) ( not ( = ?AUTO_3130 ?AUTO_3133 ) ) ( not ( = ?AUTO_3130 ?AUTO_3134 ) ) ( not ( = ?AUTO_3131 ?AUTO_3133 ) ) ( not ( = ?AUTO_3131 ?AUTO_3134 ) ) ( not ( = ?AUTO_3133 ?AUTO_3134 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3133 ?AUTO_3134 )
      ( MAKE-ON ?AUTO_3128 ?AUTO_3129 )
      ( MAKE-ON-VERIFY ?AUTO_3128 ?AUTO_3129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3145 - BLOCK
      ?AUTO_3146 - BLOCK
    )
    :vars
    (
      ?AUTO_3147 - BLOCK
      ?AUTO_3148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3145 ?AUTO_3146 ) ) ( not ( = ?AUTO_3145 ?AUTO_3147 ) ) ( not ( = ?AUTO_3146 ?AUTO_3147 ) ) ( ON ?AUTO_3147 ?AUTO_3146 ) ( not ( = ?AUTO_3145 ?AUTO_3148 ) ) ( not ( = ?AUTO_3146 ?AUTO_3148 ) ) ( not ( = ?AUTO_3147 ?AUTO_3148 ) ) ( ON ?AUTO_3148 ?AUTO_3147 ) ( ON ?AUTO_3145 ?AUTO_3148 ) ( CLEAR ?AUTO_3145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3145 ?AUTO_3148 )
      ( MAKE-ON ?AUTO_3145 ?AUTO_3146 )
      ( MAKE-ON-VERIFY ?AUTO_3145 ?AUTO_3146 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3149 - BLOCK
      ?AUTO_3150 - BLOCK
    )
    :vars
    (
      ?AUTO_3151 - BLOCK
      ?AUTO_3152 - BLOCK
      ?AUTO_3153 - BLOCK
      ?AUTO_3154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3149 ?AUTO_3150 ) ) ( not ( = ?AUTO_3149 ?AUTO_3151 ) ) ( not ( = ?AUTO_3150 ?AUTO_3151 ) ) ( ON ?AUTO_3151 ?AUTO_3150 ) ( not ( = ?AUTO_3149 ?AUTO_3152 ) ) ( not ( = ?AUTO_3150 ?AUTO_3152 ) ) ( not ( = ?AUTO_3151 ?AUTO_3152 ) ) ( ON ?AUTO_3152 ?AUTO_3151 ) ( ON ?AUTO_3149 ?AUTO_3152 ) ( CLEAR ?AUTO_3149 ) ( HOLDING ?AUTO_3153 ) ( CLEAR ?AUTO_3154 ) ( not ( = ?AUTO_3149 ?AUTO_3153 ) ) ( not ( = ?AUTO_3149 ?AUTO_3154 ) ) ( not ( = ?AUTO_3150 ?AUTO_3153 ) ) ( not ( = ?AUTO_3150 ?AUTO_3154 ) ) ( not ( = ?AUTO_3151 ?AUTO_3153 ) ) ( not ( = ?AUTO_3151 ?AUTO_3154 ) ) ( not ( = ?AUTO_3152 ?AUTO_3153 ) ) ( not ( = ?AUTO_3152 ?AUTO_3154 ) ) ( not ( = ?AUTO_3153 ?AUTO_3154 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3153 ?AUTO_3154 )
      ( MAKE-ON ?AUTO_3149 ?AUTO_3150 )
      ( MAKE-ON-VERIFY ?AUTO_3149 ?AUTO_3150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3155 - BLOCK
      ?AUTO_3156 - BLOCK
    )
    :vars
    (
      ?AUTO_3157 - BLOCK
      ?AUTO_3158 - BLOCK
      ?AUTO_3160 - BLOCK
      ?AUTO_3159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3155 ?AUTO_3156 ) ) ( not ( = ?AUTO_3155 ?AUTO_3157 ) ) ( not ( = ?AUTO_3156 ?AUTO_3157 ) ) ( ON ?AUTO_3157 ?AUTO_3156 ) ( not ( = ?AUTO_3155 ?AUTO_3158 ) ) ( not ( = ?AUTO_3156 ?AUTO_3158 ) ) ( not ( = ?AUTO_3157 ?AUTO_3158 ) ) ( ON ?AUTO_3158 ?AUTO_3157 ) ( ON ?AUTO_3155 ?AUTO_3158 ) ( CLEAR ?AUTO_3160 ) ( not ( = ?AUTO_3155 ?AUTO_3159 ) ) ( not ( = ?AUTO_3155 ?AUTO_3160 ) ) ( not ( = ?AUTO_3156 ?AUTO_3159 ) ) ( not ( = ?AUTO_3156 ?AUTO_3160 ) ) ( not ( = ?AUTO_3157 ?AUTO_3159 ) ) ( not ( = ?AUTO_3157 ?AUTO_3160 ) ) ( not ( = ?AUTO_3158 ?AUTO_3159 ) ) ( not ( = ?AUTO_3158 ?AUTO_3160 ) ) ( not ( = ?AUTO_3159 ?AUTO_3160 ) ) ( ON ?AUTO_3159 ?AUTO_3155 ) ( CLEAR ?AUTO_3159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3159 ?AUTO_3155 )
      ( MAKE-ON ?AUTO_3155 ?AUTO_3156 )
      ( MAKE-ON-VERIFY ?AUTO_3155 ?AUTO_3156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3216 - BLOCK
      ?AUTO_3217 - BLOCK
    )
    :vars
    (
      ?AUTO_3220 - BLOCK
      ?AUTO_3218 - BLOCK
      ?AUTO_3219 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3217 ) ( not ( = ?AUTO_3216 ?AUTO_3217 ) ) ( ON-TABLE ?AUTO_3216 ) ( not ( = ?AUTO_3216 ?AUTO_3220 ) ) ( not ( = ?AUTO_3217 ?AUTO_3220 ) ) ( ON ?AUTO_3220 ?AUTO_3216 ) ( not ( = ?AUTO_3216 ?AUTO_3218 ) ) ( not ( = ?AUTO_3216 ?AUTO_3219 ) ) ( not ( = ?AUTO_3217 ?AUTO_3218 ) ) ( not ( = ?AUTO_3217 ?AUTO_3219 ) ) ( not ( = ?AUTO_3220 ?AUTO_3218 ) ) ( not ( = ?AUTO_3220 ?AUTO_3219 ) ) ( not ( = ?AUTO_3218 ?AUTO_3219 ) ) ( ON ?AUTO_3218 ?AUTO_3220 ) ( CLEAR ?AUTO_3218 ) ( HOLDING ?AUTO_3219 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3219 )
      ( MAKE-ON ?AUTO_3216 ?AUTO_3217 )
      ( MAKE-ON-VERIFY ?AUTO_3216 ?AUTO_3217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3321 - BLOCK
      ?AUTO_3322 - BLOCK
    )
    :vars
    (
      ?AUTO_3325 - BLOCK
      ?AUTO_3323 - BLOCK
      ?AUTO_3326 - BLOCK
      ?AUTO_3324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3322 ) ( not ( = ?AUTO_3321 ?AUTO_3322 ) ) ( ON-TABLE ?AUTO_3321 ) ( not ( = ?AUTO_3321 ?AUTO_3325 ) ) ( not ( = ?AUTO_3321 ?AUTO_3323 ) ) ( not ( = ?AUTO_3322 ?AUTO_3325 ) ) ( not ( = ?AUTO_3322 ?AUTO_3323 ) ) ( not ( = ?AUTO_3325 ?AUTO_3323 ) ) ( ON ?AUTO_3325 ?AUTO_3321 ) ( not ( = ?AUTO_3321 ?AUTO_3326 ) ) ( not ( = ?AUTO_3322 ?AUTO_3326 ) ) ( not ( = ?AUTO_3323 ?AUTO_3326 ) ) ( not ( = ?AUTO_3325 ?AUTO_3326 ) ) ( ON ?AUTO_3326 ?AUTO_3325 ) ( not ( = ?AUTO_3321 ?AUTO_3324 ) ) ( not ( = ?AUTO_3322 ?AUTO_3324 ) ) ( not ( = ?AUTO_3323 ?AUTO_3324 ) ) ( not ( = ?AUTO_3325 ?AUTO_3324 ) ) ( not ( = ?AUTO_3326 ?AUTO_3324 ) ) ( ON ?AUTO_3324 ?AUTO_3326 ) ( CLEAR ?AUTO_3324 ) ( HOLDING ?AUTO_3323 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3323 )
      ( MAKE-ON ?AUTO_3321 ?AUTO_3322 )
      ( MAKE-ON-VERIFY ?AUTO_3321 ?AUTO_3322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6184 - BLOCK
      ?AUTO_6185 - BLOCK
    )
    :vars
    (
      ?AUTO_6186 - BLOCK
      ?AUTO_6187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6184 ?AUTO_6185 ) ) ( ON-TABLE ?AUTO_6184 ) ( not ( = ?AUTO_6184 ?AUTO_6186 ) ) ( not ( = ?AUTO_6185 ?AUTO_6186 ) ) ( ON ?AUTO_6185 ?AUTO_6184 ) ( CLEAR ?AUTO_6185 ) ( HOLDING ?AUTO_6186 ) ( CLEAR ?AUTO_6187 ) ( not ( = ?AUTO_6184 ?AUTO_6187 ) ) ( not ( = ?AUTO_6185 ?AUTO_6187 ) ) ( not ( = ?AUTO_6186 ?AUTO_6187 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6186 ?AUTO_6187 )
      ( MAKE-ON ?AUTO_6184 ?AUTO_6185 )
      ( MAKE-ON-VERIFY ?AUTO_6184 ?AUTO_6185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3383 - BLOCK
      ?AUTO_3384 - BLOCK
    )
    :vars
    (
      ?AUTO_3387 - BLOCK
      ?AUTO_3386 - BLOCK
      ?AUTO_3385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3383 ?AUTO_3384 ) ) ( ON-TABLE ?AUTO_3383 ) ( CLEAR ?AUTO_3387 ) ( not ( = ?AUTO_3383 ?AUTO_3387 ) ) ( not ( = ?AUTO_3384 ?AUTO_3387 ) ) ( ON ?AUTO_3384 ?AUTO_3383 ) ( CLEAR ?AUTO_3386 ) ( not ( = ?AUTO_3383 ?AUTO_3385 ) ) ( not ( = ?AUTO_3383 ?AUTO_3386 ) ) ( not ( = ?AUTO_3384 ?AUTO_3385 ) ) ( not ( = ?AUTO_3384 ?AUTO_3386 ) ) ( not ( = ?AUTO_3387 ?AUTO_3385 ) ) ( not ( = ?AUTO_3387 ?AUTO_3386 ) ) ( not ( = ?AUTO_3385 ?AUTO_3386 ) ) ( ON ?AUTO_3385 ?AUTO_3384 ) ( CLEAR ?AUTO_3385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3385 ?AUTO_3384 )
      ( MAKE-ON ?AUTO_3383 ?AUTO_3384 )
      ( MAKE-ON-VERIFY ?AUTO_3383 ?AUTO_3384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3525 - BLOCK
      ?AUTO_3526 - BLOCK
    )
    :vars
    (
      ?AUTO_3531 - BLOCK
      ?AUTO_3530 - BLOCK
      ?AUTO_3527 - BLOCK
      ?AUTO_3528 - BLOCK
      ?AUTO_3529 - BLOCK
      ?AUTO_3532 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3526 ) ( not ( = ?AUTO_3525 ?AUTO_3526 ) ) ( ON ?AUTO_3525 ?AUTO_3531 ) ( not ( = ?AUTO_3525 ?AUTO_3531 ) ) ( not ( = ?AUTO_3526 ?AUTO_3531 ) ) ( not ( = ?AUTO_3525 ?AUTO_3530 ) ) ( not ( = ?AUTO_3526 ?AUTO_3530 ) ) ( not ( = ?AUTO_3531 ?AUTO_3530 ) ) ( ON ?AUTO_3530 ?AUTO_3525 ) ( not ( = ?AUTO_3525 ?AUTO_3527 ) ) ( not ( = ?AUTO_3526 ?AUTO_3527 ) ) ( not ( = ?AUTO_3531 ?AUTO_3527 ) ) ( not ( = ?AUTO_3530 ?AUTO_3527 ) ) ( ON ?AUTO_3527 ?AUTO_3530 ) ( not ( = ?AUTO_3525 ?AUTO_3528 ) ) ( not ( = ?AUTO_3525 ?AUTO_3529 ) ) ( not ( = ?AUTO_3526 ?AUTO_3528 ) ) ( not ( = ?AUTO_3526 ?AUTO_3529 ) ) ( not ( = ?AUTO_3531 ?AUTO_3528 ) ) ( not ( = ?AUTO_3531 ?AUTO_3529 ) ) ( not ( = ?AUTO_3530 ?AUTO_3528 ) ) ( not ( = ?AUTO_3530 ?AUTO_3529 ) ) ( not ( = ?AUTO_3527 ?AUTO_3528 ) ) ( not ( = ?AUTO_3527 ?AUTO_3529 ) ) ( not ( = ?AUTO_3528 ?AUTO_3529 ) ) ( ON ?AUTO_3528 ?AUTO_3527 ) ( CLEAR ?AUTO_3528 ) ( HOLDING ?AUTO_3529 ) ( CLEAR ?AUTO_3532 ) ( not ( = ?AUTO_3525 ?AUTO_3532 ) ) ( not ( = ?AUTO_3526 ?AUTO_3532 ) ) ( not ( = ?AUTO_3531 ?AUTO_3532 ) ) ( not ( = ?AUTO_3530 ?AUTO_3532 ) ) ( not ( = ?AUTO_3527 ?AUTO_3532 ) ) ( not ( = ?AUTO_3528 ?AUTO_3532 ) ) ( not ( = ?AUTO_3529 ?AUTO_3532 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3529 ?AUTO_3532 )
      ( MAKE-ON ?AUTO_3525 ?AUTO_3526 )
      ( MAKE-ON-VERIFY ?AUTO_3525 ?AUTO_3526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3539 - BLOCK
      ?AUTO_3540 - BLOCK
    )
    :vars
    (
      ?AUTO_3542 - BLOCK
      ?AUTO_3541 - BLOCK
      ?AUTO_3543 - BLOCK
      ?AUTO_3545 - BLOCK
      ?AUTO_3544 - BLOCK
      ?AUTO_3546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3539 ?AUTO_3540 ) ) ( ON ?AUTO_3539 ?AUTO_3542 ) ( not ( = ?AUTO_3539 ?AUTO_3542 ) ) ( not ( = ?AUTO_3540 ?AUTO_3542 ) ) ( not ( = ?AUTO_3539 ?AUTO_3541 ) ) ( not ( = ?AUTO_3540 ?AUTO_3541 ) ) ( not ( = ?AUTO_3542 ?AUTO_3541 ) ) ( ON ?AUTO_3541 ?AUTO_3539 ) ( not ( = ?AUTO_3539 ?AUTO_3543 ) ) ( not ( = ?AUTO_3540 ?AUTO_3543 ) ) ( not ( = ?AUTO_3542 ?AUTO_3543 ) ) ( not ( = ?AUTO_3541 ?AUTO_3543 ) ) ( ON ?AUTO_3543 ?AUTO_3541 ) ( CLEAR ?AUTO_3545 ) ( not ( = ?AUTO_3539 ?AUTO_3544 ) ) ( not ( = ?AUTO_3539 ?AUTO_3545 ) ) ( not ( = ?AUTO_3540 ?AUTO_3544 ) ) ( not ( = ?AUTO_3540 ?AUTO_3545 ) ) ( not ( = ?AUTO_3542 ?AUTO_3544 ) ) ( not ( = ?AUTO_3542 ?AUTO_3545 ) ) ( not ( = ?AUTO_3541 ?AUTO_3544 ) ) ( not ( = ?AUTO_3541 ?AUTO_3545 ) ) ( not ( = ?AUTO_3543 ?AUTO_3544 ) ) ( not ( = ?AUTO_3543 ?AUTO_3545 ) ) ( not ( = ?AUTO_3544 ?AUTO_3545 ) ) ( ON ?AUTO_3544 ?AUTO_3543 ) ( CLEAR ?AUTO_3544 ) ( HOLDING ?AUTO_3540 ) ( CLEAR ?AUTO_3546 ) ( not ( = ?AUTO_3539 ?AUTO_3546 ) ) ( not ( = ?AUTO_3540 ?AUTO_3546 ) ) ( not ( = ?AUTO_3542 ?AUTO_3546 ) ) ( not ( = ?AUTO_3541 ?AUTO_3546 ) ) ( not ( = ?AUTO_3543 ?AUTO_3546 ) ) ( not ( = ?AUTO_3545 ?AUTO_3546 ) ) ( not ( = ?AUTO_3544 ?AUTO_3546 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3540 ?AUTO_3546 )
      ( MAKE-ON ?AUTO_3539 ?AUTO_3540 )
      ( MAKE-ON-VERIFY ?AUTO_3539 ?AUTO_3540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3779 - BLOCK
      ?AUTO_3780 - BLOCK
    )
    :vars
    (
      ?AUTO_3781 - BLOCK
      ?AUTO_3783 - BLOCK
      ?AUTO_3782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3779 ?AUTO_3780 ) ) ( not ( = ?AUTO_3779 ?AUTO_3781 ) ) ( not ( = ?AUTO_3780 ?AUTO_3781 ) ) ( CLEAR ?AUTO_3783 ) ( not ( = ?AUTO_3779 ?AUTO_3782 ) ) ( not ( = ?AUTO_3779 ?AUTO_3783 ) ) ( not ( = ?AUTO_3780 ?AUTO_3782 ) ) ( not ( = ?AUTO_3780 ?AUTO_3783 ) ) ( not ( = ?AUTO_3781 ?AUTO_3782 ) ) ( not ( = ?AUTO_3781 ?AUTO_3783 ) ) ( not ( = ?AUTO_3782 ?AUTO_3783 ) ) ( ON ?AUTO_3782 ?AUTO_3780 ) ( CLEAR ?AUTO_3782 ) ( CLEAR ?AUTO_3781 ) ( ON-TABLE ?AUTO_3779 ) ( CLEAR ?AUTO_3779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3779 )
      ( MAKE-ON ?AUTO_3779 ?AUTO_3780 )
      ( MAKE-ON-VERIFY ?AUTO_3779 ?AUTO_3780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3975 - BLOCK
      ?AUTO_3976 - BLOCK
    )
    :vars
    (
      ?AUTO_3977 - BLOCK
      ?AUTO_3978 - BLOCK
      ?AUTO_3979 - BLOCK
      ?AUTO_3980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3975 ?AUTO_3976 ) ) ( ON-TABLE ?AUTO_3975 ) ( not ( = ?AUTO_3975 ?AUTO_3977 ) ) ( not ( = ?AUTO_3976 ?AUTO_3977 ) ) ( ON ?AUTO_3977 ?AUTO_3975 ) ( CLEAR ?AUTO_3977 ) ( not ( = ?AUTO_3975 ?AUTO_3978 ) ) ( not ( = ?AUTO_3975 ?AUTO_3979 ) ) ( not ( = ?AUTO_3976 ?AUTO_3978 ) ) ( not ( = ?AUTO_3976 ?AUTO_3979 ) ) ( not ( = ?AUTO_3977 ?AUTO_3978 ) ) ( not ( = ?AUTO_3977 ?AUTO_3979 ) ) ( not ( = ?AUTO_3978 ?AUTO_3979 ) ) ( ON ?AUTO_3978 ?AUTO_3976 ) ( CLEAR ?AUTO_3978 ) ( HOLDING ?AUTO_3979 ) ( CLEAR ?AUTO_3980 ) ( not ( = ?AUTO_3975 ?AUTO_3980 ) ) ( not ( = ?AUTO_3976 ?AUTO_3980 ) ) ( not ( = ?AUTO_3977 ?AUTO_3980 ) ) ( not ( = ?AUTO_3978 ?AUTO_3980 ) ) ( not ( = ?AUTO_3979 ?AUTO_3980 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3979 ?AUTO_3980 )
      ( MAKE-ON ?AUTO_3975 ?AUTO_3976 )
      ( MAKE-ON-VERIFY ?AUTO_3975 ?AUTO_3976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3981 - BLOCK
      ?AUTO_3982 - BLOCK
    )
    :vars
    (
      ?AUTO_3983 - BLOCK
      ?AUTO_3986 - BLOCK
      ?AUTO_3984 - BLOCK
      ?AUTO_3985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3981 ?AUTO_3982 ) ) ( ON-TABLE ?AUTO_3981 ) ( not ( = ?AUTO_3981 ?AUTO_3983 ) ) ( not ( = ?AUTO_3982 ?AUTO_3983 ) ) ( ON ?AUTO_3983 ?AUTO_3981 ) ( not ( = ?AUTO_3981 ?AUTO_3986 ) ) ( not ( = ?AUTO_3981 ?AUTO_3984 ) ) ( not ( = ?AUTO_3982 ?AUTO_3986 ) ) ( not ( = ?AUTO_3982 ?AUTO_3984 ) ) ( not ( = ?AUTO_3983 ?AUTO_3986 ) ) ( not ( = ?AUTO_3983 ?AUTO_3984 ) ) ( not ( = ?AUTO_3986 ?AUTO_3984 ) ) ( ON ?AUTO_3986 ?AUTO_3982 ) ( CLEAR ?AUTO_3986 ) ( CLEAR ?AUTO_3985 ) ( not ( = ?AUTO_3981 ?AUTO_3985 ) ) ( not ( = ?AUTO_3982 ?AUTO_3985 ) ) ( not ( = ?AUTO_3983 ?AUTO_3985 ) ) ( not ( = ?AUTO_3986 ?AUTO_3985 ) ) ( not ( = ?AUTO_3984 ?AUTO_3985 ) ) ( ON ?AUTO_3984 ?AUTO_3983 ) ( CLEAR ?AUTO_3984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3984 ?AUTO_3983 )
      ( MAKE-ON ?AUTO_3981 ?AUTO_3982 )
      ( MAKE-ON-VERIFY ?AUTO_3981 ?AUTO_3982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3987 - BLOCK
      ?AUTO_3988 - BLOCK
    )
    :vars
    (
      ?AUTO_3989 - BLOCK
      ?AUTO_3991 - BLOCK
      ?AUTO_3992 - BLOCK
      ?AUTO_3990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3987 ?AUTO_3988 ) ) ( ON-TABLE ?AUTO_3987 ) ( not ( = ?AUTO_3987 ?AUTO_3989 ) ) ( not ( = ?AUTO_3988 ?AUTO_3989 ) ) ( ON ?AUTO_3989 ?AUTO_3987 ) ( not ( = ?AUTO_3987 ?AUTO_3991 ) ) ( not ( = ?AUTO_3987 ?AUTO_3992 ) ) ( not ( = ?AUTO_3988 ?AUTO_3991 ) ) ( not ( = ?AUTO_3988 ?AUTO_3992 ) ) ( not ( = ?AUTO_3989 ?AUTO_3991 ) ) ( not ( = ?AUTO_3989 ?AUTO_3992 ) ) ( not ( = ?AUTO_3991 ?AUTO_3992 ) ) ( CLEAR ?AUTO_3990 ) ( not ( = ?AUTO_3987 ?AUTO_3990 ) ) ( not ( = ?AUTO_3988 ?AUTO_3990 ) ) ( not ( = ?AUTO_3989 ?AUTO_3990 ) ) ( not ( = ?AUTO_3991 ?AUTO_3990 ) ) ( not ( = ?AUTO_3992 ?AUTO_3990 ) ) ( ON ?AUTO_3992 ?AUTO_3989 ) ( CLEAR ?AUTO_3992 ) ( HOLDING ?AUTO_3991 ) ( CLEAR ?AUTO_3988 ) )
    :subtasks
    ( ( !STACK ?AUTO_3991 ?AUTO_3988 )
      ( MAKE-ON ?AUTO_3987 ?AUTO_3988 )
      ( MAKE-ON-VERIFY ?AUTO_3987 ?AUTO_3988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4011 - BLOCK
      ?AUTO_4012 - BLOCK
    )
    :vars
    (
      ?AUTO_4018 - BLOCK
      ?AUTO_4016 - BLOCK
      ?AUTO_4015 - BLOCK
      ?AUTO_4013 - BLOCK
      ?AUTO_4014 - BLOCK
      ?AUTO_4017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4011 ?AUTO_4012 ) ) ( ON-TABLE ?AUTO_4011 ) ( not ( = ?AUTO_4011 ?AUTO_4018 ) ) ( not ( = ?AUTO_4012 ?AUTO_4018 ) ) ( ON ?AUTO_4018 ?AUTO_4011 ) ( not ( = ?AUTO_4011 ?AUTO_4016 ) ) ( not ( = ?AUTO_4011 ?AUTO_4015 ) ) ( not ( = ?AUTO_4012 ?AUTO_4016 ) ) ( not ( = ?AUTO_4012 ?AUTO_4015 ) ) ( not ( = ?AUTO_4018 ?AUTO_4016 ) ) ( not ( = ?AUTO_4018 ?AUTO_4015 ) ) ( not ( = ?AUTO_4016 ?AUTO_4015 ) ) ( CLEAR ?AUTO_4013 ) ( not ( = ?AUTO_4011 ?AUTO_4013 ) ) ( not ( = ?AUTO_4012 ?AUTO_4013 ) ) ( not ( = ?AUTO_4018 ?AUTO_4013 ) ) ( not ( = ?AUTO_4016 ?AUTO_4013 ) ) ( not ( = ?AUTO_4015 ?AUTO_4013 ) ) ( ON ?AUTO_4015 ?AUTO_4018 ) ( ON ?AUTO_4016 ?AUTO_4015 ) ( CLEAR ?AUTO_4016 ) ( CLEAR ?AUTO_4014 ) ( not ( = ?AUTO_4011 ?AUTO_4017 ) ) ( not ( = ?AUTO_4011 ?AUTO_4014 ) ) ( not ( = ?AUTO_4012 ?AUTO_4017 ) ) ( not ( = ?AUTO_4012 ?AUTO_4014 ) ) ( not ( = ?AUTO_4018 ?AUTO_4017 ) ) ( not ( = ?AUTO_4018 ?AUTO_4014 ) ) ( not ( = ?AUTO_4016 ?AUTO_4017 ) ) ( not ( = ?AUTO_4016 ?AUTO_4014 ) ) ( not ( = ?AUTO_4015 ?AUTO_4017 ) ) ( not ( = ?AUTO_4015 ?AUTO_4014 ) ) ( not ( = ?AUTO_4013 ?AUTO_4017 ) ) ( not ( = ?AUTO_4013 ?AUTO_4014 ) ) ( not ( = ?AUTO_4017 ?AUTO_4014 ) ) ( ON ?AUTO_4017 ?AUTO_4012 ) ( CLEAR ?AUTO_4017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4017 ?AUTO_4012 )
      ( MAKE-ON ?AUTO_4011 ?AUTO_4012 )
      ( MAKE-ON-VERIFY ?AUTO_4011 ?AUTO_4012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4019 - BLOCK
      ?AUTO_4020 - BLOCK
    )
    :vars
    (
      ?AUTO_4023 - BLOCK
      ?AUTO_4021 - BLOCK
      ?AUTO_4022 - BLOCK
      ?AUTO_4026 - BLOCK
      ?AUTO_4024 - BLOCK
      ?AUTO_4025 - BLOCK
      ?AUTO_4027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4019 ?AUTO_4020 ) ) ( ON-TABLE ?AUTO_4019 ) ( not ( = ?AUTO_4019 ?AUTO_4023 ) ) ( not ( = ?AUTO_4020 ?AUTO_4023 ) ) ( ON ?AUTO_4023 ?AUTO_4019 ) ( not ( = ?AUTO_4019 ?AUTO_4021 ) ) ( not ( = ?AUTO_4019 ?AUTO_4022 ) ) ( not ( = ?AUTO_4020 ?AUTO_4021 ) ) ( not ( = ?AUTO_4020 ?AUTO_4022 ) ) ( not ( = ?AUTO_4023 ?AUTO_4021 ) ) ( not ( = ?AUTO_4023 ?AUTO_4022 ) ) ( not ( = ?AUTO_4021 ?AUTO_4022 ) ) ( CLEAR ?AUTO_4026 ) ( not ( = ?AUTO_4019 ?AUTO_4026 ) ) ( not ( = ?AUTO_4020 ?AUTO_4026 ) ) ( not ( = ?AUTO_4023 ?AUTO_4026 ) ) ( not ( = ?AUTO_4021 ?AUTO_4026 ) ) ( not ( = ?AUTO_4022 ?AUTO_4026 ) ) ( ON ?AUTO_4022 ?AUTO_4023 ) ( ON ?AUTO_4021 ?AUTO_4022 ) ( CLEAR ?AUTO_4021 ) ( CLEAR ?AUTO_4024 ) ( not ( = ?AUTO_4019 ?AUTO_4025 ) ) ( not ( = ?AUTO_4019 ?AUTO_4024 ) ) ( not ( = ?AUTO_4020 ?AUTO_4025 ) ) ( not ( = ?AUTO_4020 ?AUTO_4024 ) ) ( not ( = ?AUTO_4023 ?AUTO_4025 ) ) ( not ( = ?AUTO_4023 ?AUTO_4024 ) ) ( not ( = ?AUTO_4021 ?AUTO_4025 ) ) ( not ( = ?AUTO_4021 ?AUTO_4024 ) ) ( not ( = ?AUTO_4022 ?AUTO_4025 ) ) ( not ( = ?AUTO_4022 ?AUTO_4024 ) ) ( not ( = ?AUTO_4026 ?AUTO_4025 ) ) ( not ( = ?AUTO_4026 ?AUTO_4024 ) ) ( not ( = ?AUTO_4025 ?AUTO_4024 ) ) ( ON ?AUTO_4025 ?AUTO_4020 ) ( CLEAR ?AUTO_4025 ) ( HOLDING ?AUTO_4027 ) ( not ( = ?AUTO_4019 ?AUTO_4027 ) ) ( not ( = ?AUTO_4020 ?AUTO_4027 ) ) ( not ( = ?AUTO_4023 ?AUTO_4027 ) ) ( not ( = ?AUTO_4021 ?AUTO_4027 ) ) ( not ( = ?AUTO_4022 ?AUTO_4027 ) ) ( not ( = ?AUTO_4026 ?AUTO_4027 ) ) ( not ( = ?AUTO_4024 ?AUTO_4027 ) ) ( not ( = ?AUTO_4025 ?AUTO_4027 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4027 )
      ( MAKE-ON ?AUTO_4019 ?AUTO_4020 )
      ( MAKE-ON-VERIFY ?AUTO_4019 ?AUTO_4020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4028 - BLOCK
      ?AUTO_4029 - BLOCK
    )
    :vars
    (
      ?AUTO_4035 - BLOCK
      ?AUTO_4034 - BLOCK
      ?AUTO_4031 - BLOCK
      ?AUTO_4032 - BLOCK
      ?AUTO_4033 - BLOCK
      ?AUTO_4030 - BLOCK
      ?AUTO_4036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4028 ?AUTO_4029 ) ) ( ON-TABLE ?AUTO_4028 ) ( not ( = ?AUTO_4028 ?AUTO_4035 ) ) ( not ( = ?AUTO_4029 ?AUTO_4035 ) ) ( ON ?AUTO_4035 ?AUTO_4028 ) ( not ( = ?AUTO_4028 ?AUTO_4034 ) ) ( not ( = ?AUTO_4028 ?AUTO_4031 ) ) ( not ( = ?AUTO_4029 ?AUTO_4034 ) ) ( not ( = ?AUTO_4029 ?AUTO_4031 ) ) ( not ( = ?AUTO_4035 ?AUTO_4034 ) ) ( not ( = ?AUTO_4035 ?AUTO_4031 ) ) ( not ( = ?AUTO_4034 ?AUTO_4031 ) ) ( CLEAR ?AUTO_4032 ) ( not ( = ?AUTO_4028 ?AUTO_4032 ) ) ( not ( = ?AUTO_4029 ?AUTO_4032 ) ) ( not ( = ?AUTO_4035 ?AUTO_4032 ) ) ( not ( = ?AUTO_4034 ?AUTO_4032 ) ) ( not ( = ?AUTO_4031 ?AUTO_4032 ) ) ( ON ?AUTO_4031 ?AUTO_4035 ) ( ON ?AUTO_4034 ?AUTO_4031 ) ( CLEAR ?AUTO_4034 ) ( CLEAR ?AUTO_4033 ) ( not ( = ?AUTO_4028 ?AUTO_4030 ) ) ( not ( = ?AUTO_4028 ?AUTO_4033 ) ) ( not ( = ?AUTO_4029 ?AUTO_4030 ) ) ( not ( = ?AUTO_4029 ?AUTO_4033 ) ) ( not ( = ?AUTO_4035 ?AUTO_4030 ) ) ( not ( = ?AUTO_4035 ?AUTO_4033 ) ) ( not ( = ?AUTO_4034 ?AUTO_4030 ) ) ( not ( = ?AUTO_4034 ?AUTO_4033 ) ) ( not ( = ?AUTO_4031 ?AUTO_4030 ) ) ( not ( = ?AUTO_4031 ?AUTO_4033 ) ) ( not ( = ?AUTO_4032 ?AUTO_4030 ) ) ( not ( = ?AUTO_4032 ?AUTO_4033 ) ) ( not ( = ?AUTO_4030 ?AUTO_4033 ) ) ( ON ?AUTO_4030 ?AUTO_4029 ) ( not ( = ?AUTO_4028 ?AUTO_4036 ) ) ( not ( = ?AUTO_4029 ?AUTO_4036 ) ) ( not ( = ?AUTO_4035 ?AUTO_4036 ) ) ( not ( = ?AUTO_4034 ?AUTO_4036 ) ) ( not ( = ?AUTO_4031 ?AUTO_4036 ) ) ( not ( = ?AUTO_4032 ?AUTO_4036 ) ) ( not ( = ?AUTO_4033 ?AUTO_4036 ) ) ( not ( = ?AUTO_4030 ?AUTO_4036 ) ) ( ON ?AUTO_4036 ?AUTO_4030 ) ( CLEAR ?AUTO_4036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4036 ?AUTO_4030 )
      ( MAKE-ON ?AUTO_4028 ?AUTO_4029 )
      ( MAKE-ON-VERIFY ?AUTO_4028 ?AUTO_4029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4037 - BLOCK
      ?AUTO_4038 - BLOCK
    )
    :vars
    (
      ?AUTO_4042 - BLOCK
      ?AUTO_4039 - BLOCK
      ?AUTO_4045 - BLOCK
      ?AUTO_4043 - BLOCK
      ?AUTO_4040 - BLOCK
      ?AUTO_4044 - BLOCK
      ?AUTO_4041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4037 ?AUTO_4038 ) ) ( ON-TABLE ?AUTO_4037 ) ( not ( = ?AUTO_4037 ?AUTO_4042 ) ) ( not ( = ?AUTO_4038 ?AUTO_4042 ) ) ( ON ?AUTO_4042 ?AUTO_4037 ) ( not ( = ?AUTO_4037 ?AUTO_4039 ) ) ( not ( = ?AUTO_4037 ?AUTO_4045 ) ) ( not ( = ?AUTO_4038 ?AUTO_4039 ) ) ( not ( = ?AUTO_4038 ?AUTO_4045 ) ) ( not ( = ?AUTO_4042 ?AUTO_4039 ) ) ( not ( = ?AUTO_4042 ?AUTO_4045 ) ) ( not ( = ?AUTO_4039 ?AUTO_4045 ) ) ( not ( = ?AUTO_4037 ?AUTO_4043 ) ) ( not ( = ?AUTO_4038 ?AUTO_4043 ) ) ( not ( = ?AUTO_4042 ?AUTO_4043 ) ) ( not ( = ?AUTO_4039 ?AUTO_4043 ) ) ( not ( = ?AUTO_4045 ?AUTO_4043 ) ) ( ON ?AUTO_4045 ?AUTO_4042 ) ( ON ?AUTO_4039 ?AUTO_4045 ) ( CLEAR ?AUTO_4039 ) ( CLEAR ?AUTO_4040 ) ( not ( = ?AUTO_4037 ?AUTO_4044 ) ) ( not ( = ?AUTO_4037 ?AUTO_4040 ) ) ( not ( = ?AUTO_4038 ?AUTO_4044 ) ) ( not ( = ?AUTO_4038 ?AUTO_4040 ) ) ( not ( = ?AUTO_4042 ?AUTO_4044 ) ) ( not ( = ?AUTO_4042 ?AUTO_4040 ) ) ( not ( = ?AUTO_4039 ?AUTO_4044 ) ) ( not ( = ?AUTO_4039 ?AUTO_4040 ) ) ( not ( = ?AUTO_4045 ?AUTO_4044 ) ) ( not ( = ?AUTO_4045 ?AUTO_4040 ) ) ( not ( = ?AUTO_4043 ?AUTO_4044 ) ) ( not ( = ?AUTO_4043 ?AUTO_4040 ) ) ( not ( = ?AUTO_4044 ?AUTO_4040 ) ) ( ON ?AUTO_4044 ?AUTO_4038 ) ( not ( = ?AUTO_4037 ?AUTO_4041 ) ) ( not ( = ?AUTO_4038 ?AUTO_4041 ) ) ( not ( = ?AUTO_4042 ?AUTO_4041 ) ) ( not ( = ?AUTO_4039 ?AUTO_4041 ) ) ( not ( = ?AUTO_4045 ?AUTO_4041 ) ) ( not ( = ?AUTO_4043 ?AUTO_4041 ) ) ( not ( = ?AUTO_4040 ?AUTO_4041 ) ) ( not ( = ?AUTO_4044 ?AUTO_4041 ) ) ( ON ?AUTO_4041 ?AUTO_4044 ) ( CLEAR ?AUTO_4041 ) ( HOLDING ?AUTO_4043 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4043 )
      ( MAKE-ON ?AUTO_4037 ?AUTO_4038 )
      ( MAKE-ON-VERIFY ?AUTO_4037 ?AUTO_4038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4046 - BLOCK
      ?AUTO_4047 - BLOCK
    )
    :vars
    (
      ?AUTO_4051 - BLOCK
      ?AUTO_4049 - BLOCK
      ?AUTO_4054 - BLOCK
      ?AUTO_4053 - BLOCK
      ?AUTO_4050 - BLOCK
      ?AUTO_4052 - BLOCK
      ?AUTO_4048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4046 ?AUTO_4047 ) ) ( ON-TABLE ?AUTO_4046 ) ( not ( = ?AUTO_4046 ?AUTO_4051 ) ) ( not ( = ?AUTO_4047 ?AUTO_4051 ) ) ( ON ?AUTO_4051 ?AUTO_4046 ) ( not ( = ?AUTO_4046 ?AUTO_4049 ) ) ( not ( = ?AUTO_4046 ?AUTO_4054 ) ) ( not ( = ?AUTO_4047 ?AUTO_4049 ) ) ( not ( = ?AUTO_4047 ?AUTO_4054 ) ) ( not ( = ?AUTO_4051 ?AUTO_4049 ) ) ( not ( = ?AUTO_4051 ?AUTO_4054 ) ) ( not ( = ?AUTO_4049 ?AUTO_4054 ) ) ( not ( = ?AUTO_4046 ?AUTO_4053 ) ) ( not ( = ?AUTO_4047 ?AUTO_4053 ) ) ( not ( = ?AUTO_4051 ?AUTO_4053 ) ) ( not ( = ?AUTO_4049 ?AUTO_4053 ) ) ( not ( = ?AUTO_4054 ?AUTO_4053 ) ) ( ON ?AUTO_4054 ?AUTO_4051 ) ( ON ?AUTO_4049 ?AUTO_4054 ) ( CLEAR ?AUTO_4049 ) ( CLEAR ?AUTO_4050 ) ( not ( = ?AUTO_4046 ?AUTO_4052 ) ) ( not ( = ?AUTO_4046 ?AUTO_4050 ) ) ( not ( = ?AUTO_4047 ?AUTO_4052 ) ) ( not ( = ?AUTO_4047 ?AUTO_4050 ) ) ( not ( = ?AUTO_4051 ?AUTO_4052 ) ) ( not ( = ?AUTO_4051 ?AUTO_4050 ) ) ( not ( = ?AUTO_4049 ?AUTO_4052 ) ) ( not ( = ?AUTO_4049 ?AUTO_4050 ) ) ( not ( = ?AUTO_4054 ?AUTO_4052 ) ) ( not ( = ?AUTO_4054 ?AUTO_4050 ) ) ( not ( = ?AUTO_4053 ?AUTO_4052 ) ) ( not ( = ?AUTO_4053 ?AUTO_4050 ) ) ( not ( = ?AUTO_4052 ?AUTO_4050 ) ) ( ON ?AUTO_4052 ?AUTO_4047 ) ( not ( = ?AUTO_4046 ?AUTO_4048 ) ) ( not ( = ?AUTO_4047 ?AUTO_4048 ) ) ( not ( = ?AUTO_4051 ?AUTO_4048 ) ) ( not ( = ?AUTO_4049 ?AUTO_4048 ) ) ( not ( = ?AUTO_4054 ?AUTO_4048 ) ) ( not ( = ?AUTO_4053 ?AUTO_4048 ) ) ( not ( = ?AUTO_4050 ?AUTO_4048 ) ) ( not ( = ?AUTO_4052 ?AUTO_4048 ) ) ( ON ?AUTO_4048 ?AUTO_4052 ) ( ON ?AUTO_4053 ?AUTO_4048 ) ( CLEAR ?AUTO_4053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4053 ?AUTO_4048 )
      ( MAKE-ON ?AUTO_4046 ?AUTO_4047 )
      ( MAKE-ON-VERIFY ?AUTO_4046 ?AUTO_4047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4055 - BLOCK
      ?AUTO_4056 - BLOCK
    )
    :vars
    (
      ?AUTO_4060 - BLOCK
      ?AUTO_4061 - BLOCK
      ?AUTO_4059 - BLOCK
      ?AUTO_4058 - BLOCK
      ?AUTO_4057 - BLOCK
      ?AUTO_4063 - BLOCK
      ?AUTO_4062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4055 ?AUTO_4056 ) ) ( ON-TABLE ?AUTO_4055 ) ( not ( = ?AUTO_4055 ?AUTO_4060 ) ) ( not ( = ?AUTO_4056 ?AUTO_4060 ) ) ( ON ?AUTO_4060 ?AUTO_4055 ) ( not ( = ?AUTO_4055 ?AUTO_4061 ) ) ( not ( = ?AUTO_4055 ?AUTO_4059 ) ) ( not ( = ?AUTO_4056 ?AUTO_4061 ) ) ( not ( = ?AUTO_4056 ?AUTO_4059 ) ) ( not ( = ?AUTO_4060 ?AUTO_4061 ) ) ( not ( = ?AUTO_4060 ?AUTO_4059 ) ) ( not ( = ?AUTO_4061 ?AUTO_4059 ) ) ( not ( = ?AUTO_4055 ?AUTO_4058 ) ) ( not ( = ?AUTO_4056 ?AUTO_4058 ) ) ( not ( = ?AUTO_4060 ?AUTO_4058 ) ) ( not ( = ?AUTO_4061 ?AUTO_4058 ) ) ( not ( = ?AUTO_4059 ?AUTO_4058 ) ) ( ON ?AUTO_4059 ?AUTO_4060 ) ( CLEAR ?AUTO_4057 ) ( not ( = ?AUTO_4055 ?AUTO_4063 ) ) ( not ( = ?AUTO_4055 ?AUTO_4057 ) ) ( not ( = ?AUTO_4056 ?AUTO_4063 ) ) ( not ( = ?AUTO_4056 ?AUTO_4057 ) ) ( not ( = ?AUTO_4060 ?AUTO_4063 ) ) ( not ( = ?AUTO_4060 ?AUTO_4057 ) ) ( not ( = ?AUTO_4061 ?AUTO_4063 ) ) ( not ( = ?AUTO_4061 ?AUTO_4057 ) ) ( not ( = ?AUTO_4059 ?AUTO_4063 ) ) ( not ( = ?AUTO_4059 ?AUTO_4057 ) ) ( not ( = ?AUTO_4058 ?AUTO_4063 ) ) ( not ( = ?AUTO_4058 ?AUTO_4057 ) ) ( not ( = ?AUTO_4063 ?AUTO_4057 ) ) ( ON ?AUTO_4063 ?AUTO_4056 ) ( not ( = ?AUTO_4055 ?AUTO_4062 ) ) ( not ( = ?AUTO_4056 ?AUTO_4062 ) ) ( not ( = ?AUTO_4060 ?AUTO_4062 ) ) ( not ( = ?AUTO_4061 ?AUTO_4062 ) ) ( not ( = ?AUTO_4059 ?AUTO_4062 ) ) ( not ( = ?AUTO_4058 ?AUTO_4062 ) ) ( not ( = ?AUTO_4057 ?AUTO_4062 ) ) ( not ( = ?AUTO_4063 ?AUTO_4062 ) ) ( ON ?AUTO_4062 ?AUTO_4063 ) ( ON ?AUTO_4058 ?AUTO_4062 ) ( CLEAR ?AUTO_4058 ) ( HOLDING ?AUTO_4061 ) ( CLEAR ?AUTO_4059 ) )
    :subtasks
    ( ( !STACK ?AUTO_4061 ?AUTO_4059 )
      ( MAKE-ON ?AUTO_4055 ?AUTO_4056 )
      ( MAKE-ON-VERIFY ?AUTO_4055 ?AUTO_4056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4073 - BLOCK
      ?AUTO_4074 - BLOCK
    )
    :vars
    (
      ?AUTO_4076 - BLOCK
      ?AUTO_4077 - BLOCK
      ?AUTO_4080 - BLOCK
      ?AUTO_4081 - BLOCK
      ?AUTO_4078 - BLOCK
      ?AUTO_4079 - BLOCK
      ?AUTO_4075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4073 ?AUTO_4074 ) ) ( ON-TABLE ?AUTO_4073 ) ( not ( = ?AUTO_4073 ?AUTO_4076 ) ) ( not ( = ?AUTO_4074 ?AUTO_4076 ) ) ( ON ?AUTO_4076 ?AUTO_4073 ) ( not ( = ?AUTO_4073 ?AUTO_4077 ) ) ( not ( = ?AUTO_4073 ?AUTO_4080 ) ) ( not ( = ?AUTO_4074 ?AUTO_4077 ) ) ( not ( = ?AUTO_4074 ?AUTO_4080 ) ) ( not ( = ?AUTO_4076 ?AUTO_4077 ) ) ( not ( = ?AUTO_4076 ?AUTO_4080 ) ) ( not ( = ?AUTO_4077 ?AUTO_4080 ) ) ( not ( = ?AUTO_4073 ?AUTO_4081 ) ) ( not ( = ?AUTO_4074 ?AUTO_4081 ) ) ( not ( = ?AUTO_4076 ?AUTO_4081 ) ) ( not ( = ?AUTO_4077 ?AUTO_4081 ) ) ( not ( = ?AUTO_4080 ?AUTO_4081 ) ) ( CLEAR ?AUTO_4078 ) ( not ( = ?AUTO_4073 ?AUTO_4079 ) ) ( not ( = ?AUTO_4073 ?AUTO_4078 ) ) ( not ( = ?AUTO_4074 ?AUTO_4079 ) ) ( not ( = ?AUTO_4074 ?AUTO_4078 ) ) ( not ( = ?AUTO_4076 ?AUTO_4079 ) ) ( not ( = ?AUTO_4076 ?AUTO_4078 ) ) ( not ( = ?AUTO_4077 ?AUTO_4079 ) ) ( not ( = ?AUTO_4077 ?AUTO_4078 ) ) ( not ( = ?AUTO_4080 ?AUTO_4079 ) ) ( not ( = ?AUTO_4080 ?AUTO_4078 ) ) ( not ( = ?AUTO_4081 ?AUTO_4079 ) ) ( not ( = ?AUTO_4081 ?AUTO_4078 ) ) ( not ( = ?AUTO_4079 ?AUTO_4078 ) ) ( ON ?AUTO_4079 ?AUTO_4074 ) ( not ( = ?AUTO_4073 ?AUTO_4075 ) ) ( not ( = ?AUTO_4074 ?AUTO_4075 ) ) ( not ( = ?AUTO_4076 ?AUTO_4075 ) ) ( not ( = ?AUTO_4077 ?AUTO_4075 ) ) ( not ( = ?AUTO_4080 ?AUTO_4075 ) ) ( not ( = ?AUTO_4081 ?AUTO_4075 ) ) ( not ( = ?AUTO_4078 ?AUTO_4075 ) ) ( not ( = ?AUTO_4079 ?AUTO_4075 ) ) ( ON ?AUTO_4075 ?AUTO_4079 ) ( ON ?AUTO_4081 ?AUTO_4075 ) ( ON ?AUTO_4077 ?AUTO_4081 ) ( CLEAR ?AUTO_4077 ) ( HOLDING ?AUTO_4080 ) ( CLEAR ?AUTO_4076 ) )
    :subtasks
    ( ( !STACK ?AUTO_4080 ?AUTO_4076 )
      ( MAKE-ON ?AUTO_4073 ?AUTO_4074 )
      ( MAKE-ON-VERIFY ?AUTO_4073 ?AUTO_4074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4082 - BLOCK
      ?AUTO_4083 - BLOCK
    )
    :vars
    (
      ?AUTO_4084 - BLOCK
      ?AUTO_4086 - BLOCK
      ?AUTO_4087 - BLOCK
      ?AUTO_4090 - BLOCK
      ?AUTO_4085 - BLOCK
      ?AUTO_4089 - BLOCK
      ?AUTO_4088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4082 ?AUTO_4083 ) ) ( ON-TABLE ?AUTO_4082 ) ( not ( = ?AUTO_4082 ?AUTO_4084 ) ) ( not ( = ?AUTO_4083 ?AUTO_4084 ) ) ( ON ?AUTO_4084 ?AUTO_4082 ) ( not ( = ?AUTO_4082 ?AUTO_4086 ) ) ( not ( = ?AUTO_4082 ?AUTO_4087 ) ) ( not ( = ?AUTO_4083 ?AUTO_4086 ) ) ( not ( = ?AUTO_4083 ?AUTO_4087 ) ) ( not ( = ?AUTO_4084 ?AUTO_4086 ) ) ( not ( = ?AUTO_4084 ?AUTO_4087 ) ) ( not ( = ?AUTO_4086 ?AUTO_4087 ) ) ( not ( = ?AUTO_4082 ?AUTO_4090 ) ) ( not ( = ?AUTO_4083 ?AUTO_4090 ) ) ( not ( = ?AUTO_4084 ?AUTO_4090 ) ) ( not ( = ?AUTO_4086 ?AUTO_4090 ) ) ( not ( = ?AUTO_4087 ?AUTO_4090 ) ) ( CLEAR ?AUTO_4085 ) ( not ( = ?AUTO_4082 ?AUTO_4089 ) ) ( not ( = ?AUTO_4082 ?AUTO_4085 ) ) ( not ( = ?AUTO_4083 ?AUTO_4089 ) ) ( not ( = ?AUTO_4083 ?AUTO_4085 ) ) ( not ( = ?AUTO_4084 ?AUTO_4089 ) ) ( not ( = ?AUTO_4084 ?AUTO_4085 ) ) ( not ( = ?AUTO_4086 ?AUTO_4089 ) ) ( not ( = ?AUTO_4086 ?AUTO_4085 ) ) ( not ( = ?AUTO_4087 ?AUTO_4089 ) ) ( not ( = ?AUTO_4087 ?AUTO_4085 ) ) ( not ( = ?AUTO_4090 ?AUTO_4089 ) ) ( not ( = ?AUTO_4090 ?AUTO_4085 ) ) ( not ( = ?AUTO_4089 ?AUTO_4085 ) ) ( ON ?AUTO_4089 ?AUTO_4083 ) ( not ( = ?AUTO_4082 ?AUTO_4088 ) ) ( not ( = ?AUTO_4083 ?AUTO_4088 ) ) ( not ( = ?AUTO_4084 ?AUTO_4088 ) ) ( not ( = ?AUTO_4086 ?AUTO_4088 ) ) ( not ( = ?AUTO_4087 ?AUTO_4088 ) ) ( not ( = ?AUTO_4090 ?AUTO_4088 ) ) ( not ( = ?AUTO_4085 ?AUTO_4088 ) ) ( not ( = ?AUTO_4089 ?AUTO_4088 ) ) ( ON ?AUTO_4088 ?AUTO_4089 ) ( ON ?AUTO_4090 ?AUTO_4088 ) ( ON ?AUTO_4086 ?AUTO_4090 ) ( CLEAR ?AUTO_4086 ) ( CLEAR ?AUTO_4084 ) ( ON-TABLE ?AUTO_4087 ) ( CLEAR ?AUTO_4087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4087 )
      ( MAKE-ON ?AUTO_4082 ?AUTO_4083 )
      ( MAKE-ON-VERIFY ?AUTO_4082 ?AUTO_4083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4091 - BLOCK
      ?AUTO_4092 - BLOCK
    )
    :vars
    (
      ?AUTO_4098 - BLOCK
      ?AUTO_4099 - BLOCK
      ?AUTO_4093 - BLOCK
      ?AUTO_4095 - BLOCK
      ?AUTO_4097 - BLOCK
      ?AUTO_4094 - BLOCK
      ?AUTO_4096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4091 ?AUTO_4092 ) ) ( ON-TABLE ?AUTO_4091 ) ( not ( = ?AUTO_4091 ?AUTO_4098 ) ) ( not ( = ?AUTO_4092 ?AUTO_4098 ) ) ( not ( = ?AUTO_4091 ?AUTO_4099 ) ) ( not ( = ?AUTO_4091 ?AUTO_4093 ) ) ( not ( = ?AUTO_4092 ?AUTO_4099 ) ) ( not ( = ?AUTO_4092 ?AUTO_4093 ) ) ( not ( = ?AUTO_4098 ?AUTO_4099 ) ) ( not ( = ?AUTO_4098 ?AUTO_4093 ) ) ( not ( = ?AUTO_4099 ?AUTO_4093 ) ) ( not ( = ?AUTO_4091 ?AUTO_4095 ) ) ( not ( = ?AUTO_4092 ?AUTO_4095 ) ) ( not ( = ?AUTO_4098 ?AUTO_4095 ) ) ( not ( = ?AUTO_4099 ?AUTO_4095 ) ) ( not ( = ?AUTO_4093 ?AUTO_4095 ) ) ( CLEAR ?AUTO_4097 ) ( not ( = ?AUTO_4091 ?AUTO_4094 ) ) ( not ( = ?AUTO_4091 ?AUTO_4097 ) ) ( not ( = ?AUTO_4092 ?AUTO_4094 ) ) ( not ( = ?AUTO_4092 ?AUTO_4097 ) ) ( not ( = ?AUTO_4098 ?AUTO_4094 ) ) ( not ( = ?AUTO_4098 ?AUTO_4097 ) ) ( not ( = ?AUTO_4099 ?AUTO_4094 ) ) ( not ( = ?AUTO_4099 ?AUTO_4097 ) ) ( not ( = ?AUTO_4093 ?AUTO_4094 ) ) ( not ( = ?AUTO_4093 ?AUTO_4097 ) ) ( not ( = ?AUTO_4095 ?AUTO_4094 ) ) ( not ( = ?AUTO_4095 ?AUTO_4097 ) ) ( not ( = ?AUTO_4094 ?AUTO_4097 ) ) ( ON ?AUTO_4094 ?AUTO_4092 ) ( not ( = ?AUTO_4091 ?AUTO_4096 ) ) ( not ( = ?AUTO_4092 ?AUTO_4096 ) ) ( not ( = ?AUTO_4098 ?AUTO_4096 ) ) ( not ( = ?AUTO_4099 ?AUTO_4096 ) ) ( not ( = ?AUTO_4093 ?AUTO_4096 ) ) ( not ( = ?AUTO_4095 ?AUTO_4096 ) ) ( not ( = ?AUTO_4097 ?AUTO_4096 ) ) ( not ( = ?AUTO_4094 ?AUTO_4096 ) ) ( ON ?AUTO_4096 ?AUTO_4094 ) ( ON ?AUTO_4095 ?AUTO_4096 ) ( ON ?AUTO_4099 ?AUTO_4095 ) ( CLEAR ?AUTO_4099 ) ( ON-TABLE ?AUTO_4093 ) ( CLEAR ?AUTO_4093 ) ( HOLDING ?AUTO_4098 ) ( CLEAR ?AUTO_4091 ) )
    :subtasks
    ( ( !STACK ?AUTO_4098 ?AUTO_4091 )
      ( MAKE-ON ?AUTO_4091 ?AUTO_4092 )
      ( MAKE-ON-VERIFY ?AUTO_4091 ?AUTO_4092 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4100 - BLOCK
      ?AUTO_4101 - BLOCK
    )
    :vars
    (
      ?AUTO_4103 - BLOCK
      ?AUTO_4102 - BLOCK
      ?AUTO_4108 - BLOCK
      ?AUTO_4104 - BLOCK
      ?AUTO_4106 - BLOCK
      ?AUTO_4105 - BLOCK
      ?AUTO_4107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4100 ?AUTO_4101 ) ) ( ON-TABLE ?AUTO_4100 ) ( not ( = ?AUTO_4100 ?AUTO_4103 ) ) ( not ( = ?AUTO_4101 ?AUTO_4103 ) ) ( not ( = ?AUTO_4100 ?AUTO_4102 ) ) ( not ( = ?AUTO_4100 ?AUTO_4108 ) ) ( not ( = ?AUTO_4101 ?AUTO_4102 ) ) ( not ( = ?AUTO_4101 ?AUTO_4108 ) ) ( not ( = ?AUTO_4103 ?AUTO_4102 ) ) ( not ( = ?AUTO_4103 ?AUTO_4108 ) ) ( not ( = ?AUTO_4102 ?AUTO_4108 ) ) ( not ( = ?AUTO_4100 ?AUTO_4104 ) ) ( not ( = ?AUTO_4101 ?AUTO_4104 ) ) ( not ( = ?AUTO_4103 ?AUTO_4104 ) ) ( not ( = ?AUTO_4102 ?AUTO_4104 ) ) ( not ( = ?AUTO_4108 ?AUTO_4104 ) ) ( CLEAR ?AUTO_4106 ) ( not ( = ?AUTO_4100 ?AUTO_4105 ) ) ( not ( = ?AUTO_4100 ?AUTO_4106 ) ) ( not ( = ?AUTO_4101 ?AUTO_4105 ) ) ( not ( = ?AUTO_4101 ?AUTO_4106 ) ) ( not ( = ?AUTO_4103 ?AUTO_4105 ) ) ( not ( = ?AUTO_4103 ?AUTO_4106 ) ) ( not ( = ?AUTO_4102 ?AUTO_4105 ) ) ( not ( = ?AUTO_4102 ?AUTO_4106 ) ) ( not ( = ?AUTO_4108 ?AUTO_4105 ) ) ( not ( = ?AUTO_4108 ?AUTO_4106 ) ) ( not ( = ?AUTO_4104 ?AUTO_4105 ) ) ( not ( = ?AUTO_4104 ?AUTO_4106 ) ) ( not ( = ?AUTO_4105 ?AUTO_4106 ) ) ( ON ?AUTO_4105 ?AUTO_4101 ) ( not ( = ?AUTO_4100 ?AUTO_4107 ) ) ( not ( = ?AUTO_4101 ?AUTO_4107 ) ) ( not ( = ?AUTO_4103 ?AUTO_4107 ) ) ( not ( = ?AUTO_4102 ?AUTO_4107 ) ) ( not ( = ?AUTO_4108 ?AUTO_4107 ) ) ( not ( = ?AUTO_4104 ?AUTO_4107 ) ) ( not ( = ?AUTO_4106 ?AUTO_4107 ) ) ( not ( = ?AUTO_4105 ?AUTO_4107 ) ) ( ON ?AUTO_4107 ?AUTO_4105 ) ( ON ?AUTO_4104 ?AUTO_4107 ) ( ON ?AUTO_4102 ?AUTO_4104 ) ( CLEAR ?AUTO_4102 ) ( ON-TABLE ?AUTO_4108 ) ( CLEAR ?AUTO_4100 ) ( ON ?AUTO_4103 ?AUTO_4108 ) ( CLEAR ?AUTO_4103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4103 ?AUTO_4108 )
      ( MAKE-ON ?AUTO_4100 ?AUTO_4101 )
      ( MAKE-ON-VERIFY ?AUTO_4100 ?AUTO_4101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4115 - BLOCK
      ?AUTO_4116 - BLOCK
    )
    :vars
    (
      ?AUTO_4118 - BLOCK
      ?AUTO_4121 - BLOCK
      ?AUTO_4119 - BLOCK
      ?AUTO_4123 - BLOCK
      ?AUTO_4120 - BLOCK
      ?AUTO_4122 - BLOCK
      ?AUTO_4117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4115 ?AUTO_4116 ) ) ( ON-TABLE ?AUTO_4115 ) ( not ( = ?AUTO_4115 ?AUTO_4118 ) ) ( not ( = ?AUTO_4116 ?AUTO_4118 ) ) ( not ( = ?AUTO_4115 ?AUTO_4121 ) ) ( not ( = ?AUTO_4115 ?AUTO_4119 ) ) ( not ( = ?AUTO_4116 ?AUTO_4121 ) ) ( not ( = ?AUTO_4116 ?AUTO_4119 ) ) ( not ( = ?AUTO_4118 ?AUTO_4121 ) ) ( not ( = ?AUTO_4118 ?AUTO_4119 ) ) ( not ( = ?AUTO_4121 ?AUTO_4119 ) ) ( not ( = ?AUTO_4115 ?AUTO_4123 ) ) ( not ( = ?AUTO_4116 ?AUTO_4123 ) ) ( not ( = ?AUTO_4118 ?AUTO_4123 ) ) ( not ( = ?AUTO_4121 ?AUTO_4123 ) ) ( not ( = ?AUTO_4119 ?AUTO_4123 ) ) ( not ( = ?AUTO_4115 ?AUTO_4120 ) ) ( not ( = ?AUTO_4115 ?AUTO_4122 ) ) ( not ( = ?AUTO_4116 ?AUTO_4120 ) ) ( not ( = ?AUTO_4116 ?AUTO_4122 ) ) ( not ( = ?AUTO_4118 ?AUTO_4120 ) ) ( not ( = ?AUTO_4118 ?AUTO_4122 ) ) ( not ( = ?AUTO_4121 ?AUTO_4120 ) ) ( not ( = ?AUTO_4121 ?AUTO_4122 ) ) ( not ( = ?AUTO_4119 ?AUTO_4120 ) ) ( not ( = ?AUTO_4119 ?AUTO_4122 ) ) ( not ( = ?AUTO_4123 ?AUTO_4120 ) ) ( not ( = ?AUTO_4123 ?AUTO_4122 ) ) ( not ( = ?AUTO_4120 ?AUTO_4122 ) ) ( ON ?AUTO_4120 ?AUTO_4116 ) ( not ( = ?AUTO_4115 ?AUTO_4117 ) ) ( not ( = ?AUTO_4116 ?AUTO_4117 ) ) ( not ( = ?AUTO_4118 ?AUTO_4117 ) ) ( not ( = ?AUTO_4121 ?AUTO_4117 ) ) ( not ( = ?AUTO_4119 ?AUTO_4117 ) ) ( not ( = ?AUTO_4123 ?AUTO_4117 ) ) ( not ( = ?AUTO_4122 ?AUTO_4117 ) ) ( not ( = ?AUTO_4120 ?AUTO_4117 ) ) ( ON ?AUTO_4117 ?AUTO_4120 ) ( ON ?AUTO_4123 ?AUTO_4117 ) ( ON ?AUTO_4121 ?AUTO_4123 ) ( CLEAR ?AUTO_4121 ) ( ON-TABLE ?AUTO_4119 ) ( CLEAR ?AUTO_4119 ) ( CLEAR ?AUTO_4115 ) ( ON ?AUTO_4118 ?AUTO_4122 ) ( CLEAR ?AUTO_4118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4118 ?AUTO_4122 )
      ( MAKE-ON ?AUTO_4115 ?AUTO_4116 )
      ( MAKE-ON-VERIFY ?AUTO_4115 ?AUTO_4116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6204 - BLOCK
      ?AUTO_6205 - BLOCK
    )
    :vars
    (
      ?AUTO_6206 - BLOCK
      ?AUTO_6207 - BLOCK
      ?AUTO_6208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6204 ?AUTO_6205 ) ) ( ON ?AUTO_6204 ?AUTO_6206 ) ( not ( = ?AUTO_6204 ?AUTO_6206 ) ) ( not ( = ?AUTO_6205 ?AUTO_6206 ) ) ( not ( = ?AUTO_6204 ?AUTO_6207 ) ) ( not ( = ?AUTO_6205 ?AUTO_6207 ) ) ( not ( = ?AUTO_6206 ?AUTO_6207 ) ) ( ON ?AUTO_6207 ?AUTO_6204 ) ( CLEAR ?AUTO_6207 ) ( HOLDING ?AUTO_6205 ) ( CLEAR ?AUTO_6208 ) ( not ( = ?AUTO_6204 ?AUTO_6208 ) ) ( not ( = ?AUTO_6205 ?AUTO_6208 ) ) ( not ( = ?AUTO_6206 ?AUTO_6208 ) ) ( not ( = ?AUTO_6207 ?AUTO_6208 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6205 ?AUTO_6208 )
      ( MAKE-ON ?AUTO_6204 ?AUTO_6205 )
      ( MAKE-ON-VERIFY ?AUTO_6204 ?AUTO_6205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4559 - BLOCK
      ?AUTO_4560 - BLOCK
    )
    :vars
    (
      ?AUTO_4562 - BLOCK
      ?AUTO_4563 - BLOCK
      ?AUTO_4561 - BLOCK
      ?AUTO_4564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4559 ?AUTO_4560 ) ) ( not ( = ?AUTO_4559 ?AUTO_4562 ) ) ( not ( = ?AUTO_4560 ?AUTO_4562 ) ) ( ON ?AUTO_4562 ?AUTO_4560 ) ( ON ?AUTO_4559 ?AUTO_4562 ) ( CLEAR ?AUTO_4563 ) ( not ( = ?AUTO_4559 ?AUTO_4561 ) ) ( not ( = ?AUTO_4559 ?AUTO_4563 ) ) ( not ( = ?AUTO_4560 ?AUTO_4561 ) ) ( not ( = ?AUTO_4560 ?AUTO_4563 ) ) ( not ( = ?AUTO_4562 ?AUTO_4561 ) ) ( not ( = ?AUTO_4562 ?AUTO_4563 ) ) ( not ( = ?AUTO_4561 ?AUTO_4563 ) ) ( ON ?AUTO_4561 ?AUTO_4559 ) ( not ( = ?AUTO_4559 ?AUTO_4564 ) ) ( not ( = ?AUTO_4560 ?AUTO_4564 ) ) ( not ( = ?AUTO_4562 ?AUTO_4564 ) ) ( not ( = ?AUTO_4563 ?AUTO_4564 ) ) ( not ( = ?AUTO_4561 ?AUTO_4564 ) ) ( ON ?AUTO_4564 ?AUTO_4561 ) ( CLEAR ?AUTO_4564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4564 ?AUTO_4561 )
      ( MAKE-ON ?AUTO_4559 ?AUTO_4560 )
      ( MAKE-ON-VERIFY ?AUTO_4559 ?AUTO_4560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5404 - BLOCK
      ?AUTO_5405 - BLOCK
    )
    :vars
    (
      ?AUTO_5407 - BLOCK
      ?AUTO_5406 - BLOCK
      ?AUTO_5408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5404 ?AUTO_5405 ) ) ( ON ?AUTO_5404 ?AUTO_5407 ) ( not ( = ?AUTO_5404 ?AUTO_5407 ) ) ( not ( = ?AUTO_5405 ?AUTO_5407 ) ) ( ON ?AUTO_5405 ?AUTO_5404 ) ( not ( = ?AUTO_5404 ?AUTO_5406 ) ) ( not ( = ?AUTO_5405 ?AUTO_5406 ) ) ( not ( = ?AUTO_5407 ?AUTO_5406 ) ) ( ON ?AUTO_5406 ?AUTO_5405 ) ( CLEAR ?AUTO_5406 ) ( HOLDING ?AUTO_5408 ) ( not ( = ?AUTO_5404 ?AUTO_5408 ) ) ( not ( = ?AUTO_5405 ?AUTO_5408 ) ) ( not ( = ?AUTO_5407 ?AUTO_5408 ) ) ( not ( = ?AUTO_5406 ?AUTO_5408 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5408 )
      ( MAKE-ON ?AUTO_5404 ?AUTO_5405 )
      ( MAKE-ON-VERIFY ?AUTO_5404 ?AUTO_5405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5076 - BLOCK
      ?AUTO_5077 - BLOCK
    )
    :vars
    (
      ?AUTO_5079 - BLOCK
      ?AUTO_5078 - BLOCK
      ?AUTO_5080 - BLOCK
      ?AUTO_5081 - BLOCK
      ?AUTO_5082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5076 ?AUTO_5077 ) ) ( ON ?AUTO_5076 ?AUTO_5079 ) ( CLEAR ?AUTO_5076 ) ( not ( = ?AUTO_5076 ?AUTO_5079 ) ) ( not ( = ?AUTO_5077 ?AUTO_5079 ) ) ( not ( = ?AUTO_5076 ?AUTO_5078 ) ) ( not ( = ?AUTO_5077 ?AUTO_5078 ) ) ( not ( = ?AUTO_5079 ?AUTO_5078 ) ) ( ON ?AUTO_5078 ?AUTO_5077 ) ( not ( = ?AUTO_5076 ?AUTO_5080 ) ) ( not ( = ?AUTO_5077 ?AUTO_5080 ) ) ( not ( = ?AUTO_5079 ?AUTO_5080 ) ) ( not ( = ?AUTO_5078 ?AUTO_5080 ) ) ( ON ?AUTO_5080 ?AUTO_5078 ) ( CLEAR ?AUTO_5080 ) ( HOLDING ?AUTO_5081 ) ( CLEAR ?AUTO_5082 ) ( not ( = ?AUTO_5076 ?AUTO_5081 ) ) ( not ( = ?AUTO_5076 ?AUTO_5082 ) ) ( not ( = ?AUTO_5077 ?AUTO_5081 ) ) ( not ( = ?AUTO_5077 ?AUTO_5082 ) ) ( not ( = ?AUTO_5079 ?AUTO_5081 ) ) ( not ( = ?AUTO_5079 ?AUTO_5082 ) ) ( not ( = ?AUTO_5078 ?AUTO_5081 ) ) ( not ( = ?AUTO_5078 ?AUTO_5082 ) ) ( not ( = ?AUTO_5080 ?AUTO_5081 ) ) ( not ( = ?AUTO_5080 ?AUTO_5082 ) ) ( not ( = ?AUTO_5081 ?AUTO_5082 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5081 ?AUTO_5082 )
      ( MAKE-ON ?AUTO_5076 ?AUTO_5077 )
      ( MAKE-ON-VERIFY ?AUTO_5076 ?AUTO_5077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4751 - BLOCK
      ?AUTO_4752 - BLOCK
    )
    :vars
    (
      ?AUTO_4753 - BLOCK
      ?AUTO_4758 - BLOCK
      ?AUTO_4756 - BLOCK
      ?AUTO_4754 - BLOCK
      ?AUTO_4757 - BLOCK
      ?AUTO_4755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4751 ?AUTO_4752 ) ) ( ON ?AUTO_4751 ?AUTO_4753 ) ( not ( = ?AUTO_4751 ?AUTO_4753 ) ) ( not ( = ?AUTO_4752 ?AUTO_4753 ) ) ( not ( = ?AUTO_4751 ?AUTO_4758 ) ) ( not ( = ?AUTO_4751 ?AUTO_4756 ) ) ( not ( = ?AUTO_4752 ?AUTO_4758 ) ) ( not ( = ?AUTO_4752 ?AUTO_4756 ) ) ( not ( = ?AUTO_4753 ?AUTO_4758 ) ) ( not ( = ?AUTO_4753 ?AUTO_4756 ) ) ( not ( = ?AUTO_4758 ?AUTO_4756 ) ) ( ON ?AUTO_4758 ?AUTO_4752 ) ( not ( = ?AUTO_4751 ?AUTO_4754 ) ) ( not ( = ?AUTO_4752 ?AUTO_4754 ) ) ( not ( = ?AUTO_4753 ?AUTO_4754 ) ) ( not ( = ?AUTO_4756 ?AUTO_4754 ) ) ( not ( = ?AUTO_4758 ?AUTO_4754 ) ) ( ON ?AUTO_4754 ?AUTO_4758 ) ( CLEAR ?AUTO_4757 ) ( not ( = ?AUTO_4751 ?AUTO_4755 ) ) ( not ( = ?AUTO_4751 ?AUTO_4757 ) ) ( not ( = ?AUTO_4752 ?AUTO_4755 ) ) ( not ( = ?AUTO_4752 ?AUTO_4757 ) ) ( not ( = ?AUTO_4753 ?AUTO_4755 ) ) ( not ( = ?AUTO_4753 ?AUTO_4757 ) ) ( not ( = ?AUTO_4756 ?AUTO_4755 ) ) ( not ( = ?AUTO_4756 ?AUTO_4757 ) ) ( not ( = ?AUTO_4758 ?AUTO_4755 ) ) ( not ( = ?AUTO_4758 ?AUTO_4757 ) ) ( not ( = ?AUTO_4754 ?AUTO_4755 ) ) ( not ( = ?AUTO_4754 ?AUTO_4757 ) ) ( not ( = ?AUTO_4755 ?AUTO_4757 ) ) ( ON ?AUTO_4755 ?AUTO_4751 ) ( CLEAR ?AUTO_4755 ) ( ON ?AUTO_4756 ?AUTO_4754 ) ( CLEAR ?AUTO_4756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4756 ?AUTO_4754 )
      ( MAKE-ON ?AUTO_4751 ?AUTO_4752 )
      ( MAKE-ON-VERIFY ?AUTO_4751 ?AUTO_4752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6100 - BLOCK
      ?AUTO_6101 - BLOCK
    )
    :vars
    (
      ?AUTO_6102 - BLOCK
      ?AUTO_6103 - BLOCK
      ?AUTO_6104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6100 ?AUTO_6101 ) ) ( ON-TABLE ?AUTO_6100 ) ( not ( = ?AUTO_6100 ?AUTO_6102 ) ) ( not ( = ?AUTO_6100 ?AUTO_6103 ) ) ( not ( = ?AUTO_6101 ?AUTO_6102 ) ) ( not ( = ?AUTO_6101 ?AUTO_6103 ) ) ( not ( = ?AUTO_6102 ?AUTO_6103 ) ) ( ON ?AUTO_6102 ?AUTO_6100 ) ( CLEAR ?AUTO_6102 ) ( ON ?AUTO_6103 ?AUTO_6101 ) ( CLEAR ?AUTO_6103 ) ( HOLDING ?AUTO_6104 ) ( not ( = ?AUTO_6100 ?AUTO_6104 ) ) ( not ( = ?AUTO_6101 ?AUTO_6104 ) ) ( not ( = ?AUTO_6102 ?AUTO_6104 ) ) ( not ( = ?AUTO_6103 ?AUTO_6104 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6104 )
      ( MAKE-ON ?AUTO_6100 ?AUTO_6101 )
      ( MAKE-ON-VERIFY ?AUTO_6100 ?AUTO_6101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6105 - BLOCK
      ?AUTO_6106 - BLOCK
    )
    :vars
    (
      ?AUTO_6109 - BLOCK
      ?AUTO_6107 - BLOCK
      ?AUTO_6108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6105 ?AUTO_6106 ) ) ( ON-TABLE ?AUTO_6105 ) ( not ( = ?AUTO_6105 ?AUTO_6109 ) ) ( not ( = ?AUTO_6105 ?AUTO_6107 ) ) ( not ( = ?AUTO_6106 ?AUTO_6109 ) ) ( not ( = ?AUTO_6106 ?AUTO_6107 ) ) ( not ( = ?AUTO_6109 ?AUTO_6107 ) ) ( ON ?AUTO_6109 ?AUTO_6105 ) ( CLEAR ?AUTO_6109 ) ( ON ?AUTO_6107 ?AUTO_6106 ) ( not ( = ?AUTO_6105 ?AUTO_6108 ) ) ( not ( = ?AUTO_6106 ?AUTO_6108 ) ) ( not ( = ?AUTO_6109 ?AUTO_6108 ) ) ( not ( = ?AUTO_6107 ?AUTO_6108 ) ) ( ON ?AUTO_6108 ?AUTO_6107 ) ( CLEAR ?AUTO_6108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6108 ?AUTO_6107 )
      ( MAKE-ON ?AUTO_6105 ?AUTO_6106 )
      ( MAKE-ON-VERIFY ?AUTO_6105 ?AUTO_6106 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5043 - BLOCK
    )
    :vars
    (
      ?AUTO_5047 - BLOCK
      ?AUTO_5046 - BLOCK
      ?AUTO_5048 - BLOCK
      ?AUTO_5045 - BLOCK
      ?AUTO_5044 - BLOCK
      ?AUTO_5049 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5043 ?AUTO_5047 ) ( not ( = ?AUTO_5043 ?AUTO_5047 ) ) ( not ( = ?AUTO_5043 ?AUTO_5046 ) ) ( not ( = ?AUTO_5047 ?AUTO_5046 ) ) ( ON ?AUTO_5046 ?AUTO_5043 ) ( CLEAR ?AUTO_5048 ) ( not ( = ?AUTO_5043 ?AUTO_5045 ) ) ( not ( = ?AUTO_5043 ?AUTO_5048 ) ) ( not ( = ?AUTO_5047 ?AUTO_5045 ) ) ( not ( = ?AUTO_5047 ?AUTO_5048 ) ) ( not ( = ?AUTO_5046 ?AUTO_5045 ) ) ( not ( = ?AUTO_5046 ?AUTO_5048 ) ) ( not ( = ?AUTO_5045 ?AUTO_5048 ) ) ( ON ?AUTO_5045 ?AUTO_5046 ) ( not ( = ?AUTO_5043 ?AUTO_5044 ) ) ( not ( = ?AUTO_5047 ?AUTO_5044 ) ) ( not ( = ?AUTO_5046 ?AUTO_5044 ) ) ( not ( = ?AUTO_5048 ?AUTO_5044 ) ) ( not ( = ?AUTO_5045 ?AUTO_5044 ) ) ( ON ?AUTO_5044 ?AUTO_5045 ) ( CLEAR ?AUTO_5044 ) ( HOLDING ?AUTO_5049 ) ( not ( = ?AUTO_5043 ?AUTO_5049 ) ) ( not ( = ?AUTO_5047 ?AUTO_5049 ) ) ( not ( = ?AUTO_5046 ?AUTO_5049 ) ) ( not ( = ?AUTO_5048 ?AUTO_5049 ) ) ( not ( = ?AUTO_5045 ?AUTO_5049 ) ) ( not ( = ?AUTO_5044 ?AUTO_5049 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5049 )
      ( MAKE-ON-TABLE ?AUTO_5043 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5110 - BLOCK
      ?AUTO_5111 - BLOCK
    )
    :vars
    (
      ?AUTO_5112 - BLOCK
      ?AUTO_5116 - BLOCK
      ?AUTO_5117 - BLOCK
      ?AUTO_5115 - BLOCK
      ?AUTO_5113 - BLOCK
      ?AUTO_5114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5110 ?AUTO_5111 ) ) ( ON ?AUTO_5110 ?AUTO_5112 ) ( CLEAR ?AUTO_5110 ) ( not ( = ?AUTO_5110 ?AUTO_5112 ) ) ( not ( = ?AUTO_5111 ?AUTO_5112 ) ) ( not ( = ?AUTO_5110 ?AUTO_5116 ) ) ( not ( = ?AUTO_5111 ?AUTO_5116 ) ) ( not ( = ?AUTO_5112 ?AUTO_5116 ) ) ( ON ?AUTO_5116 ?AUTO_5111 ) ( not ( = ?AUTO_5110 ?AUTO_5117 ) ) ( not ( = ?AUTO_5111 ?AUTO_5117 ) ) ( not ( = ?AUTO_5112 ?AUTO_5117 ) ) ( not ( = ?AUTO_5116 ?AUTO_5117 ) ) ( ON ?AUTO_5117 ?AUTO_5116 ) ( not ( = ?AUTO_5110 ?AUTO_5115 ) ) ( not ( = ?AUTO_5110 ?AUTO_5113 ) ) ( not ( = ?AUTO_5111 ?AUTO_5115 ) ) ( not ( = ?AUTO_5111 ?AUTO_5113 ) ) ( not ( = ?AUTO_5112 ?AUTO_5115 ) ) ( not ( = ?AUTO_5112 ?AUTO_5113 ) ) ( not ( = ?AUTO_5116 ?AUTO_5115 ) ) ( not ( = ?AUTO_5116 ?AUTO_5113 ) ) ( not ( = ?AUTO_5117 ?AUTO_5115 ) ) ( not ( = ?AUTO_5117 ?AUTO_5113 ) ) ( not ( = ?AUTO_5115 ?AUTO_5113 ) ) ( ON ?AUTO_5115 ?AUTO_5117 ) ( not ( = ?AUTO_5110 ?AUTO_5114 ) ) ( not ( = ?AUTO_5111 ?AUTO_5114 ) ) ( not ( = ?AUTO_5112 ?AUTO_5114 ) ) ( not ( = ?AUTO_5116 ?AUTO_5114 ) ) ( not ( = ?AUTO_5117 ?AUTO_5114 ) ) ( not ( = ?AUTO_5113 ?AUTO_5114 ) ) ( not ( = ?AUTO_5115 ?AUTO_5114 ) ) ( ON ?AUTO_5114 ?AUTO_5115 ) ( CLEAR ?AUTO_5114 ) ( HOLDING ?AUTO_5113 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5113 )
      ( MAKE-ON ?AUTO_5110 ?AUTO_5111 )
      ( MAKE-ON-VERIFY ?AUTO_5110 ?AUTO_5111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5118 - BLOCK
      ?AUTO_5119 - BLOCK
    )
    :vars
    (
      ?AUTO_5122 - BLOCK
      ?AUTO_5123 - BLOCK
      ?AUTO_5121 - BLOCK
      ?AUTO_5120 - BLOCK
      ?AUTO_5125 - BLOCK
      ?AUTO_5124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5118 ?AUTO_5119 ) ) ( ON ?AUTO_5118 ?AUTO_5122 ) ( not ( = ?AUTO_5118 ?AUTO_5122 ) ) ( not ( = ?AUTO_5119 ?AUTO_5122 ) ) ( not ( = ?AUTO_5118 ?AUTO_5123 ) ) ( not ( = ?AUTO_5119 ?AUTO_5123 ) ) ( not ( = ?AUTO_5122 ?AUTO_5123 ) ) ( ON ?AUTO_5123 ?AUTO_5119 ) ( not ( = ?AUTO_5118 ?AUTO_5121 ) ) ( not ( = ?AUTO_5119 ?AUTO_5121 ) ) ( not ( = ?AUTO_5122 ?AUTO_5121 ) ) ( not ( = ?AUTO_5123 ?AUTO_5121 ) ) ( ON ?AUTO_5121 ?AUTO_5123 ) ( not ( = ?AUTO_5118 ?AUTO_5120 ) ) ( not ( = ?AUTO_5118 ?AUTO_5125 ) ) ( not ( = ?AUTO_5119 ?AUTO_5120 ) ) ( not ( = ?AUTO_5119 ?AUTO_5125 ) ) ( not ( = ?AUTO_5122 ?AUTO_5120 ) ) ( not ( = ?AUTO_5122 ?AUTO_5125 ) ) ( not ( = ?AUTO_5123 ?AUTO_5120 ) ) ( not ( = ?AUTO_5123 ?AUTO_5125 ) ) ( not ( = ?AUTO_5121 ?AUTO_5120 ) ) ( not ( = ?AUTO_5121 ?AUTO_5125 ) ) ( not ( = ?AUTO_5120 ?AUTO_5125 ) ) ( ON ?AUTO_5120 ?AUTO_5121 ) ( not ( = ?AUTO_5118 ?AUTO_5124 ) ) ( not ( = ?AUTO_5119 ?AUTO_5124 ) ) ( not ( = ?AUTO_5122 ?AUTO_5124 ) ) ( not ( = ?AUTO_5123 ?AUTO_5124 ) ) ( not ( = ?AUTO_5121 ?AUTO_5124 ) ) ( not ( = ?AUTO_5125 ?AUTO_5124 ) ) ( not ( = ?AUTO_5120 ?AUTO_5124 ) ) ( ON ?AUTO_5124 ?AUTO_5120 ) ( CLEAR ?AUTO_5124 ) ( ON ?AUTO_5125 ?AUTO_5118 ) ( CLEAR ?AUTO_5125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5125 ?AUTO_5118 )
      ( MAKE-ON ?AUTO_5118 ?AUTO_5119 )
      ( MAKE-ON-VERIFY ?AUTO_5118 ?AUTO_5119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5233 - BLOCK
      ?AUTO_5234 - BLOCK
    )
    :vars
    (
      ?AUTO_5237 - BLOCK
      ?AUTO_5236 - BLOCK
      ?AUTO_5235 - BLOCK
      ?AUTO_5238 - BLOCK
      ?AUTO_5239 - BLOCK
      ?AUTO_5240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5233 ?AUTO_5234 ) ) ( ON ?AUTO_5233 ?AUTO_5237 ) ( not ( = ?AUTO_5233 ?AUTO_5237 ) ) ( not ( = ?AUTO_5234 ?AUTO_5237 ) ) ( CLEAR ?AUTO_5236 ) ( not ( = ?AUTO_5233 ?AUTO_5235 ) ) ( not ( = ?AUTO_5233 ?AUTO_5236 ) ) ( not ( = ?AUTO_5234 ?AUTO_5235 ) ) ( not ( = ?AUTO_5234 ?AUTO_5236 ) ) ( not ( = ?AUTO_5237 ?AUTO_5235 ) ) ( not ( = ?AUTO_5237 ?AUTO_5236 ) ) ( not ( = ?AUTO_5235 ?AUTO_5236 ) ) ( ON ?AUTO_5235 ?AUTO_5233 ) ( CLEAR ?AUTO_5235 ) ( not ( = ?AUTO_5233 ?AUTO_5238 ) ) ( not ( = ?AUTO_5234 ?AUTO_5238 ) ) ( not ( = ?AUTO_5237 ?AUTO_5238 ) ) ( not ( = ?AUTO_5236 ?AUTO_5238 ) ) ( not ( = ?AUTO_5235 ?AUTO_5238 ) ) ( ON ?AUTO_5238 ?AUTO_5234 ) ( CLEAR ?AUTO_5238 ) ( HOLDING ?AUTO_5239 ) ( CLEAR ?AUTO_5240 ) ( not ( = ?AUTO_5233 ?AUTO_5239 ) ) ( not ( = ?AUTO_5233 ?AUTO_5240 ) ) ( not ( = ?AUTO_5234 ?AUTO_5239 ) ) ( not ( = ?AUTO_5234 ?AUTO_5240 ) ) ( not ( = ?AUTO_5237 ?AUTO_5239 ) ) ( not ( = ?AUTO_5237 ?AUTO_5240 ) ) ( not ( = ?AUTO_5236 ?AUTO_5239 ) ) ( not ( = ?AUTO_5236 ?AUTO_5240 ) ) ( not ( = ?AUTO_5235 ?AUTO_5239 ) ) ( not ( = ?AUTO_5235 ?AUTO_5240 ) ) ( not ( = ?AUTO_5238 ?AUTO_5239 ) ) ( not ( = ?AUTO_5238 ?AUTO_5240 ) ) ( not ( = ?AUTO_5239 ?AUTO_5240 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5239 ?AUTO_5240 )
      ( MAKE-ON ?AUTO_5233 ?AUTO_5234 )
      ( MAKE-ON-VERIFY ?AUTO_5233 ?AUTO_5234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5245 - BLOCK
      ?AUTO_5246 - BLOCK
    )
    :vars
    (
      ?AUTO_5248 - BLOCK
      ?AUTO_5250 - BLOCK
      ?AUTO_5251 - BLOCK
      ?AUTO_5249 - BLOCK
      ?AUTO_5252 - BLOCK
      ?AUTO_5247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5245 ?AUTO_5246 ) ) ( ON ?AUTO_5245 ?AUTO_5248 ) ( not ( = ?AUTO_5245 ?AUTO_5248 ) ) ( not ( = ?AUTO_5246 ?AUTO_5248 ) ) ( CLEAR ?AUTO_5250 ) ( not ( = ?AUTO_5245 ?AUTO_5251 ) ) ( not ( = ?AUTO_5245 ?AUTO_5250 ) ) ( not ( = ?AUTO_5246 ?AUTO_5251 ) ) ( not ( = ?AUTO_5246 ?AUTO_5250 ) ) ( not ( = ?AUTO_5248 ?AUTO_5251 ) ) ( not ( = ?AUTO_5248 ?AUTO_5250 ) ) ( not ( = ?AUTO_5251 ?AUTO_5250 ) ) ( ON ?AUTO_5251 ?AUTO_5245 ) ( CLEAR ?AUTO_5251 ) ( not ( = ?AUTO_5245 ?AUTO_5249 ) ) ( not ( = ?AUTO_5246 ?AUTO_5249 ) ) ( not ( = ?AUTO_5248 ?AUTO_5249 ) ) ( not ( = ?AUTO_5250 ?AUTO_5249 ) ) ( not ( = ?AUTO_5251 ?AUTO_5249 ) ) ( ON ?AUTO_5249 ?AUTO_5246 ) ( CLEAR ?AUTO_5252 ) ( not ( = ?AUTO_5245 ?AUTO_5247 ) ) ( not ( = ?AUTO_5245 ?AUTO_5252 ) ) ( not ( = ?AUTO_5246 ?AUTO_5247 ) ) ( not ( = ?AUTO_5246 ?AUTO_5252 ) ) ( not ( = ?AUTO_5248 ?AUTO_5247 ) ) ( not ( = ?AUTO_5248 ?AUTO_5252 ) ) ( not ( = ?AUTO_5250 ?AUTO_5247 ) ) ( not ( = ?AUTO_5250 ?AUTO_5252 ) ) ( not ( = ?AUTO_5251 ?AUTO_5247 ) ) ( not ( = ?AUTO_5251 ?AUTO_5252 ) ) ( not ( = ?AUTO_5249 ?AUTO_5247 ) ) ( not ( = ?AUTO_5249 ?AUTO_5252 ) ) ( not ( = ?AUTO_5247 ?AUTO_5252 ) ) ( ON ?AUTO_5247 ?AUTO_5249 ) ( CLEAR ?AUTO_5247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5247 ?AUTO_5249 )
      ( MAKE-ON ?AUTO_5245 ?AUTO_5246 )
      ( MAKE-ON-VERIFY ?AUTO_5245 ?AUTO_5246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5269 - BLOCK
      ?AUTO_5270 - BLOCK
    )
    :vars
    (
      ?AUTO_5272 - BLOCK
      ?AUTO_5275 - BLOCK
      ?AUTO_5276 - BLOCK
      ?AUTO_5274 - BLOCK
      ?AUTO_5271 - BLOCK
      ?AUTO_5273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5269 ?AUTO_5270 ) ) ( ON ?AUTO_5269 ?AUTO_5272 ) ( not ( = ?AUTO_5269 ?AUTO_5272 ) ) ( not ( = ?AUTO_5270 ?AUTO_5272 ) ) ( not ( = ?AUTO_5269 ?AUTO_5275 ) ) ( not ( = ?AUTO_5269 ?AUTO_5276 ) ) ( not ( = ?AUTO_5270 ?AUTO_5275 ) ) ( not ( = ?AUTO_5270 ?AUTO_5276 ) ) ( not ( = ?AUTO_5272 ?AUTO_5275 ) ) ( not ( = ?AUTO_5272 ?AUTO_5276 ) ) ( not ( = ?AUTO_5275 ?AUTO_5276 ) ) ( ON ?AUTO_5275 ?AUTO_5269 ) ( CLEAR ?AUTO_5275 ) ( not ( = ?AUTO_5269 ?AUTO_5274 ) ) ( not ( = ?AUTO_5270 ?AUTO_5274 ) ) ( not ( = ?AUTO_5272 ?AUTO_5274 ) ) ( not ( = ?AUTO_5276 ?AUTO_5274 ) ) ( not ( = ?AUTO_5275 ?AUTO_5274 ) ) ( ON ?AUTO_5274 ?AUTO_5270 ) ( not ( = ?AUTO_5269 ?AUTO_5271 ) ) ( not ( = ?AUTO_5269 ?AUTO_5273 ) ) ( not ( = ?AUTO_5270 ?AUTO_5271 ) ) ( not ( = ?AUTO_5270 ?AUTO_5273 ) ) ( not ( = ?AUTO_5272 ?AUTO_5271 ) ) ( not ( = ?AUTO_5272 ?AUTO_5273 ) ) ( not ( = ?AUTO_5276 ?AUTO_5271 ) ) ( not ( = ?AUTO_5276 ?AUTO_5273 ) ) ( not ( = ?AUTO_5275 ?AUTO_5271 ) ) ( not ( = ?AUTO_5275 ?AUTO_5273 ) ) ( not ( = ?AUTO_5274 ?AUTO_5271 ) ) ( not ( = ?AUTO_5274 ?AUTO_5273 ) ) ( not ( = ?AUTO_5271 ?AUTO_5273 ) ) ( ON ?AUTO_5271 ?AUTO_5274 ) ( ON ?AUTO_5273 ?AUTO_5271 ) ( CLEAR ?AUTO_5273 ) ( HOLDING ?AUTO_5276 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5276 )
      ( MAKE-ON ?AUTO_5269 ?AUTO_5270 )
      ( MAKE-ON-VERIFY ?AUTO_5269 ?AUTO_5270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5277 - BLOCK
      ?AUTO_5278 - BLOCK
    )
    :vars
    (
      ?AUTO_5279 - BLOCK
      ?AUTO_5282 - BLOCK
      ?AUTO_5280 - BLOCK
      ?AUTO_5284 - BLOCK
      ?AUTO_5283 - BLOCK
      ?AUTO_5281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5277 ?AUTO_5278 ) ) ( ON ?AUTO_5277 ?AUTO_5279 ) ( not ( = ?AUTO_5277 ?AUTO_5279 ) ) ( not ( = ?AUTO_5278 ?AUTO_5279 ) ) ( not ( = ?AUTO_5277 ?AUTO_5282 ) ) ( not ( = ?AUTO_5277 ?AUTO_5280 ) ) ( not ( = ?AUTO_5278 ?AUTO_5282 ) ) ( not ( = ?AUTO_5278 ?AUTO_5280 ) ) ( not ( = ?AUTO_5279 ?AUTO_5282 ) ) ( not ( = ?AUTO_5279 ?AUTO_5280 ) ) ( not ( = ?AUTO_5282 ?AUTO_5280 ) ) ( ON ?AUTO_5282 ?AUTO_5277 ) ( not ( = ?AUTO_5277 ?AUTO_5284 ) ) ( not ( = ?AUTO_5278 ?AUTO_5284 ) ) ( not ( = ?AUTO_5279 ?AUTO_5284 ) ) ( not ( = ?AUTO_5280 ?AUTO_5284 ) ) ( not ( = ?AUTO_5282 ?AUTO_5284 ) ) ( ON ?AUTO_5284 ?AUTO_5278 ) ( not ( = ?AUTO_5277 ?AUTO_5283 ) ) ( not ( = ?AUTO_5277 ?AUTO_5281 ) ) ( not ( = ?AUTO_5278 ?AUTO_5283 ) ) ( not ( = ?AUTO_5278 ?AUTO_5281 ) ) ( not ( = ?AUTO_5279 ?AUTO_5283 ) ) ( not ( = ?AUTO_5279 ?AUTO_5281 ) ) ( not ( = ?AUTO_5280 ?AUTO_5283 ) ) ( not ( = ?AUTO_5280 ?AUTO_5281 ) ) ( not ( = ?AUTO_5282 ?AUTO_5283 ) ) ( not ( = ?AUTO_5282 ?AUTO_5281 ) ) ( not ( = ?AUTO_5284 ?AUTO_5283 ) ) ( not ( = ?AUTO_5284 ?AUTO_5281 ) ) ( not ( = ?AUTO_5283 ?AUTO_5281 ) ) ( ON ?AUTO_5283 ?AUTO_5284 ) ( ON ?AUTO_5281 ?AUTO_5283 ) ( CLEAR ?AUTO_5281 ) ( ON ?AUTO_5280 ?AUTO_5282 ) ( CLEAR ?AUTO_5280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5280 ?AUTO_5282 )
      ( MAKE-ON ?AUTO_5277 ?AUTO_5278 )
      ( MAKE-ON-VERIFY ?AUTO_5277 ?AUTO_5278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5325 - BLOCK
      ?AUTO_5326 - BLOCK
    )
    :vars
    (
      ?AUTO_5329 - BLOCK
      ?AUTO_5327 - BLOCK
      ?AUTO_5328 - BLOCK
      ?AUTO_5330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5325 ?AUTO_5326 ) ) ( ON-TABLE ?AUTO_5325 ) ( not ( = ?AUTO_5325 ?AUTO_5329 ) ) ( not ( = ?AUTO_5325 ?AUTO_5327 ) ) ( not ( = ?AUTO_5326 ?AUTO_5329 ) ) ( not ( = ?AUTO_5326 ?AUTO_5327 ) ) ( not ( = ?AUTO_5329 ?AUTO_5327 ) ) ( ON ?AUTO_5329 ?AUTO_5325 ) ( CLEAR ?AUTO_5328 ) ( not ( = ?AUTO_5325 ?AUTO_5328 ) ) ( not ( = ?AUTO_5326 ?AUTO_5328 ) ) ( not ( = ?AUTO_5329 ?AUTO_5328 ) ) ( not ( = ?AUTO_5327 ?AUTO_5328 ) ) ( ON ?AUTO_5327 ?AUTO_5329 ) ( CLEAR ?AUTO_5327 ) ( HOLDING ?AUTO_5326 ) ( CLEAR ?AUTO_5330 ) ( not ( = ?AUTO_5325 ?AUTO_5330 ) ) ( not ( = ?AUTO_5326 ?AUTO_5330 ) ) ( not ( = ?AUTO_5329 ?AUTO_5330 ) ) ( not ( = ?AUTO_5327 ?AUTO_5330 ) ) ( not ( = ?AUTO_5328 ?AUTO_5330 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5326 ?AUTO_5330 )
      ( MAKE-ON ?AUTO_5325 ?AUTO_5326 )
      ( MAKE-ON-VERIFY ?AUTO_5325 ?AUTO_5326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6110 - BLOCK
      ?AUTO_6111 - BLOCK
    )
    :vars
    (
      ?AUTO_6114 - BLOCK
      ?AUTO_6112 - BLOCK
      ?AUTO_6113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6110 ?AUTO_6111 ) ) ( ON-TABLE ?AUTO_6110 ) ( not ( = ?AUTO_6110 ?AUTO_6114 ) ) ( not ( = ?AUTO_6110 ?AUTO_6112 ) ) ( not ( = ?AUTO_6111 ?AUTO_6114 ) ) ( not ( = ?AUTO_6111 ?AUTO_6112 ) ) ( not ( = ?AUTO_6114 ?AUTO_6112 ) ) ( ON ?AUTO_6112 ?AUTO_6111 ) ( not ( = ?AUTO_6110 ?AUTO_6113 ) ) ( not ( = ?AUTO_6111 ?AUTO_6113 ) ) ( not ( = ?AUTO_6114 ?AUTO_6113 ) ) ( not ( = ?AUTO_6112 ?AUTO_6113 ) ) ( ON ?AUTO_6113 ?AUTO_6112 ) ( CLEAR ?AUTO_6113 ) ( HOLDING ?AUTO_6114 ) ( CLEAR ?AUTO_6110 ) )
    :subtasks
    ( ( !STACK ?AUTO_6114 ?AUTO_6110 )
      ( MAKE-ON ?AUTO_6110 ?AUTO_6111 )
      ( MAKE-ON-VERIFY ?AUTO_6110 ?AUTO_6111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5945 - BLOCK
      ?AUTO_5946 - BLOCK
    )
    :vars
    (
      ?AUTO_5953 - BLOCK
      ?AUTO_5947 - BLOCK
      ?AUTO_5952 - BLOCK
      ?AUTO_5949 - BLOCK
      ?AUTO_5954 - BLOCK
      ?AUTO_5948 - BLOCK
      ?AUTO_5951 - BLOCK
      ?AUTO_5950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5945 ?AUTO_5946 ) ) ( ON-TABLE ?AUTO_5945 ) ( not ( = ?AUTO_5945 ?AUTO_5953 ) ) ( not ( = ?AUTO_5945 ?AUTO_5947 ) ) ( not ( = ?AUTO_5946 ?AUTO_5953 ) ) ( not ( = ?AUTO_5946 ?AUTO_5947 ) ) ( not ( = ?AUTO_5953 ?AUTO_5947 ) ) ( CLEAR ?AUTO_5952 ) ( not ( = ?AUTO_5945 ?AUTO_5952 ) ) ( not ( = ?AUTO_5946 ?AUTO_5952 ) ) ( not ( = ?AUTO_5953 ?AUTO_5952 ) ) ( not ( = ?AUTO_5947 ?AUTO_5952 ) ) ( ON ?AUTO_5947 ?AUTO_5946 ) ( not ( = ?AUTO_5945 ?AUTO_5949 ) ) ( not ( = ?AUTO_5946 ?AUTO_5949 ) ) ( not ( = ?AUTO_5953 ?AUTO_5949 ) ) ( not ( = ?AUTO_5947 ?AUTO_5949 ) ) ( not ( = ?AUTO_5952 ?AUTO_5949 ) ) ( ON ?AUTO_5949 ?AUTO_5947 ) ( ON ?AUTO_5953 ?AUTO_5949 ) ( CLEAR ?AUTO_5953 ) ( CLEAR ?AUTO_5954 ) ( not ( = ?AUTO_5945 ?AUTO_5948 ) ) ( not ( = ?AUTO_5945 ?AUTO_5954 ) ) ( not ( = ?AUTO_5946 ?AUTO_5948 ) ) ( not ( = ?AUTO_5946 ?AUTO_5954 ) ) ( not ( = ?AUTO_5953 ?AUTO_5948 ) ) ( not ( = ?AUTO_5953 ?AUTO_5954 ) ) ( not ( = ?AUTO_5947 ?AUTO_5948 ) ) ( not ( = ?AUTO_5947 ?AUTO_5954 ) ) ( not ( = ?AUTO_5952 ?AUTO_5948 ) ) ( not ( = ?AUTO_5952 ?AUTO_5954 ) ) ( not ( = ?AUTO_5949 ?AUTO_5948 ) ) ( not ( = ?AUTO_5949 ?AUTO_5954 ) ) ( not ( = ?AUTO_5948 ?AUTO_5954 ) ) ( ON ?AUTO_5948 ?AUTO_5945 ) ( not ( = ?AUTO_5945 ?AUTO_5951 ) ) ( not ( = ?AUTO_5946 ?AUTO_5951 ) ) ( not ( = ?AUTO_5953 ?AUTO_5951 ) ) ( not ( = ?AUTO_5947 ?AUTO_5951 ) ) ( not ( = ?AUTO_5952 ?AUTO_5951 ) ) ( not ( = ?AUTO_5949 ?AUTO_5951 ) ) ( not ( = ?AUTO_5954 ?AUTO_5951 ) ) ( not ( = ?AUTO_5948 ?AUTO_5951 ) ) ( ON ?AUTO_5951 ?AUTO_5948 ) ( not ( = ?AUTO_5945 ?AUTO_5950 ) ) ( not ( = ?AUTO_5946 ?AUTO_5950 ) ) ( not ( = ?AUTO_5953 ?AUTO_5950 ) ) ( not ( = ?AUTO_5947 ?AUTO_5950 ) ) ( not ( = ?AUTO_5952 ?AUTO_5950 ) ) ( not ( = ?AUTO_5949 ?AUTO_5950 ) ) ( not ( = ?AUTO_5954 ?AUTO_5950 ) ) ( not ( = ?AUTO_5948 ?AUTO_5950 ) ) ( not ( = ?AUTO_5951 ?AUTO_5950 ) ) ( ON ?AUTO_5950 ?AUTO_5951 ) ( CLEAR ?AUTO_5950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5950 ?AUTO_5951 )
      ( MAKE-ON ?AUTO_5945 ?AUTO_5946 )
      ( MAKE-ON-VERIFY ?AUTO_5945 ?AUTO_5946 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5955 - BLOCK
      ?AUTO_5956 - BLOCK
    )
    :vars
    (
      ?AUTO_5959 - BLOCK
      ?AUTO_5964 - BLOCK
      ?AUTO_5963 - BLOCK
      ?AUTO_5962 - BLOCK
      ?AUTO_5957 - BLOCK
      ?AUTO_5960 - BLOCK
      ?AUTO_5961 - BLOCK
      ?AUTO_5958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5955 ?AUTO_5956 ) ) ( ON-TABLE ?AUTO_5955 ) ( not ( = ?AUTO_5955 ?AUTO_5959 ) ) ( not ( = ?AUTO_5955 ?AUTO_5964 ) ) ( not ( = ?AUTO_5956 ?AUTO_5959 ) ) ( not ( = ?AUTO_5956 ?AUTO_5964 ) ) ( not ( = ?AUTO_5959 ?AUTO_5964 ) ) ( not ( = ?AUTO_5955 ?AUTO_5963 ) ) ( not ( = ?AUTO_5956 ?AUTO_5963 ) ) ( not ( = ?AUTO_5959 ?AUTO_5963 ) ) ( not ( = ?AUTO_5964 ?AUTO_5963 ) ) ( ON ?AUTO_5964 ?AUTO_5956 ) ( not ( = ?AUTO_5955 ?AUTO_5962 ) ) ( not ( = ?AUTO_5956 ?AUTO_5962 ) ) ( not ( = ?AUTO_5959 ?AUTO_5962 ) ) ( not ( = ?AUTO_5964 ?AUTO_5962 ) ) ( not ( = ?AUTO_5963 ?AUTO_5962 ) ) ( ON ?AUTO_5962 ?AUTO_5964 ) ( ON ?AUTO_5959 ?AUTO_5962 ) ( CLEAR ?AUTO_5959 ) ( CLEAR ?AUTO_5957 ) ( not ( = ?AUTO_5955 ?AUTO_5960 ) ) ( not ( = ?AUTO_5955 ?AUTO_5957 ) ) ( not ( = ?AUTO_5956 ?AUTO_5960 ) ) ( not ( = ?AUTO_5956 ?AUTO_5957 ) ) ( not ( = ?AUTO_5959 ?AUTO_5960 ) ) ( not ( = ?AUTO_5959 ?AUTO_5957 ) ) ( not ( = ?AUTO_5964 ?AUTO_5960 ) ) ( not ( = ?AUTO_5964 ?AUTO_5957 ) ) ( not ( = ?AUTO_5963 ?AUTO_5960 ) ) ( not ( = ?AUTO_5963 ?AUTO_5957 ) ) ( not ( = ?AUTO_5962 ?AUTO_5960 ) ) ( not ( = ?AUTO_5962 ?AUTO_5957 ) ) ( not ( = ?AUTO_5960 ?AUTO_5957 ) ) ( ON ?AUTO_5960 ?AUTO_5955 ) ( not ( = ?AUTO_5955 ?AUTO_5961 ) ) ( not ( = ?AUTO_5956 ?AUTO_5961 ) ) ( not ( = ?AUTO_5959 ?AUTO_5961 ) ) ( not ( = ?AUTO_5964 ?AUTO_5961 ) ) ( not ( = ?AUTO_5963 ?AUTO_5961 ) ) ( not ( = ?AUTO_5962 ?AUTO_5961 ) ) ( not ( = ?AUTO_5957 ?AUTO_5961 ) ) ( not ( = ?AUTO_5960 ?AUTO_5961 ) ) ( ON ?AUTO_5961 ?AUTO_5960 ) ( not ( = ?AUTO_5955 ?AUTO_5958 ) ) ( not ( = ?AUTO_5956 ?AUTO_5958 ) ) ( not ( = ?AUTO_5959 ?AUTO_5958 ) ) ( not ( = ?AUTO_5964 ?AUTO_5958 ) ) ( not ( = ?AUTO_5963 ?AUTO_5958 ) ) ( not ( = ?AUTO_5962 ?AUTO_5958 ) ) ( not ( = ?AUTO_5957 ?AUTO_5958 ) ) ( not ( = ?AUTO_5960 ?AUTO_5958 ) ) ( not ( = ?AUTO_5961 ?AUTO_5958 ) ) ( ON ?AUTO_5958 ?AUTO_5961 ) ( CLEAR ?AUTO_5958 ) ( HOLDING ?AUTO_5963 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5963 )
      ( MAKE-ON ?AUTO_5955 ?AUTO_5956 )
      ( MAKE-ON-VERIFY ?AUTO_5955 ?AUTO_5956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5965 - BLOCK
      ?AUTO_5966 - BLOCK
    )
    :vars
    (
      ?AUTO_5971 - BLOCK
      ?AUTO_5974 - BLOCK
      ?AUTO_5973 - BLOCK
      ?AUTO_5969 - BLOCK
      ?AUTO_5968 - BLOCK
      ?AUTO_5972 - BLOCK
      ?AUTO_5970 - BLOCK
      ?AUTO_5967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5965 ?AUTO_5966 ) ) ( ON-TABLE ?AUTO_5965 ) ( not ( = ?AUTO_5965 ?AUTO_5971 ) ) ( not ( = ?AUTO_5965 ?AUTO_5974 ) ) ( not ( = ?AUTO_5966 ?AUTO_5971 ) ) ( not ( = ?AUTO_5966 ?AUTO_5974 ) ) ( not ( = ?AUTO_5971 ?AUTO_5974 ) ) ( not ( = ?AUTO_5965 ?AUTO_5973 ) ) ( not ( = ?AUTO_5966 ?AUTO_5973 ) ) ( not ( = ?AUTO_5971 ?AUTO_5973 ) ) ( not ( = ?AUTO_5974 ?AUTO_5973 ) ) ( ON ?AUTO_5974 ?AUTO_5966 ) ( not ( = ?AUTO_5965 ?AUTO_5969 ) ) ( not ( = ?AUTO_5966 ?AUTO_5969 ) ) ( not ( = ?AUTO_5971 ?AUTO_5969 ) ) ( not ( = ?AUTO_5974 ?AUTO_5969 ) ) ( not ( = ?AUTO_5973 ?AUTO_5969 ) ) ( ON ?AUTO_5969 ?AUTO_5974 ) ( ON ?AUTO_5971 ?AUTO_5969 ) ( CLEAR ?AUTO_5971 ) ( CLEAR ?AUTO_5968 ) ( not ( = ?AUTO_5965 ?AUTO_5972 ) ) ( not ( = ?AUTO_5965 ?AUTO_5968 ) ) ( not ( = ?AUTO_5966 ?AUTO_5972 ) ) ( not ( = ?AUTO_5966 ?AUTO_5968 ) ) ( not ( = ?AUTO_5971 ?AUTO_5972 ) ) ( not ( = ?AUTO_5971 ?AUTO_5968 ) ) ( not ( = ?AUTO_5974 ?AUTO_5972 ) ) ( not ( = ?AUTO_5974 ?AUTO_5968 ) ) ( not ( = ?AUTO_5973 ?AUTO_5972 ) ) ( not ( = ?AUTO_5973 ?AUTO_5968 ) ) ( not ( = ?AUTO_5969 ?AUTO_5972 ) ) ( not ( = ?AUTO_5969 ?AUTO_5968 ) ) ( not ( = ?AUTO_5972 ?AUTO_5968 ) ) ( ON ?AUTO_5972 ?AUTO_5965 ) ( not ( = ?AUTO_5965 ?AUTO_5970 ) ) ( not ( = ?AUTO_5966 ?AUTO_5970 ) ) ( not ( = ?AUTO_5971 ?AUTO_5970 ) ) ( not ( = ?AUTO_5974 ?AUTO_5970 ) ) ( not ( = ?AUTO_5973 ?AUTO_5970 ) ) ( not ( = ?AUTO_5969 ?AUTO_5970 ) ) ( not ( = ?AUTO_5968 ?AUTO_5970 ) ) ( not ( = ?AUTO_5972 ?AUTO_5970 ) ) ( ON ?AUTO_5970 ?AUTO_5972 ) ( not ( = ?AUTO_5965 ?AUTO_5967 ) ) ( not ( = ?AUTO_5966 ?AUTO_5967 ) ) ( not ( = ?AUTO_5971 ?AUTO_5967 ) ) ( not ( = ?AUTO_5974 ?AUTO_5967 ) ) ( not ( = ?AUTO_5973 ?AUTO_5967 ) ) ( not ( = ?AUTO_5969 ?AUTO_5967 ) ) ( not ( = ?AUTO_5968 ?AUTO_5967 ) ) ( not ( = ?AUTO_5972 ?AUTO_5967 ) ) ( not ( = ?AUTO_5970 ?AUTO_5967 ) ) ( ON ?AUTO_5967 ?AUTO_5970 ) ( ON ?AUTO_5973 ?AUTO_5967 ) ( CLEAR ?AUTO_5973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5973 ?AUTO_5967 )
      ( MAKE-ON ?AUTO_5965 ?AUTO_5966 )
      ( MAKE-ON-VERIFY ?AUTO_5965 ?AUTO_5966 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6120 - BLOCK
      ?AUTO_6121 - BLOCK
    )
    :vars
    (
      ?AUTO_6124 - BLOCK
      ?AUTO_6122 - BLOCK
      ?AUTO_6123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6120 ?AUTO_6121 ) ) ( not ( = ?AUTO_6120 ?AUTO_6124 ) ) ( not ( = ?AUTO_6120 ?AUTO_6122 ) ) ( not ( = ?AUTO_6121 ?AUTO_6124 ) ) ( not ( = ?AUTO_6121 ?AUTO_6122 ) ) ( not ( = ?AUTO_6124 ?AUTO_6122 ) ) ( ON ?AUTO_6122 ?AUTO_6121 ) ( not ( = ?AUTO_6120 ?AUTO_6123 ) ) ( not ( = ?AUTO_6121 ?AUTO_6123 ) ) ( not ( = ?AUTO_6124 ?AUTO_6123 ) ) ( not ( = ?AUTO_6122 ?AUTO_6123 ) ) ( ON ?AUTO_6123 ?AUTO_6122 ) ( ON ?AUTO_6124 ?AUTO_6123 ) ( CLEAR ?AUTO_6124 ) ( HOLDING ?AUTO_6120 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6120 )
      ( MAKE-ON ?AUTO_6120 ?AUTO_6121 )
      ( MAKE-ON-VERIFY ?AUTO_6120 ?AUTO_6121 ) )
  )

)

