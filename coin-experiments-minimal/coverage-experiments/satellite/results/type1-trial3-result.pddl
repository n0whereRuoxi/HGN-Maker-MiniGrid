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
      ?AUTO_9 - DIRECTION
      ?AUTO_8 - MODE
    )
    :vars
    (
      ?AUTO_12 - INSTRUMENT
      ?AUTO_13 - SATELLITE
      ?AUTO_15 - SATELLITE
      ?AUTO_16 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_12 ?AUTO_13 ) ( SUPPORTS ?AUTO_12 ?AUTO_8 ) ( POWER_ON ?AUTO_12 ) ( POINTING ?AUTO_13 ?AUTO_9 ) ( ON_BOARD ?AUTO_12 ?AUTO_15 ) ( CALIBRATION_TARGET ?AUTO_12 ?AUTO_16 ) ( POINTING ?AUTO_15 ?AUTO_16 ) ( NOT_CALIBRATED ?AUTO_12 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_15 ?AUTO_12 ?AUTO_16 )
      ( GET_IMAGE ?AUTO_9 ?AUTO_8 )
      ( GET_IMAGE-VERIFY ?AUTO_9 ?AUTO_8 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_678 - DIRECTION
      ?AUTO_673 - MODE
    )
    :vars
    (
      ?AUTO_679 - INSTRUMENT
      ?AUTO_680 - SATELLITE
      ?AUTO_675 - SATELLITE
      ?AUTO_681 - INSTRUMENT
      ?AUTO_682 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_679 ?AUTO_680 ) ( SUPPORTS ?AUTO_679 ?AUTO_673 ) ( CALIBRATION_TARGET ?AUTO_679 ?AUTO_678 ) ( ON_BOARD ?AUTO_679 ?AUTO_675 ) ( ON_BOARD ?AUTO_681 ?AUTO_675 ) ( POWER_ON ?AUTO_681 ) ( POINTING ?AUTO_680 ?AUTO_682 ) ( not ( = ?AUTO_678 ?AUTO_682 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_680 ?AUTO_678 ?AUTO_682 )
      ( GET_IMAGE ?AUTO_678 ?AUTO_673 )
      ( GET_IMAGE-VERIFY ?AUTO_678 ?AUTO_673 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_1343 - DIRECTION
      ?AUTO_1344 - MODE
    )
    :vars
    (
      ?AUTO_1349 - INSTRUMENT
      ?AUTO_1350 - SATELLITE
      ?AUTO_1346 - SATELLITE
      ?AUTO_1345 - INSTRUMENT
      ?AUTO_1351 - DIRECTION
      ?AUTO_1353 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_1349 ?AUTO_1350 ) ( SUPPORTS ?AUTO_1349 ?AUTO_1344 ) ( CALIBRATION_TARGET ?AUTO_1349 ?AUTO_1343 ) ( ON_BOARD ?AUTO_1349 ?AUTO_1346 ) ( ON_BOARD ?AUTO_1345 ?AUTO_1346 ) ( POINTING ?AUTO_1350 ?AUTO_1351 ) ( not ( = ?AUTO_1343 ?AUTO_1351 ) ) ( ON_BOARD ?AUTO_1345 ?AUTO_1353 ) ( POWER_AVAIL ?AUTO_1353 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_1345 ?AUTO_1353 )
      ( GET_IMAGE ?AUTO_1343 ?AUTO_1344 )
      ( GET_IMAGE-VERIFY ?AUTO_1343 ?AUTO_1344 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_46 - DIRECTION
      ?AUTO_45 - MODE
    )
    :vars
    (
      ?AUTO_49 - INSTRUMENT
      ?AUTO_50 - SATELLITE
      ?AUTO_51 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_49 ) ( ON_BOARD ?AUTO_49 ?AUTO_50 ) ( SUPPORTS ?AUTO_49 ?AUTO_45 ) ( POWER_ON ?AUTO_49 ) ( POINTING ?AUTO_50 ?AUTO_51 ) ( not ( = ?AUTO_46 ?AUTO_51 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_50 ?AUTO_46 ?AUTO_51 )
      ( GET_IMAGE ?AUTO_46 ?AUTO_45 )
      ( GET_IMAGE-VERIFY ?AUTO_46 ?AUTO_45 ) )
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
      ?AUTO_58 - SATELLITE
      ?AUTO_60 - DIRECTION
      ?AUTO_64 - SATELLITE
      ?AUTO_65 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_59 ?AUTO_58 ) ( SUPPORTS ?AUTO_59 ?AUTO_56 ) ( POWER_ON ?AUTO_59 ) ( POINTING ?AUTO_58 ?AUTO_60 ) ( not ( = ?AUTO_57 ?AUTO_60 ) ) ( ON_BOARD ?AUTO_59 ?AUTO_64 ) ( CALIBRATION_TARGET ?AUTO_59 ?AUTO_65 ) ( POINTING ?AUTO_64 ?AUTO_65 ) ( NOT_CALIBRATED ?AUTO_59 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_64 ?AUTO_59 ?AUTO_65 )
      ( GET_IMAGE ?AUTO_57 ?AUTO_56 )
      ( GET_IMAGE-VERIFY ?AUTO_57 ?AUTO_56 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_524 - DIRECTION
      ?AUTO_525 - MODE
    )
    :vars
    (
      ?AUTO_532 - INSTRUMENT
      ?AUTO_526 - SATELLITE
      ?AUTO_530 - DIRECTION
      ?AUTO_534 - SATELLITE
      ?AUTO_529 - INSTRUMENT
      ?AUTO_535 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_532 ?AUTO_526 ) ( SUPPORTS ?AUTO_532 ?AUTO_525 ) ( not ( = ?AUTO_524 ?AUTO_530 ) ) ( CALIBRATION_TARGET ?AUTO_532 ?AUTO_530 ) ( ON_BOARD ?AUTO_532 ?AUTO_534 ) ( ON_BOARD ?AUTO_529 ?AUTO_534 ) ( POWER_ON ?AUTO_529 ) ( POINTING ?AUTO_526 ?AUTO_535 ) ( not ( = ?AUTO_530 ?AUTO_535 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_526 ?AUTO_530 ?AUTO_535 )
      ( GET_IMAGE ?AUTO_524 ?AUTO_525 )
      ( GET_IMAGE-VERIFY ?AUTO_524 ?AUTO_525 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_542 - DIRECTION
      ?AUTO_543 - MODE
    )
    :vars
    (
      ?AUTO_548 - INSTRUMENT
      ?AUTO_544 - SATELLITE
      ?AUTO_551 - DIRECTION
      ?AUTO_549 - SATELLITE
      ?AUTO_550 - INSTRUMENT
      ?AUTO_547 - DIRECTION
      ?AUTO_553 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_548 ?AUTO_544 ) ( SUPPORTS ?AUTO_548 ?AUTO_543 ) ( not ( = ?AUTO_542 ?AUTO_551 ) ) ( CALIBRATION_TARGET ?AUTO_548 ?AUTO_551 ) ( ON_BOARD ?AUTO_548 ?AUTO_549 ) ( ON_BOARD ?AUTO_550 ?AUTO_549 ) ( POINTING ?AUTO_544 ?AUTO_547 ) ( not ( = ?AUTO_551 ?AUTO_547 ) ) ( ON_BOARD ?AUTO_550 ?AUTO_553 ) ( POWER_AVAIL ?AUTO_553 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_550 ?AUTO_553 )
      ( GET_IMAGE ?AUTO_542 ?AUTO_543 )
      ( GET_IMAGE-VERIFY ?AUTO_542 ?AUTO_543 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_105 - DIRECTION
      ?AUTO_106 - MODE
    )
    :vars
    (
      ?AUTO_110 - INSTRUMENT
      ?AUTO_112 - SATELLITE
      ?AUTO_107 - SATELLITE
      ?AUTO_111 - DIRECTION
      ?AUTO_114 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_110 ?AUTO_112 ) ( SUPPORTS ?AUTO_110 ?AUTO_106 ) ( POINTING ?AUTO_112 ?AUTO_105 ) ( ON_BOARD ?AUTO_110 ?AUTO_107 ) ( CALIBRATION_TARGET ?AUTO_110 ?AUTO_111 ) ( POINTING ?AUTO_107 ?AUTO_111 ) ( ON_BOARD ?AUTO_110 ?AUTO_114 ) ( POWER_AVAIL ?AUTO_114 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_110 ?AUTO_114 )
      ( GET_IMAGE ?AUTO_105 ?AUTO_106 )
      ( GET_IMAGE-VERIFY ?AUTO_105 ?AUTO_106 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_142 - DIRECTION
      ?AUTO_143 - MODE
    )
    :vars
    (
      ?AUTO_149 - INSTRUMENT
      ?AUTO_145 - SATELLITE
      ?AUTO_146 - DIRECTION
      ?AUTO_147 - SATELLITE
      ?AUTO_150 - DIRECTION
      ?AUTO_152 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_149 ?AUTO_145 ) ( SUPPORTS ?AUTO_149 ?AUTO_143 ) ( POINTING ?AUTO_145 ?AUTO_146 ) ( not ( = ?AUTO_142 ?AUTO_146 ) ) ( ON_BOARD ?AUTO_149 ?AUTO_147 ) ( CALIBRATION_TARGET ?AUTO_149 ?AUTO_150 ) ( POINTING ?AUTO_147 ?AUTO_150 ) ( ON_BOARD ?AUTO_149 ?AUTO_152 ) ( POWER_AVAIL ?AUTO_152 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_149 ?AUTO_152 )
      ( GET_IMAGE ?AUTO_142 ?AUTO_143 )
      ( GET_IMAGE-VERIFY ?AUTO_142 ?AUTO_143 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_284 - DIRECTION
      ?AUTO_279 - MODE
    )
    :vars
    (
      ?AUTO_282 - INSTRUMENT
      ?AUTO_285 - SATELLITE
      ?AUTO_286 - SATELLITE
      ?AUTO_287 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_282 ?AUTO_285 ) ( SUPPORTS ?AUTO_282 ?AUTO_279 ) ( CALIBRATION_TARGET ?AUTO_282 ?AUTO_284 ) ( ON_BOARD ?AUTO_282 ?AUTO_286 ) ( POWER_AVAIL ?AUTO_286 ) ( POINTING ?AUTO_285 ?AUTO_287 ) ( not ( = ?AUTO_284 ?AUTO_287 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_285 ?AUTO_284 ?AUTO_287 )
      ( GET_IMAGE ?AUTO_284 ?AUTO_279 )
      ( GET_IMAGE-VERIFY ?AUTO_284 ?AUTO_279 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_359 - DIRECTION
      ?AUTO_360 - MODE
    )
    :vars
    (
      ?AUTO_362 - INSTRUMENT
      ?AUTO_366 - SATELLITE
      ?AUTO_363 - DIRECTION
      ?AUTO_361 - DIRECTION
      ?AUTO_364 - SATELLITE
      ?AUTO_368 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_362 ?AUTO_366 ) ( SUPPORTS ?AUTO_362 ?AUTO_360 ) ( not ( = ?AUTO_359 ?AUTO_363 ) ) ( CALIBRATION_TARGET ?AUTO_362 ?AUTO_363 ) ( POINTING ?AUTO_366 ?AUTO_361 ) ( not ( = ?AUTO_363 ?AUTO_361 ) ) ( ON_BOARD ?AUTO_362 ?AUTO_364 ) ( ON_BOARD ?AUTO_368 ?AUTO_364 ) ( POWER_ON ?AUTO_368 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_368 ?AUTO_364 )
      ( GET_IMAGE ?AUTO_359 ?AUTO_360 )
      ( GET_IMAGE-VERIFY ?AUTO_359 ?AUTO_360 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_510 - DIRECTION
      ?AUTO_511 - MODE
    )
    :vars
    (
      ?AUTO_515 - INSTRUMENT
      ?AUTO_513 - SATELLITE
      ?AUTO_517 - DIRECTION
      ?AUTO_519 - SATELLITE
      ?AUTO_512 - DIRECTION
      ?AUTO_516 - SATELLITE
      ?AUTO_520 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_515 ?AUTO_513 ) ( SUPPORTS ?AUTO_515 ?AUTO_511 ) ( POINTING ?AUTO_513 ?AUTO_517 ) ( not ( = ?AUTO_510 ?AUTO_517 ) ) ( ON_BOARD ?AUTO_515 ?AUTO_519 ) ( CALIBRATION_TARGET ?AUTO_515 ?AUTO_512 ) ( POINTING ?AUTO_519 ?AUTO_512 ) ( ON_BOARD ?AUTO_515 ?AUTO_516 ) ( ON_BOARD ?AUTO_520 ?AUTO_516 ) ( POWER_ON ?AUTO_520 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_520 ?AUTO_516 )
      ( GET_IMAGE ?AUTO_510 ?AUTO_511 )
      ( GET_IMAGE-VERIFY ?AUTO_510 ?AUTO_511 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_592 - DIRECTION
      ?AUTO_593 - MODE
    )
    :vars
    (
      ?AUTO_599 - INSTRUMENT
      ?AUTO_594 - SATELLITE
      ?AUTO_600 - DIRECTION
      ?AUTO_596 - SATELLITE
      ?AUTO_602 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_599 ?AUTO_594 ) ( SUPPORTS ?AUTO_599 ?AUTO_593 ) ( not ( = ?AUTO_592 ?AUTO_600 ) ) ( CALIBRATION_TARGET ?AUTO_599 ?AUTO_600 ) ( ON_BOARD ?AUTO_599 ?AUTO_596 ) ( POWER_AVAIL ?AUTO_596 ) ( POINTING ?AUTO_594 ?AUTO_602 ) ( not ( = ?AUTO_600 ?AUTO_602 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_594 ?AUTO_600 ?AUTO_602 )
      ( GET_IMAGE ?AUTO_592 ?AUTO_593 )
      ( GET_IMAGE-VERIFY ?AUTO_592 ?AUTO_593 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_659 - DIRECTION
      ?AUTO_660 - MODE
    )
    :vars
    (
      ?AUTO_665 - INSTRUMENT
      ?AUTO_664 - SATELLITE
      ?AUTO_666 - SATELLITE
      ?AUTO_663 - DIRECTION
      ?AUTO_667 - SATELLITE
      ?AUTO_668 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_665 ?AUTO_664 ) ( SUPPORTS ?AUTO_665 ?AUTO_660 ) ( POINTING ?AUTO_664 ?AUTO_659 ) ( ON_BOARD ?AUTO_665 ?AUTO_666 ) ( CALIBRATION_TARGET ?AUTO_665 ?AUTO_663 ) ( POINTING ?AUTO_666 ?AUTO_663 ) ( ON_BOARD ?AUTO_665 ?AUTO_667 ) ( ON_BOARD ?AUTO_668 ?AUTO_667 ) ( POWER_ON ?AUTO_668 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_668 ?AUTO_667 )
      ( GET_IMAGE ?AUTO_659 ?AUTO_660 )
      ( GET_IMAGE-VERIFY ?AUTO_659 ?AUTO_660 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_855 - DIRECTION
      ?AUTO_856 - MODE
    )
    :vars
    (
      ?AUTO_857 - INSTRUMENT
      ?AUTO_860 - SATELLITE
      ?AUTO_864 - DIRECTION
      ?AUTO_862 - DIRECTION
      ?AUTO_863 - SATELLITE
      ?AUTO_859 - INSTRUMENT
      ?AUTO_865 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_857 ?AUTO_860 ) ( SUPPORTS ?AUTO_857 ?AUTO_856 ) ( not ( = ?AUTO_855 ?AUTO_864 ) ) ( CALIBRATION_TARGET ?AUTO_857 ?AUTO_864 ) ( not ( = ?AUTO_864 ?AUTO_862 ) ) ( ON_BOARD ?AUTO_857 ?AUTO_863 ) ( ON_BOARD ?AUTO_859 ?AUTO_863 ) ( POWER_ON ?AUTO_859 ) ( POINTING ?AUTO_860 ?AUTO_865 ) ( not ( = ?AUTO_862 ?AUTO_865 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_860 ?AUTO_862 ?AUTO_865 )
      ( GET_IMAGE ?AUTO_855 ?AUTO_856 )
      ( GET_IMAGE-VERIFY ?AUTO_855 ?AUTO_856 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_999 - DIRECTION
      ?AUTO_1000 - MODE
    )
    :vars
    (
      ?AUTO_1003 - INSTRUMENT
      ?AUTO_1006 - SATELLITE
      ?AUTO_1005 - DIRECTION
      ?AUTO_1004 - SATELLITE
      ?AUTO_1007 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_1003 ?AUTO_1006 ) ( SUPPORTS ?AUTO_1003 ?AUTO_1000 ) ( CALIBRATION_TARGET ?AUTO_1003 ?AUTO_999 ) ( POINTING ?AUTO_1006 ?AUTO_1005 ) ( not ( = ?AUTO_999 ?AUTO_1005 ) ) ( ON_BOARD ?AUTO_1003 ?AUTO_1004 ) ( ON_BOARD ?AUTO_1007 ?AUTO_1004 ) ( POWER_ON ?AUTO_1007 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_1007 ?AUTO_1004 )
      ( GET_IMAGE ?AUTO_999 ?AUTO_1000 )
      ( GET_IMAGE-VERIFY ?AUTO_999 ?AUTO_1000 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_1110 - DIRECTION
      ?AUTO_1111 - MODE
    )
    :vars
    (
      ?AUTO_1112 - INSTRUMENT
      ?AUTO_1117 - SATELLITE
      ?AUTO_1116 - DIRECTION
      ?AUTO_1114 - SATELLITE
      ?AUTO_1118 - INSTRUMENT
      ?AUTO_1119 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_1112 ?AUTO_1117 ) ( SUPPORTS ?AUTO_1112 ?AUTO_1111 ) ( CALIBRATION_TARGET ?AUTO_1112 ?AUTO_1110 ) ( not ( = ?AUTO_1110 ?AUTO_1116 ) ) ( ON_BOARD ?AUTO_1112 ?AUTO_1114 ) ( ON_BOARD ?AUTO_1118 ?AUTO_1114 ) ( POWER_ON ?AUTO_1118 ) ( POINTING ?AUTO_1117 ?AUTO_1119 ) ( not ( = ?AUTO_1116 ?AUTO_1119 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_1117 ?AUTO_1116 ?AUTO_1119 )
      ( GET_IMAGE ?AUTO_1110 ?AUTO_1111 )
      ( GET_IMAGE-VERIFY ?AUTO_1110 ?AUTO_1111 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_1124 - DIRECTION
      ?AUTO_1125 - MODE
    )
    :vars
    (
      ?AUTO_1130 - INSTRUMENT
      ?AUTO_1131 - SATELLITE
      ?AUTO_1126 - DIRECTION
      ?AUTO_1128 - SATELLITE
      ?AUTO_1132 - INSTRUMENT
      ?AUTO_1129 - DIRECTION
      ?AUTO_1135 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_1130 ?AUTO_1131 ) ( SUPPORTS ?AUTO_1130 ?AUTO_1125 ) ( CALIBRATION_TARGET ?AUTO_1130 ?AUTO_1124 ) ( not ( = ?AUTO_1124 ?AUTO_1126 ) ) ( ON_BOARD ?AUTO_1130 ?AUTO_1128 ) ( ON_BOARD ?AUTO_1132 ?AUTO_1128 ) ( POINTING ?AUTO_1131 ?AUTO_1129 ) ( not ( = ?AUTO_1126 ?AUTO_1129 ) ) ( ON_BOARD ?AUTO_1132 ?AUTO_1135 ) ( POWER_AVAIL ?AUTO_1135 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_1132 ?AUTO_1135 )
      ( GET_IMAGE ?AUTO_1124 ?AUTO_1125 )
      ( GET_IMAGE-VERIFY ?AUTO_1124 ?AUTO_1125 ) )
  )

)

