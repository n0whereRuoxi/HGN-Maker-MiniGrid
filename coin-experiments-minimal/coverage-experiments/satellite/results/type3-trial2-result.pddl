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
      ?AUTO_22 - INSTRUMENT
      ?AUTO_23 - SATELLITE
      ?AUTO_19 - DIRECTION
      ?AUTO_25 - SATELLITE
      ?AUTO_26 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_22 ?AUTO_23 ) ( SUPPORTS ?AUTO_22 ?AUTO_18 ) ( POWER_ON ?AUTO_22 ) ( POINTING ?AUTO_23 ?AUTO_19 ) ( not ( = ?AUTO_17 ?AUTO_19 ) ) ( ON_BOARD ?AUTO_22 ?AUTO_25 ) ( CALIBRATION_TARGET ?AUTO_22 ?AUTO_26 ) ( POINTING ?AUTO_25 ?AUTO_26 ) ( NOT_CALIBRATED ?AUTO_22 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_25 ?AUTO_22 ?AUTO_26 )
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
      ?AUTO_40 - DIRECTION
      ?AUTO_41 - MODE
    )
    :vars
    (
      ?AUTO_42 - INSTRUMENT
      ?AUTO_43 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_42 ) ( ON_BOARD ?AUTO_42 ?AUTO_43 ) ( SUPPORTS ?AUTO_42 ?AUTO_41 ) ( POWER_ON ?AUTO_42 ) ( POINTING ?AUTO_43 ?AUTO_40 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_43 ?AUTO_40 ?AUTO_42 ?AUTO_41 )
      ( GET_IMAGE-VERIFY ?AUTO_40 ?AUTO_41 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_46 - DIRECTION
      ?AUTO_47 - MODE
    )
    :vars
    (
      ?AUTO_51 - INSTRUMENT
      ?AUTO_49 - SATELLITE
      ?AUTO_53 - SATELLITE
      ?AUTO_54 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_51 ?AUTO_49 ) ( SUPPORTS ?AUTO_51 ?AUTO_47 ) ( POWER_ON ?AUTO_51 ) ( POINTING ?AUTO_49 ?AUTO_46 ) ( ON_BOARD ?AUTO_51 ?AUTO_53 ) ( CALIBRATION_TARGET ?AUTO_51 ?AUTO_54 ) ( POINTING ?AUTO_53 ?AUTO_54 ) ( NOT_CALIBRATED ?AUTO_51 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_53 ?AUTO_51 ?AUTO_54 )
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
      ?AUTO_60 - INSTRUMENT
      ?AUTO_59 - SATELLITE
      ?AUTO_61 - SATELLITE
      ?AUTO_62 - DIRECTION
      ?AUTO_64 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_60 ?AUTO_59 ) ( SUPPORTS ?AUTO_60 ?AUTO_56 ) ( POINTING ?AUTO_59 ?AUTO_55 ) ( ON_BOARD ?AUTO_60 ?AUTO_61 ) ( CALIBRATION_TARGET ?AUTO_60 ?AUTO_62 ) ( POINTING ?AUTO_61 ?AUTO_62 ) ( ON_BOARD ?AUTO_60 ?AUTO_64 ) ( POWER_AVAIL ?AUTO_64 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_60 ?AUTO_64 )
      ( GET_IMAGE ?AUTO_55 ?AUTO_56 )
      ( GET_IMAGE-VERIFY ?AUTO_55 ?AUTO_56 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_67 - DIRECTION
      ?AUTO_68 - MODE
    )
    :vars
    (
      ?AUTO_69 - INSTRUMENT
      ?AUTO_70 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_69 ) ( ON_BOARD ?AUTO_69 ?AUTO_70 ) ( SUPPORTS ?AUTO_69 ?AUTO_68 ) ( POWER_ON ?AUTO_69 ) ( POINTING ?AUTO_70 ?AUTO_67 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_70 ?AUTO_67 ?AUTO_69 ?AUTO_68 )
      ( GET_IMAGE-VERIFY ?AUTO_67 ?AUTO_68 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_73 - DIRECTION
      ?AUTO_74 - MODE
    )
    :vars
    (
      ?AUTO_77 - INSTRUMENT
      ?AUTO_78 - SATELLITE
      ?AUTO_80 - SATELLITE
      ?AUTO_81 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_77 ?AUTO_78 ) ( SUPPORTS ?AUTO_77 ?AUTO_74 ) ( POWER_ON ?AUTO_77 ) ( POINTING ?AUTO_78 ?AUTO_73 ) ( ON_BOARD ?AUTO_77 ?AUTO_80 ) ( CALIBRATION_TARGET ?AUTO_77 ?AUTO_81 ) ( POINTING ?AUTO_80 ?AUTO_81 ) ( NOT_CALIBRATED ?AUTO_77 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_80 ?AUTO_77 ?AUTO_81 )
      ( GET_IMAGE ?AUTO_73 ?AUTO_74 )
      ( GET_IMAGE-VERIFY ?AUTO_73 ?AUTO_74 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_82 - DIRECTION
      ?AUTO_83 - MODE
    )
    :vars
    (
      ?AUTO_86 - INSTRUMENT
      ?AUTO_87 - SATELLITE
      ?AUTO_88 - SATELLITE
      ?AUTO_89 - DIRECTION
      ?AUTO_91 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_86 ?AUTO_87 ) ( SUPPORTS ?AUTO_86 ?AUTO_83 ) ( POINTING ?AUTO_87 ?AUTO_82 ) ( ON_BOARD ?AUTO_86 ?AUTO_88 ) ( CALIBRATION_TARGET ?AUTO_86 ?AUTO_89 ) ( POINTING ?AUTO_88 ?AUTO_89 ) ( ON_BOARD ?AUTO_86 ?AUTO_91 ) ( POWER_AVAIL ?AUTO_91 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_86 ?AUTO_91 )
      ( GET_IMAGE ?AUTO_82 ?AUTO_83 )
      ( GET_IMAGE-VERIFY ?AUTO_82 ?AUTO_83 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_96 - DIRECTION
      ?AUTO_97 - MODE
    )
    :vars
    (
      ?AUTO_98 - INSTRUMENT
      ?AUTO_99 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_98 ) ( ON_BOARD ?AUTO_98 ?AUTO_99 ) ( SUPPORTS ?AUTO_98 ?AUTO_97 ) ( POWER_ON ?AUTO_98 ) ( POINTING ?AUTO_99 ?AUTO_96 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_99 ?AUTO_96 ?AUTO_98 ?AUTO_97 )
      ( GET_IMAGE-VERIFY ?AUTO_96 ?AUTO_97 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_102 - DIRECTION
      ?AUTO_103 - MODE
    )
    :vars
    (
      ?AUTO_106 - INSTRUMENT
      ?AUTO_107 - SATELLITE
      ?AUTO_109 - SATELLITE
      ?AUTO_110 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_106 ?AUTO_107 ) ( SUPPORTS ?AUTO_106 ?AUTO_103 ) ( POWER_ON ?AUTO_106 ) ( POINTING ?AUTO_107 ?AUTO_102 ) ( ON_BOARD ?AUTO_106 ?AUTO_109 ) ( CALIBRATION_TARGET ?AUTO_106 ?AUTO_110 ) ( POINTING ?AUTO_109 ?AUTO_110 ) ( NOT_CALIBRATED ?AUTO_106 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_109 ?AUTO_106 ?AUTO_110 )
      ( GET_IMAGE ?AUTO_102 ?AUTO_103 )
      ( GET_IMAGE-VERIFY ?AUTO_102 ?AUTO_103 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_111 - DIRECTION
      ?AUTO_112 - MODE
    )
    :vars
    (
      ?AUTO_115 - INSTRUMENT
      ?AUTO_116 - SATELLITE
      ?AUTO_117 - SATELLITE
      ?AUTO_118 - DIRECTION
      ?AUTO_120 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_115 ?AUTO_116 ) ( SUPPORTS ?AUTO_115 ?AUTO_112 ) ( POINTING ?AUTO_116 ?AUTO_111 ) ( ON_BOARD ?AUTO_115 ?AUTO_117 ) ( CALIBRATION_TARGET ?AUTO_115 ?AUTO_118 ) ( POINTING ?AUTO_117 ?AUTO_118 ) ( ON_BOARD ?AUTO_115 ?AUTO_120 ) ( POWER_AVAIL ?AUTO_120 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_115 ?AUTO_120 )
      ( GET_IMAGE ?AUTO_111 ?AUTO_112 )
      ( GET_IMAGE-VERIFY ?AUTO_111 ?AUTO_112 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_121 - DIRECTION
      ?AUTO_122 - MODE
    )
    :vars
    (
      ?AUTO_126 - INSTRUMENT
      ?AUTO_127 - SATELLITE
      ?AUTO_128 - SATELLITE
      ?AUTO_125 - DIRECTION
      ?AUTO_129 - SATELLITE
      ?AUTO_130 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_126 ?AUTO_127 ) ( SUPPORTS ?AUTO_126 ?AUTO_122 ) ( POINTING ?AUTO_127 ?AUTO_121 ) ( ON_BOARD ?AUTO_126 ?AUTO_128 ) ( CALIBRATION_TARGET ?AUTO_126 ?AUTO_125 ) ( POINTING ?AUTO_128 ?AUTO_125 ) ( ON_BOARD ?AUTO_126 ?AUTO_129 ) ( ON_BOARD ?AUTO_130 ?AUTO_129 ) ( POWER_ON ?AUTO_130 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_130 ?AUTO_129 )
      ( GET_IMAGE ?AUTO_121 ?AUTO_122 )
      ( GET_IMAGE-VERIFY ?AUTO_121 ?AUTO_122 ) )
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
      ?AUTO_147 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_146 ) ( ON_BOARD ?AUTO_146 ?AUTO_147 ) ( SUPPORTS ?AUTO_146 ?AUTO_145 ) ( POWER_ON ?AUTO_146 ) ( POINTING ?AUTO_147 ?AUTO_144 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_147 ?AUTO_144 ?AUTO_146 ?AUTO_145 )
      ( GET_IMAGE-VERIFY ?AUTO_144 ?AUTO_145 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_150 - DIRECTION
      ?AUTO_151 - MODE
    )
    :vars
    (
      ?AUTO_154 - INSTRUMENT
      ?AUTO_155 - SATELLITE
      ?AUTO_157 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_154 ) ( ON_BOARD ?AUTO_154 ?AUTO_155 ) ( SUPPORTS ?AUTO_154 ?AUTO_151 ) ( POWER_ON ?AUTO_154 ) ( POINTING ?AUTO_155 ?AUTO_157 ) ( not ( = ?AUTO_150 ?AUTO_157 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_155 ?AUTO_150 ?AUTO_157 )
      ( GET_IMAGE ?AUTO_150 ?AUTO_151 )
      ( GET_IMAGE-VERIFY ?AUTO_150 ?AUTO_151 ) )
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
      ?AUTO_163 - DIRECTION
      ?AUTO_169 - SATELLITE
      ?AUTO_170 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_165 ?AUTO_166 ) ( SUPPORTS ?AUTO_165 ?AUTO_162 ) ( POWER_ON ?AUTO_165 ) ( POINTING ?AUTO_166 ?AUTO_163 ) ( not ( = ?AUTO_161 ?AUTO_163 ) ) ( ON_BOARD ?AUTO_165 ?AUTO_169 ) ( CALIBRATION_TARGET ?AUTO_165 ?AUTO_170 ) ( POINTING ?AUTO_169 ?AUTO_170 ) ( NOT_CALIBRATED ?AUTO_165 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_169 ?AUTO_165 ?AUTO_170 )
      ( GET_IMAGE ?AUTO_161 ?AUTO_162 )
      ( GET_IMAGE-VERIFY ?AUTO_161 ?AUTO_162 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_171 - DIRECTION
      ?AUTO_172 - MODE
    )
    :vars
    (
      ?AUTO_177 - INSTRUMENT
      ?AUTO_176 - SATELLITE
      ?AUTO_175 - DIRECTION
      ?AUTO_178 - SATELLITE
      ?AUTO_179 - DIRECTION
      ?AUTO_181 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_177 ?AUTO_176 ) ( SUPPORTS ?AUTO_177 ?AUTO_172 ) ( POINTING ?AUTO_176 ?AUTO_175 ) ( not ( = ?AUTO_171 ?AUTO_175 ) ) ( ON_BOARD ?AUTO_177 ?AUTO_178 ) ( CALIBRATION_TARGET ?AUTO_177 ?AUTO_179 ) ( POINTING ?AUTO_178 ?AUTO_179 ) ( ON_BOARD ?AUTO_177 ?AUTO_181 ) ( POWER_AVAIL ?AUTO_181 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_177 ?AUTO_181 )
      ( GET_IMAGE ?AUTO_171 ?AUTO_172 )
      ( GET_IMAGE-VERIFY ?AUTO_171 ?AUTO_172 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_182 - DIRECTION
      ?AUTO_183 - MODE
    )
    :vars
    (
      ?AUTO_188 - INSTRUMENT
      ?AUTO_189 - SATELLITE
      ?AUTO_191 - DIRECTION
      ?AUTO_187 - SATELLITE
      ?AUTO_190 - DIRECTION
      ?AUTO_185 - SATELLITE
      ?AUTO_192 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_188 ?AUTO_189 ) ( SUPPORTS ?AUTO_188 ?AUTO_183 ) ( POINTING ?AUTO_189 ?AUTO_191 ) ( not ( = ?AUTO_182 ?AUTO_191 ) ) ( ON_BOARD ?AUTO_188 ?AUTO_187 ) ( CALIBRATION_TARGET ?AUTO_188 ?AUTO_190 ) ( POINTING ?AUTO_187 ?AUTO_190 ) ( ON_BOARD ?AUTO_188 ?AUTO_185 ) ( ON_BOARD ?AUTO_192 ?AUTO_185 ) ( POWER_ON ?AUTO_192 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_192 ?AUTO_185 )
      ( GET_IMAGE ?AUTO_182 ?AUTO_183 )
      ( GET_IMAGE-VERIFY ?AUTO_182 ?AUTO_183 ) )
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
      ?AUTO_216 - INSTRUMENT
      ?AUTO_217 - SATELLITE
      ?AUTO_219 - SATELLITE
      ?AUTO_220 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_216 ?AUTO_217 ) ( SUPPORTS ?AUTO_216 ?AUTO_213 ) ( POWER_ON ?AUTO_216 ) ( POINTING ?AUTO_217 ?AUTO_212 ) ( ON_BOARD ?AUTO_216 ?AUTO_219 ) ( CALIBRATION_TARGET ?AUTO_216 ?AUTO_220 ) ( POINTING ?AUTO_219 ?AUTO_220 ) ( NOT_CALIBRATED ?AUTO_216 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_219 ?AUTO_216 ?AUTO_220 )
      ( GET_IMAGE ?AUTO_212 ?AUTO_213 )
      ( GET_IMAGE-VERIFY ?AUTO_212 ?AUTO_213 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_224 - DIRECTION
      ?AUTO_222 - MODE
    )
    :vars
    (
      ?AUTO_228 - INSTRUMENT
      ?AUTO_223 - SATELLITE
      ?AUTO_230 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_228 ?AUTO_223 ) ( SUPPORTS ?AUTO_228 ?AUTO_222 ) ( POWER_ON ?AUTO_228 ) ( CALIBRATION_TARGET ?AUTO_228 ?AUTO_224 ) ( NOT_CALIBRATED ?AUTO_228 ) ( POINTING ?AUTO_223 ?AUTO_230 ) ( not ( = ?AUTO_224 ?AUTO_230 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_223 ?AUTO_224 ?AUTO_230 )
      ( GET_IMAGE ?AUTO_224 ?AUTO_222 )
      ( GET_IMAGE-VERIFY ?AUTO_224 ?AUTO_222 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_256 - DIRECTION
      ?AUTO_257 - MODE
    )
    :vars
    (
      ?AUTO_258 - INSTRUMENT
      ?AUTO_259 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_258 ) ( ON_BOARD ?AUTO_258 ?AUTO_259 ) ( SUPPORTS ?AUTO_258 ?AUTO_257 ) ( POWER_ON ?AUTO_258 ) ( POINTING ?AUTO_259 ?AUTO_256 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_259 ?AUTO_256 ?AUTO_258 ?AUTO_257 )
      ( GET_IMAGE-VERIFY ?AUTO_256 ?AUTO_257 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_262 - DIRECTION
      ?AUTO_263 - MODE
    )
    :vars
    (
      ?AUTO_266 - INSTRUMENT
      ?AUTO_267 - SATELLITE
      ?AUTO_269 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_266 ) ( ON_BOARD ?AUTO_266 ?AUTO_267 ) ( SUPPORTS ?AUTO_266 ?AUTO_263 ) ( POWER_ON ?AUTO_266 ) ( POINTING ?AUTO_267 ?AUTO_269 ) ( not ( = ?AUTO_262 ?AUTO_269 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_267 ?AUTO_262 ?AUTO_269 )
      ( GET_IMAGE ?AUTO_262 ?AUTO_263 )
      ( GET_IMAGE-VERIFY ?AUTO_262 ?AUTO_263 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_273 - DIRECTION
      ?AUTO_274 - MODE
    )
    :vars
    (
      ?AUTO_277 - INSTRUMENT
      ?AUTO_278 - SATELLITE
      ?AUTO_275 - DIRECTION
      ?AUTO_281 - SATELLITE
      ?AUTO_282 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_277 ?AUTO_278 ) ( SUPPORTS ?AUTO_277 ?AUTO_274 ) ( POWER_ON ?AUTO_277 ) ( POINTING ?AUTO_278 ?AUTO_275 ) ( not ( = ?AUTO_273 ?AUTO_275 ) ) ( ON_BOARD ?AUTO_277 ?AUTO_281 ) ( CALIBRATION_TARGET ?AUTO_277 ?AUTO_282 ) ( POINTING ?AUTO_281 ?AUTO_282 ) ( NOT_CALIBRATED ?AUTO_277 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_281 ?AUTO_277 ?AUTO_282 )
      ( GET_IMAGE ?AUTO_273 ?AUTO_274 )
      ( GET_IMAGE-VERIFY ?AUTO_273 ?AUTO_274 ) )
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
      ?AUTO_293 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_289 ?AUTO_290 ) ( SUPPORTS ?AUTO_289 ?AUTO_284 ) ( POWER_ON ?AUTO_289 ) ( not ( = ?AUTO_283 ?AUTO_291 ) ) ( CALIBRATION_TARGET ?AUTO_289 ?AUTO_291 ) ( NOT_CALIBRATED ?AUTO_289 ) ( POINTING ?AUTO_290 ?AUTO_293 ) ( not ( = ?AUTO_291 ?AUTO_293 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_290 ?AUTO_291 ?AUTO_293 )
      ( GET_IMAGE ?AUTO_283 ?AUTO_284 )
      ( GET_IMAGE-VERIFY ?AUTO_283 ?AUTO_284 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_296 - DIRECTION
      ?AUTO_297 - MODE
    )
    :vars
    (
      ?AUTO_298 - INSTRUMENT
      ?AUTO_299 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_298 ) ( ON_BOARD ?AUTO_298 ?AUTO_299 ) ( SUPPORTS ?AUTO_298 ?AUTO_297 ) ( POWER_ON ?AUTO_298 ) ( POINTING ?AUTO_299 ?AUTO_296 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_299 ?AUTO_296 ?AUTO_298 ?AUTO_297 )
      ( GET_IMAGE-VERIFY ?AUTO_296 ?AUTO_297 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_302 - DIRECTION
      ?AUTO_303 - MODE
    )
    :vars
    (
      ?AUTO_306 - INSTRUMENT
      ?AUTO_307 - SATELLITE
      ?AUTO_309 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_306 ) ( ON_BOARD ?AUTO_306 ?AUTO_307 ) ( SUPPORTS ?AUTO_306 ?AUTO_303 ) ( POWER_ON ?AUTO_306 ) ( POINTING ?AUTO_307 ?AUTO_309 ) ( not ( = ?AUTO_302 ?AUTO_309 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_307 ?AUTO_302 ?AUTO_309 )
      ( GET_IMAGE ?AUTO_302 ?AUTO_303 )
      ( GET_IMAGE-VERIFY ?AUTO_302 ?AUTO_303 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_311 - DIRECTION
      ?AUTO_312 - MODE
    )
    :vars
    (
      ?AUTO_315 - INSTRUMENT
      ?AUTO_316 - SATELLITE
      ?AUTO_317 - DIRECTION
      ?AUTO_319 - SATELLITE
      ?AUTO_320 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_315 ?AUTO_316 ) ( SUPPORTS ?AUTO_315 ?AUTO_312 ) ( POWER_ON ?AUTO_315 ) ( POINTING ?AUTO_316 ?AUTO_317 ) ( not ( = ?AUTO_311 ?AUTO_317 ) ) ( ON_BOARD ?AUTO_315 ?AUTO_319 ) ( CALIBRATION_TARGET ?AUTO_315 ?AUTO_320 ) ( POINTING ?AUTO_319 ?AUTO_320 ) ( NOT_CALIBRATED ?AUTO_315 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_319 ?AUTO_315 ?AUTO_320 )
      ( GET_IMAGE ?AUTO_311 ?AUTO_312 )
      ( GET_IMAGE-VERIFY ?AUTO_311 ?AUTO_312 ) )
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
      ?AUTO_328 - SATELLITE
      ?AUTO_327 - DIRECTION
      ?AUTO_323 - SATELLITE
      ?AUTO_329 - DIRECTION
      ?AUTO_331 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_326 ?AUTO_328 ) ( SUPPORTS ?AUTO_326 ?AUTO_322 ) ( POINTING ?AUTO_328 ?AUTO_327 ) ( not ( = ?AUTO_321 ?AUTO_327 ) ) ( ON_BOARD ?AUTO_326 ?AUTO_323 ) ( CALIBRATION_TARGET ?AUTO_326 ?AUTO_329 ) ( POINTING ?AUTO_323 ?AUTO_329 ) ( ON_BOARD ?AUTO_326 ?AUTO_331 ) ( POWER_AVAIL ?AUTO_331 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_326 ?AUTO_331 )
      ( GET_IMAGE ?AUTO_321 ?AUTO_322 )
      ( GET_IMAGE-VERIFY ?AUTO_321 ?AUTO_322 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_332 - DIRECTION
      ?AUTO_333 - MODE
    )
    :vars
    (
      ?AUTO_339 - INSTRUMENT
      ?AUTO_337 - SATELLITE
      ?AUTO_338 - DIRECTION
      ?AUTO_341 - SATELLITE
      ?AUTO_343 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_339 ?AUTO_337 ) ( SUPPORTS ?AUTO_339 ?AUTO_333 ) ( not ( = ?AUTO_332 ?AUTO_338 ) ) ( CALIBRATION_TARGET ?AUTO_339 ?AUTO_338 ) ( ON_BOARD ?AUTO_339 ?AUTO_341 ) ( POWER_AVAIL ?AUTO_341 ) ( POINTING ?AUTO_337 ?AUTO_343 ) ( not ( = ?AUTO_338 ?AUTO_343 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_337 ?AUTO_338 ?AUTO_343 )
      ( GET_IMAGE ?AUTO_332 ?AUTO_333 )
      ( GET_IMAGE-VERIFY ?AUTO_332 ?AUTO_333 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_346 - DIRECTION
      ?AUTO_347 - MODE
    )
    :vars
    (
      ?AUTO_348 - INSTRUMENT
      ?AUTO_349 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_348 ) ( ON_BOARD ?AUTO_348 ?AUTO_349 ) ( SUPPORTS ?AUTO_348 ?AUTO_347 ) ( POWER_ON ?AUTO_348 ) ( POINTING ?AUTO_349 ?AUTO_346 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_349 ?AUTO_346 ?AUTO_348 ?AUTO_347 )
      ( GET_IMAGE-VERIFY ?AUTO_346 ?AUTO_347 ) )
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
      ?AUTO_357 - SATELLITE
      ?AUTO_359 - SATELLITE
      ?AUTO_360 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_356 ?AUTO_357 ) ( SUPPORTS ?AUTO_356 ?AUTO_353 ) ( POWER_ON ?AUTO_356 ) ( POINTING ?AUTO_357 ?AUTO_352 ) ( ON_BOARD ?AUTO_356 ?AUTO_359 ) ( CALIBRATION_TARGET ?AUTO_356 ?AUTO_360 ) ( POINTING ?AUTO_359 ?AUTO_360 ) ( NOT_CALIBRATED ?AUTO_356 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_359 ?AUTO_356 ?AUTO_360 )
      ( GET_IMAGE ?AUTO_352 ?AUTO_353 )
      ( GET_IMAGE-VERIFY ?AUTO_352 ?AUTO_353 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_361 - DIRECTION
      ?AUTO_362 - MODE
    )
    :vars
    (
      ?AUTO_366 - INSTRUMENT
      ?AUTO_365 - SATELLITE
      ?AUTO_367 - SATELLITE
      ?AUTO_368 - DIRECTION
      ?AUTO_370 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_366 ?AUTO_365 ) ( SUPPORTS ?AUTO_366 ?AUTO_362 ) ( POINTING ?AUTO_365 ?AUTO_361 ) ( ON_BOARD ?AUTO_366 ?AUTO_367 ) ( CALIBRATION_TARGET ?AUTO_366 ?AUTO_368 ) ( POINTING ?AUTO_367 ?AUTO_368 ) ( ON_BOARD ?AUTO_366 ?AUTO_370 ) ( POWER_AVAIL ?AUTO_370 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_366 ?AUTO_370 )
      ( GET_IMAGE ?AUTO_361 ?AUTO_362 )
      ( GET_IMAGE-VERIFY ?AUTO_361 ?AUTO_362 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_373 - DIRECTION
      ?AUTO_374 - MODE
    )
    :vars
    (
      ?AUTO_375 - INSTRUMENT
      ?AUTO_376 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_375 ) ( ON_BOARD ?AUTO_375 ?AUTO_376 ) ( SUPPORTS ?AUTO_375 ?AUTO_374 ) ( POWER_ON ?AUTO_375 ) ( POINTING ?AUTO_376 ?AUTO_373 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_376 ?AUTO_373 ?AUTO_375 ?AUTO_374 )
      ( GET_IMAGE-VERIFY ?AUTO_373 ?AUTO_374 ) )
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
      ?AUTO_382 - SATELLITE
      ?AUTO_386 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_381 ) ( ON_BOARD ?AUTO_381 ?AUTO_382 ) ( SUPPORTS ?AUTO_381 ?AUTO_380 ) ( POWER_ON ?AUTO_381 ) ( POINTING ?AUTO_382 ?AUTO_386 ) ( not ( = ?AUTO_379 ?AUTO_386 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_382 ?AUTO_379 ?AUTO_386 )
      ( GET_IMAGE ?AUTO_379 ?AUTO_380 )
      ( GET_IMAGE-VERIFY ?AUTO_379 ?AUTO_380 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_388 - DIRECTION
      ?AUTO_389 - MODE
    )
    :vars
    (
      ?AUTO_393 - INSTRUMENT
      ?AUTO_390 - SATELLITE
      ?AUTO_394 - DIRECTION
      ?AUTO_396 - SATELLITE
      ?AUTO_397 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_393 ?AUTO_390 ) ( SUPPORTS ?AUTO_393 ?AUTO_389 ) ( POWER_ON ?AUTO_393 ) ( POINTING ?AUTO_390 ?AUTO_394 ) ( not ( = ?AUTO_388 ?AUTO_394 ) ) ( ON_BOARD ?AUTO_393 ?AUTO_396 ) ( CALIBRATION_TARGET ?AUTO_393 ?AUTO_397 ) ( POINTING ?AUTO_396 ?AUTO_397 ) ( NOT_CALIBRATED ?AUTO_393 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_396 ?AUTO_393 ?AUTO_397 )
      ( GET_IMAGE ?AUTO_388 ?AUTO_389 )
      ( GET_IMAGE-VERIFY ?AUTO_388 ?AUTO_389 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_398 - DIRECTION
      ?AUTO_399 - MODE
    )
    :vars
    (
      ?AUTO_404 - INSTRUMENT
      ?AUTO_403 - SATELLITE
      ?AUTO_401 - DIRECTION
      ?AUTO_405 - SATELLITE
      ?AUTO_406 - DIRECTION
      ?AUTO_408 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_404 ?AUTO_403 ) ( SUPPORTS ?AUTO_404 ?AUTO_399 ) ( POINTING ?AUTO_403 ?AUTO_401 ) ( not ( = ?AUTO_398 ?AUTO_401 ) ) ( ON_BOARD ?AUTO_404 ?AUTO_405 ) ( CALIBRATION_TARGET ?AUTO_404 ?AUTO_406 ) ( POINTING ?AUTO_405 ?AUTO_406 ) ( ON_BOARD ?AUTO_404 ?AUTO_408 ) ( POWER_AVAIL ?AUTO_408 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_404 ?AUTO_408 )
      ( GET_IMAGE ?AUTO_398 ?AUTO_399 )
      ( GET_IMAGE-VERIFY ?AUTO_398 ?AUTO_399 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_409 - DIRECTION
      ?AUTO_410 - MODE
    )
    :vars
    (
      ?AUTO_417 - INSTRUMENT
      ?AUTO_416 - SATELLITE
      ?AUTO_414 - DIRECTION
      ?AUTO_412 - SATELLITE
      ?AUTO_415 - DIRECTION
      ?AUTO_418 - SATELLITE
      ?AUTO_419 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_417 ?AUTO_416 ) ( SUPPORTS ?AUTO_417 ?AUTO_410 ) ( POINTING ?AUTO_416 ?AUTO_414 ) ( not ( = ?AUTO_409 ?AUTO_414 ) ) ( ON_BOARD ?AUTO_417 ?AUTO_412 ) ( CALIBRATION_TARGET ?AUTO_417 ?AUTO_415 ) ( POINTING ?AUTO_412 ?AUTO_415 ) ( ON_BOARD ?AUTO_417 ?AUTO_418 ) ( ON_BOARD ?AUTO_419 ?AUTO_418 ) ( POWER_ON ?AUTO_419 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_419 ?AUTO_418 )
      ( GET_IMAGE ?AUTO_409 ?AUTO_410 )
      ( GET_IMAGE-VERIFY ?AUTO_409 ?AUTO_410 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_429 - DIRECTION
      ?AUTO_430 - MODE
    )
    :vars
    (
      ?AUTO_431 - INSTRUMENT
      ?AUTO_432 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_431 ) ( ON_BOARD ?AUTO_431 ?AUTO_432 ) ( SUPPORTS ?AUTO_431 ?AUTO_430 ) ( POWER_ON ?AUTO_431 ) ( POINTING ?AUTO_432 ?AUTO_429 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_432 ?AUTO_429 ?AUTO_431 ?AUTO_430 )
      ( GET_IMAGE-VERIFY ?AUTO_429 ?AUTO_430 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_435 - DIRECTION
      ?AUTO_436 - MODE
    )
    :vars
    (
      ?AUTO_437 - INSTRUMENT
      ?AUTO_438 - SATELLITE
      ?AUTO_442 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_437 ) ( ON_BOARD ?AUTO_437 ?AUTO_438 ) ( SUPPORTS ?AUTO_437 ?AUTO_436 ) ( POWER_ON ?AUTO_437 ) ( POINTING ?AUTO_438 ?AUTO_442 ) ( not ( = ?AUTO_435 ?AUTO_442 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_438 ?AUTO_435 ?AUTO_442 )
      ( GET_IMAGE ?AUTO_435 ?AUTO_436 )
      ( GET_IMAGE-VERIFY ?AUTO_435 ?AUTO_436 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_462 - DIRECTION
      ?AUTO_463 - MODE
    )
    :vars
    (
      ?AUTO_464 - INSTRUMENT
      ?AUTO_465 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_464 ) ( ON_BOARD ?AUTO_464 ?AUTO_465 ) ( SUPPORTS ?AUTO_464 ?AUTO_463 ) ( POWER_ON ?AUTO_464 ) ( POINTING ?AUTO_465 ?AUTO_462 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_465 ?AUTO_462 ?AUTO_464 ?AUTO_463 )
      ( GET_IMAGE-VERIFY ?AUTO_462 ?AUTO_463 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_468 - DIRECTION
      ?AUTO_469 - MODE
    )
    :vars
    (
      ?AUTO_470 - INSTRUMENT
      ?AUTO_473 - SATELLITE
      ?AUTO_475 - SATELLITE
      ?AUTO_476 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_470 ?AUTO_473 ) ( SUPPORTS ?AUTO_470 ?AUTO_469 ) ( POWER_ON ?AUTO_470 ) ( POINTING ?AUTO_473 ?AUTO_468 ) ( ON_BOARD ?AUTO_470 ?AUTO_475 ) ( CALIBRATION_TARGET ?AUTO_470 ?AUTO_476 ) ( POINTING ?AUTO_475 ?AUTO_476 ) ( NOT_CALIBRATED ?AUTO_470 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_475 ?AUTO_470 ?AUTO_476 )
      ( GET_IMAGE ?AUTO_468 ?AUTO_469 )
      ( GET_IMAGE-VERIFY ?AUTO_468 ?AUTO_469 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_479 - DIRECTION
      ?AUTO_478 - MODE
    )
    :vars
    (
      ?AUTO_482 - INSTRUMENT
      ?AUTO_484 - SATELLITE
      ?AUTO_486 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_482 ?AUTO_484 ) ( SUPPORTS ?AUTO_482 ?AUTO_478 ) ( POWER_ON ?AUTO_482 ) ( CALIBRATION_TARGET ?AUTO_482 ?AUTO_479 ) ( NOT_CALIBRATED ?AUTO_482 ) ( POINTING ?AUTO_484 ?AUTO_486 ) ( not ( = ?AUTO_479 ?AUTO_486 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_484 ?AUTO_479 ?AUTO_486 )
      ( GET_IMAGE ?AUTO_479 ?AUTO_478 )
      ( GET_IMAGE-VERIFY ?AUTO_479 ?AUTO_478 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_488 - DIRECTION
      ?AUTO_489 - MODE
    )
    :vars
    (
      ?AUTO_494 - INSTRUMENT
      ?AUTO_493 - SATELLITE
      ?AUTO_492 - DIRECTION
      ?AUTO_496 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_494 ?AUTO_493 ) ( SUPPORTS ?AUTO_494 ?AUTO_489 ) ( CALIBRATION_TARGET ?AUTO_494 ?AUTO_488 ) ( POINTING ?AUTO_493 ?AUTO_492 ) ( not ( = ?AUTO_488 ?AUTO_492 ) ) ( ON_BOARD ?AUTO_494 ?AUTO_496 ) ( POWER_AVAIL ?AUTO_496 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_494 ?AUTO_496 )
      ( GET_IMAGE ?AUTO_488 ?AUTO_489 )
      ( GET_IMAGE-VERIFY ?AUTO_488 ?AUTO_489 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_497 - DIRECTION
      ?AUTO_498 - MODE
    )
    :vars
    (
      ?AUTO_500 - INSTRUMENT
      ?AUTO_499 - SATELLITE
      ?AUTO_501 - DIRECTION
      ?AUTO_502 - SATELLITE
      ?AUTO_505 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_500 ?AUTO_499 ) ( SUPPORTS ?AUTO_500 ?AUTO_498 ) ( CALIBRATION_TARGET ?AUTO_500 ?AUTO_497 ) ( POINTING ?AUTO_499 ?AUTO_501 ) ( not ( = ?AUTO_497 ?AUTO_501 ) ) ( ON_BOARD ?AUTO_500 ?AUTO_502 ) ( ON_BOARD ?AUTO_505 ?AUTO_502 ) ( POWER_ON ?AUTO_505 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_505 ?AUTO_502 )
      ( GET_IMAGE ?AUTO_497 ?AUTO_498 )
      ( GET_IMAGE-VERIFY ?AUTO_497 ?AUTO_498 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_513 - DIRECTION
      ?AUTO_514 - MODE
    )
    :vars
    (
      ?AUTO_520 - INSTRUMENT
      ?AUTO_517 - SATELLITE
      ?AUTO_518 - DIRECTION
      ?AUTO_521 - SATELLITE
      ?AUTO_519 - INSTRUMENT
      ?AUTO_523 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_520 ?AUTO_517 ) ( SUPPORTS ?AUTO_520 ?AUTO_514 ) ( CALIBRATION_TARGET ?AUTO_520 ?AUTO_513 ) ( not ( = ?AUTO_513 ?AUTO_518 ) ) ( ON_BOARD ?AUTO_520 ?AUTO_521 ) ( ON_BOARD ?AUTO_519 ?AUTO_521 ) ( POWER_ON ?AUTO_519 ) ( POINTING ?AUTO_517 ?AUTO_523 ) ( not ( = ?AUTO_518 ?AUTO_523 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_517 ?AUTO_518 ?AUTO_523 )
      ( GET_IMAGE ?AUTO_513 ?AUTO_514 )
      ( GET_IMAGE-VERIFY ?AUTO_513 ?AUTO_514 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_527 - DIRECTION
      ?AUTO_528 - MODE
    )
    :vars
    (
      ?AUTO_534 - INSTRUMENT
      ?AUTO_530 - SATELLITE
      ?AUTO_533 - DIRECTION
      ?AUTO_535 - SATELLITE
      ?AUTO_532 - INSTRUMENT
      ?AUTO_536 - DIRECTION
      ?AUTO_538 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_534 ?AUTO_530 ) ( SUPPORTS ?AUTO_534 ?AUTO_528 ) ( CALIBRATION_TARGET ?AUTO_534 ?AUTO_527 ) ( not ( = ?AUTO_527 ?AUTO_533 ) ) ( ON_BOARD ?AUTO_534 ?AUTO_535 ) ( ON_BOARD ?AUTO_532 ?AUTO_535 ) ( POINTING ?AUTO_530 ?AUTO_536 ) ( not ( = ?AUTO_533 ?AUTO_536 ) ) ( ON_BOARD ?AUTO_532 ?AUTO_538 ) ( POWER_AVAIL ?AUTO_538 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_532 ?AUTO_538 )
      ( GET_IMAGE ?AUTO_527 ?AUTO_528 )
      ( GET_IMAGE-VERIFY ?AUTO_527 ?AUTO_528 ) )
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
      ?AUTO_562 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_559 ) ( ON_BOARD ?AUTO_559 ?AUTO_560 ) ( SUPPORTS ?AUTO_559 ?AUTO_556 ) ( POWER_ON ?AUTO_559 ) ( POINTING ?AUTO_560 ?AUTO_562 ) ( not ( = ?AUTO_555 ?AUTO_562 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_560 ?AUTO_555 ?AUTO_562 )
      ( GET_IMAGE ?AUTO_555 ?AUTO_556 )
      ( GET_IMAGE-VERIFY ?AUTO_555 ?AUTO_556 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_566 - DIRECTION
      ?AUTO_567 - MODE
    )
    :vars
    (
      ?AUTO_570 - INSTRUMENT
      ?AUTO_571 - SATELLITE
      ?AUTO_568 - DIRECTION
      ?AUTO_574 - SATELLITE
      ?AUTO_575 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_570 ?AUTO_571 ) ( SUPPORTS ?AUTO_570 ?AUTO_567 ) ( POWER_ON ?AUTO_570 ) ( POINTING ?AUTO_571 ?AUTO_568 ) ( not ( = ?AUTO_566 ?AUTO_568 ) ) ( ON_BOARD ?AUTO_570 ?AUTO_574 ) ( CALIBRATION_TARGET ?AUTO_570 ?AUTO_575 ) ( POINTING ?AUTO_574 ?AUTO_575 ) ( NOT_CALIBRATED ?AUTO_570 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_574 ?AUTO_570 ?AUTO_575 )
      ( GET_IMAGE ?AUTO_566 ?AUTO_567 )
      ( GET_IMAGE-VERIFY ?AUTO_566 ?AUTO_567 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_576 - DIRECTION
      ?AUTO_577 - MODE
    )
    :vars
    (
      ?AUTO_582 - INSTRUMENT
      ?AUTO_583 - SATELLITE
      ?AUTO_584 - DIRECTION
      ?AUTO_586 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_582 ?AUTO_583 ) ( SUPPORTS ?AUTO_582 ?AUTO_577 ) ( POWER_ON ?AUTO_582 ) ( not ( = ?AUTO_576 ?AUTO_584 ) ) ( CALIBRATION_TARGET ?AUTO_582 ?AUTO_584 ) ( NOT_CALIBRATED ?AUTO_582 ) ( POINTING ?AUTO_583 ?AUTO_586 ) ( not ( = ?AUTO_584 ?AUTO_586 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_583 ?AUTO_584 ?AUTO_586 )
      ( GET_IMAGE ?AUTO_576 ?AUTO_577 )
      ( GET_IMAGE-VERIFY ?AUTO_576 ?AUTO_577 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_588 - DIRECTION
      ?AUTO_589 - MODE
    )
    :vars
    (
      ?AUTO_595 - INSTRUMENT
      ?AUTO_593 - SATELLITE
      ?AUTO_594 - DIRECTION
      ?AUTO_591 - DIRECTION
      ?AUTO_597 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_595 ?AUTO_593 ) ( SUPPORTS ?AUTO_595 ?AUTO_589 ) ( not ( = ?AUTO_588 ?AUTO_594 ) ) ( CALIBRATION_TARGET ?AUTO_595 ?AUTO_594 ) ( POINTING ?AUTO_593 ?AUTO_591 ) ( not ( = ?AUTO_594 ?AUTO_591 ) ) ( ON_BOARD ?AUTO_595 ?AUTO_597 ) ( POWER_AVAIL ?AUTO_597 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_595 ?AUTO_597 )
      ( GET_IMAGE ?AUTO_588 ?AUTO_589 )
      ( GET_IMAGE-VERIFY ?AUTO_588 ?AUTO_589 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_598 - DIRECTION
      ?AUTO_599 - MODE
    )
    :vars
    (
      ?AUTO_603 - INSTRUMENT
      ?AUTO_606 - SATELLITE
      ?AUTO_601 - DIRECTION
      ?AUTO_600 - DIRECTION
      ?AUTO_604 - SATELLITE
      ?AUTO_607 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_603 ?AUTO_606 ) ( SUPPORTS ?AUTO_603 ?AUTO_599 ) ( not ( = ?AUTO_598 ?AUTO_601 ) ) ( CALIBRATION_TARGET ?AUTO_603 ?AUTO_601 ) ( POINTING ?AUTO_606 ?AUTO_600 ) ( not ( = ?AUTO_601 ?AUTO_600 ) ) ( ON_BOARD ?AUTO_603 ?AUTO_604 ) ( ON_BOARD ?AUTO_607 ?AUTO_604 ) ( POWER_ON ?AUTO_607 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_607 ?AUTO_604 )
      ( GET_IMAGE ?AUTO_598 ?AUTO_599 )
      ( GET_IMAGE-VERIFY ?AUTO_598 ?AUTO_599 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_615 - DIRECTION
      ?AUTO_616 - MODE
    )
    :vars
    (
      ?AUTO_623 - INSTRUMENT
      ?AUTO_621 - SATELLITE
      ?AUTO_620 - DIRECTION
      ?AUTO_624 - DIRECTION
      ?AUTO_619 - SATELLITE
      ?AUTO_618 - INSTRUMENT
      ?AUTO_626 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_623 ?AUTO_621 ) ( SUPPORTS ?AUTO_623 ?AUTO_616 ) ( not ( = ?AUTO_615 ?AUTO_620 ) ) ( CALIBRATION_TARGET ?AUTO_623 ?AUTO_620 ) ( not ( = ?AUTO_620 ?AUTO_624 ) ) ( ON_BOARD ?AUTO_623 ?AUTO_619 ) ( ON_BOARD ?AUTO_618 ?AUTO_619 ) ( POWER_ON ?AUTO_618 ) ( POINTING ?AUTO_621 ?AUTO_626 ) ( not ( = ?AUTO_624 ?AUTO_626 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_621 ?AUTO_624 ?AUTO_626 )
      ( GET_IMAGE ?AUTO_615 ?AUTO_616 )
      ( GET_IMAGE-VERIFY ?AUTO_615 ?AUTO_616 ) )
  )

)

