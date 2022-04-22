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

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_32 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_32 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_32 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_32 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_34 - BLOCK
    )
    :vars
    (
      ?AUTO_37 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_34 ?AUTO_37 ) ( CLEAR ?AUTO_34 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_34 ?AUTO_37 )
      ( MAKE-ON-TABLE ?AUTO_34 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_34 ) )
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
      ( MAKE-ON-TABLE ?AUTO_38 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_38 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_47 - BLOCK
      ?AUTO_48 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_47 ) ( CLEAR ?AUTO_48 ) )
    :subtasks
    ( ( !STACK ?AUTO_47 ?AUTO_48 )
      ( MAKE-ON-VERIFY ?AUTO_47 ?AUTO_48 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_51 - BLOCK
      ?AUTO_52 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_52 ) ( ON-TABLE ?AUTO_51 ) ( CLEAR ?AUTO_51 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_51 )
      ( MAKE-ON ?AUTO_51 ?AUTO_52 )
      ( MAKE-ON-VERIFY ?AUTO_51 ?AUTO_52 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56 - BLOCK
      ?AUTO_57 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_56 ) ( CLEAR ?AUTO_56 ) ( HOLDING ?AUTO_57 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_57 )
      ( MAKE-ON ?AUTO_56 ?AUTO_57 )
      ( MAKE-ON-VERIFY ?AUTO_56 ?AUTO_57 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_61 - BLOCK
      ?AUTO_62 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_61 ) ( ON ?AUTO_62 ?AUTO_61 ) ( CLEAR ?AUTO_62 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_62 ?AUTO_61 )
      ( MAKE-ON ?AUTO_61 ?AUTO_62 )
      ( MAKE-ON-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_67 - BLOCK
      ?AUTO_68 - BLOCK
    )
    :vars
    (
      ?AUTO_71 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_67 ) ( ON ?AUTO_68 ?AUTO_67 ) ( CLEAR ?AUTO_68 ) ( HOLDING ?AUTO_71 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_71 )
      ( MAKE-ON ?AUTO_67 ?AUTO_68 )
      ( MAKE-ON-VERIFY ?AUTO_67 ?AUTO_68 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_79 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_79 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_79 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_79 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_81 - BLOCK
    )
    :vars
    (
      ?AUTO_84 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_81 ?AUTO_84 ) ( CLEAR ?AUTO_81 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_81 ?AUTO_84 )
      ( MAKE-ON-TABLE ?AUTO_81 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_81 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_85 - BLOCK
    )
    :vars
    (
      ?AUTO_87 - BLOCK
      ?AUTO_88 - BLOCK
      ?AUTO_89 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_85 ?AUTO_87 ) ( CLEAR ?AUTO_85 ) ( HOLDING ?AUTO_88 ) ( CLEAR ?AUTO_89 ) )
    :subtasks
    ( ( !STACK ?AUTO_88 ?AUTO_89 )
      ( MAKE-ON-TABLE ?AUTO_85 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_85 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_99 - BLOCK
      ?AUTO_100 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_99 ) ( CLEAR ?AUTO_100 ) )
    :subtasks
    ( ( !STACK ?AUTO_99 ?AUTO_100 )
      ( MAKE-ON-VERIFY ?AUTO_99 ?AUTO_100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_103 - BLOCK
      ?AUTO_104 - BLOCK
    )
    :vars
    (
      ?AUTO_108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_104 ) ( ON ?AUTO_103 ?AUTO_108 ) ( CLEAR ?AUTO_103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_103 ?AUTO_108 )
      ( MAKE-ON ?AUTO_103 ?AUTO_104 )
      ( MAKE-ON-VERIFY ?AUTO_103 ?AUTO_104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_109 - BLOCK
      ?AUTO_110 - BLOCK
    )
    :vars
    (
      ?AUTO_113 - BLOCK
      ?AUTO_114 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_110 ) ( ON ?AUTO_109 ?AUTO_113 ) ( CLEAR ?AUTO_109 ) ( HOLDING ?AUTO_114 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_114 )
      ( MAKE-ON ?AUTO_109 ?AUTO_110 )
      ( MAKE-ON-VERIFY ?AUTO_109 ?AUTO_110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_115 - BLOCK
      ?AUTO_116 - BLOCK
    )
    :vars
    (
      ?AUTO_119 - BLOCK
      ?AUTO_120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_116 ) ( ON ?AUTO_115 ?AUTO_119 ) ( ON ?AUTO_120 ?AUTO_115 ) ( CLEAR ?AUTO_120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_120 ?AUTO_115 )
      ( MAKE-ON ?AUTO_115 ?AUTO_116 )
      ( MAKE-ON-VERIFY ?AUTO_115 ?AUTO_116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_123 - BLOCK
      ?AUTO_124 - BLOCK
    )
    :vars
    (
      ?AUTO_128 - BLOCK
      ?AUTO_125 - BLOCK
      ?AUTO_129 - BLOCK
      ?AUTO_130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_124 ) ( ON ?AUTO_123 ?AUTO_128 ) ( ON ?AUTO_125 ?AUTO_123 ) ( CLEAR ?AUTO_125 ) ( HOLDING ?AUTO_129 ) ( CLEAR ?AUTO_130 ) )
    :subtasks
    ( ( !STACK ?AUTO_129 ?AUTO_130 )
      ( MAKE-ON ?AUTO_123 ?AUTO_124 )
      ( MAKE-ON-VERIFY ?AUTO_123 ?AUTO_124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_139 - BLOCK
      ?AUTO_140 - BLOCK
    )
    :vars
    (
      ?AUTO_141 - BLOCK
      ?AUTO_143 - BLOCK
      ?AUTO_146 - BLOCK
      ?AUTO_144 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_139 ?AUTO_141 ) ( ON ?AUTO_143 ?AUTO_139 ) ( CLEAR ?AUTO_143 ) ( CLEAR ?AUTO_146 ) ( ON ?AUTO_144 ?AUTO_140 ) ( CLEAR ?AUTO_144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_144 ?AUTO_140 )
      ( MAKE-ON ?AUTO_139 ?AUTO_140 )
      ( MAKE-ON-VERIFY ?AUTO_139 ?AUTO_140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_149 - BLOCK
      ?AUTO_150 - BLOCK
    )
    :vars
    (
      ?AUTO_153 - BLOCK
      ?AUTO_154 - BLOCK
      ?AUTO_156 - BLOCK
      ?AUTO_155 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_149 ?AUTO_153 ) ( CLEAR ?AUTO_154 ) ( ON ?AUTO_156 ?AUTO_150 ) ( CLEAR ?AUTO_156 ) ( HOLDING ?AUTO_155 ) ( CLEAR ?AUTO_149 ) )
    :subtasks
    ( ( !STACK ?AUTO_155 ?AUTO_149 )
      ( MAKE-ON ?AUTO_149 ?AUTO_150 )
      ( MAKE-ON-VERIFY ?AUTO_149 ?AUTO_150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_159 - BLOCK
      ?AUTO_160 - BLOCK
    )
    :vars
    (
      ?AUTO_166 - BLOCK
      ?AUTO_162 - BLOCK
      ?AUTO_161 - BLOCK
      ?AUTO_164 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_159 ?AUTO_166 ) ( CLEAR ?AUTO_162 ) ( ON ?AUTO_161 ?AUTO_160 ) ( CLEAR ?AUTO_159 ) ( ON ?AUTO_164 ?AUTO_161 ) ( CLEAR ?AUTO_164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_164 ?AUTO_161 )
      ( MAKE-ON ?AUTO_159 ?AUTO_160 )
      ( MAKE-ON-VERIFY ?AUTO_159 ?AUTO_160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_171 - BLOCK
      ?AUTO_172 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_171 ) ( CLEAR ?AUTO_172 ) )
    :subtasks
    ( ( !STACK ?AUTO_171 ?AUTO_172 )
      ( MAKE-ON-VERIFY ?AUTO_171 ?AUTO_172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_175 - BLOCK
      ?AUTO_176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_176 ) ( ON-TABLE ?AUTO_175 ) ( CLEAR ?AUTO_175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_175 )
      ( MAKE-ON ?AUTO_175 ?AUTO_176 )
      ( MAKE-ON-VERIFY ?AUTO_175 ?AUTO_176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_180 - BLOCK
      ?AUTO_181 - BLOCK
    )
    :vars
    (
      ?AUTO_185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_180 ) ( CLEAR ?AUTO_180 ) ( HOLDING ?AUTO_181 ) ( CLEAR ?AUTO_185 ) )
    :subtasks
    ( ( !STACK ?AUTO_181 ?AUTO_185 )
      ( MAKE-ON ?AUTO_180 ?AUTO_181 )
      ( MAKE-ON-VERIFY ?AUTO_180 ?AUTO_181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_269 - BLOCK
      ?AUTO_270 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_269 ) ( CLEAR ?AUTO_270 ) )
    :subtasks
    ( ( !STACK ?AUTO_269 ?AUTO_270 )
      ( MAKE-ON-VERIFY ?AUTO_269 ?AUTO_270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_273 - BLOCK
      ?AUTO_274 - BLOCK
    )
    :vars
    (
      ?AUTO_278 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_274 ) ( ON ?AUTO_273 ?AUTO_278 ) ( CLEAR ?AUTO_273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_273 ?AUTO_278 )
      ( MAKE-ON ?AUTO_273 ?AUTO_274 )
      ( MAKE-ON-VERIFY ?AUTO_273 ?AUTO_274 ) )
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
      ?AUTO_285 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_279 ?AUTO_283 ) ( CLEAR ?AUTO_279 ) ( HOLDING ?AUTO_280 ) ( CLEAR ?AUTO_285 ) )
    :subtasks
    ( ( !STACK ?AUTO_280 ?AUTO_285 )
      ( MAKE-ON ?AUTO_279 ?AUTO_280 )
      ( MAKE-ON-VERIFY ?AUTO_279 ?AUTO_280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_288 - BLOCK
      ?AUTO_289 - BLOCK
    )
    :vars
    (
      ?AUTO_290 - BLOCK
      ?AUTO_293 - BLOCK
      ?AUTO_294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_289 ) ( ON ?AUTO_288 ?AUTO_290 ) ( CLEAR ?AUTO_288 ) ( HOLDING ?AUTO_293 ) ( CLEAR ?AUTO_294 ) )
    :subtasks
    ( ( !STACK ?AUTO_293 ?AUTO_294 )
      ( MAKE-ON ?AUTO_288 ?AUTO_289 )
      ( MAKE-ON-VERIFY ?AUTO_288 ?AUTO_289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_295 - BLOCK
      ?AUTO_296 - BLOCK
    )
    :vars
    (
      ?AUTO_299 - BLOCK
      ?AUTO_301 - BLOCK
      ?AUTO_300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_296 ) ( ON ?AUTO_295 ?AUTO_299 ) ( CLEAR ?AUTO_301 ) ( ON ?AUTO_300 ?AUTO_295 ) ( CLEAR ?AUTO_300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_300 ?AUTO_295 )
      ( MAKE-ON ?AUTO_295 ?AUTO_296 )
      ( MAKE-ON-VERIFY ?AUTO_295 ?AUTO_296 ) )
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
      ?AUTO_306 - BLOCK
      ?AUTO_310 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_304 ?AUTO_309 ) ( CLEAR ?AUTO_306 ) ( ON ?AUTO_310 ?AUTO_304 ) ( CLEAR ?AUTO_310 ) ( HOLDING ?AUTO_305 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_305 )
      ( MAKE-ON ?AUTO_304 ?AUTO_305 )
      ( MAKE-ON-VERIFY ?AUTO_304 ?AUTO_305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_312 - BLOCK
      ?AUTO_313 - BLOCK
    )
    :vars
    (
      ?AUTO_318 - BLOCK
      ?AUTO_314 - BLOCK
      ?AUTO_315 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_312 ?AUTO_318 ) ( CLEAR ?AUTO_314 ) ( ON ?AUTO_315 ?AUTO_312 ) ( ON ?AUTO_313 ?AUTO_315 ) ( CLEAR ?AUTO_313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_313 ?AUTO_315 )
      ( MAKE-ON ?AUTO_312 ?AUTO_313 )
      ( MAKE-ON-VERIFY ?AUTO_312 ?AUTO_313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_321 - BLOCK
      ?AUTO_322 - BLOCK
    )
    :vars
    (
      ?AUTO_325 - BLOCK
      ?AUTO_324 - BLOCK
      ?AUTO_327 - BLOCK
      ?AUTO_328 - BLOCK
      ?AUTO_329 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_321 ?AUTO_325 ) ( CLEAR ?AUTO_324 ) ( ON ?AUTO_327 ?AUTO_321 ) ( ON ?AUTO_322 ?AUTO_327 ) ( CLEAR ?AUTO_322 ) ( HOLDING ?AUTO_328 ) ( CLEAR ?AUTO_329 ) )
    :subtasks
    ( ( !STACK ?AUTO_328 ?AUTO_329 )
      ( MAKE-ON ?AUTO_321 ?AUTO_322 )
      ( MAKE-ON-VERIFY ?AUTO_321 ?AUTO_322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_346 - BLOCK
      ?AUTO_347 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_346 ) ( CLEAR ?AUTO_347 ) )
    :subtasks
    ( ( !STACK ?AUTO_346 ?AUTO_347 )
      ( MAKE-ON-VERIFY ?AUTO_346 ?AUTO_347 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_351 ) ( ON ?AUTO_350 ?AUTO_355 ) ( CLEAR ?AUTO_350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_350 ?AUTO_355 )
      ( MAKE-ON ?AUTO_350 ?AUTO_351 )
      ( MAKE-ON-VERIFY ?AUTO_350 ?AUTO_351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_356 - BLOCK
      ?AUTO_357 - BLOCK
    )
    :vars
    (
      ?AUTO_360 - BLOCK
      ?AUTO_362 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_356 ?AUTO_360 ) ( CLEAR ?AUTO_356 ) ( HOLDING ?AUTO_357 ) ( CLEAR ?AUTO_362 ) )
    :subtasks
    ( ( !STACK ?AUTO_357 ?AUTO_362 )
      ( MAKE-ON ?AUTO_356 ?AUTO_357 )
      ( MAKE-ON-VERIFY ?AUTO_356 ?AUTO_357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_365 - BLOCK
      ?AUTO_366 - BLOCK
    )
    :vars
    (
      ?AUTO_369 - BLOCK
      ?AUTO_370 - BLOCK
      ?AUTO_371 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_366 ) ( ON ?AUTO_365 ?AUTO_369 ) ( CLEAR ?AUTO_365 ) ( HOLDING ?AUTO_370 ) ( CLEAR ?AUTO_371 ) )
    :subtasks
    ( ( !STACK ?AUTO_370 ?AUTO_371 )
      ( MAKE-ON ?AUTO_365 ?AUTO_366 )
      ( MAKE-ON-VERIFY ?AUTO_365 ?AUTO_366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_376 - BLOCK
      ?AUTO_377 - BLOCK
    )
    :vars
    (
      ?AUTO_378 - BLOCK
      ?AUTO_381 - BLOCK
      ?AUTO_382 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_376 ?AUTO_378 ) ( CLEAR ?AUTO_376 ) ( CLEAR ?AUTO_381 ) ( ON ?AUTO_382 ?AUTO_377 ) ( CLEAR ?AUTO_382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_382 ?AUTO_377 )
      ( MAKE-ON ?AUTO_376 ?AUTO_377 )
      ( MAKE-ON-VERIFY ?AUTO_376 ?AUTO_377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_385 - BLOCK
      ?AUTO_386 - BLOCK
    )
    :vars
    (
      ?AUTO_389 - BLOCK
      ?AUTO_391 - BLOCK
      ?AUTO_390 - BLOCK
      ?AUTO_392 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_385 ?AUTO_389 ) ( CLEAR ?AUTO_385 ) ( CLEAR ?AUTO_391 ) ( ON ?AUTO_390 ?AUTO_386 ) ( CLEAR ?AUTO_390 ) ( HOLDING ?AUTO_392 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_392 )
      ( MAKE-ON ?AUTO_385 ?AUTO_386 )
      ( MAKE-ON-VERIFY ?AUTO_385 ?AUTO_386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_393 - BLOCK
      ?AUTO_394 - BLOCK
    )
    :vars
    (
      ?AUTO_399 - BLOCK
      ?AUTO_397 - BLOCK
      ?AUTO_395 - BLOCK
      ?AUTO_400 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_393 ?AUTO_399 ) ( CLEAR ?AUTO_393 ) ( CLEAR ?AUTO_397 ) ( ON ?AUTO_395 ?AUTO_394 ) ( ON ?AUTO_400 ?AUTO_395 ) ( CLEAR ?AUTO_400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_400 ?AUTO_395 )
      ( MAKE-ON ?AUTO_393 ?AUTO_394 )
      ( MAKE-ON-VERIFY ?AUTO_393 ?AUTO_394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_403 - BLOCK
      ?AUTO_404 - BLOCK
    )
    :vars
    (
      ?AUTO_406 - BLOCK
      ?AUTO_408 - BLOCK
      ?AUTO_410 - BLOCK
      ?AUTO_409 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_406 ) ( ON ?AUTO_408 ?AUTO_404 ) ( ON ?AUTO_410 ?AUTO_408 ) ( CLEAR ?AUTO_410 ) ( HOLDING ?AUTO_403 ) ( CLEAR ?AUTO_409 ) )
    :subtasks
    ( ( !STACK ?AUTO_403 ?AUTO_409 )
      ( MAKE-ON ?AUTO_403 ?AUTO_404 )
      ( MAKE-ON-VERIFY ?AUTO_403 ?AUTO_404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_413 - BLOCK
      ?AUTO_414 - BLOCK
    )
    :vars
    (
      ?AUTO_418 - BLOCK
      ?AUTO_415 - BLOCK
      ?AUTO_417 - BLOCK
      ?AUTO_416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_418 ) ( ON ?AUTO_415 ?AUTO_414 ) ( ON ?AUTO_417 ?AUTO_415 ) ( CLEAR ?AUTO_417 ) ( CLEAR ?AUTO_416 ) ( ON-TABLE ?AUTO_413 ) ( CLEAR ?AUTO_413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_413 )
      ( MAKE-ON ?AUTO_413 ?AUTO_414 )
      ( MAKE-ON-VERIFY ?AUTO_413 ?AUTO_414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_422 - BLOCK
      ?AUTO_423 - BLOCK
    )
    :vars
    (
      ?AUTO_428 - BLOCK
      ?AUTO_425 - BLOCK
      ?AUTO_429 - BLOCK
      ?AUTO_426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_428 ) ( ON ?AUTO_425 ?AUTO_423 ) ( ON ?AUTO_429 ?AUTO_425 ) ( CLEAR ?AUTO_429 ) ( ON-TABLE ?AUTO_422 ) ( CLEAR ?AUTO_422 ) ( HOLDING ?AUTO_426 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_426 )
      ( MAKE-ON ?AUTO_422 ?AUTO_423 )
      ( MAKE-ON-VERIFY ?AUTO_422 ?AUTO_423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_431 - BLOCK
      ?AUTO_432 - BLOCK
    )
    :vars
    (
      ?AUTO_437 - BLOCK
      ?AUTO_434 - BLOCK
      ?AUTO_438 - BLOCK
      ?AUTO_436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_437 ) ( ON ?AUTO_434 ?AUTO_432 ) ( ON ?AUTO_438 ?AUTO_434 ) ( CLEAR ?AUTO_438 ) ( ON-TABLE ?AUTO_431 ) ( ON ?AUTO_436 ?AUTO_431 ) ( CLEAR ?AUTO_436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_436 ?AUTO_431 )
      ( MAKE-ON ?AUTO_431 ?AUTO_432 )
      ( MAKE-ON-VERIFY ?AUTO_431 ?AUTO_432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_441 - BLOCK
      ?AUTO_442 - BLOCK
    )
    :vars
    (
      ?AUTO_445 - BLOCK
      ?AUTO_448 - BLOCK
      ?AUTO_446 - BLOCK
      ?AUTO_447 - BLOCK
      ?AUTO_449 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_445 ) ( ON ?AUTO_448 ?AUTO_442 ) ( ON ?AUTO_446 ?AUTO_448 ) ( CLEAR ?AUTO_446 ) ( ON-TABLE ?AUTO_441 ) ( ON ?AUTO_447 ?AUTO_441 ) ( CLEAR ?AUTO_447 ) ( HOLDING ?AUTO_449 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_449 )
      ( MAKE-ON ?AUTO_441 ?AUTO_442 )
      ( MAKE-ON-VERIFY ?AUTO_441 ?AUTO_442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_452 - BLOCK
      ?AUTO_453 - BLOCK
    )
    :vars
    (
      ?AUTO_454 - BLOCK
      ?AUTO_459 - BLOCK
      ?AUTO_458 - BLOCK
      ?AUTO_455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_454 ) ( ON ?AUTO_459 ?AUTO_453 ) ( ON-TABLE ?AUTO_452 ) ( ON ?AUTO_458 ?AUTO_452 ) ( CLEAR ?AUTO_458 ) ( HOLDING ?AUTO_455 ) ( CLEAR ?AUTO_459 ) )
    :subtasks
    ( ( !STACK ?AUTO_455 ?AUTO_459 )
      ( MAKE-ON ?AUTO_452 ?AUTO_453 )
      ( MAKE-ON-VERIFY ?AUTO_452 ?AUTO_453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_462 - BLOCK
      ?AUTO_463 - BLOCK
    )
    :vars
    (
      ?AUTO_466 - BLOCK
      ?AUTO_465 - BLOCK
      ?AUTO_467 - BLOCK
      ?AUTO_464 - BLOCK
      ?AUTO_471 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_466 ) ( ON ?AUTO_465 ?AUTO_463 ) ( ON-TABLE ?AUTO_462 ) ( ON ?AUTO_467 ?AUTO_462 ) ( CLEAR ?AUTO_467 ) ( CLEAR ?AUTO_465 ) ( ON ?AUTO_464 ?AUTO_471 ) ( CLEAR ?AUTO_464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_464 ?AUTO_471 )
      ( MAKE-ON ?AUTO_462 ?AUTO_463 )
      ( MAKE-ON-VERIFY ?AUTO_462 ?AUTO_463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_474 - BLOCK
      ?AUTO_475 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_474 ) ( CLEAR ?AUTO_475 ) )
    :subtasks
    ( ( !STACK ?AUTO_474 ?AUTO_475 )
      ( MAKE-ON-VERIFY ?AUTO_474 ?AUTO_475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_478 - BLOCK
      ?AUTO_479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_479 ) ( ON-TABLE ?AUTO_478 ) ( CLEAR ?AUTO_478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_478 )
      ( MAKE-ON ?AUTO_478 ?AUTO_479 )
      ( MAKE-ON-VERIFY ?AUTO_478 ?AUTO_479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_483 - BLOCK
      ?AUTO_484 - BLOCK
    )
    :vars
    (
      ?AUTO_487 - BLOCK
      ?AUTO_488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_484 ) ( ON-TABLE ?AUTO_483 ) ( CLEAR ?AUTO_483 ) ( HOLDING ?AUTO_487 ) ( CLEAR ?AUTO_488 ) )
    :subtasks
    ( ( !STACK ?AUTO_487 ?AUTO_488 )
      ( MAKE-ON ?AUTO_483 ?AUTO_484 )
      ( MAKE-ON-VERIFY ?AUTO_483 ?AUTO_484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_489 - BLOCK
      ?AUTO_490 - BLOCK
    )
    :vars
    (
      ?AUTO_492 - BLOCK
      ?AUTO_494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_490 ) ( ON-TABLE ?AUTO_489 ) ( CLEAR ?AUTO_492 ) ( ON ?AUTO_494 ?AUTO_489 ) ( CLEAR ?AUTO_494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_494 ?AUTO_489 )
      ( MAKE-ON ?AUTO_489 ?AUTO_490 )
      ( MAKE-ON-VERIFY ?AUTO_489 ?AUTO_490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_497 - BLOCK
      ?AUTO_498 - BLOCK
    )
    :vars
    (
      ?AUTO_502 - BLOCK
      ?AUTO_501 - BLOCK
      ?AUTO_504 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_498 ) ( ON-TABLE ?AUTO_497 ) ( ON ?AUTO_502 ?AUTO_497 ) ( CLEAR ?AUTO_502 ) ( HOLDING ?AUTO_501 ) ( CLEAR ?AUTO_504 ) )
    :subtasks
    ( ( !STACK ?AUTO_501 ?AUTO_504 )
      ( MAKE-ON ?AUTO_497 ?AUTO_498 )
      ( MAKE-ON-VERIFY ?AUTO_497 ?AUTO_498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_505 - BLOCK
      ?AUTO_506 - BLOCK
    )
    :vars
    (
      ?AUTO_511 - BLOCK
      ?AUTO_507 - BLOCK
      ?AUTO_510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_505 ) ( ON ?AUTO_511 ?AUTO_505 ) ( CLEAR ?AUTO_511 ) ( CLEAR ?AUTO_507 ) ( ON ?AUTO_510 ?AUTO_506 ) ( CLEAR ?AUTO_510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_510 ?AUTO_506 )
      ( MAKE-ON ?AUTO_505 ?AUTO_506 )
      ( MAKE-ON-VERIFY ?AUTO_505 ?AUTO_506 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_514 - BLOCK
      ?AUTO_515 - BLOCK
    )
    :vars
    (
      ?AUTO_519 - BLOCK
      ?AUTO_520 - BLOCK
      ?AUTO_518 - BLOCK
      ?AUTO_522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_514 ) ( ON ?AUTO_519 ?AUTO_514 ) ( CLEAR ?AUTO_519 ) ( ON ?AUTO_520 ?AUTO_515 ) ( CLEAR ?AUTO_520 ) ( HOLDING ?AUTO_518 ) ( CLEAR ?AUTO_522 ) )
    :subtasks
    ( ( !STACK ?AUTO_518 ?AUTO_522 )
      ( MAKE-ON ?AUTO_514 ?AUTO_515 )
      ( MAKE-ON-VERIFY ?AUTO_514 ?AUTO_515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_527 - BLOCK
      ?AUTO_528 - BLOCK
    )
    :vars
    (
      ?AUTO_531 - BLOCK
      ?AUTO_533 - BLOCK
      ?AUTO_529 - BLOCK
      ?AUTO_532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_527 ) ( ON ?AUTO_531 ?AUTO_527 ) ( CLEAR ?AUTO_531 ) ( ON ?AUTO_533 ?AUTO_528 ) ( CLEAR ?AUTO_529 ) ( ON ?AUTO_532 ?AUTO_533 ) ( CLEAR ?AUTO_532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_532 ?AUTO_533 )
      ( MAKE-ON ?AUTO_527 ?AUTO_528 )
      ( MAKE-ON-VERIFY ?AUTO_527 ?AUTO_528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_537 - BLOCK
      ?AUTO_538 - BLOCK
    )
    :vars
    (
      ?AUTO_542 - BLOCK
      ?AUTO_543 - BLOCK
      ?AUTO_541 - BLOCK
      ?AUTO_544 - BLOCK
      ?AUTO_545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_537 ) ( ON ?AUTO_542 ?AUTO_537 ) ( CLEAR ?AUTO_542 ) ( ON ?AUTO_543 ?AUTO_538 ) ( CLEAR ?AUTO_541 ) ( ON ?AUTO_544 ?AUTO_543 ) ( CLEAR ?AUTO_544 ) ( HOLDING ?AUTO_545 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_545 )
      ( MAKE-ON ?AUTO_537 ?AUTO_538 )
      ( MAKE-ON-VERIFY ?AUTO_537 ?AUTO_538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_546 - BLOCK
      ?AUTO_547 - BLOCK
    )
    :vars
    (
      ?AUTO_552 - BLOCK
      ?AUTO_553 - BLOCK
      ?AUTO_551 - BLOCK
      ?AUTO_554 - BLOCK
      ?AUTO_550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_546 ) ( ON ?AUTO_552 ?AUTO_546 ) ( CLEAR ?AUTO_552 ) ( ON ?AUTO_553 ?AUTO_547 ) ( CLEAR ?AUTO_551 ) ( ON ?AUTO_554 ?AUTO_553 ) ( ON ?AUTO_550 ?AUTO_554 ) ( CLEAR ?AUTO_550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_550 ?AUTO_554 )
      ( MAKE-ON ?AUTO_546 ?AUTO_547 )
      ( MAKE-ON-VERIFY ?AUTO_546 ?AUTO_547 ) )
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
      ?AUTO_564 - BLOCK
      ?AUTO_563 - BLOCK
      ?AUTO_560 - BLOCK
      ?AUTO_565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_557 ) ( ON ?AUTO_561 ?AUTO_558 ) ( CLEAR ?AUTO_564 ) ( ON ?AUTO_563 ?AUTO_561 ) ( ON ?AUTO_560 ?AUTO_563 ) ( CLEAR ?AUTO_560 ) ( HOLDING ?AUTO_565 ) ( CLEAR ?AUTO_557 ) )
    :subtasks
    ( ( !STACK ?AUTO_565 ?AUTO_557 )
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
      ?AUTO_575 - BLOCK
      ?AUTO_576 - BLOCK
      ?AUTO_570 - BLOCK
      ?AUTO_571 - BLOCK
      ?AUTO_572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_568 ) ( ON ?AUTO_575 ?AUTO_569 ) ( CLEAR ?AUTO_576 ) ( ON ?AUTO_570 ?AUTO_575 ) ( ON ?AUTO_571 ?AUTO_570 ) ( CLEAR ?AUTO_571 ) ( CLEAR ?AUTO_568 ) ( ON-TABLE ?AUTO_572 ) ( CLEAR ?AUTO_572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_572 )
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
      ?AUTO_580 - BLOCK
      ?AUTO_583 - BLOCK
      ?AUTO_584 - BLOCK
      ?AUTO_586 - BLOCK
      ?AUTO_585 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_580 ?AUTO_579 ) ( CLEAR ?AUTO_583 ) ( ON ?AUTO_584 ?AUTO_580 ) ( ON ?AUTO_586 ?AUTO_584 ) ( CLEAR ?AUTO_586 ) ( ON-TABLE ?AUTO_585 ) ( CLEAR ?AUTO_585 ) ( HOLDING ?AUTO_578 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_578 )
      ( MAKE-ON ?AUTO_578 ?AUTO_579 )
      ( MAKE-ON-VERIFY ?AUTO_578 ?AUTO_579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_588 - BLOCK
      ?AUTO_589 - BLOCK
    )
    :vars
    (
      ?AUTO_593 - BLOCK
      ?AUTO_592 - BLOCK
      ?AUTO_596 - BLOCK
      ?AUTO_595 - BLOCK
      ?AUTO_590 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_593 ?AUTO_589 ) ( CLEAR ?AUTO_592 ) ( ON ?AUTO_596 ?AUTO_593 ) ( ON ?AUTO_595 ?AUTO_596 ) ( CLEAR ?AUTO_595 ) ( ON-TABLE ?AUTO_590 ) ( ON ?AUTO_588 ?AUTO_590 ) ( CLEAR ?AUTO_588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_588 ?AUTO_590 )
      ( MAKE-ON ?AUTO_588 ?AUTO_589 )
      ( MAKE-ON-VERIFY ?AUTO_588 ?AUTO_589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_599 - BLOCK
      ?AUTO_600 - BLOCK
    )
    :vars
    (
      ?AUTO_607 - BLOCK
      ?AUTO_603 - BLOCK
      ?AUTO_602 - BLOCK
      ?AUTO_605 - BLOCK
      ?AUTO_601 - BLOCK
      ?AUTO_608 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_607 ?AUTO_600 ) ( CLEAR ?AUTO_603 ) ( ON ?AUTO_602 ?AUTO_607 ) ( ON ?AUTO_605 ?AUTO_602 ) ( CLEAR ?AUTO_605 ) ( ON-TABLE ?AUTO_601 ) ( ON ?AUTO_599 ?AUTO_601 ) ( CLEAR ?AUTO_599 ) ( HOLDING ?AUTO_608 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_608 )
      ( MAKE-ON ?AUTO_599 ?AUTO_600 )
      ( MAKE-ON-VERIFY ?AUTO_599 ?AUTO_600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_611 - BLOCK
      ?AUTO_612 - BLOCK
    )
    :vars
    (
      ?AUTO_614 - BLOCK
      ?AUTO_619 - BLOCK
      ?AUTO_615 - BLOCK
      ?AUTO_616 - BLOCK
      ?AUTO_618 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_614 ?AUTO_612 ) ( CLEAR ?AUTO_619 ) ( ON ?AUTO_615 ?AUTO_614 ) ( ON-TABLE ?AUTO_616 ) ( ON ?AUTO_611 ?AUTO_616 ) ( CLEAR ?AUTO_611 ) ( HOLDING ?AUTO_618 ) ( CLEAR ?AUTO_615 ) )
    :subtasks
    ( ( !STACK ?AUTO_618 ?AUTO_615 )
      ( MAKE-ON ?AUTO_611 ?AUTO_612 )
      ( MAKE-ON-VERIFY ?AUTO_611 ?AUTO_612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_626 - BLOCK
      ?AUTO_627 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_626 ) ( CLEAR ?AUTO_627 ) )
    :subtasks
    ( ( !STACK ?AUTO_626 ?AUTO_627 )
      ( MAKE-ON-VERIFY ?AUTO_626 ?AUTO_627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_630 - BLOCK
      ?AUTO_631 - BLOCK
    )
    :vars
    (
      ?AUTO_635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_631 ) ( ON ?AUTO_630 ?AUTO_635 ) ( CLEAR ?AUTO_630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_630 ?AUTO_635 )
      ( MAKE-ON ?AUTO_630 ?AUTO_631 )
      ( MAKE-ON-VERIFY ?AUTO_630 ?AUTO_631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_636 - BLOCK
      ?AUTO_637 - BLOCK
    )
    :vars
    (
      ?AUTO_640 - BLOCK
      ?AUTO_642 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_636 ?AUTO_640 ) ( CLEAR ?AUTO_636 ) ( HOLDING ?AUTO_637 ) ( CLEAR ?AUTO_642 ) )
    :subtasks
    ( ( !STACK ?AUTO_637 ?AUTO_642 )
      ( MAKE-ON ?AUTO_636 ?AUTO_637 )
      ( MAKE-ON-VERIFY ?AUTO_636 ?AUTO_637 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_644 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_644 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_644 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_644 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_646 - BLOCK
    )
    :vars
    (
      ?AUTO_649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_646 ?AUTO_649 ) ( CLEAR ?AUTO_646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_646 ?AUTO_649 )
      ( MAKE-ON-TABLE ?AUTO_646 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_646 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_651 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_651 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_651 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_651 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_653 - BLOCK
    )
    :vars
    (
      ?AUTO_656 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_653 ?AUTO_656 ) ( CLEAR ?AUTO_653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_653 ?AUTO_656 )
      ( MAKE-ON-TABLE ?AUTO_653 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_653 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_657 - BLOCK
    )
    :vars
    (
      ?AUTO_659 - BLOCK
      ?AUTO_660 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_657 ?AUTO_659 ) ( CLEAR ?AUTO_657 ) ( HOLDING ?AUTO_660 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_660 )
      ( MAKE-ON-TABLE ?AUTO_657 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_657 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_663 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_663 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_663 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_663 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_665 - BLOCK
    )
    :vars
    (
      ?AUTO_668 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_665 ?AUTO_668 ) ( CLEAR ?AUTO_665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_665 ?AUTO_668 )
      ( MAKE-ON-TABLE ?AUTO_665 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_665 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_669 - BLOCK
    )
    :vars
    (
      ?AUTO_671 - BLOCK
      ?AUTO_672 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_669 ?AUTO_671 ) ( CLEAR ?AUTO_669 ) ( HOLDING ?AUTO_672 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_672 )
      ( MAKE-ON-TABLE ?AUTO_669 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_669 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_673 - BLOCK
    )
    :vars
    (
      ?AUTO_675 - BLOCK
      ?AUTO_676 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_673 ?AUTO_675 ) ( ON ?AUTO_676 ?AUTO_673 ) ( CLEAR ?AUTO_676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_676 ?AUTO_673 )
      ( MAKE-ON-TABLE ?AUTO_673 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_673 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_679 - BLOCK
    )
    :vars
    (
      ?AUTO_680 - BLOCK
      ?AUTO_681 - BLOCK
      ?AUTO_683 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_679 ?AUTO_680 ) ( ON ?AUTO_681 ?AUTO_679 ) ( CLEAR ?AUTO_681 ) ( HOLDING ?AUTO_683 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_683 )
      ( MAKE-ON-TABLE ?AUTO_679 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_679 ) )
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
      ?AUTO_702 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_698 ) ( ON ?AUTO_697 ?AUTO_699 ) ( CLEAR ?AUTO_697 ) ( HOLDING ?AUTO_702 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_702 )
      ( MAKE-ON ?AUTO_697 ?AUTO_698 )
      ( MAKE-ON-VERIFY ?AUTO_697 ?AUTO_698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_703 - BLOCK
      ?AUTO_704 - BLOCK
    )
    :vars
    (
      ?AUTO_705 - BLOCK
      ?AUTO_708 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_704 ) ( ON ?AUTO_703 ?AUTO_705 ) ( ON ?AUTO_708 ?AUTO_703 ) ( CLEAR ?AUTO_708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_708 ?AUTO_703 )
      ( MAKE-ON ?AUTO_703 ?AUTO_704 )
      ( MAKE-ON-VERIFY ?AUTO_703 ?AUTO_704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_711 - BLOCK
      ?AUTO_712 - BLOCK
    )
    :vars
    (
      ?AUTO_713 - BLOCK
      ?AUTO_714 - BLOCK
      ?AUTO_717 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_712 ) ( ON ?AUTO_711 ?AUTO_713 ) ( ON ?AUTO_714 ?AUTO_711 ) ( CLEAR ?AUTO_714 ) ( HOLDING ?AUTO_717 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_717 )
      ( MAKE-ON ?AUTO_711 ?AUTO_712 )
      ( MAKE-ON-VERIFY ?AUTO_711 ?AUTO_712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_718 - BLOCK
      ?AUTO_719 - BLOCK
    )
    :vars
    (
      ?AUTO_720 - BLOCK
      ?AUTO_723 - BLOCK
      ?AUTO_724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_719 ) ( ON ?AUTO_718 ?AUTO_720 ) ( ON ?AUTO_723 ?AUTO_718 ) ( ON ?AUTO_724 ?AUTO_723 ) ( CLEAR ?AUTO_724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_724 ?AUTO_723 )
      ( MAKE-ON ?AUTO_718 ?AUTO_719 )
      ( MAKE-ON-VERIFY ?AUTO_718 ?AUTO_719 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_727 - BLOCK
      ?AUTO_728 - BLOCK
    )
    :vars
    (
      ?AUTO_730 - BLOCK
      ?AUTO_731 - BLOCK
      ?AUTO_729 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_727 ?AUTO_730 ) ( ON ?AUTO_731 ?AUTO_727 ) ( ON ?AUTO_729 ?AUTO_731 ) ( CLEAR ?AUTO_729 ) ( HOLDING ?AUTO_728 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_728 )
      ( MAKE-ON ?AUTO_727 ?AUTO_728 )
      ( MAKE-ON-VERIFY ?AUTO_727 ?AUTO_728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_739 - BLOCK
      ?AUTO_740 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_739 ) ( CLEAR ?AUTO_740 ) )
    :subtasks
    ( ( !STACK ?AUTO_739 ?AUTO_740 )
      ( MAKE-ON-VERIFY ?AUTO_739 ?AUTO_740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_743 - BLOCK
      ?AUTO_744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_744 ) ( ON-TABLE ?AUTO_743 ) ( CLEAR ?AUTO_743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_743 )
      ( MAKE-ON ?AUTO_743 ?AUTO_744 )
      ( MAKE-ON-VERIFY ?AUTO_743 ?AUTO_744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_748 - BLOCK
      ?AUTO_749 - BLOCK
    )
    :vars
    (
      ?AUTO_752 - BLOCK
      ?AUTO_753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_749 ) ( ON-TABLE ?AUTO_748 ) ( CLEAR ?AUTO_748 ) ( HOLDING ?AUTO_752 ) ( CLEAR ?AUTO_753 ) )
    :subtasks
    ( ( !STACK ?AUTO_752 ?AUTO_753 )
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
      ?AUTO_757 - BLOCK
      ?AUTO_759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_755 ) ( ON-TABLE ?AUTO_754 ) ( CLEAR ?AUTO_757 ) ( ON ?AUTO_759 ?AUTO_754 ) ( CLEAR ?AUTO_759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_759 ?AUTO_754 )
      ( MAKE-ON ?AUTO_754 ?AUTO_755 )
      ( MAKE-ON-VERIFY ?AUTO_754 ?AUTO_755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_762 - BLOCK
      ?AUTO_763 - BLOCK
    )
    :vars
    (
      ?AUTO_765 - BLOCK
      ?AUTO_764 - BLOCK
      ?AUTO_768 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_763 ) ( ON-TABLE ?AUTO_762 ) ( CLEAR ?AUTO_765 ) ( ON ?AUTO_764 ?AUTO_762 ) ( CLEAR ?AUTO_764 ) ( HOLDING ?AUTO_768 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_768 )
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
      ?AUTO_771 - BLOCK
      ?AUTO_773 - BLOCK
      ?AUTO_775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_770 ) ( ON-TABLE ?AUTO_769 ) ( CLEAR ?AUTO_771 ) ( ON ?AUTO_773 ?AUTO_769 ) ( ON ?AUTO_775 ?AUTO_773 ) ( CLEAR ?AUTO_775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_775 ?AUTO_773 )
      ( MAKE-ON ?AUTO_769 ?AUTO_770 )
      ( MAKE-ON-VERIFY ?AUTO_769 ?AUTO_770 ) )
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
      ?AUTO_784 - BLOCK
      ?AUTO_780 - BLOCK
      ?AUTO_785 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_779 ) ( ON-TABLE ?AUTO_778 ) ( CLEAR ?AUTO_782 ) ( ON ?AUTO_784 ?AUTO_778 ) ( ON ?AUTO_780 ?AUTO_784 ) ( CLEAR ?AUTO_780 ) ( HOLDING ?AUTO_785 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_785 )
      ( MAKE-ON ?AUTO_778 ?AUTO_779 )
      ( MAKE-ON-VERIFY ?AUTO_778 ?AUTO_779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_786 - BLOCK
      ?AUTO_787 - BLOCK
    )
    :vars
    (
      ?AUTO_788 - BLOCK
      ?AUTO_789 - BLOCK
      ?AUTO_790 - BLOCK
      ?AUTO_793 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_787 ) ( ON-TABLE ?AUTO_786 ) ( CLEAR ?AUTO_788 ) ( ON ?AUTO_789 ?AUTO_786 ) ( ON ?AUTO_790 ?AUTO_789 ) ( ON ?AUTO_793 ?AUTO_790 ) ( CLEAR ?AUTO_793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_793 ?AUTO_790 )
      ( MAKE-ON ?AUTO_786 ?AUTO_787 )
      ( MAKE-ON-VERIFY ?AUTO_786 ?AUTO_787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_796 - BLOCK
      ?AUTO_797 - BLOCK
    )
    :vars
    (
      ?AUTO_799 - BLOCK
      ?AUTO_802 - BLOCK
      ?AUTO_803 - BLOCK
      ?AUTO_801 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_797 ) ( ON-TABLE ?AUTO_796 ) ( ON ?AUTO_799 ?AUTO_796 ) ( ON ?AUTO_802 ?AUTO_799 ) ( ON ?AUTO_803 ?AUTO_802 ) ( CLEAR ?AUTO_803 ) ( HOLDING ?AUTO_801 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_801 )
      ( MAKE-ON ?AUTO_796 ?AUTO_797 )
      ( MAKE-ON-VERIFY ?AUTO_796 ?AUTO_797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_809 - BLOCK
      ?AUTO_810 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_809 ) ( CLEAR ?AUTO_810 ) )
    :subtasks
    ( ( !STACK ?AUTO_809 ?AUTO_810 )
      ( MAKE-ON-VERIFY ?AUTO_809 ?AUTO_810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_813 - BLOCK
      ?AUTO_814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_814 ) ( ON-TABLE ?AUTO_813 ) ( CLEAR ?AUTO_813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_813 )
      ( MAKE-ON ?AUTO_813 ?AUTO_814 )
      ( MAKE-ON-VERIFY ?AUTO_813 ?AUTO_814 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_818 - BLOCK
      ?AUTO_819 - BLOCK
    )
    :vars
    (
      ?AUTO_823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_818 ) ( CLEAR ?AUTO_818 ) ( HOLDING ?AUTO_819 ) ( CLEAR ?AUTO_823 ) )
    :subtasks
    ( ( !STACK ?AUTO_819 ?AUTO_823 )
      ( MAKE-ON ?AUTO_818 ?AUTO_819 )
      ( MAKE-ON-VERIFY ?AUTO_818 ?AUTO_819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_828 - BLOCK
      ?AUTO_829 - BLOCK
    )
    :vars
    (
      ?AUTO_830 - BLOCK
      ?AUTO_833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_828 ) ( CLEAR ?AUTO_828 ) ( CLEAR ?AUTO_830 ) ( ON ?AUTO_833 ?AUTO_829 ) ( CLEAR ?AUTO_833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_833 ?AUTO_829 )
      ( MAKE-ON ?AUTO_828 ?AUTO_829 )
      ( MAKE-ON-VERIFY ?AUTO_828 ?AUTO_829 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_836 - BLOCK
      ?AUTO_837 - BLOCK
    )
    :vars
    (
      ?AUTO_840 - BLOCK
      ?AUTO_841 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_840 ) ( ON ?AUTO_841 ?AUTO_837 ) ( CLEAR ?AUTO_841 ) ( HOLDING ?AUTO_836 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_836 )
      ( MAKE-ON ?AUTO_836 ?AUTO_837 )
      ( MAKE-ON-VERIFY ?AUTO_836 ?AUTO_837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_843 - BLOCK
      ?AUTO_844 - BLOCK
    )
    :vars
    (
      ?AUTO_847 - BLOCK
      ?AUTO_848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_847 ) ( ON ?AUTO_848 ?AUTO_844 ) ( ON ?AUTO_843 ?AUTO_848 ) ( CLEAR ?AUTO_843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_843 ?AUTO_848 )
      ( MAKE-ON ?AUTO_843 ?AUTO_844 )
      ( MAKE-ON-VERIFY ?AUTO_843 ?AUTO_844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_851 - BLOCK
      ?AUTO_852 - BLOCK
    )
    :vars
    (
      ?AUTO_853 - BLOCK
      ?AUTO_855 - BLOCK
      ?AUTO_857 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_853 ) ( ON ?AUTO_855 ?AUTO_852 ) ( ON ?AUTO_851 ?AUTO_855 ) ( CLEAR ?AUTO_851 ) ( HOLDING ?AUTO_857 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_857 )
      ( MAKE-ON ?AUTO_851 ?AUTO_852 )
      ( MAKE-ON-VERIFY ?AUTO_851 ?AUTO_852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_858 - BLOCK
      ?AUTO_859 - BLOCK
    )
    :vars
    (
      ?AUTO_860 - BLOCK
      ?AUTO_864 - BLOCK
      ?AUTO_863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_860 ) ( ON ?AUTO_864 ?AUTO_859 ) ( ON ?AUTO_858 ?AUTO_864 ) ( ON ?AUTO_863 ?AUTO_858 ) ( CLEAR ?AUTO_863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_863 ?AUTO_858 )
      ( MAKE-ON ?AUTO_858 ?AUTO_859 )
      ( MAKE-ON-VERIFY ?AUTO_858 ?AUTO_859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_867 - BLOCK
      ?AUTO_868 - BLOCK
    )
    :vars
    (
      ?AUTO_869 - BLOCK
      ?AUTO_870 - BLOCK
      ?AUTO_872 - BLOCK
      ?AUTO_874 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_869 ) ( ON ?AUTO_870 ?AUTO_868 ) ( ON ?AUTO_867 ?AUTO_870 ) ( ON ?AUTO_872 ?AUTO_867 ) ( CLEAR ?AUTO_872 ) ( HOLDING ?AUTO_874 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_874 )
      ( MAKE-ON ?AUTO_867 ?AUTO_868 )
      ( MAKE-ON-VERIFY ?AUTO_867 ?AUTO_868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_879 - BLOCK
      ?AUTO_880 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_879 ) ( CLEAR ?AUTO_880 ) )
    :subtasks
    ( ( !STACK ?AUTO_879 ?AUTO_880 )
      ( MAKE-ON-VERIFY ?AUTO_879 ?AUTO_880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_883 - BLOCK
      ?AUTO_884 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_884 ) ( ON-TABLE ?AUTO_883 ) ( CLEAR ?AUTO_883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_883 )
      ( MAKE-ON ?AUTO_883 ?AUTO_884 )
      ( MAKE-ON-VERIFY ?AUTO_883 ?AUTO_884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_888 - BLOCK
      ?AUTO_889 - BLOCK
    )
    :vars
    (
      ?AUTO_893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_888 ) ( CLEAR ?AUTO_888 ) ( HOLDING ?AUTO_889 ) ( CLEAR ?AUTO_893 ) )
    :subtasks
    ( ( !STACK ?AUTO_889 ?AUTO_893 )
      ( MAKE-ON ?AUTO_888 ?AUTO_889 )
      ( MAKE-ON-VERIFY ?AUTO_888 ?AUTO_889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_896 - BLOCK
      ?AUTO_897 - BLOCK
    )
    :vars
    (
      ?AUTO_900 - BLOCK
      ?AUTO_901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_897 ) ( ON-TABLE ?AUTO_896 ) ( CLEAR ?AUTO_896 ) ( HOLDING ?AUTO_900 ) ( CLEAR ?AUTO_901 ) )
    :subtasks
    ( ( !STACK ?AUTO_900 ?AUTO_901 )
      ( MAKE-ON ?AUTO_896 ?AUTO_897 )
      ( MAKE-ON-VERIFY ?AUTO_896 ?AUTO_897 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_903 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_903 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_903 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_903 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_905 - BLOCK
    )
    :vars
    (
      ?AUTO_908 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_905 ?AUTO_908 ) ( CLEAR ?AUTO_905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_905 ?AUTO_908 )
      ( MAKE-ON-TABLE ?AUTO_905 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_905 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_910 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_910 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_910 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_910 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_912 - BLOCK
    )
    :vars
    (
      ?AUTO_915 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_912 ?AUTO_915 ) ( CLEAR ?AUTO_912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_912 ?AUTO_915 )
      ( MAKE-ON-TABLE ?AUTO_912 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_912 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_916 - BLOCK
    )
    :vars
    (
      ?AUTO_918 - BLOCK
      ?AUTO_919 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_916 ?AUTO_918 ) ( CLEAR ?AUTO_916 ) ( HOLDING ?AUTO_919 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_919 )
      ( MAKE-ON-TABLE ?AUTO_916 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_916 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_922 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_922 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_922 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_922 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_924 - BLOCK
    )
    :vars
    (
      ?AUTO_927 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_924 ?AUTO_927 ) ( CLEAR ?AUTO_924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_924 ?AUTO_927 )
      ( MAKE-ON-TABLE ?AUTO_924 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_924 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_928 - BLOCK
    )
    :vars
    (
      ?AUTO_930 - BLOCK
      ?AUTO_931 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_928 ?AUTO_930 ) ( CLEAR ?AUTO_928 ) ( HOLDING ?AUTO_931 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_931 )
      ( MAKE-ON-TABLE ?AUTO_928 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_928 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_932 - BLOCK
    )
    :vars
    (
      ?AUTO_933 - BLOCK
      ?AUTO_935 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_932 ?AUTO_933 ) ( ON ?AUTO_935 ?AUTO_932 ) ( CLEAR ?AUTO_935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_935 ?AUTO_932 )
      ( MAKE-ON-TABLE ?AUTO_932 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_932 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_938 - BLOCK
    )
    :vars
    (
      ?AUTO_941 - BLOCK
      ?AUTO_939 - BLOCK
      ?AUTO_942 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_938 ?AUTO_941 ) ( ON ?AUTO_939 ?AUTO_938 ) ( CLEAR ?AUTO_939 ) ( HOLDING ?AUTO_942 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_942 )
      ( MAKE-ON-TABLE ?AUTO_938 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_946 - BLOCK
      ?AUTO_947 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_946 ) ( CLEAR ?AUTO_947 ) )
    :subtasks
    ( ( !STACK ?AUTO_946 ?AUTO_947 )
      ( MAKE-ON-VERIFY ?AUTO_946 ?AUTO_947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_950 - BLOCK
      ?AUTO_951 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_951 ) ( ON-TABLE ?AUTO_950 ) ( CLEAR ?AUTO_950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_950 )
      ( MAKE-ON ?AUTO_950 ?AUTO_951 )
      ( MAKE-ON-VERIFY ?AUTO_950 ?AUTO_951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_955 - BLOCK
      ?AUTO_956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_955 ) ( CLEAR ?AUTO_955 ) ( HOLDING ?AUTO_956 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_956 )
      ( MAKE-ON ?AUTO_955 ?AUTO_956 )
      ( MAKE-ON-VERIFY ?AUTO_955 ?AUTO_956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_962 - BLOCK
      ?AUTO_963 - BLOCK
    )
    :vars
    (
      ?AUTO_966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_963 ) ( ON-TABLE ?AUTO_962 ) ( CLEAR ?AUTO_962 ) ( HOLDING ?AUTO_966 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_966 )
      ( MAKE-ON ?AUTO_962 ?AUTO_963 )
      ( MAKE-ON-VERIFY ?AUTO_962 ?AUTO_963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_967 - BLOCK
      ?AUTO_968 - BLOCK
    )
    :vars
    (
      ?AUTO_971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_967 ) ( CLEAR ?AUTO_967 ) ( ON ?AUTO_971 ?AUTO_968 ) ( CLEAR ?AUTO_971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_971 ?AUTO_968 )
      ( MAKE-ON ?AUTO_967 ?AUTO_968 )
      ( MAKE-ON-VERIFY ?AUTO_967 ?AUTO_968 ) )
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
      ?AUTO_979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_974 ) ( CLEAR ?AUTO_974 ) ( ON ?AUTO_976 ?AUTO_975 ) ( CLEAR ?AUTO_976 ) ( HOLDING ?AUTO_979 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_979 )
      ( MAKE-ON ?AUTO_974 ?AUTO_975 )
      ( MAKE-ON-VERIFY ?AUTO_974 ?AUTO_975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_984 - BLOCK
      ?AUTO_985 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_984 ) ( CLEAR ?AUTO_985 ) )
    :subtasks
    ( ( !STACK ?AUTO_984 ?AUTO_985 )
      ( MAKE-ON-VERIFY ?AUTO_984 ?AUTO_985 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_989 ) ( ON ?AUTO_988 ?AUTO_993 ) ( CLEAR ?AUTO_988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_988 ?AUTO_993 )
      ( MAKE-ON ?AUTO_988 ?AUTO_989 )
      ( MAKE-ON-VERIFY ?AUTO_988 ?AUTO_989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_994 - BLOCK
      ?AUTO_995 - BLOCK
    )
    :vars
    (
      ?AUTO_998 - BLOCK
      ?AUTO_1000 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_994 ?AUTO_998 ) ( CLEAR ?AUTO_994 ) ( HOLDING ?AUTO_995 ) ( CLEAR ?AUTO_1000 ) )
    :subtasks
    ( ( !STACK ?AUTO_995 ?AUTO_1000 )
      ( MAKE-ON ?AUTO_994 ?AUTO_995 )
      ( MAKE-ON-VERIFY ?AUTO_994 ?AUTO_995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1003 - BLOCK
      ?AUTO_1004 - BLOCK
    )
    :vars
    (
      ?AUTO_1005 - BLOCK
      ?AUTO_1008 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1004 ) ( ON ?AUTO_1003 ?AUTO_1005 ) ( CLEAR ?AUTO_1003 ) ( HOLDING ?AUTO_1008 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1008 )
      ( MAKE-ON ?AUTO_1003 ?AUTO_1004 )
      ( MAKE-ON-VERIFY ?AUTO_1003 ?AUTO_1004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1009 - BLOCK
      ?AUTO_1010 - BLOCK
    )
    :vars
    (
      ?AUTO_1013 - BLOCK
      ?AUTO_1014 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1010 ) ( ON ?AUTO_1009 ?AUTO_1013 ) ( ON ?AUTO_1014 ?AUTO_1009 ) ( CLEAR ?AUTO_1014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1014 ?AUTO_1009 )
      ( MAKE-ON ?AUTO_1009 ?AUTO_1010 )
      ( MAKE-ON-VERIFY ?AUTO_1009 ?AUTO_1010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1017 - BLOCK
      ?AUTO_1018 - BLOCK
    )
    :vars
    (
      ?AUTO_1019 - BLOCK
      ?AUTO_1022 - BLOCK
      ?AUTO_1023 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1018 ) ( ON ?AUTO_1017 ?AUTO_1019 ) ( ON ?AUTO_1022 ?AUTO_1017 ) ( CLEAR ?AUTO_1022 ) ( HOLDING ?AUTO_1023 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1023 )
      ( MAKE-ON ?AUTO_1017 ?AUTO_1018 )
      ( MAKE-ON-VERIFY ?AUTO_1017 ?AUTO_1018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1024 - BLOCK
      ?AUTO_1025 - BLOCK
    )
    :vars
    (
      ?AUTO_1026 - BLOCK
      ?AUTO_1027 - BLOCK
      ?AUTO_1030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1025 ) ( ON ?AUTO_1024 ?AUTO_1026 ) ( ON ?AUTO_1027 ?AUTO_1024 ) ( ON ?AUTO_1030 ?AUTO_1027 ) ( CLEAR ?AUTO_1030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1030 ?AUTO_1027 )
      ( MAKE-ON ?AUTO_1024 ?AUTO_1025 )
      ( MAKE-ON-VERIFY ?AUTO_1024 ?AUTO_1025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1033 - BLOCK
      ?AUTO_1034 - BLOCK
    )
    :vars
    (
      ?AUTO_1037 - BLOCK
      ?AUTO_1035 - BLOCK
      ?AUTO_1036 - BLOCK
      ?AUTO_1040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1034 ) ( ON ?AUTO_1033 ?AUTO_1037 ) ( ON ?AUTO_1035 ?AUTO_1033 ) ( ON ?AUTO_1036 ?AUTO_1035 ) ( CLEAR ?AUTO_1036 ) ( HOLDING ?AUTO_1040 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1040 )
      ( MAKE-ON ?AUTO_1033 ?AUTO_1034 )
      ( MAKE-ON-VERIFY ?AUTO_1033 ?AUTO_1034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1045 - BLOCK
      ?AUTO_1046 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1045 ) ( CLEAR ?AUTO_1046 ) )
    :subtasks
    ( ( !STACK ?AUTO_1045 ?AUTO_1046 )
      ( MAKE-ON-VERIFY ?AUTO_1045 ?AUTO_1046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1049 - BLOCK
      ?AUTO_1050 - BLOCK
    )
    :vars
    (
      ?AUTO_1054 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1050 ) ( ON ?AUTO_1049 ?AUTO_1054 ) ( CLEAR ?AUTO_1049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1049 ?AUTO_1054 )
      ( MAKE-ON ?AUTO_1049 ?AUTO_1050 )
      ( MAKE-ON-VERIFY ?AUTO_1049 ?AUTO_1050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1055 - BLOCK
      ?AUTO_1056 - BLOCK
    )
    :vars
    (
      ?AUTO_1059 - BLOCK
      ?AUTO_1060 - BLOCK
      ?AUTO_1061 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1056 ) ( ON ?AUTO_1055 ?AUTO_1059 ) ( CLEAR ?AUTO_1055 ) ( HOLDING ?AUTO_1060 ) ( CLEAR ?AUTO_1061 ) )
    :subtasks
    ( ( !STACK ?AUTO_1060 ?AUTO_1061 )
      ( MAKE-ON ?AUTO_1055 ?AUTO_1056 )
      ( MAKE-ON-VERIFY ?AUTO_1055 ?AUTO_1056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1062 - BLOCK
      ?AUTO_1063 - BLOCK
    )
    :vars
    (
      ?AUTO_1066 - BLOCK
      ?AUTO_1068 - BLOCK
      ?AUTO_1067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1063 ) ( ON ?AUTO_1062 ?AUTO_1066 ) ( CLEAR ?AUTO_1068 ) ( ON ?AUTO_1067 ?AUTO_1062 ) ( CLEAR ?AUTO_1067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1067 ?AUTO_1062 )
      ( MAKE-ON ?AUTO_1062 ?AUTO_1063 )
      ( MAKE-ON-VERIFY ?AUTO_1062 ?AUTO_1063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1071 - BLOCK
      ?AUTO_1072 - BLOCK
    )
    :vars
    (
      ?AUTO_1077 - BLOCK
      ?AUTO_1073 - BLOCK
      ?AUTO_1074 - BLOCK
      ?AUTO_1079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1072 ) ( ON ?AUTO_1071 ?AUTO_1077 ) ( ON ?AUTO_1073 ?AUTO_1071 ) ( CLEAR ?AUTO_1073 ) ( HOLDING ?AUTO_1074 ) ( CLEAR ?AUTO_1079 ) )
    :subtasks
    ( ( !STACK ?AUTO_1074 ?AUTO_1079 )
      ( MAKE-ON ?AUTO_1071 ?AUTO_1072 )
      ( MAKE-ON-VERIFY ?AUTO_1071 ?AUTO_1072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1084 - BLOCK
      ?AUTO_1085 - BLOCK
    )
    :vars
    (
      ?AUTO_1091 - BLOCK
      ?AUTO_1086 - BLOCK
      ?AUTO_1090 - BLOCK
      ?AUTO_1088 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1085 ) ( ON ?AUTO_1084 ?AUTO_1091 ) ( ON ?AUTO_1086 ?AUTO_1084 ) ( CLEAR ?AUTO_1090 ) ( ON ?AUTO_1088 ?AUTO_1086 ) ( CLEAR ?AUTO_1088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1088 ?AUTO_1086 )
      ( MAKE-ON ?AUTO_1084 ?AUTO_1085 )
      ( MAKE-ON-VERIFY ?AUTO_1084 ?AUTO_1085 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1094 - BLOCK
      ?AUTO_1095 - BLOCK
    )
    :vars
    (
      ?AUTO_1099 - BLOCK
      ?AUTO_1100 - BLOCK
      ?AUTO_1101 - BLOCK
      ?AUTO_1098 - BLOCK
      ?AUTO_1102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1095 ) ( ON ?AUTO_1094 ?AUTO_1099 ) ( ON ?AUTO_1100 ?AUTO_1094 ) ( CLEAR ?AUTO_1101 ) ( ON ?AUTO_1098 ?AUTO_1100 ) ( CLEAR ?AUTO_1098 ) ( HOLDING ?AUTO_1102 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1102 )
      ( MAKE-ON ?AUTO_1094 ?AUTO_1095 )
      ( MAKE-ON-VERIFY ?AUTO_1094 ?AUTO_1095 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1103 - BLOCK
      ?AUTO_1104 - BLOCK
    )
    :vars
    (
      ?AUTO_1107 - BLOCK
      ?AUTO_1105 - BLOCK
      ?AUTO_1109 - BLOCK
      ?AUTO_1111 - BLOCK
      ?AUTO_1110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1104 ) ( ON ?AUTO_1103 ?AUTO_1107 ) ( ON ?AUTO_1105 ?AUTO_1103 ) ( CLEAR ?AUTO_1109 ) ( ON ?AUTO_1111 ?AUTO_1105 ) ( ON ?AUTO_1110 ?AUTO_1111 ) ( CLEAR ?AUTO_1110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1110 ?AUTO_1111 )
      ( MAKE-ON ?AUTO_1103 ?AUTO_1104 )
      ( MAKE-ON-VERIFY ?AUTO_1103 ?AUTO_1104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1114 - BLOCK
      ?AUTO_1115 - BLOCK
    )
    :vars
    (
      ?AUTO_1117 - BLOCK
      ?AUTO_1122 - BLOCK
      ?AUTO_1120 - BLOCK
      ?AUTO_1121 - BLOCK
      ?AUTO_1119 - BLOCK
      ?AUTO_1123 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1115 ) ( ON ?AUTO_1114 ?AUTO_1117 ) ( ON ?AUTO_1122 ?AUTO_1114 ) ( CLEAR ?AUTO_1120 ) ( ON ?AUTO_1121 ?AUTO_1122 ) ( ON ?AUTO_1119 ?AUTO_1121 ) ( CLEAR ?AUTO_1119 ) ( HOLDING ?AUTO_1123 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1123 )
      ( MAKE-ON ?AUTO_1114 ?AUTO_1115 )
      ( MAKE-ON-VERIFY ?AUTO_1114 ?AUTO_1115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1124 - BLOCK
      ?AUTO_1125 - BLOCK
    )
    :vars
    (
      ?AUTO_1128 - BLOCK
      ?AUTO_1133 - BLOCK
      ?AUTO_1126 - BLOCK
      ?AUTO_1127 - BLOCK
      ?AUTO_1132 - BLOCK
      ?AUTO_1129 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1124 ?AUTO_1128 ) ( ON ?AUTO_1133 ?AUTO_1124 ) ( CLEAR ?AUTO_1126 ) ( ON ?AUTO_1127 ?AUTO_1133 ) ( ON ?AUTO_1132 ?AUTO_1127 ) ( CLEAR ?AUTO_1132 ) ( ON ?AUTO_1129 ?AUTO_1125 ) ( CLEAR ?AUTO_1129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1129 ?AUTO_1125 )
      ( MAKE-ON ?AUTO_1124 ?AUTO_1125 )
      ( MAKE-ON-VERIFY ?AUTO_1124 ?AUTO_1125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1138 - BLOCK
      ?AUTO_1139 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1138 ) ( CLEAR ?AUTO_1139 ) )
    :subtasks
    ( ( !STACK ?AUTO_1138 ?AUTO_1139 )
      ( MAKE-ON-VERIFY ?AUTO_1138 ?AUTO_1139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1142 - BLOCK
      ?AUTO_1143 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1143 ) ( ON-TABLE ?AUTO_1142 ) ( CLEAR ?AUTO_1142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1142 )
      ( MAKE-ON ?AUTO_1142 ?AUTO_1143 )
      ( MAKE-ON-VERIFY ?AUTO_1142 ?AUTO_1143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1147 - BLOCK
      ?AUTO_1148 - BLOCK
    )
    :vars
    (
      ?AUTO_1151 - BLOCK
      ?AUTO_1152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1148 ) ( ON-TABLE ?AUTO_1147 ) ( CLEAR ?AUTO_1147 ) ( HOLDING ?AUTO_1151 ) ( CLEAR ?AUTO_1152 ) )
    :subtasks
    ( ( !STACK ?AUTO_1151 ?AUTO_1152 )
      ( MAKE-ON ?AUTO_1147 ?AUTO_1148 )
      ( MAKE-ON-VERIFY ?AUTO_1147 ?AUTO_1148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1153 - BLOCK
      ?AUTO_1154 - BLOCK
    )
    :vars
    (
      ?AUTO_1156 - BLOCK
      ?AUTO_1158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1154 ) ( ON-TABLE ?AUTO_1153 ) ( CLEAR ?AUTO_1156 ) ( ON ?AUTO_1158 ?AUTO_1153 ) ( CLEAR ?AUTO_1158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1158 ?AUTO_1153 )
      ( MAKE-ON ?AUTO_1153 ?AUTO_1154 )
      ( MAKE-ON-VERIFY ?AUTO_1153 ?AUTO_1154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1161 - BLOCK
      ?AUTO_1162 - BLOCK
    )
    :vars
    (
      ?AUTO_1165 - BLOCK
      ?AUTO_1166 - BLOCK
      ?AUTO_1167 - BLOCK
      ?AUTO_1168 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1162 ) ( ON-TABLE ?AUTO_1161 ) ( CLEAR ?AUTO_1165 ) ( ON ?AUTO_1166 ?AUTO_1161 ) ( CLEAR ?AUTO_1166 ) ( HOLDING ?AUTO_1167 ) ( CLEAR ?AUTO_1168 ) )
    :subtasks
    ( ( !STACK ?AUTO_1167 ?AUTO_1168 )
      ( MAKE-ON ?AUTO_1161 ?AUTO_1162 )
      ( MAKE-ON-VERIFY ?AUTO_1161 ?AUTO_1162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1169 - BLOCK
      ?AUTO_1170 - BLOCK
    )
    :vars
    (
      ?AUTO_1175 - BLOCK
      ?AUTO_1174 - BLOCK
      ?AUTO_1171 - BLOCK
      ?AUTO_1176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1170 ) ( ON-TABLE ?AUTO_1169 ) ( CLEAR ?AUTO_1175 ) ( ON ?AUTO_1174 ?AUTO_1169 ) ( CLEAR ?AUTO_1171 ) ( ON ?AUTO_1176 ?AUTO_1174 ) ( CLEAR ?AUTO_1176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1176 ?AUTO_1174 )
      ( MAKE-ON ?AUTO_1169 ?AUTO_1170 )
      ( MAKE-ON-VERIFY ?AUTO_1169 ?AUTO_1170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1179 - BLOCK
      ?AUTO_1180 - BLOCK
    )
    :vars
    (
      ?AUTO_1184 - BLOCK
      ?AUTO_1186 - BLOCK
      ?AUTO_1183 - BLOCK
      ?AUTO_1185 - BLOCK
      ?AUTO_1188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1180 ) ( ON-TABLE ?AUTO_1179 ) ( CLEAR ?AUTO_1184 ) ( ON ?AUTO_1186 ?AUTO_1179 ) ( ON ?AUTO_1183 ?AUTO_1186 ) ( CLEAR ?AUTO_1183 ) ( HOLDING ?AUTO_1185 ) ( CLEAR ?AUTO_1188 ) )
    :subtasks
    ( ( !STACK ?AUTO_1185 ?AUTO_1188 )
      ( MAKE-ON ?AUTO_1179 ?AUTO_1180 )
      ( MAKE-ON-VERIFY ?AUTO_1179 ?AUTO_1180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1193 - BLOCK
      ?AUTO_1194 - BLOCK
    )
    :vars
    (
      ?AUTO_1201 - BLOCK
      ?AUTO_1196 - BLOCK
      ?AUTO_1198 - BLOCK
      ?AUTO_1200 - BLOCK
      ?AUTO_1197 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1194 ) ( ON-TABLE ?AUTO_1193 ) ( CLEAR ?AUTO_1201 ) ( ON ?AUTO_1196 ?AUTO_1193 ) ( ON ?AUTO_1198 ?AUTO_1196 ) ( CLEAR ?AUTO_1200 ) ( ON ?AUTO_1197 ?AUTO_1198 ) ( CLEAR ?AUTO_1197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1197 ?AUTO_1198 )
      ( MAKE-ON ?AUTO_1193 ?AUTO_1194 )
      ( MAKE-ON-VERIFY ?AUTO_1193 ?AUTO_1194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1204 - BLOCK
      ?AUTO_1205 - BLOCK
    )
    :vars
    (
      ?AUTO_1212 - BLOCK
      ?AUTO_1210 - BLOCK
      ?AUTO_1208 - BLOCK
      ?AUTO_1209 - BLOCK
      ?AUTO_1211 - BLOCK
      ?AUTO_1213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1205 ) ( ON-TABLE ?AUTO_1204 ) ( CLEAR ?AUTO_1212 ) ( ON ?AUTO_1210 ?AUTO_1204 ) ( ON ?AUTO_1208 ?AUTO_1210 ) ( CLEAR ?AUTO_1209 ) ( ON ?AUTO_1211 ?AUTO_1208 ) ( CLEAR ?AUTO_1211 ) ( HOLDING ?AUTO_1213 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1213 )
      ( MAKE-ON ?AUTO_1204 ?AUTO_1205 )
      ( MAKE-ON-VERIFY ?AUTO_1204 ?AUTO_1205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1214 - BLOCK
      ?AUTO_1215 - BLOCK
    )
    :vars
    (
      ?AUTO_1223 - BLOCK
      ?AUTO_1220 - BLOCK
      ?AUTO_1219 - BLOCK
      ?AUTO_1217 - BLOCK
      ?AUTO_1221 - BLOCK
      ?AUTO_1222 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1215 ) ( ON-TABLE ?AUTO_1214 ) ( CLEAR ?AUTO_1223 ) ( ON ?AUTO_1220 ?AUTO_1214 ) ( ON ?AUTO_1219 ?AUTO_1220 ) ( CLEAR ?AUTO_1217 ) ( ON ?AUTO_1221 ?AUTO_1219 ) ( ON ?AUTO_1222 ?AUTO_1221 ) ( CLEAR ?AUTO_1222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1222 ?AUTO_1221 )
      ( MAKE-ON ?AUTO_1214 ?AUTO_1215 )
      ( MAKE-ON-VERIFY ?AUTO_1214 ?AUTO_1215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1226 - BLOCK
      ?AUTO_1227 - BLOCK
    )
    :vars
    (
      ?AUTO_1230 - BLOCK
      ?AUTO_1233 - BLOCK
      ?AUTO_1231 - BLOCK
      ?AUTO_1229 - BLOCK
      ?AUTO_1235 - BLOCK
      ?AUTO_1232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1226 ) ( CLEAR ?AUTO_1230 ) ( ON ?AUTO_1233 ?AUTO_1226 ) ( ON ?AUTO_1231 ?AUTO_1233 ) ( CLEAR ?AUTO_1229 ) ( ON ?AUTO_1235 ?AUTO_1231 ) ( ON ?AUTO_1232 ?AUTO_1235 ) ( CLEAR ?AUTO_1232 ) ( HOLDING ?AUTO_1227 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1227 )
      ( MAKE-ON ?AUTO_1226 ?AUTO_1227 )
      ( MAKE-ON-VERIFY ?AUTO_1226 ?AUTO_1227 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1240 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1240 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1240 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1240 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1242 - BLOCK
    )
    :vars
    (
      ?AUTO_1245 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1242 ?AUTO_1245 ) ( CLEAR ?AUTO_1242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1242 ?AUTO_1245 )
      ( MAKE-ON-TABLE ?AUTO_1242 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1242 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1246 - BLOCK
    )
    :vars
    (
      ?AUTO_1248 - BLOCK
      ?AUTO_1249 - BLOCK
      ?AUTO_1250 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1246 ?AUTO_1248 ) ( CLEAR ?AUTO_1246 ) ( HOLDING ?AUTO_1249 ) ( CLEAR ?AUTO_1250 ) )
    :subtasks
    ( ( !STACK ?AUTO_1249 ?AUTO_1250 )
      ( MAKE-ON-TABLE ?AUTO_1246 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1246 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1259 - BLOCK
    )
    :vars
    (
      ?AUTO_1261 - BLOCK
      ?AUTO_1263 - BLOCK
      ?AUTO_1260 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1259 ?AUTO_1261 ) ( CLEAR ?AUTO_1263 ) ( ON ?AUTO_1260 ?AUTO_1259 ) ( CLEAR ?AUTO_1260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1260 ?AUTO_1259 )
      ( MAKE-ON-TABLE ?AUTO_1259 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1259 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1266 - BLOCK
    )
    :vars
    (
      ?AUTO_1268 - BLOCK
      ?AUTO_1270 - BLOCK
      ?AUTO_1269 - BLOCK
      ?AUTO_1271 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1266 ?AUTO_1268 ) ( CLEAR ?AUTO_1270 ) ( ON ?AUTO_1269 ?AUTO_1266 ) ( CLEAR ?AUTO_1269 ) ( HOLDING ?AUTO_1271 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1271 )
      ( MAKE-ON-TABLE ?AUTO_1266 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1266 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1272 - BLOCK
    )
    :vars
    (
      ?AUTO_1273 - BLOCK
      ?AUTO_1276 - BLOCK
      ?AUTO_1277 - BLOCK
      ?AUTO_1275 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1272 ?AUTO_1273 ) ( CLEAR ?AUTO_1276 ) ( ON ?AUTO_1277 ?AUTO_1272 ) ( ON ?AUTO_1275 ?AUTO_1277 ) ( CLEAR ?AUTO_1275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1275 ?AUTO_1277 )
      ( MAKE-ON-TABLE ?AUTO_1272 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1272 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1280 - BLOCK
    )
    :vars
    (
      ?AUTO_1281 - BLOCK
      ?AUTO_1282 - BLOCK
      ?AUTO_1284 - BLOCK
      ?AUTO_1285 - BLOCK
      ?AUTO_1286 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1280 ?AUTO_1281 ) ( CLEAR ?AUTO_1282 ) ( ON ?AUTO_1284 ?AUTO_1280 ) ( ON ?AUTO_1285 ?AUTO_1284 ) ( CLEAR ?AUTO_1285 ) ( HOLDING ?AUTO_1286 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1286 )
      ( MAKE-ON-TABLE ?AUTO_1280 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1290 - BLOCK
      ?AUTO_1291 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1290 ) ( CLEAR ?AUTO_1291 ) )
    :subtasks
    ( ( !STACK ?AUTO_1290 ?AUTO_1291 )
      ( MAKE-ON-VERIFY ?AUTO_1290 ?AUTO_1291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1294 - BLOCK
      ?AUTO_1295 - BLOCK
    )
    :vars
    (
      ?AUTO_1299 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1295 ) ( ON ?AUTO_1294 ?AUTO_1299 ) ( CLEAR ?AUTO_1294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1294 ?AUTO_1299 )
      ( MAKE-ON ?AUTO_1294 ?AUTO_1295 )
      ( MAKE-ON-VERIFY ?AUTO_1294 ?AUTO_1295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1300 - BLOCK
      ?AUTO_1301 - BLOCK
    )
    :vars
    (
      ?AUTO_1304 - BLOCK
      ?AUTO_1305 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1301 ) ( ON ?AUTO_1300 ?AUTO_1304 ) ( CLEAR ?AUTO_1300 ) ( HOLDING ?AUTO_1305 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1305 )
      ( MAKE-ON ?AUTO_1300 ?AUTO_1301 )
      ( MAKE-ON-VERIFY ?AUTO_1300 ?AUTO_1301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1306 - BLOCK
      ?AUTO_1307 - BLOCK
    )
    :vars
    (
      ?AUTO_1310 - BLOCK
      ?AUTO_1311 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1307 ) ( ON ?AUTO_1306 ?AUTO_1310 ) ( ON ?AUTO_1311 ?AUTO_1306 ) ( CLEAR ?AUTO_1311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1311 ?AUTO_1306 )
      ( MAKE-ON ?AUTO_1306 ?AUTO_1307 )
      ( MAKE-ON-VERIFY ?AUTO_1306 ?AUTO_1307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1314 - BLOCK
      ?AUTO_1315 - BLOCK
    )
    :vars
    (
      ?AUTO_1319 - BLOCK
      ?AUTO_1316 - BLOCK
      ?AUTO_1320 - BLOCK
      ?AUTO_1321 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1315 ) ( ON ?AUTO_1314 ?AUTO_1319 ) ( ON ?AUTO_1316 ?AUTO_1314 ) ( CLEAR ?AUTO_1316 ) ( HOLDING ?AUTO_1320 ) ( CLEAR ?AUTO_1321 ) )
    :subtasks
    ( ( !STACK ?AUTO_1320 ?AUTO_1321 )
      ( MAKE-ON ?AUTO_1314 ?AUTO_1315 )
      ( MAKE-ON-VERIFY ?AUTO_1314 ?AUTO_1315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1324 - BLOCK
      ?AUTO_1325 - BLOCK
    )
    :vars
    (
      ?AUTO_1329 - BLOCK
      ?AUTO_1326 - BLOCK
      ?AUTO_1331 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1324 ?AUTO_1329 ) ( ON ?AUTO_1326 ?AUTO_1324 ) ( CLEAR ?AUTO_1326 ) ( HOLDING ?AUTO_1325 ) ( CLEAR ?AUTO_1331 ) )
    :subtasks
    ( ( !STACK ?AUTO_1325 ?AUTO_1331 )
      ( MAKE-ON ?AUTO_1324 ?AUTO_1325 )
      ( MAKE-ON-VERIFY ?AUTO_1324 ?AUTO_1325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1336 - BLOCK
      ?AUTO_1337 - BLOCK
    )
    :vars
    (
      ?AUTO_1341 - BLOCK
      ?AUTO_1339 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1336 ?AUTO_1341 ) ( CLEAR ?AUTO_1336 ) ( ON ?AUTO_1339 ?AUTO_1337 ) ( CLEAR ?AUTO_1339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1339 ?AUTO_1337 )
      ( MAKE-ON ?AUTO_1336 ?AUTO_1337 )
      ( MAKE-ON-VERIFY ?AUTO_1336 ?AUTO_1337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1344 - BLOCK
      ?AUTO_1345 - BLOCK
    )
    :vars
    (
      ?AUTO_1348 - BLOCK
      ?AUTO_1349 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1348 ?AUTO_1345 ) ( CLEAR ?AUTO_1348 ) ( HOLDING ?AUTO_1344 ) ( CLEAR ?AUTO_1349 ) )
    :subtasks
    ( ( !STACK ?AUTO_1344 ?AUTO_1349 )
      ( MAKE-ON ?AUTO_1344 ?AUTO_1345 )
      ( MAKE-ON-VERIFY ?AUTO_1344 ?AUTO_1345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1352 - BLOCK
      ?AUTO_1353 - BLOCK
    )
    :vars
    (
      ?AUTO_1356 - BLOCK
      ?AUTO_1357 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1356 ?AUTO_1353 ) ( CLEAR ?AUTO_1356 ) ( CLEAR ?AUTO_1357 ) ( ON-TABLE ?AUTO_1352 ) ( CLEAR ?AUTO_1352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1352 )
      ( MAKE-ON ?AUTO_1352 ?AUTO_1353 )
      ( MAKE-ON-VERIFY ?AUTO_1352 ?AUTO_1353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1359 - BLOCK
      ?AUTO_1360 - BLOCK
    )
    :vars
    (
      ?AUTO_1364 - BLOCK
      ?AUTO_1361 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1364 ?AUTO_1360 ) ( CLEAR ?AUTO_1364 ) ( ON-TABLE ?AUTO_1359 ) ( CLEAR ?AUTO_1359 ) ( HOLDING ?AUTO_1361 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1361 )
      ( MAKE-ON ?AUTO_1359 ?AUTO_1360 )
      ( MAKE-ON-VERIFY ?AUTO_1359 ?AUTO_1360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1366 - BLOCK
      ?AUTO_1367 - BLOCK
    )
    :vars
    (
      ?AUTO_1371 - BLOCK
      ?AUTO_1369 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1371 ?AUTO_1367 ) ( ON-TABLE ?AUTO_1366 ) ( CLEAR ?AUTO_1366 ) ( ON ?AUTO_1369 ?AUTO_1371 ) ( CLEAR ?AUTO_1369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1369 ?AUTO_1371 )
      ( MAKE-ON ?AUTO_1366 ?AUTO_1367 )
      ( MAKE-ON-VERIFY ?AUTO_1366 ?AUTO_1367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1374 - BLOCK
      ?AUTO_1375 - BLOCK
    )
    :vars
    (
      ?AUTO_1379 - BLOCK
      ?AUTO_1377 - BLOCK
      ?AUTO_1380 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1379 ?AUTO_1375 ) ( ON-TABLE ?AUTO_1374 ) ( CLEAR ?AUTO_1374 ) ( ON ?AUTO_1377 ?AUTO_1379 ) ( CLEAR ?AUTO_1377 ) ( HOLDING ?AUTO_1380 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1380 )
      ( MAKE-ON ?AUTO_1374 ?AUTO_1375 )
      ( MAKE-ON-VERIFY ?AUTO_1374 ?AUTO_1375 ) )
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
    ( and ( ON ?AUTO_1383 ?AUTO_1382 ) ( ON-TABLE ?AUTO_1381 ) ( CLEAR ?AUTO_1381 ) ( ON ?AUTO_1386 ?AUTO_1383 ) ( ON ?AUTO_1387 ?AUTO_1386 ) ( CLEAR ?AUTO_1387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1387 ?AUTO_1386 )
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
      ?AUTO_1392 - BLOCK
      ?AUTO_1395 - BLOCK
      ?AUTO_1394 - BLOCK
      ?AUTO_1397 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1392 ?AUTO_1391 ) ( ON-TABLE ?AUTO_1390 ) ( CLEAR ?AUTO_1390 ) ( ON ?AUTO_1395 ?AUTO_1392 ) ( ON ?AUTO_1394 ?AUTO_1395 ) ( CLEAR ?AUTO_1394 ) ( HOLDING ?AUTO_1397 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1397 )
      ( MAKE-ON ?AUTO_1390 ?AUTO_1391 )
      ( MAKE-ON-VERIFY ?AUTO_1390 ?AUTO_1391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1402 - BLOCK
      ?AUTO_1403 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1402 ) ( CLEAR ?AUTO_1403 ) )
    :subtasks
    ( ( !STACK ?AUTO_1402 ?AUTO_1403 )
      ( MAKE-ON-VERIFY ?AUTO_1402 ?AUTO_1403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1406 - BLOCK
      ?AUTO_1407 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1407 ) ( ON-TABLE ?AUTO_1406 ) ( CLEAR ?AUTO_1406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1406 )
      ( MAKE-ON ?AUTO_1406 ?AUTO_1407 )
      ( MAKE-ON-VERIFY ?AUTO_1406 ?AUTO_1407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1411 - BLOCK
      ?AUTO_1412 - BLOCK
    )
    :vars
    (
      ?AUTO_1415 - BLOCK
      ?AUTO_1416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1412 ) ( ON-TABLE ?AUTO_1411 ) ( CLEAR ?AUTO_1411 ) ( HOLDING ?AUTO_1415 ) ( CLEAR ?AUTO_1416 ) )
    :subtasks
    ( ( !STACK ?AUTO_1415 ?AUTO_1416 )
      ( MAKE-ON ?AUTO_1411 ?AUTO_1412 )
      ( MAKE-ON-VERIFY ?AUTO_1411 ?AUTO_1412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1417 - BLOCK
      ?AUTO_1418 - BLOCK
    )
    :vars
    (
      ?AUTO_1422 - BLOCK
      ?AUTO_1421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1418 ) ( ON-TABLE ?AUTO_1417 ) ( CLEAR ?AUTO_1422 ) ( ON ?AUTO_1421 ?AUTO_1417 ) ( CLEAR ?AUTO_1421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1421 ?AUTO_1417 )
      ( MAKE-ON ?AUTO_1417 ?AUTO_1418 )
      ( MAKE-ON-VERIFY ?AUTO_1417 ?AUTO_1418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1425 - BLOCK
      ?AUTO_1426 - BLOCK
    )
    :vars
    (
      ?AUTO_1427 - BLOCK
      ?AUTO_1428 - BLOCK
      ?AUTO_1431 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1426 ) ( ON-TABLE ?AUTO_1425 ) ( CLEAR ?AUTO_1427 ) ( ON ?AUTO_1428 ?AUTO_1425 ) ( CLEAR ?AUTO_1428 ) ( HOLDING ?AUTO_1431 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1431 )
      ( MAKE-ON ?AUTO_1425 ?AUTO_1426 )
      ( MAKE-ON-VERIFY ?AUTO_1425 ?AUTO_1426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1432 - BLOCK
      ?AUTO_1433 - BLOCK
    )
    :vars
    (
      ?AUTO_1436 - BLOCK
      ?AUTO_1435 - BLOCK
      ?AUTO_1438 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1433 ) ( ON-TABLE ?AUTO_1432 ) ( CLEAR ?AUTO_1436 ) ( ON ?AUTO_1435 ?AUTO_1432 ) ( ON ?AUTO_1438 ?AUTO_1435 ) ( CLEAR ?AUTO_1438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1438 ?AUTO_1435 )
      ( MAKE-ON ?AUTO_1432 ?AUTO_1433 )
      ( MAKE-ON-VERIFY ?AUTO_1432 ?AUTO_1433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1441 - BLOCK
      ?AUTO_1442 - BLOCK
    )
    :vars
    (
      ?AUTO_1443 - BLOCK
      ?AUTO_1445 - BLOCK
      ?AUTO_1446 - BLOCK
      ?AUTO_1449 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1441 ) ( CLEAR ?AUTO_1443 ) ( ON ?AUTO_1445 ?AUTO_1441 ) ( ON ?AUTO_1446 ?AUTO_1445 ) ( CLEAR ?AUTO_1446 ) ( HOLDING ?AUTO_1442 ) ( CLEAR ?AUTO_1449 ) )
    :subtasks
    ( ( !STACK ?AUTO_1442 ?AUTO_1449 )
      ( MAKE-ON ?AUTO_1441 ?AUTO_1442 )
      ( MAKE-ON-VERIFY ?AUTO_1441 ?AUTO_1442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1452 - BLOCK
      ?AUTO_1453 - BLOCK
    )
    :vars
    (
      ?AUTO_1457 - BLOCK
      ?AUTO_1454 - BLOCK
      ?AUTO_1455 - BLOCK
      ?AUTO_1459 - BLOCK
      ?AUTO_1460 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1453 ) ( ON-TABLE ?AUTO_1452 ) ( CLEAR ?AUTO_1457 ) ( ON ?AUTO_1454 ?AUTO_1452 ) ( ON ?AUTO_1455 ?AUTO_1454 ) ( CLEAR ?AUTO_1455 ) ( HOLDING ?AUTO_1459 ) ( CLEAR ?AUTO_1460 ) )
    :subtasks
    ( ( !STACK ?AUTO_1459 ?AUTO_1460 )
      ( MAKE-ON ?AUTO_1452 ?AUTO_1453 )
      ( MAKE-ON-VERIFY ?AUTO_1452 ?AUTO_1453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1461 - BLOCK
      ?AUTO_1462 - BLOCK
    )
    :vars
    (
      ?AUTO_1467 - BLOCK
      ?AUTO_1465 - BLOCK
      ?AUTO_1466 - BLOCK
      ?AUTO_1469 - BLOCK
      ?AUTO_1468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1461 ) ( CLEAR ?AUTO_1467 ) ( ON ?AUTO_1465 ?AUTO_1461 ) ( ON ?AUTO_1466 ?AUTO_1465 ) ( CLEAR ?AUTO_1466 ) ( CLEAR ?AUTO_1469 ) ( ON ?AUTO_1468 ?AUTO_1462 ) ( CLEAR ?AUTO_1468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1468 ?AUTO_1462 )
      ( MAKE-ON ?AUTO_1461 ?AUTO_1462 )
      ( MAKE-ON-VERIFY ?AUTO_1461 ?AUTO_1462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1472 - BLOCK
      ?AUTO_1473 - BLOCK
    )
    :vars
    (
      ?AUTO_1475 - BLOCK
      ?AUTO_1480 - BLOCK
      ?AUTO_1478 - BLOCK
      ?AUTO_1479 - BLOCK
      ?AUTO_1474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1472 ) ( CLEAR ?AUTO_1475 ) ( ON ?AUTO_1480 ?AUTO_1472 ) ( CLEAR ?AUTO_1478 ) ( ON ?AUTO_1479 ?AUTO_1473 ) ( CLEAR ?AUTO_1479 ) ( HOLDING ?AUTO_1474 ) ( CLEAR ?AUTO_1480 ) )
    :subtasks
    ( ( !STACK ?AUTO_1474 ?AUTO_1480 )
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
      ?AUTO_1488 - BLOCK
      ?AUTO_1486 - BLOCK
      ?AUTO_1485 - BLOCK
      ?AUTO_1487 - BLOCK
      ?AUTO_1490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1483 ) ( CLEAR ?AUTO_1488 ) ( ON ?AUTO_1486 ?AUTO_1483 ) ( CLEAR ?AUTO_1485 ) ( ON ?AUTO_1487 ?AUTO_1484 ) ( CLEAR ?AUTO_1486 ) ( ON ?AUTO_1490 ?AUTO_1487 ) ( CLEAR ?AUTO_1490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1490 ?AUTO_1487 )
      ( MAKE-ON ?AUTO_1483 ?AUTO_1484 )
      ( MAKE-ON-VERIFY ?AUTO_1483 ?AUTO_1484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1494 - BLOCK
      ?AUTO_1495 - BLOCK
    )
    :vars
    (
      ?AUTO_1496 - BLOCK
      ?AUTO_1499 - BLOCK
      ?AUTO_1502 - BLOCK
      ?AUTO_1501 - BLOCK
      ?AUTO_1500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1494 ) ( CLEAR ?AUTO_1496 ) ( CLEAR ?AUTO_1499 ) ( ON ?AUTO_1502 ?AUTO_1495 ) ( ON ?AUTO_1501 ?AUTO_1502 ) ( CLEAR ?AUTO_1501 ) ( HOLDING ?AUTO_1500 ) ( CLEAR ?AUTO_1494 ) )
    :subtasks
    ( ( !STACK ?AUTO_1500 ?AUTO_1494 )
      ( MAKE-ON ?AUTO_1494 ?AUTO_1495 )
      ( MAKE-ON-VERIFY ?AUTO_1494 ?AUTO_1495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1505 - BLOCK
      ?AUTO_1506 - BLOCK
    )
    :vars
    (
      ?AUTO_1508 - BLOCK
      ?AUTO_1512 - BLOCK
      ?AUTO_1509 - BLOCK
      ?AUTO_1507 - BLOCK
      ?AUTO_1513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1505 ) ( CLEAR ?AUTO_1508 ) ( CLEAR ?AUTO_1512 ) ( ON ?AUTO_1509 ?AUTO_1506 ) ( ON ?AUTO_1507 ?AUTO_1509 ) ( CLEAR ?AUTO_1507 ) ( CLEAR ?AUTO_1505 ) ( ON-TABLE ?AUTO_1513 ) ( CLEAR ?AUTO_1513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1513 )
      ( MAKE-ON ?AUTO_1505 ?AUTO_1506 )
      ( MAKE-ON-VERIFY ?AUTO_1505 ?AUTO_1506 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1515 - BLOCK
      ?AUTO_1516 - BLOCK
    )
    :vars
    (
      ?AUTO_1522 - BLOCK
      ?AUTO_1517 - BLOCK
      ?AUTO_1518 - BLOCK
      ?AUTO_1523 - BLOCK
      ?AUTO_1521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1522 ) ( CLEAR ?AUTO_1517 ) ( ON ?AUTO_1518 ?AUTO_1516 ) ( ON ?AUTO_1523 ?AUTO_1518 ) ( CLEAR ?AUTO_1523 ) ( ON-TABLE ?AUTO_1521 ) ( CLEAR ?AUTO_1521 ) ( HOLDING ?AUTO_1515 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1515 )
      ( MAKE-ON ?AUTO_1515 ?AUTO_1516 )
      ( MAKE-ON-VERIFY ?AUTO_1515 ?AUTO_1516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1525 - BLOCK
      ?AUTO_1526 - BLOCK
    )
    :vars
    (
      ?AUTO_1532 - BLOCK
      ?AUTO_1530 - BLOCK
      ?AUTO_1531 - BLOCK
      ?AUTO_1527 - BLOCK
      ?AUTO_1533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1532 ) ( CLEAR ?AUTO_1530 ) ( ON ?AUTO_1531 ?AUTO_1526 ) ( ON ?AUTO_1527 ?AUTO_1531 ) ( ON-TABLE ?AUTO_1533 ) ( CLEAR ?AUTO_1533 ) ( ON ?AUTO_1525 ?AUTO_1527 ) ( CLEAR ?AUTO_1525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1525 ?AUTO_1527 )
      ( MAKE-ON ?AUTO_1525 ?AUTO_1526 )
      ( MAKE-ON-VERIFY ?AUTO_1525 ?AUTO_1526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1536 - BLOCK
      ?AUTO_1537 - BLOCK
    )
    :vars
    (
      ?AUTO_1540 - BLOCK
      ?AUTO_1543 - BLOCK
      ?AUTO_1542 - BLOCK
      ?AUTO_1539 - BLOCK
      ?AUTO_1544 - BLOCK
      ?AUTO_1545 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1540 ) ( CLEAR ?AUTO_1543 ) ( ON ?AUTO_1542 ?AUTO_1537 ) ( ON ?AUTO_1539 ?AUTO_1542 ) ( ON-TABLE ?AUTO_1544 ) ( CLEAR ?AUTO_1544 ) ( ON ?AUTO_1536 ?AUTO_1539 ) ( CLEAR ?AUTO_1536 ) ( HOLDING ?AUTO_1545 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1545 )
      ( MAKE-ON ?AUTO_1536 ?AUTO_1537 )
      ( MAKE-ON-VERIFY ?AUTO_1536 ?AUTO_1537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1546 - BLOCK
      ?AUTO_1547 - BLOCK
    )
    :vars
    (
      ?AUTO_1555 - BLOCK
      ?AUTO_1554 - BLOCK
      ?AUTO_1552 - BLOCK
      ?AUTO_1553 - BLOCK
      ?AUTO_1550 - BLOCK
      ?AUTO_1551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1555 ) ( CLEAR ?AUTO_1554 ) ( ON ?AUTO_1552 ?AUTO_1547 ) ( ON ?AUTO_1553 ?AUTO_1552 ) ( ON-TABLE ?AUTO_1550 ) ( CLEAR ?AUTO_1550 ) ( ON ?AUTO_1546 ?AUTO_1553 ) ( ON ?AUTO_1551 ?AUTO_1546 ) ( CLEAR ?AUTO_1551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1551 ?AUTO_1546 )
      ( MAKE-ON ?AUTO_1546 ?AUTO_1547 )
      ( MAKE-ON-VERIFY ?AUTO_1546 ?AUTO_1547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1558 - BLOCK
      ?AUTO_1559 - BLOCK
    )
    :vars
    (
      ?AUTO_1561 - BLOCK
      ?AUTO_1564 - BLOCK
      ?AUTO_1566 - BLOCK
      ?AUTO_1560 - BLOCK
      ?AUTO_1563 - BLOCK
      ?AUTO_1567 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1561 ) ( ON ?AUTO_1564 ?AUTO_1559 ) ( ON ?AUTO_1566 ?AUTO_1564 ) ( ON-TABLE ?AUTO_1560 ) ( CLEAR ?AUTO_1560 ) ( ON ?AUTO_1558 ?AUTO_1566 ) ( ON ?AUTO_1563 ?AUTO_1558 ) ( CLEAR ?AUTO_1563 ) ( HOLDING ?AUTO_1567 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1567 )
      ( MAKE-ON ?AUTO_1558 ?AUTO_1559 )
      ( MAKE-ON-VERIFY ?AUTO_1558 ?AUTO_1559 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1573 - BLOCK
      ?AUTO_1574 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1573 ) ( CLEAR ?AUTO_1574 ) )
    :subtasks
    ( ( !STACK ?AUTO_1573 ?AUTO_1574 )
      ( MAKE-ON-VERIFY ?AUTO_1573 ?AUTO_1574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1577 - BLOCK
      ?AUTO_1578 - BLOCK
    )
    :vars
    (
      ?AUTO_1582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1578 ) ( ON ?AUTO_1577 ?AUTO_1582 ) ( CLEAR ?AUTO_1577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1577 ?AUTO_1582 )
      ( MAKE-ON ?AUTO_1577 ?AUTO_1578 )
      ( MAKE-ON-VERIFY ?AUTO_1577 ?AUTO_1578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1583 - BLOCK
      ?AUTO_1584 - BLOCK
    )
    :vars
    (
      ?AUTO_1587 - BLOCK
      ?AUTO_1589 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1583 ?AUTO_1587 ) ( CLEAR ?AUTO_1583 ) ( HOLDING ?AUTO_1584 ) ( CLEAR ?AUTO_1589 ) )
    :subtasks
    ( ( !STACK ?AUTO_1584 ?AUTO_1589 )
      ( MAKE-ON ?AUTO_1583 ?AUTO_1584 )
      ( MAKE-ON-VERIFY ?AUTO_1583 ?AUTO_1584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1707 - BLOCK
      ?AUTO_1708 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1707 ) ( CLEAR ?AUTO_1708 ) )
    :subtasks
    ( ( !STACK ?AUTO_1707 ?AUTO_1708 )
      ( MAKE-ON-VERIFY ?AUTO_1707 ?AUTO_1708 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1711 - BLOCK
      ?AUTO_1712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1712 ) ( ON-TABLE ?AUTO_1711 ) ( CLEAR ?AUTO_1711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1711 )
      ( MAKE-ON ?AUTO_1711 ?AUTO_1712 )
      ( MAKE-ON-VERIFY ?AUTO_1711 ?AUTO_1712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1716 - BLOCK
      ?AUTO_1717 - BLOCK
    )
    :vars
    (
      ?AUTO_1721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1716 ) ( CLEAR ?AUTO_1716 ) ( HOLDING ?AUTO_1717 ) ( CLEAR ?AUTO_1721 ) )
    :subtasks
    ( ( !STACK ?AUTO_1717 ?AUTO_1721 )
      ( MAKE-ON ?AUTO_1716 ?AUTO_1717 )
      ( MAKE-ON-VERIFY ?AUTO_1716 ?AUTO_1717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1724 - BLOCK
      ?AUTO_1725 - BLOCK
    )
    :vars
    (
      ?AUTO_1728 - BLOCK
      ?AUTO_1729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1725 ) ( ON-TABLE ?AUTO_1724 ) ( CLEAR ?AUTO_1724 ) ( HOLDING ?AUTO_1728 ) ( CLEAR ?AUTO_1729 ) )
    :subtasks
    ( ( !STACK ?AUTO_1728 ?AUTO_1729 )
      ( MAKE-ON ?AUTO_1724 ?AUTO_1725 )
      ( MAKE-ON-VERIFY ?AUTO_1724 ?AUTO_1725 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1731 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1731 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1731 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1731 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1733 - BLOCK
    )
    :vars
    (
      ?AUTO_1736 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1733 ?AUTO_1736 ) ( CLEAR ?AUTO_1733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1733 ?AUTO_1736 )
      ( MAKE-ON-TABLE ?AUTO_1733 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1733 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1738 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1738 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1738 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1738 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1740 - BLOCK
    )
    :vars
    (
      ?AUTO_1743 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1740 ?AUTO_1743 ) ( CLEAR ?AUTO_1740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1740 ?AUTO_1743 )
      ( MAKE-ON-TABLE ?AUTO_1740 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1740 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1744 - BLOCK
    )
    :vars
    (
      ?AUTO_1746 - BLOCK
      ?AUTO_1747 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1744 ?AUTO_1746 ) ( CLEAR ?AUTO_1744 ) ( HOLDING ?AUTO_1747 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1747 )
      ( MAKE-ON-TABLE ?AUTO_1744 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1751 - BLOCK
      ?AUTO_1752 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1751 ) ( CLEAR ?AUTO_1752 ) )
    :subtasks
    ( ( !STACK ?AUTO_1751 ?AUTO_1752 )
      ( MAKE-ON-VERIFY ?AUTO_1751 ?AUTO_1752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1755 - BLOCK
      ?AUTO_1756 - BLOCK
    )
    :vars
    (
      ?AUTO_1760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1756 ) ( ON ?AUTO_1755 ?AUTO_1760 ) ( CLEAR ?AUTO_1755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1755 ?AUTO_1760 )
      ( MAKE-ON ?AUTO_1755 ?AUTO_1756 )
      ( MAKE-ON-VERIFY ?AUTO_1755 ?AUTO_1756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1761 - BLOCK
      ?AUTO_1762 - BLOCK
    )
    :vars
    (
      ?AUTO_1763 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1761 ?AUTO_1763 ) ( CLEAR ?AUTO_1761 ) ( HOLDING ?AUTO_1762 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1762 )
      ( MAKE-ON ?AUTO_1761 ?AUTO_1762 )
      ( MAKE-ON-VERIFY ?AUTO_1761 ?AUTO_1762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1767 - BLOCK
      ?AUTO_1768 - BLOCK
    )
    :vars
    (
      ?AUTO_1769 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1767 ?AUTO_1769 ) ( ON ?AUTO_1768 ?AUTO_1767 ) ( CLEAR ?AUTO_1768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1768 ?AUTO_1767 )
      ( MAKE-ON ?AUTO_1767 ?AUTO_1768 )
      ( MAKE-ON-VERIFY ?AUTO_1767 ?AUTO_1768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1774 - BLOCK
      ?AUTO_1775 - BLOCK
    )
    :vars
    (
      ?AUTO_1776 - BLOCK
      ?AUTO_1779 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1774 ?AUTO_1776 ) ( ON ?AUTO_1775 ?AUTO_1774 ) ( CLEAR ?AUTO_1775 ) ( HOLDING ?AUTO_1779 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1779 )
      ( MAKE-ON ?AUTO_1774 ?AUTO_1775 )
      ( MAKE-ON-VERIFY ?AUTO_1774 ?AUTO_1775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1784 - BLOCK
      ?AUTO_1785 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1784 ) ( CLEAR ?AUTO_1785 ) )
    :subtasks
    ( ( !STACK ?AUTO_1784 ?AUTO_1785 )
      ( MAKE-ON-VERIFY ?AUTO_1784 ?AUTO_1785 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1788 - BLOCK
      ?AUTO_1789 - BLOCK
    )
    :vars
    (
      ?AUTO_1793 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1789 ) ( ON ?AUTO_1788 ?AUTO_1793 ) ( CLEAR ?AUTO_1788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1788 ?AUTO_1793 )
      ( MAKE-ON ?AUTO_1788 ?AUTO_1789 )
      ( MAKE-ON-VERIFY ?AUTO_1788 ?AUTO_1789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1794 - BLOCK
      ?AUTO_1795 - BLOCK
    )
    :vars
    (
      ?AUTO_1798 - BLOCK
      ?AUTO_1800 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1794 ?AUTO_1798 ) ( CLEAR ?AUTO_1794 ) ( HOLDING ?AUTO_1795 ) ( CLEAR ?AUTO_1800 ) )
    :subtasks
    ( ( !STACK ?AUTO_1795 ?AUTO_1800 )
      ( MAKE-ON ?AUTO_1794 ?AUTO_1795 )
      ( MAKE-ON-VERIFY ?AUTO_1794 ?AUTO_1795 ) )
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
    ( and ( CLEAR ?AUTO_1804 ) ( ON ?AUTO_1803 ?AUTO_1807 ) ( CLEAR ?AUTO_1803 ) ( HOLDING ?AUTO_1808 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1808 )
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
      ?AUTO_1813 - BLOCK
      ?AUTO_1814 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1809 ?AUTO_1813 ) ( CLEAR ?AUTO_1809 ) ( ON ?AUTO_1814 ?AUTO_1810 ) ( CLEAR ?AUTO_1814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1814 ?AUTO_1810 )
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
      ?AUTO_1819 - BLOCK
      ?AUTO_1822 - BLOCK
      ?AUTO_1823 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1817 ?AUTO_1819 ) ( CLEAR ?AUTO_1817 ) ( ON ?AUTO_1822 ?AUTO_1818 ) ( CLEAR ?AUTO_1822 ) ( HOLDING ?AUTO_1823 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1823 )
      ( MAKE-ON ?AUTO_1817 ?AUTO_1818 )
      ( MAKE-ON-VERIFY ?AUTO_1817 ?AUTO_1818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1824 - BLOCK
      ?AUTO_1825 - BLOCK
    )
    :vars
    (
      ?AUTO_1826 - BLOCK
      ?AUTO_1829 - BLOCK
      ?AUTO_1830 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1824 ?AUTO_1826 ) ( ON ?AUTO_1829 ?AUTO_1825 ) ( CLEAR ?AUTO_1829 ) ( ON ?AUTO_1830 ?AUTO_1824 ) ( CLEAR ?AUTO_1830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1830 ?AUTO_1824 )
      ( MAKE-ON ?AUTO_1824 ?AUTO_1825 )
      ( MAKE-ON-VERIFY ?AUTO_1824 ?AUTO_1825 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1835 - BLOCK
      ?AUTO_1836 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1835 ) ( CLEAR ?AUTO_1836 ) )
    :subtasks
    ( ( !STACK ?AUTO_1835 ?AUTO_1836 )
      ( MAKE-ON-VERIFY ?AUTO_1835 ?AUTO_1836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1839 - BLOCK
      ?AUTO_1840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1840 ) ( ON-TABLE ?AUTO_1839 ) ( CLEAR ?AUTO_1839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1839 )
      ( MAKE-ON ?AUTO_1839 ?AUTO_1840 )
      ( MAKE-ON-VERIFY ?AUTO_1839 ?AUTO_1840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1844 - BLOCK
      ?AUTO_1845 - BLOCK
    )
    :vars
    (
      ?AUTO_1848 - BLOCK
      ?AUTO_1849 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1845 ) ( ON-TABLE ?AUTO_1844 ) ( CLEAR ?AUTO_1844 ) ( HOLDING ?AUTO_1848 ) ( CLEAR ?AUTO_1849 ) )
    :subtasks
    ( ( !STACK ?AUTO_1848 ?AUTO_1849 )
      ( MAKE-ON ?AUTO_1844 ?AUTO_1845 )
      ( MAKE-ON-VERIFY ?AUTO_1844 ?AUTO_1845 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1850 - BLOCK
      ?AUTO_1851 - BLOCK
    )
    :vars
    (
      ?AUTO_1853 - BLOCK
      ?AUTO_1855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1851 ) ( ON-TABLE ?AUTO_1850 ) ( CLEAR ?AUTO_1853 ) ( ON ?AUTO_1855 ?AUTO_1850 ) ( CLEAR ?AUTO_1855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1855 ?AUTO_1850 )
      ( MAKE-ON ?AUTO_1850 ?AUTO_1851 )
      ( MAKE-ON-VERIFY ?AUTO_1850 ?AUTO_1851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1858 - BLOCK
      ?AUTO_1859 - BLOCK
    )
    :vars
    (
      ?AUTO_1863 - BLOCK
      ?AUTO_1862 - BLOCK
      ?AUTO_1865 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1859 ) ( ON-TABLE ?AUTO_1858 ) ( ON ?AUTO_1863 ?AUTO_1858 ) ( CLEAR ?AUTO_1863 ) ( HOLDING ?AUTO_1862 ) ( CLEAR ?AUTO_1865 ) )
    :subtasks
    ( ( !STACK ?AUTO_1862 ?AUTO_1865 )
      ( MAKE-ON ?AUTO_1858 ?AUTO_1859 )
      ( MAKE-ON-VERIFY ?AUTO_1858 ?AUTO_1859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1872 - BLOCK
      ?AUTO_1873 - BLOCK
    )
    :vars
    (
      ?AUTO_1874 - BLOCK
      ?AUTO_1875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1872 ) ( CLEAR ?AUTO_1874 ) ( ON ?AUTO_1875 ?AUTO_1872 ) ( CLEAR ?AUTO_1875 ) ( HOLDING ?AUTO_1873 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1873 )
      ( MAKE-ON ?AUTO_1872 ?AUTO_1873 )
      ( MAKE-ON-VERIFY ?AUTO_1872 ?AUTO_1873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1879 - BLOCK
      ?AUTO_1880 - BLOCK
    )
    :vars
    (
      ?AUTO_1883 - BLOCK
      ?AUTO_1884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1879 ) ( CLEAR ?AUTO_1883 ) ( ON ?AUTO_1884 ?AUTO_1879 ) ( ON ?AUTO_1880 ?AUTO_1884 ) ( CLEAR ?AUTO_1880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1880 ?AUTO_1884 )
      ( MAKE-ON ?AUTO_1879 ?AUTO_1880 )
      ( MAKE-ON-VERIFY ?AUTO_1879 ?AUTO_1880 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1888 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1888 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1888 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1888 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1890 - BLOCK
    )
    :vars
    (
      ?AUTO_1893 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1890 ?AUTO_1893 ) ( CLEAR ?AUTO_1890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1890 ?AUTO_1893 )
      ( MAKE-ON-TABLE ?AUTO_1890 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1890 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1894 - BLOCK
    )
    :vars
    (
      ?AUTO_1896 - BLOCK
      ?AUTO_1897 - BLOCK
      ?AUTO_1898 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1894 ?AUTO_1896 ) ( CLEAR ?AUTO_1894 ) ( HOLDING ?AUTO_1897 ) ( CLEAR ?AUTO_1898 ) )
    :subtasks
    ( ( !STACK ?AUTO_1897 ?AUTO_1898 )
      ( MAKE-ON-TABLE ?AUTO_1894 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1894 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1903 - BLOCK
    )
    :vars
    (
      ?AUTO_1905 - BLOCK
      ?AUTO_1907 - BLOCK
      ?AUTO_1906 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1903 ?AUTO_1905 ) ( CLEAR ?AUTO_1907 ) ( ON ?AUTO_1906 ?AUTO_1903 ) ( CLEAR ?AUTO_1906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1906 ?AUTO_1903 )
      ( MAKE-ON-TABLE ?AUTO_1903 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1903 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1910 - BLOCK
    )
    :vars
    (
      ?AUTO_1912 - BLOCK
      ?AUTO_1914 - BLOCK
      ?AUTO_1913 - BLOCK
      ?AUTO_1915 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1910 ?AUTO_1912 ) ( CLEAR ?AUTO_1914 ) ( ON ?AUTO_1913 ?AUTO_1910 ) ( CLEAR ?AUTO_1913 ) ( HOLDING ?AUTO_1915 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1915 )
      ( MAKE-ON-TABLE ?AUTO_1910 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1910 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1916 - BLOCK
    )
    :vars
    (
      ?AUTO_1918 - BLOCK
      ?AUTO_1917 - BLOCK
      ?AUTO_1921 - BLOCK
      ?AUTO_1920 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1916 ?AUTO_1918 ) ( CLEAR ?AUTO_1917 ) ( ON ?AUTO_1921 ?AUTO_1916 ) ( ON ?AUTO_1920 ?AUTO_1921 ) ( CLEAR ?AUTO_1920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1920 ?AUTO_1921 )
      ( MAKE-ON-TABLE ?AUTO_1916 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1916 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1924 - BLOCK
    )
    :vars
    (
      ?AUTO_1925 - BLOCK
      ?AUTO_1926 - BLOCK
      ?AUTO_1929 - BLOCK
      ?AUTO_1928 - BLOCK
      ?AUTO_1930 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1924 ?AUTO_1925 ) ( CLEAR ?AUTO_1926 ) ( ON ?AUTO_1929 ?AUTO_1924 ) ( ON ?AUTO_1928 ?AUTO_1929 ) ( CLEAR ?AUTO_1928 ) ( HOLDING ?AUTO_1930 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1930 )
      ( MAKE-ON-TABLE ?AUTO_1924 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1924 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1933 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1933 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1933 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1933 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1935 - BLOCK
    )
    :vars
    (
      ?AUTO_1938 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1935 ?AUTO_1938 ) ( CLEAR ?AUTO_1935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1935 ?AUTO_1938 )
      ( MAKE-ON-TABLE ?AUTO_1935 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1935 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1939 - BLOCK
    )
    :vars
    (
      ?AUTO_1941 - BLOCK
      ?AUTO_1942 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1939 ?AUTO_1941 ) ( CLEAR ?AUTO_1939 ) ( HOLDING ?AUTO_1942 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1942 )
      ( MAKE-ON-TABLE ?AUTO_1939 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1939 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1943 - BLOCK
    )
    :vars
    (
      ?AUTO_1945 - BLOCK
      ?AUTO_1946 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1943 ?AUTO_1945 ) ( ON ?AUTO_1946 ?AUTO_1943 ) ( CLEAR ?AUTO_1946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1946 ?AUTO_1943 )
      ( MAKE-ON-TABLE ?AUTO_1943 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1943 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1949 - BLOCK
    )
    :vars
    (
      ?AUTO_1950 - BLOCK
      ?AUTO_1951 - BLOCK
      ?AUTO_1953 - BLOCK
      ?AUTO_1954 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1949 ?AUTO_1950 ) ( ON ?AUTO_1951 ?AUTO_1949 ) ( CLEAR ?AUTO_1951 ) ( HOLDING ?AUTO_1953 ) ( CLEAR ?AUTO_1954 ) )
    :subtasks
    ( ( !STACK ?AUTO_1953 ?AUTO_1954 )
      ( MAKE-ON-TABLE ?AUTO_1949 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1949 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1959 - BLOCK
    )
    :vars
    (
      ?AUTO_1961 - BLOCK
      ?AUTO_1964 - BLOCK
      ?AUTO_1960 - BLOCK
      ?AUTO_1963 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1959 ?AUTO_1961 ) ( ON ?AUTO_1964 ?AUTO_1959 ) ( CLEAR ?AUTO_1960 ) ( ON ?AUTO_1963 ?AUTO_1964 ) ( CLEAR ?AUTO_1963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1963 ?AUTO_1964 )
      ( MAKE-ON-TABLE ?AUTO_1959 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1959 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1967 - BLOCK
    )
    :vars
    (
      ?AUTO_1971 - BLOCK
      ?AUTO_1972 - BLOCK
      ?AUTO_1970 - BLOCK
      ?AUTO_1969 - BLOCK
      ?AUTO_1973 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1967 ?AUTO_1971 ) ( ON ?AUTO_1972 ?AUTO_1967 ) ( CLEAR ?AUTO_1970 ) ( ON ?AUTO_1969 ?AUTO_1972 ) ( CLEAR ?AUTO_1969 ) ( HOLDING ?AUTO_1973 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1973 )
      ( MAKE-ON-TABLE ?AUTO_1967 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1967 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1974 - BLOCK
    )
    :vars
    (
      ?AUTO_1976 - BLOCK
      ?AUTO_1977 - BLOCK
      ?AUTO_1980 - BLOCK
      ?AUTO_1975 - BLOCK
      ?AUTO_1979 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1974 ?AUTO_1976 ) ( ON ?AUTO_1977 ?AUTO_1974 ) ( CLEAR ?AUTO_1980 ) ( ON ?AUTO_1975 ?AUTO_1977 ) ( ON ?AUTO_1979 ?AUTO_1975 ) ( CLEAR ?AUTO_1979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1979 ?AUTO_1975 )
      ( MAKE-ON-TABLE ?AUTO_1974 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1974 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1983 - BLOCK
    )
    :vars
    (
      ?AUTO_1989 - BLOCK
      ?AUTO_1985 - BLOCK
      ?AUTO_1984 - BLOCK
      ?AUTO_1988 - BLOCK
      ?AUTO_1986 - BLOCK
      ?AUTO_1990 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1983 ?AUTO_1989 ) ( ON ?AUTO_1985 ?AUTO_1983 ) ( CLEAR ?AUTO_1984 ) ( ON ?AUTO_1988 ?AUTO_1985 ) ( ON ?AUTO_1986 ?AUTO_1988 ) ( CLEAR ?AUTO_1986 ) ( HOLDING ?AUTO_1990 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1990 )
      ( MAKE-ON-TABLE ?AUTO_1983 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1994 - BLOCK
      ?AUTO_1995 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1994 ) ( CLEAR ?AUTO_1995 ) )
    :subtasks
    ( ( !STACK ?AUTO_1994 ?AUTO_1995 )
      ( MAKE-ON-VERIFY ?AUTO_1994 ?AUTO_1995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1998 - BLOCK
      ?AUTO_1999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1999 ) ( ON-TABLE ?AUTO_1998 ) ( CLEAR ?AUTO_1998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1998 )
      ( MAKE-ON ?AUTO_1998 ?AUTO_1999 )
      ( MAKE-ON-VERIFY ?AUTO_1998 ?AUTO_1999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2003 - BLOCK
      ?AUTO_2004 - BLOCK
    )
    :vars
    (
      ?AUTO_2007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2004 ) ( ON-TABLE ?AUTO_2003 ) ( CLEAR ?AUTO_2003 ) ( HOLDING ?AUTO_2007 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2007 )
      ( MAKE-ON ?AUTO_2003 ?AUTO_2004 )
      ( MAKE-ON-VERIFY ?AUTO_2003 ?AUTO_2004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2008 - BLOCK
      ?AUTO_2009 - BLOCK
    )
    :vars
    (
      ?AUTO_2012 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2009 ) ( ON-TABLE ?AUTO_2008 ) ( ON ?AUTO_2012 ?AUTO_2008 ) ( CLEAR ?AUTO_2012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2012 ?AUTO_2008 )
      ( MAKE-ON ?AUTO_2008 ?AUTO_2009 )
      ( MAKE-ON-VERIFY ?AUTO_2008 ?AUTO_2009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2015 - BLOCK
      ?AUTO_2016 - BLOCK
    )
    :vars
    (
      ?AUTO_2018 - BLOCK
      ?AUTO_2020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2016 ) ( ON-TABLE ?AUTO_2015 ) ( ON ?AUTO_2018 ?AUTO_2015 ) ( CLEAR ?AUTO_2018 ) ( HOLDING ?AUTO_2020 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2020 )
      ( MAKE-ON ?AUTO_2015 ?AUTO_2016 )
      ( MAKE-ON-VERIFY ?AUTO_2015 ?AUTO_2016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2021 - BLOCK
      ?AUTO_2022 - BLOCK
    )
    :vars
    (
      ?AUTO_2023 - BLOCK
      ?AUTO_2026 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2022 ) ( ON-TABLE ?AUTO_2021 ) ( ON ?AUTO_2023 ?AUTO_2021 ) ( ON ?AUTO_2026 ?AUTO_2023 ) ( CLEAR ?AUTO_2026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2026 ?AUTO_2023 )
      ( MAKE-ON ?AUTO_2021 ?AUTO_2022 )
      ( MAKE-ON-VERIFY ?AUTO_2021 ?AUTO_2022 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2029 - BLOCK
      ?AUTO_2030 - BLOCK
    )
    :vars
    (
      ?AUTO_2031 - BLOCK
      ?AUTO_2034 - BLOCK
      ?AUTO_2036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2029 ) ( ON ?AUTO_2031 ?AUTO_2029 ) ( ON ?AUTO_2034 ?AUTO_2031 ) ( CLEAR ?AUTO_2034 ) ( HOLDING ?AUTO_2030 ) ( CLEAR ?AUTO_2036 ) )
    :subtasks
    ( ( !STACK ?AUTO_2030 ?AUTO_2036 )
      ( MAKE-ON ?AUTO_2029 ?AUTO_2030 )
      ( MAKE-ON-VERIFY ?AUTO_2029 ?AUTO_2030 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2039 - BLOCK
      ?AUTO_2040 - BLOCK
    )
    :vars
    (
      ?AUTO_2042 - BLOCK
      ?AUTO_2043 - BLOCK
      ?AUTO_2045 - BLOCK
      ?AUTO_2046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2040 ) ( ON-TABLE ?AUTO_2039 ) ( ON ?AUTO_2042 ?AUTO_2039 ) ( ON ?AUTO_2043 ?AUTO_2042 ) ( CLEAR ?AUTO_2043 ) ( HOLDING ?AUTO_2045 ) ( CLEAR ?AUTO_2046 ) )
    :subtasks
    ( ( !STACK ?AUTO_2045 ?AUTO_2046 )
      ( MAKE-ON ?AUTO_2039 ?AUTO_2040 )
      ( MAKE-ON-VERIFY ?AUTO_2039 ?AUTO_2040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2047 - BLOCK
      ?AUTO_2048 - BLOCK
    )
    :vars
    (
      ?AUTO_2051 - BLOCK
      ?AUTO_2052 - BLOCK
      ?AUTO_2054 - BLOCK
      ?AUTO_2053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2047 ) ( ON ?AUTO_2051 ?AUTO_2047 ) ( ON ?AUTO_2052 ?AUTO_2051 ) ( CLEAR ?AUTO_2052 ) ( CLEAR ?AUTO_2054 ) ( ON ?AUTO_2053 ?AUTO_2048 ) ( CLEAR ?AUTO_2053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2053 ?AUTO_2048 )
      ( MAKE-ON ?AUTO_2047 ?AUTO_2048 )
      ( MAKE-ON-VERIFY ?AUTO_2047 ?AUTO_2048 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2057 - BLOCK
      ?AUTO_2058 - BLOCK
    )
    :vars
    (
      ?AUTO_2064 - BLOCK
      ?AUTO_2059 - BLOCK
      ?AUTO_2062 - BLOCK
      ?AUTO_2063 - BLOCK
      ?AUTO_2066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2057 ) ( ON ?AUTO_2064 ?AUTO_2057 ) ( ON ?AUTO_2059 ?AUTO_2064 ) ( CLEAR ?AUTO_2059 ) ( ON ?AUTO_2062 ?AUTO_2058 ) ( CLEAR ?AUTO_2062 ) ( HOLDING ?AUTO_2063 ) ( CLEAR ?AUTO_2066 ) )
    :subtasks
    ( ( !STACK ?AUTO_2063 ?AUTO_2066 )
      ( MAKE-ON ?AUTO_2057 ?AUTO_2058 )
      ( MAKE-ON-VERIFY ?AUTO_2057 ?AUTO_2058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2067 - BLOCK
      ?AUTO_2068 - BLOCK
    )
    :vars
    (
      ?AUTO_2071 - BLOCK
      ?AUTO_2072 - BLOCK
      ?AUTO_2075 - BLOCK
      ?AUTO_2070 - BLOCK
      ?AUTO_2069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2067 ) ( ON ?AUTO_2071 ?AUTO_2067 ) ( ON ?AUTO_2072 ?AUTO_2071 ) ( ON ?AUTO_2075 ?AUTO_2068 ) ( CLEAR ?AUTO_2075 ) ( CLEAR ?AUTO_2070 ) ( ON ?AUTO_2069 ?AUTO_2072 ) ( CLEAR ?AUTO_2069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2069 ?AUTO_2072 )
      ( MAKE-ON ?AUTO_2067 ?AUTO_2068 )
      ( MAKE-ON-VERIFY ?AUTO_2067 ?AUTO_2068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2078 - BLOCK
      ?AUTO_2079 - BLOCK
    )
    :vars
    (
      ?AUTO_2086 - BLOCK
      ?AUTO_2080 - BLOCK
      ?AUTO_2083 - BLOCK
      ?AUTO_2084 - BLOCK
      ?AUTO_2085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2078 ) ( ON ?AUTO_2086 ?AUTO_2078 ) ( ON ?AUTO_2080 ?AUTO_2086 ) ( ON ?AUTO_2083 ?AUTO_2079 ) ( CLEAR ?AUTO_2083 ) ( ON ?AUTO_2084 ?AUTO_2080 ) ( CLEAR ?AUTO_2084 ) ( HOLDING ?AUTO_2085 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2085 )
      ( MAKE-ON ?AUTO_2078 ?AUTO_2079 )
      ( MAKE-ON-VERIFY ?AUTO_2078 ?AUTO_2079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2088 - BLOCK
      ?AUTO_2089 - BLOCK
    )
    :vars
    (
      ?AUTO_2093 - BLOCK
      ?AUTO_2092 - BLOCK
      ?AUTO_2091 - BLOCK
      ?AUTO_2090 - BLOCK
      ?AUTO_2096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2088 ) ( ON ?AUTO_2093 ?AUTO_2088 ) ( ON ?AUTO_2092 ?AUTO_2093 ) ( ON ?AUTO_2091 ?AUTO_2089 ) ( CLEAR ?AUTO_2091 ) ( ON ?AUTO_2090 ?AUTO_2092 ) ( ON ?AUTO_2096 ?AUTO_2090 ) ( CLEAR ?AUTO_2096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2096 ?AUTO_2090 )
      ( MAKE-ON ?AUTO_2088 ?AUTO_2089 )
      ( MAKE-ON-VERIFY ?AUTO_2088 ?AUTO_2089 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2099 - BLOCK
      ?AUTO_2100 - BLOCK
    )
    :vars
    (
      ?AUTO_2105 - BLOCK
      ?AUTO_2101 - BLOCK
      ?AUTO_2104 - BLOCK
      ?AUTO_2106 - BLOCK
      ?AUTO_2107 - BLOCK
      ?AUTO_2108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2099 ) ( ON ?AUTO_2105 ?AUTO_2099 ) ( ON ?AUTO_2101 ?AUTO_2105 ) ( ON ?AUTO_2104 ?AUTO_2100 ) ( CLEAR ?AUTO_2104 ) ( ON ?AUTO_2106 ?AUTO_2101 ) ( ON ?AUTO_2107 ?AUTO_2106 ) ( CLEAR ?AUTO_2107 ) ( HOLDING ?AUTO_2108 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2108 )
      ( MAKE-ON ?AUTO_2099 ?AUTO_2100 )
      ( MAKE-ON-VERIFY ?AUTO_2099 ?AUTO_2100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2109 - BLOCK
      ?AUTO_2110 - BLOCK
    )
    :vars
    (
      ?AUTO_2118 - BLOCK
      ?AUTO_2111 - BLOCK
      ?AUTO_2116 - BLOCK
      ?AUTO_2112 - BLOCK
      ?AUTO_2117 - BLOCK
      ?AUTO_2113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2109 ) ( ON ?AUTO_2118 ?AUTO_2109 ) ( ON ?AUTO_2111 ?AUTO_2118 ) ( ON ?AUTO_2116 ?AUTO_2110 ) ( ON ?AUTO_2112 ?AUTO_2111 ) ( ON ?AUTO_2117 ?AUTO_2112 ) ( CLEAR ?AUTO_2117 ) ( ON ?AUTO_2113 ?AUTO_2116 ) ( CLEAR ?AUTO_2113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2113 ?AUTO_2116 )
      ( MAKE-ON ?AUTO_2109 ?AUTO_2110 )
      ( MAKE-ON-VERIFY ?AUTO_2109 ?AUTO_2110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2123 - BLOCK
      ?AUTO_2124 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2123 ) ( CLEAR ?AUTO_2124 ) )
    :subtasks
    ( ( !STACK ?AUTO_2123 ?AUTO_2124 )
      ( MAKE-ON-VERIFY ?AUTO_2123 ?AUTO_2124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2127 - BLOCK
      ?AUTO_2128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2128 ) ( ON-TABLE ?AUTO_2127 ) ( CLEAR ?AUTO_2127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2127 )
      ( MAKE-ON ?AUTO_2127 ?AUTO_2128 )
      ( MAKE-ON-VERIFY ?AUTO_2127 ?AUTO_2128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2132 - BLOCK
      ?AUTO_2133 - BLOCK
    )
    :vars
    (
      ?AUTO_2137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2132 ) ( CLEAR ?AUTO_2132 ) ( HOLDING ?AUTO_2133 ) ( CLEAR ?AUTO_2137 ) )
    :subtasks
    ( ( !STACK ?AUTO_2133 ?AUTO_2137 )
      ( MAKE-ON ?AUTO_2132 ?AUTO_2133 )
      ( MAKE-ON-VERIFY ?AUTO_2132 ?AUTO_2133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2142 - BLOCK
      ?AUTO_2143 - BLOCK
    )
    :vars
    (
      ?AUTO_2146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2142 ) ( CLEAR ?AUTO_2142 ) ( ON ?AUTO_2146 ?AUTO_2143 ) ( CLEAR ?AUTO_2146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2146 ?AUTO_2143 )
      ( MAKE-ON ?AUTO_2142 ?AUTO_2143 )
      ( MAKE-ON-VERIFY ?AUTO_2142 ?AUTO_2143 ) )
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
    )
    :precondition
    ( and ( ON ?AUTO_2153 ?AUTO_2150 ) ( CLEAR ?AUTO_2153 ) ( HOLDING ?AUTO_2149 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2149 )
      ( MAKE-ON ?AUTO_2149 ?AUTO_2150 )
      ( MAKE-ON-VERIFY ?AUTO_2149 ?AUTO_2150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2155 - BLOCK
      ?AUTO_2156 - BLOCK
    )
    :vars
    (
      ?AUTO_2159 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2159 ?AUTO_2156 ) ( ON ?AUTO_2155 ?AUTO_2159 ) ( CLEAR ?AUTO_2155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2155 ?AUTO_2159 )
      ( MAKE-ON ?AUTO_2155 ?AUTO_2156 )
      ( MAKE-ON-VERIFY ?AUTO_2155 ?AUTO_2156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2162 - BLOCK
      ?AUTO_2163 - BLOCK
    )
    :vars
    (
      ?AUTO_2164 - BLOCK
      ?AUTO_2167 - BLOCK
      ?AUTO_2168 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2164 ?AUTO_2163 ) ( ON ?AUTO_2162 ?AUTO_2164 ) ( CLEAR ?AUTO_2162 ) ( HOLDING ?AUTO_2167 ) ( CLEAR ?AUTO_2168 ) )
    :subtasks
    ( ( !STACK ?AUTO_2167 ?AUTO_2168 )
      ( MAKE-ON ?AUTO_2162 ?AUTO_2163 )
      ( MAKE-ON-VERIFY ?AUTO_2162 ?AUTO_2163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2177 - BLOCK
      ?AUTO_2178 - BLOCK
    )
    :vars
    (
      ?AUTO_2182 - BLOCK
      ?AUTO_2183 - BLOCK
      ?AUTO_2181 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2182 ?AUTO_2178 ) ( ON ?AUTO_2177 ?AUTO_2182 ) ( CLEAR ?AUTO_2183 ) ( ON ?AUTO_2181 ?AUTO_2177 ) ( CLEAR ?AUTO_2181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2181 ?AUTO_2177 )
      ( MAKE-ON ?AUTO_2177 ?AUTO_2178 )
      ( MAKE-ON-VERIFY ?AUTO_2177 ?AUTO_2178 ) )
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
      ?AUTO_2191 - BLOCK
      ?AUTO_2189 - BLOCK
      ?AUTO_2193 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2190 ?AUTO_2187 ) ( ON ?AUTO_2186 ?AUTO_2190 ) ( CLEAR ?AUTO_2191 ) ( ON ?AUTO_2189 ?AUTO_2186 ) ( CLEAR ?AUTO_2189 ) ( HOLDING ?AUTO_2193 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2193 )
      ( MAKE-ON ?AUTO_2186 ?AUTO_2187 )
      ( MAKE-ON-VERIFY ?AUTO_2186 ?AUTO_2187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2194 - BLOCK
      ?AUTO_2195 - BLOCK
    )
    :vars
    (
      ?AUTO_2200 - BLOCK
      ?AUTO_2201 - BLOCK
      ?AUTO_2199 - BLOCK
      ?AUTO_2198 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2200 ?AUTO_2195 ) ( ON ?AUTO_2194 ?AUTO_2200 ) ( CLEAR ?AUTO_2201 ) ( ON ?AUTO_2199 ?AUTO_2194 ) ( ON ?AUTO_2198 ?AUTO_2199 ) ( CLEAR ?AUTO_2198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2198 ?AUTO_2199 )
      ( MAKE-ON ?AUTO_2194 ?AUTO_2195 )
      ( MAKE-ON-VERIFY ?AUTO_2194 ?AUTO_2195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2204 - BLOCK
      ?AUTO_2205 - BLOCK
    )
    :vars
    (
      ?AUTO_2211 - BLOCK
      ?AUTO_2210 - BLOCK
      ?AUTO_2209 - BLOCK
      ?AUTO_2207 - BLOCK
      ?AUTO_2212 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2211 ?AUTO_2205 ) ( ON ?AUTO_2204 ?AUTO_2211 ) ( CLEAR ?AUTO_2210 ) ( ON ?AUTO_2209 ?AUTO_2204 ) ( ON ?AUTO_2207 ?AUTO_2209 ) ( CLEAR ?AUTO_2207 ) ( HOLDING ?AUTO_2212 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2212 )
      ( MAKE-ON ?AUTO_2204 ?AUTO_2205 )
      ( MAKE-ON-VERIFY ?AUTO_2204 ?AUTO_2205 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2214 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2214 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2214 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2214 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2216 - BLOCK
    )
    :vars
    (
      ?AUTO_2219 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2216 ?AUTO_2219 ) ( CLEAR ?AUTO_2216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2216 ?AUTO_2219 )
      ( MAKE-ON-TABLE ?AUTO_2216 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2216 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2221 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2221 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2221 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2221 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2223 - BLOCK
    )
    :vars
    (
      ?AUTO_2226 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2223 ?AUTO_2226 ) ( CLEAR ?AUTO_2223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2223 ?AUTO_2226 )
      ( MAKE-ON-TABLE ?AUTO_2223 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2223 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2227 - BLOCK
    )
    :vars
    (
      ?AUTO_2229 - BLOCK
      ?AUTO_2230 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2227 ?AUTO_2229 ) ( CLEAR ?AUTO_2227 ) ( HOLDING ?AUTO_2230 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2230 )
      ( MAKE-ON-TABLE ?AUTO_2227 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2227 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2233 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2233 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2233 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2233 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2235 - BLOCK
    )
    :vars
    (
      ?AUTO_2238 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2235 ?AUTO_2238 ) ( CLEAR ?AUTO_2235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2235 ?AUTO_2238 )
      ( MAKE-ON-TABLE ?AUTO_2235 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2235 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2239 - BLOCK
    )
    :vars
    (
      ?AUTO_2241 - BLOCK
      ?AUTO_2242 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2239 ?AUTO_2241 ) ( CLEAR ?AUTO_2239 ) ( HOLDING ?AUTO_2242 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2242 )
      ( MAKE-ON-TABLE ?AUTO_2239 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2239 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2243 - BLOCK
    )
    :vars
    (
      ?AUTO_2245 - BLOCK
      ?AUTO_2246 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2243 ?AUTO_2245 ) ( ON ?AUTO_2246 ?AUTO_2243 ) ( CLEAR ?AUTO_2246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2246 ?AUTO_2243 )
      ( MAKE-ON-TABLE ?AUTO_2243 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2243 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2249 - BLOCK
    )
    :vars
    (
      ?AUTO_2250 - BLOCK
      ?AUTO_2251 - BLOCK
      ?AUTO_2253 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2249 ?AUTO_2250 ) ( ON ?AUTO_2251 ?AUTO_2249 ) ( CLEAR ?AUTO_2251 ) ( HOLDING ?AUTO_2253 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2253 )
      ( MAKE-ON-TABLE ?AUTO_2249 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2257 - BLOCK
      ?AUTO_2258 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2257 ) ( CLEAR ?AUTO_2258 ) )
    :subtasks
    ( ( !STACK ?AUTO_2257 ?AUTO_2258 )
      ( MAKE-ON-VERIFY ?AUTO_2257 ?AUTO_2258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2261 - BLOCK
      ?AUTO_2262 - BLOCK
    )
    :vars
    (
      ?AUTO_2266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2262 ) ( ON ?AUTO_2261 ?AUTO_2266 ) ( CLEAR ?AUTO_2261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2261 ?AUTO_2266 )
      ( MAKE-ON ?AUTO_2261 ?AUTO_2262 )
      ( MAKE-ON-VERIFY ?AUTO_2261 ?AUTO_2262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2267 - BLOCK
      ?AUTO_2268 - BLOCK
    )
    :vars
    (
      ?AUTO_2271 - BLOCK
      ?AUTO_2272 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2268 ) ( ON ?AUTO_2267 ?AUTO_2271 ) ( CLEAR ?AUTO_2267 ) ( HOLDING ?AUTO_2272 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2272 )
      ( MAKE-ON ?AUTO_2267 ?AUTO_2268 )
      ( MAKE-ON-VERIFY ?AUTO_2267 ?AUTO_2268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2273 - BLOCK
      ?AUTO_2274 - BLOCK
    )
    :vars
    (
      ?AUTO_2277 - BLOCK
      ?AUTO_2278 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2274 ) ( ON ?AUTO_2273 ?AUTO_2277 ) ( ON ?AUTO_2278 ?AUTO_2273 ) ( CLEAR ?AUTO_2278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2278 ?AUTO_2273 )
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
      ?AUTO_2286 - BLOCK
      ?AUTO_2283 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2281 ?AUTO_2286 ) ( ON ?AUTO_2283 ?AUTO_2281 ) ( CLEAR ?AUTO_2283 ) ( HOLDING ?AUTO_2282 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2282 )
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
      ?AUTO_2293 - BLOCK
      ?AUTO_2290 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2288 ?AUTO_2293 ) ( ON ?AUTO_2290 ?AUTO_2288 ) ( ON ?AUTO_2289 ?AUTO_2290 ) ( CLEAR ?AUTO_2289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2289 ?AUTO_2290 )
      ( MAKE-ON ?AUTO_2288 ?AUTO_2289 )
      ( MAKE-ON-VERIFY ?AUTO_2288 ?AUTO_2289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2296 - BLOCK
      ?AUTO_2297 - BLOCK
    )
    :vars
    (
      ?AUTO_2300 - BLOCK
      ?AUTO_2299 - BLOCK
      ?AUTO_2302 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2296 ?AUTO_2300 ) ( ON ?AUTO_2299 ?AUTO_2296 ) ( ON ?AUTO_2297 ?AUTO_2299 ) ( CLEAR ?AUTO_2297 ) ( HOLDING ?AUTO_2302 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2302 )
      ( MAKE-ON ?AUTO_2296 ?AUTO_2297 )
      ( MAKE-ON-VERIFY ?AUTO_2296 ?AUTO_2297 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2306 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2306 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2306 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2306 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2308 - BLOCK
    )
    :vars
    (
      ?AUTO_2311 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2308 ?AUTO_2311 ) ( CLEAR ?AUTO_2308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2308 ?AUTO_2311 )
      ( MAKE-ON-TABLE ?AUTO_2308 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2308 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2312 - BLOCK
    )
    :vars
    (
      ?AUTO_2314 - BLOCK
      ?AUTO_2315 - BLOCK
      ?AUTO_2316 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2312 ?AUTO_2314 ) ( CLEAR ?AUTO_2312 ) ( HOLDING ?AUTO_2315 ) ( CLEAR ?AUTO_2316 ) )
    :subtasks
    ( ( !STACK ?AUTO_2315 ?AUTO_2316 )
      ( MAKE-ON-TABLE ?AUTO_2312 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2312 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2317 - BLOCK
    )
    :vars
    (
      ?AUTO_2319 - BLOCK
      ?AUTO_2321 - BLOCK
      ?AUTO_2320 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2317 ?AUTO_2319 ) ( CLEAR ?AUTO_2321 ) ( ON ?AUTO_2320 ?AUTO_2317 ) ( CLEAR ?AUTO_2320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2320 ?AUTO_2317 )
      ( MAKE-ON-TABLE ?AUTO_2317 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2317 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2324 - BLOCK
    )
    :vars
    (
      ?AUTO_2327 - BLOCK
      ?AUTO_2325 - BLOCK
      ?AUTO_2328 - BLOCK
      ?AUTO_2329 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2324 ?AUTO_2327 ) ( CLEAR ?AUTO_2325 ) ( ON ?AUTO_2328 ?AUTO_2324 ) ( CLEAR ?AUTO_2328 ) ( HOLDING ?AUTO_2329 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2329 )
      ( MAKE-ON-TABLE ?AUTO_2324 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2324 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2330 - BLOCK
    )
    :vars
    (
      ?AUTO_2332 - BLOCK
      ?AUTO_2333 - BLOCK
      ?AUTO_2331 - BLOCK
      ?AUTO_2335 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2330 ?AUTO_2332 ) ( CLEAR ?AUTO_2333 ) ( ON ?AUTO_2331 ?AUTO_2330 ) ( ON ?AUTO_2335 ?AUTO_2331 ) ( CLEAR ?AUTO_2335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2335 ?AUTO_2331 )
      ( MAKE-ON-TABLE ?AUTO_2330 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2330 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2338 - BLOCK
    )
    :vars
    (
      ?AUTO_2339 - BLOCK
      ?AUTO_2340 - BLOCK
      ?AUTO_2342 - BLOCK
      ?AUTO_2343 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2338 ?AUTO_2339 ) ( ON ?AUTO_2340 ?AUTO_2338 ) ( ON ?AUTO_2342 ?AUTO_2340 ) ( CLEAR ?AUTO_2342 ) ( HOLDING ?AUTO_2343 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2343 )
      ( MAKE-ON-TABLE ?AUTO_2338 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2338 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2345 - BLOCK
    )
    :vars
    (
      ?AUTO_2346 - BLOCK
      ?AUTO_2349 - BLOCK
      ?AUTO_2347 - BLOCK
      ?AUTO_2350 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2345 ?AUTO_2346 ) ( ON ?AUTO_2349 ?AUTO_2345 ) ( ON ?AUTO_2347 ?AUTO_2349 ) ( ON ?AUTO_2350 ?AUTO_2347 ) ( CLEAR ?AUTO_2350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2350 ?AUTO_2347 )
      ( MAKE-ON-TABLE ?AUTO_2345 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2345 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2353 - BLOCK
    )
    :vars
    (
      ?AUTO_2358 - BLOCK
      ?AUTO_2357 - BLOCK
      ?AUTO_2355 - BLOCK
      ?AUTO_2354 - BLOCK
      ?AUTO_2359 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2353 ?AUTO_2358 ) ( ON ?AUTO_2357 ?AUTO_2353 ) ( ON ?AUTO_2355 ?AUTO_2357 ) ( ON ?AUTO_2354 ?AUTO_2355 ) ( CLEAR ?AUTO_2354 ) ( HOLDING ?AUTO_2359 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2359 )
      ( MAKE-ON-TABLE ?AUTO_2353 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2363 - BLOCK
      ?AUTO_2364 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2363 ) ( CLEAR ?AUTO_2364 ) )
    :subtasks
    ( ( !STACK ?AUTO_2363 ?AUTO_2364 )
      ( MAKE-ON-VERIFY ?AUTO_2363 ?AUTO_2364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2367 - BLOCK
      ?AUTO_2368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2368 ) ( ON-TABLE ?AUTO_2367 ) ( CLEAR ?AUTO_2367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2367 )
      ( MAKE-ON ?AUTO_2367 ?AUTO_2368 )
      ( MAKE-ON-VERIFY ?AUTO_2367 ?AUTO_2368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2372 - BLOCK
      ?AUTO_2373 - BLOCK
    )
    :vars
    (
      ?AUTO_2376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2373 ) ( ON-TABLE ?AUTO_2372 ) ( CLEAR ?AUTO_2372 ) ( HOLDING ?AUTO_2376 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2376 )
      ( MAKE-ON ?AUTO_2372 ?AUTO_2373 )
      ( MAKE-ON-VERIFY ?AUTO_2372 ?AUTO_2373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2377 - BLOCK
      ?AUTO_2378 - BLOCK
    )
    :vars
    (
      ?AUTO_2381 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2378 ) ( ON-TABLE ?AUTO_2377 ) ( ON ?AUTO_2381 ?AUTO_2377 ) ( CLEAR ?AUTO_2381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2381 ?AUTO_2377 )
      ( MAKE-ON ?AUTO_2377 ?AUTO_2378 )
      ( MAKE-ON-VERIFY ?AUTO_2377 ?AUTO_2378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2384 - BLOCK
      ?AUTO_2385 - BLOCK
    )
    :vars
    (
      ?AUTO_2388 - BLOCK
      ?AUTO_2389 - BLOCK
      ?AUTO_2390 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2385 ) ( ON-TABLE ?AUTO_2384 ) ( ON ?AUTO_2388 ?AUTO_2384 ) ( CLEAR ?AUTO_2388 ) ( HOLDING ?AUTO_2389 ) ( CLEAR ?AUTO_2390 ) )
    :subtasks
    ( ( !STACK ?AUTO_2389 ?AUTO_2390 )
      ( MAKE-ON ?AUTO_2384 ?AUTO_2385 )
      ( MAKE-ON-VERIFY ?AUTO_2384 ?AUTO_2385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2391 - BLOCK
      ?AUTO_2392 - BLOCK
    )
    :vars
    (
      ?AUTO_2393 - BLOCK
      ?AUTO_2397 - BLOCK
      ?AUTO_2396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2392 ) ( ON-TABLE ?AUTO_2391 ) ( ON ?AUTO_2393 ?AUTO_2391 ) ( CLEAR ?AUTO_2397 ) ( ON ?AUTO_2396 ?AUTO_2393 ) ( CLEAR ?AUTO_2396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2396 ?AUTO_2393 )
      ( MAKE-ON ?AUTO_2391 ?AUTO_2392 )
      ( MAKE-ON-VERIFY ?AUTO_2391 ?AUTO_2392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2400 - BLOCK
      ?AUTO_2401 - BLOCK
    )
    :vars
    (
      ?AUTO_2403 - BLOCK
      ?AUTO_2406 - BLOCK
      ?AUTO_2402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2400 ) ( ON ?AUTO_2403 ?AUTO_2400 ) ( CLEAR ?AUTO_2406 ) ( ON ?AUTO_2402 ?AUTO_2403 ) ( CLEAR ?AUTO_2402 ) ( HOLDING ?AUTO_2401 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2401 )
      ( MAKE-ON ?AUTO_2400 ?AUTO_2401 )
      ( MAKE-ON-VERIFY ?AUTO_2400 ?AUTO_2401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2408 - BLOCK
      ?AUTO_2409 - BLOCK
    )
    :vars
    (
      ?AUTO_2411 - BLOCK
      ?AUTO_2414 - BLOCK
      ?AUTO_2410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2408 ) ( ON ?AUTO_2411 ?AUTO_2408 ) ( CLEAR ?AUTO_2414 ) ( ON ?AUTO_2410 ?AUTO_2411 ) ( ON ?AUTO_2409 ?AUTO_2410 ) ( CLEAR ?AUTO_2409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2409 ?AUTO_2410 )
      ( MAKE-ON ?AUTO_2408 ?AUTO_2409 )
      ( MAKE-ON-VERIFY ?AUTO_2408 ?AUTO_2409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2417 - BLOCK
      ?AUTO_2418 - BLOCK
    )
    :vars
    (
      ?AUTO_2421 - BLOCK
      ?AUTO_2422 - BLOCK
      ?AUTO_2423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2417 ) ( ON ?AUTO_2421 ?AUTO_2417 ) ( ON ?AUTO_2422 ?AUTO_2421 ) ( ON ?AUTO_2418 ?AUTO_2422 ) ( CLEAR ?AUTO_2418 ) ( HOLDING ?AUTO_2423 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2423 )
      ( MAKE-ON ?AUTO_2417 ?AUTO_2418 )
      ( MAKE-ON-VERIFY ?AUTO_2417 ?AUTO_2418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2425 - BLOCK
      ?AUTO_2426 - BLOCK
    )
    :vars
    (
      ?AUTO_2427 - BLOCK
      ?AUTO_2431 - BLOCK
      ?AUTO_2430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2425 ) ( ON ?AUTO_2427 ?AUTO_2425 ) ( ON ?AUTO_2431 ?AUTO_2427 ) ( ON ?AUTO_2426 ?AUTO_2431 ) ( ON ?AUTO_2430 ?AUTO_2426 ) ( CLEAR ?AUTO_2430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2430 ?AUTO_2426 )
      ( MAKE-ON ?AUTO_2425 ?AUTO_2426 )
      ( MAKE-ON-VERIFY ?AUTO_2425 ?AUTO_2426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2434 - BLOCK
      ?AUTO_2435 - BLOCK
    )
    :vars
    (
      ?AUTO_2439 - BLOCK
      ?AUTO_2440 - BLOCK
      ?AUTO_2437 - BLOCK
      ?AUTO_2441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2434 ) ( ON ?AUTO_2439 ?AUTO_2434 ) ( ON ?AUTO_2440 ?AUTO_2439 ) ( ON ?AUTO_2435 ?AUTO_2440 ) ( ON ?AUTO_2437 ?AUTO_2435 ) ( CLEAR ?AUTO_2437 ) ( HOLDING ?AUTO_2441 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2441 )
      ( MAKE-ON ?AUTO_2434 ?AUTO_2435 )
      ( MAKE-ON-VERIFY ?AUTO_2434 ?AUTO_2435 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2445 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2445 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2445 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2445 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2447 - BLOCK
    )
    :vars
    (
      ?AUTO_2450 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2447 ?AUTO_2450 ) ( CLEAR ?AUTO_2447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2447 ?AUTO_2450 )
      ( MAKE-ON-TABLE ?AUTO_2447 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2447 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2451 - BLOCK
    )
    :vars
    (
      ?AUTO_2453 - BLOCK
      ?AUTO_2454 - BLOCK
      ?AUTO_2455 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2451 ?AUTO_2453 ) ( CLEAR ?AUTO_2451 ) ( HOLDING ?AUTO_2454 ) ( CLEAR ?AUTO_2455 ) )
    :subtasks
    ( ( !STACK ?AUTO_2454 ?AUTO_2455 )
      ( MAKE-ON-TABLE ?AUTO_2451 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2469 - BLOCK
      ?AUTO_2470 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2469 ) ( CLEAR ?AUTO_2470 ) )
    :subtasks
    ( ( !STACK ?AUTO_2469 ?AUTO_2470 )
      ( MAKE-ON-VERIFY ?AUTO_2469 ?AUTO_2470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2473 - BLOCK
      ?AUTO_2474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2474 ) ( ON-TABLE ?AUTO_2473 ) ( CLEAR ?AUTO_2473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2473 )
      ( MAKE-ON ?AUTO_2473 ?AUTO_2474 )
      ( MAKE-ON-VERIFY ?AUTO_2473 ?AUTO_2474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2478 - BLOCK
      ?AUTO_2479 - BLOCK
    )
    :vars
    (
      ?AUTO_2482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2479 ) ( ON-TABLE ?AUTO_2478 ) ( CLEAR ?AUTO_2478 ) ( HOLDING ?AUTO_2482 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2482 )
      ( MAKE-ON ?AUTO_2478 ?AUTO_2479 )
      ( MAKE-ON-VERIFY ?AUTO_2478 ?AUTO_2479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2483 - BLOCK
      ?AUTO_2484 - BLOCK
    )
    :vars
    (
      ?AUTO_2487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2484 ) ( ON-TABLE ?AUTO_2483 ) ( ON ?AUTO_2487 ?AUTO_2483 ) ( CLEAR ?AUTO_2487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2487 ?AUTO_2483 )
      ( MAKE-ON ?AUTO_2483 ?AUTO_2484 )
      ( MAKE-ON-VERIFY ?AUTO_2483 ?AUTO_2484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2490 - BLOCK
      ?AUTO_2491 - BLOCK
    )
    :vars
    (
      ?AUTO_2494 - BLOCK
      ?AUTO_2496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2490 ) ( ON ?AUTO_2494 ?AUTO_2490 ) ( CLEAR ?AUTO_2494 ) ( HOLDING ?AUTO_2491 ) ( CLEAR ?AUTO_2496 ) )
    :subtasks
    ( ( !STACK ?AUTO_2491 ?AUTO_2496 )
      ( MAKE-ON ?AUTO_2490 ?AUTO_2491 )
      ( MAKE-ON-VERIFY ?AUTO_2490 ?AUTO_2491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2499 - BLOCK
      ?AUTO_2500 - BLOCK
    )
    :vars
    (
      ?AUTO_2503 - BLOCK
      ?AUTO_2504 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2500 ) ( ON-TABLE ?AUTO_2499 ) ( ON ?AUTO_2503 ?AUTO_2499 ) ( CLEAR ?AUTO_2503 ) ( HOLDING ?AUTO_2504 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2504 )
      ( MAKE-ON ?AUTO_2499 ?AUTO_2500 )
      ( MAKE-ON-VERIFY ?AUTO_2499 ?AUTO_2500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2505 - BLOCK
      ?AUTO_2506 - BLOCK
    )
    :vars
    (
      ?AUTO_2509 - BLOCK
      ?AUTO_2510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2505 ) ( ON ?AUTO_2509 ?AUTO_2505 ) ( CLEAR ?AUTO_2509 ) ( ON ?AUTO_2510 ?AUTO_2506 ) ( CLEAR ?AUTO_2510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2510 ?AUTO_2506 )
      ( MAKE-ON ?AUTO_2505 ?AUTO_2506 )
      ( MAKE-ON-VERIFY ?AUTO_2505 ?AUTO_2506 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2513 - BLOCK
      ?AUTO_2514 - BLOCK
    )
    :vars
    (
      ?AUTO_2515 - BLOCK
      ?AUTO_2518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2513 ) ( ON ?AUTO_2515 ?AUTO_2514 ) ( CLEAR ?AUTO_2515 ) ( HOLDING ?AUTO_2518 ) ( CLEAR ?AUTO_2513 ) )
    :subtasks
    ( ( !STACK ?AUTO_2518 ?AUTO_2513 )
      ( MAKE-ON ?AUTO_2513 ?AUTO_2514 )
      ( MAKE-ON-VERIFY ?AUTO_2513 ?AUTO_2514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2521 - BLOCK
      ?AUTO_2522 - BLOCK
    )
    :vars
    (
      ?AUTO_2526 - BLOCK
      ?AUTO_2523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2521 ) ( ON ?AUTO_2526 ?AUTO_2522 ) ( CLEAR ?AUTO_2521 ) ( ON ?AUTO_2523 ?AUTO_2526 ) ( CLEAR ?AUTO_2523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2523 ?AUTO_2526 )
      ( MAKE-ON ?AUTO_2521 ?AUTO_2522 )
      ( MAKE-ON-VERIFY ?AUTO_2521 ?AUTO_2522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2529 - BLOCK
      ?AUTO_2530 - BLOCK
    )
    :vars
    (
      ?AUTO_2534 - BLOCK
      ?AUTO_2531 - BLOCK
      ?AUTO_2535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2529 ) ( ON ?AUTO_2534 ?AUTO_2530 ) ( CLEAR ?AUTO_2529 ) ( ON ?AUTO_2531 ?AUTO_2534 ) ( CLEAR ?AUTO_2531 ) ( HOLDING ?AUTO_2535 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2535 )
      ( MAKE-ON ?AUTO_2529 ?AUTO_2530 )
      ( MAKE-ON-VERIFY ?AUTO_2529 ?AUTO_2530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2536 - BLOCK
      ?AUTO_2537 - BLOCK
    )
    :vars
    (
      ?AUTO_2541 - BLOCK
      ?AUTO_2538 - BLOCK
      ?AUTO_2542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2536 ) ( ON ?AUTO_2541 ?AUTO_2537 ) ( CLEAR ?AUTO_2536 ) ( ON ?AUTO_2538 ?AUTO_2541 ) ( ON ?AUTO_2542 ?AUTO_2538 ) ( CLEAR ?AUTO_2542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2542 ?AUTO_2538 )
      ( MAKE-ON ?AUTO_2536 ?AUTO_2537 )
      ( MAKE-ON-VERIFY ?AUTO_2536 ?AUTO_2537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2545 - BLOCK
      ?AUTO_2546 - BLOCK
    )
    :vars
    (
      ?AUTO_2550 - BLOCK
      ?AUTO_2547 - BLOCK
      ?AUTO_2549 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2550 ?AUTO_2546 ) ( ON ?AUTO_2547 ?AUTO_2550 ) ( ON ?AUTO_2549 ?AUTO_2547 ) ( CLEAR ?AUTO_2549 ) ( HOLDING ?AUTO_2545 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2545 )
      ( MAKE-ON ?AUTO_2545 ?AUTO_2546 )
      ( MAKE-ON-VERIFY ?AUTO_2545 ?AUTO_2546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2553 - BLOCK
      ?AUTO_2554 - BLOCK
    )
    :vars
    (
      ?AUTO_2557 - BLOCK
      ?AUTO_2555 - BLOCK
      ?AUTO_2556 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2557 ?AUTO_2554 ) ( ON ?AUTO_2555 ?AUTO_2557 ) ( ON ?AUTO_2556 ?AUTO_2555 ) ( ON ?AUTO_2553 ?AUTO_2556 ) ( CLEAR ?AUTO_2553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2553 ?AUTO_2556 )
      ( MAKE-ON ?AUTO_2553 ?AUTO_2554 )
      ( MAKE-ON-VERIFY ?AUTO_2553 ?AUTO_2554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2562 - BLOCK
      ?AUTO_2563 - BLOCK
    )
    :vars
    (
      ?AUTO_2568 - BLOCK
      ?AUTO_2566 - BLOCK
      ?AUTO_2567 - BLOCK
      ?AUTO_2569 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2568 ?AUTO_2563 ) ( ON ?AUTO_2566 ?AUTO_2568 ) ( ON ?AUTO_2567 ?AUTO_2566 ) ( ON ?AUTO_2562 ?AUTO_2567 ) ( CLEAR ?AUTO_2562 ) ( HOLDING ?AUTO_2569 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2569 )
      ( MAKE-ON ?AUTO_2562 ?AUTO_2563 )
      ( MAKE-ON-VERIFY ?AUTO_2562 ?AUTO_2563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2574 - BLOCK
      ?AUTO_2575 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2574 ) ( CLEAR ?AUTO_2575 ) )
    :subtasks
    ( ( !STACK ?AUTO_2574 ?AUTO_2575 )
      ( MAKE-ON-VERIFY ?AUTO_2574 ?AUTO_2575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2578 - BLOCK
      ?AUTO_2579 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2579 ) ( ON-TABLE ?AUTO_2578 ) ( CLEAR ?AUTO_2578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2578 )
      ( MAKE-ON ?AUTO_2578 ?AUTO_2579 )
      ( MAKE-ON-VERIFY ?AUTO_2578 ?AUTO_2579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2583 - BLOCK
      ?AUTO_2584 - BLOCK
    )
    :vars
    (
      ?AUTO_2588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2583 ) ( CLEAR ?AUTO_2583 ) ( HOLDING ?AUTO_2584 ) ( CLEAR ?AUTO_2588 ) )
    :subtasks
    ( ( !STACK ?AUTO_2584 ?AUTO_2588 )
      ( MAKE-ON ?AUTO_2583 ?AUTO_2584 )
      ( MAKE-ON-VERIFY ?AUTO_2583 ?AUTO_2584 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2590 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2590 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2590 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2590 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2592 - BLOCK
    )
    :vars
    (
      ?AUTO_2595 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2592 ?AUTO_2595 ) ( CLEAR ?AUTO_2592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2592 ?AUTO_2595 )
      ( MAKE-ON-TABLE ?AUTO_2592 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2592 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2598 - BLOCK
      ?AUTO_2599 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2598 ) ( CLEAR ?AUTO_2599 ) )
    :subtasks
    ( ( !STACK ?AUTO_2598 ?AUTO_2599 )
      ( MAKE-ON-VERIFY ?AUTO_2598 ?AUTO_2599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2602 - BLOCK
      ?AUTO_2603 - BLOCK
    )
    :vars
    (
      ?AUTO_2607 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2603 ) ( ON ?AUTO_2602 ?AUTO_2607 ) ( CLEAR ?AUTO_2602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2602 ?AUTO_2607 )
      ( MAKE-ON ?AUTO_2602 ?AUTO_2603 )
      ( MAKE-ON-VERIFY ?AUTO_2602 ?AUTO_2603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2608 - BLOCK
      ?AUTO_2609 - BLOCK
    )
    :vars
    (
      ?AUTO_2612 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2608 ?AUTO_2612 ) ( CLEAR ?AUTO_2608 ) ( HOLDING ?AUTO_2609 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2609 )
      ( MAKE-ON ?AUTO_2608 ?AUTO_2609 )
      ( MAKE-ON-VERIFY ?AUTO_2608 ?AUTO_2609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2614 - BLOCK
      ?AUTO_2615 - BLOCK
    )
    :vars
    (
      ?AUTO_2618 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2614 ?AUTO_2618 ) ( ON ?AUTO_2615 ?AUTO_2614 ) ( CLEAR ?AUTO_2615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2615 ?AUTO_2614 )
      ( MAKE-ON ?AUTO_2614 ?AUTO_2615 )
      ( MAKE-ON-VERIFY ?AUTO_2614 ?AUTO_2615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2623 - BLOCK
      ?AUTO_2624 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2623 ) ( CLEAR ?AUTO_2624 ) )
    :subtasks
    ( ( !STACK ?AUTO_2623 ?AUTO_2624 )
      ( MAKE-ON-VERIFY ?AUTO_2623 ?AUTO_2624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2627 - BLOCK
      ?AUTO_2628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2628 ) ( ON-TABLE ?AUTO_2627 ) ( CLEAR ?AUTO_2627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2627 )
      ( MAKE-ON ?AUTO_2627 ?AUTO_2628 )
      ( MAKE-ON-VERIFY ?AUTO_2627 ?AUTO_2628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2632 - BLOCK
      ?AUTO_2633 - BLOCK
    )
    :vars
    (
      ?AUTO_2636 - BLOCK
      ?AUTO_2637 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2633 ) ( ON-TABLE ?AUTO_2632 ) ( CLEAR ?AUTO_2632 ) ( HOLDING ?AUTO_2636 ) ( CLEAR ?AUTO_2637 ) )
    :subtasks
    ( ( !STACK ?AUTO_2636 ?AUTO_2637 )
      ( MAKE-ON ?AUTO_2632 ?AUTO_2633 )
      ( MAKE-ON-VERIFY ?AUTO_2632 ?AUTO_2633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2638 - BLOCK
      ?AUTO_2639 - BLOCK
    )
    :vars
    (
      ?AUTO_2641 - BLOCK
      ?AUTO_2643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2638 ) ( CLEAR ?AUTO_2638 ) ( CLEAR ?AUTO_2641 ) ( ON ?AUTO_2643 ?AUTO_2639 ) ( CLEAR ?AUTO_2643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2643 ?AUTO_2639 )
      ( MAKE-ON ?AUTO_2638 ?AUTO_2639 )
      ( MAKE-ON-VERIFY ?AUTO_2638 ?AUTO_2639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2646 - BLOCK
      ?AUTO_2647 - BLOCK
    )
    :vars
    (
      ?AUTO_2651 - BLOCK
      ?AUTO_2650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2646 ) ( CLEAR ?AUTO_2646 ) ( ON ?AUTO_2651 ?AUTO_2647 ) ( CLEAR ?AUTO_2651 ) ( HOLDING ?AUTO_2650 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2650 )
      ( MAKE-ON ?AUTO_2646 ?AUTO_2647 )
      ( MAKE-ON-VERIFY ?AUTO_2646 ?AUTO_2647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2653 - BLOCK
      ?AUTO_2654 - BLOCK
    )
    :vars
    (
      ?AUTO_2657 - BLOCK
      ?AUTO_2658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2653 ) ( CLEAR ?AUTO_2653 ) ( ON ?AUTO_2657 ?AUTO_2654 ) ( ON ?AUTO_2658 ?AUTO_2657 ) ( CLEAR ?AUTO_2658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2658 ?AUTO_2657 )
      ( MAKE-ON ?AUTO_2653 ?AUTO_2654 )
      ( MAKE-ON-VERIFY ?AUTO_2653 ?AUTO_2654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2663 - BLOCK
      ?AUTO_2664 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2663 ) ( CLEAR ?AUTO_2664 ) )
    :subtasks
    ( ( !STACK ?AUTO_2663 ?AUTO_2664 )
      ( MAKE-ON-VERIFY ?AUTO_2663 ?AUTO_2664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2667 - BLOCK
      ?AUTO_2668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2668 ) ( ON-TABLE ?AUTO_2667 ) ( CLEAR ?AUTO_2667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2667 )
      ( MAKE-ON ?AUTO_2667 ?AUTO_2668 )
      ( MAKE-ON-VERIFY ?AUTO_2667 ?AUTO_2668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2672 - BLOCK
      ?AUTO_2673 - BLOCK
    )
    :vars
    (
      ?AUTO_2676 - BLOCK
      ?AUTO_2677 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2673 ) ( ON-TABLE ?AUTO_2672 ) ( CLEAR ?AUTO_2672 ) ( HOLDING ?AUTO_2676 ) ( CLEAR ?AUTO_2677 ) )
    :subtasks
    ( ( !STACK ?AUTO_2676 ?AUTO_2677 )
      ( MAKE-ON ?AUTO_2672 ?AUTO_2673 )
      ( MAKE-ON-VERIFY ?AUTO_2672 ?AUTO_2673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2680 - BLOCK
      ?AUTO_2681 - BLOCK
    )
    :vars
    (
      ?AUTO_2685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2680 ) ( CLEAR ?AUTO_2680 ) ( HOLDING ?AUTO_2681 ) ( CLEAR ?AUTO_2685 ) )
    :subtasks
    ( ( !STACK ?AUTO_2681 ?AUTO_2685 )
      ( MAKE-ON ?AUTO_2680 ?AUTO_2681 )
      ( MAKE-ON-VERIFY ?AUTO_2680 ?AUTO_2681 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2687 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2687 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2687 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2687 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2689 - BLOCK
    )
    :vars
    (
      ?AUTO_2692 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2689 ?AUTO_2692 ) ( CLEAR ?AUTO_2689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2689 ?AUTO_2692 )
      ( MAKE-ON-TABLE ?AUTO_2689 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2689 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2694 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2694 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2694 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2694 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2696 - BLOCK
    )
    :vars
    (
      ?AUTO_2699 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2696 ?AUTO_2699 ) ( CLEAR ?AUTO_2696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2696 ?AUTO_2699 )
      ( MAKE-ON-TABLE ?AUTO_2696 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2696 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2700 - BLOCK
    )
    :vars
    (
      ?AUTO_2702 - BLOCK
      ?AUTO_2703 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2700 ?AUTO_2702 ) ( CLEAR ?AUTO_2700 ) ( HOLDING ?AUTO_2703 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2703 )
      ( MAKE-ON-TABLE ?AUTO_2700 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2700 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2704 - BLOCK
    )
    :vars
    (
      ?AUTO_2706 - BLOCK
      ?AUTO_2707 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2704 ?AUTO_2706 ) ( ON ?AUTO_2707 ?AUTO_2704 ) ( CLEAR ?AUTO_2707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2707 ?AUTO_2704 )
      ( MAKE-ON-TABLE ?AUTO_2704 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2704 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2711 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2711 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2711 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2711 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2713 - BLOCK
    )
    :vars
    (
      ?AUTO_2716 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2713 ?AUTO_2716 ) ( CLEAR ?AUTO_2713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2713 ?AUTO_2716 )
      ( MAKE-ON-TABLE ?AUTO_2713 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2713 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2717 - BLOCK
    )
    :vars
    (
      ?AUTO_2719 - BLOCK
      ?AUTO_2720 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2717 ?AUTO_2719 ) ( CLEAR ?AUTO_2717 ) ( HOLDING ?AUTO_2720 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2720 )
      ( MAKE-ON-TABLE ?AUTO_2717 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2717 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2721 - BLOCK
    )
    :vars
    (
      ?AUTO_2723 - BLOCK
      ?AUTO_2724 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2721 ?AUTO_2723 ) ( ON ?AUTO_2724 ?AUTO_2721 ) ( CLEAR ?AUTO_2724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2724 ?AUTO_2721 )
      ( MAKE-ON-TABLE ?AUTO_2721 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2721 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2727 - BLOCK
    )
    :vars
    (
      ?AUTO_2728 - BLOCK
      ?AUTO_2729 - BLOCK
      ?AUTO_2731 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2727 ?AUTO_2728 ) ( ON ?AUTO_2729 ?AUTO_2727 ) ( CLEAR ?AUTO_2729 ) ( HOLDING ?AUTO_2731 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2731 )
      ( MAKE-ON-TABLE ?AUTO_2727 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2727 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2732 - BLOCK
    )
    :vars
    (
      ?AUTO_2733 - BLOCK
      ?AUTO_2735 - BLOCK
      ?AUTO_2736 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2732 ?AUTO_2733 ) ( ON ?AUTO_2735 ?AUTO_2732 ) ( ON ?AUTO_2736 ?AUTO_2735 ) ( CLEAR ?AUTO_2736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2736 ?AUTO_2735 )
      ( MAKE-ON-TABLE ?AUTO_2732 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2741 - BLOCK
      ?AUTO_2742 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2741 ) ( CLEAR ?AUTO_2742 ) )
    :subtasks
    ( ( !STACK ?AUTO_2741 ?AUTO_2742 )
      ( MAKE-ON-VERIFY ?AUTO_2741 ?AUTO_2742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2745 - BLOCK
      ?AUTO_2746 - BLOCK
    )
    :vars
    (
      ?AUTO_2750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2746 ) ( ON ?AUTO_2745 ?AUTO_2750 ) ( CLEAR ?AUTO_2745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2745 ?AUTO_2750 )
      ( MAKE-ON ?AUTO_2745 ?AUTO_2746 )
      ( MAKE-ON-VERIFY ?AUTO_2745 ?AUTO_2746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2751 - BLOCK
      ?AUTO_2752 - BLOCK
    )
    :vars
    (
      ?AUTO_2755 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2751 ?AUTO_2755 ) ( CLEAR ?AUTO_2751 ) ( HOLDING ?AUTO_2752 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2752 )
      ( MAKE-ON ?AUTO_2751 ?AUTO_2752 )
      ( MAKE-ON-VERIFY ?AUTO_2751 ?AUTO_2752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2757 - BLOCK
      ?AUTO_2758 - BLOCK
    )
    :vars
    (
      ?AUTO_2761 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2757 ?AUTO_2761 ) ( ON ?AUTO_2758 ?AUTO_2757 ) ( CLEAR ?AUTO_2758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2758 ?AUTO_2757 )
      ( MAKE-ON ?AUTO_2757 ?AUTO_2758 )
      ( MAKE-ON-VERIFY ?AUTO_2757 ?AUTO_2758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2764 - BLOCK
      ?AUTO_2765 - BLOCK
    )
    :vars
    (
      ?AUTO_2768 - BLOCK
      ?AUTO_2769 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2764 ?AUTO_2768 ) ( ON ?AUTO_2765 ?AUTO_2764 ) ( CLEAR ?AUTO_2765 ) ( HOLDING ?AUTO_2769 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2769 )
      ( MAKE-ON ?AUTO_2764 ?AUTO_2765 )
      ( MAKE-ON-VERIFY ?AUTO_2764 ?AUTO_2765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2770 - BLOCK
      ?AUTO_2771 - BLOCK
    )
    :vars
    (
      ?AUTO_2773 - BLOCK
      ?AUTO_2775 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2770 ?AUTO_2773 ) ( ON ?AUTO_2771 ?AUTO_2770 ) ( ON ?AUTO_2775 ?AUTO_2771 ) ( CLEAR ?AUTO_2775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2775 ?AUTO_2771 )
      ( MAKE-ON ?AUTO_2770 ?AUTO_2771 )
      ( MAKE-ON-VERIFY ?AUTO_2770 ?AUTO_2771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2778 - BLOCK
      ?AUTO_2779 - BLOCK
    )
    :vars
    (
      ?AUTO_2780 - BLOCK
      ?AUTO_2782 - BLOCK
      ?AUTO_2784 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2778 ?AUTO_2780 ) ( ON ?AUTO_2779 ?AUTO_2778 ) ( ON ?AUTO_2782 ?AUTO_2779 ) ( CLEAR ?AUTO_2782 ) ( HOLDING ?AUTO_2784 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2784 )
      ( MAKE-ON ?AUTO_2778 ?AUTO_2779 )
      ( MAKE-ON-VERIFY ?AUTO_2778 ?AUTO_2779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2785 - BLOCK
      ?AUTO_2786 - BLOCK
    )
    :vars
    (
      ?AUTO_2787 - BLOCK
      ?AUTO_2790 - BLOCK
      ?AUTO_2791 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2785 ?AUTO_2787 ) ( ON ?AUTO_2786 ?AUTO_2785 ) ( ON ?AUTO_2790 ?AUTO_2786 ) ( ON ?AUTO_2791 ?AUTO_2790 ) ( CLEAR ?AUTO_2791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2791 ?AUTO_2790 )
      ( MAKE-ON ?AUTO_2785 ?AUTO_2786 )
      ( MAKE-ON-VERIFY ?AUTO_2785 ?AUTO_2786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2796 - BLOCK
      ?AUTO_2797 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2796 ) ( CLEAR ?AUTO_2797 ) )
    :subtasks
    ( ( !STACK ?AUTO_2796 ?AUTO_2797 )
      ( MAKE-ON-VERIFY ?AUTO_2796 ?AUTO_2797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2800 - BLOCK
      ?AUTO_2801 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2801 ) ( ON-TABLE ?AUTO_2800 ) ( CLEAR ?AUTO_2800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2800 )
      ( MAKE-ON ?AUTO_2800 ?AUTO_2801 )
      ( MAKE-ON-VERIFY ?AUTO_2800 ?AUTO_2801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2805 - BLOCK
      ?AUTO_2806 - BLOCK
    )
    :vars
    (
      ?AUTO_2810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2805 ) ( CLEAR ?AUTO_2805 ) ( HOLDING ?AUTO_2806 ) ( CLEAR ?AUTO_2810 ) )
    :subtasks
    ( ( !STACK ?AUTO_2806 ?AUTO_2810 )
      ( MAKE-ON ?AUTO_2805 ?AUTO_2806 )
      ( MAKE-ON-VERIFY ?AUTO_2805 ?AUTO_2806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2813 - BLOCK
      ?AUTO_2814 - BLOCK
    )
    :vars
    (
      ?AUTO_2817 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2814 ) ( ON-TABLE ?AUTO_2813 ) ( CLEAR ?AUTO_2813 ) ( HOLDING ?AUTO_2817 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2817 )
      ( MAKE-ON ?AUTO_2813 ?AUTO_2814 )
      ( MAKE-ON-VERIFY ?AUTO_2813 ?AUTO_2814 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2818 - BLOCK
      ?AUTO_2819 - BLOCK
    )
    :vars
    (
      ?AUTO_2822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2818 ) ( CLEAR ?AUTO_2818 ) ( ON ?AUTO_2822 ?AUTO_2819 ) ( CLEAR ?AUTO_2822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2822 ?AUTO_2819 )
      ( MAKE-ON ?AUTO_2818 ?AUTO_2819 )
      ( MAKE-ON-VERIFY ?AUTO_2818 ?AUTO_2819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2825 - BLOCK
      ?AUTO_2826 - BLOCK
    )
    :vars
    (
      ?AUTO_2827 - BLOCK
      ?AUTO_2830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2825 ) ( CLEAR ?AUTO_2825 ) ( ON ?AUTO_2827 ?AUTO_2826 ) ( CLEAR ?AUTO_2827 ) ( HOLDING ?AUTO_2830 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2830 )
      ( MAKE-ON ?AUTO_2825 ?AUTO_2826 )
      ( MAKE-ON-VERIFY ?AUTO_2825 ?AUTO_2826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2831 - BLOCK
      ?AUTO_2832 - BLOCK
    )
    :vars
    (
      ?AUTO_2835 - BLOCK
      ?AUTO_2836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2831 ) ( CLEAR ?AUTO_2831 ) ( ON ?AUTO_2835 ?AUTO_2832 ) ( ON ?AUTO_2836 ?AUTO_2835 ) ( CLEAR ?AUTO_2836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2836 ?AUTO_2835 )
      ( MAKE-ON ?AUTO_2831 ?AUTO_2832 )
      ( MAKE-ON-VERIFY ?AUTO_2831 ?AUTO_2832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2839 - BLOCK
      ?AUTO_2840 - BLOCK
    )
    :vars
    (
      ?AUTO_2844 - BLOCK
      ?AUTO_2841 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2844 ?AUTO_2840 ) ( ON ?AUTO_2841 ?AUTO_2844 ) ( CLEAR ?AUTO_2841 ) ( HOLDING ?AUTO_2839 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2839 )
      ( MAKE-ON ?AUTO_2839 ?AUTO_2840 )
      ( MAKE-ON-VERIFY ?AUTO_2839 ?AUTO_2840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2846 - BLOCK
      ?AUTO_2847 - BLOCK
    )
    :vars
    (
      ?AUTO_2849 - BLOCK
      ?AUTO_2848 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2849 ?AUTO_2847 ) ( ON ?AUTO_2848 ?AUTO_2849 ) ( ON ?AUTO_2846 ?AUTO_2848 ) ( CLEAR ?AUTO_2846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2846 ?AUTO_2848 )
      ( MAKE-ON ?AUTO_2846 ?AUTO_2847 )
      ( MAKE-ON-VERIFY ?AUTO_2846 ?AUTO_2847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2856 - BLOCK
      ?AUTO_2857 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2856 ) ( CLEAR ?AUTO_2857 ) )
    :subtasks
    ( ( !STACK ?AUTO_2856 ?AUTO_2857 )
      ( MAKE-ON-VERIFY ?AUTO_2856 ?AUTO_2857 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2860 - BLOCK
      ?AUTO_2861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2861 ) ( ON-TABLE ?AUTO_2860 ) ( CLEAR ?AUTO_2860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2860 )
      ( MAKE-ON ?AUTO_2860 ?AUTO_2861 )
      ( MAKE-ON-VERIFY ?AUTO_2860 ?AUTO_2861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2865 - BLOCK
      ?AUTO_2866 - BLOCK
    )
    :vars
    (
      ?AUTO_2869 - BLOCK
      ?AUTO_2870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2866 ) ( ON-TABLE ?AUTO_2865 ) ( CLEAR ?AUTO_2865 ) ( HOLDING ?AUTO_2869 ) ( CLEAR ?AUTO_2870 ) )
    :subtasks
    ( ( !STACK ?AUTO_2869 ?AUTO_2870 )
      ( MAKE-ON ?AUTO_2865 ?AUTO_2866 )
      ( MAKE-ON-VERIFY ?AUTO_2865 ?AUTO_2866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2891 - BLOCK
      ?AUTO_2892 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2891 ) ( CLEAR ?AUTO_2892 ) )
    :subtasks
    ( ( !STACK ?AUTO_2891 ?AUTO_2892 )
      ( MAKE-ON-VERIFY ?AUTO_2891 ?AUTO_2892 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2895 - BLOCK
      ?AUTO_2896 - BLOCK
    )
    :vars
    (
      ?AUTO_2900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2896 ) ( ON ?AUTO_2895 ?AUTO_2900 ) ( CLEAR ?AUTO_2895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2895 ?AUTO_2900 )
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
      ?AUTO_2906 - BLOCK
      ?AUTO_2907 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2902 ) ( ON ?AUTO_2901 ?AUTO_2905 ) ( CLEAR ?AUTO_2901 ) ( HOLDING ?AUTO_2906 ) ( CLEAR ?AUTO_2907 ) )
    :subtasks
    ( ( !STACK ?AUTO_2906 ?AUTO_2907 )
      ( MAKE-ON ?AUTO_2901 ?AUTO_2902 )
      ( MAKE-ON-VERIFY ?AUTO_2901 ?AUTO_2902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2916 - BLOCK
      ?AUTO_2917 - BLOCK
    )
    :vars
    (
      ?AUTO_2920 - BLOCK
      ?AUTO_2922 - BLOCK
      ?AUTO_2921 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2916 ?AUTO_2920 ) ( CLEAR ?AUTO_2916 ) ( CLEAR ?AUTO_2922 ) ( ON ?AUTO_2921 ?AUTO_2917 ) ( CLEAR ?AUTO_2921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2921 ?AUTO_2917 )
      ( MAKE-ON ?AUTO_2916 ?AUTO_2917 )
      ( MAKE-ON-VERIFY ?AUTO_2916 ?AUTO_2917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2925 - BLOCK
      ?AUTO_2926 - BLOCK
    )
    :vars
    (
      ?AUTO_2929 - BLOCK
      ?AUTO_2931 - BLOCK
      ?AUTO_2930 - BLOCK
      ?AUTO_2932 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2925 ?AUTO_2929 ) ( CLEAR ?AUTO_2925 ) ( CLEAR ?AUTO_2931 ) ( ON ?AUTO_2930 ?AUTO_2926 ) ( CLEAR ?AUTO_2930 ) ( HOLDING ?AUTO_2932 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2932 )
      ( MAKE-ON ?AUTO_2925 ?AUTO_2926 )
      ( MAKE-ON-VERIFY ?AUTO_2925 ?AUTO_2926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2933 - BLOCK
      ?AUTO_2934 - BLOCK
    )
    :vars
    (
      ?AUTO_2940 - BLOCK
      ?AUTO_2935 - BLOCK
      ?AUTO_2936 - BLOCK
      ?AUTO_2939 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2933 ?AUTO_2940 ) ( CLEAR ?AUTO_2933 ) ( CLEAR ?AUTO_2935 ) ( ON ?AUTO_2936 ?AUTO_2934 ) ( ON ?AUTO_2939 ?AUTO_2936 ) ( CLEAR ?AUTO_2939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2939 ?AUTO_2936 )
      ( MAKE-ON ?AUTO_2933 ?AUTO_2934 )
      ( MAKE-ON-VERIFY ?AUTO_2933 ?AUTO_2934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2943 - BLOCK
      ?AUTO_2944 - BLOCK
    )
    :vars
    (
      ?AUTO_2949 - BLOCK
      ?AUTO_2948 - BLOCK
      ?AUTO_2946 - BLOCK
      ?AUTO_2950 - BLOCK
      ?AUTO_2951 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2943 ?AUTO_2949 ) ( CLEAR ?AUTO_2943 ) ( CLEAR ?AUTO_2948 ) ( ON ?AUTO_2946 ?AUTO_2944 ) ( ON ?AUTO_2950 ?AUTO_2946 ) ( CLEAR ?AUTO_2950 ) ( HOLDING ?AUTO_2951 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2951 )
      ( MAKE-ON ?AUTO_2943 ?AUTO_2944 )
      ( MAKE-ON-VERIFY ?AUTO_2943 ?AUTO_2944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2952 - BLOCK
      ?AUTO_2953 - BLOCK
    )
    :vars
    (
      ?AUTO_2956 - BLOCK
      ?AUTO_2955 - BLOCK
      ?AUTO_2959 - BLOCK
      ?AUTO_2954 - BLOCK
      ?AUTO_2960 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2952 ?AUTO_2956 ) ( CLEAR ?AUTO_2952 ) ( CLEAR ?AUTO_2955 ) ( ON ?AUTO_2959 ?AUTO_2953 ) ( ON ?AUTO_2954 ?AUTO_2959 ) ( ON ?AUTO_2960 ?AUTO_2954 ) ( CLEAR ?AUTO_2960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2960 ?AUTO_2954 )
      ( MAKE-ON ?AUTO_2952 ?AUTO_2953 )
      ( MAKE-ON-VERIFY ?AUTO_2952 ?AUTO_2953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2963 - BLOCK
      ?AUTO_2964 - BLOCK
    )
    :vars
    (
      ?AUTO_2966 - BLOCK
      ?AUTO_2970 - BLOCK
      ?AUTO_2971 - BLOCK
      ?AUTO_2968 - BLOCK
      ?AUTO_2967 - BLOCK
      ?AUTO_2972 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2963 ?AUTO_2966 ) ( CLEAR ?AUTO_2963 ) ( CLEAR ?AUTO_2970 ) ( ON ?AUTO_2971 ?AUTO_2964 ) ( ON ?AUTO_2968 ?AUTO_2971 ) ( ON ?AUTO_2967 ?AUTO_2968 ) ( CLEAR ?AUTO_2967 ) ( HOLDING ?AUTO_2972 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2972 )
      ( MAKE-ON ?AUTO_2963 ?AUTO_2964 )
      ( MAKE-ON-VERIFY ?AUTO_2963 ?AUTO_2964 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2973 - BLOCK
      ?AUTO_2974 - BLOCK
    )
    :vars
    (
      ?AUTO_2978 - BLOCK
      ?AUTO_2977 - BLOCK
      ?AUTO_2975 - BLOCK
      ?AUTO_2981 - BLOCK
      ?AUTO_2976 - BLOCK
      ?AUTO_2982 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2973 ?AUTO_2978 ) ( CLEAR ?AUTO_2973 ) ( CLEAR ?AUTO_2977 ) ( ON ?AUTO_2975 ?AUTO_2974 ) ( ON ?AUTO_2981 ?AUTO_2975 ) ( ON ?AUTO_2976 ?AUTO_2981 ) ( ON ?AUTO_2982 ?AUTO_2976 ) ( CLEAR ?AUTO_2982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2982 ?AUTO_2976 )
      ( MAKE-ON ?AUTO_2973 ?AUTO_2974 )
      ( MAKE-ON-VERIFY ?AUTO_2973 ?AUTO_2974 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2986 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2986 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2986 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2986 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2988 - BLOCK
    )
    :vars
    (
      ?AUTO_2991 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2988 ?AUTO_2991 ) ( CLEAR ?AUTO_2988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2988 ?AUTO_2991 )
      ( MAKE-ON-TABLE ?AUTO_2988 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2988 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2992 - BLOCK
    )
    :vars
    (
      ?AUTO_2994 - BLOCK
      ?AUTO_2995 - BLOCK
      ?AUTO_2996 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2992 ?AUTO_2994 ) ( CLEAR ?AUTO_2992 ) ( HOLDING ?AUTO_2995 ) ( CLEAR ?AUTO_2996 ) )
    :subtasks
    ( ( !STACK ?AUTO_2995 ?AUTO_2996 )
      ( MAKE-ON-TABLE ?AUTO_2992 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2992 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2997 - BLOCK
    )
    :vars
    (
      ?AUTO_2999 - BLOCK
      ?AUTO_3001 - BLOCK
      ?AUTO_3000 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2997 ?AUTO_2999 ) ( CLEAR ?AUTO_3001 ) ( ON ?AUTO_3000 ?AUTO_2997 ) ( CLEAR ?AUTO_3000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3000 ?AUTO_2997 )
      ( MAKE-ON-TABLE ?AUTO_2997 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2997 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3004 - BLOCK
    )
    :vars
    (
      ?AUTO_3007 - BLOCK
      ?AUTO_3005 - BLOCK
      ?AUTO_3008 - BLOCK
      ?AUTO_3009 - BLOCK
      ?AUTO_3010 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3004 ?AUTO_3007 ) ( CLEAR ?AUTO_3005 ) ( ON ?AUTO_3008 ?AUTO_3004 ) ( CLEAR ?AUTO_3008 ) ( HOLDING ?AUTO_3009 ) ( CLEAR ?AUTO_3010 ) )
    :subtasks
    ( ( !STACK ?AUTO_3009 ?AUTO_3010 )
      ( MAKE-ON-TABLE ?AUTO_3004 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3004 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3023 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3023 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3023 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3023 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3025 - BLOCK
    )
    :vars
    (
      ?AUTO_3028 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3025 ?AUTO_3028 ) ( CLEAR ?AUTO_3025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3025 ?AUTO_3028 )
      ( MAKE-ON-TABLE ?AUTO_3025 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3025 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3029 - BLOCK
    )
    :vars
    (
      ?AUTO_3031 - BLOCK
      ?AUTO_3032 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3029 ?AUTO_3031 ) ( CLEAR ?AUTO_3029 ) ( HOLDING ?AUTO_3032 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3032 )
      ( MAKE-ON-TABLE ?AUTO_3029 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3029 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3033 - BLOCK
    )
    :vars
    (
      ?AUTO_3035 - BLOCK
      ?AUTO_3036 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3033 ?AUTO_3035 ) ( ON ?AUTO_3036 ?AUTO_3033 ) ( CLEAR ?AUTO_3036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3036 ?AUTO_3033 )
      ( MAKE-ON-TABLE ?AUTO_3033 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3033 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3039 - BLOCK
    )
    :vars
    (
      ?AUTO_3040 - BLOCK
      ?AUTO_3041 - BLOCK
      ?AUTO_3043 - BLOCK
      ?AUTO_3044 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3039 ?AUTO_3040 ) ( ON ?AUTO_3041 ?AUTO_3039 ) ( CLEAR ?AUTO_3041 ) ( HOLDING ?AUTO_3043 ) ( CLEAR ?AUTO_3044 ) )
    :subtasks
    ( ( !STACK ?AUTO_3043 ?AUTO_3044 )
      ( MAKE-ON-TABLE ?AUTO_3039 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3039 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3045 - BLOCK
    )
    :vars
    (
      ?AUTO_3047 - BLOCK
      ?AUTO_3048 - BLOCK
      ?AUTO_3050 - BLOCK
      ?AUTO_3049 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3045 ?AUTO_3047 ) ( ON ?AUTO_3048 ?AUTO_3045 ) ( CLEAR ?AUTO_3050 ) ( ON ?AUTO_3049 ?AUTO_3048 ) ( CLEAR ?AUTO_3049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3049 ?AUTO_3048 )
      ( MAKE-ON-TABLE ?AUTO_3045 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3045 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3053 - BLOCK
    )
    :vars
    (
      ?AUTO_3058 - BLOCK
      ?AUTO_3055 - BLOCK
      ?AUTO_3056 - BLOCK
      ?AUTO_3054 - BLOCK
      ?AUTO_3059 - BLOCK
      ?AUTO_3060 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3053 ?AUTO_3058 ) ( ON ?AUTO_3055 ?AUTO_3053 ) ( CLEAR ?AUTO_3056 ) ( ON ?AUTO_3054 ?AUTO_3055 ) ( CLEAR ?AUTO_3054 ) ( HOLDING ?AUTO_3059 ) ( CLEAR ?AUTO_3060 ) )
    :subtasks
    ( ( !STACK ?AUTO_3059 ?AUTO_3060 )
      ( MAKE-ON-TABLE ?AUTO_3053 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3074 - BLOCK
      ?AUTO_3075 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3074 ) ( CLEAR ?AUTO_3075 ) )
    :subtasks
    ( ( !STACK ?AUTO_3074 ?AUTO_3075 )
      ( MAKE-ON-VERIFY ?AUTO_3074 ?AUTO_3075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3078 - BLOCK
      ?AUTO_3079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3079 ) ( ON-TABLE ?AUTO_3078 ) ( CLEAR ?AUTO_3078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3078 )
      ( MAKE-ON ?AUTO_3078 ?AUTO_3079 )
      ( MAKE-ON-VERIFY ?AUTO_3078 ?AUTO_3079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3083 - BLOCK
      ?AUTO_3084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3083 ) ( CLEAR ?AUTO_3083 ) ( HOLDING ?AUTO_3084 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3084 )
      ( MAKE-ON ?AUTO_3083 ?AUTO_3084 )
      ( MAKE-ON-VERIFY ?AUTO_3083 ?AUTO_3084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3362 - BLOCK
      ?AUTO_3363 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3362 ) ( CLEAR ?AUTO_3363 ) )
    :subtasks
    ( ( !STACK ?AUTO_3362 ?AUTO_3363 )
      ( MAKE-ON-VERIFY ?AUTO_3362 ?AUTO_3363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3366 - BLOCK
      ?AUTO_3367 - BLOCK
    )
    :vars
    (
      ?AUTO_3371 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3367 ) ( ON ?AUTO_3366 ?AUTO_3371 ) ( CLEAR ?AUTO_3366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3366 ?AUTO_3371 )
      ( MAKE-ON ?AUTO_3366 ?AUTO_3367 )
      ( MAKE-ON-VERIFY ?AUTO_3366 ?AUTO_3367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3372 - BLOCK
      ?AUTO_3373 - BLOCK
    )
    :vars
    (
      ?AUTO_3376 - BLOCK
      ?AUTO_3378 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3372 ?AUTO_3376 ) ( CLEAR ?AUTO_3372 ) ( HOLDING ?AUTO_3373 ) ( CLEAR ?AUTO_3378 ) )
    :subtasks
    ( ( !STACK ?AUTO_3373 ?AUTO_3378 )
      ( MAKE-ON ?AUTO_3372 ?AUTO_3373 )
      ( MAKE-ON-VERIFY ?AUTO_3372 ?AUTO_3373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3381 - BLOCK
      ?AUTO_3382 - BLOCK
    )
    :vars
    (
      ?AUTO_3383 - BLOCK
      ?AUTO_3386 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3382 ) ( ON ?AUTO_3381 ?AUTO_3383 ) ( CLEAR ?AUTO_3381 ) ( HOLDING ?AUTO_3386 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3386 )
      ( MAKE-ON ?AUTO_3381 ?AUTO_3382 )
      ( MAKE-ON-VERIFY ?AUTO_3381 ?AUTO_3382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3471 - BLOCK
      ?AUTO_3472 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3471 ) ( CLEAR ?AUTO_3472 ) )
    :subtasks
    ( ( !STACK ?AUTO_3471 ?AUTO_3472 )
      ( MAKE-ON-VERIFY ?AUTO_3471 ?AUTO_3472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3475 - BLOCK
      ?AUTO_3476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3476 ) ( ON-TABLE ?AUTO_3475 ) ( CLEAR ?AUTO_3475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3475 )
      ( MAKE-ON ?AUTO_3475 ?AUTO_3476 )
      ( MAKE-ON-VERIFY ?AUTO_3475 ?AUTO_3476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3480 - BLOCK
      ?AUTO_3481 - BLOCK
    )
    :vars
    (
      ?AUTO_3484 - BLOCK
      ?AUTO_3485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3481 ) ( ON-TABLE ?AUTO_3480 ) ( CLEAR ?AUTO_3480 ) ( HOLDING ?AUTO_3484 ) ( CLEAR ?AUTO_3485 ) )
    :subtasks
    ( ( !STACK ?AUTO_3484 ?AUTO_3485 )
      ( MAKE-ON ?AUTO_3480 ?AUTO_3481 )
      ( MAKE-ON-VERIFY ?AUTO_3480 ?AUTO_3481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3486 - BLOCK
      ?AUTO_3487 - BLOCK
    )
    :vars
    (
      ?AUTO_3491 - BLOCK
      ?AUTO_3490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3487 ) ( ON-TABLE ?AUTO_3486 ) ( CLEAR ?AUTO_3491 ) ( ON ?AUTO_3490 ?AUTO_3486 ) ( CLEAR ?AUTO_3490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3490 ?AUTO_3486 )
      ( MAKE-ON ?AUTO_3486 ?AUTO_3487 )
      ( MAKE-ON-VERIFY ?AUTO_3486 ?AUTO_3487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3494 - BLOCK
      ?AUTO_3495 - BLOCK
    )
    :vars
    (
      ?AUTO_3499 - BLOCK
      ?AUTO_3496 - BLOCK
      ?AUTO_3501 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3495 ) ( ON-TABLE ?AUTO_3494 ) ( ON ?AUTO_3499 ?AUTO_3494 ) ( CLEAR ?AUTO_3499 ) ( HOLDING ?AUTO_3496 ) ( CLEAR ?AUTO_3501 ) )
    :subtasks
    ( ( !STACK ?AUTO_3496 ?AUTO_3501 )
      ( MAKE-ON ?AUTO_3494 ?AUTO_3495 )
      ( MAKE-ON-VERIFY ?AUTO_3494 ?AUTO_3495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3506 - BLOCK
      ?AUTO_3507 - BLOCK
    )
    :vars
    (
      ?AUTO_3510 - BLOCK
      ?AUTO_3512 - BLOCK
      ?AUTO_3508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3506 ) ( ON ?AUTO_3510 ?AUTO_3506 ) ( CLEAR ?AUTO_3510 ) ( CLEAR ?AUTO_3512 ) ( ON ?AUTO_3508 ?AUTO_3507 ) ( CLEAR ?AUTO_3508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3508 ?AUTO_3507 )
      ( MAKE-ON ?AUTO_3506 ?AUTO_3507 )
      ( MAKE-ON-VERIFY ?AUTO_3506 ?AUTO_3507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3515 - BLOCK
      ?AUTO_3516 - BLOCK
    )
    :vars
    (
      ?AUTO_3521 - BLOCK
      ?AUTO_3520 - BLOCK
      ?AUTO_3519 - BLOCK
      ?AUTO_3522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3515 ) ( ON ?AUTO_3521 ?AUTO_3515 ) ( CLEAR ?AUTO_3521 ) ( CLEAR ?AUTO_3520 ) ( ON ?AUTO_3519 ?AUTO_3516 ) ( CLEAR ?AUTO_3519 ) ( HOLDING ?AUTO_3522 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3522 )
      ( MAKE-ON ?AUTO_3515 ?AUTO_3516 )
      ( MAKE-ON-VERIFY ?AUTO_3515 ?AUTO_3516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3523 - BLOCK
      ?AUTO_3524 - BLOCK
    )
    :vars
    (
      ?AUTO_3525 - BLOCK
      ?AUTO_3530 - BLOCK
      ?AUTO_3529 - BLOCK
      ?AUTO_3528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3523 ) ( ON ?AUTO_3525 ?AUTO_3523 ) ( CLEAR ?AUTO_3525 ) ( CLEAR ?AUTO_3530 ) ( ON ?AUTO_3529 ?AUTO_3524 ) ( ON ?AUTO_3528 ?AUTO_3529 ) ( CLEAR ?AUTO_3528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3528 ?AUTO_3529 )
      ( MAKE-ON ?AUTO_3523 ?AUTO_3524 )
      ( MAKE-ON-VERIFY ?AUTO_3523 ?AUTO_3524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3533 - BLOCK
      ?AUTO_3534 - BLOCK
    )
    :vars
    (
      ?AUTO_3540 - BLOCK
      ?AUTO_3537 - BLOCK
      ?AUTO_3539 - BLOCK
      ?AUTO_3536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3533 ) ( CLEAR ?AUTO_3540 ) ( ON ?AUTO_3537 ?AUTO_3534 ) ( ON ?AUTO_3539 ?AUTO_3537 ) ( CLEAR ?AUTO_3539 ) ( HOLDING ?AUTO_3536 ) ( CLEAR ?AUTO_3533 ) )
    :subtasks
    ( ( !STACK ?AUTO_3536 ?AUTO_3533 )
      ( MAKE-ON ?AUTO_3533 ?AUTO_3534 )
      ( MAKE-ON-VERIFY ?AUTO_3533 ?AUTO_3534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3543 - BLOCK
      ?AUTO_3544 - BLOCK
    )
    :vars
    (
      ?AUTO_3547 - BLOCK
      ?AUTO_3545 - BLOCK
      ?AUTO_3546 - BLOCK
      ?AUTO_3548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3543 ) ( CLEAR ?AUTO_3547 ) ( ON ?AUTO_3545 ?AUTO_3544 ) ( ON ?AUTO_3546 ?AUTO_3545 ) ( CLEAR ?AUTO_3543 ) ( ON ?AUTO_3548 ?AUTO_3546 ) ( CLEAR ?AUTO_3548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3548 ?AUTO_3546 )
      ( MAKE-ON ?AUTO_3543 ?AUTO_3544 )
      ( MAKE-ON-VERIFY ?AUTO_3543 ?AUTO_3544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3553 - BLOCK
      ?AUTO_3554 - BLOCK
    )
    :vars
    (
      ?AUTO_3559 - BLOCK
      ?AUTO_3560 - BLOCK
      ?AUTO_3557 - BLOCK
      ?AUTO_3558 - BLOCK
      ?AUTO_3561 - BLOCK
      ?AUTO_3562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3553 ) ( CLEAR ?AUTO_3559 ) ( ON ?AUTO_3560 ?AUTO_3554 ) ( ON ?AUTO_3557 ?AUTO_3560 ) ( CLEAR ?AUTO_3553 ) ( ON ?AUTO_3558 ?AUTO_3557 ) ( CLEAR ?AUTO_3558 ) ( HOLDING ?AUTO_3561 ) ( CLEAR ?AUTO_3562 ) )
    :subtasks
    ( ( !STACK ?AUTO_3561 ?AUTO_3562 )
      ( MAKE-ON ?AUTO_3553 ?AUTO_3554 )
      ( MAKE-ON-VERIFY ?AUTO_3553 ?AUTO_3554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3571 - BLOCK
      ?AUTO_3572 - BLOCK
    )
    :vars
    (
      ?AUTO_3575 - BLOCK
      ?AUTO_3574 - BLOCK
      ?AUTO_3577 - BLOCK
      ?AUTO_3573 - BLOCK
      ?AUTO_3579 - BLOCK
      ?AUTO_3578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3571 ) ( CLEAR ?AUTO_3575 ) ( ON ?AUTO_3574 ?AUTO_3572 ) ( ON ?AUTO_3577 ?AUTO_3574 ) ( ON ?AUTO_3573 ?AUTO_3577 ) ( CLEAR ?AUTO_3573 ) ( CLEAR ?AUTO_3579 ) ( ON ?AUTO_3578 ?AUTO_3571 ) ( CLEAR ?AUTO_3578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3578 ?AUTO_3571 )
      ( MAKE-ON ?AUTO_3571 ?AUTO_3572 )
      ( MAKE-ON-VERIFY ?AUTO_3571 ?AUTO_3572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3583 - BLOCK
      ?AUTO_3584 - BLOCK
    )
    :vars
    (
      ?AUTO_3592 - BLOCK
      ?AUTO_3589 - BLOCK
      ?AUTO_3591 - BLOCK
      ?AUTO_3588 - BLOCK
      ?AUTO_3590 - BLOCK
      ?AUTO_3587 - BLOCK
      ?AUTO_3593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3583 ) ( CLEAR ?AUTO_3592 ) ( ON ?AUTO_3589 ?AUTO_3584 ) ( ON ?AUTO_3591 ?AUTO_3589 ) ( ON ?AUTO_3588 ?AUTO_3591 ) ( CLEAR ?AUTO_3588 ) ( CLEAR ?AUTO_3590 ) ( ON ?AUTO_3587 ?AUTO_3583 ) ( CLEAR ?AUTO_3587 ) ( HOLDING ?AUTO_3593 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3593 )
      ( MAKE-ON ?AUTO_3583 ?AUTO_3584 )
      ( MAKE-ON-VERIFY ?AUTO_3583 ?AUTO_3584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3594 - BLOCK
      ?AUTO_3595 - BLOCK
    )
    :vars
    (
      ?AUTO_3598 - BLOCK
      ?AUTO_3602 - BLOCK
      ?AUTO_3604 - BLOCK
      ?AUTO_3603 - BLOCK
      ?AUTO_3600 - BLOCK
      ?AUTO_3597 - BLOCK
      ?AUTO_3596 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3594 ) ( CLEAR ?AUTO_3598 ) ( ON ?AUTO_3602 ?AUTO_3595 ) ( ON ?AUTO_3604 ?AUTO_3602 ) ( ON ?AUTO_3603 ?AUTO_3604 ) ( CLEAR ?AUTO_3603 ) ( CLEAR ?AUTO_3600 ) ( ON ?AUTO_3597 ?AUTO_3594 ) ( ON ?AUTO_3596 ?AUTO_3597 ) ( CLEAR ?AUTO_3596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3596 ?AUTO_3597 )
      ( MAKE-ON ?AUTO_3594 ?AUTO_3595 )
      ( MAKE-ON-VERIFY ?AUTO_3594 ?AUTO_3595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3607 - BLOCK
      ?AUTO_3608 - BLOCK
    )
    :vars
    (
      ?AUTO_3617 - BLOCK
      ?AUTO_3614 - BLOCK
      ?AUTO_3611 - BLOCK
      ?AUTO_3610 - BLOCK
      ?AUTO_3616 - BLOCK
      ?AUTO_3613 - BLOCK
      ?AUTO_3615 - BLOCK
      ?AUTO_3618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3607 ) ( CLEAR ?AUTO_3617 ) ( ON ?AUTO_3614 ?AUTO_3608 ) ( ON ?AUTO_3611 ?AUTO_3614 ) ( ON ?AUTO_3610 ?AUTO_3611 ) ( CLEAR ?AUTO_3610 ) ( CLEAR ?AUTO_3616 ) ( ON ?AUTO_3613 ?AUTO_3607 ) ( ON ?AUTO_3615 ?AUTO_3613 ) ( CLEAR ?AUTO_3615 ) ( HOLDING ?AUTO_3618 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3618 )
      ( MAKE-ON ?AUTO_3607 ?AUTO_3608 )
      ( MAKE-ON-VERIFY ?AUTO_3607 ?AUTO_3608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3619 - BLOCK
      ?AUTO_3620 - BLOCK
    )
    :vars
    (
      ?AUTO_3623 - BLOCK
      ?AUTO_3627 - BLOCK
      ?AUTO_3628 - BLOCK
      ?AUTO_3624 - BLOCK
      ?AUTO_3622 - BLOCK
      ?AUTO_3629 - BLOCK
      ?AUTO_3621 - BLOCK
      ?AUTO_3630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3619 ) ( CLEAR ?AUTO_3623 ) ( ON ?AUTO_3627 ?AUTO_3620 ) ( ON ?AUTO_3628 ?AUTO_3627 ) ( ON ?AUTO_3624 ?AUTO_3628 ) ( CLEAR ?AUTO_3624 ) ( CLEAR ?AUTO_3622 ) ( ON ?AUTO_3629 ?AUTO_3619 ) ( ON ?AUTO_3621 ?AUTO_3629 ) ( ON ?AUTO_3630 ?AUTO_3621 ) ( CLEAR ?AUTO_3630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3630 ?AUTO_3621 )
      ( MAKE-ON ?AUTO_3619 ?AUTO_3620 )
      ( MAKE-ON-VERIFY ?AUTO_3619 ?AUTO_3620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3633 - BLOCK
      ?AUTO_3634 - BLOCK
    )
    :vars
    (
      ?AUTO_3644 - BLOCK
      ?AUTO_3637 - BLOCK
      ?AUTO_3640 - BLOCK
      ?AUTO_3641 - BLOCK
      ?AUTO_3638 - BLOCK
      ?AUTO_3639 - BLOCK
      ?AUTO_3636 - BLOCK
      ?AUTO_3642 - BLOCK
      ?AUTO_3645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3633 ) ( CLEAR ?AUTO_3644 ) ( ON ?AUTO_3637 ?AUTO_3634 ) ( ON ?AUTO_3640 ?AUTO_3637 ) ( ON ?AUTO_3641 ?AUTO_3640 ) ( CLEAR ?AUTO_3641 ) ( CLEAR ?AUTO_3638 ) ( ON ?AUTO_3639 ?AUTO_3633 ) ( ON ?AUTO_3636 ?AUTO_3639 ) ( ON ?AUTO_3642 ?AUTO_3636 ) ( CLEAR ?AUTO_3642 ) ( HOLDING ?AUTO_3645 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3645 )
      ( MAKE-ON ?AUTO_3633 ?AUTO_3634 )
      ( MAKE-ON-VERIFY ?AUTO_3633 ?AUTO_3634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3646 - BLOCK
      ?AUTO_3647 - BLOCK
    )
    :vars
    (
      ?AUTO_3649 - BLOCK
      ?AUTO_3657 - BLOCK
      ?AUTO_3653 - BLOCK
      ?AUTO_3650 - BLOCK
      ?AUTO_3656 - BLOCK
      ?AUTO_3658 - BLOCK
      ?AUTO_3651 - BLOCK
      ?AUTO_3648 - BLOCK
      ?AUTO_3654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3646 ) ( CLEAR ?AUTO_3649 ) ( ON ?AUTO_3657 ?AUTO_3647 ) ( ON ?AUTO_3653 ?AUTO_3657 ) ( ON ?AUTO_3650 ?AUTO_3653 ) ( CLEAR ?AUTO_3650 ) ( CLEAR ?AUTO_3656 ) ( ON ?AUTO_3658 ?AUTO_3646 ) ( ON ?AUTO_3651 ?AUTO_3658 ) ( ON ?AUTO_3648 ?AUTO_3651 ) ( ON ?AUTO_3654 ?AUTO_3648 ) ( CLEAR ?AUTO_3654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3654 ?AUTO_3648 )
      ( MAKE-ON ?AUTO_3646 ?AUTO_3647 )
      ( MAKE-ON-VERIFY ?AUTO_3646 ?AUTO_3647 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3660 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3660 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3660 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3660 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3662 - BLOCK
    )
    :vars
    (
      ?AUTO_3665 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3662 ?AUTO_3665 ) ( CLEAR ?AUTO_3662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3662 ?AUTO_3665 )
      ( MAKE-ON-TABLE ?AUTO_3662 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3662 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3667 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3667 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3667 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3667 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3669 - BLOCK
    )
    :vars
    (
      ?AUTO_3672 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3669 ?AUTO_3672 ) ( CLEAR ?AUTO_3669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3669 ?AUTO_3672 )
      ( MAKE-ON-TABLE ?AUTO_3669 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3669 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3673 - BLOCK
    )
    :vars
    (
      ?AUTO_3675 - BLOCK
      ?AUTO_3676 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3673 ?AUTO_3675 ) ( CLEAR ?AUTO_3673 ) ( HOLDING ?AUTO_3676 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3676 )
      ( MAKE-ON-TABLE ?AUTO_3673 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3680 - BLOCK
      ?AUTO_3681 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3680 ) ( CLEAR ?AUTO_3681 ) )
    :subtasks
    ( ( !STACK ?AUTO_3680 ?AUTO_3681 )
      ( MAKE-ON-VERIFY ?AUTO_3680 ?AUTO_3681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3684 - BLOCK
      ?AUTO_3685 - BLOCK
    )
    :vars
    (
      ?AUTO_3689 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3685 ) ( ON ?AUTO_3684 ?AUTO_3689 ) ( CLEAR ?AUTO_3684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3684 ?AUTO_3689 )
      ( MAKE-ON ?AUTO_3684 ?AUTO_3685 )
      ( MAKE-ON-VERIFY ?AUTO_3684 ?AUTO_3685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3690 - BLOCK
      ?AUTO_3691 - BLOCK
    )
    :vars
    (
      ?AUTO_3694 - BLOCK
      ?AUTO_3695 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3691 ) ( ON ?AUTO_3690 ?AUTO_3694 ) ( CLEAR ?AUTO_3690 ) ( HOLDING ?AUTO_3695 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3695 )
      ( MAKE-ON ?AUTO_3690 ?AUTO_3691 )
      ( MAKE-ON-VERIFY ?AUTO_3690 ?AUTO_3691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3698 - BLOCK
      ?AUTO_3699 - BLOCK
    )
    :vars
    (
      ?AUTO_3702 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3698 ?AUTO_3702 ) ( CLEAR ?AUTO_3698 ) ( HOLDING ?AUTO_3699 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3699 )
      ( MAKE-ON ?AUTO_3698 ?AUTO_3699 )
      ( MAKE-ON-VERIFY ?AUTO_3698 ?AUTO_3699 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3707 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3707 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3707 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3707 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3709 - BLOCK
    )
    :vars
    (
      ?AUTO_3712 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3709 ?AUTO_3712 ) ( CLEAR ?AUTO_3709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3709 ?AUTO_3712 )
      ( MAKE-ON-TABLE ?AUTO_3709 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3709 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3713 - BLOCK
    )
    :vars
    (
      ?AUTO_3715 - BLOCK
      ?AUTO_3716 - BLOCK
      ?AUTO_3717 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3713 ?AUTO_3715 ) ( CLEAR ?AUTO_3713 ) ( HOLDING ?AUTO_3716 ) ( CLEAR ?AUTO_3717 ) )
    :subtasks
    ( ( !STACK ?AUTO_3716 ?AUTO_3717 )
      ( MAKE-ON-TABLE ?AUTO_3713 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3713 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3722 - BLOCK
    )
    :vars
    (
      ?AUTO_3724 - BLOCK
      ?AUTO_3726 - BLOCK
      ?AUTO_3725 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3722 ?AUTO_3724 ) ( CLEAR ?AUTO_3726 ) ( ON ?AUTO_3725 ?AUTO_3722 ) ( CLEAR ?AUTO_3725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3725 ?AUTO_3722 )
      ( MAKE-ON-TABLE ?AUTO_3722 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3731 - BLOCK
      ?AUTO_3732 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3731 ) ( CLEAR ?AUTO_3732 ) )
    :subtasks
    ( ( !STACK ?AUTO_3731 ?AUTO_3732 )
      ( MAKE-ON-VERIFY ?AUTO_3731 ?AUTO_3732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3735 - BLOCK
      ?AUTO_3736 - BLOCK
    )
    :vars
    (
      ?AUTO_3740 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3736 ) ( ON ?AUTO_3735 ?AUTO_3740 ) ( CLEAR ?AUTO_3735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3735 ?AUTO_3740 )
      ( MAKE-ON ?AUTO_3735 ?AUTO_3736 )
      ( MAKE-ON-VERIFY ?AUTO_3735 ?AUTO_3736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3741 - BLOCK
      ?AUTO_3742 - BLOCK
    )
    :vars
    (
      ?AUTO_3745 - BLOCK
      ?AUTO_3746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3742 ) ( ON ?AUTO_3741 ?AUTO_3745 ) ( CLEAR ?AUTO_3741 ) ( HOLDING ?AUTO_3746 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3746 )
      ( MAKE-ON ?AUTO_3741 ?AUTO_3742 )
      ( MAKE-ON-VERIFY ?AUTO_3741 ?AUTO_3742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3747 - BLOCK
      ?AUTO_3748 - BLOCK
    )
    :vars
    (
      ?AUTO_3751 - BLOCK
      ?AUTO_3752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3748 ) ( ON ?AUTO_3747 ?AUTO_3751 ) ( ON ?AUTO_3752 ?AUTO_3747 ) ( CLEAR ?AUTO_3752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3752 ?AUTO_3747 )
      ( MAKE-ON ?AUTO_3747 ?AUTO_3748 )
      ( MAKE-ON-VERIFY ?AUTO_3747 ?AUTO_3748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3755 - BLOCK
      ?AUTO_3756 - BLOCK
    )
    :vars
    (
      ?AUTO_3760 - BLOCK
      ?AUTO_3757 - BLOCK
      ?AUTO_3761 - BLOCK
      ?AUTO_3762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3756 ) ( ON ?AUTO_3755 ?AUTO_3760 ) ( ON ?AUTO_3757 ?AUTO_3755 ) ( CLEAR ?AUTO_3757 ) ( HOLDING ?AUTO_3761 ) ( CLEAR ?AUTO_3762 ) )
    :subtasks
    ( ( !STACK ?AUTO_3761 ?AUTO_3762 )
      ( MAKE-ON ?AUTO_3755 ?AUTO_3756 )
      ( MAKE-ON-VERIFY ?AUTO_3755 ?AUTO_3756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3765 - BLOCK
      ?AUTO_3766 - BLOCK
    )
    :vars
    (
      ?AUTO_3770 - BLOCK
      ?AUTO_3767 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3765 ?AUTO_3770 ) ( ON ?AUTO_3767 ?AUTO_3765 ) ( CLEAR ?AUTO_3767 ) ( HOLDING ?AUTO_3766 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3766 )
      ( MAKE-ON ?AUTO_3765 ?AUTO_3766 )
      ( MAKE-ON-VERIFY ?AUTO_3765 ?AUTO_3766 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3776 - BLOCK
      ?AUTO_3777 - BLOCK
    )
    :vars
    (
      ?AUTO_3780 - BLOCK
      ?AUTO_3781 - BLOCK
      ?AUTO_3782 - BLOCK
      ?AUTO_3783 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3777 ) ( ON ?AUTO_3776 ?AUTO_3780 ) ( ON ?AUTO_3781 ?AUTO_3776 ) ( CLEAR ?AUTO_3782 ) ( ON ?AUTO_3783 ?AUTO_3781 ) ( CLEAR ?AUTO_3783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3783 ?AUTO_3781 )
      ( MAKE-ON ?AUTO_3776 ?AUTO_3777 )
      ( MAKE-ON-VERIFY ?AUTO_3776 ?AUTO_3777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3788 - BLOCK
      ?AUTO_3789 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3788 ) ( CLEAR ?AUTO_3789 ) )
    :subtasks
    ( ( !STACK ?AUTO_3788 ?AUTO_3789 )
      ( MAKE-ON-VERIFY ?AUTO_3788 ?AUTO_3789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3792 - BLOCK
      ?AUTO_3793 - BLOCK
    )
    :vars
    (
      ?AUTO_3797 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3793 ) ( ON ?AUTO_3792 ?AUTO_3797 ) ( CLEAR ?AUTO_3792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3792 ?AUTO_3797 )
      ( MAKE-ON ?AUTO_3792 ?AUTO_3793 )
      ( MAKE-ON-VERIFY ?AUTO_3792 ?AUTO_3793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3798 - BLOCK
      ?AUTO_3799 - BLOCK
    )
    :vars
    (
      ?AUTO_3802 - BLOCK
      ?AUTO_3803 - BLOCK
      ?AUTO_3804 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3799 ) ( ON ?AUTO_3798 ?AUTO_3802 ) ( CLEAR ?AUTO_3798 ) ( HOLDING ?AUTO_3803 ) ( CLEAR ?AUTO_3804 ) )
    :subtasks
    ( ( !STACK ?AUTO_3803 ?AUTO_3804 )
      ( MAKE-ON ?AUTO_3798 ?AUTO_3799 )
      ( MAKE-ON-VERIFY ?AUTO_3798 ?AUTO_3799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3805 - BLOCK
      ?AUTO_3806 - BLOCK
    )
    :vars
    (
      ?AUTO_3809 - BLOCK
      ?AUTO_3811 - BLOCK
      ?AUTO_3810 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3805 ?AUTO_3809 ) ( CLEAR ?AUTO_3805 ) ( CLEAR ?AUTO_3811 ) ( ON ?AUTO_3810 ?AUTO_3806 ) ( CLEAR ?AUTO_3810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3810 ?AUTO_3806 )
      ( MAKE-ON ?AUTO_3805 ?AUTO_3806 )
      ( MAKE-ON-VERIFY ?AUTO_3805 ?AUTO_3806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3814 - BLOCK
      ?AUTO_3815 - BLOCK
    )
    :vars
    (
      ?AUTO_3820 - BLOCK
      ?AUTO_3817 - BLOCK
      ?AUTO_3816 - BLOCK
      ?AUTO_3821 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3814 ?AUTO_3820 ) ( CLEAR ?AUTO_3814 ) ( CLEAR ?AUTO_3817 ) ( ON ?AUTO_3816 ?AUTO_3815 ) ( CLEAR ?AUTO_3816 ) ( HOLDING ?AUTO_3821 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3821 )
      ( MAKE-ON ?AUTO_3814 ?AUTO_3815 )
      ( MAKE-ON-VERIFY ?AUTO_3814 ?AUTO_3815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3822 - BLOCK
      ?AUTO_3823 - BLOCK
    )
    :vars
    (
      ?AUTO_3829 - BLOCK
      ?AUTO_3826 - BLOCK
      ?AUTO_3824 - BLOCK
      ?AUTO_3828 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3822 ?AUTO_3829 ) ( CLEAR ?AUTO_3822 ) ( CLEAR ?AUTO_3826 ) ( ON ?AUTO_3824 ?AUTO_3823 ) ( ON ?AUTO_3828 ?AUTO_3824 ) ( CLEAR ?AUTO_3828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3828 ?AUTO_3824 )
      ( MAKE-ON ?AUTO_3822 ?AUTO_3823 )
      ( MAKE-ON-VERIFY ?AUTO_3822 ?AUTO_3823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3832 - BLOCK
      ?AUTO_3833 - BLOCK
    )
    :vars
    (
      ?AUTO_3835 - BLOCK
      ?AUTO_3839 - BLOCK
      ?AUTO_3837 - BLOCK
      ?AUTO_3838 - BLOCK
      ?AUTO_3840 - BLOCK
      ?AUTO_3841 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3832 ?AUTO_3835 ) ( CLEAR ?AUTO_3832 ) ( CLEAR ?AUTO_3839 ) ( ON ?AUTO_3837 ?AUTO_3833 ) ( ON ?AUTO_3838 ?AUTO_3837 ) ( CLEAR ?AUTO_3838 ) ( HOLDING ?AUTO_3840 ) ( CLEAR ?AUTO_3841 ) )
    :subtasks
    ( ( !STACK ?AUTO_3840 ?AUTO_3841 )
      ( MAKE-ON ?AUTO_3832 ?AUTO_3833 )
      ( MAKE-ON-VERIFY ?AUTO_3832 ?AUTO_3833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3842 - BLOCK
      ?AUTO_3843 - BLOCK
    )
    :vars
    (
      ?AUTO_3850 - BLOCK
      ?AUTO_3844 - BLOCK
      ?AUTO_3845 - BLOCK
      ?AUTO_3851 - BLOCK
      ?AUTO_3847 - BLOCK
      ?AUTO_3846 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3842 ?AUTO_3850 ) ( CLEAR ?AUTO_3844 ) ( ON ?AUTO_3845 ?AUTO_3843 ) ( ON ?AUTO_3851 ?AUTO_3845 ) ( CLEAR ?AUTO_3851 ) ( CLEAR ?AUTO_3847 ) ( ON ?AUTO_3846 ?AUTO_3842 ) ( CLEAR ?AUTO_3846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3846 ?AUTO_3842 )
      ( MAKE-ON ?AUTO_3842 ?AUTO_3843 )
      ( MAKE-ON-VERIFY ?AUTO_3842 ?AUTO_3843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3854 - BLOCK
      ?AUTO_3855 - BLOCK
    )
    :vars
    (
      ?AUTO_3860 - BLOCK
      ?AUTO_3862 - BLOCK
      ?AUTO_3856 - BLOCK
      ?AUTO_3858 - BLOCK
      ?AUTO_3863 - BLOCK
      ?AUTO_3861 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3854 ?AUTO_3860 ) ( ON ?AUTO_3862 ?AUTO_3855 ) ( ON ?AUTO_3856 ?AUTO_3862 ) ( CLEAR ?AUTO_3856 ) ( CLEAR ?AUTO_3858 ) ( ON ?AUTO_3863 ?AUTO_3854 ) ( CLEAR ?AUTO_3863 ) ( HOLDING ?AUTO_3861 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3861 )
      ( MAKE-ON ?AUTO_3854 ?AUTO_3855 )
      ( MAKE-ON-VERIFY ?AUTO_3854 ?AUTO_3855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3869 - BLOCK
      ?AUTO_3870 - BLOCK
    )
    :vars
    (
      ?AUTO_3875 - BLOCK
      ?AUTO_3873 - BLOCK
      ?AUTO_3874 - BLOCK
      ?AUTO_3878 - BLOCK
      ?AUTO_3876 - BLOCK
      ?AUTO_3872 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3869 ?AUTO_3875 ) ( ON ?AUTO_3873 ?AUTO_3870 ) ( ON ?AUTO_3874 ?AUTO_3873 ) ( CLEAR ?AUTO_3878 ) ( ON ?AUTO_3876 ?AUTO_3869 ) ( CLEAR ?AUTO_3876 ) ( ON ?AUTO_3872 ?AUTO_3874 ) ( CLEAR ?AUTO_3872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3872 ?AUTO_3874 )
      ( MAKE-ON ?AUTO_3869 ?AUTO_3870 )
      ( MAKE-ON-VERIFY ?AUTO_3869 ?AUTO_3870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3883 - BLOCK
      ?AUTO_3884 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3883 ) ( CLEAR ?AUTO_3884 ) )
    :subtasks
    ( ( !STACK ?AUTO_3883 ?AUTO_3884 )
      ( MAKE-ON-VERIFY ?AUTO_3883 ?AUTO_3884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3887 - BLOCK
      ?AUTO_3888 - BLOCK
    )
    :vars
    (
      ?AUTO_3892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3888 ) ( ON ?AUTO_3887 ?AUTO_3892 ) ( CLEAR ?AUTO_3887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3887 ?AUTO_3892 )
      ( MAKE-ON ?AUTO_3887 ?AUTO_3888 )
      ( MAKE-ON-VERIFY ?AUTO_3887 ?AUTO_3888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3893 - BLOCK
      ?AUTO_3894 - BLOCK
    )
    :vars
    (
      ?AUTO_3897 - BLOCK
      ?AUTO_3899 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3893 ?AUTO_3897 ) ( CLEAR ?AUTO_3893 ) ( HOLDING ?AUTO_3894 ) ( CLEAR ?AUTO_3899 ) )
    :subtasks
    ( ( !STACK ?AUTO_3894 ?AUTO_3899 )
      ( MAKE-ON ?AUTO_3893 ?AUTO_3894 )
      ( MAKE-ON-VERIFY ?AUTO_3893 ?AUTO_3894 ) )
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
      ?AUTO_3905 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3900 ?AUTO_3904 ) ( CLEAR ?AUTO_3905 ) ( ON ?AUTO_3901 ?AUTO_3900 ) ( CLEAR ?AUTO_3901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3901 ?AUTO_3900 )
      ( MAKE-ON ?AUTO_3900 ?AUTO_3901 )
      ( MAKE-ON-VERIFY ?AUTO_3900 ?AUTO_3901 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3908 - BLOCK
      ?AUTO_3909 - BLOCK
    )
    :vars
    (
      ?AUTO_3913 - BLOCK
      ?AUTO_3910 - BLOCK
      ?AUTO_3914 - BLOCK
      ?AUTO_3915 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3908 ?AUTO_3913 ) ( CLEAR ?AUTO_3910 ) ( ON ?AUTO_3909 ?AUTO_3908 ) ( CLEAR ?AUTO_3909 ) ( HOLDING ?AUTO_3914 ) ( CLEAR ?AUTO_3915 ) )
    :subtasks
    ( ( !STACK ?AUTO_3914 ?AUTO_3915 )
      ( MAKE-ON ?AUTO_3908 ?AUTO_3909 )
      ( MAKE-ON-VERIFY ?AUTO_3908 ?AUTO_3909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3924 - BLOCK
      ?AUTO_3925 - BLOCK
    )
    :vars
    (
      ?AUTO_3926 - BLOCK
      ?AUTO_3929 - BLOCK
      ?AUTO_3931 - BLOCK
      ?AUTO_3927 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3924 ?AUTO_3926 ) ( CLEAR ?AUTO_3929 ) ( ON ?AUTO_3925 ?AUTO_3924 ) ( CLEAR ?AUTO_3931 ) ( ON ?AUTO_3927 ?AUTO_3925 ) ( CLEAR ?AUTO_3927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3927 ?AUTO_3925 )
      ( MAKE-ON ?AUTO_3924 ?AUTO_3925 )
      ( MAKE-ON-VERIFY ?AUTO_3924 ?AUTO_3925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3934 - BLOCK
      ?AUTO_3935 - BLOCK
    )
    :vars
    (
      ?AUTO_3941 - BLOCK
      ?AUTO_3938 - BLOCK
      ?AUTO_3939 - BLOCK
      ?AUTO_3940 - BLOCK
      ?AUTO_3942 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3934 ?AUTO_3941 ) ( CLEAR ?AUTO_3938 ) ( ON ?AUTO_3935 ?AUTO_3934 ) ( CLEAR ?AUTO_3939 ) ( ON ?AUTO_3940 ?AUTO_3935 ) ( CLEAR ?AUTO_3940 ) ( HOLDING ?AUTO_3942 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3942 )
      ( MAKE-ON ?AUTO_3934 ?AUTO_3935 )
      ( MAKE-ON-VERIFY ?AUTO_3934 ?AUTO_3935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3951 - BLOCK
      ?AUTO_3952 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3951 ) ( CLEAR ?AUTO_3952 ) )
    :subtasks
    ( ( !STACK ?AUTO_3951 ?AUTO_3952 )
      ( MAKE-ON-VERIFY ?AUTO_3951 ?AUTO_3952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3955 - BLOCK
      ?AUTO_3956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3956 ) ( ON-TABLE ?AUTO_3955 ) ( CLEAR ?AUTO_3955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3955 )
      ( MAKE-ON ?AUTO_3955 ?AUTO_3956 )
      ( MAKE-ON-VERIFY ?AUTO_3955 ?AUTO_3956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3960 - BLOCK
      ?AUTO_3961 - BLOCK
    )
    :vars
    (
      ?AUTO_3964 - BLOCK
      ?AUTO_3965 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3961 ) ( ON-TABLE ?AUTO_3960 ) ( CLEAR ?AUTO_3960 ) ( HOLDING ?AUTO_3964 ) ( CLEAR ?AUTO_3965 ) )
    :subtasks
    ( ( !STACK ?AUTO_3964 ?AUTO_3965 )
      ( MAKE-ON ?AUTO_3960 ?AUTO_3961 )
      ( MAKE-ON-VERIFY ?AUTO_3960 ?AUTO_3961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3966 - BLOCK
      ?AUTO_3967 - BLOCK
    )
    :vars
    (
      ?AUTO_3969 - BLOCK
      ?AUTO_3971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3966 ) ( CLEAR ?AUTO_3966 ) ( CLEAR ?AUTO_3969 ) ( ON ?AUTO_3971 ?AUTO_3967 ) ( CLEAR ?AUTO_3971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3971 ?AUTO_3967 )
      ( MAKE-ON ?AUTO_3966 ?AUTO_3967 )
      ( MAKE-ON-VERIFY ?AUTO_3966 ?AUTO_3967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3974 - BLOCK
      ?AUTO_3975 - BLOCK
    )
    :vars
    (
      ?AUTO_3979 - BLOCK
      ?AUTO_3978 - BLOCK
      ?AUTO_3981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3974 ) ( CLEAR ?AUTO_3974 ) ( ON ?AUTO_3979 ?AUTO_3975 ) ( CLEAR ?AUTO_3979 ) ( HOLDING ?AUTO_3978 ) ( CLEAR ?AUTO_3981 ) )
    :subtasks
    ( ( !STACK ?AUTO_3978 ?AUTO_3981 )
      ( MAKE-ON ?AUTO_3974 ?AUTO_3975 )
      ( MAKE-ON-VERIFY ?AUTO_3974 ?AUTO_3975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3982 - BLOCK
      ?AUTO_3983 - BLOCK
    )
    :vars
    (
      ?AUTO_3986 - BLOCK
      ?AUTO_3988 - BLOCK
      ?AUTO_3987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3982 ) ( CLEAR ?AUTO_3982 ) ( ON ?AUTO_3986 ?AUTO_3983 ) ( CLEAR ?AUTO_3988 ) ( ON ?AUTO_3987 ?AUTO_3986 ) ( CLEAR ?AUTO_3987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3987 ?AUTO_3986 )
      ( MAKE-ON ?AUTO_3982 ?AUTO_3983 )
      ( MAKE-ON-VERIFY ?AUTO_3982 ?AUTO_3983 ) )
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
      ?AUTO_3993 - BLOCK
      ?AUTO_3994 - BLOCK
      ?AUTO_3998 - BLOCK
      ?AUTO_3999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3991 ) ( CLEAR ?AUTO_3991 ) ( ON ?AUTO_3995 ?AUTO_3992 ) ( CLEAR ?AUTO_3993 ) ( ON ?AUTO_3994 ?AUTO_3995 ) ( CLEAR ?AUTO_3994 ) ( HOLDING ?AUTO_3998 ) ( CLEAR ?AUTO_3999 ) )
    :subtasks
    ( ( !STACK ?AUTO_3998 ?AUTO_3999 )
      ( MAKE-ON ?AUTO_3991 ?AUTO_3992 )
      ( MAKE-ON-VERIFY ?AUTO_3991 ?AUTO_3992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4002 - BLOCK
      ?AUTO_4003 - BLOCK
    )
    :vars
    (
      ?AUTO_4005 - BLOCK
      ?AUTO_4006 - BLOCK
      ?AUTO_4004 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4005 ?AUTO_4003 ) ( CLEAR ?AUTO_4006 ) ( ON ?AUTO_4004 ?AUTO_4005 ) ( CLEAR ?AUTO_4004 ) ( HOLDING ?AUTO_4002 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4002 )
      ( MAKE-ON ?AUTO_4002 ?AUTO_4003 )
      ( MAKE-ON-VERIFY ?AUTO_4002 ?AUTO_4003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4014 - BLOCK
      ?AUTO_4015 - BLOCK
    )
    :vars
    (
      ?AUTO_4017 - BLOCK
      ?AUTO_4020 - BLOCK
      ?AUTO_4022 - BLOCK
      ?AUTO_4023 - BLOCK
      ?AUTO_4016 - BLOCK
      ?AUTO_4021 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4014 ?AUTO_4017 ) ( CLEAR ?AUTO_4014 ) ( CLEAR ?AUTO_4020 ) ( ON ?AUTO_4022 ?AUTO_4015 ) ( ON ?AUTO_4023 ?AUTO_4022 ) ( CLEAR ?AUTO_4016 ) ( ON ?AUTO_4021 ?AUTO_4023 ) ( CLEAR ?AUTO_4021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4021 ?AUTO_4023 )
      ( MAKE-ON ?AUTO_4014 ?AUTO_4015 )
      ( MAKE-ON-VERIFY ?AUTO_4014 ?AUTO_4015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4026 - BLOCK
      ?AUTO_4027 - BLOCK
    )
    :vars
    (
      ?AUTO_4029 - BLOCK
      ?AUTO_4030 - BLOCK
      ?AUTO_4032 - BLOCK
      ?AUTO_4031 - BLOCK
      ?AUTO_4033 - BLOCK
      ?AUTO_4028 - BLOCK
      ?AUTO_4036 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4026 ?AUTO_4029 ) ( CLEAR ?AUTO_4026 ) ( CLEAR ?AUTO_4030 ) ( ON ?AUTO_4032 ?AUTO_4027 ) ( ON ?AUTO_4031 ?AUTO_4032 ) ( CLEAR ?AUTO_4033 ) ( ON ?AUTO_4028 ?AUTO_4031 ) ( CLEAR ?AUTO_4028 ) ( HOLDING ?AUTO_4036 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4036 )
      ( MAKE-ON ?AUTO_4026 ?AUTO_4027 )
      ( MAKE-ON-VERIFY ?AUTO_4026 ?AUTO_4027 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4045 - BLOCK
      ?AUTO_4046 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4045 ) ( CLEAR ?AUTO_4046 ) )
    :subtasks
    ( ( !STACK ?AUTO_4045 ?AUTO_4046 )
      ( MAKE-ON-VERIFY ?AUTO_4045 ?AUTO_4046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4049 - BLOCK
      ?AUTO_4050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4050 ) ( ON-TABLE ?AUTO_4049 ) ( CLEAR ?AUTO_4049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4049 )
      ( MAKE-ON ?AUTO_4049 ?AUTO_4050 )
      ( MAKE-ON-VERIFY ?AUTO_4049 ?AUTO_4050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4054 - BLOCK
      ?AUTO_4055 - BLOCK
    )
    :vars
    (
      ?AUTO_4058 - BLOCK
      ?AUTO_4059 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4055 ) ( ON-TABLE ?AUTO_4054 ) ( CLEAR ?AUTO_4054 ) ( HOLDING ?AUTO_4058 ) ( CLEAR ?AUTO_4059 ) )
    :subtasks
    ( ( !STACK ?AUTO_4058 ?AUTO_4059 )
      ( MAKE-ON ?AUTO_4054 ?AUTO_4055 )
      ( MAKE-ON-VERIFY ?AUTO_4054 ?AUTO_4055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4070 - BLOCK
      ?AUTO_4071 - BLOCK
    )
    :vars
    (
      ?AUTO_4075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4070 ) ( CLEAR ?AUTO_4070 ) ( HOLDING ?AUTO_4071 ) ( CLEAR ?AUTO_4075 ) )
    :subtasks
    ( ( !STACK ?AUTO_4071 ?AUTO_4075 )
      ( MAKE-ON ?AUTO_4070 ?AUTO_4071 )
      ( MAKE-ON-VERIFY ?AUTO_4070 ?AUTO_4071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4088 - BLOCK
      ?AUTO_4089 - BLOCK
    )
    :vars
    (
      ?AUTO_4091 - BLOCK
      ?AUTO_4090 - BLOCK
      ?AUTO_4094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4088 ) ( ON ?AUTO_4091 ?AUTO_4089 ) ( CLEAR ?AUTO_4091 ) ( CLEAR ?AUTO_4090 ) ( ON ?AUTO_4094 ?AUTO_4088 ) ( CLEAR ?AUTO_4094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4094 ?AUTO_4088 )
      ( MAKE-ON ?AUTO_4088 ?AUTO_4089 )
      ( MAKE-ON-VERIFY ?AUTO_4088 ?AUTO_4089 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4097 - BLOCK
      ?AUTO_4098 - BLOCK
    )
    :vars
    (
      ?AUTO_4100 - BLOCK
      ?AUTO_4099 - BLOCK
      ?AUTO_4102 - BLOCK
      ?AUTO_4104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4097 ) ( ON ?AUTO_4100 ?AUTO_4098 ) ( CLEAR ?AUTO_4100 ) ( CLEAR ?AUTO_4099 ) ( ON ?AUTO_4102 ?AUTO_4097 ) ( CLEAR ?AUTO_4102 ) ( HOLDING ?AUTO_4104 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4104 )
      ( MAKE-ON ?AUTO_4097 ?AUTO_4098 )
      ( MAKE-ON-VERIFY ?AUTO_4097 ?AUTO_4098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4105 - BLOCK
      ?AUTO_4106 - BLOCK
    )
    :vars
    (
      ?AUTO_4107 - BLOCK
      ?AUTO_4108 - BLOCK
      ?AUTO_4112 - BLOCK
      ?AUTO_4111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4105 ) ( ON ?AUTO_4107 ?AUTO_4106 ) ( CLEAR ?AUTO_4108 ) ( ON ?AUTO_4112 ?AUTO_4105 ) ( CLEAR ?AUTO_4112 ) ( ON ?AUTO_4111 ?AUTO_4107 ) ( CLEAR ?AUTO_4111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4111 ?AUTO_4107 )
      ( MAKE-ON ?AUTO_4105 ?AUTO_4106 )
      ( MAKE-ON-VERIFY ?AUTO_4105 ?AUTO_4106 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4114 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4114 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4114 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4114 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4116 - BLOCK
    )
    :vars
    (
      ?AUTO_4119 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4116 ?AUTO_4119 ) ( CLEAR ?AUTO_4116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4116 ?AUTO_4119 )
      ( MAKE-ON-TABLE ?AUTO_4116 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4122 - BLOCK
      ?AUTO_4123 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4122 ) ( CLEAR ?AUTO_4123 ) )
    :subtasks
    ( ( !STACK ?AUTO_4122 ?AUTO_4123 )
      ( MAKE-ON-VERIFY ?AUTO_4122 ?AUTO_4123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4126 - BLOCK
      ?AUTO_4127 - BLOCK
    )
    :vars
    (
      ?AUTO_4131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4127 ) ( ON ?AUTO_4126 ?AUTO_4131 ) ( CLEAR ?AUTO_4126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4126 ?AUTO_4131 )
      ( MAKE-ON ?AUTO_4126 ?AUTO_4127 )
      ( MAKE-ON-VERIFY ?AUTO_4126 ?AUTO_4127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4132 - BLOCK
      ?AUTO_4133 - BLOCK
    )
    :vars
    (
      ?AUTO_4136 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4132 ?AUTO_4136 ) ( CLEAR ?AUTO_4132 ) ( HOLDING ?AUTO_4133 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4133 )
      ( MAKE-ON ?AUTO_4132 ?AUTO_4133 )
      ( MAKE-ON-VERIFY ?AUTO_4132 ?AUTO_4133 ) )
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
    )
    :precondition
    ( and ( ON ?AUTO_4138 ?AUTO_4142 ) ( ON ?AUTO_4139 ?AUTO_4138 ) ( CLEAR ?AUTO_4139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4139 ?AUTO_4138 )
      ( MAKE-ON ?AUTO_4138 ?AUTO_4139 )
      ( MAKE-ON-VERIFY ?AUTO_4138 ?AUTO_4139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4147 - BLOCK
      ?AUTO_4148 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4147 ) ( CLEAR ?AUTO_4148 ) )
    :subtasks
    ( ( !STACK ?AUTO_4147 ?AUTO_4148 )
      ( MAKE-ON-VERIFY ?AUTO_4147 ?AUTO_4148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4151 - BLOCK
      ?AUTO_4152 - BLOCK
    )
    :vars
    (
      ?AUTO_4156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4152 ) ( ON ?AUTO_4151 ?AUTO_4156 ) ( CLEAR ?AUTO_4151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4151 ?AUTO_4156 )
      ( MAKE-ON ?AUTO_4151 ?AUTO_4152 )
      ( MAKE-ON-VERIFY ?AUTO_4151 ?AUTO_4152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4157 - BLOCK
      ?AUTO_4158 - BLOCK
    )
    :vars
    (
      ?AUTO_4161 - BLOCK
      ?AUTO_4163 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4157 ?AUTO_4161 ) ( CLEAR ?AUTO_4157 ) ( HOLDING ?AUTO_4158 ) ( CLEAR ?AUTO_4163 ) )
    :subtasks
    ( ( !STACK ?AUTO_4158 ?AUTO_4163 )
      ( MAKE-ON ?AUTO_4157 ?AUTO_4158 )
      ( MAKE-ON-VERIFY ?AUTO_4157 ?AUTO_4158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4166 - BLOCK
      ?AUTO_4167 - BLOCK
    )
    :vars
    (
      ?AUTO_4169 - BLOCK
      ?AUTO_4171 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4167 ) ( ON ?AUTO_4166 ?AUTO_4169 ) ( CLEAR ?AUTO_4166 ) ( HOLDING ?AUTO_4171 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4171 )
      ( MAKE-ON ?AUTO_4166 ?AUTO_4167 )
      ( MAKE-ON-VERIFY ?AUTO_4166 ?AUTO_4167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4172 - BLOCK
      ?AUTO_4173 - BLOCK
    )
    :vars
    (
      ?AUTO_4176 - BLOCK
      ?AUTO_4177 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4172 ?AUTO_4176 ) ( CLEAR ?AUTO_4172 ) ( ON ?AUTO_4177 ?AUTO_4173 ) ( CLEAR ?AUTO_4177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4177 ?AUTO_4173 )
      ( MAKE-ON ?AUTO_4172 ?AUTO_4173 )
      ( MAKE-ON-VERIFY ?AUTO_4172 ?AUTO_4173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4182 - BLOCK
      ?AUTO_4183 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4182 ) ( CLEAR ?AUTO_4183 ) )
    :subtasks
    ( ( !STACK ?AUTO_4182 ?AUTO_4183 )
      ( MAKE-ON-VERIFY ?AUTO_4182 ?AUTO_4183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4186 - BLOCK
      ?AUTO_4187 - BLOCK
    )
    :vars
    (
      ?AUTO_4191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4187 ) ( ON ?AUTO_4186 ?AUTO_4191 ) ( CLEAR ?AUTO_4186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4186 ?AUTO_4191 )
      ( MAKE-ON ?AUTO_4186 ?AUTO_4187 )
      ( MAKE-ON-VERIFY ?AUTO_4186 ?AUTO_4187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4192 - BLOCK
      ?AUTO_4193 - BLOCK
    )
    :vars
    (
      ?AUTO_4194 - BLOCK
      ?AUTO_4197 - BLOCK
      ?AUTO_4198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4193 ) ( ON ?AUTO_4192 ?AUTO_4194 ) ( CLEAR ?AUTO_4192 ) ( HOLDING ?AUTO_4197 ) ( CLEAR ?AUTO_4198 ) )
    :subtasks
    ( ( !STACK ?AUTO_4197 ?AUTO_4198 )
      ( MAKE-ON ?AUTO_4192 ?AUTO_4193 )
      ( MAKE-ON-VERIFY ?AUTO_4192 ?AUTO_4193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4199 - BLOCK
      ?AUTO_4200 - BLOCK
    )
    :vars
    (
      ?AUTO_4203 - BLOCK
      ?AUTO_4205 - BLOCK
      ?AUTO_4202 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4199 ?AUTO_4203 ) ( CLEAR ?AUTO_4199 ) ( CLEAR ?AUTO_4205 ) ( ON ?AUTO_4202 ?AUTO_4200 ) ( CLEAR ?AUTO_4202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4202 ?AUTO_4200 )
      ( MAKE-ON ?AUTO_4199 ?AUTO_4200 )
      ( MAKE-ON-VERIFY ?AUTO_4199 ?AUTO_4200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4208 - BLOCK
      ?AUTO_4209 - BLOCK
    )
    :vars
    (
      ?AUTO_4214 - BLOCK
      ?AUTO_4213 - BLOCK
      ?AUTO_4210 - BLOCK
      ?AUTO_4216 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4208 ?AUTO_4214 ) ( CLEAR ?AUTO_4208 ) ( ON ?AUTO_4213 ?AUTO_4209 ) ( CLEAR ?AUTO_4213 ) ( HOLDING ?AUTO_4210 ) ( CLEAR ?AUTO_4216 ) )
    :subtasks
    ( ( !STACK ?AUTO_4210 ?AUTO_4216 )
      ( MAKE-ON ?AUTO_4208 ?AUTO_4209 )
      ( MAKE-ON-VERIFY ?AUTO_4208 ?AUTO_4209 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4217 - BLOCK
      ?AUTO_4218 - BLOCK
    )
    :vars
    (
      ?AUTO_4224 - BLOCK
      ?AUTO_4219 - BLOCK
      ?AUTO_4221 - BLOCK
      ?AUTO_4220 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4217 ?AUTO_4224 ) ( ON ?AUTO_4219 ?AUTO_4218 ) ( CLEAR ?AUTO_4219 ) ( CLEAR ?AUTO_4221 ) ( ON ?AUTO_4220 ?AUTO_4217 ) ( CLEAR ?AUTO_4220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4220 ?AUTO_4217 )
      ( MAKE-ON ?AUTO_4217 ?AUTO_4218 )
      ( MAKE-ON-VERIFY ?AUTO_4217 ?AUTO_4218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4227 - BLOCK
      ?AUTO_4228 - BLOCK
    )
    :vars
    (
      ?AUTO_4233 - BLOCK
      ?AUTO_4231 - BLOCK
      ?AUTO_4232 - BLOCK
      ?AUTO_4234 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4227 ?AUTO_4233 ) ( ON ?AUTO_4231 ?AUTO_4228 ) ( CLEAR ?AUTO_4231 ) ( ON ?AUTO_4232 ?AUTO_4227 ) ( CLEAR ?AUTO_4232 ) ( HOLDING ?AUTO_4234 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4234 )
      ( MAKE-ON ?AUTO_4227 ?AUTO_4228 )
      ( MAKE-ON-VERIFY ?AUTO_4227 ?AUTO_4228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4236 - BLOCK
      ?AUTO_4237 - BLOCK
    )
    :vars
    (
      ?AUTO_4238 - BLOCK
      ?AUTO_4242 - BLOCK
      ?AUTO_4243 - BLOCK
      ?AUTO_4239 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4236 ?AUTO_4238 ) ( ON ?AUTO_4242 ?AUTO_4237 ) ( CLEAR ?AUTO_4242 ) ( ON ?AUTO_4243 ?AUTO_4236 ) ( ON ?AUTO_4239 ?AUTO_4243 ) ( CLEAR ?AUTO_4239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4239 ?AUTO_4243 )
      ( MAKE-ON ?AUTO_4236 ?AUTO_4237 )
      ( MAKE-ON-VERIFY ?AUTO_4236 ?AUTO_4237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4248 - BLOCK
      ?AUTO_4249 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4248 ) ( CLEAR ?AUTO_4249 ) )
    :subtasks
    ( ( !STACK ?AUTO_4248 ?AUTO_4249 )
      ( MAKE-ON-VERIFY ?AUTO_4248 ?AUTO_4249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4252 - BLOCK
      ?AUTO_4253 - BLOCK
    )
    :vars
    (
      ?AUTO_4257 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4253 ) ( ON ?AUTO_4252 ?AUTO_4257 ) ( CLEAR ?AUTO_4252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4252 ?AUTO_4257 )
      ( MAKE-ON ?AUTO_4252 ?AUTO_4253 )
      ( MAKE-ON-VERIFY ?AUTO_4252 ?AUTO_4253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4258 - BLOCK
      ?AUTO_4259 - BLOCK
    )
    :vars
    (
      ?AUTO_4262 - BLOCK
      ?AUTO_4263 - BLOCK
      ?AUTO_4264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4259 ) ( ON ?AUTO_4258 ?AUTO_4262 ) ( CLEAR ?AUTO_4258 ) ( HOLDING ?AUTO_4263 ) ( CLEAR ?AUTO_4264 ) )
    :subtasks
    ( ( !STACK ?AUTO_4263 ?AUTO_4264 )
      ( MAKE-ON ?AUTO_4258 ?AUTO_4259 )
      ( MAKE-ON-VERIFY ?AUTO_4258 ?AUTO_4259 ) )
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
      ?AUTO_4271 - BLOCK
      ?AUTO_4270 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4265 ?AUTO_4269 ) ( CLEAR ?AUTO_4265 ) ( CLEAR ?AUTO_4271 ) ( ON ?AUTO_4270 ?AUTO_4266 ) ( CLEAR ?AUTO_4270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4270 ?AUTO_4266 )
      ( MAKE-ON ?AUTO_4265 ?AUTO_4266 )
      ( MAKE-ON-VERIFY ?AUTO_4265 ?AUTO_4266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4274 - BLOCK
      ?AUTO_4275 - BLOCK
    )
    :vars
    (
      ?AUTO_4277 - BLOCK
      ?AUTO_4276 - BLOCK
      ?AUTO_4280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4277 ) ( ON ?AUTO_4276 ?AUTO_4275 ) ( CLEAR ?AUTO_4276 ) ( HOLDING ?AUTO_4274 ) ( CLEAR ?AUTO_4280 ) )
    :subtasks
    ( ( !STACK ?AUTO_4274 ?AUTO_4280 )
      ( MAKE-ON ?AUTO_4274 ?AUTO_4275 )
      ( MAKE-ON-VERIFY ?AUTO_4274 ?AUTO_4275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4287 - BLOCK
      ?AUTO_4288 - BLOCK
    )
    :vars
    (
      ?AUTO_4294 - BLOCK
      ?AUTO_4293 - BLOCK
      ?AUTO_4291 - BLOCK
      ?AUTO_4290 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4287 ?AUTO_4294 ) ( CLEAR ?AUTO_4287 ) ( ON ?AUTO_4293 ?AUTO_4288 ) ( CLEAR ?AUTO_4291 ) ( ON ?AUTO_4290 ?AUTO_4293 ) ( CLEAR ?AUTO_4290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4290 ?AUTO_4293 )
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
      ?AUTO_4303 - BLOCK
      ?AUTO_4301 - BLOCK
      ?AUTO_4304 - BLOCK
      ?AUTO_4302 - BLOCK
      ?AUTO_4305 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4297 ?AUTO_4303 ) ( CLEAR ?AUTO_4297 ) ( ON ?AUTO_4301 ?AUTO_4298 ) ( CLEAR ?AUTO_4304 ) ( ON ?AUTO_4302 ?AUTO_4301 ) ( CLEAR ?AUTO_4302 ) ( HOLDING ?AUTO_4305 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4305 )
      ( MAKE-ON ?AUTO_4297 ?AUTO_4298 )
      ( MAKE-ON-VERIFY ?AUTO_4297 ?AUTO_4298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4306 - BLOCK
      ?AUTO_4307 - BLOCK
    )
    :vars
    (
      ?AUTO_4313 - BLOCK
      ?AUTO_4308 - BLOCK
      ?AUTO_4312 - BLOCK
      ?AUTO_4314 - BLOCK
      ?AUTO_4311 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4306 ?AUTO_4313 ) ( CLEAR ?AUTO_4306 ) ( ON ?AUTO_4308 ?AUTO_4307 ) ( CLEAR ?AUTO_4312 ) ( ON ?AUTO_4314 ?AUTO_4308 ) ( ON ?AUTO_4311 ?AUTO_4314 ) ( CLEAR ?AUTO_4311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4311 ?AUTO_4314 )
      ( MAKE-ON ?AUTO_4306 ?AUTO_4307 )
      ( MAKE-ON-VERIFY ?AUTO_4306 ?AUTO_4307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4319 - BLOCK
      ?AUTO_4320 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4319 ) ( CLEAR ?AUTO_4320 ) )
    :subtasks
    ( ( !STACK ?AUTO_4319 ?AUTO_4320 )
      ( MAKE-ON-VERIFY ?AUTO_4319 ?AUTO_4320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4323 - BLOCK
      ?AUTO_4324 - BLOCK
    )
    :vars
    (
      ?AUTO_4328 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4324 ) ( ON ?AUTO_4323 ?AUTO_4328 ) ( CLEAR ?AUTO_4323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4323 ?AUTO_4328 )
      ( MAKE-ON ?AUTO_4323 ?AUTO_4324 )
      ( MAKE-ON-VERIFY ?AUTO_4323 ?AUTO_4324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4329 - BLOCK
      ?AUTO_4330 - BLOCK
    )
    :vars
    (
      ?AUTO_4333 - BLOCK
      ?AUTO_4334 - BLOCK
      ?AUTO_4335 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4330 ) ( ON ?AUTO_4329 ?AUTO_4333 ) ( CLEAR ?AUTO_4329 ) ( HOLDING ?AUTO_4334 ) ( CLEAR ?AUTO_4335 ) )
    :subtasks
    ( ( !STACK ?AUTO_4334 ?AUTO_4335 )
      ( MAKE-ON ?AUTO_4329 ?AUTO_4330 )
      ( MAKE-ON-VERIFY ?AUTO_4329 ?AUTO_4330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4336 - BLOCK
      ?AUTO_4337 - BLOCK
    )
    :vars
    (
      ?AUTO_4340 - BLOCK
      ?AUTO_4342 - BLOCK
      ?AUTO_4341 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4337 ) ( ON ?AUTO_4336 ?AUTO_4340 ) ( CLEAR ?AUTO_4342 ) ( ON ?AUTO_4341 ?AUTO_4336 ) ( CLEAR ?AUTO_4341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4341 ?AUTO_4336 )
      ( MAKE-ON ?AUTO_4336 ?AUTO_4337 )
      ( MAKE-ON-VERIFY ?AUTO_4336 ?AUTO_4337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4345 - BLOCK
      ?AUTO_4346 - BLOCK
    )
    :vars
    (
      ?AUTO_4351 - BLOCK
      ?AUTO_4348 - BLOCK
      ?AUTO_4347 - BLOCK
      ?AUTO_4353 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4345 ?AUTO_4351 ) ( CLEAR ?AUTO_4348 ) ( ON ?AUTO_4347 ?AUTO_4345 ) ( CLEAR ?AUTO_4347 ) ( HOLDING ?AUTO_4346 ) ( CLEAR ?AUTO_4353 ) )
    :subtasks
    ( ( !STACK ?AUTO_4346 ?AUTO_4353 )
      ( MAKE-ON ?AUTO_4345 ?AUTO_4346 )
      ( MAKE-ON-VERIFY ?AUTO_4345 ?AUTO_4346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4377 - BLOCK
      ?AUTO_4378 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4377 ) ( CLEAR ?AUTO_4378 ) )
    :subtasks
    ( ( !STACK ?AUTO_4377 ?AUTO_4378 )
      ( MAKE-ON-VERIFY ?AUTO_4377 ?AUTO_4378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4381 - BLOCK
      ?AUTO_4382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4382 ) ( ON-TABLE ?AUTO_4381 ) ( CLEAR ?AUTO_4381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4381 )
      ( MAKE-ON ?AUTO_4381 ?AUTO_4382 )
      ( MAKE-ON-VERIFY ?AUTO_4381 ?AUTO_4382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4386 - BLOCK
      ?AUTO_4387 - BLOCK
    )
    :vars
    (
      ?AUTO_4391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4386 ) ( CLEAR ?AUTO_4386 ) ( HOLDING ?AUTO_4387 ) ( CLEAR ?AUTO_4391 ) )
    :subtasks
    ( ( !STACK ?AUTO_4387 ?AUTO_4391 )
      ( MAKE-ON ?AUTO_4386 ?AUTO_4387 )
      ( MAKE-ON-VERIFY ?AUTO_4386 ?AUTO_4387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4392 - BLOCK
      ?AUTO_4393 - BLOCK
    )
    :vars
    (
      ?AUTO_4395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4392 ) ( CLEAR ?AUTO_4395 ) ( ON ?AUTO_4393 ?AUTO_4392 ) ( CLEAR ?AUTO_4393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4393 ?AUTO_4392 )
      ( MAKE-ON ?AUTO_4392 ?AUTO_4393 )
      ( MAKE-ON-VERIFY ?AUTO_4392 ?AUTO_4393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4399 - BLOCK
      ?AUTO_4400 - BLOCK
    )
    :vars
    (
      ?AUTO_4401 - BLOCK
      ?AUTO_4404 - BLOCK
      ?AUTO_4405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4399 ) ( CLEAR ?AUTO_4401 ) ( ON ?AUTO_4400 ?AUTO_4399 ) ( CLEAR ?AUTO_4400 ) ( HOLDING ?AUTO_4404 ) ( CLEAR ?AUTO_4405 ) )
    :subtasks
    ( ( !STACK ?AUTO_4404 ?AUTO_4405 )
      ( MAKE-ON ?AUTO_4399 ?AUTO_4400 )
      ( MAKE-ON-VERIFY ?AUTO_4399 ?AUTO_4400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4406 - BLOCK
      ?AUTO_4407 - BLOCK
    )
    :vars
    (
      ?AUTO_4408 - BLOCK
      ?AUTO_4412 - BLOCK
      ?AUTO_4411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4406 ) ( CLEAR ?AUTO_4408 ) ( ON ?AUTO_4407 ?AUTO_4406 ) ( CLEAR ?AUTO_4412 ) ( ON ?AUTO_4411 ?AUTO_4407 ) ( CLEAR ?AUTO_4411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4411 ?AUTO_4407 )
      ( MAKE-ON ?AUTO_4406 ?AUTO_4407 )
      ( MAKE-ON-VERIFY ?AUTO_4406 ?AUTO_4407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4415 - BLOCK
      ?AUTO_4416 - BLOCK
    )
    :vars
    (
      ?AUTO_4417 - BLOCK
      ?AUTO_4421 - BLOCK
      ?AUTO_4420 - BLOCK
      ?AUTO_4423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4415 ) ( ON ?AUTO_4416 ?AUTO_4415 ) ( CLEAR ?AUTO_4417 ) ( ON ?AUTO_4421 ?AUTO_4416 ) ( CLEAR ?AUTO_4421 ) ( HOLDING ?AUTO_4420 ) ( CLEAR ?AUTO_4423 ) )
    :subtasks
    ( ( !STACK ?AUTO_4420 ?AUTO_4423 )
      ( MAKE-ON ?AUTO_4415 ?AUTO_4416 )
      ( MAKE-ON-VERIFY ?AUTO_4415 ?AUTO_4416 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4425 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4425 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4425 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4425 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4427 - BLOCK
    )
    :vars
    (
      ?AUTO_4430 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4427 ?AUTO_4430 ) ( CLEAR ?AUTO_4427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4427 ?AUTO_4430 )
      ( MAKE-ON-TABLE ?AUTO_4427 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4427 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4432 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4432 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4432 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4432 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4434 - BLOCK
    )
    :vars
    (
      ?AUTO_4437 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4434 ?AUTO_4437 ) ( CLEAR ?AUTO_4434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4434 ?AUTO_4437 )
      ( MAKE-ON-TABLE ?AUTO_4434 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4434 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4438 - BLOCK
    )
    :vars
    (
      ?AUTO_4440 - BLOCK
      ?AUTO_4441 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4438 ?AUTO_4440 ) ( CLEAR ?AUTO_4438 ) ( HOLDING ?AUTO_4441 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4441 )
      ( MAKE-ON-TABLE ?AUTO_4438 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4438 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4442 - BLOCK
    )
    :vars
    (
      ?AUTO_4444 - BLOCK
      ?AUTO_4445 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4442 ?AUTO_4444 ) ( ON ?AUTO_4445 ?AUTO_4442 ) ( CLEAR ?AUTO_4445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4445 ?AUTO_4442 )
      ( MAKE-ON-TABLE ?AUTO_4442 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4442 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4449 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4449 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4449 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4449 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4451 - BLOCK
    )
    :vars
    (
      ?AUTO_4454 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4451 ?AUTO_4454 ) ( CLEAR ?AUTO_4451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4451 ?AUTO_4454 )
      ( MAKE-ON-TABLE ?AUTO_4451 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4451 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4455 - BLOCK
    )
    :vars
    (
      ?AUTO_4457 - BLOCK
      ?AUTO_4458 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4455 ?AUTO_4457 ) ( CLEAR ?AUTO_4455 ) ( HOLDING ?AUTO_4458 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4458 )
      ( MAKE-ON-TABLE ?AUTO_4455 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4455 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4464 - BLOCK
      ?AUTO_4465 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4464 ) ( CLEAR ?AUTO_4465 ) )
    :subtasks
    ( ( !STACK ?AUTO_4464 ?AUTO_4465 )
      ( MAKE-ON-VERIFY ?AUTO_4464 ?AUTO_4465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4468 - BLOCK
      ?AUTO_4469 - BLOCK
    )
    :vars
    (
      ?AUTO_4473 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4469 ) ( ON ?AUTO_4468 ?AUTO_4473 ) ( CLEAR ?AUTO_4468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4468 ?AUTO_4473 )
      ( MAKE-ON ?AUTO_4468 ?AUTO_4469 )
      ( MAKE-ON-VERIFY ?AUTO_4468 ?AUTO_4469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4474 - BLOCK
      ?AUTO_4475 - BLOCK
    )
    :vars
    (
      ?AUTO_4478 - BLOCK
      ?AUTO_4479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4475 ) ( ON ?AUTO_4474 ?AUTO_4478 ) ( CLEAR ?AUTO_4474 ) ( HOLDING ?AUTO_4479 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4479 )
      ( MAKE-ON ?AUTO_4474 ?AUTO_4475 )
      ( MAKE-ON-VERIFY ?AUTO_4474 ?AUTO_4475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4480 - BLOCK
      ?AUTO_4481 - BLOCK
    )
    :vars
    (
      ?AUTO_4484 - BLOCK
      ?AUTO_4485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4481 ) ( ON ?AUTO_4480 ?AUTO_4484 ) ( ON ?AUTO_4485 ?AUTO_4480 ) ( CLEAR ?AUTO_4485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4485 ?AUTO_4480 )
      ( MAKE-ON ?AUTO_4480 ?AUTO_4481 )
      ( MAKE-ON-VERIFY ?AUTO_4480 ?AUTO_4481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4488 - BLOCK
      ?AUTO_4489 - BLOCK
    )
    :vars
    (
      ?AUTO_4493 - BLOCK
      ?AUTO_4490 - BLOCK
      ?AUTO_4494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4489 ) ( ON ?AUTO_4488 ?AUTO_4493 ) ( ON ?AUTO_4490 ?AUTO_4488 ) ( CLEAR ?AUTO_4490 ) ( HOLDING ?AUTO_4494 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4494 )
      ( MAKE-ON ?AUTO_4488 ?AUTO_4489 )
      ( MAKE-ON-VERIFY ?AUTO_4488 ?AUTO_4489 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4502 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4502 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4502 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4502 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4504 - BLOCK
    )
    :vars
    (
      ?AUTO_4507 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4504 ?AUTO_4507 ) ( CLEAR ?AUTO_4504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4504 ?AUTO_4507 )
      ( MAKE-ON-TABLE ?AUTO_4504 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4504 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4508 - BLOCK
    )
    :vars
    (
      ?AUTO_4510 - BLOCK
      ?AUTO_4511 - BLOCK
      ?AUTO_4512 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4508 ?AUTO_4510 ) ( CLEAR ?AUTO_4508 ) ( HOLDING ?AUTO_4511 ) ( CLEAR ?AUTO_4512 ) )
    :subtasks
    ( ( !STACK ?AUTO_4511 ?AUTO_4512 )
      ( MAKE-ON-TABLE ?AUTO_4508 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4508 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4513 - BLOCK
    )
    :vars
    (
      ?AUTO_4515 - BLOCK
      ?AUTO_4517 - BLOCK
      ?AUTO_4516 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4513 ?AUTO_4515 ) ( CLEAR ?AUTO_4517 ) ( ON ?AUTO_4516 ?AUTO_4513 ) ( CLEAR ?AUTO_4516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4516 ?AUTO_4513 )
      ( MAKE-ON-TABLE ?AUTO_4513 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4513 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4520 - BLOCK
    )
    :vars
    (
      ?AUTO_4524 - BLOCK
      ?AUTO_4521 - BLOCK
      ?AUTO_4522 - BLOCK
      ?AUTO_4525 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4520 ?AUTO_4524 ) ( CLEAR ?AUTO_4521 ) ( ON ?AUTO_4522 ?AUTO_4520 ) ( CLEAR ?AUTO_4522 ) ( HOLDING ?AUTO_4525 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4525 )
      ( MAKE-ON-TABLE ?AUTO_4520 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4520 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4526 - BLOCK
    )
    :vars
    (
      ?AUTO_4527 - BLOCK
      ?AUTO_4528 - BLOCK
      ?AUTO_4529 - BLOCK
      ?AUTO_4531 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4526 ?AUTO_4527 ) ( CLEAR ?AUTO_4528 ) ( ON ?AUTO_4529 ?AUTO_4526 ) ( ON ?AUTO_4531 ?AUTO_4529 ) ( CLEAR ?AUTO_4531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4531 ?AUTO_4529 )
      ( MAKE-ON-TABLE ?AUTO_4526 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4526 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4534 - BLOCK
    )
    :vars
    (
      ?AUTO_4537 - BLOCK
      ?AUTO_4535 - BLOCK
      ?AUTO_4539 - BLOCK
      ?AUTO_4538 - BLOCK
      ?AUTO_4540 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4534 ?AUTO_4537 ) ( CLEAR ?AUTO_4535 ) ( ON ?AUTO_4539 ?AUTO_4534 ) ( ON ?AUTO_4538 ?AUTO_4539 ) ( CLEAR ?AUTO_4538 ) ( HOLDING ?AUTO_4540 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4540 )
      ( MAKE-ON-TABLE ?AUTO_4534 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4546 - BLOCK
      ?AUTO_4547 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4546 ) ( CLEAR ?AUTO_4547 ) )
    :subtasks
    ( ( !STACK ?AUTO_4546 ?AUTO_4547 )
      ( MAKE-ON-VERIFY ?AUTO_4546 ?AUTO_4547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4550 - BLOCK
      ?AUTO_4551 - BLOCK
    )
    :vars
    (
      ?AUTO_4555 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4551 ) ( ON ?AUTO_4550 ?AUTO_4555 ) ( CLEAR ?AUTO_4550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4550 ?AUTO_4555 )
      ( MAKE-ON ?AUTO_4550 ?AUTO_4551 )
      ( MAKE-ON-VERIFY ?AUTO_4550 ?AUTO_4551 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4556 - BLOCK
      ?AUTO_4557 - BLOCK
    )
    :vars
    (
      ?AUTO_4560 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4556 ?AUTO_4560 ) ( CLEAR ?AUTO_4556 ) ( HOLDING ?AUTO_4557 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4557 )
      ( MAKE-ON ?AUTO_4556 ?AUTO_4557 )
      ( MAKE-ON-VERIFY ?AUTO_4556 ?AUTO_4557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4564 - BLOCK
      ?AUTO_4565 - BLOCK
    )
    :vars
    (
      ?AUTO_4566 - BLOCK
      ?AUTO_4569 - BLOCK
      ?AUTO_4570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4565 ) ( ON ?AUTO_4564 ?AUTO_4566 ) ( CLEAR ?AUTO_4564 ) ( HOLDING ?AUTO_4569 ) ( CLEAR ?AUTO_4570 ) )
    :subtasks
    ( ( !STACK ?AUTO_4569 ?AUTO_4570 )
      ( MAKE-ON ?AUTO_4564 ?AUTO_4565 )
      ( MAKE-ON-VERIFY ?AUTO_4564 ?AUTO_4565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4571 - BLOCK
      ?AUTO_4572 - BLOCK
    )
    :vars
    (
      ?AUTO_4575 - BLOCK
      ?AUTO_4577 - BLOCK
      ?AUTO_4576 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4571 ?AUTO_4575 ) ( CLEAR ?AUTO_4571 ) ( CLEAR ?AUTO_4577 ) ( ON ?AUTO_4576 ?AUTO_4572 ) ( CLEAR ?AUTO_4576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4576 ?AUTO_4572 )
      ( MAKE-ON ?AUTO_4571 ?AUTO_4572 )
      ( MAKE-ON-VERIFY ?AUTO_4571 ?AUTO_4572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4580 - BLOCK
      ?AUTO_4581 - BLOCK
    )
    :vars
    (
      ?AUTO_4586 - BLOCK
      ?AUTO_4582 - BLOCK
      ?AUTO_4583 - BLOCK
      ?AUTO_4587 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4580 ?AUTO_4586 ) ( CLEAR ?AUTO_4580 ) ( CLEAR ?AUTO_4582 ) ( ON ?AUTO_4583 ?AUTO_4581 ) ( CLEAR ?AUTO_4583 ) ( HOLDING ?AUTO_4587 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4587 )
      ( MAKE-ON ?AUTO_4580 ?AUTO_4581 )
      ( MAKE-ON-VERIFY ?AUTO_4580 ?AUTO_4581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4588 - BLOCK
      ?AUTO_4589 - BLOCK
    )
    :vars
    (
      ?AUTO_4594 - BLOCK
      ?AUTO_4590 - BLOCK
      ?AUTO_4592 - BLOCK
      ?AUTO_4595 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4588 ?AUTO_4594 ) ( CLEAR ?AUTO_4588 ) ( CLEAR ?AUTO_4590 ) ( ON ?AUTO_4592 ?AUTO_4589 ) ( ON ?AUTO_4595 ?AUTO_4592 ) ( CLEAR ?AUTO_4595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4595 ?AUTO_4592 )
      ( MAKE-ON ?AUTO_4588 ?AUTO_4589 )
      ( MAKE-ON-VERIFY ?AUTO_4588 ?AUTO_4589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4598 - BLOCK
      ?AUTO_4599 - BLOCK
    )
    :vars
    (
      ?AUTO_4601 - BLOCK
      ?AUTO_4604 - BLOCK
      ?AUTO_4603 - BLOCK
      ?AUTO_4605 - BLOCK
      ?AUTO_4606 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4598 ?AUTO_4601 ) ( CLEAR ?AUTO_4598 ) ( CLEAR ?AUTO_4604 ) ( ON ?AUTO_4603 ?AUTO_4599 ) ( ON ?AUTO_4605 ?AUTO_4603 ) ( CLEAR ?AUTO_4605 ) ( HOLDING ?AUTO_4606 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4606 )
      ( MAKE-ON ?AUTO_4598 ?AUTO_4599 )
      ( MAKE-ON-VERIFY ?AUTO_4598 ?AUTO_4599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4607 - BLOCK
      ?AUTO_4608 - BLOCK
    )
    :vars
    (
      ?AUTO_4614 - BLOCK
      ?AUTO_4610 - BLOCK
      ?AUTO_4611 - BLOCK
      ?AUTO_4609 - BLOCK
      ?AUTO_4615 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4607 ?AUTO_4614 ) ( CLEAR ?AUTO_4610 ) ( ON ?AUTO_4611 ?AUTO_4608 ) ( ON ?AUTO_4609 ?AUTO_4611 ) ( CLEAR ?AUTO_4609 ) ( ON ?AUTO_4615 ?AUTO_4607 ) ( CLEAR ?AUTO_4615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4615 ?AUTO_4607 )
      ( MAKE-ON ?AUTO_4607 ?AUTO_4608 )
      ( MAKE-ON-VERIFY ?AUTO_4607 ?AUTO_4608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4618 - BLOCK
      ?AUTO_4619 - BLOCK
    )
    :vars
    (
      ?AUTO_4623 - BLOCK
      ?AUTO_4622 - BLOCK
      ?AUTO_4624 - BLOCK
      ?AUTO_4621 - BLOCK
      ?AUTO_4626 - BLOCK
      ?AUTO_4627 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4618 ?AUTO_4623 ) ( CLEAR ?AUTO_4622 ) ( ON ?AUTO_4624 ?AUTO_4619 ) ( ON ?AUTO_4621 ?AUTO_4624 ) ( CLEAR ?AUTO_4621 ) ( ON ?AUTO_4626 ?AUTO_4618 ) ( CLEAR ?AUTO_4626 ) ( HOLDING ?AUTO_4627 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4627 )
      ( MAKE-ON ?AUTO_4618 ?AUTO_4619 )
      ( MAKE-ON-VERIFY ?AUTO_4618 ?AUTO_4619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4628 - BLOCK
      ?AUTO_4629 - BLOCK
    )
    :vars
    (
      ?AUTO_4630 - BLOCK
      ?AUTO_4636 - BLOCK
      ?AUTO_4635 - BLOCK
      ?AUTO_4632 - BLOCK
      ?AUTO_4631 - BLOCK
      ?AUTO_4637 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4628 ?AUTO_4630 ) ( CLEAR ?AUTO_4636 ) ( ON ?AUTO_4635 ?AUTO_4629 ) ( ON ?AUTO_4632 ?AUTO_4635 ) ( CLEAR ?AUTO_4632 ) ( ON ?AUTO_4631 ?AUTO_4628 ) ( ON ?AUTO_4637 ?AUTO_4631 ) ( CLEAR ?AUTO_4637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4637 ?AUTO_4631 )
      ( MAKE-ON ?AUTO_4628 ?AUTO_4629 )
      ( MAKE-ON-VERIFY ?AUTO_4628 ?AUTO_4629 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4642 - BLOCK
      ?AUTO_4643 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4642 ) ( CLEAR ?AUTO_4643 ) )
    :subtasks
    ( ( !STACK ?AUTO_4642 ?AUTO_4643 )
      ( MAKE-ON-VERIFY ?AUTO_4642 ?AUTO_4643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4646 - BLOCK
      ?AUTO_4647 - BLOCK
    )
    :vars
    (
      ?AUTO_4651 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4647 ) ( ON ?AUTO_4646 ?AUTO_4651 ) ( CLEAR ?AUTO_4646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4646 ?AUTO_4651 )
      ( MAKE-ON ?AUTO_4646 ?AUTO_4647 )
      ( MAKE-ON-VERIFY ?AUTO_4646 ?AUTO_4647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4652 - BLOCK
      ?AUTO_4653 - BLOCK
    )
    :vars
    (
      ?AUTO_4656 - BLOCK
      ?AUTO_4657 - BLOCK
      ?AUTO_4658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4653 ) ( ON ?AUTO_4652 ?AUTO_4656 ) ( CLEAR ?AUTO_4652 ) ( HOLDING ?AUTO_4657 ) ( CLEAR ?AUTO_4658 ) )
    :subtasks
    ( ( !STACK ?AUTO_4657 ?AUTO_4658 )
      ( MAKE-ON ?AUTO_4652 ?AUTO_4653 )
      ( MAKE-ON-VERIFY ?AUTO_4652 ?AUTO_4653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4659 - BLOCK
      ?AUTO_4660 - BLOCK
    )
    :vars
    (
      ?AUTO_4663 - BLOCK
      ?AUTO_4665 - BLOCK
      ?AUTO_4664 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4659 ?AUTO_4663 ) ( CLEAR ?AUTO_4659 ) ( CLEAR ?AUTO_4665 ) ( ON ?AUTO_4664 ?AUTO_4660 ) ( CLEAR ?AUTO_4664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4664 ?AUTO_4660 )
      ( MAKE-ON ?AUTO_4659 ?AUTO_4660 )
      ( MAKE-ON-VERIFY ?AUTO_4659 ?AUTO_4660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4668 - BLOCK
      ?AUTO_4669 - BLOCK
    )
    :vars
    (
      ?AUTO_4674 - BLOCK
      ?AUTO_4671 - BLOCK
      ?AUTO_4670 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4668 ?AUTO_4674 ) ( CLEAR ?AUTO_4668 ) ( ON ?AUTO_4671 ?AUTO_4669 ) ( CLEAR ?AUTO_4671 ) ( HOLDING ?AUTO_4670 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4670 )
      ( MAKE-ON ?AUTO_4668 ?AUTO_4669 )
      ( MAKE-ON-VERIFY ?AUTO_4668 ?AUTO_4669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4676 - BLOCK
      ?AUTO_4677 - BLOCK
    )
    :vars
    (
      ?AUTO_4682 - BLOCK
      ?AUTO_4680 - BLOCK
      ?AUTO_4678 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4676 ?AUTO_4682 ) ( ON ?AUTO_4680 ?AUTO_4677 ) ( CLEAR ?AUTO_4680 ) ( ON ?AUTO_4678 ?AUTO_4676 ) ( CLEAR ?AUTO_4678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4678 ?AUTO_4676 )
      ( MAKE-ON ?AUTO_4676 ?AUTO_4677 )
      ( MAKE-ON-VERIFY ?AUTO_4676 ?AUTO_4677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4685 - BLOCK
      ?AUTO_4686 - BLOCK
    )
    :vars
    (
      ?AUTO_4691 - BLOCK
      ?AUTO_4690 - BLOCK
      ?AUTO_4689 - BLOCK
      ?AUTO_4692 - BLOCK
      ?AUTO_4693 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4685 ?AUTO_4691 ) ( ON ?AUTO_4690 ?AUTO_4686 ) ( CLEAR ?AUTO_4690 ) ( ON ?AUTO_4689 ?AUTO_4685 ) ( CLEAR ?AUTO_4689 ) ( HOLDING ?AUTO_4692 ) ( CLEAR ?AUTO_4693 ) )
    :subtasks
    ( ( !STACK ?AUTO_4692 ?AUTO_4693 )
      ( MAKE-ON ?AUTO_4685 ?AUTO_4686 )
      ( MAKE-ON-VERIFY ?AUTO_4685 ?AUTO_4686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4694 - BLOCK
      ?AUTO_4695 - BLOCK
    )
    :vars
    (
      ?AUTO_4696 - BLOCK
      ?AUTO_4701 - BLOCK
      ?AUTO_4702 - BLOCK
      ?AUTO_4698 - BLOCK
      ?AUTO_4697 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4694 ?AUTO_4696 ) ( ON ?AUTO_4701 ?AUTO_4695 ) ( CLEAR ?AUTO_4701 ) ( ON ?AUTO_4702 ?AUTO_4694 ) ( CLEAR ?AUTO_4698 ) ( ON ?AUTO_4697 ?AUTO_4702 ) ( CLEAR ?AUTO_4697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4697 ?AUTO_4702 )
      ( MAKE-ON ?AUTO_4694 ?AUTO_4695 )
      ( MAKE-ON-VERIFY ?AUTO_4694 ?AUTO_4695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4705 - BLOCK
      ?AUTO_4706 - BLOCK
    )
    :vars
    (
      ?AUTO_4710 - BLOCK
      ?AUTO_4711 - BLOCK
      ?AUTO_4713 - BLOCK
      ?AUTO_4712 - BLOCK
      ?AUTO_4709 - BLOCK
      ?AUTO_4714 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4705 ?AUTO_4710 ) ( ON ?AUTO_4711 ?AUTO_4706 ) ( CLEAR ?AUTO_4711 ) ( ON ?AUTO_4713 ?AUTO_4705 ) ( CLEAR ?AUTO_4712 ) ( ON ?AUTO_4709 ?AUTO_4713 ) ( CLEAR ?AUTO_4709 ) ( HOLDING ?AUTO_4714 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4714 )
      ( MAKE-ON ?AUTO_4705 ?AUTO_4706 )
      ( MAKE-ON-VERIFY ?AUTO_4705 ?AUTO_4706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4715 - BLOCK
      ?AUTO_4716 - BLOCK
    )
    :vars
    (
      ?AUTO_4723 - BLOCK
      ?AUTO_4722 - BLOCK
      ?AUTO_4718 - BLOCK
      ?AUTO_4717 - BLOCK
      ?AUTO_4724 - BLOCK
      ?AUTO_4719 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4715 ?AUTO_4723 ) ( ON ?AUTO_4722 ?AUTO_4716 ) ( CLEAR ?AUTO_4722 ) ( ON ?AUTO_4718 ?AUTO_4715 ) ( CLEAR ?AUTO_4717 ) ( ON ?AUTO_4724 ?AUTO_4718 ) ( ON ?AUTO_4719 ?AUTO_4724 ) ( CLEAR ?AUTO_4719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4719 ?AUTO_4724 )
      ( MAKE-ON ?AUTO_4715 ?AUTO_4716 )
      ( MAKE-ON-VERIFY ?AUTO_4715 ?AUTO_4716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4727 - BLOCK
      ?AUTO_4728 - BLOCK
    )
    :vars
    (
      ?AUTO_4736 - BLOCK
      ?AUTO_4730 - BLOCK
      ?AUTO_4732 - BLOCK
      ?AUTO_4731 - BLOCK
      ?AUTO_4733 - BLOCK
      ?AUTO_4735 - BLOCK
      ?AUTO_4737 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4727 ?AUTO_4736 ) ( ON ?AUTO_4730 ?AUTO_4728 ) ( CLEAR ?AUTO_4730 ) ( ON ?AUTO_4732 ?AUTO_4727 ) ( CLEAR ?AUTO_4731 ) ( ON ?AUTO_4733 ?AUTO_4732 ) ( ON ?AUTO_4735 ?AUTO_4733 ) ( CLEAR ?AUTO_4735 ) ( HOLDING ?AUTO_4737 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4737 )
      ( MAKE-ON ?AUTO_4727 ?AUTO_4728 )
      ( MAKE-ON-VERIFY ?AUTO_4727 ?AUTO_4728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4738 - BLOCK
      ?AUTO_4739 - BLOCK
    )
    :vars
    (
      ?AUTO_4740 - BLOCK
      ?AUTO_4746 - BLOCK
      ?AUTO_4747 - BLOCK
      ?AUTO_4748 - BLOCK
      ?AUTO_4742 - BLOCK
      ?AUTO_4741 - BLOCK
      ?AUTO_4743 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4738 ?AUTO_4740 ) ( ON ?AUTO_4746 ?AUTO_4739 ) ( ON ?AUTO_4747 ?AUTO_4738 ) ( CLEAR ?AUTO_4748 ) ( ON ?AUTO_4742 ?AUTO_4747 ) ( ON ?AUTO_4741 ?AUTO_4742 ) ( CLEAR ?AUTO_4741 ) ( ON ?AUTO_4743 ?AUTO_4746 ) ( CLEAR ?AUTO_4743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4743 ?AUTO_4746 )
      ( MAKE-ON ?AUTO_4738 ?AUTO_4739 )
      ( MAKE-ON-VERIFY ?AUTO_4738 ?AUTO_4739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4751 - BLOCK
      ?AUTO_4752 - BLOCK
    )
    :vars
    (
      ?AUTO_4755 - BLOCK
      ?AUTO_4757 - BLOCK
      ?AUTO_4753 - BLOCK
      ?AUTO_4760 - BLOCK
      ?AUTO_4761 - BLOCK
      ?AUTO_4756 - BLOCK
      ?AUTO_4758 - BLOCK
      ?AUTO_4762 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4751 ?AUTO_4755 ) ( ON ?AUTO_4757 ?AUTO_4752 ) ( ON ?AUTO_4753 ?AUTO_4751 ) ( CLEAR ?AUTO_4760 ) ( ON ?AUTO_4761 ?AUTO_4753 ) ( ON ?AUTO_4756 ?AUTO_4761 ) ( CLEAR ?AUTO_4756 ) ( ON ?AUTO_4758 ?AUTO_4757 ) ( CLEAR ?AUTO_4758 ) ( HOLDING ?AUTO_4762 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4762 )
      ( MAKE-ON ?AUTO_4751 ?AUTO_4752 )
      ( MAKE-ON-VERIFY ?AUTO_4751 ?AUTO_4752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4763 - BLOCK
      ?AUTO_4764 - BLOCK
    )
    :vars
    (
      ?AUTO_4774 - BLOCK
      ?AUTO_4769 - BLOCK
      ?AUTO_4768 - BLOCK
      ?AUTO_4766 - BLOCK
      ?AUTO_4773 - BLOCK
      ?AUTO_4767 - BLOCK
      ?AUTO_4765 - BLOCK
      ?AUTO_4770 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4763 ?AUTO_4774 ) ( ON ?AUTO_4769 ?AUTO_4764 ) ( ON ?AUTO_4768 ?AUTO_4763 ) ( CLEAR ?AUTO_4766 ) ( ON ?AUTO_4773 ?AUTO_4768 ) ( ON ?AUTO_4767 ?AUTO_4773 ) ( CLEAR ?AUTO_4767 ) ( ON ?AUTO_4765 ?AUTO_4769 ) ( ON ?AUTO_4770 ?AUTO_4765 ) ( CLEAR ?AUTO_4770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4770 ?AUTO_4765 )
      ( MAKE-ON ?AUTO_4763 ?AUTO_4764 )
      ( MAKE-ON-VERIFY ?AUTO_4763 ?AUTO_4764 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4776 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4776 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4776 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4776 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4778 - BLOCK
    )
    :vars
    (
      ?AUTO_4781 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4778 ?AUTO_4781 ) ( CLEAR ?AUTO_4778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4778 ?AUTO_4781 )
      ( MAKE-ON-TABLE ?AUTO_4778 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4778 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4783 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4783 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4783 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4783 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4785 - BLOCK
    )
    :vars
    (
      ?AUTO_4788 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4785 ?AUTO_4788 ) ( CLEAR ?AUTO_4785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4785 ?AUTO_4788 )
      ( MAKE-ON-TABLE ?AUTO_4785 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4785 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4789 - BLOCK
    )
    :vars
    (
      ?AUTO_4791 - BLOCK
      ?AUTO_4792 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4789 ?AUTO_4791 ) ( CLEAR ?AUTO_4789 ) ( HOLDING ?AUTO_4792 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4792 )
      ( MAKE-ON-TABLE ?AUTO_4789 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4789 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4793 - BLOCK
    )
    :vars
    (
      ?AUTO_4795 - BLOCK
      ?AUTO_4796 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4793 ?AUTO_4795 ) ( ON ?AUTO_4796 ?AUTO_4793 ) ( CLEAR ?AUTO_4796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4796 ?AUTO_4793 )
      ( MAKE-ON-TABLE ?AUTO_4793 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4793 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4800 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4800 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4800 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4800 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4802 - BLOCK
    )
    :vars
    (
      ?AUTO_4805 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4802 ?AUTO_4805 ) ( CLEAR ?AUTO_4802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4802 ?AUTO_4805 )
      ( MAKE-ON-TABLE ?AUTO_4802 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4802 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4806 - BLOCK
    )
    :vars
    (
      ?AUTO_4808 - BLOCK
      ?AUTO_4809 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4806 ?AUTO_4808 ) ( CLEAR ?AUTO_4806 ) ( HOLDING ?AUTO_4809 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4809 )
      ( MAKE-ON-TABLE ?AUTO_4806 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4806 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4810 - BLOCK
    )
    :vars
    (
      ?AUTO_4812 - BLOCK
      ?AUTO_4813 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4810 ?AUTO_4812 ) ( ON ?AUTO_4813 ?AUTO_4810 ) ( CLEAR ?AUTO_4813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4813 ?AUTO_4810 )
      ( MAKE-ON-TABLE ?AUTO_4810 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4810 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4816 - BLOCK
    )
    :vars
    (
      ?AUTO_4817 - BLOCK
      ?AUTO_4818 - BLOCK
      ?AUTO_4820 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4816 ?AUTO_4817 ) ( ON ?AUTO_4818 ?AUTO_4816 ) ( CLEAR ?AUTO_4818 ) ( HOLDING ?AUTO_4820 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4820 )
      ( MAKE-ON-TABLE ?AUTO_4816 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4816 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4821 - BLOCK
    )
    :vars
    (
      ?AUTO_4823 - BLOCK
      ?AUTO_4824 - BLOCK
      ?AUTO_4825 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4821 ?AUTO_4823 ) ( ON ?AUTO_4824 ?AUTO_4821 ) ( ON ?AUTO_4825 ?AUTO_4824 ) ( CLEAR ?AUTO_4825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4825 ?AUTO_4824 )
      ( MAKE-ON-TABLE ?AUTO_4821 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4830 - BLOCK
      ?AUTO_4831 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4830 ) ( CLEAR ?AUTO_4831 ) )
    :subtasks
    ( ( !STACK ?AUTO_4830 ?AUTO_4831 )
      ( MAKE-ON-VERIFY ?AUTO_4830 ?AUTO_4831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4834 - BLOCK
      ?AUTO_4835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4835 ) ( ON-TABLE ?AUTO_4834 ) ( CLEAR ?AUTO_4834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4834 )
      ( MAKE-ON ?AUTO_4834 ?AUTO_4835 )
      ( MAKE-ON-VERIFY ?AUTO_4834 ?AUTO_4835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4839 - BLOCK
      ?AUTO_4840 - BLOCK
    )
    :vars
    (
      ?AUTO_4843 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4840 ) ( ON-TABLE ?AUTO_4839 ) ( CLEAR ?AUTO_4839 ) ( HOLDING ?AUTO_4843 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4843 )
      ( MAKE-ON ?AUTO_4839 ?AUTO_4840 )
      ( MAKE-ON-VERIFY ?AUTO_4839 ?AUTO_4840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4844 - BLOCK
      ?AUTO_4845 - BLOCK
    )
    :vars
    (
      ?AUTO_4848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4844 ) ( CLEAR ?AUTO_4844 ) ( ON ?AUTO_4848 ?AUTO_4845 ) ( CLEAR ?AUTO_4848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4848 ?AUTO_4845 )
      ( MAKE-ON ?AUTO_4844 ?AUTO_4845 )
      ( MAKE-ON-VERIFY ?AUTO_4844 ?AUTO_4845 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4851 - BLOCK
      ?AUTO_4852 - BLOCK
    )
    :vars
    (
      ?AUTO_4854 - BLOCK
      ?AUTO_4856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4851 ) ( CLEAR ?AUTO_4851 ) ( ON ?AUTO_4854 ?AUTO_4852 ) ( CLEAR ?AUTO_4854 ) ( HOLDING ?AUTO_4856 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4856 )
      ( MAKE-ON ?AUTO_4851 ?AUTO_4852 )
      ( MAKE-ON-VERIFY ?AUTO_4851 ?AUTO_4852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4857 - BLOCK
      ?AUTO_4858 - BLOCK
    )
    :vars
    (
      ?AUTO_4859 - BLOCK
      ?AUTO_4862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4857 ) ( CLEAR ?AUTO_4857 ) ( ON ?AUTO_4859 ?AUTO_4858 ) ( ON ?AUTO_4862 ?AUTO_4859 ) ( CLEAR ?AUTO_4862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4862 ?AUTO_4859 )
      ( MAKE-ON ?AUTO_4857 ?AUTO_4858 )
      ( MAKE-ON-VERIFY ?AUTO_4857 ?AUTO_4858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4865 - BLOCK
      ?AUTO_4866 - BLOCK
    )
    :vars
    (
      ?AUTO_4867 - BLOCK
      ?AUTO_4870 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4867 ?AUTO_4866 ) ( ON ?AUTO_4870 ?AUTO_4867 ) ( CLEAR ?AUTO_4870 ) ( HOLDING ?AUTO_4865 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4865 )
      ( MAKE-ON ?AUTO_4865 ?AUTO_4866 )
      ( MAKE-ON-VERIFY ?AUTO_4865 ?AUTO_4866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4872 - BLOCK
      ?AUTO_4873 - BLOCK
    )
    :vars
    (
      ?AUTO_4874 - BLOCK
      ?AUTO_4877 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4874 ?AUTO_4873 ) ( ON ?AUTO_4877 ?AUTO_4874 ) ( ON ?AUTO_4872 ?AUTO_4877 ) ( CLEAR ?AUTO_4872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4872 ?AUTO_4877 )
      ( MAKE-ON ?AUTO_4872 ?AUTO_4873 )
      ( MAKE-ON-VERIFY ?AUTO_4872 ?AUTO_4873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4882 - BLOCK
      ?AUTO_4883 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4882 ) ( CLEAR ?AUTO_4883 ) )
    :subtasks
    ( ( !STACK ?AUTO_4882 ?AUTO_4883 )
      ( MAKE-ON-VERIFY ?AUTO_4882 ?AUTO_4883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4886 - BLOCK
      ?AUTO_4887 - BLOCK
    )
    :vars
    (
      ?AUTO_4891 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4887 ) ( ON ?AUTO_4886 ?AUTO_4891 ) ( CLEAR ?AUTO_4886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4886 ?AUTO_4891 )
      ( MAKE-ON ?AUTO_4886 ?AUTO_4887 )
      ( MAKE-ON-VERIFY ?AUTO_4886 ?AUTO_4887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4892 - BLOCK
      ?AUTO_4893 - BLOCK
    )
    :vars
    (
      ?AUTO_4896 - BLOCK
      ?AUTO_4897 - BLOCK
      ?AUTO_4898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4893 ) ( ON ?AUTO_4892 ?AUTO_4896 ) ( CLEAR ?AUTO_4892 ) ( HOLDING ?AUTO_4897 ) ( CLEAR ?AUTO_4898 ) )
    :subtasks
    ( ( !STACK ?AUTO_4897 ?AUTO_4898 )
      ( MAKE-ON ?AUTO_4892 ?AUTO_4893 )
      ( MAKE-ON-VERIFY ?AUTO_4892 ?AUTO_4893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4901 - BLOCK
      ?AUTO_4902 - BLOCK
    )
    :vars
    (
      ?AUTO_4905 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4901 ?AUTO_4905 ) ( CLEAR ?AUTO_4901 ) ( HOLDING ?AUTO_4902 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4902 )
      ( MAKE-ON ?AUTO_4901 ?AUTO_4902 )
      ( MAKE-ON-VERIFY ?AUTO_4901 ?AUTO_4902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4911 - BLOCK
      ?AUTO_4912 - BLOCK
    )
    :vars
    (
      ?AUTO_4913 - BLOCK
      ?AUTO_4916 - BLOCK
      ?AUTO_4917 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4911 ?AUTO_4913 ) ( CLEAR ?AUTO_4911 ) ( CLEAR ?AUTO_4916 ) ( ON ?AUTO_4917 ?AUTO_4912 ) ( CLEAR ?AUTO_4917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4917 ?AUTO_4912 )
      ( MAKE-ON ?AUTO_4911 ?AUTO_4912 )
      ( MAKE-ON-VERIFY ?AUTO_4911 ?AUTO_4912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4920 - BLOCK
      ?AUTO_4921 - BLOCK
    )
    :vars
    (
      ?AUTO_4924 - BLOCK
      ?AUTO_4926 - BLOCK
      ?AUTO_4925 - BLOCK
      ?AUTO_4927 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4920 ?AUTO_4924 ) ( CLEAR ?AUTO_4920 ) ( CLEAR ?AUTO_4926 ) ( ON ?AUTO_4925 ?AUTO_4921 ) ( CLEAR ?AUTO_4925 ) ( HOLDING ?AUTO_4927 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4927 )
      ( MAKE-ON ?AUTO_4920 ?AUTO_4921 )
      ( MAKE-ON-VERIFY ?AUTO_4920 ?AUTO_4921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4928 - BLOCK
      ?AUTO_4929 - BLOCK
    )
    :vars
    (
      ?AUTO_4934 - BLOCK
      ?AUTO_4930 - BLOCK
      ?AUTO_4935 - BLOCK
      ?AUTO_4933 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4928 ?AUTO_4934 ) ( CLEAR ?AUTO_4928 ) ( CLEAR ?AUTO_4930 ) ( ON ?AUTO_4935 ?AUTO_4929 ) ( ON ?AUTO_4933 ?AUTO_4935 ) ( CLEAR ?AUTO_4933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4933 ?AUTO_4935 )
      ( MAKE-ON ?AUTO_4928 ?AUTO_4929 )
      ( MAKE-ON-VERIFY ?AUTO_4928 ?AUTO_4929 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4939 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4939 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4939 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4939 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4941 - BLOCK
    )
    :vars
    (
      ?AUTO_4944 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4941 ?AUTO_4944 ) ( CLEAR ?AUTO_4941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4941 ?AUTO_4944 )
      ( MAKE-ON-TABLE ?AUTO_4941 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4941 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4945 - BLOCK
    )
    :vars
    (
      ?AUTO_4947 - BLOCK
      ?AUTO_4948 - BLOCK
      ?AUTO_4949 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4945 ?AUTO_4947 ) ( CLEAR ?AUTO_4945 ) ( HOLDING ?AUTO_4948 ) ( CLEAR ?AUTO_4949 ) )
    :subtasks
    ( ( !STACK ?AUTO_4948 ?AUTO_4949 )
      ( MAKE-ON-TABLE ?AUTO_4945 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4945 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4950 - BLOCK
    )
    :vars
    (
      ?AUTO_4952 - BLOCK
      ?AUTO_4954 - BLOCK
      ?AUTO_4953 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4950 ?AUTO_4952 ) ( CLEAR ?AUTO_4954 ) ( ON ?AUTO_4953 ?AUTO_4950 ) ( CLEAR ?AUTO_4953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4953 ?AUTO_4950 )
      ( MAKE-ON-TABLE ?AUTO_4950 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4950 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4957 - BLOCK
    )
    :vars
    (
      ?AUTO_4960 - BLOCK
      ?AUTO_4958 - BLOCK
      ?AUTO_4961 - BLOCK
      ?AUTO_4962 - BLOCK
      ?AUTO_4963 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4957 ?AUTO_4960 ) ( CLEAR ?AUTO_4958 ) ( ON ?AUTO_4961 ?AUTO_4957 ) ( CLEAR ?AUTO_4961 ) ( HOLDING ?AUTO_4962 ) ( CLEAR ?AUTO_4963 ) )
    :subtasks
    ( ( !STACK ?AUTO_4962 ?AUTO_4963 )
      ( MAKE-ON-TABLE ?AUTO_4957 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4973 - BLOCK
      ?AUTO_4974 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4973 ) ( CLEAR ?AUTO_4974 ) )
    :subtasks
    ( ( !STACK ?AUTO_4973 ?AUTO_4974 )
      ( MAKE-ON-VERIFY ?AUTO_4973 ?AUTO_4974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4977 - BLOCK
      ?AUTO_4978 - BLOCK
    )
    :vars
    (
      ?AUTO_4982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4978 ) ( ON ?AUTO_4977 ?AUTO_4982 ) ( CLEAR ?AUTO_4977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4977 ?AUTO_4982 )
      ( MAKE-ON ?AUTO_4977 ?AUTO_4978 )
      ( MAKE-ON-VERIFY ?AUTO_4977 ?AUTO_4978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4983 - BLOCK
      ?AUTO_4984 - BLOCK
    )
    :vars
    (
      ?AUTO_4987 - BLOCK
      ?AUTO_4988 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4984 ) ( ON ?AUTO_4983 ?AUTO_4987 ) ( CLEAR ?AUTO_4983 ) ( HOLDING ?AUTO_4988 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4988 )
      ( MAKE-ON ?AUTO_4983 ?AUTO_4984 )
      ( MAKE-ON-VERIFY ?AUTO_4983 ?AUTO_4984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4989 - BLOCK
      ?AUTO_4990 - BLOCK
    )
    :vars
    (
      ?AUTO_4993 - BLOCK
      ?AUTO_4994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4990 ) ( ON ?AUTO_4989 ?AUTO_4993 ) ( ON ?AUTO_4994 ?AUTO_4989 ) ( CLEAR ?AUTO_4994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4994 ?AUTO_4989 )
      ( MAKE-ON ?AUTO_4989 ?AUTO_4990 )
      ( MAKE-ON-VERIFY ?AUTO_4989 ?AUTO_4990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4997 - BLOCK
      ?AUTO_4998 - BLOCK
    )
    :vars
    (
      ?AUTO_5002 - BLOCK
      ?AUTO_4999 - BLOCK
      ?AUTO_5004 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4997 ?AUTO_5002 ) ( ON ?AUTO_4999 ?AUTO_4997 ) ( CLEAR ?AUTO_4999 ) ( HOLDING ?AUTO_4998 ) ( CLEAR ?AUTO_5004 ) )
    :subtasks
    ( ( !STACK ?AUTO_4998 ?AUTO_5004 )
      ( MAKE-ON ?AUTO_4997 ?AUTO_4998 )
      ( MAKE-ON-VERIFY ?AUTO_4997 ?AUTO_4998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5005 - BLOCK
      ?AUTO_5006 - BLOCK
    )
    :vars
    (
      ?AUTO_5011 - BLOCK
      ?AUTO_5008 - BLOCK
      ?AUTO_5007 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5005 ?AUTO_5011 ) ( ON ?AUTO_5008 ?AUTO_5005 ) ( CLEAR ?AUTO_5007 ) ( ON ?AUTO_5006 ?AUTO_5008 ) ( CLEAR ?AUTO_5006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5006 ?AUTO_5008 )
      ( MAKE-ON ?AUTO_5005 ?AUTO_5006 )
      ( MAKE-ON-VERIFY ?AUTO_5005 ?AUTO_5006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5014 - BLOCK
      ?AUTO_5015 - BLOCK
    )
    :vars
    (
      ?AUTO_5020 - BLOCK
      ?AUTO_5018 - BLOCK
      ?AUTO_5019 - BLOCK
      ?AUTO_5021 - BLOCK
      ?AUTO_5022 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5014 ?AUTO_5020 ) ( ON ?AUTO_5018 ?AUTO_5014 ) ( CLEAR ?AUTO_5019 ) ( ON ?AUTO_5015 ?AUTO_5018 ) ( CLEAR ?AUTO_5015 ) ( HOLDING ?AUTO_5021 ) ( CLEAR ?AUTO_5022 ) )
    :subtasks
    ( ( !STACK ?AUTO_5021 ?AUTO_5022 )
      ( MAKE-ON ?AUTO_5014 ?AUTO_5015 )
      ( MAKE-ON-VERIFY ?AUTO_5014 ?AUTO_5015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5039 - BLOCK
      ?AUTO_5040 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5039 ) ( CLEAR ?AUTO_5040 ) )
    :subtasks
    ( ( !STACK ?AUTO_5039 ?AUTO_5040 )
      ( MAKE-ON-VERIFY ?AUTO_5039 ?AUTO_5040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5043 - BLOCK
      ?AUTO_5044 - BLOCK
    )
    :vars
    (
      ?AUTO_5048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5044 ) ( ON ?AUTO_5043 ?AUTO_5048 ) ( CLEAR ?AUTO_5043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5043 ?AUTO_5048 )
      ( MAKE-ON ?AUTO_5043 ?AUTO_5044 )
      ( MAKE-ON-VERIFY ?AUTO_5043 ?AUTO_5044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5049 - BLOCK
      ?AUTO_5050 - BLOCK
    )
    :vars
    (
      ?AUTO_5053 - BLOCK
      ?AUTO_5054 - BLOCK
      ?AUTO_5055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5050 ) ( ON ?AUTO_5049 ?AUTO_5053 ) ( CLEAR ?AUTO_5049 ) ( HOLDING ?AUTO_5054 ) ( CLEAR ?AUTO_5055 ) )
    :subtasks
    ( ( !STACK ?AUTO_5054 ?AUTO_5055 )
      ( MAKE-ON ?AUTO_5049 ?AUTO_5050 )
      ( MAKE-ON-VERIFY ?AUTO_5049 ?AUTO_5050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5056 - BLOCK
      ?AUTO_5057 - BLOCK
    )
    :vars
    (
      ?AUTO_5060 - BLOCK
      ?AUTO_5062 - BLOCK
      ?AUTO_5061 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5057 ) ( ON ?AUTO_5056 ?AUTO_5060 ) ( CLEAR ?AUTO_5062 ) ( ON ?AUTO_5061 ?AUTO_5056 ) ( CLEAR ?AUTO_5061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5061 ?AUTO_5056 )
      ( MAKE-ON ?AUTO_5056 ?AUTO_5057 )
      ( MAKE-ON-VERIFY ?AUTO_5056 ?AUTO_5057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5065 - BLOCK
      ?AUTO_5066 - BLOCK
    )
    :vars
    (
      ?AUTO_5071 - BLOCK
      ?AUTO_5068 - BLOCK
      ?AUTO_5067 - BLOCK
      ?AUTO_5072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5066 ) ( ON ?AUTO_5065 ?AUTO_5071 ) ( CLEAR ?AUTO_5068 ) ( ON ?AUTO_5067 ?AUTO_5065 ) ( CLEAR ?AUTO_5067 ) ( HOLDING ?AUTO_5072 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5072 )
      ( MAKE-ON ?AUTO_5065 ?AUTO_5066 )
      ( MAKE-ON-VERIFY ?AUTO_5065 ?AUTO_5066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5073 - BLOCK
      ?AUTO_5074 - BLOCK
    )
    :vars
    (
      ?AUTO_5080 - BLOCK
      ?AUTO_5077 - BLOCK
      ?AUTO_5075 - BLOCK
      ?AUTO_5079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5074 ) ( ON ?AUTO_5073 ?AUTO_5080 ) ( CLEAR ?AUTO_5077 ) ( ON ?AUTO_5075 ?AUTO_5073 ) ( ON ?AUTO_5079 ?AUTO_5075 ) ( CLEAR ?AUTO_5079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5079 ?AUTO_5075 )
      ( MAKE-ON ?AUTO_5073 ?AUTO_5074 )
      ( MAKE-ON-VERIFY ?AUTO_5073 ?AUTO_5074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5083 - BLOCK
      ?AUTO_5084 - BLOCK
    )
    :vars
    (
      ?AUTO_5086 - BLOCK
      ?AUTO_5088 - BLOCK
      ?AUTO_5089 - BLOCK
      ?AUTO_5090 - BLOCK
      ?AUTO_5092 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5084 ) ( ON ?AUTO_5083 ?AUTO_5086 ) ( ON ?AUTO_5088 ?AUTO_5083 ) ( ON ?AUTO_5089 ?AUTO_5088 ) ( CLEAR ?AUTO_5089 ) ( HOLDING ?AUTO_5090 ) ( CLEAR ?AUTO_5092 ) )
    :subtasks
    ( ( !STACK ?AUTO_5090 ?AUTO_5092 )
      ( MAKE-ON ?AUTO_5083 ?AUTO_5084 )
      ( MAKE-ON-VERIFY ?AUTO_5083 ?AUTO_5084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5093 - BLOCK
      ?AUTO_5094 - BLOCK
    )
    :vars
    (
      ?AUTO_5100 - BLOCK
      ?AUTO_5096 - BLOCK
      ?AUTO_5101 - BLOCK
      ?AUTO_5097 - BLOCK
      ?AUTO_5095 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5094 ) ( ON ?AUTO_5093 ?AUTO_5100 ) ( ON ?AUTO_5096 ?AUTO_5093 ) ( ON ?AUTO_5101 ?AUTO_5096 ) ( CLEAR ?AUTO_5097 ) ( ON ?AUTO_5095 ?AUTO_5101 ) ( CLEAR ?AUTO_5095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5095 ?AUTO_5101 )
      ( MAKE-ON ?AUTO_5093 ?AUTO_5094 )
      ( MAKE-ON-VERIFY ?AUTO_5093 ?AUTO_5094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5104 - BLOCK
      ?AUTO_5105 - BLOCK
    )
    :vars
    (
      ?AUTO_5108 - BLOCK
      ?AUTO_5107 - BLOCK
      ?AUTO_5110 - BLOCK
      ?AUTO_5112 - BLOCK
      ?AUTO_5106 - BLOCK
      ?AUTO_5114 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5104 ?AUTO_5108 ) ( ON ?AUTO_5107 ?AUTO_5104 ) ( ON ?AUTO_5110 ?AUTO_5107 ) ( CLEAR ?AUTO_5112 ) ( ON ?AUTO_5106 ?AUTO_5110 ) ( CLEAR ?AUTO_5106 ) ( HOLDING ?AUTO_5105 ) ( CLEAR ?AUTO_5114 ) )
    :subtasks
    ( ( !STACK ?AUTO_5105 ?AUTO_5114 )
      ( MAKE-ON ?AUTO_5104 ?AUTO_5105 )
      ( MAKE-ON-VERIFY ?AUTO_5104 ?AUTO_5105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5117 - BLOCK
      ?AUTO_5118 - BLOCK
    )
    :vars
    (
      ?AUTO_5119 - BLOCK
      ?AUTO_5124 - BLOCK
      ?AUTO_5123 - BLOCK
      ?AUTO_5125 - BLOCK
      ?AUTO_5121 - BLOCK
      ?AUTO_5126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5118 ) ( ON ?AUTO_5117 ?AUTO_5119 ) ( ON ?AUTO_5124 ?AUTO_5117 ) ( ON ?AUTO_5123 ?AUTO_5124 ) ( CLEAR ?AUTO_5125 ) ( ON ?AUTO_5121 ?AUTO_5123 ) ( CLEAR ?AUTO_5121 ) ( HOLDING ?AUTO_5126 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5126 )
      ( MAKE-ON ?AUTO_5117 ?AUTO_5118 )
      ( MAKE-ON-VERIFY ?AUTO_5117 ?AUTO_5118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5139 - BLOCK
      ?AUTO_5140 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5139 ) ( CLEAR ?AUTO_5140 ) )
    :subtasks
    ( ( !STACK ?AUTO_5139 ?AUTO_5140 )
      ( MAKE-ON-VERIFY ?AUTO_5139 ?AUTO_5140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5143 - BLOCK
      ?AUTO_5144 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5144 ) ( ON-TABLE ?AUTO_5143 ) ( CLEAR ?AUTO_5143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5143 )
      ( MAKE-ON ?AUTO_5143 ?AUTO_5144 )
      ( MAKE-ON-VERIFY ?AUTO_5143 ?AUTO_5144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5148 - BLOCK
      ?AUTO_5149 - BLOCK
    )
    :vars
    (
      ?AUTO_5152 - BLOCK
      ?AUTO_5153 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5149 ) ( ON-TABLE ?AUTO_5148 ) ( CLEAR ?AUTO_5148 ) ( HOLDING ?AUTO_5152 ) ( CLEAR ?AUTO_5153 ) )
    :subtasks
    ( ( !STACK ?AUTO_5152 ?AUTO_5153 )
      ( MAKE-ON ?AUTO_5148 ?AUTO_5149 )
      ( MAKE-ON-VERIFY ?AUTO_5148 ?AUTO_5149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5154 - BLOCK
      ?AUTO_5155 - BLOCK
    )
    :vars
    (
      ?AUTO_5159 - BLOCK
      ?AUTO_5158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5154 ) ( CLEAR ?AUTO_5154 ) ( CLEAR ?AUTO_5159 ) ( ON ?AUTO_5158 ?AUTO_5155 ) ( CLEAR ?AUTO_5158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5158 ?AUTO_5155 )
      ( MAKE-ON ?AUTO_5154 ?AUTO_5155 )
      ( MAKE-ON-VERIFY ?AUTO_5154 ?AUTO_5155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5162 - BLOCK
      ?AUTO_5163 - BLOCK
    )
    :vars
    (
      ?AUTO_5164 - BLOCK
      ?AUTO_5165 - BLOCK
      ?AUTO_5168 - BLOCK
      ?AUTO_5169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5162 ) ( CLEAR ?AUTO_5162 ) ( CLEAR ?AUTO_5164 ) ( ON ?AUTO_5165 ?AUTO_5163 ) ( CLEAR ?AUTO_5165 ) ( HOLDING ?AUTO_5168 ) ( CLEAR ?AUTO_5169 ) )
    :subtasks
    ( ( !STACK ?AUTO_5168 ?AUTO_5169 )
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
      ?AUTO_5174 - BLOCK
      ?AUTO_5173 - BLOCK
      ?AUTO_5177 - BLOCK
      ?AUTO_5176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5170 ) ( CLEAR ?AUTO_5170 ) ( CLEAR ?AUTO_5174 ) ( ON ?AUTO_5173 ?AUTO_5171 ) ( CLEAR ?AUTO_5177 ) ( ON ?AUTO_5176 ?AUTO_5173 ) ( CLEAR ?AUTO_5176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5176 ?AUTO_5173 )
      ( MAKE-ON ?AUTO_5170 ?AUTO_5171 )
      ( MAKE-ON-VERIFY ?AUTO_5170 ?AUTO_5171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5180 - BLOCK
      ?AUTO_5181 - BLOCK
    )
    :vars
    (
      ?AUTO_5187 - BLOCK
      ?AUTO_5184 - BLOCK
      ?AUTO_5186 - BLOCK
      ?AUTO_5185 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5187 ) ( ON ?AUTO_5184 ?AUTO_5181 ) ( CLEAR ?AUTO_5186 ) ( ON ?AUTO_5185 ?AUTO_5184 ) ( CLEAR ?AUTO_5185 ) ( HOLDING ?AUTO_5180 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5180 )
      ( MAKE-ON ?AUTO_5180 ?AUTO_5181 )
      ( MAKE-ON-VERIFY ?AUTO_5180 ?AUTO_5181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5189 - BLOCK
      ?AUTO_5190 - BLOCK
    )
    :vars
    (
      ?AUTO_5193 - BLOCK
      ?AUTO_5191 - BLOCK
      ?AUTO_5192 - BLOCK
      ?AUTO_5196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5193 ) ( ON ?AUTO_5191 ?AUTO_5190 ) ( CLEAR ?AUTO_5192 ) ( ON ?AUTO_5196 ?AUTO_5191 ) ( ON ?AUTO_5189 ?AUTO_5196 ) ( CLEAR ?AUTO_5189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5189 ?AUTO_5196 )
      ( MAKE-ON ?AUTO_5189 ?AUTO_5190 )
      ( MAKE-ON-VERIFY ?AUTO_5189 ?AUTO_5190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5199 - BLOCK
      ?AUTO_5200 - BLOCK
    )
    :vars
    (
      ?AUTO_5203 - BLOCK
      ?AUTO_5205 - BLOCK
      ?AUTO_5204 - BLOCK
      ?AUTO_5206 - BLOCK
      ?AUTO_5208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5203 ) ( ON ?AUTO_5205 ?AUTO_5200 ) ( ON ?AUTO_5204 ?AUTO_5205 ) ( ON ?AUTO_5199 ?AUTO_5204 ) ( CLEAR ?AUTO_5199 ) ( HOLDING ?AUTO_5206 ) ( CLEAR ?AUTO_5208 ) )
    :subtasks
    ( ( !STACK ?AUTO_5206 ?AUTO_5208 )
      ( MAKE-ON ?AUTO_5199 ?AUTO_5200 )
      ( MAKE-ON-VERIFY ?AUTO_5199 ?AUTO_5200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5209 - BLOCK
      ?AUTO_5210 - BLOCK
    )
    :vars
    (
      ?AUTO_5217 - BLOCK
      ?AUTO_5216 - BLOCK
      ?AUTO_5215 - BLOCK
      ?AUTO_5211 - BLOCK
      ?AUTO_5214 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5217 ) ( ON ?AUTO_5216 ?AUTO_5210 ) ( ON ?AUTO_5215 ?AUTO_5216 ) ( ON ?AUTO_5209 ?AUTO_5215 ) ( CLEAR ?AUTO_5211 ) ( ON ?AUTO_5214 ?AUTO_5209 ) ( CLEAR ?AUTO_5214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5214 ?AUTO_5209 )
      ( MAKE-ON ?AUTO_5209 ?AUTO_5210 )
      ( MAKE-ON-VERIFY ?AUTO_5209 ?AUTO_5210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5220 - BLOCK
      ?AUTO_5221 - BLOCK
    )
    :vars
    (
      ?AUTO_5227 - BLOCK
      ?AUTO_5224 - BLOCK
      ?AUTO_5225 - BLOCK
      ?AUTO_5226 - BLOCK
      ?AUTO_5228 - BLOCK
      ?AUTO_5230 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5227 ?AUTO_5221 ) ( ON ?AUTO_5224 ?AUTO_5227 ) ( ON ?AUTO_5220 ?AUTO_5224 ) ( CLEAR ?AUTO_5225 ) ( ON ?AUTO_5226 ?AUTO_5220 ) ( CLEAR ?AUTO_5226 ) ( HOLDING ?AUTO_5228 ) ( CLEAR ?AUTO_5230 ) )
    :subtasks
    ( ( !STACK ?AUTO_5228 ?AUTO_5230 )
      ( MAKE-ON ?AUTO_5220 ?AUTO_5221 )
      ( MAKE-ON-VERIFY ?AUTO_5220 ?AUTO_5221 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5246 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5246 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5246 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5246 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5248 - BLOCK
    )
    :vars
    (
      ?AUTO_5251 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5248 ?AUTO_5251 ) ( CLEAR ?AUTO_5248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5248 ?AUTO_5251 )
      ( MAKE-ON-TABLE ?AUTO_5248 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5248 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5252 - BLOCK
    )
    :vars
    (
      ?AUTO_5254 - BLOCK
      ?AUTO_5255 - BLOCK
      ?AUTO_5256 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5252 ?AUTO_5254 ) ( CLEAR ?AUTO_5252 ) ( HOLDING ?AUTO_5255 ) ( CLEAR ?AUTO_5256 ) )
    :subtasks
    ( ( !STACK ?AUTO_5255 ?AUTO_5256 )
      ( MAKE-ON-TABLE ?AUTO_5252 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5252 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5263 - BLOCK
    )
    :vars
    (
      ?AUTO_5265 - BLOCK
      ?AUTO_5267 - BLOCK
      ?AUTO_5266 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5263 ?AUTO_5265 ) ( CLEAR ?AUTO_5267 ) ( ON ?AUTO_5266 ?AUTO_5263 ) ( CLEAR ?AUTO_5266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5266 ?AUTO_5263 )
      ( MAKE-ON-TABLE ?AUTO_5263 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5263 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5270 - BLOCK
    )
    :vars
    (
      ?AUTO_5272 - BLOCK
      ?AUTO_5273 - BLOCK
      ?AUTO_5274 - BLOCK
      ?AUTO_5275 - BLOCK
      ?AUTO_5276 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5270 ?AUTO_5272 ) ( CLEAR ?AUTO_5273 ) ( ON ?AUTO_5274 ?AUTO_5270 ) ( CLEAR ?AUTO_5274 ) ( HOLDING ?AUTO_5275 ) ( CLEAR ?AUTO_5276 ) )
    :subtasks
    ( ( !STACK ?AUTO_5275 ?AUTO_5276 )
      ( MAKE-ON-TABLE ?AUTO_5270 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5270 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5277 - BLOCK
    )
    :vars
    (
      ?AUTO_5279 - BLOCK
      ?AUTO_5282 - BLOCK
      ?AUTO_5278 - BLOCK
      ?AUTO_5283 - BLOCK
      ?AUTO_5281 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5277 ?AUTO_5279 ) ( CLEAR ?AUTO_5282 ) ( ON ?AUTO_5278 ?AUTO_5277 ) ( CLEAR ?AUTO_5283 ) ( ON ?AUTO_5281 ?AUTO_5278 ) ( CLEAR ?AUTO_5281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5281 ?AUTO_5278 )
      ( MAKE-ON-TABLE ?AUTO_5277 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5277 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5286 - BLOCK
    )
    :vars
    (
      ?AUTO_5289 - BLOCK
      ?AUTO_5292 - BLOCK
      ?AUTO_5288 - BLOCK
      ?AUTO_5287 - BLOCK
      ?AUTO_5291 - BLOCK
      ?AUTO_5293 - BLOCK
      ?AUTO_5294 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5286 ?AUTO_5289 ) ( CLEAR ?AUTO_5292 ) ( ON ?AUTO_5288 ?AUTO_5286 ) ( CLEAR ?AUTO_5287 ) ( ON ?AUTO_5291 ?AUTO_5288 ) ( CLEAR ?AUTO_5291 ) ( HOLDING ?AUTO_5293 ) ( CLEAR ?AUTO_5294 ) )
    :subtasks
    ( ( !STACK ?AUTO_5293 ?AUTO_5294 )
      ( MAKE-ON-TABLE ?AUTO_5286 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5304 - BLOCK
      ?AUTO_5305 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5304 ) ( CLEAR ?AUTO_5305 ) )
    :subtasks
    ( ( !STACK ?AUTO_5304 ?AUTO_5305 )
      ( MAKE-ON-VERIFY ?AUTO_5304 ?AUTO_5305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5308 - BLOCK
      ?AUTO_5309 - BLOCK
    )
    :vars
    (
      ?AUTO_5313 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5309 ) ( ON ?AUTO_5308 ?AUTO_5313 ) ( CLEAR ?AUTO_5308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5308 ?AUTO_5313 )
      ( MAKE-ON ?AUTO_5308 ?AUTO_5309 )
      ( MAKE-ON-VERIFY ?AUTO_5308 ?AUTO_5309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5314 - BLOCK
      ?AUTO_5315 - BLOCK
    )
    :vars
    (
      ?AUTO_5318 - BLOCK
      ?AUTO_5319 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5315 ) ( ON ?AUTO_5314 ?AUTO_5318 ) ( CLEAR ?AUTO_5314 ) ( HOLDING ?AUTO_5319 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5319 )
      ( MAKE-ON ?AUTO_5314 ?AUTO_5315 )
      ( MAKE-ON-VERIFY ?AUTO_5314 ?AUTO_5315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5320 - BLOCK
      ?AUTO_5321 - BLOCK
    )
    :vars
    (
      ?AUTO_5324 - BLOCK
      ?AUTO_5325 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5321 ) ( ON ?AUTO_5320 ?AUTO_5324 ) ( ON ?AUTO_5325 ?AUTO_5320 ) ( CLEAR ?AUTO_5325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5325 ?AUTO_5320 )
      ( MAKE-ON ?AUTO_5320 ?AUTO_5321 )
      ( MAKE-ON-VERIFY ?AUTO_5320 ?AUTO_5321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5328 - BLOCK
      ?AUTO_5329 - BLOCK
    )
    :vars
    (
      ?AUTO_5333 - BLOCK
      ?AUTO_5330 - BLOCK
      ?AUTO_5334 - BLOCK
      ?AUTO_5335 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5329 ) ( ON ?AUTO_5328 ?AUTO_5333 ) ( ON ?AUTO_5330 ?AUTO_5328 ) ( CLEAR ?AUTO_5330 ) ( HOLDING ?AUTO_5334 ) ( CLEAR ?AUTO_5335 ) )
    :subtasks
    ( ( !STACK ?AUTO_5334 ?AUTO_5335 )
      ( MAKE-ON ?AUTO_5328 ?AUTO_5329 )
      ( MAKE-ON-VERIFY ?AUTO_5328 ?AUTO_5329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5338 - BLOCK
      ?AUTO_5339 - BLOCK
    )
    :vars
    (
      ?AUTO_5343 - BLOCK
      ?AUTO_5340 - BLOCK
      ?AUTO_5345 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5338 ?AUTO_5343 ) ( ON ?AUTO_5340 ?AUTO_5338 ) ( CLEAR ?AUTO_5340 ) ( HOLDING ?AUTO_5339 ) ( CLEAR ?AUTO_5345 ) )
    :subtasks
    ( ( !STACK ?AUTO_5339 ?AUTO_5345 )
      ( MAKE-ON ?AUTO_5338 ?AUTO_5339 )
      ( MAKE-ON-VERIFY ?AUTO_5338 ?AUTO_5339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5350 - BLOCK
      ?AUTO_5351 - BLOCK
    )
    :vars
    (
      ?AUTO_5355 - BLOCK
      ?AUTO_5353 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5350 ?AUTO_5355 ) ( CLEAR ?AUTO_5350 ) ( ON ?AUTO_5353 ?AUTO_5351 ) ( CLEAR ?AUTO_5353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5353 ?AUTO_5351 )
      ( MAKE-ON ?AUTO_5350 ?AUTO_5351 )
      ( MAKE-ON-VERIFY ?AUTO_5350 ?AUTO_5351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5358 - BLOCK
      ?AUTO_5359 - BLOCK
    )
    :vars
    (
      ?AUTO_5363 - BLOCK
      ?AUTO_5362 - BLOCK
      ?AUTO_5364 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5358 ?AUTO_5363 ) ( CLEAR ?AUTO_5358 ) ( ON ?AUTO_5362 ?AUTO_5359 ) ( CLEAR ?AUTO_5362 ) ( HOLDING ?AUTO_5364 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5364 )
      ( MAKE-ON ?AUTO_5358 ?AUTO_5359 )
      ( MAKE-ON-VERIFY ?AUTO_5358 ?AUTO_5359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5365 - BLOCK
      ?AUTO_5366 - BLOCK
    )
    :vars
    (
      ?AUTO_5369 - BLOCK
      ?AUTO_5370 - BLOCK
      ?AUTO_5371 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5365 ?AUTO_5369 ) ( CLEAR ?AUTO_5365 ) ( ON ?AUTO_5370 ?AUTO_5366 ) ( ON ?AUTO_5371 ?AUTO_5370 ) ( CLEAR ?AUTO_5371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5371 ?AUTO_5370 )
      ( MAKE-ON ?AUTO_5365 ?AUTO_5366 )
      ( MAKE-ON-VERIFY ?AUTO_5365 ?AUTO_5366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5396 - BLOCK
      ?AUTO_5397 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5396 ) ( CLEAR ?AUTO_5397 ) )
    :subtasks
    ( ( !STACK ?AUTO_5396 ?AUTO_5397 )
      ( MAKE-ON-VERIFY ?AUTO_5396 ?AUTO_5397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5400 - BLOCK
      ?AUTO_5401 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5401 ) ( ON-TABLE ?AUTO_5400 ) ( CLEAR ?AUTO_5400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5400 )
      ( MAKE-ON ?AUTO_5400 ?AUTO_5401 )
      ( MAKE-ON-VERIFY ?AUTO_5400 ?AUTO_5401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5405 - BLOCK
      ?AUTO_5406 - BLOCK
    )
    :vars
    (
      ?AUTO_5410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5405 ) ( CLEAR ?AUTO_5405 ) ( HOLDING ?AUTO_5406 ) ( CLEAR ?AUTO_5410 ) )
    :subtasks
    ( ( !STACK ?AUTO_5406 ?AUTO_5410 )
      ( MAKE-ON ?AUTO_5405 ?AUTO_5406 )
      ( MAKE-ON-VERIFY ?AUTO_5405 ?AUTO_5406 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5491 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5491 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5491 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5491 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5493 - BLOCK
    )
    :vars
    (
      ?AUTO_5496 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5493 ?AUTO_5496 ) ( CLEAR ?AUTO_5493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5493 ?AUTO_5496 )
      ( MAKE-ON-TABLE ?AUTO_5493 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5493 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5497 - BLOCK
    )
    :vars
    (
      ?AUTO_5499 - BLOCK
      ?AUTO_5500 - BLOCK
      ?AUTO_5501 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5497 ?AUTO_5499 ) ( CLEAR ?AUTO_5497 ) ( HOLDING ?AUTO_5500 ) ( CLEAR ?AUTO_5501 ) )
    :subtasks
    ( ( !STACK ?AUTO_5500 ?AUTO_5501 )
      ( MAKE-ON-TABLE ?AUTO_5497 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5557 - BLOCK
      ?AUTO_5558 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5557 ) ( CLEAR ?AUTO_5558 ) )
    :subtasks
    ( ( !STACK ?AUTO_5557 ?AUTO_5558 )
      ( MAKE-ON-VERIFY ?AUTO_5557 ?AUTO_5558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5561 - BLOCK
      ?AUTO_5562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5562 ) ( ON-TABLE ?AUTO_5561 ) ( CLEAR ?AUTO_5561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5561 )
      ( MAKE-ON ?AUTO_5561 ?AUTO_5562 )
      ( MAKE-ON-VERIFY ?AUTO_5561 ?AUTO_5562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5566 - BLOCK
      ?AUTO_5567 - BLOCK
    )
    :vars
    (
      ?AUTO_5570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5567 ) ( ON-TABLE ?AUTO_5566 ) ( CLEAR ?AUTO_5566 ) ( HOLDING ?AUTO_5570 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5570 )
      ( MAKE-ON ?AUTO_5566 ?AUTO_5567 )
      ( MAKE-ON-VERIFY ?AUTO_5566 ?AUTO_5567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5571 - BLOCK
      ?AUTO_5572 - BLOCK
    )
    :vars
    (
      ?AUTO_5575 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5572 ) ( ON-TABLE ?AUTO_5571 ) ( ON ?AUTO_5575 ?AUTO_5571 ) ( CLEAR ?AUTO_5575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5575 ?AUTO_5571 )
      ( MAKE-ON ?AUTO_5571 ?AUTO_5572 )
      ( MAKE-ON-VERIFY ?AUTO_5571 ?AUTO_5572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5578 - BLOCK
      ?AUTO_5579 - BLOCK
    )
    :vars
    (
      ?AUTO_5581 - BLOCK
      ?AUTO_5583 - BLOCK
      ?AUTO_5584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5579 ) ( ON-TABLE ?AUTO_5578 ) ( ON ?AUTO_5581 ?AUTO_5578 ) ( CLEAR ?AUTO_5581 ) ( HOLDING ?AUTO_5583 ) ( CLEAR ?AUTO_5584 ) )
    :subtasks
    ( ( !STACK ?AUTO_5583 ?AUTO_5584 )
      ( MAKE-ON ?AUTO_5578 ?AUTO_5579 )
      ( MAKE-ON-VERIFY ?AUTO_5578 ?AUTO_5579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5589 - BLOCK
      ?AUTO_5590 - BLOCK
    )
    :vars
    (
      ?AUTO_5594 - BLOCK
      ?AUTO_5595 - BLOCK
      ?AUTO_5592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5589 ) ( ON ?AUTO_5594 ?AUTO_5589 ) ( CLEAR ?AUTO_5594 ) ( CLEAR ?AUTO_5595 ) ( ON ?AUTO_5592 ?AUTO_5590 ) ( CLEAR ?AUTO_5592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5592 ?AUTO_5590 )
      ( MAKE-ON ?AUTO_5589 ?AUTO_5590 )
      ( MAKE-ON-VERIFY ?AUTO_5589 ?AUTO_5590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5598 - BLOCK
      ?AUTO_5599 - BLOCK
    )
    :vars
    (
      ?AUTO_5604 - BLOCK
      ?AUTO_5603 - BLOCK
      ?AUTO_5602 - BLOCK
      ?AUTO_5605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5598 ) ( ON ?AUTO_5604 ?AUTO_5598 ) ( CLEAR ?AUTO_5604 ) ( CLEAR ?AUTO_5603 ) ( ON ?AUTO_5602 ?AUTO_5599 ) ( CLEAR ?AUTO_5602 ) ( HOLDING ?AUTO_5605 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5605 )
      ( MAKE-ON ?AUTO_5598 ?AUTO_5599 )
      ( MAKE-ON-VERIFY ?AUTO_5598 ?AUTO_5599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5606 - BLOCK
      ?AUTO_5607 - BLOCK
    )
    :vars
    (
      ?AUTO_5612 - BLOCK
      ?AUTO_5608 - BLOCK
      ?AUTO_5613 - BLOCK
      ?AUTO_5611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5606 ) ( ON ?AUTO_5612 ?AUTO_5606 ) ( CLEAR ?AUTO_5612 ) ( CLEAR ?AUTO_5608 ) ( ON ?AUTO_5613 ?AUTO_5607 ) ( ON ?AUTO_5611 ?AUTO_5613 ) ( CLEAR ?AUTO_5611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5611 ?AUTO_5613 )
      ( MAKE-ON ?AUTO_5606 ?AUTO_5607 )
      ( MAKE-ON-VERIFY ?AUTO_5606 ?AUTO_5607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5616 - BLOCK
      ?AUTO_5617 - BLOCK
    )
    :vars
    (
      ?AUTO_5619 - BLOCK
      ?AUTO_5620 - BLOCK
      ?AUTO_5623 - BLOCK
      ?AUTO_5622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5616 ) ( CLEAR ?AUTO_5619 ) ( ON ?AUTO_5620 ?AUTO_5617 ) ( ON ?AUTO_5623 ?AUTO_5620 ) ( CLEAR ?AUTO_5623 ) ( HOLDING ?AUTO_5622 ) ( CLEAR ?AUTO_5616 ) )
    :subtasks
    ( ( !STACK ?AUTO_5622 ?AUTO_5616 )
      ( MAKE-ON ?AUTO_5616 ?AUTO_5617 )
      ( MAKE-ON-VERIFY ?AUTO_5616 ?AUTO_5617 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5626 - BLOCK
      ?AUTO_5627 - BLOCK
    )
    :vars
    (
      ?AUTO_5631 - BLOCK
      ?AUTO_5628 - BLOCK
      ?AUTO_5629 - BLOCK
      ?AUTO_5630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5626 ) ( CLEAR ?AUTO_5631 ) ( ON ?AUTO_5628 ?AUTO_5627 ) ( ON ?AUTO_5629 ?AUTO_5628 ) ( CLEAR ?AUTO_5629 ) ( CLEAR ?AUTO_5626 ) ( ON-TABLE ?AUTO_5630 ) ( CLEAR ?AUTO_5630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5630 )
      ( MAKE-ON ?AUTO_5626 ?AUTO_5627 )
      ( MAKE-ON-VERIFY ?AUTO_5626 ?AUTO_5627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5641 - BLOCK
      ?AUTO_5642 - BLOCK
    )
    :vars
    (
      ?AUTO_5644 - BLOCK
      ?AUTO_5646 - BLOCK
      ?AUTO_5643 - BLOCK
      ?AUTO_5647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5641 ) ( ON ?AUTO_5644 ?AUTO_5641 ) ( CLEAR ?AUTO_5646 ) ( ON ?AUTO_5643 ?AUTO_5642 ) ( CLEAR ?AUTO_5643 ) ( ON ?AUTO_5647 ?AUTO_5644 ) ( CLEAR ?AUTO_5647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5647 ?AUTO_5644 )
      ( MAKE-ON ?AUTO_5641 ?AUTO_5642 )
      ( MAKE-ON-VERIFY ?AUTO_5641 ?AUTO_5642 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5651 - BLOCK
      ?AUTO_5652 - BLOCK
    )
    :vars
    (
      ?AUTO_5657 - BLOCK
      ?AUTO_5655 - BLOCK
      ?AUTO_5656 - BLOCK
      ?AUTO_5653 - BLOCK
      ?AUTO_5659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5651 ) ( ON ?AUTO_5657 ?AUTO_5651 ) ( CLEAR ?AUTO_5655 ) ( ON ?AUTO_5656 ?AUTO_5652 ) ( CLEAR ?AUTO_5656 ) ( ON ?AUTO_5653 ?AUTO_5657 ) ( CLEAR ?AUTO_5653 ) ( HOLDING ?AUTO_5659 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5659 )
      ( MAKE-ON ?AUTO_5651 ?AUTO_5652 )
      ( MAKE-ON-VERIFY ?AUTO_5651 ?AUTO_5652 ) )
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
      ?AUTO_5663 - BLOCK
      ?AUTO_5662 - BLOCK
      ?AUTO_5664 - BLOCK
      ?AUTO_5668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5660 ) ( ON ?AUTO_5667 ?AUTO_5660 ) ( CLEAR ?AUTO_5663 ) ( ON ?AUTO_5662 ?AUTO_5661 ) ( CLEAR ?AUTO_5662 ) ( ON ?AUTO_5664 ?AUTO_5667 ) ( ON ?AUTO_5668 ?AUTO_5664 ) ( CLEAR ?AUTO_5668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5668 ?AUTO_5664 )
      ( MAKE-ON ?AUTO_5660 ?AUTO_5661 )
      ( MAKE-ON-VERIFY ?AUTO_5660 ?AUTO_5661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5671 - BLOCK
      ?AUTO_5672 - BLOCK
    )
    :vars
    (
      ?AUTO_5674 - BLOCK
      ?AUTO_5676 - BLOCK
      ?AUTO_5677 - BLOCK
      ?AUTO_5678 - BLOCK
      ?AUTO_5679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5671 ) ( ON ?AUTO_5674 ?AUTO_5671 ) ( CLEAR ?AUTO_5676 ) ( ON ?AUTO_5677 ?AUTO_5674 ) ( ON ?AUTO_5678 ?AUTO_5677 ) ( CLEAR ?AUTO_5678 ) ( HOLDING ?AUTO_5679 ) ( CLEAR ?AUTO_5672 ) )
    :subtasks
    ( ( !STACK ?AUTO_5679 ?AUTO_5672 )
      ( MAKE-ON ?AUTO_5671 ?AUTO_5672 )
      ( MAKE-ON-VERIFY ?AUTO_5671 ?AUTO_5672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5682 - BLOCK
      ?AUTO_5683 - BLOCK
    )
    :vars
    (
      ?AUTO_5686 - BLOCK
      ?AUTO_5687 - BLOCK
      ?AUTO_5685 - BLOCK
      ?AUTO_5690 - BLOCK
      ?AUTO_5684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5682 ) ( ON ?AUTO_5686 ?AUTO_5682 ) ( CLEAR ?AUTO_5687 ) ( ON ?AUTO_5685 ?AUTO_5686 ) ( ON ?AUTO_5690 ?AUTO_5685 ) ( CLEAR ?AUTO_5683 ) ( ON ?AUTO_5684 ?AUTO_5690 ) ( CLEAR ?AUTO_5684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5684 ?AUTO_5690 )
      ( MAKE-ON ?AUTO_5682 ?AUTO_5683 )
      ( MAKE-ON-VERIFY ?AUTO_5682 ?AUTO_5683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5693 - BLOCK
      ?AUTO_5694 - BLOCK
    )
    :vars
    (
      ?AUTO_5697 - BLOCK
      ?AUTO_5698 - BLOCK
      ?AUTO_5700 - BLOCK
      ?AUTO_5701 - BLOCK
      ?AUTO_5699 - BLOCK
      ?AUTO_5702 - BLOCK
      ?AUTO_5703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5693 ) ( ON ?AUTO_5697 ?AUTO_5693 ) ( CLEAR ?AUTO_5698 ) ( ON ?AUTO_5700 ?AUTO_5697 ) ( ON ?AUTO_5701 ?AUTO_5700 ) ( CLEAR ?AUTO_5694 ) ( ON ?AUTO_5699 ?AUTO_5701 ) ( CLEAR ?AUTO_5699 ) ( HOLDING ?AUTO_5702 ) ( CLEAR ?AUTO_5703 ) )
    :subtasks
    ( ( !STACK ?AUTO_5702 ?AUTO_5703 )
      ( MAKE-ON ?AUTO_5693 ?AUTO_5694 )
      ( MAKE-ON-VERIFY ?AUTO_5693 ?AUTO_5694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5706 - BLOCK
      ?AUTO_5707 - BLOCK
    )
    :vars
    (
      ?AUTO_5713 - BLOCK
      ?AUTO_5710 - BLOCK
      ?AUTO_5711 - BLOCK
      ?AUTO_5714 - BLOCK
      ?AUTO_5712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5706 ) ( ON ?AUTO_5713 ?AUTO_5706 ) ( CLEAR ?AUTO_5710 ) ( ON ?AUTO_5711 ?AUTO_5713 ) ( ON ?AUTO_5714 ?AUTO_5711 ) ( ON ?AUTO_5712 ?AUTO_5714 ) ( CLEAR ?AUTO_5712 ) ( HOLDING ?AUTO_5707 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5707 )
      ( MAKE-ON ?AUTO_5706 ?AUTO_5707 )
      ( MAKE-ON-VERIFY ?AUTO_5706 ?AUTO_5707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5720 - BLOCK
      ?AUTO_5721 - BLOCK
    )
    :vars
    (
      ?AUTO_5727 - BLOCK
      ?AUTO_5729 - BLOCK
      ?AUTO_5722 - BLOCK
      ?AUTO_5724 - BLOCK
      ?AUTO_5726 - BLOCK
      ?AUTO_5730 - BLOCK
      ?AUTO_5725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5720 ) ( ON ?AUTO_5727 ?AUTO_5720 ) ( CLEAR ?AUTO_5729 ) ( ON ?AUTO_5722 ?AUTO_5727 ) ( ON ?AUTO_5724 ?AUTO_5722 ) ( ON ?AUTO_5726 ?AUTO_5724 ) ( CLEAR ?AUTO_5726 ) ( CLEAR ?AUTO_5730 ) ( ON ?AUTO_5725 ?AUTO_5721 ) ( CLEAR ?AUTO_5725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5725 ?AUTO_5721 )
      ( MAKE-ON ?AUTO_5720 ?AUTO_5721 )
      ( MAKE-ON-VERIFY ?AUTO_5720 ?AUTO_5721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5733 - BLOCK
      ?AUTO_5734 - BLOCK
    )
    :vars
    (
      ?AUTO_5741 - BLOCK
      ?AUTO_5742 - BLOCK
      ?AUTO_5739 - BLOCK
      ?AUTO_5738 - BLOCK
      ?AUTO_5740 - BLOCK
      ?AUTO_5736 - BLOCK
      ?AUTO_5737 - BLOCK
      ?AUTO_5744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5733 ) ( ON ?AUTO_5741 ?AUTO_5733 ) ( CLEAR ?AUTO_5742 ) ( ON ?AUTO_5739 ?AUTO_5741 ) ( ON ?AUTO_5738 ?AUTO_5739 ) ( ON ?AUTO_5740 ?AUTO_5738 ) ( CLEAR ?AUTO_5740 ) ( CLEAR ?AUTO_5736 ) ( ON ?AUTO_5737 ?AUTO_5734 ) ( CLEAR ?AUTO_5737 ) ( HOLDING ?AUTO_5744 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5744 )
      ( MAKE-ON ?AUTO_5733 ?AUTO_5734 )
      ( MAKE-ON-VERIFY ?AUTO_5733 ?AUTO_5734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5745 - BLOCK
      ?AUTO_5746 - BLOCK
    )
    :vars
    (
      ?AUTO_5749 - BLOCK
      ?AUTO_5751 - BLOCK
      ?AUTO_5756 - BLOCK
      ?AUTO_5747 - BLOCK
      ?AUTO_5755 - BLOCK
      ?AUTO_5748 - BLOCK
      ?AUTO_5752 - BLOCK
      ?AUTO_5750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5745 ) ( ON ?AUTO_5749 ?AUTO_5745 ) ( CLEAR ?AUTO_5751 ) ( ON ?AUTO_5756 ?AUTO_5749 ) ( ON ?AUTO_5747 ?AUTO_5756 ) ( ON ?AUTO_5755 ?AUTO_5747 ) ( CLEAR ?AUTO_5755 ) ( CLEAR ?AUTO_5748 ) ( ON ?AUTO_5752 ?AUTO_5746 ) ( ON ?AUTO_5750 ?AUTO_5752 ) ( CLEAR ?AUTO_5750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5750 ?AUTO_5752 )
      ( MAKE-ON ?AUTO_5745 ?AUTO_5746 )
      ( MAKE-ON-VERIFY ?AUTO_5745 ?AUTO_5746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5761 - BLOCK
      ?AUTO_5762 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5761 ) ( CLEAR ?AUTO_5762 ) )
    :subtasks
    ( ( !STACK ?AUTO_5761 ?AUTO_5762 )
      ( MAKE-ON-VERIFY ?AUTO_5761 ?AUTO_5762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5765 - BLOCK
      ?AUTO_5766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5766 ) ( ON-TABLE ?AUTO_5765 ) ( CLEAR ?AUTO_5765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5765 )
      ( MAKE-ON ?AUTO_5765 ?AUTO_5766 )
      ( MAKE-ON-VERIFY ?AUTO_5765 ?AUTO_5766 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5770 - BLOCK
      ?AUTO_5771 - BLOCK
    )
    :vars
    (
      ?AUTO_5775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5770 ) ( CLEAR ?AUTO_5770 ) ( HOLDING ?AUTO_5771 ) ( CLEAR ?AUTO_5775 ) )
    :subtasks
    ( ( !STACK ?AUTO_5771 ?AUTO_5775 )
      ( MAKE-ON ?AUTO_5770 ?AUTO_5771 )
      ( MAKE-ON-VERIFY ?AUTO_5770 ?AUTO_5771 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5777 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5777 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5777 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5777 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5779 - BLOCK
    )
    :vars
    (
      ?AUTO_5782 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5779 ?AUTO_5782 ) ( CLEAR ?AUTO_5779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5779 ?AUTO_5782 )
      ( MAKE-ON-TABLE ?AUTO_5779 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5779 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5784 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5784 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5784 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5784 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5786 - BLOCK
    )
    :vars
    (
      ?AUTO_5789 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5786 ?AUTO_5789 ) ( CLEAR ?AUTO_5786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5786 ?AUTO_5789 )
      ( MAKE-ON-TABLE ?AUTO_5786 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5786 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5790 - BLOCK
    )
    :vars
    (
      ?AUTO_5792 - BLOCK
      ?AUTO_5793 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5790 ?AUTO_5792 ) ( CLEAR ?AUTO_5790 ) ( HOLDING ?AUTO_5793 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5793 )
      ( MAKE-ON-TABLE ?AUTO_5790 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5790 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5794 - BLOCK
    )
    :vars
    (
      ?AUTO_5796 - BLOCK
      ?AUTO_5797 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5794 ?AUTO_5796 ) ( ON ?AUTO_5797 ?AUTO_5794 ) ( CLEAR ?AUTO_5797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5797 ?AUTO_5794 )
      ( MAKE-ON-TABLE ?AUTO_5794 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5794 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5802 - BLOCK
      ?AUTO_5803 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5802 ) ( CLEAR ?AUTO_5803 ) )
    :subtasks
    ( ( !STACK ?AUTO_5802 ?AUTO_5803 )
      ( MAKE-ON-VERIFY ?AUTO_5802 ?AUTO_5803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5806 - BLOCK
      ?AUTO_5807 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5807 ) ( ON-TABLE ?AUTO_5806 ) ( CLEAR ?AUTO_5806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5806 )
      ( MAKE-ON ?AUTO_5806 ?AUTO_5807 )
      ( MAKE-ON-VERIFY ?AUTO_5806 ?AUTO_5807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5811 - BLOCK
      ?AUTO_5812 - BLOCK
    )
    :vars
    (
      ?AUTO_5815 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5812 ) ( ON-TABLE ?AUTO_5811 ) ( CLEAR ?AUTO_5811 ) ( HOLDING ?AUTO_5815 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5815 )
      ( MAKE-ON ?AUTO_5811 ?AUTO_5812 )
      ( MAKE-ON-VERIFY ?AUTO_5811 ?AUTO_5812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5816 - BLOCK
      ?AUTO_5817 - BLOCK
    )
    :vars
    (
      ?AUTO_5820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5817 ) ( ON-TABLE ?AUTO_5816 ) ( ON ?AUTO_5820 ?AUTO_5816 ) ( CLEAR ?AUTO_5820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5820 ?AUTO_5816 )
      ( MAKE-ON ?AUTO_5816 ?AUTO_5817 )
      ( MAKE-ON-VERIFY ?AUTO_5816 ?AUTO_5817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5823 - BLOCK
      ?AUTO_5824 - BLOCK
    )
    :vars
    (
      ?AUTO_5825 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5823 ) ( ON ?AUTO_5825 ?AUTO_5823 ) ( CLEAR ?AUTO_5825 ) ( HOLDING ?AUTO_5824 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5824 )
      ( MAKE-ON ?AUTO_5823 ?AUTO_5824 )
      ( MAKE-ON-VERIFY ?AUTO_5823 ?AUTO_5824 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5829 - BLOCK
      ?AUTO_5830 - BLOCK
    )
    :vars
    (
      ?AUTO_5831 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5829 ) ( ON ?AUTO_5831 ?AUTO_5829 ) ( ON ?AUTO_5830 ?AUTO_5831 ) ( CLEAR ?AUTO_5830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5830 ?AUTO_5831 )
      ( MAKE-ON ?AUTO_5829 ?AUTO_5830 )
      ( MAKE-ON-VERIFY ?AUTO_5829 ?AUTO_5830 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5837 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5837 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5837 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5837 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5839 - BLOCK
    )
    :vars
    (
      ?AUTO_5842 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5839 ?AUTO_5842 ) ( CLEAR ?AUTO_5839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5839 ?AUTO_5842 )
      ( MAKE-ON-TABLE ?AUTO_5839 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5839 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5843 - BLOCK
    )
    :vars
    (
      ?AUTO_5845 - BLOCK
      ?AUTO_5846 - BLOCK
      ?AUTO_5847 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5843 ?AUTO_5845 ) ( CLEAR ?AUTO_5843 ) ( HOLDING ?AUTO_5846 ) ( CLEAR ?AUTO_5847 ) )
    :subtasks
    ( ( !STACK ?AUTO_5846 ?AUTO_5847 )
      ( MAKE-ON-TABLE ?AUTO_5843 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5855 - BLOCK
      ?AUTO_5856 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5855 ) ( CLEAR ?AUTO_5856 ) )
    :subtasks
    ( ( !STACK ?AUTO_5855 ?AUTO_5856 )
      ( MAKE-ON-VERIFY ?AUTO_5855 ?AUTO_5856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5859 - BLOCK
      ?AUTO_5860 - BLOCK
    )
    :vars
    (
      ?AUTO_5864 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5860 ) ( ON ?AUTO_5859 ?AUTO_5864 ) ( CLEAR ?AUTO_5859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5859 ?AUTO_5864 )
      ( MAKE-ON ?AUTO_5859 ?AUTO_5860 )
      ( MAKE-ON-VERIFY ?AUTO_5859 ?AUTO_5860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5865 - BLOCK
      ?AUTO_5866 - BLOCK
    )
    :vars
    (
      ?AUTO_5869 - BLOCK
      ?AUTO_5870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5866 ) ( ON ?AUTO_5865 ?AUTO_5869 ) ( CLEAR ?AUTO_5865 ) ( HOLDING ?AUTO_5870 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5870 )
      ( MAKE-ON ?AUTO_5865 ?AUTO_5866 )
      ( MAKE-ON-VERIFY ?AUTO_5865 ?AUTO_5866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5871 - BLOCK
      ?AUTO_5872 - BLOCK
    )
    :vars
    (
      ?AUTO_5875 - BLOCK
      ?AUTO_5876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5872 ) ( ON ?AUTO_5871 ?AUTO_5875 ) ( ON ?AUTO_5876 ?AUTO_5871 ) ( CLEAR ?AUTO_5876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5876 ?AUTO_5871 )
      ( MAKE-ON ?AUTO_5871 ?AUTO_5872 )
      ( MAKE-ON-VERIFY ?AUTO_5871 ?AUTO_5872 ) )
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
      ?AUTO_5881 - BLOCK
      ?AUTO_5886 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5879 ?AUTO_5884 ) ( ON ?AUTO_5881 ?AUTO_5879 ) ( CLEAR ?AUTO_5881 ) ( HOLDING ?AUTO_5880 ) ( CLEAR ?AUTO_5886 ) )
    :subtasks
    ( ( !STACK ?AUTO_5880 ?AUTO_5886 )
      ( MAKE-ON ?AUTO_5879 ?AUTO_5880 )
      ( MAKE-ON-VERIFY ?AUTO_5879 ?AUTO_5880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5889 - BLOCK
      ?AUTO_5890 - BLOCK
    )
    :vars
    (
      ?AUTO_5894 - BLOCK
      ?AUTO_5891 - BLOCK
      ?AUTO_5895 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5890 ) ( ON ?AUTO_5889 ?AUTO_5894 ) ( ON ?AUTO_5891 ?AUTO_5889 ) ( CLEAR ?AUTO_5891 ) ( HOLDING ?AUTO_5895 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5895 )
      ( MAKE-ON ?AUTO_5889 ?AUTO_5890 )
      ( MAKE-ON-VERIFY ?AUTO_5889 ?AUTO_5890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5896 - BLOCK
      ?AUTO_5897 - BLOCK
    )
    :vars
    (
      ?AUTO_5901 - BLOCK
      ?AUTO_5900 - BLOCK
      ?AUTO_5902 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5896 ?AUTO_5901 ) ( ON ?AUTO_5900 ?AUTO_5896 ) ( CLEAR ?AUTO_5900 ) ( ON ?AUTO_5902 ?AUTO_5897 ) ( CLEAR ?AUTO_5902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5902 ?AUTO_5897 )
      ( MAKE-ON ?AUTO_5896 ?AUTO_5897 )
      ( MAKE-ON-VERIFY ?AUTO_5896 ?AUTO_5897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5905 - BLOCK
      ?AUTO_5906 - BLOCK
    )
    :vars
    (
      ?AUTO_5911 - BLOCK
      ?AUTO_5907 - BLOCK
      ?AUTO_5909 - BLOCK
      ?AUTO_5912 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5905 ?AUTO_5911 ) ( ON ?AUTO_5907 ?AUTO_5905 ) ( CLEAR ?AUTO_5907 ) ( ON ?AUTO_5909 ?AUTO_5906 ) ( CLEAR ?AUTO_5909 ) ( HOLDING ?AUTO_5912 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5912 )
      ( MAKE-ON ?AUTO_5905 ?AUTO_5906 )
      ( MAKE-ON-VERIFY ?AUTO_5905 ?AUTO_5906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5913 - BLOCK
      ?AUTO_5914 - BLOCK
    )
    :vars
    (
      ?AUTO_5915 - BLOCK
      ?AUTO_5918 - BLOCK
      ?AUTO_5920 - BLOCK
      ?AUTO_5919 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5913 ?AUTO_5915 ) ( ON ?AUTO_5918 ?AUTO_5913 ) ( CLEAR ?AUTO_5918 ) ( ON ?AUTO_5920 ?AUTO_5914 ) ( ON ?AUTO_5919 ?AUTO_5920 ) ( CLEAR ?AUTO_5919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5919 ?AUTO_5920 )
      ( MAKE-ON ?AUTO_5913 ?AUTO_5914 )
      ( MAKE-ON-VERIFY ?AUTO_5913 ?AUTO_5914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5925 - BLOCK
      ?AUTO_5926 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5925 ) ( CLEAR ?AUTO_5926 ) )
    :subtasks
    ( ( !STACK ?AUTO_5925 ?AUTO_5926 )
      ( MAKE-ON-VERIFY ?AUTO_5925 ?AUTO_5926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5929 - BLOCK
      ?AUTO_5930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5930 ) ( ON-TABLE ?AUTO_5929 ) ( CLEAR ?AUTO_5929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5929 )
      ( MAKE-ON ?AUTO_5929 ?AUTO_5930 )
      ( MAKE-ON-VERIFY ?AUTO_5929 ?AUTO_5930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5934 - BLOCK
      ?AUTO_5935 - BLOCK
    )
    :vars
    (
      ?AUTO_5938 - BLOCK
      ?AUTO_5939 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5935 ) ( ON-TABLE ?AUTO_5934 ) ( CLEAR ?AUTO_5934 ) ( HOLDING ?AUTO_5938 ) ( CLEAR ?AUTO_5939 ) )
    :subtasks
    ( ( !STACK ?AUTO_5938 ?AUTO_5939 )
      ( MAKE-ON ?AUTO_5934 ?AUTO_5935 )
      ( MAKE-ON-VERIFY ?AUTO_5934 ?AUTO_5935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5940 - BLOCK
      ?AUTO_5941 - BLOCK
    )
    :vars
    (
      ?AUTO_5945 - BLOCK
      ?AUTO_5944 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5941 ) ( ON-TABLE ?AUTO_5940 ) ( CLEAR ?AUTO_5945 ) ( ON ?AUTO_5944 ?AUTO_5940 ) ( CLEAR ?AUTO_5944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5944 ?AUTO_5940 )
      ( MAKE-ON ?AUTO_5940 ?AUTO_5941 )
      ( MAKE-ON-VERIFY ?AUTO_5940 ?AUTO_5941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5948 - BLOCK
      ?AUTO_5949 - BLOCK
    )
    :vars
    (
      ?AUTO_5950 - BLOCK
      ?AUTO_5953 - BLOCK
      ?AUTO_5954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5949 ) ( ON-TABLE ?AUTO_5948 ) ( CLEAR ?AUTO_5950 ) ( ON ?AUTO_5953 ?AUTO_5948 ) ( CLEAR ?AUTO_5953 ) ( HOLDING ?AUTO_5954 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5954 )
      ( MAKE-ON ?AUTO_5948 ?AUTO_5949 )
      ( MAKE-ON-VERIFY ?AUTO_5948 ?AUTO_5949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5955 - BLOCK
      ?AUTO_5956 - BLOCK
    )
    :vars
    (
      ?AUTO_5958 - BLOCK
      ?AUTO_5960 - BLOCK
      ?AUTO_5961 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5956 ) ( ON-TABLE ?AUTO_5955 ) ( CLEAR ?AUTO_5958 ) ( ON ?AUTO_5960 ?AUTO_5955 ) ( ON ?AUTO_5961 ?AUTO_5960 ) ( CLEAR ?AUTO_5961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5961 ?AUTO_5960 )
      ( MAKE-ON ?AUTO_5955 ?AUTO_5956 )
      ( MAKE-ON-VERIFY ?AUTO_5955 ?AUTO_5956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5964 - BLOCK
      ?AUTO_5965 - BLOCK
    )
    :vars
    (
      ?AUTO_5966 - BLOCK
      ?AUTO_5969 - BLOCK
      ?AUTO_5968 - BLOCK
      ?AUTO_5972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5965 ) ( ON-TABLE ?AUTO_5964 ) ( ON ?AUTO_5966 ?AUTO_5964 ) ( ON ?AUTO_5969 ?AUTO_5966 ) ( CLEAR ?AUTO_5969 ) ( HOLDING ?AUTO_5968 ) ( CLEAR ?AUTO_5972 ) )
    :subtasks
    ( ( !STACK ?AUTO_5968 ?AUTO_5972 )
      ( MAKE-ON ?AUTO_5964 ?AUTO_5965 )
      ( MAKE-ON-VERIFY ?AUTO_5964 ?AUTO_5965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5975 - BLOCK
      ?AUTO_5976 - BLOCK
    )
    :vars
    (
      ?AUTO_5979 - BLOCK
      ?AUTO_5978 - BLOCK
      ?AUTO_5981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5975 ) ( CLEAR ?AUTO_5979 ) ( ON ?AUTO_5978 ?AUTO_5975 ) ( ON ?AUTO_5981 ?AUTO_5978 ) ( CLEAR ?AUTO_5981 ) ( HOLDING ?AUTO_5976 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5976 )
      ( MAKE-ON ?AUTO_5975 ?AUTO_5976 )
      ( MAKE-ON-VERIFY ?AUTO_5975 ?AUTO_5976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5987 - BLOCK
      ?AUTO_5988 - BLOCK
    )
    :vars
    (
      ?AUTO_5989 - BLOCK
      ?AUTO_5991 - BLOCK
      ?AUTO_5990 - BLOCK
      ?AUTO_5993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5987 ) ( ON ?AUTO_5989 ?AUTO_5987 ) ( ON ?AUTO_5991 ?AUTO_5989 ) ( CLEAR ?AUTO_5991 ) ( CLEAR ?AUTO_5990 ) ( ON ?AUTO_5993 ?AUTO_5988 ) ( CLEAR ?AUTO_5993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5993 ?AUTO_5988 )
      ( MAKE-ON ?AUTO_5987 ?AUTO_5988 )
      ( MAKE-ON-VERIFY ?AUTO_5987 ?AUTO_5988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5999 - BLOCK
      ?AUTO_6000 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5999 ) ( CLEAR ?AUTO_6000 ) )
    :subtasks
    ( ( !STACK ?AUTO_5999 ?AUTO_6000 )
      ( MAKE-ON-VERIFY ?AUTO_5999 ?AUTO_6000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6003 - BLOCK
      ?AUTO_6004 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6004 ) ( ON-TABLE ?AUTO_6003 ) ( CLEAR ?AUTO_6003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6003 )
      ( MAKE-ON ?AUTO_6003 ?AUTO_6004 )
      ( MAKE-ON-VERIFY ?AUTO_6003 ?AUTO_6004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6008 - BLOCK
      ?AUTO_6009 - BLOCK
    )
    :vars
    (
      ?AUTO_6013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6008 ) ( CLEAR ?AUTO_6008 ) ( HOLDING ?AUTO_6009 ) ( CLEAR ?AUTO_6013 ) )
    :subtasks
    ( ( !STACK ?AUTO_6009 ?AUTO_6013 )
      ( MAKE-ON ?AUTO_6008 ?AUTO_6009 )
      ( MAKE-ON-VERIFY ?AUTO_6008 ?AUTO_6009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6018 - BLOCK
      ?AUTO_6019 - BLOCK
    )
    :vars
    (
      ?AUTO_6023 - BLOCK
      ?AUTO_6022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6018 ) ( CLEAR ?AUTO_6018 ) ( CLEAR ?AUTO_6023 ) ( ON ?AUTO_6022 ?AUTO_6019 ) ( CLEAR ?AUTO_6022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6022 ?AUTO_6019 )
      ( MAKE-ON ?AUTO_6018 ?AUTO_6019 )
      ( MAKE-ON-VERIFY ?AUTO_6018 ?AUTO_6019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6026 - BLOCK
      ?AUTO_6027 - BLOCK
    )
    :vars
    (
      ?AUTO_6030 - BLOCK
      ?AUTO_6031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6030 ) ( ON ?AUTO_6031 ?AUTO_6027 ) ( CLEAR ?AUTO_6031 ) ( HOLDING ?AUTO_6026 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6026 )
      ( MAKE-ON ?AUTO_6026 ?AUTO_6027 )
      ( MAKE-ON-VERIFY ?AUTO_6026 ?AUTO_6027 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6033 - BLOCK
      ?AUTO_6034 - BLOCK
    )
    :vars
    (
      ?AUTO_6037 - BLOCK
      ?AUTO_6038 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6037 ) ( ON ?AUTO_6038 ?AUTO_6034 ) ( ON ?AUTO_6033 ?AUTO_6038 ) ( CLEAR ?AUTO_6033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6033 ?AUTO_6038 )
      ( MAKE-ON ?AUTO_6033 ?AUTO_6034 )
      ( MAKE-ON-VERIFY ?AUTO_6033 ?AUTO_6034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6041 - BLOCK
      ?AUTO_6042 - BLOCK
    )
    :vars
    (
      ?AUTO_6043 - BLOCK
      ?AUTO_6045 - BLOCK
      ?AUTO_6047 - BLOCK
      ?AUTO_6048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6043 ) ( ON ?AUTO_6045 ?AUTO_6042 ) ( ON ?AUTO_6041 ?AUTO_6045 ) ( CLEAR ?AUTO_6041 ) ( HOLDING ?AUTO_6047 ) ( CLEAR ?AUTO_6048 ) )
    :subtasks
    ( ( !STACK ?AUTO_6047 ?AUTO_6048 )
      ( MAKE-ON ?AUTO_6041 ?AUTO_6042 )
      ( MAKE-ON-VERIFY ?AUTO_6041 ?AUTO_6042 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6050 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6050 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6050 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6050 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6052 - BLOCK
    )
    :vars
    (
      ?AUTO_6055 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6052 ?AUTO_6055 ) ( CLEAR ?AUTO_6052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6052 ?AUTO_6055 )
      ( MAKE-ON-TABLE ?AUTO_6052 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6052 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6057 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6057 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6057 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6057 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6059 - BLOCK
    )
    :vars
    (
      ?AUTO_6062 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6059 ?AUTO_6062 ) ( CLEAR ?AUTO_6059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6059 ?AUTO_6062 )
      ( MAKE-ON-TABLE ?AUTO_6059 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6059 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6063 - BLOCK
    )
    :vars
    (
      ?AUTO_6065 - BLOCK
      ?AUTO_6066 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6063 ?AUTO_6065 ) ( CLEAR ?AUTO_6063 ) ( HOLDING ?AUTO_6066 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6066 )
      ( MAKE-ON-TABLE ?AUTO_6063 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6063 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6067 - BLOCK
    )
    :vars
    (
      ?AUTO_6069 - BLOCK
      ?AUTO_6070 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6067 ?AUTO_6069 ) ( ON ?AUTO_6070 ?AUTO_6067 ) ( CLEAR ?AUTO_6070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6070 ?AUTO_6067 )
      ( MAKE-ON-TABLE ?AUTO_6067 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6075 - BLOCK
      ?AUTO_6076 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6075 ) ( CLEAR ?AUTO_6076 ) )
    :subtasks
    ( ( !STACK ?AUTO_6075 ?AUTO_6076 )
      ( MAKE-ON-VERIFY ?AUTO_6075 ?AUTO_6076 ) )
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
    ( and ( CLEAR ?AUTO_6080 ) ( ON ?AUTO_6079 ?AUTO_6084 ) ( CLEAR ?AUTO_6079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6079 ?AUTO_6084 )
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
      ?AUTO_6089 - BLOCK
      ?AUTO_6090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6086 ) ( ON ?AUTO_6085 ?AUTO_6089 ) ( CLEAR ?AUTO_6085 ) ( HOLDING ?AUTO_6090 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6090 )
      ( MAKE-ON ?AUTO_6085 ?AUTO_6086 )
      ( MAKE-ON-VERIFY ?AUTO_6085 ?AUTO_6086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6091 - BLOCK
      ?AUTO_6092 - BLOCK
    )
    :vars
    (
      ?AUTO_6095 - BLOCK
      ?AUTO_6096 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6092 ) ( ON ?AUTO_6091 ?AUTO_6095 ) ( ON ?AUTO_6096 ?AUTO_6091 ) ( CLEAR ?AUTO_6096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6096 ?AUTO_6091 )
      ( MAKE-ON ?AUTO_6091 ?AUTO_6092 )
      ( MAKE-ON-VERIFY ?AUTO_6091 ?AUTO_6092 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6099 - BLOCK
      ?AUTO_6100 - BLOCK
    )
    :vars
    (
      ?AUTO_6104 - BLOCK
      ?AUTO_6101 - BLOCK
      ?AUTO_6105 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6100 ) ( ON ?AUTO_6099 ?AUTO_6104 ) ( ON ?AUTO_6101 ?AUTO_6099 ) ( CLEAR ?AUTO_6101 ) ( HOLDING ?AUTO_6105 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6105 )
      ( MAKE-ON ?AUTO_6099 ?AUTO_6100 )
      ( MAKE-ON-VERIFY ?AUTO_6099 ?AUTO_6100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6106 - BLOCK
      ?AUTO_6107 - BLOCK
    )
    :vars
    (
      ?AUTO_6109 - BLOCK
      ?AUTO_6108 - BLOCK
      ?AUTO_6112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6107 ) ( ON ?AUTO_6106 ?AUTO_6109 ) ( ON ?AUTO_6108 ?AUTO_6106 ) ( ON ?AUTO_6112 ?AUTO_6108 ) ( CLEAR ?AUTO_6112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6112 ?AUTO_6108 )
      ( MAKE-ON ?AUTO_6106 ?AUTO_6107 )
      ( MAKE-ON-VERIFY ?AUTO_6106 ?AUTO_6107 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6116 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6116 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6116 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6116 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6118 - BLOCK
    )
    :vars
    (
      ?AUTO_6121 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6118 ?AUTO_6121 ) ( CLEAR ?AUTO_6118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6118 ?AUTO_6121 )
      ( MAKE-ON-TABLE ?AUTO_6118 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6118 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6122 - BLOCK
    )
    :vars
    (
      ?AUTO_6124 - BLOCK
      ?AUTO_6125 - BLOCK
      ?AUTO_6126 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6122 ?AUTO_6124 ) ( CLEAR ?AUTO_6122 ) ( HOLDING ?AUTO_6125 ) ( CLEAR ?AUTO_6126 ) )
    :subtasks
    ( ( !STACK ?AUTO_6125 ?AUTO_6126 )
      ( MAKE-ON-TABLE ?AUTO_6122 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6122 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6127 - BLOCK
    )
    :vars
    (
      ?AUTO_6129 - BLOCK
      ?AUTO_6131 - BLOCK
      ?AUTO_6130 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6127 ?AUTO_6129 ) ( CLEAR ?AUTO_6131 ) ( ON ?AUTO_6130 ?AUTO_6127 ) ( CLEAR ?AUTO_6130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6130 ?AUTO_6127 )
      ( MAKE-ON-TABLE ?AUTO_6127 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6127 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6134 - BLOCK
    )
    :vars
    (
      ?AUTO_6137 - BLOCK
      ?AUTO_6135 - BLOCK
      ?AUTO_6138 - BLOCK
      ?AUTO_6139 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6134 ?AUTO_6137 ) ( CLEAR ?AUTO_6135 ) ( ON ?AUTO_6138 ?AUTO_6134 ) ( CLEAR ?AUTO_6138 ) ( HOLDING ?AUTO_6139 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6139 )
      ( MAKE-ON-TABLE ?AUTO_6134 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6134 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6140 - BLOCK
    )
    :vars
    (
      ?AUTO_6142 - BLOCK
      ?AUTO_6143 - BLOCK
      ?AUTO_6141 - BLOCK
      ?AUTO_6145 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6140 ?AUTO_6142 ) ( CLEAR ?AUTO_6143 ) ( ON ?AUTO_6141 ?AUTO_6140 ) ( ON ?AUTO_6145 ?AUTO_6141 ) ( CLEAR ?AUTO_6145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6145 ?AUTO_6141 )
      ( MAKE-ON-TABLE ?AUTO_6140 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6140 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6148 - BLOCK
    )
    :vars
    (
      ?AUTO_6149 - BLOCK
      ?AUTO_6153 - BLOCK
      ?AUTO_6150 - BLOCK
      ?AUTO_6152 - BLOCK
      ?AUTO_6154 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6148 ?AUTO_6149 ) ( CLEAR ?AUTO_6153 ) ( ON ?AUTO_6150 ?AUTO_6148 ) ( ON ?AUTO_6152 ?AUTO_6150 ) ( CLEAR ?AUTO_6152 ) ( HOLDING ?AUTO_6154 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6154 )
      ( MAKE-ON-TABLE ?AUTO_6148 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6148 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6155 - BLOCK
    )
    :vars
    (
      ?AUTO_6157 - BLOCK
      ?AUTO_6156 - BLOCK
      ?AUTO_6161 - BLOCK
      ?AUTO_6158 - BLOCK
      ?AUTO_6159 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6155 ?AUTO_6157 ) ( CLEAR ?AUTO_6156 ) ( ON ?AUTO_6161 ?AUTO_6155 ) ( ON ?AUTO_6158 ?AUTO_6161 ) ( ON ?AUTO_6159 ?AUTO_6158 ) ( CLEAR ?AUTO_6159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6159 ?AUTO_6158 )
      ( MAKE-ON-TABLE ?AUTO_6155 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6166 - BLOCK
      ?AUTO_6167 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6166 ) ( CLEAR ?AUTO_6167 ) )
    :subtasks
    ( ( !STACK ?AUTO_6166 ?AUTO_6167 )
      ( MAKE-ON-VERIFY ?AUTO_6166 ?AUTO_6167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6170 - BLOCK
      ?AUTO_6171 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6171 ) ( ON-TABLE ?AUTO_6170 ) ( CLEAR ?AUTO_6170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6170 )
      ( MAKE-ON ?AUTO_6170 ?AUTO_6171 )
      ( MAKE-ON-VERIFY ?AUTO_6170 ?AUTO_6171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6175 - BLOCK
      ?AUTO_6176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6175 ) ( CLEAR ?AUTO_6175 ) ( HOLDING ?AUTO_6176 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6176 )
      ( MAKE-ON ?AUTO_6175 ?AUTO_6176 )
      ( MAKE-ON-VERIFY ?AUTO_6175 ?AUTO_6176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6182 - BLOCK
      ?AUTO_6183 - BLOCK
    )
    :vars
    (
      ?AUTO_6186 - BLOCK
      ?AUTO_6187 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6183 ) ( ON-TABLE ?AUTO_6182 ) ( CLEAR ?AUTO_6182 ) ( HOLDING ?AUTO_6186 ) ( CLEAR ?AUTO_6187 ) )
    :subtasks
    ( ( !STACK ?AUTO_6186 ?AUTO_6187 )
      ( MAKE-ON ?AUTO_6182 ?AUTO_6183 )
      ( MAKE-ON-VERIFY ?AUTO_6182 ?AUTO_6183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6188 - BLOCK
      ?AUTO_6189 - BLOCK
    )
    :vars
    (
      ?AUTO_6193 - BLOCK
      ?AUTO_6192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6188 ) ( CLEAR ?AUTO_6188 ) ( CLEAR ?AUTO_6193 ) ( ON ?AUTO_6192 ?AUTO_6189 ) ( CLEAR ?AUTO_6192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6192 ?AUTO_6189 )
      ( MAKE-ON ?AUTO_6188 ?AUTO_6189 )
      ( MAKE-ON-VERIFY ?AUTO_6188 ?AUTO_6189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6196 - BLOCK
      ?AUTO_6197 - BLOCK
    )
    :vars
    (
      ?AUTO_6198 - BLOCK
      ?AUTO_6201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6198 ) ( ON ?AUTO_6201 ?AUTO_6197 ) ( CLEAR ?AUTO_6201 ) ( HOLDING ?AUTO_6196 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6196 )
      ( MAKE-ON ?AUTO_6196 ?AUTO_6197 )
      ( MAKE-ON-VERIFY ?AUTO_6196 ?AUTO_6197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6203 - BLOCK
      ?AUTO_6204 - BLOCK
    )
    :vars
    (
      ?AUTO_6205 - BLOCK
      ?AUTO_6206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6205 ) ( ON ?AUTO_6206 ?AUTO_6204 ) ( ON ?AUTO_6203 ?AUTO_6206 ) ( CLEAR ?AUTO_6203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6203 ?AUTO_6206 )
      ( MAKE-ON ?AUTO_6203 ?AUTO_6204 )
      ( MAKE-ON-VERIFY ?AUTO_6203 ?AUTO_6204 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6211 - BLOCK
      ?AUTO_6212 - BLOCK
    )
    :vars
    (
      ?AUTO_6214 - BLOCK
      ?AUTO_6213 - BLOCK
      ?AUTO_6217 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6214 ) ( ON ?AUTO_6213 ?AUTO_6212 ) ( ON ?AUTO_6211 ?AUTO_6213 ) ( CLEAR ?AUTO_6211 ) ( HOLDING ?AUTO_6217 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6217 )
      ( MAKE-ON ?AUTO_6211 ?AUTO_6212 )
      ( MAKE-ON-VERIFY ?AUTO_6211 ?AUTO_6212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6218 - BLOCK
      ?AUTO_6219 - BLOCK
    )
    :vars
    (
      ?AUTO_6223 - BLOCK
      ?AUTO_6220 - BLOCK
      ?AUTO_6224 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6223 ) ( ON ?AUTO_6220 ?AUTO_6219 ) ( ON ?AUTO_6218 ?AUTO_6220 ) ( ON ?AUTO_6224 ?AUTO_6218 ) ( CLEAR ?AUTO_6224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6224 ?AUTO_6218 )
      ( MAKE-ON ?AUTO_6218 ?AUTO_6219 )
      ( MAKE-ON-VERIFY ?AUTO_6218 ?AUTO_6219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6229 - BLOCK
      ?AUTO_6230 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6229 ) ( CLEAR ?AUTO_6230 ) )
    :subtasks
    ( ( !STACK ?AUTO_6229 ?AUTO_6230 )
      ( MAKE-ON-VERIFY ?AUTO_6229 ?AUTO_6230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6233 - BLOCK
      ?AUTO_6234 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6234 ) ( ON-TABLE ?AUTO_6233 ) ( CLEAR ?AUTO_6233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6233 )
      ( MAKE-ON ?AUTO_6233 ?AUTO_6234 )
      ( MAKE-ON-VERIFY ?AUTO_6233 ?AUTO_6234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6238 - BLOCK
      ?AUTO_6239 - BLOCK
    )
    :vars
    (
      ?AUTO_6243 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6238 ) ( CLEAR ?AUTO_6238 ) ( HOLDING ?AUTO_6239 ) ( CLEAR ?AUTO_6243 ) )
    :subtasks
    ( ( !STACK ?AUTO_6239 ?AUTO_6243 )
      ( MAKE-ON ?AUTO_6238 ?AUTO_6239 )
      ( MAKE-ON-VERIFY ?AUTO_6238 ?AUTO_6239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6246 - BLOCK
      ?AUTO_6247 - BLOCK
    )
    :vars
    (
      ?AUTO_6250 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6247 ) ( ON-TABLE ?AUTO_6246 ) ( CLEAR ?AUTO_6246 ) ( HOLDING ?AUTO_6250 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6250 )
      ( MAKE-ON ?AUTO_6246 ?AUTO_6247 )
      ( MAKE-ON-VERIFY ?AUTO_6246 ?AUTO_6247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6251 - BLOCK
      ?AUTO_6252 - BLOCK
    )
    :vars
    (
      ?AUTO_6255 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6252 ) ( ON-TABLE ?AUTO_6251 ) ( ON ?AUTO_6255 ?AUTO_6251 ) ( CLEAR ?AUTO_6255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6255 ?AUTO_6251 )
      ( MAKE-ON ?AUTO_6251 ?AUTO_6252 )
      ( MAKE-ON-VERIFY ?AUTO_6251 ?AUTO_6252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6258 - BLOCK
      ?AUTO_6259 - BLOCK
    )
    :vars
    (
      ?AUTO_6262 - BLOCK
      ?AUTO_6263 - BLOCK
      ?AUTO_6264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6259 ) ( ON-TABLE ?AUTO_6258 ) ( ON ?AUTO_6262 ?AUTO_6258 ) ( CLEAR ?AUTO_6262 ) ( HOLDING ?AUTO_6263 ) ( CLEAR ?AUTO_6264 ) )
    :subtasks
    ( ( !STACK ?AUTO_6263 ?AUTO_6264 )
      ( MAKE-ON ?AUTO_6258 ?AUTO_6259 )
      ( MAKE-ON-VERIFY ?AUTO_6258 ?AUTO_6259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6265 - BLOCK
      ?AUTO_6266 - BLOCK
    )
    :vars
    (
      ?AUTO_6269 - BLOCK
      ?AUTO_6271 - BLOCK
      ?AUTO_6270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6266 ) ( ON-TABLE ?AUTO_6265 ) ( ON ?AUTO_6269 ?AUTO_6265 ) ( CLEAR ?AUTO_6271 ) ( ON ?AUTO_6270 ?AUTO_6269 ) ( CLEAR ?AUTO_6270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6270 ?AUTO_6269 )
      ( MAKE-ON ?AUTO_6265 ?AUTO_6266 )
      ( MAKE-ON-VERIFY ?AUTO_6265 ?AUTO_6266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6274 - BLOCK
      ?AUTO_6275 - BLOCK
    )
    :vars
    (
      ?AUTO_6280 - BLOCK
      ?AUTO_6279 - BLOCK
      ?AUTO_6276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6274 ) ( ON ?AUTO_6280 ?AUTO_6274 ) ( CLEAR ?AUTO_6279 ) ( ON ?AUTO_6276 ?AUTO_6280 ) ( CLEAR ?AUTO_6276 ) ( HOLDING ?AUTO_6275 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6275 )
      ( MAKE-ON ?AUTO_6274 ?AUTO_6275 )
      ( MAKE-ON-VERIFY ?AUTO_6274 ?AUTO_6275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6282 - BLOCK
      ?AUTO_6283 - BLOCK
    )
    :vars
    (
      ?AUTO_6285 - BLOCK
      ?AUTO_6288 - BLOCK
      ?AUTO_6284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6282 ) ( ON ?AUTO_6285 ?AUTO_6282 ) ( CLEAR ?AUTO_6288 ) ( ON ?AUTO_6284 ?AUTO_6285 ) ( ON ?AUTO_6283 ?AUTO_6284 ) ( CLEAR ?AUTO_6283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6283 ?AUTO_6284 )
      ( MAKE-ON ?AUTO_6282 ?AUTO_6283 )
      ( MAKE-ON-VERIFY ?AUTO_6282 ?AUTO_6283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6291 - BLOCK
      ?AUTO_6292 - BLOCK
    )
    :vars
    (
      ?AUTO_6295 - BLOCK
      ?AUTO_6296 - BLOCK
      ?AUTO_6297 - BLOCK
      ?AUTO_6298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6291 ) ( ON ?AUTO_6295 ?AUTO_6291 ) ( CLEAR ?AUTO_6296 ) ( ON ?AUTO_6297 ?AUTO_6295 ) ( ON ?AUTO_6292 ?AUTO_6297 ) ( CLEAR ?AUTO_6292 ) ( HOLDING ?AUTO_6298 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6298 )
      ( MAKE-ON ?AUTO_6291 ?AUTO_6292 )
      ( MAKE-ON-VERIFY ?AUTO_6291 ?AUTO_6292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6299 - BLOCK
      ?AUTO_6300 - BLOCK
    )
    :vars
    (
      ?AUTO_6306 - BLOCK
      ?AUTO_6305 - BLOCK
      ?AUTO_6301 - BLOCK
      ?AUTO_6304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6299 ) ( ON ?AUTO_6306 ?AUTO_6299 ) ( CLEAR ?AUTO_6305 ) ( ON ?AUTO_6301 ?AUTO_6306 ) ( ON ?AUTO_6300 ?AUTO_6301 ) ( ON ?AUTO_6304 ?AUTO_6300 ) ( CLEAR ?AUTO_6304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6304 ?AUTO_6300 )
      ( MAKE-ON ?AUTO_6299 ?AUTO_6300 )
      ( MAKE-ON-VERIFY ?AUTO_6299 ?AUTO_6300 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6308 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6308 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6308 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6308 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6310 - BLOCK
    )
    :vars
    (
      ?AUTO_6313 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6310 ?AUTO_6313 ) ( CLEAR ?AUTO_6310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6310 ?AUTO_6313 )
      ( MAKE-ON-TABLE ?AUTO_6310 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6310 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6315 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6315 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6315 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6315 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6317 - BLOCK
    )
    :vars
    (
      ?AUTO_6320 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6317 ?AUTO_6320 ) ( CLEAR ?AUTO_6317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6317 ?AUTO_6320 )
      ( MAKE-ON-TABLE ?AUTO_6317 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6317 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6321 - BLOCK
    )
    :vars
    (
      ?AUTO_6323 - BLOCK
      ?AUTO_6324 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6321 ?AUTO_6323 ) ( CLEAR ?AUTO_6321 ) ( HOLDING ?AUTO_6324 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6324 )
      ( MAKE-ON-TABLE ?AUTO_6321 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6321 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6325 - BLOCK
    )
    :vars
    (
      ?AUTO_6326 - BLOCK
      ?AUTO_6328 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6325 ?AUTO_6326 ) ( ON ?AUTO_6328 ?AUTO_6325 ) ( CLEAR ?AUTO_6328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6328 ?AUTO_6325 )
      ( MAKE-ON-TABLE ?AUTO_6325 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6333 - BLOCK
      ?AUTO_6334 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6333 ) ( CLEAR ?AUTO_6334 ) )
    :subtasks
    ( ( !STACK ?AUTO_6333 ?AUTO_6334 )
      ( MAKE-ON-VERIFY ?AUTO_6333 ?AUTO_6334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6337 - BLOCK
      ?AUTO_6338 - BLOCK
    )
    :vars
    (
      ?AUTO_6342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6338 ) ( ON ?AUTO_6337 ?AUTO_6342 ) ( CLEAR ?AUTO_6337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6337 ?AUTO_6342 )
      ( MAKE-ON ?AUTO_6337 ?AUTO_6338 )
      ( MAKE-ON-VERIFY ?AUTO_6337 ?AUTO_6338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6343 - BLOCK
      ?AUTO_6344 - BLOCK
    )
    :vars
    (
      ?AUTO_6347 - BLOCK
      ?AUTO_6348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6344 ) ( ON ?AUTO_6343 ?AUTO_6347 ) ( CLEAR ?AUTO_6343 ) ( HOLDING ?AUTO_6348 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6348 )
      ( MAKE-ON ?AUTO_6343 ?AUTO_6344 )
      ( MAKE-ON-VERIFY ?AUTO_6343 ?AUTO_6344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6349 - BLOCK
      ?AUTO_6350 - BLOCK
    )
    :vars
    (
      ?AUTO_6353 - BLOCK
      ?AUTO_6354 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6349 ?AUTO_6353 ) ( CLEAR ?AUTO_6349 ) ( ON ?AUTO_6354 ?AUTO_6350 ) ( CLEAR ?AUTO_6354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6354 ?AUTO_6350 )
      ( MAKE-ON ?AUTO_6349 ?AUTO_6350 )
      ( MAKE-ON-VERIFY ?AUTO_6349 ?AUTO_6350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6357 - BLOCK
      ?AUTO_6358 - BLOCK
    )
    :vars
    (
      ?AUTO_6362 - BLOCK
      ?AUTO_6359 - BLOCK
      ?AUTO_6363 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6357 ?AUTO_6362 ) ( CLEAR ?AUTO_6357 ) ( ON ?AUTO_6359 ?AUTO_6358 ) ( CLEAR ?AUTO_6359 ) ( HOLDING ?AUTO_6363 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6363 )
      ( MAKE-ON ?AUTO_6357 ?AUTO_6358 )
      ( MAKE-ON-VERIFY ?AUTO_6357 ?AUTO_6358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6364 - BLOCK
      ?AUTO_6365 - BLOCK
    )
    :vars
    (
      ?AUTO_6367 - BLOCK
      ?AUTO_6366 - BLOCK
      ?AUTO_6370 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6364 ?AUTO_6367 ) ( CLEAR ?AUTO_6364 ) ( ON ?AUTO_6366 ?AUTO_6365 ) ( ON ?AUTO_6370 ?AUTO_6366 ) ( CLEAR ?AUTO_6370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6370 ?AUTO_6366 )
      ( MAKE-ON ?AUTO_6364 ?AUTO_6365 )
      ( MAKE-ON-VERIFY ?AUTO_6364 ?AUTO_6365 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6374 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6374 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6374 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6374 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6376 - BLOCK
    )
    :vars
    (
      ?AUTO_6379 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6376 ?AUTO_6379 ) ( CLEAR ?AUTO_6376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6376 ?AUTO_6379 )
      ( MAKE-ON-TABLE ?AUTO_6376 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6376 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6380 - BLOCK
    )
    :vars
    (
      ?AUTO_6382 - BLOCK
      ?AUTO_6383 - BLOCK
      ?AUTO_6384 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6380 ?AUTO_6382 ) ( CLEAR ?AUTO_6380 ) ( HOLDING ?AUTO_6383 ) ( CLEAR ?AUTO_6384 ) )
    :subtasks
    ( ( !STACK ?AUTO_6383 ?AUTO_6384 )
      ( MAKE-ON-TABLE ?AUTO_6380 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6380 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6385 - BLOCK
    )
    :vars
    (
      ?AUTO_6387 - BLOCK
      ?AUTO_6389 - BLOCK
      ?AUTO_6388 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6385 ?AUTO_6387 ) ( CLEAR ?AUTO_6389 ) ( ON ?AUTO_6388 ?AUTO_6385 ) ( CLEAR ?AUTO_6388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6388 ?AUTO_6385 )
      ( MAKE-ON-TABLE ?AUTO_6385 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6385 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6392 - BLOCK
    )
    :vars
    (
      ?AUTO_6395 - BLOCK
      ?AUTO_6393 - BLOCK
      ?AUTO_6396 - BLOCK
      ?AUTO_6397 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6392 ?AUTO_6395 ) ( CLEAR ?AUTO_6393 ) ( ON ?AUTO_6396 ?AUTO_6392 ) ( CLEAR ?AUTO_6396 ) ( HOLDING ?AUTO_6397 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6397 )
      ( MAKE-ON-TABLE ?AUTO_6392 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6403 - BLOCK
      ?AUTO_6404 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6403 ) ( CLEAR ?AUTO_6404 ) )
    :subtasks
    ( ( !STACK ?AUTO_6403 ?AUTO_6404 )
      ( MAKE-ON-VERIFY ?AUTO_6403 ?AUTO_6404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6407 - BLOCK
      ?AUTO_6408 - BLOCK
    )
    :vars
    (
      ?AUTO_6412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6408 ) ( ON ?AUTO_6407 ?AUTO_6412 ) ( CLEAR ?AUTO_6407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6407 ?AUTO_6412 )
      ( MAKE-ON ?AUTO_6407 ?AUTO_6408 )
      ( MAKE-ON-VERIFY ?AUTO_6407 ?AUTO_6408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6413 - BLOCK
      ?AUTO_6414 - BLOCK
    )
    :vars
    (
      ?AUTO_6417 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6413 ?AUTO_6417 ) ( CLEAR ?AUTO_6413 ) ( HOLDING ?AUTO_6414 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6414 )
      ( MAKE-ON ?AUTO_6413 ?AUTO_6414 )
      ( MAKE-ON-VERIFY ?AUTO_6413 ?AUTO_6414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6419 - BLOCK
      ?AUTO_6420 - BLOCK
    )
    :vars
    (
      ?AUTO_6423 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6419 ?AUTO_6423 ) ( ON ?AUTO_6420 ?AUTO_6419 ) ( CLEAR ?AUTO_6420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6420 ?AUTO_6419 )
      ( MAKE-ON ?AUTO_6419 ?AUTO_6420 )
      ( MAKE-ON-VERIFY ?AUTO_6419 ?AUTO_6420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6426 - BLOCK
      ?AUTO_6427 - BLOCK
    )
    :vars
    (
      ?AUTO_6430 - BLOCK
      ?AUTO_6431 - BLOCK
      ?AUTO_6432 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6426 ?AUTO_6430 ) ( ON ?AUTO_6427 ?AUTO_6426 ) ( CLEAR ?AUTO_6427 ) ( HOLDING ?AUTO_6431 ) ( CLEAR ?AUTO_6432 ) )
    :subtasks
    ( ( !STACK ?AUTO_6431 ?AUTO_6432 )
      ( MAKE-ON ?AUTO_6426 ?AUTO_6427 )
      ( MAKE-ON-VERIFY ?AUTO_6426 ?AUTO_6427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6433 - BLOCK
      ?AUTO_6434 - BLOCK
    )
    :vars
    (
      ?AUTO_6436 - BLOCK
      ?AUTO_6439 - BLOCK
      ?AUTO_6438 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6433 ?AUTO_6436 ) ( ON ?AUTO_6434 ?AUTO_6433 ) ( CLEAR ?AUTO_6439 ) ( ON ?AUTO_6438 ?AUTO_6434 ) ( CLEAR ?AUTO_6438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6438 ?AUTO_6434 )
      ( MAKE-ON ?AUTO_6433 ?AUTO_6434 )
      ( MAKE-ON-VERIFY ?AUTO_6433 ?AUTO_6434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6442 - BLOCK
      ?AUTO_6443 - BLOCK
    )
    :vars
    (
      ?AUTO_6448 - BLOCK
      ?AUTO_6444 - BLOCK
      ?AUTO_6445 - BLOCK
      ?AUTO_6449 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6442 ?AUTO_6448 ) ( ON ?AUTO_6443 ?AUTO_6442 ) ( CLEAR ?AUTO_6444 ) ( ON ?AUTO_6445 ?AUTO_6443 ) ( CLEAR ?AUTO_6445 ) ( HOLDING ?AUTO_6449 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6449 )
      ( MAKE-ON ?AUTO_6442 ?AUTO_6443 )
      ( MAKE-ON-VERIFY ?AUTO_6442 ?AUTO_6443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6458 - BLOCK
      ?AUTO_6459 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6458 ) ( CLEAR ?AUTO_6459 ) )
    :subtasks
    ( ( !STACK ?AUTO_6458 ?AUTO_6459 )
      ( MAKE-ON-VERIFY ?AUTO_6458 ?AUTO_6459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6462 - BLOCK
      ?AUTO_6463 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6463 ) ( ON-TABLE ?AUTO_6462 ) ( CLEAR ?AUTO_6462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6462 )
      ( MAKE-ON ?AUTO_6462 ?AUTO_6463 )
      ( MAKE-ON-VERIFY ?AUTO_6462 ?AUTO_6463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6467 - BLOCK
      ?AUTO_6468 - BLOCK
    )
    :vars
    (
      ?AUTO_6471 - BLOCK
      ?AUTO_6472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6468 ) ( ON-TABLE ?AUTO_6467 ) ( CLEAR ?AUTO_6467 ) ( HOLDING ?AUTO_6471 ) ( CLEAR ?AUTO_6472 ) )
    :subtasks
    ( ( !STACK ?AUTO_6471 ?AUTO_6472 )
      ( MAKE-ON ?AUTO_6467 ?AUTO_6468 )
      ( MAKE-ON-VERIFY ?AUTO_6467 ?AUTO_6468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6473 - BLOCK
      ?AUTO_6474 - BLOCK
    )
    :vars
    (
      ?AUTO_6476 - BLOCK
      ?AUTO_6478 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6474 ) ( ON-TABLE ?AUTO_6473 ) ( CLEAR ?AUTO_6476 ) ( ON ?AUTO_6478 ?AUTO_6473 ) ( CLEAR ?AUTO_6478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6478 ?AUTO_6473 )
      ( MAKE-ON ?AUTO_6473 ?AUTO_6474 )
      ( MAKE-ON-VERIFY ?AUTO_6473 ?AUTO_6474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6481 - BLOCK
      ?AUTO_6482 - BLOCK
    )
    :vars
    (
      ?AUTO_6486 - BLOCK
      ?AUTO_6485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6482 ) ( ON-TABLE ?AUTO_6481 ) ( ON ?AUTO_6486 ?AUTO_6481 ) ( CLEAR ?AUTO_6486 ) ( HOLDING ?AUTO_6485 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6485 )
      ( MAKE-ON ?AUTO_6481 ?AUTO_6482 )
      ( MAKE-ON-VERIFY ?AUTO_6481 ?AUTO_6482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6488 - BLOCK
      ?AUTO_6489 - BLOCK
    )
    :vars
    (
      ?AUTO_6492 - BLOCK
      ?AUTO_6493 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6489 ) ( ON-TABLE ?AUTO_6488 ) ( ON ?AUTO_6492 ?AUTO_6488 ) ( ON ?AUTO_6493 ?AUTO_6492 ) ( CLEAR ?AUTO_6493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6493 ?AUTO_6492 )
      ( MAKE-ON ?AUTO_6488 ?AUTO_6489 )
      ( MAKE-ON-VERIFY ?AUTO_6488 ?AUTO_6489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6496 - BLOCK
      ?AUTO_6497 - BLOCK
    )
    :vars
    (
      ?AUTO_6500 - BLOCK
      ?AUTO_6499 - BLOCK
      ?AUTO_6502 - BLOCK
      ?AUTO_6503 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6497 ) ( ON-TABLE ?AUTO_6496 ) ( ON ?AUTO_6500 ?AUTO_6496 ) ( ON ?AUTO_6499 ?AUTO_6500 ) ( CLEAR ?AUTO_6499 ) ( HOLDING ?AUTO_6502 ) ( CLEAR ?AUTO_6503 ) )
    :subtasks
    ( ( !STACK ?AUTO_6502 ?AUTO_6503 )
      ( MAKE-ON ?AUTO_6496 ?AUTO_6497 )
      ( MAKE-ON-VERIFY ?AUTO_6496 ?AUTO_6497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6504 - BLOCK
      ?AUTO_6505 - BLOCK
    )
    :vars
    (
      ?AUTO_6509 - BLOCK
      ?AUTO_6506 - BLOCK
      ?AUTO_6511 - BLOCK
      ?AUTO_6510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6505 ) ( ON-TABLE ?AUTO_6504 ) ( ON ?AUTO_6509 ?AUTO_6504 ) ( ON ?AUTO_6506 ?AUTO_6509 ) ( CLEAR ?AUTO_6511 ) ( ON ?AUTO_6510 ?AUTO_6506 ) ( CLEAR ?AUTO_6510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6510 ?AUTO_6506 )
      ( MAKE-ON ?AUTO_6504 ?AUTO_6505 )
      ( MAKE-ON-VERIFY ?AUTO_6504 ?AUTO_6505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6514 - BLOCK
      ?AUTO_6515 - BLOCK
    )
    :vars
    (
      ?AUTO_6521 - BLOCK
      ?AUTO_6520 - BLOCK
      ?AUTO_6518 - BLOCK
      ?AUTO_6519 - BLOCK
      ?AUTO_6522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6515 ) ( ON-TABLE ?AUTO_6514 ) ( ON ?AUTO_6521 ?AUTO_6514 ) ( ON ?AUTO_6520 ?AUTO_6521 ) ( CLEAR ?AUTO_6518 ) ( ON ?AUTO_6519 ?AUTO_6520 ) ( CLEAR ?AUTO_6519 ) ( HOLDING ?AUTO_6522 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6522 )
      ( MAKE-ON ?AUTO_6514 ?AUTO_6515 )
      ( MAKE-ON-VERIFY ?AUTO_6514 ?AUTO_6515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6525 - BLOCK
      ?AUTO_6526 - BLOCK
    )
    :vars
    (
      ?AUTO_6532 - BLOCK
      ?AUTO_6527 - BLOCK
      ?AUTO_6528 - BLOCK
      ?AUTO_6530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6525 ) ( ON ?AUTO_6532 ?AUTO_6525 ) ( ON ?AUTO_6527 ?AUTO_6532 ) ( CLEAR ?AUTO_6528 ) ( ON ?AUTO_6530 ?AUTO_6527 ) ( CLEAR ?AUTO_6530 ) ( HOLDING ?AUTO_6526 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6526 )
      ( MAKE-ON ?AUTO_6525 ?AUTO_6526 )
      ( MAKE-ON-VERIFY ?AUTO_6525 ?AUTO_6526 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6534 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6534 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6534 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6534 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6536 - BLOCK
    )
    :vars
    (
      ?AUTO_6539 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6536 ?AUTO_6539 ) ( CLEAR ?AUTO_6536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6536 ?AUTO_6539 )
      ( MAKE-ON-TABLE ?AUTO_6536 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6536 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6541 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6541 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6541 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6541 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6543 - BLOCK
    )
    :vars
    (
      ?AUTO_6546 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6543 ?AUTO_6546 ) ( CLEAR ?AUTO_6543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6543 ?AUTO_6546 )
      ( MAKE-ON-TABLE ?AUTO_6543 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6543 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6547 - BLOCK
    )
    :vars
    (
      ?AUTO_6549 - BLOCK
      ?AUTO_6550 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6547 ?AUTO_6549 ) ( CLEAR ?AUTO_6547 ) ( HOLDING ?AUTO_6550 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6550 )
      ( MAKE-ON-TABLE ?AUTO_6547 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6547 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6553 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6553 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6553 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6553 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6555 - BLOCK
    )
    :vars
    (
      ?AUTO_6558 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6555 ?AUTO_6558 ) ( CLEAR ?AUTO_6555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6555 ?AUTO_6558 )
      ( MAKE-ON-TABLE ?AUTO_6555 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6555 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6559 - BLOCK
    )
    :vars
    (
      ?AUTO_6561 - BLOCK
      ?AUTO_6562 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6559 ?AUTO_6561 ) ( CLEAR ?AUTO_6559 ) ( HOLDING ?AUTO_6562 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6562 )
      ( MAKE-ON-TABLE ?AUTO_6559 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6559 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6563 - BLOCK
    )
    :vars
    (
      ?AUTO_6565 - BLOCK
      ?AUTO_6566 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6563 ?AUTO_6565 ) ( ON ?AUTO_6566 ?AUTO_6563 ) ( CLEAR ?AUTO_6566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6566 ?AUTO_6563 )
      ( MAKE-ON-TABLE ?AUTO_6563 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6563 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6569 - BLOCK
    )
    :vars
    (
      ?AUTO_6570 - BLOCK
      ?AUTO_6571 - BLOCK
      ?AUTO_6573 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6569 ?AUTO_6570 ) ( ON ?AUTO_6571 ?AUTO_6569 ) ( CLEAR ?AUTO_6571 ) ( HOLDING ?AUTO_6573 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6573 )
      ( MAKE-ON-TABLE ?AUTO_6569 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6577 - BLOCK
      ?AUTO_6578 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6577 ) ( CLEAR ?AUTO_6578 ) )
    :subtasks
    ( ( !STACK ?AUTO_6577 ?AUTO_6578 )
      ( MAKE-ON-VERIFY ?AUTO_6577 ?AUTO_6578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6581 - BLOCK
      ?AUTO_6582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6582 ) ( ON-TABLE ?AUTO_6581 ) ( CLEAR ?AUTO_6581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6581 )
      ( MAKE-ON ?AUTO_6581 ?AUTO_6582 )
      ( MAKE-ON-VERIFY ?AUTO_6581 ?AUTO_6582 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6586 - BLOCK
      ?AUTO_6587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6586 ) ( CLEAR ?AUTO_6586 ) ( HOLDING ?AUTO_6587 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6587 )
      ( MAKE-ON ?AUTO_6586 ?AUTO_6587 )
      ( MAKE-ON-VERIFY ?AUTO_6586 ?AUTO_6587 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6618 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6618 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6618 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6618 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6620 - BLOCK
    )
    :vars
    (
      ?AUTO_6623 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6620 ?AUTO_6623 ) ( CLEAR ?AUTO_6620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6620 ?AUTO_6623 )
      ( MAKE-ON-TABLE ?AUTO_6620 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6620 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6624 - BLOCK
    )
    :vars
    (
      ?AUTO_6626 - BLOCK
      ?AUTO_6627 - BLOCK
      ?AUTO_6628 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6624 ?AUTO_6626 ) ( CLEAR ?AUTO_6624 ) ( HOLDING ?AUTO_6627 ) ( CLEAR ?AUTO_6628 ) )
    :subtasks
    ( ( !STACK ?AUTO_6627 ?AUTO_6628 )
      ( MAKE-ON-TABLE ?AUTO_6624 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6624 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6631 - BLOCK
    )
    :vars
    (
      ?AUTO_6633 - BLOCK
      ?AUTO_6635 - BLOCK
      ?AUTO_6632 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6631 ?AUTO_6633 ) ( CLEAR ?AUTO_6635 ) ( ON ?AUTO_6632 ?AUTO_6631 ) ( CLEAR ?AUTO_6632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6632 ?AUTO_6631 )
      ( MAKE-ON-TABLE ?AUTO_6631 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6631 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6638 - BLOCK
    )
    :vars
    (
      ?AUTO_6640 - BLOCK
      ?AUTO_6642 - BLOCK
      ?AUTO_6641 - BLOCK
      ?AUTO_6643 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6638 ?AUTO_6640 ) ( CLEAR ?AUTO_6642 ) ( ON ?AUTO_6641 ?AUTO_6638 ) ( CLEAR ?AUTO_6641 ) ( HOLDING ?AUTO_6643 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6643 )
      ( MAKE-ON-TABLE ?AUTO_6638 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6638 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6644 - BLOCK
    )
    :vars
    (
      ?AUTO_6646 - BLOCK
      ?AUTO_6645 - BLOCK
      ?AUTO_6649 - BLOCK
      ?AUTO_6648 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6644 ?AUTO_6646 ) ( CLEAR ?AUTO_6645 ) ( ON ?AUTO_6649 ?AUTO_6644 ) ( ON ?AUTO_6648 ?AUTO_6649 ) ( CLEAR ?AUTO_6648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6648 ?AUTO_6649 )
      ( MAKE-ON-TABLE ?AUTO_6644 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6644 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6652 - BLOCK
    )
    :vars
    (
      ?AUTO_6655 - BLOCK
      ?AUTO_6653 - BLOCK
      ?AUTO_6657 - BLOCK
      ?AUTO_6656 - BLOCK
      ?AUTO_6658 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6652 ?AUTO_6655 ) ( CLEAR ?AUTO_6653 ) ( ON ?AUTO_6657 ?AUTO_6652 ) ( ON ?AUTO_6656 ?AUTO_6657 ) ( CLEAR ?AUTO_6656 ) ( HOLDING ?AUTO_6658 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6658 )
      ( MAKE-ON-TABLE ?AUTO_6652 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6652 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6661 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6661 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6661 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6661 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6663 - BLOCK
    )
    :vars
    (
      ?AUTO_6666 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6663 ?AUTO_6666 ) ( CLEAR ?AUTO_6663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6663 ?AUTO_6666 )
      ( MAKE-ON-TABLE ?AUTO_6663 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6663 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6667 - BLOCK
    )
    :vars
    (
      ?AUTO_6669 - BLOCK
      ?AUTO_6670 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6667 ?AUTO_6669 ) ( CLEAR ?AUTO_6667 ) ( HOLDING ?AUTO_6670 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6670 )
      ( MAKE-ON-TABLE ?AUTO_6667 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6667 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6671 - BLOCK
    )
    :vars
    (
      ?AUTO_6673 - BLOCK
      ?AUTO_6674 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6671 ?AUTO_6673 ) ( ON ?AUTO_6674 ?AUTO_6671 ) ( CLEAR ?AUTO_6674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6674 ?AUTO_6671 )
      ( MAKE-ON-TABLE ?AUTO_6671 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6671 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6677 - BLOCK
    )
    :vars
    (
      ?AUTO_6678 - BLOCK
      ?AUTO_6679 - BLOCK
      ?AUTO_6681 - BLOCK
      ?AUTO_6682 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6677 ?AUTO_6678 ) ( ON ?AUTO_6679 ?AUTO_6677 ) ( CLEAR ?AUTO_6679 ) ( HOLDING ?AUTO_6681 ) ( CLEAR ?AUTO_6682 ) )
    :subtasks
    ( ( !STACK ?AUTO_6681 ?AUTO_6682 )
      ( MAKE-ON-TABLE ?AUTO_6677 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6677 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6685 - BLOCK
    )
    :vars
    (
      ?AUTO_6690 - BLOCK
      ?AUTO_6688 - BLOCK
      ?AUTO_6687 - BLOCK
      ?AUTO_6686 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6685 ?AUTO_6690 ) ( ON ?AUTO_6688 ?AUTO_6685 ) ( CLEAR ?AUTO_6687 ) ( ON ?AUTO_6686 ?AUTO_6688 ) ( CLEAR ?AUTO_6686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6686 ?AUTO_6688 )
      ( MAKE-ON-TABLE ?AUTO_6685 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6685 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6693 - BLOCK
    )
    :vars
    (
      ?AUTO_6698 - BLOCK
      ?AUTO_6697 - BLOCK
      ?AUTO_6696 - BLOCK
      ?AUTO_6695 - BLOCK
      ?AUTO_6699 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6693 ?AUTO_6698 ) ( ON ?AUTO_6697 ?AUTO_6693 ) ( CLEAR ?AUTO_6696 ) ( ON ?AUTO_6695 ?AUTO_6697 ) ( CLEAR ?AUTO_6695 ) ( HOLDING ?AUTO_6699 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6699 )
      ( MAKE-ON-TABLE ?AUTO_6693 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6693 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6700 - BLOCK
    )
    :vars
    (
      ?AUTO_6702 - BLOCK
      ?AUTO_6705 - BLOCK
      ?AUTO_6701 - BLOCK
      ?AUTO_6703 - BLOCK
      ?AUTO_6706 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6700 ?AUTO_6702 ) ( ON ?AUTO_6705 ?AUTO_6700 ) ( CLEAR ?AUTO_6701 ) ( ON ?AUTO_6703 ?AUTO_6705 ) ( ON ?AUTO_6706 ?AUTO_6703 ) ( CLEAR ?AUTO_6706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6706 ?AUTO_6703 )
      ( MAKE-ON-TABLE ?AUTO_6700 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6700 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6709 - BLOCK
    )
    :vars
    (
      ?AUTO_6712 - BLOCK
      ?AUTO_6713 - BLOCK
      ?AUTO_6715 - BLOCK
      ?AUTO_6710 - BLOCK
      ?AUTO_6714 - BLOCK
      ?AUTO_6716 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6709 ?AUTO_6712 ) ( ON ?AUTO_6713 ?AUTO_6709 ) ( CLEAR ?AUTO_6715 ) ( ON ?AUTO_6710 ?AUTO_6713 ) ( ON ?AUTO_6714 ?AUTO_6710 ) ( CLEAR ?AUTO_6714 ) ( HOLDING ?AUTO_6716 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6716 )
      ( MAKE-ON-TABLE ?AUTO_6709 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6720 - BLOCK
      ?AUTO_6721 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6720 ) ( CLEAR ?AUTO_6721 ) )
    :subtasks
    ( ( !STACK ?AUTO_6720 ?AUTO_6721 )
      ( MAKE-ON-VERIFY ?AUTO_6720 ?AUTO_6721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6724 - BLOCK
      ?AUTO_6725 - BLOCK
    )
    :vars
    (
      ?AUTO_6729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6725 ) ( ON ?AUTO_6724 ?AUTO_6729 ) ( CLEAR ?AUTO_6724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6724 ?AUTO_6729 )
      ( MAKE-ON ?AUTO_6724 ?AUTO_6725 )
      ( MAKE-ON-VERIFY ?AUTO_6724 ?AUTO_6725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6730 - BLOCK
      ?AUTO_6731 - BLOCK
    )
    :vars
    (
      ?AUTO_6734 - BLOCK
      ?AUTO_6735 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6731 ) ( ON ?AUTO_6730 ?AUTO_6734 ) ( CLEAR ?AUTO_6730 ) ( HOLDING ?AUTO_6735 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6735 )
      ( MAKE-ON ?AUTO_6730 ?AUTO_6731 )
      ( MAKE-ON-VERIFY ?AUTO_6730 ?AUTO_6731 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6736 - BLOCK
      ?AUTO_6737 - BLOCK
    )
    :vars
    (
      ?AUTO_6740 - BLOCK
      ?AUTO_6741 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6736 ?AUTO_6740 ) ( CLEAR ?AUTO_6736 ) ( ON ?AUTO_6741 ?AUTO_6737 ) ( CLEAR ?AUTO_6741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6741 ?AUTO_6737 )
      ( MAKE-ON ?AUTO_6736 ?AUTO_6737 )
      ( MAKE-ON-VERIFY ?AUTO_6736 ?AUTO_6737 ) )
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
      ?AUTO_6746 - BLOCK
      ?AUTO_6750 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6744 ?AUTO_6749 ) ( CLEAR ?AUTO_6744 ) ( ON ?AUTO_6746 ?AUTO_6745 ) ( CLEAR ?AUTO_6746 ) ( HOLDING ?AUTO_6750 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6750 )
      ( MAKE-ON ?AUTO_6744 ?AUTO_6745 )
      ( MAKE-ON-VERIFY ?AUTO_6744 ?AUTO_6745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6751 - BLOCK
      ?AUTO_6752 - BLOCK
    )
    :vars
    (
      ?AUTO_6756 - BLOCK
      ?AUTO_6753 - BLOCK
      ?AUTO_6757 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6751 ?AUTO_6756 ) ( CLEAR ?AUTO_6751 ) ( ON ?AUTO_6753 ?AUTO_6752 ) ( ON ?AUTO_6757 ?AUTO_6753 ) ( CLEAR ?AUTO_6757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6757 ?AUTO_6753 )
      ( MAKE-ON ?AUTO_6751 ?AUTO_6752 )
      ( MAKE-ON-VERIFY ?AUTO_6751 ?AUTO_6752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6760 - BLOCK
      ?AUTO_6761 - BLOCK
    )
    :vars
    (
      ?AUTO_6766 - BLOCK
      ?AUTO_6763 - BLOCK
      ?AUTO_6764 - BLOCK
      ?AUTO_6767 - BLOCK
      ?AUTO_6768 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6760 ?AUTO_6766 ) ( CLEAR ?AUTO_6760 ) ( ON ?AUTO_6763 ?AUTO_6761 ) ( ON ?AUTO_6764 ?AUTO_6763 ) ( CLEAR ?AUTO_6764 ) ( HOLDING ?AUTO_6767 ) ( CLEAR ?AUTO_6768 ) )
    :subtasks
    ( ( !STACK ?AUTO_6767 ?AUTO_6768 )
      ( MAKE-ON ?AUTO_6760 ?AUTO_6761 )
      ( MAKE-ON-VERIFY ?AUTO_6760 ?AUTO_6761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6773 - BLOCK
      ?AUTO_6774 - BLOCK
    )
    :vars
    (
      ?AUTO_6776 - BLOCK
      ?AUTO_6780 - BLOCK
      ?AUTO_6781 - BLOCK
      ?AUTO_6775 - BLOCK
      ?AUTO_6779 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6773 ?AUTO_6776 ) ( CLEAR ?AUTO_6773 ) ( ON ?AUTO_6780 ?AUTO_6774 ) ( ON ?AUTO_6781 ?AUTO_6780 ) ( CLEAR ?AUTO_6775 ) ( ON ?AUTO_6779 ?AUTO_6781 ) ( CLEAR ?AUTO_6779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6779 ?AUTO_6781 )
      ( MAKE-ON ?AUTO_6773 ?AUTO_6774 )
      ( MAKE-ON-VERIFY ?AUTO_6773 ?AUTO_6774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6784 - BLOCK
      ?AUTO_6785 - BLOCK
    )
    :vars
    (
      ?AUTO_6789 - BLOCK
      ?AUTO_6790 - BLOCK
      ?AUTO_6791 - BLOCK
      ?AUTO_6788 - BLOCK
      ?AUTO_6792 - BLOCK
      ?AUTO_6793 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6784 ?AUTO_6789 ) ( CLEAR ?AUTO_6784 ) ( ON ?AUTO_6790 ?AUTO_6785 ) ( ON ?AUTO_6791 ?AUTO_6790 ) ( CLEAR ?AUTO_6788 ) ( ON ?AUTO_6792 ?AUTO_6791 ) ( CLEAR ?AUTO_6792 ) ( HOLDING ?AUTO_6793 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6793 )
      ( MAKE-ON ?AUTO_6784 ?AUTO_6785 )
      ( MAKE-ON-VERIFY ?AUTO_6784 ?AUTO_6785 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6794 - BLOCK
      ?AUTO_6795 - BLOCK
    )
    :vars
    (
      ?AUTO_6796 - BLOCK
      ?AUTO_6797 - BLOCK
      ?AUTO_6799 - BLOCK
      ?AUTO_6802 - BLOCK
      ?AUTO_6798 - BLOCK
      ?AUTO_6803 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6794 ?AUTO_6796 ) ( CLEAR ?AUTO_6794 ) ( ON ?AUTO_6797 ?AUTO_6795 ) ( ON ?AUTO_6799 ?AUTO_6797 ) ( CLEAR ?AUTO_6802 ) ( ON ?AUTO_6798 ?AUTO_6799 ) ( ON ?AUTO_6803 ?AUTO_6798 ) ( CLEAR ?AUTO_6803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6803 ?AUTO_6798 )
      ( MAKE-ON ?AUTO_6794 ?AUTO_6795 )
      ( MAKE-ON-VERIFY ?AUTO_6794 ?AUTO_6795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6806 - BLOCK
      ?AUTO_6807 - BLOCK
    )
    :vars
    (
      ?AUTO_6809 - BLOCK
      ?AUTO_6812 - BLOCK
      ?AUTO_6814 - BLOCK
      ?AUTO_6811 - BLOCK
      ?AUTO_6815 - BLOCK
      ?AUTO_6810 - BLOCK
      ?AUTO_6816 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6806 ?AUTO_6809 ) ( CLEAR ?AUTO_6806 ) ( ON ?AUTO_6812 ?AUTO_6807 ) ( ON ?AUTO_6814 ?AUTO_6812 ) ( CLEAR ?AUTO_6811 ) ( ON ?AUTO_6815 ?AUTO_6814 ) ( ON ?AUTO_6810 ?AUTO_6815 ) ( CLEAR ?AUTO_6810 ) ( HOLDING ?AUTO_6816 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6816 )
      ( MAKE-ON ?AUTO_6806 ?AUTO_6807 )
      ( MAKE-ON-VERIFY ?AUTO_6806 ?AUTO_6807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6819 - BLOCK
      ?AUTO_6818 - BLOCK
    )
    :vars
    (
      ?AUTO_6826 - BLOCK
      ?AUTO_6827 - BLOCK
      ?AUTO_6820 - BLOCK
      ?AUTO_6821 - BLOCK
      ?AUTO_6822 - BLOCK
      ?AUTO_6823 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6819 ?AUTO_6826 ) ( ON ?AUTO_6827 ?AUTO_6818 ) ( ON ?AUTO_6820 ?AUTO_6827 ) ( ON ?AUTO_6821 ?AUTO_6820 ) ( ON ?AUTO_6822 ?AUTO_6821 ) ( CLEAR ?AUTO_6822 ) ( ON ?AUTO_6823 ?AUTO_6819 ) ( CLEAR ?AUTO_6823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6823 ?AUTO_6819 )
      ( MAKE-ON ?AUTO_6819 ?AUTO_6818 )
      ( MAKE-ON-VERIFY ?AUTO_6819 ?AUTO_6818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6832 - BLOCK
      ?AUTO_6833 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6832 ) ( CLEAR ?AUTO_6833 ) )
    :subtasks
    ( ( !STACK ?AUTO_6832 ?AUTO_6833 )
      ( MAKE-ON-VERIFY ?AUTO_6832 ?AUTO_6833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6836 - BLOCK
      ?AUTO_6837 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6837 ) ( ON-TABLE ?AUTO_6836 ) ( CLEAR ?AUTO_6836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6836 )
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
      ?AUTO_6846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6841 ) ( CLEAR ?AUTO_6841 ) ( HOLDING ?AUTO_6842 ) ( CLEAR ?AUTO_6846 ) )
    :subtasks
    ( ( !STACK ?AUTO_6842 ?AUTO_6846 )
      ( MAKE-ON ?AUTO_6841 ?AUTO_6842 )
      ( MAKE-ON-VERIFY ?AUTO_6841 ?AUTO_6842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6855 - BLOCK
      ?AUTO_6856 - BLOCK
    )
    :vars
    (
      ?AUTO_6860 - BLOCK
      ?AUTO_6857 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6856 ) ( ON ?AUTO_6855 ?AUTO_6860 ) ( ON ?AUTO_6857 ?AUTO_6855 ) ( CLEAR ?AUTO_6857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6857 ?AUTO_6855 )
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
      ?AUTO_6869 - BLOCK
      ?AUTO_6870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6864 ) ( ON ?AUTO_6863 ?AUTO_6868 ) ( ON ?AUTO_6867 ?AUTO_6863 ) ( CLEAR ?AUTO_6867 ) ( HOLDING ?AUTO_6869 ) ( CLEAR ?AUTO_6870 ) )
    :subtasks
    ( ( !STACK ?AUTO_6869 ?AUTO_6870 )
      ( MAKE-ON ?AUTO_6863 ?AUTO_6864 )
      ( MAKE-ON-VERIFY ?AUTO_6863 ?AUTO_6864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6875 - BLOCK
      ?AUTO_6876 - BLOCK
    )
    :vars
    (
      ?AUTO_6877 - BLOCK
      ?AUTO_6878 - BLOCK
      ?AUTO_6882 - BLOCK
      ?AUTO_6879 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6876 ) ( ON ?AUTO_6875 ?AUTO_6877 ) ( ON ?AUTO_6878 ?AUTO_6875 ) ( CLEAR ?AUTO_6882 ) ( ON ?AUTO_6879 ?AUTO_6878 ) ( CLEAR ?AUTO_6879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6879 ?AUTO_6878 )
      ( MAKE-ON ?AUTO_6875 ?AUTO_6876 )
      ( MAKE-ON-VERIFY ?AUTO_6875 ?AUTO_6876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6885 - BLOCK
      ?AUTO_6886 - BLOCK
    )
    :vars
    (
      ?AUTO_6889 - BLOCK
      ?AUTO_6890 - BLOCK
      ?AUTO_6891 - BLOCK
      ?AUTO_6892 - BLOCK
      ?AUTO_6893 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6886 ) ( ON ?AUTO_6885 ?AUTO_6889 ) ( ON ?AUTO_6890 ?AUTO_6885 ) ( CLEAR ?AUTO_6891 ) ( ON ?AUTO_6892 ?AUTO_6890 ) ( CLEAR ?AUTO_6892 ) ( HOLDING ?AUTO_6893 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6893 )
      ( MAKE-ON ?AUTO_6885 ?AUTO_6886 )
      ( MAKE-ON-VERIFY ?AUTO_6885 ?AUTO_6886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6894 - BLOCK
      ?AUTO_6895 - BLOCK
    )
    :vars
    (
      ?AUTO_6902 - BLOCK
      ?AUTO_6896 - BLOCK
      ?AUTO_6897 - BLOCK
      ?AUTO_6898 - BLOCK
      ?AUTO_6901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6895 ) ( ON ?AUTO_6894 ?AUTO_6902 ) ( ON ?AUTO_6896 ?AUTO_6894 ) ( CLEAR ?AUTO_6897 ) ( ON ?AUTO_6898 ?AUTO_6896 ) ( ON ?AUTO_6901 ?AUTO_6898 ) ( CLEAR ?AUTO_6901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6901 ?AUTO_6898 )
      ( MAKE-ON ?AUTO_6894 ?AUTO_6895 )
      ( MAKE-ON-VERIFY ?AUTO_6894 ?AUTO_6895 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6905 - BLOCK
      ?AUTO_6906 - BLOCK
    )
    :vars
    (
      ?AUTO_6913 - BLOCK
      ?AUTO_6910 - BLOCK
      ?AUTO_6909 - BLOCK
      ?AUTO_6912 - BLOCK
      ?AUTO_6911 - BLOCK
      ?AUTO_6914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6906 ) ( ON ?AUTO_6905 ?AUTO_6913 ) ( ON ?AUTO_6910 ?AUTO_6905 ) ( CLEAR ?AUTO_6909 ) ( ON ?AUTO_6912 ?AUTO_6910 ) ( ON ?AUTO_6911 ?AUTO_6912 ) ( CLEAR ?AUTO_6911 ) ( HOLDING ?AUTO_6914 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6914 )
      ( MAKE-ON ?AUTO_6905 ?AUTO_6906 )
      ( MAKE-ON-VERIFY ?AUTO_6905 ?AUTO_6906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6915 - BLOCK
      ?AUTO_6918 - BLOCK
    )
    :vars
    (
      ?AUTO_6923 - BLOCK
      ?AUTO_6922 - BLOCK
      ?AUTO_6919 - BLOCK
      ?AUTO_6917 - BLOCK
      ?AUTO_6924 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6915 ?AUTO_6923 ) ( ON ?AUTO_6922 ?AUTO_6915 ) ( ON ?AUTO_6919 ?AUTO_6922 ) ( ON ?AUTO_6917 ?AUTO_6919 ) ( CLEAR ?AUTO_6917 ) ( ON ?AUTO_6924 ?AUTO_6918 ) ( CLEAR ?AUTO_6924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6924 ?AUTO_6918 )
      ( MAKE-ON ?AUTO_6915 ?AUTO_6918 )
      ( MAKE-ON-VERIFY ?AUTO_6915 ?AUTO_6918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6929 - BLOCK
      ?AUTO_6930 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6929 ) ( CLEAR ?AUTO_6930 ) )
    :subtasks
    ( ( !STACK ?AUTO_6929 ?AUTO_6930 )
      ( MAKE-ON-VERIFY ?AUTO_6929 ?AUTO_6930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6933 - BLOCK
      ?AUTO_6934 - BLOCK
    )
    :vars
    (
      ?AUTO_6938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6934 ) ( ON ?AUTO_6933 ?AUTO_6938 ) ( CLEAR ?AUTO_6933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6933 ?AUTO_6938 )
      ( MAKE-ON ?AUTO_6933 ?AUTO_6934 )
      ( MAKE-ON-VERIFY ?AUTO_6933 ?AUTO_6934 ) )
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
    ( and ( ON ?AUTO_6939 ?AUTO_6943 ) ( CLEAR ?AUTO_6939 ) ( HOLDING ?AUTO_6940 ) ( CLEAR ?AUTO_6945 ) )
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
      ?AUTO_6951 - BLOCK
      ?AUTO_6953 - BLOCK
      ?AUTO_6954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6949 ) ( ON ?AUTO_6948 ?AUTO_6951 ) ( CLEAR ?AUTO_6948 ) ( HOLDING ?AUTO_6953 ) ( CLEAR ?AUTO_6954 ) )
    :subtasks
    ( ( !STACK ?AUTO_6953 ?AUTO_6954 )
      ( MAKE-ON ?AUTO_6948 ?AUTO_6949 )
      ( MAKE-ON-VERIFY ?AUTO_6948 ?AUTO_6949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6955 - BLOCK
      ?AUTO_6956 - BLOCK
    )
    :vars
    (
      ?AUTO_6959 - BLOCK
      ?AUTO_6961 - BLOCK
      ?AUTO_6960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6956 ) ( ON ?AUTO_6955 ?AUTO_6959 ) ( CLEAR ?AUTO_6961 ) ( ON ?AUTO_6960 ?AUTO_6955 ) ( CLEAR ?AUTO_6960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6960 ?AUTO_6955 )
      ( MAKE-ON ?AUTO_6955 ?AUTO_6956 )
      ( MAKE-ON-VERIFY ?AUTO_6955 ?AUTO_6956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6964 - BLOCK
      ?AUTO_6965 - BLOCK
    )
    :vars
    (
      ?AUTO_6970 - BLOCK
      ?AUTO_6966 - BLOCK
      ?AUTO_6969 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6964 ?AUTO_6970 ) ( CLEAR ?AUTO_6966 ) ( ON ?AUTO_6969 ?AUTO_6964 ) ( CLEAR ?AUTO_6969 ) ( HOLDING ?AUTO_6965 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6965 )
      ( MAKE-ON ?AUTO_6964 ?AUTO_6965 )
      ( MAKE-ON-VERIFY ?AUTO_6964 ?AUTO_6965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6974 - BLOCK
      ?AUTO_6975 - BLOCK
    )
    :vars
    (
      ?AUTO_6980 - BLOCK
      ?AUTO_6977 - BLOCK
      ?AUTO_6979 - BLOCK
      ?AUTO_6981 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6975 ) ( ON ?AUTO_6974 ?AUTO_6980 ) ( CLEAR ?AUTO_6977 ) ( ON ?AUTO_6979 ?AUTO_6974 ) ( CLEAR ?AUTO_6979 ) ( HOLDING ?AUTO_6981 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6981 )
      ( MAKE-ON ?AUTO_6974 ?AUTO_6975 )
      ( MAKE-ON-VERIFY ?AUTO_6974 ?AUTO_6975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6982 - BLOCK
      ?AUTO_6983 - BLOCK
    )
    :vars
    (
      ?AUTO_6988 - BLOCK
      ?AUTO_6987 - BLOCK
      ?AUTO_6989 - BLOCK
      ?AUTO_6985 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6982 ?AUTO_6988 ) ( CLEAR ?AUTO_6987 ) ( ON ?AUTO_6989 ?AUTO_6982 ) ( CLEAR ?AUTO_6989 ) ( ON ?AUTO_6985 ?AUTO_6983 ) ( CLEAR ?AUTO_6985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6985 ?AUTO_6983 )
      ( MAKE-ON ?AUTO_6982 ?AUTO_6983 )
      ( MAKE-ON-VERIFY ?AUTO_6982 ?AUTO_6983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6992 - BLOCK
      ?AUTO_6993 - BLOCK
    )
    :vars
    (
      ?AUTO_6997 - BLOCK
      ?AUTO_6998 - BLOCK
      ?AUTO_6994 - BLOCK
      ?AUTO_6995 - BLOCK
      ?AUTO_7000 - BLOCK
      ?AUTO_7001 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6992 ?AUTO_6997 ) ( CLEAR ?AUTO_6998 ) ( ON ?AUTO_6994 ?AUTO_6992 ) ( CLEAR ?AUTO_6994 ) ( ON ?AUTO_6995 ?AUTO_6993 ) ( CLEAR ?AUTO_6995 ) ( HOLDING ?AUTO_7000 ) ( CLEAR ?AUTO_7001 ) )
    :subtasks
    ( ( !STACK ?AUTO_7000 ?AUTO_7001 )
      ( MAKE-ON ?AUTO_6992 ?AUTO_6993 )
      ( MAKE-ON-VERIFY ?AUTO_6992 ?AUTO_6993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7006 - BLOCK
      ?AUTO_7007 - BLOCK
    )
    :vars
    (
      ?AUTO_7013 - BLOCK
      ?AUTO_7015 - BLOCK
      ?AUTO_7014 - BLOCK
      ?AUTO_7011 - BLOCK
      ?AUTO_7010 - BLOCK
      ?AUTO_7008 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7006 ?AUTO_7013 ) ( CLEAR ?AUTO_7015 ) ( ON ?AUTO_7014 ?AUTO_7006 ) ( CLEAR ?AUTO_7014 ) ( ON ?AUTO_7011 ?AUTO_7007 ) ( CLEAR ?AUTO_7010 ) ( ON ?AUTO_7008 ?AUTO_7011 ) ( CLEAR ?AUTO_7008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7008 ?AUTO_7011 )
      ( MAKE-ON ?AUTO_7006 ?AUTO_7007 )
      ( MAKE-ON-VERIFY ?AUTO_7006 ?AUTO_7007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7018 - BLOCK
      ?AUTO_7019 - BLOCK
    )
    :vars
    (
      ?AUTO_7024 - BLOCK
      ?AUTO_7027 - BLOCK
      ?AUTO_7022 - BLOCK
      ?AUTO_7025 - BLOCK
      ?AUTO_7023 - BLOCK
      ?AUTO_7026 - BLOCK
      ?AUTO_7028 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7018 ?AUTO_7024 ) ( CLEAR ?AUTO_7027 ) ( ON ?AUTO_7022 ?AUTO_7018 ) ( CLEAR ?AUTO_7022 ) ( ON ?AUTO_7025 ?AUTO_7019 ) ( CLEAR ?AUTO_7023 ) ( ON ?AUTO_7026 ?AUTO_7025 ) ( CLEAR ?AUTO_7026 ) ( HOLDING ?AUTO_7028 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7028 )
      ( MAKE-ON ?AUTO_7018 ?AUTO_7019 )
      ( MAKE-ON-VERIFY ?AUTO_7018 ?AUTO_7019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7029 - BLOCK
      ?AUTO_7030 - BLOCK
    )
    :vars
    (
      ?AUTO_7031 - BLOCK
      ?AUTO_7037 - BLOCK
      ?AUTO_7038 - BLOCK
      ?AUTO_7035 - BLOCK
      ?AUTO_7034 - BLOCK
      ?AUTO_7036 - BLOCK
      ?AUTO_7039 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7029 ?AUTO_7031 ) ( CLEAR ?AUTO_7037 ) ( ON ?AUTO_7038 ?AUTO_7029 ) ( CLEAR ?AUTO_7038 ) ( ON ?AUTO_7035 ?AUTO_7030 ) ( CLEAR ?AUTO_7034 ) ( ON ?AUTO_7036 ?AUTO_7035 ) ( ON ?AUTO_7039 ?AUTO_7036 ) ( CLEAR ?AUTO_7039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7039 ?AUTO_7036 )
      ( MAKE-ON ?AUTO_7029 ?AUTO_7030 )
      ( MAKE-ON-VERIFY ?AUTO_7029 ?AUTO_7030 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7042 - BLOCK
      ?AUTO_7043 - BLOCK
    )
    :vars
    (
      ?AUTO_7052 - BLOCK
      ?AUTO_7048 - BLOCK
      ?AUTO_7051 - BLOCK
      ?AUTO_7045 - BLOCK
      ?AUTO_7046 - BLOCK
      ?AUTO_7047 - BLOCK
      ?AUTO_7050 - BLOCK
      ?AUTO_7053 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7042 ?AUTO_7052 ) ( CLEAR ?AUTO_7048 ) ( ON ?AUTO_7051 ?AUTO_7042 ) ( CLEAR ?AUTO_7051 ) ( ON ?AUTO_7045 ?AUTO_7043 ) ( CLEAR ?AUTO_7046 ) ( ON ?AUTO_7047 ?AUTO_7045 ) ( ON ?AUTO_7050 ?AUTO_7047 ) ( CLEAR ?AUTO_7050 ) ( HOLDING ?AUTO_7053 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7053 )
      ( MAKE-ON ?AUTO_7042 ?AUTO_7043 )
      ( MAKE-ON-VERIFY ?AUTO_7042 ?AUTO_7043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7054 - BLOCK
      ?AUTO_7055 - BLOCK
    )
    :vars
    (
      ?AUTO_7057 - BLOCK
      ?AUTO_7064 - BLOCK
      ?AUTO_7056 - BLOCK
      ?AUTO_7063 - BLOCK
      ?AUTO_7059 - BLOCK
      ?AUTO_7065 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7054 ?AUTO_7057 ) ( ON ?AUTO_7064 ?AUTO_7054 ) ( ON ?AUTO_7056 ?AUTO_7055 ) ( ON ?AUTO_7063 ?AUTO_7056 ) ( ON ?AUTO_7059 ?AUTO_7063 ) ( CLEAR ?AUTO_7059 ) ( ON ?AUTO_7065 ?AUTO_7064 ) ( CLEAR ?AUTO_7065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7065 ?AUTO_7064 )
      ( MAKE-ON ?AUTO_7054 ?AUTO_7055 )
      ( MAKE-ON-VERIFY ?AUTO_7054 ?AUTO_7055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7070 - BLOCK
      ?AUTO_7071 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7070 ) ( CLEAR ?AUTO_7071 ) )
    :subtasks
    ( ( !STACK ?AUTO_7070 ?AUTO_7071 )
      ( MAKE-ON-VERIFY ?AUTO_7070 ?AUTO_7071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7074 - BLOCK
      ?AUTO_7075 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7075 ) ( ON-TABLE ?AUTO_7074 ) ( CLEAR ?AUTO_7074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7074 )
      ( MAKE-ON ?AUTO_7074 ?AUTO_7075 )
      ( MAKE-ON-VERIFY ?AUTO_7074 ?AUTO_7075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7079 - BLOCK
      ?AUTO_7080 - BLOCK
    )
    :vars
    (
      ?AUTO_7083 - BLOCK
      ?AUTO_7084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7080 ) ( ON-TABLE ?AUTO_7079 ) ( CLEAR ?AUTO_7079 ) ( HOLDING ?AUTO_7083 ) ( CLEAR ?AUTO_7084 ) )
    :subtasks
    ( ( !STACK ?AUTO_7083 ?AUTO_7084 )
      ( MAKE-ON ?AUTO_7079 ?AUTO_7080 )
      ( MAKE-ON-VERIFY ?AUTO_7079 ?AUTO_7080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7085 - BLOCK
      ?AUTO_7086 - BLOCK
    )
    :vars
    (
      ?AUTO_7090 - BLOCK
      ?AUTO_7089 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7086 ) ( ON-TABLE ?AUTO_7085 ) ( CLEAR ?AUTO_7090 ) ( ON ?AUTO_7089 ?AUTO_7085 ) ( CLEAR ?AUTO_7089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7089 ?AUTO_7085 )
      ( MAKE-ON ?AUTO_7085 ?AUTO_7086 )
      ( MAKE-ON-VERIFY ?AUTO_7085 ?AUTO_7086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7093 - BLOCK
      ?AUTO_7094 - BLOCK
    )
    :vars
    (
      ?AUTO_7096 - BLOCK
      ?AUTO_7095 - BLOCK
      ?AUTO_7100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7094 ) ( ON-TABLE ?AUTO_7093 ) ( ON ?AUTO_7096 ?AUTO_7093 ) ( CLEAR ?AUTO_7096 ) ( HOLDING ?AUTO_7095 ) ( CLEAR ?AUTO_7100 ) )
    :subtasks
    ( ( !STACK ?AUTO_7095 ?AUTO_7100 )
      ( MAKE-ON ?AUTO_7093 ?AUTO_7094 )
      ( MAKE-ON-VERIFY ?AUTO_7093 ?AUTO_7094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7105 - BLOCK
      ?AUTO_7106 - BLOCK
    )
    :vars
    (
      ?AUTO_7107 - BLOCK
      ?AUTO_7111 - BLOCK
      ?AUTO_7108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7106 ) ( ON-TABLE ?AUTO_7105 ) ( ON ?AUTO_7107 ?AUTO_7105 ) ( CLEAR ?AUTO_7111 ) ( ON ?AUTO_7108 ?AUTO_7107 ) ( CLEAR ?AUTO_7108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7108 ?AUTO_7107 )
      ( MAKE-ON ?AUTO_7105 ?AUTO_7106 )
      ( MAKE-ON-VERIFY ?AUTO_7105 ?AUTO_7106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7114 - BLOCK
      ?AUTO_7115 - BLOCK
    )
    :vars
    (
      ?AUTO_7118 - BLOCK
      ?AUTO_7120 - BLOCK
      ?AUTO_7119 - BLOCK
      ?AUTO_7121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7115 ) ( ON-TABLE ?AUTO_7114 ) ( ON ?AUTO_7118 ?AUTO_7114 ) ( CLEAR ?AUTO_7120 ) ( ON ?AUTO_7119 ?AUTO_7118 ) ( CLEAR ?AUTO_7119 ) ( HOLDING ?AUTO_7121 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7121 )
      ( MAKE-ON ?AUTO_7114 ?AUTO_7115 )
      ( MAKE-ON-VERIFY ?AUTO_7114 ?AUTO_7115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7128 - BLOCK
      ?AUTO_7129 - BLOCK
    )
    :vars
    (
      ?AUTO_7134 - BLOCK
      ?AUTO_7131 - BLOCK
      ?AUTO_7132 - BLOCK
      ?AUTO_7136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7128 ) ( ON ?AUTO_7134 ?AUTO_7128 ) ( CLEAR ?AUTO_7131 ) ( ON ?AUTO_7132 ?AUTO_7134 ) ( CLEAR ?AUTO_7132 ) ( HOLDING ?AUTO_7129 ) ( CLEAR ?AUTO_7136 ) )
    :subtasks
    ( ( !STACK ?AUTO_7129 ?AUTO_7136 )
      ( MAKE-ON ?AUTO_7128 ?AUTO_7129 )
      ( MAKE-ON-VERIFY ?AUTO_7128 ?AUTO_7129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7149 - BLOCK
      ?AUTO_7150 - BLOCK
    )
    :vars
    (
      ?AUTO_7151 - BLOCK
      ?AUTO_7154 - BLOCK
      ?AUTO_7156 - BLOCK
      ?AUTO_7152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7150 ) ( ON-TABLE ?AUTO_7149 ) ( ON ?AUTO_7151 ?AUTO_7149 ) ( CLEAR ?AUTO_7154 ) ( ON ?AUTO_7156 ?AUTO_7151 ) ( ON ?AUTO_7152 ?AUTO_7156 ) ( CLEAR ?AUTO_7152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7152 ?AUTO_7156 )
      ( MAKE-ON ?AUTO_7149 ?AUTO_7150 )
      ( MAKE-ON-VERIFY ?AUTO_7149 ?AUTO_7150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7161 - BLOCK
      ?AUTO_7162 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7161 ) ( CLEAR ?AUTO_7162 ) )
    :subtasks
    ( ( !STACK ?AUTO_7161 ?AUTO_7162 )
      ( MAKE-ON-VERIFY ?AUTO_7161 ?AUTO_7162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7165 - BLOCK
      ?AUTO_7166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7166 ) ( ON-TABLE ?AUTO_7165 ) ( CLEAR ?AUTO_7165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7165 )
      ( MAKE-ON ?AUTO_7165 ?AUTO_7166 )
      ( MAKE-ON-VERIFY ?AUTO_7165 ?AUTO_7166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7170 - BLOCK
      ?AUTO_7171 - BLOCK
    )
    :vars
    (
      ?AUTO_7174 - BLOCK
      ?AUTO_7175 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7171 ) ( ON-TABLE ?AUTO_7170 ) ( CLEAR ?AUTO_7170 ) ( HOLDING ?AUTO_7174 ) ( CLEAR ?AUTO_7175 ) )
    :subtasks
    ( ( !STACK ?AUTO_7174 ?AUTO_7175 )
      ( MAKE-ON ?AUTO_7170 ?AUTO_7171 )
      ( MAKE-ON-VERIFY ?AUTO_7170 ?AUTO_7171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7178 - BLOCK
      ?AUTO_7179 - BLOCK
    )
    :vars
    (
      ?AUTO_7183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7178 ) ( CLEAR ?AUTO_7178 ) ( HOLDING ?AUTO_7179 ) ( CLEAR ?AUTO_7183 ) )
    :subtasks
    ( ( !STACK ?AUTO_7179 ?AUTO_7183 )
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
      ?AUTO_7195 - BLOCK
      ?AUTO_7197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7192 ) ( CLEAR ?AUTO_7192 ) ( CLEAR ?AUTO_7195 ) ( ON ?AUTO_7197 ?AUTO_7193 ) ( CLEAR ?AUTO_7197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7197 ?AUTO_7193 )
      ( MAKE-ON ?AUTO_7192 ?AUTO_7193 )
      ( MAKE-ON-VERIFY ?AUTO_7192 ?AUTO_7193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7200 - BLOCK
      ?AUTO_7201 - BLOCK
    )
    :vars
    (
      ?AUTO_7204 - BLOCK
      ?AUTO_7205 - BLOCK
      ?AUTO_7206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7200 ) ( CLEAR ?AUTO_7200 ) ( CLEAR ?AUTO_7204 ) ( ON ?AUTO_7205 ?AUTO_7201 ) ( CLEAR ?AUTO_7205 ) ( HOLDING ?AUTO_7206 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7206 )
      ( MAKE-ON ?AUTO_7200 ?AUTO_7201 )
      ( MAKE-ON-VERIFY ?AUTO_7200 ?AUTO_7201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7209 - BLOCK
      ?AUTO_7210 - BLOCK
    )
    :vars
    (
      ?AUTO_7212 - BLOCK
      ?AUTO_7213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7212 ) ( ON ?AUTO_7213 ?AUTO_7210 ) ( CLEAR ?AUTO_7213 ) ( HOLDING ?AUTO_7209 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7209 )
      ( MAKE-ON ?AUTO_7209 ?AUTO_7210 )
      ( MAKE-ON-VERIFY ?AUTO_7209 ?AUTO_7210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7228 - BLOCK
      ?AUTO_7229 - BLOCK
    )
    :vars
    (
      ?AUTO_7230 - BLOCK
      ?AUTO_7234 - BLOCK
      ?AUTO_7233 - BLOCK
      ?AUTO_7232 - BLOCK
      ?AUTO_7236 - BLOCK
      ?AUTO_7235 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7228 ?AUTO_7230 ) ( CLEAR ?AUTO_7234 ) ( ON ?AUTO_7233 ?AUTO_7228 ) ( ON ?AUTO_7232 ?AUTO_7229 ) ( CLEAR ?AUTO_7232 ) ( CLEAR ?AUTO_7236 ) ( ON ?AUTO_7235 ?AUTO_7233 ) ( CLEAR ?AUTO_7235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7235 ?AUTO_7233 )
      ( MAKE-ON ?AUTO_7228 ?AUTO_7229 )
      ( MAKE-ON-VERIFY ?AUTO_7228 ?AUTO_7229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7240 - BLOCK
      ?AUTO_7241 - BLOCK
    )
    :vars
    (
      ?AUTO_7244 - BLOCK
      ?AUTO_7246 - BLOCK
      ?AUTO_7248 - BLOCK
      ?AUTO_7245 - BLOCK
      ?AUTO_7249 - BLOCK
      ?AUTO_7247 - BLOCK
      ?AUTO_7250 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7240 ?AUTO_7244 ) ( CLEAR ?AUTO_7246 ) ( ON ?AUTO_7248 ?AUTO_7240 ) ( ON ?AUTO_7245 ?AUTO_7241 ) ( CLEAR ?AUTO_7245 ) ( CLEAR ?AUTO_7249 ) ( ON ?AUTO_7247 ?AUTO_7248 ) ( CLEAR ?AUTO_7247 ) ( HOLDING ?AUTO_7250 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7250 )
      ( MAKE-ON ?AUTO_7240 ?AUTO_7241 )
      ( MAKE-ON-VERIFY ?AUTO_7240 ?AUTO_7241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7251 - BLOCK
      ?AUTO_7252 - BLOCK
    )
    :vars
    (
      ?AUTO_7257 - BLOCK
      ?AUTO_7255 - BLOCK
      ?AUTO_7254 - BLOCK
      ?AUTO_7256 - BLOCK
      ?AUTO_7261 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7251 ?AUTO_7257 ) ( ON ?AUTO_7255 ?AUTO_7251 ) ( ON ?AUTO_7254 ?AUTO_7252 ) ( ON ?AUTO_7256 ?AUTO_7255 ) ( CLEAR ?AUTO_7256 ) ( ON ?AUTO_7261 ?AUTO_7254 ) ( CLEAR ?AUTO_7261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7261 ?AUTO_7254 )
      ( MAKE-ON ?AUTO_7251 ?AUTO_7252 )
      ( MAKE-ON-VERIFY ?AUTO_7251 ?AUTO_7252 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7263 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7263 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7263 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7263 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7265 - BLOCK
    )
    :vars
    (
      ?AUTO_7268 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7265 ?AUTO_7268 ) ( CLEAR ?AUTO_7265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7265 ?AUTO_7268 )
      ( MAKE-ON-TABLE ?AUTO_7265 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7265 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7270 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7270 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7270 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7270 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7272 - BLOCK
    )
    :vars
    (
      ?AUTO_7275 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7272 ?AUTO_7275 ) ( CLEAR ?AUTO_7272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7272 ?AUTO_7275 )
      ( MAKE-ON-TABLE ?AUTO_7272 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7272 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7276 - BLOCK
    )
    :vars
    (
      ?AUTO_7278 - BLOCK
      ?AUTO_7279 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7276 ?AUTO_7278 ) ( CLEAR ?AUTO_7276 ) ( HOLDING ?AUTO_7279 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7279 )
      ( MAKE-ON-TABLE ?AUTO_7276 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7276 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7280 - BLOCK
    )
    :vars
    (
      ?AUTO_7283 - BLOCK
      ?AUTO_7282 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7280 ?AUTO_7283 ) ( ON ?AUTO_7282 ?AUTO_7280 ) ( CLEAR ?AUTO_7282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7282 ?AUTO_7280 )
      ( MAKE-ON-TABLE ?AUTO_7280 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7288 - BLOCK
      ?AUTO_7289 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7288 ) ( CLEAR ?AUTO_7289 ) )
    :subtasks
    ( ( !STACK ?AUTO_7288 ?AUTO_7289 )
      ( MAKE-ON-VERIFY ?AUTO_7288 ?AUTO_7289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7292 - BLOCK
      ?AUTO_7293 - BLOCK
    )
    :vars
    (
      ?AUTO_7297 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7293 ) ( ON ?AUTO_7292 ?AUTO_7297 ) ( CLEAR ?AUTO_7292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7292 ?AUTO_7297 )
      ( MAKE-ON ?AUTO_7292 ?AUTO_7293 )
      ( MAKE-ON-VERIFY ?AUTO_7292 ?AUTO_7293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7298 - BLOCK
      ?AUTO_7299 - BLOCK
    )
    :vars
    (
      ?AUTO_7302 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7298 ?AUTO_7302 ) ( CLEAR ?AUTO_7298 ) ( HOLDING ?AUTO_7299 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7299 )
      ( MAKE-ON ?AUTO_7298 ?AUTO_7299 )
      ( MAKE-ON-VERIFY ?AUTO_7298 ?AUTO_7299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7306 - BLOCK
      ?AUTO_7307 - BLOCK
    )
    :vars
    (
      ?AUTO_7308 - BLOCK
      ?AUTO_7311 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7307 ) ( ON ?AUTO_7306 ?AUTO_7308 ) ( CLEAR ?AUTO_7306 ) ( HOLDING ?AUTO_7311 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7311 )
      ( MAKE-ON ?AUTO_7306 ?AUTO_7307 )
      ( MAKE-ON-VERIFY ?AUTO_7306 ?AUTO_7307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7312 - BLOCK
      ?AUTO_7313 - BLOCK
    )
    :vars
    (
      ?AUTO_7316 - BLOCK
      ?AUTO_7317 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7312 ?AUTO_7316 ) ( CLEAR ?AUTO_7312 ) ( ON ?AUTO_7317 ?AUTO_7313 ) ( CLEAR ?AUTO_7317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7317 ?AUTO_7313 )
      ( MAKE-ON ?AUTO_7312 ?AUTO_7313 )
      ( MAKE-ON-VERIFY ?AUTO_7312 ?AUTO_7313 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7321 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7321 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7321 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7321 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7323 - BLOCK
    )
    :vars
    (
      ?AUTO_7326 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7323 ?AUTO_7326 ) ( CLEAR ?AUTO_7323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7323 ?AUTO_7326 )
      ( MAKE-ON-TABLE ?AUTO_7323 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7323 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7327 - BLOCK
    )
    :vars
    (
      ?AUTO_7329 - BLOCK
      ?AUTO_7330 - BLOCK
      ?AUTO_7331 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7327 ?AUTO_7329 ) ( CLEAR ?AUTO_7327 ) ( HOLDING ?AUTO_7330 ) ( CLEAR ?AUTO_7331 ) )
    :subtasks
    ( ( !STACK ?AUTO_7330 ?AUTO_7331 )
      ( MAKE-ON-TABLE ?AUTO_7327 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7327 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7332 - BLOCK
    )
    :vars
    (
      ?AUTO_7334 - BLOCK
      ?AUTO_7336 - BLOCK
      ?AUTO_7335 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7332 ?AUTO_7334 ) ( CLEAR ?AUTO_7336 ) ( ON ?AUTO_7335 ?AUTO_7332 ) ( CLEAR ?AUTO_7335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7335 ?AUTO_7332 )
      ( MAKE-ON-TABLE ?AUTO_7332 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7332 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7339 - BLOCK
    )
    :vars
    (
      ?AUTO_7342 - BLOCK
      ?AUTO_7343 - BLOCK
      ?AUTO_7340 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7339 ?AUTO_7342 ) ( ON ?AUTO_7343 ?AUTO_7339 ) ( CLEAR ?AUTO_7343 ) ( HOLDING ?AUTO_7340 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7340 )
      ( MAKE-ON-TABLE ?AUTO_7339 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7350 - BLOCK
      ?AUTO_7351 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7350 ) ( CLEAR ?AUTO_7351 ) )
    :subtasks
    ( ( !STACK ?AUTO_7350 ?AUTO_7351 )
      ( MAKE-ON-VERIFY ?AUTO_7350 ?AUTO_7351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7354 - BLOCK
      ?AUTO_7355 - BLOCK
    )
    :vars
    (
      ?AUTO_7359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7355 ) ( ON ?AUTO_7354 ?AUTO_7359 ) ( CLEAR ?AUTO_7354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7354 ?AUTO_7359 )
      ( MAKE-ON ?AUTO_7354 ?AUTO_7355 )
      ( MAKE-ON-VERIFY ?AUTO_7354 ?AUTO_7355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7360 - BLOCK
      ?AUTO_7361 - BLOCK
    )
    :vars
    (
      ?AUTO_7364 - BLOCK
      ?AUTO_7365 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7361 ) ( ON ?AUTO_7360 ?AUTO_7364 ) ( CLEAR ?AUTO_7360 ) ( HOLDING ?AUTO_7365 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7365 )
      ( MAKE-ON ?AUTO_7360 ?AUTO_7361 )
      ( MAKE-ON-VERIFY ?AUTO_7360 ?AUTO_7361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7366 - BLOCK
      ?AUTO_7367 - BLOCK
    )
    :vars
    (
      ?AUTO_7370 - BLOCK
      ?AUTO_7371 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7367 ) ( ON ?AUTO_7366 ?AUTO_7370 ) ( ON ?AUTO_7371 ?AUTO_7366 ) ( CLEAR ?AUTO_7371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7371 ?AUTO_7366 )
      ( MAKE-ON ?AUTO_7366 ?AUTO_7367 )
      ( MAKE-ON-VERIFY ?AUTO_7366 ?AUTO_7367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7374 - BLOCK
      ?AUTO_7375 - BLOCK
    )
    :vars
    (
      ?AUTO_7379 - BLOCK
      ?AUTO_7376 - BLOCK
      ?AUTO_7380 - BLOCK
      ?AUTO_7381 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7375 ) ( ON ?AUTO_7374 ?AUTO_7379 ) ( ON ?AUTO_7376 ?AUTO_7374 ) ( CLEAR ?AUTO_7376 ) ( HOLDING ?AUTO_7380 ) ( CLEAR ?AUTO_7381 ) )
    :subtasks
    ( ( !STACK ?AUTO_7380 ?AUTO_7381 )
      ( MAKE-ON ?AUTO_7374 ?AUTO_7375 )
      ( MAKE-ON-VERIFY ?AUTO_7374 ?AUTO_7375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7382 - BLOCK
      ?AUTO_7383 - BLOCK
    )
    :vars
    (
      ?AUTO_7388 - BLOCK
      ?AUTO_7385 - BLOCK
      ?AUTO_7384 - BLOCK
      ?AUTO_7389 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7383 ) ( ON ?AUTO_7382 ?AUTO_7388 ) ( ON ?AUTO_7385 ?AUTO_7382 ) ( CLEAR ?AUTO_7384 ) ( ON ?AUTO_7389 ?AUTO_7385 ) ( CLEAR ?AUTO_7389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7389 ?AUTO_7385 )
      ( MAKE-ON ?AUTO_7382 ?AUTO_7383 )
      ( MAKE-ON-VERIFY ?AUTO_7382 ?AUTO_7383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7392 - BLOCK
      ?AUTO_7393 - BLOCK
    )
    :vars
    (
      ?AUTO_7399 - BLOCK
      ?AUTO_7396 - BLOCK
      ?AUTO_7397 - BLOCK
      ?AUTO_7398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7393 ) ( ON ?AUTO_7392 ?AUTO_7399 ) ( ON ?AUTO_7396 ?AUTO_7392 ) ( ON ?AUTO_7397 ?AUTO_7396 ) ( CLEAR ?AUTO_7397 ) ( HOLDING ?AUTO_7398 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7398 )
      ( MAKE-ON ?AUTO_7392 ?AUTO_7393 )
      ( MAKE-ON-VERIFY ?AUTO_7392 ?AUTO_7393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7403 - BLOCK
      ?AUTO_7404 - BLOCK
    )
    :vars
    (
      ?AUTO_7408 - BLOCK
      ?AUTO_7407 - BLOCK
      ?AUTO_7409 - BLOCK
      ?AUTO_7410 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7403 ?AUTO_7408 ) ( ON ?AUTO_7407 ?AUTO_7403 ) ( CLEAR ?AUTO_7409 ) ( ON ?AUTO_7410 ?AUTO_7407 ) ( CLEAR ?AUTO_7410 ) ( HOLDING ?AUTO_7404 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7404 )
      ( MAKE-ON ?AUTO_7403 ?AUTO_7404 )
      ( MAKE-ON-VERIFY ?AUTO_7403 ?AUTO_7404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7416 - BLOCK
      ?AUTO_7417 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7416 ) ( CLEAR ?AUTO_7417 ) )
    :subtasks
    ( ( !STACK ?AUTO_7416 ?AUTO_7417 )
      ( MAKE-ON-VERIFY ?AUTO_7416 ?AUTO_7417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7420 - BLOCK
      ?AUTO_7421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7421 ) ( ON-TABLE ?AUTO_7420 ) ( CLEAR ?AUTO_7420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7420 )
      ( MAKE-ON ?AUTO_7420 ?AUTO_7421 )
      ( MAKE-ON-VERIFY ?AUTO_7420 ?AUTO_7421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7425 - BLOCK
      ?AUTO_7426 - BLOCK
    )
    :vars
    (
      ?AUTO_7429 - BLOCK
      ?AUTO_7430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7426 ) ( ON-TABLE ?AUTO_7425 ) ( CLEAR ?AUTO_7425 ) ( HOLDING ?AUTO_7429 ) ( CLEAR ?AUTO_7430 ) )
    :subtasks
    ( ( !STACK ?AUTO_7429 ?AUTO_7430 )
      ( MAKE-ON ?AUTO_7425 ?AUTO_7426 )
      ( MAKE-ON-VERIFY ?AUTO_7425 ?AUTO_7426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7437 - BLOCK
      ?AUTO_7438 - BLOCK
    )
    :vars
    (
      ?AUTO_7442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7437 ) ( CLEAR ?AUTO_7437 ) ( HOLDING ?AUTO_7438 ) ( CLEAR ?AUTO_7442 ) )
    :subtasks
    ( ( !STACK ?AUTO_7438 ?AUTO_7442 )
      ( MAKE-ON ?AUTO_7437 ?AUTO_7438 )
      ( MAKE-ON-VERIFY ?AUTO_7437 ?AUTO_7438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7447 - BLOCK
      ?AUTO_7448 - BLOCK
    )
    :vars
    (
      ?AUTO_7450 - BLOCK
      ?AUTO_7452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7448 ) ( ON-TABLE ?AUTO_7447 ) ( CLEAR ?AUTO_7450 ) ( ON ?AUTO_7452 ?AUTO_7447 ) ( CLEAR ?AUTO_7452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7452 ?AUTO_7447 )
      ( MAKE-ON ?AUTO_7447 ?AUTO_7448 )
      ( MAKE-ON-VERIFY ?AUTO_7447 ?AUTO_7448 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7455 - BLOCK
      ?AUTO_7456 - BLOCK
    )
    :vars
    (
      ?AUTO_7459 - BLOCK
      ?AUTO_7460 - BLOCK
      ?AUTO_7461 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7456 ) ( ON-TABLE ?AUTO_7455 ) ( CLEAR ?AUTO_7459 ) ( ON ?AUTO_7460 ?AUTO_7455 ) ( CLEAR ?AUTO_7460 ) ( HOLDING ?AUTO_7461 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7461 )
      ( MAKE-ON ?AUTO_7455 ?AUTO_7456 )
      ( MAKE-ON-VERIFY ?AUTO_7455 ?AUTO_7456 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7462 - BLOCK
      ?AUTO_7463 - BLOCK
    )
    :vars
    (
      ?AUTO_7467 - BLOCK
      ?AUTO_7464 - BLOCK
      ?AUTO_7468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7463 ) ( ON-TABLE ?AUTO_7462 ) ( CLEAR ?AUTO_7467 ) ( ON ?AUTO_7464 ?AUTO_7462 ) ( ON ?AUTO_7468 ?AUTO_7464 ) ( CLEAR ?AUTO_7468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7468 ?AUTO_7464 )
      ( MAKE-ON ?AUTO_7462 ?AUTO_7463 )
      ( MAKE-ON-VERIFY ?AUTO_7462 ?AUTO_7463 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7472 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7472 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7472 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7472 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7474 - BLOCK
    )
    :vars
    (
      ?AUTO_7477 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7474 ?AUTO_7477 ) ( CLEAR ?AUTO_7474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7474 ?AUTO_7477 )
      ( MAKE-ON-TABLE ?AUTO_7474 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7474 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7478 - BLOCK
    )
    :vars
    (
      ?AUTO_7480 - BLOCK
      ?AUTO_7481 - BLOCK
      ?AUTO_7482 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7478 ?AUTO_7480 ) ( CLEAR ?AUTO_7478 ) ( HOLDING ?AUTO_7481 ) ( CLEAR ?AUTO_7482 ) )
    :subtasks
    ( ( !STACK ?AUTO_7481 ?AUTO_7482 )
      ( MAKE-ON-TABLE ?AUTO_7478 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7478 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7487 - BLOCK
    )
    :vars
    (
      ?AUTO_7489 - BLOCK
      ?AUTO_7491 - BLOCK
      ?AUTO_7488 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7487 ?AUTO_7489 ) ( CLEAR ?AUTO_7491 ) ( ON ?AUTO_7488 ?AUTO_7487 ) ( CLEAR ?AUTO_7488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7488 ?AUTO_7487 )
      ( MAKE-ON-TABLE ?AUTO_7487 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7487 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7494 - BLOCK
    )
    :vars
    (
      ?AUTO_7496 - BLOCK
      ?AUTO_7498 - BLOCK
      ?AUTO_7497 - BLOCK
      ?AUTO_7499 - BLOCK
      ?AUTO_7500 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7494 ?AUTO_7496 ) ( CLEAR ?AUTO_7498 ) ( ON ?AUTO_7497 ?AUTO_7494 ) ( CLEAR ?AUTO_7497 ) ( HOLDING ?AUTO_7499 ) ( CLEAR ?AUTO_7500 ) )
    :subtasks
    ( ( !STACK ?AUTO_7499 ?AUTO_7500 )
      ( MAKE-ON-TABLE ?AUTO_7494 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7494 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7501 - BLOCK
    )
    :vars
    (
      ?AUTO_7502 - BLOCK
      ?AUTO_7504 - BLOCK
      ?AUTO_7506 - BLOCK
      ?AUTO_7507 - BLOCK
      ?AUTO_7505 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7501 ?AUTO_7502 ) ( CLEAR ?AUTO_7504 ) ( ON ?AUTO_7506 ?AUTO_7501 ) ( CLEAR ?AUTO_7507 ) ( ON ?AUTO_7505 ?AUTO_7506 ) ( CLEAR ?AUTO_7505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7505 ?AUTO_7506 )
      ( MAKE-ON-TABLE ?AUTO_7501 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7501 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7510 - BLOCK
    )
    :vars
    (
      ?AUTO_7512 - BLOCK
      ?AUTO_7516 - BLOCK
      ?AUTO_7511 - BLOCK
      ?AUTO_7515 - BLOCK
      ?AUTO_7514 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7510 ?AUTO_7512 ) ( CLEAR ?AUTO_7516 ) ( ON ?AUTO_7511 ?AUTO_7510 ) ( ON ?AUTO_7515 ?AUTO_7511 ) ( CLEAR ?AUTO_7515 ) ( HOLDING ?AUTO_7514 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7514 )
      ( MAKE-ON-TABLE ?AUTO_7510 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7523 - BLOCK
      ?AUTO_7524 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7523 ) ( CLEAR ?AUTO_7524 ) )
    :subtasks
    ( ( !STACK ?AUTO_7523 ?AUTO_7524 )
      ( MAKE-ON-VERIFY ?AUTO_7523 ?AUTO_7524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7527 - BLOCK
      ?AUTO_7528 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7528 ) ( ON-TABLE ?AUTO_7527 ) ( CLEAR ?AUTO_7527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7527 )
      ( MAKE-ON ?AUTO_7527 ?AUTO_7528 )
      ( MAKE-ON-VERIFY ?AUTO_7527 ?AUTO_7528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7532 - BLOCK
      ?AUTO_7533 - BLOCK
    )
    :vars
    (
      ?AUTO_7536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7533 ) ( ON-TABLE ?AUTO_7532 ) ( CLEAR ?AUTO_7532 ) ( HOLDING ?AUTO_7536 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7536 )
      ( MAKE-ON ?AUTO_7532 ?AUTO_7533 )
      ( MAKE-ON-VERIFY ?AUTO_7532 ?AUTO_7533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7537 - BLOCK
      ?AUTO_7538 - BLOCK
    )
    :vars
    (
      ?AUTO_7541 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7538 ) ( ON-TABLE ?AUTO_7537 ) ( ON ?AUTO_7541 ?AUTO_7537 ) ( CLEAR ?AUTO_7541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7541 ?AUTO_7537 )
      ( MAKE-ON ?AUTO_7537 ?AUTO_7538 )
      ( MAKE-ON-VERIFY ?AUTO_7537 ?AUTO_7538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7544 - BLOCK
      ?AUTO_7545 - BLOCK
    )
    :vars
    (
      ?AUTO_7547 - BLOCK
      ?AUTO_7549 - BLOCK
      ?AUTO_7550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7545 ) ( ON-TABLE ?AUTO_7544 ) ( ON ?AUTO_7547 ?AUTO_7544 ) ( CLEAR ?AUTO_7547 ) ( HOLDING ?AUTO_7549 ) ( CLEAR ?AUTO_7550 ) )
    :subtasks
    ( ( !STACK ?AUTO_7549 ?AUTO_7550 )
      ( MAKE-ON ?AUTO_7544 ?AUTO_7545 )
      ( MAKE-ON-VERIFY ?AUTO_7544 ?AUTO_7545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7555 - BLOCK
      ?AUTO_7556 - BLOCK
    )
    :vars
    (
      ?AUTO_7557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7555 ) ( CLEAR ?AUTO_7555 ) ( ON ?AUTO_7557 ?AUTO_7556 ) ( CLEAR ?AUTO_7557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7557 ?AUTO_7556 )
      ( MAKE-ON ?AUTO_7555 ?AUTO_7556 )
      ( MAKE-ON-VERIFY ?AUTO_7555 ?AUTO_7556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7562 - BLOCK
      ?AUTO_7563 - BLOCK
    )
    :vars
    (
      ?AUTO_7564 - BLOCK
      ?AUTO_7567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7562 ) ( CLEAR ?AUTO_7562 ) ( ON ?AUTO_7564 ?AUTO_7563 ) ( CLEAR ?AUTO_7564 ) ( HOLDING ?AUTO_7567 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7567 )
      ( MAKE-ON ?AUTO_7562 ?AUTO_7563 )
      ( MAKE-ON-VERIFY ?AUTO_7562 ?AUTO_7563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7568 - BLOCK
      ?AUTO_7569 - BLOCK
    )
    :vars
    (
      ?AUTO_7572 - BLOCK
      ?AUTO_7573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7568 ) ( CLEAR ?AUTO_7568 ) ( ON ?AUTO_7572 ?AUTO_7569 ) ( ON ?AUTO_7573 ?AUTO_7572 ) ( CLEAR ?AUTO_7573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7573 ?AUTO_7572 )
      ( MAKE-ON ?AUTO_7568 ?AUTO_7569 )
      ( MAKE-ON-VERIFY ?AUTO_7568 ?AUTO_7569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7576 - BLOCK
      ?AUTO_7577 - BLOCK
    )
    :vars
    (
      ?AUTO_7580 - BLOCK
      ?AUTO_7579 - BLOCK
      ?AUTO_7582 - BLOCK
      ?AUTO_7583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7576 ) ( CLEAR ?AUTO_7576 ) ( ON ?AUTO_7580 ?AUTO_7577 ) ( ON ?AUTO_7579 ?AUTO_7580 ) ( CLEAR ?AUTO_7579 ) ( HOLDING ?AUTO_7582 ) ( CLEAR ?AUTO_7583 ) )
    :subtasks
    ( ( !STACK ?AUTO_7582 ?AUTO_7583 )
      ( MAKE-ON ?AUTO_7576 ?AUTO_7577 )
      ( MAKE-ON-VERIFY ?AUTO_7576 ?AUTO_7577 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7584 - BLOCK
      ?AUTO_7585 - BLOCK
    )
    :vars
    (
      ?AUTO_7589 - BLOCK
      ?AUTO_7586 - BLOCK
      ?AUTO_7591 - BLOCK
      ?AUTO_7590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7584 ) ( CLEAR ?AUTO_7584 ) ( ON ?AUTO_7589 ?AUTO_7585 ) ( ON ?AUTO_7586 ?AUTO_7589 ) ( CLEAR ?AUTO_7591 ) ( ON ?AUTO_7590 ?AUTO_7586 ) ( CLEAR ?AUTO_7590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7590 ?AUTO_7586 )
      ( MAKE-ON ?AUTO_7584 ?AUTO_7585 )
      ( MAKE-ON-VERIFY ?AUTO_7584 ?AUTO_7585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7594 - BLOCK
      ?AUTO_7595 - BLOCK
    )
    :vars
    (
      ?AUTO_7601 - BLOCK
      ?AUTO_7600 - BLOCK
      ?AUTO_7599 - BLOCK
      ?AUTO_7596 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7594 ) ( CLEAR ?AUTO_7594 ) ( ON ?AUTO_7601 ?AUTO_7595 ) ( ON ?AUTO_7600 ?AUTO_7601 ) ( ON ?AUTO_7599 ?AUTO_7600 ) ( CLEAR ?AUTO_7599 ) ( HOLDING ?AUTO_7596 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7596 )
      ( MAKE-ON ?AUTO_7594 ?AUTO_7595 )
      ( MAKE-ON-VERIFY ?AUTO_7594 ?AUTO_7595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7605 - BLOCK
      ?AUTO_7606 - BLOCK
    )
    :vars
    (
      ?AUTO_7612 - BLOCK
      ?AUTO_7611 - BLOCK
      ?AUTO_7608 - BLOCK
      ?AUTO_7610 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7612 ?AUTO_7606 ) ( ON ?AUTO_7611 ?AUTO_7612 ) ( CLEAR ?AUTO_7608 ) ( ON ?AUTO_7610 ?AUTO_7611 ) ( CLEAR ?AUTO_7610 ) ( HOLDING ?AUTO_7605 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7605 )
      ( MAKE-ON ?AUTO_7605 ?AUTO_7606 )
      ( MAKE-ON-VERIFY ?AUTO_7605 ?AUTO_7606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7614 - BLOCK
      ?AUTO_7615 - BLOCK
    )
    :vars
    (
      ?AUTO_7620 - BLOCK
      ?AUTO_7619 - BLOCK
      ?AUTO_7618 - BLOCK
      ?AUTO_7621 - BLOCK
      ?AUTO_7623 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7620 ?AUTO_7615 ) ( ON ?AUTO_7619 ?AUTO_7620 ) ( CLEAR ?AUTO_7618 ) ( ON ?AUTO_7621 ?AUTO_7619 ) ( CLEAR ?AUTO_7621 ) ( ON ?AUTO_7614 ?AUTO_7623 ) ( CLEAR ?AUTO_7614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7614 ?AUTO_7623 )
      ( MAKE-ON ?AUTO_7614 ?AUTO_7615 )
      ( MAKE-ON-VERIFY ?AUTO_7614 ?AUTO_7615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7626 - BLOCK
      ?AUTO_7627 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7626 ) ( CLEAR ?AUTO_7627 ) )
    :subtasks
    ( ( !STACK ?AUTO_7626 ?AUTO_7627 )
      ( MAKE-ON-VERIFY ?AUTO_7626 ?AUTO_7627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7630 - BLOCK
      ?AUTO_7631 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7631 ) ( ON-TABLE ?AUTO_7630 ) ( CLEAR ?AUTO_7630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7630 )
      ( MAKE-ON ?AUTO_7630 ?AUTO_7631 )
      ( MAKE-ON-VERIFY ?AUTO_7630 ?AUTO_7631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7635 - BLOCK
      ?AUTO_7636 - BLOCK
    )
    :vars
    (
      ?AUTO_7640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7635 ) ( CLEAR ?AUTO_7635 ) ( HOLDING ?AUTO_7636 ) ( CLEAR ?AUTO_7640 ) )
    :subtasks
    ( ( !STACK ?AUTO_7636 ?AUTO_7640 )
      ( MAKE-ON ?AUTO_7635 ?AUTO_7636 )
      ( MAKE-ON-VERIFY ?AUTO_7635 ?AUTO_7636 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7642 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7642 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7642 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7642 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7644 - BLOCK
    )
    :vars
    (
      ?AUTO_7647 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7644 ?AUTO_7647 ) ( CLEAR ?AUTO_7644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7644 ?AUTO_7647 )
      ( MAKE-ON-TABLE ?AUTO_7644 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7644 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7649 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7649 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7649 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7649 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7651 - BLOCK
    )
    :vars
    (
      ?AUTO_7654 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7651 ?AUTO_7654 ) ( CLEAR ?AUTO_7651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7651 ?AUTO_7654 )
      ( MAKE-ON-TABLE ?AUTO_7651 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7651 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7655 - BLOCK
    )
    :vars
    (
      ?AUTO_7657 - BLOCK
      ?AUTO_7658 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7655 ?AUTO_7657 ) ( CLEAR ?AUTO_7655 ) ( HOLDING ?AUTO_7658 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7658 )
      ( MAKE-ON-TABLE ?AUTO_7655 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7655 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7659 - BLOCK
    )
    :vars
    (
      ?AUTO_7661 - BLOCK
      ?AUTO_7662 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7659 ?AUTO_7661 ) ( ON ?AUTO_7662 ?AUTO_7659 ) ( CLEAR ?AUTO_7662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7662 ?AUTO_7659 )
      ( MAKE-ON-TABLE ?AUTO_7659 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7659 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7666 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7666 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7666 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7666 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7668 - BLOCK
    )
    :vars
    (
      ?AUTO_7671 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7668 ?AUTO_7671 ) ( CLEAR ?AUTO_7668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7668 ?AUTO_7671 )
      ( MAKE-ON-TABLE ?AUTO_7668 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7668 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7672 - BLOCK
    )
    :vars
    (
      ?AUTO_7674 - BLOCK
      ?AUTO_7675 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7672 ?AUTO_7674 ) ( CLEAR ?AUTO_7672 ) ( HOLDING ?AUTO_7675 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7675 )
      ( MAKE-ON-TABLE ?AUTO_7672 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7672 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7676 - BLOCK
    )
    :vars
    (
      ?AUTO_7678 - BLOCK
      ?AUTO_7679 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7676 ?AUTO_7678 ) ( ON ?AUTO_7679 ?AUTO_7676 ) ( CLEAR ?AUTO_7679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7679 ?AUTO_7676 )
      ( MAKE-ON-TABLE ?AUTO_7676 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7676 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7682 - BLOCK
    )
    :vars
    (
      ?AUTO_7683 - BLOCK
      ?AUTO_7684 - BLOCK
      ?AUTO_7686 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7682 ?AUTO_7683 ) ( ON ?AUTO_7684 ?AUTO_7682 ) ( CLEAR ?AUTO_7684 ) ( HOLDING ?AUTO_7686 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7686 )
      ( MAKE-ON-TABLE ?AUTO_7682 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7682 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7687 - BLOCK
    )
    :vars
    (
      ?AUTO_7689 - BLOCK
      ?AUTO_7690 - BLOCK
      ?AUTO_7691 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7687 ?AUTO_7689 ) ( ON ?AUTO_7690 ?AUTO_7687 ) ( ON ?AUTO_7691 ?AUTO_7690 ) ( CLEAR ?AUTO_7691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7691 ?AUTO_7690 )
      ( MAKE-ON-TABLE ?AUTO_7687 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7687 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7695 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7695 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7695 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7695 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7697 - BLOCK
    )
    :vars
    (
      ?AUTO_7700 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7697 ?AUTO_7700 ) ( CLEAR ?AUTO_7697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7697 ?AUTO_7700 )
      ( MAKE-ON-TABLE ?AUTO_7697 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7697 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7701 - BLOCK
    )
    :vars
    (
      ?AUTO_7703 - BLOCK
      ?AUTO_7704 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7701 ?AUTO_7703 ) ( CLEAR ?AUTO_7701 ) ( HOLDING ?AUTO_7704 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7704 )
      ( MAKE-ON-TABLE ?AUTO_7701 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7701 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7705 - BLOCK
    )
    :vars
    (
      ?AUTO_7707 - BLOCK
      ?AUTO_7708 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7705 ?AUTO_7707 ) ( ON ?AUTO_7708 ?AUTO_7705 ) ( CLEAR ?AUTO_7708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7708 ?AUTO_7705 )
      ( MAKE-ON-TABLE ?AUTO_7705 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7705 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7711 - BLOCK
    )
    :vars
    (
      ?AUTO_7713 - BLOCK
      ?AUTO_7712 - BLOCK
      ?AUTO_7715 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7711 ?AUTO_7713 ) ( ON ?AUTO_7712 ?AUTO_7711 ) ( CLEAR ?AUTO_7712 ) ( HOLDING ?AUTO_7715 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7715 )
      ( MAKE-ON-TABLE ?AUTO_7711 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7711 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7716 - BLOCK
    )
    :vars
    (
      ?AUTO_7719 - BLOCK
      ?AUTO_7718 - BLOCK
      ?AUTO_7720 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7716 ?AUTO_7719 ) ( ON ?AUTO_7718 ?AUTO_7716 ) ( ON ?AUTO_7720 ?AUTO_7718 ) ( CLEAR ?AUTO_7720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7720 ?AUTO_7718 )
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
      ?AUTO_7726 - BLOCK
      ?AUTO_7727 - BLOCK
      ?AUTO_7724 - BLOCK
      ?AUTO_7728 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7723 ?AUTO_7726 ) ( ON ?AUTO_7727 ?AUTO_7723 ) ( ON ?AUTO_7724 ?AUTO_7727 ) ( CLEAR ?AUTO_7724 ) ( HOLDING ?AUTO_7728 ) )
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
      ?AUTO_7734 - BLOCK
      ?AUTO_7733 - BLOCK
      ?AUTO_7730 - BLOCK
      ?AUTO_7732 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7729 ?AUTO_7734 ) ( ON ?AUTO_7733 ?AUTO_7729 ) ( ON ?AUTO_7730 ?AUTO_7733 ) ( ON ?AUTO_7732 ?AUTO_7730 ) ( CLEAR ?AUTO_7732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7732 ?AUTO_7730 )
      ( MAKE-ON-TABLE ?AUTO_7729 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7739 - BLOCK
      ?AUTO_7740 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7739 ) ( CLEAR ?AUTO_7740 ) )
    :subtasks
    ( ( !STACK ?AUTO_7739 ?AUTO_7740 )
      ( MAKE-ON-VERIFY ?AUTO_7739 ?AUTO_7740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7743 - BLOCK
      ?AUTO_7744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7744 ) ( ON-TABLE ?AUTO_7743 ) ( CLEAR ?AUTO_7743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7743 )
      ( MAKE-ON ?AUTO_7743 ?AUTO_7744 )
      ( MAKE-ON-VERIFY ?AUTO_7743 ?AUTO_7744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7748 - BLOCK
      ?AUTO_7749 - BLOCK
    )
    :vars
    (
      ?AUTO_7752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7749 ) ( ON-TABLE ?AUTO_7748 ) ( CLEAR ?AUTO_7748 ) ( HOLDING ?AUTO_7752 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7752 )
      ( MAKE-ON ?AUTO_7748 ?AUTO_7749 )
      ( MAKE-ON-VERIFY ?AUTO_7748 ?AUTO_7749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7753 - BLOCK
      ?AUTO_7754 - BLOCK
    )
    :vars
    (
      ?AUTO_7757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7753 ) ( CLEAR ?AUTO_7753 ) ( ON ?AUTO_7757 ?AUTO_7754 ) ( CLEAR ?AUTO_7757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7757 ?AUTO_7754 )
      ( MAKE-ON ?AUTO_7753 ?AUTO_7754 )
      ( MAKE-ON-VERIFY ?AUTO_7753 ?AUTO_7754 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7760 - BLOCK
      ?AUTO_7761 - BLOCK
    )
    :vars
    (
      ?AUTO_7762 - BLOCK
      ?AUTO_7765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7760 ) ( CLEAR ?AUTO_7760 ) ( ON ?AUTO_7762 ?AUTO_7761 ) ( CLEAR ?AUTO_7762 ) ( HOLDING ?AUTO_7765 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7765 )
      ( MAKE-ON ?AUTO_7760 ?AUTO_7761 )
      ( MAKE-ON-VERIFY ?AUTO_7760 ?AUTO_7761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7766 - BLOCK
      ?AUTO_7767 - BLOCK
    )
    :vars
    (
      ?AUTO_7770 - BLOCK
      ?AUTO_7771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7766 ) ( CLEAR ?AUTO_7766 ) ( ON ?AUTO_7770 ?AUTO_7767 ) ( ON ?AUTO_7771 ?AUTO_7770 ) ( CLEAR ?AUTO_7771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7771 ?AUTO_7770 )
      ( MAKE-ON ?AUTO_7766 ?AUTO_7767 )
      ( MAKE-ON-VERIFY ?AUTO_7766 ?AUTO_7767 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7774 - BLOCK
      ?AUTO_7775 - BLOCK
    )
    :vars
    (
      ?AUTO_7779 - BLOCK
      ?AUTO_7776 - BLOCK
      ?AUTO_7780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7774 ) ( CLEAR ?AUTO_7774 ) ( ON ?AUTO_7779 ?AUTO_7775 ) ( ON ?AUTO_7776 ?AUTO_7779 ) ( CLEAR ?AUTO_7776 ) ( HOLDING ?AUTO_7780 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7780 )
      ( MAKE-ON ?AUTO_7774 ?AUTO_7775 )
      ( MAKE-ON-VERIFY ?AUTO_7774 ?AUTO_7775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7781 - BLOCK
      ?AUTO_7782 - BLOCK
    )
    :vars
    (
      ?AUTO_7784 - BLOCK
      ?AUTO_7783 - BLOCK
      ?AUTO_7787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7781 ) ( CLEAR ?AUTO_7781 ) ( ON ?AUTO_7784 ?AUTO_7782 ) ( ON ?AUTO_7783 ?AUTO_7784 ) ( ON ?AUTO_7787 ?AUTO_7783 ) ( CLEAR ?AUTO_7787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7787 ?AUTO_7783 )
      ( MAKE-ON ?AUTO_7781 ?AUTO_7782 )
      ( MAKE-ON-VERIFY ?AUTO_7781 ?AUTO_7782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7790 - BLOCK
      ?AUTO_7791 - BLOCK
    )
    :vars
    (
      ?AUTO_7794 - BLOCK
      ?AUTO_7795 - BLOCK
      ?AUTO_7792 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7794 ?AUTO_7791 ) ( ON ?AUTO_7795 ?AUTO_7794 ) ( ON ?AUTO_7792 ?AUTO_7795 ) ( CLEAR ?AUTO_7792 ) ( HOLDING ?AUTO_7790 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7790 )
      ( MAKE-ON ?AUTO_7790 ?AUTO_7791 )
      ( MAKE-ON-VERIFY ?AUTO_7790 ?AUTO_7791 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7798 - BLOCK
      ?AUTO_7799 - BLOCK
    )
    :vars
    (
      ?AUTO_7800 - BLOCK
      ?AUTO_7804 - BLOCK
      ?AUTO_7801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7800 ?AUTO_7799 ) ( ON ?AUTO_7804 ?AUTO_7800 ) ( ON ?AUTO_7801 ?AUTO_7804 ) ( ON ?AUTO_7798 ?AUTO_7801 ) ( CLEAR ?AUTO_7798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7798 ?AUTO_7801 )
      ( MAKE-ON ?AUTO_7798 ?AUTO_7799 )
      ( MAKE-ON-VERIFY ?AUTO_7798 ?AUTO_7799 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7806 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7806 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7806 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7806 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7808 - BLOCK
    )
    :vars
    (
      ?AUTO_7811 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7808 ?AUTO_7811 ) ( CLEAR ?AUTO_7808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7808 ?AUTO_7811 )
      ( MAKE-ON-TABLE ?AUTO_7808 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7808 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7813 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7813 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7813 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7813 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7815 - BLOCK
    )
    :vars
    (
      ?AUTO_7818 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7815 ?AUTO_7818 ) ( CLEAR ?AUTO_7815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7815 ?AUTO_7818 )
      ( MAKE-ON-TABLE ?AUTO_7815 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7815 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7819 - BLOCK
    )
    :vars
    (
      ?AUTO_7821 - BLOCK
      ?AUTO_7822 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7819 ?AUTO_7821 ) ( CLEAR ?AUTO_7819 ) ( HOLDING ?AUTO_7822 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7822 )
      ( MAKE-ON-TABLE ?AUTO_7819 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7826 - BLOCK
      ?AUTO_7827 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7826 ) ( CLEAR ?AUTO_7827 ) )
    :subtasks
    ( ( !STACK ?AUTO_7826 ?AUTO_7827 )
      ( MAKE-ON-VERIFY ?AUTO_7826 ?AUTO_7827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7830 - BLOCK
      ?AUTO_7831 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7831 ) ( ON-TABLE ?AUTO_7830 ) ( CLEAR ?AUTO_7830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7830 )
      ( MAKE-ON ?AUTO_7830 ?AUTO_7831 )
      ( MAKE-ON-VERIFY ?AUTO_7830 ?AUTO_7831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7835 - BLOCK
      ?AUTO_7836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7835 ) ( CLEAR ?AUTO_7835 ) ( HOLDING ?AUTO_7836 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7836 )
      ( MAKE-ON ?AUTO_7835 ?AUTO_7836 )
      ( MAKE-ON-VERIFY ?AUTO_7835 ?AUTO_7836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7840 - BLOCK
      ?AUTO_7841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7840 ) ( ON ?AUTO_7841 ?AUTO_7840 ) ( CLEAR ?AUTO_7841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7841 ?AUTO_7840 )
      ( MAKE-ON ?AUTO_7840 ?AUTO_7841 )
      ( MAKE-ON-VERIFY ?AUTO_7840 ?AUTO_7841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7846 - BLOCK
      ?AUTO_7847 - BLOCK
    )
    :vars
    (
      ?AUTO_7850 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7846 ) ( ON ?AUTO_7847 ?AUTO_7846 ) ( CLEAR ?AUTO_7847 ) ( HOLDING ?AUTO_7850 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7850 )
      ( MAKE-ON ?AUTO_7846 ?AUTO_7847 )
      ( MAKE-ON-VERIFY ?AUTO_7846 ?AUTO_7847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7855 - BLOCK
      ?AUTO_7856 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7855 ) ( CLEAR ?AUTO_7856 ) )
    :subtasks
    ( ( !STACK ?AUTO_7855 ?AUTO_7856 )
      ( MAKE-ON-VERIFY ?AUTO_7855 ?AUTO_7856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7859 - BLOCK
      ?AUTO_7860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7860 ) ( ON-TABLE ?AUTO_7859 ) ( CLEAR ?AUTO_7859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7859 )
      ( MAKE-ON ?AUTO_7859 ?AUTO_7860 )
      ( MAKE-ON-VERIFY ?AUTO_7859 ?AUTO_7860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7864 - BLOCK
      ?AUTO_7865 - BLOCK
    )
    :vars
    (
      ?AUTO_7869 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7864 ) ( CLEAR ?AUTO_7864 ) ( HOLDING ?AUTO_7865 ) ( CLEAR ?AUTO_7869 ) )
    :subtasks
    ( ( !STACK ?AUTO_7865 ?AUTO_7869 )
      ( MAKE-ON ?AUTO_7864 ?AUTO_7865 )
      ( MAKE-ON-VERIFY ?AUTO_7864 ?AUTO_7865 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7872 - BLOCK
      ?AUTO_7873 - BLOCK
    )
    :vars
    (
      ?AUTO_7876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7873 ) ( ON-TABLE ?AUTO_7872 ) ( CLEAR ?AUTO_7872 ) ( HOLDING ?AUTO_7876 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7876 )
      ( MAKE-ON ?AUTO_7872 ?AUTO_7873 )
      ( MAKE-ON-VERIFY ?AUTO_7872 ?AUTO_7873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7877 - BLOCK
      ?AUTO_7878 - BLOCK
    )
    :vars
    (
      ?AUTO_7881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7877 ) ( CLEAR ?AUTO_7877 ) ( ON ?AUTO_7881 ?AUTO_7878 ) ( CLEAR ?AUTO_7881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7881 ?AUTO_7878 )
      ( MAKE-ON ?AUTO_7877 ?AUTO_7878 )
      ( MAKE-ON-VERIFY ?AUTO_7877 ?AUTO_7878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7884 - BLOCK
      ?AUTO_7885 - BLOCK
    )
    :vars
    (
      ?AUTO_7888 - BLOCK
      ?AUTO_7889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7884 ) ( CLEAR ?AUTO_7884 ) ( ON ?AUTO_7888 ?AUTO_7885 ) ( CLEAR ?AUTO_7888 ) ( HOLDING ?AUTO_7889 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7889 )
      ( MAKE-ON ?AUTO_7884 ?AUTO_7885 )
      ( MAKE-ON-VERIFY ?AUTO_7884 ?AUTO_7885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7890 - BLOCK
      ?AUTO_7891 - BLOCK
    )
    :vars
    (
      ?AUTO_7894 - BLOCK
      ?AUTO_7895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7890 ) ( ON ?AUTO_7894 ?AUTO_7891 ) ( CLEAR ?AUTO_7894 ) ( ON ?AUTO_7895 ?AUTO_7890 ) ( CLEAR ?AUTO_7895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7895 ?AUTO_7890 )
      ( MAKE-ON ?AUTO_7890 ?AUTO_7891 )
      ( MAKE-ON-VERIFY ?AUTO_7890 ?AUTO_7891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7900 - BLOCK
      ?AUTO_7901 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7900 ) ( CLEAR ?AUTO_7901 ) )
    :subtasks
    ( ( !STACK ?AUTO_7900 ?AUTO_7901 )
      ( MAKE-ON-VERIFY ?AUTO_7900 ?AUTO_7901 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7904 - BLOCK
      ?AUTO_7905 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7905 ) ( ON-TABLE ?AUTO_7904 ) ( CLEAR ?AUTO_7904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7904 )
      ( MAKE-ON ?AUTO_7904 ?AUTO_7905 )
      ( MAKE-ON-VERIFY ?AUTO_7904 ?AUTO_7905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7909 - BLOCK
      ?AUTO_7910 - BLOCK
    )
    :vars
    (
      ?AUTO_7914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7909 ) ( CLEAR ?AUTO_7909 ) ( HOLDING ?AUTO_7910 ) ( CLEAR ?AUTO_7914 ) )
    :subtasks
    ( ( !STACK ?AUTO_7910 ?AUTO_7914 )
      ( MAKE-ON ?AUTO_7909 ?AUTO_7910 )
      ( MAKE-ON-VERIFY ?AUTO_7909 ?AUTO_7910 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7917 - BLOCK
      ?AUTO_7918 - BLOCK
    )
    :vars
    (
      ?AUTO_7921 - BLOCK
      ?AUTO_7922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7918 ) ( ON-TABLE ?AUTO_7917 ) ( CLEAR ?AUTO_7917 ) ( HOLDING ?AUTO_7921 ) ( CLEAR ?AUTO_7922 ) )
    :subtasks
    ( ( !STACK ?AUTO_7921 ?AUTO_7922 )
      ( MAKE-ON ?AUTO_7917 ?AUTO_7918 )
      ( MAKE-ON-VERIFY ?AUTO_7917 ?AUTO_7918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7935 - BLOCK
      ?AUTO_7936 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7935 ) ( CLEAR ?AUTO_7936 ) )
    :subtasks
    ( ( !STACK ?AUTO_7935 ?AUTO_7936 )
      ( MAKE-ON-VERIFY ?AUTO_7935 ?AUTO_7936 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7939 - BLOCK
      ?AUTO_7940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7940 ) ( ON-TABLE ?AUTO_7939 ) ( CLEAR ?AUTO_7939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7939 )
      ( MAKE-ON ?AUTO_7939 ?AUTO_7940 )
      ( MAKE-ON-VERIFY ?AUTO_7939 ?AUTO_7940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7944 - BLOCK
      ?AUTO_7945 - BLOCK
    )
    :vars
    (
      ?AUTO_7949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7944 ) ( CLEAR ?AUTO_7944 ) ( HOLDING ?AUTO_7945 ) ( CLEAR ?AUTO_7949 ) )
    :subtasks
    ( ( !STACK ?AUTO_7945 ?AUTO_7949 )
      ( MAKE-ON ?AUTO_7944 ?AUTO_7945 )
      ( MAKE-ON-VERIFY ?AUTO_7944 ?AUTO_7945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7952 - BLOCK
      ?AUTO_7953 - BLOCK
    )
    :vars
    (
      ?AUTO_7956 - BLOCK
      ?AUTO_7957 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7953 ) ( ON-TABLE ?AUTO_7952 ) ( CLEAR ?AUTO_7952 ) ( HOLDING ?AUTO_7956 ) ( CLEAR ?AUTO_7957 ) )
    :subtasks
    ( ( !STACK ?AUTO_7956 ?AUTO_7957 )
      ( MAKE-ON ?AUTO_7952 ?AUTO_7953 )
      ( MAKE-ON-VERIFY ?AUTO_7952 ?AUTO_7953 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7959 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7959 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7959 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7959 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7961 - BLOCK
    )
    :vars
    (
      ?AUTO_7964 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7961 ?AUTO_7964 ) ( CLEAR ?AUTO_7961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7961 ?AUTO_7964 )
      ( MAKE-ON-TABLE ?AUTO_7961 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7961 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7966 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7966 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7966 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7966 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7968 - BLOCK
    )
    :vars
    (
      ?AUTO_7971 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7968 ?AUTO_7971 ) ( CLEAR ?AUTO_7968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7968 ?AUTO_7971 )
      ( MAKE-ON-TABLE ?AUTO_7968 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7968 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7972 - BLOCK
    )
    :vars
    (
      ?AUTO_7974 - BLOCK
      ?AUTO_7975 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7972 ?AUTO_7974 ) ( CLEAR ?AUTO_7972 ) ( HOLDING ?AUTO_7975 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7975 )
      ( MAKE-ON-TABLE ?AUTO_7972 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7972 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7978 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7978 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7978 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7978 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7980 - BLOCK
    )
    :vars
    (
      ?AUTO_7983 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7980 ?AUTO_7983 ) ( CLEAR ?AUTO_7980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7980 ?AUTO_7983 )
      ( MAKE-ON-TABLE ?AUTO_7980 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7980 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7984 - BLOCK
    )
    :vars
    (
      ?AUTO_7986 - BLOCK
      ?AUTO_7987 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7984 ?AUTO_7986 ) ( CLEAR ?AUTO_7984 ) ( HOLDING ?AUTO_7987 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7987 )
      ( MAKE-ON-TABLE ?AUTO_7984 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7984 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7988 - BLOCK
    )
    :vars
    (
      ?AUTO_7990 - BLOCK
      ?AUTO_7991 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7988 ?AUTO_7990 ) ( ON ?AUTO_7991 ?AUTO_7988 ) ( CLEAR ?AUTO_7991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7991 ?AUTO_7988 )
      ( MAKE-ON-TABLE ?AUTO_7988 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7988 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7994 - BLOCK
    )
    :vars
    (
      ?AUTO_7995 - BLOCK
      ?AUTO_7996 - BLOCK
      ?AUTO_7998 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7994 ?AUTO_7995 ) ( ON ?AUTO_7996 ?AUTO_7994 ) ( CLEAR ?AUTO_7996 ) ( HOLDING ?AUTO_7998 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7998 )
      ( MAKE-ON-TABLE ?AUTO_7994 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7994 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8001 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8001 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8001 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8001 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8003 - BLOCK
    )
    :vars
    (
      ?AUTO_8006 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8003 ?AUTO_8006 ) ( CLEAR ?AUTO_8003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8003 ?AUTO_8006 )
      ( MAKE-ON-TABLE ?AUTO_8003 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8003 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8007 - BLOCK
    )
    :vars
    (
      ?AUTO_8009 - BLOCK
      ?AUTO_8010 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8007 ?AUTO_8009 ) ( CLEAR ?AUTO_8007 ) ( HOLDING ?AUTO_8010 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8010 )
      ( MAKE-ON-TABLE ?AUTO_8007 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8018 - BLOCK
      ?AUTO_8019 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8018 ) ( CLEAR ?AUTO_8019 ) )
    :subtasks
    ( ( !STACK ?AUTO_8018 ?AUTO_8019 )
      ( MAKE-ON-VERIFY ?AUTO_8018 ?AUTO_8019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8022 - BLOCK
      ?AUTO_8023 - BLOCK
    )
    :vars
    (
      ?AUTO_8027 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8023 ) ( ON ?AUTO_8022 ?AUTO_8027 ) ( CLEAR ?AUTO_8022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8022 ?AUTO_8027 )
      ( MAKE-ON ?AUTO_8022 ?AUTO_8023 )
      ( MAKE-ON-VERIFY ?AUTO_8022 ?AUTO_8023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8028 - BLOCK
      ?AUTO_8029 - BLOCK
    )
    :vars
    (
      ?AUTO_8032 - BLOCK
      ?AUTO_8033 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8029 ) ( ON ?AUTO_8028 ?AUTO_8032 ) ( CLEAR ?AUTO_8028 ) ( HOLDING ?AUTO_8033 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8033 )
      ( MAKE-ON ?AUTO_8028 ?AUTO_8029 )
      ( MAKE-ON-VERIFY ?AUTO_8028 ?AUTO_8029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8034 - BLOCK
      ?AUTO_8035 - BLOCK
    )
    :vars
    (
      ?AUTO_8038 - BLOCK
      ?AUTO_8039 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8035 ) ( ON ?AUTO_8034 ?AUTO_8038 ) ( ON ?AUTO_8039 ?AUTO_8034 ) ( CLEAR ?AUTO_8039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8039 ?AUTO_8034 )
      ( MAKE-ON ?AUTO_8034 ?AUTO_8035 )
      ( MAKE-ON-VERIFY ?AUTO_8034 ?AUTO_8035 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8042 - BLOCK
      ?AUTO_8043 - BLOCK
    )
    :vars
    (
      ?AUTO_8047 - BLOCK
      ?AUTO_8044 - BLOCK
      ?AUTO_8048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8043 ) ( ON ?AUTO_8042 ?AUTO_8047 ) ( ON ?AUTO_8044 ?AUTO_8042 ) ( CLEAR ?AUTO_8044 ) ( HOLDING ?AUTO_8048 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8048 )
      ( MAKE-ON ?AUTO_8042 ?AUTO_8043 )
      ( MAKE-ON-VERIFY ?AUTO_8042 ?AUTO_8043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8051 - BLOCK
      ?AUTO_8052 - BLOCK
    )
    :vars
    (
      ?AUTO_8056 - BLOCK
      ?AUTO_8053 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8051 ?AUTO_8056 ) ( ON ?AUTO_8053 ?AUTO_8051 ) ( CLEAR ?AUTO_8053 ) ( HOLDING ?AUTO_8052 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8052 )
      ( MAKE-ON ?AUTO_8051 ?AUTO_8052 )
      ( MAKE-ON-VERIFY ?AUTO_8051 ?AUTO_8052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8062 - BLOCK
      ?AUTO_8063 - BLOCK
    )
    :vars
    (
      ?AUTO_8066 - BLOCK
      ?AUTO_8067 - BLOCK
      ?AUTO_8068 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8063 ) ( ON ?AUTO_8062 ?AUTO_8066 ) ( ON ?AUTO_8067 ?AUTO_8062 ) ( ON ?AUTO_8068 ?AUTO_8067 ) ( CLEAR ?AUTO_8068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8068 ?AUTO_8067 )
      ( MAKE-ON ?AUTO_8062 ?AUTO_8063 )
      ( MAKE-ON-VERIFY ?AUTO_8062 ?AUTO_8063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8073 - BLOCK
      ?AUTO_8074 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8073 ) ( CLEAR ?AUTO_8074 ) )
    :subtasks
    ( ( !STACK ?AUTO_8073 ?AUTO_8074 )
      ( MAKE-ON-VERIFY ?AUTO_8073 ?AUTO_8074 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_8078 ) ( ON ?AUTO_8077 ?AUTO_8082 ) ( CLEAR ?AUTO_8077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8077 ?AUTO_8082 )
      ( MAKE-ON ?AUTO_8077 ?AUTO_8078 )
      ( MAKE-ON-VERIFY ?AUTO_8077 ?AUTO_8078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8083 - BLOCK
      ?AUTO_8084 - BLOCK
    )
    :vars
    (
      ?AUTO_8087 - BLOCK
      ?AUTO_8088 - BLOCK
      ?AUTO_8089 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8084 ) ( ON ?AUTO_8083 ?AUTO_8087 ) ( CLEAR ?AUTO_8083 ) ( HOLDING ?AUTO_8088 ) ( CLEAR ?AUTO_8089 ) )
    :subtasks
    ( ( !STACK ?AUTO_8088 ?AUTO_8089 )
      ( MAKE-ON ?AUTO_8083 ?AUTO_8084 )
      ( MAKE-ON-VERIFY ?AUTO_8083 ?AUTO_8084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8090 - BLOCK
      ?AUTO_8091 - BLOCK
    )
    :vars
    (
      ?AUTO_8094 - BLOCK
      ?AUTO_8096 - BLOCK
      ?AUTO_8095 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8091 ) ( ON ?AUTO_8090 ?AUTO_8094 ) ( CLEAR ?AUTO_8096 ) ( ON ?AUTO_8095 ?AUTO_8090 ) ( CLEAR ?AUTO_8095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8095 ?AUTO_8090 )
      ( MAKE-ON ?AUTO_8090 ?AUTO_8091 )
      ( MAKE-ON-VERIFY ?AUTO_8090 ?AUTO_8091 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8099 - BLOCK
      ?AUTO_8100 - BLOCK
    )
    :vars
    (
      ?AUTO_8105 - BLOCK
      ?AUTO_8102 - BLOCK
      ?AUTO_8101 - BLOCK
      ?AUTO_8106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8100 ) ( ON ?AUTO_8099 ?AUTO_8105 ) ( CLEAR ?AUTO_8102 ) ( ON ?AUTO_8101 ?AUTO_8099 ) ( CLEAR ?AUTO_8101 ) ( HOLDING ?AUTO_8106 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8106 )
      ( MAKE-ON ?AUTO_8099 ?AUTO_8100 )
      ( MAKE-ON-VERIFY ?AUTO_8099 ?AUTO_8100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8107 - BLOCK
      ?AUTO_8108 - BLOCK
    )
    :vars
    (
      ?AUTO_8114 - BLOCK
      ?AUTO_8111 - BLOCK
      ?AUTO_8109 - BLOCK
      ?AUTO_8113 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8108 ) ( ON ?AUTO_8107 ?AUTO_8114 ) ( CLEAR ?AUTO_8111 ) ( ON ?AUTO_8109 ?AUTO_8107 ) ( ON ?AUTO_8113 ?AUTO_8109 ) ( CLEAR ?AUTO_8113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8113 ?AUTO_8109 )
      ( MAKE-ON ?AUTO_8107 ?AUTO_8108 )
      ( MAKE-ON-VERIFY ?AUTO_8107 ?AUTO_8108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8117 - BLOCK
      ?AUTO_8118 - BLOCK
    )
    :vars
    (
      ?AUTO_8120 - BLOCK
      ?AUTO_8124 - BLOCK
      ?AUTO_8122 - BLOCK
      ?AUTO_8123 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8117 ?AUTO_8120 ) ( CLEAR ?AUTO_8124 ) ( ON ?AUTO_8122 ?AUTO_8117 ) ( ON ?AUTO_8123 ?AUTO_8122 ) ( CLEAR ?AUTO_8123 ) ( HOLDING ?AUTO_8118 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8118 )
      ( MAKE-ON ?AUTO_8117 ?AUTO_8118 )
      ( MAKE-ON-VERIFY ?AUTO_8117 ?AUTO_8118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8128 - BLOCK
      ?AUTO_8129 - BLOCK
    )
    :vars
    (
      ?AUTO_8130 - BLOCK
      ?AUTO_8135 - BLOCK
      ?AUTO_8133 - BLOCK
      ?AUTO_8134 - BLOCK
      ?AUTO_8136 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8129 ) ( ON ?AUTO_8128 ?AUTO_8130 ) ( CLEAR ?AUTO_8135 ) ( ON ?AUTO_8133 ?AUTO_8128 ) ( ON ?AUTO_8134 ?AUTO_8133 ) ( CLEAR ?AUTO_8134 ) ( HOLDING ?AUTO_8136 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8136 )
      ( MAKE-ON ?AUTO_8128 ?AUTO_8129 )
      ( MAKE-ON-VERIFY ?AUTO_8128 ?AUTO_8129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8137 - BLOCK
      ?AUTO_8138 - BLOCK
    )
    :vars
    (
      ?AUTO_8141 - BLOCK
      ?AUTO_8142 - BLOCK
      ?AUTO_8144 - BLOCK
      ?AUTO_8143 - BLOCK
      ?AUTO_8145 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8137 ?AUTO_8141 ) ( CLEAR ?AUTO_8142 ) ( ON ?AUTO_8144 ?AUTO_8137 ) ( ON ?AUTO_8143 ?AUTO_8144 ) ( CLEAR ?AUTO_8143 ) ( ON ?AUTO_8145 ?AUTO_8138 ) ( CLEAR ?AUTO_8145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8145 ?AUTO_8138 )
      ( MAKE-ON ?AUTO_8137 ?AUTO_8138 )
      ( MAKE-ON-VERIFY ?AUTO_8137 ?AUTO_8138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8148 - BLOCK
      ?AUTO_8149 - BLOCK
    )
    :vars
    (
      ?AUTO_8154 - BLOCK
      ?AUTO_8153 - BLOCK
      ?AUTO_8156 - BLOCK
      ?AUTO_8151 - BLOCK
      ?AUTO_8150 - BLOCK
      ?AUTO_8157 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8148 ?AUTO_8154 ) ( CLEAR ?AUTO_8153 ) ( ON ?AUTO_8156 ?AUTO_8148 ) ( ON ?AUTO_8151 ?AUTO_8156 ) ( CLEAR ?AUTO_8151 ) ( ON ?AUTO_8150 ?AUTO_8149 ) ( CLEAR ?AUTO_8150 ) ( HOLDING ?AUTO_8157 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8157 )
      ( MAKE-ON ?AUTO_8148 ?AUTO_8149 )
      ( MAKE-ON-VERIFY ?AUTO_8148 ?AUTO_8149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8158 - BLOCK
      ?AUTO_8159 - BLOCK
    )
    :vars
    (
      ?AUTO_8166 - BLOCK
      ?AUTO_8160 - BLOCK
      ?AUTO_8161 - BLOCK
      ?AUTO_8162 - BLOCK
      ?AUTO_8167 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8158 ?AUTO_8166 ) ( ON ?AUTO_8160 ?AUTO_8158 ) ( ON ?AUTO_8161 ?AUTO_8160 ) ( ON ?AUTO_8162 ?AUTO_8159 ) ( CLEAR ?AUTO_8162 ) ( ON ?AUTO_8167 ?AUTO_8161 ) ( CLEAR ?AUTO_8167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8167 ?AUTO_8161 )
      ( MAKE-ON ?AUTO_8158 ?AUTO_8159 )
      ( MAKE-ON-VERIFY ?AUTO_8158 ?AUTO_8159 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8172 - BLOCK
      ?AUTO_8173 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8172 ) ( CLEAR ?AUTO_8173 ) )
    :subtasks
    ( ( !STACK ?AUTO_8172 ?AUTO_8173 )
      ( MAKE-ON-VERIFY ?AUTO_8172 ?AUTO_8173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8176 - BLOCK
      ?AUTO_8177 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8177 ) ( ON-TABLE ?AUTO_8176 ) ( CLEAR ?AUTO_8176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8176 )
      ( MAKE-ON ?AUTO_8176 ?AUTO_8177 )
      ( MAKE-ON-VERIFY ?AUTO_8176 ?AUTO_8177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8181 - BLOCK
      ?AUTO_8182 - BLOCK
    )
    :vars
    (
      ?AUTO_8185 - BLOCK
      ?AUTO_8186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8182 ) ( ON-TABLE ?AUTO_8181 ) ( CLEAR ?AUTO_8181 ) ( HOLDING ?AUTO_8185 ) ( CLEAR ?AUTO_8186 ) )
    :subtasks
    ( ( !STACK ?AUTO_8185 ?AUTO_8186 )
      ( MAKE-ON ?AUTO_8181 ?AUTO_8182 )
      ( MAKE-ON-VERIFY ?AUTO_8181 ?AUTO_8182 ) )
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
      ?AUTO_8191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8187 ) ( CLEAR ?AUTO_8187 ) ( CLEAR ?AUTO_8192 ) ( ON ?AUTO_8191 ?AUTO_8188 ) ( CLEAR ?AUTO_8191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8191 ?AUTO_8188 )
      ( MAKE-ON ?AUTO_8187 ?AUTO_8188 )
      ( MAKE-ON-VERIFY ?AUTO_8187 ?AUTO_8188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8195 - BLOCK
      ?AUTO_8196 - BLOCK
    )
    :vars
    (
      ?AUTO_8197 - BLOCK
      ?AUTO_8200 - BLOCK
      ?AUTO_8201 - BLOCK
      ?AUTO_8202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8195 ) ( CLEAR ?AUTO_8195 ) ( CLEAR ?AUTO_8197 ) ( ON ?AUTO_8200 ?AUTO_8196 ) ( CLEAR ?AUTO_8200 ) ( HOLDING ?AUTO_8201 ) ( CLEAR ?AUTO_8202 ) )
    :subtasks
    ( ( !STACK ?AUTO_8201 ?AUTO_8202 )
      ( MAKE-ON ?AUTO_8195 ?AUTO_8196 )
      ( MAKE-ON-VERIFY ?AUTO_8195 ?AUTO_8196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8203 - BLOCK
      ?AUTO_8204 - BLOCK
    )
    :vars
    (
      ?AUTO_8206 - BLOCK
      ?AUTO_8208 - BLOCK
      ?AUTO_8210 - BLOCK
      ?AUTO_8209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8203 ) ( CLEAR ?AUTO_8203 ) ( CLEAR ?AUTO_8206 ) ( ON ?AUTO_8208 ?AUTO_8204 ) ( CLEAR ?AUTO_8210 ) ( ON ?AUTO_8209 ?AUTO_8208 ) ( CLEAR ?AUTO_8209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8209 ?AUTO_8208 )
      ( MAKE-ON ?AUTO_8203 ?AUTO_8204 )
      ( MAKE-ON-VERIFY ?AUTO_8203 ?AUTO_8204 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8213 - BLOCK
      ?AUTO_8214 - BLOCK
    )
    :vars
    (
      ?AUTO_8217 - BLOCK
      ?AUTO_8220 - BLOCK
      ?AUTO_8219 - BLOCK
      ?AUTO_8218 - BLOCK
      ?AUTO_8221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8213 ) ( CLEAR ?AUTO_8213 ) ( CLEAR ?AUTO_8217 ) ( ON ?AUTO_8220 ?AUTO_8214 ) ( CLEAR ?AUTO_8219 ) ( ON ?AUTO_8218 ?AUTO_8220 ) ( CLEAR ?AUTO_8218 ) ( HOLDING ?AUTO_8221 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8221 )
      ( MAKE-ON ?AUTO_8213 ?AUTO_8214 )
      ( MAKE-ON-VERIFY ?AUTO_8213 ?AUTO_8214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8222 - BLOCK
      ?AUTO_8223 - BLOCK
    )
    :vars
    (
      ?AUTO_8229 - BLOCK
      ?AUTO_8225 - BLOCK
      ?AUTO_8224 - BLOCK
      ?AUTO_8228 - BLOCK
      ?AUTO_8230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8222 ) ( CLEAR ?AUTO_8222 ) ( CLEAR ?AUTO_8229 ) ( ON ?AUTO_8225 ?AUTO_8223 ) ( CLEAR ?AUTO_8224 ) ( ON ?AUTO_8228 ?AUTO_8225 ) ( ON ?AUTO_8230 ?AUTO_8228 ) ( CLEAR ?AUTO_8230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8230 ?AUTO_8228 )
      ( MAKE-ON ?AUTO_8222 ?AUTO_8223 )
      ( MAKE-ON-VERIFY ?AUTO_8222 ?AUTO_8223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8233 - BLOCK
      ?AUTO_8234 - BLOCK
    )
    :vars
    (
      ?AUTO_8238 - BLOCK
      ?AUTO_8239 - BLOCK
      ?AUTO_8240 - BLOCK
      ?AUTO_8236 - BLOCK
      ?AUTO_8237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8233 ) ( CLEAR ?AUTO_8233 ) ( ON ?AUTO_8238 ?AUTO_8234 ) ( CLEAR ?AUTO_8239 ) ( ON ?AUTO_8240 ?AUTO_8238 ) ( ON ?AUTO_8236 ?AUTO_8240 ) ( CLEAR ?AUTO_8236 ) ( HOLDING ?AUTO_8237 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8237 )
      ( MAKE-ON ?AUTO_8233 ?AUTO_8234 )
      ( MAKE-ON-VERIFY ?AUTO_8233 ?AUTO_8234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8243 - BLOCK
      ?AUTO_8244 - BLOCK
    )
    :vars
    (
      ?AUTO_8249 - BLOCK
      ?AUTO_8248 - BLOCK
      ?AUTO_8251 - BLOCK
      ?AUTO_8247 - BLOCK
      ?AUTO_8250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8243 ) ( ON ?AUTO_8249 ?AUTO_8244 ) ( CLEAR ?AUTO_8248 ) ( ON ?AUTO_8251 ?AUTO_8249 ) ( ON ?AUTO_8247 ?AUTO_8251 ) ( CLEAR ?AUTO_8247 ) ( ON ?AUTO_8250 ?AUTO_8243 ) ( CLEAR ?AUTO_8250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8250 ?AUTO_8243 )
      ( MAKE-ON ?AUTO_8243 ?AUTO_8244 )
      ( MAKE-ON-VERIFY ?AUTO_8243 ?AUTO_8244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8254 - BLOCK
      ?AUTO_8255 - BLOCK
    )
    :vars
    (
      ?AUTO_8257 - BLOCK
      ?AUTO_8259 - BLOCK
      ?AUTO_8258 - BLOCK
      ?AUTO_8261 - BLOCK
      ?AUTO_8256 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8254 ) ( ON ?AUTO_8257 ?AUTO_8255 ) ( ON ?AUTO_8259 ?AUTO_8257 ) ( ON ?AUTO_8258 ?AUTO_8259 ) ( CLEAR ?AUTO_8258 ) ( ON ?AUTO_8261 ?AUTO_8254 ) ( CLEAR ?AUTO_8261 ) ( HOLDING ?AUTO_8256 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8256 )
      ( MAKE-ON ?AUTO_8254 ?AUTO_8255 )
      ( MAKE-ON-VERIFY ?AUTO_8254 ?AUTO_8255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8264 - BLOCK
      ?AUTO_8265 - BLOCK
    )
    :vars
    (
      ?AUTO_8267 - BLOCK
      ?AUTO_8272 - BLOCK
      ?AUTO_8266 - BLOCK
      ?AUTO_8271 - BLOCK
      ?AUTO_8268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8264 ) ( ON ?AUTO_8267 ?AUTO_8265 ) ( ON ?AUTO_8272 ?AUTO_8267 ) ( ON ?AUTO_8266 ?AUTO_8272 ) ( CLEAR ?AUTO_8266 ) ( ON ?AUTO_8271 ?AUTO_8264 ) ( ON ?AUTO_8268 ?AUTO_8271 ) ( CLEAR ?AUTO_8268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8268 ?AUTO_8271 )
      ( MAKE-ON ?AUTO_8264 ?AUTO_8265 )
      ( MAKE-ON-VERIFY ?AUTO_8264 ?AUTO_8265 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8275 - BLOCK
      ?AUTO_8276 - BLOCK
    )
    :vars
    (
      ?AUTO_8277 - BLOCK
      ?AUTO_8282 - BLOCK
      ?AUTO_8283 - BLOCK
      ?AUTO_8278 - BLOCK
      ?AUTO_8281 - BLOCK
      ?AUTO_8284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8275 ) ( ON ?AUTO_8277 ?AUTO_8276 ) ( ON ?AUTO_8282 ?AUTO_8277 ) ( ON ?AUTO_8283 ?AUTO_8282 ) ( CLEAR ?AUTO_8283 ) ( ON ?AUTO_8278 ?AUTO_8275 ) ( ON ?AUTO_8281 ?AUTO_8278 ) ( CLEAR ?AUTO_8281 ) ( HOLDING ?AUTO_8284 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8284 )
      ( MAKE-ON ?AUTO_8275 ?AUTO_8276 )
      ( MAKE-ON-VERIFY ?AUTO_8275 ?AUTO_8276 ) )
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
      ?AUTO_8288 - BLOCK
      ?AUTO_8294 - BLOCK
      ?AUTO_8287 - BLOCK
      ?AUTO_8293 - BLOCK
      ?AUTO_8290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8285 ) ( ON ?AUTO_8289 ?AUTO_8286 ) ( ON ?AUTO_8288 ?AUTO_8289 ) ( ON ?AUTO_8294 ?AUTO_8288 ) ( ON ?AUTO_8287 ?AUTO_8285 ) ( ON ?AUTO_8293 ?AUTO_8287 ) ( CLEAR ?AUTO_8293 ) ( ON ?AUTO_8290 ?AUTO_8294 ) ( CLEAR ?AUTO_8290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8290 ?AUTO_8294 )
      ( MAKE-ON ?AUTO_8285 ?AUTO_8286 )
      ( MAKE-ON-VERIFY ?AUTO_8285 ?AUTO_8286 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8298 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8298 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8298 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8298 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8300 - BLOCK
    )
    :vars
    (
      ?AUTO_8303 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8300 ?AUTO_8303 ) ( CLEAR ?AUTO_8300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8300 ?AUTO_8303 )
      ( MAKE-ON-TABLE ?AUTO_8300 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8300 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8304 - BLOCK
    )
    :vars
    (
      ?AUTO_8306 - BLOCK
      ?AUTO_8307 - BLOCK
      ?AUTO_8308 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8304 ?AUTO_8306 ) ( CLEAR ?AUTO_8304 ) ( HOLDING ?AUTO_8307 ) ( CLEAR ?AUTO_8308 ) )
    :subtasks
    ( ( !STACK ?AUTO_8307 ?AUTO_8308 )
      ( MAKE-ON-TABLE ?AUTO_8304 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8304 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8315 - BLOCK
    )
    :vars
    (
      ?AUTO_8317 - BLOCK
      ?AUTO_8319 - BLOCK
      ?AUTO_8318 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8315 ?AUTO_8317 ) ( CLEAR ?AUTO_8319 ) ( ON ?AUTO_8318 ?AUTO_8315 ) ( CLEAR ?AUTO_8318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8318 ?AUTO_8315 )
      ( MAKE-ON-TABLE ?AUTO_8315 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8315 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8322 - BLOCK
    )
    :vars
    (
      ?AUTO_8323 - BLOCK
      ?AUTO_8324 - BLOCK
      ?AUTO_8325 - BLOCK
      ?AUTO_8327 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8322 ?AUTO_8323 ) ( CLEAR ?AUTO_8324 ) ( ON ?AUTO_8325 ?AUTO_8322 ) ( CLEAR ?AUTO_8325 ) ( HOLDING ?AUTO_8327 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8327 )
      ( MAKE-ON-TABLE ?AUTO_8322 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8322 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8332 - BLOCK
    )
    :vars
    (
      ?AUTO_8336 - BLOCK
      ?AUTO_8337 - BLOCK
      ?AUTO_8334 - BLOCK
      ?AUTO_8333 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8332 ?AUTO_8336 ) ( CLEAR ?AUTO_8337 ) ( ON ?AUTO_8334 ?AUTO_8332 ) ( ON ?AUTO_8333 ?AUTO_8334 ) ( CLEAR ?AUTO_8333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8333 ?AUTO_8334 )
      ( MAKE-ON-TABLE ?AUTO_8332 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8342 - BLOCK
      ?AUTO_8343 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8342 ) ( CLEAR ?AUTO_8343 ) )
    :subtasks
    ( ( !STACK ?AUTO_8342 ?AUTO_8343 )
      ( MAKE-ON-VERIFY ?AUTO_8342 ?AUTO_8343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8346 - BLOCK
      ?AUTO_8347 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8347 ) ( ON-TABLE ?AUTO_8346 ) ( CLEAR ?AUTO_8346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8346 )
      ( MAKE-ON ?AUTO_8346 ?AUTO_8347 )
      ( MAKE-ON-VERIFY ?AUTO_8346 ?AUTO_8347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8351 - BLOCK
      ?AUTO_8352 - BLOCK
    )
    :vars
    (
      ?AUTO_8355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8352 ) ( ON-TABLE ?AUTO_8351 ) ( CLEAR ?AUTO_8351 ) ( HOLDING ?AUTO_8355 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8355 )
      ( MAKE-ON ?AUTO_8351 ?AUTO_8352 )
      ( MAKE-ON-VERIFY ?AUTO_8351 ?AUTO_8352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8356 - BLOCK
      ?AUTO_8357 - BLOCK
    )
    :vars
    (
      ?AUTO_8360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8357 ) ( ON-TABLE ?AUTO_8356 ) ( ON ?AUTO_8360 ?AUTO_8356 ) ( CLEAR ?AUTO_8360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8360 ?AUTO_8356 )
      ( MAKE-ON ?AUTO_8356 ?AUTO_8357 )
      ( MAKE-ON-VERIFY ?AUTO_8356 ?AUTO_8357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8363 - BLOCK
      ?AUTO_8364 - BLOCK
    )
    :vars
    (
      ?AUTO_8366 - BLOCK
      ?AUTO_8368 - BLOCK
      ?AUTO_8369 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8364 ) ( ON-TABLE ?AUTO_8363 ) ( ON ?AUTO_8366 ?AUTO_8363 ) ( CLEAR ?AUTO_8366 ) ( HOLDING ?AUTO_8368 ) ( CLEAR ?AUTO_8369 ) )
    :subtasks
    ( ( !STACK ?AUTO_8368 ?AUTO_8369 )
      ( MAKE-ON ?AUTO_8363 ?AUTO_8364 )
      ( MAKE-ON-VERIFY ?AUTO_8363 ?AUTO_8364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8372 - BLOCK
      ?AUTO_8373 - BLOCK
    )
    :vars
    (
      ?AUTO_8375 - BLOCK
      ?AUTO_8378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8372 ) ( ON ?AUTO_8375 ?AUTO_8372 ) ( CLEAR ?AUTO_8375 ) ( HOLDING ?AUTO_8373 ) ( CLEAR ?AUTO_8378 ) )
    :subtasks
    ( ( !STACK ?AUTO_8373 ?AUTO_8378 )
      ( MAKE-ON ?AUTO_8372 ?AUTO_8373 )
      ( MAKE-ON-VERIFY ?AUTO_8372 ?AUTO_8373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8393 - BLOCK
      ?AUTO_8394 - BLOCK
    )
    :vars
    (
      ?AUTO_8397 - BLOCK
      ?AUTO_8400 - BLOCK
      ?AUTO_8395 - BLOCK
      ?AUTO_8398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8397 ) ( ON ?AUTO_8400 ?AUTO_8394 ) ( CLEAR ?AUTO_8395 ) ( ON ?AUTO_8398 ?AUTO_8400 ) ( CLEAR ?AUTO_8398 ) ( HOLDING ?AUTO_8393 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8393 )
      ( MAKE-ON ?AUTO_8393 ?AUTO_8394 )
      ( MAKE-ON-VERIFY ?AUTO_8393 ?AUTO_8394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8402 - BLOCK
      ?AUTO_8403 - BLOCK
    )
    :vars
    (
      ?AUTO_8409 - BLOCK
      ?AUTO_8407 - BLOCK
      ?AUTO_8406 - BLOCK
      ?AUTO_8408 - BLOCK
      ?AUTO_8411 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8409 ) ( ON ?AUTO_8407 ?AUTO_8403 ) ( CLEAR ?AUTO_8406 ) ( ON ?AUTO_8408 ?AUTO_8407 ) ( CLEAR ?AUTO_8408 ) ( ON ?AUTO_8402 ?AUTO_8411 ) ( CLEAR ?AUTO_8402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8402 ?AUTO_8411 )
      ( MAKE-ON ?AUTO_8402 ?AUTO_8403 )
      ( MAKE-ON-VERIFY ?AUTO_8402 ?AUTO_8403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8412 - BLOCK
      ?AUTO_8413 - BLOCK
    )
    :vars
    (
      ?AUTO_8418 - BLOCK
      ?AUTO_8415 - BLOCK
      ?AUTO_8419 - BLOCK
      ?AUTO_8414 - BLOCK
      ?AUTO_8420 - BLOCK
      ?AUTO_8421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8418 ) ( ON ?AUTO_8415 ?AUTO_8413 ) ( CLEAR ?AUTO_8419 ) ( ON ?AUTO_8414 ?AUTO_8415 ) ( CLEAR ?AUTO_8414 ) ( ON ?AUTO_8412 ?AUTO_8420 ) ( CLEAR ?AUTO_8412 ) ( HOLDING ?AUTO_8421 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8421 )
      ( MAKE-ON ?AUTO_8412 ?AUTO_8413 )
      ( MAKE-ON-VERIFY ?AUTO_8412 ?AUTO_8413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8422 - BLOCK
      ?AUTO_8423 - BLOCK
    )
    :vars
    (
      ?AUTO_8424 - BLOCK
      ?AUTO_8427 - BLOCK
      ?AUTO_8431 - BLOCK
      ?AUTO_8430 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8424 ?AUTO_8423 ) ( ON ?AUTO_8427 ?AUTO_8424 ) ( ON ?AUTO_8422 ?AUTO_8431 ) ( CLEAR ?AUTO_8422 ) ( ON ?AUTO_8430 ?AUTO_8427 ) ( CLEAR ?AUTO_8430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8430 ?AUTO_8427 )
      ( MAKE-ON ?AUTO_8422 ?AUTO_8423 )
      ( MAKE-ON-VERIFY ?AUTO_8422 ?AUTO_8423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8436 - BLOCK
      ?AUTO_8437 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8436 ) ( CLEAR ?AUTO_8437 ) )
    :subtasks
    ( ( !STACK ?AUTO_8436 ?AUTO_8437 )
      ( MAKE-ON-VERIFY ?AUTO_8436 ?AUTO_8437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8440 - BLOCK
      ?AUTO_8441 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8441 ) ( ON-TABLE ?AUTO_8440 ) ( CLEAR ?AUTO_8440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8440 )
      ( MAKE-ON ?AUTO_8440 ?AUTO_8441 )
      ( MAKE-ON-VERIFY ?AUTO_8440 ?AUTO_8441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8445 - BLOCK
      ?AUTO_8446 - BLOCK
    )
    :vars
    (
      ?AUTO_8450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8445 ) ( CLEAR ?AUTO_8445 ) ( HOLDING ?AUTO_8446 ) ( CLEAR ?AUTO_8450 ) )
    :subtasks
    ( ( !STACK ?AUTO_8446 ?AUTO_8450 )
      ( MAKE-ON ?AUTO_8445 ?AUTO_8446 )
      ( MAKE-ON-VERIFY ?AUTO_8445 ?AUTO_8446 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8524 - BLOCK
      ?AUTO_8525 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8524 ) ( CLEAR ?AUTO_8525 ) )
    :subtasks
    ( ( !STACK ?AUTO_8524 ?AUTO_8525 )
      ( MAKE-ON-VERIFY ?AUTO_8524 ?AUTO_8525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8528 - BLOCK
      ?AUTO_8529 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8529 ) ( ON-TABLE ?AUTO_8528 ) ( CLEAR ?AUTO_8528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8528 )
      ( MAKE-ON ?AUTO_8528 ?AUTO_8529 )
      ( MAKE-ON-VERIFY ?AUTO_8528 ?AUTO_8529 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8533 - BLOCK
      ?AUTO_8534 - BLOCK
    )
    :vars
    (
      ?AUTO_8538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8533 ) ( CLEAR ?AUTO_8533 ) ( HOLDING ?AUTO_8534 ) ( CLEAR ?AUTO_8538 ) )
    :subtasks
    ( ( !STACK ?AUTO_8534 ?AUTO_8538 )
      ( MAKE-ON ?AUTO_8533 ?AUTO_8534 )
      ( MAKE-ON-VERIFY ?AUTO_8533 ?AUTO_8534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8541 - BLOCK
      ?AUTO_8542 - BLOCK
    )
    :vars
    (
      ?AUTO_8545 - BLOCK
      ?AUTO_8546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8542 ) ( ON-TABLE ?AUTO_8541 ) ( CLEAR ?AUTO_8541 ) ( HOLDING ?AUTO_8545 ) ( CLEAR ?AUTO_8546 ) )
    :subtasks
    ( ( !STACK ?AUTO_8545 ?AUTO_8546 )
      ( MAKE-ON ?AUTO_8541 ?AUTO_8542 )
      ( MAKE-ON-VERIFY ?AUTO_8541 ?AUTO_8542 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8548 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8548 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8548 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8548 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8550 - BLOCK
    )
    :vars
    (
      ?AUTO_8553 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8550 ?AUTO_8553 ) ( CLEAR ?AUTO_8550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8550 ?AUTO_8553 )
      ( MAKE-ON-TABLE ?AUTO_8550 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8556 - BLOCK
      ?AUTO_8557 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8556 ) ( CLEAR ?AUTO_8557 ) )
    :subtasks
    ( ( !STACK ?AUTO_8556 ?AUTO_8557 )
      ( MAKE-ON-VERIFY ?AUTO_8556 ?AUTO_8557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8560 - BLOCK
      ?AUTO_8561 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8561 ) ( ON-TABLE ?AUTO_8560 ) ( CLEAR ?AUTO_8560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8560 )
      ( MAKE-ON ?AUTO_8560 ?AUTO_8561 )
      ( MAKE-ON-VERIFY ?AUTO_8560 ?AUTO_8561 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8565 - BLOCK
      ?AUTO_8566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8565 ) ( CLEAR ?AUTO_8565 ) ( HOLDING ?AUTO_8566 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8566 )
      ( MAKE-ON ?AUTO_8565 ?AUTO_8566 )
      ( MAKE-ON-VERIFY ?AUTO_8565 ?AUTO_8566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8574 - BLOCK
      ?AUTO_8575 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8574 ) ( CLEAR ?AUTO_8575 ) )
    :subtasks
    ( ( !STACK ?AUTO_8574 ?AUTO_8575 )
      ( MAKE-ON-VERIFY ?AUTO_8574 ?AUTO_8575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8578 - BLOCK
      ?AUTO_8579 - BLOCK
    )
    :vars
    (
      ?AUTO_8583 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8579 ) ( ON ?AUTO_8578 ?AUTO_8583 ) ( CLEAR ?AUTO_8578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8578 ?AUTO_8583 )
      ( MAKE-ON ?AUTO_8578 ?AUTO_8579 )
      ( MAKE-ON-VERIFY ?AUTO_8578 ?AUTO_8579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8584 - BLOCK
      ?AUTO_8585 - BLOCK
    )
    :vars
    (
      ?AUTO_8588 - BLOCK
      ?AUTO_8589 - BLOCK
      ?AUTO_8590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8585 ) ( ON ?AUTO_8584 ?AUTO_8588 ) ( CLEAR ?AUTO_8584 ) ( HOLDING ?AUTO_8589 ) ( CLEAR ?AUTO_8590 ) )
    :subtasks
    ( ( !STACK ?AUTO_8589 ?AUTO_8590 )
      ( MAKE-ON ?AUTO_8584 ?AUTO_8585 )
      ( MAKE-ON-VERIFY ?AUTO_8584 ?AUTO_8585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8595 - BLOCK
      ?AUTO_8596 - BLOCK
    )
    :vars
    (
      ?AUTO_8597 - BLOCK
      ?AUTO_8600 - BLOCK
      ?AUTO_8601 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8596 ) ( ON ?AUTO_8595 ?AUTO_8597 ) ( CLEAR ?AUTO_8600 ) ( ON ?AUTO_8601 ?AUTO_8595 ) ( CLEAR ?AUTO_8601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8601 ?AUTO_8595 )
      ( MAKE-ON ?AUTO_8595 ?AUTO_8596 )
      ( MAKE-ON-VERIFY ?AUTO_8595 ?AUTO_8596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8606 - BLOCK
      ?AUTO_8607 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8606 ) ( CLEAR ?AUTO_8607 ) )
    :subtasks
    ( ( !STACK ?AUTO_8606 ?AUTO_8607 )
      ( MAKE-ON-VERIFY ?AUTO_8606 ?AUTO_8607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8610 - BLOCK
      ?AUTO_8611 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8611 ) ( ON-TABLE ?AUTO_8610 ) ( CLEAR ?AUTO_8610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8610 )
      ( MAKE-ON ?AUTO_8610 ?AUTO_8611 )
      ( MAKE-ON-VERIFY ?AUTO_8610 ?AUTO_8611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8615 - BLOCK
      ?AUTO_8616 - BLOCK
    )
    :vars
    (
      ?AUTO_8620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8615 ) ( CLEAR ?AUTO_8615 ) ( HOLDING ?AUTO_8616 ) ( CLEAR ?AUTO_8620 ) )
    :subtasks
    ( ( !STACK ?AUTO_8616 ?AUTO_8620 )
      ( MAKE-ON ?AUTO_8615 ?AUTO_8616 )
      ( MAKE-ON-VERIFY ?AUTO_8615 ?AUTO_8616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8621 - BLOCK
      ?AUTO_8622 - BLOCK
    )
    :vars
    (
      ?AUTO_8624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8621 ) ( CLEAR ?AUTO_8624 ) ( ON ?AUTO_8622 ?AUTO_8621 ) ( CLEAR ?AUTO_8622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8622 ?AUTO_8621 )
      ( MAKE-ON ?AUTO_8621 ?AUTO_8622 )
      ( MAKE-ON-VERIFY ?AUTO_8621 ?AUTO_8622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8628 - BLOCK
      ?AUTO_8629 - BLOCK
    )
    :vars
    (
      ?AUTO_8630 - BLOCK
      ?AUTO_8633 - BLOCK
      ?AUTO_8634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8628 ) ( CLEAR ?AUTO_8630 ) ( ON ?AUTO_8629 ?AUTO_8628 ) ( CLEAR ?AUTO_8629 ) ( HOLDING ?AUTO_8633 ) ( CLEAR ?AUTO_8634 ) )
    :subtasks
    ( ( !STACK ?AUTO_8633 ?AUTO_8634 )
      ( MAKE-ON ?AUTO_8628 ?AUTO_8629 )
      ( MAKE-ON-VERIFY ?AUTO_8628 ?AUTO_8629 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8639 - BLOCK
      ?AUTO_8640 - BLOCK
    )
    :vars
    (
      ?AUTO_8643 - BLOCK
      ?AUTO_8645 - BLOCK
      ?AUTO_8644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8639 ) ( CLEAR ?AUTO_8643 ) ( ON ?AUTO_8640 ?AUTO_8639 ) ( CLEAR ?AUTO_8645 ) ( ON ?AUTO_8644 ?AUTO_8640 ) ( CLEAR ?AUTO_8644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8644 ?AUTO_8640 )
      ( MAKE-ON ?AUTO_8639 ?AUTO_8640 )
      ( MAKE-ON-VERIFY ?AUTO_8639 ?AUTO_8640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8650 - BLOCK
      ?AUTO_8651 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8650 ) ( CLEAR ?AUTO_8651 ) )
    :subtasks
    ( ( !STACK ?AUTO_8650 ?AUTO_8651 )
      ( MAKE-ON-VERIFY ?AUTO_8650 ?AUTO_8651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8654 - BLOCK
      ?AUTO_8655 - BLOCK
    )
    :vars
    (
      ?AUTO_8659 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8655 ) ( ON ?AUTO_8654 ?AUTO_8659 ) ( CLEAR ?AUTO_8654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8654 ?AUTO_8659 )
      ( MAKE-ON ?AUTO_8654 ?AUTO_8655 )
      ( MAKE-ON-VERIFY ?AUTO_8654 ?AUTO_8655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8660 - BLOCK
      ?AUTO_8661 - BLOCK
    )
    :vars
    (
      ?AUTO_8664 - BLOCK
      ?AUTO_8666 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8660 ?AUTO_8664 ) ( CLEAR ?AUTO_8660 ) ( HOLDING ?AUTO_8661 ) ( CLEAR ?AUTO_8666 ) )
    :subtasks
    ( ( !STACK ?AUTO_8661 ?AUTO_8666 )
      ( MAKE-ON ?AUTO_8660 ?AUTO_8661 )
      ( MAKE-ON-VERIFY ?AUTO_8660 ?AUTO_8661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8669 - BLOCK
      ?AUTO_8670 - BLOCK
    )
    :vars
    (
      ?AUTO_8672 - BLOCK
      ?AUTO_8674 - BLOCK
      ?AUTO_8675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8670 ) ( ON ?AUTO_8669 ?AUTO_8672 ) ( CLEAR ?AUTO_8669 ) ( HOLDING ?AUTO_8674 ) ( CLEAR ?AUTO_8675 ) )
    :subtasks
    ( ( !STACK ?AUTO_8674 ?AUTO_8675 )
      ( MAKE-ON ?AUTO_8669 ?AUTO_8670 )
      ( MAKE-ON-VERIFY ?AUTO_8669 ?AUTO_8670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8676 - BLOCK
      ?AUTO_8677 - BLOCK
    )
    :vars
    (
      ?AUTO_8680 - BLOCK
      ?AUTO_8682 - BLOCK
      ?AUTO_8681 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8676 ?AUTO_8680 ) ( CLEAR ?AUTO_8676 ) ( CLEAR ?AUTO_8682 ) ( ON ?AUTO_8681 ?AUTO_8677 ) ( CLEAR ?AUTO_8681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8681 ?AUTO_8677 )
      ( MAKE-ON ?AUTO_8676 ?AUTO_8677 )
      ( MAKE-ON-VERIFY ?AUTO_8676 ?AUTO_8677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8685 - BLOCK
      ?AUTO_8686 - BLOCK
    )
    :vars
    (
      ?AUTO_8691 - BLOCK
      ?AUTO_8687 - BLOCK
      ?AUTO_8690 - BLOCK
      ?AUTO_8692 - BLOCK
      ?AUTO_8693 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8685 ?AUTO_8691 ) ( CLEAR ?AUTO_8685 ) ( CLEAR ?AUTO_8687 ) ( ON ?AUTO_8690 ?AUTO_8686 ) ( CLEAR ?AUTO_8690 ) ( HOLDING ?AUTO_8692 ) ( CLEAR ?AUTO_8693 ) )
    :subtasks
    ( ( !STACK ?AUTO_8692 ?AUTO_8693 )
      ( MAKE-ON ?AUTO_8685 ?AUTO_8686 )
      ( MAKE-ON-VERIFY ?AUTO_8685 ?AUTO_8686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8698 - BLOCK
      ?AUTO_8699 - BLOCK
    )
    :vars
    (
      ?AUTO_8705 - BLOCK
      ?AUTO_8704 - BLOCK
      ?AUTO_8706 - BLOCK
      ?AUTO_8702 - BLOCK
      ?AUTO_8700 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8698 ?AUTO_8705 ) ( CLEAR ?AUTO_8698 ) ( CLEAR ?AUTO_8704 ) ( ON ?AUTO_8706 ?AUTO_8699 ) ( CLEAR ?AUTO_8702 ) ( ON ?AUTO_8700 ?AUTO_8706 ) ( CLEAR ?AUTO_8700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8700 ?AUTO_8706 )
      ( MAKE-ON ?AUTO_8698 ?AUTO_8699 )
      ( MAKE-ON-VERIFY ?AUTO_8698 ?AUTO_8699 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8710 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8710 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8710 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8710 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8712 - BLOCK
    )
    :vars
    (
      ?AUTO_8715 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8712 ?AUTO_8715 ) ( CLEAR ?AUTO_8712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8712 ?AUTO_8715 )
      ( MAKE-ON-TABLE ?AUTO_8712 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8712 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8716 - BLOCK
    )
    :vars
    (
      ?AUTO_8718 - BLOCK
      ?AUTO_8719 - BLOCK
      ?AUTO_8720 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8716 ?AUTO_8718 ) ( CLEAR ?AUTO_8716 ) ( HOLDING ?AUTO_8719 ) ( CLEAR ?AUTO_8720 ) )
    :subtasks
    ( ( !STACK ?AUTO_8719 ?AUTO_8720 )
      ( MAKE-ON-TABLE ?AUTO_8716 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8716 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8721 - BLOCK
    )
    :vars
    (
      ?AUTO_8723 - BLOCK
      ?AUTO_8725 - BLOCK
      ?AUTO_8724 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8721 ?AUTO_8723 ) ( CLEAR ?AUTO_8725 ) ( ON ?AUTO_8724 ?AUTO_8721 ) ( CLEAR ?AUTO_8724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8724 ?AUTO_8721 )
      ( MAKE-ON-TABLE ?AUTO_8721 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8721 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8728 - BLOCK
    )
    :vars
    (
      ?AUTO_8731 - BLOCK
      ?AUTO_8732 - BLOCK
      ?AUTO_8729 - BLOCK
      ?AUTO_8734 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8728 ?AUTO_8731 ) ( ON ?AUTO_8732 ?AUTO_8728 ) ( CLEAR ?AUTO_8732 ) ( HOLDING ?AUTO_8729 ) ( CLEAR ?AUTO_8734 ) )
    :subtasks
    ( ( !STACK ?AUTO_8729 ?AUTO_8734 )
      ( MAKE-ON-TABLE ?AUTO_8728 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8728 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8743 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8743 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8743 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8743 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8745 - BLOCK
    )
    :vars
    (
      ?AUTO_8748 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8745 ?AUTO_8748 ) ( CLEAR ?AUTO_8745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8745 ?AUTO_8748 )
      ( MAKE-ON-TABLE ?AUTO_8745 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8745 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8749 - BLOCK
    )
    :vars
    (
      ?AUTO_8751 - BLOCK
      ?AUTO_8752 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8749 ?AUTO_8751 ) ( CLEAR ?AUTO_8749 ) ( HOLDING ?AUTO_8752 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8752 )
      ( MAKE-ON-TABLE ?AUTO_8749 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8749 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8753 - BLOCK
    )
    :vars
    (
      ?AUTO_8755 - BLOCK
      ?AUTO_8756 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8753 ?AUTO_8755 ) ( ON ?AUTO_8756 ?AUTO_8753 ) ( CLEAR ?AUTO_8756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8756 ?AUTO_8753 )
      ( MAKE-ON-TABLE ?AUTO_8753 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8753 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8759 - BLOCK
    )
    :vars
    (
      ?AUTO_8760 - BLOCK
      ?AUTO_8761 - BLOCK
      ?AUTO_8763 - BLOCK
      ?AUTO_8764 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8759 ?AUTO_8760 ) ( ON ?AUTO_8761 ?AUTO_8759 ) ( CLEAR ?AUTO_8761 ) ( HOLDING ?AUTO_8763 ) ( CLEAR ?AUTO_8764 ) )
    :subtasks
    ( ( !STACK ?AUTO_8763 ?AUTO_8764 )
      ( MAKE-ON-TABLE ?AUTO_8759 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8759 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8765 - BLOCK
    )
    :vars
    (
      ?AUTO_8767 - BLOCK
      ?AUTO_8768 - BLOCK
      ?AUTO_8770 - BLOCK
      ?AUTO_8769 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8765 ?AUTO_8767 ) ( ON ?AUTO_8768 ?AUTO_8765 ) ( CLEAR ?AUTO_8770 ) ( ON ?AUTO_8769 ?AUTO_8768 ) ( CLEAR ?AUTO_8769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8769 ?AUTO_8768 )
      ( MAKE-ON-TABLE ?AUTO_8765 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8765 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8773 - BLOCK
    )
    :vars
    (
      ?AUTO_8778 - BLOCK
      ?AUTO_8776 - BLOCK
      ?AUTO_8775 - BLOCK
      ?AUTO_8774 - BLOCK
      ?AUTO_8780 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8773 ?AUTO_8778 ) ( ON ?AUTO_8776 ?AUTO_8773 ) ( ON ?AUTO_8775 ?AUTO_8776 ) ( CLEAR ?AUTO_8775 ) ( HOLDING ?AUTO_8774 ) ( CLEAR ?AUTO_8780 ) )
    :subtasks
    ( ( !STACK ?AUTO_8774 ?AUTO_8780 )
      ( MAKE-ON-TABLE ?AUTO_8773 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8790 - BLOCK
      ?AUTO_8791 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8790 ) ( CLEAR ?AUTO_8791 ) )
    :subtasks
    ( ( !STACK ?AUTO_8790 ?AUTO_8791 )
      ( MAKE-ON-VERIFY ?AUTO_8790 ?AUTO_8791 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8794 - BLOCK
      ?AUTO_8795 - BLOCK
    )
    :vars
    (
      ?AUTO_8799 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8795 ) ( ON ?AUTO_8794 ?AUTO_8799 ) ( CLEAR ?AUTO_8794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8794 ?AUTO_8799 )
      ( MAKE-ON ?AUTO_8794 ?AUTO_8795 )
      ( MAKE-ON-VERIFY ?AUTO_8794 ?AUTO_8795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8800 - BLOCK
      ?AUTO_8801 - BLOCK
    )
    :vars
    (
      ?AUTO_8804 - BLOCK
      ?AUTO_8805 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8801 ) ( ON ?AUTO_8800 ?AUTO_8804 ) ( CLEAR ?AUTO_8800 ) ( HOLDING ?AUTO_8805 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8805 )
      ( MAKE-ON ?AUTO_8800 ?AUTO_8801 )
      ( MAKE-ON-VERIFY ?AUTO_8800 ?AUTO_8801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8806 - BLOCK
      ?AUTO_8807 - BLOCK
    )
    :vars
    (
      ?AUTO_8810 - BLOCK
      ?AUTO_8811 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8807 ) ( ON ?AUTO_8806 ?AUTO_8810 ) ( ON ?AUTO_8811 ?AUTO_8806 ) ( CLEAR ?AUTO_8811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8811 ?AUTO_8806 )
      ( MAKE-ON ?AUTO_8806 ?AUTO_8807 )
      ( MAKE-ON-VERIFY ?AUTO_8806 ?AUTO_8807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8814 - BLOCK
      ?AUTO_8815 - BLOCK
    )
    :vars
    (
      ?AUTO_8819 - BLOCK
      ?AUTO_8816 - BLOCK
      ?AUTO_8820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8815 ) ( ON ?AUTO_8814 ?AUTO_8819 ) ( ON ?AUTO_8816 ?AUTO_8814 ) ( CLEAR ?AUTO_8816 ) ( HOLDING ?AUTO_8820 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8820 )
      ( MAKE-ON ?AUTO_8814 ?AUTO_8815 )
      ( MAKE-ON-VERIFY ?AUTO_8814 ?AUTO_8815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8821 - BLOCK
      ?AUTO_8822 - BLOCK
    )
    :vars
    (
      ?AUTO_8823 - BLOCK
      ?AUTO_8824 - BLOCK
      ?AUTO_8827 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8822 ) ( ON ?AUTO_8821 ?AUTO_8823 ) ( ON ?AUTO_8824 ?AUTO_8821 ) ( ON ?AUTO_8827 ?AUTO_8824 ) ( CLEAR ?AUTO_8827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8827 ?AUTO_8824 )
      ( MAKE-ON ?AUTO_8821 ?AUTO_8822 )
      ( MAKE-ON-VERIFY ?AUTO_8821 ?AUTO_8822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8830 - BLOCK
      ?AUTO_8831 - BLOCK
    )
    :vars
    (
      ?AUTO_8834 - BLOCK
      ?AUTO_8833 - BLOCK
      ?AUTO_8835 - BLOCK
      ?AUTO_8837 - BLOCK
      ?AUTO_8838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8831 ) ( ON ?AUTO_8830 ?AUTO_8834 ) ( ON ?AUTO_8833 ?AUTO_8830 ) ( ON ?AUTO_8835 ?AUTO_8833 ) ( CLEAR ?AUTO_8835 ) ( HOLDING ?AUTO_8837 ) ( CLEAR ?AUTO_8838 ) )
    :subtasks
    ( ( !STACK ?AUTO_8837 ?AUTO_8838 )
      ( MAKE-ON ?AUTO_8830 ?AUTO_8831 )
      ( MAKE-ON-VERIFY ?AUTO_8830 ?AUTO_8831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8839 - BLOCK
      ?AUTO_8840 - BLOCK
    )
    :vars
    (
      ?AUTO_8846 - BLOCK
      ?AUTO_8841 - BLOCK
      ?AUTO_8847 - BLOCK
      ?AUTO_8843 - BLOCK
      ?AUTO_8842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8840 ) ( ON ?AUTO_8839 ?AUTO_8846 ) ( ON ?AUTO_8841 ?AUTO_8839 ) ( ON ?AUTO_8847 ?AUTO_8841 ) ( CLEAR ?AUTO_8843 ) ( ON ?AUTO_8842 ?AUTO_8847 ) ( CLEAR ?AUTO_8842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8842 ?AUTO_8847 )
      ( MAKE-ON ?AUTO_8839 ?AUTO_8840 )
      ( MAKE-ON-VERIFY ?AUTO_8839 ?AUTO_8840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8850 - BLOCK
      ?AUTO_8851 - BLOCK
    )
    :vars
    (
      ?AUTO_8855 - BLOCK
      ?AUTO_8857 - BLOCK
      ?AUTO_8856 - BLOCK
      ?AUTO_8854 - BLOCK
      ?AUTO_8858 - BLOCK
      ?AUTO_8860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8851 ) ( ON ?AUTO_8850 ?AUTO_8855 ) ( ON ?AUTO_8857 ?AUTO_8850 ) ( ON ?AUTO_8856 ?AUTO_8857 ) ( ON ?AUTO_8854 ?AUTO_8856 ) ( CLEAR ?AUTO_8854 ) ( HOLDING ?AUTO_8858 ) ( CLEAR ?AUTO_8860 ) )
    :subtasks
    ( ( !STACK ?AUTO_8858 ?AUTO_8860 )
      ( MAKE-ON ?AUTO_8850 ?AUTO_8851 )
      ( MAKE-ON-VERIFY ?AUTO_8850 ?AUTO_8851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8867 - BLOCK
      ?AUTO_8868 - BLOCK
    )
    :vars
    (
      ?AUTO_8872 - BLOCK
      ?AUTO_8873 - BLOCK
      ?AUTO_8869 - BLOCK
      ?AUTO_8875 - BLOCK
      ?AUTO_8874 - BLOCK
      ?AUTO_8877 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8867 ?AUTO_8872 ) ( ON ?AUTO_8873 ?AUTO_8867 ) ( ON ?AUTO_8869 ?AUTO_8873 ) ( CLEAR ?AUTO_8875 ) ( ON ?AUTO_8874 ?AUTO_8869 ) ( CLEAR ?AUTO_8874 ) ( HOLDING ?AUTO_8868 ) ( CLEAR ?AUTO_8877 ) )
    :subtasks
    ( ( !STACK ?AUTO_8868 ?AUTO_8877 )
      ( MAKE-ON ?AUTO_8867 ?AUTO_8868 )
      ( MAKE-ON-VERIFY ?AUTO_8867 ?AUTO_8868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8886 - BLOCK
      ?AUTO_8887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8886 ) ( CLEAR ?AUTO_8887 ) )
    :subtasks
    ( ( !STACK ?AUTO_8886 ?AUTO_8887 )
      ( MAKE-ON-VERIFY ?AUTO_8886 ?AUTO_8887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8890 - BLOCK
      ?AUTO_8891 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8891 ) ( ON-TABLE ?AUTO_8890 ) ( CLEAR ?AUTO_8890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8890 )
      ( MAKE-ON ?AUTO_8890 ?AUTO_8891 )
      ( MAKE-ON-VERIFY ?AUTO_8890 ?AUTO_8891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8895 - BLOCK
      ?AUTO_8896 - BLOCK
    )
    :vars
    (
      ?AUTO_8900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8895 ) ( CLEAR ?AUTO_8895 ) ( HOLDING ?AUTO_8896 ) ( CLEAR ?AUTO_8900 ) )
    :subtasks
    ( ( !STACK ?AUTO_8896 ?AUTO_8900 )
      ( MAKE-ON ?AUTO_8895 ?AUTO_8896 )
      ( MAKE-ON-VERIFY ?AUTO_8895 ?AUTO_8896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9117 - BLOCK
      ?AUTO_9118 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9117 ) ( CLEAR ?AUTO_9118 ) )
    :subtasks
    ( ( !STACK ?AUTO_9117 ?AUTO_9118 )
      ( MAKE-ON-VERIFY ?AUTO_9117 ?AUTO_9118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9121 - BLOCK
      ?AUTO_9122 - BLOCK
    )
    :vars
    (
      ?AUTO_9126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9122 ) ( ON ?AUTO_9121 ?AUTO_9126 ) ( CLEAR ?AUTO_9121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9121 ?AUTO_9126 )
      ( MAKE-ON ?AUTO_9121 ?AUTO_9122 )
      ( MAKE-ON-VERIFY ?AUTO_9121 ?AUTO_9122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9127 - BLOCK
      ?AUTO_9128 - BLOCK
    )
    :vars
    (
      ?AUTO_9131 - BLOCK
      ?AUTO_9132 - BLOCK
      ?AUTO_9133 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9128 ) ( ON ?AUTO_9127 ?AUTO_9131 ) ( CLEAR ?AUTO_9127 ) ( HOLDING ?AUTO_9132 ) ( CLEAR ?AUTO_9133 ) )
    :subtasks
    ( ( !STACK ?AUTO_9132 ?AUTO_9133 )
      ( MAKE-ON ?AUTO_9127 ?AUTO_9128 )
      ( MAKE-ON-VERIFY ?AUTO_9127 ?AUTO_9128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9138 - BLOCK
      ?AUTO_9139 - BLOCK
    )
    :vars
    (
      ?AUTO_9140 - BLOCK
      ?AUTO_9143 - BLOCK
      ?AUTO_9144 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9138 ?AUTO_9140 ) ( CLEAR ?AUTO_9138 ) ( CLEAR ?AUTO_9143 ) ( ON ?AUTO_9144 ?AUTO_9139 ) ( CLEAR ?AUTO_9144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9144 ?AUTO_9139 )
      ( MAKE-ON ?AUTO_9138 ?AUTO_9139 )
      ( MAKE-ON-VERIFY ?AUTO_9138 ?AUTO_9139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9147 - BLOCK
      ?AUTO_9148 - BLOCK
    )
    :vars
    (
      ?AUTO_9151 - BLOCK
      ?AUTO_9153 - BLOCK
      ?AUTO_9152 - BLOCK
      ?AUTO_9154 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9147 ?AUTO_9151 ) ( CLEAR ?AUTO_9147 ) ( CLEAR ?AUTO_9153 ) ( ON ?AUTO_9152 ?AUTO_9148 ) ( CLEAR ?AUTO_9152 ) ( HOLDING ?AUTO_9154 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9154 )
      ( MAKE-ON ?AUTO_9147 ?AUTO_9148 )
      ( MAKE-ON-VERIFY ?AUTO_9147 ?AUTO_9148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9155 - BLOCK
      ?AUTO_9156 - BLOCK
    )
    :vars
    (
      ?AUTO_9162 - BLOCK
      ?AUTO_9157 - BLOCK
      ?AUTO_9158 - BLOCK
      ?AUTO_9161 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9155 ?AUTO_9162 ) ( CLEAR ?AUTO_9155 ) ( CLEAR ?AUTO_9157 ) ( ON ?AUTO_9158 ?AUTO_9156 ) ( ON ?AUTO_9161 ?AUTO_9158 ) ( CLEAR ?AUTO_9161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9161 ?AUTO_9158 )
      ( MAKE-ON ?AUTO_9155 ?AUTO_9156 )
      ( MAKE-ON-VERIFY ?AUTO_9155 ?AUTO_9156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9165 - BLOCK
      ?AUTO_9166 - BLOCK
    )
    :vars
    (
      ?AUTO_9171 - BLOCK
      ?AUTO_9170 - BLOCK
      ?AUTO_9168 - BLOCK
      ?AUTO_9172 - BLOCK
      ?AUTO_9173 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9165 ?AUTO_9171 ) ( CLEAR ?AUTO_9165 ) ( CLEAR ?AUTO_9170 ) ( ON ?AUTO_9168 ?AUTO_9166 ) ( ON ?AUTO_9172 ?AUTO_9168 ) ( CLEAR ?AUTO_9172 ) ( HOLDING ?AUTO_9173 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9173 )
      ( MAKE-ON ?AUTO_9165 ?AUTO_9166 )
      ( MAKE-ON-VERIFY ?AUTO_9165 ?AUTO_9166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9174 - BLOCK
      ?AUTO_9175 - BLOCK
    )
    :vars
    (
      ?AUTO_9176 - BLOCK
      ?AUTO_9177 - BLOCK
      ?AUTO_9181 - BLOCK
      ?AUTO_9178 - BLOCK
      ?AUTO_9182 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9174 ?AUTO_9176 ) ( CLEAR ?AUTO_9174 ) ( CLEAR ?AUTO_9177 ) ( ON ?AUTO_9181 ?AUTO_9175 ) ( ON ?AUTO_9178 ?AUTO_9181 ) ( ON ?AUTO_9182 ?AUTO_9178 ) ( CLEAR ?AUTO_9182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9182 ?AUTO_9178 )
      ( MAKE-ON ?AUTO_9174 ?AUTO_9175 )
      ( MAKE-ON-VERIFY ?AUTO_9174 ?AUTO_9175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9185 - BLOCK
      ?AUTO_9186 - BLOCK
    )
    :vars
    (
      ?AUTO_9193 - BLOCK
      ?AUTO_9191 - BLOCK
      ?AUTO_9189 - BLOCK
      ?AUTO_9188 - BLOCK
      ?AUTO_9190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9193 ) ( ON ?AUTO_9191 ?AUTO_9186 ) ( ON ?AUTO_9189 ?AUTO_9191 ) ( ON ?AUTO_9188 ?AUTO_9189 ) ( CLEAR ?AUTO_9188 ) ( HOLDING ?AUTO_9185 ) ( CLEAR ?AUTO_9190 ) )
    :subtasks
    ( ( !STACK ?AUTO_9185 ?AUTO_9190 )
      ( MAKE-ON ?AUTO_9185 ?AUTO_9186 )
      ( MAKE-ON-VERIFY ?AUTO_9185 ?AUTO_9186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9196 - BLOCK
      ?AUTO_9197 - BLOCK
    )
    :vars
    (
      ?AUTO_9198 - BLOCK
      ?AUTO_9203 - BLOCK
      ?AUTO_9204 - BLOCK
      ?AUTO_9200 - BLOCK
      ?AUTO_9199 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9198 ) ( ON ?AUTO_9203 ?AUTO_9197 ) ( ON ?AUTO_9204 ?AUTO_9203 ) ( ON ?AUTO_9200 ?AUTO_9204 ) ( CLEAR ?AUTO_9199 ) ( ON ?AUTO_9196 ?AUTO_9200 ) ( CLEAR ?AUTO_9196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9196 ?AUTO_9200 )
      ( MAKE-ON ?AUTO_9196 ?AUTO_9197 )
      ( MAKE-ON-VERIFY ?AUTO_9196 ?AUTO_9197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9207 - BLOCK
      ?AUTO_9208 - BLOCK
    )
    :vars
    (
      ?AUTO_9215 - BLOCK
      ?AUTO_9210 - BLOCK
      ?AUTO_9214 - BLOCK
      ?AUTO_9209 - BLOCK
      ?AUTO_9211 - BLOCK
      ?AUTO_9217 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9215 ) ( ON ?AUTO_9210 ?AUTO_9208 ) ( ON ?AUTO_9214 ?AUTO_9210 ) ( ON ?AUTO_9209 ?AUTO_9214 ) ( ON ?AUTO_9207 ?AUTO_9209 ) ( CLEAR ?AUTO_9207 ) ( HOLDING ?AUTO_9211 ) ( CLEAR ?AUTO_9217 ) )
    :subtasks
    ( ( !STACK ?AUTO_9211 ?AUTO_9217 )
      ( MAKE-ON ?AUTO_9207 ?AUTO_9208 )
      ( MAKE-ON-VERIFY ?AUTO_9207 ?AUTO_9208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9234 - BLOCK
      ?AUTO_9235 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9234 ) ( CLEAR ?AUTO_9235 ) )
    :subtasks
    ( ( !STACK ?AUTO_9234 ?AUTO_9235 )
      ( MAKE-ON-VERIFY ?AUTO_9234 ?AUTO_9235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9238 - BLOCK
      ?AUTO_9239 - BLOCK
    )
    :vars
    (
      ?AUTO_9243 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9239 ) ( ON ?AUTO_9238 ?AUTO_9243 ) ( CLEAR ?AUTO_9238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9238 ?AUTO_9243 )
      ( MAKE-ON ?AUTO_9238 ?AUTO_9239 )
      ( MAKE-ON-VERIFY ?AUTO_9238 ?AUTO_9239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9244 - BLOCK
      ?AUTO_9245 - BLOCK
    )
    :vars
    (
      ?AUTO_9248 - BLOCK
      ?AUTO_9249 - BLOCK
      ?AUTO_9250 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9245 ) ( ON ?AUTO_9244 ?AUTO_9248 ) ( CLEAR ?AUTO_9244 ) ( HOLDING ?AUTO_9249 ) ( CLEAR ?AUTO_9250 ) )
    :subtasks
    ( ( !STACK ?AUTO_9249 ?AUTO_9250 )
      ( MAKE-ON ?AUTO_9244 ?AUTO_9245 )
      ( MAKE-ON-VERIFY ?AUTO_9244 ?AUTO_9245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9251 - BLOCK
      ?AUTO_9252 - BLOCK
    )
    :vars
    (
      ?AUTO_9255 - BLOCK
      ?AUTO_9257 - BLOCK
      ?AUTO_9256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9252 ) ( ON ?AUTO_9251 ?AUTO_9255 ) ( CLEAR ?AUTO_9257 ) ( ON ?AUTO_9256 ?AUTO_9251 ) ( CLEAR ?AUTO_9256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9256 ?AUTO_9251 )
      ( MAKE-ON ?AUTO_9251 ?AUTO_9252 )
      ( MAKE-ON-VERIFY ?AUTO_9251 ?AUTO_9252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9260 - BLOCK
      ?AUTO_9261 - BLOCK
    )
    :vars
    (
      ?AUTO_9266 - BLOCK
      ?AUTO_9263 - BLOCK
      ?AUTO_9262 - BLOCK
      ?AUTO_9267 - BLOCK
      ?AUTO_9268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9261 ) ( ON ?AUTO_9260 ?AUTO_9266 ) ( CLEAR ?AUTO_9263 ) ( ON ?AUTO_9262 ?AUTO_9260 ) ( CLEAR ?AUTO_9262 ) ( HOLDING ?AUTO_9267 ) ( CLEAR ?AUTO_9268 ) )
    :subtasks
    ( ( !STACK ?AUTO_9267 ?AUTO_9268 )
      ( MAKE-ON ?AUTO_9260 ?AUTO_9261 )
      ( MAKE-ON-VERIFY ?AUTO_9260 ?AUTO_9261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9279 - BLOCK
      ?AUTO_9280 - BLOCK
    )
    :vars
    (
      ?AUTO_9285 - BLOCK
      ?AUTO_9282 - BLOCK
      ?AUTO_9283 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9279 ?AUTO_9285 ) ( CLEAR ?AUTO_9282 ) ( ON ?AUTO_9283 ?AUTO_9279 ) ( CLEAR ?AUTO_9283 ) ( HOLDING ?AUTO_9280 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9280 )
      ( MAKE-ON ?AUTO_9279 ?AUTO_9280 )
      ( MAKE-ON-VERIFY ?AUTO_9279 ?AUTO_9280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9293 - BLOCK
      ?AUTO_9294 - BLOCK
    )
    :vars
    (
      ?AUTO_9299 - BLOCK
      ?AUTO_9296 - BLOCK
      ?AUTO_9295 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9299 ) ( ON ?AUTO_9296 ?AUTO_9294 ) ( CLEAR ?AUTO_9296 ) ( HOLDING ?AUTO_9293 ) ( CLEAR ?AUTO_9295 ) )
    :subtasks
    ( ( !STACK ?AUTO_9293 ?AUTO_9295 )
      ( MAKE-ON ?AUTO_9293 ?AUTO_9294 )
      ( MAKE-ON-VERIFY ?AUTO_9293 ?AUTO_9294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9302 - BLOCK
      ?AUTO_9303 - BLOCK
    )
    :vars
    (
      ?AUTO_9308 - BLOCK
      ?AUTO_9307 - BLOCK
      ?AUTO_9304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9308 ) ( ON ?AUTO_9307 ?AUTO_9303 ) ( CLEAR ?AUTO_9307 ) ( CLEAR ?AUTO_9304 ) ( ON-TABLE ?AUTO_9302 ) ( CLEAR ?AUTO_9302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9302 )
      ( MAKE-ON ?AUTO_9302 ?AUTO_9303 )
      ( MAKE-ON-VERIFY ?AUTO_9302 ?AUTO_9303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9310 - BLOCK
      ?AUTO_9311 - BLOCK
    )
    :vars
    (
      ?AUTO_9312 - BLOCK
      ?AUTO_9316 - BLOCK
      ?AUTO_9313 - BLOCK
      ?AUTO_9318 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9312 ) ( ON ?AUTO_9316 ?AUTO_9311 ) ( CLEAR ?AUTO_9316 ) ( ON-TABLE ?AUTO_9310 ) ( CLEAR ?AUTO_9310 ) ( HOLDING ?AUTO_9313 ) ( CLEAR ?AUTO_9318 ) )
    :subtasks
    ( ( !STACK ?AUTO_9313 ?AUTO_9318 )
      ( MAKE-ON ?AUTO_9310 ?AUTO_9311 )
      ( MAKE-ON-VERIFY ?AUTO_9310 ?AUTO_9311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9319 - BLOCK
      ?AUTO_9320 - BLOCK
    )
    :vars
    (
      ?AUTO_9322 - BLOCK
      ?AUTO_9326 - BLOCK
      ?AUTO_9325 - BLOCK
      ?AUTO_9324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9322 ) ( ON ?AUTO_9326 ?AUTO_9320 ) ( CLEAR ?AUTO_9326 ) ( ON-TABLE ?AUTO_9319 ) ( CLEAR ?AUTO_9325 ) ( ON ?AUTO_9324 ?AUTO_9319 ) ( CLEAR ?AUTO_9324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9324 ?AUTO_9319 )
      ( MAKE-ON ?AUTO_9319 ?AUTO_9320 )
      ( MAKE-ON-VERIFY ?AUTO_9319 ?AUTO_9320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9329 - BLOCK
      ?AUTO_9330 - BLOCK
    )
    :vars
    (
      ?AUTO_9332 - BLOCK
      ?AUTO_9333 - BLOCK
      ?AUTO_9331 - BLOCK
      ?AUTO_9336 - BLOCK
      ?AUTO_9337 - BLOCK
      ?AUTO_9338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9332 ) ( ON ?AUTO_9333 ?AUTO_9330 ) ( CLEAR ?AUTO_9333 ) ( ON-TABLE ?AUTO_9329 ) ( CLEAR ?AUTO_9331 ) ( ON ?AUTO_9336 ?AUTO_9329 ) ( CLEAR ?AUTO_9336 ) ( HOLDING ?AUTO_9337 ) ( CLEAR ?AUTO_9338 ) )
    :subtasks
    ( ( !STACK ?AUTO_9337 ?AUTO_9338 )
      ( MAKE-ON ?AUTO_9329 ?AUTO_9330 )
      ( MAKE-ON-VERIFY ?AUTO_9329 ?AUTO_9330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9343 - BLOCK
      ?AUTO_9344 - BLOCK
    )
    :vars
    (
      ?AUTO_9351 - BLOCK
      ?AUTO_9349 - BLOCK
      ?AUTO_9352 - BLOCK
      ?AUTO_9346 - BLOCK
      ?AUTO_9347 - BLOCK
      ?AUTO_9345 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9351 ) ( ON ?AUTO_9349 ?AUTO_9344 ) ( CLEAR ?AUTO_9349 ) ( ON-TABLE ?AUTO_9343 ) ( CLEAR ?AUTO_9352 ) ( ON ?AUTO_9346 ?AUTO_9343 ) ( CLEAR ?AUTO_9347 ) ( ON ?AUTO_9345 ?AUTO_9346 ) ( CLEAR ?AUTO_9345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9345 ?AUTO_9346 )
      ( MAKE-ON ?AUTO_9343 ?AUTO_9344 )
      ( MAKE-ON-VERIFY ?AUTO_9343 ?AUTO_9344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9357 - BLOCK
      ?AUTO_9358 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9357 ) ( CLEAR ?AUTO_9358 ) )
    :subtasks
    ( ( !STACK ?AUTO_9357 ?AUTO_9358 )
      ( MAKE-ON-VERIFY ?AUTO_9357 ?AUTO_9358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9361 - BLOCK
      ?AUTO_9362 - BLOCK
    )
    :vars
    (
      ?AUTO_9366 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9362 ) ( ON ?AUTO_9361 ?AUTO_9366 ) ( CLEAR ?AUTO_9361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9361 ?AUTO_9366 )
      ( MAKE-ON ?AUTO_9361 ?AUTO_9362 )
      ( MAKE-ON-VERIFY ?AUTO_9361 ?AUTO_9362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9367 - BLOCK
      ?AUTO_9368 - BLOCK
    )
    :vars
    (
      ?AUTO_9371 - BLOCK
      ?AUTO_9373 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9367 ?AUTO_9371 ) ( CLEAR ?AUTO_9367 ) ( HOLDING ?AUTO_9368 ) ( CLEAR ?AUTO_9373 ) )
    :subtasks
    ( ( !STACK ?AUTO_9368 ?AUTO_9373 )
      ( MAKE-ON ?AUTO_9367 ?AUTO_9368 )
      ( MAKE-ON-VERIFY ?AUTO_9367 ?AUTO_9368 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9443 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9443 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9443 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9443 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9445 - BLOCK
    )
    :vars
    (
      ?AUTO_9448 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9445 ?AUTO_9448 ) ( CLEAR ?AUTO_9445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9445 ?AUTO_9448 )
      ( MAKE-ON-TABLE ?AUTO_9445 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9445 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9449 - BLOCK
    )
    :vars
    (
      ?AUTO_9451 - BLOCK
      ?AUTO_9452 - BLOCK
      ?AUTO_9453 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9449 ?AUTO_9451 ) ( CLEAR ?AUTO_9449 ) ( HOLDING ?AUTO_9452 ) ( CLEAR ?AUTO_9453 ) )
    :subtasks
    ( ( !STACK ?AUTO_9452 ?AUTO_9453 )
      ( MAKE-ON-TABLE ?AUTO_9449 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9449 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9456 - BLOCK
    )
    :vars
    (
      ?AUTO_9458 - BLOCK
      ?AUTO_9460 - BLOCK
      ?AUTO_9457 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9456 ?AUTO_9458 ) ( CLEAR ?AUTO_9460 ) ( ON ?AUTO_9457 ?AUTO_9456 ) ( CLEAR ?AUTO_9457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9457 ?AUTO_9456 )
      ( MAKE-ON-TABLE ?AUTO_9456 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9456 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9463 - BLOCK
    )
    :vars
    (
      ?AUTO_9465 - BLOCK
      ?AUTO_9467 - BLOCK
      ?AUTO_9466 - BLOCK
      ?AUTO_9468 - BLOCK
      ?AUTO_9469 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9463 ?AUTO_9465 ) ( CLEAR ?AUTO_9467 ) ( ON ?AUTO_9466 ?AUTO_9463 ) ( CLEAR ?AUTO_9466 ) ( HOLDING ?AUTO_9468 ) ( CLEAR ?AUTO_9469 ) )
    :subtasks
    ( ( !STACK ?AUTO_9468 ?AUTO_9469 )
      ( MAKE-ON-TABLE ?AUTO_9463 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9463 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9470 - BLOCK
    )
    :vars
    (
      ?AUTO_9472 - BLOCK
      ?AUTO_9471 - BLOCK
      ?AUTO_9475 - BLOCK
      ?AUTO_9476 - BLOCK
      ?AUTO_9474 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9470 ?AUTO_9472 ) ( CLEAR ?AUTO_9471 ) ( ON ?AUTO_9475 ?AUTO_9470 ) ( CLEAR ?AUTO_9476 ) ( ON ?AUTO_9474 ?AUTO_9475 ) ( CLEAR ?AUTO_9474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9474 ?AUTO_9475 )
      ( MAKE-ON-TABLE ?AUTO_9470 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9470 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9479 - BLOCK
    )
    :vars
    (
      ?AUTO_9484 - BLOCK
      ?AUTO_9480 - BLOCK
      ?AUTO_9483 - BLOCK
      ?AUTO_9481 - BLOCK
      ?AUTO_9485 - BLOCK
      ?AUTO_9486 - BLOCK
      ?AUTO_9487 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9479 ?AUTO_9484 ) ( CLEAR ?AUTO_9480 ) ( ON ?AUTO_9483 ?AUTO_9479 ) ( CLEAR ?AUTO_9481 ) ( ON ?AUTO_9485 ?AUTO_9483 ) ( CLEAR ?AUTO_9485 ) ( HOLDING ?AUTO_9486 ) ( CLEAR ?AUTO_9487 ) )
    :subtasks
    ( ( !STACK ?AUTO_9486 ?AUTO_9487 )
      ( MAKE-ON-TABLE ?AUTO_9479 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9507 - BLOCK
      ?AUTO_9508 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9507 ) ( CLEAR ?AUTO_9508 ) )
    :subtasks
    ( ( !STACK ?AUTO_9507 ?AUTO_9508 )
      ( MAKE-ON-VERIFY ?AUTO_9507 ?AUTO_9508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9511 - BLOCK
      ?AUTO_9512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9512 ) ( ON-TABLE ?AUTO_9511 ) ( CLEAR ?AUTO_9511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9511 )
      ( MAKE-ON ?AUTO_9511 ?AUTO_9512 )
      ( MAKE-ON-VERIFY ?AUTO_9511 ?AUTO_9512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9516 - BLOCK
      ?AUTO_9517 - BLOCK
    )
    :vars
    (
      ?AUTO_9520 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9517 ) ( ON-TABLE ?AUTO_9516 ) ( CLEAR ?AUTO_9516 ) ( HOLDING ?AUTO_9520 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9520 )
      ( MAKE-ON ?AUTO_9516 ?AUTO_9517 )
      ( MAKE-ON-VERIFY ?AUTO_9516 ?AUTO_9517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9521 - BLOCK
      ?AUTO_9522 - BLOCK
    )
    :vars
    (
      ?AUTO_9525 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9522 ) ( ON-TABLE ?AUTO_9521 ) ( ON ?AUTO_9525 ?AUTO_9521 ) ( CLEAR ?AUTO_9525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9525 ?AUTO_9521 )
      ( MAKE-ON ?AUTO_9521 ?AUTO_9522 )
      ( MAKE-ON-VERIFY ?AUTO_9521 ?AUTO_9522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9528 - BLOCK
      ?AUTO_9529 - BLOCK
    )
    :vars
    (
      ?AUTO_9531 - BLOCK
      ?AUTO_9533 - BLOCK
      ?AUTO_9534 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9529 ) ( ON-TABLE ?AUTO_9528 ) ( ON ?AUTO_9531 ?AUTO_9528 ) ( CLEAR ?AUTO_9531 ) ( HOLDING ?AUTO_9533 ) ( CLEAR ?AUTO_9534 ) )
    :subtasks
    ( ( !STACK ?AUTO_9533 ?AUTO_9534 )
      ( MAKE-ON ?AUTO_9528 ?AUTO_9529 )
      ( MAKE-ON-VERIFY ?AUTO_9528 ?AUTO_9529 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9535 - BLOCK
      ?AUTO_9536 - BLOCK
    )
    :vars
    (
      ?AUTO_9537 - BLOCK
      ?AUTO_9541 - BLOCK
      ?AUTO_9540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9535 ) ( ON ?AUTO_9537 ?AUTO_9535 ) ( CLEAR ?AUTO_9537 ) ( CLEAR ?AUTO_9541 ) ( ON ?AUTO_9540 ?AUTO_9536 ) ( CLEAR ?AUTO_9540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9540 ?AUTO_9536 )
      ( MAKE-ON ?AUTO_9535 ?AUTO_9536 )
      ( MAKE-ON-VERIFY ?AUTO_9535 ?AUTO_9536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9544 - BLOCK
      ?AUTO_9545 - BLOCK
    )
    :vars
    (
      ?AUTO_9549 - BLOCK
      ?AUTO_9550 - BLOCK
      ?AUTO_9546 - BLOCK
      ?AUTO_9552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9544 ) ( ON ?AUTO_9549 ?AUTO_9544 ) ( CLEAR ?AUTO_9549 ) ( ON ?AUTO_9550 ?AUTO_9545 ) ( CLEAR ?AUTO_9550 ) ( HOLDING ?AUTO_9546 ) ( CLEAR ?AUTO_9552 ) )
    :subtasks
    ( ( !STACK ?AUTO_9546 ?AUTO_9552 )
      ( MAKE-ON ?AUTO_9544 ?AUTO_9545 )
      ( MAKE-ON-VERIFY ?AUTO_9544 ?AUTO_9545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9553 - BLOCK
      ?AUTO_9554 - BLOCK
    )
    :vars
    (
      ?AUTO_9556 - BLOCK
      ?AUTO_9560 - BLOCK
      ?AUTO_9557 - BLOCK
      ?AUTO_9555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9553 ) ( ON ?AUTO_9556 ?AUTO_9553 ) ( ON ?AUTO_9560 ?AUTO_9554 ) ( CLEAR ?AUTO_9560 ) ( CLEAR ?AUTO_9557 ) ( ON ?AUTO_9555 ?AUTO_9556 ) ( CLEAR ?AUTO_9555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9555 ?AUTO_9556 )
      ( MAKE-ON ?AUTO_9553 ?AUTO_9554 )
      ( MAKE-ON-VERIFY ?AUTO_9553 ?AUTO_9554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9563 - BLOCK
      ?AUTO_9564 - BLOCK
    )
    :vars
    (
      ?AUTO_9565 - BLOCK
      ?AUTO_9570 - BLOCK
      ?AUTO_9569 - BLOCK
      ?AUTO_9568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9563 ) ( ON ?AUTO_9565 ?AUTO_9563 ) ( CLEAR ?AUTO_9570 ) ( ON ?AUTO_9569 ?AUTO_9565 ) ( CLEAR ?AUTO_9569 ) ( HOLDING ?AUTO_9568 ) ( CLEAR ?AUTO_9564 ) )
    :subtasks
    ( ( !STACK ?AUTO_9568 ?AUTO_9564 )
      ( MAKE-ON ?AUTO_9563 ?AUTO_9564 )
      ( MAKE-ON-VERIFY ?AUTO_9563 ?AUTO_9564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9573 - BLOCK
      ?AUTO_9574 - BLOCK
    )
    :vars
    (
      ?AUTO_9577 - BLOCK
      ?AUTO_9576 - BLOCK
      ?AUTO_9575 - BLOCK
      ?AUTO_9578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9573 ) ( ON ?AUTO_9577 ?AUTO_9573 ) ( CLEAR ?AUTO_9576 ) ( ON ?AUTO_9575 ?AUTO_9577 ) ( CLEAR ?AUTO_9574 ) ( ON ?AUTO_9578 ?AUTO_9575 ) ( CLEAR ?AUTO_9578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9578 ?AUTO_9575 )
      ( MAKE-ON ?AUTO_9573 ?AUTO_9574 )
      ( MAKE-ON-VERIFY ?AUTO_9573 ?AUTO_9574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9583 - BLOCK
      ?AUTO_9584 - BLOCK
    )
    :vars
    (
      ?AUTO_9589 - BLOCK
      ?AUTO_9588 - BLOCK
      ?AUTO_9590 - BLOCK
      ?AUTO_9585 - BLOCK
      ?AUTO_9591 - BLOCK
      ?AUTO_9592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9583 ) ( ON ?AUTO_9589 ?AUTO_9583 ) ( CLEAR ?AUTO_9588 ) ( ON ?AUTO_9590 ?AUTO_9589 ) ( CLEAR ?AUTO_9584 ) ( ON ?AUTO_9585 ?AUTO_9590 ) ( CLEAR ?AUTO_9585 ) ( HOLDING ?AUTO_9591 ) ( CLEAR ?AUTO_9592 ) )
    :subtasks
    ( ( !STACK ?AUTO_9591 ?AUTO_9592 )
      ( MAKE-ON ?AUTO_9583 ?AUTO_9584 )
      ( MAKE-ON-VERIFY ?AUTO_9583 ?AUTO_9584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9597 - BLOCK
      ?AUTO_9598 - BLOCK
    )
    :vars
    (
      ?AUTO_9605 - BLOCK
      ?AUTO_9606 - BLOCK
      ?AUTO_9600 - BLOCK
      ?AUTO_9601 - BLOCK
      ?AUTO_9599 - BLOCK
      ?AUTO_9604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9597 ) ( ON ?AUTO_9605 ?AUTO_9597 ) ( CLEAR ?AUTO_9606 ) ( ON ?AUTO_9600 ?AUTO_9605 ) ( ON ?AUTO_9601 ?AUTO_9600 ) ( CLEAR ?AUTO_9601 ) ( CLEAR ?AUTO_9599 ) ( ON ?AUTO_9604 ?AUTO_9598 ) ( CLEAR ?AUTO_9604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9604 ?AUTO_9598 )
      ( MAKE-ON ?AUTO_9597 ?AUTO_9598 )
      ( MAKE-ON-VERIFY ?AUTO_9597 ?AUTO_9598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9609 - BLOCK
      ?AUTO_9610 - BLOCK
    )
    :vars
    (
      ?AUTO_9615 - BLOCK
      ?AUTO_9611 - BLOCK
      ?AUTO_9616 - BLOCK
      ?AUTO_9613 - BLOCK
      ?AUTO_9618 - BLOCK
      ?AUTO_9617 - BLOCK
      ?AUTO_9619 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9609 ) ( ON ?AUTO_9615 ?AUTO_9609 ) ( CLEAR ?AUTO_9611 ) ( ON ?AUTO_9616 ?AUTO_9615 ) ( ON ?AUTO_9613 ?AUTO_9616 ) ( CLEAR ?AUTO_9613 ) ( CLEAR ?AUTO_9618 ) ( ON ?AUTO_9617 ?AUTO_9610 ) ( CLEAR ?AUTO_9617 ) ( HOLDING ?AUTO_9619 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9619 )
      ( MAKE-ON ?AUTO_9609 ?AUTO_9610 )
      ( MAKE-ON-VERIFY ?AUTO_9609 ?AUTO_9610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9620 - BLOCK
      ?AUTO_9621 - BLOCK
    )
    :vars
    (
      ?AUTO_9628 - BLOCK
      ?AUTO_9624 - BLOCK
      ?AUTO_9630 - BLOCK
      ?AUTO_9626 - BLOCK
      ?AUTO_9629 - BLOCK
      ?AUTO_9622 - BLOCK
      ?AUTO_9627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9620 ) ( ON ?AUTO_9628 ?AUTO_9620 ) ( CLEAR ?AUTO_9624 ) ( ON ?AUTO_9630 ?AUTO_9628 ) ( ON ?AUTO_9626 ?AUTO_9630 ) ( CLEAR ?AUTO_9626 ) ( CLEAR ?AUTO_9629 ) ( ON ?AUTO_9622 ?AUTO_9621 ) ( ON ?AUTO_9627 ?AUTO_9622 ) ( CLEAR ?AUTO_9627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9627 ?AUTO_9622 )
      ( MAKE-ON ?AUTO_9620 ?AUTO_9621 )
      ( MAKE-ON-VERIFY ?AUTO_9620 ?AUTO_9621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9633 - BLOCK
      ?AUTO_9634 - BLOCK
    )
    :vars
    (
      ?AUTO_9638 - BLOCK
      ?AUTO_9640 - BLOCK
      ?AUTO_9643 - BLOCK
      ?AUTO_9636 - BLOCK
      ?AUTO_9637 - BLOCK
      ?AUTO_9635 - BLOCK
      ?AUTO_9642 - BLOCK
      ?AUTO_9644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9633 ) ( ON ?AUTO_9638 ?AUTO_9633 ) ( CLEAR ?AUTO_9640 ) ( ON ?AUTO_9643 ?AUTO_9638 ) ( ON ?AUTO_9636 ?AUTO_9643 ) ( CLEAR ?AUTO_9636 ) ( CLEAR ?AUTO_9637 ) ( ON ?AUTO_9635 ?AUTO_9634 ) ( ON ?AUTO_9642 ?AUTO_9635 ) ( CLEAR ?AUTO_9642 ) ( HOLDING ?AUTO_9644 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9644 )
      ( MAKE-ON ?AUTO_9633 ?AUTO_9634 )
      ( MAKE-ON-VERIFY ?AUTO_9633 ?AUTO_9634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9645 - BLOCK
      ?AUTO_9646 - BLOCK
    )
    :vars
    (
      ?AUTO_9651 - BLOCK
      ?AUTO_9650 - BLOCK
      ?AUTO_9653 - BLOCK
      ?AUTO_9656 - BLOCK
      ?AUTO_9647 - BLOCK
      ?AUTO_9655 - BLOCK
      ?AUTO_9654 - BLOCK
      ?AUTO_9652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9645 ) ( ON ?AUTO_9651 ?AUTO_9645 ) ( CLEAR ?AUTO_9650 ) ( ON ?AUTO_9653 ?AUTO_9651 ) ( ON ?AUTO_9656 ?AUTO_9653 ) ( CLEAR ?AUTO_9656 ) ( CLEAR ?AUTO_9647 ) ( ON ?AUTO_9655 ?AUTO_9646 ) ( ON ?AUTO_9654 ?AUTO_9655 ) ( ON ?AUTO_9652 ?AUTO_9654 ) ( CLEAR ?AUTO_9652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9652 ?AUTO_9654 )
      ( MAKE-ON ?AUTO_9645 ?AUTO_9646 )
      ( MAKE-ON-VERIFY ?AUTO_9645 ?AUTO_9646 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9659 - BLOCK
      ?AUTO_9660 - BLOCK
    )
    :vars
    (
      ?AUTO_9662 - BLOCK
      ?AUTO_9668 - BLOCK
      ?AUTO_9665 - BLOCK
      ?AUTO_9663 - BLOCK
      ?AUTO_9667 - BLOCK
      ?AUTO_9664 - BLOCK
      ?AUTO_9661 - BLOCK
      ?AUTO_9669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9659 ) ( ON ?AUTO_9662 ?AUTO_9659 ) ( CLEAR ?AUTO_9668 ) ( ON ?AUTO_9665 ?AUTO_9662 ) ( CLEAR ?AUTO_9663 ) ( ON ?AUTO_9667 ?AUTO_9660 ) ( ON ?AUTO_9664 ?AUTO_9667 ) ( ON ?AUTO_9661 ?AUTO_9664 ) ( CLEAR ?AUTO_9661 ) ( HOLDING ?AUTO_9669 ) ( CLEAR ?AUTO_9665 ) )
    :subtasks
    ( ( !STACK ?AUTO_9669 ?AUTO_9665 )
      ( MAKE-ON ?AUTO_9659 ?AUTO_9660 )
      ( MAKE-ON-VERIFY ?AUTO_9659 ?AUTO_9660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9673 - BLOCK
      ?AUTO_9674 - BLOCK
    )
    :vars
    (
      ?AUTO_9680 - BLOCK
      ?AUTO_9677 - BLOCK
      ?AUTO_9682 - BLOCK
      ?AUTO_9684 - BLOCK
      ?AUTO_9681 - BLOCK
      ?AUTO_9683 - BLOCK
      ?AUTO_9675 - BLOCK
      ?AUTO_9676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9673 ) ( ON ?AUTO_9680 ?AUTO_9673 ) ( CLEAR ?AUTO_9677 ) ( ON ?AUTO_9682 ?AUTO_9680 ) ( CLEAR ?AUTO_9684 ) ( ON ?AUTO_9681 ?AUTO_9674 ) ( ON ?AUTO_9683 ?AUTO_9681 ) ( ON ?AUTO_9675 ?AUTO_9683 ) ( CLEAR ?AUTO_9682 ) ( ON ?AUTO_9676 ?AUTO_9675 ) ( CLEAR ?AUTO_9676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9676 ?AUTO_9675 )
      ( MAKE-ON ?AUTO_9673 ?AUTO_9674 )
      ( MAKE-ON-VERIFY ?AUTO_9673 ?AUTO_9674 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9687 - BLOCK
      ?AUTO_9688 - BLOCK
    )
    :vars
    (
      ?AUTO_9695 - BLOCK
      ?AUTO_9698 - BLOCK
      ?AUTO_9691 - BLOCK
      ?AUTO_9690 - BLOCK
      ?AUTO_9696 - BLOCK
      ?AUTO_9694 - BLOCK
      ?AUTO_9689 - BLOCK
      ?AUTO_9697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9687 ) ( ON ?AUTO_9695 ?AUTO_9687 ) ( CLEAR ?AUTO_9698 ) ( CLEAR ?AUTO_9691 ) ( ON ?AUTO_9690 ?AUTO_9688 ) ( ON ?AUTO_9696 ?AUTO_9690 ) ( ON ?AUTO_9694 ?AUTO_9696 ) ( ON ?AUTO_9689 ?AUTO_9694 ) ( CLEAR ?AUTO_9689 ) ( HOLDING ?AUTO_9697 ) ( CLEAR ?AUTO_9695 ) )
    :subtasks
    ( ( !STACK ?AUTO_9697 ?AUTO_9695 )
      ( MAKE-ON ?AUTO_9687 ?AUTO_9688 )
      ( MAKE-ON-VERIFY ?AUTO_9687 ?AUTO_9688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9701 - BLOCK
      ?AUTO_9702 - BLOCK
    )
    :vars
    (
      ?AUTO_9711 - BLOCK
      ?AUTO_9712 - BLOCK
      ?AUTO_9706 - BLOCK
      ?AUTO_9709 - BLOCK
      ?AUTO_9704 - BLOCK
      ?AUTO_9705 - BLOCK
      ?AUTO_9707 - BLOCK
      ?AUTO_9703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9701 ) ( ON ?AUTO_9711 ?AUTO_9701 ) ( CLEAR ?AUTO_9712 ) ( CLEAR ?AUTO_9706 ) ( ON ?AUTO_9709 ?AUTO_9702 ) ( ON ?AUTO_9704 ?AUTO_9709 ) ( ON ?AUTO_9705 ?AUTO_9704 ) ( ON ?AUTO_9707 ?AUTO_9705 ) ( CLEAR ?AUTO_9707 ) ( CLEAR ?AUTO_9711 ) ( ON-TABLE ?AUTO_9703 ) ( CLEAR ?AUTO_9703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9703 )
      ( MAKE-ON ?AUTO_9701 ?AUTO_9702 )
      ( MAKE-ON-VERIFY ?AUTO_9701 ?AUTO_9702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9714 - BLOCK
      ?AUTO_9715 - BLOCK
    )
    :vars
    (
      ?AUTO_9724 - BLOCK
      ?AUTO_9717 - BLOCK
      ?AUTO_9725 - BLOCK
      ?AUTO_9722 - BLOCK
      ?AUTO_9720 - BLOCK
      ?AUTO_9721 - BLOCK
      ?AUTO_9716 - BLOCK
      ?AUTO_9723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9714 ) ( CLEAR ?AUTO_9724 ) ( CLEAR ?AUTO_9717 ) ( ON ?AUTO_9725 ?AUTO_9715 ) ( ON ?AUTO_9722 ?AUTO_9725 ) ( ON ?AUTO_9720 ?AUTO_9722 ) ( ON ?AUTO_9721 ?AUTO_9720 ) ( CLEAR ?AUTO_9721 ) ( ON-TABLE ?AUTO_9716 ) ( CLEAR ?AUTO_9716 ) ( HOLDING ?AUTO_9723 ) ( CLEAR ?AUTO_9714 ) )
    :subtasks
    ( ( !STACK ?AUTO_9723 ?AUTO_9714 )
      ( MAKE-ON ?AUTO_9714 ?AUTO_9715 )
      ( MAKE-ON-VERIFY ?AUTO_9714 ?AUTO_9715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9728 - BLOCK
      ?AUTO_9729 - BLOCK
    )
    :vars
    (
      ?AUTO_9739 - BLOCK
      ?AUTO_9738 - BLOCK
      ?AUTO_9730 - BLOCK
      ?AUTO_9731 - BLOCK
      ?AUTO_9737 - BLOCK
      ?AUTO_9735 - BLOCK
      ?AUTO_9736 - BLOCK
      ?AUTO_9732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9728 ) ( CLEAR ?AUTO_9739 ) ( CLEAR ?AUTO_9738 ) ( ON ?AUTO_9730 ?AUTO_9729 ) ( ON ?AUTO_9731 ?AUTO_9730 ) ( ON ?AUTO_9737 ?AUTO_9731 ) ( ON ?AUTO_9735 ?AUTO_9737 ) ( CLEAR ?AUTO_9735 ) ( ON-TABLE ?AUTO_9736 ) ( CLEAR ?AUTO_9728 ) ( ON ?AUTO_9732 ?AUTO_9736 ) ( CLEAR ?AUTO_9732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9732 ?AUTO_9736 )
      ( MAKE-ON ?AUTO_9728 ?AUTO_9729 )
      ( MAKE-ON-VERIFY ?AUTO_9728 ?AUTO_9729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9748 - BLOCK
      ?AUTO_9749 - BLOCK
    )
    :vars
    (
      ?AUTO_9758 - BLOCK
      ?AUTO_9757 - BLOCK
      ?AUTO_9756 - BLOCK
      ?AUTO_9752 - BLOCK
      ?AUTO_9759 - BLOCK
      ?AUTO_9753 - BLOCK
      ?AUTO_9755 - BLOCK
      ?AUTO_9750 - BLOCK
      ?AUTO_9761 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9748 ) ( CLEAR ?AUTO_9758 ) ( CLEAR ?AUTO_9757 ) ( ON ?AUTO_9756 ?AUTO_9749 ) ( ON ?AUTO_9752 ?AUTO_9756 ) ( ON ?AUTO_9759 ?AUTO_9752 ) ( ON ?AUTO_9753 ?AUTO_9759 ) ( CLEAR ?AUTO_9753 ) ( ON-TABLE ?AUTO_9755 ) ( CLEAR ?AUTO_9755 ) ( CLEAR ?AUTO_9748 ) ( ON ?AUTO_9750 ?AUTO_9761 ) ( CLEAR ?AUTO_9750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9750 ?AUTO_9761 )
      ( MAKE-ON ?AUTO_9748 ?AUTO_9749 )
      ( MAKE-ON-VERIFY ?AUTO_9748 ?AUTO_9749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9764 - BLOCK
      ?AUTO_9765 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9764 ) ( CLEAR ?AUTO_9765 ) )
    :subtasks
    ( ( !STACK ?AUTO_9764 ?AUTO_9765 )
      ( MAKE-ON-VERIFY ?AUTO_9764 ?AUTO_9765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9768 - BLOCK
      ?AUTO_9769 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9769 ) ( ON-TABLE ?AUTO_9768 ) ( CLEAR ?AUTO_9768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9768 )
      ( MAKE-ON ?AUTO_9768 ?AUTO_9769 )
      ( MAKE-ON-VERIFY ?AUTO_9768 ?AUTO_9769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9773 - BLOCK
      ?AUTO_9774 - BLOCK
    )
    :vars
    (
      ?AUTO_9778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9773 ) ( CLEAR ?AUTO_9773 ) ( HOLDING ?AUTO_9774 ) ( CLEAR ?AUTO_9778 ) )
    :subtasks
    ( ( !STACK ?AUTO_9774 ?AUTO_9778 )
      ( MAKE-ON ?AUTO_9773 ?AUTO_9774 )
      ( MAKE-ON-VERIFY ?AUTO_9773 ?AUTO_9774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10096 - BLOCK
      ?AUTO_10097 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10096 ) ( CLEAR ?AUTO_10097 ) )
    :subtasks
    ( ( !STACK ?AUTO_10096 ?AUTO_10097 )
      ( MAKE-ON-VERIFY ?AUTO_10096 ?AUTO_10097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10100 - BLOCK
      ?AUTO_10101 - BLOCK
    )
    :vars
    (
      ?AUTO_10105 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10101 ) ( ON ?AUTO_10100 ?AUTO_10105 ) ( CLEAR ?AUTO_10100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10100 ?AUTO_10105 )
      ( MAKE-ON ?AUTO_10100 ?AUTO_10101 )
      ( MAKE-ON-VERIFY ?AUTO_10100 ?AUTO_10101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10106 - BLOCK
      ?AUTO_10107 - BLOCK
    )
    :vars
    (
      ?AUTO_10110 - BLOCK
      ?AUTO_10111 - BLOCK
      ?AUTO_10112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10107 ) ( ON ?AUTO_10106 ?AUTO_10110 ) ( CLEAR ?AUTO_10106 ) ( HOLDING ?AUTO_10111 ) ( CLEAR ?AUTO_10112 ) )
    :subtasks
    ( ( !STACK ?AUTO_10111 ?AUTO_10112 )
      ( MAKE-ON ?AUTO_10106 ?AUTO_10107 )
      ( MAKE-ON-VERIFY ?AUTO_10106 ?AUTO_10107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10151 - BLOCK
      ?AUTO_10152 - BLOCK
    )
    :vars
    (
      ?AUTO_10153 - BLOCK
      ?AUTO_10156 - BLOCK
      ?AUTO_10157 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10153 ) ( ON ?AUTO_10156 ?AUTO_10152 ) ( CLEAR ?AUTO_10156 ) ( HOLDING ?AUTO_10151 ) ( CLEAR ?AUTO_10157 ) )
    :subtasks
    ( ( !STACK ?AUTO_10151 ?AUTO_10157 )
      ( MAKE-ON ?AUTO_10151 ?AUTO_10152 )
      ( MAKE-ON-VERIFY ?AUTO_10151 ?AUTO_10152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10180 - BLOCK
      ?AUTO_10181 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10180 ) ( CLEAR ?AUTO_10181 ) )
    :subtasks
    ( ( !STACK ?AUTO_10180 ?AUTO_10181 )
      ( MAKE-ON-VERIFY ?AUTO_10180 ?AUTO_10181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10184 - BLOCK
      ?AUTO_10185 - BLOCK
    )
    :vars
    (
      ?AUTO_10189 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10185 ) ( ON ?AUTO_10184 ?AUTO_10189 ) ( CLEAR ?AUTO_10184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10184 ?AUTO_10189 )
      ( MAKE-ON ?AUTO_10184 ?AUTO_10185 )
      ( MAKE-ON-VERIFY ?AUTO_10184 ?AUTO_10185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10190 - BLOCK
      ?AUTO_10191 - BLOCK
    )
    :vars
    (
      ?AUTO_10194 - BLOCK
      ?AUTO_10195 - BLOCK
      ?AUTO_10196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10191 ) ( ON ?AUTO_10190 ?AUTO_10194 ) ( CLEAR ?AUTO_10190 ) ( HOLDING ?AUTO_10195 ) ( CLEAR ?AUTO_10196 ) )
    :subtasks
    ( ( !STACK ?AUTO_10195 ?AUTO_10196 )
      ( MAKE-ON ?AUTO_10190 ?AUTO_10191 )
      ( MAKE-ON-VERIFY ?AUTO_10190 ?AUTO_10191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10197 - BLOCK
      ?AUTO_10198 - BLOCK
    )
    :vars
    (
      ?AUTO_10201 - BLOCK
      ?AUTO_10203 - BLOCK
      ?AUTO_10202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10198 ) ( ON ?AUTO_10197 ?AUTO_10201 ) ( CLEAR ?AUTO_10203 ) ( ON ?AUTO_10202 ?AUTO_10197 ) ( CLEAR ?AUTO_10202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10202 ?AUTO_10197 )
      ( MAKE-ON ?AUTO_10197 ?AUTO_10198 )
      ( MAKE-ON-VERIFY ?AUTO_10197 ?AUTO_10198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10206 - BLOCK
      ?AUTO_10207 - BLOCK
    )
    :vars
    (
      ?AUTO_10212 - BLOCK
      ?AUTO_10208 - BLOCK
      ?AUTO_10211 - BLOCK
      ?AUTO_10214 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10206 ?AUTO_10212 ) ( CLEAR ?AUTO_10208 ) ( ON ?AUTO_10211 ?AUTO_10206 ) ( CLEAR ?AUTO_10211 ) ( HOLDING ?AUTO_10207 ) ( CLEAR ?AUTO_10214 ) )
    :subtasks
    ( ( !STACK ?AUTO_10207 ?AUTO_10214 )
      ( MAKE-ON ?AUTO_10206 ?AUTO_10207 )
      ( MAKE-ON-VERIFY ?AUTO_10206 ?AUTO_10207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10217 - BLOCK
      ?AUTO_10218 - BLOCK
    )
    :vars
    (
      ?AUTO_10223 - BLOCK
      ?AUTO_10221 - BLOCK
      ?AUTO_10220 - BLOCK
      ?AUTO_10224 - BLOCK
      ?AUTO_10225 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10218 ) ( ON ?AUTO_10217 ?AUTO_10223 ) ( CLEAR ?AUTO_10221 ) ( ON ?AUTO_10220 ?AUTO_10217 ) ( CLEAR ?AUTO_10220 ) ( HOLDING ?AUTO_10224 ) ( CLEAR ?AUTO_10225 ) )
    :subtasks
    ( ( !STACK ?AUTO_10224 ?AUTO_10225 )
      ( MAKE-ON ?AUTO_10217 ?AUTO_10218 )
      ( MAKE-ON-VERIFY ?AUTO_10217 ?AUTO_10218 ) )
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
      ?AUTO_10437 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10431 ?AUTO_10435 ) ( CLEAR ?AUTO_10431 ) ( HOLDING ?AUTO_10432 ) ( CLEAR ?AUTO_10437 ) )
    :subtasks
    ( ( !STACK ?AUTO_10432 ?AUTO_10437 )
      ( MAKE-ON ?AUTO_10431 ?AUTO_10432 )
      ( MAKE-ON-VERIFY ?AUTO_10431 ?AUTO_10432 ) )
  )

)

