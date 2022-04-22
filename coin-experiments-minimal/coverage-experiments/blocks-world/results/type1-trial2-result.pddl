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
      ?AUTO_14 - BLOCK
    )
    :vars
    (
      ?AUTO_15 - BLOCK
      ?AUTO_17 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_14 ?AUTO_15 ) ( CLEAR ?AUTO_14 ) ( HOLDING ?AUTO_17 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_17 )
      ( MAKE-ON-TABLE ?AUTO_14 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_14 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_18 - BLOCK
    )
    :vars
    (
      ?AUTO_21 - BLOCK
      ?AUTO_19 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_18 ?AUTO_21 ) ( ON ?AUTO_19 ?AUTO_18 ) ( CLEAR ?AUTO_19 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_19 ?AUTO_18 )
      ( MAKE-ON-TABLE ?AUTO_18 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_18 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_26 - BLOCK
      ?AUTO_27 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_26 ) ( CLEAR ?AUTO_27 ) )
    :subtasks
    ( ( !STACK ?AUTO_26 ?AUTO_27 )
      ( MAKE-ON-VERIFY ?AUTO_26 ?AUTO_27 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_30 - BLOCK
      ?AUTO_31 - BLOCK
    )
    :vars
    (
      ?AUTO_35 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_31 ) ( ON ?AUTO_30 ?AUTO_35 ) ( CLEAR ?AUTO_30 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_30 ?AUTO_35 )
      ( MAKE-ON ?AUTO_30 ?AUTO_31 )
      ( MAKE-ON-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_36 - BLOCK
      ?AUTO_37 - BLOCK
    )
    :vars
    (
      ?AUTO_40 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_36 ?AUTO_40 ) ( CLEAR ?AUTO_36 ) ( HOLDING ?AUTO_37 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_37 )
      ( MAKE-ON ?AUTO_36 ?AUTO_37 )
      ( MAKE-ON-VERIFY ?AUTO_36 ?AUTO_37 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_552 - BLOCK
      ?AUTO_553 - BLOCK
    )
    :vars
    (
      ?AUTO_557 - BLOCK
      ?AUTO_558 - BLOCK
      ?AUTO_556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_553 ) ( ON ?AUTO_552 ?AUTO_557 ) ( CLEAR ?AUTO_558 ) ( ON ?AUTO_556 ?AUTO_552 ) ( CLEAR ?AUTO_556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_556 ?AUTO_552 )
      ( MAKE-ON ?AUTO_552 ?AUTO_553 )
      ( MAKE-ON-VERIFY ?AUTO_552 ?AUTO_553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1593 - BLOCK
      ?AUTO_1594 - BLOCK
    )
    :vars
    (
      ?AUTO_1596 - BLOCK
      ?AUTO_1597 - BLOCK
      ?AUTO_1599 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1594 ) ( ON ?AUTO_1593 ?AUTO_1596 ) ( ON ?AUTO_1597 ?AUTO_1593 ) ( CLEAR ?AUTO_1597 ) ( HOLDING ?AUTO_1599 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1599 )
      ( MAKE-ON ?AUTO_1593 ?AUTO_1594 )
      ( MAKE-ON-VERIFY ?AUTO_1593 ?AUTO_1594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1688 - BLOCK
      ?AUTO_1689 - BLOCK
    )
    :vars
    (
      ?AUTO_1695 - BLOCK
      ?AUTO_1696 - BLOCK
      ?AUTO_1694 - BLOCK
      ?AUTO_1692 - BLOCK
      ?AUTO_1690 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1688 ?AUTO_1695 ) ( CLEAR ?AUTO_1696 ) ( ON ?AUTO_1694 ?AUTO_1688 ) ( ON ?AUTO_1692 ?AUTO_1694 ) ( CLEAR ?AUTO_1692 ) ( ON ?AUTO_1690 ?AUTO_1689 ) ( CLEAR ?AUTO_1690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1690 ?AUTO_1689 )
      ( MAKE-ON ?AUTO_1688 ?AUTO_1689 )
      ( MAKE-ON-VERIFY ?AUTO_1688 ?AUTO_1689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_75 - BLOCK
      ?AUTO_76 - BLOCK
    )
    :vars
    (
      ?AUTO_79 - BLOCK
      ?AUTO_81 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_75 ?AUTO_79 ) ( CLEAR ?AUTO_75 ) ( HOLDING ?AUTO_76 ) ( CLEAR ?AUTO_81 ) )
    :subtasks
    ( ( !STACK ?AUTO_76 ?AUTO_81 )
      ( MAKE-ON ?AUTO_75 ?AUTO_76 )
      ( MAKE-ON-VERIFY ?AUTO_75 ?AUTO_76 ) )
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
      ?AUTO_89 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_85 ) ( ON ?AUTO_84 ?AUTO_88 ) ( CLEAR ?AUTO_84 ) ( HOLDING ?AUTO_89 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_89 )
      ( MAKE-ON ?AUTO_84 ?AUTO_85 )
      ( MAKE-ON-VERIFY ?AUTO_84 ?AUTO_85 ) )
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
    ( and ( ON ?AUTO_90 ?AUTO_94 ) ( CLEAR ?AUTO_90 ) ( ON ?AUTO_95 ?AUTO_91 ) ( CLEAR ?AUTO_95 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_95 ?AUTO_91 )
      ( MAKE-ON ?AUTO_90 ?AUTO_91 )
      ( MAKE-ON-VERIFY ?AUTO_90 ?AUTO_91 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_98 - BLOCK
      ?AUTO_99 - BLOCK
    )
    :vars
    (
      ?AUTO_103 - BLOCK
      ?AUTO_100 - BLOCK
      ?AUTO_104 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_98 ?AUTO_103 ) ( CLEAR ?AUTO_98 ) ( ON ?AUTO_100 ?AUTO_99 ) ( CLEAR ?AUTO_100 ) ( HOLDING ?AUTO_104 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_104 )
      ( MAKE-ON ?AUTO_98 ?AUTO_99 )
      ( MAKE-ON-VERIFY ?AUTO_98 ?AUTO_99 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_105 - BLOCK
      ?AUTO_106 - BLOCK
    )
    :vars
    (
      ?AUTO_110 - BLOCK
      ?AUTO_109 - BLOCK
      ?AUTO_111 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_105 ?AUTO_110 ) ( CLEAR ?AUTO_105 ) ( ON ?AUTO_109 ?AUTO_106 ) ( ON ?AUTO_111 ?AUTO_109 ) ( CLEAR ?AUTO_111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_111 ?AUTO_109 )
      ( MAKE-ON ?AUTO_105 ?AUTO_106 )
      ( MAKE-ON-VERIFY ?AUTO_105 ?AUTO_106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_572 - BLOCK
      ?AUTO_573 - BLOCK
    )
    :vars
    (
      ?AUTO_576 - BLOCK
      ?AUTO_578 - BLOCK
      ?AUTO_575 - BLOCK
      ?AUTO_579 - BLOCK
      ?AUTO_580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_573 ) ( ON ?AUTO_572 ?AUTO_576 ) ( CLEAR ?AUTO_578 ) ( ON ?AUTO_575 ?AUTO_572 ) ( CLEAR ?AUTO_575 ) ( HOLDING ?AUTO_579 ) ( CLEAR ?AUTO_580 ) )
    :subtasks
    ( ( !STACK ?AUTO_579 ?AUTO_580 )
      ( MAKE-ON ?AUTO_572 ?AUTO_573 )
      ( MAKE-ON-VERIFY ?AUTO_572 ?AUTO_573 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_166 - BLOCK
    )
    :vars
    (
      ?AUTO_168 - BLOCK
      ?AUTO_169 - BLOCK
      ?AUTO_170 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_166 ?AUTO_168 ) ( CLEAR ?AUTO_166 ) ( HOLDING ?AUTO_169 ) ( CLEAR ?AUTO_170 ) )
    :subtasks
    ( ( !STACK ?AUTO_169 ?AUTO_170 )
      ( MAKE-ON-TABLE ?AUTO_166 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_166 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_178 - BLOCK
    )
    :vars
    (
      ?AUTO_182 - BLOCK
      ?AUTO_181 - BLOCK
      ?AUTO_179 - BLOCK
      ?AUTO_184 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_178 ?AUTO_182 ) ( ON ?AUTO_181 ?AUTO_178 ) ( CLEAR ?AUTO_181 ) ( HOLDING ?AUTO_179 ) ( CLEAR ?AUTO_184 ) )
    :subtasks
    ( ( !STACK ?AUTO_179 ?AUTO_184 )
      ( MAKE-ON-TABLE ?AUTO_178 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_178 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_185 - BLOCK
    )
    :vars
    (
      ?AUTO_187 - BLOCK
      ?AUTO_186 - BLOCK
      ?AUTO_188 - BLOCK
      ?AUTO_189 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_185 ?AUTO_187 ) ( ON ?AUTO_186 ?AUTO_185 ) ( CLEAR ?AUTO_188 ) ( ON ?AUTO_189 ?AUTO_186 ) ( CLEAR ?AUTO_189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_189 ?AUTO_186 )
      ( MAKE-ON-TABLE ?AUTO_185 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_185 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_193 - BLOCK
    )
    :vars
    (
      ?AUTO_195 - BLOCK
      ?AUTO_194 - BLOCK
      ?AUTO_198 - BLOCK
      ?AUTO_196 - BLOCK
      ?AUTO_200 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_193 ?AUTO_195 ) ( ON ?AUTO_194 ?AUTO_193 ) ( ON ?AUTO_198 ?AUTO_194 ) ( CLEAR ?AUTO_198 ) ( HOLDING ?AUTO_196 ) ( CLEAR ?AUTO_200 ) )
    :subtasks
    ( ( !STACK ?AUTO_196 ?AUTO_200 )
      ( MAKE-ON-TABLE ?AUTO_193 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_193 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_245 - BLOCK
    )
    :vars
    (
      ?AUTO_250 - BLOCK
      ?AUTO_247 - BLOCK
      ?AUTO_251 - BLOCK
      ?AUTO_249 - BLOCK
      ?AUTO_246 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_245 ?AUTO_250 ) ( ON ?AUTO_247 ?AUTO_245 ) ( ON ?AUTO_251 ?AUTO_247 ) ( CLEAR ?AUTO_249 ) ( ON ?AUTO_246 ?AUTO_251 ) ( CLEAR ?AUTO_246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_246 ?AUTO_251 )
      ( MAKE-ON-TABLE ?AUTO_245 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_245 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_254 - BLOCK
    )
    :vars
    (
      ?AUTO_257 - BLOCK
      ?AUTO_259 - BLOCK
      ?AUTO_256 - BLOCK
      ?AUTO_260 - BLOCK
      ?AUTO_255 - BLOCK
      ?AUTO_262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_254 ?AUTO_257 ) ( ON ?AUTO_259 ?AUTO_254 ) ( ON ?AUTO_256 ?AUTO_259 ) ( ON ?AUTO_260 ?AUTO_256 ) ( CLEAR ?AUTO_260 ) ( HOLDING ?AUTO_255 ) ( CLEAR ?AUTO_262 ) )
    :subtasks
    ( ( !STACK ?AUTO_255 ?AUTO_262 )
      ( MAKE-ON-TABLE ?AUTO_254 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_254 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_274 - BLOCK
      ?AUTO_275 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_275 ) ( ON-TABLE ?AUTO_274 ) ( CLEAR ?AUTO_274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_274 )
      ( MAKE-ON ?AUTO_274 ?AUTO_275 )
      ( MAKE-ON-VERIFY ?AUTO_274 ?AUTO_275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_279 - BLOCK
      ?AUTO_280 - BLOCK
    )
    :vars
    (
      ?AUTO_283 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_280 ) ( ON-TABLE ?AUTO_279 ) ( CLEAR ?AUTO_279 ) ( HOLDING ?AUTO_283 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_283 )
      ( MAKE-ON ?AUTO_279 ?AUTO_280 )
      ( MAKE-ON-VERIFY ?AUTO_279 ?AUTO_280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_284 - BLOCK
      ?AUTO_285 - BLOCK
    )
    :vars
    (
      ?AUTO_288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_285 ) ( ON-TABLE ?AUTO_284 ) ( ON ?AUTO_288 ?AUTO_284 ) ( CLEAR ?AUTO_288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_288 ?AUTO_284 )
      ( MAKE-ON ?AUTO_284 ?AUTO_285 )
      ( MAKE-ON-VERIFY ?AUTO_284 ?AUTO_285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_291 - BLOCK
      ?AUTO_292 - BLOCK
    )
    :vars
    (
      ?AUTO_295 - BLOCK
      ?AUTO_296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_292 ) ( ON-TABLE ?AUTO_291 ) ( ON ?AUTO_295 ?AUTO_291 ) ( CLEAR ?AUTO_295 ) ( HOLDING ?AUTO_296 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_296 )
      ( MAKE-ON ?AUTO_291 ?AUTO_292 )
      ( MAKE-ON-VERIFY ?AUTO_291 ?AUTO_292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_297 - BLOCK
      ?AUTO_298 - BLOCK
    )
    :vars
    (
      ?AUTO_301 - BLOCK
      ?AUTO_302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_298 ) ( ON-TABLE ?AUTO_297 ) ( ON ?AUTO_301 ?AUTO_297 ) ( ON ?AUTO_302 ?AUTO_301 ) ( CLEAR ?AUTO_302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_302 ?AUTO_301 )
      ( MAKE-ON ?AUTO_297 ?AUTO_298 )
      ( MAKE-ON-VERIFY ?AUTO_297 ?AUTO_298 ) )
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
      ?AUTO_310 - BLOCK
      ?AUTO_311 - BLOCK
      ?AUTO_312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_306 ) ( ON-TABLE ?AUTO_305 ) ( ON ?AUTO_309 ?AUTO_305 ) ( ON ?AUTO_310 ?AUTO_309 ) ( CLEAR ?AUTO_310 ) ( HOLDING ?AUTO_311 ) ( CLEAR ?AUTO_312 ) )
    :subtasks
    ( ( !STACK ?AUTO_311 ?AUTO_312 )
      ( MAKE-ON ?AUTO_305 ?AUTO_306 )
      ( MAKE-ON-VERIFY ?AUTO_305 ?AUTO_306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_313 - BLOCK
      ?AUTO_314 - BLOCK
    )
    :vars
    (
      ?AUTO_319 - BLOCK
      ?AUTO_316 - BLOCK
      ?AUTO_318 - BLOCK
      ?AUTO_320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_314 ) ( ON-TABLE ?AUTO_313 ) ( ON ?AUTO_319 ?AUTO_313 ) ( ON ?AUTO_316 ?AUTO_319 ) ( CLEAR ?AUTO_318 ) ( ON ?AUTO_320 ?AUTO_316 ) ( CLEAR ?AUTO_320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_320 ?AUTO_316 )
      ( MAKE-ON ?AUTO_313 ?AUTO_314 )
      ( MAKE-ON-VERIFY ?AUTO_313 ?AUTO_314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_323 - BLOCK
      ?AUTO_324 - BLOCK
    )
    :vars
    (
      ?AUTO_327 - BLOCK
      ?AUTO_326 - BLOCK
      ?AUTO_330 - BLOCK
      ?AUTO_328 - BLOCK
      ?AUTO_332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_324 ) ( ON-TABLE ?AUTO_323 ) ( ON ?AUTO_327 ?AUTO_323 ) ( ON ?AUTO_326 ?AUTO_327 ) ( ON ?AUTO_330 ?AUTO_326 ) ( CLEAR ?AUTO_330 ) ( HOLDING ?AUTO_328 ) ( CLEAR ?AUTO_332 ) )
    :subtasks
    ( ( !STACK ?AUTO_328 ?AUTO_332 )
      ( MAKE-ON ?AUTO_323 ?AUTO_324 )
      ( MAKE-ON-VERIFY ?AUTO_323 ?AUTO_324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_333 - BLOCK
      ?AUTO_334 - BLOCK
    )
    :vars
    (
      ?AUTO_337 - BLOCK
      ?AUTO_340 - BLOCK
      ?AUTO_336 - BLOCK
      ?AUTO_335 - BLOCK
      ?AUTO_338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_334 ) ( ON-TABLE ?AUTO_333 ) ( ON ?AUTO_337 ?AUTO_333 ) ( ON ?AUTO_340 ?AUTO_337 ) ( ON ?AUTO_336 ?AUTO_340 ) ( CLEAR ?AUTO_335 ) ( ON ?AUTO_338 ?AUTO_336 ) ( CLEAR ?AUTO_338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_338 ?AUTO_336 )
      ( MAKE-ON ?AUTO_333 ?AUTO_334 )
      ( MAKE-ON-VERIFY ?AUTO_333 ?AUTO_334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_344 - BLOCK
      ?AUTO_345 - BLOCK
    )
    :vars
    (
      ?AUTO_352 - BLOCK
      ?AUTO_348 - BLOCK
      ?AUTO_346 - BLOCK
      ?AUTO_347 - BLOCK
      ?AUTO_349 - BLOCK
      ?AUTO_354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_345 ) ( ON-TABLE ?AUTO_344 ) ( ON ?AUTO_352 ?AUTO_344 ) ( ON ?AUTO_348 ?AUTO_352 ) ( ON ?AUTO_346 ?AUTO_348 ) ( ON ?AUTO_347 ?AUTO_346 ) ( CLEAR ?AUTO_347 ) ( HOLDING ?AUTO_349 ) ( CLEAR ?AUTO_354 ) )
    :subtasks
    ( ( !STACK ?AUTO_349 ?AUTO_354 )
      ( MAKE-ON ?AUTO_344 ?AUTO_345 )
      ( MAKE-ON-VERIFY ?AUTO_344 ?AUTO_345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_361 - BLOCK
      ?AUTO_362 - BLOCK
    )
    :vars
    (
      ?AUTO_365 - BLOCK
      ?AUTO_363 - BLOCK
      ?AUTO_369 - BLOCK
      ?AUTO_366 - BLOCK
      ?AUTO_367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_361 ) ( ON ?AUTO_365 ?AUTO_361 ) ( ON ?AUTO_363 ?AUTO_365 ) ( ON ?AUTO_369 ?AUTO_363 ) ( CLEAR ?AUTO_366 ) ( ON ?AUTO_367 ?AUTO_369 ) ( CLEAR ?AUTO_367 ) ( HOLDING ?AUTO_362 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_362 )
      ( MAKE-ON ?AUTO_361 ?AUTO_362 )
      ( MAKE-ON-VERIFY ?AUTO_361 ?AUTO_362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_384 - BLOCK
      ?AUTO_385 - BLOCK
    )
    :vars
    (
      ?AUTO_389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_384 ) ( CLEAR ?AUTO_384 ) ( HOLDING ?AUTO_385 ) ( CLEAR ?AUTO_389 ) )
    :subtasks
    ( ( !STACK ?AUTO_385 ?AUTO_389 )
      ( MAKE-ON ?AUTO_384 ?AUTO_385 )
      ( MAKE-ON-VERIFY ?AUTO_384 ?AUTO_385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_394 - BLOCK
      ?AUTO_395 - BLOCK
    )
    :vars
    (
      ?AUTO_398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_394 ) ( CLEAR ?AUTO_394 ) ( ON ?AUTO_398 ?AUTO_395 ) ( CLEAR ?AUTO_398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_398 ?AUTO_395 )
      ( MAKE-ON ?AUTO_394 ?AUTO_395 )
      ( MAKE-ON-VERIFY ?AUTO_394 ?AUTO_395 ) )
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
    )
    :precondition
    ( and ( ON ?AUTO_405 ?AUTO_402 ) ( CLEAR ?AUTO_405 ) ( HOLDING ?AUTO_401 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_401 )
      ( MAKE-ON ?AUTO_401 ?AUTO_402 )
      ( MAKE-ON-VERIFY ?AUTO_401 ?AUTO_402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4453 - BLOCK
      ?AUTO_4454 - BLOCK
    )
    :vars
    (
      ?AUTO_4460 - BLOCK
      ?AUTO_4455 - BLOCK
      ?AUTO_4459 - BLOCK
      ?AUTO_4458 - BLOCK
      ?AUTO_4461 - BLOCK
      ?AUTO_4462 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4453 ?AUTO_4460 ) ( CLEAR ?AUTO_4453 ) ( CLEAR ?AUTO_4455 ) ( ON ?AUTO_4459 ?AUTO_4454 ) ( ON ?AUTO_4458 ?AUTO_4459 ) ( CLEAR ?AUTO_4458 ) ( HOLDING ?AUTO_4461 ) ( CLEAR ?AUTO_4462 ) )
    :subtasks
    ( ( !STACK ?AUTO_4461 ?AUTO_4462 )
      ( MAKE-ON ?AUTO_4453 ?AUTO_4454 )
      ( MAKE-ON-VERIFY ?AUTO_4453 ?AUTO_4454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4490 - BLOCK
      ?AUTO_4491 - BLOCK
    )
    :vars
    (
      ?AUTO_4493 - BLOCK
      ?AUTO_4496 - BLOCK
      ?AUTO_4498 - BLOCK
      ?AUTO_4497 - BLOCK
      ?AUTO_4494 - BLOCK
      ?AUTO_4499 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4490 ?AUTO_4493 ) ( ON ?AUTO_4496 ?AUTO_4491 ) ( ON ?AUTO_4498 ?AUTO_4496 ) ( CLEAR ?AUTO_4497 ) ( ON ?AUTO_4494 ?AUTO_4490 ) ( CLEAR ?AUTO_4494 ) ( ON ?AUTO_4499 ?AUTO_4498 ) ( CLEAR ?AUTO_4499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4499 ?AUTO_4498 )
      ( MAKE-ON ?AUTO_4490 ?AUTO_4491 )
      ( MAKE-ON-VERIFY ?AUTO_4490 ?AUTO_4491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_430 - BLOCK
      ?AUTO_431 - BLOCK
    )
    :vars
    (
      ?AUTO_433 - BLOCK
      ?AUTO_434 - BLOCK
      ?AUTO_436 - BLOCK
      ?AUTO_438 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_433 ?AUTO_431 ) ( ON ?AUTO_430 ?AUTO_433 ) ( ON ?AUTO_434 ?AUTO_430 ) ( CLEAR ?AUTO_434 ) ( HOLDING ?AUTO_436 ) ( CLEAR ?AUTO_438 ) )
    :subtasks
    ( ( !STACK ?AUTO_436 ?AUTO_438 )
      ( MAKE-ON ?AUTO_430 ?AUTO_431 )
      ( MAKE-ON-VERIFY ?AUTO_430 ?AUTO_431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_439 - BLOCK
      ?AUTO_440 - BLOCK
    )
    :vars
    (
      ?AUTO_446 - BLOCK
      ?AUTO_444 - BLOCK
      ?AUTO_441 - BLOCK
      ?AUTO_445 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_446 ?AUTO_440 ) ( ON ?AUTO_439 ?AUTO_446 ) ( ON ?AUTO_444 ?AUTO_439 ) ( CLEAR ?AUTO_441 ) ( ON ?AUTO_445 ?AUTO_444 ) ( CLEAR ?AUTO_445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_445 ?AUTO_444 )
      ( MAKE-ON ?AUTO_439 ?AUTO_440 )
      ( MAKE-ON-VERIFY ?AUTO_439 ?AUTO_440 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_449 - BLOCK
      ?AUTO_450 - BLOCK
    )
    :vars
    (
      ?AUTO_455 - BLOCK
      ?AUTO_453 - BLOCK
      ?AUTO_454 - BLOCK
      ?AUTO_456 - BLOCK
      ?AUTO_458 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_455 ?AUTO_450 ) ( ON ?AUTO_449 ?AUTO_455 ) ( ON ?AUTO_453 ?AUTO_449 ) ( ON ?AUTO_454 ?AUTO_453 ) ( CLEAR ?AUTO_454 ) ( HOLDING ?AUTO_456 ) ( CLEAR ?AUTO_458 ) )
    :subtasks
    ( ( !STACK ?AUTO_456 ?AUTO_458 )
      ( MAKE-ON ?AUTO_449 ?AUTO_450 )
      ( MAKE-ON-VERIFY ?AUTO_449 ?AUTO_450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_481 - BLOCK
      ?AUTO_482 - BLOCK
    )
    :vars
    (
      ?AUTO_483 - BLOCK
      ?AUTO_486 - BLOCK
      ?AUTO_487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_482 ) ( ON ?AUTO_481 ?AUTO_483 ) ( CLEAR ?AUTO_481 ) ( HOLDING ?AUTO_486 ) ( CLEAR ?AUTO_487 ) )
    :subtasks
    ( ( !STACK ?AUTO_486 ?AUTO_487 )
      ( MAKE-ON ?AUTO_481 ?AUTO_482 )
      ( MAKE-ON-VERIFY ?AUTO_481 ?AUTO_482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_561 - BLOCK
      ?AUTO_562 - BLOCK
    )
    :vars
    (
      ?AUTO_563 - BLOCK
      ?AUTO_567 - BLOCK
      ?AUTO_564 - BLOCK
      ?AUTO_569 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_561 ?AUTO_563 ) ( CLEAR ?AUTO_567 ) ( ON ?AUTO_564 ?AUTO_561 ) ( CLEAR ?AUTO_564 ) ( HOLDING ?AUTO_562 ) ( CLEAR ?AUTO_569 ) )
    :subtasks
    ( ( !STACK ?AUTO_562 ?AUTO_569 )
      ( MAKE-ON ?AUTO_561 ?AUTO_562 )
      ( MAKE-ON-VERIFY ?AUTO_561 ?AUTO_562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_832 - BLOCK
      ?AUTO_833 - BLOCK
    )
    :vars
    (
      ?AUTO_835 - BLOCK
      ?AUTO_837 - BLOCK
      ?AUTO_838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_833 ) ( ON-TABLE ?AUTO_832 ) ( ON ?AUTO_835 ?AUTO_832 ) ( CLEAR ?AUTO_835 ) ( HOLDING ?AUTO_837 ) ( CLEAR ?AUTO_838 ) )
    :subtasks
    ( ( !STACK ?AUTO_837 ?AUTO_838 )
      ( MAKE-ON ?AUTO_832 ?AUTO_833 )
      ( MAKE-ON-VERIFY ?AUTO_832 ?AUTO_833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1267 - BLOCK
      ?AUTO_1268 - BLOCK
    )
    :vars
    (
      ?AUTO_1270 - BLOCK
      ?AUTO_1269 - BLOCK
      ?AUTO_1274 - BLOCK
      ?AUTO_1271 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1268 ) ( ON ?AUTO_1267 ?AUTO_1270 ) ( ON ?AUTO_1269 ?AUTO_1267 ) ( CLEAR ?AUTO_1274 ) ( ON ?AUTO_1271 ?AUTO_1269 ) ( CLEAR ?AUTO_1271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1271 ?AUTO_1269 )
      ( MAKE-ON ?AUTO_1267 ?AUTO_1268 )
      ( MAKE-ON-VERIFY ?AUTO_1267 ?AUTO_1268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_978 - BLOCK
      ?AUTO_979 - BLOCK
    )
    :vars
    (
      ?AUTO_982 - BLOCK
      ?AUTO_984 - BLOCK
      ?AUTO_980 - BLOCK
      ?AUTO_986 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_978 ?AUTO_982 ) ( CLEAR ?AUTO_978 ) ( ON ?AUTO_984 ?AUTO_979 ) ( CLEAR ?AUTO_984 ) ( HOLDING ?AUTO_980 ) ( CLEAR ?AUTO_986 ) )
    :subtasks
    ( ( !STACK ?AUTO_980 ?AUTO_986 )
      ( MAKE-ON ?AUTO_978 ?AUTO_979 )
      ( MAKE-ON-VERIFY ?AUTO_978 ?AUTO_979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_987 - BLOCK
      ?AUTO_988 - BLOCK
    )
    :vars
    (
      ?AUTO_992 - BLOCK
      ?AUTO_991 - BLOCK
      ?AUTO_994 - BLOCK
      ?AUTO_989 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_987 ?AUTO_992 ) ( ON ?AUTO_991 ?AUTO_988 ) ( CLEAR ?AUTO_991 ) ( CLEAR ?AUTO_994 ) ( ON ?AUTO_989 ?AUTO_987 ) ( CLEAR ?AUTO_989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_989 ?AUTO_987 )
      ( MAKE-ON ?AUTO_987 ?AUTO_988 )
      ( MAKE-ON-VERIFY ?AUTO_987 ?AUTO_988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_997 - BLOCK
      ?AUTO_998 - BLOCK
    )
    :vars
    (
      ?AUTO_1003 - BLOCK
      ?AUTO_1004 - BLOCK
      ?AUTO_1002 - BLOCK
      ?AUTO_1000 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_997 ?AUTO_1003 ) ( ON ?AUTO_1004 ?AUTO_998 ) ( CLEAR ?AUTO_1004 ) ( ON ?AUTO_1002 ?AUTO_997 ) ( CLEAR ?AUTO_1002 ) ( HOLDING ?AUTO_1000 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1000 )
      ( MAKE-ON ?AUTO_997 ?AUTO_998 )
      ( MAKE-ON-VERIFY ?AUTO_997 ?AUTO_998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1006 - BLOCK
      ?AUTO_1007 - BLOCK
    )
    :vars
    (
      ?AUTO_1013 - BLOCK
      ?AUTO_1009 - BLOCK
      ?AUTO_1012 - BLOCK
      ?AUTO_1008 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1006 ?AUTO_1013 ) ( ON ?AUTO_1009 ?AUTO_1007 ) ( ON ?AUTO_1012 ?AUTO_1006 ) ( CLEAR ?AUTO_1012 ) ( ON ?AUTO_1008 ?AUTO_1009 ) ( CLEAR ?AUTO_1008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1008 ?AUTO_1009 )
      ( MAKE-ON ?AUTO_1006 ?AUTO_1007 )
      ( MAKE-ON-VERIFY ?AUTO_1006 ?AUTO_1007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1026 - BLOCK
      ?AUTO_1027 - BLOCK
    )
    :vars
    (
      ?AUTO_1031 - BLOCK
      ?AUTO_1032 - BLOCK
      ?AUTO_1028 - BLOCK
      ?AUTO_1033 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1026 ?AUTO_1031 ) ( ON ?AUTO_1032 ?AUTO_1027 ) ( ON ?AUTO_1028 ?AUTO_1032 ) ( CLEAR ?AUTO_1026 ) ( ON ?AUTO_1033 ?AUTO_1028 ) ( CLEAR ?AUTO_1033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1033 ?AUTO_1028 )
      ( MAKE-ON ?AUTO_1026 ?AUTO_1027 )
      ( MAKE-ON-VERIFY ?AUTO_1026 ?AUTO_1027 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1047 - BLOCK
      ?AUTO_1048 - BLOCK
    )
    :vars
    (
      ?AUTO_1051 - BLOCK
      ?AUTO_1052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1048 ) ( ON-TABLE ?AUTO_1047 ) ( CLEAR ?AUTO_1047 ) ( HOLDING ?AUTO_1051 ) ( CLEAR ?AUTO_1052 ) )
    :subtasks
    ( ( !STACK ?AUTO_1051 ?AUTO_1052 )
      ( MAKE-ON ?AUTO_1047 ?AUTO_1048 )
      ( MAKE-ON-VERIFY ?AUTO_1047 ?AUTO_1048 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1077 - BLOCK
      ?AUTO_1078 - BLOCK
    )
    :vars
    (
      ?AUTO_1082 - BLOCK
      ?AUTO_1081 - BLOCK
      ?AUTO_1083 - BLOCK
      ?AUTO_1084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1077 ) ( CLEAR ?AUTO_1077 ) ( CLEAR ?AUTO_1082 ) ( ON ?AUTO_1081 ?AUTO_1078 ) ( CLEAR ?AUTO_1081 ) ( HOLDING ?AUTO_1083 ) ( CLEAR ?AUTO_1084 ) )
    :subtasks
    ( ( !STACK ?AUTO_1083 ?AUTO_1084 )
      ( MAKE-ON ?AUTO_1077 ?AUTO_1078 )
      ( MAKE-ON-VERIFY ?AUTO_1077 ?AUTO_1078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1085 - BLOCK
      ?AUTO_1086 - BLOCK
    )
    :vars
    (
      ?AUTO_1089 - BLOCK
      ?AUTO_1091 - BLOCK
      ?AUTO_1092 - BLOCK
      ?AUTO_1088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1085 ) ( CLEAR ?AUTO_1085 ) ( CLEAR ?AUTO_1089 ) ( ON ?AUTO_1091 ?AUTO_1086 ) ( CLEAR ?AUTO_1092 ) ( ON ?AUTO_1088 ?AUTO_1091 ) ( CLEAR ?AUTO_1088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1088 ?AUTO_1091 )
      ( MAKE-ON ?AUTO_1085 ?AUTO_1086 )
      ( MAKE-ON-VERIFY ?AUTO_1085 ?AUTO_1086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1176 - BLOCK
      ?AUTO_1177 - BLOCK
    )
    :vars
    (
      ?AUTO_1178 - BLOCK
      ?AUTO_1181 - BLOCK
      ?AUTO_1183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1176 ) ( CLEAR ?AUTO_1178 ) ( ON ?AUTO_1181 ?AUTO_1176 ) ( CLEAR ?AUTO_1181 ) ( HOLDING ?AUTO_1177 ) ( CLEAR ?AUTO_1183 ) )
    :subtasks
    ( ( !STACK ?AUTO_1177 ?AUTO_1183 )
      ( MAKE-ON ?AUTO_1176 ?AUTO_1177 )
      ( MAKE-ON-VERIFY ?AUTO_1176 ?AUTO_1177 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1218 - BLOCK
    )
    :vars
    (
      ?AUTO_1221 - BLOCK
      ?AUTO_1222 - BLOCK
      ?AUTO_1220 - BLOCK
      ?AUTO_1223 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1218 ?AUTO_1221 ) ( CLEAR ?AUTO_1222 ) ( ON ?AUTO_1220 ?AUTO_1218 ) ( CLEAR ?AUTO_1220 ) ( HOLDING ?AUTO_1223 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1223 )
      ( MAKE-ON-TABLE ?AUTO_1218 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1277 - BLOCK
      ?AUTO_1278 - BLOCK
    )
    :vars
    (
      ?AUTO_1282 - BLOCK
      ?AUTO_1283 - BLOCK
      ?AUTO_1281 - BLOCK
      ?AUTO_1284 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1277 ?AUTO_1282 ) ( ON ?AUTO_1283 ?AUTO_1277 ) ( CLEAR ?AUTO_1281 ) ( ON ?AUTO_1284 ?AUTO_1283 ) ( CLEAR ?AUTO_1284 ) ( HOLDING ?AUTO_1278 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1278 )
      ( MAKE-ON ?AUTO_1277 ?AUTO_1278 )
      ( MAKE-ON-VERIFY ?AUTO_1277 ?AUTO_1278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1459 - BLOCK
      ?AUTO_1460 - BLOCK
    )
    :vars
    (
      ?AUTO_1461 - BLOCK
      ?AUTO_1462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1459 ) ( CLEAR ?AUTO_1461 ) ( ON ?AUTO_1462 ?AUTO_1459 ) ( CLEAR ?AUTO_1462 ) ( HOLDING ?AUTO_1460 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1460 )
      ( MAKE-ON ?AUTO_1459 ?AUTO_1460 )
      ( MAKE-ON-VERIFY ?AUTO_1459 ?AUTO_1460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3991 - BLOCK
      ?AUTO_3992 - BLOCK
    )
    :vars
    (
      ?AUTO_3995 - BLOCK
      ?AUTO_3999 - BLOCK
      ?AUTO_3998 - BLOCK
      ?AUTO_3993 - BLOCK
      ?AUTO_3996 - BLOCK
      ?AUTO_3997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3991 ) ( ON ?AUTO_3995 ?AUTO_3991 ) ( CLEAR ?AUTO_3999 ) ( ON ?AUTO_3998 ?AUTO_3995 ) ( ON ?AUTO_3993 ?AUTO_3998 ) ( CLEAR ?AUTO_3993 ) ( CLEAR ?AUTO_3996 ) ( ON ?AUTO_3997 ?AUTO_3992 ) ( CLEAR ?AUTO_3997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3997 ?AUTO_3992 )
      ( MAKE-ON ?AUTO_3991 ?AUTO_3992 )
      ( MAKE-ON-VERIFY ?AUTO_3991 ?AUTO_3992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4003 - BLOCK
      ?AUTO_4004 - BLOCK
    )
    :vars
    (
      ?AUTO_4011 - BLOCK
      ?AUTO_4009 - BLOCK
      ?AUTO_4010 - BLOCK
      ?AUTO_4008 - BLOCK
      ?AUTO_4012 - BLOCK
      ?AUTO_4007 - BLOCK
      ?AUTO_4013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4003 ) ( ON ?AUTO_4011 ?AUTO_4003 ) ( CLEAR ?AUTO_4009 ) ( ON ?AUTO_4010 ?AUTO_4011 ) ( ON ?AUTO_4008 ?AUTO_4010 ) ( CLEAR ?AUTO_4008 ) ( CLEAR ?AUTO_4012 ) ( ON ?AUTO_4007 ?AUTO_4004 ) ( CLEAR ?AUTO_4007 ) ( HOLDING ?AUTO_4013 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4013 )
      ( MAKE-ON ?AUTO_4003 ?AUTO_4004 )
      ( MAKE-ON-VERIFY ?AUTO_4003 ?AUTO_4004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1602 - BLOCK
      ?AUTO_1603 - BLOCK
    )
    :vars
    (
      ?AUTO_1605 - BLOCK
      ?AUTO_1604 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1602 ?AUTO_1605 ) ( ON ?AUTO_1604 ?AUTO_1602 ) ( CLEAR ?AUTO_1604 ) ( HOLDING ?AUTO_1603 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1603 )
      ( MAKE-ON ?AUTO_1602 ?AUTO_1603 )
      ( MAKE-ON-VERIFY ?AUTO_1602 ?AUTO_1603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1679 - BLOCK
      ?AUTO_1680 - BLOCK
    )
    :vars
    (
      ?AUTO_1685 - BLOCK
      ?AUTO_1684 - BLOCK
      ?AUTO_1686 - BLOCK
      ?AUTO_1682 - BLOCK
      ?AUTO_1687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1680 ) ( ON ?AUTO_1679 ?AUTO_1685 ) ( CLEAR ?AUTO_1684 ) ( ON ?AUTO_1686 ?AUTO_1679 ) ( ON ?AUTO_1682 ?AUTO_1686 ) ( CLEAR ?AUTO_1682 ) ( HOLDING ?AUTO_1687 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1687 )
      ( MAKE-ON ?AUTO_1679 ?AUTO_1680 )
      ( MAKE-ON-VERIFY ?AUTO_1679 ?AUTO_1680 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1699 - BLOCK
      ?AUTO_1700 - BLOCK
    )
    :vars
    (
      ?AUTO_1707 - BLOCK
      ?AUTO_1704 - BLOCK
      ?AUTO_1705 - BLOCK
      ?AUTO_1703 - BLOCK
      ?AUTO_1701 - BLOCK
      ?AUTO_1708 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1699 ?AUTO_1707 ) ( CLEAR ?AUTO_1704 ) ( ON ?AUTO_1705 ?AUTO_1699 ) ( ON ?AUTO_1703 ?AUTO_1705 ) ( CLEAR ?AUTO_1703 ) ( ON ?AUTO_1701 ?AUTO_1700 ) ( CLEAR ?AUTO_1701 ) ( HOLDING ?AUTO_1708 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1708 )
      ( MAKE-ON ?AUTO_1699 ?AUTO_1700 )
      ( MAKE-ON-VERIFY ?AUTO_1699 ?AUTO_1700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1709 - BLOCK
      ?AUTO_1710 - BLOCK
    )
    :vars
    (
      ?AUTO_1711 - BLOCK
      ?AUTO_1717 - BLOCK
      ?AUTO_1716 - BLOCK
      ?AUTO_1712 - BLOCK
      ?AUTO_1718 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1709 ?AUTO_1711 ) ( ON ?AUTO_1717 ?AUTO_1709 ) ( ON ?AUTO_1716 ?AUTO_1717 ) ( ON ?AUTO_1712 ?AUTO_1710 ) ( CLEAR ?AUTO_1712 ) ( ON ?AUTO_1718 ?AUTO_1716 ) ( CLEAR ?AUTO_1718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1718 ?AUTO_1716 )
      ( MAKE-ON ?AUTO_1709 ?AUTO_1710 )
      ( MAKE-ON-VERIFY ?AUTO_1709 ?AUTO_1710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1764 - BLOCK
      ?AUTO_1765 - BLOCK
    )
    :vars
    (
      ?AUTO_1771 - BLOCK
      ?AUTO_1767 - BLOCK
      ?AUTO_1769 - BLOCK
      ?AUTO_1770 - BLOCK
      ?AUTO_1772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1764 ) ( CLEAR ?AUTO_1764 ) ( CLEAR ?AUTO_1771 ) ( ON ?AUTO_1767 ?AUTO_1765 ) ( CLEAR ?AUTO_1769 ) ( ON ?AUTO_1770 ?AUTO_1767 ) ( CLEAR ?AUTO_1770 ) ( HOLDING ?AUTO_1772 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1772 )
      ( MAKE-ON ?AUTO_1764 ?AUTO_1765 )
      ( MAKE-ON-VERIFY ?AUTO_1764 ?AUTO_1765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1773 - BLOCK
      ?AUTO_1774 - BLOCK
    )
    :vars
    (
      ?AUTO_1776 - BLOCK
      ?AUTO_1775 - BLOCK
      ?AUTO_1781 - BLOCK
      ?AUTO_1780 - BLOCK
      ?AUTO_1779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1773 ) ( CLEAR ?AUTO_1773 ) ( CLEAR ?AUTO_1776 ) ( ON ?AUTO_1775 ?AUTO_1774 ) ( CLEAR ?AUTO_1781 ) ( ON ?AUTO_1780 ?AUTO_1775 ) ( ON ?AUTO_1779 ?AUTO_1780 ) ( CLEAR ?AUTO_1779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1779 ?AUTO_1780 )
      ( MAKE-ON ?AUTO_1773 ?AUTO_1774 )
      ( MAKE-ON-VERIFY ?AUTO_1773 ?AUTO_1774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1784 - BLOCK
      ?AUTO_1785 - BLOCK
    )
    :vars
    (
      ?AUTO_1790 - BLOCK
      ?AUTO_1789 - BLOCK
      ?AUTO_1787 - BLOCK
      ?AUTO_1791 - BLOCK
      ?AUTO_1786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1784 ) ( CLEAR ?AUTO_1784 ) ( ON ?AUTO_1790 ?AUTO_1785 ) ( CLEAR ?AUTO_1789 ) ( ON ?AUTO_1787 ?AUTO_1790 ) ( ON ?AUTO_1791 ?AUTO_1787 ) ( CLEAR ?AUTO_1791 ) ( HOLDING ?AUTO_1786 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1786 )
      ( MAKE-ON ?AUTO_1784 ?AUTO_1785 )
      ( MAKE-ON-VERIFY ?AUTO_1784 ?AUTO_1785 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1794 - BLOCK
      ?AUTO_1795 - BLOCK
    )
    :vars
    (
      ?AUTO_1800 - BLOCK
      ?AUTO_1801 - BLOCK
      ?AUTO_1799 - BLOCK
      ?AUTO_1802 - BLOCK
      ?AUTO_1796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1794 ) ( ON ?AUTO_1800 ?AUTO_1795 ) ( CLEAR ?AUTO_1801 ) ( ON ?AUTO_1799 ?AUTO_1800 ) ( ON ?AUTO_1802 ?AUTO_1799 ) ( CLEAR ?AUTO_1802 ) ( ON ?AUTO_1796 ?AUTO_1794 ) ( CLEAR ?AUTO_1796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1796 ?AUTO_1794 )
      ( MAKE-ON ?AUTO_1794 ?AUTO_1795 )
      ( MAKE-ON-VERIFY ?AUTO_1794 ?AUTO_1795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1805 - BLOCK
      ?AUTO_1806 - BLOCK
    )
    :vars
    (
      ?AUTO_1807 - BLOCK
      ?AUTO_1808 - BLOCK
      ?AUTO_1812 - BLOCK
      ?AUTO_1811 - BLOCK
      ?AUTO_1810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1805 ) ( ON ?AUTO_1807 ?AUTO_1806 ) ( ON ?AUTO_1808 ?AUTO_1807 ) ( ON ?AUTO_1812 ?AUTO_1808 ) ( CLEAR ?AUTO_1812 ) ( ON ?AUTO_1811 ?AUTO_1805 ) ( CLEAR ?AUTO_1811 ) ( HOLDING ?AUTO_1810 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1810 )
      ( MAKE-ON ?AUTO_1805 ?AUTO_1806 )
      ( MAKE-ON-VERIFY ?AUTO_1805 ?AUTO_1806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1815 - BLOCK
      ?AUTO_1816 - BLOCK
    )
    :vars
    (
      ?AUTO_1818 - BLOCK
      ?AUTO_1817 - BLOCK
      ?AUTO_1819 - BLOCK
      ?AUTO_1823 - BLOCK
      ?AUTO_1822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1815 ) ( ON ?AUTO_1818 ?AUTO_1816 ) ( ON ?AUTO_1817 ?AUTO_1818 ) ( ON ?AUTO_1819 ?AUTO_1817 ) ( CLEAR ?AUTO_1819 ) ( ON ?AUTO_1823 ?AUTO_1815 ) ( ON ?AUTO_1822 ?AUTO_1823 ) ( CLEAR ?AUTO_1822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1822 ?AUTO_1823 )
      ( MAKE-ON ?AUTO_1815 ?AUTO_1816 )
      ( MAKE-ON-VERIFY ?AUTO_1815 ?AUTO_1816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1826 - BLOCK
      ?AUTO_1827 - BLOCK
    )
    :vars
    (
      ?AUTO_1831 - BLOCK
      ?AUTO_1834 - BLOCK
      ?AUTO_1832 - BLOCK
      ?AUTO_1833 - BLOCK
      ?AUTO_1829 - BLOCK
      ?AUTO_1835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1826 ) ( ON ?AUTO_1831 ?AUTO_1827 ) ( ON ?AUTO_1834 ?AUTO_1831 ) ( ON ?AUTO_1832 ?AUTO_1834 ) ( CLEAR ?AUTO_1832 ) ( ON ?AUTO_1833 ?AUTO_1826 ) ( ON ?AUTO_1829 ?AUTO_1833 ) ( CLEAR ?AUTO_1829 ) ( HOLDING ?AUTO_1835 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1835 )
      ( MAKE-ON ?AUTO_1826 ?AUTO_1827 )
      ( MAKE-ON-VERIFY ?AUTO_1826 ?AUTO_1827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1836 - BLOCK
      ?AUTO_1837 - BLOCK
    )
    :vars
    (
      ?AUTO_1842 - BLOCK
      ?AUTO_1841 - BLOCK
      ?AUTO_1840 - BLOCK
      ?AUTO_1839 - BLOCK
      ?AUTO_1844 - BLOCK
      ?AUTO_1845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1836 ) ( ON ?AUTO_1842 ?AUTO_1837 ) ( ON ?AUTO_1841 ?AUTO_1842 ) ( ON ?AUTO_1840 ?AUTO_1841 ) ( ON ?AUTO_1839 ?AUTO_1836 ) ( ON ?AUTO_1844 ?AUTO_1839 ) ( CLEAR ?AUTO_1844 ) ( ON ?AUTO_1845 ?AUTO_1840 ) ( CLEAR ?AUTO_1845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1845 ?AUTO_1840 )
      ( MAKE-ON ?AUTO_1836 ?AUTO_1837 )
      ( MAKE-ON-VERIFY ?AUTO_1836 ?AUTO_1837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1944 - BLOCK
      ?AUTO_1945 - BLOCK
    )
    :vars
    (
      ?AUTO_1946 - BLOCK
      ?AUTO_1950 - BLOCK
      ?AUTO_1947 - BLOCK
      ?AUTO_1949 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1946 ) ( ON ?AUTO_1950 ?AUTO_1945 ) ( CLEAR ?AUTO_1947 ) ( ON ?AUTO_1949 ?AUTO_1950 ) ( CLEAR ?AUTO_1949 ) ( HOLDING ?AUTO_1944 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1944 )
      ( MAKE-ON ?AUTO_1944 ?AUTO_1945 )
      ( MAKE-ON-VERIFY ?AUTO_1944 ?AUTO_1945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1953 - BLOCK
      ?AUTO_1954 - BLOCK
    )
    :vars
    (
      ?AUTO_1959 - BLOCK
      ?AUTO_1958 - BLOCK
      ?AUTO_1960 - BLOCK
      ?AUTO_1957 - BLOCK
      ?AUTO_1962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1959 ) ( ON ?AUTO_1958 ?AUTO_1954 ) ( CLEAR ?AUTO_1960 ) ( ON ?AUTO_1957 ?AUTO_1958 ) ( CLEAR ?AUTO_1957 ) ( ON ?AUTO_1953 ?AUTO_1962 ) ( CLEAR ?AUTO_1953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1953 ?AUTO_1962 )
      ( MAKE-ON ?AUTO_1953 ?AUTO_1954 )
      ( MAKE-ON-VERIFY ?AUTO_1953 ?AUTO_1954 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1963 - BLOCK
      ?AUTO_1964 - BLOCK
    )
    :vars
    (
      ?AUTO_1968 - BLOCK
      ?AUTO_1965 - BLOCK
      ?AUTO_1969 - BLOCK
      ?AUTO_1970 - BLOCK
      ?AUTO_1971 - BLOCK
      ?AUTO_1972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1968 ) ( ON ?AUTO_1965 ?AUTO_1964 ) ( CLEAR ?AUTO_1969 ) ( ON ?AUTO_1970 ?AUTO_1965 ) ( CLEAR ?AUTO_1970 ) ( ON ?AUTO_1963 ?AUTO_1971 ) ( CLEAR ?AUTO_1963 ) ( HOLDING ?AUTO_1972 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1972 )
      ( MAKE-ON ?AUTO_1963 ?AUTO_1964 )
      ( MAKE-ON-VERIFY ?AUTO_1963 ?AUTO_1964 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2108 - BLOCK
      ?AUTO_2109 - BLOCK
    )
    :vars
    (
      ?AUTO_2114 - BLOCK
      ?AUTO_2112 - BLOCK
      ?AUTO_2110 - BLOCK
      ?AUTO_2115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2109 ) ( ON ?AUTO_2108 ?AUTO_2114 ) ( ON ?AUTO_2112 ?AUTO_2108 ) ( ON ?AUTO_2110 ?AUTO_2112 ) ( ON ?AUTO_2115 ?AUTO_2110 ) ( CLEAR ?AUTO_2115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2115 ?AUTO_2110 )
      ( MAKE-ON ?AUTO_2108 ?AUTO_2109 )
      ( MAKE-ON-VERIFY ?AUTO_2108 ?AUTO_2109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2118 - BLOCK
      ?AUTO_2119 - BLOCK
    )
    :vars
    (
      ?AUTO_2120 - BLOCK
      ?AUTO_2125 - BLOCK
      ?AUTO_2124 - BLOCK
      ?AUTO_2123 - BLOCK
      ?AUTO_2127 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2118 ?AUTO_2120 ) ( ON ?AUTO_2125 ?AUTO_2118 ) ( ON ?AUTO_2124 ?AUTO_2125 ) ( ON ?AUTO_2123 ?AUTO_2124 ) ( CLEAR ?AUTO_2123 ) ( HOLDING ?AUTO_2119 ) ( CLEAR ?AUTO_2127 ) )
    :subtasks
    ( ( !STACK ?AUTO_2119 ?AUTO_2127 )
      ( MAKE-ON ?AUTO_2118 ?AUTO_2119 )
      ( MAKE-ON-VERIFY ?AUTO_2118 ?AUTO_2119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2405 - BLOCK
      ?AUTO_2406 - BLOCK
    )
    :vars
    (
      ?AUTO_2408 - BLOCK
      ?AUTO_2409 - BLOCK
      ?AUTO_2411 - BLOCK
      ?AUTO_2410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2405 ) ( CLEAR ?AUTO_2408 ) ( ON ?AUTO_2409 ?AUTO_2406 ) ( CLEAR ?AUTO_2409 ) ( ON ?AUTO_2411 ?AUTO_2405 ) ( ON ?AUTO_2410 ?AUTO_2411 ) ( CLEAR ?AUTO_2410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2410 ?AUTO_2411 )
      ( MAKE-ON ?AUTO_2405 ?AUTO_2406 )
      ( MAKE-ON-VERIFY ?AUTO_2405 ?AUTO_2406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2168 - BLOCK
      ?AUTO_2169 - BLOCK
    )
    :vars
    (
      ?AUTO_2171 - BLOCK
      ?AUTO_2173 - BLOCK
      ?AUTO_2174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2168 ) ( CLEAR ?AUTO_2171 ) ( ON ?AUTO_2169 ?AUTO_2168 ) ( ON ?AUTO_2173 ?AUTO_2169 ) ( CLEAR ?AUTO_2173 ) ( HOLDING ?AUTO_2174 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2174 )
      ( MAKE-ON ?AUTO_2168 ?AUTO_2169 )
      ( MAKE-ON-VERIFY ?AUTO_2168 ?AUTO_2169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4014 - BLOCK
      ?AUTO_4015 - BLOCK
    )
    :vars
    (
      ?AUTO_4022 - BLOCK
      ?AUTO_4016 - BLOCK
      ?AUTO_4021 - BLOCK
      ?AUTO_4017 - BLOCK
      ?AUTO_4023 - BLOCK
      ?AUTO_4018 - BLOCK
      ?AUTO_4024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4014 ) ( ON ?AUTO_4022 ?AUTO_4014 ) ( CLEAR ?AUTO_4016 ) ( ON ?AUTO_4021 ?AUTO_4022 ) ( ON ?AUTO_4017 ?AUTO_4021 ) ( CLEAR ?AUTO_4017 ) ( CLEAR ?AUTO_4023 ) ( ON ?AUTO_4018 ?AUTO_4015 ) ( ON ?AUTO_4024 ?AUTO_4018 ) ( CLEAR ?AUTO_4024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4024 ?AUTO_4018 )
      ( MAKE-ON ?AUTO_4014 ?AUTO_4015 )
      ( MAKE-ON-VERIFY ?AUTO_4014 ?AUTO_4015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4027 - BLOCK
      ?AUTO_4028 - BLOCK
    )
    :vars
    (
      ?AUTO_4031 - BLOCK
      ?AUTO_4030 - BLOCK
      ?AUTO_4034 - BLOCK
      ?AUTO_4036 - BLOCK
      ?AUTO_4029 - BLOCK
      ?AUTO_4033 - BLOCK
      ?AUTO_4037 - BLOCK
      ?AUTO_4038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4027 ) ( ON ?AUTO_4031 ?AUTO_4027 ) ( CLEAR ?AUTO_4030 ) ( ON ?AUTO_4034 ?AUTO_4031 ) ( ON ?AUTO_4036 ?AUTO_4034 ) ( CLEAR ?AUTO_4036 ) ( CLEAR ?AUTO_4029 ) ( ON ?AUTO_4033 ?AUTO_4028 ) ( ON ?AUTO_4037 ?AUTO_4033 ) ( CLEAR ?AUTO_4037 ) ( HOLDING ?AUTO_4038 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4038 )
      ( MAKE-ON ?AUTO_4027 ?AUTO_4028 )
      ( MAKE-ON-VERIFY ?AUTO_4027 ?AUTO_4028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6630 - BLOCK
      ?AUTO_6631 - BLOCK
    )
    :vars
    (
      ?AUTO_6641 - BLOCK
      ?AUTO_6634 - BLOCK
      ?AUTO_6636 - BLOCK
      ?AUTO_6635 - BLOCK
      ?AUTO_6640 - BLOCK
      ?AUTO_6638 - BLOCK
      ?AUTO_6633 - BLOCK
      ?AUTO_6637 - BLOCK
      ?AUTO_6642 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6630 ) ( CLEAR ?AUTO_6641 ) ( ON ?AUTO_6634 ?AUTO_6631 ) ( ON ?AUTO_6636 ?AUTO_6634 ) ( ON ?AUTO_6635 ?AUTO_6636 ) ( CLEAR ?AUTO_6635 ) ( CLEAR ?AUTO_6640 ) ( ON ?AUTO_6638 ?AUTO_6630 ) ( ON ?AUTO_6633 ?AUTO_6638 ) ( ON ?AUTO_6637 ?AUTO_6633 ) ( ON ?AUTO_6642 ?AUTO_6637 ) ( CLEAR ?AUTO_6642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6642 ?AUTO_6637 )
      ( MAKE-ON ?AUTO_6630 ?AUTO_6631 )
      ( MAKE-ON-VERIFY ?AUTO_6630 ?AUTO_6631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2202 - BLOCK
      ?AUTO_2203 - BLOCK
    )
    :vars
    (
      ?AUTO_2209 - BLOCK
      ?AUTO_2204 - BLOCK
      ?AUTO_2208 - BLOCK
      ?AUTO_2205 - BLOCK
      ?AUTO_2211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2202 ) ( ON ?AUTO_2203 ?AUTO_2202 ) ( ON ?AUTO_2209 ?AUTO_2203 ) ( ON ?AUTO_2204 ?AUTO_2209 ) ( ON ?AUTO_2208 ?AUTO_2204 ) ( CLEAR ?AUTO_2208 ) ( HOLDING ?AUTO_2205 ) ( CLEAR ?AUTO_2211 ) )
    :subtasks
    ( ( !STACK ?AUTO_2205 ?AUTO_2211 )
      ( MAKE-ON ?AUTO_2202 ?AUTO_2203 )
      ( MAKE-ON-VERIFY ?AUTO_2202 ?AUTO_2203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2247 - BLOCK
      ?AUTO_2248 - BLOCK
    )
    :vars
    (
      ?AUTO_2249 - BLOCK
      ?AUTO_2252 - BLOCK
      ?AUTO_2253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2247 ) ( CLEAR ?AUTO_2247 ) ( CLEAR ?AUTO_2249 ) ( ON ?AUTO_2252 ?AUTO_2248 ) ( CLEAR ?AUTO_2252 ) ( HOLDING ?AUTO_2253 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2253 )
      ( MAKE-ON ?AUTO_2247 ?AUTO_2248 )
      ( MAKE-ON-VERIFY ?AUTO_2247 ?AUTO_2248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4647 - BLOCK
      ?AUTO_4648 - BLOCK
    )
    :vars
    (
      ?AUTO_4654 - BLOCK
      ?AUTO_4649 - BLOCK
      ?AUTO_4651 - BLOCK
      ?AUTO_4650 - BLOCK
      ?AUTO_4652 - BLOCK
      ?AUTO_4653 - BLOCK
      ?AUTO_4657 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4647 ?AUTO_4654 ) ( CLEAR ?AUTO_4647 ) ( CLEAR ?AUTO_4649 ) ( ON ?AUTO_4651 ?AUTO_4648 ) ( ON ?AUTO_4650 ?AUTO_4651 ) ( CLEAR ?AUTO_4652 ) ( ON ?AUTO_4653 ?AUTO_4650 ) ( CLEAR ?AUTO_4653 ) ( HOLDING ?AUTO_4657 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4657 )
      ( MAKE-ON ?AUTO_4647 ?AUTO_4648 )
      ( MAKE-ON-VERIFY ?AUTO_4647 ?AUTO_4648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2288 - BLOCK
      ?AUTO_2289 - BLOCK
    )
    :vars
    (
      ?AUTO_2295 - BLOCK
      ?AUTO_2292 - BLOCK
      ?AUTO_2291 - BLOCK
      ?AUTO_2293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2295 ) ( ON ?AUTO_2292 ?AUTO_2289 ) ( ON ?AUTO_2291 ?AUTO_2292 ) ( ON ?AUTO_2288 ?AUTO_2291 ) ( ON ?AUTO_2293 ?AUTO_2288 ) ( CLEAR ?AUTO_2293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2293 ?AUTO_2288 )
      ( MAKE-ON ?AUTO_2288 ?AUTO_2289 )
      ( MAKE-ON-VERIFY ?AUTO_2288 ?AUTO_2289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2298 - BLOCK
      ?AUTO_2299 - BLOCK
    )
    :vars
    (
      ?AUTO_2301 - BLOCK
      ?AUTO_2303 - BLOCK
      ?AUTO_2302 - BLOCK
      ?AUTO_2304 - BLOCK
      ?AUTO_2307 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2301 ?AUTO_2299 ) ( ON ?AUTO_2303 ?AUTO_2301 ) ( ON ?AUTO_2298 ?AUTO_2303 ) ( ON ?AUTO_2302 ?AUTO_2298 ) ( CLEAR ?AUTO_2302 ) ( HOLDING ?AUTO_2304 ) ( CLEAR ?AUTO_2307 ) )
    :subtasks
    ( ( !STACK ?AUTO_2304 ?AUTO_2307 )
      ( MAKE-ON ?AUTO_2298 ?AUTO_2299 )
      ( MAKE-ON-VERIFY ?AUTO_2298 ?AUTO_2299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2388 - BLOCK
      ?AUTO_2389 - BLOCK
    )
    :vars
    (
      ?AUTO_2390 - BLOCK
      ?AUTO_2394 - BLOCK
      ?AUTO_2391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2388 ) ( CLEAR ?AUTO_2390 ) ( ON ?AUTO_2394 ?AUTO_2389 ) ( CLEAR ?AUTO_2394 ) ( ON ?AUTO_2391 ?AUTO_2388 ) ( CLEAR ?AUTO_2391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2391 ?AUTO_2388 )
      ( MAKE-ON ?AUTO_2388 ?AUTO_2389 )
      ( MAKE-ON-VERIFY ?AUTO_2388 ?AUTO_2389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2397 - BLOCK
      ?AUTO_2398 - BLOCK
    )
    :vars
    (
      ?AUTO_2399 - BLOCK
      ?AUTO_2403 - BLOCK
      ?AUTO_2400 - BLOCK
      ?AUTO_2404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2397 ) ( CLEAR ?AUTO_2399 ) ( ON ?AUTO_2403 ?AUTO_2398 ) ( CLEAR ?AUTO_2403 ) ( ON ?AUTO_2400 ?AUTO_2397 ) ( CLEAR ?AUTO_2400 ) ( HOLDING ?AUTO_2404 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2404 )
      ( MAKE-ON ?AUTO_2397 ?AUTO_2398 )
      ( MAKE-ON-VERIFY ?AUTO_2397 ?AUTO_2398 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2522 - BLOCK
    )
    :vars
    (
      ?AUTO_2523 - BLOCK
      ?AUTO_2526 - BLOCK
      ?AUTO_2525 - BLOCK
      ?AUTO_2527 - BLOCK
      ?AUTO_2528 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2522 ?AUTO_2523 ) ( CLEAR ?AUTO_2526 ) ( ON ?AUTO_2525 ?AUTO_2522 ) ( ON ?AUTO_2527 ?AUTO_2525 ) ( CLEAR ?AUTO_2527 ) ( HOLDING ?AUTO_2528 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2528 )
      ( MAKE-ON-TABLE ?AUTO_2522 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2595 - BLOCK
      ?AUTO_2596 - BLOCK
    )
    :vars
    (
      ?AUTO_2602 - BLOCK
      ?AUTO_2597 - BLOCK
      ?AUTO_2600 - BLOCK
      ?AUTO_2599 - BLOCK
      ?AUTO_2603 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2595 ?AUTO_2602 ) ( CLEAR ?AUTO_2597 ) ( ON ?AUTO_2600 ?AUTO_2596 ) ( ON ?AUTO_2599 ?AUTO_2600 ) ( CLEAR ?AUTO_2599 ) ( ON ?AUTO_2603 ?AUTO_2595 ) ( CLEAR ?AUTO_2603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2603 ?AUTO_2595 )
      ( MAKE-ON ?AUTO_2595 ?AUTO_2596 )
      ( MAKE-ON-VERIFY ?AUTO_2595 ?AUTO_2596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2606 - BLOCK
      ?AUTO_2607 - BLOCK
    )
    :vars
    (
      ?AUTO_2612 - BLOCK
      ?AUTO_2610 - BLOCK
      ?AUTO_2611 - BLOCK
      ?AUTO_2614 - BLOCK
      ?AUTO_2613 - BLOCK
      ?AUTO_2615 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2606 ?AUTO_2612 ) ( CLEAR ?AUTO_2610 ) ( ON ?AUTO_2611 ?AUTO_2607 ) ( ON ?AUTO_2614 ?AUTO_2611 ) ( CLEAR ?AUTO_2614 ) ( ON ?AUTO_2613 ?AUTO_2606 ) ( CLEAR ?AUTO_2613 ) ( HOLDING ?AUTO_2615 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2615 )
      ( MAKE-ON ?AUTO_2606 ?AUTO_2607 )
      ( MAKE-ON-VERIFY ?AUTO_2606 ?AUTO_2607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2616 - BLOCK
      ?AUTO_2617 - BLOCK
    )
    :vars
    (
      ?AUTO_2623 - BLOCK
      ?AUTO_2621 - BLOCK
      ?AUTO_2622 - BLOCK
      ?AUTO_2624 - BLOCK
      ?AUTO_2625 - BLOCK
      ?AUTO_2618 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2616 ?AUTO_2623 ) ( CLEAR ?AUTO_2621 ) ( ON ?AUTO_2622 ?AUTO_2617 ) ( ON ?AUTO_2624 ?AUTO_2622 ) ( CLEAR ?AUTO_2624 ) ( ON ?AUTO_2625 ?AUTO_2616 ) ( ON ?AUTO_2618 ?AUTO_2625 ) ( CLEAR ?AUTO_2618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2618 ?AUTO_2625 )
      ( MAKE-ON ?AUTO_2616 ?AUTO_2617 )
      ( MAKE-ON-VERIFY ?AUTO_2616 ?AUTO_2617 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2673 - BLOCK
      ?AUTO_2674 - BLOCK
    )
    :vars
    (
      ?AUTO_2677 - BLOCK
      ?AUTO_2676 - BLOCK
      ?AUTO_2675 - BLOCK
      ?AUTO_2680 - BLOCK
      ?AUTO_2681 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2673 ?AUTO_2677 ) ( ON ?AUTO_2676 ?AUTO_2674 ) ( CLEAR ?AUTO_2676 ) ( ON ?AUTO_2675 ?AUTO_2673 ) ( CLEAR ?AUTO_2675 ) ( HOLDING ?AUTO_2680 ) ( CLEAR ?AUTO_2681 ) )
    :subtasks
    ( ( !STACK ?AUTO_2680 ?AUTO_2681 )
      ( MAKE-ON ?AUTO_2673 ?AUTO_2674 )
      ( MAKE-ON-VERIFY ?AUTO_2673 ?AUTO_2674 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2682 - BLOCK
      ?AUTO_2683 - BLOCK
    )
    :vars
    (
      ?AUTO_2688 - BLOCK
      ?AUTO_2686 - BLOCK
      ?AUTO_2685 - BLOCK
      ?AUTO_2690 - BLOCK
      ?AUTO_2684 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2682 ?AUTO_2688 ) ( ON ?AUTO_2686 ?AUTO_2683 ) ( CLEAR ?AUTO_2686 ) ( ON ?AUTO_2685 ?AUTO_2682 ) ( CLEAR ?AUTO_2690 ) ( ON ?AUTO_2684 ?AUTO_2685 ) ( CLEAR ?AUTO_2684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2684 ?AUTO_2685 )
      ( MAKE-ON ?AUTO_2682 ?AUTO_2683 )
      ( MAKE-ON-VERIFY ?AUTO_2682 ?AUTO_2683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2715 - BLOCK
      ?AUTO_2716 - BLOCK
    )
    :vars
    (
      ?AUTO_2717 - BLOCK
      ?AUTO_2722 - BLOCK
      ?AUTO_2720 - BLOCK
      ?AUTO_2723 - BLOCK
      ?AUTO_2724 - BLOCK
      ?AUTO_2718 - BLOCK
      ?AUTO_2725 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2715 ?AUTO_2717 ) ( ON ?AUTO_2722 ?AUTO_2716 ) ( CLEAR ?AUTO_2722 ) ( ON ?AUTO_2720 ?AUTO_2715 ) ( CLEAR ?AUTO_2723 ) ( ON ?AUTO_2724 ?AUTO_2720 ) ( ON ?AUTO_2718 ?AUTO_2724 ) ( CLEAR ?AUTO_2718 ) ( HOLDING ?AUTO_2725 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2725 )
      ( MAKE-ON ?AUTO_2715 ?AUTO_2716 )
      ( MAKE-ON-VERIFY ?AUTO_2715 ?AUTO_2716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2726 - BLOCK
      ?AUTO_2727 - BLOCK
    )
    :vars
    (
      ?AUTO_2728 - BLOCK
      ?AUTO_2736 - BLOCK
      ?AUTO_2733 - BLOCK
      ?AUTO_2732 - BLOCK
      ?AUTO_2729 - BLOCK
      ?AUTO_2731 - BLOCK
      ?AUTO_2734 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2726 ?AUTO_2728 ) ( ON ?AUTO_2736 ?AUTO_2727 ) ( ON ?AUTO_2733 ?AUTO_2726 ) ( CLEAR ?AUTO_2732 ) ( ON ?AUTO_2729 ?AUTO_2733 ) ( ON ?AUTO_2731 ?AUTO_2729 ) ( CLEAR ?AUTO_2731 ) ( ON ?AUTO_2734 ?AUTO_2736 ) ( CLEAR ?AUTO_2734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2734 ?AUTO_2736 )
      ( MAKE-ON ?AUTO_2726 ?AUTO_2727 )
      ( MAKE-ON-VERIFY ?AUTO_2726 ?AUTO_2727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2739 - BLOCK
      ?AUTO_2740 - BLOCK
    )
    :vars
    (
      ?AUTO_2743 - BLOCK
      ?AUTO_2748 - BLOCK
      ?AUTO_2741 - BLOCK
      ?AUTO_2747 - BLOCK
      ?AUTO_2744 - BLOCK
      ?AUTO_2746 - BLOCK
      ?AUTO_2742 - BLOCK
      ?AUTO_2750 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2739 ?AUTO_2743 ) ( ON ?AUTO_2748 ?AUTO_2740 ) ( ON ?AUTO_2741 ?AUTO_2739 ) ( CLEAR ?AUTO_2747 ) ( ON ?AUTO_2744 ?AUTO_2741 ) ( ON ?AUTO_2746 ?AUTO_2744 ) ( CLEAR ?AUTO_2746 ) ( ON ?AUTO_2742 ?AUTO_2748 ) ( CLEAR ?AUTO_2742 ) ( HOLDING ?AUTO_2750 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2750 )
      ( MAKE-ON ?AUTO_2739 ?AUTO_2740 )
      ( MAKE-ON-VERIFY ?AUTO_2739 ?AUTO_2740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2751 - BLOCK
      ?AUTO_2752 - BLOCK
    )
    :vars
    (
      ?AUTO_2759 - BLOCK
      ?AUTO_2755 - BLOCK
      ?AUTO_2754 - BLOCK
      ?AUTO_2761 - BLOCK
      ?AUTO_2760 - BLOCK
      ?AUTO_2753 - BLOCK
      ?AUTO_2757 - BLOCK
      ?AUTO_2762 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2751 ?AUTO_2759 ) ( ON ?AUTO_2755 ?AUTO_2752 ) ( ON ?AUTO_2754 ?AUTO_2751 ) ( CLEAR ?AUTO_2761 ) ( ON ?AUTO_2760 ?AUTO_2754 ) ( ON ?AUTO_2753 ?AUTO_2760 ) ( CLEAR ?AUTO_2753 ) ( ON ?AUTO_2757 ?AUTO_2755 ) ( ON ?AUTO_2762 ?AUTO_2757 ) ( CLEAR ?AUTO_2762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2762 ?AUTO_2757 )
      ( MAKE-ON ?AUTO_2751 ?AUTO_2752 )
      ( MAKE-ON-VERIFY ?AUTO_2751 ?AUTO_2752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2915 - BLOCK
      ?AUTO_2916 - BLOCK
    )
    :vars
    (
      ?AUTO_2919 - BLOCK
      ?AUTO_2920 - BLOCK
      ?AUTO_2917 - BLOCK
      ?AUTO_2922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2916 ) ( ON-TABLE ?AUTO_2915 ) ( ON ?AUTO_2919 ?AUTO_2915 ) ( CLEAR ?AUTO_2920 ) ( ON ?AUTO_2917 ?AUTO_2919 ) ( CLEAR ?AUTO_2917 ) ( HOLDING ?AUTO_2922 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2922 )
      ( MAKE-ON ?AUTO_2915 ?AUTO_2916 )
      ( MAKE-ON-VERIFY ?AUTO_2915 ?AUTO_2916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2933 - BLOCK
      ?AUTO_2934 - BLOCK
    )
    :vars
    (
      ?AUTO_2935 - BLOCK
      ?AUTO_2940 - BLOCK
      ?AUTO_2937 - BLOCK
      ?AUTO_2936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2934 ) ( ON-TABLE ?AUTO_2933 ) ( ON ?AUTO_2935 ?AUTO_2933 ) ( ON ?AUTO_2940 ?AUTO_2935 ) ( ON ?AUTO_2937 ?AUTO_2940 ) ( CLEAR ?AUTO_2937 ) ( HOLDING ?AUTO_2936 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2936 )
      ( MAKE-ON ?AUTO_2933 ?AUTO_2934 )
      ( MAKE-ON-VERIFY ?AUTO_2933 ?AUTO_2934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2959 - BLOCK
      ?AUTO_2960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2959 ) ( CLEAR ?AUTO_2959 ) ( HOLDING ?AUTO_2960 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2960 )
      ( MAKE-ON ?AUTO_2959 ?AUTO_2960 )
      ( MAKE-ON-VERIFY ?AUTO_2959 ?AUTO_2960 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3224 - BLOCK
      ?AUTO_3225 - BLOCK
    )
    :vars
    (
      ?AUTO_3229 - BLOCK
      ?AUTO_3227 - BLOCK
      ?AUTO_3228 - BLOCK
      ?AUTO_3231 - BLOCK
      ?AUTO_3232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3225 ) ( ON ?AUTO_3224 ?AUTO_3229 ) ( ON ?AUTO_3227 ?AUTO_3224 ) ( ON ?AUTO_3228 ?AUTO_3227 ) ( CLEAR ?AUTO_3228 ) ( HOLDING ?AUTO_3231 ) ( CLEAR ?AUTO_3232 ) )
    :subtasks
    ( ( !STACK ?AUTO_3231 ?AUTO_3232 )
      ( MAKE-ON ?AUTO_3224 ?AUTO_3225 )
      ( MAKE-ON-VERIFY ?AUTO_3224 ?AUTO_3225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3244 - BLOCK
      ?AUTO_3245 - BLOCK
    )
    :vars
    (
      ?AUTO_3248 - BLOCK
      ?AUTO_3247 - BLOCK
      ?AUTO_3246 - BLOCK
      ?AUTO_3252 - BLOCK
      ?AUTO_3249 - BLOCK
      ?AUTO_3254 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3245 ) ( ON ?AUTO_3244 ?AUTO_3248 ) ( ON ?AUTO_3247 ?AUTO_3244 ) ( ON ?AUTO_3246 ?AUTO_3247 ) ( ON ?AUTO_3252 ?AUTO_3246 ) ( CLEAR ?AUTO_3252 ) ( HOLDING ?AUTO_3249 ) ( CLEAR ?AUTO_3254 ) )
    :subtasks
    ( ( !STACK ?AUTO_3249 ?AUTO_3254 )
      ( MAKE-ON ?AUTO_3244 ?AUTO_3245 )
      ( MAKE-ON-VERIFY ?AUTO_3244 ?AUTO_3245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3579 - BLOCK
      ?AUTO_3580 - BLOCK
    )
    :vars
    (
      ?AUTO_3587 - BLOCK
      ?AUTO_3581 - BLOCK
      ?AUTO_3585 - BLOCK
      ?AUTO_3584 - BLOCK
      ?AUTO_3583 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3587 ) ( ON ?AUTO_3581 ?AUTO_3580 ) ( ON ?AUTO_3585 ?AUTO_3581 ) ( ON ?AUTO_3584 ?AUTO_3585 ) ( CLEAR ?AUTO_3584 ) ( HOLDING ?AUTO_3579 ) ( CLEAR ?AUTO_3583 ) )
    :subtasks
    ( ( !STACK ?AUTO_3579 ?AUTO_3583 )
      ( MAKE-ON ?AUTO_3579 ?AUTO_3580 )
      ( MAKE-ON-VERIFY ?AUTO_3579 ?AUTO_3580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5151 - BLOCK
      ?AUTO_5152 - BLOCK
    )
    :vars
    (
      ?AUTO_5158 - BLOCK
      ?AUTO_5155 - BLOCK
      ?AUTO_5157 - BLOCK
      ?AUTO_5153 - BLOCK
      ?AUTO_5159 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5151 ?AUTO_5158 ) ( CLEAR ?AUTO_5151 ) ( ON ?AUTO_5155 ?AUTO_5152 ) ( ON ?AUTO_5157 ?AUTO_5155 ) ( ON ?AUTO_5153 ?AUTO_5157 ) ( ON ?AUTO_5159 ?AUTO_5153 ) ( CLEAR ?AUTO_5159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5159 ?AUTO_5153 )
      ( MAKE-ON ?AUTO_5151 ?AUTO_5152 )
      ( MAKE-ON-VERIFY ?AUTO_5151 ?AUTO_5152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3601 - BLOCK
      ?AUTO_3602 - BLOCK
    )
    :vars
    (
      ?AUTO_3608 - BLOCK
      ?AUTO_3605 - BLOCK
      ?AUTO_3603 - BLOCK
      ?AUTO_3606 - BLOCK
      ?AUTO_3604 - BLOCK
      ?AUTO_3611 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3608 ) ( ON ?AUTO_3605 ?AUTO_3602 ) ( ON ?AUTO_3603 ?AUTO_3605 ) ( ON ?AUTO_3606 ?AUTO_3603 ) ( ON ?AUTO_3601 ?AUTO_3606 ) ( CLEAR ?AUTO_3601 ) ( HOLDING ?AUTO_3604 ) ( CLEAR ?AUTO_3611 ) )
    :subtasks
    ( ( !STACK ?AUTO_3604 ?AUTO_3611 )
      ( MAKE-ON ?AUTO_3601 ?AUTO_3602 )
      ( MAKE-ON-VERIFY ?AUTO_3601 ?AUTO_3602 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3687 - BLOCK
      ?AUTO_3688 - BLOCK
    )
    :vars
    (
      ?AUTO_3689 - BLOCK
      ?AUTO_3690 - BLOCK
      ?AUTO_3693 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3689 ) ( ON ?AUTO_3690 ?AUTO_3688 ) ( CLEAR ?AUTO_3690 ) ( HOLDING ?AUTO_3687 ) ( CLEAR ?AUTO_3693 ) )
    :subtasks
    ( ( !STACK ?AUTO_3687 ?AUTO_3693 )
      ( MAKE-ON ?AUTO_3687 ?AUTO_3688 )
      ( MAKE-ON-VERIFY ?AUTO_3687 ?AUTO_3688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3696 - BLOCK
      ?AUTO_3697 - BLOCK
    )
    :vars
    (
      ?AUTO_3700 - BLOCK
      ?AUTO_3701 - BLOCK
      ?AUTO_3702 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3700 ) ( ON ?AUTO_3701 ?AUTO_3697 ) ( CLEAR ?AUTO_3701 ) ( CLEAR ?AUTO_3702 ) ( ON-TABLE ?AUTO_3696 ) ( CLEAR ?AUTO_3696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3696 )
      ( MAKE-ON ?AUTO_3696 ?AUTO_3697 )
      ( MAKE-ON-VERIFY ?AUTO_3696 ?AUTO_3697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3723 - BLOCK
      ?AUTO_3724 - BLOCK
    )
    :vars
    (
      ?AUTO_3725 - BLOCK
      ?AUTO_3727 - BLOCK
      ?AUTO_3728 - BLOCK
      ?AUTO_3726 - BLOCK
      ?AUTO_3731 - BLOCK
      ?AUTO_3732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3725 ) ( ON ?AUTO_3727 ?AUTO_3724 ) ( CLEAR ?AUTO_3727 ) ( ON-TABLE ?AUTO_3723 ) ( CLEAR ?AUTO_3728 ) ( ON ?AUTO_3726 ?AUTO_3723 ) ( CLEAR ?AUTO_3726 ) ( HOLDING ?AUTO_3731 ) ( CLEAR ?AUTO_3732 ) )
    :subtasks
    ( ( !STACK ?AUTO_3731 ?AUTO_3732 )
      ( MAKE-ON ?AUTO_3723 ?AUTO_3724 )
      ( MAKE-ON-VERIFY ?AUTO_3723 ?AUTO_3724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3929 - BLOCK
      ?AUTO_3930 - BLOCK
    )
    :vars
    (
      ?AUTO_3932 - BLOCK
      ?AUTO_3935 - BLOCK
      ?AUTO_3931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3929 ) ( ON ?AUTO_3932 ?AUTO_3929 ) ( CLEAR ?AUTO_3932 ) ( CLEAR ?AUTO_3935 ) ( ON ?AUTO_3931 ?AUTO_3930 ) ( CLEAR ?AUTO_3931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3931 ?AUTO_3930 )
      ( MAKE-ON ?AUTO_3929 ?AUTO_3930 )
      ( MAKE-ON-VERIFY ?AUTO_3929 ?AUTO_3930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4039 - BLOCK
      ?AUTO_4040 - BLOCK
    )
    :vars
    (
      ?AUTO_4046 - BLOCK
      ?AUTO_4044 - BLOCK
      ?AUTO_4049 - BLOCK
      ?AUTO_4042 - BLOCK
      ?AUTO_4043 - BLOCK
      ?AUTO_4047 - BLOCK
      ?AUTO_4045 - BLOCK
      ?AUTO_4041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4039 ) ( ON ?AUTO_4046 ?AUTO_4039 ) ( CLEAR ?AUTO_4044 ) ( ON ?AUTO_4049 ?AUTO_4046 ) ( ON ?AUTO_4042 ?AUTO_4049 ) ( CLEAR ?AUTO_4042 ) ( CLEAR ?AUTO_4043 ) ( ON ?AUTO_4047 ?AUTO_4040 ) ( ON ?AUTO_4045 ?AUTO_4047 ) ( ON ?AUTO_4041 ?AUTO_4045 ) ( CLEAR ?AUTO_4041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4041 ?AUTO_4045 )
      ( MAKE-ON ?AUTO_4039 ?AUTO_4040 )
      ( MAKE-ON-VERIFY ?AUTO_4039 ?AUTO_4040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4053 - BLOCK
      ?AUTO_4054 - BLOCK
    )
    :vars
    (
      ?AUTO_4062 - BLOCK
      ?AUTO_4060 - BLOCK
      ?AUTO_4059 - BLOCK
      ?AUTO_4056 - BLOCK
      ?AUTO_4063 - BLOCK
      ?AUTO_4061 - BLOCK
      ?AUTO_4057 - BLOCK
      ?AUTO_4064 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4053 ) ( ON ?AUTO_4062 ?AUTO_4053 ) ( CLEAR ?AUTO_4060 ) ( ON ?AUTO_4059 ?AUTO_4062 ) ( CLEAR ?AUTO_4056 ) ( ON ?AUTO_4063 ?AUTO_4054 ) ( ON ?AUTO_4061 ?AUTO_4063 ) ( ON ?AUTO_4057 ?AUTO_4061 ) ( CLEAR ?AUTO_4057 ) ( HOLDING ?AUTO_4064 ) ( CLEAR ?AUTO_4059 ) )
    :subtasks
    ( ( !STACK ?AUTO_4064 ?AUTO_4059 )
      ( MAKE-ON ?AUTO_4053 ?AUTO_4054 )
      ( MAKE-ON-VERIFY ?AUTO_4053 ?AUTO_4054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4081 - BLOCK
      ?AUTO_4082 - BLOCK
    )
    :vars
    (
      ?AUTO_4086 - BLOCK
      ?AUTO_4088 - BLOCK
      ?AUTO_4090 - BLOCK
      ?AUTO_4092 - BLOCK
      ?AUTO_4084 - BLOCK
      ?AUTO_4089 - BLOCK
      ?AUTO_4087 - BLOCK
      ?AUTO_4091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4081 ) ( ON ?AUTO_4086 ?AUTO_4081 ) ( CLEAR ?AUTO_4088 ) ( CLEAR ?AUTO_4090 ) ( ON ?AUTO_4092 ?AUTO_4082 ) ( ON ?AUTO_4084 ?AUTO_4092 ) ( ON ?AUTO_4089 ?AUTO_4084 ) ( ON ?AUTO_4087 ?AUTO_4089 ) ( CLEAR ?AUTO_4087 ) ( HOLDING ?AUTO_4091 ) ( CLEAR ?AUTO_4086 ) )
    :subtasks
    ( ( !STACK ?AUTO_4091 ?AUTO_4086 )
      ( MAKE-ON ?AUTO_4081 ?AUTO_4082 )
      ( MAKE-ON-VERIFY ?AUTO_4081 ?AUTO_4082 ) )
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
      ?AUTO_4105 - BLOCK
      ?AUTO_4098 - BLOCK
      ?AUTO_4106 - BLOCK
      ?AUTO_4100 - BLOCK
      ?AUTO_4102 - BLOCK
      ?AUTO_4104 - BLOCK
      ?AUTO_4097 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4095 ) ( ON ?AUTO_4103 ?AUTO_4095 ) ( CLEAR ?AUTO_4105 ) ( CLEAR ?AUTO_4098 ) ( ON ?AUTO_4106 ?AUTO_4096 ) ( ON ?AUTO_4100 ?AUTO_4106 ) ( ON ?AUTO_4102 ?AUTO_4100 ) ( ON ?AUTO_4104 ?AUTO_4102 ) ( CLEAR ?AUTO_4104 ) ( CLEAR ?AUTO_4103 ) ( ON-TABLE ?AUTO_4097 ) ( CLEAR ?AUTO_4097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4097 )
      ( MAKE-ON ?AUTO_4095 ?AUTO_4096 )
      ( MAKE-ON-VERIFY ?AUTO_4095 ?AUTO_4096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4108 - BLOCK
      ?AUTO_4109 - BLOCK
    )
    :vars
    (
      ?AUTO_4118 - BLOCK
      ?AUTO_4112 - BLOCK
      ?AUTO_4117 - BLOCK
      ?AUTO_4111 - BLOCK
      ?AUTO_4114 - BLOCK
      ?AUTO_4113 - BLOCK
      ?AUTO_4110 - BLOCK
      ?AUTO_4119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4108 ) ( CLEAR ?AUTO_4118 ) ( CLEAR ?AUTO_4112 ) ( ON ?AUTO_4117 ?AUTO_4109 ) ( ON ?AUTO_4111 ?AUTO_4117 ) ( ON ?AUTO_4114 ?AUTO_4111 ) ( ON ?AUTO_4113 ?AUTO_4114 ) ( CLEAR ?AUTO_4113 ) ( ON-TABLE ?AUTO_4110 ) ( CLEAR ?AUTO_4110 ) ( HOLDING ?AUTO_4119 ) ( CLEAR ?AUTO_4108 ) )
    :subtasks
    ( ( !STACK ?AUTO_4119 ?AUTO_4108 )
      ( MAKE-ON ?AUTO_4108 ?AUTO_4109 )
      ( MAKE-ON-VERIFY ?AUTO_4108 ?AUTO_4109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4142 - BLOCK
      ?AUTO_4143 - BLOCK
    )
    :vars
    (
      ?AUTO_4153 - BLOCK
      ?AUTO_4151 - BLOCK
      ?AUTO_4148 - BLOCK
      ?AUTO_4152 - BLOCK
      ?AUTO_4149 - BLOCK
      ?AUTO_4145 - BLOCK
      ?AUTO_4150 - BLOCK
      ?AUTO_4147 - BLOCK
      ?AUTO_4155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4142 ) ( CLEAR ?AUTO_4153 ) ( CLEAR ?AUTO_4151 ) ( ON ?AUTO_4148 ?AUTO_4143 ) ( ON ?AUTO_4152 ?AUTO_4148 ) ( ON ?AUTO_4149 ?AUTO_4152 ) ( ON ?AUTO_4145 ?AUTO_4149 ) ( CLEAR ?AUTO_4145 ) ( ON-TABLE ?AUTO_4150 ) ( CLEAR ?AUTO_4150 ) ( CLEAR ?AUTO_4142 ) ( ON ?AUTO_4147 ?AUTO_4155 ) ( CLEAR ?AUTO_4147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4147 ?AUTO_4155 )
      ( MAKE-ON ?AUTO_4142 ?AUTO_4143 )
      ( MAKE-ON-VERIFY ?AUTO_4142 ?AUTO_4143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4273 - BLOCK
      ?AUTO_4274 - BLOCK
    )
    :vars
    (
      ?AUTO_4277 - BLOCK
      ?AUTO_4275 - BLOCK
      ?AUTO_4279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4273 ) ( ON ?AUTO_4277 ?AUTO_4273 ) ( CLEAR ?AUTO_4277 ) ( ON ?AUTO_4275 ?AUTO_4274 ) ( ON ?AUTO_4279 ?AUTO_4275 ) ( CLEAR ?AUTO_4279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4279 ?AUTO_4275 )
      ( MAKE-ON ?AUTO_4273 ?AUTO_4274 )
      ( MAKE-ON-VERIFY ?AUTO_4273 ?AUTO_4274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4612 - BLOCK
      ?AUTO_4613 - BLOCK
    )
    :vars
    (
      ?AUTO_4615 - BLOCK
      ?AUTO_4614 - BLOCK
      ?AUTO_4616 - BLOCK
      ?AUTO_4619 - BLOCK
      ?AUTO_4620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4612 ) ( CLEAR ?AUTO_4612 ) ( ON ?AUTO_4615 ?AUTO_4613 ) ( CLEAR ?AUTO_4614 ) ( ON ?AUTO_4616 ?AUTO_4615 ) ( CLEAR ?AUTO_4616 ) ( HOLDING ?AUTO_4619 ) ( CLEAR ?AUTO_4620 ) )
    :subtasks
    ( ( !STACK ?AUTO_4619 ?AUTO_4620 )
      ( MAKE-ON ?AUTO_4612 ?AUTO_4613 )
      ( MAKE-ON-VERIFY ?AUTO_4612 ?AUTO_4613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4898 - BLOCK
      ?AUTO_4899 - BLOCK
    )
    :vars
    (
      ?AUTO_4903 - BLOCK
      ?AUTO_4901 - BLOCK
      ?AUTO_4904 - BLOCK
      ?AUTO_4902 - BLOCK
      ?AUTO_4900 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4898 ?AUTO_4903 ) ( ON ?AUTO_4901 ?AUTO_4899 ) ( ON ?AUTO_4904 ?AUTO_4901 ) ( ON ?AUTO_4902 ?AUTO_4904 ) ( CLEAR ?AUTO_4902 ) ( ON ?AUTO_4900 ?AUTO_4898 ) ( CLEAR ?AUTO_4900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4900 ?AUTO_4898 )
      ( MAKE-ON ?AUTO_4898 ?AUTO_4899 )
      ( MAKE-ON-VERIFY ?AUTO_4898 ?AUTO_4899 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4965 - BLOCK
      ?AUTO_4966 - BLOCK
    )
    :vars
    (
      ?AUTO_4971 - BLOCK
      ?AUTO_4969 - BLOCK
      ?AUTO_4967 - BLOCK
      ?AUTO_4972 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4965 ?AUTO_4971 ) ( ON ?AUTO_4969 ?AUTO_4965 ) ( CLEAR ?AUTO_4969 ) ( CLEAR ?AUTO_4967 ) ( ON ?AUTO_4972 ?AUTO_4966 ) ( CLEAR ?AUTO_4972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4972 ?AUTO_4966 )
      ( MAKE-ON ?AUTO_4965 ?AUTO_4966 )
      ( MAKE-ON-VERIFY ?AUTO_4965 ?AUTO_4966 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5116 - BLOCK
      ?AUTO_5117 - BLOCK
    )
    :vars
    (
      ?AUTO_5119 - BLOCK
      ?AUTO_5121 - BLOCK
      ?AUTO_5122 - BLOCK
      ?AUTO_5118 - BLOCK
      ?AUTO_5120 - BLOCK
      ?AUTO_5126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5116 ) ( CLEAR ?AUTO_5116 ) ( ON ?AUTO_5119 ?AUTO_5117 ) ( CLEAR ?AUTO_5121 ) ( ON ?AUTO_5122 ?AUTO_5119 ) ( ON ?AUTO_5118 ?AUTO_5122 ) ( CLEAR ?AUTO_5118 ) ( HOLDING ?AUTO_5120 ) ( CLEAR ?AUTO_5126 ) )
    :subtasks
    ( ( !STACK ?AUTO_5120 ?AUTO_5126 )
      ( MAKE-ON ?AUTO_5116 ?AUTO_5117 )
      ( MAKE-ON-VERIFY ?AUTO_5116 ?AUTO_5117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5137 - BLOCK
      ?AUTO_5138 - BLOCK
    )
    :vars
    (
      ?AUTO_5140 - BLOCK
      ?AUTO_5145 - BLOCK
      ?AUTO_5139 - BLOCK
      ?AUTO_5143 - BLOCK
      ?AUTO_5141 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5140 ?AUTO_5138 ) ( CLEAR ?AUTO_5145 ) ( ON ?AUTO_5139 ?AUTO_5140 ) ( CLEAR ?AUTO_5143 ) ( ON ?AUTO_5141 ?AUTO_5139 ) ( CLEAR ?AUTO_5141 ) ( HOLDING ?AUTO_5137 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5137 )
      ( MAKE-ON ?AUTO_5137 ?AUTO_5138 )
      ( MAKE-ON-VERIFY ?AUTO_5137 ?AUTO_5138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5333 - BLOCK
      ?AUTO_5334 - BLOCK
    )
    :vars
    (
      ?AUTO_5338 - BLOCK
      ?AUTO_5337 - BLOCK
      ?AUTO_5335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5333 ) ( ON ?AUTO_5338 ?AUTO_5333 ) ( CLEAR ?AUTO_5337 ) ( ON ?AUTO_5335 ?AUTO_5338 ) ( CLEAR ?AUTO_5335 ) ( HOLDING ?AUTO_5334 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5334 )
      ( MAKE-ON ?AUTO_5333 ?AUTO_5334 )
      ( MAKE-ON-VERIFY ?AUTO_5333 ?AUTO_5334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5551 - BLOCK
      ?AUTO_5552 - BLOCK
    )
    :vars
    (
      ?AUTO_5554 - BLOCK
      ?AUTO_5558 - BLOCK
      ?AUTO_5557 - BLOCK
      ?AUTO_5553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5551 ) ( ON ?AUTO_5554 ?AUTO_5551 ) ( ON ?AUTO_5558 ?AUTO_5554 ) ( CLEAR ?AUTO_5558 ) ( CLEAR ?AUTO_5557 ) ( ON ?AUTO_5553 ?AUTO_5552 ) ( CLEAR ?AUTO_5553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5553 ?AUTO_5552 )
      ( MAKE-ON ?AUTO_5551 ?AUTO_5552 )
      ( MAKE-ON-VERIFY ?AUTO_5551 ?AUTO_5552 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5648 - BLOCK
      ?AUTO_5649 - BLOCK
    )
    :vars
    (
      ?AUTO_5652 - BLOCK
      ?AUTO_5657 - BLOCK
      ?AUTO_5650 - BLOCK
      ?AUTO_5651 - BLOCK
      ?AUTO_5658 - BLOCK
      ?AUTO_5655 - BLOCK
      ?AUTO_5654 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5652 ?AUTO_5649 ) ( CLEAR ?AUTO_5657 ) ( ON ?AUTO_5650 ?AUTO_5652 ) ( CLEAR ?AUTO_5650 ) ( ON ?AUTO_5648 ?AUTO_5651 ) ( ON ?AUTO_5658 ?AUTO_5648 ) ( ON ?AUTO_5655 ?AUTO_5658 ) ( CLEAR ?AUTO_5655 ) ( HOLDING ?AUTO_5654 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5654 )
      ( MAKE-ON ?AUTO_5648 ?AUTO_5649 )
      ( MAKE-ON-VERIFY ?AUTO_5648 ?AUTO_5649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5660 - BLOCK
      ?AUTO_5661 - BLOCK
    )
    :vars
    (
      ?AUTO_5667 - BLOCK
      ?AUTO_5668 - BLOCK
      ?AUTO_5669 - BLOCK
      ?AUTO_5662 - BLOCK
      ?AUTO_5665 - BLOCK
      ?AUTO_5663 - BLOCK
      ?AUTO_5666 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5667 ?AUTO_5661 ) ( CLEAR ?AUTO_5668 ) ( ON ?AUTO_5669 ?AUTO_5667 ) ( ON ?AUTO_5660 ?AUTO_5662 ) ( ON ?AUTO_5665 ?AUTO_5660 ) ( ON ?AUTO_5663 ?AUTO_5665 ) ( CLEAR ?AUTO_5663 ) ( ON ?AUTO_5666 ?AUTO_5669 ) ( CLEAR ?AUTO_5666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5666 ?AUTO_5669 )
      ( MAKE-ON ?AUTO_5660 ?AUTO_5661 )
      ( MAKE-ON-VERIFY ?AUTO_5660 ?AUTO_5661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6603 - BLOCK
      ?AUTO_6604 - BLOCK
    )
    :vars
    (
      ?AUTO_6606 - BLOCK
      ?AUTO_6608 - BLOCK
      ?AUTO_6611 - BLOCK
      ?AUTO_6607 - BLOCK
      ?AUTO_6605 - BLOCK
      ?AUTO_6612 - BLOCK
      ?AUTO_6613 - BLOCK
      ?AUTO_6614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6603 ) ( CLEAR ?AUTO_6606 ) ( ON ?AUTO_6608 ?AUTO_6604 ) ( ON ?AUTO_6611 ?AUTO_6608 ) ( ON ?AUTO_6607 ?AUTO_6611 ) ( CLEAR ?AUTO_6607 ) ( CLEAR ?AUTO_6605 ) ( ON ?AUTO_6612 ?AUTO_6603 ) ( ON ?AUTO_6613 ?AUTO_6612 ) ( ON ?AUTO_6614 ?AUTO_6613 ) ( CLEAR ?AUTO_6614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6614 ?AUTO_6613 )
      ( MAKE-ON ?AUTO_6603 ?AUTO_6604 )
      ( MAKE-ON-VERIFY ?AUTO_6603 ?AUTO_6604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6617 - BLOCK
      ?AUTO_6618 - BLOCK
    )
    :vars
    (
      ?AUTO_6622 - BLOCK
      ?AUTO_6619 - BLOCK
      ?AUTO_6623 - BLOCK
      ?AUTO_6628 - BLOCK
      ?AUTO_6621 - BLOCK
      ?AUTO_6624 - BLOCK
      ?AUTO_6626 - BLOCK
      ?AUTO_6620 - BLOCK
      ?AUTO_6629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6617 ) ( CLEAR ?AUTO_6622 ) ( ON ?AUTO_6619 ?AUTO_6618 ) ( ON ?AUTO_6623 ?AUTO_6619 ) ( ON ?AUTO_6628 ?AUTO_6623 ) ( CLEAR ?AUTO_6628 ) ( CLEAR ?AUTO_6621 ) ( ON ?AUTO_6624 ?AUTO_6617 ) ( ON ?AUTO_6626 ?AUTO_6624 ) ( ON ?AUTO_6620 ?AUTO_6626 ) ( CLEAR ?AUTO_6620 ) ( HOLDING ?AUTO_6629 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6629 )
      ( MAKE-ON ?AUTO_6617 ?AUTO_6618 )
      ( MAKE-ON-VERIFY ?AUTO_6617 ?AUTO_6618 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6925 - BLOCK
    )
    :vars
    (
      ?AUTO_6928 - BLOCK
      ?AUTO_6929 - BLOCK
      ?AUTO_6930 - BLOCK
      ?AUTO_6926 - BLOCK
      ?AUTO_6931 - BLOCK
      ?AUTO_6932 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6925 ?AUTO_6928 ) ( ON ?AUTO_6929 ?AUTO_6925 ) ( ON ?AUTO_6930 ?AUTO_6929 ) ( CLEAR ?AUTO_6926 ) ( ON ?AUTO_6931 ?AUTO_6930 ) ( CLEAR ?AUTO_6931 ) ( HOLDING ?AUTO_6932 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6932 )
      ( MAKE-ON-TABLE ?AUTO_6925 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6990 - BLOCK
      ?AUTO_6991 - BLOCK
    )
    :vars
    (
      ?AUTO_6992 - BLOCK
      ?AUTO_6993 - BLOCK
      ?AUTO_6996 - BLOCK
      ?AUTO_6997 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6992 ?AUTO_6991 ) ( ON ?AUTO_6993 ?AUTO_6992 ) ( ON ?AUTO_6990 ?AUTO_6993 ) ( CLEAR ?AUTO_6990 ) ( HOLDING ?AUTO_6996 ) ( CLEAR ?AUTO_6997 ) )
    :subtasks
    ( ( !STACK ?AUTO_6996 ?AUTO_6997 )
      ( MAKE-ON ?AUTO_6990 ?AUTO_6991 )
      ( MAKE-ON-VERIFY ?AUTO_6990 ?AUTO_6991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7012 - BLOCK
      ?AUTO_7013 - BLOCK
    )
    :vars
    (
      ?AUTO_7016 - BLOCK
      ?AUTO_7017 - BLOCK
      ?AUTO_7019 - BLOCK
      ?AUTO_7018 - BLOCK
      ?AUTO_7020 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7016 ?AUTO_7013 ) ( ON ?AUTO_7017 ?AUTO_7016 ) ( ON ?AUTO_7012 ?AUTO_7017 ) ( CLEAR ?AUTO_7019 ) ( ON ?AUTO_7018 ?AUTO_7012 ) ( CLEAR ?AUTO_7018 ) ( HOLDING ?AUTO_7020 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7020 )
      ( MAKE-ON ?AUTO_7012 ?AUTO_7013 )
      ( MAKE-ON-VERIFY ?AUTO_7012 ?AUTO_7013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7206 - BLOCK
      ?AUTO_7207 - BLOCK
    )
    :vars
    (
      ?AUTO_7209 - BLOCK
      ?AUTO_7210 - BLOCK
      ?AUTO_7214 - BLOCK
      ?AUTO_7215 - BLOCK
      ?AUTO_7212 - BLOCK
      ?AUTO_7213 - BLOCK
      ?AUTO_7216 - BLOCK
      ?AUTO_7217 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7206 ?AUTO_7209 ) ( CLEAR ?AUTO_7210 ) ( ON ?AUTO_7214 ?AUTO_7206 ) ( CLEAR ?AUTO_7214 ) ( CLEAR ?AUTO_7215 ) ( ON ?AUTO_7212 ?AUTO_7207 ) ( ON ?AUTO_7213 ?AUTO_7212 ) ( CLEAR ?AUTO_7213 ) ( HOLDING ?AUTO_7216 ) ( CLEAR ?AUTO_7217 ) )
    :subtasks
    ( ( !STACK ?AUTO_7216 ?AUTO_7217 )
      ( MAKE-ON ?AUTO_7206 ?AUTO_7207 )
      ( MAKE-ON-VERIFY ?AUTO_7206 ?AUTO_7207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7268 - BLOCK
      ?AUTO_7269 - BLOCK
    )
    :vars
    (
      ?AUTO_7275 - BLOCK
      ?AUTO_7278 - BLOCK
      ?AUTO_7273 - BLOCK
      ?AUTO_7274 - BLOCK
      ?AUTO_7272 - BLOCK
      ?AUTO_7276 - BLOCK
      ?AUTO_7270 - BLOCK
      ?AUTO_7279 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7268 ?AUTO_7275 ) ( CLEAR ?AUTO_7278 ) ( CLEAR ?AUTO_7273 ) ( ON ?AUTO_7274 ?AUTO_7269 ) ( ON ?AUTO_7272 ?AUTO_7274 ) ( ON ?AUTO_7276 ?AUTO_7272 ) ( CLEAR ?AUTO_7276 ) ( ON ?AUTO_7270 ?AUTO_7268 ) ( CLEAR ?AUTO_7270 ) ( HOLDING ?AUTO_7279 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7279 )
      ( MAKE-ON ?AUTO_7268 ?AUTO_7269 )
      ( MAKE-ON-VERIFY ?AUTO_7268 ?AUTO_7269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7280 - BLOCK
      ?AUTO_7281 - BLOCK
    )
    :vars
    (
      ?AUTO_7291 - BLOCK
      ?AUTO_7287 - BLOCK
      ?AUTO_7289 - BLOCK
      ?AUTO_7283 - BLOCK
      ?AUTO_7290 - BLOCK
      ?AUTO_7284 - BLOCK
      ?AUTO_7286 - BLOCK
      ?AUTO_7288 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7280 ?AUTO_7291 ) ( CLEAR ?AUTO_7287 ) ( CLEAR ?AUTO_7289 ) ( ON ?AUTO_7283 ?AUTO_7281 ) ( ON ?AUTO_7290 ?AUTO_7283 ) ( ON ?AUTO_7284 ?AUTO_7290 ) ( CLEAR ?AUTO_7284 ) ( ON ?AUTO_7286 ?AUTO_7280 ) ( ON ?AUTO_7288 ?AUTO_7286 ) ( CLEAR ?AUTO_7288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7288 ?AUTO_7286 )
      ( MAKE-ON ?AUTO_7280 ?AUTO_7281 )
      ( MAKE-ON-VERIFY ?AUTO_7280 ?AUTO_7281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7294 - BLOCK
      ?AUTO_7295 - BLOCK
    )
    :vars
    (
      ?AUTO_7298 - BLOCK
      ?AUTO_7297 - BLOCK
      ?AUTO_7301 - BLOCK
      ?AUTO_7296 - BLOCK
      ?AUTO_7303 - BLOCK
      ?AUTO_7304 - BLOCK
      ?AUTO_7305 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7294 ?AUTO_7298 ) ( ON ?AUTO_7297 ?AUTO_7295 ) ( ON ?AUTO_7301 ?AUTO_7297 ) ( ON ?AUTO_7296 ?AUTO_7301 ) ( CLEAR ?AUTO_7296 ) ( ON ?AUTO_7303 ?AUTO_7294 ) ( ON ?AUTO_7304 ?AUTO_7303 ) ( CLEAR ?AUTO_7304 ) ( HOLDING ?AUTO_7305 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7305 )
      ( MAKE-ON ?AUTO_7294 ?AUTO_7295 )
      ( MAKE-ON-VERIFY ?AUTO_7294 ?AUTO_7295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7307 - BLOCK
      ?AUTO_7308 - BLOCK
    )
    :vars
    (
      ?AUTO_7312 - BLOCK
      ?AUTO_7313 - BLOCK
      ?AUTO_7311 - BLOCK
      ?AUTO_7310 - BLOCK
      ?AUTO_7317 - BLOCK
      ?AUTO_7314 - BLOCK
      ?AUTO_7315 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7307 ?AUTO_7312 ) ( ON ?AUTO_7313 ?AUTO_7308 ) ( ON ?AUTO_7311 ?AUTO_7313 ) ( ON ?AUTO_7310 ?AUTO_7311 ) ( CLEAR ?AUTO_7310 ) ( ON ?AUTO_7317 ?AUTO_7307 ) ( ON ?AUTO_7314 ?AUTO_7317 ) ( ON ?AUTO_7315 ?AUTO_7314 ) ( CLEAR ?AUTO_7315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7315 ?AUTO_7314 )
      ( MAKE-ON ?AUTO_7307 ?AUTO_7308 )
      ( MAKE-ON-VERIFY ?AUTO_7307 ?AUTO_7308 ) )
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
      ?AUTO_7594 - BLOCK
      ?AUTO_7595 - BLOCK
      ?AUTO_7592 - BLOCK
      ?AUTO_7590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7587 ) ( CLEAR ?AUTO_7589 ) ( ON ?AUTO_7594 ?AUTO_7588 ) ( CLEAR ?AUTO_7595 ) ( ON ?AUTO_7592 ?AUTO_7594 ) ( CLEAR ?AUTO_7592 ) ( CLEAR ?AUTO_7587 ) ( ON-TABLE ?AUTO_7590 ) ( CLEAR ?AUTO_7590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7590 )
      ( MAKE-ON ?AUTO_7587 ?AUTO_7588 )
      ( MAKE-ON-VERIFY ?AUTO_7587 ?AUTO_7588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7601 - BLOCK
      ?AUTO_7602 - BLOCK
    )
    :vars
    (
      ?AUTO_7606 - BLOCK
      ?AUTO_7609 - BLOCK
      ?AUTO_7605 - BLOCK
      ?AUTO_7603 - BLOCK
      ?AUTO_7608 - BLOCK
      ?AUTO_7610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7601 ) ( ON ?AUTO_7606 ?AUTO_7601 ) ( CLEAR ?AUTO_7606 ) ( CLEAR ?AUTO_7609 ) ( ON ?AUTO_7605 ?AUTO_7602 ) ( CLEAR ?AUTO_7603 ) ( ON ?AUTO_7608 ?AUTO_7605 ) ( CLEAR ?AUTO_7608 ) ( HOLDING ?AUTO_7610 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7610 )
      ( MAKE-ON ?AUTO_7601 ?AUTO_7602 )
      ( MAKE-ON-VERIFY ?AUTO_7601 ?AUTO_7602 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7611 - BLOCK
      ?AUTO_7612 - BLOCK
    )
    :vars
    (
      ?AUTO_7619 - BLOCK
      ?AUTO_7616 - BLOCK
      ?AUTO_7617 - BLOCK
      ?AUTO_7615 - BLOCK
      ?AUTO_7614 - BLOCK
      ?AUTO_7620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7611 ) ( ON ?AUTO_7619 ?AUTO_7611 ) ( CLEAR ?AUTO_7616 ) ( ON ?AUTO_7617 ?AUTO_7612 ) ( CLEAR ?AUTO_7615 ) ( ON ?AUTO_7614 ?AUTO_7617 ) ( CLEAR ?AUTO_7614 ) ( ON ?AUTO_7620 ?AUTO_7619 ) ( CLEAR ?AUTO_7620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7620 ?AUTO_7619 )
      ( MAKE-ON ?AUTO_7611 ?AUTO_7612 )
      ( MAKE-ON-VERIFY ?AUTO_7611 ?AUTO_7612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7623 - BLOCK
      ?AUTO_7624 - BLOCK
    )
    :vars
    (
      ?AUTO_7631 - BLOCK
      ?AUTO_7626 - BLOCK
      ?AUTO_7627 - BLOCK
      ?AUTO_7630 - BLOCK
      ?AUTO_7625 - BLOCK
      ?AUTO_7629 - BLOCK
      ?AUTO_7633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7623 ) ( ON ?AUTO_7631 ?AUTO_7623 ) ( CLEAR ?AUTO_7626 ) ( ON ?AUTO_7627 ?AUTO_7624 ) ( CLEAR ?AUTO_7630 ) ( ON ?AUTO_7625 ?AUTO_7627 ) ( CLEAR ?AUTO_7625 ) ( ON ?AUTO_7629 ?AUTO_7631 ) ( CLEAR ?AUTO_7629 ) ( HOLDING ?AUTO_7633 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7633 )
      ( MAKE-ON ?AUTO_7623 ?AUTO_7624 )
      ( MAKE-ON-VERIFY ?AUTO_7623 ?AUTO_7624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7634 - BLOCK
      ?AUTO_7635 - BLOCK
    )
    :vars
    (
      ?AUTO_7642 - BLOCK
      ?AUTO_7637 - BLOCK
      ?AUTO_7640 - BLOCK
      ?AUTO_7643 - BLOCK
      ?AUTO_7636 - BLOCK
      ?AUTO_7641 - BLOCK
      ?AUTO_7644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7634 ) ( ON ?AUTO_7642 ?AUTO_7634 ) ( CLEAR ?AUTO_7637 ) ( ON ?AUTO_7640 ?AUTO_7635 ) ( CLEAR ?AUTO_7643 ) ( ON ?AUTO_7636 ?AUTO_7640 ) ( CLEAR ?AUTO_7636 ) ( ON ?AUTO_7641 ?AUTO_7642 ) ( ON ?AUTO_7644 ?AUTO_7641 ) ( CLEAR ?AUTO_7644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7644 ?AUTO_7641 )
      ( MAKE-ON ?AUTO_7634 ?AUTO_7635 )
      ( MAKE-ON-VERIFY ?AUTO_7634 ?AUTO_7635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7647 - BLOCK
      ?AUTO_7648 - BLOCK
    )
    :vars
    (
      ?AUTO_7651 - BLOCK
      ?AUTO_7652 - BLOCK
      ?AUTO_7653 - BLOCK
      ?AUTO_7656 - BLOCK
      ?AUTO_7649 - BLOCK
      ?AUTO_7655 - BLOCK
      ?AUTO_7657 - BLOCK
      ?AUTO_7658 - BLOCK
      ?AUTO_7659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7647 ) ( ON ?AUTO_7651 ?AUTO_7647 ) ( CLEAR ?AUTO_7652 ) ( ON ?AUTO_7653 ?AUTO_7648 ) ( CLEAR ?AUTO_7656 ) ( ON ?AUTO_7649 ?AUTO_7653 ) ( CLEAR ?AUTO_7649 ) ( ON ?AUTO_7655 ?AUTO_7651 ) ( ON ?AUTO_7657 ?AUTO_7655 ) ( CLEAR ?AUTO_7657 ) ( HOLDING ?AUTO_7658 ) ( CLEAR ?AUTO_7659 ) )
    :subtasks
    ( ( !STACK ?AUTO_7658 ?AUTO_7659 )
      ( MAKE-ON ?AUTO_7647 ?AUTO_7648 )
      ( MAKE-ON-VERIFY ?AUTO_7647 ?AUTO_7648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7662 - BLOCK
      ?AUTO_7663 - BLOCK
    )
    :vars
    (
      ?AUTO_7666 - BLOCK
      ?AUTO_7671 - BLOCK
      ?AUTO_7664 - BLOCK
      ?AUTO_7669 - BLOCK
      ?AUTO_7667 - BLOCK
      ?AUTO_7665 - BLOCK
      ?AUTO_7670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7662 ) ( ON ?AUTO_7666 ?AUTO_7662 ) ( CLEAR ?AUTO_7671 ) ( ON ?AUTO_7664 ?AUTO_7663 ) ( CLEAR ?AUTO_7669 ) ( ON ?AUTO_7667 ?AUTO_7666 ) ( ON ?AUTO_7665 ?AUTO_7667 ) ( CLEAR ?AUTO_7665 ) ( HOLDING ?AUTO_7670 ) ( CLEAR ?AUTO_7664 ) )
    :subtasks
    ( ( !STACK ?AUTO_7670 ?AUTO_7664 )
      ( MAKE-ON ?AUTO_7662 ?AUTO_7663 )
      ( MAKE-ON-VERIFY ?AUTO_7662 ?AUTO_7663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7675 - BLOCK
      ?AUTO_7676 - BLOCK
    )
    :vars
    (
      ?AUTO_7680 - BLOCK
      ?AUTO_7685 - BLOCK
      ?AUTO_7683 - BLOCK
      ?AUTO_7681 - BLOCK
      ?AUTO_7679 - BLOCK
      ?AUTO_7684 - BLOCK
      ?AUTO_7682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7675 ) ( ON ?AUTO_7680 ?AUTO_7675 ) ( CLEAR ?AUTO_7685 ) ( ON ?AUTO_7683 ?AUTO_7676 ) ( CLEAR ?AUTO_7681 ) ( ON ?AUTO_7679 ?AUTO_7680 ) ( ON ?AUTO_7684 ?AUTO_7679 ) ( CLEAR ?AUTO_7683 ) ( ON ?AUTO_7682 ?AUTO_7684 ) ( CLEAR ?AUTO_7682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7682 ?AUTO_7684 )
      ( MAKE-ON ?AUTO_7675 ?AUTO_7676 )
      ( MAKE-ON-VERIFY ?AUTO_7675 ?AUTO_7676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7688 - BLOCK
      ?AUTO_7689 - BLOCK
    )
    :vars
    (
      ?AUTO_7691 - BLOCK
      ?AUTO_7694 - BLOCK
      ?AUTO_7695 - BLOCK
      ?AUTO_7690 - BLOCK
      ?AUTO_7692 - BLOCK
      ?AUTO_7696 - BLOCK
      ?AUTO_7693 - BLOCK
      ?AUTO_7699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7688 ) ( ON ?AUTO_7691 ?AUTO_7688 ) ( CLEAR ?AUTO_7694 ) ( ON ?AUTO_7695 ?AUTO_7689 ) ( CLEAR ?AUTO_7690 ) ( ON ?AUTO_7692 ?AUTO_7691 ) ( ON ?AUTO_7696 ?AUTO_7692 ) ( CLEAR ?AUTO_7695 ) ( ON ?AUTO_7693 ?AUTO_7696 ) ( CLEAR ?AUTO_7693 ) ( HOLDING ?AUTO_7699 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7699 )
      ( MAKE-ON ?AUTO_7688 ?AUTO_7689 )
      ( MAKE-ON-VERIFY ?AUTO_7688 ?AUTO_7689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7700 - BLOCK
      ?AUTO_7701 - BLOCK
    )
    :vars
    (
      ?AUTO_7703 - BLOCK
      ?AUTO_7706 - BLOCK
      ?AUTO_7707 - BLOCK
      ?AUTO_7710 - BLOCK
      ?AUTO_7702 - BLOCK
      ?AUTO_7709 - BLOCK
      ?AUTO_7708 - BLOCK
      ?AUTO_7711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7700 ) ( ON ?AUTO_7703 ?AUTO_7700 ) ( CLEAR ?AUTO_7706 ) ( ON ?AUTO_7707 ?AUTO_7701 ) ( CLEAR ?AUTO_7710 ) ( ON ?AUTO_7702 ?AUTO_7703 ) ( ON ?AUTO_7709 ?AUTO_7702 ) ( ON ?AUTO_7708 ?AUTO_7709 ) ( CLEAR ?AUTO_7708 ) ( ON ?AUTO_7711 ?AUTO_7707 ) ( CLEAR ?AUTO_7711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7711 ?AUTO_7707 )
      ( MAKE-ON ?AUTO_7700 ?AUTO_7701 )
      ( MAKE-ON-VERIFY ?AUTO_7700 ?AUTO_7701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7714 - BLOCK
      ?AUTO_7715 - BLOCK
    )
    :vars
    (
      ?AUTO_7718 - BLOCK
      ?AUTO_7719 - BLOCK
      ?AUTO_7725 - BLOCK
      ?AUTO_7723 - BLOCK
      ?AUTO_7717 - BLOCK
      ?AUTO_7720 - BLOCK
      ?AUTO_7722 - BLOCK
      ?AUTO_7724 - BLOCK
      ?AUTO_7726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7714 ) ( ON ?AUTO_7718 ?AUTO_7714 ) ( CLEAR ?AUTO_7719 ) ( ON ?AUTO_7725 ?AUTO_7715 ) ( CLEAR ?AUTO_7723 ) ( ON ?AUTO_7717 ?AUTO_7718 ) ( ON ?AUTO_7720 ?AUTO_7717 ) ( ON ?AUTO_7722 ?AUTO_7720 ) ( CLEAR ?AUTO_7722 ) ( ON ?AUTO_7724 ?AUTO_7725 ) ( CLEAR ?AUTO_7724 ) ( HOLDING ?AUTO_7726 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7726 )
      ( MAKE-ON ?AUTO_7714 ?AUTO_7715 )
      ( MAKE-ON-VERIFY ?AUTO_7714 ?AUTO_7715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7727 - BLOCK
      ?AUTO_7728 - BLOCK
    )
    :vars
    (
      ?AUTO_7734 - BLOCK
      ?AUTO_7730 - BLOCK
      ?AUTO_7737 - BLOCK
      ?AUTO_7731 - BLOCK
      ?AUTO_7732 - BLOCK
      ?AUTO_7729 - BLOCK
      ?AUTO_7738 - BLOCK
      ?AUTO_7735 - BLOCK
      ?AUTO_7739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7727 ) ( ON ?AUTO_7734 ?AUTO_7727 ) ( CLEAR ?AUTO_7730 ) ( ON ?AUTO_7737 ?AUTO_7728 ) ( CLEAR ?AUTO_7731 ) ( ON ?AUTO_7732 ?AUTO_7734 ) ( ON ?AUTO_7729 ?AUTO_7732 ) ( ON ?AUTO_7738 ?AUTO_7729 ) ( CLEAR ?AUTO_7738 ) ( ON ?AUTO_7735 ?AUTO_7737 ) ( ON ?AUTO_7739 ?AUTO_7735 ) ( CLEAR ?AUTO_7739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7739 ?AUTO_7735 )
      ( MAKE-ON ?AUTO_7727 ?AUTO_7728 )
      ( MAKE-ON-VERIFY ?AUTO_7727 ?AUTO_7728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7742 - BLOCK
      ?AUTO_7743 - BLOCK
    )
    :vars
    (
      ?AUTO_7746 - BLOCK
      ?AUTO_7752 - BLOCK
      ?AUTO_7747 - BLOCK
      ?AUTO_7753 - BLOCK
      ?AUTO_7750 - BLOCK
      ?AUTO_7749 - BLOCK
      ?AUTO_7745 - BLOCK
      ?AUTO_7754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7742 ) ( ON ?AUTO_7746 ?AUTO_7742 ) ( ON ?AUTO_7752 ?AUTO_7743 ) ( ON ?AUTO_7747 ?AUTO_7746 ) ( ON ?AUTO_7753 ?AUTO_7747 ) ( ON ?AUTO_7750 ?AUTO_7753 ) ( CLEAR ?AUTO_7750 ) ( ON ?AUTO_7749 ?AUTO_7752 ) ( ON ?AUTO_7745 ?AUTO_7749 ) ( CLEAR ?AUTO_7745 ) ( HOLDING ?AUTO_7754 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7754 )
      ( MAKE-ON ?AUTO_7742 ?AUTO_7743 )
      ( MAKE-ON-VERIFY ?AUTO_7742 ?AUTO_7743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7756 - BLOCK
      ?AUTO_7757 - BLOCK
    )
    :vars
    (
      ?AUTO_7764 - BLOCK
      ?AUTO_7767 - BLOCK
      ?AUTO_7762 - BLOCK
      ?AUTO_7760 - BLOCK
      ?AUTO_7759 - BLOCK
      ?AUTO_7761 - BLOCK
      ?AUTO_7758 - BLOCK
      ?AUTO_7766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7756 ) ( ON ?AUTO_7764 ?AUTO_7756 ) ( ON ?AUTO_7767 ?AUTO_7757 ) ( ON ?AUTO_7762 ?AUTO_7764 ) ( ON ?AUTO_7760 ?AUTO_7762 ) ( ON ?AUTO_7759 ?AUTO_7760 ) ( CLEAR ?AUTO_7759 ) ( ON ?AUTO_7761 ?AUTO_7767 ) ( ON ?AUTO_7758 ?AUTO_7761 ) ( ON ?AUTO_7766 ?AUTO_7758 ) ( CLEAR ?AUTO_7766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7766 ?AUTO_7758 )
      ( MAKE-ON ?AUTO_7756 ?AUTO_7757 )
      ( MAKE-ON-VERIFY ?AUTO_7756 ?AUTO_7757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8216 - BLOCK
      ?AUTO_8217 - BLOCK
    )
    :vars
    (
      ?AUTO_8220 - BLOCK
      ?AUTO_8221 - BLOCK
      ?AUTO_8223 - BLOCK
      ?AUTO_8222 - BLOCK
      ?AUTO_8225 - BLOCK
      ?AUTO_8219 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8216 ?AUTO_8220 ) ( ON ?AUTO_8221 ?AUTO_8217 ) ( ON ?AUTO_8223 ?AUTO_8221 ) ( CLEAR ?AUTO_8223 ) ( ON ?AUTO_8222 ?AUTO_8216 ) ( ON ?AUTO_8225 ?AUTO_8222 ) ( ON ?AUTO_8219 ?AUTO_8225 ) ( CLEAR ?AUTO_8219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8219 ?AUTO_8225 )
      ( MAKE-ON ?AUTO_8216 ?AUTO_8217 )
      ( MAKE-ON-VERIFY ?AUTO_8216 ?AUTO_8217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8433 - BLOCK
      ?AUTO_8434 - BLOCK
    )
    :vars
    (
      ?AUTO_8437 - BLOCK
      ?AUTO_8439 - BLOCK
      ?AUTO_8438 - BLOCK
      ?AUTO_8435 - BLOCK
      ?AUTO_8442 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8433 ?AUTO_8437 ) ( ON ?AUTO_8439 ?AUTO_8433 ) ( CLEAR ?AUTO_8438 ) ( ON ?AUTO_8435 ?AUTO_8439 ) ( CLEAR ?AUTO_8435 ) ( HOLDING ?AUTO_8434 ) ( CLEAR ?AUTO_8442 ) )
    :subtasks
    ( ( !STACK ?AUTO_8434 ?AUTO_8442 )
      ( MAKE-ON ?AUTO_8433 ?AUTO_8434 )
      ( MAKE-ON-VERIFY ?AUTO_8433 ?AUTO_8434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8515 - BLOCK
      ?AUTO_8516 - BLOCK
    )
    :vars
    (
      ?AUTO_8520 - BLOCK
      ?AUTO_8518 - BLOCK
      ?AUTO_8522 - BLOCK
      ?AUTO_8521 - BLOCK
      ?AUTO_8523 - BLOCK
      ?AUTO_8524 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8515 ?AUTO_8520 ) ( ON ?AUTO_8518 ?AUTO_8515 ) ( CLEAR ?AUTO_8522 ) ( ON ?AUTO_8521 ?AUTO_8518 ) ( CLEAR ?AUTO_8516 ) ( ON ?AUTO_8523 ?AUTO_8521 ) ( CLEAR ?AUTO_8523 ) ( HOLDING ?AUTO_8524 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8524 )
      ( MAKE-ON ?AUTO_8515 ?AUTO_8516 )
      ( MAKE-ON-VERIFY ?AUTO_8515 ?AUTO_8516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8525 - BLOCK
      ?AUTO_8526 - BLOCK
    )
    :vars
    (
      ?AUTO_8528 - BLOCK
      ?AUTO_8529 - BLOCK
      ?AUTO_8531 - BLOCK
      ?AUTO_8530 - BLOCK
      ?AUTO_8532 - BLOCK
      ?AUTO_8527 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8525 ?AUTO_8528 ) ( ON ?AUTO_8529 ?AUTO_8525 ) ( CLEAR ?AUTO_8531 ) ( ON ?AUTO_8530 ?AUTO_8529 ) ( ON ?AUTO_8532 ?AUTO_8530 ) ( CLEAR ?AUTO_8532 ) ( ON ?AUTO_8527 ?AUTO_8526 ) ( CLEAR ?AUTO_8527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8527 ?AUTO_8526 )
      ( MAKE-ON ?AUTO_8525 ?AUTO_8526 )
      ( MAKE-ON-VERIFY ?AUTO_8525 ?AUTO_8526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8690 - BLOCK
      ?AUTO_8691 - BLOCK
    )
    :vars
    (
      ?AUTO_8697 - BLOCK
      ?AUTO_8696 - BLOCK
      ?AUTO_8695 - BLOCK
      ?AUTO_8694 - BLOCK
      ?AUTO_8698 - BLOCK
      ?AUTO_8699 - BLOCK
      ?AUTO_8700 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8691 ) ( ON-TABLE ?AUTO_8690 ) ( ON ?AUTO_8697 ?AUTO_8690 ) ( ON ?AUTO_8696 ?AUTO_8697 ) ( CLEAR ?AUTO_8695 ) ( ON ?AUTO_8694 ?AUTO_8696 ) ( CLEAR ?AUTO_8698 ) ( ON ?AUTO_8699 ?AUTO_8694 ) ( CLEAR ?AUTO_8699 ) ( HOLDING ?AUTO_8700 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8700 )
      ( MAKE-ON ?AUTO_8690 ?AUTO_8691 )
      ( MAKE-ON-VERIFY ?AUTO_8690 ?AUTO_8691 ) )
  )

)

