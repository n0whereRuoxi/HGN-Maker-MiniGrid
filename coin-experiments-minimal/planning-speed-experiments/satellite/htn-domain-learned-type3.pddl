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
      ?AUTO_19 - DIRECTION
      ?AUTO_18 - MODE
    )
    :vars
    (
      ?AUTO_22 - INSTRUMENT
      ?AUTO_24 - SATELLITE
      ?AUTO_26 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_22 ?AUTO_24 ) ( SUPPORTS ?AUTO_22 ?AUTO_18 ) ( POWER_ON ?AUTO_22 ) ( CALIBRATION_TARGET ?AUTO_22 ?AUTO_19 ) ( NOT_CALIBRATED ?AUTO_22 ) ( POINTING ?AUTO_24 ?AUTO_26 ) ( not ( = ?AUTO_19 ?AUTO_26 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_24 ?AUTO_19 ?AUTO_26 )
      ( GET_IMAGE ?AUTO_19 ?AUTO_18 )
      ( GET_IMAGE-VERIFY ?AUTO_19 ?AUTO_18 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_28 - DIRECTION
      ?AUTO_29 - MODE
    )
    :vars
    (
      ?AUTO_33 - INSTRUMENT
      ?AUTO_34 - SATELLITE
      ?AUTO_32 - DIRECTION
      ?AUTO_36 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_33 ?AUTO_34 ) ( SUPPORTS ?AUTO_33 ?AUTO_29 ) ( CALIBRATION_TARGET ?AUTO_33 ?AUTO_28 ) ( POINTING ?AUTO_34 ?AUTO_32 ) ( not ( = ?AUTO_28 ?AUTO_32 ) ) ( ON_BOARD ?AUTO_33 ?AUTO_36 ) ( POWER_AVAIL ?AUTO_36 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_33 ?AUTO_36 )
      ( GET_IMAGE ?AUTO_28 ?AUTO_29 )
      ( GET_IMAGE-VERIFY ?AUTO_28 ?AUTO_29 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_39 - DIRECTION
      ?AUTO_40 - MODE
    )
    :vars
    (
      ?AUTO_41 - INSTRUMENT
      ?AUTO_42 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_41 ) ( ON_BOARD ?AUTO_41 ?AUTO_42 ) ( SUPPORTS ?AUTO_41 ?AUTO_40 ) ( POWER_ON ?AUTO_41 ) ( POINTING ?AUTO_42 ?AUTO_39 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_42 ?AUTO_39 ?AUTO_41 ?AUTO_40 )
      ( GET_IMAGE-VERIFY ?AUTO_39 ?AUTO_40 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_45 - DIRECTION
      ?AUTO_46 - MODE
    )
    :vars
    (
      ?AUTO_50 - INSTRUMENT
      ?AUTO_49 - SATELLITE
      ?AUTO_52 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_50 ) ( ON_BOARD ?AUTO_50 ?AUTO_49 ) ( SUPPORTS ?AUTO_50 ?AUTO_46 ) ( POWER_ON ?AUTO_50 ) ( POINTING ?AUTO_49 ?AUTO_52 ) ( not ( = ?AUTO_45 ?AUTO_52 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_49 ?AUTO_45 ?AUTO_52 )
      ( GET_IMAGE ?AUTO_45 ?AUTO_46 )
      ( GET_IMAGE-VERIFY ?AUTO_45 ?AUTO_46 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_56 - DIRECTION
      ?AUTO_57 - MODE
    )
    :vars
    (
      ?AUTO_59 - INSTRUMENT
      ?AUTO_60 - SATELLITE
      ?AUTO_58 - DIRECTION
      ?AUTO_64 - SATELLITE
      ?AUTO_65 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_59 ?AUTO_60 ) ( SUPPORTS ?AUTO_59 ?AUTO_57 ) ( POWER_ON ?AUTO_59 ) ( POINTING ?AUTO_60 ?AUTO_58 ) ( not ( = ?AUTO_56 ?AUTO_58 ) ) ( ON_BOARD ?AUTO_59 ?AUTO_64 ) ( CALIBRATION_TARGET ?AUTO_59 ?AUTO_65 ) ( POINTING ?AUTO_64 ?AUTO_65 ) ( NOT_CALIBRATED ?AUTO_59 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_64 ?AUTO_59 ?AUTO_65 )
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
      ?AUTO_72 - INSTRUMENT
      ?AUTO_73 - SATELLITE
      ?AUTO_74 - DIRECTION
      ?AUTO_76 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_72 ?AUTO_73 ) ( SUPPORTS ?AUTO_72 ?AUTO_67 ) ( POWER_ON ?AUTO_72 ) ( not ( = ?AUTO_66 ?AUTO_74 ) ) ( CALIBRATION_TARGET ?AUTO_72 ?AUTO_74 ) ( NOT_CALIBRATED ?AUTO_72 ) ( POINTING ?AUTO_73 ?AUTO_76 ) ( not ( = ?AUTO_74 ?AUTO_76 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_73 ?AUTO_74 ?AUTO_76 )
      ( GET_IMAGE ?AUTO_66 ?AUTO_67 )
      ( GET_IMAGE-VERIFY ?AUTO_66 ?AUTO_67 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_78 - DIRECTION
      ?AUTO_79 - MODE
    )
    :vars
    (
      ?AUTO_85 - INSTRUMENT
      ?AUTO_83 - SATELLITE
      ?AUTO_84 - DIRECTION
      ?AUTO_82 - DIRECTION
      ?AUTO_87 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_85 ?AUTO_83 ) ( SUPPORTS ?AUTO_85 ?AUTO_79 ) ( not ( = ?AUTO_78 ?AUTO_84 ) ) ( CALIBRATION_TARGET ?AUTO_85 ?AUTO_84 ) ( POINTING ?AUTO_83 ?AUTO_82 ) ( not ( = ?AUTO_84 ?AUTO_82 ) ) ( ON_BOARD ?AUTO_85 ?AUTO_87 ) ( POWER_AVAIL ?AUTO_87 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_85 ?AUTO_87 )
      ( GET_IMAGE ?AUTO_78 ?AUTO_79 )
      ( GET_IMAGE-VERIFY ?AUTO_78 ?AUTO_79 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_90 - DIRECTION
      ?AUTO_91 - MODE
    )
    :vars
    (
      ?AUTO_92 - INSTRUMENT
      ?AUTO_93 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_92 ) ( ON_BOARD ?AUTO_92 ?AUTO_93 ) ( SUPPORTS ?AUTO_92 ?AUTO_91 ) ( POWER_ON ?AUTO_92 ) ( POINTING ?AUTO_93 ?AUTO_90 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_93 ?AUTO_90 ?AUTO_92 ?AUTO_91 )
      ( GET_IMAGE-VERIFY ?AUTO_90 ?AUTO_91 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_96 - DIRECTION
      ?AUTO_97 - MODE
    )
    :vars
    (
      ?AUTO_100 - INSTRUMENT
      ?AUTO_101 - SATELLITE
      ?AUTO_103 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_100 ) ( ON_BOARD ?AUTO_100 ?AUTO_101 ) ( SUPPORTS ?AUTO_100 ?AUTO_97 ) ( POWER_ON ?AUTO_100 ) ( POINTING ?AUTO_101 ?AUTO_103 ) ( not ( = ?AUTO_96 ?AUTO_103 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_101 ?AUTO_96 ?AUTO_103 )
      ( GET_IMAGE ?AUTO_96 ?AUTO_97 )
      ( GET_IMAGE-VERIFY ?AUTO_96 ?AUTO_97 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_105 - DIRECTION
      ?AUTO_106 - MODE
    )
    :vars
    (
      ?AUTO_109 - INSTRUMENT
      ?AUTO_110 - SATELLITE
      ?AUTO_111 - DIRECTION
      ?AUTO_113 - SATELLITE
      ?AUTO_114 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_109 ?AUTO_110 ) ( SUPPORTS ?AUTO_109 ?AUTO_106 ) ( POWER_ON ?AUTO_109 ) ( POINTING ?AUTO_110 ?AUTO_111 ) ( not ( = ?AUTO_105 ?AUTO_111 ) ) ( ON_BOARD ?AUTO_109 ?AUTO_113 ) ( CALIBRATION_TARGET ?AUTO_109 ?AUTO_114 ) ( POINTING ?AUTO_113 ?AUTO_114 ) ( NOT_CALIBRATED ?AUTO_109 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_113 ?AUTO_109 ?AUTO_114 )
      ( GET_IMAGE ?AUTO_105 ?AUTO_106 )
      ( GET_IMAGE-VERIFY ?AUTO_105 ?AUTO_106 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_115 - DIRECTION
      ?AUTO_116 - MODE
    )
    :vars
    (
      ?AUTO_121 - INSTRUMENT
      ?AUTO_122 - SATELLITE
      ?AUTO_119 - DIRECTION
      ?AUTO_123 - SATELLITE
      ?AUTO_117 - DIRECTION
      ?AUTO_125 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_121 ?AUTO_122 ) ( SUPPORTS ?AUTO_121 ?AUTO_116 ) ( POINTING ?AUTO_122 ?AUTO_119 ) ( not ( = ?AUTO_115 ?AUTO_119 ) ) ( ON_BOARD ?AUTO_121 ?AUTO_123 ) ( CALIBRATION_TARGET ?AUTO_121 ?AUTO_117 ) ( POINTING ?AUTO_123 ?AUTO_117 ) ( ON_BOARD ?AUTO_121 ?AUTO_125 ) ( POWER_AVAIL ?AUTO_125 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_121 ?AUTO_125 )
      ( GET_IMAGE ?AUTO_115 ?AUTO_116 )
      ( GET_IMAGE-VERIFY ?AUTO_115 ?AUTO_116 ) )
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
      ?AUTO_134 - DIRECTION
      ?AUTO_135 - MODE
    )
    :vars
    (
      ?AUTO_139 - INSTRUMENT
      ?AUTO_136 - SATELLITE
      ?AUTO_141 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_139 ) ( ON_BOARD ?AUTO_139 ?AUTO_136 ) ( SUPPORTS ?AUTO_139 ?AUTO_135 ) ( POWER_ON ?AUTO_139 ) ( POINTING ?AUTO_136 ?AUTO_141 ) ( not ( = ?AUTO_134 ?AUTO_141 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_136 ?AUTO_134 ?AUTO_141 )
      ( GET_IMAGE ?AUTO_134 ?AUTO_135 )
      ( GET_IMAGE-VERIFY ?AUTO_134 ?AUTO_135 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_155 - DIRECTION
      ?AUTO_156 - MODE
    )
    :vars
    (
      ?AUTO_157 - INSTRUMENT
      ?AUTO_158 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_157 ) ( ON_BOARD ?AUTO_157 ?AUTO_158 ) ( SUPPORTS ?AUTO_157 ?AUTO_156 ) ( POWER_ON ?AUTO_157 ) ( POINTING ?AUTO_158 ?AUTO_155 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_158 ?AUTO_155 ?AUTO_157 ?AUTO_156 )
      ( GET_IMAGE-VERIFY ?AUTO_155 ?AUTO_156 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_161 - DIRECTION
      ?AUTO_162 - MODE
    )
    :vars
    (
      ?AUTO_165 - INSTRUMENT
      ?AUTO_166 - SATELLITE
      ?AUTO_168 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_165 ) ( ON_BOARD ?AUTO_165 ?AUTO_166 ) ( SUPPORTS ?AUTO_165 ?AUTO_162 ) ( POWER_ON ?AUTO_165 ) ( POINTING ?AUTO_166 ?AUTO_168 ) ( not ( = ?AUTO_161 ?AUTO_168 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_166 ?AUTO_161 ?AUTO_168 )
      ( GET_IMAGE ?AUTO_161 ?AUTO_162 )
      ( GET_IMAGE-VERIFY ?AUTO_161 ?AUTO_162 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_170 - DIRECTION
      ?AUTO_171 - MODE
    )
    :vars
    (
      ?AUTO_174 - INSTRUMENT
      ?AUTO_175 - SATELLITE
      ?AUTO_176 - DIRECTION
      ?AUTO_178 - SATELLITE
      ?AUTO_179 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_174 ?AUTO_175 ) ( SUPPORTS ?AUTO_174 ?AUTO_171 ) ( POWER_ON ?AUTO_174 ) ( POINTING ?AUTO_175 ?AUTO_176 ) ( not ( = ?AUTO_170 ?AUTO_176 ) ) ( ON_BOARD ?AUTO_174 ?AUTO_178 ) ( CALIBRATION_TARGET ?AUTO_174 ?AUTO_179 ) ( POINTING ?AUTO_178 ?AUTO_179 ) ( NOT_CALIBRATED ?AUTO_174 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_178 ?AUTO_174 ?AUTO_179 )
      ( GET_IMAGE ?AUTO_170 ?AUTO_171 )
      ( GET_IMAGE-VERIFY ?AUTO_170 ?AUTO_171 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_180 - DIRECTION
      ?AUTO_181 - MODE
    )
    :vars
    (
      ?AUTO_186 - INSTRUMENT
      ?AUTO_188 - SATELLITE
      ?AUTO_182 - DIRECTION
      ?AUTO_190 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_186 ?AUTO_188 ) ( SUPPORTS ?AUTO_186 ?AUTO_181 ) ( POWER_ON ?AUTO_186 ) ( not ( = ?AUTO_180 ?AUTO_182 ) ) ( CALIBRATION_TARGET ?AUTO_186 ?AUTO_182 ) ( NOT_CALIBRATED ?AUTO_186 ) ( POINTING ?AUTO_188 ?AUTO_190 ) ( not ( = ?AUTO_182 ?AUTO_190 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_188 ?AUTO_182 ?AUTO_190 )
      ( GET_IMAGE ?AUTO_180 ?AUTO_181 )
      ( GET_IMAGE-VERIFY ?AUTO_180 ?AUTO_181 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_192 - DIRECTION
      ?AUTO_193 - MODE
    )
    :vars
    (
      ?AUTO_199 - INSTRUMENT
      ?AUTO_195 - SATELLITE
      ?AUTO_198 - DIRECTION
      ?AUTO_194 - DIRECTION
      ?AUTO_201 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_199 ?AUTO_195 ) ( SUPPORTS ?AUTO_199 ?AUTO_193 ) ( not ( = ?AUTO_192 ?AUTO_198 ) ) ( CALIBRATION_TARGET ?AUTO_199 ?AUTO_198 ) ( POINTING ?AUTO_195 ?AUTO_194 ) ( not ( = ?AUTO_198 ?AUTO_194 ) ) ( ON_BOARD ?AUTO_199 ?AUTO_201 ) ( POWER_AVAIL ?AUTO_201 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_199 ?AUTO_201 )
      ( GET_IMAGE ?AUTO_192 ?AUTO_193 )
      ( GET_IMAGE-VERIFY ?AUTO_192 ?AUTO_193 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_202 - DIRECTION
      ?AUTO_203 - MODE
    )
    :vars
    (
      ?AUTO_209 - INSTRUMENT
      ?AUTO_207 - SATELLITE
      ?AUTO_204 - DIRECTION
      ?AUTO_205 - DIRECTION
      ?AUTO_208 - SATELLITE
      ?AUTO_211 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_209 ?AUTO_207 ) ( SUPPORTS ?AUTO_209 ?AUTO_203 ) ( not ( = ?AUTO_202 ?AUTO_204 ) ) ( CALIBRATION_TARGET ?AUTO_209 ?AUTO_204 ) ( POINTING ?AUTO_207 ?AUTO_205 ) ( not ( = ?AUTO_204 ?AUTO_205 ) ) ( ON_BOARD ?AUTO_209 ?AUTO_208 ) ( ON_BOARD ?AUTO_211 ?AUTO_208 ) ( POWER_ON ?AUTO_211 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_211 ?AUTO_208 )
      ( GET_IMAGE ?AUTO_202 ?AUTO_203 )
      ( GET_IMAGE-VERIFY ?AUTO_202 ?AUTO_203 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_215 - DIRECTION
      ?AUTO_216 - MODE
    )
    :vars
    (
      ?AUTO_218 - INSTRUMENT
      ?AUTO_222 - SATELLITE
      ?AUTO_217 - DIRECTION
      ?AUTO_219 - DIRECTION
      ?AUTO_221 - SATELLITE
      ?AUTO_224 - INSTRUMENT
      ?AUTO_226 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_218 ?AUTO_222 ) ( SUPPORTS ?AUTO_218 ?AUTO_216 ) ( not ( = ?AUTO_215 ?AUTO_217 ) ) ( CALIBRATION_TARGET ?AUTO_218 ?AUTO_217 ) ( not ( = ?AUTO_217 ?AUTO_219 ) ) ( ON_BOARD ?AUTO_218 ?AUTO_221 ) ( ON_BOARD ?AUTO_224 ?AUTO_221 ) ( POWER_ON ?AUTO_224 ) ( POINTING ?AUTO_222 ?AUTO_226 ) ( not ( = ?AUTO_219 ?AUTO_226 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_222 ?AUTO_219 ?AUTO_226 )
      ( GET_IMAGE ?AUTO_215 ?AUTO_216 )
      ( GET_IMAGE-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_229 - DIRECTION
      ?AUTO_230 - MODE
    )
    :vars
    (
      ?AUTO_231 - INSTRUMENT
      ?AUTO_232 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_231 ) ( ON_BOARD ?AUTO_231 ?AUTO_232 ) ( SUPPORTS ?AUTO_231 ?AUTO_230 ) ( POWER_ON ?AUTO_231 ) ( POINTING ?AUTO_232 ?AUTO_229 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_232 ?AUTO_229 ?AUTO_231 ?AUTO_230 )
      ( GET_IMAGE-VERIFY ?AUTO_229 ?AUTO_230 ) )
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
      ?AUTO_240 - SATELLITE
      ?AUTO_242 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_239 ) ( ON_BOARD ?AUTO_239 ?AUTO_240 ) ( SUPPORTS ?AUTO_239 ?AUTO_236 ) ( POWER_ON ?AUTO_239 ) ( POINTING ?AUTO_240 ?AUTO_242 ) ( not ( = ?AUTO_235 ?AUTO_242 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_240 ?AUTO_235 ?AUTO_242 )
      ( GET_IMAGE ?AUTO_235 ?AUTO_236 )
      ( GET_IMAGE-VERIFY ?AUTO_235 ?AUTO_236 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_244 - DIRECTION
      ?AUTO_245 - MODE
    )
    :vars
    (
      ?AUTO_248 - INSTRUMENT
      ?AUTO_249 - SATELLITE
      ?AUTO_250 - DIRECTION
      ?AUTO_252 - SATELLITE
      ?AUTO_253 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_248 ?AUTO_249 ) ( SUPPORTS ?AUTO_248 ?AUTO_245 ) ( POWER_ON ?AUTO_248 ) ( POINTING ?AUTO_249 ?AUTO_250 ) ( not ( = ?AUTO_244 ?AUTO_250 ) ) ( ON_BOARD ?AUTO_248 ?AUTO_252 ) ( CALIBRATION_TARGET ?AUTO_248 ?AUTO_253 ) ( POINTING ?AUTO_252 ?AUTO_253 ) ( NOT_CALIBRATED ?AUTO_248 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_252 ?AUTO_248 ?AUTO_253 )
      ( GET_IMAGE ?AUTO_244 ?AUTO_245 )
      ( GET_IMAGE-VERIFY ?AUTO_244 ?AUTO_245 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_254 - DIRECTION
      ?AUTO_255 - MODE
    )
    :vars
    (
      ?AUTO_262 - INSTRUMENT
      ?AUTO_261 - SATELLITE
      ?AUTO_260 - DIRECTION
      ?AUTO_258 - SATELLITE
      ?AUTO_259 - DIRECTION
      ?AUTO_264 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_262 ?AUTO_261 ) ( SUPPORTS ?AUTO_262 ?AUTO_255 ) ( POINTING ?AUTO_261 ?AUTO_260 ) ( not ( = ?AUTO_254 ?AUTO_260 ) ) ( ON_BOARD ?AUTO_262 ?AUTO_258 ) ( CALIBRATION_TARGET ?AUTO_262 ?AUTO_259 ) ( POINTING ?AUTO_258 ?AUTO_259 ) ( ON_BOARD ?AUTO_262 ?AUTO_264 ) ( POWER_AVAIL ?AUTO_264 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_262 ?AUTO_264 )
      ( GET_IMAGE ?AUTO_254 ?AUTO_255 )
      ( GET_IMAGE-VERIFY ?AUTO_254 ?AUTO_255 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_265 - DIRECTION
      ?AUTO_266 - MODE
    )
    :vars
    (
      ?AUTO_271 - INSTRUMENT
      ?AUTO_269 - SATELLITE
      ?AUTO_272 - DIRECTION
      ?AUTO_274 - SATELLITE
      ?AUTO_276 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_271 ?AUTO_269 ) ( SUPPORTS ?AUTO_271 ?AUTO_266 ) ( not ( = ?AUTO_265 ?AUTO_272 ) ) ( CALIBRATION_TARGET ?AUTO_271 ?AUTO_272 ) ( ON_BOARD ?AUTO_271 ?AUTO_274 ) ( POWER_AVAIL ?AUTO_274 ) ( POINTING ?AUTO_269 ?AUTO_276 ) ( not ( = ?AUTO_272 ?AUTO_276 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_269 ?AUTO_272 ?AUTO_276 )
      ( GET_IMAGE ?AUTO_265 ?AUTO_266 )
      ( GET_IMAGE-VERIFY ?AUTO_265 ?AUTO_266 ) )
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
      ?AUTO_288 - DIRECTION
      ?AUTO_289 - MODE
    )
    :vars
    (
      ?AUTO_292 - INSTRUMENT
      ?AUTO_293 - SATELLITE
      ?AUTO_295 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_292 ) ( ON_BOARD ?AUTO_292 ?AUTO_293 ) ( SUPPORTS ?AUTO_292 ?AUTO_289 ) ( POWER_ON ?AUTO_292 ) ( POINTING ?AUTO_293 ?AUTO_295 ) ( not ( = ?AUTO_288 ?AUTO_295 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_293 ?AUTO_288 ?AUTO_295 )
      ( GET_IMAGE ?AUTO_288 ?AUTO_289 )
      ( GET_IMAGE-VERIFY ?AUTO_288 ?AUTO_289 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_311 - DIRECTION
      ?AUTO_312 - MODE
    )
    :vars
    (
      ?AUTO_313 - INSTRUMENT
      ?AUTO_314 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_313 ) ( ON_BOARD ?AUTO_313 ?AUTO_314 ) ( SUPPORTS ?AUTO_313 ?AUTO_312 ) ( POWER_ON ?AUTO_313 ) ( POINTING ?AUTO_314 ?AUTO_311 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_314 ?AUTO_311 ?AUTO_313 ?AUTO_312 )
      ( GET_IMAGE-VERIFY ?AUTO_311 ?AUTO_312 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_317 - DIRECTION
      ?AUTO_318 - MODE
    )
    :vars
    (
      ?AUTO_321 - INSTRUMENT
      ?AUTO_322 - SATELLITE
      ?AUTO_324 - SATELLITE
      ?AUTO_325 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_321 ?AUTO_322 ) ( SUPPORTS ?AUTO_321 ?AUTO_318 ) ( POWER_ON ?AUTO_321 ) ( POINTING ?AUTO_322 ?AUTO_317 ) ( ON_BOARD ?AUTO_321 ?AUTO_324 ) ( CALIBRATION_TARGET ?AUTO_321 ?AUTO_325 ) ( POINTING ?AUTO_324 ?AUTO_325 ) ( NOT_CALIBRATED ?AUTO_321 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_324 ?AUTO_321 ?AUTO_325 )
      ( GET_IMAGE ?AUTO_317 ?AUTO_318 )
      ( GET_IMAGE-VERIFY ?AUTO_317 ?AUTO_318 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_333 - DIRECTION
      ?AUTO_327 - MODE
    )
    :vars
    (
      ?AUTO_331 - INSTRUMENT
      ?AUTO_332 - SATELLITE
      ?AUTO_335 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_331 ?AUTO_332 ) ( SUPPORTS ?AUTO_331 ?AUTO_327 ) ( POWER_ON ?AUTO_331 ) ( CALIBRATION_TARGET ?AUTO_331 ?AUTO_333 ) ( NOT_CALIBRATED ?AUTO_331 ) ( POINTING ?AUTO_332 ?AUTO_335 ) ( not ( = ?AUTO_333 ?AUTO_335 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_332 ?AUTO_333 ?AUTO_335 )
      ( GET_IMAGE ?AUTO_333 ?AUTO_327 )
      ( GET_IMAGE-VERIFY ?AUTO_333 ?AUTO_327 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_337 - DIRECTION
      ?AUTO_338 - MODE
    )
    :vars
    (
      ?AUTO_342 - INSTRUMENT
      ?AUTO_341 - SATELLITE
      ?AUTO_343 - DIRECTION
      ?AUTO_345 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_342 ?AUTO_341 ) ( SUPPORTS ?AUTO_342 ?AUTO_338 ) ( CALIBRATION_TARGET ?AUTO_342 ?AUTO_337 ) ( POINTING ?AUTO_341 ?AUTO_343 ) ( not ( = ?AUTO_337 ?AUTO_343 ) ) ( ON_BOARD ?AUTO_342 ?AUTO_345 ) ( POWER_AVAIL ?AUTO_345 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_342 ?AUTO_345 )
      ( GET_IMAGE ?AUTO_337 ?AUTO_338 )
      ( GET_IMAGE-VERIFY ?AUTO_337 ?AUTO_338 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_346 - DIRECTION
      ?AUTO_347 - MODE
    )
    :vars
    (
      ?AUTO_351 - INSTRUMENT
      ?AUTO_350 - SATELLITE
      ?AUTO_352 - DIRECTION
      ?AUTO_348 - SATELLITE
      ?AUTO_354 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_351 ?AUTO_350 ) ( SUPPORTS ?AUTO_351 ?AUTO_347 ) ( CALIBRATION_TARGET ?AUTO_351 ?AUTO_346 ) ( POINTING ?AUTO_350 ?AUTO_352 ) ( not ( = ?AUTO_346 ?AUTO_352 ) ) ( ON_BOARD ?AUTO_351 ?AUTO_348 ) ( ON_BOARD ?AUTO_354 ?AUTO_348 ) ( POWER_ON ?AUTO_354 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_354 ?AUTO_348 )
      ( GET_IMAGE ?AUTO_346 ?AUTO_347 )
      ( GET_IMAGE-VERIFY ?AUTO_346 ?AUTO_347 ) )
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
      ?AUTO_370 - DIRECTION
      ?AUTO_368 - SATELLITE
      ?AUTO_367 - INSTRUMENT
      ?AUTO_372 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_366 ?AUTO_364 ) ( SUPPORTS ?AUTO_366 ?AUTO_363 ) ( CALIBRATION_TARGET ?AUTO_366 ?AUTO_362 ) ( not ( = ?AUTO_362 ?AUTO_370 ) ) ( ON_BOARD ?AUTO_366 ?AUTO_368 ) ( ON_BOARD ?AUTO_367 ?AUTO_368 ) ( POWER_ON ?AUTO_367 ) ( POINTING ?AUTO_364 ?AUTO_372 ) ( not ( = ?AUTO_370 ?AUTO_372 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_364 ?AUTO_370 ?AUTO_372 )
      ( GET_IMAGE ?AUTO_362 ?AUTO_363 )
      ( GET_IMAGE-VERIFY ?AUTO_362 ?AUTO_363 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_384 - DIRECTION
      ?AUTO_385 - MODE
    )
    :vars
    (
      ?AUTO_390 - INSTRUMENT
      ?AUTO_388 - SATELLITE
      ?AUTO_389 - DIRECTION
      ?AUTO_391 - SATELLITE
      ?AUTO_392 - INSTRUMENT
      ?AUTO_393 - DIRECTION
      ?AUTO_395 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_390 ?AUTO_388 ) ( SUPPORTS ?AUTO_390 ?AUTO_385 ) ( CALIBRATION_TARGET ?AUTO_390 ?AUTO_384 ) ( not ( = ?AUTO_384 ?AUTO_389 ) ) ( ON_BOARD ?AUTO_390 ?AUTO_391 ) ( ON_BOARD ?AUTO_392 ?AUTO_391 ) ( POINTING ?AUTO_388 ?AUTO_393 ) ( not ( = ?AUTO_389 ?AUTO_393 ) ) ( ON_BOARD ?AUTO_392 ?AUTO_395 ) ( POWER_AVAIL ?AUTO_395 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_392 ?AUTO_395 )
      ( GET_IMAGE ?AUTO_384 ?AUTO_385 )
      ( GET_IMAGE-VERIFY ?AUTO_384 ?AUTO_385 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_402 - DIRECTION
      ?AUTO_403 - MODE
    )
    :vars
    (
      ?AUTO_404 - INSTRUMENT
      ?AUTO_405 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_404 ) ( ON_BOARD ?AUTO_404 ?AUTO_405 ) ( SUPPORTS ?AUTO_404 ?AUTO_403 ) ( POWER_ON ?AUTO_404 ) ( POINTING ?AUTO_405 ?AUTO_402 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_405 ?AUTO_402 ?AUTO_404 ?AUTO_403 )
      ( GET_IMAGE-VERIFY ?AUTO_402 ?AUTO_403 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_408 - DIRECTION
      ?AUTO_409 - MODE
    )
    :vars
    (
      ?AUTO_412 - INSTRUMENT
      ?AUTO_413 - SATELLITE
      ?AUTO_415 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_412 ) ( ON_BOARD ?AUTO_412 ?AUTO_413 ) ( SUPPORTS ?AUTO_412 ?AUTO_409 ) ( POWER_ON ?AUTO_412 ) ( POINTING ?AUTO_413 ?AUTO_415 ) ( not ( = ?AUTO_408 ?AUTO_415 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_413 ?AUTO_408 ?AUTO_415 )
      ( GET_IMAGE ?AUTO_408 ?AUTO_409 )
      ( GET_IMAGE-VERIFY ?AUTO_408 ?AUTO_409 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_419 - DIRECTION
      ?AUTO_420 - MODE
    )
    :vars
    (
      ?AUTO_423 - INSTRUMENT
      ?AUTO_424 - SATELLITE
      ?AUTO_421 - DIRECTION
      ?AUTO_427 - SATELLITE
      ?AUTO_428 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_423 ?AUTO_424 ) ( SUPPORTS ?AUTO_423 ?AUTO_420 ) ( POWER_ON ?AUTO_423 ) ( POINTING ?AUTO_424 ?AUTO_421 ) ( not ( = ?AUTO_419 ?AUTO_421 ) ) ( ON_BOARD ?AUTO_423 ?AUTO_427 ) ( CALIBRATION_TARGET ?AUTO_423 ?AUTO_428 ) ( POINTING ?AUTO_427 ?AUTO_428 ) ( NOT_CALIBRATED ?AUTO_423 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_427 ?AUTO_423 ?AUTO_428 )
      ( GET_IMAGE ?AUTO_419 ?AUTO_420 )
      ( GET_IMAGE-VERIFY ?AUTO_419 ?AUTO_420 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_429 - DIRECTION
      ?AUTO_430 - MODE
    )
    :vars
    (
      ?AUTO_435 - INSTRUMENT
      ?AUTO_436 - SATELLITE
      ?AUTO_437 - DIRECTION
      ?AUTO_439 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_435 ?AUTO_436 ) ( SUPPORTS ?AUTO_435 ?AUTO_430 ) ( POWER_ON ?AUTO_435 ) ( not ( = ?AUTO_429 ?AUTO_437 ) ) ( CALIBRATION_TARGET ?AUTO_435 ?AUTO_437 ) ( NOT_CALIBRATED ?AUTO_435 ) ( POINTING ?AUTO_436 ?AUTO_439 ) ( not ( = ?AUTO_437 ?AUTO_439 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_436 ?AUTO_437 ?AUTO_439 )
      ( GET_IMAGE ?AUTO_429 ?AUTO_430 )
      ( GET_IMAGE-VERIFY ?AUTO_429 ?AUTO_430 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_441 - DIRECTION
      ?AUTO_442 - MODE
    )
    :vars
    (
      ?AUTO_448 - INSTRUMENT
      ?AUTO_446 - SATELLITE
      ?AUTO_447 - DIRECTION
      ?AUTO_444 - DIRECTION
      ?AUTO_450 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_448 ?AUTO_446 ) ( SUPPORTS ?AUTO_448 ?AUTO_442 ) ( not ( = ?AUTO_441 ?AUTO_447 ) ) ( CALIBRATION_TARGET ?AUTO_448 ?AUTO_447 ) ( POINTING ?AUTO_446 ?AUTO_444 ) ( not ( = ?AUTO_447 ?AUTO_444 ) ) ( ON_BOARD ?AUTO_448 ?AUTO_450 ) ( POWER_AVAIL ?AUTO_450 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_448 ?AUTO_450 )
      ( GET_IMAGE ?AUTO_441 ?AUTO_442 )
      ( GET_IMAGE-VERIFY ?AUTO_441 ?AUTO_442 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_451 - DIRECTION
      ?AUTO_452 - MODE
    )
    :vars
    (
      ?AUTO_456 - INSTRUMENT
      ?AUTO_459 - SATELLITE
      ?AUTO_454 - DIRECTION
      ?AUTO_453 - DIRECTION
      ?AUTO_457 - SATELLITE
      ?AUTO_460 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_456 ?AUTO_459 ) ( SUPPORTS ?AUTO_456 ?AUTO_452 ) ( not ( = ?AUTO_451 ?AUTO_454 ) ) ( CALIBRATION_TARGET ?AUTO_456 ?AUTO_454 ) ( POINTING ?AUTO_459 ?AUTO_453 ) ( not ( = ?AUTO_454 ?AUTO_453 ) ) ( ON_BOARD ?AUTO_456 ?AUTO_457 ) ( ON_BOARD ?AUTO_460 ?AUTO_457 ) ( POWER_ON ?AUTO_460 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_460 ?AUTO_457 )
      ( GET_IMAGE ?AUTO_451 ?AUTO_452 )
      ( GET_IMAGE-VERIFY ?AUTO_451 ?AUTO_452 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_468 - DIRECTION
      ?AUTO_469 - MODE
    )
    :vars
    (
      ?AUTO_475 - INSTRUMENT
      ?AUTO_476 - SATELLITE
      ?AUTO_470 - DIRECTION
      ?AUTO_474 - DIRECTION
      ?AUTO_473 - SATELLITE
      ?AUTO_472 - INSTRUMENT
      ?AUTO_479 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_475 ?AUTO_476 ) ( SUPPORTS ?AUTO_475 ?AUTO_469 ) ( not ( = ?AUTO_468 ?AUTO_470 ) ) ( CALIBRATION_TARGET ?AUTO_475 ?AUTO_470 ) ( not ( = ?AUTO_470 ?AUTO_474 ) ) ( ON_BOARD ?AUTO_475 ?AUTO_473 ) ( ON_BOARD ?AUTO_472 ?AUTO_473 ) ( POWER_ON ?AUTO_472 ) ( POINTING ?AUTO_476 ?AUTO_479 ) ( not ( = ?AUTO_474 ?AUTO_479 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_476 ?AUTO_474 ?AUTO_479 )
      ( GET_IMAGE ?AUTO_468 ?AUTO_469 )
      ( GET_IMAGE-VERIFY ?AUTO_468 ?AUTO_469 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_500 - DIRECTION
      ?AUTO_501 - MODE
    )
    :vars
    (
      ?AUTO_502 - INSTRUMENT
      ?AUTO_503 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_502 ) ( ON_BOARD ?AUTO_502 ?AUTO_503 ) ( SUPPORTS ?AUTO_502 ?AUTO_501 ) ( POWER_ON ?AUTO_502 ) ( POINTING ?AUTO_503 ?AUTO_500 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_503 ?AUTO_500 ?AUTO_502 ?AUTO_501 )
      ( GET_IMAGE-VERIFY ?AUTO_500 ?AUTO_501 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_506 - DIRECTION
      ?AUTO_507 - MODE
    )
    :vars
    (
      ?AUTO_510 - INSTRUMENT
      ?AUTO_511 - SATELLITE
      ?AUTO_513 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_510 ) ( ON_BOARD ?AUTO_510 ?AUTO_511 ) ( SUPPORTS ?AUTO_510 ?AUTO_507 ) ( POWER_ON ?AUTO_510 ) ( POINTING ?AUTO_511 ?AUTO_513 ) ( not ( = ?AUTO_506 ?AUTO_513 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_511 ?AUTO_506 ?AUTO_513 )
      ( GET_IMAGE ?AUTO_506 ?AUTO_507 )
      ( GET_IMAGE-VERIFY ?AUTO_506 ?AUTO_507 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_535 - DIRECTION
      ?AUTO_536 - MODE
    )
    :vars
    (
      ?AUTO_541 - INSTRUMENT
      ?AUTO_543 - SATELLITE
      ?AUTO_542 - DIRECTION
      ?AUTO_538 - DIRECTION
      ?AUTO_537 - SATELLITE
      ?AUTO_544 - INSTRUMENT
      ?AUTO_546 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_541 ?AUTO_543 ) ( SUPPORTS ?AUTO_541 ?AUTO_536 ) ( not ( = ?AUTO_535 ?AUTO_542 ) ) ( CALIBRATION_TARGET ?AUTO_541 ?AUTO_542 ) ( not ( = ?AUTO_542 ?AUTO_538 ) ) ( ON_BOARD ?AUTO_541 ?AUTO_537 ) ( ON_BOARD ?AUTO_544 ?AUTO_537 ) ( POWER_ON ?AUTO_544 ) ( POINTING ?AUTO_543 ?AUTO_546 ) ( not ( = ?AUTO_538 ?AUTO_546 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_543 ?AUTO_538 ?AUTO_546 )
      ( GET_IMAGE ?AUTO_535 ?AUTO_536 )
      ( GET_IMAGE-VERIFY ?AUTO_535 ?AUTO_536 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_549 - DIRECTION
      ?AUTO_550 - MODE
    )
    :vars
    (
      ?AUTO_551 - INSTRUMENT
      ?AUTO_552 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_551 ) ( ON_BOARD ?AUTO_551 ?AUTO_552 ) ( SUPPORTS ?AUTO_551 ?AUTO_550 ) ( POWER_ON ?AUTO_551 ) ( POINTING ?AUTO_552 ?AUTO_549 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_552 ?AUTO_549 ?AUTO_551 ?AUTO_550 )
      ( GET_IMAGE-VERIFY ?AUTO_549 ?AUTO_550 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_555 - DIRECTION
      ?AUTO_556 - MODE
    )
    :vars
    (
      ?AUTO_559 - INSTRUMENT
      ?AUTO_560 - SATELLITE
      ?AUTO_562 - SATELLITE
      ?AUTO_563 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_559 ?AUTO_560 ) ( SUPPORTS ?AUTO_559 ?AUTO_556 ) ( POWER_ON ?AUTO_559 ) ( POINTING ?AUTO_560 ?AUTO_555 ) ( ON_BOARD ?AUTO_559 ?AUTO_562 ) ( CALIBRATION_TARGET ?AUTO_559 ?AUTO_563 ) ( POINTING ?AUTO_562 ?AUTO_563 ) ( NOT_CALIBRATED ?AUTO_559 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_562 ?AUTO_559 ?AUTO_563 )
      ( GET_IMAGE ?AUTO_555 ?AUTO_556 )
      ( GET_IMAGE-VERIFY ?AUTO_555 ?AUTO_556 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_564 - DIRECTION
      ?AUTO_565 - MODE
    )
    :vars
    (
      ?AUTO_569 - INSTRUMENT
      ?AUTO_568 - SATELLITE
      ?AUTO_570 - SATELLITE
      ?AUTO_571 - DIRECTION
      ?AUTO_573 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_569 ?AUTO_568 ) ( SUPPORTS ?AUTO_569 ?AUTO_565 ) ( POINTING ?AUTO_568 ?AUTO_564 ) ( ON_BOARD ?AUTO_569 ?AUTO_570 ) ( CALIBRATION_TARGET ?AUTO_569 ?AUTO_571 ) ( POINTING ?AUTO_570 ?AUTO_571 ) ( ON_BOARD ?AUTO_569 ?AUTO_573 ) ( POWER_AVAIL ?AUTO_573 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_569 ?AUTO_573 )
      ( GET_IMAGE ?AUTO_564 ?AUTO_565 )
      ( GET_IMAGE-VERIFY ?AUTO_564 ?AUTO_565 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_576 - DIRECTION
      ?AUTO_577 - MODE
    )
    :vars
    (
      ?AUTO_578 - INSTRUMENT
      ?AUTO_579 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_578 ) ( ON_BOARD ?AUTO_578 ?AUTO_579 ) ( SUPPORTS ?AUTO_578 ?AUTO_577 ) ( POWER_ON ?AUTO_578 ) ( POINTING ?AUTO_579 ?AUTO_576 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_579 ?AUTO_576 ?AUTO_578 ?AUTO_577 )
      ( GET_IMAGE-VERIFY ?AUTO_576 ?AUTO_577 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_582 - DIRECTION
      ?AUTO_583 - MODE
    )
    :vars
    (
      ?AUTO_586 - INSTRUMENT
      ?AUTO_587 - SATELLITE
      ?AUTO_589 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_586 ) ( ON_BOARD ?AUTO_586 ?AUTO_587 ) ( SUPPORTS ?AUTO_586 ?AUTO_583 ) ( POWER_ON ?AUTO_586 ) ( POINTING ?AUTO_587 ?AUTO_589 ) ( not ( = ?AUTO_582 ?AUTO_589 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_587 ?AUTO_582 ?AUTO_589 )
      ( GET_IMAGE ?AUTO_582 ?AUTO_583 )
      ( GET_IMAGE-VERIFY ?AUTO_582 ?AUTO_583 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_591 - DIRECTION
      ?AUTO_592 - MODE
    )
    :vars
    (
      ?AUTO_595 - INSTRUMENT
      ?AUTO_596 - SATELLITE
      ?AUTO_597 - DIRECTION
      ?AUTO_599 - SATELLITE
      ?AUTO_600 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_595 ?AUTO_596 ) ( SUPPORTS ?AUTO_595 ?AUTO_592 ) ( POWER_ON ?AUTO_595 ) ( POINTING ?AUTO_596 ?AUTO_597 ) ( not ( = ?AUTO_591 ?AUTO_597 ) ) ( ON_BOARD ?AUTO_595 ?AUTO_599 ) ( CALIBRATION_TARGET ?AUTO_595 ?AUTO_600 ) ( POINTING ?AUTO_599 ?AUTO_600 ) ( NOT_CALIBRATED ?AUTO_595 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_599 ?AUTO_595 ?AUTO_600 )
      ( GET_IMAGE ?AUTO_591 ?AUTO_592 )
      ( GET_IMAGE-VERIFY ?AUTO_591 ?AUTO_592 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_601 - DIRECTION
      ?AUTO_602 - MODE
    )
    :vars
    (
      ?AUTO_606 - INSTRUMENT
      ?AUTO_607 - SATELLITE
      ?AUTO_604 - DIRECTION
      ?AUTO_608 - SATELLITE
      ?AUTO_609 - DIRECTION
      ?AUTO_611 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_606 ?AUTO_607 ) ( SUPPORTS ?AUTO_606 ?AUTO_602 ) ( POINTING ?AUTO_607 ?AUTO_604 ) ( not ( = ?AUTO_601 ?AUTO_604 ) ) ( ON_BOARD ?AUTO_606 ?AUTO_608 ) ( CALIBRATION_TARGET ?AUTO_606 ?AUTO_609 ) ( POINTING ?AUTO_608 ?AUTO_609 ) ( ON_BOARD ?AUTO_606 ?AUTO_611 ) ( POWER_AVAIL ?AUTO_611 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_606 ?AUTO_611 )
      ( GET_IMAGE ?AUTO_601 ?AUTO_602 )
      ( GET_IMAGE-VERIFY ?AUTO_601 ?AUTO_602 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_614 - DIRECTION
      ?AUTO_615 - MODE
    )
    :vars
    (
      ?AUTO_616 - INSTRUMENT
      ?AUTO_617 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_616 ) ( ON_BOARD ?AUTO_616 ?AUTO_617 ) ( SUPPORTS ?AUTO_616 ?AUTO_615 ) ( POWER_ON ?AUTO_616 ) ( POINTING ?AUTO_617 ?AUTO_614 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_617 ?AUTO_614 ?AUTO_616 ?AUTO_615 )
      ( GET_IMAGE-VERIFY ?AUTO_614 ?AUTO_615 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_620 - DIRECTION
      ?AUTO_621 - MODE
    )
    :vars
    (
      ?AUTO_624 - INSTRUMENT
      ?AUTO_625 - SATELLITE
      ?AUTO_627 - SATELLITE
      ?AUTO_628 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_624 ?AUTO_625 ) ( SUPPORTS ?AUTO_624 ?AUTO_621 ) ( POWER_ON ?AUTO_624 ) ( POINTING ?AUTO_625 ?AUTO_620 ) ( ON_BOARD ?AUTO_624 ?AUTO_627 ) ( CALIBRATION_TARGET ?AUTO_624 ?AUTO_628 ) ( POINTING ?AUTO_627 ?AUTO_628 ) ( NOT_CALIBRATED ?AUTO_624 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_627 ?AUTO_624 ?AUTO_628 )
      ( GET_IMAGE ?AUTO_620 ?AUTO_621 )
      ( GET_IMAGE-VERIFY ?AUTO_620 ?AUTO_621 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_636 - DIRECTION
      ?AUTO_630 - MODE
    )
    :vars
    (
      ?AUTO_634 - INSTRUMENT
      ?AUTO_635 - SATELLITE
      ?AUTO_638 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_634 ?AUTO_635 ) ( SUPPORTS ?AUTO_634 ?AUTO_630 ) ( POWER_ON ?AUTO_634 ) ( CALIBRATION_TARGET ?AUTO_634 ?AUTO_636 ) ( NOT_CALIBRATED ?AUTO_634 ) ( POINTING ?AUTO_635 ?AUTO_638 ) ( not ( = ?AUTO_636 ?AUTO_638 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_635 ?AUTO_636 ?AUTO_638 )
      ( GET_IMAGE ?AUTO_636 ?AUTO_630 )
      ( GET_IMAGE-VERIFY ?AUTO_636 ?AUTO_630 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_640 - DIRECTION
      ?AUTO_641 - MODE
    )
    :vars
    (
      ?AUTO_646 - INSTRUMENT
      ?AUTO_645 - SATELLITE
      ?AUTO_643 - DIRECTION
      ?AUTO_648 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_646 ?AUTO_645 ) ( SUPPORTS ?AUTO_646 ?AUTO_641 ) ( CALIBRATION_TARGET ?AUTO_646 ?AUTO_640 ) ( POINTING ?AUTO_645 ?AUTO_643 ) ( not ( = ?AUTO_640 ?AUTO_643 ) ) ( ON_BOARD ?AUTO_646 ?AUTO_648 ) ( POWER_AVAIL ?AUTO_648 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_646 ?AUTO_648 )
      ( GET_IMAGE ?AUTO_640 ?AUTO_641 )
      ( GET_IMAGE-VERIFY ?AUTO_640 ?AUTO_641 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_649 - DIRECTION
      ?AUTO_650 - MODE
    )
    :vars
    (
      ?AUTO_653 - INSTRUMENT
      ?AUTO_651 - SATELLITE
      ?AUTO_652 - DIRECTION
      ?AUTO_654 - SATELLITE
      ?AUTO_657 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_653 ?AUTO_651 ) ( SUPPORTS ?AUTO_653 ?AUTO_650 ) ( CALIBRATION_TARGET ?AUTO_653 ?AUTO_649 ) ( POINTING ?AUTO_651 ?AUTO_652 ) ( not ( = ?AUTO_649 ?AUTO_652 ) ) ( ON_BOARD ?AUTO_653 ?AUTO_654 ) ( ON_BOARD ?AUTO_657 ?AUTO_654 ) ( POWER_ON ?AUTO_657 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_657 ?AUTO_654 )
      ( GET_IMAGE ?AUTO_649 ?AUTO_650 )
      ( GET_IMAGE-VERIFY ?AUTO_649 ?AUTO_650 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_661 - DIRECTION
      ?AUTO_662 - MODE
    )
    :vars
    (
      ?AUTO_668 - INSTRUMENT
      ?AUTO_667 - SATELLITE
      ?AUTO_664 - DIRECTION
      ?AUTO_669 - SATELLITE
      ?AUTO_663 - INSTRUMENT
      ?AUTO_671 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_668 ?AUTO_667 ) ( SUPPORTS ?AUTO_668 ?AUTO_662 ) ( CALIBRATION_TARGET ?AUTO_668 ?AUTO_661 ) ( not ( = ?AUTO_661 ?AUTO_664 ) ) ( ON_BOARD ?AUTO_668 ?AUTO_669 ) ( ON_BOARD ?AUTO_663 ?AUTO_669 ) ( POWER_ON ?AUTO_663 ) ( POINTING ?AUTO_667 ?AUTO_671 ) ( not ( = ?AUTO_664 ?AUTO_671 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_667 ?AUTO_664 ?AUTO_671 )
      ( GET_IMAGE ?AUTO_661 ?AUTO_662 )
      ( GET_IMAGE-VERIFY ?AUTO_661 ?AUTO_662 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_683 - DIRECTION
      ?AUTO_684 - MODE
    )
    :vars
    (
      ?AUTO_688 - INSTRUMENT
      ?AUTO_691 - SATELLITE
      ?AUTO_687 - DIRECTION
      ?AUTO_689 - SATELLITE
      ?AUTO_690 - INSTRUMENT
      ?AUTO_692 - DIRECTION
      ?AUTO_694 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_688 ?AUTO_691 ) ( SUPPORTS ?AUTO_688 ?AUTO_684 ) ( CALIBRATION_TARGET ?AUTO_688 ?AUTO_683 ) ( not ( = ?AUTO_683 ?AUTO_687 ) ) ( ON_BOARD ?AUTO_688 ?AUTO_689 ) ( ON_BOARD ?AUTO_690 ?AUTO_689 ) ( POINTING ?AUTO_691 ?AUTO_692 ) ( not ( = ?AUTO_687 ?AUTO_692 ) ) ( ON_BOARD ?AUTO_690 ?AUTO_694 ) ( POWER_AVAIL ?AUTO_694 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_690 ?AUTO_694 )
      ( GET_IMAGE ?AUTO_683 ?AUTO_684 )
      ( GET_IMAGE-VERIFY ?AUTO_683 ?AUTO_684 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_697 - DIRECTION
      ?AUTO_698 - MODE
    )
    :vars
    (
      ?AUTO_699 - INSTRUMENT
      ?AUTO_700 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_699 ) ( ON_BOARD ?AUTO_699 ?AUTO_700 ) ( SUPPORTS ?AUTO_699 ?AUTO_698 ) ( POWER_ON ?AUTO_699 ) ( POINTING ?AUTO_700 ?AUTO_697 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_700 ?AUTO_697 ?AUTO_699 ?AUTO_698 )
      ( GET_IMAGE-VERIFY ?AUTO_697 ?AUTO_698 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_703 - DIRECTION
      ?AUTO_704 - MODE
    )
    :vars
    (
      ?AUTO_706 - INSTRUMENT
      ?AUTO_708 - SATELLITE
      ?AUTO_710 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_706 ) ( ON_BOARD ?AUTO_706 ?AUTO_708 ) ( SUPPORTS ?AUTO_706 ?AUTO_704 ) ( POWER_ON ?AUTO_706 ) ( POINTING ?AUTO_708 ?AUTO_710 ) ( not ( = ?AUTO_703 ?AUTO_710 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_708 ?AUTO_703 ?AUTO_710 )
      ( GET_IMAGE ?AUTO_703 ?AUTO_704 )
      ( GET_IMAGE-VERIFY ?AUTO_703 ?AUTO_704 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_714 - DIRECTION
      ?AUTO_715 - MODE
    )
    :vars
    (
      ?AUTO_717 - INSTRUMENT
      ?AUTO_719 - SATELLITE
      ?AUTO_716 - DIRECTION
      ?AUTO_722 - SATELLITE
      ?AUTO_723 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_717 ?AUTO_719 ) ( SUPPORTS ?AUTO_717 ?AUTO_715 ) ( POWER_ON ?AUTO_717 ) ( POINTING ?AUTO_719 ?AUTO_716 ) ( not ( = ?AUTO_714 ?AUTO_716 ) ) ( ON_BOARD ?AUTO_717 ?AUTO_722 ) ( CALIBRATION_TARGET ?AUTO_717 ?AUTO_723 ) ( POINTING ?AUTO_722 ?AUTO_723 ) ( NOT_CALIBRATED ?AUTO_717 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_722 ?AUTO_717 ?AUTO_723 )
      ( GET_IMAGE ?AUTO_714 ?AUTO_715 )
      ( GET_IMAGE-VERIFY ?AUTO_714 ?AUTO_715 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_724 - DIRECTION
      ?AUTO_725 - MODE
    )
    :vars
    (
      ?AUTO_730 - INSTRUMENT
      ?AUTO_731 - SATELLITE
      ?AUTO_732 - DIRECTION
      ?AUTO_734 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_730 ?AUTO_731 ) ( SUPPORTS ?AUTO_730 ?AUTO_725 ) ( POWER_ON ?AUTO_730 ) ( not ( = ?AUTO_724 ?AUTO_732 ) ) ( CALIBRATION_TARGET ?AUTO_730 ?AUTO_732 ) ( NOT_CALIBRATED ?AUTO_730 ) ( POINTING ?AUTO_731 ?AUTO_734 ) ( not ( = ?AUTO_732 ?AUTO_734 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_731 ?AUTO_732 ?AUTO_734 )
      ( GET_IMAGE ?AUTO_724 ?AUTO_725 )
      ( GET_IMAGE-VERIFY ?AUTO_724 ?AUTO_725 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_736 - DIRECTION
      ?AUTO_737 - MODE
    )
    :vars
    (
      ?AUTO_743 - INSTRUMENT
      ?AUTO_741 - SATELLITE
      ?AUTO_742 - DIRECTION
      ?AUTO_739 - DIRECTION
      ?AUTO_745 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_743 ?AUTO_741 ) ( SUPPORTS ?AUTO_743 ?AUTO_737 ) ( not ( = ?AUTO_736 ?AUTO_742 ) ) ( CALIBRATION_TARGET ?AUTO_743 ?AUTO_742 ) ( POINTING ?AUTO_741 ?AUTO_739 ) ( not ( = ?AUTO_742 ?AUTO_739 ) ) ( ON_BOARD ?AUTO_743 ?AUTO_745 ) ( POWER_AVAIL ?AUTO_745 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_743 ?AUTO_745 )
      ( GET_IMAGE ?AUTO_736 ?AUTO_737 )
      ( GET_IMAGE-VERIFY ?AUTO_736 ?AUTO_737 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_746 - DIRECTION
      ?AUTO_747 - MODE
    )
    :vars
    (
      ?AUTO_749 - INSTRUMENT
      ?AUTO_748 - SATELLITE
      ?AUTO_751 - DIRECTION
      ?AUTO_750 - DIRECTION
      ?AUTO_754 - SATELLITE
      ?AUTO_755 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_749 ?AUTO_748 ) ( SUPPORTS ?AUTO_749 ?AUTO_747 ) ( not ( = ?AUTO_746 ?AUTO_751 ) ) ( CALIBRATION_TARGET ?AUTO_749 ?AUTO_751 ) ( POINTING ?AUTO_748 ?AUTO_750 ) ( not ( = ?AUTO_751 ?AUTO_750 ) ) ( ON_BOARD ?AUTO_749 ?AUTO_754 ) ( ON_BOARD ?AUTO_755 ?AUTO_754 ) ( POWER_ON ?AUTO_755 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_755 ?AUTO_754 )
      ( GET_IMAGE ?AUTO_746 ?AUTO_747 )
      ( GET_IMAGE-VERIFY ?AUTO_746 ?AUTO_747 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_759 - DIRECTION
      ?AUTO_760 - MODE
    )
    :vars
    (
      ?AUTO_766 - INSTRUMENT
      ?AUTO_761 - SATELLITE
      ?AUTO_763 - DIRECTION
      ?AUTO_767 - DIRECTION
      ?AUTO_768 - SATELLITE
      ?AUTO_765 - INSTRUMENT
      ?AUTO_770 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_766 ?AUTO_761 ) ( SUPPORTS ?AUTO_766 ?AUTO_760 ) ( not ( = ?AUTO_759 ?AUTO_763 ) ) ( CALIBRATION_TARGET ?AUTO_766 ?AUTO_763 ) ( not ( = ?AUTO_763 ?AUTO_767 ) ) ( ON_BOARD ?AUTO_766 ?AUTO_768 ) ( ON_BOARD ?AUTO_765 ?AUTO_768 ) ( POWER_ON ?AUTO_765 ) ( POINTING ?AUTO_761 ?AUTO_770 ) ( not ( = ?AUTO_767 ?AUTO_770 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_761 ?AUTO_767 ?AUTO_770 )
      ( GET_IMAGE ?AUTO_759 ?AUTO_760 )
      ( GET_IMAGE-VERIFY ?AUTO_759 ?AUTO_760 ) )
  )

)

