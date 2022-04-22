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
      ?AUTO_525 - BLOCK
      ?AUTO_526 - BLOCK
    )
    :vars
    (
      ?AUTO_527 - BLOCK
      ?AUTO_529 - BLOCK
      ?AUTO_531 - BLOCK
      ?AUTO_533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_526 ) ( ON ?AUTO_525 ?AUTO_527 ) ( ON ?AUTO_529 ?AUTO_525 ) ( CLEAR ?AUTO_529 ) ( HOLDING ?AUTO_531 ) ( CLEAR ?AUTO_533 ) )
    :subtasks
    ( ( !STACK ?AUTO_531 ?AUTO_533 )
      ( MAKE-ON ?AUTO_525 ?AUTO_526 )
      ( MAKE-ON-VERIFY ?AUTO_525 ?AUTO_526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1348 - BLOCK
      ?AUTO_1349 - BLOCK
    )
    :vars
    (
      ?AUTO_1350 - BLOCK
      ?AUTO_1351 - BLOCK
      ?AUTO_1354 - BLOCK
      ?AUTO_1355 - BLOCK
      ?AUTO_1356 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1348 ?AUTO_1350 ) ( ON ?AUTO_1351 ?AUTO_1348 ) ( CLEAR ?AUTO_1354 ) ( ON ?AUTO_1355 ?AUTO_1349 ) ( CLEAR ?AUTO_1355 ) ( ON ?AUTO_1356 ?AUTO_1351 ) ( CLEAR ?AUTO_1356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1356 ?AUTO_1351 )
      ( MAKE-ON ?AUTO_1348 ?AUTO_1349 )
      ( MAKE-ON-VERIFY ?AUTO_1348 ?AUTO_1349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_84 - BLOCK
      ?AUTO_85 - BLOCK
    )
    :vars
    (
      ?AUTO_86 - BLOCK
      ?AUTO_90 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_84 ?AUTO_86 ) ( CLEAR ?AUTO_84 ) ( HOLDING ?AUTO_85 ) ( CLEAR ?AUTO_90 ) )
    :subtasks
    ( ( !STACK ?AUTO_85 ?AUTO_90 )
      ( MAKE-ON ?AUTO_84 ?AUTO_85 )
      ( MAKE-ON-VERIFY ?AUTO_84 ?AUTO_85 ) )
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
      ?AUTO_127 - BLOCK
      ?AUTO_124 - BLOCK
      ?AUTO_128 - BLOCK
      ?AUTO_129 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_122 ?AUTO_127 ) ( ON ?AUTO_123 ?AUTO_122 ) ( ON ?AUTO_124 ?AUTO_123 ) ( CLEAR ?AUTO_128 ) ( ON ?AUTO_129 ?AUTO_124 ) ( CLEAR ?AUTO_129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_129 ?AUTO_124 )
      ( MAKE-ON ?AUTO_122 ?AUTO_123 )
      ( MAKE-ON-VERIFY ?AUTO_122 ?AUTO_123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_163 - BLOCK
      ?AUTO_164 - BLOCK
    )
    :vars
    (
      ?AUTO_165 - BLOCK
      ?AUTO_168 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_164 ) ( ON ?AUTO_163 ?AUTO_165 ) ( CLEAR ?AUTO_163 ) ( HOLDING ?AUTO_168 ) )
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
      ?AUTO_171 - BLOCK
      ?AUTO_174 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_169 ?AUTO_171 ) ( CLEAR ?AUTO_169 ) ( ON ?AUTO_174 ?AUTO_170 ) ( CLEAR ?AUTO_174 ) ( HAND-EMPTY ) )
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
      ?AUTO_182 - BLOCK
      ?AUTO_183 - BLOCK
      ?AUTO_184 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_177 ?AUTO_180 ) ( CLEAR ?AUTO_177 ) ( ON ?AUTO_182 ?AUTO_178 ) ( CLEAR ?AUTO_182 ) ( HOLDING ?AUTO_183 ) ( CLEAR ?AUTO_184 ) )
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
      ?AUTO_197 - BLOCK
      ?AUTO_200 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_197 ?AUTO_196 ) ( CLEAR ?AUTO_197 ) ( HOLDING ?AUTO_195 ) ( CLEAR ?AUTO_200 ) )
    :subtasks
    ( ( !STACK ?AUTO_195 ?AUTO_200 )
      ( MAKE-ON ?AUTO_195 ?AUTO_196 )
      ( MAKE-ON-VERIFY ?AUTO_195 ?AUTO_196 ) )
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
      ?AUTO_243 - BLOCK
      ?AUTO_244 - BLOCK
    )
    :vars
    (
      ?AUTO_249 - BLOCK
      ?AUTO_248 - BLOCK
      ?AUTO_247 - BLOCK
      ?AUTO_246 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_243 ?AUTO_249 ) ( CLEAR ?AUTO_243 ) ( ON ?AUTO_248 ?AUTO_244 ) ( CLEAR ?AUTO_247 ) ( ON ?AUTO_246 ?AUTO_248 ) ( CLEAR ?AUTO_246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_246 ?AUTO_248 )
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
      ?AUTO_257 - BLOCK
      ?AUTO_260 - BLOCK
      ?AUTO_259 - BLOCK
      ?AUTO_261 - BLOCK
      ?AUTO_262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_253 ?AUTO_258 ) ( CLEAR ?AUTO_253 ) ( ON ?AUTO_257 ?AUTO_254 ) ( CLEAR ?AUTO_260 ) ( ON ?AUTO_259 ?AUTO_257 ) ( CLEAR ?AUTO_259 ) ( HOLDING ?AUTO_261 ) ( CLEAR ?AUTO_262 ) )
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
      ?AUTO_265 - BLOCK
      ?AUTO_270 - BLOCK
      ?AUTO_266 - BLOCK
      ?AUTO_271 - BLOCK
      ?AUTO_272 - BLOCK
      ?AUTO_269 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_263 ?AUTO_265 ) ( CLEAR ?AUTO_263 ) ( ON ?AUTO_270 ?AUTO_264 ) ( CLEAR ?AUTO_266 ) ( ON ?AUTO_271 ?AUTO_270 ) ( CLEAR ?AUTO_272 ) ( ON ?AUTO_269 ?AUTO_271 ) ( CLEAR ?AUTO_269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_269 ?AUTO_271 )
      ( MAKE-ON ?AUTO_263 ?AUTO_264 )
      ( MAKE-ON-VERIFY ?AUTO_263 ?AUTO_264 ) )
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
      ?AUTO_301 - BLOCK
      ?AUTO_300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_297 ) ( ON-TABLE ?AUTO_296 ) ( CLEAR ?AUTO_301 ) ( ON ?AUTO_300 ?AUTO_296 ) ( CLEAR ?AUTO_300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_300 ?AUTO_296 )
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
      ?AUTO_308 - BLOCK
      ?AUTO_309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_304 ) ( CLEAR ?AUTO_308 ) ( ON ?AUTO_309 ?AUTO_304 ) ( CLEAR ?AUTO_309 ) ( HOLDING ?AUTO_305 ) )
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
      ?AUTO_316 - BLOCK
      ?AUTO_318 - BLOCK
      ?AUTO_319 - BLOCK
      ?AUTO_320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_314 ) ( ON-TABLE ?AUTO_313 ) ( CLEAR ?AUTO_316 ) ( ON ?AUTO_318 ?AUTO_313 ) ( CLEAR ?AUTO_318 ) ( HOLDING ?AUTO_319 ) ( CLEAR ?AUTO_320 ) )
    :subtasks
    ( ( !STACK ?AUTO_319 ?AUTO_320 )
      ( MAKE-ON ?AUTO_313 ?AUTO_314 )
      ( MAKE-ON-VERIFY ?AUTO_313 ?AUTO_314 ) )
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
      ?AUTO_478 - BLOCK
      ?AUTO_479 - BLOCK
    )
    :vars
    (
      ?AUTO_484 - BLOCK
      ?AUTO_483 - BLOCK
      ?AUTO_480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_479 ) ( ON ?AUTO_478 ?AUTO_484 ) ( ON ?AUTO_483 ?AUTO_478 ) ( ON ?AUTO_480 ?AUTO_483 ) ( CLEAR ?AUTO_480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_480 ?AUTO_483 )
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
      ?AUTO_489 - BLOCK
      ?AUTO_493 - BLOCK
      ?AUTO_490 - BLOCK
      ?AUTO_494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_488 ) ( ON ?AUTO_487 ?AUTO_489 ) ( ON ?AUTO_493 ?AUTO_487 ) ( ON ?AUTO_490 ?AUTO_493 ) ( CLEAR ?AUTO_490 ) ( HOLDING ?AUTO_494 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_494 )
      ( MAKE-ON ?AUTO_487 ?AUTO_488 )
      ( MAKE-ON-VERIFY ?AUTO_487 ?AUTO_488 ) )
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
      ?AUTO_557 - BLOCK
      ?AUTO_558 - BLOCK
    )
    :vars
    (
      ?AUTO_560 - BLOCK
      ?AUTO_563 - BLOCK
      ?AUTO_562 - BLOCK
      ?AUTO_565 - BLOCK
      ?AUTO_564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_558 ) ( ON ?AUTO_557 ?AUTO_560 ) ( ON ?AUTO_563 ?AUTO_557 ) ( CLEAR ?AUTO_562 ) ( ON ?AUTO_565 ?AUTO_563 ) ( ON ?AUTO_564 ?AUTO_565 ) ( CLEAR ?AUTO_564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_564 ?AUTO_565 )
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
      ?AUTO_576 - BLOCK
      ?AUTO_571 - BLOCK
      ?AUTO_573 - BLOCK
      ?AUTO_574 - BLOCK
      ?AUTO_572 - BLOCK
      ?AUTO_577 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_569 ) ( ON ?AUTO_568 ?AUTO_576 ) ( ON ?AUTO_571 ?AUTO_568 ) ( CLEAR ?AUTO_573 ) ( ON ?AUTO_574 ?AUTO_571 ) ( ON ?AUTO_572 ?AUTO_574 ) ( CLEAR ?AUTO_572 ) ( HOLDING ?AUTO_577 ) )
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
      ?AUTO_585 - BLOCK
      ?AUTO_584 - BLOCK
      ?AUTO_580 - BLOCK
      ?AUTO_583 - BLOCK
      ?AUTO_581 - BLOCK
      ?AUTO_586 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_578 ?AUTO_585 ) ( ON ?AUTO_584 ?AUTO_578 ) ( CLEAR ?AUTO_580 ) ( ON ?AUTO_583 ?AUTO_584 ) ( ON ?AUTO_581 ?AUTO_583 ) ( CLEAR ?AUTO_581 ) ( ON ?AUTO_586 ?AUTO_579 ) ( CLEAR ?AUTO_586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_586 ?AUTO_579 )
      ( MAKE-ON ?AUTO_578 ?AUTO_579 )
      ( MAKE-ON-VERIFY ?AUTO_578 ?AUTO_579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_623 - BLOCK
      ?AUTO_624 - BLOCK
    )
    :vars
    (
      ?AUTO_628 - BLOCK
      ?AUTO_630 - BLOCK
      ?AUTO_627 - BLOCK
      ?AUTO_629 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_624 ) ( ON-TABLE ?AUTO_623 ) ( CLEAR ?AUTO_628 ) ( ON ?AUTO_630 ?AUTO_623 ) ( CLEAR ?AUTO_627 ) ( ON ?AUTO_629 ?AUTO_630 ) ( CLEAR ?AUTO_629 ) ( HAND-EMPTY ) )
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
      ?AUTO_637 - BLOCK
      ?AUTO_638 - BLOCK
      ?AUTO_635 - BLOCK
      ?AUTO_640 - BLOCK
      ?AUTO_642 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_634 ) ( ON-TABLE ?AUTO_633 ) ( CLEAR ?AUTO_637 ) ( ON ?AUTO_638 ?AUTO_633 ) ( ON ?AUTO_635 ?AUTO_638 ) ( CLEAR ?AUTO_635 ) ( HOLDING ?AUTO_640 ) ( CLEAR ?AUTO_642 ) )
    :subtasks
    ( ( !STACK ?AUTO_640 ?AUTO_642 )
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
      ?AUTO_653 - BLOCK
      ?AUTO_652 - BLOCK
      ?AUTO_654 - BLOCK
      ?AUTO_651 - BLOCK
      ?AUTO_650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_648 ) ( ON-TABLE ?AUTO_647 ) ( CLEAR ?AUTO_653 ) ( ON ?AUTO_652 ?AUTO_647 ) ( ON ?AUTO_654 ?AUTO_652 ) ( CLEAR ?AUTO_651 ) ( ON ?AUTO_650 ?AUTO_654 ) ( CLEAR ?AUTO_650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_650 ?AUTO_654 )
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
      ?AUTO_662 - BLOCK
      ?AUTO_663 - BLOCK
      ?AUTO_666 - BLOCK
      ?AUTO_665 - BLOCK
      ?AUTO_667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_659 ) ( ON-TABLE ?AUTO_658 ) ( CLEAR ?AUTO_664 ) ( ON ?AUTO_662 ?AUTO_658 ) ( ON ?AUTO_663 ?AUTO_662 ) ( CLEAR ?AUTO_666 ) ( ON ?AUTO_665 ?AUTO_663 ) ( CLEAR ?AUTO_665 ) ( HOLDING ?AUTO_667 ) )
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
      ?AUTO_670 - BLOCK
      ?AUTO_672 - BLOCK
      ?AUTO_676 - BLOCK
      ?AUTO_674 - BLOCK
      ?AUTO_677 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_669 ) ( ON-TABLE ?AUTO_668 ) ( CLEAR ?AUTO_673 ) ( ON ?AUTO_670 ?AUTO_668 ) ( ON ?AUTO_672 ?AUTO_670 ) ( CLEAR ?AUTO_676 ) ( ON ?AUTO_674 ?AUTO_672 ) ( ON ?AUTO_677 ?AUTO_674 ) ( CLEAR ?AUTO_677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_677 ?AUTO_674 )
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
      ?AUTO_686 - BLOCK
      ?AUTO_685 - BLOCK
      ?AUTO_688 - BLOCK
      ?AUTO_687 - BLOCK
      ?AUTO_683 - BLOCK
      ?AUTO_682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_680 ) ( CLEAR ?AUTO_686 ) ( ON ?AUTO_685 ?AUTO_680 ) ( ON ?AUTO_688 ?AUTO_685 ) ( CLEAR ?AUTO_687 ) ( ON ?AUTO_683 ?AUTO_688 ) ( ON ?AUTO_682 ?AUTO_683 ) ( CLEAR ?AUTO_682 ) ( HOLDING ?AUTO_681 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_681 )
      ( MAKE-ON ?AUTO_680 ?AUTO_681 )
      ( MAKE-ON-VERIFY ?AUTO_680 ?AUTO_681 ) )
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
      ?AUTO_728 - BLOCK
      ?AUTO_727 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_726 ?AUTO_730 ) ( CLEAR ?AUTO_731 ) ( ON ?AUTO_728 ?AUTO_726 ) ( ON ?AUTO_727 ?AUTO_728 ) ( CLEAR ?AUTO_727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_727 ?AUTO_728 )
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
      ?AUTO_738 - BLOCK
      ?AUTO_739 - BLOCK
      ?AUTO_735 - BLOCK
      ?AUTO_737 - BLOCK
      ?AUTO_740 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_734 ?AUTO_738 ) ( CLEAR ?AUTO_739 ) ( ON ?AUTO_735 ?AUTO_734 ) ( ON ?AUTO_737 ?AUTO_735 ) ( CLEAR ?AUTO_737 ) ( HOLDING ?AUTO_740 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_740 )
      ( MAKE-ON-TABLE ?AUTO_734 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_778 - BLOCK
      ?AUTO_779 - BLOCK
    )
    :vars
    (
      ?AUTO_781 - BLOCK
      ?AUTO_780 - BLOCK
      ?AUTO_785 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_778 ?AUTO_781 ) ( ON ?AUTO_780 ?AUTO_778 ) ( CLEAR ?AUTO_780 ) ( HOLDING ?AUTO_779 ) ( CLEAR ?AUTO_785 ) )
    :subtasks
    ( ( !STACK ?AUTO_779 ?AUTO_785 )
      ( MAKE-ON ?AUTO_778 ?AUTO_779 )
      ( MAKE-ON-VERIFY ?AUTO_778 ?AUTO_779 ) )
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
      ?AUTO_820 - BLOCK
      ?AUTO_821 - BLOCK
    )
    :vars
    (
      ?AUTO_824 - BLOCK
      ?AUTO_825 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_824 ?AUTO_821 ) ( ON-TABLE ?AUTO_820 ) ( CLEAR ?AUTO_820 ) ( ON ?AUTO_825 ?AUTO_824 ) ( CLEAR ?AUTO_825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_825 ?AUTO_824 )
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
      ?AUTO_831 - BLOCK
      ?AUTO_833 - BLOCK
      ?AUTO_834 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_831 ?AUTO_829 ) ( ON-TABLE ?AUTO_828 ) ( CLEAR ?AUTO_828 ) ( ON ?AUTO_833 ?AUTO_831 ) ( CLEAR ?AUTO_833 ) ( HOLDING ?AUTO_834 ) )
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
      ?AUTO_839 - BLOCK
      ?AUTO_840 - BLOCK
      ?AUTO_841 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_839 ?AUTO_836 ) ( ON-TABLE ?AUTO_835 ) ( CLEAR ?AUTO_835 ) ( ON ?AUTO_840 ?AUTO_839 ) ( ON ?AUTO_841 ?AUTO_840 ) ( CLEAR ?AUTO_841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_841 ?AUTO_840 )
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
      ?AUTO_848 - BLOCK
      ?AUTO_850 - BLOCK
      ?AUTO_849 - BLOCK
      ?AUTO_851 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_848 ?AUTO_845 ) ( ON-TABLE ?AUTO_844 ) ( CLEAR ?AUTO_844 ) ( ON ?AUTO_850 ?AUTO_848 ) ( ON ?AUTO_849 ?AUTO_850 ) ( CLEAR ?AUTO_849 ) ( HOLDING ?AUTO_851 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_851 )
      ( MAKE-ON ?AUTO_844 ?AUTO_845 )
      ( MAKE-ON-VERIFY ?AUTO_844 ?AUTO_845 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_879 - BLOCK
      ?AUTO_880 - BLOCK
    )
    :vars
    (
      ?AUTO_884 - BLOCK
      ?AUTO_883 - BLOCK
      ?AUTO_885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_880 ) ( ON-TABLE ?AUTO_879 ) ( CLEAR ?AUTO_884 ) ( ON ?AUTO_883 ?AUTO_879 ) ( CLEAR ?AUTO_883 ) ( HOLDING ?AUTO_885 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_885 )
      ( MAKE-ON ?AUTO_879 ?AUTO_880 )
      ( MAKE-ON-VERIFY ?AUTO_879 ?AUTO_880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_895 - BLOCK
      ?AUTO_896 - BLOCK
    )
    :vars
    (
      ?AUTO_901 - BLOCK
      ?AUTO_898 - BLOCK
      ?AUTO_899 - BLOCK
      ?AUTO_903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_895 ) ( CLEAR ?AUTO_901 ) ( ON ?AUTO_898 ?AUTO_895 ) ( ON ?AUTO_899 ?AUTO_898 ) ( CLEAR ?AUTO_899 ) ( HOLDING ?AUTO_896 ) ( CLEAR ?AUTO_903 ) )
    :subtasks
    ( ( !STACK ?AUTO_896 ?AUTO_903 )
      ( MAKE-ON ?AUTO_895 ?AUTO_896 )
      ( MAKE-ON-VERIFY ?AUTO_895 ?AUTO_896 ) )
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
      ?AUTO_919 - BLOCK
      ?AUTO_921 - BLOCK
      ?AUTO_923 - BLOCK
      ?AUTO_922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_915 ) ( CLEAR ?AUTO_920 ) ( ON ?AUTO_919 ?AUTO_915 ) ( ON ?AUTO_921 ?AUTO_919 ) ( CLEAR ?AUTO_921 ) ( CLEAR ?AUTO_923 ) ( ON ?AUTO_922 ?AUTO_916 ) ( CLEAR ?AUTO_922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_922 ?AUTO_916 )
      ( MAKE-ON ?AUTO_915 ?AUTO_916 )
      ( MAKE-ON-VERIFY ?AUTO_915 ?AUTO_916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3799 - BLOCK
      ?AUTO_3800 - BLOCK
    )
    :vars
    (
      ?AUTO_3805 - BLOCK
      ?AUTO_3803 - BLOCK
      ?AUTO_3801 - BLOCK
      ?AUTO_3804 - BLOCK
      ?AUTO_3807 - BLOCK
      ?AUTO_3808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3805 ) ( ON ?AUTO_3803 ?AUTO_3800 ) ( CLEAR ?AUTO_3803 ) ( ON-TABLE ?AUTO_3799 ) ( CLEAR ?AUTO_3801 ) ( ON ?AUTO_3804 ?AUTO_3799 ) ( CLEAR ?AUTO_3804 ) ( HOLDING ?AUTO_3807 ) ( CLEAR ?AUTO_3808 ) )
    :subtasks
    ( ( !STACK ?AUTO_3807 ?AUTO_3808 )
      ( MAKE-ON ?AUTO_3799 ?AUTO_3800 )
      ( MAKE-ON-VERIFY ?AUTO_3799 ?AUTO_3800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_937 - BLOCK
      ?AUTO_938 - BLOCK
    )
    :vars
    (
      ?AUTO_943 - BLOCK
      ?AUTO_940 - BLOCK
      ?AUTO_945 - BLOCK
      ?AUTO_941 - BLOCK
      ?AUTO_939 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_937 ) ( CLEAR ?AUTO_943 ) ( ON ?AUTO_940 ?AUTO_937 ) ( CLEAR ?AUTO_945 ) ( ON ?AUTO_941 ?AUTO_938 ) ( CLEAR ?AUTO_940 ) ( ON ?AUTO_939 ?AUTO_941 ) ( CLEAR ?AUTO_939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_939 ?AUTO_941 )
      ( MAKE-ON ?AUTO_937 ?AUTO_938 )
      ( MAKE-ON-VERIFY ?AUTO_937 ?AUTO_938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1460 - BLOCK
      ?AUTO_1461 - BLOCK
    )
    :vars
    (
      ?AUTO_1462 - BLOCK
      ?AUTO_1465 - BLOCK
      ?AUTO_1463 - BLOCK
      ?AUTO_1467 - BLOCK
      ?AUTO_1468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1460 ) ( CLEAR ?AUTO_1460 ) ( ON ?AUTO_1462 ?AUTO_1461 ) ( CLEAR ?AUTO_1465 ) ( ON ?AUTO_1463 ?AUTO_1462 ) ( CLEAR ?AUTO_1463 ) ( HOLDING ?AUTO_1467 ) ( CLEAR ?AUTO_1468 ) )
    :subtasks
    ( ( !STACK ?AUTO_1467 ?AUTO_1468 )
      ( MAKE-ON ?AUTO_1460 ?AUTO_1461 )
      ( MAKE-ON-VERIFY ?AUTO_1460 ?AUTO_1461 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_959 - BLOCK
      ?AUTO_960 - BLOCK
    )
    :vars
    (
      ?AUTO_967 - BLOCK
      ?AUTO_962 - BLOCK
      ?AUTO_961 - BLOCK
      ?AUTO_966 - BLOCK
      ?AUTO_963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_959 ) ( CLEAR ?AUTO_967 ) ( CLEAR ?AUTO_962 ) ( ON ?AUTO_961 ?AUTO_960 ) ( ON ?AUTO_966 ?AUTO_961 ) ( CLEAR ?AUTO_966 ) ( CLEAR ?AUTO_959 ) ( ON-TABLE ?AUTO_963 ) ( CLEAR ?AUTO_963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_963 )
      ( MAKE-ON ?AUTO_959 ?AUTO_960 )
      ( MAKE-ON-VERIFY ?AUTO_959 ?AUTO_960 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1949 - BLOCK
      ?AUTO_1950 - BLOCK
    )
    :vars
    (
      ?AUTO_1951 - BLOCK
      ?AUTO_1954 - BLOCK
      ?AUTO_1953 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1951 ?AUTO_1950 ) ( CLEAR ?AUTO_1954 ) ( ON ?AUTO_1953 ?AUTO_1951 ) ( CLEAR ?AUTO_1953 ) ( HOLDING ?AUTO_1949 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1949 )
      ( MAKE-ON ?AUTO_1949 ?AUTO_1950 )
      ( MAKE-ON-VERIFY ?AUTO_1949 ?AUTO_1950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1252 - BLOCK
      ?AUTO_1253 - BLOCK
    )
    :vars
    (
      ?AUTO_1257 - BLOCK
      ?AUTO_1260 - BLOCK
      ?AUTO_1258 - BLOCK
      ?AUTO_1259 - BLOCK
      ?AUTO_1256 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1252 ?AUTO_1257 ) ( CLEAR ?AUTO_1252 ) ( ON ?AUTO_1260 ?AUTO_1253 ) ( ON ?AUTO_1258 ?AUTO_1260 ) ( ON ?AUTO_1259 ?AUTO_1258 ) ( CLEAR ?AUTO_1259 ) ( HOLDING ?AUTO_1256 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1256 )
      ( MAKE-ON ?AUTO_1252 ?AUTO_1253 )
      ( MAKE-ON-VERIFY ?AUTO_1252 ?AUTO_1253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6169 - BLOCK
      ?AUTO_6166 - BLOCK
    )
    :vars
    (
      ?AUTO_6170 - BLOCK
      ?AUTO_6173 - BLOCK
      ?AUTO_6167 - BLOCK
      ?AUTO_6171 - BLOCK
      ?AUTO_6174 - BLOCK
      ?AUTO_6175 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6169 ?AUTO_6170 ) ( ON ?AUTO_6173 ?AUTO_6166 ) ( ON ?AUTO_6167 ?AUTO_6173 ) ( ON ?AUTO_6171 ?AUTO_6167 ) ( ON ?AUTO_6174 ?AUTO_6171 ) ( CLEAR ?AUTO_6174 ) ( ON ?AUTO_6175 ?AUTO_6169 ) ( CLEAR ?AUTO_6175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6175 ?AUTO_6169 )
      ( MAKE-ON ?AUTO_6169 ?AUTO_6166 )
      ( MAKE-ON-VERIFY ?AUTO_6169 ?AUTO_6166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1012 - BLOCK
      ?AUTO_1013 - BLOCK
    )
    :vars
    (
      ?AUTO_1019 - BLOCK
      ?AUTO_1016 - BLOCK
      ?AUTO_1021 - BLOCK
      ?AUTO_1018 - BLOCK
      ?AUTO_1014 - BLOCK
      ?AUTO_1017 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1019 ) ( ON ?AUTO_1016 ?AUTO_1013 ) ( ON ?AUTO_1021 ?AUTO_1016 ) ( ON-TABLE ?AUTO_1018 ) ( CLEAR ?AUTO_1018 ) ( ON ?AUTO_1012 ?AUTO_1021 ) ( ON ?AUTO_1014 ?AUTO_1012 ) ( CLEAR ?AUTO_1014 ) ( HOLDING ?AUTO_1017 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1017 )
      ( MAKE-ON ?AUTO_1012 ?AUTO_1013 )
      ( MAKE-ON-VERIFY ?AUTO_1012 ?AUTO_1013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1067 - BLOCK
      ?AUTO_1068 - BLOCK
    )
    :vars
    (
      ?AUTO_1069 - BLOCK
      ?AUTO_1071 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1067 ?AUTO_1069 ) ( ON ?AUTO_1071 ?AUTO_1067 ) ( CLEAR ?AUTO_1071 ) ( HOLDING ?AUTO_1068 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1068 )
      ( MAKE-ON ?AUTO_1067 ?AUTO_1068 )
      ( MAKE-ON-VERIFY ?AUTO_1067 ?AUTO_1068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2911 - BLOCK
      ?AUTO_2912 - BLOCK
    )
    :vars
    (
      ?AUTO_2917 - BLOCK
      ?AUTO_2915 - BLOCK
      ?AUTO_2918 - BLOCK
      ?AUTO_2916 - BLOCK
      ?AUTO_2919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2911 ) ( ON ?AUTO_2917 ?AUTO_2911 ) ( CLEAR ?AUTO_2915 ) ( ON ?AUTO_2918 ?AUTO_2912 ) ( CLEAR ?AUTO_2918 ) ( ON ?AUTO_2916 ?AUTO_2917 ) ( CLEAR ?AUTO_2916 ) ( HOLDING ?AUTO_2919 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2919 )
      ( MAKE-ON ?AUTO_2911 ?AUTO_2912 )
      ( MAKE-ON-VERIFY ?AUTO_2911 ?AUTO_2912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4090 - BLOCK
      ?AUTO_4091 - BLOCK
    )
    :vars
    (
      ?AUTO_4095 - BLOCK
      ?AUTO_4092 - BLOCK
      ?AUTO_4099 - BLOCK
      ?AUTO_4097 - BLOCK
      ?AUTO_4100 - BLOCK
      ?AUTO_4098 - BLOCK
      ?AUTO_4093 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4090 ) ( ON ?AUTO_4095 ?AUTO_4090 ) ( CLEAR ?AUTO_4092 ) ( ON ?AUTO_4099 ?AUTO_4095 ) ( ON ?AUTO_4097 ?AUTO_4099 ) ( CLEAR ?AUTO_4097 ) ( CLEAR ?AUTO_4100 ) ( ON ?AUTO_4098 ?AUTO_4091 ) ( ON ?AUTO_4093 ?AUTO_4098 ) ( CLEAR ?AUTO_4093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4093 ?AUTO_4098 )
      ( MAKE-ON ?AUTO_4090 ?AUTO_4091 )
      ( MAKE-ON-VERIFY ?AUTO_4090 ?AUTO_4091 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4103 - BLOCK
      ?AUTO_4104 - BLOCK
    )
    :vars
    (
      ?AUTO_4113 - BLOCK
      ?AUTO_4110 - BLOCK
      ?AUTO_4111 - BLOCK
      ?AUTO_4106 - BLOCK
      ?AUTO_4112 - BLOCK
      ?AUTO_4105 - BLOCK
      ?AUTO_4109 - BLOCK
      ?AUTO_4114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4103 ) ( ON ?AUTO_4113 ?AUTO_4103 ) ( CLEAR ?AUTO_4110 ) ( ON ?AUTO_4111 ?AUTO_4113 ) ( ON ?AUTO_4106 ?AUTO_4111 ) ( CLEAR ?AUTO_4106 ) ( CLEAR ?AUTO_4112 ) ( ON ?AUTO_4105 ?AUTO_4104 ) ( ON ?AUTO_4109 ?AUTO_4105 ) ( CLEAR ?AUTO_4109 ) ( HOLDING ?AUTO_4114 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4114 )
      ( MAKE-ON ?AUTO_4103 ?AUTO_4104 )
      ( MAKE-ON-VERIFY ?AUTO_4103 ?AUTO_4104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1232 - BLOCK
      ?AUTO_1233 - BLOCK
    )
    :vars
    (
      ?AUTO_1234 - BLOCK
      ?AUTO_1235 - BLOCK
      ?AUTO_1236 - BLOCK
      ?AUTO_1239 - BLOCK
      ?AUTO_1240 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1232 ?AUTO_1234 ) ( CLEAR ?AUTO_1232 ) ( ON ?AUTO_1235 ?AUTO_1233 ) ( CLEAR ?AUTO_1236 ) ( ON ?AUTO_1239 ?AUTO_1235 ) ( CLEAR ?AUTO_1239 ) ( HOLDING ?AUTO_1240 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1240 )
      ( MAKE-ON ?AUTO_1232 ?AUTO_1233 )
      ( MAKE-ON-VERIFY ?AUTO_1232 ?AUTO_1233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1262 - BLOCK
      ?AUTO_1263 - BLOCK
    )
    :vars
    (
      ?AUTO_1264 - BLOCK
      ?AUTO_1270 - BLOCK
      ?AUTO_1268 - BLOCK
      ?AUTO_1269 - BLOCK
      ?AUTO_1267 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1262 ?AUTO_1264 ) ( ON ?AUTO_1270 ?AUTO_1263 ) ( ON ?AUTO_1268 ?AUTO_1270 ) ( ON ?AUTO_1269 ?AUTO_1268 ) ( CLEAR ?AUTO_1269 ) ( ON ?AUTO_1267 ?AUTO_1262 ) ( CLEAR ?AUTO_1267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1267 ?AUTO_1262 )
      ( MAKE-ON ?AUTO_1262 ?AUTO_1263 )
      ( MAKE-ON-VERIFY ?AUTO_1262 ?AUTO_1263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1329 - BLOCK
      ?AUTO_1330 - BLOCK
    )
    :vars
    (
      ?AUTO_1333 - BLOCK
      ?AUTO_1332 - BLOCK
      ?AUTO_1336 - BLOCK
      ?AUTO_1331 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1329 ?AUTO_1333 ) ( ON ?AUTO_1332 ?AUTO_1329 ) ( CLEAR ?AUTO_1332 ) ( CLEAR ?AUTO_1336 ) ( ON ?AUTO_1331 ?AUTO_1330 ) ( CLEAR ?AUTO_1331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1331 ?AUTO_1330 )
      ( MAKE-ON ?AUTO_1329 ?AUTO_1330 )
      ( MAKE-ON-VERIFY ?AUTO_1329 ?AUTO_1330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1339 - BLOCK
      ?AUTO_1340 - BLOCK
    )
    :vars
    (
      ?AUTO_1346 - BLOCK
      ?AUTO_1345 - BLOCK
      ?AUTO_1343 - BLOCK
      ?AUTO_1344 - BLOCK
      ?AUTO_1347 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1339 ?AUTO_1346 ) ( ON ?AUTO_1345 ?AUTO_1339 ) ( CLEAR ?AUTO_1345 ) ( CLEAR ?AUTO_1343 ) ( ON ?AUTO_1344 ?AUTO_1340 ) ( CLEAR ?AUTO_1344 ) ( HOLDING ?AUTO_1347 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1347 )
      ( MAKE-ON ?AUTO_1339 ?AUTO_1340 )
      ( MAKE-ON-VERIFY ?AUTO_1339 ?AUTO_1340 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1378 - BLOCK
    )
    :vars
    (
      ?AUTO_1382 - BLOCK
      ?AUTO_1380 - BLOCK
      ?AUTO_1379 - BLOCK
      ?AUTO_1383 - BLOCK
      ?AUTO_1384 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1378 ?AUTO_1382 ) ( CLEAR ?AUTO_1380 ) ( ON ?AUTO_1379 ?AUTO_1378 ) ( CLEAR ?AUTO_1379 ) ( HOLDING ?AUTO_1383 ) ( CLEAR ?AUTO_1384 ) )
    :subtasks
    ( ( !STACK ?AUTO_1383 ?AUTO_1384 )
      ( MAKE-ON-TABLE ?AUTO_1378 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1378 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1394 - BLOCK
    )
    :vars
    (
      ?AUTO_1399 - BLOCK
      ?AUTO_1398 - BLOCK
      ?AUTO_1395 - BLOCK
      ?AUTO_1397 - BLOCK
      ?AUTO_1396 - BLOCK
      ?AUTO_1402 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1394 ?AUTO_1399 ) ( CLEAR ?AUTO_1398 ) ( ON ?AUTO_1395 ?AUTO_1394 ) ( ON ?AUTO_1397 ?AUTO_1395 ) ( CLEAR ?AUTO_1397 ) ( HOLDING ?AUTO_1396 ) ( CLEAR ?AUTO_1402 ) )
    :subtasks
    ( ( !STACK ?AUTO_1396 ?AUTO_1402 )
      ( MAKE-ON-TABLE ?AUTO_1394 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1394 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1411 - BLOCK
    )
    :vars
    (
      ?AUTO_1413 - BLOCK
      ?AUTO_1415 - BLOCK
      ?AUTO_1417 - BLOCK
      ?AUTO_1416 - BLOCK
      ?AUTO_1418 - BLOCK
      ?AUTO_1414 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1411 ?AUTO_1413 ) ( CLEAR ?AUTO_1415 ) ( ON ?AUTO_1417 ?AUTO_1411 ) ( ON ?AUTO_1416 ?AUTO_1417 ) ( CLEAR ?AUTO_1418 ) ( ON ?AUTO_1414 ?AUTO_1416 ) ( CLEAR ?AUTO_1414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1414 ?AUTO_1416 )
      ( MAKE-ON-TABLE ?AUTO_1411 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1444 - BLOCK
      ?AUTO_1445 - BLOCK
    )
    :vars
    (
      ?AUTO_1447 - BLOCK
      ?AUTO_1449 - BLOCK
      ?AUTO_1450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1444 ) ( CLEAR ?AUTO_1444 ) ( ON ?AUTO_1447 ?AUTO_1445 ) ( CLEAR ?AUTO_1447 ) ( HOLDING ?AUTO_1449 ) ( CLEAR ?AUTO_1450 ) )
    :subtasks
    ( ( !STACK ?AUTO_1449 ?AUTO_1450 )
      ( MAKE-ON ?AUTO_1444 ?AUTO_1445 )
      ( MAKE-ON-VERIFY ?AUTO_1444 ?AUTO_1445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1480 - BLOCK
      ?AUTO_1481 - BLOCK
    )
    :vars
    (
      ?AUTO_1483 - BLOCK
      ?AUTO_1486 - BLOCK
      ?AUTO_1487 - BLOCK
      ?AUTO_1484 - BLOCK
      ?AUTO_1488 - BLOCK
      ?AUTO_1490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1480 ) ( CLEAR ?AUTO_1480 ) ( ON ?AUTO_1483 ?AUTO_1481 ) ( CLEAR ?AUTO_1486 ) ( ON ?AUTO_1487 ?AUTO_1483 ) ( ON ?AUTO_1484 ?AUTO_1487 ) ( CLEAR ?AUTO_1484 ) ( HOLDING ?AUTO_1488 ) ( CLEAR ?AUTO_1490 ) )
    :subtasks
    ( ( !STACK ?AUTO_1488 ?AUTO_1490 )
      ( MAKE-ON ?AUTO_1480 ?AUTO_1481 )
      ( MAKE-ON-VERIFY ?AUTO_1480 ?AUTO_1481 ) )
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
      ?AUTO_1503 - BLOCK
      ?AUTO_1509 - BLOCK
      ?AUTO_1506 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1505 ?AUTO_1502 ) ( CLEAR ?AUTO_1504 ) ( ON ?AUTO_1503 ?AUTO_1505 ) ( CLEAR ?AUTO_1509 ) ( ON ?AUTO_1506 ?AUTO_1503 ) ( CLEAR ?AUTO_1506 ) ( HOLDING ?AUTO_1501 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1501 )
      ( MAKE-ON ?AUTO_1501 ?AUTO_1502 )
      ( MAKE-ON-VERIFY ?AUTO_1501 ?AUTO_1502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1515 - BLOCK
      ?AUTO_1516 - BLOCK
    )
    :vars
    (
      ?AUTO_1520 - BLOCK
      ?AUTO_1517 - BLOCK
      ?AUTO_1521 - BLOCK
      ?AUTO_1522 - BLOCK
      ?AUTO_1518 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1515 ?AUTO_1520 ) ( CLEAR ?AUTO_1515 ) ( ON ?AUTO_1517 ?AUTO_1516 ) ( ON ?AUTO_1521 ?AUTO_1517 ) ( ON ?AUTO_1522 ?AUTO_1521 ) ( ON ?AUTO_1518 ?AUTO_1522 ) ( CLEAR ?AUTO_1518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1518 ?AUTO_1522 )
      ( MAKE-ON ?AUTO_1515 ?AUTO_1516 )
      ( MAKE-ON-VERIFY ?AUTO_1515 ?AUTO_1516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1697 - BLOCK
      ?AUTO_1698 - BLOCK
    )
    :vars
    (
      ?AUTO_1703 - BLOCK
      ?AUTO_1702 - BLOCK
      ?AUTO_1699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1697 ) ( ON ?AUTO_1703 ?AUTO_1697 ) ( CLEAR ?AUTO_1702 ) ( ON ?AUTO_1699 ?AUTO_1703 ) ( CLEAR ?AUTO_1699 ) ( HOLDING ?AUTO_1698 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1698 )
      ( MAKE-ON ?AUTO_1697 ?AUTO_1698 )
      ( MAKE-ON-VERIFY ?AUTO_1697 ?AUTO_1698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1865 - BLOCK
      ?AUTO_1866 - BLOCK
    )
    :vars
    (
      ?AUTO_1868 - BLOCK
      ?AUTO_1871 - BLOCK
      ?AUTO_1870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1865 ) ( ON ?AUTO_1868 ?AUTO_1866 ) ( CLEAR ?AUTO_1868 ) ( CLEAR ?AUTO_1871 ) ( ON ?AUTO_1870 ?AUTO_1865 ) ( CLEAR ?AUTO_1870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1870 ?AUTO_1865 )
      ( MAKE-ON ?AUTO_1865 ?AUTO_1866 )
      ( MAKE-ON-VERIFY ?AUTO_1865 ?AUTO_1866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1957 - BLOCK
      ?AUTO_1958 - BLOCK
    )
    :vars
    (
      ?AUTO_1962 - BLOCK
      ?AUTO_1963 - BLOCK
      ?AUTO_1959 - BLOCK
      ?AUTO_1965 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1962 ?AUTO_1958 ) ( CLEAR ?AUTO_1963 ) ( ON ?AUTO_1959 ?AUTO_1962 ) ( CLEAR ?AUTO_1959 ) ( ON ?AUTO_1957 ?AUTO_1965 ) ( CLEAR ?AUTO_1957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1957 ?AUTO_1965 )
      ( MAKE-ON ?AUTO_1957 ?AUTO_1958 )
      ( MAKE-ON-VERIFY ?AUTO_1957 ?AUTO_1958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1976 - BLOCK
      ?AUTO_1977 - BLOCK
    )
    :vars
    (
      ?AUTO_1981 - BLOCK
      ?AUTO_1979 - BLOCK
      ?AUTO_1985 - BLOCK
      ?AUTO_1978 - BLOCK
      ?AUTO_1983 - BLOCK
      ?AUTO_1984 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1981 ?AUTO_1977 ) ( CLEAR ?AUTO_1979 ) ( ON ?AUTO_1985 ?AUTO_1981 ) ( CLEAR ?AUTO_1985 ) ( ON ?AUTO_1976 ?AUTO_1978 ) ( CLEAR ?AUTO_1983 ) ( ON ?AUTO_1984 ?AUTO_1976 ) ( CLEAR ?AUTO_1984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1984 ?AUTO_1976 )
      ( MAKE-ON ?AUTO_1976 ?AUTO_1977 )
      ( MAKE-ON-VERIFY ?AUTO_1976 ?AUTO_1977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1988 - BLOCK
      ?AUTO_1989 - BLOCK
    )
    :vars
    (
      ?AUTO_1996 - BLOCK
      ?AUTO_1994 - BLOCK
      ?AUTO_1990 - BLOCK
      ?AUTO_1995 - BLOCK
      ?AUTO_1997 - BLOCK
      ?AUTO_1993 - BLOCK
      ?AUTO_1998 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1996 ?AUTO_1989 ) ( CLEAR ?AUTO_1994 ) ( ON ?AUTO_1990 ?AUTO_1996 ) ( CLEAR ?AUTO_1990 ) ( ON ?AUTO_1988 ?AUTO_1995 ) ( CLEAR ?AUTO_1997 ) ( ON ?AUTO_1993 ?AUTO_1988 ) ( CLEAR ?AUTO_1993 ) ( HOLDING ?AUTO_1998 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1998 )
      ( MAKE-ON ?AUTO_1988 ?AUTO_1989 )
      ( MAKE-ON-VERIFY ?AUTO_1988 ?AUTO_1989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1999 - BLOCK
      ?AUTO_2000 - BLOCK
    )
    :vars
    (
      ?AUTO_2001 - BLOCK
      ?AUTO_2007 - BLOCK
      ?AUTO_2004 - BLOCK
      ?AUTO_2006 - BLOCK
      ?AUTO_2002 - BLOCK
      ?AUTO_2005 - BLOCK
      ?AUTO_2009 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2001 ?AUTO_2000 ) ( CLEAR ?AUTO_2007 ) ( ON ?AUTO_2004 ?AUTO_2001 ) ( CLEAR ?AUTO_2004 ) ( ON ?AUTO_1999 ?AUTO_2006 ) ( CLEAR ?AUTO_2002 ) ( ON ?AUTO_2005 ?AUTO_1999 ) ( ON ?AUTO_2009 ?AUTO_2005 ) ( CLEAR ?AUTO_2009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2009 ?AUTO_2005 )
      ( MAKE-ON ?AUTO_1999 ?AUTO_2000 )
      ( MAKE-ON-VERIFY ?AUTO_1999 ?AUTO_2000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2012 - BLOCK
      ?AUTO_2013 - BLOCK
    )
    :vars
    (
      ?AUTO_2019 - BLOCK
      ?AUTO_2016 - BLOCK
      ?AUTO_2020 - BLOCK
      ?AUTO_2015 - BLOCK
      ?AUTO_2017 - BLOCK
      ?AUTO_2021 - BLOCK
      ?AUTO_2022 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2019 ?AUTO_2013 ) ( CLEAR ?AUTO_2016 ) ( ON ?AUTO_2020 ?AUTO_2019 ) ( CLEAR ?AUTO_2020 ) ( ON ?AUTO_2012 ?AUTO_2015 ) ( ON ?AUTO_2017 ?AUTO_2012 ) ( ON ?AUTO_2021 ?AUTO_2017 ) ( CLEAR ?AUTO_2021 ) ( HOLDING ?AUTO_2022 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2022 )
      ( MAKE-ON ?AUTO_2012 ?AUTO_2013 )
      ( MAKE-ON-VERIFY ?AUTO_2012 ?AUTO_2013 ) )
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
      ?AUTO_2034 - BLOCK
      ?AUTO_2027 - BLOCK
      ?AUTO_2032 - BLOCK
      ?AUTO_2028 - BLOCK
      ?AUTO_2033 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2026 ?AUTO_2025 ) ( CLEAR ?AUTO_2029 ) ( ON ?AUTO_2034 ?AUTO_2026 ) ( ON ?AUTO_2024 ?AUTO_2027 ) ( ON ?AUTO_2032 ?AUTO_2024 ) ( ON ?AUTO_2028 ?AUTO_2032 ) ( CLEAR ?AUTO_2028 ) ( ON ?AUTO_2033 ?AUTO_2034 ) ( CLEAR ?AUTO_2033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2033 ?AUTO_2034 )
      ( MAKE-ON ?AUTO_2024 ?AUTO_2025 )
      ( MAKE-ON-VERIFY ?AUTO_2024 ?AUTO_2025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2180 - BLOCK
      ?AUTO_2181 - BLOCK
    )
    :vars
    (
      ?AUTO_2184 - BLOCK
      ?AUTO_2186 - BLOCK
      ?AUTO_2185 - BLOCK
      ?AUTO_2187 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2180 ?AUTO_2184 ) ( CLEAR ?AUTO_2180 ) ( CLEAR ?AUTO_2186 ) ( ON ?AUTO_2185 ?AUTO_2181 ) ( CLEAR ?AUTO_2185 ) ( HOLDING ?AUTO_2187 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2187 )
      ( MAKE-ON ?AUTO_2180 ?AUTO_2181 )
      ( MAKE-ON-VERIFY ?AUTO_2180 ?AUTO_2181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2343 - BLOCK
      ?AUTO_2344 - BLOCK
    )
    :vars
    (
      ?AUTO_2347 - BLOCK
      ?AUTO_2345 - BLOCK
      ?AUTO_2349 - BLOCK
      ?AUTO_2346 - BLOCK
      ?AUTO_2352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2344 ) ( ON ?AUTO_2343 ?AUTO_2347 ) ( ON ?AUTO_2345 ?AUTO_2343 ) ( ON ?AUTO_2349 ?AUTO_2345 ) ( CLEAR ?AUTO_2349 ) ( HOLDING ?AUTO_2346 ) ( CLEAR ?AUTO_2352 ) )
    :subtasks
    ( ( !STACK ?AUTO_2346 ?AUTO_2352 )
      ( MAKE-ON ?AUTO_2343 ?AUTO_2344 )
      ( MAKE-ON-VERIFY ?AUTO_2343 ?AUTO_2344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2364 - BLOCK
      ?AUTO_2365 - BLOCK
    )
    :vars
    (
      ?AUTO_2369 - BLOCK
      ?AUTO_2370 - BLOCK
      ?AUTO_2367 - BLOCK
      ?AUTO_2366 - BLOCK
      ?AUTO_2372 - BLOCK
      ?AUTO_2374 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2364 ?AUTO_2369 ) ( ON ?AUTO_2370 ?AUTO_2364 ) ( ON ?AUTO_2367 ?AUTO_2370 ) ( CLEAR ?AUTO_2366 ) ( ON ?AUTO_2372 ?AUTO_2367 ) ( CLEAR ?AUTO_2372 ) ( HOLDING ?AUTO_2365 ) ( CLEAR ?AUTO_2374 ) )
    :subtasks
    ( ( !STACK ?AUTO_2365 ?AUTO_2374 )
      ( MAKE-ON ?AUTO_2364 ?AUTO_2365 )
      ( MAKE-ON-VERIFY ?AUTO_2364 ?AUTO_2365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2459 - BLOCK
      ?AUTO_2460 - BLOCK
    )
    :vars
    (
      ?AUTO_2462 - BLOCK
      ?AUTO_2466 - BLOCK
      ?AUTO_2464 - BLOCK
      ?AUTO_2465 - BLOCK
      ?AUTO_2468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2462 ) ( ON ?AUTO_2466 ?AUTO_2460 ) ( ON ?AUTO_2464 ?AUTO_2466 ) ( ON ?AUTO_2459 ?AUTO_2464 ) ( CLEAR ?AUTO_2459 ) ( HOLDING ?AUTO_2465 ) ( CLEAR ?AUTO_2468 ) )
    :subtasks
    ( ( !STACK ?AUTO_2465 ?AUTO_2468 )
      ( MAKE-ON ?AUTO_2459 ?AUTO_2460 )
      ( MAKE-ON-VERIFY ?AUTO_2459 ?AUTO_2460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2480 - BLOCK
      ?AUTO_2481 - BLOCK
    )
    :vars
    (
      ?AUTO_2483 - BLOCK
      ?AUTO_2485 - BLOCK
      ?AUTO_2484 - BLOCK
      ?AUTO_2486 - BLOCK
      ?AUTO_2482 - BLOCK
      ?AUTO_2490 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2483 ?AUTO_2481 ) ( ON ?AUTO_2485 ?AUTO_2483 ) ( ON ?AUTO_2480 ?AUTO_2485 ) ( CLEAR ?AUTO_2484 ) ( ON ?AUTO_2486 ?AUTO_2480 ) ( CLEAR ?AUTO_2486 ) ( HOLDING ?AUTO_2482 ) ( CLEAR ?AUTO_2490 ) )
    :subtasks
    ( ( !STACK ?AUTO_2482 ?AUTO_2490 )
      ( MAKE-ON ?AUTO_2480 ?AUTO_2481 )
      ( MAKE-ON-VERIFY ?AUTO_2480 ?AUTO_2481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2849 - BLOCK
      ?AUTO_2850 - BLOCK
    )
    :vars
    (
      ?AUTO_2854 - BLOCK
      ?AUTO_2855 - BLOCK
      ?AUTO_2853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2849 ) ( ON ?AUTO_2854 ?AUTO_2849 ) ( CLEAR ?AUTO_2854 ) ( CLEAR ?AUTO_2855 ) ( ON ?AUTO_2853 ?AUTO_2850 ) ( CLEAR ?AUTO_2853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2853 ?AUTO_2850 )
      ( MAKE-ON ?AUTO_2849 ?AUTO_2850 )
      ( MAKE-ON-VERIFY ?AUTO_2849 ?AUTO_2850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2858 - BLOCK
      ?AUTO_2859 - BLOCK
    )
    :vars
    (
      ?AUTO_2864 - BLOCK
      ?AUTO_2862 - BLOCK
      ?AUTO_2863 - BLOCK
      ?AUTO_2865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2858 ) ( ON ?AUTO_2864 ?AUTO_2858 ) ( CLEAR ?AUTO_2864 ) ( CLEAR ?AUTO_2862 ) ( ON ?AUTO_2863 ?AUTO_2859 ) ( CLEAR ?AUTO_2863 ) ( HOLDING ?AUTO_2865 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2865 )
      ( MAKE-ON ?AUTO_2858 ?AUTO_2859 )
      ( MAKE-ON-VERIFY ?AUTO_2858 ?AUTO_2859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2901 - BLOCK
      ?AUTO_2902 - BLOCK
    )
    :vars
    (
      ?AUTO_2907 - BLOCK
      ?AUTO_2905 - BLOCK
      ?AUTO_2908 - BLOCK
      ?AUTO_2903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2901 ) ( ON ?AUTO_2907 ?AUTO_2901 ) ( CLEAR ?AUTO_2905 ) ( ON ?AUTO_2908 ?AUTO_2902 ) ( CLEAR ?AUTO_2908 ) ( ON ?AUTO_2903 ?AUTO_2907 ) ( CLEAR ?AUTO_2903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2903 ?AUTO_2907 )
      ( MAKE-ON ?AUTO_2901 ?AUTO_2902 )
      ( MAKE-ON-VERIFY ?AUTO_2901 ?AUTO_2902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2920 - BLOCK
      ?AUTO_2921 - BLOCK
    )
    :vars
    (
      ?AUTO_2927 - BLOCK
      ?AUTO_2922 - BLOCK
      ?AUTO_2924 - BLOCK
      ?AUTO_2923 - BLOCK
      ?AUTO_2928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2920 ) ( ON ?AUTO_2927 ?AUTO_2920 ) ( CLEAR ?AUTO_2922 ) ( ON ?AUTO_2924 ?AUTO_2921 ) ( CLEAR ?AUTO_2924 ) ( ON ?AUTO_2923 ?AUTO_2927 ) ( ON ?AUTO_2928 ?AUTO_2923 ) ( CLEAR ?AUTO_2928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2928 ?AUTO_2923 )
      ( MAKE-ON ?AUTO_2920 ?AUTO_2921 )
      ( MAKE-ON-VERIFY ?AUTO_2920 ?AUTO_2921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4053 - BLOCK
      ?AUTO_4054 - BLOCK
    )
    :vars
    (
      ?AUTO_4055 - BLOCK
      ?AUTO_4058 - BLOCK
      ?AUTO_4059 - BLOCK
      ?AUTO_4057 - BLOCK
      ?AUTO_4061 - BLOCK
      ?AUTO_4062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4053 ) ( ON ?AUTO_4055 ?AUTO_4053 ) ( CLEAR ?AUTO_4058 ) ( ON ?AUTO_4059 ?AUTO_4055 ) ( CLEAR ?AUTO_4054 ) ( ON ?AUTO_4057 ?AUTO_4059 ) ( CLEAR ?AUTO_4057 ) ( HOLDING ?AUTO_4061 ) ( CLEAR ?AUTO_4062 ) )
    :subtasks
    ( ( !STACK ?AUTO_4061 ?AUTO_4062 )
      ( MAKE-ON ?AUTO_4053 ?AUTO_4054 )
      ( MAKE-ON-VERIFY ?AUTO_4053 ?AUTO_4054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2953 - BLOCK
      ?AUTO_2954 - BLOCK
    )
    :vars
    (
      ?AUTO_2959 - BLOCK
      ?AUTO_2955 - BLOCK
      ?AUTO_2960 - BLOCK
      ?AUTO_2957 - BLOCK
      ?AUTO_2961 - BLOCK
      ?AUTO_2962 - BLOCK
      ?AUTO_2963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2953 ) ( ON ?AUTO_2959 ?AUTO_2953 ) ( CLEAR ?AUTO_2955 ) ( ON ?AUTO_2960 ?AUTO_2959 ) ( ON ?AUTO_2957 ?AUTO_2960 ) ( CLEAR ?AUTO_2954 ) ( ON ?AUTO_2961 ?AUTO_2957 ) ( CLEAR ?AUTO_2961 ) ( HOLDING ?AUTO_2962 ) ( CLEAR ?AUTO_2963 ) )
    :subtasks
    ( ( !STACK ?AUTO_2962 ?AUTO_2963 )
      ( MAKE-ON ?AUTO_2953 ?AUTO_2954 )
      ( MAKE-ON-VERIFY ?AUTO_2953 ?AUTO_2954 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2980 - BLOCK
      ?AUTO_2981 - BLOCK
    )
    :vars
    (
      ?AUTO_2986 - BLOCK
      ?AUTO_2984 - BLOCK
      ?AUTO_2990 - BLOCK
      ?AUTO_2987 - BLOCK
      ?AUTO_2983 - BLOCK
      ?AUTO_2989 - BLOCK
      ?AUTO_2988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2980 ) ( ON ?AUTO_2986 ?AUTO_2980 ) ( CLEAR ?AUTO_2984 ) ( ON ?AUTO_2990 ?AUTO_2986 ) ( ON ?AUTO_2987 ?AUTO_2990 ) ( ON ?AUTO_2983 ?AUTO_2987 ) ( CLEAR ?AUTO_2983 ) ( CLEAR ?AUTO_2989 ) ( ON ?AUTO_2988 ?AUTO_2981 ) ( CLEAR ?AUTO_2988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2988 ?AUTO_2981 )
      ( MAKE-ON ?AUTO_2980 ?AUTO_2981 )
      ( MAKE-ON-VERIFY ?AUTO_2980 ?AUTO_2981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2993 - BLOCK
      ?AUTO_2994 - BLOCK
    )
    :vars
    (
      ?AUTO_2995 - BLOCK
      ?AUTO_2997 - BLOCK
      ?AUTO_2996 - BLOCK
      ?AUTO_3001 - BLOCK
      ?AUTO_3003 - BLOCK
      ?AUTO_3002 - BLOCK
      ?AUTO_3000 - BLOCK
      ?AUTO_3004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2993 ) ( ON ?AUTO_2995 ?AUTO_2993 ) ( CLEAR ?AUTO_2997 ) ( ON ?AUTO_2996 ?AUTO_2995 ) ( ON ?AUTO_3001 ?AUTO_2996 ) ( ON ?AUTO_3003 ?AUTO_3001 ) ( CLEAR ?AUTO_3003 ) ( CLEAR ?AUTO_3002 ) ( ON ?AUTO_3000 ?AUTO_2994 ) ( CLEAR ?AUTO_3000 ) ( HOLDING ?AUTO_3004 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3004 )
      ( MAKE-ON ?AUTO_2993 ?AUTO_2994 )
      ( MAKE-ON-VERIFY ?AUTO_2993 ?AUTO_2994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3005 - BLOCK
      ?AUTO_3006 - BLOCK
    )
    :vars
    (
      ?AUTO_3007 - BLOCK
      ?AUTO_3011 - BLOCK
      ?AUTO_3008 - BLOCK
      ?AUTO_3012 - BLOCK
      ?AUTO_3009 - BLOCK
      ?AUTO_3010 - BLOCK
      ?AUTO_3015 - BLOCK
      ?AUTO_3016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3005 ) ( ON ?AUTO_3007 ?AUTO_3005 ) ( CLEAR ?AUTO_3011 ) ( ON ?AUTO_3008 ?AUTO_3007 ) ( ON ?AUTO_3012 ?AUTO_3008 ) ( ON ?AUTO_3009 ?AUTO_3012 ) ( CLEAR ?AUTO_3009 ) ( CLEAR ?AUTO_3010 ) ( ON ?AUTO_3015 ?AUTO_3006 ) ( ON ?AUTO_3016 ?AUTO_3015 ) ( CLEAR ?AUTO_3016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3016 ?AUTO_3015 )
      ( MAKE-ON ?AUTO_3005 ?AUTO_3006 )
      ( MAKE-ON-VERIFY ?AUTO_3005 ?AUTO_3006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3320 - BLOCK
      ?AUTO_3321 - BLOCK
    )
    :vars
    (
      ?AUTO_3322 - BLOCK
      ?AUTO_3328 - BLOCK
      ?AUTO_3324 - BLOCK
      ?AUTO_3325 - BLOCK
      ?AUTO_3327 - BLOCK
      ?AUTO_3330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3321 ) ( ON ?AUTO_3320 ?AUTO_3322 ) ( ON ?AUTO_3328 ?AUTO_3320 ) ( ON ?AUTO_3324 ?AUTO_3328 ) ( ON ?AUTO_3325 ?AUTO_3324 ) ( CLEAR ?AUTO_3325 ) ( HOLDING ?AUTO_3327 ) ( CLEAR ?AUTO_3330 ) )
    :subtasks
    ( ( !STACK ?AUTO_3327 ?AUTO_3330 )
      ( MAKE-ON ?AUTO_3320 ?AUTO_3321 )
      ( MAKE-ON-VERIFY ?AUTO_3320 ?AUTO_3321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3655 - BLOCK
      ?AUTO_3656 - BLOCK
    )
    :vars
    (
      ?AUTO_3659 - BLOCK
      ?AUTO_3663 - BLOCK
      ?AUTO_3660 - BLOCK
      ?AUTO_3661 - BLOCK
      ?AUTO_3662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3659 ) ( ON ?AUTO_3663 ?AUTO_3656 ) ( ON ?AUTO_3660 ?AUTO_3663 ) ( ON ?AUTO_3661 ?AUTO_3660 ) ( CLEAR ?AUTO_3661 ) ( HOLDING ?AUTO_3655 ) ( CLEAR ?AUTO_3662 ) )
    :subtasks
    ( ( !STACK ?AUTO_3655 ?AUTO_3662 )
      ( MAKE-ON ?AUTO_3655 ?AUTO_3656 )
      ( MAKE-ON-VERIFY ?AUTO_3655 ?AUTO_3656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3677 - BLOCK
      ?AUTO_3678 - BLOCK
    )
    :vars
    (
      ?AUTO_3679 - BLOCK
      ?AUTO_3685 - BLOCK
      ?AUTO_3683 - BLOCK
      ?AUTO_3682 - BLOCK
      ?AUTO_3684 - BLOCK
      ?AUTO_3687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3679 ) ( ON ?AUTO_3685 ?AUTO_3678 ) ( ON ?AUTO_3683 ?AUTO_3685 ) ( ON ?AUTO_3682 ?AUTO_3683 ) ( ON ?AUTO_3677 ?AUTO_3682 ) ( CLEAR ?AUTO_3677 ) ( HOLDING ?AUTO_3684 ) ( CLEAR ?AUTO_3687 ) )
    :subtasks
    ( ( !STACK ?AUTO_3684 ?AUTO_3687 )
      ( MAKE-ON ?AUTO_3677 ?AUTO_3678 )
      ( MAKE-ON-VERIFY ?AUTO_3677 ?AUTO_3678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4067 - BLOCK
      ?AUTO_4068 - BLOCK
    )
    :vars
    (
      ?AUTO_4075 - BLOCK
      ?AUTO_4069 - BLOCK
      ?AUTO_4074 - BLOCK
      ?AUTO_4072 - BLOCK
      ?AUTO_4076 - BLOCK
      ?AUTO_4071 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4067 ) ( ON ?AUTO_4075 ?AUTO_4067 ) ( CLEAR ?AUTO_4069 ) ( ON ?AUTO_4074 ?AUTO_4075 ) ( ON ?AUTO_4072 ?AUTO_4074 ) ( CLEAR ?AUTO_4072 ) ( CLEAR ?AUTO_4076 ) ( ON ?AUTO_4071 ?AUTO_4068 ) ( CLEAR ?AUTO_4071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4071 ?AUTO_4068 )
      ( MAKE-ON ?AUTO_4067 ?AUTO_4068 )
      ( MAKE-ON-VERIFY ?AUTO_4067 ?AUTO_4068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4079 - BLOCK
      ?AUTO_4080 - BLOCK
    )
    :vars
    (
      ?AUTO_4081 - BLOCK
      ?AUTO_4088 - BLOCK
      ?AUTO_4087 - BLOCK
      ?AUTO_4083 - BLOCK
      ?AUTO_4086 - BLOCK
      ?AUTO_4084 - BLOCK
      ?AUTO_4089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4079 ) ( ON ?AUTO_4081 ?AUTO_4079 ) ( CLEAR ?AUTO_4088 ) ( ON ?AUTO_4087 ?AUTO_4081 ) ( ON ?AUTO_4083 ?AUTO_4087 ) ( CLEAR ?AUTO_4083 ) ( CLEAR ?AUTO_4086 ) ( ON ?AUTO_4084 ?AUTO_4080 ) ( CLEAR ?AUTO_4084 ) ( HOLDING ?AUTO_4089 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4089 )
      ( MAKE-ON ?AUTO_4079 ?AUTO_4080 )
      ( MAKE-ON-VERIFY ?AUTO_4079 ?AUTO_4080 ) )
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
      ?AUTO_4125 - BLOCK
      ?AUTO_4121 - BLOCK
      ?AUTO_4117 - BLOCK
      ?AUTO_4120 - BLOCK
      ?AUTO_4119 - BLOCK
      ?AUTO_4124 - BLOCK
      ?AUTO_4126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4115 ) ( ON ?AUTO_4118 ?AUTO_4115 ) ( CLEAR ?AUTO_4125 ) ( ON ?AUTO_4121 ?AUTO_4118 ) ( ON ?AUTO_4117 ?AUTO_4121 ) ( CLEAR ?AUTO_4117 ) ( CLEAR ?AUTO_4120 ) ( ON ?AUTO_4119 ?AUTO_4116 ) ( ON ?AUTO_4124 ?AUTO_4119 ) ( ON ?AUTO_4126 ?AUTO_4124 ) ( CLEAR ?AUTO_4126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4126 ?AUTO_4124 )
      ( MAKE-ON ?AUTO_4115 ?AUTO_4116 )
      ( MAKE-ON-VERIFY ?AUTO_4115 ?AUTO_4116 ) )
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
      ?AUTO_4139 - BLOCK
      ?AUTO_4135 - BLOCK
      ?AUTO_4140 - BLOCK
      ?AUTO_4137 - BLOCK
      ?AUTO_4134 - BLOCK
      ?AUTO_4138 - BLOCK
      ?AUTO_4133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4129 ) ( ON ?AUTO_4131 ?AUTO_4129 ) ( CLEAR ?AUTO_4139 ) ( ON ?AUTO_4135 ?AUTO_4131 ) ( CLEAR ?AUTO_4140 ) ( ON ?AUTO_4137 ?AUTO_4130 ) ( ON ?AUTO_4134 ?AUTO_4137 ) ( ON ?AUTO_4138 ?AUTO_4134 ) ( CLEAR ?AUTO_4138 ) ( HOLDING ?AUTO_4133 ) ( CLEAR ?AUTO_4135 ) )
    :subtasks
    ( ( !STACK ?AUTO_4133 ?AUTO_4135 )
      ( MAKE-ON ?AUTO_4129 ?AUTO_4130 )
      ( MAKE-ON-VERIFY ?AUTO_4129 ?AUTO_4130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4143 - BLOCK
      ?AUTO_4144 - BLOCK
    )
    :vars
    (
      ?AUTO_4146 - BLOCK
      ?AUTO_4148 - BLOCK
      ?AUTO_4152 - BLOCK
      ?AUTO_4145 - BLOCK
      ?AUTO_4150 - BLOCK
      ?AUTO_4153 - BLOCK
      ?AUTO_4147 - BLOCK
      ?AUTO_4154 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4143 ) ( ON ?AUTO_4146 ?AUTO_4143 ) ( CLEAR ?AUTO_4148 ) ( ON ?AUTO_4152 ?AUTO_4146 ) ( CLEAR ?AUTO_4145 ) ( ON ?AUTO_4150 ?AUTO_4144 ) ( ON ?AUTO_4153 ?AUTO_4150 ) ( ON ?AUTO_4147 ?AUTO_4153 ) ( CLEAR ?AUTO_4152 ) ( ON ?AUTO_4154 ?AUTO_4147 ) ( CLEAR ?AUTO_4154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4154 ?AUTO_4147 )
      ( MAKE-ON ?AUTO_4143 ?AUTO_4144 )
      ( MAKE-ON-VERIFY ?AUTO_4143 ?AUTO_4144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4157 - BLOCK
      ?AUTO_4158 - BLOCK
    )
    :vars
    (
      ?AUTO_4159 - BLOCK
      ?AUTO_4161 - BLOCK
      ?AUTO_4164 - BLOCK
      ?AUTO_4163 - BLOCK
      ?AUTO_4167 - BLOCK
      ?AUTO_4168 - BLOCK
      ?AUTO_4165 - BLOCK
      ?AUTO_4166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4157 ) ( ON ?AUTO_4159 ?AUTO_4157 ) ( CLEAR ?AUTO_4161 ) ( CLEAR ?AUTO_4164 ) ( ON ?AUTO_4163 ?AUTO_4158 ) ( ON ?AUTO_4167 ?AUTO_4163 ) ( ON ?AUTO_4168 ?AUTO_4167 ) ( ON ?AUTO_4165 ?AUTO_4168 ) ( CLEAR ?AUTO_4165 ) ( HOLDING ?AUTO_4166 ) ( CLEAR ?AUTO_4159 ) )
    :subtasks
    ( ( !STACK ?AUTO_4166 ?AUTO_4159 )
      ( MAKE-ON ?AUTO_4157 ?AUTO_4158 )
      ( MAKE-ON-VERIFY ?AUTO_4157 ?AUTO_4158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4171 - BLOCK
      ?AUTO_4172 - BLOCK
    )
    :vars
    (
      ?AUTO_4176 - BLOCK
      ?AUTO_4175 - BLOCK
      ?AUTO_4181 - BLOCK
      ?AUTO_4180 - BLOCK
      ?AUTO_4173 - BLOCK
      ?AUTO_4182 - BLOCK
      ?AUTO_4178 - BLOCK
      ?AUTO_4174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4171 ) ( ON ?AUTO_4176 ?AUTO_4171 ) ( CLEAR ?AUTO_4175 ) ( CLEAR ?AUTO_4181 ) ( ON ?AUTO_4180 ?AUTO_4172 ) ( ON ?AUTO_4173 ?AUTO_4180 ) ( ON ?AUTO_4182 ?AUTO_4173 ) ( ON ?AUTO_4178 ?AUTO_4182 ) ( CLEAR ?AUTO_4178 ) ( CLEAR ?AUTO_4176 ) ( ON-TABLE ?AUTO_4174 ) ( CLEAR ?AUTO_4174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4174 )
      ( MAKE-ON ?AUTO_4171 ?AUTO_4172 )
      ( MAKE-ON-VERIFY ?AUTO_4171 ?AUTO_4172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4184 - BLOCK
      ?AUTO_4185 - BLOCK
    )
    :vars
    (
      ?AUTO_4188 - BLOCK
      ?AUTO_4195 - BLOCK
      ?AUTO_4193 - BLOCK
      ?AUTO_4186 - BLOCK
      ?AUTO_4194 - BLOCK
      ?AUTO_4192 - BLOCK
      ?AUTO_4191 - BLOCK
      ?AUTO_4189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4184 ) ( CLEAR ?AUTO_4188 ) ( CLEAR ?AUTO_4195 ) ( ON ?AUTO_4193 ?AUTO_4185 ) ( ON ?AUTO_4186 ?AUTO_4193 ) ( ON ?AUTO_4194 ?AUTO_4186 ) ( ON ?AUTO_4192 ?AUTO_4194 ) ( CLEAR ?AUTO_4192 ) ( ON-TABLE ?AUTO_4191 ) ( CLEAR ?AUTO_4191 ) ( HOLDING ?AUTO_4189 ) ( CLEAR ?AUTO_4184 ) )
    :subtasks
    ( ( !STACK ?AUTO_4189 ?AUTO_4184 )
      ( MAKE-ON ?AUTO_4184 ?AUTO_4185 )
      ( MAKE-ON-VERIFY ?AUTO_4184 ?AUTO_4185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4218 - BLOCK
      ?AUTO_4219 - BLOCK
    )
    :vars
    (
      ?AUTO_4229 - BLOCK
      ?AUTO_4221 - BLOCK
      ?AUTO_4226 - BLOCK
      ?AUTO_4222 - BLOCK
      ?AUTO_4227 - BLOCK
      ?AUTO_4224 - BLOCK
      ?AUTO_4223 - BLOCK
      ?AUTO_4228 - BLOCK
      ?AUTO_4231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4218 ) ( CLEAR ?AUTO_4229 ) ( CLEAR ?AUTO_4221 ) ( ON ?AUTO_4226 ?AUTO_4219 ) ( ON ?AUTO_4222 ?AUTO_4226 ) ( ON ?AUTO_4227 ?AUTO_4222 ) ( ON ?AUTO_4224 ?AUTO_4227 ) ( CLEAR ?AUTO_4224 ) ( ON-TABLE ?AUTO_4223 ) ( CLEAR ?AUTO_4223 ) ( CLEAR ?AUTO_4218 ) ( ON ?AUTO_4228 ?AUTO_4231 ) ( CLEAR ?AUTO_4228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4228 ?AUTO_4231 )
      ( MAKE-ON ?AUTO_4218 ?AUTO_4219 )
      ( MAKE-ON-VERIFY ?AUTO_4218 ?AUTO_4219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6588 - BLOCK
      ?AUTO_6589 - BLOCK
    )
    :vars
    (
      ?AUTO_6594 - BLOCK
      ?AUTO_6592 - BLOCK
      ?AUTO_6597 - BLOCK
      ?AUTO_6593 - BLOCK
      ?AUTO_6596 - BLOCK
      ?AUTO_6595 - BLOCK
      ?AUTO_6598 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6588 ?AUTO_6594 ) ( CLEAR ?AUTO_6592 ) ( ON ?AUTO_6597 ?AUTO_6588 ) ( ON ?AUTO_6593 ?AUTO_6589 ) ( CLEAR ?AUTO_6593 ) ( CLEAR ?AUTO_6596 ) ( ON ?AUTO_6595 ?AUTO_6597 ) ( CLEAR ?AUTO_6595 ) ( HOLDING ?AUTO_6598 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6598 )
      ( MAKE-ON ?AUTO_6588 ?AUTO_6589 )
      ( MAKE-ON-VERIFY ?AUTO_6588 ?AUTO_6589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5117 - BLOCK
      ?AUTO_5118 - BLOCK
    )
    :vars
    (
      ?AUTO_5121 - BLOCK
      ?AUTO_5123 - BLOCK
      ?AUTO_5125 - BLOCK
      ?AUTO_5126 - BLOCK
      ?AUTO_5119 - BLOCK
      ?AUTO_5124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5117 ) ( CLEAR ?AUTO_5121 ) ( ON ?AUTO_5123 ?AUTO_5118 ) ( ON ?AUTO_5125 ?AUTO_5123 ) ( ON ?AUTO_5126 ?AUTO_5125 ) ( CLEAR ?AUTO_5126 ) ( CLEAR ?AUTO_5119 ) ( ON ?AUTO_5124 ?AUTO_5117 ) ( CLEAR ?AUTO_5124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5124 ?AUTO_5117 )
      ( MAKE-ON ?AUTO_5117 ?AUTO_5118 )
      ( MAKE-ON-VERIFY ?AUTO_5117 ?AUTO_5118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5129 - BLOCK
      ?AUTO_5130 - BLOCK
    )
    :vars
    (
      ?AUTO_5131 - BLOCK
      ?AUTO_5133 - BLOCK
      ?AUTO_5134 - BLOCK
      ?AUTO_5138 - BLOCK
      ?AUTO_5132 - BLOCK
      ?AUTO_5137 - BLOCK
      ?AUTO_5139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5129 ) ( CLEAR ?AUTO_5131 ) ( ON ?AUTO_5133 ?AUTO_5130 ) ( ON ?AUTO_5134 ?AUTO_5133 ) ( ON ?AUTO_5138 ?AUTO_5134 ) ( CLEAR ?AUTO_5138 ) ( CLEAR ?AUTO_5132 ) ( ON ?AUTO_5137 ?AUTO_5129 ) ( CLEAR ?AUTO_5137 ) ( HOLDING ?AUTO_5139 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5139 )
      ( MAKE-ON ?AUTO_5129 ?AUTO_5130 )
      ( MAKE-ON-VERIFY ?AUTO_5129 ?AUTO_5130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5140 - BLOCK
      ?AUTO_5141 - BLOCK
    )
    :vars
    (
      ?AUTO_5149 - BLOCK
      ?AUTO_5147 - BLOCK
      ?AUTO_5150 - BLOCK
      ?AUTO_5145 - BLOCK
      ?AUTO_5143 - BLOCK
      ?AUTO_5148 - BLOCK
      ?AUTO_5142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5140 ) ( CLEAR ?AUTO_5149 ) ( ON ?AUTO_5147 ?AUTO_5141 ) ( ON ?AUTO_5150 ?AUTO_5147 ) ( ON ?AUTO_5145 ?AUTO_5150 ) ( CLEAR ?AUTO_5145 ) ( CLEAR ?AUTO_5143 ) ( ON ?AUTO_5148 ?AUTO_5140 ) ( ON ?AUTO_5142 ?AUTO_5148 ) ( CLEAR ?AUTO_5142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5142 ?AUTO_5148 )
      ( MAKE-ON ?AUTO_5140 ?AUTO_5141 )
      ( MAKE-ON-VERIFY ?AUTO_5140 ?AUTO_5141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5153 - BLOCK
      ?AUTO_5154 - BLOCK
    )
    :vars
    (
      ?AUTO_5156 - BLOCK
      ?AUTO_5162 - BLOCK
      ?AUTO_5155 - BLOCK
      ?AUTO_5159 - BLOCK
      ?AUTO_5157 - BLOCK
      ?AUTO_5158 - BLOCK
      ?AUTO_5163 - BLOCK
      ?AUTO_5164 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5153 ) ( CLEAR ?AUTO_5156 ) ( ON ?AUTO_5162 ?AUTO_5154 ) ( ON ?AUTO_5155 ?AUTO_5162 ) ( ON ?AUTO_5159 ?AUTO_5155 ) ( CLEAR ?AUTO_5159 ) ( CLEAR ?AUTO_5157 ) ( ON ?AUTO_5158 ?AUTO_5153 ) ( ON ?AUTO_5163 ?AUTO_5158 ) ( CLEAR ?AUTO_5163 ) ( HOLDING ?AUTO_5164 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5164 )
      ( MAKE-ON ?AUTO_5153 ?AUTO_5154 )
      ( MAKE-ON-VERIFY ?AUTO_5153 ?AUTO_5154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5165 - BLOCK
      ?AUTO_5166 - BLOCK
    )
    :vars
    (
      ?AUTO_5168 - BLOCK
      ?AUTO_5170 - BLOCK
      ?AUTO_5169 - BLOCK
      ?AUTO_5175 - BLOCK
      ?AUTO_5174 - BLOCK
      ?AUTO_5173 - BLOCK
      ?AUTO_5167 - BLOCK
      ?AUTO_5176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5165 ) ( CLEAR ?AUTO_5168 ) ( ON ?AUTO_5170 ?AUTO_5166 ) ( ON ?AUTO_5169 ?AUTO_5170 ) ( ON ?AUTO_5175 ?AUTO_5169 ) ( CLEAR ?AUTO_5175 ) ( CLEAR ?AUTO_5174 ) ( ON ?AUTO_5173 ?AUTO_5165 ) ( ON ?AUTO_5167 ?AUTO_5173 ) ( ON ?AUTO_5176 ?AUTO_5167 ) ( CLEAR ?AUTO_5176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5176 ?AUTO_5167 )
      ( MAKE-ON ?AUTO_5165 ?AUTO_5166 )
      ( MAKE-ON-VERIFY ?AUTO_5165 ?AUTO_5166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5179 - BLOCK
      ?AUTO_5180 - BLOCK
    )
    :vars
    (
      ?AUTO_5187 - BLOCK
      ?AUTO_5186 - BLOCK
      ?AUTO_5190 - BLOCK
      ?AUTO_5185 - BLOCK
      ?AUTO_5181 - BLOCK
      ?AUTO_5184 - BLOCK
      ?AUTO_5183 - BLOCK
      ?AUTO_5188 - BLOCK
      ?AUTO_5191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5179 ) ( CLEAR ?AUTO_5187 ) ( ON ?AUTO_5186 ?AUTO_5180 ) ( ON ?AUTO_5190 ?AUTO_5186 ) ( ON ?AUTO_5185 ?AUTO_5190 ) ( CLEAR ?AUTO_5185 ) ( CLEAR ?AUTO_5181 ) ( ON ?AUTO_5184 ?AUTO_5179 ) ( ON ?AUTO_5183 ?AUTO_5184 ) ( ON ?AUTO_5188 ?AUTO_5183 ) ( CLEAR ?AUTO_5188 ) ( HOLDING ?AUTO_5191 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5191 )
      ( MAKE-ON ?AUTO_5179 ?AUTO_5180 )
      ( MAKE-ON-VERIFY ?AUTO_5179 ?AUTO_5180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5192 - BLOCK
      ?AUTO_5193 - BLOCK
    )
    :vars
    (
      ?AUTO_5198 - BLOCK
      ?AUTO_5200 - BLOCK
      ?AUTO_5194 - BLOCK
      ?AUTO_5201 - BLOCK
      ?AUTO_5195 - BLOCK
      ?AUTO_5202 - BLOCK
      ?AUTO_5203 - BLOCK
      ?AUTO_5197 - BLOCK
      ?AUTO_5204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5192 ) ( CLEAR ?AUTO_5198 ) ( ON ?AUTO_5200 ?AUTO_5193 ) ( ON ?AUTO_5194 ?AUTO_5200 ) ( ON ?AUTO_5201 ?AUTO_5194 ) ( CLEAR ?AUTO_5201 ) ( CLEAR ?AUTO_5195 ) ( ON ?AUTO_5202 ?AUTO_5192 ) ( ON ?AUTO_5203 ?AUTO_5202 ) ( ON ?AUTO_5197 ?AUTO_5203 ) ( ON ?AUTO_5204 ?AUTO_5197 ) ( CLEAR ?AUTO_5204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5204 ?AUTO_5197 )
      ( MAKE-ON ?AUTO_5192 ?AUTO_5193 )
      ( MAKE-ON-VERIFY ?AUTO_5192 ?AUTO_5193 ) )
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
      ?AUTO_5293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5287 ) ( ON ?AUTO_5289 ?AUTO_5287 ) ( CLEAR ?AUTO_5289 ) ( HOLDING ?AUTO_5288 ) ( CLEAR ?AUTO_5293 ) )
    :subtasks
    ( ( !STACK ?AUTO_5288 ?AUTO_5293 )
      ( MAKE-ON ?AUTO_5287 ?AUTO_5288 )
      ( MAKE-ON-VERIFY ?AUTO_5287 ?AUTO_5288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5429 - BLOCK
      ?AUTO_5430 - BLOCK
    )
    :vars
    (
      ?AUTO_5434 - BLOCK
      ?AUTO_5433 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5434 ) ( ON ?AUTO_5433 ?AUTO_5430 ) ( CLEAR ?AUTO_5433 ) ( HOLDING ?AUTO_5429 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5429 )
      ( MAKE-ON ?AUTO_5429 ?AUTO_5430 )
      ( MAKE-ON-VERIFY ?AUTO_5429 ?AUTO_5430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6390 - BLOCK
      ?AUTO_6391 - BLOCK
    )
    :vars
    (
      ?AUTO_6399 - BLOCK
      ?AUTO_6400 - BLOCK
      ?AUTO_6393 - BLOCK
      ?AUTO_6397 - BLOCK
      ?AUTO_6396 - BLOCK
      ?AUTO_6392 - BLOCK
      ?AUTO_6398 - BLOCK
      ?AUTO_6401 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6390 ?AUTO_6399 ) ( CLEAR ?AUTO_6400 ) ( ON ?AUTO_6393 ?AUTO_6390 ) ( CLEAR ?AUTO_6393 ) ( ON ?AUTO_6397 ?AUTO_6391 ) ( CLEAR ?AUTO_6396 ) ( ON ?AUTO_6392 ?AUTO_6397 ) ( ON ?AUTO_6398 ?AUTO_6392 ) ( CLEAR ?AUTO_6398 ) ( HOLDING ?AUTO_6401 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6401 )
      ( MAKE-ON ?AUTO_6390 ?AUTO_6391 )
      ( MAKE-ON-VERIFY ?AUTO_6390 ?AUTO_6391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5466 - BLOCK
      ?AUTO_5467 - BLOCK
    )
    :vars
    (
      ?AUTO_5470 - BLOCK
      ?AUTO_5468 - BLOCK
      ?AUTO_5469 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5470 ?AUTO_5467 ) ( ON ?AUTO_5466 ?AUTO_5470 ) ( ON ?AUTO_5468 ?AUTO_5466 ) ( ON ?AUTO_5469 ?AUTO_5468 ) ( CLEAR ?AUTO_5469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5469 ?AUTO_5468 )
      ( MAKE-ON ?AUTO_5466 ?AUTO_5467 )
      ( MAKE-ON-VERIFY ?AUTO_5466 ?AUTO_5467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5689 - BLOCK
      ?AUTO_5690 - BLOCK
    )
    :vars
    (
      ?AUTO_5692 - BLOCK
      ?AUTO_5693 - BLOCK
      ?AUTO_5694 - BLOCK
      ?AUTO_5691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5689 ) ( ON ?AUTO_5692 ?AUTO_5689 ) ( ON ?AUTO_5693 ?AUTO_5692 ) ( CLEAR ?AUTO_5694 ) ( ON ?AUTO_5691 ?AUTO_5693 ) ( CLEAR ?AUTO_5691 ) ( HOLDING ?AUTO_5690 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5690 )
      ( MAKE-ON ?AUTO_5689 ?AUTO_5690 )
      ( MAKE-ON-VERIFY ?AUTO_5689 ?AUTO_5690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5874 - BLOCK
      ?AUTO_5875 - BLOCK
    )
    :vars
    (
      ?AUTO_5880 - BLOCK
      ?AUTO_5877 - BLOCK
      ?AUTO_5876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5875 ) ( ON-TABLE ?AUTO_5874 ) ( ON ?AUTO_5880 ?AUTO_5874 ) ( ON ?AUTO_5877 ?AUTO_5880 ) ( CLEAR ?AUTO_5877 ) ( HOLDING ?AUTO_5876 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5876 )
      ( MAKE-ON ?AUTO_5874 ?AUTO_5875 )
      ( MAKE-ON-VERIFY ?AUTO_5874 ?AUTO_5875 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6057 - BLOCK
    )
    :vars
    (
      ?AUTO_6062 - BLOCK
      ?AUTO_6058 - BLOCK
      ?AUTO_6061 - BLOCK
      ?AUTO_6059 - BLOCK
      ?AUTO_6060 - BLOCK
      ?AUTO_6064 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6057 ?AUTO_6062 ) ( ON ?AUTO_6058 ?AUTO_6057 ) ( CLEAR ?AUTO_6061 ) ( ON ?AUTO_6059 ?AUTO_6058 ) ( ON ?AUTO_6060 ?AUTO_6059 ) ( CLEAR ?AUTO_6060 ) ( HOLDING ?AUTO_6064 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6064 )
      ( MAKE-ON-TABLE ?AUTO_6057 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6154 - BLOCK
      ?AUTO_6155 - BLOCK
    )
    :vars
    (
      ?AUTO_6158 - BLOCK
      ?AUTO_6160 - BLOCK
      ?AUTO_6156 - BLOCK
      ?AUTO_6163 - BLOCK
      ?AUTO_6162 - BLOCK
      ?AUTO_6159 - BLOCK
      ?AUTO_6164 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6154 ?AUTO_6158 ) ( CLEAR ?AUTO_6154 ) ( ON ?AUTO_6160 ?AUTO_6155 ) ( ON ?AUTO_6156 ?AUTO_6160 ) ( CLEAR ?AUTO_6163 ) ( ON ?AUTO_6162 ?AUTO_6156 ) ( ON ?AUTO_6159 ?AUTO_6162 ) ( CLEAR ?AUTO_6159 ) ( HOLDING ?AUTO_6164 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6164 )
      ( MAKE-ON ?AUTO_6154 ?AUTO_6155 )
      ( MAKE-ON-VERIFY ?AUTO_6154 ?AUTO_6155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6340 - BLOCK
      ?AUTO_6341 - BLOCK
    )
    :vars
    (
      ?AUTO_6347 - BLOCK
      ?AUTO_6345 - BLOCK
      ?AUTO_6344 - BLOCK
      ?AUTO_6342 - BLOCK
      ?AUTO_6348 - BLOCK
      ?AUTO_6349 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6340 ?AUTO_6347 ) ( CLEAR ?AUTO_6345 ) ( ON ?AUTO_6344 ?AUTO_6340 ) ( CLEAR ?AUTO_6344 ) ( ON ?AUTO_6342 ?AUTO_6341 ) ( CLEAR ?AUTO_6342 ) ( HOLDING ?AUTO_6348 ) ( CLEAR ?AUTO_6349 ) )
    :subtasks
    ( ( !STACK ?AUTO_6348 ?AUTO_6349 )
      ( MAKE-ON ?AUTO_6340 ?AUTO_6341 )
      ( MAKE-ON-VERIFY ?AUTO_6340 ?AUTO_6341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6354 - BLOCK
      ?AUTO_6355 - BLOCK
    )
    :vars
    (
      ?AUTO_6356 - BLOCK
      ?AUTO_6360 - BLOCK
      ?AUTO_6358 - BLOCK
      ?AUTO_6359 - BLOCK
      ?AUTO_6362 - BLOCK
      ?AUTO_6357 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6354 ?AUTO_6356 ) ( CLEAR ?AUTO_6360 ) ( ON ?AUTO_6358 ?AUTO_6354 ) ( CLEAR ?AUTO_6358 ) ( ON ?AUTO_6359 ?AUTO_6355 ) ( CLEAR ?AUTO_6362 ) ( ON ?AUTO_6357 ?AUTO_6359 ) ( CLEAR ?AUTO_6357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6357 ?AUTO_6359 )
      ( MAKE-ON ?AUTO_6354 ?AUTO_6355 )
      ( MAKE-ON-VERIFY ?AUTO_6354 ?AUTO_6355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6377 - BLOCK
      ?AUTO_6378 - BLOCK
    )
    :vars
    (
      ?AUTO_6386 - BLOCK
      ?AUTO_6379 - BLOCK
      ?AUTO_6380 - BLOCK
      ?AUTO_6385 - BLOCK
      ?AUTO_6381 - BLOCK
      ?AUTO_6384 - BLOCK
      ?AUTO_6387 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6377 ?AUTO_6386 ) ( CLEAR ?AUTO_6379 ) ( ON ?AUTO_6380 ?AUTO_6377 ) ( CLEAR ?AUTO_6380 ) ( ON ?AUTO_6385 ?AUTO_6378 ) ( CLEAR ?AUTO_6381 ) ( ON ?AUTO_6384 ?AUTO_6385 ) ( ON ?AUTO_6387 ?AUTO_6384 ) ( CLEAR ?AUTO_6387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6387 ?AUTO_6384 )
      ( MAKE-ON ?AUTO_6377 ?AUTO_6378 )
      ( MAKE-ON-VERIFY ?AUTO_6377 ?AUTO_6378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6402 - BLOCK
      ?AUTO_6403 - BLOCK
    )
    :vars
    (
      ?AUTO_6405 - BLOCK
      ?AUTO_6409 - BLOCK
      ?AUTO_6412 - BLOCK
      ?AUTO_6408 - BLOCK
      ?AUTO_6410 - BLOCK
      ?AUTO_6404 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6402 ?AUTO_6405 ) ( ON ?AUTO_6409 ?AUTO_6402 ) ( ON ?AUTO_6412 ?AUTO_6403 ) ( ON ?AUTO_6408 ?AUTO_6412 ) ( ON ?AUTO_6410 ?AUTO_6408 ) ( CLEAR ?AUTO_6410 ) ( ON ?AUTO_6404 ?AUTO_6409 ) ( CLEAR ?AUTO_6404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6404 ?AUTO_6409 )
      ( MAKE-ON ?AUTO_6402 ?AUTO_6403 )
      ( MAKE-ON-VERIFY ?AUTO_6402 ?AUTO_6403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6599 - BLOCK
      ?AUTO_6600 - BLOCK
    )
    :vars
    (
      ?AUTO_6606 - BLOCK
      ?AUTO_6602 - BLOCK
      ?AUTO_6603 - BLOCK
      ?AUTO_6604 - BLOCK
      ?AUTO_6609 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6599 ?AUTO_6606 ) ( ON ?AUTO_6602 ?AUTO_6599 ) ( ON ?AUTO_6603 ?AUTO_6600 ) ( ON ?AUTO_6604 ?AUTO_6602 ) ( CLEAR ?AUTO_6604 ) ( ON ?AUTO_6609 ?AUTO_6603 ) ( CLEAR ?AUTO_6609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6609 ?AUTO_6603 )
      ( MAKE-ON ?AUTO_6599 ?AUTO_6600 )
      ( MAKE-ON-VERIFY ?AUTO_6599 ?AUTO_6600 ) )
  )

)

