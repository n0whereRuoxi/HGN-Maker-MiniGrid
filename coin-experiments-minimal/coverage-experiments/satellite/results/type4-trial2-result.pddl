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
      ?AUTO_23 - DIRECTION
      ?AUTO_24 - MODE
    )
    :vars
    (
      ?AUTO_25 - INSTRUMENT
      ?AUTO_26 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_25 ) ( ON_BOARD ?AUTO_25 ?AUTO_26 ) ( SUPPORTS ?AUTO_25 ?AUTO_24 ) ( POWER_ON ?AUTO_25 ) ( POINTING ?AUTO_26 ?AUTO_23 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_26 ?AUTO_23 ?AUTO_25 ?AUTO_24 )
      ( GET_IMAGE-VERIFY ?AUTO_23 ?AUTO_24 ) )
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
      ?AUTO_37 - DIRECTION
      ?AUTO_38 - MODE
    )
    :vars
    (
      ?AUTO_39 - INSTRUMENT
      ?AUTO_40 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_39 ) ( ON_BOARD ?AUTO_39 ?AUTO_40 ) ( SUPPORTS ?AUTO_39 ?AUTO_38 ) ( POWER_ON ?AUTO_39 ) ( POINTING ?AUTO_40 ?AUTO_37 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_40 ?AUTO_37 ?AUTO_39 ?AUTO_38 )
      ( GET_IMAGE-VERIFY ?AUTO_37 ?AUTO_38 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_41 - DIRECTION
      ?AUTO_42 - MODE
    )
    :vars
    (
      ?AUTO_43 - INSTRUMENT
      ?AUTO_44 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_43 ?AUTO_44 ) ( SUPPORTS ?AUTO_43 ?AUTO_42 ) ( POWER_ON ?AUTO_43 ) ( POINTING ?AUTO_44 ?AUTO_41 ) ( CALIBRATION_TARGET ?AUTO_43 ?AUTO_41 ) ( NOT_CALIBRATED ?AUTO_43 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_44 ?AUTO_43 ?AUTO_41 )
      ( GET_IMAGE ?AUTO_41 ?AUTO_42 )
      ( GET_IMAGE-VERIFY ?AUTO_41 ?AUTO_42 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_45 - DIRECTION
      ?AUTO_46 - MODE
    )
    :vars
    (
      ?AUTO_48 - INSTRUMENT
      ?AUTO_47 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_48 ?AUTO_47 ) ( SUPPORTS ?AUTO_48 ?AUTO_46 ) ( POINTING ?AUTO_47 ?AUTO_45 ) ( CALIBRATION_TARGET ?AUTO_48 ?AUTO_45 ) ( POWER_AVAIL ?AUTO_47 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_48 ?AUTO_47 )
      ( GET_IMAGE ?AUTO_45 ?AUTO_46 )
      ( GET_IMAGE-VERIFY ?AUTO_45 ?AUTO_46 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_53 - DIRECTION
      ?AUTO_54 - MODE
    )
    :vars
    (
      ?AUTO_55 - INSTRUMENT
      ?AUTO_56 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_55 ) ( ON_BOARD ?AUTO_55 ?AUTO_56 ) ( SUPPORTS ?AUTO_55 ?AUTO_54 ) ( POWER_ON ?AUTO_55 ) ( POINTING ?AUTO_56 ?AUTO_53 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_56 ?AUTO_53 ?AUTO_55 ?AUTO_54 )
      ( GET_IMAGE-VERIFY ?AUTO_53 ?AUTO_54 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_57 - DIRECTION
      ?AUTO_58 - MODE
    )
    :vars
    (
      ?AUTO_59 - INSTRUMENT
      ?AUTO_60 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_59 ?AUTO_60 ) ( SUPPORTS ?AUTO_59 ?AUTO_58 ) ( POWER_ON ?AUTO_59 ) ( POINTING ?AUTO_60 ?AUTO_57 ) ( CALIBRATION_TARGET ?AUTO_59 ?AUTO_57 ) ( NOT_CALIBRATED ?AUTO_59 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_60 ?AUTO_59 ?AUTO_57 )
      ( GET_IMAGE ?AUTO_57 ?AUTO_58 )
      ( GET_IMAGE-VERIFY ?AUTO_57 ?AUTO_58 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_61 - DIRECTION
      ?AUTO_62 - MODE
    )
    :vars
    (
      ?AUTO_64 - INSTRUMENT
      ?AUTO_63 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_64 ?AUTO_63 ) ( SUPPORTS ?AUTO_64 ?AUTO_62 ) ( POINTING ?AUTO_63 ?AUTO_61 ) ( CALIBRATION_TARGET ?AUTO_64 ?AUTO_61 ) ( POWER_AVAIL ?AUTO_63 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_64 ?AUTO_63 )
      ( GET_IMAGE ?AUTO_61 ?AUTO_62 )
      ( GET_IMAGE-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_65 - DIRECTION
      ?AUTO_66 - MODE
    )
    :vars
    (
      ?AUTO_67 - INSTRUMENT
      ?AUTO_68 - SATELLITE
      ?AUTO_69 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_67 ?AUTO_68 ) ( SUPPORTS ?AUTO_67 ?AUTO_66 ) ( POINTING ?AUTO_68 ?AUTO_65 ) ( CALIBRATION_TARGET ?AUTO_67 ?AUTO_65 ) ( ON_BOARD ?AUTO_69 ?AUTO_68 ) ( POWER_ON ?AUTO_69 ) ( not ( = ?AUTO_67 ?AUTO_69 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_69 ?AUTO_68 )
      ( GET_IMAGE ?AUTO_65 ?AUTO_66 )
      ( GET_IMAGE-VERIFY ?AUTO_65 ?AUTO_66 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_82 - DIRECTION
      ?AUTO_83 - MODE
    )
    :vars
    (
      ?AUTO_84 - INSTRUMENT
      ?AUTO_85 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_84 ) ( ON_BOARD ?AUTO_84 ?AUTO_85 ) ( SUPPORTS ?AUTO_84 ?AUTO_83 ) ( POWER_ON ?AUTO_84 ) ( POINTING ?AUTO_85 ?AUTO_82 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_85 ?AUTO_82 ?AUTO_84 ?AUTO_83 )
      ( GET_IMAGE-VERIFY ?AUTO_82 ?AUTO_83 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_86 - DIRECTION
      ?AUTO_87 - MODE
    )
    :vars
    (
      ?AUTO_88 - INSTRUMENT
      ?AUTO_89 - SATELLITE
      ?AUTO_90 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_88 ) ( ON_BOARD ?AUTO_88 ?AUTO_89 ) ( SUPPORTS ?AUTO_88 ?AUTO_87 ) ( POWER_ON ?AUTO_88 ) ( POINTING ?AUTO_89 ?AUTO_90 ) ( not ( = ?AUTO_86 ?AUTO_90 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_89 ?AUTO_86 ?AUTO_90 )
      ( GET_IMAGE ?AUTO_86 ?AUTO_87 )
      ( GET_IMAGE-VERIFY ?AUTO_86 ?AUTO_87 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_93 - DIRECTION
      ?AUTO_94 - MODE
    )
    :vars
    (
      ?AUTO_96 - INSTRUMENT
      ?AUTO_95 - SATELLITE
      ?AUTO_97 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_96 ?AUTO_95 ) ( SUPPORTS ?AUTO_96 ?AUTO_94 ) ( POWER_ON ?AUTO_96 ) ( POINTING ?AUTO_95 ?AUTO_97 ) ( not ( = ?AUTO_93 ?AUTO_97 ) ) ( CALIBRATION_TARGET ?AUTO_96 ?AUTO_97 ) ( NOT_CALIBRATED ?AUTO_96 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_95 ?AUTO_96 ?AUTO_97 )
      ( GET_IMAGE ?AUTO_93 ?AUTO_94 )
      ( GET_IMAGE-VERIFY ?AUTO_93 ?AUTO_94 ) )
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
      ?AUTO_100 - SATELLITE
      ?AUTO_102 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_101 ?AUTO_100 ) ( SUPPORTS ?AUTO_101 ?AUTO_99 ) ( POINTING ?AUTO_100 ?AUTO_102 ) ( not ( = ?AUTO_98 ?AUTO_102 ) ) ( CALIBRATION_TARGET ?AUTO_101 ?AUTO_102 ) ( POWER_AVAIL ?AUTO_100 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_101 ?AUTO_100 )
      ( GET_IMAGE ?AUTO_98 ?AUTO_99 )
      ( GET_IMAGE-VERIFY ?AUTO_98 ?AUTO_99 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_103 - DIRECTION
      ?AUTO_104 - MODE
    )
    :vars
    (
      ?AUTO_106 - INSTRUMENT
      ?AUTO_107 - SATELLITE
      ?AUTO_105 - DIRECTION
      ?AUTO_108 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_106 ?AUTO_107 ) ( SUPPORTS ?AUTO_106 ?AUTO_104 ) ( POINTING ?AUTO_107 ?AUTO_105 ) ( not ( = ?AUTO_103 ?AUTO_105 ) ) ( CALIBRATION_TARGET ?AUTO_106 ?AUTO_105 ) ( ON_BOARD ?AUTO_108 ?AUTO_107 ) ( POWER_ON ?AUTO_108 ) ( not ( = ?AUTO_106 ?AUTO_108 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_108 ?AUTO_107 )
      ( GET_IMAGE ?AUTO_103 ?AUTO_104 )
      ( GET_IMAGE-VERIFY ?AUTO_103 ?AUTO_104 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_121 - DIRECTION
      ?AUTO_122 - MODE
    )
    :vars
    (
      ?AUTO_123 - INSTRUMENT
      ?AUTO_124 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_123 ) ( ON_BOARD ?AUTO_123 ?AUTO_124 ) ( SUPPORTS ?AUTO_123 ?AUTO_122 ) ( POWER_ON ?AUTO_123 ) ( POINTING ?AUTO_124 ?AUTO_121 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_124 ?AUTO_121 ?AUTO_123 ?AUTO_122 )
      ( GET_IMAGE-VERIFY ?AUTO_121 ?AUTO_122 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_125 - DIRECTION
      ?AUTO_126 - MODE
    )
    :vars
    (
      ?AUTO_127 - INSTRUMENT
      ?AUTO_128 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_127 ?AUTO_128 ) ( SUPPORTS ?AUTO_127 ?AUTO_126 ) ( POWER_ON ?AUTO_127 ) ( POINTING ?AUTO_128 ?AUTO_125 ) ( CALIBRATION_TARGET ?AUTO_127 ?AUTO_125 ) ( NOT_CALIBRATED ?AUTO_127 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_128 ?AUTO_127 ?AUTO_125 )
      ( GET_IMAGE ?AUTO_125 ?AUTO_126 )
      ( GET_IMAGE-VERIFY ?AUTO_125 ?AUTO_126 ) )
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
      ?AUTO_158 - DIRECTION
      ?AUTO_159 - MODE
    )
    :vars
    (
      ?AUTO_160 - INSTRUMENT
      ?AUTO_161 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_160 ) ( ON_BOARD ?AUTO_160 ?AUTO_161 ) ( SUPPORTS ?AUTO_160 ?AUTO_159 ) ( POWER_ON ?AUTO_160 ) ( POINTING ?AUTO_161 ?AUTO_158 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_161 ?AUTO_158 ?AUTO_160 ?AUTO_159 )
      ( GET_IMAGE-VERIFY ?AUTO_158 ?AUTO_159 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_162 - DIRECTION
      ?AUTO_163 - MODE
    )
    :vars
    (
      ?AUTO_165 - INSTRUMENT
      ?AUTO_164 - SATELLITE
      ?AUTO_166 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_165 ) ( ON_BOARD ?AUTO_165 ?AUTO_164 ) ( SUPPORTS ?AUTO_165 ?AUTO_163 ) ( POWER_ON ?AUTO_165 ) ( POINTING ?AUTO_164 ?AUTO_166 ) ( not ( = ?AUTO_162 ?AUTO_166 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_164 ?AUTO_162 ?AUTO_166 )
      ( GET_IMAGE ?AUTO_162 ?AUTO_163 )
      ( GET_IMAGE-VERIFY ?AUTO_162 ?AUTO_163 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_169 - DIRECTION
      ?AUTO_170 - MODE
    )
    :vars
    (
      ?AUTO_173 - INSTRUMENT
      ?AUTO_172 - SATELLITE
      ?AUTO_171 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_173 ?AUTO_172 ) ( SUPPORTS ?AUTO_173 ?AUTO_170 ) ( POWER_ON ?AUTO_173 ) ( POINTING ?AUTO_172 ?AUTO_171 ) ( not ( = ?AUTO_169 ?AUTO_171 ) ) ( CALIBRATION_TARGET ?AUTO_173 ?AUTO_171 ) ( NOT_CALIBRATED ?AUTO_173 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_172 ?AUTO_173 ?AUTO_171 )
      ( GET_IMAGE ?AUTO_169 ?AUTO_170 )
      ( GET_IMAGE-VERIFY ?AUTO_169 ?AUTO_170 ) )
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
      ?AUTO_181 - DIRECTION
      ?AUTO_182 - MODE
    )
    :vars
    (
      ?AUTO_183 - INSTRUMENT
      ?AUTO_184 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_183 ) ( ON_BOARD ?AUTO_183 ?AUTO_184 ) ( SUPPORTS ?AUTO_183 ?AUTO_182 ) ( POWER_ON ?AUTO_183 ) ( POINTING ?AUTO_184 ?AUTO_181 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_184 ?AUTO_181 ?AUTO_183 ?AUTO_182 )
      ( GET_IMAGE-VERIFY ?AUTO_181 ?AUTO_182 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_185 - DIRECTION
      ?AUTO_186 - MODE
    )
    :vars
    (
      ?AUTO_187 - INSTRUMENT
      ?AUTO_188 - SATELLITE
      ?AUTO_189 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_187 ) ( ON_BOARD ?AUTO_187 ?AUTO_188 ) ( SUPPORTS ?AUTO_187 ?AUTO_186 ) ( POWER_ON ?AUTO_187 ) ( POINTING ?AUTO_188 ?AUTO_189 ) ( not ( = ?AUTO_185 ?AUTO_189 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_188 ?AUTO_185 ?AUTO_189 )
      ( GET_IMAGE ?AUTO_185 ?AUTO_186 )
      ( GET_IMAGE-VERIFY ?AUTO_185 ?AUTO_186 ) )
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
    ( and ( ON_BOARD ?AUTO_193 ?AUTO_192 ) ( SUPPORTS ?AUTO_193 ?AUTO_191 ) ( POWER_ON ?AUTO_193 ) ( POINTING ?AUTO_192 ?AUTO_194 ) ( not ( = ?AUTO_190 ?AUTO_194 ) ) ( CALIBRATION_TARGET ?AUTO_193 ?AUTO_194 ) ( NOT_CALIBRATED ?AUTO_193 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_192 ?AUTO_193 ?AUTO_194 )
      ( GET_IMAGE ?AUTO_190 ?AUTO_191 )
      ( GET_IMAGE-VERIFY ?AUTO_190 ?AUTO_191 ) )
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
    ( and ( ON_BOARD ?AUTO_197 ?AUTO_198 ) ( SUPPORTS ?AUTO_197 ?AUTO_196 ) ( POINTING ?AUTO_198 ?AUTO_199 ) ( not ( = ?AUTO_195 ?AUTO_199 ) ) ( CALIBRATION_TARGET ?AUTO_197 ?AUTO_199 ) ( POWER_AVAIL ?AUTO_198 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_197 ?AUTO_198 )
      ( GET_IMAGE ?AUTO_195 ?AUTO_196 )
      ( GET_IMAGE-VERIFY ?AUTO_195 ?AUTO_196 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_200 - DIRECTION
      ?AUTO_201 - MODE
    )
    :vars
    (
      ?AUTO_202 - INSTRUMENT
      ?AUTO_203 - SATELLITE
      ?AUTO_204 - DIRECTION
      ?AUTO_205 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_202 ?AUTO_203 ) ( SUPPORTS ?AUTO_202 ?AUTO_201 ) ( not ( = ?AUTO_200 ?AUTO_204 ) ) ( CALIBRATION_TARGET ?AUTO_202 ?AUTO_204 ) ( POWER_AVAIL ?AUTO_203 ) ( POINTING ?AUTO_203 ?AUTO_205 ) ( not ( = ?AUTO_204 ?AUTO_205 ) ) ( not ( = ?AUTO_200 ?AUTO_205 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_203 ?AUTO_204 ?AUTO_205 )
      ( GET_IMAGE ?AUTO_200 ?AUTO_201 )
      ( GET_IMAGE-VERIFY ?AUTO_200 ?AUTO_201 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_208 - DIRECTION
      ?AUTO_209 - MODE
    )
    :vars
    (
      ?AUTO_210 - INSTRUMENT
      ?AUTO_211 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_210 ) ( ON_BOARD ?AUTO_210 ?AUTO_211 ) ( SUPPORTS ?AUTO_210 ?AUTO_209 ) ( POWER_ON ?AUTO_210 ) ( POINTING ?AUTO_211 ?AUTO_208 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_211 ?AUTO_208 ?AUTO_210 ?AUTO_209 )
      ( GET_IMAGE-VERIFY ?AUTO_208 ?AUTO_209 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_212 - DIRECTION
      ?AUTO_213 - MODE
    )
    :vars
    (
      ?AUTO_215 - INSTRUMENT
      ?AUTO_214 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_215 ?AUTO_214 ) ( SUPPORTS ?AUTO_215 ?AUTO_213 ) ( POWER_ON ?AUTO_215 ) ( POINTING ?AUTO_214 ?AUTO_212 ) ( CALIBRATION_TARGET ?AUTO_215 ?AUTO_212 ) ( NOT_CALIBRATED ?AUTO_215 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_214 ?AUTO_215 ?AUTO_212 )
      ( GET_IMAGE ?AUTO_212 ?AUTO_213 )
      ( GET_IMAGE-VERIFY ?AUTO_212 ?AUTO_213 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_216 - DIRECTION
      ?AUTO_217 - MODE
    )
    :vars
    (
      ?AUTO_218 - INSTRUMENT
      ?AUTO_219 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_218 ?AUTO_219 ) ( SUPPORTS ?AUTO_218 ?AUTO_217 ) ( POINTING ?AUTO_219 ?AUTO_216 ) ( CALIBRATION_TARGET ?AUTO_218 ?AUTO_216 ) ( POWER_AVAIL ?AUTO_219 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_218 ?AUTO_219 )
      ( GET_IMAGE ?AUTO_216 ?AUTO_217 )
      ( GET_IMAGE-VERIFY ?AUTO_216 ?AUTO_217 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_222 - DIRECTION
      ?AUTO_223 - MODE
    )
    :vars
    (
      ?AUTO_224 - INSTRUMENT
      ?AUTO_225 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_224 ) ( ON_BOARD ?AUTO_224 ?AUTO_225 ) ( SUPPORTS ?AUTO_224 ?AUTO_223 ) ( POWER_ON ?AUTO_224 ) ( POINTING ?AUTO_225 ?AUTO_222 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_225 ?AUTO_222 ?AUTO_224 ?AUTO_223 )
      ( GET_IMAGE-VERIFY ?AUTO_222 ?AUTO_223 ) )
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
      ?AUTO_230 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_228 ) ( ON_BOARD ?AUTO_228 ?AUTO_229 ) ( SUPPORTS ?AUTO_228 ?AUTO_227 ) ( POWER_ON ?AUTO_228 ) ( POINTING ?AUTO_229 ?AUTO_230 ) ( not ( = ?AUTO_226 ?AUTO_230 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_229 ?AUTO_226 ?AUTO_230 )
      ( GET_IMAGE ?AUTO_226 ?AUTO_227 )
      ( GET_IMAGE-VERIFY ?AUTO_226 ?AUTO_227 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_231 - DIRECTION
      ?AUTO_232 - MODE
    )
    :vars
    (
      ?AUTO_234 - INSTRUMENT
      ?AUTO_233 - SATELLITE
      ?AUTO_235 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_234 ?AUTO_233 ) ( SUPPORTS ?AUTO_234 ?AUTO_232 ) ( POWER_ON ?AUTO_234 ) ( POINTING ?AUTO_233 ?AUTO_235 ) ( not ( = ?AUTO_231 ?AUTO_235 ) ) ( CALIBRATION_TARGET ?AUTO_234 ?AUTO_235 ) ( NOT_CALIBRATED ?AUTO_234 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_233 ?AUTO_234 ?AUTO_235 )
      ( GET_IMAGE ?AUTO_231 ?AUTO_232 )
      ( GET_IMAGE-VERIFY ?AUTO_231 ?AUTO_232 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_236 - DIRECTION
      ?AUTO_237 - MODE
    )
    :vars
    (
      ?AUTO_238 - INSTRUMENT
      ?AUTO_239 - SATELLITE
      ?AUTO_240 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_238 ?AUTO_239 ) ( SUPPORTS ?AUTO_238 ?AUTO_237 ) ( POINTING ?AUTO_239 ?AUTO_240 ) ( not ( = ?AUTO_236 ?AUTO_240 ) ) ( CALIBRATION_TARGET ?AUTO_238 ?AUTO_240 ) ( POWER_AVAIL ?AUTO_239 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_238 ?AUTO_239 )
      ( GET_IMAGE ?AUTO_236 ?AUTO_237 )
      ( GET_IMAGE-VERIFY ?AUTO_236 ?AUTO_237 ) )
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
      ?AUTO_244 - SATELLITE
      ?AUTO_245 - DIRECTION
      ?AUTO_246 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_243 ?AUTO_244 ) ( SUPPORTS ?AUTO_243 ?AUTO_242 ) ( POINTING ?AUTO_244 ?AUTO_245 ) ( not ( = ?AUTO_241 ?AUTO_245 ) ) ( CALIBRATION_TARGET ?AUTO_243 ?AUTO_245 ) ( ON_BOARD ?AUTO_246 ?AUTO_244 ) ( POWER_ON ?AUTO_246 ) ( not ( = ?AUTO_243 ?AUTO_246 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_246 ?AUTO_244 )
      ( GET_IMAGE ?AUTO_241 ?AUTO_242 )
      ( GET_IMAGE-VERIFY ?AUTO_241 ?AUTO_242 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_255 - DIRECTION
      ?AUTO_256 - MODE
    )
    :vars
    (
      ?AUTO_257 - INSTRUMENT
      ?AUTO_258 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_257 ) ( ON_BOARD ?AUTO_257 ?AUTO_258 ) ( SUPPORTS ?AUTO_257 ?AUTO_256 ) ( POWER_ON ?AUTO_257 ) ( POINTING ?AUTO_258 ?AUTO_255 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_258 ?AUTO_255 ?AUTO_257 ?AUTO_256 )
      ( GET_IMAGE-VERIFY ?AUTO_255 ?AUTO_256 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_259 - DIRECTION
      ?AUTO_260 - MODE
    )
    :vars
    (
      ?AUTO_261 - INSTRUMENT
      ?AUTO_262 - SATELLITE
      ?AUTO_263 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_261 ) ( ON_BOARD ?AUTO_261 ?AUTO_262 ) ( SUPPORTS ?AUTO_261 ?AUTO_260 ) ( POWER_ON ?AUTO_261 ) ( POINTING ?AUTO_262 ?AUTO_263 ) ( not ( = ?AUTO_259 ?AUTO_263 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_262 ?AUTO_259 ?AUTO_263 )
      ( GET_IMAGE ?AUTO_259 ?AUTO_260 )
      ( GET_IMAGE-VERIFY ?AUTO_259 ?AUTO_260 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_282 - DIRECTION
      ?AUTO_283 - MODE
    )
    :vars
    (
      ?AUTO_284 - INSTRUMENT
      ?AUTO_285 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_284 ) ( ON_BOARD ?AUTO_284 ?AUTO_285 ) ( SUPPORTS ?AUTO_284 ?AUTO_283 ) ( POWER_ON ?AUTO_284 ) ( POINTING ?AUTO_285 ?AUTO_282 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_285 ?AUTO_282 ?AUTO_284 ?AUTO_283 )
      ( GET_IMAGE-VERIFY ?AUTO_282 ?AUTO_283 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_286 - DIRECTION
      ?AUTO_287 - MODE
    )
    :vars
    (
      ?AUTO_288 - INSTRUMENT
      ?AUTO_289 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_288 ?AUTO_289 ) ( SUPPORTS ?AUTO_288 ?AUTO_287 ) ( POWER_ON ?AUTO_288 ) ( POINTING ?AUTO_289 ?AUTO_286 ) ( CALIBRATION_TARGET ?AUTO_288 ?AUTO_286 ) ( NOT_CALIBRATED ?AUTO_288 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_289 ?AUTO_288 ?AUTO_286 )
      ( GET_IMAGE ?AUTO_286 ?AUTO_287 )
      ( GET_IMAGE-VERIFY ?AUTO_286 ?AUTO_287 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_290 - DIRECTION
      ?AUTO_291 - MODE
    )
    :vars
    (
      ?AUTO_293 - INSTRUMENT
      ?AUTO_292 - SATELLITE
      ?AUTO_294 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_293 ?AUTO_292 ) ( SUPPORTS ?AUTO_293 ?AUTO_291 ) ( POWER_ON ?AUTO_293 ) ( CALIBRATION_TARGET ?AUTO_293 ?AUTO_290 ) ( NOT_CALIBRATED ?AUTO_293 ) ( POINTING ?AUTO_292 ?AUTO_294 ) ( not ( = ?AUTO_290 ?AUTO_294 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_292 ?AUTO_290 ?AUTO_294 )
      ( GET_IMAGE ?AUTO_290 ?AUTO_291 )
      ( GET_IMAGE-VERIFY ?AUTO_290 ?AUTO_291 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_295 - DIRECTION
      ?AUTO_296 - MODE
    )
    :vars
    (
      ?AUTO_299 - INSTRUMENT
      ?AUTO_297 - SATELLITE
      ?AUTO_298 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_299 ?AUTO_297 ) ( SUPPORTS ?AUTO_299 ?AUTO_296 ) ( CALIBRATION_TARGET ?AUTO_299 ?AUTO_295 ) ( POINTING ?AUTO_297 ?AUTO_298 ) ( not ( = ?AUTO_295 ?AUTO_298 ) ) ( POWER_AVAIL ?AUTO_297 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_299 ?AUTO_297 )
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
      ?AUTO_314 - INSTRUMENT
      ?AUTO_315 - SATELLITE
      ?AUTO_316 - DIRECTION
      ?AUTO_317 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_314 ?AUTO_315 ) ( SUPPORTS ?AUTO_314 ?AUTO_313 ) ( CALIBRATION_TARGET ?AUTO_314 ?AUTO_312 ) ( not ( = ?AUTO_312 ?AUTO_316 ) ) ( ON_BOARD ?AUTO_317 ?AUTO_315 ) ( POWER_ON ?AUTO_317 ) ( not ( = ?AUTO_314 ?AUTO_317 ) ) ( POINTING ?AUTO_315 ?AUTO_312 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_315 ?AUTO_316 ?AUTO_312 )
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
      ?AUTO_325 - INSTRUMENT
      ?AUTO_322 - SATELLITE
      ?AUTO_324 - DIRECTION
      ?AUTO_323 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_325 ?AUTO_322 ) ( SUPPORTS ?AUTO_325 ?AUTO_321 ) ( CALIBRATION_TARGET ?AUTO_325 ?AUTO_320 ) ( not ( = ?AUTO_320 ?AUTO_324 ) ) ( ON_BOARD ?AUTO_323 ?AUTO_322 ) ( not ( = ?AUTO_325 ?AUTO_323 ) ) ( POINTING ?AUTO_322 ?AUTO_320 ) ( POWER_AVAIL ?AUTO_322 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_323 ?AUTO_322 )
      ( GET_IMAGE ?AUTO_320 ?AUTO_321 )
      ( GET_IMAGE-VERIFY ?AUTO_320 ?AUTO_321 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_336 - DIRECTION
      ?AUTO_337 - MODE
    )
    :vars
    (
      ?AUTO_338 - INSTRUMENT
      ?AUTO_339 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_338 ) ( ON_BOARD ?AUTO_338 ?AUTO_339 ) ( SUPPORTS ?AUTO_338 ?AUTO_337 ) ( POWER_ON ?AUTO_338 ) ( POINTING ?AUTO_339 ?AUTO_336 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_339 ?AUTO_336 ?AUTO_338 ?AUTO_337 )
      ( GET_IMAGE-VERIFY ?AUTO_336 ?AUTO_337 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_340 - DIRECTION
      ?AUTO_341 - MODE
    )
    :vars
    (
      ?AUTO_342 - INSTRUMENT
      ?AUTO_343 - SATELLITE
      ?AUTO_344 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_342 ) ( ON_BOARD ?AUTO_342 ?AUTO_343 ) ( SUPPORTS ?AUTO_342 ?AUTO_341 ) ( POWER_ON ?AUTO_342 ) ( POINTING ?AUTO_343 ?AUTO_344 ) ( not ( = ?AUTO_340 ?AUTO_344 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_343 ?AUTO_340 ?AUTO_344 )
      ( GET_IMAGE ?AUTO_340 ?AUTO_341 )
      ( GET_IMAGE-VERIFY ?AUTO_340 ?AUTO_341 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_347 - DIRECTION
      ?AUTO_348 - MODE
    )
    :vars
    (
      ?AUTO_351 - INSTRUMENT
      ?AUTO_350 - SATELLITE
      ?AUTO_349 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_351 ?AUTO_350 ) ( SUPPORTS ?AUTO_351 ?AUTO_348 ) ( POWER_ON ?AUTO_351 ) ( POINTING ?AUTO_350 ?AUTO_349 ) ( not ( = ?AUTO_347 ?AUTO_349 ) ) ( CALIBRATION_TARGET ?AUTO_351 ?AUTO_349 ) ( NOT_CALIBRATED ?AUTO_351 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_350 ?AUTO_351 ?AUTO_349 )
      ( GET_IMAGE ?AUTO_347 ?AUTO_348 )
      ( GET_IMAGE-VERIFY ?AUTO_347 ?AUTO_348 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_352 - DIRECTION
      ?AUTO_353 - MODE
    )
    :vars
    (
      ?AUTO_356 - INSTRUMENT
      ?AUTO_355 - SATELLITE
      ?AUTO_354 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_356 ?AUTO_355 ) ( SUPPORTS ?AUTO_356 ?AUTO_353 ) ( POWER_ON ?AUTO_356 ) ( not ( = ?AUTO_352 ?AUTO_354 ) ) ( CALIBRATION_TARGET ?AUTO_356 ?AUTO_354 ) ( NOT_CALIBRATED ?AUTO_356 ) ( POINTING ?AUTO_355 ?AUTO_352 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_355 ?AUTO_354 ?AUTO_352 )
      ( GET_IMAGE ?AUTO_352 ?AUTO_353 )
      ( GET_IMAGE-VERIFY ?AUTO_352 ?AUTO_353 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_357 - DIRECTION
      ?AUTO_358 - MODE
    )
    :vars
    (
      ?AUTO_361 - INSTRUMENT
      ?AUTO_359 - SATELLITE
      ?AUTO_360 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_361 ?AUTO_359 ) ( SUPPORTS ?AUTO_361 ?AUTO_358 ) ( not ( = ?AUTO_357 ?AUTO_360 ) ) ( CALIBRATION_TARGET ?AUTO_361 ?AUTO_360 ) ( POINTING ?AUTO_359 ?AUTO_357 ) ( POWER_AVAIL ?AUTO_359 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_361 ?AUTO_359 )
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
      ?AUTO_364 - INSTRUMENT
      ?AUTO_365 - SATELLITE
      ?AUTO_366 - DIRECTION
      ?AUTO_367 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_364 ?AUTO_365 ) ( SUPPORTS ?AUTO_364 ?AUTO_363 ) ( not ( = ?AUTO_362 ?AUTO_366 ) ) ( CALIBRATION_TARGET ?AUTO_364 ?AUTO_366 ) ( POINTING ?AUTO_365 ?AUTO_362 ) ( ON_BOARD ?AUTO_367 ?AUTO_365 ) ( POWER_ON ?AUTO_367 ) ( not ( = ?AUTO_364 ?AUTO_367 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_367 ?AUTO_365 )
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
      ?AUTO_374 - DIRECTION
      ?AUTO_373 - INSTRUMENT
      ?AUTO_376 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_375 ?AUTO_372 ) ( SUPPORTS ?AUTO_375 ?AUTO_371 ) ( not ( = ?AUTO_370 ?AUTO_374 ) ) ( CALIBRATION_TARGET ?AUTO_375 ?AUTO_374 ) ( ON_BOARD ?AUTO_373 ?AUTO_372 ) ( POWER_ON ?AUTO_373 ) ( not ( = ?AUTO_375 ?AUTO_373 ) ) ( POINTING ?AUTO_372 ?AUTO_376 ) ( not ( = ?AUTO_370 ?AUTO_376 ) ) ( not ( = ?AUTO_374 ?AUTO_376 ) ) )
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
      ?AUTO_381 - INSTRUMENT
      ?AUTO_384 - SATELLITE
      ?AUTO_385 - DIRECTION
      ?AUTO_383 - INSTRUMENT
      ?AUTO_382 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_381 ?AUTO_384 ) ( SUPPORTS ?AUTO_381 ?AUTO_380 ) ( not ( = ?AUTO_379 ?AUTO_385 ) ) ( CALIBRATION_TARGET ?AUTO_381 ?AUTO_385 ) ( ON_BOARD ?AUTO_383 ?AUTO_384 ) ( POWER_ON ?AUTO_383 ) ( not ( = ?AUTO_381 ?AUTO_383 ) ) ( not ( = ?AUTO_379 ?AUTO_382 ) ) ( not ( = ?AUTO_385 ?AUTO_382 ) ) ( POINTING ?AUTO_384 ?AUTO_385 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_384 ?AUTO_382 ?AUTO_385 )
      ( GET_IMAGE ?AUTO_379 ?AUTO_380 )
      ( GET_IMAGE-VERIFY ?AUTO_379 ?AUTO_380 ) )
  )

)

