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
      ?AUTO_14 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_13 ?AUTO_12 ) ( SUPPORTS ?AUTO_13 ?AUTO_11 ) ( POWER_ON ?AUTO_13 ) ( CALIBRATION_TARGET ?AUTO_13 ?AUTO_10 ) ( NOT_CALIBRATED ?AUTO_13 ) ( POINTING ?AUTO_12 ?AUTO_14 ) ( not ( = ?AUTO_10 ?AUTO_14 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_12 ?AUTO_10 ?AUTO_14 )
      ( GET_IMAGE ?AUTO_10 ?AUTO_11 )
      ( GET_IMAGE-VERIFY ?AUTO_10 ?AUTO_11 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_15 - DIRECTION
      ?AUTO_16 - MODE
    )
    :vars
    (
      ?AUTO_18 - INSTRUMENT
      ?AUTO_17 - SATELLITE
      ?AUTO_19 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_18 ?AUTO_17 ) ( SUPPORTS ?AUTO_18 ?AUTO_16 ) ( CALIBRATION_TARGET ?AUTO_18 ?AUTO_15 ) ( POINTING ?AUTO_17 ?AUTO_19 ) ( not ( = ?AUTO_15 ?AUTO_19 ) ) ( POWER_AVAIL ?AUTO_17 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_18 ?AUTO_17 )
      ( GET_IMAGE ?AUTO_15 ?AUTO_16 )
      ( GET_IMAGE-VERIFY ?AUTO_15 ?AUTO_16 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_26 - DIRECTION
      ?AUTO_27 - MODE
    )
    :vars
    (
      ?AUTO_29 - INSTRUMENT
      ?AUTO_28 - SATELLITE
      ?AUTO_30 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_29 ) ( ON_BOARD ?AUTO_29 ?AUTO_28 ) ( SUPPORTS ?AUTO_29 ?AUTO_27 ) ( POWER_ON ?AUTO_29 ) ( POINTING ?AUTO_28 ?AUTO_30 ) ( not ( = ?AUTO_26 ?AUTO_30 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_28 ?AUTO_26 ?AUTO_30 )
      ( GET_IMAGE ?AUTO_26 ?AUTO_27 )
      ( GET_IMAGE-VERIFY ?AUTO_26 ?AUTO_27 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_33 - DIRECTION
      ?AUTO_34 - MODE
    )
    :vars
    (
      ?AUTO_37 - INSTRUMENT
      ?AUTO_35 - SATELLITE
      ?AUTO_36 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_37 ?AUTO_35 ) ( SUPPORTS ?AUTO_37 ?AUTO_34 ) ( POWER_ON ?AUTO_37 ) ( POINTING ?AUTO_35 ?AUTO_36 ) ( not ( = ?AUTO_33 ?AUTO_36 ) ) ( CALIBRATION_TARGET ?AUTO_37 ?AUTO_36 ) ( NOT_CALIBRATED ?AUTO_37 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_35 ?AUTO_37 ?AUTO_36 )
      ( GET_IMAGE ?AUTO_33 ?AUTO_34 )
      ( GET_IMAGE-VERIFY ?AUTO_33 ?AUTO_34 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_38 - DIRECTION
      ?AUTO_39 - MODE
    )
    :vars
    (
      ?AUTO_42 - INSTRUMENT
      ?AUTO_40 - SATELLITE
      ?AUTO_41 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_42 ?AUTO_40 ) ( SUPPORTS ?AUTO_42 ?AUTO_39 ) ( POWER_ON ?AUTO_42 ) ( not ( = ?AUTO_38 ?AUTO_41 ) ) ( CALIBRATION_TARGET ?AUTO_42 ?AUTO_41 ) ( NOT_CALIBRATED ?AUTO_42 ) ( POINTING ?AUTO_40 ?AUTO_38 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_40 ?AUTO_41 ?AUTO_38 )
      ( GET_IMAGE ?AUTO_38 ?AUTO_39 )
      ( GET_IMAGE-VERIFY ?AUTO_38 ?AUTO_39 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_43 - DIRECTION
      ?AUTO_44 - MODE
    )
    :vars
    (
      ?AUTO_46 - INSTRUMENT
      ?AUTO_47 - SATELLITE
      ?AUTO_45 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_46 ?AUTO_47 ) ( SUPPORTS ?AUTO_46 ?AUTO_44 ) ( not ( = ?AUTO_43 ?AUTO_45 ) ) ( CALIBRATION_TARGET ?AUTO_46 ?AUTO_45 ) ( POINTING ?AUTO_47 ?AUTO_43 ) ( POWER_AVAIL ?AUTO_47 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_46 ?AUTO_47 )
      ( GET_IMAGE ?AUTO_43 ?AUTO_44 )
      ( GET_IMAGE-VERIFY ?AUTO_43 ?AUTO_44 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_64 - DIRECTION
      ?AUTO_65 - MODE
    )
    :vars
    (
      ?AUTO_67 - INSTRUMENT
      ?AUTO_68 - SATELLITE
      ?AUTO_66 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_67 ?AUTO_68 ) ( SUPPORTS ?AUTO_67 ?AUTO_65 ) ( POINTING ?AUTO_68 ?AUTO_66 ) ( not ( = ?AUTO_64 ?AUTO_66 ) ) ( CALIBRATION_TARGET ?AUTO_67 ?AUTO_66 ) ( POWER_AVAIL ?AUTO_68 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_67 ?AUTO_68 )
      ( GET_IMAGE ?AUTO_64 ?AUTO_65 )
      ( GET_IMAGE-VERIFY ?AUTO_64 ?AUTO_65 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_131 - DIRECTION
      ?AUTO_132 - MODE
    )
    :vars
    (
      ?AUTO_135 - INSTRUMENT
      ?AUTO_134 - SATELLITE
      ?AUTO_133 - DIRECTION
      ?AUTO_136 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_135 ?AUTO_134 ) ( SUPPORTS ?AUTO_135 ?AUTO_132 ) ( not ( = ?AUTO_131 ?AUTO_133 ) ) ( CALIBRATION_TARGET ?AUTO_135 ?AUTO_133 ) ( POWER_AVAIL ?AUTO_134 ) ( POINTING ?AUTO_134 ?AUTO_136 ) ( not ( = ?AUTO_131 ?AUTO_136 ) ) ( not ( = ?AUTO_133 ?AUTO_136 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_134 ?AUTO_131 ?AUTO_136 )
      ( GET_IMAGE ?AUTO_131 ?AUTO_132 )
      ( GET_IMAGE-VERIFY ?AUTO_131 ?AUTO_132 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_205 - DIRECTION
      ?AUTO_206 - MODE
    )
    :vars
    (
      ?AUTO_209 - INSTRUMENT
      ?AUTO_208 - SATELLITE
      ?AUTO_207 - DIRECTION
      ?AUTO_210 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_209 ?AUTO_208 ) ( SUPPORTS ?AUTO_209 ?AUTO_206 ) ( not ( = ?AUTO_205 ?AUTO_207 ) ) ( CALIBRATION_TARGET ?AUTO_209 ?AUTO_207 ) ( POINTING ?AUTO_208 ?AUTO_205 ) ( ON_BOARD ?AUTO_210 ?AUTO_208 ) ( POWER_ON ?AUTO_210 ) ( not ( = ?AUTO_209 ?AUTO_210 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_210 ?AUTO_208 )
      ( GET_IMAGE ?AUTO_205 ?AUTO_206 )
      ( GET_IMAGE-VERIFY ?AUTO_205 ?AUTO_206 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_213 - DIRECTION
      ?AUTO_214 - MODE
    )
    :vars
    (
      ?AUTO_217 - INSTRUMENT
      ?AUTO_218 - SATELLITE
      ?AUTO_215 - DIRECTION
      ?AUTO_216 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_217 ?AUTO_218 ) ( SUPPORTS ?AUTO_217 ?AUTO_214 ) ( not ( = ?AUTO_213 ?AUTO_215 ) ) ( CALIBRATION_TARGET ?AUTO_217 ?AUTO_215 ) ( ON_BOARD ?AUTO_216 ?AUTO_218 ) ( POWER_ON ?AUTO_216 ) ( not ( = ?AUTO_217 ?AUTO_216 ) ) ( POINTING ?AUTO_218 ?AUTO_215 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_218 ?AUTO_213 ?AUTO_215 )
      ( GET_IMAGE ?AUTO_213 ?AUTO_214 )
      ( GET_IMAGE-VERIFY ?AUTO_213 ?AUTO_214 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_219 - DIRECTION
      ?AUTO_220 - MODE
    )
    :vars
    (
      ?AUTO_222 - INSTRUMENT
      ?AUTO_224 - SATELLITE
      ?AUTO_223 - DIRECTION
      ?AUTO_221 - INSTRUMENT
      ?AUTO_225 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_222 ?AUTO_224 ) ( SUPPORTS ?AUTO_222 ?AUTO_220 ) ( not ( = ?AUTO_219 ?AUTO_223 ) ) ( CALIBRATION_TARGET ?AUTO_222 ?AUTO_223 ) ( ON_BOARD ?AUTO_221 ?AUTO_224 ) ( POWER_ON ?AUTO_221 ) ( not ( = ?AUTO_222 ?AUTO_221 ) ) ( POINTING ?AUTO_224 ?AUTO_225 ) ( not ( = ?AUTO_223 ?AUTO_225 ) ) ( not ( = ?AUTO_219 ?AUTO_225 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_224 ?AUTO_223 ?AUTO_225 )
      ( GET_IMAGE ?AUTO_219 ?AUTO_220 )
      ( GET_IMAGE-VERIFY ?AUTO_219 ?AUTO_220 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_232 - DIRECTION
      ?AUTO_233 - MODE
    )
    :vars
    (
      ?AUTO_237 - INSTRUMENT
      ?AUTO_236 - SATELLITE
      ?AUTO_235 - DIRECTION
      ?AUTO_238 - INSTRUMENT
      ?AUTO_234 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_237 ?AUTO_236 ) ( SUPPORTS ?AUTO_237 ?AUTO_233 ) ( not ( = ?AUTO_232 ?AUTO_235 ) ) ( CALIBRATION_TARGET ?AUTO_237 ?AUTO_235 ) ( ON_BOARD ?AUTO_238 ?AUTO_236 ) ( not ( = ?AUTO_237 ?AUTO_238 ) ) ( POINTING ?AUTO_236 ?AUTO_234 ) ( not ( = ?AUTO_235 ?AUTO_234 ) ) ( not ( = ?AUTO_232 ?AUTO_234 ) ) ( POWER_AVAIL ?AUTO_236 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_238 ?AUTO_236 )
      ( GET_IMAGE ?AUTO_232 ?AUTO_233 )
      ( GET_IMAGE-VERIFY ?AUTO_232 ?AUTO_233 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_260 - DIRECTION
      ?AUTO_261 - MODE
    )
    :vars
    (
      ?AUTO_264 - INSTRUMENT
      ?AUTO_262 - SATELLITE
      ?AUTO_263 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_264 ?AUTO_262 ) ( SUPPORTS ?AUTO_264 ?AUTO_261 ) ( not ( = ?AUTO_260 ?AUTO_263 ) ) ( CALIBRATION_TARGET ?AUTO_264 ?AUTO_263 ) ( POWER_AVAIL ?AUTO_262 ) ( POINTING ?AUTO_262 ?AUTO_260 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_262 ?AUTO_263 ?AUTO_260 )
      ( GET_IMAGE ?AUTO_260 ?AUTO_261 )
      ( GET_IMAGE-VERIFY ?AUTO_260 ?AUTO_261 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_290 - DIRECTION
      ?AUTO_291 - MODE
    )
    :vars
    (
      ?AUTO_292 - INSTRUMENT
      ?AUTO_293 - SATELLITE
      ?AUTO_294 - DIRECTION
      ?AUTO_295 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_292 ?AUTO_293 ) ( SUPPORTS ?AUTO_292 ?AUTO_291 ) ( not ( = ?AUTO_290 ?AUTO_294 ) ) ( CALIBRATION_TARGET ?AUTO_292 ?AUTO_294 ) ( POWER_AVAIL ?AUTO_293 ) ( POINTING ?AUTO_293 ?AUTO_295 ) ( not ( = ?AUTO_294 ?AUTO_295 ) ) ( not ( = ?AUTO_290 ?AUTO_295 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_293 ?AUTO_294 ?AUTO_295 )
      ( GET_IMAGE ?AUTO_290 ?AUTO_291 )
      ( GET_IMAGE-VERIFY ?AUTO_290 ?AUTO_291 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_318 - DIRECTION
      ?AUTO_319 - MODE
    )
    :vars
    (
      ?AUTO_322 - INSTRUMENT
      ?AUTO_321 - SATELLITE
      ?AUTO_320 - DIRECTION
      ?AUTO_323 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_322 ?AUTO_321 ) ( SUPPORTS ?AUTO_322 ?AUTO_319 ) ( CALIBRATION_TARGET ?AUTO_322 ?AUTO_318 ) ( POINTING ?AUTO_321 ?AUTO_320 ) ( not ( = ?AUTO_318 ?AUTO_320 ) ) ( ON_BOARD ?AUTO_323 ?AUTO_321 ) ( POWER_ON ?AUTO_323 ) ( not ( = ?AUTO_322 ?AUTO_323 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_323 ?AUTO_321 )
      ( GET_IMAGE ?AUTO_318 ?AUTO_319 )
      ( GET_IMAGE-VERIFY ?AUTO_318 ?AUTO_319 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_330 - DIRECTION
      ?AUTO_331 - MODE
    )
    :vars
    (
      ?AUTO_333 - INSTRUMENT
      ?AUTO_335 - SATELLITE
      ?AUTO_332 - DIRECTION
      ?AUTO_334 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_333 ?AUTO_335 ) ( SUPPORTS ?AUTO_333 ?AUTO_331 ) ( CALIBRATION_TARGET ?AUTO_333 ?AUTO_330 ) ( not ( = ?AUTO_330 ?AUTO_332 ) ) ( ON_BOARD ?AUTO_334 ?AUTO_335 ) ( POWER_ON ?AUTO_334 ) ( not ( = ?AUTO_333 ?AUTO_334 ) ) ( POINTING ?AUTO_335 ?AUTO_330 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_335 ?AUTO_332 ?AUTO_330 )
      ( GET_IMAGE ?AUTO_330 ?AUTO_331 )
      ( GET_IMAGE-VERIFY ?AUTO_330 ?AUTO_331 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_342 - DIRECTION
      ?AUTO_343 - MODE
    )
    :vars
    (
      ?AUTO_346 - INSTRUMENT
      ?AUTO_345 - SATELLITE
      ?AUTO_347 - DIRECTION
      ?AUTO_344 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_346 ?AUTO_345 ) ( SUPPORTS ?AUTO_346 ?AUTO_343 ) ( CALIBRATION_TARGET ?AUTO_346 ?AUTO_342 ) ( not ( = ?AUTO_342 ?AUTO_347 ) ) ( ON_BOARD ?AUTO_344 ?AUTO_345 ) ( not ( = ?AUTO_346 ?AUTO_344 ) ) ( POINTING ?AUTO_345 ?AUTO_342 ) ( POWER_AVAIL ?AUTO_345 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_344 ?AUTO_345 )
      ( GET_IMAGE ?AUTO_342 ?AUTO_343 )
      ( GET_IMAGE-VERIFY ?AUTO_342 ?AUTO_343 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_388 - DIRECTION
      ?AUTO_389 - MODE
    )
    :vars
    (
      ?AUTO_391 - INSTRUMENT
      ?AUTO_392 - SATELLITE
      ?AUTO_390 - DIRECTION
      ?AUTO_393 - INSTRUMENT
      ?AUTO_394 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_391 ?AUTO_392 ) ( SUPPORTS ?AUTO_391 ?AUTO_389 ) ( not ( = ?AUTO_388 ?AUTO_390 ) ) ( CALIBRATION_TARGET ?AUTO_391 ?AUTO_390 ) ( ON_BOARD ?AUTO_393 ?AUTO_392 ) ( POWER_ON ?AUTO_393 ) ( not ( = ?AUTO_391 ?AUTO_393 ) ) ( POINTING ?AUTO_392 ?AUTO_394 ) ( not ( = ?AUTO_388 ?AUTO_394 ) ) ( not ( = ?AUTO_390 ?AUTO_394 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_392 ?AUTO_388 ?AUTO_394 )
      ( GET_IMAGE ?AUTO_388 ?AUTO_389 )
      ( GET_IMAGE-VERIFY ?AUTO_388 ?AUTO_389 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_397 - DIRECTION
      ?AUTO_398 - MODE
    )
    :vars
    (
      ?AUTO_403 - INSTRUMENT
      ?AUTO_401 - SATELLITE
      ?AUTO_402 - DIRECTION
      ?AUTO_399 - INSTRUMENT
      ?AUTO_400 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_403 ?AUTO_401 ) ( SUPPORTS ?AUTO_403 ?AUTO_398 ) ( not ( = ?AUTO_397 ?AUTO_402 ) ) ( CALIBRATION_TARGET ?AUTO_403 ?AUTO_402 ) ( ON_BOARD ?AUTO_399 ?AUTO_401 ) ( POWER_ON ?AUTO_399 ) ( not ( = ?AUTO_403 ?AUTO_399 ) ) ( not ( = ?AUTO_397 ?AUTO_400 ) ) ( not ( = ?AUTO_402 ?AUTO_400 ) ) ( POINTING ?AUTO_401 ?AUTO_402 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_401 ?AUTO_400 ?AUTO_402 )
      ( GET_IMAGE ?AUTO_397 ?AUTO_398 )
      ( GET_IMAGE-VERIFY ?AUTO_397 ?AUTO_398 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_436 - DIRECTION
      ?AUTO_437 - MODE
    )
    :vars
    (
      ?AUTO_440 - INSTRUMENT
      ?AUTO_438 - SATELLITE
      ?AUTO_439 - DIRECTION
      ?AUTO_441 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_440 ?AUTO_438 ) ( SUPPORTS ?AUTO_440 ?AUTO_437 ) ( POWER_ON ?AUTO_440 ) ( not ( = ?AUTO_436 ?AUTO_439 ) ) ( CALIBRATION_TARGET ?AUTO_440 ?AUTO_439 ) ( NOT_CALIBRATED ?AUTO_440 ) ( POINTING ?AUTO_438 ?AUTO_441 ) ( not ( = ?AUTO_439 ?AUTO_441 ) ) ( not ( = ?AUTO_436 ?AUTO_441 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_438 ?AUTO_439 ?AUTO_441 )
      ( GET_IMAGE ?AUTO_436 ?AUTO_437 )
      ( GET_IMAGE-VERIFY ?AUTO_436 ?AUTO_437 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_442 - DIRECTION
      ?AUTO_443 - MODE
    )
    :vars
    (
      ?AUTO_446 - INSTRUMENT
      ?AUTO_444 - SATELLITE
      ?AUTO_445 - DIRECTION
      ?AUTO_447 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_446 ?AUTO_444 ) ( SUPPORTS ?AUTO_446 ?AUTO_443 ) ( not ( = ?AUTO_442 ?AUTO_445 ) ) ( CALIBRATION_TARGET ?AUTO_446 ?AUTO_445 ) ( POINTING ?AUTO_444 ?AUTO_447 ) ( not ( = ?AUTO_445 ?AUTO_447 ) ) ( not ( = ?AUTO_442 ?AUTO_447 ) ) ( POWER_AVAIL ?AUTO_444 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_446 ?AUTO_444 )
      ( GET_IMAGE ?AUTO_442 ?AUTO_443 )
      ( GET_IMAGE-VERIFY ?AUTO_442 ?AUTO_443 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_448 - DIRECTION
      ?AUTO_449 - MODE
    )
    :vars
    (
      ?AUTO_452 - INSTRUMENT
      ?AUTO_450 - SATELLITE
      ?AUTO_451 - DIRECTION
      ?AUTO_453 - DIRECTION
      ?AUTO_454 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_452 ?AUTO_450 ) ( SUPPORTS ?AUTO_452 ?AUTO_449 ) ( not ( = ?AUTO_448 ?AUTO_451 ) ) ( CALIBRATION_TARGET ?AUTO_452 ?AUTO_451 ) ( POINTING ?AUTO_450 ?AUTO_453 ) ( not ( = ?AUTO_451 ?AUTO_453 ) ) ( not ( = ?AUTO_448 ?AUTO_453 ) ) ( ON_BOARD ?AUTO_454 ?AUTO_450 ) ( POWER_ON ?AUTO_454 ) ( not ( = ?AUTO_452 ?AUTO_454 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_454 ?AUTO_450 )
      ( GET_IMAGE ?AUTO_448 ?AUTO_449 )
      ( GET_IMAGE-VERIFY ?AUTO_448 ?AUTO_449 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_465 - DIRECTION
      ?AUTO_466 - MODE
    )
    :vars
    (
      ?AUTO_467 - INSTRUMENT
      ?AUTO_468 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_467 ?AUTO_468 ) ( SUPPORTS ?AUTO_467 ?AUTO_466 ) ( POINTING ?AUTO_468 ?AUTO_465 ) ( CALIBRATION_TARGET ?AUTO_467 ?AUTO_465 ) ( POWER_AVAIL ?AUTO_468 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_467 ?AUTO_468 )
      ( GET_IMAGE ?AUTO_465 ?AUTO_466 )
      ( GET_IMAGE-VERIFY ?AUTO_465 ?AUTO_466 ) )
  )

)

