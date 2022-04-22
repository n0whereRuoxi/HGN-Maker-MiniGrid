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
      ?AUTO_48 - BLOCK
      ?AUTO_49 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_44 ) ( CLEAR ?AUTO_44 ) ( CLEAR ?AUTO_48 ) ( ON ?AUTO_49 ?AUTO_45 ) ( CLEAR ?AUTO_49 ) ( HAND-EMPTY ) )
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
      ?AUTO_56 - BLOCK
      ?AUTO_57 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_52 ) ( CLEAR ?AUTO_52 ) ( ON ?AUTO_56 ?AUTO_53 ) ( CLEAR ?AUTO_56 ) ( HOLDING ?AUTO_57 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_57 )
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
      ?AUTO_63 - BLOCK
      ?AUTO_64 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_59 ) ( ON ?AUTO_63 ?AUTO_60 ) ( CLEAR ?AUTO_63 ) ( ON ?AUTO_64 ?AUTO_59 ) ( CLEAR ?AUTO_64 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_64 ?AUTO_59 )
      ( MAKE-ON ?AUTO_59 ?AUTO_60 )
      ( MAKE-ON-VERIFY ?AUTO_59 ?AUTO_60 ) )
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
      ?AUTO_106 - BLOCK
    )
    :vars
    (
      ?AUTO_107 - BLOCK
      ?AUTO_109 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_106 ?AUTO_107 ) ( CLEAR ?AUTO_106 ) ( HOLDING ?AUTO_109 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_109 )
      ( MAKE-ON-TABLE ?AUTO_106 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1584 - BLOCK
      ?AUTO_1585 - BLOCK
    )
    :vars
    (
      ?AUTO_1589 - BLOCK
      ?AUTO_1586 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1585 ) ( ON ?AUTO_1584 ?AUTO_1589 ) ( ON ?AUTO_1586 ?AUTO_1584 ) ( CLEAR ?AUTO_1586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1586 ?AUTO_1584 )
      ( MAKE-ON ?AUTO_1584 ?AUTO_1585 )
      ( MAKE-ON-VERIFY ?AUTO_1584 ?AUTO_1585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2456 - BLOCK
      ?AUTO_2457 - BLOCK
    )
    :vars
    (
      ?AUTO_2458 - BLOCK
      ?AUTO_2459 - BLOCK
      ?AUTO_2462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2457 ) ( ON ?AUTO_2456 ?AUTO_2458 ) ( ON ?AUTO_2459 ?AUTO_2456 ) ( CLEAR ?AUTO_2459 ) ( HOLDING ?AUTO_2462 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2462 )
      ( MAKE-ON ?AUTO_2456 ?AUTO_2457 )
      ( MAKE-ON-VERIFY ?AUTO_2456 ?AUTO_2457 ) )
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
      ?AUTO_168 - BLOCK
      ?AUTO_170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_166 ) ( ON ?AUTO_165 ?AUTO_168 ) ( CLEAR ?AUTO_165 ) ( HOLDING ?AUTO_170 ) )
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
      ?AUTO_175 - BLOCK
      ?AUTO_176 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_171 ?AUTO_175 ) ( CLEAR ?AUTO_171 ) ( ON ?AUTO_176 ?AUTO_172 ) ( CLEAR ?AUTO_176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_176 ?AUTO_172 )
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
      ?AUTO_181 - BLOCK
      ?AUTO_184 - BLOCK
      ?AUTO_185 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_179 ?AUTO_181 ) ( CLEAR ?AUTO_179 ) ( ON ?AUTO_184 ?AUTO_180 ) ( CLEAR ?AUTO_184 ) ( HOLDING ?AUTO_185 ) )
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
      ?AUTO_189 - BLOCK
      ?AUTO_191 - BLOCK
      ?AUTO_192 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_186 ?AUTO_189 ) ( ON ?AUTO_191 ?AUTO_187 ) ( CLEAR ?AUTO_191 ) ( ON ?AUTO_192 ?AUTO_186 ) ( CLEAR ?AUTO_192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_192 ?AUTO_186 )
      ( MAKE-ON ?AUTO_186 ?AUTO_187 )
      ( MAKE-ON-VERIFY ?AUTO_186 ?AUTO_187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_207 - BLOCK
      ?AUTO_208 - BLOCK
    )
    :vars
    (
      ?AUTO_209 - BLOCK
      ?AUTO_212 - BLOCK
      ?AUTO_213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_208 ) ( ON ?AUTO_207 ?AUTO_209 ) ( CLEAR ?AUTO_207 ) ( HOLDING ?AUTO_212 ) ( CLEAR ?AUTO_213 ) )
    :subtasks
    ( ( !STACK ?AUTO_212 ?AUTO_213 )
      ( MAKE-ON ?AUTO_207 ?AUTO_208 )
      ( MAKE-ON-VERIFY ?AUTO_207 ?AUTO_208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_223 - BLOCK
      ?AUTO_224 - BLOCK
    )
    :vars
    (
      ?AUTO_226 - BLOCK
      ?AUTO_229 - BLOCK
      ?AUTO_225 - BLOCK
      ?AUTO_231 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_223 ?AUTO_226 ) ( CLEAR ?AUTO_223 ) ( ON ?AUTO_229 ?AUTO_224 ) ( CLEAR ?AUTO_229 ) ( HOLDING ?AUTO_225 ) ( CLEAR ?AUTO_231 ) )
    :subtasks
    ( ( !STACK ?AUTO_225 ?AUTO_231 )
      ( MAKE-ON ?AUTO_223 ?AUTO_224 )
      ( MAKE-ON-VERIFY ?AUTO_223 ?AUTO_224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_242 - BLOCK
      ?AUTO_243 - BLOCK
    )
    :vars
    (
      ?AUTO_244 - BLOCK
      ?AUTO_246 - BLOCK
      ?AUTO_249 - BLOCK
      ?AUTO_247 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_242 ?AUTO_244 ) ( ON ?AUTO_246 ?AUTO_243 ) ( CLEAR ?AUTO_246 ) ( ON ?AUTO_249 ?AUTO_242 ) ( CLEAR ?AUTO_249 ) ( HOLDING ?AUTO_247 ) )
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
      ?AUTO_255 - BLOCK
      ?AUTO_258 - BLOCK
      ?AUTO_253 - BLOCK
      ?AUTO_254 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_251 ?AUTO_255 ) ( ON ?AUTO_258 ?AUTO_252 ) ( CLEAR ?AUTO_258 ) ( ON ?AUTO_253 ?AUTO_251 ) ( ON ?AUTO_254 ?AUTO_253 ) ( CLEAR ?AUTO_254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_254 ?AUTO_253 )
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
      ?AUTO_266 - BLOCK
      ?AUTO_265 - BLOCK
      ?AUTO_268 - BLOCK
      ?AUTO_263 - BLOCK
      ?AUTO_269 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_261 ?AUTO_266 ) ( ON ?AUTO_265 ?AUTO_262 ) ( CLEAR ?AUTO_265 ) ( ON ?AUTO_268 ?AUTO_261 ) ( ON ?AUTO_263 ?AUTO_268 ) ( CLEAR ?AUTO_263 ) ( HOLDING ?AUTO_269 ) )
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
      ?AUTO_278 - BLOCK
      ?AUTO_277 - BLOCK
      ?AUTO_276 - BLOCK
      ?AUTO_272 - BLOCK
      ?AUTO_275 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_270 ?AUTO_278 ) ( ON ?AUTO_277 ?AUTO_271 ) ( ON ?AUTO_276 ?AUTO_270 ) ( ON ?AUTO_272 ?AUTO_276 ) ( CLEAR ?AUTO_272 ) ( ON ?AUTO_275 ?AUTO_277 ) ( CLEAR ?AUTO_275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_275 ?AUTO_277 )
      ( MAKE-ON ?AUTO_270 ?AUTO_271 )
      ( MAKE-ON-VERIFY ?AUTO_270 ?AUTO_271 ) )
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
      ?AUTO_353 - BLOCK
      ?AUTO_352 - BLOCK
      ?AUTO_354 - BLOCK
      ?AUTO_355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_349 ) ( ON-TABLE ?AUTO_348 ) ( CLEAR ?AUTO_353 ) ( ON ?AUTO_352 ?AUTO_348 ) ( CLEAR ?AUTO_352 ) ( HOLDING ?AUTO_354 ) ( CLEAR ?AUTO_355 ) )
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
      ?AUTO_375 - BLOCK
      ?AUTO_373 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_370 ) ( CLEAR ?AUTO_375 ) ( ON ?AUTO_373 ?AUTO_370 ) ( CLEAR ?AUTO_373 ) ( HOLDING ?AUTO_371 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_371 )
      ( MAKE-ON ?AUTO_370 ?AUTO_371 )
      ( MAKE-ON-VERIFY ?AUTO_370 ?AUTO_371 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_416 - BLOCK
    )
    :vars
    (
      ?AUTO_417 - BLOCK
      ?AUTO_419 - BLOCK
      ?AUTO_420 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_416 ?AUTO_417 ) ( CLEAR ?AUTO_416 ) ( HOLDING ?AUTO_419 ) ( CLEAR ?AUTO_420 ) )
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
      ?AUTO_422 - BLOCK
      ?AUTO_425 - BLOCK
      ?AUTO_424 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_421 ?AUTO_422 ) ( CLEAR ?AUTO_425 ) ( ON ?AUTO_424 ?AUTO_421 ) ( CLEAR ?AUTO_424 ) ( HAND-EMPTY ) )
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
      ?AUTO_429 - BLOCK
      ?AUTO_430 - BLOCK
      ?AUTO_432 - BLOCK
      ?AUTO_433 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_428 ?AUTO_429 ) ( CLEAR ?AUTO_430 ) ( ON ?AUTO_432 ?AUTO_428 ) ( CLEAR ?AUTO_432 ) ( HOLDING ?AUTO_433 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_433 )
      ( MAKE-ON-TABLE ?AUTO_428 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_428 ) )
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
      ?AUTO_1892 - BLOCK
      ?AUTO_1893 - BLOCK
    )
    :vars
    (
      ?AUTO_1895 - BLOCK
      ?AUTO_1896 - BLOCK
      ?AUTO_1898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1893 ) ( ON-TABLE ?AUTO_1892 ) ( ON ?AUTO_1895 ?AUTO_1892 ) ( ON ?AUTO_1896 ?AUTO_1895 ) ( CLEAR ?AUTO_1896 ) ( HOLDING ?AUTO_1898 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1898 )
      ( MAKE-ON ?AUTO_1892 ?AUTO_1893 )
      ( MAKE-ON-VERIFY ?AUTO_1892 ?AUTO_1893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_557 - BLOCK
      ?AUTO_558 - BLOCK
    )
    :vars
    (
      ?AUTO_562 - BLOCK
      ?AUTO_559 - BLOCK
      ?AUTO_563 - BLOCK
      ?AUTO_564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_557 ) ( CLEAR ?AUTO_557 ) ( CLEAR ?AUTO_562 ) ( ON ?AUTO_559 ?AUTO_558 ) ( CLEAR ?AUTO_559 ) ( HOLDING ?AUTO_563 ) ( CLEAR ?AUTO_564 ) )
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
      ?AUTO_579 - BLOCK
      ?AUTO_577 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_579 ) ( ON ?AUTO_577 ?AUTO_576 ) ( CLEAR ?AUTO_577 ) ( HOLDING ?AUTO_575 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_575 )
      ( MAKE-ON ?AUTO_575 ?AUTO_576 )
      ( MAKE-ON-VERIFY ?AUTO_575 ?AUTO_576 ) )
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
      ?AUTO_667 - BLOCK
    )
    :vars
    (
      ?AUTO_668 - BLOCK
      ?AUTO_670 - BLOCK
      ?AUTO_671 - BLOCK
      ?AUTO_673 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_667 ?AUTO_668 ) ( ON ?AUTO_670 ?AUTO_667 ) ( CLEAR ?AUTO_670 ) ( HOLDING ?AUTO_671 ) ( CLEAR ?AUTO_673 ) )
    :subtasks
    ( ( !STACK ?AUTO_671 ?AUTO_673 )
      ( MAKE-ON-TABLE ?AUTO_667 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_667 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_798 - BLOCK
    )
    :vars
    (
      ?AUTO_800 - BLOCK
      ?AUTO_804 - BLOCK
      ?AUTO_801 - BLOCK
      ?AUTO_803 - BLOCK
      ?AUTO_799 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_798 ?AUTO_800 ) ( CLEAR ?AUTO_804 ) ( ON ?AUTO_801 ?AUTO_798 ) ( CLEAR ?AUTO_803 ) ( ON ?AUTO_799 ?AUTO_801 ) ( CLEAR ?AUTO_799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_799 ?AUTO_801 )
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
      ?AUTO_808 - BLOCK
      ?AUTO_811 - BLOCK
      ?AUTO_813 - BLOCK
      ?AUTO_812 - BLOCK
      ?AUTO_810 - BLOCK
      ?AUTO_815 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_807 ?AUTO_808 ) ( CLEAR ?AUTO_811 ) ( ON ?AUTO_813 ?AUTO_807 ) ( ON ?AUTO_812 ?AUTO_813 ) ( CLEAR ?AUTO_812 ) ( HOLDING ?AUTO_810 ) ( CLEAR ?AUTO_815 ) )
    :subtasks
    ( ( !STACK ?AUTO_810 ?AUTO_815 )
      ( MAKE-ON-TABLE ?AUTO_807 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_807 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_868 - BLOCK
    )
    :vars
    (
      ?AUTO_874 - BLOCK
      ?AUTO_872 - BLOCK
      ?AUTO_869 - BLOCK
      ?AUTO_871 - BLOCK
      ?AUTO_870 - BLOCK
      ?AUTO_875 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_868 ?AUTO_874 ) ( ON ?AUTO_872 ?AUTO_868 ) ( CLEAR ?AUTO_869 ) ( ON ?AUTO_871 ?AUTO_872 ) ( CLEAR ?AUTO_870 ) ( ON ?AUTO_875 ?AUTO_871 ) ( CLEAR ?AUTO_875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_875 ?AUTO_871 )
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
      ?AUTO_883 - BLOCK
      ?AUTO_882 - BLOCK
      ?AUTO_884 - BLOCK
      ?AUTO_885 - BLOCK
      ?AUTO_881 - BLOCK
      ?AUTO_880 - BLOCK
      ?AUTO_887 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_878 ?AUTO_883 ) ( ON ?AUTO_882 ?AUTO_878 ) ( CLEAR ?AUTO_884 ) ( ON ?AUTO_885 ?AUTO_882 ) ( ON ?AUTO_881 ?AUTO_885 ) ( CLEAR ?AUTO_881 ) ( HOLDING ?AUTO_880 ) ( CLEAR ?AUTO_887 ) )
    :subtasks
    ( ( !STACK ?AUTO_880 ?AUTO_887 )
      ( MAKE-ON-TABLE ?AUTO_878 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_878 ) )
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
      ?AUTO_1213 - BLOCK
      ?AUTO_1214 - BLOCK
    )
    :vars
    (
      ?AUTO_1218 - BLOCK
      ?AUTO_1217 - BLOCK
      ?AUTO_1219 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1214 ) ( ON-TABLE ?AUTO_1213 ) ( CLEAR ?AUTO_1218 ) ( ON ?AUTO_1217 ?AUTO_1213 ) ( CLEAR ?AUTO_1217 ) ( HOLDING ?AUTO_1219 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1219 )
      ( MAKE-ON ?AUTO_1213 ?AUTO_1214 )
      ( MAKE-ON-VERIFY ?AUTO_1213 ?AUTO_1214 ) )
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
      ?AUTO_1233 - BLOCK
      ?AUTO_1236 - BLOCK
      ?AUTO_1237 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1230 ) ( ON-TABLE ?AUTO_1229 ) ( CLEAR ?AUTO_1231 ) ( ON ?AUTO_1234 ?AUTO_1229 ) ( ON ?AUTO_1233 ?AUTO_1234 ) ( CLEAR ?AUTO_1233 ) ( HOLDING ?AUTO_1236 ) ( CLEAR ?AUTO_1237 ) )
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
      ?AUTO_1244 - BLOCK
      ?AUTO_1246 - BLOCK
      ?AUTO_1245 - BLOCK
      ?AUTO_1240 - BLOCK
      ?AUTO_1241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1238 ) ( CLEAR ?AUTO_1244 ) ( ON ?AUTO_1246 ?AUTO_1238 ) ( ON ?AUTO_1245 ?AUTO_1246 ) ( CLEAR ?AUTO_1245 ) ( CLEAR ?AUTO_1240 ) ( ON ?AUTO_1241 ?AUTO_1239 ) ( CLEAR ?AUTO_1241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1241 ?AUTO_1239 )
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
      ?AUTO_1255 - BLOCK
      ?AUTO_1257 - BLOCK
      ?AUTO_1253 - BLOCK
      ?AUTO_1254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1249 ) ( CLEAR ?AUTO_1256 ) ( ON ?AUTO_1255 ?AUTO_1249 ) ( ON ?AUTO_1257 ?AUTO_1255 ) ( CLEAR ?AUTO_1257 ) ( ON ?AUTO_1253 ?AUTO_1250 ) ( CLEAR ?AUTO_1253 ) ( HOLDING ?AUTO_1254 ) )
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
      ?AUTO_1261 - BLOCK
      ?AUTO_1263 - BLOCK
      ?AUTO_1262 - BLOCK
      ?AUTO_1266 - BLOCK
      ?AUTO_1267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1259 ) ( CLEAR ?AUTO_1261 ) ( ON ?AUTO_1263 ?AUTO_1259 ) ( ON ?AUTO_1262 ?AUTO_1263 ) ( ON ?AUTO_1266 ?AUTO_1260 ) ( CLEAR ?AUTO_1266 ) ( ON ?AUTO_1267 ?AUTO_1262 ) ( CLEAR ?AUTO_1267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1267 ?AUTO_1262 )
      ( MAKE-ON ?AUTO_1259 ?AUTO_1260 )
      ( MAKE-ON-VERIFY ?AUTO_1259 ?AUTO_1260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1908 - BLOCK
      ?AUTO_1909 - BLOCK
    )
    :vars
    (
      ?AUTO_1911 - BLOCK
      ?AUTO_1913 - BLOCK
      ?AUTO_1912 - BLOCK
      ?AUTO_1915 - BLOCK
      ?AUTO_1916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1909 ) ( ON-TABLE ?AUTO_1908 ) ( ON ?AUTO_1911 ?AUTO_1908 ) ( ON ?AUTO_1913 ?AUTO_1911 ) ( ON ?AUTO_1912 ?AUTO_1913 ) ( CLEAR ?AUTO_1912 ) ( HOLDING ?AUTO_1915 ) ( CLEAR ?AUTO_1916 ) )
    :subtasks
    ( ( !STACK ?AUTO_1915 ?AUTO_1916 )
      ( MAKE-ON ?AUTO_1908 ?AUTO_1909 )
      ( MAKE-ON-VERIFY ?AUTO_1908 ?AUTO_1909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1281 - BLOCK
      ?AUTO_1282 - BLOCK
    )
    :vars
    (
      ?AUTO_1285 - BLOCK
      ?AUTO_1283 - BLOCK
      ?AUTO_1287 - BLOCK
      ?AUTO_1284 - BLOCK
      ?AUTO_1289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1281 ) ( CLEAR ?AUTO_1285 ) ( ON ?AUTO_1283 ?AUTO_1281 ) ( ON ?AUTO_1287 ?AUTO_1283 ) ( ON ?AUTO_1284 ?AUTO_1287 ) ( CLEAR ?AUTO_1282 ) ( ON ?AUTO_1289 ?AUTO_1284 ) ( CLEAR ?AUTO_1289 ) ( HAND-EMPTY ) )
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
      ?AUTO_1300 - BLOCK
      ?AUTO_1298 - BLOCK
      ?AUTO_1297 - BLOCK
      ?AUTO_1299 - BLOCK
      ?AUTO_1294 - BLOCK
      ?AUTO_1302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1292 ) ( CLEAR ?AUTO_1300 ) ( ON ?AUTO_1298 ?AUTO_1292 ) ( ON ?AUTO_1297 ?AUTO_1298 ) ( ON ?AUTO_1299 ?AUTO_1297 ) ( ON ?AUTO_1294 ?AUTO_1299 ) ( CLEAR ?AUTO_1294 ) ( HOLDING ?AUTO_1293 ) ( CLEAR ?AUTO_1302 ) )
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
      ?AUTO_1313 - BLOCK
      ?AUTO_1312 - BLOCK
      ?AUTO_1308 - BLOCK
      ?AUTO_1311 - BLOCK
      ?AUTO_1307 - BLOCK
      ?AUTO_1314 - BLOCK
      ?AUTO_1315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1305 ) ( CLEAR ?AUTO_1313 ) ( ON ?AUTO_1312 ?AUTO_1305 ) ( ON ?AUTO_1308 ?AUTO_1312 ) ( ON ?AUTO_1311 ?AUTO_1308 ) ( CLEAR ?AUTO_1306 ) ( ON ?AUTO_1307 ?AUTO_1311 ) ( CLEAR ?AUTO_1307 ) ( HOLDING ?AUTO_1314 ) ( CLEAR ?AUTO_1315 ) )
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
      ?AUTO_1323 - BLOCK
      ?AUTO_1324 - BLOCK
      ?AUTO_1322 - BLOCK
      ?AUTO_1327 - BLOCK
      ?AUTO_1328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1320 ) ( CLEAR ?AUTO_1323 ) ( ON ?AUTO_1324 ?AUTO_1320 ) ( ON ?AUTO_1322 ?AUTO_1324 ) ( ON ?AUTO_1327 ?AUTO_1322 ) ( CLEAR ?AUTO_1327 ) ( CLEAR ?AUTO_1321 ) ( ON-TABLE ?AUTO_1328 ) ( CLEAR ?AUTO_1328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1328 )
      ( MAKE-ON ?AUTO_1320 ?AUTO_1321 )
      ( MAKE-ON-VERIFY ?AUTO_1320 ?AUTO_1321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1899 - BLOCK
      ?AUTO_1900 - BLOCK
    )
    :vars
    (
      ?AUTO_1901 - BLOCK
      ?AUTO_1904 - BLOCK
      ?AUTO_1903 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1900 ) ( ON-TABLE ?AUTO_1899 ) ( ON ?AUTO_1901 ?AUTO_1899 ) ( ON ?AUTO_1904 ?AUTO_1901 ) ( ON ?AUTO_1903 ?AUTO_1904 ) ( CLEAR ?AUTO_1903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1903 ?AUTO_1904 )
      ( MAKE-ON ?AUTO_1899 ?AUTO_1900 )
      ( MAKE-ON-VERIFY ?AUTO_1899 ?AUTO_1900 ) )
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
      ?AUTO_1401 - BLOCK
      ?AUTO_1402 - BLOCK
      ?AUTO_1400 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1398 ?AUTO_1405 ) ( CLEAR ?AUTO_1398 ) ( CLEAR ?AUTO_1401 ) ( ON ?AUTO_1402 ?AUTO_1399 ) ( ON ?AUTO_1400 ?AUTO_1402 ) ( CLEAR ?AUTO_1400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1400 ?AUTO_1402 )
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
      ?AUTO_1411 - BLOCK
      ?AUTO_1415 - BLOCK
      ?AUTO_1412 - BLOCK
      ?AUTO_1413 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1411 ) ( ON ?AUTO_1415 ?AUTO_1409 ) ( ON ?AUTO_1412 ?AUTO_1415 ) ( CLEAR ?AUTO_1412 ) ( HOLDING ?AUTO_1408 ) ( CLEAR ?AUTO_1413 ) )
    :subtasks
    ( ( !STACK ?AUTO_1408 ?AUTO_1413 )
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
      ?AUTO_1426 - BLOCK
      ?AUTO_1427 - BLOCK
      ?AUTO_1423 - BLOCK
      ?AUTO_1428 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1420 ?AUTO_1422 ) ( CLEAR ?AUTO_1420 ) ( CLEAR ?AUTO_1426 ) ( ON ?AUTO_1427 ?AUTO_1421 ) ( ON ?AUTO_1423 ?AUTO_1427 ) ( CLEAR ?AUTO_1423 ) ( HOLDING ?AUTO_1428 ) )
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
      ?AUTO_1433 - BLOCK
      ?AUTO_1435 - BLOCK
      ?AUTO_1436 - BLOCK
      ?AUTO_1434 - BLOCK
      ?AUTO_1437 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1429 ?AUTO_1433 ) ( CLEAR ?AUTO_1429 ) ( CLEAR ?AUTO_1435 ) ( ON ?AUTO_1436 ?AUTO_1430 ) ( ON ?AUTO_1434 ?AUTO_1436 ) ( ON ?AUTO_1437 ?AUTO_1434 ) ( CLEAR ?AUTO_1437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1437 ?AUTO_1434 )
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
      ?AUTO_1443 - BLOCK
      ?AUTO_1447 - BLOCK
      ?AUTO_1444 - BLOCK
      ?AUTO_1448 - BLOCK
      ?AUTO_1446 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1443 ) ( ON ?AUTO_1447 ?AUTO_1441 ) ( ON ?AUTO_1444 ?AUTO_1447 ) ( ON ?AUTO_1448 ?AUTO_1444 ) ( CLEAR ?AUTO_1448 ) ( HOLDING ?AUTO_1440 ) ( CLEAR ?AUTO_1446 ) )
    :subtasks
    ( ( !STACK ?AUTO_1440 ?AUTO_1446 )
      ( MAKE-ON ?AUTO_1440 ?AUTO_1441 )
      ( MAKE-ON-VERIFY ?AUTO_1440 ?AUTO_1441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2398 - BLOCK
      ?AUTO_2399 - BLOCK
    )
    :vars
    (
      ?AUTO_2402 - BLOCK
      ?AUTO_2404 - BLOCK
      ?AUTO_2405 - BLOCK
      ?AUTO_2403 - BLOCK
      ?AUTO_2400 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2398 ?AUTO_2402 ) ( CLEAR ?AUTO_2398 ) ( ON ?AUTO_2404 ?AUTO_2399 ) ( ON ?AUTO_2405 ?AUTO_2404 ) ( ON ?AUTO_2403 ?AUTO_2405 ) ( ON ?AUTO_2400 ?AUTO_2403 ) ( CLEAR ?AUTO_2400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2400 ?AUTO_2403 )
      ( MAKE-ON ?AUTO_2398 ?AUTO_2399 )
      ( MAKE-ON-VERIFY ?AUTO_2398 ?AUTO_2399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1462 - BLOCK
      ?AUTO_1463 - BLOCK
    )
    :vars
    (
      ?AUTO_1469 - BLOCK
      ?AUTO_1468 - BLOCK
      ?AUTO_1470 - BLOCK
      ?AUTO_1466 - BLOCK
      ?AUTO_1467 - BLOCK
      ?AUTO_1472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1469 ) ( ON ?AUTO_1468 ?AUTO_1463 ) ( ON ?AUTO_1470 ?AUTO_1468 ) ( ON ?AUTO_1466 ?AUTO_1470 ) ( ON ?AUTO_1462 ?AUTO_1466 ) ( CLEAR ?AUTO_1462 ) ( HOLDING ?AUTO_1467 ) ( CLEAR ?AUTO_1472 ) )
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
      ?AUTO_1483 - BLOCK
      ?AUTO_1484 - BLOCK
      ?AUTO_1485 - BLOCK
      ?AUTO_1489 - BLOCK
      ?AUTO_1486 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1483 ) ( ON ?AUTO_1484 ?AUTO_1482 ) ( ON ?AUTO_1485 ?AUTO_1484 ) ( ON ?AUTO_1489 ?AUTO_1485 ) ( CLEAR ?AUTO_1489 ) ( CLEAR ?AUTO_1486 ) ( ON-TABLE ?AUTO_1481 ) ( CLEAR ?AUTO_1481 ) ( HAND-EMPTY ) )
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
      ?AUTO_1498 - BLOCK
      ?AUTO_1495 - BLOCK
      ?AUTO_1500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1499 ) ( ON ?AUTO_1497 ?AUTO_1492 ) ( ON ?AUTO_1496 ?AUTO_1497 ) ( ON ?AUTO_1498 ?AUTO_1496 ) ( CLEAR ?AUTO_1498 ) ( CLEAR ?AUTO_1495 ) ( ON-TABLE ?AUTO_1491 ) ( CLEAR ?AUTO_1491 ) ( HOLDING ?AUTO_1500 ) )
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
      ?AUTO_1507 - BLOCK
      ?AUTO_1505 - BLOCK
      ?AUTO_1509 - BLOCK
      ?AUTO_1506 - BLOCK
      ?AUTO_1503 - BLOCK
      ?AUTO_1510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1507 ) ( ON ?AUTO_1505 ?AUTO_1502 ) ( ON ?AUTO_1509 ?AUTO_1505 ) ( ON ?AUTO_1506 ?AUTO_1509 ) ( CLEAR ?AUTO_1506 ) ( CLEAR ?AUTO_1503 ) ( ON-TABLE ?AUTO_1501 ) ( ON ?AUTO_1510 ?AUTO_1501 ) ( CLEAR ?AUTO_1510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1510 ?AUTO_1501 )
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
      ?AUTO_1521 - BLOCK
      ?AUTO_1520 - BLOCK
      ?AUTO_1522 - BLOCK
      ?AUTO_1516 - BLOCK
      ?AUTO_1518 - BLOCK
      ?AUTO_1519 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1521 ) ( ON ?AUTO_1520 ?AUTO_1514 ) ( ON ?AUTO_1522 ?AUTO_1520 ) ( CLEAR ?AUTO_1516 ) ( ON-TABLE ?AUTO_1513 ) ( ON ?AUTO_1518 ?AUTO_1513 ) ( CLEAR ?AUTO_1518 ) ( HOLDING ?AUTO_1519 ) ( CLEAR ?AUTO_1522 ) )
    :subtasks
    ( ( !STACK ?AUTO_1519 ?AUTO_1522 )
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
      ?AUTO_1534 - BLOCK
      ?AUTO_1533 - BLOCK
      ?AUTO_1528 - BLOCK
      ?AUTO_1531 - BLOCK
      ?AUTO_1532 - BLOCK
      ?AUTO_1527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1534 ) ( ON ?AUTO_1533 ?AUTO_1526 ) ( ON ?AUTO_1528 ?AUTO_1533 ) ( CLEAR ?AUTO_1531 ) ( ON-TABLE ?AUTO_1525 ) ( ON ?AUTO_1532 ?AUTO_1525 ) ( CLEAR ?AUTO_1528 ) ( ON ?AUTO_1527 ?AUTO_1532 ) ( CLEAR ?AUTO_1527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1527 ?AUTO_1532 )
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
      ?AUTO_1542 - BLOCK
      ?AUTO_1544 - BLOCK
      ?AUTO_1541 - BLOCK
      ?AUTO_1545 - BLOCK
      ?AUTO_1546 - BLOCK
      ?AUTO_1543 - BLOCK
      ?AUTO_1547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1542 ) ( ON ?AUTO_1544 ?AUTO_1538 ) ( ON ?AUTO_1541 ?AUTO_1544 ) ( CLEAR ?AUTO_1545 ) ( ON-TABLE ?AUTO_1537 ) ( ON ?AUTO_1546 ?AUTO_1537 ) ( CLEAR ?AUTO_1541 ) ( ON ?AUTO_1543 ?AUTO_1546 ) ( CLEAR ?AUTO_1543 ) ( HOLDING ?AUTO_1547 ) )
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
      ?AUTO_1551 - BLOCK
      ?AUTO_1550 - BLOCK
      ?AUTO_1552 - BLOCK
      ?AUTO_1557 - BLOCK
      ?AUTO_1556 - BLOCK
      ?AUTO_1554 - BLOCK
      ?AUTO_1558 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1551 ) ( ON ?AUTO_1550 ?AUTO_1549 ) ( ON ?AUTO_1552 ?AUTO_1550 ) ( CLEAR ?AUTO_1557 ) ( ON-TABLE ?AUTO_1548 ) ( ON ?AUTO_1556 ?AUTO_1548 ) ( ON ?AUTO_1554 ?AUTO_1556 ) ( CLEAR ?AUTO_1554 ) ( ON ?AUTO_1558 ?AUTO_1552 ) ( CLEAR ?AUTO_1558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1558 ?AUTO_1552 )
      ( MAKE-ON ?AUTO_1548 ?AUTO_1549 )
      ( MAKE-ON-VERIFY ?AUTO_1548 ?AUTO_1549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1711 - BLOCK
      ?AUTO_1712 - BLOCK
    )
    :vars
    (
      ?AUTO_1713 - BLOCK
      ?AUTO_1715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1711 ) ( ON ?AUTO_1713 ?AUTO_1711 ) ( CLEAR ?AUTO_1713 ) ( ON ?AUTO_1715 ?AUTO_1712 ) ( CLEAR ?AUTO_1715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1715 ?AUTO_1712 )
      ( MAKE-ON ?AUTO_1711 ?AUTO_1712 )
      ( MAKE-ON-VERIFY ?AUTO_1711 ?AUTO_1712 ) )
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
      ?AUTO_1721 - BLOCK
      ?AUTO_1725 - BLOCK
      ?AUTO_1726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1719 ) ( ON ?AUTO_1723 ?AUTO_1719 ) ( CLEAR ?AUTO_1723 ) ( ON ?AUTO_1721 ?AUTO_1720 ) ( CLEAR ?AUTO_1721 ) ( HOLDING ?AUTO_1725 ) ( CLEAR ?AUTO_1726 ) )
    :subtasks
    ( ( !STACK ?AUTO_1725 ?AUTO_1726 )
      ( MAKE-ON ?AUTO_1719 ?AUTO_1720 )
      ( MAKE-ON-VERIFY ?AUTO_1719 ?AUTO_1720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1727 - BLOCK
      ?AUTO_1728 - BLOCK
    )
    :vars
    (
      ?AUTO_1729 - BLOCK
      ?AUTO_1733 - BLOCK
      ?AUTO_1730 - BLOCK
      ?AUTO_1731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1727 ) ( ON ?AUTO_1729 ?AUTO_1727 ) ( CLEAR ?AUTO_1729 ) ( ON ?AUTO_1733 ?AUTO_1728 ) ( CLEAR ?AUTO_1730 ) ( ON ?AUTO_1731 ?AUTO_1733 ) ( CLEAR ?AUTO_1731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1731 ?AUTO_1733 )
      ( MAKE-ON ?AUTO_1727 ?AUTO_1728 )
      ( MAKE-ON-VERIFY ?AUTO_1727 ?AUTO_1728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1737 - BLOCK
      ?AUTO_1738 - BLOCK
    )
    :vars
    (
      ?AUTO_1739 - BLOCK
      ?AUTO_1741 - BLOCK
      ?AUTO_1740 - BLOCK
      ?AUTO_1742 - BLOCK
      ?AUTO_1745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1737 ) ( ON ?AUTO_1739 ?AUTO_1737 ) ( CLEAR ?AUTO_1739 ) ( ON ?AUTO_1741 ?AUTO_1738 ) ( CLEAR ?AUTO_1740 ) ( ON ?AUTO_1742 ?AUTO_1741 ) ( CLEAR ?AUTO_1742 ) ( HOLDING ?AUTO_1745 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1745 )
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
      ?AUTO_1748 - BLOCK
      ?AUTO_1752 - BLOCK
      ?AUTO_1749 - BLOCK
      ?AUTO_1753 - BLOCK
      ?AUTO_1754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1746 ) ( ON ?AUTO_1748 ?AUTO_1746 ) ( CLEAR ?AUTO_1748 ) ( ON ?AUTO_1752 ?AUTO_1747 ) ( CLEAR ?AUTO_1749 ) ( ON ?AUTO_1753 ?AUTO_1752 ) ( ON ?AUTO_1754 ?AUTO_1753 ) ( CLEAR ?AUTO_1754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1754 ?AUTO_1753 )
      ( MAKE-ON ?AUTO_1746 ?AUTO_1747 )
      ( MAKE-ON-VERIFY ?AUTO_1746 ?AUTO_1747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6711 - BLOCK
      ?AUTO_6712 - BLOCK
    )
    :vars
    (
      ?AUTO_6716 - BLOCK
      ?AUTO_6718 - BLOCK
      ?AUTO_6713 - BLOCK
      ?AUTO_6715 - BLOCK
      ?AUTO_6720 - BLOCK
      ?AUTO_6717 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6711 ?AUTO_6716 ) ( ON ?AUTO_6718 ?AUTO_6712 ) ( ON ?AUTO_6713 ?AUTO_6718 ) ( CLEAR ?AUTO_6715 ) ( ON ?AUTO_6720 ?AUTO_6711 ) ( CLEAR ?AUTO_6720 ) ( ON ?AUTO_6717 ?AUTO_6713 ) ( CLEAR ?AUTO_6717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6717 ?AUTO_6713 )
      ( MAKE-ON ?AUTO_6711 ?AUTO_6712 )
      ( MAKE-ON-VERIFY ?AUTO_6711 ?AUTO_6712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1990 - BLOCK
      ?AUTO_1991 - BLOCK
    )
    :vars
    (
      ?AUTO_1994 - BLOCK
      ?AUTO_1995 - BLOCK
      ?AUTO_1996 - BLOCK
      ?AUTO_1997 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1994 ?AUTO_1991 ) ( ON ?AUTO_1990 ?AUTO_1994 ) ( ON ?AUTO_1995 ?AUTO_1990 ) ( CLEAR ?AUTO_1995 ) ( HOLDING ?AUTO_1996 ) ( CLEAR ?AUTO_1997 ) )
    :subtasks
    ( ( !STACK ?AUTO_1996 ?AUTO_1997 )
      ( MAKE-ON ?AUTO_1990 ?AUTO_1991 )
      ( MAKE-ON-VERIFY ?AUTO_1990 ?AUTO_1991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2204 - BLOCK
      ?AUTO_2205 - BLOCK
    )
    :vars
    (
      ?AUTO_2209 - BLOCK
      ?AUTO_2207 - BLOCK
      ?AUTO_2211 - BLOCK
      ?AUTO_2208 - BLOCK
      ?AUTO_2212 - BLOCK
      ?AUTO_2213 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2204 ?AUTO_2209 ) ( CLEAR ?AUTO_2204 ) ( CLEAR ?AUTO_2207 ) ( ON ?AUTO_2211 ?AUTO_2205 ) ( ON ?AUTO_2208 ?AUTO_2211 ) ( CLEAR ?AUTO_2208 ) ( HOLDING ?AUTO_2212 ) ( CLEAR ?AUTO_2213 ) )
    :subtasks
    ( ( !STACK ?AUTO_2212 ?AUTO_2213 )
      ( MAKE-ON ?AUTO_2204 ?AUTO_2205 )
      ( MAKE-ON-VERIFY ?AUTO_2204 ?AUTO_2205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2293 - BLOCK
      ?AUTO_2294 - BLOCK
    )
    :vars
    (
      ?AUTO_2297 - BLOCK
      ?AUTO_2295 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2293 ?AUTO_2297 ) ( ON ?AUTO_2295 ?AUTO_2293 ) ( CLEAR ?AUTO_2295 ) ( HOLDING ?AUTO_2294 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2294 )
      ( MAKE-ON ?AUTO_2293 ?AUTO_2294 )
      ( MAKE-ON-VERIFY ?AUTO_2293 ?AUTO_2294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2463 - BLOCK
      ?AUTO_2464 - BLOCK
    )
    :vars
    (
      ?AUTO_2465 - BLOCK
      ?AUTO_2466 - BLOCK
      ?AUTO_2468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2464 ) ( ON ?AUTO_2463 ?AUTO_2465 ) ( ON ?AUTO_2466 ?AUTO_2463 ) ( ON ?AUTO_2468 ?AUTO_2466 ) ( CLEAR ?AUTO_2468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2468 ?AUTO_2466 )
      ( MAKE-ON ?AUTO_2463 ?AUTO_2464 )
      ( MAKE-ON-VERIFY ?AUTO_2463 ?AUTO_2464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2834 - BLOCK
      ?AUTO_2835 - BLOCK
    )
    :vars
    (
      ?AUTO_2837 - BLOCK
      ?AUTO_2841 - BLOCK
      ?AUTO_2839 - BLOCK
      ?AUTO_2836 - BLOCK
      ?AUTO_2842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2835 ) ( ON ?AUTO_2834 ?AUTO_2837 ) ( CLEAR ?AUTO_2841 ) ( ON ?AUTO_2839 ?AUTO_2834 ) ( ON ?AUTO_2836 ?AUTO_2839 ) ( CLEAR ?AUTO_2836 ) ( HOLDING ?AUTO_2842 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2842 )
      ( MAKE-ON ?AUTO_2834 ?AUTO_2835 )
      ( MAKE-ON-VERIFY ?AUTO_2834 ?AUTO_2835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2864 - BLOCK
      ?AUTO_2865 - BLOCK
    )
    :vars
    (
      ?AUTO_2872 - BLOCK
      ?AUTO_2866 - BLOCK
      ?AUTO_2871 - BLOCK
      ?AUTO_2869 - BLOCK
      ?AUTO_2873 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2864 ?AUTO_2872 ) ( ON ?AUTO_2866 ?AUTO_2864 ) ( ON ?AUTO_2871 ?AUTO_2866 ) ( ON ?AUTO_2869 ?AUTO_2865 ) ( CLEAR ?AUTO_2869 ) ( ON ?AUTO_2873 ?AUTO_2871 ) ( CLEAR ?AUTO_2873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2873 ?AUTO_2871 )
      ( MAKE-ON ?AUTO_2864 ?AUTO_2865 )
      ( MAKE-ON-VERIFY ?AUTO_2864 ?AUTO_2865 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2389 - BLOCK
      ?AUTO_2390 - BLOCK
    )
    :vars
    (
      ?AUTO_2396 - BLOCK
      ?AUTO_2394 - BLOCK
      ?AUTO_2393 - BLOCK
      ?AUTO_2395 - BLOCK
      ?AUTO_2397 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2389 ?AUTO_2396 ) ( CLEAR ?AUTO_2389 ) ( ON ?AUTO_2394 ?AUTO_2390 ) ( ON ?AUTO_2393 ?AUTO_2394 ) ( ON ?AUTO_2395 ?AUTO_2393 ) ( CLEAR ?AUTO_2395 ) ( HOLDING ?AUTO_2397 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2397 )
      ( MAKE-ON ?AUTO_2389 ?AUTO_2390 )
      ( MAKE-ON-VERIFY ?AUTO_2389 ?AUTO_2390 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2505 - BLOCK
    )
    :vars
    (
      ?AUTO_2509 - BLOCK
      ?AUTO_2510 - BLOCK
      ?AUTO_2507 - BLOCK
      ?AUTO_2506 - BLOCK
      ?AUTO_2511 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2505 ?AUTO_2509 ) ( CLEAR ?AUTO_2510 ) ( ON ?AUTO_2507 ?AUTO_2505 ) ( ON ?AUTO_2506 ?AUTO_2507 ) ( CLEAR ?AUTO_2506 ) ( HOLDING ?AUTO_2511 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2511 )
      ( MAKE-ON-TABLE ?AUTO_2505 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2648 - BLOCK
      ?AUTO_2649 - BLOCK
    )
    :vars
    (
      ?AUTO_2652 - BLOCK
      ?AUTO_2650 - BLOCK
      ?AUTO_2654 - BLOCK
      ?AUTO_2655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2648 ) ( ON ?AUTO_2652 ?AUTO_2648 ) ( CLEAR ?AUTO_2650 ) ( ON ?AUTO_2654 ?AUTO_2652 ) ( ON ?AUTO_2649 ?AUTO_2654 ) ( CLEAR ?AUTO_2649 ) ( HOLDING ?AUTO_2655 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2655 )
      ( MAKE-ON ?AUTO_2648 ?AUTO_2649 )
      ( MAKE-ON-VERIFY ?AUTO_2648 ?AUTO_2649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2656 - BLOCK
      ?AUTO_2657 - BLOCK
    )
    :vars
    (
      ?AUTO_2658 - BLOCK
      ?AUTO_2660 - BLOCK
      ?AUTO_2659 - BLOCK
      ?AUTO_2663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2656 ) ( ON ?AUTO_2658 ?AUTO_2656 ) ( CLEAR ?AUTO_2660 ) ( ON ?AUTO_2659 ?AUTO_2658 ) ( ON ?AUTO_2657 ?AUTO_2659 ) ( ON ?AUTO_2663 ?AUTO_2657 ) ( CLEAR ?AUTO_2663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2663 ?AUTO_2657 )
      ( MAKE-ON ?AUTO_2656 ?AUTO_2657 )
      ( MAKE-ON-VERIFY ?AUTO_2656 ?AUTO_2657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2823 - BLOCK
      ?AUTO_2824 - BLOCK
    )
    :vars
    (
      ?AUTO_2827 - BLOCK
      ?AUTO_2826 - BLOCK
      ?AUTO_2828 - BLOCK
      ?AUTO_2825 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2823 ?AUTO_2827 ) ( CLEAR ?AUTO_2826 ) ( ON ?AUTO_2828 ?AUTO_2823 ) ( ON ?AUTO_2825 ?AUTO_2828 ) ( CLEAR ?AUTO_2825 ) ( HOLDING ?AUTO_2824 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2824 )
      ( MAKE-ON ?AUTO_2823 ?AUTO_2824 )
      ( MAKE-ON-VERIFY ?AUTO_2823 ?AUTO_2824 ) )
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
      ?AUTO_2849 - BLOCK
      ?AUTO_2850 - BLOCK
      ?AUTO_2848 - BLOCK
      ?AUTO_2851 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2843 ?AUTO_2847 ) ( CLEAR ?AUTO_2849 ) ( ON ?AUTO_2850 ?AUTO_2843 ) ( ON ?AUTO_2848 ?AUTO_2850 ) ( CLEAR ?AUTO_2848 ) ( ON ?AUTO_2851 ?AUTO_2844 ) ( CLEAR ?AUTO_2851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2851 ?AUTO_2844 )
      ( MAKE-ON ?AUTO_2843 ?AUTO_2844 )
      ( MAKE-ON-VERIFY ?AUTO_2843 ?AUTO_2844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2909 - BLOCK
      ?AUTO_2910 - BLOCK
    )
    :vars
    (
      ?AUTO_2914 - BLOCK
      ?AUTO_2912 - BLOCK
      ?AUTO_2915 - BLOCK
      ?AUTO_2916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2909 ) ( CLEAR ?AUTO_2909 ) ( CLEAR ?AUTO_2914 ) ( ON ?AUTO_2912 ?AUTO_2910 ) ( CLEAR ?AUTO_2915 ) ( ON ?AUTO_2916 ?AUTO_2912 ) ( CLEAR ?AUTO_2916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2916 ?AUTO_2912 )
      ( MAKE-ON ?AUTO_2909 ?AUTO_2910 )
      ( MAKE-ON-VERIFY ?AUTO_2909 ?AUTO_2910 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2919 - BLOCK
      ?AUTO_2920 - BLOCK
    )
    :vars
    (
      ?AUTO_2926 - BLOCK
      ?AUTO_2922 - BLOCK
      ?AUTO_2923 - BLOCK
      ?AUTO_2925 - BLOCK
      ?AUTO_2927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2919 ) ( CLEAR ?AUTO_2919 ) ( CLEAR ?AUTO_2926 ) ( ON ?AUTO_2922 ?AUTO_2920 ) ( CLEAR ?AUTO_2923 ) ( ON ?AUTO_2925 ?AUTO_2922 ) ( CLEAR ?AUTO_2925 ) ( HOLDING ?AUTO_2927 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2927 )
      ( MAKE-ON ?AUTO_2919 ?AUTO_2920 )
      ( MAKE-ON-VERIFY ?AUTO_2919 ?AUTO_2920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2928 - BLOCK
      ?AUTO_2929 - BLOCK
    )
    :vars
    (
      ?AUTO_2930 - BLOCK
      ?AUTO_2931 - BLOCK
      ?AUTO_2935 - BLOCK
      ?AUTO_2934 - BLOCK
      ?AUTO_2936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2928 ) ( CLEAR ?AUTO_2928 ) ( CLEAR ?AUTO_2930 ) ( ON ?AUTO_2931 ?AUTO_2929 ) ( CLEAR ?AUTO_2935 ) ( ON ?AUTO_2934 ?AUTO_2931 ) ( ON ?AUTO_2936 ?AUTO_2934 ) ( CLEAR ?AUTO_2936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2936 ?AUTO_2934 )
      ( MAKE-ON ?AUTO_2928 ?AUTO_2929 )
      ( MAKE-ON-VERIFY ?AUTO_2928 ?AUTO_2929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2960 - BLOCK
      ?AUTO_2961 - BLOCK
    )
    :vars
    (
      ?AUTO_2965 - BLOCK
      ?AUTO_2967 - BLOCK
      ?AUTO_2966 - BLOCK
      ?AUTO_2968 - BLOCK
      ?AUTO_2963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2960 ) ( ON ?AUTO_2965 ?AUTO_2961 ) ( ON ?AUTO_2967 ?AUTO_2965 ) ( ON ?AUTO_2966 ?AUTO_2967 ) ( CLEAR ?AUTO_2966 ) ( ON ?AUTO_2968 ?AUTO_2960 ) ( CLEAR ?AUTO_2968 ) ( HOLDING ?AUTO_2963 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2963 )
      ( MAKE-ON ?AUTO_2960 ?AUTO_2961 )
      ( MAKE-ON-VERIFY ?AUTO_2960 ?AUTO_2961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2970 - BLOCK
      ?AUTO_2971 - BLOCK
    )
    :vars
    (
      ?AUTO_2975 - BLOCK
      ?AUTO_2972 - BLOCK
      ?AUTO_2976 - BLOCK
      ?AUTO_2973 - BLOCK
      ?AUTO_2974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2970 ) ( ON ?AUTO_2975 ?AUTO_2971 ) ( ON ?AUTO_2972 ?AUTO_2975 ) ( ON ?AUTO_2976 ?AUTO_2972 ) ( CLEAR ?AUTO_2976 ) ( ON ?AUTO_2973 ?AUTO_2970 ) ( ON ?AUTO_2974 ?AUTO_2973 ) ( CLEAR ?AUTO_2974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2974 ?AUTO_2973 )
      ( MAKE-ON ?AUTO_2970 ?AUTO_2971 )
      ( MAKE-ON-VERIFY ?AUTO_2970 ?AUTO_2971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2981 - BLOCK
      ?AUTO_2982 - BLOCK
    )
    :vars
    (
      ?AUTO_2985 - BLOCK
      ?AUTO_2984 - BLOCK
      ?AUTO_2989 - BLOCK
      ?AUTO_2983 - BLOCK
      ?AUTO_2986 - BLOCK
      ?AUTO_2990 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2981 ) ( ON ?AUTO_2985 ?AUTO_2982 ) ( ON ?AUTO_2984 ?AUTO_2985 ) ( ON ?AUTO_2989 ?AUTO_2984 ) ( CLEAR ?AUTO_2989 ) ( ON ?AUTO_2983 ?AUTO_2981 ) ( ON ?AUTO_2986 ?AUTO_2983 ) ( CLEAR ?AUTO_2986 ) ( HOLDING ?AUTO_2990 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2990 )
      ( MAKE-ON ?AUTO_2981 ?AUTO_2982 )
      ( MAKE-ON-VERIFY ?AUTO_2981 ?AUTO_2982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2991 - BLOCK
      ?AUTO_2992 - BLOCK
    )
    :vars
    (
      ?AUTO_2995 - BLOCK
      ?AUTO_2993 - BLOCK
      ?AUTO_2998 - BLOCK
      ?AUTO_2994 - BLOCK
      ?AUTO_2999 - BLOCK
      ?AUTO_3000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2991 ) ( ON ?AUTO_2995 ?AUTO_2992 ) ( ON ?AUTO_2993 ?AUTO_2995 ) ( ON ?AUTO_2998 ?AUTO_2993 ) ( ON ?AUTO_2994 ?AUTO_2991 ) ( ON ?AUTO_2999 ?AUTO_2994 ) ( CLEAR ?AUTO_2999 ) ( ON ?AUTO_3000 ?AUTO_2998 ) ( CLEAR ?AUTO_3000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3000 ?AUTO_2998 )
      ( MAKE-ON ?AUTO_2991 ?AUTO_2992 )
      ( MAKE-ON-VERIFY ?AUTO_2991 ?AUTO_2992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3099 - BLOCK
      ?AUTO_3100 - BLOCK
    )
    :vars
    (
      ?AUTO_3106 - BLOCK
      ?AUTO_3102 - BLOCK
      ?AUTO_3103 - BLOCK
      ?AUTO_3101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3106 ) ( ON ?AUTO_3102 ?AUTO_3100 ) ( CLEAR ?AUTO_3103 ) ( ON ?AUTO_3101 ?AUTO_3102 ) ( CLEAR ?AUTO_3101 ) ( HOLDING ?AUTO_3099 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3099 )
      ( MAKE-ON ?AUTO_3099 ?AUTO_3100 )
      ( MAKE-ON-VERIFY ?AUTO_3099 ?AUTO_3100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3108 - BLOCK
      ?AUTO_3109 - BLOCK
    )
    :vars
    (
      ?AUTO_3111 - BLOCK
      ?AUTO_3113 - BLOCK
      ?AUTO_3114 - BLOCK
      ?AUTO_3112 - BLOCK
      ?AUTO_3117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3111 ) ( ON ?AUTO_3113 ?AUTO_3109 ) ( CLEAR ?AUTO_3114 ) ( ON ?AUTO_3112 ?AUTO_3113 ) ( CLEAR ?AUTO_3112 ) ( ON ?AUTO_3108 ?AUTO_3117 ) ( CLEAR ?AUTO_3108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3108 ?AUTO_3117 )
      ( MAKE-ON ?AUTO_3108 ?AUTO_3109 )
      ( MAKE-ON-VERIFY ?AUTO_3108 ?AUTO_3109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7456 - BLOCK
      ?AUTO_7457 - BLOCK
    )
    :vars
    (
      ?AUTO_7458 - BLOCK
      ?AUTO_7461 - BLOCK
      ?AUTO_7465 - BLOCK
      ?AUTO_7459 - BLOCK
      ?AUTO_7463 - BLOCK
      ?AUTO_7466 - BLOCK
      ?AUTO_7464 - BLOCK
      ?AUTO_7467 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7456 ?AUTO_7458 ) ( CLEAR ?AUTO_7461 ) ( ON ?AUTO_7465 ?AUTO_7456 ) ( CLEAR ?AUTO_7465 ) ( ON ?AUTO_7459 ?AUTO_7457 ) ( CLEAR ?AUTO_7463 ) ( ON ?AUTO_7466 ?AUTO_7459 ) ( ON ?AUTO_7464 ?AUTO_7466 ) ( CLEAR ?AUTO_7464 ) ( HOLDING ?AUTO_7467 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7467 )
      ( MAKE-ON ?AUTO_7456 ?AUTO_7457 )
      ( MAKE-ON-VERIFY ?AUTO_7456 ?AUTO_7457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3460 - BLOCK
      ?AUTO_3461 - BLOCK
    )
    :vars
    (
      ?AUTO_3462 - BLOCK
      ?AUTO_3463 - BLOCK
      ?AUTO_3466 - BLOCK
      ?AUTO_3468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3461 ) ( ON ?AUTO_3460 ?AUTO_3462 ) ( ON ?AUTO_3463 ?AUTO_3460 ) ( CLEAR ?AUTO_3463 ) ( HOLDING ?AUTO_3466 ) ( CLEAR ?AUTO_3468 ) )
    :subtasks
    ( ( !STACK ?AUTO_3466 ?AUTO_3468 )
      ( MAKE-ON ?AUTO_3460 ?AUTO_3461 )
      ( MAKE-ON-VERIFY ?AUTO_3460 ?AUTO_3461 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3483 - BLOCK
      ?AUTO_3484 - BLOCK
    )
    :vars
    (
      ?AUTO_3487 - BLOCK
      ?AUTO_3486 - BLOCK
      ?AUTO_3490 - BLOCK
      ?AUTO_3488 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3483 ?AUTO_3487 ) ( ON ?AUTO_3486 ?AUTO_3483 ) ( CLEAR ?AUTO_3486 ) ( CLEAR ?AUTO_3490 ) ( ON ?AUTO_3488 ?AUTO_3484 ) ( CLEAR ?AUTO_3488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3488 ?AUTO_3484 )
      ( MAKE-ON ?AUTO_3483 ?AUTO_3484 )
      ( MAKE-ON-VERIFY ?AUTO_3483 ?AUTO_3484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3522 - BLOCK
      ?AUTO_3523 - BLOCK
    )
    :vars
    (
      ?AUTO_3530 - BLOCK
      ?AUTO_3527 - BLOCK
      ?AUTO_3525 - BLOCK
      ?AUTO_3529 - BLOCK
      ?AUTO_3524 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3522 ?AUTO_3530 ) ( CLEAR ?AUTO_3527 ) ( ON ?AUTO_3525 ?AUTO_3523 ) ( ON ?AUTO_3529 ?AUTO_3525 ) ( CLEAR ?AUTO_3529 ) ( ON ?AUTO_3524 ?AUTO_3522 ) ( CLEAR ?AUTO_3524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3524 ?AUTO_3522 )
      ( MAKE-ON ?AUTO_3522 ?AUTO_3523 )
      ( MAKE-ON-VERIFY ?AUTO_3522 ?AUTO_3523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3533 - BLOCK
      ?AUTO_3534 - BLOCK
    )
    :vars
    (
      ?AUTO_3539 - BLOCK
      ?AUTO_3537 - BLOCK
      ?AUTO_3540 - BLOCK
      ?AUTO_3541 - BLOCK
      ?AUTO_3535 - BLOCK
      ?AUTO_3542 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3533 ?AUTO_3539 ) ( CLEAR ?AUTO_3537 ) ( ON ?AUTO_3540 ?AUTO_3534 ) ( ON ?AUTO_3541 ?AUTO_3540 ) ( CLEAR ?AUTO_3541 ) ( ON ?AUTO_3535 ?AUTO_3533 ) ( CLEAR ?AUTO_3535 ) ( HOLDING ?AUTO_3542 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3542 )
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
      ?AUTO_3548 - BLOCK
      ?AUTO_3547 - BLOCK
      ?AUTO_3546 - BLOCK
      ?AUTO_3549 - BLOCK
      ?AUTO_3550 - BLOCK
      ?AUTO_3545 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3543 ?AUTO_3548 ) ( CLEAR ?AUTO_3547 ) ( ON ?AUTO_3546 ?AUTO_3544 ) ( ON ?AUTO_3549 ?AUTO_3546 ) ( CLEAR ?AUTO_3549 ) ( ON ?AUTO_3550 ?AUTO_3543 ) ( ON ?AUTO_3545 ?AUTO_3550 ) ( CLEAR ?AUTO_3545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3545 ?AUTO_3550 )
      ( MAKE-ON ?AUTO_3543 ?AUTO_3544 )
      ( MAKE-ON-VERIFY ?AUTO_3543 ?AUTO_3544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3555 - BLOCK
      ?AUTO_3556 - BLOCK
    )
    :vars
    (
      ?AUTO_3559 - BLOCK
      ?AUTO_3561 - BLOCK
      ?AUTO_3560 - BLOCK
      ?AUTO_3564 - BLOCK
      ?AUTO_3563 - BLOCK
      ?AUTO_3558 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3555 ?AUTO_3559 ) ( ON ?AUTO_3561 ?AUTO_3556 ) ( ON ?AUTO_3560 ?AUTO_3561 ) ( CLEAR ?AUTO_3560 ) ( ON ?AUTO_3564 ?AUTO_3555 ) ( ON ?AUTO_3563 ?AUTO_3564 ) ( CLEAR ?AUTO_3563 ) ( HOLDING ?AUTO_3558 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3558 )
      ( MAKE-ON ?AUTO_3555 ?AUTO_3556 )
      ( MAKE-ON-VERIFY ?AUTO_3555 ?AUTO_3556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3566 - BLOCK
      ?AUTO_3567 - BLOCK
    )
    :vars
    (
      ?AUTO_3574 - BLOCK
      ?AUTO_3569 - BLOCK
      ?AUTO_3573 - BLOCK
      ?AUTO_3575 - BLOCK
      ?AUTO_3571 - BLOCK
      ?AUTO_3568 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3566 ?AUTO_3574 ) ( ON ?AUTO_3569 ?AUTO_3567 ) ( ON ?AUTO_3573 ?AUTO_3569 ) ( CLEAR ?AUTO_3573 ) ( ON ?AUTO_3575 ?AUTO_3566 ) ( ON ?AUTO_3571 ?AUTO_3575 ) ( ON ?AUTO_3568 ?AUTO_3571 ) ( CLEAR ?AUTO_3568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3568 ?AUTO_3571 )
      ( MAKE-ON ?AUTO_3566 ?AUTO_3567 )
      ( MAKE-ON-VERIFY ?AUTO_3566 ?AUTO_3567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3606 - BLOCK
      ?AUTO_3607 - BLOCK
    )
    :vars
    (
      ?AUTO_3612 - BLOCK
      ?AUTO_3609 - BLOCK
      ?AUTO_3608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3612 ) ( ON ?AUTO_3609 ?AUTO_3607 ) ( CLEAR ?AUTO_3609 ) ( HOLDING ?AUTO_3606 ) ( CLEAR ?AUTO_3608 ) )
    :subtasks
    ( ( !STACK ?AUTO_3606 ?AUTO_3608 )
      ( MAKE-ON ?AUTO_3606 ?AUTO_3607 )
      ( MAKE-ON-VERIFY ?AUTO_3606 ?AUTO_3607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3783 - BLOCK
      ?AUTO_3784 - BLOCK
    )
    :vars
    (
      ?AUTO_3785 - BLOCK
      ?AUTO_3787 - BLOCK
      ?AUTO_3790 - BLOCK
      ?AUTO_3788 - BLOCK
      ?AUTO_3792 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3783 ?AUTO_3785 ) ( ON ?AUTO_3787 ?AUTO_3783 ) ( CLEAR ?AUTO_3790 ) ( ON ?AUTO_3788 ?AUTO_3787 ) ( CLEAR ?AUTO_3788 ) ( HOLDING ?AUTO_3784 ) ( CLEAR ?AUTO_3792 ) )
    :subtasks
    ( ( !STACK ?AUTO_3784 ?AUTO_3792 )
      ( MAKE-ON ?AUTO_3783 ?AUTO_3784 )
      ( MAKE-ON-VERIFY ?AUTO_3783 ?AUTO_3784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4284 - BLOCK
      ?AUTO_4285 - BLOCK
    )
    :vars
    (
      ?AUTO_4289 - BLOCK
      ?AUTO_4287 - BLOCK
      ?AUTO_4290 - BLOCK
      ?AUTO_4291 - BLOCK
      ?AUTO_4292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4285 ) ( ON ?AUTO_4284 ?AUTO_4289 ) ( ON ?AUTO_4287 ?AUTO_4284 ) ( ON ?AUTO_4290 ?AUTO_4287 ) ( CLEAR ?AUTO_4290 ) ( HOLDING ?AUTO_4291 ) ( CLEAR ?AUTO_4292 ) )
    :subtasks
    ( ( !STACK ?AUTO_4291 ?AUTO_4292 )
      ( MAKE-ON ?AUTO_4284 ?AUTO_4285 )
      ( MAKE-ON-VERIFY ?AUTO_4284 ?AUTO_4285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3854 - BLOCK
      ?AUTO_3855 - BLOCK
    )
    :vars
    (
      ?AUTO_3861 - BLOCK
      ?AUTO_3859 - BLOCK
      ?AUTO_3857 - BLOCK
      ?AUTO_3860 - BLOCK
      ?AUTO_3856 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3854 ?AUTO_3861 ) ( ON ?AUTO_3859 ?AUTO_3854 ) ( CLEAR ?AUTO_3857 ) ( ON ?AUTO_3860 ?AUTO_3859 ) ( CLEAR ?AUTO_3855 ) ( ON ?AUTO_3856 ?AUTO_3860 ) ( CLEAR ?AUTO_3856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3856 ?AUTO_3860 )
      ( MAKE-ON ?AUTO_3854 ?AUTO_3855 )
      ( MAKE-ON-VERIFY ?AUTO_3854 ?AUTO_3855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3865 - BLOCK
      ?AUTO_3866 - BLOCK
    )
    :vars
    (
      ?AUTO_3867 - BLOCK
      ?AUTO_3871 - BLOCK
      ?AUTO_3870 - BLOCK
      ?AUTO_3873 - BLOCK
      ?AUTO_3872 - BLOCK
      ?AUTO_3874 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3865 ?AUTO_3867 ) ( ON ?AUTO_3871 ?AUTO_3865 ) ( CLEAR ?AUTO_3870 ) ( ON ?AUTO_3873 ?AUTO_3871 ) ( CLEAR ?AUTO_3866 ) ( ON ?AUTO_3872 ?AUTO_3873 ) ( CLEAR ?AUTO_3872 ) ( HOLDING ?AUTO_3874 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3874 )
      ( MAKE-ON ?AUTO_3865 ?AUTO_3866 )
      ( MAKE-ON-VERIFY ?AUTO_3865 ?AUTO_3866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3875 - BLOCK
      ?AUTO_3876 - BLOCK
    )
    :vars
    (
      ?AUTO_3881 - BLOCK
      ?AUTO_3880 - BLOCK
      ?AUTO_3877 - BLOCK
      ?AUTO_3882 - BLOCK
      ?AUTO_3883 - BLOCK
      ?AUTO_3884 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3875 ?AUTO_3881 ) ( ON ?AUTO_3880 ?AUTO_3875 ) ( CLEAR ?AUTO_3877 ) ( ON ?AUTO_3882 ?AUTO_3880 ) ( ON ?AUTO_3883 ?AUTO_3882 ) ( CLEAR ?AUTO_3883 ) ( ON ?AUTO_3884 ?AUTO_3876 ) ( CLEAR ?AUTO_3884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3884 ?AUTO_3876 )
      ( MAKE-ON ?AUTO_3875 ?AUTO_3876 )
      ( MAKE-ON-VERIFY ?AUTO_3875 ?AUTO_3876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3887 - BLOCK
      ?AUTO_3888 - BLOCK
    )
    :vars
    (
      ?AUTO_3893 - BLOCK
      ?AUTO_3889 - BLOCK
      ?AUTO_3892 - BLOCK
      ?AUTO_3895 - BLOCK
      ?AUTO_3896 - BLOCK
      ?AUTO_3894 - BLOCK
      ?AUTO_3897 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3887 ?AUTO_3893 ) ( ON ?AUTO_3889 ?AUTO_3887 ) ( CLEAR ?AUTO_3892 ) ( ON ?AUTO_3895 ?AUTO_3889 ) ( ON ?AUTO_3896 ?AUTO_3895 ) ( CLEAR ?AUTO_3896 ) ( ON ?AUTO_3894 ?AUTO_3888 ) ( CLEAR ?AUTO_3894 ) ( HOLDING ?AUTO_3897 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3897 )
      ( MAKE-ON ?AUTO_3887 ?AUTO_3888 )
      ( MAKE-ON-VERIFY ?AUTO_3887 ?AUTO_3888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3898 - BLOCK
      ?AUTO_3899 - BLOCK
    )
    :vars
    (
      ?AUTO_3905 - BLOCK
      ?AUTO_3906 - BLOCK
      ?AUTO_3904 - BLOCK
      ?AUTO_3903 - BLOCK
      ?AUTO_3902 - BLOCK
      ?AUTO_3907 - BLOCK
      ?AUTO_3908 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3898 ?AUTO_3905 ) ( ON ?AUTO_3906 ?AUTO_3898 ) ( CLEAR ?AUTO_3904 ) ( ON ?AUTO_3903 ?AUTO_3906 ) ( ON ?AUTO_3902 ?AUTO_3903 ) ( CLEAR ?AUTO_3902 ) ( ON ?AUTO_3907 ?AUTO_3899 ) ( ON ?AUTO_3908 ?AUTO_3907 ) ( CLEAR ?AUTO_3908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3908 ?AUTO_3907 )
      ( MAKE-ON ?AUTO_3898 ?AUTO_3899 )
      ( MAKE-ON-VERIFY ?AUTO_3898 ?AUTO_3899 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3911 - BLOCK
      ?AUTO_3912 - BLOCK
    )
    :vars
    (
      ?AUTO_3918 - BLOCK
      ?AUTO_3920 - BLOCK
      ?AUTO_3914 - BLOCK
      ?AUTO_3916 - BLOCK
      ?AUTO_3921 - BLOCK
      ?AUTO_3917 - BLOCK
      ?AUTO_3919 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3911 ?AUTO_3918 ) ( ON ?AUTO_3920 ?AUTO_3911 ) ( ON ?AUTO_3914 ?AUTO_3920 ) ( ON ?AUTO_3916 ?AUTO_3914 ) ( CLEAR ?AUTO_3916 ) ( ON ?AUTO_3921 ?AUTO_3912 ) ( ON ?AUTO_3917 ?AUTO_3921 ) ( CLEAR ?AUTO_3917 ) ( HOLDING ?AUTO_3919 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3919 )
      ( MAKE-ON ?AUTO_3911 ?AUTO_3912 )
      ( MAKE-ON-VERIFY ?AUTO_3911 ?AUTO_3912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3923 - BLOCK
      ?AUTO_3924 - BLOCK
    )
    :vars
    (
      ?AUTO_3932 - BLOCK
      ?AUTO_3930 - BLOCK
      ?AUTO_3926 - BLOCK
      ?AUTO_3929 - BLOCK
      ?AUTO_3933 - BLOCK
      ?AUTO_3925 - BLOCK
      ?AUTO_3931 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3923 ?AUTO_3932 ) ( ON ?AUTO_3930 ?AUTO_3923 ) ( ON ?AUTO_3926 ?AUTO_3930 ) ( ON ?AUTO_3929 ?AUTO_3926 ) ( CLEAR ?AUTO_3929 ) ( ON ?AUTO_3933 ?AUTO_3924 ) ( ON ?AUTO_3925 ?AUTO_3933 ) ( ON ?AUTO_3931 ?AUTO_3925 ) ( CLEAR ?AUTO_3931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3931 ?AUTO_3925 )
      ( MAKE-ON ?AUTO_3923 ?AUTO_3924 )
      ( MAKE-ON-VERIFY ?AUTO_3923 ?AUTO_3924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4040 - BLOCK
      ?AUTO_4041 - BLOCK
    )
    :vars
    (
      ?AUTO_4042 - BLOCK
      ?AUTO_4048 - BLOCK
      ?AUTO_4049 - BLOCK
      ?AUTO_4047 - BLOCK
      ?AUTO_4044 - BLOCK
      ?AUTO_4043 - BLOCK
      ?AUTO_4050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4041 ) ( ON-TABLE ?AUTO_4040 ) ( ON ?AUTO_4042 ?AUTO_4040 ) ( ON ?AUTO_4048 ?AUTO_4042 ) ( CLEAR ?AUTO_4049 ) ( ON ?AUTO_4047 ?AUTO_4048 ) ( CLEAR ?AUTO_4044 ) ( ON ?AUTO_4043 ?AUTO_4047 ) ( CLEAR ?AUTO_4043 ) ( HOLDING ?AUTO_4050 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4050 )
      ( MAKE-ON ?AUTO_4040 ?AUTO_4041 )
      ( MAKE-ON-VERIFY ?AUTO_4040 ?AUTO_4041 ) )
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
      ?AUTO_4064 - BLOCK
      ?AUTO_4062 - BLOCK
      ?AUTO_4066 - BLOCK
      ?AUTO_4059 - BLOCK
      ?AUTO_4065 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4057 ) ( ON ?AUTO_4061 ?AUTO_4057 ) ( ON ?AUTO_4064 ?AUTO_4061 ) ( CLEAR ?AUTO_4062 ) ( ON ?AUTO_4066 ?AUTO_4064 ) ( CLEAR ?AUTO_4059 ) ( ON ?AUTO_4065 ?AUTO_4066 ) ( CLEAR ?AUTO_4065 ) ( HOLDING ?AUTO_4058 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4058 )
      ( MAKE-ON ?AUTO_4057 ?AUTO_4058 )
      ( MAKE-ON-VERIFY ?AUTO_4057 ?AUTO_4058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4516 - BLOCK
      ?AUTO_4517 - BLOCK
    )
    :vars
    (
      ?AUTO_4518 - BLOCK
      ?AUTO_4521 - BLOCK
      ?AUTO_4522 - BLOCK
      ?AUTO_4523 - BLOCK
      ?AUTO_4524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4516 ) ( CLEAR ?AUTO_4516 ) ( ON ?AUTO_4518 ?AUTO_4517 ) ( ON ?AUTO_4521 ?AUTO_4518 ) ( ON ?AUTO_4522 ?AUTO_4521 ) ( CLEAR ?AUTO_4522 ) ( HOLDING ?AUTO_4523 ) ( CLEAR ?AUTO_4524 ) )
    :subtasks
    ( ( !STACK ?AUTO_4523 ?AUTO_4524 )
      ( MAKE-ON ?AUTO_4516 ?AUTO_4517 )
      ( MAKE-ON-VERIFY ?AUTO_4516 ?AUTO_4517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4546 - BLOCK
      ?AUTO_4547 - BLOCK
    )
    :vars
    (
      ?AUTO_4550 - BLOCK
      ?AUTO_4551 - BLOCK
      ?AUTO_4552 - BLOCK
      ?AUTO_4553 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4550 ?AUTO_4547 ) ( ON ?AUTO_4551 ?AUTO_4550 ) ( ON ?AUTO_4546 ?AUTO_4551 ) ( CLEAR ?AUTO_4546 ) ( HOLDING ?AUTO_4552 ) ( CLEAR ?AUTO_4553 ) )
    :subtasks
    ( ( !STACK ?AUTO_4552 ?AUTO_4553 )
      ( MAKE-ON ?AUTO_4546 ?AUTO_4547 )
      ( MAKE-ON-VERIFY ?AUTO_4546 ?AUTO_4547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7238 - BLOCK
      ?AUTO_7232 - BLOCK
    )
    :vars
    (
      ?AUTO_7239 - BLOCK
      ?AUTO_7241 - BLOCK
      ?AUTO_7236 - BLOCK
      ?AUTO_7233 - BLOCK
      ?AUTO_7240 - BLOCK
      ?AUTO_7235 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7238 ?AUTO_7239 ) ( ON ?AUTO_7241 ?AUTO_7232 ) ( ON ?AUTO_7236 ?AUTO_7241 ) ( ON ?AUTO_7233 ?AUTO_7236 ) ( ON ?AUTO_7240 ?AUTO_7233 ) ( CLEAR ?AUTO_7240 ) ( ON ?AUTO_7235 ?AUTO_7238 ) ( CLEAR ?AUTO_7235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7235 ?AUTO_7238 )
      ( MAKE-ON ?AUTO_7238 ?AUTO_7232 )
      ( MAKE-ON-VERIFY ?AUTO_7238 ?AUTO_7232 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4864 - BLOCK
      ?AUTO_4865 - BLOCK
    )
    :vars
    (
      ?AUTO_4871 - BLOCK
      ?AUTO_4870 - BLOCK
      ?AUTO_4872 - BLOCK
      ?AUTO_4866 - BLOCK
      ?AUTO_4868 - BLOCK
      ?AUTO_4874 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4865 ) ( ON ?AUTO_4864 ?AUTO_4871 ) ( ON ?AUTO_4870 ?AUTO_4864 ) ( ON ?AUTO_4872 ?AUTO_4870 ) ( ON ?AUTO_4866 ?AUTO_4872 ) ( CLEAR ?AUTO_4866 ) ( HOLDING ?AUTO_4868 ) ( CLEAR ?AUTO_4874 ) )
    :subtasks
    ( ( !STACK ?AUTO_4868 ?AUTO_4874 )
      ( MAKE-ON ?AUTO_4864 ?AUTO_4865 )
      ( MAKE-ON-VERIFY ?AUTO_4864 ?AUTO_4865 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4881 - BLOCK
      ?AUTO_4882 - BLOCK
    )
    :vars
    (
      ?AUTO_4885 - BLOCK
      ?AUTO_4888 - BLOCK
      ?AUTO_4889 - BLOCK
      ?AUTO_4883 - BLOCK
      ?AUTO_4887 - BLOCK
      ?AUTO_4891 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4881 ?AUTO_4885 ) ( ON ?AUTO_4888 ?AUTO_4881 ) ( ON ?AUTO_4889 ?AUTO_4888 ) ( CLEAR ?AUTO_4883 ) ( ON ?AUTO_4887 ?AUTO_4889 ) ( CLEAR ?AUTO_4887 ) ( HOLDING ?AUTO_4882 ) ( CLEAR ?AUTO_4891 ) )
    :subtasks
    ( ( !STACK ?AUTO_4882 ?AUTO_4891 )
      ( MAKE-ON ?AUTO_4881 ?AUTO_4882 )
      ( MAKE-ON-VERIFY ?AUTO_4881 ?AUTO_4882 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5316 - BLOCK
      ?AUTO_5317 - BLOCK
    )
    :vars
    (
      ?AUTO_5321 - BLOCK
      ?AUTO_5320 - BLOCK
      ?AUTO_5322 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5321 ) ( ON ?AUTO_5320 ?AUTO_5317 ) ( CLEAR ?AUTO_5320 ) ( CLEAR ?AUTO_5322 ) ( ON-TABLE ?AUTO_5316 ) ( CLEAR ?AUTO_5316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5316 )
      ( MAKE-ON ?AUTO_5316 ?AUTO_5317 )
      ( MAKE-ON-VERIFY ?AUTO_5316 ?AUTO_5317 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5357 - BLOCK
      ?AUTO_5358 - BLOCK
    )
    :vars
    (
      ?AUTO_5359 - BLOCK
      ?AUTO_5363 - BLOCK
      ?AUTO_5361 - BLOCK
      ?AUTO_5364 - BLOCK
      ?AUTO_5362 - BLOCK
      ?AUTO_5360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5359 ) ( ON ?AUTO_5363 ?AUTO_5358 ) ( CLEAR ?AUTO_5363 ) ( ON-TABLE ?AUTO_5357 ) ( CLEAR ?AUTO_5361 ) ( ON ?AUTO_5364 ?AUTO_5357 ) ( CLEAR ?AUTO_5362 ) ( ON ?AUTO_5360 ?AUTO_5364 ) ( CLEAR ?AUTO_5360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5360 ?AUTO_5364 )
      ( MAKE-ON ?AUTO_5357 ?AUTO_5358 )
      ( MAKE-ON-VERIFY ?AUTO_5357 ?AUTO_5358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5611 - BLOCK
      ?AUTO_5612 - BLOCK
    )
    :vars
    (
      ?AUTO_5620 - BLOCK
      ?AUTO_5619 - BLOCK
      ?AUTO_5617 - BLOCK
      ?AUTO_5616 - BLOCK
      ?AUTO_5615 - BLOCK
      ?AUTO_5614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5611 ) ( ON ?AUTO_5620 ?AUTO_5611 ) ( CLEAR ?AUTO_5619 ) ( ON ?AUTO_5617 ?AUTO_5620 ) ( ON ?AUTO_5616 ?AUTO_5617 ) ( CLEAR ?AUTO_5616 ) ( CLEAR ?AUTO_5615 ) ( ON ?AUTO_5614 ?AUTO_5612 ) ( CLEAR ?AUTO_5614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5614 ?AUTO_5612 )
      ( MAKE-ON ?AUTO_5611 ?AUTO_5612 )
      ( MAKE-ON-VERIFY ?AUTO_5611 ?AUTO_5612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5623 - BLOCK
      ?AUTO_5624 - BLOCK
    )
    :vars
    (
      ?AUTO_5628 - BLOCK
      ?AUTO_5630 - BLOCK
      ?AUTO_5627 - BLOCK
      ?AUTO_5632 - BLOCK
      ?AUTO_5631 - BLOCK
      ?AUTO_5629 - BLOCK
      ?AUTO_5633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5623 ) ( ON ?AUTO_5628 ?AUTO_5623 ) ( CLEAR ?AUTO_5630 ) ( ON ?AUTO_5627 ?AUTO_5628 ) ( ON ?AUTO_5632 ?AUTO_5627 ) ( CLEAR ?AUTO_5632 ) ( CLEAR ?AUTO_5631 ) ( ON ?AUTO_5629 ?AUTO_5624 ) ( CLEAR ?AUTO_5629 ) ( HOLDING ?AUTO_5633 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5633 )
      ( MAKE-ON ?AUTO_5623 ?AUTO_5624 )
      ( MAKE-ON-VERIFY ?AUTO_5623 ?AUTO_5624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5634 - BLOCK
      ?AUTO_5635 - BLOCK
    )
    :vars
    (
      ?AUTO_5637 - BLOCK
      ?AUTO_5642 - BLOCK
      ?AUTO_5638 - BLOCK
      ?AUTO_5644 - BLOCK
      ?AUTO_5643 - BLOCK
      ?AUTO_5640 - BLOCK
      ?AUTO_5636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5634 ) ( ON ?AUTO_5637 ?AUTO_5634 ) ( CLEAR ?AUTO_5642 ) ( ON ?AUTO_5638 ?AUTO_5637 ) ( ON ?AUTO_5644 ?AUTO_5638 ) ( CLEAR ?AUTO_5644 ) ( CLEAR ?AUTO_5643 ) ( ON ?AUTO_5640 ?AUTO_5635 ) ( ON ?AUTO_5636 ?AUTO_5640 ) ( CLEAR ?AUTO_5636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5636 ?AUTO_5640 )
      ( MAKE-ON ?AUTO_5634 ?AUTO_5635 )
      ( MAKE-ON-VERIFY ?AUTO_5634 ?AUTO_5635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5647 - BLOCK
      ?AUTO_5648 - BLOCK
    )
    :vars
    (
      ?AUTO_5656 - BLOCK
      ?AUTO_5652 - BLOCK
      ?AUTO_5653 - BLOCK
      ?AUTO_5657 - BLOCK
      ?AUTO_5655 - BLOCK
      ?AUTO_5650 - BLOCK
      ?AUTO_5651 - BLOCK
      ?AUTO_5658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5647 ) ( ON ?AUTO_5656 ?AUTO_5647 ) ( CLEAR ?AUTO_5652 ) ( ON ?AUTO_5653 ?AUTO_5656 ) ( ON ?AUTO_5657 ?AUTO_5653 ) ( CLEAR ?AUTO_5657 ) ( CLEAR ?AUTO_5655 ) ( ON ?AUTO_5650 ?AUTO_5648 ) ( ON ?AUTO_5651 ?AUTO_5650 ) ( CLEAR ?AUTO_5651 ) ( HOLDING ?AUTO_5658 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5658 )
      ( MAKE-ON ?AUTO_5647 ?AUTO_5648 )
      ( MAKE-ON-VERIFY ?AUTO_5647 ?AUTO_5648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5659 - BLOCK
      ?AUTO_5660 - BLOCK
    )
    :vars
    (
      ?AUTO_5661 - BLOCK
      ?AUTO_5664 - BLOCK
      ?AUTO_5669 - BLOCK
      ?AUTO_5663 - BLOCK
      ?AUTO_5665 - BLOCK
      ?AUTO_5662 - BLOCK
      ?AUTO_5667 - BLOCK
      ?AUTO_5670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5659 ) ( ON ?AUTO_5661 ?AUTO_5659 ) ( CLEAR ?AUTO_5664 ) ( ON ?AUTO_5669 ?AUTO_5661 ) ( ON ?AUTO_5663 ?AUTO_5669 ) ( CLEAR ?AUTO_5663 ) ( CLEAR ?AUTO_5665 ) ( ON ?AUTO_5662 ?AUTO_5660 ) ( ON ?AUTO_5667 ?AUTO_5662 ) ( ON ?AUTO_5670 ?AUTO_5667 ) ( CLEAR ?AUTO_5670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5670 ?AUTO_5667 )
      ( MAKE-ON ?AUTO_5659 ?AUTO_5660 )
      ( MAKE-ON-VERIFY ?AUTO_5659 ?AUTO_5660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5673 - BLOCK
      ?AUTO_5674 - BLOCK
    )
    :vars
    (
      ?AUTO_5681 - BLOCK
      ?AUTO_5684 - BLOCK
      ?AUTO_5682 - BLOCK
      ?AUTO_5678 - BLOCK
      ?AUTO_5677 - BLOCK
      ?AUTO_5676 - BLOCK
      ?AUTO_5683 - BLOCK
      ?AUTO_5680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5673 ) ( ON ?AUTO_5681 ?AUTO_5673 ) ( CLEAR ?AUTO_5684 ) ( ON ?AUTO_5682 ?AUTO_5681 ) ( CLEAR ?AUTO_5678 ) ( ON ?AUTO_5677 ?AUTO_5674 ) ( ON ?AUTO_5676 ?AUTO_5677 ) ( ON ?AUTO_5683 ?AUTO_5676 ) ( CLEAR ?AUTO_5683 ) ( HOLDING ?AUTO_5680 ) ( CLEAR ?AUTO_5682 ) )
    :subtasks
    ( ( !STACK ?AUTO_5680 ?AUTO_5682 )
      ( MAKE-ON ?AUTO_5673 ?AUTO_5674 )
      ( MAKE-ON-VERIFY ?AUTO_5673 ?AUTO_5674 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5701 - BLOCK
      ?AUTO_5702 - BLOCK
    )
    :vars
    (
      ?AUTO_5703 - BLOCK
      ?AUTO_5712 - BLOCK
      ?AUTO_5709 - BLOCK
      ?AUTO_5711 - BLOCK
      ?AUTO_5706 - BLOCK
      ?AUTO_5707 - BLOCK
      ?AUTO_5708 - BLOCK
      ?AUTO_5710 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5701 ) ( ON ?AUTO_5703 ?AUTO_5701 ) ( CLEAR ?AUTO_5712 ) ( CLEAR ?AUTO_5709 ) ( ON ?AUTO_5711 ?AUTO_5702 ) ( ON ?AUTO_5706 ?AUTO_5711 ) ( ON ?AUTO_5707 ?AUTO_5706 ) ( ON ?AUTO_5708 ?AUTO_5707 ) ( CLEAR ?AUTO_5708 ) ( HOLDING ?AUTO_5710 ) ( CLEAR ?AUTO_5703 ) )
    :subtasks
    ( ( !STACK ?AUTO_5710 ?AUTO_5703 )
      ( MAKE-ON ?AUTO_5701 ?AUTO_5702 )
      ( MAKE-ON-VERIFY ?AUTO_5701 ?AUTO_5702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5715 - BLOCK
      ?AUTO_5716 - BLOCK
    )
    :vars
    (
      ?AUTO_5720 - BLOCK
      ?AUTO_5725 - BLOCK
      ?AUTO_5724 - BLOCK
      ?AUTO_5717 - BLOCK
      ?AUTO_5719 - BLOCK
      ?AUTO_5726 - BLOCK
      ?AUTO_5721 - BLOCK
      ?AUTO_5718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5715 ) ( ON ?AUTO_5720 ?AUTO_5715 ) ( CLEAR ?AUTO_5725 ) ( CLEAR ?AUTO_5724 ) ( ON ?AUTO_5717 ?AUTO_5716 ) ( ON ?AUTO_5719 ?AUTO_5717 ) ( ON ?AUTO_5726 ?AUTO_5719 ) ( ON ?AUTO_5721 ?AUTO_5726 ) ( CLEAR ?AUTO_5721 ) ( CLEAR ?AUTO_5720 ) ( ON-TABLE ?AUTO_5718 ) ( CLEAR ?AUTO_5718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5718 )
      ( MAKE-ON ?AUTO_5715 ?AUTO_5716 )
      ( MAKE-ON-VERIFY ?AUTO_5715 ?AUTO_5716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5728 - BLOCK
      ?AUTO_5729 - BLOCK
    )
    :vars
    (
      ?AUTO_5735 - BLOCK
      ?AUTO_5736 - BLOCK
      ?AUTO_5731 - BLOCK
      ?AUTO_5739 - BLOCK
      ?AUTO_5733 - BLOCK
      ?AUTO_5737 - BLOCK
      ?AUTO_5738 - BLOCK
      ?AUTO_5730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5728 ) ( CLEAR ?AUTO_5735 ) ( CLEAR ?AUTO_5736 ) ( ON ?AUTO_5731 ?AUTO_5729 ) ( ON ?AUTO_5739 ?AUTO_5731 ) ( ON ?AUTO_5733 ?AUTO_5739 ) ( ON ?AUTO_5737 ?AUTO_5733 ) ( CLEAR ?AUTO_5737 ) ( ON-TABLE ?AUTO_5738 ) ( CLEAR ?AUTO_5738 ) ( HOLDING ?AUTO_5730 ) ( CLEAR ?AUTO_5728 ) )
    :subtasks
    ( ( !STACK ?AUTO_5730 ?AUTO_5728 )
      ( MAKE-ON ?AUTO_5728 ?AUTO_5729 )
      ( MAKE-ON-VERIFY ?AUTO_5728 ?AUTO_5729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5762 - BLOCK
      ?AUTO_5763 - BLOCK
    )
    :vars
    (
      ?AUTO_5773 - BLOCK
      ?AUTO_5772 - BLOCK
      ?AUTO_5769 - BLOCK
      ?AUTO_5767 - BLOCK
      ?AUTO_5771 - BLOCK
      ?AUTO_5768 - BLOCK
      ?AUTO_5770 - BLOCK
      ?AUTO_5765 - BLOCK
      ?AUTO_5775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5762 ) ( CLEAR ?AUTO_5773 ) ( CLEAR ?AUTO_5772 ) ( ON ?AUTO_5769 ?AUTO_5763 ) ( ON ?AUTO_5767 ?AUTO_5769 ) ( ON ?AUTO_5771 ?AUTO_5767 ) ( ON ?AUTO_5768 ?AUTO_5771 ) ( CLEAR ?AUTO_5768 ) ( ON-TABLE ?AUTO_5770 ) ( CLEAR ?AUTO_5770 ) ( CLEAR ?AUTO_5762 ) ( ON ?AUTO_5765 ?AUTO_5775 ) ( CLEAR ?AUTO_5765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5765 ?AUTO_5775 )
      ( MAKE-ON ?AUTO_5762 ?AUTO_5763 )
      ( MAKE-ON-VERIFY ?AUTO_5762 ?AUTO_5763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6220 - BLOCK
      ?AUTO_6221 - BLOCK
    )
    :vars
    (
      ?AUTO_6222 - BLOCK
      ?AUTO_6226 - BLOCK
      ?AUTO_6225 - BLOCK
      ?AUTO_6228 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6220 ?AUTO_6222 ) ( CLEAR ?AUTO_6226 ) ( ON ?AUTO_6225 ?AUTO_6220 ) ( CLEAR ?AUTO_6225 ) ( HOLDING ?AUTO_6221 ) ( CLEAR ?AUTO_6228 ) )
    :subtasks
    ( ( !STACK ?AUTO_6221 ?AUTO_6228 )
      ( MAKE-ON ?AUTO_6220 ?AUTO_6221 )
      ( MAKE-ON-VERIFY ?AUTO_6220 ?AUTO_6221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6493 - BLOCK
      ?AUTO_6494 - BLOCK
    )
    :vars
    (
      ?AUTO_6500 - BLOCK
      ?AUTO_6495 - BLOCK
      ?AUTO_6499 - BLOCK
      ?AUTO_6498 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6500 ?AUTO_6494 ) ( ON ?AUTO_6493 ?AUTO_6500 ) ( CLEAR ?AUTO_6495 ) ( ON ?AUTO_6499 ?AUTO_6493 ) ( ON ?AUTO_6498 ?AUTO_6499 ) ( CLEAR ?AUTO_6498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6498 ?AUTO_6499 )
      ( MAKE-ON ?AUTO_6493 ?AUTO_6494 )
      ( MAKE-ON-VERIFY ?AUTO_6493 ?AUTO_6494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6833 - BLOCK
      ?AUTO_6834 - BLOCK
    )
    :vars
    (
      ?AUTO_6839 - BLOCK
      ?AUTO_6836 - BLOCK
      ?AUTO_6838 - BLOCK
      ?AUTO_6840 - BLOCK
      ?AUTO_6841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6833 ) ( CLEAR ?AUTO_6833 ) ( ON ?AUTO_6839 ?AUTO_6834 ) ( CLEAR ?AUTO_6836 ) ( ON ?AUTO_6838 ?AUTO_6839 ) ( CLEAR ?AUTO_6838 ) ( HOLDING ?AUTO_6840 ) ( CLEAR ?AUTO_6841 ) )
    :subtasks
    ( ( !STACK ?AUTO_6840 ?AUTO_6841 )
      ( MAKE-ON ?AUTO_6833 ?AUTO_6834 )
      ( MAKE-ON-VERIFY ?AUTO_6833 ?AUTO_6834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6939 - BLOCK
      ?AUTO_6940 - BLOCK
    )
    :vars
    (
      ?AUTO_6945 - BLOCK
      ?AUTO_6943 - BLOCK
      ?AUTO_6944 - BLOCK
      ?AUTO_6946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6939 ) ( ON ?AUTO_6945 ?AUTO_6940 ) ( CLEAR ?AUTO_6945 ) ( CLEAR ?AUTO_6943 ) ( ON ?AUTO_6944 ?AUTO_6939 ) ( CLEAR ?AUTO_6944 ) ( HOLDING ?AUTO_6946 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6946 )
      ( MAKE-ON ?AUTO_6939 ?AUTO_6940 )
      ( MAKE-ON-VERIFY ?AUTO_6939 ?AUTO_6940 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7123 - BLOCK
    )
    :vars
    (
      ?AUTO_7128 - BLOCK
      ?AUTO_7125 - BLOCK
      ?AUTO_7127 - BLOCK
      ?AUTO_7124 - BLOCK
      ?AUTO_7126 - BLOCK
      ?AUTO_7130 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7123 ?AUTO_7128 ) ( ON ?AUTO_7125 ?AUTO_7123 ) ( CLEAR ?AUTO_7127 ) ( ON ?AUTO_7124 ?AUTO_7125 ) ( ON ?AUTO_7126 ?AUTO_7124 ) ( CLEAR ?AUTO_7126 ) ( HOLDING ?AUTO_7130 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7130 )
      ( MAKE-ON-TABLE ?AUTO_7123 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7220 - BLOCK
      ?AUTO_7221 - BLOCK
    )
    :vars
    (
      ?AUTO_7224 - BLOCK
      ?AUTO_7226 - BLOCK
      ?AUTO_7222 - BLOCK
      ?AUTO_7229 - BLOCK
      ?AUTO_7228 - BLOCK
      ?AUTO_7225 - BLOCK
      ?AUTO_7230 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7220 ?AUTO_7224 ) ( CLEAR ?AUTO_7220 ) ( ON ?AUTO_7226 ?AUTO_7221 ) ( ON ?AUTO_7222 ?AUTO_7226 ) ( CLEAR ?AUTO_7229 ) ( ON ?AUTO_7228 ?AUTO_7222 ) ( ON ?AUTO_7225 ?AUTO_7228 ) ( CLEAR ?AUTO_7225 ) ( HOLDING ?AUTO_7230 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7230 )
      ( MAKE-ON ?AUTO_7220 ?AUTO_7221 )
      ( MAKE-ON-VERIFY ?AUTO_7220 ?AUTO_7221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7406 - BLOCK
      ?AUTO_7407 - BLOCK
    )
    :vars
    (
      ?AUTO_7410 - BLOCK
      ?AUTO_7408 - BLOCK
      ?AUTO_7411 - BLOCK
      ?AUTO_7413 - BLOCK
      ?AUTO_7414 - BLOCK
      ?AUTO_7415 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7406 ?AUTO_7410 ) ( CLEAR ?AUTO_7408 ) ( ON ?AUTO_7411 ?AUTO_7406 ) ( CLEAR ?AUTO_7411 ) ( ON ?AUTO_7413 ?AUTO_7407 ) ( CLEAR ?AUTO_7413 ) ( HOLDING ?AUTO_7414 ) ( CLEAR ?AUTO_7415 ) )
    :subtasks
    ( ( !STACK ?AUTO_7414 ?AUTO_7415 )
      ( MAKE-ON ?AUTO_7406 ?AUTO_7407 )
      ( MAKE-ON-VERIFY ?AUTO_7406 ?AUTO_7407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7420 - BLOCK
      ?AUTO_7421 - BLOCK
    )
    :vars
    (
      ?AUTO_7428 - BLOCK
      ?AUTO_7426 - BLOCK
      ?AUTO_7422 - BLOCK
      ?AUTO_7425 - BLOCK
      ?AUTO_7423 - BLOCK
      ?AUTO_7424 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7420 ?AUTO_7428 ) ( CLEAR ?AUTO_7426 ) ( ON ?AUTO_7422 ?AUTO_7420 ) ( CLEAR ?AUTO_7422 ) ( ON ?AUTO_7425 ?AUTO_7421 ) ( CLEAR ?AUTO_7423 ) ( ON ?AUTO_7424 ?AUTO_7425 ) ( CLEAR ?AUTO_7424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7424 ?AUTO_7425 )
      ( MAKE-ON ?AUTO_7420 ?AUTO_7421 )
      ( MAKE-ON-VERIFY ?AUTO_7420 ?AUTO_7421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7468 - BLOCK
      ?AUTO_7469 - BLOCK
    )
    :vars
    (
      ?AUTO_7472 - BLOCK
      ?AUTO_7475 - BLOCK
      ?AUTO_7471 - BLOCK
      ?AUTO_7473 - BLOCK
      ?AUTO_7474 - BLOCK
      ?AUTO_7479 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7468 ?AUTO_7472 ) ( ON ?AUTO_7475 ?AUTO_7468 ) ( ON ?AUTO_7471 ?AUTO_7469 ) ( ON ?AUTO_7473 ?AUTO_7471 ) ( ON ?AUTO_7474 ?AUTO_7473 ) ( CLEAR ?AUTO_7474 ) ( ON ?AUTO_7479 ?AUTO_7475 ) ( CLEAR ?AUTO_7479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7479 ?AUTO_7475 )
      ( MAKE-ON ?AUTO_7468 ?AUTO_7469 )
      ( MAKE-ON-VERIFY ?AUTO_7468 ?AUTO_7469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7542 - BLOCK
      ?AUTO_7543 - BLOCK
    )
    :vars
    (
      ?AUTO_7548 - BLOCK
      ?AUTO_7544 - BLOCK
      ?AUTO_7546 - BLOCK
      ?AUTO_7550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7542 ) ( ON ?AUTO_7548 ?AUTO_7542 ) ( CLEAR ?AUTO_7544 ) ( ON ?AUTO_7546 ?AUTO_7548 ) ( CLEAR ?AUTO_7546 ) ( HOLDING ?AUTO_7543 ) ( CLEAR ?AUTO_7550 ) )
    :subtasks
    ( ( !STACK ?AUTO_7543 ?AUTO_7550 )
      ( MAKE-ON ?AUTO_7542 ?AUTO_7543 )
      ( MAKE-ON-VERIFY ?AUTO_7542 ?AUTO_7543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8484 - BLOCK
      ?AUTO_8485 - BLOCK
    )
    :vars
    (
      ?AUTO_8491 - BLOCK
      ?AUTO_8493 - BLOCK
      ?AUTO_8494 - BLOCK
      ?AUTO_8492 - BLOCK
      ?AUTO_8490 - BLOCK
      ?AUTO_8488 - BLOCK
      ?AUTO_8489 - BLOCK
      ?AUTO_8495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8484 ) ( CLEAR ?AUTO_8491 ) ( ON ?AUTO_8493 ?AUTO_8485 ) ( ON ?AUTO_8494 ?AUTO_8493 ) ( ON ?AUTO_8492 ?AUTO_8494 ) ( CLEAR ?AUTO_8492 ) ( CLEAR ?AUTO_8490 ) ( ON ?AUTO_8488 ?AUTO_8484 ) ( ON ?AUTO_8489 ?AUTO_8488 ) ( ON ?AUTO_8495 ?AUTO_8489 ) ( CLEAR ?AUTO_8495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8495 ?AUTO_8489 )
      ( MAKE-ON ?AUTO_8484 ?AUTO_8485 )
      ( MAKE-ON-VERIFY ?AUTO_8484 ?AUTO_8485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8498 - BLOCK
      ?AUTO_8499 - BLOCK
    )
    :vars
    (
      ?AUTO_8503 - BLOCK
      ?AUTO_8504 - BLOCK
      ?AUTO_8502 - BLOCK
      ?AUTO_8505 - BLOCK
      ?AUTO_8501 - BLOCK
      ?AUTO_8500 - BLOCK
      ?AUTO_8506 - BLOCK
      ?AUTO_8508 - BLOCK
      ?AUTO_8510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8498 ) ( CLEAR ?AUTO_8503 ) ( ON ?AUTO_8504 ?AUTO_8499 ) ( ON ?AUTO_8502 ?AUTO_8504 ) ( ON ?AUTO_8505 ?AUTO_8502 ) ( CLEAR ?AUTO_8505 ) ( CLEAR ?AUTO_8501 ) ( ON ?AUTO_8500 ?AUTO_8498 ) ( ON ?AUTO_8506 ?AUTO_8500 ) ( ON ?AUTO_8508 ?AUTO_8506 ) ( CLEAR ?AUTO_8508 ) ( HOLDING ?AUTO_8510 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8510 )
      ( MAKE-ON ?AUTO_8498 ?AUTO_8499 )
      ( MAKE-ON-VERIFY ?AUTO_8498 ?AUTO_8499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8511 - BLOCK
      ?AUTO_8512 - BLOCK
    )
    :vars
    (
      ?AUTO_8522 - BLOCK
      ?AUTO_8520 - BLOCK
      ?AUTO_8521 - BLOCK
      ?AUTO_8515 - BLOCK
      ?AUTO_8513 - BLOCK
      ?AUTO_8514 - BLOCK
      ?AUTO_8518 - BLOCK
      ?AUTO_8516 - BLOCK
      ?AUTO_8523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8511 ) ( CLEAR ?AUTO_8522 ) ( ON ?AUTO_8520 ?AUTO_8512 ) ( ON ?AUTO_8521 ?AUTO_8520 ) ( ON ?AUTO_8515 ?AUTO_8521 ) ( CLEAR ?AUTO_8515 ) ( CLEAR ?AUTO_8513 ) ( ON ?AUTO_8514 ?AUTO_8511 ) ( ON ?AUTO_8518 ?AUTO_8514 ) ( ON ?AUTO_8516 ?AUTO_8518 ) ( ON ?AUTO_8523 ?AUTO_8516 ) ( CLEAR ?AUTO_8523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8523 ?AUTO_8516 )
      ( MAKE-ON ?AUTO_8511 ?AUTO_8512 )
      ( MAKE-ON-VERIFY ?AUTO_8511 ?AUTO_8512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8773 - BLOCK
      ?AUTO_8774 - BLOCK
    )
    :vars
    (
      ?AUTO_8779 - BLOCK
      ?AUTO_8777 - BLOCK
      ?AUTO_8778 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8779 ?AUTO_8774 ) ( ON ?AUTO_8777 ?AUTO_8779 ) ( ON ?AUTO_8778 ?AUTO_8777 ) ( CLEAR ?AUTO_8778 ) ( HOLDING ?AUTO_8773 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8773 )
      ( MAKE-ON ?AUTO_8773 ?AUTO_8774 )
      ( MAKE-ON-VERIFY ?AUTO_8773 ?AUTO_8774 ) )
  )

)

