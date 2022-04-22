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
      ?AUTO_24 - DIRECTION
      ?AUTO_17 - MODE
    )
    :vars
    (
      ?AUTO_21 - INSTRUMENT
      ?AUTO_23 - SATELLITE
      ?AUTO_26 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_21 ?AUTO_23 ) ( SUPPORTS ?AUTO_21 ?AUTO_17 ) ( POWER_ON ?AUTO_21 ) ( CALIBRATION_TARGET ?AUTO_21 ?AUTO_24 ) ( NOT_CALIBRATED ?AUTO_21 ) ( POINTING ?AUTO_23 ?AUTO_26 ) ( not ( = ?AUTO_24 ?AUTO_26 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_23 ?AUTO_24 ?AUTO_26 )
      ( GET_IMAGE ?AUTO_24 ?AUTO_17 )
      ( GET_IMAGE-VERIFY ?AUTO_24 ?AUTO_17 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_29 - DIRECTION
      ?AUTO_28 - MODE
    )
    :vars
    (
      ?AUTO_34 - INSTRUMENT
      ?AUTO_31 - SATELLITE
      ?AUTO_33 - DIRECTION
      ?AUTO_36 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_34 ?AUTO_31 ) ( SUPPORTS ?AUTO_34 ?AUTO_28 ) ( CALIBRATION_TARGET ?AUTO_34 ?AUTO_29 ) ( POINTING ?AUTO_31 ?AUTO_33 ) ( not ( = ?AUTO_29 ?AUTO_33 ) ) ( ON_BOARD ?AUTO_34 ?AUTO_36 ) ( POWER_AVAIL ?AUTO_36 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_34 ?AUTO_36 )
      ( GET_IMAGE ?AUTO_29 ?AUTO_28 )
      ( GET_IMAGE-VERIFY ?AUTO_29 ?AUTO_28 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_40 - DIRECTION
      ?AUTO_39 - MODE
    )
    :vars
    (
      ?AUTO_41 - INSTRUMENT
      ?AUTO_42 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_41 ) ( ON_BOARD ?AUTO_41 ?AUTO_42 ) ( SUPPORTS ?AUTO_41 ?AUTO_39 ) ( POWER_ON ?AUTO_41 ) ( POINTING ?AUTO_42 ?AUTO_40 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_42 ?AUTO_40 ?AUTO_41 ?AUTO_39 )
      ( GET_IMAGE-VERIFY ?AUTO_40 ?AUTO_39 ) )
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
      ?AUTO_52 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_49 ) ( ON_BOARD ?AUTO_49 ?AUTO_50 ) ( SUPPORTS ?AUTO_49 ?AUTO_45 ) ( POWER_ON ?AUTO_49 ) ( POINTING ?AUTO_50 ?AUTO_52 ) ( not ( = ?AUTO_46 ?AUTO_52 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_50 ?AUTO_46 ?AUTO_52 )
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
      ?AUTO_60 - INSTRUMENT
      ?AUTO_61 - SATELLITE
      ?AUTO_58 - DIRECTION
      ?AUTO_64 - SATELLITE
      ?AUTO_65 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_60 ?AUTO_61 ) ( SUPPORTS ?AUTO_60 ?AUTO_56 ) ( POWER_ON ?AUTO_60 ) ( POINTING ?AUTO_61 ?AUTO_58 ) ( not ( = ?AUTO_57 ?AUTO_58 ) ) ( ON_BOARD ?AUTO_60 ?AUTO_64 ) ( CALIBRATION_TARGET ?AUTO_60 ?AUTO_65 ) ( POINTING ?AUTO_64 ?AUTO_65 ) ( NOT_CALIBRATED ?AUTO_60 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_64 ?AUTO_60 ?AUTO_65 )
      ( GET_IMAGE ?AUTO_57 ?AUTO_56 )
      ( GET_IMAGE-VERIFY ?AUTO_57 ?AUTO_56 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_67 - DIRECTION
      ?AUTO_66 - MODE
    )
    :vars
    (
      ?AUTO_68 - INSTRUMENT
      ?AUTO_73 - SATELLITE
      ?AUTO_74 - DIRECTION
      ?AUTO_76 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_68 ?AUTO_73 ) ( SUPPORTS ?AUTO_68 ?AUTO_66 ) ( POWER_ON ?AUTO_68 ) ( not ( = ?AUTO_67 ?AUTO_74 ) ) ( CALIBRATION_TARGET ?AUTO_68 ?AUTO_74 ) ( NOT_CALIBRATED ?AUTO_68 ) ( POINTING ?AUTO_73 ?AUTO_76 ) ( not ( = ?AUTO_74 ?AUTO_76 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_73 ?AUTO_74 ?AUTO_76 )
      ( GET_IMAGE ?AUTO_67 ?AUTO_66 )
      ( GET_IMAGE-VERIFY ?AUTO_67 ?AUTO_66 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_79 - DIRECTION
      ?AUTO_78 - MODE
    )
    :vars
    (
      ?AUTO_85 - INSTRUMENT
      ?AUTO_84 - SATELLITE
      ?AUTO_83 - DIRECTION
      ?AUTO_82 - DIRECTION
      ?AUTO_87 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_85 ?AUTO_84 ) ( SUPPORTS ?AUTO_85 ?AUTO_78 ) ( not ( = ?AUTO_79 ?AUTO_83 ) ) ( CALIBRATION_TARGET ?AUTO_85 ?AUTO_83 ) ( POINTING ?AUTO_84 ?AUTO_82 ) ( not ( = ?AUTO_83 ?AUTO_82 ) ) ( ON_BOARD ?AUTO_85 ?AUTO_87 ) ( POWER_AVAIL ?AUTO_87 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_85 ?AUTO_87 )
      ( GET_IMAGE ?AUTO_79 ?AUTO_78 )
      ( GET_IMAGE-VERIFY ?AUTO_79 ?AUTO_78 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_91 - DIRECTION
      ?AUTO_90 - MODE
    )
    :vars
    (
      ?AUTO_92 - INSTRUMENT
      ?AUTO_93 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_92 ) ( ON_BOARD ?AUTO_92 ?AUTO_93 ) ( SUPPORTS ?AUTO_92 ?AUTO_90 ) ( POWER_ON ?AUTO_92 ) ( POINTING ?AUTO_93 ?AUTO_91 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_93 ?AUTO_91 ?AUTO_92 ?AUTO_90 )
      ( GET_IMAGE-VERIFY ?AUTO_91 ?AUTO_90 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_97 - DIRECTION
      ?AUTO_96 - MODE
    )
    :vars
    (
      ?AUTO_98 - INSTRUMENT
      ?AUTO_101 - SATELLITE
      ?AUTO_103 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_98 ) ( ON_BOARD ?AUTO_98 ?AUTO_101 ) ( SUPPORTS ?AUTO_98 ?AUTO_96 ) ( POWER_ON ?AUTO_98 ) ( POINTING ?AUTO_101 ?AUTO_103 ) ( not ( = ?AUTO_97 ?AUTO_103 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_101 ?AUTO_97 ?AUTO_103 )
      ( GET_IMAGE ?AUTO_97 ?AUTO_96 )
      ( GET_IMAGE-VERIFY ?AUTO_97 ?AUTO_96 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_120 - DIRECTION
      ?AUTO_119 - MODE
    )
    :vars
    (
      ?AUTO_121 - INSTRUMENT
      ?AUTO_122 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_121 ) ( ON_BOARD ?AUTO_121 ?AUTO_122 ) ( SUPPORTS ?AUTO_121 ?AUTO_119 ) ( POWER_ON ?AUTO_121 ) ( POINTING ?AUTO_122 ?AUTO_120 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_122 ?AUTO_120 ?AUTO_121 ?AUTO_119 )
      ( GET_IMAGE-VERIFY ?AUTO_120 ?AUTO_119 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_126 - DIRECTION
      ?AUTO_125 - MODE
    )
    :vars
    (
      ?AUTO_130 - INSTRUMENT
      ?AUTO_127 - SATELLITE
      ?AUTO_132 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_130 ) ( ON_BOARD ?AUTO_130 ?AUTO_127 ) ( SUPPORTS ?AUTO_130 ?AUTO_125 ) ( POWER_ON ?AUTO_130 ) ( POINTING ?AUTO_127 ?AUTO_132 ) ( not ( = ?AUTO_126 ?AUTO_132 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_127 ?AUTO_126 ?AUTO_132 )
      ( GET_IMAGE ?AUTO_126 ?AUTO_125 )
      ( GET_IMAGE-VERIFY ?AUTO_126 ?AUTO_125 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_135 - DIRECTION
      ?AUTO_136 - MODE
    )
    :vars
    (
      ?AUTO_137 - INSTRUMENT
      ?AUTO_138 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_137 ) ( ON_BOARD ?AUTO_137 ?AUTO_138 ) ( SUPPORTS ?AUTO_137 ?AUTO_136 ) ( POWER_ON ?AUTO_137 ) ( POINTING ?AUTO_138 ?AUTO_135 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_138 ?AUTO_135 ?AUTO_137 ?AUTO_136 )
      ( GET_IMAGE-VERIFY ?AUTO_135 ?AUTO_136 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_141 - DIRECTION
      ?AUTO_142 - MODE
    )
    :vars
    (
      ?AUTO_144 - INSTRUMENT
      ?AUTO_143 - SATELLITE
      ?AUTO_148 - SATELLITE
      ?AUTO_149 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_144 ?AUTO_143 ) ( SUPPORTS ?AUTO_144 ?AUTO_142 ) ( POWER_ON ?AUTO_144 ) ( POINTING ?AUTO_143 ?AUTO_141 ) ( ON_BOARD ?AUTO_144 ?AUTO_148 ) ( CALIBRATION_TARGET ?AUTO_144 ?AUTO_149 ) ( POINTING ?AUTO_148 ?AUTO_149 ) ( NOT_CALIBRATED ?AUTO_144 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_148 ?AUTO_144 ?AUTO_149 )
      ( GET_IMAGE ?AUTO_141 ?AUTO_142 )
      ( GET_IMAGE-VERIFY ?AUTO_141 ?AUTO_142 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_150 - DIRECTION
      ?AUTO_151 - MODE
    )
    :vars
    (
      ?AUTO_152 - INSTRUMENT
      ?AUTO_155 - SATELLITE
      ?AUTO_156 - SATELLITE
      ?AUTO_157 - DIRECTION
      ?AUTO_159 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_152 ?AUTO_155 ) ( SUPPORTS ?AUTO_152 ?AUTO_151 ) ( POINTING ?AUTO_155 ?AUTO_150 ) ( ON_BOARD ?AUTO_152 ?AUTO_156 ) ( CALIBRATION_TARGET ?AUTO_152 ?AUTO_157 ) ( POINTING ?AUTO_156 ?AUTO_157 ) ( ON_BOARD ?AUTO_152 ?AUTO_159 ) ( POWER_AVAIL ?AUTO_159 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_152 ?AUTO_159 )
      ( GET_IMAGE ?AUTO_150 ?AUTO_151 )
      ( GET_IMAGE-VERIFY ?AUTO_150 ?AUTO_151 ) )
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
      ?AUTO_165 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_164 ) ( ON_BOARD ?AUTO_164 ?AUTO_165 ) ( SUPPORTS ?AUTO_164 ?AUTO_163 ) ( POWER_ON ?AUTO_164 ) ( POINTING ?AUTO_165 ?AUTO_162 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_165 ?AUTO_162 ?AUTO_164 ?AUTO_163 )
      ( GET_IMAGE-VERIFY ?AUTO_162 ?AUTO_163 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_168 - DIRECTION
      ?AUTO_169 - MODE
    )
    :vars
    (
      ?AUTO_172 - INSTRUMENT
      ?AUTO_173 - SATELLITE
      ?AUTO_175 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_172 ) ( ON_BOARD ?AUTO_172 ?AUTO_173 ) ( SUPPORTS ?AUTO_172 ?AUTO_169 ) ( POWER_ON ?AUTO_172 ) ( POINTING ?AUTO_173 ?AUTO_175 ) ( not ( = ?AUTO_168 ?AUTO_175 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_173 ?AUTO_168 ?AUTO_175 )
      ( GET_IMAGE ?AUTO_168 ?AUTO_169 )
      ( GET_IMAGE-VERIFY ?AUTO_168 ?AUTO_169 ) )
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
      ?AUTO_183 - DIRECTION
      ?AUTO_185 - SATELLITE
      ?AUTO_186 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_181 ?AUTO_182 ) ( SUPPORTS ?AUTO_181 ?AUTO_178 ) ( POWER_ON ?AUTO_181 ) ( POINTING ?AUTO_182 ?AUTO_183 ) ( not ( = ?AUTO_177 ?AUTO_183 ) ) ( ON_BOARD ?AUTO_181 ?AUTO_185 ) ( CALIBRATION_TARGET ?AUTO_181 ?AUTO_186 ) ( POINTING ?AUTO_185 ?AUTO_186 ) ( NOT_CALIBRATED ?AUTO_181 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_185 ?AUTO_181 ?AUTO_186 )
      ( GET_IMAGE ?AUTO_177 ?AUTO_178 )
      ( GET_IMAGE-VERIFY ?AUTO_177 ?AUTO_178 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_187 - DIRECTION
      ?AUTO_188 - MODE
    )
    :vars
    (
      ?AUTO_195 - INSTRUMENT
      ?AUTO_189 - SATELLITE
      ?AUTO_194 - DIRECTION
      ?AUTO_191 - SATELLITE
      ?AUTO_192 - DIRECTION
      ?AUTO_197 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_195 ?AUTO_189 ) ( SUPPORTS ?AUTO_195 ?AUTO_188 ) ( POINTING ?AUTO_189 ?AUTO_194 ) ( not ( = ?AUTO_187 ?AUTO_194 ) ) ( ON_BOARD ?AUTO_195 ?AUTO_191 ) ( CALIBRATION_TARGET ?AUTO_195 ?AUTO_192 ) ( POINTING ?AUTO_191 ?AUTO_192 ) ( ON_BOARD ?AUTO_195 ?AUTO_197 ) ( POWER_AVAIL ?AUTO_197 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_195 ?AUTO_197 )
      ( GET_IMAGE ?AUTO_187 ?AUTO_188 )
      ( GET_IMAGE-VERIFY ?AUTO_187 ?AUTO_188 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_206 - DIRECTION
      ?AUTO_207 - MODE
    )
    :vars
    (
      ?AUTO_208 - INSTRUMENT
      ?AUTO_209 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_208 ) ( ON_BOARD ?AUTO_208 ?AUTO_209 ) ( SUPPORTS ?AUTO_208 ?AUTO_207 ) ( POWER_ON ?AUTO_208 ) ( POINTING ?AUTO_209 ?AUTO_206 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_209 ?AUTO_206 ?AUTO_208 ?AUTO_207 )
      ( GET_IMAGE-VERIFY ?AUTO_206 ?AUTO_207 ) )
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
      ?AUTO_216 - SATELLITE
      ?AUTO_219 - SATELLITE
      ?AUTO_220 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_215 ?AUTO_216 ) ( SUPPORTS ?AUTO_215 ?AUTO_213 ) ( POWER_ON ?AUTO_215 ) ( POINTING ?AUTO_216 ?AUTO_212 ) ( ON_BOARD ?AUTO_215 ?AUTO_219 ) ( CALIBRATION_TARGET ?AUTO_215 ?AUTO_220 ) ( POINTING ?AUTO_219 ?AUTO_220 ) ( NOT_CALIBRATED ?AUTO_215 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_219 ?AUTO_215 ?AUTO_220 )
      ( GET_IMAGE ?AUTO_212 ?AUTO_213 )
      ( GET_IMAGE-VERIFY ?AUTO_212 ?AUTO_213 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_221 - DIRECTION
      ?AUTO_222 - MODE
    )
    :vars
    (
      ?AUTO_224 - INSTRUMENT
      ?AUTO_226 - SATELLITE
      ?AUTO_227 - SATELLITE
      ?AUTO_228 - DIRECTION
      ?AUTO_230 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_224 ?AUTO_226 ) ( SUPPORTS ?AUTO_224 ?AUTO_222 ) ( POINTING ?AUTO_226 ?AUTO_221 ) ( ON_BOARD ?AUTO_224 ?AUTO_227 ) ( CALIBRATION_TARGET ?AUTO_224 ?AUTO_228 ) ( POINTING ?AUTO_227 ?AUTO_228 ) ( ON_BOARD ?AUTO_224 ?AUTO_230 ) ( POWER_AVAIL ?AUTO_230 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_224 ?AUTO_230 )
      ( GET_IMAGE ?AUTO_221 ?AUTO_222 )
      ( GET_IMAGE-VERIFY ?AUTO_221 ?AUTO_222 ) )
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
      ?AUTO_253 - DIRECTION
      ?AUTO_254 - MODE
    )
    :vars
    (
      ?AUTO_257 - INSTRUMENT
      ?AUTO_258 - SATELLITE
      ?AUTO_260 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_257 ) ( ON_BOARD ?AUTO_257 ?AUTO_258 ) ( SUPPORTS ?AUTO_257 ?AUTO_254 ) ( POWER_ON ?AUTO_257 ) ( POINTING ?AUTO_258 ?AUTO_260 ) ( not ( = ?AUTO_253 ?AUTO_260 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_258 ?AUTO_253 ?AUTO_260 )
      ( GET_IMAGE ?AUTO_253 ?AUTO_254 )
      ( GET_IMAGE-VERIFY ?AUTO_253 ?AUTO_254 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_264 - DIRECTION
      ?AUTO_265 - MODE
    )
    :vars
    (
      ?AUTO_270 - INSTRUMENT
      ?AUTO_268 - SATELLITE
      ?AUTO_266 - DIRECTION
      ?AUTO_272 - SATELLITE
      ?AUTO_273 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_270 ?AUTO_268 ) ( SUPPORTS ?AUTO_270 ?AUTO_265 ) ( POWER_ON ?AUTO_270 ) ( POINTING ?AUTO_268 ?AUTO_266 ) ( not ( = ?AUTO_264 ?AUTO_266 ) ) ( ON_BOARD ?AUTO_270 ?AUTO_272 ) ( CALIBRATION_TARGET ?AUTO_270 ?AUTO_273 ) ( POINTING ?AUTO_272 ?AUTO_273 ) ( NOT_CALIBRATED ?AUTO_270 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_272 ?AUTO_270 ?AUTO_273 )
      ( GET_IMAGE ?AUTO_264 ?AUTO_265 )
      ( GET_IMAGE-VERIFY ?AUTO_264 ?AUTO_265 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_274 - DIRECTION
      ?AUTO_275 - MODE
    )
    :vars
    (
      ?AUTO_279 - INSTRUMENT
      ?AUTO_280 - SATELLITE
      ?AUTO_278 - DIRECTION
      ?AUTO_282 - SATELLITE
      ?AUTO_281 - DIRECTION
      ?AUTO_284 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_279 ?AUTO_280 ) ( SUPPORTS ?AUTO_279 ?AUTO_275 ) ( POINTING ?AUTO_280 ?AUTO_278 ) ( not ( = ?AUTO_274 ?AUTO_278 ) ) ( ON_BOARD ?AUTO_279 ?AUTO_282 ) ( CALIBRATION_TARGET ?AUTO_279 ?AUTO_281 ) ( POINTING ?AUTO_282 ?AUTO_281 ) ( ON_BOARD ?AUTO_279 ?AUTO_284 ) ( POWER_AVAIL ?AUTO_284 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_279 ?AUTO_284 )
      ( GET_IMAGE ?AUTO_274 ?AUTO_275 )
      ( GET_IMAGE-VERIFY ?AUTO_274 ?AUTO_275 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_287 - DIRECTION
      ?AUTO_288 - MODE
    )
    :vars
    (
      ?AUTO_289 - INSTRUMENT
      ?AUTO_290 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_289 ) ( ON_BOARD ?AUTO_289 ?AUTO_290 ) ( SUPPORTS ?AUTO_289 ?AUTO_288 ) ( POWER_ON ?AUTO_289 ) ( POINTING ?AUTO_290 ?AUTO_287 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_290 ?AUTO_287 ?AUTO_289 ?AUTO_288 )
      ( GET_IMAGE-VERIFY ?AUTO_287 ?AUTO_288 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_293 - DIRECTION
      ?AUTO_294 - MODE
    )
    :vars
    (
      ?AUTO_297 - INSTRUMENT
      ?AUTO_298 - SATELLITE
      ?AUTO_300 - SATELLITE
      ?AUTO_301 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_297 ?AUTO_298 ) ( SUPPORTS ?AUTO_297 ?AUTO_294 ) ( POWER_ON ?AUTO_297 ) ( POINTING ?AUTO_298 ?AUTO_293 ) ( ON_BOARD ?AUTO_297 ?AUTO_300 ) ( CALIBRATION_TARGET ?AUTO_297 ?AUTO_301 ) ( POINTING ?AUTO_300 ?AUTO_301 ) ( NOT_CALIBRATED ?AUTO_297 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_300 ?AUTO_297 ?AUTO_301 )
      ( GET_IMAGE ?AUTO_293 ?AUTO_294 )
      ( GET_IMAGE-VERIFY ?AUTO_293 ?AUTO_294 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_304 - DIRECTION
      ?AUTO_303 - MODE
    )
    :vars
    (
      ?AUTO_308 - INSTRUMENT
      ?AUTO_309 - SATELLITE
      ?AUTO_311 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_308 ?AUTO_309 ) ( SUPPORTS ?AUTO_308 ?AUTO_303 ) ( POWER_ON ?AUTO_308 ) ( CALIBRATION_TARGET ?AUTO_308 ?AUTO_304 ) ( NOT_CALIBRATED ?AUTO_308 ) ( POINTING ?AUTO_309 ?AUTO_311 ) ( not ( = ?AUTO_304 ?AUTO_311 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_309 ?AUTO_304 ?AUTO_311 )
      ( GET_IMAGE ?AUTO_304 ?AUTO_303 )
      ( GET_IMAGE-VERIFY ?AUTO_304 ?AUTO_303 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_313 - DIRECTION
      ?AUTO_314 - MODE
    )
    :vars
    (
      ?AUTO_319 - INSTRUMENT
      ?AUTO_318 - SATELLITE
      ?AUTO_317 - DIRECTION
      ?AUTO_321 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_319 ?AUTO_318 ) ( SUPPORTS ?AUTO_319 ?AUTO_314 ) ( CALIBRATION_TARGET ?AUTO_319 ?AUTO_313 ) ( POINTING ?AUTO_318 ?AUTO_317 ) ( not ( = ?AUTO_313 ?AUTO_317 ) ) ( ON_BOARD ?AUTO_319 ?AUTO_321 ) ( POWER_AVAIL ?AUTO_321 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_319 ?AUTO_321 )
      ( GET_IMAGE ?AUTO_313 ?AUTO_314 )
      ( GET_IMAGE-VERIFY ?AUTO_313 ?AUTO_314 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_328 - DIRECTION
      ?AUTO_329 - MODE
    )
    :vars
    (
      ?AUTO_330 - INSTRUMENT
      ?AUTO_331 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_330 ) ( ON_BOARD ?AUTO_330 ?AUTO_331 ) ( SUPPORTS ?AUTO_330 ?AUTO_329 ) ( POWER_ON ?AUTO_330 ) ( POINTING ?AUTO_331 ?AUTO_328 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_331 ?AUTO_328 ?AUTO_330 ?AUTO_329 )
      ( GET_IMAGE-VERIFY ?AUTO_328 ?AUTO_329 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_334 - DIRECTION
      ?AUTO_335 - MODE
    )
    :vars
    (
      ?AUTO_338 - INSTRUMENT
      ?AUTO_339 - SATELLITE
      ?AUTO_341 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_338 ) ( ON_BOARD ?AUTO_338 ?AUTO_339 ) ( SUPPORTS ?AUTO_338 ?AUTO_335 ) ( POWER_ON ?AUTO_338 ) ( POINTING ?AUTO_339 ?AUTO_341 ) ( not ( = ?AUTO_334 ?AUTO_341 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_339 ?AUTO_334 ?AUTO_341 )
      ( GET_IMAGE ?AUTO_334 ?AUTO_335 )
      ( GET_IMAGE-VERIFY ?AUTO_334 ?AUTO_335 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_345 - DIRECTION
      ?AUTO_346 - MODE
    )
    :vars
    (
      ?AUTO_349 - INSTRUMENT
      ?AUTO_350 - SATELLITE
      ?AUTO_347 - DIRECTION
      ?AUTO_353 - SATELLITE
      ?AUTO_354 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_349 ?AUTO_350 ) ( SUPPORTS ?AUTO_349 ?AUTO_346 ) ( POWER_ON ?AUTO_349 ) ( POINTING ?AUTO_350 ?AUTO_347 ) ( not ( = ?AUTO_345 ?AUTO_347 ) ) ( ON_BOARD ?AUTO_349 ?AUTO_353 ) ( CALIBRATION_TARGET ?AUTO_349 ?AUTO_354 ) ( POINTING ?AUTO_353 ?AUTO_354 ) ( NOT_CALIBRATED ?AUTO_349 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_353 ?AUTO_349 ?AUTO_354 )
      ( GET_IMAGE ?AUTO_345 ?AUTO_346 )
      ( GET_IMAGE-VERIFY ?AUTO_345 ?AUTO_346 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_355 - DIRECTION
      ?AUTO_356 - MODE
    )
    :vars
    (
      ?AUTO_361 - INSTRUMENT
      ?AUTO_362 - SATELLITE
      ?AUTO_363 - DIRECTION
      ?AUTO_365 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_361 ?AUTO_362 ) ( SUPPORTS ?AUTO_361 ?AUTO_356 ) ( POWER_ON ?AUTO_361 ) ( not ( = ?AUTO_355 ?AUTO_363 ) ) ( CALIBRATION_TARGET ?AUTO_361 ?AUTO_363 ) ( NOT_CALIBRATED ?AUTO_361 ) ( POINTING ?AUTO_362 ?AUTO_365 ) ( not ( = ?AUTO_363 ?AUTO_365 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_362 ?AUTO_363 ?AUTO_365 )
      ( GET_IMAGE ?AUTO_355 ?AUTO_356 )
      ( GET_IMAGE-VERIFY ?AUTO_355 ?AUTO_356 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_367 - DIRECTION
      ?AUTO_368 - MODE
    )
    :vars
    (
      ?AUTO_374 - INSTRUMENT
      ?AUTO_372 - SATELLITE
      ?AUTO_373 - DIRECTION
      ?AUTO_370 - DIRECTION
      ?AUTO_376 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_374 ?AUTO_372 ) ( SUPPORTS ?AUTO_374 ?AUTO_368 ) ( not ( = ?AUTO_367 ?AUTO_373 ) ) ( CALIBRATION_TARGET ?AUTO_374 ?AUTO_373 ) ( POINTING ?AUTO_372 ?AUTO_370 ) ( not ( = ?AUTO_373 ?AUTO_370 ) ) ( ON_BOARD ?AUTO_374 ?AUTO_376 ) ( POWER_AVAIL ?AUTO_376 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_374 ?AUTO_376 )
      ( GET_IMAGE ?AUTO_367 ?AUTO_368 )
      ( GET_IMAGE-VERIFY ?AUTO_367 ?AUTO_368 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_383 - DIRECTION
      ?AUTO_384 - MODE
    )
    :vars
    (
      ?AUTO_385 - INSTRUMENT
      ?AUTO_386 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_385 ) ( ON_BOARD ?AUTO_385 ?AUTO_386 ) ( SUPPORTS ?AUTO_385 ?AUTO_384 ) ( POWER_ON ?AUTO_385 ) ( POINTING ?AUTO_386 ?AUTO_383 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_386 ?AUTO_383 ?AUTO_385 ?AUTO_384 )
      ( GET_IMAGE-VERIFY ?AUTO_383 ?AUTO_384 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_389 - DIRECTION
      ?AUTO_390 - MODE
    )
    :vars
    (
      ?AUTO_393 - INSTRUMENT
      ?AUTO_394 - SATELLITE
      ?AUTO_396 - SATELLITE
      ?AUTO_397 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_393 ?AUTO_394 ) ( SUPPORTS ?AUTO_393 ?AUTO_390 ) ( POWER_ON ?AUTO_393 ) ( POINTING ?AUTO_394 ?AUTO_389 ) ( ON_BOARD ?AUTO_393 ?AUTO_396 ) ( CALIBRATION_TARGET ?AUTO_393 ?AUTO_397 ) ( POINTING ?AUTO_396 ?AUTO_397 ) ( NOT_CALIBRATED ?AUTO_393 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_396 ?AUTO_393 ?AUTO_397 )
      ( GET_IMAGE ?AUTO_389 ?AUTO_390 )
      ( GET_IMAGE-VERIFY ?AUTO_389 ?AUTO_390 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_400 - DIRECTION
      ?AUTO_401 - MODE
    )
    :vars
    (
      ?AUTO_403 - INSTRUMENT
      ?AUTO_405 - SATELLITE
      ?AUTO_407 - SATELLITE
      ?AUTO_406 - DIRECTION
      ?AUTO_409 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_403 ?AUTO_405 ) ( SUPPORTS ?AUTO_403 ?AUTO_401 ) ( POINTING ?AUTO_405 ?AUTO_400 ) ( ON_BOARD ?AUTO_403 ?AUTO_407 ) ( CALIBRATION_TARGET ?AUTO_403 ?AUTO_406 ) ( POINTING ?AUTO_407 ?AUTO_406 ) ( ON_BOARD ?AUTO_403 ?AUTO_409 ) ( POWER_AVAIL ?AUTO_409 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_403 ?AUTO_409 )
      ( GET_IMAGE ?AUTO_400 ?AUTO_401 )
      ( GET_IMAGE-VERIFY ?AUTO_400 ?AUTO_401 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_417 - DIRECTION
      ?AUTO_411 - MODE
    )
    :vars
    (
      ?AUTO_416 - INSTRUMENT
      ?AUTO_413 - SATELLITE
      ?AUTO_418 - SATELLITE
      ?AUTO_420 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_416 ?AUTO_413 ) ( SUPPORTS ?AUTO_416 ?AUTO_411 ) ( CALIBRATION_TARGET ?AUTO_416 ?AUTO_417 ) ( ON_BOARD ?AUTO_416 ?AUTO_418 ) ( POWER_AVAIL ?AUTO_418 ) ( POINTING ?AUTO_413 ?AUTO_420 ) ( not ( = ?AUTO_417 ?AUTO_420 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_413 ?AUTO_417 ?AUTO_420 )
      ( GET_IMAGE ?AUTO_417 ?AUTO_411 )
      ( GET_IMAGE-VERIFY ?AUTO_417 ?AUTO_411 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_440 - DIRECTION
      ?AUTO_441 - MODE
    )
    :vars
    (
      ?AUTO_442 - INSTRUMENT
      ?AUTO_443 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_442 ) ( ON_BOARD ?AUTO_442 ?AUTO_443 ) ( SUPPORTS ?AUTO_442 ?AUTO_441 ) ( POWER_ON ?AUTO_442 ) ( POINTING ?AUTO_443 ?AUTO_440 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_443 ?AUTO_440 ?AUTO_442 ?AUTO_441 )
      ( GET_IMAGE-VERIFY ?AUTO_440 ?AUTO_441 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_446 - DIRECTION
      ?AUTO_447 - MODE
    )
    :vars
    (
      ?AUTO_450 - INSTRUMENT
      ?AUTO_451 - SATELLITE
      ?AUTO_453 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_450 ) ( ON_BOARD ?AUTO_450 ?AUTO_451 ) ( SUPPORTS ?AUTO_450 ?AUTO_447 ) ( POWER_ON ?AUTO_450 ) ( POINTING ?AUTO_451 ?AUTO_453 ) ( not ( = ?AUTO_446 ?AUTO_453 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_451 ?AUTO_446 ?AUTO_453 )
      ( GET_IMAGE ?AUTO_446 ?AUTO_447 )
      ( GET_IMAGE-VERIFY ?AUTO_446 ?AUTO_447 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_455 - DIRECTION
      ?AUTO_456 - MODE
    )
    :vars
    (
      ?AUTO_459 - INSTRUMENT
      ?AUTO_460 - SATELLITE
      ?AUTO_461 - DIRECTION
      ?AUTO_463 - SATELLITE
      ?AUTO_464 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_459 ?AUTO_460 ) ( SUPPORTS ?AUTO_459 ?AUTO_456 ) ( POWER_ON ?AUTO_459 ) ( POINTING ?AUTO_460 ?AUTO_461 ) ( not ( = ?AUTO_455 ?AUTO_461 ) ) ( ON_BOARD ?AUTO_459 ?AUTO_463 ) ( CALIBRATION_TARGET ?AUTO_459 ?AUTO_464 ) ( POINTING ?AUTO_463 ?AUTO_464 ) ( NOT_CALIBRATED ?AUTO_459 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_463 ?AUTO_459 ?AUTO_464 )
      ( GET_IMAGE ?AUTO_455 ?AUTO_456 )
      ( GET_IMAGE-VERIFY ?AUTO_455 ?AUTO_456 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_465 - DIRECTION
      ?AUTO_466 - MODE
    )
    :vars
    (
      ?AUTO_470 - INSTRUMENT
      ?AUTO_472 - SATELLITE
      ?AUTO_473 - DIRECTION
      ?AUTO_475 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_470 ?AUTO_472 ) ( SUPPORTS ?AUTO_470 ?AUTO_466 ) ( POWER_ON ?AUTO_470 ) ( not ( = ?AUTO_465 ?AUTO_473 ) ) ( CALIBRATION_TARGET ?AUTO_470 ?AUTO_473 ) ( NOT_CALIBRATED ?AUTO_470 ) ( POINTING ?AUTO_472 ?AUTO_475 ) ( not ( = ?AUTO_473 ?AUTO_475 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_472 ?AUTO_473 ?AUTO_475 )
      ( GET_IMAGE ?AUTO_465 ?AUTO_466 )
      ( GET_IMAGE-VERIFY ?AUTO_465 ?AUTO_466 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_477 - DIRECTION
      ?AUTO_478 - MODE
    )
    :vars
    (
      ?AUTO_484 - INSTRUMENT
      ?AUTO_482 - SATELLITE
      ?AUTO_480 - DIRECTION
      ?AUTO_479 - DIRECTION
      ?AUTO_486 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_484 ?AUTO_482 ) ( SUPPORTS ?AUTO_484 ?AUTO_478 ) ( not ( = ?AUTO_477 ?AUTO_480 ) ) ( CALIBRATION_TARGET ?AUTO_484 ?AUTO_480 ) ( POINTING ?AUTO_482 ?AUTO_479 ) ( not ( = ?AUTO_480 ?AUTO_479 ) ) ( ON_BOARD ?AUTO_484 ?AUTO_486 ) ( POWER_AVAIL ?AUTO_486 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_484 ?AUTO_486 )
      ( GET_IMAGE ?AUTO_477 ?AUTO_478 )
      ( GET_IMAGE-VERIFY ?AUTO_477 ?AUTO_478 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_491 - DIRECTION
      ?AUTO_492 - MODE
    )
    :vars
    (
      ?AUTO_499 - INSTRUMENT
      ?AUTO_496 - SATELLITE
      ?AUTO_498 - DIRECTION
      ?AUTO_497 - DIRECTION
      ?AUTO_495 - SATELLITE
      ?AUTO_500 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_499 ?AUTO_496 ) ( SUPPORTS ?AUTO_499 ?AUTO_492 ) ( not ( = ?AUTO_491 ?AUTO_498 ) ) ( CALIBRATION_TARGET ?AUTO_499 ?AUTO_498 ) ( POINTING ?AUTO_496 ?AUTO_497 ) ( not ( = ?AUTO_498 ?AUTO_497 ) ) ( ON_BOARD ?AUTO_499 ?AUTO_495 ) ( ON_BOARD ?AUTO_500 ?AUTO_495 ) ( POWER_ON ?AUTO_500 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_500 ?AUTO_495 )
      ( GET_IMAGE ?AUTO_491 ?AUTO_492 )
      ( GET_IMAGE-VERIFY ?AUTO_491 ?AUTO_492 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_524 - DIRECTION
      ?AUTO_525 - MODE
    )
    :vars
    (
      ?AUTO_526 - INSTRUMENT
      ?AUTO_527 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_526 ) ( ON_BOARD ?AUTO_526 ?AUTO_527 ) ( SUPPORTS ?AUTO_526 ?AUTO_525 ) ( POWER_ON ?AUTO_526 ) ( POINTING ?AUTO_527 ?AUTO_524 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_527 ?AUTO_524 ?AUTO_526 ?AUTO_525 )
      ( GET_IMAGE-VERIFY ?AUTO_524 ?AUTO_525 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_530 - DIRECTION
      ?AUTO_531 - MODE
    )
    :vars
    (
      ?AUTO_534 - INSTRUMENT
      ?AUTO_535 - SATELLITE
      ?AUTO_537 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_534 ) ( ON_BOARD ?AUTO_534 ?AUTO_535 ) ( SUPPORTS ?AUTO_534 ?AUTO_531 ) ( POWER_ON ?AUTO_534 ) ( POINTING ?AUTO_535 ?AUTO_537 ) ( not ( = ?AUTO_530 ?AUTO_537 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_535 ?AUTO_530 ?AUTO_537 )
      ( GET_IMAGE ?AUTO_530 ?AUTO_531 )
      ( GET_IMAGE-VERIFY ?AUTO_530 ?AUTO_531 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_540 - DIRECTION
      ?AUTO_541 - MODE
    )
    :vars
    (
      ?AUTO_542 - INSTRUMENT
      ?AUTO_543 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_542 ) ( ON_BOARD ?AUTO_542 ?AUTO_543 ) ( SUPPORTS ?AUTO_542 ?AUTO_541 ) ( POWER_ON ?AUTO_542 ) ( POINTING ?AUTO_543 ?AUTO_540 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_543 ?AUTO_540 ?AUTO_542 ?AUTO_541 )
      ( GET_IMAGE-VERIFY ?AUTO_540 ?AUTO_541 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_546 - DIRECTION
      ?AUTO_547 - MODE
    )
    :vars
    (
      ?AUTO_550 - INSTRUMENT
      ?AUTO_551 - SATELLITE
      ?AUTO_553 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_550 ) ( ON_BOARD ?AUTO_550 ?AUTO_551 ) ( SUPPORTS ?AUTO_550 ?AUTO_547 ) ( POWER_ON ?AUTO_550 ) ( POINTING ?AUTO_551 ?AUTO_553 ) ( not ( = ?AUTO_546 ?AUTO_553 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_551 ?AUTO_546 ?AUTO_553 )
      ( GET_IMAGE ?AUTO_546 ?AUTO_547 )
      ( GET_IMAGE-VERIFY ?AUTO_546 ?AUTO_547 ) )
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
      ?AUTO_561 - DIRECTION
      ?AUTO_563 - SATELLITE
      ?AUTO_564 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_559 ?AUTO_560 ) ( SUPPORTS ?AUTO_559 ?AUTO_556 ) ( POWER_ON ?AUTO_559 ) ( POINTING ?AUTO_560 ?AUTO_561 ) ( not ( = ?AUTO_555 ?AUTO_561 ) ) ( ON_BOARD ?AUTO_559 ?AUTO_563 ) ( CALIBRATION_TARGET ?AUTO_559 ?AUTO_564 ) ( POINTING ?AUTO_563 ?AUTO_564 ) ( NOT_CALIBRATED ?AUTO_559 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_563 ?AUTO_559 ?AUTO_564 )
      ( GET_IMAGE ?AUTO_555 ?AUTO_556 )
      ( GET_IMAGE-VERIFY ?AUTO_555 ?AUTO_556 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_565 - DIRECTION
      ?AUTO_566 - MODE
    )
    :vars
    (
      ?AUTO_570 - INSTRUMENT
      ?AUTO_572 - SATELLITE
      ?AUTO_573 - DIRECTION
      ?AUTO_575 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_570 ?AUTO_572 ) ( SUPPORTS ?AUTO_570 ?AUTO_566 ) ( POWER_ON ?AUTO_570 ) ( not ( = ?AUTO_565 ?AUTO_573 ) ) ( CALIBRATION_TARGET ?AUTO_570 ?AUTO_573 ) ( NOT_CALIBRATED ?AUTO_570 ) ( POINTING ?AUTO_572 ?AUTO_575 ) ( not ( = ?AUTO_573 ?AUTO_575 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_572 ?AUTO_573 ?AUTO_575 )
      ( GET_IMAGE ?AUTO_565 ?AUTO_566 )
      ( GET_IMAGE-VERIFY ?AUTO_565 ?AUTO_566 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_577 - DIRECTION
      ?AUTO_578 - MODE
    )
    :vars
    (
      ?AUTO_584 - INSTRUMENT
      ?AUTO_582 - SATELLITE
      ?AUTO_580 - DIRECTION
      ?AUTO_579 - DIRECTION
      ?AUTO_586 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_584 ?AUTO_582 ) ( SUPPORTS ?AUTO_584 ?AUTO_578 ) ( not ( = ?AUTO_577 ?AUTO_580 ) ) ( CALIBRATION_TARGET ?AUTO_584 ?AUTO_580 ) ( POINTING ?AUTO_582 ?AUTO_579 ) ( not ( = ?AUTO_580 ?AUTO_579 ) ) ( ON_BOARD ?AUTO_584 ?AUTO_586 ) ( POWER_AVAIL ?AUTO_586 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_584 ?AUTO_586 )
      ( GET_IMAGE ?AUTO_577 ?AUTO_578 )
      ( GET_IMAGE-VERIFY ?AUTO_577 ?AUTO_578 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_591 - DIRECTION
      ?AUTO_592 - MODE
    )
    :vars
    (
      ?AUTO_593 - INSTRUMENT
      ?AUTO_594 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_593 ) ( ON_BOARD ?AUTO_593 ?AUTO_594 ) ( SUPPORTS ?AUTO_593 ?AUTO_592 ) ( POWER_ON ?AUTO_593 ) ( POINTING ?AUTO_594 ?AUTO_591 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_594 ?AUTO_591 ?AUTO_593 ?AUTO_592 )
      ( GET_IMAGE-VERIFY ?AUTO_591 ?AUTO_592 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_597 - DIRECTION
      ?AUTO_598 - MODE
    )
    :vars
    (
      ?AUTO_602 - INSTRUMENT
      ?AUTO_599 - SATELLITE
      ?AUTO_604 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_602 ) ( ON_BOARD ?AUTO_602 ?AUTO_599 ) ( SUPPORTS ?AUTO_602 ?AUTO_598 ) ( POWER_ON ?AUTO_602 ) ( POINTING ?AUTO_599 ?AUTO_604 ) ( not ( = ?AUTO_597 ?AUTO_604 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_599 ?AUTO_597 ?AUTO_604 )
      ( GET_IMAGE ?AUTO_597 ?AUTO_598 )
      ( GET_IMAGE-VERIFY ?AUTO_597 ?AUTO_598 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_608 - DIRECTION
      ?AUTO_609 - MODE
    )
    :vars
    (
      ?AUTO_613 - INSTRUMENT
      ?AUTO_612 - SATELLITE
      ?AUTO_610 - DIRECTION
      ?AUTO_616 - SATELLITE
      ?AUTO_617 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_613 ?AUTO_612 ) ( SUPPORTS ?AUTO_613 ?AUTO_609 ) ( POWER_ON ?AUTO_613 ) ( POINTING ?AUTO_612 ?AUTO_610 ) ( not ( = ?AUTO_608 ?AUTO_610 ) ) ( ON_BOARD ?AUTO_613 ?AUTO_616 ) ( CALIBRATION_TARGET ?AUTO_613 ?AUTO_617 ) ( POINTING ?AUTO_616 ?AUTO_617 ) ( NOT_CALIBRATED ?AUTO_613 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_616 ?AUTO_613 ?AUTO_617 )
      ( GET_IMAGE ?AUTO_608 ?AUTO_609 )
      ( GET_IMAGE-VERIFY ?AUTO_608 ?AUTO_609 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_618 - DIRECTION
      ?AUTO_619 - MODE
    )
    :vars
    (
      ?AUTO_622 - INSTRUMENT
      ?AUTO_624 - SATELLITE
      ?AUTO_623 - DIRECTION
      ?AUTO_625 - SATELLITE
      ?AUTO_626 - DIRECTION
      ?AUTO_628 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_622 ?AUTO_624 ) ( SUPPORTS ?AUTO_622 ?AUTO_619 ) ( POINTING ?AUTO_624 ?AUTO_623 ) ( not ( = ?AUTO_618 ?AUTO_623 ) ) ( ON_BOARD ?AUTO_622 ?AUTO_625 ) ( CALIBRATION_TARGET ?AUTO_622 ?AUTO_626 ) ( POINTING ?AUTO_625 ?AUTO_626 ) ( ON_BOARD ?AUTO_622 ?AUTO_628 ) ( POWER_AVAIL ?AUTO_628 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_622 ?AUTO_628 )
      ( GET_IMAGE ?AUTO_618 ?AUTO_619 )
      ( GET_IMAGE-VERIFY ?AUTO_618 ?AUTO_619 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_643 - DIRECTION
      ?AUTO_644 - MODE
    )
    :vars
    (
      ?AUTO_645 - INSTRUMENT
      ?AUTO_646 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_645 ) ( ON_BOARD ?AUTO_645 ?AUTO_646 ) ( SUPPORTS ?AUTO_645 ?AUTO_644 ) ( POWER_ON ?AUTO_645 ) ( POINTING ?AUTO_646 ?AUTO_643 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_646 ?AUTO_643 ?AUTO_645 ?AUTO_644 )
      ( GET_IMAGE-VERIFY ?AUTO_643 ?AUTO_644 ) )
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
      ?AUTO_654 - SATELLITE
      ?AUTO_656 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_653 ) ( ON_BOARD ?AUTO_653 ?AUTO_654 ) ( SUPPORTS ?AUTO_653 ?AUTO_650 ) ( POWER_ON ?AUTO_653 ) ( POINTING ?AUTO_654 ?AUTO_656 ) ( not ( = ?AUTO_649 ?AUTO_656 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_654 ?AUTO_649 ?AUTO_656 )
      ( GET_IMAGE ?AUTO_649 ?AUTO_650 )
      ( GET_IMAGE-VERIFY ?AUTO_649 ?AUTO_650 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_658 - DIRECTION
      ?AUTO_659 - MODE
    )
    :vars
    (
      ?AUTO_662 - INSTRUMENT
      ?AUTO_663 - SATELLITE
      ?AUTO_664 - DIRECTION
      ?AUTO_666 - SATELLITE
      ?AUTO_667 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_662 ?AUTO_663 ) ( SUPPORTS ?AUTO_662 ?AUTO_659 ) ( POWER_ON ?AUTO_662 ) ( POINTING ?AUTO_663 ?AUTO_664 ) ( not ( = ?AUTO_658 ?AUTO_664 ) ) ( ON_BOARD ?AUTO_662 ?AUTO_666 ) ( CALIBRATION_TARGET ?AUTO_662 ?AUTO_667 ) ( POINTING ?AUTO_666 ?AUTO_667 ) ( NOT_CALIBRATED ?AUTO_662 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_666 ?AUTO_662 ?AUTO_667 )
      ( GET_IMAGE ?AUTO_658 ?AUTO_659 )
      ( GET_IMAGE-VERIFY ?AUTO_658 ?AUTO_659 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_668 - DIRECTION
      ?AUTO_669 - MODE
    )
    :vars
    (
      ?AUTO_673 - INSTRUMENT
      ?AUTO_674 - SATELLITE
      ?AUTO_671 - DIRECTION
      ?AUTO_675 - SATELLITE
      ?AUTO_676 - DIRECTION
      ?AUTO_678 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_673 ?AUTO_674 ) ( SUPPORTS ?AUTO_673 ?AUTO_669 ) ( POINTING ?AUTO_674 ?AUTO_671 ) ( not ( = ?AUTO_668 ?AUTO_671 ) ) ( ON_BOARD ?AUTO_673 ?AUTO_675 ) ( CALIBRATION_TARGET ?AUTO_673 ?AUTO_676 ) ( POINTING ?AUTO_675 ?AUTO_676 ) ( ON_BOARD ?AUTO_673 ?AUTO_678 ) ( POWER_AVAIL ?AUTO_678 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_673 ?AUTO_678 )
      ( GET_IMAGE ?AUTO_668 ?AUTO_669 )
      ( GET_IMAGE-VERIFY ?AUTO_668 ?AUTO_669 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_679 - DIRECTION
      ?AUTO_680 - MODE
    )
    :vars
    (
      ?AUTO_683 - INSTRUMENT
      ?AUTO_687 - SATELLITE
      ?AUTO_686 - DIRECTION
      ?AUTO_684 - SATELLITE
      ?AUTO_681 - DIRECTION
      ?AUTO_688 - SATELLITE
      ?AUTO_689 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_683 ?AUTO_687 ) ( SUPPORTS ?AUTO_683 ?AUTO_680 ) ( POINTING ?AUTO_687 ?AUTO_686 ) ( not ( = ?AUTO_679 ?AUTO_686 ) ) ( ON_BOARD ?AUTO_683 ?AUTO_684 ) ( CALIBRATION_TARGET ?AUTO_683 ?AUTO_681 ) ( POINTING ?AUTO_684 ?AUTO_681 ) ( ON_BOARD ?AUTO_683 ?AUTO_688 ) ( ON_BOARD ?AUTO_689 ?AUTO_688 ) ( POWER_ON ?AUTO_689 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_689 ?AUTO_688 )
      ( GET_IMAGE ?AUTO_679 ?AUTO_680 )
      ( GET_IMAGE-VERIFY ?AUTO_679 ?AUTO_680 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_693 - DIRECTION
      ?AUTO_694 - MODE
    )
    :vars
    (
      ?AUTO_698 - INSTRUMENT
      ?AUTO_697 - SATELLITE
      ?AUTO_695 - DIRECTION
      ?AUTO_696 - SATELLITE
      ?AUTO_699 - INSTRUMENT
      ?AUTO_705 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_698 ?AUTO_697 ) ( SUPPORTS ?AUTO_698 ?AUTO_694 ) ( not ( = ?AUTO_693 ?AUTO_695 ) ) ( CALIBRATION_TARGET ?AUTO_698 ?AUTO_695 ) ( ON_BOARD ?AUTO_698 ?AUTO_696 ) ( ON_BOARD ?AUTO_699 ?AUTO_696 ) ( POWER_ON ?AUTO_699 ) ( POINTING ?AUTO_697 ?AUTO_705 ) ( not ( = ?AUTO_695 ?AUTO_705 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_697 ?AUTO_695 ?AUTO_705 )
      ( GET_IMAGE ?AUTO_693 ?AUTO_694 )
      ( GET_IMAGE-VERIFY ?AUTO_693 ?AUTO_694 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_711 - DIRECTION
      ?AUTO_712 - MODE
    )
    :vars
    (
      ?AUTO_713 - INSTRUMENT
      ?AUTO_715 - SATELLITE
      ?AUTO_720 - DIRECTION
      ?AUTO_714 - SATELLITE
      ?AUTO_719 - INSTRUMENT
      ?AUTO_718 - DIRECTION
      ?AUTO_722 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_713 ?AUTO_715 ) ( SUPPORTS ?AUTO_713 ?AUTO_712 ) ( not ( = ?AUTO_711 ?AUTO_720 ) ) ( CALIBRATION_TARGET ?AUTO_713 ?AUTO_720 ) ( ON_BOARD ?AUTO_713 ?AUTO_714 ) ( ON_BOARD ?AUTO_719 ?AUTO_714 ) ( POINTING ?AUTO_715 ?AUTO_718 ) ( not ( = ?AUTO_720 ?AUTO_718 ) ) ( ON_BOARD ?AUTO_719 ?AUTO_722 ) ( POWER_AVAIL ?AUTO_722 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_719 ?AUTO_722 )
      ( GET_IMAGE ?AUTO_711 ?AUTO_712 )
      ( GET_IMAGE-VERIFY ?AUTO_711 ?AUTO_712 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_737 - DIRECTION
      ?AUTO_738 - MODE
    )
    :vars
    (
      ?AUTO_739 - INSTRUMENT
      ?AUTO_740 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_739 ) ( ON_BOARD ?AUTO_739 ?AUTO_740 ) ( SUPPORTS ?AUTO_739 ?AUTO_738 ) ( POWER_ON ?AUTO_739 ) ( POINTING ?AUTO_740 ?AUTO_737 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_740 ?AUTO_737 ?AUTO_739 ?AUTO_738 )
      ( GET_IMAGE-VERIFY ?AUTO_737 ?AUTO_738 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_743 - DIRECTION
      ?AUTO_744 - MODE
    )
    :vars
    (
      ?AUTO_746 - INSTRUMENT
      ?AUTO_747 - SATELLITE
      ?AUTO_750 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_746 ) ( ON_BOARD ?AUTO_746 ?AUTO_747 ) ( SUPPORTS ?AUTO_746 ?AUTO_744 ) ( POWER_ON ?AUTO_746 ) ( POINTING ?AUTO_747 ?AUTO_750 ) ( not ( = ?AUTO_743 ?AUTO_750 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_747 ?AUTO_743 ?AUTO_750 )
      ( GET_IMAGE ?AUTO_743 ?AUTO_744 )
      ( GET_IMAGE-VERIFY ?AUTO_743 ?AUTO_744 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_752 - DIRECTION
      ?AUTO_753 - MODE
    )
    :vars
    (
      ?AUTO_756 - INSTRUMENT
      ?AUTO_758 - SATELLITE
      ?AUTO_755 - DIRECTION
      ?AUTO_760 - SATELLITE
      ?AUTO_761 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_756 ?AUTO_758 ) ( SUPPORTS ?AUTO_756 ?AUTO_753 ) ( POWER_ON ?AUTO_756 ) ( POINTING ?AUTO_758 ?AUTO_755 ) ( not ( = ?AUTO_752 ?AUTO_755 ) ) ( ON_BOARD ?AUTO_756 ?AUTO_760 ) ( CALIBRATION_TARGET ?AUTO_756 ?AUTO_761 ) ( POINTING ?AUTO_760 ?AUTO_761 ) ( NOT_CALIBRATED ?AUTO_756 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_760 ?AUTO_756 ?AUTO_761 )
      ( GET_IMAGE ?AUTO_752 ?AUTO_753 )
      ( GET_IMAGE-VERIFY ?AUTO_752 ?AUTO_753 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_762 - DIRECTION
      ?AUTO_763 - MODE
    )
    :vars
    (
      ?AUTO_770 - INSTRUMENT
      ?AUTO_766 - SATELLITE
      ?AUTO_765 - DIRECTION
      ?AUTO_767 - SATELLITE
      ?AUTO_768 - DIRECTION
      ?AUTO_772 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_770 ?AUTO_766 ) ( SUPPORTS ?AUTO_770 ?AUTO_763 ) ( POINTING ?AUTO_766 ?AUTO_765 ) ( not ( = ?AUTO_762 ?AUTO_765 ) ) ( ON_BOARD ?AUTO_770 ?AUTO_767 ) ( CALIBRATION_TARGET ?AUTO_770 ?AUTO_768 ) ( POINTING ?AUTO_767 ?AUTO_768 ) ( ON_BOARD ?AUTO_770 ?AUTO_772 ) ( POWER_AVAIL ?AUTO_772 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_770 ?AUTO_772 )
      ( GET_IMAGE ?AUTO_762 ?AUTO_763 )
      ( GET_IMAGE-VERIFY ?AUTO_762 ?AUTO_763 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_773 - DIRECTION
      ?AUTO_774 - MODE
    )
    :vars
    (
      ?AUTO_781 - INSTRUMENT
      ?AUTO_777 - SATELLITE
      ?AUTO_776 - DIRECTION
      ?AUTO_778 - SATELLITE
      ?AUTO_780 - DIRECTION
      ?AUTO_782 - SATELLITE
      ?AUTO_783 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_781 ?AUTO_777 ) ( SUPPORTS ?AUTO_781 ?AUTO_774 ) ( POINTING ?AUTO_777 ?AUTO_776 ) ( not ( = ?AUTO_773 ?AUTO_776 ) ) ( ON_BOARD ?AUTO_781 ?AUTO_778 ) ( CALIBRATION_TARGET ?AUTO_781 ?AUTO_780 ) ( POINTING ?AUTO_778 ?AUTO_780 ) ( ON_BOARD ?AUTO_781 ?AUTO_782 ) ( ON_BOARD ?AUTO_783 ?AUTO_782 ) ( POWER_ON ?AUTO_783 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_783 ?AUTO_782 )
      ( GET_IMAGE ?AUTO_773 ?AUTO_774 )
      ( GET_IMAGE-VERIFY ?AUTO_773 ?AUTO_774 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_787 - DIRECTION
      ?AUTO_788 - MODE
    )
    :vars
    (
      ?AUTO_792 - INSTRUMENT
      ?AUTO_794 - SATELLITE
      ?AUTO_795 - DIRECTION
      ?AUTO_790 - SATELLITE
      ?AUTO_789 - INSTRUMENT
      ?AUTO_799 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_792 ?AUTO_794 ) ( SUPPORTS ?AUTO_792 ?AUTO_788 ) ( not ( = ?AUTO_787 ?AUTO_795 ) ) ( CALIBRATION_TARGET ?AUTO_792 ?AUTO_795 ) ( ON_BOARD ?AUTO_792 ?AUTO_790 ) ( ON_BOARD ?AUTO_789 ?AUTO_790 ) ( POWER_ON ?AUTO_789 ) ( POINTING ?AUTO_794 ?AUTO_799 ) ( not ( = ?AUTO_795 ?AUTO_799 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_794 ?AUTO_795 ?AUTO_799 )
      ( GET_IMAGE ?AUTO_787 ?AUTO_788 )
      ( GET_IMAGE-VERIFY ?AUTO_787 ?AUTO_788 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_803 - DIRECTION
      ?AUTO_804 - MODE
    )
    :vars
    (
      ?AUTO_805 - INSTRUMENT
      ?AUTO_806 - SATELLITE
      ?AUTO_808 - DIRECTION
      ?AUTO_811 - SATELLITE
      ?AUTO_810 - INSTRUMENT
      ?AUTO_807 - DIRECTION
      ?AUTO_814 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_805 ?AUTO_806 ) ( SUPPORTS ?AUTO_805 ?AUTO_804 ) ( not ( = ?AUTO_803 ?AUTO_808 ) ) ( CALIBRATION_TARGET ?AUTO_805 ?AUTO_808 ) ( ON_BOARD ?AUTO_805 ?AUTO_811 ) ( ON_BOARD ?AUTO_810 ?AUTO_811 ) ( POINTING ?AUTO_806 ?AUTO_807 ) ( not ( = ?AUTO_808 ?AUTO_807 ) ) ( ON_BOARD ?AUTO_810 ?AUTO_814 ) ( POWER_AVAIL ?AUTO_814 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_810 ?AUTO_814 )
      ( GET_IMAGE ?AUTO_803 ?AUTO_804 )
      ( GET_IMAGE-VERIFY ?AUTO_803 ?AUTO_804 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_817 - DIRECTION
      ?AUTO_818 - MODE
    )
    :vars
    (
      ?AUTO_819 - INSTRUMENT
      ?AUTO_820 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_819 ) ( ON_BOARD ?AUTO_819 ?AUTO_820 ) ( SUPPORTS ?AUTO_819 ?AUTO_818 ) ( POWER_ON ?AUTO_819 ) ( POINTING ?AUTO_820 ?AUTO_817 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_820 ?AUTO_817 ?AUTO_819 ?AUTO_818 )
      ( GET_IMAGE-VERIFY ?AUTO_817 ?AUTO_818 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_823 - DIRECTION
      ?AUTO_824 - MODE
    )
    :vars
    (
      ?AUTO_827 - INSTRUMENT
      ?AUTO_828 - SATELLITE
      ?AUTO_830 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_827 ) ( ON_BOARD ?AUTO_827 ?AUTO_828 ) ( SUPPORTS ?AUTO_827 ?AUTO_824 ) ( POWER_ON ?AUTO_827 ) ( POINTING ?AUTO_828 ?AUTO_830 ) ( not ( = ?AUTO_823 ?AUTO_830 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_828 ?AUTO_823 ?AUTO_830 )
      ( GET_IMAGE ?AUTO_823 ?AUTO_824 )
      ( GET_IMAGE-VERIFY ?AUTO_823 ?AUTO_824 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_832 - DIRECTION
      ?AUTO_833 - MODE
    )
    :vars
    (
      ?AUTO_836 - INSTRUMENT
      ?AUTO_837 - SATELLITE
      ?AUTO_838 - DIRECTION
      ?AUTO_840 - SATELLITE
      ?AUTO_841 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_836 ?AUTO_837 ) ( SUPPORTS ?AUTO_836 ?AUTO_833 ) ( POWER_ON ?AUTO_836 ) ( POINTING ?AUTO_837 ?AUTO_838 ) ( not ( = ?AUTO_832 ?AUTO_838 ) ) ( ON_BOARD ?AUTO_836 ?AUTO_840 ) ( CALIBRATION_TARGET ?AUTO_836 ?AUTO_841 ) ( POINTING ?AUTO_840 ?AUTO_841 ) ( NOT_CALIBRATED ?AUTO_836 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_840 ?AUTO_836 ?AUTO_841 )
      ( GET_IMAGE ?AUTO_832 ?AUTO_833 )
      ( GET_IMAGE-VERIFY ?AUTO_832 ?AUTO_833 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_842 - DIRECTION
      ?AUTO_843 - MODE
    )
    :vars
    (
      ?AUTO_847 - INSTRUMENT
      ?AUTO_848 - SATELLITE
      ?AUTO_845 - DIRECTION
      ?AUTO_849 - SATELLITE
      ?AUTO_850 - DIRECTION
      ?AUTO_852 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_847 ?AUTO_848 ) ( SUPPORTS ?AUTO_847 ?AUTO_843 ) ( POINTING ?AUTO_848 ?AUTO_845 ) ( not ( = ?AUTO_842 ?AUTO_845 ) ) ( ON_BOARD ?AUTO_847 ?AUTO_849 ) ( CALIBRATION_TARGET ?AUTO_847 ?AUTO_850 ) ( POINTING ?AUTO_849 ?AUTO_850 ) ( ON_BOARD ?AUTO_847 ?AUTO_852 ) ( POWER_AVAIL ?AUTO_852 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_847 ?AUTO_852 )
      ( GET_IMAGE ?AUTO_842 ?AUTO_843 )
      ( GET_IMAGE-VERIFY ?AUTO_842 ?AUTO_843 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_853 - DIRECTION
      ?AUTO_854 - MODE
    )
    :vars
    (
      ?AUTO_858 - INSTRUMENT
      ?AUTO_859 - SATELLITE
      ?AUTO_856 - DIRECTION
      ?AUTO_855 - SATELLITE
      ?AUTO_864 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_858 ?AUTO_859 ) ( SUPPORTS ?AUTO_858 ?AUTO_854 ) ( not ( = ?AUTO_853 ?AUTO_856 ) ) ( CALIBRATION_TARGET ?AUTO_858 ?AUTO_856 ) ( ON_BOARD ?AUTO_858 ?AUTO_855 ) ( POWER_AVAIL ?AUTO_855 ) ( POINTING ?AUTO_859 ?AUTO_864 ) ( not ( = ?AUTO_856 ?AUTO_864 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_859 ?AUTO_856 ?AUTO_864 )
      ( GET_IMAGE ?AUTO_853 ?AUTO_854 )
      ( GET_IMAGE-VERIFY ?AUTO_853 ?AUTO_854 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_868 - DIRECTION
      ?AUTO_869 - MODE
    )
    :vars
    (
      ?AUTO_870 - INSTRUMENT
      ?AUTO_871 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_870 ) ( ON_BOARD ?AUTO_870 ?AUTO_871 ) ( SUPPORTS ?AUTO_870 ?AUTO_869 ) ( POWER_ON ?AUTO_870 ) ( POINTING ?AUTO_871 ?AUTO_868 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_871 ?AUTO_868 ?AUTO_870 ?AUTO_869 )
      ( GET_IMAGE-VERIFY ?AUTO_868 ?AUTO_869 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_874 - DIRECTION
      ?AUTO_875 - MODE
    )
    :vars
    (
      ?AUTO_878 - INSTRUMENT
      ?AUTO_879 - SATELLITE
      ?AUTO_881 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_878 ) ( ON_BOARD ?AUTO_878 ?AUTO_879 ) ( SUPPORTS ?AUTO_878 ?AUTO_875 ) ( POWER_ON ?AUTO_878 ) ( POINTING ?AUTO_879 ?AUTO_881 ) ( not ( = ?AUTO_874 ?AUTO_881 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_879 ?AUTO_874 ?AUTO_881 )
      ( GET_IMAGE ?AUTO_874 ?AUTO_875 )
      ( GET_IMAGE-VERIFY ?AUTO_874 ?AUTO_875 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_897 - DIRECTION
      ?AUTO_898 - MODE
    )
    :vars
    (
      ?AUTO_899 - INSTRUMENT
      ?AUTO_900 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_899 ) ( ON_BOARD ?AUTO_899 ?AUTO_900 ) ( SUPPORTS ?AUTO_899 ?AUTO_898 ) ( POWER_ON ?AUTO_899 ) ( POINTING ?AUTO_900 ?AUTO_897 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_900 ?AUTO_897 ?AUTO_899 ?AUTO_898 )
      ( GET_IMAGE-VERIFY ?AUTO_897 ?AUTO_898 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_903 - DIRECTION
      ?AUTO_904 - MODE
    )
    :vars
    (
      ?AUTO_907 - INSTRUMENT
      ?AUTO_908 - SATELLITE
      ?AUTO_910 - SATELLITE
      ?AUTO_911 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_907 ?AUTO_908 ) ( SUPPORTS ?AUTO_907 ?AUTO_904 ) ( POWER_ON ?AUTO_907 ) ( POINTING ?AUTO_908 ?AUTO_903 ) ( ON_BOARD ?AUTO_907 ?AUTO_910 ) ( CALIBRATION_TARGET ?AUTO_907 ?AUTO_911 ) ( POINTING ?AUTO_910 ?AUTO_911 ) ( NOT_CALIBRATED ?AUTO_907 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_910 ?AUTO_907 ?AUTO_911 )
      ( GET_IMAGE ?AUTO_903 ?AUTO_904 )
      ( GET_IMAGE-VERIFY ?AUTO_903 ?AUTO_904 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_919 - DIRECTION
      ?AUTO_913 - MODE
    )
    :vars
    (
      ?AUTO_917 - INSTRUMENT
      ?AUTO_918 - SATELLITE
      ?AUTO_921 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_917 ?AUTO_918 ) ( SUPPORTS ?AUTO_917 ?AUTO_913 ) ( POWER_ON ?AUTO_917 ) ( CALIBRATION_TARGET ?AUTO_917 ?AUTO_919 ) ( NOT_CALIBRATED ?AUTO_917 ) ( POINTING ?AUTO_918 ?AUTO_921 ) ( not ( = ?AUTO_919 ?AUTO_921 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_918 ?AUTO_919 ?AUTO_921 )
      ( GET_IMAGE ?AUTO_919 ?AUTO_913 )
      ( GET_IMAGE-VERIFY ?AUTO_919 ?AUTO_913 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_923 - DIRECTION
      ?AUTO_924 - MODE
    )
    :vars
    (
      ?AUTO_929 - INSTRUMENT
      ?AUTO_928 - SATELLITE
      ?AUTO_926 - DIRECTION
      ?AUTO_931 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_929 ?AUTO_928 ) ( SUPPORTS ?AUTO_929 ?AUTO_924 ) ( CALIBRATION_TARGET ?AUTO_929 ?AUTO_923 ) ( POINTING ?AUTO_928 ?AUTO_926 ) ( not ( = ?AUTO_923 ?AUTO_926 ) ) ( ON_BOARD ?AUTO_929 ?AUTO_931 ) ( POWER_AVAIL ?AUTO_931 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_929 ?AUTO_931 )
      ( GET_IMAGE ?AUTO_923 ?AUTO_924 )
      ( GET_IMAGE-VERIFY ?AUTO_923 ?AUTO_924 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_932 - DIRECTION
      ?AUTO_933 - MODE
    )
    :vars
    (
      ?AUTO_936 - INSTRUMENT
      ?AUTO_934 - SATELLITE
      ?AUTO_935 - DIRECTION
      ?AUTO_937 - SATELLITE
      ?AUTO_940 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_936 ?AUTO_934 ) ( SUPPORTS ?AUTO_936 ?AUTO_933 ) ( CALIBRATION_TARGET ?AUTO_936 ?AUTO_932 ) ( POINTING ?AUTO_934 ?AUTO_935 ) ( not ( = ?AUTO_932 ?AUTO_935 ) ) ( ON_BOARD ?AUTO_936 ?AUTO_937 ) ( ON_BOARD ?AUTO_940 ?AUTO_937 ) ( POWER_ON ?AUTO_940 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_940 ?AUTO_937 )
      ( GET_IMAGE ?AUTO_932 ?AUTO_933 )
      ( GET_IMAGE-VERIFY ?AUTO_932 ?AUTO_933 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_944 - DIRECTION
      ?AUTO_945 - MODE
    )
    :vars
    (
      ?AUTO_948 - INSTRUMENT
      ?AUTO_951 - SATELLITE
      ?AUTO_947 - DIRECTION
      ?AUTO_949 - SATELLITE
      ?AUTO_946 - INSTRUMENT
      ?AUTO_954 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_948 ?AUTO_951 ) ( SUPPORTS ?AUTO_948 ?AUTO_945 ) ( CALIBRATION_TARGET ?AUTO_948 ?AUTO_944 ) ( not ( = ?AUTO_944 ?AUTO_947 ) ) ( ON_BOARD ?AUTO_948 ?AUTO_949 ) ( ON_BOARD ?AUTO_946 ?AUTO_949 ) ( POWER_ON ?AUTO_946 ) ( POINTING ?AUTO_951 ?AUTO_954 ) ( not ( = ?AUTO_947 ?AUTO_954 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_951 ?AUTO_947 ?AUTO_954 )
      ( GET_IMAGE ?AUTO_944 ?AUTO_945 )
      ( GET_IMAGE-VERIFY ?AUTO_944 ?AUTO_945 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_970 - DIRECTION
      ?AUTO_971 - MODE
    )
    :vars
    (
      ?AUTO_972 - INSTRUMENT
      ?AUTO_973 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_972 ) ( ON_BOARD ?AUTO_972 ?AUTO_973 ) ( SUPPORTS ?AUTO_972 ?AUTO_971 ) ( POWER_ON ?AUTO_972 ) ( POINTING ?AUTO_973 ?AUTO_970 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_973 ?AUTO_970 ?AUTO_972 ?AUTO_971 )
      ( GET_IMAGE-VERIFY ?AUTO_970 ?AUTO_971 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_976 - DIRECTION
      ?AUTO_977 - MODE
    )
    :vars
    (
      ?AUTO_980 - INSTRUMENT
      ?AUTO_978 - SATELLITE
      ?AUTO_983 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_980 ) ( ON_BOARD ?AUTO_980 ?AUTO_978 ) ( SUPPORTS ?AUTO_980 ?AUTO_977 ) ( POWER_ON ?AUTO_980 ) ( POINTING ?AUTO_978 ?AUTO_983 ) ( not ( = ?AUTO_976 ?AUTO_983 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_978 ?AUTO_976 ?AUTO_983 )
      ( GET_IMAGE ?AUTO_976 ?AUTO_977 )
      ( GET_IMAGE-VERIFY ?AUTO_976 ?AUTO_977 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_987 - DIRECTION
      ?AUTO_988 - MODE
    )
    :vars
    (
      ?AUTO_992 - INSTRUMENT
      ?AUTO_990 - SATELLITE
      ?AUTO_991 - DIRECTION
      ?AUTO_995 - SATELLITE
      ?AUTO_996 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_992 ?AUTO_990 ) ( SUPPORTS ?AUTO_992 ?AUTO_988 ) ( POWER_ON ?AUTO_992 ) ( POINTING ?AUTO_990 ?AUTO_991 ) ( not ( = ?AUTO_987 ?AUTO_991 ) ) ( ON_BOARD ?AUTO_992 ?AUTO_995 ) ( CALIBRATION_TARGET ?AUTO_992 ?AUTO_996 ) ( POINTING ?AUTO_995 ?AUTO_996 ) ( NOT_CALIBRATED ?AUTO_992 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_995 ?AUTO_992 ?AUTO_996 )
      ( GET_IMAGE ?AUTO_987 ?AUTO_988 )
      ( GET_IMAGE-VERIFY ?AUTO_987 ?AUTO_988 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_997 - DIRECTION
      ?AUTO_998 - MODE
    )
    :vars
    (
      ?AUTO_1001 - INSTRUMENT
      ?AUTO_1004 - SATELLITE
      ?AUTO_1005 - DIRECTION
      ?AUTO_1007 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_1001 ?AUTO_1004 ) ( SUPPORTS ?AUTO_1001 ?AUTO_998 ) ( POWER_ON ?AUTO_1001 ) ( not ( = ?AUTO_997 ?AUTO_1005 ) ) ( CALIBRATION_TARGET ?AUTO_1001 ?AUTO_1005 ) ( NOT_CALIBRATED ?AUTO_1001 ) ( POINTING ?AUTO_1004 ?AUTO_1007 ) ( not ( = ?AUTO_1005 ?AUTO_1007 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_1004 ?AUTO_1005 ?AUTO_1007 )
      ( GET_IMAGE ?AUTO_997 ?AUTO_998 )
      ( GET_IMAGE-VERIFY ?AUTO_997 ?AUTO_998 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_1009 - DIRECTION
      ?AUTO_1010 - MODE
    )
    :vars
    (
      ?AUTO_1014 - INSTRUMENT
      ?AUTO_1015 - SATELLITE
      ?AUTO_1016 - DIRECTION
      ?AUTO_1012 - DIRECTION
      ?AUTO_1018 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_1014 ?AUTO_1015 ) ( SUPPORTS ?AUTO_1014 ?AUTO_1010 ) ( not ( = ?AUTO_1009 ?AUTO_1016 ) ) ( CALIBRATION_TARGET ?AUTO_1014 ?AUTO_1016 ) ( POINTING ?AUTO_1015 ?AUTO_1012 ) ( not ( = ?AUTO_1016 ?AUTO_1012 ) ) ( ON_BOARD ?AUTO_1014 ?AUTO_1018 ) ( POWER_AVAIL ?AUTO_1018 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_1014 ?AUTO_1018 )
      ( GET_IMAGE ?AUTO_1009 ?AUTO_1010 )
      ( GET_IMAGE-VERIFY ?AUTO_1009 ?AUTO_1010 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_1019 - DIRECTION
      ?AUTO_1020 - MODE
    )
    :vars
    (
      ?AUTO_1027 - INSTRUMENT
      ?AUTO_1022 - SATELLITE
      ?AUTO_1024 - DIRECTION
      ?AUTO_1021 - DIRECTION
      ?AUTO_1025 - SATELLITE
      ?AUTO_1028 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_1027 ?AUTO_1022 ) ( SUPPORTS ?AUTO_1027 ?AUTO_1020 ) ( not ( = ?AUTO_1019 ?AUTO_1024 ) ) ( CALIBRATION_TARGET ?AUTO_1027 ?AUTO_1024 ) ( POINTING ?AUTO_1022 ?AUTO_1021 ) ( not ( = ?AUTO_1024 ?AUTO_1021 ) ) ( ON_BOARD ?AUTO_1027 ?AUTO_1025 ) ( ON_BOARD ?AUTO_1028 ?AUTO_1025 ) ( POWER_ON ?AUTO_1028 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_1028 ?AUTO_1025 )
      ( GET_IMAGE ?AUTO_1019 ?AUTO_1020 )
      ( GET_IMAGE-VERIFY ?AUTO_1019 ?AUTO_1020 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_1032 - DIRECTION
      ?AUTO_1033 - MODE
    )
    :vars
    (
      ?AUTO_1039 - INSTRUMENT
      ?AUTO_1035 - SATELLITE
      ?AUTO_1038 - DIRECTION
      ?AUTO_1036 - DIRECTION
      ?AUTO_1037 - SATELLITE
      ?AUTO_1040 - INSTRUMENT
      ?AUTO_1043 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_1039 ?AUTO_1035 ) ( SUPPORTS ?AUTO_1039 ?AUTO_1033 ) ( not ( = ?AUTO_1032 ?AUTO_1038 ) ) ( CALIBRATION_TARGET ?AUTO_1039 ?AUTO_1038 ) ( not ( = ?AUTO_1038 ?AUTO_1036 ) ) ( ON_BOARD ?AUTO_1039 ?AUTO_1037 ) ( ON_BOARD ?AUTO_1040 ?AUTO_1037 ) ( POWER_ON ?AUTO_1040 ) ( POINTING ?AUTO_1035 ?AUTO_1043 ) ( not ( = ?AUTO_1036 ?AUTO_1043 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_1035 ?AUTO_1036 ?AUTO_1043 )
      ( GET_IMAGE ?AUTO_1032 ?AUTO_1033 )
      ( GET_IMAGE-VERIFY ?AUTO_1032 ?AUTO_1033 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_1059 - DIRECTION
      ?AUTO_1060 - MODE
    )
    :vars
    (
      ?AUTO_1061 - INSTRUMENT
      ?AUTO_1062 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_1061 ) ( ON_BOARD ?AUTO_1061 ?AUTO_1062 ) ( SUPPORTS ?AUTO_1061 ?AUTO_1060 ) ( POWER_ON ?AUTO_1061 ) ( POINTING ?AUTO_1062 ?AUTO_1059 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_1062 ?AUTO_1059 ?AUTO_1061 ?AUTO_1060 )
      ( GET_IMAGE-VERIFY ?AUTO_1059 ?AUTO_1060 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_1065 - DIRECTION
      ?AUTO_1066 - MODE
    )
    :vars
    (
      ?AUTO_1069 - INSTRUMENT
      ?AUTO_1070 - SATELLITE
      ?AUTO_1072 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_1069 ) ( ON_BOARD ?AUTO_1069 ?AUTO_1070 ) ( SUPPORTS ?AUTO_1069 ?AUTO_1066 ) ( POWER_ON ?AUTO_1069 ) ( POINTING ?AUTO_1070 ?AUTO_1072 ) ( not ( = ?AUTO_1065 ?AUTO_1072 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_1070 ?AUTO_1065 ?AUTO_1072 )
      ( GET_IMAGE ?AUTO_1065 ?AUTO_1066 )
      ( GET_IMAGE-VERIFY ?AUTO_1065 ?AUTO_1066 ) )
  )

)

