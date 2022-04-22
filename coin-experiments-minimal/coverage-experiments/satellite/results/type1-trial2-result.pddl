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
      ?AUTO_14 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_12 ) ( ON_BOARD ?AUTO_12 ?AUTO_13 ) ( SUPPORTS ?AUTO_12 ?AUTO_9 ) ( POWER_ON ?AUTO_12 ) ( POINTING ?AUTO_13 ?AUTO_14 ) ( not ( = ?AUTO_8 ?AUTO_14 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_13 ?AUTO_8 ?AUTO_14 )
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
      ?AUTO_21 - INSTRUMENT
      ?AUTO_23 - SATELLITE
      ?AUTO_22 - DIRECTION
      ?AUTO_25 - SATELLITE
      ?AUTO_26 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_21 ?AUTO_23 ) ( SUPPORTS ?AUTO_21 ?AUTO_18 ) ( POWER_ON ?AUTO_21 ) ( POINTING ?AUTO_23 ?AUTO_22 ) ( not ( = ?AUTO_17 ?AUTO_22 ) ) ( ON_BOARD ?AUTO_21 ?AUTO_25 ) ( CALIBRATION_TARGET ?AUTO_21 ?AUTO_26 ) ( POINTING ?AUTO_25 ?AUTO_26 ) ( NOT_CALIBRATED ?AUTO_21 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_25 ?AUTO_21 ?AUTO_26 )
      ( GET_IMAGE ?AUTO_17 ?AUTO_18 )
      ( GET_IMAGE-VERIFY ?AUTO_17 ?AUTO_18 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_27 - DIRECTION
      ?AUTO_28 - MODE
    )
    :vars
    (
      ?AUTO_34 - INSTRUMENT
      ?AUTO_30 - SATELLITE
      ?AUTO_35 - DIRECTION
      ?AUTO_31 - SATELLITE
      ?AUTO_32 - DIRECTION
      ?AUTO_37 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_34 ?AUTO_30 ) ( SUPPORTS ?AUTO_34 ?AUTO_28 ) ( POINTING ?AUTO_30 ?AUTO_35 ) ( not ( = ?AUTO_27 ?AUTO_35 ) ) ( ON_BOARD ?AUTO_34 ?AUTO_31 ) ( CALIBRATION_TARGET ?AUTO_34 ?AUTO_32 ) ( POINTING ?AUTO_31 ?AUTO_32 ) ( ON_BOARD ?AUTO_34 ?AUTO_37 ) ( POWER_AVAIL ?AUTO_37 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_34 ?AUTO_37 )
      ( GET_IMAGE ?AUTO_27 ?AUTO_28 )
      ( GET_IMAGE-VERIFY ?AUTO_27 ?AUTO_28 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_46 - DIRECTION
      ?AUTO_47 - MODE
    )
    :vars
    (
      ?AUTO_48 - INSTRUMENT
      ?AUTO_51 - SATELLITE
      ?AUTO_53 - SATELLITE
      ?AUTO_54 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_48 ?AUTO_51 ) ( SUPPORTS ?AUTO_48 ?AUTO_47 ) ( POWER_ON ?AUTO_48 ) ( POINTING ?AUTO_51 ?AUTO_46 ) ( ON_BOARD ?AUTO_48 ?AUTO_53 ) ( CALIBRATION_TARGET ?AUTO_48 ?AUTO_54 ) ( POINTING ?AUTO_53 ?AUTO_54 ) ( NOT_CALIBRATED ?AUTO_48 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_53 ?AUTO_48 ?AUTO_54 )
      ( GET_IMAGE ?AUTO_46 ?AUTO_47 )
      ( GET_IMAGE-VERIFY ?AUTO_46 ?AUTO_47 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_55 - DIRECTION
      ?AUTO_56 - MODE
    )
    :vars
    (
      ?AUTO_62 - INSTRUMENT
      ?AUTO_59 - SATELLITE
      ?AUTO_60 - SATELLITE
      ?AUTO_61 - DIRECTION
      ?AUTO_64 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_62 ?AUTO_59 ) ( SUPPORTS ?AUTO_62 ?AUTO_56 ) ( POINTING ?AUTO_59 ?AUTO_55 ) ( ON_BOARD ?AUTO_62 ?AUTO_60 ) ( CALIBRATION_TARGET ?AUTO_62 ?AUTO_61 ) ( POINTING ?AUTO_60 ?AUTO_61 ) ( ON_BOARD ?AUTO_62 ?AUTO_64 ) ( POWER_AVAIL ?AUTO_64 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_62 ?AUTO_64 )
      ( GET_IMAGE ?AUTO_55 ?AUTO_56 )
      ( GET_IMAGE-VERIFY ?AUTO_55 ?AUTO_56 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_121 - DIRECTION
      ?AUTO_122 - MODE
    )
    :vars
    (
      ?AUTO_124 - INSTRUMENT
      ?AUTO_123 - SATELLITE
      ?AUTO_129 - SATELLITE
      ?AUTO_128 - DIRECTION
      ?AUTO_127 - SATELLITE
      ?AUTO_130 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_124 ?AUTO_123 ) ( SUPPORTS ?AUTO_124 ?AUTO_122 ) ( POINTING ?AUTO_123 ?AUTO_121 ) ( ON_BOARD ?AUTO_124 ?AUTO_129 ) ( CALIBRATION_TARGET ?AUTO_124 ?AUTO_128 ) ( POINTING ?AUTO_129 ?AUTO_128 ) ( ON_BOARD ?AUTO_124 ?AUTO_127 ) ( ON_BOARD ?AUTO_130 ?AUTO_127 ) ( POWER_ON ?AUTO_130 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_130 ?AUTO_127 )
      ( GET_IMAGE ?AUTO_121 ?AUTO_122 )
      ( GET_IMAGE-VERIFY ?AUTO_121 ?AUTO_122 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_182 - DIRECTION
      ?AUTO_183 - MODE
    )
    :vars
    (
      ?AUTO_186 - INSTRUMENT
      ?AUTO_190 - SATELLITE
      ?AUTO_188 - DIRECTION
      ?AUTO_187 - SATELLITE
      ?AUTO_189 - DIRECTION
      ?AUTO_191 - SATELLITE
      ?AUTO_192 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_186 ?AUTO_190 ) ( SUPPORTS ?AUTO_186 ?AUTO_183 ) ( POINTING ?AUTO_190 ?AUTO_188 ) ( not ( = ?AUTO_182 ?AUTO_188 ) ) ( ON_BOARD ?AUTO_186 ?AUTO_187 ) ( CALIBRATION_TARGET ?AUTO_186 ?AUTO_189 ) ( POINTING ?AUTO_187 ?AUTO_189 ) ( ON_BOARD ?AUTO_186 ?AUTO_191 ) ( ON_BOARD ?AUTO_192 ?AUTO_191 ) ( POWER_ON ?AUTO_192 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_192 ?AUTO_191 )
      ( GET_IMAGE ?AUTO_182 ?AUTO_183 )
      ( GET_IMAGE-VERIFY ?AUTO_182 ?AUTO_183 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_225 - DIRECTION
      ?AUTO_222 - MODE
    )
    :vars
    (
      ?AUTO_227 - INSTRUMENT
      ?AUTO_228 - SATELLITE
      ?AUTO_229 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_227 ?AUTO_228 ) ( SUPPORTS ?AUTO_227 ?AUTO_222 ) ( POWER_ON ?AUTO_227 ) ( CALIBRATION_TARGET ?AUTO_227 ?AUTO_225 ) ( NOT_CALIBRATED ?AUTO_227 ) ( POINTING ?AUTO_228 ?AUTO_229 ) ( not ( = ?AUTO_225 ?AUTO_229 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_228 ?AUTO_225 ?AUTO_229 )
      ( GET_IMAGE ?AUTO_225 ?AUTO_222 )
      ( GET_IMAGE-VERIFY ?AUTO_225 ?AUTO_222 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_283 - DIRECTION
      ?AUTO_284 - MODE
    )
    :vars
    (
      ?AUTO_289 - INSTRUMENT
      ?AUTO_290 - SATELLITE
      ?AUTO_291 - DIRECTION
      ?AUTO_292 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_289 ?AUTO_290 ) ( SUPPORTS ?AUTO_289 ?AUTO_284 ) ( POWER_ON ?AUTO_289 ) ( not ( = ?AUTO_283 ?AUTO_291 ) ) ( CALIBRATION_TARGET ?AUTO_289 ?AUTO_291 ) ( NOT_CALIBRATED ?AUTO_289 ) ( POINTING ?AUTO_290 ?AUTO_292 ) ( not ( = ?AUTO_291 ?AUTO_292 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_290 ?AUTO_291 ?AUTO_292 )
      ( GET_IMAGE ?AUTO_283 ?AUTO_284 )
      ( GET_IMAGE-VERIFY ?AUTO_283 ?AUTO_284 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_331 - DIRECTION
      ?AUTO_332 - MODE
    )
    :vars
    (
      ?AUTO_340 - INSTRUMENT
      ?AUTO_335 - SATELLITE
      ?AUTO_333 - DIRECTION
      ?AUTO_339 - SATELLITE
      ?AUTO_341 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_340 ?AUTO_335 ) ( SUPPORTS ?AUTO_340 ?AUTO_332 ) ( not ( = ?AUTO_331 ?AUTO_333 ) ) ( CALIBRATION_TARGET ?AUTO_340 ?AUTO_333 ) ( ON_BOARD ?AUTO_340 ?AUTO_339 ) ( POWER_AVAIL ?AUTO_339 ) ( POINTING ?AUTO_335 ?AUTO_341 ) ( not ( = ?AUTO_333 ?AUTO_341 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_335 ?AUTO_333 ?AUTO_341 )
      ( GET_IMAGE ?AUTO_331 ?AUTO_332 )
      ( GET_IMAGE-VERIFY ?AUTO_331 ?AUTO_332 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_486 - DIRECTION
      ?AUTO_487 - MODE
    )
    :vars
    (
      ?AUTO_492 - INSTRUMENT
      ?AUTO_491 - SATELLITE
      ?AUTO_489 - DIRECTION
      ?AUTO_494 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_492 ?AUTO_491 ) ( SUPPORTS ?AUTO_492 ?AUTO_487 ) ( CALIBRATION_TARGET ?AUTO_492 ?AUTO_486 ) ( POINTING ?AUTO_491 ?AUTO_489 ) ( not ( = ?AUTO_486 ?AUTO_489 ) ) ( ON_BOARD ?AUTO_492 ?AUTO_494 ) ( POWER_AVAIL ?AUTO_494 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_492 ?AUTO_494 )
      ( GET_IMAGE ?AUTO_486 ?AUTO_487 )
      ( GET_IMAGE-VERIFY ?AUTO_486 ?AUTO_487 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_495 - DIRECTION
      ?AUTO_496 - MODE
    )
    :vars
    (
      ?AUTO_501 - INSTRUMENT
      ?AUTO_498 - SATELLITE
      ?AUTO_499 - DIRECTION
      ?AUTO_497 - SATELLITE
      ?AUTO_503 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_501 ?AUTO_498 ) ( SUPPORTS ?AUTO_501 ?AUTO_496 ) ( CALIBRATION_TARGET ?AUTO_501 ?AUTO_495 ) ( POINTING ?AUTO_498 ?AUTO_499 ) ( not ( = ?AUTO_495 ?AUTO_499 ) ) ( ON_BOARD ?AUTO_501 ?AUTO_497 ) ( ON_BOARD ?AUTO_503 ?AUTO_497 ) ( POWER_ON ?AUTO_503 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_503 ?AUTO_497 )
      ( GET_IMAGE ?AUTO_495 ?AUTO_496 )
      ( GET_IMAGE-VERIFY ?AUTO_495 ?AUTO_496 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_511 - DIRECTION
      ?AUTO_512 - MODE
    )
    :vars
    (
      ?AUTO_518 - INSTRUMENT
      ?AUTO_514 - SATELLITE
      ?AUTO_516 - DIRECTION
      ?AUTO_513 - SATELLITE
      ?AUTO_515 - INSTRUMENT
      ?AUTO_520 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_518 ?AUTO_514 ) ( SUPPORTS ?AUTO_518 ?AUTO_512 ) ( CALIBRATION_TARGET ?AUTO_518 ?AUTO_511 ) ( not ( = ?AUTO_511 ?AUTO_516 ) ) ( ON_BOARD ?AUTO_518 ?AUTO_513 ) ( ON_BOARD ?AUTO_515 ?AUTO_513 ) ( POWER_ON ?AUTO_515 ) ( POINTING ?AUTO_514 ?AUTO_520 ) ( not ( = ?AUTO_516 ?AUTO_520 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_514 ?AUTO_516 ?AUTO_520 )
      ( GET_IMAGE ?AUTO_511 ?AUTO_512 )
      ( GET_IMAGE-VERIFY ?AUTO_511 ?AUTO_512 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_525 - DIRECTION
      ?AUTO_526 - MODE
    )
    :vars
    (
      ?AUTO_532 - INSTRUMENT
      ?AUTO_533 - SATELLITE
      ?AUTO_531 - DIRECTION
      ?AUTO_528 - SATELLITE
      ?AUTO_530 - INSTRUMENT
      ?AUTO_534 - DIRECTION
      ?AUTO_536 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_532 ?AUTO_533 ) ( SUPPORTS ?AUTO_532 ?AUTO_526 ) ( CALIBRATION_TARGET ?AUTO_532 ?AUTO_525 ) ( not ( = ?AUTO_525 ?AUTO_531 ) ) ( ON_BOARD ?AUTO_532 ?AUTO_528 ) ( ON_BOARD ?AUTO_530 ?AUTO_528 ) ( POINTING ?AUTO_533 ?AUTO_534 ) ( not ( = ?AUTO_531 ?AUTO_534 ) ) ( ON_BOARD ?AUTO_530 ?AUTO_536 ) ( POWER_AVAIL ?AUTO_536 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_530 ?AUTO_536 )
      ( GET_IMAGE ?AUTO_525 ?AUTO_526 )
      ( GET_IMAGE-VERIFY ?AUTO_525 ?AUTO_526 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_586 - DIRECTION
      ?AUTO_587 - MODE
    )
    :vars
    (
      ?AUTO_591 - INSTRUMENT
      ?AUTO_592 - SATELLITE
      ?AUTO_593 - DIRECTION
      ?AUTO_588 - DIRECTION
      ?AUTO_595 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_591 ?AUTO_592 ) ( SUPPORTS ?AUTO_591 ?AUTO_587 ) ( not ( = ?AUTO_586 ?AUTO_593 ) ) ( CALIBRATION_TARGET ?AUTO_591 ?AUTO_593 ) ( POINTING ?AUTO_592 ?AUTO_588 ) ( not ( = ?AUTO_593 ?AUTO_588 ) ) ( ON_BOARD ?AUTO_591 ?AUTO_595 ) ( POWER_AVAIL ?AUTO_595 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_591 ?AUTO_595 )
      ( GET_IMAGE ?AUTO_586 ?AUTO_587 )
      ( GET_IMAGE-VERIFY ?AUTO_586 ?AUTO_587 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_596 - DIRECTION
      ?AUTO_597 - MODE
    )
    :vars
    (
      ?AUTO_603 - INSTRUMENT
      ?AUTO_598 - SATELLITE
      ?AUTO_600 - DIRECTION
      ?AUTO_599 - DIRECTION
      ?AUTO_604 - SATELLITE
      ?AUTO_605 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_603 ?AUTO_598 ) ( SUPPORTS ?AUTO_603 ?AUTO_597 ) ( not ( = ?AUTO_596 ?AUTO_600 ) ) ( CALIBRATION_TARGET ?AUTO_603 ?AUTO_600 ) ( POINTING ?AUTO_598 ?AUTO_599 ) ( not ( = ?AUTO_600 ?AUTO_599 ) ) ( ON_BOARD ?AUTO_603 ?AUTO_604 ) ( ON_BOARD ?AUTO_605 ?AUTO_604 ) ( POWER_ON ?AUTO_605 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_605 ?AUTO_604 )
      ( GET_IMAGE ?AUTO_596 ?AUTO_597 )
      ( GET_IMAGE-VERIFY ?AUTO_596 ?AUTO_597 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_613 - DIRECTION
      ?AUTO_614 - MODE
    )
    :vars
    (
      ?AUTO_619 - INSTRUMENT
      ?AUTO_616 - SATELLITE
      ?AUTO_620 - DIRECTION
      ?AUTO_622 - DIRECTION
      ?AUTO_617 - SATELLITE
      ?AUTO_615 - INSTRUMENT
      ?AUTO_623 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_619 ?AUTO_616 ) ( SUPPORTS ?AUTO_619 ?AUTO_614 ) ( not ( = ?AUTO_613 ?AUTO_620 ) ) ( CALIBRATION_TARGET ?AUTO_619 ?AUTO_620 ) ( not ( = ?AUTO_620 ?AUTO_622 ) ) ( ON_BOARD ?AUTO_619 ?AUTO_617 ) ( ON_BOARD ?AUTO_615 ?AUTO_617 ) ( POWER_ON ?AUTO_615 ) ( POINTING ?AUTO_616 ?AUTO_623 ) ( not ( = ?AUTO_622 ?AUTO_623 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_616 ?AUTO_622 ?AUTO_623 )
      ( GET_IMAGE ?AUTO_613 ?AUTO_614 )
      ( GET_IMAGE-VERIFY ?AUTO_613 ?AUTO_614 ) )
  )

)

