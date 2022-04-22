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
      ?AUTO_18 - INSTRUMENT
      ?AUTO_20 - SATELLITE
      ?AUTO_19 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_18 ?AUTO_20 ) ( SUPPORTS ?AUTO_18 ?AUTO_17 ) ( POINTING ?AUTO_20 ?AUTO_19 ) ( not ( = ?AUTO_16 ?AUTO_19 ) ) ( CALIBRATION_TARGET ?AUTO_18 ?AUTO_19 ) ( POWER_AVAIL ?AUTO_20 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_18 ?AUTO_20 )
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
      ?AUTO_25 - INSTRUMENT
      ?AUTO_24 - SATELLITE
      ?AUTO_23 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_25 ?AUTO_24 ) ( SUPPORTS ?AUTO_25 ?AUTO_22 ) ( not ( = ?AUTO_21 ?AUTO_23 ) ) ( CALIBRATION_TARGET ?AUTO_25 ?AUTO_23 ) ( POWER_AVAIL ?AUTO_24 ) ( POINTING ?AUTO_24 ?AUTO_21 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_24 ?AUTO_23 ?AUTO_21 )
      ( GET_IMAGE ?AUTO_21 ?AUTO_22 )
      ( GET_IMAGE-VERIFY ?AUTO_21 ?AUTO_22 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_28 - DIRECTION
      ?AUTO_29 - MODE
    )
    :vars
    (
      ?AUTO_30 - INSTRUMENT
      ?AUTO_31 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_30 ) ( ON_BOARD ?AUTO_30 ?AUTO_31 ) ( SUPPORTS ?AUTO_30 ?AUTO_29 ) ( POWER_ON ?AUTO_30 ) ( POINTING ?AUTO_31 ?AUTO_28 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_31 ?AUTO_28 ?AUTO_30 ?AUTO_29 )
      ( GET_IMAGE-VERIFY ?AUTO_28 ?AUTO_29 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_32 - DIRECTION
      ?AUTO_33 - MODE
    )
    :vars
    (
      ?AUTO_35 - INSTRUMENT
      ?AUTO_34 - SATELLITE
      ?AUTO_36 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_35 ) ( ON_BOARD ?AUTO_35 ?AUTO_34 ) ( SUPPORTS ?AUTO_35 ?AUTO_33 ) ( POWER_ON ?AUTO_35 ) ( POINTING ?AUTO_34 ?AUTO_36 ) ( not ( = ?AUTO_32 ?AUTO_36 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_34 ?AUTO_32 ?AUTO_36 )
      ( GET_IMAGE ?AUTO_32 ?AUTO_33 )
      ( GET_IMAGE-VERIFY ?AUTO_32 ?AUTO_33 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_37 - DIRECTION
      ?AUTO_38 - MODE
    )
    :vars
    (
      ?AUTO_39 - INSTRUMENT
      ?AUTO_41 - SATELLITE
      ?AUTO_40 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_39 ?AUTO_41 ) ( SUPPORTS ?AUTO_39 ?AUTO_38 ) ( POWER_ON ?AUTO_39 ) ( POINTING ?AUTO_41 ?AUTO_40 ) ( not ( = ?AUTO_37 ?AUTO_40 ) ) ( CALIBRATION_TARGET ?AUTO_39 ?AUTO_40 ) ( NOT_CALIBRATED ?AUTO_39 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_41 ?AUTO_39 ?AUTO_40 )
      ( GET_IMAGE ?AUTO_37 ?AUTO_38 )
      ( GET_IMAGE-VERIFY ?AUTO_37 ?AUTO_38 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_42 - DIRECTION
      ?AUTO_43 - MODE
    )
    :vars
    (
      ?AUTO_46 - INSTRUMENT
      ?AUTO_45 - SATELLITE
      ?AUTO_44 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_46 ?AUTO_45 ) ( SUPPORTS ?AUTO_46 ?AUTO_43 ) ( POINTING ?AUTO_45 ?AUTO_44 ) ( not ( = ?AUTO_42 ?AUTO_44 ) ) ( CALIBRATION_TARGET ?AUTO_46 ?AUTO_44 ) ( POWER_AVAIL ?AUTO_45 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_46 ?AUTO_45 )
      ( GET_IMAGE ?AUTO_42 ?AUTO_43 )
      ( GET_IMAGE-VERIFY ?AUTO_42 ?AUTO_43 ) )
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
      ?AUTO_58 - INSTRUMENT
      ?AUTO_56 - SATELLITE
      ?AUTO_55 - DIRECTION
      ?AUTO_57 - DIRECTION
      ?AUTO_59 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_58 ?AUTO_56 ) ( SUPPORTS ?AUTO_58 ?AUTO_54 ) ( not ( = ?AUTO_53 ?AUTO_55 ) ) ( CALIBRATION_TARGET ?AUTO_58 ?AUTO_55 ) ( POINTING ?AUTO_56 ?AUTO_57 ) ( not ( = ?AUTO_55 ?AUTO_57 ) ) ( not ( = ?AUTO_53 ?AUTO_57 ) ) ( ON_BOARD ?AUTO_59 ?AUTO_56 ) ( POWER_ON ?AUTO_59 ) ( not ( = ?AUTO_58 ?AUTO_59 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_59 ?AUTO_56 )
      ( GET_IMAGE ?AUTO_53 ?AUTO_54 )
      ( GET_IMAGE-VERIFY ?AUTO_53 ?AUTO_54 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_72 - DIRECTION
      ?AUTO_73 - MODE
    )
    :vars
    (
      ?AUTO_74 - INSTRUMENT
      ?AUTO_75 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_74 ) ( ON_BOARD ?AUTO_74 ?AUTO_75 ) ( SUPPORTS ?AUTO_74 ?AUTO_73 ) ( POWER_ON ?AUTO_74 ) ( POINTING ?AUTO_75 ?AUTO_72 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_75 ?AUTO_72 ?AUTO_74 ?AUTO_73 )
      ( GET_IMAGE-VERIFY ?AUTO_72 ?AUTO_73 ) )
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
      ?AUTO_82 - INSTRUMENT
      ?AUTO_83 - SATELLITE
      ?AUTO_84 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_82 ?AUTO_83 ) ( SUPPORTS ?AUTO_82 ?AUTO_81 ) ( POWER_ON ?AUTO_82 ) ( CALIBRATION_TARGET ?AUTO_82 ?AUTO_80 ) ( NOT_CALIBRATED ?AUTO_82 ) ( POINTING ?AUTO_83 ?AUTO_84 ) ( not ( = ?AUTO_80 ?AUTO_84 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_83 ?AUTO_80 ?AUTO_84 )
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
      ?AUTO_89 - INSTRUMENT
      ?AUTO_87 - SATELLITE
      ?AUTO_88 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_89 ?AUTO_87 ) ( SUPPORTS ?AUTO_89 ?AUTO_86 ) ( CALIBRATION_TARGET ?AUTO_89 ?AUTO_85 ) ( POINTING ?AUTO_87 ?AUTO_88 ) ( not ( = ?AUTO_85 ?AUTO_88 ) ) ( POWER_AVAIL ?AUTO_87 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_89 ?AUTO_87 )
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
      ?AUTO_94 - INSTRUMENT
      ?AUTO_93 - SATELLITE
      ?AUTO_92 - DIRECTION
      ?AUTO_95 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_94 ?AUTO_93 ) ( SUPPORTS ?AUTO_94 ?AUTO_91 ) ( CALIBRATION_TARGET ?AUTO_94 ?AUTO_90 ) ( POINTING ?AUTO_93 ?AUTO_92 ) ( not ( = ?AUTO_90 ?AUTO_92 ) ) ( ON_BOARD ?AUTO_95 ?AUTO_93 ) ( POWER_ON ?AUTO_95 ) ( not ( = ?AUTO_94 ?AUTO_95 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_95 ?AUTO_93 )
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
      ?AUTO_103 - INSTRUMENT
      ?AUTO_101 - SATELLITE
      ?AUTO_100 - DIRECTION
      ?AUTO_102 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_103 ?AUTO_101 ) ( SUPPORTS ?AUTO_103 ?AUTO_99 ) ( CALIBRATION_TARGET ?AUTO_103 ?AUTO_98 ) ( not ( = ?AUTO_98 ?AUTO_100 ) ) ( ON_BOARD ?AUTO_102 ?AUTO_101 ) ( POWER_ON ?AUTO_102 ) ( not ( = ?AUTO_103 ?AUTO_102 ) ) ( POINTING ?AUTO_101 ?AUTO_98 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_101 ?AUTO_100 ?AUTO_98 )
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
      ?AUTO_109 - DIRECTION
      ?AUTO_110 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_108 ?AUTO_111 ) ( SUPPORTS ?AUTO_108 ?AUTO_107 ) ( CALIBRATION_TARGET ?AUTO_108 ?AUTO_106 ) ( not ( = ?AUTO_106 ?AUTO_109 ) ) ( ON_BOARD ?AUTO_110 ?AUTO_111 ) ( not ( = ?AUTO_108 ?AUTO_110 ) ) ( POINTING ?AUTO_111 ?AUTO_106 ) ( POWER_AVAIL ?AUTO_111 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_110 ?AUTO_111 )
      ( GET_IMAGE ?AUTO_106 ?AUTO_107 )
      ( GET_IMAGE-VERIFY ?AUTO_106 ?AUTO_107 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_128 - DIRECTION
      ?AUTO_129 - MODE
    )
    :vars
    (
      ?AUTO_130 - INSTRUMENT
      ?AUTO_131 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_130 ) ( ON_BOARD ?AUTO_130 ?AUTO_131 ) ( SUPPORTS ?AUTO_130 ?AUTO_129 ) ( POWER_ON ?AUTO_130 ) ( POINTING ?AUTO_131 ?AUTO_128 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_131 ?AUTO_128 ?AUTO_130 ?AUTO_129 )
      ( GET_IMAGE-VERIFY ?AUTO_128 ?AUTO_129 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_132 - DIRECTION
      ?AUTO_133 - MODE
    )
    :vars
    (
      ?AUTO_134 - INSTRUMENT
      ?AUTO_135 - SATELLITE
      ?AUTO_136 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_134 ) ( ON_BOARD ?AUTO_134 ?AUTO_135 ) ( SUPPORTS ?AUTO_134 ?AUTO_133 ) ( POWER_ON ?AUTO_134 ) ( POINTING ?AUTO_135 ?AUTO_136 ) ( not ( = ?AUTO_132 ?AUTO_136 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_135 ?AUTO_132 ?AUTO_136 )
      ( GET_IMAGE ?AUTO_132 ?AUTO_133 )
      ( GET_IMAGE-VERIFY ?AUTO_132 ?AUTO_133 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_139 - DIRECTION
      ?AUTO_140 - MODE
    )
    :vars
    (
      ?AUTO_141 - INSTRUMENT
      ?AUTO_143 - SATELLITE
      ?AUTO_142 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_141 ?AUTO_143 ) ( SUPPORTS ?AUTO_141 ?AUTO_140 ) ( POWER_ON ?AUTO_141 ) ( POINTING ?AUTO_143 ?AUTO_142 ) ( not ( = ?AUTO_139 ?AUTO_142 ) ) ( CALIBRATION_TARGET ?AUTO_141 ?AUTO_142 ) ( NOT_CALIBRATED ?AUTO_141 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_143 ?AUTO_141 ?AUTO_142 )
      ( GET_IMAGE ?AUTO_139 ?AUTO_140 )
      ( GET_IMAGE-VERIFY ?AUTO_139 ?AUTO_140 ) )
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
      ?AUTO_153 - INSTRUMENT
      ?AUTO_152 - SATELLITE
      ?AUTO_151 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_153 ?AUTO_152 ) ( SUPPORTS ?AUTO_153 ?AUTO_150 ) ( not ( = ?AUTO_149 ?AUTO_151 ) ) ( CALIBRATION_TARGET ?AUTO_153 ?AUTO_151 ) ( POINTING ?AUTO_152 ?AUTO_149 ) ( POWER_AVAIL ?AUTO_152 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_153 ?AUTO_152 )
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
      ?AUTO_156 - INSTRUMENT
      ?AUTO_158 - SATELLITE
      ?AUTO_157 - DIRECTION
      ?AUTO_159 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_156 ?AUTO_158 ) ( SUPPORTS ?AUTO_156 ?AUTO_155 ) ( not ( = ?AUTO_154 ?AUTO_157 ) ) ( CALIBRATION_TARGET ?AUTO_156 ?AUTO_157 ) ( POINTING ?AUTO_158 ?AUTO_154 ) ( ON_BOARD ?AUTO_159 ?AUTO_158 ) ( POWER_ON ?AUTO_159 ) ( not ( = ?AUTO_156 ?AUTO_159 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_159 ?AUTO_158 )
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
      ?AUTO_164 - INSTRUMENT
      ?AUTO_167 - SATELLITE
      ?AUTO_166 - DIRECTION
      ?AUTO_165 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_164 ?AUTO_167 ) ( SUPPORTS ?AUTO_164 ?AUTO_163 ) ( not ( = ?AUTO_162 ?AUTO_166 ) ) ( CALIBRATION_TARGET ?AUTO_164 ?AUTO_166 ) ( ON_BOARD ?AUTO_165 ?AUTO_167 ) ( POWER_ON ?AUTO_165 ) ( not ( = ?AUTO_164 ?AUTO_165 ) ) ( POINTING ?AUTO_167 ?AUTO_166 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_167 ?AUTO_162 ?AUTO_166 )
      ( GET_IMAGE ?AUTO_162 ?AUTO_163 )
      ( GET_IMAGE-VERIFY ?AUTO_162 ?AUTO_163 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_188 - DIRECTION
      ?AUTO_189 - MODE
    )
    :vars
    (
      ?AUTO_190 - INSTRUMENT
      ?AUTO_191 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_190 ) ( ON_BOARD ?AUTO_190 ?AUTO_191 ) ( SUPPORTS ?AUTO_190 ?AUTO_189 ) ( POWER_ON ?AUTO_190 ) ( POINTING ?AUTO_191 ?AUTO_188 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_191 ?AUTO_188 ?AUTO_190 ?AUTO_189 )
      ( GET_IMAGE-VERIFY ?AUTO_188 ?AUTO_189 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_192 - DIRECTION
      ?AUTO_193 - MODE
    )
    :vars
    (
      ?AUTO_194 - INSTRUMENT
      ?AUTO_195 - SATELLITE
      ?AUTO_196 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_194 ) ( ON_BOARD ?AUTO_194 ?AUTO_195 ) ( SUPPORTS ?AUTO_194 ?AUTO_193 ) ( POWER_ON ?AUTO_194 ) ( POINTING ?AUTO_195 ?AUTO_196 ) ( not ( = ?AUTO_192 ?AUTO_196 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_195 ?AUTO_192 ?AUTO_196 )
      ( GET_IMAGE ?AUTO_192 ?AUTO_193 )
      ( GET_IMAGE-VERIFY ?AUTO_192 ?AUTO_193 ) )
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
      ?AUTO_217 - DIRECTION
      ?AUTO_218 - MODE
    )
    :vars
    (
      ?AUTO_220 - INSTRUMENT
      ?AUTO_221 - SATELLITE
      ?AUTO_219 - DIRECTION
      ?AUTO_222 - DIRECTION
      ?AUTO_223 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_220 ?AUTO_221 ) ( SUPPORTS ?AUTO_220 ?AUTO_218 ) ( not ( = ?AUTO_217 ?AUTO_219 ) ) ( CALIBRATION_TARGET ?AUTO_220 ?AUTO_219 ) ( POINTING ?AUTO_221 ?AUTO_222 ) ( not ( = ?AUTO_219 ?AUTO_222 ) ) ( not ( = ?AUTO_217 ?AUTO_222 ) ) ( ON_BOARD ?AUTO_223 ?AUTO_221 ) ( POWER_ON ?AUTO_223 ) ( not ( = ?AUTO_220 ?AUTO_223 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_223 ?AUTO_221 )
      ( GET_IMAGE ?AUTO_217 ?AUTO_218 )
      ( GET_IMAGE-VERIFY ?AUTO_217 ?AUTO_218 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_226 - DIRECTION
      ?AUTO_227 - MODE
    )
    :vars
    (
      ?AUTO_228 - INSTRUMENT
      ?AUTO_229 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_228 ) ( ON_BOARD ?AUTO_228 ?AUTO_229 ) ( SUPPORTS ?AUTO_228 ?AUTO_227 ) ( POWER_ON ?AUTO_228 ) ( POINTING ?AUTO_229 ?AUTO_226 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_229 ?AUTO_226 ?AUTO_228 ?AUTO_227 )
      ( GET_IMAGE-VERIFY ?AUTO_226 ?AUTO_227 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_230 - DIRECTION
      ?AUTO_231 - MODE
    )
    :vars
    (
      ?AUTO_232 - INSTRUMENT
      ?AUTO_233 - SATELLITE
      ?AUTO_234 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_232 ) ( ON_BOARD ?AUTO_232 ?AUTO_233 ) ( SUPPORTS ?AUTO_232 ?AUTO_231 ) ( POWER_ON ?AUTO_232 ) ( POINTING ?AUTO_233 ?AUTO_234 ) ( not ( = ?AUTO_230 ?AUTO_234 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_233 ?AUTO_230 ?AUTO_234 )
      ( GET_IMAGE ?AUTO_230 ?AUTO_231 )
      ( GET_IMAGE-VERIFY ?AUTO_230 ?AUTO_231 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_235 - DIRECTION
      ?AUTO_236 - MODE
    )
    :vars
    (
      ?AUTO_239 - INSTRUMENT
      ?AUTO_238 - SATELLITE
      ?AUTO_237 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_239 ?AUTO_238 ) ( SUPPORTS ?AUTO_239 ?AUTO_236 ) ( POWER_ON ?AUTO_239 ) ( POINTING ?AUTO_238 ?AUTO_237 ) ( not ( = ?AUTO_235 ?AUTO_237 ) ) ( CALIBRATION_TARGET ?AUTO_239 ?AUTO_237 ) ( NOT_CALIBRATED ?AUTO_239 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_238 ?AUTO_239 ?AUTO_237 )
      ( GET_IMAGE ?AUTO_235 ?AUTO_236 )
      ( GET_IMAGE-VERIFY ?AUTO_235 ?AUTO_236 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_240 - DIRECTION
      ?AUTO_241 - MODE
    )
    :vars
    (
      ?AUTO_243 - INSTRUMENT
      ?AUTO_242 - SATELLITE
      ?AUTO_244 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_243 ?AUTO_242 ) ( SUPPORTS ?AUTO_243 ?AUTO_241 ) ( POINTING ?AUTO_242 ?AUTO_244 ) ( not ( = ?AUTO_240 ?AUTO_244 ) ) ( CALIBRATION_TARGET ?AUTO_243 ?AUTO_244 ) ( POWER_AVAIL ?AUTO_242 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_243 ?AUTO_242 )
      ( GET_IMAGE ?AUTO_240 ?AUTO_241 )
      ( GET_IMAGE-VERIFY ?AUTO_240 ?AUTO_241 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_247 - DIRECTION
      ?AUTO_248 - MODE
    )
    :vars
    (
      ?AUTO_249 - INSTRUMENT
      ?AUTO_250 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_249 ) ( ON_BOARD ?AUTO_249 ?AUTO_250 ) ( SUPPORTS ?AUTO_249 ?AUTO_248 ) ( POWER_ON ?AUTO_249 ) ( POINTING ?AUTO_250 ?AUTO_247 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_250 ?AUTO_247 ?AUTO_249 ?AUTO_248 )
      ( GET_IMAGE-VERIFY ?AUTO_247 ?AUTO_248 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_251 - DIRECTION
      ?AUTO_252 - MODE
    )
    :vars
    (
      ?AUTO_253 - INSTRUMENT
      ?AUTO_254 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_253 ?AUTO_254 ) ( SUPPORTS ?AUTO_253 ?AUTO_252 ) ( POWER_ON ?AUTO_253 ) ( POINTING ?AUTO_254 ?AUTO_251 ) ( CALIBRATION_TARGET ?AUTO_253 ?AUTO_251 ) ( NOT_CALIBRATED ?AUTO_253 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_254 ?AUTO_253 ?AUTO_251 )
      ( GET_IMAGE ?AUTO_251 ?AUTO_252 )
      ( GET_IMAGE-VERIFY ?AUTO_251 ?AUTO_252 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_255 - DIRECTION
      ?AUTO_256 - MODE
    )
    :vars
    (
      ?AUTO_258 - INSTRUMENT
      ?AUTO_257 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_258 ?AUTO_257 ) ( SUPPORTS ?AUTO_258 ?AUTO_256 ) ( POINTING ?AUTO_257 ?AUTO_255 ) ( CALIBRATION_TARGET ?AUTO_258 ?AUTO_255 ) ( POWER_AVAIL ?AUTO_257 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_258 ?AUTO_257 )
      ( GET_IMAGE ?AUTO_255 ?AUTO_256 )
      ( GET_IMAGE-VERIFY ?AUTO_255 ?AUTO_256 ) )
  )

)

