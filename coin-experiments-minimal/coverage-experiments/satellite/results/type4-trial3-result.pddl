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
      ?AUTO_7 - DIRECTION
      ?AUTO_6 - MODE
    )
    :vars
    (
      ?AUTO_8 - INSTRUMENT
      ?AUTO_9 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_8 ?AUTO_9 ) ( SUPPORTS ?AUTO_8 ?AUTO_6 ) ( POWER_ON ?AUTO_8 ) ( POINTING ?AUTO_9 ?AUTO_7 ) ( CALIBRATION_TARGET ?AUTO_8 ?AUTO_7 ) ( NOT_CALIBRATED ?AUTO_8 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9 ?AUTO_8 ?AUTO_7 )
      ( GET_IMAGE ?AUTO_7 ?AUTO_6 )
      ( GET_IMAGE-VERIFY ?AUTO_7 ?AUTO_6 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_11 - DIRECTION
      ?AUTO_10 - MODE
    )
    :vars
    (
      ?AUTO_13 - INSTRUMENT
      ?AUTO_12 - SATELLITE
      ?AUTO_14 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_13 ?AUTO_12 ) ( SUPPORTS ?AUTO_13 ?AUTO_10 ) ( POWER_ON ?AUTO_13 ) ( CALIBRATION_TARGET ?AUTO_13 ?AUTO_11 ) ( NOT_CALIBRATED ?AUTO_13 ) ( POINTING ?AUTO_12 ?AUTO_14 ) ( not ( = ?AUTO_11 ?AUTO_14 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_12 ?AUTO_11 ?AUTO_14 )
      ( GET_IMAGE ?AUTO_11 ?AUTO_10 )
      ( GET_IMAGE-VERIFY ?AUTO_11 ?AUTO_10 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_16 - DIRECTION
      ?AUTO_15 - MODE
    )
    :vars
    (
      ?AUTO_19 - INSTRUMENT
      ?AUTO_17 - SATELLITE
      ?AUTO_18 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_19 ?AUTO_17 ) ( SUPPORTS ?AUTO_19 ?AUTO_15 ) ( CALIBRATION_TARGET ?AUTO_19 ?AUTO_16 ) ( POINTING ?AUTO_17 ?AUTO_18 ) ( not ( = ?AUTO_16 ?AUTO_18 ) ) ( POWER_AVAIL ?AUTO_17 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_19 ?AUTO_17 )
      ( GET_IMAGE ?AUTO_16 ?AUTO_15 )
      ( GET_IMAGE-VERIFY ?AUTO_16 ?AUTO_15 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_23 - DIRECTION
      ?AUTO_22 - MODE
    )
    :vars
    (
      ?AUTO_24 - INSTRUMENT
      ?AUTO_25 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_24 ) ( ON_BOARD ?AUTO_24 ?AUTO_25 ) ( SUPPORTS ?AUTO_24 ?AUTO_22 ) ( POWER_ON ?AUTO_24 ) ( POINTING ?AUTO_25 ?AUTO_23 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_25 ?AUTO_23 ?AUTO_24 ?AUTO_22 )
      ( GET_IMAGE-VERIFY ?AUTO_23 ?AUTO_22 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_27 - DIRECTION
      ?AUTO_26 - MODE
    )
    :vars
    (
      ?AUTO_29 - INSTRUMENT
      ?AUTO_28 - SATELLITE
      ?AUTO_30 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_29 ) ( ON_BOARD ?AUTO_29 ?AUTO_28 ) ( SUPPORTS ?AUTO_29 ?AUTO_26 ) ( POWER_ON ?AUTO_29 ) ( POINTING ?AUTO_28 ?AUTO_30 ) ( not ( = ?AUTO_27 ?AUTO_30 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_28 ?AUTO_27 ?AUTO_30 )
      ( GET_IMAGE ?AUTO_27 ?AUTO_26 )
      ( GET_IMAGE-VERIFY ?AUTO_27 ?AUTO_26 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_34 - DIRECTION
      ?AUTO_33 - MODE
    )
    :vars
    (
      ?AUTO_37 - INSTRUMENT
      ?AUTO_35 - SATELLITE
      ?AUTO_36 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_37 ?AUTO_35 ) ( SUPPORTS ?AUTO_37 ?AUTO_33 ) ( POWER_ON ?AUTO_37 ) ( POINTING ?AUTO_35 ?AUTO_36 ) ( not ( = ?AUTO_34 ?AUTO_36 ) ) ( CALIBRATION_TARGET ?AUTO_37 ?AUTO_36 ) ( NOT_CALIBRATED ?AUTO_37 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_35 ?AUTO_37 ?AUTO_36 )
      ( GET_IMAGE ?AUTO_34 ?AUTO_33 )
      ( GET_IMAGE-VERIFY ?AUTO_34 ?AUTO_33 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_39 - DIRECTION
      ?AUTO_38 - MODE
    )
    :vars
    (
      ?AUTO_42 - INSTRUMENT
      ?AUTO_40 - SATELLITE
      ?AUTO_41 - DIRECTION
      ?AUTO_43 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_42 ?AUTO_40 ) ( SUPPORTS ?AUTO_42 ?AUTO_38 ) ( POWER_ON ?AUTO_42 ) ( not ( = ?AUTO_39 ?AUTO_41 ) ) ( CALIBRATION_TARGET ?AUTO_42 ?AUTO_41 ) ( NOT_CALIBRATED ?AUTO_42 ) ( POINTING ?AUTO_40 ?AUTO_43 ) ( not ( = ?AUTO_41 ?AUTO_43 ) ) ( not ( = ?AUTO_39 ?AUTO_43 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_40 ?AUTO_41 ?AUTO_43 )
      ( GET_IMAGE ?AUTO_39 ?AUTO_38 )
      ( GET_IMAGE-VERIFY ?AUTO_39 ?AUTO_38 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_45 - DIRECTION
      ?AUTO_44 - MODE
    )
    :vars
    (
      ?AUTO_47 - INSTRUMENT
      ?AUTO_49 - SATELLITE
      ?AUTO_46 - DIRECTION
      ?AUTO_48 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_47 ?AUTO_49 ) ( SUPPORTS ?AUTO_47 ?AUTO_44 ) ( not ( = ?AUTO_45 ?AUTO_46 ) ) ( CALIBRATION_TARGET ?AUTO_47 ?AUTO_46 ) ( POINTING ?AUTO_49 ?AUTO_48 ) ( not ( = ?AUTO_46 ?AUTO_48 ) ) ( not ( = ?AUTO_45 ?AUTO_48 ) ) ( POWER_AVAIL ?AUTO_49 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_47 ?AUTO_49 )
      ( GET_IMAGE ?AUTO_45 ?AUTO_44 )
      ( GET_IMAGE-VERIFY ?AUTO_45 ?AUTO_44 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_53 - DIRECTION
      ?AUTO_52 - MODE
    )
    :vars
    (
      ?AUTO_54 - INSTRUMENT
      ?AUTO_55 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_54 ) ( ON_BOARD ?AUTO_54 ?AUTO_55 ) ( SUPPORTS ?AUTO_54 ?AUTO_52 ) ( POWER_ON ?AUTO_54 ) ( POINTING ?AUTO_55 ?AUTO_53 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_55 ?AUTO_53 ?AUTO_54 ?AUTO_52 )
      ( GET_IMAGE-VERIFY ?AUTO_53 ?AUTO_52 ) )
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
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_59 ) ( ON_BOARD ?AUTO_59 ?AUTO_58 ) ( SUPPORTS ?AUTO_59 ?AUTO_56 ) ( POWER_ON ?AUTO_59 ) ( POINTING ?AUTO_58 ?AUTO_60 ) ( not ( = ?AUTO_57 ?AUTO_60 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_58 ?AUTO_57 ?AUTO_60 )
      ( GET_IMAGE ?AUTO_57 ?AUTO_56 )
      ( GET_IMAGE-VERIFY ?AUTO_57 ?AUTO_56 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_70 - DIRECTION
      ?AUTO_69 - MODE
    )
    :vars
    (
      ?AUTO_73 - INSTRUMENT
      ?AUTO_72 - SATELLITE
      ?AUTO_71 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_73 ?AUTO_72 ) ( SUPPORTS ?AUTO_73 ?AUTO_69 ) ( POWER_ON ?AUTO_73 ) ( not ( = ?AUTO_70 ?AUTO_71 ) ) ( CALIBRATION_TARGET ?AUTO_73 ?AUTO_71 ) ( NOT_CALIBRATED ?AUTO_73 ) ( POINTING ?AUTO_72 ?AUTO_70 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_72 ?AUTO_71 ?AUTO_70 )
      ( GET_IMAGE ?AUTO_70 ?AUTO_69 )
      ( GET_IMAGE-VERIFY ?AUTO_70 ?AUTO_69 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_75 - DIRECTION
      ?AUTO_74 - MODE
    )
    :vars
    (
      ?AUTO_77 - INSTRUMENT
      ?AUTO_78 - SATELLITE
      ?AUTO_76 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_77 ?AUTO_78 ) ( SUPPORTS ?AUTO_77 ?AUTO_74 ) ( not ( = ?AUTO_75 ?AUTO_76 ) ) ( CALIBRATION_TARGET ?AUTO_77 ?AUTO_76 ) ( POINTING ?AUTO_78 ?AUTO_75 ) ( POWER_AVAIL ?AUTO_78 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_77 ?AUTO_78 )
      ( GET_IMAGE ?AUTO_75 ?AUTO_74 )
      ( GET_IMAGE-VERIFY ?AUTO_75 ?AUTO_74 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_82 - DIRECTION
      ?AUTO_81 - MODE
    )
    :vars
    (
      ?AUTO_83 - INSTRUMENT
      ?AUTO_84 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_83 ) ( ON_BOARD ?AUTO_83 ?AUTO_84 ) ( SUPPORTS ?AUTO_83 ?AUTO_81 ) ( POWER_ON ?AUTO_83 ) ( POINTING ?AUTO_84 ?AUTO_82 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_84 ?AUTO_82 ?AUTO_83 ?AUTO_81 )
      ( GET_IMAGE-VERIFY ?AUTO_82 ?AUTO_81 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_86 - DIRECTION
      ?AUTO_85 - MODE
    )
    :vars
    (
      ?AUTO_87 - INSTRUMENT
      ?AUTO_88 - SATELLITE
      ?AUTO_89 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_87 ) ( ON_BOARD ?AUTO_87 ?AUTO_88 ) ( SUPPORTS ?AUTO_87 ?AUTO_85 ) ( POWER_ON ?AUTO_87 ) ( POINTING ?AUTO_88 ?AUTO_89 ) ( not ( = ?AUTO_86 ?AUTO_89 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_88 ?AUTO_86 ?AUTO_89 )
      ( GET_IMAGE ?AUTO_86 ?AUTO_85 )
      ( GET_IMAGE-VERIFY ?AUTO_86 ?AUTO_85 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_92 - DIRECTION
      ?AUTO_93 - MODE
    )
    :vars
    (
      ?AUTO_94 - INSTRUMENT
      ?AUTO_95 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_94 ) ( ON_BOARD ?AUTO_94 ?AUTO_95 ) ( SUPPORTS ?AUTO_94 ?AUTO_93 ) ( POWER_ON ?AUTO_94 ) ( POINTING ?AUTO_95 ?AUTO_92 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_95 ?AUTO_92 ?AUTO_94 ?AUTO_93 )
      ( GET_IMAGE-VERIFY ?AUTO_92 ?AUTO_93 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_96 - DIRECTION
      ?AUTO_97 - MODE
    )
    :vars
    (
      ?AUTO_99 - INSTRUMENT
      ?AUTO_98 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_99 ?AUTO_98 ) ( SUPPORTS ?AUTO_99 ?AUTO_97 ) ( POWER_ON ?AUTO_99 ) ( POINTING ?AUTO_98 ?AUTO_96 ) ( CALIBRATION_TARGET ?AUTO_99 ?AUTO_96 ) ( NOT_CALIBRATED ?AUTO_99 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_98 ?AUTO_99 ?AUTO_96 )
      ( GET_IMAGE ?AUTO_96 ?AUTO_97 )
      ( GET_IMAGE-VERIFY ?AUTO_96 ?AUTO_97 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_100 - DIRECTION
      ?AUTO_101 - MODE
    )
    :vars
    (
      ?AUTO_102 - INSTRUMENT
      ?AUTO_103 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_102 ?AUTO_103 ) ( SUPPORTS ?AUTO_102 ?AUTO_101 ) ( POINTING ?AUTO_103 ?AUTO_100 ) ( CALIBRATION_TARGET ?AUTO_102 ?AUTO_100 ) ( POWER_AVAIL ?AUTO_103 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_102 ?AUTO_103 )
      ( GET_IMAGE ?AUTO_100 ?AUTO_101 )
      ( GET_IMAGE-VERIFY ?AUTO_100 ?AUTO_101 ) )
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
      ?AUTO_109 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_108 ) ( ON_BOARD ?AUTO_108 ?AUTO_109 ) ( SUPPORTS ?AUTO_108 ?AUTO_107 ) ( POWER_ON ?AUTO_108 ) ( POINTING ?AUTO_109 ?AUTO_106 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_109 ?AUTO_106 ?AUTO_108 ?AUTO_107 )
      ( GET_IMAGE-VERIFY ?AUTO_106 ?AUTO_107 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_110 - DIRECTION
      ?AUTO_111 - MODE
    )
    :vars
    (
      ?AUTO_112 - INSTRUMENT
      ?AUTO_113 - SATELLITE
      ?AUTO_114 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_112 ) ( ON_BOARD ?AUTO_112 ?AUTO_113 ) ( SUPPORTS ?AUTO_112 ?AUTO_111 ) ( POWER_ON ?AUTO_112 ) ( POINTING ?AUTO_113 ?AUTO_114 ) ( not ( = ?AUTO_110 ?AUTO_114 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_113 ?AUTO_110 ?AUTO_114 )
      ( GET_IMAGE ?AUTO_110 ?AUTO_111 )
      ( GET_IMAGE-VERIFY ?AUTO_110 ?AUTO_111 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_115 - DIRECTION
      ?AUTO_116 - MODE
    )
    :vars
    (
      ?AUTO_117 - INSTRUMENT
      ?AUTO_118 - SATELLITE
      ?AUTO_119 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_117 ?AUTO_118 ) ( SUPPORTS ?AUTO_117 ?AUTO_116 ) ( POWER_ON ?AUTO_117 ) ( POINTING ?AUTO_118 ?AUTO_119 ) ( not ( = ?AUTO_115 ?AUTO_119 ) ) ( CALIBRATION_TARGET ?AUTO_117 ?AUTO_119 ) ( NOT_CALIBRATED ?AUTO_117 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_118 ?AUTO_117 ?AUTO_119 )
      ( GET_IMAGE ?AUTO_115 ?AUTO_116 )
      ( GET_IMAGE-VERIFY ?AUTO_115 ?AUTO_116 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_120 - DIRECTION
      ?AUTO_121 - MODE
    )
    :vars
    (
      ?AUTO_123 - INSTRUMENT
      ?AUTO_122 - SATELLITE
      ?AUTO_124 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_123 ?AUTO_122 ) ( SUPPORTS ?AUTO_123 ?AUTO_121 ) ( POINTING ?AUTO_122 ?AUTO_124 ) ( not ( = ?AUTO_120 ?AUTO_124 ) ) ( CALIBRATION_TARGET ?AUTO_123 ?AUTO_124 ) ( POWER_AVAIL ?AUTO_122 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_123 ?AUTO_122 )
      ( GET_IMAGE ?AUTO_120 ?AUTO_121 )
      ( GET_IMAGE-VERIFY ?AUTO_120 ?AUTO_121 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_133 - DIRECTION
      ?AUTO_134 - MODE
    )
    :vars
    (
      ?AUTO_135 - INSTRUMENT
      ?AUTO_136 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_135 ) ( ON_BOARD ?AUTO_135 ?AUTO_136 ) ( SUPPORTS ?AUTO_135 ?AUTO_134 ) ( POWER_ON ?AUTO_135 ) ( POINTING ?AUTO_136 ?AUTO_133 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_136 ?AUTO_133 ?AUTO_135 ?AUTO_134 )
      ( GET_IMAGE-VERIFY ?AUTO_133 ?AUTO_134 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_137 - DIRECTION
      ?AUTO_138 - MODE
    )
    :vars
    (
      ?AUTO_140 - INSTRUMENT
      ?AUTO_139 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_140 ?AUTO_139 ) ( SUPPORTS ?AUTO_140 ?AUTO_138 ) ( POWER_ON ?AUTO_140 ) ( POINTING ?AUTO_139 ?AUTO_137 ) ( CALIBRATION_TARGET ?AUTO_140 ?AUTO_137 ) ( NOT_CALIBRATED ?AUTO_140 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_139 ?AUTO_140 ?AUTO_137 )
      ( GET_IMAGE ?AUTO_137 ?AUTO_138 )
      ( GET_IMAGE-VERIFY ?AUTO_137 ?AUTO_138 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_141 - DIRECTION
      ?AUTO_142 - MODE
    )
    :vars
    (
      ?AUTO_143 - INSTRUMENT
      ?AUTO_144 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_143 ?AUTO_144 ) ( SUPPORTS ?AUTO_143 ?AUTO_142 ) ( POINTING ?AUTO_144 ?AUTO_141 ) ( CALIBRATION_TARGET ?AUTO_143 ?AUTO_141 ) ( POWER_AVAIL ?AUTO_144 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_143 ?AUTO_144 )
      ( GET_IMAGE ?AUTO_141 ?AUTO_142 )
      ( GET_IMAGE-VERIFY ?AUTO_141 ?AUTO_142 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_161 - DIRECTION
      ?AUTO_162 - MODE
    )
    :vars
    (
      ?AUTO_163 - INSTRUMENT
      ?AUTO_164 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_163 ) ( ON_BOARD ?AUTO_163 ?AUTO_164 ) ( SUPPORTS ?AUTO_163 ?AUTO_162 ) ( POWER_ON ?AUTO_163 ) ( POINTING ?AUTO_164 ?AUTO_161 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_164 ?AUTO_161 ?AUTO_163 ?AUTO_162 )
      ( GET_IMAGE-VERIFY ?AUTO_161 ?AUTO_162 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_165 - DIRECTION
      ?AUTO_166 - MODE
    )
    :vars
    (
      ?AUTO_167 - INSTRUMENT
      ?AUTO_168 - SATELLITE
      ?AUTO_169 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_167 ) ( ON_BOARD ?AUTO_167 ?AUTO_168 ) ( SUPPORTS ?AUTO_167 ?AUTO_166 ) ( POWER_ON ?AUTO_167 ) ( POINTING ?AUTO_168 ?AUTO_169 ) ( not ( = ?AUTO_165 ?AUTO_169 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_168 ?AUTO_165 ?AUTO_169 )
      ( GET_IMAGE ?AUTO_165 ?AUTO_166 )
      ( GET_IMAGE-VERIFY ?AUTO_165 ?AUTO_166 ) )
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
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_175 ?AUTO_176 ) ( SUPPORTS ?AUTO_175 ?AUTO_173 ) ( POWER_ON ?AUTO_175 ) ( POINTING ?AUTO_176 ?AUTO_174 ) ( not ( = ?AUTO_172 ?AUTO_174 ) ) ( CALIBRATION_TARGET ?AUTO_175 ?AUTO_174 ) ( NOT_CALIBRATED ?AUTO_175 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_176 ?AUTO_175 ?AUTO_174 )
      ( GET_IMAGE ?AUTO_172 ?AUTO_173 )
      ( GET_IMAGE-VERIFY ?AUTO_172 ?AUTO_173 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_177 - DIRECTION
      ?AUTO_178 - MODE
    )
    :vars
    (
      ?AUTO_180 - INSTRUMENT
      ?AUTO_181 - SATELLITE
      ?AUTO_179 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_180 ?AUTO_181 ) ( SUPPORTS ?AUTO_180 ?AUTO_178 ) ( POINTING ?AUTO_181 ?AUTO_179 ) ( not ( = ?AUTO_177 ?AUTO_179 ) ) ( CALIBRATION_TARGET ?AUTO_180 ?AUTO_179 ) ( POWER_AVAIL ?AUTO_181 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_180 ?AUTO_181 )
      ( GET_IMAGE ?AUTO_177 ?AUTO_178 )
      ( GET_IMAGE-VERIFY ?AUTO_177 ?AUTO_178 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_184 - DIRECTION
      ?AUTO_185 - MODE
    )
    :vars
    (
      ?AUTO_186 - INSTRUMENT
      ?AUTO_187 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_186 ) ( ON_BOARD ?AUTO_186 ?AUTO_187 ) ( SUPPORTS ?AUTO_186 ?AUTO_185 ) ( POWER_ON ?AUTO_186 ) ( POINTING ?AUTO_187 ?AUTO_184 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_187 ?AUTO_184 ?AUTO_186 ?AUTO_185 )
      ( GET_IMAGE-VERIFY ?AUTO_184 ?AUTO_185 ) )
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
    ( and ( ON_BOARD ?AUTO_190 ?AUTO_191 ) ( SUPPORTS ?AUTO_190 ?AUTO_189 ) ( POWER_ON ?AUTO_190 ) ( POINTING ?AUTO_191 ?AUTO_188 ) ( CALIBRATION_TARGET ?AUTO_190 ?AUTO_188 ) ( NOT_CALIBRATED ?AUTO_190 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_191 ?AUTO_190 ?AUTO_188 )
      ( GET_IMAGE ?AUTO_188 ?AUTO_189 )
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
    ( and ( ON_BOARD ?AUTO_194 ?AUTO_195 ) ( SUPPORTS ?AUTO_194 ?AUTO_193 ) ( POWER_ON ?AUTO_194 ) ( CALIBRATION_TARGET ?AUTO_194 ?AUTO_192 ) ( NOT_CALIBRATED ?AUTO_194 ) ( POINTING ?AUTO_195 ?AUTO_196 ) ( not ( = ?AUTO_192 ?AUTO_196 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_195 ?AUTO_192 ?AUTO_196 )
      ( GET_IMAGE ?AUTO_192 ?AUTO_193 )
      ( GET_IMAGE-VERIFY ?AUTO_192 ?AUTO_193 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_197 - DIRECTION
      ?AUTO_198 - MODE
    )
    :vars
    (
      ?AUTO_199 - INSTRUMENT
      ?AUTO_200 - SATELLITE
      ?AUTO_201 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_199 ?AUTO_200 ) ( SUPPORTS ?AUTO_199 ?AUTO_198 ) ( CALIBRATION_TARGET ?AUTO_199 ?AUTO_197 ) ( POINTING ?AUTO_200 ?AUTO_201 ) ( not ( = ?AUTO_197 ?AUTO_201 ) ) ( POWER_AVAIL ?AUTO_200 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_199 ?AUTO_200 )
      ( GET_IMAGE ?AUTO_197 ?AUTO_198 )
      ( GET_IMAGE-VERIFY ?AUTO_197 ?AUTO_198 ) )
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
      ?AUTO_214 - INSTRUMENT
      ?AUTO_215 - SATELLITE
      ?AUTO_216 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_214 ) ( ON_BOARD ?AUTO_214 ?AUTO_215 ) ( SUPPORTS ?AUTO_214 ?AUTO_213 ) ( POWER_ON ?AUTO_214 ) ( POINTING ?AUTO_215 ?AUTO_216 ) ( not ( = ?AUTO_212 ?AUTO_216 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_215 ?AUTO_212 ?AUTO_216 )
      ( GET_IMAGE ?AUTO_212 ?AUTO_213 )
      ( GET_IMAGE-VERIFY ?AUTO_212 ?AUTO_213 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_219 - DIRECTION
      ?AUTO_220 - MODE
    )
    :vars
    (
      ?AUTO_221 - INSTRUMENT
      ?AUTO_222 - SATELLITE
      ?AUTO_223 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_221 ?AUTO_222 ) ( SUPPORTS ?AUTO_221 ?AUTO_220 ) ( POWER_ON ?AUTO_221 ) ( POINTING ?AUTO_222 ?AUTO_223 ) ( not ( = ?AUTO_219 ?AUTO_223 ) ) ( CALIBRATION_TARGET ?AUTO_221 ?AUTO_223 ) ( NOT_CALIBRATED ?AUTO_221 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_222 ?AUTO_221 ?AUTO_223 )
      ( GET_IMAGE ?AUTO_219 ?AUTO_220 )
      ( GET_IMAGE-VERIFY ?AUTO_219 ?AUTO_220 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_224 - DIRECTION
      ?AUTO_225 - MODE
    )
    :vars
    (
      ?AUTO_226 - INSTRUMENT
      ?AUTO_227 - SATELLITE
      ?AUTO_228 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_226 ?AUTO_227 ) ( SUPPORTS ?AUTO_226 ?AUTO_225 ) ( POWER_ON ?AUTO_226 ) ( not ( = ?AUTO_224 ?AUTO_228 ) ) ( CALIBRATION_TARGET ?AUTO_226 ?AUTO_228 ) ( NOT_CALIBRATED ?AUTO_226 ) ( POINTING ?AUTO_227 ?AUTO_224 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_227 ?AUTO_228 ?AUTO_224 )
      ( GET_IMAGE ?AUTO_224 ?AUTO_225 )
      ( GET_IMAGE-VERIFY ?AUTO_224 ?AUTO_225 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_229 - DIRECTION
      ?AUTO_230 - MODE
    )
    :vars
    (
      ?AUTO_232 - INSTRUMENT
      ?AUTO_231 - SATELLITE
      ?AUTO_233 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_232 ?AUTO_231 ) ( SUPPORTS ?AUTO_232 ?AUTO_230 ) ( not ( = ?AUTO_229 ?AUTO_233 ) ) ( CALIBRATION_TARGET ?AUTO_232 ?AUTO_233 ) ( POINTING ?AUTO_231 ?AUTO_229 ) ( POWER_AVAIL ?AUTO_231 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_232 ?AUTO_231 )
      ( GET_IMAGE ?AUTO_229 ?AUTO_230 )
      ( GET_IMAGE-VERIFY ?AUTO_229 ?AUTO_230 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_234 - DIRECTION
      ?AUTO_235 - MODE
    )
    :vars
    (
      ?AUTO_238 - INSTRUMENT
      ?AUTO_237 - SATELLITE
      ?AUTO_236 - DIRECTION
      ?AUTO_239 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_238 ?AUTO_237 ) ( SUPPORTS ?AUTO_238 ?AUTO_235 ) ( not ( = ?AUTO_234 ?AUTO_236 ) ) ( CALIBRATION_TARGET ?AUTO_238 ?AUTO_236 ) ( POWER_AVAIL ?AUTO_237 ) ( POINTING ?AUTO_237 ?AUTO_239 ) ( not ( = ?AUTO_234 ?AUTO_239 ) ) ( not ( = ?AUTO_236 ?AUTO_239 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_237 ?AUTO_234 ?AUTO_239 )
      ( GET_IMAGE ?AUTO_234 ?AUTO_235 )
      ( GET_IMAGE-VERIFY ?AUTO_234 ?AUTO_235 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_244 - DIRECTION
      ?AUTO_245 - MODE
    )
    :vars
    (
      ?AUTO_246 - INSTRUMENT
      ?AUTO_247 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_246 ) ( ON_BOARD ?AUTO_246 ?AUTO_247 ) ( SUPPORTS ?AUTO_246 ?AUTO_245 ) ( POWER_ON ?AUTO_246 ) ( POINTING ?AUTO_247 ?AUTO_244 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_247 ?AUTO_244 ?AUTO_246 ?AUTO_245 )
      ( GET_IMAGE-VERIFY ?AUTO_244 ?AUTO_245 ) )
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
    ( and ( ON_BOARD ?AUTO_250 ?AUTO_251 ) ( SUPPORTS ?AUTO_250 ?AUTO_249 ) ( POWER_ON ?AUTO_250 ) ( POINTING ?AUTO_251 ?AUTO_248 ) ( CALIBRATION_TARGET ?AUTO_250 ?AUTO_248 ) ( NOT_CALIBRATED ?AUTO_250 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_251 ?AUTO_250 ?AUTO_248 )
      ( GET_IMAGE ?AUTO_248 ?AUTO_249 )
      ( GET_IMAGE-VERIFY ?AUTO_248 ?AUTO_249 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_254 - DIRECTION
      ?AUTO_255 - MODE
    )
    :vars
    (
      ?AUTO_257 - INSTRUMENT
      ?AUTO_256 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_257 ?AUTO_256 ) ( SUPPORTS ?AUTO_257 ?AUTO_255 ) ( POINTING ?AUTO_256 ?AUTO_254 ) ( CALIBRATION_TARGET ?AUTO_257 ?AUTO_254 ) ( POWER_AVAIL ?AUTO_256 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_257 ?AUTO_256 )
      ( GET_IMAGE ?AUTO_254 ?AUTO_255 )
      ( GET_IMAGE-VERIFY ?AUTO_254 ?AUTO_255 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_258 - DIRECTION
      ?AUTO_259 - MODE
    )
    :vars
    (
      ?AUTO_260 - INSTRUMENT
      ?AUTO_261 - SATELLITE
      ?AUTO_262 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_260 ?AUTO_261 ) ( SUPPORTS ?AUTO_260 ?AUTO_259 ) ( CALIBRATION_TARGET ?AUTO_260 ?AUTO_258 ) ( POWER_AVAIL ?AUTO_261 ) ( POINTING ?AUTO_261 ?AUTO_262 ) ( not ( = ?AUTO_258 ?AUTO_262 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_261 ?AUTO_258 ?AUTO_262 )
      ( GET_IMAGE ?AUTO_258 ?AUTO_259 )
      ( GET_IMAGE-VERIFY ?AUTO_258 ?AUTO_259 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_281 - DIRECTION
      ?AUTO_282 - MODE
    )
    :vars
    (
      ?AUTO_283 - INSTRUMENT
      ?AUTO_284 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_283 ) ( ON_BOARD ?AUTO_283 ?AUTO_284 ) ( SUPPORTS ?AUTO_283 ?AUTO_282 ) ( POWER_ON ?AUTO_283 ) ( POINTING ?AUTO_284 ?AUTO_281 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_284 ?AUTO_281 ?AUTO_283 ?AUTO_282 )
      ( GET_IMAGE-VERIFY ?AUTO_281 ?AUTO_282 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_285 - DIRECTION
      ?AUTO_286 - MODE
    )
    :vars
    (
      ?AUTO_287 - INSTRUMENT
      ?AUTO_288 - SATELLITE
      ?AUTO_289 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_287 ) ( ON_BOARD ?AUTO_287 ?AUTO_288 ) ( SUPPORTS ?AUTO_287 ?AUTO_286 ) ( POWER_ON ?AUTO_287 ) ( POINTING ?AUTO_288 ?AUTO_289 ) ( not ( = ?AUTO_285 ?AUTO_289 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_288 ?AUTO_285 ?AUTO_289 )
      ( GET_IMAGE ?AUTO_285 ?AUTO_286 )
      ( GET_IMAGE-VERIFY ?AUTO_285 ?AUTO_286 ) )
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
    ( and ( ON_BOARD ?AUTO_293 ?AUTO_292 ) ( SUPPORTS ?AUTO_293 ?AUTO_291 ) ( POWER_ON ?AUTO_293 ) ( POINTING ?AUTO_292 ?AUTO_294 ) ( not ( = ?AUTO_290 ?AUTO_294 ) ) ( CALIBRATION_TARGET ?AUTO_293 ?AUTO_294 ) ( NOT_CALIBRATED ?AUTO_293 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_292 ?AUTO_293 ?AUTO_294 )
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
      ?AUTO_297 - INSTRUMENT
      ?AUTO_298 - SATELLITE
      ?AUTO_299 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_297 ?AUTO_298 ) ( SUPPORTS ?AUTO_297 ?AUTO_296 ) ( POWER_ON ?AUTO_297 ) ( not ( = ?AUTO_295 ?AUTO_299 ) ) ( CALIBRATION_TARGET ?AUTO_297 ?AUTO_299 ) ( NOT_CALIBRATED ?AUTO_297 ) ( POINTING ?AUTO_298 ?AUTO_295 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_298 ?AUTO_299 ?AUTO_295 )
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
      ?AUTO_302 - INSTRUMENT
      ?AUTO_303 - SATELLITE
      ?AUTO_304 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_302 ?AUTO_303 ) ( SUPPORTS ?AUTO_302 ?AUTO_301 ) ( not ( = ?AUTO_300 ?AUTO_304 ) ) ( CALIBRATION_TARGET ?AUTO_302 ?AUTO_304 ) ( POINTING ?AUTO_303 ?AUTO_300 ) ( POWER_AVAIL ?AUTO_303 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_302 ?AUTO_303 )
      ( GET_IMAGE ?AUTO_300 ?AUTO_301 )
      ( GET_IMAGE-VERIFY ?AUTO_300 ?AUTO_301 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_309 - DIRECTION
      ?AUTO_310 - MODE
    )
    :vars
    (
      ?AUTO_313 - INSTRUMENT
      ?AUTO_311 - SATELLITE
      ?AUTO_312 - DIRECTION
      ?AUTO_314 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_313 ?AUTO_311 ) ( SUPPORTS ?AUTO_313 ?AUTO_310 ) ( not ( = ?AUTO_309 ?AUTO_312 ) ) ( CALIBRATION_TARGET ?AUTO_313 ?AUTO_312 ) ( POINTING ?AUTO_311 ?AUTO_309 ) ( ON_BOARD ?AUTO_314 ?AUTO_311 ) ( POWER_ON ?AUTO_314 ) ( not ( = ?AUTO_313 ?AUTO_314 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_314 ?AUTO_311 )
      ( GET_IMAGE ?AUTO_309 ?AUTO_310 )
      ( GET_IMAGE-VERIFY ?AUTO_309 ?AUTO_310 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_337 - DIRECTION
      ?AUTO_338 - MODE
    )
    :vars
    (
      ?AUTO_339 - INSTRUMENT
      ?AUTO_340 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_339 ) ( ON_BOARD ?AUTO_339 ?AUTO_340 ) ( SUPPORTS ?AUTO_339 ?AUTO_338 ) ( POWER_ON ?AUTO_339 ) ( POINTING ?AUTO_340 ?AUTO_337 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_340 ?AUTO_337 ?AUTO_339 ?AUTO_338 )
      ( GET_IMAGE-VERIFY ?AUTO_337 ?AUTO_338 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_341 - DIRECTION
      ?AUTO_342 - MODE
    )
    :vars
    (
      ?AUTO_343 - INSTRUMENT
      ?AUTO_344 - SATELLITE
      ?AUTO_345 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_343 ) ( ON_BOARD ?AUTO_343 ?AUTO_344 ) ( SUPPORTS ?AUTO_343 ?AUTO_342 ) ( POWER_ON ?AUTO_343 ) ( POINTING ?AUTO_344 ?AUTO_345 ) ( not ( = ?AUTO_341 ?AUTO_345 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_344 ?AUTO_341 ?AUTO_345 )
      ( GET_IMAGE ?AUTO_341 ?AUTO_342 )
      ( GET_IMAGE-VERIFY ?AUTO_341 ?AUTO_342 ) )
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
      ?AUTO_356 - DIRECTION
      ?AUTO_357 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_354 ?AUTO_355 ) ( SUPPORTS ?AUTO_354 ?AUTO_353 ) ( POWER_ON ?AUTO_354 ) ( not ( = ?AUTO_352 ?AUTO_356 ) ) ( CALIBRATION_TARGET ?AUTO_354 ?AUTO_356 ) ( NOT_CALIBRATED ?AUTO_354 ) ( POINTING ?AUTO_355 ?AUTO_357 ) ( not ( = ?AUTO_356 ?AUTO_357 ) ) ( not ( = ?AUTO_352 ?AUTO_357 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_355 ?AUTO_356 ?AUTO_357 )
      ( GET_IMAGE ?AUTO_352 ?AUTO_353 )
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
      ?AUTO_361 - SATELLITE
      ?AUTO_362 - DIRECTION
      ?AUTO_363 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_360 ?AUTO_361 ) ( SUPPORTS ?AUTO_360 ?AUTO_359 ) ( not ( = ?AUTO_358 ?AUTO_362 ) ) ( CALIBRATION_TARGET ?AUTO_360 ?AUTO_362 ) ( POINTING ?AUTO_361 ?AUTO_363 ) ( not ( = ?AUTO_362 ?AUTO_363 ) ) ( not ( = ?AUTO_358 ?AUTO_363 ) ) ( POWER_AVAIL ?AUTO_361 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_360 ?AUTO_361 )
      ( GET_IMAGE ?AUTO_358 ?AUTO_359 )
      ( GET_IMAGE-VERIFY ?AUTO_358 ?AUTO_359 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_366 - DIRECTION
      ?AUTO_367 - MODE
    )
    :vars
    (
      ?AUTO_368 - INSTRUMENT
      ?AUTO_369 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_368 ) ( ON_BOARD ?AUTO_368 ?AUTO_369 ) ( SUPPORTS ?AUTO_368 ?AUTO_367 ) ( POWER_ON ?AUTO_368 ) ( POINTING ?AUTO_369 ?AUTO_366 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_369 ?AUTO_366 ?AUTO_368 ?AUTO_367 )
      ( GET_IMAGE-VERIFY ?AUTO_366 ?AUTO_367 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_370 - DIRECTION
      ?AUTO_371 - MODE
    )
    :vars
    (
      ?AUTO_372 - INSTRUMENT
      ?AUTO_373 - SATELLITE
      ?AUTO_374 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_372 ) ( ON_BOARD ?AUTO_372 ?AUTO_373 ) ( SUPPORTS ?AUTO_372 ?AUTO_371 ) ( POWER_ON ?AUTO_372 ) ( POINTING ?AUTO_373 ?AUTO_374 ) ( not ( = ?AUTO_370 ?AUTO_374 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_373 ?AUTO_370 ?AUTO_374 )
      ( GET_IMAGE ?AUTO_370 ?AUTO_371 )
      ( GET_IMAGE-VERIFY ?AUTO_370 ?AUTO_371 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_375 - DIRECTION
      ?AUTO_376 - MODE
    )
    :vars
    (
      ?AUTO_378 - INSTRUMENT
      ?AUTO_377 - SATELLITE
      ?AUTO_379 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_378 ?AUTO_377 ) ( SUPPORTS ?AUTO_378 ?AUTO_376 ) ( POWER_ON ?AUTO_378 ) ( POINTING ?AUTO_377 ?AUTO_379 ) ( not ( = ?AUTO_375 ?AUTO_379 ) ) ( CALIBRATION_TARGET ?AUTO_378 ?AUTO_379 ) ( NOT_CALIBRATED ?AUTO_378 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_377 ?AUTO_378 ?AUTO_379 )
      ( GET_IMAGE ?AUTO_375 ?AUTO_376 )
      ( GET_IMAGE-VERIFY ?AUTO_375 ?AUTO_376 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_380 - DIRECTION
      ?AUTO_381 - MODE
    )
    :vars
    (
      ?AUTO_382 - INSTRUMENT
      ?AUTO_383 - SATELLITE
      ?AUTO_384 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_382 ?AUTO_383 ) ( SUPPORTS ?AUTO_382 ?AUTO_381 ) ( POWER_ON ?AUTO_382 ) ( not ( = ?AUTO_380 ?AUTO_384 ) ) ( CALIBRATION_TARGET ?AUTO_382 ?AUTO_384 ) ( NOT_CALIBRATED ?AUTO_382 ) ( POINTING ?AUTO_383 ?AUTO_380 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_383 ?AUTO_384 ?AUTO_380 )
      ( GET_IMAGE ?AUTO_380 ?AUTO_381 )
      ( GET_IMAGE-VERIFY ?AUTO_380 ?AUTO_381 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_385 - DIRECTION
      ?AUTO_386 - MODE
    )
    :vars
    (
      ?AUTO_387 - INSTRUMENT
      ?AUTO_388 - SATELLITE
      ?AUTO_389 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_387 ?AUTO_388 ) ( SUPPORTS ?AUTO_387 ?AUTO_386 ) ( not ( = ?AUTO_385 ?AUTO_389 ) ) ( CALIBRATION_TARGET ?AUTO_387 ?AUTO_389 ) ( POINTING ?AUTO_388 ?AUTO_385 ) ( POWER_AVAIL ?AUTO_388 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_387 ?AUTO_388 )
      ( GET_IMAGE ?AUTO_385 ?AUTO_386 )
      ( GET_IMAGE-VERIFY ?AUTO_385 ?AUTO_386 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_394 - DIRECTION
      ?AUTO_395 - MODE
    )
    :vars
    (
      ?AUTO_396 - INSTRUMENT
      ?AUTO_397 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_396 ) ( ON_BOARD ?AUTO_396 ?AUTO_397 ) ( SUPPORTS ?AUTO_396 ?AUTO_395 ) ( POWER_ON ?AUTO_396 ) ( POINTING ?AUTO_397 ?AUTO_394 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_397 ?AUTO_394 ?AUTO_396 ?AUTO_395 )
      ( GET_IMAGE-VERIFY ?AUTO_394 ?AUTO_395 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_398 - DIRECTION
      ?AUTO_399 - MODE
    )
    :vars
    (
      ?AUTO_400 - INSTRUMENT
      ?AUTO_401 - SATELLITE
      ?AUTO_402 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_400 ) ( ON_BOARD ?AUTO_400 ?AUTO_401 ) ( SUPPORTS ?AUTO_400 ?AUTO_399 ) ( POWER_ON ?AUTO_400 ) ( POINTING ?AUTO_401 ?AUTO_402 ) ( not ( = ?AUTO_398 ?AUTO_402 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_401 ?AUTO_398 ?AUTO_402 )
      ( GET_IMAGE ?AUTO_398 ?AUTO_399 )
      ( GET_IMAGE-VERIFY ?AUTO_398 ?AUTO_399 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_405 - DIRECTION
      ?AUTO_406 - MODE
    )
    :vars
    (
      ?AUTO_408 - INSTRUMENT
      ?AUTO_409 - SATELLITE
      ?AUTO_407 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_408 ?AUTO_409 ) ( SUPPORTS ?AUTO_408 ?AUTO_406 ) ( POWER_ON ?AUTO_408 ) ( POINTING ?AUTO_409 ?AUTO_407 ) ( not ( = ?AUTO_405 ?AUTO_407 ) ) ( CALIBRATION_TARGET ?AUTO_408 ?AUTO_407 ) ( NOT_CALIBRATED ?AUTO_408 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_409 ?AUTO_408 ?AUTO_407 )
      ( GET_IMAGE ?AUTO_405 ?AUTO_406 )
      ( GET_IMAGE-VERIFY ?AUTO_405 ?AUTO_406 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_410 - DIRECTION
      ?AUTO_411 - MODE
    )
    :vars
    (
      ?AUTO_412 - INSTRUMENT
      ?AUTO_414 - SATELLITE
      ?AUTO_413 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_412 ?AUTO_414 ) ( SUPPORTS ?AUTO_412 ?AUTO_411 ) ( POINTING ?AUTO_414 ?AUTO_413 ) ( not ( = ?AUTO_410 ?AUTO_413 ) ) ( CALIBRATION_TARGET ?AUTO_412 ?AUTO_413 ) ( POWER_AVAIL ?AUTO_414 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_412 ?AUTO_414 )
      ( GET_IMAGE ?AUTO_410 ?AUTO_411 )
      ( GET_IMAGE-VERIFY ?AUTO_410 ?AUTO_411 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_425 - DIRECTION
      ?AUTO_426 - MODE
    )
    :vars
    (
      ?AUTO_428 - INSTRUMENT
      ?AUTO_429 - SATELLITE
      ?AUTO_427 - DIRECTION
      ?AUTO_430 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_428 ?AUTO_429 ) ( SUPPORTS ?AUTO_428 ?AUTO_426 ) ( not ( = ?AUTO_425 ?AUTO_427 ) ) ( CALIBRATION_TARGET ?AUTO_428 ?AUTO_427 ) ( POWER_AVAIL ?AUTO_429 ) ( POINTING ?AUTO_429 ?AUTO_430 ) ( not ( = ?AUTO_427 ?AUTO_430 ) ) ( not ( = ?AUTO_425 ?AUTO_430 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_429 ?AUTO_427 ?AUTO_430 )
      ( GET_IMAGE ?AUTO_425 ?AUTO_426 )
      ( GET_IMAGE-VERIFY ?AUTO_425 ?AUTO_426 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_433 - DIRECTION
      ?AUTO_434 - MODE
    )
    :vars
    (
      ?AUTO_435 - INSTRUMENT
      ?AUTO_436 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_435 ) ( ON_BOARD ?AUTO_435 ?AUTO_436 ) ( SUPPORTS ?AUTO_435 ?AUTO_434 ) ( POWER_ON ?AUTO_435 ) ( POINTING ?AUTO_436 ?AUTO_433 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_436 ?AUTO_433 ?AUTO_435 ?AUTO_434 )
      ( GET_IMAGE-VERIFY ?AUTO_433 ?AUTO_434 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_437 - DIRECTION
      ?AUTO_438 - MODE
    )
    :vars
    (
      ?AUTO_439 - INSTRUMENT
      ?AUTO_440 - SATELLITE
      ?AUTO_441 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_439 ) ( ON_BOARD ?AUTO_439 ?AUTO_440 ) ( SUPPORTS ?AUTO_439 ?AUTO_438 ) ( POWER_ON ?AUTO_439 ) ( POINTING ?AUTO_440 ?AUTO_441 ) ( not ( = ?AUTO_437 ?AUTO_441 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_440 ?AUTO_437 ?AUTO_441 )
      ( GET_IMAGE ?AUTO_437 ?AUTO_438 )
      ( GET_IMAGE-VERIFY ?AUTO_437 ?AUTO_438 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_442 - DIRECTION
      ?AUTO_443 - MODE
    )
    :vars
    (
      ?AUTO_445 - INSTRUMENT
      ?AUTO_444 - SATELLITE
      ?AUTO_446 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_445 ?AUTO_444 ) ( SUPPORTS ?AUTO_445 ?AUTO_443 ) ( POWER_ON ?AUTO_445 ) ( POINTING ?AUTO_444 ?AUTO_446 ) ( not ( = ?AUTO_442 ?AUTO_446 ) ) ( CALIBRATION_TARGET ?AUTO_445 ?AUTO_446 ) ( NOT_CALIBRATED ?AUTO_445 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_444 ?AUTO_445 ?AUTO_446 )
      ( GET_IMAGE ?AUTO_442 ?AUTO_443 )
      ( GET_IMAGE-VERIFY ?AUTO_442 ?AUTO_443 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_447 - DIRECTION
      ?AUTO_448 - MODE
    )
    :vars
    (
      ?AUTO_449 - INSTRUMENT
      ?AUTO_450 - SATELLITE
      ?AUTO_451 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_449 ?AUTO_450 ) ( SUPPORTS ?AUTO_449 ?AUTO_448 ) ( POINTING ?AUTO_450 ?AUTO_451 ) ( not ( = ?AUTO_447 ?AUTO_451 ) ) ( CALIBRATION_TARGET ?AUTO_449 ?AUTO_451 ) ( POWER_AVAIL ?AUTO_450 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_449 ?AUTO_450 )
      ( GET_IMAGE ?AUTO_447 ?AUTO_448 )
      ( GET_IMAGE-VERIFY ?AUTO_447 ?AUTO_448 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_452 - DIRECTION
      ?AUTO_453 - MODE
    )
    :vars
    (
      ?AUTO_454 - INSTRUMENT
      ?AUTO_455 - SATELLITE
      ?AUTO_456 - DIRECTION
      ?AUTO_457 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_454 ?AUTO_455 ) ( SUPPORTS ?AUTO_454 ?AUTO_453 ) ( POINTING ?AUTO_455 ?AUTO_456 ) ( not ( = ?AUTO_452 ?AUTO_456 ) ) ( CALIBRATION_TARGET ?AUTO_454 ?AUTO_456 ) ( ON_BOARD ?AUTO_457 ?AUTO_455 ) ( POWER_ON ?AUTO_457 ) ( not ( = ?AUTO_454 ?AUTO_457 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_457 ?AUTO_455 )
      ( GET_IMAGE ?AUTO_452 ?AUTO_453 )
      ( GET_IMAGE-VERIFY ?AUTO_452 ?AUTO_453 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_460 - DIRECTION
      ?AUTO_461 - MODE
    )
    :vars
    (
      ?AUTO_463 - INSTRUMENT
      ?AUTO_465 - SATELLITE
      ?AUTO_462 - DIRECTION
      ?AUTO_464 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_463 ?AUTO_465 ) ( SUPPORTS ?AUTO_463 ?AUTO_461 ) ( not ( = ?AUTO_460 ?AUTO_462 ) ) ( CALIBRATION_TARGET ?AUTO_463 ?AUTO_462 ) ( ON_BOARD ?AUTO_464 ?AUTO_465 ) ( POWER_ON ?AUTO_464 ) ( not ( = ?AUTO_463 ?AUTO_464 ) ) ( POINTING ?AUTO_465 ?AUTO_460 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_465 ?AUTO_462 ?AUTO_460 )
      ( GET_IMAGE ?AUTO_460 ?AUTO_461 )
      ( GET_IMAGE-VERIFY ?AUTO_460 ?AUTO_461 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_466 - DIRECTION
      ?AUTO_467 - MODE
    )
    :vars
    (
      ?AUTO_469 - INSTRUMENT
      ?AUTO_471 - SATELLITE
      ?AUTO_468 - DIRECTION
      ?AUTO_470 - INSTRUMENT
      ?AUTO_472 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_469 ?AUTO_471 ) ( SUPPORTS ?AUTO_469 ?AUTO_467 ) ( not ( = ?AUTO_466 ?AUTO_468 ) ) ( CALIBRATION_TARGET ?AUTO_469 ?AUTO_468 ) ( ON_BOARD ?AUTO_470 ?AUTO_471 ) ( POWER_ON ?AUTO_470 ) ( not ( = ?AUTO_469 ?AUTO_470 ) ) ( POINTING ?AUTO_471 ?AUTO_472 ) ( not ( = ?AUTO_466 ?AUTO_472 ) ) ( not ( = ?AUTO_468 ?AUTO_472 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_471 ?AUTO_466 ?AUTO_472 )
      ( GET_IMAGE ?AUTO_466 ?AUTO_467 )
      ( GET_IMAGE-VERIFY ?AUTO_466 ?AUTO_467 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_475 - DIRECTION
      ?AUTO_476 - MODE
    )
    :vars
    (
      ?AUTO_481 - INSTRUMENT
      ?AUTO_478 - SATELLITE
      ?AUTO_480 - DIRECTION
      ?AUTO_477 - INSTRUMENT
      ?AUTO_479 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_481 ?AUTO_478 ) ( SUPPORTS ?AUTO_481 ?AUTO_476 ) ( not ( = ?AUTO_475 ?AUTO_480 ) ) ( CALIBRATION_TARGET ?AUTO_481 ?AUTO_480 ) ( ON_BOARD ?AUTO_477 ?AUTO_478 ) ( not ( = ?AUTO_481 ?AUTO_477 ) ) ( POINTING ?AUTO_478 ?AUTO_479 ) ( not ( = ?AUTO_475 ?AUTO_479 ) ) ( not ( = ?AUTO_480 ?AUTO_479 ) ) ( POWER_AVAIL ?AUTO_478 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_477 ?AUTO_478 )
      ( GET_IMAGE ?AUTO_475 ?AUTO_476 )
      ( GET_IMAGE-VERIFY ?AUTO_475 ?AUTO_476 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_496 - DIRECTION
      ?AUTO_497 - MODE
    )
    :vars
    (
      ?AUTO_498 - INSTRUMENT
      ?AUTO_499 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_498 ) ( ON_BOARD ?AUTO_498 ?AUTO_499 ) ( SUPPORTS ?AUTO_498 ?AUTO_497 ) ( POWER_ON ?AUTO_498 ) ( POINTING ?AUTO_499 ?AUTO_496 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_499 ?AUTO_496 ?AUTO_498 ?AUTO_497 )
      ( GET_IMAGE-VERIFY ?AUTO_496 ?AUTO_497 ) )
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
      ?AUTO_504 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_502 ) ( ON_BOARD ?AUTO_502 ?AUTO_503 ) ( SUPPORTS ?AUTO_502 ?AUTO_501 ) ( POWER_ON ?AUTO_502 ) ( POINTING ?AUTO_503 ?AUTO_504 ) ( not ( = ?AUTO_500 ?AUTO_504 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_503 ?AUTO_500 ?AUTO_504 )
      ( GET_IMAGE ?AUTO_500 ?AUTO_501 )
      ( GET_IMAGE-VERIFY ?AUTO_500 ?AUTO_501 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_505 - DIRECTION
      ?AUTO_506 - MODE
    )
    :vars
    (
      ?AUTO_508 - INSTRUMENT
      ?AUTO_507 - SATELLITE
      ?AUTO_509 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_508 ?AUTO_507 ) ( SUPPORTS ?AUTO_508 ?AUTO_506 ) ( POWER_ON ?AUTO_508 ) ( POINTING ?AUTO_507 ?AUTO_509 ) ( not ( = ?AUTO_505 ?AUTO_509 ) ) ( CALIBRATION_TARGET ?AUTO_508 ?AUTO_509 ) ( NOT_CALIBRATED ?AUTO_508 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_507 ?AUTO_508 ?AUTO_509 )
      ( GET_IMAGE ?AUTO_505 ?AUTO_506 )
      ( GET_IMAGE-VERIFY ?AUTO_505 ?AUTO_506 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_510 - DIRECTION
      ?AUTO_511 - MODE
    )
    :vars
    (
      ?AUTO_512 - INSTRUMENT
      ?AUTO_513 - SATELLITE
      ?AUTO_514 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_512 ?AUTO_513 ) ( SUPPORTS ?AUTO_512 ?AUTO_511 ) ( POINTING ?AUTO_513 ?AUTO_514 ) ( not ( = ?AUTO_510 ?AUTO_514 ) ) ( CALIBRATION_TARGET ?AUTO_512 ?AUTO_514 ) ( POWER_AVAIL ?AUTO_513 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_512 ?AUTO_513 )
      ( GET_IMAGE ?AUTO_510 ?AUTO_511 )
      ( GET_IMAGE-VERIFY ?AUTO_510 ?AUTO_511 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_515 - DIRECTION
      ?AUTO_516 - MODE
    )
    :vars
    (
      ?AUTO_517 - INSTRUMENT
      ?AUTO_518 - SATELLITE
      ?AUTO_519 - DIRECTION
      ?AUTO_520 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_517 ?AUTO_518 ) ( SUPPORTS ?AUTO_517 ?AUTO_516 ) ( POINTING ?AUTO_518 ?AUTO_519 ) ( not ( = ?AUTO_515 ?AUTO_519 ) ) ( CALIBRATION_TARGET ?AUTO_517 ?AUTO_519 ) ( ON_BOARD ?AUTO_520 ?AUTO_518 ) ( POWER_ON ?AUTO_520 ) ( not ( = ?AUTO_517 ?AUTO_520 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_520 ?AUTO_518 )
      ( GET_IMAGE ?AUTO_515 ?AUTO_516 )
      ( GET_IMAGE-VERIFY ?AUTO_515 ?AUTO_516 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_523 - DIRECTION
      ?AUTO_524 - MODE
    )
    :vars
    (
      ?AUTO_526 - INSTRUMENT
      ?AUTO_528 - SATELLITE
      ?AUTO_525 - DIRECTION
      ?AUTO_527 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_526 ?AUTO_528 ) ( SUPPORTS ?AUTO_526 ?AUTO_524 ) ( not ( = ?AUTO_523 ?AUTO_525 ) ) ( CALIBRATION_TARGET ?AUTO_526 ?AUTO_525 ) ( ON_BOARD ?AUTO_527 ?AUTO_528 ) ( POWER_ON ?AUTO_527 ) ( not ( = ?AUTO_526 ?AUTO_527 ) ) ( POINTING ?AUTO_528 ?AUTO_523 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_528 ?AUTO_525 ?AUTO_523 )
      ( GET_IMAGE ?AUTO_523 ?AUTO_524 )
      ( GET_IMAGE-VERIFY ?AUTO_523 ?AUTO_524 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_531 - DIRECTION
      ?AUTO_532 - MODE
    )
    :vars
    (
      ?AUTO_535 - INSTRUMENT
      ?AUTO_533 - SATELLITE
      ?AUTO_534 - DIRECTION
      ?AUTO_536 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_535 ?AUTO_533 ) ( SUPPORTS ?AUTO_535 ?AUTO_532 ) ( not ( = ?AUTO_531 ?AUTO_534 ) ) ( CALIBRATION_TARGET ?AUTO_535 ?AUTO_534 ) ( ON_BOARD ?AUTO_536 ?AUTO_533 ) ( not ( = ?AUTO_535 ?AUTO_536 ) ) ( POINTING ?AUTO_533 ?AUTO_531 ) ( POWER_AVAIL ?AUTO_533 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_536 ?AUTO_533 )
      ( GET_IMAGE ?AUTO_531 ?AUTO_532 )
      ( GET_IMAGE-VERIFY ?AUTO_531 ?AUTO_532 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_539 - DIRECTION
      ?AUTO_540 - MODE
    )
    :vars
    (
      ?AUTO_541 - INSTRUMENT
      ?AUTO_542 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_541 ) ( ON_BOARD ?AUTO_541 ?AUTO_542 ) ( SUPPORTS ?AUTO_541 ?AUTO_540 ) ( POWER_ON ?AUTO_541 ) ( POINTING ?AUTO_542 ?AUTO_539 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_542 ?AUTO_539 ?AUTO_541 ?AUTO_540 )
      ( GET_IMAGE-VERIFY ?AUTO_539 ?AUTO_540 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_543 - DIRECTION
      ?AUTO_544 - MODE
    )
    :vars
    (
      ?AUTO_545 - INSTRUMENT
      ?AUTO_546 - SATELLITE
      ?AUTO_547 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_545 ) ( ON_BOARD ?AUTO_545 ?AUTO_546 ) ( SUPPORTS ?AUTO_545 ?AUTO_544 ) ( POWER_ON ?AUTO_545 ) ( POINTING ?AUTO_546 ?AUTO_547 ) ( not ( = ?AUTO_543 ?AUTO_547 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_546 ?AUTO_543 ?AUTO_547 )
      ( GET_IMAGE ?AUTO_543 ?AUTO_544 )
      ( GET_IMAGE-VERIFY ?AUTO_543 ?AUTO_544 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_548 - DIRECTION
      ?AUTO_549 - MODE
    )
    :vars
    (
      ?AUTO_551 - INSTRUMENT
      ?AUTO_550 - SATELLITE
      ?AUTO_552 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_551 ?AUTO_550 ) ( SUPPORTS ?AUTO_551 ?AUTO_549 ) ( POWER_ON ?AUTO_551 ) ( POINTING ?AUTO_550 ?AUTO_552 ) ( not ( = ?AUTO_548 ?AUTO_552 ) ) ( CALIBRATION_TARGET ?AUTO_551 ?AUTO_552 ) ( NOT_CALIBRATED ?AUTO_551 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_550 ?AUTO_551 ?AUTO_552 )
      ( GET_IMAGE ?AUTO_548 ?AUTO_549 )
      ( GET_IMAGE-VERIFY ?AUTO_548 ?AUTO_549 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_553 - DIRECTION
      ?AUTO_554 - MODE
    )
    :vars
    (
      ?AUTO_555 - INSTRUMENT
      ?AUTO_556 - SATELLITE
      ?AUTO_557 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_555 ?AUTO_556 ) ( SUPPORTS ?AUTO_555 ?AUTO_554 ) ( POINTING ?AUTO_556 ?AUTO_557 ) ( not ( = ?AUTO_553 ?AUTO_557 ) ) ( CALIBRATION_TARGET ?AUTO_555 ?AUTO_557 ) ( POWER_AVAIL ?AUTO_556 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_555 ?AUTO_556 )
      ( GET_IMAGE ?AUTO_553 ?AUTO_554 )
      ( GET_IMAGE-VERIFY ?AUTO_553 ?AUTO_554 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_558 - DIRECTION
      ?AUTO_559 - MODE
    )
    :vars
    (
      ?AUTO_560 - INSTRUMENT
      ?AUTO_561 - SATELLITE
      ?AUTO_562 - DIRECTION
      ?AUTO_563 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_560 ?AUTO_561 ) ( SUPPORTS ?AUTO_560 ?AUTO_559 ) ( not ( = ?AUTO_558 ?AUTO_562 ) ) ( CALIBRATION_TARGET ?AUTO_560 ?AUTO_562 ) ( POWER_AVAIL ?AUTO_561 ) ( POINTING ?AUTO_561 ?AUTO_563 ) ( not ( = ?AUTO_562 ?AUTO_563 ) ) ( not ( = ?AUTO_558 ?AUTO_563 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_561 ?AUTO_562 ?AUTO_563 )
      ( GET_IMAGE ?AUTO_558 ?AUTO_559 )
      ( GET_IMAGE-VERIFY ?AUTO_558 ?AUTO_559 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_566 - DIRECTION
      ?AUTO_567 - MODE
    )
    :vars
    (
      ?AUTO_568 - INSTRUMENT
      ?AUTO_569 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_568 ) ( ON_BOARD ?AUTO_568 ?AUTO_569 ) ( SUPPORTS ?AUTO_568 ?AUTO_567 ) ( POWER_ON ?AUTO_568 ) ( POINTING ?AUTO_569 ?AUTO_566 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_569 ?AUTO_566 ?AUTO_568 ?AUTO_567 )
      ( GET_IMAGE-VERIFY ?AUTO_566 ?AUTO_567 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_570 - DIRECTION
      ?AUTO_571 - MODE
    )
    :vars
    (
      ?AUTO_572 - INSTRUMENT
      ?AUTO_573 - SATELLITE
      ?AUTO_574 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_572 ) ( ON_BOARD ?AUTO_572 ?AUTO_573 ) ( SUPPORTS ?AUTO_572 ?AUTO_571 ) ( POWER_ON ?AUTO_572 ) ( POINTING ?AUTO_573 ?AUTO_574 ) ( not ( = ?AUTO_570 ?AUTO_574 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_573 ?AUTO_570 ?AUTO_574 )
      ( GET_IMAGE ?AUTO_570 ?AUTO_571 )
      ( GET_IMAGE-VERIFY ?AUTO_570 ?AUTO_571 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_585 - DIRECTION
      ?AUTO_586 - MODE
    )
    :vars
    (
      ?AUTO_589 - INSTRUMENT
      ?AUTO_587 - SATELLITE
      ?AUTO_588 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_589 ?AUTO_587 ) ( SUPPORTS ?AUTO_589 ?AUTO_586 ) ( not ( = ?AUTO_585 ?AUTO_588 ) ) ( CALIBRATION_TARGET ?AUTO_589 ?AUTO_588 ) ( POWER_AVAIL ?AUTO_587 ) ( POINTING ?AUTO_587 ?AUTO_585 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_587 ?AUTO_588 ?AUTO_585 )
      ( GET_IMAGE ?AUTO_585 ?AUTO_586 )
      ( GET_IMAGE-VERIFY ?AUTO_585 ?AUTO_586 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_592 - DIRECTION
      ?AUTO_593 - MODE
    )
    :vars
    (
      ?AUTO_594 - INSTRUMENT
      ?AUTO_595 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_594 ) ( ON_BOARD ?AUTO_594 ?AUTO_595 ) ( SUPPORTS ?AUTO_594 ?AUTO_593 ) ( POWER_ON ?AUTO_594 ) ( POINTING ?AUTO_595 ?AUTO_592 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_595 ?AUTO_592 ?AUTO_594 ?AUTO_593 )
      ( GET_IMAGE-VERIFY ?AUTO_592 ?AUTO_593 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_596 - DIRECTION
      ?AUTO_597 - MODE
    )
    :vars
    (
      ?AUTO_598 - INSTRUMENT
      ?AUTO_599 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_598 ?AUTO_599 ) ( SUPPORTS ?AUTO_598 ?AUTO_597 ) ( POWER_ON ?AUTO_598 ) ( POINTING ?AUTO_599 ?AUTO_596 ) ( CALIBRATION_TARGET ?AUTO_598 ?AUTO_596 ) ( NOT_CALIBRATED ?AUTO_598 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_599 ?AUTO_598 ?AUTO_596 )
      ( GET_IMAGE ?AUTO_596 ?AUTO_597 )
      ( GET_IMAGE-VERIFY ?AUTO_596 ?AUTO_597 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_600 - DIRECTION
      ?AUTO_601 - MODE
    )
    :vars
    (
      ?AUTO_603 - INSTRUMENT
      ?AUTO_602 - SATELLITE
      ?AUTO_604 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_603 ?AUTO_602 ) ( SUPPORTS ?AUTO_603 ?AUTO_601 ) ( POWER_ON ?AUTO_603 ) ( CALIBRATION_TARGET ?AUTO_603 ?AUTO_600 ) ( NOT_CALIBRATED ?AUTO_603 ) ( POINTING ?AUTO_602 ?AUTO_604 ) ( not ( = ?AUTO_600 ?AUTO_604 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_602 ?AUTO_600 ?AUTO_604 )
      ( GET_IMAGE ?AUTO_600 ?AUTO_601 )
      ( GET_IMAGE-VERIFY ?AUTO_600 ?AUTO_601 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_605 - DIRECTION
      ?AUTO_606 - MODE
    )
    :vars
    (
      ?AUTO_608 - INSTRUMENT
      ?AUTO_607 - SATELLITE
      ?AUTO_609 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_608 ?AUTO_607 ) ( SUPPORTS ?AUTO_608 ?AUTO_606 ) ( CALIBRATION_TARGET ?AUTO_608 ?AUTO_605 ) ( POINTING ?AUTO_607 ?AUTO_609 ) ( not ( = ?AUTO_605 ?AUTO_609 ) ) ( POWER_AVAIL ?AUTO_607 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_608 ?AUTO_607 )
      ( GET_IMAGE ?AUTO_605 ?AUTO_606 )
      ( GET_IMAGE-VERIFY ?AUTO_605 ?AUTO_606 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_610 - DIRECTION
      ?AUTO_611 - MODE
    )
    :vars
    (
      ?AUTO_612 - INSTRUMENT
      ?AUTO_613 - SATELLITE
      ?AUTO_614 - DIRECTION
      ?AUTO_615 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_612 ?AUTO_613 ) ( SUPPORTS ?AUTO_612 ?AUTO_611 ) ( CALIBRATION_TARGET ?AUTO_612 ?AUTO_610 ) ( POINTING ?AUTO_613 ?AUTO_614 ) ( not ( = ?AUTO_610 ?AUTO_614 ) ) ( ON_BOARD ?AUTO_615 ?AUTO_613 ) ( POWER_ON ?AUTO_615 ) ( not ( = ?AUTO_612 ?AUTO_615 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_615 ?AUTO_613 )
      ( GET_IMAGE ?AUTO_610 ?AUTO_611 )
      ( GET_IMAGE-VERIFY ?AUTO_610 ?AUTO_611 ) )
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
      ?AUTO_620 - SATELLITE
      ?AUTO_622 - DIRECTION
      ?AUTO_621 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_623 ?AUTO_620 ) ( SUPPORTS ?AUTO_623 ?AUTO_619 ) ( CALIBRATION_TARGET ?AUTO_623 ?AUTO_618 ) ( not ( = ?AUTO_618 ?AUTO_622 ) ) ( ON_BOARD ?AUTO_621 ?AUTO_620 ) ( POWER_ON ?AUTO_621 ) ( not ( = ?AUTO_623 ?AUTO_621 ) ) ( POINTING ?AUTO_620 ?AUTO_618 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_620 ?AUTO_622 ?AUTO_618 )
      ( GET_IMAGE ?AUTO_618 ?AUTO_619 )
      ( GET_IMAGE-VERIFY ?AUTO_618 ?AUTO_619 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_638 - DIRECTION
      ?AUTO_639 - MODE
    )
    :vars
    (
      ?AUTO_640 - INSTRUMENT
      ?AUTO_641 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_640 ) ( ON_BOARD ?AUTO_640 ?AUTO_641 ) ( SUPPORTS ?AUTO_640 ?AUTO_639 ) ( POWER_ON ?AUTO_640 ) ( POINTING ?AUTO_641 ?AUTO_638 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_641 ?AUTO_638 ?AUTO_640 ?AUTO_639 )
      ( GET_IMAGE-VERIFY ?AUTO_638 ?AUTO_639 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_642 - DIRECTION
      ?AUTO_643 - MODE
    )
    :vars
    (
      ?AUTO_644 - INSTRUMENT
      ?AUTO_645 - SATELLITE
      ?AUTO_646 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_644 ) ( ON_BOARD ?AUTO_644 ?AUTO_645 ) ( SUPPORTS ?AUTO_644 ?AUTO_643 ) ( POWER_ON ?AUTO_644 ) ( POINTING ?AUTO_645 ?AUTO_646 ) ( not ( = ?AUTO_642 ?AUTO_646 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_645 ?AUTO_642 ?AUTO_646 )
      ( GET_IMAGE ?AUTO_642 ?AUTO_643 )
      ( GET_IMAGE-VERIFY ?AUTO_642 ?AUTO_643 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_649 - DIRECTION
      ?AUTO_650 - MODE
    )
    :vars
    (
      ?AUTO_652 - INSTRUMENT
      ?AUTO_653 - SATELLITE
      ?AUTO_651 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_652 ?AUTO_653 ) ( SUPPORTS ?AUTO_652 ?AUTO_650 ) ( POWER_ON ?AUTO_652 ) ( POINTING ?AUTO_653 ?AUTO_651 ) ( not ( = ?AUTO_649 ?AUTO_651 ) ) ( CALIBRATION_TARGET ?AUTO_652 ?AUTO_651 ) ( NOT_CALIBRATED ?AUTO_652 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_653 ?AUTO_652 ?AUTO_651 )
      ( GET_IMAGE ?AUTO_649 ?AUTO_650 )
      ( GET_IMAGE-VERIFY ?AUTO_649 ?AUTO_650 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_654 - DIRECTION
      ?AUTO_655 - MODE
    )
    :vars
    (
      ?AUTO_657 - INSTRUMENT
      ?AUTO_658 - SATELLITE
      ?AUTO_656 - DIRECTION
      ?AUTO_659 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_657 ?AUTO_658 ) ( SUPPORTS ?AUTO_657 ?AUTO_655 ) ( POWER_ON ?AUTO_657 ) ( not ( = ?AUTO_654 ?AUTO_656 ) ) ( CALIBRATION_TARGET ?AUTO_657 ?AUTO_656 ) ( NOT_CALIBRATED ?AUTO_657 ) ( POINTING ?AUTO_658 ?AUTO_659 ) ( not ( = ?AUTO_656 ?AUTO_659 ) ) ( not ( = ?AUTO_654 ?AUTO_659 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_658 ?AUTO_656 ?AUTO_659 )
      ( GET_IMAGE ?AUTO_654 ?AUTO_655 )
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
      ?AUTO_662 - INSTRUMENT
      ?AUTO_664 - SATELLITE
      ?AUTO_663 - DIRECTION
      ?AUTO_665 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_662 ?AUTO_664 ) ( SUPPORTS ?AUTO_662 ?AUTO_661 ) ( not ( = ?AUTO_660 ?AUTO_663 ) ) ( CALIBRATION_TARGET ?AUTO_662 ?AUTO_663 ) ( POINTING ?AUTO_664 ?AUTO_665 ) ( not ( = ?AUTO_663 ?AUTO_665 ) ) ( not ( = ?AUTO_660 ?AUTO_665 ) ) ( POWER_AVAIL ?AUTO_664 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_662 ?AUTO_664 )
      ( GET_IMAGE ?AUTO_660 ?AUTO_661 )
      ( GET_IMAGE-VERIFY ?AUTO_660 ?AUTO_661 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_666 - DIRECTION
      ?AUTO_667 - MODE
    )
    :vars
    (
      ?AUTO_669 - INSTRUMENT
      ?AUTO_670 - SATELLITE
      ?AUTO_668 - DIRECTION
      ?AUTO_671 - DIRECTION
      ?AUTO_672 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_669 ?AUTO_670 ) ( SUPPORTS ?AUTO_669 ?AUTO_667 ) ( not ( = ?AUTO_666 ?AUTO_668 ) ) ( CALIBRATION_TARGET ?AUTO_669 ?AUTO_668 ) ( POINTING ?AUTO_670 ?AUTO_671 ) ( not ( = ?AUTO_668 ?AUTO_671 ) ) ( not ( = ?AUTO_666 ?AUTO_671 ) ) ( ON_BOARD ?AUTO_672 ?AUTO_670 ) ( POWER_ON ?AUTO_672 ) ( not ( = ?AUTO_669 ?AUTO_672 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_672 ?AUTO_670 )
      ( GET_IMAGE ?AUTO_666 ?AUTO_667 )
      ( GET_IMAGE-VERIFY ?AUTO_666 ?AUTO_667 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_675 - DIRECTION
      ?AUTO_676 - MODE
    )
    :vars
    (
      ?AUTO_681 - INSTRUMENT
      ?AUTO_677 - SATELLITE
      ?AUTO_680 - DIRECTION
      ?AUTO_678 - DIRECTION
      ?AUTO_679 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_681 ?AUTO_677 ) ( SUPPORTS ?AUTO_681 ?AUTO_676 ) ( not ( = ?AUTO_675 ?AUTO_680 ) ) ( CALIBRATION_TARGET ?AUTO_681 ?AUTO_680 ) ( not ( = ?AUTO_680 ?AUTO_678 ) ) ( not ( = ?AUTO_675 ?AUTO_678 ) ) ( ON_BOARD ?AUTO_679 ?AUTO_677 ) ( POWER_ON ?AUTO_679 ) ( not ( = ?AUTO_681 ?AUTO_679 ) ) ( POINTING ?AUTO_677 ?AUTO_680 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_677 ?AUTO_678 ?AUTO_680 )
      ( GET_IMAGE ?AUTO_675 ?AUTO_676 )
      ( GET_IMAGE-VERIFY ?AUTO_675 ?AUTO_676 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_696 - DIRECTION
      ?AUTO_697 - MODE
    )
    :vars
    (
      ?AUTO_698 - INSTRUMENT
      ?AUTO_699 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_698 ) ( ON_BOARD ?AUTO_698 ?AUTO_699 ) ( SUPPORTS ?AUTO_698 ?AUTO_697 ) ( POWER_ON ?AUTO_698 ) ( POINTING ?AUTO_699 ?AUTO_696 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_699 ?AUTO_696 ?AUTO_698 ?AUTO_697 )
      ( GET_IMAGE-VERIFY ?AUTO_696 ?AUTO_697 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_700 - DIRECTION
      ?AUTO_701 - MODE
    )
    :vars
    (
      ?AUTO_702 - INSTRUMENT
      ?AUTO_703 - SATELLITE
      ?AUTO_704 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_702 ) ( ON_BOARD ?AUTO_702 ?AUTO_703 ) ( SUPPORTS ?AUTO_702 ?AUTO_701 ) ( POWER_ON ?AUTO_702 ) ( POINTING ?AUTO_703 ?AUTO_704 ) ( not ( = ?AUTO_700 ?AUTO_704 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_703 ?AUTO_700 ?AUTO_704 )
      ( GET_IMAGE ?AUTO_700 ?AUTO_701 )
      ( GET_IMAGE-VERIFY ?AUTO_700 ?AUTO_701 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_713 - DIRECTION
      ?AUTO_714 - MODE
    )
    :vars
    (
      ?AUTO_715 - INSTRUMENT
      ?AUTO_717 - SATELLITE
      ?AUTO_716 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_715 ?AUTO_717 ) ( SUPPORTS ?AUTO_715 ?AUTO_714 ) ( POWER_ON ?AUTO_715 ) ( not ( = ?AUTO_713 ?AUTO_716 ) ) ( CALIBRATION_TARGET ?AUTO_715 ?AUTO_716 ) ( NOT_CALIBRATED ?AUTO_715 ) ( POINTING ?AUTO_717 ?AUTO_713 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_717 ?AUTO_716 ?AUTO_713 )
      ( GET_IMAGE ?AUTO_713 ?AUTO_714 )
      ( GET_IMAGE-VERIFY ?AUTO_713 ?AUTO_714 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_718 - DIRECTION
      ?AUTO_719 - MODE
    )
    :vars
    (
      ?AUTO_720 - INSTRUMENT
      ?AUTO_721 - SATELLITE
      ?AUTO_722 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_720 ?AUTO_721 ) ( SUPPORTS ?AUTO_720 ?AUTO_719 ) ( not ( = ?AUTO_718 ?AUTO_722 ) ) ( CALIBRATION_TARGET ?AUTO_720 ?AUTO_722 ) ( POINTING ?AUTO_721 ?AUTO_718 ) ( POWER_AVAIL ?AUTO_721 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_720 ?AUTO_721 )
      ( GET_IMAGE ?AUTO_718 ?AUTO_719 )
      ( GET_IMAGE-VERIFY ?AUTO_718 ?AUTO_719 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_723 - DIRECTION
      ?AUTO_724 - MODE
    )
    :vars
    (
      ?AUTO_726 - INSTRUMENT
      ?AUTO_725 - SATELLITE
      ?AUTO_727 - DIRECTION
      ?AUTO_728 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_726 ?AUTO_725 ) ( SUPPORTS ?AUTO_726 ?AUTO_724 ) ( not ( = ?AUTO_723 ?AUTO_727 ) ) ( CALIBRATION_TARGET ?AUTO_726 ?AUTO_727 ) ( POINTING ?AUTO_725 ?AUTO_723 ) ( ON_BOARD ?AUTO_728 ?AUTO_725 ) ( POWER_ON ?AUTO_728 ) ( not ( = ?AUTO_726 ?AUTO_728 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_728 ?AUTO_725 )
      ( GET_IMAGE ?AUTO_723 ?AUTO_724 )
      ( GET_IMAGE-VERIFY ?AUTO_723 ?AUTO_724 ) )
  )

)

