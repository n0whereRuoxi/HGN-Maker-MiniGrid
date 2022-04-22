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

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9 - BLOCK
      ?AUTO_10 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9 ) ( CLEAR ?AUTO_10 ) )
    :subtasks
    ( ( !STACK ?AUTO_9 ?AUTO_10 )
      ( MAKE-ON-VERIFY ?AUTO_9 ?AUTO_10 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_13 - BLOCK
      ?AUTO_14 - BLOCK
    )
    :vars
    (
      ?AUTO_18 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_14 ) ( ON ?AUTO_13 ?AUTO_18 ) ( CLEAR ?AUTO_13 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_13 ?AUTO_18 )
      ( MAKE-ON ?AUTO_13 ?AUTO_14 )
      ( MAKE-ON-VERIFY ?AUTO_13 ?AUTO_14 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_19 - BLOCK
      ?AUTO_20 - BLOCK
    )
    :vars
    (
      ?AUTO_23 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_19 ?AUTO_23 ) ( CLEAR ?AUTO_19 ) ( HOLDING ?AUTO_20 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_20 )
      ( MAKE-ON ?AUTO_19 ?AUTO_20 )
      ( MAKE-ON-VERIFY ?AUTO_19 ?AUTO_20 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_29 - BLOCK
      ?AUTO_30 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_29 ) ( CLEAR ?AUTO_30 ) )
    :subtasks
    ( ( !STACK ?AUTO_29 ?AUTO_30 )
      ( MAKE-ON-VERIFY ?AUTO_29 ?AUTO_30 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_33 - BLOCK
      ?AUTO_34 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_34 ) ( ON-TABLE ?AUTO_33 ) ( CLEAR ?AUTO_33 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_33 )
      ( MAKE-ON ?AUTO_33 ?AUTO_34 )
      ( MAKE-ON-VERIFY ?AUTO_33 ?AUTO_34 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_38 - BLOCK
      ?AUTO_39 - BLOCK
    )
    :vars
    (
      ?AUTO_42 - BLOCK
      ?AUTO_43 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_39 ) ( ON-TABLE ?AUTO_38 ) ( CLEAR ?AUTO_38 ) ( HOLDING ?AUTO_42 ) ( CLEAR ?AUTO_43 ) )
    :subtasks
    ( ( !STACK ?AUTO_42 ?AUTO_43 )
      ( MAKE-ON ?AUTO_38 ?AUTO_39 )
      ( MAKE-ON-VERIFY ?AUTO_38 ?AUTO_39 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_44 - BLOCK
      ?AUTO_45 - BLOCK
    )
    :vars
    (
      ?AUTO_47 - BLOCK
      ?AUTO_49 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_44 ) ( CLEAR ?AUTO_44 ) ( CLEAR ?AUTO_47 ) ( ON ?AUTO_49 ?AUTO_45 ) ( CLEAR ?AUTO_49 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_49 ?AUTO_45 )
      ( MAKE-ON ?AUTO_44 ?AUTO_45 )
      ( MAKE-ON-VERIFY ?AUTO_44 ?AUTO_45 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_52 - BLOCK
      ?AUTO_53 - BLOCK
    )
    :vars
    (
      ?AUTO_57 - BLOCK
      ?AUTO_56 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_52 ) ( CLEAR ?AUTO_52 ) ( ON ?AUTO_57 ?AUTO_53 ) ( CLEAR ?AUTO_57 ) ( HOLDING ?AUTO_56 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_56 )
      ( MAKE-ON ?AUTO_52 ?AUTO_53 )
      ( MAKE-ON-VERIFY ?AUTO_52 ?AUTO_53 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_59 - BLOCK
      ?AUTO_60 - BLOCK
    )
    :vars
    (
      ?AUTO_64 - BLOCK
      ?AUTO_63 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_59 ) ( ON ?AUTO_64 ?AUTO_60 ) ( CLEAR ?AUTO_64 ) ( ON ?AUTO_63 ?AUTO_59 ) ( CLEAR ?AUTO_63 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_63 ?AUTO_59 )
      ( MAKE-ON ?AUTO_59 ?AUTO_60 )
      ( MAKE-ON-VERIFY ?AUTO_59 ?AUTO_60 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_69 - BLOCK
      ?AUTO_70 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_69 ) ( CLEAR ?AUTO_70 ) )
    :subtasks
    ( ( !STACK ?AUTO_69 ?AUTO_70 )
      ( MAKE-ON-VERIFY ?AUTO_69 ?AUTO_70 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_73 - BLOCK
      ?AUTO_74 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_74 ) ( ON-TABLE ?AUTO_73 ) ( CLEAR ?AUTO_73 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_73 )
      ( MAKE-ON ?AUTO_73 ?AUTO_74 )
      ( MAKE-ON-VERIFY ?AUTO_73 ?AUTO_74 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_78 - BLOCK
      ?AUTO_79 - BLOCK
    )
    :vars
    (
      ?AUTO_82 - BLOCK
      ?AUTO_83 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_79 ) ( ON-TABLE ?AUTO_78 ) ( CLEAR ?AUTO_78 ) ( HOLDING ?AUTO_82 ) ( CLEAR ?AUTO_83 ) )
    :subtasks
    ( ( !STACK ?AUTO_82 ?AUTO_83 )
      ( MAKE-ON ?AUTO_78 ?AUTO_79 )
      ( MAKE-ON-VERIFY ?AUTO_78 ?AUTO_79 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_86 - BLOCK
      ?AUTO_87 - BLOCK
    )
    :vars
    (
      ?AUTO_91 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_86 ) ( CLEAR ?AUTO_86 ) ( HOLDING ?AUTO_87 ) ( CLEAR ?AUTO_91 ) )
    :subtasks
    ( ( !STACK ?AUTO_87 ?AUTO_91 )
      ( MAKE-ON ?AUTO_86 ?AUTO_87 )
      ( MAKE-ON-VERIFY ?AUTO_86 ?AUTO_87 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_93 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_93 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_93 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_93 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_95 - BLOCK
    )
    :vars
    (
      ?AUTO_98 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_95 ?AUTO_98 ) ( CLEAR ?AUTO_95 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_95 ?AUTO_98 )
      ( MAKE-ON-TABLE ?AUTO_95 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_95 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_100 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_100 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_100 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_100 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_102 - BLOCK
    )
    :vars
    (
      ?AUTO_105 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_102 ?AUTO_105 ) ( CLEAR ?AUTO_102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_102 ?AUTO_105 )
      ( MAKE-ON-TABLE ?AUTO_102 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_102 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_106 - BLOCK
    )
    :vars
    (
      ?AUTO_108 - BLOCK
      ?AUTO_109 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_106 ?AUTO_108 ) ( CLEAR ?AUTO_106 ) ( HOLDING ?AUTO_109 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_109 )
      ( MAKE-ON-TABLE ?AUTO_106 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_113 - BLOCK
      ?AUTO_114 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_113 ) ( CLEAR ?AUTO_114 ) )
    :subtasks
    ( ( !STACK ?AUTO_113 ?AUTO_114 )
      ( MAKE-ON-VERIFY ?AUTO_113 ?AUTO_114 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_117 - BLOCK
      ?AUTO_118 - BLOCK
    )
    :vars
    (
      ?AUTO_122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_118 ) ( ON ?AUTO_117 ?AUTO_122 ) ( CLEAR ?AUTO_117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_117 ?AUTO_122 )
      ( MAKE-ON ?AUTO_117 ?AUTO_118 )
      ( MAKE-ON-VERIFY ?AUTO_117 ?AUTO_118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_123 - BLOCK
      ?AUTO_124 - BLOCK
    )
    :vars
    (
      ?AUTO_127 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_123 ?AUTO_127 ) ( CLEAR ?AUTO_123 ) ( HOLDING ?AUTO_124 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_124 )
      ( MAKE-ON ?AUTO_123 ?AUTO_124 )
      ( MAKE-ON-VERIFY ?AUTO_123 ?AUTO_124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_129 - BLOCK
      ?AUTO_130 - BLOCK
    )
    :vars
    (
      ?AUTO_133 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_129 ?AUTO_133 ) ( ON ?AUTO_130 ?AUTO_129 ) ( CLEAR ?AUTO_130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_130 ?AUTO_129 )
      ( MAKE-ON ?AUTO_129 ?AUTO_130 )
      ( MAKE-ON-VERIFY ?AUTO_129 ?AUTO_130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_136 - BLOCK
      ?AUTO_137 - BLOCK
    )
    :vars
    (
      ?AUTO_140 - BLOCK
      ?AUTO_141 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_136 ?AUTO_140 ) ( ON ?AUTO_137 ?AUTO_136 ) ( CLEAR ?AUTO_137 ) ( HOLDING ?AUTO_141 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_141 )
      ( MAKE-ON ?AUTO_136 ?AUTO_137 )
      ( MAKE-ON-VERIFY ?AUTO_136 ?AUTO_137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_146 - BLOCK
      ?AUTO_147 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_146 ) ( CLEAR ?AUTO_147 ) )
    :subtasks
    ( ( !STACK ?AUTO_146 ?AUTO_147 )
      ( MAKE-ON-VERIFY ?AUTO_146 ?AUTO_147 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_150 - BLOCK
      ?AUTO_151 - BLOCK
    )
    :vars
    (
      ?AUTO_155 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_151 ) ( ON ?AUTO_150 ?AUTO_155 ) ( CLEAR ?AUTO_150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_150 ?AUTO_155 )
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
      ?AUTO_160 - BLOCK
      ?AUTO_162 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_156 ?AUTO_160 ) ( CLEAR ?AUTO_156 ) ( HOLDING ?AUTO_157 ) ( CLEAR ?AUTO_162 ) )
    :subtasks
    ( ( !STACK ?AUTO_157 ?AUTO_162 )
      ( MAKE-ON ?AUTO_156 ?AUTO_157 )
      ( MAKE-ON-VERIFY ?AUTO_156 ?AUTO_157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_165 - BLOCK
      ?AUTO_166 - BLOCK
    )
    :vars
    (
      ?AUTO_167 - BLOCK
      ?AUTO_170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_166 ) ( ON ?AUTO_165 ?AUTO_167 ) ( CLEAR ?AUTO_165 ) ( HOLDING ?AUTO_170 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_170 )
      ( MAKE-ON ?AUTO_165 ?AUTO_166 )
      ( MAKE-ON-VERIFY ?AUTO_165 ?AUTO_166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_171 - BLOCK
      ?AUTO_172 - BLOCK
    )
    :vars
    (
      ?AUTO_173 - BLOCK
      ?AUTO_174 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_171 ?AUTO_173 ) ( CLEAR ?AUTO_171 ) ( ON ?AUTO_174 ?AUTO_172 ) ( CLEAR ?AUTO_174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_174 ?AUTO_172 )
      ( MAKE-ON ?AUTO_171 ?AUTO_172 )
      ( MAKE-ON-VERIFY ?AUTO_171 ?AUTO_172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_179 - BLOCK
      ?AUTO_180 - BLOCK
    )
    :vars
    (
      ?AUTO_183 - BLOCK
      ?AUTO_182 - BLOCK
      ?AUTO_185 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_179 ?AUTO_183 ) ( CLEAR ?AUTO_179 ) ( ON ?AUTO_182 ?AUTO_180 ) ( CLEAR ?AUTO_182 ) ( HOLDING ?AUTO_185 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_185 )
      ( MAKE-ON ?AUTO_179 ?AUTO_180 )
      ( MAKE-ON-VERIFY ?AUTO_179 ?AUTO_180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_186 - BLOCK
      ?AUTO_187 - BLOCK
    )
    :vars
    (
      ?AUTO_191 - BLOCK
      ?AUTO_190 - BLOCK
      ?AUTO_192 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_186 ?AUTO_191 ) ( ON ?AUTO_190 ?AUTO_187 ) ( CLEAR ?AUTO_190 ) ( ON ?AUTO_192 ?AUTO_186 ) ( CLEAR ?AUTO_192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_192 ?AUTO_186 )
      ( MAKE-ON ?AUTO_186 ?AUTO_187 )
      ( MAKE-ON-VERIFY ?AUTO_186 ?AUTO_187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_197 - BLOCK
      ?AUTO_198 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_197 ) ( CLEAR ?AUTO_198 ) )
    :subtasks
    ( ( !STACK ?AUTO_197 ?AUTO_198 )
      ( MAKE-ON-VERIFY ?AUTO_197 ?AUTO_198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_201 - BLOCK
      ?AUTO_202 - BLOCK
    )
    :vars
    (
      ?AUTO_206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_202 ) ( ON ?AUTO_201 ?AUTO_206 ) ( CLEAR ?AUTO_201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_201 ?AUTO_206 )
      ( MAKE-ON ?AUTO_201 ?AUTO_202 )
      ( MAKE-ON-VERIFY ?AUTO_201 ?AUTO_202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_207 - BLOCK
      ?AUTO_208 - BLOCK
    )
    :vars
    (
      ?AUTO_211 - BLOCK
      ?AUTO_212 - BLOCK
      ?AUTO_213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_208 ) ( ON ?AUTO_207 ?AUTO_211 ) ( CLEAR ?AUTO_207 ) ( HOLDING ?AUTO_212 ) ( CLEAR ?AUTO_213 ) )
    :subtasks
    ( ( !STACK ?AUTO_212 ?AUTO_213 )
      ( MAKE-ON ?AUTO_207 ?AUTO_208 )
      ( MAKE-ON-VERIFY ?AUTO_207 ?AUTO_208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_214 - BLOCK
      ?AUTO_215 - BLOCK
    )
    :vars
    (
      ?AUTO_218 - BLOCK
      ?AUTO_216 - BLOCK
      ?AUTO_220 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_214 ?AUTO_218 ) ( CLEAR ?AUTO_214 ) ( CLEAR ?AUTO_216 ) ( ON ?AUTO_220 ?AUTO_215 ) ( CLEAR ?AUTO_220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_220 ?AUTO_215 )
      ( MAKE-ON ?AUTO_214 ?AUTO_215 )
      ( MAKE-ON-VERIFY ?AUTO_214 ?AUTO_215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_223 - BLOCK
      ?AUTO_224 - BLOCK
    )
    :vars
    (
      ?AUTO_228 - BLOCK
      ?AUTO_229 - BLOCK
      ?AUTO_227 - BLOCK
      ?AUTO_231 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_223 ?AUTO_228 ) ( CLEAR ?AUTO_223 ) ( ON ?AUTO_229 ?AUTO_224 ) ( CLEAR ?AUTO_229 ) ( HOLDING ?AUTO_227 ) ( CLEAR ?AUTO_231 ) )
    :subtasks
    ( ( !STACK ?AUTO_227 ?AUTO_231 )
      ( MAKE-ON ?AUTO_223 ?AUTO_224 )
      ( MAKE-ON-VERIFY ?AUTO_223 ?AUTO_224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_232 - BLOCK
      ?AUTO_233 - BLOCK
    )
    :vars
    (
      ?AUTO_234 - BLOCK
      ?AUTO_239 - BLOCK
      ?AUTO_235 - BLOCK
      ?AUTO_238 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_232 ?AUTO_234 ) ( ON ?AUTO_239 ?AUTO_233 ) ( CLEAR ?AUTO_239 ) ( CLEAR ?AUTO_235 ) ( ON ?AUTO_238 ?AUTO_232 ) ( CLEAR ?AUTO_238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_238 ?AUTO_232 )
      ( MAKE-ON ?AUTO_232 ?AUTO_233 )
      ( MAKE-ON-VERIFY ?AUTO_232 ?AUTO_233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_242 - BLOCK
      ?AUTO_243 - BLOCK
    )
    :vars
    (
      ?AUTO_246 - BLOCK
      ?AUTO_249 - BLOCK
      ?AUTO_248 - BLOCK
      ?AUTO_247 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_242 ?AUTO_246 ) ( ON ?AUTO_249 ?AUTO_243 ) ( CLEAR ?AUTO_249 ) ( ON ?AUTO_248 ?AUTO_242 ) ( CLEAR ?AUTO_248 ) ( HOLDING ?AUTO_247 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_247 )
      ( MAKE-ON ?AUTO_242 ?AUTO_243 )
      ( MAKE-ON-VERIFY ?AUTO_242 ?AUTO_243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_251 - BLOCK
      ?AUTO_252 - BLOCK
    )
    :vars
    (
      ?AUTO_256 - BLOCK
      ?AUTO_253 - BLOCK
      ?AUTO_258 - BLOCK
      ?AUTO_257 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_251 ?AUTO_256 ) ( ON ?AUTO_253 ?AUTO_252 ) ( CLEAR ?AUTO_253 ) ( ON ?AUTO_258 ?AUTO_251 ) ( ON ?AUTO_257 ?AUTO_258 ) ( CLEAR ?AUTO_257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_257 ?AUTO_258 )
      ( MAKE-ON ?AUTO_251 ?AUTO_252 )
      ( MAKE-ON-VERIFY ?AUTO_251 ?AUTO_252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_261 - BLOCK
      ?AUTO_262 - BLOCK
    )
    :vars
    (
      ?AUTO_263 - BLOCK
      ?AUTO_267 - BLOCK
      ?AUTO_268 - BLOCK
      ?AUTO_266 - BLOCK
      ?AUTO_269 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_261 ?AUTO_263 ) ( ON ?AUTO_267 ?AUTO_262 ) ( CLEAR ?AUTO_267 ) ( ON ?AUTO_268 ?AUTO_261 ) ( ON ?AUTO_266 ?AUTO_268 ) ( CLEAR ?AUTO_266 ) ( HOLDING ?AUTO_269 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_269 )
      ( MAKE-ON ?AUTO_261 ?AUTO_262 )
      ( MAKE-ON-VERIFY ?AUTO_261 ?AUTO_262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_270 - BLOCK
      ?AUTO_271 - BLOCK
    )
    :vars
    (
      ?AUTO_272 - BLOCK
      ?AUTO_273 - BLOCK
      ?AUTO_277 - BLOCK
      ?AUTO_278 - BLOCK
      ?AUTO_276 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_270 ?AUTO_272 ) ( ON ?AUTO_273 ?AUTO_271 ) ( ON ?AUTO_277 ?AUTO_270 ) ( ON ?AUTO_278 ?AUTO_277 ) ( CLEAR ?AUTO_278 ) ( ON ?AUTO_276 ?AUTO_273 ) ( CLEAR ?AUTO_276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_276 ?AUTO_273 )
      ( MAKE-ON ?AUTO_270 ?AUTO_271 )
      ( MAKE-ON-VERIFY ?AUTO_270 ?AUTO_271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_283 - BLOCK
      ?AUTO_284 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_283 ) ( CLEAR ?AUTO_284 ) )
    :subtasks
    ( ( !STACK ?AUTO_283 ?AUTO_284 )
      ( MAKE-ON-VERIFY ?AUTO_283 ?AUTO_284 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_287 - BLOCK
      ?AUTO_288 - BLOCK
    )
    :vars
    (
      ?AUTO_292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_288 ) ( ON ?AUTO_287 ?AUTO_292 ) ( CLEAR ?AUTO_287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_287 ?AUTO_292 )
      ( MAKE-ON ?AUTO_287 ?AUTO_288 )
      ( MAKE-ON-VERIFY ?AUTO_287 ?AUTO_288 ) )
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
      ?AUTO_298 - BLOCK
      ?AUTO_299 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_294 ) ( ON ?AUTO_293 ?AUTO_295 ) ( CLEAR ?AUTO_293 ) ( HOLDING ?AUTO_298 ) ( CLEAR ?AUTO_299 ) )
    :subtasks
    ( ( !STACK ?AUTO_298 ?AUTO_299 )
      ( MAKE-ON ?AUTO_293 ?AUTO_294 )
      ( MAKE-ON-VERIFY ?AUTO_293 ?AUTO_294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_302 - BLOCK
      ?AUTO_303 - BLOCK
    )
    :vars
    (
      ?AUTO_305 - BLOCK
      ?AUTO_308 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_302 ?AUTO_305 ) ( CLEAR ?AUTO_302 ) ( HOLDING ?AUTO_303 ) ( CLEAR ?AUTO_308 ) )
    :subtasks
    ( ( !STACK ?AUTO_303 ?AUTO_308 )
      ( MAKE-ON ?AUTO_302 ?AUTO_303 )
      ( MAKE-ON-VERIFY ?AUTO_302 ?AUTO_303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_325 - BLOCK
      ?AUTO_326 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_325 ) ( CLEAR ?AUTO_326 ) )
    :subtasks
    ( ( !STACK ?AUTO_325 ?AUTO_326 )
      ( MAKE-ON-VERIFY ?AUTO_325 ?AUTO_326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_329 - BLOCK
      ?AUTO_330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_330 ) ( ON-TABLE ?AUTO_329 ) ( CLEAR ?AUTO_329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_329 )
      ( MAKE-ON ?AUTO_329 ?AUTO_330 )
      ( MAKE-ON-VERIFY ?AUTO_329 ?AUTO_330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_334 - BLOCK
      ?AUTO_335 - BLOCK
    )
    :vars
    (
      ?AUTO_338 - BLOCK
      ?AUTO_339 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_335 ) ( ON-TABLE ?AUTO_334 ) ( CLEAR ?AUTO_334 ) ( HOLDING ?AUTO_338 ) ( CLEAR ?AUTO_339 ) )
    :subtasks
    ( ( !STACK ?AUTO_338 ?AUTO_339 )
      ( MAKE-ON ?AUTO_334 ?AUTO_335 )
      ( MAKE-ON-VERIFY ?AUTO_334 ?AUTO_335 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_340 - BLOCK
      ?AUTO_341 - BLOCK
    )
    :vars
    (
      ?AUTO_345 - BLOCK
      ?AUTO_344 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_341 ) ( ON-TABLE ?AUTO_340 ) ( CLEAR ?AUTO_345 ) ( ON ?AUTO_344 ?AUTO_340 ) ( CLEAR ?AUTO_344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_344 ?AUTO_340 )
      ( MAKE-ON ?AUTO_340 ?AUTO_341 )
      ( MAKE-ON-VERIFY ?AUTO_340 ?AUTO_341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_348 - BLOCK
      ?AUTO_349 - BLOCK
    )
    :vars
    (
      ?AUTO_350 - BLOCK
      ?AUTO_353 - BLOCK
      ?AUTO_354 - BLOCK
      ?AUTO_355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_349 ) ( ON-TABLE ?AUTO_348 ) ( CLEAR ?AUTO_350 ) ( ON ?AUTO_353 ?AUTO_348 ) ( CLEAR ?AUTO_353 ) ( HOLDING ?AUTO_354 ) ( CLEAR ?AUTO_355 ) )
    :subtasks
    ( ( !STACK ?AUTO_354 ?AUTO_355 )
      ( MAKE-ON ?AUTO_348 ?AUTO_349 )
      ( MAKE-ON-VERIFY ?AUTO_348 ?AUTO_349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_370 - BLOCK
      ?AUTO_371 - BLOCK
    )
    :vars
    (
      ?AUTO_373 - BLOCK
      ?AUTO_375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_370 ) ( CLEAR ?AUTO_373 ) ( ON ?AUTO_375 ?AUTO_370 ) ( CLEAR ?AUTO_375 ) ( HOLDING ?AUTO_371 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_371 )
      ( MAKE-ON ?AUTO_370 ?AUTO_371 )
      ( MAKE-ON-VERIFY ?AUTO_370 ?AUTO_371 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_377 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_377 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_377 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_377 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_379 - BLOCK
    )
    :vars
    (
      ?AUTO_382 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_379 ?AUTO_382 ) ( CLEAR ?AUTO_379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_379 ?AUTO_382 )
      ( MAKE-ON-TABLE ?AUTO_379 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_379 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_385 - BLOCK
      ?AUTO_386 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_385 ) ( CLEAR ?AUTO_386 ) )
    :subtasks
    ( ( !STACK ?AUTO_385 ?AUTO_386 )
      ( MAKE-ON-VERIFY ?AUTO_385 ?AUTO_386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_389 - BLOCK
      ?AUTO_390 - BLOCK
    )
    :vars
    (
      ?AUTO_394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_390 ) ( ON ?AUTO_389 ?AUTO_394 ) ( CLEAR ?AUTO_389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_389 ?AUTO_394 )
      ( MAKE-ON ?AUTO_389 ?AUTO_390 )
      ( MAKE-ON-VERIFY ?AUTO_389 ?AUTO_390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_395 - BLOCK
      ?AUTO_396 - BLOCK
    )
    :vars
    (
      ?AUTO_399 - BLOCK
      ?AUTO_400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_396 ) ( ON ?AUTO_395 ?AUTO_399 ) ( CLEAR ?AUTO_395 ) ( HOLDING ?AUTO_400 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_400 )
      ( MAKE-ON ?AUTO_395 ?AUTO_396 )
      ( MAKE-ON-VERIFY ?AUTO_395 ?AUTO_396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_401 - BLOCK
      ?AUTO_402 - BLOCK
    )
    :vars
    (
      ?AUTO_405 - BLOCK
      ?AUTO_406 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_401 ?AUTO_405 ) ( CLEAR ?AUTO_401 ) ( ON ?AUTO_406 ?AUTO_402 ) ( CLEAR ?AUTO_406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_406 ?AUTO_402 )
      ( MAKE-ON ?AUTO_401 ?AUTO_402 )
      ( MAKE-ON-VERIFY ?AUTO_401 ?AUTO_402 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_410 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_410 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_410 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_410 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_412 - BLOCK
    )
    :vars
    (
      ?AUTO_415 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_412 ?AUTO_415 ) ( CLEAR ?AUTO_412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_412 ?AUTO_415 )
      ( MAKE-ON-TABLE ?AUTO_412 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_412 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_416 - BLOCK
    )
    :vars
    (
      ?AUTO_418 - BLOCK
      ?AUTO_419 - BLOCK
      ?AUTO_420 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_416 ?AUTO_418 ) ( CLEAR ?AUTO_416 ) ( HOLDING ?AUTO_419 ) ( CLEAR ?AUTO_420 ) )
    :subtasks
    ( ( !STACK ?AUTO_419 ?AUTO_420 )
      ( MAKE-ON-TABLE ?AUTO_416 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_416 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_421 - BLOCK
    )
    :vars
    (
      ?AUTO_423 - BLOCK
      ?AUTO_425 - BLOCK
      ?AUTO_424 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_421 ?AUTO_423 ) ( CLEAR ?AUTO_425 ) ( ON ?AUTO_424 ?AUTO_421 ) ( CLEAR ?AUTO_424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_424 ?AUTO_421 )
      ( MAKE-ON-TABLE ?AUTO_421 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_421 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_428 - BLOCK
    )
    :vars
    (
      ?AUTO_431 - BLOCK
      ?AUTO_429 - BLOCK
      ?AUTO_432 - BLOCK
      ?AUTO_433 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_428 ?AUTO_431 ) ( CLEAR ?AUTO_429 ) ( ON ?AUTO_432 ?AUTO_428 ) ( CLEAR ?AUTO_432 ) ( HOLDING ?AUTO_433 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_433 )
      ( MAKE-ON-TABLE ?AUTO_428 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_437 - BLOCK
      ?AUTO_438 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_437 ) ( CLEAR ?AUTO_438 ) )
    :subtasks
    ( ( !STACK ?AUTO_437 ?AUTO_438 )
      ( MAKE-ON-VERIFY ?AUTO_437 ?AUTO_438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_441 - BLOCK
      ?AUTO_442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_442 ) ( ON-TABLE ?AUTO_441 ) ( CLEAR ?AUTO_441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_441 )
      ( MAKE-ON ?AUTO_441 ?AUTO_442 )
      ( MAKE-ON-VERIFY ?AUTO_441 ?AUTO_442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_446 - BLOCK
      ?AUTO_447 - BLOCK
    )
    :vars
    (
      ?AUTO_450 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_447 ) ( ON-TABLE ?AUTO_446 ) ( CLEAR ?AUTO_446 ) ( HOLDING ?AUTO_450 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_450 )
      ( MAKE-ON ?AUTO_446 ?AUTO_447 )
      ( MAKE-ON-VERIFY ?AUTO_446 ?AUTO_447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_451 - BLOCK
      ?AUTO_452 - BLOCK
    )
    :vars
    (
      ?AUTO_455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_452 ) ( ON-TABLE ?AUTO_451 ) ( ON ?AUTO_455 ?AUTO_451 ) ( CLEAR ?AUTO_455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_455 ?AUTO_451 )
      ( MAKE-ON ?AUTO_451 ?AUTO_452 )
      ( MAKE-ON-VERIFY ?AUTO_451 ?AUTO_452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_458 - BLOCK
      ?AUTO_459 - BLOCK
    )
    :vars
    (
      ?AUTO_462 - BLOCK
      ?AUTO_464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_458 ) ( ON ?AUTO_462 ?AUTO_458 ) ( CLEAR ?AUTO_462 ) ( HOLDING ?AUTO_459 ) ( CLEAR ?AUTO_464 ) )
    :subtasks
    ( ( !STACK ?AUTO_459 ?AUTO_464 )
      ( MAKE-ON ?AUTO_458 ?AUTO_459 )
      ( MAKE-ON-VERIFY ?AUTO_458 ?AUTO_459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_465 - BLOCK
      ?AUTO_466 - BLOCK
    )
    :vars
    (
      ?AUTO_467 - BLOCK
      ?AUTO_470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_465 ) ( ON ?AUTO_467 ?AUTO_465 ) ( CLEAR ?AUTO_470 ) ( ON ?AUTO_466 ?AUTO_467 ) ( CLEAR ?AUTO_466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_466 ?AUTO_467 )
      ( MAKE-ON ?AUTO_465 ?AUTO_466 )
      ( MAKE-ON-VERIFY ?AUTO_465 ?AUTO_466 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_473 - BLOCK
      ?AUTO_474 - BLOCK
    )
    :vars
    (
      ?AUTO_476 - BLOCK
      ?AUTO_475 - BLOCK
      ?AUTO_479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_473 ) ( ON ?AUTO_476 ?AUTO_473 ) ( CLEAR ?AUTO_475 ) ( ON ?AUTO_474 ?AUTO_476 ) ( CLEAR ?AUTO_474 ) ( HOLDING ?AUTO_479 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_479 )
      ( MAKE-ON ?AUTO_473 ?AUTO_474 )
      ( MAKE-ON-VERIFY ?AUTO_473 ?AUTO_474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_484 - BLOCK
      ?AUTO_485 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_484 ) ( CLEAR ?AUTO_485 ) )
    :subtasks
    ( ( !STACK ?AUTO_484 ?AUTO_485 )
      ( MAKE-ON-VERIFY ?AUTO_484 ?AUTO_485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_488 - BLOCK
      ?AUTO_489 - BLOCK
    )
    :vars
    (
      ?AUTO_493 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_489 ) ( ON ?AUTO_488 ?AUTO_493 ) ( CLEAR ?AUTO_488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_488 ?AUTO_493 )
      ( MAKE-ON ?AUTO_488 ?AUTO_489 )
      ( MAKE-ON-VERIFY ?AUTO_488 ?AUTO_489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_494 - BLOCK
      ?AUTO_495 - BLOCK
    )
    :vars
    (
      ?AUTO_496 - BLOCK
      ?AUTO_499 - BLOCK
      ?AUTO_500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_495 ) ( ON ?AUTO_494 ?AUTO_496 ) ( CLEAR ?AUTO_494 ) ( HOLDING ?AUTO_499 ) ( CLEAR ?AUTO_500 ) )
    :subtasks
    ( ( !STACK ?AUTO_499 ?AUTO_500 )
      ( MAKE-ON ?AUTO_494 ?AUTO_495 )
      ( MAKE-ON-VERIFY ?AUTO_494 ?AUTO_495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_503 - BLOCK
      ?AUTO_504 - BLOCK
    )
    :vars
    (
      ?AUTO_506 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_503 ?AUTO_506 ) ( CLEAR ?AUTO_503 ) ( HOLDING ?AUTO_504 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_504 )
      ( MAKE-ON ?AUTO_503 ?AUTO_504 )
      ( MAKE-ON-VERIFY ?AUTO_503 ?AUTO_504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_513 - BLOCK
      ?AUTO_514 - BLOCK
    )
    :vars
    (
      ?AUTO_515 - BLOCK
      ?AUTO_517 - BLOCK
      ?AUTO_518 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_513 ?AUTO_515 ) ( CLEAR ?AUTO_513 ) ( CLEAR ?AUTO_517 ) ( ON ?AUTO_518 ?AUTO_514 ) ( CLEAR ?AUTO_518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_518 ?AUTO_514 )
      ( MAKE-ON ?AUTO_513 ?AUTO_514 )
      ( MAKE-ON-VERIFY ?AUTO_513 ?AUTO_514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_522 - BLOCK
      ?AUTO_523 - BLOCK
    )
    :vars
    (
      ?AUTO_526 - BLOCK
      ?AUTO_528 - BLOCK
      ?AUTO_527 - BLOCK
      ?AUTO_529 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_522 ?AUTO_526 ) ( CLEAR ?AUTO_522 ) ( CLEAR ?AUTO_528 ) ( ON ?AUTO_527 ?AUTO_523 ) ( CLEAR ?AUTO_527 ) ( HOLDING ?AUTO_529 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_529 )
      ( MAKE-ON ?AUTO_522 ?AUTO_523 )
      ( MAKE-ON-VERIFY ?AUTO_522 ?AUTO_523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_534 - BLOCK
      ?AUTO_535 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_534 ) ( CLEAR ?AUTO_535 ) )
    :subtasks
    ( ( !STACK ?AUTO_534 ?AUTO_535 )
      ( MAKE-ON-VERIFY ?AUTO_534 ?AUTO_535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_538 - BLOCK
      ?AUTO_539 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_539 ) ( ON-TABLE ?AUTO_538 ) ( CLEAR ?AUTO_538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_538 )
      ( MAKE-ON ?AUTO_538 ?AUTO_539 )
      ( MAKE-ON-VERIFY ?AUTO_538 ?AUTO_539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_543 - BLOCK
      ?AUTO_544 - BLOCK
    )
    :vars
    (
      ?AUTO_547 - BLOCK
      ?AUTO_548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_544 ) ( ON-TABLE ?AUTO_543 ) ( CLEAR ?AUTO_543 ) ( HOLDING ?AUTO_547 ) ( CLEAR ?AUTO_548 ) )
    :subtasks
    ( ( !STACK ?AUTO_547 ?AUTO_548 )
      ( MAKE-ON ?AUTO_543 ?AUTO_544 )
      ( MAKE-ON-VERIFY ?AUTO_543 ?AUTO_544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_549 - BLOCK
      ?AUTO_550 - BLOCK
    )
    :vars
    (
      ?AUTO_552 - BLOCK
      ?AUTO_554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_549 ) ( CLEAR ?AUTO_549 ) ( CLEAR ?AUTO_552 ) ( ON ?AUTO_554 ?AUTO_550 ) ( CLEAR ?AUTO_554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_554 ?AUTO_550 )
      ( MAKE-ON ?AUTO_549 ?AUTO_550 )
      ( MAKE-ON-VERIFY ?AUTO_549 ?AUTO_550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_557 - BLOCK
      ?AUTO_558 - BLOCK
    )
    :vars
    (
      ?AUTO_561 - BLOCK
      ?AUTO_562 - BLOCK
      ?AUTO_563 - BLOCK
      ?AUTO_564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_557 ) ( CLEAR ?AUTO_557 ) ( CLEAR ?AUTO_561 ) ( ON ?AUTO_562 ?AUTO_558 ) ( CLEAR ?AUTO_562 ) ( HOLDING ?AUTO_563 ) ( CLEAR ?AUTO_564 ) )
    :subtasks
    ( ( !STACK ?AUTO_563 ?AUTO_564 )
      ( MAKE-ON ?AUTO_557 ?AUTO_558 )
      ( MAKE-ON-VERIFY ?AUTO_557 ?AUTO_558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_575 - BLOCK
      ?AUTO_576 - BLOCK
    )
    :vars
    (
      ?AUTO_580 - BLOCK
      ?AUTO_579 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_580 ) ( ON ?AUTO_579 ?AUTO_576 ) ( CLEAR ?AUTO_579 ) ( HOLDING ?AUTO_575 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_575 )
      ( MAKE-ON ?AUTO_575 ?AUTO_576 )
      ( MAKE-ON-VERIFY ?AUTO_575 ?AUTO_576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_586 - BLOCK
      ?AUTO_587 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_586 ) ( CLEAR ?AUTO_587 ) )
    :subtasks
    ( ( !STACK ?AUTO_586 ?AUTO_587 )
      ( MAKE-ON-VERIFY ?AUTO_586 ?AUTO_587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_590 - BLOCK
      ?AUTO_591 - BLOCK
    )
    :vars
    (
      ?AUTO_595 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_591 ) ( ON ?AUTO_590 ?AUTO_595 ) ( CLEAR ?AUTO_590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_590 ?AUTO_595 )
      ( MAKE-ON ?AUTO_590 ?AUTO_591 )
      ( MAKE-ON-VERIFY ?AUTO_590 ?AUTO_591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_596 - BLOCK
      ?AUTO_597 - BLOCK
    )
    :vars
    (
      ?AUTO_600 - BLOCK
      ?AUTO_602 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_596 ?AUTO_600 ) ( CLEAR ?AUTO_596 ) ( HOLDING ?AUTO_597 ) ( CLEAR ?AUTO_602 ) )
    :subtasks
    ( ( !STACK ?AUTO_597 ?AUTO_602 )
      ( MAKE-ON ?AUTO_596 ?AUTO_597 )
      ( MAKE-ON-VERIFY ?AUTO_596 ?AUTO_597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_605 - BLOCK
      ?AUTO_606 - BLOCK
    )
    :vars
    (
      ?AUTO_609 - BLOCK
      ?AUTO_610 - BLOCK
      ?AUTO_611 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_606 ) ( ON ?AUTO_605 ?AUTO_609 ) ( CLEAR ?AUTO_605 ) ( HOLDING ?AUTO_610 ) ( CLEAR ?AUTO_611 ) )
    :subtasks
    ( ( !STACK ?AUTO_610 ?AUTO_611 )
      ( MAKE-ON ?AUTO_605 ?AUTO_606 )
      ( MAKE-ON-VERIFY ?AUTO_605 ?AUTO_606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_622 - BLOCK
      ?AUTO_623 - BLOCK
    )
    :vars
    (
      ?AUTO_626 - BLOCK
      ?AUTO_627 - BLOCK
      ?AUTO_628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_623 ) ( ON-TABLE ?AUTO_622 ) ( ON ?AUTO_626 ?AUTO_622 ) ( CLEAR ?AUTO_626 ) ( HOLDING ?AUTO_627 ) ( CLEAR ?AUTO_628 ) )
    :subtasks
    ( ( !STACK ?AUTO_627 ?AUTO_628 )
      ( MAKE-ON ?AUTO_622 ?AUTO_623 )
      ( MAKE-ON-VERIFY ?AUTO_622 ?AUTO_623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_629 - BLOCK
      ?AUTO_630 - BLOCK
    )
    :vars
    (
      ?AUTO_633 - BLOCK
      ?AUTO_635 - BLOCK
      ?AUTO_634 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_630 ) ( ON-TABLE ?AUTO_629 ) ( ON ?AUTO_633 ?AUTO_629 ) ( CLEAR ?AUTO_635 ) ( ON ?AUTO_634 ?AUTO_633 ) ( CLEAR ?AUTO_634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_634 ?AUTO_633 )
      ( MAKE-ON ?AUTO_629 ?AUTO_630 )
      ( MAKE-ON-VERIFY ?AUTO_629 ?AUTO_630 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_638 - BLOCK
      ?AUTO_639 - BLOCK
    )
    :vars
    (
      ?AUTO_644 - BLOCK
      ?AUTO_643 - BLOCK
      ?AUTO_640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_638 ) ( ON ?AUTO_644 ?AUTO_638 ) ( CLEAR ?AUTO_643 ) ( ON ?AUTO_640 ?AUTO_644 ) ( CLEAR ?AUTO_640 ) ( HOLDING ?AUTO_639 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_639 )
      ( MAKE-ON ?AUTO_638 ?AUTO_639 )
      ( MAKE-ON-VERIFY ?AUTO_638 ?AUTO_639 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_649 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_649 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_649 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_649 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_651 - BLOCK
    )
    :vars
    (
      ?AUTO_654 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_651 ?AUTO_654 ) ( CLEAR ?AUTO_651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_651 ?AUTO_654 )
      ( MAKE-ON-TABLE ?AUTO_651 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_651 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_655 - BLOCK
    )
    :vars
    (
      ?AUTO_657 - BLOCK
      ?AUTO_658 - BLOCK
      ?AUTO_659 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_655 ?AUTO_657 ) ( CLEAR ?AUTO_655 ) ( HOLDING ?AUTO_658 ) ( CLEAR ?AUTO_659 ) )
    :subtasks
    ( ( !STACK ?AUTO_658 ?AUTO_659 )
      ( MAKE-ON-TABLE ?AUTO_655 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_655 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_660 - BLOCK
    )
    :vars
    (
      ?AUTO_662 - BLOCK
      ?AUTO_664 - BLOCK
      ?AUTO_663 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_660 ?AUTO_662 ) ( CLEAR ?AUTO_664 ) ( ON ?AUTO_663 ?AUTO_660 ) ( CLEAR ?AUTO_663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_663 ?AUTO_660 )
      ( MAKE-ON-TABLE ?AUTO_660 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_660 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_667 - BLOCK
    )
    :vars
    (
      ?AUTO_670 - BLOCK
      ?AUTO_671 - BLOCK
      ?AUTO_668 - BLOCK
      ?AUTO_673 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_667 ?AUTO_670 ) ( ON ?AUTO_671 ?AUTO_667 ) ( CLEAR ?AUTO_671 ) ( HOLDING ?AUTO_668 ) ( CLEAR ?AUTO_673 ) )
    :subtasks
    ( ( !STACK ?AUTO_668 ?AUTO_673 )
      ( MAKE-ON-TABLE ?AUTO_667 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_667 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_687 - BLOCK
      ?AUTO_688 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_687 ) ( CLEAR ?AUTO_688 ) )
    :subtasks
    ( ( !STACK ?AUTO_687 ?AUTO_688 )
      ( MAKE-ON-VERIFY ?AUTO_687 ?AUTO_688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_691 - BLOCK
      ?AUTO_692 - BLOCK
    )
    :vars
    (
      ?AUTO_696 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_692 ) ( ON ?AUTO_691 ?AUTO_696 ) ( CLEAR ?AUTO_691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_691 ?AUTO_696 )
      ( MAKE-ON ?AUTO_691 ?AUTO_692 )
      ( MAKE-ON-VERIFY ?AUTO_691 ?AUTO_692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_697 - BLOCK
      ?AUTO_698 - BLOCK
    )
    :vars
    (
      ?AUTO_699 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_697 ?AUTO_699 ) ( CLEAR ?AUTO_697 ) ( HOLDING ?AUTO_698 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_698 )
      ( MAKE-ON ?AUTO_697 ?AUTO_698 )
      ( MAKE-ON-VERIFY ?AUTO_697 ?AUTO_698 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_771 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_771 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_771 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_771 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_773 - BLOCK
    )
    :vars
    (
      ?AUTO_776 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_773 ?AUTO_776 ) ( CLEAR ?AUTO_773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_773 ?AUTO_776 )
      ( MAKE-ON-TABLE ?AUTO_773 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_773 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_777 - BLOCK
    )
    :vars
    (
      ?AUTO_779 - BLOCK
      ?AUTO_780 - BLOCK
      ?AUTO_781 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_777 ?AUTO_779 ) ( CLEAR ?AUTO_777 ) ( HOLDING ?AUTO_780 ) ( CLEAR ?AUTO_781 ) )
    :subtasks
    ( ( !STACK ?AUTO_780 ?AUTO_781 )
      ( MAKE-ON-TABLE ?AUTO_777 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_777 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_784 - BLOCK
    )
    :vars
    (
      ?AUTO_786 - BLOCK
      ?AUTO_788 - BLOCK
      ?AUTO_785 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_784 ?AUTO_786 ) ( CLEAR ?AUTO_788 ) ( ON ?AUTO_785 ?AUTO_784 ) ( CLEAR ?AUTO_785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_785 ?AUTO_784 )
      ( MAKE-ON-TABLE ?AUTO_784 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_784 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_791 - BLOCK
    )
    :vars
    (
      ?AUTO_793 - BLOCK
      ?AUTO_795 - BLOCK
      ?AUTO_794 - BLOCK
      ?AUTO_796 - BLOCK
      ?AUTO_797 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_791 ?AUTO_793 ) ( CLEAR ?AUTO_795 ) ( ON ?AUTO_794 ?AUTO_791 ) ( CLEAR ?AUTO_794 ) ( HOLDING ?AUTO_796 ) ( CLEAR ?AUTO_797 ) )
    :subtasks
    ( ( !STACK ?AUTO_796 ?AUTO_797 )
      ( MAKE-ON-TABLE ?AUTO_791 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_791 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_798 - BLOCK
    )
    :vars
    (
      ?AUTO_800 - BLOCK
      ?AUTO_799 - BLOCK
      ?AUTO_803 - BLOCK
      ?AUTO_804 - BLOCK
      ?AUTO_802 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_798 ?AUTO_800 ) ( CLEAR ?AUTO_799 ) ( ON ?AUTO_803 ?AUTO_798 ) ( CLEAR ?AUTO_804 ) ( ON ?AUTO_802 ?AUTO_803 ) ( CLEAR ?AUTO_802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_802 ?AUTO_803 )
      ( MAKE-ON-TABLE ?AUTO_798 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_798 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_807 - BLOCK
    )
    :vars
    (
      ?AUTO_809 - BLOCK
      ?AUTO_808 - BLOCK
      ?AUTO_813 - BLOCK
      ?AUTO_812 - BLOCK
      ?AUTO_811 - BLOCK
      ?AUTO_815 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_807 ?AUTO_809 ) ( CLEAR ?AUTO_808 ) ( ON ?AUTO_813 ?AUTO_807 ) ( ON ?AUTO_812 ?AUTO_813 ) ( CLEAR ?AUTO_812 ) ( HOLDING ?AUTO_811 ) ( CLEAR ?AUTO_815 ) )
    :subtasks
    ( ( !STACK ?AUTO_811 ?AUTO_815 )
      ( MAKE-ON-TABLE ?AUTO_807 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_807 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_828 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_828 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_828 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_828 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_830 - BLOCK
    )
    :vars
    (
      ?AUTO_833 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_830 ?AUTO_833 ) ( CLEAR ?AUTO_830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_830 ?AUTO_833 )
      ( MAKE-ON-TABLE ?AUTO_830 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_830 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_834 - BLOCK
    )
    :vars
    (
      ?AUTO_836 - BLOCK
      ?AUTO_837 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_834 ?AUTO_836 ) ( CLEAR ?AUTO_834 ) ( HOLDING ?AUTO_837 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_837 )
      ( MAKE-ON-TABLE ?AUTO_834 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_834 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_838 - BLOCK
    )
    :vars
    (
      ?AUTO_840 - BLOCK
      ?AUTO_841 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_838 ?AUTO_840 ) ( ON ?AUTO_841 ?AUTO_838 ) ( CLEAR ?AUTO_841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_841 ?AUTO_838 )
      ( MAKE-ON-TABLE ?AUTO_838 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_838 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_844 - BLOCK
    )
    :vars
    (
      ?AUTO_845 - BLOCK
      ?AUTO_847 - BLOCK
      ?AUTO_848 - BLOCK
      ?AUTO_849 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_844 ?AUTO_845 ) ( ON ?AUTO_847 ?AUTO_844 ) ( CLEAR ?AUTO_847 ) ( HOLDING ?AUTO_848 ) ( CLEAR ?AUTO_849 ) )
    :subtasks
    ( ( !STACK ?AUTO_848 ?AUTO_849 )
      ( MAKE-ON-TABLE ?AUTO_844 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_844 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_852 - BLOCK
    )
    :vars
    (
      ?AUTO_857 - BLOCK
      ?AUTO_853 - BLOCK
      ?AUTO_855 - BLOCK
      ?AUTO_854 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_852 ?AUTO_857 ) ( ON ?AUTO_853 ?AUTO_852 ) ( CLEAR ?AUTO_855 ) ( ON ?AUTO_854 ?AUTO_853 ) ( CLEAR ?AUTO_854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_854 ?AUTO_853 )
      ( MAKE-ON-TABLE ?AUTO_852 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_852 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_860 - BLOCK
    )
    :vars
    (
      ?AUTO_865 - BLOCK
      ?AUTO_862 - BLOCK
      ?AUTO_864 - BLOCK
      ?AUTO_863 - BLOCK
      ?AUTO_866 - BLOCK
      ?AUTO_867 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_860 ?AUTO_865 ) ( ON ?AUTO_862 ?AUTO_860 ) ( CLEAR ?AUTO_864 ) ( ON ?AUTO_863 ?AUTO_862 ) ( CLEAR ?AUTO_863 ) ( HOLDING ?AUTO_866 ) ( CLEAR ?AUTO_867 ) )
    :subtasks
    ( ( !STACK ?AUTO_866 ?AUTO_867 )
      ( MAKE-ON-TABLE ?AUTO_860 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_860 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_868 - BLOCK
    )
    :vars
    (
      ?AUTO_870 - BLOCK
      ?AUTO_869 - BLOCK
      ?AUTO_871 - BLOCK
      ?AUTO_873 - BLOCK
      ?AUTO_875 - BLOCK
      ?AUTO_874 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_868 ?AUTO_870 ) ( ON ?AUTO_869 ?AUTO_868 ) ( CLEAR ?AUTO_871 ) ( ON ?AUTO_873 ?AUTO_869 ) ( CLEAR ?AUTO_875 ) ( ON ?AUTO_874 ?AUTO_873 ) ( CLEAR ?AUTO_874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_874 ?AUTO_873 )
      ( MAKE-ON-TABLE ?AUTO_868 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_868 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_878 - BLOCK
    )
    :vars
    (
      ?AUTO_881 - BLOCK
      ?AUTO_882 - BLOCK
      ?AUTO_885 - BLOCK
      ?AUTO_883 - BLOCK
      ?AUTO_884 - BLOCK
      ?AUTO_880 - BLOCK
      ?AUTO_887 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_878 ?AUTO_881 ) ( ON ?AUTO_882 ?AUTO_878 ) ( CLEAR ?AUTO_885 ) ( ON ?AUTO_883 ?AUTO_882 ) ( ON ?AUTO_884 ?AUTO_883 ) ( CLEAR ?AUTO_884 ) ( HOLDING ?AUTO_880 ) ( CLEAR ?AUTO_887 ) )
    :subtasks
    ( ( !STACK ?AUTO_880 ?AUTO_887 )
      ( MAKE-ON-TABLE ?AUTO_878 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_901 - BLOCK
      ?AUTO_902 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_901 ) ( CLEAR ?AUTO_902 ) )
    :subtasks
    ( ( !STACK ?AUTO_901 ?AUTO_902 )
      ( MAKE-ON-VERIFY ?AUTO_901 ?AUTO_902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_905 - BLOCK
      ?AUTO_906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_906 ) ( ON-TABLE ?AUTO_905 ) ( CLEAR ?AUTO_905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_905 )
      ( MAKE-ON ?AUTO_905 ?AUTO_906 )
      ( MAKE-ON-VERIFY ?AUTO_905 ?AUTO_906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_910 - BLOCK
      ?AUTO_911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_910 ) ( CLEAR ?AUTO_910 ) ( HOLDING ?AUTO_911 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_911 )
      ( MAKE-ON ?AUTO_910 ?AUTO_911 )
      ( MAKE-ON-VERIFY ?AUTO_910 ?AUTO_911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1186 - BLOCK
      ?AUTO_1187 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1186 ) ( CLEAR ?AUTO_1187 ) )
    :subtasks
    ( ( !STACK ?AUTO_1186 ?AUTO_1187 )
      ( MAKE-ON-VERIFY ?AUTO_1186 ?AUTO_1187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1190 - BLOCK
      ?AUTO_1191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1191 ) ( ON-TABLE ?AUTO_1190 ) ( CLEAR ?AUTO_1190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1190 )
      ( MAKE-ON ?AUTO_1190 ?AUTO_1191 )
      ( MAKE-ON-VERIFY ?AUTO_1190 ?AUTO_1191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1195 - BLOCK
      ?AUTO_1196 - BLOCK
    )
    :vars
    (
      ?AUTO_1199 - BLOCK
      ?AUTO_1200 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1196 ) ( ON-TABLE ?AUTO_1195 ) ( CLEAR ?AUTO_1195 ) ( HOLDING ?AUTO_1199 ) ( CLEAR ?AUTO_1200 ) )
    :subtasks
    ( ( !STACK ?AUTO_1199 ?AUTO_1200 )
      ( MAKE-ON ?AUTO_1195 ?AUTO_1196 )
      ( MAKE-ON-VERIFY ?AUTO_1195 ?AUTO_1196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1205 - BLOCK
      ?AUTO_1206 - BLOCK
    )
    :vars
    (
      ?AUTO_1208 - BLOCK
      ?AUTO_1207 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1206 ) ( ON-TABLE ?AUTO_1205 ) ( CLEAR ?AUTO_1208 ) ( ON ?AUTO_1207 ?AUTO_1205 ) ( CLEAR ?AUTO_1207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1207 ?AUTO_1205 )
      ( MAKE-ON ?AUTO_1205 ?AUTO_1206 )
      ( MAKE-ON-VERIFY ?AUTO_1205 ?AUTO_1206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1213 - BLOCK
      ?AUTO_1214 - BLOCK
    )
    :vars
    (
      ?AUTO_1217 - BLOCK
      ?AUTO_1218 - BLOCK
      ?AUTO_1219 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1214 ) ( ON-TABLE ?AUTO_1213 ) ( CLEAR ?AUTO_1217 ) ( ON ?AUTO_1218 ?AUTO_1213 ) ( CLEAR ?AUTO_1218 ) ( HOLDING ?AUTO_1219 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1219 )
      ( MAKE-ON ?AUTO_1213 ?AUTO_1214 )
      ( MAKE-ON-VERIFY ?AUTO_1213 ?AUTO_1214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1220 - BLOCK
      ?AUTO_1221 - BLOCK
    )
    :vars
    (
      ?AUTO_1225 - BLOCK
      ?AUTO_1222 - BLOCK
      ?AUTO_1226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1221 ) ( ON-TABLE ?AUTO_1220 ) ( CLEAR ?AUTO_1225 ) ( ON ?AUTO_1222 ?AUTO_1220 ) ( ON ?AUTO_1226 ?AUTO_1222 ) ( CLEAR ?AUTO_1226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1226 ?AUTO_1222 )
      ( MAKE-ON ?AUTO_1220 ?AUTO_1221 )
      ( MAKE-ON-VERIFY ?AUTO_1220 ?AUTO_1221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1229 - BLOCK
      ?AUTO_1230 - BLOCK
    )
    :vars
    (
      ?AUTO_1235 - BLOCK
      ?AUTO_1231 - BLOCK
      ?AUTO_1234 - BLOCK
      ?AUTO_1236 - BLOCK
      ?AUTO_1237 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1230 ) ( ON-TABLE ?AUTO_1229 ) ( CLEAR ?AUTO_1235 ) ( ON ?AUTO_1231 ?AUTO_1229 ) ( ON ?AUTO_1234 ?AUTO_1231 ) ( CLEAR ?AUTO_1234 ) ( HOLDING ?AUTO_1236 ) ( CLEAR ?AUTO_1237 ) )
    :subtasks
    ( ( !STACK ?AUTO_1236 ?AUTO_1237 )
      ( MAKE-ON ?AUTO_1229 ?AUTO_1230 )
      ( MAKE-ON-VERIFY ?AUTO_1229 ?AUTO_1230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1238 - BLOCK
      ?AUTO_1239 - BLOCK
    )
    :vars
    (
      ?AUTO_1241 - BLOCK
      ?AUTO_1246 - BLOCK
      ?AUTO_1240 - BLOCK
      ?AUTO_1243 - BLOCK
      ?AUTO_1242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1238 ) ( CLEAR ?AUTO_1241 ) ( ON ?AUTO_1246 ?AUTO_1238 ) ( ON ?AUTO_1240 ?AUTO_1246 ) ( CLEAR ?AUTO_1240 ) ( CLEAR ?AUTO_1243 ) ( ON ?AUTO_1242 ?AUTO_1239 ) ( CLEAR ?AUTO_1242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1242 ?AUTO_1239 )
      ( MAKE-ON ?AUTO_1238 ?AUTO_1239 )
      ( MAKE-ON-VERIFY ?AUTO_1238 ?AUTO_1239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1249 - BLOCK
      ?AUTO_1250 - BLOCK
    )
    :vars
    (
      ?AUTO_1256 - BLOCK
      ?AUTO_1253 - BLOCK
      ?AUTO_1255 - BLOCK
      ?AUTO_1257 - BLOCK
      ?AUTO_1254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1249 ) ( CLEAR ?AUTO_1256 ) ( ON ?AUTO_1253 ?AUTO_1249 ) ( ON ?AUTO_1255 ?AUTO_1253 ) ( CLEAR ?AUTO_1255 ) ( ON ?AUTO_1257 ?AUTO_1250 ) ( CLEAR ?AUTO_1257 ) ( HOLDING ?AUTO_1254 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1254 )
      ( MAKE-ON ?AUTO_1249 ?AUTO_1250 )
      ( MAKE-ON-VERIFY ?AUTO_1249 ?AUTO_1250 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1259 - BLOCK
      ?AUTO_1260 - BLOCK
    )
    :vars
    (
      ?AUTO_1264 - BLOCK
      ?AUTO_1261 - BLOCK
      ?AUTO_1265 - BLOCK
      ?AUTO_1263 - BLOCK
      ?AUTO_1262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1259 ) ( CLEAR ?AUTO_1264 ) ( ON ?AUTO_1261 ?AUTO_1259 ) ( ON ?AUTO_1265 ?AUTO_1261 ) ( ON ?AUTO_1263 ?AUTO_1260 ) ( CLEAR ?AUTO_1263 ) ( ON ?AUTO_1262 ?AUTO_1265 ) ( CLEAR ?AUTO_1262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1262 ?AUTO_1265 )
      ( MAKE-ON ?AUTO_1259 ?AUTO_1260 )
      ( MAKE-ON-VERIFY ?AUTO_1259 ?AUTO_1260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1270 - BLOCK
      ?AUTO_1271 - BLOCK
    )
    :vars
    (
      ?AUTO_1278 - BLOCK
      ?AUTO_1274 - BLOCK
      ?AUTO_1275 - BLOCK
      ?AUTO_1276 - BLOCK
      ?AUTO_1277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1270 ) ( CLEAR ?AUTO_1278 ) ( ON ?AUTO_1274 ?AUTO_1270 ) ( ON ?AUTO_1275 ?AUTO_1274 ) ( ON ?AUTO_1276 ?AUTO_1275 ) ( CLEAR ?AUTO_1276 ) ( HOLDING ?AUTO_1277 ) ( CLEAR ?AUTO_1271 ) )
    :subtasks
    ( ( !STACK ?AUTO_1277 ?AUTO_1271 )
      ( MAKE-ON ?AUTO_1270 ?AUTO_1271 )
      ( MAKE-ON-VERIFY ?AUTO_1270 ?AUTO_1271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1281 - BLOCK
      ?AUTO_1282 - BLOCK
    )
    :vars
    (
      ?AUTO_1283 - BLOCK
      ?AUTO_1287 - BLOCK
      ?AUTO_1288 - BLOCK
      ?AUTO_1284 - BLOCK
      ?AUTO_1289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1281 ) ( CLEAR ?AUTO_1283 ) ( ON ?AUTO_1287 ?AUTO_1281 ) ( ON ?AUTO_1288 ?AUTO_1287 ) ( ON ?AUTO_1284 ?AUTO_1288 ) ( CLEAR ?AUTO_1282 ) ( ON ?AUTO_1289 ?AUTO_1284 ) ( CLEAR ?AUTO_1289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1289 ?AUTO_1284 )
      ( MAKE-ON ?AUTO_1281 ?AUTO_1282 )
      ( MAKE-ON-VERIFY ?AUTO_1281 ?AUTO_1282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1292 - BLOCK
      ?AUTO_1293 - BLOCK
    )
    :vars
    (
      ?AUTO_1299 - BLOCK
      ?AUTO_1297 - BLOCK
      ?AUTO_1298 - BLOCK
      ?AUTO_1300 - BLOCK
      ?AUTO_1294 - BLOCK
      ?AUTO_1302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1292 ) ( CLEAR ?AUTO_1299 ) ( ON ?AUTO_1297 ?AUTO_1292 ) ( ON ?AUTO_1298 ?AUTO_1297 ) ( ON ?AUTO_1300 ?AUTO_1298 ) ( ON ?AUTO_1294 ?AUTO_1300 ) ( CLEAR ?AUTO_1294 ) ( HOLDING ?AUTO_1293 ) ( CLEAR ?AUTO_1302 ) )
    :subtasks
    ( ( !STACK ?AUTO_1293 ?AUTO_1302 )
      ( MAKE-ON ?AUTO_1292 ?AUTO_1293 )
      ( MAKE-ON-VERIFY ?AUTO_1292 ?AUTO_1293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1305 - BLOCK
      ?AUTO_1306 - BLOCK
    )
    :vars
    (
      ?AUTO_1311 - BLOCK
      ?AUTO_1307 - BLOCK
      ?AUTO_1312 - BLOCK
      ?AUTO_1313 - BLOCK
      ?AUTO_1308 - BLOCK
      ?AUTO_1314 - BLOCK
      ?AUTO_1315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1305 ) ( CLEAR ?AUTO_1311 ) ( ON ?AUTO_1307 ?AUTO_1305 ) ( ON ?AUTO_1312 ?AUTO_1307 ) ( ON ?AUTO_1313 ?AUTO_1312 ) ( CLEAR ?AUTO_1306 ) ( ON ?AUTO_1308 ?AUTO_1313 ) ( CLEAR ?AUTO_1308 ) ( HOLDING ?AUTO_1314 ) ( CLEAR ?AUTO_1315 ) )
    :subtasks
    ( ( !STACK ?AUTO_1314 ?AUTO_1315 )
      ( MAKE-ON ?AUTO_1305 ?AUTO_1306 )
      ( MAKE-ON-VERIFY ?AUTO_1305 ?AUTO_1306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1320 - BLOCK
      ?AUTO_1321 - BLOCK
    )
    :vars
    (
      ?AUTO_1325 - BLOCK
      ?AUTO_1322 - BLOCK
      ?AUTO_1326 - BLOCK
      ?AUTO_1327 - BLOCK
      ?AUTO_1328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1320 ) ( CLEAR ?AUTO_1325 ) ( ON ?AUTO_1322 ?AUTO_1320 ) ( ON ?AUTO_1326 ?AUTO_1322 ) ( ON ?AUTO_1327 ?AUTO_1326 ) ( CLEAR ?AUTO_1327 ) ( CLEAR ?AUTO_1321 ) ( ON-TABLE ?AUTO_1328 ) ( CLEAR ?AUTO_1328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1328 )
      ( MAKE-ON ?AUTO_1320 ?AUTO_1321 )
      ( MAKE-ON-VERIFY ?AUTO_1320 ?AUTO_1321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1340 - BLOCK
      ?AUTO_1341 - BLOCK
    )
    :vars
    (
      ?AUTO_1342 - BLOCK
      ?AUTO_1343 - BLOCK
      ?AUTO_1345 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1340 ) ( ON ?AUTO_1342 ?AUTO_1340 ) ( CLEAR ?AUTO_1343 ) ( ON ?AUTO_1345 ?AUTO_1342 ) ( ON ?AUTO_1341 ?AUTO_1345 ) ( CLEAR ?AUTO_1341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1341 ?AUTO_1345 )
      ( MAKE-ON ?AUTO_1340 ?AUTO_1341 )
      ( MAKE-ON-VERIFY ?AUTO_1340 ?AUTO_1341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1351 - BLOCK
      ?AUTO_1352 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1351 ) ( CLEAR ?AUTO_1352 ) )
    :subtasks
    ( ( !STACK ?AUTO_1351 ?AUTO_1352 )
      ( MAKE-ON-VERIFY ?AUTO_1351 ?AUTO_1352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1355 - BLOCK
      ?AUTO_1356 - BLOCK
    )
    :vars
    (
      ?AUTO_1360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1356 ) ( ON ?AUTO_1355 ?AUTO_1360 ) ( CLEAR ?AUTO_1355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1355 ?AUTO_1360 )
      ( MAKE-ON ?AUTO_1355 ?AUTO_1356 )
      ( MAKE-ON-VERIFY ?AUTO_1355 ?AUTO_1356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1361 - BLOCK
      ?AUTO_1362 - BLOCK
    )
    :vars
    (
      ?AUTO_1365 - BLOCK
      ?AUTO_1367 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1361 ?AUTO_1365 ) ( CLEAR ?AUTO_1361 ) ( HOLDING ?AUTO_1362 ) ( CLEAR ?AUTO_1367 ) )
    :subtasks
    ( ( !STACK ?AUTO_1362 ?AUTO_1367 )
      ( MAKE-ON ?AUTO_1361 ?AUTO_1362 )
      ( MAKE-ON-VERIFY ?AUTO_1361 ?AUTO_1362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1370 - BLOCK
      ?AUTO_1371 - BLOCK
    )
    :vars
    (
      ?AUTO_1374 - BLOCK
      ?AUTO_1375 - BLOCK
      ?AUTO_1376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1371 ) ( ON ?AUTO_1370 ?AUTO_1374 ) ( CLEAR ?AUTO_1370 ) ( HOLDING ?AUTO_1375 ) ( CLEAR ?AUTO_1376 ) )
    :subtasks
    ( ( !STACK ?AUTO_1375 ?AUTO_1376 )
      ( MAKE-ON ?AUTO_1370 ?AUTO_1371 )
      ( MAKE-ON-VERIFY ?AUTO_1370 ?AUTO_1371 ) )
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
      ?AUTO_1386 - BLOCK
      ?AUTO_1387 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1381 ?AUTO_1383 ) ( CLEAR ?AUTO_1381 ) ( CLEAR ?AUTO_1386 ) ( ON ?AUTO_1387 ?AUTO_1382 ) ( CLEAR ?AUTO_1387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1387 ?AUTO_1382 )
      ( MAKE-ON ?AUTO_1381 ?AUTO_1382 )
      ( MAKE-ON-VERIFY ?AUTO_1381 ?AUTO_1382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1390 - BLOCK
      ?AUTO_1391 - BLOCK
    )
    :vars
    (
      ?AUTO_1394 - BLOCK
      ?AUTO_1396 - BLOCK
      ?AUTO_1395 - BLOCK
      ?AUTO_1397 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1390 ?AUTO_1394 ) ( CLEAR ?AUTO_1390 ) ( CLEAR ?AUTO_1396 ) ( ON ?AUTO_1395 ?AUTO_1391 ) ( CLEAR ?AUTO_1395 ) ( HOLDING ?AUTO_1397 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1397 )
      ( MAKE-ON ?AUTO_1390 ?AUTO_1391 )
      ( MAKE-ON-VERIFY ?AUTO_1390 ?AUTO_1391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1398 - BLOCK
      ?AUTO_1399 - BLOCK
    )
    :vars
    (
      ?AUTO_1405 - BLOCK
      ?AUTO_1400 - BLOCK
      ?AUTO_1401 - BLOCK
      ?AUTO_1404 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1398 ?AUTO_1405 ) ( CLEAR ?AUTO_1398 ) ( CLEAR ?AUTO_1400 ) ( ON ?AUTO_1401 ?AUTO_1399 ) ( ON ?AUTO_1404 ?AUTO_1401 ) ( CLEAR ?AUTO_1404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1404 ?AUTO_1401 )
      ( MAKE-ON ?AUTO_1398 ?AUTO_1399 )
      ( MAKE-ON-VERIFY ?AUTO_1398 ?AUTO_1399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1408 - BLOCK
      ?AUTO_1409 - BLOCK
    )
    :vars
    (
      ?AUTO_1413 - BLOCK
      ?AUTO_1411 - BLOCK
      ?AUTO_1415 - BLOCK
      ?AUTO_1414 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1413 ) ( ON ?AUTO_1411 ?AUTO_1409 ) ( ON ?AUTO_1415 ?AUTO_1411 ) ( CLEAR ?AUTO_1415 ) ( HOLDING ?AUTO_1408 ) ( CLEAR ?AUTO_1414 ) )
    :subtasks
    ( ( !STACK ?AUTO_1408 ?AUTO_1414 )
      ( MAKE-ON ?AUTO_1408 ?AUTO_1409 )
      ( MAKE-ON-VERIFY ?AUTO_1408 ?AUTO_1409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1420 - BLOCK
      ?AUTO_1421 - BLOCK
    )
    :vars
    (
      ?AUTO_1422 - BLOCK
      ?AUTO_1423 - BLOCK
      ?AUTO_1426 - BLOCK
      ?AUTO_1427 - BLOCK
      ?AUTO_1428 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1420 ?AUTO_1422 ) ( CLEAR ?AUTO_1420 ) ( CLEAR ?AUTO_1423 ) ( ON ?AUTO_1426 ?AUTO_1421 ) ( ON ?AUTO_1427 ?AUTO_1426 ) ( CLEAR ?AUTO_1427 ) ( HOLDING ?AUTO_1428 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1428 )
      ( MAKE-ON ?AUTO_1420 ?AUTO_1421 )
      ( MAKE-ON-VERIFY ?AUTO_1420 ?AUTO_1421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1429 - BLOCK
      ?AUTO_1430 - BLOCK
    )
    :vars
    (
      ?AUTO_1434 - BLOCK
      ?AUTO_1432 - BLOCK
      ?AUTO_1436 - BLOCK
      ?AUTO_1431 - BLOCK
      ?AUTO_1437 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1429 ?AUTO_1434 ) ( CLEAR ?AUTO_1429 ) ( CLEAR ?AUTO_1432 ) ( ON ?AUTO_1436 ?AUTO_1430 ) ( ON ?AUTO_1431 ?AUTO_1436 ) ( ON ?AUTO_1437 ?AUTO_1431 ) ( CLEAR ?AUTO_1437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1437 ?AUTO_1431 )
      ( MAKE-ON ?AUTO_1429 ?AUTO_1430 )
      ( MAKE-ON-VERIFY ?AUTO_1429 ?AUTO_1430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1440 - BLOCK
      ?AUTO_1441 - BLOCK
    )
    :vars
    (
      ?AUTO_1446 - BLOCK
      ?AUTO_1442 - BLOCK
      ?AUTO_1444 - BLOCK
      ?AUTO_1448 - BLOCK
      ?AUTO_1447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1446 ) ( ON ?AUTO_1442 ?AUTO_1441 ) ( ON ?AUTO_1444 ?AUTO_1442 ) ( ON ?AUTO_1448 ?AUTO_1444 ) ( CLEAR ?AUTO_1448 ) ( HOLDING ?AUTO_1440 ) ( CLEAR ?AUTO_1447 ) )
    :subtasks
    ( ( !STACK ?AUTO_1440 ?AUTO_1447 )
      ( MAKE-ON ?AUTO_1440 ?AUTO_1441 )
      ( MAKE-ON-VERIFY ?AUTO_1440 ?AUTO_1441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1451 - BLOCK
      ?AUTO_1452 - BLOCK
    )
    :vars
    (
      ?AUTO_1459 - BLOCK
      ?AUTO_1455 - BLOCK
      ?AUTO_1453 - BLOCK
      ?AUTO_1456 - BLOCK
      ?AUTO_1454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1459 ) ( ON ?AUTO_1455 ?AUTO_1452 ) ( ON ?AUTO_1453 ?AUTO_1455 ) ( ON ?AUTO_1456 ?AUTO_1453 ) ( CLEAR ?AUTO_1454 ) ( ON ?AUTO_1451 ?AUTO_1456 ) ( CLEAR ?AUTO_1451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1451 ?AUTO_1456 )
      ( MAKE-ON ?AUTO_1451 ?AUTO_1452 )
      ( MAKE-ON-VERIFY ?AUTO_1451 ?AUTO_1452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1462 - BLOCK
      ?AUTO_1463 - BLOCK
    )
    :vars
    (
      ?AUTO_1470 - BLOCK
      ?AUTO_1465 - BLOCK
      ?AUTO_1464 - BLOCK
      ?AUTO_1466 - BLOCK
      ?AUTO_1467 - BLOCK
      ?AUTO_1472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1470 ) ( ON ?AUTO_1465 ?AUTO_1463 ) ( ON ?AUTO_1464 ?AUTO_1465 ) ( ON ?AUTO_1466 ?AUTO_1464 ) ( ON ?AUTO_1462 ?AUTO_1466 ) ( CLEAR ?AUTO_1462 ) ( HOLDING ?AUTO_1467 ) ( CLEAR ?AUTO_1472 ) )
    :subtasks
    ( ( !STACK ?AUTO_1467 ?AUTO_1472 )
      ( MAKE-ON ?AUTO_1462 ?AUTO_1463 )
      ( MAKE-ON-VERIFY ?AUTO_1462 ?AUTO_1463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1481 - BLOCK
      ?AUTO_1482 - BLOCK
    )
    :vars
    (
      ?AUTO_1489 - BLOCK
      ?AUTO_1485 - BLOCK
      ?AUTO_1487 - BLOCK
      ?AUTO_1486 - BLOCK
      ?AUTO_1488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1489 ) ( ON ?AUTO_1485 ?AUTO_1482 ) ( ON ?AUTO_1487 ?AUTO_1485 ) ( ON ?AUTO_1486 ?AUTO_1487 ) ( CLEAR ?AUTO_1486 ) ( CLEAR ?AUTO_1488 ) ( ON-TABLE ?AUTO_1481 ) ( CLEAR ?AUTO_1481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1481 )
      ( MAKE-ON ?AUTO_1481 ?AUTO_1482 )
      ( MAKE-ON-VERIFY ?AUTO_1481 ?AUTO_1482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1491 - BLOCK
      ?AUTO_1492 - BLOCK
    )
    :vars
    (
      ?AUTO_1499 - BLOCK
      ?AUTO_1497 - BLOCK
      ?AUTO_1496 - BLOCK
      ?AUTO_1495 - BLOCK
      ?AUTO_1498 - BLOCK
      ?AUTO_1500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1499 ) ( ON ?AUTO_1497 ?AUTO_1492 ) ( ON ?AUTO_1496 ?AUTO_1497 ) ( ON ?AUTO_1495 ?AUTO_1496 ) ( CLEAR ?AUTO_1495 ) ( CLEAR ?AUTO_1498 ) ( ON-TABLE ?AUTO_1491 ) ( CLEAR ?AUTO_1491 ) ( HOLDING ?AUTO_1500 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1500 )
      ( MAKE-ON ?AUTO_1491 ?AUTO_1492 )
      ( MAKE-ON-VERIFY ?AUTO_1491 ?AUTO_1492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1501 - BLOCK
      ?AUTO_1502 - BLOCK
    )
    :vars
    (
      ?AUTO_1505 - BLOCK
      ?AUTO_1504 - BLOCK
      ?AUTO_1510 - BLOCK
      ?AUTO_1507 - BLOCK
      ?AUTO_1508 - BLOCK
      ?AUTO_1503 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1505 ) ( ON ?AUTO_1504 ?AUTO_1502 ) ( ON ?AUTO_1510 ?AUTO_1504 ) ( ON ?AUTO_1507 ?AUTO_1510 ) ( CLEAR ?AUTO_1507 ) ( CLEAR ?AUTO_1508 ) ( ON-TABLE ?AUTO_1501 ) ( ON ?AUTO_1503 ?AUTO_1501 ) ( CLEAR ?AUTO_1503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1503 ?AUTO_1501 )
      ( MAKE-ON ?AUTO_1501 ?AUTO_1502 )
      ( MAKE-ON-VERIFY ?AUTO_1501 ?AUTO_1502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1513 - BLOCK
      ?AUTO_1514 - BLOCK
    )
    :vars
    (
      ?AUTO_1519 - BLOCK
      ?AUTO_1521 - BLOCK
      ?AUTO_1518 - BLOCK
      ?AUTO_1515 - BLOCK
      ?AUTO_1520 - BLOCK
      ?AUTO_1517 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1519 ) ( ON ?AUTO_1521 ?AUTO_1514 ) ( ON ?AUTO_1518 ?AUTO_1521 ) ( CLEAR ?AUTO_1515 ) ( ON-TABLE ?AUTO_1513 ) ( ON ?AUTO_1520 ?AUTO_1513 ) ( CLEAR ?AUTO_1520 ) ( HOLDING ?AUTO_1517 ) ( CLEAR ?AUTO_1518 ) )
    :subtasks
    ( ( !STACK ?AUTO_1517 ?AUTO_1518 )
      ( MAKE-ON ?AUTO_1513 ?AUTO_1514 )
      ( MAKE-ON-VERIFY ?AUTO_1513 ?AUTO_1514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1525 - BLOCK
      ?AUTO_1526 - BLOCK
    )
    :vars
    (
      ?AUTO_1529 - BLOCK
      ?AUTO_1530 - BLOCK
      ?AUTO_1534 - BLOCK
      ?AUTO_1528 - BLOCK
      ?AUTO_1531 - BLOCK
      ?AUTO_1527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1529 ) ( ON ?AUTO_1530 ?AUTO_1526 ) ( ON ?AUTO_1534 ?AUTO_1530 ) ( CLEAR ?AUTO_1528 ) ( ON-TABLE ?AUTO_1525 ) ( ON ?AUTO_1531 ?AUTO_1525 ) ( CLEAR ?AUTO_1534 ) ( ON ?AUTO_1527 ?AUTO_1531 ) ( CLEAR ?AUTO_1527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1527 ?AUTO_1531 )
      ( MAKE-ON ?AUTO_1525 ?AUTO_1526 )
      ( MAKE-ON-VERIFY ?AUTO_1525 ?AUTO_1526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1537 - BLOCK
      ?AUTO_1538 - BLOCK
    )
    :vars
    (
      ?AUTO_1540 - BLOCK
      ?AUTO_1544 - BLOCK
      ?AUTO_1545 - BLOCK
      ?AUTO_1539 - BLOCK
      ?AUTO_1546 - BLOCK
      ?AUTO_1543 - BLOCK
      ?AUTO_1547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1540 ) ( ON ?AUTO_1544 ?AUTO_1538 ) ( ON ?AUTO_1545 ?AUTO_1544 ) ( CLEAR ?AUTO_1539 ) ( ON-TABLE ?AUTO_1537 ) ( ON ?AUTO_1546 ?AUTO_1537 ) ( CLEAR ?AUTO_1545 ) ( ON ?AUTO_1543 ?AUTO_1546 ) ( CLEAR ?AUTO_1543 ) ( HOLDING ?AUTO_1547 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1547 )
      ( MAKE-ON ?AUTO_1537 ?AUTO_1538 )
      ( MAKE-ON-VERIFY ?AUTO_1537 ?AUTO_1538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1548 - BLOCK
      ?AUTO_1549 - BLOCK
    )
    :vars
    (
      ?AUTO_1550 - BLOCK
      ?AUTO_1551 - BLOCK
      ?AUTO_1557 - BLOCK
      ?AUTO_1553 - BLOCK
      ?AUTO_1556 - BLOCK
      ?AUTO_1552 - BLOCK
      ?AUTO_1558 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1550 ) ( ON ?AUTO_1551 ?AUTO_1549 ) ( ON ?AUTO_1557 ?AUTO_1551 ) ( CLEAR ?AUTO_1553 ) ( ON-TABLE ?AUTO_1548 ) ( ON ?AUTO_1556 ?AUTO_1548 ) ( ON ?AUTO_1552 ?AUTO_1556 ) ( CLEAR ?AUTO_1552 ) ( ON ?AUTO_1558 ?AUTO_1557 ) ( CLEAR ?AUTO_1558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1558 ?AUTO_1557 )
      ( MAKE-ON ?AUTO_1548 ?AUTO_1549 )
      ( MAKE-ON-VERIFY ?AUTO_1548 ?AUTO_1549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1563 - BLOCK
      ?AUTO_1564 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1563 ) ( CLEAR ?AUTO_1564 ) )
    :subtasks
    ( ( !STACK ?AUTO_1563 ?AUTO_1564 )
      ( MAKE-ON-VERIFY ?AUTO_1563 ?AUTO_1564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1567 - BLOCK
      ?AUTO_1568 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1568 ) ( ON-TABLE ?AUTO_1567 ) ( CLEAR ?AUTO_1567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1567 )
      ( MAKE-ON ?AUTO_1567 ?AUTO_1568 )
      ( MAKE-ON-VERIFY ?AUTO_1567 ?AUTO_1568 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1572 - BLOCK
      ?AUTO_1573 - BLOCK
    )
    :vars
    (
      ?AUTO_1576 - BLOCK
      ?AUTO_1577 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1573 ) ( ON-TABLE ?AUTO_1572 ) ( CLEAR ?AUTO_1572 ) ( HOLDING ?AUTO_1576 ) ( CLEAR ?AUTO_1577 ) )
    :subtasks
    ( ( !STACK ?AUTO_1576 ?AUTO_1577 )
      ( MAKE-ON ?AUTO_1572 ?AUTO_1573 )
      ( MAKE-ON-VERIFY ?AUTO_1572 ?AUTO_1573 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1578 - BLOCK
      ?AUTO_1579 - BLOCK
    )
    :vars
    (
      ?AUTO_1583 - BLOCK
      ?AUTO_1582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1579 ) ( ON-TABLE ?AUTO_1578 ) ( CLEAR ?AUTO_1583 ) ( ON ?AUTO_1582 ?AUTO_1578 ) ( CLEAR ?AUTO_1582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1582 ?AUTO_1578 )
      ( MAKE-ON ?AUTO_1578 ?AUTO_1579 )
      ( MAKE-ON-VERIFY ?AUTO_1578 ?AUTO_1579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1586 - BLOCK
      ?AUTO_1587 - BLOCK
    )
    :vars
    (
      ?AUTO_1591 - BLOCK
      ?AUTO_1588 - BLOCK
      ?AUTO_1593 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1587 ) ( ON-TABLE ?AUTO_1586 ) ( ON ?AUTO_1591 ?AUTO_1586 ) ( CLEAR ?AUTO_1591 ) ( HOLDING ?AUTO_1588 ) ( CLEAR ?AUTO_1593 ) )
    :subtasks
    ( ( !STACK ?AUTO_1588 ?AUTO_1593 )
      ( MAKE-ON ?AUTO_1586 ?AUTO_1587 )
      ( MAKE-ON-VERIFY ?AUTO_1586 ?AUTO_1587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1596 - BLOCK
      ?AUTO_1597 - BLOCK
    )
    :vars
    (
      ?AUTO_1599 - BLOCK
      ?AUTO_1598 - BLOCK
      ?AUTO_1603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1596 ) ( CLEAR ?AUTO_1599 ) ( ON ?AUTO_1598 ?AUTO_1596 ) ( CLEAR ?AUTO_1598 ) ( HOLDING ?AUTO_1597 ) ( CLEAR ?AUTO_1603 ) )
    :subtasks
    ( ( !STACK ?AUTO_1597 ?AUTO_1603 )
      ( MAKE-ON ?AUTO_1596 ?AUTO_1597 )
      ( MAKE-ON-VERIFY ?AUTO_1596 ?AUTO_1597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1709 - BLOCK
      ?AUTO_1710 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1709 ) ( CLEAR ?AUTO_1710 ) )
    :subtasks
    ( ( !STACK ?AUTO_1709 ?AUTO_1710 )
      ( MAKE-ON-VERIFY ?AUTO_1709 ?AUTO_1710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1713 - BLOCK
      ?AUTO_1714 - BLOCK
    )
    :vars
    (
      ?AUTO_1718 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1714 ) ( ON ?AUTO_1713 ?AUTO_1718 ) ( CLEAR ?AUTO_1713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1713 ?AUTO_1718 )
      ( MAKE-ON ?AUTO_1713 ?AUTO_1714 )
      ( MAKE-ON-VERIFY ?AUTO_1713 ?AUTO_1714 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1719 - BLOCK
      ?AUTO_1720 - BLOCK
    )
    :vars
    (
      ?AUTO_1723 - BLOCK
      ?AUTO_1725 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1719 ?AUTO_1723 ) ( CLEAR ?AUTO_1719 ) ( HOLDING ?AUTO_1720 ) ( CLEAR ?AUTO_1725 ) )
    :subtasks
    ( ( !STACK ?AUTO_1720 ?AUTO_1725 )
      ( MAKE-ON ?AUTO_1719 ?AUTO_1720 )
      ( MAKE-ON-VERIFY ?AUTO_1719 ?AUTO_1720 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1727 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1727 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1727 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1727 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1729 - BLOCK
    )
    :vars
    (
      ?AUTO_1732 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1729 ?AUTO_1732 ) ( CLEAR ?AUTO_1729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1729 ?AUTO_1732 )
      ( MAKE-ON-TABLE ?AUTO_1729 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1735 - BLOCK
      ?AUTO_1736 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1735 ) ( CLEAR ?AUTO_1736 ) )
    :subtasks
    ( ( !STACK ?AUTO_1735 ?AUTO_1736 )
      ( MAKE-ON-VERIFY ?AUTO_1735 ?AUTO_1736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1739 - BLOCK
      ?AUTO_1740 - BLOCK
    )
    :vars
    (
      ?AUTO_1744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1740 ) ( ON ?AUTO_1739 ?AUTO_1744 ) ( CLEAR ?AUTO_1739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1739 ?AUTO_1744 )
      ( MAKE-ON ?AUTO_1739 ?AUTO_1740 )
      ( MAKE-ON-VERIFY ?AUTO_1739 ?AUTO_1740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1745 - BLOCK
      ?AUTO_1746 - BLOCK
    )
    :vars
    (
      ?AUTO_1749 - BLOCK
      ?AUTO_1750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1746 ) ( ON ?AUTO_1745 ?AUTO_1749 ) ( CLEAR ?AUTO_1745 ) ( HOLDING ?AUTO_1750 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1750 )
      ( MAKE-ON ?AUTO_1745 ?AUTO_1746 )
      ( MAKE-ON-VERIFY ?AUTO_1745 ?AUTO_1746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1751 - BLOCK
      ?AUTO_1752 - BLOCK
    )
    :vars
    (
      ?AUTO_1755 - BLOCK
      ?AUTO_1756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1752 ) ( ON ?AUTO_1751 ?AUTO_1755 ) ( ON ?AUTO_1756 ?AUTO_1751 ) ( CLEAR ?AUTO_1756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1756 ?AUTO_1751 )
      ( MAKE-ON ?AUTO_1751 ?AUTO_1752 )
      ( MAKE-ON-VERIFY ?AUTO_1751 ?AUTO_1752 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1760 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1760 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1760 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1760 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1762 - BLOCK
    )
    :vars
    (
      ?AUTO_1765 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1762 ?AUTO_1765 ) ( CLEAR ?AUTO_1762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1762 ?AUTO_1765 )
      ( MAKE-ON-TABLE ?AUTO_1762 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1762 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1766 - BLOCK
    )
    :vars
    (
      ?AUTO_1768 - BLOCK
      ?AUTO_1769 - BLOCK
      ?AUTO_1770 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1766 ?AUTO_1768 ) ( CLEAR ?AUTO_1766 ) ( HOLDING ?AUTO_1769 ) ( CLEAR ?AUTO_1770 ) )
    :subtasks
    ( ( !STACK ?AUTO_1769 ?AUTO_1770 )
      ( MAKE-ON-TABLE ?AUTO_1766 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1766 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1771 - BLOCK
    )
    :vars
    (
      ?AUTO_1773 - BLOCK
      ?AUTO_1775 - BLOCK
      ?AUTO_1774 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1771 ?AUTO_1773 ) ( CLEAR ?AUTO_1775 ) ( ON ?AUTO_1774 ?AUTO_1771 ) ( CLEAR ?AUTO_1774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1774 ?AUTO_1771 )
      ( MAKE-ON-TABLE ?AUTO_1771 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1771 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1778 - BLOCK
    )
    :vars
    (
      ?AUTO_1781 - BLOCK
      ?AUTO_1779 - BLOCK
      ?AUTO_1782 - BLOCK
      ?AUTO_1783 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1778 ?AUTO_1781 ) ( CLEAR ?AUTO_1779 ) ( ON ?AUTO_1782 ?AUTO_1778 ) ( CLEAR ?AUTO_1782 ) ( HOLDING ?AUTO_1783 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1783 )
      ( MAKE-ON-TABLE ?AUTO_1778 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1778 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1784 - BLOCK
    )
    :vars
    (
      ?AUTO_1789 - BLOCK
      ?AUTO_1787 - BLOCK
      ?AUTO_1786 - BLOCK
      ?AUTO_1785 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1784 ?AUTO_1789 ) ( CLEAR ?AUTO_1787 ) ( ON ?AUTO_1786 ?AUTO_1784 ) ( ON ?AUTO_1785 ?AUTO_1786 ) ( CLEAR ?AUTO_1785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1785 ?AUTO_1786 )
      ( MAKE-ON-TABLE ?AUTO_1784 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1784 ) )
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
    :vars
    (
      ?AUTO_1803 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1799 ) ( ON ?AUTO_1798 ?AUTO_1803 ) ( CLEAR ?AUTO_1798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1798 ?AUTO_1803 )
      ( MAKE-ON ?AUTO_1798 ?AUTO_1799 )
      ( MAKE-ON-VERIFY ?AUTO_1798 ?AUTO_1799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1804 - BLOCK
      ?AUTO_1805 - BLOCK
    )
    :vars
    (
      ?AUTO_1808 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1804 ?AUTO_1808 ) ( CLEAR ?AUTO_1804 ) ( HOLDING ?AUTO_1805 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1805 )
      ( MAKE-ON ?AUTO_1804 ?AUTO_1805 )
      ( MAKE-ON-VERIFY ?AUTO_1804 ?AUTO_1805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1812 - BLOCK
      ?AUTO_1813 - BLOCK
    )
    :vars
    (
      ?AUTO_1814 - BLOCK
      ?AUTO_1817 - BLOCK
      ?AUTO_1818 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1813 ) ( ON ?AUTO_1812 ?AUTO_1814 ) ( CLEAR ?AUTO_1812 ) ( HOLDING ?AUTO_1817 ) ( CLEAR ?AUTO_1818 ) )
    :subtasks
    ( ( !STACK ?AUTO_1817 ?AUTO_1818 )
      ( MAKE-ON ?AUTO_1812 ?AUTO_1813 )
      ( MAKE-ON-VERIFY ?AUTO_1812 ?AUTO_1813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1819 - BLOCK
      ?AUTO_1820 - BLOCK
    )
    :vars
    (
      ?AUTO_1823 - BLOCK
      ?AUTO_1825 - BLOCK
      ?AUTO_1824 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1819 ?AUTO_1823 ) ( CLEAR ?AUTO_1819 ) ( CLEAR ?AUTO_1825 ) ( ON ?AUTO_1824 ?AUTO_1820 ) ( CLEAR ?AUTO_1824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1824 ?AUTO_1820 )
      ( MAKE-ON ?AUTO_1819 ?AUTO_1820 )
      ( MAKE-ON-VERIFY ?AUTO_1819 ?AUTO_1820 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1828 - BLOCK
      ?AUTO_1829 - BLOCK
    )
    :vars
    (
      ?AUTO_1834 - BLOCK
      ?AUTO_1830 - BLOCK
      ?AUTO_1831 - BLOCK
      ?AUTO_1835 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1828 ?AUTO_1834 ) ( CLEAR ?AUTO_1828 ) ( CLEAR ?AUTO_1830 ) ( ON ?AUTO_1831 ?AUTO_1829 ) ( CLEAR ?AUTO_1831 ) ( HOLDING ?AUTO_1835 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1835 )
      ( MAKE-ON ?AUTO_1828 ?AUTO_1829 )
      ( MAKE-ON-VERIFY ?AUTO_1828 ?AUTO_1829 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1836 - BLOCK
      ?AUTO_1837 - BLOCK
    )
    :vars
    (
      ?AUTO_1843 - BLOCK
      ?AUTO_1838 - BLOCK
      ?AUTO_1840 - BLOCK
      ?AUTO_1842 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1836 ?AUTO_1843 ) ( CLEAR ?AUTO_1836 ) ( CLEAR ?AUTO_1838 ) ( ON ?AUTO_1840 ?AUTO_1837 ) ( ON ?AUTO_1842 ?AUTO_1840 ) ( CLEAR ?AUTO_1842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1842 ?AUTO_1840 )
      ( MAKE-ON ?AUTO_1836 ?AUTO_1837 )
      ( MAKE-ON-VERIFY ?AUTO_1836 ?AUTO_1837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1848 - BLOCK
      ?AUTO_1849 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1848 ) ( CLEAR ?AUTO_1849 ) )
    :subtasks
    ( ( !STACK ?AUTO_1848 ?AUTO_1849 )
      ( MAKE-ON-VERIFY ?AUTO_1848 ?AUTO_1849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1852 - BLOCK
      ?AUTO_1853 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1853 ) ( ON-TABLE ?AUTO_1852 ) ( CLEAR ?AUTO_1852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1852 )
      ( MAKE-ON ?AUTO_1852 ?AUTO_1853 )
      ( MAKE-ON-VERIFY ?AUTO_1852 ?AUTO_1853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1857 - BLOCK
      ?AUTO_1858 - BLOCK
    )
    :vars
    (
      ?AUTO_1861 - BLOCK
      ?AUTO_1862 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1858 ) ( ON-TABLE ?AUTO_1857 ) ( CLEAR ?AUTO_1857 ) ( HOLDING ?AUTO_1861 ) ( CLEAR ?AUTO_1862 ) )
    :subtasks
    ( ( !STACK ?AUTO_1861 ?AUTO_1862 )
      ( MAKE-ON ?AUTO_1857 ?AUTO_1858 )
      ( MAKE-ON-VERIFY ?AUTO_1857 ?AUTO_1858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1863 - BLOCK
      ?AUTO_1864 - BLOCK
    )
    :vars
    (
      ?AUTO_1866 - BLOCK
      ?AUTO_1868 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1864 ) ( ON-TABLE ?AUTO_1863 ) ( CLEAR ?AUTO_1866 ) ( ON ?AUTO_1868 ?AUTO_1863 ) ( CLEAR ?AUTO_1868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1868 ?AUTO_1863 )
      ( MAKE-ON ?AUTO_1863 ?AUTO_1864 )
      ( MAKE-ON-VERIFY ?AUTO_1863 ?AUTO_1864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1871 - BLOCK
      ?AUTO_1872 - BLOCK
    )
    :vars
    (
      ?AUTO_1876 - BLOCK
      ?AUTO_1875 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1872 ) ( ON-TABLE ?AUTO_1871 ) ( ON ?AUTO_1876 ?AUTO_1871 ) ( CLEAR ?AUTO_1876 ) ( HOLDING ?AUTO_1875 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1875 )
      ( MAKE-ON ?AUTO_1871 ?AUTO_1872 )
      ( MAKE-ON-VERIFY ?AUTO_1871 ?AUTO_1872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1878 - BLOCK
      ?AUTO_1879 - BLOCK
    )
    :vars
    (
      ?AUTO_1882 - BLOCK
      ?AUTO_1883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1878 ) ( ON ?AUTO_1882 ?AUTO_1878 ) ( CLEAR ?AUTO_1882 ) ( ON ?AUTO_1883 ?AUTO_1879 ) ( CLEAR ?AUTO_1883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1883 ?AUTO_1879 )
      ( MAKE-ON ?AUTO_1878 ?AUTO_1879 )
      ( MAKE-ON-VERIFY ?AUTO_1878 ?AUTO_1879 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1886 - BLOCK
      ?AUTO_1887 - BLOCK
    )
    :vars
    (
      ?AUTO_1890 - BLOCK
      ?AUTO_1889 - BLOCK
      ?AUTO_1892 - BLOCK
      ?AUTO_1893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1886 ) ( ON ?AUTO_1890 ?AUTO_1886 ) ( CLEAR ?AUTO_1890 ) ( ON ?AUTO_1889 ?AUTO_1887 ) ( CLEAR ?AUTO_1889 ) ( HOLDING ?AUTO_1892 ) ( CLEAR ?AUTO_1893 ) )
    :subtasks
    ( ( !STACK ?AUTO_1892 ?AUTO_1893 )
      ( MAKE-ON ?AUTO_1886 ?AUTO_1887 )
      ( MAKE-ON-VERIFY ?AUTO_1886 ?AUTO_1887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1894 - BLOCK
      ?AUTO_1895 - BLOCK
    )
    :vars
    (
      ?AUTO_1899 - BLOCK
      ?AUTO_1898 - BLOCK
      ?AUTO_1901 - BLOCK
      ?AUTO_1900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1894 ) ( ON ?AUTO_1899 ?AUTO_1894 ) ( CLEAR ?AUTO_1899 ) ( ON ?AUTO_1898 ?AUTO_1895 ) ( CLEAR ?AUTO_1901 ) ( ON ?AUTO_1900 ?AUTO_1898 ) ( CLEAR ?AUTO_1900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1900 ?AUTO_1898 )
      ( MAKE-ON ?AUTO_1894 ?AUTO_1895 )
      ( MAKE-ON-VERIFY ?AUTO_1894 ?AUTO_1895 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1904 - BLOCK
      ?AUTO_1905 - BLOCK
    )
    :vars
    (
      ?AUTO_1910 - BLOCK
      ?AUTO_1911 - BLOCK
      ?AUTO_1909 - BLOCK
      ?AUTO_1906 - BLOCK
      ?AUTO_1912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1904 ) ( ON ?AUTO_1910 ?AUTO_1904 ) ( CLEAR ?AUTO_1910 ) ( ON ?AUTO_1911 ?AUTO_1905 ) ( CLEAR ?AUTO_1909 ) ( ON ?AUTO_1906 ?AUTO_1911 ) ( CLEAR ?AUTO_1906 ) ( HOLDING ?AUTO_1912 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1912 )
      ( MAKE-ON ?AUTO_1904 ?AUTO_1905 )
      ( MAKE-ON-VERIFY ?AUTO_1904 ?AUTO_1905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1913 - BLOCK
      ?AUTO_1914 - BLOCK
    )
    :vars
    (
      ?AUTO_1916 - BLOCK
      ?AUTO_1920 - BLOCK
      ?AUTO_1915 - BLOCK
      ?AUTO_1917 - BLOCK
      ?AUTO_1921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1913 ) ( ON ?AUTO_1916 ?AUTO_1913 ) ( CLEAR ?AUTO_1916 ) ( ON ?AUTO_1920 ?AUTO_1914 ) ( CLEAR ?AUTO_1915 ) ( ON ?AUTO_1917 ?AUTO_1920 ) ( ON ?AUTO_1921 ?AUTO_1917 ) ( CLEAR ?AUTO_1921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1921 ?AUTO_1917 )
      ( MAKE-ON ?AUTO_1913 ?AUTO_1914 )
      ( MAKE-ON-VERIFY ?AUTO_1913 ?AUTO_1914 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1925 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1925 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1925 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1925 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1927 - BLOCK
    )
    :vars
    (
      ?AUTO_1930 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1927 ?AUTO_1930 ) ( CLEAR ?AUTO_1927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1927 ?AUTO_1930 )
      ( MAKE-ON-TABLE ?AUTO_1927 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1927 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1931 - BLOCK
    )
    :vars
    (
      ?AUTO_1933 - BLOCK
      ?AUTO_1934 - BLOCK
      ?AUTO_1935 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1931 ?AUTO_1933 ) ( CLEAR ?AUTO_1931 ) ( HOLDING ?AUTO_1934 ) ( CLEAR ?AUTO_1935 ) )
    :subtasks
    ( ( !STACK ?AUTO_1934 ?AUTO_1935 )
      ( MAKE-ON-TABLE ?AUTO_1931 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1931 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1946 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1946 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1946 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1946 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1948 - BLOCK
    )
    :vars
    (
      ?AUTO_1951 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1948 ?AUTO_1951 ) ( CLEAR ?AUTO_1948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1948 ?AUTO_1951 )
      ( MAKE-ON-TABLE ?AUTO_1948 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1948 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1952 - BLOCK
    )
    :vars
    (
      ?AUTO_1954 - BLOCK
      ?AUTO_1955 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1952 ?AUTO_1954 ) ( CLEAR ?AUTO_1952 ) ( HOLDING ?AUTO_1955 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1955 )
      ( MAKE-ON-TABLE ?AUTO_1952 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1952 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1956 - BLOCK
    )
    :vars
    (
      ?AUTO_1958 - BLOCK
      ?AUTO_1959 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1956 ?AUTO_1958 ) ( ON ?AUTO_1959 ?AUTO_1956 ) ( CLEAR ?AUTO_1959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1959 ?AUTO_1956 )
      ( MAKE-ON-TABLE ?AUTO_1956 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1956 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1962 - BLOCK
    )
    :vars
    (
      ?AUTO_1963 - BLOCK
      ?AUTO_1964 - BLOCK
      ?AUTO_1966 - BLOCK
      ?AUTO_1967 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1962 ?AUTO_1963 ) ( ON ?AUTO_1964 ?AUTO_1962 ) ( CLEAR ?AUTO_1964 ) ( HOLDING ?AUTO_1966 ) ( CLEAR ?AUTO_1967 ) )
    :subtasks
    ( ( !STACK ?AUTO_1966 ?AUTO_1967 )
      ( MAKE-ON-TABLE ?AUTO_1962 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1962 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1978 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1978 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1978 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1978 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1980 - BLOCK
    )
    :vars
    (
      ?AUTO_1983 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1980 ?AUTO_1983 ) ( CLEAR ?AUTO_1980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1980 ?AUTO_1983 )
      ( MAKE-ON-TABLE ?AUTO_1980 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1980 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1984 - BLOCK
    )
    :vars
    (
      ?AUTO_1986 - BLOCK
      ?AUTO_1987 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1984 ?AUTO_1986 ) ( CLEAR ?AUTO_1984 ) ( HOLDING ?AUTO_1987 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1987 )
      ( MAKE-ON-TABLE ?AUTO_1984 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1984 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1988 - BLOCK
    )
    :vars
    (
      ?AUTO_1990 - BLOCK
      ?AUTO_1991 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1988 ?AUTO_1990 ) ( ON ?AUTO_1991 ?AUTO_1988 ) ( CLEAR ?AUTO_1991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1991 ?AUTO_1988 )
      ( MAKE-ON-TABLE ?AUTO_1988 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1988 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1994 - BLOCK
    )
    :vars
    (
      ?AUTO_1995 - BLOCK
      ?AUTO_1996 - BLOCK
      ?AUTO_1998 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1994 ?AUTO_1995 ) ( ON ?AUTO_1996 ?AUTO_1994 ) ( CLEAR ?AUTO_1996 ) ( HOLDING ?AUTO_1998 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1998 )
      ( MAKE-ON-TABLE ?AUTO_1994 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1994 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1999 - BLOCK
    )
    :vars
    (
      ?AUTO_2001 - BLOCK
      ?AUTO_2002 - BLOCK
      ?AUTO_2003 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1999 ?AUTO_2001 ) ( ON ?AUTO_2002 ?AUTO_1999 ) ( ON ?AUTO_2003 ?AUTO_2002 ) ( CLEAR ?AUTO_2003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2003 ?AUTO_2002 )
      ( MAKE-ON-TABLE ?AUTO_1999 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1999 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2006 - BLOCK
    )
    :vars
    (
      ?AUTO_2010 - BLOCK
      ?AUTO_2009 - BLOCK
      ?AUTO_2007 - BLOCK
      ?AUTO_2011 - BLOCK
      ?AUTO_2012 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2006 ?AUTO_2010 ) ( ON ?AUTO_2009 ?AUTO_2006 ) ( ON ?AUTO_2007 ?AUTO_2009 ) ( CLEAR ?AUTO_2007 ) ( HOLDING ?AUTO_2011 ) ( CLEAR ?AUTO_2012 ) )
    :subtasks
    ( ( !STACK ?AUTO_2011 ?AUTO_2012 )
      ( MAKE-ON-TABLE ?AUTO_2006 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2024 - BLOCK
      ?AUTO_2025 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2024 ) ( CLEAR ?AUTO_2025 ) )
    :subtasks
    ( ( !STACK ?AUTO_2024 ?AUTO_2025 )
      ( MAKE-ON-VERIFY ?AUTO_2024 ?AUTO_2025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2028 - BLOCK
      ?AUTO_2029 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2029 ) ( ON-TABLE ?AUTO_2028 ) ( CLEAR ?AUTO_2028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2028 )
      ( MAKE-ON ?AUTO_2028 ?AUTO_2029 )
      ( MAKE-ON-VERIFY ?AUTO_2028 ?AUTO_2029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2033 - BLOCK
      ?AUTO_2034 - BLOCK
    )
    :vars
    (
      ?AUTO_2037 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2034 ) ( ON-TABLE ?AUTO_2033 ) ( CLEAR ?AUTO_2033 ) ( HOLDING ?AUTO_2037 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2037 )
      ( MAKE-ON ?AUTO_2033 ?AUTO_2034 )
      ( MAKE-ON-VERIFY ?AUTO_2033 ?AUTO_2034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2038 - BLOCK
      ?AUTO_2039 - BLOCK
    )
    :vars
    (
      ?AUTO_2042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2039 ) ( ON-TABLE ?AUTO_2038 ) ( ON ?AUTO_2042 ?AUTO_2038 ) ( CLEAR ?AUTO_2042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2042 ?AUTO_2038 )
      ( MAKE-ON ?AUTO_2038 ?AUTO_2039 )
      ( MAKE-ON-VERIFY ?AUTO_2038 ?AUTO_2039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2045 - BLOCK
      ?AUTO_2046 - BLOCK
    )
    :vars
    (
      ?AUTO_2048 - BLOCK
      ?AUTO_2050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2046 ) ( ON-TABLE ?AUTO_2045 ) ( ON ?AUTO_2048 ?AUTO_2045 ) ( CLEAR ?AUTO_2048 ) ( HOLDING ?AUTO_2050 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2050 )
      ( MAKE-ON ?AUTO_2045 ?AUTO_2046 )
      ( MAKE-ON-VERIFY ?AUTO_2045 ?AUTO_2046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2051 - BLOCK
      ?AUTO_2052 - BLOCK
    )
    :vars
    (
      ?AUTO_2053 - BLOCK
      ?AUTO_2056 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2052 ) ( ON-TABLE ?AUTO_2051 ) ( ON ?AUTO_2053 ?AUTO_2051 ) ( ON ?AUTO_2056 ?AUTO_2053 ) ( CLEAR ?AUTO_2056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2056 ?AUTO_2053 )
      ( MAKE-ON ?AUTO_2051 ?AUTO_2052 )
      ( MAKE-ON-VERIFY ?AUTO_2051 ?AUTO_2052 ) )
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
      ?AUTO_2064 - BLOCK
      ?AUTO_2065 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2060 ) ( ON-TABLE ?AUTO_2059 ) ( ON ?AUTO_2061 ?AUTO_2059 ) ( ON ?AUTO_2064 ?AUTO_2061 ) ( CLEAR ?AUTO_2064 ) ( HOLDING ?AUTO_2065 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2065 )
      ( MAKE-ON ?AUTO_2059 ?AUTO_2060 )
      ( MAKE-ON-VERIFY ?AUTO_2059 ?AUTO_2060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2066 - BLOCK
      ?AUTO_2067 - BLOCK
    )
    :vars
    (
      ?AUTO_2068 - BLOCK
      ?AUTO_2071 - BLOCK
      ?AUTO_2072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2067 ) ( ON-TABLE ?AUTO_2066 ) ( ON ?AUTO_2068 ?AUTO_2066 ) ( ON ?AUTO_2071 ?AUTO_2068 ) ( ON ?AUTO_2072 ?AUTO_2071 ) ( CLEAR ?AUTO_2072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2072 ?AUTO_2071 )
      ( MAKE-ON ?AUTO_2066 ?AUTO_2067 )
      ( MAKE-ON-VERIFY ?AUTO_2066 ?AUTO_2067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2075 - BLOCK
      ?AUTO_2076 - BLOCK
    )
    :vars
    (
      ?AUTO_2079 - BLOCK
      ?AUTO_2080 - BLOCK
      ?AUTO_2077 - BLOCK
      ?AUTO_2082 - BLOCK
      ?AUTO_2083 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2076 ) ( ON-TABLE ?AUTO_2075 ) ( ON ?AUTO_2079 ?AUTO_2075 ) ( ON ?AUTO_2080 ?AUTO_2079 ) ( ON ?AUTO_2077 ?AUTO_2080 ) ( CLEAR ?AUTO_2077 ) ( HOLDING ?AUTO_2082 ) ( CLEAR ?AUTO_2083 ) )
    :subtasks
    ( ( !STACK ?AUTO_2082 ?AUTO_2083 )
      ( MAKE-ON ?AUTO_2075 ?AUTO_2076 )
      ( MAKE-ON-VERIFY ?AUTO_2075 ?AUTO_2076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2104 - BLOCK
      ?AUTO_2105 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2104 ) ( CLEAR ?AUTO_2105 ) )
    :subtasks
    ( ( !STACK ?AUTO_2104 ?AUTO_2105 )
      ( MAKE-ON-VERIFY ?AUTO_2104 ?AUTO_2105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2108 - BLOCK
      ?AUTO_2109 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2109 ) ( ON-TABLE ?AUTO_2108 ) ( CLEAR ?AUTO_2108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2108 )
      ( MAKE-ON ?AUTO_2108 ?AUTO_2109 )
      ( MAKE-ON-VERIFY ?AUTO_2108 ?AUTO_2109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2113 - BLOCK
      ?AUTO_2114 - BLOCK
    )
    :vars
    (
      ?AUTO_2118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2113 ) ( CLEAR ?AUTO_2113 ) ( HOLDING ?AUTO_2114 ) ( CLEAR ?AUTO_2118 ) )
    :subtasks
    ( ( !STACK ?AUTO_2114 ?AUTO_2118 )
      ( MAKE-ON ?AUTO_2113 ?AUTO_2114 )
      ( MAKE-ON-VERIFY ?AUTO_2113 ?AUTO_2114 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2123 - BLOCK
      ?AUTO_2124 - BLOCK
    )
    :vars
    (
      ?AUTO_2127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2123 ) ( CLEAR ?AUTO_2123 ) ( ON ?AUTO_2127 ?AUTO_2124 ) ( CLEAR ?AUTO_2127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2127 ?AUTO_2124 )
      ( MAKE-ON ?AUTO_2123 ?AUTO_2124 )
      ( MAKE-ON-VERIFY ?AUTO_2123 ?AUTO_2124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2130 - BLOCK
      ?AUTO_2131 - BLOCK
    )
    :vars
    (
      ?AUTO_2134 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2134 ?AUTO_2131 ) ( CLEAR ?AUTO_2134 ) ( HOLDING ?AUTO_2130 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2130 )
      ( MAKE-ON ?AUTO_2130 ?AUTO_2131 )
      ( MAKE-ON-VERIFY ?AUTO_2130 ?AUTO_2131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2136 - BLOCK
      ?AUTO_2137 - BLOCK
    )
    :vars
    (
      ?AUTO_2140 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2140 ?AUTO_2137 ) ( ON ?AUTO_2136 ?AUTO_2140 ) ( CLEAR ?AUTO_2136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2136 ?AUTO_2140 )
      ( MAKE-ON ?AUTO_2136 ?AUTO_2137 )
      ( MAKE-ON-VERIFY ?AUTO_2136 ?AUTO_2137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2143 - BLOCK
      ?AUTO_2144 - BLOCK
    )
    :vars
    (
      ?AUTO_2145 - BLOCK
      ?AUTO_2148 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2145 ?AUTO_2144 ) ( ON ?AUTO_2143 ?AUTO_2145 ) ( CLEAR ?AUTO_2143 ) ( HOLDING ?AUTO_2148 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2148 )
      ( MAKE-ON ?AUTO_2143 ?AUTO_2144 )
      ( MAKE-ON-VERIFY ?AUTO_2143 ?AUTO_2144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2149 - BLOCK
      ?AUTO_2150 - BLOCK
    )
    :vars
    (
      ?AUTO_2153 - BLOCK
      ?AUTO_2154 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2153 ?AUTO_2150 ) ( ON ?AUTO_2149 ?AUTO_2153 ) ( ON ?AUTO_2154 ?AUTO_2149 ) ( CLEAR ?AUTO_2154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2154 ?AUTO_2149 )
      ( MAKE-ON ?AUTO_2149 ?AUTO_2150 )
      ( MAKE-ON-VERIFY ?AUTO_2149 ?AUTO_2150 ) )
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
      ?AUTO_2163 - BLOCK
      ?AUTO_2164 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2159 ?AUTO_2158 ) ( ON ?AUTO_2157 ?AUTO_2159 ) ( ON ?AUTO_2160 ?AUTO_2157 ) ( CLEAR ?AUTO_2160 ) ( HOLDING ?AUTO_2163 ) ( CLEAR ?AUTO_2164 ) )
    :subtasks
    ( ( !STACK ?AUTO_2163 ?AUTO_2164 )
      ( MAKE-ON ?AUTO_2157 ?AUTO_2158 )
      ( MAKE-ON-VERIFY ?AUTO_2157 ?AUTO_2158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2185 - BLOCK
      ?AUTO_2186 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2185 ) ( CLEAR ?AUTO_2186 ) )
    :subtasks
    ( ( !STACK ?AUTO_2185 ?AUTO_2186 )
      ( MAKE-ON-VERIFY ?AUTO_2185 ?AUTO_2186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2189 - BLOCK
      ?AUTO_2190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2190 ) ( ON-TABLE ?AUTO_2189 ) ( CLEAR ?AUTO_2189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2189 )
      ( MAKE-ON ?AUTO_2189 ?AUTO_2190 )
      ( MAKE-ON-VERIFY ?AUTO_2189 ?AUTO_2190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2194 - BLOCK
      ?AUTO_2195 - BLOCK
    )
    :vars
    (
      ?AUTO_2199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2194 ) ( CLEAR ?AUTO_2194 ) ( HOLDING ?AUTO_2195 ) ( CLEAR ?AUTO_2199 ) )
    :subtasks
    ( ( !STACK ?AUTO_2195 ?AUTO_2199 )
      ( MAKE-ON ?AUTO_2194 ?AUTO_2195 )
      ( MAKE-ON-VERIFY ?AUTO_2194 ?AUTO_2195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2202 - BLOCK
      ?AUTO_2203 - BLOCK
    )
    :vars
    (
      ?AUTO_2206 - BLOCK
      ?AUTO_2207 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2203 ) ( ON-TABLE ?AUTO_2202 ) ( CLEAR ?AUTO_2202 ) ( HOLDING ?AUTO_2206 ) ( CLEAR ?AUTO_2207 ) )
    :subtasks
    ( ( !STACK ?AUTO_2206 ?AUTO_2207 )
      ( MAKE-ON ?AUTO_2202 ?AUTO_2203 )
      ( MAKE-ON-VERIFY ?AUTO_2202 ?AUTO_2203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2307 - BLOCK
      ?AUTO_2308 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2307 ) ( CLEAR ?AUTO_2308 ) )
    :subtasks
    ( ( !STACK ?AUTO_2307 ?AUTO_2308 )
      ( MAKE-ON-VERIFY ?AUTO_2307 ?AUTO_2308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2311 - BLOCK
      ?AUTO_2312 - BLOCK
    )
    :vars
    (
      ?AUTO_2316 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2312 ) ( ON ?AUTO_2311 ?AUTO_2316 ) ( CLEAR ?AUTO_2311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2311 ?AUTO_2316 )
      ( MAKE-ON ?AUTO_2311 ?AUTO_2312 )
      ( MAKE-ON-VERIFY ?AUTO_2311 ?AUTO_2312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2317 - BLOCK
      ?AUTO_2318 - BLOCK
    )
    :vars
    (
      ?AUTO_2321 - BLOCK
      ?AUTO_2322 - BLOCK
      ?AUTO_2323 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2318 ) ( ON ?AUTO_2317 ?AUTO_2321 ) ( CLEAR ?AUTO_2317 ) ( HOLDING ?AUTO_2322 ) ( CLEAR ?AUTO_2323 ) )
    :subtasks
    ( ( !STACK ?AUTO_2322 ?AUTO_2323 )
      ( MAKE-ON ?AUTO_2317 ?AUTO_2318 )
      ( MAKE-ON-VERIFY ?AUTO_2317 ?AUTO_2318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2334 - BLOCK
      ?AUTO_2335 - BLOCK
    )
    :vars
    (
      ?AUTO_2338 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2334 ?AUTO_2338 ) ( CLEAR ?AUTO_2334 ) ( HOLDING ?AUTO_2335 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2335 )
      ( MAKE-ON ?AUTO_2334 ?AUTO_2335 )
      ( MAKE-ON-VERIFY ?AUTO_2334 ?AUTO_2335 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2344 - BLOCK
      ?AUTO_2345 - BLOCK
    )
    :vars
    (
      ?AUTO_2346 - BLOCK
      ?AUTO_2349 - BLOCK
      ?AUTO_2350 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2344 ?AUTO_2346 ) ( CLEAR ?AUTO_2344 ) ( CLEAR ?AUTO_2349 ) ( ON ?AUTO_2350 ?AUTO_2345 ) ( CLEAR ?AUTO_2350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2350 ?AUTO_2345 )
      ( MAKE-ON ?AUTO_2344 ?AUTO_2345 )
      ( MAKE-ON-VERIFY ?AUTO_2344 ?AUTO_2345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2353 - BLOCK
      ?AUTO_2354 - BLOCK
    )
    :vars
    (
      ?AUTO_2357 - BLOCK
      ?AUTO_2358 - BLOCK
      ?AUTO_2359 - BLOCK
      ?AUTO_2360 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2353 ?AUTO_2357 ) ( CLEAR ?AUTO_2353 ) ( CLEAR ?AUTO_2358 ) ( ON ?AUTO_2359 ?AUTO_2354 ) ( CLEAR ?AUTO_2359 ) ( HOLDING ?AUTO_2360 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2360 )
      ( MAKE-ON ?AUTO_2353 ?AUTO_2354 )
      ( MAKE-ON-VERIFY ?AUTO_2353 ?AUTO_2354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2361 - BLOCK
      ?AUTO_2362 - BLOCK
    )
    :vars
    (
      ?AUTO_2368 - BLOCK
      ?AUTO_2363 - BLOCK
      ?AUTO_2364 - BLOCK
      ?AUTO_2367 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2361 ?AUTO_2368 ) ( CLEAR ?AUTO_2361 ) ( CLEAR ?AUTO_2363 ) ( ON ?AUTO_2364 ?AUTO_2362 ) ( ON ?AUTO_2367 ?AUTO_2364 ) ( CLEAR ?AUTO_2367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2367 ?AUTO_2364 )
      ( MAKE-ON ?AUTO_2361 ?AUTO_2362 )
      ( MAKE-ON-VERIFY ?AUTO_2361 ?AUTO_2362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2371 - BLOCK
      ?AUTO_2372 - BLOCK
    )
    :vars
    (
      ?AUTO_2377 - BLOCK
      ?AUTO_2374 - BLOCK
      ?AUTO_2376 - BLOCK
      ?AUTO_2378 - BLOCK
      ?AUTO_2379 - BLOCK
      ?AUTO_2380 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2371 ?AUTO_2377 ) ( CLEAR ?AUTO_2371 ) ( CLEAR ?AUTO_2374 ) ( ON ?AUTO_2376 ?AUTO_2372 ) ( ON ?AUTO_2378 ?AUTO_2376 ) ( CLEAR ?AUTO_2378 ) ( HOLDING ?AUTO_2379 ) ( CLEAR ?AUTO_2380 ) )
    :subtasks
    ( ( !STACK ?AUTO_2379 ?AUTO_2380 )
      ( MAKE-ON ?AUTO_2371 ?AUTO_2372 )
      ( MAKE-ON-VERIFY ?AUTO_2371 ?AUTO_2372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2383 - BLOCK
      ?AUTO_2384 - BLOCK
    )
    :vars
    (
      ?AUTO_2388 - BLOCK
      ?AUTO_2385 - BLOCK
      ?AUTO_2390 - BLOCK
      ?AUTO_2387 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2388 ) ( ON ?AUTO_2385 ?AUTO_2384 ) ( ON ?AUTO_2390 ?AUTO_2385 ) ( CLEAR ?AUTO_2390 ) ( HOLDING ?AUTO_2383 ) ( CLEAR ?AUTO_2387 ) )
    :subtasks
    ( ( !STACK ?AUTO_2383 ?AUTO_2387 )
      ( MAKE-ON ?AUTO_2383 ?AUTO_2384 )
      ( MAKE-ON-VERIFY ?AUTO_2383 ?AUTO_2384 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2392 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2392 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2392 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2392 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2394 - BLOCK
    )
    :vars
    (
      ?AUTO_2397 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2394 ?AUTO_2397 ) ( CLEAR ?AUTO_2394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2394 ?AUTO_2397 )
      ( MAKE-ON-TABLE ?AUTO_2394 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2394 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2399 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2399 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2399 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2399 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2401 - BLOCK
    )
    :vars
    (
      ?AUTO_2404 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2401 ?AUTO_2404 ) ( CLEAR ?AUTO_2401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2401 ?AUTO_2404 )
      ( MAKE-ON-TABLE ?AUTO_2401 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2401 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2405 - BLOCK
    )
    :vars
    (
      ?AUTO_2407 - BLOCK
      ?AUTO_2408 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2405 ?AUTO_2407 ) ( CLEAR ?AUTO_2405 ) ( HOLDING ?AUTO_2408 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2408 )
      ( MAKE-ON-TABLE ?AUTO_2405 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2405 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2409 - BLOCK
    )
    :vars
    (
      ?AUTO_2411 - BLOCK
      ?AUTO_2412 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2409 ?AUTO_2411 ) ( ON ?AUTO_2412 ?AUTO_2409 ) ( CLEAR ?AUTO_2412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2412 ?AUTO_2409 )
      ( MAKE-ON-TABLE ?AUTO_2409 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2409 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2416 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2416 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2416 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2416 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2418 - BLOCK
    )
    :vars
    (
      ?AUTO_2421 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2418 ?AUTO_2421 ) ( CLEAR ?AUTO_2418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2418 ?AUTO_2421 )
      ( MAKE-ON-TABLE ?AUTO_2418 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2418 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2422 - BLOCK
    )
    :vars
    (
      ?AUTO_2424 - BLOCK
      ?AUTO_2425 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2422 ?AUTO_2424 ) ( CLEAR ?AUTO_2422 ) ( HOLDING ?AUTO_2425 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2425 )
      ( MAKE-ON-TABLE ?AUTO_2422 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2422 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2426 - BLOCK
    )
    :vars
    (
      ?AUTO_2429 - BLOCK
      ?AUTO_2427 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2426 ?AUTO_2429 ) ( ON ?AUTO_2427 ?AUTO_2426 ) ( CLEAR ?AUTO_2427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2427 ?AUTO_2426 )
      ( MAKE-ON-TABLE ?AUTO_2426 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2426 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2432 - BLOCK
    )
    :vars
    (
      ?AUTO_2433 - BLOCK
      ?AUTO_2434 - BLOCK
      ?AUTO_2436 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2432 ?AUTO_2433 ) ( ON ?AUTO_2434 ?AUTO_2432 ) ( CLEAR ?AUTO_2434 ) ( HOLDING ?AUTO_2436 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2436 )
      ( MAKE-ON-TABLE ?AUTO_2432 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2432 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2437 - BLOCK
    )
    :vars
    (
      ?AUTO_2439 - BLOCK
      ?AUTO_2438 - BLOCK
      ?AUTO_2441 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2437 ?AUTO_2439 ) ( ON ?AUTO_2438 ?AUTO_2437 ) ( ON ?AUTO_2441 ?AUTO_2438 ) ( CLEAR ?AUTO_2441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2441 ?AUTO_2438 )
      ( MAKE-ON-TABLE ?AUTO_2437 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2446 - BLOCK
      ?AUTO_2447 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2446 ) ( CLEAR ?AUTO_2447 ) )
    :subtasks
    ( ( !STACK ?AUTO_2446 ?AUTO_2447 )
      ( MAKE-ON-VERIFY ?AUTO_2446 ?AUTO_2447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2450 - BLOCK
      ?AUTO_2451 - BLOCK
    )
    :vars
    (
      ?AUTO_2455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2451 ) ( ON ?AUTO_2450 ?AUTO_2455 ) ( CLEAR ?AUTO_2450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2450 ?AUTO_2455 )
      ( MAKE-ON ?AUTO_2450 ?AUTO_2451 )
      ( MAKE-ON-VERIFY ?AUTO_2450 ?AUTO_2451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2456 - BLOCK
      ?AUTO_2457 - BLOCK
    )
    :vars
    (
      ?AUTO_2460 - BLOCK
      ?AUTO_2461 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2457 ) ( ON ?AUTO_2456 ?AUTO_2460 ) ( CLEAR ?AUTO_2456 ) ( HOLDING ?AUTO_2461 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2461 )
      ( MAKE-ON ?AUTO_2456 ?AUTO_2457 )
      ( MAKE-ON-VERIFY ?AUTO_2456 ?AUTO_2457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2462 - BLOCK
      ?AUTO_2463 - BLOCK
    )
    :vars
    (
      ?AUTO_2466 - BLOCK
      ?AUTO_2467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2463 ) ( ON ?AUTO_2462 ?AUTO_2466 ) ( ON ?AUTO_2467 ?AUTO_2462 ) ( CLEAR ?AUTO_2467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2467 ?AUTO_2462 )
      ( MAKE-ON ?AUTO_2462 ?AUTO_2463 )
      ( MAKE-ON-VERIFY ?AUTO_2462 ?AUTO_2463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2470 - BLOCK
      ?AUTO_2471 - BLOCK
    )
    :vars
    (
      ?AUTO_2475 - BLOCK
      ?AUTO_2472 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2470 ?AUTO_2475 ) ( ON ?AUTO_2472 ?AUTO_2470 ) ( CLEAR ?AUTO_2472 ) ( HOLDING ?AUTO_2471 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2471 )
      ( MAKE-ON ?AUTO_2470 ?AUTO_2471 )
      ( MAKE-ON-VERIFY ?AUTO_2470 ?AUTO_2471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2477 - BLOCK
      ?AUTO_2478 - BLOCK
    )
    :vars
    (
      ?AUTO_2482 - BLOCK
      ?AUTO_2479 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2477 ?AUTO_2482 ) ( ON ?AUTO_2479 ?AUTO_2477 ) ( ON ?AUTO_2478 ?AUTO_2479 ) ( CLEAR ?AUTO_2478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2478 ?AUTO_2479 )
      ( MAKE-ON ?AUTO_2477 ?AUTO_2478 )
      ( MAKE-ON-VERIFY ?AUTO_2477 ?AUTO_2478 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2485 - BLOCK
      ?AUTO_2486 - BLOCK
    )
    :vars
    (
      ?AUTO_2489 - BLOCK
      ?AUTO_2488 - BLOCK
      ?AUTO_2491 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2485 ?AUTO_2489 ) ( ON ?AUTO_2488 ?AUTO_2485 ) ( ON ?AUTO_2486 ?AUTO_2488 ) ( CLEAR ?AUTO_2486 ) ( HOLDING ?AUTO_2491 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2491 )
      ( MAKE-ON ?AUTO_2485 ?AUTO_2486 )
      ( MAKE-ON-VERIFY ?AUTO_2485 ?AUTO_2486 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2492 - BLOCK
      ?AUTO_2493 - BLOCK
    )
    :vars
    (
      ?AUTO_2497 - BLOCK
      ?AUTO_2496 - BLOCK
      ?AUTO_2498 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2492 ?AUTO_2497 ) ( ON ?AUTO_2496 ?AUTO_2492 ) ( ON ?AUTO_2493 ?AUTO_2496 ) ( ON ?AUTO_2498 ?AUTO_2493 ) ( CLEAR ?AUTO_2498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2498 ?AUTO_2493 )
      ( MAKE-ON ?AUTO_2492 ?AUTO_2493 )
      ( MAKE-ON-VERIFY ?AUTO_2492 ?AUTO_2493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2503 - BLOCK
      ?AUTO_2504 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2503 ) ( CLEAR ?AUTO_2504 ) )
    :subtasks
    ( ( !STACK ?AUTO_2503 ?AUTO_2504 )
      ( MAKE-ON-VERIFY ?AUTO_2503 ?AUTO_2504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2507 - BLOCK
      ?AUTO_2508 - BLOCK
    )
    :vars
    (
      ?AUTO_2512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2508 ) ( ON ?AUTO_2507 ?AUTO_2512 ) ( CLEAR ?AUTO_2507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2507 ?AUTO_2512 )
      ( MAKE-ON ?AUTO_2507 ?AUTO_2508 )
      ( MAKE-ON-VERIFY ?AUTO_2507 ?AUTO_2508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2513 - BLOCK
      ?AUTO_2514 - BLOCK
    )
    :vars
    (
      ?AUTO_2517 - BLOCK
      ?AUTO_2518 - BLOCK
      ?AUTO_2519 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2514 ) ( ON ?AUTO_2513 ?AUTO_2517 ) ( CLEAR ?AUTO_2513 ) ( HOLDING ?AUTO_2518 ) ( CLEAR ?AUTO_2519 ) )
    :subtasks
    ( ( !STACK ?AUTO_2518 ?AUTO_2519 )
      ( MAKE-ON ?AUTO_2513 ?AUTO_2514 )
      ( MAKE-ON-VERIFY ?AUTO_2513 ?AUTO_2514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2520 - BLOCK
      ?AUTO_2521 - BLOCK
    )
    :vars
    (
      ?AUTO_2524 - BLOCK
      ?AUTO_2526 - BLOCK
      ?AUTO_2525 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2520 ?AUTO_2524 ) ( CLEAR ?AUTO_2520 ) ( CLEAR ?AUTO_2526 ) ( ON ?AUTO_2525 ?AUTO_2521 ) ( CLEAR ?AUTO_2525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2525 ?AUTO_2521 )
      ( MAKE-ON ?AUTO_2520 ?AUTO_2521 )
      ( MAKE-ON-VERIFY ?AUTO_2520 ?AUTO_2521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2529 - BLOCK
      ?AUTO_2530 - BLOCK
    )
    :vars
    (
      ?AUTO_2535 - BLOCK
      ?AUTO_2532 - BLOCK
      ?AUTO_2531 - BLOCK
      ?AUTO_2536 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2529 ?AUTO_2535 ) ( CLEAR ?AUTO_2529 ) ( CLEAR ?AUTO_2532 ) ( ON ?AUTO_2531 ?AUTO_2530 ) ( CLEAR ?AUTO_2531 ) ( HOLDING ?AUTO_2536 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2536 )
      ( MAKE-ON ?AUTO_2529 ?AUTO_2530 )
      ( MAKE-ON-VERIFY ?AUTO_2529 ?AUTO_2530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2537 - BLOCK
      ?AUTO_2538 - BLOCK
    )
    :vars
    (
      ?AUTO_2544 - BLOCK
      ?AUTO_2541 - BLOCK
      ?AUTO_2539 - BLOCK
      ?AUTO_2543 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2537 ?AUTO_2544 ) ( CLEAR ?AUTO_2537 ) ( CLEAR ?AUTO_2541 ) ( ON ?AUTO_2539 ?AUTO_2538 ) ( ON ?AUTO_2543 ?AUTO_2539 ) ( CLEAR ?AUTO_2543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2543 ?AUTO_2539 )
      ( MAKE-ON ?AUTO_2537 ?AUTO_2538 )
      ( MAKE-ON-VERIFY ?AUTO_2537 ?AUTO_2538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2547 - BLOCK
      ?AUTO_2548 - BLOCK
    )
    :vars
    (
      ?AUTO_2550 - BLOCK
      ?AUTO_2552 - BLOCK
      ?AUTO_2553 - BLOCK
      ?AUTO_2554 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2547 ?AUTO_2550 ) ( CLEAR ?AUTO_2547 ) ( ON ?AUTO_2552 ?AUTO_2548 ) ( ON ?AUTO_2553 ?AUTO_2552 ) ( CLEAR ?AUTO_2553 ) ( HOLDING ?AUTO_2554 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2554 )
      ( MAKE-ON ?AUTO_2547 ?AUTO_2548 )
      ( MAKE-ON-VERIFY ?AUTO_2547 ?AUTO_2548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2556 - BLOCK
      ?AUTO_2557 - BLOCK
    )
    :vars
    (
      ?AUTO_2562 - BLOCK
      ?AUTO_2559 - BLOCK
      ?AUTO_2563 - BLOCK
      ?AUTO_2558 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2556 ?AUTO_2562 ) ( CLEAR ?AUTO_2556 ) ( ON ?AUTO_2559 ?AUTO_2557 ) ( ON ?AUTO_2563 ?AUTO_2559 ) ( ON ?AUTO_2558 ?AUTO_2563 ) ( CLEAR ?AUTO_2558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2558 ?AUTO_2563 )
      ( MAKE-ON ?AUTO_2556 ?AUTO_2557 )
      ( MAKE-ON-VERIFY ?AUTO_2556 ?AUTO_2557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2566 - BLOCK
      ?AUTO_2567 - BLOCK
    )
    :vars
    (
      ?AUTO_2569 - BLOCK
      ?AUTO_2572 - BLOCK
      ?AUTO_2573 - BLOCK
      ?AUTO_2571 - BLOCK
      ?AUTO_2574 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2566 ?AUTO_2569 ) ( CLEAR ?AUTO_2566 ) ( ON ?AUTO_2572 ?AUTO_2567 ) ( ON ?AUTO_2573 ?AUTO_2572 ) ( ON ?AUTO_2571 ?AUTO_2573 ) ( CLEAR ?AUTO_2571 ) ( HOLDING ?AUTO_2574 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2574 )
      ( MAKE-ON ?AUTO_2566 ?AUTO_2567 )
      ( MAKE-ON-VERIFY ?AUTO_2566 ?AUTO_2567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2575 - BLOCK
      ?AUTO_2576 - BLOCK
    )
    :vars
    (
      ?AUTO_2579 - BLOCK
      ?AUTO_2583 - BLOCK
      ?AUTO_2581 - BLOCK
      ?AUTO_2582 - BLOCK
      ?AUTO_2580 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2575 ?AUTO_2579 ) ( CLEAR ?AUTO_2575 ) ( ON ?AUTO_2583 ?AUTO_2576 ) ( ON ?AUTO_2581 ?AUTO_2583 ) ( ON ?AUTO_2582 ?AUTO_2581 ) ( ON ?AUTO_2580 ?AUTO_2582 ) ( CLEAR ?AUTO_2580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2580 ?AUTO_2582 )
      ( MAKE-ON ?AUTO_2575 ?AUTO_2576 )
      ( MAKE-ON-VERIFY ?AUTO_2575 ?AUTO_2576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2588 - BLOCK
      ?AUTO_2589 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2588 ) ( CLEAR ?AUTO_2589 ) )
    :subtasks
    ( ( !STACK ?AUTO_2588 ?AUTO_2589 )
      ( MAKE-ON-VERIFY ?AUTO_2588 ?AUTO_2589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2592 - BLOCK
      ?AUTO_2593 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2593 ) ( ON-TABLE ?AUTO_2592 ) ( CLEAR ?AUTO_2592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2592 )
      ( MAKE-ON ?AUTO_2592 ?AUTO_2593 )
      ( MAKE-ON-VERIFY ?AUTO_2592 ?AUTO_2593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2597 - BLOCK
      ?AUTO_2598 - BLOCK
    )
    :vars
    (
      ?AUTO_2601 - BLOCK
      ?AUTO_2602 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2598 ) ( ON-TABLE ?AUTO_2597 ) ( CLEAR ?AUTO_2597 ) ( HOLDING ?AUTO_2601 ) ( CLEAR ?AUTO_2602 ) )
    :subtasks
    ( ( !STACK ?AUTO_2601 ?AUTO_2602 )
      ( MAKE-ON ?AUTO_2597 ?AUTO_2598 )
      ( MAKE-ON-VERIFY ?AUTO_2597 ?AUTO_2598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2609 - BLOCK
      ?AUTO_2610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2609 ) ( CLEAR ?AUTO_2609 ) ( HOLDING ?AUTO_2610 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2610 )
      ( MAKE-ON ?AUTO_2609 ?AUTO_2610 )
      ( MAKE-ON-VERIFY ?AUTO_2609 ?AUTO_2610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2618 - BLOCK
      ?AUTO_2619 - BLOCK
    )
    :vars
    (
      ?AUTO_2621 - BLOCK
      ?AUTO_2623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2618 ) ( CLEAR ?AUTO_2618 ) ( CLEAR ?AUTO_2621 ) ( ON ?AUTO_2623 ?AUTO_2619 ) ( CLEAR ?AUTO_2623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2623 ?AUTO_2619 )
      ( MAKE-ON ?AUTO_2618 ?AUTO_2619 )
      ( MAKE-ON-VERIFY ?AUTO_2618 ?AUTO_2619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2626 - BLOCK
      ?AUTO_2627 - BLOCK
    )
    :vars
    (
      ?AUTO_2630 - BLOCK
      ?AUTO_2631 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2630 ) ( ON ?AUTO_2631 ?AUTO_2627 ) ( CLEAR ?AUTO_2631 ) ( HOLDING ?AUTO_2626 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2626 )
      ( MAKE-ON ?AUTO_2626 ?AUTO_2627 )
      ( MAKE-ON-VERIFY ?AUTO_2626 ?AUTO_2627 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2633 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2633 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2633 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2633 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2635 - BLOCK
    )
    :vars
    (
      ?AUTO_2638 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2635 ?AUTO_2638 ) ( CLEAR ?AUTO_2635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2635 ?AUTO_2638 )
      ( MAKE-ON-TABLE ?AUTO_2635 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2635 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2640 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2640 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2640 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2640 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2642 - BLOCK
    )
    :vars
    (
      ?AUTO_2645 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2642 ?AUTO_2645 ) ( CLEAR ?AUTO_2642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2642 ?AUTO_2645 )
      ( MAKE-ON-TABLE ?AUTO_2642 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2642 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2646 - BLOCK
    )
    :vars
    (
      ?AUTO_2648 - BLOCK
      ?AUTO_2649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2646 ?AUTO_2648 ) ( CLEAR ?AUTO_2646 ) ( HOLDING ?AUTO_2649 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2649 )
      ( MAKE-ON-TABLE ?AUTO_2646 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2646 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2650 - BLOCK
    )
    :vars
    (
      ?AUTO_2652 - BLOCK
      ?AUTO_2653 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2650 ?AUTO_2652 ) ( ON ?AUTO_2653 ?AUTO_2650 ) ( CLEAR ?AUTO_2653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2653 ?AUTO_2650 )
      ( MAKE-ON-TABLE ?AUTO_2650 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2658 - BLOCK
      ?AUTO_2659 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2658 ) ( CLEAR ?AUTO_2659 ) )
    :subtasks
    ( ( !STACK ?AUTO_2658 ?AUTO_2659 )
      ( MAKE-ON-VERIFY ?AUTO_2658 ?AUTO_2659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2662 - BLOCK
      ?AUTO_2663 - BLOCK
    )
    :vars
    (
      ?AUTO_2667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2663 ) ( ON ?AUTO_2662 ?AUTO_2667 ) ( CLEAR ?AUTO_2662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2662 ?AUTO_2667 )
      ( MAKE-ON ?AUTO_2662 ?AUTO_2663 )
      ( MAKE-ON-VERIFY ?AUTO_2662 ?AUTO_2663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2668 - BLOCK
      ?AUTO_2669 - BLOCK
    )
    :vars
    (
      ?AUTO_2672 - BLOCK
      ?AUTO_2673 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2669 ) ( ON ?AUTO_2668 ?AUTO_2672 ) ( CLEAR ?AUTO_2668 ) ( HOLDING ?AUTO_2673 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2673 )
      ( MAKE-ON ?AUTO_2668 ?AUTO_2669 )
      ( MAKE-ON-VERIFY ?AUTO_2668 ?AUTO_2669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2674 - BLOCK
      ?AUTO_2675 - BLOCK
    )
    :vars
    (
      ?AUTO_2678 - BLOCK
      ?AUTO_2679 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2675 ) ( ON ?AUTO_2674 ?AUTO_2678 ) ( ON ?AUTO_2679 ?AUTO_2674 ) ( CLEAR ?AUTO_2679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2679 ?AUTO_2674 )
      ( MAKE-ON ?AUTO_2674 ?AUTO_2675 )
      ( MAKE-ON-VERIFY ?AUTO_2674 ?AUTO_2675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2682 - BLOCK
      ?AUTO_2683 - BLOCK
    )
    :vars
    (
      ?AUTO_2687 - BLOCK
      ?AUTO_2684 - BLOCK
      ?AUTO_2688 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2683 ) ( ON ?AUTO_2682 ?AUTO_2687 ) ( ON ?AUTO_2684 ?AUTO_2682 ) ( CLEAR ?AUTO_2684 ) ( HOLDING ?AUTO_2688 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2688 )
      ( MAKE-ON ?AUTO_2682 ?AUTO_2683 )
      ( MAKE-ON-VERIFY ?AUTO_2682 ?AUTO_2683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2689 - BLOCK
      ?AUTO_2690 - BLOCK
    )
    :vars
    (
      ?AUTO_2692 - BLOCK
      ?AUTO_2691 - BLOCK
      ?AUTO_2695 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2690 ) ( ON ?AUTO_2689 ?AUTO_2692 ) ( ON ?AUTO_2691 ?AUTO_2689 ) ( ON ?AUTO_2695 ?AUTO_2691 ) ( CLEAR ?AUTO_2695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2695 ?AUTO_2691 )
      ( MAKE-ON ?AUTO_2689 ?AUTO_2690 )
      ( MAKE-ON-VERIFY ?AUTO_2689 ?AUTO_2690 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2699 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2699 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2699 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2699 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2701 - BLOCK
    )
    :vars
    (
      ?AUTO_2704 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2701 ?AUTO_2704 ) ( CLEAR ?AUTO_2701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2701 ?AUTO_2704 )
      ( MAKE-ON-TABLE ?AUTO_2701 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2701 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2705 - BLOCK
    )
    :vars
    (
      ?AUTO_2707 - BLOCK
      ?AUTO_2708 - BLOCK
      ?AUTO_2709 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2705 ?AUTO_2707 ) ( CLEAR ?AUTO_2705 ) ( HOLDING ?AUTO_2708 ) ( CLEAR ?AUTO_2709 ) )
    :subtasks
    ( ( !STACK ?AUTO_2708 ?AUTO_2709 )
      ( MAKE-ON-TABLE ?AUTO_2705 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2705 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2710 - BLOCK
    )
    :vars
    (
      ?AUTO_2712 - BLOCK
      ?AUTO_2714 - BLOCK
      ?AUTO_2713 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2710 ?AUTO_2712 ) ( CLEAR ?AUTO_2714 ) ( ON ?AUTO_2713 ?AUTO_2710 ) ( CLEAR ?AUTO_2713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2713 ?AUTO_2710 )
      ( MAKE-ON-TABLE ?AUTO_2710 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2710 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2717 - BLOCK
    )
    :vars
    (
      ?AUTO_2720 - BLOCK
      ?AUTO_2718 - BLOCK
      ?AUTO_2721 - BLOCK
      ?AUTO_2722 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2717 ?AUTO_2720 ) ( CLEAR ?AUTO_2718 ) ( ON ?AUTO_2721 ?AUTO_2717 ) ( CLEAR ?AUTO_2721 ) ( HOLDING ?AUTO_2722 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2722 )
      ( MAKE-ON-TABLE ?AUTO_2717 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2717 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2723 - BLOCK
    )
    :vars
    (
      ?AUTO_2725 - BLOCK
      ?AUTO_2726 - BLOCK
      ?AUTO_2724 - BLOCK
      ?AUTO_2728 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2723 ?AUTO_2725 ) ( CLEAR ?AUTO_2726 ) ( ON ?AUTO_2724 ?AUTO_2723 ) ( ON ?AUTO_2728 ?AUTO_2724 ) ( CLEAR ?AUTO_2728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2728 ?AUTO_2724 )
      ( MAKE-ON-TABLE ?AUTO_2723 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2723 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2731 - BLOCK
    )
    :vars
    (
      ?AUTO_2732 - BLOCK
      ?AUTO_2736 - BLOCK
      ?AUTO_2733 - BLOCK
      ?AUTO_2735 - BLOCK
      ?AUTO_2737 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2731 ?AUTO_2732 ) ( CLEAR ?AUTO_2736 ) ( ON ?AUTO_2733 ?AUTO_2731 ) ( ON ?AUTO_2735 ?AUTO_2733 ) ( CLEAR ?AUTO_2735 ) ( HOLDING ?AUTO_2737 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2737 )
      ( MAKE-ON-TABLE ?AUTO_2731 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2731 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2738 - BLOCK
    )
    :vars
    (
      ?AUTO_2739 - BLOCK
      ?AUTO_2744 - BLOCK
      ?AUTO_2742 - BLOCK
      ?AUTO_2740 - BLOCK
      ?AUTO_2743 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2738 ?AUTO_2739 ) ( CLEAR ?AUTO_2744 ) ( ON ?AUTO_2742 ?AUTO_2738 ) ( ON ?AUTO_2740 ?AUTO_2742 ) ( ON ?AUTO_2743 ?AUTO_2740 ) ( CLEAR ?AUTO_2743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2743 ?AUTO_2740 )
      ( MAKE-ON-TABLE ?AUTO_2738 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2749 - BLOCK
      ?AUTO_2750 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2749 ) ( CLEAR ?AUTO_2750 ) )
    :subtasks
    ( ( !STACK ?AUTO_2749 ?AUTO_2750 )
      ( MAKE-ON-VERIFY ?AUTO_2749 ?AUTO_2750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2753 - BLOCK
      ?AUTO_2754 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2754 ) ( ON-TABLE ?AUTO_2753 ) ( CLEAR ?AUTO_2753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2753 )
      ( MAKE-ON ?AUTO_2753 ?AUTO_2754 )
      ( MAKE-ON-VERIFY ?AUTO_2753 ?AUTO_2754 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2758 - BLOCK
      ?AUTO_2759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2758 ) ( CLEAR ?AUTO_2758 ) ( HOLDING ?AUTO_2759 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2759 )
      ( MAKE-ON ?AUTO_2758 ?AUTO_2759 )
      ( MAKE-ON-VERIFY ?AUTO_2758 ?AUTO_2759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2765 - BLOCK
      ?AUTO_2766 - BLOCK
    )
    :vars
    (
      ?AUTO_2769 - BLOCK
      ?AUTO_2770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2766 ) ( ON-TABLE ?AUTO_2765 ) ( CLEAR ?AUTO_2765 ) ( HOLDING ?AUTO_2769 ) ( CLEAR ?AUTO_2770 ) )
    :subtasks
    ( ( !STACK ?AUTO_2769 ?AUTO_2770 )
      ( MAKE-ON ?AUTO_2765 ?AUTO_2766 )
      ( MAKE-ON-VERIFY ?AUTO_2765 ?AUTO_2766 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2771 - BLOCK
      ?AUTO_2772 - BLOCK
    )
    :vars
    (
      ?AUTO_2776 - BLOCK
      ?AUTO_2775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2771 ) ( CLEAR ?AUTO_2771 ) ( CLEAR ?AUTO_2776 ) ( ON ?AUTO_2775 ?AUTO_2772 ) ( CLEAR ?AUTO_2775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2775 ?AUTO_2772 )
      ( MAKE-ON ?AUTO_2771 ?AUTO_2772 )
      ( MAKE-ON-VERIFY ?AUTO_2771 ?AUTO_2772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2779 - BLOCK
      ?AUTO_2780 - BLOCK
    )
    :vars
    (
      ?AUTO_2781 - BLOCK
      ?AUTO_2784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2781 ) ( ON ?AUTO_2784 ?AUTO_2780 ) ( CLEAR ?AUTO_2784 ) ( HOLDING ?AUTO_2779 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2779 )
      ( MAKE-ON ?AUTO_2779 ?AUTO_2780 )
      ( MAKE-ON-VERIFY ?AUTO_2779 ?AUTO_2780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2786 - BLOCK
      ?AUTO_2787 - BLOCK
    )
    :vars
    (
      ?AUTO_2788 - BLOCK
      ?AUTO_2789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2788 ) ( ON ?AUTO_2789 ?AUTO_2787 ) ( ON ?AUTO_2786 ?AUTO_2789 ) ( CLEAR ?AUTO_2786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2786 ?AUTO_2789 )
      ( MAKE-ON ?AUTO_2786 ?AUTO_2787 )
      ( MAKE-ON-VERIFY ?AUTO_2786 ?AUTO_2787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2794 - BLOCK
      ?AUTO_2795 - BLOCK
    )
    :vars
    (
      ?AUTO_2797 - BLOCK
      ?AUTO_2796 - BLOCK
      ?AUTO_2800 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2797 ) ( ON ?AUTO_2796 ?AUTO_2795 ) ( ON ?AUTO_2794 ?AUTO_2796 ) ( CLEAR ?AUTO_2794 ) ( HOLDING ?AUTO_2800 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2800 )
      ( MAKE-ON ?AUTO_2794 ?AUTO_2795 )
      ( MAKE-ON-VERIFY ?AUTO_2794 ?AUTO_2795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2801 - BLOCK
      ?AUTO_2802 - BLOCK
    )
    :vars
    (
      ?AUTO_2806 - BLOCK
      ?AUTO_2803 - BLOCK
      ?AUTO_2807 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2806 ) ( ON ?AUTO_2803 ?AUTO_2802 ) ( ON ?AUTO_2801 ?AUTO_2803 ) ( ON ?AUTO_2807 ?AUTO_2801 ) ( CLEAR ?AUTO_2807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2807 ?AUTO_2801 )
      ( MAKE-ON ?AUTO_2801 ?AUTO_2802 )
      ( MAKE-ON-VERIFY ?AUTO_2801 ?AUTO_2802 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2812 - BLOCK
      ?AUTO_2813 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2812 ) ( CLEAR ?AUTO_2813 ) )
    :subtasks
    ( ( !STACK ?AUTO_2812 ?AUTO_2813 )
      ( MAKE-ON-VERIFY ?AUTO_2812 ?AUTO_2813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2816 - BLOCK
      ?AUTO_2817 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2817 ) ( ON-TABLE ?AUTO_2816 ) ( CLEAR ?AUTO_2816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2816 )
      ( MAKE-ON ?AUTO_2816 ?AUTO_2817 )
      ( MAKE-ON-VERIFY ?AUTO_2816 ?AUTO_2817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2821 - BLOCK
      ?AUTO_2822 - BLOCK
    )
    :vars
    (
      ?AUTO_2826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2821 ) ( CLEAR ?AUTO_2821 ) ( HOLDING ?AUTO_2822 ) ( CLEAR ?AUTO_2826 ) )
    :subtasks
    ( ( !STACK ?AUTO_2822 ?AUTO_2826 )
      ( MAKE-ON ?AUTO_2821 ?AUTO_2822 )
      ( MAKE-ON-VERIFY ?AUTO_2821 ?AUTO_2822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2829 - BLOCK
      ?AUTO_2830 - BLOCK
    )
    :vars
    (
      ?AUTO_2833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2830 ) ( ON-TABLE ?AUTO_2829 ) ( CLEAR ?AUTO_2829 ) ( HOLDING ?AUTO_2833 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2833 )
      ( MAKE-ON ?AUTO_2829 ?AUTO_2830 )
      ( MAKE-ON-VERIFY ?AUTO_2829 ?AUTO_2830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2834 - BLOCK
      ?AUTO_2835 - BLOCK
    )
    :vars
    (
      ?AUTO_2838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2835 ) ( ON-TABLE ?AUTO_2834 ) ( ON ?AUTO_2838 ?AUTO_2834 ) ( CLEAR ?AUTO_2838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2838 ?AUTO_2834 )
      ( MAKE-ON ?AUTO_2834 ?AUTO_2835 )
      ( MAKE-ON-VERIFY ?AUTO_2834 ?AUTO_2835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2841 - BLOCK
      ?AUTO_2842 - BLOCK
    )
    :vars
    (
      ?AUTO_2845 - BLOCK
      ?AUTO_2846 - BLOCK
      ?AUTO_2847 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2842 ) ( ON-TABLE ?AUTO_2841 ) ( ON ?AUTO_2845 ?AUTO_2841 ) ( CLEAR ?AUTO_2845 ) ( HOLDING ?AUTO_2846 ) ( CLEAR ?AUTO_2847 ) )
    :subtasks
    ( ( !STACK ?AUTO_2846 ?AUTO_2847 )
      ( MAKE-ON ?AUTO_2841 ?AUTO_2842 )
      ( MAKE-ON-VERIFY ?AUTO_2841 ?AUTO_2842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2848 - BLOCK
      ?AUTO_2849 - BLOCK
    )
    :vars
    (
      ?AUTO_2852 - BLOCK
      ?AUTO_2854 - BLOCK
      ?AUTO_2853 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2849 ) ( ON-TABLE ?AUTO_2848 ) ( ON ?AUTO_2852 ?AUTO_2848 ) ( CLEAR ?AUTO_2854 ) ( ON ?AUTO_2853 ?AUTO_2852 ) ( CLEAR ?AUTO_2853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2853 ?AUTO_2852 )
      ( MAKE-ON ?AUTO_2848 ?AUTO_2849 )
      ( MAKE-ON-VERIFY ?AUTO_2848 ?AUTO_2849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2857 - BLOCK
      ?AUTO_2858 - BLOCK
    )
    :vars
    (
      ?AUTO_2863 - BLOCK
      ?AUTO_2862 - BLOCK
      ?AUTO_2859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2857 ) ( ON ?AUTO_2863 ?AUTO_2857 ) ( CLEAR ?AUTO_2862 ) ( ON ?AUTO_2859 ?AUTO_2863 ) ( CLEAR ?AUTO_2859 ) ( HOLDING ?AUTO_2858 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2858 )
      ( MAKE-ON ?AUTO_2857 ?AUTO_2858 )
      ( MAKE-ON-VERIFY ?AUTO_2857 ?AUTO_2858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2865 - BLOCK
      ?AUTO_2866 - BLOCK
    )
    :vars
    (
      ?AUTO_2868 - BLOCK
      ?AUTO_2871 - BLOCK
      ?AUTO_2867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2865 ) ( ON ?AUTO_2868 ?AUTO_2865 ) ( CLEAR ?AUTO_2871 ) ( ON ?AUTO_2867 ?AUTO_2868 ) ( ON ?AUTO_2866 ?AUTO_2867 ) ( CLEAR ?AUTO_2866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2866 ?AUTO_2867 )
      ( MAKE-ON ?AUTO_2865 ?AUTO_2866 )
      ( MAKE-ON-VERIFY ?AUTO_2865 ?AUTO_2866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2874 - BLOCK
      ?AUTO_2875 - BLOCK
    )
    :vars
    (
      ?AUTO_2878 - BLOCK
      ?AUTO_2879 - BLOCK
      ?AUTO_2880 - BLOCK
      ?AUTO_2881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2874 ) ( ON ?AUTO_2878 ?AUTO_2874 ) ( CLEAR ?AUTO_2879 ) ( ON ?AUTO_2880 ?AUTO_2878 ) ( ON ?AUTO_2875 ?AUTO_2880 ) ( CLEAR ?AUTO_2875 ) ( HOLDING ?AUTO_2881 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2881 )
      ( MAKE-ON ?AUTO_2874 ?AUTO_2875 )
      ( MAKE-ON-VERIFY ?AUTO_2874 ?AUTO_2875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2882 - BLOCK
      ?AUTO_2883 - BLOCK
    )
    :vars
    (
      ?AUTO_2889 - BLOCK
      ?AUTO_2888 - BLOCK
      ?AUTO_2884 - BLOCK
      ?AUTO_2887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2882 ) ( ON ?AUTO_2889 ?AUTO_2882 ) ( CLEAR ?AUTO_2888 ) ( ON ?AUTO_2884 ?AUTO_2889 ) ( ON ?AUTO_2883 ?AUTO_2884 ) ( ON ?AUTO_2887 ?AUTO_2883 ) ( CLEAR ?AUTO_2887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2887 ?AUTO_2883 )
      ( MAKE-ON ?AUTO_2882 ?AUTO_2883 )
      ( MAKE-ON-VERIFY ?AUTO_2882 ?AUTO_2883 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2891 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2891 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2891 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2891 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2893 - BLOCK
    )
    :vars
    (
      ?AUTO_2896 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2893 ?AUTO_2896 ) ( CLEAR ?AUTO_2893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2893 ?AUTO_2896 )
      ( MAKE-ON-TABLE ?AUTO_2893 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2893 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2898 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2898 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2898 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2898 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2900 - BLOCK
    )
    :vars
    (
      ?AUTO_2903 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2900 ?AUTO_2903 ) ( CLEAR ?AUTO_2900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2900 ?AUTO_2903 )
      ( MAKE-ON-TABLE ?AUTO_2900 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2900 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2904 - BLOCK
    )
    :vars
    (
      ?AUTO_2906 - BLOCK
      ?AUTO_2907 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2904 ?AUTO_2906 ) ( CLEAR ?AUTO_2904 ) ( HOLDING ?AUTO_2907 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2907 )
      ( MAKE-ON-TABLE ?AUTO_2904 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2904 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2911 - BLOCK
      ?AUTO_2912 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2911 ) ( CLEAR ?AUTO_2912 ) )
    :subtasks
    ( ( !STACK ?AUTO_2911 ?AUTO_2912 )
      ( MAKE-ON-VERIFY ?AUTO_2911 ?AUTO_2912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2915 - BLOCK
      ?AUTO_2916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2916 ) ( ON-TABLE ?AUTO_2915 ) ( CLEAR ?AUTO_2915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2915 )
      ( MAKE-ON ?AUTO_2915 ?AUTO_2916 )
      ( MAKE-ON-VERIFY ?AUTO_2915 ?AUTO_2916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2920 - BLOCK
      ?AUTO_2921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2920 ) ( CLEAR ?AUTO_2920 ) ( HOLDING ?AUTO_2921 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2921 )
      ( MAKE-ON ?AUTO_2920 ?AUTO_2921 )
      ( MAKE-ON-VERIFY ?AUTO_2920 ?AUTO_2921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2925 - BLOCK
      ?AUTO_2926 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2925 ) ( ON ?AUTO_2926 ?AUTO_2925 ) ( CLEAR ?AUTO_2926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2926 ?AUTO_2925 )
      ( MAKE-ON ?AUTO_2925 ?AUTO_2926 )
      ( MAKE-ON-VERIFY ?AUTO_2925 ?AUTO_2926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2931 - BLOCK
      ?AUTO_2932 - BLOCK
    )
    :vars
    (
      ?AUTO_2935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2931 ) ( ON ?AUTO_2932 ?AUTO_2931 ) ( CLEAR ?AUTO_2932 ) ( HOLDING ?AUTO_2935 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2935 )
      ( MAKE-ON ?AUTO_2931 ?AUTO_2932 )
      ( MAKE-ON-VERIFY ?AUTO_2931 ?AUTO_2932 ) )
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
      ?AUTO_2979 - BLOCK
      ?AUTO_2980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2975 ) ( ON ?AUTO_2979 ?AUTO_2976 ) ( CLEAR ?AUTO_2979 ) ( ON ?AUTO_2980 ?AUTO_2975 ) ( CLEAR ?AUTO_2980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2980 ?AUTO_2975 )
      ( MAKE-ON ?AUTO_2975 ?AUTO_2976 )
      ( MAKE-ON-VERIFY ?AUTO_2975 ?AUTO_2976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2985 - BLOCK
      ?AUTO_2986 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2985 ) ( CLEAR ?AUTO_2986 ) )
    :subtasks
    ( ( !STACK ?AUTO_2985 ?AUTO_2986 )
      ( MAKE-ON-VERIFY ?AUTO_2985 ?AUTO_2986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2989 - BLOCK
      ?AUTO_2990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2990 ) ( ON-TABLE ?AUTO_2989 ) ( CLEAR ?AUTO_2989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2989 )
      ( MAKE-ON ?AUTO_2989 ?AUTO_2990 )
      ( MAKE-ON-VERIFY ?AUTO_2989 ?AUTO_2990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2994 - BLOCK
      ?AUTO_2995 - BLOCK
    )
    :vars
    (
      ?AUTO_2999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2994 ) ( CLEAR ?AUTO_2994 ) ( HOLDING ?AUTO_2995 ) ( CLEAR ?AUTO_2999 ) )
    :subtasks
    ( ( !STACK ?AUTO_2995 ?AUTO_2999 )
      ( MAKE-ON ?AUTO_2994 ?AUTO_2995 )
      ( MAKE-ON-VERIFY ?AUTO_2994 ?AUTO_2995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3002 - BLOCK
      ?AUTO_3003 - BLOCK
    )
    :vars
    (
      ?AUTO_3006 - BLOCK
      ?AUTO_3007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3003 ) ( ON-TABLE ?AUTO_3002 ) ( CLEAR ?AUTO_3002 ) ( HOLDING ?AUTO_3006 ) ( CLEAR ?AUTO_3007 ) )
    :subtasks
    ( ( !STACK ?AUTO_3006 ?AUTO_3007 )
      ( MAKE-ON ?AUTO_3002 ?AUTO_3003 )
      ( MAKE-ON-VERIFY ?AUTO_3002 ?AUTO_3003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3020 - BLOCK
      ?AUTO_3021 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3020 ) ( CLEAR ?AUTO_3021 ) )
    :subtasks
    ( ( !STACK ?AUTO_3020 ?AUTO_3021 )
      ( MAKE-ON-VERIFY ?AUTO_3020 ?AUTO_3021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3024 - BLOCK
      ?AUTO_3025 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3025 ) ( ON-TABLE ?AUTO_3024 ) ( CLEAR ?AUTO_3024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3024 )
      ( MAKE-ON ?AUTO_3024 ?AUTO_3025 )
      ( MAKE-ON-VERIFY ?AUTO_3024 ?AUTO_3025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3029 - BLOCK
      ?AUTO_3030 - BLOCK
    )
    :vars
    (
      ?AUTO_3034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3029 ) ( CLEAR ?AUTO_3029 ) ( HOLDING ?AUTO_3030 ) ( CLEAR ?AUTO_3034 ) )
    :subtasks
    ( ( !STACK ?AUTO_3030 ?AUTO_3034 )
      ( MAKE-ON ?AUTO_3029 ?AUTO_3030 )
      ( MAKE-ON-VERIFY ?AUTO_3029 ?AUTO_3030 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3037 - BLOCK
      ?AUTO_3038 - BLOCK
    )
    :vars
    (
      ?AUTO_3041 - BLOCK
      ?AUTO_3042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3038 ) ( ON-TABLE ?AUTO_3037 ) ( CLEAR ?AUTO_3037 ) ( HOLDING ?AUTO_3041 ) ( CLEAR ?AUTO_3042 ) )
    :subtasks
    ( ( !STACK ?AUTO_3041 ?AUTO_3042 )
      ( MAKE-ON ?AUTO_3037 ?AUTO_3038 )
      ( MAKE-ON-VERIFY ?AUTO_3037 ?AUTO_3038 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3044 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3044 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3044 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3044 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3046 - BLOCK
    )
    :vars
    (
      ?AUTO_3049 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3046 ?AUTO_3049 ) ( CLEAR ?AUTO_3046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3046 ?AUTO_3049 )
      ( MAKE-ON-TABLE ?AUTO_3046 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3046 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3051 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3051 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3051 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3051 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3053 - BLOCK
    )
    :vars
    (
      ?AUTO_3056 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3053 ?AUTO_3056 ) ( CLEAR ?AUTO_3053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3053 ?AUTO_3056 )
      ( MAKE-ON-TABLE ?AUTO_3053 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3053 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3057 - BLOCK
    )
    :vars
    (
      ?AUTO_3059 - BLOCK
      ?AUTO_3060 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3057 ?AUTO_3059 ) ( CLEAR ?AUTO_3057 ) ( HOLDING ?AUTO_3060 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3060 )
      ( MAKE-ON-TABLE ?AUTO_3057 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3057 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3063 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3063 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3063 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3063 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3065 - BLOCK
    )
    :vars
    (
      ?AUTO_3068 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3065 ?AUTO_3068 ) ( CLEAR ?AUTO_3065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3065 ?AUTO_3068 )
      ( MAKE-ON-TABLE ?AUTO_3065 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3065 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3069 - BLOCK
    )
    :vars
    (
      ?AUTO_3071 - BLOCK
      ?AUTO_3072 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3069 ?AUTO_3071 ) ( CLEAR ?AUTO_3069 ) ( HOLDING ?AUTO_3072 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3072 )
      ( MAKE-ON-TABLE ?AUTO_3069 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3069 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3073 - BLOCK
    )
    :vars
    (
      ?AUTO_3075 - BLOCK
      ?AUTO_3076 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3073 ?AUTO_3075 ) ( ON ?AUTO_3076 ?AUTO_3073 ) ( CLEAR ?AUTO_3076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3076 ?AUTO_3073 )
      ( MAKE-ON-TABLE ?AUTO_3073 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3073 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3079 - BLOCK
    )
    :vars
    (
      ?AUTO_3080 - BLOCK
      ?AUTO_3081 - BLOCK
      ?AUTO_3083 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3079 ?AUTO_3080 ) ( ON ?AUTO_3081 ?AUTO_3079 ) ( CLEAR ?AUTO_3081 ) ( HOLDING ?AUTO_3083 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3083 )
      ( MAKE-ON-TABLE ?AUTO_3079 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3079 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3086 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3086 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3086 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3086 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3088 - BLOCK
    )
    :vars
    (
      ?AUTO_3091 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3088 ?AUTO_3091 ) ( CLEAR ?AUTO_3088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3088 ?AUTO_3091 )
      ( MAKE-ON-TABLE ?AUTO_3088 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3088 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3092 - BLOCK
    )
    :vars
    (
      ?AUTO_3094 - BLOCK
      ?AUTO_3095 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3092 ?AUTO_3094 ) ( CLEAR ?AUTO_3092 ) ( HOLDING ?AUTO_3095 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3095 )
      ( MAKE-ON-TABLE ?AUTO_3092 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3092 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3103 - BLOCK
      ?AUTO_3104 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3103 ) ( CLEAR ?AUTO_3104 ) )
    :subtasks
    ( ( !STACK ?AUTO_3103 ?AUTO_3104 )
      ( MAKE-ON-VERIFY ?AUTO_3103 ?AUTO_3104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3107 - BLOCK
      ?AUTO_3108 - BLOCK
    )
    :vars
    (
      ?AUTO_3112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3108 ) ( ON ?AUTO_3107 ?AUTO_3112 ) ( CLEAR ?AUTO_3107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3107 ?AUTO_3112 )
      ( MAKE-ON ?AUTO_3107 ?AUTO_3108 )
      ( MAKE-ON-VERIFY ?AUTO_3107 ?AUTO_3108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3113 - BLOCK
      ?AUTO_3114 - BLOCK
    )
    :vars
    (
      ?AUTO_3117 - BLOCK
      ?AUTO_3118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3114 ) ( ON ?AUTO_3113 ?AUTO_3117 ) ( CLEAR ?AUTO_3113 ) ( HOLDING ?AUTO_3118 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3118 )
      ( MAKE-ON ?AUTO_3113 ?AUTO_3114 )
      ( MAKE-ON-VERIFY ?AUTO_3113 ?AUTO_3114 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3119 - BLOCK
      ?AUTO_3120 - BLOCK
    )
    :vars
    (
      ?AUTO_3123 - BLOCK
      ?AUTO_3124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3120 ) ( ON ?AUTO_3119 ?AUTO_3123 ) ( ON ?AUTO_3124 ?AUTO_3119 ) ( CLEAR ?AUTO_3124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3124 ?AUTO_3119 )
      ( MAKE-ON ?AUTO_3119 ?AUTO_3120 )
      ( MAKE-ON-VERIFY ?AUTO_3119 ?AUTO_3120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3127 - BLOCK
      ?AUTO_3128 - BLOCK
    )
    :vars
    (
      ?AUTO_3132 - BLOCK
      ?AUTO_3129 - BLOCK
      ?AUTO_3133 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3128 ) ( ON ?AUTO_3127 ?AUTO_3132 ) ( ON ?AUTO_3129 ?AUTO_3127 ) ( CLEAR ?AUTO_3129 ) ( HOLDING ?AUTO_3133 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3133 )
      ( MAKE-ON ?AUTO_3127 ?AUTO_3128 )
      ( MAKE-ON-VERIFY ?AUTO_3127 ?AUTO_3128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3136 - BLOCK
      ?AUTO_3137 - BLOCK
    )
    :vars
    (
      ?AUTO_3141 - BLOCK
      ?AUTO_3138 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3136 ?AUTO_3141 ) ( ON ?AUTO_3138 ?AUTO_3136 ) ( CLEAR ?AUTO_3138 ) ( HOLDING ?AUTO_3137 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3137 )
      ( MAKE-ON ?AUTO_3136 ?AUTO_3137 )
      ( MAKE-ON-VERIFY ?AUTO_3136 ?AUTO_3137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3147 - BLOCK
      ?AUTO_3148 - BLOCK
    )
    :vars
    (
      ?AUTO_3151 - BLOCK
      ?AUTO_3152 - BLOCK
      ?AUTO_3153 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3148 ) ( ON ?AUTO_3147 ?AUTO_3151 ) ( ON ?AUTO_3152 ?AUTO_3147 ) ( ON ?AUTO_3153 ?AUTO_3152 ) ( CLEAR ?AUTO_3153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3153 ?AUTO_3152 )
      ( MAKE-ON ?AUTO_3147 ?AUTO_3148 )
      ( MAKE-ON-VERIFY ?AUTO_3147 ?AUTO_3148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3158 - BLOCK
      ?AUTO_3159 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3158 ) ( CLEAR ?AUTO_3159 ) )
    :subtasks
    ( ( !STACK ?AUTO_3158 ?AUTO_3159 )
      ( MAKE-ON-VERIFY ?AUTO_3158 ?AUTO_3159 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3162 - BLOCK
      ?AUTO_3163 - BLOCK
    )
    :vars
    (
      ?AUTO_3167 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3163 ) ( ON ?AUTO_3162 ?AUTO_3167 ) ( CLEAR ?AUTO_3162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3162 ?AUTO_3167 )
      ( MAKE-ON ?AUTO_3162 ?AUTO_3163 )
      ( MAKE-ON-VERIFY ?AUTO_3162 ?AUTO_3163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3168 - BLOCK
      ?AUTO_3169 - BLOCK
    )
    :vars
    (
      ?AUTO_3172 - BLOCK
      ?AUTO_3173 - BLOCK
      ?AUTO_3174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3169 ) ( ON ?AUTO_3168 ?AUTO_3172 ) ( CLEAR ?AUTO_3168 ) ( HOLDING ?AUTO_3173 ) ( CLEAR ?AUTO_3174 ) )
    :subtasks
    ( ( !STACK ?AUTO_3173 ?AUTO_3174 )
      ( MAKE-ON ?AUTO_3168 ?AUTO_3169 )
      ( MAKE-ON-VERIFY ?AUTO_3168 ?AUTO_3169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3175 - BLOCK
      ?AUTO_3176 - BLOCK
    )
    :vars
    (
      ?AUTO_3179 - BLOCK
      ?AUTO_3181 - BLOCK
      ?AUTO_3180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3176 ) ( ON ?AUTO_3175 ?AUTO_3179 ) ( CLEAR ?AUTO_3181 ) ( ON ?AUTO_3180 ?AUTO_3175 ) ( CLEAR ?AUTO_3180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3180 ?AUTO_3175 )
      ( MAKE-ON ?AUTO_3175 ?AUTO_3176 )
      ( MAKE-ON-VERIFY ?AUTO_3175 ?AUTO_3176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3184 - BLOCK
      ?AUTO_3185 - BLOCK
    )
    :vars
    (
      ?AUTO_3186 - BLOCK
      ?AUTO_3190 - BLOCK
      ?AUTO_3189 - BLOCK
      ?AUTO_3191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3185 ) ( ON ?AUTO_3184 ?AUTO_3186 ) ( CLEAR ?AUTO_3190 ) ( ON ?AUTO_3189 ?AUTO_3184 ) ( CLEAR ?AUTO_3189 ) ( HOLDING ?AUTO_3191 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3191 )
      ( MAKE-ON ?AUTO_3184 ?AUTO_3185 )
      ( MAKE-ON-VERIFY ?AUTO_3184 ?AUTO_3185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3192 - BLOCK
      ?AUTO_3193 - BLOCK
    )
    :vars
    (
      ?AUTO_3198 - BLOCK
      ?AUTO_3199 - BLOCK
      ?AUTO_3197 - BLOCK
      ?AUTO_3196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3193 ) ( ON ?AUTO_3192 ?AUTO_3198 ) ( CLEAR ?AUTO_3199 ) ( ON ?AUTO_3197 ?AUTO_3192 ) ( ON ?AUTO_3196 ?AUTO_3197 ) ( CLEAR ?AUTO_3196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3196 ?AUTO_3197 )
      ( MAKE-ON ?AUTO_3192 ?AUTO_3193 )
      ( MAKE-ON-VERIFY ?AUTO_3192 ?AUTO_3193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3202 - BLOCK
      ?AUTO_3203 - BLOCK
    )
    :vars
    (
      ?AUTO_3208 - BLOCK
      ?AUTO_3205 - BLOCK
      ?AUTO_3207 - BLOCK
      ?AUTO_3209 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3202 ?AUTO_3208 ) ( CLEAR ?AUTO_3205 ) ( ON ?AUTO_3207 ?AUTO_3202 ) ( ON ?AUTO_3209 ?AUTO_3207 ) ( CLEAR ?AUTO_3209 ) ( HOLDING ?AUTO_3203 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3203 )
      ( MAKE-ON ?AUTO_3202 ?AUTO_3203 )
      ( MAKE-ON-VERIFY ?AUTO_3202 ?AUTO_3203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3213 - BLOCK
      ?AUTO_3214 - BLOCK
    )
    :vars
    (
      ?AUTO_3219 - BLOCK
      ?AUTO_3215 - BLOCK
      ?AUTO_3218 - BLOCK
      ?AUTO_3220 - BLOCK
      ?AUTO_3221 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3214 ) ( ON ?AUTO_3213 ?AUTO_3219 ) ( CLEAR ?AUTO_3215 ) ( ON ?AUTO_3218 ?AUTO_3213 ) ( ON ?AUTO_3220 ?AUTO_3218 ) ( CLEAR ?AUTO_3220 ) ( HOLDING ?AUTO_3221 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3221 )
      ( MAKE-ON ?AUTO_3213 ?AUTO_3214 )
      ( MAKE-ON-VERIFY ?AUTO_3213 ?AUTO_3214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3222 - BLOCK
      ?AUTO_3223 - BLOCK
    )
    :vars
    (
      ?AUTO_3228 - BLOCK
      ?AUTO_3226 - BLOCK
      ?AUTO_3229 - BLOCK
      ?AUTO_3227 - BLOCK
      ?AUTO_3230 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3222 ?AUTO_3228 ) ( CLEAR ?AUTO_3226 ) ( ON ?AUTO_3229 ?AUTO_3222 ) ( ON ?AUTO_3227 ?AUTO_3229 ) ( CLEAR ?AUTO_3227 ) ( ON ?AUTO_3230 ?AUTO_3223 ) ( CLEAR ?AUTO_3230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3230 ?AUTO_3223 )
      ( MAKE-ON ?AUTO_3222 ?AUTO_3223 )
      ( MAKE-ON-VERIFY ?AUTO_3222 ?AUTO_3223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3233 - BLOCK
      ?AUTO_3234 - BLOCK
    )
    :vars
    (
      ?AUTO_3236 - BLOCK
      ?AUTO_3239 - BLOCK
      ?AUTO_3241 - BLOCK
      ?AUTO_3238 - BLOCK
      ?AUTO_3235 - BLOCK
      ?AUTO_3242 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3233 ?AUTO_3236 ) ( CLEAR ?AUTO_3239 ) ( ON ?AUTO_3241 ?AUTO_3233 ) ( ON ?AUTO_3238 ?AUTO_3241 ) ( CLEAR ?AUTO_3238 ) ( ON ?AUTO_3235 ?AUTO_3234 ) ( CLEAR ?AUTO_3235 ) ( HOLDING ?AUTO_3242 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3242 )
      ( MAKE-ON ?AUTO_3233 ?AUTO_3234 )
      ( MAKE-ON-VERIFY ?AUTO_3233 ?AUTO_3234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3243 - BLOCK
      ?AUTO_3244 - BLOCK
    )
    :vars
    (
      ?AUTO_3246 - BLOCK
      ?AUTO_3245 - BLOCK
      ?AUTO_3250 - BLOCK
      ?AUTO_3247 - BLOCK
      ?AUTO_3252 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3243 ?AUTO_3246 ) ( ON ?AUTO_3245 ?AUTO_3243 ) ( ON ?AUTO_3250 ?AUTO_3245 ) ( ON ?AUTO_3247 ?AUTO_3244 ) ( CLEAR ?AUTO_3247 ) ( ON ?AUTO_3252 ?AUTO_3250 ) ( CLEAR ?AUTO_3252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3252 ?AUTO_3250 )
      ( MAKE-ON ?AUTO_3243 ?AUTO_3244 )
      ( MAKE-ON-VERIFY ?AUTO_3243 ?AUTO_3244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3257 - BLOCK
      ?AUTO_3258 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3257 ) ( CLEAR ?AUTO_3258 ) )
    :subtasks
    ( ( !STACK ?AUTO_3257 ?AUTO_3258 )
      ( MAKE-ON-VERIFY ?AUTO_3257 ?AUTO_3258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3261 - BLOCK
      ?AUTO_3262 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3262 ) ( ON-TABLE ?AUTO_3261 ) ( CLEAR ?AUTO_3261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3261 )
      ( MAKE-ON ?AUTO_3261 ?AUTO_3262 )
      ( MAKE-ON-VERIFY ?AUTO_3261 ?AUTO_3262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3266 - BLOCK
      ?AUTO_3267 - BLOCK
    )
    :vars
    (
      ?AUTO_3270 - BLOCK
      ?AUTO_3271 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3267 ) ( ON-TABLE ?AUTO_3266 ) ( CLEAR ?AUTO_3266 ) ( HOLDING ?AUTO_3270 ) ( CLEAR ?AUTO_3271 ) )
    :subtasks
    ( ( !STACK ?AUTO_3270 ?AUTO_3271 )
      ( MAKE-ON ?AUTO_3266 ?AUTO_3267 )
      ( MAKE-ON-VERIFY ?AUTO_3266 ?AUTO_3267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3272 - BLOCK
      ?AUTO_3273 - BLOCK
    )
    :vars
    (
      ?AUTO_3275 - BLOCK
      ?AUTO_3277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3272 ) ( CLEAR ?AUTO_3272 ) ( CLEAR ?AUTO_3275 ) ( ON ?AUTO_3277 ?AUTO_3273 ) ( CLEAR ?AUTO_3277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3277 ?AUTO_3273 )
      ( MAKE-ON ?AUTO_3272 ?AUTO_3273 )
      ( MAKE-ON-VERIFY ?AUTO_3272 ?AUTO_3273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3280 - BLOCK
      ?AUTO_3281 - BLOCK
    )
    :vars
    (
      ?AUTO_3284 - BLOCK
      ?AUTO_3285 - BLOCK
      ?AUTO_3286 - BLOCK
      ?AUTO_3287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3280 ) ( CLEAR ?AUTO_3280 ) ( CLEAR ?AUTO_3284 ) ( ON ?AUTO_3285 ?AUTO_3281 ) ( CLEAR ?AUTO_3285 ) ( HOLDING ?AUTO_3286 ) ( CLEAR ?AUTO_3287 ) )
    :subtasks
    ( ( !STACK ?AUTO_3286 ?AUTO_3287 )
      ( MAKE-ON ?AUTO_3280 ?AUTO_3281 )
      ( MAKE-ON-VERIFY ?AUTO_3280 ?AUTO_3281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3288 - BLOCK
      ?AUTO_3289 - BLOCK
    )
    :vars
    (
      ?AUTO_3293 - BLOCK
      ?AUTO_3292 - BLOCK
      ?AUTO_3295 - BLOCK
      ?AUTO_3294 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3288 ) ( CLEAR ?AUTO_3288 ) ( CLEAR ?AUTO_3293 ) ( ON ?AUTO_3292 ?AUTO_3289 ) ( CLEAR ?AUTO_3295 ) ( ON ?AUTO_3294 ?AUTO_3292 ) ( CLEAR ?AUTO_3294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3294 ?AUTO_3292 )
      ( MAKE-ON ?AUTO_3288 ?AUTO_3289 )
      ( MAKE-ON-VERIFY ?AUTO_3288 ?AUTO_3289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3298 - BLOCK
      ?AUTO_3299 - BLOCK
    )
    :vars
    (
      ?AUTO_3304 - BLOCK
      ?AUTO_3305 - BLOCK
      ?AUTO_3303 - BLOCK
      ?AUTO_3302 - BLOCK
      ?AUTO_3306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3298 ) ( CLEAR ?AUTO_3298 ) ( CLEAR ?AUTO_3304 ) ( ON ?AUTO_3305 ?AUTO_3299 ) ( CLEAR ?AUTO_3303 ) ( ON ?AUTO_3302 ?AUTO_3305 ) ( CLEAR ?AUTO_3302 ) ( HOLDING ?AUTO_3306 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3306 )
      ( MAKE-ON ?AUTO_3298 ?AUTO_3299 )
      ( MAKE-ON-VERIFY ?AUTO_3298 ?AUTO_3299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3307 - BLOCK
      ?AUTO_3308 - BLOCK
    )
    :vars
    (
      ?AUTO_3309 - BLOCK
      ?AUTO_3310 - BLOCK
      ?AUTO_3313 - BLOCK
      ?AUTO_3314 - BLOCK
      ?AUTO_3315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3307 ) ( CLEAR ?AUTO_3307 ) ( CLEAR ?AUTO_3309 ) ( ON ?AUTO_3310 ?AUTO_3308 ) ( CLEAR ?AUTO_3313 ) ( ON ?AUTO_3314 ?AUTO_3310 ) ( ON ?AUTO_3315 ?AUTO_3314 ) ( CLEAR ?AUTO_3315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3315 ?AUTO_3314 )
      ( MAKE-ON ?AUTO_3307 ?AUTO_3308 )
      ( MAKE-ON-VERIFY ?AUTO_3307 ?AUTO_3308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3318 - BLOCK
      ?AUTO_3319 - BLOCK
    )
    :vars
    (
      ?AUTO_3323 - BLOCK
      ?AUTO_3325 - BLOCK
      ?AUTO_3322 - BLOCK
      ?AUTO_3321 - BLOCK
      ?AUTO_3324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3318 ) ( CLEAR ?AUTO_3318 ) ( ON ?AUTO_3323 ?AUTO_3319 ) ( CLEAR ?AUTO_3325 ) ( ON ?AUTO_3322 ?AUTO_3323 ) ( ON ?AUTO_3321 ?AUTO_3322 ) ( CLEAR ?AUTO_3321 ) ( HOLDING ?AUTO_3324 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3324 )
      ( MAKE-ON ?AUTO_3318 ?AUTO_3319 )
      ( MAKE-ON-VERIFY ?AUTO_3318 ?AUTO_3319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3328 - BLOCK
      ?AUTO_3329 - BLOCK
    )
    :vars
    (
      ?AUTO_3334 - BLOCK
      ?AUTO_3336 - BLOCK
      ?AUTO_3335 - BLOCK
      ?AUTO_3332 - BLOCK
      ?AUTO_3333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3328 ) ( ON ?AUTO_3334 ?AUTO_3329 ) ( CLEAR ?AUTO_3336 ) ( ON ?AUTO_3335 ?AUTO_3334 ) ( ON ?AUTO_3332 ?AUTO_3335 ) ( CLEAR ?AUTO_3332 ) ( ON ?AUTO_3333 ?AUTO_3328 ) ( CLEAR ?AUTO_3333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3333 ?AUTO_3328 )
      ( MAKE-ON ?AUTO_3328 ?AUTO_3329 )
      ( MAKE-ON-VERIFY ?AUTO_3328 ?AUTO_3329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3339 - BLOCK
      ?AUTO_3340 - BLOCK
    )
    :vars
    (
      ?AUTO_3342 - BLOCK
      ?AUTO_3345 - BLOCK
      ?AUTO_3346 - BLOCK
      ?AUTO_3341 - BLOCK
      ?AUTO_3347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3339 ) ( ON ?AUTO_3342 ?AUTO_3340 ) ( ON ?AUTO_3345 ?AUTO_3342 ) ( ON ?AUTO_3346 ?AUTO_3345 ) ( CLEAR ?AUTO_3346 ) ( ON ?AUTO_3341 ?AUTO_3339 ) ( CLEAR ?AUTO_3341 ) ( HOLDING ?AUTO_3347 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3347 )
      ( MAKE-ON ?AUTO_3339 ?AUTO_3340 )
      ( MAKE-ON-VERIFY ?AUTO_3339 ?AUTO_3340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3349 - BLOCK
      ?AUTO_3350 - BLOCK
    )
    :vars
    (
      ?AUTO_3352 - BLOCK
      ?AUTO_3357 - BLOCK
      ?AUTO_3356 - BLOCK
      ?AUTO_3353 - BLOCK
      ?AUTO_3351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3349 ) ( ON ?AUTO_3352 ?AUTO_3350 ) ( ON ?AUTO_3357 ?AUTO_3352 ) ( ON ?AUTO_3356 ?AUTO_3357 ) ( CLEAR ?AUTO_3356 ) ( ON ?AUTO_3353 ?AUTO_3349 ) ( ON ?AUTO_3351 ?AUTO_3353 ) ( CLEAR ?AUTO_3351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3351 ?AUTO_3353 )
      ( MAKE-ON ?AUTO_3349 ?AUTO_3350 )
      ( MAKE-ON-VERIFY ?AUTO_3349 ?AUTO_3350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3360 - BLOCK
      ?AUTO_3361 - BLOCK
    )
    :vars
    (
      ?AUTO_3362 - BLOCK
      ?AUTO_3367 - BLOCK
      ?AUTO_3363 - BLOCK
      ?AUTO_3366 - BLOCK
      ?AUTO_3368 - BLOCK
      ?AUTO_3369 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3360 ) ( ON ?AUTO_3362 ?AUTO_3361 ) ( ON ?AUTO_3367 ?AUTO_3362 ) ( ON ?AUTO_3363 ?AUTO_3367 ) ( CLEAR ?AUTO_3363 ) ( ON ?AUTO_3366 ?AUTO_3360 ) ( ON ?AUTO_3368 ?AUTO_3366 ) ( CLEAR ?AUTO_3368 ) ( HOLDING ?AUTO_3369 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3369 )
      ( MAKE-ON ?AUTO_3360 ?AUTO_3361 )
      ( MAKE-ON-VERIFY ?AUTO_3360 ?AUTO_3361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3370 - BLOCK
      ?AUTO_3371 - BLOCK
    )
    :vars
    (
      ?AUTO_3374 - BLOCK
      ?AUTO_3373 - BLOCK
      ?AUTO_3372 - BLOCK
      ?AUTO_3378 - BLOCK
      ?AUTO_3379 - BLOCK
      ?AUTO_3375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3370 ) ( ON ?AUTO_3374 ?AUTO_3371 ) ( ON ?AUTO_3373 ?AUTO_3374 ) ( ON ?AUTO_3372 ?AUTO_3373 ) ( ON ?AUTO_3378 ?AUTO_3370 ) ( ON ?AUTO_3379 ?AUTO_3378 ) ( CLEAR ?AUTO_3379 ) ( ON ?AUTO_3375 ?AUTO_3372 ) ( CLEAR ?AUTO_3375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3375 ?AUTO_3372 )
      ( MAKE-ON ?AUTO_3370 ?AUTO_3371 )
      ( MAKE-ON-VERIFY ?AUTO_3370 ?AUTO_3371 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3383 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3383 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3383 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3383 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3385 - BLOCK
    )
    :vars
    (
      ?AUTO_3388 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3385 ?AUTO_3388 ) ( CLEAR ?AUTO_3385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3385 ?AUTO_3388 )
      ( MAKE-ON-TABLE ?AUTO_3385 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3385 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3389 - BLOCK
    )
    :vars
    (
      ?AUTO_3391 - BLOCK
      ?AUTO_3392 - BLOCK
      ?AUTO_3393 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3389 ?AUTO_3391 ) ( CLEAR ?AUTO_3389 ) ( HOLDING ?AUTO_3392 ) ( CLEAR ?AUTO_3393 ) )
    :subtasks
    ( ( !STACK ?AUTO_3392 ?AUTO_3393 )
      ( MAKE-ON-TABLE ?AUTO_3389 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3389 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3400 - BLOCK
    )
    :vars
    (
      ?AUTO_3402 - BLOCK
      ?AUTO_3404 - BLOCK
      ?AUTO_3403 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3400 ?AUTO_3402 ) ( CLEAR ?AUTO_3404 ) ( ON ?AUTO_3403 ?AUTO_3400 ) ( CLEAR ?AUTO_3403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3403 ?AUTO_3400 )
      ( MAKE-ON-TABLE ?AUTO_3400 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3400 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3407 - BLOCK
    )
    :vars
    (
      ?AUTO_3408 - BLOCK
      ?AUTO_3409 - BLOCK
      ?AUTO_3410 - BLOCK
      ?AUTO_3412 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3407 ?AUTO_3408 ) ( CLEAR ?AUTO_3409 ) ( ON ?AUTO_3410 ?AUTO_3407 ) ( CLEAR ?AUTO_3410 ) ( HOLDING ?AUTO_3412 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3412 )
      ( MAKE-ON-TABLE ?AUTO_3407 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3407 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3417 - BLOCK
    )
    :vars
    (
      ?AUTO_3421 - BLOCK
      ?AUTO_3422 - BLOCK
      ?AUTO_3419 - BLOCK
      ?AUTO_3418 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3417 ?AUTO_3421 ) ( CLEAR ?AUTO_3422 ) ( ON ?AUTO_3419 ?AUTO_3417 ) ( ON ?AUTO_3418 ?AUTO_3419 ) ( CLEAR ?AUTO_3418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3418 ?AUTO_3419 )
      ( MAKE-ON-TABLE ?AUTO_3417 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3427 - BLOCK
      ?AUTO_3428 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3427 ) ( CLEAR ?AUTO_3428 ) )
    :subtasks
    ( ( !STACK ?AUTO_3427 ?AUTO_3428 )
      ( MAKE-ON-VERIFY ?AUTO_3427 ?AUTO_3428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3431 - BLOCK
      ?AUTO_3432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3432 ) ( ON-TABLE ?AUTO_3431 ) ( CLEAR ?AUTO_3431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3431 )
      ( MAKE-ON ?AUTO_3431 ?AUTO_3432 )
      ( MAKE-ON-VERIFY ?AUTO_3431 ?AUTO_3432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3436 - BLOCK
      ?AUTO_3437 - BLOCK
    )
    :vars
    (
      ?AUTO_3440 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3437 ) ( ON-TABLE ?AUTO_3436 ) ( CLEAR ?AUTO_3436 ) ( HOLDING ?AUTO_3440 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3440 )
      ( MAKE-ON ?AUTO_3436 ?AUTO_3437 )
      ( MAKE-ON-VERIFY ?AUTO_3436 ?AUTO_3437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3441 - BLOCK
      ?AUTO_3442 - BLOCK
    )
    :vars
    (
      ?AUTO_3445 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3442 ) ( ON-TABLE ?AUTO_3441 ) ( ON ?AUTO_3445 ?AUTO_3441 ) ( CLEAR ?AUTO_3445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3445 ?AUTO_3441 )
      ( MAKE-ON ?AUTO_3441 ?AUTO_3442 )
      ( MAKE-ON-VERIFY ?AUTO_3441 ?AUTO_3442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3448 - BLOCK
      ?AUTO_3449 - BLOCK
    )
    :vars
    (
      ?AUTO_3451 - BLOCK
      ?AUTO_3453 - BLOCK
      ?AUTO_3454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3449 ) ( ON-TABLE ?AUTO_3448 ) ( ON ?AUTO_3451 ?AUTO_3448 ) ( CLEAR ?AUTO_3451 ) ( HOLDING ?AUTO_3453 ) ( CLEAR ?AUTO_3454 ) )
    :subtasks
    ( ( !STACK ?AUTO_3453 ?AUTO_3454 )
      ( MAKE-ON ?AUTO_3448 ?AUTO_3449 )
      ( MAKE-ON-VERIFY ?AUTO_3448 ?AUTO_3449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3457 - BLOCK
      ?AUTO_3458 - BLOCK
    )
    :vars
    (
      ?AUTO_3460 - BLOCK
      ?AUTO_3463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3457 ) ( ON ?AUTO_3460 ?AUTO_3457 ) ( CLEAR ?AUTO_3460 ) ( HOLDING ?AUTO_3458 ) ( CLEAR ?AUTO_3463 ) )
    :subtasks
    ( ( !STACK ?AUTO_3458 ?AUTO_3463 )
      ( MAKE-ON ?AUTO_3457 ?AUTO_3458 )
      ( MAKE-ON-VERIFY ?AUTO_3457 ?AUTO_3458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3478 - BLOCK
      ?AUTO_3479 - BLOCK
    )
    :vars
    (
      ?AUTO_3480 - BLOCK
      ?AUTO_3485 - BLOCK
      ?AUTO_3483 - BLOCK
      ?AUTO_3482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3480 ) ( ON ?AUTO_3485 ?AUTO_3479 ) ( CLEAR ?AUTO_3483 ) ( ON ?AUTO_3482 ?AUTO_3485 ) ( CLEAR ?AUTO_3482 ) ( HOLDING ?AUTO_3478 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3478 )
      ( MAKE-ON ?AUTO_3478 ?AUTO_3479 )
      ( MAKE-ON-VERIFY ?AUTO_3478 ?AUTO_3479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3487 - BLOCK
      ?AUTO_3488 - BLOCK
    )
    :vars
    (
      ?AUTO_3490 - BLOCK
      ?AUTO_3491 - BLOCK
      ?AUTO_3492 - BLOCK
      ?AUTO_3489 - BLOCK
      ?AUTO_3496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3490 ) ( ON ?AUTO_3491 ?AUTO_3488 ) ( CLEAR ?AUTO_3492 ) ( ON ?AUTO_3489 ?AUTO_3491 ) ( CLEAR ?AUTO_3489 ) ( ON ?AUTO_3487 ?AUTO_3496 ) ( CLEAR ?AUTO_3487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3487 ?AUTO_3496 )
      ( MAKE-ON ?AUTO_3487 ?AUTO_3488 )
      ( MAKE-ON-VERIFY ?AUTO_3487 ?AUTO_3488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3497 - BLOCK
      ?AUTO_3498 - BLOCK
    )
    :vars
    (
      ?AUTO_3503 - BLOCK
      ?AUTO_3504 - BLOCK
      ?AUTO_3501 - BLOCK
      ?AUTO_3502 - BLOCK
      ?AUTO_3505 - BLOCK
      ?AUTO_3506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3503 ) ( ON ?AUTO_3504 ?AUTO_3498 ) ( CLEAR ?AUTO_3501 ) ( ON ?AUTO_3502 ?AUTO_3504 ) ( CLEAR ?AUTO_3502 ) ( ON ?AUTO_3497 ?AUTO_3505 ) ( CLEAR ?AUTO_3497 ) ( HOLDING ?AUTO_3506 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3506 )
      ( MAKE-ON ?AUTO_3497 ?AUTO_3498 )
      ( MAKE-ON-VERIFY ?AUTO_3497 ?AUTO_3498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3507 - BLOCK
      ?AUTO_3508 - BLOCK
    )
    :vars
    (
      ?AUTO_3513 - BLOCK
      ?AUTO_3512 - BLOCK
      ?AUTO_3515 - BLOCK
      ?AUTO_3510 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3513 ?AUTO_3508 ) ( ON ?AUTO_3512 ?AUTO_3513 ) ( ON ?AUTO_3507 ?AUTO_3515 ) ( CLEAR ?AUTO_3507 ) ( ON ?AUTO_3510 ?AUTO_3512 ) ( CLEAR ?AUTO_3510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3510 ?AUTO_3512 )
      ( MAKE-ON ?AUTO_3507 ?AUTO_3508 )
      ( MAKE-ON-VERIFY ?AUTO_3507 ?AUTO_3508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3521 - BLOCK
      ?AUTO_3522 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3521 ) ( CLEAR ?AUTO_3522 ) )
    :subtasks
    ( ( !STACK ?AUTO_3521 ?AUTO_3522 )
      ( MAKE-ON-VERIFY ?AUTO_3521 ?AUTO_3522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3525 - BLOCK
      ?AUTO_3526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3526 ) ( ON-TABLE ?AUTO_3525 ) ( CLEAR ?AUTO_3525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3525 )
      ( MAKE-ON ?AUTO_3525 ?AUTO_3526 )
      ( MAKE-ON-VERIFY ?AUTO_3525 ?AUTO_3526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3530 - BLOCK
      ?AUTO_3531 - BLOCK
    )
    :vars
    (
      ?AUTO_3535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3530 ) ( CLEAR ?AUTO_3530 ) ( HOLDING ?AUTO_3531 ) ( CLEAR ?AUTO_3535 ) )
    :subtasks
    ( ( !STACK ?AUTO_3531 ?AUTO_3535 )
      ( MAKE-ON ?AUTO_3530 ?AUTO_3531 )
      ( MAKE-ON-VERIFY ?AUTO_3530 ?AUTO_3531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3609 - BLOCK
      ?AUTO_3610 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3609 ) ( CLEAR ?AUTO_3610 ) )
    :subtasks
    ( ( !STACK ?AUTO_3609 ?AUTO_3610 )
      ( MAKE-ON-VERIFY ?AUTO_3609 ?AUTO_3610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3613 - BLOCK
      ?AUTO_3614 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3614 ) ( ON-TABLE ?AUTO_3613 ) ( CLEAR ?AUTO_3613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3613 )
      ( MAKE-ON ?AUTO_3613 ?AUTO_3614 )
      ( MAKE-ON-VERIFY ?AUTO_3613 ?AUTO_3614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3618 - BLOCK
      ?AUTO_3619 - BLOCK
    )
    :vars
    (
      ?AUTO_3623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3618 ) ( CLEAR ?AUTO_3618 ) ( HOLDING ?AUTO_3619 ) ( CLEAR ?AUTO_3623 ) )
    :subtasks
    ( ( !STACK ?AUTO_3619 ?AUTO_3623 )
      ( MAKE-ON ?AUTO_3618 ?AUTO_3619 )
      ( MAKE-ON-VERIFY ?AUTO_3618 ?AUTO_3619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3626 - BLOCK
      ?AUTO_3627 - BLOCK
    )
    :vars
    (
      ?AUTO_3630 - BLOCK
      ?AUTO_3631 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3627 ) ( ON-TABLE ?AUTO_3626 ) ( CLEAR ?AUTO_3626 ) ( HOLDING ?AUTO_3630 ) ( CLEAR ?AUTO_3631 ) )
    :subtasks
    ( ( !STACK ?AUTO_3630 ?AUTO_3631 )
      ( MAKE-ON ?AUTO_3626 ?AUTO_3627 )
      ( MAKE-ON-VERIFY ?AUTO_3626 ?AUTO_3627 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3633 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3633 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3633 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3633 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3635 - BLOCK
    )
    :vars
    (
      ?AUTO_3638 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3635 ?AUTO_3638 ) ( CLEAR ?AUTO_3635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3635 ?AUTO_3638 )
      ( MAKE-ON-TABLE ?AUTO_3635 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3635 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3640 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3640 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3640 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3640 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3642 - BLOCK
    )
    :vars
    (
      ?AUTO_3645 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3642 ?AUTO_3645 ) ( CLEAR ?AUTO_3642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3642 ?AUTO_3645 )
      ( MAKE-ON-TABLE ?AUTO_3642 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3642 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3646 - BLOCK
    )
    :vars
    (
      ?AUTO_3648 - BLOCK
      ?AUTO_3649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3646 ?AUTO_3648 ) ( CLEAR ?AUTO_3646 ) ( HOLDING ?AUTO_3649 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3649 )
      ( MAKE-ON-TABLE ?AUTO_3646 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3646 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3650 - BLOCK
    )
    :vars
    (
      ?AUTO_3652 - BLOCK
      ?AUTO_3653 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3650 ?AUTO_3652 ) ( ON ?AUTO_3653 ?AUTO_3650 ) ( CLEAR ?AUTO_3653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3653 ?AUTO_3650 )
      ( MAKE-ON-TABLE ?AUTO_3650 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3650 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3657 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3657 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3657 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3657 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3659 - BLOCK
    )
    :vars
    (
      ?AUTO_3662 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3659 ?AUTO_3662 ) ( CLEAR ?AUTO_3659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3659 ?AUTO_3662 )
      ( MAKE-ON-TABLE ?AUTO_3659 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3659 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3663 - BLOCK
    )
    :vars
    (
      ?AUTO_3665 - BLOCK
      ?AUTO_3666 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3663 ?AUTO_3665 ) ( CLEAR ?AUTO_3663 ) ( HOLDING ?AUTO_3666 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3666 )
      ( MAKE-ON-TABLE ?AUTO_3663 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3663 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3667 - BLOCK
    )
    :vars
    (
      ?AUTO_3669 - BLOCK
      ?AUTO_3670 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3667 ?AUTO_3669 ) ( ON ?AUTO_3670 ?AUTO_3667 ) ( CLEAR ?AUTO_3670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3670 ?AUTO_3667 )
      ( MAKE-ON-TABLE ?AUTO_3667 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3667 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3673 - BLOCK
    )
    :vars
    (
      ?AUTO_3674 - BLOCK
      ?AUTO_3675 - BLOCK
      ?AUTO_3677 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3673 ?AUTO_3674 ) ( ON ?AUTO_3675 ?AUTO_3673 ) ( CLEAR ?AUTO_3675 ) ( HOLDING ?AUTO_3677 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3677 )
      ( MAKE-ON-TABLE ?AUTO_3673 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3673 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3678 - BLOCK
    )
    :vars
    (
      ?AUTO_3680 - BLOCK
      ?AUTO_3681 - BLOCK
      ?AUTO_3682 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3678 ?AUTO_3680 ) ( ON ?AUTO_3681 ?AUTO_3678 ) ( ON ?AUTO_3682 ?AUTO_3681 ) ( CLEAR ?AUTO_3682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3682 ?AUTO_3681 )
      ( MAKE-ON-TABLE ?AUTO_3678 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3687 - BLOCK
      ?AUTO_3688 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3687 ) ( CLEAR ?AUTO_3688 ) )
    :subtasks
    ( ( !STACK ?AUTO_3687 ?AUTO_3688 )
      ( MAKE-ON-VERIFY ?AUTO_3687 ?AUTO_3688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3691 - BLOCK
      ?AUTO_3692 - BLOCK
    )
    :vars
    (
      ?AUTO_3696 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3692 ) ( ON ?AUTO_3691 ?AUTO_3696 ) ( CLEAR ?AUTO_3691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3691 ?AUTO_3696 )
      ( MAKE-ON ?AUTO_3691 ?AUTO_3692 )
      ( MAKE-ON-VERIFY ?AUTO_3691 ?AUTO_3692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3697 - BLOCK
      ?AUTO_3698 - BLOCK
    )
    :vars
    (
      ?AUTO_3701 - BLOCK
      ?AUTO_3702 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3698 ) ( ON ?AUTO_3697 ?AUTO_3701 ) ( CLEAR ?AUTO_3697 ) ( HOLDING ?AUTO_3702 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3702 )
      ( MAKE-ON ?AUTO_3697 ?AUTO_3698 )
      ( MAKE-ON-VERIFY ?AUTO_3697 ?AUTO_3698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3703 - BLOCK
      ?AUTO_3704 - BLOCK
    )
    :vars
    (
      ?AUTO_3707 - BLOCK
      ?AUTO_3708 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3703 ?AUTO_3707 ) ( CLEAR ?AUTO_3703 ) ( ON ?AUTO_3708 ?AUTO_3704 ) ( CLEAR ?AUTO_3708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3708 ?AUTO_3704 )
      ( MAKE-ON ?AUTO_3703 ?AUTO_3704 )
      ( MAKE-ON-VERIFY ?AUTO_3703 ?AUTO_3704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3711 - BLOCK
      ?AUTO_3712 - BLOCK
    )
    :vars
    (
      ?AUTO_3716 - BLOCK
      ?AUTO_3713 - BLOCK
      ?AUTO_3717 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3711 ?AUTO_3716 ) ( CLEAR ?AUTO_3711 ) ( ON ?AUTO_3713 ?AUTO_3712 ) ( CLEAR ?AUTO_3713 ) ( HOLDING ?AUTO_3717 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3717 )
      ( MAKE-ON ?AUTO_3711 ?AUTO_3712 )
      ( MAKE-ON-VERIFY ?AUTO_3711 ?AUTO_3712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3718 - BLOCK
      ?AUTO_3719 - BLOCK
    )
    :vars
    (
      ?AUTO_3723 - BLOCK
      ?AUTO_3720 - BLOCK
      ?AUTO_3724 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3718 ?AUTO_3723 ) ( CLEAR ?AUTO_3718 ) ( ON ?AUTO_3720 ?AUTO_3719 ) ( ON ?AUTO_3724 ?AUTO_3720 ) ( CLEAR ?AUTO_3724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3724 ?AUTO_3720 )
      ( MAKE-ON ?AUTO_3718 ?AUTO_3719 )
      ( MAKE-ON-VERIFY ?AUTO_3718 ?AUTO_3719 ) )
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
      ?AUTO_3730 - BLOCK
      ?AUTO_3734 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3727 ?AUTO_3732 ) ( CLEAR ?AUTO_3727 ) ( ON ?AUTO_3731 ?AUTO_3728 ) ( ON ?AUTO_3730 ?AUTO_3731 ) ( CLEAR ?AUTO_3730 ) ( HOLDING ?AUTO_3734 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3734 )
      ( MAKE-ON ?AUTO_3727 ?AUTO_3728 )
      ( MAKE-ON-VERIFY ?AUTO_3727 ?AUTO_3728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3735 - BLOCK
      ?AUTO_3736 - BLOCK
    )
    :vars
    (
      ?AUTO_3742 - BLOCK
      ?AUTO_3741 - BLOCK
      ?AUTO_3737 - BLOCK
      ?AUTO_3740 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3735 ?AUTO_3742 ) ( CLEAR ?AUTO_3735 ) ( ON ?AUTO_3741 ?AUTO_3736 ) ( ON ?AUTO_3737 ?AUTO_3741 ) ( ON ?AUTO_3740 ?AUTO_3737 ) ( CLEAR ?AUTO_3740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3740 ?AUTO_3737 )
      ( MAKE-ON ?AUTO_3735 ?AUTO_3736 )
      ( MAKE-ON-VERIFY ?AUTO_3735 ?AUTO_3736 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3746 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3746 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3746 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3746 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3748 - BLOCK
    )
    :vars
    (
      ?AUTO_3751 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3748 ?AUTO_3751 ) ( CLEAR ?AUTO_3748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3748 ?AUTO_3751 )
      ( MAKE-ON-TABLE ?AUTO_3748 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3748 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3752 - BLOCK
    )
    :vars
    (
      ?AUTO_3754 - BLOCK
      ?AUTO_3755 - BLOCK
      ?AUTO_3756 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3752 ?AUTO_3754 ) ( CLEAR ?AUTO_3752 ) ( HOLDING ?AUTO_3755 ) ( CLEAR ?AUTO_3756 ) )
    :subtasks
    ( ( !STACK ?AUTO_3755 ?AUTO_3756 )
      ( MAKE-ON-TABLE ?AUTO_3752 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3752 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3757 - BLOCK
    )
    :vars
    (
      ?AUTO_3759 - BLOCK
      ?AUTO_3761 - BLOCK
      ?AUTO_3760 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3757 ?AUTO_3759 ) ( CLEAR ?AUTO_3761 ) ( ON ?AUTO_3760 ?AUTO_3757 ) ( CLEAR ?AUTO_3760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3760 ?AUTO_3757 )
      ( MAKE-ON-TABLE ?AUTO_3757 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3757 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3764 - BLOCK
    )
    :vars
    (
      ?AUTO_3767 - BLOCK
      ?AUTO_3765 - BLOCK
      ?AUTO_3768 - BLOCK
      ?AUTO_3769 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3764 ?AUTO_3767 ) ( CLEAR ?AUTO_3765 ) ( ON ?AUTO_3768 ?AUTO_3764 ) ( CLEAR ?AUTO_3768 ) ( HOLDING ?AUTO_3769 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3769 )
      ( MAKE-ON-TABLE ?AUTO_3764 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3764 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3776 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3776 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3776 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3776 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3778 - BLOCK
    )
    :vars
    (
      ?AUTO_3781 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3778 ?AUTO_3781 ) ( CLEAR ?AUTO_3778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3778 ?AUTO_3781 )
      ( MAKE-ON-TABLE ?AUTO_3778 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3778 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3782 - BLOCK
    )
    :vars
    (
      ?AUTO_3784 - BLOCK
      ?AUTO_3785 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3782 ?AUTO_3784 ) ( CLEAR ?AUTO_3782 ) ( HOLDING ?AUTO_3785 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3785 )
      ( MAKE-ON-TABLE ?AUTO_3782 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3782 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3786 - BLOCK
    )
    :vars
    (
      ?AUTO_3788 - BLOCK
      ?AUTO_3789 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3786 ?AUTO_3788 ) ( ON ?AUTO_3789 ?AUTO_3786 ) ( CLEAR ?AUTO_3789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3789 ?AUTO_3786 )
      ( MAKE-ON-TABLE ?AUTO_3786 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3786 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3792 - BLOCK
    )
    :vars
    (
      ?AUTO_3793 - BLOCK
      ?AUTO_3794 - BLOCK
      ?AUTO_3796 - BLOCK
      ?AUTO_3797 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3792 ?AUTO_3793 ) ( ON ?AUTO_3794 ?AUTO_3792 ) ( CLEAR ?AUTO_3794 ) ( HOLDING ?AUTO_3796 ) ( CLEAR ?AUTO_3797 ) )
    :subtasks
    ( ( !STACK ?AUTO_3796 ?AUTO_3797 )
      ( MAKE-ON-TABLE ?AUTO_3792 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3792 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3798 - BLOCK
    )
    :vars
    (
      ?AUTO_3800 - BLOCK
      ?AUTO_3801 - BLOCK
      ?AUTO_3803 - BLOCK
      ?AUTO_3802 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3798 ?AUTO_3800 ) ( ON ?AUTO_3801 ?AUTO_3798 ) ( CLEAR ?AUTO_3803 ) ( ON ?AUTO_3802 ?AUTO_3801 ) ( CLEAR ?AUTO_3802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3802 ?AUTO_3801 )
      ( MAKE-ON-TABLE ?AUTO_3798 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3798 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3806 - BLOCK
    )
    :vars
    (
      ?AUTO_3811 - BLOCK
      ?AUTO_3809 - BLOCK
      ?AUTO_3807 - BLOCK
      ?AUTO_3808 - BLOCK
      ?AUTO_3812 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3806 ?AUTO_3811 ) ( ON ?AUTO_3809 ?AUTO_3806 ) ( CLEAR ?AUTO_3807 ) ( ON ?AUTO_3808 ?AUTO_3809 ) ( CLEAR ?AUTO_3808 ) ( HOLDING ?AUTO_3812 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3812 )
      ( MAKE-ON-TABLE ?AUTO_3806 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3820 - BLOCK
      ?AUTO_3821 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3820 ) ( CLEAR ?AUTO_3821 ) )
    :subtasks
    ( ( !STACK ?AUTO_3820 ?AUTO_3821 )
      ( MAKE-ON-VERIFY ?AUTO_3820 ?AUTO_3821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3824 - BLOCK
      ?AUTO_3825 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3825 ) ( ON-TABLE ?AUTO_3824 ) ( CLEAR ?AUTO_3824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3824 )
      ( MAKE-ON ?AUTO_3824 ?AUTO_3825 )
      ( MAKE-ON-VERIFY ?AUTO_3824 ?AUTO_3825 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3829 - BLOCK
      ?AUTO_3830 - BLOCK
    )
    :vars
    (
      ?AUTO_3833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3830 ) ( ON-TABLE ?AUTO_3829 ) ( CLEAR ?AUTO_3829 ) ( HOLDING ?AUTO_3833 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3833 )
      ( MAKE-ON ?AUTO_3829 ?AUTO_3830 )
      ( MAKE-ON-VERIFY ?AUTO_3829 ?AUTO_3830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3834 - BLOCK
      ?AUTO_3835 - BLOCK
    )
    :vars
    (
      ?AUTO_3838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3834 ) ( CLEAR ?AUTO_3834 ) ( ON ?AUTO_3838 ?AUTO_3835 ) ( CLEAR ?AUTO_3838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3838 ?AUTO_3835 )
      ( MAKE-ON ?AUTO_3834 ?AUTO_3835 )
      ( MAKE-ON-VERIFY ?AUTO_3834 ?AUTO_3835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3841 - BLOCK
      ?AUTO_3842 - BLOCK
    )
    :vars
    (
      ?AUTO_3844 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3844 ?AUTO_3842 ) ( CLEAR ?AUTO_3844 ) ( HOLDING ?AUTO_3841 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3841 )
      ( MAKE-ON ?AUTO_3841 ?AUTO_3842 )
      ( MAKE-ON-VERIFY ?AUTO_3841 ?AUTO_3842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3847 - BLOCK
      ?AUTO_3848 - BLOCK
    )
    :vars
    (
      ?AUTO_3851 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3851 ?AUTO_3848 ) ( ON ?AUTO_3847 ?AUTO_3851 ) ( CLEAR ?AUTO_3847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3847 ?AUTO_3851 )
      ( MAKE-ON ?AUTO_3847 ?AUTO_3848 )
      ( MAKE-ON-VERIFY ?AUTO_3847 ?AUTO_3848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3854 - BLOCK
      ?AUTO_3855 - BLOCK
    )
    :vars
    (
      ?AUTO_3858 - BLOCK
      ?AUTO_3859 - BLOCK
      ?AUTO_3860 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3858 ?AUTO_3855 ) ( ON ?AUTO_3854 ?AUTO_3858 ) ( CLEAR ?AUTO_3854 ) ( HOLDING ?AUTO_3859 ) ( CLEAR ?AUTO_3860 ) )
    :subtasks
    ( ( !STACK ?AUTO_3859 ?AUTO_3860 )
      ( MAKE-ON ?AUTO_3854 ?AUTO_3855 )
      ( MAKE-ON-VERIFY ?AUTO_3854 ?AUTO_3855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3861 - BLOCK
      ?AUTO_3862 - BLOCK
    )
    :vars
    (
      ?AUTO_3864 - BLOCK
      ?AUTO_3867 - BLOCK
      ?AUTO_3866 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3864 ?AUTO_3862 ) ( ON ?AUTO_3861 ?AUTO_3864 ) ( CLEAR ?AUTO_3867 ) ( ON ?AUTO_3866 ?AUTO_3861 ) ( CLEAR ?AUTO_3866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3866 ?AUTO_3861 )
      ( MAKE-ON ?AUTO_3861 ?AUTO_3862 )
      ( MAKE-ON-VERIFY ?AUTO_3861 ?AUTO_3862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3870 - BLOCK
      ?AUTO_3871 - BLOCK
    )
    :vars
    (
      ?AUTO_3872 - BLOCK
      ?AUTO_3876 - BLOCK
      ?AUTO_3873 - BLOCK
      ?AUTO_3877 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3872 ?AUTO_3871 ) ( ON ?AUTO_3870 ?AUTO_3872 ) ( CLEAR ?AUTO_3876 ) ( ON ?AUTO_3873 ?AUTO_3870 ) ( CLEAR ?AUTO_3873 ) ( HOLDING ?AUTO_3877 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3877 )
      ( MAKE-ON ?AUTO_3870 ?AUTO_3871 )
      ( MAKE-ON-VERIFY ?AUTO_3870 ?AUTO_3871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3890 - BLOCK
      ?AUTO_3891 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3890 ) ( CLEAR ?AUTO_3891 ) )
    :subtasks
    ( ( !STACK ?AUTO_3890 ?AUTO_3891 )
      ( MAKE-ON-VERIFY ?AUTO_3890 ?AUTO_3891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3894 - BLOCK
      ?AUTO_3895 - BLOCK
    )
    :vars
    (
      ?AUTO_3899 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3895 ) ( ON ?AUTO_3894 ?AUTO_3899 ) ( CLEAR ?AUTO_3894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3894 ?AUTO_3899 )
      ( MAKE-ON ?AUTO_3894 ?AUTO_3895 )
      ( MAKE-ON-VERIFY ?AUTO_3894 ?AUTO_3895 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3900 - BLOCK
      ?AUTO_3901 - BLOCK
    )
    :vars
    (
      ?AUTO_3904 - BLOCK
      ?AUTO_3906 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3900 ?AUTO_3904 ) ( CLEAR ?AUTO_3900 ) ( HOLDING ?AUTO_3901 ) ( CLEAR ?AUTO_3906 ) )
    :subtasks
    ( ( !STACK ?AUTO_3901 ?AUTO_3906 )
      ( MAKE-ON ?AUTO_3900 ?AUTO_3901 )
      ( MAKE-ON-VERIFY ?AUTO_3900 ?AUTO_3901 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3909 - BLOCK
      ?AUTO_3910 - BLOCK
    )
    :vars
    (
      ?AUTO_3913 - BLOCK
      ?AUTO_3914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3910 ) ( ON ?AUTO_3909 ?AUTO_3913 ) ( CLEAR ?AUTO_3909 ) ( HOLDING ?AUTO_3914 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3914 )
      ( MAKE-ON ?AUTO_3909 ?AUTO_3910 )
      ( MAKE-ON-VERIFY ?AUTO_3909 ?AUTO_3910 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3948 - BLOCK
      ?AUTO_3949 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3948 ) ( CLEAR ?AUTO_3949 ) )
    :subtasks
    ( ( !STACK ?AUTO_3948 ?AUTO_3949 )
      ( MAKE-ON-VERIFY ?AUTO_3948 ?AUTO_3949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3952 - BLOCK
      ?AUTO_3953 - BLOCK
    )
    :vars
    (
      ?AUTO_3957 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3953 ) ( ON ?AUTO_3952 ?AUTO_3957 ) ( CLEAR ?AUTO_3952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3952 ?AUTO_3957 )
      ( MAKE-ON ?AUTO_3952 ?AUTO_3953 )
      ( MAKE-ON-VERIFY ?AUTO_3952 ?AUTO_3953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3958 - BLOCK
      ?AUTO_3959 - BLOCK
    )
    :vars
    (
      ?AUTO_3962 - BLOCK
      ?AUTO_3963 - BLOCK
      ?AUTO_3964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3959 ) ( ON ?AUTO_3958 ?AUTO_3962 ) ( CLEAR ?AUTO_3958 ) ( HOLDING ?AUTO_3963 ) ( CLEAR ?AUTO_3964 ) )
    :subtasks
    ( ( !STACK ?AUTO_3963 ?AUTO_3964 )
      ( MAKE-ON ?AUTO_3958 ?AUTO_3959 )
      ( MAKE-ON-VERIFY ?AUTO_3958 ?AUTO_3959 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3965 - BLOCK
      ?AUTO_3966 - BLOCK
    )
    :vars
    (
      ?AUTO_3970 - BLOCK
      ?AUTO_3967 - BLOCK
      ?AUTO_3971 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3966 ) ( ON ?AUTO_3965 ?AUTO_3970 ) ( CLEAR ?AUTO_3967 ) ( ON ?AUTO_3971 ?AUTO_3965 ) ( CLEAR ?AUTO_3971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3971 ?AUTO_3965 )
      ( MAKE-ON ?AUTO_3965 ?AUTO_3966 )
      ( MAKE-ON-VERIFY ?AUTO_3965 ?AUTO_3966 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3974 - BLOCK
      ?AUTO_3975 - BLOCK
    )
    :vars
    (
      ?AUTO_3977 - BLOCK
      ?AUTO_3978 - BLOCK
      ?AUTO_3976 - BLOCK
      ?AUTO_3982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3975 ) ( ON ?AUTO_3974 ?AUTO_3977 ) ( ON ?AUTO_3978 ?AUTO_3974 ) ( CLEAR ?AUTO_3978 ) ( HOLDING ?AUTO_3976 ) ( CLEAR ?AUTO_3982 ) )
    :subtasks
    ( ( !STACK ?AUTO_3976 ?AUTO_3982 )
      ( MAKE-ON ?AUTO_3974 ?AUTO_3975 )
      ( MAKE-ON-VERIFY ?AUTO_3974 ?AUTO_3975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3985 - BLOCK
      ?AUTO_3986 - BLOCK
    )
    :vars
    (
      ?AUTO_3987 - BLOCK
      ?AUTO_3988 - BLOCK
      ?AUTO_3989 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3985 ?AUTO_3987 ) ( CLEAR ?AUTO_3988 ) ( ON ?AUTO_3989 ?AUTO_3985 ) ( CLEAR ?AUTO_3989 ) ( HOLDING ?AUTO_3986 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3986 )
      ( MAKE-ON ?AUTO_3985 ?AUTO_3986 )
      ( MAKE-ON-VERIFY ?AUTO_3985 ?AUTO_3986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3997 - BLOCK
      ?AUTO_3998 - BLOCK
    )
    :vars
    (
      ?AUTO_4001 - BLOCK
      ?AUTO_4004 - BLOCK
      ?AUTO_3999 - BLOCK
      ?AUTO_4003 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3997 ?AUTO_4001 ) ( ON ?AUTO_4004 ?AUTO_3997 ) ( CLEAR ?AUTO_4004 ) ( CLEAR ?AUTO_3999 ) ( ON ?AUTO_4003 ?AUTO_3998 ) ( CLEAR ?AUTO_4003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4003 ?AUTO_3998 )
      ( MAKE-ON ?AUTO_3997 ?AUTO_3998 )
      ( MAKE-ON-VERIFY ?AUTO_3997 ?AUTO_3998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4007 - BLOCK
      ?AUTO_4008 - BLOCK
    )
    :vars
    (
      ?AUTO_4013 - BLOCK
      ?AUTO_4012 - BLOCK
      ?AUTO_4011 - BLOCK
      ?AUTO_4014 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4007 ?AUTO_4013 ) ( CLEAR ?AUTO_4012 ) ( ON ?AUTO_4011 ?AUTO_4008 ) ( CLEAR ?AUTO_4011 ) ( HOLDING ?AUTO_4014 ) ( CLEAR ?AUTO_4007 ) )
    :subtasks
    ( ( !STACK ?AUTO_4014 ?AUTO_4007 )
      ( MAKE-ON ?AUTO_4007 ?AUTO_4008 )
      ( MAKE-ON-VERIFY ?AUTO_4007 ?AUTO_4008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4017 - BLOCK
      ?AUTO_4018 - BLOCK
    )
    :vars
    (
      ?AUTO_4023 - BLOCK
      ?AUTO_4024 - BLOCK
      ?AUTO_4022 - BLOCK
      ?AUTO_4019 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4017 ?AUTO_4023 ) ( CLEAR ?AUTO_4024 ) ( ON ?AUTO_4022 ?AUTO_4018 ) ( CLEAR ?AUTO_4017 ) ( ON ?AUTO_4019 ?AUTO_4022 ) ( CLEAR ?AUTO_4019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4019 ?AUTO_4022 )
      ( MAKE-ON ?AUTO_4017 ?AUTO_4018 )
      ( MAKE-ON-VERIFY ?AUTO_4017 ?AUTO_4018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4027 - BLOCK
      ?AUTO_4028 - BLOCK
    )
    :vars
    (
      ?AUTO_4032 - BLOCK
      ?AUTO_4034 - BLOCK
      ?AUTO_4029 - BLOCK
      ?AUTO_4033 - BLOCK
      ?AUTO_4035 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4027 ?AUTO_4032 ) ( CLEAR ?AUTO_4034 ) ( ON ?AUTO_4029 ?AUTO_4028 ) ( CLEAR ?AUTO_4027 ) ( ON ?AUTO_4033 ?AUTO_4029 ) ( CLEAR ?AUTO_4033 ) ( HOLDING ?AUTO_4035 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4035 )
      ( MAKE-ON ?AUTO_4027 ?AUTO_4028 )
      ( MAKE-ON-VERIFY ?AUTO_4027 ?AUTO_4028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4036 - BLOCK
      ?AUTO_4037 - BLOCK
    )
    :vars
    (
      ?AUTO_4044 - BLOCK
      ?AUTO_4038 - BLOCK
      ?AUTO_4039 - BLOCK
      ?AUTO_4043 - BLOCK
      ?AUTO_4042 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4036 ?AUTO_4044 ) ( CLEAR ?AUTO_4038 ) ( ON ?AUTO_4039 ?AUTO_4037 ) ( ON ?AUTO_4043 ?AUTO_4039 ) ( CLEAR ?AUTO_4043 ) ( ON ?AUTO_4042 ?AUTO_4036 ) ( CLEAR ?AUTO_4042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4042 ?AUTO_4036 )
      ( MAKE-ON ?AUTO_4036 ?AUTO_4037 )
      ( MAKE-ON-VERIFY ?AUTO_4036 ?AUTO_4037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4047 - BLOCK
      ?AUTO_4048 - BLOCK
    )
    :vars
    (
      ?AUTO_4055 - BLOCK
      ?AUTO_4050 - BLOCK
      ?AUTO_4051 - BLOCK
      ?AUTO_4054 - BLOCK
      ?AUTO_4052 - BLOCK
      ?AUTO_4056 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4047 ?AUTO_4055 ) ( CLEAR ?AUTO_4050 ) ( ON ?AUTO_4051 ?AUTO_4048 ) ( ON ?AUTO_4054 ?AUTO_4051 ) ( CLEAR ?AUTO_4054 ) ( ON ?AUTO_4052 ?AUTO_4047 ) ( CLEAR ?AUTO_4052 ) ( HOLDING ?AUTO_4056 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4056 )
      ( MAKE-ON ?AUTO_4047 ?AUTO_4048 )
      ( MAKE-ON-VERIFY ?AUTO_4047 ?AUTO_4048 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4057 - BLOCK
      ?AUTO_4058 - BLOCK
    )
    :vars
    (
      ?AUTO_4064 - BLOCK
      ?AUTO_4060 - BLOCK
      ?AUTO_4065 - BLOCK
      ?AUTO_4059 - BLOCK
      ?AUTO_4061 - BLOCK
      ?AUTO_4066 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4057 ?AUTO_4064 ) ( CLEAR ?AUTO_4060 ) ( ON ?AUTO_4065 ?AUTO_4058 ) ( ON ?AUTO_4059 ?AUTO_4065 ) ( CLEAR ?AUTO_4059 ) ( ON ?AUTO_4061 ?AUTO_4057 ) ( ON ?AUTO_4066 ?AUTO_4061 ) ( CLEAR ?AUTO_4066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4066 ?AUTO_4061 )
      ( MAKE-ON ?AUTO_4057 ?AUTO_4058 )
      ( MAKE-ON-VERIFY ?AUTO_4057 ?AUTO_4058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4069 - BLOCK
      ?AUTO_4070 - BLOCK
    )
    :vars
    (
      ?AUTO_4077 - BLOCK
      ?AUTO_4076 - BLOCK
      ?AUTO_4073 - BLOCK
      ?AUTO_4072 - BLOCK
      ?AUTO_4078 - BLOCK
      ?AUTO_4074 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4069 ?AUTO_4077 ) ( ON ?AUTO_4076 ?AUTO_4070 ) ( ON ?AUTO_4073 ?AUTO_4076 ) ( CLEAR ?AUTO_4073 ) ( ON ?AUTO_4072 ?AUTO_4069 ) ( ON ?AUTO_4078 ?AUTO_4072 ) ( CLEAR ?AUTO_4078 ) ( HOLDING ?AUTO_4074 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4074 )
      ( MAKE-ON ?AUTO_4069 ?AUTO_4070 )
      ( MAKE-ON-VERIFY ?AUTO_4069 ?AUTO_4070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4080 - BLOCK
      ?AUTO_4081 - BLOCK
    )
    :vars
    (
      ?AUTO_4082 - BLOCK
      ?AUTO_4086 - BLOCK
      ?AUTO_4089 - BLOCK
      ?AUTO_4083 - BLOCK
      ?AUTO_4088 - BLOCK
      ?AUTO_4087 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4080 ?AUTO_4082 ) ( ON ?AUTO_4086 ?AUTO_4081 ) ( ON ?AUTO_4089 ?AUTO_4086 ) ( CLEAR ?AUTO_4089 ) ( ON ?AUTO_4083 ?AUTO_4080 ) ( ON ?AUTO_4088 ?AUTO_4083 ) ( ON ?AUTO_4087 ?AUTO_4088 ) ( CLEAR ?AUTO_4087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4087 ?AUTO_4088 )
      ( MAKE-ON ?AUTO_4080 ?AUTO_4081 )
      ( MAKE-ON-VERIFY ?AUTO_4080 ?AUTO_4081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4094 - BLOCK
      ?AUTO_4095 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4094 ) ( CLEAR ?AUTO_4095 ) )
    :subtasks
    ( ( !STACK ?AUTO_4094 ?AUTO_4095 )
      ( MAKE-ON-VERIFY ?AUTO_4094 ?AUTO_4095 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4098 - BLOCK
      ?AUTO_4099 - BLOCK
    )
    :vars
    (
      ?AUTO_4103 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4099 ) ( ON ?AUTO_4098 ?AUTO_4103 ) ( CLEAR ?AUTO_4098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4098 ?AUTO_4103 )
      ( MAKE-ON ?AUTO_4098 ?AUTO_4099 )
      ( MAKE-ON-VERIFY ?AUTO_4098 ?AUTO_4099 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4104 - BLOCK
      ?AUTO_4105 - BLOCK
    )
    :vars
    (
      ?AUTO_4108 - BLOCK
      ?AUTO_4109 - BLOCK
      ?AUTO_4110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4105 ) ( ON ?AUTO_4104 ?AUTO_4108 ) ( CLEAR ?AUTO_4104 ) ( HOLDING ?AUTO_4109 ) ( CLEAR ?AUTO_4110 ) )
    :subtasks
    ( ( !STACK ?AUTO_4109 ?AUTO_4110 )
      ( MAKE-ON ?AUTO_4104 ?AUTO_4105 )
      ( MAKE-ON-VERIFY ?AUTO_4104 ?AUTO_4105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4111 - BLOCK
      ?AUTO_4112 - BLOCK
    )
    :vars
    (
      ?AUTO_4115 - BLOCK
      ?AUTO_4117 - BLOCK
      ?AUTO_4116 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4111 ?AUTO_4115 ) ( CLEAR ?AUTO_4111 ) ( CLEAR ?AUTO_4117 ) ( ON ?AUTO_4116 ?AUTO_4112 ) ( CLEAR ?AUTO_4116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4116 ?AUTO_4112 )
      ( MAKE-ON ?AUTO_4111 ?AUTO_4112 )
      ( MAKE-ON-VERIFY ?AUTO_4111 ?AUTO_4112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4120 - BLOCK
      ?AUTO_4121 - BLOCK
    )
    :vars
    (
      ?AUTO_4122 - BLOCK
      ?AUTO_4123 - BLOCK
      ?AUTO_4126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4122 ) ( ON ?AUTO_4123 ?AUTO_4121 ) ( CLEAR ?AUTO_4123 ) ( HOLDING ?AUTO_4120 ) ( CLEAR ?AUTO_4126 ) )
    :subtasks
    ( ( !STACK ?AUTO_4120 ?AUTO_4126 )
      ( MAKE-ON ?AUTO_4120 ?AUTO_4121 )
      ( MAKE-ON-VERIFY ?AUTO_4120 ?AUTO_4121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4129 - BLOCK
      ?AUTO_4130 - BLOCK
    )
    :vars
    (
      ?AUTO_4131 - BLOCK
      ?AUTO_4132 - BLOCK
      ?AUTO_4135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4131 ) ( ON ?AUTO_4132 ?AUTO_4130 ) ( CLEAR ?AUTO_4135 ) ( ON ?AUTO_4129 ?AUTO_4132 ) ( CLEAR ?AUTO_4129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4129 ?AUTO_4132 )
      ( MAKE-ON ?AUTO_4129 ?AUTO_4130 )
      ( MAKE-ON-VERIFY ?AUTO_4129 ?AUTO_4130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4138 - BLOCK
      ?AUTO_4139 - BLOCK
    )
    :vars
    (
      ?AUTO_4142 - BLOCK
      ?AUTO_4144 - BLOCK
      ?AUTO_4143 - BLOCK
      ?AUTO_4146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4142 ) ( ON ?AUTO_4144 ?AUTO_4139 ) ( ON ?AUTO_4138 ?AUTO_4144 ) ( CLEAR ?AUTO_4138 ) ( HOLDING ?AUTO_4143 ) ( CLEAR ?AUTO_4146 ) )
    :subtasks
    ( ( !STACK ?AUTO_4143 ?AUTO_4146 )
      ( MAKE-ON ?AUTO_4138 ?AUTO_4139 )
      ( MAKE-ON-VERIFY ?AUTO_4138 ?AUTO_4139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4167 - BLOCK
      ?AUTO_4168 - BLOCK
    )
    :vars
    (
      ?AUTO_4175 - BLOCK
      ?AUTO_4170 - BLOCK
      ?AUTO_4172 - BLOCK
      ?AUTO_4169 - BLOCK
      ?AUTO_4171 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4167 ?AUTO_4175 ) ( CLEAR ?AUTO_4170 ) ( ON ?AUTO_4172 ?AUTO_4168 ) ( CLEAR ?AUTO_4167 ) ( ON ?AUTO_4169 ?AUTO_4172 ) ( ON ?AUTO_4171 ?AUTO_4169 ) ( CLEAR ?AUTO_4171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4171 ?AUTO_4169 )
      ( MAKE-ON ?AUTO_4167 ?AUTO_4168 )
      ( MAKE-ON-VERIFY ?AUTO_4167 ?AUTO_4168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4178 - BLOCK
      ?AUTO_4179 - BLOCK
    )
    :vars
    (
      ?AUTO_4186 - BLOCK
      ?AUTO_4185 - BLOCK
      ?AUTO_4183 - BLOCK
      ?AUTO_4182 - BLOCK
      ?AUTO_4184 - BLOCK
      ?AUTO_4187 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4178 ?AUTO_4186 ) ( CLEAR ?AUTO_4185 ) ( ON ?AUTO_4183 ?AUTO_4179 ) ( CLEAR ?AUTO_4178 ) ( ON ?AUTO_4182 ?AUTO_4183 ) ( ON ?AUTO_4184 ?AUTO_4182 ) ( CLEAR ?AUTO_4184 ) ( HOLDING ?AUTO_4187 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4187 )
      ( MAKE-ON ?AUTO_4178 ?AUTO_4179 )
      ( MAKE-ON-VERIFY ?AUTO_4178 ?AUTO_4179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4188 - BLOCK
      ?AUTO_4189 - BLOCK
    )
    :vars
    (
      ?AUTO_4192 - BLOCK
      ?AUTO_4194 - BLOCK
      ?AUTO_4190 - BLOCK
      ?AUTO_4191 - BLOCK
      ?AUTO_4193 - BLOCK
      ?AUTO_4197 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4188 ?AUTO_4192 ) ( CLEAR ?AUTO_4194 ) ( ON ?AUTO_4190 ?AUTO_4189 ) ( CLEAR ?AUTO_4188 ) ( ON ?AUTO_4191 ?AUTO_4190 ) ( ON ?AUTO_4193 ?AUTO_4191 ) ( ON ?AUTO_4197 ?AUTO_4193 ) ( CLEAR ?AUTO_4197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4197 ?AUTO_4193 )
      ( MAKE-ON ?AUTO_4188 ?AUTO_4189 )
      ( MAKE-ON-VERIFY ?AUTO_4188 ?AUTO_4189 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4201 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4201 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4201 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4201 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4203 - BLOCK
    )
    :vars
    (
      ?AUTO_4206 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4203 ?AUTO_4206 ) ( CLEAR ?AUTO_4203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4203 ?AUTO_4206 )
      ( MAKE-ON-TABLE ?AUTO_4203 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4203 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4207 - BLOCK
    )
    :vars
    (
      ?AUTO_4209 - BLOCK
      ?AUTO_4210 - BLOCK
      ?AUTO_4211 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4207 ?AUTO_4209 ) ( CLEAR ?AUTO_4207 ) ( HOLDING ?AUTO_4210 ) ( CLEAR ?AUTO_4211 ) )
    :subtasks
    ( ( !STACK ?AUTO_4210 ?AUTO_4211 )
      ( MAKE-ON-TABLE ?AUTO_4207 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4207 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4212 - BLOCK
    )
    :vars
    (
      ?AUTO_4214 - BLOCK
      ?AUTO_4216 - BLOCK
      ?AUTO_4215 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4212 ?AUTO_4214 ) ( CLEAR ?AUTO_4216 ) ( ON ?AUTO_4215 ?AUTO_4212 ) ( CLEAR ?AUTO_4215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4215 ?AUTO_4212 )
      ( MAKE-ON-TABLE ?AUTO_4212 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4212 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4219 - BLOCK
    )
    :vars
    (
      ?AUTO_4222 - BLOCK
      ?AUTO_4220 - BLOCK
      ?AUTO_4223 - BLOCK
      ?AUTO_4224 - BLOCK
      ?AUTO_4225 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4219 ?AUTO_4222 ) ( CLEAR ?AUTO_4220 ) ( ON ?AUTO_4223 ?AUTO_4219 ) ( CLEAR ?AUTO_4223 ) ( HOLDING ?AUTO_4224 ) ( CLEAR ?AUTO_4225 ) )
    :subtasks
    ( ( !STACK ?AUTO_4224 ?AUTO_4225 )
      ( MAKE-ON-TABLE ?AUTO_4219 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4255 - BLOCK
      ?AUTO_4256 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4255 ) ( CLEAR ?AUTO_4256 ) )
    :subtasks
    ( ( !STACK ?AUTO_4255 ?AUTO_4256 )
      ( MAKE-ON-VERIFY ?AUTO_4255 ?AUTO_4256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4259 - BLOCK
      ?AUTO_4260 - BLOCK
    )
    :vars
    (
      ?AUTO_4264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4260 ) ( ON ?AUTO_4259 ?AUTO_4264 ) ( CLEAR ?AUTO_4259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4259 ?AUTO_4264 )
      ( MAKE-ON ?AUTO_4259 ?AUTO_4260 )
      ( MAKE-ON-VERIFY ?AUTO_4259 ?AUTO_4260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4265 - BLOCK
      ?AUTO_4266 - BLOCK
    )
    :vars
    (
      ?AUTO_4269 - BLOCK
      ?AUTO_4270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4266 ) ( ON ?AUTO_4265 ?AUTO_4269 ) ( CLEAR ?AUTO_4265 ) ( HOLDING ?AUTO_4270 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4270 )
      ( MAKE-ON ?AUTO_4265 ?AUTO_4266 )
      ( MAKE-ON-VERIFY ?AUTO_4265 ?AUTO_4266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4271 - BLOCK
      ?AUTO_4272 - BLOCK
    )
    :vars
    (
      ?AUTO_4276 - BLOCK
      ?AUTO_4273 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4272 ) ( ON ?AUTO_4271 ?AUTO_4276 ) ( ON ?AUTO_4273 ?AUTO_4271 ) ( CLEAR ?AUTO_4273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4273 ?AUTO_4271 )
      ( MAKE-ON ?AUTO_4271 ?AUTO_4272 )
      ( MAKE-ON-VERIFY ?AUTO_4271 ?AUTO_4272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4279 - BLOCK
      ?AUTO_4280 - BLOCK
    )
    :vars
    (
      ?AUTO_4283 - BLOCK
      ?AUTO_4284 - BLOCK
      ?AUTO_4285 - BLOCK
      ?AUTO_4286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4280 ) ( ON ?AUTO_4279 ?AUTO_4283 ) ( ON ?AUTO_4284 ?AUTO_4279 ) ( CLEAR ?AUTO_4284 ) ( HOLDING ?AUTO_4285 ) ( CLEAR ?AUTO_4286 ) )
    :subtasks
    ( ( !STACK ?AUTO_4285 ?AUTO_4286 )
      ( MAKE-ON ?AUTO_4279 ?AUTO_4280 )
      ( MAKE-ON-VERIFY ?AUTO_4279 ?AUTO_4280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4287 - BLOCK
      ?AUTO_4288 - BLOCK
    )
    :vars
    (
      ?AUTO_4290 - BLOCK
      ?AUTO_4293 - BLOCK
      ?AUTO_4289 - BLOCK
      ?AUTO_4294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4288 ) ( ON ?AUTO_4287 ?AUTO_4290 ) ( ON ?AUTO_4293 ?AUTO_4287 ) ( CLEAR ?AUTO_4289 ) ( ON ?AUTO_4294 ?AUTO_4293 ) ( CLEAR ?AUTO_4294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4294 ?AUTO_4293 )
      ( MAKE-ON ?AUTO_4287 ?AUTO_4288 )
      ( MAKE-ON-VERIFY ?AUTO_4287 ?AUTO_4288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4297 - BLOCK
      ?AUTO_4298 - BLOCK
    )
    :vars
    (
      ?AUTO_4301 - BLOCK
      ?AUTO_4304 - BLOCK
      ?AUTO_4303 - BLOCK
      ?AUTO_4302 - BLOCK
      ?AUTO_4306 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4297 ?AUTO_4301 ) ( ON ?AUTO_4304 ?AUTO_4297 ) ( CLEAR ?AUTO_4303 ) ( ON ?AUTO_4302 ?AUTO_4304 ) ( CLEAR ?AUTO_4302 ) ( HOLDING ?AUTO_4298 ) ( CLEAR ?AUTO_4306 ) )
    :subtasks
    ( ( !STACK ?AUTO_4298 ?AUTO_4306 )
      ( MAKE-ON ?AUTO_4297 ?AUTO_4298 )
      ( MAKE-ON-VERIFY ?AUTO_4297 ?AUTO_4298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4311 - BLOCK
      ?AUTO_4312 - BLOCK
    )
    :vars
    (
      ?AUTO_4314 - BLOCK
      ?AUTO_4317 - BLOCK
      ?AUTO_4313 - BLOCK
      ?AUTO_4318 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4311 ?AUTO_4314 ) ( ON ?AUTO_4317 ?AUTO_4311 ) ( CLEAR ?AUTO_4317 ) ( CLEAR ?AUTO_4313 ) ( ON ?AUTO_4318 ?AUTO_4312 ) ( CLEAR ?AUTO_4318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4318 ?AUTO_4312 )
      ( MAKE-ON ?AUTO_4311 ?AUTO_4312 )
      ( MAKE-ON-VERIFY ?AUTO_4311 ?AUTO_4312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4321 - BLOCK
      ?AUTO_4322 - BLOCK
    )
    :vars
    (
      ?AUTO_4327 - BLOCK
      ?AUTO_4326 - BLOCK
      ?AUTO_4328 - BLOCK
      ?AUTO_4325 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4321 ?AUTO_4327 ) ( CLEAR ?AUTO_4326 ) ( ON ?AUTO_4328 ?AUTO_4322 ) ( CLEAR ?AUTO_4328 ) ( HOLDING ?AUTO_4325 ) ( CLEAR ?AUTO_4321 ) )
    :subtasks
    ( ( !STACK ?AUTO_4325 ?AUTO_4321 )
      ( MAKE-ON ?AUTO_4321 ?AUTO_4322 )
      ( MAKE-ON-VERIFY ?AUTO_4321 ?AUTO_4322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4337 - BLOCK
      ?AUTO_4338 - BLOCK
    )
    :vars
    (
      ?AUTO_4340 - BLOCK
      ?AUTO_4341 - BLOCK
      ?AUTO_4343 - BLOCK
      ?AUTO_4339 - BLOCK
      ?AUTO_4345 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4337 ?AUTO_4340 ) ( ON ?AUTO_4341 ?AUTO_4337 ) ( CLEAR ?AUTO_4341 ) ( CLEAR ?AUTO_4343 ) ( ON ?AUTO_4339 ?AUTO_4338 ) ( CLEAR ?AUTO_4339 ) ( HOLDING ?AUTO_4345 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4345 )
      ( MAKE-ON ?AUTO_4337 ?AUTO_4338 )
      ( MAKE-ON-VERIFY ?AUTO_4337 ?AUTO_4338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4346 - BLOCK
      ?AUTO_4347 - BLOCK
    )
    :vars
    (
      ?AUTO_4353 - BLOCK
      ?AUTO_4351 - BLOCK
      ?AUTO_4354 - BLOCK
      ?AUTO_4352 - BLOCK
      ?AUTO_4348 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4346 ?AUTO_4353 ) ( ON ?AUTO_4351 ?AUTO_4346 ) ( CLEAR ?AUTO_4354 ) ( ON ?AUTO_4352 ?AUTO_4347 ) ( CLEAR ?AUTO_4352 ) ( ON ?AUTO_4348 ?AUTO_4351 ) ( CLEAR ?AUTO_4348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4348 ?AUTO_4351 )
      ( MAKE-ON ?AUTO_4346 ?AUTO_4347 )
      ( MAKE-ON-VERIFY ?AUTO_4346 ?AUTO_4347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4357 - BLOCK
      ?AUTO_4358 - BLOCK
    )
    :vars
    (
      ?AUTO_4364 - BLOCK
      ?AUTO_4359 - BLOCK
      ?AUTO_4365 - BLOCK
      ?AUTO_4360 - BLOCK
      ?AUTO_4362 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4357 ?AUTO_4364 ) ( ON ?AUTO_4359 ?AUTO_4357 ) ( CLEAR ?AUTO_4365 ) ( ON ?AUTO_4360 ?AUTO_4359 ) ( CLEAR ?AUTO_4360 ) ( HOLDING ?AUTO_4362 ) ( CLEAR ?AUTO_4358 ) )
    :subtasks
    ( ( !STACK ?AUTO_4362 ?AUTO_4358 )
      ( MAKE-ON ?AUTO_4357 ?AUTO_4358 )
      ( MAKE-ON-VERIFY ?AUTO_4357 ?AUTO_4358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4368 - BLOCK
      ?AUTO_4369 - BLOCK
    )
    :vars
    (
      ?AUTO_4375 - BLOCK
      ?AUTO_4371 - BLOCK
      ?AUTO_4376 - BLOCK
      ?AUTO_4372 - BLOCK
      ?AUTO_4370 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4368 ?AUTO_4375 ) ( ON ?AUTO_4371 ?AUTO_4368 ) ( CLEAR ?AUTO_4376 ) ( ON ?AUTO_4372 ?AUTO_4371 ) ( CLEAR ?AUTO_4369 ) ( ON ?AUTO_4370 ?AUTO_4372 ) ( CLEAR ?AUTO_4370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4370 ?AUTO_4372 )
      ( MAKE-ON ?AUTO_4368 ?AUTO_4369 )
      ( MAKE-ON-VERIFY ?AUTO_4368 ?AUTO_4369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4379 - BLOCK
      ?AUTO_4380 - BLOCK
    )
    :vars
    (
      ?AUTO_4387 - BLOCK
      ?AUTO_4381 - BLOCK
      ?AUTO_4385 - BLOCK
      ?AUTO_4386 - BLOCK
      ?AUTO_4382 - BLOCK
      ?AUTO_4388 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4379 ?AUTO_4387 ) ( ON ?AUTO_4381 ?AUTO_4379 ) ( CLEAR ?AUTO_4385 ) ( ON ?AUTO_4386 ?AUTO_4381 ) ( CLEAR ?AUTO_4380 ) ( ON ?AUTO_4382 ?AUTO_4386 ) ( CLEAR ?AUTO_4382 ) ( HOLDING ?AUTO_4388 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4388 )
      ( MAKE-ON ?AUTO_4379 ?AUTO_4380 )
      ( MAKE-ON-VERIFY ?AUTO_4379 ?AUTO_4380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4389 - BLOCK
      ?AUTO_4390 - BLOCK
    )
    :vars
    (
      ?AUTO_4397 - BLOCK
      ?AUTO_4391 - BLOCK
      ?AUTO_4393 - BLOCK
      ?AUTO_4398 - BLOCK
      ?AUTO_4392 - BLOCK
      ?AUTO_4394 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4389 ?AUTO_4397 ) ( ON ?AUTO_4391 ?AUTO_4389 ) ( CLEAR ?AUTO_4393 ) ( ON ?AUTO_4398 ?AUTO_4391 ) ( ON ?AUTO_4392 ?AUTO_4398 ) ( CLEAR ?AUTO_4392 ) ( ON ?AUTO_4394 ?AUTO_4390 ) ( CLEAR ?AUTO_4394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4394 ?AUTO_4390 )
      ( MAKE-ON ?AUTO_4389 ?AUTO_4390 )
      ( MAKE-ON-VERIFY ?AUTO_4389 ?AUTO_4390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4401 - BLOCK
      ?AUTO_4402 - BLOCK
    )
    :vars
    (
      ?AUTO_4410 - BLOCK
      ?AUTO_4407 - BLOCK
      ?AUTO_4406 - BLOCK
      ?AUTO_4403 - BLOCK
      ?AUTO_4409 - BLOCK
      ?AUTO_4405 - BLOCK
      ?AUTO_4411 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4401 ?AUTO_4410 ) ( ON ?AUTO_4407 ?AUTO_4401 ) ( CLEAR ?AUTO_4406 ) ( ON ?AUTO_4403 ?AUTO_4407 ) ( ON ?AUTO_4409 ?AUTO_4403 ) ( CLEAR ?AUTO_4409 ) ( ON ?AUTO_4405 ?AUTO_4402 ) ( CLEAR ?AUTO_4405 ) ( HOLDING ?AUTO_4411 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4411 )
      ( MAKE-ON ?AUTO_4401 ?AUTO_4402 )
      ( MAKE-ON-VERIFY ?AUTO_4401 ?AUTO_4402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4412 - BLOCK
      ?AUTO_4413 - BLOCK
    )
    :vars
    (
      ?AUTO_4422 - BLOCK
      ?AUTO_4415 - BLOCK
      ?AUTO_4414 - BLOCK
      ?AUTO_4416 - BLOCK
      ?AUTO_4421 - BLOCK
      ?AUTO_4420 - BLOCK
      ?AUTO_4417 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4412 ?AUTO_4422 ) ( ON ?AUTO_4415 ?AUTO_4412 ) ( CLEAR ?AUTO_4414 ) ( ON ?AUTO_4416 ?AUTO_4415 ) ( ON ?AUTO_4421 ?AUTO_4416 ) ( CLEAR ?AUTO_4421 ) ( ON ?AUTO_4420 ?AUTO_4413 ) ( ON ?AUTO_4417 ?AUTO_4420 ) ( CLEAR ?AUTO_4417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4417 ?AUTO_4420 )
      ( MAKE-ON ?AUTO_4412 ?AUTO_4413 )
      ( MAKE-ON-VERIFY ?AUTO_4412 ?AUTO_4413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4425 - BLOCK
      ?AUTO_4426 - BLOCK
    )
    :vars
    (
      ?AUTO_4433 - BLOCK
      ?AUTO_4428 - BLOCK
      ?AUTO_4431 - BLOCK
      ?AUTO_4435 - BLOCK
      ?AUTO_4434 - BLOCK
      ?AUTO_4430 - BLOCK
      ?AUTO_4429 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4425 ?AUTO_4433 ) ( ON ?AUTO_4428 ?AUTO_4425 ) ( ON ?AUTO_4431 ?AUTO_4428 ) ( ON ?AUTO_4435 ?AUTO_4431 ) ( CLEAR ?AUTO_4435 ) ( ON ?AUTO_4434 ?AUTO_4426 ) ( ON ?AUTO_4430 ?AUTO_4434 ) ( CLEAR ?AUTO_4430 ) ( HOLDING ?AUTO_4429 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4429 )
      ( MAKE-ON ?AUTO_4425 ?AUTO_4426 )
      ( MAKE-ON-VERIFY ?AUTO_4425 ?AUTO_4426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4437 - BLOCK
      ?AUTO_4438 - BLOCK
    )
    :vars
    (
      ?AUTO_4445 - BLOCK
      ?AUTO_4444 - BLOCK
      ?AUTO_4441 - BLOCK
      ?AUTO_4447 - BLOCK
      ?AUTO_4440 - BLOCK
      ?AUTO_4443 - BLOCK
      ?AUTO_4439 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4437 ?AUTO_4445 ) ( ON ?AUTO_4444 ?AUTO_4437 ) ( ON ?AUTO_4441 ?AUTO_4444 ) ( ON ?AUTO_4447 ?AUTO_4441 ) ( CLEAR ?AUTO_4447 ) ( ON ?AUTO_4440 ?AUTO_4438 ) ( ON ?AUTO_4443 ?AUTO_4440 ) ( ON ?AUTO_4439 ?AUTO_4443 ) ( CLEAR ?AUTO_4439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4439 ?AUTO_4443 )
      ( MAKE-ON ?AUTO_4437 ?AUTO_4438 )
      ( MAKE-ON-VERIFY ?AUTO_4437 ?AUTO_4438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4452 - BLOCK
      ?AUTO_4453 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4452 ) ( CLEAR ?AUTO_4453 ) )
    :subtasks
    ( ( !STACK ?AUTO_4452 ?AUTO_4453 )
      ( MAKE-ON-VERIFY ?AUTO_4452 ?AUTO_4453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4456 - BLOCK
      ?AUTO_4457 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4457 ) ( ON-TABLE ?AUTO_4456 ) ( CLEAR ?AUTO_4456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4456 )
      ( MAKE-ON ?AUTO_4456 ?AUTO_4457 )
      ( MAKE-ON-VERIFY ?AUTO_4456 ?AUTO_4457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4461 - BLOCK
      ?AUTO_4462 - BLOCK
    )
    :vars
    (
      ?AUTO_4465 - BLOCK
      ?AUTO_4466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4462 ) ( ON-TABLE ?AUTO_4461 ) ( CLEAR ?AUTO_4461 ) ( HOLDING ?AUTO_4465 ) ( CLEAR ?AUTO_4466 ) )
    :subtasks
    ( ( !STACK ?AUTO_4465 ?AUTO_4466 )
      ( MAKE-ON ?AUTO_4461 ?AUTO_4462 )
      ( MAKE-ON-VERIFY ?AUTO_4461 ?AUTO_4462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4467 - BLOCK
      ?AUTO_4468 - BLOCK
    )
    :vars
    (
      ?AUTO_4470 - BLOCK
      ?AUTO_4472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4468 ) ( ON-TABLE ?AUTO_4467 ) ( CLEAR ?AUTO_4470 ) ( ON ?AUTO_4472 ?AUTO_4467 ) ( CLEAR ?AUTO_4472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4472 ?AUTO_4467 )
      ( MAKE-ON ?AUTO_4467 ?AUTO_4468 )
      ( MAKE-ON-VERIFY ?AUTO_4467 ?AUTO_4468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4475 - BLOCK
      ?AUTO_4476 - BLOCK
    )
    :vars
    (
      ?AUTO_4479 - BLOCK
      ?AUTO_4480 - BLOCK
      ?AUTO_4481 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4476 ) ( ON-TABLE ?AUTO_4475 ) ( CLEAR ?AUTO_4479 ) ( ON ?AUTO_4480 ?AUTO_4475 ) ( CLEAR ?AUTO_4480 ) ( HOLDING ?AUTO_4481 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4481 )
      ( MAKE-ON ?AUTO_4475 ?AUTO_4476 )
      ( MAKE-ON-VERIFY ?AUTO_4475 ?AUTO_4476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4482 - BLOCK
      ?AUTO_4483 - BLOCK
    )
    :vars
    (
      ?AUTO_4487 - BLOCK
      ?AUTO_4486 - BLOCK
      ?AUTO_4488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4483 ) ( ON-TABLE ?AUTO_4482 ) ( CLEAR ?AUTO_4487 ) ( ON ?AUTO_4486 ?AUTO_4482 ) ( ON ?AUTO_4488 ?AUTO_4486 ) ( CLEAR ?AUTO_4488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4488 ?AUTO_4486 )
      ( MAKE-ON ?AUTO_4482 ?AUTO_4483 )
      ( MAKE-ON-VERIFY ?AUTO_4482 ?AUTO_4483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4491 - BLOCK
      ?AUTO_4492 - BLOCK
    )
    :vars
    (
      ?AUTO_4493 - BLOCK
      ?AUTO_4494 - BLOCK
      ?AUTO_4496 - BLOCK
      ?AUTO_4498 - BLOCK
      ?AUTO_4499 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4492 ) ( ON-TABLE ?AUTO_4491 ) ( CLEAR ?AUTO_4493 ) ( ON ?AUTO_4494 ?AUTO_4491 ) ( ON ?AUTO_4496 ?AUTO_4494 ) ( CLEAR ?AUTO_4496 ) ( HOLDING ?AUTO_4498 ) ( CLEAR ?AUTO_4499 ) )
    :subtasks
    ( ( !STACK ?AUTO_4498 ?AUTO_4499 )
      ( MAKE-ON ?AUTO_4491 ?AUTO_4492 )
      ( MAKE-ON-VERIFY ?AUTO_4491 ?AUTO_4492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4500 - BLOCK
      ?AUTO_4501 - BLOCK
    )
    :vars
    (
      ?AUTO_4502 - BLOCK
      ?AUTO_4503 - BLOCK
      ?AUTO_4508 - BLOCK
      ?AUTO_4505 - BLOCK
      ?AUTO_4504 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4501 ) ( ON-TABLE ?AUTO_4500 ) ( CLEAR ?AUTO_4502 ) ( ON ?AUTO_4503 ?AUTO_4500 ) ( ON ?AUTO_4508 ?AUTO_4503 ) ( CLEAR ?AUTO_4505 ) ( ON ?AUTO_4504 ?AUTO_4508 ) ( CLEAR ?AUTO_4504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4504 ?AUTO_4508 )
      ( MAKE-ON ?AUTO_4500 ?AUTO_4501 )
      ( MAKE-ON-VERIFY ?AUTO_4500 ?AUTO_4501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4511 - BLOCK
      ?AUTO_4512 - BLOCK
    )
    :vars
    (
      ?AUTO_4517 - BLOCK
      ?AUTO_4516 - BLOCK
      ?AUTO_4518 - BLOCK
      ?AUTO_4519 - BLOCK
      ?AUTO_4515 - BLOCK
      ?AUTO_4521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4512 ) ( ON-TABLE ?AUTO_4511 ) ( ON ?AUTO_4517 ?AUTO_4511 ) ( ON ?AUTO_4516 ?AUTO_4517 ) ( CLEAR ?AUTO_4518 ) ( ON ?AUTO_4519 ?AUTO_4516 ) ( CLEAR ?AUTO_4519 ) ( HOLDING ?AUTO_4515 ) ( CLEAR ?AUTO_4521 ) )
    :subtasks
    ( ( !STACK ?AUTO_4515 ?AUTO_4521 )
      ( MAKE-ON ?AUTO_4511 ?AUTO_4512 )
      ( MAKE-ON-VERIFY ?AUTO_4511 ?AUTO_4512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4542 - BLOCK
      ?AUTO_4543 - BLOCK
    )
    :vars
    (
      ?AUTO_4550 - BLOCK
      ?AUTO_4547 - BLOCK
      ?AUTO_4549 - BLOCK
      ?AUTO_4544 - BLOCK
      ?AUTO_4548 - BLOCK
      ?AUTO_4551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4543 ) ( ON-TABLE ?AUTO_4542 ) ( ON ?AUTO_4550 ?AUTO_4542 ) ( ON ?AUTO_4547 ?AUTO_4550 ) ( CLEAR ?AUTO_4549 ) ( ON ?AUTO_4544 ?AUTO_4547 ) ( CLEAR ?AUTO_4548 ) ( ON ?AUTO_4551 ?AUTO_4544 ) ( CLEAR ?AUTO_4551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4551 ?AUTO_4544 )
      ( MAKE-ON ?AUTO_4542 ?AUTO_4543 )
      ( MAKE-ON-VERIFY ?AUTO_4542 ?AUTO_4543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4554 - BLOCK
      ?AUTO_4555 - BLOCK
    )
    :vars
    (
      ?AUTO_4556 - BLOCK
      ?AUTO_4562 - BLOCK
      ?AUTO_4558 - BLOCK
      ?AUTO_4557 - BLOCK
      ?AUTO_4561 - BLOCK
      ?AUTO_4563 - BLOCK
      ?AUTO_4564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4555 ) ( ON-TABLE ?AUTO_4554 ) ( ON ?AUTO_4556 ?AUTO_4554 ) ( ON ?AUTO_4562 ?AUTO_4556 ) ( CLEAR ?AUTO_4558 ) ( ON ?AUTO_4557 ?AUTO_4562 ) ( CLEAR ?AUTO_4561 ) ( ON ?AUTO_4563 ?AUTO_4557 ) ( CLEAR ?AUTO_4563 ) ( HOLDING ?AUTO_4564 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4564 )
      ( MAKE-ON ?AUTO_4554 ?AUTO_4555 )
      ( MAKE-ON-VERIFY ?AUTO_4554 ?AUTO_4555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4571 - BLOCK
      ?AUTO_4572 - BLOCK
    )
    :vars
    (
      ?AUTO_4579 - BLOCK
      ?AUTO_4576 - BLOCK
      ?AUTO_4575 - BLOCK
      ?AUTO_4577 - BLOCK
      ?AUTO_4578 - BLOCK
      ?AUTO_4573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4571 ) ( ON ?AUTO_4579 ?AUTO_4571 ) ( ON ?AUTO_4576 ?AUTO_4579 ) ( CLEAR ?AUTO_4575 ) ( ON ?AUTO_4577 ?AUTO_4576 ) ( CLEAR ?AUTO_4578 ) ( ON ?AUTO_4573 ?AUTO_4577 ) ( CLEAR ?AUTO_4573 ) ( HOLDING ?AUTO_4572 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4572 )
      ( MAKE-ON ?AUTO_4571 ?AUTO_4572 )
      ( MAKE-ON-VERIFY ?AUTO_4571 ?AUTO_4572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4586 - BLOCK
      ?AUTO_4587 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4586 ) ( CLEAR ?AUTO_4587 ) )
    :subtasks
    ( ( !STACK ?AUTO_4586 ?AUTO_4587 )
      ( MAKE-ON-VERIFY ?AUTO_4586 ?AUTO_4587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4590 - BLOCK
      ?AUTO_4591 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4591 ) ( ON-TABLE ?AUTO_4590 ) ( CLEAR ?AUTO_4590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4590 )
      ( MAKE-ON ?AUTO_4590 ?AUTO_4591 )
      ( MAKE-ON-VERIFY ?AUTO_4590 ?AUTO_4591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4595 - BLOCK
      ?AUTO_4596 - BLOCK
    )
    :vars
    (
      ?AUTO_4599 - BLOCK
      ?AUTO_4600 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4596 ) ( ON-TABLE ?AUTO_4595 ) ( CLEAR ?AUTO_4595 ) ( HOLDING ?AUTO_4599 ) ( CLEAR ?AUTO_4600 ) )
    :subtasks
    ( ( !STACK ?AUTO_4599 ?AUTO_4600 )
      ( MAKE-ON ?AUTO_4595 ?AUTO_4596 )
      ( MAKE-ON-VERIFY ?AUTO_4595 ?AUTO_4596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4603 - BLOCK
      ?AUTO_4604 - BLOCK
    )
    :vars
    (
      ?AUTO_4608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4603 ) ( CLEAR ?AUTO_4603 ) ( HOLDING ?AUTO_4604 ) ( CLEAR ?AUTO_4608 ) )
    :subtasks
    ( ( !STACK ?AUTO_4604 ?AUTO_4608 )
      ( MAKE-ON ?AUTO_4603 ?AUTO_4604 )
      ( MAKE-ON-VERIFY ?AUTO_4603 ?AUTO_4604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4711 - BLOCK
      ?AUTO_4712 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4711 ) ( CLEAR ?AUTO_4712 ) )
    :subtasks
    ( ( !STACK ?AUTO_4711 ?AUTO_4712 )
      ( MAKE-ON-VERIFY ?AUTO_4711 ?AUTO_4712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4715 - BLOCK
      ?AUTO_4716 - BLOCK
    )
    :vars
    (
      ?AUTO_4720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4716 ) ( ON ?AUTO_4715 ?AUTO_4720 ) ( CLEAR ?AUTO_4715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4715 ?AUTO_4720 )
      ( MAKE-ON ?AUTO_4715 ?AUTO_4716 )
      ( MAKE-ON-VERIFY ?AUTO_4715 ?AUTO_4716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4721 - BLOCK
      ?AUTO_4722 - BLOCK
    )
    :vars
    (
      ?AUTO_4725 - BLOCK
      ?AUTO_4727 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4721 ?AUTO_4725 ) ( CLEAR ?AUTO_4721 ) ( HOLDING ?AUTO_4722 ) ( CLEAR ?AUTO_4727 ) )
    :subtasks
    ( ( !STACK ?AUTO_4722 ?AUTO_4727 )
      ( MAKE-ON ?AUTO_4721 ?AUTO_4722 )
      ( MAKE-ON-VERIFY ?AUTO_4721 ?AUTO_4722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4730 - BLOCK
      ?AUTO_4731 - BLOCK
    )
    :vars
    (
      ?AUTO_4733 - BLOCK
      ?AUTO_4735 - BLOCK
      ?AUTO_4736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4731 ) ( ON ?AUTO_4730 ?AUTO_4733 ) ( CLEAR ?AUTO_4730 ) ( HOLDING ?AUTO_4735 ) ( CLEAR ?AUTO_4736 ) )
    :subtasks
    ( ( !STACK ?AUTO_4735 ?AUTO_4736 )
      ( MAKE-ON ?AUTO_4730 ?AUTO_4731 )
      ( MAKE-ON-VERIFY ?AUTO_4730 ?AUTO_4731 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4739 - BLOCK
      ?AUTO_4740 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4739 ) ( CLEAR ?AUTO_4740 ) )
    :subtasks
    ( ( !STACK ?AUTO_4739 ?AUTO_4740 )
      ( MAKE-ON-VERIFY ?AUTO_4739 ?AUTO_4740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4743 - BLOCK
      ?AUTO_4744 - BLOCK
    )
    :vars
    (
      ?AUTO_4748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4744 ) ( ON ?AUTO_4743 ?AUTO_4748 ) ( CLEAR ?AUTO_4743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4743 ?AUTO_4748 )
      ( MAKE-ON ?AUTO_4743 ?AUTO_4744 )
      ( MAKE-ON-VERIFY ?AUTO_4743 ?AUTO_4744 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4750 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4750 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4750 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4750 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4752 - BLOCK
    )
    :vars
    (
      ?AUTO_4755 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4752 ?AUTO_4755 ) ( CLEAR ?AUTO_4752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4752 ?AUTO_4755 )
      ( MAKE-ON-TABLE ?AUTO_4752 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4752 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4756 - BLOCK
    )
    :vars
    (
      ?AUTO_4758 - BLOCK
      ?AUTO_4759 - BLOCK
      ?AUTO_4760 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4756 ?AUTO_4758 ) ( CLEAR ?AUTO_4756 ) ( HOLDING ?AUTO_4759 ) ( CLEAR ?AUTO_4760 ) )
    :subtasks
    ( ( !STACK ?AUTO_4759 ?AUTO_4760 )
      ( MAKE-ON-TABLE ?AUTO_4756 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4756 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4761 - BLOCK
    )
    :vars
    (
      ?AUTO_4763 - BLOCK
      ?AUTO_4765 - BLOCK
      ?AUTO_4764 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4761 ?AUTO_4763 ) ( CLEAR ?AUTO_4765 ) ( ON ?AUTO_4764 ?AUTO_4761 ) ( CLEAR ?AUTO_4764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4764 ?AUTO_4761 )
      ( MAKE-ON-TABLE ?AUTO_4761 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4770 - BLOCK
      ?AUTO_4771 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4770 ) ( CLEAR ?AUTO_4771 ) )
    :subtasks
    ( ( !STACK ?AUTO_4770 ?AUTO_4771 )
      ( MAKE-ON-VERIFY ?AUTO_4770 ?AUTO_4771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4774 - BLOCK
      ?AUTO_4775 - BLOCK
    )
    :vars
    (
      ?AUTO_4779 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4775 ) ( ON ?AUTO_4774 ?AUTO_4779 ) ( CLEAR ?AUTO_4774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4774 ?AUTO_4779 )
      ( MAKE-ON ?AUTO_4774 ?AUTO_4775 )
      ( MAKE-ON-VERIFY ?AUTO_4774 ?AUTO_4775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4780 - BLOCK
      ?AUTO_4781 - BLOCK
    )
    :vars
    (
      ?AUTO_4784 - BLOCK
      ?AUTO_4785 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4781 ) ( ON ?AUTO_4780 ?AUTO_4784 ) ( CLEAR ?AUTO_4780 ) ( HOLDING ?AUTO_4785 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4785 )
      ( MAKE-ON ?AUTO_4780 ?AUTO_4781 )
      ( MAKE-ON-VERIFY ?AUTO_4780 ?AUTO_4781 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4786 - BLOCK
      ?AUTO_4787 - BLOCK
    )
    :vars
    (
      ?AUTO_4790 - BLOCK
      ?AUTO_4791 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4786 ?AUTO_4790 ) ( CLEAR ?AUTO_4786 ) ( ON ?AUTO_4791 ?AUTO_4787 ) ( CLEAR ?AUTO_4791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4791 ?AUTO_4787 )
      ( MAKE-ON ?AUTO_4786 ?AUTO_4787 )
      ( MAKE-ON-VERIFY ?AUTO_4786 ?AUTO_4787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4794 - BLOCK
      ?AUTO_4795 - BLOCK
    )
    :vars
    (
      ?AUTO_4799 - BLOCK
      ?AUTO_4796 - BLOCK
      ?AUTO_4800 - BLOCK
      ?AUTO_4801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4794 ?AUTO_4799 ) ( CLEAR ?AUTO_4794 ) ( ON ?AUTO_4796 ?AUTO_4795 ) ( CLEAR ?AUTO_4796 ) ( HOLDING ?AUTO_4800 ) ( CLEAR ?AUTO_4801 ) )
    :subtasks
    ( ( !STACK ?AUTO_4800 ?AUTO_4801 )
      ( MAKE-ON ?AUTO_4794 ?AUTO_4795 )
      ( MAKE-ON-VERIFY ?AUTO_4794 ?AUTO_4795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4802 - BLOCK
      ?AUTO_4803 - BLOCK
    )
    :vars
    (
      ?AUTO_4805 - BLOCK
      ?AUTO_4804 - BLOCK
      ?AUTO_4809 - BLOCK
      ?AUTO_4808 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4802 ?AUTO_4805 ) ( CLEAR ?AUTO_4802 ) ( ON ?AUTO_4804 ?AUTO_4803 ) ( CLEAR ?AUTO_4809 ) ( ON ?AUTO_4808 ?AUTO_4804 ) ( CLEAR ?AUTO_4808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4808 ?AUTO_4804 )
      ( MAKE-ON ?AUTO_4802 ?AUTO_4803 )
      ( MAKE-ON-VERIFY ?AUTO_4802 ?AUTO_4803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4814 - BLOCK
      ?AUTO_4815 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4814 ) ( CLEAR ?AUTO_4815 ) )
    :subtasks
    ( ( !STACK ?AUTO_4814 ?AUTO_4815 )
      ( MAKE-ON-VERIFY ?AUTO_4814 ?AUTO_4815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4818 - BLOCK
      ?AUTO_4819 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4819 ) ( ON-TABLE ?AUTO_4818 ) ( CLEAR ?AUTO_4818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4818 )
      ( MAKE-ON ?AUTO_4818 ?AUTO_4819 )
      ( MAKE-ON-VERIFY ?AUTO_4818 ?AUTO_4819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4823 - BLOCK
      ?AUTO_4824 - BLOCK
    )
    :vars
    (
      ?AUTO_4827 - BLOCK
      ?AUTO_4828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4824 ) ( ON-TABLE ?AUTO_4823 ) ( CLEAR ?AUTO_4823 ) ( HOLDING ?AUTO_4827 ) ( CLEAR ?AUTO_4828 ) )
    :subtasks
    ( ( !STACK ?AUTO_4827 ?AUTO_4828 )
      ( MAKE-ON ?AUTO_4823 ?AUTO_4824 )
      ( MAKE-ON-VERIFY ?AUTO_4823 ?AUTO_4824 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4829 - BLOCK
      ?AUTO_4830 - BLOCK
    )
    :vars
    (
      ?AUTO_4832 - BLOCK
      ?AUTO_4834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4830 ) ( ON-TABLE ?AUTO_4829 ) ( CLEAR ?AUTO_4832 ) ( ON ?AUTO_4834 ?AUTO_4829 ) ( CLEAR ?AUTO_4834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4834 ?AUTO_4829 )
      ( MAKE-ON ?AUTO_4829 ?AUTO_4830 )
      ( MAKE-ON-VERIFY ?AUTO_4829 ?AUTO_4830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4837 - BLOCK
      ?AUTO_4838 - BLOCK
    )
    :vars
    (
      ?AUTO_4841 - BLOCK
      ?AUTO_4842 - BLOCK
      ?AUTO_4843 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4838 ) ( ON-TABLE ?AUTO_4837 ) ( CLEAR ?AUTO_4841 ) ( ON ?AUTO_4842 ?AUTO_4837 ) ( CLEAR ?AUTO_4842 ) ( HOLDING ?AUTO_4843 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4843 )
      ( MAKE-ON ?AUTO_4837 ?AUTO_4838 )
      ( MAKE-ON-VERIFY ?AUTO_4837 ?AUTO_4838 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4846 - BLOCK
      ?AUTO_4847 - BLOCK
    )
    :vars
    (
      ?AUTO_4849 - BLOCK
      ?AUTO_4850 - BLOCK
      ?AUTO_4853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4846 ) ( CLEAR ?AUTO_4849 ) ( ON ?AUTO_4850 ?AUTO_4846 ) ( CLEAR ?AUTO_4850 ) ( HOLDING ?AUTO_4847 ) ( CLEAR ?AUTO_4853 ) )
    :subtasks
    ( ( !STACK ?AUTO_4847 ?AUTO_4853 )
      ( MAKE-ON ?AUTO_4846 ?AUTO_4847 )
      ( MAKE-ON-VERIFY ?AUTO_4846 ?AUTO_4847 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4857 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4857 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4857 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4857 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4859 - BLOCK
    )
    :vars
    (
      ?AUTO_4862 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4859 ?AUTO_4862 ) ( CLEAR ?AUTO_4859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4859 ?AUTO_4862 )
      ( MAKE-ON-TABLE ?AUTO_4859 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4859 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4863 - BLOCK
    )
    :vars
    (
      ?AUTO_4865 - BLOCK
      ?AUTO_4866 - BLOCK
      ?AUTO_4867 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4863 ?AUTO_4865 ) ( CLEAR ?AUTO_4863 ) ( HOLDING ?AUTO_4866 ) ( CLEAR ?AUTO_4867 ) )
    :subtasks
    ( ( !STACK ?AUTO_4866 ?AUTO_4867 )
      ( MAKE-ON-TABLE ?AUTO_4863 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4863 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4876 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4876 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4876 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4876 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4878 - BLOCK
    )
    :vars
    (
      ?AUTO_4881 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4878 ?AUTO_4881 ) ( CLEAR ?AUTO_4878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4878 ?AUTO_4881 )
      ( MAKE-ON-TABLE ?AUTO_4878 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4878 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4882 - BLOCK
    )
    :vars
    (
      ?AUTO_4884 - BLOCK
      ?AUTO_4885 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4882 ?AUTO_4884 ) ( CLEAR ?AUTO_4882 ) ( HOLDING ?AUTO_4885 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4885 )
      ( MAKE-ON-TABLE ?AUTO_4882 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4882 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4886 - BLOCK
    )
    :vars
    (
      ?AUTO_4888 - BLOCK
      ?AUTO_4889 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4886 ?AUTO_4888 ) ( ON ?AUTO_4889 ?AUTO_4886 ) ( CLEAR ?AUTO_4889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4889 ?AUTO_4886 )
      ( MAKE-ON-TABLE ?AUTO_4886 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4886 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4892 - BLOCK
    )
    :vars
    (
      ?AUTO_4893 - BLOCK
      ?AUTO_4894 - BLOCK
      ?AUTO_4896 - BLOCK
      ?AUTO_4897 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4892 ?AUTO_4893 ) ( ON ?AUTO_4894 ?AUTO_4892 ) ( CLEAR ?AUTO_4894 ) ( HOLDING ?AUTO_4896 ) ( CLEAR ?AUTO_4897 ) )
    :subtasks
    ( ( !STACK ?AUTO_4896 ?AUTO_4897 )
      ( MAKE-ON-TABLE ?AUTO_4892 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4892 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4904 - BLOCK
    )
    :vars
    (
      ?AUTO_4908 - BLOCK
      ?AUTO_4907 - BLOCK
      ?AUTO_4905 - BLOCK
      ?AUTO_4906 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4904 ?AUTO_4908 ) ( ON ?AUTO_4907 ?AUTO_4904 ) ( CLEAR ?AUTO_4905 ) ( ON ?AUTO_4906 ?AUTO_4907 ) ( CLEAR ?AUTO_4906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4906 ?AUTO_4907 )
      ( MAKE-ON-TABLE ?AUTO_4904 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4904 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4914 - BLOCK
      ?AUTO_4915 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4914 ) ( CLEAR ?AUTO_4915 ) )
    :subtasks
    ( ( !STACK ?AUTO_4914 ?AUTO_4915 )
      ( MAKE-ON-VERIFY ?AUTO_4914 ?AUTO_4915 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4918 - BLOCK
      ?AUTO_4919 - BLOCK
    )
    :vars
    (
      ?AUTO_4923 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4919 ) ( ON ?AUTO_4918 ?AUTO_4923 ) ( CLEAR ?AUTO_4918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4918 ?AUTO_4923 )
      ( MAKE-ON ?AUTO_4918 ?AUTO_4919 )
      ( MAKE-ON-VERIFY ?AUTO_4918 ?AUTO_4919 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4924 - BLOCK
      ?AUTO_4925 - BLOCK
    )
    :vars
    (
      ?AUTO_4928 - BLOCK
      ?AUTO_4929 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4925 ) ( ON ?AUTO_4924 ?AUTO_4928 ) ( CLEAR ?AUTO_4924 ) ( HOLDING ?AUTO_4929 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4929 )
      ( MAKE-ON ?AUTO_4924 ?AUTO_4925 )
      ( MAKE-ON-VERIFY ?AUTO_4924 ?AUTO_4925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4930 - BLOCK
      ?AUTO_4931 - BLOCK
    )
    :vars
    (
      ?AUTO_4934 - BLOCK
      ?AUTO_4935 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4931 ) ( ON ?AUTO_4930 ?AUTO_4934 ) ( ON ?AUTO_4935 ?AUTO_4930 ) ( CLEAR ?AUTO_4935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4935 ?AUTO_4930 )
      ( MAKE-ON ?AUTO_4930 ?AUTO_4931 )
      ( MAKE-ON-VERIFY ?AUTO_4930 ?AUTO_4931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4938 - BLOCK
      ?AUTO_4939 - BLOCK
    )
    :vars
    (
      ?AUTO_4943 - BLOCK
      ?AUTO_4940 - BLOCK
      ?AUTO_4944 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4939 ) ( ON ?AUTO_4938 ?AUTO_4943 ) ( ON ?AUTO_4940 ?AUTO_4938 ) ( CLEAR ?AUTO_4940 ) ( HOLDING ?AUTO_4944 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4944 )
      ( MAKE-ON ?AUTO_4938 ?AUTO_4939 )
      ( MAKE-ON-VERIFY ?AUTO_4938 ?AUTO_4939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4945 - BLOCK
      ?AUTO_4946 - BLOCK
    )
    :vars
    (
      ?AUTO_4950 - BLOCK
      ?AUTO_4947 - BLOCK
      ?AUTO_4951 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4946 ) ( ON ?AUTO_4945 ?AUTO_4950 ) ( ON ?AUTO_4947 ?AUTO_4945 ) ( ON ?AUTO_4951 ?AUTO_4947 ) ( CLEAR ?AUTO_4951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4951 ?AUTO_4947 )
      ( MAKE-ON ?AUTO_4945 ?AUTO_4946 )
      ( MAKE-ON-VERIFY ?AUTO_4945 ?AUTO_4946 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4954 - BLOCK
      ?AUTO_4955 - BLOCK
    )
    :vars
    (
      ?AUTO_4960 - BLOCK
      ?AUTO_4957 - BLOCK
      ?AUTO_4958 - BLOCK
      ?AUTO_4961 - BLOCK
      ?AUTO_4962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4955 ) ( ON ?AUTO_4954 ?AUTO_4960 ) ( ON ?AUTO_4957 ?AUTO_4954 ) ( ON ?AUTO_4958 ?AUTO_4957 ) ( CLEAR ?AUTO_4958 ) ( HOLDING ?AUTO_4961 ) ( CLEAR ?AUTO_4962 ) )
    :subtasks
    ( ( !STACK ?AUTO_4961 ?AUTO_4962 )
      ( MAKE-ON ?AUTO_4954 ?AUTO_4955 )
      ( MAKE-ON-VERIFY ?AUTO_4954 ?AUTO_4955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4969 - BLOCK
      ?AUTO_4970 - BLOCK
    )
    :vars
    (
      ?AUTO_4971 - BLOCK
      ?AUTO_4973 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4969 ?AUTO_4971 ) ( ON ?AUTO_4973 ?AUTO_4969 ) ( CLEAR ?AUTO_4973 ) ( HOLDING ?AUTO_4970 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4970 )
      ( MAKE-ON ?AUTO_4969 ?AUTO_4970 )
      ( MAKE-ON-VERIFY ?AUTO_4969 ?AUTO_4970 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4980 - BLOCK
      ?AUTO_4988 - BLOCK
    )
    :vars
    (
      ?AUTO_4983 - BLOCK
      ?AUTO_4986 - BLOCK
      ?AUTO_4982 - BLOCK
      ?AUTO_4987 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4980 ?AUTO_4983 ) ( ON ?AUTO_4986 ?AUTO_4980 ) ( ON ?AUTO_4988 ?AUTO_4986 ) ( CLEAR ?AUTO_4982 ) ( ON ?AUTO_4987 ?AUTO_4988 ) ( CLEAR ?AUTO_4987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4987 ?AUTO_4988 )
      ( MAKE-ON ?AUTO_4980 ?AUTO_4988 )
      ( MAKE-ON-VERIFY ?AUTO_4980 ?AUTO_4988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4993 - BLOCK
      ?AUTO_4994 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4993 ) ( CLEAR ?AUTO_4994 ) )
    :subtasks
    ( ( !STACK ?AUTO_4993 ?AUTO_4994 )
      ( MAKE-ON-VERIFY ?AUTO_4993 ?AUTO_4994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4997 - BLOCK
      ?AUTO_4998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4998 ) ( ON-TABLE ?AUTO_4997 ) ( CLEAR ?AUTO_4997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4997 )
      ( MAKE-ON ?AUTO_4997 ?AUTO_4998 )
      ( MAKE-ON-VERIFY ?AUTO_4997 ?AUTO_4998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5002 - BLOCK
      ?AUTO_5003 - BLOCK
    )
    :vars
    (
      ?AUTO_5006 - BLOCK
      ?AUTO_5007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5003 ) ( ON-TABLE ?AUTO_5002 ) ( CLEAR ?AUTO_5002 ) ( HOLDING ?AUTO_5006 ) ( CLEAR ?AUTO_5007 ) )
    :subtasks
    ( ( !STACK ?AUTO_5006 ?AUTO_5007 )
      ( MAKE-ON ?AUTO_5002 ?AUTO_5003 )
      ( MAKE-ON-VERIFY ?AUTO_5002 ?AUTO_5003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5010 - BLOCK
      ?AUTO_5011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5010 ) ( CLEAR ?AUTO_5010 ) ( HOLDING ?AUTO_5011 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5011 )
      ( MAKE-ON ?AUTO_5010 ?AUTO_5011 )
      ( MAKE-ON-VERIFY ?AUTO_5010 ?AUTO_5011 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5055 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5055 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5055 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5055 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5057 - BLOCK
    )
    :vars
    (
      ?AUTO_5060 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5057 ?AUTO_5060 ) ( CLEAR ?AUTO_5057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5057 ?AUTO_5060 )
      ( MAKE-ON-TABLE ?AUTO_5057 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5057 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5061 - BLOCK
    )
    :vars
    (
      ?AUTO_5063 - BLOCK
      ?AUTO_5064 - BLOCK
      ?AUTO_5065 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5061 ?AUTO_5063 ) ( CLEAR ?AUTO_5061 ) ( HOLDING ?AUTO_5064 ) ( CLEAR ?AUTO_5065 ) )
    :subtasks
    ( ( !STACK ?AUTO_5064 ?AUTO_5065 )
      ( MAKE-ON-TABLE ?AUTO_5061 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5061 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5070 - BLOCK
    )
    :vars
    (
      ?AUTO_5072 - BLOCK
      ?AUTO_5074 - BLOCK
      ?AUTO_5071 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5070 ?AUTO_5072 ) ( CLEAR ?AUTO_5074 ) ( ON ?AUTO_5071 ?AUTO_5070 ) ( CLEAR ?AUTO_5071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5071 ?AUTO_5070 )
      ( MAKE-ON-TABLE ?AUTO_5070 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5070 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5077 - BLOCK
    )
    :vars
    (
      ?AUTO_5079 - BLOCK
      ?AUTO_5081 - BLOCK
      ?AUTO_5080 - BLOCK
      ?AUTO_5082 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5077 ?AUTO_5079 ) ( CLEAR ?AUTO_5081 ) ( ON ?AUTO_5080 ?AUTO_5077 ) ( CLEAR ?AUTO_5080 ) ( HOLDING ?AUTO_5082 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5082 )
      ( MAKE-ON-TABLE ?AUTO_5077 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5077 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5083 - BLOCK
    )
    :vars
    (
      ?AUTO_5084 - BLOCK
      ?AUTO_5087 - BLOCK
      ?AUTO_5088 - BLOCK
      ?AUTO_5086 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5083 ?AUTO_5084 ) ( CLEAR ?AUTO_5087 ) ( ON ?AUTO_5088 ?AUTO_5083 ) ( ON ?AUTO_5086 ?AUTO_5088 ) ( CLEAR ?AUTO_5086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5086 ?AUTO_5088 )
      ( MAKE-ON-TABLE ?AUTO_5083 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5083 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5091 - BLOCK
    )
    :vars
    (
      ?AUTO_5094 - BLOCK
      ?AUTO_5092 - BLOCK
      ?AUTO_5095 - BLOCK
      ?AUTO_5093 - BLOCK
      ?AUTO_5097 - BLOCK
      ?AUTO_5098 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5091 ?AUTO_5094 ) ( CLEAR ?AUTO_5092 ) ( ON ?AUTO_5095 ?AUTO_5091 ) ( ON ?AUTO_5093 ?AUTO_5095 ) ( CLEAR ?AUTO_5093 ) ( HOLDING ?AUTO_5097 ) ( CLEAR ?AUTO_5098 ) )
    :subtasks
    ( ( !STACK ?AUTO_5097 ?AUTO_5098 )
      ( MAKE-ON-TABLE ?AUTO_5091 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5091 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5105 - BLOCK
    )
    :vars
    (
      ?AUTO_5109 - BLOCK
      ?AUTO_5112 - BLOCK
      ?AUTO_5106 - BLOCK
      ?AUTO_5110 - BLOCK
      ?AUTO_5111 - BLOCK
      ?AUTO_5108 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5105 ?AUTO_5109 ) ( CLEAR ?AUTO_5112 ) ( ON ?AUTO_5106 ?AUTO_5105 ) ( ON ?AUTO_5110 ?AUTO_5106 ) ( CLEAR ?AUTO_5111 ) ( ON ?AUTO_5108 ?AUTO_5110 ) ( CLEAR ?AUTO_5108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5108 ?AUTO_5110 )
      ( MAKE-ON-TABLE ?AUTO_5105 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5117 - BLOCK
      ?AUTO_5118 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5117 ) ( CLEAR ?AUTO_5118 ) )
    :subtasks
    ( ( !STACK ?AUTO_5117 ?AUTO_5118 )
      ( MAKE-ON-VERIFY ?AUTO_5117 ?AUTO_5118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5121 - BLOCK
      ?AUTO_5122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5122 ) ( ON-TABLE ?AUTO_5121 ) ( CLEAR ?AUTO_5121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5121 )
      ( MAKE-ON ?AUTO_5121 ?AUTO_5122 )
      ( MAKE-ON-VERIFY ?AUTO_5121 ?AUTO_5122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5126 - BLOCK
      ?AUTO_5127 - BLOCK
    )
    :vars
    (
      ?AUTO_5130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5127 ) ( ON-TABLE ?AUTO_5126 ) ( CLEAR ?AUTO_5126 ) ( HOLDING ?AUTO_5130 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5130 )
      ( MAKE-ON ?AUTO_5126 ?AUTO_5127 )
      ( MAKE-ON-VERIFY ?AUTO_5126 ?AUTO_5127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5131 - BLOCK
      ?AUTO_5132 - BLOCK
    )
    :vars
    (
      ?AUTO_5135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5132 ) ( ON-TABLE ?AUTO_5131 ) ( ON ?AUTO_5135 ?AUTO_5131 ) ( CLEAR ?AUTO_5135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5135 ?AUTO_5131 )
      ( MAKE-ON ?AUTO_5131 ?AUTO_5132 )
      ( MAKE-ON-VERIFY ?AUTO_5131 ?AUTO_5132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5138 - BLOCK
      ?AUTO_5139 - BLOCK
    )
    :vars
    (
      ?AUTO_5141 - BLOCK
      ?AUTO_5143 - BLOCK
      ?AUTO_5144 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5139 ) ( ON-TABLE ?AUTO_5138 ) ( ON ?AUTO_5141 ?AUTO_5138 ) ( CLEAR ?AUTO_5141 ) ( HOLDING ?AUTO_5143 ) ( CLEAR ?AUTO_5144 ) )
    :subtasks
    ( ( !STACK ?AUTO_5143 ?AUTO_5144 )
      ( MAKE-ON ?AUTO_5138 ?AUTO_5139 )
      ( MAKE-ON-VERIFY ?AUTO_5138 ?AUTO_5139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5149 - BLOCK
      ?AUTO_5150 - BLOCK
    )
    :vars
    (
      ?AUTO_5151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5149 ) ( CLEAR ?AUTO_5149 ) ( ON ?AUTO_5151 ?AUTO_5150 ) ( CLEAR ?AUTO_5151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5151 ?AUTO_5150 )
      ( MAKE-ON ?AUTO_5149 ?AUTO_5150 )
      ( MAKE-ON-VERIFY ?AUTO_5149 ?AUTO_5150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5156 - BLOCK
      ?AUTO_5157 - BLOCK
    )
    :vars
    (
      ?AUTO_5160 - BLOCK
      ?AUTO_5161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5156 ) ( CLEAR ?AUTO_5156 ) ( ON ?AUTO_5160 ?AUTO_5157 ) ( CLEAR ?AUTO_5160 ) ( HOLDING ?AUTO_5161 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5161 )
      ( MAKE-ON ?AUTO_5156 ?AUTO_5157 )
      ( MAKE-ON-VERIFY ?AUTO_5156 ?AUTO_5157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5162 - BLOCK
      ?AUTO_5163 - BLOCK
    )
    :vars
    (
      ?AUTO_5166 - BLOCK
      ?AUTO_5167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5162 ) ( CLEAR ?AUTO_5162 ) ( ON ?AUTO_5166 ?AUTO_5163 ) ( ON ?AUTO_5167 ?AUTO_5166 ) ( CLEAR ?AUTO_5167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5167 ?AUTO_5166 )
      ( MAKE-ON ?AUTO_5162 ?AUTO_5163 )
      ( MAKE-ON-VERIFY ?AUTO_5162 ?AUTO_5163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5170 - BLOCK
      ?AUTO_5171 - BLOCK
    )
    :vars
    (
      ?AUTO_5172 - BLOCK
      ?AUTO_5175 - BLOCK
      ?AUTO_5176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5170 ) ( CLEAR ?AUTO_5170 ) ( ON ?AUTO_5172 ?AUTO_5171 ) ( ON ?AUTO_5175 ?AUTO_5172 ) ( CLEAR ?AUTO_5175 ) ( HOLDING ?AUTO_5176 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5176 )
      ( MAKE-ON ?AUTO_5170 ?AUTO_5171 )
      ( MAKE-ON-VERIFY ?AUTO_5170 ?AUTO_5171 ) )
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
      ?AUTO_5182 - BLOCK
      ?AUTO_5183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5177 ) ( CLEAR ?AUTO_5177 ) ( ON ?AUTO_5179 ?AUTO_5178 ) ( ON ?AUTO_5182 ?AUTO_5179 ) ( ON ?AUTO_5183 ?AUTO_5182 ) ( CLEAR ?AUTO_5183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5183 ?AUTO_5182 )
      ( MAKE-ON ?AUTO_5177 ?AUTO_5178 )
      ( MAKE-ON-VERIFY ?AUTO_5177 ?AUTO_5178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5186 - BLOCK
      ?AUTO_5187 - BLOCK
    )
    :vars
    (
      ?AUTO_5190 - BLOCK
      ?AUTO_5191 - BLOCK
      ?AUTO_5188 - BLOCK
      ?AUTO_5193 - BLOCK
      ?AUTO_5194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5186 ) ( CLEAR ?AUTO_5186 ) ( ON ?AUTO_5190 ?AUTO_5187 ) ( ON ?AUTO_5191 ?AUTO_5190 ) ( ON ?AUTO_5188 ?AUTO_5191 ) ( CLEAR ?AUTO_5188 ) ( HOLDING ?AUTO_5193 ) ( CLEAR ?AUTO_5194 ) )
    :subtasks
    ( ( !STACK ?AUTO_5193 ?AUTO_5194 )
      ( MAKE-ON ?AUTO_5186 ?AUTO_5187 )
      ( MAKE-ON-VERIFY ?AUTO_5186 ?AUTO_5187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5201 - BLOCK
      ?AUTO_5202 - BLOCK
    )
    :vars
    (
      ?AUTO_5203 - BLOCK
      ?AUTO_5205 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5203 ?AUTO_5202 ) ( ON ?AUTO_5205 ?AUTO_5203 ) ( CLEAR ?AUTO_5205 ) ( HOLDING ?AUTO_5201 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5201 )
      ( MAKE-ON ?AUTO_5201 ?AUTO_5202 )
      ( MAKE-ON-VERIFY ?AUTO_5201 ?AUTO_5202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5208 - BLOCK
      ?AUTO_5209 - BLOCK
    )
    :vars
    (
      ?AUTO_5212 - BLOCK
      ?AUTO_5213 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5212 ?AUTO_5209 ) ( ON ?AUTO_5213 ?AUTO_5212 ) ( ON ?AUTO_5208 ?AUTO_5213 ) ( CLEAR ?AUTO_5208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5208 ?AUTO_5213 )
      ( MAKE-ON ?AUTO_5208 ?AUTO_5209 )
      ( MAKE-ON-VERIFY ?AUTO_5208 ?AUTO_5209 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5216 - BLOCK
      ?AUTO_5217 - BLOCK
    )
    :vars
    (
      ?AUTO_5220 - BLOCK
      ?AUTO_5221 - BLOCK
      ?AUTO_5222 - BLOCK
      ?AUTO_5223 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5220 ?AUTO_5217 ) ( ON ?AUTO_5221 ?AUTO_5220 ) ( ON ?AUTO_5216 ?AUTO_5221 ) ( CLEAR ?AUTO_5216 ) ( HOLDING ?AUTO_5222 ) ( CLEAR ?AUTO_5223 ) )
    :subtasks
    ( ( !STACK ?AUTO_5222 ?AUTO_5223 )
      ( MAKE-ON ?AUTO_5216 ?AUTO_5217 )
      ( MAKE-ON-VERIFY ?AUTO_5216 ?AUTO_5217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5224 - BLOCK
      ?AUTO_5225 - BLOCK
    )
    :vars
    (
      ?AUTO_5226 - BLOCK
      ?AUTO_5229 - BLOCK
      ?AUTO_5231 - BLOCK
      ?AUTO_5230 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5226 ?AUTO_5225 ) ( ON ?AUTO_5229 ?AUTO_5226 ) ( ON ?AUTO_5224 ?AUTO_5229 ) ( CLEAR ?AUTO_5231 ) ( ON ?AUTO_5230 ?AUTO_5224 ) ( CLEAR ?AUTO_5230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5230 ?AUTO_5224 )
      ( MAKE-ON ?AUTO_5224 ?AUTO_5225 )
      ( MAKE-ON-VERIFY ?AUTO_5224 ?AUTO_5225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5236 - BLOCK
      ?AUTO_5237 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5236 ) ( CLEAR ?AUTO_5237 ) )
    :subtasks
    ( ( !STACK ?AUTO_5236 ?AUTO_5237 )
      ( MAKE-ON-VERIFY ?AUTO_5236 ?AUTO_5237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5240 - BLOCK
      ?AUTO_5241 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5241 ) ( ON-TABLE ?AUTO_5240 ) ( CLEAR ?AUTO_5240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5240 )
      ( MAKE-ON ?AUTO_5240 ?AUTO_5241 )
      ( MAKE-ON-VERIFY ?AUTO_5240 ?AUTO_5241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5245 - BLOCK
      ?AUTO_5246 - BLOCK
    )
    :vars
    (
      ?AUTO_5250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5245 ) ( CLEAR ?AUTO_5245 ) ( HOLDING ?AUTO_5246 ) ( CLEAR ?AUTO_5250 ) )
    :subtasks
    ( ( !STACK ?AUTO_5246 ?AUTO_5250 )
      ( MAKE-ON ?AUTO_5245 ?AUTO_5246 )
      ( MAKE-ON-VERIFY ?AUTO_5245 ?AUTO_5246 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5307 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5307 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5307 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5307 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5309 - BLOCK
    )
    :vars
    (
      ?AUTO_5312 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5309 ?AUTO_5312 ) ( CLEAR ?AUTO_5309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5309 ?AUTO_5312 )
      ( MAKE-ON-TABLE ?AUTO_5309 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5309 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5313 - BLOCK
    )
    :vars
    (
      ?AUTO_5315 - BLOCK
      ?AUTO_5316 - BLOCK
      ?AUTO_5317 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5313 ?AUTO_5315 ) ( CLEAR ?AUTO_5313 ) ( HOLDING ?AUTO_5316 ) ( CLEAR ?AUTO_5317 ) )
    :subtasks
    ( ( !STACK ?AUTO_5316 ?AUTO_5317 )
      ( MAKE-ON-TABLE ?AUTO_5313 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5369 - BLOCK
      ?AUTO_5370 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5369 ) ( CLEAR ?AUTO_5370 ) )
    :subtasks
    ( ( !STACK ?AUTO_5369 ?AUTO_5370 )
      ( MAKE-ON-VERIFY ?AUTO_5369 ?AUTO_5370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5373 - BLOCK
      ?AUTO_5374 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5374 ) ( ON-TABLE ?AUTO_5373 ) ( CLEAR ?AUTO_5373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5373 )
      ( MAKE-ON ?AUTO_5373 ?AUTO_5374 )
      ( MAKE-ON-VERIFY ?AUTO_5373 ?AUTO_5374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5378 - BLOCK
      ?AUTO_5379 - BLOCK
    )
    :vars
    (
      ?AUTO_5382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5379 ) ( ON-TABLE ?AUTO_5378 ) ( CLEAR ?AUTO_5378 ) ( HOLDING ?AUTO_5382 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5382 )
      ( MAKE-ON ?AUTO_5378 ?AUTO_5379 )
      ( MAKE-ON-VERIFY ?AUTO_5378 ?AUTO_5379 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5383 - BLOCK
      ?AUTO_5384 - BLOCK
    )
    :vars
    (
      ?AUTO_5387 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5384 ) ( ON-TABLE ?AUTO_5383 ) ( ON ?AUTO_5387 ?AUTO_5383 ) ( CLEAR ?AUTO_5387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5387 ?AUTO_5383 )
      ( MAKE-ON ?AUTO_5383 ?AUTO_5384 )
      ( MAKE-ON-VERIFY ?AUTO_5383 ?AUTO_5384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5390 - BLOCK
      ?AUTO_5391 - BLOCK
    )
    :vars
    (
      ?AUTO_5393 - BLOCK
      ?AUTO_5396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5390 ) ( ON ?AUTO_5393 ?AUTO_5390 ) ( CLEAR ?AUTO_5393 ) ( HOLDING ?AUTO_5391 ) ( CLEAR ?AUTO_5396 ) )
    :subtasks
    ( ( !STACK ?AUTO_5391 ?AUTO_5396 )
      ( MAKE-ON ?AUTO_5390 ?AUTO_5391 )
      ( MAKE-ON-VERIFY ?AUTO_5390 ?AUTO_5391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5399 - BLOCK
      ?AUTO_5400 - BLOCK
    )
    :vars
    (
      ?AUTO_5401 - BLOCK
      ?AUTO_5404 - BLOCK
      ?AUTO_5405 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5400 ) ( ON-TABLE ?AUTO_5399 ) ( ON ?AUTO_5401 ?AUTO_5399 ) ( CLEAR ?AUTO_5401 ) ( HOLDING ?AUTO_5404 ) ( CLEAR ?AUTO_5405 ) )
    :subtasks
    ( ( !STACK ?AUTO_5404 ?AUTO_5405 )
      ( MAKE-ON ?AUTO_5399 ?AUTO_5400 )
      ( MAKE-ON-VERIFY ?AUTO_5399 ?AUTO_5400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5571 - BLOCK
      ?AUTO_5572 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5571 ) ( CLEAR ?AUTO_5572 ) )
    :subtasks
    ( ( !STACK ?AUTO_5571 ?AUTO_5572 )
      ( MAKE-ON-VERIFY ?AUTO_5571 ?AUTO_5572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5575 - BLOCK
      ?AUTO_5576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5576 ) ( ON-TABLE ?AUTO_5575 ) ( CLEAR ?AUTO_5575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5575 )
      ( MAKE-ON ?AUTO_5575 ?AUTO_5576 )
      ( MAKE-ON-VERIFY ?AUTO_5575 ?AUTO_5576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5580 - BLOCK
      ?AUTO_5581 - BLOCK
    )
    :vars
    (
      ?AUTO_5585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5580 ) ( CLEAR ?AUTO_5580 ) ( HOLDING ?AUTO_5581 ) ( CLEAR ?AUTO_5585 ) )
    :subtasks
    ( ( !STACK ?AUTO_5581 ?AUTO_5585 )
      ( MAKE-ON ?AUTO_5580 ?AUTO_5581 )
      ( MAKE-ON-VERIFY ?AUTO_5580 ?AUTO_5581 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5587 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5587 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5587 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5587 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5589 - BLOCK
    )
    :vars
    (
      ?AUTO_5592 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5589 ?AUTO_5592 ) ( CLEAR ?AUTO_5589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5589 ?AUTO_5592 )
      ( MAKE-ON-TABLE ?AUTO_5589 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5595 - BLOCK
      ?AUTO_5596 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5595 ) ( CLEAR ?AUTO_5596 ) )
    :subtasks
    ( ( !STACK ?AUTO_5595 ?AUTO_5596 )
      ( MAKE-ON-VERIFY ?AUTO_5595 ?AUTO_5596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5599 - BLOCK
      ?AUTO_5600 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5600 ) ( ON-TABLE ?AUTO_5599 ) ( CLEAR ?AUTO_5599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5599 )
      ( MAKE-ON ?AUTO_5599 ?AUTO_5600 )
      ( MAKE-ON-VERIFY ?AUTO_5599 ?AUTO_5600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5604 - BLOCK
      ?AUTO_5605 - BLOCK
    )
    :vars
    (
      ?AUTO_5608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5605 ) ( ON-TABLE ?AUTO_5604 ) ( CLEAR ?AUTO_5604 ) ( HOLDING ?AUTO_5608 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5608 )
      ( MAKE-ON ?AUTO_5604 ?AUTO_5605 )
      ( MAKE-ON-VERIFY ?AUTO_5604 ?AUTO_5605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5609 - BLOCK
      ?AUTO_5610 - BLOCK
    )
    :vars
    (
      ?AUTO_5613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5609 ) ( CLEAR ?AUTO_5609 ) ( ON ?AUTO_5613 ?AUTO_5610 ) ( CLEAR ?AUTO_5613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5613 ?AUTO_5610 )
      ( MAKE-ON ?AUTO_5609 ?AUTO_5610 )
      ( MAKE-ON-VERIFY ?AUTO_5609 ?AUTO_5610 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5617 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5617 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5617 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5617 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5619 - BLOCK
    )
    :vars
    (
      ?AUTO_5622 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5619 ?AUTO_5622 ) ( CLEAR ?AUTO_5619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5619 ?AUTO_5622 )
      ( MAKE-ON-TABLE ?AUTO_5619 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5619 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5623 - BLOCK
    )
    :vars
    (
      ?AUTO_5625 - BLOCK
      ?AUTO_5626 - BLOCK
      ?AUTO_5627 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5623 ?AUTO_5625 ) ( CLEAR ?AUTO_5623 ) ( HOLDING ?AUTO_5626 ) ( CLEAR ?AUTO_5627 ) )
    :subtasks
    ( ( !STACK ?AUTO_5626 ?AUTO_5627 )
      ( MAKE-ON-TABLE ?AUTO_5623 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5633 - BLOCK
      ?AUTO_5634 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5633 ) ( CLEAR ?AUTO_5634 ) )
    :subtasks
    ( ( !STACK ?AUTO_5633 ?AUTO_5634 )
      ( MAKE-ON-VERIFY ?AUTO_5633 ?AUTO_5634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5637 - BLOCK
      ?AUTO_5638 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5638 ) ( ON-TABLE ?AUTO_5637 ) ( CLEAR ?AUTO_5637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5637 )
      ( MAKE-ON ?AUTO_5637 ?AUTO_5638 )
      ( MAKE-ON-VERIFY ?AUTO_5637 ?AUTO_5638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5642 - BLOCK
      ?AUTO_5643 - BLOCK
    )
    :vars
    (
      ?AUTO_5646 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5643 ) ( ON-TABLE ?AUTO_5642 ) ( CLEAR ?AUTO_5642 ) ( HOLDING ?AUTO_5646 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5646 )
      ( MAKE-ON ?AUTO_5642 ?AUTO_5643 )
      ( MAKE-ON-VERIFY ?AUTO_5642 ?AUTO_5643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5647 - BLOCK
      ?AUTO_5648 - BLOCK
    )
    :vars
    (
      ?AUTO_5651 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5648 ) ( ON-TABLE ?AUTO_5647 ) ( ON ?AUTO_5651 ?AUTO_5647 ) ( CLEAR ?AUTO_5651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5651 ?AUTO_5647 )
      ( MAKE-ON ?AUTO_5647 ?AUTO_5648 )
      ( MAKE-ON-VERIFY ?AUTO_5647 ?AUTO_5648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5654 - BLOCK
      ?AUTO_5655 - BLOCK
    )
    :vars
    (
      ?AUTO_5658 - BLOCK
      ?AUTO_5660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5654 ) ( ON ?AUTO_5658 ?AUTO_5654 ) ( CLEAR ?AUTO_5658 ) ( HOLDING ?AUTO_5655 ) ( CLEAR ?AUTO_5660 ) )
    :subtasks
    ( ( !STACK ?AUTO_5655 ?AUTO_5660 )
      ( MAKE-ON ?AUTO_5654 ?AUTO_5655 )
      ( MAKE-ON-VERIFY ?AUTO_5654 ?AUTO_5655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5663 - BLOCK
      ?AUTO_5664 - BLOCK
    )
    :vars
    (
      ?AUTO_5667 - BLOCK
      ?AUTO_5668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5664 ) ( ON-TABLE ?AUTO_5663 ) ( ON ?AUTO_5667 ?AUTO_5663 ) ( CLEAR ?AUTO_5667 ) ( HOLDING ?AUTO_5668 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5668 )
      ( MAKE-ON ?AUTO_5663 ?AUTO_5664 )
      ( MAKE-ON-VERIFY ?AUTO_5663 ?AUTO_5664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5673 - BLOCK
      ?AUTO_5674 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5673 ) ( CLEAR ?AUTO_5674 ) )
    :subtasks
    ( ( !STACK ?AUTO_5673 ?AUTO_5674 )
      ( MAKE-ON-VERIFY ?AUTO_5673 ?AUTO_5674 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5677 - BLOCK
      ?AUTO_5678 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5678 ) ( ON-TABLE ?AUTO_5677 ) ( CLEAR ?AUTO_5677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5677 )
      ( MAKE-ON ?AUTO_5677 ?AUTO_5678 )
      ( MAKE-ON-VERIFY ?AUTO_5677 ?AUTO_5678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5682 - BLOCK
      ?AUTO_5683 - BLOCK
    )
    :vars
    (
      ?AUTO_5687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5682 ) ( CLEAR ?AUTO_5682 ) ( HOLDING ?AUTO_5683 ) ( CLEAR ?AUTO_5687 ) )
    :subtasks
    ( ( !STACK ?AUTO_5683 ?AUTO_5687 )
      ( MAKE-ON ?AUTO_5682 ?AUTO_5683 )
      ( MAKE-ON-VERIFY ?AUTO_5682 ?AUTO_5683 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5689 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5689 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5689 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5689 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5691 - BLOCK
    )
    :vars
    (
      ?AUTO_5694 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5691 ?AUTO_5694 ) ( CLEAR ?AUTO_5691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5691 ?AUTO_5694 )
      ( MAKE-ON-TABLE ?AUTO_5691 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5697 - BLOCK
      ?AUTO_5698 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5697 ) ( CLEAR ?AUTO_5698 ) )
    :subtasks
    ( ( !STACK ?AUTO_5697 ?AUTO_5698 )
      ( MAKE-ON-VERIFY ?AUTO_5697 ?AUTO_5698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5701 - BLOCK
      ?AUTO_5702 - BLOCK
    )
    :vars
    (
      ?AUTO_5706 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5702 ) ( ON ?AUTO_5701 ?AUTO_5706 ) ( CLEAR ?AUTO_5701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5701 ?AUTO_5706 )
      ( MAKE-ON ?AUTO_5701 ?AUTO_5702 )
      ( MAKE-ON-VERIFY ?AUTO_5701 ?AUTO_5702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5707 - BLOCK
      ?AUTO_5708 - BLOCK
    )
    :vars
    (
      ?AUTO_5711 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5707 ?AUTO_5711 ) ( CLEAR ?AUTO_5707 ) ( HOLDING ?AUTO_5708 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5708 )
      ( MAKE-ON ?AUTO_5707 ?AUTO_5708 )
      ( MAKE-ON-VERIFY ?AUTO_5707 ?AUTO_5708 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5716 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5716 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5716 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5716 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5718 - BLOCK
    )
    :vars
    (
      ?AUTO_5721 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5718 ?AUTO_5721 ) ( CLEAR ?AUTO_5718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5718 ?AUTO_5721 )
      ( MAKE-ON-TABLE ?AUTO_5718 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5718 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5722 - BLOCK
    )
    :vars
    (
      ?AUTO_5724 - BLOCK
      ?AUTO_5725 - BLOCK
      ?AUTO_5726 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5722 ?AUTO_5724 ) ( CLEAR ?AUTO_5722 ) ( HOLDING ?AUTO_5725 ) ( CLEAR ?AUTO_5726 ) )
    :subtasks
    ( ( !STACK ?AUTO_5725 ?AUTO_5726 )
      ( MAKE-ON-TABLE ?AUTO_5722 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5722 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5727 - BLOCK
    )
    :vars
    (
      ?AUTO_5729 - BLOCK
      ?AUTO_5731 - BLOCK
      ?AUTO_5730 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5727 ?AUTO_5729 ) ( CLEAR ?AUTO_5731 ) ( ON ?AUTO_5730 ?AUTO_5727 ) ( CLEAR ?AUTO_5730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5730 ?AUTO_5727 )
      ( MAKE-ON-TABLE ?AUTO_5727 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5727 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5734 - BLOCK
    )
    :vars
    (
      ?AUTO_5737 - BLOCK
      ?AUTO_5738 - BLOCK
      ?AUTO_5735 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5734 ?AUTO_5737 ) ( ON ?AUTO_5738 ?AUTO_5734 ) ( CLEAR ?AUTO_5738 ) ( HOLDING ?AUTO_5735 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5735 )
      ( MAKE-ON-TABLE ?AUTO_5734 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5743 - BLOCK
      ?AUTO_5744 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5743 ) ( CLEAR ?AUTO_5744 ) )
    :subtasks
    ( ( !STACK ?AUTO_5743 ?AUTO_5744 )
      ( MAKE-ON-VERIFY ?AUTO_5743 ?AUTO_5744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5747 - BLOCK
      ?AUTO_5748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5748 ) ( ON-TABLE ?AUTO_5747 ) ( CLEAR ?AUTO_5747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5747 )
      ( MAKE-ON ?AUTO_5747 ?AUTO_5748 )
      ( MAKE-ON-VERIFY ?AUTO_5747 ?AUTO_5748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5752 - BLOCK
      ?AUTO_5753 - BLOCK
    )
    :vars
    (
      ?AUTO_5756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5753 ) ( ON-TABLE ?AUTO_5752 ) ( CLEAR ?AUTO_5752 ) ( HOLDING ?AUTO_5756 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5756 )
      ( MAKE-ON ?AUTO_5752 ?AUTO_5753 )
      ( MAKE-ON-VERIFY ?AUTO_5752 ?AUTO_5753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5757 - BLOCK
      ?AUTO_5758 - BLOCK
    )
    :vars
    (
      ?AUTO_5761 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5758 ) ( ON-TABLE ?AUTO_5757 ) ( ON ?AUTO_5761 ?AUTO_5757 ) ( CLEAR ?AUTO_5761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5761 ?AUTO_5757 )
      ( MAKE-ON ?AUTO_5757 ?AUTO_5758 )
      ( MAKE-ON-VERIFY ?AUTO_5757 ?AUTO_5758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5764 - BLOCK
      ?AUTO_5765 - BLOCK
    )
    :vars
    (
      ?AUTO_5768 - BLOCK
      ?AUTO_5769 - BLOCK
      ?AUTO_5770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5765 ) ( ON-TABLE ?AUTO_5764 ) ( ON ?AUTO_5768 ?AUTO_5764 ) ( CLEAR ?AUTO_5768 ) ( HOLDING ?AUTO_5769 ) ( CLEAR ?AUTO_5770 ) )
    :subtasks
    ( ( !STACK ?AUTO_5769 ?AUTO_5770 )
      ( MAKE-ON ?AUTO_5764 ?AUTO_5765 )
      ( MAKE-ON-VERIFY ?AUTO_5764 ?AUTO_5765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5771 - BLOCK
      ?AUTO_5772 - BLOCK
    )
    :vars
    (
      ?AUTO_5773 - BLOCK
      ?AUTO_5777 - BLOCK
      ?AUTO_5776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5772 ) ( ON-TABLE ?AUTO_5771 ) ( ON ?AUTO_5773 ?AUTO_5771 ) ( CLEAR ?AUTO_5777 ) ( ON ?AUTO_5776 ?AUTO_5773 ) ( CLEAR ?AUTO_5776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5776 ?AUTO_5773 )
      ( MAKE-ON ?AUTO_5771 ?AUTO_5772 )
      ( MAKE-ON-VERIFY ?AUTO_5771 ?AUTO_5772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5780 - BLOCK
      ?AUTO_5781 - BLOCK
    )
    :vars
    (
      ?AUTO_5783 - BLOCK
      ?AUTO_5782 - BLOCK
      ?AUTO_5786 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5781 ) ( ON-TABLE ?AUTO_5780 ) ( ON ?AUTO_5783 ?AUTO_5780 ) ( ON ?AUTO_5782 ?AUTO_5783 ) ( CLEAR ?AUTO_5782 ) ( HOLDING ?AUTO_5786 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5786 )
      ( MAKE-ON ?AUTO_5780 ?AUTO_5781 )
      ( MAKE-ON-VERIFY ?AUTO_5780 ?AUTO_5781 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5788 - BLOCK
      ?AUTO_5789 - BLOCK
    )
    :vars
    (
      ?AUTO_5790 - BLOCK
      ?AUTO_5791 - BLOCK
      ?AUTO_5794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5788 ) ( ON ?AUTO_5790 ?AUTO_5788 ) ( ON ?AUTO_5791 ?AUTO_5790 ) ( CLEAR ?AUTO_5791 ) ( ON ?AUTO_5794 ?AUTO_5789 ) ( CLEAR ?AUTO_5794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5794 ?AUTO_5789 )
      ( MAKE-ON ?AUTO_5788 ?AUTO_5789 )
      ( MAKE-ON-VERIFY ?AUTO_5788 ?AUTO_5789 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5796 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5796 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5796 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5796 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5798 - BLOCK
    )
    :vars
    (
      ?AUTO_5801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5798 ?AUTO_5801 ) ( CLEAR ?AUTO_5798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5798 ?AUTO_5801 )
      ( MAKE-ON-TABLE ?AUTO_5798 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5798 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5803 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5803 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5803 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5803 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5805 - BLOCK
    )
    :vars
    (
      ?AUTO_5808 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5805 ?AUTO_5808 ) ( CLEAR ?AUTO_5805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5805 ?AUTO_5808 )
      ( MAKE-ON-TABLE ?AUTO_5805 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5805 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5809 - BLOCK
    )
    :vars
    (
      ?AUTO_5811 - BLOCK
      ?AUTO_5812 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5809 ?AUTO_5811 ) ( CLEAR ?AUTO_5809 ) ( HOLDING ?AUTO_5812 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5812 )
      ( MAKE-ON-TABLE ?AUTO_5809 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5809 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5813 - BLOCK
    )
    :vars
    (
      ?AUTO_5815 - BLOCK
      ?AUTO_5816 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5813 ?AUTO_5815 ) ( ON ?AUTO_5816 ?AUTO_5813 ) ( CLEAR ?AUTO_5816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5816 ?AUTO_5813 )
      ( MAKE-ON-TABLE ?AUTO_5813 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5821 - BLOCK
      ?AUTO_5822 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5821 ) ( CLEAR ?AUTO_5822 ) )
    :subtasks
    ( ( !STACK ?AUTO_5821 ?AUTO_5822 )
      ( MAKE-ON-VERIFY ?AUTO_5821 ?AUTO_5822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5825 - BLOCK
      ?AUTO_5826 - BLOCK
    )
    :vars
    (
      ?AUTO_5830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5826 ) ( ON ?AUTO_5825 ?AUTO_5830 ) ( CLEAR ?AUTO_5825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5825 ?AUTO_5830 )
      ( MAKE-ON ?AUTO_5825 ?AUTO_5826 )
      ( MAKE-ON-VERIFY ?AUTO_5825 ?AUTO_5826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5831 - BLOCK
      ?AUTO_5832 - BLOCK
    )
    :vars
    (
      ?AUTO_5835 - BLOCK
      ?AUTO_5836 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5832 ) ( ON ?AUTO_5831 ?AUTO_5835 ) ( CLEAR ?AUTO_5831 ) ( HOLDING ?AUTO_5836 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5836 )
      ( MAKE-ON ?AUTO_5831 ?AUTO_5832 )
      ( MAKE-ON-VERIFY ?AUTO_5831 ?AUTO_5832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5839 - BLOCK
      ?AUTO_5840 - BLOCK
    )
    :vars
    (
      ?AUTO_5843 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5839 ?AUTO_5843 ) ( CLEAR ?AUTO_5839 ) ( HOLDING ?AUTO_5840 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5840 )
      ( MAKE-ON ?AUTO_5839 ?AUTO_5840 )
      ( MAKE-ON-VERIFY ?AUTO_5839 ?AUTO_5840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5849 - BLOCK
      ?AUTO_5850 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5849 ) ( CLEAR ?AUTO_5850 ) )
    :subtasks
    ( ( !STACK ?AUTO_5849 ?AUTO_5850 )
      ( MAKE-ON-VERIFY ?AUTO_5849 ?AUTO_5850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5853 - BLOCK
      ?AUTO_5854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5854 ) ( ON-TABLE ?AUTO_5853 ) ( CLEAR ?AUTO_5853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5853 )
      ( MAKE-ON ?AUTO_5853 ?AUTO_5854 )
      ( MAKE-ON-VERIFY ?AUTO_5853 ?AUTO_5854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5858 - BLOCK
      ?AUTO_5859 - BLOCK
    )
    :vars
    (
      ?AUTO_5862 - BLOCK
      ?AUTO_5863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5859 ) ( ON-TABLE ?AUTO_5858 ) ( CLEAR ?AUTO_5858 ) ( HOLDING ?AUTO_5862 ) ( CLEAR ?AUTO_5863 ) )
    :subtasks
    ( ( !STACK ?AUTO_5862 ?AUTO_5863 )
      ( MAKE-ON ?AUTO_5858 ?AUTO_5859 )
      ( MAKE-ON-VERIFY ?AUTO_5858 ?AUTO_5859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5864 - BLOCK
      ?AUTO_5865 - BLOCK
    )
    :vars
    (
      ?AUTO_5867 - BLOCK
      ?AUTO_5869 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5864 ) ( CLEAR ?AUTO_5864 ) ( CLEAR ?AUTO_5867 ) ( ON ?AUTO_5869 ?AUTO_5865 ) ( CLEAR ?AUTO_5869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5869 ?AUTO_5865 )
      ( MAKE-ON ?AUTO_5864 ?AUTO_5865 )
      ( MAKE-ON-VERIFY ?AUTO_5864 ?AUTO_5865 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5872 - BLOCK
      ?AUTO_5873 - BLOCK
    )
    :vars
    (
      ?AUTO_5876 - BLOCK
      ?AUTO_5877 - BLOCK
      ?AUTO_5878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5872 ) ( CLEAR ?AUTO_5872 ) ( CLEAR ?AUTO_5876 ) ( ON ?AUTO_5877 ?AUTO_5873 ) ( CLEAR ?AUTO_5877 ) ( HOLDING ?AUTO_5878 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5878 )
      ( MAKE-ON ?AUTO_5872 ?AUTO_5873 )
      ( MAKE-ON-VERIFY ?AUTO_5872 ?AUTO_5873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5879 - BLOCK
      ?AUTO_5880 - BLOCK
    )
    :vars
    (
      ?AUTO_5884 - BLOCK
      ?AUTO_5883 - BLOCK
      ?AUTO_5885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5879 ) ( CLEAR ?AUTO_5884 ) ( ON ?AUTO_5883 ?AUTO_5880 ) ( CLEAR ?AUTO_5883 ) ( ON ?AUTO_5885 ?AUTO_5879 ) ( CLEAR ?AUTO_5885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5885 ?AUTO_5879 )
      ( MAKE-ON ?AUTO_5879 ?AUTO_5880 )
      ( MAKE-ON-VERIFY ?AUTO_5879 ?AUTO_5880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5888 - BLOCK
      ?AUTO_5889 - BLOCK
    )
    :vars
    (
      ?AUTO_5892 - BLOCK
      ?AUTO_5891 - BLOCK
      ?AUTO_5890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5888 ) ( ON ?AUTO_5892 ?AUTO_5889 ) ( CLEAR ?AUTO_5892 ) ( ON ?AUTO_5891 ?AUTO_5888 ) ( CLEAR ?AUTO_5891 ) ( HOLDING ?AUTO_5890 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5890 )
      ( MAKE-ON ?AUTO_5888 ?AUTO_5889 )
      ( MAKE-ON-VERIFY ?AUTO_5888 ?AUTO_5889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5896 - BLOCK
      ?AUTO_5897 - BLOCK
    )
    :vars
    (
      ?AUTO_5902 - BLOCK
      ?AUTO_5901 - BLOCK
      ?AUTO_5898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5896 ) ( ON ?AUTO_5902 ?AUTO_5897 ) ( CLEAR ?AUTO_5902 ) ( ON ?AUTO_5901 ?AUTO_5896 ) ( ON ?AUTO_5898 ?AUTO_5901 ) ( CLEAR ?AUTO_5898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5898 ?AUTO_5901 )
      ( MAKE-ON ?AUTO_5896 ?AUTO_5897 )
      ( MAKE-ON-VERIFY ?AUTO_5896 ?AUTO_5897 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5904 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5904 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5904 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5904 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5906 - BLOCK
    )
    :vars
    (
      ?AUTO_5909 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5906 ?AUTO_5909 ) ( CLEAR ?AUTO_5906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5906 ?AUTO_5909 )
      ( MAKE-ON-TABLE ?AUTO_5906 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5906 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5911 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5911 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5911 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5911 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5913 - BLOCK
    )
    :vars
    (
      ?AUTO_5916 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5913 ?AUTO_5916 ) ( CLEAR ?AUTO_5913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5913 ?AUTO_5916 )
      ( MAKE-ON-TABLE ?AUTO_5913 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5913 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5917 - BLOCK
    )
    :vars
    (
      ?AUTO_5919 - BLOCK
      ?AUTO_5920 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5917 ?AUTO_5919 ) ( CLEAR ?AUTO_5917 ) ( HOLDING ?AUTO_5920 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5920 )
      ( MAKE-ON-TABLE ?AUTO_5917 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5917 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5921 - BLOCK
    )
    :vars
    (
      ?AUTO_5923 - BLOCK
      ?AUTO_5924 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5921 ?AUTO_5923 ) ( ON ?AUTO_5924 ?AUTO_5921 ) ( CLEAR ?AUTO_5924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5924 ?AUTO_5921 )
      ( MAKE-ON-TABLE ?AUTO_5921 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5929 - BLOCK
      ?AUTO_5930 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5929 ) ( CLEAR ?AUTO_5930 ) )
    :subtasks
    ( ( !STACK ?AUTO_5929 ?AUTO_5930 )
      ( MAKE-ON-VERIFY ?AUTO_5929 ?AUTO_5930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5933 - BLOCK
      ?AUTO_5934 - BLOCK
    )
    :vars
    (
      ?AUTO_5938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5934 ) ( ON ?AUTO_5933 ?AUTO_5938 ) ( CLEAR ?AUTO_5933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5933 ?AUTO_5938 )
      ( MAKE-ON ?AUTO_5933 ?AUTO_5934 )
      ( MAKE-ON-VERIFY ?AUTO_5933 ?AUTO_5934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5939 - BLOCK
      ?AUTO_5940 - BLOCK
    )
    :vars
    (
      ?AUTO_5943 - BLOCK
      ?AUTO_5944 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5940 ) ( ON ?AUTO_5939 ?AUTO_5943 ) ( CLEAR ?AUTO_5939 ) ( HOLDING ?AUTO_5944 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5944 )
      ( MAKE-ON ?AUTO_5939 ?AUTO_5940 )
      ( MAKE-ON-VERIFY ?AUTO_5939 ?AUTO_5940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5947 - BLOCK
      ?AUTO_5948 - BLOCK
    )
    :vars
    (
      ?AUTO_5951 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5947 ?AUTO_5951 ) ( CLEAR ?AUTO_5947 ) ( HOLDING ?AUTO_5948 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5948 )
      ( MAKE-ON ?AUTO_5947 ?AUTO_5948 )
      ( MAKE-ON-VERIFY ?AUTO_5947 ?AUTO_5948 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5957 - BLOCK
      ?AUTO_5958 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5957 ) ( CLEAR ?AUTO_5958 ) )
    :subtasks
    ( ( !STACK ?AUTO_5957 ?AUTO_5958 )
      ( MAKE-ON-VERIFY ?AUTO_5957 ?AUTO_5958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5961 - BLOCK
      ?AUTO_5962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5962 ) ( ON-TABLE ?AUTO_5961 ) ( CLEAR ?AUTO_5961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5961 )
      ( MAKE-ON ?AUTO_5961 ?AUTO_5962 )
      ( MAKE-ON-VERIFY ?AUTO_5961 ?AUTO_5962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5966 - BLOCK
      ?AUTO_5967 - BLOCK
    )
    :vars
    (
      ?AUTO_5970 - BLOCK
      ?AUTO_5971 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5967 ) ( ON-TABLE ?AUTO_5966 ) ( CLEAR ?AUTO_5966 ) ( HOLDING ?AUTO_5970 ) ( CLEAR ?AUTO_5971 ) )
    :subtasks
    ( ( !STACK ?AUTO_5970 ?AUTO_5971 )
      ( MAKE-ON ?AUTO_5966 ?AUTO_5967 )
      ( MAKE-ON-VERIFY ?AUTO_5966 ?AUTO_5967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5972 - BLOCK
      ?AUTO_5973 - BLOCK
    )
    :vars
    (
      ?AUTO_5975 - BLOCK
      ?AUTO_5977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5972 ) ( CLEAR ?AUTO_5972 ) ( CLEAR ?AUTO_5975 ) ( ON ?AUTO_5977 ?AUTO_5973 ) ( CLEAR ?AUTO_5977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5977 ?AUTO_5973 )
      ( MAKE-ON ?AUTO_5972 ?AUTO_5973 )
      ( MAKE-ON-VERIFY ?AUTO_5972 ?AUTO_5973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5980 - BLOCK
      ?AUTO_5981 - BLOCK
    )
    :vars
    (
      ?AUTO_5984 - BLOCK
      ?AUTO_5985 - BLOCK
      ?AUTO_5986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5980 ) ( CLEAR ?AUTO_5980 ) ( CLEAR ?AUTO_5984 ) ( ON ?AUTO_5985 ?AUTO_5981 ) ( CLEAR ?AUTO_5985 ) ( HOLDING ?AUTO_5986 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5986 )
      ( MAKE-ON ?AUTO_5980 ?AUTO_5981 )
      ( MAKE-ON-VERIFY ?AUTO_5980 ?AUTO_5981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5987 - BLOCK
      ?AUTO_5988 - BLOCK
    )
    :vars
    (
      ?AUTO_5992 - BLOCK
      ?AUTO_5991 - BLOCK
      ?AUTO_5993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5987 ) ( CLEAR ?AUTO_5992 ) ( ON ?AUTO_5991 ?AUTO_5988 ) ( CLEAR ?AUTO_5991 ) ( ON ?AUTO_5993 ?AUTO_5987 ) ( CLEAR ?AUTO_5993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5993 ?AUTO_5987 )
      ( MAKE-ON ?AUTO_5987 ?AUTO_5988 )
      ( MAKE-ON-VERIFY ?AUTO_5987 ?AUTO_5988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5996 - BLOCK
      ?AUTO_5997 - BLOCK
    )
    :vars
    (
      ?AUTO_6000 - BLOCK
      ?AUTO_5999 - BLOCK
      ?AUTO_5998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5996 ) ( ON ?AUTO_6000 ?AUTO_5997 ) ( CLEAR ?AUTO_6000 ) ( ON ?AUTO_5999 ?AUTO_5996 ) ( CLEAR ?AUTO_5999 ) ( HOLDING ?AUTO_5998 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5998 )
      ( MAKE-ON ?AUTO_5996 ?AUTO_5997 )
      ( MAKE-ON-VERIFY ?AUTO_5996 ?AUTO_5997 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6004 - BLOCK
      ?AUTO_6005 - BLOCK
    )
    :vars
    (
      ?AUTO_6010 - BLOCK
      ?AUTO_6009 - BLOCK
      ?AUTO_6006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6004 ) ( ON ?AUTO_6010 ?AUTO_6005 ) ( CLEAR ?AUTO_6010 ) ( ON ?AUTO_6009 ?AUTO_6004 ) ( ON ?AUTO_6006 ?AUTO_6009 ) ( CLEAR ?AUTO_6006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6006 ?AUTO_6009 )
      ( MAKE-ON ?AUTO_6004 ?AUTO_6005 )
      ( MAKE-ON-VERIFY ?AUTO_6004 ?AUTO_6005 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6012 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6012 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6012 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6012 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6014 - BLOCK
    )
    :vars
    (
      ?AUTO_6017 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6014 ?AUTO_6017 ) ( CLEAR ?AUTO_6014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6014 ?AUTO_6017 )
      ( MAKE-ON-TABLE ?AUTO_6014 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6020 - BLOCK
      ?AUTO_6021 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6020 ) ( CLEAR ?AUTO_6021 ) )
    :subtasks
    ( ( !STACK ?AUTO_6020 ?AUTO_6021 )
      ( MAKE-ON-VERIFY ?AUTO_6020 ?AUTO_6021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6024 - BLOCK
      ?AUTO_6025 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6025 ) ( ON-TABLE ?AUTO_6024 ) ( CLEAR ?AUTO_6024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6024 )
      ( MAKE-ON ?AUTO_6024 ?AUTO_6025 )
      ( MAKE-ON-VERIFY ?AUTO_6024 ?AUTO_6025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6029 - BLOCK
      ?AUTO_6030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6029 ) ( CLEAR ?AUTO_6029 ) ( HOLDING ?AUTO_6030 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6030 )
      ( MAKE-ON ?AUTO_6029 ?AUTO_6030 )
      ( MAKE-ON-VERIFY ?AUTO_6029 ?AUTO_6030 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6038 - BLOCK
      ?AUTO_6039 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6038 ) ( CLEAR ?AUTO_6039 ) )
    :subtasks
    ( ( !STACK ?AUTO_6038 ?AUTO_6039 )
      ( MAKE-ON-VERIFY ?AUTO_6038 ?AUTO_6039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6042 - BLOCK
      ?AUTO_6043 - BLOCK
    )
    :vars
    (
      ?AUTO_6047 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6043 ) ( ON ?AUTO_6042 ?AUTO_6047 ) ( CLEAR ?AUTO_6042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6042 ?AUTO_6047 )
      ( MAKE-ON ?AUTO_6042 ?AUTO_6043 )
      ( MAKE-ON-VERIFY ?AUTO_6042 ?AUTO_6043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6048 - BLOCK
      ?AUTO_6049 - BLOCK
    )
    :vars
    (
      ?AUTO_6052 - BLOCK
      ?AUTO_6053 - BLOCK
      ?AUTO_6054 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6049 ) ( ON ?AUTO_6048 ?AUTO_6052 ) ( CLEAR ?AUTO_6048 ) ( HOLDING ?AUTO_6053 ) ( CLEAR ?AUTO_6054 ) )
    :subtasks
    ( ( !STACK ?AUTO_6053 ?AUTO_6054 )
      ( MAKE-ON ?AUTO_6048 ?AUTO_6049 )
      ( MAKE-ON-VERIFY ?AUTO_6048 ?AUTO_6049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6059 - BLOCK
      ?AUTO_6060 - BLOCK
    )
    :vars
    (
      ?AUTO_6061 - BLOCK
      ?AUTO_6064 - BLOCK
      ?AUTO_6065 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6060 ) ( ON ?AUTO_6059 ?AUTO_6061 ) ( CLEAR ?AUTO_6064 ) ( ON ?AUTO_6065 ?AUTO_6059 ) ( CLEAR ?AUTO_6065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6065 ?AUTO_6059 )
      ( MAKE-ON ?AUTO_6059 ?AUTO_6060 )
      ( MAKE-ON-VERIFY ?AUTO_6059 ?AUTO_6060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6070 - BLOCK
      ?AUTO_6071 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6070 ) ( CLEAR ?AUTO_6071 ) )
    :subtasks
    ( ( !STACK ?AUTO_6070 ?AUTO_6071 )
      ( MAKE-ON-VERIFY ?AUTO_6070 ?AUTO_6071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6074 - BLOCK
      ?AUTO_6075 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6075 ) ( ON-TABLE ?AUTO_6074 ) ( CLEAR ?AUTO_6074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6074 )
      ( MAKE-ON ?AUTO_6074 ?AUTO_6075 )
      ( MAKE-ON-VERIFY ?AUTO_6074 ?AUTO_6075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6079 - BLOCK
      ?AUTO_6080 - BLOCK
    )
    :vars
    (
      ?AUTO_6084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6079 ) ( CLEAR ?AUTO_6079 ) ( HOLDING ?AUTO_6080 ) ( CLEAR ?AUTO_6084 ) )
    :subtasks
    ( ( !STACK ?AUTO_6080 ?AUTO_6084 )
      ( MAKE-ON ?AUTO_6079 ?AUTO_6080 )
      ( MAKE-ON-VERIFY ?AUTO_6079 ?AUTO_6080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6085 - BLOCK
      ?AUTO_6086 - BLOCK
    )
    :vars
    (
      ?AUTO_6088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6085 ) ( CLEAR ?AUTO_6088 ) ( ON ?AUTO_6086 ?AUTO_6085 ) ( CLEAR ?AUTO_6086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6086 ?AUTO_6085 )
      ( MAKE-ON ?AUTO_6085 ?AUTO_6086 )
      ( MAKE-ON-VERIFY ?AUTO_6085 ?AUTO_6086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6092 - BLOCK
      ?AUTO_6093 - BLOCK
    )
    :vars
    (
      ?AUTO_6094 - BLOCK
      ?AUTO_6097 - BLOCK
      ?AUTO_6098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6092 ) ( CLEAR ?AUTO_6094 ) ( ON ?AUTO_6093 ?AUTO_6092 ) ( CLEAR ?AUTO_6093 ) ( HOLDING ?AUTO_6097 ) ( CLEAR ?AUTO_6098 ) )
    :subtasks
    ( ( !STACK ?AUTO_6097 ?AUTO_6098 )
      ( MAKE-ON ?AUTO_6092 ?AUTO_6093 )
      ( MAKE-ON-VERIFY ?AUTO_6092 ?AUTO_6093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6103 - BLOCK
      ?AUTO_6104 - BLOCK
    )
    :vars
    (
      ?AUTO_6107 - BLOCK
      ?AUTO_6109 - BLOCK
      ?AUTO_6108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6103 ) ( CLEAR ?AUTO_6107 ) ( ON ?AUTO_6104 ?AUTO_6103 ) ( CLEAR ?AUTO_6109 ) ( ON ?AUTO_6108 ?AUTO_6104 ) ( CLEAR ?AUTO_6108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6108 ?AUTO_6104 )
      ( MAKE-ON ?AUTO_6103 ?AUTO_6104 )
      ( MAKE-ON-VERIFY ?AUTO_6103 ?AUTO_6104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6114 - BLOCK
      ?AUTO_6115 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6114 ) ( CLEAR ?AUTO_6115 ) )
    :subtasks
    ( ( !STACK ?AUTO_6114 ?AUTO_6115 )
      ( MAKE-ON-VERIFY ?AUTO_6114 ?AUTO_6115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6118 - BLOCK
      ?AUTO_6119 - BLOCK
    )
    :vars
    (
      ?AUTO_6123 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6119 ) ( ON ?AUTO_6118 ?AUTO_6123 ) ( CLEAR ?AUTO_6118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6118 ?AUTO_6123 )
      ( MAKE-ON ?AUTO_6118 ?AUTO_6119 )
      ( MAKE-ON-VERIFY ?AUTO_6118 ?AUTO_6119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6124 - BLOCK
      ?AUTO_6125 - BLOCK
    )
    :vars
    (
      ?AUTO_6128 - BLOCK
      ?AUTO_6130 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6124 ?AUTO_6128 ) ( CLEAR ?AUTO_6124 ) ( HOLDING ?AUTO_6125 ) ( CLEAR ?AUTO_6130 ) )
    :subtasks
    ( ( !STACK ?AUTO_6125 ?AUTO_6130 )
      ( MAKE-ON ?AUTO_6124 ?AUTO_6125 )
      ( MAKE-ON-VERIFY ?AUTO_6124 ?AUTO_6125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6133 - BLOCK
      ?AUTO_6134 - BLOCK
    )
    :vars
    (
      ?AUTO_6137 - BLOCK
      ?AUTO_6138 - BLOCK
      ?AUTO_6139 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6134 ) ( ON ?AUTO_6133 ?AUTO_6137 ) ( CLEAR ?AUTO_6133 ) ( HOLDING ?AUTO_6138 ) ( CLEAR ?AUTO_6139 ) )
    :subtasks
    ( ( !STACK ?AUTO_6138 ?AUTO_6139 )
      ( MAKE-ON ?AUTO_6133 ?AUTO_6134 )
      ( MAKE-ON-VERIFY ?AUTO_6133 ?AUTO_6134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6140 - BLOCK
      ?AUTO_6141 - BLOCK
    )
    :vars
    (
      ?AUTO_6144 - BLOCK
      ?AUTO_6146 - BLOCK
      ?AUTO_6145 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6140 ?AUTO_6144 ) ( CLEAR ?AUTO_6140 ) ( CLEAR ?AUTO_6146 ) ( ON ?AUTO_6145 ?AUTO_6141 ) ( CLEAR ?AUTO_6145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6145 ?AUTO_6141 )
      ( MAKE-ON ?AUTO_6140 ?AUTO_6141 )
      ( MAKE-ON-VERIFY ?AUTO_6140 ?AUTO_6141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6149 - BLOCK
      ?AUTO_6150 - BLOCK
    )
    :vars
    (
      ?AUTO_6155 - BLOCK
      ?AUTO_6151 - BLOCK
      ?AUTO_6154 - BLOCK
      ?AUTO_6156 - BLOCK
      ?AUTO_6157 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6149 ?AUTO_6155 ) ( CLEAR ?AUTO_6149 ) ( CLEAR ?AUTO_6151 ) ( ON ?AUTO_6154 ?AUTO_6150 ) ( CLEAR ?AUTO_6154 ) ( HOLDING ?AUTO_6156 ) ( CLEAR ?AUTO_6157 ) )
    :subtasks
    ( ( !STACK ?AUTO_6156 ?AUTO_6157 )
      ( MAKE-ON ?AUTO_6149 ?AUTO_6150 )
      ( MAKE-ON-VERIFY ?AUTO_6149 ?AUTO_6150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6162 - BLOCK
      ?AUTO_6163 - BLOCK
    )
    :vars
    (
      ?AUTO_6169 - BLOCK
      ?AUTO_6168 - BLOCK
      ?AUTO_6170 - BLOCK
      ?AUTO_6166 - BLOCK
      ?AUTO_6164 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6162 ?AUTO_6169 ) ( CLEAR ?AUTO_6162 ) ( CLEAR ?AUTO_6168 ) ( ON ?AUTO_6170 ?AUTO_6163 ) ( CLEAR ?AUTO_6166 ) ( ON ?AUTO_6164 ?AUTO_6170 ) ( CLEAR ?AUTO_6164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6164 ?AUTO_6170 )
      ( MAKE-ON ?AUTO_6162 ?AUTO_6163 )
      ( MAKE-ON-VERIFY ?AUTO_6162 ?AUTO_6163 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6174 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6174 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6174 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6174 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6176 - BLOCK
    )
    :vars
    (
      ?AUTO_6179 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6176 ?AUTO_6179 ) ( CLEAR ?AUTO_6176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6176 ?AUTO_6179 )
      ( MAKE-ON-TABLE ?AUTO_6176 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6176 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6180 - BLOCK
    )
    :vars
    (
      ?AUTO_6182 - BLOCK
      ?AUTO_6183 - BLOCK
      ?AUTO_6184 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6180 ?AUTO_6182 ) ( CLEAR ?AUTO_6180 ) ( HOLDING ?AUTO_6183 ) ( CLEAR ?AUTO_6184 ) )
    :subtasks
    ( ( !STACK ?AUTO_6183 ?AUTO_6184 )
      ( MAKE-ON-TABLE ?AUTO_6180 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6180 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6185 - BLOCK
    )
    :vars
    (
      ?AUTO_6187 - BLOCK
      ?AUTO_6189 - BLOCK
      ?AUTO_6188 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6185 ?AUTO_6187 ) ( CLEAR ?AUTO_6189 ) ( ON ?AUTO_6188 ?AUTO_6185 ) ( CLEAR ?AUTO_6188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6188 ?AUTO_6185 )
      ( MAKE-ON-TABLE ?AUTO_6185 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6185 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6192 - BLOCK
    )
    :vars
    (
      ?AUTO_6195 - BLOCK
      ?AUTO_6196 - BLOCK
      ?AUTO_6193 - BLOCK
      ?AUTO_6198 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6192 ?AUTO_6195 ) ( ON ?AUTO_6196 ?AUTO_6192 ) ( CLEAR ?AUTO_6196 ) ( HOLDING ?AUTO_6193 ) ( CLEAR ?AUTO_6198 ) )
    :subtasks
    ( ( !STACK ?AUTO_6193 ?AUTO_6198 )
      ( MAKE-ON-TABLE ?AUTO_6192 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6192 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6207 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6207 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6207 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6207 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6209 - BLOCK
    )
    :vars
    (
      ?AUTO_6212 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6209 ?AUTO_6212 ) ( CLEAR ?AUTO_6209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6209 ?AUTO_6212 )
      ( MAKE-ON-TABLE ?AUTO_6209 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6209 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6213 - BLOCK
    )
    :vars
    (
      ?AUTO_6215 - BLOCK
      ?AUTO_6216 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6213 ?AUTO_6215 ) ( CLEAR ?AUTO_6213 ) ( HOLDING ?AUTO_6216 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6216 )
      ( MAKE-ON-TABLE ?AUTO_6213 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6213 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6217 - BLOCK
    )
    :vars
    (
      ?AUTO_6219 - BLOCK
      ?AUTO_6220 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6217 ?AUTO_6219 ) ( ON ?AUTO_6220 ?AUTO_6217 ) ( CLEAR ?AUTO_6220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6220 ?AUTO_6217 )
      ( MAKE-ON-TABLE ?AUTO_6217 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6217 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6223 - BLOCK
    )
    :vars
    (
      ?AUTO_6224 - BLOCK
      ?AUTO_6225 - BLOCK
      ?AUTO_6227 - BLOCK
      ?AUTO_6228 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6223 ?AUTO_6224 ) ( ON ?AUTO_6225 ?AUTO_6223 ) ( CLEAR ?AUTO_6225 ) ( HOLDING ?AUTO_6227 ) ( CLEAR ?AUTO_6228 ) )
    :subtasks
    ( ( !STACK ?AUTO_6227 ?AUTO_6228 )
      ( MAKE-ON-TABLE ?AUTO_6223 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6223 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6229 - BLOCK
    )
    :vars
    (
      ?AUTO_6230 - BLOCK
      ?AUTO_6232 - BLOCK
      ?AUTO_6234 - BLOCK
      ?AUTO_6233 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6229 ?AUTO_6230 ) ( ON ?AUTO_6232 ?AUTO_6229 ) ( CLEAR ?AUTO_6234 ) ( ON ?AUTO_6233 ?AUTO_6232 ) ( CLEAR ?AUTO_6233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6233 ?AUTO_6232 )
      ( MAKE-ON-TABLE ?AUTO_6229 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6229 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6237 - BLOCK
    )
    :vars
    (
      ?AUTO_6239 - BLOCK
      ?AUTO_6242 - BLOCK
      ?AUTO_6238 - BLOCK
      ?AUTO_6240 - BLOCK
      ?AUTO_6244 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6237 ?AUTO_6239 ) ( ON ?AUTO_6242 ?AUTO_6237 ) ( ON ?AUTO_6238 ?AUTO_6242 ) ( CLEAR ?AUTO_6238 ) ( HOLDING ?AUTO_6240 ) ( CLEAR ?AUTO_6244 ) )
    :subtasks
    ( ( !STACK ?AUTO_6240 ?AUTO_6244 )
      ( MAKE-ON-TABLE ?AUTO_6237 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6254 - BLOCK
      ?AUTO_6255 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6254 ) ( CLEAR ?AUTO_6255 ) )
    :subtasks
    ( ( !STACK ?AUTO_6254 ?AUTO_6255 )
      ( MAKE-ON-VERIFY ?AUTO_6254 ?AUTO_6255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6258 - BLOCK
      ?AUTO_6259 - BLOCK
    )
    :vars
    (
      ?AUTO_6263 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6259 ) ( ON ?AUTO_6258 ?AUTO_6263 ) ( CLEAR ?AUTO_6258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6258 ?AUTO_6263 )
      ( MAKE-ON ?AUTO_6258 ?AUTO_6259 )
      ( MAKE-ON-VERIFY ?AUTO_6258 ?AUTO_6259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6264 - BLOCK
      ?AUTO_6265 - BLOCK
    )
    :vars
    (
      ?AUTO_6266 - BLOCK
      ?AUTO_6269 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6265 ) ( ON ?AUTO_6264 ?AUTO_6266 ) ( CLEAR ?AUTO_6264 ) ( HOLDING ?AUTO_6269 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6269 )
      ( MAKE-ON ?AUTO_6264 ?AUTO_6265 )
      ( MAKE-ON-VERIFY ?AUTO_6264 ?AUTO_6265 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6270 - BLOCK
      ?AUTO_6271 - BLOCK
    )
    :vars
    (
      ?AUTO_6272 - BLOCK
      ?AUTO_6275 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6271 ) ( ON ?AUTO_6270 ?AUTO_6272 ) ( ON ?AUTO_6275 ?AUTO_6270 ) ( CLEAR ?AUTO_6275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6275 ?AUTO_6270 )
      ( MAKE-ON ?AUTO_6270 ?AUTO_6271 )
      ( MAKE-ON-VERIFY ?AUTO_6270 ?AUTO_6271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6278 - BLOCK
      ?AUTO_6279 - BLOCK
    )
    :vars
    (
      ?AUTO_6280 - BLOCK
      ?AUTO_6281 - BLOCK
      ?AUTO_6284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6279 ) ( ON ?AUTO_6278 ?AUTO_6280 ) ( ON ?AUTO_6281 ?AUTO_6278 ) ( CLEAR ?AUTO_6281 ) ( HOLDING ?AUTO_6284 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6284 )
      ( MAKE-ON ?AUTO_6278 ?AUTO_6279 )
      ( MAKE-ON-VERIFY ?AUTO_6278 ?AUTO_6279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6285 - BLOCK
      ?AUTO_6286 - BLOCK
    )
    :vars
    (
      ?AUTO_6287 - BLOCK
      ?AUTO_6290 - BLOCK
      ?AUTO_6291 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6286 ) ( ON ?AUTO_6285 ?AUTO_6287 ) ( ON ?AUTO_6290 ?AUTO_6285 ) ( ON ?AUTO_6291 ?AUTO_6290 ) ( CLEAR ?AUTO_6291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6291 ?AUTO_6290 )
      ( MAKE-ON ?AUTO_6285 ?AUTO_6286 )
      ( MAKE-ON-VERIFY ?AUTO_6285 ?AUTO_6286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6294 - BLOCK
      ?AUTO_6295 - BLOCK
    )
    :vars
    (
      ?AUTO_6297 - BLOCK
      ?AUTO_6298 - BLOCK
      ?AUTO_6296 - BLOCK
      ?AUTO_6301 - BLOCK
      ?AUTO_6302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6295 ) ( ON ?AUTO_6294 ?AUTO_6297 ) ( ON ?AUTO_6298 ?AUTO_6294 ) ( ON ?AUTO_6296 ?AUTO_6298 ) ( CLEAR ?AUTO_6296 ) ( HOLDING ?AUTO_6301 ) ( CLEAR ?AUTO_6302 ) )
    :subtasks
    ( ( !STACK ?AUTO_6301 ?AUTO_6302 )
      ( MAKE-ON ?AUTO_6294 ?AUTO_6295 )
      ( MAKE-ON-VERIFY ?AUTO_6294 ?AUTO_6295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6303 - BLOCK
      ?AUTO_6304 - BLOCK
    )
    :vars
    (
      ?AUTO_6305 - BLOCK
      ?AUTO_6311 - BLOCK
      ?AUTO_6310 - BLOCK
      ?AUTO_6307 - BLOCK
      ?AUTO_6306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6304 ) ( ON ?AUTO_6303 ?AUTO_6305 ) ( ON ?AUTO_6311 ?AUTO_6303 ) ( ON ?AUTO_6310 ?AUTO_6311 ) ( CLEAR ?AUTO_6307 ) ( ON ?AUTO_6306 ?AUTO_6310 ) ( CLEAR ?AUTO_6306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6306 ?AUTO_6310 )
      ( MAKE-ON ?AUTO_6303 ?AUTO_6304 )
      ( MAKE-ON-VERIFY ?AUTO_6303 ?AUTO_6304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6314 - BLOCK
      ?AUTO_6315 - BLOCK
    )
    :vars
    (
      ?AUTO_6320 - BLOCK
      ?AUTO_6322 - BLOCK
      ?AUTO_6321 - BLOCK
      ?AUTO_6318 - BLOCK
      ?AUTO_6319 - BLOCK
      ?AUTO_6324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6315 ) ( ON ?AUTO_6314 ?AUTO_6320 ) ( ON ?AUTO_6322 ?AUTO_6314 ) ( ON ?AUTO_6321 ?AUTO_6322 ) ( ON ?AUTO_6318 ?AUTO_6321 ) ( CLEAR ?AUTO_6318 ) ( HOLDING ?AUTO_6319 ) ( CLEAR ?AUTO_6324 ) )
    :subtasks
    ( ( !STACK ?AUTO_6319 ?AUTO_6324 )
      ( MAKE-ON ?AUTO_6314 ?AUTO_6315 )
      ( MAKE-ON-VERIFY ?AUTO_6314 ?AUTO_6315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6331 - BLOCK
      ?AUTO_6332 - BLOCK
    )
    :vars
    (
      ?AUTO_6334 - BLOCK
      ?AUTO_6339 - BLOCK
      ?AUTO_6333 - BLOCK
      ?AUTO_6337 - BLOCK
      ?AUTO_6336 - BLOCK
      ?AUTO_6341 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6331 ?AUTO_6334 ) ( ON ?AUTO_6339 ?AUTO_6331 ) ( ON ?AUTO_6333 ?AUTO_6339 ) ( CLEAR ?AUTO_6337 ) ( ON ?AUTO_6336 ?AUTO_6333 ) ( CLEAR ?AUTO_6336 ) ( HOLDING ?AUTO_6332 ) ( CLEAR ?AUTO_6341 ) )
    :subtasks
    ( ( !STACK ?AUTO_6332 ?AUTO_6341 )
      ( MAKE-ON ?AUTO_6331 ?AUTO_6332 )
      ( MAKE-ON-VERIFY ?AUTO_6331 ?AUTO_6332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6350 - BLOCK
      ?AUTO_6351 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6350 ) ( CLEAR ?AUTO_6351 ) )
    :subtasks
    ( ( !STACK ?AUTO_6350 ?AUTO_6351 )
      ( MAKE-ON-VERIFY ?AUTO_6350 ?AUTO_6351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6354 - BLOCK
      ?AUTO_6355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6355 ) ( ON-TABLE ?AUTO_6354 ) ( CLEAR ?AUTO_6354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6354 )
      ( MAKE-ON ?AUTO_6354 ?AUTO_6355 )
      ( MAKE-ON-VERIFY ?AUTO_6354 ?AUTO_6355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6359 - BLOCK
      ?AUTO_6360 - BLOCK
    )
    :vars
    (
      ?AUTO_6364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6359 ) ( CLEAR ?AUTO_6359 ) ( HOLDING ?AUTO_6360 ) ( CLEAR ?AUTO_6364 ) )
    :subtasks
    ( ( !STACK ?AUTO_6360 ?AUTO_6364 )
      ( MAKE-ON ?AUTO_6359 ?AUTO_6360 )
      ( MAKE-ON-VERIFY ?AUTO_6359 ?AUTO_6360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6581 - BLOCK
      ?AUTO_6582 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6581 ) ( CLEAR ?AUTO_6582 ) )
    :subtasks
    ( ( !STACK ?AUTO_6581 ?AUTO_6582 )
      ( MAKE-ON-VERIFY ?AUTO_6581 ?AUTO_6582 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6585 - BLOCK
      ?AUTO_6586 - BLOCK
    )
    :vars
    (
      ?AUTO_6590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6586 ) ( ON ?AUTO_6585 ?AUTO_6590 ) ( CLEAR ?AUTO_6585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6585 ?AUTO_6590 )
      ( MAKE-ON ?AUTO_6585 ?AUTO_6586 )
      ( MAKE-ON-VERIFY ?AUTO_6585 ?AUTO_6586 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6591 - BLOCK
      ?AUTO_6592 - BLOCK
    )
    :vars
    (
      ?AUTO_6595 - BLOCK
      ?AUTO_6596 - BLOCK
      ?AUTO_6597 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6592 ) ( ON ?AUTO_6591 ?AUTO_6595 ) ( CLEAR ?AUTO_6591 ) ( HOLDING ?AUTO_6596 ) ( CLEAR ?AUTO_6597 ) )
    :subtasks
    ( ( !STACK ?AUTO_6596 ?AUTO_6597 )
      ( MAKE-ON ?AUTO_6591 ?AUTO_6592 )
      ( MAKE-ON-VERIFY ?AUTO_6591 ?AUTO_6592 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6602 - BLOCK
      ?AUTO_6603 - BLOCK
    )
    :vars
    (
      ?AUTO_6604 - BLOCK
      ?AUTO_6607 - BLOCK
      ?AUTO_6608 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6602 ?AUTO_6604 ) ( CLEAR ?AUTO_6602 ) ( CLEAR ?AUTO_6607 ) ( ON ?AUTO_6608 ?AUTO_6603 ) ( CLEAR ?AUTO_6608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6608 ?AUTO_6603 )
      ( MAKE-ON ?AUTO_6602 ?AUTO_6603 )
      ( MAKE-ON-VERIFY ?AUTO_6602 ?AUTO_6603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6611 - BLOCK
      ?AUTO_6612 - BLOCK
    )
    :vars
    (
      ?AUTO_6615 - BLOCK
      ?AUTO_6617 - BLOCK
      ?AUTO_6616 - BLOCK
      ?AUTO_6618 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6611 ?AUTO_6615 ) ( CLEAR ?AUTO_6611 ) ( CLEAR ?AUTO_6617 ) ( ON ?AUTO_6616 ?AUTO_6612 ) ( CLEAR ?AUTO_6616 ) ( HOLDING ?AUTO_6618 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6618 )
      ( MAKE-ON ?AUTO_6611 ?AUTO_6612 )
      ( MAKE-ON-VERIFY ?AUTO_6611 ?AUTO_6612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6619 - BLOCK
      ?AUTO_6620 - BLOCK
    )
    :vars
    (
      ?AUTO_6626 - BLOCK
      ?AUTO_6621 - BLOCK
      ?AUTO_6622 - BLOCK
      ?AUTO_6625 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6619 ?AUTO_6626 ) ( CLEAR ?AUTO_6619 ) ( CLEAR ?AUTO_6621 ) ( ON ?AUTO_6622 ?AUTO_6620 ) ( ON ?AUTO_6625 ?AUTO_6622 ) ( CLEAR ?AUTO_6625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6625 ?AUTO_6622 )
      ( MAKE-ON ?AUTO_6619 ?AUTO_6620 )
      ( MAKE-ON-VERIFY ?AUTO_6619 ?AUTO_6620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6629 - BLOCK
      ?AUTO_6630 - BLOCK
    )
    :vars
    (
      ?AUTO_6635 - BLOCK
      ?AUTO_6634 - BLOCK
      ?AUTO_6632 - BLOCK
      ?AUTO_6636 - BLOCK
      ?AUTO_6637 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6629 ?AUTO_6635 ) ( CLEAR ?AUTO_6629 ) ( CLEAR ?AUTO_6634 ) ( ON ?AUTO_6632 ?AUTO_6630 ) ( ON ?AUTO_6636 ?AUTO_6632 ) ( CLEAR ?AUTO_6636 ) ( HOLDING ?AUTO_6637 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6637 )
      ( MAKE-ON ?AUTO_6629 ?AUTO_6630 )
      ( MAKE-ON-VERIFY ?AUTO_6629 ?AUTO_6630 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6638 - BLOCK
      ?AUTO_6639 - BLOCK
    )
    :vars
    (
      ?AUTO_6640 - BLOCK
      ?AUTO_6641 - BLOCK
      ?AUTO_6645 - BLOCK
      ?AUTO_6642 - BLOCK
      ?AUTO_6646 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6638 ?AUTO_6640 ) ( CLEAR ?AUTO_6638 ) ( CLEAR ?AUTO_6641 ) ( ON ?AUTO_6645 ?AUTO_6639 ) ( ON ?AUTO_6642 ?AUTO_6645 ) ( ON ?AUTO_6646 ?AUTO_6642 ) ( CLEAR ?AUTO_6646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6646 ?AUTO_6642 )
      ( MAKE-ON ?AUTO_6638 ?AUTO_6639 )
      ( MAKE-ON-VERIFY ?AUTO_6638 ?AUTO_6639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6649 - BLOCK
      ?AUTO_6650 - BLOCK
    )
    :vars
    (
      ?AUTO_6657 - BLOCK
      ?AUTO_6655 - BLOCK
      ?AUTO_6653 - BLOCK
      ?AUTO_6652 - BLOCK
      ?AUTO_6654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6657 ) ( ON ?AUTO_6655 ?AUTO_6650 ) ( ON ?AUTO_6653 ?AUTO_6655 ) ( ON ?AUTO_6652 ?AUTO_6653 ) ( CLEAR ?AUTO_6652 ) ( HOLDING ?AUTO_6649 ) ( CLEAR ?AUTO_6654 ) )
    :subtasks
    ( ( !STACK ?AUTO_6649 ?AUTO_6654 )
      ( MAKE-ON ?AUTO_6649 ?AUTO_6650 )
      ( MAKE-ON-VERIFY ?AUTO_6649 ?AUTO_6650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6660 - BLOCK
      ?AUTO_6661 - BLOCK
    )
    :vars
    (
      ?AUTO_6662 - BLOCK
      ?AUTO_6667 - BLOCK
      ?AUTO_6668 - BLOCK
      ?AUTO_6664 - BLOCK
      ?AUTO_6663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6662 ) ( ON ?AUTO_6667 ?AUTO_6661 ) ( ON ?AUTO_6668 ?AUTO_6667 ) ( ON ?AUTO_6664 ?AUTO_6668 ) ( CLEAR ?AUTO_6663 ) ( ON ?AUTO_6660 ?AUTO_6664 ) ( CLEAR ?AUTO_6660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6660 ?AUTO_6664 )
      ( MAKE-ON ?AUTO_6660 ?AUTO_6661 )
      ( MAKE-ON-VERIFY ?AUTO_6660 ?AUTO_6661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6671 - BLOCK
      ?AUTO_6672 - BLOCK
    )
    :vars
    (
      ?AUTO_6679 - BLOCK
      ?AUTO_6674 - BLOCK
      ?AUTO_6678 - BLOCK
      ?AUTO_6673 - BLOCK
      ?AUTO_6675 - BLOCK
      ?AUTO_6681 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6679 ) ( ON ?AUTO_6674 ?AUTO_6672 ) ( ON ?AUTO_6678 ?AUTO_6674 ) ( ON ?AUTO_6673 ?AUTO_6678 ) ( ON ?AUTO_6671 ?AUTO_6673 ) ( CLEAR ?AUTO_6671 ) ( HOLDING ?AUTO_6675 ) ( CLEAR ?AUTO_6681 ) )
    :subtasks
    ( ( !STACK ?AUTO_6675 ?AUTO_6681 )
      ( MAKE-ON ?AUTO_6671 ?AUTO_6672 )
      ( MAKE-ON-VERIFY ?AUTO_6671 ?AUTO_6672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6698 - BLOCK
      ?AUTO_6699 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6698 ) ( CLEAR ?AUTO_6699 ) )
    :subtasks
    ( ( !STACK ?AUTO_6698 ?AUTO_6699 )
      ( MAKE-ON-VERIFY ?AUTO_6698 ?AUTO_6699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6702 - BLOCK
      ?AUTO_6703 - BLOCK
    )
    :vars
    (
      ?AUTO_6707 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6703 ) ( ON ?AUTO_6702 ?AUTO_6707 ) ( CLEAR ?AUTO_6702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6702 ?AUTO_6707 )
      ( MAKE-ON ?AUTO_6702 ?AUTO_6703 )
      ( MAKE-ON-VERIFY ?AUTO_6702 ?AUTO_6703 ) )
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
      ?AUTO_6714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6709 ) ( ON ?AUTO_6708 ?AUTO_6712 ) ( CLEAR ?AUTO_6708 ) ( HOLDING ?AUTO_6713 ) ( CLEAR ?AUTO_6714 ) )
    :subtasks
    ( ( !STACK ?AUTO_6713 ?AUTO_6714 )
      ( MAKE-ON ?AUTO_6708 ?AUTO_6709 )
      ( MAKE-ON-VERIFY ?AUTO_6708 ?AUTO_6709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6715 - BLOCK
      ?AUTO_6716 - BLOCK
    )
    :vars
    (
      ?AUTO_6719 - BLOCK
      ?AUTO_6721 - BLOCK
      ?AUTO_6720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6716 ) ( ON ?AUTO_6715 ?AUTO_6719 ) ( CLEAR ?AUTO_6721 ) ( ON ?AUTO_6720 ?AUTO_6715 ) ( CLEAR ?AUTO_6720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6720 ?AUTO_6715 )
      ( MAKE-ON ?AUTO_6715 ?AUTO_6716 )
      ( MAKE-ON-VERIFY ?AUTO_6715 ?AUTO_6716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6724 - BLOCK
      ?AUTO_6725 - BLOCK
    )
    :vars
    (
      ?AUTO_6730 - BLOCK
      ?AUTO_6726 - BLOCK
      ?AUTO_6727 - BLOCK
      ?AUTO_6731 - BLOCK
      ?AUTO_6732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6725 ) ( ON ?AUTO_6724 ?AUTO_6730 ) ( CLEAR ?AUTO_6726 ) ( ON ?AUTO_6727 ?AUTO_6724 ) ( CLEAR ?AUTO_6727 ) ( HOLDING ?AUTO_6731 ) ( CLEAR ?AUTO_6732 ) )
    :subtasks
    ( ( !STACK ?AUTO_6731 ?AUTO_6732 )
      ( MAKE-ON ?AUTO_6724 ?AUTO_6725 )
      ( MAKE-ON-VERIFY ?AUTO_6724 ?AUTO_6725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6743 - BLOCK
      ?AUTO_6744 - BLOCK
    )
    :vars
    (
      ?AUTO_6749 - BLOCK
      ?AUTO_6747 - BLOCK
      ?AUTO_6746 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6743 ?AUTO_6749 ) ( CLEAR ?AUTO_6747 ) ( ON ?AUTO_6746 ?AUTO_6743 ) ( CLEAR ?AUTO_6746 ) ( HOLDING ?AUTO_6744 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6744 )
      ( MAKE-ON ?AUTO_6743 ?AUTO_6744 )
      ( MAKE-ON-VERIFY ?AUTO_6743 ?AUTO_6744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6757 - BLOCK
      ?AUTO_6758 - BLOCK
    )
    :vars
    (
      ?AUTO_6763 - BLOCK
      ?AUTO_6760 - BLOCK
      ?AUTO_6759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6763 ) ( ON ?AUTO_6760 ?AUTO_6758 ) ( CLEAR ?AUTO_6760 ) ( HOLDING ?AUTO_6757 ) ( CLEAR ?AUTO_6759 ) )
    :subtasks
    ( ( !STACK ?AUTO_6757 ?AUTO_6759 )
      ( MAKE-ON ?AUTO_6757 ?AUTO_6758 )
      ( MAKE-ON-VERIFY ?AUTO_6757 ?AUTO_6758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6766 - BLOCK
      ?AUTO_6767 - BLOCK
    )
    :vars
    (
      ?AUTO_6772 - BLOCK
      ?AUTO_6771 - BLOCK
      ?AUTO_6770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6772 ) ( ON ?AUTO_6771 ?AUTO_6767 ) ( CLEAR ?AUTO_6771 ) ( CLEAR ?AUTO_6770 ) ( ON-TABLE ?AUTO_6766 ) ( CLEAR ?AUTO_6766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6766 )
      ( MAKE-ON ?AUTO_6766 ?AUTO_6767 )
      ( MAKE-ON-VERIFY ?AUTO_6766 ?AUTO_6767 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6774 - BLOCK
      ?AUTO_6775 - BLOCK
    )
    :vars
    (
      ?AUTO_6776 - BLOCK
      ?AUTO_6779 - BLOCK
      ?AUTO_6780 - BLOCK
      ?AUTO_6782 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6776 ) ( ON ?AUTO_6779 ?AUTO_6775 ) ( CLEAR ?AUTO_6779 ) ( ON-TABLE ?AUTO_6774 ) ( CLEAR ?AUTO_6774 ) ( HOLDING ?AUTO_6780 ) ( CLEAR ?AUTO_6782 ) )
    :subtasks
    ( ( !STACK ?AUTO_6780 ?AUTO_6782 )
      ( MAKE-ON ?AUTO_6774 ?AUTO_6775 )
      ( MAKE-ON-VERIFY ?AUTO_6774 ?AUTO_6775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6783 - BLOCK
      ?AUTO_6784 - BLOCK
    )
    :vars
    (
      ?AUTO_6786 - BLOCK
      ?AUTO_6789 - BLOCK
      ?AUTO_6788 - BLOCK
      ?AUTO_6790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6786 ) ( ON ?AUTO_6789 ?AUTO_6784 ) ( CLEAR ?AUTO_6789 ) ( ON-TABLE ?AUTO_6783 ) ( CLEAR ?AUTO_6788 ) ( ON ?AUTO_6790 ?AUTO_6783 ) ( CLEAR ?AUTO_6790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6790 ?AUTO_6783 )
      ( MAKE-ON ?AUTO_6783 ?AUTO_6784 )
      ( MAKE-ON-VERIFY ?AUTO_6783 ?AUTO_6784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6793 - BLOCK
      ?AUTO_6794 - BLOCK
    )
    :vars
    (
      ?AUTO_6796 - BLOCK
      ?AUTO_6795 - BLOCK
      ?AUTO_6800 - BLOCK
      ?AUTO_6797 - BLOCK
      ?AUTO_6801 - BLOCK
      ?AUTO_6802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6796 ) ( ON ?AUTO_6795 ?AUTO_6794 ) ( CLEAR ?AUTO_6795 ) ( ON-TABLE ?AUTO_6793 ) ( CLEAR ?AUTO_6800 ) ( ON ?AUTO_6797 ?AUTO_6793 ) ( CLEAR ?AUTO_6797 ) ( HOLDING ?AUTO_6801 ) ( CLEAR ?AUTO_6802 ) )
    :subtasks
    ( ( !STACK ?AUTO_6801 ?AUTO_6802 )
      ( MAKE-ON ?AUTO_6793 ?AUTO_6794 )
      ( MAKE-ON-VERIFY ?AUTO_6793 ?AUTO_6794 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6807 - BLOCK
      ?AUTO_6808 - BLOCK
    )
    :vars
    (
      ?AUTO_6815 - BLOCK
      ?AUTO_6812 - BLOCK
      ?AUTO_6810 - BLOCK
      ?AUTO_6814 - BLOCK
      ?AUTO_6809 - BLOCK
      ?AUTO_6811 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6815 ) ( ON ?AUTO_6812 ?AUTO_6808 ) ( CLEAR ?AUTO_6812 ) ( ON-TABLE ?AUTO_6807 ) ( CLEAR ?AUTO_6810 ) ( ON ?AUTO_6814 ?AUTO_6807 ) ( CLEAR ?AUTO_6809 ) ( ON ?AUTO_6811 ?AUTO_6814 ) ( CLEAR ?AUTO_6811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6811 ?AUTO_6814 )
      ( MAKE-ON ?AUTO_6807 ?AUTO_6808 )
      ( MAKE-ON-VERIFY ?AUTO_6807 ?AUTO_6808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6821 - BLOCK
      ?AUTO_6822 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6821 ) ( CLEAR ?AUTO_6822 ) )
    :subtasks
    ( ( !STACK ?AUTO_6821 ?AUTO_6822 )
      ( MAKE-ON-VERIFY ?AUTO_6821 ?AUTO_6822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6825 - BLOCK
      ?AUTO_6826 - BLOCK
    )
    :vars
    (
      ?AUTO_6830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6826 ) ( ON ?AUTO_6825 ?AUTO_6830 ) ( CLEAR ?AUTO_6825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6825 ?AUTO_6830 )
      ( MAKE-ON ?AUTO_6825 ?AUTO_6826 )
      ( MAKE-ON-VERIFY ?AUTO_6825 ?AUTO_6826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6831 - BLOCK
      ?AUTO_6832 - BLOCK
    )
    :vars
    (
      ?AUTO_6835 - BLOCK
      ?AUTO_6837 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6831 ?AUTO_6835 ) ( CLEAR ?AUTO_6831 ) ( HOLDING ?AUTO_6832 ) ( CLEAR ?AUTO_6837 ) )
    :subtasks
    ( ( !STACK ?AUTO_6832 ?AUTO_6837 )
      ( MAKE-ON ?AUTO_6831 ?AUTO_6832 )
      ( MAKE-ON-VERIFY ?AUTO_6831 ?AUTO_6832 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6907 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6907 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6907 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6907 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6909 - BLOCK
    )
    :vars
    (
      ?AUTO_6912 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6909 ?AUTO_6912 ) ( CLEAR ?AUTO_6909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6909 ?AUTO_6912 )
      ( MAKE-ON-TABLE ?AUTO_6909 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6909 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6913 - BLOCK
    )
    :vars
    (
      ?AUTO_6915 - BLOCK
      ?AUTO_6916 - BLOCK
      ?AUTO_6917 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6913 ?AUTO_6915 ) ( CLEAR ?AUTO_6913 ) ( HOLDING ?AUTO_6916 ) ( CLEAR ?AUTO_6917 ) )
    :subtasks
    ( ( !STACK ?AUTO_6916 ?AUTO_6917 )
      ( MAKE-ON-TABLE ?AUTO_6913 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6913 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6920 - BLOCK
    )
    :vars
    (
      ?AUTO_6922 - BLOCK
      ?AUTO_6924 - BLOCK
      ?AUTO_6921 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6920 ?AUTO_6922 ) ( CLEAR ?AUTO_6924 ) ( ON ?AUTO_6921 ?AUTO_6920 ) ( CLEAR ?AUTO_6921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6921 ?AUTO_6920 )
      ( MAKE-ON-TABLE ?AUTO_6920 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6920 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6927 - BLOCK
    )
    :vars
    (
      ?AUTO_6929 - BLOCK
      ?AUTO_6931 - BLOCK
      ?AUTO_6930 - BLOCK
      ?AUTO_6932 - BLOCK
      ?AUTO_6933 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6927 ?AUTO_6929 ) ( CLEAR ?AUTO_6931 ) ( ON ?AUTO_6930 ?AUTO_6927 ) ( CLEAR ?AUTO_6930 ) ( HOLDING ?AUTO_6932 ) ( CLEAR ?AUTO_6933 ) )
    :subtasks
    ( ( !STACK ?AUTO_6932 ?AUTO_6933 )
      ( MAKE-ON-TABLE ?AUTO_6927 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6927 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6934 - BLOCK
    )
    :vars
    (
      ?AUTO_6936 - BLOCK
      ?AUTO_6935 - BLOCK
      ?AUTO_6939 - BLOCK
      ?AUTO_6940 - BLOCK
      ?AUTO_6938 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6934 ?AUTO_6936 ) ( CLEAR ?AUTO_6935 ) ( ON ?AUTO_6939 ?AUTO_6934 ) ( CLEAR ?AUTO_6940 ) ( ON ?AUTO_6938 ?AUTO_6939 ) ( CLEAR ?AUTO_6938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6938 ?AUTO_6939 )
      ( MAKE-ON-TABLE ?AUTO_6934 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6934 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6943 - BLOCK
    )
    :vars
    (
      ?AUTO_6948 - BLOCK
      ?AUTO_6944 - BLOCK
      ?AUTO_6947 - BLOCK
      ?AUTO_6945 - BLOCK
      ?AUTO_6949 - BLOCK
      ?AUTO_6950 - BLOCK
      ?AUTO_6951 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6943 ?AUTO_6948 ) ( CLEAR ?AUTO_6944 ) ( ON ?AUTO_6947 ?AUTO_6943 ) ( CLEAR ?AUTO_6945 ) ( ON ?AUTO_6949 ?AUTO_6947 ) ( CLEAR ?AUTO_6949 ) ( HOLDING ?AUTO_6950 ) ( CLEAR ?AUTO_6951 ) )
    :subtasks
    ( ( !STACK ?AUTO_6950 ?AUTO_6951 )
      ( MAKE-ON-TABLE ?AUTO_6943 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6971 - BLOCK
      ?AUTO_6972 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6971 ) ( CLEAR ?AUTO_6972 ) )
    :subtasks
    ( ( !STACK ?AUTO_6971 ?AUTO_6972 )
      ( MAKE-ON-VERIFY ?AUTO_6971 ?AUTO_6972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6975 - BLOCK
      ?AUTO_6976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6976 ) ( ON-TABLE ?AUTO_6975 ) ( CLEAR ?AUTO_6975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6975 )
      ( MAKE-ON ?AUTO_6975 ?AUTO_6976 )
      ( MAKE-ON-VERIFY ?AUTO_6975 ?AUTO_6976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6980 - BLOCK
      ?AUTO_6981 - BLOCK
    )
    :vars
    (
      ?AUTO_6984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6981 ) ( ON-TABLE ?AUTO_6980 ) ( CLEAR ?AUTO_6980 ) ( HOLDING ?AUTO_6984 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6984 )
      ( MAKE-ON ?AUTO_6980 ?AUTO_6981 )
      ( MAKE-ON-VERIFY ?AUTO_6980 ?AUTO_6981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6985 - BLOCK
      ?AUTO_6986 - BLOCK
    )
    :vars
    (
      ?AUTO_6989 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6986 ) ( ON-TABLE ?AUTO_6985 ) ( ON ?AUTO_6989 ?AUTO_6985 ) ( CLEAR ?AUTO_6989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6989 ?AUTO_6985 )
      ( MAKE-ON ?AUTO_6985 ?AUTO_6986 )
      ( MAKE-ON-VERIFY ?AUTO_6985 ?AUTO_6986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6992 - BLOCK
      ?AUTO_6993 - BLOCK
    )
    :vars
    (
      ?AUTO_6995 - BLOCK
      ?AUTO_6997 - BLOCK
      ?AUTO_6998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6993 ) ( ON-TABLE ?AUTO_6992 ) ( ON ?AUTO_6995 ?AUTO_6992 ) ( CLEAR ?AUTO_6995 ) ( HOLDING ?AUTO_6997 ) ( CLEAR ?AUTO_6998 ) )
    :subtasks
    ( ( !STACK ?AUTO_6997 ?AUTO_6998 )
      ( MAKE-ON ?AUTO_6992 ?AUTO_6993 )
      ( MAKE-ON-VERIFY ?AUTO_6992 ?AUTO_6993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6999 - BLOCK
      ?AUTO_7000 - BLOCK
    )
    :vars
    (
      ?AUTO_7001 - BLOCK
      ?AUTO_7005 - BLOCK
      ?AUTO_7004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6999 ) ( ON ?AUTO_7001 ?AUTO_6999 ) ( CLEAR ?AUTO_7001 ) ( CLEAR ?AUTO_7005 ) ( ON ?AUTO_7004 ?AUTO_7000 ) ( CLEAR ?AUTO_7004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7004 ?AUTO_7000 )
      ( MAKE-ON ?AUTO_6999 ?AUTO_7000 )
      ( MAKE-ON-VERIFY ?AUTO_6999 ?AUTO_7000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7008 - BLOCK
      ?AUTO_7009 - BLOCK
    )
    :vars
    (
      ?AUTO_7013 - BLOCK
      ?AUTO_7014 - BLOCK
      ?AUTO_7010 - BLOCK
      ?AUTO_7016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7008 ) ( ON ?AUTO_7013 ?AUTO_7008 ) ( CLEAR ?AUTO_7013 ) ( ON ?AUTO_7014 ?AUTO_7009 ) ( CLEAR ?AUTO_7014 ) ( HOLDING ?AUTO_7010 ) ( CLEAR ?AUTO_7016 ) )
    :subtasks
    ( ( !STACK ?AUTO_7010 ?AUTO_7016 )
      ( MAKE-ON ?AUTO_7008 ?AUTO_7009 )
      ( MAKE-ON-VERIFY ?AUTO_7008 ?AUTO_7009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7017 - BLOCK
      ?AUTO_7018 - BLOCK
    )
    :vars
    (
      ?AUTO_7020 - BLOCK
      ?AUTO_7024 - BLOCK
      ?AUTO_7021 - BLOCK
      ?AUTO_7019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7017 ) ( ON ?AUTO_7020 ?AUTO_7017 ) ( ON ?AUTO_7024 ?AUTO_7018 ) ( CLEAR ?AUTO_7024 ) ( CLEAR ?AUTO_7021 ) ( ON ?AUTO_7019 ?AUTO_7020 ) ( CLEAR ?AUTO_7019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7019 ?AUTO_7020 )
      ( MAKE-ON ?AUTO_7017 ?AUTO_7018 )
      ( MAKE-ON-VERIFY ?AUTO_7017 ?AUTO_7018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7027 - BLOCK
      ?AUTO_7028 - BLOCK
    )
    :vars
    (
      ?AUTO_7029 - BLOCK
      ?AUTO_7034 - BLOCK
      ?AUTO_7033 - BLOCK
      ?AUTO_7032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7027 ) ( ON ?AUTO_7029 ?AUTO_7027 ) ( CLEAR ?AUTO_7034 ) ( ON ?AUTO_7033 ?AUTO_7029 ) ( CLEAR ?AUTO_7033 ) ( HOLDING ?AUTO_7032 ) ( CLEAR ?AUTO_7028 ) )
    :subtasks
    ( ( !STACK ?AUTO_7032 ?AUTO_7028 )
      ( MAKE-ON ?AUTO_7027 ?AUTO_7028 )
      ( MAKE-ON-VERIFY ?AUTO_7027 ?AUTO_7028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7037 - BLOCK
      ?AUTO_7038 - BLOCK
    )
    :vars
    (
      ?AUTO_7041 - BLOCK
      ?AUTO_7040 - BLOCK
      ?AUTO_7039 - BLOCK
      ?AUTO_7042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7037 ) ( ON ?AUTO_7041 ?AUTO_7037 ) ( CLEAR ?AUTO_7040 ) ( ON ?AUTO_7039 ?AUTO_7041 ) ( CLEAR ?AUTO_7038 ) ( ON ?AUTO_7042 ?AUTO_7039 ) ( CLEAR ?AUTO_7042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7042 ?AUTO_7039 )
      ( MAKE-ON ?AUTO_7037 ?AUTO_7038 )
      ( MAKE-ON-VERIFY ?AUTO_7037 ?AUTO_7038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7047 - BLOCK
      ?AUTO_7048 - BLOCK
    )
    :vars
    (
      ?AUTO_7053 - BLOCK
      ?AUTO_7052 - BLOCK
      ?AUTO_7054 - BLOCK
      ?AUTO_7049 - BLOCK
      ?AUTO_7055 - BLOCK
      ?AUTO_7056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7047 ) ( ON ?AUTO_7053 ?AUTO_7047 ) ( CLEAR ?AUTO_7052 ) ( ON ?AUTO_7054 ?AUTO_7053 ) ( CLEAR ?AUTO_7048 ) ( ON ?AUTO_7049 ?AUTO_7054 ) ( CLEAR ?AUTO_7049 ) ( HOLDING ?AUTO_7055 ) ( CLEAR ?AUTO_7056 ) )
    :subtasks
    ( ( !STACK ?AUTO_7055 ?AUTO_7056 )
      ( MAKE-ON ?AUTO_7047 ?AUTO_7048 )
      ( MAKE-ON-VERIFY ?AUTO_7047 ?AUTO_7048 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7061 - BLOCK
      ?AUTO_7062 - BLOCK
    )
    :vars
    (
      ?AUTO_7069 - BLOCK
      ?AUTO_7070 - BLOCK
      ?AUTO_7064 - BLOCK
      ?AUTO_7065 - BLOCK
      ?AUTO_7063 - BLOCK
      ?AUTO_7068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7061 ) ( ON ?AUTO_7069 ?AUTO_7061 ) ( CLEAR ?AUTO_7070 ) ( ON ?AUTO_7064 ?AUTO_7069 ) ( ON ?AUTO_7065 ?AUTO_7064 ) ( CLEAR ?AUTO_7065 ) ( CLEAR ?AUTO_7063 ) ( ON ?AUTO_7068 ?AUTO_7062 ) ( CLEAR ?AUTO_7068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7068 ?AUTO_7062 )
      ( MAKE-ON ?AUTO_7061 ?AUTO_7062 )
      ( MAKE-ON-VERIFY ?AUTO_7061 ?AUTO_7062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7073 - BLOCK
      ?AUTO_7074 - BLOCK
    )
    :vars
    (
      ?AUTO_7078 - BLOCK
      ?AUTO_7075 - BLOCK
      ?AUTO_7076 - BLOCK
      ?AUTO_7082 - BLOCK
      ?AUTO_7077 - BLOCK
      ?AUTO_7079 - BLOCK
      ?AUTO_7083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7073 ) ( ON ?AUTO_7078 ?AUTO_7073 ) ( CLEAR ?AUTO_7075 ) ( ON ?AUTO_7076 ?AUTO_7078 ) ( ON ?AUTO_7082 ?AUTO_7076 ) ( CLEAR ?AUTO_7082 ) ( CLEAR ?AUTO_7077 ) ( ON ?AUTO_7079 ?AUTO_7074 ) ( CLEAR ?AUTO_7079 ) ( HOLDING ?AUTO_7083 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7083 )
      ( MAKE-ON ?AUTO_7073 ?AUTO_7074 )
      ( MAKE-ON-VERIFY ?AUTO_7073 ?AUTO_7074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7084 - BLOCK
      ?AUTO_7085 - BLOCK
    )
    :vars
    (
      ?AUTO_7087 - BLOCK
      ?AUTO_7090 - BLOCK
      ?AUTO_7092 - BLOCK
      ?AUTO_7094 - BLOCK
      ?AUTO_7089 - BLOCK
      ?AUTO_7086 - BLOCK
      ?AUTO_7088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7084 ) ( ON ?AUTO_7087 ?AUTO_7084 ) ( CLEAR ?AUTO_7090 ) ( ON ?AUTO_7092 ?AUTO_7087 ) ( ON ?AUTO_7094 ?AUTO_7092 ) ( CLEAR ?AUTO_7094 ) ( CLEAR ?AUTO_7089 ) ( ON ?AUTO_7086 ?AUTO_7085 ) ( ON ?AUTO_7088 ?AUTO_7086 ) ( CLEAR ?AUTO_7088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7088 ?AUTO_7086 )
      ( MAKE-ON ?AUTO_7084 ?AUTO_7085 )
      ( MAKE-ON-VERIFY ?AUTO_7084 ?AUTO_7085 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7097 - BLOCK
      ?AUTO_7098 - BLOCK
    )
    :vars
    (
      ?AUTO_7099 - BLOCK
      ?AUTO_7102 - BLOCK
      ?AUTO_7103 - BLOCK
      ?AUTO_7106 - BLOCK
      ?AUTO_7107 - BLOCK
      ?AUTO_7100 - BLOCK
      ?AUTO_7104 - BLOCK
      ?AUTO_7108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7097 ) ( ON ?AUTO_7099 ?AUTO_7097 ) ( CLEAR ?AUTO_7102 ) ( ON ?AUTO_7103 ?AUTO_7099 ) ( ON ?AUTO_7106 ?AUTO_7103 ) ( CLEAR ?AUTO_7106 ) ( CLEAR ?AUTO_7107 ) ( ON ?AUTO_7100 ?AUTO_7098 ) ( ON ?AUTO_7104 ?AUTO_7100 ) ( CLEAR ?AUTO_7104 ) ( HOLDING ?AUTO_7108 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7108 )
      ( MAKE-ON ?AUTO_7097 ?AUTO_7098 )
      ( MAKE-ON-VERIFY ?AUTO_7097 ?AUTO_7098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7109 - BLOCK
      ?AUTO_7110 - BLOCK
    )
    :vars
    (
      ?AUTO_7114 - BLOCK
      ?AUTO_7117 - BLOCK
      ?AUTO_7119 - BLOCK
      ?AUTO_7113 - BLOCK
      ?AUTO_7112 - BLOCK
      ?AUTO_7111 - BLOCK
      ?AUTO_7118 - BLOCK
      ?AUTO_7120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7109 ) ( ON ?AUTO_7114 ?AUTO_7109 ) ( CLEAR ?AUTO_7117 ) ( ON ?AUTO_7119 ?AUTO_7114 ) ( ON ?AUTO_7113 ?AUTO_7119 ) ( CLEAR ?AUTO_7113 ) ( CLEAR ?AUTO_7112 ) ( ON ?AUTO_7111 ?AUTO_7110 ) ( ON ?AUTO_7118 ?AUTO_7111 ) ( ON ?AUTO_7120 ?AUTO_7118 ) ( CLEAR ?AUTO_7120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7120 ?AUTO_7118 )
      ( MAKE-ON ?AUTO_7109 ?AUTO_7110 )
      ( MAKE-ON-VERIFY ?AUTO_7109 ?AUTO_7110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7123 - BLOCK
      ?AUTO_7124 - BLOCK
    )
    :vars
    (
      ?AUTO_7134 - BLOCK
      ?AUTO_7129 - BLOCK
      ?AUTO_7132 - BLOCK
      ?AUTO_7130 - BLOCK
      ?AUTO_7127 - BLOCK
      ?AUTO_7128 - BLOCK
      ?AUTO_7133 - BLOCK
      ?AUTO_7126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7123 ) ( ON ?AUTO_7134 ?AUTO_7123 ) ( CLEAR ?AUTO_7129 ) ( ON ?AUTO_7132 ?AUTO_7134 ) ( CLEAR ?AUTO_7130 ) ( ON ?AUTO_7127 ?AUTO_7124 ) ( ON ?AUTO_7128 ?AUTO_7127 ) ( ON ?AUTO_7133 ?AUTO_7128 ) ( CLEAR ?AUTO_7133 ) ( HOLDING ?AUTO_7126 ) ( CLEAR ?AUTO_7132 ) )
    :subtasks
    ( ( !STACK ?AUTO_7126 ?AUTO_7132 )
      ( MAKE-ON ?AUTO_7123 ?AUTO_7124 )
      ( MAKE-ON-VERIFY ?AUTO_7123 ?AUTO_7124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7137 - BLOCK
      ?AUTO_7138 - BLOCK
    )
    :vars
    (
      ?AUTO_7140 - BLOCK
      ?AUTO_7145 - BLOCK
      ?AUTO_7141 - BLOCK
      ?AUTO_7147 - BLOCK
      ?AUTO_7148 - BLOCK
      ?AUTO_7146 - BLOCK
      ?AUTO_7139 - BLOCK
      ?AUTO_7144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7137 ) ( ON ?AUTO_7140 ?AUTO_7137 ) ( CLEAR ?AUTO_7145 ) ( ON ?AUTO_7141 ?AUTO_7140 ) ( CLEAR ?AUTO_7147 ) ( ON ?AUTO_7148 ?AUTO_7138 ) ( ON ?AUTO_7146 ?AUTO_7148 ) ( ON ?AUTO_7139 ?AUTO_7146 ) ( CLEAR ?AUTO_7141 ) ( ON ?AUTO_7144 ?AUTO_7139 ) ( CLEAR ?AUTO_7144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7144 ?AUTO_7139 )
      ( MAKE-ON ?AUTO_7137 ?AUTO_7138 )
      ( MAKE-ON-VERIFY ?AUTO_7137 ?AUTO_7138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7151 - BLOCK
      ?AUTO_7152 - BLOCK
    )
    :vars
    (
      ?AUTO_7153 - BLOCK
      ?AUTO_7155 - BLOCK
      ?AUTO_7154 - BLOCK
      ?AUTO_7161 - BLOCK
      ?AUTO_7160 - BLOCK
      ?AUTO_7158 - BLOCK
      ?AUTO_7159 - BLOCK
      ?AUTO_7162 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7151 ) ( ON ?AUTO_7153 ?AUTO_7151 ) ( CLEAR ?AUTO_7155 ) ( CLEAR ?AUTO_7154 ) ( ON ?AUTO_7161 ?AUTO_7152 ) ( ON ?AUTO_7160 ?AUTO_7161 ) ( ON ?AUTO_7158 ?AUTO_7160 ) ( ON ?AUTO_7159 ?AUTO_7158 ) ( CLEAR ?AUTO_7159 ) ( HOLDING ?AUTO_7162 ) ( CLEAR ?AUTO_7153 ) )
    :subtasks
    ( ( !STACK ?AUTO_7162 ?AUTO_7153 )
      ( MAKE-ON ?AUTO_7151 ?AUTO_7152 )
      ( MAKE-ON-VERIFY ?AUTO_7151 ?AUTO_7152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7165 - BLOCK
      ?AUTO_7166 - BLOCK
    )
    :vars
    (
      ?AUTO_7171 - BLOCK
      ?AUTO_7169 - BLOCK
      ?AUTO_7173 - BLOCK
      ?AUTO_7167 - BLOCK
      ?AUTO_7168 - BLOCK
      ?AUTO_7170 - BLOCK
      ?AUTO_7175 - BLOCK
      ?AUTO_7176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7165 ) ( ON ?AUTO_7171 ?AUTO_7165 ) ( CLEAR ?AUTO_7169 ) ( CLEAR ?AUTO_7173 ) ( ON ?AUTO_7167 ?AUTO_7166 ) ( ON ?AUTO_7168 ?AUTO_7167 ) ( ON ?AUTO_7170 ?AUTO_7168 ) ( ON ?AUTO_7175 ?AUTO_7170 ) ( CLEAR ?AUTO_7175 ) ( CLEAR ?AUTO_7171 ) ( ON-TABLE ?AUTO_7176 ) ( CLEAR ?AUTO_7176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7176 )
      ( MAKE-ON ?AUTO_7165 ?AUTO_7166 )
      ( MAKE-ON-VERIFY ?AUTO_7165 ?AUTO_7166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7178 - BLOCK
      ?AUTO_7179 - BLOCK
    )
    :vars
    (
      ?AUTO_7184 - BLOCK
      ?AUTO_7189 - BLOCK
      ?AUTO_7180 - BLOCK
      ?AUTO_7186 - BLOCK
      ?AUTO_7181 - BLOCK
      ?AUTO_7188 - BLOCK
      ?AUTO_7187 - BLOCK
      ?AUTO_7185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7178 ) ( CLEAR ?AUTO_7184 ) ( CLEAR ?AUTO_7189 ) ( ON ?AUTO_7180 ?AUTO_7179 ) ( ON ?AUTO_7186 ?AUTO_7180 ) ( ON ?AUTO_7181 ?AUTO_7186 ) ( ON ?AUTO_7188 ?AUTO_7181 ) ( CLEAR ?AUTO_7188 ) ( ON-TABLE ?AUTO_7187 ) ( CLEAR ?AUTO_7187 ) ( HOLDING ?AUTO_7185 ) ( CLEAR ?AUTO_7178 ) )
    :subtasks
    ( ( !STACK ?AUTO_7185 ?AUTO_7178 )
      ( MAKE-ON ?AUTO_7178 ?AUTO_7179 )
      ( MAKE-ON-VERIFY ?AUTO_7178 ?AUTO_7179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7192 - BLOCK
      ?AUTO_7193 - BLOCK
    )
    :vars
    (
      ?AUTO_7199 - BLOCK
      ?AUTO_7195 - BLOCK
      ?AUTO_7198 - BLOCK
      ?AUTO_7194 - BLOCK
      ?AUTO_7200 - BLOCK
      ?AUTO_7201 - BLOCK
      ?AUTO_7202 - BLOCK
      ?AUTO_7203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7192 ) ( CLEAR ?AUTO_7199 ) ( CLEAR ?AUTO_7195 ) ( ON ?AUTO_7198 ?AUTO_7193 ) ( ON ?AUTO_7194 ?AUTO_7198 ) ( ON ?AUTO_7200 ?AUTO_7194 ) ( ON ?AUTO_7201 ?AUTO_7200 ) ( CLEAR ?AUTO_7201 ) ( ON-TABLE ?AUTO_7202 ) ( CLEAR ?AUTO_7192 ) ( ON ?AUTO_7203 ?AUTO_7202 ) ( CLEAR ?AUTO_7203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7203 ?AUTO_7202 )
      ( MAKE-ON ?AUTO_7192 ?AUTO_7193 )
      ( MAKE-ON-VERIFY ?AUTO_7192 ?AUTO_7193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7212 - BLOCK
      ?AUTO_7213 - BLOCK
    )
    :vars
    (
      ?AUTO_7217 - BLOCK
      ?AUTO_7214 - BLOCK
      ?AUTO_7218 - BLOCK
      ?AUTO_7220 - BLOCK
      ?AUTO_7216 - BLOCK
      ?AUTO_7223 - BLOCK
      ?AUTO_7221 - BLOCK
      ?AUTO_7222 - BLOCK
      ?AUTO_7225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7212 ) ( CLEAR ?AUTO_7217 ) ( CLEAR ?AUTO_7214 ) ( ON ?AUTO_7218 ?AUTO_7213 ) ( ON ?AUTO_7220 ?AUTO_7218 ) ( ON ?AUTO_7216 ?AUTO_7220 ) ( ON ?AUTO_7223 ?AUTO_7216 ) ( CLEAR ?AUTO_7223 ) ( ON-TABLE ?AUTO_7221 ) ( CLEAR ?AUTO_7221 ) ( CLEAR ?AUTO_7212 ) ( ON ?AUTO_7222 ?AUTO_7225 ) ( CLEAR ?AUTO_7222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7222 ?AUTO_7225 )
      ( MAKE-ON ?AUTO_7212 ?AUTO_7213 )
      ( MAKE-ON-VERIFY ?AUTO_7212 ?AUTO_7213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7228 - BLOCK
      ?AUTO_7229 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7228 ) ( CLEAR ?AUTO_7229 ) )
    :subtasks
    ( ( !STACK ?AUTO_7228 ?AUTO_7229 )
      ( MAKE-ON-VERIFY ?AUTO_7228 ?AUTO_7229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7232 - BLOCK
      ?AUTO_7233 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7233 ) ( ON-TABLE ?AUTO_7232 ) ( CLEAR ?AUTO_7232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7232 )
      ( MAKE-ON ?AUTO_7232 ?AUTO_7233 )
      ( MAKE-ON-VERIFY ?AUTO_7232 ?AUTO_7233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7237 - BLOCK
      ?AUTO_7238 - BLOCK
    )
    :vars
    (
      ?AUTO_7242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7237 ) ( CLEAR ?AUTO_7237 ) ( HOLDING ?AUTO_7238 ) ( CLEAR ?AUTO_7242 ) )
    :subtasks
    ( ( !STACK ?AUTO_7238 ?AUTO_7242 )
      ( MAKE-ON ?AUTO_7237 ?AUTO_7238 )
      ( MAKE-ON-VERIFY ?AUTO_7237 ?AUTO_7238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7560 - BLOCK
      ?AUTO_7561 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7560 ) ( CLEAR ?AUTO_7561 ) )
    :subtasks
    ( ( !STACK ?AUTO_7560 ?AUTO_7561 )
      ( MAKE-ON-VERIFY ?AUTO_7560 ?AUTO_7561 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7564 - BLOCK
      ?AUTO_7565 - BLOCK
    )
    :vars
    (
      ?AUTO_7569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7565 ) ( ON ?AUTO_7564 ?AUTO_7569 ) ( CLEAR ?AUTO_7564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7564 ?AUTO_7569 )
      ( MAKE-ON ?AUTO_7564 ?AUTO_7565 )
      ( MAKE-ON-VERIFY ?AUTO_7564 ?AUTO_7565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7570 - BLOCK
      ?AUTO_7571 - BLOCK
    )
    :vars
    (
      ?AUTO_7574 - BLOCK
      ?AUTO_7575 - BLOCK
      ?AUTO_7576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7571 ) ( ON ?AUTO_7570 ?AUTO_7574 ) ( CLEAR ?AUTO_7570 ) ( HOLDING ?AUTO_7575 ) ( CLEAR ?AUTO_7576 ) )
    :subtasks
    ( ( !STACK ?AUTO_7575 ?AUTO_7576 )
      ( MAKE-ON ?AUTO_7570 ?AUTO_7571 )
      ( MAKE-ON-VERIFY ?AUTO_7570 ?AUTO_7571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7615 - BLOCK
      ?AUTO_7616 - BLOCK
    )
    :vars
    (
      ?AUTO_7619 - BLOCK
      ?AUTO_7617 - BLOCK
      ?AUTO_7621 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7619 ) ( ON ?AUTO_7617 ?AUTO_7616 ) ( CLEAR ?AUTO_7617 ) ( HOLDING ?AUTO_7615 ) ( CLEAR ?AUTO_7621 ) )
    :subtasks
    ( ( !STACK ?AUTO_7615 ?AUTO_7621 )
      ( MAKE-ON ?AUTO_7615 ?AUTO_7616 )
      ( MAKE-ON-VERIFY ?AUTO_7615 ?AUTO_7616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7644 - BLOCK
      ?AUTO_7645 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7644 ) ( CLEAR ?AUTO_7645 ) )
    :subtasks
    ( ( !STACK ?AUTO_7644 ?AUTO_7645 )
      ( MAKE-ON-VERIFY ?AUTO_7644 ?AUTO_7645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7648 - BLOCK
      ?AUTO_7649 - BLOCK
    )
    :vars
    (
      ?AUTO_7653 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7649 ) ( ON ?AUTO_7648 ?AUTO_7653 ) ( CLEAR ?AUTO_7648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7648 ?AUTO_7653 )
      ( MAKE-ON ?AUTO_7648 ?AUTO_7649 )
      ( MAKE-ON-VERIFY ?AUTO_7648 ?AUTO_7649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7654 - BLOCK
      ?AUTO_7655 - BLOCK
    )
    :vars
    (
      ?AUTO_7658 - BLOCK
      ?AUTO_7659 - BLOCK
      ?AUTO_7660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7655 ) ( ON ?AUTO_7654 ?AUTO_7658 ) ( CLEAR ?AUTO_7654 ) ( HOLDING ?AUTO_7659 ) ( CLEAR ?AUTO_7660 ) )
    :subtasks
    ( ( !STACK ?AUTO_7659 ?AUTO_7660 )
      ( MAKE-ON ?AUTO_7654 ?AUTO_7655 )
      ( MAKE-ON-VERIFY ?AUTO_7654 ?AUTO_7655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7661 - BLOCK
      ?AUTO_7662 - BLOCK
    )
    :vars
    (
      ?AUTO_7665 - BLOCK
      ?AUTO_7667 - BLOCK
      ?AUTO_7666 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7662 ) ( ON ?AUTO_7661 ?AUTO_7665 ) ( CLEAR ?AUTO_7667 ) ( ON ?AUTO_7666 ?AUTO_7661 ) ( CLEAR ?AUTO_7666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7666 ?AUTO_7661 )
      ( MAKE-ON ?AUTO_7661 ?AUTO_7662 )
      ( MAKE-ON-VERIFY ?AUTO_7661 ?AUTO_7662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7670 - BLOCK
      ?AUTO_7671 - BLOCK
    )
    :vars
    (
      ?AUTO_7676 - BLOCK
      ?AUTO_7673 - BLOCK
      ?AUTO_7672 - BLOCK
      ?AUTO_7678 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7670 ?AUTO_7676 ) ( CLEAR ?AUTO_7673 ) ( ON ?AUTO_7672 ?AUTO_7670 ) ( CLEAR ?AUTO_7672 ) ( HOLDING ?AUTO_7671 ) ( CLEAR ?AUTO_7678 ) )
    :subtasks
    ( ( !STACK ?AUTO_7671 ?AUTO_7678 )
      ( MAKE-ON ?AUTO_7670 ?AUTO_7671 )
      ( MAKE-ON-VERIFY ?AUTO_7670 ?AUTO_7671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7681 - BLOCK
      ?AUTO_7682 - BLOCK
    )
    :vars
    (
      ?AUTO_7687 - BLOCK
      ?AUTO_7683 - BLOCK
      ?AUTO_7686 - BLOCK
      ?AUTO_7688 - BLOCK
      ?AUTO_7689 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7682 ) ( ON ?AUTO_7681 ?AUTO_7687 ) ( CLEAR ?AUTO_7683 ) ( ON ?AUTO_7686 ?AUTO_7681 ) ( CLEAR ?AUTO_7686 ) ( HOLDING ?AUTO_7688 ) ( CLEAR ?AUTO_7689 ) )
    :subtasks
    ( ( !STACK ?AUTO_7688 ?AUTO_7689 )
      ( MAKE-ON ?AUTO_7681 ?AUTO_7682 )
      ( MAKE-ON-VERIFY ?AUTO_7681 ?AUTO_7682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7885 - BLOCK
      ?AUTO_7886 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7885 ) ( CLEAR ?AUTO_7886 ) )
    :subtasks
    ( ( !STACK ?AUTO_7885 ?AUTO_7886 )
      ( MAKE-ON-VERIFY ?AUTO_7885 ?AUTO_7886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7889 - BLOCK
      ?AUTO_7890 - BLOCK
    )
    :vars
    (
      ?AUTO_7894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7890 ) ( ON ?AUTO_7889 ?AUTO_7894 ) ( CLEAR ?AUTO_7889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7889 ?AUTO_7894 )
      ( MAKE-ON ?AUTO_7889 ?AUTO_7890 )
      ( MAKE-ON-VERIFY ?AUTO_7889 ?AUTO_7890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7895 - BLOCK
      ?AUTO_7896 - BLOCK
    )
    :vars
    (
      ?AUTO_7899 - BLOCK
      ?AUTO_7901 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7895 ?AUTO_7899 ) ( CLEAR ?AUTO_7895 ) ( HOLDING ?AUTO_7896 ) ( CLEAR ?AUTO_7901 ) )
    :subtasks
    ( ( !STACK ?AUTO_7896 ?AUTO_7901 )
      ( MAKE-ON ?AUTO_7895 ?AUTO_7896 )
      ( MAKE-ON-VERIFY ?AUTO_7895 ?AUTO_7896 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7903 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7903 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7903 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7903 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7905 - BLOCK
    )
    :vars
    (
      ?AUTO_7908 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7905 ?AUTO_7908 ) ( CLEAR ?AUTO_7905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7905 ?AUTO_7908 )
      ( MAKE-ON-TABLE ?AUTO_7905 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7911 - BLOCK
      ?AUTO_7912 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7911 ) ( CLEAR ?AUTO_7912 ) )
    :subtasks
    ( ( !STACK ?AUTO_7911 ?AUTO_7912 )
      ( MAKE-ON-VERIFY ?AUTO_7911 ?AUTO_7912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7915 - BLOCK
      ?AUTO_7916 - BLOCK
    )
    :vars
    (
      ?AUTO_7920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7916 ) ( ON ?AUTO_7915 ?AUTO_7920 ) ( CLEAR ?AUTO_7915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7915 ?AUTO_7920 )
      ( MAKE-ON ?AUTO_7915 ?AUTO_7916 )
      ( MAKE-ON-VERIFY ?AUTO_7915 ?AUTO_7916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7921 - BLOCK
      ?AUTO_7922 - BLOCK
    )
    :vars
    (
      ?AUTO_7925 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7921 ?AUTO_7925 ) ( CLEAR ?AUTO_7921 ) ( HOLDING ?AUTO_7922 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7922 )
      ( MAKE-ON ?AUTO_7921 ?AUTO_7922 )
      ( MAKE-ON-VERIFY ?AUTO_7921 ?AUTO_7922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7927 - BLOCK
      ?AUTO_7928 - BLOCK
    )
    :vars
    (
      ?AUTO_7931 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7927 ?AUTO_7931 ) ( ON ?AUTO_7928 ?AUTO_7927 ) ( CLEAR ?AUTO_7928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7928 ?AUTO_7927 )
      ( MAKE-ON ?AUTO_7927 ?AUTO_7928 )
      ( MAKE-ON-VERIFY ?AUTO_7927 ?AUTO_7928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7936 - BLOCK
      ?AUTO_7937 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7936 ) ( CLEAR ?AUTO_7937 ) )
    :subtasks
    ( ( !STACK ?AUTO_7936 ?AUTO_7937 )
      ( MAKE-ON-VERIFY ?AUTO_7936 ?AUTO_7937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7940 - BLOCK
      ?AUTO_7941 - BLOCK
    )
    :vars
    (
      ?AUTO_7945 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7941 ) ( ON ?AUTO_7940 ?AUTO_7945 ) ( CLEAR ?AUTO_7940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7940 ?AUTO_7945 )
      ( MAKE-ON ?AUTO_7940 ?AUTO_7941 )
      ( MAKE-ON-VERIFY ?AUTO_7940 ?AUTO_7941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7946 - BLOCK
      ?AUTO_7947 - BLOCK
    )
    :vars
    (
      ?AUTO_7950 - BLOCK
      ?AUTO_7952 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7946 ?AUTO_7950 ) ( CLEAR ?AUTO_7946 ) ( HOLDING ?AUTO_7947 ) ( CLEAR ?AUTO_7952 ) )
    :subtasks
    ( ( !STACK ?AUTO_7947 ?AUTO_7952 )
      ( MAKE-ON ?AUTO_7946 ?AUTO_7947 )
      ( MAKE-ON-VERIFY ?AUTO_7946 ?AUTO_7947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7955 - BLOCK
      ?AUTO_7956 - BLOCK
    )
    :vars
    (
      ?AUTO_7958 - BLOCK
      ?AUTO_7960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7956 ) ( ON ?AUTO_7955 ?AUTO_7958 ) ( CLEAR ?AUTO_7955 ) ( HOLDING ?AUTO_7960 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7960 )
      ( MAKE-ON ?AUTO_7955 ?AUTO_7956 )
      ( MAKE-ON-VERIFY ?AUTO_7955 ?AUTO_7956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7961 - BLOCK
      ?AUTO_7962 - BLOCK
    )
    :vars
    (
      ?AUTO_7965 - BLOCK
      ?AUTO_7966 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7961 ?AUTO_7965 ) ( CLEAR ?AUTO_7961 ) ( ON ?AUTO_7966 ?AUTO_7962 ) ( CLEAR ?AUTO_7966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7966 ?AUTO_7962 )
      ( MAKE-ON ?AUTO_7961 ?AUTO_7962 )
      ( MAKE-ON-VERIFY ?AUTO_7961 ?AUTO_7962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7971 - BLOCK
      ?AUTO_7972 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7971 ) ( CLEAR ?AUTO_7972 ) )
    :subtasks
    ( ( !STACK ?AUTO_7971 ?AUTO_7972 )
      ( MAKE-ON-VERIFY ?AUTO_7971 ?AUTO_7972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7975 - BLOCK
      ?AUTO_7976 - BLOCK
    )
    :vars
    (
      ?AUTO_7980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7976 ) ( ON ?AUTO_7975 ?AUTO_7980 ) ( CLEAR ?AUTO_7975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7975 ?AUTO_7980 )
      ( MAKE-ON ?AUTO_7975 ?AUTO_7976 )
      ( MAKE-ON-VERIFY ?AUTO_7975 ?AUTO_7976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7981 - BLOCK
      ?AUTO_7982 - BLOCK
    )
    :vars
    (
      ?AUTO_7985 - BLOCK
      ?AUTO_7987 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7981 ?AUTO_7985 ) ( CLEAR ?AUTO_7981 ) ( HOLDING ?AUTO_7982 ) ( CLEAR ?AUTO_7987 ) )
    :subtasks
    ( ( !STACK ?AUTO_7982 ?AUTO_7987 )
      ( MAKE-ON ?AUTO_7981 ?AUTO_7982 )
      ( MAKE-ON-VERIFY ?AUTO_7981 ?AUTO_7982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7988 - BLOCK
      ?AUTO_7989 - BLOCK
    )
    :vars
    (
      ?AUTO_7992 - BLOCK
      ?AUTO_7993 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7988 ?AUTO_7992 ) ( CLEAR ?AUTO_7993 ) ( ON ?AUTO_7989 ?AUTO_7988 ) ( CLEAR ?AUTO_7989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7989 ?AUTO_7988 )
      ( MAKE-ON ?AUTO_7988 ?AUTO_7989 )
      ( MAKE-ON-VERIFY ?AUTO_7988 ?AUTO_7989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7996 - BLOCK
      ?AUTO_7997 - BLOCK
    )
    :vars
    (
      ?AUTO_8001 - BLOCK
      ?AUTO_7998 - BLOCK
      ?AUTO_8003 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7996 ?AUTO_8001 ) ( ON ?AUTO_7997 ?AUTO_7996 ) ( CLEAR ?AUTO_7997 ) ( HOLDING ?AUTO_7998 ) ( CLEAR ?AUTO_8003 ) )
    :subtasks
    ( ( !STACK ?AUTO_7998 ?AUTO_8003 )
      ( MAKE-ON ?AUTO_7996 ?AUTO_7997 )
      ( MAKE-ON-VERIFY ?AUTO_7996 ?AUTO_7997 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8011 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8011 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8011 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8011 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8013 - BLOCK
    )
    :vars
    (
      ?AUTO_8016 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8013 ?AUTO_8016 ) ( CLEAR ?AUTO_8013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8013 ?AUTO_8016 )
      ( MAKE-ON-TABLE ?AUTO_8013 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8013 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8017 - BLOCK
    )
    :vars
    (
      ?AUTO_8019 - BLOCK
      ?AUTO_8020 - BLOCK
      ?AUTO_8021 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8017 ?AUTO_8019 ) ( CLEAR ?AUTO_8017 ) ( HOLDING ?AUTO_8020 ) ( CLEAR ?AUTO_8021 ) )
    :subtasks
    ( ( !STACK ?AUTO_8020 ?AUTO_8021 )
      ( MAKE-ON-TABLE ?AUTO_8017 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8017 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8026 - BLOCK
    )
    :vars
    (
      ?AUTO_8028 - BLOCK
      ?AUTO_8030 - BLOCK
      ?AUTO_8029 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8026 ?AUTO_8028 ) ( CLEAR ?AUTO_8030 ) ( ON ?AUTO_8029 ?AUTO_8026 ) ( CLEAR ?AUTO_8029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8029 ?AUTO_8026 )
      ( MAKE-ON-TABLE ?AUTO_8026 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8026 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8033 - BLOCK
    )
    :vars
    (
      ?AUTO_8035 - BLOCK
      ?AUTO_8037 - BLOCK
      ?AUTO_8036 - BLOCK
      ?AUTO_8038 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8033 ?AUTO_8035 ) ( CLEAR ?AUTO_8037 ) ( ON ?AUTO_8036 ?AUTO_8033 ) ( CLEAR ?AUTO_8036 ) ( HOLDING ?AUTO_8038 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8038 )
      ( MAKE-ON-TABLE ?AUTO_8033 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8033 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8039 - BLOCK
    )
    :vars
    (
      ?AUTO_8041 - BLOCK
      ?AUTO_8040 - BLOCK
      ?AUTO_8044 - BLOCK
      ?AUTO_8043 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8039 ?AUTO_8041 ) ( CLEAR ?AUTO_8040 ) ( ON ?AUTO_8044 ?AUTO_8039 ) ( ON ?AUTO_8043 ?AUTO_8044 ) ( CLEAR ?AUTO_8043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8043 ?AUTO_8044 )
      ( MAKE-ON-TABLE ?AUTO_8039 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8039 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8048 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8048 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8048 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8048 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8050 - BLOCK
    )
    :vars
    (
      ?AUTO_8053 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8050 ?AUTO_8053 ) ( CLEAR ?AUTO_8050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8050 ?AUTO_8053 )
      ( MAKE-ON-TABLE ?AUTO_8050 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8050 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8054 - BLOCK
    )
    :vars
    (
      ?AUTO_8056 - BLOCK
      ?AUTO_8057 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8054 ?AUTO_8056 ) ( CLEAR ?AUTO_8054 ) ( HOLDING ?AUTO_8057 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8057 )
      ( MAKE-ON-TABLE ?AUTO_8054 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8054 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8058 - BLOCK
    )
    :vars
    (
      ?AUTO_8060 - BLOCK
      ?AUTO_8061 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8058 ?AUTO_8060 ) ( ON ?AUTO_8061 ?AUTO_8058 ) ( CLEAR ?AUTO_8061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8061 ?AUTO_8058 )
      ( MAKE-ON-TABLE ?AUTO_8058 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8058 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8064 - BLOCK
    )
    :vars
    (
      ?AUTO_8065 - BLOCK
      ?AUTO_8066 - BLOCK
      ?AUTO_8068 - BLOCK
      ?AUTO_8069 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8064 ?AUTO_8065 ) ( ON ?AUTO_8066 ?AUTO_8064 ) ( CLEAR ?AUTO_8066 ) ( HOLDING ?AUTO_8068 ) ( CLEAR ?AUTO_8069 ) )
    :subtasks
    ( ( !STACK ?AUTO_8068 ?AUTO_8069 )
      ( MAKE-ON-TABLE ?AUTO_8064 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8064 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8074 - BLOCK
    )
    :vars
    (
      ?AUTO_8076 - BLOCK
      ?AUTO_8079 - BLOCK
      ?AUTO_8075 - BLOCK
      ?AUTO_8078 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8074 ?AUTO_8076 ) ( ON ?AUTO_8079 ?AUTO_8074 ) ( CLEAR ?AUTO_8075 ) ( ON ?AUTO_8078 ?AUTO_8079 ) ( CLEAR ?AUTO_8078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8078 ?AUTO_8079 )
      ( MAKE-ON-TABLE ?AUTO_8074 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8074 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8082 - BLOCK
    )
    :vars
    (
      ?AUTO_8086 - BLOCK
      ?AUTO_8087 - BLOCK
      ?AUTO_8085 - BLOCK
      ?AUTO_8084 - BLOCK
      ?AUTO_8088 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8082 ?AUTO_8086 ) ( ON ?AUTO_8087 ?AUTO_8082 ) ( CLEAR ?AUTO_8085 ) ( ON ?AUTO_8084 ?AUTO_8087 ) ( CLEAR ?AUTO_8084 ) ( HOLDING ?AUTO_8088 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8088 )
      ( MAKE-ON-TABLE ?AUTO_8082 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8082 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8089 - BLOCK
    )
    :vars
    (
      ?AUTO_8091 - BLOCK
      ?AUTO_8092 - BLOCK
      ?AUTO_8095 - BLOCK
      ?AUTO_8090 - BLOCK
      ?AUTO_8094 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8089 ?AUTO_8091 ) ( ON ?AUTO_8092 ?AUTO_8089 ) ( CLEAR ?AUTO_8095 ) ( ON ?AUTO_8090 ?AUTO_8092 ) ( ON ?AUTO_8094 ?AUTO_8090 ) ( CLEAR ?AUTO_8094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8094 ?AUTO_8090 )
      ( MAKE-ON-TABLE ?AUTO_8089 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8089 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8100 - BLOCK
      ?AUTO_8101 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8100 ) ( CLEAR ?AUTO_8101 ) )
    :subtasks
    ( ( !STACK ?AUTO_8100 ?AUTO_8101 )
      ( MAKE-ON-VERIFY ?AUTO_8100 ?AUTO_8101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8104 - BLOCK
      ?AUTO_8105 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8105 ) ( ON-TABLE ?AUTO_8104 ) ( CLEAR ?AUTO_8104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8104 )
      ( MAKE-ON ?AUTO_8104 ?AUTO_8105 )
      ( MAKE-ON-VERIFY ?AUTO_8104 ?AUTO_8105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8109 - BLOCK
      ?AUTO_8110 - BLOCK
    )
    :vars
    (
      ?AUTO_8113 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8110 ) ( ON-TABLE ?AUTO_8109 ) ( CLEAR ?AUTO_8109 ) ( HOLDING ?AUTO_8113 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8113 )
      ( MAKE-ON ?AUTO_8109 ?AUTO_8110 )
      ( MAKE-ON-VERIFY ?AUTO_8109 ?AUTO_8110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8114 - BLOCK
      ?AUTO_8115 - BLOCK
    )
    :vars
    (
      ?AUTO_8118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8114 ) ( CLEAR ?AUTO_8114 ) ( ON ?AUTO_8118 ?AUTO_8115 ) ( CLEAR ?AUTO_8118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8118 ?AUTO_8115 )
      ( MAKE-ON ?AUTO_8114 ?AUTO_8115 )
      ( MAKE-ON-VERIFY ?AUTO_8114 ?AUTO_8115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8121 - BLOCK
      ?AUTO_8122 - BLOCK
    )
    :vars
    (
      ?AUTO_8124 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8124 ?AUTO_8122 ) ( CLEAR ?AUTO_8124 ) ( HOLDING ?AUTO_8121 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8121 )
      ( MAKE-ON ?AUTO_8121 ?AUTO_8122 )
      ( MAKE-ON-VERIFY ?AUTO_8121 ?AUTO_8122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8127 - BLOCK
      ?AUTO_8128 - BLOCK
    )
    :vars
    (
      ?AUTO_8131 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8131 ?AUTO_8128 ) ( ON ?AUTO_8127 ?AUTO_8131 ) ( CLEAR ?AUTO_8127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8127 ?AUTO_8131 )
      ( MAKE-ON ?AUTO_8127 ?AUTO_8128 )
      ( MAKE-ON-VERIFY ?AUTO_8127 ?AUTO_8128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8134 - BLOCK
      ?AUTO_8135 - BLOCK
    )
    :vars
    (
      ?AUTO_8138 - BLOCK
      ?AUTO_8139 - BLOCK
      ?AUTO_8140 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8138 ?AUTO_8135 ) ( ON ?AUTO_8134 ?AUTO_8138 ) ( CLEAR ?AUTO_8134 ) ( HOLDING ?AUTO_8139 ) ( CLEAR ?AUTO_8140 ) )
    :subtasks
    ( ( !STACK ?AUTO_8139 ?AUTO_8140 )
      ( MAKE-ON ?AUTO_8134 ?AUTO_8135 )
      ( MAKE-ON-VERIFY ?AUTO_8134 ?AUTO_8135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8149 - BLOCK
      ?AUTO_8150 - BLOCK
    )
    :vars
    (
      ?AUTO_8151 - BLOCK
      ?AUTO_8155 - BLOCK
      ?AUTO_8153 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8151 ?AUTO_8150 ) ( ON ?AUTO_8149 ?AUTO_8151 ) ( CLEAR ?AUTO_8155 ) ( ON ?AUTO_8153 ?AUTO_8149 ) ( CLEAR ?AUTO_8153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8153 ?AUTO_8149 )
      ( MAKE-ON ?AUTO_8149 ?AUTO_8150 )
      ( MAKE-ON-VERIFY ?AUTO_8149 ?AUTO_8150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8158 - BLOCK
      ?AUTO_8159 - BLOCK
    )
    :vars
    (
      ?AUTO_8162 - BLOCK
      ?AUTO_8163 - BLOCK
      ?AUTO_8164 - BLOCK
      ?AUTO_8165 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8162 ?AUTO_8159 ) ( ON ?AUTO_8158 ?AUTO_8162 ) ( CLEAR ?AUTO_8163 ) ( ON ?AUTO_8164 ?AUTO_8158 ) ( CLEAR ?AUTO_8164 ) ( HOLDING ?AUTO_8165 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8165 )
      ( MAKE-ON ?AUTO_8158 ?AUTO_8159 )
      ( MAKE-ON-VERIFY ?AUTO_8158 ?AUTO_8159 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8166 - BLOCK
      ?AUTO_8167 - BLOCK
    )
    :vars
    (
      ?AUTO_8172 - BLOCK
      ?AUTO_8173 - BLOCK
      ?AUTO_8168 - BLOCK
      ?AUTO_8171 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8172 ?AUTO_8167 ) ( ON ?AUTO_8166 ?AUTO_8172 ) ( CLEAR ?AUTO_8173 ) ( ON ?AUTO_8168 ?AUTO_8166 ) ( ON ?AUTO_8171 ?AUTO_8168 ) ( CLEAR ?AUTO_8171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8171 ?AUTO_8168 )
      ( MAKE-ON ?AUTO_8166 ?AUTO_8167 )
      ( MAKE-ON-VERIFY ?AUTO_8166 ?AUTO_8167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8178 - BLOCK
      ?AUTO_8179 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8178 ) ( CLEAR ?AUTO_8179 ) )
    :subtasks
    ( ( !STACK ?AUTO_8178 ?AUTO_8179 )
      ( MAKE-ON-VERIFY ?AUTO_8178 ?AUTO_8179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8182 - BLOCK
      ?AUTO_8183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8183 ) ( ON-TABLE ?AUTO_8182 ) ( CLEAR ?AUTO_8182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8182 )
      ( MAKE-ON ?AUTO_8182 ?AUTO_8183 )
      ( MAKE-ON-VERIFY ?AUTO_8182 ?AUTO_8183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8187 - BLOCK
      ?AUTO_8188 - BLOCK
    )
    :vars
    (
      ?AUTO_8192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8187 ) ( CLEAR ?AUTO_8187 ) ( HOLDING ?AUTO_8188 ) ( CLEAR ?AUTO_8192 ) )
    :subtasks
    ( ( !STACK ?AUTO_8188 ?AUTO_8192 )
      ( MAKE-ON ?AUTO_8187 ?AUTO_8188 )
      ( MAKE-ON-VERIFY ?AUTO_8187 ?AUTO_8188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8197 - BLOCK
      ?AUTO_8198 - BLOCK
    )
    :vars
    (
      ?AUTO_8202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8198 ) ( ON ?AUTO_8197 ?AUTO_8202 ) ( CLEAR ?AUTO_8197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8197 ?AUTO_8202 )
      ( MAKE-ON ?AUTO_8197 ?AUTO_8198 )
      ( MAKE-ON-VERIFY ?AUTO_8197 ?AUTO_8198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8203 - BLOCK
      ?AUTO_8204 - BLOCK
    )
    :vars
    (
      ?AUTO_8205 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8203 ?AUTO_8205 ) ( CLEAR ?AUTO_8203 ) ( HOLDING ?AUTO_8204 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8204 )
      ( MAKE-ON ?AUTO_8203 ?AUTO_8204 )
      ( MAKE-ON-VERIFY ?AUTO_8203 ?AUTO_8204 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8209 - BLOCK
      ?AUTO_8210 - BLOCK
    )
    :vars
    (
      ?AUTO_8212 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8209 ?AUTO_8212 ) ( ON ?AUTO_8210 ?AUTO_8209 ) ( CLEAR ?AUTO_8210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8210 ?AUTO_8209 )
      ( MAKE-ON ?AUTO_8209 ?AUTO_8210 )
      ( MAKE-ON-VERIFY ?AUTO_8209 ?AUTO_8210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8216 - BLOCK
      ?AUTO_8217 - BLOCK
    )
    :vars
    (
      ?AUTO_8219 - BLOCK
      ?AUTO_8221 - BLOCK
      ?AUTO_8222 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8216 ?AUTO_8219 ) ( ON ?AUTO_8217 ?AUTO_8216 ) ( CLEAR ?AUTO_8217 ) ( HOLDING ?AUTO_8221 ) ( CLEAR ?AUTO_8222 ) )
    :subtasks
    ( ( !STACK ?AUTO_8221 ?AUTO_8222 )
      ( MAKE-ON ?AUTO_8216 ?AUTO_8217 )
      ( MAKE-ON-VERIFY ?AUTO_8216 ?AUTO_8217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8231 - BLOCK
      ?AUTO_8232 - BLOCK
    )
    :vars
    (
      ?AUTO_8235 - BLOCK
      ?AUTO_8237 - BLOCK
      ?AUTO_8236 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8231 ?AUTO_8235 ) ( ON ?AUTO_8232 ?AUTO_8231 ) ( CLEAR ?AUTO_8237 ) ( ON ?AUTO_8236 ?AUTO_8232 ) ( CLEAR ?AUTO_8236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8236 ?AUTO_8232 )
      ( MAKE-ON ?AUTO_8231 ?AUTO_8232 )
      ( MAKE-ON-VERIFY ?AUTO_8231 ?AUTO_8232 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8240 - BLOCK
      ?AUTO_8241 - BLOCK
    )
    :vars
    (
      ?AUTO_8244 - BLOCK
      ?AUTO_8246 - BLOCK
      ?AUTO_8245 - BLOCK
      ?AUTO_8247 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8240 ?AUTO_8244 ) ( ON ?AUTO_8241 ?AUTO_8240 ) ( CLEAR ?AUTO_8246 ) ( ON ?AUTO_8245 ?AUTO_8241 ) ( CLEAR ?AUTO_8245 ) ( HOLDING ?AUTO_8247 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8247 )
      ( MAKE-ON ?AUTO_8240 ?AUTO_8241 )
      ( MAKE-ON-VERIFY ?AUTO_8240 ?AUTO_8241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8248 - BLOCK
      ?AUTO_8249 - BLOCK
    )
    :vars
    (
      ?AUTO_8254 - BLOCK
      ?AUTO_8255 - BLOCK
      ?AUTO_8253 - BLOCK
      ?AUTO_8252 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8248 ?AUTO_8254 ) ( ON ?AUTO_8249 ?AUTO_8248 ) ( CLEAR ?AUTO_8255 ) ( ON ?AUTO_8253 ?AUTO_8249 ) ( ON ?AUTO_8252 ?AUTO_8253 ) ( CLEAR ?AUTO_8252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8252 ?AUTO_8253 )
      ( MAKE-ON ?AUTO_8248 ?AUTO_8249 )
      ( MAKE-ON-VERIFY ?AUTO_8248 ?AUTO_8249 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8257 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8257 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8257 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8257 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8259 - BLOCK
    )
    :vars
    (
      ?AUTO_8262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8259 ?AUTO_8262 ) ( CLEAR ?AUTO_8259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8259 ?AUTO_8262 )
      ( MAKE-ON-TABLE ?AUTO_8259 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8259 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8264 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8264 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8264 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8264 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8266 - BLOCK
    )
    :vars
    (
      ?AUTO_8269 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8266 ?AUTO_8269 ) ( CLEAR ?AUTO_8266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8266 ?AUTO_8269 )
      ( MAKE-ON-TABLE ?AUTO_8266 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8266 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8270 - BLOCK
    )
    :vars
    (
      ?AUTO_8272 - BLOCK
      ?AUTO_8273 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8270 ?AUTO_8272 ) ( CLEAR ?AUTO_8270 ) ( HOLDING ?AUTO_8273 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8273 )
      ( MAKE-ON-TABLE ?AUTO_8270 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8277 - BLOCK
      ?AUTO_8278 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8277 ) ( CLEAR ?AUTO_8278 ) )
    :subtasks
    ( ( !STACK ?AUTO_8277 ?AUTO_8278 )
      ( MAKE-ON-VERIFY ?AUTO_8277 ?AUTO_8278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8281 - BLOCK
      ?AUTO_8282 - BLOCK
    )
    :vars
    (
      ?AUTO_8286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8282 ) ( ON ?AUTO_8281 ?AUTO_8286 ) ( CLEAR ?AUTO_8281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8281 ?AUTO_8286 )
      ( MAKE-ON ?AUTO_8281 ?AUTO_8282 )
      ( MAKE-ON-VERIFY ?AUTO_8281 ?AUTO_8282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8287 - BLOCK
      ?AUTO_8288 - BLOCK
    )
    :vars
    (
      ?AUTO_8291 - BLOCK
      ?AUTO_8292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8288 ) ( ON ?AUTO_8287 ?AUTO_8291 ) ( CLEAR ?AUTO_8287 ) ( HOLDING ?AUTO_8292 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8292 )
      ( MAKE-ON ?AUTO_8287 ?AUTO_8288 )
      ( MAKE-ON-VERIFY ?AUTO_8287 ?AUTO_8288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8295 - BLOCK
      ?AUTO_8296 - BLOCK
    )
    :vars
    (
      ?AUTO_8299 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8295 ?AUTO_8299 ) ( CLEAR ?AUTO_8295 ) ( HOLDING ?AUTO_8296 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8296 )
      ( MAKE-ON ?AUTO_8295 ?AUTO_8296 )
      ( MAKE-ON-VERIFY ?AUTO_8295 ?AUTO_8296 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8304 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8304 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8304 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8304 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8306 - BLOCK
    )
    :vars
    (
      ?AUTO_8309 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8306 ?AUTO_8309 ) ( CLEAR ?AUTO_8306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8306 ?AUTO_8309 )
      ( MAKE-ON-TABLE ?AUTO_8306 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8306 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8310 - BLOCK
    )
    :vars
    (
      ?AUTO_8312 - BLOCK
      ?AUTO_8313 - BLOCK
      ?AUTO_8314 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8310 ?AUTO_8312 ) ( CLEAR ?AUTO_8310 ) ( HOLDING ?AUTO_8313 ) ( CLEAR ?AUTO_8314 ) )
    :subtasks
    ( ( !STACK ?AUTO_8313 ?AUTO_8314 )
      ( MAKE-ON-TABLE ?AUTO_8310 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8310 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8319 - BLOCK
    )
    :vars
    (
      ?AUTO_8321 - BLOCK
      ?AUTO_8323 - BLOCK
      ?AUTO_8322 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8319 ?AUTO_8321 ) ( CLEAR ?AUTO_8323 ) ( ON ?AUTO_8322 ?AUTO_8319 ) ( CLEAR ?AUTO_8322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8322 ?AUTO_8319 )
      ( MAKE-ON-TABLE ?AUTO_8319 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8328 - BLOCK
      ?AUTO_8329 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8328 ) ( CLEAR ?AUTO_8329 ) )
    :subtasks
    ( ( !STACK ?AUTO_8328 ?AUTO_8329 )
      ( MAKE-ON-VERIFY ?AUTO_8328 ?AUTO_8329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8332 - BLOCK
      ?AUTO_8333 - BLOCK
    )
    :vars
    (
      ?AUTO_8337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8333 ) ( ON ?AUTO_8332 ?AUTO_8337 ) ( CLEAR ?AUTO_8332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8332 ?AUTO_8337 )
      ( MAKE-ON ?AUTO_8332 ?AUTO_8333 )
      ( MAKE-ON-VERIFY ?AUTO_8332 ?AUTO_8333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8338 - BLOCK
      ?AUTO_8339 - BLOCK
    )
    :vars
    (
      ?AUTO_8342 - BLOCK
      ?AUTO_8343 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8339 ) ( ON ?AUTO_8338 ?AUTO_8342 ) ( CLEAR ?AUTO_8338 ) ( HOLDING ?AUTO_8343 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8343 )
      ( MAKE-ON ?AUTO_8338 ?AUTO_8339 )
      ( MAKE-ON-VERIFY ?AUTO_8338 ?AUTO_8339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8344 - BLOCK
      ?AUTO_8345 - BLOCK
    )
    :vars
    (
      ?AUTO_8348 - BLOCK
      ?AUTO_8349 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8345 ) ( ON ?AUTO_8344 ?AUTO_8348 ) ( ON ?AUTO_8349 ?AUTO_8344 ) ( CLEAR ?AUTO_8349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8349 ?AUTO_8344 )
      ( MAKE-ON ?AUTO_8344 ?AUTO_8345 )
      ( MAKE-ON-VERIFY ?AUTO_8344 ?AUTO_8345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8352 - BLOCK
      ?AUTO_8353 - BLOCK
    )
    :vars
    (
      ?AUTO_8357 - BLOCK
      ?AUTO_8354 - BLOCK
      ?AUTO_8358 - BLOCK
      ?AUTO_8359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8353 ) ( ON ?AUTO_8352 ?AUTO_8357 ) ( ON ?AUTO_8354 ?AUTO_8352 ) ( CLEAR ?AUTO_8354 ) ( HOLDING ?AUTO_8358 ) ( CLEAR ?AUTO_8359 ) )
    :subtasks
    ( ( !STACK ?AUTO_8358 ?AUTO_8359 )
      ( MAKE-ON ?AUTO_8352 ?AUTO_8353 )
      ( MAKE-ON-VERIFY ?AUTO_8352 ?AUTO_8353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8362 - BLOCK
      ?AUTO_8363 - BLOCK
    )
    :vars
    (
      ?AUTO_8364 - BLOCK
      ?AUTO_8365 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8362 ?AUTO_8364 ) ( ON ?AUTO_8365 ?AUTO_8362 ) ( CLEAR ?AUTO_8365 ) ( HOLDING ?AUTO_8363 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8363 )
      ( MAKE-ON ?AUTO_8362 ?AUTO_8363 )
      ( MAKE-ON-VERIFY ?AUTO_8362 ?AUTO_8363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8373 - BLOCK
      ?AUTO_8374 - BLOCK
    )
    :vars
    (
      ?AUTO_8377 - BLOCK
      ?AUTO_8378 - BLOCK
      ?AUTO_8379 - BLOCK
      ?AUTO_8380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8374 ) ( ON ?AUTO_8373 ?AUTO_8377 ) ( ON ?AUTO_8378 ?AUTO_8373 ) ( CLEAR ?AUTO_8379 ) ( ON ?AUTO_8380 ?AUTO_8378 ) ( CLEAR ?AUTO_8380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8380 ?AUTO_8378 )
      ( MAKE-ON ?AUTO_8373 ?AUTO_8374 )
      ( MAKE-ON-VERIFY ?AUTO_8373 ?AUTO_8374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8385 - BLOCK
      ?AUTO_8386 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8385 ) ( CLEAR ?AUTO_8386 ) )
    :subtasks
    ( ( !STACK ?AUTO_8385 ?AUTO_8386 )
      ( MAKE-ON-VERIFY ?AUTO_8385 ?AUTO_8386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8389 - BLOCK
      ?AUTO_8390 - BLOCK
    )
    :vars
    (
      ?AUTO_8394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8390 ) ( ON ?AUTO_8389 ?AUTO_8394 ) ( CLEAR ?AUTO_8389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8389 ?AUTO_8394 )
      ( MAKE-ON ?AUTO_8389 ?AUTO_8390 )
      ( MAKE-ON-VERIFY ?AUTO_8389 ?AUTO_8390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8395 - BLOCK
      ?AUTO_8396 - BLOCK
    )
    :vars
    (
      ?AUTO_8399 - BLOCK
      ?AUTO_8400 - BLOCK
      ?AUTO_8401 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8396 ) ( ON ?AUTO_8395 ?AUTO_8399 ) ( CLEAR ?AUTO_8395 ) ( HOLDING ?AUTO_8400 ) ( CLEAR ?AUTO_8401 ) )
    :subtasks
    ( ( !STACK ?AUTO_8400 ?AUTO_8401 )
      ( MAKE-ON ?AUTO_8395 ?AUTO_8396 )
      ( MAKE-ON-VERIFY ?AUTO_8395 ?AUTO_8396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8402 - BLOCK
      ?AUTO_8403 - BLOCK
    )
    :vars
    (
      ?AUTO_8406 - BLOCK
      ?AUTO_8408 - BLOCK
      ?AUTO_8407 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8402 ?AUTO_8406 ) ( CLEAR ?AUTO_8402 ) ( CLEAR ?AUTO_8408 ) ( ON ?AUTO_8407 ?AUTO_8403 ) ( CLEAR ?AUTO_8407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8407 ?AUTO_8403 )
      ( MAKE-ON ?AUTO_8402 ?AUTO_8403 )
      ( MAKE-ON-VERIFY ?AUTO_8402 ?AUTO_8403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8411 - BLOCK
      ?AUTO_8412 - BLOCK
    )
    :vars
    (
      ?AUTO_8417 - BLOCK
      ?AUTO_8414 - BLOCK
      ?AUTO_8413 - BLOCK
      ?AUTO_8418 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8411 ?AUTO_8417 ) ( CLEAR ?AUTO_8411 ) ( CLEAR ?AUTO_8414 ) ( ON ?AUTO_8413 ?AUTO_8412 ) ( CLEAR ?AUTO_8413 ) ( HOLDING ?AUTO_8418 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8418 )
      ( MAKE-ON ?AUTO_8411 ?AUTO_8412 )
      ( MAKE-ON-VERIFY ?AUTO_8411 ?AUTO_8412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8419 - BLOCK
      ?AUTO_8420 - BLOCK
    )
    :vars
    (
      ?AUTO_8426 - BLOCK
      ?AUTO_8423 - BLOCK
      ?AUTO_8421 - BLOCK
      ?AUTO_8425 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8419 ?AUTO_8426 ) ( CLEAR ?AUTO_8419 ) ( CLEAR ?AUTO_8423 ) ( ON ?AUTO_8421 ?AUTO_8420 ) ( ON ?AUTO_8425 ?AUTO_8421 ) ( CLEAR ?AUTO_8425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8425 ?AUTO_8421 )
      ( MAKE-ON ?AUTO_8419 ?AUTO_8420 )
      ( MAKE-ON-VERIFY ?AUTO_8419 ?AUTO_8420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8429 - BLOCK
      ?AUTO_8430 - BLOCK
    )
    :vars
    (
      ?AUTO_8432 - BLOCK
      ?AUTO_8436 - BLOCK
      ?AUTO_8434 - BLOCK
      ?AUTO_8435 - BLOCK
      ?AUTO_8437 - BLOCK
      ?AUTO_8438 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8429 ?AUTO_8432 ) ( CLEAR ?AUTO_8429 ) ( CLEAR ?AUTO_8436 ) ( ON ?AUTO_8434 ?AUTO_8430 ) ( ON ?AUTO_8435 ?AUTO_8434 ) ( CLEAR ?AUTO_8435 ) ( HOLDING ?AUTO_8437 ) ( CLEAR ?AUTO_8438 ) )
    :subtasks
    ( ( !STACK ?AUTO_8437 ?AUTO_8438 )
      ( MAKE-ON ?AUTO_8429 ?AUTO_8430 )
      ( MAKE-ON-VERIFY ?AUTO_8429 ?AUTO_8430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8439 - BLOCK
      ?AUTO_8440 - BLOCK
    )
    :vars
    (
      ?AUTO_8447 - BLOCK
      ?AUTO_8441 - BLOCK
      ?AUTO_8442 - BLOCK
      ?AUTO_8448 - BLOCK
      ?AUTO_8444 - BLOCK
      ?AUTO_8443 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8439 ?AUTO_8447 ) ( CLEAR ?AUTO_8441 ) ( ON ?AUTO_8442 ?AUTO_8440 ) ( ON ?AUTO_8448 ?AUTO_8442 ) ( CLEAR ?AUTO_8448 ) ( CLEAR ?AUTO_8444 ) ( ON ?AUTO_8443 ?AUTO_8439 ) ( CLEAR ?AUTO_8443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8443 ?AUTO_8439 )
      ( MAKE-ON ?AUTO_8439 ?AUTO_8440 )
      ( MAKE-ON-VERIFY ?AUTO_8439 ?AUTO_8440 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8451 - BLOCK
      ?AUTO_8452 - BLOCK
    )
    :vars
    (
      ?AUTO_8457 - BLOCK
      ?AUTO_8459 - BLOCK
      ?AUTO_8453 - BLOCK
      ?AUTO_8455 - BLOCK
      ?AUTO_8460 - BLOCK
      ?AUTO_8458 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8451 ?AUTO_8457 ) ( ON ?AUTO_8459 ?AUTO_8452 ) ( ON ?AUTO_8453 ?AUTO_8459 ) ( CLEAR ?AUTO_8453 ) ( CLEAR ?AUTO_8455 ) ( ON ?AUTO_8460 ?AUTO_8451 ) ( CLEAR ?AUTO_8460 ) ( HOLDING ?AUTO_8458 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8458 )
      ( MAKE-ON ?AUTO_8451 ?AUTO_8452 )
      ( MAKE-ON-VERIFY ?AUTO_8451 ?AUTO_8452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8466 - BLOCK
      ?AUTO_8467 - BLOCK
    )
    :vars
    (
      ?AUTO_8472 - BLOCK
      ?AUTO_8468 - BLOCK
      ?AUTO_8474 - BLOCK
      ?AUTO_8473 - BLOCK
      ?AUTO_8471 - BLOCK
      ?AUTO_8469 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8466 ?AUTO_8472 ) ( ON ?AUTO_8468 ?AUTO_8467 ) ( ON ?AUTO_8474 ?AUTO_8468 ) ( CLEAR ?AUTO_8473 ) ( ON ?AUTO_8471 ?AUTO_8466 ) ( CLEAR ?AUTO_8471 ) ( ON ?AUTO_8469 ?AUTO_8474 ) ( CLEAR ?AUTO_8469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8469 ?AUTO_8474 )
      ( MAKE-ON ?AUTO_8466 ?AUTO_8467 )
      ( MAKE-ON-VERIFY ?AUTO_8466 ?AUTO_8467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8480 - BLOCK
      ?AUTO_8481 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8480 ) ( CLEAR ?AUTO_8481 ) )
    :subtasks
    ( ( !STACK ?AUTO_8480 ?AUTO_8481 )
      ( MAKE-ON-VERIFY ?AUTO_8480 ?AUTO_8481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8484 - BLOCK
      ?AUTO_8485 - BLOCK
    )
    :vars
    (
      ?AUTO_8489 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8485 ) ( ON ?AUTO_8484 ?AUTO_8489 ) ( CLEAR ?AUTO_8484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8484 ?AUTO_8489 )
      ( MAKE-ON ?AUTO_8484 ?AUTO_8485 )
      ( MAKE-ON-VERIFY ?AUTO_8484 ?AUTO_8485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8490 - BLOCK
      ?AUTO_8491 - BLOCK
    )
    :vars
    (
      ?AUTO_8494 - BLOCK
      ?AUTO_8496 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8490 ?AUTO_8494 ) ( CLEAR ?AUTO_8490 ) ( HOLDING ?AUTO_8491 ) ( CLEAR ?AUTO_8496 ) )
    :subtasks
    ( ( !STACK ?AUTO_8491 ?AUTO_8496 )
      ( MAKE-ON ?AUTO_8490 ?AUTO_8491 )
      ( MAKE-ON-VERIFY ?AUTO_8490 ?AUTO_8491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8497 - BLOCK
      ?AUTO_8498 - BLOCK
    )
    :vars
    (
      ?AUTO_8501 - BLOCK
      ?AUTO_8502 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8497 ?AUTO_8501 ) ( CLEAR ?AUTO_8502 ) ( ON ?AUTO_8498 ?AUTO_8497 ) ( CLEAR ?AUTO_8498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8498 ?AUTO_8497 )
      ( MAKE-ON ?AUTO_8497 ?AUTO_8498 )
      ( MAKE-ON-VERIFY ?AUTO_8497 ?AUTO_8498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8505 - BLOCK
      ?AUTO_8506 - BLOCK
    )
    :vars
    (
      ?AUTO_8510 - BLOCK
      ?AUTO_8507 - BLOCK
      ?AUTO_8511 - BLOCK
      ?AUTO_8512 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8505 ?AUTO_8510 ) ( CLEAR ?AUTO_8507 ) ( ON ?AUTO_8506 ?AUTO_8505 ) ( CLEAR ?AUTO_8506 ) ( HOLDING ?AUTO_8511 ) ( CLEAR ?AUTO_8512 ) )
    :subtasks
    ( ( !STACK ?AUTO_8511 ?AUTO_8512 )
      ( MAKE-ON ?AUTO_8505 ?AUTO_8506 )
      ( MAKE-ON-VERIFY ?AUTO_8505 ?AUTO_8506 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8521 - BLOCK
      ?AUTO_8522 - BLOCK
    )
    :vars
    (
      ?AUTO_8523 - BLOCK
      ?AUTO_8526 - BLOCK
      ?AUTO_8528 - BLOCK
      ?AUTO_8524 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8521 ?AUTO_8523 ) ( CLEAR ?AUTO_8526 ) ( ON ?AUTO_8522 ?AUTO_8521 ) ( CLEAR ?AUTO_8528 ) ( ON ?AUTO_8524 ?AUTO_8522 ) ( CLEAR ?AUTO_8524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8524 ?AUTO_8522 )
      ( MAKE-ON ?AUTO_8521 ?AUTO_8522 )
      ( MAKE-ON-VERIFY ?AUTO_8521 ?AUTO_8522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8531 - BLOCK
      ?AUTO_8532 - BLOCK
    )
    :vars
    (
      ?AUTO_8538 - BLOCK
      ?AUTO_8535 - BLOCK
      ?AUTO_8536 - BLOCK
      ?AUTO_8537 - BLOCK
      ?AUTO_8539 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8531 ?AUTO_8538 ) ( CLEAR ?AUTO_8535 ) ( ON ?AUTO_8532 ?AUTO_8531 ) ( CLEAR ?AUTO_8536 ) ( ON ?AUTO_8537 ?AUTO_8532 ) ( CLEAR ?AUTO_8537 ) ( HOLDING ?AUTO_8539 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8539 )
      ( MAKE-ON ?AUTO_8531 ?AUTO_8532 )
      ( MAKE-ON-VERIFY ?AUTO_8531 ?AUTO_8532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8548 - BLOCK
      ?AUTO_8549 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8548 ) ( CLEAR ?AUTO_8549 ) )
    :subtasks
    ( ( !STACK ?AUTO_8548 ?AUTO_8549 )
      ( MAKE-ON-VERIFY ?AUTO_8548 ?AUTO_8549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8552 - BLOCK
      ?AUTO_8553 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8553 ) ( ON-TABLE ?AUTO_8552 ) ( CLEAR ?AUTO_8552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8552 )
      ( MAKE-ON ?AUTO_8552 ?AUTO_8553 )
      ( MAKE-ON-VERIFY ?AUTO_8552 ?AUTO_8553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8557 - BLOCK
      ?AUTO_8558 - BLOCK
    )
    :vars
    (
      ?AUTO_8561 - BLOCK
      ?AUTO_8562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8558 ) ( ON-TABLE ?AUTO_8557 ) ( CLEAR ?AUTO_8557 ) ( HOLDING ?AUTO_8561 ) ( CLEAR ?AUTO_8562 ) )
    :subtasks
    ( ( !STACK ?AUTO_8561 ?AUTO_8562 )
      ( MAKE-ON ?AUTO_8557 ?AUTO_8558 )
      ( MAKE-ON-VERIFY ?AUTO_8557 ?AUTO_8558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8563 - BLOCK
      ?AUTO_8564 - BLOCK
    )
    :vars
    (
      ?AUTO_8566 - BLOCK
      ?AUTO_8568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8563 ) ( CLEAR ?AUTO_8563 ) ( CLEAR ?AUTO_8566 ) ( ON ?AUTO_8568 ?AUTO_8564 ) ( CLEAR ?AUTO_8568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8568 ?AUTO_8564 )
      ( MAKE-ON ?AUTO_8563 ?AUTO_8564 )
      ( MAKE-ON-VERIFY ?AUTO_8563 ?AUTO_8564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8571 - BLOCK
      ?AUTO_8572 - BLOCK
    )
    :vars
    (
      ?AUTO_8576 - BLOCK
      ?AUTO_8575 - BLOCK
      ?AUTO_8578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8571 ) ( CLEAR ?AUTO_8571 ) ( ON ?AUTO_8576 ?AUTO_8572 ) ( CLEAR ?AUTO_8576 ) ( HOLDING ?AUTO_8575 ) ( CLEAR ?AUTO_8578 ) )
    :subtasks
    ( ( !STACK ?AUTO_8575 ?AUTO_8578 )
      ( MAKE-ON ?AUTO_8571 ?AUTO_8572 )
      ( MAKE-ON-VERIFY ?AUTO_8571 ?AUTO_8572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8579 - BLOCK
      ?AUTO_8580 - BLOCK
    )
    :vars
    (
      ?AUTO_8583 - BLOCK
      ?AUTO_8585 - BLOCK
      ?AUTO_8584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8579 ) ( CLEAR ?AUTO_8579 ) ( ON ?AUTO_8583 ?AUTO_8580 ) ( CLEAR ?AUTO_8585 ) ( ON ?AUTO_8584 ?AUTO_8583 ) ( CLEAR ?AUTO_8584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8584 ?AUTO_8583 )
      ( MAKE-ON ?AUTO_8579 ?AUTO_8580 )
      ( MAKE-ON-VERIFY ?AUTO_8579 ?AUTO_8580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8588 - BLOCK
      ?AUTO_8589 - BLOCK
    )
    :vars
    (
      ?AUTO_8592 - BLOCK
      ?AUTO_8590 - BLOCK
      ?AUTO_8591 - BLOCK
      ?AUTO_8595 - BLOCK
      ?AUTO_8596 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8588 ) ( CLEAR ?AUTO_8588 ) ( ON ?AUTO_8592 ?AUTO_8589 ) ( CLEAR ?AUTO_8590 ) ( ON ?AUTO_8591 ?AUTO_8592 ) ( CLEAR ?AUTO_8591 ) ( HOLDING ?AUTO_8595 ) ( CLEAR ?AUTO_8596 ) )
    :subtasks
    ( ( !STACK ?AUTO_8595 ?AUTO_8596 )
      ( MAKE-ON ?AUTO_8588 ?AUTO_8589 )
      ( MAKE-ON-VERIFY ?AUTO_8588 ?AUTO_8589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8599 - BLOCK
      ?AUTO_8600 - BLOCK
    )
    :vars
    (
      ?AUTO_8602 - BLOCK
      ?AUTO_8603 - BLOCK
      ?AUTO_8601 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8602 ?AUTO_8600 ) ( CLEAR ?AUTO_8603 ) ( ON ?AUTO_8601 ?AUTO_8602 ) ( CLEAR ?AUTO_8601 ) ( HOLDING ?AUTO_8599 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8599 )
      ( MAKE-ON ?AUTO_8599 ?AUTO_8600 )
      ( MAKE-ON-VERIFY ?AUTO_8599 ?AUTO_8600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8611 - BLOCK
      ?AUTO_8612 - BLOCK
    )
    :vars
    (
      ?AUTO_8614 - BLOCK
      ?AUTO_8617 - BLOCK
      ?AUTO_8619 - BLOCK
      ?AUTO_8620 - BLOCK
      ?AUTO_8613 - BLOCK
      ?AUTO_8618 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8611 ?AUTO_8614 ) ( CLEAR ?AUTO_8611 ) ( CLEAR ?AUTO_8617 ) ( ON ?AUTO_8619 ?AUTO_8612 ) ( ON ?AUTO_8620 ?AUTO_8619 ) ( CLEAR ?AUTO_8613 ) ( ON ?AUTO_8618 ?AUTO_8620 ) ( CLEAR ?AUTO_8618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8618 ?AUTO_8620 )
      ( MAKE-ON ?AUTO_8611 ?AUTO_8612 )
      ( MAKE-ON-VERIFY ?AUTO_8611 ?AUTO_8612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8623 - BLOCK
      ?AUTO_8624 - BLOCK
    )
    :vars
    (
      ?AUTO_8628 - BLOCK
      ?AUTO_8629 - BLOCK
      ?AUTO_8631 - BLOCK
      ?AUTO_8630 - BLOCK
      ?AUTO_8632 - BLOCK
      ?AUTO_8627 - BLOCK
      ?AUTO_8633 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8623 ?AUTO_8628 ) ( CLEAR ?AUTO_8623 ) ( CLEAR ?AUTO_8629 ) ( ON ?AUTO_8631 ?AUTO_8624 ) ( ON ?AUTO_8630 ?AUTO_8631 ) ( CLEAR ?AUTO_8632 ) ( ON ?AUTO_8627 ?AUTO_8630 ) ( CLEAR ?AUTO_8627 ) ( HOLDING ?AUTO_8633 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8633 )
      ( MAKE-ON ?AUTO_8623 ?AUTO_8624 )
      ( MAKE-ON-VERIFY ?AUTO_8623 ?AUTO_8624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8642 - BLOCK
      ?AUTO_8643 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8642 ) ( CLEAR ?AUTO_8643 ) )
    :subtasks
    ( ( !STACK ?AUTO_8642 ?AUTO_8643 )
      ( MAKE-ON-VERIFY ?AUTO_8642 ?AUTO_8643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8646 - BLOCK
      ?AUTO_8647 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8647 ) ( ON-TABLE ?AUTO_8646 ) ( CLEAR ?AUTO_8646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8646 )
      ( MAKE-ON ?AUTO_8646 ?AUTO_8647 )
      ( MAKE-ON-VERIFY ?AUTO_8646 ?AUTO_8647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8651 - BLOCK
      ?AUTO_8652 - BLOCK
    )
    :vars
    (
      ?AUTO_8655 - BLOCK
      ?AUTO_8656 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8652 ) ( ON-TABLE ?AUTO_8651 ) ( CLEAR ?AUTO_8651 ) ( HOLDING ?AUTO_8655 ) ( CLEAR ?AUTO_8656 ) )
    :subtasks
    ( ( !STACK ?AUTO_8655 ?AUTO_8656 )
      ( MAKE-ON ?AUTO_8651 ?AUTO_8652 )
      ( MAKE-ON-VERIFY ?AUTO_8651 ?AUTO_8652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8667 - BLOCK
      ?AUTO_8668 - BLOCK
    )
    :vars
    (
      ?AUTO_8672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8667 ) ( CLEAR ?AUTO_8667 ) ( HOLDING ?AUTO_8668 ) ( CLEAR ?AUTO_8672 ) )
    :subtasks
    ( ( !STACK ?AUTO_8668 ?AUTO_8672 )
      ( MAKE-ON ?AUTO_8667 ?AUTO_8668 )
      ( MAKE-ON-VERIFY ?AUTO_8667 ?AUTO_8668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8685 - BLOCK
      ?AUTO_8686 - BLOCK
    )
    :vars
    (
      ?AUTO_8688 - BLOCK
      ?AUTO_8687 - BLOCK
      ?AUTO_8691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8685 ) ( ON ?AUTO_8688 ?AUTO_8686 ) ( CLEAR ?AUTO_8688 ) ( CLEAR ?AUTO_8687 ) ( ON ?AUTO_8691 ?AUTO_8685 ) ( CLEAR ?AUTO_8691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8691 ?AUTO_8685 )
      ( MAKE-ON ?AUTO_8685 ?AUTO_8686 )
      ( MAKE-ON-VERIFY ?AUTO_8685 ?AUTO_8686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8694 - BLOCK
      ?AUTO_8695 - BLOCK
    )
    :vars
    (
      ?AUTO_8696 - BLOCK
      ?AUTO_8698 - BLOCK
      ?AUTO_8700 - BLOCK
      ?AUTO_8701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8694 ) ( ON ?AUTO_8696 ?AUTO_8695 ) ( CLEAR ?AUTO_8696 ) ( CLEAR ?AUTO_8698 ) ( ON ?AUTO_8700 ?AUTO_8694 ) ( CLEAR ?AUTO_8700 ) ( HOLDING ?AUTO_8701 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8701 )
      ( MAKE-ON ?AUTO_8694 ?AUTO_8695 )
      ( MAKE-ON-VERIFY ?AUTO_8694 ?AUTO_8695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8702 - BLOCK
      ?AUTO_8703 - BLOCK
    )
    :vars
    (
      ?AUTO_8704 - BLOCK
      ?AUTO_8709 - BLOCK
      ?AUTO_8705 - BLOCK
      ?AUTO_8708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8702 ) ( ON ?AUTO_8704 ?AUTO_8703 ) ( CLEAR ?AUTO_8709 ) ( ON ?AUTO_8705 ?AUTO_8702 ) ( CLEAR ?AUTO_8705 ) ( ON ?AUTO_8708 ?AUTO_8704 ) ( CLEAR ?AUTO_8708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8708 ?AUTO_8704 )
      ( MAKE-ON ?AUTO_8702 ?AUTO_8703 )
      ( MAKE-ON-VERIFY ?AUTO_8702 ?AUTO_8703 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8711 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8711 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8711 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8711 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8713 - BLOCK
    )
    :vars
    (
      ?AUTO_8716 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8713 ?AUTO_8716 ) ( CLEAR ?AUTO_8713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8713 ?AUTO_8716 )
      ( MAKE-ON-TABLE ?AUTO_8713 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8713 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8718 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8718 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8718 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8718 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8720 - BLOCK
    )
    :vars
    (
      ?AUTO_8723 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8720 ?AUTO_8723 ) ( CLEAR ?AUTO_8720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8720 ?AUTO_8723 )
      ( MAKE-ON-TABLE ?AUTO_8720 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8720 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8724 - BLOCK
    )
    :vars
    (
      ?AUTO_8726 - BLOCK
      ?AUTO_8727 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8724 ?AUTO_8726 ) ( CLEAR ?AUTO_8724 ) ( HOLDING ?AUTO_8727 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8727 )
      ( MAKE-ON-TABLE ?AUTO_8724 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8724 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8730 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8730 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8730 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8730 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8732 - BLOCK
    )
    :vars
    (
      ?AUTO_8735 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8732 ?AUTO_8735 ) ( CLEAR ?AUTO_8732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8732 ?AUTO_8735 )
      ( MAKE-ON-TABLE ?AUTO_8732 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8732 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8736 - BLOCK
    )
    :vars
    (
      ?AUTO_8738 - BLOCK
      ?AUTO_8739 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8736 ?AUTO_8738 ) ( CLEAR ?AUTO_8736 ) ( HOLDING ?AUTO_8739 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8739 )
      ( MAKE-ON-TABLE ?AUTO_8736 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8736 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8740 - BLOCK
    )
    :vars
    (
      ?AUTO_8742 - BLOCK
      ?AUTO_8743 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8740 ?AUTO_8742 ) ( ON ?AUTO_8743 ?AUTO_8740 ) ( CLEAR ?AUTO_8743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8743 ?AUTO_8740 )
      ( MAKE-ON-TABLE ?AUTO_8740 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8740 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8746 - BLOCK
    )
    :vars
    (
      ?AUTO_8747 - BLOCK
      ?AUTO_8748 - BLOCK
      ?AUTO_8750 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8746 ?AUTO_8747 ) ( ON ?AUTO_8748 ?AUTO_8746 ) ( CLEAR ?AUTO_8748 ) ( HOLDING ?AUTO_8750 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8750 )
      ( MAKE-ON-TABLE ?AUTO_8746 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8754 - BLOCK
      ?AUTO_8755 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8754 ) ( CLEAR ?AUTO_8755 ) )
    :subtasks
    ( ( !STACK ?AUTO_8754 ?AUTO_8755 )
      ( MAKE-ON-VERIFY ?AUTO_8754 ?AUTO_8755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8758 - BLOCK
      ?AUTO_8759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8759 ) ( ON-TABLE ?AUTO_8758 ) ( CLEAR ?AUTO_8758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8758 )
      ( MAKE-ON ?AUTO_8758 ?AUTO_8759 )
      ( MAKE-ON-VERIFY ?AUTO_8758 ?AUTO_8759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8763 - BLOCK
      ?AUTO_8764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8763 ) ( CLEAR ?AUTO_8763 ) ( HOLDING ?AUTO_8764 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8764 )
      ( MAKE-ON ?AUTO_8763 ?AUTO_8764 )
      ( MAKE-ON-VERIFY ?AUTO_8763 ?AUTO_8764 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8795 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8795 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8795 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8795 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8797 - BLOCK
    )
    :vars
    (
      ?AUTO_8800 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8797 ?AUTO_8800 ) ( CLEAR ?AUTO_8797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8797 ?AUTO_8800 )
      ( MAKE-ON-TABLE ?AUTO_8797 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8797 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8801 - BLOCK
    )
    :vars
    (
      ?AUTO_8803 - BLOCK
      ?AUTO_8804 - BLOCK
      ?AUTO_8805 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8801 ?AUTO_8803 ) ( CLEAR ?AUTO_8801 ) ( HOLDING ?AUTO_8804 ) ( CLEAR ?AUTO_8805 ) )
    :subtasks
    ( ( !STACK ?AUTO_8804 ?AUTO_8805 )
      ( MAKE-ON-TABLE ?AUTO_8801 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8801 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8808 - BLOCK
    )
    :vars
    (
      ?AUTO_8810 - BLOCK
      ?AUTO_8812 - BLOCK
      ?AUTO_8809 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8808 ?AUTO_8810 ) ( CLEAR ?AUTO_8812 ) ( ON ?AUTO_8809 ?AUTO_8808 ) ( CLEAR ?AUTO_8809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8809 ?AUTO_8808 )
      ( MAKE-ON-TABLE ?AUTO_8808 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8808 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8815 - BLOCK
    )
    :vars
    (
      ?AUTO_8817 - BLOCK
      ?AUTO_8819 - BLOCK
      ?AUTO_8818 - BLOCK
      ?AUTO_8820 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8815 ?AUTO_8817 ) ( CLEAR ?AUTO_8819 ) ( ON ?AUTO_8818 ?AUTO_8815 ) ( CLEAR ?AUTO_8818 ) ( HOLDING ?AUTO_8820 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8820 )
      ( MAKE-ON-TABLE ?AUTO_8815 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8815 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8821 - BLOCK
    )
    :vars
    (
      ?AUTO_8823 - BLOCK
      ?AUTO_8822 - BLOCK
      ?AUTO_8826 - BLOCK
      ?AUTO_8825 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8821 ?AUTO_8823 ) ( CLEAR ?AUTO_8822 ) ( ON ?AUTO_8826 ?AUTO_8821 ) ( ON ?AUTO_8825 ?AUTO_8826 ) ( CLEAR ?AUTO_8825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8825 ?AUTO_8826 )
      ( MAKE-ON-TABLE ?AUTO_8821 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8821 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8829 - BLOCK
    )
    :vars
    (
      ?AUTO_8832 - BLOCK
      ?AUTO_8830 - BLOCK
      ?AUTO_8834 - BLOCK
      ?AUTO_8833 - BLOCK
      ?AUTO_8835 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8829 ?AUTO_8832 ) ( CLEAR ?AUTO_8830 ) ( ON ?AUTO_8834 ?AUTO_8829 ) ( ON ?AUTO_8833 ?AUTO_8834 ) ( CLEAR ?AUTO_8833 ) ( HOLDING ?AUTO_8835 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8835 )
      ( MAKE-ON-TABLE ?AUTO_8829 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8829 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8838 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8838 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8838 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8838 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8840 - BLOCK
    )
    :vars
    (
      ?AUTO_8843 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8840 ?AUTO_8843 ) ( CLEAR ?AUTO_8840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8840 ?AUTO_8843 )
      ( MAKE-ON-TABLE ?AUTO_8840 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8840 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8844 - BLOCK
    )
    :vars
    (
      ?AUTO_8846 - BLOCK
      ?AUTO_8847 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8844 ?AUTO_8846 ) ( CLEAR ?AUTO_8844 ) ( HOLDING ?AUTO_8847 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8847 )
      ( MAKE-ON-TABLE ?AUTO_8844 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8844 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8848 - BLOCK
    )
    :vars
    (
      ?AUTO_8850 - BLOCK
      ?AUTO_8851 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8848 ?AUTO_8850 ) ( ON ?AUTO_8851 ?AUTO_8848 ) ( CLEAR ?AUTO_8851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8851 ?AUTO_8848 )
      ( MAKE-ON-TABLE ?AUTO_8848 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8848 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8854 - BLOCK
    )
    :vars
    (
      ?AUTO_8855 - BLOCK
      ?AUTO_8856 - BLOCK
      ?AUTO_8858 - BLOCK
      ?AUTO_8859 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8854 ?AUTO_8855 ) ( ON ?AUTO_8856 ?AUTO_8854 ) ( CLEAR ?AUTO_8856 ) ( HOLDING ?AUTO_8858 ) ( CLEAR ?AUTO_8859 ) )
    :subtasks
    ( ( !STACK ?AUTO_8858 ?AUTO_8859 )
      ( MAKE-ON-TABLE ?AUTO_8854 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8854 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8862 - BLOCK
    )
    :vars
    (
      ?AUTO_8867 - BLOCK
      ?AUTO_8863 - BLOCK
      ?AUTO_8865 - BLOCK
      ?AUTO_8864 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8862 ?AUTO_8867 ) ( ON ?AUTO_8863 ?AUTO_8862 ) ( CLEAR ?AUTO_8865 ) ( ON ?AUTO_8864 ?AUTO_8863 ) ( CLEAR ?AUTO_8864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8864 ?AUTO_8863 )
      ( MAKE-ON-TABLE ?AUTO_8862 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8862 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8870 - BLOCK
    )
    :vars
    (
      ?AUTO_8875 - BLOCK
      ?AUTO_8872 - BLOCK
      ?AUTO_8874 - BLOCK
      ?AUTO_8873 - BLOCK
      ?AUTO_8876 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8870 ?AUTO_8875 ) ( ON ?AUTO_8872 ?AUTO_8870 ) ( CLEAR ?AUTO_8874 ) ( ON ?AUTO_8873 ?AUTO_8872 ) ( CLEAR ?AUTO_8873 ) ( HOLDING ?AUTO_8876 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8876 )
      ( MAKE-ON-TABLE ?AUTO_8870 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8870 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8877 - BLOCK
    )
    :vars
    (
      ?AUTO_8879 - BLOCK
      ?AUTO_8880 - BLOCK
      ?AUTO_8882 - BLOCK
      ?AUTO_8878 - BLOCK
      ?AUTO_8883 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8877 ?AUTO_8879 ) ( ON ?AUTO_8880 ?AUTO_8877 ) ( CLEAR ?AUTO_8882 ) ( ON ?AUTO_8878 ?AUTO_8880 ) ( ON ?AUTO_8883 ?AUTO_8878 ) ( CLEAR ?AUTO_8883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8883 ?AUTO_8878 )
      ( MAKE-ON-TABLE ?AUTO_8877 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8877 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8886 - BLOCK
    )
    :vars
    (
      ?AUTO_8889 - BLOCK
      ?AUTO_8887 - BLOCK
      ?AUTO_8890 - BLOCK
      ?AUTO_8892 - BLOCK
      ?AUTO_8891 - BLOCK
      ?AUTO_8893 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8886 ?AUTO_8889 ) ( ON ?AUTO_8887 ?AUTO_8886 ) ( CLEAR ?AUTO_8890 ) ( ON ?AUTO_8892 ?AUTO_8887 ) ( ON ?AUTO_8891 ?AUTO_8892 ) ( CLEAR ?AUTO_8891 ) ( HOLDING ?AUTO_8893 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8893 )
      ( MAKE-ON-TABLE ?AUTO_8886 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8897 - BLOCK
      ?AUTO_8898 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8897 ) ( CLEAR ?AUTO_8898 ) )
    :subtasks
    ( ( !STACK ?AUTO_8897 ?AUTO_8898 )
      ( MAKE-ON-VERIFY ?AUTO_8897 ?AUTO_8898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8901 - BLOCK
      ?AUTO_8902 - BLOCK
    )
    :vars
    (
      ?AUTO_8906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8902 ) ( ON ?AUTO_8901 ?AUTO_8906 ) ( CLEAR ?AUTO_8901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8901 ?AUTO_8906 )
      ( MAKE-ON ?AUTO_8901 ?AUTO_8902 )
      ( MAKE-ON-VERIFY ?AUTO_8901 ?AUTO_8902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8907 - BLOCK
      ?AUTO_8908 - BLOCK
    )
    :vars
    (
      ?AUTO_8911 - BLOCK
      ?AUTO_8912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8908 ) ( ON ?AUTO_8907 ?AUTO_8911 ) ( CLEAR ?AUTO_8907 ) ( HOLDING ?AUTO_8912 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8912 )
      ( MAKE-ON ?AUTO_8907 ?AUTO_8908 )
      ( MAKE-ON-VERIFY ?AUTO_8907 ?AUTO_8908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8913 - BLOCK
      ?AUTO_8914 - BLOCK
    )
    :vars
    (
      ?AUTO_8917 - BLOCK
      ?AUTO_8918 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8913 ?AUTO_8917 ) ( CLEAR ?AUTO_8913 ) ( ON ?AUTO_8918 ?AUTO_8914 ) ( CLEAR ?AUTO_8918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8918 ?AUTO_8914 )
      ( MAKE-ON ?AUTO_8913 ?AUTO_8914 )
      ( MAKE-ON-VERIFY ?AUTO_8913 ?AUTO_8914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8921 - BLOCK
      ?AUTO_8922 - BLOCK
    )
    :vars
    (
      ?AUTO_8926 - BLOCK
      ?AUTO_8923 - BLOCK
      ?AUTO_8927 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8921 ?AUTO_8926 ) ( CLEAR ?AUTO_8921 ) ( ON ?AUTO_8923 ?AUTO_8922 ) ( CLEAR ?AUTO_8923 ) ( HOLDING ?AUTO_8927 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8927 )
      ( MAKE-ON ?AUTO_8921 ?AUTO_8922 )
      ( MAKE-ON-VERIFY ?AUTO_8921 ?AUTO_8922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8928 - BLOCK
      ?AUTO_8929 - BLOCK
    )
    :vars
    (
      ?AUTO_8933 - BLOCK
      ?AUTO_8930 - BLOCK
      ?AUTO_8934 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8928 ?AUTO_8933 ) ( CLEAR ?AUTO_8928 ) ( ON ?AUTO_8930 ?AUTO_8929 ) ( ON ?AUTO_8934 ?AUTO_8930 ) ( CLEAR ?AUTO_8934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8934 ?AUTO_8930 )
      ( MAKE-ON ?AUTO_8928 ?AUTO_8929 )
      ( MAKE-ON-VERIFY ?AUTO_8928 ?AUTO_8929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8937 - BLOCK
      ?AUTO_8938 - BLOCK
    )
    :vars
    (
      ?AUTO_8943 - BLOCK
      ?AUTO_8940 - BLOCK
      ?AUTO_8941 - BLOCK
      ?AUTO_8944 - BLOCK
      ?AUTO_8945 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8937 ?AUTO_8943 ) ( CLEAR ?AUTO_8937 ) ( ON ?AUTO_8940 ?AUTO_8938 ) ( ON ?AUTO_8941 ?AUTO_8940 ) ( CLEAR ?AUTO_8941 ) ( HOLDING ?AUTO_8944 ) ( CLEAR ?AUTO_8945 ) )
    :subtasks
    ( ( !STACK ?AUTO_8944 ?AUTO_8945 )
      ( MAKE-ON ?AUTO_8937 ?AUTO_8938 )
      ( MAKE-ON-VERIFY ?AUTO_8937 ?AUTO_8938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8950 - BLOCK
      ?AUTO_8951 - BLOCK
    )
    :vars
    (
      ?AUTO_8953 - BLOCK
      ?AUTO_8957 - BLOCK
      ?AUTO_8958 - BLOCK
      ?AUTO_8952 - BLOCK
      ?AUTO_8956 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8950 ?AUTO_8953 ) ( CLEAR ?AUTO_8950 ) ( ON ?AUTO_8957 ?AUTO_8951 ) ( ON ?AUTO_8958 ?AUTO_8957 ) ( CLEAR ?AUTO_8952 ) ( ON ?AUTO_8956 ?AUTO_8958 ) ( CLEAR ?AUTO_8956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8956 ?AUTO_8958 )
      ( MAKE-ON ?AUTO_8950 ?AUTO_8951 )
      ( MAKE-ON-VERIFY ?AUTO_8950 ?AUTO_8951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8961 - BLOCK
      ?AUTO_8962 - BLOCK
    )
    :vars
    (
      ?AUTO_8966 - BLOCK
      ?AUTO_8967 - BLOCK
      ?AUTO_8968 - BLOCK
      ?AUTO_8965 - BLOCK
      ?AUTO_8969 - BLOCK
      ?AUTO_8970 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8961 ?AUTO_8966 ) ( CLEAR ?AUTO_8961 ) ( ON ?AUTO_8967 ?AUTO_8962 ) ( ON ?AUTO_8968 ?AUTO_8967 ) ( CLEAR ?AUTO_8965 ) ( ON ?AUTO_8969 ?AUTO_8968 ) ( CLEAR ?AUTO_8969 ) ( HOLDING ?AUTO_8970 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8970 )
      ( MAKE-ON ?AUTO_8961 ?AUTO_8962 )
      ( MAKE-ON-VERIFY ?AUTO_8961 ?AUTO_8962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8971 - BLOCK
      ?AUTO_8972 - BLOCK
    )
    :vars
    (
      ?AUTO_8973 - BLOCK
      ?AUTO_8974 - BLOCK
      ?AUTO_8976 - BLOCK
      ?AUTO_8979 - BLOCK
      ?AUTO_8975 - BLOCK
      ?AUTO_8980 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8971 ?AUTO_8973 ) ( CLEAR ?AUTO_8971 ) ( ON ?AUTO_8974 ?AUTO_8972 ) ( ON ?AUTO_8976 ?AUTO_8974 ) ( CLEAR ?AUTO_8979 ) ( ON ?AUTO_8975 ?AUTO_8976 ) ( ON ?AUTO_8980 ?AUTO_8975 ) ( CLEAR ?AUTO_8980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8980 ?AUTO_8975 )
      ( MAKE-ON ?AUTO_8971 ?AUTO_8972 )
      ( MAKE-ON-VERIFY ?AUTO_8971 ?AUTO_8972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8983 - BLOCK
      ?AUTO_8984 - BLOCK
    )
    :vars
    (
      ?AUTO_8986 - BLOCK
      ?AUTO_8989 - BLOCK
      ?AUTO_8991 - BLOCK
      ?AUTO_8988 - BLOCK
      ?AUTO_8992 - BLOCK
      ?AUTO_8987 - BLOCK
      ?AUTO_8993 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8983 ?AUTO_8986 ) ( CLEAR ?AUTO_8983 ) ( ON ?AUTO_8989 ?AUTO_8984 ) ( ON ?AUTO_8991 ?AUTO_8989 ) ( CLEAR ?AUTO_8988 ) ( ON ?AUTO_8992 ?AUTO_8991 ) ( ON ?AUTO_8987 ?AUTO_8992 ) ( CLEAR ?AUTO_8987 ) ( HOLDING ?AUTO_8993 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8993 )
      ( MAKE-ON ?AUTO_8983 ?AUTO_8984 )
      ( MAKE-ON-VERIFY ?AUTO_8983 ?AUTO_8984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8996 - BLOCK
      ?AUTO_8995 - BLOCK
    )
    :vars
    (
      ?AUTO_9003 - BLOCK
      ?AUTO_9004 - BLOCK
      ?AUTO_8997 - BLOCK
      ?AUTO_8998 - BLOCK
      ?AUTO_8999 - BLOCK
      ?AUTO_9000 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8996 ?AUTO_9003 ) ( ON ?AUTO_9004 ?AUTO_8995 ) ( ON ?AUTO_8997 ?AUTO_9004 ) ( ON ?AUTO_8998 ?AUTO_8997 ) ( ON ?AUTO_8999 ?AUTO_8998 ) ( CLEAR ?AUTO_8999 ) ( ON ?AUTO_9000 ?AUTO_8996 ) ( CLEAR ?AUTO_9000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9000 ?AUTO_8996 )
      ( MAKE-ON ?AUTO_8996 ?AUTO_8995 )
      ( MAKE-ON-VERIFY ?AUTO_8996 ?AUTO_8995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9009 - BLOCK
      ?AUTO_9010 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9009 ) ( CLEAR ?AUTO_9010 ) )
    :subtasks
    ( ( !STACK ?AUTO_9009 ?AUTO_9010 )
      ( MAKE-ON-VERIFY ?AUTO_9009 ?AUTO_9010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9013 - BLOCK
      ?AUTO_9014 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9014 ) ( ON-TABLE ?AUTO_9013 ) ( CLEAR ?AUTO_9013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9013 )
      ( MAKE-ON ?AUTO_9013 ?AUTO_9014 )
      ( MAKE-ON-VERIFY ?AUTO_9013 ?AUTO_9014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9018 - BLOCK
      ?AUTO_9019 - BLOCK
    )
    :vars
    (
      ?AUTO_9023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9018 ) ( CLEAR ?AUTO_9018 ) ( HOLDING ?AUTO_9019 ) ( CLEAR ?AUTO_9023 ) )
    :subtasks
    ( ( !STACK ?AUTO_9019 ?AUTO_9023 )
      ( MAKE-ON ?AUTO_9018 ?AUTO_9019 )
      ( MAKE-ON-VERIFY ?AUTO_9018 ?AUTO_9019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9032 - BLOCK
      ?AUTO_9033 - BLOCK
    )
    :vars
    (
      ?AUTO_9037 - BLOCK
      ?AUTO_9034 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9033 ) ( ON ?AUTO_9032 ?AUTO_9037 ) ( ON ?AUTO_9034 ?AUTO_9032 ) ( CLEAR ?AUTO_9034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9034 ?AUTO_9032 )
      ( MAKE-ON ?AUTO_9032 ?AUTO_9033 )
      ( MAKE-ON-VERIFY ?AUTO_9032 ?AUTO_9033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9040 - BLOCK
      ?AUTO_9041 - BLOCK
    )
    :vars
    (
      ?AUTO_9045 - BLOCK
      ?AUTO_9044 - BLOCK
      ?AUTO_9046 - BLOCK
      ?AUTO_9047 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9041 ) ( ON ?AUTO_9040 ?AUTO_9045 ) ( ON ?AUTO_9044 ?AUTO_9040 ) ( CLEAR ?AUTO_9044 ) ( HOLDING ?AUTO_9046 ) ( CLEAR ?AUTO_9047 ) )
    :subtasks
    ( ( !STACK ?AUTO_9046 ?AUTO_9047 )
      ( MAKE-ON ?AUTO_9040 ?AUTO_9041 )
      ( MAKE-ON-VERIFY ?AUTO_9040 ?AUTO_9041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9052 - BLOCK
      ?AUTO_9053 - BLOCK
    )
    :vars
    (
      ?AUTO_9054 - BLOCK
      ?AUTO_9055 - BLOCK
      ?AUTO_9059 - BLOCK
      ?AUTO_9056 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9053 ) ( ON ?AUTO_9052 ?AUTO_9054 ) ( ON ?AUTO_9055 ?AUTO_9052 ) ( CLEAR ?AUTO_9059 ) ( ON ?AUTO_9056 ?AUTO_9055 ) ( CLEAR ?AUTO_9056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9056 ?AUTO_9055 )
      ( MAKE-ON ?AUTO_9052 ?AUTO_9053 )
      ( MAKE-ON-VERIFY ?AUTO_9052 ?AUTO_9053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9062 - BLOCK
      ?AUTO_9063 - BLOCK
    )
    :vars
    (
      ?AUTO_9066 - BLOCK
      ?AUTO_9067 - BLOCK
      ?AUTO_9068 - BLOCK
      ?AUTO_9069 - BLOCK
      ?AUTO_9070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9063 ) ( ON ?AUTO_9062 ?AUTO_9066 ) ( ON ?AUTO_9067 ?AUTO_9062 ) ( CLEAR ?AUTO_9068 ) ( ON ?AUTO_9069 ?AUTO_9067 ) ( CLEAR ?AUTO_9069 ) ( HOLDING ?AUTO_9070 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9070 )
      ( MAKE-ON ?AUTO_9062 ?AUTO_9063 )
      ( MAKE-ON-VERIFY ?AUTO_9062 ?AUTO_9063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9071 - BLOCK
      ?AUTO_9072 - BLOCK
    )
    :vars
    (
      ?AUTO_9079 - BLOCK
      ?AUTO_9073 - BLOCK
      ?AUTO_9074 - BLOCK
      ?AUTO_9075 - BLOCK
      ?AUTO_9078 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9072 ) ( ON ?AUTO_9071 ?AUTO_9079 ) ( ON ?AUTO_9073 ?AUTO_9071 ) ( CLEAR ?AUTO_9074 ) ( ON ?AUTO_9075 ?AUTO_9073 ) ( ON ?AUTO_9078 ?AUTO_9075 ) ( CLEAR ?AUTO_9078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9078 ?AUTO_9075 )
      ( MAKE-ON ?AUTO_9071 ?AUTO_9072 )
      ( MAKE-ON-VERIFY ?AUTO_9071 ?AUTO_9072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9082 - BLOCK
      ?AUTO_9083 - BLOCK
    )
    :vars
    (
      ?AUTO_9090 - BLOCK
      ?AUTO_9087 - BLOCK
      ?AUTO_9086 - BLOCK
      ?AUTO_9089 - BLOCK
      ?AUTO_9088 - BLOCK
      ?AUTO_9091 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9083 ) ( ON ?AUTO_9082 ?AUTO_9090 ) ( ON ?AUTO_9087 ?AUTO_9082 ) ( CLEAR ?AUTO_9086 ) ( ON ?AUTO_9089 ?AUTO_9087 ) ( ON ?AUTO_9088 ?AUTO_9089 ) ( CLEAR ?AUTO_9088 ) ( HOLDING ?AUTO_9091 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9091 )
      ( MAKE-ON ?AUTO_9082 ?AUTO_9083 )
      ( MAKE-ON-VERIFY ?AUTO_9082 ?AUTO_9083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9092 - BLOCK
      ?AUTO_9095 - BLOCK
    )
    :vars
    (
      ?AUTO_9100 - BLOCK
      ?AUTO_9099 - BLOCK
      ?AUTO_9096 - BLOCK
      ?AUTO_9094 - BLOCK
      ?AUTO_9101 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9092 ?AUTO_9100 ) ( ON ?AUTO_9099 ?AUTO_9092 ) ( ON ?AUTO_9096 ?AUTO_9099 ) ( ON ?AUTO_9094 ?AUTO_9096 ) ( CLEAR ?AUTO_9094 ) ( ON ?AUTO_9101 ?AUTO_9095 ) ( CLEAR ?AUTO_9101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9101 ?AUTO_9095 )
      ( MAKE-ON ?AUTO_9092 ?AUTO_9095 )
      ( MAKE-ON-VERIFY ?AUTO_9092 ?AUTO_9095 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9106 - BLOCK
      ?AUTO_9107 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9106 ) ( CLEAR ?AUTO_9107 ) )
    :subtasks
    ( ( !STACK ?AUTO_9106 ?AUTO_9107 )
      ( MAKE-ON-VERIFY ?AUTO_9106 ?AUTO_9107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9110 - BLOCK
      ?AUTO_9111 - BLOCK
    )
    :vars
    (
      ?AUTO_9115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9111 ) ( ON ?AUTO_9110 ?AUTO_9115 ) ( CLEAR ?AUTO_9110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9110 ?AUTO_9115 )
      ( MAKE-ON ?AUTO_9110 ?AUTO_9111 )
      ( MAKE-ON-VERIFY ?AUTO_9110 ?AUTO_9111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9116 - BLOCK
      ?AUTO_9117 - BLOCK
    )
    :vars
    (
      ?AUTO_9120 - BLOCK
      ?AUTO_9122 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9116 ?AUTO_9120 ) ( CLEAR ?AUTO_9116 ) ( HOLDING ?AUTO_9117 ) ( CLEAR ?AUTO_9122 ) )
    :subtasks
    ( ( !STACK ?AUTO_9117 ?AUTO_9122 )
      ( MAKE-ON ?AUTO_9116 ?AUTO_9117 )
      ( MAKE-ON-VERIFY ?AUTO_9116 ?AUTO_9117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9125 - BLOCK
      ?AUTO_9126 - BLOCK
    )
    :vars
    (
      ?AUTO_9129 - BLOCK
      ?AUTO_9130 - BLOCK
      ?AUTO_9131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9126 ) ( ON ?AUTO_9125 ?AUTO_9129 ) ( CLEAR ?AUTO_9125 ) ( HOLDING ?AUTO_9130 ) ( CLEAR ?AUTO_9131 ) )
    :subtasks
    ( ( !STACK ?AUTO_9130 ?AUTO_9131 )
      ( MAKE-ON ?AUTO_9125 ?AUTO_9126 )
      ( MAKE-ON-VERIFY ?AUTO_9125 ?AUTO_9126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9132 - BLOCK
      ?AUTO_9133 - BLOCK
    )
    :vars
    (
      ?AUTO_9136 - BLOCK
      ?AUTO_9138 - BLOCK
      ?AUTO_9137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9133 ) ( ON ?AUTO_9132 ?AUTO_9136 ) ( CLEAR ?AUTO_9138 ) ( ON ?AUTO_9137 ?AUTO_9132 ) ( CLEAR ?AUTO_9137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9137 ?AUTO_9132 )
      ( MAKE-ON ?AUTO_9132 ?AUTO_9133 )
      ( MAKE-ON-VERIFY ?AUTO_9132 ?AUTO_9133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9141 - BLOCK
      ?AUTO_9142 - BLOCK
    )
    :vars
    (
      ?AUTO_9147 - BLOCK
      ?AUTO_9143 - BLOCK
      ?AUTO_9146 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9141 ?AUTO_9147 ) ( CLEAR ?AUTO_9143 ) ( ON ?AUTO_9146 ?AUTO_9141 ) ( CLEAR ?AUTO_9146 ) ( HOLDING ?AUTO_9142 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9142 )
      ( MAKE-ON ?AUTO_9141 ?AUTO_9142 )
      ( MAKE-ON-VERIFY ?AUTO_9141 ?AUTO_9142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9151 - BLOCK
      ?AUTO_9152 - BLOCK
    )
    :vars
    (
      ?AUTO_9157 - BLOCK
      ?AUTO_9154 - BLOCK
      ?AUTO_9156 - BLOCK
      ?AUTO_9158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9152 ) ( ON ?AUTO_9151 ?AUTO_9157 ) ( CLEAR ?AUTO_9154 ) ( ON ?AUTO_9156 ?AUTO_9151 ) ( CLEAR ?AUTO_9156 ) ( HOLDING ?AUTO_9158 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9158 )
      ( MAKE-ON ?AUTO_9151 ?AUTO_9152 )
      ( MAKE-ON-VERIFY ?AUTO_9151 ?AUTO_9152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9159 - BLOCK
      ?AUTO_9160 - BLOCK
    )
    :vars
    (
      ?AUTO_9165 - BLOCK
      ?AUTO_9164 - BLOCK
      ?AUTO_9166 - BLOCK
      ?AUTO_9162 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9159 ?AUTO_9165 ) ( CLEAR ?AUTO_9164 ) ( ON ?AUTO_9166 ?AUTO_9159 ) ( CLEAR ?AUTO_9166 ) ( ON ?AUTO_9162 ?AUTO_9160 ) ( CLEAR ?AUTO_9162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9162 ?AUTO_9160 )
      ( MAKE-ON ?AUTO_9159 ?AUTO_9160 )
      ( MAKE-ON-VERIFY ?AUTO_9159 ?AUTO_9160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9169 - BLOCK
      ?AUTO_9170 - BLOCK
    )
    :vars
    (
      ?AUTO_9174 - BLOCK
      ?AUTO_9175 - BLOCK
      ?AUTO_9171 - BLOCK
      ?AUTO_9172 - BLOCK
      ?AUTO_9177 - BLOCK
      ?AUTO_9178 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9169 ?AUTO_9174 ) ( CLEAR ?AUTO_9175 ) ( ON ?AUTO_9171 ?AUTO_9169 ) ( CLEAR ?AUTO_9171 ) ( ON ?AUTO_9172 ?AUTO_9170 ) ( CLEAR ?AUTO_9172 ) ( HOLDING ?AUTO_9177 ) ( CLEAR ?AUTO_9178 ) )
    :subtasks
    ( ( !STACK ?AUTO_9177 ?AUTO_9178 )
      ( MAKE-ON ?AUTO_9169 ?AUTO_9170 )
      ( MAKE-ON-VERIFY ?AUTO_9169 ?AUTO_9170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9183 - BLOCK
      ?AUTO_9184 - BLOCK
    )
    :vars
    (
      ?AUTO_9190 - BLOCK
      ?AUTO_9192 - BLOCK
      ?AUTO_9191 - BLOCK
      ?AUTO_9188 - BLOCK
      ?AUTO_9187 - BLOCK
      ?AUTO_9185 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9183 ?AUTO_9190 ) ( CLEAR ?AUTO_9192 ) ( ON ?AUTO_9191 ?AUTO_9183 ) ( CLEAR ?AUTO_9191 ) ( ON ?AUTO_9188 ?AUTO_9184 ) ( CLEAR ?AUTO_9187 ) ( ON ?AUTO_9185 ?AUTO_9188 ) ( CLEAR ?AUTO_9185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9185 ?AUTO_9188 )
      ( MAKE-ON ?AUTO_9183 ?AUTO_9184 )
      ( MAKE-ON-VERIFY ?AUTO_9183 ?AUTO_9184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9195 - BLOCK
      ?AUTO_9196 - BLOCK
    )
    :vars
    (
      ?AUTO_9201 - BLOCK
      ?AUTO_9204 - BLOCK
      ?AUTO_9199 - BLOCK
      ?AUTO_9202 - BLOCK
      ?AUTO_9200 - BLOCK
      ?AUTO_9203 - BLOCK
      ?AUTO_9205 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9195 ?AUTO_9201 ) ( CLEAR ?AUTO_9204 ) ( ON ?AUTO_9199 ?AUTO_9195 ) ( CLEAR ?AUTO_9199 ) ( ON ?AUTO_9202 ?AUTO_9196 ) ( CLEAR ?AUTO_9200 ) ( ON ?AUTO_9203 ?AUTO_9202 ) ( CLEAR ?AUTO_9203 ) ( HOLDING ?AUTO_9205 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9205 )
      ( MAKE-ON ?AUTO_9195 ?AUTO_9196 )
      ( MAKE-ON-VERIFY ?AUTO_9195 ?AUTO_9196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9206 - BLOCK
      ?AUTO_9207 - BLOCK
    )
    :vars
    (
      ?AUTO_9208 - BLOCK
      ?AUTO_9214 - BLOCK
      ?AUTO_9215 - BLOCK
      ?AUTO_9212 - BLOCK
      ?AUTO_9211 - BLOCK
      ?AUTO_9213 - BLOCK
      ?AUTO_9216 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9206 ?AUTO_9208 ) ( CLEAR ?AUTO_9214 ) ( ON ?AUTO_9215 ?AUTO_9206 ) ( CLEAR ?AUTO_9215 ) ( ON ?AUTO_9212 ?AUTO_9207 ) ( CLEAR ?AUTO_9211 ) ( ON ?AUTO_9213 ?AUTO_9212 ) ( ON ?AUTO_9216 ?AUTO_9213 ) ( CLEAR ?AUTO_9216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9216 ?AUTO_9213 )
      ( MAKE-ON ?AUTO_9206 ?AUTO_9207 )
      ( MAKE-ON-VERIFY ?AUTO_9206 ?AUTO_9207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9219 - BLOCK
      ?AUTO_9220 - BLOCK
    )
    :vars
    (
      ?AUTO_9229 - BLOCK
      ?AUTO_9225 - BLOCK
      ?AUTO_9228 - BLOCK
      ?AUTO_9222 - BLOCK
      ?AUTO_9223 - BLOCK
      ?AUTO_9224 - BLOCK
      ?AUTO_9227 - BLOCK
      ?AUTO_9230 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9219 ?AUTO_9229 ) ( CLEAR ?AUTO_9225 ) ( ON ?AUTO_9228 ?AUTO_9219 ) ( CLEAR ?AUTO_9228 ) ( ON ?AUTO_9222 ?AUTO_9220 ) ( CLEAR ?AUTO_9223 ) ( ON ?AUTO_9224 ?AUTO_9222 ) ( ON ?AUTO_9227 ?AUTO_9224 ) ( CLEAR ?AUTO_9227 ) ( HOLDING ?AUTO_9230 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9230 )
      ( MAKE-ON ?AUTO_9219 ?AUTO_9220 )
      ( MAKE-ON-VERIFY ?AUTO_9219 ?AUTO_9220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9231 - BLOCK
      ?AUTO_9232 - BLOCK
    )
    :vars
    (
      ?AUTO_9234 - BLOCK
      ?AUTO_9241 - BLOCK
      ?AUTO_9233 - BLOCK
      ?AUTO_9240 - BLOCK
      ?AUTO_9236 - BLOCK
      ?AUTO_9242 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9231 ?AUTO_9234 ) ( ON ?AUTO_9241 ?AUTO_9231 ) ( ON ?AUTO_9233 ?AUTO_9232 ) ( ON ?AUTO_9240 ?AUTO_9233 ) ( ON ?AUTO_9236 ?AUTO_9240 ) ( CLEAR ?AUTO_9236 ) ( ON ?AUTO_9242 ?AUTO_9241 ) ( CLEAR ?AUTO_9242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9242 ?AUTO_9241 )
      ( MAKE-ON ?AUTO_9231 ?AUTO_9232 )
      ( MAKE-ON-VERIFY ?AUTO_9231 ?AUTO_9232 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9247 - BLOCK
      ?AUTO_9248 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9247 ) ( CLEAR ?AUTO_9248 ) )
    :subtasks
    ( ( !STACK ?AUTO_9247 ?AUTO_9248 )
      ( MAKE-ON-VERIFY ?AUTO_9247 ?AUTO_9248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9251 - BLOCK
      ?AUTO_9252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9252 ) ( ON-TABLE ?AUTO_9251 ) ( CLEAR ?AUTO_9251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9251 )
      ( MAKE-ON ?AUTO_9251 ?AUTO_9252 )
      ( MAKE-ON-VERIFY ?AUTO_9251 ?AUTO_9252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9256 - BLOCK
      ?AUTO_9257 - BLOCK
    )
    :vars
    (
      ?AUTO_9260 - BLOCK
      ?AUTO_9261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9257 ) ( ON-TABLE ?AUTO_9256 ) ( CLEAR ?AUTO_9256 ) ( HOLDING ?AUTO_9260 ) ( CLEAR ?AUTO_9261 ) )
    :subtasks
    ( ( !STACK ?AUTO_9260 ?AUTO_9261 )
      ( MAKE-ON ?AUTO_9256 ?AUTO_9257 )
      ( MAKE-ON-VERIFY ?AUTO_9256 ?AUTO_9257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9262 - BLOCK
      ?AUTO_9263 - BLOCK
    )
    :vars
    (
      ?AUTO_9267 - BLOCK
      ?AUTO_9266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9263 ) ( ON-TABLE ?AUTO_9262 ) ( CLEAR ?AUTO_9267 ) ( ON ?AUTO_9266 ?AUTO_9262 ) ( CLEAR ?AUTO_9266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9266 ?AUTO_9262 )
      ( MAKE-ON ?AUTO_9262 ?AUTO_9263 )
      ( MAKE-ON-VERIFY ?AUTO_9262 ?AUTO_9263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9270 - BLOCK
      ?AUTO_9271 - BLOCK
    )
    :vars
    (
      ?AUTO_9275 - BLOCK
      ?AUTO_9272 - BLOCK
      ?AUTO_9277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9271 ) ( ON-TABLE ?AUTO_9270 ) ( ON ?AUTO_9275 ?AUTO_9270 ) ( CLEAR ?AUTO_9275 ) ( HOLDING ?AUTO_9272 ) ( CLEAR ?AUTO_9277 ) )
    :subtasks
    ( ( !STACK ?AUTO_9272 ?AUTO_9277 )
      ( MAKE-ON ?AUTO_9270 ?AUTO_9271 )
      ( MAKE-ON-VERIFY ?AUTO_9270 ?AUTO_9271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9282 - BLOCK
      ?AUTO_9283 - BLOCK
    )
    :vars
    (
      ?AUTO_9286 - BLOCK
      ?AUTO_9288 - BLOCK
      ?AUTO_9284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9283 ) ( ON-TABLE ?AUTO_9282 ) ( ON ?AUTO_9286 ?AUTO_9282 ) ( CLEAR ?AUTO_9288 ) ( ON ?AUTO_9284 ?AUTO_9286 ) ( CLEAR ?AUTO_9284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9284 ?AUTO_9286 )
      ( MAKE-ON ?AUTO_9282 ?AUTO_9283 )
      ( MAKE-ON-VERIFY ?AUTO_9282 ?AUTO_9283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9291 - BLOCK
      ?AUTO_9292 - BLOCK
    )
    :vars
    (
      ?AUTO_9297 - BLOCK
      ?AUTO_9296 - BLOCK
      ?AUTO_9295 - BLOCK
      ?AUTO_9298 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9292 ) ( ON-TABLE ?AUTO_9291 ) ( ON ?AUTO_9297 ?AUTO_9291 ) ( CLEAR ?AUTO_9296 ) ( ON ?AUTO_9295 ?AUTO_9297 ) ( CLEAR ?AUTO_9295 ) ( HOLDING ?AUTO_9298 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9298 )
      ( MAKE-ON ?AUTO_9291 ?AUTO_9292 )
      ( MAKE-ON-VERIFY ?AUTO_9291 ?AUTO_9292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9305 - BLOCK
      ?AUTO_9306 - BLOCK
    )
    :vars
    (
      ?AUTO_9308 - BLOCK
      ?AUTO_9309 - BLOCK
      ?AUTO_9311 - BLOCK
      ?AUTO_9313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9305 ) ( ON ?AUTO_9308 ?AUTO_9305 ) ( CLEAR ?AUTO_9309 ) ( ON ?AUTO_9311 ?AUTO_9308 ) ( CLEAR ?AUTO_9311 ) ( HOLDING ?AUTO_9306 ) ( CLEAR ?AUTO_9313 ) )
    :subtasks
    ( ( !STACK ?AUTO_9306 ?AUTO_9313 )
      ( MAKE-ON ?AUTO_9305 ?AUTO_9306 )
      ( MAKE-ON-VERIFY ?AUTO_9305 ?AUTO_9306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9326 - BLOCK
      ?AUTO_9327 - BLOCK
    )
    :vars
    (
      ?AUTO_9332 - BLOCK
      ?AUTO_9333 - BLOCK
      ?AUTO_9330 - BLOCK
      ?AUTO_9331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9327 ) ( ON-TABLE ?AUTO_9326 ) ( ON ?AUTO_9332 ?AUTO_9326 ) ( CLEAR ?AUTO_9333 ) ( ON ?AUTO_9330 ?AUTO_9332 ) ( ON ?AUTO_9331 ?AUTO_9330 ) ( CLEAR ?AUTO_9331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9331 ?AUTO_9330 )
      ( MAKE-ON ?AUTO_9326 ?AUTO_9327 )
      ( MAKE-ON-VERIFY ?AUTO_9326 ?AUTO_9327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9338 - BLOCK
      ?AUTO_9339 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9338 ) ( CLEAR ?AUTO_9339 ) )
    :subtasks
    ( ( !STACK ?AUTO_9338 ?AUTO_9339 )
      ( MAKE-ON-VERIFY ?AUTO_9338 ?AUTO_9339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9342 - BLOCK
      ?AUTO_9343 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9343 ) ( ON-TABLE ?AUTO_9342 ) ( CLEAR ?AUTO_9342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9342 )
      ( MAKE-ON ?AUTO_9342 ?AUTO_9343 )
      ( MAKE-ON-VERIFY ?AUTO_9342 ?AUTO_9343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9347 - BLOCK
      ?AUTO_9348 - BLOCK
    )
    :vars
    (
      ?AUTO_9351 - BLOCK
      ?AUTO_9352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9348 ) ( ON-TABLE ?AUTO_9347 ) ( CLEAR ?AUTO_9347 ) ( HOLDING ?AUTO_9351 ) ( CLEAR ?AUTO_9352 ) )
    :subtasks
    ( ( !STACK ?AUTO_9351 ?AUTO_9352 )
      ( MAKE-ON ?AUTO_9347 ?AUTO_9348 )
      ( MAKE-ON-VERIFY ?AUTO_9347 ?AUTO_9348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9355 - BLOCK
      ?AUTO_9356 - BLOCK
    )
    :vars
    (
      ?AUTO_9360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9355 ) ( CLEAR ?AUTO_9355 ) ( HOLDING ?AUTO_9356 ) ( CLEAR ?AUTO_9360 ) )
    :subtasks
    ( ( !STACK ?AUTO_9356 ?AUTO_9360 )
      ( MAKE-ON ?AUTO_9355 ?AUTO_9356 )
      ( MAKE-ON-VERIFY ?AUTO_9355 ?AUTO_9356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9369 - BLOCK
      ?AUTO_9370 - BLOCK
    )
    :vars
    (
      ?AUTO_9374 - BLOCK
      ?AUTO_9373 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9369 ) ( CLEAR ?AUTO_9369 ) ( CLEAR ?AUTO_9374 ) ( ON ?AUTO_9373 ?AUTO_9370 ) ( CLEAR ?AUTO_9373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9373 ?AUTO_9370 )
      ( MAKE-ON ?AUTO_9369 ?AUTO_9370 )
      ( MAKE-ON-VERIFY ?AUTO_9369 ?AUTO_9370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9377 - BLOCK
      ?AUTO_9378 - BLOCK
    )
    :vars
    (
      ?AUTO_9382 - BLOCK
      ?AUTO_9381 - BLOCK
      ?AUTO_9383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9377 ) ( CLEAR ?AUTO_9377 ) ( CLEAR ?AUTO_9382 ) ( ON ?AUTO_9381 ?AUTO_9378 ) ( CLEAR ?AUTO_9381 ) ( HOLDING ?AUTO_9383 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9383 )
      ( MAKE-ON ?AUTO_9377 ?AUTO_9378 )
      ( MAKE-ON-VERIFY ?AUTO_9377 ?AUTO_9378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9386 - BLOCK
      ?AUTO_9387 - BLOCK
    )
    :vars
    (
      ?AUTO_9390 - BLOCK
      ?AUTO_9389 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9390 ) ( ON ?AUTO_9389 ?AUTO_9387 ) ( CLEAR ?AUTO_9389 ) ( HOLDING ?AUTO_9386 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9386 )
      ( MAKE-ON ?AUTO_9386 ?AUTO_9387 )
      ( MAKE-ON-VERIFY ?AUTO_9386 ?AUTO_9387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9405 - BLOCK
      ?AUTO_9406 - BLOCK
    )
    :vars
    (
      ?AUTO_9407 - BLOCK
      ?AUTO_9411 - BLOCK
      ?AUTO_9410 - BLOCK
      ?AUTO_9409 - BLOCK
      ?AUTO_9413 - BLOCK
      ?AUTO_9412 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9405 ?AUTO_9407 ) ( CLEAR ?AUTO_9411 ) ( ON ?AUTO_9410 ?AUTO_9405 ) ( ON ?AUTO_9409 ?AUTO_9406 ) ( CLEAR ?AUTO_9409 ) ( CLEAR ?AUTO_9413 ) ( ON ?AUTO_9412 ?AUTO_9410 ) ( CLEAR ?AUTO_9412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9412 ?AUTO_9410 )
      ( MAKE-ON ?AUTO_9405 ?AUTO_9406 )
      ( MAKE-ON-VERIFY ?AUTO_9405 ?AUTO_9406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9417 - BLOCK
      ?AUTO_9418 - BLOCK
    )
    :vars
    (
      ?AUTO_9421 - BLOCK
      ?AUTO_9423 - BLOCK
      ?AUTO_9425 - BLOCK
      ?AUTO_9422 - BLOCK
      ?AUTO_9426 - BLOCK
      ?AUTO_9424 - BLOCK
      ?AUTO_9427 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9417 ?AUTO_9421 ) ( CLEAR ?AUTO_9423 ) ( ON ?AUTO_9425 ?AUTO_9417 ) ( ON ?AUTO_9422 ?AUTO_9418 ) ( CLEAR ?AUTO_9422 ) ( CLEAR ?AUTO_9426 ) ( ON ?AUTO_9424 ?AUTO_9425 ) ( CLEAR ?AUTO_9424 ) ( HOLDING ?AUTO_9427 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9427 )
      ( MAKE-ON ?AUTO_9417 ?AUTO_9418 )
      ( MAKE-ON-VERIFY ?AUTO_9417 ?AUTO_9418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9428 - BLOCK
      ?AUTO_9429 - BLOCK
    )
    :vars
    (
      ?AUTO_9434 - BLOCK
      ?AUTO_9432 - BLOCK
      ?AUTO_9431 - BLOCK
      ?AUTO_9433 - BLOCK
      ?AUTO_9438 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9428 ?AUTO_9434 ) ( ON ?AUTO_9432 ?AUTO_9428 ) ( ON ?AUTO_9431 ?AUTO_9429 ) ( ON ?AUTO_9433 ?AUTO_9432 ) ( CLEAR ?AUTO_9433 ) ( ON ?AUTO_9438 ?AUTO_9431 ) ( CLEAR ?AUTO_9438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9438 ?AUTO_9431 )
      ( MAKE-ON ?AUTO_9428 ?AUTO_9429 )
      ( MAKE-ON-VERIFY ?AUTO_9428 ?AUTO_9429 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9440 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9440 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9440 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9440 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9442 - BLOCK
    )
    :vars
    (
      ?AUTO_9445 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9442 ?AUTO_9445 ) ( CLEAR ?AUTO_9442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9442 ?AUTO_9445 )
      ( MAKE-ON-TABLE ?AUTO_9442 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9442 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9447 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9447 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9447 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9447 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9449 - BLOCK
    )
    :vars
    (
      ?AUTO_9452 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9449 ?AUTO_9452 ) ( CLEAR ?AUTO_9449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9449 ?AUTO_9452 )
      ( MAKE-ON-TABLE ?AUTO_9449 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9449 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9453 - BLOCK
    )
    :vars
    (
      ?AUTO_9455 - BLOCK
      ?AUTO_9456 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9453 ?AUTO_9455 ) ( CLEAR ?AUTO_9453 ) ( HOLDING ?AUTO_9456 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9456 )
      ( MAKE-ON-TABLE ?AUTO_9453 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9453 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9457 - BLOCK
    )
    :vars
    (
      ?AUTO_9459 - BLOCK
      ?AUTO_9460 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9457 ?AUTO_9459 ) ( ON ?AUTO_9460 ?AUTO_9457 ) ( CLEAR ?AUTO_9460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9460 ?AUTO_9457 )
      ( MAKE-ON-TABLE ?AUTO_9457 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9457 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9464 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9464 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9464 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9464 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9466 - BLOCK
    )
    :vars
    (
      ?AUTO_9469 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9466 ?AUTO_9469 ) ( CLEAR ?AUTO_9466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9466 ?AUTO_9469 )
      ( MAKE-ON-TABLE ?AUTO_9466 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9466 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9470 - BLOCK
    )
    :vars
    (
      ?AUTO_9472 - BLOCK
      ?AUTO_9473 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9470 ?AUTO_9472 ) ( CLEAR ?AUTO_9470 ) ( HOLDING ?AUTO_9473 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9473 )
      ( MAKE-ON-TABLE ?AUTO_9470 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9470 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9474 - BLOCK
    )
    :vars
    (
      ?AUTO_9476 - BLOCK
      ?AUTO_9477 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9474 ?AUTO_9476 ) ( ON ?AUTO_9477 ?AUTO_9474 ) ( CLEAR ?AUTO_9477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9477 ?AUTO_9474 )
      ( MAKE-ON-TABLE ?AUTO_9474 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9474 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9480 - BLOCK
    )
    :vars
    (
      ?AUTO_9481 - BLOCK
      ?AUTO_9482 - BLOCK
      ?AUTO_9484 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9480 ?AUTO_9481 ) ( ON ?AUTO_9482 ?AUTO_9480 ) ( CLEAR ?AUTO_9482 ) ( HOLDING ?AUTO_9484 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9484 )
      ( MAKE-ON-TABLE ?AUTO_9480 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9480 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9485 - BLOCK
    )
    :vars
    (
      ?AUTO_9486 - BLOCK
      ?AUTO_9488 - BLOCK
      ?AUTO_9489 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9485 ?AUTO_9486 ) ( ON ?AUTO_9488 ?AUTO_9485 ) ( ON ?AUTO_9489 ?AUTO_9488 ) ( CLEAR ?AUTO_9489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9489 ?AUTO_9488 )
      ( MAKE-ON-TABLE ?AUTO_9485 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9494 - BLOCK
      ?AUTO_9495 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9494 ) ( CLEAR ?AUTO_9495 ) )
    :subtasks
    ( ( !STACK ?AUTO_9494 ?AUTO_9495 )
      ( MAKE-ON-VERIFY ?AUTO_9494 ?AUTO_9495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9498 - BLOCK
      ?AUTO_9499 - BLOCK
    )
    :vars
    (
      ?AUTO_9503 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9499 ) ( ON ?AUTO_9498 ?AUTO_9503 ) ( CLEAR ?AUTO_9498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9498 ?AUTO_9503 )
      ( MAKE-ON ?AUTO_9498 ?AUTO_9499 )
      ( MAKE-ON-VERIFY ?AUTO_9498 ?AUTO_9499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9504 - BLOCK
      ?AUTO_9505 - BLOCK
    )
    :vars
    (
      ?AUTO_9508 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9504 ?AUTO_9508 ) ( CLEAR ?AUTO_9504 ) ( HOLDING ?AUTO_9505 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9505 )
      ( MAKE-ON ?AUTO_9504 ?AUTO_9505 )
      ( MAKE-ON-VERIFY ?AUTO_9504 ?AUTO_9505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9510 - BLOCK
      ?AUTO_9511 - BLOCK
    )
    :vars
    (
      ?AUTO_9512 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9510 ?AUTO_9512 ) ( ON ?AUTO_9511 ?AUTO_9510 ) ( CLEAR ?AUTO_9511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9511 ?AUTO_9510 )
      ( MAKE-ON ?AUTO_9510 ?AUTO_9511 )
      ( MAKE-ON-VERIFY ?AUTO_9510 ?AUTO_9511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9517 - BLOCK
      ?AUTO_9518 - BLOCK
    )
    :vars
    (
      ?AUTO_9521 - BLOCK
      ?AUTO_9522 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9517 ?AUTO_9521 ) ( ON ?AUTO_9518 ?AUTO_9517 ) ( CLEAR ?AUTO_9518 ) ( HOLDING ?AUTO_9522 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9522 )
      ( MAKE-ON ?AUTO_9517 ?AUTO_9518 )
      ( MAKE-ON-VERIFY ?AUTO_9517 ?AUTO_9518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9523 - BLOCK
      ?AUTO_9524 - BLOCK
    )
    :vars
    (
      ?AUTO_9526 - BLOCK
      ?AUTO_9527 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9523 ?AUTO_9526 ) ( ON ?AUTO_9524 ?AUTO_9523 ) ( ON ?AUTO_9527 ?AUTO_9524 ) ( CLEAR ?AUTO_9527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9527 ?AUTO_9524 )
      ( MAKE-ON ?AUTO_9523 ?AUTO_9524 )
      ( MAKE-ON-VERIFY ?AUTO_9523 ?AUTO_9524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9531 - BLOCK
      ?AUTO_9532 - BLOCK
    )
    :vars
    (
      ?AUTO_9536 - BLOCK
      ?AUTO_9535 - BLOCK
      ?AUTO_9537 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9531 ?AUTO_9536 ) ( ON ?AUTO_9532 ?AUTO_9531 ) ( ON ?AUTO_9535 ?AUTO_9532 ) ( CLEAR ?AUTO_9535 ) ( HOLDING ?AUTO_9537 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9537 )
      ( MAKE-ON ?AUTO_9531 ?AUTO_9532 )
      ( MAKE-ON-VERIFY ?AUTO_9531 ?AUTO_9532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9538 - BLOCK
      ?AUTO_9539 - BLOCK
    )
    :vars
    (
      ?AUTO_9542 - BLOCK
      ?AUTO_9543 - BLOCK
      ?AUTO_9544 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9538 ?AUTO_9542 ) ( ON ?AUTO_9539 ?AUTO_9538 ) ( ON ?AUTO_9543 ?AUTO_9539 ) ( ON ?AUTO_9544 ?AUTO_9543 ) ( CLEAR ?AUTO_9544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9544 ?AUTO_9543 )
      ( MAKE-ON ?AUTO_9538 ?AUTO_9539 )
      ( MAKE-ON-VERIFY ?AUTO_9538 ?AUTO_9539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9549 - BLOCK
      ?AUTO_9550 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9549 ) ( CLEAR ?AUTO_9550 ) )
    :subtasks
    ( ( !STACK ?AUTO_9549 ?AUTO_9550 )
      ( MAKE-ON-VERIFY ?AUTO_9549 ?AUTO_9550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9553 - BLOCK
      ?AUTO_9554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9554 ) ( ON-TABLE ?AUTO_9553 ) ( CLEAR ?AUTO_9553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9553 )
      ( MAKE-ON ?AUTO_9553 ?AUTO_9554 )
      ( MAKE-ON-VERIFY ?AUTO_9553 ?AUTO_9554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9558 - BLOCK
      ?AUTO_9559 - BLOCK
    )
    :vars
    (
      ?AUTO_9563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9558 ) ( CLEAR ?AUTO_9558 ) ( HOLDING ?AUTO_9559 ) ( CLEAR ?AUTO_9563 ) )
    :subtasks
    ( ( !STACK ?AUTO_9559 ?AUTO_9563 )
      ( MAKE-ON ?AUTO_9558 ?AUTO_9559 )
      ( MAKE-ON-VERIFY ?AUTO_9558 ?AUTO_9559 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9566 - BLOCK
      ?AUTO_9567 - BLOCK
    )
    :vars
    (
      ?AUTO_9570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9567 ) ( ON-TABLE ?AUTO_9566 ) ( CLEAR ?AUTO_9566 ) ( HOLDING ?AUTO_9570 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9570 )
      ( MAKE-ON ?AUTO_9566 ?AUTO_9567 )
      ( MAKE-ON-VERIFY ?AUTO_9566 ?AUTO_9567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9571 - BLOCK
      ?AUTO_9572 - BLOCK
    )
    :vars
    (
      ?AUTO_9575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9571 ) ( CLEAR ?AUTO_9571 ) ( ON ?AUTO_9575 ?AUTO_9572 ) ( CLEAR ?AUTO_9575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9575 ?AUTO_9572 )
      ( MAKE-ON ?AUTO_9571 ?AUTO_9572 )
      ( MAKE-ON-VERIFY ?AUTO_9571 ?AUTO_9572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9578 - BLOCK
      ?AUTO_9579 - BLOCK
    )
    :vars
    (
      ?AUTO_9582 - BLOCK
      ?AUTO_9583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9578 ) ( CLEAR ?AUTO_9578 ) ( ON ?AUTO_9582 ?AUTO_9579 ) ( CLEAR ?AUTO_9582 ) ( HOLDING ?AUTO_9583 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9583 )
      ( MAKE-ON ?AUTO_9578 ?AUTO_9579 )
      ( MAKE-ON-VERIFY ?AUTO_9578 ?AUTO_9579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9584 - BLOCK
      ?AUTO_9585 - BLOCK
    )
    :vars
    (
      ?AUTO_9586 - BLOCK
      ?AUTO_9589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9584 ) ( CLEAR ?AUTO_9584 ) ( ON ?AUTO_9586 ?AUTO_9585 ) ( ON ?AUTO_9589 ?AUTO_9586 ) ( CLEAR ?AUTO_9589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9589 ?AUTO_9586 )
      ( MAKE-ON ?AUTO_9584 ?AUTO_9585 )
      ( MAKE-ON-VERIFY ?AUTO_9584 ?AUTO_9585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9592 - BLOCK
      ?AUTO_9593 - BLOCK
    )
    :vars
    (
      ?AUTO_9595 - BLOCK
      ?AUTO_9594 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9595 ?AUTO_9593 ) ( ON ?AUTO_9594 ?AUTO_9595 ) ( CLEAR ?AUTO_9594 ) ( HOLDING ?AUTO_9592 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9592 )
      ( MAKE-ON ?AUTO_9592 ?AUTO_9593 )
      ( MAKE-ON-VERIFY ?AUTO_9592 ?AUTO_9593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9599 - BLOCK
      ?AUTO_9600 - BLOCK
    )
    :vars
    (
      ?AUTO_9601 - BLOCK
      ?AUTO_9602 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9601 ?AUTO_9600 ) ( ON ?AUTO_9602 ?AUTO_9601 ) ( ON ?AUTO_9599 ?AUTO_9602 ) ( CLEAR ?AUTO_9599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9599 ?AUTO_9602 )
      ( MAKE-ON ?AUTO_9599 ?AUTO_9600 )
      ( MAKE-ON-VERIFY ?AUTO_9599 ?AUTO_9600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9609 - BLOCK
      ?AUTO_9610 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9609 ) ( CLEAR ?AUTO_9610 ) )
    :subtasks
    ( ( !STACK ?AUTO_9609 ?AUTO_9610 )
      ( MAKE-ON-VERIFY ?AUTO_9609 ?AUTO_9610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9613 - BLOCK
      ?AUTO_9614 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9614 ) ( ON-TABLE ?AUTO_9613 ) ( CLEAR ?AUTO_9613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9613 )
      ( MAKE-ON ?AUTO_9613 ?AUTO_9614 )
      ( MAKE-ON-VERIFY ?AUTO_9613 ?AUTO_9614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9618 - BLOCK
      ?AUTO_9619 - BLOCK
    )
    :vars
    (
      ?AUTO_9622 - BLOCK
      ?AUTO_9623 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9619 ) ( ON-TABLE ?AUTO_9618 ) ( CLEAR ?AUTO_9618 ) ( HOLDING ?AUTO_9622 ) ( CLEAR ?AUTO_9623 ) )
    :subtasks
    ( ( !STACK ?AUTO_9622 ?AUTO_9623 )
      ( MAKE-ON ?AUTO_9618 ?AUTO_9619 )
      ( MAKE-ON-VERIFY ?AUTO_9618 ?AUTO_9619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9644 - BLOCK
      ?AUTO_9645 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9644 ) ( CLEAR ?AUTO_9645 ) )
    :subtasks
    ( ( !STACK ?AUTO_9644 ?AUTO_9645 )
      ( MAKE-ON-VERIFY ?AUTO_9644 ?AUTO_9645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9648 - BLOCK
      ?AUTO_9649 - BLOCK
    )
    :vars
    (
      ?AUTO_9653 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9649 ) ( ON ?AUTO_9648 ?AUTO_9653 ) ( CLEAR ?AUTO_9648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9648 ?AUTO_9653 )
      ( MAKE-ON ?AUTO_9648 ?AUTO_9649 )
      ( MAKE-ON-VERIFY ?AUTO_9648 ?AUTO_9649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9654 - BLOCK
      ?AUTO_9655 - BLOCK
    )
    :vars
    (
      ?AUTO_9658 - BLOCK
      ?AUTO_9659 - BLOCK
      ?AUTO_9660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9655 ) ( ON ?AUTO_9654 ?AUTO_9658 ) ( CLEAR ?AUTO_9654 ) ( HOLDING ?AUTO_9659 ) ( CLEAR ?AUTO_9660 ) )
    :subtasks
    ( ( !STACK ?AUTO_9659 ?AUTO_9660 )
      ( MAKE-ON ?AUTO_9654 ?AUTO_9655 )
      ( MAKE-ON-VERIFY ?AUTO_9654 ?AUTO_9655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9669 - BLOCK
      ?AUTO_9670 - BLOCK
    )
    :vars
    (
      ?AUTO_9673 - BLOCK
      ?AUTO_9674 - BLOCK
      ?AUTO_9675 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9669 ?AUTO_9673 ) ( CLEAR ?AUTO_9669 ) ( CLEAR ?AUTO_9674 ) ( ON ?AUTO_9675 ?AUTO_9670 ) ( CLEAR ?AUTO_9675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9675 ?AUTO_9670 )
      ( MAKE-ON ?AUTO_9669 ?AUTO_9670 )
      ( MAKE-ON-VERIFY ?AUTO_9669 ?AUTO_9670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9678 - BLOCK
      ?AUTO_9679 - BLOCK
    )
    :vars
    (
      ?AUTO_9682 - BLOCK
      ?AUTO_9683 - BLOCK
      ?AUTO_9684 - BLOCK
      ?AUTO_9685 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9678 ?AUTO_9682 ) ( CLEAR ?AUTO_9678 ) ( CLEAR ?AUTO_9683 ) ( ON ?AUTO_9684 ?AUTO_9679 ) ( CLEAR ?AUTO_9684 ) ( HOLDING ?AUTO_9685 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9685 )
      ( MAKE-ON ?AUTO_9678 ?AUTO_9679 )
      ( MAKE-ON-VERIFY ?AUTO_9678 ?AUTO_9679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9686 - BLOCK
      ?AUTO_9687 - BLOCK
    )
    :vars
    (
      ?AUTO_9693 - BLOCK
      ?AUTO_9689 - BLOCK
      ?AUTO_9688 - BLOCK
      ?AUTO_9692 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9686 ?AUTO_9693 ) ( CLEAR ?AUTO_9686 ) ( CLEAR ?AUTO_9689 ) ( ON ?AUTO_9688 ?AUTO_9687 ) ( ON ?AUTO_9692 ?AUTO_9688 ) ( CLEAR ?AUTO_9692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9692 ?AUTO_9688 )
      ( MAKE-ON ?AUTO_9686 ?AUTO_9687 )
      ( MAKE-ON-VERIFY ?AUTO_9686 ?AUTO_9687 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9696 - BLOCK
      ?AUTO_9697 - BLOCK
    )
    :vars
    (
      ?AUTO_9702 - BLOCK
      ?AUTO_9699 - BLOCK
      ?AUTO_9701 - BLOCK
      ?AUTO_9703 - BLOCK
      ?AUTO_9704 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9696 ?AUTO_9702 ) ( CLEAR ?AUTO_9696 ) ( CLEAR ?AUTO_9699 ) ( ON ?AUTO_9701 ?AUTO_9697 ) ( ON ?AUTO_9703 ?AUTO_9701 ) ( CLEAR ?AUTO_9703 ) ( HOLDING ?AUTO_9704 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9704 )
      ( MAKE-ON ?AUTO_9696 ?AUTO_9697 )
      ( MAKE-ON-VERIFY ?AUTO_9696 ?AUTO_9697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9705 - BLOCK
      ?AUTO_9706 - BLOCK
    )
    :vars
    (
      ?AUTO_9709 - BLOCK
      ?AUTO_9712 - BLOCK
      ?AUTO_9708 - BLOCK
      ?AUTO_9707 - BLOCK
      ?AUTO_9713 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9705 ?AUTO_9709 ) ( CLEAR ?AUTO_9705 ) ( CLEAR ?AUTO_9712 ) ( ON ?AUTO_9708 ?AUTO_9706 ) ( ON ?AUTO_9707 ?AUTO_9708 ) ( ON ?AUTO_9713 ?AUTO_9707 ) ( CLEAR ?AUTO_9713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9713 ?AUTO_9707 )
      ( MAKE-ON ?AUTO_9705 ?AUTO_9706 )
      ( MAKE-ON-VERIFY ?AUTO_9705 ?AUTO_9706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9716 - BLOCK
      ?AUTO_9717 - BLOCK
    )
    :vars
    (
      ?AUTO_9719 - BLOCK
      ?AUTO_9724 - BLOCK
      ?AUTO_9723 - BLOCK
      ?AUTO_9721 - BLOCK
      ?AUTO_9720 - BLOCK
      ?AUTO_9725 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9716 ?AUTO_9719 ) ( CLEAR ?AUTO_9716 ) ( CLEAR ?AUTO_9724 ) ( ON ?AUTO_9723 ?AUTO_9717 ) ( ON ?AUTO_9721 ?AUTO_9723 ) ( ON ?AUTO_9720 ?AUTO_9721 ) ( CLEAR ?AUTO_9720 ) ( HOLDING ?AUTO_9725 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9725 )
      ( MAKE-ON ?AUTO_9716 ?AUTO_9717 )
      ( MAKE-ON-VERIFY ?AUTO_9716 ?AUTO_9717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9726 - BLOCK
      ?AUTO_9727 - BLOCK
    )
    :vars
    (
      ?AUTO_9731 - BLOCK
      ?AUTO_9728 - BLOCK
      ?AUTO_9730 - BLOCK
      ?AUTO_9734 - BLOCK
      ?AUTO_9729 - BLOCK
      ?AUTO_9735 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9726 ?AUTO_9731 ) ( CLEAR ?AUTO_9726 ) ( CLEAR ?AUTO_9728 ) ( ON ?AUTO_9730 ?AUTO_9727 ) ( ON ?AUTO_9734 ?AUTO_9730 ) ( ON ?AUTO_9729 ?AUTO_9734 ) ( ON ?AUTO_9735 ?AUTO_9729 ) ( CLEAR ?AUTO_9735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9735 ?AUTO_9729 )
      ( MAKE-ON ?AUTO_9726 ?AUTO_9727 )
      ( MAKE-ON-VERIFY ?AUTO_9726 ?AUTO_9727 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9739 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9739 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9739 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9739 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9741 - BLOCK
    )
    :vars
    (
      ?AUTO_9744 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9741 ?AUTO_9744 ) ( CLEAR ?AUTO_9741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9741 ?AUTO_9744 )
      ( MAKE-ON-TABLE ?AUTO_9741 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9741 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9745 - BLOCK
    )
    :vars
    (
      ?AUTO_9747 - BLOCK
      ?AUTO_9748 - BLOCK
      ?AUTO_9749 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9745 ?AUTO_9747 ) ( CLEAR ?AUTO_9745 ) ( HOLDING ?AUTO_9748 ) ( CLEAR ?AUTO_9749 ) )
    :subtasks
    ( ( !STACK ?AUTO_9748 ?AUTO_9749 )
      ( MAKE-ON-TABLE ?AUTO_9745 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9745 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9750 - BLOCK
    )
    :vars
    (
      ?AUTO_9752 - BLOCK
      ?AUTO_9754 - BLOCK
      ?AUTO_9753 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9750 ?AUTO_9752 ) ( CLEAR ?AUTO_9754 ) ( ON ?AUTO_9753 ?AUTO_9750 ) ( CLEAR ?AUTO_9753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9753 ?AUTO_9750 )
      ( MAKE-ON-TABLE ?AUTO_9750 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9750 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9757 - BLOCK
    )
    :vars
    (
      ?AUTO_9760 - BLOCK
      ?AUTO_9758 - BLOCK
      ?AUTO_9761 - BLOCK
      ?AUTO_9762 - BLOCK
      ?AUTO_9763 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9757 ?AUTO_9760 ) ( CLEAR ?AUTO_9758 ) ( ON ?AUTO_9761 ?AUTO_9757 ) ( CLEAR ?AUTO_9761 ) ( HOLDING ?AUTO_9762 ) ( CLEAR ?AUTO_9763 ) )
    :subtasks
    ( ( !STACK ?AUTO_9762 ?AUTO_9763 )
      ( MAKE-ON-TABLE ?AUTO_9757 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9757 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9776 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9776 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9776 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9776 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9778 - BLOCK
    )
    :vars
    (
      ?AUTO_9781 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9778 ?AUTO_9781 ) ( CLEAR ?AUTO_9778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9778 ?AUTO_9781 )
      ( MAKE-ON-TABLE ?AUTO_9778 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9778 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9782 - BLOCK
    )
    :vars
    (
      ?AUTO_9784 - BLOCK
      ?AUTO_9785 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9782 ?AUTO_9784 ) ( CLEAR ?AUTO_9782 ) ( HOLDING ?AUTO_9785 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9785 )
      ( MAKE-ON-TABLE ?AUTO_9782 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9782 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9786 - BLOCK
    )
    :vars
    (
      ?AUTO_9788 - BLOCK
      ?AUTO_9789 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9786 ?AUTO_9788 ) ( ON ?AUTO_9789 ?AUTO_9786 ) ( CLEAR ?AUTO_9789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9789 ?AUTO_9786 )
      ( MAKE-ON-TABLE ?AUTO_9786 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9786 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9792 - BLOCK
    )
    :vars
    (
      ?AUTO_9793 - BLOCK
      ?AUTO_9794 - BLOCK
      ?AUTO_9796 - BLOCK
      ?AUTO_9797 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9792 ?AUTO_9793 ) ( ON ?AUTO_9794 ?AUTO_9792 ) ( CLEAR ?AUTO_9794 ) ( HOLDING ?AUTO_9796 ) ( CLEAR ?AUTO_9797 ) )
    :subtasks
    ( ( !STACK ?AUTO_9796 ?AUTO_9797 )
      ( MAKE-ON-TABLE ?AUTO_9792 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9792 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9798 - BLOCK
    )
    :vars
    (
      ?AUTO_9800 - BLOCK
      ?AUTO_9801 - BLOCK
      ?AUTO_9803 - BLOCK
      ?AUTO_9802 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9798 ?AUTO_9800 ) ( ON ?AUTO_9801 ?AUTO_9798 ) ( CLEAR ?AUTO_9803 ) ( ON ?AUTO_9802 ?AUTO_9801 ) ( CLEAR ?AUTO_9802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9802 ?AUTO_9801 )
      ( MAKE-ON-TABLE ?AUTO_9798 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9798 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9806 - BLOCK
    )
    :vars
    (
      ?AUTO_9811 - BLOCK
      ?AUTO_9808 - BLOCK
      ?AUTO_9809 - BLOCK
      ?AUTO_9807 - BLOCK
      ?AUTO_9812 - BLOCK
      ?AUTO_9813 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9806 ?AUTO_9811 ) ( ON ?AUTO_9808 ?AUTO_9806 ) ( CLEAR ?AUTO_9809 ) ( ON ?AUTO_9807 ?AUTO_9808 ) ( CLEAR ?AUTO_9807 ) ( HOLDING ?AUTO_9812 ) ( CLEAR ?AUTO_9813 ) )
    :subtasks
    ( ( !STACK ?AUTO_9812 ?AUTO_9813 )
      ( MAKE-ON-TABLE ?AUTO_9806 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9827 - BLOCK
      ?AUTO_9828 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9827 ) ( CLEAR ?AUTO_9828 ) )
    :subtasks
    ( ( !STACK ?AUTO_9827 ?AUTO_9828 )
      ( MAKE-ON-VERIFY ?AUTO_9827 ?AUTO_9828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9831 - BLOCK
      ?AUTO_9832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9832 ) ( ON-TABLE ?AUTO_9831 ) ( CLEAR ?AUTO_9831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9831 )
      ( MAKE-ON ?AUTO_9831 ?AUTO_9832 )
      ( MAKE-ON-VERIFY ?AUTO_9831 ?AUTO_9832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9836 - BLOCK
      ?AUTO_9837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9836 ) ( CLEAR ?AUTO_9836 ) ( HOLDING ?AUTO_9837 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9837 )
      ( MAKE-ON ?AUTO_9836 ?AUTO_9837 )
      ( MAKE-ON-VERIFY ?AUTO_9836 ?AUTO_9837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10115 - BLOCK
      ?AUTO_10116 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10115 ) ( CLEAR ?AUTO_10116 ) )
    :subtasks
    ( ( !STACK ?AUTO_10115 ?AUTO_10116 )
      ( MAKE-ON-VERIFY ?AUTO_10115 ?AUTO_10116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10119 - BLOCK
      ?AUTO_10120 - BLOCK
    )
    :vars
    (
      ?AUTO_10124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10120 ) ( ON ?AUTO_10119 ?AUTO_10124 ) ( CLEAR ?AUTO_10119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10119 ?AUTO_10124 )
      ( MAKE-ON ?AUTO_10119 ?AUTO_10120 )
      ( MAKE-ON-VERIFY ?AUTO_10119 ?AUTO_10120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10125 - BLOCK
      ?AUTO_10126 - BLOCK
    )
    :vars
    (
      ?AUTO_10129 - BLOCK
      ?AUTO_10131 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10125 ?AUTO_10129 ) ( CLEAR ?AUTO_10125 ) ( HOLDING ?AUTO_10126 ) ( CLEAR ?AUTO_10131 ) )
    :subtasks
    ( ( !STACK ?AUTO_10126 ?AUTO_10131 )
      ( MAKE-ON ?AUTO_10125 ?AUTO_10126 )
      ( MAKE-ON-VERIFY ?AUTO_10125 ?AUTO_10126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10134 - BLOCK
      ?AUTO_10135 - BLOCK
    )
    :vars
    (
      ?AUTO_10138 - BLOCK
      ?AUTO_10139 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10135 ) ( ON ?AUTO_10134 ?AUTO_10138 ) ( CLEAR ?AUTO_10134 ) ( HOLDING ?AUTO_10139 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10139 )
      ( MAKE-ON ?AUTO_10134 ?AUTO_10135 )
      ( MAKE-ON-VERIFY ?AUTO_10134 ?AUTO_10135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10224 - BLOCK
      ?AUTO_10225 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10224 ) ( CLEAR ?AUTO_10225 ) )
    :subtasks
    ( ( !STACK ?AUTO_10224 ?AUTO_10225 )
      ( MAKE-ON-VERIFY ?AUTO_10224 ?AUTO_10225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10228 - BLOCK
      ?AUTO_10229 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10229 ) ( ON-TABLE ?AUTO_10228 ) ( CLEAR ?AUTO_10228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_10228 )
      ( MAKE-ON ?AUTO_10228 ?AUTO_10229 )
      ( MAKE-ON-VERIFY ?AUTO_10228 ?AUTO_10229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10233 - BLOCK
      ?AUTO_10234 - BLOCK
    )
    :vars
    (
      ?AUTO_10237 - BLOCK
      ?AUTO_10238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10234 ) ( ON-TABLE ?AUTO_10233 ) ( CLEAR ?AUTO_10233 ) ( HOLDING ?AUTO_10237 ) ( CLEAR ?AUTO_10238 ) )
    :subtasks
    ( ( !STACK ?AUTO_10237 ?AUTO_10238 )
      ( MAKE-ON ?AUTO_10233 ?AUTO_10234 )
      ( MAKE-ON-VERIFY ?AUTO_10233 ?AUTO_10234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10239 - BLOCK
      ?AUTO_10240 - BLOCK
    )
    :vars
    (
      ?AUTO_10242 - BLOCK
      ?AUTO_10244 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10240 ) ( ON-TABLE ?AUTO_10239 ) ( CLEAR ?AUTO_10242 ) ( ON ?AUTO_10244 ?AUTO_10239 ) ( CLEAR ?AUTO_10244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10244 ?AUTO_10239 )
      ( MAKE-ON ?AUTO_10239 ?AUTO_10240 )
      ( MAKE-ON-VERIFY ?AUTO_10239 ?AUTO_10240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10247 - BLOCK
      ?AUTO_10248 - BLOCK
    )
    :vars
    (
      ?AUTO_10252 - BLOCK
      ?AUTO_10251 - BLOCK
      ?AUTO_10254 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10248 ) ( ON-TABLE ?AUTO_10247 ) ( ON ?AUTO_10252 ?AUTO_10247 ) ( CLEAR ?AUTO_10252 ) ( HOLDING ?AUTO_10251 ) ( CLEAR ?AUTO_10254 ) )
    :subtasks
    ( ( !STACK ?AUTO_10251 ?AUTO_10254 )
      ( MAKE-ON ?AUTO_10247 ?AUTO_10248 )
      ( MAKE-ON-VERIFY ?AUTO_10247 ?AUTO_10248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10259 - BLOCK
      ?AUTO_10260 - BLOCK
    )
    :vars
    (
      ?AUTO_10263 - BLOCK
      ?AUTO_10261 - BLOCK
      ?AUTO_10265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10259 ) ( ON ?AUTO_10263 ?AUTO_10259 ) ( CLEAR ?AUTO_10263 ) ( CLEAR ?AUTO_10261 ) ( ON ?AUTO_10265 ?AUTO_10260 ) ( CLEAR ?AUTO_10265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10265 ?AUTO_10260 )
      ( MAKE-ON ?AUTO_10259 ?AUTO_10260 )
      ( MAKE-ON-VERIFY ?AUTO_10259 ?AUTO_10260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10268 - BLOCK
      ?AUTO_10269 - BLOCK
    )
    :vars
    (
      ?AUTO_10274 - BLOCK
      ?AUTO_10272 - BLOCK
      ?AUTO_10273 - BLOCK
      ?AUTO_10275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10268 ) ( ON ?AUTO_10274 ?AUTO_10268 ) ( CLEAR ?AUTO_10274 ) ( CLEAR ?AUTO_10272 ) ( ON ?AUTO_10273 ?AUTO_10269 ) ( CLEAR ?AUTO_10273 ) ( HOLDING ?AUTO_10275 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10275 )
      ( MAKE-ON ?AUTO_10268 ?AUTO_10269 )
      ( MAKE-ON-VERIFY ?AUTO_10268 ?AUTO_10269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10276 - BLOCK
      ?AUTO_10277 - BLOCK
    )
    :vars
    (
      ?AUTO_10278 - BLOCK
      ?AUTO_10282 - BLOCK
      ?AUTO_10283 - BLOCK
      ?AUTO_10281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10276 ) ( ON ?AUTO_10278 ?AUTO_10276 ) ( CLEAR ?AUTO_10278 ) ( CLEAR ?AUTO_10282 ) ( ON ?AUTO_10283 ?AUTO_10277 ) ( ON ?AUTO_10281 ?AUTO_10283 ) ( CLEAR ?AUTO_10281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10281 ?AUTO_10283 )
      ( MAKE-ON ?AUTO_10276 ?AUTO_10277 )
      ( MAKE-ON-VERIFY ?AUTO_10276 ?AUTO_10277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10286 - BLOCK
      ?AUTO_10287 - BLOCK
    )
    :vars
    (
      ?AUTO_10290 - BLOCK
      ?AUTO_10293 - BLOCK
      ?AUTO_10292 - BLOCK
      ?AUTO_10289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10286 ) ( CLEAR ?AUTO_10290 ) ( ON ?AUTO_10293 ?AUTO_10287 ) ( ON ?AUTO_10292 ?AUTO_10293 ) ( CLEAR ?AUTO_10292 ) ( HOLDING ?AUTO_10289 ) ( CLEAR ?AUTO_10286 ) )
    :subtasks
    ( ( !STACK ?AUTO_10289 ?AUTO_10286 )
      ( MAKE-ON ?AUTO_10286 ?AUTO_10287 )
      ( MAKE-ON-VERIFY ?AUTO_10286 ?AUTO_10287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10296 - BLOCK
      ?AUTO_10297 - BLOCK
    )
    :vars
    (
      ?AUTO_10298 - BLOCK
      ?AUTO_10300 - BLOCK
      ?AUTO_10299 - BLOCK
      ?AUTO_10301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10296 ) ( CLEAR ?AUTO_10298 ) ( ON ?AUTO_10300 ?AUTO_10297 ) ( ON ?AUTO_10299 ?AUTO_10300 ) ( CLEAR ?AUTO_10296 ) ( ON ?AUTO_10301 ?AUTO_10299 ) ( CLEAR ?AUTO_10301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10301 ?AUTO_10299 )
      ( MAKE-ON ?AUTO_10296 ?AUTO_10297 )
      ( MAKE-ON-VERIFY ?AUTO_10296 ?AUTO_10297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10306 - BLOCK
      ?AUTO_10307 - BLOCK
    )
    :vars
    (
      ?AUTO_10313 - BLOCK
      ?AUTO_10312 - BLOCK
      ?AUTO_10309 - BLOCK
      ?AUTO_10310 - BLOCK
      ?AUTO_10314 - BLOCK
      ?AUTO_10315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10306 ) ( CLEAR ?AUTO_10313 ) ( ON ?AUTO_10312 ?AUTO_10307 ) ( ON ?AUTO_10309 ?AUTO_10312 ) ( CLEAR ?AUTO_10306 ) ( ON ?AUTO_10310 ?AUTO_10309 ) ( CLEAR ?AUTO_10310 ) ( HOLDING ?AUTO_10314 ) ( CLEAR ?AUTO_10315 ) )
    :subtasks
    ( ( !STACK ?AUTO_10314 ?AUTO_10315 )
      ( MAKE-ON ?AUTO_10306 ?AUTO_10307 )
      ( MAKE-ON-VERIFY ?AUTO_10306 ?AUTO_10307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10324 - BLOCK
      ?AUTO_10325 - BLOCK
    )
    :vars
    (
      ?AUTO_10327 - BLOCK
      ?AUTO_10333 - BLOCK
      ?AUTO_10331 - BLOCK
      ?AUTO_10326 - BLOCK
      ?AUTO_10330 - BLOCK
      ?AUTO_10328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10324 ) ( CLEAR ?AUTO_10327 ) ( ON ?AUTO_10333 ?AUTO_10325 ) ( ON ?AUTO_10331 ?AUTO_10333 ) ( ON ?AUTO_10326 ?AUTO_10331 ) ( CLEAR ?AUTO_10326 ) ( CLEAR ?AUTO_10330 ) ( ON ?AUTO_10328 ?AUTO_10324 ) ( CLEAR ?AUTO_10328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10328 ?AUTO_10324 )
      ( MAKE-ON ?AUTO_10324 ?AUTO_10325 )
      ( MAKE-ON-VERIFY ?AUTO_10324 ?AUTO_10325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10336 - BLOCK
      ?AUTO_10337 - BLOCK
    )
    :vars
    (
      ?AUTO_10339 - BLOCK
      ?AUTO_10344 - BLOCK
      ?AUTO_10341 - BLOCK
      ?AUTO_10338 - BLOCK
      ?AUTO_10340 - BLOCK
      ?AUTO_10345 - BLOCK
      ?AUTO_10346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10336 ) ( CLEAR ?AUTO_10339 ) ( ON ?AUTO_10344 ?AUTO_10337 ) ( ON ?AUTO_10341 ?AUTO_10344 ) ( ON ?AUTO_10338 ?AUTO_10341 ) ( CLEAR ?AUTO_10338 ) ( CLEAR ?AUTO_10340 ) ( ON ?AUTO_10345 ?AUTO_10336 ) ( CLEAR ?AUTO_10345 ) ( HOLDING ?AUTO_10346 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10346 )
      ( MAKE-ON ?AUTO_10336 ?AUTO_10337 )
      ( MAKE-ON-VERIFY ?AUTO_10336 ?AUTO_10337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10347 - BLOCK
      ?AUTO_10348 - BLOCK
    )
    :vars
    (
      ?AUTO_10353 - BLOCK
      ?AUTO_10357 - BLOCK
      ?AUTO_10356 - BLOCK
      ?AUTO_10352 - BLOCK
      ?AUTO_10351 - BLOCK
      ?AUTO_10349 - BLOCK
      ?AUTO_10355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10347 ) ( CLEAR ?AUTO_10353 ) ( ON ?AUTO_10357 ?AUTO_10348 ) ( ON ?AUTO_10356 ?AUTO_10357 ) ( ON ?AUTO_10352 ?AUTO_10356 ) ( CLEAR ?AUTO_10352 ) ( CLEAR ?AUTO_10351 ) ( ON ?AUTO_10349 ?AUTO_10347 ) ( ON ?AUTO_10355 ?AUTO_10349 ) ( CLEAR ?AUTO_10355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10355 ?AUTO_10349 )
      ( MAKE-ON ?AUTO_10347 ?AUTO_10348 )
      ( MAKE-ON-VERIFY ?AUTO_10347 ?AUTO_10348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10360 - BLOCK
      ?AUTO_10361 - BLOCK
    )
    :vars
    (
      ?AUTO_10370 - BLOCK
      ?AUTO_10368 - BLOCK
      ?AUTO_10367 - BLOCK
      ?AUTO_10364 - BLOCK
      ?AUTO_10366 - BLOCK
      ?AUTO_10369 - BLOCK
      ?AUTO_10363 - BLOCK
      ?AUTO_10371 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10360 ) ( CLEAR ?AUTO_10370 ) ( ON ?AUTO_10368 ?AUTO_10361 ) ( ON ?AUTO_10367 ?AUTO_10368 ) ( ON ?AUTO_10364 ?AUTO_10367 ) ( CLEAR ?AUTO_10364 ) ( CLEAR ?AUTO_10366 ) ( ON ?AUTO_10369 ?AUTO_10360 ) ( ON ?AUTO_10363 ?AUTO_10369 ) ( CLEAR ?AUTO_10363 ) ( HOLDING ?AUTO_10371 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10371 )
      ( MAKE-ON ?AUTO_10360 ?AUTO_10361 )
      ( MAKE-ON-VERIFY ?AUTO_10360 ?AUTO_10361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10372 - BLOCK
      ?AUTO_10373 - BLOCK
    )
    :vars
    (
      ?AUTO_10377 - BLOCK
      ?AUTO_10375 - BLOCK
      ?AUTO_10380 - BLOCK
      ?AUTO_10381 - BLOCK
      ?AUTO_10383 - BLOCK
      ?AUTO_10374 - BLOCK
      ?AUTO_10376 - BLOCK
      ?AUTO_10382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10372 ) ( CLEAR ?AUTO_10377 ) ( ON ?AUTO_10375 ?AUTO_10373 ) ( ON ?AUTO_10380 ?AUTO_10375 ) ( ON ?AUTO_10381 ?AUTO_10380 ) ( CLEAR ?AUTO_10381 ) ( CLEAR ?AUTO_10383 ) ( ON ?AUTO_10374 ?AUTO_10372 ) ( ON ?AUTO_10376 ?AUTO_10374 ) ( ON ?AUTO_10382 ?AUTO_10376 ) ( CLEAR ?AUTO_10382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10382 ?AUTO_10376 )
      ( MAKE-ON ?AUTO_10372 ?AUTO_10373 )
      ( MAKE-ON-VERIFY ?AUTO_10372 ?AUTO_10373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10386 - BLOCK
      ?AUTO_10387 - BLOCK
    )
    :vars
    (
      ?AUTO_10394 - BLOCK
      ?AUTO_10391 - BLOCK
      ?AUTO_10390 - BLOCK
      ?AUTO_10393 - BLOCK
      ?AUTO_10395 - BLOCK
      ?AUTO_10389 - BLOCK
      ?AUTO_10397 - BLOCK
      ?AUTO_10392 - BLOCK
      ?AUTO_10398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10386 ) ( CLEAR ?AUTO_10394 ) ( ON ?AUTO_10391 ?AUTO_10387 ) ( ON ?AUTO_10390 ?AUTO_10391 ) ( ON ?AUTO_10393 ?AUTO_10390 ) ( CLEAR ?AUTO_10393 ) ( CLEAR ?AUTO_10395 ) ( ON ?AUTO_10389 ?AUTO_10386 ) ( ON ?AUTO_10397 ?AUTO_10389 ) ( ON ?AUTO_10392 ?AUTO_10397 ) ( CLEAR ?AUTO_10392 ) ( HOLDING ?AUTO_10398 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10398 )
      ( MAKE-ON ?AUTO_10386 ?AUTO_10387 )
      ( MAKE-ON-VERIFY ?AUTO_10386 ?AUTO_10387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10399 - BLOCK
      ?AUTO_10400 - BLOCK
    )
    :vars
    (
      ?AUTO_10405 - BLOCK
      ?AUTO_10409 - BLOCK
      ?AUTO_10411 - BLOCK
      ?AUTO_10407 - BLOCK
      ?AUTO_10401 - BLOCK
      ?AUTO_10403 - BLOCK
      ?AUTO_10402 - BLOCK
      ?AUTO_10408 - BLOCK
      ?AUTO_10410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10399 ) ( CLEAR ?AUTO_10405 ) ( ON ?AUTO_10409 ?AUTO_10400 ) ( ON ?AUTO_10411 ?AUTO_10409 ) ( ON ?AUTO_10407 ?AUTO_10411 ) ( CLEAR ?AUTO_10407 ) ( CLEAR ?AUTO_10401 ) ( ON ?AUTO_10403 ?AUTO_10399 ) ( ON ?AUTO_10402 ?AUTO_10403 ) ( ON ?AUTO_10408 ?AUTO_10402 ) ( ON ?AUTO_10410 ?AUTO_10408 ) ( CLEAR ?AUTO_10410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10410 ?AUTO_10408 )
      ( MAKE-ON ?AUTO_10399 ?AUTO_10400 )
      ( MAKE-ON-VERIFY ?AUTO_10399 ?AUTO_10400 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10413 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10413 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10413 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10413 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10415 - BLOCK
    )
    :vars
    (
      ?AUTO_10418 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10415 ?AUTO_10418 ) ( CLEAR ?AUTO_10415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10415 ?AUTO_10418 )
      ( MAKE-ON-TABLE ?AUTO_10415 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10421 - BLOCK
      ?AUTO_10422 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10421 ) ( CLEAR ?AUTO_10422 ) )
    :subtasks
    ( ( !STACK ?AUTO_10421 ?AUTO_10422 )
      ( MAKE-ON-VERIFY ?AUTO_10421 ?AUTO_10422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10425 - BLOCK
      ?AUTO_10426 - BLOCK
    )
    :vars
    (
      ?AUTO_10430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10426 ) ( ON ?AUTO_10425 ?AUTO_10430 ) ( CLEAR ?AUTO_10425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10425 ?AUTO_10430 )
      ( MAKE-ON ?AUTO_10425 ?AUTO_10426 )
      ( MAKE-ON-VERIFY ?AUTO_10425 ?AUTO_10426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10431 - BLOCK
      ?AUTO_10432 - BLOCK
    )
    :vars
    (
      ?AUTO_10435 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10431 ?AUTO_10435 ) ( CLEAR ?AUTO_10431 ) ( HOLDING ?AUTO_10432 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10432 )
      ( MAKE-ON ?AUTO_10431 ?AUTO_10432 )
      ( MAKE-ON-VERIFY ?AUTO_10431 ?AUTO_10432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10437 - BLOCK
      ?AUTO_10438 - BLOCK
    )
    :vars
    (
      ?AUTO_10441 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10437 ?AUTO_10441 ) ( ON ?AUTO_10438 ?AUTO_10437 ) ( CLEAR ?AUTO_10438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10438 ?AUTO_10437 )
      ( MAKE-ON ?AUTO_10437 ?AUTO_10438 )
      ( MAKE-ON-VERIFY ?AUTO_10437 ?AUTO_10438 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10445 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10445 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10445 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10445 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10447 - BLOCK
    )
    :vars
    (
      ?AUTO_10450 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10447 ?AUTO_10450 ) ( CLEAR ?AUTO_10447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10447 ?AUTO_10450 )
      ( MAKE-ON-TABLE ?AUTO_10447 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10447 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10451 - BLOCK
    )
    :vars
    (
      ?AUTO_10453 - BLOCK
      ?AUTO_10454 - BLOCK
      ?AUTO_10455 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10451 ?AUTO_10453 ) ( CLEAR ?AUTO_10451 ) ( HOLDING ?AUTO_10454 ) ( CLEAR ?AUTO_10455 ) )
    :subtasks
    ( ( !STACK ?AUTO_10454 ?AUTO_10455 )
      ( MAKE-ON-TABLE ?AUTO_10451 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10451 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10456 - BLOCK
    )
    :vars
    (
      ?AUTO_10457 - BLOCK
      ?AUTO_10460 - BLOCK
      ?AUTO_10459 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10456 ?AUTO_10457 ) ( CLEAR ?AUTO_10460 ) ( ON ?AUTO_10459 ?AUTO_10456 ) ( CLEAR ?AUTO_10459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10459 ?AUTO_10456 )
      ( MAKE-ON-TABLE ?AUTO_10456 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10456 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10463 - BLOCK
    )
    :vars
    (
      ?AUTO_10464 - BLOCK
      ?AUTO_10467 - BLOCK
      ?AUTO_10465 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10463 ?AUTO_10464 ) ( ON ?AUTO_10467 ?AUTO_10463 ) ( CLEAR ?AUTO_10467 ) ( HOLDING ?AUTO_10465 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10465 )
      ( MAKE-ON-TABLE ?AUTO_10463 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10463 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10469 - BLOCK
    )
    :vars
    (
      ?AUTO_10470 - BLOCK
      ?AUTO_10471 - BLOCK
      ?AUTO_10472 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10469 ?AUTO_10470 ) ( ON ?AUTO_10471 ?AUTO_10469 ) ( ON ?AUTO_10472 ?AUTO_10471 ) ( CLEAR ?AUTO_10472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10472 ?AUTO_10471 )
      ( MAKE-ON-TABLE ?AUTO_10469 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10469 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10477 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10477 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10477 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10477 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10479 - BLOCK
    )
    :vars
    (
      ?AUTO_10482 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10479 ?AUTO_10482 ) ( CLEAR ?AUTO_10479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10479 ?AUTO_10482 )
      ( MAKE-ON-TABLE ?AUTO_10479 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10479 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10483 - BLOCK
    )
    :vars
    (
      ?AUTO_10485 - BLOCK
      ?AUTO_10486 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10483 ?AUTO_10485 ) ( CLEAR ?AUTO_10483 ) ( HOLDING ?AUTO_10486 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10486 )
      ( MAKE-ON-TABLE ?AUTO_10483 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10483 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10487 - BLOCK
    )
    :vars
    (
      ?AUTO_10489 - BLOCK
      ?AUTO_10490 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10487 ?AUTO_10489 ) ( ON ?AUTO_10490 ?AUTO_10487 ) ( CLEAR ?AUTO_10490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10490 ?AUTO_10487 )
      ( MAKE-ON-TABLE ?AUTO_10487 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10487 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10493 - BLOCK
    )
    :vars
    (
      ?AUTO_10494 - BLOCK
      ?AUTO_10495 - BLOCK
      ?AUTO_10497 - BLOCK
      ?AUTO_10498 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10493 ?AUTO_10494 ) ( ON ?AUTO_10495 ?AUTO_10493 ) ( CLEAR ?AUTO_10495 ) ( HOLDING ?AUTO_10497 ) ( CLEAR ?AUTO_10498 ) )
    :subtasks
    ( ( !STACK ?AUTO_10497 ?AUTO_10498 )
      ( MAKE-ON-TABLE ?AUTO_10493 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10493 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10499 - BLOCK
    )
    :vars
    (
      ?AUTO_10501 - BLOCK
      ?AUTO_10502 - BLOCK
      ?AUTO_10504 - BLOCK
      ?AUTO_10503 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10499 ?AUTO_10501 ) ( ON ?AUTO_10502 ?AUTO_10499 ) ( CLEAR ?AUTO_10504 ) ( ON ?AUTO_10503 ?AUTO_10502 ) ( CLEAR ?AUTO_10503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10503 ?AUTO_10502 )
      ( MAKE-ON-TABLE ?AUTO_10499 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10499 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10507 - BLOCK
    )
    :vars
    (
      ?AUTO_10512 - BLOCK
      ?AUTO_10509 - BLOCK
      ?AUTO_10508 - BLOCK
      ?AUTO_10510 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10507 ?AUTO_10512 ) ( ON ?AUTO_10509 ?AUTO_10507 ) ( ON ?AUTO_10508 ?AUTO_10509 ) ( CLEAR ?AUTO_10508 ) ( HOLDING ?AUTO_10510 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10510 )
      ( MAKE-ON-TABLE ?AUTO_10507 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10507 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10514 - BLOCK
    )
    :vars
    (
      ?AUTO_10519 - BLOCK
      ?AUTO_10516 - BLOCK
      ?AUTO_10515 - BLOCK
      ?AUTO_10517 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10514 ?AUTO_10519 ) ( ON ?AUTO_10516 ?AUTO_10514 ) ( ON ?AUTO_10515 ?AUTO_10516 ) ( ON ?AUTO_10517 ?AUTO_10515 ) ( CLEAR ?AUTO_10517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10517 ?AUTO_10515 )
      ( MAKE-ON-TABLE ?AUTO_10514 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10524 - BLOCK
      ?AUTO_10525 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10524 ) ( CLEAR ?AUTO_10525 ) )
    :subtasks
    ( ( !STACK ?AUTO_10524 ?AUTO_10525 )
      ( MAKE-ON-VERIFY ?AUTO_10524 ?AUTO_10525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10528 - BLOCK
      ?AUTO_10529 - BLOCK
    )
    :vars
    (
      ?AUTO_10533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10529 ) ( ON ?AUTO_10528 ?AUTO_10533 ) ( CLEAR ?AUTO_10528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10528 ?AUTO_10533 )
      ( MAKE-ON ?AUTO_10528 ?AUTO_10529 )
      ( MAKE-ON-VERIFY ?AUTO_10528 ?AUTO_10529 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10534 - BLOCK
      ?AUTO_10535 - BLOCK
    )
    :vars
    (
      ?AUTO_10538 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10534 ?AUTO_10538 ) ( CLEAR ?AUTO_10534 ) ( HOLDING ?AUTO_10535 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10535 )
      ( MAKE-ON ?AUTO_10534 ?AUTO_10535 )
      ( MAKE-ON-VERIFY ?AUTO_10534 ?AUTO_10535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10542 - BLOCK
      ?AUTO_10543 - BLOCK
    )
    :vars
    (
      ?AUTO_10546 - BLOCK
      ?AUTO_10547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10543 ) ( ON ?AUTO_10542 ?AUTO_10546 ) ( CLEAR ?AUTO_10542 ) ( HOLDING ?AUTO_10547 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10547 )
      ( MAKE-ON ?AUTO_10542 ?AUTO_10543 )
      ( MAKE-ON-VERIFY ?AUTO_10542 ?AUTO_10543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10548 - BLOCK
      ?AUTO_10549 - BLOCK
    )
    :vars
    (
      ?AUTO_10552 - BLOCK
      ?AUTO_10553 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10548 ?AUTO_10552 ) ( CLEAR ?AUTO_10548 ) ( ON ?AUTO_10553 ?AUTO_10549 ) ( CLEAR ?AUTO_10553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10553 ?AUTO_10549 )
      ( MAKE-ON ?AUTO_10548 ?AUTO_10549 )
      ( MAKE-ON-VERIFY ?AUTO_10548 ?AUTO_10549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10556 - BLOCK
      ?AUTO_10557 - BLOCK
    )
    :vars
    (
      ?AUTO_10558 - BLOCK
      ?AUTO_10561 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10558 ?AUTO_10557 ) ( CLEAR ?AUTO_10558 ) ( HOLDING ?AUTO_10556 ) ( CLEAR ?AUTO_10561 ) )
    :subtasks
    ( ( !STACK ?AUTO_10556 ?AUTO_10561 )
      ( MAKE-ON ?AUTO_10556 ?AUTO_10557 )
      ( MAKE-ON-VERIFY ?AUTO_10556 ?AUTO_10557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10564 - BLOCK
      ?AUTO_10565 - BLOCK
    )
    :vars
    (
      ?AUTO_10566 - BLOCK
      ?AUTO_10567 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10566 ?AUTO_10565 ) ( CLEAR ?AUTO_10567 ) ( ON ?AUTO_10564 ?AUTO_10566 ) ( CLEAR ?AUTO_10564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10564 ?AUTO_10566 )
      ( MAKE-ON ?AUTO_10564 ?AUTO_10565 )
      ( MAKE-ON-VERIFY ?AUTO_10564 ?AUTO_10565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10572 - BLOCK
      ?AUTO_10573 - BLOCK
    )
    :vars
    (
      ?AUTO_10576 - BLOCK
      ?AUTO_10577 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10576 ?AUTO_10573 ) ( ON ?AUTO_10572 ?AUTO_10576 ) ( CLEAR ?AUTO_10572 ) ( HOLDING ?AUTO_10577 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10577 )
      ( MAKE-ON ?AUTO_10572 ?AUTO_10573 )
      ( MAKE-ON-VERIFY ?AUTO_10572 ?AUTO_10573 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10579 - BLOCK
      ?AUTO_10580 - BLOCK
    )
    :vars
    (
      ?AUTO_10581 - BLOCK
      ?AUTO_10584 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10581 ?AUTO_10580 ) ( ON ?AUTO_10579 ?AUTO_10581 ) ( ON ?AUTO_10584 ?AUTO_10579 ) ( CLEAR ?AUTO_10584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10584 ?AUTO_10579 )
      ( MAKE-ON ?AUTO_10579 ?AUTO_10580 )
      ( MAKE-ON-VERIFY ?AUTO_10579 ?AUTO_10580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10589 - BLOCK
      ?AUTO_10590 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10589 ) ( CLEAR ?AUTO_10590 ) )
    :subtasks
    ( ( !STACK ?AUTO_10589 ?AUTO_10590 )
      ( MAKE-ON-VERIFY ?AUTO_10589 ?AUTO_10590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10593 - BLOCK
      ?AUTO_10594 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10594 ) ( ON-TABLE ?AUTO_10593 ) ( CLEAR ?AUTO_10593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_10593 )
      ( MAKE-ON ?AUTO_10593 ?AUTO_10594 )
      ( MAKE-ON-VERIFY ?AUTO_10593 ?AUTO_10594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10598 - BLOCK
      ?AUTO_10599 - BLOCK
    )
    :vars
    (
      ?AUTO_10602 - BLOCK
      ?AUTO_10603 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10599 ) ( ON-TABLE ?AUTO_10598 ) ( CLEAR ?AUTO_10598 ) ( HOLDING ?AUTO_10602 ) ( CLEAR ?AUTO_10603 ) )
    :subtasks
    ( ( !STACK ?AUTO_10602 ?AUTO_10603 )
      ( MAKE-ON ?AUTO_10598 ?AUTO_10599 )
      ( MAKE-ON-VERIFY ?AUTO_10598 ?AUTO_10599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10604 - BLOCK
      ?AUTO_10605 - BLOCK
    )
    :vars
    (
      ?AUTO_10607 - BLOCK
      ?AUTO_10609 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10605 ) ( ON-TABLE ?AUTO_10604 ) ( CLEAR ?AUTO_10607 ) ( ON ?AUTO_10609 ?AUTO_10604 ) ( CLEAR ?AUTO_10609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10609 ?AUTO_10604 )
      ( MAKE-ON ?AUTO_10604 ?AUTO_10605 )
      ( MAKE-ON-VERIFY ?AUTO_10604 ?AUTO_10605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10612 - BLOCK
      ?AUTO_10613 - BLOCK
    )
    :vars
    (
      ?AUTO_10617 - BLOCK
      ?AUTO_10616 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10613 ) ( ON-TABLE ?AUTO_10612 ) ( ON ?AUTO_10617 ?AUTO_10612 ) ( CLEAR ?AUTO_10617 ) ( HOLDING ?AUTO_10616 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10616 )
      ( MAKE-ON ?AUTO_10612 ?AUTO_10613 )
      ( MAKE-ON-VERIFY ?AUTO_10612 ?AUTO_10613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10619 - BLOCK
      ?AUTO_10620 - BLOCK
    )
    :vars
    (
      ?AUTO_10623 - BLOCK
      ?AUTO_10624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10619 ) ( ON ?AUTO_10623 ?AUTO_10619 ) ( CLEAR ?AUTO_10623 ) ( ON ?AUTO_10624 ?AUTO_10620 ) ( CLEAR ?AUTO_10624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10624 ?AUTO_10620 )
      ( MAKE-ON ?AUTO_10619 ?AUTO_10620 )
      ( MAKE-ON-VERIFY ?AUTO_10619 ?AUTO_10620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10627 - BLOCK
      ?AUTO_10628 - BLOCK
    )
    :vars
    (
      ?AUTO_10631 - BLOCK
      ?AUTO_10630 - BLOCK
      ?AUTO_10633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10627 ) ( ON ?AUTO_10631 ?AUTO_10627 ) ( CLEAR ?AUTO_10631 ) ( ON ?AUTO_10630 ?AUTO_10628 ) ( CLEAR ?AUTO_10630 ) ( HOLDING ?AUTO_10633 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10633 )
      ( MAKE-ON ?AUTO_10627 ?AUTO_10628 )
      ( MAKE-ON-VERIFY ?AUTO_10627 ?AUTO_10628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10634 - BLOCK
      ?AUTO_10635 - BLOCK
    )
    :vars
    (
      ?AUTO_10636 - BLOCK
      ?AUTO_10639 - BLOCK
      ?AUTO_10640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10634 ) ( ON ?AUTO_10636 ?AUTO_10634 ) ( CLEAR ?AUTO_10636 ) ( ON ?AUTO_10639 ?AUTO_10635 ) ( ON ?AUTO_10640 ?AUTO_10639 ) ( CLEAR ?AUTO_10640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10640 ?AUTO_10639 )
      ( MAKE-ON ?AUTO_10634 ?AUTO_10635 )
      ( MAKE-ON-VERIFY ?AUTO_10634 ?AUTO_10635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10643 - BLOCK
      ?AUTO_10644 - BLOCK
    )
    :vars
    (
      ?AUTO_10649 - BLOCK
      ?AUTO_10645 - BLOCK
      ?AUTO_10648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10643 ) ( ON ?AUTO_10649 ?AUTO_10644 ) ( ON ?AUTO_10645 ?AUTO_10649 ) ( CLEAR ?AUTO_10645 ) ( HOLDING ?AUTO_10648 ) ( CLEAR ?AUTO_10643 ) )
    :subtasks
    ( ( !STACK ?AUTO_10648 ?AUTO_10643 )
      ( MAKE-ON ?AUTO_10643 ?AUTO_10644 )
      ( MAKE-ON-VERIFY ?AUTO_10643 ?AUTO_10644 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10652 - BLOCK
      ?AUTO_10653 - BLOCK
    )
    :vars
    (
      ?AUTO_10654 - BLOCK
      ?AUTO_10655 - BLOCK
      ?AUTO_10658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10652 ) ( ON ?AUTO_10654 ?AUTO_10653 ) ( ON ?AUTO_10655 ?AUTO_10654 ) ( CLEAR ?AUTO_10652 ) ( ON ?AUTO_10658 ?AUTO_10655 ) ( CLEAR ?AUTO_10658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10658 ?AUTO_10655 )
      ( MAKE-ON ?AUTO_10652 ?AUTO_10653 )
      ( MAKE-ON-VERIFY ?AUTO_10652 ?AUTO_10653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10661 - BLOCK
      ?AUTO_10662 - BLOCK
    )
    :vars
    (
      ?AUTO_10664 - BLOCK
      ?AUTO_10663 - BLOCK
      ?AUTO_10667 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10664 ?AUTO_10662 ) ( ON ?AUTO_10663 ?AUTO_10664 ) ( ON ?AUTO_10667 ?AUTO_10663 ) ( CLEAR ?AUTO_10667 ) ( HOLDING ?AUTO_10661 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10661 )
      ( MAKE-ON ?AUTO_10661 ?AUTO_10662 )
      ( MAKE-ON-VERIFY ?AUTO_10661 ?AUTO_10662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10669 - BLOCK
      ?AUTO_10670 - BLOCK
    )
    :vars
    (
      ?AUTO_10673 - BLOCK
      ?AUTO_10672 - BLOCK
      ?AUTO_10675 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10673 ?AUTO_10670 ) ( ON ?AUTO_10672 ?AUTO_10673 ) ( ON ?AUTO_10675 ?AUTO_10672 ) ( ON ?AUTO_10669 ?AUTO_10675 ) ( CLEAR ?AUTO_10669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10669 ?AUTO_10675 )
      ( MAKE-ON ?AUTO_10669 ?AUTO_10670 )
      ( MAKE-ON-VERIFY ?AUTO_10669 ?AUTO_10670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10680 - BLOCK
      ?AUTO_10681 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10680 ) ( CLEAR ?AUTO_10681 ) )
    :subtasks
    ( ( !STACK ?AUTO_10680 ?AUTO_10681 )
      ( MAKE-ON-VERIFY ?AUTO_10680 ?AUTO_10681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10684 - BLOCK
      ?AUTO_10685 - BLOCK
    )
    :vars
    (
      ?AUTO_10689 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10685 ) ( ON ?AUTO_10684 ?AUTO_10689 ) ( CLEAR ?AUTO_10684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10684 ?AUTO_10689 )
      ( MAKE-ON ?AUTO_10684 ?AUTO_10685 )
      ( MAKE-ON-VERIFY ?AUTO_10684 ?AUTO_10685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10690 - BLOCK
      ?AUTO_10691 - BLOCK
    )
    :vars
    (
      ?AUTO_10694 - BLOCK
      ?AUTO_10696 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10690 ?AUTO_10694 ) ( CLEAR ?AUTO_10690 ) ( HOLDING ?AUTO_10691 ) ( CLEAR ?AUTO_10696 ) )
    :subtasks
    ( ( !STACK ?AUTO_10691 ?AUTO_10696 )
      ( MAKE-ON ?AUTO_10690 ?AUTO_10691 )
      ( MAKE-ON-VERIFY ?AUTO_10690 ?AUTO_10691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10745 - BLOCK
      ?AUTO_10746 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10745 ) ( CLEAR ?AUTO_10746 ) )
    :subtasks
    ( ( !STACK ?AUTO_10745 ?AUTO_10746 )
      ( MAKE-ON-VERIFY ?AUTO_10745 ?AUTO_10746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10749 - BLOCK
      ?AUTO_10750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10750 ) ( ON-TABLE ?AUTO_10749 ) ( CLEAR ?AUTO_10749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_10749 )
      ( MAKE-ON ?AUTO_10749 ?AUTO_10750 )
      ( MAKE-ON-VERIFY ?AUTO_10749 ?AUTO_10750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10754 - BLOCK
      ?AUTO_10755 - BLOCK
    )
    :vars
    (
      ?AUTO_10759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10754 ) ( CLEAR ?AUTO_10754 ) ( HOLDING ?AUTO_10755 ) ( CLEAR ?AUTO_10759 ) )
    :subtasks
    ( ( !STACK ?AUTO_10755 ?AUTO_10759 )
      ( MAKE-ON ?AUTO_10754 ?AUTO_10755 )
      ( MAKE-ON-VERIFY ?AUTO_10754 ?AUTO_10755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10760 - BLOCK
      ?AUTO_10761 - BLOCK
    )
    :vars
    (
      ?AUTO_10763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10760 ) ( CLEAR ?AUTO_10763 ) ( ON ?AUTO_10761 ?AUTO_10760 ) ( CLEAR ?AUTO_10761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10761 ?AUTO_10760 )
      ( MAKE-ON ?AUTO_10760 ?AUTO_10761 )
      ( MAKE-ON-VERIFY ?AUTO_10760 ?AUTO_10761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10767 - BLOCK
      ?AUTO_10768 - BLOCK
    )
    :vars
    (
      ?AUTO_10769 - BLOCK
      ?AUTO_10773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10767 ) ( ON ?AUTO_10768 ?AUTO_10767 ) ( CLEAR ?AUTO_10768 ) ( HOLDING ?AUTO_10769 ) ( CLEAR ?AUTO_10773 ) )
    :subtasks
    ( ( !STACK ?AUTO_10769 ?AUTO_10773 )
      ( MAKE-ON ?AUTO_10767 ?AUTO_10768 )
      ( MAKE-ON-VERIFY ?AUTO_10767 ?AUTO_10768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10786 - BLOCK
      ?AUTO_10787 - BLOCK
    )
    :vars
    (
      ?AUTO_10790 - BLOCK
      ?AUTO_10791 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10787 ) ( ON ?AUTO_10786 ?AUTO_10790 ) ( ON ?AUTO_10791 ?AUTO_10786 ) ( CLEAR ?AUTO_10791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10791 ?AUTO_10786 )
      ( MAKE-ON ?AUTO_10786 ?AUTO_10787 )
      ( MAKE-ON-VERIFY ?AUTO_10786 ?AUTO_10787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10794 - BLOCK
      ?AUTO_10795 - BLOCK
    )
    :vars
    (
      ?AUTO_10798 - BLOCK
      ?AUTO_10799 - BLOCK
      ?AUTO_10801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10794 ?AUTO_10798 ) ( ON ?AUTO_10799 ?AUTO_10794 ) ( CLEAR ?AUTO_10799 ) ( HOLDING ?AUTO_10795 ) ( CLEAR ?AUTO_10801 ) )
    :subtasks
    ( ( !STACK ?AUTO_10795 ?AUTO_10801 )
      ( MAKE-ON ?AUTO_10794 ?AUTO_10795 )
      ( MAKE-ON-VERIFY ?AUTO_10794 ?AUTO_10795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10802 - BLOCK
      ?AUTO_10803 - BLOCK
    )
    :vars
    (
      ?AUTO_10804 - BLOCK
      ?AUTO_10807 - BLOCK
      ?AUTO_10808 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10802 ?AUTO_10804 ) ( ON ?AUTO_10807 ?AUTO_10802 ) ( CLEAR ?AUTO_10808 ) ( ON ?AUTO_10803 ?AUTO_10807 ) ( CLEAR ?AUTO_10803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10803 ?AUTO_10807 )
      ( MAKE-ON ?AUTO_10802 ?AUTO_10803 )
      ( MAKE-ON-VERIFY ?AUTO_10802 ?AUTO_10803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10811 - BLOCK
      ?AUTO_10812 - BLOCK
    )
    :vars
    (
      ?AUTO_10813 - BLOCK
      ?AUTO_10817 - BLOCK
      ?AUTO_10816 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10811 ?AUTO_10813 ) ( ON ?AUTO_10817 ?AUTO_10811 ) ( ON ?AUTO_10812 ?AUTO_10817 ) ( CLEAR ?AUTO_10812 ) ( HOLDING ?AUTO_10816 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10816 )
      ( MAKE-ON ?AUTO_10811 ?AUTO_10812 )
      ( MAKE-ON-VERIFY ?AUTO_10811 ?AUTO_10812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10819 - BLOCK
      ?AUTO_10820 - BLOCK
    )
    :vars
    (
      ?AUTO_10822 - BLOCK
      ?AUTO_10823 - BLOCK
      ?AUTO_10821 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10819 ?AUTO_10822 ) ( ON ?AUTO_10823 ?AUTO_10819 ) ( ON ?AUTO_10820 ?AUTO_10823 ) ( ON ?AUTO_10821 ?AUTO_10820 ) ( CLEAR ?AUTO_10821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10821 ?AUTO_10820 )
      ( MAKE-ON ?AUTO_10819 ?AUTO_10820 )
      ( MAKE-ON-VERIFY ?AUTO_10819 ?AUTO_10820 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10825 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10825 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10825 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10825 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10827 - BLOCK
    )
    :vars
    (
      ?AUTO_10830 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10827 ?AUTO_10830 ) ( CLEAR ?AUTO_10827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10827 ?AUTO_10830 )
      ( MAKE-ON-TABLE ?AUTO_10827 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10827 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10832 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10832 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10832 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10832 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10834 - BLOCK
    )
    :vars
    (
      ?AUTO_10837 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10834 ?AUTO_10837 ) ( CLEAR ?AUTO_10834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10834 ?AUTO_10837 )
      ( MAKE-ON-TABLE ?AUTO_10834 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10834 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10838 - BLOCK
    )
    :vars
    (
      ?AUTO_10840 - BLOCK
      ?AUTO_10841 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10838 ?AUTO_10840 ) ( CLEAR ?AUTO_10838 ) ( HOLDING ?AUTO_10841 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10841 )
      ( MAKE-ON-TABLE ?AUTO_10838 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10838 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10842 - BLOCK
    )
    :vars
    (
      ?AUTO_10844 - BLOCK
      ?AUTO_10845 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10842 ?AUTO_10844 ) ( ON ?AUTO_10845 ?AUTO_10842 ) ( CLEAR ?AUTO_10845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10845 ?AUTO_10842 )
      ( MAKE-ON-TABLE ?AUTO_10842 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10842 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10849 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10849 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10849 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10849 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10851 - BLOCK
    )
    :vars
    (
      ?AUTO_10854 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10851 ?AUTO_10854 ) ( CLEAR ?AUTO_10851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10851 ?AUTO_10854 )
      ( MAKE-ON-TABLE ?AUTO_10851 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10851 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10855 - BLOCK
    )
    :vars
    (
      ?AUTO_10857 - BLOCK
      ?AUTO_10858 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10855 ?AUTO_10857 ) ( CLEAR ?AUTO_10855 ) ( HOLDING ?AUTO_10858 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10858 )
      ( MAKE-ON-TABLE ?AUTO_10855 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10855 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10859 - BLOCK
    )
    :vars
    (
      ?AUTO_10861 - BLOCK
      ?AUTO_10862 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10859 ?AUTO_10861 ) ( ON ?AUTO_10862 ?AUTO_10859 ) ( CLEAR ?AUTO_10862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10862 ?AUTO_10859 )
      ( MAKE-ON-TABLE ?AUTO_10859 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10859 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10865 - BLOCK
    )
    :vars
    (
      ?AUTO_10866 - BLOCK
      ?AUTO_10867 - BLOCK
      ?AUTO_10869 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10865 ?AUTO_10866 ) ( ON ?AUTO_10867 ?AUTO_10865 ) ( CLEAR ?AUTO_10867 ) ( HOLDING ?AUTO_10869 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10869 )
      ( MAKE-ON-TABLE ?AUTO_10865 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10865 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10870 - BLOCK
    )
    :vars
    (
      ?AUTO_10872 - BLOCK
      ?AUTO_10873 - BLOCK
      ?AUTO_10874 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10870 ?AUTO_10872 ) ( ON ?AUTO_10873 ?AUTO_10870 ) ( ON ?AUTO_10874 ?AUTO_10873 ) ( CLEAR ?AUTO_10874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10874 ?AUTO_10873 )
      ( MAKE-ON-TABLE ?AUTO_10870 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10870 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10878 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10878 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10878 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10880 - BLOCK
    )
    :vars
    (
      ?AUTO_10883 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10880 ?AUTO_10883 ) ( CLEAR ?AUTO_10880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10880 ?AUTO_10883 )
      ( MAKE-ON-TABLE ?AUTO_10880 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10880 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10884 - BLOCK
    )
    :vars
    (
      ?AUTO_10886 - BLOCK
      ?AUTO_10887 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10884 ?AUTO_10886 ) ( CLEAR ?AUTO_10884 ) ( HOLDING ?AUTO_10887 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10887 )
      ( MAKE-ON-TABLE ?AUTO_10884 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10884 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10888 - BLOCK
    )
    :vars
    (
      ?AUTO_10889 - BLOCK
      ?AUTO_10891 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10888 ?AUTO_10889 ) ( ON ?AUTO_10891 ?AUTO_10888 ) ( CLEAR ?AUTO_10891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10891 ?AUTO_10888 )
      ( MAKE-ON-TABLE ?AUTO_10888 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10888 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10894 - BLOCK
    )
    :vars
    (
      ?AUTO_10896 - BLOCK
      ?AUTO_10895 - BLOCK
      ?AUTO_10898 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10894 ?AUTO_10896 ) ( ON ?AUTO_10895 ?AUTO_10894 ) ( CLEAR ?AUTO_10895 ) ( HOLDING ?AUTO_10898 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10898 )
      ( MAKE-ON-TABLE ?AUTO_10894 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10894 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10899 - BLOCK
    )
    :vars
    (
      ?AUTO_10902 - BLOCK
      ?AUTO_10900 - BLOCK
      ?AUTO_10903 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10899 ?AUTO_10902 ) ( ON ?AUTO_10900 ?AUTO_10899 ) ( ON ?AUTO_10903 ?AUTO_10900 ) ( CLEAR ?AUTO_10903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10903 ?AUTO_10900 )
      ( MAKE-ON-TABLE ?AUTO_10899 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10899 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10906 - BLOCK
    )
    :vars
    (
      ?AUTO_10910 - BLOCK
      ?AUTO_10909 - BLOCK
      ?AUTO_10907 - BLOCK
      ?AUTO_10911 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10906 ?AUTO_10910 ) ( ON ?AUTO_10909 ?AUTO_10906 ) ( ON ?AUTO_10907 ?AUTO_10909 ) ( CLEAR ?AUTO_10907 ) ( HOLDING ?AUTO_10911 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10911 )
      ( MAKE-ON-TABLE ?AUTO_10906 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10906 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10912 - BLOCK
    )
    :vars
    (
      ?AUTO_10914 - BLOCK
      ?AUTO_10916 - BLOCK
      ?AUTO_10913 - BLOCK
      ?AUTO_10917 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10912 ?AUTO_10914 ) ( ON ?AUTO_10916 ?AUTO_10912 ) ( ON ?AUTO_10913 ?AUTO_10916 ) ( ON ?AUTO_10917 ?AUTO_10913 ) ( CLEAR ?AUTO_10917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10917 ?AUTO_10913 )
      ( MAKE-ON-TABLE ?AUTO_10912 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10922 - BLOCK
      ?AUTO_10923 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10922 ) ( CLEAR ?AUTO_10923 ) )
    :subtasks
    ( ( !STACK ?AUTO_10922 ?AUTO_10923 )
      ( MAKE-ON-VERIFY ?AUTO_10922 ?AUTO_10923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10926 - BLOCK
      ?AUTO_10927 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10927 ) ( ON-TABLE ?AUTO_10926 ) ( CLEAR ?AUTO_10926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_10926 )
      ( MAKE-ON ?AUTO_10926 ?AUTO_10927 )
      ( MAKE-ON-VERIFY ?AUTO_10926 ?AUTO_10927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10931 - BLOCK
      ?AUTO_10932 - BLOCK
    )
    :vars
    (
      ?AUTO_10935 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10932 ) ( ON-TABLE ?AUTO_10931 ) ( CLEAR ?AUTO_10931 ) ( HOLDING ?AUTO_10935 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10935 )
      ( MAKE-ON ?AUTO_10931 ?AUTO_10932 )
      ( MAKE-ON-VERIFY ?AUTO_10931 ?AUTO_10932 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10936 - BLOCK
      ?AUTO_10937 - BLOCK
    )
    :vars
    (
      ?AUTO_10940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10936 ) ( CLEAR ?AUTO_10936 ) ( ON ?AUTO_10940 ?AUTO_10937 ) ( CLEAR ?AUTO_10940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10940 ?AUTO_10937 )
      ( MAKE-ON ?AUTO_10936 ?AUTO_10937 )
      ( MAKE-ON-VERIFY ?AUTO_10936 ?AUTO_10937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10943 - BLOCK
      ?AUTO_10944 - BLOCK
    )
    :vars
    (
      ?AUTO_10947 - BLOCK
      ?AUTO_10948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10943 ) ( CLEAR ?AUTO_10943 ) ( ON ?AUTO_10947 ?AUTO_10944 ) ( CLEAR ?AUTO_10947 ) ( HOLDING ?AUTO_10948 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10948 )
      ( MAKE-ON ?AUTO_10943 ?AUTO_10944 )
      ( MAKE-ON-VERIFY ?AUTO_10943 ?AUTO_10944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10949 - BLOCK
      ?AUTO_10950 - BLOCK
    )
    :vars
    (
      ?AUTO_10951 - BLOCK
      ?AUTO_10954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10949 ) ( CLEAR ?AUTO_10949 ) ( ON ?AUTO_10951 ?AUTO_10950 ) ( ON ?AUTO_10954 ?AUTO_10951 ) ( CLEAR ?AUTO_10954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10954 ?AUTO_10951 )
      ( MAKE-ON ?AUTO_10949 ?AUTO_10950 )
      ( MAKE-ON-VERIFY ?AUTO_10949 ?AUTO_10950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10957 - BLOCK
      ?AUTO_10958 - BLOCK
    )
    :vars
    (
      ?AUTO_10959 - BLOCK
      ?AUTO_10960 - BLOCK
      ?AUTO_10963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10957 ) ( CLEAR ?AUTO_10957 ) ( ON ?AUTO_10959 ?AUTO_10958 ) ( ON ?AUTO_10960 ?AUTO_10959 ) ( CLEAR ?AUTO_10960 ) ( HOLDING ?AUTO_10963 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10963 )
      ( MAKE-ON ?AUTO_10957 ?AUTO_10958 )
      ( MAKE-ON-VERIFY ?AUTO_10957 ?AUTO_10958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10964 - BLOCK
      ?AUTO_10965 - BLOCK
    )
    :vars
    (
      ?AUTO_10967 - BLOCK
      ?AUTO_10966 - BLOCK
      ?AUTO_10970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10964 ) ( CLEAR ?AUTO_10964 ) ( ON ?AUTO_10967 ?AUTO_10965 ) ( ON ?AUTO_10966 ?AUTO_10967 ) ( ON ?AUTO_10970 ?AUTO_10966 ) ( CLEAR ?AUTO_10970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10970 ?AUTO_10966 )
      ( MAKE-ON ?AUTO_10964 ?AUTO_10965 )
      ( MAKE-ON-VERIFY ?AUTO_10964 ?AUTO_10965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10973 - BLOCK
      ?AUTO_10974 - BLOCK
    )
    :vars
    (
      ?AUTO_10975 - BLOCK
      ?AUTO_10976 - BLOCK
      ?AUTO_10979 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10975 ?AUTO_10974 ) ( ON ?AUTO_10976 ?AUTO_10975 ) ( ON ?AUTO_10979 ?AUTO_10976 ) ( CLEAR ?AUTO_10979 ) ( HOLDING ?AUTO_10973 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10973 )
      ( MAKE-ON ?AUTO_10973 ?AUTO_10974 )
      ( MAKE-ON-VERIFY ?AUTO_10973 ?AUTO_10974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10981 - BLOCK
      ?AUTO_10982 - BLOCK
    )
    :vars
    (
      ?AUTO_10984 - BLOCK
      ?AUTO_10983 - BLOCK
      ?AUTO_10987 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10984 ?AUTO_10982 ) ( ON ?AUTO_10983 ?AUTO_10984 ) ( ON ?AUTO_10987 ?AUTO_10983 ) ( ON ?AUTO_10981 ?AUTO_10987 ) ( CLEAR ?AUTO_10981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10981 ?AUTO_10987 )
      ( MAKE-ON ?AUTO_10981 ?AUTO_10982 )
      ( MAKE-ON-VERIFY ?AUTO_10981 ?AUTO_10982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10990 - BLOCK
      ?AUTO_10991 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10990 ) ( CLEAR ?AUTO_10991 ) )
    :subtasks
    ( ( !STACK ?AUTO_10990 ?AUTO_10991 )
      ( MAKE-ON-VERIFY ?AUTO_10990 ?AUTO_10991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10994 - BLOCK
      ?AUTO_10995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10995 ) ( ON-TABLE ?AUTO_10994 ) ( CLEAR ?AUTO_10994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_10994 )
      ( MAKE-ON ?AUTO_10994 ?AUTO_10995 )
      ( MAKE-ON-VERIFY ?AUTO_10994 ?AUTO_10995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11001 - BLOCK
      ?AUTO_11002 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_11001 ) ( CLEAR ?AUTO_11002 ) )
    :subtasks
    ( ( !STACK ?AUTO_11001 ?AUTO_11002 )
      ( MAKE-ON-VERIFY ?AUTO_11001 ?AUTO_11002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11005 - BLOCK
      ?AUTO_11006 - BLOCK
    )
    :vars
    (
      ?AUTO_11010 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_11006 ) ( ON ?AUTO_11005 ?AUTO_11010 ) ( CLEAR ?AUTO_11005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11005 ?AUTO_11010 )
      ( MAKE-ON ?AUTO_11005 ?AUTO_11006 )
      ( MAKE-ON-VERIFY ?AUTO_11005 ?AUTO_11006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11011 - BLOCK
      ?AUTO_11012 - BLOCK
    )
    :vars
    (
      ?AUTO_11015 - BLOCK
      ?AUTO_11017 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11011 ?AUTO_11015 ) ( CLEAR ?AUTO_11011 ) ( HOLDING ?AUTO_11012 ) ( CLEAR ?AUTO_11017 ) )
    :subtasks
    ( ( !STACK ?AUTO_11012 ?AUTO_11017 )
      ( MAKE-ON ?AUTO_11011 ?AUTO_11012 )
      ( MAKE-ON-VERIFY ?AUTO_11011 ?AUTO_11012 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_11021 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_11021 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_11021 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_11021 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_11023 - BLOCK
    )
    :vars
    (
      ?AUTO_11026 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11023 ?AUTO_11026 ) ( CLEAR ?AUTO_11023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11023 ?AUTO_11026 )
      ( MAKE-ON-TABLE ?AUTO_11023 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_11023 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_11027 - BLOCK
    )
    :vars
    (
      ?AUTO_11029 - BLOCK
      ?AUTO_11030 - BLOCK
      ?AUTO_11031 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11027 ?AUTO_11029 ) ( CLEAR ?AUTO_11027 ) ( HOLDING ?AUTO_11030 ) ( CLEAR ?AUTO_11031 ) )
    :subtasks
    ( ( !STACK ?AUTO_11030 ?AUTO_11031 )
      ( MAKE-ON-TABLE ?AUTO_11027 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_11027 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_11032 - BLOCK
    )
    :vars
    (
      ?AUTO_11034 - BLOCK
      ?AUTO_11036 - BLOCK
      ?AUTO_11035 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11032 ?AUTO_11034 ) ( CLEAR ?AUTO_11036 ) ( ON ?AUTO_11035 ?AUTO_11032 ) ( CLEAR ?AUTO_11035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11035 ?AUTO_11032 )
      ( MAKE-ON-TABLE ?AUTO_11032 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_11032 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_11039 - BLOCK
    )
    :vars
    (
      ?AUTO_11042 - BLOCK
      ?AUTO_11043 - BLOCK
      ?AUTO_11040 - BLOCK
      ?AUTO_11045 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11039 ?AUTO_11042 ) ( ON ?AUTO_11043 ?AUTO_11039 ) ( CLEAR ?AUTO_11043 ) ( HOLDING ?AUTO_11040 ) ( CLEAR ?AUTO_11045 ) )
    :subtasks
    ( ( !STACK ?AUTO_11040 ?AUTO_11045 )
      ( MAKE-ON-TABLE ?AUTO_11039 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_11039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11049 - BLOCK
      ?AUTO_11050 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_11049 ) ( CLEAR ?AUTO_11050 ) )
    :subtasks
    ( ( !STACK ?AUTO_11049 ?AUTO_11050 )
      ( MAKE-ON-VERIFY ?AUTO_11049 ?AUTO_11050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11053 - BLOCK
      ?AUTO_11054 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_11054 ) ( ON-TABLE ?AUTO_11053 ) ( CLEAR ?AUTO_11053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_11053 )
      ( MAKE-ON ?AUTO_11053 ?AUTO_11054 )
      ( MAKE-ON-VERIFY ?AUTO_11053 ?AUTO_11054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11058 - BLOCK
      ?AUTO_11059 - BLOCK
    )
    :vars
    (
      ?AUTO_11062 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_11059 ) ( ON-TABLE ?AUTO_11058 ) ( CLEAR ?AUTO_11058 ) ( HOLDING ?AUTO_11062 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_11062 )
      ( MAKE-ON ?AUTO_11058 ?AUTO_11059 )
      ( MAKE-ON-VERIFY ?AUTO_11058 ?AUTO_11059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11063 - BLOCK
      ?AUTO_11064 - BLOCK
    )
    :vars
    (
      ?AUTO_11067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_11064 ) ( ON-TABLE ?AUTO_11063 ) ( ON ?AUTO_11067 ?AUTO_11063 ) ( CLEAR ?AUTO_11067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11067 ?AUTO_11063 )
      ( MAKE-ON ?AUTO_11063 ?AUTO_11064 )
      ( MAKE-ON-VERIFY ?AUTO_11063 ?AUTO_11064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11070 - BLOCK
      ?AUTO_11071 - BLOCK
    )
    :vars
    (
      ?AUTO_11072 - BLOCK
      ?AUTO_11076 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_11070 ) ( ON ?AUTO_11072 ?AUTO_11070 ) ( CLEAR ?AUTO_11072 ) ( HOLDING ?AUTO_11071 ) ( CLEAR ?AUTO_11076 ) )
    :subtasks
    ( ( !STACK ?AUTO_11071 ?AUTO_11076 )
      ( MAKE-ON ?AUTO_11070 ?AUTO_11071 )
      ( MAKE-ON-VERIFY ?AUTO_11070 ?AUTO_11071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11077 - BLOCK
      ?AUTO_11078 - BLOCK
    )
    :vars
    (
      ?AUTO_11079 - BLOCK
      ?AUTO_11082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_11077 ) ( ON ?AUTO_11079 ?AUTO_11077 ) ( CLEAR ?AUTO_11082 ) ( ON ?AUTO_11078 ?AUTO_11079 ) ( CLEAR ?AUTO_11078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11078 ?AUTO_11079 )
      ( MAKE-ON ?AUTO_11077 ?AUTO_11078 )
      ( MAKE-ON-VERIFY ?AUTO_11077 ?AUTO_11078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11085 - BLOCK
      ?AUTO_11086 - BLOCK
    )
    :vars
    (
      ?AUTO_11087 - BLOCK
      ?AUTO_11090 - BLOCK
      ?AUTO_11092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_11085 ) ( ON ?AUTO_11087 ?AUTO_11085 ) ( ON ?AUTO_11086 ?AUTO_11087 ) ( CLEAR ?AUTO_11086 ) ( HOLDING ?AUTO_11090 ) ( CLEAR ?AUTO_11092 ) )
    :subtasks
    ( ( !STACK ?AUTO_11090 ?AUTO_11092 )
      ( MAKE-ON ?AUTO_11085 ?AUTO_11086 )
      ( MAKE-ON-VERIFY ?AUTO_11085 ?AUTO_11086 ) )
  )

)

