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
      ?AUTO_3 - BLOCK
    )
    :vars
    (
      ?AUTO_6 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3 ?AUTO_6 ) ( CLEAR ?AUTO_3 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3 ?AUTO_6 )
      ( MAKE-ON-TABLE ?AUTO_3 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10 - BLOCK
    )
    :vars
    (
      ?AUTO_13 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10 ?AUTO_13 ) ( CLEAR ?AUTO_10 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10 ?AUTO_13 )
      ( MAKE-ON-TABLE ?AUTO_10 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_14 - BLOCK
    )
    :vars
    (
      ?AUTO_16 - BLOCK
      ?AUTO_17 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_14 ?AUTO_16 ) ( CLEAR ?AUTO_14 ) ( HOLDING ?AUTO_17 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_17 )
      ( MAKE-ON-TABLE ?AUTO_14 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_14 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21 - BLOCK
      ?AUTO_22 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_21 ) ( CLEAR ?AUTO_22 ) )
    :subtasks
    ( ( !STACK ?AUTO_21 ?AUTO_22 )
      ( MAKE-ON-VERIFY ?AUTO_21 ?AUTO_22 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_25 - BLOCK
      ?AUTO_26 - BLOCK
    )
    :vars
    (
      ?AUTO_30 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_26 ) ( ON ?AUTO_25 ?AUTO_30 ) ( CLEAR ?AUTO_25 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_25 ?AUTO_30 )
      ( MAKE-ON ?AUTO_25 ?AUTO_26 )
      ( MAKE-ON-VERIFY ?AUTO_25 ?AUTO_26 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_31 - BLOCK
      ?AUTO_32 - BLOCK
    )
    :vars
    (
      ?AUTO_35 - BLOCK
      ?AUTO_36 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_32 ) ( ON ?AUTO_31 ?AUTO_35 ) ( CLEAR ?AUTO_31 ) ( HOLDING ?AUTO_36 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_36 )
      ( MAKE-ON ?AUTO_31 ?AUTO_32 )
      ( MAKE-ON-VERIFY ?AUTO_31 ?AUTO_32 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37 - BLOCK
      ?AUTO_38 - BLOCK
    )
    :vars
    (
      ?AUTO_41 - BLOCK
      ?AUTO_42 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_38 ) ( ON ?AUTO_37 ?AUTO_41 ) ( ON ?AUTO_42 ?AUTO_37 ) ( CLEAR ?AUTO_42 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_42 ?AUTO_37 )
      ( MAKE-ON ?AUTO_37 ?AUTO_38 )
      ( MAKE-ON-VERIFY ?AUTO_37 ?AUTO_38 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_45 - BLOCK
      ?AUTO_46 - BLOCK
    )
    :vars
    (
      ?AUTO_49 - BLOCK
      ?AUTO_50 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_45 ?AUTO_49 ) ( ON ?AUTO_50 ?AUTO_45 ) ( CLEAR ?AUTO_50 ) ( HOLDING ?AUTO_46 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_46 )
      ( MAKE-ON ?AUTO_45 ?AUTO_46 )
      ( MAKE-ON-VERIFY ?AUTO_45 ?AUTO_46 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56 - BLOCK
      ?AUTO_57 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_56 ) ( CLEAR ?AUTO_57 ) )
    :subtasks
    ( ( !STACK ?AUTO_56 ?AUTO_57 )
      ( MAKE-ON-VERIFY ?AUTO_56 ?AUTO_57 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60 - BLOCK
      ?AUTO_61 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_61 ) ( ON-TABLE ?AUTO_60 ) ( CLEAR ?AUTO_60 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_60 )
      ( MAKE-ON ?AUTO_60 ?AUTO_61 )
      ( MAKE-ON-VERIFY ?AUTO_60 ?AUTO_61 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_65 - BLOCK
      ?AUTO_66 - BLOCK
    )
    :vars
    (
      ?AUTO_69 - BLOCK
      ?AUTO_70 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_66 ) ( ON-TABLE ?AUTO_65 ) ( CLEAR ?AUTO_65 ) ( HOLDING ?AUTO_69 ) ( CLEAR ?AUTO_70 ) )
    :subtasks
    ( ( !STACK ?AUTO_69 ?AUTO_70 )
      ( MAKE-ON ?AUTO_65 ?AUTO_66 )
      ( MAKE-ON-VERIFY ?AUTO_65 ?AUTO_66 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_71 - BLOCK
      ?AUTO_72 - BLOCK
    )
    :vars
    (
      ?AUTO_73 - BLOCK
      ?AUTO_76 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_72 ) ( ON-TABLE ?AUTO_71 ) ( CLEAR ?AUTO_73 ) ( ON ?AUTO_76 ?AUTO_71 ) ( CLEAR ?AUTO_76 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_76 ?AUTO_71 )
      ( MAKE-ON ?AUTO_71 ?AUTO_72 )
      ( MAKE-ON-VERIFY ?AUTO_71 ?AUTO_72 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_79 - BLOCK
      ?AUTO_80 - BLOCK
    )
    :vars
    (
      ?AUTO_83 - BLOCK
      ?AUTO_84 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_79 ) ( CLEAR ?AUTO_83 ) ( ON ?AUTO_84 ?AUTO_79 ) ( CLEAR ?AUTO_84 ) ( HOLDING ?AUTO_80 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_80 )
      ( MAKE-ON ?AUTO_79 ?AUTO_80 )
      ( MAKE-ON-VERIFY ?AUTO_79 ?AUTO_80 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_86 - BLOCK
      ?AUTO_87 - BLOCK
    )
    :vars
    (
      ?AUTO_90 - BLOCK
      ?AUTO_91 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_86 ) ( CLEAR ?AUTO_90 ) ( ON ?AUTO_91 ?AUTO_86 ) ( ON ?AUTO_87 ?AUTO_91 ) ( CLEAR ?AUTO_87 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_87 ?AUTO_91 )
      ( MAKE-ON ?AUTO_86 ?AUTO_87 )
      ( MAKE-ON-VERIFY ?AUTO_86 ?AUTO_87 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_94 - BLOCK
      ?AUTO_95 - BLOCK
    )
    :vars
    (
      ?AUTO_99 - BLOCK
      ?AUTO_97 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_94 ) ( ON ?AUTO_99 ?AUTO_94 ) ( ON ?AUTO_95 ?AUTO_99 ) ( CLEAR ?AUTO_95 ) ( HOLDING ?AUTO_97 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_97 )
      ( MAKE-ON ?AUTO_94 ?AUTO_95 )
      ( MAKE-ON-VERIFY ?AUTO_94 ?AUTO_95 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_105 - BLOCK
      ?AUTO_106 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_105 ) ( CLEAR ?AUTO_106 ) )
    :subtasks
    ( ( !STACK ?AUTO_105 ?AUTO_106 )
      ( MAKE-ON-VERIFY ?AUTO_105 ?AUTO_106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_109 - BLOCK
      ?AUTO_110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_110 ) ( ON-TABLE ?AUTO_109 ) ( CLEAR ?AUTO_109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_109 )
      ( MAKE-ON ?AUTO_109 ?AUTO_110 )
      ( MAKE-ON-VERIFY ?AUTO_109 ?AUTO_110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_114 - BLOCK
      ?AUTO_115 - BLOCK
    )
    :vars
    (
      ?AUTO_118 - BLOCK
      ?AUTO_119 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_115 ) ( ON-TABLE ?AUTO_114 ) ( CLEAR ?AUTO_114 ) ( HOLDING ?AUTO_118 ) ( CLEAR ?AUTO_119 ) )
    :subtasks
    ( ( !STACK ?AUTO_118 ?AUTO_119 )
      ( MAKE-ON ?AUTO_114 ?AUTO_115 )
      ( MAKE-ON-VERIFY ?AUTO_114 ?AUTO_115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_122 - BLOCK
      ?AUTO_123 - BLOCK
    )
    :vars
    (
      ?AUTO_127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_122 ) ( CLEAR ?AUTO_122 ) ( HOLDING ?AUTO_123 ) ( CLEAR ?AUTO_127 ) )
    :subtasks
    ( ( !STACK ?AUTO_123 ?AUTO_127 )
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
      ?AUTO_137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_132 ) ( CLEAR ?AUTO_132 ) ( CLEAR ?AUTO_134 ) ( ON ?AUTO_137 ?AUTO_133 ) ( CLEAR ?AUTO_137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_137 ?AUTO_133 )
      ( MAKE-ON ?AUTO_132 ?AUTO_133 )
      ( MAKE-ON-VERIFY ?AUTO_132 ?AUTO_133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_140 - BLOCK
      ?AUTO_141 - BLOCK
    )
    :vars
    (
      ?AUTO_144 - BLOCK
      ?AUTO_145 - BLOCK
      ?AUTO_146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_140 ) ( CLEAR ?AUTO_140 ) ( CLEAR ?AUTO_144 ) ( ON ?AUTO_145 ?AUTO_141 ) ( CLEAR ?AUTO_145 ) ( HOLDING ?AUTO_146 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_146 )
      ( MAKE-ON ?AUTO_140 ?AUTO_141 )
      ( MAKE-ON-VERIFY ?AUTO_140 ?AUTO_141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_150 - BLOCK
      ?AUTO_148 - BLOCK
    )
    :vars
    (
      ?AUTO_153 - BLOCK
      ?AUTO_151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_150 ) ( ON ?AUTO_153 ?AUTO_148 ) ( CLEAR ?AUTO_153 ) ( ON ?AUTO_151 ?AUTO_150 ) ( CLEAR ?AUTO_151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_151 ?AUTO_150 )
      ( MAKE-ON ?AUTO_150 ?AUTO_148 )
      ( MAKE-ON-VERIFY ?AUTO_150 ?AUTO_148 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_155 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_155 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_155 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_155 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_157 - BLOCK
    )
    :vars
    (
      ?AUTO_160 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_157 ?AUTO_160 ) ( CLEAR ?AUTO_157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_157 ?AUTO_160 )
      ( MAKE-ON-TABLE ?AUTO_157 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_163 - BLOCK
      ?AUTO_164 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_163 ) ( CLEAR ?AUTO_164 ) )
    :subtasks
    ( ( !STACK ?AUTO_163 ?AUTO_164 )
      ( MAKE-ON-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_167 - BLOCK
      ?AUTO_168 - BLOCK
    )
    :vars
    (
      ?AUTO_172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_168 ) ( ON ?AUTO_167 ?AUTO_172 ) ( CLEAR ?AUTO_167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_167 ?AUTO_172 )
      ( MAKE-ON ?AUTO_167 ?AUTO_168 )
      ( MAKE-ON-VERIFY ?AUTO_167 ?AUTO_168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_173 - BLOCK
      ?AUTO_174 - BLOCK
    )
    :vars
    (
      ?AUTO_175 - BLOCK
      ?AUTO_178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_174 ) ( ON ?AUTO_173 ?AUTO_175 ) ( CLEAR ?AUTO_173 ) ( HOLDING ?AUTO_178 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_178 )
      ( MAKE-ON ?AUTO_173 ?AUTO_174 )
      ( MAKE-ON-VERIFY ?AUTO_173 ?AUTO_174 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_182 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_182 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_182 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_182 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_184 - BLOCK
    )
    :vars
    (
      ?AUTO_187 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_184 ?AUTO_187 ) ( CLEAR ?AUTO_184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_184 ?AUTO_187 )
      ( MAKE-ON-TABLE ?AUTO_184 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_184 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_188 - BLOCK
    )
    :vars
    (
      ?AUTO_190 - BLOCK
      ?AUTO_191 - BLOCK
      ?AUTO_192 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_188 ?AUTO_190 ) ( CLEAR ?AUTO_188 ) ( HOLDING ?AUTO_191 ) ( CLEAR ?AUTO_192 ) )
    :subtasks
    ( ( !STACK ?AUTO_191 ?AUTO_192 )
      ( MAKE-ON-TABLE ?AUTO_188 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_188 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_193 - BLOCK
    )
    :vars
    (
      ?AUTO_194 - BLOCK
      ?AUTO_197 - BLOCK
      ?AUTO_196 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_193 ?AUTO_194 ) ( CLEAR ?AUTO_197 ) ( ON ?AUTO_196 ?AUTO_193 ) ( CLEAR ?AUTO_196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_196 ?AUTO_193 )
      ( MAKE-ON-TABLE ?AUTO_193 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_193 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_200 - BLOCK
    )
    :vars
    (
      ?AUTO_201 - BLOCK
      ?AUTO_202 - BLOCK
      ?AUTO_204 - BLOCK
      ?AUTO_205 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_200 ?AUTO_201 ) ( CLEAR ?AUTO_202 ) ( ON ?AUTO_204 ?AUTO_200 ) ( CLEAR ?AUTO_204 ) ( HOLDING ?AUTO_205 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_205 )
      ( MAKE-ON-TABLE ?AUTO_200 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_209 - BLOCK
      ?AUTO_210 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_209 ) ( CLEAR ?AUTO_210 ) )
    :subtasks
    ( ( !STACK ?AUTO_209 ?AUTO_210 )
      ( MAKE-ON-VERIFY ?AUTO_209 ?AUTO_210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_213 - BLOCK
      ?AUTO_214 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_214 ) ( ON-TABLE ?AUTO_213 ) ( CLEAR ?AUTO_213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_213 )
      ( MAKE-ON ?AUTO_213 ?AUTO_214 )
      ( MAKE-ON-VERIFY ?AUTO_213 ?AUTO_214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_218 - BLOCK
      ?AUTO_219 - BLOCK
    )
    :vars
    (
      ?AUTO_222 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_219 ) ( ON-TABLE ?AUTO_218 ) ( CLEAR ?AUTO_218 ) ( HOLDING ?AUTO_222 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_222 )
      ( MAKE-ON ?AUTO_218 ?AUTO_219 )
      ( MAKE-ON-VERIFY ?AUTO_218 ?AUTO_219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_223 - BLOCK
      ?AUTO_224 - BLOCK
    )
    :vars
    (
      ?AUTO_227 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_224 ) ( ON-TABLE ?AUTO_223 ) ( ON ?AUTO_227 ?AUTO_223 ) ( CLEAR ?AUTO_227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_227 ?AUTO_223 )
      ( MAKE-ON ?AUTO_223 ?AUTO_224 )
      ( MAKE-ON-VERIFY ?AUTO_223 ?AUTO_224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_230 - BLOCK
      ?AUTO_231 - BLOCK
    )
    :vars
    (
      ?AUTO_234 - BLOCK
      ?AUTO_235 - BLOCK
      ?AUTO_236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_231 ) ( ON-TABLE ?AUTO_230 ) ( ON ?AUTO_234 ?AUTO_230 ) ( CLEAR ?AUTO_234 ) ( HOLDING ?AUTO_235 ) ( CLEAR ?AUTO_236 ) )
    :subtasks
    ( ( !STACK ?AUTO_235 ?AUTO_236 )
      ( MAKE-ON ?AUTO_230 ?AUTO_231 )
      ( MAKE-ON-VERIFY ?AUTO_230 ?AUTO_231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_237 - BLOCK
      ?AUTO_238 - BLOCK
    )
    :vars
    (
      ?AUTO_239 - BLOCK
      ?AUTO_243 - BLOCK
      ?AUTO_242 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_238 ) ( ON-TABLE ?AUTO_237 ) ( ON ?AUTO_239 ?AUTO_237 ) ( CLEAR ?AUTO_243 ) ( ON ?AUTO_242 ?AUTO_239 ) ( CLEAR ?AUTO_242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_242 ?AUTO_239 )
      ( MAKE-ON ?AUTO_237 ?AUTO_238 )
      ( MAKE-ON-VERIFY ?AUTO_237 ?AUTO_238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_246 - BLOCK
      ?AUTO_247 - BLOCK
    )
    :vars
    (
      ?AUTO_249 - BLOCK
      ?AUTO_252 - BLOCK
      ?AUTO_248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_246 ) ( ON ?AUTO_249 ?AUTO_246 ) ( CLEAR ?AUTO_252 ) ( ON ?AUTO_248 ?AUTO_249 ) ( CLEAR ?AUTO_248 ) ( HOLDING ?AUTO_247 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_247 )
      ( MAKE-ON ?AUTO_246 ?AUTO_247 )
      ( MAKE-ON-VERIFY ?AUTO_246 ?AUTO_247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_258 - BLOCK
      ?AUTO_259 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_258 ) ( CLEAR ?AUTO_259 ) )
    :subtasks
    ( ( !STACK ?AUTO_258 ?AUTO_259 )
      ( MAKE-ON-VERIFY ?AUTO_258 ?AUTO_259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_262 - BLOCK
      ?AUTO_263 - BLOCK
    )
    :vars
    (
      ?AUTO_267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_263 ) ( ON ?AUTO_262 ?AUTO_267 ) ( CLEAR ?AUTO_262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_262 ?AUTO_267 )
      ( MAKE-ON ?AUTO_262 ?AUTO_263 )
      ( MAKE-ON-VERIFY ?AUTO_262 ?AUTO_263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_268 - BLOCK
      ?AUTO_269 - BLOCK
    )
    :vars
    (
      ?AUTO_272 - BLOCK
      ?AUTO_273 - BLOCK
      ?AUTO_274 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_269 ) ( ON ?AUTO_268 ?AUTO_272 ) ( CLEAR ?AUTO_268 ) ( HOLDING ?AUTO_273 ) ( CLEAR ?AUTO_274 ) )
    :subtasks
    ( ( !STACK ?AUTO_273 ?AUTO_274 )
      ( MAKE-ON ?AUTO_268 ?AUTO_269 )
      ( MAKE-ON-VERIFY ?AUTO_268 ?AUTO_269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_287 - BLOCK
      ?AUTO_288 - BLOCK
    )
    :vars
    (
      ?AUTO_289 - BLOCK
      ?AUTO_292 - BLOCK
      ?AUTO_293 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_287 ?AUTO_289 ) ( CLEAR ?AUTO_287 ) ( CLEAR ?AUTO_292 ) ( ON ?AUTO_293 ?AUTO_288 ) ( CLEAR ?AUTO_293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_293 ?AUTO_288 )
      ( MAKE-ON ?AUTO_287 ?AUTO_288 )
      ( MAKE-ON-VERIFY ?AUTO_287 ?AUTO_288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_298 - BLOCK
      ?AUTO_299 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_298 ) ( CLEAR ?AUTO_299 ) )
    :subtasks
    ( ( !STACK ?AUTO_298 ?AUTO_299 )
      ( MAKE-ON-VERIFY ?AUTO_298 ?AUTO_299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_302 - BLOCK
      ?AUTO_303 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_303 ) ( ON-TABLE ?AUTO_302 ) ( CLEAR ?AUTO_302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_302 )
      ( MAKE-ON ?AUTO_302 ?AUTO_303 )
      ( MAKE-ON-VERIFY ?AUTO_302 ?AUTO_303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_307 - BLOCK
      ?AUTO_308 - BLOCK
    )
    :vars
    (
      ?AUTO_311 - BLOCK
      ?AUTO_312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_308 ) ( ON-TABLE ?AUTO_307 ) ( CLEAR ?AUTO_307 ) ( HOLDING ?AUTO_311 ) ( CLEAR ?AUTO_312 ) )
    :subtasks
    ( ( !STACK ?AUTO_311 ?AUTO_312 )
      ( MAKE-ON ?AUTO_307 ?AUTO_308 )
      ( MAKE-ON-VERIFY ?AUTO_307 ?AUTO_308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_313 - BLOCK
      ?AUTO_314 - BLOCK
    )
    :vars
    (
      ?AUTO_318 - BLOCK
      ?AUTO_317 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_314 ) ( ON-TABLE ?AUTO_313 ) ( CLEAR ?AUTO_318 ) ( ON ?AUTO_317 ?AUTO_313 ) ( CLEAR ?AUTO_317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_317 ?AUTO_313 )
      ( MAKE-ON ?AUTO_313 ?AUTO_314 )
      ( MAKE-ON-VERIFY ?AUTO_313 ?AUTO_314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_321 - BLOCK
      ?AUTO_322 - BLOCK
    )
    :vars
    (
      ?AUTO_323 - BLOCK
      ?AUTO_326 - BLOCK
      ?AUTO_327 - BLOCK
      ?AUTO_328 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_322 ) ( ON-TABLE ?AUTO_321 ) ( CLEAR ?AUTO_323 ) ( ON ?AUTO_326 ?AUTO_321 ) ( CLEAR ?AUTO_326 ) ( HOLDING ?AUTO_327 ) ( CLEAR ?AUTO_328 ) )
    :subtasks
    ( ( !STACK ?AUTO_327 ?AUTO_328 )
      ( MAKE-ON ?AUTO_321 ?AUTO_322 )
      ( MAKE-ON-VERIFY ?AUTO_321 ?AUTO_322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_331 - BLOCK
      ?AUTO_332 - BLOCK
    )
    :vars
    (
      ?AUTO_333 - BLOCK
      ?AUTO_335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_331 ) ( CLEAR ?AUTO_333 ) ( ON ?AUTO_335 ?AUTO_331 ) ( CLEAR ?AUTO_335 ) ( HOLDING ?AUTO_332 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_332 )
      ( MAKE-ON ?AUTO_331 ?AUTO_332 )
      ( MAKE-ON-VERIFY ?AUTO_331 ?AUTO_332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_342 - BLOCK
      ?AUTO_343 - BLOCK
    )
    :vars
    (
      ?AUTO_346 - BLOCK
      ?AUTO_347 - BLOCK
      ?AUTO_348 - BLOCK
      ?AUTO_349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_342 ) ( CLEAR ?AUTO_346 ) ( ON ?AUTO_347 ?AUTO_342 ) ( CLEAR ?AUTO_347 ) ( CLEAR ?AUTO_348 ) ( ON ?AUTO_349 ?AUTO_343 ) ( CLEAR ?AUTO_349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_349 ?AUTO_343 )
      ( MAKE-ON ?AUTO_342 ?AUTO_343 )
      ( MAKE-ON-VERIFY ?AUTO_342 ?AUTO_343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_352 - BLOCK
      ?AUTO_353 - BLOCK
    )
    :vars
    (
      ?AUTO_359 - BLOCK
      ?AUTO_358 - BLOCK
      ?AUTO_357 - BLOCK
      ?AUTO_356 - BLOCK
      ?AUTO_360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_352 ) ( CLEAR ?AUTO_359 ) ( ON ?AUTO_358 ?AUTO_352 ) ( CLEAR ?AUTO_358 ) ( CLEAR ?AUTO_357 ) ( ON ?AUTO_356 ?AUTO_353 ) ( CLEAR ?AUTO_356 ) ( HOLDING ?AUTO_360 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_360 )
      ( MAKE-ON ?AUTO_352 ?AUTO_353 )
      ( MAKE-ON-VERIFY ?AUTO_352 ?AUTO_353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_365 - BLOCK
      ?AUTO_366 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_365 ) ( CLEAR ?AUTO_366 ) )
    :subtasks
    ( ( !STACK ?AUTO_365 ?AUTO_366 )
      ( MAKE-ON-VERIFY ?AUTO_365 ?AUTO_366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_369 - BLOCK
      ?AUTO_370 - BLOCK
    )
    :vars
    (
      ?AUTO_374 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_370 ) ( ON ?AUTO_369 ?AUTO_374 ) ( CLEAR ?AUTO_369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_369 ?AUTO_374 )
      ( MAKE-ON ?AUTO_369 ?AUTO_370 )
      ( MAKE-ON-VERIFY ?AUTO_369 ?AUTO_370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_375 - BLOCK
      ?AUTO_376 - BLOCK
    )
    :vars
    (
      ?AUTO_379 - BLOCK
      ?AUTO_380 - BLOCK
      ?AUTO_381 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_376 ) ( ON ?AUTO_375 ?AUTO_379 ) ( CLEAR ?AUTO_375 ) ( HOLDING ?AUTO_380 ) ( CLEAR ?AUTO_381 ) )
    :subtasks
    ( ( !STACK ?AUTO_380 ?AUTO_381 )
      ( MAKE-ON ?AUTO_375 ?AUTO_376 )
      ( MAKE-ON-VERIFY ?AUTO_375 ?AUTO_376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_388 - BLOCK
      ?AUTO_389 - BLOCK
    )
    :vars
    (
      ?AUTO_391 - BLOCK
      ?AUTO_394 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_388 ?AUTO_391 ) ( CLEAR ?AUTO_388 ) ( HOLDING ?AUTO_389 ) ( CLEAR ?AUTO_394 ) )
    :subtasks
    ( ( !STACK ?AUTO_389 ?AUTO_394 )
      ( MAKE-ON ?AUTO_388 ?AUTO_389 )
      ( MAKE-ON-VERIFY ?AUTO_388 ?AUTO_389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_399 - BLOCK
      ?AUTO_400 - BLOCK
    )
    :vars
    (
      ?AUTO_403 - BLOCK
      ?AUTO_405 - BLOCK
      ?AUTO_404 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_399 ?AUTO_403 ) ( CLEAR ?AUTO_399 ) ( CLEAR ?AUTO_405 ) ( ON ?AUTO_404 ?AUTO_400 ) ( CLEAR ?AUTO_404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_404 ?AUTO_400 )
      ( MAKE-ON ?AUTO_399 ?AUTO_400 )
      ( MAKE-ON-VERIFY ?AUTO_399 ?AUTO_400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_408 - BLOCK
      ?AUTO_409 - BLOCK
    )
    :vars
    (
      ?AUTO_414 - BLOCK
      ?AUTO_413 - BLOCK
      ?AUTO_412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_414 ) ( ON ?AUTO_413 ?AUTO_409 ) ( CLEAR ?AUTO_413 ) ( HOLDING ?AUTO_408 ) ( CLEAR ?AUTO_412 ) )
    :subtasks
    ( ( !STACK ?AUTO_408 ?AUTO_412 )
      ( MAKE-ON ?AUTO_408 ?AUTO_409 )
      ( MAKE-ON-VERIFY ?AUTO_408 ?AUTO_409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_417 - BLOCK
      ?AUTO_418 - BLOCK
    )
    :vars
    (
      ?AUTO_419 - BLOCK
      ?AUTO_421 - BLOCK
      ?AUTO_423 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_419 ) ( ON ?AUTO_421 ?AUTO_418 ) ( CLEAR ?AUTO_423 ) ( ON ?AUTO_417 ?AUTO_421 ) ( CLEAR ?AUTO_417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_417 ?AUTO_421 )
      ( MAKE-ON ?AUTO_417 ?AUTO_418 )
      ( MAKE-ON-VERIFY ?AUTO_417 ?AUTO_418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_426 - BLOCK
      ?AUTO_427 - BLOCK
    )
    :vars
    (
      ?AUTO_430 - BLOCK
      ?AUTO_431 - BLOCK
      ?AUTO_432 - BLOCK
      ?AUTO_433 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_430 ) ( ON ?AUTO_431 ?AUTO_427 ) ( CLEAR ?AUTO_432 ) ( ON ?AUTO_426 ?AUTO_431 ) ( CLEAR ?AUTO_426 ) ( HOLDING ?AUTO_433 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_433 )
      ( MAKE-ON ?AUTO_426 ?AUTO_427 )
      ( MAKE-ON-VERIFY ?AUTO_426 ?AUTO_427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_438 - BLOCK
      ?AUTO_439 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_438 ) ( CLEAR ?AUTO_439 ) )
    :subtasks
    ( ( !STACK ?AUTO_438 ?AUTO_439 )
      ( MAKE-ON-VERIFY ?AUTO_438 ?AUTO_439 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_442 - BLOCK
      ?AUTO_443 - BLOCK
    )
    :vars
    (
      ?AUTO_447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_443 ) ( ON ?AUTO_442 ?AUTO_447 ) ( CLEAR ?AUTO_442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_442 ?AUTO_447 )
      ( MAKE-ON ?AUTO_442 ?AUTO_443 )
      ( MAKE-ON-VERIFY ?AUTO_442 ?AUTO_443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_448 - BLOCK
      ?AUTO_449 - BLOCK
    )
    :vars
    (
      ?AUTO_452 - BLOCK
      ?AUTO_453 - BLOCK
      ?AUTO_454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_449 ) ( ON ?AUTO_448 ?AUTO_452 ) ( CLEAR ?AUTO_448 ) ( HOLDING ?AUTO_453 ) ( CLEAR ?AUTO_454 ) )
    :subtasks
    ( ( !STACK ?AUTO_453 ?AUTO_454 )
      ( MAKE-ON ?AUTO_448 ?AUTO_449 )
      ( MAKE-ON-VERIFY ?AUTO_448 ?AUTO_449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_457 - BLOCK
      ?AUTO_458 - BLOCK
    )
    :vars
    (
      ?AUTO_461 - BLOCK
      ?AUTO_463 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_457 ?AUTO_461 ) ( CLEAR ?AUTO_457 ) ( HOLDING ?AUTO_458 ) ( CLEAR ?AUTO_463 ) )
    :subtasks
    ( ( !STACK ?AUTO_458 ?AUTO_463 )
      ( MAKE-ON ?AUTO_457 ?AUTO_458 )
      ( MAKE-ON-VERIFY ?AUTO_457 ?AUTO_458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_540 - BLOCK
      ?AUTO_541 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_540 ) ( CLEAR ?AUTO_541 ) )
    :subtasks
    ( ( !STACK ?AUTO_540 ?AUTO_541 )
      ( MAKE-ON-VERIFY ?AUTO_540 ?AUTO_541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_544 - BLOCK
      ?AUTO_545 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_545 ) ( ON-TABLE ?AUTO_544 ) ( CLEAR ?AUTO_544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_544 )
      ( MAKE-ON ?AUTO_544 ?AUTO_545 )
      ( MAKE-ON-VERIFY ?AUTO_544 ?AUTO_545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_549 - BLOCK
      ?AUTO_550 - BLOCK
    )
    :vars
    (
      ?AUTO_553 - BLOCK
      ?AUTO_554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_550 ) ( ON-TABLE ?AUTO_549 ) ( CLEAR ?AUTO_549 ) ( HOLDING ?AUTO_553 ) ( CLEAR ?AUTO_554 ) )
    :subtasks
    ( ( !STACK ?AUTO_553 ?AUTO_554 )
      ( MAKE-ON ?AUTO_549 ?AUTO_550 )
      ( MAKE-ON-VERIFY ?AUTO_549 ?AUTO_550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_555 - BLOCK
      ?AUTO_556 - BLOCK
    )
    :vars
    (
      ?AUTO_560 - BLOCK
      ?AUTO_559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_556 ) ( ON-TABLE ?AUTO_555 ) ( CLEAR ?AUTO_560 ) ( ON ?AUTO_559 ?AUTO_555 ) ( CLEAR ?AUTO_559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_559 ?AUTO_555 )
      ( MAKE-ON ?AUTO_555 ?AUTO_556 )
      ( MAKE-ON-VERIFY ?AUTO_555 ?AUTO_556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_563 - BLOCK
      ?AUTO_564 - BLOCK
    )
    :vars
    (
      ?AUTO_565 - BLOCK
      ?AUTO_568 - BLOCK
      ?AUTO_570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_563 ) ( CLEAR ?AUTO_565 ) ( ON ?AUTO_568 ?AUTO_563 ) ( CLEAR ?AUTO_568 ) ( HOLDING ?AUTO_564 ) ( CLEAR ?AUTO_570 ) )
    :subtasks
    ( ( !STACK ?AUTO_564 ?AUTO_570 )
      ( MAKE-ON ?AUTO_563 ?AUTO_564 )
      ( MAKE-ON-VERIFY ?AUTO_563 ?AUTO_564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_573 - BLOCK
      ?AUTO_574 - BLOCK
    )
    :vars
    (
      ?AUTO_575 - BLOCK
      ?AUTO_578 - BLOCK
      ?AUTO_579 - BLOCK
      ?AUTO_580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_574 ) ( ON-TABLE ?AUTO_573 ) ( CLEAR ?AUTO_575 ) ( ON ?AUTO_578 ?AUTO_573 ) ( CLEAR ?AUTO_578 ) ( HOLDING ?AUTO_579 ) ( CLEAR ?AUTO_580 ) )
    :subtasks
    ( ( !STACK ?AUTO_579 ?AUTO_580 )
      ( MAKE-ON ?AUTO_573 ?AUTO_574 )
      ( MAKE-ON-VERIFY ?AUTO_573 ?AUTO_574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_595 - BLOCK
      ?AUTO_596 - BLOCK
    )
    :vars
    (
      ?AUTO_600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_595 ) ( CLEAR ?AUTO_595 ) ( HOLDING ?AUTO_596 ) ( CLEAR ?AUTO_600 ) )
    :subtasks
    ( ( !STACK ?AUTO_596 ?AUTO_600 )
      ( MAKE-ON ?AUTO_595 ?AUTO_596 )
      ( MAKE-ON-VERIFY ?AUTO_595 ?AUTO_596 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_602 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_602 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_602 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_602 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_604 - BLOCK
    )
    :vars
    (
      ?AUTO_607 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_604 ?AUTO_607 ) ( CLEAR ?AUTO_604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_604 ?AUTO_607 )
      ( MAKE-ON-TABLE ?AUTO_604 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_604 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_609 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_609 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_609 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_609 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_611 - BLOCK
    )
    :vars
    (
      ?AUTO_614 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_611 ?AUTO_614 ) ( CLEAR ?AUTO_611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_611 ?AUTO_614 )
      ( MAKE-ON-TABLE ?AUTO_611 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_611 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_615 - BLOCK
    )
    :vars
    (
      ?AUTO_617 - BLOCK
      ?AUTO_618 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_615 ?AUTO_617 ) ( CLEAR ?AUTO_615 ) ( HOLDING ?AUTO_618 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_618 )
      ( MAKE-ON-TABLE ?AUTO_615 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_622 - BLOCK
      ?AUTO_623 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_622 ) ( CLEAR ?AUTO_623 ) )
    :subtasks
    ( ( !STACK ?AUTO_622 ?AUTO_623 )
      ( MAKE-ON-VERIFY ?AUTO_622 ?AUTO_623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_626 - BLOCK
      ?AUTO_627 - BLOCK
    )
    :vars
    (
      ?AUTO_631 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_627 ) ( ON ?AUTO_626 ?AUTO_631 ) ( CLEAR ?AUTO_626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_626 ?AUTO_631 )
      ( MAKE-ON ?AUTO_626 ?AUTO_627 )
      ( MAKE-ON-VERIFY ?AUTO_626 ?AUTO_627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_632 - BLOCK
      ?AUTO_633 - BLOCK
    )
    :vars
    (
      ?AUTO_636 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_632 ?AUTO_636 ) ( CLEAR ?AUTO_632 ) ( HOLDING ?AUTO_633 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_633 )
      ( MAKE-ON ?AUTO_632 ?AUTO_633 )
      ( MAKE-ON-VERIFY ?AUTO_632 ?AUTO_633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_638 - BLOCK
      ?AUTO_639 - BLOCK
    )
    :vars
    (
      ?AUTO_642 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_638 ?AUTO_642 ) ( ON ?AUTO_639 ?AUTO_638 ) ( CLEAR ?AUTO_639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_639 ?AUTO_638 )
      ( MAKE-ON ?AUTO_638 ?AUTO_639 )
      ( MAKE-ON-VERIFY ?AUTO_638 ?AUTO_639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_645 - BLOCK
      ?AUTO_646 - BLOCK
    )
    :vars
    (
      ?AUTO_649 - BLOCK
      ?AUTO_650 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_645 ?AUTO_649 ) ( ON ?AUTO_646 ?AUTO_645 ) ( CLEAR ?AUTO_646 ) ( HOLDING ?AUTO_650 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_650 )
      ( MAKE-ON ?AUTO_645 ?AUTO_646 )
      ( MAKE-ON-VERIFY ?AUTO_645 ?AUTO_646 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_654 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_654 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_654 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_654 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_656 - BLOCK
    )
    :vars
    (
      ?AUTO_659 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_656 ?AUTO_659 ) ( CLEAR ?AUTO_656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_656 ?AUTO_659 )
      ( MAKE-ON-TABLE ?AUTO_656 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_656 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_660 - BLOCK
    )
    :vars
    (
      ?AUTO_662 - BLOCK
      ?AUTO_663 - BLOCK
      ?AUTO_664 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_660 ?AUTO_662 ) ( CLEAR ?AUTO_660 ) ( HOLDING ?AUTO_663 ) ( CLEAR ?AUTO_664 ) )
    :subtasks
    ( ( !STACK ?AUTO_663 ?AUTO_664 )
      ( MAKE-ON-TABLE ?AUTO_660 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_660 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_665 - BLOCK
    )
    :vars
    (
      ?AUTO_667 - BLOCK
      ?AUTO_669 - BLOCK
      ?AUTO_668 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_665 ?AUTO_667 ) ( CLEAR ?AUTO_669 ) ( ON ?AUTO_668 ?AUTO_665 ) ( CLEAR ?AUTO_668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_668 ?AUTO_665 )
      ( MAKE-ON-TABLE ?AUTO_665 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_665 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_672 - BLOCK
    )
    :vars
    (
      ?AUTO_673 - BLOCK
      ?AUTO_675 - BLOCK
      ?AUTO_674 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_672 ?AUTO_673 ) ( ON ?AUTO_675 ?AUTO_672 ) ( CLEAR ?AUTO_675 ) ( HOLDING ?AUTO_674 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_674 )
      ( MAKE-ON-TABLE ?AUTO_672 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_672 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_678 - BLOCK
    )
    :vars
    (
      ?AUTO_679 - BLOCK
      ?AUTO_682 - BLOCK
      ?AUTO_680 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_678 ?AUTO_679 ) ( ON ?AUTO_682 ?AUTO_678 ) ( ON ?AUTO_680 ?AUTO_682 ) ( CLEAR ?AUTO_680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_680 ?AUTO_682 )
      ( MAKE-ON-TABLE ?AUTO_678 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_678 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_685 - BLOCK
    )
    :vars
    (
      ?AUTO_689 - BLOCK
      ?AUTO_687 - BLOCK
      ?AUTO_686 - BLOCK
      ?AUTO_690 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_685 ?AUTO_689 ) ( ON ?AUTO_687 ?AUTO_685 ) ( ON ?AUTO_686 ?AUTO_687 ) ( CLEAR ?AUTO_686 ) ( HOLDING ?AUTO_690 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_690 )
      ( MAKE-ON-TABLE ?AUTO_685 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_694 - BLOCK
      ?AUTO_695 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_694 ) ( CLEAR ?AUTO_695 ) )
    :subtasks
    ( ( !STACK ?AUTO_694 ?AUTO_695 )
      ( MAKE-ON-VERIFY ?AUTO_694 ?AUTO_695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_698 - BLOCK
      ?AUTO_699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_699 ) ( ON-TABLE ?AUTO_698 ) ( CLEAR ?AUTO_698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_698 )
      ( MAKE-ON ?AUTO_698 ?AUTO_699 )
      ( MAKE-ON-VERIFY ?AUTO_698 ?AUTO_699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_703 - BLOCK
      ?AUTO_704 - BLOCK
    )
    :vars
    (
      ?AUTO_707 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_704 ) ( ON-TABLE ?AUTO_703 ) ( CLEAR ?AUTO_703 ) ( HOLDING ?AUTO_707 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_707 )
      ( MAKE-ON ?AUTO_703 ?AUTO_704 )
      ( MAKE-ON-VERIFY ?AUTO_703 ?AUTO_704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_710 - BLOCK
      ?AUTO_711 - BLOCK
    )
    :vars
    (
      ?AUTO_715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_710 ) ( CLEAR ?AUTO_710 ) ( HOLDING ?AUTO_711 ) ( CLEAR ?AUTO_715 ) )
    :subtasks
    ( ( !STACK ?AUTO_711 ?AUTO_715 )
      ( MAKE-ON ?AUTO_710 ?AUTO_711 )
      ( MAKE-ON-VERIFY ?AUTO_710 ?AUTO_711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_720 - BLOCK
      ?AUTO_721 - BLOCK
    )
    :vars
    (
      ?AUTO_724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_720 ) ( CLEAR ?AUTO_720 ) ( ON ?AUTO_724 ?AUTO_721 ) ( CLEAR ?AUTO_724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_724 ?AUTO_721 )
      ( MAKE-ON ?AUTO_720 ?AUTO_721 )
      ( MAKE-ON-VERIFY ?AUTO_720 ?AUTO_721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_727 - BLOCK
      ?AUTO_728 - BLOCK
    )
    :vars
    (
      ?AUTO_731 - BLOCK
      ?AUTO_732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_727 ) ( CLEAR ?AUTO_727 ) ( ON ?AUTO_731 ?AUTO_728 ) ( CLEAR ?AUTO_731 ) ( HOLDING ?AUTO_732 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_732 )
      ( MAKE-ON ?AUTO_727 ?AUTO_728 )
      ( MAKE-ON-VERIFY ?AUTO_727 ?AUTO_728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_733 - BLOCK
      ?AUTO_734 - BLOCK
    )
    :vars
    (
      ?AUTO_737 - BLOCK
      ?AUTO_738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_733 ) ( ON ?AUTO_737 ?AUTO_734 ) ( CLEAR ?AUTO_737 ) ( ON ?AUTO_738 ?AUTO_733 ) ( CLEAR ?AUTO_738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_738 ?AUTO_733 )
      ( MAKE-ON ?AUTO_733 ?AUTO_734 )
      ( MAKE-ON-VERIFY ?AUTO_733 ?AUTO_734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_743 - BLOCK
      ?AUTO_744 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_743 ) ( CLEAR ?AUTO_744 ) )
    :subtasks
    ( ( !STACK ?AUTO_743 ?AUTO_744 )
      ( MAKE-ON-VERIFY ?AUTO_743 ?AUTO_744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_747 - BLOCK
      ?AUTO_748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_748 ) ( ON-TABLE ?AUTO_747 ) ( CLEAR ?AUTO_747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_747 )
      ( MAKE-ON ?AUTO_747 ?AUTO_748 )
      ( MAKE-ON-VERIFY ?AUTO_747 ?AUTO_748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_752 - BLOCK
      ?AUTO_753 - BLOCK
    )
    :vars
    (
      ?AUTO_757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_752 ) ( CLEAR ?AUTO_752 ) ( HOLDING ?AUTO_753 ) ( CLEAR ?AUTO_757 ) )
    :subtasks
    ( ( !STACK ?AUTO_753 ?AUTO_757 )
      ( MAKE-ON ?AUTO_752 ?AUTO_753 )
      ( MAKE-ON-VERIFY ?AUTO_752 ?AUTO_753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_762 - BLOCK
      ?AUTO_763 - BLOCK
    )
    :vars
    (
      ?AUTO_766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_763 ) ( ON-TABLE ?AUTO_762 ) ( ON ?AUTO_766 ?AUTO_762 ) ( CLEAR ?AUTO_766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_766 ?AUTO_762 )
      ( MAKE-ON ?AUTO_762 ?AUTO_763 )
      ( MAKE-ON-VERIFY ?AUTO_762 ?AUTO_763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_769 - BLOCK
      ?AUTO_770 - BLOCK
    )
    :vars
    (
      ?AUTO_773 - BLOCK
      ?AUTO_774 - BLOCK
      ?AUTO_775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_770 ) ( ON-TABLE ?AUTO_769 ) ( ON ?AUTO_773 ?AUTO_769 ) ( CLEAR ?AUTO_773 ) ( HOLDING ?AUTO_774 ) ( CLEAR ?AUTO_775 ) )
    :subtasks
    ( ( !STACK ?AUTO_774 ?AUTO_775 )
      ( MAKE-ON ?AUTO_769 ?AUTO_770 )
      ( MAKE-ON-VERIFY ?AUTO_769 ?AUTO_770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_776 - BLOCK
      ?AUTO_777 - BLOCK
    )
    :vars
    (
      ?AUTO_780 - BLOCK
      ?AUTO_782 - BLOCK
      ?AUTO_781 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_777 ) ( ON-TABLE ?AUTO_776 ) ( ON ?AUTO_780 ?AUTO_776 ) ( CLEAR ?AUTO_782 ) ( ON ?AUTO_781 ?AUTO_780 ) ( CLEAR ?AUTO_781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_781 ?AUTO_780 )
      ( MAKE-ON ?AUTO_776 ?AUTO_777 )
      ( MAKE-ON-VERIFY ?AUTO_776 ?AUTO_777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_785 - BLOCK
      ?AUTO_786 - BLOCK
    )
    :vars
    (
      ?AUTO_790 - BLOCK
      ?AUTO_791 - BLOCK
      ?AUTO_789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_786 ) ( ON-TABLE ?AUTO_785 ) ( ON ?AUTO_790 ?AUTO_785 ) ( ON ?AUTO_791 ?AUTO_790 ) ( CLEAR ?AUTO_791 ) ( HOLDING ?AUTO_789 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_789 )
      ( MAKE-ON ?AUTO_785 ?AUTO_786 )
      ( MAKE-ON-VERIFY ?AUTO_785 ?AUTO_786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_793 - BLOCK
      ?AUTO_794 - BLOCK
    )
    :vars
    (
      ?AUTO_795 - BLOCK
      ?AUTO_799 - BLOCK
      ?AUTO_798 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_794 ) ( ON-TABLE ?AUTO_793 ) ( ON ?AUTO_795 ?AUTO_793 ) ( ON ?AUTO_799 ?AUTO_795 ) ( ON ?AUTO_798 ?AUTO_799 ) ( CLEAR ?AUTO_798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_798 ?AUTO_799 )
      ( MAKE-ON ?AUTO_793 ?AUTO_794 )
      ( MAKE-ON-VERIFY ?AUTO_793 ?AUTO_794 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_802 - BLOCK
      ?AUTO_803 - BLOCK
    )
    :vars
    (
      ?AUTO_804 - BLOCK
      ?AUTO_807 - BLOCK
      ?AUTO_808 - BLOCK
      ?AUTO_809 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_803 ) ( ON-TABLE ?AUTO_802 ) ( ON ?AUTO_804 ?AUTO_802 ) ( ON ?AUTO_807 ?AUTO_804 ) ( ON ?AUTO_808 ?AUTO_807 ) ( CLEAR ?AUTO_808 ) ( HOLDING ?AUTO_809 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_809 )
      ( MAKE-ON ?AUTO_802 ?AUTO_803 )
      ( MAKE-ON-VERIFY ?AUTO_802 ?AUTO_803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_810 - BLOCK
      ?AUTO_811 - BLOCK
    )
    :vars
    (
      ?AUTO_812 - BLOCK
      ?AUTO_816 - BLOCK
      ?AUTO_817 - BLOCK
      ?AUTO_815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_810 ) ( ON ?AUTO_812 ?AUTO_810 ) ( ON ?AUTO_816 ?AUTO_812 ) ( ON ?AUTO_817 ?AUTO_816 ) ( CLEAR ?AUTO_817 ) ( ON ?AUTO_815 ?AUTO_811 ) ( CLEAR ?AUTO_815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_815 ?AUTO_811 )
      ( MAKE-ON ?AUTO_810 ?AUTO_811 )
      ( MAKE-ON-VERIFY ?AUTO_810 ?AUTO_811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_822 - BLOCK
      ?AUTO_823 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_822 ) ( CLEAR ?AUTO_823 ) )
    :subtasks
    ( ( !STACK ?AUTO_822 ?AUTO_823 )
      ( MAKE-ON-VERIFY ?AUTO_822 ?AUTO_823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_826 - BLOCK
      ?AUTO_827 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_827 ) ( ON-TABLE ?AUTO_826 ) ( CLEAR ?AUTO_826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_826 )
      ( MAKE-ON ?AUTO_826 ?AUTO_827 )
      ( MAKE-ON-VERIFY ?AUTO_826 ?AUTO_827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_831 - BLOCK
      ?AUTO_832 - BLOCK
    )
    :vars
    (
      ?AUTO_835 - BLOCK
      ?AUTO_836 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_832 ) ( ON-TABLE ?AUTO_831 ) ( CLEAR ?AUTO_831 ) ( HOLDING ?AUTO_835 ) ( CLEAR ?AUTO_836 ) )
    :subtasks
    ( ( !STACK ?AUTO_835 ?AUTO_836 )
      ( MAKE-ON ?AUTO_831 ?AUTO_832 )
      ( MAKE-ON-VERIFY ?AUTO_831 ?AUTO_832 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_838 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_838 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_838 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_838 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_840 - BLOCK
    )
    :vars
    (
      ?AUTO_843 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_840 ?AUTO_843 ) ( CLEAR ?AUTO_840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_840 ?AUTO_843 )
      ( MAKE-ON-TABLE ?AUTO_840 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_846 - BLOCK
      ?AUTO_847 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_846 ) ( CLEAR ?AUTO_847 ) )
    :subtasks
    ( ( !STACK ?AUTO_846 ?AUTO_847 )
      ( MAKE-ON-VERIFY ?AUTO_846 ?AUTO_847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_850 - BLOCK
      ?AUTO_851 - BLOCK
    )
    :vars
    (
      ?AUTO_855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_851 ) ( ON ?AUTO_850 ?AUTO_855 ) ( CLEAR ?AUTO_850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_850 ?AUTO_855 )
      ( MAKE-ON ?AUTO_850 ?AUTO_851 )
      ( MAKE-ON-VERIFY ?AUTO_850 ?AUTO_851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_856 - BLOCK
      ?AUTO_857 - BLOCK
    )
    :vars
    (
      ?AUTO_860 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_856 ?AUTO_860 ) ( CLEAR ?AUTO_856 ) ( HOLDING ?AUTO_857 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_857 )
      ( MAKE-ON ?AUTO_856 ?AUTO_857 )
      ( MAKE-ON-VERIFY ?AUTO_856 ?AUTO_857 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_865 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_865 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_865 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_865 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_867 - BLOCK
    )
    :vars
    (
      ?AUTO_870 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_867 ?AUTO_870 ) ( CLEAR ?AUTO_867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_867 ?AUTO_870 )
      ( MAKE-ON-TABLE ?AUTO_867 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_867 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_871 - BLOCK
    )
    :vars
    (
      ?AUTO_873 - BLOCK
      ?AUTO_874 - BLOCK
      ?AUTO_875 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_871 ?AUTO_873 ) ( CLEAR ?AUTO_871 ) ( HOLDING ?AUTO_874 ) ( CLEAR ?AUTO_875 ) )
    :subtasks
    ( ( !STACK ?AUTO_874 ?AUTO_875 )
      ( MAKE-ON-TABLE ?AUTO_871 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_871 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_880 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_880 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_880 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_880 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_882 - BLOCK
    )
    :vars
    (
      ?AUTO_885 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_882 ?AUTO_885 ) ( CLEAR ?AUTO_882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_882 ?AUTO_885 )
      ( MAKE-ON-TABLE ?AUTO_882 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_882 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_886 - BLOCK
    )
    :vars
    (
      ?AUTO_888 - BLOCK
      ?AUTO_889 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_886 ?AUTO_888 ) ( CLEAR ?AUTO_886 ) ( HOLDING ?AUTO_889 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_889 )
      ( MAKE-ON-TABLE ?AUTO_886 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_886 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_890 - BLOCK
    )
    :vars
    (
      ?AUTO_892 - BLOCK
      ?AUTO_893 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_890 ?AUTO_892 ) ( ON ?AUTO_893 ?AUTO_890 ) ( CLEAR ?AUTO_893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_893 ?AUTO_890 )
      ( MAKE-ON-TABLE ?AUTO_890 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_890 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_896 - BLOCK
    )
    :vars
    (
      ?AUTO_897 - BLOCK
      ?AUTO_898 - BLOCK
      ?AUTO_900 - BLOCK
      ?AUTO_901 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_896 ?AUTO_897 ) ( ON ?AUTO_898 ?AUTO_896 ) ( CLEAR ?AUTO_898 ) ( HOLDING ?AUTO_900 ) ( CLEAR ?AUTO_901 ) )
    :subtasks
    ( ( !STACK ?AUTO_900 ?AUTO_901 )
      ( MAKE-ON-TABLE ?AUTO_896 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_907 - BLOCK
      ?AUTO_908 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_907 ) ( CLEAR ?AUTO_908 ) )
    :subtasks
    ( ( !STACK ?AUTO_907 ?AUTO_908 )
      ( MAKE-ON-VERIFY ?AUTO_907 ?AUTO_908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_911 - BLOCK
      ?AUTO_912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_912 ) ( ON-TABLE ?AUTO_911 ) ( CLEAR ?AUTO_911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_911 )
      ( MAKE-ON ?AUTO_911 ?AUTO_912 )
      ( MAKE-ON-VERIFY ?AUTO_911 ?AUTO_912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_916 - BLOCK
      ?AUTO_917 - BLOCK
    )
    :vars
    (
      ?AUTO_920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_917 ) ( ON-TABLE ?AUTO_916 ) ( CLEAR ?AUTO_916 ) ( HOLDING ?AUTO_920 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_920 )
      ( MAKE-ON ?AUTO_916 ?AUTO_917 )
      ( MAKE-ON-VERIFY ?AUTO_916 ?AUTO_917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_927 - BLOCK
      ?AUTO_928 - BLOCK
    )
    :vars
    (
      ?AUTO_932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_927 ) ( CLEAR ?AUTO_927 ) ( HOLDING ?AUTO_928 ) ( CLEAR ?AUTO_932 ) )
    :subtasks
    ( ( !STACK ?AUTO_928 ?AUTO_932 )
      ( MAKE-ON ?AUTO_927 ?AUTO_928 )
      ( MAKE-ON-VERIFY ?AUTO_927 ?AUTO_928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_941 - BLOCK
      ?AUTO_942 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_941 ) ( CLEAR ?AUTO_942 ) )
    :subtasks
    ( ( !STACK ?AUTO_941 ?AUTO_942 )
      ( MAKE-ON-VERIFY ?AUTO_941 ?AUTO_942 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_945 - BLOCK
      ?AUTO_946 - BLOCK
    )
    :vars
    (
      ?AUTO_950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_946 ) ( ON ?AUTO_945 ?AUTO_950 ) ( CLEAR ?AUTO_945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_945 ?AUTO_950 )
      ( MAKE-ON ?AUTO_945 ?AUTO_946 )
      ( MAKE-ON-VERIFY ?AUTO_945 ?AUTO_946 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_951 - BLOCK
      ?AUTO_952 - BLOCK
    )
    :vars
    (
      ?AUTO_955 - BLOCK
      ?AUTO_956 - BLOCK
      ?AUTO_957 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_952 ) ( ON ?AUTO_951 ?AUTO_955 ) ( CLEAR ?AUTO_951 ) ( HOLDING ?AUTO_956 ) ( CLEAR ?AUTO_957 ) )
    :subtasks
    ( ( !STACK ?AUTO_956 ?AUTO_957 )
      ( MAKE-ON ?AUTO_951 ?AUTO_952 )
      ( MAKE-ON-VERIFY ?AUTO_951 ?AUTO_952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_962 - BLOCK
      ?AUTO_963 - BLOCK
    )
    :vars
    (
      ?AUTO_964 - BLOCK
      ?AUTO_967 - BLOCK
      ?AUTO_968 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_963 ) ( ON ?AUTO_962 ?AUTO_964 ) ( CLEAR ?AUTO_967 ) ( ON ?AUTO_968 ?AUTO_962 ) ( CLEAR ?AUTO_968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_968 ?AUTO_962 )
      ( MAKE-ON ?AUTO_962 ?AUTO_963 )
      ( MAKE-ON-VERIFY ?AUTO_962 ?AUTO_963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_971 - BLOCK
      ?AUTO_972 - BLOCK
    )
    :vars
    (
      ?AUTO_976 - BLOCK
      ?AUTO_974 - BLOCK
      ?AUTO_975 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_971 ?AUTO_976 ) ( CLEAR ?AUTO_974 ) ( ON ?AUTO_975 ?AUTO_971 ) ( CLEAR ?AUTO_975 ) ( HOLDING ?AUTO_972 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_972 )
      ( MAKE-ON ?AUTO_971 ?AUTO_972 )
      ( MAKE-ON-VERIFY ?AUTO_971 ?AUTO_972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_979 - BLOCK
      ?AUTO_980 - BLOCK
    )
    :vars
    (
      ?AUTO_982 - BLOCK
      ?AUTO_981 - BLOCK
      ?AUTO_985 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_979 ?AUTO_982 ) ( CLEAR ?AUTO_981 ) ( ON ?AUTO_985 ?AUTO_979 ) ( ON ?AUTO_980 ?AUTO_985 ) ( CLEAR ?AUTO_980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_980 ?AUTO_985 )
      ( MAKE-ON ?AUTO_979 ?AUTO_980 )
      ( MAKE-ON-VERIFY ?AUTO_979 ?AUTO_980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_988 - BLOCK
      ?AUTO_989 - BLOCK
    )
    :vars
    (
      ?AUTO_993 - BLOCK
      ?AUTO_992 - BLOCK
      ?AUTO_994 - BLOCK
      ?AUTO_995 - BLOCK
      ?AUTO_996 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_988 ?AUTO_993 ) ( CLEAR ?AUTO_992 ) ( ON ?AUTO_994 ?AUTO_988 ) ( ON ?AUTO_989 ?AUTO_994 ) ( CLEAR ?AUTO_989 ) ( HOLDING ?AUTO_995 ) ( CLEAR ?AUTO_996 ) )
    :subtasks
    ( ( !STACK ?AUTO_995 ?AUTO_996 )
      ( MAKE-ON ?AUTO_988 ?AUTO_989 )
      ( MAKE-ON-VERIFY ?AUTO_988 ?AUTO_989 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1004 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1004 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1004 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1004 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1006 - BLOCK
    )
    :vars
    (
      ?AUTO_1009 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1006 ?AUTO_1009 ) ( CLEAR ?AUTO_1006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1006 ?AUTO_1009 )
      ( MAKE-ON-TABLE ?AUTO_1006 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1006 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1010 - BLOCK
    )
    :vars
    (
      ?AUTO_1012 - BLOCK
      ?AUTO_1013 - BLOCK
      ?AUTO_1014 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1010 ?AUTO_1012 ) ( CLEAR ?AUTO_1010 ) ( HOLDING ?AUTO_1013 ) ( CLEAR ?AUTO_1014 ) )
    :subtasks
    ( ( !STACK ?AUTO_1013 ?AUTO_1014 )
      ( MAKE-ON-TABLE ?AUTO_1010 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1010 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1015 - BLOCK
    )
    :vars
    (
      ?AUTO_1017 - BLOCK
      ?AUTO_1019 - BLOCK
      ?AUTO_1018 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1015 ?AUTO_1017 ) ( CLEAR ?AUTO_1019 ) ( ON ?AUTO_1018 ?AUTO_1015 ) ( CLEAR ?AUTO_1018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1018 ?AUTO_1015 )
      ( MAKE-ON-TABLE ?AUTO_1015 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1015 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1022 - BLOCK
    )
    :vars
    (
      ?AUTO_1025 - BLOCK
      ?AUTO_1023 - BLOCK
      ?AUTO_1026 - BLOCK
      ?AUTO_1027 - BLOCK
      ?AUTO_1028 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1022 ?AUTO_1025 ) ( CLEAR ?AUTO_1023 ) ( ON ?AUTO_1026 ?AUTO_1022 ) ( CLEAR ?AUTO_1026 ) ( HOLDING ?AUTO_1027 ) ( CLEAR ?AUTO_1028 ) )
    :subtasks
    ( ( !STACK ?AUTO_1027 ?AUTO_1028 )
      ( MAKE-ON-TABLE ?AUTO_1022 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1022 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1031 - BLOCK
    )
    :vars
    (
      ?AUTO_1037 - BLOCK
      ?AUTO_1032 - BLOCK
      ?AUTO_1036 - BLOCK
      ?AUTO_1035 - BLOCK
      ?AUTO_1033 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1031 ?AUTO_1037 ) ( CLEAR ?AUTO_1032 ) ( ON ?AUTO_1036 ?AUTO_1031 ) ( CLEAR ?AUTO_1035 ) ( ON ?AUTO_1033 ?AUTO_1036 ) ( CLEAR ?AUTO_1033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1033 ?AUTO_1036 )
      ( MAKE-ON-TABLE ?AUTO_1031 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1031 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1040 - BLOCK
    )
    :vars
    (
      ?AUTO_1043 - BLOCK
      ?AUTO_1046 - BLOCK
      ?AUTO_1041 - BLOCK
      ?AUTO_1045 - BLOCK
      ?AUTO_1044 - BLOCK
      ?AUTO_1047 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1040 ?AUTO_1043 ) ( CLEAR ?AUTO_1046 ) ( ON ?AUTO_1041 ?AUTO_1040 ) ( CLEAR ?AUTO_1045 ) ( ON ?AUTO_1044 ?AUTO_1041 ) ( CLEAR ?AUTO_1044 ) ( HOLDING ?AUTO_1047 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1047 )
      ( MAKE-ON-TABLE ?AUTO_1040 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1040 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1048 - BLOCK
    )
    :vars
    (
      ?AUTO_1055 - BLOCK
      ?AUTO_1050 - BLOCK
      ?AUTO_1051 - BLOCK
      ?AUTO_1052 - BLOCK
      ?AUTO_1049 - BLOCK
      ?AUTO_1054 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1048 ?AUTO_1055 ) ( CLEAR ?AUTO_1050 ) ( ON ?AUTO_1051 ?AUTO_1048 ) ( CLEAR ?AUTO_1052 ) ( ON ?AUTO_1049 ?AUTO_1051 ) ( ON ?AUTO_1054 ?AUTO_1049 ) ( CLEAR ?AUTO_1054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1054 ?AUTO_1049 )
      ( MAKE-ON-TABLE ?AUTO_1048 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1048 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1058 - BLOCK
    )
    :vars
    (
      ?AUTO_1061 - BLOCK
      ?AUTO_1060 - BLOCK
      ?AUTO_1062 - BLOCK
      ?AUTO_1064 - BLOCK
      ?AUTO_1059 - BLOCK
      ?AUTO_1065 - BLOCK
      ?AUTO_1066 - BLOCK
      ?AUTO_1067 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1058 ?AUTO_1061 ) ( CLEAR ?AUTO_1060 ) ( ON ?AUTO_1062 ?AUTO_1058 ) ( CLEAR ?AUTO_1064 ) ( ON ?AUTO_1059 ?AUTO_1062 ) ( ON ?AUTO_1065 ?AUTO_1059 ) ( CLEAR ?AUTO_1065 ) ( HOLDING ?AUTO_1066 ) ( CLEAR ?AUTO_1067 ) )
    :subtasks
    ( ( !STACK ?AUTO_1066 ?AUTO_1067 )
      ( MAKE-ON-TABLE ?AUTO_1058 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1073 - BLOCK
      ?AUTO_1074 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1073 ) ( CLEAR ?AUTO_1074 ) )
    :subtasks
    ( ( !STACK ?AUTO_1073 ?AUTO_1074 )
      ( MAKE-ON-VERIFY ?AUTO_1073 ?AUTO_1074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1077 - BLOCK
      ?AUTO_1078 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1078 ) ( ON-TABLE ?AUTO_1077 ) ( CLEAR ?AUTO_1077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1077 )
      ( MAKE-ON ?AUTO_1077 ?AUTO_1078 )
      ( MAKE-ON-VERIFY ?AUTO_1077 ?AUTO_1078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1082 - BLOCK
      ?AUTO_1083 - BLOCK
    )
    :vars
    (
      ?AUTO_1086 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1083 ) ( ON-TABLE ?AUTO_1082 ) ( CLEAR ?AUTO_1082 ) ( HOLDING ?AUTO_1086 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1086 )
      ( MAKE-ON ?AUTO_1082 ?AUTO_1083 )
      ( MAKE-ON-VERIFY ?AUTO_1082 ?AUTO_1083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1087 - BLOCK
      ?AUTO_1088 - BLOCK
    )
    :vars
    (
      ?AUTO_1091 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1088 ) ( ON-TABLE ?AUTO_1087 ) ( ON ?AUTO_1091 ?AUTO_1087 ) ( CLEAR ?AUTO_1091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1091 ?AUTO_1087 )
      ( MAKE-ON ?AUTO_1087 ?AUTO_1088 )
      ( MAKE-ON-VERIFY ?AUTO_1087 ?AUTO_1088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1094 - BLOCK
      ?AUTO_1095 - BLOCK
    )
    :vars
    (
      ?AUTO_1098 - BLOCK
      ?AUTO_1099 - BLOCK
      ?AUTO_1100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1095 ) ( ON-TABLE ?AUTO_1094 ) ( ON ?AUTO_1098 ?AUTO_1094 ) ( CLEAR ?AUTO_1098 ) ( HOLDING ?AUTO_1099 ) ( CLEAR ?AUTO_1100 ) )
    :subtasks
    ( ( !STACK ?AUTO_1099 ?AUTO_1100 )
      ( MAKE-ON ?AUTO_1094 ?AUTO_1095 )
      ( MAKE-ON-VERIFY ?AUTO_1094 ?AUTO_1095 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1101 - BLOCK
      ?AUTO_1102 - BLOCK
    )
    :vars
    (
      ?AUTO_1103 - BLOCK
      ?AUTO_1107 - BLOCK
      ?AUTO_1106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1102 ) ( ON-TABLE ?AUTO_1101 ) ( ON ?AUTO_1103 ?AUTO_1101 ) ( CLEAR ?AUTO_1107 ) ( ON ?AUTO_1106 ?AUTO_1103 ) ( CLEAR ?AUTO_1106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1106 ?AUTO_1103 )
      ( MAKE-ON ?AUTO_1101 ?AUTO_1102 )
      ( MAKE-ON-VERIFY ?AUTO_1101 ?AUTO_1102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1110 - BLOCK
      ?AUTO_1111 - BLOCK
    )
    :vars
    (
      ?AUTO_1113 - BLOCK
      ?AUTO_1116 - BLOCK
      ?AUTO_1112 - BLOCK
      ?AUTO_1118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1110 ) ( ON ?AUTO_1113 ?AUTO_1110 ) ( CLEAR ?AUTO_1116 ) ( ON ?AUTO_1112 ?AUTO_1113 ) ( CLEAR ?AUTO_1112 ) ( HOLDING ?AUTO_1111 ) ( CLEAR ?AUTO_1118 ) )
    :subtasks
    ( ( !STACK ?AUTO_1111 ?AUTO_1118 )
      ( MAKE-ON ?AUTO_1110 ?AUTO_1111 )
      ( MAKE-ON-VERIFY ?AUTO_1110 ?AUTO_1111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1121 - BLOCK
      ?AUTO_1122 - BLOCK
    )
    :vars
    (
      ?AUTO_1123 - BLOCK
      ?AUTO_1127 - BLOCK
      ?AUTO_1125 - BLOCK
      ?AUTO_1128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1122 ) ( ON-TABLE ?AUTO_1121 ) ( ON ?AUTO_1123 ?AUTO_1121 ) ( CLEAR ?AUTO_1127 ) ( ON ?AUTO_1125 ?AUTO_1123 ) ( CLEAR ?AUTO_1125 ) ( HOLDING ?AUTO_1128 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1128 )
      ( MAKE-ON ?AUTO_1121 ?AUTO_1122 )
      ( MAKE-ON-VERIFY ?AUTO_1121 ?AUTO_1122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1129 - BLOCK
      ?AUTO_1130 - BLOCK
    )
    :vars
    (
      ?AUTO_1134 - BLOCK
      ?AUTO_1135 - BLOCK
      ?AUTO_1136 - BLOCK
      ?AUTO_1132 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1130 ) ( ON-TABLE ?AUTO_1129 ) ( ON ?AUTO_1134 ?AUTO_1129 ) ( CLEAR ?AUTO_1135 ) ( ON ?AUTO_1136 ?AUTO_1134 ) ( ON ?AUTO_1132 ?AUTO_1136 ) ( CLEAR ?AUTO_1132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1132 ?AUTO_1136 )
      ( MAKE-ON ?AUTO_1129 ?AUTO_1130 )
      ( MAKE-ON-VERIFY ?AUTO_1129 ?AUTO_1130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1139 - BLOCK
      ?AUTO_1140 - BLOCK
    )
    :vars
    (
      ?AUTO_1145 - BLOCK
      ?AUTO_1141 - BLOCK
      ?AUTO_1142 - BLOCK
      ?AUTO_1144 - BLOCK
      ?AUTO_1147 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1140 ) ( ON-TABLE ?AUTO_1139 ) ( ON ?AUTO_1145 ?AUTO_1139 ) ( CLEAR ?AUTO_1141 ) ( ON ?AUTO_1142 ?AUTO_1145 ) ( ON ?AUTO_1144 ?AUTO_1142 ) ( CLEAR ?AUTO_1144 ) ( HOLDING ?AUTO_1147 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1147 )
      ( MAKE-ON ?AUTO_1139 ?AUTO_1140 )
      ( MAKE-ON-VERIFY ?AUTO_1139 ?AUTO_1140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1148 - BLOCK
      ?AUTO_1149 - BLOCK
    )
    :vars
    (
      ?AUTO_1152 - BLOCK
      ?AUTO_1151 - BLOCK
      ?AUTO_1153 - BLOCK
      ?AUTO_1150 - BLOCK
      ?AUTO_1156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1149 ) ( ON-TABLE ?AUTO_1148 ) ( ON ?AUTO_1152 ?AUTO_1148 ) ( CLEAR ?AUTO_1151 ) ( ON ?AUTO_1153 ?AUTO_1152 ) ( ON ?AUTO_1150 ?AUTO_1153 ) ( ON ?AUTO_1156 ?AUTO_1150 ) ( CLEAR ?AUTO_1156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1156 ?AUTO_1150 )
      ( MAKE-ON ?AUTO_1148 ?AUTO_1149 )
      ( MAKE-ON-VERIFY ?AUTO_1148 ?AUTO_1149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1159 - BLOCK
      ?AUTO_1160 - BLOCK
    )
    :vars
    (
      ?AUTO_1165 - BLOCK
      ?AUTO_1163 - BLOCK
      ?AUTO_1164 - BLOCK
      ?AUTO_1162 - BLOCK
      ?AUTO_1166 - BLOCK
      ?AUTO_1168 - BLOCK
      ?AUTO_1169 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1160 ) ( ON-TABLE ?AUTO_1159 ) ( ON ?AUTO_1165 ?AUTO_1159 ) ( CLEAR ?AUTO_1163 ) ( ON ?AUTO_1164 ?AUTO_1165 ) ( ON ?AUTO_1162 ?AUTO_1164 ) ( ON ?AUTO_1166 ?AUTO_1162 ) ( CLEAR ?AUTO_1166 ) ( HOLDING ?AUTO_1168 ) ( CLEAR ?AUTO_1169 ) )
    :subtasks
    ( ( !STACK ?AUTO_1168 ?AUTO_1169 )
      ( MAKE-ON ?AUTO_1159 ?AUTO_1160 )
      ( MAKE-ON-VERIFY ?AUTO_1159 ?AUTO_1160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1178 - BLOCK
      ?AUTO_1179 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1178 ) ( CLEAR ?AUTO_1179 ) )
    :subtasks
    ( ( !STACK ?AUTO_1178 ?AUTO_1179 )
      ( MAKE-ON-VERIFY ?AUTO_1178 ?AUTO_1179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1182 - BLOCK
      ?AUTO_1183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1183 ) ( ON-TABLE ?AUTO_1182 ) ( CLEAR ?AUTO_1182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1182 )
      ( MAKE-ON ?AUTO_1182 ?AUTO_1183 )
      ( MAKE-ON-VERIFY ?AUTO_1182 ?AUTO_1183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1187 - BLOCK
      ?AUTO_1188 - BLOCK
    )
    :vars
    (
      ?AUTO_1191 - BLOCK
      ?AUTO_1192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1188 ) ( ON-TABLE ?AUTO_1187 ) ( CLEAR ?AUTO_1187 ) ( HOLDING ?AUTO_1191 ) ( CLEAR ?AUTO_1192 ) )
    :subtasks
    ( ( !STACK ?AUTO_1191 ?AUTO_1192 )
      ( MAKE-ON ?AUTO_1187 ?AUTO_1188 )
      ( MAKE-ON-VERIFY ?AUTO_1187 ?AUTO_1188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1195 - BLOCK
      ?AUTO_1196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1195 ) ( CLEAR ?AUTO_1195 ) ( HOLDING ?AUTO_1196 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1196 )
      ( MAKE-ON ?AUTO_1195 ?AUTO_1196 )
      ( MAKE-ON-VERIFY ?AUTO_1195 ?AUTO_1196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1204 - BLOCK
      ?AUTO_1205 - BLOCK
    )
    :vars
    (
      ?AUTO_1209 - BLOCK
      ?AUTO_1208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1204 ) ( CLEAR ?AUTO_1204 ) ( CLEAR ?AUTO_1209 ) ( ON ?AUTO_1208 ?AUTO_1205 ) ( CLEAR ?AUTO_1208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1208 ?AUTO_1205 )
      ( MAKE-ON ?AUTO_1204 ?AUTO_1205 )
      ( MAKE-ON-VERIFY ?AUTO_1204 ?AUTO_1205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1212 - BLOCK
      ?AUTO_1213 - BLOCK
    )
    :vars
    (
      ?AUTO_1216 - BLOCK
      ?AUTO_1217 - BLOCK
      ?AUTO_1218 - BLOCK
      ?AUTO_1219 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1212 ) ( CLEAR ?AUTO_1212 ) ( CLEAR ?AUTO_1216 ) ( ON ?AUTO_1217 ?AUTO_1213 ) ( CLEAR ?AUTO_1217 ) ( HOLDING ?AUTO_1218 ) ( CLEAR ?AUTO_1219 ) )
    :subtasks
    ( ( !STACK ?AUTO_1218 ?AUTO_1219 )
      ( MAKE-ON ?AUTO_1212 ?AUTO_1213 )
      ( MAKE-ON-VERIFY ?AUTO_1212 ?AUTO_1213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1224 - BLOCK
      ?AUTO_1225 - BLOCK
    )
    :vars
    (
      ?AUTO_1226 - BLOCK
      ?AUTO_1228 - BLOCK
      ?AUTO_1231 - BLOCK
      ?AUTO_1227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1224 ) ( CLEAR ?AUTO_1224 ) ( CLEAR ?AUTO_1226 ) ( ON ?AUTO_1228 ?AUTO_1225 ) ( CLEAR ?AUTO_1231 ) ( ON ?AUTO_1227 ?AUTO_1228 ) ( CLEAR ?AUTO_1227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1227 ?AUTO_1228 )
      ( MAKE-ON ?AUTO_1224 ?AUTO_1225 )
      ( MAKE-ON-VERIFY ?AUTO_1224 ?AUTO_1225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1234 - BLOCK
      ?AUTO_1235 - BLOCK
    )
    :vars
    (
      ?AUTO_1240 - BLOCK
      ?AUTO_1237 - BLOCK
      ?AUTO_1236 - BLOCK
      ?AUTO_1241 - BLOCK
      ?AUTO_1242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1234 ) ( CLEAR ?AUTO_1234 ) ( CLEAR ?AUTO_1240 ) ( ON ?AUTO_1237 ?AUTO_1235 ) ( CLEAR ?AUTO_1236 ) ( ON ?AUTO_1241 ?AUTO_1237 ) ( CLEAR ?AUTO_1241 ) ( HOLDING ?AUTO_1242 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1242 )
      ( MAKE-ON ?AUTO_1234 ?AUTO_1235 )
      ( MAKE-ON-VERIFY ?AUTO_1234 ?AUTO_1235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1243 - BLOCK
      ?AUTO_1244 - BLOCK
    )
    :vars
    (
      ?AUTO_1247 - BLOCK
      ?AUTO_1251 - BLOCK
      ?AUTO_1249 - BLOCK
      ?AUTO_1250 - BLOCK
      ?AUTO_1245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1243 ) ( CLEAR ?AUTO_1243 ) ( CLEAR ?AUTO_1247 ) ( ON ?AUTO_1251 ?AUTO_1244 ) ( CLEAR ?AUTO_1249 ) ( ON ?AUTO_1250 ?AUTO_1251 ) ( ON ?AUTO_1245 ?AUTO_1250 ) ( CLEAR ?AUTO_1245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1245 ?AUTO_1250 )
      ( MAKE-ON ?AUTO_1243 ?AUTO_1244 )
      ( MAKE-ON-VERIFY ?AUTO_1243 ?AUTO_1244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1254 - BLOCK
      ?AUTO_1255 - BLOCK
    )
    :vars
    (
      ?AUTO_1260 - BLOCK
      ?AUTO_1257 - BLOCK
      ?AUTO_1262 - BLOCK
      ?AUTO_1259 - BLOCK
      ?AUTO_1258 - BLOCK
      ?AUTO_1263 - BLOCK
      ?AUTO_1264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1254 ) ( CLEAR ?AUTO_1254 ) ( CLEAR ?AUTO_1260 ) ( ON ?AUTO_1257 ?AUTO_1255 ) ( CLEAR ?AUTO_1262 ) ( ON ?AUTO_1259 ?AUTO_1257 ) ( ON ?AUTO_1258 ?AUTO_1259 ) ( CLEAR ?AUTO_1258 ) ( HOLDING ?AUTO_1263 ) ( CLEAR ?AUTO_1264 ) )
    :subtasks
    ( ( !STACK ?AUTO_1263 ?AUTO_1264 )
      ( MAKE-ON ?AUTO_1254 ?AUTO_1255 )
      ( MAKE-ON-VERIFY ?AUTO_1254 ?AUTO_1255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1265 - BLOCK
      ?AUTO_1266 - BLOCK
    )
    :vars
    (
      ?AUTO_1272 - BLOCK
      ?AUTO_1271 - BLOCK
      ?AUTO_1267 - BLOCK
      ?AUTO_1274 - BLOCK
      ?AUTO_1273 - BLOCK
      ?AUTO_1275 - BLOCK
      ?AUTO_1268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1265 ) ( CLEAR ?AUTO_1272 ) ( ON ?AUTO_1271 ?AUTO_1266 ) ( CLEAR ?AUTO_1267 ) ( ON ?AUTO_1274 ?AUTO_1271 ) ( ON ?AUTO_1273 ?AUTO_1274 ) ( CLEAR ?AUTO_1273 ) ( CLEAR ?AUTO_1275 ) ( ON ?AUTO_1268 ?AUTO_1265 ) ( CLEAR ?AUTO_1268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1268 ?AUTO_1265 )
      ( MAKE-ON ?AUTO_1265 ?AUTO_1266 )
      ( MAKE-ON-VERIFY ?AUTO_1265 ?AUTO_1266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1278 - BLOCK
      ?AUTO_1279 - BLOCK
    )
    :vars
    (
      ?AUTO_1281 - BLOCK
      ?AUTO_1280 - BLOCK
      ?AUTO_1286 - BLOCK
      ?AUTO_1288 - BLOCK
      ?AUTO_1284 - BLOCK
      ?AUTO_1285 - BLOCK
      ?AUTO_1287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1278 ) ( CLEAR ?AUTO_1281 ) ( ON ?AUTO_1280 ?AUTO_1279 ) ( CLEAR ?AUTO_1286 ) ( ON ?AUTO_1288 ?AUTO_1280 ) ( ON ?AUTO_1284 ?AUTO_1288 ) ( CLEAR ?AUTO_1284 ) ( ON ?AUTO_1285 ?AUTO_1278 ) ( CLEAR ?AUTO_1285 ) ( HOLDING ?AUTO_1287 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1287 )
      ( MAKE-ON ?AUTO_1278 ?AUTO_1279 )
      ( MAKE-ON-VERIFY ?AUTO_1278 ?AUTO_1279 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1290 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1290 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1290 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1290 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1292 - BLOCK
    )
    :vars
    (
      ?AUTO_1295 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1292 ?AUTO_1295 ) ( CLEAR ?AUTO_1292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1292 ?AUTO_1295 )
      ( MAKE-ON-TABLE ?AUTO_1292 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1292 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1297 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1297 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1297 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1297 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1299 - BLOCK
    )
    :vars
    (
      ?AUTO_1302 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1299 ?AUTO_1302 ) ( CLEAR ?AUTO_1299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1299 ?AUTO_1302 )
      ( MAKE-ON-TABLE ?AUTO_1299 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1299 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1303 - BLOCK
    )
    :vars
    (
      ?AUTO_1305 - BLOCK
      ?AUTO_1306 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1303 ?AUTO_1305 ) ( CLEAR ?AUTO_1303 ) ( HOLDING ?AUTO_1306 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1306 )
      ( MAKE-ON-TABLE ?AUTO_1303 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1303 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1307 - BLOCK
    )
    :vars
    (
      ?AUTO_1309 - BLOCK
      ?AUTO_1310 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1307 ?AUTO_1309 ) ( ON ?AUTO_1310 ?AUTO_1307 ) ( CLEAR ?AUTO_1310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1310 ?AUTO_1307 )
      ( MAKE-ON-TABLE ?AUTO_1307 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1307 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1314 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1314 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1314 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1314 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1316 - BLOCK
    )
    :vars
    (
      ?AUTO_1319 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1316 ?AUTO_1319 ) ( CLEAR ?AUTO_1316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1316 ?AUTO_1319 )
      ( MAKE-ON-TABLE ?AUTO_1316 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1316 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1320 - BLOCK
    )
    :vars
    (
      ?AUTO_1322 - BLOCK
      ?AUTO_1323 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1320 ?AUTO_1322 ) ( CLEAR ?AUTO_1320 ) ( HOLDING ?AUTO_1323 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1323 )
      ( MAKE-ON-TABLE ?AUTO_1320 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1329 - BLOCK
      ?AUTO_1330 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1329 ) ( CLEAR ?AUTO_1330 ) )
    :subtasks
    ( ( !STACK ?AUTO_1329 ?AUTO_1330 )
      ( MAKE-ON-VERIFY ?AUTO_1329 ?AUTO_1330 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_1334 ) ( ON ?AUTO_1333 ?AUTO_1338 ) ( CLEAR ?AUTO_1333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1333 ?AUTO_1338 )
      ( MAKE-ON ?AUTO_1333 ?AUTO_1334 )
      ( MAKE-ON-VERIFY ?AUTO_1333 ?AUTO_1334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1339 - BLOCK
      ?AUTO_1340 - BLOCK
    )
    :vars
    (
      ?AUTO_1343 - BLOCK
      ?AUTO_1344 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1340 ) ( ON ?AUTO_1339 ?AUTO_1343 ) ( CLEAR ?AUTO_1339 ) ( HOLDING ?AUTO_1344 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1344 )
      ( MAKE-ON ?AUTO_1339 ?AUTO_1340 )
      ( MAKE-ON-VERIFY ?AUTO_1339 ?AUTO_1340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1345 - BLOCK
      ?AUTO_1346 - BLOCK
    )
    :vars
    (
      ?AUTO_1349 - BLOCK
      ?AUTO_1350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1346 ) ( ON ?AUTO_1345 ?AUTO_1349 ) ( ON ?AUTO_1350 ?AUTO_1345 ) ( CLEAR ?AUTO_1350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1350 ?AUTO_1345 )
      ( MAKE-ON ?AUTO_1345 ?AUTO_1346 )
      ( MAKE-ON-VERIFY ?AUTO_1345 ?AUTO_1346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1353 - BLOCK
      ?AUTO_1354 - BLOCK
    )
    :vars
    (
      ?AUTO_1358 - BLOCK
      ?AUTO_1355 - BLOCK
      ?AUTO_1359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1354 ) ( ON ?AUTO_1353 ?AUTO_1358 ) ( ON ?AUTO_1355 ?AUTO_1353 ) ( CLEAR ?AUTO_1355 ) ( HOLDING ?AUTO_1359 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1359 )
      ( MAKE-ON ?AUTO_1353 ?AUTO_1354 )
      ( MAKE-ON-VERIFY ?AUTO_1353 ?AUTO_1354 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1367 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1367 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1367 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1367 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1369 - BLOCK
    )
    :vars
    (
      ?AUTO_1372 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1369 ?AUTO_1372 ) ( CLEAR ?AUTO_1369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1369 ?AUTO_1372 )
      ( MAKE-ON-TABLE ?AUTO_1369 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1369 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1373 - BLOCK
    )
    :vars
    (
      ?AUTO_1375 - BLOCK
      ?AUTO_1376 - BLOCK
      ?AUTO_1377 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1373 ?AUTO_1375 ) ( CLEAR ?AUTO_1373 ) ( HOLDING ?AUTO_1376 ) ( CLEAR ?AUTO_1377 ) )
    :subtasks
    ( ( !STACK ?AUTO_1376 ?AUTO_1377 )
      ( MAKE-ON-TABLE ?AUTO_1373 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1373 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1378 - BLOCK
    )
    :vars
    (
      ?AUTO_1380 - BLOCK
      ?AUTO_1382 - BLOCK
      ?AUTO_1381 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1378 ?AUTO_1380 ) ( CLEAR ?AUTO_1382 ) ( ON ?AUTO_1381 ?AUTO_1378 ) ( CLEAR ?AUTO_1381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1381 ?AUTO_1378 )
      ( MAKE-ON-TABLE ?AUTO_1378 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1378 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1385 - BLOCK
    )
    :vars
    (
      ?AUTO_1388 - BLOCK
      ?AUTO_1386 - BLOCK
      ?AUTO_1389 - BLOCK
      ?AUTO_1390 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1385 ?AUTO_1388 ) ( CLEAR ?AUTO_1386 ) ( ON ?AUTO_1389 ?AUTO_1385 ) ( CLEAR ?AUTO_1389 ) ( HOLDING ?AUTO_1390 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1390 )
      ( MAKE-ON-TABLE ?AUTO_1385 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1385 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1391 - BLOCK
    )
    :vars
    (
      ?AUTO_1392 - BLOCK
      ?AUTO_1394 - BLOCK
      ?AUTO_1393 - BLOCK
      ?AUTO_1396 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1391 ?AUTO_1392 ) ( CLEAR ?AUTO_1394 ) ( ON ?AUTO_1393 ?AUTO_1391 ) ( ON ?AUTO_1396 ?AUTO_1393 ) ( CLEAR ?AUTO_1396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1396 ?AUTO_1393 )
      ( MAKE-ON-TABLE ?AUTO_1391 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1391 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1399 - BLOCK
    )
    :vars
    (
      ?AUTO_1401 - BLOCK
      ?AUTO_1404 - BLOCK
      ?AUTO_1400 - BLOCK
      ?AUTO_1403 - BLOCK
      ?AUTO_1405 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1399 ?AUTO_1401 ) ( CLEAR ?AUTO_1404 ) ( ON ?AUTO_1400 ?AUTO_1399 ) ( ON ?AUTO_1403 ?AUTO_1400 ) ( CLEAR ?AUTO_1403 ) ( HOLDING ?AUTO_1405 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1405 )
      ( MAKE-ON-TABLE ?AUTO_1399 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1411 - BLOCK
      ?AUTO_1412 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1411 ) ( CLEAR ?AUTO_1412 ) )
    :subtasks
    ( ( !STACK ?AUTO_1411 ?AUTO_1412 )
      ( MAKE-ON-VERIFY ?AUTO_1411 ?AUTO_1412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1415 - BLOCK
      ?AUTO_1416 - BLOCK
    )
    :vars
    (
      ?AUTO_1420 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1416 ) ( ON ?AUTO_1415 ?AUTO_1420 ) ( CLEAR ?AUTO_1415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1415 ?AUTO_1420 )
      ( MAKE-ON ?AUTO_1415 ?AUTO_1416 )
      ( MAKE-ON-VERIFY ?AUTO_1415 ?AUTO_1416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1421 - BLOCK
      ?AUTO_1422 - BLOCK
    )
    :vars
    (
      ?AUTO_1425 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1421 ?AUTO_1425 ) ( CLEAR ?AUTO_1421 ) ( HOLDING ?AUTO_1422 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1422 )
      ( MAKE-ON ?AUTO_1421 ?AUTO_1422 )
      ( MAKE-ON-VERIFY ?AUTO_1421 ?AUTO_1422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1429 - BLOCK
      ?AUTO_1430 - BLOCK
    )
    :vars
    (
      ?AUTO_1431 - BLOCK
      ?AUTO_1434 - BLOCK
      ?AUTO_1435 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1430 ) ( ON ?AUTO_1429 ?AUTO_1431 ) ( CLEAR ?AUTO_1429 ) ( HOLDING ?AUTO_1434 ) ( CLEAR ?AUTO_1435 ) )
    :subtasks
    ( ( !STACK ?AUTO_1434 ?AUTO_1435 )
      ( MAKE-ON ?AUTO_1429 ?AUTO_1430 )
      ( MAKE-ON-VERIFY ?AUTO_1429 ?AUTO_1430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1436 - BLOCK
      ?AUTO_1437 - BLOCK
    )
    :vars
    (
      ?AUTO_1439 - BLOCK
      ?AUTO_1442 - BLOCK
      ?AUTO_1441 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1436 ?AUTO_1439 ) ( CLEAR ?AUTO_1436 ) ( CLEAR ?AUTO_1442 ) ( ON ?AUTO_1441 ?AUTO_1437 ) ( CLEAR ?AUTO_1441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1441 ?AUTO_1437 )
      ( MAKE-ON ?AUTO_1436 ?AUTO_1437 )
      ( MAKE-ON-VERIFY ?AUTO_1436 ?AUTO_1437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1445 - BLOCK
      ?AUTO_1446 - BLOCK
    )
    :vars
    (
      ?AUTO_1450 - BLOCK
      ?AUTO_1447 - BLOCK
      ?AUTO_1451 - BLOCK
      ?AUTO_1452 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1445 ?AUTO_1450 ) ( CLEAR ?AUTO_1445 ) ( CLEAR ?AUTO_1447 ) ( ON ?AUTO_1451 ?AUTO_1446 ) ( CLEAR ?AUTO_1451 ) ( HOLDING ?AUTO_1452 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1452 )
      ( MAKE-ON ?AUTO_1445 ?AUTO_1446 )
      ( MAKE-ON-VERIFY ?AUTO_1445 ?AUTO_1446 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1453 - BLOCK
      ?AUTO_1454 - BLOCK
    )
    :vars
    (
      ?AUTO_1455 - BLOCK
      ?AUTO_1456 - BLOCK
      ?AUTO_1457 - BLOCK
      ?AUTO_1460 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1453 ?AUTO_1455 ) ( CLEAR ?AUTO_1453 ) ( CLEAR ?AUTO_1456 ) ( ON ?AUTO_1457 ?AUTO_1454 ) ( ON ?AUTO_1460 ?AUTO_1457 ) ( CLEAR ?AUTO_1460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1460 ?AUTO_1457 )
      ( MAKE-ON ?AUTO_1453 ?AUTO_1454 )
      ( MAKE-ON-VERIFY ?AUTO_1453 ?AUTO_1454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1463 - BLOCK
      ?AUTO_1464 - BLOCK
    )
    :vars
    (
      ?AUTO_1468 - BLOCK
      ?AUTO_1466 - BLOCK
      ?AUTO_1469 - BLOCK
      ?AUTO_1470 - BLOCK
      ?AUTO_1471 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1463 ?AUTO_1468 ) ( CLEAR ?AUTO_1463 ) ( CLEAR ?AUTO_1466 ) ( ON ?AUTO_1469 ?AUTO_1464 ) ( ON ?AUTO_1470 ?AUTO_1469 ) ( CLEAR ?AUTO_1470 ) ( HOLDING ?AUTO_1471 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1471 )
      ( MAKE-ON ?AUTO_1463 ?AUTO_1464 )
      ( MAKE-ON-VERIFY ?AUTO_1463 ?AUTO_1464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1472 - BLOCK
      ?AUTO_1473 - BLOCK
    )
    :vars
    (
      ?AUTO_1476 - BLOCK
      ?AUTO_1479 - BLOCK
      ?AUTO_1475 - BLOCK
      ?AUTO_1474 - BLOCK
      ?AUTO_1480 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1472 ?AUTO_1476 ) ( CLEAR ?AUTO_1479 ) ( ON ?AUTO_1475 ?AUTO_1473 ) ( ON ?AUTO_1474 ?AUTO_1475 ) ( CLEAR ?AUTO_1474 ) ( ON ?AUTO_1480 ?AUTO_1472 ) ( CLEAR ?AUTO_1480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1480 ?AUTO_1472 )
      ( MAKE-ON ?AUTO_1472 ?AUTO_1473 )
      ( MAKE-ON-VERIFY ?AUTO_1472 ?AUTO_1473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1483 - BLOCK
      ?AUTO_1484 - BLOCK
    )
    :vars
    (
      ?AUTO_1489 - BLOCK
      ?AUTO_1488 - BLOCK
      ?AUTO_1487 - BLOCK
      ?AUTO_1486 - BLOCK
      ?AUTO_1491 - BLOCK
      ?AUTO_1492 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1483 ?AUTO_1489 ) ( CLEAR ?AUTO_1488 ) ( ON ?AUTO_1487 ?AUTO_1484 ) ( ON ?AUTO_1486 ?AUTO_1487 ) ( CLEAR ?AUTO_1486 ) ( ON ?AUTO_1491 ?AUTO_1483 ) ( CLEAR ?AUTO_1491 ) ( HOLDING ?AUTO_1492 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1492 )
      ( MAKE-ON ?AUTO_1483 ?AUTO_1484 )
      ( MAKE-ON-VERIFY ?AUTO_1483 ?AUTO_1484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1493 - BLOCK
      ?AUTO_1494 - BLOCK
    )
    :vars
    (
      ?AUTO_1500 - BLOCK
      ?AUTO_1495 - BLOCK
      ?AUTO_1501 - BLOCK
      ?AUTO_1497 - BLOCK
      ?AUTO_1496 - BLOCK
      ?AUTO_1502 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1493 ?AUTO_1500 ) ( CLEAR ?AUTO_1495 ) ( ON ?AUTO_1501 ?AUTO_1494 ) ( ON ?AUTO_1497 ?AUTO_1501 ) ( CLEAR ?AUTO_1497 ) ( ON ?AUTO_1496 ?AUTO_1493 ) ( ON ?AUTO_1502 ?AUTO_1496 ) ( CLEAR ?AUTO_1502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1502 ?AUTO_1496 )
      ( MAKE-ON ?AUTO_1493 ?AUTO_1494 )
      ( MAKE-ON-VERIFY ?AUTO_1493 ?AUTO_1494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1507 - BLOCK
      ?AUTO_1508 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1507 ) ( CLEAR ?AUTO_1508 ) )
    :subtasks
    ( ( !STACK ?AUTO_1507 ?AUTO_1508 )
      ( MAKE-ON-VERIFY ?AUTO_1507 ?AUTO_1508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1511 - BLOCK
      ?AUTO_1512 - BLOCK
    )
    :vars
    (
      ?AUTO_1516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1512 ) ( ON ?AUTO_1511 ?AUTO_1516 ) ( CLEAR ?AUTO_1511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1511 ?AUTO_1516 )
      ( MAKE-ON ?AUTO_1511 ?AUTO_1512 )
      ( MAKE-ON-VERIFY ?AUTO_1511 ?AUTO_1512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1517 - BLOCK
      ?AUTO_1518 - BLOCK
    )
    :vars
    (
      ?AUTO_1521 - BLOCK
      ?AUTO_1522 - BLOCK
      ?AUTO_1523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1518 ) ( ON ?AUTO_1517 ?AUTO_1521 ) ( CLEAR ?AUTO_1517 ) ( HOLDING ?AUTO_1522 ) ( CLEAR ?AUTO_1523 ) )
    :subtasks
    ( ( !STACK ?AUTO_1522 ?AUTO_1523 )
      ( MAKE-ON ?AUTO_1517 ?AUTO_1518 )
      ( MAKE-ON-VERIFY ?AUTO_1517 ?AUTO_1518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1524 - BLOCK
      ?AUTO_1525 - BLOCK
    )
    :vars
    (
      ?AUTO_1528 - BLOCK
      ?AUTO_1530 - BLOCK
      ?AUTO_1529 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1524 ?AUTO_1528 ) ( CLEAR ?AUTO_1524 ) ( CLEAR ?AUTO_1530 ) ( ON ?AUTO_1529 ?AUTO_1525 ) ( CLEAR ?AUTO_1529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1529 ?AUTO_1525 )
      ( MAKE-ON ?AUTO_1524 ?AUTO_1525 )
      ( MAKE-ON-VERIFY ?AUTO_1524 ?AUTO_1525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1533 - BLOCK
      ?AUTO_1534 - BLOCK
    )
    :vars
    (
      ?AUTO_1539 - BLOCK
      ?AUTO_1536 - BLOCK
      ?AUTO_1535 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1533 ?AUTO_1539 ) ( CLEAR ?AUTO_1533 ) ( ON ?AUTO_1536 ?AUTO_1534 ) ( CLEAR ?AUTO_1536 ) ( HOLDING ?AUTO_1535 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1535 )
      ( MAKE-ON ?AUTO_1533 ?AUTO_1534 )
      ( MAKE-ON-VERIFY ?AUTO_1533 ?AUTO_1534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1541 - BLOCK
      ?AUTO_1542 - BLOCK
    )
    :vars
    (
      ?AUTO_1547 - BLOCK
      ?AUTO_1545 - BLOCK
      ?AUTO_1543 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1541 ?AUTO_1547 ) ( ON ?AUTO_1545 ?AUTO_1542 ) ( CLEAR ?AUTO_1545 ) ( ON ?AUTO_1543 ?AUTO_1541 ) ( CLEAR ?AUTO_1543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1543 ?AUTO_1541 )
      ( MAKE-ON ?AUTO_1541 ?AUTO_1542 )
      ( MAKE-ON-VERIFY ?AUTO_1541 ?AUTO_1542 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1550 - BLOCK
      ?AUTO_1551 - BLOCK
    )
    :vars
    (
      ?AUTO_1556 - BLOCK
      ?AUTO_1555 - BLOCK
      ?AUTO_1554 - BLOCK
      ?AUTO_1557 - BLOCK
      ?AUTO_1558 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1550 ?AUTO_1556 ) ( ON ?AUTO_1555 ?AUTO_1551 ) ( CLEAR ?AUTO_1555 ) ( ON ?AUTO_1554 ?AUTO_1550 ) ( CLEAR ?AUTO_1554 ) ( HOLDING ?AUTO_1557 ) ( CLEAR ?AUTO_1558 ) )
    :subtasks
    ( ( !STACK ?AUTO_1557 ?AUTO_1558 )
      ( MAKE-ON ?AUTO_1550 ?AUTO_1551 )
      ( MAKE-ON-VERIFY ?AUTO_1550 ?AUTO_1551 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1559 - BLOCK
      ?AUTO_1560 - BLOCK
    )
    :vars
    (
      ?AUTO_1561 - BLOCK
      ?AUTO_1566 - BLOCK
      ?AUTO_1567 - BLOCK
      ?AUTO_1563 - BLOCK
      ?AUTO_1562 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1559 ?AUTO_1561 ) ( ON ?AUTO_1566 ?AUTO_1560 ) ( CLEAR ?AUTO_1566 ) ( ON ?AUTO_1567 ?AUTO_1559 ) ( CLEAR ?AUTO_1563 ) ( ON ?AUTO_1562 ?AUTO_1567 ) ( CLEAR ?AUTO_1562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1562 ?AUTO_1567 )
      ( MAKE-ON ?AUTO_1559 ?AUTO_1560 )
      ( MAKE-ON-VERIFY ?AUTO_1559 ?AUTO_1560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1570 - BLOCK
      ?AUTO_1571 - BLOCK
    )
    :vars
    (
      ?AUTO_1575 - BLOCK
      ?AUTO_1576 - BLOCK
      ?AUTO_1578 - BLOCK
      ?AUTO_1577 - BLOCK
      ?AUTO_1574 - BLOCK
      ?AUTO_1579 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1570 ?AUTO_1575 ) ( ON ?AUTO_1576 ?AUTO_1571 ) ( CLEAR ?AUTO_1576 ) ( ON ?AUTO_1578 ?AUTO_1570 ) ( CLEAR ?AUTO_1577 ) ( ON ?AUTO_1574 ?AUTO_1578 ) ( CLEAR ?AUTO_1574 ) ( HOLDING ?AUTO_1579 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1579 )
      ( MAKE-ON ?AUTO_1570 ?AUTO_1571 )
      ( MAKE-ON-VERIFY ?AUTO_1570 ?AUTO_1571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1580 - BLOCK
      ?AUTO_1581 - BLOCK
    )
    :vars
    (
      ?AUTO_1588 - BLOCK
      ?AUTO_1587 - BLOCK
      ?AUTO_1583 - BLOCK
      ?AUTO_1582 - BLOCK
      ?AUTO_1589 - BLOCK
      ?AUTO_1584 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1580 ?AUTO_1588 ) ( ON ?AUTO_1587 ?AUTO_1581 ) ( CLEAR ?AUTO_1587 ) ( ON ?AUTO_1583 ?AUTO_1580 ) ( CLEAR ?AUTO_1582 ) ( ON ?AUTO_1589 ?AUTO_1583 ) ( ON ?AUTO_1584 ?AUTO_1589 ) ( CLEAR ?AUTO_1584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1584 ?AUTO_1589 )
      ( MAKE-ON ?AUTO_1580 ?AUTO_1581 )
      ( MAKE-ON-VERIFY ?AUTO_1580 ?AUTO_1581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1592 - BLOCK
      ?AUTO_1593 - BLOCK
    )
    :vars
    (
      ?AUTO_1601 - BLOCK
      ?AUTO_1595 - BLOCK
      ?AUTO_1597 - BLOCK
      ?AUTO_1596 - BLOCK
      ?AUTO_1598 - BLOCK
      ?AUTO_1600 - BLOCK
      ?AUTO_1602 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1592 ?AUTO_1601 ) ( ON ?AUTO_1595 ?AUTO_1593 ) ( CLEAR ?AUTO_1595 ) ( ON ?AUTO_1597 ?AUTO_1592 ) ( CLEAR ?AUTO_1596 ) ( ON ?AUTO_1598 ?AUTO_1597 ) ( ON ?AUTO_1600 ?AUTO_1598 ) ( CLEAR ?AUTO_1600 ) ( HOLDING ?AUTO_1602 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1602 )
      ( MAKE-ON ?AUTO_1592 ?AUTO_1593 )
      ( MAKE-ON-VERIFY ?AUTO_1592 ?AUTO_1593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1603 - BLOCK
      ?AUTO_1604 - BLOCK
    )
    :vars
    (
      ?AUTO_1605 - BLOCK
      ?AUTO_1611 - BLOCK
      ?AUTO_1612 - BLOCK
      ?AUTO_1613 - BLOCK
      ?AUTO_1607 - BLOCK
      ?AUTO_1606 - BLOCK
      ?AUTO_1608 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1603 ?AUTO_1605 ) ( ON ?AUTO_1611 ?AUTO_1604 ) ( ON ?AUTO_1612 ?AUTO_1603 ) ( CLEAR ?AUTO_1613 ) ( ON ?AUTO_1607 ?AUTO_1612 ) ( ON ?AUTO_1606 ?AUTO_1607 ) ( CLEAR ?AUTO_1606 ) ( ON ?AUTO_1608 ?AUTO_1611 ) ( CLEAR ?AUTO_1608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1608 ?AUTO_1611 )
      ( MAKE-ON ?AUTO_1603 ?AUTO_1604 )
      ( MAKE-ON-VERIFY ?AUTO_1603 ?AUTO_1604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1616 - BLOCK
      ?AUTO_1617 - BLOCK
    )
    :vars
    (
      ?AUTO_1620 - BLOCK
      ?AUTO_1622 - BLOCK
      ?AUTO_1618 - BLOCK
      ?AUTO_1625 - BLOCK
      ?AUTO_1626 - BLOCK
      ?AUTO_1621 - BLOCK
      ?AUTO_1623 - BLOCK
      ?AUTO_1627 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1616 ?AUTO_1620 ) ( ON ?AUTO_1622 ?AUTO_1617 ) ( ON ?AUTO_1618 ?AUTO_1616 ) ( CLEAR ?AUTO_1625 ) ( ON ?AUTO_1626 ?AUTO_1618 ) ( ON ?AUTO_1621 ?AUTO_1626 ) ( CLEAR ?AUTO_1621 ) ( ON ?AUTO_1623 ?AUTO_1622 ) ( CLEAR ?AUTO_1623 ) ( HOLDING ?AUTO_1627 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1627 )
      ( MAKE-ON ?AUTO_1616 ?AUTO_1617 )
      ( MAKE-ON-VERIFY ?AUTO_1616 ?AUTO_1617 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1628 - BLOCK
      ?AUTO_1629 - BLOCK
    )
    :vars
    (
      ?AUTO_1639 - BLOCK
      ?AUTO_1634 - BLOCK
      ?AUTO_1633 - BLOCK
      ?AUTO_1631 - BLOCK
      ?AUTO_1638 - BLOCK
      ?AUTO_1632 - BLOCK
      ?AUTO_1630 - BLOCK
      ?AUTO_1635 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1628 ?AUTO_1639 ) ( ON ?AUTO_1634 ?AUTO_1629 ) ( ON ?AUTO_1633 ?AUTO_1628 ) ( CLEAR ?AUTO_1631 ) ( ON ?AUTO_1638 ?AUTO_1633 ) ( ON ?AUTO_1632 ?AUTO_1638 ) ( CLEAR ?AUTO_1632 ) ( ON ?AUTO_1630 ?AUTO_1634 ) ( ON ?AUTO_1635 ?AUTO_1630 ) ( CLEAR ?AUTO_1635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1635 ?AUTO_1630 )
      ( MAKE-ON ?AUTO_1628 ?AUTO_1629 )
      ( MAKE-ON-VERIFY ?AUTO_1628 ?AUTO_1629 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1641 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1641 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1641 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1641 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1643 - BLOCK
    )
    :vars
    (
      ?AUTO_1646 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1643 ?AUTO_1646 ) ( CLEAR ?AUTO_1643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1643 ?AUTO_1646 )
      ( MAKE-ON-TABLE ?AUTO_1643 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1643 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1648 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1648 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1648 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1648 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1650 - BLOCK
    )
    :vars
    (
      ?AUTO_1653 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1650 ?AUTO_1653 ) ( CLEAR ?AUTO_1650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1650 ?AUTO_1653 )
      ( MAKE-ON-TABLE ?AUTO_1650 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1650 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1654 - BLOCK
    )
    :vars
    (
      ?AUTO_1656 - BLOCK
      ?AUTO_1657 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1654 ?AUTO_1656 ) ( CLEAR ?AUTO_1654 ) ( HOLDING ?AUTO_1657 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1657 )
      ( MAKE-ON-TABLE ?AUTO_1654 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1661 - BLOCK
      ?AUTO_1662 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1661 ) ( CLEAR ?AUTO_1662 ) )
    :subtasks
    ( ( !STACK ?AUTO_1661 ?AUTO_1662 )
      ( MAKE-ON-VERIFY ?AUTO_1661 ?AUTO_1662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1665 - BLOCK
      ?AUTO_1666 - BLOCK
    )
    :vars
    (
      ?AUTO_1670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1666 ) ( ON ?AUTO_1665 ?AUTO_1670 ) ( CLEAR ?AUTO_1665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1665 ?AUTO_1670 )
      ( MAKE-ON ?AUTO_1665 ?AUTO_1666 )
      ( MAKE-ON-VERIFY ?AUTO_1665 ?AUTO_1666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1671 - BLOCK
      ?AUTO_1672 - BLOCK
    )
    :vars
    (
      ?AUTO_1675 - BLOCK
      ?AUTO_1676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1672 ) ( ON ?AUTO_1671 ?AUTO_1675 ) ( CLEAR ?AUTO_1671 ) ( HOLDING ?AUTO_1676 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1676 )
      ( MAKE-ON ?AUTO_1671 ?AUTO_1672 )
      ( MAKE-ON-VERIFY ?AUTO_1671 ?AUTO_1672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1679 - BLOCK
      ?AUTO_1680 - BLOCK
    )
    :vars
    (
      ?AUTO_1681 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1679 ?AUTO_1681 ) ( CLEAR ?AUTO_1679 ) ( HOLDING ?AUTO_1680 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1680 )
      ( MAKE-ON ?AUTO_1679 ?AUTO_1680 )
      ( MAKE-ON-VERIFY ?AUTO_1679 ?AUTO_1680 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1689 - BLOCK
      ?AUTO_1690 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1689 ) ( CLEAR ?AUTO_1690 ) )
    :subtasks
    ( ( !STACK ?AUTO_1689 ?AUTO_1690 )
      ( MAKE-ON-VERIFY ?AUTO_1689 ?AUTO_1690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1693 - BLOCK
      ?AUTO_1694 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1694 ) ( ON-TABLE ?AUTO_1693 ) ( CLEAR ?AUTO_1693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1693 )
      ( MAKE-ON ?AUTO_1693 ?AUTO_1694 )
      ( MAKE-ON-VERIFY ?AUTO_1693 ?AUTO_1694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1698 - BLOCK
      ?AUTO_1699 - BLOCK
    )
    :vars
    (
      ?AUTO_1703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1698 ) ( CLEAR ?AUTO_1698 ) ( HOLDING ?AUTO_1699 ) ( CLEAR ?AUTO_1703 ) )
    :subtasks
    ( ( !STACK ?AUTO_1699 ?AUTO_1703 )
      ( MAKE-ON ?AUTO_1698 ?AUTO_1699 )
      ( MAKE-ON-VERIFY ?AUTO_1698 ?AUTO_1699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1706 - BLOCK
      ?AUTO_1707 - BLOCK
    )
    :vars
    (
      ?AUTO_1710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1707 ) ( ON-TABLE ?AUTO_1706 ) ( CLEAR ?AUTO_1706 ) ( HOLDING ?AUTO_1710 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1710 )
      ( MAKE-ON ?AUTO_1706 ?AUTO_1707 )
      ( MAKE-ON-VERIFY ?AUTO_1706 ?AUTO_1707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1711 - BLOCK
      ?AUTO_1712 - BLOCK
    )
    :vars
    (
      ?AUTO_1715 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1712 ) ( ON-TABLE ?AUTO_1711 ) ( ON ?AUTO_1715 ?AUTO_1711 ) ( CLEAR ?AUTO_1715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1715 ?AUTO_1711 )
      ( MAKE-ON ?AUTO_1711 ?AUTO_1712 )
      ( MAKE-ON-VERIFY ?AUTO_1711 ?AUTO_1712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1718 - BLOCK
      ?AUTO_1719 - BLOCK
    )
    :vars
    (
      ?AUTO_1720 - BLOCK
      ?AUTO_1723 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1719 ) ( ON-TABLE ?AUTO_1718 ) ( ON ?AUTO_1720 ?AUTO_1718 ) ( CLEAR ?AUTO_1720 ) ( HOLDING ?AUTO_1723 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1723 )
      ( MAKE-ON ?AUTO_1718 ?AUTO_1719 )
      ( MAKE-ON-VERIFY ?AUTO_1718 ?AUTO_1719 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1728 - BLOCK
      ?AUTO_1729 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1728 ) ( CLEAR ?AUTO_1729 ) )
    :subtasks
    ( ( !STACK ?AUTO_1728 ?AUTO_1729 )
      ( MAKE-ON-VERIFY ?AUTO_1728 ?AUTO_1729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1732 - BLOCK
      ?AUTO_1733 - BLOCK
    )
    :vars
    (
      ?AUTO_1737 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1733 ) ( ON ?AUTO_1732 ?AUTO_1737 ) ( CLEAR ?AUTO_1732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1732 ?AUTO_1737 )
      ( MAKE-ON ?AUTO_1732 ?AUTO_1733 )
      ( MAKE-ON-VERIFY ?AUTO_1732 ?AUTO_1733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1738 - BLOCK
      ?AUTO_1739 - BLOCK
    )
    :vars
    (
      ?AUTO_1742 - BLOCK
      ?AUTO_1744 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1738 ?AUTO_1742 ) ( CLEAR ?AUTO_1738 ) ( HOLDING ?AUTO_1739 ) ( CLEAR ?AUTO_1744 ) )
    :subtasks
    ( ( !STACK ?AUTO_1739 ?AUTO_1744 )
      ( MAKE-ON ?AUTO_1738 ?AUTO_1739 )
      ( MAKE-ON-VERIFY ?AUTO_1738 ?AUTO_1739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1747 - BLOCK
      ?AUTO_1748 - BLOCK
    )
    :vars
    (
      ?AUTO_1751 - BLOCK
      ?AUTO_1752 - BLOCK
      ?AUTO_1753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1748 ) ( ON ?AUTO_1747 ?AUTO_1751 ) ( CLEAR ?AUTO_1747 ) ( HOLDING ?AUTO_1752 ) ( CLEAR ?AUTO_1753 ) )
    :subtasks
    ( ( !STACK ?AUTO_1752 ?AUTO_1753 )
      ( MAKE-ON ?AUTO_1747 ?AUTO_1748 )
      ( MAKE-ON-VERIFY ?AUTO_1747 ?AUTO_1748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1754 - BLOCK
      ?AUTO_1755 - BLOCK
    )
    :vars
    (
      ?AUTO_1758 - BLOCK
      ?AUTO_1760 - BLOCK
      ?AUTO_1759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1755 ) ( ON ?AUTO_1754 ?AUTO_1758 ) ( CLEAR ?AUTO_1760 ) ( ON ?AUTO_1759 ?AUTO_1754 ) ( CLEAR ?AUTO_1759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1759 ?AUTO_1754 )
      ( MAKE-ON ?AUTO_1754 ?AUTO_1755 )
      ( MAKE-ON-VERIFY ?AUTO_1754 ?AUTO_1755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1763 - BLOCK
      ?AUTO_1764 - BLOCK
    )
    :vars
    (
      ?AUTO_1769 - BLOCK
      ?AUTO_1765 - BLOCK
      ?AUTO_1768 - BLOCK
      ?AUTO_1770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1764 ) ( ON ?AUTO_1763 ?AUTO_1769 ) ( CLEAR ?AUTO_1765 ) ( ON ?AUTO_1768 ?AUTO_1763 ) ( CLEAR ?AUTO_1768 ) ( HOLDING ?AUTO_1770 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1770 )
      ( MAKE-ON ?AUTO_1763 ?AUTO_1764 )
      ( MAKE-ON-VERIFY ?AUTO_1763 ?AUTO_1764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1771 - BLOCK
      ?AUTO_1772 - BLOCK
    )
    :vars
    (
      ?AUTO_1773 - BLOCK
      ?AUTO_1774 - BLOCK
      ?AUTO_1778 - BLOCK
      ?AUTO_1777 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1771 ?AUTO_1773 ) ( CLEAR ?AUTO_1774 ) ( ON ?AUTO_1778 ?AUTO_1771 ) ( CLEAR ?AUTO_1778 ) ( ON ?AUTO_1777 ?AUTO_1772 ) ( CLEAR ?AUTO_1777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1777 ?AUTO_1772 )
      ( MAKE-ON ?AUTO_1771 ?AUTO_1772 )
      ( MAKE-ON-VERIFY ?AUTO_1771 ?AUTO_1772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1781 - BLOCK
      ?AUTO_1782 - BLOCK
    )
    :vars
    (
      ?AUTO_1785 - BLOCK
      ?AUTO_1784 - BLOCK
      ?AUTO_1788 - BLOCK
      ?AUTO_1786 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1781 ?AUTO_1785 ) ( ON ?AUTO_1784 ?AUTO_1781 ) ( CLEAR ?AUTO_1784 ) ( ON ?AUTO_1788 ?AUTO_1782 ) ( CLEAR ?AUTO_1788 ) ( HOLDING ?AUTO_1786 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1786 )
      ( MAKE-ON ?AUTO_1781 ?AUTO_1782 )
      ( MAKE-ON-VERIFY ?AUTO_1781 ?AUTO_1782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1794 - BLOCK
      ?AUTO_1795 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1794 ) ( CLEAR ?AUTO_1795 ) )
    :subtasks
    ( ( !STACK ?AUTO_1794 ?AUTO_1795 )
      ( MAKE-ON-VERIFY ?AUTO_1794 ?AUTO_1795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1798 - BLOCK
      ?AUTO_1799 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1799 ) ( ON-TABLE ?AUTO_1798 ) ( CLEAR ?AUTO_1798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1798 )
      ( MAKE-ON ?AUTO_1798 ?AUTO_1799 )
      ( MAKE-ON-VERIFY ?AUTO_1798 ?AUTO_1799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1803 - BLOCK
      ?AUTO_1804 - BLOCK
    )
    :vars
    (
      ?AUTO_1807 - BLOCK
      ?AUTO_1808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1804 ) ( ON-TABLE ?AUTO_1803 ) ( CLEAR ?AUTO_1803 ) ( HOLDING ?AUTO_1807 ) ( CLEAR ?AUTO_1808 ) )
    :subtasks
    ( ( !STACK ?AUTO_1807 ?AUTO_1808 )
      ( MAKE-ON ?AUTO_1803 ?AUTO_1804 )
      ( MAKE-ON-VERIFY ?AUTO_1803 ?AUTO_1804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1809 - BLOCK
      ?AUTO_1810 - BLOCK
    )
    :vars
    (
      ?AUTO_1812 - BLOCK
      ?AUTO_1814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1810 ) ( ON-TABLE ?AUTO_1809 ) ( CLEAR ?AUTO_1812 ) ( ON ?AUTO_1814 ?AUTO_1809 ) ( CLEAR ?AUTO_1814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1814 ?AUTO_1809 )
      ( MAKE-ON ?AUTO_1809 ?AUTO_1810 )
      ( MAKE-ON-VERIFY ?AUTO_1809 ?AUTO_1810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1817 - BLOCK
      ?AUTO_1818 - BLOCK
    )
    :vars
    (
      ?AUTO_1822 - BLOCK
      ?AUTO_1821 - BLOCK
      ?AUTO_1824 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1818 ) ( ON-TABLE ?AUTO_1817 ) ( ON ?AUTO_1822 ?AUTO_1817 ) ( CLEAR ?AUTO_1822 ) ( HOLDING ?AUTO_1821 ) ( CLEAR ?AUTO_1824 ) )
    :subtasks
    ( ( !STACK ?AUTO_1821 ?AUTO_1824 )
      ( MAKE-ON ?AUTO_1817 ?AUTO_1818 )
      ( MAKE-ON-VERIFY ?AUTO_1817 ?AUTO_1818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1829 - BLOCK
      ?AUTO_1830 - BLOCK
    )
    :vars
    (
      ?AUTO_1832 - BLOCK
      ?AUTO_1835 - BLOCK
      ?AUTO_1833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1830 ) ( ON-TABLE ?AUTO_1829 ) ( ON ?AUTO_1832 ?AUTO_1829 ) ( CLEAR ?AUTO_1835 ) ( ON ?AUTO_1833 ?AUTO_1832 ) ( CLEAR ?AUTO_1833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1833 ?AUTO_1832 )
      ( MAKE-ON ?AUTO_1829 ?AUTO_1830 )
      ( MAKE-ON-VERIFY ?AUTO_1829 ?AUTO_1830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1838 - BLOCK
      ?AUTO_1839 - BLOCK
    )
    :vars
    (
      ?AUTO_1842 - BLOCK
      ?AUTO_1843 - BLOCK
      ?AUTO_1844 - BLOCK
      ?AUTO_1845 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1839 ) ( ON-TABLE ?AUTO_1838 ) ( ON ?AUTO_1842 ?AUTO_1838 ) ( CLEAR ?AUTO_1843 ) ( ON ?AUTO_1844 ?AUTO_1842 ) ( CLEAR ?AUTO_1844 ) ( HOLDING ?AUTO_1845 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1845 )
      ( MAKE-ON ?AUTO_1838 ?AUTO_1839 )
      ( MAKE-ON-VERIFY ?AUTO_1838 ?AUTO_1839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1850 - BLOCK
      ?AUTO_1851 - BLOCK
    )
    :vars
    (
      ?AUTO_1855 - BLOCK
      ?AUTO_1857 - BLOCK
      ?AUTO_1853 - BLOCK
      ?AUTO_1854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1850 ) ( ON ?AUTO_1855 ?AUTO_1850 ) ( CLEAR ?AUTO_1857 ) ( ON ?AUTO_1853 ?AUTO_1855 ) ( CLEAR ?AUTO_1853 ) ( ON ?AUTO_1854 ?AUTO_1851 ) ( CLEAR ?AUTO_1854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1854 ?AUTO_1851 )
      ( MAKE-ON ?AUTO_1850 ?AUTO_1851 )
      ( MAKE-ON-VERIFY ?AUTO_1850 ?AUTO_1851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1862 - BLOCK
      ?AUTO_1863 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1862 ) ( CLEAR ?AUTO_1863 ) )
    :subtasks
    ( ( !STACK ?AUTO_1862 ?AUTO_1863 )
      ( MAKE-ON-VERIFY ?AUTO_1862 ?AUTO_1863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1866 - BLOCK
      ?AUTO_1867 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1867 ) ( ON-TABLE ?AUTO_1866 ) ( CLEAR ?AUTO_1866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1866 )
      ( MAKE-ON ?AUTO_1866 ?AUTO_1867 )
      ( MAKE-ON-VERIFY ?AUTO_1866 ?AUTO_1867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1871 - BLOCK
      ?AUTO_1872 - BLOCK
    )
    :vars
    (
      ?AUTO_1875 - BLOCK
      ?AUTO_1876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1872 ) ( ON-TABLE ?AUTO_1871 ) ( CLEAR ?AUTO_1871 ) ( HOLDING ?AUTO_1875 ) ( CLEAR ?AUTO_1876 ) )
    :subtasks
    ( ( !STACK ?AUTO_1875 ?AUTO_1876 )
      ( MAKE-ON ?AUTO_1871 ?AUTO_1872 )
      ( MAKE-ON-VERIFY ?AUTO_1871 ?AUTO_1872 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1878 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1878 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1878 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1880 - BLOCK
    )
    :vars
    (
      ?AUTO_1883 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1880 ?AUTO_1883 ) ( CLEAR ?AUTO_1880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1880 ?AUTO_1883 )
      ( MAKE-ON-TABLE ?AUTO_1880 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1886 - BLOCK
      ?AUTO_1887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1886 ) ( CLEAR ?AUTO_1887 ) )
    :subtasks
    ( ( !STACK ?AUTO_1886 ?AUTO_1887 )
      ( MAKE-ON-VERIFY ?AUTO_1886 ?AUTO_1887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1890 - BLOCK
      ?AUTO_1891 - BLOCK
    )
    :vars
    (
      ?AUTO_1895 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1891 ) ( ON ?AUTO_1890 ?AUTO_1895 ) ( CLEAR ?AUTO_1890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1890 ?AUTO_1895 )
      ( MAKE-ON ?AUTO_1890 ?AUTO_1891 )
      ( MAKE-ON-VERIFY ?AUTO_1890 ?AUTO_1891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1896 - BLOCK
      ?AUTO_1897 - BLOCK
    )
    :vars
    (
      ?AUTO_1900 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1896 ?AUTO_1900 ) ( CLEAR ?AUTO_1896 ) ( HOLDING ?AUTO_1897 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1897 )
      ( MAKE-ON ?AUTO_1896 ?AUTO_1897 )
      ( MAKE-ON-VERIFY ?AUTO_1896 ?AUTO_1897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1902 - BLOCK
      ?AUTO_1903 - BLOCK
    )
    :vars
    (
      ?AUTO_1906 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1902 ?AUTO_1906 ) ( ON ?AUTO_1903 ?AUTO_1902 ) ( CLEAR ?AUTO_1903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1903 ?AUTO_1902 )
      ( MAKE-ON ?AUTO_1902 ?AUTO_1903 )
      ( MAKE-ON-VERIFY ?AUTO_1902 ?AUTO_1903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1911 - BLOCK
      ?AUTO_1912 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1911 ) ( CLEAR ?AUTO_1912 ) )
    :subtasks
    ( ( !STACK ?AUTO_1911 ?AUTO_1912 )
      ( MAKE-ON-VERIFY ?AUTO_1911 ?AUTO_1912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1915 - BLOCK
      ?AUTO_1916 - BLOCK
    )
    :vars
    (
      ?AUTO_1920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1916 ) ( ON ?AUTO_1915 ?AUTO_1920 ) ( CLEAR ?AUTO_1915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1915 ?AUTO_1920 )
      ( MAKE-ON ?AUTO_1915 ?AUTO_1916 )
      ( MAKE-ON-VERIFY ?AUTO_1915 ?AUTO_1916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1921 - BLOCK
      ?AUTO_1922 - BLOCK
    )
    :vars
    (
      ?AUTO_1925 - BLOCK
      ?AUTO_1927 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1921 ?AUTO_1925 ) ( CLEAR ?AUTO_1921 ) ( HOLDING ?AUTO_1922 ) ( CLEAR ?AUTO_1927 ) )
    :subtasks
    ( ( !STACK ?AUTO_1922 ?AUTO_1927 )
      ( MAKE-ON ?AUTO_1921 ?AUTO_1922 )
      ( MAKE-ON-VERIFY ?AUTO_1921 ?AUTO_1922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1930 - BLOCK
      ?AUTO_1931 - BLOCK
    )
    :vars
    (
      ?AUTO_1932 - BLOCK
      ?AUTO_1935 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1931 ) ( ON ?AUTO_1930 ?AUTO_1932 ) ( CLEAR ?AUTO_1930 ) ( HOLDING ?AUTO_1935 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1935 )
      ( MAKE-ON ?AUTO_1930 ?AUTO_1931 )
      ( MAKE-ON-VERIFY ?AUTO_1930 ?AUTO_1931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1936 - BLOCK
      ?AUTO_1937 - BLOCK
    )
    :vars
    (
      ?AUTO_1940 - BLOCK
      ?AUTO_1941 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1936 ?AUTO_1940 ) ( CLEAR ?AUTO_1936 ) ( ON ?AUTO_1941 ?AUTO_1937 ) ( CLEAR ?AUTO_1941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1941 ?AUTO_1937 )
      ( MAKE-ON ?AUTO_1936 ?AUTO_1937 )
      ( MAKE-ON-VERIFY ?AUTO_1936 ?AUTO_1937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1946 - BLOCK
      ?AUTO_1947 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1946 ) ( CLEAR ?AUTO_1947 ) )
    :subtasks
    ( ( !STACK ?AUTO_1946 ?AUTO_1947 )
      ( MAKE-ON-VERIFY ?AUTO_1946 ?AUTO_1947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1950 - BLOCK
      ?AUTO_1951 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1951 ) ( ON-TABLE ?AUTO_1950 ) ( CLEAR ?AUTO_1950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1950 )
      ( MAKE-ON ?AUTO_1950 ?AUTO_1951 )
      ( MAKE-ON-VERIFY ?AUTO_1950 ?AUTO_1951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1955 - BLOCK
      ?AUTO_1956 - BLOCK
    )
    :vars
    (
      ?AUTO_1959 - BLOCK
      ?AUTO_1960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1956 ) ( ON-TABLE ?AUTO_1955 ) ( CLEAR ?AUTO_1955 ) ( HOLDING ?AUTO_1959 ) ( CLEAR ?AUTO_1960 ) )
    :subtasks
    ( ( !STACK ?AUTO_1959 ?AUTO_1960 )
      ( MAKE-ON ?AUTO_1955 ?AUTO_1956 )
      ( MAKE-ON-VERIFY ?AUTO_1955 ?AUTO_1956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1961 - BLOCK
      ?AUTO_1962 - BLOCK
    )
    :vars
    (
      ?AUTO_1964 - BLOCK
      ?AUTO_1966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1962 ) ( ON-TABLE ?AUTO_1961 ) ( CLEAR ?AUTO_1964 ) ( ON ?AUTO_1966 ?AUTO_1961 ) ( CLEAR ?AUTO_1966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1966 ?AUTO_1961 )
      ( MAKE-ON ?AUTO_1961 ?AUTO_1962 )
      ( MAKE-ON-VERIFY ?AUTO_1961 ?AUTO_1962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1969 - BLOCK
      ?AUTO_1970 - BLOCK
    )
    :vars
    (
      ?AUTO_1974 - BLOCK
      ?AUTO_1973 - BLOCK
      ?AUTO_1976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1970 ) ( ON-TABLE ?AUTO_1969 ) ( ON ?AUTO_1974 ?AUTO_1969 ) ( CLEAR ?AUTO_1974 ) ( HOLDING ?AUTO_1973 ) ( CLEAR ?AUTO_1976 ) )
    :subtasks
    ( ( !STACK ?AUTO_1973 ?AUTO_1976 )
      ( MAKE-ON ?AUTO_1969 ?AUTO_1970 )
      ( MAKE-ON-VERIFY ?AUTO_1969 ?AUTO_1970 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1977 - BLOCK
      ?AUTO_1978 - BLOCK
    )
    :vars
    (
      ?AUTO_1981 - BLOCK
      ?AUTO_1983 - BLOCK
      ?AUTO_1982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1977 ) ( ON ?AUTO_1981 ?AUTO_1977 ) ( CLEAR ?AUTO_1981 ) ( CLEAR ?AUTO_1983 ) ( ON ?AUTO_1982 ?AUTO_1978 ) ( CLEAR ?AUTO_1982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1982 ?AUTO_1978 )
      ( MAKE-ON ?AUTO_1977 ?AUTO_1978 )
      ( MAKE-ON-VERIFY ?AUTO_1977 ?AUTO_1978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1986 - BLOCK
      ?AUTO_1987 - BLOCK
    )
    :vars
    (
      ?AUTO_1990 - BLOCK
      ?AUTO_1988 - BLOCK
      ?AUTO_1989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1986 ) ( ON ?AUTO_1990 ?AUTO_1986 ) ( CLEAR ?AUTO_1990 ) ( ON ?AUTO_1988 ?AUTO_1987 ) ( CLEAR ?AUTO_1988 ) ( HOLDING ?AUTO_1989 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1989 )
      ( MAKE-ON ?AUTO_1986 ?AUTO_1987 )
      ( MAKE-ON-VERIFY ?AUTO_1986 ?AUTO_1987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1994 - BLOCK
      ?AUTO_1995 - BLOCK
    )
    :vars
    (
      ?AUTO_2000 - BLOCK
      ?AUTO_1996 - BLOCK
      ?AUTO_1998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1994 ) ( ON ?AUTO_2000 ?AUTO_1994 ) ( CLEAR ?AUTO_2000 ) ( ON ?AUTO_1996 ?AUTO_1995 ) ( ON ?AUTO_1998 ?AUTO_1996 ) ( CLEAR ?AUTO_1998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1998 ?AUTO_1996 )
      ( MAKE-ON ?AUTO_1994 ?AUTO_1995 )
      ( MAKE-ON-VERIFY ?AUTO_1994 ?AUTO_1995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2005 - BLOCK
      ?AUTO_2006 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2005 ) ( CLEAR ?AUTO_2006 ) )
    :subtasks
    ( ( !STACK ?AUTO_2005 ?AUTO_2006 )
      ( MAKE-ON-VERIFY ?AUTO_2005 ?AUTO_2006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2009 - BLOCK
      ?AUTO_2010 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2010 ) ( ON-TABLE ?AUTO_2009 ) ( CLEAR ?AUTO_2009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2009 )
      ( MAKE-ON ?AUTO_2009 ?AUTO_2010 )
      ( MAKE-ON-VERIFY ?AUTO_2009 ?AUTO_2010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2014 - BLOCK
      ?AUTO_2015 - BLOCK
    )
    :vars
    (
      ?AUTO_2019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2014 ) ( CLEAR ?AUTO_2014 ) ( HOLDING ?AUTO_2015 ) ( CLEAR ?AUTO_2019 ) )
    :subtasks
    ( ( !STACK ?AUTO_2015 ?AUTO_2019 )
      ( MAKE-ON ?AUTO_2014 ?AUTO_2015 )
      ( MAKE-ON-VERIFY ?AUTO_2014 ?AUTO_2015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2024 - BLOCK
      ?AUTO_2025 - BLOCK
    )
    :vars
    (
      ?AUTO_2026 - BLOCK
      ?AUTO_2029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2024 ) ( CLEAR ?AUTO_2024 ) ( CLEAR ?AUTO_2026 ) ( ON ?AUTO_2029 ?AUTO_2025 ) ( CLEAR ?AUTO_2029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2029 ?AUTO_2025 )
      ( MAKE-ON ?AUTO_2024 ?AUTO_2025 )
      ( MAKE-ON-VERIFY ?AUTO_2024 ?AUTO_2025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2032 - BLOCK
      ?AUTO_2033 - BLOCK
    )
    :vars
    (
      ?AUTO_2036 - BLOCK
      ?AUTO_2037 - BLOCK
      ?AUTO_2038 - BLOCK
      ?AUTO_2039 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2032 ) ( CLEAR ?AUTO_2032 ) ( CLEAR ?AUTO_2036 ) ( ON ?AUTO_2037 ?AUTO_2033 ) ( CLEAR ?AUTO_2037 ) ( HOLDING ?AUTO_2038 ) ( CLEAR ?AUTO_2039 ) )
    :subtasks
    ( ( !STACK ?AUTO_2038 ?AUTO_2039 )
      ( MAKE-ON ?AUTO_2032 ?AUTO_2033 )
      ( MAKE-ON-VERIFY ?AUTO_2032 ?AUTO_2033 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2041 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2041 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2041 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2041 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2043 - BLOCK
    )
    :vars
    (
      ?AUTO_2046 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2043 ?AUTO_2046 ) ( CLEAR ?AUTO_2043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2043 ?AUTO_2046 )
      ( MAKE-ON-TABLE ?AUTO_2043 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2049 - BLOCK
      ?AUTO_2050 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2049 ) ( CLEAR ?AUTO_2050 ) )
    :subtasks
    ( ( !STACK ?AUTO_2049 ?AUTO_2050 )
      ( MAKE-ON-VERIFY ?AUTO_2049 ?AUTO_2050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2053 - BLOCK
      ?AUTO_2054 - BLOCK
    )
    :vars
    (
      ?AUTO_2058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2054 ) ( ON ?AUTO_2053 ?AUTO_2058 ) ( CLEAR ?AUTO_2053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2053 ?AUTO_2058 )
      ( MAKE-ON ?AUTO_2053 ?AUTO_2054 )
      ( MAKE-ON-VERIFY ?AUTO_2053 ?AUTO_2054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2059 - BLOCK
      ?AUTO_2060 - BLOCK
    )
    :vars
    (
      ?AUTO_2063 - BLOCK
      ?AUTO_2064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2060 ) ( ON ?AUTO_2059 ?AUTO_2063 ) ( CLEAR ?AUTO_2059 ) ( HOLDING ?AUTO_2064 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2064 )
      ( MAKE-ON ?AUTO_2059 ?AUTO_2060 )
      ( MAKE-ON-VERIFY ?AUTO_2059 ?AUTO_2060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2065 - BLOCK
      ?AUTO_2066 - BLOCK
    )
    :vars
    (
      ?AUTO_2069 - BLOCK
      ?AUTO_2070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2066 ) ( ON ?AUTO_2065 ?AUTO_2069 ) ( ON ?AUTO_2070 ?AUTO_2065 ) ( CLEAR ?AUTO_2070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2070 ?AUTO_2065 )
      ( MAKE-ON ?AUTO_2065 ?AUTO_2066 )
      ( MAKE-ON-VERIFY ?AUTO_2065 ?AUTO_2066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2075 - BLOCK
      ?AUTO_2076 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2075 ) ( CLEAR ?AUTO_2076 ) )
    :subtasks
    ( ( !STACK ?AUTO_2075 ?AUTO_2076 )
      ( MAKE-ON-VERIFY ?AUTO_2075 ?AUTO_2076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2079 - BLOCK
      ?AUTO_2080 - BLOCK
    )
    :vars
    (
      ?AUTO_2084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2080 ) ( ON ?AUTO_2079 ?AUTO_2084 ) ( CLEAR ?AUTO_2079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2079 ?AUTO_2084 )
      ( MAKE-ON ?AUTO_2079 ?AUTO_2080 )
      ( MAKE-ON-VERIFY ?AUTO_2079 ?AUTO_2080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2085 - BLOCK
      ?AUTO_2086 - BLOCK
    )
    :vars
    (
      ?AUTO_2089 - BLOCK
      ?AUTO_2091 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2085 ?AUTO_2089 ) ( CLEAR ?AUTO_2085 ) ( HOLDING ?AUTO_2086 ) ( CLEAR ?AUTO_2091 ) )
    :subtasks
    ( ( !STACK ?AUTO_2086 ?AUTO_2091 )
      ( MAKE-ON ?AUTO_2085 ?AUTO_2086 )
      ( MAKE-ON-VERIFY ?AUTO_2085 ?AUTO_2086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2092 - BLOCK
      ?AUTO_2093 - BLOCK
    )
    :vars
    (
      ?AUTO_2096 - BLOCK
      ?AUTO_2097 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2092 ?AUTO_2096 ) ( CLEAR ?AUTO_2097 ) ( ON ?AUTO_2093 ?AUTO_2092 ) ( CLEAR ?AUTO_2093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2093 ?AUTO_2092 )
      ( MAKE-ON ?AUTO_2092 ?AUTO_2093 )
      ( MAKE-ON-VERIFY ?AUTO_2092 ?AUTO_2093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2100 - BLOCK
      ?AUTO_2101 - BLOCK
    )
    :vars
    (
      ?AUTO_2105 - BLOCK
      ?AUTO_2102 - BLOCK
      ?AUTO_2106 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2100 ?AUTO_2105 ) ( CLEAR ?AUTO_2102 ) ( ON ?AUTO_2101 ?AUTO_2100 ) ( CLEAR ?AUTO_2101 ) ( HOLDING ?AUTO_2106 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2106 )
      ( MAKE-ON ?AUTO_2100 ?AUTO_2101 )
      ( MAKE-ON-VERIFY ?AUTO_2100 ?AUTO_2101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2107 - BLOCK
      ?AUTO_2108 - BLOCK
    )
    :vars
    (
      ?AUTO_2112 - BLOCK
      ?AUTO_2110 - BLOCK
      ?AUTO_2113 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2107 ?AUTO_2112 ) ( CLEAR ?AUTO_2110 ) ( ON ?AUTO_2108 ?AUTO_2107 ) ( ON ?AUTO_2113 ?AUTO_2108 ) ( CLEAR ?AUTO_2113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2113 ?AUTO_2108 )
      ( MAKE-ON ?AUTO_2107 ?AUTO_2108 )
      ( MAKE-ON-VERIFY ?AUTO_2107 ?AUTO_2108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2118 - BLOCK
      ?AUTO_2119 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2118 ) ( CLEAR ?AUTO_2119 ) )
    :subtasks
    ( ( !STACK ?AUTO_2118 ?AUTO_2119 )
      ( MAKE-ON-VERIFY ?AUTO_2118 ?AUTO_2119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2122 - BLOCK
      ?AUTO_2123 - BLOCK
    )
    :vars
    (
      ?AUTO_2127 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2123 ) ( ON ?AUTO_2122 ?AUTO_2127 ) ( CLEAR ?AUTO_2122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2122 ?AUTO_2127 )
      ( MAKE-ON ?AUTO_2122 ?AUTO_2123 )
      ( MAKE-ON-VERIFY ?AUTO_2122 ?AUTO_2123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2128 - BLOCK
      ?AUTO_2129 - BLOCK
    )
    :vars
    (
      ?AUTO_2132 - BLOCK
      ?AUTO_2133 - BLOCK
      ?AUTO_2134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2129 ) ( ON ?AUTO_2128 ?AUTO_2132 ) ( CLEAR ?AUTO_2128 ) ( HOLDING ?AUTO_2133 ) ( CLEAR ?AUTO_2134 ) )
    :subtasks
    ( ( !STACK ?AUTO_2133 ?AUTO_2134 )
      ( MAKE-ON ?AUTO_2128 ?AUTO_2129 )
      ( MAKE-ON-VERIFY ?AUTO_2128 ?AUTO_2129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2135 - BLOCK
      ?AUTO_2136 - BLOCK
    )
    :vars
    (
      ?AUTO_2139 - BLOCK
      ?AUTO_2141 - BLOCK
      ?AUTO_2140 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2136 ) ( ON ?AUTO_2135 ?AUTO_2139 ) ( CLEAR ?AUTO_2141 ) ( ON ?AUTO_2140 ?AUTO_2135 ) ( CLEAR ?AUTO_2140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2140 ?AUTO_2135 )
      ( MAKE-ON ?AUTO_2135 ?AUTO_2136 )
      ( MAKE-ON-VERIFY ?AUTO_2135 ?AUTO_2136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2144 - BLOCK
      ?AUTO_2145 - BLOCK
    )
    :vars
    (
      ?AUTO_2150 - BLOCK
      ?AUTO_2146 - BLOCK
      ?AUTO_2147 - BLOCK
      ?AUTO_2152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2145 ) ( ON ?AUTO_2144 ?AUTO_2150 ) ( ON ?AUTO_2146 ?AUTO_2144 ) ( CLEAR ?AUTO_2146 ) ( HOLDING ?AUTO_2147 ) ( CLEAR ?AUTO_2152 ) )
    :subtasks
    ( ( !STACK ?AUTO_2147 ?AUTO_2152 )
      ( MAKE-ON ?AUTO_2144 ?AUTO_2145 )
      ( MAKE-ON-VERIFY ?AUTO_2144 ?AUTO_2145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2153 - BLOCK
      ?AUTO_2154 - BLOCK
    )
    :vars
    (
      ?AUTO_2160 - BLOCK
      ?AUTO_2155 - BLOCK
      ?AUTO_2156 - BLOCK
      ?AUTO_2158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2154 ) ( ON ?AUTO_2153 ?AUTO_2160 ) ( ON ?AUTO_2155 ?AUTO_2153 ) ( CLEAR ?AUTO_2156 ) ( ON ?AUTO_2158 ?AUTO_2155 ) ( CLEAR ?AUTO_2158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2158 ?AUTO_2155 )
      ( MAKE-ON ?AUTO_2153 ?AUTO_2154 )
      ( MAKE-ON-VERIFY ?AUTO_2153 ?AUTO_2154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2163 - BLOCK
      ?AUTO_2164 - BLOCK
    )
    :vars
    (
      ?AUTO_2169 - BLOCK
      ?AUTO_2168 - BLOCK
      ?AUTO_2167 - BLOCK
      ?AUTO_2170 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2163 ?AUTO_2169 ) ( ON ?AUTO_2168 ?AUTO_2163 ) ( CLEAR ?AUTO_2167 ) ( ON ?AUTO_2170 ?AUTO_2168 ) ( CLEAR ?AUTO_2170 ) ( HOLDING ?AUTO_2164 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2164 )
      ( MAKE-ON ?AUTO_2163 ?AUTO_2164 )
      ( MAKE-ON-VERIFY ?AUTO_2163 ?AUTO_2164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2172 - BLOCK
      ?AUTO_2173 - BLOCK
    )
    :vars
    (
      ?AUTO_2174 - BLOCK
      ?AUTO_2179 - BLOCK
      ?AUTO_2178 - BLOCK
      ?AUTO_2177 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2172 ?AUTO_2174 ) ( ON ?AUTO_2179 ?AUTO_2172 ) ( CLEAR ?AUTO_2178 ) ( ON ?AUTO_2177 ?AUTO_2179 ) ( ON ?AUTO_2173 ?AUTO_2177 ) ( CLEAR ?AUTO_2173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2173 ?AUTO_2177 )
      ( MAKE-ON ?AUTO_2172 ?AUTO_2173 )
      ( MAKE-ON-VERIFY ?AUTO_2172 ?AUTO_2173 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2183 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2183 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2183 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2183 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2185 - BLOCK
    )
    :vars
    (
      ?AUTO_2188 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2185 ?AUTO_2188 ) ( CLEAR ?AUTO_2185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2185 ?AUTO_2188 )
      ( MAKE-ON-TABLE ?AUTO_2185 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2185 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2189 - BLOCK
    )
    :vars
    (
      ?AUTO_2191 - BLOCK
      ?AUTO_2192 - BLOCK
      ?AUTO_2193 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2189 ?AUTO_2191 ) ( CLEAR ?AUTO_2189 ) ( HOLDING ?AUTO_2192 ) ( CLEAR ?AUTO_2193 ) )
    :subtasks
    ( ( !STACK ?AUTO_2192 ?AUTO_2193 )
      ( MAKE-ON-TABLE ?AUTO_2189 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2189 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2198 - BLOCK
    )
    :vars
    (
      ?AUTO_2200 - BLOCK
      ?AUTO_2202 - BLOCK
      ?AUTO_2199 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2198 ?AUTO_2200 ) ( CLEAR ?AUTO_2202 ) ( ON ?AUTO_2199 ?AUTO_2198 ) ( CLEAR ?AUTO_2199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2199 ?AUTO_2198 )
      ( MAKE-ON-TABLE ?AUTO_2198 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2198 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2205 - BLOCK
    )
    :vars
    (
      ?AUTO_2207 - BLOCK
      ?AUTO_2209 - BLOCK
      ?AUTO_2208 - BLOCK
      ?AUTO_2210 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2205 ?AUTO_2207 ) ( CLEAR ?AUTO_2209 ) ( ON ?AUTO_2208 ?AUTO_2205 ) ( CLEAR ?AUTO_2208 ) ( HOLDING ?AUTO_2210 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2210 )
      ( MAKE-ON-TABLE ?AUTO_2205 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2205 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2211 - BLOCK
    )
    :vars
    (
      ?AUTO_2212 - BLOCK
      ?AUTO_2215 - BLOCK
      ?AUTO_2216 - BLOCK
      ?AUTO_2214 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2211 ?AUTO_2212 ) ( CLEAR ?AUTO_2215 ) ( ON ?AUTO_2216 ?AUTO_2211 ) ( ON ?AUTO_2214 ?AUTO_2216 ) ( CLEAR ?AUTO_2214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2214 ?AUTO_2216 )
      ( MAKE-ON-TABLE ?AUTO_2211 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2221 - BLOCK
      ?AUTO_2222 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2221 ) ( CLEAR ?AUTO_2222 ) )
    :subtasks
    ( ( !STACK ?AUTO_2221 ?AUTO_2222 )
      ( MAKE-ON-VERIFY ?AUTO_2221 ?AUTO_2222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2225 - BLOCK
      ?AUTO_2226 - BLOCK
    )
    :vars
    (
      ?AUTO_2230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2226 ) ( ON ?AUTO_2225 ?AUTO_2230 ) ( CLEAR ?AUTO_2225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2225 ?AUTO_2230 )
      ( MAKE-ON ?AUTO_2225 ?AUTO_2226 )
      ( MAKE-ON-VERIFY ?AUTO_2225 ?AUTO_2226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2231 - BLOCK
      ?AUTO_2232 - BLOCK
    )
    :vars
    (
      ?AUTO_2235 - BLOCK
      ?AUTO_2236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2232 ) ( ON ?AUTO_2231 ?AUTO_2235 ) ( CLEAR ?AUTO_2231 ) ( HOLDING ?AUTO_2236 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2236 )
      ( MAKE-ON ?AUTO_2231 ?AUTO_2232 )
      ( MAKE-ON-VERIFY ?AUTO_2231 ?AUTO_2232 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2237 - BLOCK
      ?AUTO_2238 - BLOCK
    )
    :vars
    (
      ?AUTO_2241 - BLOCK
      ?AUTO_2242 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2238 ) ( ON ?AUTO_2237 ?AUTO_2241 ) ( ON ?AUTO_2242 ?AUTO_2237 ) ( CLEAR ?AUTO_2242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2242 ?AUTO_2237 )
      ( MAKE-ON ?AUTO_2237 ?AUTO_2238 )
      ( MAKE-ON-VERIFY ?AUTO_2237 ?AUTO_2238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2245 - BLOCK
      ?AUTO_2246 - BLOCK
    )
    :vars
    (
      ?AUTO_2250 - BLOCK
      ?AUTO_2247 - BLOCK
      ?AUTO_2252 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2245 ?AUTO_2250 ) ( ON ?AUTO_2247 ?AUTO_2245 ) ( CLEAR ?AUTO_2247 ) ( HOLDING ?AUTO_2246 ) ( CLEAR ?AUTO_2252 ) )
    :subtasks
    ( ( !STACK ?AUTO_2246 ?AUTO_2252 )
      ( MAKE-ON ?AUTO_2245 ?AUTO_2246 )
      ( MAKE-ON-VERIFY ?AUTO_2245 ?AUTO_2246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2257 - BLOCK
      ?AUTO_2258 - BLOCK
    )
    :vars
    (
      ?AUTO_2259 - BLOCK
      ?AUTO_2262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2257 ?AUTO_2259 ) ( CLEAR ?AUTO_2257 ) ( ON ?AUTO_2262 ?AUTO_2258 ) ( CLEAR ?AUTO_2262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2262 ?AUTO_2258 )
      ( MAKE-ON ?AUTO_2257 ?AUTO_2258 )
      ( MAKE-ON-VERIFY ?AUTO_2257 ?AUTO_2258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2265 - BLOCK
      ?AUTO_2266 - BLOCK
    )
    :vars
    (
      ?AUTO_2269 - BLOCK
      ?AUTO_2270 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2269 ?AUTO_2266 ) ( CLEAR ?AUTO_2269 ) ( HOLDING ?AUTO_2265 ) ( CLEAR ?AUTO_2270 ) )
    :subtasks
    ( ( !STACK ?AUTO_2265 ?AUTO_2270 )
      ( MAKE-ON ?AUTO_2265 ?AUTO_2266 )
      ( MAKE-ON-VERIFY ?AUTO_2265 ?AUTO_2266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2273 - BLOCK
      ?AUTO_2274 - BLOCK
    )
    :vars
    (
      ?AUTO_2275 - BLOCK
      ?AUTO_2278 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2275 ?AUTO_2274 ) ( CLEAR ?AUTO_2278 ) ( ON ?AUTO_2273 ?AUTO_2275 ) ( CLEAR ?AUTO_2273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2273 ?AUTO_2275 )
      ( MAKE-ON ?AUTO_2273 ?AUTO_2274 )
      ( MAKE-ON-VERIFY ?AUTO_2273 ?AUTO_2274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2281 - BLOCK
      ?AUTO_2282 - BLOCK
    )
    :vars
    (
      ?AUTO_2283 - BLOCK
      ?AUTO_2286 - BLOCK
      ?AUTO_2287 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2283 ?AUTO_2282 ) ( CLEAR ?AUTO_2286 ) ( ON ?AUTO_2281 ?AUTO_2283 ) ( CLEAR ?AUTO_2281 ) ( HOLDING ?AUTO_2287 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2287 )
      ( MAKE-ON ?AUTO_2281 ?AUTO_2282 )
      ( MAKE-ON-VERIFY ?AUTO_2281 ?AUTO_2282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2288 - BLOCK
      ?AUTO_2289 - BLOCK
    )
    :vars
    (
      ?AUTO_2290 - BLOCK
      ?AUTO_2292 - BLOCK
      ?AUTO_2294 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2290 ?AUTO_2289 ) ( CLEAR ?AUTO_2292 ) ( ON ?AUTO_2288 ?AUTO_2290 ) ( ON ?AUTO_2294 ?AUTO_2288 ) ( CLEAR ?AUTO_2294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2294 ?AUTO_2288 )
      ( MAKE-ON ?AUTO_2288 ?AUTO_2289 )
      ( MAKE-ON-VERIFY ?AUTO_2288 ?AUTO_2289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2299 - BLOCK
      ?AUTO_2300 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2299 ) ( CLEAR ?AUTO_2300 ) )
    :subtasks
    ( ( !STACK ?AUTO_2299 ?AUTO_2300 )
      ( MAKE-ON-VERIFY ?AUTO_2299 ?AUTO_2300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2303 - BLOCK
      ?AUTO_2304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2304 ) ( ON-TABLE ?AUTO_2303 ) ( CLEAR ?AUTO_2303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2303 )
      ( MAKE-ON ?AUTO_2303 ?AUTO_2304 )
      ( MAKE-ON-VERIFY ?AUTO_2303 ?AUTO_2304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2308 - BLOCK
      ?AUTO_2309 - BLOCK
    )
    :vars
    (
      ?AUTO_2313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2308 ) ( CLEAR ?AUTO_2308 ) ( HOLDING ?AUTO_2309 ) ( CLEAR ?AUTO_2313 ) )
    :subtasks
    ( ( !STACK ?AUTO_2309 ?AUTO_2313 )
      ( MAKE-ON ?AUTO_2308 ?AUTO_2309 )
      ( MAKE-ON-VERIFY ?AUTO_2308 ?AUTO_2309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2356 - BLOCK
      ?AUTO_2357 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2356 ) ( CLEAR ?AUTO_2357 ) )
    :subtasks
    ( ( !STACK ?AUTO_2356 ?AUTO_2357 )
      ( MAKE-ON-VERIFY ?AUTO_2356 ?AUTO_2357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2360 - BLOCK
      ?AUTO_2361 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2361 ) ( ON-TABLE ?AUTO_2360 ) ( CLEAR ?AUTO_2360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2360 )
      ( MAKE-ON ?AUTO_2360 ?AUTO_2361 )
      ( MAKE-ON-VERIFY ?AUTO_2360 ?AUTO_2361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2365 - BLOCK
      ?AUTO_2366 - BLOCK
    )
    :vars
    (
      ?AUTO_2370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2365 ) ( CLEAR ?AUTO_2365 ) ( HOLDING ?AUTO_2366 ) ( CLEAR ?AUTO_2370 ) )
    :subtasks
    ( ( !STACK ?AUTO_2366 ?AUTO_2370 )
      ( MAKE-ON ?AUTO_2365 ?AUTO_2366 )
      ( MAKE-ON-VERIFY ?AUTO_2365 ?AUTO_2366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2373 - BLOCK
      ?AUTO_2374 - BLOCK
    )
    :vars
    (
      ?AUTO_2377 - BLOCK
      ?AUTO_2378 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2374 ) ( ON-TABLE ?AUTO_2373 ) ( CLEAR ?AUTO_2373 ) ( HOLDING ?AUTO_2377 ) ( CLEAR ?AUTO_2378 ) )
    :subtasks
    ( ( !STACK ?AUTO_2377 ?AUTO_2378 )
      ( MAKE-ON ?AUTO_2373 ?AUTO_2374 )
      ( MAKE-ON-VERIFY ?AUTO_2373 ?AUTO_2374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2387 - BLOCK
      ?AUTO_2388 - BLOCK
    )
    :vars
    (
      ?AUTO_2392 - BLOCK
      ?AUTO_2391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2388 ) ( ON-TABLE ?AUTO_2387 ) ( CLEAR ?AUTO_2392 ) ( ON ?AUTO_2391 ?AUTO_2387 ) ( CLEAR ?AUTO_2391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2391 ?AUTO_2387 )
      ( MAKE-ON ?AUTO_2387 ?AUTO_2388 )
      ( MAKE-ON-VERIFY ?AUTO_2387 ?AUTO_2388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2395 - BLOCK
      ?AUTO_2396 - BLOCK
    )
    :vars
    (
      ?AUTO_2397 - BLOCK
      ?AUTO_2400 - BLOCK
      ?AUTO_2402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2395 ) ( CLEAR ?AUTO_2397 ) ( ON ?AUTO_2400 ?AUTO_2395 ) ( CLEAR ?AUTO_2400 ) ( HOLDING ?AUTO_2396 ) ( CLEAR ?AUTO_2402 ) )
    :subtasks
    ( ( !STACK ?AUTO_2396 ?AUTO_2402 )
      ( MAKE-ON ?AUTO_2395 ?AUTO_2396 )
      ( MAKE-ON-VERIFY ?AUTO_2395 ?AUTO_2396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2403 - BLOCK
      ?AUTO_2404 - BLOCK
    )
    :vars
    (
      ?AUTO_2406 - BLOCK
      ?AUTO_2405 - BLOCK
      ?AUTO_2409 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2403 ) ( CLEAR ?AUTO_2406 ) ( ON ?AUTO_2405 ?AUTO_2403 ) ( CLEAR ?AUTO_2409 ) ( ON ?AUTO_2404 ?AUTO_2405 ) ( CLEAR ?AUTO_2404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2404 ?AUTO_2405 )
      ( MAKE-ON ?AUTO_2403 ?AUTO_2404 )
      ( MAKE-ON-VERIFY ?AUTO_2403 ?AUTO_2404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2412 - BLOCK
      ?AUTO_2413 - BLOCK
    )
    :vars
    (
      ?AUTO_2414 - BLOCK
      ?AUTO_2417 - BLOCK
      ?AUTO_2418 - BLOCK
      ?AUTO_2420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2412 ) ( CLEAR ?AUTO_2414 ) ( ON ?AUTO_2417 ?AUTO_2412 ) ( ON ?AUTO_2413 ?AUTO_2417 ) ( CLEAR ?AUTO_2413 ) ( HOLDING ?AUTO_2418 ) ( CLEAR ?AUTO_2420 ) )
    :subtasks
    ( ( !STACK ?AUTO_2418 ?AUTO_2420 )
      ( MAKE-ON ?AUTO_2412 ?AUTO_2413 )
      ( MAKE-ON-VERIFY ?AUTO_2412 ?AUTO_2413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2421 - BLOCK
      ?AUTO_2422 - BLOCK
    )
    :vars
    (
      ?AUTO_2426 - BLOCK
      ?AUTO_2428 - BLOCK
      ?AUTO_2423 - BLOCK
      ?AUTO_2424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2421 ) ( CLEAR ?AUTO_2426 ) ( ON ?AUTO_2428 ?AUTO_2421 ) ( ON ?AUTO_2422 ?AUTO_2428 ) ( CLEAR ?AUTO_2423 ) ( ON ?AUTO_2424 ?AUTO_2422 ) ( CLEAR ?AUTO_2424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2424 ?AUTO_2422 )
      ( MAKE-ON ?AUTO_2421 ?AUTO_2422 )
      ( MAKE-ON-VERIFY ?AUTO_2421 ?AUTO_2422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2431 - BLOCK
      ?AUTO_2432 - BLOCK
    )
    :vars
    (
      ?AUTO_2434 - BLOCK
      ?AUTO_2433 - BLOCK
      ?AUTO_2436 - BLOCK
      ?AUTO_2435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2431 ) ( ON ?AUTO_2434 ?AUTO_2431 ) ( ON ?AUTO_2432 ?AUTO_2434 ) ( CLEAR ?AUTO_2433 ) ( ON ?AUTO_2436 ?AUTO_2432 ) ( CLEAR ?AUTO_2436 ) ( HOLDING ?AUTO_2435 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2435 )
      ( MAKE-ON ?AUTO_2431 ?AUTO_2432 )
      ( MAKE-ON-VERIFY ?AUTO_2431 ?AUTO_2432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2440 - BLOCK
      ?AUTO_2441 - BLOCK
    )
    :vars
    (
      ?AUTO_2444 - BLOCK
      ?AUTO_2442 - BLOCK
      ?AUTO_2443 - BLOCK
      ?AUTO_2447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2440 ) ( ON ?AUTO_2444 ?AUTO_2440 ) ( ON ?AUTO_2441 ?AUTO_2444 ) ( CLEAR ?AUTO_2442 ) ( ON ?AUTO_2443 ?AUTO_2441 ) ( ON ?AUTO_2447 ?AUTO_2443 ) ( CLEAR ?AUTO_2447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2447 ?AUTO_2443 )
      ( MAKE-ON ?AUTO_2440 ?AUTO_2441 )
      ( MAKE-ON-VERIFY ?AUTO_2440 ?AUTO_2441 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2451 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2451 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2451 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2451 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2453 - BLOCK
    )
    :vars
    (
      ?AUTO_2456 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2453 ?AUTO_2456 ) ( CLEAR ?AUTO_2453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2453 ?AUTO_2456 )
      ( MAKE-ON-TABLE ?AUTO_2453 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2453 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2457 - BLOCK
    )
    :vars
    (
      ?AUTO_2459 - BLOCK
      ?AUTO_2460 - BLOCK
      ?AUTO_2461 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2457 ?AUTO_2459 ) ( CLEAR ?AUTO_2457 ) ( HOLDING ?AUTO_2460 ) ( CLEAR ?AUTO_2461 ) )
    :subtasks
    ( ( !STACK ?AUTO_2460 ?AUTO_2461 )
      ( MAKE-ON-TABLE ?AUTO_2457 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2457 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2466 - BLOCK
    )
    :vars
    (
      ?AUTO_2468 - BLOCK
      ?AUTO_2470 - BLOCK
      ?AUTO_2469 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2466 ?AUTO_2468 ) ( CLEAR ?AUTO_2470 ) ( ON ?AUTO_2469 ?AUTO_2466 ) ( CLEAR ?AUTO_2469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2469 ?AUTO_2466 )
      ( MAKE-ON-TABLE ?AUTO_2466 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2466 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2473 - BLOCK
    )
    :vars
    (
      ?AUTO_2475 - BLOCK
      ?AUTO_2477 - BLOCK
      ?AUTO_2476 - BLOCK
      ?AUTO_2478 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2473 ?AUTO_2475 ) ( CLEAR ?AUTO_2477 ) ( ON ?AUTO_2476 ?AUTO_2473 ) ( CLEAR ?AUTO_2476 ) ( HOLDING ?AUTO_2478 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2478 )
      ( MAKE-ON-TABLE ?AUTO_2473 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2473 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2479 - BLOCK
    )
    :vars
    (
      ?AUTO_2481 - BLOCK
      ?AUTO_2480 - BLOCK
      ?AUTO_2484 - BLOCK
      ?AUTO_2483 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2479 ?AUTO_2481 ) ( CLEAR ?AUTO_2480 ) ( ON ?AUTO_2484 ?AUTO_2479 ) ( ON ?AUTO_2483 ?AUTO_2484 ) ( CLEAR ?AUTO_2483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2483 ?AUTO_2484 )
      ( MAKE-ON-TABLE ?AUTO_2479 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2479 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2487 - BLOCK
    )
    :vars
    (
      ?AUTO_2488 - BLOCK
      ?AUTO_2489 - BLOCK
      ?AUTO_2492 - BLOCK
      ?AUTO_2491 - BLOCK
      ?AUTO_2493 - BLOCK
      ?AUTO_2494 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2487 ?AUTO_2488 ) ( CLEAR ?AUTO_2489 ) ( ON ?AUTO_2492 ?AUTO_2487 ) ( ON ?AUTO_2491 ?AUTO_2492 ) ( CLEAR ?AUTO_2491 ) ( HOLDING ?AUTO_2493 ) ( CLEAR ?AUTO_2494 ) )
    :subtasks
    ( ( !STACK ?AUTO_2493 ?AUTO_2494 )
      ( MAKE-ON-TABLE ?AUTO_2487 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2497 - BLOCK
      ?AUTO_2498 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2497 ) ( CLEAR ?AUTO_2498 ) )
    :subtasks
    ( ( !STACK ?AUTO_2497 ?AUTO_2498 )
      ( MAKE-ON-VERIFY ?AUTO_2497 ?AUTO_2498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2501 - BLOCK
      ?AUTO_2502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2502 ) ( ON-TABLE ?AUTO_2501 ) ( CLEAR ?AUTO_2501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2501 )
      ( MAKE-ON ?AUTO_2501 ?AUTO_2502 )
      ( MAKE-ON-VERIFY ?AUTO_2501 ?AUTO_2502 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2507 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2507 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2507 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2507 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2509 - BLOCK
    )
    :vars
    (
      ?AUTO_2512 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2509 ?AUTO_2512 ) ( CLEAR ?AUTO_2509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2509 ?AUTO_2512 )
      ( MAKE-ON-TABLE ?AUTO_2509 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2509 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2513 - BLOCK
    )
    :vars
    (
      ?AUTO_2515 - BLOCK
      ?AUTO_2516 - BLOCK
      ?AUTO_2517 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2513 ?AUTO_2515 ) ( CLEAR ?AUTO_2513 ) ( HOLDING ?AUTO_2516 ) ( CLEAR ?AUTO_2517 ) )
    :subtasks
    ( ( !STACK ?AUTO_2516 ?AUTO_2517 )
      ( MAKE-ON-TABLE ?AUTO_2513 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2513 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2520 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2520 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2520 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2520 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2522 - BLOCK
    )
    :vars
    (
      ?AUTO_2525 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2522 ?AUTO_2525 ) ( CLEAR ?AUTO_2522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2522 ?AUTO_2525 )
      ( MAKE-ON-TABLE ?AUTO_2522 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2522 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2526 - BLOCK
    )
    :vars
    (
      ?AUTO_2528 - BLOCK
      ?AUTO_2529 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2526 ?AUTO_2528 ) ( CLEAR ?AUTO_2526 ) ( HOLDING ?AUTO_2529 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2529 )
      ( MAKE-ON-TABLE ?AUTO_2526 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2526 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2530 - BLOCK
    )
    :vars
    (
      ?AUTO_2532 - BLOCK
      ?AUTO_2533 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2530 ?AUTO_2532 ) ( ON ?AUTO_2533 ?AUTO_2530 ) ( CLEAR ?AUTO_2533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2533 ?AUTO_2530 )
      ( MAKE-ON-TABLE ?AUTO_2530 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2530 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2536 - BLOCK
    )
    :vars
    (
      ?AUTO_2537 - BLOCK
      ?AUTO_2538 - BLOCK
      ?AUTO_2540 - BLOCK
      ?AUTO_2541 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2536 ?AUTO_2537 ) ( ON ?AUTO_2538 ?AUTO_2536 ) ( CLEAR ?AUTO_2538 ) ( HOLDING ?AUTO_2540 ) ( CLEAR ?AUTO_2541 ) )
    :subtasks
    ( ( !STACK ?AUTO_2540 ?AUTO_2541 )
      ( MAKE-ON-TABLE ?AUTO_2536 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2536 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2544 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2544 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2544 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2544 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2546 - BLOCK
    )
    :vars
    (
      ?AUTO_2549 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2546 ?AUTO_2549 ) ( CLEAR ?AUTO_2546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2546 ?AUTO_2549 )
      ( MAKE-ON-TABLE ?AUTO_2546 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2546 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2550 - BLOCK
    )
    :vars
    (
      ?AUTO_2552 - BLOCK
      ?AUTO_2553 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2550 ?AUTO_2552 ) ( CLEAR ?AUTO_2550 ) ( HOLDING ?AUTO_2553 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2553 )
      ( MAKE-ON-TABLE ?AUTO_2550 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2550 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2554 - BLOCK
    )
    :vars
    (
      ?AUTO_2556 - BLOCK
      ?AUTO_2557 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2554 ?AUTO_2556 ) ( ON ?AUTO_2557 ?AUTO_2554 ) ( CLEAR ?AUTO_2557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2557 ?AUTO_2554 )
      ( MAKE-ON-TABLE ?AUTO_2554 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2554 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2560 - BLOCK
    )
    :vars
    (
      ?AUTO_2561 - BLOCK
      ?AUTO_2562 - BLOCK
      ?AUTO_2564 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2560 ?AUTO_2561 ) ( ON ?AUTO_2562 ?AUTO_2560 ) ( CLEAR ?AUTO_2562 ) ( HOLDING ?AUTO_2564 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2564 )
      ( MAKE-ON-TABLE ?AUTO_2560 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2560 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2565 - BLOCK
    )
    :vars
    (
      ?AUTO_2566 - BLOCK
      ?AUTO_2568 - BLOCK
      ?AUTO_2569 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2565 ?AUTO_2566 ) ( ON ?AUTO_2568 ?AUTO_2565 ) ( ON ?AUTO_2569 ?AUTO_2568 ) ( CLEAR ?AUTO_2569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2569 ?AUTO_2568 )
      ( MAKE-ON-TABLE ?AUTO_2565 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2565 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2572 - BLOCK
    )
    :vars
    (
      ?AUTO_2576 - BLOCK
      ?AUTO_2575 - BLOCK
      ?AUTO_2573 - BLOCK
      ?AUTO_2577 - BLOCK
      ?AUTO_2578 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2572 ?AUTO_2576 ) ( ON ?AUTO_2575 ?AUTO_2572 ) ( ON ?AUTO_2573 ?AUTO_2575 ) ( CLEAR ?AUTO_2573 ) ( HOLDING ?AUTO_2577 ) ( CLEAR ?AUTO_2578 ) )
    :subtasks
    ( ( !STACK ?AUTO_2577 ?AUTO_2578 )
      ( MAKE-ON-TABLE ?AUTO_2572 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2582 - BLOCK
      ?AUTO_2583 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2582 ) ( CLEAR ?AUTO_2583 ) )
    :subtasks
    ( ( !STACK ?AUTO_2582 ?AUTO_2583 )
      ( MAKE-ON-VERIFY ?AUTO_2582 ?AUTO_2583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2586 - BLOCK
      ?AUTO_2587 - BLOCK
    )
    :vars
    (
      ?AUTO_2591 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2587 ) ( ON ?AUTO_2586 ?AUTO_2591 ) ( CLEAR ?AUTO_2586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2586 ?AUTO_2591 )
      ( MAKE-ON ?AUTO_2586 ?AUTO_2587 )
      ( MAKE-ON-VERIFY ?AUTO_2586 ?AUTO_2587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2592 - BLOCK
      ?AUTO_2593 - BLOCK
    )
    :vars
    (
      ?AUTO_2596 - BLOCK
      ?AUTO_2597 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2593 ) ( ON ?AUTO_2592 ?AUTO_2596 ) ( CLEAR ?AUTO_2592 ) ( HOLDING ?AUTO_2597 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2597 )
      ( MAKE-ON ?AUTO_2592 ?AUTO_2593 )
      ( MAKE-ON-VERIFY ?AUTO_2592 ?AUTO_2593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2598 - BLOCK
      ?AUTO_2599 - BLOCK
    )
    :vars
    (
      ?AUTO_2602 - BLOCK
      ?AUTO_2603 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2599 ) ( ON ?AUTO_2598 ?AUTO_2602 ) ( ON ?AUTO_2603 ?AUTO_2598 ) ( CLEAR ?AUTO_2603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2603 ?AUTO_2598 )
      ( MAKE-ON ?AUTO_2598 ?AUTO_2599 )
      ( MAKE-ON-VERIFY ?AUTO_2598 ?AUTO_2599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2606 - BLOCK
      ?AUTO_2607 - BLOCK
    )
    :vars
    (
      ?AUTO_2611 - BLOCK
      ?AUTO_2608 - BLOCK
      ?AUTO_2612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2607 ) ( ON ?AUTO_2606 ?AUTO_2611 ) ( ON ?AUTO_2608 ?AUTO_2606 ) ( CLEAR ?AUTO_2608 ) ( HOLDING ?AUTO_2612 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2612 )
      ( MAKE-ON ?AUTO_2606 ?AUTO_2607 )
      ( MAKE-ON-VERIFY ?AUTO_2606 ?AUTO_2607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2613 - BLOCK
      ?AUTO_2614 - BLOCK
    )
    :vars
    (
      ?AUTO_2618 - BLOCK
      ?AUTO_2615 - BLOCK
      ?AUTO_2619 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2614 ) ( ON ?AUTO_2613 ?AUTO_2618 ) ( ON ?AUTO_2615 ?AUTO_2613 ) ( ON ?AUTO_2619 ?AUTO_2615 ) ( CLEAR ?AUTO_2619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2619 ?AUTO_2615 )
      ( MAKE-ON ?AUTO_2613 ?AUTO_2614 )
      ( MAKE-ON-VERIFY ?AUTO_2613 ?AUTO_2614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2622 - BLOCK
      ?AUTO_2623 - BLOCK
    )
    :vars
    (
      ?AUTO_2628 - BLOCK
      ?AUTO_2625 - BLOCK
      ?AUTO_2626 - BLOCK
      ?AUTO_2629 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2623 ) ( ON ?AUTO_2622 ?AUTO_2628 ) ( ON ?AUTO_2625 ?AUTO_2622 ) ( ON ?AUTO_2626 ?AUTO_2625 ) ( CLEAR ?AUTO_2626 ) ( HOLDING ?AUTO_2629 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2629 )
      ( MAKE-ON ?AUTO_2622 ?AUTO_2623 )
      ( MAKE-ON-VERIFY ?AUTO_2622 ?AUTO_2623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2630 - BLOCK
      ?AUTO_2631 - BLOCK
    )
    :vars
    (
      ?AUTO_2632 - BLOCK
      ?AUTO_2633 - BLOCK
      ?AUTO_2637 - BLOCK
      ?AUTO_2636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2631 ) ( ON ?AUTO_2630 ?AUTO_2632 ) ( ON ?AUTO_2633 ?AUTO_2630 ) ( ON ?AUTO_2637 ?AUTO_2633 ) ( ON ?AUTO_2636 ?AUTO_2637 ) ( CLEAR ?AUTO_2636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2636 ?AUTO_2637 )
      ( MAKE-ON ?AUTO_2630 ?AUTO_2631 )
      ( MAKE-ON-VERIFY ?AUTO_2630 ?AUTO_2631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2640 - BLOCK
      ?AUTO_2641 - BLOCK
    )
    :vars
    (
      ?AUTO_2646 - BLOCK
      ?AUTO_2644 - BLOCK
      ?AUTO_2647 - BLOCK
      ?AUTO_2643 - BLOCK
      ?AUTO_2649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2640 ?AUTO_2646 ) ( ON ?AUTO_2644 ?AUTO_2640 ) ( ON ?AUTO_2647 ?AUTO_2644 ) ( ON ?AUTO_2643 ?AUTO_2647 ) ( CLEAR ?AUTO_2643 ) ( HOLDING ?AUTO_2641 ) ( CLEAR ?AUTO_2649 ) )
    :subtasks
    ( ( !STACK ?AUTO_2641 ?AUTO_2649 )
      ( MAKE-ON ?AUTO_2640 ?AUTO_2641 )
      ( MAKE-ON-VERIFY ?AUTO_2640 ?AUTO_2641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2654 - BLOCK
      ?AUTO_2655 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2654 ) ( CLEAR ?AUTO_2655 ) )
    :subtasks
    ( ( !STACK ?AUTO_2654 ?AUTO_2655 )
      ( MAKE-ON-VERIFY ?AUTO_2654 ?AUTO_2655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2658 - BLOCK
      ?AUTO_2659 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2659 ) ( ON-TABLE ?AUTO_2658 ) ( CLEAR ?AUTO_2658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2658 )
      ( MAKE-ON ?AUTO_2658 ?AUTO_2659 )
      ( MAKE-ON-VERIFY ?AUTO_2658 ?AUTO_2659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2663 - BLOCK
      ?AUTO_2664 - BLOCK
    )
    :vars
    (
      ?AUTO_2668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2663 ) ( CLEAR ?AUTO_2663 ) ( HOLDING ?AUTO_2664 ) ( CLEAR ?AUTO_2668 ) )
    :subtasks
    ( ( !STACK ?AUTO_2664 ?AUTO_2668 )
      ( MAKE-ON ?AUTO_2663 ?AUTO_2664 )
      ( MAKE-ON-VERIFY ?AUTO_2663 ?AUTO_2664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2669 - BLOCK
      ?AUTO_2670 - BLOCK
    )
    :vars
    (
      ?AUTO_2671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2669 ) ( CLEAR ?AUTO_2671 ) ( ON ?AUTO_2670 ?AUTO_2669 ) ( CLEAR ?AUTO_2670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2670 ?AUTO_2669 )
      ( MAKE-ON ?AUTO_2669 ?AUTO_2670 )
      ( MAKE-ON-VERIFY ?AUTO_2669 ?AUTO_2670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2676 - BLOCK
      ?AUTO_2677 - BLOCK
    )
    :vars
    (
      ?AUTO_2680 - BLOCK
      ?AUTO_2681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2676 ) ( CLEAR ?AUTO_2680 ) ( ON ?AUTO_2677 ?AUTO_2676 ) ( CLEAR ?AUTO_2677 ) ( HOLDING ?AUTO_2681 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2681 )
      ( MAKE-ON ?AUTO_2676 ?AUTO_2677 )
      ( MAKE-ON-VERIFY ?AUTO_2676 ?AUTO_2677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2682 - BLOCK
      ?AUTO_2683 - BLOCK
    )
    :vars
    (
      ?AUTO_2686 - BLOCK
      ?AUTO_2687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2682 ) ( CLEAR ?AUTO_2686 ) ( ON ?AUTO_2683 ?AUTO_2682 ) ( ON ?AUTO_2687 ?AUTO_2683 ) ( CLEAR ?AUTO_2687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2687 ?AUTO_2683 )
      ( MAKE-ON ?AUTO_2682 ?AUTO_2683 )
      ( MAKE-ON-VERIFY ?AUTO_2682 ?AUTO_2683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2690 - BLOCK
      ?AUTO_2691 - BLOCK
    )
    :vars
    (
      ?AUTO_2695 - BLOCK
      ?AUTO_2692 - BLOCK
      ?AUTO_2696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2690 ) ( CLEAR ?AUTO_2695 ) ( ON ?AUTO_2691 ?AUTO_2690 ) ( ON ?AUTO_2692 ?AUTO_2691 ) ( CLEAR ?AUTO_2692 ) ( HOLDING ?AUTO_2696 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2696 )
      ( MAKE-ON ?AUTO_2690 ?AUTO_2691 )
      ( MAKE-ON-VERIFY ?AUTO_2690 ?AUTO_2691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2697 - BLOCK
      ?AUTO_2698 - BLOCK
    )
    :vars
    (
      ?AUTO_2699 - BLOCK
      ?AUTO_2702 - BLOCK
      ?AUTO_2703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2697 ) ( CLEAR ?AUTO_2699 ) ( ON ?AUTO_2698 ?AUTO_2697 ) ( ON ?AUTO_2702 ?AUTO_2698 ) ( ON ?AUTO_2703 ?AUTO_2702 ) ( CLEAR ?AUTO_2703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2703 ?AUTO_2702 )
      ( MAKE-ON ?AUTO_2697 ?AUTO_2698 )
      ( MAKE-ON-VERIFY ?AUTO_2697 ?AUTO_2698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2706 - BLOCK
      ?AUTO_2707 - BLOCK
    )
    :vars
    (
      ?AUTO_2708 - BLOCK
      ?AUTO_2711 - BLOCK
      ?AUTO_2710 - BLOCK
      ?AUTO_2713 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2706 ) ( CLEAR ?AUTO_2708 ) ( ON ?AUTO_2707 ?AUTO_2706 ) ( ON ?AUTO_2711 ?AUTO_2707 ) ( ON ?AUTO_2710 ?AUTO_2711 ) ( CLEAR ?AUTO_2710 ) ( HOLDING ?AUTO_2713 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2713 )
      ( MAKE-ON ?AUTO_2706 ?AUTO_2707 )
      ( MAKE-ON-VERIFY ?AUTO_2706 ?AUTO_2707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2714 - BLOCK
      ?AUTO_2715 - BLOCK
    )
    :vars
    (
      ?AUTO_2719 - BLOCK
      ?AUTO_2716 - BLOCK
      ?AUTO_2721 - BLOCK
      ?AUTO_2720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2714 ) ( CLEAR ?AUTO_2719 ) ( ON ?AUTO_2715 ?AUTO_2714 ) ( ON ?AUTO_2716 ?AUTO_2715 ) ( ON ?AUTO_2721 ?AUTO_2716 ) ( ON ?AUTO_2720 ?AUTO_2721 ) ( CLEAR ?AUTO_2720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2720 ?AUTO_2721 )
      ( MAKE-ON ?AUTO_2714 ?AUTO_2715 )
      ( MAKE-ON-VERIFY ?AUTO_2714 ?AUTO_2715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2724 - BLOCK
      ?AUTO_2725 - BLOCK
    )
    :vars
    (
      ?AUTO_2731 - BLOCK
      ?AUTO_2728 - BLOCK
      ?AUTO_2727 - BLOCK
      ?AUTO_2729 - BLOCK
      ?AUTO_2733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2724 ) ( ON ?AUTO_2725 ?AUTO_2724 ) ( ON ?AUTO_2731 ?AUTO_2725 ) ( ON ?AUTO_2728 ?AUTO_2731 ) ( ON ?AUTO_2727 ?AUTO_2728 ) ( CLEAR ?AUTO_2727 ) ( HOLDING ?AUTO_2729 ) ( CLEAR ?AUTO_2733 ) )
    :subtasks
    ( ( !STACK ?AUTO_2729 ?AUTO_2733 )
      ( MAKE-ON ?AUTO_2724 ?AUTO_2725 )
      ( MAKE-ON-VERIFY ?AUTO_2724 ?AUTO_2725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2738 - BLOCK
      ?AUTO_2739 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2738 ) ( CLEAR ?AUTO_2739 ) )
    :subtasks
    ( ( !STACK ?AUTO_2738 ?AUTO_2739 )
      ( MAKE-ON-VERIFY ?AUTO_2738 ?AUTO_2739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2742 - BLOCK
      ?AUTO_2743 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2743 ) ( ON-TABLE ?AUTO_2742 ) ( CLEAR ?AUTO_2742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2742 )
      ( MAKE-ON ?AUTO_2742 ?AUTO_2743 )
      ( MAKE-ON-VERIFY ?AUTO_2742 ?AUTO_2743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2747 - BLOCK
      ?AUTO_2748 - BLOCK
    )
    :vars
    (
      ?AUTO_2752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2747 ) ( CLEAR ?AUTO_2747 ) ( HOLDING ?AUTO_2748 ) ( CLEAR ?AUTO_2752 ) )
    :subtasks
    ( ( !STACK ?AUTO_2748 ?AUTO_2752 )
      ( MAKE-ON ?AUTO_2747 ?AUTO_2748 )
      ( MAKE-ON-VERIFY ?AUTO_2747 ?AUTO_2748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2755 - BLOCK
      ?AUTO_2756 - BLOCK
    )
    :vars
    (
      ?AUTO_2759 - BLOCK
      ?AUTO_2760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2756 ) ( ON-TABLE ?AUTO_2755 ) ( CLEAR ?AUTO_2755 ) ( HOLDING ?AUTO_2759 ) ( CLEAR ?AUTO_2760 ) )
    :subtasks
    ( ( !STACK ?AUTO_2759 ?AUTO_2760 )
      ( MAKE-ON ?AUTO_2755 ?AUTO_2756 )
      ( MAKE-ON-VERIFY ?AUTO_2755 ?AUTO_2756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2761 - BLOCK
      ?AUTO_2762 - BLOCK
    )
    :vars
    (
      ?AUTO_2766 - BLOCK
      ?AUTO_2765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2761 ) ( CLEAR ?AUTO_2761 ) ( CLEAR ?AUTO_2766 ) ( ON ?AUTO_2765 ?AUTO_2762 ) ( CLEAR ?AUTO_2765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2765 ?AUTO_2762 )
      ( MAKE-ON ?AUTO_2761 ?AUTO_2762 )
      ( MAKE-ON-VERIFY ?AUTO_2761 ?AUTO_2762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2769 - BLOCK
      ?AUTO_2770 - BLOCK
    )
    :vars
    (
      ?AUTO_2771 - BLOCK
      ?AUTO_2774 - BLOCK
      ?AUTO_2775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2769 ) ( CLEAR ?AUTO_2769 ) ( CLEAR ?AUTO_2771 ) ( ON ?AUTO_2774 ?AUTO_2770 ) ( CLEAR ?AUTO_2774 ) ( HOLDING ?AUTO_2775 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2775 )
      ( MAKE-ON ?AUTO_2769 ?AUTO_2770 )
      ( MAKE-ON-VERIFY ?AUTO_2769 ?AUTO_2770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2776 - BLOCK
      ?AUTO_2777 - BLOCK
    )
    :vars
    (
      ?AUTO_2779 - BLOCK
      ?AUTO_2781 - BLOCK
      ?AUTO_2782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2776 ) ( CLEAR ?AUTO_2776 ) ( CLEAR ?AUTO_2779 ) ( ON ?AUTO_2781 ?AUTO_2777 ) ( ON ?AUTO_2782 ?AUTO_2781 ) ( CLEAR ?AUTO_2782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2782 ?AUTO_2781 )
      ( MAKE-ON ?AUTO_2776 ?AUTO_2777 )
      ( MAKE-ON-VERIFY ?AUTO_2776 ?AUTO_2777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2785 - BLOCK
      ?AUTO_2786 - BLOCK
    )
    :vars
    (
      ?AUTO_2790 - BLOCK
      ?AUTO_2787 - BLOCK
      ?AUTO_2789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2790 ) ( ON ?AUTO_2787 ?AUTO_2786 ) ( ON ?AUTO_2789 ?AUTO_2787 ) ( CLEAR ?AUTO_2789 ) ( HOLDING ?AUTO_2785 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2785 )
      ( MAKE-ON ?AUTO_2785 ?AUTO_2786 )
      ( MAKE-ON-VERIFY ?AUTO_2785 ?AUTO_2786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2793 - BLOCK
      ?AUTO_2794 - BLOCK
    )
    :vars
    (
      ?AUTO_2799 - BLOCK
      ?AUTO_2796 - BLOCK
      ?AUTO_2795 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2799 ) ( ON ?AUTO_2796 ?AUTO_2794 ) ( ON ?AUTO_2795 ?AUTO_2796 ) ( ON ?AUTO_2793 ?AUTO_2795 ) ( CLEAR ?AUTO_2793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2793 ?AUTO_2795 )
      ( MAKE-ON ?AUTO_2793 ?AUTO_2794 )
      ( MAKE-ON-VERIFY ?AUTO_2793 ?AUTO_2794 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2802 - BLOCK
      ?AUTO_2803 - BLOCK
    )
    :vars
    (
      ?AUTO_2806 - BLOCK
      ?AUTO_2808 - BLOCK
      ?AUTO_2807 - BLOCK
      ?AUTO_2809 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2806 ) ( ON ?AUTO_2808 ?AUTO_2803 ) ( ON ?AUTO_2807 ?AUTO_2808 ) ( ON ?AUTO_2802 ?AUTO_2807 ) ( CLEAR ?AUTO_2802 ) ( HOLDING ?AUTO_2809 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2809 )
      ( MAKE-ON ?AUTO_2802 ?AUTO_2803 )
      ( MAKE-ON-VERIFY ?AUTO_2802 ?AUTO_2803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2810 - BLOCK
      ?AUTO_2811 - BLOCK
    )
    :vars
    (
      ?AUTO_2812 - BLOCK
      ?AUTO_2813 - BLOCK
      ?AUTO_2817 - BLOCK
      ?AUTO_2816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2812 ) ( ON ?AUTO_2813 ?AUTO_2811 ) ( ON ?AUTO_2817 ?AUTO_2813 ) ( ON ?AUTO_2810 ?AUTO_2817 ) ( ON ?AUTO_2816 ?AUTO_2810 ) ( CLEAR ?AUTO_2816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2816 ?AUTO_2810 )
      ( MAKE-ON ?AUTO_2810 ?AUTO_2811 )
      ( MAKE-ON-VERIFY ?AUTO_2810 ?AUTO_2811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2820 - BLOCK
      ?AUTO_2821 - BLOCK
    )
    :vars
    (
      ?AUTO_2825 - BLOCK
      ?AUTO_2827 - BLOCK
      ?AUTO_2826 - BLOCK
      ?AUTO_2823 - BLOCK
      ?AUTO_2829 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2825 ?AUTO_2821 ) ( ON ?AUTO_2827 ?AUTO_2825 ) ( ON ?AUTO_2820 ?AUTO_2827 ) ( ON ?AUTO_2826 ?AUTO_2820 ) ( CLEAR ?AUTO_2826 ) ( HOLDING ?AUTO_2823 ) ( CLEAR ?AUTO_2829 ) )
    :subtasks
    ( ( !STACK ?AUTO_2823 ?AUTO_2829 )
      ( MAKE-ON ?AUTO_2820 ?AUTO_2821 )
      ( MAKE-ON-VERIFY ?AUTO_2820 ?AUTO_2821 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2831 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2831 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2831 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2831 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2833 - BLOCK
    )
    :vars
    (
      ?AUTO_2836 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2833 ?AUTO_2836 ) ( CLEAR ?AUTO_2833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2833 ?AUTO_2836 )
      ( MAKE-ON-TABLE ?AUTO_2833 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2833 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2838 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2838 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2838 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2838 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2840 - BLOCK
    )
    :vars
    (
      ?AUTO_2843 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2840 ?AUTO_2843 ) ( CLEAR ?AUTO_2840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2840 ?AUTO_2843 )
      ( MAKE-ON-TABLE ?AUTO_2840 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2840 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2844 - BLOCK
    )
    :vars
    (
      ?AUTO_2846 - BLOCK
      ?AUTO_2847 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2844 ?AUTO_2846 ) ( CLEAR ?AUTO_2844 ) ( HOLDING ?AUTO_2847 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2847 )
      ( MAKE-ON-TABLE ?AUTO_2844 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2844 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2848 - BLOCK
    )
    :vars
    (
      ?AUTO_2850 - BLOCK
      ?AUTO_2851 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2848 ?AUTO_2850 ) ( ON ?AUTO_2851 ?AUTO_2848 ) ( CLEAR ?AUTO_2851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2851 ?AUTO_2848 )
      ( MAKE-ON-TABLE ?AUTO_2848 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2848 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2855 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2855 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2855 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2855 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2857 - BLOCK
    )
    :vars
    (
      ?AUTO_2860 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2857 ?AUTO_2860 ) ( CLEAR ?AUTO_2857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2857 ?AUTO_2860 )
      ( MAKE-ON-TABLE ?AUTO_2857 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2857 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2861 - BLOCK
    )
    :vars
    (
      ?AUTO_2863 - BLOCK
      ?AUTO_2864 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2861 ?AUTO_2863 ) ( CLEAR ?AUTO_2861 ) ( HOLDING ?AUTO_2864 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2864 )
      ( MAKE-ON-TABLE ?AUTO_2861 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2861 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2865 - BLOCK
    )
    :vars
    (
      ?AUTO_2867 - BLOCK
      ?AUTO_2868 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2865 ?AUTO_2867 ) ( ON ?AUTO_2868 ?AUTO_2865 ) ( CLEAR ?AUTO_2868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2868 ?AUTO_2865 )
      ( MAKE-ON-TABLE ?AUTO_2865 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2865 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2871 - BLOCK
    )
    :vars
    (
      ?AUTO_2872 - BLOCK
      ?AUTO_2873 - BLOCK
      ?AUTO_2875 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2871 ?AUTO_2872 ) ( ON ?AUTO_2873 ?AUTO_2871 ) ( CLEAR ?AUTO_2873 ) ( HOLDING ?AUTO_2875 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2875 )
      ( MAKE-ON-TABLE ?AUTO_2871 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2871 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2876 - BLOCK
    )
    :vars
    (
      ?AUTO_2877 - BLOCK
      ?AUTO_2879 - BLOCK
      ?AUTO_2880 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2876 ?AUTO_2877 ) ( ON ?AUTO_2879 ?AUTO_2876 ) ( ON ?AUTO_2880 ?AUTO_2879 ) ( CLEAR ?AUTO_2880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2880 ?AUTO_2879 )
      ( MAKE-ON-TABLE ?AUTO_2876 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2885 - BLOCK
      ?AUTO_2886 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2885 ) ( CLEAR ?AUTO_2886 ) )
    :subtasks
    ( ( !STACK ?AUTO_2885 ?AUTO_2886 )
      ( MAKE-ON-VERIFY ?AUTO_2885 ?AUTO_2886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2889 - BLOCK
      ?AUTO_2890 - BLOCK
    )
    :vars
    (
      ?AUTO_2894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2890 ) ( ON ?AUTO_2889 ?AUTO_2894 ) ( CLEAR ?AUTO_2889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2889 ?AUTO_2894 )
      ( MAKE-ON ?AUTO_2889 ?AUTO_2890 )
      ( MAKE-ON-VERIFY ?AUTO_2889 ?AUTO_2890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2895 - BLOCK
      ?AUTO_2896 - BLOCK
    )
    :vars
    (
      ?AUTO_2899 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2895 ?AUTO_2899 ) ( CLEAR ?AUTO_2895 ) ( HOLDING ?AUTO_2896 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2896 )
      ( MAKE-ON ?AUTO_2895 ?AUTO_2896 )
      ( MAKE-ON-VERIFY ?AUTO_2895 ?AUTO_2896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2901 - BLOCK
      ?AUTO_2902 - BLOCK
    )
    :vars
    (
      ?AUTO_2905 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2901 ?AUTO_2905 ) ( ON ?AUTO_2902 ?AUTO_2901 ) ( CLEAR ?AUTO_2902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2902 ?AUTO_2901 )
      ( MAKE-ON ?AUTO_2901 ?AUTO_2902 )
      ( MAKE-ON-VERIFY ?AUTO_2901 ?AUTO_2902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2908 - BLOCK
      ?AUTO_2909 - BLOCK
    )
    :vars
    (
      ?AUTO_2912 - BLOCK
      ?AUTO_2913 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2908 ?AUTO_2912 ) ( ON ?AUTO_2909 ?AUTO_2908 ) ( CLEAR ?AUTO_2909 ) ( HOLDING ?AUTO_2913 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2913 )
      ( MAKE-ON ?AUTO_2908 ?AUTO_2909 )
      ( MAKE-ON-VERIFY ?AUTO_2908 ?AUTO_2909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2914 - BLOCK
      ?AUTO_2915 - BLOCK
    )
    :vars
    (
      ?AUTO_2917 - BLOCK
      ?AUTO_2919 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2914 ?AUTO_2917 ) ( ON ?AUTO_2915 ?AUTO_2914 ) ( ON ?AUTO_2919 ?AUTO_2915 ) ( CLEAR ?AUTO_2919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2919 ?AUTO_2915 )
      ( MAKE-ON ?AUTO_2914 ?AUTO_2915 )
      ( MAKE-ON-VERIFY ?AUTO_2914 ?AUTO_2915 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2922 - BLOCK
      ?AUTO_2923 - BLOCK
    )
    :vars
    (
      ?AUTO_2924 - BLOCK
      ?AUTO_2926 - BLOCK
      ?AUTO_2928 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2922 ?AUTO_2924 ) ( ON ?AUTO_2923 ?AUTO_2922 ) ( ON ?AUTO_2926 ?AUTO_2923 ) ( CLEAR ?AUTO_2926 ) ( HOLDING ?AUTO_2928 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2928 )
      ( MAKE-ON ?AUTO_2922 ?AUTO_2923 )
      ( MAKE-ON-VERIFY ?AUTO_2922 ?AUTO_2923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2929 - BLOCK
      ?AUTO_2930 - BLOCK
    )
    :vars
    (
      ?AUTO_2931 - BLOCK
      ?AUTO_2934 - BLOCK
      ?AUTO_2935 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2929 ?AUTO_2931 ) ( ON ?AUTO_2930 ?AUTO_2929 ) ( ON ?AUTO_2934 ?AUTO_2930 ) ( ON ?AUTO_2935 ?AUTO_2934 ) ( CLEAR ?AUTO_2935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2935 ?AUTO_2934 )
      ( MAKE-ON ?AUTO_2929 ?AUTO_2930 )
      ( MAKE-ON-VERIFY ?AUTO_2929 ?AUTO_2930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2940 - BLOCK
      ?AUTO_2941 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2940 ) ( CLEAR ?AUTO_2941 ) )
    :subtasks
    ( ( !STACK ?AUTO_2940 ?AUTO_2941 )
      ( MAKE-ON-VERIFY ?AUTO_2940 ?AUTO_2941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2944 - BLOCK
      ?AUTO_2945 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2945 ) ( ON-TABLE ?AUTO_2944 ) ( CLEAR ?AUTO_2944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2944 )
      ( MAKE-ON ?AUTO_2944 ?AUTO_2945 )
      ( MAKE-ON-VERIFY ?AUTO_2944 ?AUTO_2945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2949 - BLOCK
      ?AUTO_2950 - BLOCK
    )
    :vars
    (
      ?AUTO_2954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2949 ) ( CLEAR ?AUTO_2949 ) ( HOLDING ?AUTO_2950 ) ( CLEAR ?AUTO_2954 ) )
    :subtasks
    ( ( !STACK ?AUTO_2950 ?AUTO_2954 )
      ( MAKE-ON ?AUTO_2949 ?AUTO_2950 )
      ( MAKE-ON-VERIFY ?AUTO_2949 ?AUTO_2950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2957 - BLOCK
      ?AUTO_2958 - BLOCK
    )
    :vars
    (
      ?AUTO_2961 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2958 ) ( ON-TABLE ?AUTO_2957 ) ( CLEAR ?AUTO_2957 ) ( HOLDING ?AUTO_2961 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2961 )
      ( MAKE-ON ?AUTO_2957 ?AUTO_2958 )
      ( MAKE-ON-VERIFY ?AUTO_2957 ?AUTO_2958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2962 - BLOCK
      ?AUTO_2963 - BLOCK
    )
    :vars
    (
      ?AUTO_2966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2962 ) ( CLEAR ?AUTO_2962 ) ( ON ?AUTO_2966 ?AUTO_2963 ) ( CLEAR ?AUTO_2966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2966 ?AUTO_2963 )
      ( MAKE-ON ?AUTO_2962 ?AUTO_2963 )
      ( MAKE-ON-VERIFY ?AUTO_2962 ?AUTO_2963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2969 - BLOCK
      ?AUTO_2970 - BLOCK
    )
    :vars
    (
      ?AUTO_2973 - BLOCK
      ?AUTO_2974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2969 ) ( CLEAR ?AUTO_2969 ) ( ON ?AUTO_2973 ?AUTO_2970 ) ( CLEAR ?AUTO_2973 ) ( HOLDING ?AUTO_2974 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2974 )
      ( MAKE-ON ?AUTO_2969 ?AUTO_2970 )
      ( MAKE-ON-VERIFY ?AUTO_2969 ?AUTO_2970 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2975 - BLOCK
      ?AUTO_2976 - BLOCK
    )
    :vars
    (
      ?AUTO_2977 - BLOCK
      ?AUTO_2980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2975 ) ( CLEAR ?AUTO_2975 ) ( ON ?AUTO_2977 ?AUTO_2976 ) ( ON ?AUTO_2980 ?AUTO_2977 ) ( CLEAR ?AUTO_2980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2980 ?AUTO_2977 )
      ( MAKE-ON ?AUTO_2975 ?AUTO_2976 )
      ( MAKE-ON-VERIFY ?AUTO_2975 ?AUTO_2976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2983 - BLOCK
      ?AUTO_2984 - BLOCK
    )
    :vars
    (
      ?AUTO_2986 - BLOCK
      ?AUTO_2985 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2986 ?AUTO_2984 ) ( ON ?AUTO_2985 ?AUTO_2986 ) ( CLEAR ?AUTO_2985 ) ( HOLDING ?AUTO_2983 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2983 )
      ( MAKE-ON ?AUTO_2983 ?AUTO_2984 )
      ( MAKE-ON-VERIFY ?AUTO_2983 ?AUTO_2984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2990 - BLOCK
      ?AUTO_2991 - BLOCK
    )
    :vars
    (
      ?AUTO_2992 - BLOCK
      ?AUTO_2993 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2992 ?AUTO_2991 ) ( ON ?AUTO_2993 ?AUTO_2992 ) ( ON ?AUTO_2990 ?AUTO_2993 ) ( CLEAR ?AUTO_2990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2990 ?AUTO_2993 )
      ( MAKE-ON ?AUTO_2990 ?AUTO_2991 )
      ( MAKE-ON-VERIFY ?AUTO_2990 ?AUTO_2991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3000 - BLOCK
      ?AUTO_3001 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3000 ) ( CLEAR ?AUTO_3001 ) )
    :subtasks
    ( ( !STACK ?AUTO_3000 ?AUTO_3001 )
      ( MAKE-ON-VERIFY ?AUTO_3000 ?AUTO_3001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3004 - BLOCK
      ?AUTO_3005 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3005 ) ( ON-TABLE ?AUTO_3004 ) ( CLEAR ?AUTO_3004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3004 )
      ( MAKE-ON ?AUTO_3004 ?AUTO_3005 )
      ( MAKE-ON-VERIFY ?AUTO_3004 ?AUTO_3005 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3009 - BLOCK
      ?AUTO_3010 - BLOCK
    )
    :vars
    (
      ?AUTO_3013 - BLOCK
      ?AUTO_3014 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3010 ) ( ON-TABLE ?AUTO_3009 ) ( CLEAR ?AUTO_3009 ) ( HOLDING ?AUTO_3013 ) ( CLEAR ?AUTO_3014 ) )
    :subtasks
    ( ( !STACK ?AUTO_3013 ?AUTO_3014 )
      ( MAKE-ON ?AUTO_3009 ?AUTO_3010 )
      ( MAKE-ON-VERIFY ?AUTO_3009 ?AUTO_3010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3035 - BLOCK
      ?AUTO_3036 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3035 ) ( CLEAR ?AUTO_3036 ) )
    :subtasks
    ( ( !STACK ?AUTO_3035 ?AUTO_3036 )
      ( MAKE-ON-VERIFY ?AUTO_3035 ?AUTO_3036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3039 - BLOCK
      ?AUTO_3040 - BLOCK
    )
    :vars
    (
      ?AUTO_3044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3040 ) ( ON ?AUTO_3039 ?AUTO_3044 ) ( CLEAR ?AUTO_3039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3039 ?AUTO_3044 )
      ( MAKE-ON ?AUTO_3039 ?AUTO_3040 )
      ( MAKE-ON-VERIFY ?AUTO_3039 ?AUTO_3040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3045 - BLOCK
      ?AUTO_3046 - BLOCK
    )
    :vars
    (
      ?AUTO_3049 - BLOCK
      ?AUTO_3050 - BLOCK
      ?AUTO_3051 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3046 ) ( ON ?AUTO_3045 ?AUTO_3049 ) ( CLEAR ?AUTO_3045 ) ( HOLDING ?AUTO_3050 ) ( CLEAR ?AUTO_3051 ) )
    :subtasks
    ( ( !STACK ?AUTO_3050 ?AUTO_3051 )
      ( MAKE-ON ?AUTO_3045 ?AUTO_3046 )
      ( MAKE-ON-VERIFY ?AUTO_3045 ?AUTO_3046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3060 - BLOCK
      ?AUTO_3061 - BLOCK
    )
    :vars
    (
      ?AUTO_3064 - BLOCK
      ?AUTO_3066 - BLOCK
      ?AUTO_3065 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3060 ?AUTO_3064 ) ( CLEAR ?AUTO_3060 ) ( CLEAR ?AUTO_3066 ) ( ON ?AUTO_3065 ?AUTO_3061 ) ( CLEAR ?AUTO_3065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3065 ?AUTO_3061 )
      ( MAKE-ON ?AUTO_3060 ?AUTO_3061 )
      ( MAKE-ON-VERIFY ?AUTO_3060 ?AUTO_3061 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3069 - BLOCK
      ?AUTO_3070 - BLOCK
    )
    :vars
    (
      ?AUTO_3073 - BLOCK
      ?AUTO_3075 - BLOCK
      ?AUTO_3074 - BLOCK
      ?AUTO_3076 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3069 ?AUTO_3073 ) ( CLEAR ?AUTO_3069 ) ( CLEAR ?AUTO_3075 ) ( ON ?AUTO_3074 ?AUTO_3070 ) ( CLEAR ?AUTO_3074 ) ( HOLDING ?AUTO_3076 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3076 )
      ( MAKE-ON ?AUTO_3069 ?AUTO_3070 )
      ( MAKE-ON-VERIFY ?AUTO_3069 ?AUTO_3070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3077 - BLOCK
      ?AUTO_3078 - BLOCK
    )
    :vars
    (
      ?AUTO_3084 - BLOCK
      ?AUTO_3079 - BLOCK
      ?AUTO_3080 - BLOCK
      ?AUTO_3083 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3077 ?AUTO_3084 ) ( CLEAR ?AUTO_3077 ) ( CLEAR ?AUTO_3079 ) ( ON ?AUTO_3080 ?AUTO_3078 ) ( ON ?AUTO_3083 ?AUTO_3080 ) ( CLEAR ?AUTO_3083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3083 ?AUTO_3080 )
      ( MAKE-ON ?AUTO_3077 ?AUTO_3078 )
      ( MAKE-ON-VERIFY ?AUTO_3077 ?AUTO_3078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3087 - BLOCK
      ?AUTO_3088 - BLOCK
    )
    :vars
    (
      ?AUTO_3093 - BLOCK
      ?AUTO_3092 - BLOCK
      ?AUTO_3090 - BLOCK
      ?AUTO_3094 - BLOCK
      ?AUTO_3095 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3087 ?AUTO_3093 ) ( CLEAR ?AUTO_3087 ) ( CLEAR ?AUTO_3092 ) ( ON ?AUTO_3090 ?AUTO_3088 ) ( ON ?AUTO_3094 ?AUTO_3090 ) ( CLEAR ?AUTO_3094 ) ( HOLDING ?AUTO_3095 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3095 )
      ( MAKE-ON ?AUTO_3087 ?AUTO_3088 )
      ( MAKE-ON-VERIFY ?AUTO_3087 ?AUTO_3088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3096 - BLOCK
      ?AUTO_3097 - BLOCK
    )
    :vars
    (
      ?AUTO_3100 - BLOCK
      ?AUTO_3099 - BLOCK
      ?AUTO_3103 - BLOCK
      ?AUTO_3098 - BLOCK
      ?AUTO_3104 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3096 ?AUTO_3100 ) ( CLEAR ?AUTO_3096 ) ( CLEAR ?AUTO_3099 ) ( ON ?AUTO_3103 ?AUTO_3097 ) ( ON ?AUTO_3098 ?AUTO_3103 ) ( ON ?AUTO_3104 ?AUTO_3098 ) ( CLEAR ?AUTO_3104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3104 ?AUTO_3098 )
      ( MAKE-ON ?AUTO_3096 ?AUTO_3097 )
      ( MAKE-ON-VERIFY ?AUTO_3096 ?AUTO_3097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3107 - BLOCK
      ?AUTO_3108 - BLOCK
    )
    :vars
    (
      ?AUTO_3110 - BLOCK
      ?AUTO_3114 - BLOCK
      ?AUTO_3115 - BLOCK
      ?AUTO_3112 - BLOCK
      ?AUTO_3111 - BLOCK
      ?AUTO_3116 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3107 ?AUTO_3110 ) ( CLEAR ?AUTO_3107 ) ( CLEAR ?AUTO_3114 ) ( ON ?AUTO_3115 ?AUTO_3108 ) ( ON ?AUTO_3112 ?AUTO_3115 ) ( ON ?AUTO_3111 ?AUTO_3112 ) ( CLEAR ?AUTO_3111 ) ( HOLDING ?AUTO_3116 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3116 )
      ( MAKE-ON ?AUTO_3107 ?AUTO_3108 )
      ( MAKE-ON-VERIFY ?AUTO_3107 ?AUTO_3108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3117 - BLOCK
      ?AUTO_3118 - BLOCK
    )
    :vars
    (
      ?AUTO_3122 - BLOCK
      ?AUTO_3121 - BLOCK
      ?AUTO_3119 - BLOCK
      ?AUTO_3125 - BLOCK
      ?AUTO_3120 - BLOCK
      ?AUTO_3126 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3117 ?AUTO_3122 ) ( CLEAR ?AUTO_3117 ) ( CLEAR ?AUTO_3121 ) ( ON ?AUTO_3119 ?AUTO_3118 ) ( ON ?AUTO_3125 ?AUTO_3119 ) ( ON ?AUTO_3120 ?AUTO_3125 ) ( ON ?AUTO_3126 ?AUTO_3120 ) ( CLEAR ?AUTO_3126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3126 ?AUTO_3120 )
      ( MAKE-ON ?AUTO_3117 ?AUTO_3118 )
      ( MAKE-ON-VERIFY ?AUTO_3117 ?AUTO_3118 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3130 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3130 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3130 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3130 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3132 - BLOCK
    )
    :vars
    (
      ?AUTO_3135 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3132 ?AUTO_3135 ) ( CLEAR ?AUTO_3132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3132 ?AUTO_3135 )
      ( MAKE-ON-TABLE ?AUTO_3132 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3132 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3136 - BLOCK
    )
    :vars
    (
      ?AUTO_3138 - BLOCK
      ?AUTO_3139 - BLOCK
      ?AUTO_3140 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3136 ?AUTO_3138 ) ( CLEAR ?AUTO_3136 ) ( HOLDING ?AUTO_3139 ) ( CLEAR ?AUTO_3140 ) )
    :subtasks
    ( ( !STACK ?AUTO_3139 ?AUTO_3140 )
      ( MAKE-ON-TABLE ?AUTO_3136 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3136 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3141 - BLOCK
    )
    :vars
    (
      ?AUTO_3143 - BLOCK
      ?AUTO_3145 - BLOCK
      ?AUTO_3144 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3141 ?AUTO_3143 ) ( CLEAR ?AUTO_3145 ) ( ON ?AUTO_3144 ?AUTO_3141 ) ( CLEAR ?AUTO_3144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3144 ?AUTO_3141 )
      ( MAKE-ON-TABLE ?AUTO_3141 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3141 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3148 - BLOCK
    )
    :vars
    (
      ?AUTO_3151 - BLOCK
      ?AUTO_3149 - BLOCK
      ?AUTO_3152 - BLOCK
      ?AUTO_3153 - BLOCK
      ?AUTO_3154 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3148 ?AUTO_3151 ) ( CLEAR ?AUTO_3149 ) ( ON ?AUTO_3152 ?AUTO_3148 ) ( CLEAR ?AUTO_3152 ) ( HOLDING ?AUTO_3153 ) ( CLEAR ?AUTO_3154 ) )
    :subtasks
    ( ( !STACK ?AUTO_3153 ?AUTO_3154 )
      ( MAKE-ON-TABLE ?AUTO_3148 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3148 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3167 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3167 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3167 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3167 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3169 - BLOCK
    )
    :vars
    (
      ?AUTO_3172 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3169 ?AUTO_3172 ) ( CLEAR ?AUTO_3169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3169 ?AUTO_3172 )
      ( MAKE-ON-TABLE ?AUTO_3169 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3169 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3173 - BLOCK
    )
    :vars
    (
      ?AUTO_3175 - BLOCK
      ?AUTO_3176 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3173 ?AUTO_3175 ) ( CLEAR ?AUTO_3173 ) ( HOLDING ?AUTO_3176 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3176 )
      ( MAKE-ON-TABLE ?AUTO_3173 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3173 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3177 - BLOCK
    )
    :vars
    (
      ?AUTO_3179 - BLOCK
      ?AUTO_3180 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3177 ?AUTO_3179 ) ( ON ?AUTO_3180 ?AUTO_3177 ) ( CLEAR ?AUTO_3180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3180 ?AUTO_3177 )
      ( MAKE-ON-TABLE ?AUTO_3177 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3177 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3183 - BLOCK
    )
    :vars
    (
      ?AUTO_3184 - BLOCK
      ?AUTO_3185 - BLOCK
      ?AUTO_3187 - BLOCK
      ?AUTO_3188 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3183 ?AUTO_3184 ) ( ON ?AUTO_3185 ?AUTO_3183 ) ( CLEAR ?AUTO_3185 ) ( HOLDING ?AUTO_3187 ) ( CLEAR ?AUTO_3188 ) )
    :subtasks
    ( ( !STACK ?AUTO_3187 ?AUTO_3188 )
      ( MAKE-ON-TABLE ?AUTO_3183 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3183 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3189 - BLOCK
    )
    :vars
    (
      ?AUTO_3191 - BLOCK
      ?AUTO_3192 - BLOCK
      ?AUTO_3194 - BLOCK
      ?AUTO_3193 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3189 ?AUTO_3191 ) ( ON ?AUTO_3192 ?AUTO_3189 ) ( CLEAR ?AUTO_3194 ) ( ON ?AUTO_3193 ?AUTO_3192 ) ( CLEAR ?AUTO_3193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3193 ?AUTO_3192 )
      ( MAKE-ON-TABLE ?AUTO_3189 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3189 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3197 - BLOCK
    )
    :vars
    (
      ?AUTO_3202 - BLOCK
      ?AUTO_3199 - BLOCK
      ?AUTO_3200 - BLOCK
      ?AUTO_3198 - BLOCK
      ?AUTO_3203 - BLOCK
      ?AUTO_3204 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3197 ?AUTO_3202 ) ( ON ?AUTO_3199 ?AUTO_3197 ) ( CLEAR ?AUTO_3200 ) ( ON ?AUTO_3198 ?AUTO_3199 ) ( CLEAR ?AUTO_3198 ) ( HOLDING ?AUTO_3203 ) ( CLEAR ?AUTO_3204 ) )
    :subtasks
    ( ( !STACK ?AUTO_3203 ?AUTO_3204 )
      ( MAKE-ON-TABLE ?AUTO_3197 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3218 - BLOCK
      ?AUTO_3219 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3218 ) ( CLEAR ?AUTO_3219 ) )
    :subtasks
    ( ( !STACK ?AUTO_3218 ?AUTO_3219 )
      ( MAKE-ON-VERIFY ?AUTO_3218 ?AUTO_3219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3222 - BLOCK
      ?AUTO_3223 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3223 ) ( ON-TABLE ?AUTO_3222 ) ( CLEAR ?AUTO_3222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3222 )
      ( MAKE-ON ?AUTO_3222 ?AUTO_3223 )
      ( MAKE-ON-VERIFY ?AUTO_3222 ?AUTO_3223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3227 - BLOCK
      ?AUTO_3228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3227 ) ( CLEAR ?AUTO_3227 ) ( HOLDING ?AUTO_3228 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3228 )
      ( MAKE-ON ?AUTO_3227 ?AUTO_3228 )
      ( MAKE-ON-VERIFY ?AUTO_3227 ?AUTO_3228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3506 - BLOCK
      ?AUTO_3507 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3506 ) ( CLEAR ?AUTO_3507 ) )
    :subtasks
    ( ( !STACK ?AUTO_3506 ?AUTO_3507 )
      ( MAKE-ON-VERIFY ?AUTO_3506 ?AUTO_3507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3510 - BLOCK
      ?AUTO_3511 - BLOCK
    )
    :vars
    (
      ?AUTO_3515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3511 ) ( ON ?AUTO_3510 ?AUTO_3515 ) ( CLEAR ?AUTO_3510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3510 ?AUTO_3515 )
      ( MAKE-ON ?AUTO_3510 ?AUTO_3511 )
      ( MAKE-ON-VERIFY ?AUTO_3510 ?AUTO_3511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3516 - BLOCK
      ?AUTO_3517 - BLOCK
    )
    :vars
    (
      ?AUTO_3520 - BLOCK
      ?AUTO_3522 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3516 ?AUTO_3520 ) ( CLEAR ?AUTO_3516 ) ( HOLDING ?AUTO_3517 ) ( CLEAR ?AUTO_3522 ) )
    :subtasks
    ( ( !STACK ?AUTO_3517 ?AUTO_3522 )
      ( MAKE-ON ?AUTO_3516 ?AUTO_3517 )
      ( MAKE-ON-VERIFY ?AUTO_3516 ?AUTO_3517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3525 - BLOCK
      ?AUTO_3526 - BLOCK
    )
    :vars
    (
      ?AUTO_3529 - BLOCK
      ?AUTO_3530 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3526 ) ( ON ?AUTO_3525 ?AUTO_3529 ) ( CLEAR ?AUTO_3525 ) ( HOLDING ?AUTO_3530 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3530 )
      ( MAKE-ON ?AUTO_3525 ?AUTO_3526 )
      ( MAKE-ON-VERIFY ?AUTO_3525 ?AUTO_3526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3615 - BLOCK
      ?AUTO_3616 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3615 ) ( CLEAR ?AUTO_3616 ) )
    :subtasks
    ( ( !STACK ?AUTO_3615 ?AUTO_3616 )
      ( MAKE-ON-VERIFY ?AUTO_3615 ?AUTO_3616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3619 - BLOCK
      ?AUTO_3620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3620 ) ( ON-TABLE ?AUTO_3619 ) ( CLEAR ?AUTO_3619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3619 )
      ( MAKE-ON ?AUTO_3619 ?AUTO_3620 )
      ( MAKE-ON-VERIFY ?AUTO_3619 ?AUTO_3620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3624 - BLOCK
      ?AUTO_3625 - BLOCK
    )
    :vars
    (
      ?AUTO_3628 - BLOCK
      ?AUTO_3629 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3625 ) ( ON-TABLE ?AUTO_3624 ) ( CLEAR ?AUTO_3624 ) ( HOLDING ?AUTO_3628 ) ( CLEAR ?AUTO_3629 ) )
    :subtasks
    ( ( !STACK ?AUTO_3628 ?AUTO_3629 )
      ( MAKE-ON ?AUTO_3624 ?AUTO_3625 )
      ( MAKE-ON-VERIFY ?AUTO_3624 ?AUTO_3625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3630 - BLOCK
      ?AUTO_3631 - BLOCK
    )
    :vars
    (
      ?AUTO_3635 - BLOCK
      ?AUTO_3634 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3631 ) ( ON-TABLE ?AUTO_3630 ) ( CLEAR ?AUTO_3635 ) ( ON ?AUTO_3634 ?AUTO_3630 ) ( CLEAR ?AUTO_3634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3634 ?AUTO_3630 )
      ( MAKE-ON ?AUTO_3630 ?AUTO_3631 )
      ( MAKE-ON-VERIFY ?AUTO_3630 ?AUTO_3631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3638 - BLOCK
      ?AUTO_3639 - BLOCK
    )
    :vars
    (
      ?AUTO_3643 - BLOCK
      ?AUTO_3640 - BLOCK
      ?AUTO_3645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3639 ) ( ON-TABLE ?AUTO_3638 ) ( ON ?AUTO_3643 ?AUTO_3638 ) ( CLEAR ?AUTO_3643 ) ( HOLDING ?AUTO_3640 ) ( CLEAR ?AUTO_3645 ) )
    :subtasks
    ( ( !STACK ?AUTO_3640 ?AUTO_3645 )
      ( MAKE-ON ?AUTO_3638 ?AUTO_3639 )
      ( MAKE-ON-VERIFY ?AUTO_3638 ?AUTO_3639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3650 - BLOCK
      ?AUTO_3651 - BLOCK
    )
    :vars
    (
      ?AUTO_3654 - BLOCK
      ?AUTO_3656 - BLOCK
      ?AUTO_3652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3650 ) ( ON ?AUTO_3654 ?AUTO_3650 ) ( CLEAR ?AUTO_3654 ) ( CLEAR ?AUTO_3656 ) ( ON ?AUTO_3652 ?AUTO_3651 ) ( CLEAR ?AUTO_3652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3652 ?AUTO_3651 )
      ( MAKE-ON ?AUTO_3650 ?AUTO_3651 )
      ( MAKE-ON-VERIFY ?AUTO_3650 ?AUTO_3651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3659 - BLOCK
      ?AUTO_3660 - BLOCK
    )
    :vars
    (
      ?AUTO_3665 - BLOCK
      ?AUTO_3664 - BLOCK
      ?AUTO_3663 - BLOCK
      ?AUTO_3666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3659 ) ( ON ?AUTO_3665 ?AUTO_3659 ) ( CLEAR ?AUTO_3665 ) ( CLEAR ?AUTO_3664 ) ( ON ?AUTO_3663 ?AUTO_3660 ) ( CLEAR ?AUTO_3663 ) ( HOLDING ?AUTO_3666 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3666 )
      ( MAKE-ON ?AUTO_3659 ?AUTO_3660 )
      ( MAKE-ON-VERIFY ?AUTO_3659 ?AUTO_3660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3667 - BLOCK
      ?AUTO_3668 - BLOCK
    )
    :vars
    (
      ?AUTO_3669 - BLOCK
      ?AUTO_3674 - BLOCK
      ?AUTO_3673 - BLOCK
      ?AUTO_3672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3667 ) ( ON ?AUTO_3669 ?AUTO_3667 ) ( CLEAR ?AUTO_3669 ) ( CLEAR ?AUTO_3674 ) ( ON ?AUTO_3673 ?AUTO_3668 ) ( ON ?AUTO_3672 ?AUTO_3673 ) ( CLEAR ?AUTO_3672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3672 ?AUTO_3673 )
      ( MAKE-ON ?AUTO_3667 ?AUTO_3668 )
      ( MAKE-ON-VERIFY ?AUTO_3667 ?AUTO_3668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3677 - BLOCK
      ?AUTO_3678 - BLOCK
    )
    :vars
    (
      ?AUTO_3684 - BLOCK
      ?AUTO_3681 - BLOCK
      ?AUTO_3683 - BLOCK
      ?AUTO_3680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3677 ) ( CLEAR ?AUTO_3684 ) ( ON ?AUTO_3681 ?AUTO_3678 ) ( ON ?AUTO_3683 ?AUTO_3681 ) ( CLEAR ?AUTO_3683 ) ( HOLDING ?AUTO_3680 ) ( CLEAR ?AUTO_3677 ) )
    :subtasks
    ( ( !STACK ?AUTO_3680 ?AUTO_3677 )
      ( MAKE-ON ?AUTO_3677 ?AUTO_3678 )
      ( MAKE-ON-VERIFY ?AUTO_3677 ?AUTO_3678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3687 - BLOCK
      ?AUTO_3688 - BLOCK
    )
    :vars
    (
      ?AUTO_3691 - BLOCK
      ?AUTO_3689 - BLOCK
      ?AUTO_3690 - BLOCK
      ?AUTO_3692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3687 ) ( CLEAR ?AUTO_3691 ) ( ON ?AUTO_3689 ?AUTO_3688 ) ( ON ?AUTO_3690 ?AUTO_3689 ) ( CLEAR ?AUTO_3687 ) ( ON ?AUTO_3692 ?AUTO_3690 ) ( CLEAR ?AUTO_3692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3692 ?AUTO_3690 )
      ( MAKE-ON ?AUTO_3687 ?AUTO_3688 )
      ( MAKE-ON-VERIFY ?AUTO_3687 ?AUTO_3688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3697 - BLOCK
      ?AUTO_3698 - BLOCK
    )
    :vars
    (
      ?AUTO_3703 - BLOCK
      ?AUTO_3704 - BLOCK
      ?AUTO_3701 - BLOCK
      ?AUTO_3702 - BLOCK
      ?AUTO_3705 - BLOCK
      ?AUTO_3706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3697 ) ( CLEAR ?AUTO_3703 ) ( ON ?AUTO_3704 ?AUTO_3698 ) ( ON ?AUTO_3701 ?AUTO_3704 ) ( CLEAR ?AUTO_3697 ) ( ON ?AUTO_3702 ?AUTO_3701 ) ( CLEAR ?AUTO_3702 ) ( HOLDING ?AUTO_3705 ) ( CLEAR ?AUTO_3706 ) )
    :subtasks
    ( ( !STACK ?AUTO_3705 ?AUTO_3706 )
      ( MAKE-ON ?AUTO_3697 ?AUTO_3698 )
      ( MAKE-ON-VERIFY ?AUTO_3697 ?AUTO_3698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3715 - BLOCK
      ?AUTO_3716 - BLOCK
    )
    :vars
    (
      ?AUTO_3718 - BLOCK
      ?AUTO_3717 - BLOCK
      ?AUTO_3720 - BLOCK
      ?AUTO_3724 - BLOCK
      ?AUTO_3722 - BLOCK
      ?AUTO_3721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3715 ) ( CLEAR ?AUTO_3718 ) ( ON ?AUTO_3717 ?AUTO_3716 ) ( ON ?AUTO_3720 ?AUTO_3717 ) ( ON ?AUTO_3724 ?AUTO_3720 ) ( CLEAR ?AUTO_3724 ) ( CLEAR ?AUTO_3722 ) ( ON ?AUTO_3721 ?AUTO_3715 ) ( CLEAR ?AUTO_3721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3721 ?AUTO_3715 )
      ( MAKE-ON ?AUTO_3715 ?AUTO_3716 )
      ( MAKE-ON-VERIFY ?AUTO_3715 ?AUTO_3716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3727 - BLOCK
      ?AUTO_3728 - BLOCK
    )
    :vars
    (
      ?AUTO_3732 - BLOCK
      ?AUTO_3731 - BLOCK
      ?AUTO_3729 - BLOCK
      ?AUTO_3736 - BLOCK
      ?AUTO_3733 - BLOCK
      ?AUTO_3730 - BLOCK
      ?AUTO_3737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3727 ) ( CLEAR ?AUTO_3732 ) ( ON ?AUTO_3731 ?AUTO_3728 ) ( ON ?AUTO_3729 ?AUTO_3731 ) ( ON ?AUTO_3736 ?AUTO_3729 ) ( CLEAR ?AUTO_3736 ) ( CLEAR ?AUTO_3733 ) ( ON ?AUTO_3730 ?AUTO_3727 ) ( CLEAR ?AUTO_3730 ) ( HOLDING ?AUTO_3737 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3737 )
      ( MAKE-ON ?AUTO_3727 ?AUTO_3728 )
      ( MAKE-ON-VERIFY ?AUTO_3727 ?AUTO_3728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3738 - BLOCK
      ?AUTO_3739 - BLOCK
    )
    :vars
    (
      ?AUTO_3742 - BLOCK
      ?AUTO_3748 - BLOCK
      ?AUTO_3743 - BLOCK
      ?AUTO_3746 - BLOCK
      ?AUTO_3741 - BLOCK
      ?AUTO_3745 - BLOCK
      ?AUTO_3744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3738 ) ( CLEAR ?AUTO_3742 ) ( ON ?AUTO_3748 ?AUTO_3739 ) ( ON ?AUTO_3743 ?AUTO_3748 ) ( ON ?AUTO_3746 ?AUTO_3743 ) ( CLEAR ?AUTO_3746 ) ( CLEAR ?AUTO_3741 ) ( ON ?AUTO_3745 ?AUTO_3738 ) ( ON ?AUTO_3744 ?AUTO_3745 ) ( CLEAR ?AUTO_3744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3744 ?AUTO_3745 )
      ( MAKE-ON ?AUTO_3738 ?AUTO_3739 )
      ( MAKE-ON-VERIFY ?AUTO_3738 ?AUTO_3739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3751 - BLOCK
      ?AUTO_3752 - BLOCK
    )
    :vars
    (
      ?AUTO_3760 - BLOCK
      ?AUTO_3753 - BLOCK
      ?AUTO_3758 - BLOCK
      ?AUTO_3757 - BLOCK
      ?AUTO_3756 - BLOCK
      ?AUTO_3755 - BLOCK
      ?AUTO_3761 - BLOCK
      ?AUTO_3762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3751 ) ( CLEAR ?AUTO_3760 ) ( ON ?AUTO_3753 ?AUTO_3752 ) ( ON ?AUTO_3758 ?AUTO_3753 ) ( ON ?AUTO_3757 ?AUTO_3758 ) ( CLEAR ?AUTO_3757 ) ( CLEAR ?AUTO_3756 ) ( ON ?AUTO_3755 ?AUTO_3751 ) ( ON ?AUTO_3761 ?AUTO_3755 ) ( CLEAR ?AUTO_3761 ) ( HOLDING ?AUTO_3762 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3762 )
      ( MAKE-ON ?AUTO_3751 ?AUTO_3752 )
      ( MAKE-ON-VERIFY ?AUTO_3751 ?AUTO_3752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3763 - BLOCK
      ?AUTO_3764 - BLOCK
    )
    :vars
    (
      ?AUTO_3766 - BLOCK
      ?AUTO_3765 - BLOCK
      ?AUTO_3771 - BLOCK
      ?AUTO_3773 - BLOCK
      ?AUTO_3768 - BLOCK
      ?AUTO_3772 - BLOCK
      ?AUTO_3767 - BLOCK
      ?AUTO_3774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3763 ) ( CLEAR ?AUTO_3766 ) ( ON ?AUTO_3765 ?AUTO_3764 ) ( ON ?AUTO_3771 ?AUTO_3765 ) ( ON ?AUTO_3773 ?AUTO_3771 ) ( CLEAR ?AUTO_3773 ) ( CLEAR ?AUTO_3768 ) ( ON ?AUTO_3772 ?AUTO_3763 ) ( ON ?AUTO_3767 ?AUTO_3772 ) ( ON ?AUTO_3774 ?AUTO_3767 ) ( CLEAR ?AUTO_3774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3774 ?AUTO_3767 )
      ( MAKE-ON ?AUTO_3763 ?AUTO_3764 )
      ( MAKE-ON-VERIFY ?AUTO_3763 ?AUTO_3764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3777 - BLOCK
      ?AUTO_3778 - BLOCK
    )
    :vars
    (
      ?AUTO_3782 - BLOCK
      ?AUTO_3780 - BLOCK
      ?AUTO_3781 - BLOCK
      ?AUTO_3783 - BLOCK
      ?AUTO_3785 - BLOCK
      ?AUTO_3784 - BLOCK
      ?AUTO_3788 - BLOCK
      ?AUTO_3786 - BLOCK
      ?AUTO_3789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3777 ) ( CLEAR ?AUTO_3782 ) ( ON ?AUTO_3780 ?AUTO_3778 ) ( ON ?AUTO_3781 ?AUTO_3780 ) ( ON ?AUTO_3783 ?AUTO_3781 ) ( CLEAR ?AUTO_3783 ) ( CLEAR ?AUTO_3785 ) ( ON ?AUTO_3784 ?AUTO_3777 ) ( ON ?AUTO_3788 ?AUTO_3784 ) ( ON ?AUTO_3786 ?AUTO_3788 ) ( CLEAR ?AUTO_3786 ) ( HOLDING ?AUTO_3789 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3789 )
      ( MAKE-ON ?AUTO_3777 ?AUTO_3778 )
      ( MAKE-ON-VERIFY ?AUTO_3777 ?AUTO_3778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3790 - BLOCK
      ?AUTO_3791 - BLOCK
    )
    :vars
    (
      ?AUTO_3800 - BLOCK
      ?AUTO_3795 - BLOCK
      ?AUTO_3801 - BLOCK
      ?AUTO_3802 - BLOCK
      ?AUTO_3794 - BLOCK
      ?AUTO_3797 - BLOCK
      ?AUTO_3793 - BLOCK
      ?AUTO_3792 - BLOCK
      ?AUTO_3798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3790 ) ( CLEAR ?AUTO_3800 ) ( ON ?AUTO_3795 ?AUTO_3791 ) ( ON ?AUTO_3801 ?AUTO_3795 ) ( ON ?AUTO_3802 ?AUTO_3801 ) ( CLEAR ?AUTO_3802 ) ( CLEAR ?AUTO_3794 ) ( ON ?AUTO_3797 ?AUTO_3790 ) ( ON ?AUTO_3793 ?AUTO_3797 ) ( ON ?AUTO_3792 ?AUTO_3793 ) ( ON ?AUTO_3798 ?AUTO_3792 ) ( CLEAR ?AUTO_3798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3798 ?AUTO_3792 )
      ( MAKE-ON ?AUTO_3790 ?AUTO_3791 )
      ( MAKE-ON-VERIFY ?AUTO_3790 ?AUTO_3791 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3804 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3804 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3804 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3804 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3806 - BLOCK
    )
    :vars
    (
      ?AUTO_3809 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3806 ?AUTO_3809 ) ( CLEAR ?AUTO_3806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3806 ?AUTO_3809 )
      ( MAKE-ON-TABLE ?AUTO_3806 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3806 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3811 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3811 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3811 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3811 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3813 - BLOCK
    )
    :vars
    (
      ?AUTO_3816 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3813 ?AUTO_3816 ) ( CLEAR ?AUTO_3813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3813 ?AUTO_3816 )
      ( MAKE-ON-TABLE ?AUTO_3813 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3813 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3817 - BLOCK
    )
    :vars
    (
      ?AUTO_3819 - BLOCK
      ?AUTO_3820 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3817 ?AUTO_3819 ) ( CLEAR ?AUTO_3817 ) ( HOLDING ?AUTO_3820 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3820 )
      ( MAKE-ON-TABLE ?AUTO_3817 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3817 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3823 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3823 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3823 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3823 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3825 - BLOCK
    )
    :vars
    (
      ?AUTO_3828 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3825 ?AUTO_3828 ) ( CLEAR ?AUTO_3825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3825 ?AUTO_3828 )
      ( MAKE-ON-TABLE ?AUTO_3825 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3825 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3829 - BLOCK
    )
    :vars
    (
      ?AUTO_3831 - BLOCK
      ?AUTO_3832 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3829 ?AUTO_3831 ) ( CLEAR ?AUTO_3829 ) ( HOLDING ?AUTO_3832 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3832 )
      ( MAKE-ON-TABLE ?AUTO_3829 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3829 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3833 - BLOCK
    )
    :vars
    (
      ?AUTO_3835 - BLOCK
      ?AUTO_3836 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3833 ?AUTO_3835 ) ( ON ?AUTO_3836 ?AUTO_3833 ) ( CLEAR ?AUTO_3836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3836 ?AUTO_3833 )
      ( MAKE-ON-TABLE ?AUTO_3833 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3833 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3839 - BLOCK
    )
    :vars
    (
      ?AUTO_3840 - BLOCK
      ?AUTO_3841 - BLOCK
      ?AUTO_3843 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3839 ?AUTO_3840 ) ( ON ?AUTO_3841 ?AUTO_3839 ) ( CLEAR ?AUTO_3841 ) ( HOLDING ?AUTO_3843 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3843 )
      ( MAKE-ON-TABLE ?AUTO_3839 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3847 - BLOCK
      ?AUTO_3848 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3847 ) ( CLEAR ?AUTO_3848 ) )
    :subtasks
    ( ( !STACK ?AUTO_3847 ?AUTO_3848 )
      ( MAKE-ON-VERIFY ?AUTO_3847 ?AUTO_3848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3851 - BLOCK
      ?AUTO_3852 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3852 ) ( ON-TABLE ?AUTO_3851 ) ( CLEAR ?AUTO_3851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3851 )
      ( MAKE-ON ?AUTO_3851 ?AUTO_3852 )
      ( MAKE-ON-VERIFY ?AUTO_3851 ?AUTO_3852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3856 - BLOCK
      ?AUTO_3857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3856 ) ( CLEAR ?AUTO_3856 ) ( HOLDING ?AUTO_3857 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3857 )
      ( MAKE-ON ?AUTO_3856 ?AUTO_3857 )
      ( MAKE-ON-VERIFY ?AUTO_3856 ?AUTO_3857 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3888 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3888 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3888 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3888 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3890 - BLOCK
    )
    :vars
    (
      ?AUTO_3893 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3890 ?AUTO_3893 ) ( CLEAR ?AUTO_3890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3890 ?AUTO_3893 )
      ( MAKE-ON-TABLE ?AUTO_3890 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3890 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3894 - BLOCK
    )
    :vars
    (
      ?AUTO_3896 - BLOCK
      ?AUTO_3897 - BLOCK
      ?AUTO_3898 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3894 ?AUTO_3896 ) ( CLEAR ?AUTO_3894 ) ( HOLDING ?AUTO_3897 ) ( CLEAR ?AUTO_3898 ) )
    :subtasks
    ( ( !STACK ?AUTO_3897 ?AUTO_3898 )
      ( MAKE-ON-TABLE ?AUTO_3894 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3894 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3901 - BLOCK
    )
    :vars
    (
      ?AUTO_3903 - BLOCK
      ?AUTO_3905 - BLOCK
      ?AUTO_3902 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3901 ?AUTO_3903 ) ( CLEAR ?AUTO_3905 ) ( ON ?AUTO_3902 ?AUTO_3901 ) ( CLEAR ?AUTO_3902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3902 ?AUTO_3901 )
      ( MAKE-ON-TABLE ?AUTO_3901 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3901 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3908 - BLOCK
    )
    :vars
    (
      ?AUTO_3910 - BLOCK
      ?AUTO_3912 - BLOCK
      ?AUTO_3911 - BLOCK
      ?AUTO_3913 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3908 ?AUTO_3910 ) ( CLEAR ?AUTO_3912 ) ( ON ?AUTO_3911 ?AUTO_3908 ) ( CLEAR ?AUTO_3911 ) ( HOLDING ?AUTO_3913 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3913 )
      ( MAKE-ON-TABLE ?AUTO_3908 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3908 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3914 - BLOCK
    )
    :vars
    (
      ?AUTO_3916 - BLOCK
      ?AUTO_3915 - BLOCK
      ?AUTO_3919 - BLOCK
      ?AUTO_3918 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3914 ?AUTO_3916 ) ( CLEAR ?AUTO_3915 ) ( ON ?AUTO_3919 ?AUTO_3914 ) ( ON ?AUTO_3918 ?AUTO_3919 ) ( CLEAR ?AUTO_3918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3918 ?AUTO_3919 )
      ( MAKE-ON-TABLE ?AUTO_3914 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3914 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3922 - BLOCK
    )
    :vars
    (
      ?AUTO_3925 - BLOCK
      ?AUTO_3923 - BLOCK
      ?AUTO_3927 - BLOCK
      ?AUTO_3926 - BLOCK
      ?AUTO_3928 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3922 ?AUTO_3925 ) ( CLEAR ?AUTO_3923 ) ( ON ?AUTO_3927 ?AUTO_3922 ) ( ON ?AUTO_3926 ?AUTO_3927 ) ( CLEAR ?AUTO_3926 ) ( HOLDING ?AUTO_3928 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3928 )
      ( MAKE-ON-TABLE ?AUTO_3922 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3922 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3931 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3931 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3931 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3931 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3933 - BLOCK
    )
    :vars
    (
      ?AUTO_3936 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3933 ?AUTO_3936 ) ( CLEAR ?AUTO_3933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3933 ?AUTO_3936 )
      ( MAKE-ON-TABLE ?AUTO_3933 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3933 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3937 - BLOCK
    )
    :vars
    (
      ?AUTO_3939 - BLOCK
      ?AUTO_3940 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3937 ?AUTO_3939 ) ( CLEAR ?AUTO_3937 ) ( HOLDING ?AUTO_3940 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3940 )
      ( MAKE-ON-TABLE ?AUTO_3937 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3937 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3941 - BLOCK
    )
    :vars
    (
      ?AUTO_3943 - BLOCK
      ?AUTO_3944 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3941 ?AUTO_3943 ) ( ON ?AUTO_3944 ?AUTO_3941 ) ( CLEAR ?AUTO_3944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3944 ?AUTO_3941 )
      ( MAKE-ON-TABLE ?AUTO_3941 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3941 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3947 - BLOCK
    )
    :vars
    (
      ?AUTO_3948 - BLOCK
      ?AUTO_3949 - BLOCK
      ?AUTO_3951 - BLOCK
      ?AUTO_3952 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3947 ?AUTO_3948 ) ( ON ?AUTO_3949 ?AUTO_3947 ) ( CLEAR ?AUTO_3949 ) ( HOLDING ?AUTO_3951 ) ( CLEAR ?AUTO_3952 ) )
    :subtasks
    ( ( !STACK ?AUTO_3951 ?AUTO_3952 )
      ( MAKE-ON-TABLE ?AUTO_3947 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3947 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3955 - BLOCK
    )
    :vars
    (
      ?AUTO_3958 - BLOCK
      ?AUTO_3957 - BLOCK
      ?AUTO_3959 - BLOCK
      ?AUTO_3960 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3955 ?AUTO_3958 ) ( ON ?AUTO_3957 ?AUTO_3955 ) ( CLEAR ?AUTO_3959 ) ( ON ?AUTO_3960 ?AUTO_3957 ) ( CLEAR ?AUTO_3960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3960 ?AUTO_3957 )
      ( MAKE-ON-TABLE ?AUTO_3955 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3955 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3963 - BLOCK
    )
    :vars
    (
      ?AUTO_3966 - BLOCK
      ?AUTO_3965 - BLOCK
      ?AUTO_3968 - BLOCK
      ?AUTO_3967 - BLOCK
      ?AUTO_3969 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3963 ?AUTO_3966 ) ( ON ?AUTO_3965 ?AUTO_3963 ) ( CLEAR ?AUTO_3968 ) ( ON ?AUTO_3967 ?AUTO_3965 ) ( CLEAR ?AUTO_3967 ) ( HOLDING ?AUTO_3969 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3969 )
      ( MAKE-ON-TABLE ?AUTO_3963 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3963 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3970 - BLOCK
    )
    :vars
    (
      ?AUTO_3971 - BLOCK
      ?AUTO_3973 - BLOCK
      ?AUTO_3972 - BLOCK
      ?AUTO_3976 - BLOCK
      ?AUTO_3975 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3970 ?AUTO_3971 ) ( ON ?AUTO_3973 ?AUTO_3970 ) ( CLEAR ?AUTO_3972 ) ( ON ?AUTO_3976 ?AUTO_3973 ) ( ON ?AUTO_3975 ?AUTO_3976 ) ( CLEAR ?AUTO_3975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3975 ?AUTO_3976 )
      ( MAKE-ON-TABLE ?AUTO_3970 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3970 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3979 - BLOCK
    )
    :vars
    (
      ?AUTO_3985 - BLOCK
      ?AUTO_3981 - BLOCK
      ?AUTO_3982 - BLOCK
      ?AUTO_3984 - BLOCK
      ?AUTO_3980 - BLOCK
      ?AUTO_3986 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3979 ?AUTO_3985 ) ( ON ?AUTO_3981 ?AUTO_3979 ) ( CLEAR ?AUTO_3982 ) ( ON ?AUTO_3984 ?AUTO_3981 ) ( ON ?AUTO_3980 ?AUTO_3984 ) ( CLEAR ?AUTO_3980 ) ( HOLDING ?AUTO_3986 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3986 )
      ( MAKE-ON-TABLE ?AUTO_3979 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3990 - BLOCK
      ?AUTO_3991 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3990 ) ( CLEAR ?AUTO_3991 ) )
    :subtasks
    ( ( !STACK ?AUTO_3990 ?AUTO_3991 )
      ( MAKE-ON-VERIFY ?AUTO_3990 ?AUTO_3991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3994 - BLOCK
      ?AUTO_3995 - BLOCK
    )
    :vars
    (
      ?AUTO_3999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3995 ) ( ON ?AUTO_3994 ?AUTO_3999 ) ( CLEAR ?AUTO_3994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3994 ?AUTO_3999 )
      ( MAKE-ON ?AUTO_3994 ?AUTO_3995 )
      ( MAKE-ON-VERIFY ?AUTO_3994 ?AUTO_3995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4000 - BLOCK
      ?AUTO_4001 - BLOCK
    )
    :vars
    (
      ?AUTO_4004 - BLOCK
      ?AUTO_4005 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4001 ) ( ON ?AUTO_4000 ?AUTO_4004 ) ( CLEAR ?AUTO_4000 ) ( HOLDING ?AUTO_4005 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4005 )
      ( MAKE-ON ?AUTO_4000 ?AUTO_4001 )
      ( MAKE-ON-VERIFY ?AUTO_4000 ?AUTO_4001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4006 - BLOCK
      ?AUTO_4007 - BLOCK
    )
    :vars
    (
      ?AUTO_4010 - BLOCK
      ?AUTO_4011 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4006 ?AUTO_4010 ) ( CLEAR ?AUTO_4006 ) ( ON ?AUTO_4011 ?AUTO_4007 ) ( CLEAR ?AUTO_4011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4011 ?AUTO_4007 )
      ( MAKE-ON ?AUTO_4006 ?AUTO_4007 )
      ( MAKE-ON-VERIFY ?AUTO_4006 ?AUTO_4007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4014 - BLOCK
      ?AUTO_4015 - BLOCK
    )
    :vars
    (
      ?AUTO_4019 - BLOCK
      ?AUTO_4016 - BLOCK
      ?AUTO_4020 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4014 ?AUTO_4019 ) ( CLEAR ?AUTO_4014 ) ( ON ?AUTO_4016 ?AUTO_4015 ) ( CLEAR ?AUTO_4016 ) ( HOLDING ?AUTO_4020 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4020 )
      ( MAKE-ON ?AUTO_4014 ?AUTO_4015 )
      ( MAKE-ON-VERIFY ?AUTO_4014 ?AUTO_4015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4021 - BLOCK
      ?AUTO_4022 - BLOCK
    )
    :vars
    (
      ?AUTO_4026 - BLOCK
      ?AUTO_4023 - BLOCK
      ?AUTO_4027 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4021 ?AUTO_4026 ) ( CLEAR ?AUTO_4021 ) ( ON ?AUTO_4023 ?AUTO_4022 ) ( ON ?AUTO_4027 ?AUTO_4023 ) ( CLEAR ?AUTO_4027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4027 ?AUTO_4023 )
      ( MAKE-ON ?AUTO_4021 ?AUTO_4022 )
      ( MAKE-ON-VERIFY ?AUTO_4021 ?AUTO_4022 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4030 - BLOCK
      ?AUTO_4031 - BLOCK
    )
    :vars
    (
      ?AUTO_4036 - BLOCK
      ?AUTO_4033 - BLOCK
      ?AUTO_4034 - BLOCK
      ?AUTO_4037 - BLOCK
      ?AUTO_4038 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4030 ?AUTO_4036 ) ( CLEAR ?AUTO_4030 ) ( ON ?AUTO_4033 ?AUTO_4031 ) ( ON ?AUTO_4034 ?AUTO_4033 ) ( CLEAR ?AUTO_4034 ) ( HOLDING ?AUTO_4037 ) ( CLEAR ?AUTO_4038 ) )
    :subtasks
    ( ( !STACK ?AUTO_4037 ?AUTO_4038 )
      ( MAKE-ON ?AUTO_4030 ?AUTO_4031 )
      ( MAKE-ON-VERIFY ?AUTO_4030 ?AUTO_4031 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4043 - BLOCK
      ?AUTO_4044 - BLOCK
    )
    :vars
    (
      ?AUTO_4046 - BLOCK
      ?AUTO_4050 - BLOCK
      ?AUTO_4051 - BLOCK
      ?AUTO_4045 - BLOCK
      ?AUTO_4049 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4043 ?AUTO_4046 ) ( CLEAR ?AUTO_4043 ) ( ON ?AUTO_4050 ?AUTO_4044 ) ( ON ?AUTO_4051 ?AUTO_4050 ) ( CLEAR ?AUTO_4045 ) ( ON ?AUTO_4049 ?AUTO_4051 ) ( CLEAR ?AUTO_4049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4049 ?AUTO_4051 )
      ( MAKE-ON ?AUTO_4043 ?AUTO_4044 )
      ( MAKE-ON-VERIFY ?AUTO_4043 ?AUTO_4044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4054 - BLOCK
      ?AUTO_4055 - BLOCK
    )
    :vars
    (
      ?AUTO_4059 - BLOCK
      ?AUTO_4060 - BLOCK
      ?AUTO_4061 - BLOCK
      ?AUTO_4058 - BLOCK
      ?AUTO_4062 - BLOCK
      ?AUTO_4063 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4054 ?AUTO_4059 ) ( CLEAR ?AUTO_4054 ) ( ON ?AUTO_4060 ?AUTO_4055 ) ( ON ?AUTO_4061 ?AUTO_4060 ) ( CLEAR ?AUTO_4058 ) ( ON ?AUTO_4062 ?AUTO_4061 ) ( CLEAR ?AUTO_4062 ) ( HOLDING ?AUTO_4063 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4063 )
      ( MAKE-ON ?AUTO_4054 ?AUTO_4055 )
      ( MAKE-ON-VERIFY ?AUTO_4054 ?AUTO_4055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4064 - BLOCK
      ?AUTO_4065 - BLOCK
    )
    :vars
    (
      ?AUTO_4066 - BLOCK
      ?AUTO_4067 - BLOCK
      ?AUTO_4069 - BLOCK
      ?AUTO_4072 - BLOCK
      ?AUTO_4068 - BLOCK
      ?AUTO_4073 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4064 ?AUTO_4066 ) ( CLEAR ?AUTO_4064 ) ( ON ?AUTO_4067 ?AUTO_4065 ) ( ON ?AUTO_4069 ?AUTO_4067 ) ( CLEAR ?AUTO_4072 ) ( ON ?AUTO_4068 ?AUTO_4069 ) ( ON ?AUTO_4073 ?AUTO_4068 ) ( CLEAR ?AUTO_4073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4073 ?AUTO_4068 )
      ( MAKE-ON ?AUTO_4064 ?AUTO_4065 )
      ( MAKE-ON-VERIFY ?AUTO_4064 ?AUTO_4065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4076 - BLOCK
      ?AUTO_4077 - BLOCK
    )
    :vars
    (
      ?AUTO_4079 - BLOCK
      ?AUTO_4082 - BLOCK
      ?AUTO_4084 - BLOCK
      ?AUTO_4081 - BLOCK
      ?AUTO_4085 - BLOCK
      ?AUTO_4080 - BLOCK
      ?AUTO_4086 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4076 ?AUTO_4079 ) ( CLEAR ?AUTO_4076 ) ( ON ?AUTO_4082 ?AUTO_4077 ) ( ON ?AUTO_4084 ?AUTO_4082 ) ( CLEAR ?AUTO_4081 ) ( ON ?AUTO_4085 ?AUTO_4084 ) ( ON ?AUTO_4080 ?AUTO_4085 ) ( CLEAR ?AUTO_4080 ) ( HOLDING ?AUTO_4086 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4086 )
      ( MAKE-ON ?AUTO_4076 ?AUTO_4077 )
      ( MAKE-ON-VERIFY ?AUTO_4076 ?AUTO_4077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4089 - BLOCK
      ?AUTO_4088 - BLOCK
    )
    :vars
    (
      ?AUTO_4096 - BLOCK
      ?AUTO_4097 - BLOCK
      ?AUTO_4090 - BLOCK
      ?AUTO_4091 - BLOCK
      ?AUTO_4092 - BLOCK
      ?AUTO_4093 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4089 ?AUTO_4096 ) ( ON ?AUTO_4097 ?AUTO_4088 ) ( ON ?AUTO_4090 ?AUTO_4097 ) ( ON ?AUTO_4091 ?AUTO_4090 ) ( ON ?AUTO_4092 ?AUTO_4091 ) ( CLEAR ?AUTO_4092 ) ( ON ?AUTO_4093 ?AUTO_4089 ) ( CLEAR ?AUTO_4093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4093 ?AUTO_4089 )
      ( MAKE-ON ?AUTO_4089 ?AUTO_4088 )
      ( MAKE-ON-VERIFY ?AUTO_4089 ?AUTO_4088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4102 - BLOCK
      ?AUTO_4103 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4102 ) ( CLEAR ?AUTO_4103 ) )
    :subtasks
    ( ( !STACK ?AUTO_4102 ?AUTO_4103 )
      ( MAKE-ON-VERIFY ?AUTO_4102 ?AUTO_4103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4106 - BLOCK
      ?AUTO_4107 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4107 ) ( ON-TABLE ?AUTO_4106 ) ( CLEAR ?AUTO_4106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4106 )
      ( MAKE-ON ?AUTO_4106 ?AUTO_4107 )
      ( MAKE-ON-VERIFY ?AUTO_4106 ?AUTO_4107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4111 - BLOCK
      ?AUTO_4112 - BLOCK
    )
    :vars
    (
      ?AUTO_4116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4111 ) ( CLEAR ?AUTO_4111 ) ( HOLDING ?AUTO_4112 ) ( CLEAR ?AUTO_4116 ) )
    :subtasks
    ( ( !STACK ?AUTO_4112 ?AUTO_4116 )
      ( MAKE-ON ?AUTO_4111 ?AUTO_4112 )
      ( MAKE-ON-VERIFY ?AUTO_4111 ?AUTO_4112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4125 - BLOCK
      ?AUTO_4126 - BLOCK
    )
    :vars
    (
      ?AUTO_4130 - BLOCK
      ?AUTO_4127 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4126 ) ( ON ?AUTO_4125 ?AUTO_4130 ) ( ON ?AUTO_4127 ?AUTO_4125 ) ( CLEAR ?AUTO_4127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4127 ?AUTO_4125 )
      ( MAKE-ON ?AUTO_4125 ?AUTO_4126 )
      ( MAKE-ON-VERIFY ?AUTO_4125 ?AUTO_4126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4133 - BLOCK
      ?AUTO_4134 - BLOCK
    )
    :vars
    (
      ?AUTO_4138 - BLOCK
      ?AUTO_4137 - BLOCK
      ?AUTO_4139 - BLOCK
      ?AUTO_4140 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4134 ) ( ON ?AUTO_4133 ?AUTO_4138 ) ( ON ?AUTO_4137 ?AUTO_4133 ) ( CLEAR ?AUTO_4137 ) ( HOLDING ?AUTO_4139 ) ( CLEAR ?AUTO_4140 ) )
    :subtasks
    ( ( !STACK ?AUTO_4139 ?AUTO_4140 )
      ( MAKE-ON ?AUTO_4133 ?AUTO_4134 )
      ( MAKE-ON-VERIFY ?AUTO_4133 ?AUTO_4134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4145 - BLOCK
      ?AUTO_4146 - BLOCK
    )
    :vars
    (
      ?AUTO_4147 - BLOCK
      ?AUTO_4148 - BLOCK
      ?AUTO_4152 - BLOCK
      ?AUTO_4149 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4146 ) ( ON ?AUTO_4145 ?AUTO_4147 ) ( ON ?AUTO_4148 ?AUTO_4145 ) ( CLEAR ?AUTO_4152 ) ( ON ?AUTO_4149 ?AUTO_4148 ) ( CLEAR ?AUTO_4149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4149 ?AUTO_4148 )
      ( MAKE-ON ?AUTO_4145 ?AUTO_4146 )
      ( MAKE-ON-VERIFY ?AUTO_4145 ?AUTO_4146 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4155 - BLOCK
      ?AUTO_4156 - BLOCK
    )
    :vars
    (
      ?AUTO_4159 - BLOCK
      ?AUTO_4160 - BLOCK
      ?AUTO_4161 - BLOCK
      ?AUTO_4162 - BLOCK
      ?AUTO_4163 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4156 ) ( ON ?AUTO_4155 ?AUTO_4159 ) ( ON ?AUTO_4160 ?AUTO_4155 ) ( CLEAR ?AUTO_4161 ) ( ON ?AUTO_4162 ?AUTO_4160 ) ( CLEAR ?AUTO_4162 ) ( HOLDING ?AUTO_4163 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4163 )
      ( MAKE-ON ?AUTO_4155 ?AUTO_4156 )
      ( MAKE-ON-VERIFY ?AUTO_4155 ?AUTO_4156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4164 - BLOCK
      ?AUTO_4165 - BLOCK
    )
    :vars
    (
      ?AUTO_4172 - BLOCK
      ?AUTO_4166 - BLOCK
      ?AUTO_4167 - BLOCK
      ?AUTO_4168 - BLOCK
      ?AUTO_4171 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4165 ) ( ON ?AUTO_4164 ?AUTO_4172 ) ( ON ?AUTO_4166 ?AUTO_4164 ) ( CLEAR ?AUTO_4167 ) ( ON ?AUTO_4168 ?AUTO_4166 ) ( ON ?AUTO_4171 ?AUTO_4168 ) ( CLEAR ?AUTO_4171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4171 ?AUTO_4168 )
      ( MAKE-ON ?AUTO_4164 ?AUTO_4165 )
      ( MAKE-ON-VERIFY ?AUTO_4164 ?AUTO_4165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4175 - BLOCK
      ?AUTO_4176 - BLOCK
    )
    :vars
    (
      ?AUTO_4183 - BLOCK
      ?AUTO_4180 - BLOCK
      ?AUTO_4179 - BLOCK
      ?AUTO_4182 - BLOCK
      ?AUTO_4181 - BLOCK
      ?AUTO_4184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4176 ) ( ON ?AUTO_4175 ?AUTO_4183 ) ( ON ?AUTO_4180 ?AUTO_4175 ) ( CLEAR ?AUTO_4179 ) ( ON ?AUTO_4182 ?AUTO_4180 ) ( ON ?AUTO_4181 ?AUTO_4182 ) ( CLEAR ?AUTO_4181 ) ( HOLDING ?AUTO_4184 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4184 )
      ( MAKE-ON ?AUTO_4175 ?AUTO_4176 )
      ( MAKE-ON-VERIFY ?AUTO_4175 ?AUTO_4176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4185 - BLOCK
      ?AUTO_4188 - BLOCK
    )
    :vars
    (
      ?AUTO_4193 - BLOCK
      ?AUTO_4192 - BLOCK
      ?AUTO_4189 - BLOCK
      ?AUTO_4187 - BLOCK
      ?AUTO_4194 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4185 ?AUTO_4193 ) ( ON ?AUTO_4192 ?AUTO_4185 ) ( ON ?AUTO_4189 ?AUTO_4192 ) ( ON ?AUTO_4187 ?AUTO_4189 ) ( CLEAR ?AUTO_4187 ) ( ON ?AUTO_4194 ?AUTO_4188 ) ( CLEAR ?AUTO_4194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4194 ?AUTO_4188 )
      ( MAKE-ON ?AUTO_4185 ?AUTO_4188 )
      ( MAKE-ON-VERIFY ?AUTO_4185 ?AUTO_4188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4199 - BLOCK
      ?AUTO_4200 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4199 ) ( CLEAR ?AUTO_4200 ) )
    :subtasks
    ( ( !STACK ?AUTO_4199 ?AUTO_4200 )
      ( MAKE-ON-VERIFY ?AUTO_4199 ?AUTO_4200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4203 - BLOCK
      ?AUTO_4204 - BLOCK
    )
    :vars
    (
      ?AUTO_4208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4204 ) ( ON ?AUTO_4203 ?AUTO_4208 ) ( CLEAR ?AUTO_4203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4203 ?AUTO_4208 )
      ( MAKE-ON ?AUTO_4203 ?AUTO_4204 )
      ( MAKE-ON-VERIFY ?AUTO_4203 ?AUTO_4204 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4209 - BLOCK
      ?AUTO_4210 - BLOCK
    )
    :vars
    (
      ?AUTO_4213 - BLOCK
      ?AUTO_4215 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4209 ?AUTO_4213 ) ( CLEAR ?AUTO_4209 ) ( HOLDING ?AUTO_4210 ) ( CLEAR ?AUTO_4215 ) )
    :subtasks
    ( ( !STACK ?AUTO_4210 ?AUTO_4215 )
      ( MAKE-ON ?AUTO_4209 ?AUTO_4210 )
      ( MAKE-ON-VERIFY ?AUTO_4209 ?AUTO_4210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4218 - BLOCK
      ?AUTO_4219 - BLOCK
    )
    :vars
    (
      ?AUTO_4222 - BLOCK
      ?AUTO_4223 - BLOCK
      ?AUTO_4224 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4219 ) ( ON ?AUTO_4218 ?AUTO_4222 ) ( CLEAR ?AUTO_4218 ) ( HOLDING ?AUTO_4223 ) ( CLEAR ?AUTO_4224 ) )
    :subtasks
    ( ( !STACK ?AUTO_4223 ?AUTO_4224 )
      ( MAKE-ON ?AUTO_4218 ?AUTO_4219 )
      ( MAKE-ON-VERIFY ?AUTO_4218 ?AUTO_4219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4225 - BLOCK
      ?AUTO_4226 - BLOCK
    )
    :vars
    (
      ?AUTO_4228 - BLOCK
      ?AUTO_4231 - BLOCK
      ?AUTO_4230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4226 ) ( ON ?AUTO_4225 ?AUTO_4228 ) ( CLEAR ?AUTO_4231 ) ( ON ?AUTO_4230 ?AUTO_4225 ) ( CLEAR ?AUTO_4230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4230 ?AUTO_4225 )
      ( MAKE-ON ?AUTO_4225 ?AUTO_4226 )
      ( MAKE-ON-VERIFY ?AUTO_4225 ?AUTO_4226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4234 - BLOCK
      ?AUTO_4235 - BLOCK
    )
    :vars
    (
      ?AUTO_4239 - BLOCK
      ?AUTO_4236 - BLOCK
      ?AUTO_4240 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4234 ?AUTO_4239 ) ( CLEAR ?AUTO_4236 ) ( ON ?AUTO_4240 ?AUTO_4234 ) ( CLEAR ?AUTO_4240 ) ( HOLDING ?AUTO_4235 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4235 )
      ( MAKE-ON ?AUTO_4234 ?AUTO_4235 )
      ( MAKE-ON-VERIFY ?AUTO_4234 ?AUTO_4235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4244 - BLOCK
      ?AUTO_4245 - BLOCK
    )
    :vars
    (
      ?AUTO_4249 - BLOCK
      ?AUTO_4247 - BLOCK
      ?AUTO_4250 - BLOCK
      ?AUTO_4251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4245 ) ( ON ?AUTO_4244 ?AUTO_4249 ) ( CLEAR ?AUTO_4247 ) ( ON ?AUTO_4250 ?AUTO_4244 ) ( CLEAR ?AUTO_4250 ) ( HOLDING ?AUTO_4251 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4251 )
      ( MAKE-ON ?AUTO_4244 ?AUTO_4245 )
      ( MAKE-ON-VERIFY ?AUTO_4244 ?AUTO_4245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4252 - BLOCK
      ?AUTO_4253 - BLOCK
    )
    :vars
    (
      ?AUTO_4259 - BLOCK
      ?AUTO_4257 - BLOCK
      ?AUTO_4258 - BLOCK
      ?AUTO_4255 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4252 ?AUTO_4259 ) ( CLEAR ?AUTO_4257 ) ( ON ?AUTO_4258 ?AUTO_4252 ) ( CLEAR ?AUTO_4258 ) ( ON ?AUTO_4255 ?AUTO_4253 ) ( CLEAR ?AUTO_4255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4255 ?AUTO_4253 )
      ( MAKE-ON ?AUTO_4252 ?AUTO_4253 )
      ( MAKE-ON-VERIFY ?AUTO_4252 ?AUTO_4253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4262 - BLOCK
      ?AUTO_4263 - BLOCK
    )
    :vars
    (
      ?AUTO_4264 - BLOCK
      ?AUTO_4268 - BLOCK
      ?AUTO_4267 - BLOCK
      ?AUTO_4265 - BLOCK
      ?AUTO_4270 - BLOCK
      ?AUTO_4271 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4262 ?AUTO_4264 ) ( CLEAR ?AUTO_4268 ) ( ON ?AUTO_4267 ?AUTO_4262 ) ( CLEAR ?AUTO_4267 ) ( ON ?AUTO_4265 ?AUTO_4263 ) ( CLEAR ?AUTO_4265 ) ( HOLDING ?AUTO_4270 ) ( CLEAR ?AUTO_4271 ) )
    :subtasks
    ( ( !STACK ?AUTO_4270 ?AUTO_4271 )
      ( MAKE-ON ?AUTO_4262 ?AUTO_4263 )
      ( MAKE-ON-VERIFY ?AUTO_4262 ?AUTO_4263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4276 - BLOCK
      ?AUTO_4277 - BLOCK
    )
    :vars
    (
      ?AUTO_4284 - BLOCK
      ?AUTO_4285 - BLOCK
      ?AUTO_4283 - BLOCK
      ?AUTO_4281 - BLOCK
      ?AUTO_4280 - BLOCK
      ?AUTO_4278 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4276 ?AUTO_4284 ) ( CLEAR ?AUTO_4285 ) ( ON ?AUTO_4283 ?AUTO_4276 ) ( CLEAR ?AUTO_4283 ) ( ON ?AUTO_4281 ?AUTO_4277 ) ( CLEAR ?AUTO_4280 ) ( ON ?AUTO_4278 ?AUTO_4281 ) ( CLEAR ?AUTO_4278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4278 ?AUTO_4281 )
      ( MAKE-ON ?AUTO_4276 ?AUTO_4277 )
      ( MAKE-ON-VERIFY ?AUTO_4276 ?AUTO_4277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4288 - BLOCK
      ?AUTO_4289 - BLOCK
    )
    :vars
    (
      ?AUTO_4292 - BLOCK
      ?AUTO_4297 - BLOCK
      ?AUTO_4294 - BLOCK
      ?AUTO_4295 - BLOCK
      ?AUTO_4293 - BLOCK
      ?AUTO_4296 - BLOCK
      ?AUTO_4298 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4288 ?AUTO_4292 ) ( CLEAR ?AUTO_4297 ) ( ON ?AUTO_4294 ?AUTO_4288 ) ( CLEAR ?AUTO_4294 ) ( ON ?AUTO_4295 ?AUTO_4289 ) ( CLEAR ?AUTO_4293 ) ( ON ?AUTO_4296 ?AUTO_4295 ) ( CLEAR ?AUTO_4296 ) ( HOLDING ?AUTO_4298 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4298 )
      ( MAKE-ON ?AUTO_4288 ?AUTO_4289 )
      ( MAKE-ON-VERIFY ?AUTO_4288 ?AUTO_4289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4299 - BLOCK
      ?AUTO_4300 - BLOCK
    )
    :vars
    (
      ?AUTO_4302 - BLOCK
      ?AUTO_4308 - BLOCK
      ?AUTO_4301 - BLOCK
      ?AUTO_4306 - BLOCK
      ?AUTO_4305 - BLOCK
      ?AUTO_4307 - BLOCK
      ?AUTO_4309 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4299 ?AUTO_4302 ) ( CLEAR ?AUTO_4308 ) ( ON ?AUTO_4301 ?AUTO_4299 ) ( CLEAR ?AUTO_4301 ) ( ON ?AUTO_4306 ?AUTO_4300 ) ( CLEAR ?AUTO_4305 ) ( ON ?AUTO_4307 ?AUTO_4306 ) ( ON ?AUTO_4309 ?AUTO_4307 ) ( CLEAR ?AUTO_4309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4309 ?AUTO_4307 )
      ( MAKE-ON ?AUTO_4299 ?AUTO_4300 )
      ( MAKE-ON-VERIFY ?AUTO_4299 ?AUTO_4300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4312 - BLOCK
      ?AUTO_4313 - BLOCK
    )
    :vars
    (
      ?AUTO_4315 - BLOCK
      ?AUTO_4321 - BLOCK
      ?AUTO_4322 - BLOCK
      ?AUTO_4317 - BLOCK
      ?AUTO_4316 - BLOCK
      ?AUTO_4318 - BLOCK
      ?AUTO_4320 - BLOCK
      ?AUTO_4323 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4312 ?AUTO_4315 ) ( CLEAR ?AUTO_4321 ) ( ON ?AUTO_4322 ?AUTO_4312 ) ( CLEAR ?AUTO_4322 ) ( ON ?AUTO_4317 ?AUTO_4313 ) ( CLEAR ?AUTO_4316 ) ( ON ?AUTO_4318 ?AUTO_4317 ) ( ON ?AUTO_4320 ?AUTO_4318 ) ( CLEAR ?AUTO_4320 ) ( HOLDING ?AUTO_4323 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4323 )
      ( MAKE-ON ?AUTO_4312 ?AUTO_4313 )
      ( MAKE-ON-VERIFY ?AUTO_4312 ?AUTO_4313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4324 - BLOCK
      ?AUTO_4325 - BLOCK
    )
    :vars
    (
      ?AUTO_4326 - BLOCK
      ?AUTO_4335 - BLOCK
      ?AUTO_4334 - BLOCK
      ?AUTO_4328 - BLOCK
      ?AUTO_4329 - BLOCK
      ?AUTO_4331 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4324 ?AUTO_4326 ) ( ON ?AUTO_4335 ?AUTO_4324 ) ( ON ?AUTO_4334 ?AUTO_4325 ) ( ON ?AUTO_4328 ?AUTO_4334 ) ( ON ?AUTO_4329 ?AUTO_4328 ) ( CLEAR ?AUTO_4329 ) ( ON ?AUTO_4331 ?AUTO_4335 ) ( CLEAR ?AUTO_4331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4331 ?AUTO_4335 )
      ( MAKE-ON ?AUTO_4324 ?AUTO_4325 )
      ( MAKE-ON-VERIFY ?AUTO_4324 ?AUTO_4325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4340 - BLOCK
      ?AUTO_4341 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4340 ) ( CLEAR ?AUTO_4341 ) )
    :subtasks
    ( ( !STACK ?AUTO_4340 ?AUTO_4341 )
      ( MAKE-ON-VERIFY ?AUTO_4340 ?AUTO_4341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4344 - BLOCK
      ?AUTO_4345 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4345 ) ( ON-TABLE ?AUTO_4344 ) ( CLEAR ?AUTO_4344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4344 )
      ( MAKE-ON ?AUTO_4344 ?AUTO_4345 )
      ( MAKE-ON-VERIFY ?AUTO_4344 ?AUTO_4345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4349 - BLOCK
      ?AUTO_4350 - BLOCK
    )
    :vars
    (
      ?AUTO_4353 - BLOCK
      ?AUTO_4354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4350 ) ( ON-TABLE ?AUTO_4349 ) ( CLEAR ?AUTO_4349 ) ( HOLDING ?AUTO_4353 ) ( CLEAR ?AUTO_4354 ) )
    :subtasks
    ( ( !STACK ?AUTO_4353 ?AUTO_4354 )
      ( MAKE-ON ?AUTO_4349 ?AUTO_4350 )
      ( MAKE-ON-VERIFY ?AUTO_4349 ?AUTO_4350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4355 - BLOCK
      ?AUTO_4356 - BLOCK
    )
    :vars
    (
      ?AUTO_4358 - BLOCK
      ?AUTO_4360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4356 ) ( ON-TABLE ?AUTO_4355 ) ( CLEAR ?AUTO_4358 ) ( ON ?AUTO_4360 ?AUTO_4355 ) ( CLEAR ?AUTO_4360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4360 ?AUTO_4355 )
      ( MAKE-ON ?AUTO_4355 ?AUTO_4356 )
      ( MAKE-ON-VERIFY ?AUTO_4355 ?AUTO_4356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4363 - BLOCK
      ?AUTO_4364 - BLOCK
    )
    :vars
    (
      ?AUTO_4368 - BLOCK
      ?AUTO_4367 - BLOCK
      ?AUTO_4370 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4364 ) ( ON-TABLE ?AUTO_4363 ) ( ON ?AUTO_4368 ?AUTO_4363 ) ( CLEAR ?AUTO_4368 ) ( HOLDING ?AUTO_4367 ) ( CLEAR ?AUTO_4370 ) )
    :subtasks
    ( ( !STACK ?AUTO_4367 ?AUTO_4370 )
      ( MAKE-ON ?AUTO_4363 ?AUTO_4364 )
      ( MAKE-ON-VERIFY ?AUTO_4363 ?AUTO_4364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4375 - BLOCK
      ?AUTO_4376 - BLOCK
    )
    :vars
    (
      ?AUTO_4378 - BLOCK
      ?AUTO_4381 - BLOCK
      ?AUTO_4379 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4376 ) ( ON-TABLE ?AUTO_4375 ) ( ON ?AUTO_4378 ?AUTO_4375 ) ( CLEAR ?AUTO_4381 ) ( ON ?AUTO_4379 ?AUTO_4378 ) ( CLEAR ?AUTO_4379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4379 ?AUTO_4378 )
      ( MAKE-ON ?AUTO_4375 ?AUTO_4376 )
      ( MAKE-ON-VERIFY ?AUTO_4375 ?AUTO_4376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4384 - BLOCK
      ?AUTO_4385 - BLOCK
    )
    :vars
    (
      ?AUTO_4388 - BLOCK
      ?AUTO_4389 - BLOCK
      ?AUTO_4390 - BLOCK
      ?AUTO_4391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4385 ) ( ON-TABLE ?AUTO_4384 ) ( ON ?AUTO_4388 ?AUTO_4384 ) ( CLEAR ?AUTO_4389 ) ( ON ?AUTO_4390 ?AUTO_4388 ) ( CLEAR ?AUTO_4390 ) ( HOLDING ?AUTO_4391 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4391 )
      ( MAKE-ON ?AUTO_4384 ?AUTO_4385 )
      ( MAKE-ON-VERIFY ?AUTO_4384 ?AUTO_4385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4398 - BLOCK
      ?AUTO_4399 - BLOCK
    )
    :vars
    (
      ?AUTO_4404 - BLOCK
      ?AUTO_4402 - BLOCK
      ?AUTO_4401 - BLOCK
      ?AUTO_4406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4398 ) ( ON ?AUTO_4404 ?AUTO_4398 ) ( CLEAR ?AUTO_4402 ) ( ON ?AUTO_4401 ?AUTO_4404 ) ( CLEAR ?AUTO_4401 ) ( HOLDING ?AUTO_4399 ) ( CLEAR ?AUTO_4406 ) )
    :subtasks
    ( ( !STACK ?AUTO_4399 ?AUTO_4406 )
      ( MAKE-ON ?AUTO_4398 ?AUTO_4399 )
      ( MAKE-ON-VERIFY ?AUTO_4398 ?AUTO_4399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4419 - BLOCK
      ?AUTO_4420 - BLOCK
    )
    :vars
    (
      ?AUTO_4421 - BLOCK
      ?AUTO_4426 - BLOCK
      ?AUTO_4424 - BLOCK
      ?AUTO_4422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4420 ) ( ON-TABLE ?AUTO_4419 ) ( ON ?AUTO_4421 ?AUTO_4419 ) ( CLEAR ?AUTO_4426 ) ( ON ?AUTO_4424 ?AUTO_4421 ) ( ON ?AUTO_4422 ?AUTO_4424 ) ( CLEAR ?AUTO_4422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4422 ?AUTO_4424 )
      ( MAKE-ON ?AUTO_4419 ?AUTO_4420 )
      ( MAKE-ON-VERIFY ?AUTO_4419 ?AUTO_4420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4431 - BLOCK
      ?AUTO_4432 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4431 ) ( CLEAR ?AUTO_4432 ) )
    :subtasks
    ( ( !STACK ?AUTO_4431 ?AUTO_4432 )
      ( MAKE-ON-VERIFY ?AUTO_4431 ?AUTO_4432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4435 - BLOCK
      ?AUTO_4436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4436 ) ( ON-TABLE ?AUTO_4435 ) ( CLEAR ?AUTO_4435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4435 )
      ( MAKE-ON ?AUTO_4435 ?AUTO_4436 )
      ( MAKE-ON-VERIFY ?AUTO_4435 ?AUTO_4436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4440 - BLOCK
      ?AUTO_4441 - BLOCK
    )
    :vars
    (
      ?AUTO_4444 - BLOCK
      ?AUTO_4445 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4441 ) ( ON-TABLE ?AUTO_4440 ) ( CLEAR ?AUTO_4440 ) ( HOLDING ?AUTO_4444 ) ( CLEAR ?AUTO_4445 ) )
    :subtasks
    ( ( !STACK ?AUTO_4444 ?AUTO_4445 )
      ( MAKE-ON ?AUTO_4440 ?AUTO_4441 )
      ( MAKE-ON-VERIFY ?AUTO_4440 ?AUTO_4441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4448 - BLOCK
      ?AUTO_4449 - BLOCK
    )
    :vars
    (
      ?AUTO_4453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4448 ) ( CLEAR ?AUTO_4448 ) ( HOLDING ?AUTO_4449 ) ( CLEAR ?AUTO_4453 ) )
    :subtasks
    ( ( !STACK ?AUTO_4449 ?AUTO_4453 )
      ( MAKE-ON ?AUTO_4448 ?AUTO_4449 )
      ( MAKE-ON-VERIFY ?AUTO_4448 ?AUTO_4449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4462 - BLOCK
      ?AUTO_4463 - BLOCK
    )
    :vars
    (
      ?AUTO_4467 - BLOCK
      ?AUTO_4466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4462 ) ( CLEAR ?AUTO_4462 ) ( CLEAR ?AUTO_4467 ) ( ON ?AUTO_4466 ?AUTO_4463 ) ( CLEAR ?AUTO_4466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4466 ?AUTO_4463 )
      ( MAKE-ON ?AUTO_4462 ?AUTO_4463 )
      ( MAKE-ON-VERIFY ?AUTO_4462 ?AUTO_4463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4470 - BLOCK
      ?AUTO_4471 - BLOCK
    )
    :vars
    (
      ?AUTO_4475 - BLOCK
      ?AUTO_4474 - BLOCK
      ?AUTO_4476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4470 ) ( CLEAR ?AUTO_4470 ) ( CLEAR ?AUTO_4475 ) ( ON ?AUTO_4474 ?AUTO_4471 ) ( CLEAR ?AUTO_4474 ) ( HOLDING ?AUTO_4476 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4476 )
      ( MAKE-ON ?AUTO_4470 ?AUTO_4471 )
      ( MAKE-ON-VERIFY ?AUTO_4470 ?AUTO_4471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4479 - BLOCK
      ?AUTO_4480 - BLOCK
    )
    :vars
    (
      ?AUTO_4483 - BLOCK
      ?AUTO_4482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4483 ) ( ON ?AUTO_4482 ?AUTO_4480 ) ( CLEAR ?AUTO_4482 ) ( HOLDING ?AUTO_4479 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4479 )
      ( MAKE-ON ?AUTO_4479 ?AUTO_4480 )
      ( MAKE-ON-VERIFY ?AUTO_4479 ?AUTO_4480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4498 - BLOCK
      ?AUTO_4499 - BLOCK
    )
    :vars
    (
      ?AUTO_4503 - BLOCK
      ?AUTO_4504 - BLOCK
      ?AUTO_4500 - BLOCK
      ?AUTO_4502 - BLOCK
      ?AUTO_4506 - BLOCK
      ?AUTO_4505 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4498 ?AUTO_4503 ) ( CLEAR ?AUTO_4504 ) ( ON ?AUTO_4500 ?AUTO_4498 ) ( ON ?AUTO_4502 ?AUTO_4499 ) ( CLEAR ?AUTO_4502 ) ( CLEAR ?AUTO_4506 ) ( ON ?AUTO_4505 ?AUTO_4500 ) ( CLEAR ?AUTO_4505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4505 ?AUTO_4500 )
      ( MAKE-ON ?AUTO_4498 ?AUTO_4499 )
      ( MAKE-ON-VERIFY ?AUTO_4498 ?AUTO_4499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4510 - BLOCK
      ?AUTO_4511 - BLOCK
    )
    :vars
    (
      ?AUTO_4519 - BLOCK
      ?AUTO_4516 - BLOCK
      ?AUTO_4514 - BLOCK
      ?AUTO_4515 - BLOCK
      ?AUTO_4517 - BLOCK
      ?AUTO_4518 - BLOCK
      ?AUTO_4520 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4510 ?AUTO_4519 ) ( CLEAR ?AUTO_4516 ) ( ON ?AUTO_4514 ?AUTO_4510 ) ( ON ?AUTO_4515 ?AUTO_4511 ) ( CLEAR ?AUTO_4515 ) ( CLEAR ?AUTO_4517 ) ( ON ?AUTO_4518 ?AUTO_4514 ) ( CLEAR ?AUTO_4518 ) ( HOLDING ?AUTO_4520 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4520 )
      ( MAKE-ON ?AUTO_4510 ?AUTO_4511 )
      ( MAKE-ON-VERIFY ?AUTO_4510 ?AUTO_4511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4521 - BLOCK
      ?AUTO_4522 - BLOCK
    )
    :vars
    (
      ?AUTO_4528 - BLOCK
      ?AUTO_4529 - BLOCK
      ?AUTO_4524 - BLOCK
      ?AUTO_4531 - BLOCK
      ?AUTO_4525 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4521 ?AUTO_4528 ) ( ON ?AUTO_4529 ?AUTO_4521 ) ( ON ?AUTO_4524 ?AUTO_4522 ) ( ON ?AUTO_4531 ?AUTO_4529 ) ( CLEAR ?AUTO_4531 ) ( ON ?AUTO_4525 ?AUTO_4524 ) ( CLEAR ?AUTO_4525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4525 ?AUTO_4524 )
      ( MAKE-ON ?AUTO_4521 ?AUTO_4522 )
      ( MAKE-ON-VERIFY ?AUTO_4521 ?AUTO_4522 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4533 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4533 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4533 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4533 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4535 - BLOCK
    )
    :vars
    (
      ?AUTO_4538 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4535 ?AUTO_4538 ) ( CLEAR ?AUTO_4535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4535 ?AUTO_4538 )
      ( MAKE-ON-TABLE ?AUTO_4535 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4535 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4540 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4540 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4540 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4540 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4542 - BLOCK
    )
    :vars
    (
      ?AUTO_4545 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4542 ?AUTO_4545 ) ( CLEAR ?AUTO_4542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4542 ?AUTO_4545 )
      ( MAKE-ON-TABLE ?AUTO_4542 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4542 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4546 - BLOCK
    )
    :vars
    (
      ?AUTO_4548 - BLOCK
      ?AUTO_4549 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4546 ?AUTO_4548 ) ( CLEAR ?AUTO_4546 ) ( HOLDING ?AUTO_4549 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4549 )
      ( MAKE-ON-TABLE ?AUTO_4546 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4546 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4550 - BLOCK
    )
    :vars
    (
      ?AUTO_4552 - BLOCK
      ?AUTO_4553 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4550 ?AUTO_4552 ) ( ON ?AUTO_4553 ?AUTO_4550 ) ( CLEAR ?AUTO_4553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4553 ?AUTO_4550 )
      ( MAKE-ON-TABLE ?AUTO_4550 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4550 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4557 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4557 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4557 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4557 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4559 - BLOCK
    )
    :vars
    (
      ?AUTO_4562 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4559 ?AUTO_4562 ) ( CLEAR ?AUTO_4559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4559 ?AUTO_4562 )
      ( MAKE-ON-TABLE ?AUTO_4559 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4559 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4563 - BLOCK
    )
    :vars
    (
      ?AUTO_4565 - BLOCK
      ?AUTO_4566 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4563 ?AUTO_4565 ) ( CLEAR ?AUTO_4563 ) ( HOLDING ?AUTO_4566 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4566 )
      ( MAKE-ON-TABLE ?AUTO_4563 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4563 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4567 - BLOCK
    )
    :vars
    (
      ?AUTO_4569 - BLOCK
      ?AUTO_4570 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4567 ?AUTO_4569 ) ( ON ?AUTO_4570 ?AUTO_4567 ) ( CLEAR ?AUTO_4570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4570 ?AUTO_4567 )
      ( MAKE-ON-TABLE ?AUTO_4567 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4567 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4573 - BLOCK
    )
    :vars
    (
      ?AUTO_4574 - BLOCK
      ?AUTO_4575 - BLOCK
      ?AUTO_4577 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4573 ?AUTO_4574 ) ( ON ?AUTO_4575 ?AUTO_4573 ) ( CLEAR ?AUTO_4575 ) ( HOLDING ?AUTO_4577 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4577 )
      ( MAKE-ON-TABLE ?AUTO_4573 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4573 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4578 - BLOCK
    )
    :vars
    (
      ?AUTO_4580 - BLOCK
      ?AUTO_4581 - BLOCK
      ?AUTO_4582 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4578 ?AUTO_4580 ) ( ON ?AUTO_4581 ?AUTO_4578 ) ( ON ?AUTO_4582 ?AUTO_4581 ) ( CLEAR ?AUTO_4582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4582 ?AUTO_4581 )
      ( MAKE-ON-TABLE ?AUTO_4578 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4578 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4586 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4586 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4586 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4586 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4588 - BLOCK
    )
    :vars
    (
      ?AUTO_4591 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4588 ?AUTO_4591 ) ( CLEAR ?AUTO_4588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4588 ?AUTO_4591 )
      ( MAKE-ON-TABLE ?AUTO_4588 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4588 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4592 - BLOCK
    )
    :vars
    (
      ?AUTO_4594 - BLOCK
      ?AUTO_4595 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4592 ?AUTO_4594 ) ( CLEAR ?AUTO_4592 ) ( HOLDING ?AUTO_4595 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4595 )
      ( MAKE-ON-TABLE ?AUTO_4592 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4592 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4596 - BLOCK
    )
    :vars
    (
      ?AUTO_4598 - BLOCK
      ?AUTO_4599 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4596 ?AUTO_4598 ) ( ON ?AUTO_4599 ?AUTO_4596 ) ( CLEAR ?AUTO_4599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4599 ?AUTO_4596 )
      ( MAKE-ON-TABLE ?AUTO_4596 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4596 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4602 - BLOCK
    )
    :vars
    (
      ?AUTO_4603 - BLOCK
      ?AUTO_4604 - BLOCK
      ?AUTO_4606 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4602 ?AUTO_4603 ) ( ON ?AUTO_4604 ?AUTO_4602 ) ( CLEAR ?AUTO_4604 ) ( HOLDING ?AUTO_4606 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4606 )
      ( MAKE-ON-TABLE ?AUTO_4602 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4602 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4607 - BLOCK
    )
    :vars
    (
      ?AUTO_4608 - BLOCK
      ?AUTO_4610 - BLOCK
      ?AUTO_4611 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4607 ?AUTO_4608 ) ( ON ?AUTO_4610 ?AUTO_4607 ) ( ON ?AUTO_4611 ?AUTO_4610 ) ( CLEAR ?AUTO_4611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4611 ?AUTO_4610 )
      ( MAKE-ON-TABLE ?AUTO_4607 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4607 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4614 - BLOCK
    )
    :vars
    (
      ?AUTO_4615 - BLOCK
      ?AUTO_4616 - BLOCK
      ?AUTO_4618 - BLOCK
      ?AUTO_4619 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4614 ?AUTO_4615 ) ( ON ?AUTO_4616 ?AUTO_4614 ) ( ON ?AUTO_4618 ?AUTO_4616 ) ( CLEAR ?AUTO_4618 ) ( HOLDING ?AUTO_4619 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4619 )
      ( MAKE-ON-TABLE ?AUTO_4614 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4614 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4620 - BLOCK
    )
    :vars
    (
      ?AUTO_4621 - BLOCK
      ?AUTO_4623 - BLOCK
      ?AUTO_4622 - BLOCK
      ?AUTO_4625 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4620 ?AUTO_4621 ) ( ON ?AUTO_4623 ?AUTO_4620 ) ( ON ?AUTO_4622 ?AUTO_4623 ) ( ON ?AUTO_4625 ?AUTO_4622 ) ( CLEAR ?AUTO_4625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4625 ?AUTO_4622 )
      ( MAKE-ON-TABLE ?AUTO_4620 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4630 - BLOCK
      ?AUTO_4631 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4630 ) ( CLEAR ?AUTO_4631 ) )
    :subtasks
    ( ( !STACK ?AUTO_4630 ?AUTO_4631 )
      ( MAKE-ON-VERIFY ?AUTO_4630 ?AUTO_4631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4634 - BLOCK
      ?AUTO_4635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4635 ) ( ON-TABLE ?AUTO_4634 ) ( CLEAR ?AUTO_4634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4634 )
      ( MAKE-ON ?AUTO_4634 ?AUTO_4635 )
      ( MAKE-ON-VERIFY ?AUTO_4634 ?AUTO_4635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4639 - BLOCK
      ?AUTO_4640 - BLOCK
    )
    :vars
    (
      ?AUTO_4643 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4640 ) ( ON-TABLE ?AUTO_4639 ) ( CLEAR ?AUTO_4639 ) ( HOLDING ?AUTO_4643 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4643 )
      ( MAKE-ON ?AUTO_4639 ?AUTO_4640 )
      ( MAKE-ON-VERIFY ?AUTO_4639 ?AUTO_4640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4644 - BLOCK
      ?AUTO_4645 - BLOCK
    )
    :vars
    (
      ?AUTO_4648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4644 ) ( CLEAR ?AUTO_4644 ) ( ON ?AUTO_4648 ?AUTO_4645 ) ( CLEAR ?AUTO_4648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4648 ?AUTO_4645 )
      ( MAKE-ON ?AUTO_4644 ?AUTO_4645 )
      ( MAKE-ON-VERIFY ?AUTO_4644 ?AUTO_4645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4651 - BLOCK
      ?AUTO_4652 - BLOCK
    )
    :vars
    (
      ?AUTO_4653 - BLOCK
      ?AUTO_4656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4651 ) ( CLEAR ?AUTO_4651 ) ( ON ?AUTO_4653 ?AUTO_4652 ) ( CLEAR ?AUTO_4653 ) ( HOLDING ?AUTO_4656 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4656 )
      ( MAKE-ON ?AUTO_4651 ?AUTO_4652 )
      ( MAKE-ON-VERIFY ?AUTO_4651 ?AUTO_4652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4657 - BLOCK
      ?AUTO_4658 - BLOCK
    )
    :vars
    (
      ?AUTO_4661 - BLOCK
      ?AUTO_4662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4657 ) ( CLEAR ?AUTO_4657 ) ( ON ?AUTO_4661 ?AUTO_4658 ) ( ON ?AUTO_4662 ?AUTO_4661 ) ( CLEAR ?AUTO_4662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4662 ?AUTO_4661 )
      ( MAKE-ON ?AUTO_4657 ?AUTO_4658 )
      ( MAKE-ON-VERIFY ?AUTO_4657 ?AUTO_4658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4665 - BLOCK
      ?AUTO_4666 - BLOCK
    )
    :vars
    (
      ?AUTO_4670 - BLOCK
      ?AUTO_4667 - BLOCK
      ?AUTO_4671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4665 ) ( CLEAR ?AUTO_4665 ) ( ON ?AUTO_4670 ?AUTO_4666 ) ( ON ?AUTO_4667 ?AUTO_4670 ) ( CLEAR ?AUTO_4667 ) ( HOLDING ?AUTO_4671 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4671 )
      ( MAKE-ON ?AUTO_4665 ?AUTO_4666 )
      ( MAKE-ON-VERIFY ?AUTO_4665 ?AUTO_4666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4672 - BLOCK
      ?AUTO_4673 - BLOCK
    )
    :vars
    (
      ?AUTO_4675 - BLOCK
      ?AUTO_4674 - BLOCK
      ?AUTO_4678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4672 ) ( CLEAR ?AUTO_4672 ) ( ON ?AUTO_4675 ?AUTO_4673 ) ( ON ?AUTO_4674 ?AUTO_4675 ) ( ON ?AUTO_4678 ?AUTO_4674 ) ( CLEAR ?AUTO_4678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4678 ?AUTO_4674 )
      ( MAKE-ON ?AUTO_4672 ?AUTO_4673 )
      ( MAKE-ON-VERIFY ?AUTO_4672 ?AUTO_4673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4681 - BLOCK
      ?AUTO_4682 - BLOCK
    )
    :vars
    (
      ?AUTO_4685 - BLOCK
      ?AUTO_4686 - BLOCK
      ?AUTO_4683 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4685 ?AUTO_4682 ) ( ON ?AUTO_4686 ?AUTO_4685 ) ( ON ?AUTO_4683 ?AUTO_4686 ) ( CLEAR ?AUTO_4683 ) ( HOLDING ?AUTO_4681 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4681 )
      ( MAKE-ON ?AUTO_4681 ?AUTO_4682 )
      ( MAKE-ON-VERIFY ?AUTO_4681 ?AUTO_4682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4689 - BLOCK
      ?AUTO_4690 - BLOCK
    )
    :vars
    (
      ?AUTO_4691 - BLOCK
      ?AUTO_4695 - BLOCK
      ?AUTO_4692 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4691 ?AUTO_4690 ) ( ON ?AUTO_4695 ?AUTO_4691 ) ( ON ?AUTO_4692 ?AUTO_4695 ) ( ON ?AUTO_4689 ?AUTO_4692 ) ( CLEAR ?AUTO_4689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4689 ?AUTO_4692 )
      ( MAKE-ON ?AUTO_4689 ?AUTO_4690 )
      ( MAKE-ON-VERIFY ?AUTO_4689 ?AUTO_4690 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4697 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4697 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4697 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4697 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4699 - BLOCK
    )
    :vars
    (
      ?AUTO_4702 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4699 ?AUTO_4702 ) ( CLEAR ?AUTO_4699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4699 ?AUTO_4702 )
      ( MAKE-ON-TABLE ?AUTO_4699 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4705 - BLOCK
      ?AUTO_4706 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4705 ) ( CLEAR ?AUTO_4706 ) )
    :subtasks
    ( ( !STACK ?AUTO_4705 ?AUTO_4706 )
      ( MAKE-ON-VERIFY ?AUTO_4705 ?AUTO_4706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4709 - BLOCK
      ?AUTO_4710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4710 ) ( ON-TABLE ?AUTO_4709 ) ( CLEAR ?AUTO_4709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4709 )
      ( MAKE-ON ?AUTO_4709 ?AUTO_4710 )
      ( MAKE-ON-VERIFY ?AUTO_4709 ?AUTO_4710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4714 - BLOCK
      ?AUTO_4715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4714 ) ( CLEAR ?AUTO_4714 ) ( HOLDING ?AUTO_4715 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4715 )
      ( MAKE-ON ?AUTO_4714 ?AUTO_4715 )
      ( MAKE-ON-VERIFY ?AUTO_4714 ?AUTO_4715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4723 - BLOCK
      ?AUTO_4724 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4723 ) ( CLEAR ?AUTO_4724 ) )
    :subtasks
    ( ( !STACK ?AUTO_4723 ?AUTO_4724 )
      ( MAKE-ON-VERIFY ?AUTO_4723 ?AUTO_4724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4727 - BLOCK
      ?AUTO_4728 - BLOCK
    )
    :vars
    (
      ?AUTO_4732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4728 ) ( ON ?AUTO_4727 ?AUTO_4732 ) ( CLEAR ?AUTO_4727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4727 ?AUTO_4732 )
      ( MAKE-ON ?AUTO_4727 ?AUTO_4728 )
      ( MAKE-ON-VERIFY ?AUTO_4727 ?AUTO_4728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4733 - BLOCK
      ?AUTO_4734 - BLOCK
    )
    :vars
    (
      ?AUTO_4737 - BLOCK
      ?AUTO_4738 - BLOCK
      ?AUTO_4739 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4734 ) ( ON ?AUTO_4733 ?AUTO_4737 ) ( CLEAR ?AUTO_4733 ) ( HOLDING ?AUTO_4738 ) ( CLEAR ?AUTO_4739 ) )
    :subtasks
    ( ( !STACK ?AUTO_4738 ?AUTO_4739 )
      ( MAKE-ON ?AUTO_4733 ?AUTO_4734 )
      ( MAKE-ON-VERIFY ?AUTO_4733 ?AUTO_4734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4744 - BLOCK
      ?AUTO_4745 - BLOCK
    )
    :vars
    (
      ?AUTO_4746 - BLOCK
      ?AUTO_4749 - BLOCK
      ?AUTO_4750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4745 ) ( ON ?AUTO_4744 ?AUTO_4746 ) ( CLEAR ?AUTO_4749 ) ( ON ?AUTO_4750 ?AUTO_4744 ) ( CLEAR ?AUTO_4750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4750 ?AUTO_4744 )
      ( MAKE-ON ?AUTO_4744 ?AUTO_4745 )
      ( MAKE-ON-VERIFY ?AUTO_4744 ?AUTO_4745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4755 - BLOCK
      ?AUTO_4756 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4755 ) ( CLEAR ?AUTO_4756 ) )
    :subtasks
    ( ( !STACK ?AUTO_4755 ?AUTO_4756 )
      ( MAKE-ON-VERIFY ?AUTO_4755 ?AUTO_4756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4759 - BLOCK
      ?AUTO_4760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4760 ) ( ON-TABLE ?AUTO_4759 ) ( CLEAR ?AUTO_4759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4759 )
      ( MAKE-ON ?AUTO_4759 ?AUTO_4760 )
      ( MAKE-ON-VERIFY ?AUTO_4759 ?AUTO_4760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4764 - BLOCK
      ?AUTO_4765 - BLOCK
    )
    :vars
    (
      ?AUTO_4769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4764 ) ( CLEAR ?AUTO_4764 ) ( HOLDING ?AUTO_4765 ) ( CLEAR ?AUTO_4769 ) )
    :subtasks
    ( ( !STACK ?AUTO_4765 ?AUTO_4769 )
      ( MAKE-ON ?AUTO_4764 ?AUTO_4765 )
      ( MAKE-ON-VERIFY ?AUTO_4764 ?AUTO_4765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4770 - BLOCK
      ?AUTO_4771 - BLOCK
    )
    :vars
    (
      ?AUTO_4773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4770 ) ( CLEAR ?AUTO_4773 ) ( ON ?AUTO_4771 ?AUTO_4770 ) ( CLEAR ?AUTO_4771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4771 ?AUTO_4770 )
      ( MAKE-ON ?AUTO_4770 ?AUTO_4771 )
      ( MAKE-ON-VERIFY ?AUTO_4770 ?AUTO_4771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4777 - BLOCK
      ?AUTO_4778 - BLOCK
    )
    :vars
    (
      ?AUTO_4779 - BLOCK
      ?AUTO_4782 - BLOCK
      ?AUTO_4783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4777 ) ( CLEAR ?AUTO_4779 ) ( ON ?AUTO_4778 ?AUTO_4777 ) ( CLEAR ?AUTO_4778 ) ( HOLDING ?AUTO_4782 ) ( CLEAR ?AUTO_4783 ) )
    :subtasks
    ( ( !STACK ?AUTO_4782 ?AUTO_4783 )
      ( MAKE-ON ?AUTO_4777 ?AUTO_4778 )
      ( MAKE-ON-VERIFY ?AUTO_4777 ?AUTO_4778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4788 - BLOCK
      ?AUTO_4789 - BLOCK
    )
    :vars
    (
      ?AUTO_4792 - BLOCK
      ?AUTO_4794 - BLOCK
      ?AUTO_4793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4788 ) ( CLEAR ?AUTO_4792 ) ( ON ?AUTO_4789 ?AUTO_4788 ) ( CLEAR ?AUTO_4794 ) ( ON ?AUTO_4793 ?AUTO_4789 ) ( CLEAR ?AUTO_4793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4793 ?AUTO_4789 )
      ( MAKE-ON ?AUTO_4788 ?AUTO_4789 )
      ( MAKE-ON-VERIFY ?AUTO_4788 ?AUTO_4789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4799 - BLOCK
      ?AUTO_4800 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4799 ) ( CLEAR ?AUTO_4800 ) )
    :subtasks
    ( ( !STACK ?AUTO_4799 ?AUTO_4800 )
      ( MAKE-ON-VERIFY ?AUTO_4799 ?AUTO_4800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4803 - BLOCK
      ?AUTO_4804 - BLOCK
    )
    :vars
    (
      ?AUTO_4808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4804 ) ( ON ?AUTO_4803 ?AUTO_4808 ) ( CLEAR ?AUTO_4803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4803 ?AUTO_4808 )
      ( MAKE-ON ?AUTO_4803 ?AUTO_4804 )
      ( MAKE-ON-VERIFY ?AUTO_4803 ?AUTO_4804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4809 - BLOCK
      ?AUTO_4810 - BLOCK
    )
    :vars
    (
      ?AUTO_4813 - BLOCK
      ?AUTO_4815 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4809 ?AUTO_4813 ) ( CLEAR ?AUTO_4809 ) ( HOLDING ?AUTO_4810 ) ( CLEAR ?AUTO_4815 ) )
    :subtasks
    ( ( !STACK ?AUTO_4810 ?AUTO_4815 )
      ( MAKE-ON ?AUTO_4809 ?AUTO_4810 )
      ( MAKE-ON-VERIFY ?AUTO_4809 ?AUTO_4810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4818 - BLOCK
      ?AUTO_4819 - BLOCK
    )
    :vars
    (
      ?AUTO_4822 - BLOCK
      ?AUTO_4823 - BLOCK
      ?AUTO_4824 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4819 ) ( ON ?AUTO_4818 ?AUTO_4822 ) ( CLEAR ?AUTO_4818 ) ( HOLDING ?AUTO_4823 ) ( CLEAR ?AUTO_4824 ) )
    :subtasks
    ( ( !STACK ?AUTO_4823 ?AUTO_4824 )
      ( MAKE-ON ?AUTO_4818 ?AUTO_4819 )
      ( MAKE-ON-VERIFY ?AUTO_4818 ?AUTO_4819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4825 - BLOCK
      ?AUTO_4826 - BLOCK
    )
    :vars
    (
      ?AUTO_4829 - BLOCK
      ?AUTO_4831 - BLOCK
      ?AUTO_4830 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4825 ?AUTO_4829 ) ( CLEAR ?AUTO_4825 ) ( CLEAR ?AUTO_4831 ) ( ON ?AUTO_4830 ?AUTO_4826 ) ( CLEAR ?AUTO_4830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4830 ?AUTO_4826 )
      ( MAKE-ON ?AUTO_4825 ?AUTO_4826 )
      ( MAKE-ON-VERIFY ?AUTO_4825 ?AUTO_4826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4834 - BLOCK
      ?AUTO_4835 - BLOCK
    )
    :vars
    (
      ?AUTO_4840 - BLOCK
      ?AUTO_4836 - BLOCK
      ?AUTO_4839 - BLOCK
      ?AUTO_4841 - BLOCK
      ?AUTO_4842 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4834 ?AUTO_4840 ) ( CLEAR ?AUTO_4834 ) ( CLEAR ?AUTO_4836 ) ( ON ?AUTO_4839 ?AUTO_4835 ) ( CLEAR ?AUTO_4839 ) ( HOLDING ?AUTO_4841 ) ( CLEAR ?AUTO_4842 ) )
    :subtasks
    ( ( !STACK ?AUTO_4841 ?AUTO_4842 )
      ( MAKE-ON ?AUTO_4834 ?AUTO_4835 )
      ( MAKE-ON-VERIFY ?AUTO_4834 ?AUTO_4835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4847 - BLOCK
      ?AUTO_4848 - BLOCK
    )
    :vars
    (
      ?AUTO_4854 - BLOCK
      ?AUTO_4853 - BLOCK
      ?AUTO_4855 - BLOCK
      ?AUTO_4851 - BLOCK
      ?AUTO_4849 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4847 ?AUTO_4854 ) ( CLEAR ?AUTO_4847 ) ( CLEAR ?AUTO_4853 ) ( ON ?AUTO_4855 ?AUTO_4848 ) ( CLEAR ?AUTO_4851 ) ( ON ?AUTO_4849 ?AUTO_4855 ) ( CLEAR ?AUTO_4849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4849 ?AUTO_4855 )
      ( MAKE-ON ?AUTO_4847 ?AUTO_4848 )
      ( MAKE-ON-VERIFY ?AUTO_4847 ?AUTO_4848 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4859 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4859 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4859 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4859 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4861 - BLOCK
    )
    :vars
    (
      ?AUTO_4864 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4861 ?AUTO_4864 ) ( CLEAR ?AUTO_4861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4861 ?AUTO_4864 )
      ( MAKE-ON-TABLE ?AUTO_4861 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4861 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4865 - BLOCK
    )
    :vars
    (
      ?AUTO_4867 - BLOCK
      ?AUTO_4868 - BLOCK
      ?AUTO_4869 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4865 ?AUTO_4867 ) ( CLEAR ?AUTO_4865 ) ( HOLDING ?AUTO_4868 ) ( CLEAR ?AUTO_4869 ) )
    :subtasks
    ( ( !STACK ?AUTO_4868 ?AUTO_4869 )
      ( MAKE-ON-TABLE ?AUTO_4865 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4865 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4870 - BLOCK
    )
    :vars
    (
      ?AUTO_4872 - BLOCK
      ?AUTO_4874 - BLOCK
      ?AUTO_4873 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4870 ?AUTO_4872 ) ( CLEAR ?AUTO_4874 ) ( ON ?AUTO_4873 ?AUTO_4870 ) ( CLEAR ?AUTO_4873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4873 ?AUTO_4870 )
      ( MAKE-ON-TABLE ?AUTO_4870 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4870 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4877 - BLOCK
    )
    :vars
    (
      ?AUTO_4880 - BLOCK
      ?AUTO_4881 - BLOCK
      ?AUTO_4878 - BLOCK
      ?AUTO_4883 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4877 ?AUTO_4880 ) ( ON ?AUTO_4881 ?AUTO_4877 ) ( CLEAR ?AUTO_4881 ) ( HOLDING ?AUTO_4878 ) ( CLEAR ?AUTO_4883 ) )
    :subtasks
    ( ( !STACK ?AUTO_4878 ?AUTO_4883 )
      ( MAKE-ON-TABLE ?AUTO_4877 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4877 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4892 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4892 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4892 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4892 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4894 - BLOCK
    )
    :vars
    (
      ?AUTO_4897 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4894 ?AUTO_4897 ) ( CLEAR ?AUTO_4894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4894 ?AUTO_4897 )
      ( MAKE-ON-TABLE ?AUTO_4894 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4894 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4898 - BLOCK
    )
    :vars
    (
      ?AUTO_4900 - BLOCK
      ?AUTO_4901 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4898 ?AUTO_4900 ) ( CLEAR ?AUTO_4898 ) ( HOLDING ?AUTO_4901 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4901 )
      ( MAKE-ON-TABLE ?AUTO_4898 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4898 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4902 - BLOCK
    )
    :vars
    (
      ?AUTO_4904 - BLOCK
      ?AUTO_4905 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4902 ?AUTO_4904 ) ( ON ?AUTO_4905 ?AUTO_4902 ) ( CLEAR ?AUTO_4905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4905 ?AUTO_4902 )
      ( MAKE-ON-TABLE ?AUTO_4902 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4902 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4908 - BLOCK
    )
    :vars
    (
      ?AUTO_4909 - BLOCK
      ?AUTO_4910 - BLOCK
      ?AUTO_4912 - BLOCK
      ?AUTO_4913 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4908 ?AUTO_4909 ) ( ON ?AUTO_4910 ?AUTO_4908 ) ( CLEAR ?AUTO_4910 ) ( HOLDING ?AUTO_4912 ) ( CLEAR ?AUTO_4913 ) )
    :subtasks
    ( ( !STACK ?AUTO_4912 ?AUTO_4913 )
      ( MAKE-ON-TABLE ?AUTO_4908 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4908 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4914 - BLOCK
    )
    :vars
    (
      ?AUTO_4916 - BLOCK
      ?AUTO_4917 - BLOCK
      ?AUTO_4919 - BLOCK
      ?AUTO_4918 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4914 ?AUTO_4916 ) ( ON ?AUTO_4917 ?AUTO_4914 ) ( CLEAR ?AUTO_4919 ) ( ON ?AUTO_4918 ?AUTO_4917 ) ( CLEAR ?AUTO_4918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4918 ?AUTO_4917 )
      ( MAKE-ON-TABLE ?AUTO_4914 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4914 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4922 - BLOCK
    )
    :vars
    (
      ?AUTO_4927 - BLOCK
      ?AUTO_4924 - BLOCK
      ?AUTO_4923 - BLOCK
      ?AUTO_4925 - BLOCK
      ?AUTO_4929 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4922 ?AUTO_4927 ) ( ON ?AUTO_4924 ?AUTO_4922 ) ( ON ?AUTO_4923 ?AUTO_4924 ) ( CLEAR ?AUTO_4923 ) ( HOLDING ?AUTO_4925 ) ( CLEAR ?AUTO_4929 ) )
    :subtasks
    ( ( !STACK ?AUTO_4925 ?AUTO_4929 )
      ( MAKE-ON-TABLE ?AUTO_4922 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4939 - BLOCK
      ?AUTO_4940 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4939 ) ( CLEAR ?AUTO_4940 ) )
    :subtasks
    ( ( !STACK ?AUTO_4939 ?AUTO_4940 )
      ( MAKE-ON-VERIFY ?AUTO_4939 ?AUTO_4940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4943 - BLOCK
      ?AUTO_4944 - BLOCK
    )
    :vars
    (
      ?AUTO_4948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4944 ) ( ON ?AUTO_4943 ?AUTO_4948 ) ( CLEAR ?AUTO_4943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4943 ?AUTO_4948 )
      ( MAKE-ON ?AUTO_4943 ?AUTO_4944 )
      ( MAKE-ON-VERIFY ?AUTO_4943 ?AUTO_4944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4949 - BLOCK
      ?AUTO_4950 - BLOCK
    )
    :vars
    (
      ?AUTO_4953 - BLOCK
      ?AUTO_4954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4950 ) ( ON ?AUTO_4949 ?AUTO_4953 ) ( CLEAR ?AUTO_4949 ) ( HOLDING ?AUTO_4954 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4954 )
      ( MAKE-ON ?AUTO_4949 ?AUTO_4950 )
      ( MAKE-ON-VERIFY ?AUTO_4949 ?AUTO_4950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4955 - BLOCK
      ?AUTO_4956 - BLOCK
    )
    :vars
    (
      ?AUTO_4959 - BLOCK
      ?AUTO_4960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4956 ) ( ON ?AUTO_4955 ?AUTO_4959 ) ( ON ?AUTO_4960 ?AUTO_4955 ) ( CLEAR ?AUTO_4960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4960 ?AUTO_4955 )
      ( MAKE-ON ?AUTO_4955 ?AUTO_4956 )
      ( MAKE-ON-VERIFY ?AUTO_4955 ?AUTO_4956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4963 - BLOCK
      ?AUTO_4964 - BLOCK
    )
    :vars
    (
      ?AUTO_4968 - BLOCK
      ?AUTO_4965 - BLOCK
      ?AUTO_4969 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4964 ) ( ON ?AUTO_4963 ?AUTO_4968 ) ( ON ?AUTO_4965 ?AUTO_4963 ) ( CLEAR ?AUTO_4965 ) ( HOLDING ?AUTO_4969 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4969 )
      ( MAKE-ON ?AUTO_4963 ?AUTO_4964 )
      ( MAKE-ON-VERIFY ?AUTO_4963 ?AUTO_4964 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4970 - BLOCK
      ?AUTO_4971 - BLOCK
    )
    :vars
    (
      ?AUTO_4975 - BLOCK
      ?AUTO_4972 - BLOCK
      ?AUTO_4976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4971 ) ( ON ?AUTO_4970 ?AUTO_4975 ) ( ON ?AUTO_4972 ?AUTO_4970 ) ( ON ?AUTO_4976 ?AUTO_4972 ) ( CLEAR ?AUTO_4976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4976 ?AUTO_4972 )
      ( MAKE-ON ?AUTO_4970 ?AUTO_4971 )
      ( MAKE-ON-VERIFY ?AUTO_4970 ?AUTO_4971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4979 - BLOCK
      ?AUTO_4980 - BLOCK
    )
    :vars
    (
      ?AUTO_4985 - BLOCK
      ?AUTO_4982 - BLOCK
      ?AUTO_4983 - BLOCK
      ?AUTO_4986 - BLOCK
      ?AUTO_4987 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4980 ) ( ON ?AUTO_4979 ?AUTO_4985 ) ( ON ?AUTO_4982 ?AUTO_4979 ) ( ON ?AUTO_4983 ?AUTO_4982 ) ( CLEAR ?AUTO_4983 ) ( HOLDING ?AUTO_4986 ) ( CLEAR ?AUTO_4987 ) )
    :subtasks
    ( ( !STACK ?AUTO_4986 ?AUTO_4987 )
      ( MAKE-ON ?AUTO_4979 ?AUTO_4980 )
      ( MAKE-ON-VERIFY ?AUTO_4979 ?AUTO_4980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4988 - BLOCK
      ?AUTO_4989 - BLOCK
    )
    :vars
    (
      ?AUTO_4990 - BLOCK
      ?AUTO_4991 - BLOCK
      ?AUTO_4996 - BLOCK
      ?AUTO_4993 - BLOCK
      ?AUTO_4992 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4989 ) ( ON ?AUTO_4988 ?AUTO_4990 ) ( ON ?AUTO_4991 ?AUTO_4988 ) ( ON ?AUTO_4996 ?AUTO_4991 ) ( CLEAR ?AUTO_4993 ) ( ON ?AUTO_4992 ?AUTO_4996 ) ( CLEAR ?AUTO_4992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4992 ?AUTO_4996 )
      ( MAKE-ON ?AUTO_4988 ?AUTO_4989 )
      ( MAKE-ON-VERIFY ?AUTO_4988 ?AUTO_4989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4999 - BLOCK
      ?AUTO_5000 - BLOCK
    )
    :vars
    (
      ?AUTO_5006 - BLOCK
      ?AUTO_5003 - BLOCK
      ?AUTO_5005 - BLOCK
      ?AUTO_5007 - BLOCK
      ?AUTO_5004 - BLOCK
      ?AUTO_5009 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5000 ) ( ON ?AUTO_4999 ?AUTO_5006 ) ( ON ?AUTO_5003 ?AUTO_4999 ) ( ON ?AUTO_5005 ?AUTO_5003 ) ( ON ?AUTO_5007 ?AUTO_5005 ) ( CLEAR ?AUTO_5007 ) ( HOLDING ?AUTO_5004 ) ( CLEAR ?AUTO_5009 ) )
    :subtasks
    ( ( !STACK ?AUTO_5004 ?AUTO_5009 )
      ( MAKE-ON ?AUTO_4999 ?AUTO_5000 )
      ( MAKE-ON-VERIFY ?AUTO_4999 ?AUTO_5000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5016 - BLOCK
      ?AUTO_5017 - BLOCK
    )
    :vars
    (
      ?AUTO_5022 - BLOCK
      ?AUTO_5023 - BLOCK
      ?AUTO_5018 - BLOCK
      ?AUTO_5021 - BLOCK
      ?AUTO_5024 - BLOCK
      ?AUTO_5026 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5016 ?AUTO_5022 ) ( ON ?AUTO_5023 ?AUTO_5016 ) ( ON ?AUTO_5018 ?AUTO_5023 ) ( CLEAR ?AUTO_5021 ) ( ON ?AUTO_5024 ?AUTO_5018 ) ( CLEAR ?AUTO_5024 ) ( HOLDING ?AUTO_5017 ) ( CLEAR ?AUTO_5026 ) )
    :subtasks
    ( ( !STACK ?AUTO_5017 ?AUTO_5026 )
      ( MAKE-ON ?AUTO_5016 ?AUTO_5017 )
      ( MAKE-ON-VERIFY ?AUTO_5016 ?AUTO_5017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5035 - BLOCK
      ?AUTO_5036 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5035 ) ( CLEAR ?AUTO_5036 ) )
    :subtasks
    ( ( !STACK ?AUTO_5035 ?AUTO_5036 )
      ( MAKE-ON-VERIFY ?AUTO_5035 ?AUTO_5036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5039 - BLOCK
      ?AUTO_5040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5040 ) ( ON-TABLE ?AUTO_5039 ) ( CLEAR ?AUTO_5039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5039 )
      ( MAKE-ON ?AUTO_5039 ?AUTO_5040 )
      ( MAKE-ON-VERIFY ?AUTO_5039 ?AUTO_5040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5044 - BLOCK
      ?AUTO_5045 - BLOCK
    )
    :vars
    (
      ?AUTO_5049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5044 ) ( CLEAR ?AUTO_5044 ) ( HOLDING ?AUTO_5045 ) ( CLEAR ?AUTO_5049 ) )
    :subtasks
    ( ( !STACK ?AUTO_5045 ?AUTO_5049 )
      ( MAKE-ON ?AUTO_5044 ?AUTO_5045 )
      ( MAKE-ON-VERIFY ?AUTO_5044 ?AUTO_5045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5266 - BLOCK
      ?AUTO_5267 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5266 ) ( CLEAR ?AUTO_5267 ) )
    :subtasks
    ( ( !STACK ?AUTO_5266 ?AUTO_5267 )
      ( MAKE-ON-VERIFY ?AUTO_5266 ?AUTO_5267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5270 - BLOCK
      ?AUTO_5271 - BLOCK
    )
    :vars
    (
      ?AUTO_5275 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5271 ) ( ON ?AUTO_5270 ?AUTO_5275 ) ( CLEAR ?AUTO_5270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5270 ?AUTO_5275 )
      ( MAKE-ON ?AUTO_5270 ?AUTO_5271 )
      ( MAKE-ON-VERIFY ?AUTO_5270 ?AUTO_5271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5276 - BLOCK
      ?AUTO_5277 - BLOCK
    )
    :vars
    (
      ?AUTO_5280 - BLOCK
      ?AUTO_5281 - BLOCK
      ?AUTO_5282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5277 ) ( ON ?AUTO_5276 ?AUTO_5280 ) ( CLEAR ?AUTO_5276 ) ( HOLDING ?AUTO_5281 ) ( CLEAR ?AUTO_5282 ) )
    :subtasks
    ( ( !STACK ?AUTO_5281 ?AUTO_5282 )
      ( MAKE-ON ?AUTO_5276 ?AUTO_5277 )
      ( MAKE-ON-VERIFY ?AUTO_5276 ?AUTO_5277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5287 - BLOCK
      ?AUTO_5288 - BLOCK
    )
    :vars
    (
      ?AUTO_5289 - BLOCK
      ?AUTO_5292 - BLOCK
      ?AUTO_5293 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5287 ?AUTO_5289 ) ( CLEAR ?AUTO_5287 ) ( CLEAR ?AUTO_5292 ) ( ON ?AUTO_5293 ?AUTO_5288 ) ( CLEAR ?AUTO_5293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5293 ?AUTO_5288 )
      ( MAKE-ON ?AUTO_5287 ?AUTO_5288 )
      ( MAKE-ON-VERIFY ?AUTO_5287 ?AUTO_5288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5296 - BLOCK
      ?AUTO_5297 - BLOCK
    )
    :vars
    (
      ?AUTO_5300 - BLOCK
      ?AUTO_5302 - BLOCK
      ?AUTO_5301 - BLOCK
      ?AUTO_5303 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5296 ?AUTO_5300 ) ( CLEAR ?AUTO_5296 ) ( CLEAR ?AUTO_5302 ) ( ON ?AUTO_5301 ?AUTO_5297 ) ( CLEAR ?AUTO_5301 ) ( HOLDING ?AUTO_5303 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5303 )
      ( MAKE-ON ?AUTO_5296 ?AUTO_5297 )
      ( MAKE-ON-VERIFY ?AUTO_5296 ?AUTO_5297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5304 - BLOCK
      ?AUTO_5305 - BLOCK
    )
    :vars
    (
      ?AUTO_5311 - BLOCK
      ?AUTO_5306 - BLOCK
      ?AUTO_5307 - BLOCK
      ?AUTO_5310 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5304 ?AUTO_5311 ) ( CLEAR ?AUTO_5304 ) ( CLEAR ?AUTO_5306 ) ( ON ?AUTO_5307 ?AUTO_5305 ) ( ON ?AUTO_5310 ?AUTO_5307 ) ( CLEAR ?AUTO_5310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5310 ?AUTO_5307 )
      ( MAKE-ON ?AUTO_5304 ?AUTO_5305 )
      ( MAKE-ON-VERIFY ?AUTO_5304 ?AUTO_5305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5314 - BLOCK
      ?AUTO_5315 - BLOCK
    )
    :vars
    (
      ?AUTO_5320 - BLOCK
      ?AUTO_5319 - BLOCK
      ?AUTO_5317 - BLOCK
      ?AUTO_5321 - BLOCK
      ?AUTO_5322 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5314 ?AUTO_5320 ) ( CLEAR ?AUTO_5314 ) ( CLEAR ?AUTO_5319 ) ( ON ?AUTO_5317 ?AUTO_5315 ) ( ON ?AUTO_5321 ?AUTO_5317 ) ( CLEAR ?AUTO_5321 ) ( HOLDING ?AUTO_5322 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5322 )
      ( MAKE-ON ?AUTO_5314 ?AUTO_5315 )
      ( MAKE-ON-VERIFY ?AUTO_5314 ?AUTO_5315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5323 - BLOCK
      ?AUTO_5324 - BLOCK
    )
    :vars
    (
      ?AUTO_5325 - BLOCK
      ?AUTO_5326 - BLOCK
      ?AUTO_5330 - BLOCK
      ?AUTO_5327 - BLOCK
      ?AUTO_5331 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5323 ?AUTO_5325 ) ( CLEAR ?AUTO_5323 ) ( CLEAR ?AUTO_5326 ) ( ON ?AUTO_5330 ?AUTO_5324 ) ( ON ?AUTO_5327 ?AUTO_5330 ) ( ON ?AUTO_5331 ?AUTO_5327 ) ( CLEAR ?AUTO_5331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5331 ?AUTO_5327 )
      ( MAKE-ON ?AUTO_5323 ?AUTO_5324 )
      ( MAKE-ON-VERIFY ?AUTO_5323 ?AUTO_5324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5334 - BLOCK
      ?AUTO_5335 - BLOCK
    )
    :vars
    (
      ?AUTO_5342 - BLOCK
      ?AUTO_5340 - BLOCK
      ?AUTO_5338 - BLOCK
      ?AUTO_5337 - BLOCK
      ?AUTO_5339 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5342 ) ( ON ?AUTO_5340 ?AUTO_5335 ) ( ON ?AUTO_5338 ?AUTO_5340 ) ( ON ?AUTO_5337 ?AUTO_5338 ) ( CLEAR ?AUTO_5337 ) ( HOLDING ?AUTO_5334 ) ( CLEAR ?AUTO_5339 ) )
    :subtasks
    ( ( !STACK ?AUTO_5334 ?AUTO_5339 )
      ( MAKE-ON ?AUTO_5334 ?AUTO_5335 )
      ( MAKE-ON-VERIFY ?AUTO_5334 ?AUTO_5335 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5345 - BLOCK
      ?AUTO_5346 - BLOCK
    )
    :vars
    (
      ?AUTO_5347 - BLOCK
      ?AUTO_5352 - BLOCK
      ?AUTO_5353 - BLOCK
      ?AUTO_5349 - BLOCK
      ?AUTO_5348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5347 ) ( ON ?AUTO_5352 ?AUTO_5346 ) ( ON ?AUTO_5353 ?AUTO_5352 ) ( ON ?AUTO_5349 ?AUTO_5353 ) ( CLEAR ?AUTO_5348 ) ( ON ?AUTO_5345 ?AUTO_5349 ) ( CLEAR ?AUTO_5345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5345 ?AUTO_5349 )
      ( MAKE-ON ?AUTO_5345 ?AUTO_5346 )
      ( MAKE-ON-VERIFY ?AUTO_5345 ?AUTO_5346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5356 - BLOCK
      ?AUTO_5357 - BLOCK
    )
    :vars
    (
      ?AUTO_5364 - BLOCK
      ?AUTO_5359 - BLOCK
      ?AUTO_5363 - BLOCK
      ?AUTO_5358 - BLOCK
      ?AUTO_5360 - BLOCK
      ?AUTO_5366 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5364 ) ( ON ?AUTO_5359 ?AUTO_5357 ) ( ON ?AUTO_5363 ?AUTO_5359 ) ( ON ?AUTO_5358 ?AUTO_5363 ) ( ON ?AUTO_5356 ?AUTO_5358 ) ( CLEAR ?AUTO_5356 ) ( HOLDING ?AUTO_5360 ) ( CLEAR ?AUTO_5366 ) )
    :subtasks
    ( ( !STACK ?AUTO_5360 ?AUTO_5366 )
      ( MAKE-ON ?AUTO_5356 ?AUTO_5357 )
      ( MAKE-ON-VERIFY ?AUTO_5356 ?AUTO_5357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5383 - BLOCK
      ?AUTO_5384 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5383 ) ( CLEAR ?AUTO_5384 ) )
    :subtasks
    ( ( !STACK ?AUTO_5383 ?AUTO_5384 )
      ( MAKE-ON-VERIFY ?AUTO_5383 ?AUTO_5384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5387 - BLOCK
      ?AUTO_5388 - BLOCK
    )
    :vars
    (
      ?AUTO_5392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5388 ) ( ON ?AUTO_5387 ?AUTO_5392 ) ( CLEAR ?AUTO_5387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5387 ?AUTO_5392 )
      ( MAKE-ON ?AUTO_5387 ?AUTO_5388 )
      ( MAKE-ON-VERIFY ?AUTO_5387 ?AUTO_5388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5393 - BLOCK
      ?AUTO_5394 - BLOCK
    )
    :vars
    (
      ?AUTO_5397 - BLOCK
      ?AUTO_5398 - BLOCK
      ?AUTO_5399 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5394 ) ( ON ?AUTO_5393 ?AUTO_5397 ) ( CLEAR ?AUTO_5393 ) ( HOLDING ?AUTO_5398 ) ( CLEAR ?AUTO_5399 ) )
    :subtasks
    ( ( !STACK ?AUTO_5398 ?AUTO_5399 )
      ( MAKE-ON ?AUTO_5393 ?AUTO_5394 )
      ( MAKE-ON-VERIFY ?AUTO_5393 ?AUTO_5394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5400 - BLOCK
      ?AUTO_5401 - BLOCK
    )
    :vars
    (
      ?AUTO_5404 - BLOCK
      ?AUTO_5406 - BLOCK
      ?AUTO_5405 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5401 ) ( ON ?AUTO_5400 ?AUTO_5404 ) ( CLEAR ?AUTO_5406 ) ( ON ?AUTO_5405 ?AUTO_5400 ) ( CLEAR ?AUTO_5405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5405 ?AUTO_5400 )
      ( MAKE-ON ?AUTO_5400 ?AUTO_5401 )
      ( MAKE-ON-VERIFY ?AUTO_5400 ?AUTO_5401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5409 - BLOCK
      ?AUTO_5410 - BLOCK
    )
    :vars
    (
      ?AUTO_5415 - BLOCK
      ?AUTO_5412 - BLOCK
      ?AUTO_5411 - BLOCK
      ?AUTO_5416 - BLOCK
      ?AUTO_5417 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5410 ) ( ON ?AUTO_5409 ?AUTO_5415 ) ( CLEAR ?AUTO_5412 ) ( ON ?AUTO_5411 ?AUTO_5409 ) ( CLEAR ?AUTO_5411 ) ( HOLDING ?AUTO_5416 ) ( CLEAR ?AUTO_5417 ) )
    :subtasks
    ( ( !STACK ?AUTO_5416 ?AUTO_5417 )
      ( MAKE-ON ?AUTO_5409 ?AUTO_5410 )
      ( MAKE-ON-VERIFY ?AUTO_5409 ?AUTO_5410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5428 - BLOCK
      ?AUTO_5429 - BLOCK
    )
    :vars
    (
      ?AUTO_5434 - BLOCK
      ?AUTO_5431 - BLOCK
      ?AUTO_5432 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5428 ?AUTO_5434 ) ( CLEAR ?AUTO_5431 ) ( ON ?AUTO_5432 ?AUTO_5428 ) ( CLEAR ?AUTO_5432 ) ( HOLDING ?AUTO_5429 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5429 )
      ( MAKE-ON ?AUTO_5428 ?AUTO_5429 )
      ( MAKE-ON-VERIFY ?AUTO_5428 ?AUTO_5429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5442 - BLOCK
      ?AUTO_5443 - BLOCK
    )
    :vars
    (
      ?AUTO_5448 - BLOCK
      ?AUTO_5445 - BLOCK
      ?AUTO_5444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5448 ) ( ON ?AUTO_5445 ?AUTO_5443 ) ( CLEAR ?AUTO_5445 ) ( HOLDING ?AUTO_5442 ) ( CLEAR ?AUTO_5444 ) )
    :subtasks
    ( ( !STACK ?AUTO_5442 ?AUTO_5444 )
      ( MAKE-ON ?AUTO_5442 ?AUTO_5443 )
      ( MAKE-ON-VERIFY ?AUTO_5442 ?AUTO_5443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5451 - BLOCK
      ?AUTO_5452 - BLOCK
    )
    :vars
    (
      ?AUTO_5457 - BLOCK
      ?AUTO_5456 - BLOCK
      ?AUTO_5455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5457 ) ( ON ?AUTO_5456 ?AUTO_5452 ) ( CLEAR ?AUTO_5456 ) ( CLEAR ?AUTO_5455 ) ( ON-TABLE ?AUTO_5451 ) ( CLEAR ?AUTO_5451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5451 )
      ( MAKE-ON ?AUTO_5451 ?AUTO_5452 )
      ( MAKE-ON-VERIFY ?AUTO_5451 ?AUTO_5452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5459 - BLOCK
      ?AUTO_5460 - BLOCK
    )
    :vars
    (
      ?AUTO_5461 - BLOCK
      ?AUTO_5464 - BLOCK
      ?AUTO_5465 - BLOCK
      ?AUTO_5467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5461 ) ( ON ?AUTO_5464 ?AUTO_5460 ) ( CLEAR ?AUTO_5464 ) ( ON-TABLE ?AUTO_5459 ) ( CLEAR ?AUTO_5459 ) ( HOLDING ?AUTO_5465 ) ( CLEAR ?AUTO_5467 ) )
    :subtasks
    ( ( !STACK ?AUTO_5465 ?AUTO_5467 )
      ( MAKE-ON ?AUTO_5459 ?AUTO_5460 )
      ( MAKE-ON-VERIFY ?AUTO_5459 ?AUTO_5460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5468 - BLOCK
      ?AUTO_5469 - BLOCK
    )
    :vars
    (
      ?AUTO_5471 - BLOCK
      ?AUTO_5474 - BLOCK
      ?AUTO_5473 - BLOCK
      ?AUTO_5475 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5471 ) ( ON ?AUTO_5474 ?AUTO_5469 ) ( CLEAR ?AUTO_5474 ) ( ON-TABLE ?AUTO_5468 ) ( CLEAR ?AUTO_5473 ) ( ON ?AUTO_5475 ?AUTO_5468 ) ( CLEAR ?AUTO_5475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5475 ?AUTO_5468 )
      ( MAKE-ON ?AUTO_5468 ?AUTO_5469 )
      ( MAKE-ON-VERIFY ?AUTO_5468 ?AUTO_5469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5478 - BLOCK
      ?AUTO_5479 - BLOCK
    )
    :vars
    (
      ?AUTO_5481 - BLOCK
      ?AUTO_5480 - BLOCK
      ?AUTO_5485 - BLOCK
      ?AUTO_5482 - BLOCK
      ?AUTO_5486 - BLOCK
      ?AUTO_5487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5481 ) ( ON ?AUTO_5480 ?AUTO_5479 ) ( CLEAR ?AUTO_5480 ) ( ON-TABLE ?AUTO_5478 ) ( CLEAR ?AUTO_5485 ) ( ON ?AUTO_5482 ?AUTO_5478 ) ( CLEAR ?AUTO_5482 ) ( HOLDING ?AUTO_5486 ) ( CLEAR ?AUTO_5487 ) )
    :subtasks
    ( ( !STACK ?AUTO_5486 ?AUTO_5487 )
      ( MAKE-ON ?AUTO_5478 ?AUTO_5479 )
      ( MAKE-ON-VERIFY ?AUTO_5478 ?AUTO_5479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5492 - BLOCK
      ?AUTO_5493 - BLOCK
    )
    :vars
    (
      ?AUTO_5500 - BLOCK
      ?AUTO_5501 - BLOCK
      ?AUTO_5495 - BLOCK
      ?AUTO_5498 - BLOCK
      ?AUTO_5496 - BLOCK
      ?AUTO_5494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5500 ) ( ON ?AUTO_5501 ?AUTO_5493 ) ( CLEAR ?AUTO_5501 ) ( ON-TABLE ?AUTO_5492 ) ( CLEAR ?AUTO_5495 ) ( ON ?AUTO_5498 ?AUTO_5492 ) ( CLEAR ?AUTO_5496 ) ( ON ?AUTO_5494 ?AUTO_5498 ) ( CLEAR ?AUTO_5494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5494 ?AUTO_5498 )
      ( MAKE-ON ?AUTO_5492 ?AUTO_5493 )
      ( MAKE-ON-VERIFY ?AUTO_5492 ?AUTO_5493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5506 - BLOCK
      ?AUTO_5507 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5506 ) ( CLEAR ?AUTO_5507 ) )
    :subtasks
    ( ( !STACK ?AUTO_5506 ?AUTO_5507 )
      ( MAKE-ON-VERIFY ?AUTO_5506 ?AUTO_5507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5510 - BLOCK
      ?AUTO_5511 - BLOCK
    )
    :vars
    (
      ?AUTO_5515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5511 ) ( ON ?AUTO_5510 ?AUTO_5515 ) ( CLEAR ?AUTO_5510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5510 ?AUTO_5515 )
      ( MAKE-ON ?AUTO_5510 ?AUTO_5511 )
      ( MAKE-ON-VERIFY ?AUTO_5510 ?AUTO_5511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5516 - BLOCK
      ?AUTO_5517 - BLOCK
    )
    :vars
    (
      ?AUTO_5520 - BLOCK
      ?AUTO_5522 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5516 ?AUTO_5520 ) ( CLEAR ?AUTO_5516 ) ( HOLDING ?AUTO_5517 ) ( CLEAR ?AUTO_5522 ) )
    :subtasks
    ( ( !STACK ?AUTO_5517 ?AUTO_5522 )
      ( MAKE-ON ?AUTO_5516 ?AUTO_5517 )
      ( MAKE-ON-VERIFY ?AUTO_5516 ?AUTO_5517 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5592 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5592 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5592 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5592 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5594 - BLOCK
    )
    :vars
    (
      ?AUTO_5597 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5594 ?AUTO_5597 ) ( CLEAR ?AUTO_5594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5594 ?AUTO_5597 )
      ( MAKE-ON-TABLE ?AUTO_5594 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5594 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5598 - BLOCK
    )
    :vars
    (
      ?AUTO_5600 - BLOCK
      ?AUTO_5601 - BLOCK
      ?AUTO_5602 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5598 ?AUTO_5600 ) ( CLEAR ?AUTO_5598 ) ( HOLDING ?AUTO_5601 ) ( CLEAR ?AUTO_5602 ) )
    :subtasks
    ( ( !STACK ?AUTO_5601 ?AUTO_5602 )
      ( MAKE-ON-TABLE ?AUTO_5598 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5598 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5605 - BLOCK
    )
    :vars
    (
      ?AUTO_5607 - BLOCK
      ?AUTO_5609 - BLOCK
      ?AUTO_5606 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5605 ?AUTO_5607 ) ( CLEAR ?AUTO_5609 ) ( ON ?AUTO_5606 ?AUTO_5605 ) ( CLEAR ?AUTO_5606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5606 ?AUTO_5605 )
      ( MAKE-ON-TABLE ?AUTO_5605 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5605 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5612 - BLOCK
    )
    :vars
    (
      ?AUTO_5614 - BLOCK
      ?AUTO_5616 - BLOCK
      ?AUTO_5615 - BLOCK
      ?AUTO_5617 - BLOCK
      ?AUTO_5618 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5612 ?AUTO_5614 ) ( CLEAR ?AUTO_5616 ) ( ON ?AUTO_5615 ?AUTO_5612 ) ( CLEAR ?AUTO_5615 ) ( HOLDING ?AUTO_5617 ) ( CLEAR ?AUTO_5618 ) )
    :subtasks
    ( ( !STACK ?AUTO_5617 ?AUTO_5618 )
      ( MAKE-ON-TABLE ?AUTO_5612 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5612 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5619 - BLOCK
    )
    :vars
    (
      ?AUTO_5621 - BLOCK
      ?AUTO_5620 - BLOCK
      ?AUTO_5624 - BLOCK
      ?AUTO_5625 - BLOCK
      ?AUTO_5623 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5619 ?AUTO_5621 ) ( CLEAR ?AUTO_5620 ) ( ON ?AUTO_5624 ?AUTO_5619 ) ( CLEAR ?AUTO_5625 ) ( ON ?AUTO_5623 ?AUTO_5624 ) ( CLEAR ?AUTO_5623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5623 ?AUTO_5624 )
      ( MAKE-ON-TABLE ?AUTO_5619 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5619 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5628 - BLOCK
    )
    :vars
    (
      ?AUTO_5633 - BLOCK
      ?AUTO_5630 - BLOCK
      ?AUTO_5632 - BLOCK
      ?AUTO_5629 - BLOCK
      ?AUTO_5634 - BLOCK
      ?AUTO_5635 - BLOCK
      ?AUTO_5636 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5628 ?AUTO_5633 ) ( CLEAR ?AUTO_5630 ) ( ON ?AUTO_5632 ?AUTO_5628 ) ( CLEAR ?AUTO_5629 ) ( ON ?AUTO_5634 ?AUTO_5632 ) ( CLEAR ?AUTO_5634 ) ( HOLDING ?AUTO_5635 ) ( CLEAR ?AUTO_5636 ) )
    :subtasks
    ( ( !STACK ?AUTO_5635 ?AUTO_5636 )
      ( MAKE-ON-TABLE ?AUTO_5628 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5656 - BLOCK
      ?AUTO_5657 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5656 ) ( CLEAR ?AUTO_5657 ) )
    :subtasks
    ( ( !STACK ?AUTO_5656 ?AUTO_5657 )
      ( MAKE-ON-VERIFY ?AUTO_5656 ?AUTO_5657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5660 - BLOCK
      ?AUTO_5661 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5661 ) ( ON-TABLE ?AUTO_5660 ) ( CLEAR ?AUTO_5660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5660 )
      ( MAKE-ON ?AUTO_5660 ?AUTO_5661 )
      ( MAKE-ON-VERIFY ?AUTO_5660 ?AUTO_5661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5665 - BLOCK
      ?AUTO_5666 - BLOCK
    )
    :vars
    (
      ?AUTO_5669 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5666 ) ( ON-TABLE ?AUTO_5665 ) ( CLEAR ?AUTO_5665 ) ( HOLDING ?AUTO_5669 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5669 )
      ( MAKE-ON ?AUTO_5665 ?AUTO_5666 )
      ( MAKE-ON-VERIFY ?AUTO_5665 ?AUTO_5666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5670 - BLOCK
      ?AUTO_5671 - BLOCK
    )
    :vars
    (
      ?AUTO_5674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5671 ) ( ON-TABLE ?AUTO_5670 ) ( ON ?AUTO_5674 ?AUTO_5670 ) ( CLEAR ?AUTO_5674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5674 ?AUTO_5670 )
      ( MAKE-ON ?AUTO_5670 ?AUTO_5671 )
      ( MAKE-ON-VERIFY ?AUTO_5670 ?AUTO_5671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5677 - BLOCK
      ?AUTO_5678 - BLOCK
    )
    :vars
    (
      ?AUTO_5680 - BLOCK
      ?AUTO_5682 - BLOCK
      ?AUTO_5683 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5678 ) ( ON-TABLE ?AUTO_5677 ) ( ON ?AUTO_5680 ?AUTO_5677 ) ( CLEAR ?AUTO_5680 ) ( HOLDING ?AUTO_5682 ) ( CLEAR ?AUTO_5683 ) )
    :subtasks
    ( ( !STACK ?AUTO_5682 ?AUTO_5683 )
      ( MAKE-ON ?AUTO_5677 ?AUTO_5678 )
      ( MAKE-ON-VERIFY ?AUTO_5677 ?AUTO_5678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5684 - BLOCK
      ?AUTO_5685 - BLOCK
    )
    :vars
    (
      ?AUTO_5686 - BLOCK
      ?AUTO_5690 - BLOCK
      ?AUTO_5689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5684 ) ( ON ?AUTO_5686 ?AUTO_5684 ) ( CLEAR ?AUTO_5686 ) ( CLEAR ?AUTO_5690 ) ( ON ?AUTO_5689 ?AUTO_5685 ) ( CLEAR ?AUTO_5689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5689 ?AUTO_5685 )
      ( MAKE-ON ?AUTO_5684 ?AUTO_5685 )
      ( MAKE-ON-VERIFY ?AUTO_5684 ?AUTO_5685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5693 - BLOCK
      ?AUTO_5694 - BLOCK
    )
    :vars
    (
      ?AUTO_5698 - BLOCK
      ?AUTO_5699 - BLOCK
      ?AUTO_5695 - BLOCK
      ?AUTO_5701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5693 ) ( ON ?AUTO_5698 ?AUTO_5693 ) ( CLEAR ?AUTO_5698 ) ( ON ?AUTO_5699 ?AUTO_5694 ) ( CLEAR ?AUTO_5699 ) ( HOLDING ?AUTO_5695 ) ( CLEAR ?AUTO_5701 ) )
    :subtasks
    ( ( !STACK ?AUTO_5695 ?AUTO_5701 )
      ( MAKE-ON ?AUTO_5693 ?AUTO_5694 )
      ( MAKE-ON-VERIFY ?AUTO_5693 ?AUTO_5694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5702 - BLOCK
      ?AUTO_5703 - BLOCK
    )
    :vars
    (
      ?AUTO_5704 - BLOCK
      ?AUTO_5705 - BLOCK
      ?AUTO_5707 - BLOCK
      ?AUTO_5706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5702 ) ( ON ?AUTO_5704 ?AUTO_5702 ) ( ON ?AUTO_5705 ?AUTO_5703 ) ( CLEAR ?AUTO_5705 ) ( CLEAR ?AUTO_5707 ) ( ON ?AUTO_5706 ?AUTO_5704 ) ( CLEAR ?AUTO_5706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5706 ?AUTO_5704 )
      ( MAKE-ON ?AUTO_5702 ?AUTO_5703 )
      ( MAKE-ON-VERIFY ?AUTO_5702 ?AUTO_5703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5712 - BLOCK
      ?AUTO_5713 - BLOCK
    )
    :vars
    (
      ?AUTO_5719 - BLOCK
      ?AUTO_5714 - BLOCK
      ?AUTO_5717 - BLOCK
      ?AUTO_5718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5712 ) ( ON ?AUTO_5719 ?AUTO_5712 ) ( CLEAR ?AUTO_5714 ) ( ON ?AUTO_5717 ?AUTO_5719 ) ( CLEAR ?AUTO_5717 ) ( HOLDING ?AUTO_5718 ) ( CLEAR ?AUTO_5713 ) )
    :subtasks
    ( ( !STACK ?AUTO_5718 ?AUTO_5713 )
      ( MAKE-ON ?AUTO_5712 ?AUTO_5713 )
      ( MAKE-ON-VERIFY ?AUTO_5712 ?AUTO_5713 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5722 - BLOCK
      ?AUTO_5723 - BLOCK
    )
    :vars
    (
      ?AUTO_5726 - BLOCK
      ?AUTO_5727 - BLOCK
      ?AUTO_5724 - BLOCK
      ?AUTO_5725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5722 ) ( ON ?AUTO_5726 ?AUTO_5722 ) ( CLEAR ?AUTO_5727 ) ( ON ?AUTO_5724 ?AUTO_5726 ) ( CLEAR ?AUTO_5723 ) ( ON ?AUTO_5725 ?AUTO_5724 ) ( CLEAR ?AUTO_5725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5725 ?AUTO_5724 )
      ( MAKE-ON ?AUTO_5722 ?AUTO_5723 )
      ( MAKE-ON-VERIFY ?AUTO_5722 ?AUTO_5723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5732 - BLOCK
      ?AUTO_5733 - BLOCK
    )
    :vars
    (
      ?AUTO_5738 - BLOCK
      ?AUTO_5736 - BLOCK
      ?AUTO_5739 - BLOCK
      ?AUTO_5737 - BLOCK
      ?AUTO_5740 - BLOCK
      ?AUTO_5741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5732 ) ( ON ?AUTO_5738 ?AUTO_5732 ) ( CLEAR ?AUTO_5736 ) ( ON ?AUTO_5739 ?AUTO_5738 ) ( CLEAR ?AUTO_5733 ) ( ON ?AUTO_5737 ?AUTO_5739 ) ( CLEAR ?AUTO_5737 ) ( HOLDING ?AUTO_5740 ) ( CLEAR ?AUTO_5741 ) )
    :subtasks
    ( ( !STACK ?AUTO_5740 ?AUTO_5741 )
      ( MAKE-ON ?AUTO_5732 ?AUTO_5733 )
      ( MAKE-ON-VERIFY ?AUTO_5732 ?AUTO_5733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5746 - BLOCK
      ?AUTO_5747 - BLOCK
    )
    :vars
    (
      ?AUTO_5750 - BLOCK
      ?AUTO_5752 - BLOCK
      ?AUTO_5749 - BLOCK
      ?AUTO_5755 - BLOCK
      ?AUTO_5753 - BLOCK
      ?AUTO_5754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5746 ) ( ON ?AUTO_5750 ?AUTO_5746 ) ( CLEAR ?AUTO_5752 ) ( ON ?AUTO_5749 ?AUTO_5750 ) ( ON ?AUTO_5755 ?AUTO_5749 ) ( CLEAR ?AUTO_5755 ) ( CLEAR ?AUTO_5753 ) ( ON ?AUTO_5754 ?AUTO_5747 ) ( CLEAR ?AUTO_5754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5754 ?AUTO_5747 )
      ( MAKE-ON ?AUTO_5746 ?AUTO_5747 )
      ( MAKE-ON-VERIFY ?AUTO_5746 ?AUTO_5747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5758 - BLOCK
      ?AUTO_5759 - BLOCK
    )
    :vars
    (
      ?AUTO_5767 - BLOCK
      ?AUTO_5760 - BLOCK
      ?AUTO_5762 - BLOCK
      ?AUTO_5761 - BLOCK
      ?AUTO_5764 - BLOCK
      ?AUTO_5763 - BLOCK
      ?AUTO_5768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5758 ) ( ON ?AUTO_5767 ?AUTO_5758 ) ( CLEAR ?AUTO_5760 ) ( ON ?AUTO_5762 ?AUTO_5767 ) ( ON ?AUTO_5761 ?AUTO_5762 ) ( CLEAR ?AUTO_5761 ) ( CLEAR ?AUTO_5764 ) ( ON ?AUTO_5763 ?AUTO_5759 ) ( CLEAR ?AUTO_5763 ) ( HOLDING ?AUTO_5768 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5768 )
      ( MAKE-ON ?AUTO_5758 ?AUTO_5759 )
      ( MAKE-ON-VERIFY ?AUTO_5758 ?AUTO_5759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5769 - BLOCK
      ?AUTO_5770 - BLOCK
    )
    :vars
    (
      ?AUTO_5779 - BLOCK
      ?AUTO_5775 - BLOCK
      ?AUTO_5774 - BLOCK
      ?AUTO_5777 - BLOCK
      ?AUTO_5773 - BLOCK
      ?AUTO_5771 - BLOCK
      ?AUTO_5772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5769 ) ( ON ?AUTO_5779 ?AUTO_5769 ) ( CLEAR ?AUTO_5775 ) ( ON ?AUTO_5774 ?AUTO_5779 ) ( ON ?AUTO_5777 ?AUTO_5774 ) ( CLEAR ?AUTO_5777 ) ( CLEAR ?AUTO_5773 ) ( ON ?AUTO_5771 ?AUTO_5770 ) ( ON ?AUTO_5772 ?AUTO_5771 ) ( CLEAR ?AUTO_5772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5772 ?AUTO_5771 )
      ( MAKE-ON ?AUTO_5769 ?AUTO_5770 )
      ( MAKE-ON-VERIFY ?AUTO_5769 ?AUTO_5770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5782 - BLOCK
      ?AUTO_5783 - BLOCK
    )
    :vars
    (
      ?AUTO_5791 - BLOCK
      ?AUTO_5786 - BLOCK
      ?AUTO_5792 - BLOCK
      ?AUTO_5787 - BLOCK
      ?AUTO_5788 - BLOCK
      ?AUTO_5785 - BLOCK
      ?AUTO_5790 - BLOCK
      ?AUTO_5793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5782 ) ( ON ?AUTO_5791 ?AUTO_5782 ) ( CLEAR ?AUTO_5786 ) ( ON ?AUTO_5792 ?AUTO_5791 ) ( ON ?AUTO_5787 ?AUTO_5792 ) ( CLEAR ?AUTO_5787 ) ( CLEAR ?AUTO_5788 ) ( ON ?AUTO_5785 ?AUTO_5783 ) ( ON ?AUTO_5790 ?AUTO_5785 ) ( CLEAR ?AUTO_5790 ) ( HOLDING ?AUTO_5793 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5793 )
      ( MAKE-ON ?AUTO_5782 ?AUTO_5783 )
      ( MAKE-ON-VERIFY ?AUTO_5782 ?AUTO_5783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5794 - BLOCK
      ?AUTO_5795 - BLOCK
    )
    :vars
    (
      ?AUTO_5796 - BLOCK
      ?AUTO_5803 - BLOCK
      ?AUTO_5798 - BLOCK
      ?AUTO_5800 - BLOCK
      ?AUTO_5804 - BLOCK
      ?AUTO_5797 - BLOCK
      ?AUTO_5799 - BLOCK
      ?AUTO_5805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5794 ) ( ON ?AUTO_5796 ?AUTO_5794 ) ( CLEAR ?AUTO_5803 ) ( ON ?AUTO_5798 ?AUTO_5796 ) ( ON ?AUTO_5800 ?AUTO_5798 ) ( CLEAR ?AUTO_5800 ) ( CLEAR ?AUTO_5804 ) ( ON ?AUTO_5797 ?AUTO_5795 ) ( ON ?AUTO_5799 ?AUTO_5797 ) ( ON ?AUTO_5805 ?AUTO_5799 ) ( CLEAR ?AUTO_5805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5805 ?AUTO_5799 )
      ( MAKE-ON ?AUTO_5794 ?AUTO_5795 )
      ( MAKE-ON-VERIFY ?AUTO_5794 ?AUTO_5795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5808 - BLOCK
      ?AUTO_5809 - BLOCK
    )
    :vars
    (
      ?AUTO_5813 - BLOCK
      ?AUTO_5814 - BLOCK
      ?AUTO_5812 - BLOCK
      ?AUTO_5817 - BLOCK
      ?AUTO_5815 - BLOCK
      ?AUTO_5819 - BLOCK
      ?AUTO_5818 - BLOCK
      ?AUTO_5811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5808 ) ( ON ?AUTO_5813 ?AUTO_5808 ) ( CLEAR ?AUTO_5814 ) ( ON ?AUTO_5812 ?AUTO_5813 ) ( CLEAR ?AUTO_5817 ) ( ON ?AUTO_5815 ?AUTO_5809 ) ( ON ?AUTO_5819 ?AUTO_5815 ) ( ON ?AUTO_5818 ?AUTO_5819 ) ( CLEAR ?AUTO_5818 ) ( HOLDING ?AUTO_5811 ) ( CLEAR ?AUTO_5812 ) )
    :subtasks
    ( ( !STACK ?AUTO_5811 ?AUTO_5812 )
      ( MAKE-ON ?AUTO_5808 ?AUTO_5809 )
      ( MAKE-ON-VERIFY ?AUTO_5808 ?AUTO_5809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5822 - BLOCK
      ?AUTO_5823 - BLOCK
    )
    :vars
    (
      ?AUTO_5831 - BLOCK
      ?AUTO_5833 - BLOCK
      ?AUTO_5832 - BLOCK
      ?AUTO_5826 - BLOCK
      ?AUTO_5830 - BLOCK
      ?AUTO_5825 - BLOCK
      ?AUTO_5824 - BLOCK
      ?AUTO_5829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5822 ) ( ON ?AUTO_5831 ?AUTO_5822 ) ( CLEAR ?AUTO_5833 ) ( ON ?AUTO_5832 ?AUTO_5831 ) ( CLEAR ?AUTO_5826 ) ( ON ?AUTO_5830 ?AUTO_5823 ) ( ON ?AUTO_5825 ?AUTO_5830 ) ( ON ?AUTO_5824 ?AUTO_5825 ) ( CLEAR ?AUTO_5832 ) ( ON ?AUTO_5829 ?AUTO_5824 ) ( CLEAR ?AUTO_5829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5829 ?AUTO_5824 )
      ( MAKE-ON ?AUTO_5822 ?AUTO_5823 )
      ( MAKE-ON-VERIFY ?AUTO_5822 ?AUTO_5823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5836 - BLOCK
      ?AUTO_5837 - BLOCK
    )
    :vars
    (
      ?AUTO_5845 - BLOCK
      ?AUTO_5846 - BLOCK
      ?AUTO_5847 - BLOCK
      ?AUTO_5840 - BLOCK
      ?AUTO_5838 - BLOCK
      ?AUTO_5843 - BLOCK
      ?AUTO_5844 - BLOCK
      ?AUTO_5839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5836 ) ( ON ?AUTO_5845 ?AUTO_5836 ) ( CLEAR ?AUTO_5846 ) ( CLEAR ?AUTO_5847 ) ( ON ?AUTO_5840 ?AUTO_5837 ) ( ON ?AUTO_5838 ?AUTO_5840 ) ( ON ?AUTO_5843 ?AUTO_5838 ) ( ON ?AUTO_5844 ?AUTO_5843 ) ( CLEAR ?AUTO_5844 ) ( HOLDING ?AUTO_5839 ) ( CLEAR ?AUTO_5845 ) )
    :subtasks
    ( ( !STACK ?AUTO_5839 ?AUTO_5845 )
      ( MAKE-ON ?AUTO_5836 ?AUTO_5837 )
      ( MAKE-ON-VERIFY ?AUTO_5836 ?AUTO_5837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5850 - BLOCK
      ?AUTO_5851 - BLOCK
    )
    :vars
    (
      ?AUTO_5853 - BLOCK
      ?AUTO_5852 - BLOCK
      ?AUTO_5861 - BLOCK
      ?AUTO_5854 - BLOCK
      ?AUTO_5855 - BLOCK
      ?AUTO_5857 - BLOCK
      ?AUTO_5860 - BLOCK
      ?AUTO_5858 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5850 ) ( ON ?AUTO_5853 ?AUTO_5850 ) ( CLEAR ?AUTO_5852 ) ( CLEAR ?AUTO_5861 ) ( ON ?AUTO_5854 ?AUTO_5851 ) ( ON ?AUTO_5855 ?AUTO_5854 ) ( ON ?AUTO_5857 ?AUTO_5855 ) ( ON ?AUTO_5860 ?AUTO_5857 ) ( CLEAR ?AUTO_5860 ) ( CLEAR ?AUTO_5853 ) ( ON-TABLE ?AUTO_5858 ) ( CLEAR ?AUTO_5858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5858 )
      ( MAKE-ON ?AUTO_5850 ?AUTO_5851 )
      ( MAKE-ON-VERIFY ?AUTO_5850 ?AUTO_5851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5863 - BLOCK
      ?AUTO_5864 - BLOCK
    )
    :vars
    (
      ?AUTO_5865 - BLOCK
      ?AUTO_5872 - BLOCK
      ?AUTO_5869 - BLOCK
      ?AUTO_5866 - BLOCK
      ?AUTO_5871 - BLOCK
      ?AUTO_5874 - BLOCK
      ?AUTO_5873 - BLOCK
      ?AUTO_5870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5863 ) ( CLEAR ?AUTO_5865 ) ( CLEAR ?AUTO_5872 ) ( ON ?AUTO_5869 ?AUTO_5864 ) ( ON ?AUTO_5866 ?AUTO_5869 ) ( ON ?AUTO_5871 ?AUTO_5866 ) ( ON ?AUTO_5874 ?AUTO_5871 ) ( CLEAR ?AUTO_5874 ) ( ON-TABLE ?AUTO_5873 ) ( CLEAR ?AUTO_5873 ) ( HOLDING ?AUTO_5870 ) ( CLEAR ?AUTO_5863 ) )
    :subtasks
    ( ( !STACK ?AUTO_5870 ?AUTO_5863 )
      ( MAKE-ON ?AUTO_5863 ?AUTO_5864 )
      ( MAKE-ON-VERIFY ?AUTO_5863 ?AUTO_5864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5877 - BLOCK
      ?AUTO_5878 - BLOCK
    )
    :vars
    (
      ?AUTO_5885 - BLOCK
      ?AUTO_5882 - BLOCK
      ?AUTO_5886 - BLOCK
      ?AUTO_5887 - BLOCK
      ?AUTO_5879 - BLOCK
      ?AUTO_5880 - BLOCK
      ?AUTO_5888 - BLOCK
      ?AUTO_5884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5877 ) ( CLEAR ?AUTO_5885 ) ( CLEAR ?AUTO_5882 ) ( ON ?AUTO_5886 ?AUTO_5878 ) ( ON ?AUTO_5887 ?AUTO_5886 ) ( ON ?AUTO_5879 ?AUTO_5887 ) ( ON ?AUTO_5880 ?AUTO_5879 ) ( CLEAR ?AUTO_5880 ) ( ON-TABLE ?AUTO_5888 ) ( CLEAR ?AUTO_5877 ) ( ON ?AUTO_5884 ?AUTO_5888 ) ( CLEAR ?AUTO_5884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5884 ?AUTO_5888 )
      ( MAKE-ON ?AUTO_5877 ?AUTO_5878 )
      ( MAKE-ON-VERIFY ?AUTO_5877 ?AUTO_5878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5897 - BLOCK
      ?AUTO_5898 - BLOCK
    )
    :vars
    (
      ?AUTO_5904 - BLOCK
      ?AUTO_5900 - BLOCK
      ?AUTO_5908 - BLOCK
      ?AUTO_5906 - BLOCK
      ?AUTO_5899 - BLOCK
      ?AUTO_5901 - BLOCK
      ?AUTO_5907 - BLOCK
      ?AUTO_5902 - BLOCK
      ?AUTO_5910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5897 ) ( CLEAR ?AUTO_5904 ) ( CLEAR ?AUTO_5900 ) ( ON ?AUTO_5908 ?AUTO_5898 ) ( ON ?AUTO_5906 ?AUTO_5908 ) ( ON ?AUTO_5899 ?AUTO_5906 ) ( ON ?AUTO_5901 ?AUTO_5899 ) ( CLEAR ?AUTO_5901 ) ( ON-TABLE ?AUTO_5907 ) ( CLEAR ?AUTO_5907 ) ( CLEAR ?AUTO_5897 ) ( ON ?AUTO_5902 ?AUTO_5910 ) ( CLEAR ?AUTO_5902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5902 ?AUTO_5910 )
      ( MAKE-ON ?AUTO_5897 ?AUTO_5898 )
      ( MAKE-ON-VERIFY ?AUTO_5897 ?AUTO_5898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5913 - BLOCK
      ?AUTO_5914 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5913 ) ( CLEAR ?AUTO_5914 ) )
    :subtasks
    ( ( !STACK ?AUTO_5913 ?AUTO_5914 )
      ( MAKE-ON-VERIFY ?AUTO_5913 ?AUTO_5914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5917 - BLOCK
      ?AUTO_5918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5918 ) ( ON-TABLE ?AUTO_5917 ) ( CLEAR ?AUTO_5917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5917 )
      ( MAKE-ON ?AUTO_5917 ?AUTO_5918 )
      ( MAKE-ON-VERIFY ?AUTO_5917 ?AUTO_5918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5922 - BLOCK
      ?AUTO_5923 - BLOCK
    )
    :vars
    (
      ?AUTO_5927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5922 ) ( CLEAR ?AUTO_5922 ) ( HOLDING ?AUTO_5923 ) ( CLEAR ?AUTO_5927 ) )
    :subtasks
    ( ( !STACK ?AUTO_5923 ?AUTO_5927 )
      ( MAKE-ON ?AUTO_5922 ?AUTO_5923 )
      ( MAKE-ON-VERIFY ?AUTO_5922 ?AUTO_5923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6245 - BLOCK
      ?AUTO_6246 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6245 ) ( CLEAR ?AUTO_6246 ) )
    :subtasks
    ( ( !STACK ?AUTO_6245 ?AUTO_6246 )
      ( MAKE-ON-VERIFY ?AUTO_6245 ?AUTO_6246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6249 - BLOCK
      ?AUTO_6250 - BLOCK
    )
    :vars
    (
      ?AUTO_6254 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6250 ) ( ON ?AUTO_6249 ?AUTO_6254 ) ( CLEAR ?AUTO_6249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6249 ?AUTO_6254 )
      ( MAKE-ON ?AUTO_6249 ?AUTO_6250 )
      ( MAKE-ON-VERIFY ?AUTO_6249 ?AUTO_6250 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6255 - BLOCK
      ?AUTO_6256 - BLOCK
    )
    :vars
    (
      ?AUTO_6259 - BLOCK
      ?AUTO_6260 - BLOCK
      ?AUTO_6261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6256 ) ( ON ?AUTO_6255 ?AUTO_6259 ) ( CLEAR ?AUTO_6255 ) ( HOLDING ?AUTO_6260 ) ( CLEAR ?AUTO_6261 ) )
    :subtasks
    ( ( !STACK ?AUTO_6260 ?AUTO_6261 )
      ( MAKE-ON ?AUTO_6255 ?AUTO_6256 )
      ( MAKE-ON-VERIFY ?AUTO_6255 ?AUTO_6256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6300 - BLOCK
      ?AUTO_6301 - BLOCK
    )
    :vars
    (
      ?AUTO_6304 - BLOCK
      ?AUTO_6302 - BLOCK
      ?AUTO_6306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6304 ) ( ON ?AUTO_6302 ?AUTO_6301 ) ( CLEAR ?AUTO_6302 ) ( HOLDING ?AUTO_6300 ) ( CLEAR ?AUTO_6306 ) )
    :subtasks
    ( ( !STACK ?AUTO_6300 ?AUTO_6306 )
      ( MAKE-ON ?AUTO_6300 ?AUTO_6301 )
      ( MAKE-ON-VERIFY ?AUTO_6300 ?AUTO_6301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6329 - BLOCK
      ?AUTO_6330 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6329 ) ( CLEAR ?AUTO_6330 ) )
    :subtasks
    ( ( !STACK ?AUTO_6329 ?AUTO_6330 )
      ( MAKE-ON-VERIFY ?AUTO_6329 ?AUTO_6330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6333 - BLOCK
      ?AUTO_6334 - BLOCK
    )
    :vars
    (
      ?AUTO_6338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6334 ) ( ON ?AUTO_6333 ?AUTO_6338 ) ( CLEAR ?AUTO_6333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6333 ?AUTO_6338 )
      ( MAKE-ON ?AUTO_6333 ?AUTO_6334 )
      ( MAKE-ON-VERIFY ?AUTO_6333 ?AUTO_6334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6339 - BLOCK
      ?AUTO_6340 - BLOCK
    )
    :vars
    (
      ?AUTO_6343 - BLOCK
      ?AUTO_6344 - BLOCK
      ?AUTO_6345 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6340 ) ( ON ?AUTO_6339 ?AUTO_6343 ) ( CLEAR ?AUTO_6339 ) ( HOLDING ?AUTO_6344 ) ( CLEAR ?AUTO_6345 ) )
    :subtasks
    ( ( !STACK ?AUTO_6344 ?AUTO_6345 )
      ( MAKE-ON ?AUTO_6339 ?AUTO_6340 )
      ( MAKE-ON-VERIFY ?AUTO_6339 ?AUTO_6340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6346 - BLOCK
      ?AUTO_6347 - BLOCK
    )
    :vars
    (
      ?AUTO_6350 - BLOCK
      ?AUTO_6352 - BLOCK
      ?AUTO_6351 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6347 ) ( ON ?AUTO_6346 ?AUTO_6350 ) ( CLEAR ?AUTO_6352 ) ( ON ?AUTO_6351 ?AUTO_6346 ) ( CLEAR ?AUTO_6351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6351 ?AUTO_6346 )
      ( MAKE-ON ?AUTO_6346 ?AUTO_6347 )
      ( MAKE-ON-VERIFY ?AUTO_6346 ?AUTO_6347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6355 - BLOCK
      ?AUTO_6356 - BLOCK
    )
    :vars
    (
      ?AUTO_6361 - BLOCK
      ?AUTO_6358 - BLOCK
      ?AUTO_6357 - BLOCK
      ?AUTO_6363 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6355 ?AUTO_6361 ) ( CLEAR ?AUTO_6358 ) ( ON ?AUTO_6357 ?AUTO_6355 ) ( CLEAR ?AUTO_6357 ) ( HOLDING ?AUTO_6356 ) ( CLEAR ?AUTO_6363 ) )
    :subtasks
    ( ( !STACK ?AUTO_6356 ?AUTO_6363 )
      ( MAKE-ON ?AUTO_6355 ?AUTO_6356 )
      ( MAKE-ON-VERIFY ?AUTO_6355 ?AUTO_6356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6366 - BLOCK
      ?AUTO_6367 - BLOCK
    )
    :vars
    (
      ?AUTO_6372 - BLOCK
      ?AUTO_6368 - BLOCK
      ?AUTO_6371 - BLOCK
      ?AUTO_6373 - BLOCK
      ?AUTO_6374 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6367 ) ( ON ?AUTO_6366 ?AUTO_6372 ) ( CLEAR ?AUTO_6368 ) ( ON ?AUTO_6371 ?AUTO_6366 ) ( CLEAR ?AUTO_6371 ) ( HOLDING ?AUTO_6373 ) ( CLEAR ?AUTO_6374 ) )
    :subtasks
    ( ( !STACK ?AUTO_6373 ?AUTO_6374 )
      ( MAKE-ON ?AUTO_6366 ?AUTO_6367 )
      ( MAKE-ON-VERIFY ?AUTO_6366 ?AUTO_6367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6570 - BLOCK
      ?AUTO_6571 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6570 ) ( CLEAR ?AUTO_6571 ) )
    :subtasks
    ( ( !STACK ?AUTO_6570 ?AUTO_6571 )
      ( MAKE-ON-VERIFY ?AUTO_6570 ?AUTO_6571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6574 - BLOCK
      ?AUTO_6575 - BLOCK
    )
    :vars
    (
      ?AUTO_6579 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6575 ) ( ON ?AUTO_6574 ?AUTO_6579 ) ( CLEAR ?AUTO_6574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6574 ?AUTO_6579 )
      ( MAKE-ON ?AUTO_6574 ?AUTO_6575 )
      ( MAKE-ON-VERIFY ?AUTO_6574 ?AUTO_6575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6580 - BLOCK
      ?AUTO_6581 - BLOCK
    )
    :vars
    (
      ?AUTO_6584 - BLOCK
      ?AUTO_6586 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6580 ?AUTO_6584 ) ( CLEAR ?AUTO_6580 ) ( HOLDING ?AUTO_6581 ) ( CLEAR ?AUTO_6586 ) )
    :subtasks
    ( ( !STACK ?AUTO_6581 ?AUTO_6586 )
      ( MAKE-ON ?AUTO_6580 ?AUTO_6581 )
      ( MAKE-ON-VERIFY ?AUTO_6580 ?AUTO_6581 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6588 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6588 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6588 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6588 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6590 - BLOCK
    )
    :vars
    (
      ?AUTO_6593 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6590 ?AUTO_6593 ) ( CLEAR ?AUTO_6590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6590 ?AUTO_6593 )
      ( MAKE-ON-TABLE ?AUTO_6590 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6590 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6595 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6595 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6595 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6595 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6597 - BLOCK
    )
    :vars
    (
      ?AUTO_6600 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6597 ?AUTO_6600 ) ( CLEAR ?AUTO_6597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6597 ?AUTO_6600 )
      ( MAKE-ON-TABLE ?AUTO_6597 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6597 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6601 - BLOCK
    )
    :vars
    (
      ?AUTO_6603 - BLOCK
      ?AUTO_6604 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6601 ?AUTO_6603 ) ( CLEAR ?AUTO_6601 ) ( HOLDING ?AUTO_6604 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6604 )
      ( MAKE-ON-TABLE ?AUTO_6601 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6601 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6605 - BLOCK
    )
    :vars
    (
      ?AUTO_6607 - BLOCK
      ?AUTO_6608 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6605 ?AUTO_6607 ) ( ON ?AUTO_6608 ?AUTO_6605 ) ( CLEAR ?AUTO_6608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6608 ?AUTO_6605 )
      ( MAKE-ON-TABLE ?AUTO_6605 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6605 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6612 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6612 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6612 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6612 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6614 - BLOCK
    )
    :vars
    (
      ?AUTO_6617 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6614 ?AUTO_6617 ) ( CLEAR ?AUTO_6614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6614 ?AUTO_6617 )
      ( MAKE-ON-TABLE ?AUTO_6614 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6614 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6618 - BLOCK
    )
    :vars
    (
      ?AUTO_6620 - BLOCK
      ?AUTO_6621 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6618 ?AUTO_6620 ) ( CLEAR ?AUTO_6618 ) ( HOLDING ?AUTO_6621 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6621 )
      ( MAKE-ON-TABLE ?AUTO_6618 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6618 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6622 - BLOCK
    )
    :vars
    (
      ?AUTO_6624 - BLOCK
      ?AUTO_6625 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6622 ?AUTO_6624 ) ( ON ?AUTO_6625 ?AUTO_6622 ) ( CLEAR ?AUTO_6625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6625 ?AUTO_6622 )
      ( MAKE-ON-TABLE ?AUTO_6622 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6622 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6628 - BLOCK
    )
    :vars
    (
      ?AUTO_6629 - BLOCK
      ?AUTO_6630 - BLOCK
      ?AUTO_6632 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6628 ?AUTO_6629 ) ( ON ?AUTO_6630 ?AUTO_6628 ) ( CLEAR ?AUTO_6630 ) ( HOLDING ?AUTO_6632 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6632 )
      ( MAKE-ON-TABLE ?AUTO_6628 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6628 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6633 - BLOCK
    )
    :vars
    (
      ?AUTO_6634 - BLOCK
      ?AUTO_6636 - BLOCK
      ?AUTO_6637 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6633 ?AUTO_6634 ) ( ON ?AUTO_6636 ?AUTO_6633 ) ( ON ?AUTO_6637 ?AUTO_6636 ) ( CLEAR ?AUTO_6637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6637 ?AUTO_6636 )
      ( MAKE-ON-TABLE ?AUTO_6633 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6642 - BLOCK
      ?AUTO_6643 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6642 ) ( CLEAR ?AUTO_6643 ) )
    :subtasks
    ( ( !STACK ?AUTO_6642 ?AUTO_6643 )
      ( MAKE-ON-VERIFY ?AUTO_6642 ?AUTO_6643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6646 - BLOCK
      ?AUTO_6647 - BLOCK
    )
    :vars
    (
      ?AUTO_6651 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6647 ) ( ON ?AUTO_6646 ?AUTO_6651 ) ( CLEAR ?AUTO_6646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6646 ?AUTO_6651 )
      ( MAKE-ON ?AUTO_6646 ?AUTO_6647 )
      ( MAKE-ON-VERIFY ?AUTO_6646 ?AUTO_6647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6652 - BLOCK
      ?AUTO_6653 - BLOCK
    )
    :vars
    (
      ?AUTO_6656 - BLOCK
      ?AUTO_6657 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6653 ) ( ON ?AUTO_6652 ?AUTO_6656 ) ( CLEAR ?AUTO_6652 ) ( HOLDING ?AUTO_6657 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6657 )
      ( MAKE-ON ?AUTO_6652 ?AUTO_6653 )
      ( MAKE-ON-VERIFY ?AUTO_6652 ?AUTO_6653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6658 - BLOCK
      ?AUTO_6659 - BLOCK
    )
    :vars
    (
      ?AUTO_6662 - BLOCK
      ?AUTO_6663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6659 ) ( ON ?AUTO_6658 ?AUTO_6662 ) ( ON ?AUTO_6663 ?AUTO_6658 ) ( CLEAR ?AUTO_6663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6663 ?AUTO_6658 )
      ( MAKE-ON ?AUTO_6658 ?AUTO_6659 )
      ( MAKE-ON-VERIFY ?AUTO_6658 ?AUTO_6659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6666 - BLOCK
      ?AUTO_6667 - BLOCK
    )
    :vars
    (
      ?AUTO_6671 - BLOCK
      ?AUTO_6668 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6666 ?AUTO_6671 ) ( ON ?AUTO_6668 ?AUTO_6666 ) ( CLEAR ?AUTO_6668 ) ( HOLDING ?AUTO_6667 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6667 )
      ( MAKE-ON ?AUTO_6666 ?AUTO_6667 )
      ( MAKE-ON-VERIFY ?AUTO_6666 ?AUTO_6667 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6673 - BLOCK
      ?AUTO_6674 - BLOCK
    )
    :vars
    (
      ?AUTO_6678 - BLOCK
      ?AUTO_6675 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6673 ?AUTO_6678 ) ( ON ?AUTO_6675 ?AUTO_6673 ) ( ON ?AUTO_6674 ?AUTO_6675 ) ( CLEAR ?AUTO_6674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6674 ?AUTO_6675 )
      ( MAKE-ON ?AUTO_6673 ?AUTO_6674 )
      ( MAKE-ON-VERIFY ?AUTO_6673 ?AUTO_6674 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6681 - BLOCK
      ?AUTO_6682 - BLOCK
    )
    :vars
    (
      ?AUTO_6685 - BLOCK
      ?AUTO_6684 - BLOCK
      ?AUTO_6687 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6681 ?AUTO_6685 ) ( ON ?AUTO_6684 ?AUTO_6681 ) ( ON ?AUTO_6682 ?AUTO_6684 ) ( CLEAR ?AUTO_6682 ) ( HOLDING ?AUTO_6687 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6687 )
      ( MAKE-ON ?AUTO_6681 ?AUTO_6682 )
      ( MAKE-ON-VERIFY ?AUTO_6681 ?AUTO_6682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6688 - BLOCK
      ?AUTO_6689 - BLOCK
    )
    :vars
    (
      ?AUTO_6693 - BLOCK
      ?AUTO_6692 - BLOCK
      ?AUTO_6694 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6688 ?AUTO_6693 ) ( ON ?AUTO_6692 ?AUTO_6688 ) ( ON ?AUTO_6689 ?AUTO_6692 ) ( ON ?AUTO_6694 ?AUTO_6689 ) ( CLEAR ?AUTO_6694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6694 ?AUTO_6689 )
      ( MAKE-ON ?AUTO_6688 ?AUTO_6689 )
      ( MAKE-ON-VERIFY ?AUTO_6688 ?AUTO_6689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6699 - BLOCK
      ?AUTO_6700 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6699 ) ( CLEAR ?AUTO_6700 ) )
    :subtasks
    ( ( !STACK ?AUTO_6699 ?AUTO_6700 )
      ( MAKE-ON-VERIFY ?AUTO_6699 ?AUTO_6700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6703 - BLOCK
      ?AUTO_6704 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6704 ) ( ON-TABLE ?AUTO_6703 ) ( CLEAR ?AUTO_6703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6703 )
      ( MAKE-ON ?AUTO_6703 ?AUTO_6704 )
      ( MAKE-ON-VERIFY ?AUTO_6703 ?AUTO_6704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6708 - BLOCK
      ?AUTO_6709 - BLOCK
    )
    :vars
    (
      ?AUTO_6712 - BLOCK
      ?AUTO_6713 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6709 ) ( ON-TABLE ?AUTO_6708 ) ( CLEAR ?AUTO_6708 ) ( HOLDING ?AUTO_6712 ) ( CLEAR ?AUTO_6713 ) )
    :subtasks
    ( ( !STACK ?AUTO_6712 ?AUTO_6713 )
      ( MAKE-ON ?AUTO_6708 ?AUTO_6709 )
      ( MAKE-ON-VERIFY ?AUTO_6708 ?AUTO_6709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6714 - BLOCK
      ?AUTO_6715 - BLOCK
    )
    :vars
    (
      ?AUTO_6717 - BLOCK
      ?AUTO_6719 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6714 ) ( CLEAR ?AUTO_6714 ) ( CLEAR ?AUTO_6717 ) ( ON ?AUTO_6719 ?AUTO_6715 ) ( CLEAR ?AUTO_6719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6719 ?AUTO_6715 )
      ( MAKE-ON ?AUTO_6714 ?AUTO_6715 )
      ( MAKE-ON-VERIFY ?AUTO_6714 ?AUTO_6715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6722 - BLOCK
      ?AUTO_6723 - BLOCK
    )
    :vars
    (
      ?AUTO_6726 - BLOCK
      ?AUTO_6727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6726 ) ( ON ?AUTO_6727 ?AUTO_6723 ) ( CLEAR ?AUTO_6727 ) ( HOLDING ?AUTO_6722 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6722 )
      ( MAKE-ON ?AUTO_6722 ?AUTO_6723 )
      ( MAKE-ON-VERIFY ?AUTO_6722 ?AUTO_6723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6729 - BLOCK
      ?AUTO_6730 - BLOCK
    )
    :vars
    (
      ?AUTO_6732 - BLOCK
      ?AUTO_6733 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6732 ) ( ON ?AUTO_6733 ?AUTO_6730 ) ( ON ?AUTO_6729 ?AUTO_6733 ) ( CLEAR ?AUTO_6729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6729 ?AUTO_6733 )
      ( MAKE-ON ?AUTO_6729 ?AUTO_6730 )
      ( MAKE-ON-VERIFY ?AUTO_6729 ?AUTO_6730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6737 - BLOCK
      ?AUTO_6738 - BLOCK
    )
    :vars
    (
      ?AUTO_6741 - BLOCK
      ?AUTO_6740 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6741 ?AUTO_6738 ) ( ON ?AUTO_6737 ?AUTO_6741 ) ( CLEAR ?AUTO_6737 ) ( HOLDING ?AUTO_6740 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6740 )
      ( MAKE-ON ?AUTO_6737 ?AUTO_6738 )
      ( MAKE-ON-VERIFY ?AUTO_6737 ?AUTO_6738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6744 - BLOCK
      ?AUTO_6745 - BLOCK
    )
    :vars
    (
      ?AUTO_6749 - BLOCK
      ?AUTO_6748 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6749 ?AUTO_6745 ) ( ON ?AUTO_6744 ?AUTO_6749 ) ( ON ?AUTO_6748 ?AUTO_6744 ) ( CLEAR ?AUTO_6748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6748 ?AUTO_6744 )
      ( MAKE-ON ?AUTO_6744 ?AUTO_6745 )
      ( MAKE-ON-VERIFY ?AUTO_6744 ?AUTO_6745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6752 - BLOCK
      ?AUTO_6753 - BLOCK
    )
    :vars
    (
      ?AUTO_6757 - BLOCK
      ?AUTO_6755 - BLOCK
      ?AUTO_6758 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6757 ?AUTO_6753 ) ( ON ?AUTO_6752 ?AUTO_6757 ) ( ON ?AUTO_6755 ?AUTO_6752 ) ( CLEAR ?AUTO_6755 ) ( HOLDING ?AUTO_6758 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6758 )
      ( MAKE-ON ?AUTO_6752 ?AUTO_6753 )
      ( MAKE-ON-VERIFY ?AUTO_6752 ?AUTO_6753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6759 - BLOCK
      ?AUTO_6760 - BLOCK
    )
    :vars
    (
      ?AUTO_6762 - BLOCK
      ?AUTO_6761 - BLOCK
      ?AUTO_6765 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6762 ?AUTO_6760 ) ( ON ?AUTO_6759 ?AUTO_6762 ) ( ON ?AUTO_6761 ?AUTO_6759 ) ( ON ?AUTO_6765 ?AUTO_6761 ) ( CLEAR ?AUTO_6765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6765 ?AUTO_6761 )
      ( MAKE-ON ?AUTO_6759 ?AUTO_6760 )
      ( MAKE-ON-VERIFY ?AUTO_6759 ?AUTO_6760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6768 - BLOCK
      ?AUTO_6769 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6768 ) ( CLEAR ?AUTO_6769 ) )
    :subtasks
    ( ( !STACK ?AUTO_6768 ?AUTO_6769 )
      ( MAKE-ON-VERIFY ?AUTO_6768 ?AUTO_6769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6772 - BLOCK
      ?AUTO_6773 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6773 ) ( ON-TABLE ?AUTO_6772 ) ( CLEAR ?AUTO_6772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6772 )
      ( MAKE-ON ?AUTO_6772 ?AUTO_6773 )
      ( MAKE-ON-VERIFY ?AUTO_6772 ?AUTO_6773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6779 - BLOCK
      ?AUTO_6780 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6779 ) ( CLEAR ?AUTO_6780 ) )
    :subtasks
    ( ( !STACK ?AUTO_6779 ?AUTO_6780 )
      ( MAKE-ON-VERIFY ?AUTO_6779 ?AUTO_6780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6783 - BLOCK
      ?AUTO_6784 - BLOCK
    )
    :vars
    (
      ?AUTO_6788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6784 ) ( ON ?AUTO_6783 ?AUTO_6788 ) ( CLEAR ?AUTO_6783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6783 ?AUTO_6788 )
      ( MAKE-ON ?AUTO_6783 ?AUTO_6784 )
      ( MAKE-ON-VERIFY ?AUTO_6783 ?AUTO_6784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6789 - BLOCK
      ?AUTO_6790 - BLOCK
    )
    :vars
    (
      ?AUTO_6793 - BLOCK
      ?AUTO_6795 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6789 ?AUTO_6793 ) ( CLEAR ?AUTO_6789 ) ( HOLDING ?AUTO_6790 ) ( CLEAR ?AUTO_6795 ) )
    :subtasks
    ( ( !STACK ?AUTO_6790 ?AUTO_6795 )
      ( MAKE-ON ?AUTO_6789 ?AUTO_6790 )
      ( MAKE-ON-VERIFY ?AUTO_6789 ?AUTO_6790 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6799 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6799 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6799 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6799 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6801 - BLOCK
    )
    :vars
    (
      ?AUTO_6804 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6801 ?AUTO_6804 ) ( CLEAR ?AUTO_6801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6801 ?AUTO_6804 )
      ( MAKE-ON-TABLE ?AUTO_6801 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6801 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6805 - BLOCK
    )
    :vars
    (
      ?AUTO_6807 - BLOCK
      ?AUTO_6808 - BLOCK
      ?AUTO_6809 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6805 ?AUTO_6807 ) ( CLEAR ?AUTO_6805 ) ( HOLDING ?AUTO_6808 ) ( CLEAR ?AUTO_6809 ) )
    :subtasks
    ( ( !STACK ?AUTO_6808 ?AUTO_6809 )
      ( MAKE-ON-TABLE ?AUTO_6805 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6805 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6810 - BLOCK
    )
    :vars
    (
      ?AUTO_6812 - BLOCK
      ?AUTO_6814 - BLOCK
      ?AUTO_6813 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6810 ?AUTO_6812 ) ( CLEAR ?AUTO_6814 ) ( ON ?AUTO_6813 ?AUTO_6810 ) ( CLEAR ?AUTO_6813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6813 ?AUTO_6810 )
      ( MAKE-ON-TABLE ?AUTO_6810 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6810 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6817 - BLOCK
    )
    :vars
    (
      ?AUTO_6820 - BLOCK
      ?AUTO_6821 - BLOCK
      ?AUTO_6818 - BLOCK
      ?AUTO_6823 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6817 ?AUTO_6820 ) ( ON ?AUTO_6821 ?AUTO_6817 ) ( CLEAR ?AUTO_6821 ) ( HOLDING ?AUTO_6818 ) ( CLEAR ?AUTO_6823 ) )
    :subtasks
    ( ( !STACK ?AUTO_6818 ?AUTO_6823 )
      ( MAKE-ON-TABLE ?AUTO_6817 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6827 - BLOCK
      ?AUTO_6828 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6827 ) ( CLEAR ?AUTO_6828 ) )
    :subtasks
    ( ( !STACK ?AUTO_6827 ?AUTO_6828 )
      ( MAKE-ON-VERIFY ?AUTO_6827 ?AUTO_6828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6831 - BLOCK
      ?AUTO_6832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6832 ) ( ON-TABLE ?AUTO_6831 ) ( CLEAR ?AUTO_6831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6831 )
      ( MAKE-ON ?AUTO_6831 ?AUTO_6832 )
      ( MAKE-ON-VERIFY ?AUTO_6831 ?AUTO_6832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6836 - BLOCK
      ?AUTO_6837 - BLOCK
    )
    :vars
    (
      ?AUTO_6840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6837 ) ( ON-TABLE ?AUTO_6836 ) ( CLEAR ?AUTO_6836 ) ( HOLDING ?AUTO_6840 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6840 )
      ( MAKE-ON ?AUTO_6836 ?AUTO_6837 )
      ( MAKE-ON-VERIFY ?AUTO_6836 ?AUTO_6837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6841 - BLOCK
      ?AUTO_6842 - BLOCK
    )
    :vars
    (
      ?AUTO_6845 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6842 ) ( ON-TABLE ?AUTO_6841 ) ( ON ?AUTO_6845 ?AUTO_6841 ) ( CLEAR ?AUTO_6845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6845 ?AUTO_6841 )
      ( MAKE-ON ?AUTO_6841 ?AUTO_6842 )
      ( MAKE-ON-VERIFY ?AUTO_6841 ?AUTO_6842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6848 - BLOCK
      ?AUTO_6849 - BLOCK
    )
    :vars
    (
      ?AUTO_6850 - BLOCK
      ?AUTO_6854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6848 ) ( ON ?AUTO_6850 ?AUTO_6848 ) ( CLEAR ?AUTO_6850 ) ( HOLDING ?AUTO_6849 ) ( CLEAR ?AUTO_6854 ) )
    :subtasks
    ( ( !STACK ?AUTO_6849 ?AUTO_6854 )
      ( MAKE-ON ?AUTO_6848 ?AUTO_6849 )
      ( MAKE-ON-VERIFY ?AUTO_6848 ?AUTO_6849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6855 - BLOCK
      ?AUTO_6856 - BLOCK
    )
    :vars
    (
      ?AUTO_6857 - BLOCK
      ?AUTO_6860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6855 ) ( ON ?AUTO_6857 ?AUTO_6855 ) ( CLEAR ?AUTO_6860 ) ( ON ?AUTO_6856 ?AUTO_6857 ) ( CLEAR ?AUTO_6856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6856 ?AUTO_6857 )
      ( MAKE-ON ?AUTO_6855 ?AUTO_6856 )
      ( MAKE-ON-VERIFY ?AUTO_6855 ?AUTO_6856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6863 - BLOCK
      ?AUTO_6864 - BLOCK
    )
    :vars
    (
      ?AUTO_6868 - BLOCK
      ?AUTO_6867 - BLOCK
      ?AUTO_6870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6863 ) ( ON ?AUTO_6868 ?AUTO_6863 ) ( ON ?AUTO_6864 ?AUTO_6868 ) ( CLEAR ?AUTO_6864 ) ( HOLDING ?AUTO_6867 ) ( CLEAR ?AUTO_6870 ) )
    :subtasks
    ( ( !STACK ?AUTO_6867 ?AUTO_6870 )
      ( MAKE-ON ?AUTO_6863 ?AUTO_6864 )
      ( MAKE-ON-VERIFY ?AUTO_6863 ?AUTO_6864 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6872 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6872 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6872 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6872 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6874 - BLOCK
    )
    :vars
    (
      ?AUTO_6877 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6874 ?AUTO_6877 ) ( CLEAR ?AUTO_6874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6874 ?AUTO_6877 )
      ( MAKE-ON-TABLE ?AUTO_6874 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6874 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6879 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6879 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6879 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6879 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6881 - BLOCK
    )
    :vars
    (
      ?AUTO_6884 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6881 ?AUTO_6884 ) ( CLEAR ?AUTO_6881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6881 ?AUTO_6884 )
      ( MAKE-ON-TABLE ?AUTO_6881 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6881 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6885 - BLOCK
    )
    :vars
    (
      ?AUTO_6887 - BLOCK
      ?AUTO_6888 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6885 ?AUTO_6887 ) ( CLEAR ?AUTO_6885 ) ( HOLDING ?AUTO_6888 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6888 )
      ( MAKE-ON-TABLE ?AUTO_6885 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6892 - BLOCK
      ?AUTO_6893 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6892 ) ( CLEAR ?AUTO_6893 ) )
    :subtasks
    ( ( !STACK ?AUTO_6892 ?AUTO_6893 )
      ( MAKE-ON-VERIFY ?AUTO_6892 ?AUTO_6893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6896 - BLOCK
      ?AUTO_6897 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6897 ) ( ON-TABLE ?AUTO_6896 ) ( CLEAR ?AUTO_6896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6896 )
      ( MAKE-ON ?AUTO_6896 ?AUTO_6897 )
      ( MAKE-ON-VERIFY ?AUTO_6896 ?AUTO_6897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6901 - BLOCK
      ?AUTO_6902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6901 ) ( CLEAR ?AUTO_6901 ) ( HOLDING ?AUTO_6902 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6902 )
      ( MAKE-ON ?AUTO_6901 ?AUTO_6902 )
      ( MAKE-ON-VERIFY ?AUTO_6901 ?AUTO_6902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6906 - BLOCK
      ?AUTO_6907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6906 ) ( ON ?AUTO_6907 ?AUTO_6906 ) ( CLEAR ?AUTO_6907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6907 ?AUTO_6906 )
      ( MAKE-ON ?AUTO_6906 ?AUTO_6907 )
      ( MAKE-ON-VERIFY ?AUTO_6906 ?AUTO_6907 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6912 - BLOCK
      ?AUTO_6913 - BLOCK
    )
    :vars
    (
      ?AUTO_6916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6912 ) ( ON ?AUTO_6913 ?AUTO_6912 ) ( CLEAR ?AUTO_6913 ) ( HOLDING ?AUTO_6916 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6916 )
      ( MAKE-ON ?AUTO_6912 ?AUTO_6913 )
      ( MAKE-ON-VERIFY ?AUTO_6912 ?AUTO_6913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6921 - BLOCK
      ?AUTO_6922 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6921 ) ( CLEAR ?AUTO_6922 ) )
    :subtasks
    ( ( !STACK ?AUTO_6921 ?AUTO_6922 )
      ( MAKE-ON-VERIFY ?AUTO_6921 ?AUTO_6922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6925 - BLOCK
      ?AUTO_6926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6926 ) ( ON-TABLE ?AUTO_6925 ) ( CLEAR ?AUTO_6925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6925 )
      ( MAKE-ON ?AUTO_6925 ?AUTO_6926 )
      ( MAKE-ON-VERIFY ?AUTO_6925 ?AUTO_6926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6930 - BLOCK
      ?AUTO_6931 - BLOCK
    )
    :vars
    (
      ?AUTO_6935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6930 ) ( CLEAR ?AUTO_6930 ) ( HOLDING ?AUTO_6931 ) ( CLEAR ?AUTO_6935 ) )
    :subtasks
    ( ( !STACK ?AUTO_6931 ?AUTO_6935 )
      ( MAKE-ON ?AUTO_6930 ?AUTO_6931 )
      ( MAKE-ON-VERIFY ?AUTO_6930 ?AUTO_6931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6938 - BLOCK
      ?AUTO_6939 - BLOCK
    )
    :vars
    (
      ?AUTO_6942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6939 ) ( ON-TABLE ?AUTO_6938 ) ( CLEAR ?AUTO_6938 ) ( HOLDING ?AUTO_6942 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6942 )
      ( MAKE-ON ?AUTO_6938 ?AUTO_6939 )
      ( MAKE-ON-VERIFY ?AUTO_6938 ?AUTO_6939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6943 - BLOCK
      ?AUTO_6944 - BLOCK
    )
    :vars
    (
      ?AUTO_6947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6943 ) ( CLEAR ?AUTO_6943 ) ( ON ?AUTO_6947 ?AUTO_6944 ) ( CLEAR ?AUTO_6947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6947 ?AUTO_6944 )
      ( MAKE-ON ?AUTO_6943 ?AUTO_6944 )
      ( MAKE-ON-VERIFY ?AUTO_6943 ?AUTO_6944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6950 - BLOCK
      ?AUTO_6951 - BLOCK
    )
    :vars
    (
      ?AUTO_6954 - BLOCK
      ?AUTO_6955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6950 ) ( CLEAR ?AUTO_6950 ) ( ON ?AUTO_6954 ?AUTO_6951 ) ( CLEAR ?AUTO_6954 ) ( HOLDING ?AUTO_6955 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6955 )
      ( MAKE-ON ?AUTO_6950 ?AUTO_6951 )
      ( MAKE-ON-VERIFY ?AUTO_6950 ?AUTO_6951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6956 - BLOCK
      ?AUTO_6957 - BLOCK
    )
    :vars
    (
      ?AUTO_6960 - BLOCK
      ?AUTO_6961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6956 ) ( ON ?AUTO_6960 ?AUTO_6957 ) ( CLEAR ?AUTO_6960 ) ( ON ?AUTO_6961 ?AUTO_6956 ) ( CLEAR ?AUTO_6961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6961 ?AUTO_6956 )
      ( MAKE-ON ?AUTO_6956 ?AUTO_6957 )
      ( MAKE-ON-VERIFY ?AUTO_6956 ?AUTO_6957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6966 - BLOCK
      ?AUTO_6967 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6966 ) ( CLEAR ?AUTO_6967 ) )
    :subtasks
    ( ( !STACK ?AUTO_6966 ?AUTO_6967 )
      ( MAKE-ON-VERIFY ?AUTO_6966 ?AUTO_6967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6970 - BLOCK
      ?AUTO_6971 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6971 ) ( ON-TABLE ?AUTO_6970 ) ( CLEAR ?AUTO_6970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6970 )
      ( MAKE-ON ?AUTO_6970 ?AUTO_6971 )
      ( MAKE-ON-VERIFY ?AUTO_6970 ?AUTO_6971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6975 - BLOCK
      ?AUTO_6976 - BLOCK
    )
    :vars
    (
      ?AUTO_6980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6975 ) ( CLEAR ?AUTO_6975 ) ( HOLDING ?AUTO_6976 ) ( CLEAR ?AUTO_6980 ) )
    :subtasks
    ( ( !STACK ?AUTO_6976 ?AUTO_6980 )
      ( MAKE-ON ?AUTO_6975 ?AUTO_6976 )
      ( MAKE-ON-VERIFY ?AUTO_6975 ?AUTO_6976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6983 - BLOCK
      ?AUTO_6984 - BLOCK
    )
    :vars
    (
      ?AUTO_6987 - BLOCK
      ?AUTO_6988 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6984 ) ( ON-TABLE ?AUTO_6983 ) ( CLEAR ?AUTO_6983 ) ( HOLDING ?AUTO_6987 ) ( CLEAR ?AUTO_6988 ) )
    :subtasks
    ( ( !STACK ?AUTO_6987 ?AUTO_6988 )
      ( MAKE-ON ?AUTO_6983 ?AUTO_6984 )
      ( MAKE-ON-VERIFY ?AUTO_6983 ?AUTO_6984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7001 - BLOCK
      ?AUTO_7002 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7001 ) ( CLEAR ?AUTO_7002 ) )
    :subtasks
    ( ( !STACK ?AUTO_7001 ?AUTO_7002 )
      ( MAKE-ON-VERIFY ?AUTO_7001 ?AUTO_7002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7005 - BLOCK
      ?AUTO_7006 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7006 ) ( ON-TABLE ?AUTO_7005 ) ( CLEAR ?AUTO_7005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7005 )
      ( MAKE-ON ?AUTO_7005 ?AUTO_7006 )
      ( MAKE-ON-VERIFY ?AUTO_7005 ?AUTO_7006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7010 - BLOCK
      ?AUTO_7011 - BLOCK
    )
    :vars
    (
      ?AUTO_7015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7010 ) ( CLEAR ?AUTO_7010 ) ( HOLDING ?AUTO_7011 ) ( CLEAR ?AUTO_7015 ) )
    :subtasks
    ( ( !STACK ?AUTO_7011 ?AUTO_7015 )
      ( MAKE-ON ?AUTO_7010 ?AUTO_7011 )
      ( MAKE-ON-VERIFY ?AUTO_7010 ?AUTO_7011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7018 - BLOCK
      ?AUTO_7019 - BLOCK
    )
    :vars
    (
      ?AUTO_7022 - BLOCK
      ?AUTO_7023 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7019 ) ( ON-TABLE ?AUTO_7018 ) ( CLEAR ?AUTO_7018 ) ( HOLDING ?AUTO_7022 ) ( CLEAR ?AUTO_7023 ) )
    :subtasks
    ( ( !STACK ?AUTO_7022 ?AUTO_7023 )
      ( MAKE-ON ?AUTO_7018 ?AUTO_7019 )
      ( MAKE-ON-VERIFY ?AUTO_7018 ?AUTO_7019 ) )
  )

)

