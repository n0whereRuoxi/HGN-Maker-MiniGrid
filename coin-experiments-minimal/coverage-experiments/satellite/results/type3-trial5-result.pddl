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
      ?AUTO_15 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_12 ) ( ON_BOARD ?AUTO_12 ?AUTO_13 ) ( SUPPORTS ?AUTO_12 ?AUTO_9 ) ( POWER_ON ?AUTO_12 ) ( POINTING ?AUTO_13 ?AUTO_15 ) ( not ( = ?AUTO_8 ?AUTO_15 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_13 ?AUTO_8 ?AUTO_15 )
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
      ?AUTO_19 - SATELLITE
      ?AUTO_23 - DIRECTION
      ?AUTO_25 - SATELLITE
      ?AUTO_26 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_20 ?AUTO_19 ) ( SUPPORTS ?AUTO_20 ?AUTO_18 ) ( POWER_ON ?AUTO_20 ) ( POINTING ?AUTO_19 ?AUTO_23 ) ( not ( = ?AUTO_17 ?AUTO_23 ) ) ( ON_BOARD ?AUTO_20 ?AUTO_25 ) ( CALIBRATION_TARGET ?AUTO_20 ?AUTO_26 ) ( POINTING ?AUTO_25 ?AUTO_26 ) ( NOT_CALIBRATED ?AUTO_20 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_25 ?AUTO_20 ?AUTO_26 )
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
      ?AUTO_33 - INSTRUMENT
      ?AUTO_34 - SATELLITE
      ?AUTO_30 - DIRECTION
      ?AUTO_31 - SATELLITE
      ?AUTO_35 - DIRECTION
      ?AUTO_37 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_33 ?AUTO_34 ) ( SUPPORTS ?AUTO_33 ?AUTO_28 ) ( POINTING ?AUTO_34 ?AUTO_30 ) ( not ( = ?AUTO_27 ?AUTO_30 ) ) ( ON_BOARD ?AUTO_33 ?AUTO_31 ) ( CALIBRATION_TARGET ?AUTO_33 ?AUTO_35 ) ( POINTING ?AUTO_31 ?AUTO_35 ) ( ON_BOARD ?AUTO_33 ?AUTO_37 ) ( POWER_AVAIL ?AUTO_37 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_33 ?AUTO_37 )
      ( GET_IMAGE ?AUTO_27 ?AUTO_28 )
      ( GET_IMAGE-VERIFY ?AUTO_27 ?AUTO_28 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_38 - DIRECTION
      ?AUTO_39 - MODE
    )
    :vars
    (
      ?AUTO_45 - INSTRUMENT
      ?AUTO_44 - SATELLITE
      ?AUTO_46 - DIRECTION
      ?AUTO_47 - SATELLITE
      ?AUTO_49 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_45 ?AUTO_44 ) ( SUPPORTS ?AUTO_45 ?AUTO_39 ) ( not ( = ?AUTO_38 ?AUTO_46 ) ) ( CALIBRATION_TARGET ?AUTO_45 ?AUTO_46 ) ( ON_BOARD ?AUTO_45 ?AUTO_47 ) ( POWER_AVAIL ?AUTO_47 ) ( POINTING ?AUTO_44 ?AUTO_49 ) ( not ( = ?AUTO_46 ?AUTO_49 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_44 ?AUTO_46 ?AUTO_49 )
      ( GET_IMAGE ?AUTO_38 ?AUTO_39 )
      ( GET_IMAGE-VERIFY ?AUTO_38 ?AUTO_39 ) )
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
      ?AUTO_59 - DIRECTION
      ?AUTO_60 - MODE
    )
    :vars
    (
      ?AUTO_64 - INSTRUMENT
      ?AUTO_61 - SATELLITE
      ?AUTO_66 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_64 ) ( ON_BOARD ?AUTO_64 ?AUTO_61 ) ( SUPPORTS ?AUTO_64 ?AUTO_60 ) ( POWER_ON ?AUTO_64 ) ( POINTING ?AUTO_61 ?AUTO_66 ) ( not ( = ?AUTO_59 ?AUTO_66 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_61 ?AUTO_59 ?AUTO_66 )
      ( GET_IMAGE ?AUTO_59 ?AUTO_60 )
      ( GET_IMAGE-VERIFY ?AUTO_59 ?AUTO_60 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_68 - DIRECTION
      ?AUTO_69 - MODE
    )
    :vars
    (
      ?AUTO_72 - INSTRUMENT
      ?AUTO_73 - SATELLITE
      ?AUTO_74 - DIRECTION
      ?AUTO_76 - SATELLITE
      ?AUTO_77 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_72 ?AUTO_73 ) ( SUPPORTS ?AUTO_72 ?AUTO_69 ) ( POWER_ON ?AUTO_72 ) ( POINTING ?AUTO_73 ?AUTO_74 ) ( not ( = ?AUTO_68 ?AUTO_74 ) ) ( ON_BOARD ?AUTO_72 ?AUTO_76 ) ( CALIBRATION_TARGET ?AUTO_72 ?AUTO_77 ) ( POINTING ?AUTO_76 ?AUTO_77 ) ( NOT_CALIBRATED ?AUTO_72 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_76 ?AUTO_72 ?AUTO_77 )
      ( GET_IMAGE ?AUTO_68 ?AUTO_69 )
      ( GET_IMAGE-VERIFY ?AUTO_68 ?AUTO_69 ) )
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
      ?AUTO_86 - SATELLITE
      ?AUTO_81 - DIRECTION
      ?AUTO_82 - SATELLITE
      ?AUTO_83 - DIRECTION
      ?AUTO_88 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_85 ?AUTO_86 ) ( SUPPORTS ?AUTO_85 ?AUTO_79 ) ( POINTING ?AUTO_86 ?AUTO_81 ) ( not ( = ?AUTO_78 ?AUTO_81 ) ) ( ON_BOARD ?AUTO_85 ?AUTO_82 ) ( CALIBRATION_TARGET ?AUTO_85 ?AUTO_83 ) ( POINTING ?AUTO_82 ?AUTO_83 ) ( ON_BOARD ?AUTO_85 ?AUTO_88 ) ( POWER_AVAIL ?AUTO_88 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_85 ?AUTO_88 )
      ( GET_IMAGE ?AUTO_78 ?AUTO_79 )
      ( GET_IMAGE-VERIFY ?AUTO_78 ?AUTO_79 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_89 - DIRECTION
      ?AUTO_90 - MODE
    )
    :vars
    (
      ?AUTO_91 - INSTRUMENT
      ?AUTO_95 - SATELLITE
      ?AUTO_96 - DIRECTION
      ?AUTO_98 - SATELLITE
      ?AUTO_100 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_91 ?AUTO_95 ) ( SUPPORTS ?AUTO_91 ?AUTO_90 ) ( not ( = ?AUTO_89 ?AUTO_96 ) ) ( CALIBRATION_TARGET ?AUTO_91 ?AUTO_96 ) ( ON_BOARD ?AUTO_91 ?AUTO_98 ) ( POWER_AVAIL ?AUTO_98 ) ( POINTING ?AUTO_95 ?AUTO_100 ) ( not ( = ?AUTO_96 ?AUTO_100 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_95 ?AUTO_96 ?AUTO_100 )
      ( GET_IMAGE ?AUTO_89 ?AUTO_90 )
      ( GET_IMAGE-VERIFY ?AUTO_89 ?AUTO_90 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_102 - DIRECTION
      ?AUTO_103 - MODE
    )
    :vars
    (
      ?AUTO_105 - INSTRUMENT
      ?AUTO_106 - SATELLITE
      ?AUTO_104 - DIRECTION
      ?AUTO_107 - SATELLITE
      ?AUTO_108 - DIRECTION
      ?AUTO_111 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_105 ?AUTO_106 ) ( SUPPORTS ?AUTO_105 ?AUTO_103 ) ( not ( = ?AUTO_102 ?AUTO_104 ) ) ( CALIBRATION_TARGET ?AUTO_105 ?AUTO_104 ) ( ON_BOARD ?AUTO_105 ?AUTO_107 ) ( POINTING ?AUTO_106 ?AUTO_108 ) ( not ( = ?AUTO_104 ?AUTO_108 ) ) ( ON_BOARD ?AUTO_111 ?AUTO_107 ) ( POWER_ON ?AUTO_111 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_111 ?AUTO_107 )
      ( GET_IMAGE ?AUTO_102 ?AUTO_103 )
      ( GET_IMAGE-VERIFY ?AUTO_102 ?AUTO_103 ) )
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
    ( and ( CALIBRATED ?AUTO_127 ) ( ON_BOARD ?AUTO_127 ?AUTO_128 ) ( SUPPORTS ?AUTO_127 ?AUTO_126 ) ( POWER_ON ?AUTO_127 ) ( POINTING ?AUTO_128 ?AUTO_125 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_128 ?AUTO_125 ?AUTO_127 ?AUTO_126 )
      ( GET_IMAGE-VERIFY ?AUTO_125 ?AUTO_126 ) )
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
      ?AUTO_136 - SATELLITE
      ?AUTO_138 - SATELLITE
      ?AUTO_139 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_135 ?AUTO_136 ) ( SUPPORTS ?AUTO_135 ?AUTO_132 ) ( POWER_ON ?AUTO_135 ) ( POINTING ?AUTO_136 ?AUTO_131 ) ( ON_BOARD ?AUTO_135 ?AUTO_138 ) ( CALIBRATION_TARGET ?AUTO_135 ?AUTO_139 ) ( POINTING ?AUTO_138 ?AUTO_139 ) ( NOT_CALIBRATED ?AUTO_135 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_138 ?AUTO_135 ?AUTO_139 )
      ( GET_IMAGE ?AUTO_131 ?AUTO_132 )
      ( GET_IMAGE-VERIFY ?AUTO_131 ?AUTO_132 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_147 - DIRECTION
      ?AUTO_141 - MODE
    )
    :vars
    (
      ?AUTO_145 - INSTRUMENT
      ?AUTO_146 - SATELLITE
      ?AUTO_149 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_145 ?AUTO_146 ) ( SUPPORTS ?AUTO_145 ?AUTO_141 ) ( POWER_ON ?AUTO_145 ) ( CALIBRATION_TARGET ?AUTO_145 ?AUTO_147 ) ( NOT_CALIBRATED ?AUTO_145 ) ( POINTING ?AUTO_146 ?AUTO_149 ) ( not ( = ?AUTO_147 ?AUTO_149 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_146 ?AUTO_147 ?AUTO_149 )
      ( GET_IMAGE ?AUTO_147 ?AUTO_141 )
      ( GET_IMAGE-VERIFY ?AUTO_147 ?AUTO_141 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_151 - DIRECTION
      ?AUTO_152 - MODE
    )
    :vars
    (
      ?AUTO_157 - INSTRUMENT
      ?AUTO_156 - SATELLITE
      ?AUTO_154 - DIRECTION
      ?AUTO_159 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_157 ?AUTO_156 ) ( SUPPORTS ?AUTO_157 ?AUTO_152 ) ( CALIBRATION_TARGET ?AUTO_157 ?AUTO_151 ) ( POINTING ?AUTO_156 ?AUTO_154 ) ( not ( = ?AUTO_151 ?AUTO_154 ) ) ( ON_BOARD ?AUTO_157 ?AUTO_159 ) ( POWER_AVAIL ?AUTO_159 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_157 ?AUTO_159 )
      ( GET_IMAGE ?AUTO_151 ?AUTO_152 )
      ( GET_IMAGE-VERIFY ?AUTO_151 ?AUTO_152 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_160 - DIRECTION
      ?AUTO_161 - MODE
    )
    :vars
    (
      ?AUTO_164 - INSTRUMENT
      ?AUTO_162 - SATELLITE
      ?AUTO_163 - DIRECTION
      ?AUTO_165 - SATELLITE
      ?AUTO_168 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_164 ?AUTO_162 ) ( SUPPORTS ?AUTO_164 ?AUTO_161 ) ( CALIBRATION_TARGET ?AUTO_164 ?AUTO_160 ) ( POINTING ?AUTO_162 ?AUTO_163 ) ( not ( = ?AUTO_160 ?AUTO_163 ) ) ( ON_BOARD ?AUTO_164 ?AUTO_165 ) ( ON_BOARD ?AUTO_168 ?AUTO_165 ) ( POWER_ON ?AUTO_168 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_168 ?AUTO_165 )
      ( GET_IMAGE ?AUTO_160 ?AUTO_161 )
      ( GET_IMAGE-VERIFY ?AUTO_160 ?AUTO_161 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_172 - DIRECTION
      ?AUTO_173 - MODE
    )
    :vars
    (
      ?AUTO_175 - INSTRUMENT
      ?AUTO_176 - SATELLITE
      ?AUTO_174 - DIRECTION
      ?AUTO_179 - SATELLITE
      ?AUTO_180 - INSTRUMENT
      ?AUTO_182 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_175 ?AUTO_176 ) ( SUPPORTS ?AUTO_175 ?AUTO_173 ) ( CALIBRATION_TARGET ?AUTO_175 ?AUTO_172 ) ( not ( = ?AUTO_172 ?AUTO_174 ) ) ( ON_BOARD ?AUTO_175 ?AUTO_179 ) ( ON_BOARD ?AUTO_180 ?AUTO_179 ) ( POWER_ON ?AUTO_180 ) ( POINTING ?AUTO_176 ?AUTO_182 ) ( not ( = ?AUTO_174 ?AUTO_182 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_176 ?AUTO_174 ?AUTO_182 )
      ( GET_IMAGE ?AUTO_172 ?AUTO_173 )
      ( GET_IMAGE-VERIFY ?AUTO_172 ?AUTO_173 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_186 - DIRECTION
      ?AUTO_187 - MODE
    )
    :vars
    (
      ?AUTO_193 - INSTRUMENT
      ?AUTO_192 - SATELLITE
      ?AUTO_191 - DIRECTION
      ?AUTO_194 - SATELLITE
      ?AUTO_190 - INSTRUMENT
      ?AUTO_195 - DIRECTION
      ?AUTO_197 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_193 ?AUTO_192 ) ( SUPPORTS ?AUTO_193 ?AUTO_187 ) ( CALIBRATION_TARGET ?AUTO_193 ?AUTO_186 ) ( not ( = ?AUTO_186 ?AUTO_191 ) ) ( ON_BOARD ?AUTO_193 ?AUTO_194 ) ( ON_BOARD ?AUTO_190 ?AUTO_194 ) ( POINTING ?AUTO_192 ?AUTO_195 ) ( not ( = ?AUTO_191 ?AUTO_195 ) ) ( ON_BOARD ?AUTO_190 ?AUTO_197 ) ( POWER_AVAIL ?AUTO_197 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_190 ?AUTO_197 )
      ( GET_IMAGE ?AUTO_186 ?AUTO_187 )
      ( GET_IMAGE-VERIFY ?AUTO_186 ?AUTO_187 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_214 - DIRECTION
      ?AUTO_215 - MODE
    )
    :vars
    (
      ?AUTO_216 - INSTRUMENT
      ?AUTO_217 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_216 ) ( ON_BOARD ?AUTO_216 ?AUTO_217 ) ( SUPPORTS ?AUTO_216 ?AUTO_215 ) ( POWER_ON ?AUTO_216 ) ( POINTING ?AUTO_217 ?AUTO_214 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_217 ?AUTO_214 ?AUTO_216 ?AUTO_215 )
      ( GET_IMAGE-VERIFY ?AUTO_214 ?AUTO_215 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_220 - DIRECTION
      ?AUTO_221 - MODE
    )
    :vars
    (
      ?AUTO_224 - INSTRUMENT
      ?AUTO_225 - SATELLITE
      ?AUTO_227 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_224 ) ( ON_BOARD ?AUTO_224 ?AUTO_225 ) ( SUPPORTS ?AUTO_224 ?AUTO_221 ) ( POWER_ON ?AUTO_224 ) ( POINTING ?AUTO_225 ?AUTO_227 ) ( not ( = ?AUTO_220 ?AUTO_227 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_225 ?AUTO_220 ?AUTO_227 )
      ( GET_IMAGE ?AUTO_220 ?AUTO_221 )
      ( GET_IMAGE-VERIFY ?AUTO_220 ?AUTO_221 ) )
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
      ?AUTO_235 - SATELLITE
      ?AUTO_237 - DIRECTION
      ?AUTO_239 - SATELLITE
      ?AUTO_240 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_234 ?AUTO_235 ) ( SUPPORTS ?AUTO_234 ?AUTO_232 ) ( POWER_ON ?AUTO_234 ) ( POINTING ?AUTO_235 ?AUTO_237 ) ( not ( = ?AUTO_231 ?AUTO_237 ) ) ( ON_BOARD ?AUTO_234 ?AUTO_239 ) ( CALIBRATION_TARGET ?AUTO_234 ?AUTO_240 ) ( POINTING ?AUTO_239 ?AUTO_240 ) ( NOT_CALIBRATED ?AUTO_234 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_239 ?AUTO_234 ?AUTO_240 )
      ( GET_IMAGE ?AUTO_231 ?AUTO_232 )
      ( GET_IMAGE-VERIFY ?AUTO_231 ?AUTO_232 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_241 - DIRECTION
      ?AUTO_242 - MODE
    )
    :vars
    (
      ?AUTO_247 - INSTRUMENT
      ?AUTO_248 - SATELLITE
      ?AUTO_249 - DIRECTION
      ?AUTO_251 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_247 ?AUTO_248 ) ( SUPPORTS ?AUTO_247 ?AUTO_242 ) ( POWER_ON ?AUTO_247 ) ( not ( = ?AUTO_241 ?AUTO_249 ) ) ( CALIBRATION_TARGET ?AUTO_247 ?AUTO_249 ) ( NOT_CALIBRATED ?AUTO_247 ) ( POINTING ?AUTO_248 ?AUTO_251 ) ( not ( = ?AUTO_249 ?AUTO_251 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_248 ?AUTO_249 ?AUTO_251 )
      ( GET_IMAGE ?AUTO_241 ?AUTO_242 )
      ( GET_IMAGE-VERIFY ?AUTO_241 ?AUTO_242 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_253 - DIRECTION
      ?AUTO_254 - MODE
    )
    :vars
    (
      ?AUTO_260 - INSTRUMENT
      ?AUTO_258 - SATELLITE
      ?AUTO_259 - DIRECTION
      ?AUTO_256 - DIRECTION
      ?AUTO_262 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_260 ?AUTO_258 ) ( SUPPORTS ?AUTO_260 ?AUTO_254 ) ( not ( = ?AUTO_253 ?AUTO_259 ) ) ( CALIBRATION_TARGET ?AUTO_260 ?AUTO_259 ) ( POINTING ?AUTO_258 ?AUTO_256 ) ( not ( = ?AUTO_259 ?AUTO_256 ) ) ( ON_BOARD ?AUTO_260 ?AUTO_262 ) ( POWER_AVAIL ?AUTO_262 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_260 ?AUTO_262 )
      ( GET_IMAGE ?AUTO_253 ?AUTO_254 )
      ( GET_IMAGE-VERIFY ?AUTO_253 ?AUTO_254 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_263 - DIRECTION
      ?AUTO_264 - MODE
    )
    :vars
    (
      ?AUTO_268 - INSTRUMENT
      ?AUTO_271 - SATELLITE
      ?AUTO_266 - DIRECTION
      ?AUTO_265 - DIRECTION
      ?AUTO_269 - SATELLITE
      ?AUTO_272 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_268 ?AUTO_271 ) ( SUPPORTS ?AUTO_268 ?AUTO_264 ) ( not ( = ?AUTO_263 ?AUTO_266 ) ) ( CALIBRATION_TARGET ?AUTO_268 ?AUTO_266 ) ( POINTING ?AUTO_271 ?AUTO_265 ) ( not ( = ?AUTO_266 ?AUTO_265 ) ) ( ON_BOARD ?AUTO_268 ?AUTO_269 ) ( ON_BOARD ?AUTO_272 ?AUTO_269 ) ( POWER_ON ?AUTO_272 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_272 ?AUTO_269 )
      ( GET_IMAGE ?AUTO_263 ?AUTO_264 )
      ( GET_IMAGE-VERIFY ?AUTO_263 ?AUTO_264 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_276 - DIRECTION
      ?AUTO_277 - MODE
    )
    :vars
    (
      ?AUTO_282 - INSTRUMENT
      ?AUTO_283 - SATELLITE
      ?AUTO_279 - DIRECTION
      ?AUTO_280 - DIRECTION
      ?AUTO_281 - SATELLITE
      ?AUTO_284 - INSTRUMENT
      ?AUTO_287 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_282 ?AUTO_283 ) ( SUPPORTS ?AUTO_282 ?AUTO_277 ) ( not ( = ?AUTO_276 ?AUTO_279 ) ) ( CALIBRATION_TARGET ?AUTO_282 ?AUTO_279 ) ( not ( = ?AUTO_279 ?AUTO_280 ) ) ( ON_BOARD ?AUTO_282 ?AUTO_281 ) ( ON_BOARD ?AUTO_284 ?AUTO_281 ) ( POWER_ON ?AUTO_284 ) ( POINTING ?AUTO_283 ?AUTO_287 ) ( not ( = ?AUTO_280 ?AUTO_287 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_283 ?AUTO_280 ?AUTO_287 )
      ( GET_IMAGE ?AUTO_276 ?AUTO_277 )
      ( GET_IMAGE-VERIFY ?AUTO_276 ?AUTO_277 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_309 - DIRECTION
      ?AUTO_310 - MODE
    )
    :vars
    (
      ?AUTO_311 - INSTRUMENT
      ?AUTO_312 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_311 ) ( ON_BOARD ?AUTO_311 ?AUTO_312 ) ( SUPPORTS ?AUTO_311 ?AUTO_310 ) ( POWER_ON ?AUTO_311 ) ( POINTING ?AUTO_312 ?AUTO_309 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_312 ?AUTO_309 ?AUTO_311 ?AUTO_310 )
      ( GET_IMAGE-VERIFY ?AUTO_309 ?AUTO_310 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_315 - DIRECTION
      ?AUTO_316 - MODE
    )
    :vars
    (
      ?AUTO_319 - INSTRUMENT
      ?AUTO_320 - SATELLITE
      ?AUTO_322 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_319 ) ( ON_BOARD ?AUTO_319 ?AUTO_320 ) ( SUPPORTS ?AUTO_319 ?AUTO_316 ) ( POWER_ON ?AUTO_319 ) ( POINTING ?AUTO_320 ?AUTO_322 ) ( not ( = ?AUTO_315 ?AUTO_322 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_320 ?AUTO_315 ?AUTO_322 )
      ( GET_IMAGE ?AUTO_315 ?AUTO_316 )
      ( GET_IMAGE-VERIFY ?AUTO_315 ?AUTO_316 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_325 - DIRECTION
      ?AUTO_326 - MODE
    )
    :vars
    (
      ?AUTO_327 - INSTRUMENT
      ?AUTO_328 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_327 ) ( ON_BOARD ?AUTO_327 ?AUTO_328 ) ( SUPPORTS ?AUTO_327 ?AUTO_326 ) ( POWER_ON ?AUTO_327 ) ( POINTING ?AUTO_328 ?AUTO_325 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_328 ?AUTO_325 ?AUTO_327 ?AUTO_326 )
      ( GET_IMAGE-VERIFY ?AUTO_325 ?AUTO_326 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_331 - DIRECTION
      ?AUTO_332 - MODE
    )
    :vars
    (
      ?AUTO_333 - INSTRUMENT
      ?AUTO_336 - SATELLITE
      ?AUTO_338 - SATELLITE
      ?AUTO_339 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_333 ?AUTO_336 ) ( SUPPORTS ?AUTO_333 ?AUTO_332 ) ( POWER_ON ?AUTO_333 ) ( POINTING ?AUTO_336 ?AUTO_331 ) ( ON_BOARD ?AUTO_333 ?AUTO_338 ) ( CALIBRATION_TARGET ?AUTO_333 ?AUTO_339 ) ( POINTING ?AUTO_338 ?AUTO_339 ) ( NOT_CALIBRATED ?AUTO_333 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_338 ?AUTO_333 ?AUTO_339 )
      ( GET_IMAGE ?AUTO_331 ?AUTO_332 )
      ( GET_IMAGE-VERIFY ?AUTO_331 ?AUTO_332 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_340 - DIRECTION
      ?AUTO_341 - MODE
    )
    :vars
    (
      ?AUTO_344 - INSTRUMENT
      ?AUTO_345 - SATELLITE
      ?AUTO_346 - SATELLITE
      ?AUTO_347 - DIRECTION
      ?AUTO_349 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_344 ?AUTO_345 ) ( SUPPORTS ?AUTO_344 ?AUTO_341 ) ( POINTING ?AUTO_345 ?AUTO_340 ) ( ON_BOARD ?AUTO_344 ?AUTO_346 ) ( CALIBRATION_TARGET ?AUTO_344 ?AUTO_347 ) ( POINTING ?AUTO_346 ?AUTO_347 ) ( ON_BOARD ?AUTO_344 ?AUTO_349 ) ( POWER_AVAIL ?AUTO_349 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_344 ?AUTO_349 )
      ( GET_IMAGE ?AUTO_340 ?AUTO_341 )
      ( GET_IMAGE-VERIFY ?AUTO_340 ?AUTO_341 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_352 - DIRECTION
      ?AUTO_353 - MODE
    )
    :vars
    (
      ?AUTO_354 - INSTRUMENT
      ?AUTO_355 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_354 ) ( ON_BOARD ?AUTO_354 ?AUTO_355 ) ( SUPPORTS ?AUTO_354 ?AUTO_353 ) ( POWER_ON ?AUTO_354 ) ( POINTING ?AUTO_355 ?AUTO_352 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_355 ?AUTO_352 ?AUTO_354 ?AUTO_353 )
      ( GET_IMAGE-VERIFY ?AUTO_352 ?AUTO_353 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_358 - DIRECTION
      ?AUTO_359 - MODE
    )
    :vars
    (
      ?AUTO_360 - INSTRUMENT
      ?AUTO_362 - SATELLITE
      ?AUTO_365 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_360 ) ( ON_BOARD ?AUTO_360 ?AUTO_362 ) ( SUPPORTS ?AUTO_360 ?AUTO_359 ) ( POWER_ON ?AUTO_360 ) ( POINTING ?AUTO_362 ?AUTO_365 ) ( not ( = ?AUTO_358 ?AUTO_365 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_362 ?AUTO_358 ?AUTO_365 )
      ( GET_IMAGE ?AUTO_358 ?AUTO_359 )
      ( GET_IMAGE-VERIFY ?AUTO_358 ?AUTO_359 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_369 - DIRECTION
      ?AUTO_370 - MODE
    )
    :vars
    (
      ?AUTO_373 - INSTRUMENT
      ?AUTO_374 - SATELLITE
      ?AUTO_371 - DIRECTION
      ?AUTO_377 - SATELLITE
      ?AUTO_378 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_373 ?AUTO_374 ) ( SUPPORTS ?AUTO_373 ?AUTO_370 ) ( POWER_ON ?AUTO_373 ) ( POINTING ?AUTO_374 ?AUTO_371 ) ( not ( = ?AUTO_369 ?AUTO_371 ) ) ( ON_BOARD ?AUTO_373 ?AUTO_377 ) ( CALIBRATION_TARGET ?AUTO_373 ?AUTO_378 ) ( POINTING ?AUTO_377 ?AUTO_378 ) ( NOT_CALIBRATED ?AUTO_373 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_377 ?AUTO_373 ?AUTO_378 )
      ( GET_IMAGE ?AUTO_369 ?AUTO_370 )
      ( GET_IMAGE-VERIFY ?AUTO_369 ?AUTO_370 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_379 - DIRECTION
      ?AUTO_380 - MODE
    )
    :vars
    (
      ?AUTO_385 - INSTRUMENT
      ?AUTO_384 - SATELLITE
      ?AUTO_383 - DIRECTION
      ?AUTO_386 - SATELLITE
      ?AUTO_387 - DIRECTION
      ?AUTO_389 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_385 ?AUTO_384 ) ( SUPPORTS ?AUTO_385 ?AUTO_380 ) ( POINTING ?AUTO_384 ?AUTO_383 ) ( not ( = ?AUTO_379 ?AUTO_383 ) ) ( ON_BOARD ?AUTO_385 ?AUTO_386 ) ( CALIBRATION_TARGET ?AUTO_385 ?AUTO_387 ) ( POINTING ?AUTO_386 ?AUTO_387 ) ( ON_BOARD ?AUTO_385 ?AUTO_389 ) ( POWER_AVAIL ?AUTO_389 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_385 ?AUTO_389 )
      ( GET_IMAGE ?AUTO_379 ?AUTO_380 )
      ( GET_IMAGE-VERIFY ?AUTO_379 ?AUTO_380 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_392 - DIRECTION
      ?AUTO_393 - MODE
    )
    :vars
    (
      ?AUTO_394 - INSTRUMENT
      ?AUTO_395 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_394 ) ( ON_BOARD ?AUTO_394 ?AUTO_395 ) ( SUPPORTS ?AUTO_394 ?AUTO_393 ) ( POWER_ON ?AUTO_394 ) ( POINTING ?AUTO_395 ?AUTO_392 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_395 ?AUTO_392 ?AUTO_394 ?AUTO_393 )
      ( GET_IMAGE-VERIFY ?AUTO_392 ?AUTO_393 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_398 - DIRECTION
      ?AUTO_399 - MODE
    )
    :vars
    (
      ?AUTO_403 - INSTRUMENT
      ?AUTO_400 - SATELLITE
      ?AUTO_405 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_403 ) ( ON_BOARD ?AUTO_403 ?AUTO_400 ) ( SUPPORTS ?AUTO_403 ?AUTO_399 ) ( POWER_ON ?AUTO_403 ) ( POINTING ?AUTO_400 ?AUTO_405 ) ( not ( = ?AUTO_398 ?AUTO_405 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_400 ?AUTO_398 ?AUTO_405 )
      ( GET_IMAGE ?AUTO_398 ?AUTO_399 )
      ( GET_IMAGE-VERIFY ?AUTO_398 ?AUTO_399 ) )
  )

)

