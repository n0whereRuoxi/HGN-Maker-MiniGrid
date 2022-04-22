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
      ?AUTO_8 - DIRECTION
      ?AUTO_9 - MODE
    )
    :vars
    (
      ?AUTO_12 - INSTRUMENT
      ?AUTO_13 - SATELLITE
      ?AUTO_15 - SATELLITE
      ?AUTO_16 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_12 ?AUTO_13 ) ( SUPPORTS ?AUTO_12 ?AUTO_9 ) ( POWER_ON ?AUTO_12 ) ( POINTING ?AUTO_13 ?AUTO_8 ) ( ON_BOARD ?AUTO_12 ?AUTO_15 ) ( CALIBRATION_TARGET ?AUTO_12 ?AUTO_16 ) ( POINTING ?AUTO_15 ?AUTO_16 ) ( NOT_CALIBRATED ?AUTO_12 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_15 ?AUTO_12 ?AUTO_16 )
      ( GET_IMAGE ?AUTO_8 ?AUTO_9 )
      ( GET_IMAGE-VERIFY ?AUTO_8 ?AUTO_9 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_24 - DIRECTION
      ?AUTO_18 - MODE
    )
    :vars
    (
      ?AUTO_21 - INSTRUMENT
      ?AUTO_23 - SATELLITE
      ?AUTO_25 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_21 ?AUTO_23 ) ( SUPPORTS ?AUTO_21 ?AUTO_18 ) ( POWER_ON ?AUTO_21 ) ( CALIBRATION_TARGET ?AUTO_21 ?AUTO_24 ) ( NOT_CALIBRATED ?AUTO_21 ) ( POINTING ?AUTO_23 ?AUTO_25 ) ( not ( = ?AUTO_24 ?AUTO_25 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_23 ?AUTO_24 ?AUTO_25 )
      ( GET_IMAGE ?AUTO_24 ?AUTO_18 )
      ( GET_IMAGE-VERIFY ?AUTO_24 ?AUTO_18 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_28 - DIRECTION
      ?AUTO_29 - MODE
    )
    :vars
    (
      ?AUTO_32 - INSTRUMENT
      ?AUTO_33 - SATELLITE
      ?AUTO_30 - DIRECTION
      ?AUTO_36 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_32 ?AUTO_33 ) ( SUPPORTS ?AUTO_32 ?AUTO_29 ) ( CALIBRATION_TARGET ?AUTO_32 ?AUTO_28 ) ( POINTING ?AUTO_33 ?AUTO_30 ) ( not ( = ?AUTO_28 ?AUTO_30 ) ) ( ON_BOARD ?AUTO_32 ?AUTO_36 ) ( POWER_AVAIL ?AUTO_36 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_32 ?AUTO_36 )
      ( GET_IMAGE ?AUTO_28 ?AUTO_29 )
      ( GET_IMAGE-VERIFY ?AUTO_28 ?AUTO_29 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_45 - DIRECTION
      ?AUTO_46 - MODE
    )
    :vars
    (
      ?AUTO_50 - INSTRUMENT
      ?AUTO_49 - SATELLITE
      ?AUTO_51 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_50 ) ( ON_BOARD ?AUTO_50 ?AUTO_49 ) ( SUPPORTS ?AUTO_50 ?AUTO_46 ) ( POWER_ON ?AUTO_50 ) ( POINTING ?AUTO_49 ?AUTO_51 ) ( not ( = ?AUTO_45 ?AUTO_51 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_49 ?AUTO_45 ?AUTO_51 )
      ( GET_IMAGE ?AUTO_45 ?AUTO_46 )
      ( GET_IMAGE-VERIFY ?AUTO_45 ?AUTO_46 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_56 - DIRECTION
      ?AUTO_57 - MODE
    )
    :vars
    (
      ?AUTO_59 - INSTRUMENT
      ?AUTO_58 - SATELLITE
      ?AUTO_62 - DIRECTION
      ?AUTO_64 - SATELLITE
      ?AUTO_65 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_59 ?AUTO_58 ) ( SUPPORTS ?AUTO_59 ?AUTO_57 ) ( POWER_ON ?AUTO_59 ) ( POINTING ?AUTO_58 ?AUTO_62 ) ( not ( = ?AUTO_56 ?AUTO_62 ) ) ( ON_BOARD ?AUTO_59 ?AUTO_64 ) ( CALIBRATION_TARGET ?AUTO_59 ?AUTO_65 ) ( POINTING ?AUTO_64 ?AUTO_65 ) ( NOT_CALIBRATED ?AUTO_59 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_64 ?AUTO_59 ?AUTO_65 )
      ( GET_IMAGE ?AUTO_56 ?AUTO_57 )
      ( GET_IMAGE-VERIFY ?AUTO_56 ?AUTO_57 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_66 - DIRECTION
      ?AUTO_67 - MODE
    )
    :vars
    (
      ?AUTO_72 - INSTRUMENT
      ?AUTO_73 - SATELLITE
      ?AUTO_74 - DIRECTION
      ?AUTO_75 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_72 ?AUTO_73 ) ( SUPPORTS ?AUTO_72 ?AUTO_67 ) ( POWER_ON ?AUTO_72 ) ( not ( = ?AUTO_66 ?AUTO_74 ) ) ( CALIBRATION_TARGET ?AUTO_72 ?AUTO_74 ) ( NOT_CALIBRATED ?AUTO_72 ) ( POINTING ?AUTO_73 ?AUTO_75 ) ( not ( = ?AUTO_74 ?AUTO_75 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_73 ?AUTO_74 ?AUTO_75 )
      ( GET_IMAGE ?AUTO_66 ?AUTO_67 )
      ( GET_IMAGE-VERIFY ?AUTO_66 ?AUTO_67 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_78 - DIRECTION
      ?AUTO_79 - MODE
    )
    :vars
    (
      ?AUTO_85 - INSTRUMENT
      ?AUTO_82 - SATELLITE
      ?AUTO_83 - DIRECTION
      ?AUTO_81 - DIRECTION
      ?AUTO_87 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_85 ?AUTO_82 ) ( SUPPORTS ?AUTO_85 ?AUTO_79 ) ( not ( = ?AUTO_78 ?AUTO_83 ) ) ( CALIBRATION_TARGET ?AUTO_85 ?AUTO_83 ) ( POINTING ?AUTO_82 ?AUTO_81 ) ( not ( = ?AUTO_83 ?AUTO_81 ) ) ( ON_BOARD ?AUTO_85 ?AUTO_87 ) ( POWER_AVAIL ?AUTO_87 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_85 ?AUTO_87 )
      ( GET_IMAGE ?AUTO_78 ?AUTO_79 )
      ( GET_IMAGE-VERIFY ?AUTO_78 ?AUTO_79 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_115 - DIRECTION
      ?AUTO_116 - MODE
    )
    :vars
    (
      ?AUTO_121 - INSTRUMENT
      ?AUTO_120 - SATELLITE
      ?AUTO_118 - DIRECTION
      ?AUTO_122 - SATELLITE
      ?AUTO_123 - DIRECTION
      ?AUTO_125 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_121 ?AUTO_120 ) ( SUPPORTS ?AUTO_121 ?AUTO_116 ) ( POINTING ?AUTO_120 ?AUTO_118 ) ( not ( = ?AUTO_115 ?AUTO_118 ) ) ( ON_BOARD ?AUTO_121 ?AUTO_122 ) ( CALIBRATION_TARGET ?AUTO_121 ?AUTO_123 ) ( POINTING ?AUTO_122 ?AUTO_123 ) ( ON_BOARD ?AUTO_121 ?AUTO_125 ) ( POWER_AVAIL ?AUTO_125 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_121 ?AUTO_125 )
      ( GET_IMAGE ?AUTO_115 ?AUTO_116 )
      ( GET_IMAGE-VERIFY ?AUTO_115 ?AUTO_116 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_202 - DIRECTION
      ?AUTO_203 - MODE
    )
    :vars
    (
      ?AUTO_208 - INSTRUMENT
      ?AUTO_210 - SATELLITE
      ?AUTO_205 - DIRECTION
      ?AUTO_209 - DIRECTION
      ?AUTO_206 - SATELLITE
      ?AUTO_211 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_208 ?AUTO_210 ) ( SUPPORTS ?AUTO_208 ?AUTO_203 ) ( not ( = ?AUTO_202 ?AUTO_205 ) ) ( CALIBRATION_TARGET ?AUTO_208 ?AUTO_205 ) ( POINTING ?AUTO_210 ?AUTO_209 ) ( not ( = ?AUTO_205 ?AUTO_209 ) ) ( ON_BOARD ?AUTO_208 ?AUTO_206 ) ( ON_BOARD ?AUTO_211 ?AUTO_206 ) ( POWER_ON ?AUTO_211 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_211 ?AUTO_206 )
      ( GET_IMAGE ?AUTO_202 ?AUTO_203 )
      ( GET_IMAGE-VERIFY ?AUTO_202 ?AUTO_203 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_215 - DIRECTION
      ?AUTO_216 - MODE
    )
    :vars
    (
      ?AUTO_222 - INSTRUMENT
      ?AUTO_219 - SATELLITE
      ?AUTO_224 - DIRECTION
      ?AUTO_220 - DIRECTION
      ?AUTO_217 - SATELLITE
      ?AUTO_221 - INSTRUMENT
      ?AUTO_225 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_222 ?AUTO_219 ) ( SUPPORTS ?AUTO_222 ?AUTO_216 ) ( not ( = ?AUTO_215 ?AUTO_224 ) ) ( CALIBRATION_TARGET ?AUTO_222 ?AUTO_224 ) ( not ( = ?AUTO_224 ?AUTO_220 ) ) ( ON_BOARD ?AUTO_222 ?AUTO_217 ) ( ON_BOARD ?AUTO_221 ?AUTO_217 ) ( POWER_ON ?AUTO_221 ) ( POINTING ?AUTO_219 ?AUTO_225 ) ( not ( = ?AUTO_220 ?AUTO_225 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_219 ?AUTO_220 ?AUTO_225 )
      ( GET_IMAGE ?AUTO_215 ?AUTO_216 )
      ( GET_IMAGE-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_264 - DIRECTION
      ?AUTO_265 - MODE
    )
    :vars
    (
      ?AUTO_268 - INSTRUMENT
      ?AUTO_273 - SATELLITE
      ?AUTO_272 - DIRECTION
      ?AUTO_269 - SATELLITE
      ?AUTO_274 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_268 ?AUTO_273 ) ( SUPPORTS ?AUTO_268 ?AUTO_265 ) ( not ( = ?AUTO_264 ?AUTO_272 ) ) ( CALIBRATION_TARGET ?AUTO_268 ?AUTO_272 ) ( ON_BOARD ?AUTO_268 ?AUTO_269 ) ( POWER_AVAIL ?AUTO_269 ) ( POINTING ?AUTO_273 ?AUTO_274 ) ( not ( = ?AUTO_272 ?AUTO_274 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_273 ?AUTO_272 ?AUTO_274 )
      ( GET_IMAGE ?AUTO_264 ?AUTO_265 )
      ( GET_IMAGE-VERIFY ?AUTO_264 ?AUTO_265 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_345 - DIRECTION
      ?AUTO_346 - MODE
    )
    :vars
    (
      ?AUTO_347 - INSTRUMENT
      ?AUTO_349 - SATELLITE
      ?AUTO_350 - DIRECTION
      ?AUTO_348 - SATELLITE
      ?AUTO_353 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_347 ?AUTO_349 ) ( SUPPORTS ?AUTO_347 ?AUTO_346 ) ( CALIBRATION_TARGET ?AUTO_347 ?AUTO_345 ) ( POINTING ?AUTO_349 ?AUTO_350 ) ( not ( = ?AUTO_345 ?AUTO_350 ) ) ( ON_BOARD ?AUTO_347 ?AUTO_348 ) ( ON_BOARD ?AUTO_353 ?AUTO_348 ) ( POWER_ON ?AUTO_353 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_353 ?AUTO_348 )
      ( GET_IMAGE ?AUTO_345 ?AUTO_346 )
      ( GET_IMAGE-VERIFY ?AUTO_345 ?AUTO_346 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_361 - DIRECTION
      ?AUTO_362 - MODE
    )
    :vars
    (
      ?AUTO_369 - INSTRUMENT
      ?AUTO_365 - SATELLITE
      ?AUTO_363 - DIRECTION
      ?AUTO_367 - SATELLITE
      ?AUTO_364 - INSTRUMENT
      ?AUTO_370 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_369 ?AUTO_365 ) ( SUPPORTS ?AUTO_369 ?AUTO_362 ) ( CALIBRATION_TARGET ?AUTO_369 ?AUTO_361 ) ( not ( = ?AUTO_361 ?AUTO_363 ) ) ( ON_BOARD ?AUTO_369 ?AUTO_367 ) ( ON_BOARD ?AUTO_364 ?AUTO_367 ) ( POWER_ON ?AUTO_364 ) ( POINTING ?AUTO_365 ?AUTO_370 ) ( not ( = ?AUTO_363 ?AUTO_370 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_365 ?AUTO_363 ?AUTO_370 )
      ( GET_IMAGE ?AUTO_361 ?AUTO_362 )
      ( GET_IMAGE-VERIFY ?AUTO_361 ?AUTO_362 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_383 - DIRECTION
      ?AUTO_384 - MODE
    )
    :vars
    (
      ?AUTO_389 - INSTRUMENT
      ?AUTO_390 - SATELLITE
      ?AUTO_388 - DIRECTION
      ?AUTO_391 - SATELLITE
      ?AUTO_387 - INSTRUMENT
      ?AUTO_392 - DIRECTION
      ?AUTO_394 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_389 ?AUTO_390 ) ( SUPPORTS ?AUTO_389 ?AUTO_384 ) ( CALIBRATION_TARGET ?AUTO_389 ?AUTO_383 ) ( not ( = ?AUTO_383 ?AUTO_388 ) ) ( ON_BOARD ?AUTO_389 ?AUTO_391 ) ( ON_BOARD ?AUTO_387 ?AUTO_391 ) ( POINTING ?AUTO_390 ?AUTO_392 ) ( not ( = ?AUTO_388 ?AUTO_392 ) ) ( ON_BOARD ?AUTO_387 ?AUTO_394 ) ( POWER_AVAIL ?AUTO_394 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_387 ?AUTO_394 )
      ( GET_IMAGE ?AUTO_383 ?AUTO_384 )
      ( GET_IMAGE-VERIFY ?AUTO_383 ?AUTO_384 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_412 - DIRECTION
      ?AUTO_413 - MODE
    )
    :vars
    (
      ?AUTO_417 - INSTRUMENT
      ?AUTO_416 - SATELLITE
      ?AUTO_418 - SATELLITE
      ?AUTO_419 - DIRECTION
      ?AUTO_421 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_417 ?AUTO_416 ) ( SUPPORTS ?AUTO_417 ?AUTO_413 ) ( POINTING ?AUTO_416 ?AUTO_412 ) ( ON_BOARD ?AUTO_417 ?AUTO_418 ) ( CALIBRATION_TARGET ?AUTO_417 ?AUTO_419 ) ( POINTING ?AUTO_418 ?AUTO_419 ) ( ON_BOARD ?AUTO_417 ?AUTO_421 ) ( POWER_AVAIL ?AUTO_421 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_417 ?AUTO_421 )
      ( GET_IMAGE ?AUTO_412 ?AUTO_413 )
      ( GET_IMAGE-VERIFY ?AUTO_412 ?AUTO_413 ) )
  )

)

