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
      ?AUTO_15 - INSTRUMENT
      ?AUTO_14 - SATELLITE
      ?AUTO_13 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_15 ?AUTO_14 ) ( SUPPORTS ?AUTO_15 ?AUTO_12 ) ( POWER_ON ?AUTO_15 ) ( POINTING ?AUTO_14 ?AUTO_13 ) ( not ( = ?AUTO_11 ?AUTO_13 ) ) ( CALIBRATION_TARGET ?AUTO_15 ?AUTO_13 ) ( NOT_CALIBRATED ?AUTO_15 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_14 ?AUTO_15 ?AUTO_13 )
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
      ?AUTO_19 - INSTRUMENT
      ?AUTO_20 - SATELLITE
      ?AUTO_18 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_19 ?AUTO_20 ) ( SUPPORTS ?AUTO_19 ?AUTO_17 ) ( POINTING ?AUTO_20 ?AUTO_18 ) ( not ( = ?AUTO_16 ?AUTO_18 ) ) ( CALIBRATION_TARGET ?AUTO_19 ?AUTO_18 ) ( POWER_AVAIL ?AUTO_20 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_19 ?AUTO_20 )
      ( GET_IMAGE ?AUTO_16 ?AUTO_17 )
      ( GET_IMAGE-VERIFY ?AUTO_16 ?AUTO_17 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_21 - DIRECTION
      ?AUTO_22 - MODE
    )
    :vars
    (
      ?AUTO_23 - INSTRUMENT
      ?AUTO_25 - SATELLITE
      ?AUTO_24 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_23 ?AUTO_25 ) ( SUPPORTS ?AUTO_23 ?AUTO_22 ) ( not ( = ?AUTO_21 ?AUTO_24 ) ) ( CALIBRATION_TARGET ?AUTO_23 ?AUTO_24 ) ( POWER_AVAIL ?AUTO_25 ) ( POINTING ?AUTO_25 ?AUTO_21 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_25 ?AUTO_24 ?AUTO_21 )
      ( GET_IMAGE ?AUTO_21 ?AUTO_22 )
      ( GET_IMAGE-VERIFY ?AUTO_21 ?AUTO_22 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_47 - DIRECTION
      ?AUTO_48 - MODE
    )
    :vars
    (
      ?AUTO_49 - INSTRUMENT
      ?AUTO_51 - SATELLITE
      ?AUTO_50 - DIRECTION
      ?AUTO_52 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_49 ?AUTO_51 ) ( SUPPORTS ?AUTO_49 ?AUTO_48 ) ( not ( = ?AUTO_47 ?AUTO_50 ) ) ( CALIBRATION_TARGET ?AUTO_49 ?AUTO_50 ) ( POWER_AVAIL ?AUTO_51 ) ( POINTING ?AUTO_51 ?AUTO_52 ) ( not ( = ?AUTO_50 ?AUTO_52 ) ) ( not ( = ?AUTO_47 ?AUTO_52 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_51 ?AUTO_50 ?AUTO_52 )
      ( GET_IMAGE ?AUTO_47 ?AUTO_48 )
      ( GET_IMAGE-VERIFY ?AUTO_47 ?AUTO_48 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_53 - DIRECTION
      ?AUTO_54 - MODE
    )
    :vars
    (
      ?AUTO_57 - INSTRUMENT
      ?AUTO_58 - SATELLITE
      ?AUTO_55 - DIRECTION
      ?AUTO_56 - DIRECTION
      ?AUTO_59 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_57 ?AUTO_58 ) ( SUPPORTS ?AUTO_57 ?AUTO_54 ) ( not ( = ?AUTO_53 ?AUTO_55 ) ) ( CALIBRATION_TARGET ?AUTO_57 ?AUTO_55 ) ( POINTING ?AUTO_58 ?AUTO_56 ) ( not ( = ?AUTO_55 ?AUTO_56 ) ) ( not ( = ?AUTO_53 ?AUTO_56 ) ) ( ON_BOARD ?AUTO_59 ?AUTO_58 ) ( POWER_ON ?AUTO_59 ) ( not ( = ?AUTO_57 ?AUTO_59 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_59 ?AUTO_58 )
      ( GET_IMAGE ?AUTO_53 ?AUTO_54 )
      ( GET_IMAGE-VERIFY ?AUTO_53 ?AUTO_54 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_76 - DIRECTION
      ?AUTO_77 - MODE
    )
    :vars
    (
      ?AUTO_78 - INSTRUMENT
      ?AUTO_79 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_78 ?AUTO_79 ) ( SUPPORTS ?AUTO_78 ?AUTO_77 ) ( POWER_ON ?AUTO_78 ) ( POINTING ?AUTO_79 ?AUTO_76 ) ( CALIBRATION_TARGET ?AUTO_78 ?AUTO_76 ) ( NOT_CALIBRATED ?AUTO_78 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_79 ?AUTO_78 ?AUTO_76 )
      ( GET_IMAGE ?AUTO_76 ?AUTO_77 )
      ( GET_IMAGE-VERIFY ?AUTO_76 ?AUTO_77 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_80 - DIRECTION
      ?AUTO_81 - MODE
    )
    :vars
    (
      ?AUTO_83 - INSTRUMENT
      ?AUTO_82 - SATELLITE
      ?AUTO_84 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_83 ?AUTO_82 ) ( SUPPORTS ?AUTO_83 ?AUTO_81 ) ( POWER_ON ?AUTO_83 ) ( CALIBRATION_TARGET ?AUTO_83 ?AUTO_80 ) ( NOT_CALIBRATED ?AUTO_83 ) ( POINTING ?AUTO_82 ?AUTO_84 ) ( not ( = ?AUTO_80 ?AUTO_84 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_82 ?AUTO_80 ?AUTO_84 )
      ( GET_IMAGE ?AUTO_80 ?AUTO_81 )
      ( GET_IMAGE-VERIFY ?AUTO_80 ?AUTO_81 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_85 - DIRECTION
      ?AUTO_86 - MODE
    )
    :vars
    (
      ?AUTO_88 - INSTRUMENT
      ?AUTO_87 - SATELLITE
      ?AUTO_89 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_88 ?AUTO_87 ) ( SUPPORTS ?AUTO_88 ?AUTO_86 ) ( CALIBRATION_TARGET ?AUTO_88 ?AUTO_85 ) ( POINTING ?AUTO_87 ?AUTO_89 ) ( not ( = ?AUTO_85 ?AUTO_89 ) ) ( POWER_AVAIL ?AUTO_87 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_88 ?AUTO_87 )
      ( GET_IMAGE ?AUTO_85 ?AUTO_86 )
      ( GET_IMAGE-VERIFY ?AUTO_85 ?AUTO_86 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_90 - DIRECTION
      ?AUTO_91 - MODE
    )
    :vars
    (
      ?AUTO_93 - INSTRUMENT
      ?AUTO_92 - SATELLITE
      ?AUTO_94 - DIRECTION
      ?AUTO_95 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_93 ?AUTO_92 ) ( SUPPORTS ?AUTO_93 ?AUTO_91 ) ( CALIBRATION_TARGET ?AUTO_93 ?AUTO_90 ) ( POINTING ?AUTO_92 ?AUTO_94 ) ( not ( = ?AUTO_90 ?AUTO_94 ) ) ( ON_BOARD ?AUTO_95 ?AUTO_92 ) ( POWER_ON ?AUTO_95 ) ( not ( = ?AUTO_93 ?AUTO_95 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_95 ?AUTO_92 )
      ( GET_IMAGE ?AUTO_90 ?AUTO_91 )
      ( GET_IMAGE-VERIFY ?AUTO_90 ?AUTO_91 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_98 - DIRECTION
      ?AUTO_99 - MODE
    )
    :vars
    (
      ?AUTO_101 - INSTRUMENT
      ?AUTO_103 - SATELLITE
      ?AUTO_102 - DIRECTION
      ?AUTO_100 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_101 ?AUTO_103 ) ( SUPPORTS ?AUTO_101 ?AUTO_99 ) ( CALIBRATION_TARGET ?AUTO_101 ?AUTO_98 ) ( not ( = ?AUTO_98 ?AUTO_102 ) ) ( ON_BOARD ?AUTO_100 ?AUTO_103 ) ( POWER_ON ?AUTO_100 ) ( not ( = ?AUTO_101 ?AUTO_100 ) ) ( POINTING ?AUTO_103 ?AUTO_98 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_103 ?AUTO_102 ?AUTO_98 )
      ( GET_IMAGE ?AUTO_98 ?AUTO_99 )
      ( GET_IMAGE-VERIFY ?AUTO_98 ?AUTO_99 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_106 - DIRECTION
      ?AUTO_107 - MODE
    )
    :vars
    (
      ?AUTO_108 - INSTRUMENT
      ?AUTO_111 - SATELLITE
      ?AUTO_110 - DIRECTION
      ?AUTO_109 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_108 ?AUTO_111 ) ( SUPPORTS ?AUTO_108 ?AUTO_107 ) ( CALIBRATION_TARGET ?AUTO_108 ?AUTO_106 ) ( not ( = ?AUTO_106 ?AUTO_110 ) ) ( ON_BOARD ?AUTO_109 ?AUTO_111 ) ( not ( = ?AUTO_108 ?AUTO_109 ) ) ( POINTING ?AUTO_111 ?AUTO_106 ) ( POWER_AVAIL ?AUTO_111 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_109 ?AUTO_111 )
      ( GET_IMAGE ?AUTO_106 ?AUTO_107 )
      ( GET_IMAGE-VERIFY ?AUTO_106 ?AUTO_107 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_144 - DIRECTION
      ?AUTO_145 - MODE
    )
    :vars
    (
      ?AUTO_146 - INSTRUMENT
      ?AUTO_148 - SATELLITE
      ?AUTO_147 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_146 ?AUTO_148 ) ( SUPPORTS ?AUTO_146 ?AUTO_145 ) ( POWER_ON ?AUTO_146 ) ( not ( = ?AUTO_144 ?AUTO_147 ) ) ( CALIBRATION_TARGET ?AUTO_146 ?AUTO_147 ) ( NOT_CALIBRATED ?AUTO_146 ) ( POINTING ?AUTO_148 ?AUTO_144 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_148 ?AUTO_147 ?AUTO_144 )
      ( GET_IMAGE ?AUTO_144 ?AUTO_145 )
      ( GET_IMAGE-VERIFY ?AUTO_144 ?AUTO_145 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_149 - DIRECTION
      ?AUTO_150 - MODE
    )
    :vars
    (
      ?AUTO_152 - INSTRUMENT
      ?AUTO_153 - SATELLITE
      ?AUTO_151 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_152 ?AUTO_153 ) ( SUPPORTS ?AUTO_152 ?AUTO_150 ) ( not ( = ?AUTO_149 ?AUTO_151 ) ) ( CALIBRATION_TARGET ?AUTO_152 ?AUTO_151 ) ( POINTING ?AUTO_153 ?AUTO_149 ) ( POWER_AVAIL ?AUTO_153 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_152 ?AUTO_153 )
      ( GET_IMAGE ?AUTO_149 ?AUTO_150 )
      ( GET_IMAGE-VERIFY ?AUTO_149 ?AUTO_150 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_154 - DIRECTION
      ?AUTO_155 - MODE
    )
    :vars
    (
      ?AUTO_158 - INSTRUMENT
      ?AUTO_156 - SATELLITE
      ?AUTO_157 - DIRECTION
      ?AUTO_159 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_158 ?AUTO_156 ) ( SUPPORTS ?AUTO_158 ?AUTO_155 ) ( not ( = ?AUTO_154 ?AUTO_157 ) ) ( CALIBRATION_TARGET ?AUTO_158 ?AUTO_157 ) ( POINTING ?AUTO_156 ?AUTO_154 ) ( ON_BOARD ?AUTO_159 ?AUTO_156 ) ( POWER_ON ?AUTO_159 ) ( not ( = ?AUTO_158 ?AUTO_159 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_159 ?AUTO_156 )
      ( GET_IMAGE ?AUTO_154 ?AUTO_155 )
      ( GET_IMAGE-VERIFY ?AUTO_154 ?AUTO_155 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_162 - DIRECTION
      ?AUTO_163 - MODE
    )
    :vars
    (
      ?AUTO_166 - INSTRUMENT
      ?AUTO_167 - SATELLITE
      ?AUTO_164 - DIRECTION
      ?AUTO_165 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_166 ?AUTO_167 ) ( SUPPORTS ?AUTO_166 ?AUTO_163 ) ( not ( = ?AUTO_162 ?AUTO_164 ) ) ( CALIBRATION_TARGET ?AUTO_166 ?AUTO_164 ) ( ON_BOARD ?AUTO_165 ?AUTO_167 ) ( POWER_ON ?AUTO_165 ) ( not ( = ?AUTO_166 ?AUTO_165 ) ) ( POINTING ?AUTO_167 ?AUTO_164 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_167 ?AUTO_162 ?AUTO_164 )
      ( GET_IMAGE ?AUTO_162 ?AUTO_163 )
      ( GET_IMAGE-VERIFY ?AUTO_162 ?AUTO_163 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_205 - DIRECTION
      ?AUTO_206 - MODE
    )
    :vars
    (
      ?AUTO_208 - INSTRUMENT
      ?AUTO_209 - SATELLITE
      ?AUTO_207 - DIRECTION
      ?AUTO_210 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_208 ?AUTO_209 ) ( SUPPORTS ?AUTO_208 ?AUTO_206 ) ( POWER_ON ?AUTO_208 ) ( not ( = ?AUTO_205 ?AUTO_207 ) ) ( CALIBRATION_TARGET ?AUTO_208 ?AUTO_207 ) ( NOT_CALIBRATED ?AUTO_208 ) ( POINTING ?AUTO_209 ?AUTO_210 ) ( not ( = ?AUTO_207 ?AUTO_210 ) ) ( not ( = ?AUTO_205 ?AUTO_210 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_209 ?AUTO_207 ?AUTO_210 )
      ( GET_IMAGE ?AUTO_205 ?AUTO_206 )
      ( GET_IMAGE-VERIFY ?AUTO_205 ?AUTO_206 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_211 - DIRECTION
      ?AUTO_212 - MODE
    )
    :vars
    (
      ?AUTO_214 - INSTRUMENT
      ?AUTO_215 - SATELLITE
      ?AUTO_213 - DIRECTION
      ?AUTO_216 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_214 ?AUTO_215 ) ( SUPPORTS ?AUTO_214 ?AUTO_212 ) ( not ( = ?AUTO_211 ?AUTO_213 ) ) ( CALIBRATION_TARGET ?AUTO_214 ?AUTO_213 ) ( POINTING ?AUTO_215 ?AUTO_216 ) ( not ( = ?AUTO_213 ?AUTO_216 ) ) ( not ( = ?AUTO_211 ?AUTO_216 ) ) ( POWER_AVAIL ?AUTO_215 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_214 ?AUTO_215 )
      ( GET_IMAGE ?AUTO_211 ?AUTO_212 )
      ( GET_IMAGE-VERIFY ?AUTO_211 ?AUTO_212 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_248 - DIRECTION
      ?AUTO_249 - MODE
    )
    :vars
    (
      ?AUTO_250 - INSTRUMENT
      ?AUTO_251 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_250 ?AUTO_251 ) ( SUPPORTS ?AUTO_250 ?AUTO_249 ) ( POINTING ?AUTO_251 ?AUTO_248 ) ( CALIBRATION_TARGET ?AUTO_250 ?AUTO_248 ) ( POWER_AVAIL ?AUTO_251 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_250 ?AUTO_251 )
      ( GET_IMAGE ?AUTO_248 ?AUTO_249 )
      ( GET_IMAGE-VERIFY ?AUTO_248 ?AUTO_249 ) )
  )

)

