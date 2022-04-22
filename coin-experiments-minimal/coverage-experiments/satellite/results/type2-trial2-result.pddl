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
      ?AUTO_10 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_8 ) ( ON_BOARD ?AUTO_8 ?AUTO_9 ) ( SUPPORTS ?AUTO_8 ?AUTO_7 ) ( POWER_ON ?AUTO_8 ) ( POINTING ?AUTO_9 ?AUTO_10 ) ( not ( = ?AUTO_6 ?AUTO_10 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_9 ?AUTO_6 ?AUTO_10 )
      ( GET_IMAGE ?AUTO_6 ?AUTO_7 )
      ( GET_IMAGE-VERIFY ?AUTO_6 ?AUTO_7 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_11 - DIRECTION
      ?AUTO_12 - MODE
    )
    :vars
    (
      ?AUTO_13 - INSTRUMENT
      ?AUTO_15 - SATELLITE
      ?AUTO_14 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_13 ?AUTO_15 ) ( SUPPORTS ?AUTO_13 ?AUTO_12 ) ( POWER_ON ?AUTO_13 ) ( POINTING ?AUTO_15 ?AUTO_14 ) ( not ( = ?AUTO_11 ?AUTO_14 ) ) ( CALIBRATION_TARGET ?AUTO_13 ?AUTO_14 ) ( NOT_CALIBRATED ?AUTO_13 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_15 ?AUTO_13 ?AUTO_14 )
      ( GET_IMAGE ?AUTO_11 ?AUTO_12 )
      ( GET_IMAGE-VERIFY ?AUTO_11 ?AUTO_12 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_16 - DIRECTION
      ?AUTO_17 - MODE
    )
    :vars
    (
      ?AUTO_20 - INSTRUMENT
      ?AUTO_19 - SATELLITE
      ?AUTO_18 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_20 ?AUTO_19 ) ( SUPPORTS ?AUTO_20 ?AUTO_17 ) ( POINTING ?AUTO_19 ?AUTO_18 ) ( not ( = ?AUTO_16 ?AUTO_18 ) ) ( CALIBRATION_TARGET ?AUTO_20 ?AUTO_18 ) ( POWER_AVAIL ?AUTO_19 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_20 ?AUTO_19 )
      ( GET_IMAGE ?AUTO_16 ?AUTO_17 )
      ( GET_IMAGE-VERIFY ?AUTO_16 ?AUTO_17 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_27 - DIRECTION
      ?AUTO_28 - MODE
    )
    :vars
    (
      ?AUTO_30 - INSTRUMENT
      ?AUTO_29 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_30 ?AUTO_29 ) ( SUPPORTS ?AUTO_30 ?AUTO_28 ) ( POWER_ON ?AUTO_30 ) ( POINTING ?AUTO_29 ?AUTO_27 ) ( CALIBRATION_TARGET ?AUTO_30 ?AUTO_27 ) ( NOT_CALIBRATED ?AUTO_30 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_29 ?AUTO_30 ?AUTO_27 )
      ( GET_IMAGE ?AUTO_27 ?AUTO_28 )
      ( GET_IMAGE-VERIFY ?AUTO_27 ?AUTO_28 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_31 - DIRECTION
      ?AUTO_32 - MODE
    )
    :vars
    (
      ?AUTO_33 - INSTRUMENT
      ?AUTO_34 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_33 ?AUTO_34 ) ( SUPPORTS ?AUTO_33 ?AUTO_32 ) ( POINTING ?AUTO_34 ?AUTO_31 ) ( CALIBRATION_TARGET ?AUTO_33 ?AUTO_31 ) ( POWER_AVAIL ?AUTO_34 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_33 ?AUTO_34 )
      ( GET_IMAGE ?AUTO_31 ?AUTO_32 )
      ( GET_IMAGE-VERIFY ?AUTO_31 ?AUTO_32 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_65 - DIRECTION
      ?AUTO_66 - MODE
    )
    :vars
    (
      ?AUTO_68 - INSTRUMENT
      ?AUTO_67 - SATELLITE
      ?AUTO_69 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_68 ?AUTO_67 ) ( SUPPORTS ?AUTO_68 ?AUTO_66 ) ( POINTING ?AUTO_67 ?AUTO_65 ) ( CALIBRATION_TARGET ?AUTO_68 ?AUTO_65 ) ( ON_BOARD ?AUTO_69 ?AUTO_67 ) ( POWER_ON ?AUTO_69 ) ( not ( = ?AUTO_68 ?AUTO_69 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_69 ?AUTO_67 )
      ( GET_IMAGE ?AUTO_65 ?AUTO_66 )
      ( GET_IMAGE-VERIFY ?AUTO_65 ?AUTO_66 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_103 - DIRECTION
      ?AUTO_104 - MODE
    )
    :vars
    (
      ?AUTO_105 - INSTRUMENT
      ?AUTO_106 - SATELLITE
      ?AUTO_107 - DIRECTION
      ?AUTO_108 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_105 ?AUTO_106 ) ( SUPPORTS ?AUTO_105 ?AUTO_104 ) ( POINTING ?AUTO_106 ?AUTO_107 ) ( not ( = ?AUTO_103 ?AUTO_107 ) ) ( CALIBRATION_TARGET ?AUTO_105 ?AUTO_107 ) ( ON_BOARD ?AUTO_108 ?AUTO_106 ) ( POWER_ON ?AUTO_108 ) ( not ( = ?AUTO_105 ?AUTO_108 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_108 ?AUTO_106 )
      ( GET_IMAGE ?AUTO_103 ?AUTO_104 )
      ( GET_IMAGE-VERIFY ?AUTO_103 ?AUTO_104 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_129 - DIRECTION
      ?AUTO_130 - MODE
    )
    :vars
    (
      ?AUTO_132 - INSTRUMENT
      ?AUTO_131 - SATELLITE
      ?AUTO_133 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_132 ?AUTO_131 ) ( SUPPORTS ?AUTO_132 ?AUTO_130 ) ( POWER_ON ?AUTO_132 ) ( CALIBRATION_TARGET ?AUTO_132 ?AUTO_129 ) ( NOT_CALIBRATED ?AUTO_132 ) ( POINTING ?AUTO_131 ?AUTO_133 ) ( not ( = ?AUTO_129 ?AUTO_133 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_131 ?AUTO_129 ?AUTO_133 )
      ( GET_IMAGE ?AUTO_129 ?AUTO_130 )
      ( GET_IMAGE-VERIFY ?AUTO_129 ?AUTO_130 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_174 - DIRECTION
      ?AUTO_175 - MODE
    )
    :vars
    (
      ?AUTO_177 - INSTRUMENT
      ?AUTO_176 - SATELLITE
      ?AUTO_178 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_177 ?AUTO_176 ) ( SUPPORTS ?AUTO_177 ?AUTO_175 ) ( POWER_ON ?AUTO_177 ) ( not ( = ?AUTO_174 ?AUTO_178 ) ) ( CALIBRATION_TARGET ?AUTO_177 ?AUTO_178 ) ( NOT_CALIBRATED ?AUTO_177 ) ( POINTING ?AUTO_176 ?AUTO_174 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_176 ?AUTO_178 ?AUTO_174 )
      ( GET_IMAGE ?AUTO_174 ?AUTO_175 )
      ( GET_IMAGE-VERIFY ?AUTO_174 ?AUTO_175 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_200 - DIRECTION
      ?AUTO_201 - MODE
    )
    :vars
    (
      ?AUTO_203 - INSTRUMENT
      ?AUTO_202 - SATELLITE
      ?AUTO_204 - DIRECTION
      ?AUTO_205 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_203 ?AUTO_202 ) ( SUPPORTS ?AUTO_203 ?AUTO_201 ) ( not ( = ?AUTO_200 ?AUTO_204 ) ) ( CALIBRATION_TARGET ?AUTO_203 ?AUTO_204 ) ( POWER_AVAIL ?AUTO_202 ) ( POINTING ?AUTO_202 ?AUTO_205 ) ( not ( = ?AUTO_204 ?AUTO_205 ) ) ( not ( = ?AUTO_200 ?AUTO_205 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_202 ?AUTO_204 ?AUTO_205 )
      ( GET_IMAGE ?AUTO_200 ?AUTO_201 )
      ( GET_IMAGE-VERIFY ?AUTO_200 ?AUTO_201 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_295 - DIRECTION
      ?AUTO_296 - MODE
    )
    :vars
    (
      ?AUTO_298 - INSTRUMENT
      ?AUTO_297 - SATELLITE
      ?AUTO_299 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_298 ?AUTO_297 ) ( SUPPORTS ?AUTO_298 ?AUTO_296 ) ( CALIBRATION_TARGET ?AUTO_298 ?AUTO_295 ) ( POINTING ?AUTO_297 ?AUTO_299 ) ( not ( = ?AUTO_295 ?AUTO_299 ) ) ( POWER_AVAIL ?AUTO_297 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_298 ?AUTO_297 )
      ( GET_IMAGE ?AUTO_295 ?AUTO_296 )
      ( GET_IMAGE-VERIFY ?AUTO_295 ?AUTO_296 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_300 - DIRECTION
      ?AUTO_301 - MODE
    )
    :vars
    (
      ?AUTO_304 - INSTRUMENT
      ?AUTO_303 - SATELLITE
      ?AUTO_302 - DIRECTION
      ?AUTO_305 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_304 ?AUTO_303 ) ( SUPPORTS ?AUTO_304 ?AUTO_301 ) ( CALIBRATION_TARGET ?AUTO_304 ?AUTO_300 ) ( POINTING ?AUTO_303 ?AUTO_302 ) ( not ( = ?AUTO_300 ?AUTO_302 ) ) ( ON_BOARD ?AUTO_305 ?AUTO_303 ) ( POWER_ON ?AUTO_305 ) ( not ( = ?AUTO_304 ?AUTO_305 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_305 ?AUTO_303 )
      ( GET_IMAGE ?AUTO_300 ?AUTO_301 )
      ( GET_IMAGE-VERIFY ?AUTO_300 ?AUTO_301 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_312 - DIRECTION
      ?AUTO_313 - MODE
    )
    :vars
    (
      ?AUTO_315 - INSTRUMENT
      ?AUTO_317 - SATELLITE
      ?AUTO_314 - DIRECTION
      ?AUTO_316 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_315 ?AUTO_317 ) ( SUPPORTS ?AUTO_315 ?AUTO_313 ) ( CALIBRATION_TARGET ?AUTO_315 ?AUTO_312 ) ( not ( = ?AUTO_312 ?AUTO_314 ) ) ( ON_BOARD ?AUTO_316 ?AUTO_317 ) ( POWER_ON ?AUTO_316 ) ( not ( = ?AUTO_315 ?AUTO_316 ) ) ( POINTING ?AUTO_317 ?AUTO_312 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_317 ?AUTO_314 ?AUTO_312 )
      ( GET_IMAGE ?AUTO_312 ?AUTO_313 )
      ( GET_IMAGE-VERIFY ?AUTO_312 ?AUTO_313 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_320 - DIRECTION
      ?AUTO_321 - MODE
    )
    :vars
    (
      ?AUTO_322 - INSTRUMENT
      ?AUTO_323 - SATELLITE
      ?AUTO_325 - DIRECTION
      ?AUTO_324 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_322 ?AUTO_323 ) ( SUPPORTS ?AUTO_322 ?AUTO_321 ) ( CALIBRATION_TARGET ?AUTO_322 ?AUTO_320 ) ( not ( = ?AUTO_320 ?AUTO_325 ) ) ( ON_BOARD ?AUTO_324 ?AUTO_323 ) ( not ( = ?AUTO_322 ?AUTO_324 ) ) ( POINTING ?AUTO_323 ?AUTO_320 ) ( POWER_AVAIL ?AUTO_323 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_324 ?AUTO_323 )
      ( GET_IMAGE ?AUTO_320 ?AUTO_321 )
      ( GET_IMAGE-VERIFY ?AUTO_320 ?AUTO_321 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_357 - DIRECTION
      ?AUTO_358 - MODE
    )
    :vars
    (
      ?AUTO_360 - INSTRUMENT
      ?AUTO_361 - SATELLITE
      ?AUTO_359 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_360 ?AUTO_361 ) ( SUPPORTS ?AUTO_360 ?AUTO_358 ) ( not ( = ?AUTO_357 ?AUTO_359 ) ) ( CALIBRATION_TARGET ?AUTO_360 ?AUTO_359 ) ( POINTING ?AUTO_361 ?AUTO_357 ) ( POWER_AVAIL ?AUTO_361 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_360 ?AUTO_361 )
      ( GET_IMAGE ?AUTO_357 ?AUTO_358 )
      ( GET_IMAGE-VERIFY ?AUTO_357 ?AUTO_358 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_362 - DIRECTION
      ?AUTO_363 - MODE
    )
    :vars
    (
      ?AUTO_366 - INSTRUMENT
      ?AUTO_364 - SATELLITE
      ?AUTO_365 - DIRECTION
      ?AUTO_367 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_366 ?AUTO_364 ) ( SUPPORTS ?AUTO_366 ?AUTO_363 ) ( not ( = ?AUTO_362 ?AUTO_365 ) ) ( CALIBRATION_TARGET ?AUTO_366 ?AUTO_365 ) ( POINTING ?AUTO_364 ?AUTO_362 ) ( ON_BOARD ?AUTO_367 ?AUTO_364 ) ( POWER_ON ?AUTO_367 ) ( not ( = ?AUTO_366 ?AUTO_367 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_367 ?AUTO_364 )
      ( GET_IMAGE ?AUTO_362 ?AUTO_363 )
      ( GET_IMAGE-VERIFY ?AUTO_362 ?AUTO_363 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_370 - DIRECTION
      ?AUTO_371 - MODE
    )
    :vars
    (
      ?AUTO_375 - INSTRUMENT
      ?AUTO_372 - SATELLITE
      ?AUTO_373 - DIRECTION
      ?AUTO_374 - INSTRUMENT
      ?AUTO_376 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_375 ?AUTO_372 ) ( SUPPORTS ?AUTO_375 ?AUTO_371 ) ( not ( = ?AUTO_370 ?AUTO_373 ) ) ( CALIBRATION_TARGET ?AUTO_375 ?AUTO_373 ) ( ON_BOARD ?AUTO_374 ?AUTO_372 ) ( POWER_ON ?AUTO_374 ) ( not ( = ?AUTO_375 ?AUTO_374 ) ) ( POINTING ?AUTO_372 ?AUTO_376 ) ( not ( = ?AUTO_370 ?AUTO_376 ) ) ( not ( = ?AUTO_373 ?AUTO_376 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_372 ?AUTO_370 ?AUTO_376 )
      ( GET_IMAGE ?AUTO_370 ?AUTO_371 )
      ( GET_IMAGE-VERIFY ?AUTO_370 ?AUTO_371 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_379 - DIRECTION
      ?AUTO_380 - MODE
    )
    :vars
    (
      ?AUTO_385 - INSTRUMENT
      ?AUTO_382 - SATELLITE
      ?AUTO_383 - DIRECTION
      ?AUTO_384 - INSTRUMENT
      ?AUTO_381 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_385 ?AUTO_382 ) ( SUPPORTS ?AUTO_385 ?AUTO_380 ) ( not ( = ?AUTO_379 ?AUTO_383 ) ) ( CALIBRATION_TARGET ?AUTO_385 ?AUTO_383 ) ( ON_BOARD ?AUTO_384 ?AUTO_382 ) ( POWER_ON ?AUTO_384 ) ( not ( = ?AUTO_385 ?AUTO_384 ) ) ( not ( = ?AUTO_379 ?AUTO_381 ) ) ( not ( = ?AUTO_383 ?AUTO_381 ) ) ( POINTING ?AUTO_382 ?AUTO_383 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_382 ?AUTO_381 ?AUTO_383 )
      ( GET_IMAGE ?AUTO_379 ?AUTO_380 )
      ( GET_IMAGE-VERIFY ?AUTO_379 ?AUTO_380 ) )
  )

)

