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
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_8 ?AUTO_9 ) ( SUPPORTS ?AUTO_8 ?AUTO_7 ) ( POWER_ON ?AUTO_8 ) ( POINTING ?AUTO_9 ?AUTO_6 ) ( CALIBRATION_TARGET ?AUTO_8 ?AUTO_6 ) ( NOT_CALIBRATED ?AUTO_8 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9 ?AUTO_8 ?AUTO_6 )
      ( GET_IMAGE ?AUTO_6 ?AUTO_7 )
      ( GET_IMAGE-VERIFY ?AUTO_6 ?AUTO_7 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_10 - DIRECTION
      ?AUTO_11 - MODE
    )
    :vars
    (
      ?AUTO_13 - INSTRUMENT
      ?AUTO_12 - SATELLITE
      ?AUTO_14 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_13 ?AUTO_12 ) ( SUPPORTS ?AUTO_13 ?AUTO_11 ) ( POWER_ON ?AUTO_13 ) ( CALIBRATION_TARGET ?AUTO_13 ?AUTO_10 ) ( NOT_CALIBRATED ?AUTO_13 ) ( POINTING ?AUTO_12 ?AUTO_14 ) ( not ( = ?AUTO_10 ?AUTO_14 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_12 ?AUTO_10 ?AUTO_14 )
      ( GET_IMAGE ?AUTO_10 ?AUTO_11 )
      ( GET_IMAGE-VERIFY ?AUTO_10 ?AUTO_11 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_15 - DIRECTION
      ?AUTO_16 - MODE
    )
    :vars
    (
      ?AUTO_18 - INSTRUMENT
      ?AUTO_17 - SATELLITE
      ?AUTO_19 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_18 ?AUTO_17 ) ( SUPPORTS ?AUTO_18 ?AUTO_16 ) ( CALIBRATION_TARGET ?AUTO_18 ?AUTO_15 ) ( POINTING ?AUTO_17 ?AUTO_19 ) ( not ( = ?AUTO_15 ?AUTO_19 ) ) ( POWER_AVAIL ?AUTO_17 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_18 ?AUTO_17 )
      ( GET_IMAGE ?AUTO_15 ?AUTO_16 )
      ( GET_IMAGE-VERIFY ?AUTO_15 ?AUTO_16 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_22 - DIRECTION
      ?AUTO_23 - MODE
    )
    :vars
    (
      ?AUTO_24 - INSTRUMENT
      ?AUTO_25 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_24 ) ( ON_BOARD ?AUTO_24 ?AUTO_25 ) ( SUPPORTS ?AUTO_24 ?AUTO_23 ) ( POWER_ON ?AUTO_24 ) ( POINTING ?AUTO_25 ?AUTO_22 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_25 ?AUTO_22 ?AUTO_24 ?AUTO_23 )
      ( GET_IMAGE-VERIFY ?AUTO_22 ?AUTO_23 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_26 - DIRECTION
      ?AUTO_27 - MODE
    )
    :vars
    (
      ?AUTO_28 - INSTRUMENT
      ?AUTO_29 - SATELLITE
      ?AUTO_30 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_28 ) ( ON_BOARD ?AUTO_28 ?AUTO_29 ) ( SUPPORTS ?AUTO_28 ?AUTO_27 ) ( POWER_ON ?AUTO_28 ) ( POINTING ?AUTO_29 ?AUTO_30 ) ( not ( = ?AUTO_26 ?AUTO_30 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_29 ?AUTO_26 ?AUTO_30 )
      ( GET_IMAGE ?AUTO_26 ?AUTO_27 )
      ( GET_IMAGE-VERIFY ?AUTO_26 ?AUTO_27 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_33 - DIRECTION
      ?AUTO_34 - MODE
    )
    :vars
    (
      ?AUTO_35 - INSTRUMENT
      ?AUTO_37 - SATELLITE
      ?AUTO_36 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_35 ?AUTO_37 ) ( SUPPORTS ?AUTO_35 ?AUTO_34 ) ( POWER_ON ?AUTO_35 ) ( POINTING ?AUTO_37 ?AUTO_36 ) ( not ( = ?AUTO_33 ?AUTO_36 ) ) ( CALIBRATION_TARGET ?AUTO_35 ?AUTO_36 ) ( NOT_CALIBRATED ?AUTO_35 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_37 ?AUTO_35 ?AUTO_36 )
      ( GET_IMAGE ?AUTO_33 ?AUTO_34 )
      ( GET_IMAGE-VERIFY ?AUTO_33 ?AUTO_34 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_38 - DIRECTION
      ?AUTO_39 - MODE
    )
    :vars
    (
      ?AUTO_40 - INSTRUMENT
      ?AUTO_42 - SATELLITE
      ?AUTO_41 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_40 ?AUTO_42 ) ( SUPPORTS ?AUTO_40 ?AUTO_39 ) ( POWER_ON ?AUTO_40 ) ( not ( = ?AUTO_38 ?AUTO_41 ) ) ( CALIBRATION_TARGET ?AUTO_40 ?AUTO_41 ) ( NOT_CALIBRATED ?AUTO_40 ) ( POINTING ?AUTO_42 ?AUTO_38 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_42 ?AUTO_41 ?AUTO_38 )
      ( GET_IMAGE ?AUTO_38 ?AUTO_39 )
      ( GET_IMAGE-VERIFY ?AUTO_38 ?AUTO_39 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_43 - DIRECTION
      ?AUTO_44 - MODE
    )
    :vars
    (
      ?AUTO_47 - INSTRUMENT
      ?AUTO_46 - SATELLITE
      ?AUTO_45 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_47 ?AUTO_46 ) ( SUPPORTS ?AUTO_47 ?AUTO_44 ) ( not ( = ?AUTO_43 ?AUTO_45 ) ) ( CALIBRATION_TARGET ?AUTO_47 ?AUTO_45 ) ( POINTING ?AUTO_46 ?AUTO_43 ) ( POWER_AVAIL ?AUTO_46 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_47 ?AUTO_46 )
      ( GET_IMAGE ?AUTO_43 ?AUTO_44 )
      ( GET_IMAGE-VERIFY ?AUTO_43 ?AUTO_44 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_50 - DIRECTION
      ?AUTO_51 - MODE
    )
    :vars
    (
      ?AUTO_52 - INSTRUMENT
      ?AUTO_53 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_52 ) ( ON_BOARD ?AUTO_52 ?AUTO_53 ) ( SUPPORTS ?AUTO_52 ?AUTO_51 ) ( POWER_ON ?AUTO_52 ) ( POINTING ?AUTO_53 ?AUTO_50 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_53 ?AUTO_50 ?AUTO_52 ?AUTO_51 )
      ( GET_IMAGE-VERIFY ?AUTO_50 ?AUTO_51 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_54 - DIRECTION
      ?AUTO_55 - MODE
    )
    :vars
    (
      ?AUTO_56 - INSTRUMENT
      ?AUTO_57 - SATELLITE
      ?AUTO_58 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_56 ) ( ON_BOARD ?AUTO_56 ?AUTO_57 ) ( SUPPORTS ?AUTO_56 ?AUTO_55 ) ( POWER_ON ?AUTO_56 ) ( POINTING ?AUTO_57 ?AUTO_58 ) ( not ( = ?AUTO_54 ?AUTO_58 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_57 ?AUTO_54 ?AUTO_58 )
      ( GET_IMAGE ?AUTO_54 ?AUTO_55 )
      ( GET_IMAGE-VERIFY ?AUTO_54 ?AUTO_55 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_59 - DIRECTION
      ?AUTO_60 - MODE
    )
    :vars
    (
      ?AUTO_62 - INSTRUMENT
      ?AUTO_61 - SATELLITE
      ?AUTO_63 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_62 ?AUTO_61 ) ( SUPPORTS ?AUTO_62 ?AUTO_60 ) ( POWER_ON ?AUTO_62 ) ( POINTING ?AUTO_61 ?AUTO_63 ) ( not ( = ?AUTO_59 ?AUTO_63 ) ) ( CALIBRATION_TARGET ?AUTO_62 ?AUTO_63 ) ( NOT_CALIBRATED ?AUTO_62 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_61 ?AUTO_62 ?AUTO_63 )
      ( GET_IMAGE ?AUTO_59 ?AUTO_60 )
      ( GET_IMAGE-VERIFY ?AUTO_59 ?AUTO_60 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_64 - DIRECTION
      ?AUTO_65 - MODE
    )
    :vars
    (
      ?AUTO_66 - INSTRUMENT
      ?AUTO_68 - SATELLITE
      ?AUTO_67 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_66 ?AUTO_68 ) ( SUPPORTS ?AUTO_66 ?AUTO_65 ) ( POINTING ?AUTO_68 ?AUTO_67 ) ( not ( = ?AUTO_64 ?AUTO_67 ) ) ( CALIBRATION_TARGET ?AUTO_66 ?AUTO_67 ) ( POWER_AVAIL ?AUTO_68 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_66 ?AUTO_68 )
      ( GET_IMAGE ?AUTO_64 ?AUTO_65 )
      ( GET_IMAGE-VERIFY ?AUTO_64 ?AUTO_65 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_73 - DIRECTION
      ?AUTO_74 - MODE
    )
    :vars
    (
      ?AUTO_75 - INSTRUMENT
      ?AUTO_76 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_75 ) ( ON_BOARD ?AUTO_75 ?AUTO_76 ) ( SUPPORTS ?AUTO_75 ?AUTO_74 ) ( POWER_ON ?AUTO_75 ) ( POINTING ?AUTO_76 ?AUTO_73 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_76 ?AUTO_73 ?AUTO_75 ?AUTO_74 )
      ( GET_IMAGE-VERIFY ?AUTO_73 ?AUTO_74 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_77 - DIRECTION
      ?AUTO_78 - MODE
    )
    :vars
    (
      ?AUTO_79 - INSTRUMENT
      ?AUTO_80 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_79 ?AUTO_80 ) ( SUPPORTS ?AUTO_79 ?AUTO_78 ) ( POWER_ON ?AUTO_79 ) ( POINTING ?AUTO_80 ?AUTO_77 ) ( CALIBRATION_TARGET ?AUTO_79 ?AUTO_77 ) ( NOT_CALIBRATED ?AUTO_79 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_80 ?AUTO_79 ?AUTO_77 )
      ( GET_IMAGE ?AUTO_77 ?AUTO_78 )
      ( GET_IMAGE-VERIFY ?AUTO_77 ?AUTO_78 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_81 - DIRECTION
      ?AUTO_82 - MODE
    )
    :vars
    (
      ?AUTO_84 - INSTRUMENT
      ?AUTO_83 - SATELLITE
      ?AUTO_85 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_84 ?AUTO_83 ) ( SUPPORTS ?AUTO_84 ?AUTO_82 ) ( POWER_ON ?AUTO_84 ) ( CALIBRATION_TARGET ?AUTO_84 ?AUTO_81 ) ( NOT_CALIBRATED ?AUTO_84 ) ( POINTING ?AUTO_83 ?AUTO_85 ) ( not ( = ?AUTO_81 ?AUTO_85 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_83 ?AUTO_81 ?AUTO_85 )
      ( GET_IMAGE ?AUTO_81 ?AUTO_82 )
      ( GET_IMAGE-VERIFY ?AUTO_81 ?AUTO_82 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_86 - DIRECTION
      ?AUTO_87 - MODE
    )
    :vars
    (
      ?AUTO_90 - INSTRUMENT
      ?AUTO_88 - SATELLITE
      ?AUTO_89 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_90 ?AUTO_88 ) ( SUPPORTS ?AUTO_90 ?AUTO_87 ) ( CALIBRATION_TARGET ?AUTO_90 ?AUTO_86 ) ( POINTING ?AUTO_88 ?AUTO_89 ) ( not ( = ?AUTO_86 ?AUTO_89 ) ) ( POWER_AVAIL ?AUTO_88 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_90 ?AUTO_88 )
      ( GET_IMAGE ?AUTO_86 ?AUTO_87 )
      ( GET_IMAGE-VERIFY ?AUTO_86 ?AUTO_87 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_105 - DIRECTION
      ?AUTO_106 - MODE
    )
    :vars
    (
      ?AUTO_107 - INSTRUMENT
      ?AUTO_108 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_107 ) ( ON_BOARD ?AUTO_107 ?AUTO_108 ) ( SUPPORTS ?AUTO_107 ?AUTO_106 ) ( POWER_ON ?AUTO_107 ) ( POINTING ?AUTO_108 ?AUTO_105 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_108 ?AUTO_105 ?AUTO_107 ?AUTO_106 )
      ( GET_IMAGE-VERIFY ?AUTO_105 ?AUTO_106 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_109 - DIRECTION
      ?AUTO_110 - MODE
    )
    :vars
    (
      ?AUTO_111 - INSTRUMENT
      ?AUTO_112 - SATELLITE
      ?AUTO_113 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_111 ) ( ON_BOARD ?AUTO_111 ?AUTO_112 ) ( SUPPORTS ?AUTO_111 ?AUTO_110 ) ( POWER_ON ?AUTO_111 ) ( POINTING ?AUTO_112 ?AUTO_113 ) ( not ( = ?AUTO_109 ?AUTO_113 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_112 ?AUTO_109 ?AUTO_113 )
      ( GET_IMAGE ?AUTO_109 ?AUTO_110 )
      ( GET_IMAGE-VERIFY ?AUTO_109 ?AUTO_110 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_116 - DIRECTION
      ?AUTO_117 - MODE
    )
    :vars
    (
      ?AUTO_119 - INSTRUMENT
      ?AUTO_120 - SATELLITE
      ?AUTO_118 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_119 ?AUTO_120 ) ( SUPPORTS ?AUTO_119 ?AUTO_117 ) ( POWER_ON ?AUTO_119 ) ( POINTING ?AUTO_120 ?AUTO_118 ) ( not ( = ?AUTO_116 ?AUTO_118 ) ) ( CALIBRATION_TARGET ?AUTO_119 ?AUTO_118 ) ( NOT_CALIBRATED ?AUTO_119 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_120 ?AUTO_119 ?AUTO_118 )
      ( GET_IMAGE ?AUTO_116 ?AUTO_117 )
      ( GET_IMAGE-VERIFY ?AUTO_116 ?AUTO_117 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_121 - DIRECTION
      ?AUTO_122 - MODE
    )
    :vars
    (
      ?AUTO_124 - INSTRUMENT
      ?AUTO_125 - SATELLITE
      ?AUTO_123 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_124 ?AUTO_125 ) ( SUPPORTS ?AUTO_124 ?AUTO_122 ) ( POWER_ON ?AUTO_124 ) ( not ( = ?AUTO_121 ?AUTO_123 ) ) ( CALIBRATION_TARGET ?AUTO_124 ?AUTO_123 ) ( NOT_CALIBRATED ?AUTO_124 ) ( POINTING ?AUTO_125 ?AUTO_121 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_125 ?AUTO_123 ?AUTO_121 )
      ( GET_IMAGE ?AUTO_121 ?AUTO_122 )
      ( GET_IMAGE-VERIFY ?AUTO_121 ?AUTO_122 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_126 - DIRECTION
      ?AUTO_127 - MODE
    )
    :vars
    (
      ?AUTO_130 - INSTRUMENT
      ?AUTO_129 - SATELLITE
      ?AUTO_128 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_130 ?AUTO_129 ) ( SUPPORTS ?AUTO_130 ?AUTO_127 ) ( not ( = ?AUTO_126 ?AUTO_128 ) ) ( CALIBRATION_TARGET ?AUTO_130 ?AUTO_128 ) ( POINTING ?AUTO_129 ?AUTO_126 ) ( POWER_AVAIL ?AUTO_129 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_130 ?AUTO_129 )
      ( GET_IMAGE ?AUTO_126 ?AUTO_127 )
      ( GET_IMAGE-VERIFY ?AUTO_126 ?AUTO_127 ) )
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
      ?AUTO_134 - SATELLITE
      ?AUTO_133 - DIRECTION
      ?AUTO_136 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_135 ?AUTO_134 ) ( SUPPORTS ?AUTO_135 ?AUTO_132 ) ( not ( = ?AUTO_131 ?AUTO_133 ) ) ( CALIBRATION_TARGET ?AUTO_135 ?AUTO_133 ) ( POWER_AVAIL ?AUTO_134 ) ( POINTING ?AUTO_134 ?AUTO_136 ) ( not ( = ?AUTO_131 ?AUTO_136 ) ) ( not ( = ?AUTO_133 ?AUTO_136 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_134 ?AUTO_131 ?AUTO_136 )
      ( GET_IMAGE ?AUTO_131 ?AUTO_132 )
      ( GET_IMAGE-VERIFY ?AUTO_131 ?AUTO_132 ) )
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
      ?AUTO_142 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_141 ) ( ON_BOARD ?AUTO_141 ?AUTO_142 ) ( SUPPORTS ?AUTO_141 ?AUTO_140 ) ( POWER_ON ?AUTO_141 ) ( POINTING ?AUTO_142 ?AUTO_139 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_142 ?AUTO_139 ?AUTO_141 ?AUTO_140 )
      ( GET_IMAGE-VERIFY ?AUTO_139 ?AUTO_140 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_143 - DIRECTION
      ?AUTO_144 - MODE
    )
    :vars
    (
      ?AUTO_145 - INSTRUMENT
      ?AUTO_146 - SATELLITE
      ?AUTO_147 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_145 ) ( ON_BOARD ?AUTO_145 ?AUTO_146 ) ( SUPPORTS ?AUTO_145 ?AUTO_144 ) ( POWER_ON ?AUTO_145 ) ( POINTING ?AUTO_146 ?AUTO_147 ) ( not ( = ?AUTO_143 ?AUTO_147 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_146 ?AUTO_143 ?AUTO_147 )
      ( GET_IMAGE ?AUTO_143 ?AUTO_144 )
      ( GET_IMAGE-VERIFY ?AUTO_143 ?AUTO_144 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_148 - DIRECTION
      ?AUTO_149 - MODE
    )
    :vars
    (
      ?AUTO_151 - INSTRUMENT
      ?AUTO_150 - SATELLITE
      ?AUTO_152 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_151 ?AUTO_150 ) ( SUPPORTS ?AUTO_151 ?AUTO_149 ) ( POWER_ON ?AUTO_151 ) ( POINTING ?AUTO_150 ?AUTO_152 ) ( not ( = ?AUTO_148 ?AUTO_152 ) ) ( CALIBRATION_TARGET ?AUTO_151 ?AUTO_152 ) ( NOT_CALIBRATED ?AUTO_151 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_150 ?AUTO_151 ?AUTO_152 )
      ( GET_IMAGE ?AUTO_148 ?AUTO_149 )
      ( GET_IMAGE-VERIFY ?AUTO_148 ?AUTO_149 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_153 - DIRECTION
      ?AUTO_154 - MODE
    )
    :vars
    (
      ?AUTO_155 - INSTRUMENT
      ?AUTO_156 - SATELLITE
      ?AUTO_157 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_155 ?AUTO_156 ) ( SUPPORTS ?AUTO_155 ?AUTO_154 ) ( POINTING ?AUTO_156 ?AUTO_157 ) ( not ( = ?AUTO_153 ?AUTO_157 ) ) ( CALIBRATION_TARGET ?AUTO_155 ?AUTO_157 ) ( POWER_AVAIL ?AUTO_156 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_155 ?AUTO_156 )
      ( GET_IMAGE ?AUTO_153 ?AUTO_154 )
      ( GET_IMAGE-VERIFY ?AUTO_153 ?AUTO_154 ) )
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
      ?AUTO_163 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_162 ) ( ON_BOARD ?AUTO_162 ?AUTO_163 ) ( SUPPORTS ?AUTO_162 ?AUTO_161 ) ( POWER_ON ?AUTO_162 ) ( POINTING ?AUTO_163 ?AUTO_160 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_163 ?AUTO_160 ?AUTO_162 ?AUTO_161 )
      ( GET_IMAGE-VERIFY ?AUTO_160 ?AUTO_161 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_164 - DIRECTION
      ?AUTO_165 - MODE
    )
    :vars
    (
      ?AUTO_166 - INSTRUMENT
      ?AUTO_167 - SATELLITE
      ?AUTO_168 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_166 ) ( ON_BOARD ?AUTO_166 ?AUTO_167 ) ( SUPPORTS ?AUTO_166 ?AUTO_165 ) ( POWER_ON ?AUTO_166 ) ( POINTING ?AUTO_167 ?AUTO_168 ) ( not ( = ?AUTO_164 ?AUTO_168 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_167 ?AUTO_164 ?AUTO_168 )
      ( GET_IMAGE ?AUTO_164 ?AUTO_165 )
      ( GET_IMAGE-VERIFY ?AUTO_164 ?AUTO_165 ) )
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
      ?AUTO_192 - INSTRUMENT
      ?AUTO_194 - SATELLITE
      ?AUTO_193 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_192 ?AUTO_194 ) ( SUPPORTS ?AUTO_192 ?AUTO_191 ) ( POWER_ON ?AUTO_192 ) ( POINTING ?AUTO_194 ?AUTO_193 ) ( not ( = ?AUTO_190 ?AUTO_193 ) ) ( CALIBRATION_TARGET ?AUTO_192 ?AUTO_193 ) ( NOT_CALIBRATED ?AUTO_192 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_194 ?AUTO_192 ?AUTO_193 )
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
      ?AUTO_198 - INSTRUMENT
      ?AUTO_199 - SATELLITE
      ?AUTO_197 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_198 ?AUTO_199 ) ( SUPPORTS ?AUTO_198 ?AUTO_196 ) ( POWER_ON ?AUTO_198 ) ( not ( = ?AUTO_195 ?AUTO_197 ) ) ( CALIBRATION_TARGET ?AUTO_198 ?AUTO_197 ) ( NOT_CALIBRATED ?AUTO_198 ) ( POINTING ?AUTO_199 ?AUTO_195 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_199 ?AUTO_197 ?AUTO_195 )
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
      ?AUTO_203 - INSTRUMENT
      ?AUTO_204 - SATELLITE
      ?AUTO_202 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_203 ?AUTO_204 ) ( SUPPORTS ?AUTO_203 ?AUTO_201 ) ( not ( = ?AUTO_200 ?AUTO_202 ) ) ( CALIBRATION_TARGET ?AUTO_203 ?AUTO_202 ) ( POINTING ?AUTO_204 ?AUTO_200 ) ( POWER_AVAIL ?AUTO_204 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_203 ?AUTO_204 )
      ( GET_IMAGE ?AUTO_200 ?AUTO_201 )
      ( GET_IMAGE-VERIFY ?AUTO_200 ?AUTO_201 ) )
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
      ?AUTO_210 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_208 ?AUTO_209 ) ( SUPPORTS ?AUTO_208 ?AUTO_206 ) ( not ( = ?AUTO_205 ?AUTO_207 ) ) ( CALIBRATION_TARGET ?AUTO_208 ?AUTO_207 ) ( POINTING ?AUTO_209 ?AUTO_205 ) ( ON_BOARD ?AUTO_210 ?AUTO_209 ) ( POWER_ON ?AUTO_210 ) ( not ( = ?AUTO_208 ?AUTO_210 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_210 ?AUTO_209 )
      ( GET_IMAGE ?AUTO_205 ?AUTO_206 )
      ( GET_IMAGE-VERIFY ?AUTO_205 ?AUTO_206 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_213 - DIRECTION
      ?AUTO_214 - MODE
    )
    :vars
    (
      ?AUTO_218 - INSTRUMENT
      ?AUTO_216 - SATELLITE
      ?AUTO_215 - DIRECTION
      ?AUTO_217 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_218 ?AUTO_216 ) ( SUPPORTS ?AUTO_218 ?AUTO_214 ) ( not ( = ?AUTO_213 ?AUTO_215 ) ) ( CALIBRATION_TARGET ?AUTO_218 ?AUTO_215 ) ( ON_BOARD ?AUTO_217 ?AUTO_216 ) ( POWER_ON ?AUTO_217 ) ( not ( = ?AUTO_218 ?AUTO_217 ) ) ( POINTING ?AUTO_216 ?AUTO_215 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_216 ?AUTO_213 ?AUTO_215 )
      ( GET_IMAGE ?AUTO_213 ?AUTO_214 )
      ( GET_IMAGE-VERIFY ?AUTO_213 ?AUTO_214 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_219 - DIRECTION
      ?AUTO_220 - MODE
    )
    :vars
    (
      ?AUTO_224 - INSTRUMENT
      ?AUTO_221 - SATELLITE
      ?AUTO_223 - DIRECTION
      ?AUTO_222 - INSTRUMENT
      ?AUTO_225 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_224 ?AUTO_221 ) ( SUPPORTS ?AUTO_224 ?AUTO_220 ) ( not ( = ?AUTO_219 ?AUTO_223 ) ) ( CALIBRATION_TARGET ?AUTO_224 ?AUTO_223 ) ( ON_BOARD ?AUTO_222 ?AUTO_221 ) ( POWER_ON ?AUTO_222 ) ( not ( = ?AUTO_224 ?AUTO_222 ) ) ( POINTING ?AUTO_221 ?AUTO_225 ) ( not ( = ?AUTO_223 ?AUTO_225 ) ) ( not ( = ?AUTO_219 ?AUTO_225 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_221 ?AUTO_223 ?AUTO_225 )
      ( GET_IMAGE ?AUTO_219 ?AUTO_220 )
      ( GET_IMAGE-VERIFY ?AUTO_219 ?AUTO_220 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_232 - DIRECTION
      ?AUTO_233 - MODE
    )
    :vars
    (
      ?AUTO_235 - INSTRUMENT
      ?AUTO_237 - SATELLITE
      ?AUTO_234 - DIRECTION
      ?AUTO_236 - INSTRUMENT
      ?AUTO_238 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_235 ?AUTO_237 ) ( SUPPORTS ?AUTO_235 ?AUTO_233 ) ( not ( = ?AUTO_232 ?AUTO_234 ) ) ( CALIBRATION_TARGET ?AUTO_235 ?AUTO_234 ) ( ON_BOARD ?AUTO_236 ?AUTO_237 ) ( not ( = ?AUTO_235 ?AUTO_236 ) ) ( POINTING ?AUTO_237 ?AUTO_238 ) ( not ( = ?AUTO_234 ?AUTO_238 ) ) ( not ( = ?AUTO_232 ?AUTO_238 ) ) ( POWER_AVAIL ?AUTO_237 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_236 ?AUTO_237 )
      ( GET_IMAGE ?AUTO_232 ?AUTO_233 )
      ( GET_IMAGE-VERIFY ?AUTO_232 ?AUTO_233 ) )
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
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_243 ) ( ON_BOARD ?AUTO_243 ?AUTO_244 ) ( SUPPORTS ?AUTO_243 ?AUTO_242 ) ( POWER_ON ?AUTO_243 ) ( POINTING ?AUTO_244 ?AUTO_241 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_244 ?AUTO_241 ?AUTO_243 ?AUTO_242 )
      ( GET_IMAGE-VERIFY ?AUTO_241 ?AUTO_242 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_245 - DIRECTION
      ?AUTO_246 - MODE
    )
    :vars
    (
      ?AUTO_247 - INSTRUMENT
      ?AUTO_248 - SATELLITE
      ?AUTO_249 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_247 ) ( ON_BOARD ?AUTO_247 ?AUTO_248 ) ( SUPPORTS ?AUTO_247 ?AUTO_246 ) ( POWER_ON ?AUTO_247 ) ( POINTING ?AUTO_248 ?AUTO_249 ) ( not ( = ?AUTO_245 ?AUTO_249 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_248 ?AUTO_245 ?AUTO_249 )
      ( GET_IMAGE ?AUTO_245 ?AUTO_246 )
      ( GET_IMAGE-VERIFY ?AUTO_245 ?AUTO_246 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_250 - DIRECTION
      ?AUTO_251 - MODE
    )
    :vars
    (
      ?AUTO_253 - INSTRUMENT
      ?AUTO_252 - SATELLITE
      ?AUTO_254 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_253 ?AUTO_252 ) ( SUPPORTS ?AUTO_253 ?AUTO_251 ) ( POWER_ON ?AUTO_253 ) ( POINTING ?AUTO_252 ?AUTO_254 ) ( not ( = ?AUTO_250 ?AUTO_254 ) ) ( CALIBRATION_TARGET ?AUTO_253 ?AUTO_254 ) ( NOT_CALIBRATED ?AUTO_253 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_252 ?AUTO_253 ?AUTO_254 )
      ( GET_IMAGE ?AUTO_250 ?AUTO_251 )
      ( GET_IMAGE-VERIFY ?AUTO_250 ?AUTO_251 ) )
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
      ?AUTO_259 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_257 ?AUTO_258 ) ( SUPPORTS ?AUTO_257 ?AUTO_256 ) ( POINTING ?AUTO_258 ?AUTO_259 ) ( not ( = ?AUTO_255 ?AUTO_259 ) ) ( CALIBRATION_TARGET ?AUTO_257 ?AUTO_259 ) ( POWER_AVAIL ?AUTO_258 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_257 ?AUTO_258 )
      ( GET_IMAGE ?AUTO_255 ?AUTO_256 )
      ( GET_IMAGE-VERIFY ?AUTO_255 ?AUTO_256 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_260 - DIRECTION
      ?AUTO_261 - MODE
    )
    :vars
    (
      ?AUTO_262 - INSTRUMENT
      ?AUTO_264 - SATELLITE
      ?AUTO_263 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_262 ?AUTO_264 ) ( SUPPORTS ?AUTO_262 ?AUTO_261 ) ( not ( = ?AUTO_260 ?AUTO_263 ) ) ( CALIBRATION_TARGET ?AUTO_262 ?AUTO_263 ) ( POWER_AVAIL ?AUTO_264 ) ( POINTING ?AUTO_264 ?AUTO_260 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_264 ?AUTO_263 ?AUTO_260 )
      ( GET_IMAGE ?AUTO_260 ?AUTO_261 )
      ( GET_IMAGE-VERIFY ?AUTO_260 ?AUTO_261 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_265 - DIRECTION
      ?AUTO_266 - MODE
    )
    :vars
    (
      ?AUTO_268 - INSTRUMENT
      ?AUTO_269 - SATELLITE
      ?AUTO_267 - DIRECTION
      ?AUTO_270 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_268 ?AUTO_269 ) ( SUPPORTS ?AUTO_268 ?AUTO_266 ) ( not ( = ?AUTO_265 ?AUTO_267 ) ) ( CALIBRATION_TARGET ?AUTO_268 ?AUTO_267 ) ( POWER_AVAIL ?AUTO_269 ) ( POINTING ?AUTO_269 ?AUTO_270 ) ( not ( = ?AUTO_265 ?AUTO_270 ) ) ( not ( = ?AUTO_267 ?AUTO_270 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_269 ?AUTO_265 ?AUTO_270 )
      ( GET_IMAGE ?AUTO_265 ?AUTO_266 )
      ( GET_IMAGE-VERIFY ?AUTO_265 ?AUTO_266 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_273 - DIRECTION
      ?AUTO_274 - MODE
    )
    :vars
    (
      ?AUTO_275 - INSTRUMENT
      ?AUTO_276 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_275 ) ( ON_BOARD ?AUTO_275 ?AUTO_276 ) ( SUPPORTS ?AUTO_275 ?AUTO_274 ) ( POWER_ON ?AUTO_275 ) ( POINTING ?AUTO_276 ?AUTO_273 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_276 ?AUTO_273 ?AUTO_275 ?AUTO_274 )
      ( GET_IMAGE-VERIFY ?AUTO_273 ?AUTO_274 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_277 - DIRECTION
      ?AUTO_278 - MODE
    )
    :vars
    (
      ?AUTO_279 - INSTRUMENT
      ?AUTO_280 - SATELLITE
      ?AUTO_281 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_279 ) ( ON_BOARD ?AUTO_279 ?AUTO_280 ) ( SUPPORTS ?AUTO_279 ?AUTO_278 ) ( POWER_ON ?AUTO_279 ) ( POINTING ?AUTO_280 ?AUTO_281 ) ( not ( = ?AUTO_277 ?AUTO_281 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_280 ?AUTO_277 ?AUTO_281 )
      ( GET_IMAGE ?AUTO_277 ?AUTO_278 )
      ( GET_IMAGE-VERIFY ?AUTO_277 ?AUTO_278 ) )
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
      ?AUTO_295 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_293 ?AUTO_292 ) ( SUPPORTS ?AUTO_293 ?AUTO_291 ) ( not ( = ?AUTO_290 ?AUTO_294 ) ) ( CALIBRATION_TARGET ?AUTO_293 ?AUTO_294 ) ( POWER_AVAIL ?AUTO_292 ) ( POINTING ?AUTO_292 ?AUTO_295 ) ( not ( = ?AUTO_294 ?AUTO_295 ) ) ( not ( = ?AUTO_290 ?AUTO_295 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_292 ?AUTO_294 ?AUTO_295 )
      ( GET_IMAGE ?AUTO_290 ?AUTO_291 )
      ( GET_IMAGE-VERIFY ?AUTO_290 ?AUTO_291 ) )
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
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_302 ) ( ON_BOARD ?AUTO_302 ?AUTO_303 ) ( SUPPORTS ?AUTO_302 ?AUTO_301 ) ( POWER_ON ?AUTO_302 ) ( POINTING ?AUTO_303 ?AUTO_300 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_303 ?AUTO_300 ?AUTO_302 ?AUTO_301 )
      ( GET_IMAGE-VERIFY ?AUTO_300 ?AUTO_301 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_304 - DIRECTION
      ?AUTO_305 - MODE
    )
    :vars
    (
      ?AUTO_306 - INSTRUMENT
      ?AUTO_307 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_306 ?AUTO_307 ) ( SUPPORTS ?AUTO_306 ?AUTO_305 ) ( POWER_ON ?AUTO_306 ) ( POINTING ?AUTO_307 ?AUTO_304 ) ( CALIBRATION_TARGET ?AUTO_306 ?AUTO_304 ) ( NOT_CALIBRATED ?AUTO_306 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_307 ?AUTO_306 ?AUTO_304 )
      ( GET_IMAGE ?AUTO_304 ?AUTO_305 )
      ( GET_IMAGE-VERIFY ?AUTO_304 ?AUTO_305 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_308 - DIRECTION
      ?AUTO_309 - MODE
    )
    :vars
    (
      ?AUTO_311 - INSTRUMENT
      ?AUTO_310 - SATELLITE
      ?AUTO_312 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_311 ?AUTO_310 ) ( SUPPORTS ?AUTO_311 ?AUTO_309 ) ( POWER_ON ?AUTO_311 ) ( CALIBRATION_TARGET ?AUTO_311 ?AUTO_308 ) ( NOT_CALIBRATED ?AUTO_311 ) ( POINTING ?AUTO_310 ?AUTO_312 ) ( not ( = ?AUTO_308 ?AUTO_312 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_310 ?AUTO_308 ?AUTO_312 )
      ( GET_IMAGE ?AUTO_308 ?AUTO_309 )
      ( GET_IMAGE-VERIFY ?AUTO_308 ?AUTO_309 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_313 - DIRECTION
      ?AUTO_314 - MODE
    )
    :vars
    (
      ?AUTO_316 - INSTRUMENT
      ?AUTO_315 - SATELLITE
      ?AUTO_317 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_316 ?AUTO_315 ) ( SUPPORTS ?AUTO_316 ?AUTO_314 ) ( CALIBRATION_TARGET ?AUTO_316 ?AUTO_313 ) ( POINTING ?AUTO_315 ?AUTO_317 ) ( not ( = ?AUTO_313 ?AUTO_317 ) ) ( POWER_AVAIL ?AUTO_315 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_316 ?AUTO_315 )
      ( GET_IMAGE ?AUTO_313 ?AUTO_314 )
      ( GET_IMAGE-VERIFY ?AUTO_313 ?AUTO_314 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_318 - DIRECTION
      ?AUTO_319 - MODE
    )
    :vars
    (
      ?AUTO_322 - INSTRUMENT
      ?AUTO_321 - SATELLITE
      ?AUTO_320 - DIRECTION
      ?AUTO_323 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_322 ?AUTO_321 ) ( SUPPORTS ?AUTO_322 ?AUTO_319 ) ( CALIBRATION_TARGET ?AUTO_322 ?AUTO_318 ) ( POINTING ?AUTO_321 ?AUTO_320 ) ( not ( = ?AUTO_318 ?AUTO_320 ) ) ( ON_BOARD ?AUTO_323 ?AUTO_321 ) ( POWER_ON ?AUTO_323 ) ( not ( = ?AUTO_322 ?AUTO_323 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_323 ?AUTO_321 )
      ( GET_IMAGE ?AUTO_318 ?AUTO_319 )
      ( GET_IMAGE-VERIFY ?AUTO_318 ?AUTO_319 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_330 - DIRECTION
      ?AUTO_331 - MODE
    )
    :vars
    (
      ?AUTO_335 - INSTRUMENT
      ?AUTO_332 - SATELLITE
      ?AUTO_334 - DIRECTION
      ?AUTO_333 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_335 ?AUTO_332 ) ( SUPPORTS ?AUTO_335 ?AUTO_331 ) ( CALIBRATION_TARGET ?AUTO_335 ?AUTO_330 ) ( not ( = ?AUTO_330 ?AUTO_334 ) ) ( ON_BOARD ?AUTO_333 ?AUTO_332 ) ( POWER_ON ?AUTO_333 ) ( not ( = ?AUTO_335 ?AUTO_333 ) ) ( POINTING ?AUTO_332 ?AUTO_330 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_332 ?AUTO_334 ?AUTO_330 )
      ( GET_IMAGE ?AUTO_330 ?AUTO_331 )
      ( GET_IMAGE-VERIFY ?AUTO_330 ?AUTO_331 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_342 - DIRECTION
      ?AUTO_343 - MODE
    )
    :vars
    (
      ?AUTO_345 - INSTRUMENT
      ?AUTO_347 - SATELLITE
      ?AUTO_344 - DIRECTION
      ?AUTO_346 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_345 ?AUTO_347 ) ( SUPPORTS ?AUTO_345 ?AUTO_343 ) ( CALIBRATION_TARGET ?AUTO_345 ?AUTO_342 ) ( not ( = ?AUTO_342 ?AUTO_344 ) ) ( ON_BOARD ?AUTO_346 ?AUTO_347 ) ( not ( = ?AUTO_345 ?AUTO_346 ) ) ( POINTING ?AUTO_347 ?AUTO_342 ) ( POWER_AVAIL ?AUTO_347 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_346 ?AUTO_347 )
      ( GET_IMAGE ?AUTO_342 ?AUTO_343 )
      ( GET_IMAGE-VERIFY ?AUTO_342 ?AUTO_343 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_354 - DIRECTION
      ?AUTO_355 - MODE
    )
    :vars
    (
      ?AUTO_356 - INSTRUMENT
      ?AUTO_357 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_356 ) ( ON_BOARD ?AUTO_356 ?AUTO_357 ) ( SUPPORTS ?AUTO_356 ?AUTO_355 ) ( POWER_ON ?AUTO_356 ) ( POINTING ?AUTO_357 ?AUTO_354 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_357 ?AUTO_354 ?AUTO_356 ?AUTO_355 )
      ( GET_IMAGE-VERIFY ?AUTO_354 ?AUTO_355 ) )
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
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_360 ) ( ON_BOARD ?AUTO_360 ?AUTO_361 ) ( SUPPORTS ?AUTO_360 ?AUTO_359 ) ( POWER_ON ?AUTO_360 ) ( POINTING ?AUTO_361 ?AUTO_362 ) ( not ( = ?AUTO_358 ?AUTO_362 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_361 ?AUTO_358 ?AUTO_362 )
      ( GET_IMAGE ?AUTO_358 ?AUTO_359 )
      ( GET_IMAGE-VERIFY ?AUTO_358 ?AUTO_359 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_365 - DIRECTION
      ?AUTO_366 - MODE
    )
    :vars
    (
      ?AUTO_368 - INSTRUMENT
      ?AUTO_369 - SATELLITE
      ?AUTO_367 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_368 ?AUTO_369 ) ( SUPPORTS ?AUTO_368 ?AUTO_366 ) ( POWER_ON ?AUTO_368 ) ( POINTING ?AUTO_369 ?AUTO_367 ) ( not ( = ?AUTO_365 ?AUTO_367 ) ) ( CALIBRATION_TARGET ?AUTO_368 ?AUTO_367 ) ( NOT_CALIBRATED ?AUTO_368 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_369 ?AUTO_368 ?AUTO_367 )
      ( GET_IMAGE ?AUTO_365 ?AUTO_366 )
      ( GET_IMAGE-VERIFY ?AUTO_365 ?AUTO_366 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_370 - DIRECTION
      ?AUTO_371 - MODE
    )
    :vars
    (
      ?AUTO_373 - INSTRUMENT
      ?AUTO_374 - SATELLITE
      ?AUTO_372 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_373 ?AUTO_374 ) ( SUPPORTS ?AUTO_373 ?AUTO_371 ) ( POWER_ON ?AUTO_373 ) ( not ( = ?AUTO_370 ?AUTO_372 ) ) ( CALIBRATION_TARGET ?AUTO_373 ?AUTO_372 ) ( NOT_CALIBRATED ?AUTO_373 ) ( POINTING ?AUTO_374 ?AUTO_370 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_374 ?AUTO_372 ?AUTO_370 )
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
      ?AUTO_379 - INSTRUMENT
      ?AUTO_378 - SATELLITE
      ?AUTO_377 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_379 ?AUTO_378 ) ( SUPPORTS ?AUTO_379 ?AUTO_376 ) ( not ( = ?AUTO_375 ?AUTO_377 ) ) ( CALIBRATION_TARGET ?AUTO_379 ?AUTO_377 ) ( POINTING ?AUTO_378 ?AUTO_375 ) ( POWER_AVAIL ?AUTO_378 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_379 ?AUTO_378 )
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
      ?AUTO_384 - INSTRUMENT
      ?AUTO_383 - SATELLITE
      ?AUTO_382 - DIRECTION
      ?AUTO_385 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_384 ?AUTO_383 ) ( SUPPORTS ?AUTO_384 ?AUTO_381 ) ( not ( = ?AUTO_380 ?AUTO_382 ) ) ( CALIBRATION_TARGET ?AUTO_384 ?AUTO_382 ) ( POINTING ?AUTO_383 ?AUTO_380 ) ( ON_BOARD ?AUTO_385 ?AUTO_383 ) ( POWER_ON ?AUTO_385 ) ( not ( = ?AUTO_384 ?AUTO_385 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_385 ?AUTO_383 )
      ( GET_IMAGE ?AUTO_380 ?AUTO_381 )
      ( GET_IMAGE-VERIFY ?AUTO_380 ?AUTO_381 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_388 - DIRECTION
      ?AUTO_389 - MODE
    )
    :vars
    (
      ?AUTO_392 - INSTRUMENT
      ?AUTO_393 - SATELLITE
      ?AUTO_390 - DIRECTION
      ?AUTO_391 - INSTRUMENT
      ?AUTO_394 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_392 ?AUTO_393 ) ( SUPPORTS ?AUTO_392 ?AUTO_389 ) ( not ( = ?AUTO_388 ?AUTO_390 ) ) ( CALIBRATION_TARGET ?AUTO_392 ?AUTO_390 ) ( ON_BOARD ?AUTO_391 ?AUTO_393 ) ( POWER_ON ?AUTO_391 ) ( not ( = ?AUTO_392 ?AUTO_391 ) ) ( POINTING ?AUTO_393 ?AUTO_394 ) ( not ( = ?AUTO_388 ?AUTO_394 ) ) ( not ( = ?AUTO_390 ?AUTO_394 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_393 ?AUTO_388 ?AUTO_394 )
      ( GET_IMAGE ?AUTO_388 ?AUTO_389 )
      ( GET_IMAGE-VERIFY ?AUTO_388 ?AUTO_389 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_397 - DIRECTION
      ?AUTO_398 - MODE
    )
    :vars
    (
      ?AUTO_403 - INSTRUMENT
      ?AUTO_399 - SATELLITE
      ?AUTO_402 - DIRECTION
      ?AUTO_401 - INSTRUMENT
      ?AUTO_400 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_403 ?AUTO_399 ) ( SUPPORTS ?AUTO_403 ?AUTO_398 ) ( not ( = ?AUTO_397 ?AUTO_402 ) ) ( CALIBRATION_TARGET ?AUTO_403 ?AUTO_402 ) ( ON_BOARD ?AUTO_401 ?AUTO_399 ) ( POWER_ON ?AUTO_401 ) ( not ( = ?AUTO_403 ?AUTO_401 ) ) ( not ( = ?AUTO_397 ?AUTO_400 ) ) ( not ( = ?AUTO_402 ?AUTO_400 ) ) ( POINTING ?AUTO_399 ?AUTO_402 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_399 ?AUTO_400 ?AUTO_402 )
      ( GET_IMAGE ?AUTO_397 ?AUTO_398 )
      ( GET_IMAGE-VERIFY ?AUTO_397 ?AUTO_398 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_419 - DIRECTION
      ?AUTO_420 - MODE
    )
    :vars
    (
      ?AUTO_421 - INSTRUMENT
      ?AUTO_422 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_421 ) ( ON_BOARD ?AUTO_421 ?AUTO_422 ) ( SUPPORTS ?AUTO_421 ?AUTO_420 ) ( POWER_ON ?AUTO_421 ) ( POINTING ?AUTO_422 ?AUTO_419 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_422 ?AUTO_419 ?AUTO_421 ?AUTO_420 )
      ( GET_IMAGE-VERIFY ?AUTO_419 ?AUTO_420 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_423 - DIRECTION
      ?AUTO_424 - MODE
    )
    :vars
    (
      ?AUTO_425 - INSTRUMENT
      ?AUTO_426 - SATELLITE
      ?AUTO_427 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_425 ) ( ON_BOARD ?AUTO_425 ?AUTO_426 ) ( SUPPORTS ?AUTO_425 ?AUTO_424 ) ( POWER_ON ?AUTO_425 ) ( POINTING ?AUTO_426 ?AUTO_427 ) ( not ( = ?AUTO_423 ?AUTO_427 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_426 ?AUTO_423 ?AUTO_427 )
      ( GET_IMAGE ?AUTO_423 ?AUTO_424 )
      ( GET_IMAGE-VERIFY ?AUTO_423 ?AUTO_424 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_436 - DIRECTION
      ?AUTO_437 - MODE
    )
    :vars
    (
      ?AUTO_438 - INSTRUMENT
      ?AUTO_440 - SATELLITE
      ?AUTO_439 - DIRECTION
      ?AUTO_441 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_438 ?AUTO_440 ) ( SUPPORTS ?AUTO_438 ?AUTO_437 ) ( POWER_ON ?AUTO_438 ) ( not ( = ?AUTO_436 ?AUTO_439 ) ) ( CALIBRATION_TARGET ?AUTO_438 ?AUTO_439 ) ( NOT_CALIBRATED ?AUTO_438 ) ( POINTING ?AUTO_440 ?AUTO_441 ) ( not ( = ?AUTO_439 ?AUTO_441 ) ) ( not ( = ?AUTO_436 ?AUTO_441 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_440 ?AUTO_439 ?AUTO_441 )
      ( GET_IMAGE ?AUTO_436 ?AUTO_437 )
      ( GET_IMAGE-VERIFY ?AUTO_436 ?AUTO_437 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_442 - DIRECTION
      ?AUTO_443 - MODE
    )
    :vars
    (
      ?AUTO_444 - INSTRUMENT
      ?AUTO_446 - SATELLITE
      ?AUTO_445 - DIRECTION
      ?AUTO_447 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_444 ?AUTO_446 ) ( SUPPORTS ?AUTO_444 ?AUTO_443 ) ( not ( = ?AUTO_442 ?AUTO_445 ) ) ( CALIBRATION_TARGET ?AUTO_444 ?AUTO_445 ) ( POINTING ?AUTO_446 ?AUTO_447 ) ( not ( = ?AUTO_445 ?AUTO_447 ) ) ( not ( = ?AUTO_442 ?AUTO_447 ) ) ( POWER_AVAIL ?AUTO_446 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_444 ?AUTO_446 )
      ( GET_IMAGE ?AUTO_442 ?AUTO_443 )
      ( GET_IMAGE-VERIFY ?AUTO_442 ?AUTO_443 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_448 - DIRECTION
      ?AUTO_449 - MODE
    )
    :vars
    (
      ?AUTO_450 - INSTRUMENT
      ?AUTO_452 - SATELLITE
      ?AUTO_451 - DIRECTION
      ?AUTO_453 - DIRECTION
      ?AUTO_454 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_450 ?AUTO_452 ) ( SUPPORTS ?AUTO_450 ?AUTO_449 ) ( not ( = ?AUTO_448 ?AUTO_451 ) ) ( CALIBRATION_TARGET ?AUTO_450 ?AUTO_451 ) ( POINTING ?AUTO_452 ?AUTO_453 ) ( not ( = ?AUTO_451 ?AUTO_453 ) ) ( not ( = ?AUTO_448 ?AUTO_453 ) ) ( ON_BOARD ?AUTO_454 ?AUTO_452 ) ( POWER_ON ?AUTO_454 ) ( not ( = ?AUTO_450 ?AUTO_454 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_454 ?AUTO_452 )
      ( GET_IMAGE ?AUTO_448 ?AUTO_449 )
      ( GET_IMAGE-VERIFY ?AUTO_448 ?AUTO_449 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_461 - DIRECTION
      ?AUTO_462 - MODE
    )
    :vars
    (
      ?AUTO_466 - INSTRUMENT
      ?AUTO_464 - SATELLITE
      ?AUTO_463 - DIRECTION
      ?AUTO_465 - DIRECTION
      ?AUTO_467 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_466 ?AUTO_464 ) ( SUPPORTS ?AUTO_466 ?AUTO_462 ) ( not ( = ?AUTO_461 ?AUTO_463 ) ) ( CALIBRATION_TARGET ?AUTO_466 ?AUTO_463 ) ( not ( = ?AUTO_463 ?AUTO_465 ) ) ( not ( = ?AUTO_461 ?AUTO_465 ) ) ( ON_BOARD ?AUTO_467 ?AUTO_464 ) ( POWER_ON ?AUTO_467 ) ( not ( = ?AUTO_466 ?AUTO_467 ) ) ( POINTING ?AUTO_464 ?AUTO_463 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_464 ?AUTO_465 ?AUTO_463 )
      ( GET_IMAGE ?AUTO_461 ?AUTO_462 )
      ( GET_IMAGE-VERIFY ?AUTO_461 ?AUTO_462 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_470 - DIRECTION
      ?AUTO_471 - MODE
    )
    :vars
    (
      ?AUTO_472 - INSTRUMENT
      ?AUTO_473 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_472 ) ( ON_BOARD ?AUTO_472 ?AUTO_473 ) ( SUPPORTS ?AUTO_472 ?AUTO_471 ) ( POWER_ON ?AUTO_472 ) ( POINTING ?AUTO_473 ?AUTO_470 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_473 ?AUTO_470 ?AUTO_472 ?AUTO_471 )
      ( GET_IMAGE-VERIFY ?AUTO_470 ?AUTO_471 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_474 - DIRECTION
      ?AUTO_475 - MODE
    )
    :vars
    (
      ?AUTO_476 - INSTRUMENT
      ?AUTO_477 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_476 ?AUTO_477 ) ( SUPPORTS ?AUTO_476 ?AUTO_475 ) ( POWER_ON ?AUTO_476 ) ( POINTING ?AUTO_477 ?AUTO_474 ) ( CALIBRATION_TARGET ?AUTO_476 ?AUTO_474 ) ( NOT_CALIBRATED ?AUTO_476 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_477 ?AUTO_476 ?AUTO_474 )
      ( GET_IMAGE ?AUTO_474 ?AUTO_475 )
      ( GET_IMAGE-VERIFY ?AUTO_474 ?AUTO_475 ) )
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
    ( and ( ON_BOARD ?AUTO_480 ?AUTO_481 ) ( SUPPORTS ?AUTO_480 ?AUTO_479 ) ( POINTING ?AUTO_481 ?AUTO_478 ) ( CALIBRATION_TARGET ?AUTO_480 ?AUTO_478 ) ( POWER_AVAIL ?AUTO_481 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_480 ?AUTO_481 )
      ( GET_IMAGE ?AUTO_478 ?AUTO_479 )
      ( GET_IMAGE-VERIFY ?AUTO_478 ?AUTO_479 ) )
  )

)

