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
      ?AUTO_3 - DIRECTION
      ?AUTO_2 - MODE
    )
    :vars
    (
      ?AUTO_4 - INSTRUMENT
      ?AUTO_5 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_4 ) ( ON_BOARD ?AUTO_4 ?AUTO_5 ) ( SUPPORTS ?AUTO_4 ?AUTO_2 ) ( POWER_ON ?AUTO_4 ) ( POINTING ?AUTO_5 ?AUTO_3 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_5 ?AUTO_3 ?AUTO_4 ?AUTO_2 )
      ( GET_IMAGE-VERIFY ?AUTO_3 ?AUTO_2 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_7 - DIRECTION
      ?AUTO_6 - MODE
    )
    :vars
    (
      ?AUTO_8 - INSTRUMENT
      ?AUTO_9 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_8 ?AUTO_9 ) ( SUPPORTS ?AUTO_8 ?AUTO_6 ) ( POWER_ON ?AUTO_8 ) ( POINTING ?AUTO_9 ?AUTO_7 ) ( CALIBRATION_TARGET ?AUTO_8 ?AUTO_7 ) ( NOT_CALIBRATED ?AUTO_8 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9 ?AUTO_8 ?AUTO_7 )
      ( GET_IMAGE ?AUTO_7 ?AUTO_6 )
      ( GET_IMAGE-VERIFY ?AUTO_7 ?AUTO_6 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_11 - DIRECTION
      ?AUTO_10 - MODE
    )
    :vars
    (
      ?AUTO_13 - INSTRUMENT
      ?AUTO_12 - SATELLITE
      ?AUTO_14 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_13 ?AUTO_12 ) ( SUPPORTS ?AUTO_13 ?AUTO_10 ) ( POWER_ON ?AUTO_13 ) ( CALIBRATION_TARGET ?AUTO_13 ?AUTO_11 ) ( NOT_CALIBRATED ?AUTO_13 ) ( POINTING ?AUTO_12 ?AUTO_14 ) ( not ( = ?AUTO_11 ?AUTO_14 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_12 ?AUTO_11 ?AUTO_14 )
      ( GET_IMAGE ?AUTO_11 ?AUTO_10 )
      ( GET_IMAGE-VERIFY ?AUTO_11 ?AUTO_10 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_16 - DIRECTION
      ?AUTO_15 - MODE
    )
    :vars
    (
      ?AUTO_19 - INSTRUMENT
      ?AUTO_17 - SATELLITE
      ?AUTO_18 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_19 ?AUTO_17 ) ( SUPPORTS ?AUTO_19 ?AUTO_15 ) ( CALIBRATION_TARGET ?AUTO_19 ?AUTO_16 ) ( POINTING ?AUTO_17 ?AUTO_18 ) ( not ( = ?AUTO_16 ?AUTO_18 ) ) ( POWER_AVAIL ?AUTO_17 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_19 ?AUTO_17 )
      ( GET_IMAGE ?AUTO_16 ?AUTO_15 )
      ( GET_IMAGE-VERIFY ?AUTO_16 ?AUTO_15 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_27 - DIRECTION
      ?AUTO_26 - MODE
    )
    :vars
    (
      ?AUTO_28 - INSTRUMENT
      ?AUTO_29 - SATELLITE
      ?AUTO_30 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_28 ) ( ON_BOARD ?AUTO_28 ?AUTO_29 ) ( SUPPORTS ?AUTO_28 ?AUTO_26 ) ( POWER_ON ?AUTO_28 ) ( POINTING ?AUTO_29 ?AUTO_30 ) ( not ( = ?AUTO_27 ?AUTO_30 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_29 ?AUTO_27 ?AUTO_30 )
      ( GET_IMAGE ?AUTO_27 ?AUTO_26 )
      ( GET_IMAGE-VERIFY ?AUTO_27 ?AUTO_26 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_34 - DIRECTION
      ?AUTO_33 - MODE
    )
    :vars
    (
      ?AUTO_35 - INSTRUMENT
      ?AUTO_37 - SATELLITE
      ?AUTO_36 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_35 ?AUTO_37 ) ( SUPPORTS ?AUTO_35 ?AUTO_33 ) ( POWER_ON ?AUTO_35 ) ( POINTING ?AUTO_37 ?AUTO_36 ) ( not ( = ?AUTO_34 ?AUTO_36 ) ) ( CALIBRATION_TARGET ?AUTO_35 ?AUTO_36 ) ( NOT_CALIBRATED ?AUTO_35 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_37 ?AUTO_35 ?AUTO_36 )
      ( GET_IMAGE ?AUTO_34 ?AUTO_33 )
      ( GET_IMAGE-VERIFY ?AUTO_34 ?AUTO_33 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_39 - DIRECTION
      ?AUTO_38 - MODE
    )
    :vars
    (
      ?AUTO_40 - INSTRUMENT
      ?AUTO_42 - SATELLITE
      ?AUTO_41 - DIRECTION
      ?AUTO_43 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_40 ?AUTO_42 ) ( SUPPORTS ?AUTO_40 ?AUTO_38 ) ( POWER_ON ?AUTO_40 ) ( not ( = ?AUTO_39 ?AUTO_41 ) ) ( CALIBRATION_TARGET ?AUTO_40 ?AUTO_41 ) ( NOT_CALIBRATED ?AUTO_40 ) ( POINTING ?AUTO_42 ?AUTO_43 ) ( not ( = ?AUTO_41 ?AUTO_43 ) ) ( not ( = ?AUTO_39 ?AUTO_43 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_42 ?AUTO_41 ?AUTO_43 )
      ( GET_IMAGE ?AUTO_39 ?AUTO_38 )
      ( GET_IMAGE-VERIFY ?AUTO_39 ?AUTO_38 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_45 - DIRECTION
      ?AUTO_44 - MODE
    )
    :vars
    (
      ?AUTO_48 - INSTRUMENT
      ?AUTO_47 - SATELLITE
      ?AUTO_46 - DIRECTION
      ?AUTO_49 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_48 ?AUTO_47 ) ( SUPPORTS ?AUTO_48 ?AUTO_44 ) ( not ( = ?AUTO_45 ?AUTO_46 ) ) ( CALIBRATION_TARGET ?AUTO_48 ?AUTO_46 ) ( POINTING ?AUTO_47 ?AUTO_49 ) ( not ( = ?AUTO_46 ?AUTO_49 ) ) ( not ( = ?AUTO_45 ?AUTO_49 ) ) ( POWER_AVAIL ?AUTO_47 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_48 ?AUTO_47 )
      ( GET_IMAGE ?AUTO_45 ?AUTO_44 )
      ( GET_IMAGE-VERIFY ?AUTO_45 ?AUTO_44 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_70 - DIRECTION
      ?AUTO_69 - MODE
    )
    :vars
    (
      ?AUTO_72 - INSTRUMENT
      ?AUTO_71 - SATELLITE
      ?AUTO_73 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_72 ?AUTO_71 ) ( SUPPORTS ?AUTO_72 ?AUTO_69 ) ( POWER_ON ?AUTO_72 ) ( not ( = ?AUTO_70 ?AUTO_73 ) ) ( CALIBRATION_TARGET ?AUTO_72 ?AUTO_73 ) ( NOT_CALIBRATED ?AUTO_72 ) ( POINTING ?AUTO_71 ?AUTO_70 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_71 ?AUTO_73 ?AUTO_70 )
      ( GET_IMAGE ?AUTO_70 ?AUTO_69 )
      ( GET_IMAGE-VERIFY ?AUTO_70 ?AUTO_69 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_75 - DIRECTION
      ?AUTO_74 - MODE
    )
    :vars
    (
      ?AUTO_78 - INSTRUMENT
      ?AUTO_76 - SATELLITE
      ?AUTO_77 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_78 ?AUTO_76 ) ( SUPPORTS ?AUTO_78 ?AUTO_74 ) ( not ( = ?AUTO_75 ?AUTO_77 ) ) ( CALIBRATION_TARGET ?AUTO_78 ?AUTO_77 ) ( POINTING ?AUTO_76 ?AUTO_75 ) ( POWER_AVAIL ?AUTO_76 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_78 ?AUTO_76 )
      ( GET_IMAGE ?AUTO_75 ?AUTO_74 )
      ( GET_IMAGE-VERIFY ?AUTO_75 ?AUTO_74 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_89 - DIRECTION
      ?AUTO_90 - MODE
    )
    :vars
    (
      ?AUTO_92 - INSTRUMENT
      ?AUTO_91 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_92 ?AUTO_91 ) ( SUPPORTS ?AUTO_92 ?AUTO_90 ) ( POINTING ?AUTO_91 ?AUTO_89 ) ( CALIBRATION_TARGET ?AUTO_92 ?AUTO_89 ) ( POWER_AVAIL ?AUTO_91 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_92 ?AUTO_91 )
      ( GET_IMAGE ?AUTO_89 ?AUTO_90 )
      ( GET_IMAGE-VERIFY ?AUTO_89 ?AUTO_90 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_109 - DIRECTION
      ?AUTO_110 - MODE
    )
    :vars
    (
      ?AUTO_113 - INSTRUMENT
      ?AUTO_112 - SATELLITE
      ?AUTO_111 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_113 ?AUTO_112 ) ( SUPPORTS ?AUTO_113 ?AUTO_110 ) ( POINTING ?AUTO_112 ?AUTO_111 ) ( not ( = ?AUTO_109 ?AUTO_111 ) ) ( CALIBRATION_TARGET ?AUTO_113 ?AUTO_111 ) ( POWER_AVAIL ?AUTO_112 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_113 ?AUTO_112 )
      ( GET_IMAGE ?AUTO_109 ?AUTO_110 )
      ( GET_IMAGE-VERIFY ?AUTO_109 ?AUTO_110 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_166 - DIRECTION
      ?AUTO_167 - MODE
    )
    :vars
    (
      ?AUTO_169 - INSTRUMENT
      ?AUTO_168 - SATELLITE
      ?AUTO_170 - DIRECTION
      ?AUTO_171 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_169 ?AUTO_168 ) ( SUPPORTS ?AUTO_169 ?AUTO_167 ) ( not ( = ?AUTO_166 ?AUTO_170 ) ) ( CALIBRATION_TARGET ?AUTO_169 ?AUTO_170 ) ( POWER_AVAIL ?AUTO_168 ) ( POINTING ?AUTO_168 ?AUTO_171 ) ( not ( = ?AUTO_166 ?AUTO_171 ) ) ( not ( = ?AUTO_170 ?AUTO_171 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_168 ?AUTO_166 ?AUTO_171 )
      ( GET_IMAGE ?AUTO_166 ?AUTO_167 )
      ( GET_IMAGE-VERIFY ?AUTO_166 ?AUTO_167 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_190 - DIRECTION
      ?AUTO_191 - MODE
    )
    :vars
    (
      ?AUTO_193 - INSTRUMENT
      ?AUTO_192 - SATELLITE
      ?AUTO_194 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_193 ?AUTO_192 ) ( SUPPORTS ?AUTO_193 ?AUTO_191 ) ( CALIBRATION_TARGET ?AUTO_193 ?AUTO_190 ) ( POWER_AVAIL ?AUTO_192 ) ( POINTING ?AUTO_192 ?AUTO_194 ) ( not ( = ?AUTO_190 ?AUTO_194 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_192 ?AUTO_190 ?AUTO_194 )
      ( GET_IMAGE ?AUTO_190 ?AUTO_191 )
      ( GET_IMAGE-VERIFY ?AUTO_190 ?AUTO_191 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_241 - DIRECTION
      ?AUTO_242 - MODE
    )
    :vars
    (
      ?AUTO_243 - INSTRUMENT
      ?AUTO_245 - SATELLITE
      ?AUTO_244 - DIRECTION
      ?AUTO_246 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_243 ?AUTO_245 ) ( SUPPORTS ?AUTO_243 ?AUTO_242 ) ( not ( = ?AUTO_241 ?AUTO_244 ) ) ( CALIBRATION_TARGET ?AUTO_243 ?AUTO_244 ) ( POINTING ?AUTO_245 ?AUTO_241 ) ( ON_BOARD ?AUTO_246 ?AUTO_245 ) ( POWER_ON ?AUTO_246 ) ( not ( = ?AUTO_243 ?AUTO_246 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_246 ?AUTO_245 )
      ( GET_IMAGE ?AUTO_241 ?AUTO_242 )
      ( GET_IMAGE-VERIFY ?AUTO_241 ?AUTO_242 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_308 - DIRECTION
      ?AUTO_309 - MODE
    )
    :vars
    (
      ?AUTO_311 - INSTRUMENT
      ?AUTO_312 - SATELLITE
      ?AUTO_310 - DIRECTION
      ?AUTO_313 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_311 ?AUTO_312 ) ( SUPPORTS ?AUTO_311 ?AUTO_309 ) ( not ( = ?AUTO_308 ?AUTO_310 ) ) ( CALIBRATION_TARGET ?AUTO_311 ?AUTO_310 ) ( POWER_AVAIL ?AUTO_312 ) ( POINTING ?AUTO_312 ?AUTO_313 ) ( not ( = ?AUTO_310 ?AUTO_313 ) ) ( not ( = ?AUTO_308 ?AUTO_313 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_312 ?AUTO_310 ?AUTO_313 )
      ( GET_IMAGE ?AUTO_308 ?AUTO_309 )
      ( GET_IMAGE-VERIFY ?AUTO_308 ?AUTO_309 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_335 - DIRECTION
      ?AUTO_336 - MODE
    )
    :vars
    (
      ?AUTO_338 - INSTRUMENT
      ?AUTO_339 - SATELLITE
      ?AUTO_337 - DIRECTION
      ?AUTO_340 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_338 ?AUTO_339 ) ( SUPPORTS ?AUTO_338 ?AUTO_336 ) ( POINTING ?AUTO_339 ?AUTO_337 ) ( not ( = ?AUTO_335 ?AUTO_337 ) ) ( CALIBRATION_TARGET ?AUTO_338 ?AUTO_337 ) ( ON_BOARD ?AUTO_340 ?AUTO_339 ) ( POWER_ON ?AUTO_340 ) ( not ( = ?AUTO_338 ?AUTO_340 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_340 ?AUTO_339 )
      ( GET_IMAGE ?AUTO_335 ?AUTO_336 )
      ( GET_IMAGE-VERIFY ?AUTO_335 ?AUTO_336 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_343 - DIRECTION
      ?AUTO_344 - MODE
    )
    :vars
    (
      ?AUTO_346 - INSTRUMENT
      ?AUTO_348 - SATELLITE
      ?AUTO_347 - DIRECTION
      ?AUTO_345 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_346 ?AUTO_348 ) ( SUPPORTS ?AUTO_346 ?AUTO_344 ) ( not ( = ?AUTO_343 ?AUTO_347 ) ) ( CALIBRATION_TARGET ?AUTO_346 ?AUTO_347 ) ( ON_BOARD ?AUTO_345 ?AUTO_348 ) ( POWER_ON ?AUTO_345 ) ( not ( = ?AUTO_346 ?AUTO_345 ) ) ( POINTING ?AUTO_348 ?AUTO_343 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_348 ?AUTO_347 ?AUTO_343 )
      ( GET_IMAGE ?AUTO_343 ?AUTO_344 )
      ( GET_IMAGE-VERIFY ?AUTO_343 ?AUTO_344 ) )
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
      ?AUTO_354 - DIRECTION
      ?AUTO_352 - INSTRUMENT
      ?AUTO_355 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_351 ?AUTO_353 ) ( SUPPORTS ?AUTO_351 ?AUTO_350 ) ( not ( = ?AUTO_349 ?AUTO_354 ) ) ( CALIBRATION_TARGET ?AUTO_351 ?AUTO_354 ) ( ON_BOARD ?AUTO_352 ?AUTO_353 ) ( POWER_ON ?AUTO_352 ) ( not ( = ?AUTO_351 ?AUTO_352 ) ) ( POINTING ?AUTO_353 ?AUTO_355 ) ( not ( = ?AUTO_349 ?AUTO_355 ) ) ( not ( = ?AUTO_354 ?AUTO_355 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_353 ?AUTO_349 ?AUTO_355 )
      ( GET_IMAGE ?AUTO_349 ?AUTO_350 )
      ( GET_IMAGE-VERIFY ?AUTO_349 ?AUTO_350 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_358 - DIRECTION
      ?AUTO_359 - MODE
    )
    :vars
    (
      ?AUTO_363 - INSTRUMENT
      ?AUTO_361 - SATELLITE
      ?AUTO_364 - DIRECTION
      ?AUTO_362 - INSTRUMENT
      ?AUTO_360 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_363 ?AUTO_361 ) ( SUPPORTS ?AUTO_363 ?AUTO_359 ) ( not ( = ?AUTO_358 ?AUTO_364 ) ) ( CALIBRATION_TARGET ?AUTO_363 ?AUTO_364 ) ( ON_BOARD ?AUTO_362 ?AUTO_361 ) ( not ( = ?AUTO_363 ?AUTO_362 ) ) ( POINTING ?AUTO_361 ?AUTO_360 ) ( not ( = ?AUTO_358 ?AUTO_360 ) ) ( not ( = ?AUTO_364 ?AUTO_360 ) ) ( POWER_AVAIL ?AUTO_361 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_362 ?AUTO_361 )
      ( GET_IMAGE ?AUTO_358 ?AUTO_359 )
      ( GET_IMAGE-VERIFY ?AUTO_358 ?AUTO_359 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_414 - DIRECTION
      ?AUTO_415 - MODE
    )
    :vars
    (
      ?AUTO_419 - INSTRUMENT
      ?AUTO_416 - SATELLITE
      ?AUTO_418 - DIRECTION
      ?AUTO_417 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_419 ?AUTO_416 ) ( SUPPORTS ?AUTO_419 ?AUTO_415 ) ( not ( = ?AUTO_414 ?AUTO_418 ) ) ( CALIBRATION_TARGET ?AUTO_419 ?AUTO_418 ) ( ON_BOARD ?AUTO_417 ?AUTO_416 ) ( not ( = ?AUTO_419 ?AUTO_417 ) ) ( POINTING ?AUTO_416 ?AUTO_414 ) ( POWER_AVAIL ?AUTO_416 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_417 ?AUTO_416 )
      ( GET_IMAGE ?AUTO_414 ?AUTO_415 )
      ( GET_IMAGE-VERIFY ?AUTO_414 ?AUTO_415 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_468 - DIRECTION
      ?AUTO_469 - MODE
    )
    :vars
    (
      ?AUTO_471 - INSTRUMENT
      ?AUTO_472 - SATELLITE
      ?AUTO_470 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_471 ?AUTO_472 ) ( SUPPORTS ?AUTO_471 ?AUTO_469 ) ( not ( = ?AUTO_468 ?AUTO_470 ) ) ( CALIBRATION_TARGET ?AUTO_471 ?AUTO_470 ) ( POWER_AVAIL ?AUTO_472 ) ( POINTING ?AUTO_472 ?AUTO_468 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_472 ?AUTO_470 ?AUTO_468 )
      ( GET_IMAGE ?AUTO_468 ?AUTO_469 )
      ( GET_IMAGE-VERIFY ?AUTO_468 ?AUTO_469 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_493 - DIRECTION
      ?AUTO_494 - MODE
    )
    :vars
    (
      ?AUTO_496 - INSTRUMENT
      ?AUTO_497 - SATELLITE
      ?AUTO_495 - DIRECTION
      ?AUTO_498 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_496 ?AUTO_497 ) ( SUPPORTS ?AUTO_496 ?AUTO_494 ) ( CALIBRATION_TARGET ?AUTO_496 ?AUTO_493 ) ( POINTING ?AUTO_497 ?AUTO_495 ) ( not ( = ?AUTO_493 ?AUTO_495 ) ) ( ON_BOARD ?AUTO_498 ?AUTO_497 ) ( POWER_ON ?AUTO_498 ) ( not ( = ?AUTO_496 ?AUTO_498 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_498 ?AUTO_497 )
      ( GET_IMAGE ?AUTO_493 ?AUTO_494 )
      ( GET_IMAGE-VERIFY ?AUTO_493 ?AUTO_494 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_501 - DIRECTION
      ?AUTO_502 - MODE
    )
    :vars
    (
      ?AUTO_506 - INSTRUMENT
      ?AUTO_503 - SATELLITE
      ?AUTO_505 - DIRECTION
      ?AUTO_504 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_506 ?AUTO_503 ) ( SUPPORTS ?AUTO_506 ?AUTO_502 ) ( CALIBRATION_TARGET ?AUTO_506 ?AUTO_501 ) ( not ( = ?AUTO_501 ?AUTO_505 ) ) ( ON_BOARD ?AUTO_504 ?AUTO_503 ) ( POWER_ON ?AUTO_504 ) ( not ( = ?AUTO_506 ?AUTO_504 ) ) ( POINTING ?AUTO_503 ?AUTO_501 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_503 ?AUTO_505 ?AUTO_501 )
      ( GET_IMAGE ?AUTO_501 ?AUTO_502 )
      ( GET_IMAGE-VERIFY ?AUTO_501 ?AUTO_502 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_549 - DIRECTION
      ?AUTO_550 - MODE
    )
    :vars
    (
      ?AUTO_552 - INSTRUMENT
      ?AUTO_554 - SATELLITE
      ?AUTO_551 - DIRECTION
      ?AUTO_553 - DIRECTION
      ?AUTO_555 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_552 ?AUTO_554 ) ( SUPPORTS ?AUTO_552 ?AUTO_550 ) ( not ( = ?AUTO_549 ?AUTO_551 ) ) ( CALIBRATION_TARGET ?AUTO_552 ?AUTO_551 ) ( POINTING ?AUTO_554 ?AUTO_553 ) ( not ( = ?AUTO_551 ?AUTO_553 ) ) ( not ( = ?AUTO_549 ?AUTO_553 ) ) ( ON_BOARD ?AUTO_555 ?AUTO_554 ) ( POWER_ON ?AUTO_555 ) ( not ( = ?AUTO_552 ?AUTO_555 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_555 ?AUTO_554 )
      ( GET_IMAGE ?AUTO_549 ?AUTO_550 )
      ( GET_IMAGE-VERIFY ?AUTO_549 ?AUTO_550 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_558 - DIRECTION
      ?AUTO_559 - MODE
    )
    :vars
    (
      ?AUTO_561 - INSTRUMENT
      ?AUTO_564 - SATELLITE
      ?AUTO_563 - DIRECTION
      ?AUTO_560 - DIRECTION
      ?AUTO_562 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_561 ?AUTO_564 ) ( SUPPORTS ?AUTO_561 ?AUTO_559 ) ( not ( = ?AUTO_558 ?AUTO_563 ) ) ( CALIBRATION_TARGET ?AUTO_561 ?AUTO_563 ) ( not ( = ?AUTO_563 ?AUTO_560 ) ) ( not ( = ?AUTO_558 ?AUTO_560 ) ) ( ON_BOARD ?AUTO_562 ?AUTO_564 ) ( POWER_ON ?AUTO_562 ) ( not ( = ?AUTO_561 ?AUTO_562 ) ) ( POINTING ?AUTO_564 ?AUTO_563 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_564 ?AUTO_560 ?AUTO_563 )
      ( GET_IMAGE ?AUTO_558 ?AUTO_559 )
      ( GET_IMAGE-VERIFY ?AUTO_558 ?AUTO_559 ) )
  )

)

