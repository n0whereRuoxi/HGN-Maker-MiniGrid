( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn :method-ids :q-values )
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
    :cost ( 1 )
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
    :cost ( 1 )
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
    :cost ( 1 )
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
    :cost ( 1 )
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
    :id ( 100 )
    :q-value ( 0 )
    :q-count ( 0 )
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
    :id ( 101 )
    :q-value ( 0 )
    :q-count ( 0 )
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
    ( ( !STACK ?AUTO_2 ?AUTO_3 ) )
    :id ( 102 )
    :q-value ( 1 )
    :q-count ( 3462 )
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
      ( MAKE-ON ?AUTO_6 ?AUTO_7 ) )
    :id ( 103 )
    :q-value ( 2 )
    :q-count ( 1891 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_13 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_13 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_13 ) )
    :id ( 104 )
    :q-value ( 1 )
    :q-count ( 1599 )
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
      ( MAKE-ON-TABLE ?AUTO_15 ) )
    :id ( 105 )
    :q-value ( 2 )
    :q-count ( 1599 )
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
      ( MAKE-ON-TABLE ?AUTO_19 ) )
    :id ( 106 )
    :q-value ( 3 )
    :q-count ( 643 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_24 - BLOCK
    )
    :vars
    (
      ?AUTO_25 - BLOCK
      ?AUTO_28 - BLOCK
      ?AUTO_27 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_24 ?AUTO_25 ) ( CLEAR ?AUTO_28 ) ( ON ?AUTO_27 ?AUTO_24 ) ( CLEAR ?AUTO_27 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_27 ?AUTO_24 )
      ( MAKE-ON-TABLE ?AUTO_24 ) )
    :id ( 107 )
    :q-value ( 4 )
    :q-count ( 802 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_38 - BLOCK
    )
    :vars
    (
      ?AUTO_40 - BLOCK
      ?AUTO_41 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_38 ?AUTO_40 ) ( CLEAR ?AUTO_38 ) ( HOLDING ?AUTO_41 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_41 )
      ( MAKE-ON-TABLE ?AUTO_38 ) )
    :id ( 110 )
    :q-value ( 3 )
    :q-count ( 528 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_48 - BLOCK
    )
    :vars
    (
      ?AUTO_50 - BLOCK
      ?AUTO_51 - BLOCK
      ?AUTO_52 - BLOCK
      ?AUTO_53 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_48 ?AUTO_50 ) ( ON ?AUTO_51 ?AUTO_48 ) ( CLEAR ?AUTO_51 ) ( HOLDING ?AUTO_52 ) ( CLEAR ?AUTO_53 ) )
    :subtasks
    ( ( !STACK ?AUTO_52 ?AUTO_53 )
      ( MAKE-ON-TABLE ?AUTO_48 ) )
    :id ( 112 )
    :q-value ( 5 )
    :q-count ( 316 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_54 - BLOCK
    )
    :vars
    (
      ?AUTO_55 - BLOCK
      ?AUTO_58 - BLOCK
      ?AUTO_59 - BLOCK
      ?AUTO_57 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_54 ?AUTO_55 ) ( ON ?AUTO_58 ?AUTO_54 ) ( CLEAR ?AUTO_59 ) ( ON ?AUTO_57 ?AUTO_58 ) ( CLEAR ?AUTO_57 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_57 ?AUTO_58 )
      ( MAKE-ON-TABLE ?AUTO_54 ) )
    :id ( 113 )
    :q-value ( 6 )
    :q-count ( 353 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_90 - BLOCK
      ?AUTO_91 - BLOCK
    )
    :vars
    (
      ?AUTO_94 - BLOCK
      ?AUTO_95 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_91 ) ( ON ?AUTO_90 ?AUTO_94 ) ( CLEAR ?AUTO_90 ) ( HOLDING ?AUTO_95 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_95 )
      ( MAKE-ON ?AUTO_90 ?AUTO_91 ) )
    :id ( 119 )
    :q-value ( 3 )
    :q-count ( 554 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_96 - BLOCK
      ?AUTO_97 - BLOCK
    )
    :vars
    (
      ?AUTO_98 - BLOCK
      ?AUTO_99 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_97 ) ( ON ?AUTO_96 ?AUTO_98 ) ( ON ?AUTO_99 ?AUTO_96 ) ( CLEAR ?AUTO_99 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_99 ?AUTO_96 )
      ( MAKE-ON ?AUTO_96 ?AUTO_97 ) )
    :id ( 120 )
    :q-value ( 4 )
    :q-count ( 565 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_104 - BLOCK
      ?AUTO_105 - BLOCK
    )
    :vars
    (
      ?AUTO_108 - BLOCK
      ?AUTO_106 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_104 ?AUTO_108 ) ( ON ?AUTO_106 ?AUTO_104 ) ( CLEAR ?AUTO_106 ) ( HOLDING ?AUTO_105 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_105 )
      ( MAKE-ON ?AUTO_104 ?AUTO_105 ) )
    :id ( 121 )
    :q-value ( 5.032 )
    :q-count ( 125 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_113 - BLOCK
      ?AUTO_114 - BLOCK
    )
    :vars
    (
      ?AUTO_116 - BLOCK
      ?AUTO_115 - BLOCK
      ?AUTO_119 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_114 ) ( ON ?AUTO_113 ?AUTO_116 ) ( ON ?AUTO_115 ?AUTO_113 ) ( CLEAR ?AUTO_115 ) ( HOLDING ?AUTO_119 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_119 )
      ( MAKE-ON ?AUTO_113 ?AUTO_114 ) )
    :id ( 122 )
    :q-value ( 5 )
    :q-count ( 159 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_120 - BLOCK
      ?AUTO_121 - BLOCK
    )
    :vars
    (
      ?AUTO_124 - BLOCK
      ?AUTO_125 - BLOCK
      ?AUTO_126 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_120 ?AUTO_124 ) ( ON ?AUTO_125 ?AUTO_120 ) ( CLEAR ?AUTO_125 ) ( ON ?AUTO_126 ?AUTO_121 ) ( CLEAR ?AUTO_126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_126 ?AUTO_121 )
      ( MAKE-ON ?AUTO_120 ?AUTO_121 ) )
    :id ( 123 )
    :q-value ( 6 )
    :q-count ( 122 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_129 - BLOCK
      ?AUTO_130 - BLOCK
    )
    :vars
    (
      ?AUTO_135 - BLOCK
      ?AUTO_134 - BLOCK
      ?AUTO_132 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_129 ?AUTO_135 ) ( ON ?AUTO_134 ?AUTO_130 ) ( CLEAR ?AUTO_134 ) ( HOLDING ?AUTO_132 ) ( CLEAR ?AUTO_129 ) )
    :subtasks
    ( ( !STACK ?AUTO_132 ?AUTO_129 )
      ( MAKE-ON ?AUTO_129 ?AUTO_130 ) )
    :id ( 124 )
    :q-value ( 7 )
    :q-count ( 25 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_138 - BLOCK
      ?AUTO_139 - BLOCK
    )
    :vars
    (
      ?AUTO_144 - BLOCK
      ?AUTO_141 - BLOCK
      ?AUTO_142 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_138 ?AUTO_144 ) ( ON ?AUTO_141 ?AUTO_139 ) ( CLEAR ?AUTO_138 ) ( ON ?AUTO_142 ?AUTO_141 ) ( CLEAR ?AUTO_142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_142 ?AUTO_141 )
      ( MAKE-ON ?AUTO_138 ?AUTO_139 ) )
    :id ( 125 )
    :q-value ( 6.16968 )
    :q-count ( 224 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_159 - BLOCK
      ?AUTO_160 - BLOCK
    )
    :vars
    (
      ?AUTO_163 - BLOCK
      ?AUTO_164 - BLOCK
      ?AUTO_165 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_160 ) ( ON ?AUTO_159 ?AUTO_163 ) ( CLEAR ?AUTO_159 ) ( HOLDING ?AUTO_164 ) ( CLEAR ?AUTO_165 ) )
    :subtasks
    ( ( !STACK ?AUTO_164 ?AUTO_165 )
      ( MAKE-ON ?AUTO_159 ?AUTO_160 ) )
    :id ( 128 )
    :q-value ( 3 )
    :q-count ( 755 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_166 - BLOCK
      ?AUTO_167 - BLOCK
    )
    :vars
    (
      ?AUTO_170 - BLOCK
      ?AUTO_171 - BLOCK
      ?AUTO_172 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_166 ?AUTO_170 ) ( CLEAR ?AUTO_166 ) ( CLEAR ?AUTO_171 ) ( ON ?AUTO_172 ?AUTO_167 ) ( CLEAR ?AUTO_172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_172 ?AUTO_167 )
      ( MAKE-ON ?AUTO_166 ?AUTO_167 ) )
    :id ( 129 )
    :q-value ( 4 )
    :q-count ( 546 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_175 - BLOCK
      ?AUTO_176 - BLOCK
    )
    :vars
    (
      ?AUTO_179 - BLOCK
      ?AUTO_178 - BLOCK
      ?AUTO_181 - BLOCK
      ?AUTO_182 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_175 ?AUTO_179 ) ( CLEAR ?AUTO_175 ) ( CLEAR ?AUTO_178 ) ( ON ?AUTO_181 ?AUTO_176 ) ( CLEAR ?AUTO_181 ) ( HOLDING ?AUTO_182 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_182 )
      ( MAKE-ON ?AUTO_175 ?AUTO_176 ) )
    :id ( 130 )
    :q-value ( 5 )
    :q-count ( 201 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_193 - BLOCK
      ?AUTO_194 - BLOCK
    )
    :vars
    (
      ?AUTO_200 - BLOCK
      ?AUTO_198 - BLOCK
      ?AUTO_195 - BLOCK
      ?AUTO_196 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_193 ?AUTO_200 ) ( CLEAR ?AUTO_193 ) ( ON ?AUTO_198 ?AUTO_194 ) ( ON ?AUTO_195 ?AUTO_198 ) ( CLEAR ?AUTO_195 ) ( HOLDING ?AUTO_196 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_196 )
      ( MAKE-ON ?AUTO_193 ?AUTO_194 ) )
    :id ( 132 )
    :q-value ( 7.22473 )
    :q-count ( 89 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_202 - BLOCK
      ?AUTO_203 - BLOCK
    )
    :vars
    (
      ?AUTO_208 - BLOCK
      ?AUTO_209 - BLOCK
      ?AUTO_205 - BLOCK
      ?AUTO_207 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_202 ?AUTO_208 ) ( ON ?AUTO_209 ?AUTO_203 ) ( ON ?AUTO_205 ?AUTO_209 ) ( CLEAR ?AUTO_205 ) ( ON ?AUTO_207 ?AUTO_202 ) ( CLEAR ?AUTO_207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_207 ?AUTO_202 )
      ( MAKE-ON ?AUTO_202 ?AUTO_203 ) )
    :id ( 133 )
    :q-value ( 8.68965 )
    :q-count ( 29 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_212 - BLOCK
      ?AUTO_213 - BLOCK
    )
    :vars
    (
      ?AUTO_214 - BLOCK
      ?AUTO_217 - BLOCK
      ?AUTO_218 - BLOCK
      ?AUTO_215 - BLOCK
      ?AUTO_220 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_212 ?AUTO_214 ) ( ON ?AUTO_217 ?AUTO_213 ) ( ON ?AUTO_218 ?AUTO_217 ) ( CLEAR ?AUTO_218 ) ( ON ?AUTO_215 ?AUTO_212 ) ( CLEAR ?AUTO_215 ) ( HOLDING ?AUTO_220 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_220 )
      ( MAKE-ON ?AUTO_212 ?AUTO_213 ) )
    :id ( 134 )
    :q-value ( 9.28571 )
    :q-count ( 35 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_221 - BLOCK
      ?AUTO_222 - BLOCK
    )
    :vars
    (
      ?AUTO_227 - BLOCK
      ?AUTO_228 - BLOCK
      ?AUTO_229 - BLOCK
      ?AUTO_224 - BLOCK
      ?AUTO_223 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_221 ?AUTO_227 ) ( ON ?AUTO_228 ?AUTO_222 ) ( ON ?AUTO_229 ?AUTO_228 ) ( CLEAR ?AUTO_229 ) ( ON ?AUTO_224 ?AUTO_221 ) ( ON ?AUTO_223 ?AUTO_224 ) ( CLEAR ?AUTO_223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_223 ?AUTO_224 )
      ( MAKE-ON ?AUTO_221 ?AUTO_222 ) )
    :id ( 135 )
    :q-value ( 11.2307 )
    :q-count ( 13 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_232 - BLOCK
      ?AUTO_233 - BLOCK
    )
    :vars
    (
      ?AUTO_240 - BLOCK
      ?AUTO_237 - BLOCK
      ?AUTO_236 - BLOCK
      ?AUTO_239 - BLOCK
      ?AUTO_238 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_232 ?AUTO_240 ) ( ON ?AUTO_237 ?AUTO_233 ) ( ON ?AUTO_236 ?AUTO_232 ) ( ON ?AUTO_239 ?AUTO_236 ) ( CLEAR ?AUTO_239 ) ( HOLDING ?AUTO_238 ) ( CLEAR ?AUTO_237 ) )
    :subtasks
    ( ( !STACK ?AUTO_238 ?AUTO_237 )
      ( MAKE-ON ?AUTO_232 ?AUTO_233 ) )
    :id ( 136 )
    :q-value ( 12.3333 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_243 - BLOCK
      ?AUTO_244 - BLOCK
    )
    :vars
    (
      ?AUTO_251 - BLOCK
      ?AUTO_249 - BLOCK
      ?AUTO_248 - BLOCK
      ?AUTO_250 - BLOCK
      ?AUTO_247 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_243 ?AUTO_251 ) ( ON ?AUTO_249 ?AUTO_244 ) ( ON ?AUTO_248 ?AUTO_243 ) ( ON ?AUTO_250 ?AUTO_248 ) ( CLEAR ?AUTO_249 ) ( ON ?AUTO_247 ?AUTO_250 ) ( CLEAR ?AUTO_247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_247 ?AUTO_250 )
      ( MAKE-ON ?AUTO_243 ?AUTO_244 ) )
    :id ( 137 )
    :q-value ( 10.6154 )
    :q-count ( 13 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_260 - BLOCK
      ?AUTO_261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_261 ) ( ON-TABLE ?AUTO_260 ) ( CLEAR ?AUTO_260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_260 )
      ( MAKE-ON ?AUTO_260 ?AUTO_261 ) )
    :id ( 139 )
    :q-value ( 2 )
    :q-count ( 1587 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_265 - BLOCK
      ?AUTO_266 - BLOCK
    )
    :vars
    (
      ?AUTO_269 - BLOCK
      ?AUTO_270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_266 ) ( ON-TABLE ?AUTO_265 ) ( CLEAR ?AUTO_265 ) ( HOLDING ?AUTO_269 ) ( CLEAR ?AUTO_270 ) )
    :subtasks
    ( ( !STACK ?AUTO_269 ?AUTO_270 )
      ( MAKE-ON ?AUTO_265 ?AUTO_266 ) )
    :id ( 140 )
    :q-value ( 3 )
    :q-count ( 838 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_271 - BLOCK
      ?AUTO_272 - BLOCK
    )
    :vars
    (
      ?AUTO_275 - BLOCK
      ?AUTO_276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_272 ) ( ON-TABLE ?AUTO_271 ) ( CLEAR ?AUTO_275 ) ( ON ?AUTO_276 ?AUTO_271 ) ( CLEAR ?AUTO_276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_276 ?AUTO_271 )
      ( MAKE-ON ?AUTO_271 ?AUTO_272 ) )
    :id ( 141 )
    :q-value ( 4 )
    :q-count ( 666 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_279 - BLOCK
      ?AUTO_280 - BLOCK
    )
    :vars
    (
      ?AUTO_284 - BLOCK
      ?AUTO_283 - BLOCK
      ?AUTO_285 - BLOCK
      ?AUTO_286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_280 ) ( ON-TABLE ?AUTO_279 ) ( CLEAR ?AUTO_284 ) ( ON ?AUTO_283 ?AUTO_279 ) ( CLEAR ?AUTO_283 ) ( HOLDING ?AUTO_285 ) ( CLEAR ?AUTO_286 ) )
    :subtasks
    ( ( !STACK ?AUTO_285 ?AUTO_286 )
      ( MAKE-ON ?AUTO_279 ?AUTO_280 ) )
    :id ( 142 )
    :q-value ( 5 )
    :q-count ( 328 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_295 - BLOCK
      ?AUTO_296 - BLOCK
    )
    :vars
    (
      ?AUTO_297 - BLOCK
      ?AUTO_301 - BLOCK
      ?AUTO_300 - BLOCK
      ?AUTO_302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_296 ) ( ON-TABLE ?AUTO_295 ) ( CLEAR ?AUTO_297 ) ( ON ?AUTO_301 ?AUTO_295 ) ( CLEAR ?AUTO_300 ) ( ON ?AUTO_302 ?AUTO_301 ) ( CLEAR ?AUTO_302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_302 ?AUTO_301 )
      ( MAKE-ON ?AUTO_295 ?AUTO_296 ) )
    :id ( 143 )
    :q-value ( 6.10165 )
    :q-count ( 295 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_305 - BLOCK
      ?AUTO_306 - BLOCK
    )
    :vars
    (
      ?AUTO_309 - BLOCK
      ?AUTO_312 - BLOCK
      ?AUTO_311 - BLOCK
      ?AUTO_310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_305 ) ( CLEAR ?AUTO_309 ) ( ON ?AUTO_312 ?AUTO_305 ) ( CLEAR ?AUTO_311 ) ( ON ?AUTO_310 ?AUTO_312 ) ( CLEAR ?AUTO_310 ) ( HOLDING ?AUTO_306 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_306 )
      ( MAKE-ON ?AUTO_305 ?AUTO_306 ) )
    :id ( 144 )
    :q-value ( 7 )
    :q-count ( 54 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_314 - BLOCK
      ?AUTO_315 - BLOCK
    )
    :vars
    (
      ?AUTO_321 - BLOCK
      ?AUTO_317 - BLOCK
      ?AUTO_318 - BLOCK
      ?AUTO_319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_314 ) ( CLEAR ?AUTO_321 ) ( ON ?AUTO_317 ?AUTO_314 ) ( CLEAR ?AUTO_318 ) ( ON ?AUTO_319 ?AUTO_317 ) ( ON ?AUTO_315 ?AUTO_319 ) ( CLEAR ?AUTO_315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_315 ?AUTO_319 )
      ( MAKE-ON ?AUTO_314 ?AUTO_315 ) )
    :id ( 145 )
    :q-value ( 8.05716 )
    :q-count ( 35 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_324 - BLOCK
      ?AUTO_325 - BLOCK
    )
    :vars
    (
      ?AUTO_329 - BLOCK
      ?AUTO_330 - BLOCK
      ?AUTO_331 - BLOCK
      ?AUTO_333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_324 ) ( ON ?AUTO_329 ?AUTO_324 ) ( ON ?AUTO_330 ?AUTO_329 ) ( ON ?AUTO_325 ?AUTO_330 ) ( CLEAR ?AUTO_325 ) ( HOLDING ?AUTO_331 ) ( CLEAR ?AUTO_333 ) )
    :subtasks
    ( ( !STACK ?AUTO_331 ?AUTO_333 )
      ( MAKE-ON ?AUTO_324 ?AUTO_325 ) )
    :id ( 146 )
    :q-value ( 9.13334 )
    :q-count ( 15 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_334 - BLOCK
      ?AUTO_335 - BLOCK
    )
    :vars
    (
      ?AUTO_340 - BLOCK
      ?AUTO_337 - BLOCK
      ?AUTO_341 - BLOCK
      ?AUTO_339 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_334 ) ( ON ?AUTO_340 ?AUTO_334 ) ( ON ?AUTO_337 ?AUTO_340 ) ( ON ?AUTO_335 ?AUTO_337 ) ( CLEAR ?AUTO_341 ) ( ON ?AUTO_339 ?AUTO_335 ) ( CLEAR ?AUTO_339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_339 ?AUTO_335 )
      ( MAKE-ON ?AUTO_334 ?AUTO_335 ) )
    :id ( 147 )
    :q-value ( 10 )
    :q-count ( 14 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_367 - BLOCK
      ?AUTO_368 - BLOCK
    )
    :vars
    (
      ?AUTO_372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_367 ) ( CLEAR ?AUTO_367 ) ( HOLDING ?AUTO_368 ) ( CLEAR ?AUTO_372 ) )
    :subtasks
    ( ( !STACK ?AUTO_368 ?AUTO_372 )
      ( MAKE-ON ?AUTO_367 ?AUTO_368 ) )
    :id ( 151 )
    :q-value ( 3 )
    :q-count ( 560 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_412 - BLOCK
      ?AUTO_413 - BLOCK
    )
    :vars
    (
      ?AUTO_415 - BLOCK
      ?AUTO_418 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_412 ?AUTO_415 ) ( CLEAR ?AUTO_412 ) ( HOLDING ?AUTO_413 ) ( CLEAR ?AUTO_418 ) )
    :subtasks
    ( ( !STACK ?AUTO_413 ?AUTO_418 )
      ( MAKE-ON ?AUTO_412 ?AUTO_413 ) )
    :id ( 155 )
    :q-value ( 3 )
    :q-count ( 609 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_476 - BLOCK
      ?AUTO_477 - BLOCK
    )
    :vars
    (
      ?AUTO_480 - BLOCK
      ?AUTO_481 - BLOCK
      ?AUTO_482 - BLOCK
      ?AUTO_483 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_477 ) ( ON ?AUTO_476 ?AUTO_480 ) ( ON ?AUTO_481 ?AUTO_476 ) ( CLEAR ?AUTO_481 ) ( HOLDING ?AUTO_482 ) ( CLEAR ?AUTO_483 ) )
    :subtasks
    ( ( !STACK ?AUTO_482 ?AUTO_483 )
      ( MAKE-ON ?AUTO_476 ?AUTO_477 ) )
    :id ( 166 )
    :q-value ( 5 )
    :q-count ( 205 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_484 - BLOCK
      ?AUTO_485 - BLOCK
    )
    :vars
    (
      ?AUTO_489 - BLOCK
      ?AUTO_490 - BLOCK
      ?AUTO_486 - BLOCK
      ?AUTO_491 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_485 ) ( ON ?AUTO_484 ?AUTO_489 ) ( ON ?AUTO_490 ?AUTO_484 ) ( CLEAR ?AUTO_486 ) ( ON ?AUTO_491 ?AUTO_490 ) ( CLEAR ?AUTO_491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_491 ?AUTO_490 )
      ( MAKE-ON ?AUTO_484 ?AUTO_485 ) )
    :id ( 167 )
    :q-value ( 6.17973 )
    :q-count ( 178 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_515 - BLOCK
      ?AUTO_516 - BLOCK
    )
    :vars
    (
      ?AUTO_517 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_515 ?AUTO_517 ) ( CLEAR ?AUTO_515 ) ( HOLDING ?AUTO_516 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_516 )
      ( MAKE-ON ?AUTO_515 ?AUTO_516 ) )
    :id ( 171 )
    :q-value ( 3 )
    :q-count ( 281 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_562 - BLOCK
      ?AUTO_563 - BLOCK
    )
    :vars
    (
      ?AUTO_565 - BLOCK
      ?AUTO_566 - BLOCK
      ?AUTO_568 - BLOCK
      ?AUTO_570 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_562 ?AUTO_565 ) ( CLEAR ?AUTO_566 ) ( ON ?AUTO_568 ?AUTO_562 ) ( CLEAR ?AUTO_568 ) ( HOLDING ?AUTO_563 ) ( CLEAR ?AUTO_570 ) )
    :subtasks
    ( ( !STACK ?AUTO_563 ?AUTO_570 )
      ( MAKE-ON ?AUTO_562 ?AUTO_563 ) )
    :id ( 177 )
    :q-value ( 5.12698 )
    :q-count ( 126 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_591 - BLOCK
      ?AUTO_592 - BLOCK
    )
    :vars
    (
      ?AUTO_593 - BLOCK
      ?AUTO_596 - BLOCK
      ?AUTO_598 - BLOCK
      ?AUTO_595 - BLOCK
      ?AUTO_599 - BLOCK
      ?AUTO_600 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_591 ?AUTO_593 ) ( CLEAR ?AUTO_596 ) ( ON ?AUTO_598 ?AUTO_591 ) ( CLEAR ?AUTO_598 ) ( ON ?AUTO_595 ?AUTO_592 ) ( CLEAR ?AUTO_595 ) ( HOLDING ?AUTO_599 ) ( CLEAR ?AUTO_600 ) )
    :subtasks
    ( ( !STACK ?AUTO_599 ?AUTO_600 )
      ( MAKE-ON ?AUTO_591 ?AUTO_592 ) )
    :id ( 180 )
    :q-value ( 7 )
    :q-count ( 39 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_601 - BLOCK
      ?AUTO_602 - BLOCK
    )
    :vars
    (
      ?AUTO_603 - BLOCK
      ?AUTO_608 - BLOCK
      ?AUTO_604 - BLOCK
      ?AUTO_607 - BLOCK
      ?AUTO_610 - BLOCK
      ?AUTO_609 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_601 ?AUTO_603 ) ( CLEAR ?AUTO_608 ) ( ON ?AUTO_604 ?AUTO_601 ) ( CLEAR ?AUTO_604 ) ( ON ?AUTO_607 ?AUTO_602 ) ( CLEAR ?AUTO_610 ) ( ON ?AUTO_609 ?AUTO_607 ) ( CLEAR ?AUTO_609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_609 ?AUTO_607 )
      ( MAKE-ON ?AUTO_601 ?AUTO_602 ) )
    :id ( 181 )
    :q-value ( 8.23528 )
    :q-count ( 68 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_641 - BLOCK
      ?AUTO_642 - BLOCK
    )
    :vars
    (
      ?AUTO_646 - BLOCK
      ?AUTO_647 - BLOCK
      ?AUTO_643 - BLOCK
      ?AUTO_648 - BLOCK
      ?AUTO_649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_641 ?AUTO_646 ) ( CLEAR ?AUTO_641 ) ( CLEAR ?AUTO_647 ) ( ON ?AUTO_643 ?AUTO_642 ) ( CLEAR ?AUTO_643 ) ( HOLDING ?AUTO_648 ) ( CLEAR ?AUTO_649 ) )
    :subtasks
    ( ( !STACK ?AUTO_648 ?AUTO_649 )
      ( MAKE-ON ?AUTO_641 ?AUTO_642 ) )
    :id ( 186 )
    :q-value ( 5.01218 )
    :q-count ( 164 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_661 - BLOCK
      ?AUTO_662 - BLOCK
    )
    :vars
    (
      ?AUTO_666 - BLOCK
      ?AUTO_669 - BLOCK
      ?AUTO_668 - BLOCK
      ?AUTO_664 - BLOCK
      ?AUTO_665 - BLOCK
      ?AUTO_671 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_661 ?AUTO_666 ) ( CLEAR ?AUTO_661 ) ( ON ?AUTO_669 ?AUTO_662 ) ( CLEAR ?AUTO_668 ) ( ON ?AUTO_664 ?AUTO_669 ) ( CLEAR ?AUTO_664 ) ( HOLDING ?AUTO_665 ) ( CLEAR ?AUTO_671 ) )
    :subtasks
    ( ( !STACK ?AUTO_665 ?AUTO_671 )
      ( MAKE-ON ?AUTO_661 ?AUTO_662 ) )
    :id ( 188 )
    :q-value ( 7.39999 )
    :q-count ( 45 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_678 - BLOCK
      ?AUTO_679 - BLOCK
    )
    :vars
    (
      ?AUTO_684 - BLOCK
      ?AUTO_685 - BLOCK
      ?AUTO_680 - BLOCK
      ?AUTO_681 - BLOCK
      ?AUTO_686 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_684 ) ( ON ?AUTO_685 ?AUTO_679 ) ( CLEAR ?AUTO_680 ) ( ON ?AUTO_681 ?AUTO_685 ) ( CLEAR ?AUTO_681 ) ( HOLDING ?AUTO_678 ) ( CLEAR ?AUTO_686 ) )
    :subtasks
    ( ( !STACK ?AUTO_678 ?AUTO_686 )
      ( MAKE-ON ?AUTO_678 ?AUTO_679 ) )
    :id ( 189 )
    :q-value ( 7.46512 )
    :q-count ( 43 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_747 - BLOCK
      ?AUTO_748 - BLOCK
    )
    :vars
    (
      ?AUTO_754 - BLOCK
      ?AUTO_753 - BLOCK
      ?AUTO_755 - BLOCK
      ?AUTO_752 - BLOCK
      ?AUTO_751 - BLOCK
      ?AUTO_756 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_747 ?AUTO_754 ) ( CLEAR ?AUTO_753 ) ( ON ?AUTO_755 ?AUTO_747 ) ( CLEAR ?AUTO_755 ) ( CLEAR ?AUTO_752 ) ( ON ?AUTO_751 ?AUTO_748 ) ( CLEAR ?AUTO_751 ) ( HOLDING ?AUTO_756 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_756 )
      ( MAKE-ON ?AUTO_747 ?AUTO_748 ) )
    :id ( 196 )
    :q-value ( 7.02533 )
    :q-count ( 79 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_771 - BLOCK
      ?AUTO_772 - BLOCK
    )
    :vars
    (
      ?AUTO_778 - BLOCK
      ?AUTO_774 - BLOCK
      ?AUTO_776 - BLOCK
      ?AUTO_777 - BLOCK
      ?AUTO_780 - BLOCK
      ?AUTO_773 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_771 ?AUTO_778 ) ( CLEAR ?AUTO_771 ) ( ON ?AUTO_774 ?AUTO_772 ) ( CLEAR ?AUTO_776 ) ( ON ?AUTO_777 ?AUTO_774 ) ( CLEAR ?AUTO_780 ) ( ON ?AUTO_773 ?AUTO_777 ) ( CLEAR ?AUTO_773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_773 ?AUTO_777 )
      ( MAKE-ON ?AUTO_771 ?AUTO_772 ) )
    :id ( 198 )
    :q-value ( 8.49487 )
    :q-count ( 97 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_826 - BLOCK
      ?AUTO_827 - BLOCK
    )
    :vars
    (
      ?AUTO_828 - BLOCK
      ?AUTO_833 - BLOCK
      ?AUTO_830 - BLOCK
      ?AUTO_829 - BLOCK
      ?AUTO_834 - BLOCK
      ?AUTO_835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_827 ) ( ON-TABLE ?AUTO_826 ) ( CLEAR ?AUTO_828 ) ( ON ?AUTO_833 ?AUTO_826 ) ( CLEAR ?AUTO_830 ) ( ON ?AUTO_829 ?AUTO_833 ) ( CLEAR ?AUTO_829 ) ( HOLDING ?AUTO_834 ) ( CLEAR ?AUTO_835 ) )
    :subtasks
    ( ( !STACK ?AUTO_834 ?AUTO_835 )
      ( MAKE-ON ?AUTO_826 ?AUTO_827 ) )
    :id ( 205 )
    :q-value ( 7.06348 )
    :q-count ( 126 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_838 - BLOCK
      ?AUTO_839 - BLOCK
    )
    :vars
    (
      ?AUTO_841 - BLOCK
      ?AUTO_842 - BLOCK
      ?AUTO_840 - BLOCK
      ?AUTO_843 - BLOCK
      ?AUTO_847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_838 ) ( CLEAR ?AUTO_841 ) ( ON ?AUTO_842 ?AUTO_838 ) ( CLEAR ?AUTO_840 ) ( ON ?AUTO_843 ?AUTO_842 ) ( CLEAR ?AUTO_843 ) ( HOLDING ?AUTO_839 ) ( CLEAR ?AUTO_847 ) )
    :subtasks
    ( ( !STACK ?AUTO_839 ?AUTO_847 )
      ( MAKE-ON ?AUTO_838 ?AUTO_839 ) )
    :id ( 206 )
    :q-value ( 7.03447 )
    :q-count ( 58 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_951 - BLOCK
      ?AUTO_952 - BLOCK
    )
    :vars
    (
      ?AUTO_956 - BLOCK
      ?AUTO_953 - BLOCK
      ?AUTO_958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_951 ) ( CLEAR ?AUTO_956 ) ( ON ?AUTO_953 ?AUTO_951 ) ( CLEAR ?AUTO_953 ) ( HOLDING ?AUTO_952 ) ( CLEAR ?AUTO_958 ) )
    :subtasks
    ( ( !STACK ?AUTO_952 ?AUTO_958 )
      ( MAKE-ON ?AUTO_951 ?AUTO_952 ) )
    :id ( 215 )
    :q-value ( 5.07145 )
    :q-count ( 168 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_969 - BLOCK
      ?AUTO_970 - BLOCK
    )
    :vars
    (
      ?AUTO_971 - BLOCK
      ?AUTO_976 - BLOCK
      ?AUTO_974 - BLOCK
      ?AUTO_973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_969 ) ( CLEAR ?AUTO_971 ) ( ON ?AUTO_976 ?AUTO_969 ) ( CLEAR ?AUTO_976 ) ( CLEAR ?AUTO_974 ) ( ON ?AUTO_973 ?AUTO_970 ) ( CLEAR ?AUTO_973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_973 ?AUTO_970 )
      ( MAKE-ON ?AUTO_969 ?AUTO_970 ) )
    :id ( 217 )
    :q-value ( 6 )
    :q-count ( 172 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_979 - BLOCK
      ?AUTO_980 - BLOCK
    )
    :vars
    (
      ?AUTO_984 - BLOCK
      ?AUTO_986 - BLOCK
      ?AUTO_985 - BLOCK
      ?AUTO_983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_979 ) ( CLEAR ?AUTO_984 ) ( CLEAR ?AUTO_986 ) ( ON ?AUTO_985 ?AUTO_980 ) ( CLEAR ?AUTO_985 ) ( HOLDING ?AUTO_983 ) ( CLEAR ?AUTO_979 ) )
    :subtasks
    ( ( !STACK ?AUTO_983 ?AUTO_979 )
      ( MAKE-ON ?AUTO_979 ?AUTO_980 ) )
    :id ( 218 )
    :q-value ( 7.08512 )
    :q-count ( 47 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_989 - BLOCK
      ?AUTO_990 - BLOCK
    )
    :vars
    (
      ?AUTO_995 - BLOCK
      ?AUTO_991 - BLOCK
      ?AUTO_992 - BLOCK
      ?AUTO_993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_989 ) ( CLEAR ?AUTO_995 ) ( CLEAR ?AUTO_991 ) ( ON ?AUTO_992 ?AUTO_990 ) ( CLEAR ?AUTO_989 ) ( ON ?AUTO_993 ?AUTO_992 ) ( CLEAR ?AUTO_993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_993 ?AUTO_992 )
      ( MAKE-ON ?AUTO_989 ?AUTO_990 ) )
    :id ( 219 )
    :q-value ( 6.3518 )
    :q-count ( 199 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_999 - BLOCK
      ?AUTO_1000 - BLOCK
    )
    :vars
    (
      ?AUTO_1005 - BLOCK
      ?AUTO_1001 - BLOCK
      ?AUTO_1002 - BLOCK
      ?AUTO_1006 - BLOCK
      ?AUTO_1007 - BLOCK
      ?AUTO_1008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_999 ) ( CLEAR ?AUTO_1005 ) ( CLEAR ?AUTO_1001 ) ( ON ?AUTO_1002 ?AUTO_1000 ) ( CLEAR ?AUTO_999 ) ( ON ?AUTO_1006 ?AUTO_1002 ) ( CLEAR ?AUTO_1006 ) ( HOLDING ?AUTO_1007 ) ( CLEAR ?AUTO_1008 ) )
    :subtasks
    ( ( !STACK ?AUTO_1007 ?AUTO_1008 )
      ( MAKE-ON ?AUTO_999 ?AUTO_1000 ) )
    :id ( 220 )
    :q-value ( 7.48001 )
    :q-count ( 75 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1009 - BLOCK
      ?AUTO_1010 - BLOCK
    )
    :vars
    (
      ?AUTO_1017 - BLOCK
      ?AUTO_1014 - BLOCK
      ?AUTO_1013 - BLOCK
      ?AUTO_1015 - BLOCK
      ?AUTO_1011 - BLOCK
      ?AUTO_1018 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1009 ) ( CLEAR ?AUTO_1017 ) ( CLEAR ?AUTO_1014 ) ( ON ?AUTO_1013 ?AUTO_1010 ) ( ON ?AUTO_1015 ?AUTO_1013 ) ( CLEAR ?AUTO_1015 ) ( CLEAR ?AUTO_1011 ) ( ON ?AUTO_1018 ?AUTO_1009 ) ( CLEAR ?AUTO_1018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1018 ?AUTO_1009 )
      ( MAKE-ON ?AUTO_1009 ?AUTO_1010 ) )
    :id ( 221 )
    :q-value ( 8.54053 )
    :q-count ( 37 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1021 - BLOCK
      ?AUTO_1022 - BLOCK
    )
    :vars
    (
      ?AUTO_1029 - BLOCK
      ?AUTO_1030 - BLOCK
      ?AUTO_1024 - BLOCK
      ?AUTO_1027 - BLOCK
      ?AUTO_1023 - BLOCK
      ?AUTO_1028 - BLOCK
      ?AUTO_1032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1021 ) ( CLEAR ?AUTO_1029 ) ( ON ?AUTO_1030 ?AUTO_1022 ) ( ON ?AUTO_1024 ?AUTO_1030 ) ( CLEAR ?AUTO_1024 ) ( CLEAR ?AUTO_1027 ) ( ON ?AUTO_1023 ?AUTO_1021 ) ( CLEAR ?AUTO_1023 ) ( HOLDING ?AUTO_1028 ) ( CLEAR ?AUTO_1032 ) )
    :subtasks
    ( ( !STACK ?AUTO_1028 ?AUTO_1032 )
      ( MAKE-ON ?AUTO_1021 ?AUTO_1022 ) )
    :id ( 222 )
    :q-value ( 9.41667 )
    :q-count ( 24 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1033 - BLOCK
      ?AUTO_1034 - BLOCK
    )
    :vars
    (
      ?AUTO_1036 - BLOCK
      ?AUTO_1039 - BLOCK
      ?AUTO_1037 - BLOCK
      ?AUTO_1042 - BLOCK
      ?AUTO_1038 - BLOCK
      ?AUTO_1043 - BLOCK
      ?AUTO_1041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1033 ) ( CLEAR ?AUTO_1036 ) ( ON ?AUTO_1039 ?AUTO_1034 ) ( ON ?AUTO_1037 ?AUTO_1039 ) ( CLEAR ?AUTO_1037 ) ( CLEAR ?AUTO_1042 ) ( ON ?AUTO_1038 ?AUTO_1033 ) ( CLEAR ?AUTO_1043 ) ( ON ?AUTO_1041 ?AUTO_1038 ) ( CLEAR ?AUTO_1041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1041 ?AUTO_1038 )
      ( MAKE-ON ?AUTO_1033 ?AUTO_1034 ) )
    :id ( 223 )
    :q-value ( 11.04 )
    :q-count ( 25 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1046 - BLOCK
      ?AUTO_1047 - BLOCK
    )
    :vars
    (
      ?AUTO_1054 - BLOCK
      ?AUTO_1051 - BLOCK
      ?AUTO_1053 - BLOCK
      ?AUTO_1048 - BLOCK
      ?AUTO_1056 - BLOCK
      ?AUTO_1049 - BLOCK
      ?AUTO_1050 - BLOCK
      ?AUTO_1058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1046 ) ( CLEAR ?AUTO_1054 ) ( ON ?AUTO_1051 ?AUTO_1047 ) ( ON ?AUTO_1053 ?AUTO_1051 ) ( CLEAR ?AUTO_1053 ) ( ON ?AUTO_1048 ?AUTO_1046 ) ( CLEAR ?AUTO_1056 ) ( ON ?AUTO_1049 ?AUTO_1048 ) ( CLEAR ?AUTO_1049 ) ( HOLDING ?AUTO_1050 ) ( CLEAR ?AUTO_1058 ) )
    :subtasks
    ( ( !STACK ?AUTO_1050 ?AUTO_1058 )
      ( MAKE-ON ?AUTO_1046 ?AUTO_1047 ) )
    :id ( 224 )
    :q-value ( 12.5 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1065 - BLOCK
      ?AUTO_1066 - BLOCK
    )
    :vars
    (
      ?AUTO_1072 - BLOCK
      ?AUTO_1075 - BLOCK
      ?AUTO_1068 - BLOCK
      ?AUTO_1070 - BLOCK
      ?AUTO_1073 - BLOCK
      ?AUTO_1071 - BLOCK
      ?AUTO_1074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1065 ) ( CLEAR ?AUTO_1072 ) ( ON ?AUTO_1075 ?AUTO_1066 ) ( CLEAR ?AUTO_1068 ) ( ON ?AUTO_1070 ?AUTO_1065 ) ( CLEAR ?AUTO_1073 ) ( ON ?AUTO_1071 ?AUTO_1070 ) ( CLEAR ?AUTO_1071 ) ( HOLDING ?AUTO_1074 ) ( CLEAR ?AUTO_1075 ) )
    :subtasks
    ( ( !STACK ?AUTO_1074 ?AUTO_1075 )
      ( MAKE-ON ?AUTO_1065 ?AUTO_1066 ) )
    :id ( 225 )
    :q-value ( 12 )
    :q-count ( 8 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1078 - BLOCK
      ?AUTO_1079 - BLOCK
    )
    :vars
    (
      ?AUTO_1085 - BLOCK
      ?AUTO_1080 - BLOCK
      ?AUTO_1087 - BLOCK
      ?AUTO_1084 - BLOCK
      ?AUTO_1086 - BLOCK
      ?AUTO_1081 - BLOCK
      ?AUTO_1083 - BLOCK
      ?AUTO_1090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1078 ) ( CLEAR ?AUTO_1085 ) ( ON ?AUTO_1080 ?AUTO_1079 ) ( CLEAR ?AUTO_1087 ) ( ON ?AUTO_1084 ?AUTO_1078 ) ( CLEAR ?AUTO_1086 ) ( ON ?AUTO_1081 ?AUTO_1084 ) ( CLEAR ?AUTO_1081 ) ( CLEAR ?AUTO_1080 ) ( ON ?AUTO_1083 ?AUTO_1090 ) ( CLEAR ?AUTO_1083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1083 ?AUTO_1090 )
      ( MAKE-ON ?AUTO_1078 ?AUTO_1079 ) )
    :id ( 226 )
    :q-value ( 12.6667 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1218 - BLOCK
      ?AUTO_1219 - BLOCK
    )
    :vars
    (
      ?AUTO_1223 - BLOCK
      ?AUTO_1221 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1218 ?AUTO_1223 ) ( CLEAR ?AUTO_1221 ) ( ON ?AUTO_1219 ?AUTO_1218 ) ( CLEAR ?AUTO_1219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1219 ?AUTO_1218 )
      ( MAKE-ON ?AUTO_1218 ?AUTO_1219 ) )
    :id ( 246 )
    :q-value ( 4 )
    :q-count ( 161 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1226 - BLOCK
      ?AUTO_1227 - BLOCK
    )
    :vars
    (
      ?AUTO_1229 - BLOCK
      ?AUTO_1228 - BLOCK
      ?AUTO_1232 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1226 ?AUTO_1229 ) ( CLEAR ?AUTO_1228 ) ( ON ?AUTO_1227 ?AUTO_1226 ) ( CLEAR ?AUTO_1227 ) ( HOLDING ?AUTO_1232 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1232 )
      ( MAKE-ON ?AUTO_1226 ?AUTO_1227 ) )
    :id ( 247 )
    :q-value ( 5 )
    :q-count ( 50 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1312 - BLOCK
      ?AUTO_1313 - BLOCK
    )
    :vars
    (
      ?AUTO_1318 - BLOCK
      ?AUTO_1317 - BLOCK
      ?AUTO_1316 - BLOCK
      ?AUTO_1319 - BLOCK
      ?AUTO_1320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1312 ) ( ON ?AUTO_1318 ?AUTO_1312 ) ( CLEAR ?AUTO_1318 ) ( CLEAR ?AUTO_1317 ) ( ON ?AUTO_1316 ?AUTO_1313 ) ( CLEAR ?AUTO_1316 ) ( HOLDING ?AUTO_1319 ) ( CLEAR ?AUTO_1320 ) )
    :subtasks
    ( ( !STACK ?AUTO_1319 ?AUTO_1320 )
      ( MAKE-ON ?AUTO_1312 ?AUTO_1313 ) )
    :id ( 257 )
    :q-value ( 7 )
    :q-count ( 82 )
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
      ?AUTO_1328 - BLOCK
      ?AUTO_1329 - BLOCK
      ?AUTO_1327 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1321 ) ( ON ?AUTO_1325 ?AUTO_1321 ) ( CLEAR ?AUTO_1325 ) ( CLEAR ?AUTO_1326 ) ( ON ?AUTO_1328 ?AUTO_1322 ) ( CLEAR ?AUTO_1329 ) ( ON ?AUTO_1327 ?AUTO_1328 ) ( CLEAR ?AUTO_1327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1327 ?AUTO_1328 )
      ( MAKE-ON ?AUTO_1321 ?AUTO_1322 ) )
    :id ( 258 )
    :q-value ( 8.35135 )
    :q-count ( 74 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1355 - BLOCK
    )
    :vars
    (
      ?AUTO_1357 - BLOCK
      ?AUTO_1358 - BLOCK
      ?AUTO_1359 - BLOCK
      ?AUTO_1360 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1355 ?AUTO_1357 ) ( CLEAR ?AUTO_1358 ) ( ON ?AUTO_1359 ?AUTO_1355 ) ( CLEAR ?AUTO_1359 ) ( HOLDING ?AUTO_1360 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1360 )
      ( MAKE-ON-TABLE ?AUTO_1355 ) )
    :id ( 263 )
    :q-value ( 5 )
    :q-count ( 279 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1391 - BLOCK
      ?AUTO_1392 - BLOCK
    )
    :vars
    (
      ?AUTO_1395 - BLOCK
      ?AUTO_1396 - BLOCK
      ?AUTO_1397 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1391 ?AUTO_1395 ) ( ON ?AUTO_1392 ?AUTO_1391 ) ( CLEAR ?AUTO_1392 ) ( HOLDING ?AUTO_1396 ) ( CLEAR ?AUTO_1397 ) )
    :subtasks
    ( ( !STACK ?AUTO_1396 ?AUTO_1397 )
      ( MAKE-ON ?AUTO_1391 ?AUTO_1392 ) )
    :id ( 268 )
    :q-value ( 5 )
    :q-count ( 77 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1481 - BLOCK
      ?AUTO_1482 - BLOCK
    )
    :vars
    (
      ?AUTO_1484 - BLOCK
      ?AUTO_1486 - BLOCK
      ?AUTO_1485 - BLOCK
      ?AUTO_1489 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1481 ?AUTO_1484 ) ( ON ?AUTO_1486 ?AUTO_1481 ) ( ON ?AUTO_1485 ?AUTO_1486 ) ( CLEAR ?AUTO_1485 ) ( HOLDING ?AUTO_1482 ) ( CLEAR ?AUTO_1489 ) )
    :subtasks
    ( ( !STACK ?AUTO_1482 ?AUTO_1489 )
      ( MAKE-ON ?AUTO_1481 ?AUTO_1482 ) )
    :id ( 275 )
    :q-value ( 7.40001 )
    :q-count ( 30 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1533 - BLOCK
      ?AUTO_1534 - BLOCK
    )
    :vars
    (
      ?AUTO_1536 - BLOCK
      ?AUTO_1538 - BLOCK
      ?AUTO_1539 - BLOCK
      ?AUTO_1541 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1533 ?AUTO_1536 ) ( ON ?AUTO_1538 ?AUTO_1534 ) ( CLEAR ?AUTO_1538 ) ( CLEAR ?AUTO_1533 ) ( ON ?AUTO_1539 ?AUTO_1541 ) ( CLEAR ?AUTO_1539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1539 ?AUTO_1541 )
      ( MAKE-ON ?AUTO_1533 ?AUTO_1534 ) )
    :id ( 280 )
    :q-value ( 8 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1542 - BLOCK
      ?AUTO_1543 - BLOCK
    )
    :vars
    (
      ?AUTO_1547 - BLOCK
      ?AUTO_1548 - BLOCK
      ?AUTO_1549 - BLOCK
      ?AUTO_1546 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1547 ?AUTO_1543 ) ( CLEAR ?AUTO_1547 ) ( ON ?AUTO_1548 ?AUTO_1549 ) ( CLEAR ?AUTO_1548 ) ( HOLDING ?AUTO_1542 ) ( CLEAR ?AUTO_1546 ) )
    :subtasks
    ( ( !STACK ?AUTO_1542 ?AUTO_1546 )
      ( MAKE-ON ?AUTO_1542 ?AUTO_1543 ) )
    :id ( 281 )
    :q-value ( 5.0348 )
    :q-count ( 115 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1591 - BLOCK
      ?AUTO_1592 - BLOCK
    )
    :vars
    (
      ?AUTO_1597 - BLOCK
      ?AUTO_1594 - BLOCK
      ?AUTO_1593 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1597 ) ( ON ?AUTO_1594 ?AUTO_1592 ) ( CLEAR ?AUTO_1593 ) ( ON ?AUTO_1591 ?AUTO_1594 ) ( CLEAR ?AUTO_1591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1591 ?AUTO_1594 )
      ( MAKE-ON ?AUTO_1591 ?AUTO_1592 ) )
    :id ( 287 )
    :q-value ( 6.02838 )
    :q-count ( 141 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1600 - BLOCK
      ?AUTO_1601 - BLOCK
    )
    :vars
    (
      ?AUTO_1605 - BLOCK
      ?AUTO_1603 - BLOCK
      ?AUTO_1602 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1605 ) ( ON ?AUTO_1603 ?AUTO_1601 ) ( ON ?AUTO_1600 ?AUTO_1603 ) ( CLEAR ?AUTO_1600 ) ( HOLDING ?AUTO_1602 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1602 )
      ( MAKE-ON ?AUTO_1600 ?AUTO_1601 ) )
    :id ( 288 )
    :q-value ( 7.09092 )
    :q-count ( 44 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1608 - BLOCK
      ?AUTO_1609 - BLOCK
    )
    :vars
    (
      ?AUTO_1614 - BLOCK
      ?AUTO_1612 - BLOCK
      ?AUTO_1610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1614 ) ( ON ?AUTO_1612 ?AUTO_1609 ) ( ON ?AUTO_1608 ?AUTO_1612 ) ( ON ?AUTO_1610 ?AUTO_1608 ) ( CLEAR ?AUTO_1610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1610 ?AUTO_1608 )
      ( MAKE-ON ?AUTO_1608 ?AUTO_1609 ) )
    :id ( 289 )
    :q-value ( 8.1316 )
    :q-count ( 76 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1617 - BLOCK
      ?AUTO_1618 - BLOCK
    )
    :vars
    (
      ?AUTO_1622 - BLOCK
      ?AUTO_1620 - BLOCK
      ?AUTO_1621 - BLOCK
      ?AUTO_1625 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1622 ?AUTO_1618 ) ( ON ?AUTO_1617 ?AUTO_1622 ) ( ON ?AUTO_1620 ?AUTO_1617 ) ( CLEAR ?AUTO_1620 ) ( HOLDING ?AUTO_1621 ) ( CLEAR ?AUTO_1625 ) )
    :subtasks
    ( ( !STACK ?AUTO_1621 ?AUTO_1625 )
      ( MAKE-ON ?AUTO_1617 ?AUTO_1618 ) )
    :id ( 290 )
    :q-value ( 9.25807 )
    :q-count ( 31 )
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
      ?AUTO_1668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1665 ) ( CLEAR ?AUTO_1665 ) ( CLEAR ?AUTO_1670 ) ( ON ?AUTO_1668 ?AUTO_1666 ) ( CLEAR ?AUTO_1668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1668 ?AUTO_1666 )
      ( MAKE-ON ?AUTO_1665 ?AUTO_1666 ) )
    :id ( 294 )
    :q-value ( 4 )
    :q-count ( 431 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1673 - BLOCK
      ?AUTO_1674 - BLOCK
    )
    :vars
    (
      ?AUTO_1675 - BLOCK
      ?AUTO_1676 - BLOCK
      ?AUTO_1679 - BLOCK
      ?AUTO_1680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1673 ) ( CLEAR ?AUTO_1673 ) ( CLEAR ?AUTO_1675 ) ( ON ?AUTO_1676 ?AUTO_1674 ) ( CLEAR ?AUTO_1676 ) ( HOLDING ?AUTO_1679 ) ( CLEAR ?AUTO_1680 ) )
    :subtasks
    ( ( !STACK ?AUTO_1679 ?AUTO_1680 )
      ( MAKE-ON ?AUTO_1673 ?AUTO_1674 ) )
    :id ( 295 )
    :q-value ( 5 )
    :q-count ( 183 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1687 - BLOCK
      ?AUTO_1688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1687 ) ( CLEAR ?AUTO_1687 ) ( HOLDING ?AUTO_1688 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1688 )
      ( MAKE-ON ?AUTO_1687 ?AUTO_1688 ) )
    :id ( 296 )
    :q-value ( 3 )
    :q-count ( 214 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1708 - BLOCK
      ?AUTO_1709 - BLOCK
    )
    :vars
    (
      ?AUTO_1713 - BLOCK
      ?AUTO_1714 - BLOCK
      ?AUTO_1710 - BLOCK
      ?AUTO_1715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1708 ) ( CLEAR ?AUTO_1713 ) ( ON ?AUTO_1714 ?AUTO_1709 ) ( CLEAR ?AUTO_1714 ) ( CLEAR ?AUTO_1710 ) ( ON ?AUTO_1715 ?AUTO_1708 ) ( CLEAR ?AUTO_1715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1715 ?AUTO_1708 )
      ( MAKE-ON ?AUTO_1708 ?AUTO_1709 ) )
    :id ( 297 )
    :q-value ( 6 )
    :q-count ( 100 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1731 - BLOCK
      ?AUTO_1732 - BLOCK
    )
    :vars
    (
      ?AUTO_1737 - BLOCK
      ?AUTO_1735 - BLOCK
      ?AUTO_1736 - BLOCK
      ?AUTO_1739 - BLOCK
      ?AUTO_1738 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1732 ) ( ON-TABLE ?AUTO_1731 ) ( ON ?AUTO_1737 ?AUTO_1731 ) ( CLEAR ?AUTO_1735 ) ( ON ?AUTO_1736 ?AUTO_1737 ) ( CLEAR ?AUTO_1739 ) ( ON ?AUTO_1738 ?AUTO_1736 ) ( CLEAR ?AUTO_1738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1738 ?AUTO_1736 )
      ( MAKE-ON ?AUTO_1731 ?AUTO_1732 ) )
    :id ( 299 )
    :q-value ( 8.25423 )
    :q-count ( 118 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1868 - BLOCK
      ?AUTO_1869 - BLOCK
    )
    :vars
    (
      ?AUTO_1872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1868 ) ( CLEAR ?AUTO_1872 ) ( ON ?AUTO_1869 ?AUTO_1868 ) ( CLEAR ?AUTO_1869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1869 ?AUTO_1868 )
      ( MAKE-ON ?AUTO_1868 ?AUTO_1869 ) )
    :id ( 307 )
    :q-value ( 4 )
    :q-count ( 136 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1875 - BLOCK
      ?AUTO_1876 - BLOCK
    )
    :vars
    (
      ?AUTO_1879 - BLOCK
      ?AUTO_1880 - BLOCK
      ?AUTO_1881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1875 ) ( CLEAR ?AUTO_1879 ) ( ON ?AUTO_1876 ?AUTO_1875 ) ( CLEAR ?AUTO_1876 ) ( HOLDING ?AUTO_1880 ) ( CLEAR ?AUTO_1881 ) )
    :subtasks
    ( ( !STACK ?AUTO_1880 ?AUTO_1881 )
      ( MAKE-ON ?AUTO_1875 ?AUTO_1876 ) )
    :id ( 308 )
    :q-value ( 5 )
    :q-count ( 78 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1906 - BLOCK
      ?AUTO_1907 - BLOCK
    )
    :vars
    (
      ?AUTO_1911 - BLOCK
      ?AUTO_1908 - BLOCK
      ?AUTO_1912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1906 ) ( CLEAR ?AUTO_1911 ) ( ON ?AUTO_1908 ?AUTO_1906 ) ( CLEAR ?AUTO_1912 ) ( ON ?AUTO_1907 ?AUTO_1908 ) ( CLEAR ?AUTO_1907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1907 ?AUTO_1908 )
      ( MAKE-ON ?AUTO_1906 ?AUTO_1907 ) )
    :id ( 311 )
    :q-value ( 6.10529 )
    :q-count ( 76 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1915 - BLOCK
      ?AUTO_1916 - BLOCK
    )
    :vars
    (
      ?AUTO_1921 - BLOCK
      ?AUTO_1917 - BLOCK
      ?AUTO_1918 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1915 ) ( CLEAR ?AUTO_1921 ) ( ON ?AUTO_1917 ?AUTO_1915 ) ( ON ?AUTO_1916 ?AUTO_1917 ) ( CLEAR ?AUTO_1916 ) ( HOLDING ?AUTO_1918 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1918 )
      ( MAKE-ON ?AUTO_1915 ?AUTO_1916 ) )
    :id ( 312 )
    :q-value ( 7.16666 )
    :q-count ( 24 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1923 - BLOCK
      ?AUTO_1924 - BLOCK
    )
    :vars
    (
      ?AUTO_1928 - BLOCK
      ?AUTO_1925 - BLOCK
      ?AUTO_1926 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1923 ) ( CLEAR ?AUTO_1928 ) ( ON ?AUTO_1925 ?AUTO_1923 ) ( ON ?AUTO_1924 ?AUTO_1925 ) ( ON ?AUTO_1926 ?AUTO_1924 ) ( CLEAR ?AUTO_1926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1926 ?AUTO_1924 )
      ( MAKE-ON ?AUTO_1923 ?AUTO_1924 ) )
    :id ( 313 )
    :q-value ( 8.14999 )
    :q-count ( 40 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1932 - BLOCK
      ?AUTO_1933 - BLOCK
    )
    :vars
    (
      ?AUTO_1936 - BLOCK
      ?AUTO_1937 - BLOCK
      ?AUTO_1938 - BLOCK
      ?AUTO_1939 - BLOCK
      ?AUTO_1940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1932 ) ( CLEAR ?AUTO_1936 ) ( ON ?AUTO_1937 ?AUTO_1932 ) ( ON ?AUTO_1933 ?AUTO_1937 ) ( ON ?AUTO_1938 ?AUTO_1933 ) ( CLEAR ?AUTO_1938 ) ( HOLDING ?AUTO_1939 ) ( CLEAR ?AUTO_1940 ) )
    :subtasks
    ( ( !STACK ?AUTO_1939 ?AUTO_1940 )
      ( MAKE-ON ?AUTO_1932 ?AUTO_1933 ) )
    :id ( 314 )
    :q-value ( 9 )
    :q-count ( 16 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2023 - BLOCK
    )
    :vars
    (
      ?AUTO_2027 - BLOCK
      ?AUTO_2024 - BLOCK
      ?AUTO_2026 - BLOCK
      ?AUTO_2028 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2023 ?AUTO_2027 ) ( ON ?AUTO_2024 ?AUTO_2023 ) ( ON ?AUTO_2026 ?AUTO_2024 ) ( CLEAR ?AUTO_2026 ) ( HOLDING ?AUTO_2028 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2028 )
      ( MAKE-ON-TABLE ?AUTO_2023 ) )
    :id ( 333 )
    :q-value ( 7 )
    :q-count ( 125 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2029 - BLOCK
    )
    :vars
    (
      ?AUTO_2032 - BLOCK
      ?AUTO_2030 - BLOCK
      ?AUTO_2033 - BLOCK
      ?AUTO_2034 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2029 ?AUTO_2032 ) ( ON ?AUTO_2030 ?AUTO_2029 ) ( ON ?AUTO_2033 ?AUTO_2030 ) ( ON ?AUTO_2034 ?AUTO_2033 ) ( CLEAR ?AUTO_2034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2034 ?AUTO_2033 )
      ( MAKE-ON-TABLE ?AUTO_2029 ) )
    :id ( 334 )
    :q-value ( 8 )
    :q-count ( 106 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2048 - BLOCK
      ?AUTO_2049 - BLOCK
    )
    :vars
    (
      ?AUTO_2052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2049 ) ( ON-TABLE ?AUTO_2048 ) ( CLEAR ?AUTO_2048 ) ( HOLDING ?AUTO_2052 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2052 )
      ( MAKE-ON ?AUTO_2048 ?AUTO_2049 ) )
    :id ( 337 )
    :q-value ( 3 )
    :q-count ( 369 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2060 - BLOCK
      ?AUTO_2061 - BLOCK
    )
    :vars
    (
      ?AUTO_2062 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2062 ?AUTO_2061 ) ( CLEAR ?AUTO_2062 ) ( HOLDING ?AUTO_2060 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2060 )
      ( MAKE-ON ?AUTO_2060 ?AUTO_2061 ) )
    :id ( 339 )
    :q-value ( 5.09414 )
    :q-count ( 85 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2087 - BLOCK
      ?AUTO_2088 - BLOCK
    )
    :vars
    (
      ?AUTO_2089 - BLOCK
      ?AUTO_2091 - BLOCK
      ?AUTO_2093 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2089 ?AUTO_2088 ) ( ON ?AUTO_2087 ?AUTO_2089 ) ( ON ?AUTO_2091 ?AUTO_2087 ) ( CLEAR ?AUTO_2091 ) ( HOLDING ?AUTO_2093 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2093 )
      ( MAKE-ON ?AUTO_2087 ?AUTO_2088 ) )
    :id ( 343 )
    :q-value ( 9 )
    :q-count ( 25 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2094 - BLOCK
      ?AUTO_2095 - BLOCK
    )
    :vars
    (
      ?AUTO_2096 - BLOCK
      ?AUTO_2097 - BLOCK
      ?AUTO_2098 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2096 ?AUTO_2095 ) ( ON ?AUTO_2094 ?AUTO_2096 ) ( ON ?AUTO_2097 ?AUTO_2094 ) ( ON ?AUTO_2098 ?AUTO_2097 ) ( CLEAR ?AUTO_2098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2098 ?AUTO_2097 )
      ( MAKE-ON ?AUTO_2094 ?AUTO_2095 ) )
    :id ( 344 )
    :q-value ( 10 )
    :q-count ( 20 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2175 - BLOCK
      ?AUTO_2176 - BLOCK
    )
    :vars
    (
      ?AUTO_2179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2175 ) ( ON ?AUTO_2176 ?AUTO_2175 ) ( CLEAR ?AUTO_2176 ) ( HOLDING ?AUTO_2179 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2179 )
      ( MAKE-ON ?AUTO_2175 ?AUTO_2176 ) )
    :id ( 359 )
    :q-value ( 5 )
    :q-count ( 43 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2181 - BLOCK
      ?AUTO_2182 - BLOCK
    )
    :vars
    (
      ?AUTO_2183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2181 ) ( ON ?AUTO_2182 ?AUTO_2181 ) ( ON ?AUTO_2183 ?AUTO_2182 ) ( CLEAR ?AUTO_2183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2183 ?AUTO_2182 )
      ( MAKE-ON ?AUTO_2181 ?AUTO_2182 ) )
    :id ( 360 )
    :q-value ( 6 )
    :q-count ( 78 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2188 - BLOCK
      ?AUTO_2189 - BLOCK
    )
    :vars
    (
      ?AUTO_2190 - BLOCK
      ?AUTO_2193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2188 ) ( ON ?AUTO_2189 ?AUTO_2188 ) ( ON ?AUTO_2190 ?AUTO_2189 ) ( CLEAR ?AUTO_2190 ) ( HOLDING ?AUTO_2193 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2193 )
      ( MAKE-ON ?AUTO_2188 ?AUTO_2189 ) )
    :id ( 361 )
    :q-value ( 7 )
    :q-count ( 28 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2295 - BLOCK
      ?AUTO_2296 - BLOCK
    )
    :vars
    (
      ?AUTO_2298 - BLOCK
      ?AUTO_2300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2296 ) ( ON-TABLE ?AUTO_2295 ) ( ON ?AUTO_2298 ?AUTO_2295 ) ( CLEAR ?AUTO_2298 ) ( HOLDING ?AUTO_2300 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2300 )
      ( MAKE-ON ?AUTO_2295 ?AUTO_2296 ) )
    :id ( 383 )
    :q-value ( 5 )
    :q-count ( 206 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2309 - BLOCK
      ?AUTO_2310 - BLOCK
    )
    :vars
    (
      ?AUTO_2312 - BLOCK
      ?AUTO_2313 - BLOCK
      ?AUTO_2315 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2310 ) ( ON-TABLE ?AUTO_2309 ) ( ON ?AUTO_2312 ?AUTO_2309 ) ( ON ?AUTO_2313 ?AUTO_2312 ) ( CLEAR ?AUTO_2313 ) ( HOLDING ?AUTO_2315 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2315 )
      ( MAKE-ON ?AUTO_2309 ?AUTO_2310 ) )
    :id ( 385 )
    :q-value ( 7.15095 )
    :q-count ( 106 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2325 - BLOCK
      ?AUTO_2326 - BLOCK
    )
    :vars
    (
      ?AUTO_2331 - BLOCK
      ?AUTO_2328 - BLOCK
      ?AUTO_2327 - BLOCK
      ?AUTO_2332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2326 ) ( ON-TABLE ?AUTO_2325 ) ( ON ?AUTO_2331 ?AUTO_2325 ) ( ON ?AUTO_2328 ?AUTO_2331 ) ( ON ?AUTO_2327 ?AUTO_2328 ) ( CLEAR ?AUTO_2327 ) ( HOLDING ?AUTO_2332 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2332 )
      ( MAKE-ON ?AUTO_2325 ?AUTO_2326 ) )
    :id ( 387 )
    :q-value ( 9.39129 )
    :q-count ( 46 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2333 - BLOCK
      ?AUTO_2334 - BLOCK
    )
    :vars
    (
      ?AUTO_2339 - BLOCK
      ?AUTO_2336 - BLOCK
      ?AUTO_2337 - BLOCK
      ?AUTO_2340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2333 ) ( ON ?AUTO_2339 ?AUTO_2333 ) ( ON ?AUTO_2336 ?AUTO_2339 ) ( ON ?AUTO_2337 ?AUTO_2336 ) ( CLEAR ?AUTO_2337 ) ( ON ?AUTO_2340 ?AUTO_2334 ) ( CLEAR ?AUTO_2340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2340 ?AUTO_2334 )
      ( MAKE-ON ?AUTO_2333 ?AUTO_2334 ) )
    :id ( 388 )
    :q-value ( 10.6669 )
    :q-count ( 21 )
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
      ?AUTO_2418 - BLOCK
      ?AUTO_2416 - BLOCK
      ?AUTO_2415 - BLOCK
      ?AUTO_2420 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2412 ?AUTO_2414 ) ( CLEAR ?AUTO_2412 ) ( ON ?AUTO_2418 ?AUTO_2413 ) ( ON ?AUTO_2416 ?AUTO_2418 ) ( ON ?AUTO_2415 ?AUTO_2416 ) ( CLEAR ?AUTO_2415 ) ( HOLDING ?AUTO_2420 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2420 )
      ( MAKE-ON ?AUTO_2412 ?AUTO_2413 ) )
    :id ( 398 )
    :q-value ( 9.4878 )
    :q-count ( 41 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2534 - BLOCK
      ?AUTO_2535 - BLOCK
    )
    :vars
    (
      ?AUTO_2537 - BLOCK
      ?AUTO_2540 - BLOCK
      ?AUTO_2539 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2537 ?AUTO_2535 ) ( ON ?AUTO_2540 ?AUTO_2537 ) ( CLEAR ?AUTO_2539 ) ( ON ?AUTO_2534 ?AUTO_2540 ) ( CLEAR ?AUTO_2534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2534 ?AUTO_2540 )
      ( MAKE-ON ?AUTO_2534 ?AUTO_2535 ) )
    :id ( 418 )
    :q-value ( 8.59259 )
    :q-count ( 54 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2686 - BLOCK
      ?AUTO_2687 - BLOCK
    )
    :vars
    (
      ?AUTO_2691 - BLOCK
      ?AUTO_2690 - BLOCK
      ?AUTO_2693 - BLOCK
      ?AUTO_2689 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2686 ?AUTO_2691 ) ( ON ?AUTO_2690 ?AUTO_2687 ) ( CLEAR ?AUTO_2690 ) ( CLEAR ?AUTO_2693 ) ( ON ?AUTO_2689 ?AUTO_2686 ) ( CLEAR ?AUTO_2689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2689 ?AUTO_2686 )
      ( MAKE-ON ?AUTO_2686 ?AUTO_2687 ) )
    :id ( 434 )
    :q-value ( 6.02107 )
    :q-count ( 95 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2696 - BLOCK
      ?AUTO_2697 - BLOCK
    )
    :vars
    (
      ?AUTO_2698 - BLOCK
      ?AUTO_2703 - BLOCK
      ?AUTO_2699 - BLOCK
      ?AUTO_2700 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2696 ?AUTO_2698 ) ( CLEAR ?AUTO_2703 ) ( ON ?AUTO_2699 ?AUTO_2696 ) ( CLEAR ?AUTO_2699 ) ( HOLDING ?AUTO_2700 ) ( CLEAR ?AUTO_2697 ) )
    :subtasks
    ( ( !STACK ?AUTO_2700 ?AUTO_2697 )
      ( MAKE-ON ?AUTO_2696 ?AUTO_2697 ) )
    :id ( 435 )
    :q-value ( 7 )
    :q-count ( 21 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2716 - BLOCK
      ?AUTO_2717 - BLOCK
    )
    :vars
    (
      ?AUTO_2720 - BLOCK
      ?AUTO_2718 - BLOCK
      ?AUTO_2723 - BLOCK
      ?AUTO_2722 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2716 ?AUTO_2720 ) ( ON ?AUTO_2718 ?AUTO_2716 ) ( CLEAR ?AUTO_2717 ) ( ON ?AUTO_2723 ?AUTO_2718 ) ( CLEAR ?AUTO_2723 ) ( HOLDING ?AUTO_2722 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2722 )
      ( MAKE-ON ?AUTO_2716 ?AUTO_2717 ) )
    :id ( 437 )
    :q-value ( 7.14814 )
    :q-count ( 54 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2725 - BLOCK
      ?AUTO_2726 - BLOCK
    )
    :vars
    (
      ?AUTO_2731 - BLOCK
      ?AUTO_2728 - BLOCK
      ?AUTO_2729 - BLOCK
      ?AUTO_2727 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2725 ?AUTO_2731 ) ( ON ?AUTO_2728 ?AUTO_2725 ) ( ON ?AUTO_2729 ?AUTO_2728 ) ( CLEAR ?AUTO_2729 ) ( ON ?AUTO_2727 ?AUTO_2726 ) ( CLEAR ?AUTO_2727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2727 ?AUTO_2726 )
      ( MAKE-ON ?AUTO_2725 ?AUTO_2726 ) )
    :id ( 438 )
    :q-value ( 8.49998 )
    :q-count ( 36 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2735 - BLOCK
      ?AUTO_2736 - BLOCK
    )
    :vars
    (
      ?AUTO_2742 - BLOCK
      ?AUTO_2738 - BLOCK
      ?AUTO_2737 - BLOCK
      ?AUTO_2740 - BLOCK
      ?AUTO_2743 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2735 ?AUTO_2742 ) ( ON ?AUTO_2738 ?AUTO_2735 ) ( ON ?AUTO_2737 ?AUTO_2738 ) ( CLEAR ?AUTO_2737 ) ( ON ?AUTO_2740 ?AUTO_2736 ) ( CLEAR ?AUTO_2740 ) ( HOLDING ?AUTO_2743 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2743 )
      ( MAKE-ON ?AUTO_2735 ?AUTO_2736 ) )
    :id ( 439 )
    :q-value ( 9.41667 )
    :q-count ( 24 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2744 - BLOCK
      ?AUTO_2745 - BLOCK
    )
    :vars
    (
      ?AUTO_2750 - BLOCK
      ?AUTO_2749 - BLOCK
      ?AUTO_2747 - BLOCK
      ?AUTO_2751 - BLOCK
      ?AUTO_2752 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2744 ?AUTO_2750 ) ( ON ?AUTO_2749 ?AUTO_2744 ) ( ON ?AUTO_2747 ?AUTO_2749 ) ( CLEAR ?AUTO_2747 ) ( ON ?AUTO_2751 ?AUTO_2745 ) ( ON ?AUTO_2752 ?AUTO_2751 ) ( CLEAR ?AUTO_2752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2752 ?AUTO_2751 )
      ( MAKE-ON ?AUTO_2744 ?AUTO_2745 ) )
    :id ( 440 )
    :q-value ( 10.762 )
    :q-count ( 21 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2755 - BLOCK
      ?AUTO_2756 - BLOCK
    )
    :vars
    (
      ?AUTO_2762 - BLOCK
      ?AUTO_2761 - BLOCK
      ?AUTO_2760 - BLOCK
      ?AUTO_2757 - BLOCK
      ?AUTO_2758 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2755 ?AUTO_2762 ) ( ON ?AUTO_2761 ?AUTO_2755 ) ( ON ?AUTO_2760 ?AUTO_2756 ) ( ON ?AUTO_2757 ?AUTO_2760 ) ( CLEAR ?AUTO_2757 ) ( HOLDING ?AUTO_2758 ) ( CLEAR ?AUTO_2761 ) )
    :subtasks
    ( ( !STACK ?AUTO_2758 ?AUTO_2761 )
      ( MAKE-ON ?AUTO_2755 ?AUTO_2756 ) )
    :id ( 441 )
    :q-value ( 12.3333 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2766 - BLOCK
      ?AUTO_2767 - BLOCK
    )
    :vars
    (
      ?AUTO_2773 - BLOCK
      ?AUTO_2774 - BLOCK
      ?AUTO_2768 - BLOCK
      ?AUTO_2772 - BLOCK
      ?AUTO_2771 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2766 ?AUTO_2773 ) ( ON ?AUTO_2774 ?AUTO_2766 ) ( ON ?AUTO_2768 ?AUTO_2767 ) ( ON ?AUTO_2772 ?AUTO_2768 ) ( CLEAR ?AUTO_2774 ) ( ON ?AUTO_2771 ?AUTO_2772 ) ( CLEAR ?AUTO_2771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2771 ?AUTO_2772 )
      ( MAKE-ON ?AUTO_2766 ?AUTO_2767 ) )
    :id ( 442 )
    :q-value ( 10.5927 )
    :q-count ( 27 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2829 - BLOCK
      ?AUTO_2830 - BLOCK
    )
    :vars
    (
      ?AUTO_2836 - BLOCK
      ?AUTO_2834 - BLOCK
      ?AUTO_2837 - BLOCK
      ?AUTO_2835 - BLOCK
      ?AUTO_2833 - BLOCK
      ?AUTO_2838 - BLOCK
      ?AUTO_2839 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2830 ) ( ON ?AUTO_2829 ?AUTO_2836 ) ( CLEAR ?AUTO_2834 ) ( ON ?AUTO_2837 ?AUTO_2829 ) ( CLEAR ?AUTO_2835 ) ( ON ?AUTO_2833 ?AUTO_2837 ) ( CLEAR ?AUTO_2833 ) ( HOLDING ?AUTO_2838 ) ( CLEAR ?AUTO_2839 ) )
    :subtasks
    ( ( !STACK ?AUTO_2838 ?AUTO_2839 )
      ( MAKE-ON ?AUTO_2829 ?AUTO_2830 ) )
    :id ( 449 )
    :q-value ( 7.22641 )
    :q-count ( 53 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2840 - BLOCK
      ?AUTO_2841 - BLOCK
    )
    :vars
    (
      ?AUTO_2849 - BLOCK
      ?AUTO_2846 - BLOCK
      ?AUTO_2848 - BLOCK
      ?AUTO_2847 - BLOCK
      ?AUTO_2843 - BLOCK
      ?AUTO_2850 - BLOCK
      ?AUTO_2842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2841 ) ( ON ?AUTO_2840 ?AUTO_2849 ) ( CLEAR ?AUTO_2846 ) ( ON ?AUTO_2848 ?AUTO_2840 ) ( CLEAR ?AUTO_2847 ) ( ON ?AUTO_2843 ?AUTO_2848 ) ( CLEAR ?AUTO_2850 ) ( ON ?AUTO_2842 ?AUTO_2843 ) ( CLEAR ?AUTO_2842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2842 ?AUTO_2843 )
      ( MAKE-ON ?AUTO_2840 ?AUTO_2841 ) )
    :id ( 450 )
    :q-value ( 8.14633 )
    :q-count ( 41 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2853 - BLOCK
      ?AUTO_2854 - BLOCK
    )
    :vars
    (
      ?AUTO_2856 - BLOCK
      ?AUTO_2861 - BLOCK
      ?AUTO_2857 - BLOCK
      ?AUTO_2863 - BLOCK
      ?AUTO_2858 - BLOCK
      ?AUTO_2862 - BLOCK
      ?AUTO_2855 - BLOCK
      ?AUTO_2864 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2854 ) ( ON ?AUTO_2853 ?AUTO_2856 ) ( CLEAR ?AUTO_2861 ) ( ON ?AUTO_2857 ?AUTO_2853 ) ( CLEAR ?AUTO_2863 ) ( ON ?AUTO_2858 ?AUTO_2857 ) ( CLEAR ?AUTO_2862 ) ( ON ?AUTO_2855 ?AUTO_2858 ) ( CLEAR ?AUTO_2855 ) ( HOLDING ?AUTO_2864 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2864 )
      ( MAKE-ON ?AUTO_2853 ?AUTO_2854 ) )
    :id ( 451 )
    :q-value ( 9.33334 )
    :q-count ( 12 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2867 - BLOCK
      ?AUTO_2868 - BLOCK
    )
    :vars
    (
      ?AUTO_2874 - BLOCK
      ?AUTO_2875 - BLOCK
      ?AUTO_2871 - BLOCK
      ?AUTO_2877 - BLOCK
      ?AUTO_2870 - BLOCK
      ?AUTO_2869 - BLOCK
      ?AUTO_2872 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2867 ?AUTO_2874 ) ( CLEAR ?AUTO_2875 ) ( ON ?AUTO_2871 ?AUTO_2867 ) ( CLEAR ?AUTO_2877 ) ( ON ?AUTO_2870 ?AUTO_2871 ) ( CLEAR ?AUTO_2869 ) ( ON ?AUTO_2872 ?AUTO_2870 ) ( CLEAR ?AUTO_2872 ) ( HOLDING ?AUTO_2868 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2868 )
      ( MAKE-ON ?AUTO_2867 ?AUTO_2868 ) )
    :id ( 452 )
    :q-value ( 9 )
    :q-count ( 15 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3156 - BLOCK
      ?AUTO_3157 - BLOCK
    )
    :vars
    (
      ?AUTO_3164 - BLOCK
      ?AUTO_3165 - BLOCK
      ?AUTO_3163 - BLOCK
      ?AUTO_3161 - BLOCK
      ?AUTO_3162 - BLOCK
      ?AUTO_3159 - BLOCK
      ?AUTO_3167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3156 ) ( CLEAR ?AUTO_3164 ) ( ON ?AUTO_3165 ?AUTO_3156 ) ( CLEAR ?AUTO_3163 ) ( ON ?AUTO_3161 ?AUTO_3165 ) ( CLEAR ?AUTO_3162 ) ( ON ?AUTO_3159 ?AUTO_3161 ) ( CLEAR ?AUTO_3159 ) ( HOLDING ?AUTO_3157 ) ( CLEAR ?AUTO_3167 ) )
    :subtasks
    ( ( !STACK ?AUTO_3157 ?AUTO_3167 )
      ( MAKE-ON ?AUTO_3156 ?AUTO_3157 ) )
    :id ( 465 )
    :q-value ( 9.36364 )
    :q-count ( 22 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3168 - BLOCK
      ?AUTO_3169 - BLOCK
    )
    :vars
    (
      ?AUTO_3174 - BLOCK
      ?AUTO_3172 - BLOCK
      ?AUTO_3171 - BLOCK
      ?AUTO_3178 - BLOCK
      ?AUTO_3170 - BLOCK
      ?AUTO_3173 - BLOCK
      ?AUTO_3175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3168 ) ( CLEAR ?AUTO_3174 ) ( ON ?AUTO_3172 ?AUTO_3168 ) ( CLEAR ?AUTO_3171 ) ( ON ?AUTO_3178 ?AUTO_3172 ) ( CLEAR ?AUTO_3170 ) ( ON ?AUTO_3173 ?AUTO_3178 ) ( CLEAR ?AUTO_3175 ) ( ON ?AUTO_3169 ?AUTO_3173 ) ( CLEAR ?AUTO_3169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3169 ?AUTO_3173 )
      ( MAKE-ON ?AUTO_3168 ?AUTO_3169 ) )
    :id ( 466 )
    :q-value ( 10.25 )
    :q-count ( 8 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3181 - BLOCK
      ?AUTO_3182 - BLOCK
    )
    :vars
    (
      ?AUTO_3185 - BLOCK
      ?AUTO_3189 - BLOCK
      ?AUTO_3184 - BLOCK
      ?AUTO_3187 - BLOCK
      ?AUTO_3188 - BLOCK
      ?AUTO_3186 - BLOCK
      ?AUTO_3183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3181 ) ( CLEAR ?AUTO_3185 ) ( ON ?AUTO_3189 ?AUTO_3181 ) ( CLEAR ?AUTO_3184 ) ( ON ?AUTO_3187 ?AUTO_3189 ) ( ON ?AUTO_3188 ?AUTO_3187 ) ( CLEAR ?AUTO_3186 ) ( ON ?AUTO_3182 ?AUTO_3188 ) ( CLEAR ?AUTO_3182 ) ( HOLDING ?AUTO_3183 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3183 )
      ( MAKE-ON ?AUTO_3181 ?AUTO_3182 ) )
    :id ( 467 )
    :q-value ( 11 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3379 - BLOCK
      ?AUTO_3380 - BLOCK
    )
    :vars
    (
      ?AUTO_3382 - BLOCK
      ?AUTO_3386 - BLOCK
      ?AUTO_3385 - BLOCK
      ?AUTO_3383 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3379 ?AUTO_3382 ) ( CLEAR ?AUTO_3386 ) ( ON ?AUTO_3385 ?AUTO_3379 ) ( CLEAR ?AUTO_3383 ) ( ON ?AUTO_3380 ?AUTO_3385 ) ( CLEAR ?AUTO_3380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3380 ?AUTO_3385 )
      ( MAKE-ON ?AUTO_3379 ?AUTO_3380 ) )
    :id ( 495 )
    :q-value ( 6.05131 )
    :q-count ( 78 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3389 - BLOCK
      ?AUTO_3390 - BLOCK
    )
    :vars
    (
      ?AUTO_3395 - BLOCK
      ?AUTO_3392 - BLOCK
      ?AUTO_3394 - BLOCK
      ?AUTO_3391 - BLOCK
      ?AUTO_3397 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3389 ?AUTO_3395 ) ( CLEAR ?AUTO_3392 ) ( ON ?AUTO_3394 ?AUTO_3389 ) ( CLEAR ?AUTO_3391 ) ( ON ?AUTO_3390 ?AUTO_3394 ) ( CLEAR ?AUTO_3390 ) ( HOLDING ?AUTO_3397 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3397 )
      ( MAKE-ON ?AUTO_3389 ?AUTO_3390 ) )
    :id ( 496 )
    :q-value ( 7 )
    :q-count ( 26 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3398 - BLOCK
      ?AUTO_3399 - BLOCK
    )
    :vars
    (
      ?AUTO_3405 - BLOCK
      ?AUTO_3402 - BLOCK
      ?AUTO_3401 - BLOCK
      ?AUTO_3400 - BLOCK
      ?AUTO_3406 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3398 ?AUTO_3405 ) ( CLEAR ?AUTO_3402 ) ( ON ?AUTO_3401 ?AUTO_3398 ) ( CLEAR ?AUTO_3400 ) ( ON ?AUTO_3399 ?AUTO_3401 ) ( ON ?AUTO_3406 ?AUTO_3399 ) ( CLEAR ?AUTO_3406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3406 ?AUTO_3399 )
      ( MAKE-ON ?AUTO_3398 ?AUTO_3399 ) )
    :id ( 497 )
    :q-value ( 8 )
    :q-count ( 25 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3409 - BLOCK
      ?AUTO_3410 - BLOCK
    )
    :vars
    (
      ?AUTO_3411 - BLOCK
      ?AUTO_3416 - BLOCK
      ?AUTO_3415 - BLOCK
      ?AUTO_3414 - BLOCK
      ?AUTO_3417 - BLOCK
      ?AUTO_3418 - BLOCK
      ?AUTO_3419 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3409 ?AUTO_3411 ) ( CLEAR ?AUTO_3416 ) ( ON ?AUTO_3415 ?AUTO_3409 ) ( CLEAR ?AUTO_3414 ) ( ON ?AUTO_3410 ?AUTO_3415 ) ( ON ?AUTO_3417 ?AUTO_3410 ) ( CLEAR ?AUTO_3417 ) ( HOLDING ?AUTO_3418 ) ( CLEAR ?AUTO_3419 ) )
    :subtasks
    ( ( !STACK ?AUTO_3418 ?AUTO_3419 )
      ( MAKE-ON ?AUTO_3409 ?AUTO_3410 ) )
    :id ( 498 )
    :q-value ( 9 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3463 - BLOCK
    )
    :vars
    (
      ?AUTO_3466 - BLOCK
      ?AUTO_3468 - BLOCK
      ?AUTO_3464 - BLOCK
      ?AUTO_3465 - BLOCK
      ?AUTO_3469 - BLOCK
      ?AUTO_3470 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3463 ?AUTO_3466 ) ( CLEAR ?AUTO_3468 ) ( ON ?AUTO_3464 ?AUTO_3463 ) ( ON ?AUTO_3465 ?AUTO_3464 ) ( CLEAR ?AUTO_3465 ) ( HOLDING ?AUTO_3469 ) ( CLEAR ?AUTO_3470 ) )
    :subtasks
    ( ( !STACK ?AUTO_3469 ?AUTO_3470 )
      ( MAKE-ON-TABLE ?AUTO_3463 ) )
    :id ( 505 )
    :q-value ( 7 )
    :q-count ( 115 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3529 - BLOCK
      ?AUTO_3530 - BLOCK
    )
    :vars
    (
      ?AUTO_3531 - BLOCK
      ?AUTO_3534 - BLOCK
      ?AUTO_3535 - BLOCK
      ?AUTO_3536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3531 ) ( ON ?AUTO_3534 ?AUTO_3530 ) ( ON ?AUTO_3529 ?AUTO_3534 ) ( CLEAR ?AUTO_3529 ) ( HOLDING ?AUTO_3535 ) ( CLEAR ?AUTO_3536 ) )
    :subtasks
    ( ( !STACK ?AUTO_3535 ?AUTO_3536 )
      ( MAKE-ON ?AUTO_3529 ?AUTO_3530 ) )
    :id ( 513 )
    :q-value ( 7.05002 )
    :q-count ( 80 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3639 - BLOCK
      ?AUTO_3640 - BLOCK
    )
    :vars
    (
      ?AUTO_3648 - BLOCK
      ?AUTO_3641 - BLOCK
      ?AUTO_3643 - BLOCK
      ?AUTO_3642 - BLOCK
      ?AUTO_3646 - BLOCK
      ?AUTO_3645 - BLOCK
      ?AUTO_3649 - BLOCK
      ?AUTO_3650 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3639 ?AUTO_3648 ) ( CLEAR ?AUTO_3639 ) ( CLEAR ?AUTO_3641 ) ( ON ?AUTO_3643 ?AUTO_3640 ) ( CLEAR ?AUTO_3642 ) ( ON ?AUTO_3646 ?AUTO_3643 ) ( ON ?AUTO_3645 ?AUTO_3646 ) ( CLEAR ?AUTO_3645 ) ( HOLDING ?AUTO_3649 ) ( CLEAR ?AUTO_3650 ) )
    :subtasks
    ( ( !STACK ?AUTO_3649 ?AUTO_3650 )
      ( MAKE-ON ?AUTO_3639 ?AUTO_3640 ) )
    :id ( 524 )
    :q-value ( 10.0769 )
    :q-count ( 13 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3714 - BLOCK
      ?AUTO_3715 - BLOCK
    )
    :vars
    (
      ?AUTO_3720 - BLOCK
      ?AUTO_3721 - BLOCK
      ?AUTO_3718 - BLOCK
      ?AUTO_3717 - BLOCK
      ?AUTO_3723 - BLOCK
      ?AUTO_3722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3714 ) ( CLEAR ?AUTO_3720 ) ( ON ?AUTO_3721 ?AUTO_3714 ) ( CLEAR ?AUTO_3718 ) ( ON ?AUTO_3717 ?AUTO_3721 ) ( CLEAR ?AUTO_3717 ) ( CLEAR ?AUTO_3723 ) ( ON ?AUTO_3722 ?AUTO_3715 ) ( CLEAR ?AUTO_3722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3722 ?AUTO_3715 )
      ( MAKE-ON ?AUTO_3714 ?AUTO_3715 ) )
    :id ( 532 )
    :q-value ( 8.1613 )
    :q-count ( 62 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3726 - BLOCK
      ?AUTO_3727 - BLOCK
    )
    :vars
    (
      ?AUTO_3731 - BLOCK
      ?AUTO_3734 - BLOCK
      ?AUTO_3728 - BLOCK
      ?AUTO_3733 - BLOCK
      ?AUTO_3732 - BLOCK
      ?AUTO_3730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3726 ) ( CLEAR ?AUTO_3731 ) ( ON ?AUTO_3734 ?AUTO_3726 ) ( CLEAR ?AUTO_3728 ) ( CLEAR ?AUTO_3733 ) ( ON ?AUTO_3732 ?AUTO_3727 ) ( CLEAR ?AUTO_3732 ) ( HOLDING ?AUTO_3730 ) ( CLEAR ?AUTO_3734 ) )
    :subtasks
    ( ( !STACK ?AUTO_3730 ?AUTO_3734 )
      ( MAKE-ON ?AUTO_3726 ?AUTO_3727 ) )
    :id ( 533 )
    :q-value ( 9.28572 )
    :q-count ( 14 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3762 - BLOCK
      ?AUTO_3763 - BLOCK
    )
    :vars
    (
      ?AUTO_3764 - BLOCK
      ?AUTO_3770 - BLOCK
      ?AUTO_3771 - BLOCK
      ?AUTO_3765 - BLOCK
      ?AUTO_3767 - BLOCK
      ?AUTO_3772 - BLOCK
      ?AUTO_3768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3762 ) ( CLEAR ?AUTO_3764 ) ( ON ?AUTO_3770 ?AUTO_3762 ) ( CLEAR ?AUTO_3771 ) ( ON ?AUTO_3765 ?AUTO_3763 ) ( CLEAR ?AUTO_3770 ) ( ON ?AUTO_3767 ?AUTO_3765 ) ( CLEAR ?AUTO_3772 ) ( ON ?AUTO_3768 ?AUTO_3767 ) ( CLEAR ?AUTO_3768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3768 ?AUTO_3767 )
      ( MAKE-ON ?AUTO_3762 ?AUTO_3763 ) )
    :id ( 536 )
    :q-value ( 10.3703 )
    :q-count ( 27 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3775 - BLOCK
      ?AUTO_3776 - BLOCK
    )
    :vars
    (
      ?AUTO_3779 - BLOCK
      ?AUTO_3781 - BLOCK
      ?AUTO_3783 - BLOCK
      ?AUTO_3777 - BLOCK
      ?AUTO_3784 - BLOCK
      ?AUTO_3778 - BLOCK
      ?AUTO_3780 - BLOCK
      ?AUTO_3786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3775 ) ( CLEAR ?AUTO_3779 ) ( ON ?AUTO_3781 ?AUTO_3775 ) ( CLEAR ?AUTO_3783 ) ( ON ?AUTO_3777 ?AUTO_3776 ) ( CLEAR ?AUTO_3781 ) ( ON ?AUTO_3784 ?AUTO_3777 ) ( CLEAR ?AUTO_3778 ) ( ON ?AUTO_3780 ?AUTO_3784 ) ( CLEAR ?AUTO_3780 ) ( HOLDING ?AUTO_3786 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3786 )
      ( MAKE-ON ?AUTO_3775 ?AUTO_3776 ) )
    :id ( 537 )
    :q-value ( 11.7777 )
    :q-count ( 18 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3787 - BLOCK
      ?AUTO_3788 - BLOCK
    )
    :vars
    (
      ?AUTO_3793 - BLOCK
      ?AUTO_3796 - BLOCK
      ?AUTO_3792 - BLOCK
      ?AUTO_3790 - BLOCK
      ?AUTO_3789 - BLOCK
      ?AUTO_3791 - BLOCK
      ?AUTO_3797 - BLOCK
      ?AUTO_3798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3787 ) ( CLEAR ?AUTO_3793 ) ( ON ?AUTO_3796 ?AUTO_3787 ) ( CLEAR ?AUTO_3792 ) ( ON ?AUTO_3790 ?AUTO_3788 ) ( CLEAR ?AUTO_3796 ) ( ON ?AUTO_3789 ?AUTO_3790 ) ( CLEAR ?AUTO_3791 ) ( ON ?AUTO_3797 ?AUTO_3789 ) ( ON ?AUTO_3798 ?AUTO_3797 ) ( CLEAR ?AUTO_3798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3798 ?AUTO_3797 )
      ( MAKE-ON ?AUTO_3787 ?AUTO_3788 ) )
    :id ( 538 )
    :q-value ( 12.9334 )
    :q-count ( 15 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3801 - BLOCK
      ?AUTO_3802 - BLOCK
    )
    :vars
    (
      ?AUTO_3808 - BLOCK
      ?AUTO_3804 - BLOCK
      ?AUTO_3807 - BLOCK
      ?AUTO_3811 - BLOCK
      ?AUTO_3806 - BLOCK
      ?AUTO_3805 - BLOCK
      ?AUTO_3812 - BLOCK
      ?AUTO_3814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3801 ) ( ON ?AUTO_3808 ?AUTO_3801 ) ( ON ?AUTO_3804 ?AUTO_3802 ) ( CLEAR ?AUTO_3808 ) ( ON ?AUTO_3807 ?AUTO_3804 ) ( CLEAR ?AUTO_3811 ) ( ON ?AUTO_3806 ?AUTO_3807 ) ( ON ?AUTO_3805 ?AUTO_3806 ) ( CLEAR ?AUTO_3805 ) ( HOLDING ?AUTO_3812 ) ( CLEAR ?AUTO_3814 ) )
    :subtasks
    ( ( !STACK ?AUTO_3812 ?AUTO_3814 )
      ( MAKE-ON ?AUTO_3801 ?AUTO_3802 ) )
    :id ( 539 )
    :q-value ( 15.3333 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4038 - BLOCK
      ?AUTO_4039 - BLOCK
    )
    :vars
    (
      ?AUTO_4042 - BLOCK
      ?AUTO_4041 - BLOCK
      ?AUTO_4045 - BLOCK
      ?AUTO_4044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4042 ) ( ON ?AUTO_4041 ?AUTO_4039 ) ( CLEAR ?AUTO_4045 ) ( ON ?AUTO_4044 ?AUTO_4041 ) ( CLEAR ?AUTO_4044 ) ( HOLDING ?AUTO_4038 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4038 )
      ( MAKE-ON ?AUTO_4038 ?AUTO_4039 ) )
    :id ( 551 )
    :q-value ( 7.40001 )
    :q-count ( 50 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4309 - BLOCK
      ?AUTO_4310 - BLOCK
    )
    :vars
    (
      ?AUTO_4311 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4309 ) ( ON ?AUTO_4311 ?AUTO_4309 ) ( CLEAR ?AUTO_4311 ) ( HOLDING ?AUTO_4310 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4310 )
      ( MAKE-ON ?AUTO_4309 ?AUTO_4310 ) )
    :id ( 591 )
    :q-value ( 5.05758 )
    :q-count ( 139 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4322 - BLOCK
      ?AUTO_4323 - BLOCK
    )
    :vars
    (
      ?AUTO_4325 - BLOCK
      ?AUTO_4327 - BLOCK
      ?AUTO_4328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4322 ) ( ON ?AUTO_4325 ?AUTO_4322 ) ( ON ?AUTO_4323 ?AUTO_4325 ) ( CLEAR ?AUTO_4323 ) ( HOLDING ?AUTO_4327 ) ( CLEAR ?AUTO_4328 ) )
    :subtasks
    ( ( !STACK ?AUTO_4327 ?AUTO_4328 )
      ( MAKE-ON ?AUTO_4322 ?AUTO_4323 ) )
    :id ( 593 )
    :q-value ( 7.11428 )
    :q-count ( 35 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4389 - BLOCK
      ?AUTO_4390 - BLOCK
    )
    :vars
    (
      ?AUTO_4393 - BLOCK
      ?AUTO_4394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4389 ) ( CLEAR ?AUTO_4389 ) ( ON ?AUTO_4393 ?AUTO_4390 ) ( CLEAR ?AUTO_4393 ) ( HOLDING ?AUTO_4394 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4394 )
      ( MAKE-ON ?AUTO_4389 ?AUTO_4390 ) )
    :id ( 600 )
    :q-value ( 5.02799 )
    :q-count ( 143 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4411 - BLOCK
      ?AUTO_4412 - BLOCK
    )
    :vars
    (
      ?AUTO_4416 - BLOCK
      ?AUTO_4415 - BLOCK
      ?AUTO_4418 - BLOCK
      ?AUTO_4417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4411 ) ( CLEAR ?AUTO_4411 ) ( ON ?AUTO_4416 ?AUTO_4412 ) ( ON ?AUTO_4415 ?AUTO_4416 ) ( CLEAR ?AUTO_4418 ) ( ON ?AUTO_4417 ?AUTO_4415 ) ( CLEAR ?AUTO_4417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4417 ?AUTO_4415 )
      ( MAKE-ON ?AUTO_4411 ?AUTO_4412 ) )
    :id ( 603 )
    :q-value ( 8.62651 )
    :q-count ( 83 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4421 - BLOCK
      ?AUTO_4422 - BLOCK
    )
    :vars
    (
      ?AUTO_4425 - BLOCK
      ?AUTO_4426 - BLOCK
      ?AUTO_4423 - BLOCK
      ?AUTO_4424 - BLOCK
      ?AUTO_4430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4421 ) ( CLEAR ?AUTO_4421 ) ( ON ?AUTO_4425 ?AUTO_4422 ) ( ON ?AUTO_4426 ?AUTO_4425 ) ( ON ?AUTO_4423 ?AUTO_4426 ) ( CLEAR ?AUTO_4423 ) ( HOLDING ?AUTO_4424 ) ( CLEAR ?AUTO_4430 ) )
    :subtasks
    ( ( !STACK ?AUTO_4424 ?AUTO_4430 )
      ( MAKE-ON ?AUTO_4421 ?AUTO_4422 ) )
    :id ( 604 )
    :q-value ( 9.62856 )
    :q-count ( 35 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4431 - BLOCK
      ?AUTO_4432 - BLOCK
    )
    :vars
    (
      ?AUTO_4437 - BLOCK
      ?AUTO_4435 - BLOCK
      ?AUTO_4438 - BLOCK
      ?AUTO_4436 - BLOCK
      ?AUTO_4439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4431 ) ( ON ?AUTO_4437 ?AUTO_4432 ) ( ON ?AUTO_4435 ?AUTO_4437 ) ( ON ?AUTO_4438 ?AUTO_4435 ) ( CLEAR ?AUTO_4438 ) ( CLEAR ?AUTO_4436 ) ( ON ?AUTO_4439 ?AUTO_4431 ) ( CLEAR ?AUTO_4439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4439 ?AUTO_4431 )
      ( MAKE-ON ?AUTO_4431 ?AUTO_4432 ) )
    :id ( 605 )
    :q-value ( 11.2173 )
    :q-count ( 23 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4442 - BLOCK
      ?AUTO_4443 - BLOCK
    )
    :vars
    (
      ?AUTO_4447 - BLOCK
      ?AUTO_4450 - BLOCK
      ?AUTO_4444 - BLOCK
      ?AUTO_4449 - BLOCK
      ?AUTO_4448 - BLOCK
      ?AUTO_4452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4442 ) ( ON ?AUTO_4447 ?AUTO_4443 ) ( ON ?AUTO_4450 ?AUTO_4447 ) ( ON ?AUTO_4444 ?AUTO_4450 ) ( CLEAR ?AUTO_4444 ) ( ON ?AUTO_4449 ?AUTO_4442 ) ( CLEAR ?AUTO_4449 ) ( HOLDING ?AUTO_4448 ) ( CLEAR ?AUTO_4452 ) )
    :subtasks
    ( ( !STACK ?AUTO_4448 ?AUTO_4452 )
      ( MAKE-ON ?AUTO_4442 ?AUTO_4443 ) )
    :id ( 606 )
    :q-value ( 12.2 )
    :q-count ( 10 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5031 - BLOCK
      ?AUTO_5032 - BLOCK
    )
    :vars
    (
      ?AUTO_5033 - BLOCK
      ?AUTO_5037 - BLOCK
      ?AUTO_5038 - BLOCK
      ?AUTO_5034 - BLOCK
      ?AUTO_5036 - BLOCK
      ?AUTO_5040 - BLOCK
      ?AUTO_5041 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5032 ) ( ON-TABLE ?AUTO_5031 ) ( CLEAR ?AUTO_5033 ) ( ON ?AUTO_5037 ?AUTO_5031 ) ( CLEAR ?AUTO_5038 ) ( ON ?AUTO_5034 ?AUTO_5037 ) ( ON ?AUTO_5036 ?AUTO_5034 ) ( CLEAR ?AUTO_5036 ) ( HOLDING ?AUTO_5040 ) ( CLEAR ?AUTO_5041 ) )
    :subtasks
    ( ( !STACK ?AUTO_5040 ?AUTO_5041 )
      ( MAKE-ON ?AUTO_5031 ?AUTO_5032 ) )
    :id ( 665 )
    :q-value ( 9.35897 )
    :q-count ( 39 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5244 - BLOCK
      ?AUTO_5245 - BLOCK
    )
    :vars
    (
      ?AUTO_5248 - BLOCK
      ?AUTO_5246 - BLOCK
      ?AUTO_5250 - BLOCK
      ?AUTO_5247 - BLOCK
      ?AUTO_5251 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5244 ) ( CLEAR ?AUTO_5248 ) ( ON ?AUTO_5246 ?AUTO_5245 ) ( CLEAR ?AUTO_5246 ) ( ON ?AUTO_5250 ?AUTO_5244 ) ( CLEAR ?AUTO_5247 ) ( ON ?AUTO_5251 ?AUTO_5250 ) ( CLEAR ?AUTO_5251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5251 ?AUTO_5250 )
      ( MAKE-ON ?AUTO_5244 ?AUTO_5245 ) )
    :id ( 693 )
    :q-value ( 8 )
    :q-count ( 55 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5478 - BLOCK
      ?AUTO_5479 - BLOCK
    )
    :vars
    (
      ?AUTO_5486 - BLOCK
      ?AUTO_5481 - BLOCK
      ?AUTO_5483 - BLOCK
      ?AUTO_5484 - BLOCK
      ?AUTO_5485 - BLOCK
      ?AUTO_5487 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5478 ?AUTO_5486 ) ( CLEAR ?AUTO_5481 ) ( ON ?AUTO_5483 ?AUTO_5478 ) ( CLEAR ?AUTO_5484 ) ( ON ?AUTO_5485 ?AUTO_5483 ) ( CLEAR ?AUTO_5487 ) ( ON ?AUTO_5479 ?AUTO_5485 ) ( CLEAR ?AUTO_5479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5479 ?AUTO_5485 )
      ( MAKE-ON ?AUTO_5478 ?AUTO_5479 ) )
    :id ( 724 )
    :q-value ( 8.09092 )
    :q-count ( 22 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5580 - BLOCK
      ?AUTO_5581 - BLOCK
    )
    :vars
    (
      ?AUTO_5586 - BLOCK
      ?AUTO_5585 - BLOCK
      ?AUTO_5588 - BLOCK
      ?AUTO_5582 - BLOCK
      ?AUTO_5587 - BLOCK
      ?AUTO_5589 - BLOCK
      ?AUTO_5590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5581 ) ( ON-TABLE ?AUTO_5580 ) ( CLEAR ?AUTO_5586 ) ( ON ?AUTO_5585 ?AUTO_5580 ) ( CLEAR ?AUTO_5588 ) ( ON ?AUTO_5582 ?AUTO_5585 ) ( ON ?AUTO_5587 ?AUTO_5582 ) ( CLEAR ?AUTO_5589 ) ( ON ?AUTO_5590 ?AUTO_5587 ) ( CLEAR ?AUTO_5590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5590 ?AUTO_5587 )
      ( MAKE-ON ?AUTO_5580 ?AUTO_5581 ) )
    :id ( 735 )
    :q-value ( 10.5884 )
    :q-count ( 51 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5657 - BLOCK
      ?AUTO_5658 - BLOCK
    )
    :vars
    (
      ?AUTO_5662 - BLOCK
      ?AUTO_5663 - BLOCK
      ?AUTO_5661 - BLOCK
      ?AUTO_5660 - BLOCK
      ?AUTO_5666 - BLOCK
      ?AUTO_5665 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5657 ?AUTO_5662 ) ( CLEAR ?AUTO_5663 ) ( ON ?AUTO_5661 ?AUTO_5658 ) ( CLEAR ?AUTO_5661 ) ( ON ?AUTO_5660 ?AUTO_5657 ) ( CLEAR ?AUTO_5666 ) ( ON ?AUTO_5665 ?AUTO_5660 ) ( CLEAR ?AUTO_5665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5665 ?AUTO_5660 )
      ( MAKE-ON ?AUTO_5657 ?AUTO_5658 ) )
    :id ( 742 )
    :q-value ( 8.16216 )
    :q-count ( 37 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5935 - BLOCK
      ?AUTO_5936 - BLOCK
    )
    :vars
    (
      ?AUTO_5938 - BLOCK
      ?AUTO_5942 - BLOCK
      ?AUTO_5941 - BLOCK
      ?AUTO_5943 - BLOCK
      ?AUTO_5940 - BLOCK
      ?AUTO_5937 - BLOCK
      ?AUTO_5945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5935 ) ( CLEAR ?AUTO_5938 ) ( ON ?AUTO_5942 ?AUTO_5936 ) ( CLEAR ?AUTO_5941 ) ( ON ?AUTO_5943 ?AUTO_5942 ) ( CLEAR ?AUTO_5943 ) ( CLEAR ?AUTO_5940 ) ( ON ?AUTO_5937 ?AUTO_5935 ) ( CLEAR ?AUTO_5937 ) ( HOLDING ?AUTO_5945 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5945 )
      ( MAKE-ON ?AUTO_5935 ?AUTO_5936 ) )
    :id ( 763 )
    :q-value ( 9.35295 )
    :q-count ( 34 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6058 - BLOCK
      ?AUTO_6059 - BLOCK
    )
    :vars
    (
      ?AUTO_6062 - BLOCK
      ?AUTO_6063 - BLOCK
      ?AUTO_6061 - BLOCK
      ?AUTO_6065 - BLOCK
      ?AUTO_6066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6058 ) ( CLEAR ?AUTO_6062 ) ( ON ?AUTO_6063 ?AUTO_6059 ) ( CLEAR ?AUTO_6063 ) ( CLEAR ?AUTO_6061 ) ( ON ?AUTO_6065 ?AUTO_6058 ) ( CLEAR ?AUTO_6065 ) ( HOLDING ?AUTO_6066 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6066 )
      ( MAKE-ON ?AUTO_6058 ?AUTO_6059 ) )
    :id ( 773 )
    :q-value ( 7 )
    :q-count ( 71 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6325 - BLOCK
      ?AUTO_6326 - BLOCK
    )
    :vars
    (
      ?AUTO_6328 - BLOCK
      ?AUTO_6330 - BLOCK
      ?AUTO_6329 - BLOCK
      ?AUTO_6327 - BLOCK
      ?AUTO_6334 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6325 ?AUTO_6328 ) ( CLEAR ?AUTO_6330 ) ( ON ?AUTO_6329 ?AUTO_6325 ) ( ON ?AUTO_6326 ?AUTO_6329 ) ( CLEAR ?AUTO_6326 ) ( HOLDING ?AUTO_6327 ) ( CLEAR ?AUTO_6334 ) )
    :subtasks
    ( ( !STACK ?AUTO_6327 ?AUTO_6334 )
      ( MAKE-ON ?AUTO_6325 ?AUTO_6326 ) )
    :id ( 807 )
    :q-value ( 7.13792 )
    :q-count ( 29 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7106 - BLOCK
      ?AUTO_7107 - BLOCK
    )
    :vars
    (
      ?AUTO_7112 - BLOCK
      ?AUTO_7109 - BLOCK
      ?AUTO_7108 - BLOCK
      ?AUTO_7113 - BLOCK
      ?AUTO_7115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7106 ) ( ON ?AUTO_7112 ?AUTO_7106 ) ( ON ?AUTO_7109 ?AUTO_7112 ) ( CLEAR ?AUTO_7109 ) ( ON ?AUTO_7108 ?AUTO_7107 ) ( CLEAR ?AUTO_7108 ) ( HOLDING ?AUTO_7113 ) ( CLEAR ?AUTO_7115 ) )
    :subtasks
    ( ( !STACK ?AUTO_7113 ?AUTO_7115 )
      ( MAKE-ON ?AUTO_7106 ?AUTO_7107 ) )
    :id ( 884 )
    :q-value ( 9.06897 )
    :q-count ( 29 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7323 - BLOCK
      ?AUTO_7324 - BLOCK
    )
    :vars
    (
      ?AUTO_7328 - BLOCK
      ?AUTO_7330 - BLOCK
      ?AUTO_7327 - BLOCK
      ?AUTO_7329 - BLOCK
      ?AUTO_7331 - BLOCK
      ?AUTO_7332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7328 ) ( ON ?AUTO_7330 ?AUTO_7324 ) ( ON ?AUTO_7327 ?AUTO_7330 ) ( CLEAR ?AUTO_7329 ) ( ON ?AUTO_7323 ?AUTO_7327 ) ( CLEAR ?AUTO_7323 ) ( HOLDING ?AUTO_7331 ) ( CLEAR ?AUTO_7332 ) )
    :subtasks
    ( ( !STACK ?AUTO_7331 ?AUTO_7332 )
      ( MAKE-ON ?AUTO_7323 ?AUTO_7324 ) )
    :id ( 913 )
    :q-value ( 9.53846 )
    :q-count ( 26 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7333 - BLOCK
      ?AUTO_7334 - BLOCK
    )
    :vars
    (
      ?AUTO_7341 - BLOCK
      ?AUTO_7340 - BLOCK
      ?AUTO_7339 - BLOCK
      ?AUTO_7338 - BLOCK
      ?AUTO_7335 - BLOCK
      ?AUTO_7337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7341 ) ( ON ?AUTO_7340 ?AUTO_7334 ) ( ON ?AUTO_7339 ?AUTO_7340 ) ( CLEAR ?AUTO_7338 ) ( ON ?AUTO_7333 ?AUTO_7339 ) ( CLEAR ?AUTO_7335 ) ( ON ?AUTO_7337 ?AUTO_7333 ) ( CLEAR ?AUTO_7337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7337 ?AUTO_7333 )
      ( MAKE-ON ?AUTO_7333 ?AUTO_7334 ) )
    :id ( 914 )
    :q-value ( 10.8 )
    :q-count ( 20 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7541 - BLOCK
      ?AUTO_7542 - BLOCK
    )
    :vars
    (
      ?AUTO_7543 - BLOCK
      ?AUTO_7548 - BLOCK
      ?AUTO_7549 - BLOCK
      ?AUTO_7550 - BLOCK
      ?AUTO_7544 - BLOCK
      ?AUTO_7547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7543 ) ( ON ?AUTO_7548 ?AUTO_7542 ) ( ON ?AUTO_7549 ?AUTO_7548 ) ( CLEAR ?AUTO_7550 ) ( ON ?AUTO_7544 ?AUTO_7549 ) ( CLEAR ?AUTO_7544 ) ( HOLDING ?AUTO_7541 ) ( CLEAR ?AUTO_7547 ) )
    :subtasks
    ( ( !STACK ?AUTO_7541 ?AUTO_7547 )
      ( MAKE-ON ?AUTO_7541 ?AUTO_7542 ) )
    :id ( 934 )
    :q-value ( 9.44445 )
    :q-count ( 18 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7553 - BLOCK
      ?AUTO_7554 - BLOCK
    )
    :vars
    (
      ?AUTO_7559 - BLOCK
      ?AUTO_7555 - BLOCK
      ?AUTO_7561 - BLOCK
      ?AUTO_7556 - BLOCK
      ?AUTO_7557 - BLOCK
      ?AUTO_7562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7559 ) ( ON ?AUTO_7555 ?AUTO_7554 ) ( ON ?AUTO_7561 ?AUTO_7555 ) ( CLEAR ?AUTO_7556 ) ( ON ?AUTO_7557 ?AUTO_7561 ) ( CLEAR ?AUTO_7562 ) ( ON ?AUTO_7553 ?AUTO_7557 ) ( CLEAR ?AUTO_7553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7553 ?AUTO_7557 )
      ( MAKE-ON ?AUTO_7553 ?AUTO_7554 ) )
    :id ( 935 )
    :q-value ( 10.3334 )
    :q-count ( 18 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7652 - BLOCK
      ?AUTO_7653 - BLOCK
    )
    :vars
    (
      ?AUTO_7661 - BLOCK
      ?AUTO_7657 - BLOCK
      ?AUTO_7658 - BLOCK
      ?AUTO_7659 - BLOCK
      ?AUTO_7655 - BLOCK
      ?AUTO_7660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7652 ) ( CLEAR ?AUTO_7661 ) ( CLEAR ?AUTO_7657 ) ( ON ?AUTO_7658 ?AUTO_7653 ) ( CLEAR ?AUTO_7659 ) ( ON ?AUTO_7655 ?AUTO_7658 ) ( CLEAR ?AUTO_7655 ) ( HOLDING ?AUTO_7660 ) ( CLEAR ?AUTO_7652 ) )
    :subtasks
    ( ( !STACK ?AUTO_7660 ?AUTO_7652 )
      ( MAKE-ON ?AUTO_7652 ?AUTO_7653 ) )
    :id ( 945 )
    :q-value ( 10.1251 )
    :q-count ( 32 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7759 - BLOCK
      ?AUTO_7760 - BLOCK
    )
    :vars
    (
      ?AUTO_7761 - BLOCK
      ?AUTO_7762 - BLOCK
      ?AUTO_7765 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7759 ?AUTO_7761 ) ( ON ?AUTO_7762 ?AUTO_7759 ) ( ON ?AUTO_7765 ?AUTO_7762 ) ( CLEAR ?AUTO_7765 ) ( HOLDING ?AUTO_7760 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7760 )
      ( MAKE-ON ?AUTO_7759 ?AUTO_7760 ) )
    :id ( 962 )
    :q-value ( 7.14287 )
    :q-count ( 42 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7821 - BLOCK
    )
    :vars
    (
      ?AUTO_7826 - BLOCK
      ?AUTO_7822 - BLOCK
      ?AUTO_7823 - BLOCK
      ?AUTO_7824 - BLOCK
      ?AUTO_7825 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7821 ?AUTO_7826 ) ( ON ?AUTO_7822 ?AUTO_7821 ) ( ON ?AUTO_7823 ?AUTO_7822 ) ( ON ?AUTO_7824 ?AUTO_7823 ) ( CLEAR ?AUTO_7824 ) ( HOLDING ?AUTO_7825 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7825 )
      ( MAKE-ON-TABLE ?AUTO_7821 ) )
    :id ( 971 )
    :q-value ( 9 )
    :q-count ( 34 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7888 - BLOCK
      ?AUTO_7889 - BLOCK
    )
    :vars
    (
      ?AUTO_7890 - BLOCK
      ?AUTO_7891 - BLOCK
      ?AUTO_7893 - BLOCK
      ?AUTO_7892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7888 ) ( ON ?AUTO_7890 ?AUTO_7888 ) ( CLEAR ?AUTO_7891 ) ( ON ?AUTO_7893 ?AUTO_7890 ) ( ON ?AUTO_7889 ?AUTO_7893 ) ( CLEAR ?AUTO_7889 ) ( HOLDING ?AUTO_7892 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7892 )
      ( MAKE-ON ?AUTO_7888 ?AUTO_7889 ) )
    :id ( 980 )
    :q-value ( 9 )
    :q-count ( 8 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7907 - BLOCK
      ?AUTO_7908 - BLOCK
    )
    :vars
    (
      ?AUTO_7910 - BLOCK
      ?AUTO_7913 - BLOCK
      ?AUTO_7914 - BLOCK
      ?AUTO_7912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7907 ) ( ON ?AUTO_7910 ?AUTO_7907 ) ( ON ?AUTO_7913 ?AUTO_7910 ) ( ON ?AUTO_7908 ?AUTO_7913 ) ( ON ?AUTO_7914 ?AUTO_7908 ) ( CLEAR ?AUTO_7914 ) ( HOLDING ?AUTO_7912 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7912 )
      ( MAKE-ON ?AUTO_7907 ?AUTO_7908 ) )
    :id ( 982 )
    :q-value ( 11 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7972 - BLOCK
      ?AUTO_7973 - BLOCK
    )
    :vars
    (
      ?AUTO_7975 - BLOCK
      ?AUTO_7979 - BLOCK
      ?AUTO_7977 - BLOCK
      ?AUTO_7976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7972 ) ( CLEAR ?AUTO_7972 ) ( CLEAR ?AUTO_7975 ) ( ON ?AUTO_7979 ?AUTO_7973 ) ( ON ?AUTO_7977 ?AUTO_7979 ) ( CLEAR ?AUTO_7977 ) ( HOLDING ?AUTO_7976 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7976 )
      ( MAKE-ON ?AUTO_7972 ?AUTO_7973 ) )
    :id ( 990 )
    :q-value ( 7.32259 )
    :q-count ( 62 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7991 - BLOCK
      ?AUTO_7992 - BLOCK
    )
    :vars
    (
      ?AUTO_7996 - BLOCK
      ?AUTO_7993 - BLOCK
      ?AUTO_7998 - BLOCK
      ?AUTO_7994 - BLOCK
      ?AUTO_7999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7991 ) ( CLEAR ?AUTO_7991 ) ( CLEAR ?AUTO_7996 ) ( ON ?AUTO_7993 ?AUTO_7992 ) ( ON ?AUTO_7998 ?AUTO_7993 ) ( ON ?AUTO_7994 ?AUTO_7998 ) ( CLEAR ?AUTO_7994 ) ( HOLDING ?AUTO_7999 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7999 )
      ( MAKE-ON ?AUTO_7991 ?AUTO_7992 ) )
    :id ( 992 )
    :q-value ( 9.89655 )
    :q-count ( 29 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8505 - BLOCK
      ?AUTO_8506 - BLOCK
    )
    :vars
    (
      ?AUTO_8507 - BLOCK
      ?AUTO_8511 - BLOCK
      ?AUTO_8510 - BLOCK
      ?AUTO_8508 - BLOCK
      ?AUTO_8513 - BLOCK
      ?AUTO_8514 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8505 ) ( CLEAR ?AUTO_8505 ) ( CLEAR ?AUTO_8507 ) ( ON ?AUTO_8511 ?AUTO_8506 ) ( ON ?AUTO_8510 ?AUTO_8511 ) ( ON ?AUTO_8508 ?AUTO_8510 ) ( CLEAR ?AUTO_8513 ) ( ON ?AUTO_8514 ?AUTO_8508 ) ( CLEAR ?AUTO_8514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8514 ?AUTO_8508 )
      ( MAKE-ON ?AUTO_8505 ?AUTO_8506 ) )
    :id ( 1042 )
    :q-value ( 10.8182 )
    :q-count ( 22 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8824 - BLOCK
      ?AUTO_8825 - BLOCK
    )
    :vars
    (
      ?AUTO_8828 - BLOCK
      ?AUTO_8832 - BLOCK
      ?AUTO_8826 - BLOCK
      ?AUTO_8827 - BLOCK
      ?AUTO_8831 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8824 ) ( ON ?AUTO_8828 ?AUTO_8824 ) ( ON ?AUTO_8832 ?AUTO_8825 ) ( CLEAR ?AUTO_8832 ) ( CLEAR ?AUTO_8826 ) ( ON ?AUTO_8827 ?AUTO_8828 ) ( CLEAR ?AUTO_8827 ) ( HOLDING ?AUTO_8831 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8831 )
      ( MAKE-ON ?AUTO_8824 ?AUTO_8825 ) )
    :id ( 1087 )
    :q-value ( 9.06452 )
    :q-count ( 31 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8834 - BLOCK
      ?AUTO_8835 - BLOCK
    )
    :vars
    (
      ?AUTO_8842 - BLOCK
      ?AUTO_8839 - BLOCK
      ?AUTO_8841 - BLOCK
      ?AUTO_8837 - BLOCK
      ?AUTO_8840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8834 ) ( ON ?AUTO_8842 ?AUTO_8834 ) ( ON ?AUTO_8839 ?AUTO_8835 ) ( CLEAR ?AUTO_8839 ) ( CLEAR ?AUTO_8841 ) ( ON ?AUTO_8837 ?AUTO_8842 ) ( ON ?AUTO_8840 ?AUTO_8837 ) ( CLEAR ?AUTO_8840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8840 ?AUTO_8837 )
      ( MAKE-ON ?AUTO_8834 ?AUTO_8835 ) )
    :id ( 1088 )
    :q-value ( 10.56 )
    :q-count ( 25 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8845 - BLOCK
      ?AUTO_8846 - BLOCK
    )
    :vars
    (
      ?AUTO_8850 - BLOCK
      ?AUTO_8853 - BLOCK
      ?AUTO_8852 - BLOCK
      ?AUTO_8851 - BLOCK
      ?AUTO_8847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8845 ) ( ON ?AUTO_8850 ?AUTO_8845 ) ( ON ?AUTO_8853 ?AUTO_8846 ) ( CLEAR ?AUTO_8853 ) ( ON ?AUTO_8852 ?AUTO_8850 ) ( ON ?AUTO_8851 ?AUTO_8852 ) ( CLEAR ?AUTO_8851 ) ( HOLDING ?AUTO_8847 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8847 )
      ( MAKE-ON ?AUTO_8845 ?AUTO_8846 ) )
    :id ( 1089 )
    :q-value ( 11.5263 )
    :q-count ( 19 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8855 - BLOCK
      ?AUTO_8856 - BLOCK
    )
    :vars
    (
      ?AUTO_8859 - BLOCK
      ?AUTO_8863 - BLOCK
      ?AUTO_8860 - BLOCK
      ?AUTO_8857 - BLOCK
      ?AUTO_8861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8855 ) ( ON ?AUTO_8859 ?AUTO_8855 ) ( ON ?AUTO_8863 ?AUTO_8856 ) ( ON ?AUTO_8860 ?AUTO_8859 ) ( ON ?AUTO_8857 ?AUTO_8860 ) ( CLEAR ?AUTO_8857 ) ( ON ?AUTO_8861 ?AUTO_8863 ) ( CLEAR ?AUTO_8861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8861 ?AUTO_8863 )
      ( MAKE-ON ?AUTO_8855 ?AUTO_8856 ) )
    :id ( 1090 )
    :q-value ( 13.4736 )
    :q-count ( 19 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9282 - BLOCK
      ?AUTO_9283 - BLOCK
    )
    :vars
    (
      ?AUTO_9288 - BLOCK
      ?AUTO_9290 - BLOCK
      ?AUTO_9287 - BLOCK
      ?AUTO_9286 - BLOCK
      ?AUTO_9289 - BLOCK
      ?AUTO_9291 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9288 ) ( ON ?AUTO_9290 ?AUTO_9283 ) ( ON ?AUTO_9282 ?AUTO_9290 ) ( ON ?AUTO_9287 ?AUTO_9282 ) ( CLEAR ?AUTO_9286 ) ( ON ?AUTO_9289 ?AUTO_9287 ) ( CLEAR ?AUTO_9289 ) ( HOLDING ?AUTO_9291 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9291 )
      ( MAKE-ON ?AUTO_9282 ?AUTO_9283 ) )
    :id ( 1146 )
    :q-value ( 11 )
    :q-count ( 10 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9392 - BLOCK
      ?AUTO_9393 - BLOCK
    )
    :vars
    (
      ?AUTO_9397 - BLOCK
      ?AUTO_9399 - BLOCK
      ?AUTO_9401 - BLOCK
      ?AUTO_9398 - BLOCK
      ?AUTO_9396 - BLOCK
      ?AUTO_9395 - BLOCK
      ?AUTO_9394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9392 ) ( CLEAR ?AUTO_9397 ) ( ON ?AUTO_9399 ?AUTO_9393 ) ( ON ?AUTO_9401 ?AUTO_9399 ) ( CLEAR ?AUTO_9401 ) ( CLEAR ?AUTO_9398 ) ( ON ?AUTO_9396 ?AUTO_9392 ) ( ON ?AUTO_9395 ?AUTO_9396 ) ( CLEAR ?AUTO_9395 ) ( HOLDING ?AUTO_9394 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9394 )
      ( MAKE-ON ?AUTO_9392 ?AUTO_9393 ) )
    :id ( 1157 )
    :q-value ( 11.5714 )
    :q-count ( 14 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9404 - BLOCK
      ?AUTO_9405 - BLOCK
    )
    :vars
    (
      ?AUTO_9414 - BLOCK
      ?AUTO_9407 - BLOCK
      ?AUTO_9408 - BLOCK
      ?AUTO_9412 - BLOCK
      ?AUTO_9413 - BLOCK
      ?AUTO_9406 - BLOCK
      ?AUTO_9410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9404 ) ( CLEAR ?AUTO_9414 ) ( ON ?AUTO_9407 ?AUTO_9405 ) ( ON ?AUTO_9408 ?AUTO_9407 ) ( CLEAR ?AUTO_9412 ) ( ON ?AUTO_9413 ?AUTO_9404 ) ( ON ?AUTO_9406 ?AUTO_9413 ) ( CLEAR ?AUTO_9406 ) ( ON ?AUTO_9410 ?AUTO_9408 ) ( CLEAR ?AUTO_9410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9410 ?AUTO_9408 )
      ( MAKE-ON ?AUTO_9404 ?AUTO_9405 ) )
    :id ( 1158 )
    :q-value ( 13.4545 )
    :q-count ( 11 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9417 - BLOCK
      ?AUTO_9418 - BLOCK
    )
    :vars
    (
      ?AUTO_9419 - BLOCK
      ?AUTO_9426 - BLOCK
      ?AUTO_9427 - BLOCK
      ?AUTO_9425 - BLOCK
      ?AUTO_9424 - BLOCK
      ?AUTO_9421 - BLOCK
      ?AUTO_9420 - BLOCK
      ?AUTO_9428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9417 ) ( CLEAR ?AUTO_9419 ) ( ON ?AUTO_9426 ?AUTO_9418 ) ( ON ?AUTO_9427 ?AUTO_9426 ) ( CLEAR ?AUTO_9425 ) ( ON ?AUTO_9424 ?AUTO_9417 ) ( ON ?AUTO_9421 ?AUTO_9424 ) ( CLEAR ?AUTO_9421 ) ( ON ?AUTO_9420 ?AUTO_9427 ) ( CLEAR ?AUTO_9420 ) ( HOLDING ?AUTO_9428 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9428 )
      ( MAKE-ON ?AUTO_9417 ?AUTO_9418 ) )
    :id ( 1159 )
    :q-value ( 14.6 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9429 - BLOCK
      ?AUTO_9430 - BLOCK
    )
    :vars
    (
      ?AUTO_9434 - BLOCK
      ?AUTO_9437 - BLOCK
      ?AUTO_9431 - BLOCK
      ?AUTO_9433 - BLOCK
      ?AUTO_9435 - BLOCK
      ?AUTO_9439 - BLOCK
      ?AUTO_9432 - BLOCK
      ?AUTO_9440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9429 ) ( CLEAR ?AUTO_9434 ) ( ON ?AUTO_9437 ?AUTO_9430 ) ( ON ?AUTO_9431 ?AUTO_9437 ) ( CLEAR ?AUTO_9433 ) ( ON ?AUTO_9435 ?AUTO_9429 ) ( ON ?AUTO_9439 ?AUTO_9435 ) ( ON ?AUTO_9432 ?AUTO_9431 ) ( CLEAR ?AUTO_9432 ) ( ON ?AUTO_9440 ?AUTO_9439 ) ( CLEAR ?AUTO_9440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9440 ?AUTO_9439 )
      ( MAKE-ON ?AUTO_9429 ?AUTO_9430 ) )
    :id ( 1160 )
    :q-value ( 15.2 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9712 - BLOCK
      ?AUTO_9713 - BLOCK
    )
    :vars
    (
      ?AUTO_9718 - BLOCK
      ?AUTO_9717 - BLOCK
      ?AUTO_9714 - BLOCK
      ?AUTO_9720 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9718 ?AUTO_9713 ) ( CLEAR ?AUTO_9717 ) ( ON ?AUTO_9714 ?AUTO_9718 ) ( CLEAR ?AUTO_9714 ) ( ON ?AUTO_9712 ?AUTO_9720 ) ( CLEAR ?AUTO_9712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9712 ?AUTO_9720 )
      ( MAKE-ON ?AUTO_9712 ?AUTO_9713 ) )
    :id ( 1200 )
    :q-value ( 8.11766 )
    :q-count ( 17 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9743 - BLOCK
      ?AUTO_9744 - BLOCK
    )
    :vars
    (
      ?AUTO_9751 - BLOCK
      ?AUTO_9746 - BLOCK
      ?AUTO_9752 - BLOCK
      ?AUTO_9749 - BLOCK
      ?AUTO_9750 - BLOCK
      ?AUTO_9747 - BLOCK
      ?AUTO_9753 - BLOCK
      ?AUTO_9754 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9751 ?AUTO_9744 ) ( CLEAR ?AUTO_9746 ) ( ON ?AUTO_9752 ?AUTO_9751 ) ( CLEAR ?AUTO_9752 ) ( ON ?AUTO_9743 ?AUTO_9749 ) ( CLEAR ?AUTO_9750 ) ( ON ?AUTO_9747 ?AUTO_9743 ) ( CLEAR ?AUTO_9747 ) ( HOLDING ?AUTO_9753 ) ( CLEAR ?AUTO_9754 ) )
    :subtasks
    ( ( !STACK ?AUTO_9753 ?AUTO_9754 )
      ( MAKE-ON ?AUTO_9743 ?AUTO_9744 ) )
    :id ( 1203 )
    :q-value ( 9.4 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9948 - BLOCK
      ?AUTO_9949 - BLOCK
    )
    :vars
    (
      ?AUTO_9952 - BLOCK
      ?AUTO_9954 - BLOCK
      ?AUTO_9955 - BLOCK
      ?AUTO_9953 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9948 ?AUTO_9952 ) ( CLEAR ?AUTO_9954 ) ( ON ?AUTO_9949 ?AUTO_9948 ) ( CLEAR ?AUTO_9955 ) ( ON ?AUTO_9953 ?AUTO_9949 ) ( CLEAR ?AUTO_9953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9953 ?AUTO_9949 )
      ( MAKE-ON ?AUTO_9948 ?AUTO_9949 ) )
    :id ( 1221 )
    :q-value ( 6 )
    :q-count ( 56 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9958 - BLOCK
      ?AUTO_9959 - BLOCK
    )
    :vars
    (
      ?AUTO_9962 - BLOCK
      ?AUTO_9960 - BLOCK
      ?AUTO_9963 - BLOCK
      ?AUTO_9961 - BLOCK
      ?AUTO_9966 - BLOCK
      ?AUTO_9967 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9958 ?AUTO_9962 ) ( CLEAR ?AUTO_9960 ) ( ON ?AUTO_9959 ?AUTO_9958 ) ( CLEAR ?AUTO_9963 ) ( ON ?AUTO_9961 ?AUTO_9959 ) ( CLEAR ?AUTO_9961 ) ( HOLDING ?AUTO_9966 ) ( CLEAR ?AUTO_9967 ) )
    :subtasks
    ( ( !STACK ?AUTO_9966 ?AUTO_9967 )
      ( MAKE-ON ?AUTO_9958 ?AUTO_9959 ) )
    :id ( 1222 )
    :q-value ( 7 )
    :q-count ( 20 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10149 - BLOCK
      ?AUTO_10150 - BLOCK
    )
    :vars
    (
      ?AUTO_10154 - BLOCK
      ?AUTO_10153 - BLOCK
      ?AUTO_10151 - BLOCK
      ?AUTO_10155 - BLOCK
      ?AUTO_10152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10149 ) ( CLEAR ?AUTO_10154 ) ( ON ?AUTO_10153 ?AUTO_10149 ) ( CLEAR ?AUTO_10151 ) ( ON ?AUTO_10155 ?AUTO_10153 ) ( ON ?AUTO_10152 ?AUTO_10155 ) ( CLEAR ?AUTO_10152 ) ( HOLDING ?AUTO_10150 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10150 )
      ( MAKE-ON ?AUTO_10149 ?AUTO_10150 ) )
    :id ( 1249 )
    :q-value ( 9.19047 )
    :q-count ( 21 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10598 - BLOCK
      ?AUTO_10599 - BLOCK
    )
    :vars
    (
      ?AUTO_10601 - BLOCK
      ?AUTO_10605 - BLOCK
      ?AUTO_10602 - BLOCK
      ?AUTO_10604 - BLOCK
      ?AUTO_10607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10598 ) ( CLEAR ?AUTO_10601 ) ( CLEAR ?AUTO_10605 ) ( ON ?AUTO_10602 ?AUTO_10599 ) ( CLEAR ?AUTO_10602 ) ( CLEAR ?AUTO_10598 ) ( ON ?AUTO_10604 ?AUTO_10607 ) ( CLEAR ?AUTO_10604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10604 ?AUTO_10607 )
      ( MAKE-ON ?AUTO_10598 ?AUTO_10599 ) )
    :id ( 1298 )
    :q-value ( 8 )
    :q-count ( 7 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10808 - BLOCK
      ?AUTO_10809 - BLOCK
    )
    :vars
    (
      ?AUTO_10810 - BLOCK
      ?AUTO_10814 - BLOCK
      ?AUTO_10812 - BLOCK
      ?AUTO_10815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10808 ) ( ON ?AUTO_10810 ?AUTO_10808 ) ( ON ?AUTO_10814 ?AUTO_10810 ) ( ON ?AUTO_10812 ?AUTO_10814 ) ( ON ?AUTO_10815 ?AUTO_10812 ) ( CLEAR ?AUTO_10815 ) ( HOLDING ?AUTO_10809 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10809 )
      ( MAKE-ON ?AUTO_10808 ?AUTO_10809 ) )
    :id ( 1335 )
    :q-value ( 11.5714 )
    :q-count ( 14 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10897 - BLOCK
      ?AUTO_10898 - BLOCK
    )
    :vars
    (
      ?AUTO_10903 - BLOCK
      ?AUTO_10900 - BLOCK
      ?AUTO_10904 - BLOCK
      ?AUTO_10901 - BLOCK
      ?AUTO_10905 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10897 ?AUTO_10903 ) ( CLEAR ?AUTO_10897 ) ( ON ?AUTO_10900 ?AUTO_10898 ) ( ON ?AUTO_10904 ?AUTO_10900 ) ( ON ?AUTO_10901 ?AUTO_10904 ) ( ON ?AUTO_10905 ?AUTO_10901 ) ( CLEAR ?AUTO_10905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10905 ?AUTO_10901 )
      ( MAKE-ON ?AUTO_10897 ?AUTO_10898 ) )
    :id ( 1346 )
    :q-value ( 10.7501 )
    :q-count ( 24 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10908 - BLOCK
      ?AUTO_10909 - BLOCK
    )
    :vars
    (
      ?AUTO_10914 - BLOCK
      ?AUTO_10916 - BLOCK
      ?AUTO_10915 - BLOCK
      ?AUTO_10910 - BLOCK
      ?AUTO_10911 - BLOCK
      ?AUTO_10917 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10908 ?AUTO_10914 ) ( CLEAR ?AUTO_10908 ) ( ON ?AUTO_10916 ?AUTO_10909 ) ( ON ?AUTO_10915 ?AUTO_10916 ) ( ON ?AUTO_10910 ?AUTO_10915 ) ( ON ?AUTO_10911 ?AUTO_10910 ) ( CLEAR ?AUTO_10911 ) ( HOLDING ?AUTO_10917 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10917 )
      ( MAKE-ON ?AUTO_10908 ?AUTO_10909 ) )
    :id ( 1347 )
    :q-value ( 11 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11023 - BLOCK
      ?AUTO_11024 - BLOCK
    )
    :vars
    (
      ?AUTO_11030 - BLOCK
      ?AUTO_11031 - BLOCK
      ?AUTO_11027 - BLOCK
      ?AUTO_11028 - BLOCK
      ?AUTO_11029 - BLOCK
      ?AUTO_11025 - BLOCK
      ?AUTO_11033 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11023 ?AUTO_11030 ) ( ON ?AUTO_11031 ?AUTO_11023 ) ( CLEAR ?AUTO_11031 ) ( CLEAR ?AUTO_11027 ) ( ON ?AUTO_11028 ?AUTO_11024 ) ( ON ?AUTO_11029 ?AUTO_11028 ) ( ON ?AUTO_11025 ?AUTO_11029 ) ( CLEAR ?AUTO_11025 ) ( HOLDING ?AUTO_11033 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_11033 )
      ( MAKE-ON ?AUTO_11023 ?AUTO_11024 ) )
    :id ( 1359 )
    :q-value ( 11.5455 )
    :q-count ( 11 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11116 - BLOCK
      ?AUTO_11117 - BLOCK
    )
    :vars
    (
      ?AUTO_11119 - BLOCK
      ?AUTO_11121 - BLOCK
      ?AUTO_11122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_11116 ) ( ON ?AUTO_11117 ?AUTO_11116 ) ( ON ?AUTO_11119 ?AUTO_11117 ) ( CLEAR ?AUTO_11119 ) ( HOLDING ?AUTO_11121 ) ( CLEAR ?AUTO_11122 ) )
    :subtasks
    ( ( !STACK ?AUTO_11121 ?AUTO_11122 )
      ( MAKE-ON ?AUTO_11116 ?AUTO_11117 ) )
    :id ( 1376 )
    :q-value ( 7 )
    :q-count ( 37 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11568 - BLOCK
      ?AUTO_11569 - BLOCK
    )
    :vars
    (
      ?AUTO_11570 - BLOCK
      ?AUTO_11573 - BLOCK
      ?AUTO_11575 - BLOCK
      ?AUTO_11574 - BLOCK
      ?AUTO_11571 - BLOCK
      ?AUTO_11577 - BLOCK
      ?AUTO_11578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_11569 ) ( ON ?AUTO_11568 ?AUTO_11570 ) ( ON ?AUTO_11573 ?AUTO_11568 ) ( CLEAR ?AUTO_11575 ) ( ON ?AUTO_11574 ?AUTO_11573 ) ( ON ?AUTO_11571 ?AUTO_11574 ) ( CLEAR ?AUTO_11571 ) ( HOLDING ?AUTO_11577 ) ( CLEAR ?AUTO_11578 ) )
    :subtasks
    ( ( !STACK ?AUTO_11577 ?AUTO_11578 )
      ( MAKE-ON ?AUTO_11568 ?AUTO_11569 ) )
    :id ( 1426 )
    :q-value ( 9 )
    :q-count ( 12 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11581 - BLOCK
      ?AUTO_11582 - BLOCK
    )
    :vars
    (
      ?AUTO_11586 - BLOCK
      ?AUTO_11585 - BLOCK
      ?AUTO_11587 - BLOCK
      ?AUTO_11584 - BLOCK
      ?AUTO_11589 - BLOCK
      ?AUTO_11591 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11581 ?AUTO_11586 ) ( ON ?AUTO_11585 ?AUTO_11581 ) ( CLEAR ?AUTO_11587 ) ( ON ?AUTO_11584 ?AUTO_11585 ) ( ON ?AUTO_11589 ?AUTO_11584 ) ( CLEAR ?AUTO_11589 ) ( HOLDING ?AUTO_11582 ) ( CLEAR ?AUTO_11591 ) )
    :subtasks
    ( ( !STACK ?AUTO_11582 ?AUTO_11591 )
      ( MAKE-ON ?AUTO_11581 ?AUTO_11582 ) )
    :id ( 1427 )
    :q-value ( 9.25 )
    :q-count ( 8 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_11668 - BLOCK
    )
    :vars
    (
      ?AUTO_11669 - BLOCK
      ?AUTO_11674 - BLOCK
      ?AUTO_11672 - BLOCK
      ?AUTO_11675 - BLOCK
      ?AUTO_11673 - BLOCK
      ?AUTO_11670 - BLOCK
      ?AUTO_11676 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11668 ?AUTO_11669 ) ( CLEAR ?AUTO_11674 ) ( ON ?AUTO_11672 ?AUTO_11668 ) ( ON ?AUTO_11675 ?AUTO_11672 ) ( CLEAR ?AUTO_11673 ) ( ON ?AUTO_11670 ?AUTO_11675 ) ( ON ?AUTO_11676 ?AUTO_11670 ) ( CLEAR ?AUTO_11676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11676 ?AUTO_11670 )
      ( MAKE-ON-TABLE ?AUTO_11668 ) )
    :id ( 1437 )
    :q-value ( 10 )
    :q-count ( 7 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_11679 - BLOCK
    )
    :vars
    (
      ?AUTO_11683 - BLOCK
      ?AUTO_11682 - BLOCK
      ?AUTO_11680 - BLOCK
      ?AUTO_11685 - BLOCK
      ?AUTO_11684 - BLOCK
      ?AUTO_11681 - BLOCK
      ?AUTO_11687 - BLOCK
      ?AUTO_11688 - BLOCK
      ?AUTO_11689 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11679 ?AUTO_11683 ) ( CLEAR ?AUTO_11682 ) ( ON ?AUTO_11680 ?AUTO_11679 ) ( ON ?AUTO_11685 ?AUTO_11680 ) ( CLEAR ?AUTO_11684 ) ( ON ?AUTO_11681 ?AUTO_11685 ) ( ON ?AUTO_11687 ?AUTO_11681 ) ( CLEAR ?AUTO_11687 ) ( HOLDING ?AUTO_11688 ) ( CLEAR ?AUTO_11689 ) )
    :subtasks
    ( ( !STACK ?AUTO_11688 ?AUTO_11689 )
      ( MAKE-ON-TABLE ?AUTO_11679 ) )
    :id ( 1438 )
    :q-value ( 11 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11742 - BLOCK
      ?AUTO_11743 - BLOCK
    )
    :vars
    (
      ?AUTO_11748 - BLOCK
      ?AUTO_11745 - BLOCK
      ?AUTO_11744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_11742 ) ( ON ?AUTO_11743 ?AUTO_11742 ) ( CLEAR ?AUTO_11748 ) ( ON ?AUTO_11745 ?AUTO_11743 ) ( ON ?AUTO_11744 ?AUTO_11745 ) ( CLEAR ?AUTO_11744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11744 ?AUTO_11745 )
      ( MAKE-ON ?AUTO_11742 ?AUTO_11743 ) )
    :id ( 1446 )
    :q-value ( 8 )
    :q-count ( 39 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11751 - BLOCK
      ?AUTO_11752 - BLOCK
    )
    :vars
    (
      ?AUTO_11755 - BLOCK
      ?AUTO_11756 - BLOCK
      ?AUTO_11754 - BLOCK
      ?AUTO_11758 - BLOCK
      ?AUTO_11759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_11751 ) ( ON ?AUTO_11752 ?AUTO_11751 ) ( CLEAR ?AUTO_11755 ) ( ON ?AUTO_11756 ?AUTO_11752 ) ( ON ?AUTO_11754 ?AUTO_11756 ) ( CLEAR ?AUTO_11754 ) ( HOLDING ?AUTO_11758 ) ( CLEAR ?AUTO_11759 ) )
    :subtasks
    ( ( !STACK ?AUTO_11758 ?AUTO_11759 )
      ( MAKE-ON ?AUTO_11751 ?AUTO_11752 ) )
    :id ( 1447 )
    :q-value ( 9 )
    :q-count ( 14 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11764 - BLOCK
      ?AUTO_11765 - BLOCK
    )
    :vars
    (
      ?AUTO_11766 - BLOCK
      ?AUTO_11769 - BLOCK
      ?AUTO_11771 - BLOCK
      ?AUTO_11772 - BLOCK
      ?AUTO_11768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_11764 ) ( ON ?AUTO_11765 ?AUTO_11764 ) ( CLEAR ?AUTO_11766 ) ( ON ?AUTO_11769 ?AUTO_11765 ) ( ON ?AUTO_11771 ?AUTO_11769 ) ( CLEAR ?AUTO_11772 ) ( ON ?AUTO_11768 ?AUTO_11771 ) ( CLEAR ?AUTO_11768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11768 ?AUTO_11771 )
      ( MAKE-ON ?AUTO_11764 ?AUTO_11765 ) )
    :id ( 1448 )
    :q-value ( 10 )
    :q-count ( 14 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11775 - BLOCK
      ?AUTO_11776 - BLOCK
    )
    :vars
    (
      ?AUTO_11779 - BLOCK
      ?AUTO_11783 - BLOCK
      ?AUTO_11781 - BLOCK
      ?AUTO_11780 - BLOCK
      ?AUTO_11782 - BLOCK
      ?AUTO_11784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_11775 ) ( ON ?AUTO_11776 ?AUTO_11775 ) ( CLEAR ?AUTO_11779 ) ( ON ?AUTO_11783 ?AUTO_11776 ) ( ON ?AUTO_11781 ?AUTO_11783 ) ( CLEAR ?AUTO_11780 ) ( ON ?AUTO_11782 ?AUTO_11781 ) ( CLEAR ?AUTO_11782 ) ( HOLDING ?AUTO_11784 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_11784 )
      ( MAKE-ON ?AUTO_11775 ?AUTO_11776 ) )
    :id ( 1449 )
    :q-value ( 11 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11785 - BLOCK
      ?AUTO_11786 - BLOCK
    )
    :vars
    (
      ?AUTO_11793 - BLOCK
      ?AUTO_11791 - BLOCK
      ?AUTO_11792 - BLOCK
      ?AUTO_11790 - BLOCK
      ?AUTO_11789 - BLOCK
      ?AUTO_11794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_11785 ) ( ON ?AUTO_11786 ?AUTO_11785 ) ( CLEAR ?AUTO_11793 ) ( ON ?AUTO_11791 ?AUTO_11786 ) ( ON ?AUTO_11792 ?AUTO_11791 ) ( CLEAR ?AUTO_11790 ) ( ON ?AUTO_11789 ?AUTO_11792 ) ( ON ?AUTO_11794 ?AUTO_11789 ) ( CLEAR ?AUTO_11794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11794 ?AUTO_11789 )
      ( MAKE-ON ?AUTO_11785 ?AUTO_11786 ) )
    :id ( 1450 )
    :q-value ( 12 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11797 - BLOCK
      ?AUTO_11798 - BLOCK
    )
    :vars
    (
      ?AUTO_11805 - BLOCK
      ?AUTO_11806 - BLOCK
      ?AUTO_11800 - BLOCK
      ?AUTO_11803 - BLOCK
      ?AUTO_11801 - BLOCK
      ?AUTO_11799 - BLOCK
      ?AUTO_11807 - BLOCK
      ?AUTO_11808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_11797 ) ( ON ?AUTO_11798 ?AUTO_11797 ) ( CLEAR ?AUTO_11805 ) ( ON ?AUTO_11806 ?AUTO_11798 ) ( ON ?AUTO_11800 ?AUTO_11806 ) ( CLEAR ?AUTO_11803 ) ( ON ?AUTO_11801 ?AUTO_11800 ) ( ON ?AUTO_11799 ?AUTO_11801 ) ( CLEAR ?AUTO_11799 ) ( HOLDING ?AUTO_11807 ) ( CLEAR ?AUTO_11808 ) )
    :subtasks
    ( ( !STACK ?AUTO_11807 ?AUTO_11808 )
      ( MAKE-ON ?AUTO_11797 ?AUTO_11798 ) )
    :id ( 1451 )
    :q-value ( 13 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11915 - BLOCK
      ?AUTO_11916 - BLOCK
    )
    :vars
    (
      ?AUTO_11921 - BLOCK
      ?AUTO_11918 - BLOCK
      ?AUTO_11922 - BLOCK
      ?AUTO_11920 - BLOCK
      ?AUTO_11919 - BLOCK
      ?AUTO_11924 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11921 ?AUTO_11916 ) ( CLEAR ?AUTO_11918 ) ( ON ?AUTO_11922 ?AUTO_11921 ) ( ON ?AUTO_11915 ?AUTO_11922 ) ( CLEAR ?AUTO_11920 ) ( ON ?AUTO_11919 ?AUTO_11915 ) ( CLEAR ?AUTO_11919 ) ( HOLDING ?AUTO_11924 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_11924 )
      ( MAKE-ON ?AUTO_11915 ?AUTO_11916 ) )
    :id ( 1463 )
    :q-value ( 11.6667 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11925 - BLOCK
      ?AUTO_11926 - BLOCK
    )
    :vars
    (
      ?AUTO_11927 - BLOCK
      ?AUTO_11931 - BLOCK
      ?AUTO_11930 - BLOCK
      ?AUTO_11933 - BLOCK
      ?AUTO_11932 - BLOCK
      ?AUTO_11934 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11927 ?AUTO_11926 ) ( CLEAR ?AUTO_11931 ) ( ON ?AUTO_11930 ?AUTO_11927 ) ( ON ?AUTO_11925 ?AUTO_11930 ) ( CLEAR ?AUTO_11933 ) ( ON ?AUTO_11932 ?AUTO_11925 ) ( ON ?AUTO_11934 ?AUTO_11932 ) ( CLEAR ?AUTO_11934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11934 ?AUTO_11932 )
      ( MAKE-ON ?AUTO_11925 ?AUTO_11926 ) )
    :id ( 1464 )
    :q-value ( 12 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11937 - BLOCK
      ?AUTO_11938 - BLOCK
    )
    :vars
    (
      ?AUTO_11943 - BLOCK
      ?AUTO_11946 - BLOCK
      ?AUTO_11940 - BLOCK
      ?AUTO_11944 - BLOCK
      ?AUTO_11939 - BLOCK
      ?AUTO_11942 - BLOCK
      ?AUTO_11947 - BLOCK
      ?AUTO_11948 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11943 ?AUTO_11938 ) ( CLEAR ?AUTO_11946 ) ( ON ?AUTO_11940 ?AUTO_11943 ) ( ON ?AUTO_11937 ?AUTO_11940 ) ( CLEAR ?AUTO_11944 ) ( ON ?AUTO_11939 ?AUTO_11937 ) ( ON ?AUTO_11942 ?AUTO_11939 ) ( CLEAR ?AUTO_11942 ) ( HOLDING ?AUTO_11947 ) ( CLEAR ?AUTO_11948 ) )
    :subtasks
    ( ( !STACK ?AUTO_11947 ?AUTO_11948 )
      ( MAKE-ON ?AUTO_11937 ?AUTO_11938 ) )
    :id ( 1465 )
    :q-value ( 13 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12156 - BLOCK
      ?AUTO_12157 - BLOCK
    )
    :vars
    (
      ?AUTO_12159 - BLOCK
      ?AUTO_12162 - BLOCK
      ?AUTO_12164 - BLOCK
      ?AUTO_12165 - BLOCK
      ?AUTO_12163 - BLOCK
      ?AUTO_12158 - BLOCK
      ?AUTO_12166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_12156 ) ( CLEAR ?AUTO_12159 ) ( CLEAR ?AUTO_12162 ) ( ON ?AUTO_12164 ?AUTO_12157 ) ( CLEAR ?AUTO_12165 ) ( ON ?AUTO_12163 ?AUTO_12164 ) ( ON ?AUTO_12158 ?AUTO_12163 ) ( CLEAR ?AUTO_12158 ) ( HOLDING ?AUTO_12166 ) ( CLEAR ?AUTO_12156 ) )
    :subtasks
    ( ( !STACK ?AUTO_12166 ?AUTO_12156 )
      ( MAKE-ON ?AUTO_12156 ?AUTO_12157 ) )
    :id ( 1481 )
    :q-value ( 11.5001 )
    :q-count ( 8 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12169 - BLOCK
      ?AUTO_12170 - BLOCK
    )
    :vars
    (
      ?AUTO_12174 - BLOCK
      ?AUTO_12179 - BLOCK
      ?AUTO_12175 - BLOCK
      ?AUTO_12171 - BLOCK
      ?AUTO_12176 - BLOCK
      ?AUTO_12177 - BLOCK
      ?AUTO_12173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_12169 ) ( CLEAR ?AUTO_12174 ) ( CLEAR ?AUTO_12179 ) ( ON ?AUTO_12175 ?AUTO_12170 ) ( CLEAR ?AUTO_12171 ) ( ON ?AUTO_12176 ?AUTO_12175 ) ( ON ?AUTO_12177 ?AUTO_12176 ) ( CLEAR ?AUTO_12177 ) ( CLEAR ?AUTO_12169 ) ( ON-TABLE ?AUTO_12173 ) ( CLEAR ?AUTO_12173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_12173 )
      ( MAKE-ON ?AUTO_12169 ?AUTO_12170 ) )
    :id ( 1482 )
    :q-value ( 13.3333 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12185 - BLOCK
      ?AUTO_12186 - BLOCK
    )
    :vars
    (
      ?AUTO_12192 - BLOCK
      ?AUTO_12195 - BLOCK
      ?AUTO_12188 - BLOCK
      ?AUTO_12193 - BLOCK
      ?AUTO_12194 - BLOCK
      ?AUTO_12190 - BLOCK
      ?AUTO_12191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_12192 ) ( CLEAR ?AUTO_12195 ) ( ON ?AUTO_12188 ?AUTO_12186 ) ( CLEAR ?AUTO_12193 ) ( ON ?AUTO_12194 ?AUTO_12188 ) ( ON ?AUTO_12190 ?AUTO_12194 ) ( CLEAR ?AUTO_12190 ) ( ON-TABLE ?AUTO_12191 ) ( CLEAR ?AUTO_12191 ) ( HOLDING ?AUTO_12185 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_12185 )
      ( MAKE-ON ?AUTO_12185 ?AUTO_12186 ) )
    :id ( 1483 )
    :q-value ( 13 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12197 - BLOCK
      ?AUTO_12198 - BLOCK
    )
    :vars
    (
      ?AUTO_12203 - BLOCK
      ?AUTO_12205 - BLOCK
      ?AUTO_12206 - BLOCK
      ?AUTO_12202 - BLOCK
      ?AUTO_12201 - BLOCK
      ?AUTO_12207 - BLOCK
      ?AUTO_12204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_12203 ) ( CLEAR ?AUTO_12205 ) ( ON ?AUTO_12206 ?AUTO_12198 ) ( CLEAR ?AUTO_12202 ) ( ON ?AUTO_12201 ?AUTO_12206 ) ( ON ?AUTO_12207 ?AUTO_12201 ) ( CLEAR ?AUTO_12207 ) ( ON-TABLE ?AUTO_12204 ) ( ON ?AUTO_12197 ?AUTO_12204 ) ( CLEAR ?AUTO_12197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_12197 ?AUTO_12204 )
      ( MAKE-ON ?AUTO_12197 ?AUTO_12198 ) )
    :id ( 1484 )
    :q-value ( 14 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12210 - BLOCK
      ?AUTO_12211 - BLOCK
    )
    :vars
    (
      ?AUTO_12217 - BLOCK
      ?AUTO_12215 - BLOCK
      ?AUTO_12212 - BLOCK
      ?AUTO_12216 - BLOCK
      ?AUTO_12219 - BLOCK
      ?AUTO_12218 - BLOCK
      ?AUTO_12220 - BLOCK
      ?AUTO_12221 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_12217 ) ( CLEAR ?AUTO_12215 ) ( ON ?AUTO_12212 ?AUTO_12211 ) ( CLEAR ?AUTO_12216 ) ( ON ?AUTO_12219 ?AUTO_12212 ) ( ON ?AUTO_12218 ?AUTO_12219 ) ( CLEAR ?AUTO_12218 ) ( ON-TABLE ?AUTO_12220 ) ( ON ?AUTO_12210 ?AUTO_12220 ) ( CLEAR ?AUTO_12210 ) ( HOLDING ?AUTO_12221 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_12221 )
      ( MAKE-ON ?AUTO_12210 ?AUTO_12211 ) )
    :id ( 1485 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12222 - BLOCK
      ?AUTO_12223 - BLOCK
    )
    :vars
    (
      ?AUTO_12226 - BLOCK
      ?AUTO_12228 - BLOCK
      ?AUTO_12225 - BLOCK
      ?AUTO_12229 - BLOCK
      ?AUTO_12233 - BLOCK
      ?AUTO_12230 - BLOCK
      ?AUTO_12231 - BLOCK
      ?AUTO_12224 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_12226 ) ( CLEAR ?AUTO_12228 ) ( ON ?AUTO_12225 ?AUTO_12223 ) ( CLEAR ?AUTO_12229 ) ( ON ?AUTO_12233 ?AUTO_12225 ) ( ON ?AUTO_12230 ?AUTO_12233 ) ( CLEAR ?AUTO_12230 ) ( ON-TABLE ?AUTO_12231 ) ( ON ?AUTO_12222 ?AUTO_12231 ) ( ON ?AUTO_12224 ?AUTO_12222 ) ( CLEAR ?AUTO_12224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_12224 ?AUTO_12222 )
      ( MAKE-ON ?AUTO_12222 ?AUTO_12223 ) )
    :id ( 1486 )
    :q-value ( 16 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12236 - BLOCK
      ?AUTO_12237 - BLOCK
    )
    :vars
    (
      ?AUTO_12240 - BLOCK
      ?AUTO_12242 - BLOCK
      ?AUTO_12238 - BLOCK
      ?AUTO_12243 - BLOCK
      ?AUTO_12246 - BLOCK
      ?AUTO_12244 - BLOCK
      ?AUTO_12239 - BLOCK
      ?AUTO_12245 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_12240 ) ( CLEAR ?AUTO_12242 ) ( ON ?AUTO_12238 ?AUTO_12237 ) ( CLEAR ?AUTO_12243 ) ( ON ?AUTO_12246 ?AUTO_12238 ) ( ON-TABLE ?AUTO_12244 ) ( ON ?AUTO_12236 ?AUTO_12244 ) ( ON ?AUTO_12239 ?AUTO_12236 ) ( CLEAR ?AUTO_12239 ) ( HOLDING ?AUTO_12245 ) ( CLEAR ?AUTO_12246 ) )
    :subtasks
    ( ( !STACK ?AUTO_12245 ?AUTO_12246 )
      ( MAKE-ON ?AUTO_12236 ?AUTO_12237 ) )
    :id ( 1487 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12250 - BLOCK
      ?AUTO_12251 - BLOCK
    )
    :vars
    (
      ?AUTO_12253 - BLOCK
      ?AUTO_12254 - BLOCK
      ?AUTO_12255 - BLOCK
      ?AUTO_12256 - BLOCK
      ?AUTO_12261 - BLOCK
      ?AUTO_12260 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_12253 ?AUTO_12251 ) ( ON ?AUTO_12254 ?AUTO_12253 ) ( ON-TABLE ?AUTO_12255 ) ( ON ?AUTO_12250 ?AUTO_12255 ) ( ON ?AUTO_12256 ?AUTO_12250 ) ( CLEAR ?AUTO_12256 ) ( CLEAR ?AUTO_12254 ) ( ON ?AUTO_12261 ?AUTO_12260 ) ( CLEAR ?AUTO_12261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_12261 ?AUTO_12260 )
      ( MAKE-ON ?AUTO_12250 ?AUTO_12251 ) )
    :id ( 1488 )
    :q-value ( 18 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12413 - BLOCK
      ?AUTO_12414 - BLOCK
    )
    :vars
    (
      ?AUTO_12418 - BLOCK
      ?AUTO_12419 - BLOCK
      ?AUTO_12417 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_12418 ?AUTO_12414 ) ( ON ?AUTO_12419 ?AUTO_12418 ) ( ON ?AUTO_12413 ?AUTO_12419 ) ( CLEAR ?AUTO_12413 ) ( HOLDING ?AUTO_12417 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_12417 )
      ( MAKE-ON ?AUTO_12413 ?AUTO_12414 ) )
    :id ( 1514 )
    :q-value ( 9.42857 )
    :q-count ( 14 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12718 - BLOCK
      ?AUTO_12719 - BLOCK
    )
    :vars
    (
      ?AUTO_12722 - BLOCK
      ?AUTO_12724 - BLOCK
      ?AUTO_12725 - BLOCK
      ?AUTO_12723 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_12722 ?AUTO_12719 ) ( ON ?AUTO_12724 ?AUTO_12722 ) ( ON ?AUTO_12725 ?AUTO_12724 ) ( CLEAR ?AUTO_12725 ) ( CLEAR ?AUTO_12723 ) ( ON-TABLE ?AUTO_12718 ) ( CLEAR ?AUTO_12718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_12718 )
      ( MAKE-ON ?AUTO_12718 ?AUTO_12719 ) )
    :id ( 1555 )
    :q-value ( 10.4 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12953 - BLOCK
      ?AUTO_12954 - BLOCK
    )
    :vars
    (
      ?AUTO_12960 - BLOCK
      ?AUTO_12957 - BLOCK
      ?AUTO_12958 - BLOCK
      ?AUTO_12961 - BLOCK
      ?AUTO_12955 - BLOCK
      ?AUTO_12963 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_12953 ?AUTO_12960 ) ( ON ?AUTO_12957 ?AUTO_12953 ) ( ON ?AUTO_12958 ?AUTO_12957 ) ( CLEAR ?AUTO_12958 ) ( ON ?AUTO_12961 ?AUTO_12954 ) ( CLEAR ?AUTO_12961 ) ( HOLDING ?AUTO_12955 ) ( CLEAR ?AUTO_12963 ) )
    :subtasks
    ( ( !STACK ?AUTO_12955 ?AUTO_12963 )
      ( MAKE-ON ?AUTO_12953 ?AUTO_12954 ) )
    :id ( 1577 )
    :q-value ( 9.44444 )
    :q-count ( 9 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12976 - BLOCK
      ?AUTO_12977 - BLOCK
    )
    :vars
    (
      ?AUTO_12985 - BLOCK
      ?AUTO_12983 - BLOCK
      ?AUTO_12978 - BLOCK
      ?AUTO_12984 - BLOCK
      ?AUTO_12982 - BLOCK
      ?AUTO_12979 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_12976 ?AUTO_12985 ) ( ON ?AUTO_12983 ?AUTO_12976 ) ( ON ?AUTO_12978 ?AUTO_12983 ) ( CLEAR ?AUTO_12978 ) ( ON ?AUTO_12984 ?AUTO_12977 ) ( ON ?AUTO_12982 ?AUTO_12984 ) ( CLEAR ?AUTO_12982 ) ( HOLDING ?AUTO_12979 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_12979 )
      ( MAKE-ON ?AUTO_12976 ?AUTO_12977 ) )
    :id ( 1579 )
    :q-value ( 11.7501 )
    :q-count ( 8 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12987 - BLOCK
      ?AUTO_12988 - BLOCK
    )
    :vars
    (
      ?AUTO_12992 - BLOCK
      ?AUTO_12996 - BLOCK
      ?AUTO_12995 - BLOCK
      ?AUTO_12993 - BLOCK
      ?AUTO_12990 - BLOCK
      ?AUTO_12989 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_12987 ?AUTO_12992 ) ( ON ?AUTO_12996 ?AUTO_12987 ) ( ON ?AUTO_12995 ?AUTO_12996 ) ( CLEAR ?AUTO_12995 ) ( ON ?AUTO_12993 ?AUTO_12988 ) ( ON ?AUTO_12990 ?AUTO_12993 ) ( ON ?AUTO_12989 ?AUTO_12990 ) ( CLEAR ?AUTO_12989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_12989 ?AUTO_12990 )
      ( MAKE-ON ?AUTO_12987 ?AUTO_12988 ) )
    :id ( 1580 )
    :q-value ( 13.1429 )
    :q-count ( 7 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_12999 - BLOCK
      ?AUTO_13000 - BLOCK
    )
    :vars
    (
      ?AUTO_13006 - BLOCK
      ?AUTO_13004 - BLOCK
      ?AUTO_13005 - BLOCK
      ?AUTO_13003 - BLOCK
      ?AUTO_13008 - BLOCK
      ?AUTO_13002 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_12999 ?AUTO_13006 ) ( ON ?AUTO_13004 ?AUTO_12999 ) ( ON ?AUTO_13005 ?AUTO_13000 ) ( ON ?AUTO_13003 ?AUTO_13005 ) ( ON ?AUTO_13008 ?AUTO_13003 ) ( CLEAR ?AUTO_13008 ) ( HOLDING ?AUTO_13002 ) ( CLEAR ?AUTO_13004 ) )
    :subtasks
    ( ( !STACK ?AUTO_13002 ?AUTO_13004 )
      ( MAKE-ON ?AUTO_12999 ?AUTO_13000 ) )
    :id ( 1581 )
    :q-value ( 15 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_13011 - BLOCK
      ?AUTO_13012 - BLOCK
    )
    :vars
    (
      ?AUTO_13018 - BLOCK
      ?AUTO_13019 - BLOCK
      ?AUTO_13020 - BLOCK
      ?AUTO_13016 - BLOCK
      ?AUTO_13017 - BLOCK
      ?AUTO_13013 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_13011 ?AUTO_13018 ) ( ON ?AUTO_13019 ?AUTO_13011 ) ( ON ?AUTO_13020 ?AUTO_13012 ) ( ON ?AUTO_13016 ?AUTO_13020 ) ( ON ?AUTO_13017 ?AUTO_13016 ) ( CLEAR ?AUTO_13017 ) ( CLEAR ?AUTO_13019 ) ( ON-TABLE ?AUTO_13013 ) ( CLEAR ?AUTO_13013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_13013 )
      ( MAKE-ON ?AUTO_13011 ?AUTO_13012 ) )
    :id ( 1582 )
    :q-value ( 16 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_13022 - BLOCK
      ?AUTO_13023 - BLOCK
    )
    :vars
    (
      ?AUTO_13026 - BLOCK
      ?AUTO_13029 - BLOCK
      ?AUTO_13031 - BLOCK
      ?AUTO_13030 - BLOCK
      ?AUTO_13027 - BLOCK
      ?AUTO_13028 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_13022 ?AUTO_13026 ) ( ON ?AUTO_13029 ?AUTO_13023 ) ( ON ?AUTO_13031 ?AUTO_13029 ) ( ON ?AUTO_13030 ?AUTO_13031 ) ( CLEAR ?AUTO_13030 ) ( ON-TABLE ?AUTO_13027 ) ( CLEAR ?AUTO_13027 ) ( HOLDING ?AUTO_13028 ) ( CLEAR ?AUTO_13022 ) )
    :subtasks
    ( ( !STACK ?AUTO_13028 ?AUTO_13022 )
      ( MAKE-ON ?AUTO_13022 ?AUTO_13023 ) )
    :id ( 1583 )
    :q-value ( 17 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_13091 - BLOCK
    )
    :vars
    (
      ?AUTO_13092 - BLOCK
      ?AUTO_13093 - BLOCK
      ?AUTO_13096 - BLOCK
      ?AUTO_13094 - BLOCK
      ?AUTO_13095 - BLOCK
      ?AUTO_13099 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_13091 ?AUTO_13092 ) ( ON ?AUTO_13093 ?AUTO_13091 ) ( ON ?AUTO_13096 ?AUTO_13093 ) ( ON ?AUTO_13094 ?AUTO_13096 ) ( CLEAR ?AUTO_13094 ) ( HOLDING ?AUTO_13095 ) ( CLEAR ?AUTO_13099 ) )
    :subtasks
    ( ( !STACK ?AUTO_13095 ?AUTO_13099 )
      ( MAKE-ON-TABLE ?AUTO_13091 ) )
    :id ( 1592 )
    :q-value ( 9 )
    :q-count ( 30 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_13287 - BLOCK
      ?AUTO_13288 - BLOCK
    )
    :vars
    (
      ?AUTO_13293 - BLOCK
      ?AUTO_13291 - BLOCK
      ?AUTO_13294 - BLOCK
      ?AUTO_13295 - BLOCK
      ?AUTO_13297 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_13293 ?AUTO_13288 ) ( ON ?AUTO_13291 ?AUTO_13293 ) ( ON ?AUTO_13287 ?AUTO_13291 ) ( ON ?AUTO_13294 ?AUTO_13287 ) ( CLEAR ?AUTO_13294 ) ( HOLDING ?AUTO_13295 ) ( CLEAR ?AUTO_13297 ) )
    :subtasks
    ( ( !STACK ?AUTO_13295 ?AUTO_13297 )
      ( MAKE-ON ?AUTO_13287 ?AUTO_13288 ) )
    :id ( 1614 )
    :q-value ( 12 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_13831 - BLOCK
      ?AUTO_13832 - BLOCK
    )
    :vars
    (
      ?AUTO_13833 - BLOCK
      ?AUTO_13837 - BLOCK
      ?AUTO_13836 - BLOCK
      ?AUTO_13834 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_13831 ?AUTO_13833 ) ( ON ?AUTO_13837 ?AUTO_13832 ) ( ON ?AUTO_13836 ?AUTO_13837 ) ( CLEAR ?AUTO_13836 ) ( HOLDING ?AUTO_13834 ) ( CLEAR ?AUTO_13831 ) )
    :subtasks
    ( ( !STACK ?AUTO_13834 ?AUTO_13831 )
      ( MAKE-ON ?AUTO_13831 ?AUTO_13832 ) )
    :id ( 1640 )
    :q-value ( 9.99997 )
    :q-count ( 20 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_13902 - BLOCK
      ?AUTO_13903 - BLOCK
    )
    :vars
    (
      ?AUTO_13906 - BLOCK
      ?AUTO_13907 - BLOCK
      ?AUTO_13910 - BLOCK
      ?AUTO_13909 - BLOCK
      ?AUTO_13911 - BLOCK
      ?AUTO_13904 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_13906 ?AUTO_13903 ) ( ON ?AUTO_13907 ?AUTO_13906 ) ( ON ?AUTO_13910 ?AUTO_13907 ) ( CLEAR ?AUTO_13910 ) ( ON-TABLE ?AUTO_13902 ) ( ON ?AUTO_13909 ?AUTO_13902 ) ( CLEAR ?AUTO_13911 ) ( ON ?AUTO_13904 ?AUTO_13909 ) ( CLEAR ?AUTO_13904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_13904 ?AUTO_13909 )
      ( MAKE-ON ?AUTO_13902 ?AUTO_13903 ) )
    :id ( 1647 )
    :q-value ( 13.8182 )
    :q-count ( 11 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_13937 - BLOCK
      ?AUTO_13938 - BLOCK
    )
    :vars
    (
      ?AUTO_13942 - BLOCK
      ?AUTO_13940 - BLOCK
      ?AUTO_13943 - BLOCK
      ?AUTO_13941 - BLOCK
      ?AUTO_13945 - BLOCK
      ?AUTO_13939 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_13942 ?AUTO_13938 ) ( ON ?AUTO_13940 ?AUTO_13942 ) ( ON-TABLE ?AUTO_13937 ) ( ON ?AUTO_13943 ?AUTO_13937 ) ( ON ?AUTO_13941 ?AUTO_13943 ) ( ON ?AUTO_13945 ?AUTO_13941 ) ( CLEAR ?AUTO_13945 ) ( HOLDING ?AUTO_13939 ) ( CLEAR ?AUTO_13940 ) )
    :subtasks
    ( ( !STACK ?AUTO_13939 ?AUTO_13940 )
      ( MAKE-ON ?AUTO_13937 ?AUTO_13938 ) )
    :id ( 1650 )
    :q-value ( 19 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_13949 - BLOCK
      ?AUTO_13950 - BLOCK
    )
    :vars
    (
      ?AUTO_13951 - BLOCK
      ?AUTO_13958 - BLOCK
      ?AUTO_13957 - BLOCK
      ?AUTO_13952 - BLOCK
      ?AUTO_13954 - BLOCK
      ?AUTO_13953 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_13951 ?AUTO_13950 ) ( ON ?AUTO_13958 ?AUTO_13951 ) ( ON-TABLE ?AUTO_13949 ) ( ON ?AUTO_13957 ?AUTO_13949 ) ( ON ?AUTO_13952 ?AUTO_13957 ) ( ON ?AUTO_13954 ?AUTO_13952 ) ( CLEAR ?AUTO_13954 ) ( CLEAR ?AUTO_13958 ) ( ON-TABLE ?AUTO_13953 ) ( CLEAR ?AUTO_13953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_13953 )
      ( MAKE-ON ?AUTO_13949 ?AUTO_13950 ) )
    :id ( 1651 )
    :q-value ( 20 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_13960 - BLOCK
      ?AUTO_13961 - BLOCK
    )
    :vars
    (
      ?AUTO_13968 - BLOCK
      ?AUTO_13963 - BLOCK
      ?AUTO_13969 - BLOCK
      ?AUTO_13965 - BLOCK
      ?AUTO_13962 - BLOCK
      ?AUTO_13964 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_13968 ?AUTO_13961 ) ( ON-TABLE ?AUTO_13960 ) ( ON ?AUTO_13963 ?AUTO_13960 ) ( ON ?AUTO_13969 ?AUTO_13963 ) ( ON ?AUTO_13965 ?AUTO_13969 ) ( CLEAR ?AUTO_13965 ) ( ON-TABLE ?AUTO_13962 ) ( CLEAR ?AUTO_13962 ) ( HOLDING ?AUTO_13964 ) ( CLEAR ?AUTO_13968 ) )
    :subtasks
    ( ( !STACK ?AUTO_13964 ?AUTO_13968 )
      ( MAKE-ON ?AUTO_13960 ?AUTO_13961 ) )
    :id ( 1652 )
    :q-value ( 21 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_13972 - BLOCK
      ?AUTO_13973 - BLOCK
    )
    :vars
    (
      ?AUTO_13981 - BLOCK
      ?AUTO_13979 - BLOCK
      ?AUTO_13978 - BLOCK
      ?AUTO_13976 - BLOCK
      ?AUTO_13980 - BLOCK
      ?AUTO_13974 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_13981 ?AUTO_13973 ) ( ON-TABLE ?AUTO_13972 ) ( ON ?AUTO_13979 ?AUTO_13972 ) ( ON ?AUTO_13978 ?AUTO_13979 ) ( ON ?AUTO_13976 ?AUTO_13978 ) ( CLEAR ?AUTO_13976 ) ( ON-TABLE ?AUTO_13980 ) ( CLEAR ?AUTO_13981 ) ( ON ?AUTO_13974 ?AUTO_13980 ) ( CLEAR ?AUTO_13974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_13974 ?AUTO_13980 )
      ( MAKE-ON ?AUTO_13972 ?AUTO_13973 ) )
    :id ( 1653 )
    :q-value ( 22 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14595 - BLOCK
      ?AUTO_14596 - BLOCK
    )
    :vars
    (
      ?AUTO_14598 - BLOCK
      ?AUTO_14604 - BLOCK
      ?AUTO_14597 - BLOCK
      ?AUTO_14599 - BLOCK
      ?AUTO_14605 - BLOCK
      ?AUTO_14600 - BLOCK
      ?AUTO_14601 - BLOCK
      ?AUTO_14607 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_14596 ) ( ON-TABLE ?AUTO_14595 ) ( ON ?AUTO_14598 ?AUTO_14595 ) ( CLEAR ?AUTO_14604 ) ( ON ?AUTO_14597 ?AUTO_14598 ) ( CLEAR ?AUTO_14599 ) ( ON ?AUTO_14605 ?AUTO_14597 ) ( ON ?AUTO_14600 ?AUTO_14605 ) ( CLEAR ?AUTO_14600 ) ( HOLDING ?AUTO_14601 ) ( CLEAR ?AUTO_14607 ) )
    :subtasks
    ( ( !STACK ?AUTO_14601 ?AUTO_14607 )
      ( MAKE-ON ?AUTO_14595 ?AUTO_14596 ) )
    :id ( 1686 )
    :q-value ( 12.4666 )
    :q-count ( 15 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14634 - BLOCK
      ?AUTO_14635 - BLOCK
    )
    :vars
    (
      ?AUTO_14642 - BLOCK
      ?AUTO_14641 - BLOCK
      ?AUTO_14644 - BLOCK
      ?AUTO_14645 - BLOCK
      ?AUTO_14643 - BLOCK
      ?AUTO_14639 - BLOCK
      ?AUTO_14637 - BLOCK
      ?AUTO_14638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14634 ) ( ON ?AUTO_14642 ?AUTO_14634 ) ( CLEAR ?AUTO_14641 ) ( ON ?AUTO_14644 ?AUTO_14642 ) ( CLEAR ?AUTO_14645 ) ( ON ?AUTO_14643 ?AUTO_14644 ) ( ON ?AUTO_14639 ?AUTO_14643 ) ( CLEAR ?AUTO_14639 ) ( CLEAR ?AUTO_14637 ) ( ON ?AUTO_14638 ?AUTO_14635 ) ( CLEAR ?AUTO_14638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_14638 ?AUTO_14635 )
      ( MAKE-ON ?AUTO_14634 ?AUTO_14635 ) )
    :id ( 1688 )
    :q-value ( 13.1427 )
    :q-count ( 21 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14648 - BLOCK
      ?AUTO_14649 - BLOCK
    )
    :vars
    (
      ?AUTO_14650 - BLOCK
      ?AUTO_14659 - BLOCK
      ?AUTO_14656 - BLOCK
      ?AUTO_14654 - BLOCK
      ?AUTO_14655 - BLOCK
      ?AUTO_14652 - BLOCK
      ?AUTO_14658 - BLOCK
      ?AUTO_14651 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14648 ) ( ON ?AUTO_14650 ?AUTO_14648 ) ( CLEAR ?AUTO_14659 ) ( ON ?AUTO_14656 ?AUTO_14650 ) ( CLEAR ?AUTO_14654 ) ( ON ?AUTO_14655 ?AUTO_14656 ) ( CLEAR ?AUTO_14652 ) ( ON ?AUTO_14658 ?AUTO_14649 ) ( CLEAR ?AUTO_14658 ) ( HOLDING ?AUTO_14651 ) ( CLEAR ?AUTO_14655 ) )
    :subtasks
    ( ( !STACK ?AUTO_14651 ?AUTO_14655 )
      ( MAKE-ON ?AUTO_14648 ?AUTO_14649 ) )
    :id ( 1689 )
    :q-value ( 14.6667 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14676 - BLOCK
      ?AUTO_14677 - BLOCK
    )
    :vars
    (
      ?AUTO_14680 - BLOCK
      ?AUTO_14684 - BLOCK
      ?AUTO_14681 - BLOCK
      ?AUTO_14683 - BLOCK
      ?AUTO_14682 - BLOCK
      ?AUTO_14679 - BLOCK
      ?AUTO_14689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14676 ) ( ON ?AUTO_14680 ?AUTO_14676 ) ( ON ?AUTO_14684 ?AUTO_14680 ) ( ON ?AUTO_14681 ?AUTO_14684 ) ( ON ?AUTO_14683 ?AUTO_14677 ) ( CLEAR ?AUTO_14681 ) ( ON ?AUTO_14682 ?AUTO_14683 ) ( CLEAR ?AUTO_14682 ) ( HOLDING ?AUTO_14679 ) ( CLEAR ?AUTO_14689 ) )
    :subtasks
    ( ( !STACK ?AUTO_14679 ?AUTO_14689 )
      ( MAKE-ON ?AUTO_14676 ?AUTO_14677 ) )
    :id ( 1691 )
    :q-value ( 14 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14690 - BLOCK
      ?AUTO_14691 - BLOCK
    )
    :vars
    (
      ?AUTO_14693 - BLOCK
      ?AUTO_14698 - BLOCK
      ?AUTO_14696 - BLOCK
      ?AUTO_14692 - BLOCK
      ?AUTO_14694 - BLOCK
      ?AUTO_14700 - BLOCK
      ?AUTO_14697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14690 ) ( ON ?AUTO_14693 ?AUTO_14690 ) ( ON ?AUTO_14698 ?AUTO_14693 ) ( ON ?AUTO_14696 ?AUTO_14698 ) ( ON ?AUTO_14692 ?AUTO_14691 ) ( ON ?AUTO_14694 ?AUTO_14692 ) ( CLEAR ?AUTO_14694 ) ( CLEAR ?AUTO_14700 ) ( ON ?AUTO_14697 ?AUTO_14696 ) ( CLEAR ?AUTO_14697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_14697 ?AUTO_14696 )
      ( MAKE-ON ?AUTO_14690 ?AUTO_14691 ) )
    :id ( 1692 )
    :q-value ( 15.2 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14703 - BLOCK
      ?AUTO_14704 - BLOCK
    )
    :vars
    (
      ?AUTO_14705 - BLOCK
      ?AUTO_14713 - BLOCK
      ?AUTO_14706 - BLOCK
      ?AUTO_14710 - BLOCK
      ?AUTO_14709 - BLOCK
      ?AUTO_14708 - BLOCK
      ?AUTO_14707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14703 ) ( ON ?AUTO_14705 ?AUTO_14703 ) ( ON ?AUTO_14713 ?AUTO_14705 ) ( ON ?AUTO_14706 ?AUTO_14713 ) ( ON ?AUTO_14710 ?AUTO_14704 ) ( ON ?AUTO_14709 ?AUTO_14710 ) ( CLEAR ?AUTO_14709 ) ( ON ?AUTO_14708 ?AUTO_14706 ) ( CLEAR ?AUTO_14708 ) ( HOLDING ?AUTO_14707 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_14707 )
      ( MAKE-ON ?AUTO_14703 ?AUTO_14704 ) )
    :id ( 1693 )
    :q-value ( 16 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14715 - BLOCK
      ?AUTO_14716 - BLOCK
    )
    :vars
    (
      ?AUTO_14717 - BLOCK
      ?AUTO_14719 - BLOCK
      ?AUTO_14718 - BLOCK
      ?AUTO_14722 - BLOCK
      ?AUTO_14724 - BLOCK
      ?AUTO_14725 - BLOCK
      ?AUTO_14720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14715 ) ( ON ?AUTO_14717 ?AUTO_14715 ) ( ON ?AUTO_14719 ?AUTO_14717 ) ( ON ?AUTO_14718 ?AUTO_14719 ) ( ON ?AUTO_14722 ?AUTO_14716 ) ( ON ?AUTO_14724 ?AUTO_14722 ) ( ON ?AUTO_14725 ?AUTO_14718 ) ( CLEAR ?AUTO_14725 ) ( ON ?AUTO_14720 ?AUTO_14724 ) ( CLEAR ?AUTO_14720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_14720 ?AUTO_14724 )
      ( MAKE-ON ?AUTO_14715 ?AUTO_14716 ) )
    :id ( 1694 )
    :q-value ( 17 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14728 - BLOCK
      ?AUTO_14729 - BLOCK
    )
    :vars
    (
      ?AUTO_14730 - BLOCK
      ?AUTO_14732 - BLOCK
      ?AUTO_14738 - BLOCK
      ?AUTO_14737 - BLOCK
      ?AUTO_14736 - BLOCK
      ?AUTO_14731 - BLOCK
      ?AUTO_14734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14728 ) ( ON ?AUTO_14730 ?AUTO_14728 ) ( ON ?AUTO_14732 ?AUTO_14730 ) ( ON ?AUTO_14738 ?AUTO_14732 ) ( ON ?AUTO_14737 ?AUTO_14729 ) ( ON ?AUTO_14736 ?AUTO_14737 ) ( ON ?AUTO_14731 ?AUTO_14736 ) ( CLEAR ?AUTO_14731 ) ( HOLDING ?AUTO_14734 ) ( CLEAR ?AUTO_14738 ) )
    :subtasks
    ( ( !STACK ?AUTO_14734 ?AUTO_14738 )
      ( MAKE-ON ?AUTO_14728 ?AUTO_14729 ) )
    :id ( 1695 )
    :q-value ( 19 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14741 - BLOCK
      ?AUTO_14742 - BLOCK
    )
    :vars
    (
      ?AUTO_14745 - BLOCK
      ?AUTO_14743 - BLOCK
      ?AUTO_14747 - BLOCK
      ?AUTO_14748 - BLOCK
      ?AUTO_14751 - BLOCK
      ?AUTO_14744 - BLOCK
      ?AUTO_14750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14741 ) ( ON ?AUTO_14745 ?AUTO_14741 ) ( ON ?AUTO_14743 ?AUTO_14745 ) ( ON ?AUTO_14747 ?AUTO_14743 ) ( ON ?AUTO_14748 ?AUTO_14742 ) ( ON ?AUTO_14751 ?AUTO_14748 ) ( ON ?AUTO_14744 ?AUTO_14751 ) ( CLEAR ?AUTO_14747 ) ( ON ?AUTO_14750 ?AUTO_14744 ) ( CLEAR ?AUTO_14750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_14750 ?AUTO_14744 )
      ( MAKE-ON ?AUTO_14741 ?AUTO_14742 ) )
    :id ( 1696 )
    :q-value ( 19 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14754 - BLOCK
      ?AUTO_14755 - BLOCK
    )
    :vars
    (
      ?AUTO_14761 - BLOCK
      ?AUTO_14764 - BLOCK
      ?AUTO_14760 - BLOCK
      ?AUTO_14763 - BLOCK
      ?AUTO_14762 - BLOCK
      ?AUTO_14756 - BLOCK
      ?AUTO_14759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14754 ) ( ON ?AUTO_14761 ?AUTO_14754 ) ( ON ?AUTO_14764 ?AUTO_14761 ) ( ON ?AUTO_14760 ?AUTO_14755 ) ( ON ?AUTO_14763 ?AUTO_14760 ) ( ON ?AUTO_14762 ?AUTO_14763 ) ( ON ?AUTO_14756 ?AUTO_14762 ) ( CLEAR ?AUTO_14756 ) ( HOLDING ?AUTO_14759 ) ( CLEAR ?AUTO_14764 ) )
    :subtasks
    ( ( !STACK ?AUTO_14759 ?AUTO_14764 )
      ( MAKE-ON ?AUTO_14754 ?AUTO_14755 ) )
    :id ( 1697 )
    :q-value ( 21 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14767 - BLOCK
      ?AUTO_14768 - BLOCK
    )
    :vars
    (
      ?AUTO_14776 - BLOCK
      ?AUTO_14774 - BLOCK
      ?AUTO_14775 - BLOCK
      ?AUTO_14772 - BLOCK
      ?AUTO_14770 - BLOCK
      ?AUTO_14773 - BLOCK
      ?AUTO_14771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14767 ) ( ON ?AUTO_14776 ?AUTO_14767 ) ( ON ?AUTO_14774 ?AUTO_14776 ) ( ON ?AUTO_14775 ?AUTO_14768 ) ( ON ?AUTO_14772 ?AUTO_14775 ) ( ON ?AUTO_14770 ?AUTO_14772 ) ( ON ?AUTO_14773 ?AUTO_14770 ) ( CLEAR ?AUTO_14773 ) ( CLEAR ?AUTO_14774 ) ( ON-TABLE ?AUTO_14771 ) ( CLEAR ?AUTO_14771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_14771 )
      ( MAKE-ON ?AUTO_14767 ?AUTO_14768 ) )
    :id ( 1698 )
    :q-value ( 22 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14779 - BLOCK
      ?AUTO_14780 - BLOCK
    )
    :vars
    (
      ?AUTO_14787 - BLOCK
      ?AUTO_14789 - BLOCK
      ?AUTO_14784 - BLOCK
      ?AUTO_14781 - BLOCK
      ?AUTO_14786 - BLOCK
      ?AUTO_14783 - BLOCK
      ?AUTO_14785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14779 ) ( ON ?AUTO_14787 ?AUTO_14779 ) ( ON ?AUTO_14789 ?AUTO_14780 ) ( ON ?AUTO_14784 ?AUTO_14789 ) ( ON ?AUTO_14781 ?AUTO_14784 ) ( ON ?AUTO_14786 ?AUTO_14781 ) ( CLEAR ?AUTO_14786 ) ( ON-TABLE ?AUTO_14783 ) ( CLEAR ?AUTO_14783 ) ( HOLDING ?AUTO_14785 ) ( CLEAR ?AUTO_14787 ) )
    :subtasks
    ( ( !STACK ?AUTO_14785 ?AUTO_14787 )
      ( MAKE-ON ?AUTO_14779 ?AUTO_14780 ) )
    :id ( 1699 )
    :q-value ( 23 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14792 - BLOCK
      ?AUTO_14793 - BLOCK
    )
    :vars
    (
      ?AUTO_14799 - BLOCK
      ?AUTO_14802 - BLOCK
      ?AUTO_14800 - BLOCK
      ?AUTO_14798 - BLOCK
      ?AUTO_14796 - BLOCK
      ?AUTO_14801 - BLOCK
      ?AUTO_14794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14792 ) ( ON ?AUTO_14799 ?AUTO_14792 ) ( ON ?AUTO_14802 ?AUTO_14793 ) ( ON ?AUTO_14800 ?AUTO_14802 ) ( ON ?AUTO_14798 ?AUTO_14800 ) ( ON ?AUTO_14796 ?AUTO_14798 ) ( CLEAR ?AUTO_14796 ) ( ON-TABLE ?AUTO_14801 ) ( CLEAR ?AUTO_14799 ) ( ON ?AUTO_14794 ?AUTO_14801 ) ( CLEAR ?AUTO_14794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_14794 ?AUTO_14801 )
      ( MAKE-ON ?AUTO_14792 ?AUTO_14793 ) )
    :id ( 1700 )
    :q-value ( 24 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14805 - BLOCK
      ?AUTO_14806 - BLOCK
    )
    :vars
    (
      ?AUTO_14812 - BLOCK
      ?AUTO_14810 - BLOCK
      ?AUTO_14811 - BLOCK
      ?AUTO_14807 - BLOCK
      ?AUTO_14814 - BLOCK
      ?AUTO_14813 - BLOCK
      ?AUTO_14809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14805 ) ( ON ?AUTO_14812 ?AUTO_14806 ) ( ON ?AUTO_14810 ?AUTO_14812 ) ( ON ?AUTO_14811 ?AUTO_14810 ) ( ON ?AUTO_14807 ?AUTO_14811 ) ( CLEAR ?AUTO_14807 ) ( ON-TABLE ?AUTO_14814 ) ( ON ?AUTO_14813 ?AUTO_14814 ) ( CLEAR ?AUTO_14813 ) ( HOLDING ?AUTO_14809 ) ( CLEAR ?AUTO_14805 ) )
    :subtasks
    ( ( !STACK ?AUTO_14809 ?AUTO_14805 )
      ( MAKE-ON ?AUTO_14805 ?AUTO_14806 ) )
    :id ( 1701 )
    :q-value ( 25 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14818 - BLOCK
      ?AUTO_14819 - BLOCK
    )
    :vars
    (
      ?AUTO_14820 - BLOCK
      ?AUTO_14822 - BLOCK
      ?AUTO_14828 - BLOCK
      ?AUTO_14827 - BLOCK
      ?AUTO_14825 - BLOCK
      ?AUTO_14823 - BLOCK
      ?AUTO_14824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_14818 ) ( ON ?AUTO_14820 ?AUTO_14819 ) ( ON ?AUTO_14822 ?AUTO_14820 ) ( ON ?AUTO_14828 ?AUTO_14822 ) ( ON ?AUTO_14827 ?AUTO_14828 ) ( CLEAR ?AUTO_14827 ) ( ON-TABLE ?AUTO_14825 ) ( ON ?AUTO_14823 ?AUTO_14825 ) ( CLEAR ?AUTO_14818 ) ( ON ?AUTO_14824 ?AUTO_14823 ) ( CLEAR ?AUTO_14824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_14824 ?AUTO_14823 )
      ( MAKE-ON ?AUTO_14818 ?AUTO_14819 ) )
    :id ( 1702 )
    :q-value ( 26 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14831 - BLOCK
      ?AUTO_14832 - BLOCK
    )
    :vars
    (
      ?AUTO_14838 - BLOCK
      ?AUTO_14839 - BLOCK
      ?AUTO_14836 - BLOCK
      ?AUTO_14835 - BLOCK
      ?AUTO_14834 - BLOCK
      ?AUTO_14841 - BLOCK
      ?AUTO_14840 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_14838 ?AUTO_14832 ) ( ON ?AUTO_14839 ?AUTO_14838 ) ( ON ?AUTO_14836 ?AUTO_14839 ) ( ON ?AUTO_14835 ?AUTO_14836 ) ( CLEAR ?AUTO_14835 ) ( ON-TABLE ?AUTO_14834 ) ( ON ?AUTO_14841 ?AUTO_14834 ) ( ON ?AUTO_14840 ?AUTO_14841 ) ( CLEAR ?AUTO_14840 ) ( HOLDING ?AUTO_14831 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_14831 )
      ( MAKE-ON ?AUTO_14831 ?AUTO_14832 ) )
    :id ( 1703 )
    :q-value ( 27 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14843 - BLOCK
      ?AUTO_14844 - BLOCK
    )
    :vars
    (
      ?AUTO_14846 - BLOCK
      ?AUTO_14851 - BLOCK
      ?AUTO_14848 - BLOCK
      ?AUTO_14850 - BLOCK
      ?AUTO_14847 - BLOCK
      ?AUTO_14849 - BLOCK
      ?AUTO_14845 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_14846 ?AUTO_14844 ) ( ON ?AUTO_14851 ?AUTO_14846 ) ( ON ?AUTO_14848 ?AUTO_14851 ) ( ON ?AUTO_14850 ?AUTO_14848 ) ( CLEAR ?AUTO_14850 ) ( ON-TABLE ?AUTO_14847 ) ( ON ?AUTO_14849 ?AUTO_14847 ) ( ON ?AUTO_14845 ?AUTO_14849 ) ( ON ?AUTO_14843 ?AUTO_14845 ) ( CLEAR ?AUTO_14843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_14843 ?AUTO_14845 )
      ( MAKE-ON ?AUTO_14843 ?AUTO_14844 ) )
    :id ( 1704 )
    :q-value ( 28 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14856 - BLOCK
      ?AUTO_14857 - BLOCK
    )
    :vars
    (
      ?AUTO_14865 - BLOCK
      ?AUTO_14859 - BLOCK
      ?AUTO_14864 - BLOCK
      ?AUTO_14858 - BLOCK
      ?AUTO_14860 - BLOCK
      ?AUTO_14866 - BLOCK
      ?AUTO_14863 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_14865 ?AUTO_14857 ) ( ON ?AUTO_14859 ?AUTO_14865 ) ( ON ?AUTO_14864 ?AUTO_14859 ) ( ON-TABLE ?AUTO_14858 ) ( ON ?AUTO_14860 ?AUTO_14858 ) ( ON ?AUTO_14866 ?AUTO_14860 ) ( ON ?AUTO_14856 ?AUTO_14866 ) ( CLEAR ?AUTO_14856 ) ( HOLDING ?AUTO_14863 ) ( CLEAR ?AUTO_14864 ) )
    :subtasks
    ( ( !STACK ?AUTO_14863 ?AUTO_14864 )
      ( MAKE-ON ?AUTO_14856 ?AUTO_14857 ) )
    :id ( 1705 )
    :q-value ( 29 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_15055 - BLOCK
      ?AUTO_15056 - BLOCK
    )
    :vars
    (
      ?AUTO_15059 - BLOCK
      ?AUTO_15062 - BLOCK
      ?AUTO_15060 - BLOCK
      ?AUTO_15061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_15055 ) ( ON ?AUTO_15059 ?AUTO_15055 ) ( ON ?AUTO_15056 ?AUTO_15059 ) ( ON ?AUTO_15062 ?AUTO_15056 ) ( CLEAR ?AUTO_15060 ) ( ON ?AUTO_15061 ?AUTO_15062 ) ( CLEAR ?AUTO_15061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_15061 ?AUTO_15062 )
      ( MAKE-ON ?AUTO_15055 ?AUTO_15056 ) )
    :id ( 1735 )
    :q-value ( 10 )
    :q-count ( 18 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_15813 - BLOCK
      ?AUTO_15814 - BLOCK
    )
    :vars
    (
      ?AUTO_15816 - BLOCK
      ?AUTO_15817 - BLOCK
      ?AUTO_15815 - BLOCK
      ?AUTO_15821 - BLOCK
      ?AUTO_15822 - BLOCK
      ?AUTO_15818 - BLOCK
      ?AUTO_15823 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_15813 ?AUTO_15816 ) ( ON ?AUTO_15817 ?AUTO_15813 ) ( CLEAR ?AUTO_15815 ) ( ON ?AUTO_15821 ?AUTO_15817 ) ( ON ?AUTO_15822 ?AUTO_15821 ) ( CLEAR ?AUTO_15822 ) ( CLEAR ?AUTO_15818 ) ( ON ?AUTO_15823 ?AUTO_15814 ) ( CLEAR ?AUTO_15823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_15823 ?AUTO_15814 )
      ( MAKE-ON ?AUTO_15813 ?AUTO_15814 ) )
    :id ( 1798 )
    :q-value ( 10.4001 )
    :q-count ( 10 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_15826 - BLOCK
      ?AUTO_15827 - BLOCK
    )
    :vars
    (
      ?AUTO_15831 - BLOCK
      ?AUTO_15835 - BLOCK
      ?AUTO_15833 - BLOCK
      ?AUTO_15830 - BLOCK
      ?AUTO_15836 - BLOCK
      ?AUTO_15834 - BLOCK
      ?AUTO_15832 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_15826 ?AUTO_15831 ) ( ON ?AUTO_15835 ?AUTO_15826 ) ( CLEAR ?AUTO_15833 ) ( ON ?AUTO_15830 ?AUTO_15835 ) ( CLEAR ?AUTO_15836 ) ( ON ?AUTO_15834 ?AUTO_15827 ) ( CLEAR ?AUTO_15834 ) ( HOLDING ?AUTO_15832 ) ( CLEAR ?AUTO_15830 ) )
    :subtasks
    ( ( !STACK ?AUTO_15832 ?AUTO_15830 )
      ( MAKE-ON ?AUTO_15826 ?AUTO_15827 ) )
    :id ( 1799 )
    :q-value ( 11.6667 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_15839 - BLOCK
      ?AUTO_15840 - BLOCK
    )
    :vars
    (
      ?AUTO_15842 - BLOCK
      ?AUTO_15846 - BLOCK
      ?AUTO_15848 - BLOCK
      ?AUTO_15843 - BLOCK
      ?AUTO_15841 - BLOCK
      ?AUTO_15844 - BLOCK
      ?AUTO_15849 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_15839 ?AUTO_15842 ) ( ON ?AUTO_15846 ?AUTO_15839 ) ( CLEAR ?AUTO_15848 ) ( ON ?AUTO_15843 ?AUTO_15846 ) ( CLEAR ?AUTO_15841 ) ( ON ?AUTO_15844 ?AUTO_15840 ) ( CLEAR ?AUTO_15844 ) ( CLEAR ?AUTO_15843 ) ( ON-TABLE ?AUTO_15849 ) ( CLEAR ?AUTO_15849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_15849 )
      ( MAKE-ON ?AUTO_15839 ?AUTO_15840 ) )
    :id ( 1800 )
    :q-value ( 12 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_16606 - BLOCK
      ?AUTO_16607 - BLOCK
    )
    :vars
    (
      ?AUTO_16612 - BLOCK
      ?AUTO_16610 - BLOCK
      ?AUTO_16608 - BLOCK
      ?AUTO_16614 - BLOCK
      ?AUTO_16611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_16606 ) ( ON ?AUTO_16612 ?AUTO_16607 ) ( CLEAR ?AUTO_16610 ) ( ON ?AUTO_16608 ?AUTO_16606 ) ( ON ?AUTO_16614 ?AUTO_16608 ) ( CLEAR ?AUTO_16614 ) ( CLEAR ?AUTO_16612 ) ( ON-TABLE ?AUTO_16611 ) ( CLEAR ?AUTO_16611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_16611 )
      ( MAKE-ON ?AUTO_16606 ?AUTO_16607 ) )
    :id ( 1824 )
    :q-value ( 13 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_16616 - BLOCK
      ?AUTO_16617 - BLOCK
    )
    :vars
    (
      ?AUTO_16620 - BLOCK
      ?AUTO_16621 - BLOCK
      ?AUTO_16622 - BLOCK
      ?AUTO_16623 - BLOCK
      ?AUTO_16624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_16616 ) ( CLEAR ?AUTO_16620 ) ( ON ?AUTO_16621 ?AUTO_16616 ) ( ON ?AUTO_16622 ?AUTO_16621 ) ( CLEAR ?AUTO_16622 ) ( ON-TABLE ?AUTO_16623 ) ( CLEAR ?AUTO_16623 ) ( HOLDING ?AUTO_16624 ) ( CLEAR ?AUTO_16617 ) )
    :subtasks
    ( ( !STACK ?AUTO_16624 ?AUTO_16617 )
      ( MAKE-ON ?AUTO_16616 ?AUTO_16617 ) )
    :id ( 1825 )
    :q-value ( 14 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_16627 - BLOCK
      ?AUTO_16628 - BLOCK
    )
    :vars
    (
      ?AUTO_16629 - BLOCK
      ?AUTO_16633 - BLOCK
      ?AUTO_16634 - BLOCK
      ?AUTO_16635 - BLOCK
      ?AUTO_16631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_16627 ) ( CLEAR ?AUTO_16629 ) ( ON ?AUTO_16633 ?AUTO_16627 ) ( ON ?AUTO_16634 ?AUTO_16633 ) ( ON-TABLE ?AUTO_16635 ) ( CLEAR ?AUTO_16635 ) ( CLEAR ?AUTO_16628 ) ( ON ?AUTO_16631 ?AUTO_16634 ) ( CLEAR ?AUTO_16631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_16631 ?AUTO_16634 )
      ( MAKE-ON ?AUTO_16627 ?AUTO_16628 ) )
    :id ( 1826 )
    :q-value ( 14 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_16683 - BLOCK
      ?AUTO_16684 - BLOCK
    )
    :vars
    (
      ?AUTO_16685 - BLOCK
      ?AUTO_16687 - BLOCK
      ?AUTO_16692 - BLOCK
      ?AUTO_16686 - BLOCK
      ?AUTO_16693 - BLOCK
      ?AUTO_16690 - BLOCK
      ?AUTO_16691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_16683 ) ( ON ?AUTO_16685 ?AUTO_16683 ) ( ON ?AUTO_16687 ?AUTO_16685 ) ( ON ?AUTO_16692 ?AUTO_16687 ) ( ON ?AUTO_16686 ?AUTO_16692 ) ( CLEAR ?AUTO_16686 ) ( CLEAR ?AUTO_16693 ) ( ON ?AUTO_16690 ?AUTO_16684 ) ( CLEAR ?AUTO_16690 ) ( HOLDING ?AUTO_16691 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_16691 )
      ( MAKE-ON ?AUTO_16683 ?AUTO_16684 ) )
    :id ( 1831 )
    :q-value ( 16.3333 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_16705 - BLOCK
      ?AUTO_16706 - BLOCK
    )
    :vars
    (
      ?AUTO_16709 - BLOCK
      ?AUTO_16711 - BLOCK
      ?AUTO_16713 - BLOCK
      ?AUTO_16708 - BLOCK
      ?AUTO_16707 - BLOCK
      ?AUTO_16715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_16705 ) ( CLEAR ?AUTO_16709 ) ( ON ?AUTO_16711 ?AUTO_16705 ) ( ON ?AUTO_16713 ?AUTO_16711 ) ( ON-TABLE ?AUTO_16708 ) ( CLEAR ?AUTO_16708 ) ( ON ?AUTO_16707 ?AUTO_16713 ) ( CLEAR ?AUTO_16707 ) ( HOLDING ?AUTO_16706 ) ( CLEAR ?AUTO_16715 ) )
    :subtasks
    ( ( !STACK ?AUTO_16706 ?AUTO_16715 )
      ( MAKE-ON ?AUTO_16705 ?AUTO_16706 ) )
    :id ( 1832 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_16748 - BLOCK
      ?AUTO_16749 - BLOCK
    )
    :vars
    (
      ?AUTO_16750 - BLOCK
      ?AUTO_16752 - BLOCK
      ?AUTO_16756 - BLOCK
      ?AUTO_16755 - BLOCK
      ?AUTO_16753 - BLOCK
      ?AUTO_16757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_16748 ) ( ON ?AUTO_16750 ?AUTO_16749 ) ( ON ?AUTO_16752 ?AUTO_16750 ) ( CLEAR ?AUTO_16756 ) ( ON ?AUTO_16755 ?AUTO_16748 ) ( ON ?AUTO_16753 ?AUTO_16752 ) ( CLEAR ?AUTO_16753 ) ( HOLDING ?AUTO_16757 ) ( CLEAR ?AUTO_16755 ) )
    :subtasks
    ( ( !STACK ?AUTO_16757 ?AUTO_16755 )
      ( MAKE-ON ?AUTO_16748 ?AUTO_16749 ) )
    :id ( 1835 )
    :q-value ( 15 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_17128 - BLOCK
      ?AUTO_17129 - BLOCK
    )
    :vars
    (
      ?AUTO_17134 - BLOCK
      ?AUTO_17137 - BLOCK
      ?AUTO_17133 - BLOCK
      ?AUTO_17131 - BLOCK
      ?AUTO_17132 - BLOCK
      ?AUTO_17130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_17128 ) ( ON ?AUTO_17134 ?AUTO_17129 ) ( ON ?AUTO_17137 ?AUTO_17134 ) ( CLEAR ?AUTO_17133 ) ( ON ?AUTO_17131 ?AUTO_17137 ) ( ON ?AUTO_17132 ?AUTO_17131 ) ( CLEAR ?AUTO_17132 ) ( HOLDING ?AUTO_17130 ) ( CLEAR ?AUTO_17128 ) )
    :subtasks
    ( ( !STACK ?AUTO_17130 ?AUTO_17128 )
      ( MAKE-ON ?AUTO_17128 ?AUTO_17129 ) )
    :id ( 1855 )
    :q-value ( 14.6 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_17140 - BLOCK
      ?AUTO_17141 - BLOCK
    )
    :vars
    (
      ?AUTO_17148 - BLOCK
      ?AUTO_17147 - BLOCK
      ?AUTO_17145 - BLOCK
      ?AUTO_17149 - BLOCK
      ?AUTO_17142 - BLOCK
      ?AUTO_17146 - BLOCK
      ?AUTO_17151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_17140 ) ( ON ?AUTO_17148 ?AUTO_17141 ) ( ON ?AUTO_17147 ?AUTO_17148 ) ( CLEAR ?AUTO_17145 ) ( ON ?AUTO_17149 ?AUTO_17147 ) ( ON ?AUTO_17142 ?AUTO_17149 ) ( CLEAR ?AUTO_17142 ) ( CLEAR ?AUTO_17140 ) ( ON ?AUTO_17146 ?AUTO_17151 ) ( CLEAR ?AUTO_17146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_17146 ?AUTO_17151 )
      ( MAKE-ON ?AUTO_17140 ?AUTO_17141 ) )
    :id ( 1856 )
    :q-value ( 16 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_17168 - BLOCK
      ?AUTO_17169 - BLOCK
    )
    :vars
    (
      ?AUTO_17177 - BLOCK
      ?AUTO_17173 - BLOCK
      ?AUTO_17172 - BLOCK
      ?AUTO_17170 - BLOCK
      ?AUTO_17174 - BLOCK
      ?AUTO_17176 - BLOCK
      ?AUTO_17179 - BLOCK
      ?AUTO_17178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_17168 ) ( ON ?AUTO_17177 ?AUTO_17169 ) ( ON ?AUTO_17173 ?AUTO_17177 ) ( CLEAR ?AUTO_17172 ) ( ON ?AUTO_17170 ?AUTO_17168 ) ( ON ?AUTO_17174 ?AUTO_17173 ) ( ON ?AUTO_17176 ?AUTO_17174 ) ( CLEAR ?AUTO_17176 ) ( CLEAR ?AUTO_17179 ) ( ON ?AUTO_17178 ?AUTO_17170 ) ( CLEAR ?AUTO_17178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_17178 ?AUTO_17170 )
      ( MAKE-ON ?AUTO_17168 ?AUTO_17169 ) )
    :id ( 1858 )
    :q-value ( 15.3333 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_17182 - BLOCK
      ?AUTO_17183 - BLOCK
    )
    :vars
    (
      ?AUTO_17192 - BLOCK
      ?AUTO_17191 - BLOCK
      ?AUTO_17184 - BLOCK
      ?AUTO_17188 - BLOCK
      ?AUTO_17189 - BLOCK
      ?AUTO_17193 - BLOCK
      ?AUTO_17190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_17182 ) ( ON ?AUTO_17192 ?AUTO_17183 ) ( ON ?AUTO_17191 ?AUTO_17192 ) ( ON ?AUTO_17184 ?AUTO_17182 ) ( ON ?AUTO_17188 ?AUTO_17191 ) ( CLEAR ?AUTO_17189 ) ( ON ?AUTO_17193 ?AUTO_17184 ) ( CLEAR ?AUTO_17193 ) ( HOLDING ?AUTO_17190 ) ( CLEAR ?AUTO_17188 ) )
    :subtasks
    ( ( !STACK ?AUTO_17190 ?AUTO_17188 )
      ( MAKE-ON ?AUTO_17182 ?AUTO_17183 ) )
    :id ( 1859 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_17196 - BLOCK
      ?AUTO_17197 - BLOCK
    )
    :vars
    (
      ?AUTO_17201 - BLOCK
      ?AUTO_17206 - BLOCK
      ?AUTO_17200 - BLOCK
      ?AUTO_17199 - BLOCK
      ?AUTO_17198 - BLOCK
      ?AUTO_17203 - BLOCK
      ?AUTO_17202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_17196 ) ( ON ?AUTO_17201 ?AUTO_17197 ) ( ON ?AUTO_17206 ?AUTO_17201 ) ( ON ?AUTO_17200 ?AUTO_17196 ) ( ON ?AUTO_17199 ?AUTO_17206 ) ( CLEAR ?AUTO_17198 ) ( ON ?AUTO_17203 ?AUTO_17200 ) ( CLEAR ?AUTO_17203 ) ( CLEAR ?AUTO_17199 ) ( ON-TABLE ?AUTO_17202 ) ( CLEAR ?AUTO_17202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_17202 )
      ( MAKE-ON ?AUTO_17196 ?AUTO_17197 ) )
    :id ( 1860 )
    :q-value ( 20 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_17212 - BLOCK
      ?AUTO_17213 - BLOCK
    )
    :vars
    (
      ?AUTO_17215 - BLOCK
      ?AUTO_17222 - BLOCK
      ?AUTO_17218 - BLOCK
      ?AUTO_17217 - BLOCK
      ?AUTO_17214 - BLOCK
      ?AUTO_17219 - BLOCK
      ?AUTO_17221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_17212 ) ( ON ?AUTO_17215 ?AUTO_17213 ) ( ON ?AUTO_17222 ?AUTO_17215 ) ( ON ?AUTO_17218 ?AUTO_17212 ) ( CLEAR ?AUTO_17217 ) ( ON ?AUTO_17214 ?AUTO_17218 ) ( CLEAR ?AUTO_17214 ) ( ON-TABLE ?AUTO_17219 ) ( CLEAR ?AUTO_17219 ) ( HOLDING ?AUTO_17221 ) ( CLEAR ?AUTO_17222 ) )
    :subtasks
    ( ( !STACK ?AUTO_17221 ?AUTO_17222 )
      ( MAKE-ON ?AUTO_17212 ?AUTO_17213 ) )
    :id ( 1861 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_17693 - BLOCK
      ?AUTO_17694 - BLOCK
    )
    :vars
    (
      ?AUTO_17695 - BLOCK
      ?AUTO_17697 - BLOCK
      ?AUTO_17696 - BLOCK
      ?AUTO_17700 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_17693 ?AUTO_17695 ) ( ON ?AUTO_17697 ?AUTO_17693 ) ( ON ?AUTO_17696 ?AUTO_17697 ) ( CLEAR ?AUTO_17696 ) ( HOLDING ?AUTO_17700 ) ( CLEAR ?AUTO_17694 ) )
    :subtasks
    ( ( !STACK ?AUTO_17700 ?AUTO_17694 )
      ( MAKE-ON ?AUTO_17693 ?AUTO_17694 ) )
    :id ( 1923 )
    :q-value ( 9 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_17745 - BLOCK
      ?AUTO_17746 - BLOCK
    )
    :vars
    (
      ?AUTO_17748 - BLOCK
      ?AUTO_17750 - BLOCK
      ?AUTO_17747 - BLOCK
      ?AUTO_17752 - BLOCK
      ?AUTO_17751 - BLOCK
      ?AUTO_17754 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_17745 ?AUTO_17748 ) ( ON ?AUTO_17750 ?AUTO_17745 ) ( ON ?AUTO_17747 ?AUTO_17750 ) ( ON ?AUTO_17752 ?AUTO_17747 ) ( CLEAR ?AUTO_17752 ) ( ON ?AUTO_17751 ?AUTO_17746 ) ( CLEAR ?AUTO_17751 ) ( HOLDING ?AUTO_17754 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_17754 )
      ( MAKE-ON ?AUTO_17745 ?AUTO_17746 ) )
    :id ( 1928 )
    :q-value ( 11.6667 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_17755 - BLOCK
      ?AUTO_17756 - BLOCK
    )
    :vars
    (
      ?AUTO_17761 - BLOCK
      ?AUTO_17763 - BLOCK
      ?AUTO_17762 - BLOCK
      ?AUTO_17759 - BLOCK
      ?AUTO_17764 - BLOCK
      ?AUTO_17757 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_17755 ?AUTO_17761 ) ( ON ?AUTO_17763 ?AUTO_17755 ) ( ON ?AUTO_17762 ?AUTO_17763 ) ( ON ?AUTO_17759 ?AUTO_17762 ) ( CLEAR ?AUTO_17759 ) ( ON ?AUTO_17764 ?AUTO_17756 ) ( ON ?AUTO_17757 ?AUTO_17764 ) ( CLEAR ?AUTO_17757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_17757 ?AUTO_17764 )
      ( MAKE-ON ?AUTO_17755 ?AUTO_17756 ) )
    :id ( 1929 )
    :q-value ( 13.5 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_18110 - BLOCK
      ?AUTO_18111 - BLOCK
    )
    :vars
    (
      ?AUTO_18115 - BLOCK
      ?AUTO_18117 - BLOCK
      ?AUTO_18114 - BLOCK
      ?AUTO_18116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_18110 ) ( CLEAR ?AUTO_18115 ) ( CLEAR ?AUTO_18117 ) ( ON ?AUTO_18114 ?AUTO_18110 ) ( CLEAR ?AUTO_18114 ) ( HOLDING ?AUTO_18116 ) ( CLEAR ?AUTO_18111 ) )
    :subtasks
    ( ( !STACK ?AUTO_18116 ?AUTO_18111 )
      ( MAKE-ON ?AUTO_18110 ?AUTO_18111 ) )
    :id ( 1974 )
    :q-value ( 7 )
    :q-count ( 22 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_18592 - BLOCK
      ?AUTO_18593 - BLOCK
    )
    :vars
    (
      ?AUTO_18598 - BLOCK
      ?AUTO_18599 - BLOCK
      ?AUTO_18595 - BLOCK
      ?AUTO_18597 - BLOCK
      ?AUTO_18594 - BLOCK
      ?AUTO_18601 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_18592 ) ( CLEAR ?AUTO_18598 ) ( ON ?AUTO_18599 ?AUTO_18592 ) ( CLEAR ?AUTO_18595 ) ( ON ?AUTO_18593 ?AUTO_18599 ) ( CLEAR ?AUTO_18597 ) ( ON ?AUTO_18594 ?AUTO_18593 ) ( CLEAR ?AUTO_18594 ) ( HOLDING ?AUTO_18601 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_18601 )
      ( MAKE-ON ?AUTO_18592 ?AUTO_18593 ) )
    :id ( 2033 )
    :q-value ( 9 )
    :q-count ( 15 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_19020 - BLOCK
      ?AUTO_19021 - BLOCK
    )
    :vars
    (
      ?AUTO_19023 - BLOCK
      ?AUTO_19027 - BLOCK
      ?AUTO_19022 - BLOCK
      ?AUTO_19024 - BLOCK
      ?AUTO_19028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_19020 ) ( ON ?AUTO_19021 ?AUTO_19020 ) ( CLEAR ?AUTO_19023 ) ( ON ?AUTO_19027 ?AUTO_19021 ) ( CLEAR ?AUTO_19022 ) ( ON ?AUTO_19024 ?AUTO_19027 ) ( CLEAR ?AUTO_19024 ) ( HOLDING ?AUTO_19028 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_19028 )
      ( MAKE-ON ?AUTO_19020 ?AUTO_19021 ) )
    :id ( 2087 )
    :q-value ( 9 )
    :q-count ( 13 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_19113 - BLOCK
      ?AUTO_19114 - BLOCK
    )
    :vars
    (
      ?AUTO_19120 - BLOCK
      ?AUTO_19121 - BLOCK
      ?AUTO_19119 - BLOCK
      ?AUTO_19117 - BLOCK
      ?AUTO_19118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_19113 ) ( CLEAR ?AUTO_19120 ) ( ON ?AUTO_19121 ?AUTO_19114 ) ( CLEAR ?AUTO_19119 ) ( ON ?AUTO_19117 ?AUTO_19121 ) ( CLEAR ?AUTO_19117 ) ( CLEAR ?AUTO_19113 ) ( ON-TABLE ?AUTO_19118 ) ( CLEAR ?AUTO_19118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_19118 )
      ( MAKE-ON ?AUTO_19113 ?AUTO_19114 ) )
    :id ( 2098 )
    :q-value ( 13.6 )
    :q-count ( 10 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_19640 - BLOCK
      ?AUTO_19641 - BLOCK
    )
    :vars
    (
      ?AUTO_19645 - BLOCK
      ?AUTO_19648 - BLOCK
      ?AUTO_19647 - BLOCK
      ?AUTO_19644 - BLOCK
      ?AUTO_19646 - BLOCK
      ?AUTO_19649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_19640 ) ( CLEAR ?AUTO_19645 ) ( ON ?AUTO_19648 ?AUTO_19641 ) ( ON ?AUTO_19647 ?AUTO_19648 ) ( ON ?AUTO_19644 ?AUTO_19647 ) ( CLEAR ?AUTO_19640 ) ( ON ?AUTO_19646 ?AUTO_19644 ) ( CLEAR ?AUTO_19646 ) ( HOLDING ?AUTO_19649 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_19649 )
      ( MAKE-ON ?AUTO_19640 ?AUTO_19641 ) )
    :id ( 2165 )
    :q-value ( 12 )
    :q-count ( 10 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_19650 - BLOCK
      ?AUTO_19651 - BLOCK
    )
    :vars
    (
      ?AUTO_19659 - BLOCK
      ?AUTO_19658 - BLOCK
      ?AUTO_19653 - BLOCK
      ?AUTO_19655 - BLOCK
      ?AUTO_19656 - BLOCK
      ?AUTO_19654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_19650 ) ( CLEAR ?AUTO_19659 ) ( ON ?AUTO_19658 ?AUTO_19651 ) ( ON ?AUTO_19653 ?AUTO_19658 ) ( ON ?AUTO_19655 ?AUTO_19653 ) ( ON ?AUTO_19656 ?AUTO_19655 ) ( CLEAR ?AUTO_19656 ) ( ON ?AUTO_19654 ?AUTO_19650 ) ( CLEAR ?AUTO_19654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_19654 ?AUTO_19650 )
      ( MAKE-ON ?AUTO_19650 ?AUTO_19651 ) )
    :id ( 2166 )
    :q-value ( 13.6667 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_19662 - BLOCK
      ?AUTO_19663 - BLOCK
    )
    :vars
    (
      ?AUTO_19668 - BLOCK
      ?AUTO_19667 - BLOCK
      ?AUTO_19665 - BLOCK
      ?AUTO_19669 - BLOCK
      ?AUTO_19671 - BLOCK
      ?AUTO_19664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_19662 ) ( CLEAR ?AUTO_19668 ) ( ON ?AUTO_19667 ?AUTO_19663 ) ( ON ?AUTO_19665 ?AUTO_19667 ) ( ON ?AUTO_19669 ?AUTO_19665 ) ( ON ?AUTO_19671 ?AUTO_19662 ) ( CLEAR ?AUTO_19671 ) ( HOLDING ?AUTO_19664 ) ( CLEAR ?AUTO_19669 ) )
    :subtasks
    ( ( !STACK ?AUTO_19664 ?AUTO_19669 )
      ( MAKE-ON ?AUTO_19662 ?AUTO_19663 ) )
    :id ( 2167 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_19697 - BLOCK
      ?AUTO_19698 - BLOCK
    )
    :vars
    (
      ?AUTO_19703 - BLOCK
      ?AUTO_19700 - BLOCK
      ?AUTO_19704 - BLOCK
      ?AUTO_19702 - BLOCK
      ?AUTO_19701 - BLOCK
      ?AUTO_19706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_19697 ) ( ON ?AUTO_19703 ?AUTO_19698 ) ( ON ?AUTO_19700 ?AUTO_19703 ) ( ON ?AUTO_19704 ?AUTO_19700 ) ( ON ?AUTO_19702 ?AUTO_19697 ) ( ON ?AUTO_19701 ?AUTO_19702 ) ( CLEAR ?AUTO_19701 ) ( ON ?AUTO_19706 ?AUTO_19704 ) ( CLEAR ?AUTO_19706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_19706 ?AUTO_19704 )
      ( MAKE-ON ?AUTO_19697 ?AUTO_19698 ) )
    :id ( 2170 )
    :q-value ( 17 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_20296 - BLOCK
      ?AUTO_20297 - BLOCK
    )
    :vars
    (
      ?AUTO_20301 - BLOCK
      ?AUTO_20302 - BLOCK
      ?AUTO_20300 - BLOCK
      ?AUTO_20298 - BLOCK
      ?AUTO_20303 - BLOCK
      ?AUTO_20305 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_20296 ?AUTO_20301 ) ( CLEAR ?AUTO_20302 ) ( ON ?AUTO_20300 ?AUTO_20296 ) ( CLEAR ?AUTO_20298 ) ( ON ?AUTO_20297 ?AUTO_20300 ) ( ON ?AUTO_20303 ?AUTO_20297 ) ( CLEAR ?AUTO_20303 ) ( HOLDING ?AUTO_20305 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_20305 )
      ( MAKE-ON ?AUTO_20296 ?AUTO_20297 ) )
    :id ( 2244 )
    :q-value ( 9 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_20790 - BLOCK
      ?AUTO_20791 - BLOCK
    )
    :vars
    (
      ?AUTO_20794 - BLOCK
      ?AUTO_20795 - BLOCK
      ?AUTO_20793 - BLOCK
      ?AUTO_20796 - BLOCK
      ?AUTO_20797 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_20790 ?AUTO_20794 ) ( ON ?AUTO_20795 ?AUTO_20791 ) ( CLEAR ?AUTO_20793 ) ( ON ?AUTO_20796 ?AUTO_20790 ) ( CLEAR ?AUTO_20796 ) ( HOLDING ?AUTO_20797 ) ( CLEAR ?AUTO_20795 ) )
    :subtasks
    ( ( !STACK ?AUTO_20797 ?AUTO_20795 )
      ( MAKE-ON ?AUTO_20790 ?AUTO_20791 ) )
    :id ( 2302 )
    :q-value ( 9.66667 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21169 - BLOCK
      ?AUTO_21170 - BLOCK
    )
    :vars
    (
      ?AUTO_21177 - BLOCK
      ?AUTO_21176 - BLOCK
      ?AUTO_21171 - BLOCK
      ?AUTO_21172 - BLOCK
      ?AUTO_21174 - BLOCK
      ?AUTO_21178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_21169 ) ( ON ?AUTO_21177 ?AUTO_21169 ) ( CLEAR ?AUTO_21176 ) ( ON ?AUTO_21171 ?AUTO_21177 ) ( CLEAR ?AUTO_21171 ) ( CLEAR ?AUTO_21172 ) ( ON ?AUTO_21174 ?AUTO_21170 ) ( ON ?AUTO_21178 ?AUTO_21174 ) ( CLEAR ?AUTO_21178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_21178 ?AUTO_21174 )
      ( MAKE-ON ?AUTO_21169 ?AUTO_21170 ) )
    :id ( 2338 )
    :q-value ( 10.6153 )
    :q-count ( 26 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21491 - BLOCK
      ?AUTO_21492 - BLOCK
    )
    :vars
    (
      ?AUTO_21497 - BLOCK
      ?AUTO_21495 - BLOCK
      ?AUTO_21496 - BLOCK
      ?AUTO_21498 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_21491 ?AUTO_21497 ) ( ON ?AUTO_21495 ?AUTO_21491 ) ( ON ?AUTO_21496 ?AUTO_21492 ) ( CLEAR ?AUTO_21496 ) ( HOLDING ?AUTO_21498 ) ( CLEAR ?AUTO_21495 ) )
    :subtasks
    ( ( !STACK ?AUTO_21498 ?AUTO_21495 )
      ( MAKE-ON ?AUTO_21491 ?AUTO_21492 ) )
    :id ( 2382 )
    :q-value ( 9.57143 )
    :q-count ( 7 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21522 - BLOCK
      ?AUTO_21523 - BLOCK
    )
    :vars
    (
      ?AUTO_21524 - BLOCK
      ?AUTO_21527 - BLOCK
      ?AUTO_21526 - BLOCK
      ?AUTO_21525 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_21522 ?AUTO_21524 ) ( ON ?AUTO_21527 ?AUTO_21523 ) ( ON ?AUTO_21526 ?AUTO_21527 ) ( CLEAR ?AUTO_21526 ) ( CLEAR ?AUTO_21522 ) ( ON-TABLE ?AUTO_21525 ) ( CLEAR ?AUTO_21525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_21525 )
      ( MAKE-ON ?AUTO_21522 ?AUTO_21523 ) )
    :id ( 2385 )
    :q-value ( 12.6667 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21859 - BLOCK
      ?AUTO_21860 - BLOCK
    )
    :vars
    (
      ?AUTO_21863 - BLOCK
      ?AUTO_21864 - BLOCK
      ?AUTO_21862 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_21863 ?AUTO_21860 ) ( ON ?AUTO_21864 ?AUTO_21863 ) ( ON ?AUTO_21862 ?AUTO_21864 ) ( CLEAR ?AUTO_21862 ) ( HOLDING ?AUTO_21859 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_21859 )
      ( MAKE-ON ?AUTO_21859 ?AUTO_21860 ) )
    :id ( 2414 )
    :q-value ( 9.52632 )
    :q-count ( 19 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21867 - BLOCK
      ?AUTO_21868 - BLOCK
    )
    :vars
    (
      ?AUTO_21872 - BLOCK
      ?AUTO_21870 - BLOCK
      ?AUTO_21871 - BLOCK
      ?AUTO_21875 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_21872 ?AUTO_21868 ) ( ON ?AUTO_21870 ?AUTO_21872 ) ( ON ?AUTO_21871 ?AUTO_21870 ) ( CLEAR ?AUTO_21871 ) ( ON ?AUTO_21867 ?AUTO_21875 ) ( CLEAR ?AUTO_21867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_21867 ?AUTO_21875 )
      ( MAKE-ON ?AUTO_21867 ?AUTO_21868 ) )
    :id ( 2415 )
    :q-value ( 10.7273 )
    :q-count ( 11 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21885 - BLOCK
      ?AUTO_21886 - BLOCK
    )
    :vars
    (
      ?AUTO_21890 - BLOCK
      ?AUTO_21891 - BLOCK
      ?AUTO_21888 - BLOCK
      ?AUTO_21892 - BLOCK
      ?AUTO_21893 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_21890 ?AUTO_21886 ) ( ON ?AUTO_21891 ?AUTO_21890 ) ( ON ?AUTO_21888 ?AUTO_21891 ) ( CLEAR ?AUTO_21888 ) ( ON ?AUTO_21885 ?AUTO_21892 ) ( ON ?AUTO_21893 ?AUTO_21885 ) ( CLEAR ?AUTO_21893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_21893 ?AUTO_21885 )
      ( MAKE-ON ?AUTO_21885 ?AUTO_21886 ) )
    :id ( 2417 )
    :q-value ( 11.1665 )
    :q-count ( 24 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21896 - BLOCK
      ?AUTO_21897 - BLOCK
    )
    :vars
    (
      ?AUTO_21898 - BLOCK
      ?AUTO_21903 - BLOCK
      ?AUTO_21901 - BLOCK
      ?AUTO_21904 - BLOCK
      ?AUTO_21899 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_21898 ?AUTO_21897 ) ( ON ?AUTO_21903 ?AUTO_21898 ) ( ON ?AUTO_21896 ?AUTO_21901 ) ( ON ?AUTO_21904 ?AUTO_21896 ) ( CLEAR ?AUTO_21904 ) ( HOLDING ?AUTO_21899 ) ( CLEAR ?AUTO_21903 ) )
    :subtasks
    ( ( !STACK ?AUTO_21899 ?AUTO_21903 )
      ( MAKE-ON ?AUTO_21896 ?AUTO_21897 ) )
    :id ( 2418 )
    :q-value ( 13 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_22448 - BLOCK
      ?AUTO_22449 - BLOCK
    )
    :vars
    (
      ?AUTO_22455 - BLOCK
      ?AUTO_22458 - BLOCK
      ?AUTO_22457 - BLOCK
      ?AUTO_22451 - BLOCK
      ?AUTO_22452 - BLOCK
      ?AUTO_22453 - BLOCK
      ?AUTO_22459 - BLOCK
      ?AUTO_22450 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_22448 ?AUTO_22455 ) ( CLEAR ?AUTO_22458 ) ( ON ?AUTO_22457 ?AUTO_22449 ) ( CLEAR ?AUTO_22451 ) ( ON ?AUTO_22452 ?AUTO_22457 ) ( CLEAR ?AUTO_22453 ) ( ON ?AUTO_22459 ?AUTO_22452 ) ( CLEAR ?AUTO_22459 ) ( HOLDING ?AUTO_22450 ) ( CLEAR ?AUTO_22448 ) )
    :subtasks
    ( ( !STACK ?AUTO_22450 ?AUTO_22448 )
      ( MAKE-ON ?AUTO_22448 ?AUTO_22449 ) )
    :id ( 2480 )
    :q-value ( 11.8 )
    :q-count ( 10 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_22462 - BLOCK
      ?AUTO_22463 - BLOCK
    )
    :vars
    (
      ?AUTO_22473 - BLOCK
      ?AUTO_22466 - BLOCK
      ?AUTO_22464 - BLOCK
      ?AUTO_22469 - BLOCK
      ?AUTO_22470 - BLOCK
      ?AUTO_22472 - BLOCK
      ?AUTO_22465 - BLOCK
      ?AUTO_22468 - BLOCK
      ?AUTO_22475 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_22462 ?AUTO_22473 ) ( CLEAR ?AUTO_22466 ) ( ON ?AUTO_22464 ?AUTO_22463 ) ( CLEAR ?AUTO_22469 ) ( ON ?AUTO_22470 ?AUTO_22464 ) ( CLEAR ?AUTO_22472 ) ( ON ?AUTO_22465 ?AUTO_22470 ) ( CLEAR ?AUTO_22465 ) ( CLEAR ?AUTO_22462 ) ( ON ?AUTO_22468 ?AUTO_22475 ) ( CLEAR ?AUTO_22468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_22468 ?AUTO_22475 )
      ( MAKE-ON ?AUTO_22462 ?AUTO_22463 ) )
    :id ( 2481 )
    :q-value ( 13 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_22478 - BLOCK
      ?AUTO_22479 - BLOCK
    )
    :vars
    (
      ?AUTO_22482 - BLOCK
      ?AUTO_22480 - BLOCK
      ?AUTO_22481 - BLOCK
      ?AUTO_22484 - BLOCK
      ?AUTO_22485 - BLOCK
      ?AUTO_22488 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_22478 ?AUTO_22482 ) ( ON ?AUTO_22480 ?AUTO_22479 ) ( CLEAR ?AUTO_22481 ) ( ON ?AUTO_22484 ?AUTO_22480 ) ( CLEAR ?AUTO_22484 ) ( CLEAR ?AUTO_22478 ) ( ON ?AUTO_22485 ?AUTO_22488 ) ( CLEAR ?AUTO_22485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_22485 ?AUTO_22488 )
      ( MAKE-ON ?AUTO_22478 ?AUTO_22479 ) )
    :id ( 2482 )
    :q-value ( 11.5 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_22606 - BLOCK
      ?AUTO_22607 - BLOCK
    )
    :vars
    (
      ?AUTO_22608 - BLOCK
      ?AUTO_22611 - BLOCK
      ?AUTO_22614 - BLOCK
      ?AUTO_22615 - BLOCK
      ?AUTO_22613 - BLOCK
      ?AUTO_22610 - BLOCK
      ?AUTO_22612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_22606 ) ( CLEAR ?AUTO_22608 ) ( ON ?AUTO_22611 ?AUTO_22606 ) ( CLEAR ?AUTO_22614 ) ( ON ?AUTO_22615 ?AUTO_22607 ) ( CLEAR ?AUTO_22613 ) ( ON ?AUTO_22610 ?AUTO_22615 ) ( CLEAR ?AUTO_22610 ) ( HOLDING ?AUTO_22612 ) ( CLEAR ?AUTO_22611 ) )
    :subtasks
    ( ( !STACK ?AUTO_22612 ?AUTO_22611 )
      ( MAKE-ON ?AUTO_22606 ?AUTO_22607 ) )
    :id ( 2495 )
    :q-value ( 12.1666 )
    :q-count ( 12 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_22619 - BLOCK
      ?AUTO_22620 - BLOCK
    )
    :vars
    (
      ?AUTO_22622 - BLOCK
      ?AUTO_22629 - BLOCK
      ?AUTO_22621 - BLOCK
      ?AUTO_22623 - BLOCK
      ?AUTO_22626 - BLOCK
      ?AUTO_22624 - BLOCK
      ?AUTO_22628 - BLOCK
      ?AUTO_22631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_22619 ) ( CLEAR ?AUTO_22622 ) ( ON ?AUTO_22629 ?AUTO_22619 ) ( CLEAR ?AUTO_22621 ) ( ON ?AUTO_22623 ?AUTO_22620 ) ( CLEAR ?AUTO_22626 ) ( ON ?AUTO_22624 ?AUTO_22623 ) ( CLEAR ?AUTO_22624 ) ( CLEAR ?AUTO_22629 ) ( ON ?AUTO_22628 ?AUTO_22631 ) ( CLEAR ?AUTO_22628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_22628 ?AUTO_22631 )
      ( MAKE-ON ?AUTO_22619 ?AUTO_22620 ) )
    :id ( 2496 )
    :q-value ( 14 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_22632 - BLOCK
      ?AUTO_22633 - BLOCK
    )
    :vars
    (
      ?AUTO_22635 - BLOCK
      ?AUTO_22634 - BLOCK
      ?AUTO_22640 - BLOCK
      ?AUTO_22643 - BLOCK
      ?AUTO_22638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_22632 ) ( ON ?AUTO_22635 ?AUTO_22632 ) ( ON ?AUTO_22634 ?AUTO_22633 ) ( CLEAR ?AUTO_22635 ) ( ON ?AUTO_22640 ?AUTO_22643 ) ( CLEAR ?AUTO_22640 ) ( HOLDING ?AUTO_22638 ) ( CLEAR ?AUTO_22634 ) )
    :subtasks
    ( ( !STACK ?AUTO_22638 ?AUTO_22634 )
      ( MAKE-ON ?AUTO_22632 ?AUTO_22633 ) )
    :id ( 2497 )
    :q-value ( 10.2 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_22646 - BLOCK
      ?AUTO_22647 - BLOCK
    )
    :vars
    (
      ?AUTO_22652 - BLOCK
      ?AUTO_22651 - BLOCK
      ?AUTO_22654 - BLOCK
      ?AUTO_22648 - BLOCK
      ?AUTO_22653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_22646 ) ( ON ?AUTO_22652 ?AUTO_22646 ) ( ON ?AUTO_22651 ?AUTO_22647 ) ( CLEAR ?AUTO_22652 ) ( ON ?AUTO_22654 ?AUTO_22648 ) ( CLEAR ?AUTO_22651 ) ( ON ?AUTO_22653 ?AUTO_22654 ) ( CLEAR ?AUTO_22653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_22653 ?AUTO_22654 )
      ( MAKE-ON ?AUTO_22646 ?AUTO_22647 ) )
    :id ( 2498 )
    :q-value ( 14 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_23729 - BLOCK
      ?AUTO_23730 - BLOCK
    )
    :vars
    (
      ?AUTO_23735 - BLOCK
      ?AUTO_23738 - BLOCK
      ?AUTO_23734 - BLOCK
      ?AUTO_23737 - BLOCK
      ?AUTO_23733 - BLOCK
      ?AUTO_23736 - BLOCK
      ?AUTO_23739 - BLOCK
      ?AUTO_23740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_23729 ) ( ON ?AUTO_23735 ?AUTO_23729 ) ( CLEAR ?AUTO_23738 ) ( ON ?AUTO_23734 ?AUTO_23735 ) ( ON ?AUTO_23737 ?AUTO_23734 ) ( CLEAR ?AUTO_23737 ) ( CLEAR ?AUTO_23733 ) ( ON ?AUTO_23736 ?AUTO_23730 ) ( CLEAR ?AUTO_23736 ) ( HOLDING ?AUTO_23739 ) ( CLEAR ?AUTO_23740 ) )
    :subtasks
    ( ( !STACK ?AUTO_23739 ?AUTO_23740 )
      ( MAKE-ON ?AUTO_23729 ?AUTO_23730 ) )
    :id ( 2538 )
    :q-value ( 11 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_23854 - BLOCK
      ?AUTO_23855 - BLOCK
    )
    :vars
    (
      ?AUTO_23859 - BLOCK
      ?AUTO_23858 - BLOCK
      ?AUTO_23860 - BLOCK
      ?AUTO_23861 - BLOCK
      ?AUTO_23862 - BLOCK
      ?AUTO_23856 - BLOCK
      ?AUTO_23857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_23854 ) ( CLEAR ?AUTO_23859 ) ( ON ?AUTO_23858 ?AUTO_23854 ) ( ON ?AUTO_23860 ?AUTO_23858 ) ( CLEAR ?AUTO_23861 ) ( ON ?AUTO_23862 ?AUTO_23855 ) ( ON ?AUTO_23856 ?AUTO_23862 ) ( CLEAR ?AUTO_23856 ) ( ON ?AUTO_23857 ?AUTO_23860 ) ( CLEAR ?AUTO_23857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_23857 ?AUTO_23860 )
      ( MAKE-ON ?AUTO_23854 ?AUTO_23855 ) )
    :id ( 2548 )
    :q-value ( 13.7143 )
    :q-count ( 7 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_24793 - BLOCK
      ?AUTO_24794 - BLOCK
    )
    :vars
    (
      ?AUTO_24798 - BLOCK
      ?AUTO_24799 - BLOCK
      ?AUTO_24802 - BLOCK
      ?AUTO_24795 - BLOCK
      ?AUTO_24801 - BLOCK
      ?AUTO_24800 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24798 ) ( CLEAR ?AUTO_24799 ) ( ON ?AUTO_24802 ?AUTO_24794 ) ( CLEAR ?AUTO_24795 ) ( ON ?AUTO_24801 ?AUTO_24802 ) ( CLEAR ?AUTO_24801 ) ( ON-TABLE ?AUTO_24800 ) ( CLEAR ?AUTO_24800 ) ( HOLDING ?AUTO_24793 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_24793 )
      ( MAKE-ON ?AUTO_24793 ?AUTO_24794 ) )
    :id ( 2646 )
    :q-value ( 15 )
    :q-count ( 8 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_24804 - BLOCK
      ?AUTO_24805 - BLOCK
    )
    :vars
    (
      ?AUTO_24811 - BLOCK
      ?AUTO_24813 - BLOCK
      ?AUTO_24807 - BLOCK
      ?AUTO_24810 - BLOCK
      ?AUTO_24812 - BLOCK
      ?AUTO_24806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24811 ) ( CLEAR ?AUTO_24813 ) ( ON ?AUTO_24807 ?AUTO_24805 ) ( CLEAR ?AUTO_24810 ) ( ON ?AUTO_24812 ?AUTO_24807 ) ( CLEAR ?AUTO_24812 ) ( ON-TABLE ?AUTO_24806 ) ( ON ?AUTO_24804 ?AUTO_24806 ) ( CLEAR ?AUTO_24804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_24804 ?AUTO_24806 )
      ( MAKE-ON ?AUTO_24804 ?AUTO_24805 ) )
    :id ( 2647 )
    :q-value ( 18 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_24816 - BLOCK
      ?AUTO_24817 - BLOCK
    )
    :vars
    (
      ?AUTO_24818 - BLOCK
      ?AUTO_24823 - BLOCK
      ?AUTO_24822 - BLOCK
      ?AUTO_24820 - BLOCK
      ?AUTO_24824 - BLOCK
      ?AUTO_24819 - BLOCK
      ?AUTO_24826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24818 ) ( CLEAR ?AUTO_24823 ) ( ON ?AUTO_24822 ?AUTO_24817 ) ( CLEAR ?AUTO_24820 ) ( ON ?AUTO_24824 ?AUTO_24822 ) ( CLEAR ?AUTO_24824 ) ( ON-TABLE ?AUTO_24819 ) ( ON ?AUTO_24816 ?AUTO_24819 ) ( CLEAR ?AUTO_24816 ) ( HOLDING ?AUTO_24826 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_24826 )
      ( MAKE-ON ?AUTO_24816 ?AUTO_24817 ) )
    :id ( 2648 )
    :q-value ( 15.6667 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_24827 - BLOCK
      ?AUTO_24828 - BLOCK
    )
    :vars
    (
      ?AUTO_24831 - BLOCK
      ?AUTO_24833 - BLOCK
      ?AUTO_24835 - BLOCK
      ?AUTO_24830 - BLOCK
      ?AUTO_24832 - BLOCK
      ?AUTO_24829 - BLOCK
      ?AUTO_24837 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24831 ) ( CLEAR ?AUTO_24833 ) ( ON ?AUTO_24835 ?AUTO_24828 ) ( CLEAR ?AUTO_24830 ) ( ON ?AUTO_24832 ?AUTO_24835 ) ( CLEAR ?AUTO_24832 ) ( ON-TABLE ?AUTO_24829 ) ( ON ?AUTO_24827 ?AUTO_24829 ) ( ON ?AUTO_24837 ?AUTO_24827 ) ( CLEAR ?AUTO_24837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_24837 ?AUTO_24827 )
      ( MAKE-ON ?AUTO_24827 ?AUTO_24828 ) )
    :id ( 2649 )
    :q-value ( 16.6667 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_24840 - BLOCK
      ?AUTO_24841 - BLOCK
    )
    :vars
    (
      ?AUTO_24845 - BLOCK
      ?AUTO_24850 - BLOCK
      ?AUTO_24844 - BLOCK
      ?AUTO_24849 - BLOCK
      ?AUTO_24846 - BLOCK
      ?AUTO_24847 - BLOCK
      ?AUTO_24842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24845 ) ( CLEAR ?AUTO_24850 ) ( ON ?AUTO_24844 ?AUTO_24841 ) ( CLEAR ?AUTO_24849 ) ( ON-TABLE ?AUTO_24846 ) ( ON ?AUTO_24840 ?AUTO_24846 ) ( ON ?AUTO_24847 ?AUTO_24840 ) ( CLEAR ?AUTO_24847 ) ( HOLDING ?AUTO_24842 ) ( CLEAR ?AUTO_24844 ) )
    :subtasks
    ( ( !STACK ?AUTO_24842 ?AUTO_24844 )
      ( MAKE-ON ?AUTO_24840 ?AUTO_24841 ) )
    :id ( 2650 )
    :q-value ( 17 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_24853 - BLOCK
      ?AUTO_24854 - BLOCK
    )
    :vars
    (
      ?AUTO_24856 - BLOCK
      ?AUTO_24862 - BLOCK
      ?AUTO_24861 - BLOCK
      ?AUTO_24863 - BLOCK
      ?AUTO_24859 - BLOCK
      ?AUTO_24858 - BLOCK
      ?AUTO_24857 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24856 ) ( CLEAR ?AUTO_24862 ) ( ON ?AUTO_24861 ?AUTO_24854 ) ( CLEAR ?AUTO_24863 ) ( ON-TABLE ?AUTO_24859 ) ( ON ?AUTO_24853 ?AUTO_24859 ) ( ON ?AUTO_24858 ?AUTO_24853 ) ( CLEAR ?AUTO_24861 ) ( ON ?AUTO_24857 ?AUTO_24858 ) ( CLEAR ?AUTO_24857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_24857 ?AUTO_24858 )
      ( MAKE-ON ?AUTO_24853 ?AUTO_24854 ) )
    :id ( 2651 )
    :q-value ( 18 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_24866 - BLOCK
      ?AUTO_24867 - BLOCK
    )
    :vars
    (
      ?AUTO_24868 - BLOCK
      ?AUTO_24875 - BLOCK
      ?AUTO_24874 - BLOCK
      ?AUTO_24876 - BLOCK
      ?AUTO_24869 - BLOCK
      ?AUTO_24872 - BLOCK
      ?AUTO_24873 - BLOCK
      ?AUTO_24877 - BLOCK
      ?AUTO_24878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24868 ) ( CLEAR ?AUTO_24875 ) ( ON ?AUTO_24874 ?AUTO_24867 ) ( CLEAR ?AUTO_24876 ) ( ON-TABLE ?AUTO_24869 ) ( ON ?AUTO_24866 ?AUTO_24869 ) ( ON ?AUTO_24872 ?AUTO_24866 ) ( CLEAR ?AUTO_24874 ) ( ON ?AUTO_24873 ?AUTO_24872 ) ( CLEAR ?AUTO_24873 ) ( HOLDING ?AUTO_24877 ) ( CLEAR ?AUTO_24878 ) )
    :subtasks
    ( ( !STACK ?AUTO_24877 ?AUTO_24878 )
      ( MAKE-ON ?AUTO_24866 ?AUTO_24867 ) )
    :id ( 2652 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_24883 - BLOCK
      ?AUTO_24884 - BLOCK
    )
    :vars
    (
      ?AUTO_24886 - BLOCK
      ?AUTO_24887 - BLOCK
      ?AUTO_24889 - BLOCK
      ?AUTO_24893 - BLOCK
      ?AUTO_24891 - BLOCK
      ?AUTO_24888 - BLOCK
      ?AUTO_24890 - BLOCK
      ?AUTO_24885 - BLOCK
      ?AUTO_24892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24886 ) ( CLEAR ?AUTO_24887 ) ( ON ?AUTO_24889 ?AUTO_24884 ) ( CLEAR ?AUTO_24893 ) ( ON-TABLE ?AUTO_24891 ) ( ON ?AUTO_24883 ?AUTO_24891 ) ( ON ?AUTO_24888 ?AUTO_24883 ) ( CLEAR ?AUTO_24889 ) ( ON ?AUTO_24890 ?AUTO_24888 ) ( CLEAR ?AUTO_24885 ) ( ON ?AUTO_24892 ?AUTO_24890 ) ( CLEAR ?AUTO_24892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_24892 ?AUTO_24890 )
      ( MAKE-ON ?AUTO_24883 ?AUTO_24884 ) )
    :id ( 2653 )
    :q-value ( 20 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_25001 - BLOCK
      ?AUTO_25002 - BLOCK
    )
    :vars
    (
      ?AUTO_25003 - BLOCK
      ?AUTO_25006 - BLOCK
      ?AUTO_25004 - BLOCK
      ?AUTO_25008 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_25001 ?AUTO_25003 ) ( ON ?AUTO_25002 ?AUTO_25001 ) ( CLEAR ?AUTO_25006 ) ( ON ?AUTO_25004 ?AUTO_25002 ) ( CLEAR ?AUTO_25004 ) ( HOLDING ?AUTO_25008 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_25008 )
      ( MAKE-ON ?AUTO_25001 ?AUTO_25002 ) )
    :id ( 2672 )
    :q-value ( 7 )
    :q-count ( 21 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_25009 - BLOCK
      ?AUTO_25010 - BLOCK
    )
    :vars
    (
      ?AUTO_25011 - BLOCK
      ?AUTO_25016 - BLOCK
      ?AUTO_25012 - BLOCK
      ?AUTO_25013 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_25009 ?AUTO_25011 ) ( ON ?AUTO_25010 ?AUTO_25009 ) ( CLEAR ?AUTO_25016 ) ( ON ?AUTO_25012 ?AUTO_25010 ) ( ON ?AUTO_25013 ?AUTO_25012 ) ( CLEAR ?AUTO_25013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_25013 ?AUTO_25012 )
      ( MAKE-ON ?AUTO_25009 ?AUTO_25010 ) )
    :id ( 2673 )
    :q-value ( 8 )
    :q-count ( 14 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_25504 - BLOCK
      ?AUTO_25505 - BLOCK
    )
    :vars
    (
      ?AUTO_25507 - BLOCK
      ?AUTO_25511 - BLOCK
      ?AUTO_25512 - BLOCK
      ?AUTO_25506 - BLOCK
      ?AUTO_25510 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_25507 ?AUTO_25505 ) ( ON ?AUTO_25511 ?AUTO_25507 ) ( ON ?AUTO_25512 ?AUTO_25511 ) ( ON ?AUTO_25506 ?AUTO_25512 ) ( CLEAR ?AUTO_25506 ) ( HOLDING ?AUTO_25504 ) ( CLEAR ?AUTO_25510 ) )
    :subtasks
    ( ( !STACK ?AUTO_25504 ?AUTO_25510 )
      ( MAKE-ON ?AUTO_25504 ?AUTO_25505 ) )
    :id ( 2735 )
    :q-value ( 11.8 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_25515 - BLOCK
      ?AUTO_25516 - BLOCK
    )
    :vars
    (
      ?AUTO_25517 - BLOCK
      ?AUTO_25520 - BLOCK
      ?AUTO_25522 - BLOCK
      ?AUTO_25518 - BLOCK
      ?AUTO_25521 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_25517 ?AUTO_25516 ) ( ON ?AUTO_25520 ?AUTO_25517 ) ( ON ?AUTO_25522 ?AUTO_25520 ) ( ON ?AUTO_25518 ?AUTO_25522 ) ( CLEAR ?AUTO_25518 ) ( CLEAR ?AUTO_25521 ) ( ON-TABLE ?AUTO_25515 ) ( CLEAR ?AUTO_25515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_25515 )
      ( MAKE-ON ?AUTO_25515 ?AUTO_25516 ) )
    :id ( 2736 )
    :q-value ( 13.3333 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_25525 - BLOCK
      ?AUTO_25526 - BLOCK
    )
    :vars
    (
      ?AUTO_25529 - BLOCK
      ?AUTO_25527 - BLOCK
      ?AUTO_25533 - BLOCK
      ?AUTO_25530 - BLOCK
      ?AUTO_25528 - BLOCK
      ?AUTO_25534 - BLOCK
      ?AUTO_25535 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_25529 ?AUTO_25526 ) ( ON ?AUTO_25527 ?AUTO_25529 ) ( ON ?AUTO_25533 ?AUTO_25527 ) ( ON ?AUTO_25530 ?AUTO_25533 ) ( CLEAR ?AUTO_25530 ) ( CLEAR ?AUTO_25528 ) ( ON-TABLE ?AUTO_25525 ) ( CLEAR ?AUTO_25525 ) ( HOLDING ?AUTO_25534 ) ( CLEAR ?AUTO_25535 ) )
    :subtasks
    ( ( !STACK ?AUTO_25534 ?AUTO_25535 )
      ( MAKE-ON ?AUTO_25525 ?AUTO_25526 ) )
    :id ( 2737 )
    :q-value ( 12.7143 )
    :q-count ( 7 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_25764 - BLOCK
      ?AUTO_25765 - BLOCK
    )
    :vars
    (
      ?AUTO_25769 - BLOCK
      ?AUTO_25772 - BLOCK
      ?AUTO_25770 - BLOCK
      ?AUTO_25771 - BLOCK
      ?AUTO_25768 - BLOCK
      ?AUTO_25773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_25764 ) ( ON ?AUTO_25769 ?AUTO_25764 ) ( CLEAR ?AUTO_25772 ) ( ON ?AUTO_25770 ?AUTO_25769 ) ( CLEAR ?AUTO_25771 ) ( ON ?AUTO_25768 ?AUTO_25765 ) ( CLEAR ?AUTO_25768 ) ( HOLDING ?AUTO_25773 ) ( CLEAR ?AUTO_25770 ) )
    :subtasks
    ( ( !STACK ?AUTO_25773 ?AUTO_25770 )
      ( MAKE-ON ?AUTO_25764 ?AUTO_25765 ) )
    :id ( 2760 )
    :q-value ( 12.6 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_25800 - BLOCK
      ?AUTO_25801 - BLOCK
    )
    :vars
    (
      ?AUTO_25806 - BLOCK
      ?AUTO_25805 - BLOCK
      ?AUTO_25802 - BLOCK
      ?AUTO_25809 - BLOCK
      ?AUTO_25804 - BLOCK
      ?AUTO_25803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_25800 ) ( ON ?AUTO_25806 ?AUTO_25800 ) ( CLEAR ?AUTO_25805 ) ( CLEAR ?AUTO_25802 ) ( ON ?AUTO_25809 ?AUTO_25801 ) ( ON ?AUTO_25804 ?AUTO_25809 ) ( CLEAR ?AUTO_25804 ) ( CLEAR ?AUTO_25806 ) ( ON-TABLE ?AUTO_25803 ) ( CLEAR ?AUTO_25803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_25803 )
      ( MAKE-ON ?AUTO_25800 ?AUTO_25801 ) )
    :id ( 2763 )
    :q-value ( 13 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_25827 - BLOCK
      ?AUTO_25828 - BLOCK
    )
    :vars
    (
      ?AUTO_25833 - BLOCK
      ?AUTO_25834 - BLOCK
      ?AUTO_25832 - BLOCK
      ?AUTO_25831 - BLOCK
      ?AUTO_25836 - BLOCK
      ?AUTO_25835 - BLOCK
      ?AUTO_25838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_25827 ) ( CLEAR ?AUTO_25833 ) ( CLEAR ?AUTO_25834 ) ( ON ?AUTO_25832 ?AUTO_25828 ) ( ON ?AUTO_25831 ?AUTO_25832 ) ( CLEAR ?AUTO_25831 ) ( ON-TABLE ?AUTO_25836 ) ( CLEAR ?AUTO_25836 ) ( CLEAR ?AUTO_25827 ) ( ON ?AUTO_25835 ?AUTO_25838 ) ( CLEAR ?AUTO_25835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_25835 ?AUTO_25838 )
      ( MAKE-ON ?AUTO_25827 ?AUTO_25828 ) )
    :id ( 2765 )
    :q-value ( 10.9091 )
    :q-count ( 11 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_26319 - BLOCK
      ?AUTO_26320 - BLOCK
    )
    :vars
    (
      ?AUTO_26326 - BLOCK
      ?AUTO_26322 - BLOCK
      ?AUTO_26323 - BLOCK
      ?AUTO_26321 - BLOCK
      ?AUTO_26327 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_26326 ?AUTO_26320 ) ( ON ?AUTO_26322 ?AUTO_26326 ) ( ON ?AUTO_26323 ?AUTO_26322 ) ( CLEAR ?AUTO_26321 ) ( ON ?AUTO_26319 ?AUTO_26323 ) ( CLEAR ?AUTO_26319 ) ( HOLDING ?AUTO_26327 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_26327 )
      ( MAKE-ON ?AUTO_26319 ?AUTO_26320 ) )
    :id ( 2821 )
    :q-value ( 11.5001 )
    :q-count ( 8 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_27088 - BLOCK
      ?AUTO_27089 - BLOCK
    )
    :vars
    (
      ?AUTO_27094 - BLOCK
      ?AUTO_27090 - BLOCK
      ?AUTO_27092 - BLOCK
      ?AUTO_27095 - BLOCK
      ?AUTO_27096 - BLOCK
      ?AUTO_27097 - BLOCK
      ?AUTO_27098 - BLOCK
      ?AUTO_27099 - BLOCK
      ?AUTO_27100 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_27094 ?AUTO_27089 ) ( ON ?AUTO_27090 ?AUTO_27094 ) ( CLEAR ?AUTO_27092 ) ( ON ?AUTO_27095 ?AUTO_27090 ) ( CLEAR ?AUTO_27095 ) ( ON ?AUTO_27088 ?AUTO_27096 ) ( CLEAR ?AUTO_27097 ) ( ON ?AUTO_27098 ?AUTO_27088 ) ( CLEAR ?AUTO_27098 ) ( HOLDING ?AUTO_27099 ) ( CLEAR ?AUTO_27100 ) )
    :subtasks
    ( ( !STACK ?AUTO_27099 ?AUTO_27100 )
      ( MAKE-ON ?AUTO_27088 ?AUTO_27089 ) )
    :id ( 2911 )
    :q-value ( 13 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_27101 - BLOCK
      ?AUTO_27102 - BLOCK
    )
    :vars
    (
      ?AUTO_27109 - BLOCK
      ?AUTO_27108 - BLOCK
      ?AUTO_27111 - BLOCK
      ?AUTO_27107 - BLOCK
      ?AUTO_27110 - BLOCK
      ?AUTO_27106 - BLOCK
      ?AUTO_27103 - BLOCK
      ?AUTO_27112 - BLOCK
      ?AUTO_27113 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_27109 ?AUTO_27102 ) ( ON ?AUTO_27108 ?AUTO_27109 ) ( CLEAR ?AUTO_27111 ) ( ON ?AUTO_27107 ?AUTO_27108 ) ( CLEAR ?AUTO_27107 ) ( ON ?AUTO_27101 ?AUTO_27110 ) ( CLEAR ?AUTO_27106 ) ( ON ?AUTO_27103 ?AUTO_27101 ) ( CLEAR ?AUTO_27112 ) ( ON ?AUTO_27113 ?AUTO_27103 ) ( CLEAR ?AUTO_27113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_27113 ?AUTO_27103 )
      ( MAKE-ON ?AUTO_27101 ?AUTO_27102 ) )
    :id ( 2912 )
    :q-value ( 13 )
    :q-count ( 8 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_27116 - BLOCK
      ?AUTO_27117 - BLOCK
    )
    :vars
    (
      ?AUTO_27128 - BLOCK
      ?AUTO_27125 - BLOCK
      ?AUTO_27121 - BLOCK
      ?AUTO_27120 - BLOCK
      ?AUTO_27118 - BLOCK
      ?AUTO_27122 - BLOCK
      ?AUTO_27124 - BLOCK
      ?AUTO_27126 - BLOCK
      ?AUTO_27119 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_27128 ?AUTO_27117 ) ( ON ?AUTO_27125 ?AUTO_27128 ) ( CLEAR ?AUTO_27121 ) ( ON ?AUTO_27120 ?AUTO_27125 ) ( CLEAR ?AUTO_27120 ) ( ON ?AUTO_27116 ?AUTO_27118 ) ( CLEAR ?AUTO_27122 ) ( ON ?AUTO_27124 ?AUTO_27116 ) ( ON ?AUTO_27126 ?AUTO_27124 ) ( CLEAR ?AUTO_27126 ) ( HOLDING ?AUTO_27119 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_27119 )
      ( MAKE-ON ?AUTO_27116 ?AUTO_27117 ) )
    :id ( 2913 )
    :q-value ( 14.5 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_27130 - BLOCK
      ?AUTO_27131 - BLOCK
    )
    :vars
    (
      ?AUTO_27135 - BLOCK
      ?AUTO_27134 - BLOCK
      ?AUTO_27142 - BLOCK
      ?AUTO_27141 - BLOCK
      ?AUTO_27139 - BLOCK
      ?AUTO_27140 - BLOCK
      ?AUTO_27133 - BLOCK
      ?AUTO_27137 - BLOCK
      ?AUTO_27132 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_27135 ?AUTO_27131 ) ( ON ?AUTO_27134 ?AUTO_27135 ) ( CLEAR ?AUTO_27142 ) ( ON ?AUTO_27141 ?AUTO_27134 ) ( ON ?AUTO_27130 ?AUTO_27139 ) ( CLEAR ?AUTO_27140 ) ( ON ?AUTO_27133 ?AUTO_27130 ) ( ON ?AUTO_27137 ?AUTO_27133 ) ( CLEAR ?AUTO_27137 ) ( ON ?AUTO_27132 ?AUTO_27141 ) ( CLEAR ?AUTO_27132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_27132 ?AUTO_27141 )
      ( MAKE-ON ?AUTO_27130 ?AUTO_27131 ) )
    :id ( 2914 )
    :q-value ( 16 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_27697 - BLOCK
      ?AUTO_27698 - BLOCK
    )
    :vars
    (
      ?AUTO_27702 - BLOCK
      ?AUTO_27701 - BLOCK
      ?AUTO_27703 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_27702 ?AUTO_27698 ) ( ON ?AUTO_27701 ?AUTO_27702 ) ( CLEAR ?AUTO_27701 ) ( CLEAR ?AUTO_27703 ) ( ON-TABLE ?AUTO_27697 ) ( CLEAR ?AUTO_27697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_27697 )
      ( MAKE-ON ?AUTO_27697 ?AUTO_27698 ) )
    :id ( 2973 )
    :q-value ( 8.66667 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_27765 - BLOCK
      ?AUTO_27766 - BLOCK
    )
    :vars
    (
      ?AUTO_27770 - BLOCK
      ?AUTO_27774 - BLOCK
      ?AUTO_27771 - BLOCK
      ?AUTO_27768 - BLOCK
      ?AUTO_27773 - BLOCK
      ?AUTO_27769 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_27770 ?AUTO_27766 ) ( ON ?AUTO_27774 ?AUTO_27770 ) ( ON-TABLE ?AUTO_27765 ) ( ON ?AUTO_27771 ?AUTO_27765 ) ( CLEAR ?AUTO_27768 ) ( ON ?AUTO_27773 ?AUTO_27771 ) ( CLEAR ?AUTO_27773 ) ( HOLDING ?AUTO_27769 ) ( CLEAR ?AUTO_27774 ) )
    :subtasks
    ( ( !STACK ?AUTO_27769 ?AUTO_27774 )
      ( MAKE-ON ?AUTO_27765 ?AUTO_27766 ) )
    :id ( 2980 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_28051 - BLOCK
      ?AUTO_28052 - BLOCK
    )
    :vars
    (
      ?AUTO_28057 - BLOCK
      ?AUTO_28053 - BLOCK
      ?AUTO_28056 - BLOCK
      ?AUTO_28059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_28051 ) ( CLEAR ?AUTO_28057 ) ( ON ?AUTO_28053 ?AUTO_28051 ) ( CLEAR ?AUTO_28053 ) ( CLEAR ?AUTO_28052 ) ( ON ?AUTO_28056 ?AUTO_28059 ) ( CLEAR ?AUTO_28056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_28056 ?AUTO_28059 )
      ( MAKE-ON ?AUTO_28051 ?AUTO_28052 ) )
    :id ( 3016 )
    :q-value ( 8 )
    :q-count ( 8 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_28356 - BLOCK
      ?AUTO_28357 - BLOCK
    )
    :vars
    (
      ?AUTO_28360 - BLOCK
      ?AUTO_28359 - BLOCK
      ?AUTO_28361 - BLOCK
      ?AUTO_28362 - BLOCK
      ?AUTO_28365 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_28356 ?AUTO_28360 ) ( CLEAR ?AUTO_28359 ) ( ON ?AUTO_28361 ?AUTO_28356 ) ( CLEAR ?AUTO_28361 ) ( CLEAR ?AUTO_28357 ) ( ON ?AUTO_28362 ?AUTO_28365 ) ( CLEAR ?AUTO_28362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_28362 ?AUTO_28365 )
      ( MAKE-ON ?AUTO_28356 ?AUTO_28357 ) )
    :id ( 3047 )
    :q-value ( 8 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_29170 - BLOCK
      ?AUTO_29171 - BLOCK
    )
    :vars
    (
      ?AUTO_29180 - BLOCK
      ?AUTO_29173 - BLOCK
      ?AUTO_29178 - BLOCK
      ?AUTO_29177 - BLOCK
      ?AUTO_29179 - BLOCK
      ?AUTO_29172 - BLOCK
      ?AUTO_29176 - BLOCK
      ?AUTO_29174 - BLOCK
      ?AUTO_29181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_29170 ) ( CLEAR ?AUTO_29180 ) ( CLEAR ?AUTO_29173 ) ( ON ?AUTO_29178 ?AUTO_29171 ) ( CLEAR ?AUTO_29177 ) ( ON ?AUTO_29179 ?AUTO_29170 ) ( CLEAR ?AUTO_29172 ) ( ON ?AUTO_29176 ?AUTO_29179 ) ( CLEAR ?AUTO_29178 ) ( ON ?AUTO_29174 ?AUTO_29176 ) ( ON ?AUTO_29181 ?AUTO_29174 ) ( CLEAR ?AUTO_29181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_29181 ?AUTO_29174 )
      ( MAKE-ON ?AUTO_29170 ?AUTO_29171 ) )
    :id ( 3133 )
    :q-value ( 13.6667 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_29185 - BLOCK
      ?AUTO_29186 - BLOCK
    )
    :vars
    (
      ?AUTO_29191 - BLOCK
      ?AUTO_29192 - BLOCK
      ?AUTO_29187 - BLOCK
      ?AUTO_29188 - BLOCK
      ?AUTO_29195 - BLOCK
      ?AUTO_29196 - BLOCK
      ?AUTO_29189 - BLOCK
      ?AUTO_29190 - BLOCK
      ?AUTO_29194 - BLOCK
      ?AUTO_29199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_29185 ) ( CLEAR ?AUTO_29191 ) ( CLEAR ?AUTO_29192 ) ( ON ?AUTO_29187 ?AUTO_29186 ) ( CLEAR ?AUTO_29188 ) ( ON ?AUTO_29195 ?AUTO_29185 ) ( ON ?AUTO_29196 ?AUTO_29195 ) ( CLEAR ?AUTO_29187 ) ( ON ?AUTO_29189 ?AUTO_29196 ) ( ON ?AUTO_29190 ?AUTO_29189 ) ( CLEAR ?AUTO_29190 ) ( HOLDING ?AUTO_29194 ) ( CLEAR ?AUTO_29199 ) )
    :subtasks
    ( ( !STACK ?AUTO_29194 ?AUTO_29199 )
      ( MAKE-ON ?AUTO_29185 ?AUTO_29186 ) )
    :id ( 3134 )
    :q-value ( 15 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_29200 - BLOCK
      ?AUTO_29201 - BLOCK
    )
    :vars
    (
      ?AUTO_29209 - BLOCK
      ?AUTO_29212 - BLOCK
      ?AUTO_29206 - BLOCK
      ?AUTO_29204 - BLOCK
      ?AUTO_29205 - BLOCK
      ?AUTO_29207 - BLOCK
      ?AUTO_29202 - BLOCK
      ?AUTO_29211 - BLOCK
      ?AUTO_29213 - BLOCK
      ?AUTO_29203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_29200 ) ( CLEAR ?AUTO_29209 ) ( CLEAR ?AUTO_29212 ) ( ON ?AUTO_29206 ?AUTO_29201 ) ( CLEAR ?AUTO_29204 ) ( ON ?AUTO_29205 ?AUTO_29200 ) ( ON ?AUTO_29207 ?AUTO_29205 ) ( ON ?AUTO_29202 ?AUTO_29207 ) ( ON ?AUTO_29211 ?AUTO_29202 ) ( CLEAR ?AUTO_29211 ) ( CLEAR ?AUTO_29213 ) ( ON ?AUTO_29203 ?AUTO_29206 ) ( CLEAR ?AUTO_29203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_29203 ?AUTO_29206 )
      ( MAKE-ON ?AUTO_29200 ?AUTO_29201 ) )
    :id ( 3135 )
    :q-value ( 19.3333 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_29501 - BLOCK
      ?AUTO_29502 - BLOCK
    )
    :vars
    (
      ?AUTO_29508 - BLOCK
      ?AUTO_29506 - BLOCK
      ?AUTO_29504 - BLOCK
      ?AUTO_29503 - BLOCK
      ?AUTO_29509 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_29502 ) ( ON-TABLE ?AUTO_29501 ) ( ON ?AUTO_29508 ?AUTO_29501 ) ( ON ?AUTO_29506 ?AUTO_29508 ) ( ON ?AUTO_29504 ?AUTO_29506 ) ( ON ?AUTO_29503 ?AUTO_29504 ) ( CLEAR ?AUTO_29503 ) ( HOLDING ?AUTO_29509 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_29509 )
      ( MAKE-ON ?AUTO_29501 ?AUTO_29502 ) )
    :id ( 3182 )
    :q-value ( 11.5 )
    :q-count ( 16 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_29879 - BLOCK
      ?AUTO_29880 - BLOCK
    )
    :vars
    (
      ?AUTO_29884 - BLOCK
      ?AUTO_29886 - BLOCK
      ?AUTO_29883 - BLOCK
      ?AUTO_29881 - BLOCK
      ?AUTO_29887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_29879 ) ( ON ?AUTO_29884 ?AUTO_29879 ) ( CLEAR ?AUTO_29886 ) ( ON ?AUTO_29883 ?AUTO_29884 ) ( ON ?AUTO_29881 ?AUTO_29883 ) ( CLEAR ?AUTO_29881 ) ( HOLDING ?AUTO_29887 ) ( CLEAR ?AUTO_29880 ) )
    :subtasks
    ( ( !STACK ?AUTO_29887 ?AUTO_29880 )
      ( MAKE-ON ?AUTO_29879 ?AUTO_29880 ) )
    :id ( 3230 )
    :q-value ( 12.5 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_30249 - BLOCK
      ?AUTO_30250 - BLOCK
    )
    :vars
    (
      ?AUTO_30255 - BLOCK
      ?AUTO_30251 - BLOCK
      ?AUTO_30256 - BLOCK
      ?AUTO_30254 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_30255 ) ( ON ?AUTO_30251 ?AUTO_30250 ) ( CLEAR ?AUTO_30256 ) ( ON-TABLE ?AUTO_30249 ) ( CLEAR ?AUTO_30249 ) ( HOLDING ?AUTO_30254 ) ( CLEAR ?AUTO_30251 ) )
    :subtasks
    ( ( !STACK ?AUTO_30254 ?AUTO_30251 )
      ( MAKE-ON ?AUTO_30249 ?AUTO_30250 ) )
    :id ( 3273 )
    :q-value ( 10.5 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_30906 - BLOCK
      ?AUTO_30907 - BLOCK
    )
    :vars
    (
      ?AUTO_30910 - BLOCK
      ?AUTO_30911 - BLOCK
      ?AUTO_30912 - BLOCK
      ?AUTO_30909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_30906 ) ( CLEAR ?AUTO_30910 ) ( CLEAR ?AUTO_30911 ) ( ON ?AUTO_30912 ?AUTO_30907 ) ( CLEAR ?AUTO_30912 ) ( CLEAR ?AUTO_30906 ) ( ON-TABLE ?AUTO_30909 ) ( CLEAR ?AUTO_30909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_30909 )
      ( MAKE-ON ?AUTO_30906 ?AUTO_30907 ) )
    :id ( 3354 )
    :q-value ( 8.36364 )
    :q-count ( 11 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_31331 - BLOCK
      ?AUTO_31332 - BLOCK
    )
    :vars
    (
      ?AUTO_31336 - BLOCK
      ?AUTO_31335 - BLOCK
      ?AUTO_31338 - BLOCK
      ?AUTO_31333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_31331 ) ( CLEAR ?AUTO_31336 ) ( ON ?AUTO_31335 ?AUTO_31331 ) ( ON ?AUTO_31338 ?AUTO_31335 ) ( CLEAR ?AUTO_31338 ) ( HOLDING ?AUTO_31333 ) ( CLEAR ?AUTO_31332 ) )
    :subtasks
    ( ( !STACK ?AUTO_31333 ?AUTO_31332 )
      ( MAKE-ON ?AUTO_31331 ?AUTO_31332 ) )
    :id ( 3407 )
    :q-value ( 9.36364 )
    :q-count ( 11 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_31405 - BLOCK
      ?AUTO_31406 - BLOCK
    )
    :vars
    (
      ?AUTO_31413 - BLOCK
      ?AUTO_31412 - BLOCK
      ?AUTO_31409 - BLOCK
      ?AUTO_31408 - BLOCK
      ?AUTO_31414 - BLOCK
      ?AUTO_31411 - BLOCK
      ?AUTO_31415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_31405 ) ( CLEAR ?AUTO_31413 ) ( ON ?AUTO_31412 ?AUTO_31405 ) ( ON ?AUTO_31409 ?AUTO_31412 ) ( ON ?AUTO_31408 ?AUTO_31409 ) ( CLEAR ?AUTO_31408 ) ( ON ?AUTO_31414 ?AUTO_31406 ) ( ON ?AUTO_31411 ?AUTO_31414 ) ( CLEAR ?AUTO_31411 ) ( HOLDING ?AUTO_31415 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_31415 )
      ( MAKE-ON ?AUTO_31405 ?AUTO_31406 ) )
    :id ( 3414 )
    :q-value ( 15 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_31574 - BLOCK
      ?AUTO_31575 - BLOCK
    )
    :vars
    (
      ?AUTO_31584 - BLOCK
      ?AUTO_31577 - BLOCK
      ?AUTO_31578 - BLOCK
      ?AUTO_31579 - BLOCK
      ?AUTO_31581 - BLOCK
      ?AUTO_31583 - BLOCK
      ?AUTO_31582 - BLOCK
      ?AUTO_31576 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_31574 ?AUTO_31584 ) ( CLEAR ?AUTO_31577 ) ( ON ?AUTO_31578 ?AUTO_31575 ) ( ON ?AUTO_31579 ?AUTO_31578 ) ( ON ?AUTO_31581 ?AUTO_31579 ) ( CLEAR ?AUTO_31581 ) ( ON ?AUTO_31583 ?AUTO_31574 ) ( ON ?AUTO_31582 ?AUTO_31583 ) ( ON ?AUTO_31576 ?AUTO_31582 ) ( CLEAR ?AUTO_31576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_31576 ?AUTO_31582 )
      ( MAKE-ON ?AUTO_31574 ?AUTO_31575 ) )
    :id ( 3430 )
    :q-value ( 14 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_31588 - BLOCK
      ?AUTO_31589 - BLOCK
    )
    :vars
    (
      ?AUTO_31598 - BLOCK
      ?AUTO_31591 - BLOCK
      ?AUTO_31595 - BLOCK
      ?AUTO_31593 - BLOCK
      ?AUTO_31596 - BLOCK
      ?AUTO_31590 - BLOCK
      ?AUTO_31594 - BLOCK
      ?AUTO_31599 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_31588 ?AUTO_31598 ) ( ON ?AUTO_31591 ?AUTO_31589 ) ( ON ?AUTO_31595 ?AUTO_31591 ) ( ON ?AUTO_31593 ?AUTO_31595 ) ( CLEAR ?AUTO_31593 ) ( ON ?AUTO_31596 ?AUTO_31588 ) ( ON ?AUTO_31590 ?AUTO_31596 ) ( ON ?AUTO_31594 ?AUTO_31590 ) ( CLEAR ?AUTO_31594 ) ( HOLDING ?AUTO_31599 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_31599 )
      ( MAKE-ON ?AUTO_31588 ?AUTO_31589 ) )
    :id ( 3431 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_31601 - BLOCK
      ?AUTO_31602 - BLOCK
    )
    :vars
    (
      ?AUTO_31605 - BLOCK
      ?AUTO_31606 - BLOCK
      ?AUTO_31611 - BLOCK
      ?AUTO_31612 - BLOCK
      ?AUTO_31609 - BLOCK
      ?AUTO_31608 - BLOCK
      ?AUTO_31610 - BLOCK
      ?AUTO_31603 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_31601 ?AUTO_31605 ) ( ON ?AUTO_31606 ?AUTO_31602 ) ( ON ?AUTO_31611 ?AUTO_31606 ) ( ON ?AUTO_31612 ?AUTO_31611 ) ( ON ?AUTO_31609 ?AUTO_31601 ) ( ON ?AUTO_31608 ?AUTO_31609 ) ( ON ?AUTO_31610 ?AUTO_31608 ) ( CLEAR ?AUTO_31610 ) ( ON ?AUTO_31603 ?AUTO_31612 ) ( CLEAR ?AUTO_31603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_31603 ?AUTO_31612 )
      ( MAKE-ON ?AUTO_31601 ?AUTO_31602 ) )
    :id ( 3432 )
    :q-value ( 16 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_32099 - BLOCK
      ?AUTO_32100 - BLOCK
    )
    :vars
    (
      ?AUTO_32110 - BLOCK
      ?AUTO_32108 - BLOCK
      ?AUTO_32109 - BLOCK
      ?AUTO_32104 - BLOCK
      ?AUTO_32106 - BLOCK
      ?AUTO_32101 - BLOCK
      ?AUTO_32103 - BLOCK
      ?AUTO_32107 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_32099 ?AUTO_32110 ) ( CLEAR ?AUTO_32108 ) ( ON ?AUTO_32109 ?AUTO_32100 ) ( ON ?AUTO_32104 ?AUTO_32109 ) ( ON ?AUTO_32106 ?AUTO_32104 ) ( CLEAR ?AUTO_32101 ) ( ON ?AUTO_32103 ?AUTO_32099 ) ( CLEAR ?AUTO_32103 ) ( ON ?AUTO_32107 ?AUTO_32106 ) ( CLEAR ?AUTO_32107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_32107 ?AUTO_32106 )
      ( MAKE-ON ?AUTO_32099 ?AUTO_32100 ) )
    :id ( 3462 )
    :q-value ( 14 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_32522 - BLOCK
      ?AUTO_32523 - BLOCK
    )
    :vars
    (
      ?AUTO_32524 - BLOCK
      ?AUTO_32531 - BLOCK
      ?AUTO_32525 - BLOCK
      ?AUTO_32532 - BLOCK
      ?AUTO_32528 - BLOCK
      ?AUTO_32527 - BLOCK
      ?AUTO_32529 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_32522 ?AUTO_32524 ) ( ON ?AUTO_32531 ?AUTO_32522 ) ( CLEAR ?AUTO_32525 ) ( ON ?AUTO_32532 ?AUTO_32523 ) ( ON ?AUTO_32528 ?AUTO_32532 ) ( CLEAR ?AUTO_32528 ) ( ON ?AUTO_32527 ?AUTO_32531 ) ( ON ?AUTO_32529 ?AUTO_32527 ) ( CLEAR ?AUTO_32529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_32529 ?AUTO_32527 )
      ( MAKE-ON ?AUTO_32522 ?AUTO_32523 ) )
    :id ( 3516 )
    :q-value ( 12 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_32736 - BLOCK
      ?AUTO_32737 - BLOCK
    )
    :vars
    (
      ?AUTO_32741 - BLOCK
      ?AUTO_32742 - BLOCK
      ?AUTO_32738 - BLOCK
      ?AUTO_32743 - BLOCK
      ?AUTO_32744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_32736 ) ( ON ?AUTO_32741 ?AUTO_32736 ) ( ON ?AUTO_32737 ?AUTO_32741 ) ( ON ?AUTO_32742 ?AUTO_32737 ) ( ON ?AUTO_32738 ?AUTO_32742 ) ( CLEAR ?AUTO_32738 ) ( HOLDING ?AUTO_32743 ) ( CLEAR ?AUTO_32744 ) )
    :subtasks
    ( ( !STACK ?AUTO_32743 ?AUTO_32744 )
      ( MAKE-ON ?AUTO_32736 ?AUTO_32737 ) )
    :id ( 3553 )
    :q-value ( 11 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_32822 - BLOCK
      ?AUTO_32823 - BLOCK
    )
    :vars
    (
      ?AUTO_32824 - BLOCK
      ?AUTO_32826 - BLOCK
      ?AUTO_32827 - BLOCK
      ?AUTO_32829 - BLOCK
      ?AUTO_32830 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_32824 ?AUTO_32823 ) ( ON ?AUTO_32826 ?AUTO_32824 ) ( ON ?AUTO_32827 ?AUTO_32826 ) ( ON ?AUTO_32822 ?AUTO_32827 ) ( CLEAR ?AUTO_32822 ) ( HOLDING ?AUTO_32829 ) ( CLEAR ?AUTO_32830 ) )
    :subtasks
    ( ( !STACK ?AUTO_32829 ?AUTO_32830 )
      ( MAKE-ON ?AUTO_32822 ?AUTO_32823 ) )
    :id ( 3564 )
    :q-value ( 11.3333 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_33597 - BLOCK
      ?AUTO_33598 - BLOCK
    )
    :vars
    (
      ?AUTO_33603 - BLOCK
      ?AUTO_33602 - BLOCK
      ?AUTO_33599 - BLOCK
      ?AUTO_33601 - BLOCK
      ?AUTO_33605 - BLOCK
      ?AUTO_33606 - BLOCK
      ?AUTO_33607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_33597 ) ( CLEAR ?AUTO_33603 ) ( ON ?AUTO_33602 ?AUTO_33597 ) ( ON ?AUTO_33599 ?AUTO_33602 ) ( ON ?AUTO_33598 ?AUTO_33599 ) ( CLEAR ?AUTO_33601 ) ( ON ?AUTO_33605 ?AUTO_33598 ) ( CLEAR ?AUTO_33605 ) ( HOLDING ?AUTO_33606 ) ( CLEAR ?AUTO_33607 ) )
    :subtasks
    ( ( !STACK ?AUTO_33606 ?AUTO_33607 )
      ( MAKE-ON ?AUTO_33597 ?AUTO_33598 ) )
    :id ( 3637 )
    :q-value ( 11 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34256 - BLOCK
      ?AUTO_34257 - BLOCK
    )
    :vars
    (
      ?AUTO_34264 - BLOCK
      ?AUTO_34263 - BLOCK
      ?AUTO_34260 - BLOCK
      ?AUTO_34261 - BLOCK
      ?AUTO_34262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34256 ?AUTO_34264 ) ( ON ?AUTO_34263 ?AUTO_34256 ) ( ON ?AUTO_34260 ?AUTO_34263 ) ( ON ?AUTO_34261 ?AUTO_34260 ) ( CLEAR ?AUTO_34261 ) ( HOLDING ?AUTO_34262 ) ( CLEAR ?AUTO_34257 ) )
    :subtasks
    ( ( !STACK ?AUTO_34262 ?AUTO_34257 )
      ( MAKE-ON ?AUTO_34256 ?AUTO_34257 ) )
    :id ( 3713 )
    :q-value ( 11 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34267 - BLOCK
      ?AUTO_34268 - BLOCK
    )
    :vars
    (
      ?AUTO_34271 - BLOCK
      ?AUTO_34272 - BLOCK
      ?AUTO_34273 - BLOCK
      ?AUTO_34269 - BLOCK
      ?AUTO_34270 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34267 ?AUTO_34271 ) ( ON ?AUTO_34272 ?AUTO_34267 ) ( ON ?AUTO_34273 ?AUTO_34272 ) ( ON ?AUTO_34269 ?AUTO_34273 ) ( CLEAR ?AUTO_34268 ) ( ON ?AUTO_34270 ?AUTO_34269 ) ( CLEAR ?AUTO_34270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_34270 ?AUTO_34269 )
      ( MAKE-ON ?AUTO_34267 ?AUTO_34268 ) )
    :id ( 3714 )
    :q-value ( 10.5 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34278 - BLOCK
      ?AUTO_34279 - BLOCK
    )
    :vars
    (
      ?AUTO_34285 - BLOCK
      ?AUTO_34283 - BLOCK
      ?AUTO_34282 - BLOCK
      ?AUTO_34280 - BLOCK
      ?AUTO_34281 - BLOCK
      ?AUTO_34287 - BLOCK
      ?AUTO_34288 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34278 ?AUTO_34285 ) ( ON ?AUTO_34283 ?AUTO_34278 ) ( ON ?AUTO_34282 ?AUTO_34283 ) ( ON ?AUTO_34280 ?AUTO_34282 ) ( CLEAR ?AUTO_34279 ) ( ON ?AUTO_34281 ?AUTO_34280 ) ( CLEAR ?AUTO_34281 ) ( HOLDING ?AUTO_34287 ) ( CLEAR ?AUTO_34288 ) )
    :subtasks
    ( ( !STACK ?AUTO_34287 ?AUTO_34288 )
      ( MAKE-ON ?AUTO_34278 ?AUTO_34279 ) )
    :id ( 3715 )
    :q-value ( 12 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34289 - BLOCK
      ?AUTO_34290 - BLOCK
    )
    :vars
    (
      ?AUTO_34297 - BLOCK
      ?AUTO_34295 - BLOCK
      ?AUTO_34298 - BLOCK
      ?AUTO_34293 - BLOCK
      ?AUTO_34294 - BLOCK
      ?AUTO_34291 - BLOCK
      ?AUTO_34292 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34289 ?AUTO_34297 ) ( ON ?AUTO_34295 ?AUTO_34289 ) ( ON ?AUTO_34298 ?AUTO_34295 ) ( ON ?AUTO_34293 ?AUTO_34298 ) ( ON ?AUTO_34294 ?AUTO_34293 ) ( CLEAR ?AUTO_34294 ) ( CLEAR ?AUTO_34291 ) ( ON ?AUTO_34292 ?AUTO_34290 ) ( CLEAR ?AUTO_34292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_34292 ?AUTO_34290 )
      ( MAKE-ON ?AUTO_34289 ?AUTO_34290 ) )
    :id ( 3716 )
    :q-value ( 14 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34302 - BLOCK
      ?AUTO_34303 - BLOCK
    )
    :vars
    (
      ?AUTO_34309 - BLOCK
      ?AUTO_34312 - BLOCK
      ?AUTO_34310 - BLOCK
      ?AUTO_34311 - BLOCK
      ?AUTO_34308 - BLOCK
      ?AUTO_34305 - BLOCK
      ?AUTO_34307 - BLOCK
      ?AUTO_34314 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34302 ?AUTO_34309 ) ( ON ?AUTO_34312 ?AUTO_34302 ) ( ON ?AUTO_34310 ?AUTO_34312 ) ( ON ?AUTO_34311 ?AUTO_34310 ) ( ON ?AUTO_34308 ?AUTO_34311 ) ( CLEAR ?AUTO_34308 ) ( ON ?AUTO_34305 ?AUTO_34303 ) ( CLEAR ?AUTO_34305 ) ( HOLDING ?AUTO_34307 ) ( CLEAR ?AUTO_34314 ) )
    :subtasks
    ( ( !STACK ?AUTO_34307 ?AUTO_34314 )
      ( MAKE-ON ?AUTO_34302 ?AUTO_34303 ) )
    :id ( 3717 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34325 - BLOCK
      ?AUTO_34326 - BLOCK
    )
    :vars
    (
      ?AUTO_34332 - BLOCK
      ?AUTO_34327 - BLOCK
      ?AUTO_34329 - BLOCK
      ?AUTO_34333 - BLOCK
      ?AUTO_34331 - BLOCK
      ?AUTO_34334 - BLOCK
      ?AUTO_34328 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34325 ?AUTO_34332 ) ( ON ?AUTO_34327 ?AUTO_34325 ) ( ON ?AUTO_34329 ?AUTO_34327 ) ( ON ?AUTO_34333 ?AUTO_34329 ) ( CLEAR ?AUTO_34331 ) ( ON ?AUTO_34334 ?AUTO_34326 ) ( CLEAR ?AUTO_34334 ) ( HOLDING ?AUTO_34328 ) ( CLEAR ?AUTO_34333 ) )
    :subtasks
    ( ( !STACK ?AUTO_34328 ?AUTO_34333 )
      ( MAKE-ON ?AUTO_34325 ?AUTO_34326 ) )
    :id ( 3718 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34351 - BLOCK
      ?AUTO_34352 - BLOCK
    )
    :vars
    (
      ?AUTO_34361 - BLOCK
      ?AUTO_34360 - BLOCK
      ?AUTO_34358 - BLOCK
      ?AUTO_34354 - BLOCK
      ?AUTO_34357 - BLOCK
      ?AUTO_34359 - BLOCK
      ?AUTO_34353 - BLOCK
      ?AUTO_34363 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34351 ?AUTO_34361 ) ( ON ?AUTO_34360 ?AUTO_34351 ) ( ON ?AUTO_34358 ?AUTO_34360 ) ( ON ?AUTO_34354 ?AUTO_34358 ) ( ON ?AUTO_34357 ?AUTO_34352 ) ( CLEAR ?AUTO_34354 ) ( ON ?AUTO_34359 ?AUTO_34357 ) ( CLEAR ?AUTO_34359 ) ( HOLDING ?AUTO_34353 ) ( CLEAR ?AUTO_34363 ) )
    :subtasks
    ( ( !STACK ?AUTO_34353 ?AUTO_34363 )
      ( MAKE-ON ?AUTO_34351 ?AUTO_34352 ) )
    :id ( 3720 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34364 - BLOCK
      ?AUTO_34365 - BLOCK
    )
    :vars
    (
      ?AUTO_34366 - BLOCK
      ?AUTO_34368 - BLOCK
      ?AUTO_34367 - BLOCK
      ?AUTO_34370 - BLOCK
      ?AUTO_34374 - BLOCK
      ?AUTO_34373 - BLOCK
      ?AUTO_34375 - BLOCK
      ?AUTO_34372 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34364 ?AUTO_34366 ) ( ON ?AUTO_34368 ?AUTO_34364 ) ( ON ?AUTO_34367 ?AUTO_34368 ) ( ON ?AUTO_34370 ?AUTO_34367 ) ( ON ?AUTO_34374 ?AUTO_34365 ) ( CLEAR ?AUTO_34370 ) ( ON ?AUTO_34373 ?AUTO_34374 ) ( CLEAR ?AUTO_34375 ) ( ON ?AUTO_34372 ?AUTO_34373 ) ( CLEAR ?AUTO_34372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_34372 ?AUTO_34373 )
      ( MAKE-ON ?AUTO_34364 ?AUTO_34365 ) )
    :id ( 3721 )
    :q-value ( 18 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34906 - BLOCK
      ?AUTO_34907 - BLOCK
    )
    :vars
    (
      ?AUTO_34915 - BLOCK
      ?AUTO_34914 - BLOCK
      ?AUTO_34910 - BLOCK
      ?AUTO_34912 - BLOCK
      ?AUTO_34911 - BLOCK
      ?AUTO_34908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_34915 ) ( ON ?AUTO_34914 ?AUTO_34907 ) ( ON ?AUTO_34910 ?AUTO_34914 ) ( ON ?AUTO_34912 ?AUTO_34910 ) ( ON ?AUTO_34911 ?AUTO_34912 ) ( CLEAR ?AUTO_34908 ) ( ON ?AUTO_34906 ?AUTO_34911 ) ( CLEAR ?AUTO_34906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_34906 ?AUTO_34911 )
      ( MAKE-ON ?AUTO_34906 ?AUTO_34907 ) )
    :id ( 3737 )
    :q-value ( 12 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34918 - BLOCK
      ?AUTO_34919 - BLOCK
    )
    :vars
    (
      ?AUTO_34920 - BLOCK
      ?AUTO_34924 - BLOCK
      ?AUTO_34921 - BLOCK
      ?AUTO_34925 - BLOCK
      ?AUTO_34926 - BLOCK
      ?AUTO_34927 - BLOCK
      ?AUTO_34929 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34920 ?AUTO_34919 ) ( ON ?AUTO_34924 ?AUTO_34920 ) ( ON ?AUTO_34921 ?AUTO_34924 ) ( ON ?AUTO_34925 ?AUTO_34921 ) ( CLEAR ?AUTO_34926 ) ( ON ?AUTO_34918 ?AUTO_34925 ) ( CLEAR ?AUTO_34918 ) ( HOLDING ?AUTO_34927 ) ( CLEAR ?AUTO_34929 ) )
    :subtasks
    ( ( !STACK ?AUTO_34927 ?AUTO_34929 )
      ( MAKE-ON ?AUTO_34918 ?AUTO_34919 ) )
    :id ( 3738 )
    :q-value ( 13 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34948 - BLOCK
      ?AUTO_34949 - BLOCK
    )
    :vars
    (
      ?AUTO_34952 - BLOCK
      ?AUTO_34950 - BLOCK
      ?AUTO_34954 - BLOCK
      ?AUTO_34956 - BLOCK
      ?AUTO_34955 - BLOCK
      ?AUTO_34957 - BLOCK
      ?AUTO_34958 - BLOCK
      ?AUTO_34959 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34948 ?AUTO_34952 ) ( CLEAR ?AUTO_34948 ) ( CLEAR ?AUTO_34950 ) ( ON ?AUTO_34954 ?AUTO_34949 ) ( ON ?AUTO_34956 ?AUTO_34954 ) ( ON ?AUTO_34955 ?AUTO_34956 ) ( ON ?AUTO_34957 ?AUTO_34955 ) ( CLEAR ?AUTO_34957 ) ( HOLDING ?AUTO_34958 ) ( CLEAR ?AUTO_34959 ) )
    :subtasks
    ( ( !STACK ?AUTO_34958 ?AUTO_34959 )
      ( MAKE-ON ?AUTO_34948 ?AUTO_34949 ) )
    :id ( 3739 )
    :q-value ( 11 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34960 - BLOCK
      ?AUTO_34961 - BLOCK
    )
    :vars
    (
      ?AUTO_34965 - BLOCK
      ?AUTO_34966 - BLOCK
      ?AUTO_34963 - BLOCK
      ?AUTO_34967 - BLOCK
      ?AUTO_34969 - BLOCK
      ?AUTO_34962 - BLOCK
      ?AUTO_34971 - BLOCK
      ?AUTO_34970 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34960 ?AUTO_34965 ) ( CLEAR ?AUTO_34966 ) ( ON ?AUTO_34963 ?AUTO_34961 ) ( ON ?AUTO_34967 ?AUTO_34963 ) ( ON ?AUTO_34969 ?AUTO_34967 ) ( ON ?AUTO_34962 ?AUTO_34969 ) ( CLEAR ?AUTO_34962 ) ( CLEAR ?AUTO_34971 ) ( ON ?AUTO_34970 ?AUTO_34960 ) ( CLEAR ?AUTO_34970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_34970 ?AUTO_34960 )
      ( MAKE-ON ?AUTO_34960 ?AUTO_34961 ) )
    :id ( 3740 )
    :q-value ( 12 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_35572 - BLOCK
      ?AUTO_35573 - BLOCK
    )
    :vars
    (
      ?AUTO_35581 - BLOCK
      ?AUTO_35577 - BLOCK
      ?AUTO_35576 - BLOCK
      ?AUTO_35574 - BLOCK
      ?AUTO_35583 - BLOCK
      ?AUTO_35579 - BLOCK
      ?AUTO_35578 - BLOCK
      ?AUTO_35582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_35572 ) ( CLEAR ?AUTO_35581 ) ( ON ?AUTO_35577 ?AUTO_35573 ) ( CLEAR ?AUTO_35576 ) ( ON ?AUTO_35574 ?AUTO_35577 ) ( CLEAR ?AUTO_35583 ) ( CLEAR ?AUTO_35579 ) ( ON ?AUTO_35578 ?AUTO_35572 ) ( CLEAR ?AUTO_35578 ) ( HOLDING ?AUTO_35582 ) ( CLEAR ?AUTO_35574 ) )
    :subtasks
    ( ( !STACK ?AUTO_35582 ?AUTO_35574 )
      ( MAKE-ON ?AUTO_35572 ?AUTO_35573 ) )
    :id ( 3807 )
    :q-value ( 11.3333 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_36043 - BLOCK
      ?AUTO_36044 - BLOCK
    )
    :vars
    (
      ?AUTO_36054 - BLOCK
      ?AUTO_36053 - BLOCK
      ?AUTO_36052 - BLOCK
      ?AUTO_36049 - BLOCK
      ?AUTO_36050 - BLOCK
      ?AUTO_36045 - BLOCK
      ?AUTO_36048 - BLOCK
      ?AUTO_36055 - BLOCK
      ?AUTO_36051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_36043 ) ( ON ?AUTO_36054 ?AUTO_36043 ) ( CLEAR ?AUTO_36053 ) ( ON ?AUTO_36052 ?AUTO_36054 ) ( CLEAR ?AUTO_36049 ) ( CLEAR ?AUTO_36050 ) ( CLEAR ?AUTO_36045 ) ( ON ?AUTO_36048 ?AUTO_36044 ) ( ON ?AUTO_36055 ?AUTO_36048 ) ( CLEAR ?AUTO_36055 ) ( HOLDING ?AUTO_36051 ) ( CLEAR ?AUTO_36052 ) )
    :subtasks
    ( ( !STACK ?AUTO_36051 ?AUTO_36052 )
      ( MAKE-ON ?AUTO_36043 ?AUTO_36044 ) )
    :id ( 3838 )
    :q-value ( 16 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_36205 - BLOCK
      ?AUTO_36206 - BLOCK
    )
    :vars
    (
      ?AUTO_36207 - BLOCK
      ?AUTO_36208 - BLOCK
      ?AUTO_36210 - BLOCK
      ?AUTO_36212 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_36205 ?AUTO_36207 ) ( ON ?AUTO_36206 ?AUTO_36205 ) ( ON ?AUTO_36208 ?AUTO_36206 ) ( ON ?AUTO_36210 ?AUTO_36208 ) ( CLEAR ?AUTO_36210 ) ( HOLDING ?AUTO_36212 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_36212 )
      ( MAKE-ON ?AUTO_36205 ?AUTO_36206 ) )
    :id ( 3864 )
    :q-value ( 9 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_36474 - BLOCK
      ?AUTO_36475 - BLOCK
    )
    :vars
    (
      ?AUTO_36478 - BLOCK
      ?AUTO_36476 - BLOCK
      ?AUTO_36482 - BLOCK
      ?AUTO_36477 - BLOCK
      ?AUTO_36479 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_36478 ?AUTO_36475 ) ( ON ?AUTO_36476 ?AUTO_36478 ) ( ON ?AUTO_36482 ?AUTO_36476 ) ( CLEAR ?AUTO_36477 ) ( ON ?AUTO_36479 ?AUTO_36482 ) ( CLEAR ?AUTO_36479 ) ( HOLDING ?AUTO_36474 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_36474 )
      ( MAKE-ON ?AUTO_36474 ?AUTO_36475 ) )
    :id ( 3902 )
    :q-value ( 12.3333 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_36484 - BLOCK
      ?AUTO_36485 - BLOCK
    )
    :vars
    (
      ?AUTO_36489 - BLOCK
      ?AUTO_36486 - BLOCK
      ?AUTO_36490 - BLOCK
      ?AUTO_36492 - BLOCK
      ?AUTO_36488 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_36489 ?AUTO_36485 ) ( ON ?AUTO_36486 ?AUTO_36489 ) ( ON ?AUTO_36490 ?AUTO_36486 ) ( ON ?AUTO_36492 ?AUTO_36490 ) ( CLEAR ?AUTO_36492 ) ( ON ?AUTO_36484 ?AUTO_36488 ) ( CLEAR ?AUTO_36484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_36484 ?AUTO_36488 )
      ( MAKE-ON ?AUTO_36484 ?AUTO_36485 ) )
    :id ( 3903 )
    :q-value ( 12.8 )
    :q-count ( 5 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37176 - BLOCK
      ?AUTO_37177 - BLOCK
    )
    :vars
    (
      ?AUTO_37183 - BLOCK
      ?AUTO_37181 - BLOCK
      ?AUTO_37178 - BLOCK
      ?AUTO_37180 - BLOCK
      ?AUTO_37184 - BLOCK
      ?AUTO_37186 - BLOCK
      ?AUTO_37185 - BLOCK
      ?AUTO_37188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_37176 ) ( CLEAR ?AUTO_37183 ) ( ON ?AUTO_37181 ?AUTO_37176 ) ( CLEAR ?AUTO_37178 ) ( ON ?AUTO_37180 ?AUTO_37181 ) ( ON ?AUTO_37184 ?AUTO_37177 ) ( ON ?AUTO_37186 ?AUTO_37184 ) ( CLEAR ?AUTO_37186 ) ( CLEAR ?AUTO_37180 ) ( ON ?AUTO_37185 ?AUTO_37188 ) ( CLEAR ?AUTO_37185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_37185 ?AUTO_37188 )
      ( MAKE-ON ?AUTO_37176 ?AUTO_37177 ) )
    :id ( 3979 )
    :q-value ( 16 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37500 - BLOCK
      ?AUTO_37501 - BLOCK
    )
    :vars
    (
      ?AUTO_37505 - BLOCK
      ?AUTO_37507 - BLOCK
      ?AUTO_37502 - BLOCK
      ?AUTO_37503 - BLOCK
      ?AUTO_37509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_37500 ) ( CLEAR ?AUTO_37505 ) ( ON ?AUTO_37507 ?AUTO_37500 ) ( ON ?AUTO_37502 ?AUTO_37507 ) ( CLEAR ?AUTO_37502 ) ( CLEAR ?AUTO_37501 ) ( ON ?AUTO_37503 ?AUTO_37509 ) ( CLEAR ?AUTO_37503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_37503 ?AUTO_37509 )
      ( MAKE-ON ?AUTO_37500 ?AUTO_37501 ) )
    :id ( 4020 )
    :q-value ( 10 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37860 - BLOCK
      ?AUTO_37861 - BLOCK
    )
    :vars
    (
      ?AUTO_37862 - BLOCK
      ?AUTO_37863 - BLOCK
      ?AUTO_37867 - BLOCK
      ?AUTO_37868 - BLOCK
      ?AUTO_37866 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_37860 ?AUTO_37862 ) ( ON ?AUTO_37863 ?AUTO_37860 ) ( ON ?AUTO_37867 ?AUTO_37863 ) ( CLEAR ?AUTO_37868 ) ( ON ?AUTO_37861 ?AUTO_37867 ) ( CLEAR ?AUTO_37861 ) ( HOLDING ?AUTO_37866 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_37866 )
      ( MAKE-ON ?AUTO_37860 ?AUTO_37861 ) )
    :id ( 4065 )
    :q-value ( 9.2 )
    :q-count ( 10 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37979 - BLOCK
      ?AUTO_37980 - BLOCK
    )
    :vars
    (
      ?AUTO_37984 - BLOCK
      ?AUTO_37987 - BLOCK
      ?AUTO_37986 - BLOCK
      ?AUTO_37985 - BLOCK
      ?AUTO_37981 - BLOCK
      ?AUTO_37988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_37979 ) ( ON ?AUTO_37984 ?AUTO_37979 ) ( ON ?AUTO_37980 ?AUTO_37984 ) ( CLEAR ?AUTO_37987 ) ( ON ?AUTO_37986 ?AUTO_37980 ) ( CLEAR ?AUTO_37985 ) ( ON ?AUTO_37981 ?AUTO_37986 ) ( CLEAR ?AUTO_37981 ) ( HOLDING ?AUTO_37988 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_37988 )
      ( MAKE-ON ?AUTO_37979 ?AUTO_37980 ) )
    :id ( 4078 )
    :q-value ( 11 )
    :q-count ( 9 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_38383 - BLOCK
      ?AUTO_38384 - BLOCK
    )
    :vars
    (
      ?AUTO_38385 - BLOCK
      ?AUTO_38393 - BLOCK
      ?AUTO_38390 - BLOCK
      ?AUTO_38392 - BLOCK
      ?AUTO_38388 - BLOCK
      ?AUTO_38389 - BLOCK
      ?AUTO_38391 - BLOCK
      ?AUTO_38394 - BLOCK
      ?AUTO_38395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_38383 ) ( ON ?AUTO_38385 ?AUTO_38383 ) ( CLEAR ?AUTO_38385 ) ( CLEAR ?AUTO_38393 ) ( ON ?AUTO_38390 ?AUTO_38384 ) ( ON ?AUTO_38392 ?AUTO_38390 ) ( CLEAR ?AUTO_38388 ) ( ON ?AUTO_38389 ?AUTO_38392 ) ( CLEAR ?AUTO_38391 ) ( ON ?AUTO_38394 ?AUTO_38389 ) ( CLEAR ?AUTO_38394 ) ( HOLDING ?AUTO_38395 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_38395 )
      ( MAKE-ON ?AUTO_38383 ?AUTO_38384 ) )
    :id ( 4117 )
    :q-value ( 13.3333 )
    :q-count ( 6 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_38577 - BLOCK
      ?AUTO_38578 - BLOCK
    )
    :vars
    (
      ?AUTO_38583 - BLOCK
      ?AUTO_38584 - BLOCK
      ?AUTO_38581 - BLOCK
      ?AUTO_38582 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_38577 ?AUTO_38583 ) ( CLEAR ?AUTO_38584 ) ( ON ?AUTO_38581 ?AUTO_38578 ) ( CLEAR ?AUTO_38581 ) ( CLEAR ?AUTO_38577 ) ( ON-TABLE ?AUTO_38582 ) ( CLEAR ?AUTO_38582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_38582 )
      ( MAKE-ON ?AUTO_38577 ?AUTO_38578 ) )
    :id ( 4144 )
    :q-value ( 8 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_38739 - BLOCK
      ?AUTO_38740 - BLOCK
    )
    :vars
    (
      ?AUTO_38744 - BLOCK
      ?AUTO_38741 - BLOCK
      ?AUTO_38742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_38739 ) ( CLEAR ?AUTO_38744 ) ( ON ?AUTO_38741 ?AUTO_38739 ) ( CLEAR ?AUTO_38741 ) ( CLEAR ?AUTO_38740 ) ( ON-TABLE ?AUTO_38742 ) ( CLEAR ?AUTO_38742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_38742 )
      ( MAKE-ON ?AUTO_38739 ?AUTO_38740 ) )
    :id ( 4159 )
    :q-value ( 8 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_38747 - BLOCK
      ?AUTO_38748 - BLOCK
    )
    :vars
    (
      ?AUTO_38753 - BLOCK
      ?AUTO_38751 - BLOCK
      ?AUTO_38752 - BLOCK
      ?AUTO_38755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_38747 ) ( CLEAR ?AUTO_38753 ) ( ON ?AUTO_38751 ?AUTO_38747 ) ( CLEAR ?AUTO_38751 ) ( ON-TABLE ?AUTO_38752 ) ( CLEAR ?AUTO_38752 ) ( HOLDING ?AUTO_38748 ) ( CLEAR ?AUTO_38755 ) )
    :subtasks
    ( ( !STACK ?AUTO_38748 ?AUTO_38755 )
      ( MAKE-ON ?AUTO_38747 ?AUTO_38748 ) )
    :id ( 4160 )
    :q-value ( 9 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_39013 - BLOCK
      ?AUTO_39014 - BLOCK
    )
    :vars
    (
      ?AUTO_39020 - BLOCK
      ?AUTO_39016 - BLOCK
      ?AUTO_39017 - BLOCK
      ?AUTO_39018 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_39013 ) ( ON ?AUTO_39020 ?AUTO_39013 ) ( CLEAR ?AUTO_39016 ) ( ON ?AUTO_39017 ?AUTO_39014 ) ( CLEAR ?AUTO_39017 ) ( CLEAR ?AUTO_39020 ) ( ON-TABLE ?AUTO_39018 ) ( CLEAR ?AUTO_39018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_39018 )
      ( MAKE-ON ?AUTO_39013 ?AUTO_39014 ) )
    :id ( 4193 )
    :q-value ( 10 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_39162 - BLOCK
      ?AUTO_39163 - BLOCK
    )
    :vars
    (
      ?AUTO_39168 - BLOCK
      ?AUTO_39166 - BLOCK
      ?AUTO_39167 - BLOCK
      ?AUTO_39169 - BLOCK
      ?AUTO_39170 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_39162 ?AUTO_39168 ) ( ON ?AUTO_39163 ?AUTO_39162 ) ( ON ?AUTO_39166 ?AUTO_39163 ) ( ON ?AUTO_39167 ?AUTO_39166 ) ( CLEAR ?AUTO_39167 ) ( HOLDING ?AUTO_39169 ) ( CLEAR ?AUTO_39170 ) )
    :subtasks
    ( ( !STACK ?AUTO_39169 ?AUTO_39170 )
      ( MAKE-ON ?AUTO_39162 ?AUTO_39163 ) )
    :id ( 4219 )
    :q-value ( 9 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_40075 - BLOCK
      ?AUTO_40076 - BLOCK
    )
    :vars
    (
      ?AUTO_40084 - BLOCK
      ?AUTO_40078 - BLOCK
      ?AUTO_40086 - BLOCK
      ?AUTO_40083 - BLOCK
      ?AUTO_40080 - BLOCK
      ?AUTO_40082 - BLOCK
      ?AUTO_40077 - BLOCK
      ?AUTO_40081 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_40084 ) ( ON ?AUTO_40078 ?AUTO_40076 ) ( CLEAR ?AUTO_40086 ) ( ON-TABLE ?AUTO_40075 ) ( CLEAR ?AUTO_40083 ) ( ON ?AUTO_40080 ?AUTO_40075 ) ( ON ?AUTO_40082 ?AUTO_40080 ) ( ON ?AUTO_40077 ?AUTO_40082 ) ( CLEAR ?AUTO_40077 ) ( HOLDING ?AUTO_40081 ) ( CLEAR ?AUTO_40078 ) )
    :subtasks
    ( ( !STACK ?AUTO_40081 ?AUTO_40078 )
      ( MAKE-ON ?AUTO_40075 ?AUTO_40076 ) )
    :id ( 4317 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_40730 - BLOCK
      ?AUTO_40731 - BLOCK
    )
    :vars
    (
      ?AUTO_40732 - BLOCK
      ?AUTO_40736 - BLOCK
      ?AUTO_40738 - BLOCK
      ?AUTO_40741 - BLOCK
      ?AUTO_40733 - BLOCK
      ?AUTO_40735 - BLOCK
      ?AUTO_40740 - BLOCK
      ?AUTO_40742 - BLOCK
      ?AUTO_40739 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_40732 ) ( ON ?AUTO_40736 ?AUTO_40731 ) ( ON ?AUTO_40738 ?AUTO_40736 ) ( CLEAR ?AUTO_40741 ) ( ON ?AUTO_40733 ?AUTO_40738 ) ( CLEAR ?AUTO_40735 ) ( ON ?AUTO_40740 ?AUTO_40733 ) ( CLEAR ?AUTO_40740 ) ( ON ?AUTO_40742 ?AUTO_40739 ) ( ON ?AUTO_40730 ?AUTO_40742 ) ( CLEAR ?AUTO_40730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_40730 ?AUTO_40742 )
      ( MAKE-ON ?AUTO_40730 ?AUTO_40731 ) )
    :id ( 4391 )
    :q-value ( 16 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_41763 - BLOCK
      ?AUTO_41764 - BLOCK
    )
    :vars
    (
      ?AUTO_41771 - BLOCK
      ?AUTO_41770 - BLOCK
      ?AUTO_41768 - BLOCK
      ?AUTO_41769 - BLOCK
      ?AUTO_41766 - BLOCK
      ?AUTO_41772 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_41771 ) ( CLEAR ?AUTO_41770 ) ( ON ?AUTO_41768 ?AUTO_41764 ) ( ON ?AUTO_41769 ?AUTO_41768 ) ( CLEAR ?AUTO_41769 ) ( ON-TABLE ?AUTO_41766 ) ( CLEAR ?AUTO_41766 ) ( ON-TABLE ?AUTO_41772 ) ( ON ?AUTO_41763 ?AUTO_41772 ) ( CLEAR ?AUTO_41763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_41763 ?AUTO_41772 )
      ( MAKE-ON ?AUTO_41763 ?AUTO_41764 ) )
    :id ( 4501 )
    :q-value ( 16 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_41822 - BLOCK
      ?AUTO_41823 - BLOCK
    )
    :vars
    (
      ?AUTO_41827 - BLOCK
      ?AUTO_41829 - BLOCK
      ?AUTO_41830 - BLOCK
      ?AUTO_41824 - BLOCK
      ?AUTO_41828 - BLOCK
      ?AUTO_41831 - BLOCK
      ?AUTO_41832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_41827 ) ( CLEAR ?AUTO_41829 ) ( ON ?AUTO_41830 ?AUTO_41823 ) ( ON-TABLE ?AUTO_41824 ) ( ON ?AUTO_41822 ?AUTO_41824 ) ( ON ?AUTO_41828 ?AUTO_41822 ) ( CLEAR ?AUTO_41830 ) ( ON ?AUTO_41831 ?AUTO_41828 ) ( CLEAR ?AUTO_41831 ) ( HOLDING ?AUTO_41832 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_41832 )
      ( MAKE-ON ?AUTO_41822 ?AUTO_41823 ) )
    :id ( 4506 )
    :q-value ( 21 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_41846 - BLOCK
      ?AUTO_41847 - BLOCK
    )
    :vars
    (
      ?AUTO_41852 - BLOCK
      ?AUTO_41855 - BLOCK
      ?AUTO_41853 - BLOCK
      ?AUTO_41856 - BLOCK
      ?AUTO_41849 - BLOCK
      ?AUTO_41850 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_41852 ?AUTO_41847 ) ( ON-TABLE ?AUTO_41855 ) ( ON ?AUTO_41846 ?AUTO_41855 ) ( ON ?AUTO_41853 ?AUTO_41846 ) ( CLEAR ?AUTO_41852 ) ( ON ?AUTO_41856 ?AUTO_41853 ) ( ON ?AUTO_41849 ?AUTO_41856 ) ( CLEAR ?AUTO_41849 ) ( HOLDING ?AUTO_41850 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_41850 )
      ( MAKE-ON ?AUTO_41846 ?AUTO_41847 ) )
    :id ( 4508 )
    :q-value ( 23 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_41858 - BLOCK
      ?AUTO_41859 - BLOCK
    )
    :vars
    (
      ?AUTO_41865 - BLOCK
      ?AUTO_41860 - BLOCK
      ?AUTO_41862 - BLOCK
      ?AUTO_41861 - BLOCK
      ?AUTO_41863 - BLOCK
      ?AUTO_41864 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_41865 ?AUTO_41859 ) ( ON-TABLE ?AUTO_41860 ) ( ON ?AUTO_41858 ?AUTO_41860 ) ( ON ?AUTO_41862 ?AUTO_41858 ) ( ON ?AUTO_41861 ?AUTO_41862 ) ( ON ?AUTO_41863 ?AUTO_41861 ) ( CLEAR ?AUTO_41863 ) ( ON ?AUTO_41864 ?AUTO_41865 ) ( CLEAR ?AUTO_41864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_41864 ?AUTO_41865 )
      ( MAKE-ON ?AUTO_41858 ?AUTO_41859 ) )
    :id ( 4509 )
    :q-value ( 24 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_42076 - BLOCK
      ?AUTO_42077 - BLOCK
    )
    :vars
    (
      ?AUTO_42082 - BLOCK
      ?AUTO_42078 - BLOCK
      ?AUTO_42079 - BLOCK
      ?AUTO_42080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_42076 ) ( ON ?AUTO_42082 ?AUTO_42076 ) ( ON ?AUTO_42078 ?AUTO_42077 ) ( CLEAR ?AUTO_42078 ) ( CLEAR ?AUTO_42082 ) ( ON ?AUTO_42079 ?AUTO_42080 ) ( CLEAR ?AUTO_42079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_42079 ?AUTO_42080 )
      ( MAKE-ON ?AUTO_42076 ?AUTO_42077 ) )
    :id ( 4538 )
    :q-value ( 10 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_42953 - BLOCK
      ?AUTO_42954 - BLOCK
    )
    :vars
    (
      ?AUTO_42956 - BLOCK
      ?AUTO_42955 - BLOCK
      ?AUTO_42958 - BLOCK
      ?AUTO_42959 - BLOCK
      ?AUTO_42957 - BLOCK
      ?AUTO_42963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_42953 ) ( ON ?AUTO_42954 ?AUTO_42953 ) ( ON ?AUTO_42956 ?AUTO_42954 ) ( CLEAR ?AUTO_42955 ) ( ON ?AUTO_42958 ?AUTO_42956 ) ( ON ?AUTO_42959 ?AUTO_42958 ) ( CLEAR ?AUTO_42959 ) ( HOLDING ?AUTO_42957 ) ( CLEAR ?AUTO_42963 ) )
    :subtasks
    ( ( !STACK ?AUTO_42957 ?AUTO_42963 )
      ( MAKE-ON ?AUTO_42953 ?AUTO_42954 ) )
    :id ( 4621 )
    :q-value ( 11 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_43413 - BLOCK
      ?AUTO_43414 - BLOCK
    )
    :vars
    (
      ?AUTO_43419 - BLOCK
      ?AUTO_43415 - BLOCK
      ?AUTO_43421 - BLOCK
      ?AUTO_43418 - BLOCK
      ?AUTO_43422 - BLOCK
      ?AUTO_43420 - BLOCK
      ?AUTO_43417 - BLOCK
      ?AUTO_43425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_43413 ) ( ON ?AUTO_43419 ?AUTO_43413 ) ( ON ?AUTO_43415 ?AUTO_43414 ) ( ON ?AUTO_43421 ?AUTO_43415 ) ( ON ?AUTO_43418 ?AUTO_43421 ) ( ON ?AUTO_43422 ?AUTO_43418 ) ( CLEAR ?AUTO_43422 ) ( ON ?AUTO_43420 ?AUTO_43419 ) ( CLEAR ?AUTO_43420 ) ( HOLDING ?AUTO_43417 ) ( CLEAR ?AUTO_43425 ) )
    :subtasks
    ( ( !STACK ?AUTO_43417 ?AUTO_43425 )
      ( MAKE-ON ?AUTO_43413 ?AUTO_43414 ) )
    :id ( 4648 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_43444 - BLOCK
      ?AUTO_43445 - BLOCK
    )
    :vars
    (
      ?AUTO_43448 - BLOCK
      ?AUTO_43450 - BLOCK
      ?AUTO_43449 - BLOCK
      ?AUTO_43451 - BLOCK
      ?AUTO_43452 - BLOCK
      ?AUTO_43453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_43444 ) ( CLEAR ?AUTO_43448 ) ( ON ?AUTO_43450 ?AUTO_43445 ) ( ON ?AUTO_43449 ?AUTO_43450 ) ( ON ?AUTO_43451 ?AUTO_43449 ) ( ON ?AUTO_43452 ?AUTO_43451 ) ( CLEAR ?AUTO_43452 ) ( CLEAR ?AUTO_43444 ) ( ON-TABLE ?AUTO_43453 ) ( CLEAR ?AUTO_43453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_43453 )
      ( MAKE-ON ?AUTO_43444 ?AUTO_43445 ) )
    :id ( 4650 )
    :q-value ( 15 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_43455 - BLOCK
      ?AUTO_43456 - BLOCK
    )
    :vars
    (
      ?AUTO_43461 - BLOCK
      ?AUTO_43459 - BLOCK
      ?AUTO_43457 - BLOCK
      ?AUTO_43464 - BLOCK
      ?AUTO_43458 - BLOCK
      ?AUTO_43460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_43455 ) ( CLEAR ?AUTO_43461 ) ( ON ?AUTO_43459 ?AUTO_43456 ) ( ON ?AUTO_43457 ?AUTO_43459 ) ( ON ?AUTO_43464 ?AUTO_43457 ) ( CLEAR ?AUTO_43455 ) ( ON-TABLE ?AUTO_43458 ) ( CLEAR ?AUTO_43458 ) ( HOLDING ?AUTO_43460 ) ( CLEAR ?AUTO_43464 ) )
    :subtasks
    ( ( !STACK ?AUTO_43460 ?AUTO_43464 )
      ( MAKE-ON ?AUTO_43455 ?AUTO_43456 ) )
    :id ( 4651 )
    :q-value ( 17.6667 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_43467 - BLOCK
      ?AUTO_43468 - BLOCK
    )
    :vars
    (
      ?AUTO_43470 - BLOCK
      ?AUTO_43474 - BLOCK
      ?AUTO_43473 - BLOCK
      ?AUTO_43476 - BLOCK
      ?AUTO_43475 - BLOCK
      ?AUTO_43472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_43467 ) ( CLEAR ?AUTO_43470 ) ( ON ?AUTO_43474 ?AUTO_43468 ) ( ON ?AUTO_43473 ?AUTO_43474 ) ( ON ?AUTO_43476 ?AUTO_43473 ) ( CLEAR ?AUTO_43467 ) ( ON-TABLE ?AUTO_43475 ) ( CLEAR ?AUTO_43476 ) ( ON ?AUTO_43472 ?AUTO_43475 ) ( CLEAR ?AUTO_43472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_43472 ?AUTO_43475 )
      ( MAKE-ON ?AUTO_43467 ?AUTO_43468 ) )
    :id ( 4652 )
    :q-value ( 18 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_43483 - BLOCK
      ?AUTO_43484 - BLOCK
    )
    :vars
    (
      ?AUTO_43492 - BLOCK
      ?AUTO_43486 - BLOCK
      ?AUTO_43487 - BLOCK
      ?AUTO_43488 - BLOCK
      ?AUTO_43491 - BLOCK
      ?AUTO_43489 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_43492 ) ( ON ?AUTO_43486 ?AUTO_43484 ) ( ON ?AUTO_43487 ?AUTO_43486 ) ( ON ?AUTO_43488 ?AUTO_43487 ) ( ON-TABLE ?AUTO_43491 ) ( CLEAR ?AUTO_43488 ) ( ON ?AUTO_43489 ?AUTO_43491 ) ( CLEAR ?AUTO_43489 ) ( HOLDING ?AUTO_43483 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_43483 )
      ( MAKE-ON ?AUTO_43483 ?AUTO_43484 ) )
    :id ( 4653 )
    :q-value ( 19 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_43957 - BLOCK
      ?AUTO_43958 - BLOCK
    )
    :vars
    (
      ?AUTO_43967 - BLOCK
      ?AUTO_43961 - BLOCK
      ?AUTO_43959 - BLOCK
      ?AUTO_43966 - BLOCK
      ?AUTO_43960 - BLOCK
      ?AUTO_43964 - BLOCK
      ?AUTO_43962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_43967 ) ( CLEAR ?AUTO_43961 ) ( ON ?AUTO_43959 ?AUTO_43958 ) ( CLEAR ?AUTO_43966 ) ( ON ?AUTO_43960 ?AUTO_43959 ) ( CLEAR ?AUTO_43960 ) ( ON-TABLE ?AUTO_43964 ) ( CLEAR ?AUTO_43964 ) ( HOLDING ?AUTO_43957 ) ( CLEAR ?AUTO_43962 ) )
    :subtasks
    ( ( !STACK ?AUTO_43957 ?AUTO_43962 )
      ( MAKE-ON ?AUTO_43957 ?AUTO_43958 ) )
    :id ( 4707 )
    :q-value ( 12 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_43970 - BLOCK
      ?AUTO_43971 - BLOCK
    )
    :vars
    (
      ?AUTO_43980 - BLOCK
      ?AUTO_43976 - BLOCK
      ?AUTO_43979 - BLOCK
      ?AUTO_43977 - BLOCK
      ?AUTO_43973 - BLOCK
      ?AUTO_43978 - BLOCK
      ?AUTO_43975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_43980 ) ( CLEAR ?AUTO_43976 ) ( ON ?AUTO_43979 ?AUTO_43971 ) ( CLEAR ?AUTO_43977 ) ( ON ?AUTO_43973 ?AUTO_43979 ) ( ON-TABLE ?AUTO_43978 ) ( CLEAR ?AUTO_43978 ) ( CLEAR ?AUTO_43975 ) ( ON ?AUTO_43970 ?AUTO_43973 ) ( CLEAR ?AUTO_43970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_43970 ?AUTO_43973 )
      ( MAKE-ON ?AUTO_43970 ?AUTO_43971 ) )
    :id ( 4708 )
    :q-value ( 13 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_43983 - BLOCK
      ?AUTO_43984 - BLOCK
    )
    :vars
    (
      ?AUTO_43986 - BLOCK
      ?AUTO_43987 - BLOCK
      ?AUTO_43985 - BLOCK
      ?AUTO_43988 - BLOCK
      ?AUTO_43990 - BLOCK
      ?AUTO_43989 - BLOCK
      ?AUTO_43992 - BLOCK
      ?AUTO_43995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_43986 ) ( CLEAR ?AUTO_43987 ) ( ON ?AUTO_43985 ?AUTO_43984 ) ( CLEAR ?AUTO_43988 ) ( ON ?AUTO_43990 ?AUTO_43985 ) ( ON-TABLE ?AUTO_43989 ) ( CLEAR ?AUTO_43989 ) ( ON ?AUTO_43983 ?AUTO_43990 ) ( CLEAR ?AUTO_43983 ) ( HOLDING ?AUTO_43992 ) ( CLEAR ?AUTO_43995 ) )
    :subtasks
    ( ( !STACK ?AUTO_43992 ?AUTO_43995 )
      ( MAKE-ON ?AUTO_43983 ?AUTO_43984 ) )
    :id ( 4709 )
    :q-value ( 13 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_44629 - BLOCK
      ?AUTO_44630 - BLOCK
    )
    :vars
    (
      ?AUTO_44636 - BLOCK
      ?AUTO_44634 - BLOCK
      ?AUTO_44640 - BLOCK
      ?AUTO_44632 - BLOCK
      ?AUTO_44638 - BLOCK
      ?AUTO_44633 - BLOCK
      ?AUTO_44637 - BLOCK
      ?AUTO_44635 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_44629 ?AUTO_44636 ) ( CLEAR ?AUTO_44634 ) ( CLEAR ?AUTO_44640 ) ( CLEAR ?AUTO_44632 ) ( ON ?AUTO_44638 ?AUTO_44630 ) ( ON ?AUTO_44633 ?AUTO_44638 ) ( ON ?AUTO_44637 ?AUTO_44633 ) ( CLEAR ?AUTO_44637 ) ( CLEAR ?AUTO_44629 ) ( ON-TABLE ?AUTO_44635 ) ( CLEAR ?AUTO_44635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_44635 )
      ( MAKE-ON ?AUTO_44629 ?AUTO_44630 ) )
    :id ( 4783 )
    :q-value ( 13 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_45537 - BLOCK
      ?AUTO_45538 - BLOCK
    )
    :vars
    (
      ?AUTO_45547 - BLOCK
      ?AUTO_45545 - BLOCK
      ?AUTO_45548 - BLOCK
      ?AUTO_45546 - BLOCK
      ?AUTO_45544 - BLOCK
      ?AUTO_45540 - BLOCK
      ?AUTO_45543 - BLOCK
      ?AUTO_45539 - BLOCK
      ?AUTO_45549 - BLOCK
      ?AUTO_45550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_45537 ) ( ON ?AUTO_45547 ?AUTO_45538 ) ( CLEAR ?AUTO_45545 ) ( ON ?AUTO_45548 ?AUTO_45547 ) ( CLEAR ?AUTO_45546 ) ( ON ?AUTO_45544 ?AUTO_45548 ) ( ON ?AUTO_45540 ?AUTO_45544 ) ( CLEAR ?AUTO_45540 ) ( CLEAR ?AUTO_45543 ) ( ON ?AUTO_45539 ?AUTO_45537 ) ( ON ?AUTO_45549 ?AUTO_45539 ) ( CLEAR ?AUTO_45549 ) ( HOLDING ?AUTO_45550 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_45550 )
      ( MAKE-ON ?AUTO_45537 ?AUTO_45538 ) )
    :id ( 4879 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_45551 - BLOCK
      ?AUTO_45552 - BLOCK
    )
    :vars
    (
      ?AUTO_45560 - BLOCK
      ?AUTO_45563 - BLOCK
      ?AUTO_45554 - BLOCK
      ?AUTO_45559 - BLOCK
      ?AUTO_45562 - BLOCK
      ?AUTO_45557 - BLOCK
      ?AUTO_45564 - BLOCK
      ?AUTO_45555 - BLOCK
      ?AUTO_45553 - BLOCK
      ?AUTO_45561 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_45551 ) ( ON ?AUTO_45560 ?AUTO_45552 ) ( CLEAR ?AUTO_45563 ) ( ON ?AUTO_45554 ?AUTO_45560 ) ( CLEAR ?AUTO_45559 ) ( ON ?AUTO_45562 ?AUTO_45554 ) ( ON ?AUTO_45557 ?AUTO_45562 ) ( CLEAR ?AUTO_45557 ) ( CLEAR ?AUTO_45564 ) ( ON ?AUTO_45555 ?AUTO_45551 ) ( ON ?AUTO_45553 ?AUTO_45555 ) ( ON ?AUTO_45561 ?AUTO_45553 ) ( CLEAR ?AUTO_45561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_45561 ?AUTO_45553 )
      ( MAKE-ON ?AUTO_45551 ?AUTO_45552 ) )
    :id ( 4880 )
    :q-value ( 18 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_45567 - BLOCK
      ?AUTO_45568 - BLOCK
    )
    :vars
    (
      ?AUTO_45576 - BLOCK
      ?AUTO_45580 - BLOCK
      ?AUTO_45571 - BLOCK
      ?AUTO_45572 - BLOCK
      ?AUTO_45575 - BLOCK
      ?AUTO_45577 - BLOCK
      ?AUTO_45570 - BLOCK
      ?AUTO_45569 - BLOCK
      ?AUTO_45578 - BLOCK
      ?AUTO_45579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_45567 ) ( ON ?AUTO_45576 ?AUTO_45568 ) ( CLEAR ?AUTO_45580 ) ( ON ?AUTO_45571 ?AUTO_45576 ) ( CLEAR ?AUTO_45572 ) ( ON ?AUTO_45575 ?AUTO_45571 ) ( CLEAR ?AUTO_45577 ) ( ON ?AUTO_45570 ?AUTO_45567 ) ( ON ?AUTO_45569 ?AUTO_45570 ) ( ON ?AUTO_45578 ?AUTO_45569 ) ( CLEAR ?AUTO_45578 ) ( HOLDING ?AUTO_45579 ) ( CLEAR ?AUTO_45575 ) )
    :subtasks
    ( ( !STACK ?AUTO_45579 ?AUTO_45575 )
      ( MAKE-ON ?AUTO_45567 ?AUTO_45568 ) )
    :id ( 4881 )
    :q-value ( 19 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_45583 - BLOCK
      ?AUTO_45584 - BLOCK
    )
    :vars
    (
      ?AUTO_45595 - BLOCK
      ?AUTO_45591 - BLOCK
      ?AUTO_45588 - BLOCK
      ?AUTO_45596 - BLOCK
      ?AUTO_45593 - BLOCK
      ?AUTO_45594 - BLOCK
      ?AUTO_45586 - BLOCK
      ?AUTO_45590 - BLOCK
      ?AUTO_45587 - BLOCK
      ?AUTO_45585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_45583 ) ( ON ?AUTO_45595 ?AUTO_45584 ) ( CLEAR ?AUTO_45591 ) ( ON ?AUTO_45588 ?AUTO_45595 ) ( CLEAR ?AUTO_45596 ) ( ON ?AUTO_45593 ?AUTO_45588 ) ( CLEAR ?AUTO_45594 ) ( ON ?AUTO_45586 ?AUTO_45583 ) ( ON ?AUTO_45590 ?AUTO_45586 ) ( ON ?AUTO_45587 ?AUTO_45590 ) ( CLEAR ?AUTO_45593 ) ( ON ?AUTO_45585 ?AUTO_45587 ) ( CLEAR ?AUTO_45585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_45585 ?AUTO_45587 )
      ( MAKE-ON ?AUTO_45583 ?AUTO_45584 ) )
    :id ( 4882 )
    :q-value ( 19 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_45599 - BLOCK
      ?AUTO_45600 - BLOCK
    )
    :vars
    (
      ?AUTO_45610 - BLOCK
      ?AUTO_45601 - BLOCK
      ?AUTO_45606 - BLOCK
      ?AUTO_45602 - BLOCK
      ?AUTO_45605 - BLOCK
      ?AUTO_45603 - BLOCK
      ?AUTO_45608 - BLOCK
      ?AUTO_45609 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_45599 ) ( ON ?AUTO_45610 ?AUTO_45600 ) ( ON ?AUTO_45601 ?AUTO_45610 ) ( ON ?AUTO_45606 ?AUTO_45601 ) ( ON ?AUTO_45602 ?AUTO_45599 ) ( ON ?AUTO_45605 ?AUTO_45602 ) ( ON ?AUTO_45603 ?AUTO_45605 ) ( CLEAR ?AUTO_45606 ) ( ON ?AUTO_45608 ?AUTO_45603 ) ( CLEAR ?AUTO_45608 ) ( HOLDING ?AUTO_45609 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_45609 )
      ( MAKE-ON ?AUTO_45599 ?AUTO_45600 ) )
    :id ( 4883 )
    :q-value ( 21 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_45614 - BLOCK
      ?AUTO_45615 - BLOCK
    )
    :vars
    (
      ?AUTO_45623 - BLOCK
      ?AUTO_45619 - BLOCK
      ?AUTO_45618 - BLOCK
      ?AUTO_45617 - BLOCK
      ?AUTO_45621 - BLOCK
      ?AUTO_45616 - BLOCK
      ?AUTO_45624 - BLOCK
      ?AUTO_45625 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_45614 ) ( ON ?AUTO_45623 ?AUTO_45615 ) ( ON ?AUTO_45619 ?AUTO_45623 ) ( ON ?AUTO_45618 ?AUTO_45619 ) ( ON ?AUTO_45617 ?AUTO_45614 ) ( ON ?AUTO_45621 ?AUTO_45617 ) ( ON ?AUTO_45616 ?AUTO_45621 ) ( ON ?AUTO_45624 ?AUTO_45616 ) ( CLEAR ?AUTO_45624 ) ( ON ?AUTO_45625 ?AUTO_45618 ) ( CLEAR ?AUTO_45625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_45625 ?AUTO_45618 )
      ( MAKE-ON ?AUTO_45614 ?AUTO_45615 ) )
    :id ( 4884 )
    :q-value ( 22 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_46224 - BLOCK
      ?AUTO_46225 - BLOCK
    )
    :vars
    (
      ?AUTO_46233 - BLOCK
      ?AUTO_46229 - BLOCK
      ?AUTO_46231 - BLOCK
      ?AUTO_46232 - BLOCK
      ?AUTO_46227 - BLOCK
      ?AUTO_46230 - BLOCK
      ?AUTO_46235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_46224 ) ( ON ?AUTO_46233 ?AUTO_46225 ) ( ON ?AUTO_46229 ?AUTO_46233 ) ( ON ?AUTO_46231 ?AUTO_46229 ) ( CLEAR ?AUTO_46231 ) ( ON ?AUTO_46232 ?AUTO_46224 ) ( ON ?AUTO_46227 ?AUTO_46232 ) ( CLEAR ?AUTO_46227 ) ( HOLDING ?AUTO_46230 ) ( CLEAR ?AUTO_46235 ) )
    :subtasks
    ( ( !STACK ?AUTO_46230 ?AUTO_46235 )
      ( MAKE-ON ?AUTO_46224 ?AUTO_46225 ) )
    :id ( 4960 )
    :q-value ( 13.6667 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_46249 - BLOCK
      ?AUTO_46250 - BLOCK
    )
    :vars
    (
      ?AUTO_46257 - BLOCK
      ?AUTO_46253 - BLOCK
      ?AUTO_46255 - BLOCK
      ?AUTO_46251 - BLOCK
      ?AUTO_46256 - BLOCK
      ?AUTO_46254 - BLOCK
      ?AUTO_46258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_46249 ) ( ON ?AUTO_46257 ?AUTO_46250 ) ( ON ?AUTO_46253 ?AUTO_46257 ) ( ON ?AUTO_46255 ?AUTO_46253 ) ( CLEAR ?AUTO_46255 ) ( ON ?AUTO_46251 ?AUTO_46249 ) ( ON ?AUTO_46256 ?AUTO_46251 ) ( ON ?AUTO_46254 ?AUTO_46256 ) ( CLEAR ?AUTO_46254 ) ( HOLDING ?AUTO_46258 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_46258 )
      ( MAKE-ON ?AUTO_46249 ?AUTO_46250 ) )
    :id ( 4962 )
    :q-value ( 16.3333 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_46527 - BLOCK
      ?AUTO_46528 - BLOCK
    )
    :vars
    (
      ?AUTO_46529 - BLOCK
      ?AUTO_46532 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_46529 ?AUTO_46528 ) ( CLEAR ?AUTO_46529 ) ( CLEAR ?AUTO_46532 ) ( ON-TABLE ?AUTO_46527 ) ( CLEAR ?AUTO_46527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_46527 )
      ( MAKE-ON ?AUTO_46527 ?AUTO_46528 ) )
    :id ( 5002 )
    :q-value ( 6 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_46683 - BLOCK
      ?AUTO_46684 - BLOCK
    )
    :vars
    (
      ?AUTO_46690 - BLOCK
      ?AUTO_46688 - BLOCK
      ?AUTO_46687 - BLOCK
      ?AUTO_46689 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_46690 ?AUTO_46684 ) ( ON ?AUTO_46688 ?AUTO_46690 ) ( ON-TABLE ?AUTO_46687 ) ( CLEAR ?AUTO_46687 ) ( ON ?AUTO_46683 ?AUTO_46688 ) ( CLEAR ?AUTO_46683 ) ( HOLDING ?AUTO_46689 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_46689 )
      ( MAKE-ON ?AUTO_46683 ?AUTO_46684 ) )
    :id ( 5021 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_46692 - BLOCK
      ?AUTO_46693 - BLOCK
    )
    :vars
    (
      ?AUTO_46699 - BLOCK
      ?AUTO_46694 - BLOCK
      ?AUTO_46696 - BLOCK
      ?AUTO_46697 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_46699 ?AUTO_46693 ) ( ON ?AUTO_46694 ?AUTO_46699 ) ( ON-TABLE ?AUTO_46696 ) ( CLEAR ?AUTO_46696 ) ( ON ?AUTO_46692 ?AUTO_46694 ) ( ON ?AUTO_46697 ?AUTO_46692 ) ( CLEAR ?AUTO_46697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_46697 ?AUTO_46692 )
      ( MAKE-ON ?AUTO_46692 ?AUTO_46693 ) )
    :id ( 5022 )
    :q-value ( 16 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_46969 - BLOCK
      ?AUTO_46970 - BLOCK
    )
    :vars
    (
      ?AUTO_46971 - BLOCK
      ?AUTO_46974 - BLOCK
      ?AUTO_46976 - BLOCK
      ?AUTO_46972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_46971 ) ( ON ?AUTO_46974 ?AUTO_46970 ) ( ON ?AUTO_46969 ?AUTO_46976 ) ( CLEAR ?AUTO_46969 ) ( HOLDING ?AUTO_46972 ) ( CLEAR ?AUTO_46974 ) )
    :subtasks
    ( ( !STACK ?AUTO_46972 ?AUTO_46974 )
      ( MAKE-ON ?AUTO_46969 ?AUTO_46970 ) )
    :id ( 5060 )
    :q-value ( 9 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_47543 - BLOCK
      ?AUTO_47544 - BLOCK
    )
    :vars
    (
      ?AUTO_47546 - BLOCK
      ?AUTO_47545 - BLOCK
      ?AUTO_47552 - BLOCK
      ?AUTO_47547 - BLOCK
      ?AUTO_47548 - BLOCK
      ?AUTO_47549 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_47543 ?AUTO_47546 ) ( ON ?AUTO_47545 ?AUTO_47543 ) ( ON ?AUTO_47552 ?AUTO_47544 ) ( ON ?AUTO_47547 ?AUTO_47552 ) ( CLEAR ?AUTO_47547 ) ( CLEAR ?AUTO_47545 ) ( ON ?AUTO_47548 ?AUTO_47549 ) ( CLEAR ?AUTO_47548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_47548 ?AUTO_47549 )
      ( MAKE-ON ?AUTO_47543 ?AUTO_47544 ) )
    :id ( 5123 )
    :q-value ( 14 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_47915 - BLOCK
      ?AUTO_47916 - BLOCK
    )
    :vars
    (
      ?AUTO_47922 - BLOCK
      ?AUTO_47925 - BLOCK
      ?AUTO_47923 - BLOCK
      ?AUTO_47926 - BLOCK
      ?AUTO_47921 - BLOCK
      ?AUTO_47919 - BLOCK
      ?AUTO_47917 - BLOCK
      ?AUTO_47918 - BLOCK
      ?AUTO_47927 - BLOCK
      ?AUTO_47928 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_47916 ) ( ON ?AUTO_47915 ?AUTO_47922 ) ( CLEAR ?AUTO_47925 ) ( ON ?AUTO_47923 ?AUTO_47915 ) ( CLEAR ?AUTO_47926 ) ( ON ?AUTO_47921 ?AUTO_47923 ) ( CLEAR ?AUTO_47919 ) ( ON ?AUTO_47917 ?AUTO_47921 ) ( CLEAR ?AUTO_47918 ) ( ON ?AUTO_47927 ?AUTO_47917 ) ( CLEAR ?AUTO_47927 ) ( HOLDING ?AUTO_47928 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_47928 )
      ( MAKE-ON ?AUTO_47915 ?AUTO_47916 ) )
    :id ( 5140 )
    :q-value ( 11 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_48246 - BLOCK
      ?AUTO_48247 - BLOCK
    )
    :vars
    (
      ?AUTO_48253 - BLOCK
      ?AUTO_48254 - BLOCK
      ?AUTO_48252 - BLOCK
      ?AUTO_48256 - BLOCK
      ?AUTO_48249 - BLOCK
      ?AUTO_48258 - BLOCK
      ?AUTO_48257 - BLOCK
      ?AUTO_48248 - BLOCK
      ?AUTO_48255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_48246 ) ( CLEAR ?AUTO_48253 ) ( ON ?AUTO_48254 ?AUTO_48246 ) ( CLEAR ?AUTO_48252 ) ( ON ?AUTO_48256 ?AUTO_48254 ) ( CLEAR ?AUTO_48247 ) ( ON ?AUTO_48249 ?AUTO_48256 ) ( CLEAR ?AUTO_48258 ) ( ON ?AUTO_48257 ?AUTO_48249 ) ( CLEAR ?AUTO_48248 ) ( ON ?AUTO_48255 ?AUTO_48257 ) ( CLEAR ?AUTO_48255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_48255 ?AUTO_48257 )
      ( MAKE-ON ?AUTO_48246 ?AUTO_48247 ) )
    :id ( 5171 )
    :q-value ( 12.6667 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_48261 - BLOCK
      ?AUTO_48262 - BLOCK
    )
    :vars
    (
      ?AUTO_48272 - BLOCK
      ?AUTO_48273 - BLOCK
      ?AUTO_48264 - BLOCK
      ?AUTO_48269 - BLOCK
      ?AUTO_48266 - BLOCK
      ?AUTO_48267 - BLOCK
      ?AUTO_48270 - BLOCK
      ?AUTO_48265 - BLOCK
      ?AUTO_48271 - BLOCK
      ?AUTO_48274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_48261 ) ( CLEAR ?AUTO_48272 ) ( ON ?AUTO_48273 ?AUTO_48261 ) ( CLEAR ?AUTO_48264 ) ( ON ?AUTO_48269 ?AUTO_48273 ) ( CLEAR ?AUTO_48262 ) ( ON ?AUTO_48266 ?AUTO_48269 ) ( CLEAR ?AUTO_48267 ) ( ON ?AUTO_48270 ?AUTO_48266 ) ( CLEAR ?AUTO_48265 ) ( ON ?AUTO_48271 ?AUTO_48270 ) ( CLEAR ?AUTO_48271 ) ( HOLDING ?AUTO_48274 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_48274 )
      ( MAKE-ON ?AUTO_48261 ?AUTO_48262 ) )
    :id ( 5172 )
    :q-value ( 14 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49032 - BLOCK
      ?AUTO_49033 - BLOCK
    )
    :vars
    (
      ?AUTO_49038 - BLOCK
      ?AUTO_49040 - BLOCK
      ?AUTO_49039 - BLOCK
      ?AUTO_49034 - BLOCK
      ?AUTO_49035 - BLOCK
      ?AUTO_49042 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_49032 ?AUTO_49038 ) ( CLEAR ?AUTO_49040 ) ( ON ?AUTO_49039 ?AUTO_49033 ) ( ON ?AUTO_49034 ?AUTO_49032 ) ( CLEAR ?AUTO_49034 ) ( CLEAR ?AUTO_49039 ) ( ON ?AUTO_49035 ?AUTO_49042 ) ( CLEAR ?AUTO_49035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_49035 ?AUTO_49042 )
      ( MAKE-ON ?AUTO_49032 ?AUTO_49033 ) )
    :id ( 5250 )
    :q-value ( 10 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49383 - BLOCK
      ?AUTO_49384 - BLOCK
    )
    :vars
    (
      ?AUTO_49388 - BLOCK
      ?AUTO_49387 - BLOCK
      ?AUTO_49389 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_49388 ) ( ON ?AUTO_49387 ?AUTO_49384 ) ( CLEAR ?AUTO_49387 ) ( ON-TABLE ?AUTO_49389 ) ( CLEAR ?AUTO_49389 ) ( HOLDING ?AUTO_49383 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_49383 )
      ( MAKE-ON ?AUTO_49383 ?AUTO_49384 ) )
    :id ( 5293 )
    :q-value ( 9 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49391 - BLOCK
      ?AUTO_49392 - BLOCK
    )
    :vars
    (
      ?AUTO_49395 - BLOCK
      ?AUTO_49396 - BLOCK
      ?AUTO_49394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_49395 ) ( ON ?AUTO_49396 ?AUTO_49392 ) ( ON-TABLE ?AUTO_49394 ) ( CLEAR ?AUTO_49394 ) ( ON ?AUTO_49391 ?AUTO_49396 ) ( CLEAR ?AUTO_49391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_49391 ?AUTO_49396 )
      ( MAKE-ON ?AUTO_49391 ?AUTO_49392 ) )
    :id ( 5294 )
    :q-value ( 10 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49434 - BLOCK
      ?AUTO_49435 - BLOCK
    )
    :vars
    (
      ?AUTO_49438 - BLOCK
      ?AUTO_49436 - BLOCK
      ?AUTO_49440 - BLOCK
      ?AUTO_49442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_49438 ) ( ON ?AUTO_49436 ?AUTO_49435 ) ( ON ?AUTO_49434 ?AUTO_49436 ) ( CLEAR ?AUTO_49434 ) ( ON ?AUTO_49440 ?AUTO_49442 ) ( CLEAR ?AUTO_49440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_49440 ?AUTO_49442 )
      ( MAKE-ON ?AUTO_49434 ?AUTO_49435 ) )
    :id ( 5298 )
    :q-value ( 12 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49949 - BLOCK
      ?AUTO_49950 - BLOCK
    )
    :vars
    (
      ?AUTO_49951 - BLOCK
      ?AUTO_49957 - BLOCK
      ?AUTO_49958 - BLOCK
      ?AUTO_49955 - BLOCK
      ?AUTO_49953 - BLOCK
      ?AUTO_49952 - BLOCK
      ?AUTO_49960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_49951 ) ( ON ?AUTO_49957 ?AUTO_49950 ) ( CLEAR ?AUTO_49958 ) ( ON ?AUTO_49955 ?AUTO_49957 ) ( CLEAR ?AUTO_49955 ) ( ON-TABLE ?AUTO_49953 ) ( CLEAR ?AUTO_49953 ) ( ON-TABLE ?AUTO_49952 ) ( CLEAR ?AUTO_49952 ) ( ON ?AUTO_49949 ?AUTO_49960 ) ( CLEAR ?AUTO_49949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_49949 ?AUTO_49960 )
      ( MAKE-ON ?AUTO_49949 ?AUTO_49950 ) )
    :id ( 5363 )
    :q-value ( 16 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49961 - BLOCK
      ?AUTO_49962 - BLOCK
    )
    :vars
    (
      ?AUTO_49969 - BLOCK
      ?AUTO_49965 - BLOCK
      ?AUTO_49964 - BLOCK
      ?AUTO_49968 - BLOCK
      ?AUTO_49963 - BLOCK
      ?AUTO_49966 - BLOCK
      ?AUTO_49970 - BLOCK
      ?AUTO_49972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_49969 ) ( ON ?AUTO_49965 ?AUTO_49962 ) ( CLEAR ?AUTO_49964 ) ( ON ?AUTO_49968 ?AUTO_49965 ) ( CLEAR ?AUTO_49968 ) ( ON-TABLE ?AUTO_49963 ) ( CLEAR ?AUTO_49963 ) ( ON-TABLE ?AUTO_49966 ) ( CLEAR ?AUTO_49966 ) ( ON ?AUTO_49961 ?AUTO_49970 ) ( CLEAR ?AUTO_49961 ) ( HOLDING ?AUTO_49972 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_49972 )
      ( MAKE-ON ?AUTO_49961 ?AUTO_49962 ) )
    :id ( 5364 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49973 - BLOCK
      ?AUTO_49974 - BLOCK
    )
    :vars
    (
      ?AUTO_49983 - BLOCK
      ?AUTO_49980 - BLOCK
      ?AUTO_49982 - BLOCK
      ?AUTO_49979 - BLOCK
      ?AUTO_49978 - BLOCK
      ?AUTO_49977 - BLOCK
      ?AUTO_49984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_49983 ) ( ON ?AUTO_49980 ?AUTO_49974 ) ( CLEAR ?AUTO_49982 ) ( ON ?AUTO_49979 ?AUTO_49980 ) ( CLEAR ?AUTO_49979 ) ( ON-TABLE ?AUTO_49978 ) ( ON ?AUTO_49973 ?AUTO_49977 ) ( CLEAR ?AUTO_49973 ) ( ON ?AUTO_49984 ?AUTO_49978 ) ( CLEAR ?AUTO_49984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_49984 ?AUTO_49978 )
      ( MAKE-ON ?AUTO_49973 ?AUTO_49974 ) )
    :id ( 5365 )
    :q-value ( 18 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_50429 - BLOCK
      ?AUTO_50430 - BLOCK
    )
    :vars
    (
      ?AUTO_50439 - BLOCK
      ?AUTO_50432 - BLOCK
      ?AUTO_50436 - BLOCK
      ?AUTO_50433 - BLOCK
      ?AUTO_50437 - BLOCK
      ?AUTO_50440 - BLOCK
      ?AUTO_50431 - BLOCK
      ?AUTO_50434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_50429 ) ( CLEAR ?AUTO_50439 ) ( ON ?AUTO_50432 ?AUTO_50429 ) ( CLEAR ?AUTO_50436 ) ( ON ?AUTO_50433 ?AUTO_50432 ) ( ON ?AUTO_50437 ?AUTO_50433 ) ( CLEAR ?AUTO_50437 ) ( ON ?AUTO_50440 ?AUTO_50430 ) ( ON ?AUTO_50431 ?AUTO_50440 ) ( ON ?AUTO_50434 ?AUTO_50431 ) ( CLEAR ?AUTO_50434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_50434 ?AUTO_50431 )
      ( MAKE-ON ?AUTO_50429 ?AUTO_50430 ) )
    :id ( 5423 )
    :q-value ( 18 )
    :q-count ( 4 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_51590 - BLOCK
      ?AUTO_51591 - BLOCK
    )
    :vars
    (
      ?AUTO_51593 - BLOCK
      ?AUTO_51596 - BLOCK
      ?AUTO_51598 - BLOCK
      ?AUTO_51597 - BLOCK
      ?AUTO_51594 - BLOCK
      ?AUTO_51600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_51590 ) ( CLEAR ?AUTO_51593 ) ( ON ?AUTO_51596 ?AUTO_51590 ) ( ON ?AUTO_51598 ?AUTO_51596 ) ( CLEAR ?AUTO_51598 ) ( ON-TABLE ?AUTO_51597 ) ( CLEAR ?AUTO_51597 ) ( CLEAR ?AUTO_51591 ) ( ON ?AUTO_51594 ?AUTO_51600 ) ( CLEAR ?AUTO_51594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_51594 ?AUTO_51600 )
      ( MAKE-ON ?AUTO_51590 ?AUTO_51591 ) )
    :id ( 5525 )
    :q-value ( 16 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_51605 - BLOCK
      ?AUTO_51606 - BLOCK
    )
    :vars
    (
      ?AUTO_51609 - BLOCK
      ?AUTO_51607 - BLOCK
      ?AUTO_51608 - BLOCK
      ?AUTO_51610 - BLOCK
      ?AUTO_51613 - BLOCK
      ?AUTO_51611 - BLOCK
      ?AUTO_51616 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_51605 ) ( CLEAR ?AUTO_51609 ) ( ON ?AUTO_51607 ?AUTO_51605 ) ( ON ?AUTO_51608 ?AUTO_51607 ) ( CLEAR ?AUTO_51608 ) ( ON-TABLE ?AUTO_51610 ) ( CLEAR ?AUTO_51610 ) ( ON ?AUTO_51613 ?AUTO_51611 ) ( CLEAR ?AUTO_51613 ) ( HOLDING ?AUTO_51606 ) ( CLEAR ?AUTO_51616 ) )
    :subtasks
    ( ( !STACK ?AUTO_51606 ?AUTO_51616 )
      ( MAKE-ON ?AUTO_51605 ?AUTO_51606 ) )
    :id ( 5526 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_52691 - BLOCK
      ?AUTO_52692 - BLOCK
    )
    :vars
    (
      ?AUTO_52698 - BLOCK
      ?AUTO_52697 - BLOCK
      ?AUTO_52696 - BLOCK
      ?AUTO_52693 - BLOCK
      ?AUTO_52700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_52691 ) ( ON ?AUTO_52698 ?AUTO_52691 ) ( ON ?AUTO_52697 ?AUTO_52698 ) ( ON ?AUTO_52696 ?AUTO_52697 ) ( ON ?AUTO_52693 ?AUTO_52696 ) ( CLEAR ?AUTO_52693 ) ( HOLDING ?AUTO_52692 ) ( CLEAR ?AUTO_52700 ) )
    :subtasks
    ( ( !STACK ?AUTO_52692 ?AUTO_52700 )
      ( MAKE-ON ?AUTO_52691 ?AUTO_52692 ) )
    :id ( 5629 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_52776 - BLOCK
      ?AUTO_52777 - BLOCK
    )
    :vars
    (
      ?AUTO_52783 - BLOCK
      ?AUTO_52784 - BLOCK
      ?AUTO_52780 - BLOCK
      ?AUTO_52779 - BLOCK
      ?AUTO_52781 - BLOCK
      ?AUTO_52782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_52776 ) ( ON ?AUTO_52783 ?AUTO_52776 ) ( ON ?AUTO_52784 ?AUTO_52783 ) ( ON ?AUTO_52780 ?AUTO_52777 ) ( ON ?AUTO_52779 ?AUTO_52780 ) ( ON ?AUTO_52781 ?AUTO_52779 ) ( CLEAR ?AUTO_52781 ) ( HOLDING ?AUTO_52782 ) ( CLEAR ?AUTO_52784 ) )
    :subtasks
    ( ( !STACK ?AUTO_52782 ?AUTO_52784 )
      ( MAKE-ON ?AUTO_52776 ?AUTO_52777 ) )
    :id ( 5636 )
    :q-value ( 22 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_53532 - BLOCK
      ?AUTO_53533 - BLOCK
    )
    :vars
    (
      ?AUTO_53537 - BLOCK
      ?AUTO_53538 - BLOCK
      ?AUTO_53535 - BLOCK
      ?AUTO_53539 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_53537 ?AUTO_53533 ) ( ON ?AUTO_53538 ?AUTO_53537 ) ( ON ?AUTO_53532 ?AUTO_53535 ) ( CLEAR ?AUTO_53532 ) ( HOLDING ?AUTO_53539 ) ( CLEAR ?AUTO_53538 ) )
    :subtasks
    ( ( !STACK ?AUTO_53539 ?AUTO_53538 )
      ( MAKE-ON ?AUTO_53532 ?AUTO_53533 ) )
    :id ( 5724 )
    :q-value ( 11 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_54090 - BLOCK
      ?AUTO_54091 - BLOCK
    )
    :vars
    (
      ?AUTO_54097 - BLOCK
      ?AUTO_54092 - BLOCK
      ?AUTO_54098 - BLOCK
      ?AUTO_54093 - BLOCK
      ?AUTO_54096 - BLOCK
      ?AUTO_54099 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_54097 ) ( ON ?AUTO_54092 ?AUTO_54091 ) ( ON ?AUTO_54098 ?AUTO_54092 ) ( ON ?AUTO_54093 ?AUTO_54098 ) ( CLEAR ?AUTO_54093 ) ( ON-TABLE ?AUTO_54096 ) ( CLEAR ?AUTO_54096 ) ( HOLDING ?AUTO_54090 ) ( CLEAR ?AUTO_54099 ) )
    :subtasks
    ( ( !STACK ?AUTO_54090 ?AUTO_54099 )
      ( MAKE-ON ?AUTO_54090 ?AUTO_54091 ) )
    :id ( 5798 )
    :q-value ( 13 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_54102 - BLOCK
      ?AUTO_54103 - BLOCK
    )
    :vars
    (
      ?AUTO_54104 - BLOCK
      ?AUTO_54105 - BLOCK
      ?AUTO_54110 - BLOCK
      ?AUTO_54109 - BLOCK
      ?AUTO_54106 - BLOCK
      ?AUTO_54111 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_54104 ) ( ON ?AUTO_54105 ?AUTO_54103 ) ( ON ?AUTO_54110 ?AUTO_54105 ) ( ON ?AUTO_54109 ?AUTO_54110 ) ( ON-TABLE ?AUTO_54106 ) ( CLEAR ?AUTO_54106 ) ( CLEAR ?AUTO_54111 ) ( ON ?AUTO_54102 ?AUTO_54109 ) ( CLEAR ?AUTO_54102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_54102 ?AUTO_54109 )
      ( MAKE-ON ?AUTO_54102 ?AUTO_54103 ) )
    :id ( 5799 )
    :q-value ( 14 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_54114 - BLOCK
      ?AUTO_54115 - BLOCK
    )
    :vars
    (
      ?AUTO_54117 - BLOCK
      ?AUTO_54119 - BLOCK
      ?AUTO_54122 - BLOCK
      ?AUTO_54123 - BLOCK
      ?AUTO_54120 - BLOCK
      ?AUTO_54118 - BLOCK
      ?AUTO_54124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_54117 ) ( ON ?AUTO_54119 ?AUTO_54115 ) ( ON ?AUTO_54122 ?AUTO_54119 ) ( ON ?AUTO_54123 ?AUTO_54122 ) ( ON-TABLE ?AUTO_54120 ) ( CLEAR ?AUTO_54120 ) ( CLEAR ?AUTO_54118 ) ( ON ?AUTO_54114 ?AUTO_54123 ) ( CLEAR ?AUTO_54114 ) ( HOLDING ?AUTO_54124 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_54124 )
      ( MAKE-ON ?AUTO_54114 ?AUTO_54115 ) )
    :id ( 5800 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_54973 - BLOCK
      ?AUTO_54974 - BLOCK
    )
    :vars
    (
      ?AUTO_54979 - BLOCK
      ?AUTO_54978 - BLOCK
      ?AUTO_54976 - BLOCK
      ?AUTO_54980 - BLOCK
      ?AUTO_54982 - BLOCK
      ?AUTO_54981 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_54979 ?AUTO_54974 ) ( CLEAR ?AUTO_54978 ) ( ON ?AUTO_54976 ?AUTO_54979 ) ( ON ?AUTO_54980 ?AUTO_54976 ) ( ON ?AUTO_54973 ?AUTO_54982 ) ( CLEAR ?AUTO_54973 ) ( HOLDING ?AUTO_54981 ) ( CLEAR ?AUTO_54980 ) )
    :subtasks
    ( ( !STACK ?AUTO_54981 ?AUTO_54980 )
      ( MAKE-ON ?AUTO_54973 ?AUTO_54974 ) )
    :id ( 5879 )
    :q-value ( 13 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_55415 - BLOCK
      ?AUTO_55416 - BLOCK
    )
    :vars
    (
      ?AUTO_55425 - BLOCK
      ?AUTO_55421 - BLOCK
      ?AUTO_55419 - BLOCK
      ?AUTO_55417 - BLOCK
      ?AUTO_55424 - BLOCK
      ?AUTO_55422 - BLOCK
      ?AUTO_55423 - BLOCK
      ?AUTO_55427 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_55415 ?AUTO_55425 ) ( CLEAR ?AUTO_55421 ) ( ON ?AUTO_55419 ?AUTO_55415 ) ( ON ?AUTO_55417 ?AUTO_55419 ) ( ON ?AUTO_55424 ?AUTO_55417 ) ( CLEAR ?AUTO_55422 ) ( ON ?AUTO_55423 ?AUTO_55424 ) ( CLEAR ?AUTO_55423 ) ( HOLDING ?AUTO_55416 ) ( CLEAR ?AUTO_55427 ) )
    :subtasks
    ( ( !STACK ?AUTO_55416 ?AUTO_55427 )
      ( MAKE-ON ?AUTO_55415 ?AUTO_55416 ) )
    :id ( 5938 )
    :q-value ( 11 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_55560 - BLOCK
      ?AUTO_55561 - BLOCK
    )
    :vars
    (
      ?AUTO_55562 - BLOCK
      ?AUTO_55566 - BLOCK
      ?AUTO_55564 - BLOCK
      ?AUTO_55570 - BLOCK
      ?AUTO_55569 - BLOCK
      ?AUTO_55563 - BLOCK
      ?AUTO_55565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_55560 ) ( CLEAR ?AUTO_55562 ) ( ON ?AUTO_55566 ?AUTO_55560 ) ( CLEAR ?AUTO_55564 ) ( ON ?AUTO_55570 ?AUTO_55566 ) ( ON ?AUTO_55561 ?AUTO_55570 ) ( ON ?AUTO_55569 ?AUTO_55561 ) ( CLEAR ?AUTO_55563 ) ( ON ?AUTO_55565 ?AUTO_55569 ) ( CLEAR ?AUTO_55565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_55565 ?AUTO_55569 )
      ( MAKE-ON ?AUTO_55560 ?AUTO_55561 ) )
    :id ( 5952 )
    :q-value ( 12 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_55573 - BLOCK
      ?AUTO_55574 - BLOCK
    )
    :vars
    (
      ?AUTO_55578 - BLOCK
      ?AUTO_55575 - BLOCK
      ?AUTO_55582 - BLOCK
      ?AUTO_55581 - BLOCK
      ?AUTO_55576 - BLOCK
      ?AUTO_55579 - BLOCK
      ?AUTO_55580 - BLOCK
      ?AUTO_55584 - BLOCK
      ?AUTO_55585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_55573 ) ( CLEAR ?AUTO_55578 ) ( ON ?AUTO_55575 ?AUTO_55573 ) ( CLEAR ?AUTO_55582 ) ( ON ?AUTO_55581 ?AUTO_55575 ) ( ON ?AUTO_55574 ?AUTO_55581 ) ( ON ?AUTO_55576 ?AUTO_55574 ) ( CLEAR ?AUTO_55579 ) ( ON ?AUTO_55580 ?AUTO_55576 ) ( CLEAR ?AUTO_55580 ) ( HOLDING ?AUTO_55584 ) ( CLEAR ?AUTO_55585 ) )
    :subtasks
    ( ( !STACK ?AUTO_55584 ?AUTO_55585 )
      ( MAKE-ON ?AUTO_55573 ?AUTO_55574 ) )
    :id ( 5953 )
    :q-value ( 13 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_55740 - BLOCK
      ?AUTO_55741 - BLOCK
    )
    :vars
    (
      ?AUTO_55742 - BLOCK
      ?AUTO_55743 - BLOCK
      ?AUTO_55750 - BLOCK
      ?AUTO_55744 - BLOCK
      ?AUTO_55749 - BLOCK
      ?AUTO_55748 - BLOCK
      ?AUTO_55746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_55742 ) ( ON ?AUTO_55743 ?AUTO_55741 ) ( CLEAR ?AUTO_55750 ) ( ON ?AUTO_55744 ?AUTO_55743 ) ( ON ?AUTO_55749 ?AUTO_55744 ) ( ON ?AUTO_55748 ?AUTO_55749 ) ( ON-TABLE ?AUTO_55740 ) ( CLEAR ?AUTO_55740 ) ( ON ?AUTO_55746 ?AUTO_55748 ) ( CLEAR ?AUTO_55746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_55746 ?AUTO_55748 )
      ( MAKE-ON ?AUTO_55740 ?AUTO_55741 ) )
    :id ( 5968 )
    :q-value ( 13 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_55753 - BLOCK
      ?AUTO_55754 - BLOCK
    )
    :vars
    (
      ?AUTO_55756 - BLOCK
      ?AUTO_55760 - BLOCK
      ?AUTO_55761 - BLOCK
      ?AUTO_55762 - BLOCK
      ?AUTO_55758 - BLOCK
      ?AUTO_55763 - BLOCK
      ?AUTO_55765 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_55756 ?AUTO_55754 ) ( ON ?AUTO_55760 ?AUTO_55756 ) ( ON ?AUTO_55761 ?AUTO_55760 ) ( ON ?AUTO_55762 ?AUTO_55761 ) ( ON-TABLE ?AUTO_55753 ) ( CLEAR ?AUTO_55753 ) ( ON ?AUTO_55758 ?AUTO_55762 ) ( CLEAR ?AUTO_55758 ) ( HOLDING ?AUTO_55763 ) ( CLEAR ?AUTO_55765 ) )
    :subtasks
    ( ( !STACK ?AUTO_55763 ?AUTO_55765 )
      ( MAKE-ON ?AUTO_55753 ?AUTO_55754 ) )
    :id ( 5969 )
    :q-value ( 14 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56045 - BLOCK
      ?AUTO_56046 - BLOCK
    )
    :vars
    (
      ?AUTO_56049 - BLOCK
      ?AUTO_56051 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_56049 ?AUTO_56046 ) ( CLEAR ?AUTO_56049 ) ( ON ?AUTO_56045 ?AUTO_56051 ) ( CLEAR ?AUTO_56045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_56045 ?AUTO_56051 )
      ( MAKE-ON ?AUTO_56045 ?AUTO_56046 ) )
    :id ( 6010 )
    :q-value ( 6 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56529 - BLOCK
      ?AUTO_56530 - BLOCK
    )
    :vars
    (
      ?AUTO_56534 - BLOCK
      ?AUTO_56533 - BLOCK
      ?AUTO_56537 - BLOCK
      ?AUTO_56536 - BLOCK
      ?AUTO_56535 - BLOCK
      ?AUTO_56538 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_56529 ?AUTO_56534 ) ( ON ?AUTO_56533 ?AUTO_56529 ) ( ON ?AUTO_56537 ?AUTO_56533 ) ( CLEAR ?AUTO_56536 ) ( ON ?AUTO_56535 ?AUTO_56537 ) ( CLEAR ?AUTO_56538 ) ( ON ?AUTO_56530 ?AUTO_56535 ) ( CLEAR ?AUTO_56530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_56530 ?AUTO_56535 )
      ( MAKE-ON ?AUTO_56529 ?AUTO_56530 ) )
    :id ( 6069 )
    :q-value ( 10 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56541 - BLOCK
      ?AUTO_56542 - BLOCK
    )
    :vars
    (
      ?AUTO_56548 - BLOCK
      ?AUTO_56545 - BLOCK
      ?AUTO_56547 - BLOCK
      ?AUTO_56546 - BLOCK
      ?AUTO_56543 - BLOCK
      ?AUTO_56544 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_56541 ?AUTO_56548 ) ( ON ?AUTO_56545 ?AUTO_56541 ) ( ON ?AUTO_56547 ?AUTO_56545 ) ( CLEAR ?AUTO_56546 ) ( ON ?AUTO_56543 ?AUTO_56547 ) ( ON ?AUTO_56542 ?AUTO_56543 ) ( CLEAR ?AUTO_56542 ) ( HOLDING ?AUTO_56544 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_56544 )
      ( MAKE-ON ?AUTO_56541 ?AUTO_56542 ) )
    :id ( 6070 )
    :q-value ( 11 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56667 - BLOCK
      ?AUTO_56668 - BLOCK
    )
    :vars
    (
      ?AUTO_56669 - BLOCK
      ?AUTO_56676 - BLOCK
      ?AUTO_56671 - BLOCK
      ?AUTO_56670 - BLOCK
      ?AUTO_56675 - BLOCK
      ?AUTO_56673 - BLOCK
      ?AUTO_56677 - BLOCK
      ?AUTO_56678 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_56667 ?AUTO_56669 ) ( CLEAR ?AUTO_56667 ) ( ON ?AUTO_56676 ?AUTO_56668 ) ( ON ?AUTO_56671 ?AUTO_56676 ) ( ON ?AUTO_56670 ?AUTO_56671 ) ( CLEAR ?AUTO_56675 ) ( ON ?AUTO_56673 ?AUTO_56670 ) ( CLEAR ?AUTO_56677 ) ( ON ?AUTO_56678 ?AUTO_56673 ) ( CLEAR ?AUTO_56678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_56678 ?AUTO_56673 )
      ( MAKE-ON ?AUTO_56667 ?AUTO_56668 ) )
    :id ( 6082 )
    :q-value ( 14 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56681 - BLOCK
      ?AUTO_56682 - BLOCK
    )
    :vars
    (
      ?AUTO_56691 - BLOCK
      ?AUTO_56687 - BLOCK
      ?AUTO_56692 - BLOCK
      ?AUTO_56690 - BLOCK
      ?AUTO_56685 - BLOCK
      ?AUTO_56683 - BLOCK
      ?AUTO_56686 - BLOCK
      ?AUTO_56688 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_56681 ?AUTO_56691 ) ( CLEAR ?AUTO_56681 ) ( ON ?AUTO_56687 ?AUTO_56682 ) ( ON ?AUTO_56692 ?AUTO_56687 ) ( ON ?AUTO_56690 ?AUTO_56692 ) ( CLEAR ?AUTO_56685 ) ( ON ?AUTO_56683 ?AUTO_56690 ) ( ON ?AUTO_56686 ?AUTO_56683 ) ( CLEAR ?AUTO_56686 ) ( HOLDING ?AUTO_56688 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_56688 )
      ( MAKE-ON ?AUTO_56681 ?AUTO_56682 ) )
    :id ( 6083 )
    :q-value ( 13 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56696 - BLOCK
      ?AUTO_56697 - BLOCK
    )
    :vars
    (
      ?AUTO_56702 - BLOCK
      ?AUTO_56699 - BLOCK
      ?AUTO_56707 - BLOCK
      ?AUTO_56701 - BLOCK
      ?AUTO_56705 - BLOCK
      ?AUTO_56700 - BLOCK
      ?AUTO_56704 - BLOCK
      ?AUTO_56703 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_56702 ?AUTO_56697 ) ( ON ?AUTO_56699 ?AUTO_56702 ) ( ON ?AUTO_56707 ?AUTO_56699 ) ( CLEAR ?AUTO_56701 ) ( ON ?AUTO_56705 ?AUTO_56707 ) ( CLEAR ?AUTO_56700 ) ( ON ?AUTO_56704 ?AUTO_56705 ) ( CLEAR ?AUTO_56704 ) ( HOLDING ?AUTO_56696 ) ( CLEAR ?AUTO_56703 ) )
    :subtasks
    ( ( !STACK ?AUTO_56696 ?AUTO_56703 )
      ( MAKE-ON ?AUTO_56696 ?AUTO_56697 ) )
    :id ( 6084 )
    :q-value ( 15 )
    :q-count ( 3 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56864 - BLOCK
      ?AUTO_56865 - BLOCK
    )
    :vars
    (
      ?AUTO_56867 - BLOCK
      ?AUTO_56869 - BLOCK
      ?AUTO_56866 - BLOCK
      ?AUTO_56871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_56864 ) ( ON ?AUTO_56867 ?AUTO_56865 ) ( CLEAR ?AUTO_56864 ) ( ON ?AUTO_56869 ?AUTO_56866 ) ( CLEAR ?AUTO_56867 ) ( ON ?AUTO_56871 ?AUTO_56869 ) ( CLEAR ?AUTO_56871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_56871 ?AUTO_56869 )
      ( MAKE-ON ?AUTO_56864 ?AUTO_56865 ) )
    :id ( 6099 )
    :q-value ( 12 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_57490 - BLOCK
      ?AUTO_57491 - BLOCK
    )
    :vars
    (
      ?AUTO_57492 - BLOCK
      ?AUTO_57497 - BLOCK
      ?AUTO_57496 - BLOCK
      ?AUTO_57494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_57490 ) ( ON ?AUTO_57492 ?AUTO_57490 ) ( ON ?AUTO_57497 ?AUTO_57492 ) ( ON ?AUTO_57496 ?AUTO_57497 ) ( CLEAR ?AUTO_57496 ) ( CLEAR ?AUTO_57491 ) ( ON-TABLE ?AUTO_57494 ) ( CLEAR ?AUTO_57494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_57494 )
      ( MAKE-ON ?AUTO_57490 ?AUTO_57491 ) )
    :id ( 6173 )
    :q-value ( 14 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_57503 - BLOCK
      ?AUTO_57504 - BLOCK
    )
    :vars
    (
      ?AUTO_57506 - BLOCK
      ?AUTO_57507 - BLOCK
      ?AUTO_57508 - BLOCK
      ?AUTO_57505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_57503 ) ( ON ?AUTO_57506 ?AUTO_57503 ) ( ON ?AUTO_57507 ?AUTO_57506 ) ( ON ?AUTO_57508 ?AUTO_57507 ) ( CLEAR ?AUTO_57508 ) ( ON-TABLE ?AUTO_57505 ) ( CLEAR ?AUTO_57505 ) ( HOLDING ?AUTO_57504 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_57504 )
      ( MAKE-ON ?AUTO_57503 ?AUTO_57504 ) )
    :id ( 6174 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_57758 - BLOCK
      ?AUTO_57759 - BLOCK
    )
    :vars
    (
      ?AUTO_57762 - BLOCK
      ?AUTO_57764 - BLOCK
      ?AUTO_57760 - BLOCK
      ?AUTO_57763 - BLOCK
      ?AUTO_57766 - BLOCK
      ?AUTO_57767 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_57758 ?AUTO_57762 ) ( ON ?AUTO_57764 ?AUTO_57758 ) ( ON ?AUTO_57760 ?AUTO_57764 ) ( CLEAR ?AUTO_57763 ) ( ON ?AUTO_57759 ?AUTO_57760 ) ( CLEAR ?AUTO_57759 ) ( HOLDING ?AUTO_57766 ) ( CLEAR ?AUTO_57767 ) )
    :subtasks
    ( ( !STACK ?AUTO_57766 ?AUTO_57767 )
      ( MAKE-ON ?AUTO_57758 ?AUTO_57759 ) )
    :id ( 6211 )
    :q-value ( 9 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_57980 - BLOCK
      ?AUTO_57981 - BLOCK
    )
    :vars
    (
      ?AUTO_57982 - BLOCK
      ?AUTO_57985 - BLOCK
      ?AUTO_57983 - BLOCK
      ?AUTO_57987 - BLOCK
      ?AUTO_57986 - BLOCK
      ?AUTO_57989 - BLOCK
      ?AUTO_57990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_57982 ) ( ON ?AUTO_57985 ?AUTO_57981 ) ( ON ?AUTO_57980 ?AUTO_57985 ) ( ON ?AUTO_57983 ?AUTO_57980 ) ( CLEAR ?AUTO_57987 ) ( ON ?AUTO_57986 ?AUTO_57983 ) ( CLEAR ?AUTO_57986 ) ( HOLDING ?AUTO_57989 ) ( CLEAR ?AUTO_57990 ) )
    :subtasks
    ( ( !STACK ?AUTO_57989 ?AUTO_57990 )
      ( MAKE-ON ?AUTO_57980 ?AUTO_57981 ) )
    :id ( 6235 )
    :q-value ( 11 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_58472 - BLOCK
      ?AUTO_58473 - BLOCK
    )
    :vars
    (
      ?AUTO_58480 - BLOCK
      ?AUTO_58474 - BLOCK
      ?AUTO_58479 - BLOCK
      ?AUTO_58481 - BLOCK
      ?AUTO_58476 - BLOCK
      ?AUTO_58475 - BLOCK
      ?AUTO_58483 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_58472 ?AUTO_58480 ) ( ON ?AUTO_58474 ?AUTO_58472 ) ( ON ?AUTO_58479 ?AUTO_58474 ) ( CLEAR ?AUTO_58479 ) ( ON ?AUTO_58481 ?AUTO_58473 ) ( ON ?AUTO_58476 ?AUTO_58481 ) ( CLEAR ?AUTO_58476 ) ( HOLDING ?AUTO_58475 ) ( CLEAR ?AUTO_58483 ) )
    :subtasks
    ( ( !STACK ?AUTO_58475 ?AUTO_58483 )
      ( MAKE-ON ?AUTO_58472 ?AUTO_58473 ) )
    :id ( 6295 )
    :q-value ( 11 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_59266 - BLOCK
      ?AUTO_59267 - BLOCK
    )
    :vars
    (
      ?AUTO_59268 - BLOCK
      ?AUTO_59274 - BLOCK
      ?AUTO_59271 - BLOCK
      ?AUTO_59272 - BLOCK
      ?AUTO_59273 - BLOCK
      ?AUTO_59269 - BLOCK
      ?AUTO_59270 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_59266 ?AUTO_59268 ) ( ON ?AUTO_59274 ?AUTO_59266 ) ( CLEAR ?AUTO_59271 ) ( CLEAR ?AUTO_59272 ) ( ON ?AUTO_59273 ?AUTO_59267 ) ( ON ?AUTO_59269 ?AUTO_59273 ) ( CLEAR ?AUTO_59269 ) ( CLEAR ?AUTO_59274 ) ( ON-TABLE ?AUTO_59270 ) ( CLEAR ?AUTO_59270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_59270 )
      ( MAKE-ON ?AUTO_59266 ?AUTO_59267 ) )
    :id ( 6379 )
    :q-value ( 14 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_59282 - BLOCK
      ?AUTO_59283 - BLOCK
    )
    :vars
    (
      ?AUTO_59290 - BLOCK
      ?AUTO_59292 - BLOCK
      ?AUTO_59285 - BLOCK
      ?AUTO_59284 - BLOCK
      ?AUTO_59287 - BLOCK
      ?AUTO_59286 - BLOCK
      ?AUTO_59288 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_59282 ?AUTO_59290 ) ( ON ?AUTO_59292 ?AUTO_59282 ) ( CLEAR ?AUTO_59285 ) ( CLEAR ?AUTO_59284 ) ( ON ?AUTO_59287 ?AUTO_59283 ) ( CLEAR ?AUTO_59292 ) ( ON-TABLE ?AUTO_59286 ) ( CLEAR ?AUTO_59286 ) ( HOLDING ?AUTO_59288 ) ( CLEAR ?AUTO_59287 ) )
    :subtasks
    ( ( !STACK ?AUTO_59288 ?AUTO_59287 )
      ( MAKE-ON ?AUTO_59282 ?AUTO_59283 ) )
    :id ( 6380 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_59295 - BLOCK
      ?AUTO_59296 - BLOCK
    )
    :vars
    (
      ?AUTO_59304 - BLOCK
      ?AUTO_59305 - BLOCK
      ?AUTO_59299 - BLOCK
      ?AUTO_59301 - BLOCK
      ?AUTO_59300 - BLOCK
      ?AUTO_59302 - BLOCK
      ?AUTO_59303 - BLOCK
      ?AUTO_59307 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_59295 ?AUTO_59304 ) ( ON ?AUTO_59305 ?AUTO_59295 ) ( CLEAR ?AUTO_59299 ) ( CLEAR ?AUTO_59301 ) ( ON ?AUTO_59300 ?AUTO_59296 ) ( CLEAR ?AUTO_59305 ) ( ON-TABLE ?AUTO_59302 ) ( CLEAR ?AUTO_59302 ) ( CLEAR ?AUTO_59300 ) ( ON ?AUTO_59303 ?AUTO_59307 ) ( CLEAR ?AUTO_59303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_59303 ?AUTO_59307 )
      ( MAKE-ON ?AUTO_59295 ?AUTO_59296 ) )
    :id ( 6381 )
    :q-value ( 16 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60125 - BLOCK
      ?AUTO_60126 - BLOCK
    )
    :vars
    (
      ?AUTO_60127 - BLOCK
      ?AUTO_60131 - BLOCK
      ?AUTO_60128 - BLOCK
      ?AUTO_60129 - BLOCK
      ?AUTO_60132 - BLOCK
      ?AUTO_60130 - BLOCK
      ?AUTO_60136 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_60125 ?AUTO_60127 ) ( ON ?AUTO_60131 ?AUTO_60125 ) ( ON ?AUTO_60128 ?AUTO_60131 ) ( ON ?AUTO_60129 ?AUTO_60126 ) ( CLEAR ?AUTO_60129 ) ( ON ?AUTO_60132 ?AUTO_60128 ) ( CLEAR ?AUTO_60132 ) ( HOLDING ?AUTO_60130 ) ( CLEAR ?AUTO_60136 ) )
    :subtasks
    ( ( !STACK ?AUTO_60130 ?AUTO_60136 )
      ( MAKE-ON ?AUTO_60125 ?AUTO_60126 ) )
    :id ( 6419 )
    :q-value ( 11 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60150 - BLOCK
      ?AUTO_60151 - BLOCK
    )
    :vars
    (
      ?AUTO_60152 - BLOCK
      ?AUTO_60156 - BLOCK
      ?AUTO_60154 - BLOCK
      ?AUTO_60157 - BLOCK
      ?AUTO_60160 - BLOCK
      ?AUTO_60155 - BLOCK
      ?AUTO_60153 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_60150 ?AUTO_60152 ) ( ON ?AUTO_60156 ?AUTO_60150 ) ( ON ?AUTO_60154 ?AUTO_60156 ) ( ON ?AUTO_60157 ?AUTO_60151 ) ( CLEAR ?AUTO_60160 ) ( ON ?AUTO_60155 ?AUTO_60157 ) ( CLEAR ?AUTO_60155 ) ( HOLDING ?AUTO_60153 ) ( CLEAR ?AUTO_60154 ) )
    :subtasks
    ( ( !STACK ?AUTO_60153 ?AUTO_60154 )
      ( MAKE-ON ?AUTO_60150 ?AUTO_60151 ) )
    :id ( 6421 )
    :q-value ( 13 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60202 - BLOCK
      ?AUTO_60203 - BLOCK
    )
    :vars
    (
      ?AUTO_60206 - BLOCK
      ?AUTO_60205 - BLOCK
      ?AUTO_60210 - BLOCK
      ?AUTO_60204 - BLOCK
      ?AUTO_60207 - BLOCK
      ?AUTO_60211 - BLOCK
      ?AUTO_60212 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_60202 ?AUTO_60206 ) ( ON ?AUTO_60205 ?AUTO_60203 ) ( CLEAR ?AUTO_60210 ) ( ON ?AUTO_60204 ?AUTO_60205 ) ( ON ?AUTO_60207 ?AUTO_60204 ) ( ON ?AUTO_60211 ?AUTO_60207 ) ( CLEAR ?AUTO_60211 ) ( HOLDING ?AUTO_60212 ) ( CLEAR ?AUTO_60202 ) )
    :subtasks
    ( ( !STACK ?AUTO_60212 ?AUTO_60202 )
      ( MAKE-ON ?AUTO_60202 ?AUTO_60203 ) )
    :id ( 6425 )
    :q-value ( 17 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60228 - BLOCK
      ?AUTO_60229 - BLOCK
    )
    :vars
    (
      ?AUTO_60236 - BLOCK
      ?AUTO_60237 - BLOCK
      ?AUTO_60233 - BLOCK
      ?AUTO_60235 - BLOCK
      ?AUTO_60234 - BLOCK
      ?AUTO_60238 - BLOCK
      ?AUTO_60231 - BLOCK
      ?AUTO_60240 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_60228 ?AUTO_60236 ) ( ON ?AUTO_60237 ?AUTO_60229 ) ( ON ?AUTO_60233 ?AUTO_60237 ) ( ON ?AUTO_60235 ?AUTO_60233 ) ( ON ?AUTO_60234 ?AUTO_60235 ) ( CLEAR ?AUTO_60228 ) ( ON ?AUTO_60238 ?AUTO_60234 ) ( CLEAR ?AUTO_60238 ) ( HOLDING ?AUTO_60231 ) ( CLEAR ?AUTO_60240 ) )
    :subtasks
    ( ( !STACK ?AUTO_60231 ?AUTO_60240 )
      ( MAKE-ON ?AUTO_60228 ?AUTO_60229 ) )
    :id ( 6427 )
    :q-value ( 19 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60293 - BLOCK
      ?AUTO_60294 - BLOCK
    )
    :vars
    (
      ?AUTO_60297 - BLOCK
      ?AUTO_60300 - BLOCK
      ?AUTO_60302 - BLOCK
      ?AUTO_60295 - BLOCK
      ?AUTO_60301 - BLOCK
      ?AUTO_60296 - BLOCK
      ?AUTO_60303 - BLOCK
      ?AUTO_60305 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_60293 ?AUTO_60297 ) ( ON ?AUTO_60300 ?AUTO_60294 ) ( CLEAR ?AUTO_60302 ) ( ON ?AUTO_60295 ?AUTO_60300 ) ( ON ?AUTO_60301 ?AUTO_60295 ) ( CLEAR ?AUTO_60301 ) ( ON-TABLE ?AUTO_60296 ) ( CLEAR ?AUTO_60296 ) ( CLEAR ?AUTO_60293 ) ( ON ?AUTO_60303 ?AUTO_60305 ) ( CLEAR ?AUTO_60303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_60303 ?AUTO_60305 )
      ( MAKE-ON ?AUTO_60293 ?AUTO_60294 ) )
    :id ( 6431 )
    :q-value ( 18 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60306 - BLOCK
      ?AUTO_60307 - BLOCK
    )
    :vars
    (
      ?AUTO_60313 - BLOCK
      ?AUTO_60316 - BLOCK
      ?AUTO_60312 - BLOCK
      ?AUTO_60311 - BLOCK
      ?AUTO_60315 - BLOCK
      ?AUTO_60314 - BLOCK
      ?AUTO_60317 - BLOCK
      ?AUTO_60310 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_60306 ?AUTO_60313 ) ( ON ?AUTO_60316 ?AUTO_60307 ) ( CLEAR ?AUTO_60312 ) ( ON ?AUTO_60311 ?AUTO_60316 ) ( ON-TABLE ?AUTO_60315 ) ( CLEAR ?AUTO_60315 ) ( CLEAR ?AUTO_60306 ) ( ON ?AUTO_60314 ?AUTO_60317 ) ( CLEAR ?AUTO_60314 ) ( HOLDING ?AUTO_60310 ) ( CLEAR ?AUTO_60311 ) )
    :subtasks
    ( ( !STACK ?AUTO_60310 ?AUTO_60311 )
      ( MAKE-ON ?AUTO_60306 ?AUTO_60307 ) )
    :id ( 6432 )
    :q-value ( 19 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60576 - BLOCK
      ?AUTO_60577 - BLOCK
    )
    :vars
    (
      ?AUTO_60578 - BLOCK
      ?AUTO_60581 - BLOCK
      ?AUTO_60585 - BLOCK
      ?AUTO_60584 - BLOCK
      ?AUTO_60582 - BLOCK
      ?AUTO_60583 - BLOCK
      ?AUTO_60586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_60576 ) ( CLEAR ?AUTO_60578 ) ( ON ?AUTO_60581 ?AUTO_60577 ) ( ON ?AUTO_60585 ?AUTO_60581 ) ( ON ?AUTO_60584 ?AUTO_60585 ) ( CLEAR ?AUTO_60576 ) ( ON ?AUTO_60582 ?AUTO_60583 ) ( CLEAR ?AUTO_60584 ) ( ON ?AUTO_60586 ?AUTO_60582 ) ( CLEAR ?AUTO_60586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_60586 ?AUTO_60582 )
      ( MAKE-ON ?AUTO_60576 ?AUTO_60577 ) )
    :id ( 6456 )
    :q-value ( 22 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60589 - BLOCK
      ?AUTO_60590 - BLOCK
    )
    :vars
    (
      ?AUTO_60593 - BLOCK
      ?AUTO_60594 - BLOCK
      ?AUTO_60595 - BLOCK
      ?AUTO_60597 - BLOCK
      ?AUTO_60592 - BLOCK
      ?AUTO_60591 - BLOCK
      ?AUTO_60599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_60589 ) ( CLEAR ?AUTO_60593 ) ( ON ?AUTO_60594 ?AUTO_60590 ) ( ON ?AUTO_60595 ?AUTO_60594 ) ( CLEAR ?AUTO_60589 ) ( ON ?AUTO_60597 ?AUTO_60592 ) ( ON ?AUTO_60591 ?AUTO_60597 ) ( CLEAR ?AUTO_60591 ) ( HOLDING ?AUTO_60599 ) ( CLEAR ?AUTO_60595 ) )
    :subtasks
    ( ( !STACK ?AUTO_60599 ?AUTO_60595 )
      ( MAKE-ON ?AUTO_60589 ?AUTO_60590 ) )
    :id ( 6457 )
    :q-value ( 18 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60639 - BLOCK
      ?AUTO_60640 - BLOCK
    )
    :vars
    (
      ?AUTO_60648 - BLOCK
      ?AUTO_60645 - BLOCK
      ?AUTO_60642 - BLOCK
      ?AUTO_60643 - BLOCK
      ?AUTO_60646 - BLOCK
      ?AUTO_60641 - BLOCK
      ?AUTO_60647 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_60648 ) ( ON ?AUTO_60645 ?AUTO_60640 ) ( ON ?AUTO_60642 ?AUTO_60645 ) ( ON ?AUTO_60643 ?AUTO_60646 ) ( CLEAR ?AUTO_60642 ) ( ON-TABLE ?AUTO_60641 ) ( ON ?AUTO_60639 ?AUTO_60641 ) ( CLEAR ?AUTO_60639 ) ( HOLDING ?AUTO_60647 ) ( CLEAR ?AUTO_60643 ) )
    :subtasks
    ( ( !STACK ?AUTO_60647 ?AUTO_60643 )
      ( MAKE-ON ?AUTO_60639 ?AUTO_60640 ) )
    :id ( 6461 )
    :q-value ( 27 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_60660 - BLOCK
      ?AUTO_60661 - BLOCK
    )
    :vars
    (
      ?AUTO_60670 - BLOCK
      ?AUTO_60663 - BLOCK
      ?AUTO_60664 - BLOCK
      ?AUTO_60669 - BLOCK
      ?AUTO_60668 - BLOCK
      ?AUTO_60667 - BLOCK
      ?AUTO_60662 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_60660 ?AUTO_60670 ) ( ON ?AUTO_60663 ?AUTO_60660 ) ( CLEAR ?AUTO_60664 ) ( CLEAR ?AUTO_60669 ) ( ON ?AUTO_60668 ?AUTO_60661 ) ( CLEAR ?AUTO_60663 ) ( ON-TABLE ?AUTO_60667 ) ( CLEAR ?AUTO_60668 ) ( ON ?AUTO_60662 ?AUTO_60667 ) ( CLEAR ?AUTO_60662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_60662 ?AUTO_60667 )
      ( MAKE-ON ?AUTO_60660 ?AUTO_60661 ) )
    :id ( 6462 )
    :q-value ( 16 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_61384 - BLOCK
      ?AUTO_61385 - BLOCK
    )
    :vars
    (
      ?AUTO_61394 - BLOCK
      ?AUTO_61387 - BLOCK
      ?AUTO_61393 - BLOCK
      ?AUTO_61386 - BLOCK
      ?AUTO_61388 - BLOCK
      ?AUTO_61389 - BLOCK
      ?AUTO_61390 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_61384 ?AUTO_61394 ) ( CLEAR ?AUTO_61387 ) ( ON ?AUTO_61393 ?AUTO_61385 ) ( ON ?AUTO_61386 ?AUTO_61393 ) ( ON ?AUTO_61388 ?AUTO_61386 ) ( ON ?AUTO_61389 ?AUTO_61388 ) ( CLEAR ?AUTO_61389 ) ( CLEAR ?AUTO_61384 ) ( ON-TABLE ?AUTO_61390 ) ( CLEAR ?AUTO_61390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_61390 )
      ( MAKE-ON ?AUTO_61384 ?AUTO_61385 ) )
    :id ( 6543 )
    :q-value ( 18 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_62215 - BLOCK
      ?AUTO_62216 - BLOCK
    )
    :vars
    (
      ?AUTO_62228 - BLOCK
      ?AUTO_62219 - BLOCK
      ?AUTO_62220 - BLOCK
      ?AUTO_62221 - BLOCK
      ?AUTO_62224 - BLOCK
      ?AUTO_62226 - BLOCK
      ?AUTO_62223 - BLOCK
      ?AUTO_62225 - BLOCK
      ?AUTO_62218 - BLOCK
      ?AUTO_62222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_62215 ) ( CLEAR ?AUTO_62228 ) ( ON ?AUTO_62219 ?AUTO_62215 ) ( CLEAR ?AUTO_62220 ) ( CLEAR ?AUTO_62221 ) ( ON ?AUTO_62224 ?AUTO_62219 ) ( ON ?AUTO_62226 ?AUTO_62224 ) ( CLEAR ?AUTO_62223 ) ( ON ?AUTO_62225 ?AUTO_62216 ) ( ON ?AUTO_62218 ?AUTO_62225 ) ( CLEAR ?AUTO_62218 ) ( HOLDING ?AUTO_62222 ) ( CLEAR ?AUTO_62226 ) )
    :subtasks
    ( ( !STACK ?AUTO_62222 ?AUTO_62226 )
      ( MAKE-ON ?AUTO_62215 ?AUTO_62216 ) )
    :id ( 6605 )
    :q-value ( 21 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_62949 - BLOCK
      ?AUTO_62950 - BLOCK
    )
    :vars
    (
      ?AUTO_62955 - BLOCK
      ?AUTO_62952 - BLOCK
      ?AUTO_62956 - BLOCK
      ?AUTO_62953 - BLOCK
      ?AUTO_62954 - BLOCK
      ?AUTO_62959 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_62955 ) ( ON ?AUTO_62952 ?AUTO_62950 ) ( ON ?AUTO_62956 ?AUTO_62952 ) ( CLEAR ?AUTO_62956 ) ( ON-TABLE ?AUTO_62953 ) ( ON ?AUTO_62949 ?AUTO_62953 ) ( CLEAR ?AUTO_62949 ) ( HOLDING ?AUTO_62954 ) ( CLEAR ?AUTO_62959 ) )
    :subtasks
    ( ( !STACK ?AUTO_62954 ?AUTO_62959 )
      ( MAKE-ON ?AUTO_62949 ?AUTO_62950 ) )
    :id ( 6687 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_62972 - BLOCK
      ?AUTO_62973 - BLOCK
    )
    :vars
    (
      ?AUTO_62976 - BLOCK
      ?AUTO_62977 - BLOCK
      ?AUTO_62975 - BLOCK
      ?AUTO_62979 - BLOCK
      ?AUTO_62974 - BLOCK
      ?AUTO_62978 - BLOCK
      ?AUTO_62983 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_62976 ?AUTO_62973 ) ( ON ?AUTO_62977 ?AUTO_62976 ) ( CLEAR ?AUTO_62977 ) ( ON-TABLE ?AUTO_62975 ) ( ON ?AUTO_62972 ?AUTO_62975 ) ( CLEAR ?AUTO_62979 ) ( ON ?AUTO_62974 ?AUTO_62972 ) ( CLEAR ?AUTO_62974 ) ( HOLDING ?AUTO_62978 ) ( CLEAR ?AUTO_62983 ) )
    :subtasks
    ( ( !STACK ?AUTO_62978 ?AUTO_62983 )
      ( MAKE-ON ?AUTO_62972 ?AUTO_62973 ) )
    :id ( 6689 )
    :q-value ( 19 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_62984 - BLOCK
      ?AUTO_62985 - BLOCK
    )
    :vars
    (
      ?AUTO_62989 - BLOCK
      ?AUTO_62986 - BLOCK
      ?AUTO_62987 - BLOCK
      ?AUTO_62993 - BLOCK
      ?AUTO_62991 - BLOCK
      ?AUTO_62988 - BLOCK
      ?AUTO_62994 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_62989 ?AUTO_62985 ) ( ON ?AUTO_62986 ?AUTO_62989 ) ( ON-TABLE ?AUTO_62987 ) ( ON ?AUTO_62984 ?AUTO_62987 ) ( CLEAR ?AUTO_62993 ) ( ON ?AUTO_62991 ?AUTO_62984 ) ( CLEAR ?AUTO_62991 ) ( CLEAR ?AUTO_62988 ) ( ON ?AUTO_62994 ?AUTO_62986 ) ( CLEAR ?AUTO_62994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_62994 ?AUTO_62986 )
      ( MAKE-ON ?AUTO_62984 ?AUTO_62985 ) )
    :id ( 6690 )
    :q-value ( 20 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_62997 - BLOCK
      ?AUTO_62998 - BLOCK
    )
    :vars
    (
      ?AUTO_63002 - BLOCK
      ?AUTO_63000 - BLOCK
      ?AUTO_63001 - BLOCK
      ?AUTO_63005 - BLOCK
      ?AUTO_63004 - BLOCK
      ?AUTO_63006 - BLOCK
      ?AUTO_62999 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_63002 ?AUTO_62998 ) ( ON ?AUTO_63000 ?AUTO_63002 ) ( ON-TABLE ?AUTO_63001 ) ( ON ?AUTO_62997 ?AUTO_63001 ) ( CLEAR ?AUTO_63005 ) ( ON ?AUTO_63004 ?AUTO_62997 ) ( CLEAR ?AUTO_63004 ) ( ON ?AUTO_63006 ?AUTO_63000 ) ( CLEAR ?AUTO_63006 ) ( HOLDING ?AUTO_62999 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_62999 )
      ( MAKE-ON ?AUTO_62997 ?AUTO_62998 ) )
    :id ( 6691 )
    :q-value ( 21 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_63009 - BLOCK
      ?AUTO_63010 - BLOCK
    )
    :vars
    (
      ?AUTO_63013 - BLOCK
      ?AUTO_63012 - BLOCK
      ?AUTO_63018 - BLOCK
      ?AUTO_63011 - BLOCK
      ?AUTO_63017 - BLOCK
      ?AUTO_63019 - BLOCK
      ?AUTO_63016 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_63013 ?AUTO_63010 ) ( ON ?AUTO_63012 ?AUTO_63013 ) ( ON-TABLE ?AUTO_63018 ) ( ON ?AUTO_63009 ?AUTO_63018 ) ( CLEAR ?AUTO_63011 ) ( ON ?AUTO_63017 ?AUTO_63009 ) ( ON ?AUTO_63019 ?AUTO_63012 ) ( CLEAR ?AUTO_63019 ) ( ON ?AUTO_63016 ?AUTO_63017 ) ( CLEAR ?AUTO_63016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_63016 ?AUTO_63017 )
      ( MAKE-ON ?AUTO_63009 ?AUTO_63010 ) )
    :id ( 6692 )
    :q-value ( 22 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_64441 - BLOCK
      ?AUTO_64442 - BLOCK
    )
    :vars
    (
      ?AUTO_64446 - BLOCK
      ?AUTO_64451 - BLOCK
      ?AUTO_64447 - BLOCK
      ?AUTO_64449 - BLOCK
      ?AUTO_64444 - BLOCK
      ?AUTO_64443 - BLOCK
      ?AUTO_64450 - BLOCK
      ?AUTO_64452 - BLOCK
      ?AUTO_64453 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_64446 ) ( CLEAR ?AUTO_64451 ) ( CLEAR ?AUTO_64447 ) ( ON ?AUTO_64449 ?AUTO_64442 ) ( ON ?AUTO_64444 ?AUTO_64449 ) ( CLEAR ?AUTO_64444 ) ( ON-TABLE ?AUTO_64443 ) ( ON-TABLE ?AUTO_64450 ) ( CLEAR ?AUTO_64450 ) ( ON ?AUTO_64441 ?AUTO_64443 ) ( CLEAR ?AUTO_64441 ) ( HOLDING ?AUTO_64452 ) ( CLEAR ?AUTO_64453 ) )
    :subtasks
    ( ( !STACK ?AUTO_64452 ?AUTO_64453 )
      ( MAKE-ON ?AUTO_64441 ?AUTO_64442 ) )
    :id ( 6807 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_64476 - BLOCK
      ?AUTO_64477 - BLOCK
    )
    :vars
    (
      ?AUTO_64481 - BLOCK
      ?AUTO_64478 - BLOCK
      ?AUTO_64479 - BLOCK
      ?AUTO_64482 - BLOCK
      ?AUTO_64485 - BLOCK
      ?AUTO_64486 - BLOCK
      ?AUTO_64480 - BLOCK
      ?AUTO_64488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_64481 ) ( CLEAR ?AUTO_64478 ) ( CLEAR ?AUTO_64479 ) ( ON ?AUTO_64482 ?AUTO_64477 ) ( ON ?AUTO_64485 ?AUTO_64482 ) ( CLEAR ?AUTO_64485 ) ( ON-TABLE ?AUTO_64486 ) ( ON ?AUTO_64476 ?AUTO_64486 ) ( CLEAR ?AUTO_64476 ) ( ON ?AUTO_64480 ?AUTO_64488 ) ( CLEAR ?AUTO_64480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_64480 ?AUTO_64488 )
      ( MAKE-ON ?AUTO_64476 ?AUTO_64477 ) )
    :id ( 6809 )
    :q-value ( 18 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_64793 - BLOCK
      ?AUTO_64794 - BLOCK
    )
    :vars
    (
      ?AUTO_64795 - BLOCK
      ?AUTO_64796 - BLOCK
      ?AUTO_64800 - BLOCK
      ?AUTO_64798 - BLOCK
      ?AUTO_64801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_64793 ?AUTO_64795 ) ( ON ?AUTO_64796 ?AUTO_64793 ) ( ON ?AUTO_64794 ?AUTO_64796 ) ( CLEAR ?AUTO_64800 ) ( ON ?AUTO_64798 ?AUTO_64794 ) ( ON ?AUTO_64801 ?AUTO_64798 ) ( CLEAR ?AUTO_64801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_64801 ?AUTO_64798 )
      ( MAKE-ON ?AUTO_64793 ?AUTO_64794 ) )
    :id ( 6852 )
    :q-value ( 10 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_64804 - BLOCK
      ?AUTO_64805 - BLOCK
    )
    :vars
    (
      ?AUTO_64806 - BLOCK
      ?AUTO_64807 - BLOCK
      ?AUTO_64811 - BLOCK
      ?AUTO_64812 - BLOCK
      ?AUTO_64810 - BLOCK
      ?AUTO_64813 - BLOCK
      ?AUTO_64814 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_64804 ?AUTO_64806 ) ( ON ?AUTO_64807 ?AUTO_64804 ) ( ON ?AUTO_64805 ?AUTO_64807 ) ( CLEAR ?AUTO_64811 ) ( ON ?AUTO_64812 ?AUTO_64805 ) ( ON ?AUTO_64810 ?AUTO_64812 ) ( CLEAR ?AUTO_64810 ) ( HOLDING ?AUTO_64813 ) ( CLEAR ?AUTO_64814 ) )
    :subtasks
    ( ( !STACK ?AUTO_64813 ?AUTO_64814 )
      ( MAKE-ON ?AUTO_64804 ?AUTO_64805 ) )
    :id ( 6853 )
    :q-value ( 11 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_64925 - BLOCK
      ?AUTO_64926 - BLOCK
    )
    :vars
    (
      ?AUTO_64927 - BLOCK
      ?AUTO_64929 - BLOCK
      ?AUTO_64928 - BLOCK
      ?AUTO_64933 - BLOCK
      ?AUTO_64931 - BLOCK
      ?AUTO_64932 - BLOCK
      ?AUTO_64936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_64925 ) ( ON ?AUTO_64927 ?AUTO_64925 ) ( ON ?AUTO_64929 ?AUTO_64927 ) ( ON ?AUTO_64928 ?AUTO_64929 ) ( CLEAR ?AUTO_64933 ) ( ON ?AUTO_64931 ?AUTO_64928 ) ( ON ?AUTO_64932 ?AUTO_64931 ) ( CLEAR ?AUTO_64932 ) ( HOLDING ?AUTO_64926 ) ( CLEAR ?AUTO_64936 ) )
    :subtasks
    ( ( !STACK ?AUTO_64926 ?AUTO_64936 )
      ( MAKE-ON ?AUTO_64925 ?AUTO_64926 ) )
    :id ( 6866 )
    :q-value ( 13 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_65407 - BLOCK
      ?AUTO_65408 - BLOCK
    )
    :vars
    (
      ?AUTO_65416 - BLOCK
      ?AUTO_65410 - BLOCK
      ?AUTO_65415 - BLOCK
      ?AUTO_65412 - BLOCK
      ?AUTO_65409 - BLOCK
      ?AUTO_65414 - BLOCK
      ?AUTO_65417 - BLOCK
      ?AUTO_65418 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_65407 ?AUTO_65416 ) ( CLEAR ?AUTO_65410 ) ( ON ?AUTO_65415 ?AUTO_65407 ) ( CLEAR ?AUTO_65412 ) ( ON ?AUTO_65409 ?AUTO_65415 ) ( ON ?AUTO_65414 ?AUTO_65409 ) ( ON ?AUTO_65408 ?AUTO_65414 ) ( CLEAR ?AUTO_65408 ) ( HOLDING ?AUTO_65417 ) ( CLEAR ?AUTO_65418 ) )
    :subtasks
    ( ( !STACK ?AUTO_65417 ?AUTO_65418 )
      ( MAKE-ON ?AUTO_65407 ?AUTO_65408 ) )
    :id ( 6915 )
    :q-value ( 11 )
    :q-count ( 2 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_66402 - BLOCK
      ?AUTO_66403 - BLOCK
    )
    :vars
    (
      ?AUTO_66406 - BLOCK
      ?AUTO_66407 - BLOCK
      ?AUTO_66412 - BLOCK
      ?AUTO_66404 - BLOCK
      ?AUTO_66405 - BLOCK
      ?AUTO_66408 - BLOCK
      ?AUTO_66411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_66402 ) ( CLEAR ?AUTO_66406 ) ( ON ?AUTO_66407 ?AUTO_66402 ) ( ON ?AUTO_66403 ?AUTO_66407 ) ( CLEAR ?AUTO_66412 ) ( ON ?AUTO_66404 ?AUTO_66403 ) ( CLEAR ?AUTO_66405 ) ( ON ?AUTO_66408 ?AUTO_66404 ) ( ON ?AUTO_66411 ?AUTO_66408 ) ( CLEAR ?AUTO_66411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_66411 ?AUTO_66408 )
      ( MAKE-ON ?AUTO_66402 ?AUTO_66403 ) )
    :id ( 7024 )
    :q-value ( 12 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_66415 - BLOCK
      ?AUTO_66416 - BLOCK
    )
    :vars
    (
      ?AUTO_66424 - BLOCK
      ?AUTO_66420 - BLOCK
      ?AUTO_66417 - BLOCK
      ?AUTO_66419 - BLOCK
      ?AUTO_66423 - BLOCK
      ?AUTO_66422 - BLOCK
      ?AUTO_66421 - BLOCK
      ?AUTO_66427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_66415 ) ( CLEAR ?AUTO_66424 ) ( ON ?AUTO_66420 ?AUTO_66415 ) ( ON ?AUTO_66416 ?AUTO_66420 ) ( CLEAR ?AUTO_66417 ) ( ON ?AUTO_66419 ?AUTO_66416 ) ( ON ?AUTO_66423 ?AUTO_66419 ) ( ON ?AUTO_66422 ?AUTO_66423 ) ( CLEAR ?AUTO_66422 ) ( HOLDING ?AUTO_66421 ) ( CLEAR ?AUTO_66427 ) )
    :subtasks
    ( ( !STACK ?AUTO_66421 ?AUTO_66427 )
      ( MAKE-ON ?AUTO_66415 ?AUTO_66416 ) )
    :id ( 7025 )
    :q-value ( 13 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_66973 - BLOCK
      ?AUTO_66974 - BLOCK
    )
    :vars
    (
      ?AUTO_66981 - BLOCK
      ?AUTO_66979 - BLOCK
      ?AUTO_66977 - BLOCK
      ?AUTO_66978 - BLOCK
      ?AUTO_66983 - BLOCK
      ?AUTO_66980 - BLOCK
      ?AUTO_66976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_66973 ) ( CLEAR ?AUTO_66981 ) ( ON ?AUTO_66979 ?AUTO_66973 ) ( ON ?AUTO_66977 ?AUTO_66979 ) ( CLEAR ?AUTO_66978 ) ( ON ?AUTO_66983 ?AUTO_66977 ) ( CLEAR ?AUTO_66980 ) ( ON ?AUTO_66976 ?AUTO_66983 ) ( ON ?AUTO_66974 ?AUTO_66976 ) ( CLEAR ?AUTO_66974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_66974 ?AUTO_66976 )
      ( MAKE-ON ?AUTO_66973 ?AUTO_66974 ) )
    :id ( 7067 )
    :q-value ( 14 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_66986 - BLOCK
      ?AUTO_66987 - BLOCK
    )
    :vars
    (
      ?AUTO_66996 - BLOCK
      ?AUTO_66994 - BLOCK
      ?AUTO_66988 - BLOCK
      ?AUTO_66989 - BLOCK
      ?AUTO_66995 - BLOCK
      ?AUTO_66991 - BLOCK
      ?AUTO_66992 - BLOCK
      ?AUTO_66998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_66986 ) ( CLEAR ?AUTO_66996 ) ( ON ?AUTO_66994 ?AUTO_66986 ) ( ON ?AUTO_66988 ?AUTO_66994 ) ( CLEAR ?AUTO_66989 ) ( ON ?AUTO_66995 ?AUTO_66988 ) ( ON ?AUTO_66991 ?AUTO_66995 ) ( ON ?AUTO_66987 ?AUTO_66991 ) ( CLEAR ?AUTO_66987 ) ( HOLDING ?AUTO_66992 ) ( CLEAR ?AUTO_66998 ) )
    :subtasks
    ( ( !STACK ?AUTO_66992 ?AUTO_66998 )
      ( MAKE-ON ?AUTO_66986 ?AUTO_66987 ) )
    :id ( 7068 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_67799 - BLOCK
      ?AUTO_67800 - BLOCK
    )
    :vars
    (
      ?AUTO_67806 - BLOCK
      ?AUTO_67803 - BLOCK
      ?AUTO_67807 - BLOCK
      ?AUTO_67802 - BLOCK
      ?AUTO_67801 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_67799 ) ( ON ?AUTO_67806 ?AUTO_67800 ) ( ON ?AUTO_67803 ?AUTO_67806 ) ( ON ?AUTO_67807 ?AUTO_67803 ) ( CLEAR ?AUTO_67807 ) ( CLEAR ?AUTO_67799 ) ( ON ?AUTO_67802 ?AUTO_67801 ) ( CLEAR ?AUTO_67802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_67802 ?AUTO_67801 )
      ( MAKE-ON ?AUTO_67799 ?AUTO_67800 ) )
    :id ( 7152 )
    :q-value ( 12 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_68009 - BLOCK
    )
    :vars
    (
      ?AUTO_68015 - BLOCK
      ?AUTO_68014 - BLOCK
      ?AUTO_68012 - BLOCK
      ?AUTO_68016 - BLOCK
      ?AUTO_68013 - BLOCK
      ?AUTO_68011 - BLOCK
      ?AUTO_68017 - BLOCK
      ?AUTO_68018 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_68009 ?AUTO_68015 ) ( ON ?AUTO_68014 ?AUTO_68009 ) ( CLEAR ?AUTO_68012 ) ( ON ?AUTO_68016 ?AUTO_68014 ) ( CLEAR ?AUTO_68013 ) ( ON ?AUTO_68011 ?AUTO_68016 ) ( ON ?AUTO_68017 ?AUTO_68011 ) ( CLEAR ?AUTO_68017 ) ( HOLDING ?AUTO_68018 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_68018 )
      ( MAKE-ON-TABLE ?AUTO_68009 ) )
    :id ( 7168 )
    :q-value ( 11 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_68019 - BLOCK
    )
    :vars
    (
      ?AUTO_68025 - BLOCK
      ?AUTO_68028 - BLOCK
      ?AUTO_68023 - BLOCK
      ?AUTO_68026 - BLOCK
      ?AUTO_68027 - BLOCK
      ?AUTO_68024 - BLOCK
      ?AUTO_68022 - BLOCK
      ?AUTO_68021 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_68019 ?AUTO_68025 ) ( ON ?AUTO_68028 ?AUTO_68019 ) ( CLEAR ?AUTO_68023 ) ( ON ?AUTO_68026 ?AUTO_68028 ) ( CLEAR ?AUTO_68027 ) ( ON ?AUTO_68024 ?AUTO_68026 ) ( ON ?AUTO_68022 ?AUTO_68024 ) ( ON ?AUTO_68021 ?AUTO_68022 ) ( CLEAR ?AUTO_68021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_68021 ?AUTO_68022 )
      ( MAKE-ON-TABLE ?AUTO_68019 ) )
    :id ( 7169 )
    :q-value ( 12 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_68031 - BLOCK
    )
    :vars
    (
      ?AUTO_68039 - BLOCK
      ?AUTO_68040 - BLOCK
      ?AUTO_68037 - BLOCK
      ?AUTO_68033 - BLOCK
      ?AUTO_68036 - BLOCK
      ?AUTO_68038 - BLOCK
      ?AUTO_68034 - BLOCK
      ?AUTO_68032 - BLOCK
      ?AUTO_68041 - BLOCK
      ?AUTO_68042 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_68031 ?AUTO_68039 ) ( ON ?AUTO_68040 ?AUTO_68031 ) ( CLEAR ?AUTO_68037 ) ( ON ?AUTO_68033 ?AUTO_68040 ) ( CLEAR ?AUTO_68036 ) ( ON ?AUTO_68038 ?AUTO_68033 ) ( ON ?AUTO_68034 ?AUTO_68038 ) ( ON ?AUTO_68032 ?AUTO_68034 ) ( CLEAR ?AUTO_68032 ) ( HOLDING ?AUTO_68041 ) ( CLEAR ?AUTO_68042 ) )
    :subtasks
    ( ( !STACK ?AUTO_68041 ?AUTO_68042 )
      ( MAKE-ON-TABLE ?AUTO_68031 ) )
    :id ( 7170 )
    :q-value ( 13 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_68203 - BLOCK
      ?AUTO_68204 - BLOCK
    )
    :vars
    (
      ?AUTO_68206 - BLOCK
      ?AUTO_68209 - BLOCK
      ?AUTO_68213 - BLOCK
      ?AUTO_68214 - BLOCK
      ?AUTO_68205 - BLOCK
      ?AUTO_68211 - BLOCK
      ?AUTO_68215 - BLOCK
      ?AUTO_68212 - BLOCK
      ?AUTO_68210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_68204 ) ( ON-TABLE ?AUTO_68203 ) ( CLEAR ?AUTO_68206 ) ( ON ?AUTO_68209 ?AUTO_68203 ) ( CLEAR ?AUTO_68213 ) ( ON ?AUTO_68214 ?AUTO_68209 ) ( ON ?AUTO_68205 ?AUTO_68214 ) ( CLEAR ?AUTO_68211 ) ( ON ?AUTO_68215 ?AUTO_68205 ) ( ON ?AUTO_68212 ?AUTO_68215 ) ( ON ?AUTO_68210 ?AUTO_68212 ) ( CLEAR ?AUTO_68210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_68210 ?AUTO_68212 )
      ( MAKE-ON ?AUTO_68203 ?AUTO_68204 ) )
    :id ( 7186 )
    :q-value ( 14 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_68218 - BLOCK
      ?AUTO_68219 - BLOCK
    )
    :vars
    (
      ?AUTO_68227 - BLOCK
      ?AUTO_68230 - BLOCK
      ?AUTO_68226 - BLOCK
      ?AUTO_68222 - BLOCK
      ?AUTO_68220 - BLOCK
      ?AUTO_68229 - BLOCK
      ?AUTO_68221 - BLOCK
      ?AUTO_68224 - BLOCK
      ?AUTO_68223 - BLOCK
      ?AUTO_68232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_68218 ) ( CLEAR ?AUTO_68227 ) ( ON ?AUTO_68230 ?AUTO_68218 ) ( CLEAR ?AUTO_68226 ) ( ON ?AUTO_68222 ?AUTO_68230 ) ( ON ?AUTO_68220 ?AUTO_68222 ) ( CLEAR ?AUTO_68229 ) ( ON ?AUTO_68221 ?AUTO_68220 ) ( ON ?AUTO_68224 ?AUTO_68221 ) ( ON ?AUTO_68223 ?AUTO_68224 ) ( CLEAR ?AUTO_68223 ) ( HOLDING ?AUTO_68219 ) ( CLEAR ?AUTO_68232 ) )
    :subtasks
    ( ( !STACK ?AUTO_68219 ?AUTO_68232 )
      ( MAKE-ON ?AUTO_68218 ?AUTO_68219 ) )
    :id ( 7187 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_69006 - BLOCK
      ?AUTO_69007 - BLOCK
    )
    :vars
    (
      ?AUTO_69014 - BLOCK
      ?AUTO_69009 - BLOCK
      ?AUTO_69013 - BLOCK
      ?AUTO_69010 - BLOCK
      ?AUTO_69011 - BLOCK
      ?AUTO_69012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_69006 ) ( ON ?AUTO_69014 ?AUTO_69006 ) ( ON ?AUTO_69009 ?AUTO_69007 ) ( ON ?AUTO_69013 ?AUTO_69009 ) ( ON ?AUTO_69010 ?AUTO_69013 ) ( ON ?AUTO_69011 ?AUTO_69010 ) ( CLEAR ?AUTO_69011 ) ( HOLDING ?AUTO_69012 ) ( CLEAR ?AUTO_69014 ) )
    :subtasks
    ( ( !STACK ?AUTO_69012 ?AUTO_69014 )
      ( MAKE-ON ?AUTO_69006 ?AUTO_69007 ) )
    :id ( 7268 )
    :q-value ( 15 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_69019 - BLOCK
      ?AUTO_69020 - BLOCK
    )
    :vars
    (
      ?AUTO_69021 - BLOCK
      ?AUTO_69022 - BLOCK
      ?AUTO_69025 - BLOCK
      ?AUTO_69024 - BLOCK
      ?AUTO_69026 - BLOCK
      ?AUTO_69027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_69019 ) ( ON ?AUTO_69021 ?AUTO_69019 ) ( ON ?AUTO_69022 ?AUTO_69020 ) ( ON ?AUTO_69025 ?AUTO_69022 ) ( ON ?AUTO_69024 ?AUTO_69025 ) ( ON ?AUTO_69026 ?AUTO_69024 ) ( CLEAR ?AUTO_69021 ) ( ON ?AUTO_69027 ?AUTO_69026 ) ( CLEAR ?AUTO_69027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_69027 ?AUTO_69026 )
      ( MAKE-ON ?AUTO_69019 ?AUTO_69020 ) )
    :id ( 7269 )
    :q-value ( 16 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_69031 - BLOCK
      ?AUTO_69032 - BLOCK
    )
    :vars
    (
      ?AUTO_69034 - BLOCK
      ?AUTO_69039 - BLOCK
      ?AUTO_69038 - BLOCK
      ?AUTO_69035 - BLOCK
      ?AUTO_69037 - BLOCK
      ?AUTO_69040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_69031 ) ( ON ?AUTO_69034 ?AUTO_69032 ) ( ON ?AUTO_69039 ?AUTO_69034 ) ( ON ?AUTO_69038 ?AUTO_69039 ) ( ON ?AUTO_69035 ?AUTO_69038 ) ( ON ?AUTO_69037 ?AUTO_69035 ) ( CLEAR ?AUTO_69037 ) ( HOLDING ?AUTO_69040 ) ( CLEAR ?AUTO_69031 ) )
    :subtasks
    ( ( !STACK ?AUTO_69040 ?AUTO_69031 )
      ( MAKE-ON ?AUTO_69031 ?AUTO_69032 ) )
    :id ( 7270 )
    :q-value ( 17 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_69043 - BLOCK
      ?AUTO_69044 - BLOCK
    )
    :vars
    (
      ?AUTO_69046 - BLOCK
      ?AUTO_69052 - BLOCK
      ?AUTO_69051 - BLOCK
      ?AUTO_69045 - BLOCK
      ?AUTO_69050 - BLOCK
      ?AUTO_69048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_69043 ) ( ON ?AUTO_69046 ?AUTO_69044 ) ( ON ?AUTO_69052 ?AUTO_69046 ) ( ON ?AUTO_69051 ?AUTO_69052 ) ( ON ?AUTO_69045 ?AUTO_69051 ) ( ON ?AUTO_69050 ?AUTO_69045 ) ( CLEAR ?AUTO_69050 ) ( CLEAR ?AUTO_69043 ) ( ON-TABLE ?AUTO_69048 ) ( CLEAR ?AUTO_69048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_69048 )
      ( MAKE-ON ?AUTO_69043 ?AUTO_69044 ) )
    :id ( 7271 )
    :q-value ( 18 )
    :q-count ( 1 )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_69054 - BLOCK
      ?AUTO_69055 - BLOCK
    )
    :vars
    (
      ?AUTO_69057 - BLOCK
      ?AUTO_69063 - BLOCK
      ?AUTO_69061 - BLOCK
      ?AUTO_69062 - BLOCK
      ?AUTO_69059 - BLOCK
      ?AUTO_69058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_69054 ) ( ON ?AUTO_69057 ?AUTO_69055 ) ( ON ?AUTO_69063 ?AUTO_69057 ) ( ON ?AUTO_69061 ?AUTO_69063 ) ( ON ?AUTO_69062 ?AUTO_69061 ) ( CLEAR ?AUTO_69054 ) ( ON-TABLE ?AUTO_69059 ) ( CLEAR ?AUTO_69059 ) ( HOLDING ?AUTO_69058 ) ( CLEAR ?AUTO_69062 ) )
    :subtasks
    ( ( !STACK ?AUTO_69058 ?AUTO_69062 )
      ( MAKE-ON ?AUTO_69054 ?AUTO_69055 ) )
    :id ( 7272 )
    :q-value ( 19 )
    :q-count ( 1 )
  )

)
