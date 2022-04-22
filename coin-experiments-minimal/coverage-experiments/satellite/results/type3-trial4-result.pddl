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
      ?AUTO_37 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_32 ?AUTO_30 ) ( SUPPORTS ?AUTO_32 ?AUTO_28 ) ( CALIBRATION_TARGET ?AUTO_32 ?AUTO_34 ) ( ON_BOARD ?AUTO_32 ?AUTO_35 ) ( POWER_AVAIL ?AUTO_35 ) ( POINTING ?AUTO_30 ?AUTO_37 ) ( not ( = ?AUTO_34 ?AUTO_37 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_30 ?AUTO_34 ?AUTO_37 )
      ( GET_IMAGE ?AUTO_34 ?AUTO_28 )
      ( GET_IMAGE-VERIFY ?AUTO_34 ?AUTO_28 ) )
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
    ( and ( CALIBRATED ?AUTO_43 ) ( ON_BOARD ?AUTO_43 ?AUTO_44 ) ( SUPPORTS ?AUTO_43 ?AUTO_42 ) ( POWER_ON ?AUTO_43 ) ( POINTING ?AUTO_44 ?AUTO_41 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_44 ?AUTO_41 ?AUTO_43 ?AUTO_42 )
      ( GET_IMAGE-VERIFY ?AUTO_41 ?AUTO_42 ) )
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
      ?AUTO_54 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_51 ) ( ON_BOARD ?AUTO_51 ?AUTO_52 ) ( SUPPORTS ?AUTO_51 ?AUTO_48 ) ( POWER_ON ?AUTO_51 ) ( POINTING ?AUTO_52 ?AUTO_54 ) ( not ( = ?AUTO_47 ?AUTO_54 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_52 ?AUTO_47 ?AUTO_54 )
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
      ?AUTO_59 - SATELLITE
      ?AUTO_58 - DIRECTION
      ?AUTO_64 - SATELLITE
      ?AUTO_65 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_62 ?AUTO_59 ) ( SUPPORTS ?AUTO_62 ?AUTO_57 ) ( POWER_ON ?AUTO_62 ) ( POINTING ?AUTO_59 ?AUTO_58 ) ( not ( = ?AUTO_56 ?AUTO_58 ) ) ( ON_BOARD ?AUTO_62 ?AUTO_64 ) ( CALIBRATION_TARGET ?AUTO_62 ?AUTO_65 ) ( POINTING ?AUTO_64 ?AUTO_65 ) ( NOT_CALIBRATED ?AUTO_62 ) )
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
      ?AUTO_69 - INSTRUMENT
      ?AUTO_73 - SATELLITE
      ?AUTO_74 - DIRECTION
      ?AUTO_70 - SATELLITE
      ?AUTO_71 - DIRECTION
      ?AUTO_76 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_69 ?AUTO_73 ) ( SUPPORTS ?AUTO_69 ?AUTO_67 ) ( POINTING ?AUTO_73 ?AUTO_74 ) ( not ( = ?AUTO_66 ?AUTO_74 ) ) ( ON_BOARD ?AUTO_69 ?AUTO_70 ) ( CALIBRATION_TARGET ?AUTO_69 ?AUTO_71 ) ( POINTING ?AUTO_70 ?AUTO_71 ) ( ON_BOARD ?AUTO_69 ?AUTO_76 ) ( POWER_AVAIL ?AUTO_76 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_69 ?AUTO_76 )
      ( GET_IMAGE ?AUTO_66 ?AUTO_67 )
      ( GET_IMAGE-VERIFY ?AUTO_66 ?AUTO_67 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_80 - DIRECTION
      ?AUTO_79 - MODE
    )
    :vars
    (
      ?AUTO_81 - INSTRUMENT
      ?AUTO_82 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_81 ) ( ON_BOARD ?AUTO_81 ?AUTO_82 ) ( SUPPORTS ?AUTO_81 ?AUTO_79 ) ( POWER_ON ?AUTO_81 ) ( POINTING ?AUTO_82 ?AUTO_80 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_82 ?AUTO_80 ?AUTO_81 ?AUTO_79 )
      ( GET_IMAGE-VERIFY ?AUTO_80 ?AUTO_79 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_86 - DIRECTION
      ?AUTO_85 - MODE
    )
    :vars
    (
      ?AUTO_89 - INSTRUMENT
      ?AUTO_90 - SATELLITE
      ?AUTO_92 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_89 ) ( ON_BOARD ?AUTO_89 ?AUTO_90 ) ( SUPPORTS ?AUTO_89 ?AUTO_85 ) ( POWER_ON ?AUTO_89 ) ( POINTING ?AUTO_90 ?AUTO_92 ) ( not ( = ?AUTO_86 ?AUTO_92 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_90 ?AUTO_86 ?AUTO_92 )
      ( GET_IMAGE ?AUTO_86 ?AUTO_85 )
      ( GET_IMAGE-VERIFY ?AUTO_86 ?AUTO_85 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_95 - DIRECTION
      ?AUTO_94 - MODE
    )
    :vars
    (
      ?AUTO_98 - INSTRUMENT
      ?AUTO_99 - SATELLITE
      ?AUTO_100 - DIRECTION
      ?AUTO_102 - SATELLITE
      ?AUTO_103 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_98 ?AUTO_99 ) ( SUPPORTS ?AUTO_98 ?AUTO_94 ) ( POWER_ON ?AUTO_98 ) ( POINTING ?AUTO_99 ?AUTO_100 ) ( not ( = ?AUTO_95 ?AUTO_100 ) ) ( ON_BOARD ?AUTO_98 ?AUTO_102 ) ( CALIBRATION_TARGET ?AUTO_98 ?AUTO_103 ) ( POINTING ?AUTO_102 ?AUTO_103 ) ( NOT_CALIBRATED ?AUTO_98 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_102 ?AUTO_98 ?AUTO_103 )
      ( GET_IMAGE ?AUTO_95 ?AUTO_94 )
      ( GET_IMAGE-VERIFY ?AUTO_95 ?AUTO_94 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_105 - DIRECTION
      ?AUTO_104 - MODE
    )
    :vars
    (
      ?AUTO_111 - INSTRUMENT
      ?AUTO_108 - SATELLITE
      ?AUTO_109 - DIRECTION
      ?AUTO_114 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_111 ?AUTO_108 ) ( SUPPORTS ?AUTO_111 ?AUTO_104 ) ( POWER_ON ?AUTO_111 ) ( not ( = ?AUTO_105 ?AUTO_109 ) ) ( CALIBRATION_TARGET ?AUTO_111 ?AUTO_109 ) ( NOT_CALIBRATED ?AUTO_111 ) ( POINTING ?AUTO_108 ?AUTO_114 ) ( not ( = ?AUTO_109 ?AUTO_114 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_108 ?AUTO_109 ?AUTO_114 )
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
      ?AUTO_119 - INSTRUMENT
      ?AUTO_122 - SATELLITE
      ?AUTO_118 - DIRECTION
      ?AUTO_123 - DIRECTION
      ?AUTO_125 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_119 ?AUTO_122 ) ( SUPPORTS ?AUTO_119 ?AUTO_116 ) ( not ( = ?AUTO_117 ?AUTO_118 ) ) ( CALIBRATION_TARGET ?AUTO_119 ?AUTO_118 ) ( POINTING ?AUTO_122 ?AUTO_123 ) ( not ( = ?AUTO_118 ?AUTO_123 ) ) ( ON_BOARD ?AUTO_119 ?AUTO_125 ) ( POWER_AVAIL ?AUTO_125 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_119 ?AUTO_125 )
      ( GET_IMAGE ?AUTO_117 ?AUTO_116 )
      ( GET_IMAGE-VERIFY ?AUTO_117 ?AUTO_116 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_129 - DIRECTION
      ?AUTO_128 - MODE
    )
    :vars
    (
      ?AUTO_130 - INSTRUMENT
      ?AUTO_131 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_130 ) ( ON_BOARD ?AUTO_130 ?AUTO_131 ) ( SUPPORTS ?AUTO_130 ?AUTO_128 ) ( POWER_ON ?AUTO_130 ) ( POINTING ?AUTO_131 ?AUTO_129 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_131 ?AUTO_129 ?AUTO_130 ?AUTO_128 )
      ( GET_IMAGE-VERIFY ?AUTO_129 ?AUTO_128 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_135 - DIRECTION
      ?AUTO_134 - MODE
    )
    :vars
    (
      ?AUTO_136 - INSTRUMENT
      ?AUTO_137 - SATELLITE
      ?AUTO_141 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_136 ) ( ON_BOARD ?AUTO_136 ?AUTO_137 ) ( SUPPORTS ?AUTO_136 ?AUTO_134 ) ( POWER_ON ?AUTO_136 ) ( POINTING ?AUTO_137 ?AUTO_141 ) ( not ( = ?AUTO_135 ?AUTO_141 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_137 ?AUTO_135 ?AUTO_141 )
      ( GET_IMAGE ?AUTO_135 ?AUTO_134 )
      ( GET_IMAGE-VERIFY ?AUTO_135 ?AUTO_134 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_156 - DIRECTION
      ?AUTO_155 - MODE
    )
    :vars
    (
      ?AUTO_157 - INSTRUMENT
      ?AUTO_158 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_157 ) ( ON_BOARD ?AUTO_157 ?AUTO_158 ) ( SUPPORTS ?AUTO_157 ?AUTO_155 ) ( POWER_ON ?AUTO_157 ) ( POINTING ?AUTO_158 ?AUTO_156 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_158 ?AUTO_156 ?AUTO_157 ?AUTO_155 )
      ( GET_IMAGE-VERIFY ?AUTO_156 ?AUTO_155 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_162 - DIRECTION
      ?AUTO_161 - MODE
    )
    :vars
    (
      ?AUTO_165 - INSTRUMENT
      ?AUTO_166 - SATELLITE
      ?AUTO_168 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_165 ) ( ON_BOARD ?AUTO_165 ?AUTO_166 ) ( SUPPORTS ?AUTO_165 ?AUTO_161 ) ( POWER_ON ?AUTO_165 ) ( POINTING ?AUTO_166 ?AUTO_168 ) ( not ( = ?AUTO_162 ?AUTO_168 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_166 ?AUTO_162 ?AUTO_168 )
      ( GET_IMAGE ?AUTO_162 ?AUTO_161 )
      ( GET_IMAGE-VERIFY ?AUTO_162 ?AUTO_161 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_171 - DIRECTION
      ?AUTO_172 - MODE
    )
    :vars
    (
      ?AUTO_173 - INSTRUMENT
      ?AUTO_174 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_173 ) ( ON_BOARD ?AUTO_173 ?AUTO_174 ) ( SUPPORTS ?AUTO_173 ?AUTO_172 ) ( POWER_ON ?AUTO_173 ) ( POINTING ?AUTO_174 ?AUTO_171 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_174 ?AUTO_171 ?AUTO_173 ?AUTO_172 )
      ( GET_IMAGE-VERIFY ?AUTO_171 ?AUTO_172 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_177 - DIRECTION
      ?AUTO_178 - MODE
    )
    :vars
    (
      ?AUTO_181 - INSTRUMENT
      ?AUTO_182 - SATELLITE
      ?AUTO_184 - SATELLITE
      ?AUTO_185 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_181 ?AUTO_182 ) ( SUPPORTS ?AUTO_181 ?AUTO_178 ) ( POWER_ON ?AUTO_181 ) ( POINTING ?AUTO_182 ?AUTO_177 ) ( ON_BOARD ?AUTO_181 ?AUTO_184 ) ( CALIBRATION_TARGET ?AUTO_181 ?AUTO_185 ) ( POINTING ?AUTO_184 ?AUTO_185 ) ( NOT_CALIBRATED ?AUTO_181 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_184 ?AUTO_181 ?AUTO_185 )
      ( GET_IMAGE ?AUTO_177 ?AUTO_178 )
      ( GET_IMAGE-VERIFY ?AUTO_177 ?AUTO_178 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_186 - DIRECTION
      ?AUTO_187 - MODE
    )
    :vars
    (
      ?AUTO_191 - INSTRUMENT
      ?AUTO_190 - SATELLITE
      ?AUTO_192 - SATELLITE
      ?AUTO_193 - DIRECTION
      ?AUTO_195 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_191 ?AUTO_190 ) ( SUPPORTS ?AUTO_191 ?AUTO_187 ) ( POINTING ?AUTO_190 ?AUTO_186 ) ( ON_BOARD ?AUTO_191 ?AUTO_192 ) ( CALIBRATION_TARGET ?AUTO_191 ?AUTO_193 ) ( POINTING ?AUTO_192 ?AUTO_193 ) ( ON_BOARD ?AUTO_191 ?AUTO_195 ) ( POWER_AVAIL ?AUTO_195 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_191 ?AUTO_195 )
      ( GET_IMAGE ?AUTO_186 ?AUTO_187 )
      ( GET_IMAGE-VERIFY ?AUTO_186 ?AUTO_187 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_198 - DIRECTION
      ?AUTO_199 - MODE
    )
    :vars
    (
      ?AUTO_200 - INSTRUMENT
      ?AUTO_201 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_200 ) ( ON_BOARD ?AUTO_200 ?AUTO_201 ) ( SUPPORTS ?AUTO_200 ?AUTO_199 ) ( POWER_ON ?AUTO_200 ) ( POINTING ?AUTO_201 ?AUTO_198 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_201 ?AUTO_198 ?AUTO_200 ?AUTO_199 )
      ( GET_IMAGE-VERIFY ?AUTO_198 ?AUTO_199 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_204 - DIRECTION
      ?AUTO_205 - MODE
    )
    :vars
    (
      ?AUTO_206 - INSTRUMENT
      ?AUTO_209 - SATELLITE
      ?AUTO_211 - SATELLITE
      ?AUTO_212 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_206 ?AUTO_209 ) ( SUPPORTS ?AUTO_206 ?AUTO_205 ) ( POWER_ON ?AUTO_206 ) ( POINTING ?AUTO_209 ?AUTO_204 ) ( ON_BOARD ?AUTO_206 ?AUTO_211 ) ( CALIBRATION_TARGET ?AUTO_206 ?AUTO_212 ) ( POINTING ?AUTO_211 ?AUTO_212 ) ( NOT_CALIBRATED ?AUTO_206 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_211 ?AUTO_206 ?AUTO_212 )
      ( GET_IMAGE ?AUTO_204 ?AUTO_205 )
      ( GET_IMAGE-VERIFY ?AUTO_204 ?AUTO_205 ) )
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
      ?AUTO_219 - SATELLITE
      ?AUTO_220 - DIRECTION
      ?AUTO_222 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_217 ?AUTO_218 ) ( SUPPORTS ?AUTO_217 ?AUTO_214 ) ( POINTING ?AUTO_218 ?AUTO_213 ) ( ON_BOARD ?AUTO_217 ?AUTO_219 ) ( CALIBRATION_TARGET ?AUTO_217 ?AUTO_220 ) ( POINTING ?AUTO_219 ?AUTO_220 ) ( ON_BOARD ?AUTO_217 ?AUTO_222 ) ( POWER_AVAIL ?AUTO_222 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_217 ?AUTO_222 )
      ( GET_IMAGE ?AUTO_213 ?AUTO_214 )
      ( GET_IMAGE-VERIFY ?AUTO_213 ?AUTO_214 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_223 - DIRECTION
      ?AUTO_224 - MODE
    )
    :vars
    (
      ?AUTO_230 - INSTRUMENT
      ?AUTO_231 - SATELLITE
      ?AUTO_228 - SATELLITE
      ?AUTO_229 - DIRECTION
      ?AUTO_225 - SATELLITE
      ?AUTO_232 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_230 ?AUTO_231 ) ( SUPPORTS ?AUTO_230 ?AUTO_224 ) ( POINTING ?AUTO_231 ?AUTO_223 ) ( ON_BOARD ?AUTO_230 ?AUTO_228 ) ( CALIBRATION_TARGET ?AUTO_230 ?AUTO_229 ) ( POINTING ?AUTO_228 ?AUTO_229 ) ( ON_BOARD ?AUTO_230 ?AUTO_225 ) ( ON_BOARD ?AUTO_232 ?AUTO_225 ) ( POWER_ON ?AUTO_232 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_232 ?AUTO_225 )
      ( GET_IMAGE ?AUTO_223 ?AUTO_224 )
      ( GET_IMAGE-VERIFY ?AUTO_223 ?AUTO_224 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_235 - DIRECTION
      ?AUTO_236 - MODE
    )
    :vars
    (
      ?AUTO_237 - INSTRUMENT
      ?AUTO_238 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_237 ) ( ON_BOARD ?AUTO_237 ?AUTO_238 ) ( SUPPORTS ?AUTO_237 ?AUTO_236 ) ( POWER_ON ?AUTO_237 ) ( POINTING ?AUTO_238 ?AUTO_235 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_238 ?AUTO_235 ?AUTO_237 ?AUTO_236 )
      ( GET_IMAGE-VERIFY ?AUTO_235 ?AUTO_236 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_241 - DIRECTION
      ?AUTO_242 - MODE
    )
    :vars
    (
      ?AUTO_245 - INSTRUMENT
      ?AUTO_246 - SATELLITE
      ?AUTO_248 - SATELLITE
      ?AUTO_249 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_245 ?AUTO_246 ) ( SUPPORTS ?AUTO_245 ?AUTO_242 ) ( POWER_ON ?AUTO_245 ) ( POINTING ?AUTO_246 ?AUTO_241 ) ( ON_BOARD ?AUTO_245 ?AUTO_248 ) ( CALIBRATION_TARGET ?AUTO_245 ?AUTO_249 ) ( POINTING ?AUTO_248 ?AUTO_249 ) ( NOT_CALIBRATED ?AUTO_245 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_248 ?AUTO_245 ?AUTO_249 )
      ( GET_IMAGE ?AUTO_241 ?AUTO_242 )
      ( GET_IMAGE-VERIFY ?AUTO_241 ?AUTO_242 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_250 - DIRECTION
      ?AUTO_251 - MODE
    )
    :vars
    (
      ?AUTO_257 - INSTRUMENT
      ?AUTO_256 - SATELLITE
      ?AUTO_252 - SATELLITE
      ?AUTO_253 - DIRECTION
      ?AUTO_259 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_257 ?AUTO_256 ) ( SUPPORTS ?AUTO_257 ?AUTO_251 ) ( POINTING ?AUTO_256 ?AUTO_250 ) ( ON_BOARD ?AUTO_257 ?AUTO_252 ) ( CALIBRATION_TARGET ?AUTO_257 ?AUTO_253 ) ( POINTING ?AUTO_252 ?AUTO_253 ) ( ON_BOARD ?AUTO_257 ?AUTO_259 ) ( POWER_AVAIL ?AUTO_259 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_257 ?AUTO_259 )
      ( GET_IMAGE ?AUTO_250 ?AUTO_251 )
      ( GET_IMAGE-VERIFY ?AUTO_250 ?AUTO_251 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_265 - DIRECTION
      ?AUTO_261 - MODE
    )
    :vars
    (
      ?AUTO_264 - INSTRUMENT
      ?AUTO_263 - SATELLITE
      ?AUTO_262 - SATELLITE
      ?AUTO_270 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_264 ?AUTO_263 ) ( SUPPORTS ?AUTO_264 ?AUTO_261 ) ( CALIBRATION_TARGET ?AUTO_264 ?AUTO_265 ) ( ON_BOARD ?AUTO_264 ?AUTO_262 ) ( POWER_AVAIL ?AUTO_262 ) ( POINTING ?AUTO_263 ?AUTO_270 ) ( not ( = ?AUTO_265 ?AUTO_270 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_263 ?AUTO_265 ?AUTO_270 )
      ( GET_IMAGE ?AUTO_265 ?AUTO_261 )
      ( GET_IMAGE-VERIFY ?AUTO_265 ?AUTO_261 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_274 - DIRECTION
      ?AUTO_275 - MODE
    )
    :vars
    (
      ?AUTO_276 - INSTRUMENT
      ?AUTO_277 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_276 ) ( ON_BOARD ?AUTO_276 ?AUTO_277 ) ( SUPPORTS ?AUTO_276 ?AUTO_275 ) ( POWER_ON ?AUTO_276 ) ( POINTING ?AUTO_277 ?AUTO_274 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_277 ?AUTO_274 ?AUTO_276 ?AUTO_275 )
      ( GET_IMAGE-VERIFY ?AUTO_274 ?AUTO_275 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_280 - DIRECTION
      ?AUTO_281 - MODE
    )
    :vars
    (
      ?AUTO_282 - INSTRUMENT
      ?AUTO_283 - SATELLITE
      ?AUTO_287 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_282 ) ( ON_BOARD ?AUTO_282 ?AUTO_283 ) ( SUPPORTS ?AUTO_282 ?AUTO_281 ) ( POWER_ON ?AUTO_282 ) ( POINTING ?AUTO_283 ?AUTO_287 ) ( not ( = ?AUTO_280 ?AUTO_287 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_283 ?AUTO_280 ?AUTO_287 )
      ( GET_IMAGE ?AUTO_280 ?AUTO_281 )
      ( GET_IMAGE-VERIFY ?AUTO_280 ?AUTO_281 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_291 - DIRECTION
      ?AUTO_292 - MODE
    )
    :vars
    (
      ?AUTO_293 - INSTRUMENT
      ?AUTO_295 - SATELLITE
      ?AUTO_294 - DIRECTION
      ?AUTO_299 - SATELLITE
      ?AUTO_300 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_293 ?AUTO_295 ) ( SUPPORTS ?AUTO_293 ?AUTO_292 ) ( POWER_ON ?AUTO_293 ) ( POINTING ?AUTO_295 ?AUTO_294 ) ( not ( = ?AUTO_291 ?AUTO_294 ) ) ( ON_BOARD ?AUTO_293 ?AUTO_299 ) ( CALIBRATION_TARGET ?AUTO_293 ?AUTO_300 ) ( POINTING ?AUTO_299 ?AUTO_300 ) ( NOT_CALIBRATED ?AUTO_293 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_299 ?AUTO_293 ?AUTO_300 )
      ( GET_IMAGE ?AUTO_291 ?AUTO_292 )
      ( GET_IMAGE-VERIFY ?AUTO_291 ?AUTO_292 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_301 - DIRECTION
      ?AUTO_302 - MODE
    )
    :vars
    (
      ?AUTO_305 - INSTRUMENT
      ?AUTO_306 - SATELLITE
      ?AUTO_307 - DIRECTION
      ?AUTO_308 - SATELLITE
      ?AUTO_309 - DIRECTION
      ?AUTO_311 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_305 ?AUTO_306 ) ( SUPPORTS ?AUTO_305 ?AUTO_302 ) ( POINTING ?AUTO_306 ?AUTO_307 ) ( not ( = ?AUTO_301 ?AUTO_307 ) ) ( ON_BOARD ?AUTO_305 ?AUTO_308 ) ( CALIBRATION_TARGET ?AUTO_305 ?AUTO_309 ) ( POINTING ?AUTO_308 ?AUTO_309 ) ( ON_BOARD ?AUTO_305 ?AUTO_311 ) ( POWER_AVAIL ?AUTO_311 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_305 ?AUTO_311 )
      ( GET_IMAGE ?AUTO_301 ?AUTO_302 )
      ( GET_IMAGE-VERIFY ?AUTO_301 ?AUTO_302 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_312 - DIRECTION
      ?AUTO_313 - MODE
    )
    :vars
    (
      ?AUTO_320 - INSTRUMENT
      ?AUTO_316 - SATELLITE
      ?AUTO_317 - DIRECTION
      ?AUTO_321 - SATELLITE
      ?AUTO_323 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_320 ?AUTO_316 ) ( SUPPORTS ?AUTO_320 ?AUTO_313 ) ( not ( = ?AUTO_312 ?AUTO_317 ) ) ( CALIBRATION_TARGET ?AUTO_320 ?AUTO_317 ) ( ON_BOARD ?AUTO_320 ?AUTO_321 ) ( POWER_AVAIL ?AUTO_321 ) ( POINTING ?AUTO_316 ?AUTO_323 ) ( not ( = ?AUTO_317 ?AUTO_323 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_316 ?AUTO_317 ?AUTO_323 )
      ( GET_IMAGE ?AUTO_312 ?AUTO_313 )
      ( GET_IMAGE-VERIFY ?AUTO_312 ?AUTO_313 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_327 - DIRECTION
      ?AUTO_328 - MODE
    )
    :vars
    (
      ?AUTO_329 - INSTRUMENT
      ?AUTO_330 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_329 ) ( ON_BOARD ?AUTO_329 ?AUTO_330 ) ( SUPPORTS ?AUTO_329 ?AUTO_328 ) ( POWER_ON ?AUTO_329 ) ( POINTING ?AUTO_330 ?AUTO_327 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_330 ?AUTO_327 ?AUTO_329 ?AUTO_328 )
      ( GET_IMAGE-VERIFY ?AUTO_327 ?AUTO_328 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_333 - DIRECTION
      ?AUTO_334 - MODE
    )
    :vars
    (
      ?AUTO_336 - INSTRUMENT
      ?AUTO_335 - SATELLITE
      ?AUTO_340 - SATELLITE
      ?AUTO_341 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_336 ?AUTO_335 ) ( SUPPORTS ?AUTO_336 ?AUTO_334 ) ( POWER_ON ?AUTO_336 ) ( POINTING ?AUTO_335 ?AUTO_333 ) ( ON_BOARD ?AUTO_336 ?AUTO_340 ) ( CALIBRATION_TARGET ?AUTO_336 ?AUTO_341 ) ( POINTING ?AUTO_340 ?AUTO_341 ) ( NOT_CALIBRATED ?AUTO_336 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_340 ?AUTO_336 ?AUTO_341 )
      ( GET_IMAGE ?AUTO_333 ?AUTO_334 )
      ( GET_IMAGE-VERIFY ?AUTO_333 ?AUTO_334 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_349 - DIRECTION
      ?AUTO_343 - MODE
    )
    :vars
    (
      ?AUTO_346 - INSTRUMENT
      ?AUTO_348 - SATELLITE
      ?AUTO_351 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_346 ?AUTO_348 ) ( SUPPORTS ?AUTO_346 ?AUTO_343 ) ( POWER_ON ?AUTO_346 ) ( CALIBRATION_TARGET ?AUTO_346 ?AUTO_349 ) ( NOT_CALIBRATED ?AUTO_346 ) ( POINTING ?AUTO_348 ?AUTO_351 ) ( not ( = ?AUTO_349 ?AUTO_351 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_348 ?AUTO_349 ?AUTO_351 )
      ( GET_IMAGE ?AUTO_349 ?AUTO_343 )
      ( GET_IMAGE-VERIFY ?AUTO_349 ?AUTO_343 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_353 - DIRECTION
      ?AUTO_354 - MODE
    )
    :vars
    (
      ?AUTO_358 - INSTRUMENT
      ?AUTO_359 - SATELLITE
      ?AUTO_356 - DIRECTION
      ?AUTO_361 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_358 ?AUTO_359 ) ( SUPPORTS ?AUTO_358 ?AUTO_354 ) ( CALIBRATION_TARGET ?AUTO_358 ?AUTO_353 ) ( POINTING ?AUTO_359 ?AUTO_356 ) ( not ( = ?AUTO_353 ?AUTO_356 ) ) ( ON_BOARD ?AUTO_358 ?AUTO_361 ) ( POWER_AVAIL ?AUTO_361 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_358 ?AUTO_361 )
      ( GET_IMAGE ?AUTO_353 ?AUTO_354 )
      ( GET_IMAGE-VERIFY ?AUTO_353 ?AUTO_354 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_364 - DIRECTION
      ?AUTO_365 - MODE
    )
    :vars
    (
      ?AUTO_368 - INSTRUMENT
      ?AUTO_371 - SATELLITE
      ?AUTO_370 - DIRECTION
      ?AUTO_369 - SATELLITE
      ?AUTO_372 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_368 ?AUTO_371 ) ( SUPPORTS ?AUTO_368 ?AUTO_365 ) ( CALIBRATION_TARGET ?AUTO_368 ?AUTO_364 ) ( POINTING ?AUTO_371 ?AUTO_370 ) ( not ( = ?AUTO_364 ?AUTO_370 ) ) ( ON_BOARD ?AUTO_368 ?AUTO_369 ) ( ON_BOARD ?AUTO_372 ?AUTO_369 ) ( POWER_ON ?AUTO_372 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_372 ?AUTO_369 )
      ( GET_IMAGE ?AUTO_364 ?AUTO_365 )
      ( GET_IMAGE-VERIFY ?AUTO_364 ?AUTO_365 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_388 - DIRECTION
      ?AUTO_389 - MODE
    )
    :vars
    (
      ?AUTO_390 - INSTRUMENT
      ?AUTO_391 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_390 ) ( ON_BOARD ?AUTO_390 ?AUTO_391 ) ( SUPPORTS ?AUTO_390 ?AUTO_389 ) ( POWER_ON ?AUTO_390 ) ( POINTING ?AUTO_391 ?AUTO_388 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_391 ?AUTO_388 ?AUTO_390 ?AUTO_389 )
      ( GET_IMAGE-VERIFY ?AUTO_388 ?AUTO_389 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_394 - DIRECTION
      ?AUTO_395 - MODE
    )
    :vars
    (
      ?AUTO_398 - INSTRUMENT
      ?AUTO_399 - SATELLITE
      ?AUTO_401 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_398 ) ( ON_BOARD ?AUTO_398 ?AUTO_399 ) ( SUPPORTS ?AUTO_398 ?AUTO_395 ) ( POWER_ON ?AUTO_398 ) ( POINTING ?AUTO_399 ?AUTO_401 ) ( not ( = ?AUTO_394 ?AUTO_401 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_399 ?AUTO_394 ?AUTO_401 )
      ( GET_IMAGE ?AUTO_394 ?AUTO_395 )
      ( GET_IMAGE-VERIFY ?AUTO_394 ?AUTO_395 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_405 - DIRECTION
      ?AUTO_406 - MODE
    )
    :vars
    (
      ?AUTO_409 - INSTRUMENT
      ?AUTO_410 - SATELLITE
      ?AUTO_407 - DIRECTION
      ?AUTO_413 - SATELLITE
      ?AUTO_414 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_409 ?AUTO_410 ) ( SUPPORTS ?AUTO_409 ?AUTO_406 ) ( POWER_ON ?AUTO_409 ) ( POINTING ?AUTO_410 ?AUTO_407 ) ( not ( = ?AUTO_405 ?AUTO_407 ) ) ( ON_BOARD ?AUTO_409 ?AUTO_413 ) ( CALIBRATION_TARGET ?AUTO_409 ?AUTO_414 ) ( POINTING ?AUTO_413 ?AUTO_414 ) ( NOT_CALIBRATED ?AUTO_409 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_413 ?AUTO_409 ?AUTO_414 )
      ( GET_IMAGE ?AUTO_405 ?AUTO_406 )
      ( GET_IMAGE-VERIFY ?AUTO_405 ?AUTO_406 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_415 - DIRECTION
      ?AUTO_416 - MODE
    )
    :vars
    (
      ?AUTO_421 - INSTRUMENT
      ?AUTO_422 - SATELLITE
      ?AUTO_423 - DIRECTION
      ?AUTO_425 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_421 ?AUTO_422 ) ( SUPPORTS ?AUTO_421 ?AUTO_416 ) ( POWER_ON ?AUTO_421 ) ( not ( = ?AUTO_415 ?AUTO_423 ) ) ( CALIBRATION_TARGET ?AUTO_421 ?AUTO_423 ) ( NOT_CALIBRATED ?AUTO_421 ) ( POINTING ?AUTO_422 ?AUTO_425 ) ( not ( = ?AUTO_423 ?AUTO_425 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_422 ?AUTO_423 ?AUTO_425 )
      ( GET_IMAGE ?AUTO_415 ?AUTO_416 )
      ( GET_IMAGE-VERIFY ?AUTO_415 ?AUTO_416 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_427 - DIRECTION
      ?AUTO_428 - MODE
    )
    :vars
    (
      ?AUTO_432 - INSTRUMENT
      ?AUTO_430 - SATELLITE
      ?AUTO_434 - DIRECTION
      ?AUTO_429 - DIRECTION
      ?AUTO_436 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_432 ?AUTO_430 ) ( SUPPORTS ?AUTO_432 ?AUTO_428 ) ( not ( = ?AUTO_427 ?AUTO_434 ) ) ( CALIBRATION_TARGET ?AUTO_432 ?AUTO_434 ) ( POINTING ?AUTO_430 ?AUTO_429 ) ( not ( = ?AUTO_434 ?AUTO_429 ) ) ( ON_BOARD ?AUTO_432 ?AUTO_436 ) ( POWER_AVAIL ?AUTO_436 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_432 ?AUTO_436 )
      ( GET_IMAGE ?AUTO_427 ?AUTO_428 )
      ( GET_IMAGE-VERIFY ?AUTO_427 ?AUTO_428 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_439 - DIRECTION
      ?AUTO_440 - MODE
    )
    :vars
    (
      ?AUTO_444 - INSTRUMENT
      ?AUTO_445 - SATELLITE
      ?AUTO_446 - DIRECTION
      ?AUTO_442 - DIRECTION
      ?AUTO_443 - SATELLITE
      ?AUTO_448 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_444 ?AUTO_445 ) ( SUPPORTS ?AUTO_444 ?AUTO_440 ) ( not ( = ?AUTO_439 ?AUTO_446 ) ) ( CALIBRATION_TARGET ?AUTO_444 ?AUTO_446 ) ( POINTING ?AUTO_445 ?AUTO_442 ) ( not ( = ?AUTO_446 ?AUTO_442 ) ) ( ON_BOARD ?AUTO_444 ?AUTO_443 ) ( ON_BOARD ?AUTO_448 ?AUTO_443 ) ( POWER_ON ?AUTO_448 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_448 ?AUTO_443 )
      ( GET_IMAGE ?AUTO_439 ?AUTO_440 )
      ( GET_IMAGE-VERIFY ?AUTO_439 ?AUTO_440 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_451 - DIRECTION
      ?AUTO_452 - MODE
    )
    :vars
    (
      ?AUTO_453 - INSTRUMENT
      ?AUTO_454 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_453 ) ( ON_BOARD ?AUTO_453 ?AUTO_454 ) ( SUPPORTS ?AUTO_453 ?AUTO_452 ) ( POWER_ON ?AUTO_453 ) ( POINTING ?AUTO_454 ?AUTO_451 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_454 ?AUTO_451 ?AUTO_453 ?AUTO_452 )
      ( GET_IMAGE-VERIFY ?AUTO_451 ?AUTO_452 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_457 - DIRECTION
      ?AUTO_458 - MODE
    )
    :vars
    (
      ?AUTO_461 - INSTRUMENT
      ?AUTO_462 - SATELLITE
      ?AUTO_464 - SATELLITE
      ?AUTO_465 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_461 ?AUTO_462 ) ( SUPPORTS ?AUTO_461 ?AUTO_458 ) ( POWER_ON ?AUTO_461 ) ( POINTING ?AUTO_462 ?AUTO_457 ) ( ON_BOARD ?AUTO_461 ?AUTO_464 ) ( CALIBRATION_TARGET ?AUTO_461 ?AUTO_465 ) ( POINTING ?AUTO_464 ?AUTO_465 ) ( NOT_CALIBRATED ?AUTO_461 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_464 ?AUTO_461 ?AUTO_465 )
      ( GET_IMAGE ?AUTO_457 ?AUTO_458 )
      ( GET_IMAGE-VERIFY ?AUTO_457 ?AUTO_458 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_466 - DIRECTION
      ?AUTO_467 - MODE
    )
    :vars
    (
      ?AUTO_471 - INSTRUMENT
      ?AUTO_470 - SATELLITE
      ?AUTO_472 - SATELLITE
      ?AUTO_473 - DIRECTION
      ?AUTO_475 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_471 ?AUTO_470 ) ( SUPPORTS ?AUTO_471 ?AUTO_467 ) ( POINTING ?AUTO_470 ?AUTO_466 ) ( ON_BOARD ?AUTO_471 ?AUTO_472 ) ( CALIBRATION_TARGET ?AUTO_471 ?AUTO_473 ) ( POINTING ?AUTO_472 ?AUTO_473 ) ( ON_BOARD ?AUTO_471 ?AUTO_475 ) ( POWER_AVAIL ?AUTO_475 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_471 ?AUTO_475 )
      ( GET_IMAGE ?AUTO_466 ?AUTO_467 )
      ( GET_IMAGE-VERIFY ?AUTO_466 ?AUTO_467 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_478 - DIRECTION
      ?AUTO_479 - MODE
    )
    :vars
    (
      ?AUTO_480 - INSTRUMENT
      ?AUTO_481 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_480 ) ( ON_BOARD ?AUTO_480 ?AUTO_481 ) ( SUPPORTS ?AUTO_480 ?AUTO_479 ) ( POWER_ON ?AUTO_480 ) ( POINTING ?AUTO_481 ?AUTO_478 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_481 ?AUTO_478 ?AUTO_480 ?AUTO_479 )
      ( GET_IMAGE-VERIFY ?AUTO_478 ?AUTO_479 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_484 - DIRECTION
      ?AUTO_485 - MODE
    )
    :vars
    (
      ?AUTO_488 - INSTRUMENT
      ?AUTO_489 - SATELLITE
      ?AUTO_491 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_488 ) ( ON_BOARD ?AUTO_488 ?AUTO_489 ) ( SUPPORTS ?AUTO_488 ?AUTO_485 ) ( POWER_ON ?AUTO_488 ) ( POINTING ?AUTO_489 ?AUTO_491 ) ( not ( = ?AUTO_484 ?AUTO_491 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_489 ?AUTO_484 ?AUTO_491 )
      ( GET_IMAGE ?AUTO_484 ?AUTO_485 )
      ( GET_IMAGE-VERIFY ?AUTO_484 ?AUTO_485 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_493 - DIRECTION
      ?AUTO_494 - MODE
    )
    :vars
    (
      ?AUTO_497 - INSTRUMENT
      ?AUTO_498 - SATELLITE
      ?AUTO_499 - DIRECTION
      ?AUTO_501 - SATELLITE
      ?AUTO_502 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_497 ?AUTO_498 ) ( SUPPORTS ?AUTO_497 ?AUTO_494 ) ( POWER_ON ?AUTO_497 ) ( POINTING ?AUTO_498 ?AUTO_499 ) ( not ( = ?AUTO_493 ?AUTO_499 ) ) ( ON_BOARD ?AUTO_497 ?AUTO_501 ) ( CALIBRATION_TARGET ?AUTO_497 ?AUTO_502 ) ( POINTING ?AUTO_501 ?AUTO_502 ) ( NOT_CALIBRATED ?AUTO_497 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_501 ?AUTO_497 ?AUTO_502 )
      ( GET_IMAGE ?AUTO_493 ?AUTO_494 )
      ( GET_IMAGE-VERIFY ?AUTO_493 ?AUTO_494 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_503 - DIRECTION
      ?AUTO_504 - MODE
    )
    :vars
    (
      ?AUTO_508 - INSTRUMENT
      ?AUTO_509 - SATELLITE
      ?AUTO_506 - DIRECTION
      ?AUTO_510 - SATELLITE
      ?AUTO_511 - DIRECTION
      ?AUTO_513 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_508 ?AUTO_509 ) ( SUPPORTS ?AUTO_508 ?AUTO_504 ) ( POINTING ?AUTO_509 ?AUTO_506 ) ( not ( = ?AUTO_503 ?AUTO_506 ) ) ( ON_BOARD ?AUTO_508 ?AUTO_510 ) ( CALIBRATION_TARGET ?AUTO_508 ?AUTO_511 ) ( POINTING ?AUTO_510 ?AUTO_511 ) ( ON_BOARD ?AUTO_508 ?AUTO_513 ) ( POWER_AVAIL ?AUTO_513 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_508 ?AUTO_513 )
      ( GET_IMAGE ?AUTO_503 ?AUTO_504 )
      ( GET_IMAGE-VERIFY ?AUTO_503 ?AUTO_504 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_514 - DIRECTION
      ?AUTO_515 - MODE
    )
    :vars
    (
      ?AUTO_521 - INSTRUMENT
      ?AUTO_519 - SATELLITE
      ?AUTO_522 - DIRECTION
      ?AUTO_523 - SATELLITE
      ?AUTO_517 - DIRECTION
      ?AUTO_516 - SATELLITE
      ?AUTO_524 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_521 ?AUTO_519 ) ( SUPPORTS ?AUTO_521 ?AUTO_515 ) ( POINTING ?AUTO_519 ?AUTO_522 ) ( not ( = ?AUTO_514 ?AUTO_522 ) ) ( ON_BOARD ?AUTO_521 ?AUTO_523 ) ( CALIBRATION_TARGET ?AUTO_521 ?AUTO_517 ) ( POINTING ?AUTO_523 ?AUTO_517 ) ( ON_BOARD ?AUTO_521 ?AUTO_516 ) ( ON_BOARD ?AUTO_524 ?AUTO_516 ) ( POWER_ON ?AUTO_524 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_524 ?AUTO_516 )
      ( GET_IMAGE ?AUTO_514 ?AUTO_515 )
      ( GET_IMAGE-VERIFY ?AUTO_514 ?AUTO_515 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_534 - DIRECTION
      ?AUTO_535 - MODE
    )
    :vars
    (
      ?AUTO_536 - INSTRUMENT
      ?AUTO_537 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_536 ) ( ON_BOARD ?AUTO_536 ?AUTO_537 ) ( SUPPORTS ?AUTO_536 ?AUTO_535 ) ( POWER_ON ?AUTO_536 ) ( POINTING ?AUTO_537 ?AUTO_534 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_537 ?AUTO_534 ?AUTO_536 ?AUTO_535 )
      ( GET_IMAGE-VERIFY ?AUTO_534 ?AUTO_535 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_540 - DIRECTION
      ?AUTO_541 - MODE
    )
    :vars
    (
      ?AUTO_544 - INSTRUMENT
      ?AUTO_545 - SATELLITE
      ?AUTO_547 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_544 ) ( ON_BOARD ?AUTO_544 ?AUTO_545 ) ( SUPPORTS ?AUTO_544 ?AUTO_541 ) ( POWER_ON ?AUTO_544 ) ( POINTING ?AUTO_545 ?AUTO_547 ) ( not ( = ?AUTO_540 ?AUTO_547 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_545 ?AUTO_540 ?AUTO_547 )
      ( GET_IMAGE ?AUTO_540 ?AUTO_541 )
      ( GET_IMAGE-VERIFY ?AUTO_540 ?AUTO_541 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_567 - DIRECTION
      ?AUTO_568 - MODE
    )
    :vars
    (
      ?AUTO_569 - INSTRUMENT
      ?AUTO_570 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_569 ) ( ON_BOARD ?AUTO_569 ?AUTO_570 ) ( SUPPORTS ?AUTO_569 ?AUTO_568 ) ( POWER_ON ?AUTO_569 ) ( POINTING ?AUTO_570 ?AUTO_567 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_570 ?AUTO_567 ?AUTO_569 ?AUTO_568 )
      ( GET_IMAGE-VERIFY ?AUTO_567 ?AUTO_568 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_573 - DIRECTION
      ?AUTO_574 - MODE
    )
    :vars
    (
      ?AUTO_577 - INSTRUMENT
      ?AUTO_578 - SATELLITE
      ?AUTO_580 - SATELLITE
      ?AUTO_581 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_577 ?AUTO_578 ) ( SUPPORTS ?AUTO_577 ?AUTO_574 ) ( POWER_ON ?AUTO_577 ) ( POINTING ?AUTO_578 ?AUTO_573 ) ( ON_BOARD ?AUTO_577 ?AUTO_580 ) ( CALIBRATION_TARGET ?AUTO_577 ?AUTO_581 ) ( POINTING ?AUTO_580 ?AUTO_581 ) ( NOT_CALIBRATED ?AUTO_577 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_580 ?AUTO_577 ?AUTO_581 )
      ( GET_IMAGE ?AUTO_573 ?AUTO_574 )
      ( GET_IMAGE-VERIFY ?AUTO_573 ?AUTO_574 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_589 - DIRECTION
      ?AUTO_583 - MODE
    )
    :vars
    (
      ?AUTO_587 - INSTRUMENT
      ?AUTO_588 - SATELLITE
      ?AUTO_591 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_587 ?AUTO_588 ) ( SUPPORTS ?AUTO_587 ?AUTO_583 ) ( POWER_ON ?AUTO_587 ) ( CALIBRATION_TARGET ?AUTO_587 ?AUTO_589 ) ( NOT_CALIBRATED ?AUTO_587 ) ( POINTING ?AUTO_588 ?AUTO_591 ) ( not ( = ?AUTO_589 ?AUTO_591 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_588 ?AUTO_589 ?AUTO_591 )
      ( GET_IMAGE ?AUTO_589 ?AUTO_583 )
      ( GET_IMAGE-VERIFY ?AUTO_589 ?AUTO_583 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_593 - DIRECTION
      ?AUTO_594 - MODE
    )
    :vars
    (
      ?AUTO_599 - INSTRUMENT
      ?AUTO_598 - SATELLITE
      ?AUTO_596 - DIRECTION
      ?AUTO_601 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_599 ?AUTO_598 ) ( SUPPORTS ?AUTO_599 ?AUTO_594 ) ( CALIBRATION_TARGET ?AUTO_599 ?AUTO_593 ) ( POINTING ?AUTO_598 ?AUTO_596 ) ( not ( = ?AUTO_593 ?AUTO_596 ) ) ( ON_BOARD ?AUTO_599 ?AUTO_601 ) ( POWER_AVAIL ?AUTO_601 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_599 ?AUTO_601 )
      ( GET_IMAGE ?AUTO_593 ?AUTO_594 )
      ( GET_IMAGE-VERIFY ?AUTO_593 ?AUTO_594 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_602 - DIRECTION
      ?AUTO_603 - MODE
    )
    :vars
    (
      ?AUTO_606 - INSTRUMENT
      ?AUTO_604 - SATELLITE
      ?AUTO_605 - DIRECTION
      ?AUTO_607 - SATELLITE
      ?AUTO_610 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_606 ?AUTO_604 ) ( SUPPORTS ?AUTO_606 ?AUTO_603 ) ( CALIBRATION_TARGET ?AUTO_606 ?AUTO_602 ) ( POINTING ?AUTO_604 ?AUTO_605 ) ( not ( = ?AUTO_602 ?AUTO_605 ) ) ( ON_BOARD ?AUTO_606 ?AUTO_607 ) ( ON_BOARD ?AUTO_610 ?AUTO_607 ) ( POWER_ON ?AUTO_610 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_610 ?AUTO_607 )
      ( GET_IMAGE ?AUTO_602 ?AUTO_603 )
      ( GET_IMAGE-VERIFY ?AUTO_602 ?AUTO_603 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_618 - DIRECTION
      ?AUTO_619 - MODE
    )
    :vars
    (
      ?AUTO_623 - INSTRUMENT
      ?AUTO_622 - SATELLITE
      ?AUTO_625 - DIRECTION
      ?AUTO_626 - SATELLITE
      ?AUTO_624 - INSTRUMENT
      ?AUTO_628 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_623 ?AUTO_622 ) ( SUPPORTS ?AUTO_623 ?AUTO_619 ) ( CALIBRATION_TARGET ?AUTO_623 ?AUTO_618 ) ( not ( = ?AUTO_618 ?AUTO_625 ) ) ( ON_BOARD ?AUTO_623 ?AUTO_626 ) ( ON_BOARD ?AUTO_624 ?AUTO_626 ) ( POWER_ON ?AUTO_624 ) ( POINTING ?AUTO_622 ?AUTO_628 ) ( not ( = ?AUTO_625 ?AUTO_628 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_622 ?AUTO_625 ?AUTO_628 )
      ( GET_IMAGE ?AUTO_618 ?AUTO_619 )
      ( GET_IMAGE-VERIFY ?AUTO_618 ?AUTO_619 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_632 - DIRECTION
      ?AUTO_633 - MODE
    )
    :vars
    (
      ?AUTO_637 - INSTRUMENT
      ?AUTO_634 - SATELLITE
      ?AUTO_638 - DIRECTION
      ?AUTO_639 - SATELLITE
      ?AUTO_636 - INSTRUMENT
      ?AUTO_640 - DIRECTION
      ?AUTO_643 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_637 ?AUTO_634 ) ( SUPPORTS ?AUTO_637 ?AUTO_633 ) ( CALIBRATION_TARGET ?AUTO_637 ?AUTO_632 ) ( not ( = ?AUTO_632 ?AUTO_638 ) ) ( ON_BOARD ?AUTO_637 ?AUTO_639 ) ( ON_BOARD ?AUTO_636 ?AUTO_639 ) ( POINTING ?AUTO_634 ?AUTO_640 ) ( not ( = ?AUTO_638 ?AUTO_640 ) ) ( ON_BOARD ?AUTO_636 ?AUTO_643 ) ( POWER_AVAIL ?AUTO_643 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_636 ?AUTO_643 )
      ( GET_IMAGE ?AUTO_632 ?AUTO_633 )
      ( GET_IMAGE-VERIFY ?AUTO_632 ?AUTO_633 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_654 - DIRECTION
      ?AUTO_655 - MODE
    )
    :vars
    (
      ?AUTO_656 - INSTRUMENT
      ?AUTO_657 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_656 ) ( ON_BOARD ?AUTO_656 ?AUTO_657 ) ( SUPPORTS ?AUTO_656 ?AUTO_655 ) ( POWER_ON ?AUTO_656 ) ( POINTING ?AUTO_657 ?AUTO_654 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_657 ?AUTO_654 ?AUTO_656 ?AUTO_655 )
      ( GET_IMAGE-VERIFY ?AUTO_654 ?AUTO_655 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_660 - DIRECTION
      ?AUTO_661 - MODE
    )
    :vars
    (
      ?AUTO_664 - INSTRUMENT
      ?AUTO_665 - SATELLITE
      ?AUTO_667 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_664 ) ( ON_BOARD ?AUTO_664 ?AUTO_665 ) ( SUPPORTS ?AUTO_664 ?AUTO_661 ) ( POWER_ON ?AUTO_664 ) ( POINTING ?AUTO_665 ?AUTO_667 ) ( not ( = ?AUTO_660 ?AUTO_667 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_665 ?AUTO_660 ?AUTO_667 )
      ( GET_IMAGE ?AUTO_660 ?AUTO_661 )
      ( GET_IMAGE-VERIFY ?AUTO_660 ?AUTO_661 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_671 - DIRECTION
      ?AUTO_672 - MODE
    )
    :vars
    (
      ?AUTO_677 - INSTRUMENT
      ?AUTO_676 - SATELLITE
      ?AUTO_673 - DIRECTION
      ?AUTO_679 - SATELLITE
      ?AUTO_680 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_677 ?AUTO_676 ) ( SUPPORTS ?AUTO_677 ?AUTO_672 ) ( POWER_ON ?AUTO_677 ) ( POINTING ?AUTO_676 ?AUTO_673 ) ( not ( = ?AUTO_671 ?AUTO_673 ) ) ( ON_BOARD ?AUTO_677 ?AUTO_679 ) ( CALIBRATION_TARGET ?AUTO_677 ?AUTO_680 ) ( POINTING ?AUTO_679 ?AUTO_680 ) ( NOT_CALIBRATED ?AUTO_677 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_679 ?AUTO_677 ?AUTO_680 )
      ( GET_IMAGE ?AUTO_671 ?AUTO_672 )
      ( GET_IMAGE-VERIFY ?AUTO_671 ?AUTO_672 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_681 - DIRECTION
      ?AUTO_682 - MODE
    )
    :vars
    (
      ?AUTO_689 - INSTRUMENT
      ?AUTO_684 - SATELLITE
      ?AUTO_685 - DIRECTION
      ?AUTO_691 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_689 ?AUTO_684 ) ( SUPPORTS ?AUTO_689 ?AUTO_682 ) ( POWER_ON ?AUTO_689 ) ( not ( = ?AUTO_681 ?AUTO_685 ) ) ( CALIBRATION_TARGET ?AUTO_689 ?AUTO_685 ) ( NOT_CALIBRATED ?AUTO_689 ) ( POINTING ?AUTO_684 ?AUTO_691 ) ( not ( = ?AUTO_685 ?AUTO_691 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_684 ?AUTO_685 ?AUTO_691 )
      ( GET_IMAGE ?AUTO_681 ?AUTO_682 )
      ( GET_IMAGE-VERIFY ?AUTO_681 ?AUTO_682 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_693 - DIRECTION
      ?AUTO_694 - MODE
    )
    :vars
    (
      ?AUTO_700 - INSTRUMENT
      ?AUTO_697 - SATELLITE
      ?AUTO_699 - DIRECTION
      ?AUTO_696 - DIRECTION
      ?AUTO_702 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_700 ?AUTO_697 ) ( SUPPORTS ?AUTO_700 ?AUTO_694 ) ( not ( = ?AUTO_693 ?AUTO_699 ) ) ( CALIBRATION_TARGET ?AUTO_700 ?AUTO_699 ) ( POINTING ?AUTO_697 ?AUTO_696 ) ( not ( = ?AUTO_699 ?AUTO_696 ) ) ( ON_BOARD ?AUTO_700 ?AUTO_702 ) ( POWER_AVAIL ?AUTO_702 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_700 ?AUTO_702 )
      ( GET_IMAGE ?AUTO_693 ?AUTO_694 )
      ( GET_IMAGE-VERIFY ?AUTO_693 ?AUTO_694 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_703 - DIRECTION
      ?AUTO_704 - MODE
    )
    :vars
    (
      ?AUTO_709 - INSTRUMENT
      ?AUTO_706 - SATELLITE
      ?AUTO_707 - DIRECTION
      ?AUTO_705 - DIRECTION
      ?AUTO_710 - SATELLITE
      ?AUTO_712 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_709 ?AUTO_706 ) ( SUPPORTS ?AUTO_709 ?AUTO_704 ) ( not ( = ?AUTO_703 ?AUTO_707 ) ) ( CALIBRATION_TARGET ?AUTO_709 ?AUTO_707 ) ( POINTING ?AUTO_706 ?AUTO_705 ) ( not ( = ?AUTO_707 ?AUTO_705 ) ) ( ON_BOARD ?AUTO_709 ?AUTO_710 ) ( ON_BOARD ?AUTO_712 ?AUTO_710 ) ( POWER_ON ?AUTO_712 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_712 ?AUTO_710 )
      ( GET_IMAGE ?AUTO_703 ?AUTO_704 )
      ( GET_IMAGE-VERIFY ?AUTO_703 ?AUTO_704 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_720 - DIRECTION
      ?AUTO_721 - MODE
    )
    :vars
    (
      ?AUTO_727 - INSTRUMENT
      ?AUTO_725 - SATELLITE
      ?AUTO_724 - DIRECTION
      ?AUTO_726 - DIRECTION
      ?AUTO_729 - SATELLITE
      ?AUTO_722 - INSTRUMENT
      ?AUTO_731 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_727 ?AUTO_725 ) ( SUPPORTS ?AUTO_727 ?AUTO_721 ) ( not ( = ?AUTO_720 ?AUTO_724 ) ) ( CALIBRATION_TARGET ?AUTO_727 ?AUTO_724 ) ( not ( = ?AUTO_724 ?AUTO_726 ) ) ( ON_BOARD ?AUTO_727 ?AUTO_729 ) ( ON_BOARD ?AUTO_722 ?AUTO_729 ) ( POWER_ON ?AUTO_722 ) ( POINTING ?AUTO_725 ?AUTO_731 ) ( not ( = ?AUTO_726 ?AUTO_731 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_725 ?AUTO_726 ?AUTO_731 )
      ( GET_IMAGE ?AUTO_720 ?AUTO_721 )
      ( GET_IMAGE-VERIFY ?AUTO_720 ?AUTO_721 ) )
  )

)

