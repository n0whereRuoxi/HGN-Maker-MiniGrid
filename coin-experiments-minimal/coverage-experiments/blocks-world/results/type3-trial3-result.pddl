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

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2 - BLOCK
      ?AUTO_3 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2 ) ( CLEAR ?AUTO_3 ) )
    :subtasks
    ( ( !STACK ?AUTO_2 ?AUTO_3 )
      ( MAKE-ON-VERIFY ?AUTO_2 ?AUTO_3 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6 - BLOCK
      ?AUTO_7 - BLOCK
    )
    :vars
    (
      ?AUTO_11 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7 ) ( ON ?AUTO_6 ?AUTO_11 ) ( CLEAR ?AUTO_6 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6 ?AUTO_11 )
      ( MAKE-ON ?AUTO_6 ?AUTO_7 )
      ( MAKE-ON-VERIFY ?AUTO_6 ?AUTO_7 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_13 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_13 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_13 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_13 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_15 - BLOCK
    )
    :vars
    (
      ?AUTO_18 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_15 ?AUTO_18 ) ( CLEAR ?AUTO_15 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_15 ?AUTO_18 )
      ( MAKE-ON-TABLE ?AUTO_15 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_15 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_19 - BLOCK
    )
    :vars
    (
      ?AUTO_21 - BLOCK
      ?AUTO_22 - BLOCK
      ?AUTO_23 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_19 ?AUTO_21 ) ( CLEAR ?AUTO_19 ) ( HOLDING ?AUTO_22 ) ( CLEAR ?AUTO_23 ) )
    :subtasks
    ( ( !STACK ?AUTO_22 ?AUTO_23 )
      ( MAKE-ON-TABLE ?AUTO_19 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_19 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_24 - BLOCK
    )
    :vars
    (
      ?AUTO_27 - BLOCK
      ?AUTO_25 - BLOCK
      ?AUTO_28 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_24 ?AUTO_27 ) ( CLEAR ?AUTO_25 ) ( ON ?AUTO_28 ?AUTO_24 ) ( CLEAR ?AUTO_28 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_28 ?AUTO_24 )
      ( MAKE-ON-TABLE ?AUTO_24 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_24 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_33 - BLOCK
      ?AUTO_34 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_33 ) ( CLEAR ?AUTO_34 ) )
    :subtasks
    ( ( !STACK ?AUTO_33 ?AUTO_34 )
      ( MAKE-ON-VERIFY ?AUTO_33 ?AUTO_34 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37 - BLOCK
      ?AUTO_38 - BLOCK
    )
    :vars
    (
      ?AUTO_42 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_38 ) ( ON ?AUTO_37 ?AUTO_42 ) ( CLEAR ?AUTO_37 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_37 ?AUTO_42 )
      ( MAKE-ON ?AUTO_37 ?AUTO_38 )
      ( MAKE-ON-VERIFY ?AUTO_37 ?AUTO_38 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_43 - BLOCK
      ?AUTO_44 - BLOCK
    )
    :vars
    (
      ?AUTO_47 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_43 ?AUTO_47 ) ( CLEAR ?AUTO_43 ) ( HOLDING ?AUTO_44 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_44 )
      ( MAKE-ON ?AUTO_43 ?AUTO_44 )
      ( MAKE-ON-VERIFY ?AUTO_43 ?AUTO_44 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49 - BLOCK
      ?AUTO_50 - BLOCK
    )
    :vars
    (
      ?AUTO_53 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_49 ?AUTO_53 ) ( ON ?AUTO_50 ?AUTO_49 ) ( CLEAR ?AUTO_50 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_50 ?AUTO_49 )
      ( MAKE-ON ?AUTO_49 ?AUTO_50 )
      ( MAKE-ON-VERIFY ?AUTO_49 ?AUTO_50 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56 - BLOCK
      ?AUTO_57 - BLOCK
    )
    :vars
    (
      ?AUTO_60 - BLOCK
      ?AUTO_61 - BLOCK
      ?AUTO_62 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_56 ?AUTO_60 ) ( ON ?AUTO_57 ?AUTO_56 ) ( CLEAR ?AUTO_57 ) ( HOLDING ?AUTO_61 ) ( CLEAR ?AUTO_62 ) )
    :subtasks
    ( ( !STACK ?AUTO_61 ?AUTO_62 )
      ( MAKE-ON ?AUTO_56 ?AUTO_57 )
      ( MAKE-ON-VERIFY ?AUTO_56 ?AUTO_57 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_63 - BLOCK
      ?AUTO_64 - BLOCK
    )
    :vars
    (
      ?AUTO_67 - BLOCK
      ?AUTO_69 - BLOCK
      ?AUTO_68 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_63 ?AUTO_67 ) ( ON ?AUTO_64 ?AUTO_63 ) ( CLEAR ?AUTO_69 ) ( ON ?AUTO_68 ?AUTO_64 ) ( CLEAR ?AUTO_68 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_68 ?AUTO_64 )
      ( MAKE-ON ?AUTO_63 ?AUTO_64 )
      ( MAKE-ON-VERIFY ?AUTO_63 ?AUTO_64 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_74 - BLOCK
      ?AUTO_75 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_74 ) ( CLEAR ?AUTO_75 ) )
    :subtasks
    ( ( !STACK ?AUTO_74 ?AUTO_75 )
      ( MAKE-ON-VERIFY ?AUTO_74 ?AUTO_75 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_78 - BLOCK
      ?AUTO_79 - BLOCK
    )
    :vars
    (
      ?AUTO_83 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_79 ) ( ON ?AUTO_78 ?AUTO_83 ) ( CLEAR ?AUTO_78 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_78 ?AUTO_83 )
      ( MAKE-ON ?AUTO_78 ?AUTO_79 )
      ( MAKE-ON-VERIFY ?AUTO_78 ?AUTO_79 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_84 - BLOCK
      ?AUTO_85 - BLOCK
    )
    :vars
    (
      ?AUTO_88 - BLOCK
      ?AUTO_90 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_84 ?AUTO_88 ) ( CLEAR ?AUTO_84 ) ( HOLDING ?AUTO_85 ) ( CLEAR ?AUTO_90 ) )
    :subtasks
    ( ( !STACK ?AUTO_85 ?AUTO_90 )
      ( MAKE-ON ?AUTO_84 ?AUTO_85 )
      ( MAKE-ON-VERIFY ?AUTO_84 ?AUTO_85 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_91 - BLOCK
      ?AUTO_92 - BLOCK
    )
    :vars
    (
      ?AUTO_95 - BLOCK
      ?AUTO_96 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_91 ?AUTO_95 ) ( CLEAR ?AUTO_96 ) ( ON ?AUTO_92 ?AUTO_91 ) ( CLEAR ?AUTO_92 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_92 ?AUTO_91 )
      ( MAKE-ON ?AUTO_91 ?AUTO_92 )
      ( MAKE-ON-VERIFY ?AUTO_91 ?AUTO_92 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_99 - BLOCK
      ?AUTO_100 - BLOCK
    )
    :vars
    (
      ?AUTO_104 - BLOCK
      ?AUTO_103 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_99 ?AUTO_104 ) ( ON ?AUTO_100 ?AUTO_99 ) ( CLEAR ?AUTO_100 ) ( HOLDING ?AUTO_103 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_103 )
      ( MAKE-ON ?AUTO_99 ?AUTO_100 )
      ( MAKE-ON-VERIFY ?AUTO_99 ?AUTO_100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_106 - BLOCK
      ?AUTO_107 - BLOCK
    )
    :vars
    (
      ?AUTO_111 - BLOCK
      ?AUTO_110 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_106 ?AUTO_111 ) ( ON ?AUTO_107 ?AUTO_106 ) ( ON ?AUTO_110 ?AUTO_107 ) ( CLEAR ?AUTO_110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_110 ?AUTO_107 )
      ( MAKE-ON ?AUTO_106 ?AUTO_107 )
      ( MAKE-ON-VERIFY ?AUTO_106 ?AUTO_107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_114 - BLOCK
      ?AUTO_115 - BLOCK
    )
    :vars
    (
      ?AUTO_119 - BLOCK
      ?AUTO_118 - BLOCK
      ?AUTO_120 - BLOCK
      ?AUTO_121 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_114 ?AUTO_119 ) ( ON ?AUTO_115 ?AUTO_114 ) ( ON ?AUTO_118 ?AUTO_115 ) ( CLEAR ?AUTO_118 ) ( HOLDING ?AUTO_120 ) ( CLEAR ?AUTO_121 ) )
    :subtasks
    ( ( !STACK ?AUTO_120 ?AUTO_121 )
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
      ?AUTO_128 - BLOCK
      ?AUTO_125 - BLOCK
      ?AUTO_124 - BLOCK
      ?AUTO_129 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_122 ?AUTO_128 ) ( ON ?AUTO_123 ?AUTO_122 ) ( ON ?AUTO_125 ?AUTO_123 ) ( CLEAR ?AUTO_124 ) ( ON ?AUTO_129 ?AUTO_125 ) ( CLEAR ?AUTO_129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_129 ?AUTO_125 )
      ( MAKE-ON ?AUTO_122 ?AUTO_123 )
      ( MAKE-ON-VERIFY ?AUTO_122 ?AUTO_123 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_133 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_133 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_133 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_133 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_135 - BLOCK
    )
    :vars
    (
      ?AUTO_138 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_135 ?AUTO_138 ) ( CLEAR ?AUTO_135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_135 ?AUTO_138 )
      ( MAKE-ON-TABLE ?AUTO_135 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_135 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_139 - BLOCK
    )
    :vars
    (
      ?AUTO_141 - BLOCK
      ?AUTO_142 - BLOCK
      ?AUTO_143 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_139 ?AUTO_141 ) ( CLEAR ?AUTO_139 ) ( HOLDING ?AUTO_142 ) ( CLEAR ?AUTO_143 ) )
    :subtasks
    ( ( !STACK ?AUTO_142 ?AUTO_143 )
      ( MAKE-ON-TABLE ?AUTO_139 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_153 - BLOCK
      ?AUTO_154 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_153 ) ( CLEAR ?AUTO_154 ) )
    :subtasks
    ( ( !STACK ?AUTO_153 ?AUTO_154 )
      ( MAKE-ON-VERIFY ?AUTO_153 ?AUTO_154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_157 - BLOCK
      ?AUTO_158 - BLOCK
    )
    :vars
    (
      ?AUTO_162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_158 ) ( ON ?AUTO_157 ?AUTO_162 ) ( CLEAR ?AUTO_157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_157 ?AUTO_162 )
      ( MAKE-ON ?AUTO_157 ?AUTO_158 )
      ( MAKE-ON-VERIFY ?AUTO_157 ?AUTO_158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_163 - BLOCK
      ?AUTO_164 - BLOCK
    )
    :vars
    (
      ?AUTO_167 - BLOCK
      ?AUTO_168 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_164 ) ( ON ?AUTO_163 ?AUTO_167 ) ( CLEAR ?AUTO_163 ) ( HOLDING ?AUTO_168 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_168 )
      ( MAKE-ON ?AUTO_163 ?AUTO_164 )
      ( MAKE-ON-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_169 - BLOCK
      ?AUTO_170 - BLOCK
    )
    :vars
    (
      ?AUTO_173 - BLOCK
      ?AUTO_174 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_169 ?AUTO_173 ) ( CLEAR ?AUTO_169 ) ( ON ?AUTO_174 ?AUTO_170 ) ( CLEAR ?AUTO_174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_174 ?AUTO_170 )
      ( MAKE-ON ?AUTO_169 ?AUTO_170 )
      ( MAKE-ON-VERIFY ?AUTO_169 ?AUTO_170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_177 - BLOCK
      ?AUTO_178 - BLOCK
    )
    :vars
    (
      ?AUTO_180 - BLOCK
      ?AUTO_179 - BLOCK
      ?AUTO_183 - BLOCK
      ?AUTO_184 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_177 ?AUTO_180 ) ( CLEAR ?AUTO_177 ) ( ON ?AUTO_179 ?AUTO_178 ) ( CLEAR ?AUTO_179 ) ( HOLDING ?AUTO_183 ) ( CLEAR ?AUTO_184 ) )
    :subtasks
    ( ( !STACK ?AUTO_183 ?AUTO_184 )
      ( MAKE-ON ?AUTO_177 ?AUTO_178 )
      ( MAKE-ON-VERIFY ?AUTO_177 ?AUTO_178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_195 - BLOCK
      ?AUTO_196 - BLOCK
    )
    :vars
    (
      ?AUTO_199 - BLOCK
      ?AUTO_197 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_199 ?AUTO_196 ) ( CLEAR ?AUTO_199 ) ( HOLDING ?AUTO_195 ) ( CLEAR ?AUTO_197 ) )
    :subtasks
    ( ( !STACK ?AUTO_195 ?AUTO_197 )
      ( MAKE-ON ?AUTO_195 ?AUTO_196 )
      ( MAKE-ON-VERIFY ?AUTO_195 ?AUTO_196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_207 - BLOCK
      ?AUTO_208 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_207 ) ( CLEAR ?AUTO_208 ) )
    :subtasks
    ( ( !STACK ?AUTO_207 ?AUTO_208 )
      ( MAKE-ON-VERIFY ?AUTO_207 ?AUTO_208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_211 - BLOCK
      ?AUTO_212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_212 ) ( ON-TABLE ?AUTO_211 ) ( CLEAR ?AUTO_211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_211 )
      ( MAKE-ON ?AUTO_211 ?AUTO_212 )
      ( MAKE-ON-VERIFY ?AUTO_211 ?AUTO_212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_216 - BLOCK
      ?AUTO_217 - BLOCK
    )
    :vars
    (
      ?AUTO_220 - BLOCK
      ?AUTO_221 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_217 ) ( ON-TABLE ?AUTO_216 ) ( CLEAR ?AUTO_216 ) ( HOLDING ?AUTO_220 ) ( CLEAR ?AUTO_221 ) )
    :subtasks
    ( ( !STACK ?AUTO_220 ?AUTO_221 )
      ( MAKE-ON ?AUTO_216 ?AUTO_217 )
      ( MAKE-ON-VERIFY ?AUTO_216 ?AUTO_217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_228 - BLOCK
      ?AUTO_229 - BLOCK
    )
    :vars
    (
      ?AUTO_230 - BLOCK
      ?AUTO_234 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_228 ?AUTO_230 ) ( CLEAR ?AUTO_228 ) ( HOLDING ?AUTO_229 ) ( CLEAR ?AUTO_234 ) )
    :subtasks
    ( ( !STACK ?AUTO_229 ?AUTO_234 )
      ( MAKE-ON ?AUTO_228 ?AUTO_229 )
      ( MAKE-ON-VERIFY ?AUTO_228 ?AUTO_229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_243 - BLOCK
      ?AUTO_244 - BLOCK
    )
    :vars
    (
      ?AUTO_246 - BLOCK
      ?AUTO_245 - BLOCK
      ?AUTO_250 - BLOCK
      ?AUTO_249 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_243 ?AUTO_246 ) ( CLEAR ?AUTO_243 ) ( ON ?AUTO_245 ?AUTO_244 ) ( CLEAR ?AUTO_250 ) ( ON ?AUTO_249 ?AUTO_245 ) ( CLEAR ?AUTO_249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_249 ?AUTO_245 )
      ( MAKE-ON ?AUTO_243 ?AUTO_244 )
      ( MAKE-ON-VERIFY ?AUTO_243 ?AUTO_244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_253 - BLOCK
      ?AUTO_254 - BLOCK
    )
    :vars
    (
      ?AUTO_258 - BLOCK
      ?AUTO_259 - BLOCK
      ?AUTO_260 - BLOCK
      ?AUTO_257 - BLOCK
      ?AUTO_261 - BLOCK
      ?AUTO_262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_253 ?AUTO_258 ) ( CLEAR ?AUTO_253 ) ( ON ?AUTO_259 ?AUTO_254 ) ( CLEAR ?AUTO_260 ) ( ON ?AUTO_257 ?AUTO_259 ) ( CLEAR ?AUTO_257 ) ( HOLDING ?AUTO_261 ) ( CLEAR ?AUTO_262 ) )
    :subtasks
    ( ( !STACK ?AUTO_261 ?AUTO_262 )
      ( MAKE-ON ?AUTO_253 ?AUTO_254 )
      ( MAKE-ON-VERIFY ?AUTO_253 ?AUTO_254 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_263 - BLOCK
      ?AUTO_264 - BLOCK
    )
    :vars
    (
      ?AUTO_267 - BLOCK
      ?AUTO_272 - BLOCK
      ?AUTO_268 - BLOCK
      ?AUTO_271 - BLOCK
      ?AUTO_266 - BLOCK
      ?AUTO_265 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_263 ?AUTO_267 ) ( CLEAR ?AUTO_263 ) ( ON ?AUTO_272 ?AUTO_264 ) ( CLEAR ?AUTO_268 ) ( ON ?AUTO_271 ?AUTO_272 ) ( CLEAR ?AUTO_266 ) ( ON ?AUTO_265 ?AUTO_271 ) ( CLEAR ?AUTO_265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_265 ?AUTO_271 )
      ( MAKE-ON ?AUTO_263 ?AUTO_264 )
      ( MAKE-ON-VERIFY ?AUTO_263 ?AUTO_264 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_277 - BLOCK
      ?AUTO_278 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_277 ) ( CLEAR ?AUTO_278 ) )
    :subtasks
    ( ( !STACK ?AUTO_277 ?AUTO_278 )
      ( MAKE-ON-VERIFY ?AUTO_277 ?AUTO_278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_281 - BLOCK
      ?AUTO_282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_282 ) ( ON-TABLE ?AUTO_281 ) ( CLEAR ?AUTO_281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_281 )
      ( MAKE-ON ?AUTO_281 ?AUTO_282 )
      ( MAKE-ON-VERIFY ?AUTO_281 ?AUTO_282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_286 - BLOCK
      ?AUTO_287 - BLOCK
    )
    :vars
    (
      ?AUTO_291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_286 ) ( CLEAR ?AUTO_286 ) ( HOLDING ?AUTO_287 ) ( CLEAR ?AUTO_291 ) )
    :subtasks
    ( ( !STACK ?AUTO_287 ?AUTO_291 )
      ( MAKE-ON ?AUTO_286 ?AUTO_287 )
      ( MAKE-ON-VERIFY ?AUTO_286 ?AUTO_287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_296 - BLOCK
      ?AUTO_297 - BLOCK
    )
    :vars
    (
      ?AUTO_298 - BLOCK
      ?AUTO_299 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_297 ) ( ON-TABLE ?AUTO_296 ) ( CLEAR ?AUTO_298 ) ( ON ?AUTO_299 ?AUTO_296 ) ( CLEAR ?AUTO_299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_299 ?AUTO_296 )
      ( MAKE-ON ?AUTO_296 ?AUTO_297 )
      ( MAKE-ON-VERIFY ?AUTO_296 ?AUTO_297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_304 - BLOCK
      ?AUTO_305 - BLOCK
    )
    :vars
    (
      ?AUTO_309 - BLOCK
      ?AUTO_308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_304 ) ( CLEAR ?AUTO_309 ) ( ON ?AUTO_308 ?AUTO_304 ) ( CLEAR ?AUTO_308 ) ( HOLDING ?AUTO_305 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_305 )
      ( MAKE-ON ?AUTO_304 ?AUTO_305 )
      ( MAKE-ON-VERIFY ?AUTO_304 ?AUTO_305 ) )
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
      ?AUTO_319 - BLOCK
      ?AUTO_320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_314 ) ( ON-TABLE ?AUTO_313 ) ( CLEAR ?AUTO_318 ) ( ON ?AUTO_317 ?AUTO_313 ) ( CLEAR ?AUTO_317 ) ( HOLDING ?AUTO_319 ) ( CLEAR ?AUTO_320 ) )
    :subtasks
    ( ( !STACK ?AUTO_319 ?AUTO_320 )
      ( MAKE-ON ?AUTO_313 ?AUTO_314 )
      ( MAKE-ON-VERIFY ?AUTO_313 ?AUTO_314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_323 - BLOCK
      ?AUTO_324 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_323 ) ( CLEAR ?AUTO_324 ) )
    :subtasks
    ( ( !STACK ?AUTO_323 ?AUTO_324 )
      ( MAKE-ON-VERIFY ?AUTO_323 ?AUTO_324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_327 - BLOCK
      ?AUTO_328 - BLOCK
    )
    :vars
    (
      ?AUTO_332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_328 ) ( ON ?AUTO_327 ?AUTO_332 ) ( CLEAR ?AUTO_327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_327 ?AUTO_332 )
      ( MAKE-ON ?AUTO_327 ?AUTO_328 )
      ( MAKE-ON-VERIFY ?AUTO_327 ?AUTO_328 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_335 - BLOCK
      ?AUTO_336 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_335 ) ( CLEAR ?AUTO_336 ) )
    :subtasks
    ( ( !STACK ?AUTO_335 ?AUTO_336 )
      ( MAKE-ON-VERIFY ?AUTO_335 ?AUTO_336 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_339 - BLOCK
      ?AUTO_340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_340 ) ( ON-TABLE ?AUTO_339 ) ( CLEAR ?AUTO_339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_339 )
      ( MAKE-ON ?AUTO_339 ?AUTO_340 )
      ( MAKE-ON-VERIFY ?AUTO_339 ?AUTO_340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_344 - BLOCK
      ?AUTO_345 - BLOCK
    )
    :vars
    (
      ?AUTO_348 - BLOCK
      ?AUTO_349 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_345 ) ( ON-TABLE ?AUTO_344 ) ( CLEAR ?AUTO_344 ) ( HOLDING ?AUTO_348 ) ( CLEAR ?AUTO_349 ) )
    :subtasks
    ( ( !STACK ?AUTO_348 ?AUTO_349 )
      ( MAKE-ON ?AUTO_344 ?AUTO_345 )
      ( MAKE-ON-VERIFY ?AUTO_344 ?AUTO_345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_350 - BLOCK
      ?AUTO_351 - BLOCK
    )
    :vars
    (
      ?AUTO_355 - BLOCK
      ?AUTO_354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_350 ) ( CLEAR ?AUTO_350 ) ( CLEAR ?AUTO_355 ) ( ON ?AUTO_354 ?AUTO_351 ) ( CLEAR ?AUTO_354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_354 ?AUTO_351 )
      ( MAKE-ON ?AUTO_350 ?AUTO_351 )
      ( MAKE-ON-VERIFY ?AUTO_350 ?AUTO_351 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_357 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_357 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_357 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_357 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_359 - BLOCK
    )
    :vars
    (
      ?AUTO_362 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_359 ?AUTO_362 ) ( CLEAR ?AUTO_359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_359 ?AUTO_362 )
      ( MAKE-ON-TABLE ?AUTO_359 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_359 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_364 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_364 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_364 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_364 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_366 - BLOCK
    )
    :vars
    (
      ?AUTO_369 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_366 ?AUTO_369 ) ( CLEAR ?AUTO_366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_366 ?AUTO_369 )
      ( MAKE-ON-TABLE ?AUTO_366 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_366 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_370 - BLOCK
    )
    :vars
    (
      ?AUTO_372 - BLOCK
      ?AUTO_373 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_370 ?AUTO_372 ) ( CLEAR ?AUTO_370 ) ( HOLDING ?AUTO_373 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_373 )
      ( MAKE-ON-TABLE ?AUTO_370 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_370 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_376 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_376 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_376 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_376 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_378 - BLOCK
    )
    :vars
    (
      ?AUTO_381 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_378 ?AUTO_381 ) ( CLEAR ?AUTO_378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_378 ?AUTO_381 )
      ( MAKE-ON-TABLE ?AUTO_378 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_378 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_382 - BLOCK
    )
    :vars
    (
      ?AUTO_384 - BLOCK
      ?AUTO_385 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_382 ?AUTO_384 ) ( CLEAR ?AUTO_382 ) ( HOLDING ?AUTO_385 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_385 )
      ( MAKE-ON-TABLE ?AUTO_382 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_382 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_386 - BLOCK
    )
    :vars
    (
      ?AUTO_387 - BLOCK
      ?AUTO_389 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_386 ?AUTO_387 ) ( ON ?AUTO_389 ?AUTO_386 ) ( CLEAR ?AUTO_389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_389 ?AUTO_386 )
      ( MAKE-ON-TABLE ?AUTO_386 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_386 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_392 - BLOCK
    )
    :vars
    (
      ?AUTO_395 - BLOCK
      ?AUTO_393 - BLOCK
      ?AUTO_396 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_392 ?AUTO_395 ) ( ON ?AUTO_393 ?AUTO_392 ) ( CLEAR ?AUTO_393 ) ( HOLDING ?AUTO_396 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_396 )
      ( MAKE-ON-TABLE ?AUTO_392 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_400 - BLOCK
      ?AUTO_401 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_400 ) ( CLEAR ?AUTO_401 ) )
    :subtasks
    ( ( !STACK ?AUTO_400 ?AUTO_401 )
      ( MAKE-ON-VERIFY ?AUTO_400 ?AUTO_401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_404 - BLOCK
      ?AUTO_405 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_405 ) ( ON-TABLE ?AUTO_404 ) ( CLEAR ?AUTO_404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_404 )
      ( MAKE-ON ?AUTO_404 ?AUTO_405 )
      ( MAKE-ON-VERIFY ?AUTO_404 ?AUTO_405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_409 - BLOCK
      ?AUTO_410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_409 ) ( CLEAR ?AUTO_409 ) ( HOLDING ?AUTO_410 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_410 )
      ( MAKE-ON ?AUTO_409 ?AUTO_410 )
      ( MAKE-ON-VERIFY ?AUTO_409 ?AUTO_410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_416 - BLOCK
      ?AUTO_417 - BLOCK
    )
    :vars
    (
      ?AUTO_420 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_417 ) ( ON-TABLE ?AUTO_416 ) ( CLEAR ?AUTO_416 ) ( HOLDING ?AUTO_420 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_420 )
      ( MAKE-ON ?AUTO_416 ?AUTO_417 )
      ( MAKE-ON-VERIFY ?AUTO_416 ?AUTO_417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_421 - BLOCK
      ?AUTO_422 - BLOCK
    )
    :vars
    (
      ?AUTO_425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_421 ) ( CLEAR ?AUTO_421 ) ( ON ?AUTO_425 ?AUTO_422 ) ( CLEAR ?AUTO_425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_425 ?AUTO_422 )
      ( MAKE-ON ?AUTO_421 ?AUTO_422 )
      ( MAKE-ON-VERIFY ?AUTO_421 ?AUTO_422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_428 - BLOCK
      ?AUTO_429 - BLOCK
    )
    :vars
    (
      ?AUTO_430 - BLOCK
      ?AUTO_433 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_428 ) ( CLEAR ?AUTO_428 ) ( ON ?AUTO_430 ?AUTO_429 ) ( CLEAR ?AUTO_430 ) ( HOLDING ?AUTO_433 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_433 )
      ( MAKE-ON ?AUTO_428 ?AUTO_429 )
      ( MAKE-ON-VERIFY ?AUTO_428 ?AUTO_429 ) )
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
      ?AUTO_454 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_448 ?AUTO_452 ) ( CLEAR ?AUTO_448 ) ( HOLDING ?AUTO_449 ) ( CLEAR ?AUTO_454 ) )
    :subtasks
    ( ( !STACK ?AUTO_449 ?AUTO_454 )
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
      ?AUTO_462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_458 ) ( ON ?AUTO_457 ?AUTO_461 ) ( CLEAR ?AUTO_457 ) ( HOLDING ?AUTO_462 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_462 )
      ( MAKE-ON ?AUTO_457 ?AUTO_458 )
      ( MAKE-ON-VERIFY ?AUTO_457 ?AUTO_458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_463 - BLOCK
      ?AUTO_464 - BLOCK
    )
    :vars
    (
      ?AUTO_467 - BLOCK
      ?AUTO_468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_464 ) ( ON ?AUTO_463 ?AUTO_467 ) ( ON ?AUTO_468 ?AUTO_463 ) ( CLEAR ?AUTO_468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_468 ?AUTO_463 )
      ( MAKE-ON ?AUTO_463 ?AUTO_464 )
      ( MAKE-ON-VERIFY ?AUTO_463 ?AUTO_464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_471 - BLOCK
      ?AUTO_472 - BLOCK
    )
    :vars
    (
      ?AUTO_473 - BLOCK
      ?AUTO_476 - BLOCK
      ?AUTO_477 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_472 ) ( ON ?AUTO_471 ?AUTO_473 ) ( ON ?AUTO_476 ?AUTO_471 ) ( CLEAR ?AUTO_476 ) ( HOLDING ?AUTO_477 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_477 )
      ( MAKE-ON ?AUTO_471 ?AUTO_472 )
      ( MAKE-ON-VERIFY ?AUTO_471 ?AUTO_472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_478 - BLOCK
      ?AUTO_479 - BLOCK
    )
    :vars
    (
      ?AUTO_480 - BLOCK
      ?AUTO_484 - BLOCK
      ?AUTO_483 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_479 ) ( ON ?AUTO_478 ?AUTO_480 ) ( ON ?AUTO_484 ?AUTO_478 ) ( ON ?AUTO_483 ?AUTO_484 ) ( CLEAR ?AUTO_483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_483 ?AUTO_484 )
      ( MAKE-ON ?AUTO_478 ?AUTO_479 )
      ( MAKE-ON-VERIFY ?AUTO_478 ?AUTO_479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_487 - BLOCK
      ?AUTO_488 - BLOCK
    )
    :vars
    (
      ?AUTO_491 - BLOCK
      ?AUTO_493 - BLOCK
      ?AUTO_490 - BLOCK
      ?AUTO_494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_488 ) ( ON ?AUTO_487 ?AUTO_491 ) ( ON ?AUTO_493 ?AUTO_487 ) ( ON ?AUTO_490 ?AUTO_493 ) ( CLEAR ?AUTO_490 ) ( HOLDING ?AUTO_494 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_494 )
      ( MAKE-ON ?AUTO_487 ?AUTO_488 )
      ( MAKE-ON-VERIFY ?AUTO_487 ?AUTO_488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_499 - BLOCK
      ?AUTO_500 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_499 ) ( CLEAR ?AUTO_500 ) )
    :subtasks
    ( ( !STACK ?AUTO_499 ?AUTO_500 )
      ( MAKE-ON-VERIFY ?AUTO_499 ?AUTO_500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_503 - BLOCK
      ?AUTO_504 - BLOCK
    )
    :vars
    (
      ?AUTO_508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_504 ) ( ON ?AUTO_503 ?AUTO_508 ) ( CLEAR ?AUTO_503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_503 ?AUTO_508 )
      ( MAKE-ON ?AUTO_503 ?AUTO_504 )
      ( MAKE-ON-VERIFY ?AUTO_503 ?AUTO_504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_509 - BLOCK
      ?AUTO_510 - BLOCK
    )
    :vars
    (
      ?AUTO_513 - BLOCK
      ?AUTO_514 - BLOCK
      ?AUTO_515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_510 ) ( ON ?AUTO_509 ?AUTO_513 ) ( CLEAR ?AUTO_509 ) ( HOLDING ?AUTO_514 ) ( CLEAR ?AUTO_515 ) )
    :subtasks
    ( ( !STACK ?AUTO_514 ?AUTO_515 )
      ( MAKE-ON ?AUTO_509 ?AUTO_510 )
      ( MAKE-ON-VERIFY ?AUTO_509 ?AUTO_510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_516 - BLOCK
      ?AUTO_517 - BLOCK
    )
    :vars
    (
      ?AUTO_520 - BLOCK
      ?AUTO_522 - BLOCK
      ?AUTO_521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_517 ) ( ON ?AUTO_516 ?AUTO_520 ) ( CLEAR ?AUTO_522 ) ( ON ?AUTO_521 ?AUTO_516 ) ( CLEAR ?AUTO_521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_521 ?AUTO_516 )
      ( MAKE-ON ?AUTO_516 ?AUTO_517 )
      ( MAKE-ON-VERIFY ?AUTO_516 ?AUTO_517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_525 - BLOCK
      ?AUTO_526 - BLOCK
    )
    :vars
    (
      ?AUTO_528 - BLOCK
      ?AUTO_527 - BLOCK
      ?AUTO_529 - BLOCK
      ?AUTO_533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_526 ) ( ON ?AUTO_525 ?AUTO_528 ) ( ON ?AUTO_527 ?AUTO_525 ) ( CLEAR ?AUTO_527 ) ( HOLDING ?AUTO_529 ) ( CLEAR ?AUTO_533 ) )
    :subtasks
    ( ( !STACK ?AUTO_529 ?AUTO_533 )
      ( MAKE-ON ?AUTO_525 ?AUTO_526 )
      ( MAKE-ON-VERIFY ?AUTO_525 ?AUTO_526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_538 - BLOCK
      ?AUTO_539 - BLOCK
    )
    :vars
    (
      ?AUTO_542 - BLOCK
      ?AUTO_540 - BLOCK
      ?AUTO_544 - BLOCK
      ?AUTO_545 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_539 ) ( ON ?AUTO_538 ?AUTO_542 ) ( ON ?AUTO_540 ?AUTO_538 ) ( CLEAR ?AUTO_544 ) ( ON ?AUTO_545 ?AUTO_540 ) ( CLEAR ?AUTO_545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_545 ?AUTO_540 )
      ( MAKE-ON ?AUTO_538 ?AUTO_539 )
      ( MAKE-ON-VERIFY ?AUTO_538 ?AUTO_539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_548 - BLOCK
      ?AUTO_549 - BLOCK
    )
    :vars
    (
      ?AUTO_552 - BLOCK
      ?AUTO_554 - BLOCK
      ?AUTO_555 - BLOCK
      ?AUTO_553 - BLOCK
      ?AUTO_556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_549 ) ( ON ?AUTO_548 ?AUTO_552 ) ( ON ?AUTO_554 ?AUTO_548 ) ( CLEAR ?AUTO_555 ) ( ON ?AUTO_553 ?AUTO_554 ) ( CLEAR ?AUTO_553 ) ( HOLDING ?AUTO_556 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_556 )
      ( MAKE-ON ?AUTO_548 ?AUTO_549 )
      ( MAKE-ON-VERIFY ?AUTO_548 ?AUTO_549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_557 - BLOCK
      ?AUTO_558 - BLOCK
    )
    :vars
    (
      ?AUTO_563 - BLOCK
      ?AUTO_560 - BLOCK
      ?AUTO_565 - BLOCK
      ?AUTO_564 - BLOCK
      ?AUTO_562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_558 ) ( ON ?AUTO_557 ?AUTO_563 ) ( ON ?AUTO_560 ?AUTO_557 ) ( CLEAR ?AUTO_565 ) ( ON ?AUTO_564 ?AUTO_560 ) ( ON ?AUTO_562 ?AUTO_564 ) ( CLEAR ?AUTO_562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_562 ?AUTO_564 )
      ( MAKE-ON ?AUTO_557 ?AUTO_558 )
      ( MAKE-ON-VERIFY ?AUTO_557 ?AUTO_558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_568 - BLOCK
      ?AUTO_569 - BLOCK
    )
    :vars
    (
      ?AUTO_573 - BLOCK
      ?AUTO_575 - BLOCK
      ?AUTO_574 - BLOCK
      ?AUTO_576 - BLOCK
      ?AUTO_570 - BLOCK
      ?AUTO_577 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_569 ) ( ON ?AUTO_568 ?AUTO_573 ) ( ON ?AUTO_575 ?AUTO_568 ) ( CLEAR ?AUTO_574 ) ( ON ?AUTO_576 ?AUTO_575 ) ( ON ?AUTO_570 ?AUTO_576 ) ( CLEAR ?AUTO_570 ) ( HOLDING ?AUTO_577 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_577 )
      ( MAKE-ON ?AUTO_568 ?AUTO_569 )
      ( MAKE-ON-VERIFY ?AUTO_568 ?AUTO_569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_578 - BLOCK
      ?AUTO_579 - BLOCK
    )
    :vars
    (
      ?AUTO_581 - BLOCK
      ?AUTO_582 - BLOCK
      ?AUTO_584 - BLOCK
      ?AUTO_580 - BLOCK
      ?AUTO_583 - BLOCK
      ?AUTO_585 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_578 ?AUTO_581 ) ( ON ?AUTO_582 ?AUTO_578 ) ( CLEAR ?AUTO_584 ) ( ON ?AUTO_580 ?AUTO_582 ) ( ON ?AUTO_583 ?AUTO_580 ) ( CLEAR ?AUTO_583 ) ( ON ?AUTO_585 ?AUTO_579 ) ( CLEAR ?AUTO_585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_585 ?AUTO_579 )
      ( MAKE-ON ?AUTO_578 ?AUTO_579 )
      ( MAKE-ON-VERIFY ?AUTO_578 ?AUTO_579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_592 - BLOCK
      ?AUTO_593 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_592 ) ( CLEAR ?AUTO_593 ) )
    :subtasks
    ( ( !STACK ?AUTO_592 ?AUTO_593 )
      ( MAKE-ON-VERIFY ?AUTO_592 ?AUTO_593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_596 - BLOCK
      ?AUTO_597 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_597 ) ( ON-TABLE ?AUTO_596 ) ( CLEAR ?AUTO_596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_596 )
      ( MAKE-ON ?AUTO_596 ?AUTO_597 )
      ( MAKE-ON-VERIFY ?AUTO_596 ?AUTO_597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_601 - BLOCK
      ?AUTO_602 - BLOCK
    )
    :vars
    (
      ?AUTO_605 - BLOCK
      ?AUTO_606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_602 ) ( ON-TABLE ?AUTO_601 ) ( CLEAR ?AUTO_601 ) ( HOLDING ?AUTO_605 ) ( CLEAR ?AUTO_606 ) )
    :subtasks
    ( ( !STACK ?AUTO_605 ?AUTO_606 )
      ( MAKE-ON ?AUTO_601 ?AUTO_602 )
      ( MAKE-ON-VERIFY ?AUTO_601 ?AUTO_602 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_607 - BLOCK
      ?AUTO_608 - BLOCK
    )
    :vars
    (
      ?AUTO_612 - BLOCK
      ?AUTO_611 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_608 ) ( ON-TABLE ?AUTO_607 ) ( CLEAR ?AUTO_612 ) ( ON ?AUTO_611 ?AUTO_607 ) ( CLEAR ?AUTO_611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_611 ?AUTO_607 )
      ( MAKE-ON ?AUTO_607 ?AUTO_608 )
      ( MAKE-ON-VERIFY ?AUTO_607 ?AUTO_608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_615 - BLOCK
      ?AUTO_616 - BLOCK
    )
    :vars
    (
      ?AUTO_617 - BLOCK
      ?AUTO_620 - BLOCK
      ?AUTO_621 - BLOCK
      ?AUTO_622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_616 ) ( ON-TABLE ?AUTO_615 ) ( CLEAR ?AUTO_617 ) ( ON ?AUTO_620 ?AUTO_615 ) ( CLEAR ?AUTO_620 ) ( HOLDING ?AUTO_621 ) ( CLEAR ?AUTO_622 ) )
    :subtasks
    ( ( !STACK ?AUTO_621 ?AUTO_622 )
      ( MAKE-ON ?AUTO_615 ?AUTO_616 )
      ( MAKE-ON-VERIFY ?AUTO_615 ?AUTO_616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_623 - BLOCK
      ?AUTO_624 - BLOCK
    )
    :vars
    (
      ?AUTO_627 - BLOCK
      ?AUTO_630 - BLOCK
      ?AUTO_625 - BLOCK
      ?AUTO_629 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_624 ) ( ON-TABLE ?AUTO_623 ) ( CLEAR ?AUTO_627 ) ( ON ?AUTO_630 ?AUTO_623 ) ( CLEAR ?AUTO_625 ) ( ON ?AUTO_629 ?AUTO_630 ) ( CLEAR ?AUTO_629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_629 ?AUTO_630 )
      ( MAKE-ON ?AUTO_623 ?AUTO_624 )
      ( MAKE-ON-VERIFY ?AUTO_623 ?AUTO_624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_633 - BLOCK
      ?AUTO_634 - BLOCK
    )
    :vars
    (
      ?AUTO_640 - BLOCK
      ?AUTO_637 - BLOCK
      ?AUTO_638 - BLOCK
      ?AUTO_639 - BLOCK
      ?AUTO_642 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_634 ) ( ON-TABLE ?AUTO_633 ) ( CLEAR ?AUTO_640 ) ( ON ?AUTO_637 ?AUTO_633 ) ( ON ?AUTO_638 ?AUTO_637 ) ( CLEAR ?AUTO_638 ) ( HOLDING ?AUTO_639 ) ( CLEAR ?AUTO_642 ) )
    :subtasks
    ( ( !STACK ?AUTO_639 ?AUTO_642 )
      ( MAKE-ON ?AUTO_633 ?AUTO_634 )
      ( MAKE-ON-VERIFY ?AUTO_633 ?AUTO_634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_647 - BLOCK
      ?AUTO_648 - BLOCK
    )
    :vars
    (
      ?AUTO_649 - BLOCK
      ?AUTO_655 - BLOCK
      ?AUTO_651 - BLOCK
      ?AUTO_650 - BLOCK
      ?AUTO_654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_648 ) ( ON-TABLE ?AUTO_647 ) ( CLEAR ?AUTO_649 ) ( ON ?AUTO_655 ?AUTO_647 ) ( ON ?AUTO_651 ?AUTO_655 ) ( CLEAR ?AUTO_650 ) ( ON ?AUTO_654 ?AUTO_651 ) ( CLEAR ?AUTO_654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_654 ?AUTO_651 )
      ( MAKE-ON ?AUTO_647 ?AUTO_648 )
      ( MAKE-ON-VERIFY ?AUTO_647 ?AUTO_648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_658 - BLOCK
      ?AUTO_659 - BLOCK
    )
    :vars
    (
      ?AUTO_664 - BLOCK
      ?AUTO_666 - BLOCK
      ?AUTO_665 - BLOCK
      ?AUTO_663 - BLOCK
      ?AUTO_662 - BLOCK
      ?AUTO_667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_659 ) ( ON-TABLE ?AUTO_658 ) ( CLEAR ?AUTO_664 ) ( ON ?AUTO_666 ?AUTO_658 ) ( ON ?AUTO_665 ?AUTO_666 ) ( CLEAR ?AUTO_663 ) ( ON ?AUTO_662 ?AUTO_665 ) ( CLEAR ?AUTO_662 ) ( HOLDING ?AUTO_667 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_667 )
      ( MAKE-ON ?AUTO_658 ?AUTO_659 )
      ( MAKE-ON-VERIFY ?AUTO_658 ?AUTO_659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_668 - BLOCK
      ?AUTO_669 - BLOCK
    )
    :vars
    (
      ?AUTO_673 - BLOCK
      ?AUTO_677 - BLOCK
      ?AUTO_671 - BLOCK
      ?AUTO_675 - BLOCK
      ?AUTO_674 - BLOCK
      ?AUTO_676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_669 ) ( ON-TABLE ?AUTO_668 ) ( CLEAR ?AUTO_673 ) ( ON ?AUTO_677 ?AUTO_668 ) ( ON ?AUTO_671 ?AUTO_677 ) ( CLEAR ?AUTO_675 ) ( ON ?AUTO_674 ?AUTO_671 ) ( ON ?AUTO_676 ?AUTO_674 ) ( CLEAR ?AUTO_676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_676 ?AUTO_674 )
      ( MAKE-ON ?AUTO_668 ?AUTO_669 )
      ( MAKE-ON-VERIFY ?AUTO_668 ?AUTO_669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_680 - BLOCK
      ?AUTO_681 - BLOCK
    )
    :vars
    (
      ?AUTO_682 - BLOCK
      ?AUTO_683 - BLOCK
      ?AUTO_688 - BLOCK
      ?AUTO_689 - BLOCK
      ?AUTO_686 - BLOCK
      ?AUTO_685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_680 ) ( CLEAR ?AUTO_682 ) ( ON ?AUTO_683 ?AUTO_680 ) ( ON ?AUTO_688 ?AUTO_683 ) ( CLEAR ?AUTO_689 ) ( ON ?AUTO_686 ?AUTO_688 ) ( ON ?AUTO_685 ?AUTO_686 ) ( CLEAR ?AUTO_685 ) ( HOLDING ?AUTO_681 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_681 )
      ( MAKE-ON ?AUTO_680 ?AUTO_681 )
      ( MAKE-ON-VERIFY ?AUTO_680 ?AUTO_681 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_694 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_694 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_694 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_694 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_696 - BLOCK
    )
    :vars
    (
      ?AUTO_699 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_696 ?AUTO_699 ) ( CLEAR ?AUTO_696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_696 ?AUTO_699 )
      ( MAKE-ON-TABLE ?AUTO_696 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_696 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_700 - BLOCK
    )
    :vars
    (
      ?AUTO_701 - BLOCK
      ?AUTO_703 - BLOCK
      ?AUTO_704 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_700 ?AUTO_701 ) ( CLEAR ?AUTO_700 ) ( HOLDING ?AUTO_703 ) ( CLEAR ?AUTO_704 ) )
    :subtasks
    ( ( !STACK ?AUTO_703 ?AUTO_704 )
      ( MAKE-ON-TABLE ?AUTO_700 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_700 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_713 - BLOCK
    )
    :vars
    (
      ?AUTO_716 - BLOCK
      ?AUTO_717 - BLOCK
      ?AUTO_715 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_713 ?AUTO_716 ) ( CLEAR ?AUTO_717 ) ( ON ?AUTO_715 ?AUTO_713 ) ( CLEAR ?AUTO_715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_715 ?AUTO_713 )
      ( MAKE-ON-TABLE ?AUTO_713 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_713 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_720 - BLOCK
    )
    :vars
    (
      ?AUTO_724 - BLOCK
      ?AUTO_723 - BLOCK
      ?AUTO_722 - BLOCK
      ?AUTO_725 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_720 ?AUTO_724 ) ( CLEAR ?AUTO_723 ) ( ON ?AUTO_722 ?AUTO_720 ) ( CLEAR ?AUTO_722 ) ( HOLDING ?AUTO_725 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_725 )
      ( MAKE-ON-TABLE ?AUTO_720 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_720 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_726 - BLOCK
    )
    :vars
    (
      ?AUTO_730 - BLOCK
      ?AUTO_731 - BLOCK
      ?AUTO_727 - BLOCK
      ?AUTO_729 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_726 ?AUTO_730 ) ( CLEAR ?AUTO_731 ) ( ON ?AUTO_727 ?AUTO_726 ) ( ON ?AUTO_729 ?AUTO_727 ) ( CLEAR ?AUTO_729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_729 ?AUTO_727 )
      ( MAKE-ON-TABLE ?AUTO_726 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_726 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_734 - BLOCK
    )
    :vars
    (
      ?AUTO_736 - BLOCK
      ?AUTO_739 - BLOCK
      ?AUTO_735 - BLOCK
      ?AUTO_737 - BLOCK
      ?AUTO_740 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_734 ?AUTO_736 ) ( CLEAR ?AUTO_739 ) ( ON ?AUTO_735 ?AUTO_734 ) ( ON ?AUTO_737 ?AUTO_735 ) ( CLEAR ?AUTO_737 ) ( HOLDING ?AUTO_740 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_740 )
      ( MAKE-ON-TABLE ?AUTO_734 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_744 - BLOCK
      ?AUTO_745 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_744 ) ( CLEAR ?AUTO_745 ) )
    :subtasks
    ( ( !STACK ?AUTO_744 ?AUTO_745 )
      ( MAKE-ON-VERIFY ?AUTO_744 ?AUTO_745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_748 - BLOCK
      ?AUTO_749 - BLOCK
    )
    :vars
    (
      ?AUTO_753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_749 ) ( ON ?AUTO_748 ?AUTO_753 ) ( CLEAR ?AUTO_748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_748 ?AUTO_753 )
      ( MAKE-ON ?AUTO_748 ?AUTO_749 )
      ( MAKE-ON-VERIFY ?AUTO_748 ?AUTO_749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_754 - BLOCK
      ?AUTO_755 - BLOCK
    )
    :vars
    (
      ?AUTO_758 - BLOCK
      ?AUTO_759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_755 ) ( ON ?AUTO_754 ?AUTO_758 ) ( CLEAR ?AUTO_754 ) ( HOLDING ?AUTO_759 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_759 )
      ( MAKE-ON ?AUTO_754 ?AUTO_755 )
      ( MAKE-ON-VERIFY ?AUTO_754 ?AUTO_755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_760 - BLOCK
      ?AUTO_761 - BLOCK
    )
    :vars
    (
      ?AUTO_764 - BLOCK
      ?AUTO_765 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_761 ) ( ON ?AUTO_760 ?AUTO_764 ) ( ON ?AUTO_765 ?AUTO_760 ) ( CLEAR ?AUTO_765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_765 ?AUTO_760 )
      ( MAKE-ON ?AUTO_760 ?AUTO_761 )
      ( MAKE-ON-VERIFY ?AUTO_760 ?AUTO_761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_768 - BLOCK
      ?AUTO_769 - BLOCK
    )
    :vars
    (
      ?AUTO_771 - BLOCK
      ?AUTO_770 - BLOCK
      ?AUTO_774 - BLOCK
      ?AUTO_775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_769 ) ( ON ?AUTO_768 ?AUTO_771 ) ( ON ?AUTO_770 ?AUTO_768 ) ( CLEAR ?AUTO_770 ) ( HOLDING ?AUTO_774 ) ( CLEAR ?AUTO_775 ) )
    :subtasks
    ( ( !STACK ?AUTO_774 ?AUTO_775 )
      ( MAKE-ON ?AUTO_768 ?AUTO_769 )
      ( MAKE-ON-VERIFY ?AUTO_768 ?AUTO_769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_778 - BLOCK
      ?AUTO_779 - BLOCK
    )
    :vars
    (
      ?AUTO_782 - BLOCK
      ?AUTO_780 - BLOCK
      ?AUTO_785 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_778 ?AUTO_782 ) ( ON ?AUTO_780 ?AUTO_778 ) ( CLEAR ?AUTO_780 ) ( HOLDING ?AUTO_779 ) ( CLEAR ?AUTO_785 ) )
    :subtasks
    ( ( !STACK ?AUTO_779 ?AUTO_785 )
      ( MAKE-ON ?AUTO_778 ?AUTO_779 )
      ( MAKE-ON-VERIFY ?AUTO_778 ?AUTO_779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_790 - BLOCK
      ?AUTO_791 - BLOCK
    )
    :vars
    (
      ?AUTO_795 - BLOCK
      ?AUTO_793 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_790 ?AUTO_795 ) ( CLEAR ?AUTO_790 ) ( ON ?AUTO_793 ?AUTO_791 ) ( CLEAR ?AUTO_793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_793 ?AUTO_791 )
      ( MAKE-ON ?AUTO_790 ?AUTO_791 )
      ( MAKE-ON-VERIFY ?AUTO_790 ?AUTO_791 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_798 - BLOCK
      ?AUTO_799 - BLOCK
    )
    :vars
    (
      ?AUTO_802 - BLOCK
      ?AUTO_803 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_802 ?AUTO_799 ) ( CLEAR ?AUTO_802 ) ( HOLDING ?AUTO_798 ) ( CLEAR ?AUTO_803 ) )
    :subtasks
    ( ( !STACK ?AUTO_798 ?AUTO_803 )
      ( MAKE-ON ?AUTO_798 ?AUTO_799 )
      ( MAKE-ON-VERIFY ?AUTO_798 ?AUTO_799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_806 - BLOCK
      ?AUTO_807 - BLOCK
    )
    :vars
    (
      ?AUTO_811 - BLOCK
      ?AUTO_810 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_811 ?AUTO_807 ) ( CLEAR ?AUTO_811 ) ( CLEAR ?AUTO_810 ) ( ON-TABLE ?AUTO_806 ) ( CLEAR ?AUTO_806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_806 )
      ( MAKE-ON ?AUTO_806 ?AUTO_807 )
      ( MAKE-ON-VERIFY ?AUTO_806 ?AUTO_807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_813 - BLOCK
      ?AUTO_814 - BLOCK
    )
    :vars
    (
      ?AUTO_815 - BLOCK
      ?AUTO_818 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_815 ?AUTO_814 ) ( CLEAR ?AUTO_815 ) ( ON-TABLE ?AUTO_813 ) ( CLEAR ?AUTO_813 ) ( HOLDING ?AUTO_818 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_818 )
      ( MAKE-ON ?AUTO_813 ?AUTO_814 )
      ( MAKE-ON-VERIFY ?AUTO_813 ?AUTO_814 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_820 - BLOCK
      ?AUTO_821 - BLOCK
    )
    :vars
    (
      ?AUTO_823 - BLOCK
      ?AUTO_824 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_823 ?AUTO_821 ) ( ON-TABLE ?AUTO_820 ) ( CLEAR ?AUTO_820 ) ( ON ?AUTO_824 ?AUTO_823 ) ( CLEAR ?AUTO_824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_824 ?AUTO_823 )
      ( MAKE-ON ?AUTO_820 ?AUTO_821 )
      ( MAKE-ON-VERIFY ?AUTO_820 ?AUTO_821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_828 - BLOCK
      ?AUTO_829 - BLOCK
    )
    :vars
    (
      ?AUTO_833 - BLOCK
      ?AUTO_831 - BLOCK
      ?AUTO_834 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_833 ?AUTO_829 ) ( ON-TABLE ?AUTO_828 ) ( CLEAR ?AUTO_828 ) ( ON ?AUTO_831 ?AUTO_833 ) ( CLEAR ?AUTO_831 ) ( HOLDING ?AUTO_834 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_834 )
      ( MAKE-ON ?AUTO_828 ?AUTO_829 )
      ( MAKE-ON-VERIFY ?AUTO_828 ?AUTO_829 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_835 - BLOCK
      ?AUTO_836 - BLOCK
    )
    :vars
    (
      ?AUTO_838 - BLOCK
      ?AUTO_837 - BLOCK
      ?AUTO_841 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_838 ?AUTO_836 ) ( ON-TABLE ?AUTO_835 ) ( CLEAR ?AUTO_835 ) ( ON ?AUTO_837 ?AUTO_838 ) ( ON ?AUTO_841 ?AUTO_837 ) ( CLEAR ?AUTO_841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_841 ?AUTO_837 )
      ( MAKE-ON ?AUTO_835 ?AUTO_836 )
      ( MAKE-ON-VERIFY ?AUTO_835 ?AUTO_836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_844 - BLOCK
      ?AUTO_845 - BLOCK
    )
    :vars
    (
      ?AUTO_849 - BLOCK
      ?AUTO_847 - BLOCK
      ?AUTO_846 - BLOCK
      ?AUTO_851 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_849 ?AUTO_845 ) ( ON-TABLE ?AUTO_844 ) ( CLEAR ?AUTO_844 ) ( ON ?AUTO_847 ?AUTO_849 ) ( ON ?AUTO_846 ?AUTO_847 ) ( CLEAR ?AUTO_846 ) ( HOLDING ?AUTO_851 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_851 )
      ( MAKE-ON ?AUTO_844 ?AUTO_845 )
      ( MAKE-ON-VERIFY ?AUTO_844 ?AUTO_845 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_856 - BLOCK
      ?AUTO_857 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_856 ) ( CLEAR ?AUTO_857 ) )
    :subtasks
    ( ( !STACK ?AUTO_856 ?AUTO_857 )
      ( MAKE-ON-VERIFY ?AUTO_856 ?AUTO_857 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_860 - BLOCK
      ?AUTO_861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_861 ) ( ON-TABLE ?AUTO_860 ) ( CLEAR ?AUTO_860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_860 )
      ( MAKE-ON ?AUTO_860 ?AUTO_861 )
      ( MAKE-ON-VERIFY ?AUTO_860 ?AUTO_861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_865 - BLOCK
      ?AUTO_866 - BLOCK
    )
    :vars
    (
      ?AUTO_869 - BLOCK
      ?AUTO_870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_866 ) ( ON-TABLE ?AUTO_865 ) ( CLEAR ?AUTO_865 ) ( HOLDING ?AUTO_869 ) ( CLEAR ?AUTO_870 ) )
    :subtasks
    ( ( !STACK ?AUTO_869 ?AUTO_870 )
      ( MAKE-ON ?AUTO_865 ?AUTO_866 )
      ( MAKE-ON-VERIFY ?AUTO_865 ?AUTO_866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_871 - BLOCK
      ?AUTO_872 - BLOCK
    )
    :vars
    (
      ?AUTO_876 - BLOCK
      ?AUTO_875 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_872 ) ( ON-TABLE ?AUTO_871 ) ( CLEAR ?AUTO_876 ) ( ON ?AUTO_875 ?AUTO_871 ) ( CLEAR ?AUTO_875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_875 ?AUTO_871 )
      ( MAKE-ON ?AUTO_871 ?AUTO_872 )
      ( MAKE-ON-VERIFY ?AUTO_871 ?AUTO_872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_879 - BLOCK
      ?AUTO_880 - BLOCK
    )
    :vars
    (
      ?AUTO_881 - BLOCK
      ?AUTO_884 - BLOCK
      ?AUTO_885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_880 ) ( ON-TABLE ?AUTO_879 ) ( CLEAR ?AUTO_881 ) ( ON ?AUTO_884 ?AUTO_879 ) ( CLEAR ?AUTO_884 ) ( HOLDING ?AUTO_885 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_885 )
      ( MAKE-ON ?AUTO_879 ?AUTO_880 )
      ( MAKE-ON-VERIFY ?AUTO_879 ?AUTO_880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_886 - BLOCK
      ?AUTO_887 - BLOCK
    )
    :vars
    (
      ?AUTO_889 - BLOCK
      ?AUTO_892 - BLOCK
      ?AUTO_891 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_887 ) ( ON-TABLE ?AUTO_886 ) ( CLEAR ?AUTO_889 ) ( ON ?AUTO_892 ?AUTO_886 ) ( ON ?AUTO_891 ?AUTO_892 ) ( CLEAR ?AUTO_891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_891 ?AUTO_892 )
      ( MAKE-ON ?AUTO_886 ?AUTO_887 )
      ( MAKE-ON-VERIFY ?AUTO_886 ?AUTO_887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_895 - BLOCK
      ?AUTO_896 - BLOCK
    )
    :vars
    (
      ?AUTO_897 - BLOCK
      ?AUTO_898 - BLOCK
      ?AUTO_901 - BLOCK
      ?AUTO_903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_895 ) ( CLEAR ?AUTO_897 ) ( ON ?AUTO_898 ?AUTO_895 ) ( ON ?AUTO_901 ?AUTO_898 ) ( CLEAR ?AUTO_901 ) ( HOLDING ?AUTO_896 ) ( CLEAR ?AUTO_903 ) )
    :subtasks
    ( ( !STACK ?AUTO_896 ?AUTO_903 )
      ( MAKE-ON ?AUTO_895 ?AUTO_896 )
      ( MAKE-ON-VERIFY ?AUTO_895 ?AUTO_896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_906 - BLOCK
      ?AUTO_907 - BLOCK
    )
    :vars
    (
      ?AUTO_911 - BLOCK
      ?AUTO_910 - BLOCK
      ?AUTO_912 - BLOCK
      ?AUTO_913 - BLOCK
      ?AUTO_914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_907 ) ( ON-TABLE ?AUTO_906 ) ( CLEAR ?AUTO_911 ) ( ON ?AUTO_910 ?AUTO_906 ) ( ON ?AUTO_912 ?AUTO_910 ) ( CLEAR ?AUTO_912 ) ( HOLDING ?AUTO_913 ) ( CLEAR ?AUTO_914 ) )
    :subtasks
    ( ( !STACK ?AUTO_913 ?AUTO_914 )
      ( MAKE-ON ?AUTO_906 ?AUTO_907 )
      ( MAKE-ON-VERIFY ?AUTO_906 ?AUTO_907 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_915 - BLOCK
      ?AUTO_916 - BLOCK
    )
    :vars
    (
      ?AUTO_920 - BLOCK
      ?AUTO_921 - BLOCK
      ?AUTO_919 - BLOCK
      ?AUTO_923 - BLOCK
      ?AUTO_922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_915 ) ( CLEAR ?AUTO_920 ) ( ON ?AUTO_921 ?AUTO_915 ) ( ON ?AUTO_919 ?AUTO_921 ) ( CLEAR ?AUTO_919 ) ( CLEAR ?AUTO_923 ) ( ON ?AUTO_922 ?AUTO_916 ) ( CLEAR ?AUTO_922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_922 ?AUTO_916 )
      ( MAKE-ON ?AUTO_915 ?AUTO_916 )
      ( MAKE-ON-VERIFY ?AUTO_915 ?AUTO_916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_926 - BLOCK
      ?AUTO_927 - BLOCK
    )
    :vars
    (
      ?AUTO_928 - BLOCK
      ?AUTO_929 - BLOCK
      ?AUTO_932 - BLOCK
      ?AUTO_933 - BLOCK
      ?AUTO_934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_926 ) ( CLEAR ?AUTO_928 ) ( ON ?AUTO_929 ?AUTO_926 ) ( CLEAR ?AUTO_932 ) ( ON ?AUTO_933 ?AUTO_927 ) ( CLEAR ?AUTO_933 ) ( HOLDING ?AUTO_934 ) ( CLEAR ?AUTO_929 ) )
    :subtasks
    ( ( !STACK ?AUTO_934 ?AUTO_929 )
      ( MAKE-ON ?AUTO_926 ?AUTO_927 )
      ( MAKE-ON-VERIFY ?AUTO_926 ?AUTO_927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_937 - BLOCK
      ?AUTO_938 - BLOCK
    )
    :vars
    (
      ?AUTO_944 - BLOCK
      ?AUTO_942 - BLOCK
      ?AUTO_939 - BLOCK
      ?AUTO_941 - BLOCK
      ?AUTO_940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_937 ) ( CLEAR ?AUTO_944 ) ( ON ?AUTO_942 ?AUTO_937 ) ( CLEAR ?AUTO_939 ) ( ON ?AUTO_941 ?AUTO_938 ) ( CLEAR ?AUTO_942 ) ( ON ?AUTO_940 ?AUTO_941 ) ( CLEAR ?AUTO_940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_940 ?AUTO_941 )
      ( MAKE-ON ?AUTO_937 ?AUTO_938 )
      ( MAKE-ON-VERIFY ?AUTO_937 ?AUTO_938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_948 - BLOCK
      ?AUTO_949 - BLOCK
    )
    :vars
    (
      ?AUTO_955 - BLOCK
      ?AUTO_953 - BLOCK
      ?AUTO_956 - BLOCK
      ?AUTO_954 - BLOCK
      ?AUTO_950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_948 ) ( CLEAR ?AUTO_955 ) ( CLEAR ?AUTO_953 ) ( ON ?AUTO_956 ?AUTO_949 ) ( ON ?AUTO_954 ?AUTO_956 ) ( CLEAR ?AUTO_954 ) ( HOLDING ?AUTO_950 ) ( CLEAR ?AUTO_948 ) )
    :subtasks
    ( ( !STACK ?AUTO_950 ?AUTO_948 )
      ( MAKE-ON ?AUTO_948 ?AUTO_949 )
      ( MAKE-ON-VERIFY ?AUTO_948 ?AUTO_949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_959 - BLOCK
      ?AUTO_960 - BLOCK
    )
    :vars
    (
      ?AUTO_961 - BLOCK
      ?AUTO_966 - BLOCK
      ?AUTO_963 - BLOCK
      ?AUTO_967 - BLOCK
      ?AUTO_962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_959 ) ( CLEAR ?AUTO_961 ) ( CLEAR ?AUTO_966 ) ( ON ?AUTO_963 ?AUTO_960 ) ( ON ?AUTO_967 ?AUTO_963 ) ( CLEAR ?AUTO_967 ) ( CLEAR ?AUTO_959 ) ( ON-TABLE ?AUTO_962 ) ( CLEAR ?AUTO_962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_962 )
      ( MAKE-ON ?AUTO_959 ?AUTO_960 )
      ( MAKE-ON-VERIFY ?AUTO_959 ?AUTO_960 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_969 - BLOCK
      ?AUTO_970 - BLOCK
    )
    :vars
    (
      ?AUTO_977 - BLOCK
      ?AUTO_971 - BLOCK
      ?AUTO_972 - BLOCK
      ?AUTO_975 - BLOCK
      ?AUTO_976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_977 ) ( CLEAR ?AUTO_971 ) ( ON ?AUTO_972 ?AUTO_970 ) ( ON ?AUTO_975 ?AUTO_972 ) ( CLEAR ?AUTO_975 ) ( ON-TABLE ?AUTO_976 ) ( CLEAR ?AUTO_976 ) ( HOLDING ?AUTO_969 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_969 )
      ( MAKE-ON ?AUTO_969 ?AUTO_970 )
      ( MAKE-ON-VERIFY ?AUTO_969 ?AUTO_970 ) )
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
      ?AUTO_984 - BLOCK
      ?AUTO_985 - BLOCK
      ?AUTO_987 - BLOCK
      ?AUTO_986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_982 ) ( CLEAR ?AUTO_984 ) ( ON ?AUTO_985 ?AUTO_980 ) ( ON ?AUTO_987 ?AUTO_985 ) ( ON-TABLE ?AUTO_986 ) ( CLEAR ?AUTO_986 ) ( ON ?AUTO_979 ?AUTO_987 ) ( CLEAR ?AUTO_979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_979 ?AUTO_987 )
      ( MAKE-ON ?AUTO_979 ?AUTO_980 )
      ( MAKE-ON-VERIFY ?AUTO_979 ?AUTO_980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_990 - BLOCK
      ?AUTO_991 - BLOCK
    )
    :vars
    (
      ?AUTO_998 - BLOCK
      ?AUTO_995 - BLOCK
      ?AUTO_994 - BLOCK
      ?AUTO_996 - BLOCK
      ?AUTO_997 - BLOCK
      ?AUTO_999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_998 ) ( CLEAR ?AUTO_995 ) ( ON ?AUTO_994 ?AUTO_991 ) ( ON ?AUTO_996 ?AUTO_994 ) ( ON-TABLE ?AUTO_997 ) ( CLEAR ?AUTO_997 ) ( ON ?AUTO_990 ?AUTO_996 ) ( CLEAR ?AUTO_990 ) ( HOLDING ?AUTO_999 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_999 )
      ( MAKE-ON ?AUTO_990 ?AUTO_991 )
      ( MAKE-ON-VERIFY ?AUTO_990 ?AUTO_991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1000 - BLOCK
      ?AUTO_1001 - BLOCK
    )
    :vars
    (
      ?AUTO_1005 - BLOCK
      ?AUTO_1007 - BLOCK
      ?AUTO_1002 - BLOCK
      ?AUTO_1009 - BLOCK
      ?AUTO_1006 - BLOCK
      ?AUTO_1008 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1005 ) ( CLEAR ?AUTO_1007 ) ( ON ?AUTO_1002 ?AUTO_1001 ) ( ON ?AUTO_1009 ?AUTO_1002 ) ( ON-TABLE ?AUTO_1006 ) ( CLEAR ?AUTO_1006 ) ( ON ?AUTO_1000 ?AUTO_1009 ) ( ON ?AUTO_1008 ?AUTO_1000 ) ( CLEAR ?AUTO_1008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1008 ?AUTO_1000 )
      ( MAKE-ON ?AUTO_1000 ?AUTO_1001 )
      ( MAKE-ON-VERIFY ?AUTO_1000 ?AUTO_1001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1012 - BLOCK
      ?AUTO_1013 - BLOCK
    )
    :vars
    (
      ?AUTO_1016 - BLOCK
      ?AUTO_1015 - BLOCK
      ?AUTO_1020 - BLOCK
      ?AUTO_1018 - BLOCK
      ?AUTO_1021 - BLOCK
      ?AUTO_1017 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1016 ) ( ON ?AUTO_1015 ?AUTO_1013 ) ( ON ?AUTO_1020 ?AUTO_1015 ) ( ON-TABLE ?AUTO_1018 ) ( CLEAR ?AUTO_1018 ) ( ON ?AUTO_1012 ?AUTO_1020 ) ( ON ?AUTO_1021 ?AUTO_1012 ) ( CLEAR ?AUTO_1021 ) ( HOLDING ?AUTO_1017 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1017 )
      ( MAKE-ON ?AUTO_1012 ?AUTO_1013 )
      ( MAKE-ON-VERIFY ?AUTO_1012 ?AUTO_1013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1027 - BLOCK
      ?AUTO_1028 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1027 ) ( CLEAR ?AUTO_1028 ) )
    :subtasks
    ( ( !STACK ?AUTO_1027 ?AUTO_1028 )
      ( MAKE-ON-VERIFY ?AUTO_1027 ?AUTO_1028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1031 - BLOCK
      ?AUTO_1032 - BLOCK
    )
    :vars
    (
      ?AUTO_1036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1032 ) ( ON ?AUTO_1031 ?AUTO_1036 ) ( CLEAR ?AUTO_1031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1031 ?AUTO_1036 )
      ( MAKE-ON ?AUTO_1031 ?AUTO_1032 )
      ( MAKE-ON-VERIFY ?AUTO_1031 ?AUTO_1032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1037 - BLOCK
      ?AUTO_1038 - BLOCK
    )
    :vars
    (
      ?AUTO_1041 - BLOCK
      ?AUTO_1043 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1037 ?AUTO_1041 ) ( CLEAR ?AUTO_1037 ) ( HOLDING ?AUTO_1038 ) ( CLEAR ?AUTO_1043 ) )
    :subtasks
    ( ( !STACK ?AUTO_1038 ?AUTO_1043 )
      ( MAKE-ON ?AUTO_1037 ?AUTO_1038 )
      ( MAKE-ON-VERIFY ?AUTO_1037 ?AUTO_1038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1161 - BLOCK
      ?AUTO_1162 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1161 ) ( CLEAR ?AUTO_1162 ) )
    :subtasks
    ( ( !STACK ?AUTO_1161 ?AUTO_1162 )
      ( MAKE-ON-VERIFY ?AUTO_1161 ?AUTO_1162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1165 - BLOCK
      ?AUTO_1166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1166 ) ( ON-TABLE ?AUTO_1165 ) ( CLEAR ?AUTO_1165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1165 )
      ( MAKE-ON ?AUTO_1165 ?AUTO_1166 )
      ( MAKE-ON-VERIFY ?AUTO_1165 ?AUTO_1166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1170 - BLOCK
      ?AUTO_1171 - BLOCK
    )
    :vars
    (
      ?AUTO_1175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1170 ) ( CLEAR ?AUTO_1170 ) ( HOLDING ?AUTO_1171 ) ( CLEAR ?AUTO_1175 ) )
    :subtasks
    ( ( !STACK ?AUTO_1171 ?AUTO_1175 )
      ( MAKE-ON ?AUTO_1170 ?AUTO_1171 )
      ( MAKE-ON-VERIFY ?AUTO_1170 ?AUTO_1171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1178 - BLOCK
      ?AUTO_1179 - BLOCK
    )
    :vars
    (
      ?AUTO_1182 - BLOCK
      ?AUTO_1183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1179 ) ( ON-TABLE ?AUTO_1178 ) ( CLEAR ?AUTO_1178 ) ( HOLDING ?AUTO_1182 ) ( CLEAR ?AUTO_1183 ) )
    :subtasks
    ( ( !STACK ?AUTO_1182 ?AUTO_1183 )
      ( MAKE-ON ?AUTO_1178 ?AUTO_1179 )
      ( MAKE-ON-VERIFY ?AUTO_1178 ?AUTO_1179 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1185 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1185 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1185 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1185 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1187 - BLOCK
    )
    :vars
    (
      ?AUTO_1190 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1187 ?AUTO_1190 ) ( CLEAR ?AUTO_1187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1187 ?AUTO_1190 )
      ( MAKE-ON-TABLE ?AUTO_1187 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1187 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1192 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1192 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1192 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1192 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1194 - BLOCK
    )
    :vars
    (
      ?AUTO_1197 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1194 ?AUTO_1197 ) ( CLEAR ?AUTO_1194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1194 ?AUTO_1197 )
      ( MAKE-ON-TABLE ?AUTO_1194 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1194 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1198 - BLOCK
    )
    :vars
    (
      ?AUTO_1200 - BLOCK
      ?AUTO_1201 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1198 ?AUTO_1200 ) ( CLEAR ?AUTO_1198 ) ( HOLDING ?AUTO_1201 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1201 )
      ( MAKE-ON-TABLE ?AUTO_1198 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1205 - BLOCK
      ?AUTO_1206 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1205 ) ( CLEAR ?AUTO_1206 ) )
    :subtasks
    ( ( !STACK ?AUTO_1205 ?AUTO_1206 )
      ( MAKE-ON-VERIFY ?AUTO_1205 ?AUTO_1206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1209 - BLOCK
      ?AUTO_1210 - BLOCK
    )
    :vars
    (
      ?AUTO_1214 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1210 ) ( ON ?AUTO_1209 ?AUTO_1214 ) ( CLEAR ?AUTO_1209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1209 ?AUTO_1214 )
      ( MAKE-ON ?AUTO_1209 ?AUTO_1210 )
      ( MAKE-ON-VERIFY ?AUTO_1209 ?AUTO_1210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1215 - BLOCK
      ?AUTO_1216 - BLOCK
    )
    :vars
    (
      ?AUTO_1219 - BLOCK
      ?AUTO_1220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1216 ) ( ON ?AUTO_1215 ?AUTO_1219 ) ( CLEAR ?AUTO_1215 ) ( HOLDING ?AUTO_1220 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1220 )
      ( MAKE-ON ?AUTO_1215 ?AUTO_1216 )
      ( MAKE-ON-VERIFY ?AUTO_1215 ?AUTO_1216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1221 - BLOCK
      ?AUTO_1222 - BLOCK
    )
    :vars
    (
      ?AUTO_1225 - BLOCK
      ?AUTO_1226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1222 ) ( ON ?AUTO_1221 ?AUTO_1225 ) ( ON ?AUTO_1226 ?AUTO_1221 ) ( CLEAR ?AUTO_1226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1226 ?AUTO_1221 )
      ( MAKE-ON ?AUTO_1221 ?AUTO_1222 )
      ( MAKE-ON-VERIFY ?AUTO_1221 ?AUTO_1222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1229 - BLOCK
      ?AUTO_1230 - BLOCK
    )
    :vars
    (
      ?AUTO_1231 - BLOCK
      ?AUTO_1234 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1229 ?AUTO_1231 ) ( ON ?AUTO_1234 ?AUTO_1229 ) ( CLEAR ?AUTO_1234 ) ( HOLDING ?AUTO_1230 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1230 )
      ( MAKE-ON ?AUTO_1229 ?AUTO_1230 )
      ( MAKE-ON-VERIFY ?AUTO_1229 ?AUTO_1230 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1239 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1239 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1239 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1239 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1241 - BLOCK
    )
    :vars
    (
      ?AUTO_1244 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1241 ?AUTO_1244 ) ( CLEAR ?AUTO_1241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1241 ?AUTO_1244 )
      ( MAKE-ON-TABLE ?AUTO_1241 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1241 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1245 - BLOCK
    )
    :vars
    (
      ?AUTO_1247 - BLOCK
      ?AUTO_1248 - BLOCK
      ?AUTO_1249 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1245 ?AUTO_1247 ) ( CLEAR ?AUTO_1245 ) ( HOLDING ?AUTO_1248 ) ( CLEAR ?AUTO_1249 ) )
    :subtasks
    ( ( !STACK ?AUTO_1248 ?AUTO_1249 )
      ( MAKE-ON-TABLE ?AUTO_1245 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1245 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1250 - BLOCK
    )
    :vars
    (
      ?AUTO_1252 - BLOCK
      ?AUTO_1254 - BLOCK
      ?AUTO_1253 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1250 ?AUTO_1252 ) ( CLEAR ?AUTO_1254 ) ( ON ?AUTO_1253 ?AUTO_1250 ) ( CLEAR ?AUTO_1253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1253 ?AUTO_1250 )
      ( MAKE-ON-TABLE ?AUTO_1250 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1250 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1257 - BLOCK
    )
    :vars
    (
      ?AUTO_1260 - BLOCK
      ?AUTO_1258 - BLOCK
      ?AUTO_1261 - BLOCK
      ?AUTO_1262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1257 ?AUTO_1260 ) ( CLEAR ?AUTO_1258 ) ( ON ?AUTO_1261 ?AUTO_1257 ) ( CLEAR ?AUTO_1261 ) ( HOLDING ?AUTO_1262 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1262 )
      ( MAKE-ON-TABLE ?AUTO_1257 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1257 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1263 - BLOCK
    )
    :vars
    (
      ?AUTO_1268 - BLOCK
      ?AUTO_1265 - BLOCK
      ?AUTO_1264 - BLOCK
      ?AUTO_1267 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1263 ?AUTO_1268 ) ( CLEAR ?AUTO_1265 ) ( ON ?AUTO_1264 ?AUTO_1263 ) ( ON ?AUTO_1267 ?AUTO_1264 ) ( CLEAR ?AUTO_1267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1267 ?AUTO_1264 )
      ( MAKE-ON-TABLE ?AUTO_1263 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1263 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1271 - BLOCK
    )
    :vars
    (
      ?AUTO_1276 - BLOCK
      ?AUTO_1272 - BLOCK
      ?AUTO_1274 - BLOCK
      ?AUTO_1273 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1271 ?AUTO_1276 ) ( ON ?AUTO_1272 ?AUTO_1271 ) ( ON ?AUTO_1274 ?AUTO_1272 ) ( CLEAR ?AUTO_1274 ) ( HOLDING ?AUTO_1273 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1273 )
      ( MAKE-ON-TABLE ?AUTO_1271 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1281 - BLOCK
      ?AUTO_1282 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1281 ) ( CLEAR ?AUTO_1282 ) )
    :subtasks
    ( ( !STACK ?AUTO_1281 ?AUTO_1282 )
      ( MAKE-ON-VERIFY ?AUTO_1281 ?AUTO_1282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1285 - BLOCK
      ?AUTO_1286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1286 ) ( ON-TABLE ?AUTO_1285 ) ( CLEAR ?AUTO_1285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1285 )
      ( MAKE-ON ?AUTO_1285 ?AUTO_1286 )
      ( MAKE-ON-VERIFY ?AUTO_1285 ?AUTO_1286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1290 - BLOCK
      ?AUTO_1291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1290 ) ( CLEAR ?AUTO_1290 ) ( HOLDING ?AUTO_1291 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1291 )
      ( MAKE-ON ?AUTO_1290 ?AUTO_1291 )
      ( MAKE-ON-VERIFY ?AUTO_1290 ?AUTO_1291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1295 - BLOCK
      ?AUTO_1296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1295 ) ( ON ?AUTO_1296 ?AUTO_1295 ) ( CLEAR ?AUTO_1296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1296 ?AUTO_1295 )
      ( MAKE-ON ?AUTO_1295 ?AUTO_1296 )
      ( MAKE-ON-VERIFY ?AUTO_1295 ?AUTO_1296 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1301 - BLOCK
      ?AUTO_1302 - BLOCK
    )
    :vars
    (
      ?AUTO_1305 - BLOCK
      ?AUTO_1306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1301 ) ( ON ?AUTO_1302 ?AUTO_1301 ) ( CLEAR ?AUTO_1302 ) ( HOLDING ?AUTO_1305 ) ( CLEAR ?AUTO_1306 ) )
    :subtasks
    ( ( !STACK ?AUTO_1305 ?AUTO_1306 )
      ( MAKE-ON ?AUTO_1301 ?AUTO_1302 )
      ( MAKE-ON-VERIFY ?AUTO_1301 ?AUTO_1302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1307 - BLOCK
      ?AUTO_1308 - BLOCK
    )
    :vars
    (
      ?AUTO_1312 - BLOCK
      ?AUTO_1311 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1307 ) ( ON ?AUTO_1308 ?AUTO_1307 ) ( CLEAR ?AUTO_1312 ) ( ON ?AUTO_1311 ?AUTO_1308 ) ( CLEAR ?AUTO_1311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1311 ?AUTO_1308 )
      ( MAKE-ON ?AUTO_1307 ?AUTO_1308 )
      ( MAKE-ON-VERIFY ?AUTO_1307 ?AUTO_1308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1315 - BLOCK
      ?AUTO_1316 - BLOCK
    )
    :vars
    (
      ?AUTO_1317 - BLOCK
      ?AUTO_1320 - BLOCK
      ?AUTO_1321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1315 ) ( ON ?AUTO_1316 ?AUTO_1315 ) ( CLEAR ?AUTO_1317 ) ( ON ?AUTO_1320 ?AUTO_1316 ) ( CLEAR ?AUTO_1320 ) ( HOLDING ?AUTO_1321 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1321 )
      ( MAKE-ON ?AUTO_1315 ?AUTO_1316 )
      ( MAKE-ON-VERIFY ?AUTO_1315 ?AUTO_1316 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1322 - BLOCK
      ?AUTO_1323 - BLOCK
    )
    :vars
    (
      ?AUTO_1326 - BLOCK
      ?AUTO_1325 - BLOCK
      ?AUTO_1328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1322 ) ( ON ?AUTO_1323 ?AUTO_1322 ) ( CLEAR ?AUTO_1326 ) ( ON ?AUTO_1325 ?AUTO_1323 ) ( ON ?AUTO_1328 ?AUTO_1325 ) ( CLEAR ?AUTO_1328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1328 ?AUTO_1325 )
      ( MAKE-ON ?AUTO_1322 ?AUTO_1323 )
      ( MAKE-ON-VERIFY ?AUTO_1322 ?AUTO_1323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1331 - BLOCK
      ?AUTO_1332 - BLOCK
    )
    :vars
    (
      ?AUTO_1335 - BLOCK
      ?AUTO_1334 - BLOCK
      ?AUTO_1337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1331 ) ( ON ?AUTO_1332 ?AUTO_1331 ) ( ON ?AUTO_1335 ?AUTO_1332 ) ( ON ?AUTO_1334 ?AUTO_1335 ) ( CLEAR ?AUTO_1334 ) ( HOLDING ?AUTO_1337 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1337 )
      ( MAKE-ON ?AUTO_1331 ?AUTO_1332 )
      ( MAKE-ON-VERIFY ?AUTO_1331 ?AUTO_1332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1343 - BLOCK
      ?AUTO_1344 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1343 ) ( CLEAR ?AUTO_1344 ) )
    :subtasks
    ( ( !STACK ?AUTO_1343 ?AUTO_1344 )
      ( MAKE-ON-VERIFY ?AUTO_1343 ?AUTO_1344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1347 - BLOCK
      ?AUTO_1348 - BLOCK
    )
    :vars
    (
      ?AUTO_1352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1348 ) ( ON ?AUTO_1347 ?AUTO_1352 ) ( CLEAR ?AUTO_1347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1347 ?AUTO_1352 )
      ( MAKE-ON ?AUTO_1347 ?AUTO_1348 )
      ( MAKE-ON-VERIFY ?AUTO_1347 ?AUTO_1348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1353 - BLOCK
      ?AUTO_1354 - BLOCK
    )
    :vars
    (
      ?AUTO_1357 - BLOCK
      ?AUTO_1359 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1353 ?AUTO_1357 ) ( CLEAR ?AUTO_1353 ) ( HOLDING ?AUTO_1354 ) ( CLEAR ?AUTO_1359 ) )
    :subtasks
    ( ( !STACK ?AUTO_1354 ?AUTO_1359 )
      ( MAKE-ON ?AUTO_1353 ?AUTO_1354 )
      ( MAKE-ON-VERIFY ?AUTO_1353 ?AUTO_1354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1362 - BLOCK
      ?AUTO_1363 - BLOCK
    )
    :vars
    (
      ?AUTO_1364 - BLOCK
      ?AUTO_1367 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1363 ) ( ON ?AUTO_1362 ?AUTO_1364 ) ( CLEAR ?AUTO_1362 ) ( HOLDING ?AUTO_1367 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1367 )
      ( MAKE-ON ?AUTO_1362 ?AUTO_1363 )
      ( MAKE-ON-VERIFY ?AUTO_1362 ?AUTO_1363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1368 - BLOCK
      ?AUTO_1369 - BLOCK
    )
    :vars
    (
      ?AUTO_1372 - BLOCK
      ?AUTO_1373 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1368 ?AUTO_1372 ) ( CLEAR ?AUTO_1368 ) ( ON ?AUTO_1373 ?AUTO_1369 ) ( CLEAR ?AUTO_1373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1373 ?AUTO_1369 )
      ( MAKE-ON ?AUTO_1368 ?AUTO_1369 )
      ( MAKE-ON-VERIFY ?AUTO_1368 ?AUTO_1369 ) )
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
      ?AUTO_1381 - BLOCK
      ?AUTO_1382 - BLOCK
      ?AUTO_1383 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1376 ?AUTO_1378 ) ( CLEAR ?AUTO_1376 ) ( ON ?AUTO_1381 ?AUTO_1377 ) ( CLEAR ?AUTO_1381 ) ( HOLDING ?AUTO_1382 ) ( CLEAR ?AUTO_1383 ) )
    :subtasks
    ( ( !STACK ?AUTO_1382 ?AUTO_1383 )
      ( MAKE-ON ?AUTO_1376 ?AUTO_1377 )
      ( MAKE-ON-VERIFY ?AUTO_1376 ?AUTO_1377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1384 - BLOCK
      ?AUTO_1385 - BLOCK
    )
    :vars
    (
      ?AUTO_1386 - BLOCK
      ?AUTO_1387 - BLOCK
      ?AUTO_1391 - BLOCK
      ?AUTO_1390 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1384 ?AUTO_1386 ) ( CLEAR ?AUTO_1384 ) ( ON ?AUTO_1387 ?AUTO_1385 ) ( CLEAR ?AUTO_1391 ) ( ON ?AUTO_1390 ?AUTO_1387 ) ( CLEAR ?AUTO_1390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1390 ?AUTO_1387 )
      ( MAKE-ON ?AUTO_1384 ?AUTO_1385 )
      ( MAKE-ON-VERIFY ?AUTO_1384 ?AUTO_1385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1394 - BLOCK
      ?AUTO_1395 - BLOCK
    )
    :vars
    (
      ?AUTO_1398 - BLOCK
      ?AUTO_1396 - BLOCK
      ?AUTO_1397 - BLOCK
      ?AUTO_1401 - BLOCK
      ?AUTO_1402 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1394 ?AUTO_1398 ) ( CLEAR ?AUTO_1394 ) ( ON ?AUTO_1396 ?AUTO_1395 ) ( CLEAR ?AUTO_1397 ) ( ON ?AUTO_1401 ?AUTO_1396 ) ( CLEAR ?AUTO_1401 ) ( HOLDING ?AUTO_1402 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1402 )
      ( MAKE-ON ?AUTO_1394 ?AUTO_1395 )
      ( MAKE-ON-VERIFY ?AUTO_1394 ?AUTO_1395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1403 - BLOCK
      ?AUTO_1404 - BLOCK
    )
    :vars
    (
      ?AUTO_1411 - BLOCK
      ?AUTO_1406 - BLOCK
      ?AUTO_1407 - BLOCK
      ?AUTO_1405 - BLOCK
      ?AUTO_1410 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1403 ?AUTO_1411 ) ( CLEAR ?AUTO_1403 ) ( ON ?AUTO_1406 ?AUTO_1404 ) ( CLEAR ?AUTO_1407 ) ( ON ?AUTO_1405 ?AUTO_1406 ) ( ON ?AUTO_1410 ?AUTO_1405 ) ( CLEAR ?AUTO_1410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1410 ?AUTO_1405 )
      ( MAKE-ON ?AUTO_1403 ?AUTO_1404 )
      ( MAKE-ON-VERIFY ?AUTO_1403 ?AUTO_1404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1414 - BLOCK
      ?AUTO_1415 - BLOCK
    )
    :vars
    (
      ?AUTO_1417 - BLOCK
      ?AUTO_1418 - BLOCK
      ?AUTO_1421 - BLOCK
      ?AUTO_1419 - BLOCK
      ?AUTO_1422 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1414 ?AUTO_1417 ) ( CLEAR ?AUTO_1414 ) ( ON ?AUTO_1418 ?AUTO_1415 ) ( ON ?AUTO_1421 ?AUTO_1418 ) ( ON ?AUTO_1419 ?AUTO_1421 ) ( CLEAR ?AUTO_1419 ) ( HOLDING ?AUTO_1422 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1422 )
      ( MAKE-ON ?AUTO_1414 ?AUTO_1415 )
      ( MAKE-ON-VERIFY ?AUTO_1414 ?AUTO_1415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1424 - BLOCK
      ?AUTO_1425 - BLOCK
    )
    :vars
    (
      ?AUTO_1428 - BLOCK
      ?AUTO_1429 - BLOCK
      ?AUTO_1426 - BLOCK
      ?AUTO_1427 - BLOCK
      ?AUTO_1432 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1424 ?AUTO_1428 ) ( ON ?AUTO_1429 ?AUTO_1425 ) ( ON ?AUTO_1426 ?AUTO_1429 ) ( ON ?AUTO_1427 ?AUTO_1426 ) ( CLEAR ?AUTO_1427 ) ( ON ?AUTO_1432 ?AUTO_1424 ) ( CLEAR ?AUTO_1432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1432 ?AUTO_1424 )
      ( MAKE-ON ?AUTO_1424 ?AUTO_1425 )
      ( MAKE-ON-VERIFY ?AUTO_1424 ?AUTO_1425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1437 - BLOCK
      ?AUTO_1438 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1437 ) ( CLEAR ?AUTO_1438 ) )
    :subtasks
    ( ( !STACK ?AUTO_1437 ?AUTO_1438 )
      ( MAKE-ON-VERIFY ?AUTO_1437 ?AUTO_1438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1441 - BLOCK
      ?AUTO_1442 - BLOCK
    )
    :vars
    (
      ?AUTO_1446 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1442 ) ( ON ?AUTO_1441 ?AUTO_1446 ) ( CLEAR ?AUTO_1441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1441 ?AUTO_1446 )
      ( MAKE-ON ?AUTO_1441 ?AUTO_1442 )
      ( MAKE-ON-VERIFY ?AUTO_1441 ?AUTO_1442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1447 - BLOCK
      ?AUTO_1448 - BLOCK
    )
    :vars
    (
      ?AUTO_1449 - BLOCK
      ?AUTO_1452 - BLOCK
      ?AUTO_1453 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1448 ) ( ON ?AUTO_1447 ?AUTO_1449 ) ( CLEAR ?AUTO_1447 ) ( HOLDING ?AUTO_1452 ) ( CLEAR ?AUTO_1453 ) )
    :subtasks
    ( ( !STACK ?AUTO_1452 ?AUTO_1453 )
      ( MAKE-ON ?AUTO_1447 ?AUTO_1448 )
      ( MAKE-ON-VERIFY ?AUTO_1447 ?AUTO_1448 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1454 - BLOCK
      ?AUTO_1455 - BLOCK
    )
    :vars
    (
      ?AUTO_1456 - BLOCK
      ?AUTO_1460 - BLOCK
      ?AUTO_1459 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1455 ) ( ON ?AUTO_1454 ?AUTO_1456 ) ( CLEAR ?AUTO_1460 ) ( ON ?AUTO_1459 ?AUTO_1454 ) ( CLEAR ?AUTO_1459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1459 ?AUTO_1454 )
      ( MAKE-ON ?AUTO_1454 ?AUTO_1455 )
      ( MAKE-ON-VERIFY ?AUTO_1454 ?AUTO_1455 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1463 - BLOCK
      ?AUTO_1464 - BLOCK
    )
    :vars
    (
      ?AUTO_1465 - BLOCK
      ?AUTO_1466 - BLOCK
      ?AUTO_1469 - BLOCK
      ?AUTO_1471 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1464 ) ( ON ?AUTO_1463 ?AUTO_1465 ) ( ON ?AUTO_1466 ?AUTO_1463 ) ( CLEAR ?AUTO_1466 ) ( HOLDING ?AUTO_1469 ) ( CLEAR ?AUTO_1471 ) )
    :subtasks
    ( ( !STACK ?AUTO_1469 ?AUTO_1471 )
      ( MAKE-ON ?AUTO_1463 ?AUTO_1464 )
      ( MAKE-ON-VERIFY ?AUTO_1463 ?AUTO_1464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1478 - BLOCK
      ?AUTO_1479 - BLOCK
    )
    :vars
    (
      ?AUTO_1481 - BLOCK
      ?AUTO_1484 - BLOCK
      ?AUTO_1480 - BLOCK
      ?AUTO_1486 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1478 ?AUTO_1481 ) ( CLEAR ?AUTO_1484 ) ( ON ?AUTO_1480 ?AUTO_1478 ) ( CLEAR ?AUTO_1480 ) ( HOLDING ?AUTO_1479 ) ( CLEAR ?AUTO_1486 ) )
    :subtasks
    ( ( !STACK ?AUTO_1479 ?AUTO_1486 )
      ( MAKE-ON ?AUTO_1478 ?AUTO_1479 )
      ( MAKE-ON-VERIFY ?AUTO_1478 ?AUTO_1479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1491 - BLOCK
      ?AUTO_1492 - BLOCK
    )
    :vars
    (
      ?AUTO_1496 - BLOCK
      ?AUTO_1494 - BLOCK
      ?AUTO_1497 - BLOCK
      ?AUTO_1498 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1491 ?AUTO_1496 ) ( ON ?AUTO_1494 ?AUTO_1491 ) ( CLEAR ?AUTO_1494 ) ( CLEAR ?AUTO_1497 ) ( ON ?AUTO_1498 ?AUTO_1492 ) ( CLEAR ?AUTO_1498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1498 ?AUTO_1492 )
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
      ?AUTO_1508 - BLOCK
      ?AUTO_1507 - BLOCK
      ?AUTO_1505 - BLOCK
      ?AUTO_1506 - BLOCK
      ?AUTO_1509 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1501 ?AUTO_1508 ) ( ON ?AUTO_1507 ?AUTO_1501 ) ( CLEAR ?AUTO_1507 ) ( CLEAR ?AUTO_1505 ) ( ON ?AUTO_1506 ?AUTO_1502 ) ( CLEAR ?AUTO_1506 ) ( HOLDING ?AUTO_1509 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1509 )
      ( MAKE-ON ?AUTO_1501 ?AUTO_1502 )
      ( MAKE-ON-VERIFY ?AUTO_1501 ?AUTO_1502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1510 - BLOCK
      ?AUTO_1511 - BLOCK
    )
    :vars
    (
      ?AUTO_1512 - BLOCK
      ?AUTO_1513 - BLOCK
      ?AUTO_1517 - BLOCK
      ?AUTO_1518 - BLOCK
      ?AUTO_1516 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1510 ?AUTO_1512 ) ( ON ?AUTO_1513 ?AUTO_1510 ) ( CLEAR ?AUTO_1517 ) ( ON ?AUTO_1518 ?AUTO_1511 ) ( CLEAR ?AUTO_1518 ) ( ON ?AUTO_1516 ?AUTO_1513 ) ( CLEAR ?AUTO_1516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1516 ?AUTO_1513 )
      ( MAKE-ON ?AUTO_1510 ?AUTO_1511 )
      ( MAKE-ON-VERIFY ?AUTO_1510 ?AUTO_1511 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1522 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1522 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1522 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1522 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1524 - BLOCK
    )
    :vars
    (
      ?AUTO_1527 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1524 ?AUTO_1527 ) ( CLEAR ?AUTO_1524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1524 ?AUTO_1527 )
      ( MAKE-ON-TABLE ?AUTO_1524 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1524 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1528 - BLOCK
    )
    :vars
    (
      ?AUTO_1530 - BLOCK
      ?AUTO_1531 - BLOCK
      ?AUTO_1532 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1528 ?AUTO_1530 ) ( CLEAR ?AUTO_1528 ) ( HOLDING ?AUTO_1531 ) ( CLEAR ?AUTO_1532 ) )
    :subtasks
    ( ( !STACK ?AUTO_1531 ?AUTO_1532 )
      ( MAKE-ON-TABLE ?AUTO_1528 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1528 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1533 - BLOCK
    )
    :vars
    (
      ?AUTO_1534 - BLOCK
      ?AUTO_1537 - BLOCK
      ?AUTO_1536 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1533 ?AUTO_1534 ) ( CLEAR ?AUTO_1537 ) ( ON ?AUTO_1536 ?AUTO_1533 ) ( CLEAR ?AUTO_1536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1536 ?AUTO_1533 )
      ( MAKE-ON-TABLE ?AUTO_1533 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1533 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1540 - BLOCK
    )
    :vars
    (
      ?AUTO_1541 - BLOCK
      ?AUTO_1542 - BLOCK
      ?AUTO_1544 - BLOCK
      ?AUTO_1545 - BLOCK
      ?AUTO_1546 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1540 ?AUTO_1541 ) ( CLEAR ?AUTO_1542 ) ( ON ?AUTO_1544 ?AUTO_1540 ) ( CLEAR ?AUTO_1544 ) ( HOLDING ?AUTO_1545 ) ( CLEAR ?AUTO_1546 ) )
    :subtasks
    ( ( !STACK ?AUTO_1545 ?AUTO_1546 )
      ( MAKE-ON-TABLE ?AUTO_1540 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1540 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1547 - BLOCK
    )
    :vars
    (
      ?AUTO_1549 - BLOCK
      ?AUTO_1550 - BLOCK
      ?AUTO_1548 - BLOCK
      ?AUTO_1553 - BLOCK
      ?AUTO_1552 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1547 ?AUTO_1549 ) ( CLEAR ?AUTO_1550 ) ( ON ?AUTO_1548 ?AUTO_1547 ) ( CLEAR ?AUTO_1553 ) ( ON ?AUTO_1552 ?AUTO_1548 ) ( CLEAR ?AUTO_1552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1552 ?AUTO_1548 )
      ( MAKE-ON-TABLE ?AUTO_1547 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1547 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1556 - BLOCK
    )
    :vars
    (
      ?AUTO_1561 - BLOCK
      ?AUTO_1562 - BLOCK
      ?AUTO_1557 - BLOCK
      ?AUTO_1559 - BLOCK
      ?AUTO_1558 - BLOCK
      ?AUTO_1564 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1556 ?AUTO_1561 ) ( CLEAR ?AUTO_1562 ) ( ON ?AUTO_1557 ?AUTO_1556 ) ( ON ?AUTO_1559 ?AUTO_1557 ) ( CLEAR ?AUTO_1559 ) ( HOLDING ?AUTO_1558 ) ( CLEAR ?AUTO_1564 ) )
    :subtasks
    ( ( !STACK ?AUTO_1558 ?AUTO_1564 )
      ( MAKE-ON-TABLE ?AUTO_1556 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1556 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1573 - BLOCK
    )
    :vars
    (
      ?AUTO_1575 - BLOCK
      ?AUTO_1576 - BLOCK
      ?AUTO_1579 - BLOCK
      ?AUTO_1574 - BLOCK
      ?AUTO_1578 - BLOCK
      ?AUTO_1577 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1573 ?AUTO_1575 ) ( CLEAR ?AUTO_1576 ) ( ON ?AUTO_1579 ?AUTO_1573 ) ( ON ?AUTO_1574 ?AUTO_1579 ) ( CLEAR ?AUTO_1578 ) ( ON ?AUTO_1577 ?AUTO_1574 ) ( CLEAR ?AUTO_1577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1577 ?AUTO_1574 )
      ( MAKE-ON-TABLE ?AUTO_1573 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1573 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1585 - BLOCK
      ?AUTO_1586 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1585 ) ( CLEAR ?AUTO_1586 ) )
    :subtasks
    ( ( !STACK ?AUTO_1585 ?AUTO_1586 )
      ( MAKE-ON-VERIFY ?AUTO_1585 ?AUTO_1586 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1589 - BLOCK
      ?AUTO_1590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1590 ) ( ON-TABLE ?AUTO_1589 ) ( CLEAR ?AUTO_1589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1589 )
      ( MAKE-ON ?AUTO_1589 ?AUTO_1590 )
      ( MAKE-ON-VERIFY ?AUTO_1589 ?AUTO_1590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1594 - BLOCK
      ?AUTO_1595 - BLOCK
    )
    :vars
    (
      ?AUTO_1598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1595 ) ( ON-TABLE ?AUTO_1594 ) ( CLEAR ?AUTO_1594 ) ( HOLDING ?AUTO_1598 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1598 )
      ( MAKE-ON ?AUTO_1594 ?AUTO_1595 )
      ( MAKE-ON-VERIFY ?AUTO_1594 ?AUTO_1595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1599 - BLOCK
      ?AUTO_1600 - BLOCK
    )
    :vars
    (
      ?AUTO_1603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1599 ) ( CLEAR ?AUTO_1599 ) ( ON ?AUTO_1603 ?AUTO_1600 ) ( CLEAR ?AUTO_1603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1603 ?AUTO_1600 )
      ( MAKE-ON ?AUTO_1599 ?AUTO_1600 )
      ( MAKE-ON-VERIFY ?AUTO_1599 ?AUTO_1600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1606 - BLOCK
      ?AUTO_1607 - BLOCK
    )
    :vars
    (
      ?AUTO_1610 - BLOCK
      ?AUTO_1611 - BLOCK
      ?AUTO_1612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1606 ) ( CLEAR ?AUTO_1606 ) ( ON ?AUTO_1610 ?AUTO_1607 ) ( CLEAR ?AUTO_1610 ) ( HOLDING ?AUTO_1611 ) ( CLEAR ?AUTO_1612 ) )
    :subtasks
    ( ( !STACK ?AUTO_1611 ?AUTO_1612 )
      ( MAKE-ON ?AUTO_1606 ?AUTO_1607 )
      ( MAKE-ON-VERIFY ?AUTO_1606 ?AUTO_1607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1613 - BLOCK
      ?AUTO_1614 - BLOCK
    )
    :vars
    (
      ?AUTO_1615 - BLOCK
      ?AUTO_1619 - BLOCK
      ?AUTO_1618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1613 ) ( CLEAR ?AUTO_1613 ) ( ON ?AUTO_1615 ?AUTO_1614 ) ( CLEAR ?AUTO_1619 ) ( ON ?AUTO_1618 ?AUTO_1615 ) ( CLEAR ?AUTO_1618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1618 ?AUTO_1615 )
      ( MAKE-ON ?AUTO_1613 ?AUTO_1614 )
      ( MAKE-ON-VERIFY ?AUTO_1613 ?AUTO_1614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1622 - BLOCK
      ?AUTO_1623 - BLOCK
    )
    :vars
    (
      ?AUTO_1625 - BLOCK
      ?AUTO_1628 - BLOCK
      ?AUTO_1624 - BLOCK
      ?AUTO_1629 - BLOCK
      ?AUTO_1630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1622 ) ( CLEAR ?AUTO_1622 ) ( ON ?AUTO_1625 ?AUTO_1623 ) ( CLEAR ?AUTO_1628 ) ( ON ?AUTO_1624 ?AUTO_1625 ) ( CLEAR ?AUTO_1624 ) ( HOLDING ?AUTO_1629 ) ( CLEAR ?AUTO_1630 ) )
    :subtasks
    ( ( !STACK ?AUTO_1629 ?AUTO_1630 )
      ( MAKE-ON ?AUTO_1622 ?AUTO_1623 )
      ( MAKE-ON-VERIFY ?AUTO_1622 ?AUTO_1623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1631 - BLOCK
      ?AUTO_1632 - BLOCK
    )
    :vars
    (
      ?AUTO_1634 - BLOCK
      ?AUTO_1633 - BLOCK
      ?AUTO_1635 - BLOCK
      ?AUTO_1637 - BLOCK
      ?AUTO_1636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1631 ) ( CLEAR ?AUTO_1631 ) ( ON ?AUTO_1634 ?AUTO_1632 ) ( CLEAR ?AUTO_1633 ) ( ON ?AUTO_1635 ?AUTO_1634 ) ( CLEAR ?AUTO_1637 ) ( ON ?AUTO_1636 ?AUTO_1635 ) ( CLEAR ?AUTO_1636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1636 ?AUTO_1635 )
      ( MAKE-ON ?AUTO_1631 ?AUTO_1632 )
      ( MAKE-ON-VERIFY ?AUTO_1631 ?AUTO_1632 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1642 - BLOCK
      ?AUTO_1643 - BLOCK
    )
    :vars
    (
      ?AUTO_1647 - BLOCK
      ?AUTO_1648 - BLOCK
      ?AUTO_1650 - BLOCK
      ?AUTO_1646 - BLOCK
      ?AUTO_1649 - BLOCK
      ?AUTO_1652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1642 ) ( CLEAR ?AUTO_1642 ) ( ON ?AUTO_1647 ?AUTO_1643 ) ( CLEAR ?AUTO_1648 ) ( ON ?AUTO_1650 ?AUTO_1647 ) ( ON ?AUTO_1646 ?AUTO_1650 ) ( CLEAR ?AUTO_1646 ) ( HOLDING ?AUTO_1649 ) ( CLEAR ?AUTO_1652 ) )
    :subtasks
    ( ( !STACK ?AUTO_1649 ?AUTO_1652 )
      ( MAKE-ON ?AUTO_1642 ?AUTO_1643 )
      ( MAKE-ON-VERIFY ?AUTO_1642 ?AUTO_1643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1663 - BLOCK
      ?AUTO_1664 - BLOCK
    )
    :vars
    (
      ?AUTO_1665 - BLOCK
      ?AUTO_1669 - BLOCK
      ?AUTO_1671 - BLOCK
      ?AUTO_1666 - BLOCK
      ?AUTO_1667 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1665 ?AUTO_1664 ) ( CLEAR ?AUTO_1669 ) ( ON ?AUTO_1671 ?AUTO_1665 ) ( CLEAR ?AUTO_1666 ) ( ON ?AUTO_1667 ?AUTO_1671 ) ( CLEAR ?AUTO_1667 ) ( HOLDING ?AUTO_1663 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1663 )
      ( MAKE-ON ?AUTO_1663 ?AUTO_1664 )
      ( MAKE-ON-VERIFY ?AUTO_1663 ?AUTO_1664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1677 - BLOCK
      ?AUTO_1678 - BLOCK
    )
    :vars
    (
      ?AUTO_1684 - BLOCK
      ?AUTO_1683 - BLOCK
      ?AUTO_1679 - BLOCK
      ?AUTO_1682 - BLOCK
      ?AUTO_1685 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1677 ?AUTO_1684 ) ( CLEAR ?AUTO_1677 ) ( ON ?AUTO_1683 ?AUTO_1678 ) ( ON ?AUTO_1679 ?AUTO_1683 ) ( ON ?AUTO_1682 ?AUTO_1679 ) ( ON ?AUTO_1685 ?AUTO_1682 ) ( CLEAR ?AUTO_1685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1685 ?AUTO_1682 )
      ( MAKE-ON ?AUTO_1677 ?AUTO_1678 )
      ( MAKE-ON-VERIFY ?AUTO_1677 ?AUTO_1678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1690 - BLOCK
      ?AUTO_1691 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1690 ) ( CLEAR ?AUTO_1691 ) )
    :subtasks
    ( ( !STACK ?AUTO_1690 ?AUTO_1691 )
      ( MAKE-ON-VERIFY ?AUTO_1690 ?AUTO_1691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1694 - BLOCK
      ?AUTO_1695 - BLOCK
    )
    :vars
    (
      ?AUTO_1699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1695 ) ( ON ?AUTO_1694 ?AUTO_1699 ) ( CLEAR ?AUTO_1694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1694 ?AUTO_1699 )
      ( MAKE-ON ?AUTO_1694 ?AUTO_1695 )
      ( MAKE-ON-VERIFY ?AUTO_1694 ?AUTO_1695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1700 - BLOCK
      ?AUTO_1701 - BLOCK
    )
    :vars
    (
      ?AUTO_1702 - BLOCK
      ?AUTO_1705 - BLOCK
      ?AUTO_1706 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1701 ) ( ON ?AUTO_1700 ?AUTO_1702 ) ( CLEAR ?AUTO_1700 ) ( HOLDING ?AUTO_1705 ) ( CLEAR ?AUTO_1706 ) )
    :subtasks
    ( ( !STACK ?AUTO_1705 ?AUTO_1706 )
      ( MAKE-ON ?AUTO_1700 ?AUTO_1701 )
      ( MAKE-ON-VERIFY ?AUTO_1700 ?AUTO_1701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1709 - BLOCK
      ?AUTO_1710 - BLOCK
    )
    :vars
    (
      ?AUTO_1713 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1709 ?AUTO_1713 ) ( CLEAR ?AUTO_1709 ) ( HOLDING ?AUTO_1710 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1710 )
      ( MAKE-ON ?AUTO_1709 ?AUTO_1710 )
      ( MAKE-ON-VERIFY ?AUTO_1709 ?AUTO_1710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1719 - BLOCK
      ?AUTO_1720 - BLOCK
    )
    :vars
    (
      ?AUTO_1721 - BLOCK
      ?AUTO_1722 - BLOCK
      ?AUTO_1724 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1719 ?AUTO_1721 ) ( CLEAR ?AUTO_1719 ) ( CLEAR ?AUTO_1722 ) ( ON ?AUTO_1724 ?AUTO_1720 ) ( CLEAR ?AUTO_1724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1724 ?AUTO_1720 )
      ( MAKE-ON ?AUTO_1719 ?AUTO_1720 )
      ( MAKE-ON-VERIFY ?AUTO_1719 ?AUTO_1720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1728 - BLOCK
      ?AUTO_1729 - BLOCK
    )
    :vars
    (
      ?AUTO_1732 - BLOCK
      ?AUTO_1734 - BLOCK
      ?AUTO_1733 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1732 ) ( ON ?AUTO_1734 ?AUTO_1729 ) ( CLEAR ?AUTO_1734 ) ( HOLDING ?AUTO_1728 ) ( CLEAR ?AUTO_1733 ) )
    :subtasks
    ( ( !STACK ?AUTO_1728 ?AUTO_1733 )
      ( MAKE-ON ?AUTO_1728 ?AUTO_1729 )
      ( MAKE-ON-VERIFY ?AUTO_1728 ?AUTO_1729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1737 - BLOCK
      ?AUTO_1738 - BLOCK
    )
    :vars
    (
      ?AUTO_1742 - BLOCK
      ?AUTO_1739 - BLOCK
      ?AUTO_1743 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1742 ) ( ON ?AUTO_1739 ?AUTO_1738 ) ( CLEAR ?AUTO_1743 ) ( ON ?AUTO_1737 ?AUTO_1739 ) ( CLEAR ?AUTO_1737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1737 ?AUTO_1739 )
      ( MAKE-ON ?AUTO_1737 ?AUTO_1738 )
      ( MAKE-ON-VERIFY ?AUTO_1737 ?AUTO_1738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1746 - BLOCK
      ?AUTO_1747 - BLOCK
    )
    :vars
    (
      ?AUTO_1751 - BLOCK
      ?AUTO_1750 - BLOCK
      ?AUTO_1752 - BLOCK
      ?AUTO_1754 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1751 ) ( ON ?AUTO_1750 ?AUTO_1747 ) ( ON ?AUTO_1746 ?AUTO_1750 ) ( CLEAR ?AUTO_1746 ) ( HOLDING ?AUTO_1752 ) ( CLEAR ?AUTO_1754 ) )
    :subtasks
    ( ( !STACK ?AUTO_1752 ?AUTO_1754 )
      ( MAKE-ON ?AUTO_1746 ?AUTO_1747 )
      ( MAKE-ON-VERIFY ?AUTO_1746 ?AUTO_1747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1775 - BLOCK
      ?AUTO_1776 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1775 ) ( CLEAR ?AUTO_1776 ) )
    :subtasks
    ( ( !STACK ?AUTO_1775 ?AUTO_1776 )
      ( MAKE-ON-VERIFY ?AUTO_1775 ?AUTO_1776 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1779 - BLOCK
      ?AUTO_1780 - BLOCK
    )
    :vars
    (
      ?AUTO_1784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1780 ) ( ON ?AUTO_1779 ?AUTO_1784 ) ( CLEAR ?AUTO_1779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1779 ?AUTO_1784 )
      ( MAKE-ON ?AUTO_1779 ?AUTO_1780 )
      ( MAKE-ON-VERIFY ?AUTO_1779 ?AUTO_1780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1785 - BLOCK
      ?AUTO_1786 - BLOCK
    )
    :vars
    (
      ?AUTO_1789 - BLOCK
      ?AUTO_1790 - BLOCK
      ?AUTO_1791 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1786 ) ( ON ?AUTO_1785 ?AUTO_1789 ) ( CLEAR ?AUTO_1785 ) ( HOLDING ?AUTO_1790 ) ( CLEAR ?AUTO_1791 ) )
    :subtasks
    ( ( !STACK ?AUTO_1790 ?AUTO_1791 )
      ( MAKE-ON ?AUTO_1785 ?AUTO_1786 )
      ( MAKE-ON-VERIFY ?AUTO_1785 ?AUTO_1786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1792 - BLOCK
      ?AUTO_1793 - BLOCK
    )
    :vars
    (
      ?AUTO_1796 - BLOCK
      ?AUTO_1798 - BLOCK
      ?AUTO_1797 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1793 ) ( ON ?AUTO_1792 ?AUTO_1796 ) ( CLEAR ?AUTO_1798 ) ( ON ?AUTO_1797 ?AUTO_1792 ) ( CLEAR ?AUTO_1797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1797 ?AUTO_1792 )
      ( MAKE-ON ?AUTO_1792 ?AUTO_1793 )
      ( MAKE-ON-VERIFY ?AUTO_1792 ?AUTO_1793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1801 - BLOCK
      ?AUTO_1802 - BLOCK
    )
    :vars
    (
      ?AUTO_1805 - BLOCK
      ?AUTO_1803 - BLOCK
      ?AUTO_1804 - BLOCK
      ?AUTO_1809 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1801 ?AUTO_1805 ) ( CLEAR ?AUTO_1803 ) ( ON ?AUTO_1804 ?AUTO_1801 ) ( CLEAR ?AUTO_1804 ) ( HOLDING ?AUTO_1802 ) ( CLEAR ?AUTO_1809 ) )
    :subtasks
    ( ( !STACK ?AUTO_1802 ?AUTO_1809 )
      ( MAKE-ON ?AUTO_1801 ?AUTO_1802 )
      ( MAKE-ON-VERIFY ?AUTO_1801 ?AUTO_1802 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1812 - BLOCK
      ?AUTO_1813 - BLOCK
    )
    :vars
    (
      ?AUTO_1817 - BLOCK
      ?AUTO_1814 - BLOCK
      ?AUTO_1815 - BLOCK
      ?AUTO_1819 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1813 ) ( ON ?AUTO_1812 ?AUTO_1817 ) ( CLEAR ?AUTO_1814 ) ( ON ?AUTO_1815 ?AUTO_1812 ) ( CLEAR ?AUTO_1815 ) ( HOLDING ?AUTO_1819 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1819 )
      ( MAKE-ON ?AUTO_1812 ?AUTO_1813 )
      ( MAKE-ON-VERIFY ?AUTO_1812 ?AUTO_1813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1836 - BLOCK
      ?AUTO_1837 - BLOCK
    )
    :vars
    (
      ?AUTO_1839 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1837 ) ( ON-TABLE ?AUTO_1836 ) ( ON ?AUTO_1839 ?AUTO_1836 ) ( CLEAR ?AUTO_1839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1839 ?AUTO_1836 )
      ( MAKE-ON ?AUTO_1836 ?AUTO_1837 )
      ( MAKE-ON-VERIFY ?AUTO_1836 ?AUTO_1837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1843 - BLOCK
      ?AUTO_1844 - BLOCK
    )
    :vars
    (
      ?AUTO_1847 - BLOCK
      ?AUTO_1848 - BLOCK
      ?AUTO_1849 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1844 ) ( ON-TABLE ?AUTO_1843 ) ( ON ?AUTO_1847 ?AUTO_1843 ) ( CLEAR ?AUTO_1847 ) ( HOLDING ?AUTO_1848 ) ( CLEAR ?AUTO_1849 ) )
    :subtasks
    ( ( !STACK ?AUTO_1848 ?AUTO_1849 )
      ( MAKE-ON ?AUTO_1843 ?AUTO_1844 )
      ( MAKE-ON-VERIFY ?AUTO_1843 ?AUTO_1844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1850 - BLOCK
      ?AUTO_1851 - BLOCK
    )
    :vars
    (
      ?AUTO_1854 - BLOCK
      ?AUTO_1856 - BLOCK
      ?AUTO_1855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1851 ) ( ON-TABLE ?AUTO_1850 ) ( ON ?AUTO_1854 ?AUTO_1850 ) ( CLEAR ?AUTO_1856 ) ( ON ?AUTO_1855 ?AUTO_1854 ) ( CLEAR ?AUTO_1855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1855 ?AUTO_1854 )
      ( MAKE-ON ?AUTO_1850 ?AUTO_1851 )
      ( MAKE-ON-VERIFY ?AUTO_1850 ?AUTO_1851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1859 - BLOCK
      ?AUTO_1860 - BLOCK
    )
    :vars
    (
      ?AUTO_1865 - BLOCK
      ?AUTO_1862 - BLOCK
      ?AUTO_1861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1859 ) ( ON ?AUTO_1865 ?AUTO_1859 ) ( CLEAR ?AUTO_1862 ) ( ON ?AUTO_1861 ?AUTO_1865 ) ( CLEAR ?AUTO_1861 ) ( HOLDING ?AUTO_1860 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1860 )
      ( MAKE-ON ?AUTO_1859 ?AUTO_1860 )
      ( MAKE-ON-VERIFY ?AUTO_1859 ?AUTO_1860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1867 - BLOCK
      ?AUTO_1868 - BLOCK
    )
    :vars
    (
      ?AUTO_1869 - BLOCK
      ?AUTO_1870 - BLOCK
      ?AUTO_1872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1867 ) ( ON ?AUTO_1869 ?AUTO_1867 ) ( CLEAR ?AUTO_1870 ) ( ON ?AUTO_1872 ?AUTO_1869 ) ( ON ?AUTO_1868 ?AUTO_1872 ) ( CLEAR ?AUTO_1868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1868 ?AUTO_1872 )
      ( MAKE-ON ?AUTO_1867 ?AUTO_1868 )
      ( MAKE-ON-VERIFY ?AUTO_1867 ?AUTO_1868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1876 - BLOCK
      ?AUTO_1877 - BLOCK
    )
    :vars
    (
      ?AUTO_1878 - BLOCK
      ?AUTO_1882 - BLOCK
      ?AUTO_1880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1876 ) ( ON ?AUTO_1878 ?AUTO_1876 ) ( ON ?AUTO_1882 ?AUTO_1878 ) ( ON ?AUTO_1877 ?AUTO_1882 ) ( CLEAR ?AUTO_1877 ) ( HOLDING ?AUTO_1880 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1880 )
      ( MAKE-ON ?AUTO_1876 ?AUTO_1877 )
      ( MAKE-ON-VERIFY ?AUTO_1876 ?AUTO_1877 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1888 - BLOCK
      ?AUTO_1889 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1888 ) ( CLEAR ?AUTO_1889 ) )
    :subtasks
    ( ( !STACK ?AUTO_1888 ?AUTO_1889 )
      ( MAKE-ON-VERIFY ?AUTO_1888 ?AUTO_1889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1892 - BLOCK
      ?AUTO_1893 - BLOCK
    )
    :vars
    (
      ?AUTO_1897 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1893 ) ( ON ?AUTO_1892 ?AUTO_1897 ) ( CLEAR ?AUTO_1892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1892 ?AUTO_1897 )
      ( MAKE-ON ?AUTO_1892 ?AUTO_1893 )
      ( MAKE-ON-VERIFY ?AUTO_1892 ?AUTO_1893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1898 - BLOCK
      ?AUTO_1899 - BLOCK
    )
    :vars
    (
      ?AUTO_1902 - BLOCK
      ?AUTO_1904 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1898 ?AUTO_1902 ) ( CLEAR ?AUTO_1898 ) ( HOLDING ?AUTO_1899 ) ( CLEAR ?AUTO_1904 ) )
    :subtasks
    ( ( !STACK ?AUTO_1899 ?AUTO_1904 )
      ( MAKE-ON ?AUTO_1898 ?AUTO_1899 )
      ( MAKE-ON-VERIFY ?AUTO_1898 ?AUTO_1899 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1996 - BLOCK
      ?AUTO_1997 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1996 ) ( CLEAR ?AUTO_1997 ) )
    :subtasks
    ( ( !STACK ?AUTO_1996 ?AUTO_1997 )
      ( MAKE-ON-VERIFY ?AUTO_1996 ?AUTO_1997 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2000 - BLOCK
      ?AUTO_2001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2001 ) ( ON-TABLE ?AUTO_2000 ) ( CLEAR ?AUTO_2000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2000 )
      ( MAKE-ON ?AUTO_2000 ?AUTO_2001 )
      ( MAKE-ON-VERIFY ?AUTO_2000 ?AUTO_2001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2005 - BLOCK
      ?AUTO_2006 - BLOCK
    )
    :vars
    (
      ?AUTO_2009 - BLOCK
      ?AUTO_2010 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2006 ) ( ON-TABLE ?AUTO_2005 ) ( CLEAR ?AUTO_2005 ) ( HOLDING ?AUTO_2009 ) ( CLEAR ?AUTO_2010 ) )
    :subtasks
    ( ( !STACK ?AUTO_2009 ?AUTO_2010 )
      ( MAKE-ON ?AUTO_2005 ?AUTO_2006 )
      ( MAKE-ON-VERIFY ?AUTO_2005 ?AUTO_2006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2011 - BLOCK
      ?AUTO_2012 - BLOCK
    )
    :vars
    (
      ?AUTO_2014 - BLOCK
      ?AUTO_2016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2011 ) ( CLEAR ?AUTO_2011 ) ( CLEAR ?AUTO_2014 ) ( ON ?AUTO_2016 ?AUTO_2012 ) ( CLEAR ?AUTO_2016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2016 ?AUTO_2012 )
      ( MAKE-ON ?AUTO_2011 ?AUTO_2012 )
      ( MAKE-ON-VERIFY ?AUTO_2011 ?AUTO_2012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2019 - BLOCK
      ?AUTO_2020 - BLOCK
    )
    :vars
    (
      ?AUTO_2024 - BLOCK
      ?AUTO_2023 - BLOCK
      ?AUTO_2026 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2019 ) ( CLEAR ?AUTO_2019 ) ( ON ?AUTO_2024 ?AUTO_2020 ) ( CLEAR ?AUTO_2024 ) ( HOLDING ?AUTO_2023 ) ( CLEAR ?AUTO_2026 ) )
    :subtasks
    ( ( !STACK ?AUTO_2023 ?AUTO_2026 )
      ( MAKE-ON ?AUTO_2019 ?AUTO_2020 )
      ( MAKE-ON-VERIFY ?AUTO_2019 ?AUTO_2020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2027 - BLOCK
      ?AUTO_2028 - BLOCK
    )
    :vars
    (
      ?AUTO_2031 - BLOCK
      ?AUTO_2033 - BLOCK
      ?AUTO_2032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2027 ) ( ON ?AUTO_2031 ?AUTO_2028 ) ( CLEAR ?AUTO_2031 ) ( CLEAR ?AUTO_2033 ) ( ON ?AUTO_2032 ?AUTO_2027 ) ( CLEAR ?AUTO_2032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2032 ?AUTO_2027 )
      ( MAKE-ON ?AUTO_2027 ?AUTO_2028 )
      ( MAKE-ON-VERIFY ?AUTO_2027 ?AUTO_2028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2036 - BLOCK
      ?AUTO_2037 - BLOCK
    )
    :vars
    (
      ?AUTO_2039 - BLOCK
      ?AUTO_2038 - BLOCK
      ?AUTO_2040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2036 ) ( CLEAR ?AUTO_2039 ) ( ON ?AUTO_2038 ?AUTO_2036 ) ( CLEAR ?AUTO_2038 ) ( HOLDING ?AUTO_2040 ) ( CLEAR ?AUTO_2037 ) )
    :subtasks
    ( ( !STACK ?AUTO_2040 ?AUTO_2037 )
      ( MAKE-ON ?AUTO_2036 ?AUTO_2037 )
      ( MAKE-ON-VERIFY ?AUTO_2036 ?AUTO_2037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2045 - BLOCK
      ?AUTO_2046 - BLOCK
    )
    :vars
    (
      ?AUTO_2049 - BLOCK
      ?AUTO_2048 - BLOCK
      ?AUTO_2051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2045 ) ( CLEAR ?AUTO_2049 ) ( ON ?AUTO_2048 ?AUTO_2045 ) ( CLEAR ?AUTO_2046 ) ( ON ?AUTO_2051 ?AUTO_2048 ) ( CLEAR ?AUTO_2051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2051 ?AUTO_2048 )
      ( MAKE-ON ?AUTO_2045 ?AUTO_2046 )
      ( MAKE-ON-VERIFY ?AUTO_2045 ?AUTO_2046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2054 - BLOCK
      ?AUTO_2055 - BLOCK
    )
    :vars
    (
      ?AUTO_2060 - BLOCK
      ?AUTO_2056 - BLOCK
      ?AUTO_2059 - BLOCK
      ?AUTO_2062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2054 ) ( ON ?AUTO_2060 ?AUTO_2054 ) ( CLEAR ?AUTO_2055 ) ( ON ?AUTO_2056 ?AUTO_2060 ) ( CLEAR ?AUTO_2056 ) ( HOLDING ?AUTO_2059 ) ( CLEAR ?AUTO_2062 ) )
    :subtasks
    ( ( !STACK ?AUTO_2059 ?AUTO_2062 )
      ( MAKE-ON ?AUTO_2054 ?AUTO_2055 )
      ( MAKE-ON-VERIFY ?AUTO_2054 ?AUTO_2055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2065 - BLOCK
      ?AUTO_2066 - BLOCK
    )
    :vars
    (
      ?AUTO_2070 - BLOCK
      ?AUTO_2071 - BLOCK
      ?AUTO_2068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2065 ) ( CLEAR ?AUTO_2070 ) ( ON ?AUTO_2071 ?AUTO_2065 ) ( ON ?AUTO_2068 ?AUTO_2071 ) ( CLEAR ?AUTO_2068 ) ( HOLDING ?AUTO_2066 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2066 )
      ( MAKE-ON ?AUTO_2065 ?AUTO_2066 )
      ( MAKE-ON-VERIFY ?AUTO_2065 ?AUTO_2066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2077 - BLOCK
      ?AUTO_2078 - BLOCK
    )
    :vars
    (
      ?AUTO_2084 - BLOCK
      ?AUTO_2083 - BLOCK
      ?AUTO_2079 - BLOCK
      ?AUTO_2082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2077 ) ( ON ?AUTO_2084 ?AUTO_2077 ) ( ON ?AUTO_2083 ?AUTO_2084 ) ( CLEAR ?AUTO_2083 ) ( CLEAR ?AUTO_2079 ) ( ON ?AUTO_2082 ?AUTO_2078 ) ( CLEAR ?AUTO_2082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2082 ?AUTO_2078 )
      ( MAKE-ON ?AUTO_2077 ?AUTO_2078 )
      ( MAKE-ON-VERIFY ?AUTO_2077 ?AUTO_2078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2087 - BLOCK
      ?AUTO_2088 - BLOCK
    )
    :vars
    (
      ?AUTO_2093 - BLOCK
      ?AUTO_2091 - BLOCK
      ?AUTO_2092 - BLOCK
      ?AUTO_2094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2087 ) ( ON ?AUTO_2093 ?AUTO_2087 ) ( CLEAR ?AUTO_2091 ) ( ON ?AUTO_2092 ?AUTO_2088 ) ( CLEAR ?AUTO_2092 ) ( HOLDING ?AUTO_2094 ) ( CLEAR ?AUTO_2093 ) )
    :subtasks
    ( ( !STACK ?AUTO_2094 ?AUTO_2093 )
      ( MAKE-ON ?AUTO_2087 ?AUTO_2088 )
      ( MAKE-ON-VERIFY ?AUTO_2087 ?AUTO_2088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2097 - BLOCK
      ?AUTO_2098 - BLOCK
    )
    :vars
    (
      ?AUTO_2100 - BLOCK
      ?AUTO_2103 - BLOCK
      ?AUTO_2099 - BLOCK
      ?AUTO_2104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2097 ) ( ON ?AUTO_2100 ?AUTO_2097 ) ( CLEAR ?AUTO_2103 ) ( ON ?AUTO_2099 ?AUTO_2098 ) ( CLEAR ?AUTO_2100 ) ( ON ?AUTO_2104 ?AUTO_2099 ) ( CLEAR ?AUTO_2104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2104 ?AUTO_2099 )
      ( MAKE-ON ?AUTO_2097 ?AUTO_2098 )
      ( MAKE-ON-VERIFY ?AUTO_2097 ?AUTO_2098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2111 - BLOCK
      ?AUTO_2112 - BLOCK
    )
    :vars
    (
      ?AUTO_2116 - BLOCK
      ?AUTO_2113 - BLOCK
      ?AUTO_2114 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2116 ?AUTO_2112 ) ( CLEAR ?AUTO_2113 ) ( ON ?AUTO_2114 ?AUTO_2116 ) ( CLEAR ?AUTO_2114 ) ( HOLDING ?AUTO_2111 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2111 )
      ( MAKE-ON ?AUTO_2111 ?AUTO_2112 )
      ( MAKE-ON-VERIFY ?AUTO_2111 ?AUTO_2112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2119 - BLOCK
      ?AUTO_2120 - BLOCK
    )
    :vars
    (
      ?AUTO_2122 - BLOCK
      ?AUTO_2124 - BLOCK
      ?AUTO_2121 - BLOCK
      ?AUTO_2127 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2122 ?AUTO_2120 ) ( CLEAR ?AUTO_2124 ) ( ON ?AUTO_2121 ?AUTO_2122 ) ( CLEAR ?AUTO_2121 ) ( ON ?AUTO_2119 ?AUTO_2127 ) ( CLEAR ?AUTO_2119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2119 ?AUTO_2127 )
      ( MAKE-ON ?AUTO_2119 ?AUTO_2120 )
      ( MAKE-ON-VERIFY ?AUTO_2119 ?AUTO_2120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2128 - BLOCK
      ?AUTO_2129 - BLOCK
    )
    :vars
    (
      ?AUTO_2134 - BLOCK
      ?AUTO_2130 - BLOCK
      ?AUTO_2132 - BLOCK
      ?AUTO_2135 - BLOCK
      ?AUTO_2136 - BLOCK
      ?AUTO_2137 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2134 ?AUTO_2129 ) ( CLEAR ?AUTO_2130 ) ( ON ?AUTO_2132 ?AUTO_2134 ) ( CLEAR ?AUTO_2132 ) ( ON ?AUTO_2128 ?AUTO_2135 ) ( CLEAR ?AUTO_2128 ) ( HOLDING ?AUTO_2136 ) ( CLEAR ?AUTO_2137 ) )
    :subtasks
    ( ( !STACK ?AUTO_2136 ?AUTO_2137 )
      ( MAKE-ON ?AUTO_2128 ?AUTO_2129 )
      ( MAKE-ON-VERIFY ?AUTO_2128 ?AUTO_2129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2138 - BLOCK
      ?AUTO_2139 - BLOCK
    )
    :vars
    (
      ?AUTO_2147 - BLOCK
      ?AUTO_2146 - BLOCK
      ?AUTO_2141 - BLOCK
      ?AUTO_2142 - BLOCK
      ?AUTO_2144 - BLOCK
      ?AUTO_2143 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2147 ?AUTO_2139 ) ( CLEAR ?AUTO_2146 ) ( ON ?AUTO_2141 ?AUTO_2147 ) ( CLEAR ?AUTO_2141 ) ( ON ?AUTO_2138 ?AUTO_2142 ) ( CLEAR ?AUTO_2144 ) ( ON ?AUTO_2143 ?AUTO_2138 ) ( CLEAR ?AUTO_2143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2143 ?AUTO_2138 )
      ( MAKE-ON ?AUTO_2138 ?AUTO_2139 )
      ( MAKE-ON-VERIFY ?AUTO_2138 ?AUTO_2139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2150 - BLOCK
      ?AUTO_2151 - BLOCK
    )
    :vars
    (
      ?AUTO_2154 - BLOCK
      ?AUTO_2159 - BLOCK
      ?AUTO_2157 - BLOCK
      ?AUTO_2158 - BLOCK
      ?AUTO_2155 - BLOCK
      ?AUTO_2152 - BLOCK
      ?AUTO_2160 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2154 ?AUTO_2151 ) ( CLEAR ?AUTO_2159 ) ( ON ?AUTO_2157 ?AUTO_2154 ) ( CLEAR ?AUTO_2157 ) ( ON ?AUTO_2150 ?AUTO_2158 ) ( CLEAR ?AUTO_2155 ) ( ON ?AUTO_2152 ?AUTO_2150 ) ( CLEAR ?AUTO_2152 ) ( HOLDING ?AUTO_2160 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2160 )
      ( MAKE-ON ?AUTO_2150 ?AUTO_2151 )
      ( MAKE-ON-VERIFY ?AUTO_2150 ?AUTO_2151 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2161 - BLOCK
      ?AUTO_2162 - BLOCK
    )
    :vars
    (
      ?AUTO_2163 - BLOCK
      ?AUTO_2164 - BLOCK
      ?AUTO_2170 - BLOCK
      ?AUTO_2167 - BLOCK
      ?AUTO_2165 - BLOCK
      ?AUTO_2166 - BLOCK
      ?AUTO_2171 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2163 ?AUTO_2162 ) ( CLEAR ?AUTO_2164 ) ( ON ?AUTO_2170 ?AUTO_2163 ) ( CLEAR ?AUTO_2170 ) ( ON ?AUTO_2161 ?AUTO_2167 ) ( CLEAR ?AUTO_2165 ) ( ON ?AUTO_2166 ?AUTO_2161 ) ( ON ?AUTO_2171 ?AUTO_2166 ) ( CLEAR ?AUTO_2171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2171 ?AUTO_2166 )
      ( MAKE-ON ?AUTO_2161 ?AUTO_2162 )
      ( MAKE-ON-VERIFY ?AUTO_2161 ?AUTO_2162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2174 - BLOCK
      ?AUTO_2175 - BLOCK
    )
    :vars
    (
      ?AUTO_2177 - BLOCK
      ?AUTO_2181 - BLOCK
      ?AUTO_2178 - BLOCK
      ?AUTO_2184 - BLOCK
      ?AUTO_2183 - BLOCK
      ?AUTO_2180 - BLOCK
      ?AUTO_2179 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2177 ?AUTO_2175 ) ( CLEAR ?AUTO_2181 ) ( ON ?AUTO_2178 ?AUTO_2177 ) ( CLEAR ?AUTO_2178 ) ( ON ?AUTO_2174 ?AUTO_2184 ) ( ON ?AUTO_2183 ?AUTO_2174 ) ( ON ?AUTO_2180 ?AUTO_2183 ) ( CLEAR ?AUTO_2180 ) ( HOLDING ?AUTO_2179 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2179 )
      ( MAKE-ON ?AUTO_2174 ?AUTO_2175 )
      ( MAKE-ON-VERIFY ?AUTO_2174 ?AUTO_2175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2186 - BLOCK
      ?AUTO_2187 - BLOCK
    )
    :vars
    (
      ?AUTO_2190 - BLOCK
      ?AUTO_2189 - BLOCK
      ?AUTO_2195 - BLOCK
      ?AUTO_2196 - BLOCK
      ?AUTO_2192 - BLOCK
      ?AUTO_2191 - BLOCK
      ?AUTO_2188 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2190 ?AUTO_2187 ) ( CLEAR ?AUTO_2189 ) ( ON ?AUTO_2195 ?AUTO_2190 ) ( ON ?AUTO_2186 ?AUTO_2196 ) ( ON ?AUTO_2192 ?AUTO_2186 ) ( ON ?AUTO_2191 ?AUTO_2192 ) ( CLEAR ?AUTO_2191 ) ( ON ?AUTO_2188 ?AUTO_2195 ) ( CLEAR ?AUTO_2188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2188 ?AUTO_2195 )
      ( MAKE-ON ?AUTO_2186 ?AUTO_2187 )
      ( MAKE-ON-VERIFY ?AUTO_2186 ?AUTO_2187 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2200 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2200 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2200 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2200 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2202 - BLOCK
    )
    :vars
    (
      ?AUTO_2205 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2202 ?AUTO_2205 ) ( CLEAR ?AUTO_2202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2202 ?AUTO_2205 )
      ( MAKE-ON-TABLE ?AUTO_2202 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2202 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2206 - BLOCK
    )
    :vars
    (
      ?AUTO_2208 - BLOCK
      ?AUTO_2209 - BLOCK
      ?AUTO_2210 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2206 ?AUTO_2208 ) ( CLEAR ?AUTO_2206 ) ( HOLDING ?AUTO_2209 ) ( CLEAR ?AUTO_2210 ) )
    :subtasks
    ( ( !STACK ?AUTO_2209 ?AUTO_2210 )
      ( MAKE-ON-TABLE ?AUTO_2206 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2238 - BLOCK
      ?AUTO_2239 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2238 ) ( CLEAR ?AUTO_2239 ) )
    :subtasks
    ( ( !STACK ?AUTO_2238 ?AUTO_2239 )
      ( MAKE-ON-VERIFY ?AUTO_2238 ?AUTO_2239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2242 - BLOCK
      ?AUTO_2243 - BLOCK
    )
    :vars
    (
      ?AUTO_2247 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2243 ) ( ON ?AUTO_2242 ?AUTO_2247 ) ( CLEAR ?AUTO_2242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2242 ?AUTO_2247 )
      ( MAKE-ON ?AUTO_2242 ?AUTO_2243 )
      ( MAKE-ON-VERIFY ?AUTO_2242 ?AUTO_2243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2248 - BLOCK
      ?AUTO_2249 - BLOCK
    )
    :vars
    (
      ?AUTO_2252 - BLOCK
      ?AUTO_2253 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2249 ) ( ON ?AUTO_2248 ?AUTO_2252 ) ( CLEAR ?AUTO_2248 ) ( HOLDING ?AUTO_2253 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2253 )
      ( MAKE-ON ?AUTO_2248 ?AUTO_2249 )
      ( MAKE-ON-VERIFY ?AUTO_2248 ?AUTO_2249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2254 - BLOCK
      ?AUTO_2255 - BLOCK
    )
    :vars
    (
      ?AUTO_2258 - BLOCK
      ?AUTO_2259 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2255 ) ( ON ?AUTO_2254 ?AUTO_2258 ) ( ON ?AUTO_2259 ?AUTO_2254 ) ( CLEAR ?AUTO_2259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2259 ?AUTO_2254 )
      ( MAKE-ON ?AUTO_2254 ?AUTO_2255 )
      ( MAKE-ON-VERIFY ?AUTO_2254 ?AUTO_2255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2262 - BLOCK
      ?AUTO_2263 - BLOCK
    )
    :vars
    (
      ?AUTO_2265 - BLOCK
      ?AUTO_2266 - BLOCK
      ?AUTO_2269 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2262 ?AUTO_2265 ) ( ON ?AUTO_2266 ?AUTO_2262 ) ( CLEAR ?AUTO_2266 ) ( HOLDING ?AUTO_2263 ) ( CLEAR ?AUTO_2269 ) )
    :subtasks
    ( ( !STACK ?AUTO_2263 ?AUTO_2269 )
      ( MAKE-ON ?AUTO_2262 ?AUTO_2263 )
      ( MAKE-ON-VERIFY ?AUTO_2262 ?AUTO_2263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2441 - BLOCK
      ?AUTO_2442 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2441 ) ( CLEAR ?AUTO_2442 ) )
    :subtasks
    ( ( !STACK ?AUTO_2441 ?AUTO_2442 )
      ( MAKE-ON-VERIFY ?AUTO_2441 ?AUTO_2442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2445 - BLOCK
      ?AUTO_2446 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2446 ) ( ON-TABLE ?AUTO_2445 ) ( CLEAR ?AUTO_2445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2445 )
      ( MAKE-ON ?AUTO_2445 ?AUTO_2446 )
      ( MAKE-ON-VERIFY ?AUTO_2445 ?AUTO_2446 ) )
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
    ( and ( ON-TABLE ?AUTO_2450 ) ( CLEAR ?AUTO_2450 ) ( HOLDING ?AUTO_2451 ) ( CLEAR ?AUTO_2455 ) )
    :subtasks
    ( ( !STACK ?AUTO_2451 ?AUTO_2455 )
      ( MAKE-ON ?AUTO_2450 ?AUTO_2451 )
      ( MAKE-ON-VERIFY ?AUTO_2450 ?AUTO_2451 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2457 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2457 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2457 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2457 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2459 - BLOCK
    )
    :vars
    (
      ?AUTO_2462 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2459 ?AUTO_2462 ) ( CLEAR ?AUTO_2459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2459 ?AUTO_2462 )
      ( MAKE-ON-TABLE ?AUTO_2459 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2459 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2464 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2464 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2464 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2464 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2466 - BLOCK
    )
    :vars
    (
      ?AUTO_2469 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2466 ?AUTO_2469 ) ( CLEAR ?AUTO_2466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2466 ?AUTO_2469 )
      ( MAKE-ON-TABLE ?AUTO_2466 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2466 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2470 - BLOCK
    )
    :vars
    (
      ?AUTO_2472 - BLOCK
      ?AUTO_2473 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2470 ?AUTO_2472 ) ( CLEAR ?AUTO_2470 ) ( HOLDING ?AUTO_2473 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2473 )
      ( MAKE-ON-TABLE ?AUTO_2470 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2470 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2474 - BLOCK
    )
    :vars
    (
      ?AUTO_2476 - BLOCK
      ?AUTO_2477 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2474 ?AUTO_2476 ) ( ON ?AUTO_2477 ?AUTO_2474 ) ( CLEAR ?AUTO_2477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2477 ?AUTO_2474 )
      ( MAKE-ON-TABLE ?AUTO_2474 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2474 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2481 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2481 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2481 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2481 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2483 - BLOCK
    )
    :vars
    (
      ?AUTO_2486 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2483 ?AUTO_2486 ) ( CLEAR ?AUTO_2483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2483 ?AUTO_2486 )
      ( MAKE-ON-TABLE ?AUTO_2483 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2483 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2487 - BLOCK
    )
    :vars
    (
      ?AUTO_2489 - BLOCK
      ?AUTO_2490 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2487 ?AUTO_2489 ) ( CLEAR ?AUTO_2487 ) ( HOLDING ?AUTO_2490 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2490 )
      ( MAKE-ON-TABLE ?AUTO_2487 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2487 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2491 - BLOCK
    )
    :vars
    (
      ?AUTO_2493 - BLOCK
      ?AUTO_2494 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2491 ?AUTO_2493 ) ( ON ?AUTO_2494 ?AUTO_2491 ) ( CLEAR ?AUTO_2494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2494 ?AUTO_2491 )
      ( MAKE-ON-TABLE ?AUTO_2491 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2491 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2497 - BLOCK
    )
    :vars
    (
      ?AUTO_2498 - BLOCK
      ?AUTO_2499 - BLOCK
      ?AUTO_2501 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2497 ?AUTO_2498 ) ( ON ?AUTO_2499 ?AUTO_2497 ) ( CLEAR ?AUTO_2499 ) ( HOLDING ?AUTO_2501 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2501 )
      ( MAKE-ON-TABLE ?AUTO_2497 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2497 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2502 - BLOCK
    )
    :vars
    (
      ?AUTO_2503 - BLOCK
      ?AUTO_2505 - BLOCK
      ?AUTO_2506 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2502 ?AUTO_2503 ) ( ON ?AUTO_2505 ?AUTO_2502 ) ( ON ?AUTO_2506 ?AUTO_2505 ) ( CLEAR ?AUTO_2506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2506 ?AUTO_2505 )
      ( MAKE-ON-TABLE ?AUTO_2502 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2511 - BLOCK
      ?AUTO_2512 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2511 ) ( CLEAR ?AUTO_2512 ) )
    :subtasks
    ( ( !STACK ?AUTO_2511 ?AUTO_2512 )
      ( MAKE-ON-VERIFY ?AUTO_2511 ?AUTO_2512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2515 - BLOCK
      ?AUTO_2516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2516 ) ( ON-TABLE ?AUTO_2515 ) ( CLEAR ?AUTO_2515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2515 )
      ( MAKE-ON ?AUTO_2515 ?AUTO_2516 )
      ( MAKE-ON-VERIFY ?AUTO_2515 ?AUTO_2516 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_2521 ) ( ON-TABLE ?AUTO_2520 ) ( CLEAR ?AUTO_2520 ) ( HOLDING ?AUTO_2524 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2524 )
      ( MAKE-ON ?AUTO_2520 ?AUTO_2521 )
      ( MAKE-ON-VERIFY ?AUTO_2520 ?AUTO_2521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2525 - BLOCK
      ?AUTO_2526 - BLOCK
    )
    :vars
    (
      ?AUTO_2529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2525 ) ( CLEAR ?AUTO_2525 ) ( ON ?AUTO_2529 ?AUTO_2526 ) ( CLEAR ?AUTO_2529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2529 ?AUTO_2526 )
      ( MAKE-ON ?AUTO_2525 ?AUTO_2526 )
      ( MAKE-ON-VERIFY ?AUTO_2525 ?AUTO_2526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2532 - BLOCK
      ?AUTO_2533 - BLOCK
    )
    :vars
    (
      ?AUTO_2534 - BLOCK
      ?AUTO_2537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2532 ) ( CLEAR ?AUTO_2532 ) ( ON ?AUTO_2534 ?AUTO_2533 ) ( CLEAR ?AUTO_2534 ) ( HOLDING ?AUTO_2537 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2537 )
      ( MAKE-ON ?AUTO_2532 ?AUTO_2533 )
      ( MAKE-ON-VERIFY ?AUTO_2532 ?AUTO_2533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2538 - BLOCK
      ?AUTO_2539 - BLOCK
    )
    :vars
    (
      ?AUTO_2542 - BLOCK
      ?AUTO_2543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2538 ) ( CLEAR ?AUTO_2538 ) ( ON ?AUTO_2542 ?AUTO_2539 ) ( ON ?AUTO_2543 ?AUTO_2542 ) ( CLEAR ?AUTO_2543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2543 ?AUTO_2542 )
      ( MAKE-ON ?AUTO_2538 ?AUTO_2539 )
      ( MAKE-ON-VERIFY ?AUTO_2538 ?AUTO_2539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2546 - BLOCK
      ?AUTO_2547 - BLOCK
    )
    :vars
    (
      ?AUTO_2551 - BLOCK
      ?AUTO_2548 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2551 ?AUTO_2547 ) ( ON ?AUTO_2548 ?AUTO_2551 ) ( CLEAR ?AUTO_2548 ) ( HOLDING ?AUTO_2546 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2546 )
      ( MAKE-ON ?AUTO_2546 ?AUTO_2547 )
      ( MAKE-ON-VERIFY ?AUTO_2546 ?AUTO_2547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2553 - BLOCK
      ?AUTO_2554 - BLOCK
    )
    :vars
    (
      ?AUTO_2558 - BLOCK
      ?AUTO_2555 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2558 ?AUTO_2554 ) ( ON ?AUTO_2555 ?AUTO_2558 ) ( ON ?AUTO_2553 ?AUTO_2555 ) ( CLEAR ?AUTO_2553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2553 ?AUTO_2555 )
      ( MAKE-ON ?AUTO_2553 ?AUTO_2554 )
      ( MAKE-ON-VERIFY ?AUTO_2553 ?AUTO_2554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2563 - BLOCK
      ?AUTO_2564 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2563 ) ( CLEAR ?AUTO_2564 ) )
    :subtasks
    ( ( !STACK ?AUTO_2563 ?AUTO_2564 )
      ( MAKE-ON-VERIFY ?AUTO_2563 ?AUTO_2564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2567 - BLOCK
      ?AUTO_2568 - BLOCK
    )
    :vars
    (
      ?AUTO_2572 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2568 ) ( ON ?AUTO_2567 ?AUTO_2572 ) ( CLEAR ?AUTO_2567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2567 ?AUTO_2572 )
      ( MAKE-ON ?AUTO_2567 ?AUTO_2568 )
      ( MAKE-ON-VERIFY ?AUTO_2567 ?AUTO_2568 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2573 - BLOCK
      ?AUTO_2574 - BLOCK
    )
    :vars
    (
      ?AUTO_2577 - BLOCK
      ?AUTO_2578 - BLOCK
      ?AUTO_2579 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2574 ) ( ON ?AUTO_2573 ?AUTO_2577 ) ( CLEAR ?AUTO_2573 ) ( HOLDING ?AUTO_2578 ) ( CLEAR ?AUTO_2579 ) )
    :subtasks
    ( ( !STACK ?AUTO_2578 ?AUTO_2579 )
      ( MAKE-ON ?AUTO_2573 ?AUTO_2574 )
      ( MAKE-ON-VERIFY ?AUTO_2573 ?AUTO_2574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2582 - BLOCK
      ?AUTO_2583 - BLOCK
    )
    :vars
    (
      ?AUTO_2586 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2582 ?AUTO_2586 ) ( CLEAR ?AUTO_2582 ) ( HOLDING ?AUTO_2583 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2583 )
      ( MAKE-ON ?AUTO_2582 ?AUTO_2583 )
      ( MAKE-ON-VERIFY ?AUTO_2582 ?AUTO_2583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2592 - BLOCK
      ?AUTO_2593 - BLOCK
    )
    :vars
    (
      ?AUTO_2594 - BLOCK
      ?AUTO_2597 - BLOCK
      ?AUTO_2598 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2592 ?AUTO_2594 ) ( CLEAR ?AUTO_2592 ) ( CLEAR ?AUTO_2597 ) ( ON ?AUTO_2598 ?AUTO_2593 ) ( CLEAR ?AUTO_2598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2598 ?AUTO_2593 )
      ( MAKE-ON ?AUTO_2592 ?AUTO_2593 )
      ( MAKE-ON-VERIFY ?AUTO_2592 ?AUTO_2593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2601 - BLOCK
      ?AUTO_2602 - BLOCK
    )
    :vars
    (
      ?AUTO_2605 - BLOCK
      ?AUTO_2607 - BLOCK
      ?AUTO_2606 - BLOCK
      ?AUTO_2608 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2601 ?AUTO_2605 ) ( CLEAR ?AUTO_2601 ) ( CLEAR ?AUTO_2607 ) ( ON ?AUTO_2606 ?AUTO_2602 ) ( CLEAR ?AUTO_2606 ) ( HOLDING ?AUTO_2608 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2608 )
      ( MAKE-ON ?AUTO_2601 ?AUTO_2602 )
      ( MAKE-ON-VERIFY ?AUTO_2601 ?AUTO_2602 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2609 - BLOCK
      ?AUTO_2610 - BLOCK
    )
    :vars
    (
      ?AUTO_2615 - BLOCK
      ?AUTO_2611 - BLOCK
      ?AUTO_2616 - BLOCK
      ?AUTO_2614 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2609 ?AUTO_2615 ) ( CLEAR ?AUTO_2609 ) ( CLEAR ?AUTO_2611 ) ( ON ?AUTO_2616 ?AUTO_2610 ) ( ON ?AUTO_2614 ?AUTO_2616 ) ( CLEAR ?AUTO_2614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2614 ?AUTO_2616 )
      ( MAKE-ON ?AUTO_2609 ?AUTO_2610 )
      ( MAKE-ON-VERIFY ?AUTO_2609 ?AUTO_2610 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2620 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2620 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2620 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2620 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2622 - BLOCK
    )
    :vars
    (
      ?AUTO_2625 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2622 ?AUTO_2625 ) ( CLEAR ?AUTO_2622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2622 ?AUTO_2625 )
      ( MAKE-ON-TABLE ?AUTO_2622 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2622 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2626 - BLOCK
    )
    :vars
    (
      ?AUTO_2628 - BLOCK
      ?AUTO_2629 - BLOCK
      ?AUTO_2630 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2626 ?AUTO_2628 ) ( CLEAR ?AUTO_2626 ) ( HOLDING ?AUTO_2629 ) ( CLEAR ?AUTO_2630 ) )
    :subtasks
    ( ( !STACK ?AUTO_2629 ?AUTO_2630 )
      ( MAKE-ON-TABLE ?AUTO_2626 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2626 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2631 - BLOCK
    )
    :vars
    (
      ?AUTO_2633 - BLOCK
      ?AUTO_2635 - BLOCK
      ?AUTO_2634 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2631 ?AUTO_2633 ) ( CLEAR ?AUTO_2635 ) ( ON ?AUTO_2634 ?AUTO_2631 ) ( CLEAR ?AUTO_2634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2634 ?AUTO_2631 )
      ( MAKE-ON-TABLE ?AUTO_2631 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2631 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2638 - BLOCK
    )
    :vars
    (
      ?AUTO_2641 - BLOCK
      ?AUTO_2639 - BLOCK
      ?AUTO_2642 - BLOCK
      ?AUTO_2643 - BLOCK
      ?AUTO_2644 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2638 ?AUTO_2641 ) ( CLEAR ?AUTO_2639 ) ( ON ?AUTO_2642 ?AUTO_2638 ) ( CLEAR ?AUTO_2642 ) ( HOLDING ?AUTO_2643 ) ( CLEAR ?AUTO_2644 ) )
    :subtasks
    ( ( !STACK ?AUTO_2643 ?AUTO_2644 )
      ( MAKE-ON-TABLE ?AUTO_2638 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2638 ) )
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
    :vars
    (
      ?AUTO_2663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2659 ) ( ON ?AUTO_2658 ?AUTO_2663 ) ( CLEAR ?AUTO_2658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2658 ?AUTO_2663 )
      ( MAKE-ON ?AUTO_2658 ?AUTO_2659 )
      ( MAKE-ON-VERIFY ?AUTO_2658 ?AUTO_2659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2664 - BLOCK
      ?AUTO_2665 - BLOCK
    )
    :vars
    (
      ?AUTO_2668 - BLOCK
      ?AUTO_2669 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2665 ) ( ON ?AUTO_2664 ?AUTO_2668 ) ( CLEAR ?AUTO_2664 ) ( HOLDING ?AUTO_2669 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2669 )
      ( MAKE-ON ?AUTO_2664 ?AUTO_2665 )
      ( MAKE-ON-VERIFY ?AUTO_2664 ?AUTO_2665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2670 - BLOCK
      ?AUTO_2671 - BLOCK
    )
    :vars
    (
      ?AUTO_2674 - BLOCK
      ?AUTO_2675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2671 ) ( ON ?AUTO_2670 ?AUTO_2674 ) ( ON ?AUTO_2675 ?AUTO_2670 ) ( CLEAR ?AUTO_2675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2675 ?AUTO_2670 )
      ( MAKE-ON ?AUTO_2670 ?AUTO_2671 )
      ( MAKE-ON-VERIFY ?AUTO_2670 ?AUTO_2671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2678 - BLOCK
      ?AUTO_2679 - BLOCK
    )
    :vars
    (
      ?AUTO_2680 - BLOCK
      ?AUTO_2681 - BLOCK
      ?AUTO_2685 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2678 ?AUTO_2680 ) ( ON ?AUTO_2681 ?AUTO_2678 ) ( CLEAR ?AUTO_2681 ) ( HOLDING ?AUTO_2679 ) ( CLEAR ?AUTO_2685 ) )
    :subtasks
    ( ( !STACK ?AUTO_2679 ?AUTO_2685 )
      ( MAKE-ON ?AUTO_2678 ?AUTO_2679 )
      ( MAKE-ON-VERIFY ?AUTO_2678 ?AUTO_2679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2686 - BLOCK
      ?AUTO_2687 - BLOCK
    )
    :vars
    (
      ?AUTO_2689 - BLOCK
      ?AUTO_2692 - BLOCK
      ?AUTO_2688 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2686 ?AUTO_2689 ) ( ON ?AUTO_2692 ?AUTO_2686 ) ( CLEAR ?AUTO_2688 ) ( ON ?AUTO_2687 ?AUTO_2692 ) ( CLEAR ?AUTO_2687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2687 ?AUTO_2692 )
      ( MAKE-ON ?AUTO_2686 ?AUTO_2687 )
      ( MAKE-ON-VERIFY ?AUTO_2686 ?AUTO_2687 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2695 - BLOCK
      ?AUTO_2696 - BLOCK
    )
    :vars
    (
      ?AUTO_2699 - BLOCK
      ?AUTO_2701 - BLOCK
      ?AUTO_2700 - BLOCK
      ?AUTO_2702 - BLOCK
      ?AUTO_2703 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2695 ?AUTO_2699 ) ( ON ?AUTO_2701 ?AUTO_2695 ) ( CLEAR ?AUTO_2700 ) ( ON ?AUTO_2696 ?AUTO_2701 ) ( CLEAR ?AUTO_2696 ) ( HOLDING ?AUTO_2702 ) ( CLEAR ?AUTO_2703 ) )
    :subtasks
    ( ( !STACK ?AUTO_2702 ?AUTO_2703 )
      ( MAKE-ON ?AUTO_2695 ?AUTO_2696 )
      ( MAKE-ON-VERIFY ?AUTO_2695 ?AUTO_2696 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2720 - BLOCK
      ?AUTO_2721 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2720 ) ( CLEAR ?AUTO_2721 ) )
    :subtasks
    ( ( !STACK ?AUTO_2720 ?AUTO_2721 )
      ( MAKE-ON-VERIFY ?AUTO_2720 ?AUTO_2721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2724 - BLOCK
      ?AUTO_2725 - BLOCK
    )
    :vars
    (
      ?AUTO_2729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2725 ) ( ON ?AUTO_2724 ?AUTO_2729 ) ( CLEAR ?AUTO_2724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2724 ?AUTO_2729 )
      ( MAKE-ON ?AUTO_2724 ?AUTO_2725 )
      ( MAKE-ON-VERIFY ?AUTO_2724 ?AUTO_2725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2730 - BLOCK
      ?AUTO_2731 - BLOCK
    )
    :vars
    (
      ?AUTO_2734 - BLOCK
      ?AUTO_2735 - BLOCK
      ?AUTO_2736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2731 ) ( ON ?AUTO_2730 ?AUTO_2734 ) ( CLEAR ?AUTO_2730 ) ( HOLDING ?AUTO_2735 ) ( CLEAR ?AUTO_2736 ) )
    :subtasks
    ( ( !STACK ?AUTO_2735 ?AUTO_2736 )
      ( MAKE-ON ?AUTO_2730 ?AUTO_2731 )
      ( MAKE-ON-VERIFY ?AUTO_2730 ?AUTO_2731 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2737 - BLOCK
      ?AUTO_2738 - BLOCK
    )
    :vars
    (
      ?AUTO_2741 - BLOCK
      ?AUTO_2743 - BLOCK
      ?AUTO_2742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2738 ) ( ON ?AUTO_2737 ?AUTO_2741 ) ( CLEAR ?AUTO_2743 ) ( ON ?AUTO_2742 ?AUTO_2737 ) ( CLEAR ?AUTO_2742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2742 ?AUTO_2737 )
      ( MAKE-ON ?AUTO_2737 ?AUTO_2738 )
      ( MAKE-ON-VERIFY ?AUTO_2737 ?AUTO_2738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2746 - BLOCK
      ?AUTO_2747 - BLOCK
    )
    :vars
    (
      ?AUTO_2752 - BLOCK
      ?AUTO_2749 - BLOCK
      ?AUTO_2748 - BLOCK
      ?AUTO_2753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2747 ) ( ON ?AUTO_2746 ?AUTO_2752 ) ( CLEAR ?AUTO_2749 ) ( ON ?AUTO_2748 ?AUTO_2746 ) ( CLEAR ?AUTO_2748 ) ( HOLDING ?AUTO_2753 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2753 )
      ( MAKE-ON ?AUTO_2746 ?AUTO_2747 )
      ( MAKE-ON-VERIFY ?AUTO_2746 ?AUTO_2747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2754 - BLOCK
      ?AUTO_2755 - BLOCK
    )
    :vars
    (
      ?AUTO_2761 - BLOCK
      ?AUTO_2758 - BLOCK
      ?AUTO_2756 - BLOCK
      ?AUTO_2760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2755 ) ( ON ?AUTO_2754 ?AUTO_2761 ) ( CLEAR ?AUTO_2758 ) ( ON ?AUTO_2756 ?AUTO_2754 ) ( ON ?AUTO_2760 ?AUTO_2756 ) ( CLEAR ?AUTO_2760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2760 ?AUTO_2756 )
      ( MAKE-ON ?AUTO_2754 ?AUTO_2755 )
      ( MAKE-ON-VERIFY ?AUTO_2754 ?AUTO_2755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2764 - BLOCK
      ?AUTO_2765 - BLOCK
    )
    :vars
    (
      ?AUTO_2767 - BLOCK
      ?AUTO_2769 - BLOCK
      ?AUTO_2770 - BLOCK
      ?AUTO_2771 - BLOCK
      ?AUTO_2773 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2765 ) ( ON ?AUTO_2764 ?AUTO_2767 ) ( ON ?AUTO_2769 ?AUTO_2764 ) ( ON ?AUTO_2770 ?AUTO_2769 ) ( CLEAR ?AUTO_2770 ) ( HOLDING ?AUTO_2771 ) ( CLEAR ?AUTO_2773 ) )
    :subtasks
    ( ( !STACK ?AUTO_2771 ?AUTO_2773 )
      ( MAKE-ON ?AUTO_2764 ?AUTO_2765 )
      ( MAKE-ON-VERIFY ?AUTO_2764 ?AUTO_2765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2774 - BLOCK
      ?AUTO_2775 - BLOCK
    )
    :vars
    (
      ?AUTO_2781 - BLOCK
      ?AUTO_2777 - BLOCK
      ?AUTO_2782 - BLOCK
      ?AUTO_2778 - BLOCK
      ?AUTO_2776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2775 ) ( ON ?AUTO_2774 ?AUTO_2781 ) ( ON ?AUTO_2777 ?AUTO_2774 ) ( ON ?AUTO_2782 ?AUTO_2777 ) ( CLEAR ?AUTO_2778 ) ( ON ?AUTO_2776 ?AUTO_2782 ) ( CLEAR ?AUTO_2776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2776 ?AUTO_2782 )
      ( MAKE-ON ?AUTO_2774 ?AUTO_2775 )
      ( MAKE-ON-VERIFY ?AUTO_2774 ?AUTO_2775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2785 - BLOCK
      ?AUTO_2786 - BLOCK
    )
    :vars
    (
      ?AUTO_2789 - BLOCK
      ?AUTO_2788 - BLOCK
      ?AUTO_2791 - BLOCK
      ?AUTO_2793 - BLOCK
      ?AUTO_2787 - BLOCK
      ?AUTO_2795 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2785 ?AUTO_2789 ) ( ON ?AUTO_2788 ?AUTO_2785 ) ( ON ?AUTO_2791 ?AUTO_2788 ) ( CLEAR ?AUTO_2793 ) ( ON ?AUTO_2787 ?AUTO_2791 ) ( CLEAR ?AUTO_2787 ) ( HOLDING ?AUTO_2786 ) ( CLEAR ?AUTO_2795 ) )
    :subtasks
    ( ( !STACK ?AUTO_2786 ?AUTO_2795 )
      ( MAKE-ON ?AUTO_2785 ?AUTO_2786 )
      ( MAKE-ON-VERIFY ?AUTO_2785 ?AUTO_2786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2798 - BLOCK
      ?AUTO_2799 - BLOCK
    )
    :vars
    (
      ?AUTO_2800 - BLOCK
      ?AUTO_2805 - BLOCK
      ?AUTO_2804 - BLOCK
      ?AUTO_2806 - BLOCK
      ?AUTO_2802 - BLOCK
      ?AUTO_2807 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2799 ) ( ON ?AUTO_2798 ?AUTO_2800 ) ( ON ?AUTO_2805 ?AUTO_2798 ) ( ON ?AUTO_2804 ?AUTO_2805 ) ( CLEAR ?AUTO_2806 ) ( ON ?AUTO_2802 ?AUTO_2804 ) ( CLEAR ?AUTO_2802 ) ( HOLDING ?AUTO_2807 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2807 )
      ( MAKE-ON ?AUTO_2798 ?AUTO_2799 )
      ( MAKE-ON-VERIFY ?AUTO_2798 ?AUTO_2799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2820 - BLOCK
      ?AUTO_2821 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2820 ) ( CLEAR ?AUTO_2821 ) )
    :subtasks
    ( ( !STACK ?AUTO_2820 ?AUTO_2821 )
      ( MAKE-ON-VERIFY ?AUTO_2820 ?AUTO_2821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2824 - BLOCK
      ?AUTO_2825 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2825 ) ( ON-TABLE ?AUTO_2824 ) ( CLEAR ?AUTO_2824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2824 )
      ( MAKE-ON ?AUTO_2824 ?AUTO_2825 )
      ( MAKE-ON-VERIFY ?AUTO_2824 ?AUTO_2825 ) )
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
      ?AUTO_2834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2830 ) ( ON-TABLE ?AUTO_2829 ) ( CLEAR ?AUTO_2829 ) ( HOLDING ?AUTO_2833 ) ( CLEAR ?AUTO_2834 ) )
    :subtasks
    ( ( !STACK ?AUTO_2833 ?AUTO_2834 )
      ( MAKE-ON ?AUTO_2829 ?AUTO_2830 )
      ( MAKE-ON-VERIFY ?AUTO_2829 ?AUTO_2830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2835 - BLOCK
      ?AUTO_2836 - BLOCK
    )
    :vars
    (
      ?AUTO_2838 - BLOCK
      ?AUTO_2840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2835 ) ( CLEAR ?AUTO_2835 ) ( CLEAR ?AUTO_2838 ) ( ON ?AUTO_2840 ?AUTO_2836 ) ( CLEAR ?AUTO_2840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2840 ?AUTO_2836 )
      ( MAKE-ON ?AUTO_2835 ?AUTO_2836 )
      ( MAKE-ON-VERIFY ?AUTO_2835 ?AUTO_2836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2843 - BLOCK
      ?AUTO_2844 - BLOCK
    )
    :vars
    (
      ?AUTO_2847 - BLOCK
      ?AUTO_2848 - BLOCK
      ?AUTO_2849 - BLOCK
      ?AUTO_2850 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2843 ) ( CLEAR ?AUTO_2843 ) ( CLEAR ?AUTO_2847 ) ( ON ?AUTO_2848 ?AUTO_2844 ) ( CLEAR ?AUTO_2848 ) ( HOLDING ?AUTO_2849 ) ( CLEAR ?AUTO_2850 ) )
    :subtasks
    ( ( !STACK ?AUTO_2849 ?AUTO_2850 )
      ( MAKE-ON ?AUTO_2843 ?AUTO_2844 )
      ( MAKE-ON-VERIFY ?AUTO_2843 ?AUTO_2844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2851 - BLOCK
      ?AUTO_2852 - BLOCK
    )
    :vars
    (
      ?AUTO_2856 - BLOCK
      ?AUTO_2855 - BLOCK
      ?AUTO_2858 - BLOCK
      ?AUTO_2857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2851 ) ( CLEAR ?AUTO_2851 ) ( CLEAR ?AUTO_2856 ) ( ON ?AUTO_2855 ?AUTO_2852 ) ( CLEAR ?AUTO_2858 ) ( ON ?AUTO_2857 ?AUTO_2855 ) ( CLEAR ?AUTO_2857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2857 ?AUTO_2855 )
      ( MAKE-ON ?AUTO_2851 ?AUTO_2852 )
      ( MAKE-ON-VERIFY ?AUTO_2851 ?AUTO_2852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2861 - BLOCK
      ?AUTO_2862 - BLOCK
    )
    :vars
    (
      ?AUTO_2867 - BLOCK
      ?AUTO_2868 - BLOCK
      ?AUTO_2866 - BLOCK
      ?AUTO_2865 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2867 ) ( ON ?AUTO_2868 ?AUTO_2862 ) ( CLEAR ?AUTO_2866 ) ( ON ?AUTO_2865 ?AUTO_2868 ) ( CLEAR ?AUTO_2865 ) ( HOLDING ?AUTO_2861 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2861 )
      ( MAKE-ON ?AUTO_2861 ?AUTO_2862 )
      ( MAKE-ON-VERIFY ?AUTO_2861 ?AUTO_2862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2870 - BLOCK
      ?AUTO_2871 - BLOCK
    )
    :vars
    (
      ?AUTO_2872 - BLOCK
      ?AUTO_2873 - BLOCK
      ?AUTO_2876 - BLOCK
      ?AUTO_2877 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2872 ) ( ON ?AUTO_2873 ?AUTO_2871 ) ( CLEAR ?AUTO_2876 ) ( ON ?AUTO_2877 ?AUTO_2873 ) ( ON ?AUTO_2870 ?AUTO_2877 ) ( CLEAR ?AUTO_2870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2870 ?AUTO_2877 )
      ( MAKE-ON ?AUTO_2870 ?AUTO_2871 )
      ( MAKE-ON-VERIFY ?AUTO_2870 ?AUTO_2871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2880 - BLOCK
      ?AUTO_2881 - BLOCK
    )
    :vars
    (
      ?AUTO_2885 - BLOCK
      ?AUTO_2887 - BLOCK
      ?AUTO_2884 - BLOCK
      ?AUTO_2886 - BLOCK
      ?AUTO_2889 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2885 ) ( ON ?AUTO_2887 ?AUTO_2881 ) ( ON ?AUTO_2884 ?AUTO_2887 ) ( ON ?AUTO_2880 ?AUTO_2884 ) ( CLEAR ?AUTO_2880 ) ( HOLDING ?AUTO_2886 ) ( CLEAR ?AUTO_2889 ) )
    :subtasks
    ( ( !STACK ?AUTO_2886 ?AUTO_2889 )
      ( MAKE-ON ?AUTO_2880 ?AUTO_2881 )
      ( MAKE-ON-VERIFY ?AUTO_2880 ?AUTO_2881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2890 - BLOCK
      ?AUTO_2891 - BLOCK
    )
    :vars
    (
      ?AUTO_2897 - BLOCK
      ?AUTO_2896 - BLOCK
      ?AUTO_2892 - BLOCK
      ?AUTO_2893 - BLOCK
      ?AUTO_2898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2897 ) ( ON ?AUTO_2896 ?AUTO_2891 ) ( ON ?AUTO_2892 ?AUTO_2896 ) ( ON ?AUTO_2890 ?AUTO_2892 ) ( CLEAR ?AUTO_2893 ) ( ON ?AUTO_2898 ?AUTO_2890 ) ( CLEAR ?AUTO_2898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2898 ?AUTO_2890 )
      ( MAKE-ON ?AUTO_2890 ?AUTO_2891 )
      ( MAKE-ON-VERIFY ?AUTO_2890 ?AUTO_2891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2901 - BLOCK
      ?AUTO_2902 - BLOCK
    )
    :vars
    (
      ?AUTO_2906 - BLOCK
      ?AUTO_2907 - BLOCK
      ?AUTO_2903 - BLOCK
      ?AUTO_2909 - BLOCK
      ?AUTO_2904 - BLOCK
      ?AUTO_2911 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2906 ?AUTO_2902 ) ( ON ?AUTO_2907 ?AUTO_2906 ) ( ON ?AUTO_2901 ?AUTO_2907 ) ( CLEAR ?AUTO_2903 ) ( ON ?AUTO_2909 ?AUTO_2901 ) ( CLEAR ?AUTO_2909 ) ( HOLDING ?AUTO_2904 ) ( CLEAR ?AUTO_2911 ) )
    :subtasks
    ( ( !STACK ?AUTO_2904 ?AUTO_2911 )
      ( MAKE-ON ?AUTO_2901 ?AUTO_2902 )
      ( MAKE-ON-VERIFY ?AUTO_2901 ?AUTO_2902 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2927 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2927 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2927 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2927 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2929 - BLOCK
    )
    :vars
    (
      ?AUTO_2932 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2929 ?AUTO_2932 ) ( CLEAR ?AUTO_2929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2929 ?AUTO_2932 )
      ( MAKE-ON-TABLE ?AUTO_2929 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2929 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2933 - BLOCK
    )
    :vars
    (
      ?AUTO_2934 - BLOCK
      ?AUTO_2936 - BLOCK
      ?AUTO_2937 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2933 ?AUTO_2934 ) ( CLEAR ?AUTO_2933 ) ( HOLDING ?AUTO_2936 ) ( CLEAR ?AUTO_2937 ) )
    :subtasks
    ( ( !STACK ?AUTO_2936 ?AUTO_2937 )
      ( MAKE-ON-TABLE ?AUTO_2933 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2933 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2944 - BLOCK
    )
    :vars
    (
      ?AUTO_2946 - BLOCK
      ?AUTO_2948 - BLOCK
      ?AUTO_2947 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2944 ?AUTO_2946 ) ( CLEAR ?AUTO_2948 ) ( ON ?AUTO_2947 ?AUTO_2944 ) ( CLEAR ?AUTO_2947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2947 ?AUTO_2944 )
      ( MAKE-ON-TABLE ?AUTO_2944 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2944 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2951 - BLOCK
    )
    :vars
    (
      ?AUTO_2953 - BLOCK
      ?AUTO_2954 - BLOCK
      ?AUTO_2955 - BLOCK
      ?AUTO_2956 - BLOCK
      ?AUTO_2957 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2951 ?AUTO_2953 ) ( CLEAR ?AUTO_2954 ) ( ON ?AUTO_2955 ?AUTO_2951 ) ( CLEAR ?AUTO_2955 ) ( HOLDING ?AUTO_2956 ) ( CLEAR ?AUTO_2957 ) )
    :subtasks
    ( ( !STACK ?AUTO_2956 ?AUTO_2957 )
      ( MAKE-ON-TABLE ?AUTO_2951 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2951 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2958 - BLOCK
    )
    :vars
    (
      ?AUTO_2960 - BLOCK
      ?AUTO_2963 - BLOCK
      ?AUTO_2959 - BLOCK
      ?AUTO_2964 - BLOCK
      ?AUTO_2962 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2958 ?AUTO_2960 ) ( CLEAR ?AUTO_2963 ) ( ON ?AUTO_2959 ?AUTO_2958 ) ( CLEAR ?AUTO_2964 ) ( ON ?AUTO_2962 ?AUTO_2959 ) ( CLEAR ?AUTO_2962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2962 ?AUTO_2959 )
      ( MAKE-ON-TABLE ?AUTO_2958 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2958 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2967 - BLOCK
    )
    :vars
    (
      ?AUTO_2970 - BLOCK
      ?AUTO_2973 - BLOCK
      ?AUTO_2969 - BLOCK
      ?AUTO_2968 - BLOCK
      ?AUTO_2972 - BLOCK
      ?AUTO_2974 - BLOCK
      ?AUTO_2975 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2967 ?AUTO_2970 ) ( CLEAR ?AUTO_2973 ) ( ON ?AUTO_2969 ?AUTO_2967 ) ( CLEAR ?AUTO_2968 ) ( ON ?AUTO_2972 ?AUTO_2969 ) ( CLEAR ?AUTO_2972 ) ( HOLDING ?AUTO_2974 ) ( CLEAR ?AUTO_2975 ) )
    :subtasks
    ( ( !STACK ?AUTO_2974 ?AUTO_2975 )
      ( MAKE-ON-TABLE ?AUTO_2967 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2967 ) )
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
    :vars
    (
      ?AUTO_2994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2990 ) ( ON ?AUTO_2989 ?AUTO_2994 ) ( CLEAR ?AUTO_2989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2989 ?AUTO_2994 )
      ( MAKE-ON ?AUTO_2989 ?AUTO_2990 )
      ( MAKE-ON-VERIFY ?AUTO_2989 ?AUTO_2990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2995 - BLOCK
      ?AUTO_2996 - BLOCK
    )
    :vars
    (
      ?AUTO_2999 - BLOCK
      ?AUTO_3000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2996 ) ( ON ?AUTO_2995 ?AUTO_2999 ) ( CLEAR ?AUTO_2995 ) ( HOLDING ?AUTO_3000 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3000 )
      ( MAKE-ON ?AUTO_2995 ?AUTO_2996 )
      ( MAKE-ON-VERIFY ?AUTO_2995 ?AUTO_2996 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3001 - BLOCK
      ?AUTO_3002 - BLOCK
    )
    :vars
    (
      ?AUTO_3005 - BLOCK
      ?AUTO_3006 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3002 ) ( ON ?AUTO_3001 ?AUTO_3005 ) ( ON ?AUTO_3006 ?AUTO_3001 ) ( CLEAR ?AUTO_3006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3006 ?AUTO_3001 )
      ( MAKE-ON ?AUTO_3001 ?AUTO_3002 )
      ( MAKE-ON-VERIFY ?AUTO_3001 ?AUTO_3002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3009 - BLOCK
      ?AUTO_3010 - BLOCK
    )
    :vars
    (
      ?AUTO_3014 - BLOCK
      ?AUTO_3011 - BLOCK
      ?AUTO_3015 - BLOCK
      ?AUTO_3016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3010 ) ( ON ?AUTO_3009 ?AUTO_3014 ) ( ON ?AUTO_3011 ?AUTO_3009 ) ( CLEAR ?AUTO_3011 ) ( HOLDING ?AUTO_3015 ) ( CLEAR ?AUTO_3016 ) )
    :subtasks
    ( ( !STACK ?AUTO_3015 ?AUTO_3016 )
      ( MAKE-ON ?AUTO_3009 ?AUTO_3010 )
      ( MAKE-ON-VERIFY ?AUTO_3009 ?AUTO_3010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3019 - BLOCK
      ?AUTO_3020 - BLOCK
    )
    :vars
    (
      ?AUTO_3021 - BLOCK
      ?AUTO_3022 - BLOCK
      ?AUTO_3026 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3019 ?AUTO_3021 ) ( ON ?AUTO_3022 ?AUTO_3019 ) ( CLEAR ?AUTO_3022 ) ( HOLDING ?AUTO_3020 ) ( CLEAR ?AUTO_3026 ) )
    :subtasks
    ( ( !STACK ?AUTO_3020 ?AUTO_3026 )
      ( MAKE-ON ?AUTO_3019 ?AUTO_3020 )
      ( MAKE-ON-VERIFY ?AUTO_3019 ?AUTO_3020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3031 - BLOCK
      ?AUTO_3032 - BLOCK
    )
    :vars
    (
      ?AUTO_3036 - BLOCK
      ?AUTO_3034 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3031 ?AUTO_3036 ) ( CLEAR ?AUTO_3031 ) ( ON ?AUTO_3034 ?AUTO_3032 ) ( CLEAR ?AUTO_3034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3034 ?AUTO_3032 )
      ( MAKE-ON ?AUTO_3031 ?AUTO_3032 )
      ( MAKE-ON-VERIFY ?AUTO_3031 ?AUTO_3032 ) )
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
      ?AUTO_3043 - BLOCK
      ?AUTO_3045 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3039 ?AUTO_3044 ) ( CLEAR ?AUTO_3039 ) ( ON ?AUTO_3043 ?AUTO_3040 ) ( CLEAR ?AUTO_3043 ) ( HOLDING ?AUTO_3045 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3045 )
      ( MAKE-ON ?AUTO_3039 ?AUTO_3040 )
      ( MAKE-ON-VERIFY ?AUTO_3039 ?AUTO_3040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3046 - BLOCK
      ?AUTO_3047 - BLOCK
    )
    :vars
    (
      ?AUTO_3050 - BLOCK
      ?AUTO_3051 - BLOCK
      ?AUTO_3052 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3046 ?AUTO_3050 ) ( CLEAR ?AUTO_3046 ) ( ON ?AUTO_3051 ?AUTO_3047 ) ( ON ?AUTO_3052 ?AUTO_3051 ) ( CLEAR ?AUTO_3052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3052 ?AUTO_3051 )
      ( MAKE-ON ?AUTO_3046 ?AUTO_3047 )
      ( MAKE-ON-VERIFY ?AUTO_3046 ?AUTO_3047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3077 - BLOCK
      ?AUTO_3078 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3077 ) ( CLEAR ?AUTO_3078 ) )
    :subtasks
    ( ( !STACK ?AUTO_3077 ?AUTO_3078 )
      ( MAKE-ON-VERIFY ?AUTO_3077 ?AUTO_3078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3081 - BLOCK
      ?AUTO_3082 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3082 ) ( ON-TABLE ?AUTO_3081 ) ( CLEAR ?AUTO_3081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3081 )
      ( MAKE-ON ?AUTO_3081 ?AUTO_3082 )
      ( MAKE-ON-VERIFY ?AUTO_3081 ?AUTO_3082 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3086 - BLOCK
      ?AUTO_3087 - BLOCK
    )
    :vars
    (
      ?AUTO_3091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3086 ) ( CLEAR ?AUTO_3086 ) ( HOLDING ?AUTO_3087 ) ( CLEAR ?AUTO_3091 ) )
    :subtasks
    ( ( !STACK ?AUTO_3087 ?AUTO_3091 )
      ( MAKE-ON ?AUTO_3086 ?AUTO_3087 )
      ( MAKE-ON-VERIFY ?AUTO_3086 ?AUTO_3087 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3172 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3172 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3172 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3172 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3174 - BLOCK
    )
    :vars
    (
      ?AUTO_3177 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3174 ?AUTO_3177 ) ( CLEAR ?AUTO_3174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3174 ?AUTO_3177 )
      ( MAKE-ON-TABLE ?AUTO_3174 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3174 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3178 - BLOCK
    )
    :vars
    (
      ?AUTO_3180 - BLOCK
      ?AUTO_3181 - BLOCK
      ?AUTO_3182 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3178 ?AUTO_3180 ) ( CLEAR ?AUTO_3178 ) ( HOLDING ?AUTO_3181 ) ( CLEAR ?AUTO_3182 ) )
    :subtasks
    ( ( !STACK ?AUTO_3181 ?AUTO_3182 )
      ( MAKE-ON-TABLE ?AUTO_3178 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3238 - BLOCK
      ?AUTO_3239 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3238 ) ( CLEAR ?AUTO_3239 ) )
    :subtasks
    ( ( !STACK ?AUTO_3238 ?AUTO_3239 )
      ( MAKE-ON-VERIFY ?AUTO_3238 ?AUTO_3239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3242 - BLOCK
      ?AUTO_3243 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3243 ) ( ON-TABLE ?AUTO_3242 ) ( CLEAR ?AUTO_3242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3242 )
      ( MAKE-ON ?AUTO_3242 ?AUTO_3243 )
      ( MAKE-ON-VERIFY ?AUTO_3242 ?AUTO_3243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3247 - BLOCK
      ?AUTO_3248 - BLOCK
    )
    :vars
    (
      ?AUTO_3251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3248 ) ( ON-TABLE ?AUTO_3247 ) ( CLEAR ?AUTO_3247 ) ( HOLDING ?AUTO_3251 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3251 )
      ( MAKE-ON ?AUTO_3247 ?AUTO_3248 )
      ( MAKE-ON-VERIFY ?AUTO_3247 ?AUTO_3248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3252 - BLOCK
      ?AUTO_3253 - BLOCK
    )
    :vars
    (
      ?AUTO_3256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3253 ) ( ON-TABLE ?AUTO_3252 ) ( ON ?AUTO_3256 ?AUTO_3252 ) ( CLEAR ?AUTO_3256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3256 ?AUTO_3252 )
      ( MAKE-ON ?AUTO_3252 ?AUTO_3253 )
      ( MAKE-ON-VERIFY ?AUTO_3252 ?AUTO_3253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3259 - BLOCK
      ?AUTO_3260 - BLOCK
    )
    :vars
    (
      ?AUTO_3262 - BLOCK
      ?AUTO_3264 - BLOCK
      ?AUTO_3265 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3260 ) ( ON-TABLE ?AUTO_3259 ) ( ON ?AUTO_3262 ?AUTO_3259 ) ( CLEAR ?AUTO_3262 ) ( HOLDING ?AUTO_3264 ) ( CLEAR ?AUTO_3265 ) )
    :subtasks
    ( ( !STACK ?AUTO_3264 ?AUTO_3265 )
      ( MAKE-ON ?AUTO_3259 ?AUTO_3260 )
      ( MAKE-ON-VERIFY ?AUTO_3259 ?AUTO_3260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3270 - BLOCK
      ?AUTO_3271 - BLOCK
    )
    :vars
    (
      ?AUTO_3275 - BLOCK
      ?AUTO_3276 - BLOCK
      ?AUTO_3273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3270 ) ( ON ?AUTO_3275 ?AUTO_3270 ) ( CLEAR ?AUTO_3275 ) ( CLEAR ?AUTO_3276 ) ( ON ?AUTO_3273 ?AUTO_3271 ) ( CLEAR ?AUTO_3273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3273 ?AUTO_3271 )
      ( MAKE-ON ?AUTO_3270 ?AUTO_3271 )
      ( MAKE-ON-VERIFY ?AUTO_3270 ?AUTO_3271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3279 - BLOCK
      ?AUTO_3280 - BLOCK
    )
    :vars
    (
      ?AUTO_3285 - BLOCK
      ?AUTO_3284 - BLOCK
      ?AUTO_3283 - BLOCK
      ?AUTO_3286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3279 ) ( ON ?AUTO_3285 ?AUTO_3279 ) ( CLEAR ?AUTO_3285 ) ( CLEAR ?AUTO_3284 ) ( ON ?AUTO_3283 ?AUTO_3280 ) ( CLEAR ?AUTO_3283 ) ( HOLDING ?AUTO_3286 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3286 )
      ( MAKE-ON ?AUTO_3279 ?AUTO_3280 )
      ( MAKE-ON-VERIFY ?AUTO_3279 ?AUTO_3280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3287 - BLOCK
      ?AUTO_3288 - BLOCK
    )
    :vars
    (
      ?AUTO_3293 - BLOCK
      ?AUTO_3289 - BLOCK
      ?AUTO_3294 - BLOCK
      ?AUTO_3292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3287 ) ( ON ?AUTO_3293 ?AUTO_3287 ) ( CLEAR ?AUTO_3293 ) ( CLEAR ?AUTO_3289 ) ( ON ?AUTO_3294 ?AUTO_3288 ) ( ON ?AUTO_3292 ?AUTO_3294 ) ( CLEAR ?AUTO_3292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3292 ?AUTO_3294 )
      ( MAKE-ON ?AUTO_3287 ?AUTO_3288 )
      ( MAKE-ON-VERIFY ?AUTO_3287 ?AUTO_3288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3297 - BLOCK
      ?AUTO_3298 - BLOCK
    )
    :vars
    (
      ?AUTO_3300 - BLOCK
      ?AUTO_3301 - BLOCK
      ?AUTO_3304 - BLOCK
      ?AUTO_3303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3297 ) ( CLEAR ?AUTO_3300 ) ( ON ?AUTO_3301 ?AUTO_3298 ) ( ON ?AUTO_3304 ?AUTO_3301 ) ( CLEAR ?AUTO_3304 ) ( HOLDING ?AUTO_3303 ) ( CLEAR ?AUTO_3297 ) )
    :subtasks
    ( ( !STACK ?AUTO_3303 ?AUTO_3297 )
      ( MAKE-ON ?AUTO_3297 ?AUTO_3298 )
      ( MAKE-ON-VERIFY ?AUTO_3297 ?AUTO_3298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3307 - BLOCK
      ?AUTO_3308 - BLOCK
    )
    :vars
    (
      ?AUTO_3312 - BLOCK
      ?AUTO_3309 - BLOCK
      ?AUTO_3310 - BLOCK
      ?AUTO_3311 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3307 ) ( CLEAR ?AUTO_3312 ) ( ON ?AUTO_3309 ?AUTO_3308 ) ( ON ?AUTO_3310 ?AUTO_3309 ) ( CLEAR ?AUTO_3310 ) ( CLEAR ?AUTO_3307 ) ( ON-TABLE ?AUTO_3311 ) ( CLEAR ?AUTO_3311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3311 )
      ( MAKE-ON ?AUTO_3307 ?AUTO_3308 )
      ( MAKE-ON-VERIFY ?AUTO_3307 ?AUTO_3308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3322 - BLOCK
      ?AUTO_3323 - BLOCK
    )
    :vars
    (
      ?AUTO_3326 - BLOCK
      ?AUTO_3329 - BLOCK
      ?AUTO_3324 - BLOCK
      ?AUTO_3328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3322 ) ( ON ?AUTO_3326 ?AUTO_3322 ) ( CLEAR ?AUTO_3329 ) ( ON ?AUTO_3324 ?AUTO_3323 ) ( CLEAR ?AUTO_3324 ) ( ON ?AUTO_3328 ?AUTO_3326 ) ( CLEAR ?AUTO_3328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3328 ?AUTO_3326 )
      ( MAKE-ON ?AUTO_3322 ?AUTO_3323 )
      ( MAKE-ON-VERIFY ?AUTO_3322 ?AUTO_3323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3332 - BLOCK
      ?AUTO_3333 - BLOCK
    )
    :vars
    (
      ?AUTO_3336 - BLOCK
      ?AUTO_3339 - BLOCK
      ?AUTO_3337 - BLOCK
      ?AUTO_3338 - BLOCK
      ?AUTO_3340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3332 ) ( ON ?AUTO_3336 ?AUTO_3332 ) ( CLEAR ?AUTO_3339 ) ( ON ?AUTO_3337 ?AUTO_3333 ) ( CLEAR ?AUTO_3337 ) ( ON ?AUTO_3338 ?AUTO_3336 ) ( CLEAR ?AUTO_3338 ) ( HOLDING ?AUTO_3340 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3340 )
      ( MAKE-ON ?AUTO_3332 ?AUTO_3333 )
      ( MAKE-ON-VERIFY ?AUTO_3332 ?AUTO_3333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3341 - BLOCK
      ?AUTO_3342 - BLOCK
    )
    :vars
    (
      ?AUTO_3344 - BLOCK
      ?AUTO_3343 - BLOCK
      ?AUTO_3345 - BLOCK
      ?AUTO_3348 - BLOCK
      ?AUTO_3349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3341 ) ( ON ?AUTO_3344 ?AUTO_3341 ) ( CLEAR ?AUTO_3343 ) ( ON ?AUTO_3345 ?AUTO_3342 ) ( CLEAR ?AUTO_3345 ) ( ON ?AUTO_3348 ?AUTO_3344 ) ( ON ?AUTO_3349 ?AUTO_3348 ) ( CLEAR ?AUTO_3349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3349 ?AUTO_3348 )
      ( MAKE-ON ?AUTO_3341 ?AUTO_3342 )
      ( MAKE-ON-VERIFY ?AUTO_3341 ?AUTO_3342 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3352 - BLOCK
      ?AUTO_3353 - BLOCK
    )
    :vars
    (
      ?AUTO_3355 - BLOCK
      ?AUTO_3357 - BLOCK
      ?AUTO_3360 - BLOCK
      ?AUTO_3358 - BLOCK
      ?AUTO_3356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3352 ) ( ON ?AUTO_3355 ?AUTO_3352 ) ( CLEAR ?AUTO_3357 ) ( ON ?AUTO_3360 ?AUTO_3355 ) ( ON ?AUTO_3358 ?AUTO_3360 ) ( CLEAR ?AUTO_3358 ) ( HOLDING ?AUTO_3356 ) ( CLEAR ?AUTO_3353 ) )
    :subtasks
    ( ( !STACK ?AUTO_3356 ?AUTO_3353 )
      ( MAKE-ON ?AUTO_3352 ?AUTO_3353 )
      ( MAKE-ON-VERIFY ?AUTO_3352 ?AUTO_3353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3363 - BLOCK
      ?AUTO_3364 - BLOCK
    )
    :vars
    (
      ?AUTO_3367 - BLOCK
      ?AUTO_3368 - BLOCK
      ?AUTO_3371 - BLOCK
      ?AUTO_3366 - BLOCK
      ?AUTO_3365 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3363 ) ( ON ?AUTO_3367 ?AUTO_3363 ) ( CLEAR ?AUTO_3368 ) ( ON ?AUTO_3371 ?AUTO_3367 ) ( ON ?AUTO_3366 ?AUTO_3371 ) ( CLEAR ?AUTO_3364 ) ( ON ?AUTO_3365 ?AUTO_3366 ) ( CLEAR ?AUTO_3365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3365 ?AUTO_3366 )
      ( MAKE-ON ?AUTO_3363 ?AUTO_3364 )
      ( MAKE-ON-VERIFY ?AUTO_3363 ?AUTO_3364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3374 - BLOCK
      ?AUTO_3375 - BLOCK
    )
    :vars
    (
      ?AUTO_3379 - BLOCK
      ?AUTO_3380 - BLOCK
      ?AUTO_3376 - BLOCK
      ?AUTO_3382 - BLOCK
      ?AUTO_3381 - BLOCK
      ?AUTO_3383 - BLOCK
      ?AUTO_3384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3374 ) ( ON ?AUTO_3379 ?AUTO_3374 ) ( CLEAR ?AUTO_3380 ) ( ON ?AUTO_3376 ?AUTO_3379 ) ( ON ?AUTO_3382 ?AUTO_3376 ) ( CLEAR ?AUTO_3375 ) ( ON ?AUTO_3381 ?AUTO_3382 ) ( CLEAR ?AUTO_3381 ) ( HOLDING ?AUTO_3383 ) ( CLEAR ?AUTO_3384 ) )
    :subtasks
    ( ( !STACK ?AUTO_3383 ?AUTO_3384 )
      ( MAKE-ON ?AUTO_3374 ?AUTO_3375 )
      ( MAKE-ON-VERIFY ?AUTO_3374 ?AUTO_3375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3387 - BLOCK
      ?AUTO_3388 - BLOCK
    )
    :vars
    (
      ?AUTO_3391 - BLOCK
      ?AUTO_3393 - BLOCK
      ?AUTO_3390 - BLOCK
      ?AUTO_3395 - BLOCK
      ?AUTO_3392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3387 ) ( ON ?AUTO_3391 ?AUTO_3387 ) ( CLEAR ?AUTO_3393 ) ( ON ?AUTO_3390 ?AUTO_3391 ) ( ON ?AUTO_3395 ?AUTO_3390 ) ( ON ?AUTO_3392 ?AUTO_3395 ) ( CLEAR ?AUTO_3392 ) ( HOLDING ?AUTO_3388 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3388 )
      ( MAKE-ON ?AUTO_3387 ?AUTO_3388 )
      ( MAKE-ON-VERIFY ?AUTO_3387 ?AUTO_3388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3401 - BLOCK
      ?AUTO_3402 - BLOCK
    )
    :vars
    (
      ?AUTO_3411 - BLOCK
      ?AUTO_3407 - BLOCK
      ?AUTO_3408 - BLOCK
      ?AUTO_3403 - BLOCK
      ?AUTO_3406 - BLOCK
      ?AUTO_3410 - BLOCK
      ?AUTO_3405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3401 ) ( ON ?AUTO_3411 ?AUTO_3401 ) ( CLEAR ?AUTO_3407 ) ( ON ?AUTO_3408 ?AUTO_3411 ) ( ON ?AUTO_3403 ?AUTO_3408 ) ( ON ?AUTO_3406 ?AUTO_3403 ) ( CLEAR ?AUTO_3406 ) ( CLEAR ?AUTO_3410 ) ( ON ?AUTO_3405 ?AUTO_3402 ) ( CLEAR ?AUTO_3405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3405 ?AUTO_3402 )
      ( MAKE-ON ?AUTO_3401 ?AUTO_3402 )
      ( MAKE-ON-VERIFY ?AUTO_3401 ?AUTO_3402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3414 - BLOCK
      ?AUTO_3415 - BLOCK
    )
    :vars
    (
      ?AUTO_3421 - BLOCK
      ?AUTO_3424 - BLOCK
      ?AUTO_3418 - BLOCK
      ?AUTO_3423 - BLOCK
      ?AUTO_3420 - BLOCK
      ?AUTO_3419 - BLOCK
      ?AUTO_3422 - BLOCK
      ?AUTO_3425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3414 ) ( ON ?AUTO_3421 ?AUTO_3414 ) ( CLEAR ?AUTO_3424 ) ( ON ?AUTO_3418 ?AUTO_3421 ) ( ON ?AUTO_3423 ?AUTO_3418 ) ( ON ?AUTO_3420 ?AUTO_3423 ) ( CLEAR ?AUTO_3420 ) ( CLEAR ?AUTO_3419 ) ( ON ?AUTO_3422 ?AUTO_3415 ) ( CLEAR ?AUTO_3422 ) ( HOLDING ?AUTO_3425 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3425 )
      ( MAKE-ON ?AUTO_3414 ?AUTO_3415 )
      ( MAKE-ON-VERIFY ?AUTO_3414 ?AUTO_3415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3426 - BLOCK
      ?AUTO_3427 - BLOCK
    )
    :vars
    (
      ?AUTO_3437 - BLOCK
      ?AUTO_3433 - BLOCK
      ?AUTO_3432 - BLOCK
      ?AUTO_3428 - BLOCK
      ?AUTO_3436 - BLOCK
      ?AUTO_3429 - BLOCK
      ?AUTO_3434 - BLOCK
      ?AUTO_3435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3426 ) ( ON ?AUTO_3437 ?AUTO_3426 ) ( CLEAR ?AUTO_3433 ) ( ON ?AUTO_3432 ?AUTO_3437 ) ( ON ?AUTO_3428 ?AUTO_3432 ) ( ON ?AUTO_3436 ?AUTO_3428 ) ( CLEAR ?AUTO_3436 ) ( CLEAR ?AUTO_3429 ) ( ON ?AUTO_3434 ?AUTO_3427 ) ( ON ?AUTO_3435 ?AUTO_3434 ) ( CLEAR ?AUTO_3435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3435 ?AUTO_3434 )
      ( MAKE-ON ?AUTO_3426 ?AUTO_3427 )
      ( MAKE-ON-VERIFY ?AUTO_3426 ?AUTO_3427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3442 - BLOCK
      ?AUTO_3443 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3442 ) ( CLEAR ?AUTO_3443 ) )
    :subtasks
    ( ( !STACK ?AUTO_3442 ?AUTO_3443 )
      ( MAKE-ON-VERIFY ?AUTO_3442 ?AUTO_3443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3446 - BLOCK
      ?AUTO_3447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3447 ) ( ON-TABLE ?AUTO_3446 ) ( CLEAR ?AUTO_3446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3446 )
      ( MAKE-ON ?AUTO_3446 ?AUTO_3447 )
      ( MAKE-ON-VERIFY ?AUTO_3446 ?AUTO_3447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3451 - BLOCK
      ?AUTO_3452 - BLOCK
    )
    :vars
    (
      ?AUTO_3456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3451 ) ( CLEAR ?AUTO_3451 ) ( HOLDING ?AUTO_3452 ) ( CLEAR ?AUTO_3456 ) )
    :subtasks
    ( ( !STACK ?AUTO_3452 ?AUTO_3456 )
      ( MAKE-ON ?AUTO_3451 ?AUTO_3452 )
      ( MAKE-ON-VERIFY ?AUTO_3451 ?AUTO_3452 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3458 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3458 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3458 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3458 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3460 - BLOCK
    )
    :vars
    (
      ?AUTO_3463 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3460 ?AUTO_3463 ) ( CLEAR ?AUTO_3460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3460 ?AUTO_3463 )
      ( MAKE-ON-TABLE ?AUTO_3460 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3466 - BLOCK
      ?AUTO_3467 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3466 ) ( CLEAR ?AUTO_3467 ) )
    :subtasks
    ( ( !STACK ?AUTO_3466 ?AUTO_3467 )
      ( MAKE-ON-VERIFY ?AUTO_3466 ?AUTO_3467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3470 - BLOCK
      ?AUTO_3471 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3471 ) ( ON-TABLE ?AUTO_3470 ) ( CLEAR ?AUTO_3470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3470 )
      ( MAKE-ON ?AUTO_3470 ?AUTO_3471 )
      ( MAKE-ON-VERIFY ?AUTO_3470 ?AUTO_3471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3475 - BLOCK
      ?AUTO_3476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3475 ) ( CLEAR ?AUTO_3475 ) ( HOLDING ?AUTO_3476 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3476 )
      ( MAKE-ON ?AUTO_3475 ?AUTO_3476 )
      ( MAKE-ON-VERIFY ?AUTO_3475 ?AUTO_3476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3484 - BLOCK
      ?AUTO_3485 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3484 ) ( CLEAR ?AUTO_3485 ) )
    :subtasks
    ( ( !STACK ?AUTO_3484 ?AUTO_3485 )
      ( MAKE-ON-VERIFY ?AUTO_3484 ?AUTO_3485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3488 - BLOCK
      ?AUTO_3489 - BLOCK
    )
    :vars
    (
      ?AUTO_3493 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3489 ) ( ON ?AUTO_3488 ?AUTO_3493 ) ( CLEAR ?AUTO_3488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3488 ?AUTO_3493 )
      ( MAKE-ON ?AUTO_3488 ?AUTO_3489 )
      ( MAKE-ON-VERIFY ?AUTO_3488 ?AUTO_3489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3494 - BLOCK
      ?AUTO_3495 - BLOCK
    )
    :vars
    (
      ?AUTO_3498 - BLOCK
      ?AUTO_3499 - BLOCK
      ?AUTO_3500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3495 ) ( ON ?AUTO_3494 ?AUTO_3498 ) ( CLEAR ?AUTO_3494 ) ( HOLDING ?AUTO_3499 ) ( CLEAR ?AUTO_3500 ) )
    :subtasks
    ( ( !STACK ?AUTO_3499 ?AUTO_3500 )
      ( MAKE-ON ?AUTO_3494 ?AUTO_3495 )
      ( MAKE-ON-VERIFY ?AUTO_3494 ?AUTO_3495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3505 - BLOCK
      ?AUTO_3506 - BLOCK
    )
    :vars
    (
      ?AUTO_3507 - BLOCK
      ?AUTO_3510 - BLOCK
      ?AUTO_3511 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3506 ) ( ON ?AUTO_3505 ?AUTO_3507 ) ( CLEAR ?AUTO_3510 ) ( ON ?AUTO_3511 ?AUTO_3505 ) ( CLEAR ?AUTO_3511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3511 ?AUTO_3505 )
      ( MAKE-ON ?AUTO_3505 ?AUTO_3506 )
      ( MAKE-ON-VERIFY ?AUTO_3505 ?AUTO_3506 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3516 - BLOCK
      ?AUTO_3517 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3516 ) ( CLEAR ?AUTO_3517 ) )
    :subtasks
    ( ( !STACK ?AUTO_3516 ?AUTO_3517 )
      ( MAKE-ON-VERIFY ?AUTO_3516 ?AUTO_3517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3520 - BLOCK
      ?AUTO_3521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3521 ) ( ON-TABLE ?AUTO_3520 ) ( CLEAR ?AUTO_3520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3520 )
      ( MAKE-ON ?AUTO_3520 ?AUTO_3521 )
      ( MAKE-ON-VERIFY ?AUTO_3520 ?AUTO_3521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3525 - BLOCK
      ?AUTO_3526 - BLOCK
    )
    :vars
    (
      ?AUTO_3530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3525 ) ( CLEAR ?AUTO_3525 ) ( HOLDING ?AUTO_3526 ) ( CLEAR ?AUTO_3530 ) )
    :subtasks
    ( ( !STACK ?AUTO_3526 ?AUTO_3530 )
      ( MAKE-ON ?AUTO_3525 ?AUTO_3526 )
      ( MAKE-ON-VERIFY ?AUTO_3525 ?AUTO_3526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3531 - BLOCK
      ?AUTO_3532 - BLOCK
    )
    :vars
    (
      ?AUTO_3535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3531 ) ( CLEAR ?AUTO_3535 ) ( ON ?AUTO_3532 ?AUTO_3531 ) ( CLEAR ?AUTO_3532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3532 ?AUTO_3531 )
      ( MAKE-ON ?AUTO_3531 ?AUTO_3532 )
      ( MAKE-ON-VERIFY ?AUTO_3531 ?AUTO_3532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3538 - BLOCK
      ?AUTO_3539 - BLOCK
    )
    :vars
    (
      ?AUTO_3540 - BLOCK
      ?AUTO_3543 - BLOCK
      ?AUTO_3544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3538 ) ( CLEAR ?AUTO_3540 ) ( ON ?AUTO_3539 ?AUTO_3538 ) ( CLEAR ?AUTO_3539 ) ( HOLDING ?AUTO_3543 ) ( CLEAR ?AUTO_3544 ) )
    :subtasks
    ( ( !STACK ?AUTO_3543 ?AUTO_3544 )
      ( MAKE-ON ?AUTO_3538 ?AUTO_3539 )
      ( MAKE-ON-VERIFY ?AUTO_3538 ?AUTO_3539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3549 - BLOCK
      ?AUTO_3550 - BLOCK
    )
    :vars
    (
      ?AUTO_3553 - BLOCK
      ?AUTO_3555 - BLOCK
      ?AUTO_3554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3549 ) ( CLEAR ?AUTO_3553 ) ( ON ?AUTO_3550 ?AUTO_3549 ) ( CLEAR ?AUTO_3555 ) ( ON ?AUTO_3554 ?AUTO_3550 ) ( CLEAR ?AUTO_3554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3554 ?AUTO_3550 )
      ( MAKE-ON ?AUTO_3549 ?AUTO_3550 )
      ( MAKE-ON-VERIFY ?AUTO_3549 ?AUTO_3550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3560 - BLOCK
      ?AUTO_3561 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3560 ) ( CLEAR ?AUTO_3561 ) )
    :subtasks
    ( ( !STACK ?AUTO_3560 ?AUTO_3561 )
      ( MAKE-ON-VERIFY ?AUTO_3560 ?AUTO_3561 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3564 - BLOCK
      ?AUTO_3565 - BLOCK
    )
    :vars
    (
      ?AUTO_3569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3565 ) ( ON ?AUTO_3564 ?AUTO_3569 ) ( CLEAR ?AUTO_3564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3564 ?AUTO_3569 )
      ( MAKE-ON ?AUTO_3564 ?AUTO_3565 )
      ( MAKE-ON-VERIFY ?AUTO_3564 ?AUTO_3565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3570 - BLOCK
      ?AUTO_3571 - BLOCK
    )
    :vars
    (
      ?AUTO_3574 - BLOCK
      ?AUTO_3576 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3570 ?AUTO_3574 ) ( CLEAR ?AUTO_3570 ) ( HOLDING ?AUTO_3571 ) ( CLEAR ?AUTO_3576 ) )
    :subtasks
    ( ( !STACK ?AUTO_3571 ?AUTO_3576 )
      ( MAKE-ON ?AUTO_3570 ?AUTO_3571 )
      ( MAKE-ON-VERIFY ?AUTO_3570 ?AUTO_3571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3579 - BLOCK
      ?AUTO_3580 - BLOCK
    )
    :vars
    (
      ?AUTO_3583 - BLOCK
      ?AUTO_3584 - BLOCK
      ?AUTO_3585 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3580 ) ( ON ?AUTO_3579 ?AUTO_3583 ) ( CLEAR ?AUTO_3579 ) ( HOLDING ?AUTO_3584 ) ( CLEAR ?AUTO_3585 ) )
    :subtasks
    ( ( !STACK ?AUTO_3584 ?AUTO_3585 )
      ( MAKE-ON ?AUTO_3579 ?AUTO_3580 )
      ( MAKE-ON-VERIFY ?AUTO_3579 ?AUTO_3580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3586 - BLOCK
      ?AUTO_3587 - BLOCK
    )
    :vars
    (
      ?AUTO_3590 - BLOCK
      ?AUTO_3592 - BLOCK
      ?AUTO_3591 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3586 ?AUTO_3590 ) ( CLEAR ?AUTO_3586 ) ( CLEAR ?AUTO_3592 ) ( ON ?AUTO_3591 ?AUTO_3587 ) ( CLEAR ?AUTO_3591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3591 ?AUTO_3587 )
      ( MAKE-ON ?AUTO_3586 ?AUTO_3587 )
      ( MAKE-ON-VERIFY ?AUTO_3586 ?AUTO_3587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3595 - BLOCK
      ?AUTO_3596 - BLOCK
    )
    :vars
    (
      ?AUTO_3601 - BLOCK
      ?AUTO_3597 - BLOCK
      ?AUTO_3600 - BLOCK
      ?AUTO_3602 - BLOCK
      ?AUTO_3603 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3595 ?AUTO_3601 ) ( CLEAR ?AUTO_3595 ) ( CLEAR ?AUTO_3597 ) ( ON ?AUTO_3600 ?AUTO_3596 ) ( CLEAR ?AUTO_3600 ) ( HOLDING ?AUTO_3602 ) ( CLEAR ?AUTO_3603 ) )
    :subtasks
    ( ( !STACK ?AUTO_3602 ?AUTO_3603 )
      ( MAKE-ON ?AUTO_3595 ?AUTO_3596 )
      ( MAKE-ON-VERIFY ?AUTO_3595 ?AUTO_3596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3608 - BLOCK
      ?AUTO_3609 - BLOCK
    )
    :vars
    (
      ?AUTO_3615 - BLOCK
      ?AUTO_3614 - BLOCK
      ?AUTO_3616 - BLOCK
      ?AUTO_3612 - BLOCK
      ?AUTO_3610 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3608 ?AUTO_3615 ) ( CLEAR ?AUTO_3608 ) ( CLEAR ?AUTO_3614 ) ( ON ?AUTO_3616 ?AUTO_3609 ) ( CLEAR ?AUTO_3612 ) ( ON ?AUTO_3610 ?AUTO_3616 ) ( CLEAR ?AUTO_3610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3610 ?AUTO_3616 )
      ( MAKE-ON ?AUTO_3608 ?AUTO_3609 )
      ( MAKE-ON-VERIFY ?AUTO_3608 ?AUTO_3609 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3620 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3620 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3620 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3620 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3622 - BLOCK
    )
    :vars
    (
      ?AUTO_3625 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3622 ?AUTO_3625 ) ( CLEAR ?AUTO_3622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3622 ?AUTO_3625 )
      ( MAKE-ON-TABLE ?AUTO_3622 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3622 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3626 - BLOCK
    )
    :vars
    (
      ?AUTO_3628 - BLOCK
      ?AUTO_3629 - BLOCK
      ?AUTO_3630 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3626 ?AUTO_3628 ) ( CLEAR ?AUTO_3626 ) ( HOLDING ?AUTO_3629 ) ( CLEAR ?AUTO_3630 ) )
    :subtasks
    ( ( !STACK ?AUTO_3629 ?AUTO_3630 )
      ( MAKE-ON-TABLE ?AUTO_3626 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3626 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3631 - BLOCK
    )
    :vars
    (
      ?AUTO_3633 - BLOCK
      ?AUTO_3635 - BLOCK
      ?AUTO_3634 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3631 ?AUTO_3633 ) ( CLEAR ?AUTO_3635 ) ( ON ?AUTO_3634 ?AUTO_3631 ) ( CLEAR ?AUTO_3634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3634 ?AUTO_3631 )
      ( MAKE-ON-TABLE ?AUTO_3631 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3631 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3638 - BLOCK
    )
    :vars
    (
      ?AUTO_3641 - BLOCK
      ?AUTO_3642 - BLOCK
      ?AUTO_3639 - BLOCK
      ?AUTO_3644 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3638 ?AUTO_3641 ) ( ON ?AUTO_3642 ?AUTO_3638 ) ( CLEAR ?AUTO_3642 ) ( HOLDING ?AUTO_3639 ) ( CLEAR ?AUTO_3644 ) )
    :subtasks
    ( ( !STACK ?AUTO_3639 ?AUTO_3644 )
      ( MAKE-ON-TABLE ?AUTO_3638 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3638 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3653 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3653 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3653 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3653 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3655 - BLOCK
    )
    :vars
    (
      ?AUTO_3658 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3655 ?AUTO_3658 ) ( CLEAR ?AUTO_3655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3655 ?AUTO_3658 )
      ( MAKE-ON-TABLE ?AUTO_3655 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3655 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3659 - BLOCK
    )
    :vars
    (
      ?AUTO_3661 - BLOCK
      ?AUTO_3662 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3659 ?AUTO_3661 ) ( CLEAR ?AUTO_3659 ) ( HOLDING ?AUTO_3662 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3662 )
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
    ( and ( ON ?AUTO_3663 ?AUTO_3665 ) ( ON ?AUTO_3666 ?AUTO_3663 ) ( CLEAR ?AUTO_3666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3666 ?AUTO_3663 )
      ( MAKE-ON-TABLE ?AUTO_3663 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3663 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3669 - BLOCK
    )
    :vars
    (
      ?AUTO_3670 - BLOCK
      ?AUTO_3671 - BLOCK
      ?AUTO_3673 - BLOCK
      ?AUTO_3674 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3669 ?AUTO_3670 ) ( ON ?AUTO_3671 ?AUTO_3669 ) ( CLEAR ?AUTO_3671 ) ( HOLDING ?AUTO_3673 ) ( CLEAR ?AUTO_3674 ) )
    :subtasks
    ( ( !STACK ?AUTO_3673 ?AUTO_3674 )
      ( MAKE-ON-TABLE ?AUTO_3669 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3669 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3675 - BLOCK
    )
    :vars
    (
      ?AUTO_3677 - BLOCK
      ?AUTO_3678 - BLOCK
      ?AUTO_3680 - BLOCK
      ?AUTO_3679 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3675 ?AUTO_3677 ) ( ON ?AUTO_3678 ?AUTO_3675 ) ( CLEAR ?AUTO_3680 ) ( ON ?AUTO_3679 ?AUTO_3678 ) ( CLEAR ?AUTO_3679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3679 ?AUTO_3678 )
      ( MAKE-ON-TABLE ?AUTO_3675 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3675 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3683 - BLOCK
    )
    :vars
    (
      ?AUTO_3688 - BLOCK
      ?AUTO_3685 - BLOCK
      ?AUTO_3684 - BLOCK
      ?AUTO_3686 - BLOCK
      ?AUTO_3690 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3683 ?AUTO_3688 ) ( ON ?AUTO_3685 ?AUTO_3683 ) ( ON ?AUTO_3684 ?AUTO_3685 ) ( CLEAR ?AUTO_3684 ) ( HOLDING ?AUTO_3686 ) ( CLEAR ?AUTO_3690 ) )
    :subtasks
    ( ( !STACK ?AUTO_3686 ?AUTO_3690 )
      ( MAKE-ON-TABLE ?AUTO_3683 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3700 - BLOCK
      ?AUTO_3701 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3700 ) ( CLEAR ?AUTO_3701 ) )
    :subtasks
    ( ( !STACK ?AUTO_3700 ?AUTO_3701 )
      ( MAKE-ON-VERIFY ?AUTO_3700 ?AUTO_3701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3704 - BLOCK
      ?AUTO_3705 - BLOCK
    )
    :vars
    (
      ?AUTO_3709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3705 ) ( ON ?AUTO_3704 ?AUTO_3709 ) ( CLEAR ?AUTO_3704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3704 ?AUTO_3709 )
      ( MAKE-ON ?AUTO_3704 ?AUTO_3705 )
      ( MAKE-ON-VERIFY ?AUTO_3704 ?AUTO_3705 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3710 - BLOCK
      ?AUTO_3711 - BLOCK
    )
    :vars
    (
      ?AUTO_3714 - BLOCK
      ?AUTO_3715 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3711 ) ( ON ?AUTO_3710 ?AUTO_3714 ) ( CLEAR ?AUTO_3710 ) ( HOLDING ?AUTO_3715 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3715 )
      ( MAKE-ON ?AUTO_3710 ?AUTO_3711 )
      ( MAKE-ON-VERIFY ?AUTO_3710 ?AUTO_3711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3716 - BLOCK
      ?AUTO_3717 - BLOCK
    )
    :vars
    (
      ?AUTO_3720 - BLOCK
      ?AUTO_3721 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3717 ) ( ON ?AUTO_3716 ?AUTO_3720 ) ( ON ?AUTO_3721 ?AUTO_3716 ) ( CLEAR ?AUTO_3721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3721 ?AUTO_3716 )
      ( MAKE-ON ?AUTO_3716 ?AUTO_3717 )
      ( MAKE-ON-VERIFY ?AUTO_3716 ?AUTO_3717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3724 - BLOCK
      ?AUTO_3725 - BLOCK
    )
    :vars
    (
      ?AUTO_3729 - BLOCK
      ?AUTO_3726 - BLOCK
      ?AUTO_3730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3725 ) ( ON ?AUTO_3724 ?AUTO_3729 ) ( ON ?AUTO_3726 ?AUTO_3724 ) ( CLEAR ?AUTO_3726 ) ( HOLDING ?AUTO_3730 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3730 )
      ( MAKE-ON ?AUTO_3724 ?AUTO_3725 )
      ( MAKE-ON-VERIFY ?AUTO_3724 ?AUTO_3725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3731 - BLOCK
      ?AUTO_3732 - BLOCK
    )
    :vars
    (
      ?AUTO_3736 - BLOCK
      ?AUTO_3733 - BLOCK
      ?AUTO_3737 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3732 ) ( ON ?AUTO_3731 ?AUTO_3736 ) ( ON ?AUTO_3733 ?AUTO_3731 ) ( ON ?AUTO_3737 ?AUTO_3733 ) ( CLEAR ?AUTO_3737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3737 ?AUTO_3733 )
      ( MAKE-ON ?AUTO_3731 ?AUTO_3732 )
      ( MAKE-ON-VERIFY ?AUTO_3731 ?AUTO_3732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3740 - BLOCK
      ?AUTO_3741 - BLOCK
    )
    :vars
    (
      ?AUTO_3746 - BLOCK
      ?AUTO_3743 - BLOCK
      ?AUTO_3744 - BLOCK
      ?AUTO_3747 - BLOCK
      ?AUTO_3748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3741 ) ( ON ?AUTO_3740 ?AUTO_3746 ) ( ON ?AUTO_3743 ?AUTO_3740 ) ( ON ?AUTO_3744 ?AUTO_3743 ) ( CLEAR ?AUTO_3744 ) ( HOLDING ?AUTO_3747 ) ( CLEAR ?AUTO_3748 ) )
    :subtasks
    ( ( !STACK ?AUTO_3747 ?AUTO_3748 )
      ( MAKE-ON ?AUTO_3740 ?AUTO_3741 )
      ( MAKE-ON-VERIFY ?AUTO_3740 ?AUTO_3741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3749 - BLOCK
      ?AUTO_3750 - BLOCK
    )
    :vars
    (
      ?AUTO_3751 - BLOCK
      ?AUTO_3752 - BLOCK
      ?AUTO_3757 - BLOCK
      ?AUTO_3754 - BLOCK
      ?AUTO_3753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3750 ) ( ON ?AUTO_3749 ?AUTO_3751 ) ( ON ?AUTO_3752 ?AUTO_3749 ) ( ON ?AUTO_3757 ?AUTO_3752 ) ( CLEAR ?AUTO_3754 ) ( ON ?AUTO_3753 ?AUTO_3757 ) ( CLEAR ?AUTO_3753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3753 ?AUTO_3757 )
      ( MAKE-ON ?AUTO_3749 ?AUTO_3750 )
      ( MAKE-ON-VERIFY ?AUTO_3749 ?AUTO_3750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3760 - BLOCK
      ?AUTO_3761 - BLOCK
    )
    :vars
    (
      ?AUTO_3767 - BLOCK
      ?AUTO_3764 - BLOCK
      ?AUTO_3766 - BLOCK
      ?AUTO_3768 - BLOCK
      ?AUTO_3765 - BLOCK
      ?AUTO_3770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3761 ) ( ON ?AUTO_3760 ?AUTO_3767 ) ( ON ?AUTO_3764 ?AUTO_3760 ) ( ON ?AUTO_3766 ?AUTO_3764 ) ( ON ?AUTO_3768 ?AUTO_3766 ) ( CLEAR ?AUTO_3768 ) ( HOLDING ?AUTO_3765 ) ( CLEAR ?AUTO_3770 ) )
    :subtasks
    ( ( !STACK ?AUTO_3765 ?AUTO_3770 )
      ( MAKE-ON ?AUTO_3760 ?AUTO_3761 )
      ( MAKE-ON-VERIFY ?AUTO_3760 ?AUTO_3761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3777 - BLOCK
      ?AUTO_3778 - BLOCK
    )
    :vars
    (
      ?AUTO_3783 - BLOCK
      ?AUTO_3784 - BLOCK
      ?AUTO_3779 - BLOCK
      ?AUTO_3782 - BLOCK
      ?AUTO_3785 - BLOCK
      ?AUTO_3787 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3777 ?AUTO_3783 ) ( ON ?AUTO_3784 ?AUTO_3777 ) ( ON ?AUTO_3779 ?AUTO_3784 ) ( CLEAR ?AUTO_3782 ) ( ON ?AUTO_3785 ?AUTO_3779 ) ( CLEAR ?AUTO_3785 ) ( HOLDING ?AUTO_3778 ) ( CLEAR ?AUTO_3787 ) )
    :subtasks
    ( ( !STACK ?AUTO_3778 ?AUTO_3787 )
      ( MAKE-ON ?AUTO_3777 ?AUTO_3778 )
      ( MAKE-ON-VERIFY ?AUTO_3777 ?AUTO_3778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3796 - BLOCK
      ?AUTO_3797 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3796 ) ( CLEAR ?AUTO_3797 ) )
    :subtasks
    ( ( !STACK ?AUTO_3796 ?AUTO_3797 )
      ( MAKE-ON-VERIFY ?AUTO_3796 ?AUTO_3797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3800 - BLOCK
      ?AUTO_3801 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3801 ) ( ON-TABLE ?AUTO_3800 ) ( CLEAR ?AUTO_3800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3800 )
      ( MAKE-ON ?AUTO_3800 ?AUTO_3801 )
      ( MAKE-ON-VERIFY ?AUTO_3800 ?AUTO_3801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3805 - BLOCK
      ?AUTO_3806 - BLOCK
    )
    :vars
    (
      ?AUTO_3810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3805 ) ( CLEAR ?AUTO_3805 ) ( HOLDING ?AUTO_3806 ) ( CLEAR ?AUTO_3810 ) )
    :subtasks
    ( ( !STACK ?AUTO_3806 ?AUTO_3810 )
      ( MAKE-ON ?AUTO_3805 ?AUTO_3806 )
      ( MAKE-ON-VERIFY ?AUTO_3805 ?AUTO_3806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4027 - BLOCK
      ?AUTO_4028 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4027 ) ( CLEAR ?AUTO_4028 ) )
    :subtasks
    ( ( !STACK ?AUTO_4027 ?AUTO_4028 )
      ( MAKE-ON-VERIFY ?AUTO_4027 ?AUTO_4028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4031 - BLOCK
      ?AUTO_4032 - BLOCK
    )
    :vars
    (
      ?AUTO_4036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4032 ) ( ON ?AUTO_4031 ?AUTO_4036 ) ( CLEAR ?AUTO_4031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4031 ?AUTO_4036 )
      ( MAKE-ON ?AUTO_4031 ?AUTO_4032 )
      ( MAKE-ON-VERIFY ?AUTO_4031 ?AUTO_4032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4037 - BLOCK
      ?AUTO_4038 - BLOCK
    )
    :vars
    (
      ?AUTO_4041 - BLOCK
      ?AUTO_4042 - BLOCK
      ?AUTO_4043 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4038 ) ( ON ?AUTO_4037 ?AUTO_4041 ) ( CLEAR ?AUTO_4037 ) ( HOLDING ?AUTO_4042 ) ( CLEAR ?AUTO_4043 ) )
    :subtasks
    ( ( !STACK ?AUTO_4042 ?AUTO_4043 )
      ( MAKE-ON ?AUTO_4037 ?AUTO_4038 )
      ( MAKE-ON-VERIFY ?AUTO_4037 ?AUTO_4038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4048 - BLOCK
      ?AUTO_4049 - BLOCK
    )
    :vars
    (
      ?AUTO_4050 - BLOCK
      ?AUTO_4053 - BLOCK
      ?AUTO_4054 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4048 ?AUTO_4050 ) ( CLEAR ?AUTO_4048 ) ( CLEAR ?AUTO_4053 ) ( ON ?AUTO_4054 ?AUTO_4049 ) ( CLEAR ?AUTO_4054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4054 ?AUTO_4049 )
      ( MAKE-ON ?AUTO_4048 ?AUTO_4049 )
      ( MAKE-ON-VERIFY ?AUTO_4048 ?AUTO_4049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4057 - BLOCK
      ?AUTO_4058 - BLOCK
    )
    :vars
    (
      ?AUTO_4061 - BLOCK
      ?AUTO_4063 - BLOCK
      ?AUTO_4062 - BLOCK
      ?AUTO_4064 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4057 ?AUTO_4061 ) ( CLEAR ?AUTO_4057 ) ( CLEAR ?AUTO_4063 ) ( ON ?AUTO_4062 ?AUTO_4058 ) ( CLEAR ?AUTO_4062 ) ( HOLDING ?AUTO_4064 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4064 )
      ( MAKE-ON ?AUTO_4057 ?AUTO_4058 )
      ( MAKE-ON-VERIFY ?AUTO_4057 ?AUTO_4058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4065 - BLOCK
      ?AUTO_4066 - BLOCK
    )
    :vars
    (
      ?AUTO_4072 - BLOCK
      ?AUTO_4067 - BLOCK
      ?AUTO_4068 - BLOCK
      ?AUTO_4071 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4065 ?AUTO_4072 ) ( CLEAR ?AUTO_4065 ) ( CLEAR ?AUTO_4067 ) ( ON ?AUTO_4068 ?AUTO_4066 ) ( ON ?AUTO_4071 ?AUTO_4068 ) ( CLEAR ?AUTO_4071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4071 ?AUTO_4068 )
      ( MAKE-ON ?AUTO_4065 ?AUTO_4066 )
      ( MAKE-ON-VERIFY ?AUTO_4065 ?AUTO_4066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4075 - BLOCK
      ?AUTO_4076 - BLOCK
    )
    :vars
    (
      ?AUTO_4081 - BLOCK
      ?AUTO_4080 - BLOCK
      ?AUTO_4078 - BLOCK
      ?AUTO_4082 - BLOCK
      ?AUTO_4083 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4075 ?AUTO_4081 ) ( CLEAR ?AUTO_4075 ) ( CLEAR ?AUTO_4080 ) ( ON ?AUTO_4078 ?AUTO_4076 ) ( ON ?AUTO_4082 ?AUTO_4078 ) ( CLEAR ?AUTO_4082 ) ( HOLDING ?AUTO_4083 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4083 )
      ( MAKE-ON ?AUTO_4075 ?AUTO_4076 )
      ( MAKE-ON-VERIFY ?AUTO_4075 ?AUTO_4076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4084 - BLOCK
      ?AUTO_4085 - BLOCK
    )
    :vars
    (
      ?AUTO_4086 - BLOCK
      ?AUTO_4087 - BLOCK
      ?AUTO_4091 - BLOCK
      ?AUTO_4088 - BLOCK
      ?AUTO_4092 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4084 ?AUTO_4086 ) ( CLEAR ?AUTO_4084 ) ( CLEAR ?AUTO_4087 ) ( ON ?AUTO_4091 ?AUTO_4085 ) ( ON ?AUTO_4088 ?AUTO_4091 ) ( ON ?AUTO_4092 ?AUTO_4088 ) ( CLEAR ?AUTO_4092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4092 ?AUTO_4088 )
      ( MAKE-ON ?AUTO_4084 ?AUTO_4085 )
      ( MAKE-ON-VERIFY ?AUTO_4084 ?AUTO_4085 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4095 - BLOCK
      ?AUTO_4096 - BLOCK
    )
    :vars
    (
      ?AUTO_4103 - BLOCK
      ?AUTO_4101 - BLOCK
      ?AUTO_4099 - BLOCK
      ?AUTO_4098 - BLOCK
      ?AUTO_4100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4103 ) ( ON ?AUTO_4101 ?AUTO_4096 ) ( ON ?AUTO_4099 ?AUTO_4101 ) ( ON ?AUTO_4098 ?AUTO_4099 ) ( CLEAR ?AUTO_4098 ) ( HOLDING ?AUTO_4095 ) ( CLEAR ?AUTO_4100 ) )
    :subtasks
    ( ( !STACK ?AUTO_4095 ?AUTO_4100 )
      ( MAKE-ON ?AUTO_4095 ?AUTO_4096 )
      ( MAKE-ON-VERIFY ?AUTO_4095 ?AUTO_4096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4106 - BLOCK
      ?AUTO_4107 - BLOCK
    )
    :vars
    (
      ?AUTO_4108 - BLOCK
      ?AUTO_4113 - BLOCK
      ?AUTO_4114 - BLOCK
      ?AUTO_4110 - BLOCK
      ?AUTO_4109 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4108 ) ( ON ?AUTO_4113 ?AUTO_4107 ) ( ON ?AUTO_4114 ?AUTO_4113 ) ( ON ?AUTO_4110 ?AUTO_4114 ) ( CLEAR ?AUTO_4109 ) ( ON ?AUTO_4106 ?AUTO_4110 ) ( CLEAR ?AUTO_4106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4106 ?AUTO_4110 )
      ( MAKE-ON ?AUTO_4106 ?AUTO_4107 )
      ( MAKE-ON-VERIFY ?AUTO_4106 ?AUTO_4107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4117 - BLOCK
      ?AUTO_4118 - BLOCK
    )
    :vars
    (
      ?AUTO_4125 - BLOCK
      ?AUTO_4120 - BLOCK
      ?AUTO_4124 - BLOCK
      ?AUTO_4119 - BLOCK
      ?AUTO_4121 - BLOCK
      ?AUTO_4127 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4125 ) ( ON ?AUTO_4120 ?AUTO_4118 ) ( ON ?AUTO_4124 ?AUTO_4120 ) ( ON ?AUTO_4119 ?AUTO_4124 ) ( ON ?AUTO_4117 ?AUTO_4119 ) ( CLEAR ?AUTO_4117 ) ( HOLDING ?AUTO_4121 ) ( CLEAR ?AUTO_4127 ) )
    :subtasks
    ( ( !STACK ?AUTO_4121 ?AUTO_4127 )
      ( MAKE-ON ?AUTO_4117 ?AUTO_4118 )
      ( MAKE-ON-VERIFY ?AUTO_4117 ?AUTO_4118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4144 - BLOCK
      ?AUTO_4145 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4144 ) ( CLEAR ?AUTO_4145 ) )
    :subtasks
    ( ( !STACK ?AUTO_4144 ?AUTO_4145 )
      ( MAKE-ON-VERIFY ?AUTO_4144 ?AUTO_4145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4148 - BLOCK
      ?AUTO_4149 - BLOCK
    )
    :vars
    (
      ?AUTO_4153 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4149 ) ( ON ?AUTO_4148 ?AUTO_4153 ) ( CLEAR ?AUTO_4148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4148 ?AUTO_4153 )
      ( MAKE-ON ?AUTO_4148 ?AUTO_4149 )
      ( MAKE-ON-VERIFY ?AUTO_4148 ?AUTO_4149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4154 - BLOCK
      ?AUTO_4155 - BLOCK
    )
    :vars
    (
      ?AUTO_4158 - BLOCK
      ?AUTO_4159 - BLOCK
      ?AUTO_4160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4155 ) ( ON ?AUTO_4154 ?AUTO_4158 ) ( CLEAR ?AUTO_4154 ) ( HOLDING ?AUTO_4159 ) ( CLEAR ?AUTO_4160 ) )
    :subtasks
    ( ( !STACK ?AUTO_4159 ?AUTO_4160 )
      ( MAKE-ON ?AUTO_4154 ?AUTO_4155 )
      ( MAKE-ON-VERIFY ?AUTO_4154 ?AUTO_4155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4161 - BLOCK
      ?AUTO_4162 - BLOCK
    )
    :vars
    (
      ?AUTO_4165 - BLOCK
      ?AUTO_4167 - BLOCK
      ?AUTO_4166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4162 ) ( ON ?AUTO_4161 ?AUTO_4165 ) ( CLEAR ?AUTO_4167 ) ( ON ?AUTO_4166 ?AUTO_4161 ) ( CLEAR ?AUTO_4166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4166 ?AUTO_4161 )
      ( MAKE-ON ?AUTO_4161 ?AUTO_4162 )
      ( MAKE-ON-VERIFY ?AUTO_4161 ?AUTO_4162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4170 - BLOCK
      ?AUTO_4171 - BLOCK
    )
    :vars
    (
      ?AUTO_4176 - BLOCK
      ?AUTO_4172 - BLOCK
      ?AUTO_4173 - BLOCK
      ?AUTO_4177 - BLOCK
      ?AUTO_4178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4171 ) ( ON ?AUTO_4170 ?AUTO_4176 ) ( CLEAR ?AUTO_4172 ) ( ON ?AUTO_4173 ?AUTO_4170 ) ( CLEAR ?AUTO_4173 ) ( HOLDING ?AUTO_4177 ) ( CLEAR ?AUTO_4178 ) )
    :subtasks
    ( ( !STACK ?AUTO_4177 ?AUTO_4178 )
      ( MAKE-ON ?AUTO_4170 ?AUTO_4171 )
      ( MAKE-ON-VERIFY ?AUTO_4170 ?AUTO_4171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4189 - BLOCK
      ?AUTO_4190 - BLOCK
    )
    :vars
    (
      ?AUTO_4195 - BLOCK
      ?AUTO_4193 - BLOCK
      ?AUTO_4192 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4189 ?AUTO_4195 ) ( CLEAR ?AUTO_4193 ) ( ON ?AUTO_4192 ?AUTO_4189 ) ( CLEAR ?AUTO_4192 ) ( HOLDING ?AUTO_4190 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4190 )
      ( MAKE-ON ?AUTO_4189 ?AUTO_4190 )
      ( MAKE-ON-VERIFY ?AUTO_4189 ?AUTO_4190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4203 - BLOCK
      ?AUTO_4204 - BLOCK
    )
    :vars
    (
      ?AUTO_4209 - BLOCK
      ?AUTO_4206 - BLOCK
      ?AUTO_4205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4209 ) ( ON ?AUTO_4206 ?AUTO_4204 ) ( CLEAR ?AUTO_4206 ) ( HOLDING ?AUTO_4203 ) ( CLEAR ?AUTO_4205 ) )
    :subtasks
    ( ( !STACK ?AUTO_4203 ?AUTO_4205 )
      ( MAKE-ON ?AUTO_4203 ?AUTO_4204 )
      ( MAKE-ON-VERIFY ?AUTO_4203 ?AUTO_4204 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4212 - BLOCK
      ?AUTO_4213 - BLOCK
    )
    :vars
    (
      ?AUTO_4218 - BLOCK
      ?AUTO_4217 - BLOCK
      ?AUTO_4216 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4218 ) ( ON ?AUTO_4217 ?AUTO_4213 ) ( CLEAR ?AUTO_4217 ) ( CLEAR ?AUTO_4216 ) ( ON-TABLE ?AUTO_4212 ) ( CLEAR ?AUTO_4212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4212 )
      ( MAKE-ON ?AUTO_4212 ?AUTO_4213 )
      ( MAKE-ON-VERIFY ?AUTO_4212 ?AUTO_4213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4220 - BLOCK
      ?AUTO_4221 - BLOCK
    )
    :vars
    (
      ?AUTO_4222 - BLOCK
      ?AUTO_4225 - BLOCK
      ?AUTO_4226 - BLOCK
      ?AUTO_4228 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4222 ) ( ON ?AUTO_4225 ?AUTO_4221 ) ( CLEAR ?AUTO_4225 ) ( ON-TABLE ?AUTO_4220 ) ( CLEAR ?AUTO_4220 ) ( HOLDING ?AUTO_4226 ) ( CLEAR ?AUTO_4228 ) )
    :subtasks
    ( ( !STACK ?AUTO_4226 ?AUTO_4228 )
      ( MAKE-ON ?AUTO_4220 ?AUTO_4221 )
      ( MAKE-ON-VERIFY ?AUTO_4220 ?AUTO_4221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4229 - BLOCK
      ?AUTO_4230 - BLOCK
    )
    :vars
    (
      ?AUTO_4232 - BLOCK
      ?AUTO_4235 - BLOCK
      ?AUTO_4234 - BLOCK
      ?AUTO_4236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4232 ) ( ON ?AUTO_4235 ?AUTO_4230 ) ( CLEAR ?AUTO_4235 ) ( ON-TABLE ?AUTO_4229 ) ( CLEAR ?AUTO_4234 ) ( ON ?AUTO_4236 ?AUTO_4229 ) ( CLEAR ?AUTO_4236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4236 ?AUTO_4229 )
      ( MAKE-ON ?AUTO_4229 ?AUTO_4230 )
      ( MAKE-ON-VERIFY ?AUTO_4229 ?AUTO_4230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4239 - BLOCK
      ?AUTO_4240 - BLOCK
    )
    :vars
    (
      ?AUTO_4242 - BLOCK
      ?AUTO_4241 - BLOCK
      ?AUTO_4246 - BLOCK
      ?AUTO_4243 - BLOCK
      ?AUTO_4247 - BLOCK
      ?AUTO_4248 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4242 ) ( ON ?AUTO_4241 ?AUTO_4240 ) ( CLEAR ?AUTO_4241 ) ( ON-TABLE ?AUTO_4239 ) ( CLEAR ?AUTO_4246 ) ( ON ?AUTO_4243 ?AUTO_4239 ) ( CLEAR ?AUTO_4243 ) ( HOLDING ?AUTO_4247 ) ( CLEAR ?AUTO_4248 ) )
    :subtasks
    ( ( !STACK ?AUTO_4247 ?AUTO_4248 )
      ( MAKE-ON ?AUTO_4239 ?AUTO_4240 )
      ( MAKE-ON-VERIFY ?AUTO_4239 ?AUTO_4240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4253 - BLOCK
      ?AUTO_4254 - BLOCK
    )
    :vars
    (
      ?AUTO_4261 - BLOCK
      ?AUTO_4262 - BLOCK
      ?AUTO_4256 - BLOCK
      ?AUTO_4259 - BLOCK
      ?AUTO_4257 - BLOCK
      ?AUTO_4255 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4261 ) ( ON ?AUTO_4262 ?AUTO_4254 ) ( CLEAR ?AUTO_4262 ) ( ON-TABLE ?AUTO_4253 ) ( CLEAR ?AUTO_4256 ) ( ON ?AUTO_4259 ?AUTO_4253 ) ( CLEAR ?AUTO_4257 ) ( ON ?AUTO_4255 ?AUTO_4259 ) ( CLEAR ?AUTO_4255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4255 ?AUTO_4259 )
      ( MAKE-ON ?AUTO_4253 ?AUTO_4254 )
      ( MAKE-ON-VERIFY ?AUTO_4253 ?AUTO_4254 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4267 - BLOCK
      ?AUTO_4268 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4267 ) ( CLEAR ?AUTO_4268 ) )
    :subtasks
    ( ( !STACK ?AUTO_4267 ?AUTO_4268 )
      ( MAKE-ON-VERIFY ?AUTO_4267 ?AUTO_4268 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_4272 ) ( ON ?AUTO_4271 ?AUTO_4276 ) ( CLEAR ?AUTO_4271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4271 ?AUTO_4276 )
      ( MAKE-ON ?AUTO_4271 ?AUTO_4272 )
      ( MAKE-ON-VERIFY ?AUTO_4271 ?AUTO_4272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4277 - BLOCK
      ?AUTO_4278 - BLOCK
    )
    :vars
    (
      ?AUTO_4281 - BLOCK
      ?AUTO_4283 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4277 ?AUTO_4281 ) ( CLEAR ?AUTO_4277 ) ( HOLDING ?AUTO_4278 ) ( CLEAR ?AUTO_4283 ) )
    :subtasks
    ( ( !STACK ?AUTO_4278 ?AUTO_4283 )
      ( MAKE-ON ?AUTO_4277 ?AUTO_4278 )
      ( MAKE-ON-VERIFY ?AUTO_4277 ?AUTO_4278 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4353 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4353 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4353 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4353 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4355 - BLOCK
    )
    :vars
    (
      ?AUTO_4358 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4355 ?AUTO_4358 ) ( CLEAR ?AUTO_4355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4355 ?AUTO_4358 )
      ( MAKE-ON-TABLE ?AUTO_4355 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4355 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4359 - BLOCK
    )
    :vars
    (
      ?AUTO_4361 - BLOCK
      ?AUTO_4362 - BLOCK
      ?AUTO_4363 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4359 ?AUTO_4361 ) ( CLEAR ?AUTO_4359 ) ( HOLDING ?AUTO_4362 ) ( CLEAR ?AUTO_4363 ) )
    :subtasks
    ( ( !STACK ?AUTO_4362 ?AUTO_4363 )
      ( MAKE-ON-TABLE ?AUTO_4359 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4359 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4366 - BLOCK
    )
    :vars
    (
      ?AUTO_4368 - BLOCK
      ?AUTO_4370 - BLOCK
      ?AUTO_4367 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4366 ?AUTO_4368 ) ( CLEAR ?AUTO_4370 ) ( ON ?AUTO_4367 ?AUTO_4366 ) ( CLEAR ?AUTO_4367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4367 ?AUTO_4366 )
      ( MAKE-ON-TABLE ?AUTO_4366 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4366 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4373 - BLOCK
    )
    :vars
    (
      ?AUTO_4375 - BLOCK
      ?AUTO_4377 - BLOCK
      ?AUTO_4376 - BLOCK
      ?AUTO_4378 - BLOCK
      ?AUTO_4379 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4373 ?AUTO_4375 ) ( CLEAR ?AUTO_4377 ) ( ON ?AUTO_4376 ?AUTO_4373 ) ( CLEAR ?AUTO_4376 ) ( HOLDING ?AUTO_4378 ) ( CLEAR ?AUTO_4379 ) )
    :subtasks
    ( ( !STACK ?AUTO_4378 ?AUTO_4379 )
      ( MAKE-ON-TABLE ?AUTO_4373 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4373 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4380 - BLOCK
    )
    :vars
    (
      ?AUTO_4382 - BLOCK
      ?AUTO_4381 - BLOCK
      ?AUTO_4385 - BLOCK
      ?AUTO_4386 - BLOCK
      ?AUTO_4384 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4380 ?AUTO_4382 ) ( CLEAR ?AUTO_4381 ) ( ON ?AUTO_4385 ?AUTO_4380 ) ( CLEAR ?AUTO_4386 ) ( ON ?AUTO_4384 ?AUTO_4385 ) ( CLEAR ?AUTO_4384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4384 ?AUTO_4385 )
      ( MAKE-ON-TABLE ?AUTO_4380 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4380 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4389 - BLOCK
    )
    :vars
    (
      ?AUTO_4394 - BLOCK
      ?AUTO_4390 - BLOCK
      ?AUTO_4393 - BLOCK
      ?AUTO_4391 - BLOCK
      ?AUTO_4395 - BLOCK
      ?AUTO_4396 - BLOCK
      ?AUTO_4397 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4389 ?AUTO_4394 ) ( CLEAR ?AUTO_4390 ) ( ON ?AUTO_4393 ?AUTO_4389 ) ( CLEAR ?AUTO_4391 ) ( ON ?AUTO_4395 ?AUTO_4393 ) ( CLEAR ?AUTO_4395 ) ( HOLDING ?AUTO_4396 ) ( CLEAR ?AUTO_4397 ) )
    :subtasks
    ( ( !STACK ?AUTO_4396 ?AUTO_4397 )
      ( MAKE-ON-TABLE ?AUTO_4389 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4417 - BLOCK
      ?AUTO_4418 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4417 ) ( CLEAR ?AUTO_4418 ) )
    :subtasks
    ( ( !STACK ?AUTO_4417 ?AUTO_4418 )
      ( MAKE-ON-VERIFY ?AUTO_4417 ?AUTO_4418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4421 - BLOCK
      ?AUTO_4422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4422 ) ( ON-TABLE ?AUTO_4421 ) ( CLEAR ?AUTO_4421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4421 )
      ( MAKE-ON ?AUTO_4421 ?AUTO_4422 )
      ( MAKE-ON-VERIFY ?AUTO_4421 ?AUTO_4422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4426 - BLOCK
      ?AUTO_4427 - BLOCK
    )
    :vars
    (
      ?AUTO_4430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4427 ) ( ON-TABLE ?AUTO_4426 ) ( CLEAR ?AUTO_4426 ) ( HOLDING ?AUTO_4430 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4430 )
      ( MAKE-ON ?AUTO_4426 ?AUTO_4427 )
      ( MAKE-ON-VERIFY ?AUTO_4426 ?AUTO_4427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4431 - BLOCK
      ?AUTO_4432 - BLOCK
    )
    :vars
    (
      ?AUTO_4435 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4432 ) ( ON-TABLE ?AUTO_4431 ) ( ON ?AUTO_4435 ?AUTO_4431 ) ( CLEAR ?AUTO_4435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4435 ?AUTO_4431 )
      ( MAKE-ON ?AUTO_4431 ?AUTO_4432 )
      ( MAKE-ON-VERIFY ?AUTO_4431 ?AUTO_4432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4438 - BLOCK
      ?AUTO_4439 - BLOCK
    )
    :vars
    (
      ?AUTO_4441 - BLOCK
      ?AUTO_4443 - BLOCK
      ?AUTO_4444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4439 ) ( ON-TABLE ?AUTO_4438 ) ( ON ?AUTO_4441 ?AUTO_4438 ) ( CLEAR ?AUTO_4441 ) ( HOLDING ?AUTO_4443 ) ( CLEAR ?AUTO_4444 ) )
    :subtasks
    ( ( !STACK ?AUTO_4443 ?AUTO_4444 )
      ( MAKE-ON ?AUTO_4438 ?AUTO_4439 )
      ( MAKE-ON-VERIFY ?AUTO_4438 ?AUTO_4439 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4445 - BLOCK
      ?AUTO_4446 - BLOCK
    )
    :vars
    (
      ?AUTO_4447 - BLOCK
      ?AUTO_4451 - BLOCK
      ?AUTO_4450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4445 ) ( ON ?AUTO_4447 ?AUTO_4445 ) ( CLEAR ?AUTO_4447 ) ( CLEAR ?AUTO_4451 ) ( ON ?AUTO_4450 ?AUTO_4446 ) ( CLEAR ?AUTO_4450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4450 ?AUTO_4446 )
      ( MAKE-ON ?AUTO_4445 ?AUTO_4446 )
      ( MAKE-ON-VERIFY ?AUTO_4445 ?AUTO_4446 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4454 - BLOCK
      ?AUTO_4455 - BLOCK
    )
    :vars
    (
      ?AUTO_4459 - BLOCK
      ?AUTO_4460 - BLOCK
      ?AUTO_4456 - BLOCK
      ?AUTO_4462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4454 ) ( ON ?AUTO_4459 ?AUTO_4454 ) ( CLEAR ?AUTO_4459 ) ( ON ?AUTO_4460 ?AUTO_4455 ) ( CLEAR ?AUTO_4460 ) ( HOLDING ?AUTO_4456 ) ( CLEAR ?AUTO_4462 ) )
    :subtasks
    ( ( !STACK ?AUTO_4456 ?AUTO_4462 )
      ( MAKE-ON ?AUTO_4454 ?AUTO_4455 )
      ( MAKE-ON-VERIFY ?AUTO_4454 ?AUTO_4455 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4463 - BLOCK
      ?AUTO_4464 - BLOCK
    )
    :vars
    (
      ?AUTO_4466 - BLOCK
      ?AUTO_4470 - BLOCK
      ?AUTO_4467 - BLOCK
      ?AUTO_4465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4463 ) ( ON ?AUTO_4466 ?AUTO_4463 ) ( ON ?AUTO_4470 ?AUTO_4464 ) ( CLEAR ?AUTO_4470 ) ( CLEAR ?AUTO_4467 ) ( ON ?AUTO_4465 ?AUTO_4466 ) ( CLEAR ?AUTO_4465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4465 ?AUTO_4466 )
      ( MAKE-ON ?AUTO_4463 ?AUTO_4464 )
      ( MAKE-ON-VERIFY ?AUTO_4463 ?AUTO_4464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4473 - BLOCK
      ?AUTO_4474 - BLOCK
    )
    :vars
    (
      ?AUTO_4475 - BLOCK
      ?AUTO_4480 - BLOCK
      ?AUTO_4479 - BLOCK
      ?AUTO_4478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4473 ) ( ON ?AUTO_4475 ?AUTO_4473 ) ( CLEAR ?AUTO_4480 ) ( ON ?AUTO_4479 ?AUTO_4475 ) ( CLEAR ?AUTO_4479 ) ( HOLDING ?AUTO_4478 ) ( CLEAR ?AUTO_4474 ) )
    :subtasks
    ( ( !STACK ?AUTO_4478 ?AUTO_4474 )
      ( MAKE-ON ?AUTO_4473 ?AUTO_4474 )
      ( MAKE-ON-VERIFY ?AUTO_4473 ?AUTO_4474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4483 - BLOCK
      ?AUTO_4484 - BLOCK
    )
    :vars
    (
      ?AUTO_4487 - BLOCK
      ?AUTO_4486 - BLOCK
      ?AUTO_4485 - BLOCK
      ?AUTO_4488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4483 ) ( ON ?AUTO_4487 ?AUTO_4483 ) ( CLEAR ?AUTO_4486 ) ( ON ?AUTO_4485 ?AUTO_4487 ) ( CLEAR ?AUTO_4484 ) ( ON ?AUTO_4488 ?AUTO_4485 ) ( CLEAR ?AUTO_4488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4488 ?AUTO_4485 )
      ( MAKE-ON ?AUTO_4483 ?AUTO_4484 )
      ( MAKE-ON-VERIFY ?AUTO_4483 ?AUTO_4484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4493 - BLOCK
      ?AUTO_4494 - BLOCK
    )
    :vars
    (
      ?AUTO_4499 - BLOCK
      ?AUTO_4498 - BLOCK
      ?AUTO_4500 - BLOCK
      ?AUTO_4495 - BLOCK
      ?AUTO_4501 - BLOCK
      ?AUTO_4502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4493 ) ( ON ?AUTO_4499 ?AUTO_4493 ) ( CLEAR ?AUTO_4498 ) ( ON ?AUTO_4500 ?AUTO_4499 ) ( CLEAR ?AUTO_4494 ) ( ON ?AUTO_4495 ?AUTO_4500 ) ( CLEAR ?AUTO_4495 ) ( HOLDING ?AUTO_4501 ) ( CLEAR ?AUTO_4502 ) )
    :subtasks
    ( ( !STACK ?AUTO_4501 ?AUTO_4502 )
      ( MAKE-ON ?AUTO_4493 ?AUTO_4494 )
      ( MAKE-ON-VERIFY ?AUTO_4493 ?AUTO_4494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4507 - BLOCK
      ?AUTO_4508 - BLOCK
    )
    :vars
    (
      ?AUTO_4515 - BLOCK
      ?AUTO_4516 - BLOCK
      ?AUTO_4510 - BLOCK
      ?AUTO_4511 - BLOCK
      ?AUTO_4509 - BLOCK
      ?AUTO_4514 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4507 ) ( ON ?AUTO_4515 ?AUTO_4507 ) ( CLEAR ?AUTO_4516 ) ( ON ?AUTO_4510 ?AUTO_4515 ) ( ON ?AUTO_4511 ?AUTO_4510 ) ( CLEAR ?AUTO_4511 ) ( CLEAR ?AUTO_4509 ) ( ON ?AUTO_4514 ?AUTO_4508 ) ( CLEAR ?AUTO_4514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4514 ?AUTO_4508 )
      ( MAKE-ON ?AUTO_4507 ?AUTO_4508 )
      ( MAKE-ON-VERIFY ?AUTO_4507 ?AUTO_4508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4519 - BLOCK
      ?AUTO_4520 - BLOCK
    )
    :vars
    (
      ?AUTO_4524 - BLOCK
      ?AUTO_4521 - BLOCK
      ?AUTO_4522 - BLOCK
      ?AUTO_4528 - BLOCK
      ?AUTO_4523 - BLOCK
      ?AUTO_4525 - BLOCK
      ?AUTO_4529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4519 ) ( ON ?AUTO_4524 ?AUTO_4519 ) ( CLEAR ?AUTO_4521 ) ( ON ?AUTO_4522 ?AUTO_4524 ) ( ON ?AUTO_4528 ?AUTO_4522 ) ( CLEAR ?AUTO_4528 ) ( CLEAR ?AUTO_4523 ) ( ON ?AUTO_4525 ?AUTO_4520 ) ( CLEAR ?AUTO_4525 ) ( HOLDING ?AUTO_4529 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4529 )
      ( MAKE-ON ?AUTO_4519 ?AUTO_4520 )
      ( MAKE-ON-VERIFY ?AUTO_4519 ?AUTO_4520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4530 - BLOCK
      ?AUTO_4531 - BLOCK
    )
    :vars
    (
      ?AUTO_4533 - BLOCK
      ?AUTO_4536 - BLOCK
      ?AUTO_4538 - BLOCK
      ?AUTO_4540 - BLOCK
      ?AUTO_4535 - BLOCK
      ?AUTO_4532 - BLOCK
      ?AUTO_4534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4530 ) ( ON ?AUTO_4533 ?AUTO_4530 ) ( CLEAR ?AUTO_4536 ) ( ON ?AUTO_4538 ?AUTO_4533 ) ( ON ?AUTO_4540 ?AUTO_4538 ) ( CLEAR ?AUTO_4540 ) ( CLEAR ?AUTO_4535 ) ( ON ?AUTO_4532 ?AUTO_4531 ) ( ON ?AUTO_4534 ?AUTO_4532 ) ( CLEAR ?AUTO_4534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4534 ?AUTO_4532 )
      ( MAKE-ON ?AUTO_4530 ?AUTO_4531 )
      ( MAKE-ON-VERIFY ?AUTO_4530 ?AUTO_4531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4543 - BLOCK
      ?AUTO_4544 - BLOCK
    )
    :vars
    (
      ?AUTO_4545 - BLOCK
      ?AUTO_4548 - BLOCK
      ?AUTO_4549 - BLOCK
      ?AUTO_4552 - BLOCK
      ?AUTO_4553 - BLOCK
      ?AUTO_4546 - BLOCK
      ?AUTO_4550 - BLOCK
      ?AUTO_4554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4543 ) ( ON ?AUTO_4545 ?AUTO_4543 ) ( CLEAR ?AUTO_4548 ) ( ON ?AUTO_4549 ?AUTO_4545 ) ( ON ?AUTO_4552 ?AUTO_4549 ) ( CLEAR ?AUTO_4552 ) ( CLEAR ?AUTO_4553 ) ( ON ?AUTO_4546 ?AUTO_4544 ) ( ON ?AUTO_4550 ?AUTO_4546 ) ( CLEAR ?AUTO_4550 ) ( HOLDING ?AUTO_4554 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4554 )
      ( MAKE-ON ?AUTO_4543 ?AUTO_4544 )
      ( MAKE-ON-VERIFY ?AUTO_4543 ?AUTO_4544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4555 - BLOCK
      ?AUTO_4556 - BLOCK
    )
    :vars
    (
      ?AUTO_4560 - BLOCK
      ?AUTO_4563 - BLOCK
      ?AUTO_4565 - BLOCK
      ?AUTO_4559 - BLOCK
      ?AUTO_4558 - BLOCK
      ?AUTO_4557 - BLOCK
      ?AUTO_4564 - BLOCK
      ?AUTO_4566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4555 ) ( ON ?AUTO_4560 ?AUTO_4555 ) ( CLEAR ?AUTO_4563 ) ( ON ?AUTO_4565 ?AUTO_4560 ) ( ON ?AUTO_4559 ?AUTO_4565 ) ( CLEAR ?AUTO_4559 ) ( CLEAR ?AUTO_4558 ) ( ON ?AUTO_4557 ?AUTO_4556 ) ( ON ?AUTO_4564 ?AUTO_4557 ) ( ON ?AUTO_4566 ?AUTO_4564 ) ( CLEAR ?AUTO_4566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4566 ?AUTO_4564 )
      ( MAKE-ON ?AUTO_4555 ?AUTO_4556 )
      ( MAKE-ON-VERIFY ?AUTO_4555 ?AUTO_4556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4569 - BLOCK
      ?AUTO_4570 - BLOCK
    )
    :vars
    (
      ?AUTO_4580 - BLOCK
      ?AUTO_4575 - BLOCK
      ?AUTO_4578 - BLOCK
      ?AUTO_4576 - BLOCK
      ?AUTO_4573 - BLOCK
      ?AUTO_4574 - BLOCK
      ?AUTO_4579 - BLOCK
      ?AUTO_4572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4569 ) ( ON ?AUTO_4580 ?AUTO_4569 ) ( CLEAR ?AUTO_4575 ) ( ON ?AUTO_4578 ?AUTO_4580 ) ( CLEAR ?AUTO_4576 ) ( ON ?AUTO_4573 ?AUTO_4570 ) ( ON ?AUTO_4574 ?AUTO_4573 ) ( ON ?AUTO_4579 ?AUTO_4574 ) ( CLEAR ?AUTO_4579 ) ( HOLDING ?AUTO_4572 ) ( CLEAR ?AUTO_4578 ) )
    :subtasks
    ( ( !STACK ?AUTO_4572 ?AUTO_4578 )
      ( MAKE-ON ?AUTO_4569 ?AUTO_4570 )
      ( MAKE-ON-VERIFY ?AUTO_4569 ?AUTO_4570 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4583 - BLOCK
      ?AUTO_4584 - BLOCK
    )
    :vars
    (
      ?AUTO_4586 - BLOCK
      ?AUTO_4591 - BLOCK
      ?AUTO_4587 - BLOCK
      ?AUTO_4593 - BLOCK
      ?AUTO_4594 - BLOCK
      ?AUTO_4592 - BLOCK
      ?AUTO_4585 - BLOCK
      ?AUTO_4590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4583 ) ( ON ?AUTO_4586 ?AUTO_4583 ) ( CLEAR ?AUTO_4591 ) ( ON ?AUTO_4587 ?AUTO_4586 ) ( CLEAR ?AUTO_4593 ) ( ON ?AUTO_4594 ?AUTO_4584 ) ( ON ?AUTO_4592 ?AUTO_4594 ) ( ON ?AUTO_4585 ?AUTO_4592 ) ( CLEAR ?AUTO_4587 ) ( ON ?AUTO_4590 ?AUTO_4585 ) ( CLEAR ?AUTO_4590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4590 ?AUTO_4585 )
      ( MAKE-ON ?AUTO_4583 ?AUTO_4584 )
      ( MAKE-ON-VERIFY ?AUTO_4583 ?AUTO_4584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4597 - BLOCK
      ?AUTO_4598 - BLOCK
    )
    :vars
    (
      ?AUTO_4599 - BLOCK
      ?AUTO_4601 - BLOCK
      ?AUTO_4600 - BLOCK
      ?AUTO_4607 - BLOCK
      ?AUTO_4606 - BLOCK
      ?AUTO_4604 - BLOCK
      ?AUTO_4605 - BLOCK
      ?AUTO_4608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4597 ) ( ON ?AUTO_4599 ?AUTO_4597 ) ( CLEAR ?AUTO_4601 ) ( CLEAR ?AUTO_4600 ) ( ON ?AUTO_4607 ?AUTO_4598 ) ( ON ?AUTO_4606 ?AUTO_4607 ) ( ON ?AUTO_4604 ?AUTO_4606 ) ( ON ?AUTO_4605 ?AUTO_4604 ) ( CLEAR ?AUTO_4605 ) ( HOLDING ?AUTO_4608 ) ( CLEAR ?AUTO_4599 ) )
    :subtasks
    ( ( !STACK ?AUTO_4608 ?AUTO_4599 )
      ( MAKE-ON ?AUTO_4597 ?AUTO_4598 )
      ( MAKE-ON-VERIFY ?AUTO_4597 ?AUTO_4598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4611 - BLOCK
      ?AUTO_4612 - BLOCK
    )
    :vars
    (
      ?AUTO_4617 - BLOCK
      ?AUTO_4615 - BLOCK
      ?AUTO_4619 - BLOCK
      ?AUTO_4613 - BLOCK
      ?AUTO_4614 - BLOCK
      ?AUTO_4616 - BLOCK
      ?AUTO_4621 - BLOCK
      ?AUTO_4622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4611 ) ( ON ?AUTO_4617 ?AUTO_4611 ) ( CLEAR ?AUTO_4615 ) ( CLEAR ?AUTO_4619 ) ( ON ?AUTO_4613 ?AUTO_4612 ) ( ON ?AUTO_4614 ?AUTO_4613 ) ( ON ?AUTO_4616 ?AUTO_4614 ) ( ON ?AUTO_4621 ?AUTO_4616 ) ( CLEAR ?AUTO_4621 ) ( CLEAR ?AUTO_4617 ) ( ON-TABLE ?AUTO_4622 ) ( CLEAR ?AUTO_4622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4622 )
      ( MAKE-ON ?AUTO_4611 ?AUTO_4612 )
      ( MAKE-ON-VERIFY ?AUTO_4611 ?AUTO_4612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4624 - BLOCK
      ?AUTO_4625 - BLOCK
    )
    :vars
    (
      ?AUTO_4630 - BLOCK
      ?AUTO_4634 - BLOCK
      ?AUTO_4626 - BLOCK
      ?AUTO_4632 - BLOCK
      ?AUTO_4627 - BLOCK
      ?AUTO_4635 - BLOCK
      ?AUTO_4633 - BLOCK
      ?AUTO_4631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4624 ) ( CLEAR ?AUTO_4630 ) ( CLEAR ?AUTO_4634 ) ( ON ?AUTO_4626 ?AUTO_4625 ) ( ON ?AUTO_4632 ?AUTO_4626 ) ( ON ?AUTO_4627 ?AUTO_4632 ) ( ON ?AUTO_4635 ?AUTO_4627 ) ( CLEAR ?AUTO_4635 ) ( ON-TABLE ?AUTO_4633 ) ( CLEAR ?AUTO_4633 ) ( HOLDING ?AUTO_4631 ) ( CLEAR ?AUTO_4624 ) )
    :subtasks
    ( ( !STACK ?AUTO_4631 ?AUTO_4624 )
      ( MAKE-ON ?AUTO_4624 ?AUTO_4625 )
      ( MAKE-ON-VERIFY ?AUTO_4624 ?AUTO_4625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4638 - BLOCK
      ?AUTO_4639 - BLOCK
    )
    :vars
    (
      ?AUTO_4647 - BLOCK
      ?AUTO_4649 - BLOCK
      ?AUTO_4646 - BLOCK
      ?AUTO_4642 - BLOCK
      ?AUTO_4648 - BLOCK
      ?AUTO_4640 - BLOCK
      ?AUTO_4644 - BLOCK
      ?AUTO_4641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4638 ) ( CLEAR ?AUTO_4647 ) ( CLEAR ?AUTO_4649 ) ( ON ?AUTO_4646 ?AUTO_4639 ) ( ON ?AUTO_4642 ?AUTO_4646 ) ( ON ?AUTO_4648 ?AUTO_4642 ) ( ON ?AUTO_4640 ?AUTO_4648 ) ( CLEAR ?AUTO_4640 ) ( ON-TABLE ?AUTO_4644 ) ( CLEAR ?AUTO_4638 ) ( ON ?AUTO_4641 ?AUTO_4644 ) ( CLEAR ?AUTO_4641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4641 ?AUTO_4644 )
      ( MAKE-ON ?AUTO_4638 ?AUTO_4639 )
      ( MAKE-ON-VERIFY ?AUTO_4638 ?AUTO_4639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4658 - BLOCK
      ?AUTO_4659 - BLOCK
    )
    :vars
    (
      ?AUTO_4669 - BLOCK
      ?AUTO_4668 - BLOCK
      ?AUTO_4665 - BLOCK
      ?AUTO_4666 - BLOCK
      ?AUTO_4667 - BLOCK
      ?AUTO_4660 - BLOCK
      ?AUTO_4664 - BLOCK
      ?AUTO_4662 - BLOCK
      ?AUTO_4671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4658 ) ( CLEAR ?AUTO_4669 ) ( CLEAR ?AUTO_4668 ) ( ON ?AUTO_4665 ?AUTO_4659 ) ( ON ?AUTO_4666 ?AUTO_4665 ) ( ON ?AUTO_4667 ?AUTO_4666 ) ( ON ?AUTO_4660 ?AUTO_4667 ) ( CLEAR ?AUTO_4660 ) ( ON-TABLE ?AUTO_4664 ) ( CLEAR ?AUTO_4664 ) ( CLEAR ?AUTO_4658 ) ( ON ?AUTO_4662 ?AUTO_4671 ) ( CLEAR ?AUTO_4662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4662 ?AUTO_4671 )
      ( MAKE-ON ?AUTO_4658 ?AUTO_4659 )
      ( MAKE-ON-VERIFY ?AUTO_4658 ?AUTO_4659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4674 - BLOCK
      ?AUTO_4675 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4674 ) ( CLEAR ?AUTO_4675 ) )
    :subtasks
    ( ( !STACK ?AUTO_4674 ?AUTO_4675 )
      ( MAKE-ON-VERIFY ?AUTO_4674 ?AUTO_4675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4678 - BLOCK
      ?AUTO_4679 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4679 ) ( ON-TABLE ?AUTO_4678 ) ( CLEAR ?AUTO_4678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4678 )
      ( MAKE-ON ?AUTO_4678 ?AUTO_4679 )
      ( MAKE-ON-VERIFY ?AUTO_4678 ?AUTO_4679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4683 - BLOCK
      ?AUTO_4684 - BLOCK
    )
    :vars
    (
      ?AUTO_4688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4683 ) ( CLEAR ?AUTO_4683 ) ( HOLDING ?AUTO_4684 ) ( CLEAR ?AUTO_4688 ) )
    :subtasks
    ( ( !STACK ?AUTO_4684 ?AUTO_4688 )
      ( MAKE-ON ?AUTO_4683 ?AUTO_4684 )
      ( MAKE-ON-VERIFY ?AUTO_4683 ?AUTO_4684 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5006 - BLOCK
      ?AUTO_5007 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5006 ) ( CLEAR ?AUTO_5007 ) )
    :subtasks
    ( ( !STACK ?AUTO_5006 ?AUTO_5007 )
      ( MAKE-ON-VERIFY ?AUTO_5006 ?AUTO_5007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5010 - BLOCK
      ?AUTO_5011 - BLOCK
    )
    :vars
    (
      ?AUTO_5015 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5011 ) ( ON ?AUTO_5010 ?AUTO_5015 ) ( CLEAR ?AUTO_5010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5010 ?AUTO_5015 )
      ( MAKE-ON ?AUTO_5010 ?AUTO_5011 )
      ( MAKE-ON-VERIFY ?AUTO_5010 ?AUTO_5011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5016 - BLOCK
      ?AUTO_5017 - BLOCK
    )
    :vars
    (
      ?AUTO_5020 - BLOCK
      ?AUTO_5021 - BLOCK
      ?AUTO_5022 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5017 ) ( ON ?AUTO_5016 ?AUTO_5020 ) ( CLEAR ?AUTO_5016 ) ( HOLDING ?AUTO_5021 ) ( CLEAR ?AUTO_5022 ) )
    :subtasks
    ( ( !STACK ?AUTO_5021 ?AUTO_5022 )
      ( MAKE-ON ?AUTO_5016 ?AUTO_5017 )
      ( MAKE-ON-VERIFY ?AUTO_5016 ?AUTO_5017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5061 - BLOCK
      ?AUTO_5062 - BLOCK
    )
    :vars
    (
      ?AUTO_5065 - BLOCK
      ?AUTO_5063 - BLOCK
      ?AUTO_5067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5065 ) ( ON ?AUTO_5063 ?AUTO_5062 ) ( CLEAR ?AUTO_5063 ) ( HOLDING ?AUTO_5061 ) ( CLEAR ?AUTO_5067 ) )
    :subtasks
    ( ( !STACK ?AUTO_5061 ?AUTO_5067 )
      ( MAKE-ON ?AUTO_5061 ?AUTO_5062 )
      ( MAKE-ON-VERIFY ?AUTO_5061 ?AUTO_5062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5090 - BLOCK
      ?AUTO_5091 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5090 ) ( CLEAR ?AUTO_5091 ) )
    :subtasks
    ( ( !STACK ?AUTO_5090 ?AUTO_5091 )
      ( MAKE-ON-VERIFY ?AUTO_5090 ?AUTO_5091 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5094 - BLOCK
      ?AUTO_5095 - BLOCK
    )
    :vars
    (
      ?AUTO_5099 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5095 ) ( ON ?AUTO_5094 ?AUTO_5099 ) ( CLEAR ?AUTO_5094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5094 ?AUTO_5099 )
      ( MAKE-ON ?AUTO_5094 ?AUTO_5095 )
      ( MAKE-ON-VERIFY ?AUTO_5094 ?AUTO_5095 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5100 - BLOCK
      ?AUTO_5101 - BLOCK
    )
    :vars
    (
      ?AUTO_5104 - BLOCK
      ?AUTO_5105 - BLOCK
      ?AUTO_5106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5101 ) ( ON ?AUTO_5100 ?AUTO_5104 ) ( CLEAR ?AUTO_5100 ) ( HOLDING ?AUTO_5105 ) ( CLEAR ?AUTO_5106 ) )
    :subtasks
    ( ( !STACK ?AUTO_5105 ?AUTO_5106 )
      ( MAKE-ON ?AUTO_5100 ?AUTO_5101 )
      ( MAKE-ON-VERIFY ?AUTO_5100 ?AUTO_5101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5107 - BLOCK
      ?AUTO_5108 - BLOCK
    )
    :vars
    (
      ?AUTO_5111 - BLOCK
      ?AUTO_5113 - BLOCK
      ?AUTO_5112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5108 ) ( ON ?AUTO_5107 ?AUTO_5111 ) ( CLEAR ?AUTO_5113 ) ( ON ?AUTO_5112 ?AUTO_5107 ) ( CLEAR ?AUTO_5112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5112 ?AUTO_5107 )
      ( MAKE-ON ?AUTO_5107 ?AUTO_5108 )
      ( MAKE-ON-VERIFY ?AUTO_5107 ?AUTO_5108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5116 - BLOCK
      ?AUTO_5117 - BLOCK
    )
    :vars
    (
      ?AUTO_5122 - BLOCK
      ?AUTO_5119 - BLOCK
      ?AUTO_5118 - BLOCK
      ?AUTO_5124 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5116 ?AUTO_5122 ) ( CLEAR ?AUTO_5119 ) ( ON ?AUTO_5118 ?AUTO_5116 ) ( CLEAR ?AUTO_5118 ) ( HOLDING ?AUTO_5117 ) ( CLEAR ?AUTO_5124 ) )
    :subtasks
    ( ( !STACK ?AUTO_5117 ?AUTO_5124 )
      ( MAKE-ON ?AUTO_5116 ?AUTO_5117 )
      ( MAKE-ON-VERIFY ?AUTO_5116 ?AUTO_5117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5127 - BLOCK
      ?AUTO_5128 - BLOCK
    )
    :vars
    (
      ?AUTO_5133 - BLOCK
      ?AUTO_5129 - BLOCK
      ?AUTO_5132 - BLOCK
      ?AUTO_5134 - BLOCK
      ?AUTO_5135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5128 ) ( ON ?AUTO_5127 ?AUTO_5133 ) ( CLEAR ?AUTO_5129 ) ( ON ?AUTO_5132 ?AUTO_5127 ) ( CLEAR ?AUTO_5132 ) ( HOLDING ?AUTO_5134 ) ( CLEAR ?AUTO_5135 ) )
    :subtasks
    ( ( !STACK ?AUTO_5134 ?AUTO_5135 )
      ( MAKE-ON ?AUTO_5127 ?AUTO_5128 )
      ( MAKE-ON-VERIFY ?AUTO_5127 ?AUTO_5128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5331 - BLOCK
      ?AUTO_5332 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5331 ) ( CLEAR ?AUTO_5332 ) )
    :subtasks
    ( ( !STACK ?AUTO_5331 ?AUTO_5332 )
      ( MAKE-ON-VERIFY ?AUTO_5331 ?AUTO_5332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5335 - BLOCK
      ?AUTO_5336 - BLOCK
    )
    :vars
    (
      ?AUTO_5340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5336 ) ( ON ?AUTO_5335 ?AUTO_5340 ) ( CLEAR ?AUTO_5335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5335 ?AUTO_5340 )
      ( MAKE-ON ?AUTO_5335 ?AUTO_5336 )
      ( MAKE-ON-VERIFY ?AUTO_5335 ?AUTO_5336 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5341 - BLOCK
      ?AUTO_5342 - BLOCK
    )
    :vars
    (
      ?AUTO_5345 - BLOCK
      ?AUTO_5347 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5341 ?AUTO_5345 ) ( CLEAR ?AUTO_5341 ) ( HOLDING ?AUTO_5342 ) ( CLEAR ?AUTO_5347 ) )
    :subtasks
    ( ( !STACK ?AUTO_5342 ?AUTO_5347 )
      ( MAKE-ON ?AUTO_5341 ?AUTO_5342 )
      ( MAKE-ON-VERIFY ?AUTO_5341 ?AUTO_5342 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5349 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5349 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5349 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5349 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5351 - BLOCK
    )
    :vars
    (
      ?AUTO_5354 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5351 ?AUTO_5354 ) ( CLEAR ?AUTO_5351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5351 ?AUTO_5354 )
      ( MAKE-ON-TABLE ?AUTO_5351 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5351 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5356 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5356 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5356 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5356 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5358 - BLOCK
    )
    :vars
    (
      ?AUTO_5361 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5358 ?AUTO_5361 ) ( CLEAR ?AUTO_5358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5358 ?AUTO_5361 )
      ( MAKE-ON-TABLE ?AUTO_5358 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5358 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5362 - BLOCK
    )
    :vars
    (
      ?AUTO_5364 - BLOCK
      ?AUTO_5365 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5362 ?AUTO_5364 ) ( CLEAR ?AUTO_5362 ) ( HOLDING ?AUTO_5365 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5365 )
      ( MAKE-ON-TABLE ?AUTO_5362 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5362 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5366 - BLOCK
    )
    :vars
    (
      ?AUTO_5368 - BLOCK
      ?AUTO_5369 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5366 ?AUTO_5368 ) ( ON ?AUTO_5369 ?AUTO_5366 ) ( CLEAR ?AUTO_5369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5369 ?AUTO_5366 )
      ( MAKE-ON-TABLE ?AUTO_5366 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5366 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5373 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5373 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5373 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5373 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5375 - BLOCK
    )
    :vars
    (
      ?AUTO_5378 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5375 ?AUTO_5378 ) ( CLEAR ?AUTO_5375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5375 ?AUTO_5378 )
      ( MAKE-ON-TABLE ?AUTO_5375 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5375 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5379 - BLOCK
    )
    :vars
    (
      ?AUTO_5381 - BLOCK
      ?AUTO_5382 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5379 ?AUTO_5381 ) ( CLEAR ?AUTO_5379 ) ( HOLDING ?AUTO_5382 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5382 )
      ( MAKE-ON-TABLE ?AUTO_5379 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5379 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5383 - BLOCK
    )
    :vars
    (
      ?AUTO_5385 - BLOCK
      ?AUTO_5386 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5383 ?AUTO_5385 ) ( ON ?AUTO_5386 ?AUTO_5383 ) ( CLEAR ?AUTO_5386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5386 ?AUTO_5383 )
      ( MAKE-ON-TABLE ?AUTO_5383 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5383 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5389 - BLOCK
    )
    :vars
    (
      ?AUTO_5390 - BLOCK
      ?AUTO_5391 - BLOCK
      ?AUTO_5393 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5389 ?AUTO_5390 ) ( ON ?AUTO_5391 ?AUTO_5389 ) ( CLEAR ?AUTO_5391 ) ( HOLDING ?AUTO_5393 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5393 )
      ( MAKE-ON-TABLE ?AUTO_5389 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5389 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5394 - BLOCK
    )
    :vars
    (
      ?AUTO_5396 - BLOCK
      ?AUTO_5397 - BLOCK
      ?AUTO_5398 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5394 ?AUTO_5396 ) ( ON ?AUTO_5397 ?AUTO_5394 ) ( ON ?AUTO_5398 ?AUTO_5397 ) ( CLEAR ?AUTO_5398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5398 ?AUTO_5397 )
      ( MAKE-ON-TABLE ?AUTO_5394 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5403 - BLOCK
      ?AUTO_5404 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5403 ) ( CLEAR ?AUTO_5404 ) )
    :subtasks
    ( ( !STACK ?AUTO_5403 ?AUTO_5404 )
      ( MAKE-ON-VERIFY ?AUTO_5403 ?AUTO_5404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5407 - BLOCK
      ?AUTO_5408 - BLOCK
    )
    :vars
    (
      ?AUTO_5412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5408 ) ( ON ?AUTO_5407 ?AUTO_5412 ) ( CLEAR ?AUTO_5407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5407 ?AUTO_5412 )
      ( MAKE-ON ?AUTO_5407 ?AUTO_5408 )
      ( MAKE-ON-VERIFY ?AUTO_5407 ?AUTO_5408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5413 - BLOCK
      ?AUTO_5414 - BLOCK
    )
    :vars
    (
      ?AUTO_5417 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5413 ?AUTO_5417 ) ( CLEAR ?AUTO_5413 ) ( HOLDING ?AUTO_5414 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5414 )
      ( MAKE-ON ?AUTO_5413 ?AUTO_5414 )
      ( MAKE-ON-VERIFY ?AUTO_5413 ?AUTO_5414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5419 - BLOCK
      ?AUTO_5420 - BLOCK
    )
    :vars
    (
      ?AUTO_5423 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5419 ?AUTO_5423 ) ( ON ?AUTO_5420 ?AUTO_5419 ) ( CLEAR ?AUTO_5420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5420 ?AUTO_5419 )
      ( MAKE-ON ?AUTO_5419 ?AUTO_5420 )
      ( MAKE-ON-VERIFY ?AUTO_5419 ?AUTO_5420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5426 - BLOCK
      ?AUTO_5427 - BLOCK
    )
    :vars
    (
      ?AUTO_5430 - BLOCK
      ?AUTO_5431 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5426 ?AUTO_5430 ) ( ON ?AUTO_5427 ?AUTO_5426 ) ( CLEAR ?AUTO_5427 ) ( HOLDING ?AUTO_5431 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5431 )
      ( MAKE-ON ?AUTO_5426 ?AUTO_5427 )
      ( MAKE-ON-VERIFY ?AUTO_5426 ?AUTO_5427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5432 - BLOCK
      ?AUTO_5433 - BLOCK
    )
    :vars
    (
      ?AUTO_5435 - BLOCK
      ?AUTO_5437 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5432 ?AUTO_5435 ) ( ON ?AUTO_5433 ?AUTO_5432 ) ( ON ?AUTO_5437 ?AUTO_5433 ) ( CLEAR ?AUTO_5437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5437 ?AUTO_5433 )
      ( MAKE-ON ?AUTO_5432 ?AUTO_5433 )
      ( MAKE-ON-VERIFY ?AUTO_5432 ?AUTO_5433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5440 - BLOCK
      ?AUTO_5441 - BLOCK
    )
    :vars
    (
      ?AUTO_5442 - BLOCK
      ?AUTO_5444 - BLOCK
      ?AUTO_5446 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5440 ?AUTO_5442 ) ( ON ?AUTO_5441 ?AUTO_5440 ) ( ON ?AUTO_5444 ?AUTO_5441 ) ( CLEAR ?AUTO_5444 ) ( HOLDING ?AUTO_5446 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5446 )
      ( MAKE-ON ?AUTO_5440 ?AUTO_5441 )
      ( MAKE-ON-VERIFY ?AUTO_5440 ?AUTO_5441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5447 - BLOCK
      ?AUTO_5448 - BLOCK
    )
    :vars
    (
      ?AUTO_5449 - BLOCK
      ?AUTO_5452 - BLOCK
      ?AUTO_5453 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5447 ?AUTO_5449 ) ( ON ?AUTO_5448 ?AUTO_5447 ) ( ON ?AUTO_5452 ?AUTO_5448 ) ( ON ?AUTO_5453 ?AUTO_5452 ) ( CLEAR ?AUTO_5453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5453 ?AUTO_5452 )
      ( MAKE-ON ?AUTO_5447 ?AUTO_5448 )
      ( MAKE-ON-VERIFY ?AUTO_5447 ?AUTO_5448 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5458 - BLOCK
      ?AUTO_5459 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5458 ) ( CLEAR ?AUTO_5459 ) )
    :subtasks
    ( ( !STACK ?AUTO_5458 ?AUTO_5459 )
      ( MAKE-ON-VERIFY ?AUTO_5458 ?AUTO_5459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5462 - BLOCK
      ?AUTO_5463 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5463 ) ( ON-TABLE ?AUTO_5462 ) ( CLEAR ?AUTO_5462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5462 )
      ( MAKE-ON ?AUTO_5462 ?AUTO_5463 )
      ( MAKE-ON-VERIFY ?AUTO_5462 ?AUTO_5463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5467 - BLOCK
      ?AUTO_5468 - BLOCK
    )
    :vars
    (
      ?AUTO_5472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5467 ) ( CLEAR ?AUTO_5467 ) ( HOLDING ?AUTO_5468 ) ( CLEAR ?AUTO_5472 ) )
    :subtasks
    ( ( !STACK ?AUTO_5468 ?AUTO_5472 )
      ( MAKE-ON ?AUTO_5467 ?AUTO_5468 )
      ( MAKE-ON-VERIFY ?AUTO_5467 ?AUTO_5468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5475 - BLOCK
      ?AUTO_5476 - BLOCK
    )
    :vars
    (
      ?AUTO_5479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5476 ) ( ON-TABLE ?AUTO_5475 ) ( CLEAR ?AUTO_5475 ) ( HOLDING ?AUTO_5479 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5479 )
      ( MAKE-ON ?AUTO_5475 ?AUTO_5476 )
      ( MAKE-ON-VERIFY ?AUTO_5475 ?AUTO_5476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5480 - BLOCK
      ?AUTO_5481 - BLOCK
    )
    :vars
    (
      ?AUTO_5484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5480 ) ( CLEAR ?AUTO_5480 ) ( ON ?AUTO_5484 ?AUTO_5481 ) ( CLEAR ?AUTO_5484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5484 ?AUTO_5481 )
      ( MAKE-ON ?AUTO_5480 ?AUTO_5481 )
      ( MAKE-ON-VERIFY ?AUTO_5480 ?AUTO_5481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5487 - BLOCK
      ?AUTO_5488 - BLOCK
    )
    :vars
    (
      ?AUTO_5491 - BLOCK
      ?AUTO_5492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5487 ) ( CLEAR ?AUTO_5487 ) ( ON ?AUTO_5491 ?AUTO_5488 ) ( CLEAR ?AUTO_5491 ) ( HOLDING ?AUTO_5492 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5492 )
      ( MAKE-ON ?AUTO_5487 ?AUTO_5488 )
      ( MAKE-ON-VERIFY ?AUTO_5487 ?AUTO_5488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5493 - BLOCK
      ?AUTO_5494 - BLOCK
    )
    :vars
    (
      ?AUTO_5495 - BLOCK
      ?AUTO_5498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5493 ) ( CLEAR ?AUTO_5493 ) ( ON ?AUTO_5495 ?AUTO_5494 ) ( ON ?AUTO_5498 ?AUTO_5495 ) ( CLEAR ?AUTO_5498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5498 ?AUTO_5495 )
      ( MAKE-ON ?AUTO_5493 ?AUTO_5494 )
      ( MAKE-ON-VERIFY ?AUTO_5493 ?AUTO_5494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5501 - BLOCK
      ?AUTO_5502 - BLOCK
    )
    :vars
    (
      ?AUTO_5504 - BLOCK
      ?AUTO_5503 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5504 ?AUTO_5502 ) ( ON ?AUTO_5503 ?AUTO_5504 ) ( CLEAR ?AUTO_5503 ) ( HOLDING ?AUTO_5501 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5501 )
      ( MAKE-ON ?AUTO_5501 ?AUTO_5502 )
      ( MAKE-ON-VERIFY ?AUTO_5501 ?AUTO_5502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5508 - BLOCK
      ?AUTO_5509 - BLOCK
    )
    :vars
    (
      ?AUTO_5513 - BLOCK
      ?AUTO_5512 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5513 ?AUTO_5509 ) ( ON ?AUTO_5512 ?AUTO_5513 ) ( ON ?AUTO_5508 ?AUTO_5512 ) ( CLEAR ?AUTO_5508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5508 ?AUTO_5512 )
      ( MAKE-ON ?AUTO_5508 ?AUTO_5509 )
      ( MAKE-ON-VERIFY ?AUTO_5508 ?AUTO_5509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5518 - BLOCK
      ?AUTO_5519 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5518 ) ( CLEAR ?AUTO_5519 ) )
    :subtasks
    ( ( !STACK ?AUTO_5518 ?AUTO_5519 )
      ( MAKE-ON-VERIFY ?AUTO_5518 ?AUTO_5519 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5522 - BLOCK
      ?AUTO_5523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5523 ) ( ON-TABLE ?AUTO_5522 ) ( CLEAR ?AUTO_5522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5522 )
      ( MAKE-ON ?AUTO_5522 ?AUTO_5523 )
      ( MAKE-ON-VERIFY ?AUTO_5522 ?AUTO_5523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5527 - BLOCK
      ?AUTO_5528 - BLOCK
    )
    :vars
    (
      ?AUTO_5531 - BLOCK
      ?AUTO_5532 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5528 ) ( ON-TABLE ?AUTO_5527 ) ( CLEAR ?AUTO_5527 ) ( HOLDING ?AUTO_5531 ) ( CLEAR ?AUTO_5532 ) )
    :subtasks
    ( ( !STACK ?AUTO_5531 ?AUTO_5532 )
      ( MAKE-ON ?AUTO_5527 ?AUTO_5528 )
      ( MAKE-ON-VERIFY ?AUTO_5527 ?AUTO_5528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5553 - BLOCK
      ?AUTO_5554 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5553 ) ( CLEAR ?AUTO_5554 ) )
    :subtasks
    ( ( !STACK ?AUTO_5553 ?AUTO_5554 )
      ( MAKE-ON-VERIFY ?AUTO_5553 ?AUTO_5554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5557 - BLOCK
      ?AUTO_5558 - BLOCK
    )
    :vars
    (
      ?AUTO_5562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5558 ) ( ON ?AUTO_5557 ?AUTO_5562 ) ( CLEAR ?AUTO_5557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5557 ?AUTO_5562 )
      ( MAKE-ON ?AUTO_5557 ?AUTO_5558 )
      ( MAKE-ON-VERIFY ?AUTO_5557 ?AUTO_5558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5563 - BLOCK
      ?AUTO_5564 - BLOCK
    )
    :vars
    (
      ?AUTO_5567 - BLOCK
      ?AUTO_5568 - BLOCK
      ?AUTO_5569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5564 ) ( ON ?AUTO_5563 ?AUTO_5567 ) ( CLEAR ?AUTO_5563 ) ( HOLDING ?AUTO_5568 ) ( CLEAR ?AUTO_5569 ) )
    :subtasks
    ( ( !STACK ?AUTO_5568 ?AUTO_5569 )
      ( MAKE-ON ?AUTO_5563 ?AUTO_5564 )
      ( MAKE-ON-VERIFY ?AUTO_5563 ?AUTO_5564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5578 - BLOCK
      ?AUTO_5579 - BLOCK
    )
    :vars
    (
      ?AUTO_5582 - BLOCK
      ?AUTO_5584 - BLOCK
      ?AUTO_5583 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5578 ?AUTO_5582 ) ( CLEAR ?AUTO_5578 ) ( CLEAR ?AUTO_5584 ) ( ON ?AUTO_5583 ?AUTO_5579 ) ( CLEAR ?AUTO_5583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5583 ?AUTO_5579 )
      ( MAKE-ON ?AUTO_5578 ?AUTO_5579 )
      ( MAKE-ON-VERIFY ?AUTO_5578 ?AUTO_5579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5587 - BLOCK
      ?AUTO_5588 - BLOCK
    )
    :vars
    (
      ?AUTO_5591 - BLOCK
      ?AUTO_5593 - BLOCK
      ?AUTO_5592 - BLOCK
      ?AUTO_5594 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5587 ?AUTO_5591 ) ( CLEAR ?AUTO_5587 ) ( CLEAR ?AUTO_5593 ) ( ON ?AUTO_5592 ?AUTO_5588 ) ( CLEAR ?AUTO_5592 ) ( HOLDING ?AUTO_5594 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5594 )
      ( MAKE-ON ?AUTO_5587 ?AUTO_5588 )
      ( MAKE-ON-VERIFY ?AUTO_5587 ?AUTO_5588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5595 - BLOCK
      ?AUTO_5596 - BLOCK
    )
    :vars
    (
      ?AUTO_5602 - BLOCK
      ?AUTO_5597 - BLOCK
      ?AUTO_5598 - BLOCK
      ?AUTO_5601 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5595 ?AUTO_5602 ) ( CLEAR ?AUTO_5595 ) ( CLEAR ?AUTO_5597 ) ( ON ?AUTO_5598 ?AUTO_5596 ) ( ON ?AUTO_5601 ?AUTO_5598 ) ( CLEAR ?AUTO_5601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5601 ?AUTO_5598 )
      ( MAKE-ON ?AUTO_5595 ?AUTO_5596 )
      ( MAKE-ON-VERIFY ?AUTO_5595 ?AUTO_5596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5605 - BLOCK
      ?AUTO_5606 - BLOCK
    )
    :vars
    (
      ?AUTO_5611 - BLOCK
      ?AUTO_5610 - BLOCK
      ?AUTO_5608 - BLOCK
      ?AUTO_5612 - BLOCK
      ?AUTO_5613 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5605 ?AUTO_5611 ) ( CLEAR ?AUTO_5605 ) ( CLEAR ?AUTO_5610 ) ( ON ?AUTO_5608 ?AUTO_5606 ) ( ON ?AUTO_5612 ?AUTO_5608 ) ( CLEAR ?AUTO_5612 ) ( HOLDING ?AUTO_5613 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5613 )
      ( MAKE-ON ?AUTO_5605 ?AUTO_5606 )
      ( MAKE-ON-VERIFY ?AUTO_5605 ?AUTO_5606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5614 - BLOCK
      ?AUTO_5615 - BLOCK
    )
    :vars
    (
      ?AUTO_5618 - BLOCK
      ?AUTO_5617 - BLOCK
      ?AUTO_5621 - BLOCK
      ?AUTO_5616 - BLOCK
      ?AUTO_5622 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5614 ?AUTO_5618 ) ( CLEAR ?AUTO_5614 ) ( CLEAR ?AUTO_5617 ) ( ON ?AUTO_5621 ?AUTO_5615 ) ( ON ?AUTO_5616 ?AUTO_5621 ) ( ON ?AUTO_5622 ?AUTO_5616 ) ( CLEAR ?AUTO_5622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5622 ?AUTO_5616 )
      ( MAKE-ON ?AUTO_5614 ?AUTO_5615 )
      ( MAKE-ON-VERIFY ?AUTO_5614 ?AUTO_5615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5625 - BLOCK
      ?AUTO_5626 - BLOCK
    )
    :vars
    (
      ?AUTO_5628 - BLOCK
      ?AUTO_5632 - BLOCK
      ?AUTO_5633 - BLOCK
      ?AUTO_5630 - BLOCK
      ?AUTO_5629 - BLOCK
      ?AUTO_5634 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5625 ?AUTO_5628 ) ( CLEAR ?AUTO_5625 ) ( CLEAR ?AUTO_5632 ) ( ON ?AUTO_5633 ?AUTO_5626 ) ( ON ?AUTO_5630 ?AUTO_5633 ) ( ON ?AUTO_5629 ?AUTO_5630 ) ( CLEAR ?AUTO_5629 ) ( HOLDING ?AUTO_5634 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5634 )
      ( MAKE-ON ?AUTO_5625 ?AUTO_5626 )
      ( MAKE-ON-VERIFY ?AUTO_5625 ?AUTO_5626 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5635 - BLOCK
      ?AUTO_5636 - BLOCK
    )
    :vars
    (
      ?AUTO_5640 - BLOCK
      ?AUTO_5639 - BLOCK
      ?AUTO_5637 - BLOCK
      ?AUTO_5643 - BLOCK
      ?AUTO_5638 - BLOCK
      ?AUTO_5644 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5635 ?AUTO_5640 ) ( CLEAR ?AUTO_5635 ) ( CLEAR ?AUTO_5639 ) ( ON ?AUTO_5637 ?AUTO_5636 ) ( ON ?AUTO_5643 ?AUTO_5637 ) ( ON ?AUTO_5638 ?AUTO_5643 ) ( ON ?AUTO_5644 ?AUTO_5638 ) ( CLEAR ?AUTO_5644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5644 ?AUTO_5638 )
      ( MAKE-ON ?AUTO_5635 ?AUTO_5636 )
      ( MAKE-ON-VERIFY ?AUTO_5635 ?AUTO_5636 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5648 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5648 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5648 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5648 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5650 - BLOCK
    )
    :vars
    (
      ?AUTO_5653 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5650 ?AUTO_5653 ) ( CLEAR ?AUTO_5650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5650 ?AUTO_5653 )
      ( MAKE-ON-TABLE ?AUTO_5650 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5650 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5654 - BLOCK
    )
    :vars
    (
      ?AUTO_5656 - BLOCK
      ?AUTO_5657 - BLOCK
      ?AUTO_5658 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5654 ?AUTO_5656 ) ( CLEAR ?AUTO_5654 ) ( HOLDING ?AUTO_5657 ) ( CLEAR ?AUTO_5658 ) )
    :subtasks
    ( ( !STACK ?AUTO_5657 ?AUTO_5658 )
      ( MAKE-ON-TABLE ?AUTO_5654 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5654 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5659 - BLOCK
    )
    :vars
    (
      ?AUTO_5661 - BLOCK
      ?AUTO_5663 - BLOCK
      ?AUTO_5662 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5659 ?AUTO_5661 ) ( CLEAR ?AUTO_5663 ) ( ON ?AUTO_5662 ?AUTO_5659 ) ( CLEAR ?AUTO_5662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5662 ?AUTO_5659 )
      ( MAKE-ON-TABLE ?AUTO_5659 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5659 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5666 - BLOCK
    )
    :vars
    (
      ?AUTO_5669 - BLOCK
      ?AUTO_5667 - BLOCK
      ?AUTO_5670 - BLOCK
      ?AUTO_5671 - BLOCK
      ?AUTO_5672 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5666 ?AUTO_5669 ) ( CLEAR ?AUTO_5667 ) ( ON ?AUTO_5670 ?AUTO_5666 ) ( CLEAR ?AUTO_5670 ) ( HOLDING ?AUTO_5671 ) ( CLEAR ?AUTO_5672 ) )
    :subtasks
    ( ( !STACK ?AUTO_5671 ?AUTO_5672 )
      ( MAKE-ON-TABLE ?AUTO_5666 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5666 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5685 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5685 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5685 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5685 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5687 - BLOCK
    )
    :vars
    (
      ?AUTO_5690 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5687 ?AUTO_5690 ) ( CLEAR ?AUTO_5687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5687 ?AUTO_5690 )
      ( MAKE-ON-TABLE ?AUTO_5687 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5687 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5691 - BLOCK
    )
    :vars
    (
      ?AUTO_5693 - BLOCK
      ?AUTO_5694 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5691 ?AUTO_5693 ) ( CLEAR ?AUTO_5691 ) ( HOLDING ?AUTO_5694 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5694 )
      ( MAKE-ON-TABLE ?AUTO_5691 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5691 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5695 - BLOCK
    )
    :vars
    (
      ?AUTO_5697 - BLOCK
      ?AUTO_5698 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5695 ?AUTO_5697 ) ( ON ?AUTO_5698 ?AUTO_5695 ) ( CLEAR ?AUTO_5698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5698 ?AUTO_5695 )
      ( MAKE-ON-TABLE ?AUTO_5695 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5695 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5701 - BLOCK
    )
    :vars
    (
      ?AUTO_5702 - BLOCK
      ?AUTO_5703 - BLOCK
      ?AUTO_5705 - BLOCK
      ?AUTO_5706 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5701 ?AUTO_5702 ) ( ON ?AUTO_5703 ?AUTO_5701 ) ( CLEAR ?AUTO_5703 ) ( HOLDING ?AUTO_5705 ) ( CLEAR ?AUTO_5706 ) )
    :subtasks
    ( ( !STACK ?AUTO_5705 ?AUTO_5706 )
      ( MAKE-ON-TABLE ?AUTO_5701 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5701 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5707 - BLOCK
    )
    :vars
    (
      ?AUTO_5708 - BLOCK
      ?AUTO_5710 - BLOCK
      ?AUTO_5712 - BLOCK
      ?AUTO_5711 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5707 ?AUTO_5708 ) ( ON ?AUTO_5710 ?AUTO_5707 ) ( CLEAR ?AUTO_5712 ) ( ON ?AUTO_5711 ?AUTO_5710 ) ( CLEAR ?AUTO_5711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5711 ?AUTO_5710 )
      ( MAKE-ON-TABLE ?AUTO_5707 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5707 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5715 - BLOCK
    )
    :vars
    (
      ?AUTO_5719 - BLOCK
      ?AUTO_5718 - BLOCK
      ?AUTO_5716 - BLOCK
      ?AUTO_5717 - BLOCK
      ?AUTO_5721 - BLOCK
      ?AUTO_5722 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5715 ?AUTO_5719 ) ( ON ?AUTO_5718 ?AUTO_5715 ) ( CLEAR ?AUTO_5716 ) ( ON ?AUTO_5717 ?AUTO_5718 ) ( CLEAR ?AUTO_5717 ) ( HOLDING ?AUTO_5721 ) ( CLEAR ?AUTO_5722 ) )
    :subtasks
    ( ( !STACK ?AUTO_5721 ?AUTO_5722 )
      ( MAKE-ON-TABLE ?AUTO_5715 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5736 - BLOCK
      ?AUTO_5737 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5736 ) ( CLEAR ?AUTO_5737 ) )
    :subtasks
    ( ( !STACK ?AUTO_5736 ?AUTO_5737 )
      ( MAKE-ON-VERIFY ?AUTO_5736 ?AUTO_5737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5740 - BLOCK
      ?AUTO_5741 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5741 ) ( ON-TABLE ?AUTO_5740 ) ( CLEAR ?AUTO_5740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5740 )
      ( MAKE-ON ?AUTO_5740 ?AUTO_5741 )
      ( MAKE-ON-VERIFY ?AUTO_5740 ?AUTO_5741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5745 - BLOCK
      ?AUTO_5746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5745 ) ( CLEAR ?AUTO_5745 ) ( HOLDING ?AUTO_5746 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5746 )
      ( MAKE-ON ?AUTO_5745 ?AUTO_5746 )
      ( MAKE-ON-VERIFY ?AUTO_5745 ?AUTO_5746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6024 - BLOCK
      ?AUTO_6025 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6024 ) ( CLEAR ?AUTO_6025 ) )
    :subtasks
    ( ( !STACK ?AUTO_6024 ?AUTO_6025 )
      ( MAKE-ON-VERIFY ?AUTO_6024 ?AUTO_6025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6028 - BLOCK
      ?AUTO_6029 - BLOCK
    )
    :vars
    (
      ?AUTO_6033 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6029 ) ( ON ?AUTO_6028 ?AUTO_6033 ) ( CLEAR ?AUTO_6028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6028 ?AUTO_6033 )
      ( MAKE-ON ?AUTO_6028 ?AUTO_6029 )
      ( MAKE-ON-VERIFY ?AUTO_6028 ?AUTO_6029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6034 - BLOCK
      ?AUTO_6035 - BLOCK
    )
    :vars
    (
      ?AUTO_6038 - BLOCK
      ?AUTO_6040 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6034 ?AUTO_6038 ) ( CLEAR ?AUTO_6034 ) ( HOLDING ?AUTO_6035 ) ( CLEAR ?AUTO_6040 ) )
    :subtasks
    ( ( !STACK ?AUTO_6035 ?AUTO_6040 )
      ( MAKE-ON ?AUTO_6034 ?AUTO_6035 )
      ( MAKE-ON-VERIFY ?AUTO_6034 ?AUTO_6035 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6043 - BLOCK
      ?AUTO_6044 - BLOCK
    )
    :vars
    (
      ?AUTO_6047 - BLOCK
      ?AUTO_6048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6044 ) ( ON ?AUTO_6043 ?AUTO_6047 ) ( CLEAR ?AUTO_6043 ) ( HOLDING ?AUTO_6048 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6048 )
      ( MAKE-ON ?AUTO_6043 ?AUTO_6044 )
      ( MAKE-ON-VERIFY ?AUTO_6043 ?AUTO_6044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6133 - BLOCK
      ?AUTO_6134 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6133 ) ( CLEAR ?AUTO_6134 ) )
    :subtasks
    ( ( !STACK ?AUTO_6133 ?AUTO_6134 )
      ( MAKE-ON-VERIFY ?AUTO_6133 ?AUTO_6134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6137 - BLOCK
      ?AUTO_6138 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6138 ) ( ON-TABLE ?AUTO_6137 ) ( CLEAR ?AUTO_6137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6137 )
      ( MAKE-ON ?AUTO_6137 ?AUTO_6138 )
      ( MAKE-ON-VERIFY ?AUTO_6137 ?AUTO_6138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6142 - BLOCK
      ?AUTO_6143 - BLOCK
    )
    :vars
    (
      ?AUTO_6146 - BLOCK
      ?AUTO_6147 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6143 ) ( ON-TABLE ?AUTO_6142 ) ( CLEAR ?AUTO_6142 ) ( HOLDING ?AUTO_6146 ) ( CLEAR ?AUTO_6147 ) )
    :subtasks
    ( ( !STACK ?AUTO_6146 ?AUTO_6147 )
      ( MAKE-ON ?AUTO_6142 ?AUTO_6143 )
      ( MAKE-ON-VERIFY ?AUTO_6142 ?AUTO_6143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6148 - BLOCK
      ?AUTO_6149 - BLOCK
    )
    :vars
    (
      ?AUTO_6151 - BLOCK
      ?AUTO_6153 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6149 ) ( ON-TABLE ?AUTO_6148 ) ( CLEAR ?AUTO_6151 ) ( ON ?AUTO_6153 ?AUTO_6148 ) ( CLEAR ?AUTO_6153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6153 ?AUTO_6148 )
      ( MAKE-ON ?AUTO_6148 ?AUTO_6149 )
      ( MAKE-ON-VERIFY ?AUTO_6148 ?AUTO_6149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6156 - BLOCK
      ?AUTO_6157 - BLOCK
    )
    :vars
    (
      ?AUTO_6161 - BLOCK
      ?AUTO_6160 - BLOCK
      ?AUTO_6163 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6157 ) ( ON-TABLE ?AUTO_6156 ) ( ON ?AUTO_6161 ?AUTO_6156 ) ( CLEAR ?AUTO_6161 ) ( HOLDING ?AUTO_6160 ) ( CLEAR ?AUTO_6163 ) )
    :subtasks
    ( ( !STACK ?AUTO_6160 ?AUTO_6163 )
      ( MAKE-ON ?AUTO_6156 ?AUTO_6157 )
      ( MAKE-ON-VERIFY ?AUTO_6156 ?AUTO_6157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6168 - BLOCK
      ?AUTO_6169 - BLOCK
    )
    :vars
    (
      ?AUTO_6171 - BLOCK
      ?AUTO_6174 - BLOCK
      ?AUTO_6172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6168 ) ( ON ?AUTO_6171 ?AUTO_6168 ) ( CLEAR ?AUTO_6171 ) ( CLEAR ?AUTO_6174 ) ( ON ?AUTO_6172 ?AUTO_6169 ) ( CLEAR ?AUTO_6172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6172 ?AUTO_6169 )
      ( MAKE-ON ?AUTO_6168 ?AUTO_6169 )
      ( MAKE-ON-VERIFY ?AUTO_6168 ?AUTO_6169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6177 - BLOCK
      ?AUTO_6178 - BLOCK
    )
    :vars
    (
      ?AUTO_6181 - BLOCK
      ?AUTO_6182 - BLOCK
      ?AUTO_6183 - BLOCK
      ?AUTO_6184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6177 ) ( ON ?AUTO_6181 ?AUTO_6177 ) ( CLEAR ?AUTO_6181 ) ( CLEAR ?AUTO_6182 ) ( ON ?AUTO_6183 ?AUTO_6178 ) ( CLEAR ?AUTO_6183 ) ( HOLDING ?AUTO_6184 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6184 )
      ( MAKE-ON ?AUTO_6177 ?AUTO_6178 )
      ( MAKE-ON-VERIFY ?AUTO_6177 ?AUTO_6178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6185 - BLOCK
      ?AUTO_6186 - BLOCK
    )
    :vars
    (
      ?AUTO_6191 - BLOCK
      ?AUTO_6192 - BLOCK
      ?AUTO_6187 - BLOCK
      ?AUTO_6190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6185 ) ( ON ?AUTO_6191 ?AUTO_6185 ) ( CLEAR ?AUTO_6191 ) ( CLEAR ?AUTO_6192 ) ( ON ?AUTO_6187 ?AUTO_6186 ) ( ON ?AUTO_6190 ?AUTO_6187 ) ( CLEAR ?AUTO_6190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6190 ?AUTO_6187 )
      ( MAKE-ON ?AUTO_6185 ?AUTO_6186 )
      ( MAKE-ON-VERIFY ?AUTO_6185 ?AUTO_6186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6195 - BLOCK
      ?AUTO_6196 - BLOCK
    )
    :vars
    (
      ?AUTO_6202 - BLOCK
      ?AUTO_6198 - BLOCK
      ?AUTO_6201 - BLOCK
      ?AUTO_6199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6195 ) ( CLEAR ?AUTO_6202 ) ( ON ?AUTO_6198 ?AUTO_6196 ) ( ON ?AUTO_6201 ?AUTO_6198 ) ( CLEAR ?AUTO_6201 ) ( HOLDING ?AUTO_6199 ) ( CLEAR ?AUTO_6195 ) )
    :subtasks
    ( ( !STACK ?AUTO_6199 ?AUTO_6195 )
      ( MAKE-ON ?AUTO_6195 ?AUTO_6196 )
      ( MAKE-ON-VERIFY ?AUTO_6195 ?AUTO_6196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6205 - BLOCK
      ?AUTO_6206 - BLOCK
    )
    :vars
    (
      ?AUTO_6209 - BLOCK
      ?AUTO_6210 - BLOCK
      ?AUTO_6208 - BLOCK
      ?AUTO_6207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6205 ) ( CLEAR ?AUTO_6209 ) ( ON ?AUTO_6210 ?AUTO_6206 ) ( ON ?AUTO_6208 ?AUTO_6210 ) ( CLEAR ?AUTO_6205 ) ( ON ?AUTO_6207 ?AUTO_6208 ) ( CLEAR ?AUTO_6207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6207 ?AUTO_6208 )
      ( MAKE-ON ?AUTO_6205 ?AUTO_6206 )
      ( MAKE-ON-VERIFY ?AUTO_6205 ?AUTO_6206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6215 - BLOCK
      ?AUTO_6216 - BLOCK
    )
    :vars
    (
      ?AUTO_6221 - BLOCK
      ?AUTO_6220 - BLOCK
      ?AUTO_6219 - BLOCK
      ?AUTO_6222 - BLOCK
      ?AUTO_6223 - BLOCK
      ?AUTO_6224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6215 ) ( CLEAR ?AUTO_6221 ) ( ON ?AUTO_6220 ?AUTO_6216 ) ( ON ?AUTO_6219 ?AUTO_6220 ) ( CLEAR ?AUTO_6215 ) ( ON ?AUTO_6222 ?AUTO_6219 ) ( CLEAR ?AUTO_6222 ) ( HOLDING ?AUTO_6223 ) ( CLEAR ?AUTO_6224 ) )
    :subtasks
    ( ( !STACK ?AUTO_6223 ?AUTO_6224 )
      ( MAKE-ON ?AUTO_6215 ?AUTO_6216 )
      ( MAKE-ON-VERIFY ?AUTO_6215 ?AUTO_6216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6233 - BLOCK
      ?AUTO_6234 - BLOCK
    )
    :vars
    (
      ?AUTO_6237 - BLOCK
      ?AUTO_6235 - BLOCK
      ?AUTO_6239 - BLOCK
      ?AUTO_6236 - BLOCK
      ?AUTO_6241 - BLOCK
      ?AUTO_6240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6233 ) ( CLEAR ?AUTO_6237 ) ( ON ?AUTO_6235 ?AUTO_6234 ) ( ON ?AUTO_6239 ?AUTO_6235 ) ( ON ?AUTO_6236 ?AUTO_6239 ) ( CLEAR ?AUTO_6236 ) ( CLEAR ?AUTO_6241 ) ( ON ?AUTO_6240 ?AUTO_6233 ) ( CLEAR ?AUTO_6240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6240 ?AUTO_6233 )
      ( MAKE-ON ?AUTO_6233 ?AUTO_6234 )
      ( MAKE-ON-VERIFY ?AUTO_6233 ?AUTO_6234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6245 - BLOCK
      ?AUTO_6246 - BLOCK
    )
    :vars
    (
      ?AUTO_6254 - BLOCK
      ?AUTO_6250 - BLOCK
      ?AUTO_6253 - BLOCK
      ?AUTO_6251 - BLOCK
      ?AUTO_6252 - BLOCK
      ?AUTO_6249 - BLOCK
      ?AUTO_6255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6245 ) ( CLEAR ?AUTO_6254 ) ( ON ?AUTO_6250 ?AUTO_6246 ) ( ON ?AUTO_6253 ?AUTO_6250 ) ( ON ?AUTO_6251 ?AUTO_6253 ) ( CLEAR ?AUTO_6251 ) ( CLEAR ?AUTO_6252 ) ( ON ?AUTO_6249 ?AUTO_6245 ) ( CLEAR ?AUTO_6249 ) ( HOLDING ?AUTO_6255 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6255 )
      ( MAKE-ON ?AUTO_6245 ?AUTO_6246 )
      ( MAKE-ON-VERIFY ?AUTO_6245 ?AUTO_6246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6256 - BLOCK
      ?AUTO_6257 - BLOCK
    )
    :vars
    (
      ?AUTO_6262 - BLOCK
      ?AUTO_6265 - BLOCK
      ?AUTO_6266 - BLOCK
      ?AUTO_6264 - BLOCK
      ?AUTO_6258 - BLOCK
      ?AUTO_6261 - BLOCK
      ?AUTO_6259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6256 ) ( CLEAR ?AUTO_6262 ) ( ON ?AUTO_6265 ?AUTO_6257 ) ( ON ?AUTO_6266 ?AUTO_6265 ) ( ON ?AUTO_6264 ?AUTO_6266 ) ( CLEAR ?AUTO_6264 ) ( CLEAR ?AUTO_6258 ) ( ON ?AUTO_6261 ?AUTO_6256 ) ( ON ?AUTO_6259 ?AUTO_6261 ) ( CLEAR ?AUTO_6259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6259 ?AUTO_6261 )
      ( MAKE-ON ?AUTO_6256 ?AUTO_6257 )
      ( MAKE-ON-VERIFY ?AUTO_6256 ?AUTO_6257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6269 - BLOCK
      ?AUTO_6270 - BLOCK
    )
    :vars
    (
      ?AUTO_6279 - BLOCK
      ?AUTO_6272 - BLOCK
      ?AUTO_6273 - BLOCK
      ?AUTO_6277 - BLOCK
      ?AUTO_6274 - BLOCK
      ?AUTO_6278 - BLOCK
      ?AUTO_6276 - BLOCK
      ?AUTO_6280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6269 ) ( CLEAR ?AUTO_6279 ) ( ON ?AUTO_6272 ?AUTO_6270 ) ( ON ?AUTO_6273 ?AUTO_6272 ) ( ON ?AUTO_6277 ?AUTO_6273 ) ( CLEAR ?AUTO_6277 ) ( CLEAR ?AUTO_6274 ) ( ON ?AUTO_6278 ?AUTO_6269 ) ( ON ?AUTO_6276 ?AUTO_6278 ) ( CLEAR ?AUTO_6276 ) ( HOLDING ?AUTO_6280 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6280 )
      ( MAKE-ON ?AUTO_6269 ?AUTO_6270 )
      ( MAKE-ON-VERIFY ?AUTO_6269 ?AUTO_6270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6281 - BLOCK
      ?AUTO_6282 - BLOCK
    )
    :vars
    (
      ?AUTO_6287 - BLOCK
      ?AUTO_6286 - BLOCK
      ?AUTO_6292 - BLOCK
      ?AUTO_6284 - BLOCK
      ?AUTO_6291 - BLOCK
      ?AUTO_6285 - BLOCK
      ?AUTO_6290 - BLOCK
      ?AUTO_6283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6281 ) ( CLEAR ?AUTO_6287 ) ( ON ?AUTO_6286 ?AUTO_6282 ) ( ON ?AUTO_6292 ?AUTO_6286 ) ( ON ?AUTO_6284 ?AUTO_6292 ) ( CLEAR ?AUTO_6284 ) ( CLEAR ?AUTO_6291 ) ( ON ?AUTO_6285 ?AUTO_6281 ) ( ON ?AUTO_6290 ?AUTO_6285 ) ( ON ?AUTO_6283 ?AUTO_6290 ) ( CLEAR ?AUTO_6283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6283 ?AUTO_6290 )
      ( MAKE-ON ?AUTO_6281 ?AUTO_6282 )
      ( MAKE-ON-VERIFY ?AUTO_6281 ?AUTO_6282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6295 - BLOCK
      ?AUTO_6296 - BLOCK
    )
    :vars
    (
      ?AUTO_6305 - BLOCK
      ?AUTO_6302 - BLOCK
      ?AUTO_6303 - BLOCK
      ?AUTO_6299 - BLOCK
      ?AUTO_6300 - BLOCK
      ?AUTO_6306 - BLOCK
      ?AUTO_6301 - BLOCK
      ?AUTO_6298 - BLOCK
      ?AUTO_6307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6295 ) ( CLEAR ?AUTO_6305 ) ( ON ?AUTO_6302 ?AUTO_6296 ) ( ON ?AUTO_6303 ?AUTO_6302 ) ( ON ?AUTO_6299 ?AUTO_6303 ) ( CLEAR ?AUTO_6299 ) ( CLEAR ?AUTO_6300 ) ( ON ?AUTO_6306 ?AUTO_6295 ) ( ON ?AUTO_6301 ?AUTO_6306 ) ( ON ?AUTO_6298 ?AUTO_6301 ) ( CLEAR ?AUTO_6298 ) ( HOLDING ?AUTO_6307 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6307 )
      ( MAKE-ON ?AUTO_6295 ?AUTO_6296 )
      ( MAKE-ON-VERIFY ?AUTO_6295 ?AUTO_6296 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6308 - BLOCK
      ?AUTO_6309 - BLOCK
    )
    :vars
    (
      ?AUTO_6311 - BLOCK
      ?AUTO_6316 - BLOCK
      ?AUTO_6314 - BLOCK
      ?AUTO_6320 - BLOCK
      ?AUTO_6318 - BLOCK
      ?AUTO_6310 - BLOCK
      ?AUTO_6317 - BLOCK
      ?AUTO_6312 - BLOCK
      ?AUTO_6319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6308 ) ( CLEAR ?AUTO_6311 ) ( ON ?AUTO_6316 ?AUTO_6309 ) ( ON ?AUTO_6314 ?AUTO_6316 ) ( ON ?AUTO_6320 ?AUTO_6314 ) ( CLEAR ?AUTO_6320 ) ( CLEAR ?AUTO_6318 ) ( ON ?AUTO_6310 ?AUTO_6308 ) ( ON ?AUTO_6317 ?AUTO_6310 ) ( ON ?AUTO_6312 ?AUTO_6317 ) ( ON ?AUTO_6319 ?AUTO_6312 ) ( CLEAR ?AUTO_6319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6319 ?AUTO_6312 )
      ( MAKE-ON ?AUTO_6308 ?AUTO_6309 )
      ( MAKE-ON-VERIFY ?AUTO_6308 ?AUTO_6309 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6322 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6322 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6322 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6322 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6324 - BLOCK
    )
    :vars
    (
      ?AUTO_6327 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6324 ?AUTO_6327 ) ( CLEAR ?AUTO_6324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6324 ?AUTO_6327 )
      ( MAKE-ON-TABLE ?AUTO_6324 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6324 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6329 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6329 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6329 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6329 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6331 - BLOCK
    )
    :vars
    (
      ?AUTO_6334 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6331 ?AUTO_6334 ) ( CLEAR ?AUTO_6331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6331 ?AUTO_6334 )
      ( MAKE-ON-TABLE ?AUTO_6331 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6331 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6335 - BLOCK
    )
    :vars
    (
      ?AUTO_6337 - BLOCK
      ?AUTO_6338 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6335 ?AUTO_6337 ) ( CLEAR ?AUTO_6335 ) ( HOLDING ?AUTO_6338 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6338 )
      ( MAKE-ON-TABLE ?AUTO_6335 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6335 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6339 - BLOCK
    )
    :vars
    (
      ?AUTO_6341 - BLOCK
      ?AUTO_6342 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6339 ?AUTO_6341 ) ( ON ?AUTO_6342 ?AUTO_6339 ) ( CLEAR ?AUTO_6342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6342 ?AUTO_6339 )
      ( MAKE-ON-TABLE ?AUTO_6339 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6347 - BLOCK
      ?AUTO_6348 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6347 ) ( CLEAR ?AUTO_6348 ) )
    :subtasks
    ( ( !STACK ?AUTO_6347 ?AUTO_6348 )
      ( MAKE-ON-VERIFY ?AUTO_6347 ?AUTO_6348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6351 - BLOCK
      ?AUTO_6352 - BLOCK
    )
    :vars
    (
      ?AUTO_6356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6352 ) ( ON ?AUTO_6351 ?AUTO_6356 ) ( CLEAR ?AUTO_6351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6351 ?AUTO_6356 )
      ( MAKE-ON ?AUTO_6351 ?AUTO_6352 )
      ( MAKE-ON-VERIFY ?AUTO_6351 ?AUTO_6352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6357 - BLOCK
      ?AUTO_6358 - BLOCK
    )
    :vars
    (
      ?AUTO_6361 - BLOCK
      ?AUTO_6362 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6358 ) ( ON ?AUTO_6357 ?AUTO_6361 ) ( CLEAR ?AUTO_6357 ) ( HOLDING ?AUTO_6362 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6362 )
      ( MAKE-ON ?AUTO_6357 ?AUTO_6358 )
      ( MAKE-ON-VERIFY ?AUTO_6357 ?AUTO_6358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6365 - BLOCK
      ?AUTO_6366 - BLOCK
    )
    :vars
    (
      ?AUTO_6369 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6365 ?AUTO_6369 ) ( CLEAR ?AUTO_6365 ) ( HOLDING ?AUTO_6366 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6366 )
      ( MAKE-ON ?AUTO_6365 ?AUTO_6366 )
      ( MAKE-ON-VERIFY ?AUTO_6365 ?AUTO_6366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6375 - BLOCK
      ?AUTO_6376 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6375 ) ( CLEAR ?AUTO_6376 ) )
    :subtasks
    ( ( !STACK ?AUTO_6375 ?AUTO_6376 )
      ( MAKE-ON-VERIFY ?AUTO_6375 ?AUTO_6376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6379 - BLOCK
      ?AUTO_6380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6380 ) ( ON-TABLE ?AUTO_6379 ) ( CLEAR ?AUTO_6379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6379 )
      ( MAKE-ON ?AUTO_6379 ?AUTO_6380 )
      ( MAKE-ON-VERIFY ?AUTO_6379 ?AUTO_6380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6384 - BLOCK
      ?AUTO_6385 - BLOCK
    )
    :vars
    (
      ?AUTO_6388 - BLOCK
      ?AUTO_6389 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6385 ) ( ON-TABLE ?AUTO_6384 ) ( CLEAR ?AUTO_6384 ) ( HOLDING ?AUTO_6388 ) ( CLEAR ?AUTO_6389 ) )
    :subtasks
    ( ( !STACK ?AUTO_6388 ?AUTO_6389 )
      ( MAKE-ON ?AUTO_6384 ?AUTO_6385 )
      ( MAKE-ON-VERIFY ?AUTO_6384 ?AUTO_6385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6390 - BLOCK
      ?AUTO_6391 - BLOCK
    )
    :vars
    (
      ?AUTO_6393 - BLOCK
      ?AUTO_6395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6390 ) ( CLEAR ?AUTO_6390 ) ( CLEAR ?AUTO_6393 ) ( ON ?AUTO_6395 ?AUTO_6391 ) ( CLEAR ?AUTO_6395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6395 ?AUTO_6391 )
      ( MAKE-ON ?AUTO_6390 ?AUTO_6391 )
      ( MAKE-ON-VERIFY ?AUTO_6390 ?AUTO_6391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6398 - BLOCK
      ?AUTO_6399 - BLOCK
    )
    :vars
    (
      ?AUTO_6402 - BLOCK
      ?AUTO_6403 - BLOCK
      ?AUTO_6404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6398 ) ( CLEAR ?AUTO_6398 ) ( CLEAR ?AUTO_6402 ) ( ON ?AUTO_6403 ?AUTO_6399 ) ( CLEAR ?AUTO_6403 ) ( HOLDING ?AUTO_6404 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6404 )
      ( MAKE-ON ?AUTO_6398 ?AUTO_6399 )
      ( MAKE-ON-VERIFY ?AUTO_6398 ?AUTO_6399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6405 - BLOCK
      ?AUTO_6406 - BLOCK
    )
    :vars
    (
      ?AUTO_6410 - BLOCK
      ?AUTO_6409 - BLOCK
      ?AUTO_6411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6405 ) ( CLEAR ?AUTO_6410 ) ( ON ?AUTO_6409 ?AUTO_6406 ) ( CLEAR ?AUTO_6409 ) ( ON ?AUTO_6411 ?AUTO_6405 ) ( CLEAR ?AUTO_6411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6411 ?AUTO_6405 )
      ( MAKE-ON ?AUTO_6405 ?AUTO_6406 )
      ( MAKE-ON-VERIFY ?AUTO_6405 ?AUTO_6406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6414 - BLOCK
      ?AUTO_6415 - BLOCK
    )
    :vars
    (
      ?AUTO_6418 - BLOCK
      ?AUTO_6417 - BLOCK
      ?AUTO_6416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6414 ) ( ON ?AUTO_6418 ?AUTO_6415 ) ( CLEAR ?AUTO_6418 ) ( ON ?AUTO_6417 ?AUTO_6414 ) ( CLEAR ?AUTO_6417 ) ( HOLDING ?AUTO_6416 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6416 )
      ( MAKE-ON ?AUTO_6414 ?AUTO_6415 )
      ( MAKE-ON-VERIFY ?AUTO_6414 ?AUTO_6415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6422 - BLOCK
      ?AUTO_6423 - BLOCK
    )
    :vars
    (
      ?AUTO_6428 - BLOCK
      ?AUTO_6427 - BLOCK
      ?AUTO_6424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6422 ) ( ON ?AUTO_6428 ?AUTO_6423 ) ( CLEAR ?AUTO_6428 ) ( ON ?AUTO_6427 ?AUTO_6422 ) ( ON ?AUTO_6424 ?AUTO_6427 ) ( CLEAR ?AUTO_6424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6424 ?AUTO_6427 )
      ( MAKE-ON ?AUTO_6422 ?AUTO_6423 )
      ( MAKE-ON-VERIFY ?AUTO_6422 ?AUTO_6423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6431 - BLOCK
      ?AUTO_6432 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6431 ) ( CLEAR ?AUTO_6432 ) )
    :subtasks
    ( ( !STACK ?AUTO_6431 ?AUTO_6432 )
      ( MAKE-ON-VERIFY ?AUTO_6431 ?AUTO_6432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6435 - BLOCK
      ?AUTO_6436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6436 ) ( ON-TABLE ?AUTO_6435 ) ( CLEAR ?AUTO_6435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6435 )
      ( MAKE-ON ?AUTO_6435 ?AUTO_6436 )
      ( MAKE-ON-VERIFY ?AUTO_6435 ?AUTO_6436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6442 - BLOCK
      ?AUTO_6443 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6442 ) ( CLEAR ?AUTO_6443 ) )
    :subtasks
    ( ( !STACK ?AUTO_6442 ?AUTO_6443 )
      ( MAKE-ON-VERIFY ?AUTO_6442 ?AUTO_6443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6446 - BLOCK
      ?AUTO_6447 - BLOCK
    )
    :vars
    (
      ?AUTO_6451 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6447 ) ( ON ?AUTO_6446 ?AUTO_6451 ) ( CLEAR ?AUTO_6446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6446 ?AUTO_6451 )
      ( MAKE-ON ?AUTO_6446 ?AUTO_6447 )
      ( MAKE-ON-VERIFY ?AUTO_6446 ?AUTO_6447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6452 - BLOCK
      ?AUTO_6453 - BLOCK
    )
    :vars
    (
      ?AUTO_6456 - BLOCK
      ?AUTO_6458 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6452 ?AUTO_6456 ) ( CLEAR ?AUTO_6452 ) ( HOLDING ?AUTO_6453 ) ( CLEAR ?AUTO_6458 ) )
    :subtasks
    ( ( !STACK ?AUTO_6453 ?AUTO_6458 )
      ( MAKE-ON ?AUTO_6452 ?AUTO_6453 )
      ( MAKE-ON-VERIFY ?AUTO_6452 ?AUTO_6453 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6462 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6462 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6462 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6462 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6464 - BLOCK
    )
    :vars
    (
      ?AUTO_6467 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6464 ?AUTO_6467 ) ( CLEAR ?AUTO_6464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6464 ?AUTO_6467 )
      ( MAKE-ON-TABLE ?AUTO_6464 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6464 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6468 - BLOCK
    )
    :vars
    (
      ?AUTO_6470 - BLOCK
      ?AUTO_6471 - BLOCK
      ?AUTO_6472 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6468 ?AUTO_6470 ) ( CLEAR ?AUTO_6468 ) ( HOLDING ?AUTO_6471 ) ( CLEAR ?AUTO_6472 ) )
    :subtasks
    ( ( !STACK ?AUTO_6471 ?AUTO_6472 )
      ( MAKE-ON-TABLE ?AUTO_6468 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6468 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6473 - BLOCK
    )
    :vars
    (
      ?AUTO_6475 - BLOCK
      ?AUTO_6477 - BLOCK
      ?AUTO_6476 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6473 ?AUTO_6475 ) ( CLEAR ?AUTO_6477 ) ( ON ?AUTO_6476 ?AUTO_6473 ) ( CLEAR ?AUTO_6476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6476 ?AUTO_6473 )
      ( MAKE-ON-TABLE ?AUTO_6473 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6473 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6480 - BLOCK
    )
    :vars
    (
      ?AUTO_6483 - BLOCK
      ?AUTO_6484 - BLOCK
      ?AUTO_6481 - BLOCK
      ?AUTO_6486 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6480 ?AUTO_6483 ) ( ON ?AUTO_6484 ?AUTO_6480 ) ( CLEAR ?AUTO_6484 ) ( HOLDING ?AUTO_6481 ) ( CLEAR ?AUTO_6486 ) )
    :subtasks
    ( ( !STACK ?AUTO_6481 ?AUTO_6486 )
      ( MAKE-ON-TABLE ?AUTO_6480 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6490 - BLOCK
      ?AUTO_6491 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6490 ) ( CLEAR ?AUTO_6491 ) )
    :subtasks
    ( ( !STACK ?AUTO_6490 ?AUTO_6491 )
      ( MAKE-ON-VERIFY ?AUTO_6490 ?AUTO_6491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6494 - BLOCK
      ?AUTO_6495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6495 ) ( ON-TABLE ?AUTO_6494 ) ( CLEAR ?AUTO_6494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6494 )
      ( MAKE-ON ?AUTO_6494 ?AUTO_6495 )
      ( MAKE-ON-VERIFY ?AUTO_6494 ?AUTO_6495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6499 - BLOCK
      ?AUTO_6500 - BLOCK
    )
    :vars
    (
      ?AUTO_6503 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6500 ) ( ON-TABLE ?AUTO_6499 ) ( CLEAR ?AUTO_6499 ) ( HOLDING ?AUTO_6503 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6503 )
      ( MAKE-ON ?AUTO_6499 ?AUTO_6500 )
      ( MAKE-ON-VERIFY ?AUTO_6499 ?AUTO_6500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6504 - BLOCK
      ?AUTO_6505 - BLOCK
    )
    :vars
    (
      ?AUTO_6508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6505 ) ( ON-TABLE ?AUTO_6504 ) ( ON ?AUTO_6508 ?AUTO_6504 ) ( CLEAR ?AUTO_6508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6508 ?AUTO_6504 )
      ( MAKE-ON ?AUTO_6504 ?AUTO_6505 )
      ( MAKE-ON-VERIFY ?AUTO_6504 ?AUTO_6505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6511 - BLOCK
      ?AUTO_6512 - BLOCK
    )
    :vars
    (
      ?AUTO_6514 - BLOCK
      ?AUTO_6517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6511 ) ( ON ?AUTO_6514 ?AUTO_6511 ) ( CLEAR ?AUTO_6514 ) ( HOLDING ?AUTO_6512 ) ( CLEAR ?AUTO_6517 ) )
    :subtasks
    ( ( !STACK ?AUTO_6512 ?AUTO_6517 )
      ( MAKE-ON ?AUTO_6511 ?AUTO_6512 )
      ( MAKE-ON-VERIFY ?AUTO_6511 ?AUTO_6512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6518 - BLOCK
      ?AUTO_6519 - BLOCK
    )
    :vars
    (
      ?AUTO_6522 - BLOCK
      ?AUTO_6523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6518 ) ( ON ?AUTO_6522 ?AUTO_6518 ) ( CLEAR ?AUTO_6523 ) ( ON ?AUTO_6519 ?AUTO_6522 ) ( CLEAR ?AUTO_6519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6519 ?AUTO_6522 )
      ( MAKE-ON ?AUTO_6518 ?AUTO_6519 )
      ( MAKE-ON-VERIFY ?AUTO_6518 ?AUTO_6519 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6526 - BLOCK
      ?AUTO_6527 - BLOCK
    )
    :vars
    (
      ?AUTO_6528 - BLOCK
      ?AUTO_6531 - BLOCK
      ?AUTO_6533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6526 ) ( ON ?AUTO_6528 ?AUTO_6526 ) ( ON ?AUTO_6527 ?AUTO_6528 ) ( CLEAR ?AUTO_6527 ) ( HOLDING ?AUTO_6531 ) ( CLEAR ?AUTO_6533 ) )
    :subtasks
    ( ( !STACK ?AUTO_6531 ?AUTO_6533 )
      ( MAKE-ON ?AUTO_6526 ?AUTO_6527 )
      ( MAKE-ON-VERIFY ?AUTO_6526 ?AUTO_6527 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6535 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6535 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6535 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6535 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6537 - BLOCK
    )
    :vars
    (
      ?AUTO_6540 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6537 ?AUTO_6540 ) ( CLEAR ?AUTO_6537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6537 ?AUTO_6540 )
      ( MAKE-ON-TABLE ?AUTO_6537 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6537 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6542 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6542 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6542 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6542 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6544 - BLOCK
    )
    :vars
    (
      ?AUTO_6547 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6544 ?AUTO_6547 ) ( CLEAR ?AUTO_6544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6544 ?AUTO_6547 )
      ( MAKE-ON-TABLE ?AUTO_6544 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6544 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6548 - BLOCK
    )
    :vars
    (
      ?AUTO_6550 - BLOCK
      ?AUTO_6551 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6548 ?AUTO_6550 ) ( CLEAR ?AUTO_6548 ) ( HOLDING ?AUTO_6551 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6551 )
      ( MAKE-ON-TABLE ?AUTO_6548 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6548 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6552 - BLOCK
    )
    :vars
    (
      ?AUTO_6554 - BLOCK
      ?AUTO_6555 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6552 ?AUTO_6554 ) ( ON ?AUTO_6555 ?AUTO_6552 ) ( CLEAR ?AUTO_6555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6555 ?AUTO_6552 )
      ( MAKE-ON-TABLE ?AUTO_6552 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6552 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6559 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6559 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6559 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6559 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6561 - BLOCK
    )
    :vars
    (
      ?AUTO_6564 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6561 ?AUTO_6564 ) ( CLEAR ?AUTO_6561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6561 ?AUTO_6564 )
      ( MAKE-ON-TABLE ?AUTO_6561 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6561 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6565 - BLOCK
    )
    :vars
    (
      ?AUTO_6567 - BLOCK
      ?AUTO_6568 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6565 ?AUTO_6567 ) ( CLEAR ?AUTO_6565 ) ( HOLDING ?AUTO_6568 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6568 )
      ( MAKE-ON-TABLE ?AUTO_6565 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6565 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6569 - BLOCK
    )
    :vars
    (
      ?AUTO_6571 - BLOCK
      ?AUTO_6572 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6569 ?AUTO_6571 ) ( ON ?AUTO_6572 ?AUTO_6569 ) ( CLEAR ?AUTO_6572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6572 ?AUTO_6569 )
      ( MAKE-ON-TABLE ?AUTO_6569 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6569 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6575 - BLOCK
    )
    :vars
    (
      ?AUTO_6576 - BLOCK
      ?AUTO_6577 - BLOCK
      ?AUTO_6579 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6575 ?AUTO_6576 ) ( ON ?AUTO_6577 ?AUTO_6575 ) ( CLEAR ?AUTO_6577 ) ( HOLDING ?AUTO_6579 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6579 )
      ( MAKE-ON-TABLE ?AUTO_6575 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6575 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6580 - BLOCK
    )
    :vars
    (
      ?AUTO_6581 - BLOCK
      ?AUTO_6583 - BLOCK
      ?AUTO_6584 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6580 ?AUTO_6581 ) ( ON ?AUTO_6583 ?AUTO_6580 ) ( ON ?AUTO_6584 ?AUTO_6583 ) ( CLEAR ?AUTO_6584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6584 ?AUTO_6583 )
      ( MAKE-ON-TABLE ?AUTO_6580 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6589 - BLOCK
      ?AUTO_6590 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6589 ) ( CLEAR ?AUTO_6590 ) )
    :subtasks
    ( ( !STACK ?AUTO_6589 ?AUTO_6590 )
      ( MAKE-ON-VERIFY ?AUTO_6589 ?AUTO_6590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6593 - BLOCK
      ?AUTO_6594 - BLOCK
    )
    :vars
    (
      ?AUTO_6598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6594 ) ( ON ?AUTO_6593 ?AUTO_6598 ) ( CLEAR ?AUTO_6593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6593 ?AUTO_6598 )
      ( MAKE-ON ?AUTO_6593 ?AUTO_6594 )
      ( MAKE-ON-VERIFY ?AUTO_6593 ?AUTO_6594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6599 - BLOCK
      ?AUTO_6600 - BLOCK
    )
    :vars
    (
      ?AUTO_6603 - BLOCK
      ?AUTO_6604 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6600 ) ( ON ?AUTO_6599 ?AUTO_6603 ) ( CLEAR ?AUTO_6599 ) ( HOLDING ?AUTO_6604 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6604 )
      ( MAKE-ON ?AUTO_6599 ?AUTO_6600 )
      ( MAKE-ON-VERIFY ?AUTO_6599 ?AUTO_6600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6605 - BLOCK
      ?AUTO_6606 - BLOCK
    )
    :vars
    (
      ?AUTO_6609 - BLOCK
      ?AUTO_6610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6606 ) ( ON ?AUTO_6605 ?AUTO_6609 ) ( ON ?AUTO_6610 ?AUTO_6605 ) ( CLEAR ?AUTO_6610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6610 ?AUTO_6605 )
      ( MAKE-ON ?AUTO_6605 ?AUTO_6606 )
      ( MAKE-ON-VERIFY ?AUTO_6605 ?AUTO_6606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6613 - BLOCK
      ?AUTO_6614 - BLOCK
    )
    :vars
    (
      ?AUTO_6618 - BLOCK
      ?AUTO_6615 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6613 ?AUTO_6618 ) ( ON ?AUTO_6615 ?AUTO_6613 ) ( CLEAR ?AUTO_6615 ) ( HOLDING ?AUTO_6614 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6614 )
      ( MAKE-ON ?AUTO_6613 ?AUTO_6614 )
      ( MAKE-ON-VERIFY ?AUTO_6613 ?AUTO_6614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6620 - BLOCK
      ?AUTO_6621 - BLOCK
    )
    :vars
    (
      ?AUTO_6625 - BLOCK
      ?AUTO_6622 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6620 ?AUTO_6625 ) ( ON ?AUTO_6622 ?AUTO_6620 ) ( ON ?AUTO_6621 ?AUTO_6622 ) ( CLEAR ?AUTO_6621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6621 ?AUTO_6622 )
      ( MAKE-ON ?AUTO_6620 ?AUTO_6621 )
      ( MAKE-ON-VERIFY ?AUTO_6620 ?AUTO_6621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6628 - BLOCK
      ?AUTO_6629 - BLOCK
    )
    :vars
    (
      ?AUTO_6632 - BLOCK
      ?AUTO_6631 - BLOCK
      ?AUTO_6634 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6628 ?AUTO_6632 ) ( ON ?AUTO_6631 ?AUTO_6628 ) ( ON ?AUTO_6629 ?AUTO_6631 ) ( CLEAR ?AUTO_6629 ) ( HOLDING ?AUTO_6634 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6634 )
      ( MAKE-ON ?AUTO_6628 ?AUTO_6629 )
      ( MAKE-ON-VERIFY ?AUTO_6628 ?AUTO_6629 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6635 - BLOCK
      ?AUTO_6636 - BLOCK
    )
    :vars
    (
      ?AUTO_6640 - BLOCK
      ?AUTO_6639 - BLOCK
      ?AUTO_6641 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6635 ?AUTO_6640 ) ( ON ?AUTO_6639 ?AUTO_6635 ) ( ON ?AUTO_6636 ?AUTO_6639 ) ( ON ?AUTO_6641 ?AUTO_6636 ) ( CLEAR ?AUTO_6641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6641 ?AUTO_6636 )
      ( MAKE-ON ?AUTO_6635 ?AUTO_6636 )
      ( MAKE-ON-VERIFY ?AUTO_6635 ?AUTO_6636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6646 - BLOCK
      ?AUTO_6647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6646 ) ( CLEAR ?AUTO_6647 ) )
    :subtasks
    ( ( !STACK ?AUTO_6646 ?AUTO_6647 )
      ( MAKE-ON-VERIFY ?AUTO_6646 ?AUTO_6647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6650 - BLOCK
      ?AUTO_6651 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6651 ) ( ON-TABLE ?AUTO_6650 ) ( CLEAR ?AUTO_6650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6650 )
      ( MAKE-ON ?AUTO_6650 ?AUTO_6651 )
      ( MAKE-ON-VERIFY ?AUTO_6650 ?AUTO_6651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6655 - BLOCK
      ?AUTO_6656 - BLOCK
    )
    :vars
    (
      ?AUTO_6659 - BLOCK
      ?AUTO_6660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6656 ) ( ON-TABLE ?AUTO_6655 ) ( CLEAR ?AUTO_6655 ) ( HOLDING ?AUTO_6659 ) ( CLEAR ?AUTO_6660 ) )
    :subtasks
    ( ( !STACK ?AUTO_6659 ?AUTO_6660 )
      ( MAKE-ON ?AUTO_6655 ?AUTO_6656 )
      ( MAKE-ON-VERIFY ?AUTO_6655 ?AUTO_6656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6661 - BLOCK
      ?AUTO_6662 - BLOCK
    )
    :vars
    (
      ?AUTO_6664 - BLOCK
      ?AUTO_6666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6661 ) ( CLEAR ?AUTO_6661 ) ( CLEAR ?AUTO_6664 ) ( ON ?AUTO_6666 ?AUTO_6662 ) ( CLEAR ?AUTO_6666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6666 ?AUTO_6662 )
      ( MAKE-ON ?AUTO_6661 ?AUTO_6662 )
      ( MAKE-ON-VERIFY ?AUTO_6661 ?AUTO_6662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6669 - BLOCK
      ?AUTO_6670 - BLOCK
    )
    :vars
    (
      ?AUTO_6673 - BLOCK
      ?AUTO_6674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6673 ) ( ON ?AUTO_6674 ?AUTO_6670 ) ( CLEAR ?AUTO_6674 ) ( HOLDING ?AUTO_6669 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6669 )
      ( MAKE-ON ?AUTO_6669 ?AUTO_6670 )
      ( MAKE-ON-VERIFY ?AUTO_6669 ?AUTO_6670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6676 - BLOCK
      ?AUTO_6677 - BLOCK
    )
    :vars
    (
      ?AUTO_6681 - BLOCK
      ?AUTO_6680 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6681 ) ( ON ?AUTO_6680 ?AUTO_6677 ) ( ON ?AUTO_6676 ?AUTO_6680 ) ( CLEAR ?AUTO_6676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6676 ?AUTO_6680 )
      ( MAKE-ON ?AUTO_6676 ?AUTO_6677 )
      ( MAKE-ON-VERIFY ?AUTO_6676 ?AUTO_6677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6684 - BLOCK
      ?AUTO_6685 - BLOCK
    )
    :vars
    (
      ?AUTO_6686 - BLOCK
      ?AUTO_6688 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6686 ?AUTO_6685 ) ( ON ?AUTO_6684 ?AUTO_6686 ) ( CLEAR ?AUTO_6684 ) ( HOLDING ?AUTO_6688 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6688 )
      ( MAKE-ON ?AUTO_6684 ?AUTO_6685 )
      ( MAKE-ON-VERIFY ?AUTO_6684 ?AUTO_6685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6691 - BLOCK
      ?AUTO_6692 - BLOCK
    )
    :vars
    (
      ?AUTO_6694 - BLOCK
      ?AUTO_6693 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6694 ?AUTO_6692 ) ( ON ?AUTO_6691 ?AUTO_6694 ) ( ON ?AUTO_6693 ?AUTO_6691 ) ( CLEAR ?AUTO_6693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6693 ?AUTO_6691 )
      ( MAKE-ON ?AUTO_6691 ?AUTO_6692 )
      ( MAKE-ON-VERIFY ?AUTO_6691 ?AUTO_6692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6699 - BLOCK
      ?AUTO_6700 - BLOCK
    )
    :vars
    (
      ?AUTO_6703 - BLOCK
      ?AUTO_6702 - BLOCK
      ?AUTO_6705 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6703 ?AUTO_6700 ) ( ON ?AUTO_6699 ?AUTO_6703 ) ( ON ?AUTO_6702 ?AUTO_6699 ) ( CLEAR ?AUTO_6702 ) ( HOLDING ?AUTO_6705 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6705 )
      ( MAKE-ON ?AUTO_6699 ?AUTO_6700 )
      ( MAKE-ON-VERIFY ?AUTO_6699 ?AUTO_6700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6706 - BLOCK
      ?AUTO_6707 - BLOCK
    )
    :vars
    (
      ?AUTO_6708 - BLOCK
      ?AUTO_6709 - BLOCK
      ?AUTO_6712 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6708 ?AUTO_6707 ) ( ON ?AUTO_6706 ?AUTO_6708 ) ( ON ?AUTO_6709 ?AUTO_6706 ) ( ON ?AUTO_6712 ?AUTO_6709 ) ( CLEAR ?AUTO_6712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6712 ?AUTO_6709 )
      ( MAKE-ON ?AUTO_6706 ?AUTO_6707 )
      ( MAKE-ON-VERIFY ?AUTO_6706 ?AUTO_6707 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6714 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6714 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6714 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6714 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6716 - BLOCK
    )
    :vars
    (
      ?AUTO_6719 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6716 ?AUTO_6719 ) ( CLEAR ?AUTO_6716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6716 ?AUTO_6719 )
      ( MAKE-ON-TABLE ?AUTO_6716 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6716 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6721 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6721 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6721 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6721 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6723 - BLOCK
    )
    :vars
    (
      ?AUTO_6726 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6723 ?AUTO_6726 ) ( CLEAR ?AUTO_6723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6723 ?AUTO_6726 )
      ( MAKE-ON-TABLE ?AUTO_6723 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6723 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6727 - BLOCK
    )
    :vars
    (
      ?AUTO_6729 - BLOCK
      ?AUTO_6730 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6727 ?AUTO_6729 ) ( CLEAR ?AUTO_6727 ) ( HOLDING ?AUTO_6730 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6730 )
      ( MAKE-ON-TABLE ?AUTO_6727 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6727 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6731 - BLOCK
    )
    :vars
    (
      ?AUTO_6733 - BLOCK
      ?AUTO_6734 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6731 ?AUTO_6733 ) ( ON ?AUTO_6734 ?AUTO_6731 ) ( CLEAR ?AUTO_6734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6734 ?AUTO_6731 )
      ( MAKE-ON-TABLE ?AUTO_6731 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6731 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6738 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6738 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6738 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6738 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6740 - BLOCK
    )
    :vars
    (
      ?AUTO_6743 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6740 ?AUTO_6743 ) ( CLEAR ?AUTO_6740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6740 ?AUTO_6743 )
      ( MAKE-ON-TABLE ?AUTO_6740 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6740 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6744 - BLOCK
    )
    :vars
    (
      ?AUTO_6746 - BLOCK
      ?AUTO_6747 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6744 ?AUTO_6746 ) ( CLEAR ?AUTO_6744 ) ( HOLDING ?AUTO_6747 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6747 )
      ( MAKE-ON-TABLE ?AUTO_6744 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6744 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6748 - BLOCK
    )
    :vars
    (
      ?AUTO_6750 - BLOCK
      ?AUTO_6751 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6748 ?AUTO_6750 ) ( ON ?AUTO_6751 ?AUTO_6748 ) ( CLEAR ?AUTO_6751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6751 ?AUTO_6748 )
      ( MAKE-ON-TABLE ?AUTO_6748 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6748 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6754 - BLOCK
    )
    :vars
    (
      ?AUTO_6755 - BLOCK
      ?AUTO_6756 - BLOCK
      ?AUTO_6758 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6754 ?AUTO_6755 ) ( ON ?AUTO_6756 ?AUTO_6754 ) ( CLEAR ?AUTO_6756 ) ( HOLDING ?AUTO_6758 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6758 )
      ( MAKE-ON-TABLE ?AUTO_6754 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6754 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6759 - BLOCK
    )
    :vars
    (
      ?AUTO_6760 - BLOCK
      ?AUTO_6762 - BLOCK
      ?AUTO_6763 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6759 ?AUTO_6760 ) ( ON ?AUTO_6762 ?AUTO_6759 ) ( ON ?AUTO_6763 ?AUTO_6762 ) ( CLEAR ?AUTO_6763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6763 ?AUTO_6762 )
      ( MAKE-ON-TABLE ?AUTO_6759 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6759 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6767 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6767 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6767 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6767 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6769 - BLOCK
    )
    :vars
    (
      ?AUTO_6772 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6769 ?AUTO_6772 ) ( CLEAR ?AUTO_6769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6769 ?AUTO_6772 )
      ( MAKE-ON-TABLE ?AUTO_6769 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6769 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6773 - BLOCK
    )
    :vars
    (
      ?AUTO_6775 - BLOCK
      ?AUTO_6776 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6773 ?AUTO_6775 ) ( CLEAR ?AUTO_6773 ) ( HOLDING ?AUTO_6776 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6776 )
      ( MAKE-ON-TABLE ?AUTO_6773 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6773 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6777 - BLOCK
    )
    :vars
    (
      ?AUTO_6779 - BLOCK
      ?AUTO_6780 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6777 ?AUTO_6779 ) ( ON ?AUTO_6780 ?AUTO_6777 ) ( CLEAR ?AUTO_6780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6780 ?AUTO_6777 )
      ( MAKE-ON-TABLE ?AUTO_6777 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6777 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6783 - BLOCK
    )
    :vars
    (
      ?AUTO_6785 - BLOCK
      ?AUTO_6784 - BLOCK
      ?AUTO_6787 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6783 ?AUTO_6785 ) ( ON ?AUTO_6784 ?AUTO_6783 ) ( CLEAR ?AUTO_6784 ) ( HOLDING ?AUTO_6787 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6787 )
      ( MAKE-ON-TABLE ?AUTO_6783 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6783 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6788 - BLOCK
    )
    :vars
    (
      ?AUTO_6791 - BLOCK
      ?AUTO_6790 - BLOCK
      ?AUTO_6792 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6788 ?AUTO_6791 ) ( ON ?AUTO_6790 ?AUTO_6788 ) ( ON ?AUTO_6792 ?AUTO_6790 ) ( CLEAR ?AUTO_6792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6792 ?AUTO_6790 )
      ( MAKE-ON-TABLE ?AUTO_6788 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6788 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6795 - BLOCK
    )
    :vars
    (
      ?AUTO_6798 - BLOCK
      ?AUTO_6799 - BLOCK
      ?AUTO_6796 - BLOCK
      ?AUTO_6800 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6795 ?AUTO_6798 ) ( ON ?AUTO_6799 ?AUTO_6795 ) ( ON ?AUTO_6796 ?AUTO_6799 ) ( CLEAR ?AUTO_6796 ) ( HOLDING ?AUTO_6800 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6800 )
      ( MAKE-ON-TABLE ?AUTO_6795 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6795 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6801 - BLOCK
    )
    :vars
    (
      ?AUTO_6806 - BLOCK
      ?AUTO_6805 - BLOCK
      ?AUTO_6802 - BLOCK
      ?AUTO_6804 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6801 ?AUTO_6806 ) ( ON ?AUTO_6805 ?AUTO_6801 ) ( ON ?AUTO_6802 ?AUTO_6805 ) ( ON ?AUTO_6804 ?AUTO_6802 ) ( CLEAR ?AUTO_6804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6804 ?AUTO_6802 )
      ( MAKE-ON-TABLE ?AUTO_6801 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6811 - BLOCK
      ?AUTO_6812 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6811 ) ( CLEAR ?AUTO_6812 ) )
    :subtasks
    ( ( !STACK ?AUTO_6811 ?AUTO_6812 )
      ( MAKE-ON-VERIFY ?AUTO_6811 ?AUTO_6812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6815 - BLOCK
      ?AUTO_6816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6816 ) ( ON-TABLE ?AUTO_6815 ) ( CLEAR ?AUTO_6815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6815 )
      ( MAKE-ON ?AUTO_6815 ?AUTO_6816 )
      ( MAKE-ON-VERIFY ?AUTO_6815 ?AUTO_6816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6820 - BLOCK
      ?AUTO_6821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6820 ) ( CLEAR ?AUTO_6820 ) ( HOLDING ?AUTO_6821 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6821 )
      ( MAKE-ON ?AUTO_6820 ?AUTO_6821 )
      ( MAKE-ON-VERIFY ?AUTO_6820 ?AUTO_6821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6825 - BLOCK
      ?AUTO_6826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6825 ) ( ON ?AUTO_6826 ?AUTO_6825 ) ( CLEAR ?AUTO_6826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6826 ?AUTO_6825 )
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
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6831 ) ( ON ?AUTO_6832 ?AUTO_6831 ) ( CLEAR ?AUTO_6832 ) ( HOLDING ?AUTO_6835 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6835 )
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
    ( and ( ON-TABLE ?AUTO_6836 ) ( ON ?AUTO_6837 ?AUTO_6836 ) ( ON ?AUTO_6840 ?AUTO_6837 ) ( CLEAR ?AUTO_6840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6840 ?AUTO_6837 )
      ( MAKE-ON ?AUTO_6836 ?AUTO_6837 )
      ( MAKE-ON-VERIFY ?AUTO_6836 ?AUTO_6837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6843 - BLOCK
      ?AUTO_6844 - BLOCK
    )
    :vars
    (
      ?AUTO_6846 - BLOCK
      ?AUTO_6848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6843 ) ( ON ?AUTO_6844 ?AUTO_6843 ) ( ON ?AUTO_6846 ?AUTO_6844 ) ( CLEAR ?AUTO_6846 ) ( HOLDING ?AUTO_6848 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6848 )
      ( MAKE-ON ?AUTO_6843 ?AUTO_6844 )
      ( MAKE-ON-VERIFY ?AUTO_6843 ?AUTO_6844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6849 - BLOCK
      ?AUTO_6850 - BLOCK
    )
    :vars
    (
      ?AUTO_6851 - BLOCK
      ?AUTO_6854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6849 ) ( ON ?AUTO_6850 ?AUTO_6849 ) ( ON ?AUTO_6851 ?AUTO_6850 ) ( ON ?AUTO_6854 ?AUTO_6851 ) ( CLEAR ?AUTO_6854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6854 ?AUTO_6851 )
      ( MAKE-ON ?AUTO_6849 ?AUTO_6850 )
      ( MAKE-ON-VERIFY ?AUTO_6849 ?AUTO_6850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6857 - BLOCK
      ?AUTO_6858 - BLOCK
    )
    :vars
    (
      ?AUTO_6859 - BLOCK
      ?AUTO_6861 - BLOCK
      ?AUTO_6863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6857 ) ( ON ?AUTO_6858 ?AUTO_6857 ) ( ON ?AUTO_6859 ?AUTO_6858 ) ( ON ?AUTO_6861 ?AUTO_6859 ) ( CLEAR ?AUTO_6861 ) ( HOLDING ?AUTO_6863 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6863 )
      ( MAKE-ON ?AUTO_6857 ?AUTO_6858 )
      ( MAKE-ON-VERIFY ?AUTO_6857 ?AUTO_6858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6864 - BLOCK
      ?AUTO_6865 - BLOCK
    )
    :vars
    (
      ?AUTO_6866 - BLOCK
      ?AUTO_6869 - BLOCK
      ?AUTO_6870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6864 ) ( ON ?AUTO_6865 ?AUTO_6864 ) ( ON ?AUTO_6866 ?AUTO_6865 ) ( ON ?AUTO_6869 ?AUTO_6866 ) ( ON ?AUTO_6870 ?AUTO_6869 ) ( CLEAR ?AUTO_6870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6870 ?AUTO_6869 )
      ( MAKE-ON ?AUTO_6864 ?AUTO_6865 )
      ( MAKE-ON-VERIFY ?AUTO_6864 ?AUTO_6865 ) )
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

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6880 - BLOCK
      ?AUTO_6881 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6880 ) ( CLEAR ?AUTO_6881 ) )
    :subtasks
    ( ( !STACK ?AUTO_6880 ?AUTO_6881 )
      ( MAKE-ON-VERIFY ?AUTO_6880 ?AUTO_6881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6884 - BLOCK
      ?AUTO_6885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6885 ) ( ON-TABLE ?AUTO_6884 ) ( CLEAR ?AUTO_6884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6884 )
      ( MAKE-ON ?AUTO_6884 ?AUTO_6885 )
      ( MAKE-ON-VERIFY ?AUTO_6884 ?AUTO_6885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6889 - BLOCK
      ?AUTO_6890 - BLOCK
    )
    :vars
    (
      ?AUTO_6893 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6890 ) ( ON-TABLE ?AUTO_6889 ) ( CLEAR ?AUTO_6889 ) ( HOLDING ?AUTO_6893 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6893 )
      ( MAKE-ON ?AUTO_6889 ?AUTO_6890 )
      ( MAKE-ON-VERIFY ?AUTO_6889 ?AUTO_6890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6894 - BLOCK
      ?AUTO_6895 - BLOCK
    )
    :vars
    (
      ?AUTO_6898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6894 ) ( CLEAR ?AUTO_6894 ) ( ON ?AUTO_6898 ?AUTO_6895 ) ( CLEAR ?AUTO_6898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6898 ?AUTO_6895 )
      ( MAKE-ON ?AUTO_6894 ?AUTO_6895 )
      ( MAKE-ON-VERIFY ?AUTO_6894 ?AUTO_6895 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6902 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6902 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6902 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6902 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6904 - BLOCK
    )
    :vars
    (
      ?AUTO_6907 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6904 ?AUTO_6907 ) ( CLEAR ?AUTO_6904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6904 ?AUTO_6907 )
      ( MAKE-ON-TABLE ?AUTO_6904 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6904 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6908 - BLOCK
    )
    :vars
    (
      ?AUTO_6910 - BLOCK
      ?AUTO_6911 - BLOCK
      ?AUTO_6912 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6908 ?AUTO_6910 ) ( CLEAR ?AUTO_6908 ) ( HOLDING ?AUTO_6911 ) ( CLEAR ?AUTO_6912 ) )
    :subtasks
    ( ( !STACK ?AUTO_6911 ?AUTO_6912 )
      ( MAKE-ON-TABLE ?AUTO_6908 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6918 - BLOCK
      ?AUTO_6919 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6918 ) ( CLEAR ?AUTO_6919 ) )
    :subtasks
    ( ( !STACK ?AUTO_6918 ?AUTO_6919 )
      ( MAKE-ON-VERIFY ?AUTO_6918 ?AUTO_6919 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6922 - BLOCK
      ?AUTO_6923 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6923 ) ( ON-TABLE ?AUTO_6922 ) ( CLEAR ?AUTO_6922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6922 )
      ( MAKE-ON ?AUTO_6922 ?AUTO_6923 )
      ( MAKE-ON-VERIFY ?AUTO_6922 ?AUTO_6923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6927 - BLOCK
      ?AUTO_6928 - BLOCK
    )
    :vars
    (
      ?AUTO_6931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6928 ) ( ON-TABLE ?AUTO_6927 ) ( CLEAR ?AUTO_6927 ) ( HOLDING ?AUTO_6931 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6931 )
      ( MAKE-ON ?AUTO_6927 ?AUTO_6928 )
      ( MAKE-ON-VERIFY ?AUTO_6927 ?AUTO_6928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6932 - BLOCK
      ?AUTO_6933 - BLOCK
    )
    :vars
    (
      ?AUTO_6936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6933 ) ( ON-TABLE ?AUTO_6932 ) ( ON ?AUTO_6936 ?AUTO_6932 ) ( CLEAR ?AUTO_6936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6936 ?AUTO_6932 )
      ( MAKE-ON ?AUTO_6932 ?AUTO_6933 )
      ( MAKE-ON-VERIFY ?AUTO_6932 ?AUTO_6933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6939 - BLOCK
      ?AUTO_6940 - BLOCK
    )
    :vars
    (
      ?AUTO_6943 - BLOCK
      ?AUTO_6945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6939 ) ( ON ?AUTO_6943 ?AUTO_6939 ) ( CLEAR ?AUTO_6943 ) ( HOLDING ?AUTO_6940 ) ( CLEAR ?AUTO_6945 ) )
    :subtasks
    ( ( !STACK ?AUTO_6940 ?AUTO_6945 )
      ( MAKE-ON ?AUTO_6939 ?AUTO_6940 )
      ( MAKE-ON-VERIFY ?AUTO_6939 ?AUTO_6940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6948 - BLOCK
      ?AUTO_6949 - BLOCK
    )
    :vars
    (
      ?AUTO_6952 - BLOCK
      ?AUTO_6953 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6949 ) ( ON-TABLE ?AUTO_6948 ) ( ON ?AUTO_6952 ?AUTO_6948 ) ( CLEAR ?AUTO_6952 ) ( HOLDING ?AUTO_6953 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6953 )
      ( MAKE-ON ?AUTO_6948 ?AUTO_6949 )
      ( MAKE-ON-VERIFY ?AUTO_6948 ?AUTO_6949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6958 - BLOCK
      ?AUTO_6959 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6958 ) ( CLEAR ?AUTO_6959 ) )
    :subtasks
    ( ( !STACK ?AUTO_6958 ?AUTO_6959 )
      ( MAKE-ON-VERIFY ?AUTO_6958 ?AUTO_6959 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6962 - BLOCK
      ?AUTO_6963 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6963 ) ( ON-TABLE ?AUTO_6962 ) ( CLEAR ?AUTO_6962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6962 )
      ( MAKE-ON ?AUTO_6962 ?AUTO_6963 )
      ( MAKE-ON-VERIFY ?AUTO_6962 ?AUTO_6963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6967 - BLOCK
      ?AUTO_6968 - BLOCK
    )
    :vars
    (
      ?AUTO_6972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6967 ) ( CLEAR ?AUTO_6967 ) ( HOLDING ?AUTO_6968 ) ( CLEAR ?AUTO_6972 ) )
    :subtasks
    ( ( !STACK ?AUTO_6968 ?AUTO_6972 )
      ( MAKE-ON ?AUTO_6967 ?AUTO_6968 )
      ( MAKE-ON-VERIFY ?AUTO_6967 ?AUTO_6968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6975 - BLOCK
      ?AUTO_6976 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6975 ) ( CLEAR ?AUTO_6976 ) )
    :subtasks
    ( ( !STACK ?AUTO_6975 ?AUTO_6976 )
      ( MAKE-ON-VERIFY ?AUTO_6975 ?AUTO_6976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6979 - BLOCK
      ?AUTO_6980 - BLOCK
    )
    :vars
    (
      ?AUTO_6984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6980 ) ( ON ?AUTO_6979 ?AUTO_6984 ) ( CLEAR ?AUTO_6979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6979 ?AUTO_6984 )
      ( MAKE-ON ?AUTO_6979 ?AUTO_6980 )
      ( MAKE-ON-VERIFY ?AUTO_6979 ?AUTO_6980 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6986 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6986 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6986 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6986 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6988 - BLOCK
    )
    :vars
    (
      ?AUTO_6991 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6988 ?AUTO_6991 ) ( CLEAR ?AUTO_6988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6988 ?AUTO_6991 )
      ( MAKE-ON-TABLE ?AUTO_6988 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6988 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6992 - BLOCK
    )
    :vars
    (
      ?AUTO_6994 - BLOCK
      ?AUTO_6995 - BLOCK
      ?AUTO_6996 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6992 ?AUTO_6994 ) ( CLEAR ?AUTO_6992 ) ( HOLDING ?AUTO_6995 ) ( CLEAR ?AUTO_6996 ) )
    :subtasks
    ( ( !STACK ?AUTO_6995 ?AUTO_6996 )
      ( MAKE-ON-TABLE ?AUTO_6992 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6992 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6997 - BLOCK
    )
    :vars
    (
      ?AUTO_6999 - BLOCK
      ?AUTO_7001 - BLOCK
      ?AUTO_7000 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6997 ?AUTO_6999 ) ( CLEAR ?AUTO_7001 ) ( ON ?AUTO_7000 ?AUTO_6997 ) ( CLEAR ?AUTO_7000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7000 ?AUTO_6997 )
      ( MAKE-ON-TABLE ?AUTO_6997 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6997 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7005 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7005 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7005 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7005 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7007 - BLOCK
    )
    :vars
    (
      ?AUTO_7010 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7007 ?AUTO_7010 ) ( CLEAR ?AUTO_7007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7007 ?AUTO_7010 )
      ( MAKE-ON-TABLE ?AUTO_7007 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7007 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7011 - BLOCK
    )
    :vars
    (
      ?AUTO_7013 - BLOCK
      ?AUTO_7014 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7011 ?AUTO_7013 ) ( CLEAR ?AUTO_7011 ) ( HOLDING ?AUTO_7014 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7014 )
      ( MAKE-ON-TABLE ?AUTO_7011 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7020 - BLOCK
      ?AUTO_7021 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7020 ) ( CLEAR ?AUTO_7021 ) )
    :subtasks
    ( ( !STACK ?AUTO_7020 ?AUTO_7021 )
      ( MAKE-ON-VERIFY ?AUTO_7020 ?AUTO_7021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7024 - BLOCK
      ?AUTO_7025 - BLOCK
    )
    :vars
    (
      ?AUTO_7029 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7025 ) ( ON ?AUTO_7024 ?AUTO_7029 ) ( CLEAR ?AUTO_7024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7024 ?AUTO_7029 )
      ( MAKE-ON ?AUTO_7024 ?AUTO_7025 )
      ( MAKE-ON-VERIFY ?AUTO_7024 ?AUTO_7025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7030 - BLOCK
      ?AUTO_7031 - BLOCK
    )
    :vars
    (
      ?AUTO_7034 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7030 ?AUTO_7034 ) ( CLEAR ?AUTO_7030 ) ( HOLDING ?AUTO_7031 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7031 )
      ( MAKE-ON ?AUTO_7030 ?AUTO_7031 )
      ( MAKE-ON-VERIFY ?AUTO_7030 ?AUTO_7031 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7036 - BLOCK
      ?AUTO_7037 - BLOCK
    )
    :vars
    (
      ?AUTO_7040 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7036 ?AUTO_7040 ) ( ON ?AUTO_7037 ?AUTO_7036 ) ( CLEAR ?AUTO_7037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7037 ?AUTO_7036 )
      ( MAKE-ON ?AUTO_7036 ?AUTO_7037 )
      ( MAKE-ON-VERIFY ?AUTO_7036 ?AUTO_7037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7043 - BLOCK
      ?AUTO_7044 - BLOCK
    )
    :vars
    (
      ?AUTO_7047 - BLOCK
      ?AUTO_7048 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7043 ?AUTO_7047 ) ( ON ?AUTO_7044 ?AUTO_7043 ) ( CLEAR ?AUTO_7044 ) ( HOLDING ?AUTO_7048 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7048 )
      ( MAKE-ON ?AUTO_7043 ?AUTO_7044 )
      ( MAKE-ON-VERIFY ?AUTO_7043 ?AUTO_7044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7057 - BLOCK
      ?AUTO_7058 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7057 ) ( CLEAR ?AUTO_7058 ) )
    :subtasks
    ( ( !STACK ?AUTO_7057 ?AUTO_7058 )
      ( MAKE-ON-VERIFY ?AUTO_7057 ?AUTO_7058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7061 - BLOCK
      ?AUTO_7062 - BLOCK
    )
    :vars
    (
      ?AUTO_7066 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7062 ) ( ON ?AUTO_7061 ?AUTO_7066 ) ( CLEAR ?AUTO_7061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7061 ?AUTO_7066 )
      ( MAKE-ON ?AUTO_7061 ?AUTO_7062 )
      ( MAKE-ON-VERIFY ?AUTO_7061 ?AUTO_7062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7067 - BLOCK
      ?AUTO_7068 - BLOCK
    )
    :vars
    (
      ?AUTO_7071 - BLOCK
      ?AUTO_7073 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7067 ?AUTO_7071 ) ( CLEAR ?AUTO_7067 ) ( HOLDING ?AUTO_7068 ) ( CLEAR ?AUTO_7073 ) )
    :subtasks
    ( ( !STACK ?AUTO_7068 ?AUTO_7073 )
      ( MAKE-ON ?AUTO_7067 ?AUTO_7068 )
      ( MAKE-ON-VERIFY ?AUTO_7067 ?AUTO_7068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7074 - BLOCK
      ?AUTO_7075 - BLOCK
    )
    :vars
    (
      ?AUTO_7078 - BLOCK
      ?AUTO_7079 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7074 ?AUTO_7078 ) ( CLEAR ?AUTO_7079 ) ( ON ?AUTO_7075 ?AUTO_7074 ) ( CLEAR ?AUTO_7075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7075 ?AUTO_7074 )
      ( MAKE-ON ?AUTO_7074 ?AUTO_7075 )
      ( MAKE-ON-VERIFY ?AUTO_7074 ?AUTO_7075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7082 - BLOCK
      ?AUTO_7083 - BLOCK
    )
    :vars
    (
      ?AUTO_7087 - BLOCK
      ?AUTO_7084 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7082 ?AUTO_7087 ) ( ON ?AUTO_7083 ?AUTO_7082 ) ( CLEAR ?AUTO_7083 ) ( HOLDING ?AUTO_7084 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7084 )
      ( MAKE-ON ?AUTO_7082 ?AUTO_7083 )
      ( MAKE-ON-VERIFY ?AUTO_7082 ?AUTO_7083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7089 - BLOCK
      ?AUTO_7090 - BLOCK
    )
    :vars
    (
      ?AUTO_7094 - BLOCK
      ?AUTO_7092 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7089 ?AUTO_7094 ) ( ON ?AUTO_7090 ?AUTO_7089 ) ( ON ?AUTO_7092 ?AUTO_7090 ) ( CLEAR ?AUTO_7092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7092 ?AUTO_7090 )
      ( MAKE-ON ?AUTO_7089 ?AUTO_7090 )
      ( MAKE-ON-VERIFY ?AUTO_7089 ?AUTO_7090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7097 - BLOCK
      ?AUTO_7098 - BLOCK
    )
    :vars
    (
      ?AUTO_7100 - BLOCK
      ?AUTO_7101 - BLOCK
      ?AUTO_7103 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7097 ?AUTO_7100 ) ( ON ?AUTO_7098 ?AUTO_7097 ) ( ON ?AUTO_7101 ?AUTO_7098 ) ( CLEAR ?AUTO_7101 ) ( HOLDING ?AUTO_7103 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7103 )
      ( MAKE-ON ?AUTO_7097 ?AUTO_7098 )
      ( MAKE-ON-VERIFY ?AUTO_7097 ?AUTO_7098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7112 - BLOCK
      ?AUTO_7113 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7112 ) ( CLEAR ?AUTO_7113 ) )
    :subtasks
    ( ( !STACK ?AUTO_7112 ?AUTO_7113 )
      ( MAKE-ON-VERIFY ?AUTO_7112 ?AUTO_7113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7116 - BLOCK
      ?AUTO_7117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7117 ) ( ON-TABLE ?AUTO_7116 ) ( CLEAR ?AUTO_7116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7116 )
      ( MAKE-ON ?AUTO_7116 ?AUTO_7117 )
      ( MAKE-ON-VERIFY ?AUTO_7116 ?AUTO_7117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7121 - BLOCK
      ?AUTO_7122 - BLOCK
    )
    :vars
    (
      ?AUTO_7125 - BLOCK
      ?AUTO_7126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7122 ) ( ON-TABLE ?AUTO_7121 ) ( CLEAR ?AUTO_7121 ) ( HOLDING ?AUTO_7125 ) ( CLEAR ?AUTO_7126 ) )
    :subtasks
    ( ( !STACK ?AUTO_7125 ?AUTO_7126 )
      ( MAKE-ON ?AUTO_7121 ?AUTO_7122 )
      ( MAKE-ON-VERIFY ?AUTO_7121 ?AUTO_7122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7127 - BLOCK
      ?AUTO_7128 - BLOCK
    )
    :vars
    (
      ?AUTO_7129 - BLOCK
      ?AUTO_7131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7128 ) ( ON-TABLE ?AUTO_7127 ) ( CLEAR ?AUTO_7129 ) ( ON ?AUTO_7131 ?AUTO_7127 ) ( CLEAR ?AUTO_7131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7131 ?AUTO_7127 )
      ( MAKE-ON ?AUTO_7127 ?AUTO_7128 )
      ( MAKE-ON-VERIFY ?AUTO_7127 ?AUTO_7128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7135 - BLOCK
      ?AUTO_7136 - BLOCK
    )
    :vars
    (
      ?AUTO_7139 - BLOCK
      ?AUTO_7140 - BLOCK
      ?AUTO_7142 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7136 ) ( ON-TABLE ?AUTO_7135 ) ( ON ?AUTO_7139 ?AUTO_7135 ) ( CLEAR ?AUTO_7139 ) ( HOLDING ?AUTO_7140 ) ( CLEAR ?AUTO_7142 ) )
    :subtasks
    ( ( !STACK ?AUTO_7140 ?AUTO_7142 )
      ( MAKE-ON ?AUTO_7135 ?AUTO_7136 )
      ( MAKE-ON-VERIFY ?AUTO_7135 ?AUTO_7136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7143 - BLOCK
      ?AUTO_7144 - BLOCK
    )
    :vars
    (
      ?AUTO_7148 - BLOCK
      ?AUTO_7149 - BLOCK
      ?AUTO_7147 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7144 ) ( ON-TABLE ?AUTO_7143 ) ( ON ?AUTO_7148 ?AUTO_7143 ) ( CLEAR ?AUTO_7149 ) ( ON ?AUTO_7147 ?AUTO_7148 ) ( CLEAR ?AUTO_7147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7147 ?AUTO_7148 )
      ( MAKE-ON ?AUTO_7143 ?AUTO_7144 )
      ( MAKE-ON-VERIFY ?AUTO_7143 ?AUTO_7144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7152 - BLOCK
      ?AUTO_7153 - BLOCK
    )
    :vars
    (
      ?AUTO_7155 - BLOCK
      ?AUTO_7156 - BLOCK
      ?AUTO_7154 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7153 ) ( ON-TABLE ?AUTO_7152 ) ( ON ?AUTO_7155 ?AUTO_7152 ) ( ON ?AUTO_7156 ?AUTO_7155 ) ( CLEAR ?AUTO_7156 ) ( HOLDING ?AUTO_7154 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7154 )
      ( MAKE-ON ?AUTO_7152 ?AUTO_7153 )
      ( MAKE-ON-VERIFY ?AUTO_7152 ?AUTO_7153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7160 - BLOCK
      ?AUTO_7161 - BLOCK
    )
    :vars
    (
      ?AUTO_7163 - BLOCK
      ?AUTO_7166 - BLOCK
      ?AUTO_7164 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7161 ) ( ON-TABLE ?AUTO_7160 ) ( ON ?AUTO_7163 ?AUTO_7160 ) ( ON ?AUTO_7166 ?AUTO_7163 ) ( ON ?AUTO_7164 ?AUTO_7166 ) ( CLEAR ?AUTO_7164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7164 ?AUTO_7166 )
      ( MAKE-ON ?AUTO_7160 ?AUTO_7161 )
      ( MAKE-ON-VERIFY ?AUTO_7160 ?AUTO_7161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7169 - BLOCK
      ?AUTO_7170 - BLOCK
    )
    :vars
    (
      ?AUTO_7171 - BLOCK
      ?AUTO_7175 - BLOCK
      ?AUTO_7174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7169 ) ( ON ?AUTO_7171 ?AUTO_7169 ) ( ON ?AUTO_7175 ?AUTO_7171 ) ( ON ?AUTO_7174 ?AUTO_7175 ) ( CLEAR ?AUTO_7174 ) ( HOLDING ?AUTO_7170 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7170 )
      ( MAKE-ON ?AUTO_7169 ?AUTO_7170 )
      ( MAKE-ON-VERIFY ?AUTO_7169 ?AUTO_7170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7181 - BLOCK
      ?AUTO_7182 - BLOCK
    )
    :vars
    (
      ?AUTO_7183 - BLOCK
      ?AUTO_7187 - BLOCK
      ?AUTO_7184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7181 ) ( ON ?AUTO_7183 ?AUTO_7181 ) ( ON ?AUTO_7187 ?AUTO_7183 ) ( CLEAR ?AUTO_7187 ) ( ON ?AUTO_7184 ?AUTO_7182 ) ( CLEAR ?AUTO_7184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7184 ?AUTO_7182 )
      ( MAKE-ON ?AUTO_7181 ?AUTO_7182 )
      ( MAKE-ON-VERIFY ?AUTO_7181 ?AUTO_7182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7192 - BLOCK
      ?AUTO_7193 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7192 ) ( CLEAR ?AUTO_7193 ) )
    :subtasks
    ( ( !STACK ?AUTO_7192 ?AUTO_7193 )
      ( MAKE-ON-VERIFY ?AUTO_7192 ?AUTO_7193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7196 - BLOCK
      ?AUTO_7197 - BLOCK
    )
    :vars
    (
      ?AUTO_7201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7197 ) ( ON ?AUTO_7196 ?AUTO_7201 ) ( CLEAR ?AUTO_7196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7196 ?AUTO_7201 )
      ( MAKE-ON ?AUTO_7196 ?AUTO_7197 )
      ( MAKE-ON-VERIFY ?AUTO_7196 ?AUTO_7197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7202 - BLOCK
      ?AUTO_7203 - BLOCK
    )
    :vars
    (
      ?AUTO_7206 - BLOCK
      ?AUTO_7208 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7202 ?AUTO_7206 ) ( CLEAR ?AUTO_7202 ) ( HOLDING ?AUTO_7203 ) ( CLEAR ?AUTO_7208 ) )
    :subtasks
    ( ( !STACK ?AUTO_7203 ?AUTO_7208 )
      ( MAKE-ON ?AUTO_7202 ?AUTO_7203 )
      ( MAKE-ON-VERIFY ?AUTO_7202 ?AUTO_7203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7331 - BLOCK
      ?AUTO_7332 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7331 ) ( CLEAR ?AUTO_7332 ) )
    :subtasks
    ( ( !STACK ?AUTO_7331 ?AUTO_7332 )
      ( MAKE-ON-VERIFY ?AUTO_7331 ?AUTO_7332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7335 - BLOCK
      ?AUTO_7336 - BLOCK
    )
    :vars
    (
      ?AUTO_7340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7336 ) ( ON ?AUTO_7335 ?AUTO_7340 ) ( CLEAR ?AUTO_7335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7335 ?AUTO_7340 )
      ( MAKE-ON ?AUTO_7335 ?AUTO_7336 )
      ( MAKE-ON-VERIFY ?AUTO_7335 ?AUTO_7336 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7341 - BLOCK
      ?AUTO_7342 - BLOCK
    )
    :vars
    (
      ?AUTO_7345 - BLOCK
      ?AUTO_7347 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7341 ?AUTO_7345 ) ( CLEAR ?AUTO_7341 ) ( HOLDING ?AUTO_7342 ) ( CLEAR ?AUTO_7347 ) )
    :subtasks
    ( ( !STACK ?AUTO_7342 ?AUTO_7347 )
      ( MAKE-ON ?AUTO_7341 ?AUTO_7342 )
      ( MAKE-ON-VERIFY ?AUTO_7341 ?AUTO_7342 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7348 - BLOCK
      ?AUTO_7349 - BLOCK
    )
    :vars
    (
      ?AUTO_7352 - BLOCK
      ?AUTO_7353 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7348 ?AUTO_7352 ) ( CLEAR ?AUTO_7353 ) ( ON ?AUTO_7349 ?AUTO_7348 ) ( CLEAR ?AUTO_7349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7349 ?AUTO_7348 )
      ( MAKE-ON ?AUTO_7348 ?AUTO_7349 )
      ( MAKE-ON-VERIFY ?AUTO_7348 ?AUTO_7349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7356 - BLOCK
      ?AUTO_7357 - BLOCK
    )
    :vars
    (
      ?AUTO_7361 - BLOCK
      ?AUTO_7358 - BLOCK
      ?AUTO_7363 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7356 ?AUTO_7361 ) ( ON ?AUTO_7357 ?AUTO_7356 ) ( CLEAR ?AUTO_7357 ) ( HOLDING ?AUTO_7358 ) ( CLEAR ?AUTO_7363 ) )
    :subtasks
    ( ( !STACK ?AUTO_7358 ?AUTO_7363 )
      ( MAKE-ON ?AUTO_7356 ?AUTO_7357 )
      ( MAKE-ON-VERIFY ?AUTO_7356 ?AUTO_7357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7448 - BLOCK
      ?AUTO_7449 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7448 ) ( CLEAR ?AUTO_7449 ) )
    :subtasks
    ( ( !STACK ?AUTO_7448 ?AUTO_7449 )
      ( MAKE-ON-VERIFY ?AUTO_7448 ?AUTO_7449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7452 - BLOCK
      ?AUTO_7453 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7453 ) ( ON-TABLE ?AUTO_7452 ) ( CLEAR ?AUTO_7452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7452 )
      ( MAKE-ON ?AUTO_7452 ?AUTO_7453 )
      ( MAKE-ON-VERIFY ?AUTO_7452 ?AUTO_7453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7457 - BLOCK
      ?AUTO_7458 - BLOCK
    )
    :vars
    (
      ?AUTO_7462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7457 ) ( CLEAR ?AUTO_7457 ) ( HOLDING ?AUTO_7458 ) ( CLEAR ?AUTO_7462 ) )
    :subtasks
    ( ( !STACK ?AUTO_7458 ?AUTO_7462 )
      ( MAKE-ON ?AUTO_7457 ?AUTO_7458 )
      ( MAKE-ON-VERIFY ?AUTO_7457 ?AUTO_7458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7465 - BLOCK
      ?AUTO_7466 - BLOCK
    )
    :vars
    (
      ?AUTO_7469 - BLOCK
      ?AUTO_7470 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7466 ) ( ON-TABLE ?AUTO_7465 ) ( CLEAR ?AUTO_7465 ) ( HOLDING ?AUTO_7469 ) ( CLEAR ?AUTO_7470 ) )
    :subtasks
    ( ( !STACK ?AUTO_7469 ?AUTO_7470 )
      ( MAKE-ON ?AUTO_7465 ?AUTO_7466 )
      ( MAKE-ON-VERIFY ?AUTO_7465 ?AUTO_7466 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7471 - BLOCK
      ?AUTO_7472 - BLOCK
    )
    :vars
    (
      ?AUTO_7476 - BLOCK
      ?AUTO_7475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7471 ) ( CLEAR ?AUTO_7471 ) ( CLEAR ?AUTO_7476 ) ( ON ?AUTO_7475 ?AUTO_7472 ) ( CLEAR ?AUTO_7475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7475 ?AUTO_7472 )
      ( MAKE-ON ?AUTO_7471 ?AUTO_7472 )
      ( MAKE-ON-VERIFY ?AUTO_7471 ?AUTO_7472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7479 - BLOCK
      ?AUTO_7480 - BLOCK
    )
    :vars
    (
      ?AUTO_7484 - BLOCK
      ?AUTO_7481 - BLOCK
      ?AUTO_7486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7479 ) ( CLEAR ?AUTO_7479 ) ( ON ?AUTO_7484 ?AUTO_7480 ) ( CLEAR ?AUTO_7484 ) ( HOLDING ?AUTO_7481 ) ( CLEAR ?AUTO_7486 ) )
    :subtasks
    ( ( !STACK ?AUTO_7481 ?AUTO_7486 )
      ( MAKE-ON ?AUTO_7479 ?AUTO_7480 )
      ( MAKE-ON-VERIFY ?AUTO_7479 ?AUTO_7480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7503 - BLOCK
      ?AUTO_7504 - BLOCK
    )
    :vars
    (
      ?AUTO_7505 - BLOCK
      ?AUTO_7509 - BLOCK
      ?AUTO_7508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7503 ) ( ON ?AUTO_7505 ?AUTO_7504 ) ( CLEAR ?AUTO_7505 ) ( CLEAR ?AUTO_7509 ) ( ON ?AUTO_7508 ?AUTO_7503 ) ( CLEAR ?AUTO_7508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7508 ?AUTO_7503 )
      ( MAKE-ON ?AUTO_7503 ?AUTO_7504 )
      ( MAKE-ON-VERIFY ?AUTO_7503 ?AUTO_7504 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7511 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7511 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7511 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7511 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7513 - BLOCK
    )
    :vars
    (
      ?AUTO_7516 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7513 ?AUTO_7516 ) ( CLEAR ?AUTO_7513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7513 ?AUTO_7516 )
      ( MAKE-ON-TABLE ?AUTO_7513 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7513 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7518 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7518 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7518 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7518 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7520 - BLOCK
    )
    :vars
    (
      ?AUTO_7523 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7520 ?AUTO_7523 ) ( CLEAR ?AUTO_7520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7520 ?AUTO_7523 )
      ( MAKE-ON-TABLE ?AUTO_7520 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7520 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7524 - BLOCK
    )
    :vars
    (
      ?AUTO_7526 - BLOCK
      ?AUTO_7527 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7524 ?AUTO_7526 ) ( CLEAR ?AUTO_7524 ) ( HOLDING ?AUTO_7527 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7527 )
      ( MAKE-ON-TABLE ?AUTO_7524 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7524 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7528 - BLOCK
    )
    :vars
    (
      ?AUTO_7530 - BLOCK
      ?AUTO_7531 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7528 ?AUTO_7530 ) ( ON ?AUTO_7531 ?AUTO_7528 ) ( CLEAR ?AUTO_7531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7531 ?AUTO_7528 )
      ( MAKE-ON-TABLE ?AUTO_7528 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7536 - BLOCK
      ?AUTO_7537 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7536 ) ( CLEAR ?AUTO_7537 ) )
    :subtasks
    ( ( !STACK ?AUTO_7536 ?AUTO_7537 )
      ( MAKE-ON-VERIFY ?AUTO_7536 ?AUTO_7537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7540 - BLOCK
      ?AUTO_7541 - BLOCK
    )
    :vars
    (
      ?AUTO_7545 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7541 ) ( ON ?AUTO_7540 ?AUTO_7545 ) ( CLEAR ?AUTO_7540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7540 ?AUTO_7545 )
      ( MAKE-ON ?AUTO_7540 ?AUTO_7541 )
      ( MAKE-ON-VERIFY ?AUTO_7540 ?AUTO_7541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7546 - BLOCK
      ?AUTO_7547 - BLOCK
    )
    :vars
    (
      ?AUTO_7550 - BLOCK
      ?AUTO_7551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7547 ) ( ON ?AUTO_7546 ?AUTO_7550 ) ( CLEAR ?AUTO_7546 ) ( HOLDING ?AUTO_7551 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7551 )
      ( MAKE-ON ?AUTO_7546 ?AUTO_7547 )
      ( MAKE-ON-VERIFY ?AUTO_7546 ?AUTO_7547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7554 - BLOCK
      ?AUTO_7555 - BLOCK
    )
    :vars
    (
      ?AUTO_7558 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7554 ?AUTO_7558 ) ( CLEAR ?AUTO_7554 ) ( HOLDING ?AUTO_7555 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7555 )
      ( MAKE-ON ?AUTO_7554 ?AUTO_7555 )
      ( MAKE-ON-VERIFY ?AUTO_7554 ?AUTO_7555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7564 - BLOCK
      ?AUTO_7565 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7564 ) ( CLEAR ?AUTO_7565 ) )
    :subtasks
    ( ( !STACK ?AUTO_7564 ?AUTO_7565 )
      ( MAKE-ON-VERIFY ?AUTO_7564 ?AUTO_7565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7568 - BLOCK
      ?AUTO_7569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7569 ) ( ON-TABLE ?AUTO_7568 ) ( CLEAR ?AUTO_7568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7568 )
      ( MAKE-ON ?AUTO_7568 ?AUTO_7569 )
      ( MAKE-ON-VERIFY ?AUTO_7568 ?AUTO_7569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7573 - BLOCK
      ?AUTO_7574 - BLOCK
    )
    :vars
    (
      ?AUTO_7577 - BLOCK
      ?AUTO_7578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7574 ) ( ON-TABLE ?AUTO_7573 ) ( CLEAR ?AUTO_7573 ) ( HOLDING ?AUTO_7577 ) ( CLEAR ?AUTO_7578 ) )
    :subtasks
    ( ( !STACK ?AUTO_7577 ?AUTO_7578 )
      ( MAKE-ON ?AUTO_7573 ?AUTO_7574 )
      ( MAKE-ON-VERIFY ?AUTO_7573 ?AUTO_7574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7579 - BLOCK
      ?AUTO_7580 - BLOCK
    )
    :vars
    (
      ?AUTO_7583 - BLOCK
      ?AUTO_7582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7579 ) ( CLEAR ?AUTO_7579 ) ( CLEAR ?AUTO_7583 ) ( ON ?AUTO_7582 ?AUTO_7580 ) ( CLEAR ?AUTO_7582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7582 ?AUTO_7580 )
      ( MAKE-ON ?AUTO_7579 ?AUTO_7580 )
      ( MAKE-ON-VERIFY ?AUTO_7579 ?AUTO_7580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7587 - BLOCK
      ?AUTO_7588 - BLOCK
    )
    :vars
    (
      ?AUTO_7589 - BLOCK
      ?AUTO_7592 - BLOCK
      ?AUTO_7593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7587 ) ( CLEAR ?AUTO_7587 ) ( CLEAR ?AUTO_7589 ) ( ON ?AUTO_7592 ?AUTO_7588 ) ( CLEAR ?AUTO_7592 ) ( HOLDING ?AUTO_7593 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7593 )
      ( MAKE-ON ?AUTO_7587 ?AUTO_7588 )
      ( MAKE-ON-VERIFY ?AUTO_7587 ?AUTO_7588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7594 - BLOCK
      ?AUTO_7595 - BLOCK
    )
    :vars
    (
      ?AUTO_7597 - BLOCK
      ?AUTO_7599 - BLOCK
      ?AUTO_7600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7594 ) ( CLEAR ?AUTO_7597 ) ( ON ?AUTO_7599 ?AUTO_7595 ) ( CLEAR ?AUTO_7599 ) ( ON ?AUTO_7600 ?AUTO_7594 ) ( CLEAR ?AUTO_7600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7600 ?AUTO_7594 )
      ( MAKE-ON ?AUTO_7594 ?AUTO_7595 )
      ( MAKE-ON-VERIFY ?AUTO_7594 ?AUTO_7595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7603 - BLOCK
      ?AUTO_7604 - BLOCK
    )
    :vars
    (
      ?AUTO_7605 - BLOCK
      ?AUTO_7606 - BLOCK
      ?AUTO_7608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7603 ) ( ON ?AUTO_7605 ?AUTO_7604 ) ( CLEAR ?AUTO_7605 ) ( ON ?AUTO_7606 ?AUTO_7603 ) ( CLEAR ?AUTO_7606 ) ( HOLDING ?AUTO_7608 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7608 )
      ( MAKE-ON ?AUTO_7603 ?AUTO_7604 )
      ( MAKE-ON-VERIFY ?AUTO_7603 ?AUTO_7604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7611 - BLOCK
      ?AUTO_7612 - BLOCK
    )
    :vars
    (
      ?AUTO_7613 - BLOCK
      ?AUTO_7616 - BLOCK
      ?AUTO_7617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7611 ) ( ON ?AUTO_7613 ?AUTO_7612 ) ( CLEAR ?AUTO_7613 ) ( ON ?AUTO_7616 ?AUTO_7611 ) ( ON ?AUTO_7617 ?AUTO_7616 ) ( CLEAR ?AUTO_7617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7617 ?AUTO_7616 )
      ( MAKE-ON ?AUTO_7611 ?AUTO_7612 )
      ( MAKE-ON-VERIFY ?AUTO_7611 ?AUTO_7612 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7619 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7619 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7619 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7619 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7621 - BLOCK
    )
    :vars
    (
      ?AUTO_7624 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7621 ?AUTO_7624 ) ( CLEAR ?AUTO_7621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7621 ?AUTO_7624 )
      ( MAKE-ON-TABLE ?AUTO_7621 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7621 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7626 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7626 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7626 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7626 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7628 - BLOCK
    )
    :vars
    (
      ?AUTO_7631 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7628 ?AUTO_7631 ) ( CLEAR ?AUTO_7628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7628 ?AUTO_7631 )
      ( MAKE-ON-TABLE ?AUTO_7628 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7628 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7632 - BLOCK
    )
    :vars
    (
      ?AUTO_7633 - BLOCK
      ?AUTO_7635 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7632 ?AUTO_7633 ) ( CLEAR ?AUTO_7632 ) ( HOLDING ?AUTO_7635 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7635 )
      ( MAKE-ON-TABLE ?AUTO_7632 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7632 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7638 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7638 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7638 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7638 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7640 - BLOCK
    )
    :vars
    (
      ?AUTO_7643 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7640 ?AUTO_7643 ) ( CLEAR ?AUTO_7640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7640 ?AUTO_7643 )
      ( MAKE-ON-TABLE ?AUTO_7640 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7640 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7644 - BLOCK
    )
    :vars
    (
      ?AUTO_7646 - BLOCK
      ?AUTO_7647 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7644 ?AUTO_7646 ) ( CLEAR ?AUTO_7644 ) ( HOLDING ?AUTO_7647 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7647 )
      ( MAKE-ON-TABLE ?AUTO_7644 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7644 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7648 - BLOCK
    )
    :vars
    (
      ?AUTO_7650 - BLOCK
      ?AUTO_7651 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7648 ?AUTO_7650 ) ( ON ?AUTO_7651 ?AUTO_7648 ) ( CLEAR ?AUTO_7651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7651 ?AUTO_7648 )
      ( MAKE-ON-TABLE ?AUTO_7648 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7648 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7654 - BLOCK
    )
    :vars
    (
      ?AUTO_7655 - BLOCK
      ?AUTO_7656 - BLOCK
      ?AUTO_7658 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7654 ?AUTO_7655 ) ( ON ?AUTO_7656 ?AUTO_7654 ) ( CLEAR ?AUTO_7656 ) ( HOLDING ?AUTO_7658 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7658 )
      ( MAKE-ON-TABLE ?AUTO_7654 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7662 - BLOCK
      ?AUTO_7663 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7662 ) ( CLEAR ?AUTO_7663 ) )
    :subtasks
    ( ( !STACK ?AUTO_7662 ?AUTO_7663 )
      ( MAKE-ON-VERIFY ?AUTO_7662 ?AUTO_7663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7666 - BLOCK
      ?AUTO_7667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7667 ) ( ON-TABLE ?AUTO_7666 ) ( CLEAR ?AUTO_7666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7666 )
      ( MAKE-ON ?AUTO_7666 ?AUTO_7667 )
      ( MAKE-ON-VERIFY ?AUTO_7666 ?AUTO_7667 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7671 - BLOCK
      ?AUTO_7672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7671 ) ( CLEAR ?AUTO_7671 ) ( HOLDING ?AUTO_7672 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7672 )
      ( MAKE-ON ?AUTO_7671 ?AUTO_7672 )
      ( MAKE-ON-VERIFY ?AUTO_7671 ?AUTO_7672 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7703 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7703 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7703 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7703 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7705 - BLOCK
    )
    :vars
    (
      ?AUTO_7708 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7705 ?AUTO_7708 ) ( CLEAR ?AUTO_7705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7705 ?AUTO_7708 )
      ( MAKE-ON-TABLE ?AUTO_7705 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7705 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7709 - BLOCK
    )
    :vars
    (
      ?AUTO_7711 - BLOCK
      ?AUTO_7712 - BLOCK
      ?AUTO_7713 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7709 ?AUTO_7711 ) ( CLEAR ?AUTO_7709 ) ( HOLDING ?AUTO_7712 ) ( CLEAR ?AUTO_7713 ) )
    :subtasks
    ( ( !STACK ?AUTO_7712 ?AUTO_7713 )
      ( MAKE-ON-TABLE ?AUTO_7709 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7709 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7716 - BLOCK
    )
    :vars
    (
      ?AUTO_7718 - BLOCK
      ?AUTO_7720 - BLOCK
      ?AUTO_7717 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7716 ?AUTO_7718 ) ( CLEAR ?AUTO_7720 ) ( ON ?AUTO_7717 ?AUTO_7716 ) ( CLEAR ?AUTO_7717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7717 ?AUTO_7716 )
      ( MAKE-ON-TABLE ?AUTO_7716 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7716 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7723 - BLOCK
    )
    :vars
    (
      ?AUTO_7725 - BLOCK
      ?AUTO_7727 - BLOCK
      ?AUTO_7726 - BLOCK
      ?AUTO_7728 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7723 ?AUTO_7725 ) ( CLEAR ?AUTO_7727 ) ( ON ?AUTO_7726 ?AUTO_7723 ) ( CLEAR ?AUTO_7726 ) ( HOLDING ?AUTO_7728 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7728 )
      ( MAKE-ON-TABLE ?AUTO_7723 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7723 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7729 - BLOCK
    )
    :vars
    (
      ?AUTO_7731 - BLOCK
      ?AUTO_7730 - BLOCK
      ?AUTO_7734 - BLOCK
      ?AUTO_7733 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7729 ?AUTO_7731 ) ( CLEAR ?AUTO_7730 ) ( ON ?AUTO_7734 ?AUTO_7729 ) ( ON ?AUTO_7733 ?AUTO_7734 ) ( CLEAR ?AUTO_7733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7733 ?AUTO_7734 )
      ( MAKE-ON-TABLE ?AUTO_7729 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7729 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7737 - BLOCK
    )
    :vars
    (
      ?AUTO_7740 - BLOCK
      ?AUTO_7738 - BLOCK
      ?AUTO_7742 - BLOCK
      ?AUTO_7741 - BLOCK
      ?AUTO_7743 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7737 ?AUTO_7740 ) ( CLEAR ?AUTO_7738 ) ( ON ?AUTO_7742 ?AUTO_7737 ) ( ON ?AUTO_7741 ?AUTO_7742 ) ( CLEAR ?AUTO_7741 ) ( HOLDING ?AUTO_7743 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7743 )
      ( MAKE-ON-TABLE ?AUTO_7737 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7737 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7746 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7746 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7746 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7746 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7748 - BLOCK
    )
    :vars
    (
      ?AUTO_7751 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7748 ?AUTO_7751 ) ( CLEAR ?AUTO_7748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7748 ?AUTO_7751 )
      ( MAKE-ON-TABLE ?AUTO_7748 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7748 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7752 - BLOCK
    )
    :vars
    (
      ?AUTO_7754 - BLOCK
      ?AUTO_7755 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7752 ?AUTO_7754 ) ( CLEAR ?AUTO_7752 ) ( HOLDING ?AUTO_7755 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7755 )
      ( MAKE-ON-TABLE ?AUTO_7752 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7752 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7756 - BLOCK
    )
    :vars
    (
      ?AUTO_7758 - BLOCK
      ?AUTO_7759 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7756 ?AUTO_7758 ) ( ON ?AUTO_7759 ?AUTO_7756 ) ( CLEAR ?AUTO_7759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7759 ?AUTO_7756 )
      ( MAKE-ON-TABLE ?AUTO_7756 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7756 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7762 - BLOCK
    )
    :vars
    (
      ?AUTO_7763 - BLOCK
      ?AUTO_7764 - BLOCK
      ?AUTO_7766 - BLOCK
      ?AUTO_7767 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7762 ?AUTO_7763 ) ( ON ?AUTO_7764 ?AUTO_7762 ) ( CLEAR ?AUTO_7764 ) ( HOLDING ?AUTO_7766 ) ( CLEAR ?AUTO_7767 ) )
    :subtasks
    ( ( !STACK ?AUTO_7766 ?AUTO_7767 )
      ( MAKE-ON-TABLE ?AUTO_7762 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7762 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7770 - BLOCK
    )
    :vars
    (
      ?AUTO_7775 - BLOCK
      ?AUTO_7771 - BLOCK
      ?AUTO_7773 - BLOCK
      ?AUTO_7772 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7770 ?AUTO_7775 ) ( ON ?AUTO_7771 ?AUTO_7770 ) ( CLEAR ?AUTO_7773 ) ( ON ?AUTO_7772 ?AUTO_7771 ) ( CLEAR ?AUTO_7772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7772 ?AUTO_7771 )
      ( MAKE-ON-TABLE ?AUTO_7770 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7770 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7778 - BLOCK
    )
    :vars
    (
      ?AUTO_7783 - BLOCK
      ?AUTO_7780 - BLOCK
      ?AUTO_7782 - BLOCK
      ?AUTO_7781 - BLOCK
      ?AUTO_7784 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7778 ?AUTO_7783 ) ( ON ?AUTO_7780 ?AUTO_7778 ) ( CLEAR ?AUTO_7782 ) ( ON ?AUTO_7781 ?AUTO_7780 ) ( CLEAR ?AUTO_7781 ) ( HOLDING ?AUTO_7784 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7784 )
      ( MAKE-ON-TABLE ?AUTO_7778 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7778 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7785 - BLOCK
    )
    :vars
    (
      ?AUTO_7787 - BLOCK
      ?AUTO_7788 - BLOCK
      ?AUTO_7790 - BLOCK
      ?AUTO_7786 - BLOCK
      ?AUTO_7791 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7785 ?AUTO_7787 ) ( ON ?AUTO_7788 ?AUTO_7785 ) ( CLEAR ?AUTO_7790 ) ( ON ?AUTO_7786 ?AUTO_7788 ) ( ON ?AUTO_7791 ?AUTO_7786 ) ( CLEAR ?AUTO_7791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7791 ?AUTO_7786 )
      ( MAKE-ON-TABLE ?AUTO_7785 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7785 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7794 - BLOCK
    )
    :vars
    (
      ?AUTO_7797 - BLOCK
      ?AUTO_7795 - BLOCK
      ?AUTO_7798 - BLOCK
      ?AUTO_7800 - BLOCK
      ?AUTO_7799 - BLOCK
      ?AUTO_7801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7794 ?AUTO_7797 ) ( ON ?AUTO_7795 ?AUTO_7794 ) ( CLEAR ?AUTO_7798 ) ( ON ?AUTO_7800 ?AUTO_7795 ) ( ON ?AUTO_7799 ?AUTO_7800 ) ( CLEAR ?AUTO_7799 ) ( HOLDING ?AUTO_7801 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7801 )
      ( MAKE-ON-TABLE ?AUTO_7794 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7794 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7805 - BLOCK
      ?AUTO_7806 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7805 ) ( CLEAR ?AUTO_7806 ) )
    :subtasks
    ( ( !STACK ?AUTO_7805 ?AUTO_7806 )
      ( MAKE-ON-VERIFY ?AUTO_7805 ?AUTO_7806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7809 - BLOCK
      ?AUTO_7810 - BLOCK
    )
    :vars
    (
      ?AUTO_7814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7810 ) ( ON ?AUTO_7809 ?AUTO_7814 ) ( CLEAR ?AUTO_7809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7809 ?AUTO_7814 )
      ( MAKE-ON ?AUTO_7809 ?AUTO_7810 )
      ( MAKE-ON-VERIFY ?AUTO_7809 ?AUTO_7810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7815 - BLOCK
      ?AUTO_7816 - BLOCK
    )
    :vars
    (
      ?AUTO_7819 - BLOCK
      ?AUTO_7820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7816 ) ( ON ?AUTO_7815 ?AUTO_7819 ) ( CLEAR ?AUTO_7815 ) ( HOLDING ?AUTO_7820 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7820 )
      ( MAKE-ON ?AUTO_7815 ?AUTO_7816 )
      ( MAKE-ON-VERIFY ?AUTO_7815 ?AUTO_7816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7821 - BLOCK
      ?AUTO_7822 - BLOCK
    )
    :vars
    (
      ?AUTO_7825 - BLOCK
      ?AUTO_7826 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7821 ?AUTO_7825 ) ( CLEAR ?AUTO_7821 ) ( ON ?AUTO_7826 ?AUTO_7822 ) ( CLEAR ?AUTO_7826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7826 ?AUTO_7822 )
      ( MAKE-ON ?AUTO_7821 ?AUTO_7822 )
      ( MAKE-ON-VERIFY ?AUTO_7821 ?AUTO_7822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7829 - BLOCK
      ?AUTO_7830 - BLOCK
    )
    :vars
    (
      ?AUTO_7834 - BLOCK
      ?AUTO_7831 - BLOCK
      ?AUTO_7835 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7829 ?AUTO_7834 ) ( CLEAR ?AUTO_7829 ) ( ON ?AUTO_7831 ?AUTO_7830 ) ( CLEAR ?AUTO_7831 ) ( HOLDING ?AUTO_7835 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7835 )
      ( MAKE-ON ?AUTO_7829 ?AUTO_7830 )
      ( MAKE-ON-VERIFY ?AUTO_7829 ?AUTO_7830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7836 - BLOCK
      ?AUTO_7837 - BLOCK
    )
    :vars
    (
      ?AUTO_7841 - BLOCK
      ?AUTO_7838 - BLOCK
      ?AUTO_7842 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7836 ?AUTO_7841 ) ( CLEAR ?AUTO_7836 ) ( ON ?AUTO_7838 ?AUTO_7837 ) ( ON ?AUTO_7842 ?AUTO_7838 ) ( CLEAR ?AUTO_7842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7842 ?AUTO_7838 )
      ( MAKE-ON ?AUTO_7836 ?AUTO_7837 )
      ( MAKE-ON-VERIFY ?AUTO_7836 ?AUTO_7837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7845 - BLOCK
      ?AUTO_7846 - BLOCK
    )
    :vars
    (
      ?AUTO_7851 - BLOCK
      ?AUTO_7848 - BLOCK
      ?AUTO_7849 - BLOCK
      ?AUTO_7852 - BLOCK
      ?AUTO_7853 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7845 ?AUTO_7851 ) ( CLEAR ?AUTO_7845 ) ( ON ?AUTO_7848 ?AUTO_7846 ) ( ON ?AUTO_7849 ?AUTO_7848 ) ( CLEAR ?AUTO_7849 ) ( HOLDING ?AUTO_7852 ) ( CLEAR ?AUTO_7853 ) )
    :subtasks
    ( ( !STACK ?AUTO_7852 ?AUTO_7853 )
      ( MAKE-ON ?AUTO_7845 ?AUTO_7846 )
      ( MAKE-ON-VERIFY ?AUTO_7845 ?AUTO_7846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7858 - BLOCK
      ?AUTO_7859 - BLOCK
    )
    :vars
    (
      ?AUTO_7861 - BLOCK
      ?AUTO_7865 - BLOCK
      ?AUTO_7866 - BLOCK
      ?AUTO_7860 - BLOCK
      ?AUTO_7864 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7858 ?AUTO_7861 ) ( CLEAR ?AUTO_7858 ) ( ON ?AUTO_7865 ?AUTO_7859 ) ( ON ?AUTO_7866 ?AUTO_7865 ) ( CLEAR ?AUTO_7860 ) ( ON ?AUTO_7864 ?AUTO_7866 ) ( CLEAR ?AUTO_7864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7864 ?AUTO_7866 )
      ( MAKE-ON ?AUTO_7858 ?AUTO_7859 )
      ( MAKE-ON-VERIFY ?AUTO_7858 ?AUTO_7859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7869 - BLOCK
      ?AUTO_7870 - BLOCK
    )
    :vars
    (
      ?AUTO_7874 - BLOCK
      ?AUTO_7875 - BLOCK
      ?AUTO_7876 - BLOCK
      ?AUTO_7873 - BLOCK
      ?AUTO_7877 - BLOCK
      ?AUTO_7878 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7869 ?AUTO_7874 ) ( CLEAR ?AUTO_7869 ) ( ON ?AUTO_7875 ?AUTO_7870 ) ( ON ?AUTO_7876 ?AUTO_7875 ) ( CLEAR ?AUTO_7873 ) ( ON ?AUTO_7877 ?AUTO_7876 ) ( CLEAR ?AUTO_7877 ) ( HOLDING ?AUTO_7878 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7878 )
      ( MAKE-ON ?AUTO_7869 ?AUTO_7870 )
      ( MAKE-ON-VERIFY ?AUTO_7869 ?AUTO_7870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7879 - BLOCK
      ?AUTO_7880 - BLOCK
    )
    :vars
    (
      ?AUTO_7884 - BLOCK
      ?AUTO_7881 - BLOCK
      ?AUTO_7883 - BLOCK
      ?AUTO_7887 - BLOCK
      ?AUTO_7882 - BLOCK
      ?AUTO_7888 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7879 ?AUTO_7884 ) ( CLEAR ?AUTO_7879 ) ( ON ?AUTO_7881 ?AUTO_7880 ) ( ON ?AUTO_7883 ?AUTO_7881 ) ( CLEAR ?AUTO_7887 ) ( ON ?AUTO_7882 ?AUTO_7883 ) ( ON ?AUTO_7888 ?AUTO_7882 ) ( CLEAR ?AUTO_7888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7888 ?AUTO_7882 )
      ( MAKE-ON ?AUTO_7879 ?AUTO_7880 )
      ( MAKE-ON-VERIFY ?AUTO_7879 ?AUTO_7880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7891 - BLOCK
      ?AUTO_7892 - BLOCK
    )
    :vars
    (
      ?AUTO_7900 - BLOCK
      ?AUTO_7894 - BLOCK
      ?AUTO_7899 - BLOCK
      ?AUTO_7895 - BLOCK
      ?AUTO_7897 - BLOCK
      ?AUTO_7896 - BLOCK
      ?AUTO_7901 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7891 ?AUTO_7900 ) ( CLEAR ?AUTO_7891 ) ( ON ?AUTO_7894 ?AUTO_7892 ) ( ON ?AUTO_7899 ?AUTO_7894 ) ( CLEAR ?AUTO_7895 ) ( ON ?AUTO_7897 ?AUTO_7899 ) ( ON ?AUTO_7896 ?AUTO_7897 ) ( CLEAR ?AUTO_7896 ) ( HOLDING ?AUTO_7901 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7901 )
      ( MAKE-ON ?AUTO_7891 ?AUTO_7892 )
      ( MAKE-ON-VERIFY ?AUTO_7891 ?AUTO_7892 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7904 - BLOCK
      ?AUTO_7903 - BLOCK
    )
    :vars
    (
      ?AUTO_7906 - BLOCK
      ?AUTO_7909 - BLOCK
      ?AUTO_7905 - BLOCK
      ?AUTO_7911 - BLOCK
      ?AUTO_7910 - BLOCK
      ?AUTO_7912 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7904 ?AUTO_7906 ) ( ON ?AUTO_7909 ?AUTO_7903 ) ( ON ?AUTO_7905 ?AUTO_7909 ) ( ON ?AUTO_7911 ?AUTO_7905 ) ( ON ?AUTO_7910 ?AUTO_7911 ) ( CLEAR ?AUTO_7910 ) ( ON ?AUTO_7912 ?AUTO_7904 ) ( CLEAR ?AUTO_7912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7912 ?AUTO_7904 )
      ( MAKE-ON ?AUTO_7904 ?AUTO_7903 )
      ( MAKE-ON-VERIFY ?AUTO_7904 ?AUTO_7903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7917 - BLOCK
      ?AUTO_7918 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7917 ) ( CLEAR ?AUTO_7918 ) )
    :subtasks
    ( ( !STACK ?AUTO_7917 ?AUTO_7918 )
      ( MAKE-ON-VERIFY ?AUTO_7917 ?AUTO_7918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7921 - BLOCK
      ?AUTO_7922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7922 ) ( ON-TABLE ?AUTO_7921 ) ( CLEAR ?AUTO_7921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7921 )
      ( MAKE-ON ?AUTO_7921 ?AUTO_7922 )
      ( MAKE-ON-VERIFY ?AUTO_7921 ?AUTO_7922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7926 - BLOCK
      ?AUTO_7927 - BLOCK
    )
    :vars
    (
      ?AUTO_7931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7926 ) ( CLEAR ?AUTO_7926 ) ( HOLDING ?AUTO_7927 ) ( CLEAR ?AUTO_7931 ) )
    :subtasks
    ( ( !STACK ?AUTO_7927 ?AUTO_7931 )
      ( MAKE-ON ?AUTO_7926 ?AUTO_7927 )
      ( MAKE-ON-VERIFY ?AUTO_7926 ?AUTO_7927 ) )
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
      ?AUTO_7942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7941 ) ( ON ?AUTO_7940 ?AUTO_7945 ) ( ON ?AUTO_7942 ?AUTO_7940 ) ( CLEAR ?AUTO_7942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7942 ?AUTO_7940 )
      ( MAKE-ON ?AUTO_7940 ?AUTO_7941 )
      ( MAKE-ON-VERIFY ?AUTO_7940 ?AUTO_7941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7948 - BLOCK
      ?AUTO_7949 - BLOCK
    )
    :vars
    (
      ?AUTO_7953 - BLOCK
      ?AUTO_7952 - BLOCK
      ?AUTO_7954 - BLOCK
      ?AUTO_7955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7949 ) ( ON ?AUTO_7948 ?AUTO_7953 ) ( ON ?AUTO_7952 ?AUTO_7948 ) ( CLEAR ?AUTO_7952 ) ( HOLDING ?AUTO_7954 ) ( CLEAR ?AUTO_7955 ) )
    :subtasks
    ( ( !STACK ?AUTO_7954 ?AUTO_7955 )
      ( MAKE-ON ?AUTO_7948 ?AUTO_7949 )
      ( MAKE-ON-VERIFY ?AUTO_7948 ?AUTO_7949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7960 - BLOCK
      ?AUTO_7961 - BLOCK
    )
    :vars
    (
      ?AUTO_7962 - BLOCK
      ?AUTO_7963 - BLOCK
      ?AUTO_7967 - BLOCK
      ?AUTO_7964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7961 ) ( ON ?AUTO_7960 ?AUTO_7962 ) ( ON ?AUTO_7963 ?AUTO_7960 ) ( CLEAR ?AUTO_7967 ) ( ON ?AUTO_7964 ?AUTO_7963 ) ( CLEAR ?AUTO_7964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7964 ?AUTO_7963 )
      ( MAKE-ON ?AUTO_7960 ?AUTO_7961 )
      ( MAKE-ON-VERIFY ?AUTO_7960 ?AUTO_7961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7970 - BLOCK
      ?AUTO_7971 - BLOCK
    )
    :vars
    (
      ?AUTO_7974 - BLOCK
      ?AUTO_7975 - BLOCK
      ?AUTO_7976 - BLOCK
      ?AUTO_7977 - BLOCK
      ?AUTO_7978 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7971 ) ( ON ?AUTO_7970 ?AUTO_7974 ) ( ON ?AUTO_7975 ?AUTO_7970 ) ( CLEAR ?AUTO_7976 ) ( ON ?AUTO_7977 ?AUTO_7975 ) ( CLEAR ?AUTO_7977 ) ( HOLDING ?AUTO_7978 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7978 )
      ( MAKE-ON ?AUTO_7970 ?AUTO_7971 )
      ( MAKE-ON-VERIFY ?AUTO_7970 ?AUTO_7971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7979 - BLOCK
      ?AUTO_7980 - BLOCK
    )
    :vars
    (
      ?AUTO_7987 - BLOCK
      ?AUTO_7981 - BLOCK
      ?AUTO_7982 - BLOCK
      ?AUTO_7983 - BLOCK
      ?AUTO_7986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7980 ) ( ON ?AUTO_7979 ?AUTO_7987 ) ( ON ?AUTO_7981 ?AUTO_7979 ) ( CLEAR ?AUTO_7982 ) ( ON ?AUTO_7983 ?AUTO_7981 ) ( ON ?AUTO_7986 ?AUTO_7983 ) ( CLEAR ?AUTO_7986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7986 ?AUTO_7983 )
      ( MAKE-ON ?AUTO_7979 ?AUTO_7980 )
      ( MAKE-ON-VERIFY ?AUTO_7979 ?AUTO_7980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7990 - BLOCK
      ?AUTO_7991 - BLOCK
    )
    :vars
    (
      ?AUTO_7998 - BLOCK
      ?AUTO_7995 - BLOCK
      ?AUTO_7994 - BLOCK
      ?AUTO_7997 - BLOCK
      ?AUTO_7996 - BLOCK
      ?AUTO_7999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7991 ) ( ON ?AUTO_7990 ?AUTO_7998 ) ( ON ?AUTO_7995 ?AUTO_7990 ) ( CLEAR ?AUTO_7994 ) ( ON ?AUTO_7997 ?AUTO_7995 ) ( ON ?AUTO_7996 ?AUTO_7997 ) ( CLEAR ?AUTO_7996 ) ( HOLDING ?AUTO_7999 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7999 )
      ( MAKE-ON ?AUTO_7990 ?AUTO_7991 )
      ( MAKE-ON-VERIFY ?AUTO_7990 ?AUTO_7991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8000 - BLOCK
      ?AUTO_8003 - BLOCK
    )
    :vars
    (
      ?AUTO_8008 - BLOCK
      ?AUTO_8007 - BLOCK
      ?AUTO_8004 - BLOCK
      ?AUTO_8002 - BLOCK
      ?AUTO_8009 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8000 ?AUTO_8008 ) ( ON ?AUTO_8007 ?AUTO_8000 ) ( ON ?AUTO_8004 ?AUTO_8007 ) ( ON ?AUTO_8002 ?AUTO_8004 ) ( CLEAR ?AUTO_8002 ) ( ON ?AUTO_8009 ?AUTO_8003 ) ( CLEAR ?AUTO_8009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8009 ?AUTO_8003 )
      ( MAKE-ON ?AUTO_8000 ?AUTO_8003 )
      ( MAKE-ON-VERIFY ?AUTO_8000 ?AUTO_8003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8014 - BLOCK
      ?AUTO_8015 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8014 ) ( CLEAR ?AUTO_8015 ) )
    :subtasks
    ( ( !STACK ?AUTO_8014 ?AUTO_8015 )
      ( MAKE-ON-VERIFY ?AUTO_8014 ?AUTO_8015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8018 - BLOCK
      ?AUTO_8019 - BLOCK
    )
    :vars
    (
      ?AUTO_8023 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8019 ) ( ON ?AUTO_8018 ?AUTO_8023 ) ( CLEAR ?AUTO_8018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8018 ?AUTO_8023 )
      ( MAKE-ON ?AUTO_8018 ?AUTO_8019 )
      ( MAKE-ON-VERIFY ?AUTO_8018 ?AUTO_8019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8024 - BLOCK
      ?AUTO_8025 - BLOCK
    )
    :vars
    (
      ?AUTO_8028 - BLOCK
      ?AUTO_8030 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8024 ?AUTO_8028 ) ( CLEAR ?AUTO_8024 ) ( HOLDING ?AUTO_8025 ) ( CLEAR ?AUTO_8030 ) )
    :subtasks
    ( ( !STACK ?AUTO_8025 ?AUTO_8030 )
      ( MAKE-ON ?AUTO_8024 ?AUTO_8025 )
      ( MAKE-ON-VERIFY ?AUTO_8024 ?AUTO_8025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8033 - BLOCK
      ?AUTO_8034 - BLOCK
    )
    :vars
    (
      ?AUTO_8037 - BLOCK
      ?AUTO_8038 - BLOCK
      ?AUTO_8039 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8034 ) ( ON ?AUTO_8033 ?AUTO_8037 ) ( CLEAR ?AUTO_8033 ) ( HOLDING ?AUTO_8038 ) ( CLEAR ?AUTO_8039 ) )
    :subtasks
    ( ( !STACK ?AUTO_8038 ?AUTO_8039 )
      ( MAKE-ON ?AUTO_8033 ?AUTO_8034 )
      ( MAKE-ON-VERIFY ?AUTO_8033 ?AUTO_8034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8040 - BLOCK
      ?AUTO_8041 - BLOCK
    )
    :vars
    (
      ?AUTO_8044 - BLOCK
      ?AUTO_8046 - BLOCK
      ?AUTO_8045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8041 ) ( ON ?AUTO_8040 ?AUTO_8044 ) ( CLEAR ?AUTO_8046 ) ( ON ?AUTO_8045 ?AUTO_8040 ) ( CLEAR ?AUTO_8045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8045 ?AUTO_8040 )
      ( MAKE-ON ?AUTO_8040 ?AUTO_8041 )
      ( MAKE-ON-VERIFY ?AUTO_8040 ?AUTO_8041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8049 - BLOCK
      ?AUTO_8050 - BLOCK
    )
    :vars
    (
      ?AUTO_8055 - BLOCK
      ?AUTO_8051 - BLOCK
      ?AUTO_8054 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8049 ?AUTO_8055 ) ( CLEAR ?AUTO_8051 ) ( ON ?AUTO_8054 ?AUTO_8049 ) ( CLEAR ?AUTO_8054 ) ( HOLDING ?AUTO_8050 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8050 )
      ( MAKE-ON ?AUTO_8049 ?AUTO_8050 )
      ( MAKE-ON-VERIFY ?AUTO_8049 ?AUTO_8050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8059 - BLOCK
      ?AUTO_8060 - BLOCK
    )
    :vars
    (
      ?AUTO_8065 - BLOCK
      ?AUTO_8062 - BLOCK
      ?AUTO_8064 - BLOCK
      ?AUTO_8066 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8060 ) ( ON ?AUTO_8059 ?AUTO_8065 ) ( CLEAR ?AUTO_8062 ) ( ON ?AUTO_8064 ?AUTO_8059 ) ( CLEAR ?AUTO_8064 ) ( HOLDING ?AUTO_8066 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8066 )
      ( MAKE-ON ?AUTO_8059 ?AUTO_8060 )
      ( MAKE-ON-VERIFY ?AUTO_8059 ?AUTO_8060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8067 - BLOCK
      ?AUTO_8068 - BLOCK
    )
    :vars
    (
      ?AUTO_8073 - BLOCK
      ?AUTO_8072 - BLOCK
      ?AUTO_8074 - BLOCK
      ?AUTO_8070 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8067 ?AUTO_8073 ) ( CLEAR ?AUTO_8072 ) ( ON ?AUTO_8074 ?AUTO_8067 ) ( CLEAR ?AUTO_8074 ) ( ON ?AUTO_8070 ?AUTO_8068 ) ( CLEAR ?AUTO_8070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8070 ?AUTO_8068 )
      ( MAKE-ON ?AUTO_8067 ?AUTO_8068 )
      ( MAKE-ON-VERIFY ?AUTO_8067 ?AUTO_8068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8077 - BLOCK
      ?AUTO_8078 - BLOCK
    )
    :vars
    (
      ?AUTO_8082 - BLOCK
      ?AUTO_8083 - BLOCK
      ?AUTO_8079 - BLOCK
      ?AUTO_8080 - BLOCK
      ?AUTO_8085 - BLOCK
      ?AUTO_8086 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8077 ?AUTO_8082 ) ( CLEAR ?AUTO_8083 ) ( ON ?AUTO_8079 ?AUTO_8077 ) ( CLEAR ?AUTO_8079 ) ( ON ?AUTO_8080 ?AUTO_8078 ) ( CLEAR ?AUTO_8080 ) ( HOLDING ?AUTO_8085 ) ( CLEAR ?AUTO_8086 ) )
    :subtasks
    ( ( !STACK ?AUTO_8085 ?AUTO_8086 )
      ( MAKE-ON ?AUTO_8077 ?AUTO_8078 )
      ( MAKE-ON-VERIFY ?AUTO_8077 ?AUTO_8078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8091 - BLOCK
      ?AUTO_8092 - BLOCK
    )
    :vars
    (
      ?AUTO_8098 - BLOCK
      ?AUTO_8100 - BLOCK
      ?AUTO_8099 - BLOCK
      ?AUTO_8096 - BLOCK
      ?AUTO_8095 - BLOCK
      ?AUTO_8093 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8091 ?AUTO_8098 ) ( CLEAR ?AUTO_8100 ) ( ON ?AUTO_8099 ?AUTO_8091 ) ( CLEAR ?AUTO_8099 ) ( ON ?AUTO_8096 ?AUTO_8092 ) ( CLEAR ?AUTO_8095 ) ( ON ?AUTO_8093 ?AUTO_8096 ) ( CLEAR ?AUTO_8093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8093 ?AUTO_8096 )
      ( MAKE-ON ?AUTO_8091 ?AUTO_8092 )
      ( MAKE-ON-VERIFY ?AUTO_8091 ?AUTO_8092 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8103 - BLOCK
      ?AUTO_8104 - BLOCK
    )
    :vars
    (
      ?AUTO_8109 - BLOCK
      ?AUTO_8112 - BLOCK
      ?AUTO_8107 - BLOCK
      ?AUTO_8110 - BLOCK
      ?AUTO_8108 - BLOCK
      ?AUTO_8111 - BLOCK
      ?AUTO_8113 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8103 ?AUTO_8109 ) ( CLEAR ?AUTO_8112 ) ( ON ?AUTO_8107 ?AUTO_8103 ) ( CLEAR ?AUTO_8107 ) ( ON ?AUTO_8110 ?AUTO_8104 ) ( CLEAR ?AUTO_8108 ) ( ON ?AUTO_8111 ?AUTO_8110 ) ( CLEAR ?AUTO_8111 ) ( HOLDING ?AUTO_8113 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8113 )
      ( MAKE-ON ?AUTO_8103 ?AUTO_8104 )
      ( MAKE-ON-VERIFY ?AUTO_8103 ?AUTO_8104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8114 - BLOCK
      ?AUTO_8115 - BLOCK
    )
    :vars
    (
      ?AUTO_8120 - BLOCK
      ?AUTO_8124 - BLOCK
      ?AUTO_8116 - BLOCK
      ?AUTO_8122 - BLOCK
      ?AUTO_8121 - BLOCK
      ?AUTO_8123 - BLOCK
      ?AUTO_8117 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8114 ?AUTO_8120 ) ( CLEAR ?AUTO_8124 ) ( ON ?AUTO_8116 ?AUTO_8114 ) ( CLEAR ?AUTO_8116 ) ( ON ?AUTO_8122 ?AUTO_8115 ) ( CLEAR ?AUTO_8121 ) ( ON ?AUTO_8123 ?AUTO_8122 ) ( ON ?AUTO_8117 ?AUTO_8123 ) ( CLEAR ?AUTO_8117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8117 ?AUTO_8123 )
      ( MAKE-ON ?AUTO_8114 ?AUTO_8115 )
      ( MAKE-ON-VERIFY ?AUTO_8114 ?AUTO_8115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8127 - BLOCK
      ?AUTO_8128 - BLOCK
    )
    :vars
    (
      ?AUTO_8130 - BLOCK
      ?AUTO_8135 - BLOCK
      ?AUTO_8137 - BLOCK
      ?AUTO_8133 - BLOCK
      ?AUTO_8132 - BLOCK
      ?AUTO_8136 - BLOCK
      ?AUTO_8129 - BLOCK
      ?AUTO_8138 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8127 ?AUTO_8130 ) ( CLEAR ?AUTO_8135 ) ( ON ?AUTO_8137 ?AUTO_8127 ) ( CLEAR ?AUTO_8137 ) ( ON ?AUTO_8133 ?AUTO_8128 ) ( CLEAR ?AUTO_8132 ) ( ON ?AUTO_8136 ?AUTO_8133 ) ( ON ?AUTO_8129 ?AUTO_8136 ) ( CLEAR ?AUTO_8129 ) ( HOLDING ?AUTO_8138 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8138 )
      ( MAKE-ON ?AUTO_8127 ?AUTO_8128 )
      ( MAKE-ON-VERIFY ?AUTO_8127 ?AUTO_8128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8139 - BLOCK
      ?AUTO_8140 - BLOCK
    )
    :vars
    (
      ?AUTO_8141 - BLOCK
      ?AUTO_8149 - BLOCK
      ?AUTO_8144 - BLOCK
      ?AUTO_8148 - BLOCK
      ?AUTO_8142 - BLOCK
      ?AUTO_8150 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8139 ?AUTO_8141 ) ( ON ?AUTO_8149 ?AUTO_8139 ) ( ON ?AUTO_8144 ?AUTO_8140 ) ( ON ?AUTO_8148 ?AUTO_8144 ) ( ON ?AUTO_8142 ?AUTO_8148 ) ( CLEAR ?AUTO_8142 ) ( ON ?AUTO_8150 ?AUTO_8149 ) ( CLEAR ?AUTO_8150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8150 ?AUTO_8149 )
      ( MAKE-ON ?AUTO_8139 ?AUTO_8140 )
      ( MAKE-ON-VERIFY ?AUTO_8139 ?AUTO_8140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8155 - BLOCK
      ?AUTO_8156 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8155 ) ( CLEAR ?AUTO_8156 ) )
    :subtasks
    ( ( !STACK ?AUTO_8155 ?AUTO_8156 )
      ( MAKE-ON-VERIFY ?AUTO_8155 ?AUTO_8156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8159 - BLOCK
      ?AUTO_8160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8160 ) ( ON-TABLE ?AUTO_8159 ) ( CLEAR ?AUTO_8159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8159 )
      ( MAKE-ON ?AUTO_8159 ?AUTO_8160 )
      ( MAKE-ON-VERIFY ?AUTO_8159 ?AUTO_8160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8164 - BLOCK
      ?AUTO_8165 - BLOCK
    )
    :vars
    (
      ?AUTO_8168 - BLOCK
      ?AUTO_8169 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8165 ) ( ON-TABLE ?AUTO_8164 ) ( CLEAR ?AUTO_8164 ) ( HOLDING ?AUTO_8168 ) ( CLEAR ?AUTO_8169 ) )
    :subtasks
    ( ( !STACK ?AUTO_8168 ?AUTO_8169 )
      ( MAKE-ON ?AUTO_8164 ?AUTO_8165 )
      ( MAKE-ON-VERIFY ?AUTO_8164 ?AUTO_8165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8170 - BLOCK
      ?AUTO_8171 - BLOCK
    )
    :vars
    (
      ?AUTO_8175 - BLOCK
      ?AUTO_8174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8171 ) ( ON-TABLE ?AUTO_8170 ) ( CLEAR ?AUTO_8175 ) ( ON ?AUTO_8174 ?AUTO_8170 ) ( CLEAR ?AUTO_8174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8174 ?AUTO_8170 )
      ( MAKE-ON ?AUTO_8170 ?AUTO_8171 )
      ( MAKE-ON-VERIFY ?AUTO_8170 ?AUTO_8171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8178 - BLOCK
      ?AUTO_8179 - BLOCK
    )
    :vars
    (
      ?AUTO_8183 - BLOCK
      ?AUTO_8180 - BLOCK
      ?AUTO_8185 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8179 ) ( ON-TABLE ?AUTO_8178 ) ( ON ?AUTO_8183 ?AUTO_8178 ) ( CLEAR ?AUTO_8183 ) ( HOLDING ?AUTO_8180 ) ( CLEAR ?AUTO_8185 ) )
    :subtasks
    ( ( !STACK ?AUTO_8180 ?AUTO_8185 )
      ( MAKE-ON ?AUTO_8178 ?AUTO_8179 )
      ( MAKE-ON-VERIFY ?AUTO_8178 ?AUTO_8179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8190 - BLOCK
      ?AUTO_8191 - BLOCK
    )
    :vars
    (
      ?AUTO_8194 - BLOCK
      ?AUTO_8196 - BLOCK
      ?AUTO_8192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8191 ) ( ON-TABLE ?AUTO_8190 ) ( ON ?AUTO_8194 ?AUTO_8190 ) ( CLEAR ?AUTO_8196 ) ( ON ?AUTO_8192 ?AUTO_8194 ) ( CLEAR ?AUTO_8192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8192 ?AUTO_8194 )
      ( MAKE-ON ?AUTO_8190 ?AUTO_8191 )
      ( MAKE-ON-VERIFY ?AUTO_8190 ?AUTO_8191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8199 - BLOCK
      ?AUTO_8200 - BLOCK
    )
    :vars
    (
      ?AUTO_8205 - BLOCK
      ?AUTO_8204 - BLOCK
      ?AUTO_8203 - BLOCK
      ?AUTO_8206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8200 ) ( ON-TABLE ?AUTO_8199 ) ( ON ?AUTO_8205 ?AUTO_8199 ) ( CLEAR ?AUTO_8204 ) ( ON ?AUTO_8203 ?AUTO_8205 ) ( CLEAR ?AUTO_8203 ) ( HOLDING ?AUTO_8206 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8206 )
      ( MAKE-ON ?AUTO_8199 ?AUTO_8200 )
      ( MAKE-ON-VERIFY ?AUTO_8199 ?AUTO_8200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8213 - BLOCK
      ?AUTO_8214 - BLOCK
    )
    :vars
    (
      ?AUTO_8216 - BLOCK
      ?AUTO_8217 - BLOCK
      ?AUTO_8215 - BLOCK
      ?AUTO_8221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8213 ) ( ON ?AUTO_8216 ?AUTO_8213 ) ( CLEAR ?AUTO_8217 ) ( ON ?AUTO_8215 ?AUTO_8216 ) ( CLEAR ?AUTO_8215 ) ( HOLDING ?AUTO_8214 ) ( CLEAR ?AUTO_8221 ) )
    :subtasks
    ( ( !STACK ?AUTO_8214 ?AUTO_8221 )
      ( MAKE-ON ?AUTO_8213 ?AUTO_8214 )
      ( MAKE-ON-VERIFY ?AUTO_8213 ?AUTO_8214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8234 - BLOCK
      ?AUTO_8235 - BLOCK
    )
    :vars
    (
      ?AUTO_8239 - BLOCK
      ?AUTO_8241 - BLOCK
      ?AUTO_8236 - BLOCK
      ?AUTO_8237 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8235 ) ( ON-TABLE ?AUTO_8234 ) ( ON ?AUTO_8239 ?AUTO_8234 ) ( CLEAR ?AUTO_8241 ) ( ON ?AUTO_8236 ?AUTO_8239 ) ( ON ?AUTO_8237 ?AUTO_8236 ) ( CLEAR ?AUTO_8237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8237 ?AUTO_8236 )
      ( MAKE-ON ?AUTO_8234 ?AUTO_8235 )
      ( MAKE-ON-VERIFY ?AUTO_8234 ?AUTO_8235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8246 - BLOCK
      ?AUTO_8247 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8246 ) ( CLEAR ?AUTO_8247 ) )
    :subtasks
    ( ( !STACK ?AUTO_8246 ?AUTO_8247 )
      ( MAKE-ON-VERIFY ?AUTO_8246 ?AUTO_8247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8250 - BLOCK
      ?AUTO_8251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8251 ) ( ON-TABLE ?AUTO_8250 ) ( CLEAR ?AUTO_8250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8250 )
      ( MAKE-ON ?AUTO_8250 ?AUTO_8251 )
      ( MAKE-ON-VERIFY ?AUTO_8250 ?AUTO_8251 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8255 - BLOCK
      ?AUTO_8256 - BLOCK
    )
    :vars
    (
      ?AUTO_8259 - BLOCK
      ?AUTO_8260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8256 ) ( ON-TABLE ?AUTO_8255 ) ( CLEAR ?AUTO_8255 ) ( HOLDING ?AUTO_8259 ) ( CLEAR ?AUTO_8260 ) )
    :subtasks
    ( ( !STACK ?AUTO_8259 ?AUTO_8260 )
      ( MAKE-ON ?AUTO_8255 ?AUTO_8256 )
      ( MAKE-ON-VERIFY ?AUTO_8255 ?AUTO_8256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8263 - BLOCK
      ?AUTO_8264 - BLOCK
    )
    :vars
    (
      ?AUTO_8268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8263 ) ( CLEAR ?AUTO_8263 ) ( HOLDING ?AUTO_8264 ) ( CLEAR ?AUTO_8268 ) )
    :subtasks
    ( ( !STACK ?AUTO_8264 ?AUTO_8268 )
      ( MAKE-ON ?AUTO_8263 ?AUTO_8264 )
      ( MAKE-ON-VERIFY ?AUTO_8263 ?AUTO_8264 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8277 - BLOCK
      ?AUTO_8278 - BLOCK
    )
    :vars
    (
      ?AUTO_8280 - BLOCK
      ?AUTO_8282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8277 ) ( CLEAR ?AUTO_8277 ) ( CLEAR ?AUTO_8280 ) ( ON ?AUTO_8282 ?AUTO_8278 ) ( CLEAR ?AUTO_8282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8282 ?AUTO_8278 )
      ( MAKE-ON ?AUTO_8277 ?AUTO_8278 )
      ( MAKE-ON-VERIFY ?AUTO_8277 ?AUTO_8278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8285 - BLOCK
      ?AUTO_8286 - BLOCK
    )
    :vars
    (
      ?AUTO_8289 - BLOCK
      ?AUTO_8290 - BLOCK
      ?AUTO_8291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8285 ) ( CLEAR ?AUTO_8285 ) ( CLEAR ?AUTO_8289 ) ( ON ?AUTO_8290 ?AUTO_8286 ) ( CLEAR ?AUTO_8290 ) ( HOLDING ?AUTO_8291 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8291 )
      ( MAKE-ON ?AUTO_8285 ?AUTO_8286 )
      ( MAKE-ON-VERIFY ?AUTO_8285 ?AUTO_8286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8294 - BLOCK
      ?AUTO_8295 - BLOCK
    )
    :vars
    (
      ?AUTO_8297 - BLOCK
      ?AUTO_8298 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8297 ) ( ON ?AUTO_8298 ?AUTO_8295 ) ( CLEAR ?AUTO_8298 ) ( HOLDING ?AUTO_8294 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8294 )
      ( MAKE-ON ?AUTO_8294 ?AUTO_8295 )
      ( MAKE-ON-VERIFY ?AUTO_8294 ?AUTO_8295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8313 - BLOCK
      ?AUTO_8314 - BLOCK
    )
    :vars
    (
      ?AUTO_8315 - BLOCK
      ?AUTO_8319 - BLOCK
      ?AUTO_8318 - BLOCK
      ?AUTO_8317 - BLOCK
      ?AUTO_8321 - BLOCK
      ?AUTO_8320 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8313 ?AUTO_8315 ) ( CLEAR ?AUTO_8319 ) ( ON ?AUTO_8318 ?AUTO_8313 ) ( ON ?AUTO_8317 ?AUTO_8314 ) ( CLEAR ?AUTO_8317 ) ( CLEAR ?AUTO_8321 ) ( ON ?AUTO_8320 ?AUTO_8318 ) ( CLEAR ?AUTO_8320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8320 ?AUTO_8318 )
      ( MAKE-ON ?AUTO_8313 ?AUTO_8314 )
      ( MAKE-ON-VERIFY ?AUTO_8313 ?AUTO_8314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8325 - BLOCK
      ?AUTO_8326 - BLOCK
    )
    :vars
    (
      ?AUTO_8329 - BLOCK
      ?AUTO_8331 - BLOCK
      ?AUTO_8333 - BLOCK
      ?AUTO_8330 - BLOCK
      ?AUTO_8334 - BLOCK
      ?AUTO_8332 - BLOCK
      ?AUTO_8335 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8325 ?AUTO_8329 ) ( CLEAR ?AUTO_8331 ) ( ON ?AUTO_8333 ?AUTO_8325 ) ( ON ?AUTO_8330 ?AUTO_8326 ) ( CLEAR ?AUTO_8330 ) ( CLEAR ?AUTO_8334 ) ( ON ?AUTO_8332 ?AUTO_8333 ) ( CLEAR ?AUTO_8332 ) ( HOLDING ?AUTO_8335 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8335 )
      ( MAKE-ON ?AUTO_8325 ?AUTO_8326 )
      ( MAKE-ON-VERIFY ?AUTO_8325 ?AUTO_8326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8336 - BLOCK
      ?AUTO_8337 - BLOCK
    )
    :vars
    (
      ?AUTO_8343 - BLOCK
      ?AUTO_8340 - BLOCK
      ?AUTO_8339 - BLOCK
      ?AUTO_8341 - BLOCK
      ?AUTO_8346 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8336 ?AUTO_8343 ) ( ON ?AUTO_8340 ?AUTO_8336 ) ( ON ?AUTO_8339 ?AUTO_8337 ) ( ON ?AUTO_8341 ?AUTO_8340 ) ( CLEAR ?AUTO_8341 ) ( ON ?AUTO_8346 ?AUTO_8339 ) ( CLEAR ?AUTO_8346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8346 ?AUTO_8339 )
      ( MAKE-ON ?AUTO_8336 ?AUTO_8337 )
      ( MAKE-ON-VERIFY ?AUTO_8336 ?AUTO_8337 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8348 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8348 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8348 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8348 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8350 - BLOCK
    )
    :vars
    (
      ?AUTO_8353 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8350 ?AUTO_8353 ) ( CLEAR ?AUTO_8350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8350 ?AUTO_8353 )
      ( MAKE-ON-TABLE ?AUTO_8350 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8350 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8355 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8355 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8355 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8355 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8357 - BLOCK
    )
    :vars
    (
      ?AUTO_8360 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8357 ?AUTO_8360 ) ( CLEAR ?AUTO_8357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8357 ?AUTO_8360 )
      ( MAKE-ON-TABLE ?AUTO_8357 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8357 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8361 - BLOCK
    )
    :vars
    (
      ?AUTO_8363 - BLOCK
      ?AUTO_8364 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8361 ?AUTO_8363 ) ( CLEAR ?AUTO_8361 ) ( HOLDING ?AUTO_8364 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8364 )
      ( MAKE-ON-TABLE ?AUTO_8361 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8368 - BLOCK
      ?AUTO_8369 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8368 ) ( CLEAR ?AUTO_8369 ) )
    :subtasks
    ( ( !STACK ?AUTO_8368 ?AUTO_8369 )
      ( MAKE-ON-VERIFY ?AUTO_8368 ?AUTO_8369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8372 - BLOCK
      ?AUTO_8373 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8373 ) ( ON-TABLE ?AUTO_8372 ) ( CLEAR ?AUTO_8372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8372 )
      ( MAKE-ON ?AUTO_8372 ?AUTO_8373 )
      ( MAKE-ON-VERIFY ?AUTO_8372 ?AUTO_8373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8377 - BLOCK
      ?AUTO_8378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8377 ) ( CLEAR ?AUTO_8377 ) ( HOLDING ?AUTO_8378 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8378 )
      ( MAKE-ON ?AUTO_8377 ?AUTO_8378 )
      ( MAKE-ON-VERIFY ?AUTO_8377 ?AUTO_8378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8382 - BLOCK
      ?AUTO_8383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8382 ) ( ON ?AUTO_8383 ?AUTO_8382 ) ( CLEAR ?AUTO_8383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8383 ?AUTO_8382 )
      ( MAKE-ON ?AUTO_8382 ?AUTO_8383 )
      ( MAKE-ON-VERIFY ?AUTO_8382 ?AUTO_8383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8388 - BLOCK
      ?AUTO_8389 - BLOCK
    )
    :vars
    (
      ?AUTO_8392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8388 ) ( ON ?AUTO_8389 ?AUTO_8388 ) ( CLEAR ?AUTO_8389 ) ( HOLDING ?AUTO_8392 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8392 )
      ( MAKE-ON ?AUTO_8388 ?AUTO_8389 )
      ( MAKE-ON-VERIFY ?AUTO_8388 ?AUTO_8389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8397 - BLOCK
      ?AUTO_8398 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8397 ) ( CLEAR ?AUTO_8398 ) )
    :subtasks
    ( ( !STACK ?AUTO_8397 ?AUTO_8398 )
      ( MAKE-ON-VERIFY ?AUTO_8397 ?AUTO_8398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8401 - BLOCK
      ?AUTO_8402 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8402 ) ( ON-TABLE ?AUTO_8401 ) ( CLEAR ?AUTO_8401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8401 )
      ( MAKE-ON ?AUTO_8401 ?AUTO_8402 )
      ( MAKE-ON-VERIFY ?AUTO_8401 ?AUTO_8402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8406 - BLOCK
      ?AUTO_8407 - BLOCK
    )
    :vars
    (
      ?AUTO_8411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8406 ) ( CLEAR ?AUTO_8406 ) ( HOLDING ?AUTO_8407 ) ( CLEAR ?AUTO_8411 ) )
    :subtasks
    ( ( !STACK ?AUTO_8407 ?AUTO_8411 )
      ( MAKE-ON ?AUTO_8406 ?AUTO_8407 )
      ( MAKE-ON-VERIFY ?AUTO_8406 ?AUTO_8407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8414 - BLOCK
      ?AUTO_8415 - BLOCK
    )
    :vars
    (
      ?AUTO_8418 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8415 ) ( ON-TABLE ?AUTO_8414 ) ( CLEAR ?AUTO_8414 ) ( HOLDING ?AUTO_8418 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8418 )
      ( MAKE-ON ?AUTO_8414 ?AUTO_8415 )
      ( MAKE-ON-VERIFY ?AUTO_8414 ?AUTO_8415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8419 - BLOCK
      ?AUTO_8420 - BLOCK
    )
    :vars
    (
      ?AUTO_8423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8419 ) ( CLEAR ?AUTO_8419 ) ( ON ?AUTO_8423 ?AUTO_8420 ) ( CLEAR ?AUTO_8423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8423 ?AUTO_8420 )
      ( MAKE-ON ?AUTO_8419 ?AUTO_8420 )
      ( MAKE-ON-VERIFY ?AUTO_8419 ?AUTO_8420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8426 - BLOCK
      ?AUTO_8427 - BLOCK
    )
    :vars
    (
      ?AUTO_8430 - BLOCK
      ?AUTO_8431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8426 ) ( CLEAR ?AUTO_8426 ) ( ON ?AUTO_8430 ?AUTO_8427 ) ( CLEAR ?AUTO_8430 ) ( HOLDING ?AUTO_8431 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8431 )
      ( MAKE-ON ?AUTO_8426 ?AUTO_8427 )
      ( MAKE-ON-VERIFY ?AUTO_8426 ?AUTO_8427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8432 - BLOCK
      ?AUTO_8433 - BLOCK
    )
    :vars
    (
      ?AUTO_8436 - BLOCK
      ?AUTO_8437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8432 ) ( ON ?AUTO_8436 ?AUTO_8433 ) ( CLEAR ?AUTO_8436 ) ( ON ?AUTO_8437 ?AUTO_8432 ) ( CLEAR ?AUTO_8437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8437 ?AUTO_8432 )
      ( MAKE-ON ?AUTO_8432 ?AUTO_8433 )
      ( MAKE-ON-VERIFY ?AUTO_8432 ?AUTO_8433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8442 - BLOCK
      ?AUTO_8443 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8442 ) ( CLEAR ?AUTO_8443 ) )
    :subtasks
    ( ( !STACK ?AUTO_8442 ?AUTO_8443 )
      ( MAKE-ON-VERIFY ?AUTO_8442 ?AUTO_8443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8446 - BLOCK
      ?AUTO_8447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8447 ) ( ON-TABLE ?AUTO_8446 ) ( CLEAR ?AUTO_8446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8446 )
      ( MAKE-ON ?AUTO_8446 ?AUTO_8447 )
      ( MAKE-ON-VERIFY ?AUTO_8446 ?AUTO_8447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8451 - BLOCK
      ?AUTO_8452 - BLOCK
    )
    :vars
    (
      ?AUTO_8456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8451 ) ( CLEAR ?AUTO_8451 ) ( HOLDING ?AUTO_8452 ) ( CLEAR ?AUTO_8456 ) )
    :subtasks
    ( ( !STACK ?AUTO_8452 ?AUTO_8456 )
      ( MAKE-ON ?AUTO_8451 ?AUTO_8452 )
      ( MAKE-ON-VERIFY ?AUTO_8451 ?AUTO_8452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8459 - BLOCK
      ?AUTO_8460 - BLOCK
    )
    :vars
    (
      ?AUTO_8463 - BLOCK
      ?AUTO_8464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8460 ) ( ON-TABLE ?AUTO_8459 ) ( CLEAR ?AUTO_8459 ) ( HOLDING ?AUTO_8463 ) ( CLEAR ?AUTO_8464 ) )
    :subtasks
    ( ( !STACK ?AUTO_8463 ?AUTO_8464 )
      ( MAKE-ON ?AUTO_8459 ?AUTO_8460 )
      ( MAKE-ON-VERIFY ?AUTO_8459 ?AUTO_8460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8477 - BLOCK
      ?AUTO_8478 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8477 ) ( CLEAR ?AUTO_8478 ) )
    :subtasks
    ( ( !STACK ?AUTO_8477 ?AUTO_8478 )
      ( MAKE-ON-VERIFY ?AUTO_8477 ?AUTO_8478 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8481 - BLOCK
      ?AUTO_8482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8482 ) ( ON-TABLE ?AUTO_8481 ) ( CLEAR ?AUTO_8481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8481 )
      ( MAKE-ON ?AUTO_8481 ?AUTO_8482 )
      ( MAKE-ON-VERIFY ?AUTO_8481 ?AUTO_8482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8486 - BLOCK
      ?AUTO_8487 - BLOCK
    )
    :vars
    (
      ?AUTO_8491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8486 ) ( CLEAR ?AUTO_8486 ) ( HOLDING ?AUTO_8487 ) ( CLEAR ?AUTO_8491 ) )
    :subtasks
    ( ( !STACK ?AUTO_8487 ?AUTO_8491 )
      ( MAKE-ON ?AUTO_8486 ?AUTO_8487 )
      ( MAKE-ON-VERIFY ?AUTO_8486 ?AUTO_8487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8494 - BLOCK
      ?AUTO_8495 - BLOCK
    )
    :vars
    (
      ?AUTO_8498 - BLOCK
      ?AUTO_8499 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8495 ) ( ON-TABLE ?AUTO_8494 ) ( CLEAR ?AUTO_8494 ) ( HOLDING ?AUTO_8498 ) ( CLEAR ?AUTO_8499 ) )
    :subtasks
    ( ( !STACK ?AUTO_8498 ?AUTO_8499 )
      ( MAKE-ON ?AUTO_8494 ?AUTO_8495 )
      ( MAKE-ON-VERIFY ?AUTO_8494 ?AUTO_8495 ) )
  )

)

