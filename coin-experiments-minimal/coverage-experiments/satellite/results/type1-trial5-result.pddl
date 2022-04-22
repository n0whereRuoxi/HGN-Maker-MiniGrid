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
      ?AUTO_48 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_45 ?AUTO_44 ) ( SUPPORTS ?AUTO_45 ?AUTO_39 ) ( not ( = ?AUTO_38 ?AUTO_46 ) ) ( CALIBRATION_TARGET ?AUTO_45 ?AUTO_46 ) ( ON_BOARD ?AUTO_45 ?AUTO_47 ) ( POWER_AVAIL ?AUTO_47 ) ( POINTING ?AUTO_44 ?AUTO_48 ) ( not ( = ?AUTO_46 ?AUTO_48 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_44 ?AUTO_46 ?AUTO_48 )
      ( GET_IMAGE ?AUTO_38 ?AUTO_39 )
      ( GET_IMAGE-VERIFY ?AUTO_38 ?AUTO_39 ) )
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
      ?AUTO_104 - SATELLITE
      ?AUTO_110 - DIRECTION
      ?AUTO_107 - SATELLITE
      ?AUTO_109 - DIRECTION
      ?AUTO_111 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_105 ?AUTO_104 ) ( SUPPORTS ?AUTO_105 ?AUTO_103 ) ( not ( = ?AUTO_102 ?AUTO_110 ) ) ( CALIBRATION_TARGET ?AUTO_105 ?AUTO_110 ) ( ON_BOARD ?AUTO_105 ?AUTO_107 ) ( POINTING ?AUTO_104 ?AUTO_109 ) ( not ( = ?AUTO_110 ?AUTO_109 ) ) ( ON_BOARD ?AUTO_111 ?AUTO_107 ) ( POWER_ON ?AUTO_111 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_111 ?AUTO_107 )
      ( GET_IMAGE ?AUTO_102 ?AUTO_103 )
      ( GET_IMAGE-VERIFY ?AUTO_102 ?AUTO_103 ) )
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
      ?AUTO_146 - INSTRUMENT
      ?AUTO_144 - SATELLITE
      ?AUTO_148 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_146 ?AUTO_144 ) ( SUPPORTS ?AUTO_146 ?AUTO_141 ) ( POWER_ON ?AUTO_146 ) ( CALIBRATION_TARGET ?AUTO_146 ?AUTO_147 ) ( NOT_CALIBRATED ?AUTO_146 ) ( POINTING ?AUTO_144 ?AUTO_148 ) ( not ( = ?AUTO_147 ?AUTO_148 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_144 ?AUTO_147 ?AUTO_148 )
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
      ?AUTO_156 - INSTRUMENT
      ?AUTO_155 - SATELLITE
      ?AUTO_157 - DIRECTION
      ?AUTO_159 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_156 ?AUTO_155 ) ( SUPPORTS ?AUTO_156 ?AUTO_152 ) ( CALIBRATION_TARGET ?AUTO_156 ?AUTO_151 ) ( POINTING ?AUTO_155 ?AUTO_157 ) ( not ( = ?AUTO_151 ?AUTO_157 ) ) ( ON_BOARD ?AUTO_156 ?AUTO_159 ) ( POWER_AVAIL ?AUTO_159 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_156 ?AUTO_159 )
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
      ?AUTO_162 - INSTRUMENT
      ?AUTO_166 - SATELLITE
      ?AUTO_163 - DIRECTION
      ?AUTO_167 - SATELLITE
      ?AUTO_168 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_162 ?AUTO_166 ) ( SUPPORTS ?AUTO_162 ?AUTO_161 ) ( CALIBRATION_TARGET ?AUTO_162 ?AUTO_160 ) ( POINTING ?AUTO_166 ?AUTO_163 ) ( not ( = ?AUTO_160 ?AUTO_163 ) ) ( ON_BOARD ?AUTO_162 ?AUTO_167 ) ( ON_BOARD ?AUTO_168 ?AUTO_167 ) ( POWER_ON ?AUTO_168 ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_168 ?AUTO_167 )
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
      ?AUTO_176 - INSTRUMENT
      ?AUTO_179 - SATELLITE
      ?AUTO_175 - DIRECTION
      ?AUTO_174 - SATELLITE
      ?AUTO_177 - INSTRUMENT
      ?AUTO_181 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_176 ?AUTO_179 ) ( SUPPORTS ?AUTO_176 ?AUTO_173 ) ( CALIBRATION_TARGET ?AUTO_176 ?AUTO_172 ) ( not ( = ?AUTO_172 ?AUTO_175 ) ) ( ON_BOARD ?AUTO_176 ?AUTO_174 ) ( ON_BOARD ?AUTO_177 ?AUTO_174 ) ( POWER_ON ?AUTO_177 ) ( POINTING ?AUTO_179 ?AUTO_181 ) ( not ( = ?AUTO_175 ?AUTO_181 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_179 ?AUTO_175 ?AUTO_181 )
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
      ?AUTO_188 - INSTRUMENT
      ?AUTO_190 - SATELLITE
      ?AUTO_192 - DIRECTION
      ?AUTO_191 - SATELLITE
      ?AUTO_193 - INSTRUMENT
      ?AUTO_195 - DIRECTION
      ?AUTO_197 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_188 ?AUTO_190 ) ( SUPPORTS ?AUTO_188 ?AUTO_187 ) ( CALIBRATION_TARGET ?AUTO_188 ?AUTO_186 ) ( not ( = ?AUTO_186 ?AUTO_192 ) ) ( ON_BOARD ?AUTO_188 ?AUTO_191 ) ( ON_BOARD ?AUTO_193 ?AUTO_191 ) ( POINTING ?AUTO_190 ?AUTO_195 ) ( not ( = ?AUTO_192 ?AUTO_195 ) ) ( ON_BOARD ?AUTO_193 ?AUTO_197 ) ( POWER_AVAIL ?AUTO_197 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_193 ?AUTO_197 )
      ( GET_IMAGE ?AUTO_186 ?AUTO_187 )
      ( GET_IMAGE-VERIFY ?AUTO_186 ?AUTO_187 ) )
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
      ?AUTO_250 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_247 ?AUTO_248 ) ( SUPPORTS ?AUTO_247 ?AUTO_242 ) ( POWER_ON ?AUTO_247 ) ( not ( = ?AUTO_241 ?AUTO_249 ) ) ( CALIBRATION_TARGET ?AUTO_247 ?AUTO_249 ) ( NOT_CALIBRATED ?AUTO_247 ) ( POINTING ?AUTO_248 ?AUTO_250 ) ( not ( = ?AUTO_249 ?AUTO_250 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_248 ?AUTO_249 ?AUTO_250 )
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
      ?AUTO_255 - DIRECTION
      ?AUTO_262 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_260 ?AUTO_258 ) ( SUPPORTS ?AUTO_260 ?AUTO_254 ) ( not ( = ?AUTO_253 ?AUTO_259 ) ) ( CALIBRATION_TARGET ?AUTO_260 ?AUTO_259 ) ( POINTING ?AUTO_258 ?AUTO_255 ) ( not ( = ?AUTO_259 ?AUTO_255 ) ) ( ON_BOARD ?AUTO_260 ?AUTO_262 ) ( POWER_AVAIL ?AUTO_262 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_260 ?AUTO_262 )
      ( GET_IMAGE ?AUTO_253 ?AUTO_254 )
      ( GET_IMAGE-VERIFY ?AUTO_253 ?AUTO_254 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_276 - DIRECTION
      ?AUTO_277 - MODE
    )
    :vars
    (
      ?AUTO_281 - INSTRUMENT
      ?AUTO_278 - SATELLITE
      ?AUTO_283 - DIRECTION
      ?AUTO_280 - DIRECTION
      ?AUTO_284 - SATELLITE
      ?AUTO_282 - INSTRUMENT
      ?AUTO_286 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_281 ?AUTO_278 ) ( SUPPORTS ?AUTO_281 ?AUTO_277 ) ( not ( = ?AUTO_276 ?AUTO_283 ) ) ( CALIBRATION_TARGET ?AUTO_281 ?AUTO_283 ) ( not ( = ?AUTO_283 ?AUTO_280 ) ) ( ON_BOARD ?AUTO_281 ?AUTO_284 ) ( ON_BOARD ?AUTO_282 ?AUTO_284 ) ( POWER_ON ?AUTO_282 ) ( POINTING ?AUTO_278 ?AUTO_286 ) ( not ( = ?AUTO_280 ?AUTO_286 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_278 ?AUTO_280 ?AUTO_286 )
      ( GET_IMAGE ?AUTO_276 ?AUTO_277 )
      ( GET_IMAGE-VERIFY ?AUTO_276 ?AUTO_277 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_304 - DIRECTION
      ?AUTO_305 - MODE
    )
    :vars
    (
      ?AUTO_309 - INSTRUMENT
      ?AUTO_308 - SATELLITE
      ?AUTO_310 - SATELLITE
      ?AUTO_311 - DIRECTION
      ?AUTO_313 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_309 ?AUTO_308 ) ( SUPPORTS ?AUTO_309 ?AUTO_305 ) ( POINTING ?AUTO_308 ?AUTO_304 ) ( ON_BOARD ?AUTO_309 ?AUTO_310 ) ( CALIBRATION_TARGET ?AUTO_309 ?AUTO_311 ) ( POINTING ?AUTO_310 ?AUTO_311 ) ( ON_BOARD ?AUTO_309 ?AUTO_313 ) ( POWER_AVAIL ?AUTO_313 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_309 ?AUTO_313 )
      ( GET_IMAGE ?AUTO_304 ?AUTO_305 )
      ( GET_IMAGE-VERIFY ?AUTO_304 ?AUTO_305 ) )
  )

)

