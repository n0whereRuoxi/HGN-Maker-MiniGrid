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
      ?AUTO_50 - BLOCK
      ?AUTO_49 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_45 ?AUTO_50 ) ( ON ?AUTO_49 ?AUTO_45 ) ( CLEAR ?AUTO_49 ) ( HOLDING ?AUTO_46 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_46 )
      ( MAKE-ON ?AUTO_45 ?AUTO_46 )
      ( MAKE-ON-VERIFY ?AUTO_45 ?AUTO_46 ) )
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
      ?AUTO_75 - BLOCK
      ?AUTO_76 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_72 ) ( ON-TABLE ?AUTO_71 ) ( CLEAR ?AUTO_75 ) ( ON ?AUTO_76 ?AUTO_71 ) ( CLEAR ?AUTO_76 ) ( HAND-EMPTY ) )
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
      ?AUTO_84 - BLOCK
      ?AUTO_83 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_79 ) ( CLEAR ?AUTO_84 ) ( ON ?AUTO_83 ?AUTO_79 ) ( CLEAR ?AUTO_83 ) ( HOLDING ?AUTO_80 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_80 )
      ( MAKE-ON ?AUTO_79 ?AUTO_80 )
      ( MAKE-ON-VERIFY ?AUTO_79 ?AUTO_80 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_237 - BLOCK
      ?AUTO_238 - BLOCK
    )
    :vars
    (
      ?AUTO_241 - BLOCK
      ?AUTO_242 - BLOCK
      ?AUTO_243 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_238 ) ( ON-TABLE ?AUTO_237 ) ( ON ?AUTO_241 ?AUTO_237 ) ( CLEAR ?AUTO_242 ) ( ON ?AUTO_243 ?AUTO_241 ) ( CLEAR ?AUTO_243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_243 ?AUTO_241 )
      ( MAKE-ON ?AUTO_237 ?AUTO_238 )
      ( MAKE-ON-VERIFY ?AUTO_237 ?AUTO_238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_755 - BLOCK
      ?AUTO_756 - BLOCK
    )
    :vars
    (
      ?AUTO_759 - BLOCK
      ?AUTO_761 - BLOCK
      ?AUTO_760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_756 ) ( ON-TABLE ?AUTO_755 ) ( ON ?AUTO_759 ?AUTO_755 ) ( ON ?AUTO_761 ?AUTO_759 ) ( CLEAR ?AUTO_761 ) ( HOLDING ?AUTO_760 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_760 )
      ( MAKE-ON ?AUTO_755 ?AUTO_756 )
      ( MAKE-ON-VERIFY ?AUTO_755 ?AUTO_756 ) )
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
      ?AUTO_136 - BLOCK
      ?AUTO_137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_132 ) ( CLEAR ?AUTO_132 ) ( CLEAR ?AUTO_136 ) ( ON ?AUTO_137 ?AUTO_133 ) ( CLEAR ?AUTO_137 ) ( HAND-EMPTY ) )
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
      ?AUTO_152 - BLOCK
      ?AUTO_148 - BLOCK
    )
    :vars
    (
      ?AUTO_149 - BLOCK
      ?AUTO_153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_152 ) ( ON ?AUTO_149 ?AUTO_148 ) ( CLEAR ?AUTO_149 ) ( ON ?AUTO_153 ?AUTO_152 ) ( CLEAR ?AUTO_153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_153 ?AUTO_152 )
      ( MAKE-ON ?AUTO_152 ?AUTO_148 )
      ( MAKE-ON-VERIFY ?AUTO_152 ?AUTO_148 ) )
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
      ?AUTO_196 - BLOCK
      ?AUTO_197 - BLOCK
      ?AUTO_194 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_193 ?AUTO_196 ) ( CLEAR ?AUTO_197 ) ( ON ?AUTO_194 ?AUTO_193 ) ( CLEAR ?AUTO_194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_194 ?AUTO_193 )
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
      ?AUTO_203 - BLOCK
      ?AUTO_201 - BLOCK
      ?AUTO_202 - BLOCK
      ?AUTO_205 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_200 ?AUTO_203 ) ( CLEAR ?AUTO_201 ) ( ON ?AUTO_202 ?AUTO_200 ) ( CLEAR ?AUTO_202 ) ( HOLDING ?AUTO_205 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_205 )
      ( MAKE-ON-TABLE ?AUTO_200 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_200 ) )
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
      ?AUTO_246 - BLOCK
      ?AUTO_247 - BLOCK
    )
    :vars
    (
      ?AUTO_248 - BLOCK
      ?AUTO_252 - BLOCK
      ?AUTO_251 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_246 ) ( ON ?AUTO_248 ?AUTO_246 ) ( CLEAR ?AUTO_252 ) ( ON ?AUTO_251 ?AUTO_248 ) ( CLEAR ?AUTO_251 ) ( HOLDING ?AUTO_247 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_247 )
      ( MAKE-ON ?AUTO_246 ?AUTO_247 )
      ( MAKE-ON-VERIFY ?AUTO_246 ?AUTO_247 ) )
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
      ?AUTO_293 - BLOCK
      ?AUTO_292 - BLOCK
      ?AUTO_291 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_287 ?AUTO_293 ) ( CLEAR ?AUTO_287 ) ( CLEAR ?AUTO_292 ) ( ON ?AUTO_291 ?AUTO_288 ) ( CLEAR ?AUTO_291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_291 ?AUTO_288 )
      ( MAKE-ON ?AUTO_287 ?AUTO_288 )
      ( MAKE-ON-VERIFY ?AUTO_287 ?AUTO_288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_342 - BLOCK
      ?AUTO_343 - BLOCK
    )
    :vars
    (
      ?AUTO_345 - BLOCK
      ?AUTO_346 - BLOCK
      ?AUTO_349 - BLOCK
      ?AUTO_348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_342 ) ( CLEAR ?AUTO_345 ) ( ON ?AUTO_346 ?AUTO_342 ) ( CLEAR ?AUTO_346 ) ( CLEAR ?AUTO_349 ) ( ON ?AUTO_348 ?AUTO_343 ) ( CLEAR ?AUTO_348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_348 ?AUTO_343 )
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
      ?AUTO_356 - BLOCK
      ?AUTO_359 - BLOCK
      ?AUTO_357 - BLOCK
      ?AUTO_358 - BLOCK
      ?AUTO_360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_352 ) ( CLEAR ?AUTO_356 ) ( ON ?AUTO_359 ?AUTO_352 ) ( CLEAR ?AUTO_359 ) ( CLEAR ?AUTO_357 ) ( ON ?AUTO_358 ?AUTO_353 ) ( CLEAR ?AUTO_358 ) ( HOLDING ?AUTO_360 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_360 )
      ( MAKE-ON ?AUTO_352 ?AUTO_353 )
      ( MAKE-ON-VERIFY ?AUTO_352 ?AUTO_353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_388 - BLOCK
      ?AUTO_389 - BLOCK
    )
    :vars
    (
      ?AUTO_390 - BLOCK
      ?AUTO_394 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_388 ?AUTO_390 ) ( CLEAR ?AUTO_388 ) ( HOLDING ?AUTO_389 ) ( CLEAR ?AUTO_394 ) )
    :subtasks
    ( ( !STACK ?AUTO_389 ?AUTO_394 )
      ( MAKE-ON ?AUTO_388 ?AUTO_389 )
      ( MAKE-ON-VERIFY ?AUTO_388 ?AUTO_389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_408 - BLOCK
      ?AUTO_409 - BLOCK
    )
    :vars
    (
      ?AUTO_412 - BLOCK
      ?AUTO_414 - BLOCK
      ?AUTO_413 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_412 ) ( ON ?AUTO_414 ?AUTO_409 ) ( CLEAR ?AUTO_414 ) ( HOLDING ?AUTO_408 ) ( CLEAR ?AUTO_413 ) )
    :subtasks
    ( ( !STACK ?AUTO_408 ?AUTO_413 )
      ( MAKE-ON ?AUTO_408 ?AUTO_409 )
      ( MAKE-ON-VERIFY ?AUTO_408 ?AUTO_409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1404 - BLOCK
      ?AUTO_1405 - BLOCK
    )
    :vars
    (
      ?AUTO_1407 - BLOCK
      ?AUTO_1411 - BLOCK
      ?AUTO_1408 - BLOCK
      ?AUTO_1410 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1404 ?AUTO_1407 ) ( CLEAR ?AUTO_1404 ) ( CLEAR ?AUTO_1411 ) ( ON ?AUTO_1408 ?AUTO_1405 ) ( ON ?AUTO_1410 ?AUTO_1408 ) ( CLEAR ?AUTO_1410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1410 ?AUTO_1408 )
      ( MAKE-ON ?AUTO_1404 ?AUTO_1405 )
      ( MAKE-ON-VERIFY ?AUTO_1404 ?AUTO_1405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1414 - BLOCK
      ?AUTO_1415 - BLOCK
    )
    :vars
    (
      ?AUTO_1418 - BLOCK
      ?AUTO_1421 - BLOCK
      ?AUTO_1420 - BLOCK
      ?AUTO_1417 - BLOCK
      ?AUTO_1422 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1414 ?AUTO_1418 ) ( CLEAR ?AUTO_1414 ) ( CLEAR ?AUTO_1421 ) ( ON ?AUTO_1420 ?AUTO_1415 ) ( ON ?AUTO_1417 ?AUTO_1420 ) ( CLEAR ?AUTO_1417 ) ( HOLDING ?AUTO_1422 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1422 )
      ( MAKE-ON ?AUTO_1414 ?AUTO_1415 )
      ( MAKE-ON-VERIFY ?AUTO_1414 ?AUTO_1415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_563 - BLOCK
      ?AUTO_564 - BLOCK
    )
    :vars
    (
      ?AUTO_568 - BLOCK
      ?AUTO_565 - BLOCK
      ?AUTO_570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_563 ) ( CLEAR ?AUTO_568 ) ( ON ?AUTO_565 ?AUTO_563 ) ( CLEAR ?AUTO_565 ) ( HOLDING ?AUTO_564 ) ( CLEAR ?AUTO_570 ) )
    :subtasks
    ( ( !STACK ?AUTO_564 ?AUTO_570 )
      ( MAKE-ON ?AUTO_563 ?AUTO_564 )
      ( MAKE-ON-VERIFY ?AUTO_563 ?AUTO_564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_602 - BLOCK
      ?AUTO_603 - BLOCK
    )
    :vars
    (
      ?AUTO_604 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_602 ?AUTO_604 ) ( CLEAR ?AUTO_602 ) ( HOLDING ?AUTO_603 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_603 )
      ( MAKE-ON ?AUTO_602 ?AUTO_603 )
      ( MAKE-ON-VERIFY ?AUTO_602 ?AUTO_603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1304 - BLOCK
      ?AUTO_1305 - BLOCK
    )
    :vars
    (
      ?AUTO_1307 - BLOCK
      ?AUTO_1308 - BLOCK
      ?AUTO_1310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1305 ) ( ON ?AUTO_1304 ?AUTO_1307 ) ( ON ?AUTO_1308 ?AUTO_1304 ) ( CLEAR ?AUTO_1308 ) ( HOLDING ?AUTO_1310 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1310 )
      ( MAKE-ON ?AUTO_1304 ?AUTO_1305 )
      ( MAKE-ON-VERIFY ?AUTO_1304 ?AUTO_1305 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_648 - BLOCK
    )
    :vars
    (
      ?AUTO_650 - BLOCK
      ?AUTO_651 - BLOCK
      ?AUTO_652 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_648 ?AUTO_650 ) ( ON ?AUTO_651 ?AUTO_648 ) ( ON ?AUTO_652 ?AUTO_651 ) ( CLEAR ?AUTO_652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_652 ?AUTO_651 )
      ( MAKE-ON-TABLE ?AUTO_648 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_648 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_655 - BLOCK
    )
    :vars
    (
      ?AUTO_658 - BLOCK
      ?AUTO_656 - BLOCK
      ?AUTO_657 - BLOCK
      ?AUTO_660 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_655 ?AUTO_658 ) ( ON ?AUTO_656 ?AUTO_655 ) ( ON ?AUTO_657 ?AUTO_656 ) ( CLEAR ?AUTO_657 ) ( HOLDING ?AUTO_660 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_660 )
      ( MAKE-ON-TABLE ?AUTO_655 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_763 - BLOCK
      ?AUTO_764 - BLOCK
    )
    :vars
    (
      ?AUTO_766 - BLOCK
      ?AUTO_768 - BLOCK
      ?AUTO_769 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_764 ) ( ON-TABLE ?AUTO_763 ) ( ON ?AUTO_766 ?AUTO_763 ) ( ON ?AUTO_768 ?AUTO_766 ) ( ON ?AUTO_769 ?AUTO_768 ) ( CLEAR ?AUTO_769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_769 ?AUTO_768 )
      ( MAKE-ON ?AUTO_763 ?AUTO_764 )
      ( MAKE-ON-VERIFY ?AUTO_763 ?AUTO_764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_772 - BLOCK
      ?AUTO_773 - BLOCK
    )
    :vars
    (
      ?AUTO_774 - BLOCK
      ?AUTO_778 - BLOCK
      ?AUTO_775 - BLOCK
      ?AUTO_779 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_773 ) ( ON-TABLE ?AUTO_772 ) ( ON ?AUTO_774 ?AUTO_772 ) ( ON ?AUTO_778 ?AUTO_774 ) ( ON ?AUTO_775 ?AUTO_778 ) ( CLEAR ?AUTO_775 ) ( HOLDING ?AUTO_779 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_779 )
      ( MAKE-ON ?AUTO_772 ?AUTO_773 )
      ( MAKE-ON-VERIFY ?AUTO_772 ?AUTO_773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_780 - BLOCK
      ?AUTO_781 - BLOCK
    )
    :vars
    (
      ?AUTO_782 - BLOCK
      ?AUTO_786 - BLOCK
      ?AUTO_783 - BLOCK
      ?AUTO_787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_780 ) ( ON ?AUTO_782 ?AUTO_780 ) ( ON ?AUTO_786 ?AUTO_782 ) ( ON ?AUTO_783 ?AUTO_786 ) ( CLEAR ?AUTO_783 ) ( ON ?AUTO_787 ?AUTO_781 ) ( CLEAR ?AUTO_787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_787 ?AUTO_781 )
      ( MAKE-ON ?AUTO_780 ?AUTO_781 )
      ( MAKE-ON-VERIFY ?AUTO_780 ?AUTO_781 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_847 - BLOCK
    )
    :vars
    (
      ?AUTO_848 - BLOCK
      ?AUTO_849 - BLOCK
      ?AUTO_851 - BLOCK
      ?AUTO_852 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_847 ?AUTO_848 ) ( ON ?AUTO_849 ?AUTO_847 ) ( CLEAR ?AUTO_849 ) ( HOLDING ?AUTO_851 ) ( CLEAR ?AUTO_852 ) )
    :subtasks
    ( ( !STACK ?AUTO_851 ?AUTO_852 )
      ( MAKE-ON-TABLE ?AUTO_847 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2046 - BLOCK
      ?AUTO_2047 - BLOCK
    )
    :vars
    (
      ?AUTO_2049 - BLOCK
      ?AUTO_2051 - BLOCK
      ?AUTO_2050 - BLOCK
      ?AUTO_2048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2047 ) ( ON ?AUTO_2046 ?AUTO_2049 ) ( ON ?AUTO_2051 ?AUTO_2046 ) ( CLEAR ?AUTO_2050 ) ( ON ?AUTO_2048 ?AUTO_2051 ) ( CLEAR ?AUTO_2048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2048 ?AUTO_2051 )
      ( MAKE-ON ?AUTO_2046 ?AUTO_2047 )
      ( MAKE-ON-VERIFY ?AUTO_2046 ?AUTO_2047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4864 - BLOCK
      ?AUTO_4865 - BLOCK
    )
    :vars
    (
      ?AUTO_4867 - BLOCK
      ?AUTO_4869 - BLOCK
      ?AUTO_4868 - BLOCK
      ?AUTO_4871 - BLOCK
      ?AUTO_4872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4865 ) ( ON ?AUTO_4864 ?AUTO_4867 ) ( ON ?AUTO_4869 ?AUTO_4864 ) ( ON ?AUTO_4868 ?AUTO_4869 ) ( CLEAR ?AUTO_4868 ) ( HOLDING ?AUTO_4871 ) ( CLEAR ?AUTO_4872 ) )
    :subtasks
    ( ( !STACK ?AUTO_4871 ?AUTO_4872 )
      ( MAKE-ON ?AUTO_4864 ?AUTO_4865 )
      ( MAKE-ON-VERIFY ?AUTO_4864 ?AUTO_4865 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_999 - BLOCK
    )
    :vars
    (
      ?AUTO_1005 - BLOCK
      ?AUTO_1006 - BLOCK
      ?AUTO_1000 - BLOCK
      ?AUTO_1002 - BLOCK
      ?AUTO_1004 - BLOCK
      ?AUTO_1003 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_999 ?AUTO_1005 ) ( CLEAR ?AUTO_1006 ) ( ON ?AUTO_1000 ?AUTO_999 ) ( CLEAR ?AUTO_1002 ) ( ON ?AUTO_1004 ?AUTO_1000 ) ( ON ?AUTO_1003 ?AUTO_1004 ) ( CLEAR ?AUTO_1003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1003 ?AUTO_1004 )
      ( MAKE-ON-TABLE ?AUTO_999 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_999 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1009 - BLOCK
    )
    :vars
    (
      ?AUTO_1016 - BLOCK
      ?AUTO_1011 - BLOCK
      ?AUTO_1015 - BLOCK
      ?AUTO_1013 - BLOCK
      ?AUTO_1014 - BLOCK
      ?AUTO_1010 - BLOCK
      ?AUTO_1017 - BLOCK
      ?AUTO_1018 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1009 ?AUTO_1016 ) ( CLEAR ?AUTO_1011 ) ( ON ?AUTO_1015 ?AUTO_1009 ) ( CLEAR ?AUTO_1013 ) ( ON ?AUTO_1014 ?AUTO_1015 ) ( ON ?AUTO_1010 ?AUTO_1014 ) ( CLEAR ?AUTO_1010 ) ( HOLDING ?AUTO_1017 ) ( CLEAR ?AUTO_1018 ) )
    :subtasks
    ( ( !STACK ?AUTO_1017 ?AUTO_1018 )
      ( MAKE-ON-TABLE ?AUTO_1009 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1061 - BLOCK
      ?AUTO_1062 - BLOCK
    )
    :vars
    (
      ?AUTO_1067 - BLOCK
      ?AUTO_1065 - BLOCK
      ?AUTO_1063 - BLOCK
      ?AUTO_1069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1061 ) ( ON ?AUTO_1067 ?AUTO_1061 ) ( CLEAR ?AUTO_1065 ) ( ON ?AUTO_1063 ?AUTO_1067 ) ( CLEAR ?AUTO_1063 ) ( HOLDING ?AUTO_1062 ) ( CLEAR ?AUTO_1069 ) )
    :subtasks
    ( ( !STACK ?AUTO_1062 ?AUTO_1069 )
      ( MAKE-ON ?AUTO_1061 ?AUTO_1062 )
      ( MAKE-ON-VERIFY ?AUTO_1061 ?AUTO_1062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1099 - BLOCK
      ?AUTO_1100 - BLOCK
    )
    :vars
    (
      ?AUTO_1101 - BLOCK
      ?AUTO_1103 - BLOCK
      ?AUTO_1104 - BLOCK
      ?AUTO_1105 - BLOCK
      ?AUTO_1107 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1100 ) ( ON-TABLE ?AUTO_1099 ) ( ON ?AUTO_1101 ?AUTO_1099 ) ( CLEAR ?AUTO_1103 ) ( ON ?AUTO_1104 ?AUTO_1101 ) ( ON ?AUTO_1105 ?AUTO_1104 ) ( ON ?AUTO_1107 ?AUTO_1105 ) ( CLEAR ?AUTO_1107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1107 ?AUTO_1105 )
      ( MAKE-ON ?AUTO_1099 ?AUTO_1100 )
      ( MAKE-ON-VERIFY ?AUTO_1099 ?AUTO_1100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1110 - BLOCK
      ?AUTO_1111 - BLOCK
    )
    :vars
    (
      ?AUTO_1115 - BLOCK
      ?AUTO_1118 - BLOCK
      ?AUTO_1117 - BLOCK
      ?AUTO_1116 - BLOCK
      ?AUTO_1114 - BLOCK
      ?AUTO_1119 - BLOCK
      ?AUTO_1120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1111 ) ( ON-TABLE ?AUTO_1110 ) ( ON ?AUTO_1115 ?AUTO_1110 ) ( CLEAR ?AUTO_1118 ) ( ON ?AUTO_1117 ?AUTO_1115 ) ( ON ?AUTO_1116 ?AUTO_1117 ) ( ON ?AUTO_1114 ?AUTO_1116 ) ( CLEAR ?AUTO_1114 ) ( HOLDING ?AUTO_1119 ) ( CLEAR ?AUTO_1120 ) )
    :subtasks
    ( ( !STACK ?AUTO_1119 ?AUTO_1120 )
      ( MAKE-ON ?AUTO_1110 ?AUTO_1111 )
      ( MAKE-ON-VERIFY ?AUTO_1110 ?AUTO_1111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1146 - BLOCK
      ?AUTO_1147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1146 ) ( CLEAR ?AUTO_1146 ) ( HOLDING ?AUTO_1147 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1147 )
      ( MAKE-ON ?AUTO_1146 ?AUTO_1147 )
      ( MAKE-ON-VERIFY ?AUTO_1146 ?AUTO_1147 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1163 - BLOCK
      ?AUTO_1164 - BLOCK
    )
    :vars
    (
      ?AUTO_1167 - BLOCK
      ?AUTO_1166 - BLOCK
      ?AUTO_1169 - BLOCK
      ?AUTO_1170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1163 ) ( CLEAR ?AUTO_1163 ) ( CLEAR ?AUTO_1167 ) ( ON ?AUTO_1166 ?AUTO_1164 ) ( CLEAR ?AUTO_1166 ) ( HOLDING ?AUTO_1169 ) ( CLEAR ?AUTO_1170 ) )
    :subtasks
    ( ( !STACK ?AUTO_1169 ?AUTO_1170 )
      ( MAKE-ON ?AUTO_1163 ?AUTO_1164 )
      ( MAKE-ON-VERIFY ?AUTO_1163 ?AUTO_1164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1175 - BLOCK
      ?AUTO_1176 - BLOCK
    )
    :vars
    (
      ?AUTO_1177 - BLOCK
      ?AUTO_1180 - BLOCK
      ?AUTO_1181 - BLOCK
      ?AUTO_1182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1175 ) ( CLEAR ?AUTO_1175 ) ( CLEAR ?AUTO_1177 ) ( ON ?AUTO_1180 ?AUTO_1176 ) ( CLEAR ?AUTO_1181 ) ( ON ?AUTO_1182 ?AUTO_1180 ) ( CLEAR ?AUTO_1182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1182 ?AUTO_1180 )
      ( MAKE-ON ?AUTO_1175 ?AUTO_1176 )
      ( MAKE-ON-VERIFY ?AUTO_1175 ?AUTO_1176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1185 - BLOCK
      ?AUTO_1186 - BLOCK
    )
    :vars
    (
      ?AUTO_1189 - BLOCK
      ?AUTO_1192 - BLOCK
      ?AUTO_1191 - BLOCK
      ?AUTO_1190 - BLOCK
      ?AUTO_1193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1185 ) ( CLEAR ?AUTO_1185 ) ( CLEAR ?AUTO_1189 ) ( ON ?AUTO_1192 ?AUTO_1186 ) ( CLEAR ?AUTO_1191 ) ( ON ?AUTO_1190 ?AUTO_1192 ) ( CLEAR ?AUTO_1190 ) ( HOLDING ?AUTO_1193 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1193 )
      ( MAKE-ON ?AUTO_1185 ?AUTO_1186 )
      ( MAKE-ON-VERIFY ?AUTO_1185 ?AUTO_1186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1194 - BLOCK
      ?AUTO_1195 - BLOCK
    )
    :vars
    (
      ?AUTO_1197 - BLOCK
      ?AUTO_1201 - BLOCK
      ?AUTO_1200 - BLOCK
      ?AUTO_1196 - BLOCK
      ?AUTO_1202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1194 ) ( CLEAR ?AUTO_1194 ) ( CLEAR ?AUTO_1197 ) ( ON ?AUTO_1201 ?AUTO_1195 ) ( CLEAR ?AUTO_1200 ) ( ON ?AUTO_1196 ?AUTO_1201 ) ( ON ?AUTO_1202 ?AUTO_1196 ) ( CLEAR ?AUTO_1202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1202 ?AUTO_1196 )
      ( MAKE-ON ?AUTO_1194 ?AUTO_1195 )
      ( MAKE-ON-VERIFY ?AUTO_1194 ?AUTO_1195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1205 - BLOCK
      ?AUTO_1206 - BLOCK
    )
    :vars
    (
      ?AUTO_1210 - BLOCK
      ?AUTO_1212 - BLOCK
      ?AUTO_1213 - BLOCK
      ?AUTO_1209 - BLOCK
      ?AUTO_1208 - BLOCK
      ?AUTO_1214 - BLOCK
      ?AUTO_1215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1205 ) ( CLEAR ?AUTO_1205 ) ( CLEAR ?AUTO_1210 ) ( ON ?AUTO_1212 ?AUTO_1206 ) ( CLEAR ?AUTO_1213 ) ( ON ?AUTO_1209 ?AUTO_1212 ) ( ON ?AUTO_1208 ?AUTO_1209 ) ( CLEAR ?AUTO_1208 ) ( HOLDING ?AUTO_1214 ) ( CLEAR ?AUTO_1215 ) )
    :subtasks
    ( ( !STACK ?AUTO_1214 ?AUTO_1215 )
      ( MAKE-ON ?AUTO_1205 ?AUTO_1206 )
      ( MAKE-ON-VERIFY ?AUTO_1205 ?AUTO_1206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1216 - BLOCK
      ?AUTO_1217 - BLOCK
    )
    :vars
    (
      ?AUTO_1219 - BLOCK
      ?AUTO_1220 - BLOCK
      ?AUTO_1221 - BLOCK
      ?AUTO_1222 - BLOCK
      ?AUTO_1225 - BLOCK
      ?AUTO_1226 - BLOCK
      ?AUTO_1218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1216 ) ( CLEAR ?AUTO_1219 ) ( ON ?AUTO_1220 ?AUTO_1217 ) ( CLEAR ?AUTO_1221 ) ( ON ?AUTO_1222 ?AUTO_1220 ) ( ON ?AUTO_1225 ?AUTO_1222 ) ( CLEAR ?AUTO_1225 ) ( CLEAR ?AUTO_1226 ) ( ON ?AUTO_1218 ?AUTO_1216 ) ( CLEAR ?AUTO_1218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1218 ?AUTO_1216 )
      ( MAKE-ON ?AUTO_1216 ?AUTO_1217 )
      ( MAKE-ON-VERIFY ?AUTO_1216 ?AUTO_1217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1229 - BLOCK
      ?AUTO_1230 - BLOCK
    )
    :vars
    (
      ?AUTO_1234 - BLOCK
      ?AUTO_1239 - BLOCK
      ?AUTO_1238 - BLOCK
      ?AUTO_1233 - BLOCK
      ?AUTO_1237 - BLOCK
      ?AUTO_1235 - BLOCK
      ?AUTO_1236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1229 ) ( CLEAR ?AUTO_1234 ) ( ON ?AUTO_1239 ?AUTO_1230 ) ( CLEAR ?AUTO_1238 ) ( ON ?AUTO_1233 ?AUTO_1239 ) ( ON ?AUTO_1237 ?AUTO_1233 ) ( CLEAR ?AUTO_1237 ) ( ON ?AUTO_1235 ?AUTO_1229 ) ( CLEAR ?AUTO_1235 ) ( HOLDING ?AUTO_1236 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1236 )
      ( MAKE-ON ?AUTO_1229 ?AUTO_1230 )
      ( MAKE-ON-VERIFY ?AUTO_1229 ?AUTO_1230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1396 - BLOCK
      ?AUTO_1397 - BLOCK
    )
    :vars
    (
      ?AUTO_1402 - BLOCK
      ?AUTO_1398 - BLOCK
      ?AUTO_1399 - BLOCK
      ?AUTO_1403 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1396 ?AUTO_1402 ) ( CLEAR ?AUTO_1396 ) ( CLEAR ?AUTO_1398 ) ( ON ?AUTO_1399 ?AUTO_1397 ) ( CLEAR ?AUTO_1399 ) ( HOLDING ?AUTO_1403 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1403 )
      ( MAKE-ON ?AUTO_1396 ?AUTO_1397 )
      ( MAKE-ON-VERIFY ?AUTO_1396 ?AUTO_1397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1423 - BLOCK
      ?AUTO_1424 - BLOCK
    )
    :vars
    (
      ?AUTO_1428 - BLOCK
      ?AUTO_1429 - BLOCK
      ?AUTO_1425 - BLOCK
      ?AUTO_1427 - BLOCK
      ?AUTO_1431 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1423 ?AUTO_1428 ) ( CLEAR ?AUTO_1429 ) ( ON ?AUTO_1425 ?AUTO_1424 ) ( ON ?AUTO_1427 ?AUTO_1425 ) ( CLEAR ?AUTO_1427 ) ( ON ?AUTO_1431 ?AUTO_1423 ) ( CLEAR ?AUTO_1431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1431 ?AUTO_1423 )
      ( MAKE-ON ?AUTO_1423 ?AUTO_1424 )
      ( MAKE-ON-VERIFY ?AUTO_1423 ?AUTO_1424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1434 - BLOCK
      ?AUTO_1435 - BLOCK
    )
    :vars
    (
      ?AUTO_1436 - BLOCK
      ?AUTO_1439 - BLOCK
      ?AUTO_1440 - BLOCK
      ?AUTO_1442 - BLOCK
      ?AUTO_1441 - BLOCK
      ?AUTO_1443 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1434 ?AUTO_1436 ) ( CLEAR ?AUTO_1439 ) ( ON ?AUTO_1440 ?AUTO_1435 ) ( ON ?AUTO_1442 ?AUTO_1440 ) ( CLEAR ?AUTO_1442 ) ( ON ?AUTO_1441 ?AUTO_1434 ) ( CLEAR ?AUTO_1441 ) ( HOLDING ?AUTO_1443 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1443 )
      ( MAKE-ON ?AUTO_1434 ?AUTO_1435 )
      ( MAKE-ON-VERIFY ?AUTO_1434 ?AUTO_1435 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1444 - BLOCK
      ?AUTO_1445 - BLOCK
    )
    :vars
    (
      ?AUTO_1450 - BLOCK
      ?AUTO_1451 - BLOCK
      ?AUTO_1452 - BLOCK
      ?AUTO_1446 - BLOCK
      ?AUTO_1447 - BLOCK
      ?AUTO_1453 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1444 ?AUTO_1450 ) ( CLEAR ?AUTO_1451 ) ( ON ?AUTO_1452 ?AUTO_1445 ) ( ON ?AUTO_1446 ?AUTO_1452 ) ( CLEAR ?AUTO_1446 ) ( ON ?AUTO_1447 ?AUTO_1444 ) ( ON ?AUTO_1453 ?AUTO_1447 ) ( CLEAR ?AUTO_1453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1453 ?AUTO_1447 )
      ( MAKE-ON ?AUTO_1444 ?AUTO_1445 )
      ( MAKE-ON-VERIFY ?AUTO_1444 ?AUTO_1445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1492 - BLOCK
      ?AUTO_1493 - BLOCK
    )
    :vars
    (
      ?AUTO_1495 - BLOCK
      ?AUTO_1498 - BLOCK
      ?AUTO_1496 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1492 ?AUTO_1495 ) ( ON ?AUTO_1498 ?AUTO_1493 ) ( CLEAR ?AUTO_1498 ) ( ON ?AUTO_1496 ?AUTO_1492 ) ( CLEAR ?AUTO_1496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1496 ?AUTO_1492 )
      ( MAKE-ON ?AUTO_1492 ?AUTO_1493 )
      ( MAKE-ON-VERIFY ?AUTO_1492 ?AUTO_1493 ) )
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
      ?AUTO_1507 - BLOCK
      ?AUTO_1503 - BLOCK
      ?AUTO_1508 - BLOCK
      ?AUTO_1509 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1501 ?AUTO_1505 ) ( ON ?AUTO_1507 ?AUTO_1502 ) ( CLEAR ?AUTO_1507 ) ( ON ?AUTO_1503 ?AUTO_1501 ) ( CLEAR ?AUTO_1503 ) ( HOLDING ?AUTO_1508 ) ( CLEAR ?AUTO_1509 ) )
    :subtasks
    ( ( !STACK ?AUTO_1508 ?AUTO_1509 )
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
      ?AUTO_1514 - BLOCK
      ?AUTO_1513 - BLOCK
      ?AUTO_1517 - BLOCK
      ?AUTO_1518 - BLOCK
      ?AUTO_1512 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1510 ?AUTO_1514 ) ( ON ?AUTO_1513 ?AUTO_1511 ) ( CLEAR ?AUTO_1513 ) ( ON ?AUTO_1517 ?AUTO_1510 ) ( CLEAR ?AUTO_1518 ) ( ON ?AUTO_1512 ?AUTO_1517 ) ( CLEAR ?AUTO_1512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1512 ?AUTO_1517 )
      ( MAKE-ON ?AUTO_1510 ?AUTO_1511 )
      ( MAKE-ON-VERIFY ?AUTO_1510 ?AUTO_1511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1521 - BLOCK
      ?AUTO_1522 - BLOCK
    )
    :vars
    (
      ?AUTO_1528 - BLOCK
      ?AUTO_1527 - BLOCK
      ?AUTO_1523 - BLOCK
      ?AUTO_1529 - BLOCK
      ?AUTO_1524 - BLOCK
      ?AUTO_1530 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1521 ?AUTO_1528 ) ( ON ?AUTO_1527 ?AUTO_1522 ) ( CLEAR ?AUTO_1527 ) ( ON ?AUTO_1523 ?AUTO_1521 ) ( CLEAR ?AUTO_1529 ) ( ON ?AUTO_1524 ?AUTO_1523 ) ( CLEAR ?AUTO_1524 ) ( HOLDING ?AUTO_1530 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1530 )
      ( MAKE-ON ?AUTO_1521 ?AUTO_1522 )
      ( MAKE-ON-VERIFY ?AUTO_1521 ?AUTO_1522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1531 - BLOCK
      ?AUTO_1532 - BLOCK
    )
    :vars
    (
      ?AUTO_1538 - BLOCK
      ?AUTO_1539 - BLOCK
      ?AUTO_1534 - BLOCK
      ?AUTO_1535 - BLOCK
      ?AUTO_1533 - BLOCK
      ?AUTO_1540 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1531 ?AUTO_1538 ) ( ON ?AUTO_1539 ?AUTO_1532 ) ( CLEAR ?AUTO_1539 ) ( ON ?AUTO_1534 ?AUTO_1531 ) ( CLEAR ?AUTO_1535 ) ( ON ?AUTO_1533 ?AUTO_1534 ) ( ON ?AUTO_1540 ?AUTO_1533 ) ( CLEAR ?AUTO_1540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1540 ?AUTO_1533 )
      ( MAKE-ON ?AUTO_1531 ?AUTO_1532 )
      ( MAKE-ON-VERIFY ?AUTO_1531 ?AUTO_1532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1543 - BLOCK
      ?AUTO_1544 - BLOCK
    )
    :vars
    (
      ?AUTO_1547 - BLOCK
      ?AUTO_1552 - BLOCK
      ?AUTO_1550 - BLOCK
      ?AUTO_1551 - BLOCK
      ?AUTO_1545 - BLOCK
      ?AUTO_1549 - BLOCK
      ?AUTO_1553 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1543 ?AUTO_1547 ) ( ON ?AUTO_1552 ?AUTO_1544 ) ( CLEAR ?AUTO_1552 ) ( ON ?AUTO_1550 ?AUTO_1543 ) ( CLEAR ?AUTO_1551 ) ( ON ?AUTO_1545 ?AUTO_1550 ) ( ON ?AUTO_1549 ?AUTO_1545 ) ( CLEAR ?AUTO_1549 ) ( HOLDING ?AUTO_1553 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1553 )
      ( MAKE-ON ?AUTO_1543 ?AUTO_1544 )
      ( MAKE-ON-VERIFY ?AUTO_1543 ?AUTO_1544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1554 - BLOCK
      ?AUTO_1555 - BLOCK
    )
    :vars
    (
      ?AUTO_1564 - BLOCK
      ?AUTO_1557 - BLOCK
      ?AUTO_1561 - BLOCK
      ?AUTO_1558 - BLOCK
      ?AUTO_1556 - BLOCK
      ?AUTO_1562 - BLOCK
      ?AUTO_1563 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1554 ?AUTO_1564 ) ( ON ?AUTO_1557 ?AUTO_1555 ) ( ON ?AUTO_1561 ?AUTO_1554 ) ( CLEAR ?AUTO_1558 ) ( ON ?AUTO_1556 ?AUTO_1561 ) ( ON ?AUTO_1562 ?AUTO_1556 ) ( CLEAR ?AUTO_1562 ) ( ON ?AUTO_1563 ?AUTO_1557 ) ( CLEAR ?AUTO_1563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1563 ?AUTO_1557 )
      ( MAKE-ON ?AUTO_1554 ?AUTO_1555 )
      ( MAKE-ON-VERIFY ?AUTO_1554 ?AUTO_1555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1567 - BLOCK
      ?AUTO_1568 - BLOCK
    )
    :vars
    (
      ?AUTO_1572 - BLOCK
      ?AUTO_1569 - BLOCK
      ?AUTO_1571 - BLOCK
      ?AUTO_1573 - BLOCK
      ?AUTO_1575 - BLOCK
      ?AUTO_1576 - BLOCK
      ?AUTO_1574 - BLOCK
      ?AUTO_1578 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1567 ?AUTO_1572 ) ( ON ?AUTO_1569 ?AUTO_1568 ) ( ON ?AUTO_1571 ?AUTO_1567 ) ( CLEAR ?AUTO_1573 ) ( ON ?AUTO_1575 ?AUTO_1571 ) ( ON ?AUTO_1576 ?AUTO_1575 ) ( CLEAR ?AUTO_1576 ) ( ON ?AUTO_1574 ?AUTO_1569 ) ( CLEAR ?AUTO_1574 ) ( HOLDING ?AUTO_1578 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1578 )
      ( MAKE-ON ?AUTO_1567 ?AUTO_1568 )
      ( MAKE-ON-VERIFY ?AUTO_1567 ?AUTO_1568 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1579 - BLOCK
      ?AUTO_1580 - BLOCK
    )
    :vars
    (
      ?AUTO_1588 - BLOCK
      ?AUTO_1583 - BLOCK
      ?AUTO_1587 - BLOCK
      ?AUTO_1585 - BLOCK
      ?AUTO_1589 - BLOCK
      ?AUTO_1582 - BLOCK
      ?AUTO_1581 - BLOCK
      ?AUTO_1590 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1579 ?AUTO_1588 ) ( ON ?AUTO_1583 ?AUTO_1580 ) ( ON ?AUTO_1587 ?AUTO_1579 ) ( CLEAR ?AUTO_1585 ) ( ON ?AUTO_1589 ?AUTO_1587 ) ( ON ?AUTO_1582 ?AUTO_1589 ) ( CLEAR ?AUTO_1582 ) ( ON ?AUTO_1581 ?AUTO_1583 ) ( ON ?AUTO_1590 ?AUTO_1581 ) ( CLEAR ?AUTO_1590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1590 ?AUTO_1581 )
      ( MAKE-ON ?AUTO_1579 ?AUTO_1580 )
      ( MAKE-ON-VERIFY ?AUTO_1579 ?AUTO_1580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1669 - BLOCK
      ?AUTO_1670 - BLOCK
    )
    :vars
    (
      ?AUTO_1673 - BLOCK
      ?AUTO_1674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1670 ) ( ON-TABLE ?AUTO_1669 ) ( ON ?AUTO_1673 ?AUTO_1669 ) ( CLEAR ?AUTO_1673 ) ( HOLDING ?AUTO_1674 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1674 )
      ( MAKE-ON ?AUTO_1669 ?AUTO_1670 )
      ( MAKE-ON-VERIFY ?AUTO_1669 ?AUTO_1670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1722 - BLOCK
      ?AUTO_1723 - BLOCK
    )
    :vars
    (
      ?AUTO_1727 - BLOCK
      ?AUTO_1728 - BLOCK
      ?AUTO_1729 - BLOCK
      ?AUTO_1726 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1722 ?AUTO_1727 ) ( CLEAR ?AUTO_1728 ) ( ON ?AUTO_1729 ?AUTO_1722 ) ( CLEAR ?AUTO_1729 ) ( ON ?AUTO_1726 ?AUTO_1723 ) ( CLEAR ?AUTO_1726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1726 ?AUTO_1723 )
      ( MAKE-ON ?AUTO_1722 ?AUTO_1723 )
      ( MAKE-ON-VERIFY ?AUTO_1722 ?AUTO_1723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1732 - BLOCK
      ?AUTO_1733 - BLOCK
    )
    :vars
    (
      ?AUTO_1736 - BLOCK
      ?AUTO_1734 - BLOCK
      ?AUTO_1735 - BLOCK
      ?AUTO_1737 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1732 ?AUTO_1736 ) ( ON ?AUTO_1734 ?AUTO_1732 ) ( CLEAR ?AUTO_1734 ) ( ON ?AUTO_1735 ?AUTO_1733 ) ( CLEAR ?AUTO_1735 ) ( HOLDING ?AUTO_1737 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1737 )
      ( MAKE-ON ?AUTO_1732 ?AUTO_1733 )
      ( MAKE-ON-VERIFY ?AUTO_1732 ?AUTO_1733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1801 - BLOCK
      ?AUTO_1802 - BLOCK
    )
    :vars
    (
      ?AUTO_1803 - BLOCK
      ?AUTO_1804 - BLOCK
      ?AUTO_1808 - BLOCK
      ?AUTO_1806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1801 ) ( ON ?AUTO_1803 ?AUTO_1801 ) ( CLEAR ?AUTO_1804 ) ( ON ?AUTO_1808 ?AUTO_1803 ) ( CLEAR ?AUTO_1808 ) ( ON ?AUTO_1806 ?AUTO_1802 ) ( CLEAR ?AUTO_1806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1806 ?AUTO_1802 )
      ( MAKE-ON ?AUTO_1801 ?AUTO_1802 )
      ( MAKE-ON-VERIFY ?AUTO_1801 ?AUTO_1802 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1926 - BLOCK
      ?AUTO_1927 - BLOCK
    )
    :vars
    (
      ?AUTO_1928 - BLOCK
      ?AUTO_1931 - BLOCK
      ?AUTO_1932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1926 ) ( ON ?AUTO_1928 ?AUTO_1926 ) ( CLEAR ?AUTO_1928 ) ( ON ?AUTO_1931 ?AUTO_1927 ) ( ON ?AUTO_1932 ?AUTO_1931 ) ( CLEAR ?AUTO_1932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1932 ?AUTO_1931 )
      ( MAKE-ON ?AUTO_1926 ?AUTO_1927 )
      ( MAKE-ON-VERIFY ?AUTO_1926 ?AUTO_1927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2037 - BLOCK
      ?AUTO_2038 - BLOCK
    )
    :vars
    (
      ?AUTO_2039 - BLOCK
      ?AUTO_2041 - BLOCK
      ?AUTO_2040 - BLOCK
      ?AUTO_2045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2038 ) ( ON ?AUTO_2037 ?AUTO_2039 ) ( ON ?AUTO_2041 ?AUTO_2037 ) ( CLEAR ?AUTO_2041 ) ( HOLDING ?AUTO_2040 ) ( CLEAR ?AUTO_2045 ) )
    :subtasks
    ( ( !STACK ?AUTO_2040 ?AUTO_2045 )
      ( MAKE-ON ?AUTO_2037 ?AUTO_2038 )
      ( MAKE-ON-VERIFY ?AUTO_2037 ?AUTO_2038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2056 - BLOCK
      ?AUTO_2057 - BLOCK
    )
    :vars
    (
      ?AUTO_2058 - BLOCK
      ?AUTO_2061 - BLOCK
      ?AUTO_2062 - BLOCK
      ?AUTO_2060 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2056 ?AUTO_2058 ) ( ON ?AUTO_2061 ?AUTO_2056 ) ( CLEAR ?AUTO_2062 ) ( ON ?AUTO_2060 ?AUTO_2061 ) ( CLEAR ?AUTO_2060 ) ( HOLDING ?AUTO_2057 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2057 )
      ( MAKE-ON ?AUTO_2056 ?AUTO_2057 )
      ( MAKE-ON-VERIFY ?AUTO_2056 ?AUTO_2057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2523 - BLOCK
      ?AUTO_2524 - BLOCK
    )
    :vars
    (
      ?AUTO_2527 - BLOCK
      ?AUTO_2526 - BLOCK
      ?AUTO_2528 - BLOCK
      ?AUTO_2529 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2524 ) ( ON ?AUTO_2523 ?AUTO_2527 ) ( ON ?AUTO_2526 ?AUTO_2523 ) ( ON ?AUTO_2528 ?AUTO_2526 ) ( ON ?AUTO_2529 ?AUTO_2528 ) ( CLEAR ?AUTO_2529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2529 ?AUTO_2528 )
      ( MAKE-ON ?AUTO_2523 ?AUTO_2524 )
      ( MAKE-ON-VERIFY ?AUTO_2523 ?AUTO_2524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2138 - BLOCK
      ?AUTO_2139 - BLOCK
    )
    :vars
    (
      ?AUTO_2141 - BLOCK
      ?AUTO_2140 - BLOCK
      ?AUTO_2145 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2138 ?AUTO_2141 ) ( ON ?AUTO_2140 ?AUTO_2138 ) ( CLEAR ?AUTO_2140 ) ( HOLDING ?AUTO_2139 ) ( CLEAR ?AUTO_2145 ) )
    :subtasks
    ( ( !STACK ?AUTO_2139 ?AUTO_2145 )
      ( MAKE-ON ?AUTO_2138 ?AUTO_2139 )
      ( MAKE-ON-VERIFY ?AUTO_2138 ?AUTO_2139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4192 - BLOCK
      ?AUTO_4193 - BLOCK
    )
    :vars
    (
      ?AUTO_4195 - BLOCK
      ?AUTO_4200 - BLOCK
      ?AUTO_4197 - BLOCK
      ?AUTO_4198 - BLOCK
      ?AUTO_4194 - BLOCK
      ?AUTO_4201 - BLOCK
      ?AUTO_4202 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4192 ?AUTO_4195 ) ( CLEAR ?AUTO_4200 ) ( ON ?AUTO_4197 ?AUTO_4192 ) ( CLEAR ?AUTO_4197 ) ( ON ?AUTO_4198 ?AUTO_4193 ) ( CLEAR ?AUTO_4194 ) ( ON ?AUTO_4201 ?AUTO_4198 ) ( ON ?AUTO_4202 ?AUTO_4201 ) ( CLEAR ?AUTO_4202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4202 ?AUTO_4201 )
      ( MAKE-ON ?AUTO_4192 ?AUTO_4193 )
      ( MAKE-ON-VERIFY ?AUTO_4192 ?AUTO_4193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2305 - BLOCK
      ?AUTO_2306 - BLOCK
    )
    :vars
    (
      ?AUTO_2308 - BLOCK
      ?AUTO_2307 - BLOCK
      ?AUTO_2311 - BLOCK
      ?AUTO_2313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2305 ) ( CLEAR ?AUTO_2308 ) ( ON ?AUTO_2307 ?AUTO_2305 ) ( ON ?AUTO_2306 ?AUTO_2307 ) ( CLEAR ?AUTO_2306 ) ( HOLDING ?AUTO_2311 ) ( CLEAR ?AUTO_2313 ) )
    :subtasks
    ( ( !STACK ?AUTO_2311 ?AUTO_2313 )
      ( MAKE-ON ?AUTO_2305 ?AUTO_2306 )
      ( MAKE-ON-VERIFY ?AUTO_2305 ?AUTO_2306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5643 - BLOCK
      ?AUTO_5644 - BLOCK
    )
    :vars
    (
      ?AUTO_5650 - BLOCK
      ?AUTO_5648 - BLOCK
      ?AUTO_5652 - BLOCK
      ?AUTO_5649 - BLOCK
      ?AUTO_5651 - BLOCK
      ?AUTO_5647 - BLOCK
      ?AUTO_5653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5643 ) ( ON ?AUTO_5650 ?AUTO_5643 ) ( CLEAR ?AUTO_5648 ) ( ON ?AUTO_5652 ?AUTO_5650 ) ( ON ?AUTO_5649 ?AUTO_5652 ) ( CLEAR ?AUTO_5649 ) ( CLEAR ?AUTO_5651 ) ( ON ?AUTO_5647 ?AUTO_5644 ) ( CLEAR ?AUTO_5647 ) ( HOLDING ?AUTO_5653 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5653 )
      ( MAKE-ON ?AUTO_5643 ?AUTO_5644 )
      ( MAKE-ON-VERIFY ?AUTO_5643 ?AUTO_5644 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2333 - BLOCK
      ?AUTO_2334 - BLOCK
    )
    :vars
    (
      ?AUTO_2335 - BLOCK
      ?AUTO_2340 - BLOCK
      ?AUTO_2339 - BLOCK
      ?AUTO_2336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2333 ) ( ON ?AUTO_2335 ?AUTO_2333 ) ( ON ?AUTO_2334 ?AUTO_2335 ) ( CLEAR ?AUTO_2340 ) ( ON ?AUTO_2339 ?AUTO_2334 ) ( ON ?AUTO_2336 ?AUTO_2339 ) ( CLEAR ?AUTO_2336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2336 ?AUTO_2339 )
      ( MAKE-ON ?AUTO_2333 ?AUTO_2334 )
      ( MAKE-ON-VERIFY ?AUTO_2333 ?AUTO_2334 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2380 - BLOCK
    )
    :vars
    (
      ?AUTO_2382 - BLOCK
      ?AUTO_2383 - BLOCK
      ?AUTO_2384 - BLOCK
      ?AUTO_2381 - BLOCK
      ?AUTO_2386 - BLOCK
      ?AUTO_2387 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2380 ?AUTO_2382 ) ( CLEAR ?AUTO_2383 ) ( ON ?AUTO_2384 ?AUTO_2380 ) ( ON ?AUTO_2381 ?AUTO_2384 ) ( CLEAR ?AUTO_2381 ) ( HOLDING ?AUTO_2386 ) ( CLEAR ?AUTO_2387 ) )
    :subtasks
    ( ( !STACK ?AUTO_2386 ?AUTO_2387 )
      ( MAKE-ON-TABLE ?AUTO_2380 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2515 - BLOCK
      ?AUTO_2516 - BLOCK
    )
    :vars
    (
      ?AUTO_2519 - BLOCK
      ?AUTO_2521 - BLOCK
      ?AUTO_2520 - BLOCK
      ?AUTO_2522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2516 ) ( ON ?AUTO_2515 ?AUTO_2519 ) ( ON ?AUTO_2521 ?AUTO_2515 ) ( ON ?AUTO_2520 ?AUTO_2521 ) ( CLEAR ?AUTO_2520 ) ( HOLDING ?AUTO_2522 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2522 )
      ( MAKE-ON ?AUTO_2515 ?AUTO_2516 )
      ( MAKE-ON-VERIFY ?AUTO_2515 ?AUTO_2516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2533 - BLOCK
      ?AUTO_2534 - BLOCK
    )
    :vars
    (
      ?AUTO_2539 - BLOCK
      ?AUTO_2536 - BLOCK
      ?AUTO_2535 - BLOCK
      ?AUTO_2537 - BLOCK
      ?AUTO_2542 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2533 ?AUTO_2539 ) ( ON ?AUTO_2536 ?AUTO_2533 ) ( ON ?AUTO_2535 ?AUTO_2536 ) ( ON ?AUTO_2537 ?AUTO_2535 ) ( CLEAR ?AUTO_2537 ) ( HOLDING ?AUTO_2534 ) ( CLEAR ?AUTO_2542 ) )
    :subtasks
    ( ( !STACK ?AUTO_2534 ?AUTO_2542 )
      ( MAKE-ON ?AUTO_2533 ?AUTO_2534 )
      ( MAKE-ON-VERIFY ?AUTO_2533 ?AUTO_2534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2583 - BLOCK
      ?AUTO_2584 - BLOCK
    )
    :vars
    (
      ?AUTO_2586 - BLOCK
      ?AUTO_2587 - BLOCK
      ?AUTO_2589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2583 ) ( CLEAR ?AUTO_2586 ) ( ON ?AUTO_2584 ?AUTO_2583 ) ( ON ?AUTO_2587 ?AUTO_2584 ) ( CLEAR ?AUTO_2587 ) ( HOLDING ?AUTO_2589 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2589 )
      ( MAKE-ON ?AUTO_2583 ?AUTO_2584 )
      ( MAKE-ON-VERIFY ?AUTO_2583 ?AUTO_2584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5654 - BLOCK
      ?AUTO_5655 - BLOCK
    )
    :vars
    (
      ?AUTO_5661 - BLOCK
      ?AUTO_5656 - BLOCK
      ?AUTO_5664 - BLOCK
      ?AUTO_5659 - BLOCK
      ?AUTO_5662 - BLOCK
      ?AUTO_5657 - BLOCK
      ?AUTO_5663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5654 ) ( ON ?AUTO_5661 ?AUTO_5654 ) ( CLEAR ?AUTO_5656 ) ( ON ?AUTO_5664 ?AUTO_5661 ) ( ON ?AUTO_5659 ?AUTO_5664 ) ( CLEAR ?AUTO_5659 ) ( CLEAR ?AUTO_5662 ) ( ON ?AUTO_5657 ?AUTO_5655 ) ( ON ?AUTO_5663 ?AUTO_5657 ) ( CLEAR ?AUTO_5663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5663 ?AUTO_5657 )
      ( MAKE-ON ?AUTO_5654 ?AUTO_5655 )
      ( MAKE-ON-VERIFY ?AUTO_5654 ?AUTO_5655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5667 - BLOCK
      ?AUTO_5668 - BLOCK
    )
    :vars
    (
      ?AUTO_5671 - BLOCK
      ?AUTO_5669 - BLOCK
      ?AUTO_5676 - BLOCK
      ?AUTO_5677 - BLOCK
      ?AUTO_5675 - BLOCK
      ?AUTO_5670 - BLOCK
      ?AUTO_5672 - BLOCK
      ?AUTO_5678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5667 ) ( ON ?AUTO_5671 ?AUTO_5667 ) ( CLEAR ?AUTO_5669 ) ( ON ?AUTO_5676 ?AUTO_5671 ) ( ON ?AUTO_5677 ?AUTO_5676 ) ( CLEAR ?AUTO_5677 ) ( CLEAR ?AUTO_5675 ) ( ON ?AUTO_5670 ?AUTO_5668 ) ( ON ?AUTO_5672 ?AUTO_5670 ) ( CLEAR ?AUTO_5672 ) ( HOLDING ?AUTO_5678 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5678 )
      ( MAKE-ON ?AUTO_5667 ?AUTO_5668 )
      ( MAKE-ON-VERIFY ?AUTO_5667 ?AUTO_5668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3683 - BLOCK
      ?AUTO_3684 - BLOCK
    )
    :vars
    (
      ?AUTO_3686 - BLOCK
      ?AUTO_3689 - BLOCK
      ?AUTO_3692 - BLOCK
      ?AUTO_3685 - BLOCK
      ?AUTO_3693 - BLOCK
      ?AUTO_3687 - BLOCK
      ?AUTO_3694 - BLOCK
      ?AUTO_3688 - BLOCK
      ?AUTO_3695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3683 ) ( CLEAR ?AUTO_3686 ) ( ON ?AUTO_3689 ?AUTO_3684 ) ( ON ?AUTO_3692 ?AUTO_3689 ) ( ON ?AUTO_3685 ?AUTO_3692 ) ( CLEAR ?AUTO_3685 ) ( CLEAR ?AUTO_3693 ) ( ON ?AUTO_3687 ?AUTO_3683 ) ( ON ?AUTO_3694 ?AUTO_3687 ) ( ON ?AUTO_3688 ?AUTO_3694 ) ( ON ?AUTO_3695 ?AUTO_3688 ) ( CLEAR ?AUTO_3695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3695 ?AUTO_3688 )
      ( MAKE-ON ?AUTO_3683 ?AUTO_3684 )
      ( MAKE-ON-VERIFY ?AUTO_3683 ?AUTO_3684 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2617 - BLOCK
      ?AUTO_2618 - BLOCK
    )
    :vars
    (
      ?AUTO_2624 - BLOCK
      ?AUTO_2620 - BLOCK
      ?AUTO_2622 - BLOCK
      ?AUTO_2621 - BLOCK
      ?AUTO_2626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2617 ) ( ON ?AUTO_2618 ?AUTO_2617 ) ( ON ?AUTO_2624 ?AUTO_2618 ) ( ON ?AUTO_2620 ?AUTO_2624 ) ( ON ?AUTO_2622 ?AUTO_2620 ) ( CLEAR ?AUTO_2622 ) ( HOLDING ?AUTO_2621 ) ( CLEAR ?AUTO_2626 ) )
    :subtasks
    ( ( !STACK ?AUTO_2621 ?AUTO_2626 )
      ( MAKE-ON ?AUTO_2617 ?AUTO_2618 )
      ( MAKE-ON-VERIFY ?AUTO_2617 ?AUTO_2618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2678 - BLOCK
      ?AUTO_2679 - BLOCK
    )
    :vars
    (
      ?AUTO_2684 - BLOCK
      ?AUTO_2683 - BLOCK
      ?AUTO_2682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2684 ) ( ON ?AUTO_2683 ?AUTO_2679 ) ( ON ?AUTO_2682 ?AUTO_2683 ) ( CLEAR ?AUTO_2682 ) ( HOLDING ?AUTO_2678 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2678 )
      ( MAKE-ON ?AUTO_2678 ?AUTO_2679 )
      ( MAKE-ON-VERIFY ?AUTO_2678 ?AUTO_2679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2989 - BLOCK
      ?AUTO_2990 - BLOCK
    )
    :vars
    (
      ?AUTO_2997 - BLOCK
      ?AUTO_2992 - BLOCK
      ?AUTO_2995 - BLOCK
      ?AUTO_2994 - BLOCK
      ?AUTO_2991 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2989 ?AUTO_2997 ) ( CLEAR ?AUTO_2989 ) ( CLEAR ?AUTO_2992 ) ( ON ?AUTO_2995 ?AUTO_2990 ) ( ON ?AUTO_2994 ?AUTO_2995 ) ( ON ?AUTO_2991 ?AUTO_2994 ) ( CLEAR ?AUTO_2991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2991 ?AUTO_2994 )
      ( MAKE-ON ?AUTO_2989 ?AUTO_2990 )
      ( MAKE-ON-VERIFY ?AUTO_2989 ?AUTO_2990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3000 - BLOCK
      ?AUTO_3001 - BLOCK
    )
    :vars
    (
      ?AUTO_3007 - BLOCK
      ?AUTO_3008 - BLOCK
      ?AUTO_3003 - BLOCK
      ?AUTO_3006 - BLOCK
      ?AUTO_3005 - BLOCK
      ?AUTO_3009 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3000 ?AUTO_3007 ) ( CLEAR ?AUTO_3000 ) ( CLEAR ?AUTO_3008 ) ( ON ?AUTO_3003 ?AUTO_3001 ) ( ON ?AUTO_3006 ?AUTO_3003 ) ( ON ?AUTO_3005 ?AUTO_3006 ) ( CLEAR ?AUTO_3005 ) ( HOLDING ?AUTO_3009 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3009 )
      ( MAKE-ON ?AUTO_3000 ?AUTO_3001 )
      ( MAKE-ON-VERIFY ?AUTO_3000 ?AUTO_3001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3983 - BLOCK
      ?AUTO_3981 - BLOCK
    )
    :vars
    (
      ?AUTO_3990 - BLOCK
      ?AUTO_3989 - BLOCK
      ?AUTO_3985 - BLOCK
      ?AUTO_3984 - BLOCK
      ?AUTO_3988 - BLOCK
      ?AUTO_3982 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3983 ?AUTO_3990 ) ( ON ?AUTO_3989 ?AUTO_3981 ) ( ON ?AUTO_3985 ?AUTO_3989 ) ( ON ?AUTO_3984 ?AUTO_3985 ) ( ON ?AUTO_3988 ?AUTO_3984 ) ( CLEAR ?AUTO_3988 ) ( ON ?AUTO_3982 ?AUTO_3983 ) ( CLEAR ?AUTO_3982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3982 ?AUTO_3983 )
      ( MAKE-ON ?AUTO_3983 ?AUTO_3981 )
      ( MAKE-ON-VERIFY ?AUTO_3983 ?AUTO_3981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2713 - BLOCK
      ?AUTO_2714 - BLOCK
    )
    :vars
    (
      ?AUTO_2718 - BLOCK
      ?AUTO_2720 - BLOCK
      ?AUTO_2717 - BLOCK
      ?AUTO_2715 - BLOCK
      ?AUTO_2722 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2718 ?AUTO_2714 ) ( ON ?AUTO_2720 ?AUTO_2718 ) ( ON ?AUTO_2713 ?AUTO_2720 ) ( ON ?AUTO_2717 ?AUTO_2713 ) ( CLEAR ?AUTO_2717 ) ( HOLDING ?AUTO_2715 ) ( CLEAR ?AUTO_2722 ) )
    :subtasks
    ( ( !STACK ?AUTO_2715 ?AUTO_2722 )
      ( MAKE-ON ?AUTO_2713 ?AUTO_2714 )
      ( MAKE-ON-VERIFY ?AUTO_2713 ?AUTO_2714 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3010 - BLOCK
      ?AUTO_3011 - BLOCK
    )
    :vars
    (
      ?AUTO_3012 - BLOCK
      ?AUTO_3017 - BLOCK
      ?AUTO_3014 - BLOCK
      ?AUTO_3016 - BLOCK
      ?AUTO_3018 - BLOCK
      ?AUTO_3019 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3010 ?AUTO_3012 ) ( CLEAR ?AUTO_3010 ) ( CLEAR ?AUTO_3017 ) ( ON ?AUTO_3014 ?AUTO_3011 ) ( ON ?AUTO_3016 ?AUTO_3014 ) ( ON ?AUTO_3018 ?AUTO_3016 ) ( ON ?AUTO_3019 ?AUTO_3018 ) ( CLEAR ?AUTO_3019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3019 ?AUTO_3018 )
      ( MAKE-ON ?AUTO_3010 ?AUTO_3011 )
      ( MAKE-ON-VERIFY ?AUTO_3010 ?AUTO_3011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3570 - BLOCK
      ?AUTO_3571 - BLOCK
    )
    :vars
    (
      ?AUTO_3573 - BLOCK
      ?AUTO_3572 - BLOCK
      ?AUTO_3576 - BLOCK
      ?AUTO_3577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3570 ) ( CLEAR ?AUTO_3573 ) ( ON ?AUTO_3572 ?AUTO_3571 ) ( ON ?AUTO_3576 ?AUTO_3572 ) ( CLEAR ?AUTO_3576 ) ( HOLDING ?AUTO_3577 ) ( CLEAR ?AUTO_3570 ) )
    :subtasks
    ( ( !STACK ?AUTO_3577 ?AUTO_3570 )
      ( MAKE-ON ?AUTO_3570 ?AUTO_3571 )
      ( MAKE-ON-VERIFY ?AUTO_3570 ?AUTO_3571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3631 - BLOCK
      ?AUTO_3632 - BLOCK
    )
    :vars
    (
      ?AUTO_3635 - BLOCK
      ?AUTO_3633 - BLOCK
      ?AUTO_3637 - BLOCK
      ?AUTO_3640 - BLOCK
      ?AUTO_3641 - BLOCK
      ?AUTO_3634 - BLOCK
      ?AUTO_3639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3631 ) ( CLEAR ?AUTO_3635 ) ( ON ?AUTO_3633 ?AUTO_3632 ) ( ON ?AUTO_3637 ?AUTO_3633 ) ( ON ?AUTO_3640 ?AUTO_3637 ) ( CLEAR ?AUTO_3640 ) ( CLEAR ?AUTO_3641 ) ( ON ?AUTO_3634 ?AUTO_3631 ) ( ON ?AUTO_3639 ?AUTO_3634 ) ( CLEAR ?AUTO_3639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3639 ?AUTO_3634 )
      ( MAKE-ON ?AUTO_3631 ?AUTO_3632 )
      ( MAKE-ON-VERIFY ?AUTO_3631 ?AUTO_3632 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3644 - BLOCK
      ?AUTO_3645 - BLOCK
    )
    :vars
    (
      ?AUTO_3649 - BLOCK
      ?AUTO_3652 - BLOCK
      ?AUTO_3648 - BLOCK
      ?AUTO_3647 - BLOCK
      ?AUTO_3646 - BLOCK
      ?AUTO_3651 - BLOCK
      ?AUTO_3654 - BLOCK
      ?AUTO_3655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3644 ) ( CLEAR ?AUTO_3649 ) ( ON ?AUTO_3652 ?AUTO_3645 ) ( ON ?AUTO_3648 ?AUTO_3652 ) ( ON ?AUTO_3647 ?AUTO_3648 ) ( CLEAR ?AUTO_3647 ) ( CLEAR ?AUTO_3646 ) ( ON ?AUTO_3651 ?AUTO_3644 ) ( ON ?AUTO_3654 ?AUTO_3651 ) ( CLEAR ?AUTO_3654 ) ( HOLDING ?AUTO_3655 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3655 )
      ( MAKE-ON ?AUTO_3644 ?AUTO_3645 )
      ( MAKE-ON-VERIFY ?AUTO_3644 ?AUTO_3645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3656 - BLOCK
      ?AUTO_3657 - BLOCK
    )
    :vars
    (
      ?AUTO_3664 - BLOCK
      ?AUTO_3665 - BLOCK
      ?AUTO_3666 - BLOCK
      ?AUTO_3660 - BLOCK
      ?AUTO_3663 - BLOCK
      ?AUTO_3662 - BLOCK
      ?AUTO_3659 - BLOCK
      ?AUTO_3667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3656 ) ( CLEAR ?AUTO_3664 ) ( ON ?AUTO_3665 ?AUTO_3657 ) ( ON ?AUTO_3666 ?AUTO_3665 ) ( ON ?AUTO_3660 ?AUTO_3666 ) ( CLEAR ?AUTO_3660 ) ( CLEAR ?AUTO_3663 ) ( ON ?AUTO_3662 ?AUTO_3656 ) ( ON ?AUTO_3659 ?AUTO_3662 ) ( ON ?AUTO_3667 ?AUTO_3659 ) ( CLEAR ?AUTO_3667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3667 ?AUTO_3659 )
      ( MAKE-ON ?AUTO_3656 ?AUTO_3657 )
      ( MAKE-ON-VERIFY ?AUTO_3656 ?AUTO_3657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3670 - BLOCK
      ?AUTO_3671 - BLOCK
    )
    :vars
    (
      ?AUTO_3672 - BLOCK
      ?AUTO_3677 - BLOCK
      ?AUTO_3676 - BLOCK
      ?AUTO_3681 - BLOCK
      ?AUTO_3674 - BLOCK
      ?AUTO_3680 - BLOCK
      ?AUTO_3675 - BLOCK
      ?AUTO_3678 - BLOCK
      ?AUTO_3682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3670 ) ( CLEAR ?AUTO_3672 ) ( ON ?AUTO_3677 ?AUTO_3671 ) ( ON ?AUTO_3676 ?AUTO_3677 ) ( ON ?AUTO_3681 ?AUTO_3676 ) ( CLEAR ?AUTO_3681 ) ( CLEAR ?AUTO_3674 ) ( ON ?AUTO_3680 ?AUTO_3670 ) ( ON ?AUTO_3675 ?AUTO_3680 ) ( ON ?AUTO_3678 ?AUTO_3675 ) ( CLEAR ?AUTO_3678 ) ( HOLDING ?AUTO_3682 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3682 )
      ( MAKE-ON ?AUTO_3670 ?AUTO_3671 )
      ( MAKE-ON-VERIFY ?AUTO_3670 ?AUTO_3671 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3872 - BLOCK
    )
    :vars
    (
      ?AUTO_3874 - BLOCK
      ?AUTO_3873 - BLOCK
      ?AUTO_3877 - BLOCK
      ?AUTO_3875 - BLOCK
      ?AUTO_3876 - BLOCK
      ?AUTO_3879 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3872 ?AUTO_3874 ) ( ON ?AUTO_3873 ?AUTO_3872 ) ( CLEAR ?AUTO_3877 ) ( ON ?AUTO_3875 ?AUTO_3873 ) ( ON ?AUTO_3876 ?AUTO_3875 ) ( CLEAR ?AUTO_3876 ) ( HOLDING ?AUTO_3879 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3879 )
      ( MAKE-ON-TABLE ?AUTO_3872 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3923 - BLOCK
      ?AUTO_3924 - BLOCK
    )
    :vars
    (
      ?AUTO_3927 - BLOCK
      ?AUTO_3926 - BLOCK
      ?AUTO_3929 - BLOCK
      ?AUTO_3930 - BLOCK
      ?AUTO_3931 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3923 ?AUTO_3927 ) ( CLEAR ?AUTO_3923 ) ( ON ?AUTO_3926 ?AUTO_3924 ) ( ON ?AUTO_3929 ?AUTO_3926 ) ( CLEAR ?AUTO_3929 ) ( HOLDING ?AUTO_3930 ) ( CLEAR ?AUTO_3931 ) )
    :subtasks
    ( ( !STACK ?AUTO_3930 ?AUTO_3931 )
      ( MAKE-ON ?AUTO_3923 ?AUTO_3924 )
      ( MAKE-ON-VERIFY ?AUTO_3923 ?AUTO_3924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3969 - BLOCK
      ?AUTO_3970 - BLOCK
    )
    :vars
    (
      ?AUTO_3974 - BLOCK
      ?AUTO_3975 - BLOCK
      ?AUTO_3976 - BLOCK
      ?AUTO_3972 - BLOCK
      ?AUTO_3977 - BLOCK
      ?AUTO_3978 - BLOCK
      ?AUTO_3979 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3969 ?AUTO_3974 ) ( CLEAR ?AUTO_3969 ) ( ON ?AUTO_3975 ?AUTO_3970 ) ( ON ?AUTO_3976 ?AUTO_3975 ) ( CLEAR ?AUTO_3972 ) ( ON ?AUTO_3977 ?AUTO_3976 ) ( ON ?AUTO_3978 ?AUTO_3977 ) ( CLEAR ?AUTO_3978 ) ( HOLDING ?AUTO_3979 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3979 )
      ( MAKE-ON ?AUTO_3969 ?AUTO_3970 )
      ( MAKE-ON-VERIFY ?AUTO_3969 ?AUTO_3970 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4068 - BLOCK
      ?AUTO_4069 - BLOCK
    )
    :vars
    (
      ?AUTO_4071 - BLOCK
      ?AUTO_4074 - BLOCK
      ?AUTO_4070 - BLOCK
      ?AUTO_4073 - BLOCK
      ?AUTO_4072 - BLOCK
      ?AUTO_4077 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4069 ) ( ON ?AUTO_4068 ?AUTO_4071 ) ( ON ?AUTO_4074 ?AUTO_4068 ) ( CLEAR ?AUTO_4070 ) ( ON ?AUTO_4073 ?AUTO_4074 ) ( ON ?AUTO_4072 ?AUTO_4073 ) ( CLEAR ?AUTO_4072 ) ( HOLDING ?AUTO_4077 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4077 )
      ( MAKE-ON ?AUTO_4068 ?AUTO_4069 )
      ( MAKE-ON-VERIFY ?AUTO_4068 ?AUTO_4069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4078 - BLOCK
      ?AUTO_4081 - BLOCK
    )
    :vars
    (
      ?AUTO_4082 - BLOCK
      ?AUTO_4085 - BLOCK
      ?AUTO_4084 - BLOCK
      ?AUTO_4083 - BLOCK
      ?AUTO_4086 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4078 ?AUTO_4082 ) ( ON ?AUTO_4085 ?AUTO_4078 ) ( ON ?AUTO_4084 ?AUTO_4085 ) ( ON ?AUTO_4083 ?AUTO_4084 ) ( CLEAR ?AUTO_4083 ) ( ON ?AUTO_4086 ?AUTO_4081 ) ( CLEAR ?AUTO_4086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4086 ?AUTO_4081 )
      ( MAKE-ON ?AUTO_4078 ?AUTO_4081 )
      ( MAKE-ON-VERIFY ?AUTO_4078 ?AUTO_4081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4169 - BLOCK
      ?AUTO_4170 - BLOCK
    )
    :vars
    (
      ?AUTO_4178 - BLOCK
      ?AUTO_4172 - BLOCK
      ?AUTO_4174 - BLOCK
      ?AUTO_4177 - BLOCK
      ?AUTO_4173 - BLOCK
      ?AUTO_4176 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4169 ?AUTO_4178 ) ( CLEAR ?AUTO_4172 ) ( ON ?AUTO_4174 ?AUTO_4169 ) ( CLEAR ?AUTO_4174 ) ( ON ?AUTO_4177 ?AUTO_4170 ) ( CLEAR ?AUTO_4173 ) ( ON ?AUTO_4176 ?AUTO_4177 ) ( CLEAR ?AUTO_4176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4176 ?AUTO_4177 )
      ( MAKE-ON ?AUTO_4169 ?AUTO_4170 )
      ( MAKE-ON-VERIFY ?AUTO_4169 ?AUTO_4170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4205 - BLOCK
      ?AUTO_4206 - BLOCK
    )
    :vars
    (
      ?AUTO_4208 - BLOCK
      ?AUTO_4211 - BLOCK
      ?AUTO_4212 - BLOCK
      ?AUTO_4210 - BLOCK
      ?AUTO_4215 - BLOCK
      ?AUTO_4214 - BLOCK
      ?AUTO_4213 - BLOCK
      ?AUTO_4216 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4205 ?AUTO_4208 ) ( CLEAR ?AUTO_4211 ) ( ON ?AUTO_4212 ?AUTO_4205 ) ( CLEAR ?AUTO_4212 ) ( ON ?AUTO_4210 ?AUTO_4206 ) ( CLEAR ?AUTO_4215 ) ( ON ?AUTO_4214 ?AUTO_4210 ) ( ON ?AUTO_4213 ?AUTO_4214 ) ( CLEAR ?AUTO_4213 ) ( HOLDING ?AUTO_4216 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4216 )
      ( MAKE-ON ?AUTO_4205 ?AUTO_4206 )
      ( MAKE-ON-VERIFY ?AUTO_4205 ?AUTO_4206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4217 - BLOCK
      ?AUTO_4218 - BLOCK
    )
    :vars
    (
      ?AUTO_4220 - BLOCK
      ?AUTO_4221 - BLOCK
      ?AUTO_4224 - BLOCK
      ?AUTO_4227 - BLOCK
      ?AUTO_4223 - BLOCK
      ?AUTO_4228 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4217 ?AUTO_4220 ) ( ON ?AUTO_4221 ?AUTO_4217 ) ( ON ?AUTO_4224 ?AUTO_4218 ) ( ON ?AUTO_4227 ?AUTO_4224 ) ( ON ?AUTO_4223 ?AUTO_4227 ) ( CLEAR ?AUTO_4223 ) ( ON ?AUTO_4228 ?AUTO_4221 ) ( CLEAR ?AUTO_4228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4228 ?AUTO_4221 )
      ( MAKE-ON ?AUTO_4217 ?AUTO_4218 )
      ( MAKE-ON-VERIFY ?AUTO_4217 ?AUTO_4218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4372 - BLOCK
      ?AUTO_4373 - BLOCK
    )
    :vars
    (
      ?AUTO_4376 - BLOCK
      ?AUTO_4375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4376 ) ( ON ?AUTO_4375 ?AUTO_4373 ) ( CLEAR ?AUTO_4375 ) ( HOLDING ?AUTO_4372 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4372 )
      ( MAKE-ON ?AUTO_4372 ?AUTO_4373 )
      ( MAKE-ON-VERIFY ?AUTO_4372 ?AUTO_4373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4414 - BLOCK
      ?AUTO_4415 - BLOCK
    )
    :vars
    (
      ?AUTO_4420 - BLOCK
      ?AUTO_4423 - BLOCK
      ?AUTO_4417 - BLOCK
      ?AUTO_4421 - BLOCK
      ?AUTO_4424 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4414 ?AUTO_4420 ) ( ON ?AUTO_4423 ?AUTO_4414 ) ( ON ?AUTO_4417 ?AUTO_4415 ) ( ON ?AUTO_4421 ?AUTO_4423 ) ( CLEAR ?AUTO_4421 ) ( ON ?AUTO_4424 ?AUTO_4417 ) ( CLEAR ?AUTO_4424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4424 ?AUTO_4417 )
      ( MAKE-ON ?AUTO_4414 ?AUTO_4415 )
      ( MAKE-ON-VERIFY ?AUTO_4414 ?AUTO_4415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4574 - BLOCK
      ?AUTO_4575 - BLOCK
    )
    :vars
    (
      ?AUTO_4578 - BLOCK
      ?AUTO_4580 - BLOCK
      ?AUTO_4576 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4578 ?AUTO_4575 ) ( ON ?AUTO_4580 ?AUTO_4578 ) ( ON ?AUTO_4576 ?AUTO_4580 ) ( CLEAR ?AUTO_4576 ) ( HOLDING ?AUTO_4574 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4574 )
      ( MAKE-ON ?AUTO_4574 ?AUTO_4575 )
      ( MAKE-ON-VERIFY ?AUTO_4574 ?AUTO_4575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4719 - BLOCK
      ?AUTO_4720 - BLOCK
    )
    :vars
    (
      ?AUTO_4725 - BLOCK
      ?AUTO_4721 - BLOCK
      ?AUTO_4722 - BLOCK
      ?AUTO_4726 - BLOCK
      ?AUTO_4727 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4719 ?AUTO_4725 ) ( CLEAR ?AUTO_4719 ) ( CLEAR ?AUTO_4721 ) ( ON ?AUTO_4722 ?AUTO_4720 ) ( CLEAR ?AUTO_4722 ) ( HOLDING ?AUTO_4726 ) ( CLEAR ?AUTO_4727 ) )
    :subtasks
    ( ( !STACK ?AUTO_4726 ?AUTO_4727 )
      ( MAKE-ON ?AUTO_4719 ?AUTO_4720 )
      ( MAKE-ON-VERIFY ?AUTO_4719 ?AUTO_4720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4884 - BLOCK
      ?AUTO_4885 - BLOCK
    )
    :vars
    (
      ?AUTO_4891 - BLOCK
      ?AUTO_4892 - BLOCK
      ?AUTO_4890 - BLOCK
      ?AUTO_4888 - BLOCK
      ?AUTO_4889 - BLOCK
      ?AUTO_4894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4885 ) ( ON ?AUTO_4884 ?AUTO_4891 ) ( ON ?AUTO_4892 ?AUTO_4884 ) ( ON ?AUTO_4890 ?AUTO_4892 ) ( ON ?AUTO_4888 ?AUTO_4890 ) ( CLEAR ?AUTO_4888 ) ( HOLDING ?AUTO_4889 ) ( CLEAR ?AUTO_4894 ) )
    :subtasks
    ( ( !STACK ?AUTO_4889 ?AUTO_4894 )
      ( MAKE-ON ?AUTO_4884 ?AUTO_4885 )
      ( MAKE-ON-VERIFY ?AUTO_4884 ?AUTO_4885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5219 - BLOCK
      ?AUTO_5220 - BLOCK
    )
    :vars
    (
      ?AUTO_5221 - BLOCK
      ?AUTO_5226 - BLOCK
      ?AUTO_5223 - BLOCK
      ?AUTO_5224 - BLOCK
      ?AUTO_5227 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5221 ) ( ON ?AUTO_5226 ?AUTO_5220 ) ( ON ?AUTO_5223 ?AUTO_5226 ) ( ON ?AUTO_5224 ?AUTO_5223 ) ( CLEAR ?AUTO_5224 ) ( HOLDING ?AUTO_5219 ) ( CLEAR ?AUTO_5227 ) )
    :subtasks
    ( ( !STACK ?AUTO_5219 ?AUTO_5227 )
      ( MAKE-ON ?AUTO_5219 ?AUTO_5220 )
      ( MAKE-ON-VERIFY ?AUTO_5219 ?AUTO_5220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5241 - BLOCK
      ?AUTO_5242 - BLOCK
    )
    :vars
    (
      ?AUTO_5246 - BLOCK
      ?AUTO_5248 - BLOCK
      ?AUTO_5247 - BLOCK
      ?AUTO_5243 - BLOCK
      ?AUTO_5249 - BLOCK
      ?AUTO_5251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5246 ) ( ON ?AUTO_5248 ?AUTO_5242 ) ( ON ?AUTO_5247 ?AUTO_5248 ) ( ON ?AUTO_5243 ?AUTO_5247 ) ( ON ?AUTO_5241 ?AUTO_5243 ) ( CLEAR ?AUTO_5241 ) ( HOLDING ?AUTO_5249 ) ( CLEAR ?AUTO_5251 ) )
    :subtasks
    ( ( !STACK ?AUTO_5249 ?AUTO_5251 )
      ( MAKE-ON ?AUTO_5241 ?AUTO_5242 )
      ( MAKE-ON-VERIFY ?AUTO_5241 ?AUTO_5242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5336 - BLOCK
      ?AUTO_5337 - BLOCK
    )
    :vars
    (
      ?AUTO_5342 - BLOCK
      ?AUTO_5340 - BLOCK
      ?AUTO_5341 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5342 ) ( ON ?AUTO_5340 ?AUTO_5337 ) ( CLEAR ?AUTO_5340 ) ( CLEAR ?AUTO_5341 ) ( ON-TABLE ?AUTO_5336 ) ( CLEAR ?AUTO_5336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5336 )
      ( MAKE-ON ?AUTO_5336 ?AUTO_5337 )
      ( MAKE-ON-VERIFY ?AUTO_5336 ?AUTO_5337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5363 - BLOCK
      ?AUTO_5364 - BLOCK
    )
    :vars
    (
      ?AUTO_5365 - BLOCK
      ?AUTO_5366 - BLOCK
      ?AUTO_5367 - BLOCK
      ?AUTO_5368 - BLOCK
      ?AUTO_5371 - BLOCK
      ?AUTO_5372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5365 ) ( ON ?AUTO_5366 ?AUTO_5364 ) ( CLEAR ?AUTO_5366 ) ( ON-TABLE ?AUTO_5363 ) ( CLEAR ?AUTO_5367 ) ( ON ?AUTO_5368 ?AUTO_5363 ) ( CLEAR ?AUTO_5368 ) ( HOLDING ?AUTO_5371 ) ( CLEAR ?AUTO_5372 ) )
    :subtasks
    ( ( !STACK ?AUTO_5371 ?AUTO_5372 )
      ( MAKE-ON ?AUTO_5363 ?AUTO_5364 )
      ( MAKE-ON-VERIFY ?AUTO_5363 ?AUTO_5364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5377 - BLOCK
      ?AUTO_5378 - BLOCK
    )
    :vars
    (
      ?AUTO_5386 - BLOCK
      ?AUTO_5381 - BLOCK
      ?AUTO_5380 - BLOCK
      ?AUTO_5385 - BLOCK
      ?AUTO_5383 - BLOCK
      ?AUTO_5379 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5386 ) ( ON ?AUTO_5381 ?AUTO_5378 ) ( CLEAR ?AUTO_5381 ) ( ON-TABLE ?AUTO_5377 ) ( CLEAR ?AUTO_5380 ) ( ON ?AUTO_5385 ?AUTO_5377 ) ( CLEAR ?AUTO_5383 ) ( ON ?AUTO_5379 ?AUTO_5385 ) ( CLEAR ?AUTO_5379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5379 ?AUTO_5385 )
      ( MAKE-ON ?AUTO_5377 ?AUTO_5378 )
      ( MAKE-ON-VERIFY ?AUTO_5377 ?AUTO_5378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5597 - BLOCK
      ?AUTO_5598 - BLOCK
    )
    :vars
    (
      ?AUTO_5603 - BLOCK
      ?AUTO_5599 - BLOCK
      ?AUTO_5600 - BLOCK
      ?AUTO_5601 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5597 ) ( ON ?AUTO_5603 ?AUTO_5597 ) ( CLEAR ?AUTO_5599 ) ( ON ?AUTO_5600 ?AUTO_5603 ) ( CLEAR ?AUTO_5600 ) ( HOLDING ?AUTO_5601 ) ( CLEAR ?AUTO_5598 ) )
    :subtasks
    ( ( !STACK ?AUTO_5601 ?AUTO_5598 )
      ( MAKE-ON ?AUTO_5597 ?AUTO_5598 )
      ( MAKE-ON-VERIFY ?AUTO_5597 ?AUTO_5598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5617 - BLOCK
      ?AUTO_5618 - BLOCK
    )
    :vars
    (
      ?AUTO_5619 - BLOCK
      ?AUTO_5621 - BLOCK
      ?AUTO_5620 - BLOCK
      ?AUTO_5622 - BLOCK
      ?AUTO_5625 - BLOCK
      ?AUTO_5626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5617 ) ( ON ?AUTO_5619 ?AUTO_5617 ) ( CLEAR ?AUTO_5621 ) ( ON ?AUTO_5620 ?AUTO_5619 ) ( CLEAR ?AUTO_5618 ) ( ON ?AUTO_5622 ?AUTO_5620 ) ( CLEAR ?AUTO_5622 ) ( HOLDING ?AUTO_5625 ) ( CLEAR ?AUTO_5626 ) )
    :subtasks
    ( ( !STACK ?AUTO_5625 ?AUTO_5626 )
      ( MAKE-ON ?AUTO_5617 ?AUTO_5618 )
      ( MAKE-ON-VERIFY ?AUTO_5617 ?AUTO_5618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5679 - BLOCK
      ?AUTO_5680 - BLOCK
    )
    :vars
    (
      ?AUTO_5687 - BLOCK
      ?AUTO_5683 - BLOCK
      ?AUTO_5685 - BLOCK
      ?AUTO_5684 - BLOCK
      ?AUTO_5686 - BLOCK
      ?AUTO_5682 - BLOCK
      ?AUTO_5690 - BLOCK
      ?AUTO_5681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5679 ) ( ON ?AUTO_5687 ?AUTO_5679 ) ( CLEAR ?AUTO_5683 ) ( ON ?AUTO_5685 ?AUTO_5687 ) ( ON ?AUTO_5684 ?AUTO_5685 ) ( CLEAR ?AUTO_5684 ) ( CLEAR ?AUTO_5686 ) ( ON ?AUTO_5682 ?AUTO_5680 ) ( ON ?AUTO_5690 ?AUTO_5682 ) ( ON ?AUTO_5681 ?AUTO_5690 ) ( CLEAR ?AUTO_5681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5681 ?AUTO_5690 )
      ( MAKE-ON ?AUTO_5679 ?AUTO_5680 )
      ( MAKE-ON-VERIFY ?AUTO_5679 ?AUTO_5680 ) )
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
      ?AUTO_5703 - BLOCK
      ?AUTO_5696 - BLOCK
      ?AUTO_5704 - BLOCK
      ?AUTO_5699 - BLOCK
      ?AUTO_5701 - BLOCK
      ?AUTO_5697 - BLOCK
      ?AUTO_5702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5693 ) ( ON ?AUTO_5698 ?AUTO_5693 ) ( CLEAR ?AUTO_5703 ) ( ON ?AUTO_5696 ?AUTO_5698 ) ( CLEAR ?AUTO_5704 ) ( ON ?AUTO_5699 ?AUTO_5694 ) ( ON ?AUTO_5701 ?AUTO_5699 ) ( ON ?AUTO_5697 ?AUTO_5701 ) ( CLEAR ?AUTO_5697 ) ( HOLDING ?AUTO_5702 ) ( CLEAR ?AUTO_5696 ) )
    :subtasks
    ( ( !STACK ?AUTO_5702 ?AUTO_5696 )
      ( MAKE-ON ?AUTO_5693 ?AUTO_5694 )
      ( MAKE-ON-VERIFY ?AUTO_5693 ?AUTO_5694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5707 - BLOCK
      ?AUTO_5708 - BLOCK
    )
    :vars
    (
      ?AUTO_5717 - BLOCK
      ?AUTO_5711 - BLOCK
      ?AUTO_5714 - BLOCK
      ?AUTO_5709 - BLOCK
      ?AUTO_5716 - BLOCK
      ?AUTO_5715 - BLOCK
      ?AUTO_5718 - BLOCK
      ?AUTO_5712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5707 ) ( ON ?AUTO_5717 ?AUTO_5707 ) ( CLEAR ?AUTO_5711 ) ( ON ?AUTO_5714 ?AUTO_5717 ) ( CLEAR ?AUTO_5709 ) ( ON ?AUTO_5716 ?AUTO_5708 ) ( ON ?AUTO_5715 ?AUTO_5716 ) ( ON ?AUTO_5718 ?AUTO_5715 ) ( CLEAR ?AUTO_5714 ) ( ON ?AUTO_5712 ?AUTO_5718 ) ( CLEAR ?AUTO_5712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5712 ?AUTO_5718 )
      ( MAKE-ON ?AUTO_5707 ?AUTO_5708 )
      ( MAKE-ON-VERIFY ?AUTO_5707 ?AUTO_5708 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5721 - BLOCK
      ?AUTO_5722 - BLOCK
    )
    :vars
    (
      ?AUTO_5731 - BLOCK
      ?AUTO_5732 - BLOCK
      ?AUTO_5726 - BLOCK
      ?AUTO_5730 - BLOCK
      ?AUTO_5728 - BLOCK
      ?AUTO_5729 - BLOCK
      ?AUTO_5725 - BLOCK
      ?AUTO_5727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5721 ) ( ON ?AUTO_5731 ?AUTO_5721 ) ( CLEAR ?AUTO_5732 ) ( CLEAR ?AUTO_5726 ) ( ON ?AUTO_5730 ?AUTO_5722 ) ( ON ?AUTO_5728 ?AUTO_5730 ) ( ON ?AUTO_5729 ?AUTO_5728 ) ( ON ?AUTO_5725 ?AUTO_5729 ) ( CLEAR ?AUTO_5725 ) ( HOLDING ?AUTO_5727 ) ( CLEAR ?AUTO_5731 ) )
    :subtasks
    ( ( !STACK ?AUTO_5727 ?AUTO_5731 )
      ( MAKE-ON ?AUTO_5721 ?AUTO_5722 )
      ( MAKE-ON-VERIFY ?AUTO_5721 ?AUTO_5722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5735 - BLOCK
      ?AUTO_5736 - BLOCK
    )
    :vars
    (
      ?AUTO_5737 - BLOCK
      ?AUTO_5746 - BLOCK
      ?AUTO_5742 - BLOCK
      ?AUTO_5738 - BLOCK
      ?AUTO_5745 - BLOCK
      ?AUTO_5743 - BLOCK
      ?AUTO_5739 - BLOCK
      ?AUTO_5744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5735 ) ( ON ?AUTO_5737 ?AUTO_5735 ) ( CLEAR ?AUTO_5746 ) ( CLEAR ?AUTO_5742 ) ( ON ?AUTO_5738 ?AUTO_5736 ) ( ON ?AUTO_5745 ?AUTO_5738 ) ( ON ?AUTO_5743 ?AUTO_5745 ) ( ON ?AUTO_5739 ?AUTO_5743 ) ( CLEAR ?AUTO_5739 ) ( CLEAR ?AUTO_5737 ) ( ON-TABLE ?AUTO_5744 ) ( CLEAR ?AUTO_5744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5744 )
      ( MAKE-ON ?AUTO_5735 ?AUTO_5736 )
      ( MAKE-ON-VERIFY ?AUTO_5735 ?AUTO_5736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5748 - BLOCK
      ?AUTO_5749 - BLOCK
    )
    :vars
    (
      ?AUTO_5755 - BLOCK
      ?AUTO_5754 - BLOCK
      ?AUTO_5753 - BLOCK
      ?AUTO_5759 - BLOCK
      ?AUTO_5756 - BLOCK
      ?AUTO_5758 - BLOCK
      ?AUTO_5757 - BLOCK
      ?AUTO_5750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5748 ) ( CLEAR ?AUTO_5755 ) ( CLEAR ?AUTO_5754 ) ( ON ?AUTO_5753 ?AUTO_5749 ) ( ON ?AUTO_5759 ?AUTO_5753 ) ( ON ?AUTO_5756 ?AUTO_5759 ) ( ON ?AUTO_5758 ?AUTO_5756 ) ( CLEAR ?AUTO_5758 ) ( ON-TABLE ?AUTO_5757 ) ( CLEAR ?AUTO_5757 ) ( HOLDING ?AUTO_5750 ) ( CLEAR ?AUTO_5748 ) )
    :subtasks
    ( ( !STACK ?AUTO_5750 ?AUTO_5748 )
      ( MAKE-ON ?AUTO_5748 ?AUTO_5749 )
      ( MAKE-ON-VERIFY ?AUTO_5748 ?AUTO_5749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5782 - BLOCK
      ?AUTO_5783 - BLOCK
    )
    :vars
    (
      ?AUTO_5788 - BLOCK
      ?AUTO_5792 - BLOCK
      ?AUTO_5786 - BLOCK
      ?AUTO_5787 - BLOCK
      ?AUTO_5790 - BLOCK
      ?AUTO_5791 - BLOCK
      ?AUTO_5784 - BLOCK
      ?AUTO_5789 - BLOCK
      ?AUTO_5795 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5782 ) ( CLEAR ?AUTO_5788 ) ( CLEAR ?AUTO_5792 ) ( ON ?AUTO_5786 ?AUTO_5783 ) ( ON ?AUTO_5787 ?AUTO_5786 ) ( ON ?AUTO_5790 ?AUTO_5787 ) ( ON ?AUTO_5791 ?AUTO_5790 ) ( CLEAR ?AUTO_5791 ) ( ON-TABLE ?AUTO_5784 ) ( CLEAR ?AUTO_5784 ) ( CLEAR ?AUTO_5782 ) ( ON ?AUTO_5789 ?AUTO_5795 ) ( CLEAR ?AUTO_5789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5789 ?AUTO_5795 )
      ( MAKE-ON ?AUTO_5782 ?AUTO_5783 )
      ( MAKE-ON-VERIFY ?AUTO_5782 ?AUTO_5783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5968 - BLOCK
      ?AUTO_5969 - BLOCK
    )
    :vars
    (
      ?AUTO_5970 - BLOCK
      ?AUTO_5973 - BLOCK
      ?AUTO_5974 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5970 ?AUTO_5969 ) ( ON ?AUTO_5968 ?AUTO_5970 ) ( ON ?AUTO_5973 ?AUTO_5968 ) ( ON ?AUTO_5974 ?AUTO_5973 ) ( CLEAR ?AUTO_5974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5974 ?AUTO_5973 )
      ( MAKE-ON ?AUTO_5968 ?AUTO_5969 )
      ( MAKE-ON-VERIFY ?AUTO_5968 ?AUTO_5969 ) )
  )

)

