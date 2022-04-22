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
      ?AUTO_17 - DIRECTION
      ?AUTO_18 - MODE
    )
    :vars
    (
      ?AUTO_20 - INSTRUMENT
      ?AUTO_23 - SATELLITE
      ?AUTO_19 - SATELLITE
      ?AUTO_24 - DIRECTION
      ?AUTO_26 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_20 ?AUTO_23 ) ( SUPPORTS ?AUTO_20 ?AUTO_18 ) ( POINTING ?AUTO_23 ?AUTO_17 ) ( ON_BOARD ?AUTO_20 ?AUTO_19 ) ( CALIBRATION_TARGET ?AUTO_20 ?AUTO_24 ) ( POINTING ?AUTO_19 ?AUTO_24 ) ( ON_BOARD ?AUTO_20 ?AUTO_26 ) ( POWER_AVAIL ?AUTO_26 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_20 ?AUTO_26 )
      ( GET_IMAGE ?AUTO_17 ?AUTO_18 )
      ( GET_IMAGE-VERIFY ?AUTO_17 ?AUTO_18 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_34 - DIRECTION
      ?AUTO_28 - MODE
    )
    :vars
    (
      ?AUTO_32 - INSTRUMENT
      ?AUTO_30 - SATELLITE
      ?AUTO_35 - SATELLITE
      ?AUTO_36 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_32 ?AUTO_30 ) ( SUPPORTS ?AUTO_32 ?AUTO_28 ) ( CALIBRATION_TARGET ?AUTO_32 ?AUTO_34 ) ( ON_BOARD ?AUTO_32 ?AUTO_35 ) ( POWER_AVAIL ?AUTO_35 ) ( POINTING ?AUTO_30 ?AUTO_36 ) ( not ( = ?AUTO_34 ?AUTO_36 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_30 ?AUTO_34 ?AUTO_36 )
      ( GET_IMAGE ?AUTO_34 ?AUTO_28 )
      ( GET_IMAGE-VERIFY ?AUTO_34 ?AUTO_28 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_47 - DIRECTION
      ?AUTO_48 - MODE
    )
    :vars
    (
      ?AUTO_51 - INSTRUMENT
      ?AUTO_52 - SATELLITE
      ?AUTO_53 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_51 ) ( ON_BOARD ?AUTO_51 ?AUTO_52 ) ( SUPPORTS ?AUTO_51 ?AUTO_48 ) ( POWER_ON ?AUTO_51 ) ( POINTING ?AUTO_52 ?AUTO_53 ) ( not ( = ?AUTO_47 ?AUTO_53 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_52 ?AUTO_47 ?AUTO_53 )
      ( GET_IMAGE ?AUTO_47 ?AUTO_48 )
      ( GET_IMAGE-VERIFY ?AUTO_47 ?AUTO_48 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_56 - DIRECTION
      ?AUTO_57 - MODE
    )
    :vars
    (
      ?AUTO_62 - INSTRUMENT
      ?AUTO_60 - SATELLITE
      ?AUTO_59 - DIRECTION
      ?AUTO_64 - SATELLITE
      ?AUTO_65 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_62 ?AUTO_60 ) ( SUPPORTS ?AUTO_62 ?AUTO_57 ) ( POWER_ON ?AUTO_62 ) ( POINTING ?AUTO_60 ?AUTO_59 ) ( not ( = ?AUTO_56 ?AUTO_59 ) ) ( ON_BOARD ?AUTO_62 ?AUTO_64 ) ( CALIBRATION_TARGET ?AUTO_62 ?AUTO_65 ) ( POINTING ?AUTO_64 ?AUTO_65 ) ( NOT_CALIBRATED ?AUTO_62 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_64 ?AUTO_62 ?AUTO_65 )
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
      ?AUTO_70 - INSTRUMENT
      ?AUTO_72 - SATELLITE
      ?AUTO_69 - DIRECTION
      ?AUTO_74 - SATELLITE
      ?AUTO_73 - DIRECTION
      ?AUTO_76 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_70 ?AUTO_72 ) ( SUPPORTS ?AUTO_70 ?AUTO_67 ) ( POINTING ?AUTO_72 ?AUTO_69 ) ( not ( = ?AUTO_66 ?AUTO_69 ) ) ( ON_BOARD ?AUTO_70 ?AUTO_74 ) ( CALIBRATION_TARGET ?AUTO_70 ?AUTO_73 ) ( POINTING ?AUTO_74 ?AUTO_73 ) ( ON_BOARD ?AUTO_70 ?AUTO_76 ) ( POWER_AVAIL ?AUTO_76 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_70 ?AUTO_76 )
      ( GET_IMAGE ?AUTO_66 ?AUTO_67 )
      ( GET_IMAGE-VERIFY ?AUTO_66 ?AUTO_67 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_105 - DIRECTION
      ?AUTO_104 - MODE
    )
    :vars
    (
      ?AUTO_110 - INSTRUMENT
      ?AUTO_111 - SATELLITE
      ?AUTO_112 - DIRECTION
      ?AUTO_113 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_110 ?AUTO_111 ) ( SUPPORTS ?AUTO_110 ?AUTO_104 ) ( POWER_ON ?AUTO_110 ) ( not ( = ?AUTO_105 ?AUTO_112 ) ) ( CALIBRATION_TARGET ?AUTO_110 ?AUTO_112 ) ( NOT_CALIBRATED ?AUTO_110 ) ( POINTING ?AUTO_111 ?AUTO_113 ) ( not ( = ?AUTO_112 ?AUTO_113 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_111 ?AUTO_112 ?AUTO_113 )
      ( GET_IMAGE ?AUTO_105 ?AUTO_104 )
      ( GET_IMAGE-VERIFY ?AUTO_105 ?AUTO_104 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_117 - DIRECTION
      ?AUTO_116 - MODE
    )
    :vars
    (
      ?AUTO_122 - INSTRUMENT
      ?AUTO_118 - SATELLITE
      ?AUTO_120 - DIRECTION
      ?AUTO_121 - DIRECTION
      ?AUTO_125 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_122 ?AUTO_118 ) ( SUPPORTS ?AUTO_122 ?AUTO_116 ) ( not ( = ?AUTO_117 ?AUTO_120 ) ) ( CALIBRATION_TARGET ?AUTO_122 ?AUTO_120 ) ( POINTING ?AUTO_118 ?AUTO_121 ) ( not ( = ?AUTO_120 ?AUTO_121 ) ) ( ON_BOARD ?AUTO_122 ?AUTO_125 ) ( POWER_AVAIL ?AUTO_125 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_122 ?AUTO_125 )
      ( GET_IMAGE ?AUTO_117 ?AUTO_116 )
      ( GET_IMAGE-VERIFY ?AUTO_117 ?AUTO_116 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_180 - DIRECTION
      ?AUTO_181 - MODE
    )
    :vars
    (
      ?AUTO_187 - INSTRUMENT
      ?AUTO_186 - SATELLITE
      ?AUTO_185 - SATELLITE
      ?AUTO_182 - DIRECTION
      ?AUTO_188 - SATELLITE
      ?AUTO_189 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_187 ?AUTO_186 ) ( SUPPORTS ?AUTO_187 ?AUTO_181 ) ( POINTING ?AUTO_186 ?AUTO_180 ) ( ON_BOARD ?AUTO_187 ?AUTO_185 ) ( CALIBRATION_TARGET ?AUTO_187 ?AUTO_182 ) ( POINTING ?AUTO_185 ?AUTO_182 ) ( ON_BOARD ?AUTO_187 ?AUTO_188 ) ( ON_BOARD ?AUTO_189 ?AUTO_188 ) ( POWER_ON ?AUTO_189 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_189 ?AUTO_188 )
      ( GET_IMAGE ?AUTO_180 ?AUTO_181 )
      ( GET_IMAGE-VERIFY ?AUTO_180 ?AUTO_181 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_269 - DIRECTION
      ?AUTO_270 - MODE
    )
    :vars
    (
      ?AUTO_277 - INSTRUMENT
      ?AUTO_273 - SATELLITE
      ?AUTO_274 - DIRECTION
      ?AUTO_278 - SATELLITE
      ?AUTO_279 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_277 ?AUTO_273 ) ( SUPPORTS ?AUTO_277 ?AUTO_270 ) ( not ( = ?AUTO_269 ?AUTO_274 ) ) ( CALIBRATION_TARGET ?AUTO_277 ?AUTO_274 ) ( ON_BOARD ?AUTO_277 ?AUTO_278 ) ( POWER_AVAIL ?AUTO_278 ) ( POINTING ?AUTO_273 ?AUTO_279 ) ( not ( = ?AUTO_274 ?AUTO_279 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_273 ?AUTO_274 ?AUTO_279 )
      ( GET_IMAGE ?AUTO_269 ?AUTO_270 )
      ( GET_IMAGE-VERIFY ?AUTO_269 ?AUTO_270 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_301 - DIRECTION
      ?AUTO_300 - MODE
    )
    :vars
    (
      ?AUTO_304 - INSTRUMENT
      ?AUTO_306 - SATELLITE
      ?AUTO_307 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_304 ?AUTO_306 ) ( SUPPORTS ?AUTO_304 ?AUTO_300 ) ( POWER_ON ?AUTO_304 ) ( CALIBRATION_TARGET ?AUTO_304 ?AUTO_301 ) ( NOT_CALIBRATED ?AUTO_304 ) ( POINTING ?AUTO_306 ?AUTO_307 ) ( not ( = ?AUTO_301 ?AUTO_307 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_306 ?AUTO_301 ?AUTO_307 )
      ( GET_IMAGE ?AUTO_301 ?AUTO_300 )
      ( GET_IMAGE-VERIFY ?AUTO_301 ?AUTO_300 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_310 - DIRECTION
      ?AUTO_311 - MODE
    )
    :vars
    (
      ?AUTO_313 - INSTRUMENT
      ?AUTO_316 - SATELLITE
      ?AUTO_315 - DIRECTION
      ?AUTO_318 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_313 ?AUTO_316 ) ( SUPPORTS ?AUTO_313 ?AUTO_311 ) ( CALIBRATION_TARGET ?AUTO_313 ?AUTO_310 ) ( POINTING ?AUTO_316 ?AUTO_315 ) ( not ( = ?AUTO_310 ?AUTO_315 ) ) ( ON_BOARD ?AUTO_313 ?AUTO_318 ) ( POWER_AVAIL ?AUTO_318 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_313 ?AUTO_318 )
      ( GET_IMAGE ?AUTO_310 ?AUTO_311 )
      ( GET_IMAGE-VERIFY ?AUTO_310 ?AUTO_311 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_321 - DIRECTION
      ?AUTO_322 - MODE
    )
    :vars
    (
      ?AUTO_326 - INSTRUMENT
      ?AUTO_327 - SATELLITE
      ?AUTO_325 - DIRECTION
      ?AUTO_323 - SATELLITE
      ?AUTO_329 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_326 ?AUTO_327 ) ( SUPPORTS ?AUTO_326 ?AUTO_322 ) ( CALIBRATION_TARGET ?AUTO_326 ?AUTO_321 ) ( POINTING ?AUTO_327 ?AUTO_325 ) ( not ( = ?AUTO_321 ?AUTO_325 ) ) ( ON_BOARD ?AUTO_326 ?AUTO_323 ) ( ON_BOARD ?AUTO_329 ?AUTO_323 ) ( POWER_ON ?AUTO_329 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_329 ?AUTO_323 )
      ( GET_IMAGE ?AUTO_321 ?AUTO_322 )
      ( GET_IMAGE-VERIFY ?AUTO_321 ?AUTO_322 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_396 - DIRECTION
      ?AUTO_397 - MODE
    )
    :vars
    (
      ?AUTO_402 - INSTRUMENT
      ?AUTO_404 - SATELLITE
      ?AUTO_400 - DIRECTION
      ?AUTO_399 - DIRECTION
      ?AUTO_401 - SATELLITE
      ?AUTO_405 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_402 ?AUTO_404 ) ( SUPPORTS ?AUTO_402 ?AUTO_397 ) ( not ( = ?AUTO_396 ?AUTO_400 ) ) ( CALIBRATION_TARGET ?AUTO_402 ?AUTO_400 ) ( POINTING ?AUTO_404 ?AUTO_399 ) ( not ( = ?AUTO_400 ?AUTO_399 ) ) ( ON_BOARD ?AUTO_402 ?AUTO_401 ) ( ON_BOARD ?AUTO_405 ?AUTO_401 ) ( POWER_ON ?AUTO_405 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_405 ?AUTO_401 )
      ( GET_IMAGE ?AUTO_396 ?AUTO_397 )
      ( GET_IMAGE-VERIFY ?AUTO_396 ?AUTO_397 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_471 - DIRECTION
      ?AUTO_472 - MODE
    )
    :vars
    (
      ?AUTO_474 - INSTRUMENT
      ?AUTO_475 - SATELLITE
      ?AUTO_476 - DIRECTION
      ?AUTO_479 - SATELLITE
      ?AUTO_478 - DIRECTION
      ?AUTO_480 - SATELLITE
      ?AUTO_481 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_474 ?AUTO_475 ) ( SUPPORTS ?AUTO_474 ?AUTO_472 ) ( POINTING ?AUTO_475 ?AUTO_476 ) ( not ( = ?AUTO_471 ?AUTO_476 ) ) ( ON_BOARD ?AUTO_474 ?AUTO_479 ) ( CALIBRATION_TARGET ?AUTO_474 ?AUTO_478 ) ( POINTING ?AUTO_479 ?AUTO_478 ) ( ON_BOARD ?AUTO_474 ?AUTO_480 ) ( ON_BOARD ?AUTO_481 ?AUTO_480 ) ( POWER_ON ?AUTO_481 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_481 ?AUTO_480 )
      ( GET_IMAGE ?AUTO_471 ?AUTO_472 )
      ( GET_IMAGE-VERIFY ?AUTO_471 ?AUTO_472 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_575 - DIRECTION
      ?AUTO_576 - MODE
    )
    :vars
    (
      ?AUTO_580 - INSTRUMENT
      ?AUTO_581 - SATELLITE
      ?AUTO_577 - DIRECTION
      ?AUTO_578 - SATELLITE
      ?AUTO_582 - INSTRUMENT
      ?AUTO_584 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_580 ?AUTO_581 ) ( SUPPORTS ?AUTO_580 ?AUTO_576 ) ( CALIBRATION_TARGET ?AUTO_580 ?AUTO_575 ) ( not ( = ?AUTO_575 ?AUTO_577 ) ) ( ON_BOARD ?AUTO_580 ?AUTO_578 ) ( ON_BOARD ?AUTO_582 ?AUTO_578 ) ( POWER_ON ?AUTO_582 ) ( POINTING ?AUTO_581 ?AUTO_584 ) ( not ( = ?AUTO_577 ?AUTO_584 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_581 ?AUTO_577 ?AUTO_584 )
      ( GET_IMAGE ?AUTO_575 ?AUTO_576 )
      ( GET_IMAGE-VERIFY ?AUTO_575 ?AUTO_576 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_589 - DIRECTION
      ?AUTO_590 - MODE
    )
    :vars
    (
      ?AUTO_594 - INSTRUMENT
      ?AUTO_593 - SATELLITE
      ?AUTO_591 - DIRECTION
      ?AUTO_596 - SATELLITE
      ?AUTO_595 - INSTRUMENT
      ?AUTO_597 - DIRECTION
      ?AUTO_600 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_594 ?AUTO_593 ) ( SUPPORTS ?AUTO_594 ?AUTO_590 ) ( CALIBRATION_TARGET ?AUTO_594 ?AUTO_589 ) ( not ( = ?AUTO_589 ?AUTO_591 ) ) ( ON_BOARD ?AUTO_594 ?AUTO_596 ) ( ON_BOARD ?AUTO_595 ?AUTO_596 ) ( POINTING ?AUTO_593 ?AUTO_597 ) ( not ( = ?AUTO_591 ?AUTO_597 ) ) ( ON_BOARD ?AUTO_595 ?AUTO_600 ) ( POWER_AVAIL ?AUTO_600 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_595 ?AUTO_600 )
      ( GET_IMAGE ?AUTO_589 ?AUTO_590 )
      ( GET_IMAGE-VERIFY ?AUTO_589 ?AUTO_590 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_677 - DIRECTION
      ?AUTO_678 - MODE
    )
    :vars
    (
      ?AUTO_682 - INSTRUMENT
      ?AUTO_684 - SATELLITE
      ?AUTO_686 - DIRECTION
      ?AUTO_680 - DIRECTION
      ?AUTO_685 - SATELLITE
      ?AUTO_679 - INSTRUMENT
      ?AUTO_687 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_682 ?AUTO_684 ) ( SUPPORTS ?AUTO_682 ?AUTO_678 ) ( not ( = ?AUTO_677 ?AUTO_686 ) ) ( CALIBRATION_TARGET ?AUTO_682 ?AUTO_686 ) ( not ( = ?AUTO_686 ?AUTO_680 ) ) ( ON_BOARD ?AUTO_682 ?AUTO_685 ) ( ON_BOARD ?AUTO_679 ?AUTO_685 ) ( POWER_ON ?AUTO_679 ) ( POINTING ?AUTO_684 ?AUTO_687 ) ( not ( = ?AUTO_680 ?AUTO_687 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_684 ?AUTO_680 ?AUTO_687 )
      ( GET_IMAGE ?AUTO_677 ?AUTO_678 )
      ( GET_IMAGE-VERIFY ?AUTO_677 ?AUTO_678 ) )
  )

)

