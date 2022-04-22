( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?I - INSTRUMENT ?S - SATELLITE )
    ( SUPPORTS ?I - INSTRUMENT ?M - MODE )
    ( POINTING ?S - SATELLITE ?D - DIRECTION )
    ( POWER_AVAIL ?S - SATELLITE )
    ( POWER_ON ?I - INSTRUMENT )
    ( CALIBRATED ?I - INSTRUMENT )
    ( NOT_CALIBRATED ?I - INSTRUMENT )
    ( HAVE_IMAGE ?D - DIRECTION ?M - MODE )
    ( CALIBRATION_TARGET ?I - INSTRUMENT ?D - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?S - SATELLITE
      ?D_NEW - DIRECTION
      ?D_PREV - DIRECTION
    )
    :precondition
    ( and ( POINTING ?S ?D_PREV ) ( not ( = ?D_NEW ?D_PREV ) ) )
    :effect
    ( and ( POINTING ?S ?D_NEW ) ( not ( POINTING ?S ?D_PREV ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?I - INSTRUMENT
      ?S - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?I ?S ) ( POWER_AVAIL ?S ) )
    :effect
    ( and ( POWER_ON ?I ) ( NOT_CALIBRATED ?I ) ( not ( CALIBRATED ?I ) ) ( not ( POWER_AVAIL ?S ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?I - INSTRUMENT
      ?S - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?I ?S ) ( POWER_ON ?I ) )
    :effect
    ( and ( POWER_AVAIL ?S ) ( not ( POWER_ON ?I ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?S - SATELLITE
      ?I - INSTRUMENT
      ?D - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?I ?S ) ( CALIBRATION_TARGET ?I ?D ) ( POINTING ?S ?D ) ( POWER_ON ?I ) ( NOT_CALIBRATED ?I ) )
    :effect
    ( and ( CALIBRATED ?I ) ( not ( NOT_CALIBRATED ?I ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?S - SATELLITE
      ?D - DIRECTION
      ?I - INSTRUMENT
      ?M - MODE
    )
    :precondition
    ( and ( CALIBRATED ?I ) ( ON_BOARD ?I ?S ) ( SUPPORTS ?I ?M ) ( POWER_ON ?I ) ( POINTING ?S ?D ) ( POWER_ON ?I ) )
    :effect
    ( and ( HAVE_IMAGE ?D ?M ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?DIR - DIRECTION
      ?MODE - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?DIR ?MODE ) )
    :subtasks
    (  )
  )

  ( :method GET_IMAGE-VERIFY
    :parameters
    (
      ?DIR - DIRECTION
      ?MODE - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?DIR ?MODE ) )
    :subtasks
    (  )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_2 - DIRECTION
      ?AUTO_3 - MODE
    )
    :vars
    (
      ?AUTO_4 - INSTRUMENT
      ?AUTO_5 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_4 ) ( ON_BOARD ?AUTO_4 ?AUTO_5 ) ( SUPPORTS ?AUTO_4 ?AUTO_3 ) ( POWER_ON ?AUTO_4 ) ( POINTING ?AUTO_5 ?AUTO_2 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_5 ?AUTO_2 ?AUTO_4 ?AUTO_3 )
      ( GET_IMAGE-VERIFY ?AUTO_2 ?AUTO_3 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_6 - DIRECTION
      ?AUTO_7 - MODE
    )
    :vars
    (
      ?AUTO_8 - INSTRUMENT
      ?AUTO_9 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_8 ?AUTO_9 ) ( SUPPORTS ?AUTO_8 ?AUTO_7 ) ( POWER_ON ?AUTO_8 ) ( POINTING ?AUTO_9 ?AUTO_6 ) ( CALIBRATION_TARGET ?AUTO_8 ?AUTO_6 ) ( NOT_CALIBRATED ?AUTO_8 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9 ?AUTO_8 ?AUTO_6 )
      ( GET_IMAGE ?AUTO_6 ?AUTO_7 )
      ( GET_IMAGE-VERIFY ?AUTO_6 ?AUTO_7 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_10 - DIRECTION
      ?AUTO_11 - MODE
    )
    :vars
    (
      ?AUTO_13 - INSTRUMENT
      ?AUTO_12 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_13 ?AUTO_12 ) ( SUPPORTS ?AUTO_13 ?AUTO_11 ) ( POINTING ?AUTO_12 ?AUTO_10 ) ( CALIBRATION_TARGET ?AUTO_13 ?AUTO_10 ) ( POWER_AVAIL ?AUTO_12 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_13 ?AUTO_12 )
      ( GET_IMAGE ?AUTO_10 ?AUTO_11 )
      ( GET_IMAGE-VERIFY ?AUTO_10 ?AUTO_11 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_14 - DIRECTION
      ?AUTO_15 - MODE
    )
    :vars
    (
      ?AUTO_17 - INSTRUMENT
      ?AUTO_16 - SATELLITE
      ?AUTO_18 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_17 ?AUTO_16 ) ( SUPPORTS ?AUTO_17 ?AUTO_15 ) ( CALIBRATION_TARGET ?AUTO_17 ?AUTO_14 ) ( POWER_AVAIL ?AUTO_16 ) ( POINTING ?AUTO_16 ?AUTO_18 ) ( not ( = ?AUTO_14 ?AUTO_18 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_16 ?AUTO_14 ?AUTO_18 )
      ( GET_IMAGE ?AUTO_14 ?AUTO_15 )
      ( GET_IMAGE-VERIFY ?AUTO_14 ?AUTO_15 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_25 - DIRECTION
      ?AUTO_26 - MODE
    )
    :vars
    (
      ?AUTO_28 - INSTRUMENT
      ?AUTO_27 - SATELLITE
      ?AUTO_29 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_28 ) ( ON_BOARD ?AUTO_28 ?AUTO_27 ) ( SUPPORTS ?AUTO_28 ?AUTO_26 ) ( POWER_ON ?AUTO_28 ) ( POINTING ?AUTO_27 ?AUTO_29 ) ( not ( = ?AUTO_25 ?AUTO_29 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_27 ?AUTO_25 ?AUTO_29 )
      ( GET_IMAGE ?AUTO_25 ?AUTO_26 )
      ( GET_IMAGE-VERIFY ?AUTO_25 ?AUTO_26 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_30 - DIRECTION
      ?AUTO_31 - MODE
    )
    :vars
    (
      ?AUTO_33 - INSTRUMENT
      ?AUTO_34 - SATELLITE
      ?AUTO_32 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_33 ?AUTO_34 ) ( SUPPORTS ?AUTO_33 ?AUTO_31 ) ( POWER_ON ?AUTO_33 ) ( POINTING ?AUTO_34 ?AUTO_32 ) ( not ( = ?AUTO_30 ?AUTO_32 ) ) ( CALIBRATION_TARGET ?AUTO_33 ?AUTO_32 ) ( NOT_CALIBRATED ?AUTO_33 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_34 ?AUTO_33 ?AUTO_32 )
      ( GET_IMAGE ?AUTO_30 ?AUTO_31 )
      ( GET_IMAGE-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_35 - DIRECTION
      ?AUTO_36 - MODE
    )
    :vars
    (
      ?AUTO_37 - INSTRUMENT
      ?AUTO_38 - SATELLITE
      ?AUTO_39 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_37 ?AUTO_38 ) ( SUPPORTS ?AUTO_37 ?AUTO_36 ) ( POINTING ?AUTO_38 ?AUTO_39 ) ( not ( = ?AUTO_35 ?AUTO_39 ) ) ( CALIBRATION_TARGET ?AUTO_37 ?AUTO_39 ) ( POWER_AVAIL ?AUTO_38 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_37 ?AUTO_38 )
      ( GET_IMAGE ?AUTO_35 ?AUTO_36 )
      ( GET_IMAGE-VERIFY ?AUTO_35 ?AUTO_36 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_57 - DIRECTION
      ?AUTO_56 - MODE
    )
    :vars
    (
      ?AUTO_59 - INSTRUMENT
      ?AUTO_60 - SATELLITE
      ?AUTO_58 - DIRECTION
      ?AUTO_61 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_59 ?AUTO_60 ) ( SUPPORTS ?AUTO_59 ?AUTO_56 ) ( POWER_ON ?AUTO_59 ) ( not ( = ?AUTO_57 ?AUTO_58 ) ) ( CALIBRATION_TARGET ?AUTO_59 ?AUTO_58 ) ( NOT_CALIBRATED ?AUTO_59 ) ( POINTING ?AUTO_60 ?AUTO_61 ) ( not ( = ?AUTO_58 ?AUTO_61 ) ) ( not ( = ?AUTO_57 ?AUTO_61 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_60 ?AUTO_58 ?AUTO_61 )
      ( GET_IMAGE ?AUTO_57 ?AUTO_56 )
      ( GET_IMAGE-VERIFY ?AUTO_57 ?AUTO_56 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_63 - DIRECTION
      ?AUTO_62 - MODE
    )
    :vars
    (
      ?AUTO_66 - INSTRUMENT
      ?AUTO_67 - SATELLITE
      ?AUTO_64 - DIRECTION
      ?AUTO_65 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_66 ?AUTO_67 ) ( SUPPORTS ?AUTO_66 ?AUTO_62 ) ( not ( = ?AUTO_63 ?AUTO_64 ) ) ( CALIBRATION_TARGET ?AUTO_66 ?AUTO_64 ) ( POINTING ?AUTO_67 ?AUTO_65 ) ( not ( = ?AUTO_64 ?AUTO_65 ) ) ( not ( = ?AUTO_63 ?AUTO_65 ) ) ( POWER_AVAIL ?AUTO_67 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_66 ?AUTO_67 )
      ( GET_IMAGE ?AUTO_63 ?AUTO_62 )
      ( GET_IMAGE-VERIFY ?AUTO_63 ?AUTO_62 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_111 - DIRECTION
      ?AUTO_110 - MODE
    )
    :vars
    (
      ?AUTO_114 - INSTRUMENT
      ?AUTO_112 - SATELLITE
      ?AUTO_113 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_114 ?AUTO_112 ) ( SUPPORTS ?AUTO_114 ?AUTO_110 ) ( POWER_ON ?AUTO_114 ) ( not ( = ?AUTO_111 ?AUTO_113 ) ) ( CALIBRATION_TARGET ?AUTO_114 ?AUTO_113 ) ( NOT_CALIBRATED ?AUTO_114 ) ( POINTING ?AUTO_112 ?AUTO_111 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_112 ?AUTO_113 ?AUTO_111 )
      ( GET_IMAGE ?AUTO_111 ?AUTO_110 )
      ( GET_IMAGE-VERIFY ?AUTO_111 ?AUTO_110 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_116 - DIRECTION
      ?AUTO_115 - MODE
    )
    :vars
    (
      ?AUTO_119 - INSTRUMENT
      ?AUTO_118 - SATELLITE
      ?AUTO_117 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_119 ?AUTO_118 ) ( SUPPORTS ?AUTO_119 ?AUTO_115 ) ( not ( = ?AUTO_116 ?AUTO_117 ) ) ( CALIBRATION_TARGET ?AUTO_119 ?AUTO_117 ) ( POINTING ?AUTO_118 ?AUTO_116 ) ( POWER_AVAIL ?AUTO_118 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_119 ?AUTO_118 )
      ( GET_IMAGE ?AUTO_116 ?AUTO_115 )
      ( GET_IMAGE-VERIFY ?AUTO_116 ?AUTO_115 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_148 - DIRECTION
      ?AUTO_149 - MODE
    )
    :vars
    (
      ?AUTO_151 - INSTRUMENT
      ?AUTO_150 - SATELLITE
      ?AUTO_152 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_151 ?AUTO_150 ) ( SUPPORTS ?AUTO_151 ?AUTO_149 ) ( POINTING ?AUTO_150 ?AUTO_148 ) ( CALIBRATION_TARGET ?AUTO_151 ?AUTO_148 ) ( ON_BOARD ?AUTO_152 ?AUTO_150 ) ( POWER_ON ?AUTO_152 ) ( not ( = ?AUTO_151 ?AUTO_152 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_152 ?AUTO_150 )
      ( GET_IMAGE ?AUTO_148 ?AUTO_149 )
      ( GET_IMAGE-VERIFY ?AUTO_148 ?AUTO_149 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_195 - DIRECTION
      ?AUTO_196 - MODE
    )
    :vars
    (
      ?AUTO_197 - INSTRUMENT
      ?AUTO_198 - SATELLITE
      ?AUTO_199 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_197 ?AUTO_198 ) ( SUPPORTS ?AUTO_197 ?AUTO_196 ) ( not ( = ?AUTO_195 ?AUTO_199 ) ) ( CALIBRATION_TARGET ?AUTO_197 ?AUTO_199 ) ( POWER_AVAIL ?AUTO_198 ) ( POINTING ?AUTO_198 ?AUTO_195 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_198 ?AUTO_199 ?AUTO_195 )
      ( GET_IMAGE ?AUTO_195 ?AUTO_196 )
      ( GET_IMAGE-VERIFY ?AUTO_195 ?AUTO_196 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_210 - DIRECTION
      ?AUTO_211 - MODE
    )
    :vars
    (
      ?AUTO_212 - INSTRUMENT
      ?AUTO_213 - SATELLITE
      ?AUTO_214 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_212 ?AUTO_213 ) ( SUPPORTS ?AUTO_212 ?AUTO_211 ) ( POWER_ON ?AUTO_212 ) ( CALIBRATION_TARGET ?AUTO_212 ?AUTO_210 ) ( NOT_CALIBRATED ?AUTO_212 ) ( POINTING ?AUTO_213 ?AUTO_214 ) ( not ( = ?AUTO_210 ?AUTO_214 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_213 ?AUTO_210 ?AUTO_214 )
      ( GET_IMAGE ?AUTO_210 ?AUTO_211 )
      ( GET_IMAGE-VERIFY ?AUTO_210 ?AUTO_211 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_215 - DIRECTION
      ?AUTO_216 - MODE
    )
    :vars
    (
      ?AUTO_217 - INSTRUMENT
      ?AUTO_219 - SATELLITE
      ?AUTO_218 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_217 ?AUTO_219 ) ( SUPPORTS ?AUTO_217 ?AUTO_216 ) ( CALIBRATION_TARGET ?AUTO_217 ?AUTO_215 ) ( POINTING ?AUTO_219 ?AUTO_218 ) ( not ( = ?AUTO_215 ?AUTO_218 ) ) ( POWER_AVAIL ?AUTO_219 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_217 ?AUTO_219 )
      ( GET_IMAGE ?AUTO_215 ?AUTO_216 )
      ( GET_IMAGE-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_222 - DIRECTION
      ?AUTO_223 - MODE
    )
    :vars
    (
      ?AUTO_225 - INSTRUMENT
      ?AUTO_224 - SATELLITE
      ?AUTO_226 - DIRECTION
      ?AUTO_227 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_225 ?AUTO_224 ) ( SUPPORTS ?AUTO_225 ?AUTO_223 ) ( CALIBRATION_TARGET ?AUTO_225 ?AUTO_222 ) ( POINTING ?AUTO_224 ?AUTO_226 ) ( not ( = ?AUTO_222 ?AUTO_226 ) ) ( ON_BOARD ?AUTO_227 ?AUTO_224 ) ( POWER_ON ?AUTO_227 ) ( not ( = ?AUTO_225 ?AUTO_227 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_227 ?AUTO_224 )
      ( GET_IMAGE ?AUTO_222 ?AUTO_223 )
      ( GET_IMAGE-VERIFY ?AUTO_222 ?AUTO_223 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_268 - DIRECTION
      ?AUTO_269 - MODE
    )
    :vars
    (
      ?AUTO_271 - INSTRUMENT
      ?AUTO_272 - SATELLITE
      ?AUTO_270 - DIRECTION
      ?AUTO_273 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_271 ?AUTO_272 ) ( SUPPORTS ?AUTO_271 ?AUTO_269 ) ( not ( = ?AUTO_268 ?AUTO_270 ) ) ( CALIBRATION_TARGET ?AUTO_271 ?AUTO_270 ) ( POWER_AVAIL ?AUTO_272 ) ( POINTING ?AUTO_272 ?AUTO_273 ) ( not ( = ?AUTO_268 ?AUTO_273 ) ) ( not ( = ?AUTO_270 ?AUTO_273 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_272 ?AUTO_268 ?AUTO_273 )
      ( GET_IMAGE ?AUTO_268 ?AUTO_269 )
      ( GET_IMAGE-VERIFY ?AUTO_268 ?AUTO_269 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_274 - DIRECTION
      ?AUTO_275 - MODE
    )
    :vars
    (
      ?AUTO_276 - INSTRUMENT
      ?AUTO_279 - SATELLITE
      ?AUTO_277 - DIRECTION
      ?AUTO_278 - DIRECTION
      ?AUTO_280 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_276 ?AUTO_279 ) ( SUPPORTS ?AUTO_276 ?AUTO_275 ) ( not ( = ?AUTO_274 ?AUTO_277 ) ) ( CALIBRATION_TARGET ?AUTO_276 ?AUTO_277 ) ( POINTING ?AUTO_279 ?AUTO_278 ) ( not ( = ?AUTO_274 ?AUTO_278 ) ) ( not ( = ?AUTO_277 ?AUTO_278 ) ) ( ON_BOARD ?AUTO_280 ?AUTO_279 ) ( POWER_ON ?AUTO_280 ) ( not ( = ?AUTO_276 ?AUTO_280 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_280 ?AUTO_279 )
      ( GET_IMAGE ?AUTO_274 ?AUTO_275 )
      ( GET_IMAGE-VERIFY ?AUTO_274 ?AUTO_275 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_283 - DIRECTION
      ?AUTO_284 - MODE
    )
    :vars
    (
      ?AUTO_288 - INSTRUMENT
      ?AUTO_287 - SATELLITE
      ?AUTO_285 - DIRECTION
      ?AUTO_286 - DIRECTION
      ?AUTO_289 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_288 ?AUTO_287 ) ( SUPPORTS ?AUTO_288 ?AUTO_284 ) ( not ( = ?AUTO_283 ?AUTO_285 ) ) ( CALIBRATION_TARGET ?AUTO_288 ?AUTO_285 ) ( not ( = ?AUTO_283 ?AUTO_286 ) ) ( not ( = ?AUTO_285 ?AUTO_286 ) ) ( ON_BOARD ?AUTO_289 ?AUTO_287 ) ( POWER_ON ?AUTO_289 ) ( not ( = ?AUTO_288 ?AUTO_289 ) ) ( POINTING ?AUTO_287 ?AUTO_283 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_287 ?AUTO_286 ?AUTO_283 )
      ( GET_IMAGE ?AUTO_283 ?AUTO_284 )
      ( GET_IMAGE-VERIFY ?AUTO_283 ?AUTO_284 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_349 - DIRECTION
      ?AUTO_350 - MODE
    )
    :vars
    (
      ?AUTO_351 - INSTRUMENT
      ?AUTO_353 - SATELLITE
      ?AUTO_352 - DIRECTION
      ?AUTO_354 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_351 ?AUTO_353 ) ( SUPPORTS ?AUTO_351 ?AUTO_350 ) ( POINTING ?AUTO_353 ?AUTO_352 ) ( not ( = ?AUTO_349 ?AUTO_352 ) ) ( CALIBRATION_TARGET ?AUTO_351 ?AUTO_352 ) ( ON_BOARD ?AUTO_354 ?AUTO_353 ) ( POWER_ON ?AUTO_354 ) ( not ( = ?AUTO_351 ?AUTO_354 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_354 ?AUTO_353 )
      ( GET_IMAGE ?AUTO_349 ?AUTO_350 )
      ( GET_IMAGE-VERIFY ?AUTO_349 ?AUTO_350 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_413 - DIRECTION
      ?AUTO_414 - MODE
    )
    :vars
    (
      ?AUTO_416 - INSTRUMENT
      ?AUTO_415 - SATELLITE
      ?AUTO_417 - INSTRUMENT
      ?AUTO_418 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_416 ?AUTO_415 ) ( SUPPORTS ?AUTO_416 ?AUTO_414 ) ( CALIBRATION_TARGET ?AUTO_416 ?AUTO_413 ) ( ON_BOARD ?AUTO_417 ?AUTO_415 ) ( POWER_ON ?AUTO_417 ) ( not ( = ?AUTO_416 ?AUTO_417 ) ) ( POINTING ?AUTO_415 ?AUTO_418 ) ( not ( = ?AUTO_413 ?AUTO_418 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_415 ?AUTO_413 ?AUTO_418 )
      ( GET_IMAGE ?AUTO_413 ?AUTO_414 )
      ( GET_IMAGE-VERIFY ?AUTO_413 ?AUTO_414 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_423 - DIRECTION
      ?AUTO_424 - MODE
    )
    :vars
    (
      ?AUTO_425 - INSTRUMENT
      ?AUTO_426 - SATELLITE
      ?AUTO_427 - INSTRUMENT
      ?AUTO_428 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_425 ?AUTO_426 ) ( SUPPORTS ?AUTO_425 ?AUTO_424 ) ( CALIBRATION_TARGET ?AUTO_425 ?AUTO_423 ) ( ON_BOARD ?AUTO_427 ?AUTO_426 ) ( not ( = ?AUTO_425 ?AUTO_427 ) ) ( POINTING ?AUTO_426 ?AUTO_428 ) ( not ( = ?AUTO_423 ?AUTO_428 ) ) ( POWER_AVAIL ?AUTO_426 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_427 ?AUTO_426 )
      ( GET_IMAGE ?AUTO_423 ?AUTO_424 )
      ( GET_IMAGE-VERIFY ?AUTO_423 ?AUTO_424 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_460 - DIRECTION
      ?AUTO_461 - MODE
    )
    :vars
    (
      ?AUTO_462 - INSTRUMENT
      ?AUTO_464 - SATELLITE
      ?AUTO_465 - DIRECTION
      ?AUTO_463 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_462 ?AUTO_464 ) ( SUPPORTS ?AUTO_462 ?AUTO_461 ) ( not ( = ?AUTO_460 ?AUTO_465 ) ) ( CALIBRATION_TARGET ?AUTO_462 ?AUTO_465 ) ( ON_BOARD ?AUTO_463 ?AUTO_464 ) ( POWER_ON ?AUTO_463 ) ( not ( = ?AUTO_462 ?AUTO_463 ) ) ( POINTING ?AUTO_464 ?AUTO_460 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_464 ?AUTO_465 ?AUTO_460 )
      ( GET_IMAGE ?AUTO_460 ?AUTO_461 )
      ( GET_IMAGE-VERIFY ?AUTO_460 ?AUTO_461 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_470 - DIRECTION
      ?AUTO_471 - MODE
    )
    :vars
    (
      ?AUTO_474 - INSTRUMENT
      ?AUTO_473 - SATELLITE
      ?AUTO_472 - DIRECTION
      ?AUTO_475 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_474 ?AUTO_473 ) ( SUPPORTS ?AUTO_474 ?AUTO_471 ) ( not ( = ?AUTO_470 ?AUTO_472 ) ) ( CALIBRATION_TARGET ?AUTO_474 ?AUTO_472 ) ( ON_BOARD ?AUTO_475 ?AUTO_473 ) ( not ( = ?AUTO_474 ?AUTO_475 ) ) ( POINTING ?AUTO_473 ?AUTO_470 ) ( POWER_AVAIL ?AUTO_473 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_475 ?AUTO_473 )
      ( GET_IMAGE ?AUTO_470 ?AUTO_471 )
      ( GET_IMAGE-VERIFY ?AUTO_470 ?AUTO_471 ) )
  )

)

