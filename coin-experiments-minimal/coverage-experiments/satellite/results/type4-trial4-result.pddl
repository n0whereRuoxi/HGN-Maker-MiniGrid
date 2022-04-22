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
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_13 ?AUTO_12 ) ( SUPPORTS ?AUTO_13 ?AUTO_11 ) ( POINTING ?AUTO_12 ?AUTO_10 ) ( CALIBRATION_TARGET ?AUTO_13 ?AUTO_10 ) ( POWER_AVAIL ?AUTO_12 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_13 ?AUTO_12 )
      ( GET_IMAGE ?AUTO_10 ?AUTO_11 )
      ( GET_IMAGE-VERIFY ?AUTO_10 ?AUTO_11 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_14 - DIRECTION
      ?AUTO_15 - MODE
    )
    :vars
    (
      ?AUTO_17 - INSTRUMENT
      ?AUTO_16 - SATELLITE
      ?AUTO_18 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_17 ?AUTO_16 ) ( SUPPORTS ?AUTO_17 ?AUTO_15 ) ( CALIBRATION_TARGET ?AUTO_17 ?AUTO_14 ) ( POWER_AVAIL ?AUTO_16 ) ( POINTING ?AUTO_16 ?AUTO_18 ) ( not ( = ?AUTO_14 ?AUTO_18 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_16 ?AUTO_14 ?AUTO_18 )
      ( GET_IMAGE ?AUTO_14 ?AUTO_15 )
      ( GET_IMAGE-VERIFY ?AUTO_14 ?AUTO_15 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_21 - DIRECTION
      ?AUTO_22 - MODE
    )
    :vars
    (
      ?AUTO_23 - INSTRUMENT
      ?AUTO_24 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_23 ) ( ON_BOARD ?AUTO_23 ?AUTO_24 ) ( SUPPORTS ?AUTO_23 ?AUTO_22 ) ( POWER_ON ?AUTO_23 ) ( POINTING ?AUTO_24 ?AUTO_21 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_24 ?AUTO_21 ?AUTO_23 ?AUTO_22 )
      ( GET_IMAGE-VERIFY ?AUTO_21 ?AUTO_22 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_25 - DIRECTION
      ?AUTO_26 - MODE
    )
    :vars
    (
      ?AUTO_28 - INSTRUMENT
      ?AUTO_27 - SATELLITE
      ?AUTO_29 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_28 ) ( ON_BOARD ?AUTO_28 ?AUTO_27 ) ( SUPPORTS ?AUTO_28 ?AUTO_26 ) ( POWER_ON ?AUTO_28 ) ( POINTING ?AUTO_27 ?AUTO_29 ) ( not ( = ?AUTO_25 ?AUTO_29 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_27 ?AUTO_25 ?AUTO_29 )
      ( GET_IMAGE ?AUTO_25 ?AUTO_26 )
      ( GET_IMAGE-VERIFY ?AUTO_25 ?AUTO_26 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_30 - DIRECTION
      ?AUTO_31 - MODE
    )
    :vars
    (
      ?AUTO_32 - INSTRUMENT
      ?AUTO_34 - SATELLITE
      ?AUTO_33 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_32 ?AUTO_34 ) ( SUPPORTS ?AUTO_32 ?AUTO_31 ) ( POWER_ON ?AUTO_32 ) ( POINTING ?AUTO_34 ?AUTO_33 ) ( not ( = ?AUTO_30 ?AUTO_33 ) ) ( CALIBRATION_TARGET ?AUTO_32 ?AUTO_33 ) ( NOT_CALIBRATED ?AUTO_32 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_34 ?AUTO_32 ?AUTO_33 )
      ( GET_IMAGE ?AUTO_30 ?AUTO_31 )
      ( GET_IMAGE-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_35 - DIRECTION
      ?AUTO_36 - MODE
    )
    :vars
    (
      ?AUTO_39 - INSTRUMENT
      ?AUTO_38 - SATELLITE
      ?AUTO_37 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_39 ?AUTO_38 ) ( SUPPORTS ?AUTO_39 ?AUTO_36 ) ( POINTING ?AUTO_38 ?AUTO_37 ) ( not ( = ?AUTO_35 ?AUTO_37 ) ) ( CALIBRATION_TARGET ?AUTO_39 ?AUTO_37 ) ( POWER_AVAIL ?AUTO_38 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_39 ?AUTO_38 )
      ( GET_IMAGE ?AUTO_35 ?AUTO_36 )
      ( GET_IMAGE-VERIFY ?AUTO_35 ?AUTO_36 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_43 - DIRECTION
      ?AUTO_42 - MODE
    )
    :vars
    (
      ?AUTO_44 - INSTRUMENT
      ?AUTO_45 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_44 ) ( ON_BOARD ?AUTO_44 ?AUTO_45 ) ( SUPPORTS ?AUTO_44 ?AUTO_42 ) ( POWER_ON ?AUTO_44 ) ( POINTING ?AUTO_45 ?AUTO_43 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_45 ?AUTO_43 ?AUTO_44 ?AUTO_42 )
      ( GET_IMAGE-VERIFY ?AUTO_43 ?AUTO_42 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_47 - DIRECTION
      ?AUTO_46 - MODE
    )
    :vars
    (
      ?AUTO_48 - INSTRUMENT
      ?AUTO_49 - SATELLITE
      ?AUTO_50 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_48 ) ( ON_BOARD ?AUTO_48 ?AUTO_49 ) ( SUPPORTS ?AUTO_48 ?AUTO_46 ) ( POWER_ON ?AUTO_48 ) ( POINTING ?AUTO_49 ?AUTO_50 ) ( not ( = ?AUTO_47 ?AUTO_50 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_49 ?AUTO_47 ?AUTO_50 )
      ( GET_IMAGE ?AUTO_47 ?AUTO_46 )
      ( GET_IMAGE-VERIFY ?AUTO_47 ?AUTO_46 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_52 - DIRECTION
      ?AUTO_51 - MODE
    )
    :vars
    (
      ?AUTO_54 - INSTRUMENT
      ?AUTO_53 - SATELLITE
      ?AUTO_55 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_54 ?AUTO_53 ) ( SUPPORTS ?AUTO_54 ?AUTO_51 ) ( POWER_ON ?AUTO_54 ) ( POINTING ?AUTO_53 ?AUTO_55 ) ( not ( = ?AUTO_52 ?AUTO_55 ) ) ( CALIBRATION_TARGET ?AUTO_54 ?AUTO_55 ) ( NOT_CALIBRATED ?AUTO_54 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_53 ?AUTO_54 ?AUTO_55 )
      ( GET_IMAGE ?AUTO_52 ?AUTO_51 )
      ( GET_IMAGE-VERIFY ?AUTO_52 ?AUTO_51 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_57 - DIRECTION
      ?AUTO_56 - MODE
    )
    :vars
    (
      ?AUTO_58 - INSTRUMENT
      ?AUTO_60 - SATELLITE
      ?AUTO_59 - DIRECTION
      ?AUTO_61 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_58 ?AUTO_60 ) ( SUPPORTS ?AUTO_58 ?AUTO_56 ) ( POWER_ON ?AUTO_58 ) ( not ( = ?AUTO_57 ?AUTO_59 ) ) ( CALIBRATION_TARGET ?AUTO_58 ?AUTO_59 ) ( NOT_CALIBRATED ?AUTO_58 ) ( POINTING ?AUTO_60 ?AUTO_61 ) ( not ( = ?AUTO_59 ?AUTO_61 ) ) ( not ( = ?AUTO_57 ?AUTO_61 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_60 ?AUTO_59 ?AUTO_61 )
      ( GET_IMAGE ?AUTO_57 ?AUTO_56 )
      ( GET_IMAGE-VERIFY ?AUTO_57 ?AUTO_56 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_63 - DIRECTION
      ?AUTO_62 - MODE
    )
    :vars
    (
      ?AUTO_65 - INSTRUMENT
      ?AUTO_67 - SATELLITE
      ?AUTO_66 - DIRECTION
      ?AUTO_64 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_65 ?AUTO_67 ) ( SUPPORTS ?AUTO_65 ?AUTO_62 ) ( not ( = ?AUTO_63 ?AUTO_66 ) ) ( CALIBRATION_TARGET ?AUTO_65 ?AUTO_66 ) ( POINTING ?AUTO_67 ?AUTO_64 ) ( not ( = ?AUTO_66 ?AUTO_64 ) ) ( not ( = ?AUTO_63 ?AUTO_64 ) ) ( POWER_AVAIL ?AUTO_67 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_65 ?AUTO_67 )
      ( GET_IMAGE ?AUTO_63 ?AUTO_62 )
      ( GET_IMAGE-VERIFY ?AUTO_63 ?AUTO_62 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_71 - DIRECTION
      ?AUTO_70 - MODE
    )
    :vars
    (
      ?AUTO_72 - INSTRUMENT
      ?AUTO_73 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_72 ) ( ON_BOARD ?AUTO_72 ?AUTO_73 ) ( SUPPORTS ?AUTO_72 ?AUTO_70 ) ( POWER_ON ?AUTO_72 ) ( POINTING ?AUTO_73 ?AUTO_71 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_73 ?AUTO_71 ?AUTO_72 ?AUTO_70 )
      ( GET_IMAGE-VERIFY ?AUTO_71 ?AUTO_70 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_75 - DIRECTION
      ?AUTO_74 - MODE
    )
    :vars
    (
      ?AUTO_76 - INSTRUMENT
      ?AUTO_77 - SATELLITE
      ?AUTO_78 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_76 ) ( ON_BOARD ?AUTO_76 ?AUTO_77 ) ( SUPPORTS ?AUTO_76 ?AUTO_74 ) ( POWER_ON ?AUTO_76 ) ( POINTING ?AUTO_77 ?AUTO_78 ) ( not ( = ?AUTO_75 ?AUTO_78 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_77 ?AUTO_75 ?AUTO_78 )
      ( GET_IMAGE ?AUTO_75 ?AUTO_74 )
      ( GET_IMAGE-VERIFY ?AUTO_75 ?AUTO_74 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_92 - DIRECTION
      ?AUTO_91 - MODE
    )
    :vars
    (
      ?AUTO_93 - INSTRUMENT
      ?AUTO_94 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_93 ) ( ON_BOARD ?AUTO_93 ?AUTO_94 ) ( SUPPORTS ?AUTO_93 ?AUTO_91 ) ( POWER_ON ?AUTO_93 ) ( POINTING ?AUTO_94 ?AUTO_92 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_94 ?AUTO_92 ?AUTO_93 ?AUTO_91 )
      ( GET_IMAGE-VERIFY ?AUTO_92 ?AUTO_91 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_96 - DIRECTION
      ?AUTO_95 - MODE
    )
    :vars
    (
      ?AUTO_97 - INSTRUMENT
      ?AUTO_98 - SATELLITE
      ?AUTO_99 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_97 ) ( ON_BOARD ?AUTO_97 ?AUTO_98 ) ( SUPPORTS ?AUTO_97 ?AUTO_95 ) ( POWER_ON ?AUTO_97 ) ( POINTING ?AUTO_98 ?AUTO_99 ) ( not ( = ?AUTO_96 ?AUTO_99 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_98 ?AUTO_96 ?AUTO_99 )
      ( GET_IMAGE ?AUTO_96 ?AUTO_95 )
      ( GET_IMAGE-VERIFY ?AUTO_96 ?AUTO_95 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_111 - DIRECTION
      ?AUTO_110 - MODE
    )
    :vars
    (
      ?AUTO_112 - INSTRUMENT
      ?AUTO_113 - SATELLITE
      ?AUTO_114 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_112 ?AUTO_113 ) ( SUPPORTS ?AUTO_112 ?AUTO_110 ) ( POWER_ON ?AUTO_112 ) ( not ( = ?AUTO_111 ?AUTO_114 ) ) ( CALIBRATION_TARGET ?AUTO_112 ?AUTO_114 ) ( NOT_CALIBRATED ?AUTO_112 ) ( POINTING ?AUTO_113 ?AUTO_111 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_113 ?AUTO_114 ?AUTO_111 )
      ( GET_IMAGE ?AUTO_111 ?AUTO_110 )
      ( GET_IMAGE-VERIFY ?AUTO_111 ?AUTO_110 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_116 - DIRECTION
      ?AUTO_115 - MODE
    )
    :vars
    (
      ?AUTO_118 - INSTRUMENT
      ?AUTO_117 - SATELLITE
      ?AUTO_119 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_118 ?AUTO_117 ) ( SUPPORTS ?AUTO_118 ?AUTO_115 ) ( not ( = ?AUTO_116 ?AUTO_119 ) ) ( CALIBRATION_TARGET ?AUTO_118 ?AUTO_119 ) ( POINTING ?AUTO_117 ?AUTO_116 ) ( POWER_AVAIL ?AUTO_117 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_118 ?AUTO_117 )
      ( GET_IMAGE ?AUTO_116 ?AUTO_115 )
      ( GET_IMAGE-VERIFY ?AUTO_116 ?AUTO_115 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_122 - DIRECTION
      ?AUTO_123 - MODE
    )
    :vars
    (
      ?AUTO_124 - INSTRUMENT
      ?AUTO_125 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_124 ) ( ON_BOARD ?AUTO_124 ?AUTO_125 ) ( SUPPORTS ?AUTO_124 ?AUTO_123 ) ( POWER_ON ?AUTO_124 ) ( POINTING ?AUTO_125 ?AUTO_122 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_125 ?AUTO_122 ?AUTO_124 ?AUTO_123 )
      ( GET_IMAGE-VERIFY ?AUTO_122 ?AUTO_123 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_126 - DIRECTION
      ?AUTO_127 - MODE
    )
    :vars
    (
      ?AUTO_128 - INSTRUMENT
      ?AUTO_129 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_128 ?AUTO_129 ) ( SUPPORTS ?AUTO_128 ?AUTO_127 ) ( POWER_ON ?AUTO_128 ) ( POINTING ?AUTO_129 ?AUTO_126 ) ( CALIBRATION_TARGET ?AUTO_128 ?AUTO_126 ) ( NOT_CALIBRATED ?AUTO_128 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_129 ?AUTO_128 ?AUTO_126 )
      ( GET_IMAGE ?AUTO_126 ?AUTO_127 )
      ( GET_IMAGE-VERIFY ?AUTO_126 ?AUTO_127 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_130 - DIRECTION
      ?AUTO_131 - MODE
    )
    :vars
    (
      ?AUTO_133 - INSTRUMENT
      ?AUTO_132 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_133 ?AUTO_132 ) ( SUPPORTS ?AUTO_133 ?AUTO_131 ) ( POINTING ?AUTO_132 ?AUTO_130 ) ( CALIBRATION_TARGET ?AUTO_133 ?AUTO_130 ) ( POWER_AVAIL ?AUTO_132 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_133 ?AUTO_132 )
      ( GET_IMAGE ?AUTO_130 ?AUTO_131 )
      ( GET_IMAGE-VERIFY ?AUTO_130 ?AUTO_131 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_136 - DIRECTION
      ?AUTO_137 - MODE
    )
    :vars
    (
      ?AUTO_138 - INSTRUMENT
      ?AUTO_139 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_138 ) ( ON_BOARD ?AUTO_138 ?AUTO_139 ) ( SUPPORTS ?AUTO_138 ?AUTO_137 ) ( POWER_ON ?AUTO_138 ) ( POINTING ?AUTO_139 ?AUTO_136 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_139 ?AUTO_136 ?AUTO_138 ?AUTO_137 )
      ( GET_IMAGE-VERIFY ?AUTO_136 ?AUTO_137 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_140 - DIRECTION
      ?AUTO_141 - MODE
    )
    :vars
    (
      ?AUTO_142 - INSTRUMENT
      ?AUTO_143 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_142 ?AUTO_143 ) ( SUPPORTS ?AUTO_142 ?AUTO_141 ) ( POWER_ON ?AUTO_142 ) ( POINTING ?AUTO_143 ?AUTO_140 ) ( CALIBRATION_TARGET ?AUTO_142 ?AUTO_140 ) ( NOT_CALIBRATED ?AUTO_142 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_143 ?AUTO_142 ?AUTO_140 )
      ( GET_IMAGE ?AUTO_140 ?AUTO_141 )
      ( GET_IMAGE-VERIFY ?AUTO_140 ?AUTO_141 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_144 - DIRECTION
      ?AUTO_145 - MODE
    )
    :vars
    (
      ?AUTO_147 - INSTRUMENT
      ?AUTO_146 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_147 ?AUTO_146 ) ( SUPPORTS ?AUTO_147 ?AUTO_145 ) ( POINTING ?AUTO_146 ?AUTO_144 ) ( CALIBRATION_TARGET ?AUTO_147 ?AUTO_144 ) ( POWER_AVAIL ?AUTO_146 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_147 ?AUTO_146 )
      ( GET_IMAGE ?AUTO_144 ?AUTO_145 )
      ( GET_IMAGE-VERIFY ?AUTO_144 ?AUTO_145 ) )
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
      ?AUTO_152 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_151 ?AUTO_150 ) ( SUPPORTS ?AUTO_151 ?AUTO_149 ) ( POINTING ?AUTO_150 ?AUTO_148 ) ( CALIBRATION_TARGET ?AUTO_151 ?AUTO_148 ) ( ON_BOARD ?AUTO_152 ?AUTO_150 ) ( POWER_ON ?AUTO_152 ) ( not ( = ?AUTO_151 ?AUTO_152 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_152 ?AUTO_150 )
      ( GET_IMAGE ?AUTO_148 ?AUTO_149 )
      ( GET_IMAGE-VERIFY ?AUTO_148 ?AUTO_149 ) )
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
      ?AUTO_159 - DIRECTION
      ?AUTO_160 - MODE
    )
    :vars
    (
      ?AUTO_161 - INSTRUMENT
      ?AUTO_162 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_161 ?AUTO_162 ) ( SUPPORTS ?AUTO_161 ?AUTO_160 ) ( POWER_ON ?AUTO_161 ) ( POINTING ?AUTO_162 ?AUTO_159 ) ( CALIBRATION_TARGET ?AUTO_161 ?AUTO_159 ) ( NOT_CALIBRATED ?AUTO_161 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_162 ?AUTO_161 ?AUTO_159 )
      ( GET_IMAGE ?AUTO_159 ?AUTO_160 )
      ( GET_IMAGE-VERIFY ?AUTO_159 ?AUTO_160 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_163 - DIRECTION
      ?AUTO_164 - MODE
    )
    :vars
    (
      ?AUTO_166 - INSTRUMENT
      ?AUTO_165 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_166 ?AUTO_165 ) ( SUPPORTS ?AUTO_166 ?AUTO_164 ) ( POINTING ?AUTO_165 ?AUTO_163 ) ( CALIBRATION_TARGET ?AUTO_166 ?AUTO_163 ) ( POWER_AVAIL ?AUTO_165 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_166 ?AUTO_165 )
      ( GET_IMAGE ?AUTO_163 ?AUTO_164 )
      ( GET_IMAGE-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_167 - DIRECTION
      ?AUTO_168 - MODE
    )
    :vars
    (
      ?AUTO_170 - INSTRUMENT
      ?AUTO_169 - SATELLITE
      ?AUTO_171 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_170 ?AUTO_169 ) ( SUPPORTS ?AUTO_170 ?AUTO_168 ) ( CALIBRATION_TARGET ?AUTO_170 ?AUTO_167 ) ( POWER_AVAIL ?AUTO_169 ) ( POINTING ?AUTO_169 ?AUTO_171 ) ( not ( = ?AUTO_167 ?AUTO_171 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_169 ?AUTO_167 ?AUTO_171 )
      ( GET_IMAGE ?AUTO_167 ?AUTO_168 )
      ( GET_IMAGE-VERIFY ?AUTO_167 ?AUTO_168 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_174 - DIRECTION
      ?AUTO_175 - MODE
    )
    :vars
    (
      ?AUTO_176 - INSTRUMENT
      ?AUTO_177 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_176 ) ( ON_BOARD ?AUTO_176 ?AUTO_177 ) ( SUPPORTS ?AUTO_176 ?AUTO_175 ) ( POWER_ON ?AUTO_176 ) ( POINTING ?AUTO_177 ?AUTO_174 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_177 ?AUTO_174 ?AUTO_176 ?AUTO_175 )
      ( GET_IMAGE-VERIFY ?AUTO_174 ?AUTO_175 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_178 - DIRECTION
      ?AUTO_179 - MODE
    )
    :vars
    (
      ?AUTO_181 - INSTRUMENT
      ?AUTO_180 - SATELLITE
      ?AUTO_182 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_181 ) ( ON_BOARD ?AUTO_181 ?AUTO_180 ) ( SUPPORTS ?AUTO_181 ?AUTO_179 ) ( POWER_ON ?AUTO_181 ) ( POINTING ?AUTO_180 ?AUTO_182 ) ( not ( = ?AUTO_178 ?AUTO_182 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_180 ?AUTO_178 ?AUTO_182 )
      ( GET_IMAGE ?AUTO_178 ?AUTO_179 )
      ( GET_IMAGE-VERIFY ?AUTO_178 ?AUTO_179 ) )
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
    ( and ( ON_BOARD ?AUTO_187 ?AUTO_188 ) ( SUPPORTS ?AUTO_187 ?AUTO_186 ) ( POWER_ON ?AUTO_187 ) ( POINTING ?AUTO_188 ?AUTO_189 ) ( not ( = ?AUTO_185 ?AUTO_189 ) ) ( CALIBRATION_TARGET ?AUTO_187 ?AUTO_189 ) ( NOT_CALIBRATED ?AUTO_187 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_188 ?AUTO_187 ?AUTO_189 )
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
      ?AUTO_193 - SATELLITE
      ?AUTO_194 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_192 ?AUTO_193 ) ( SUPPORTS ?AUTO_192 ?AUTO_191 ) ( POINTING ?AUTO_193 ?AUTO_194 ) ( not ( = ?AUTO_190 ?AUTO_194 ) ) ( CALIBRATION_TARGET ?AUTO_192 ?AUTO_194 ) ( POWER_AVAIL ?AUTO_193 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_192 ?AUTO_193 )
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
    ( and ( ON_BOARD ?AUTO_197 ?AUTO_198 ) ( SUPPORTS ?AUTO_197 ?AUTO_196 ) ( not ( = ?AUTO_195 ?AUTO_199 ) ) ( CALIBRATION_TARGET ?AUTO_197 ?AUTO_199 ) ( POWER_AVAIL ?AUTO_198 ) ( POINTING ?AUTO_198 ?AUTO_195 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_198 ?AUTO_199 ?AUTO_195 )
      ( GET_IMAGE ?AUTO_195 ?AUTO_196 )
      ( GET_IMAGE-VERIFY ?AUTO_195 ?AUTO_196 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_202 - DIRECTION
      ?AUTO_203 - MODE
    )
    :vars
    (
      ?AUTO_204 - INSTRUMENT
      ?AUTO_205 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_204 ) ( ON_BOARD ?AUTO_204 ?AUTO_205 ) ( SUPPORTS ?AUTO_204 ?AUTO_203 ) ( POWER_ON ?AUTO_204 ) ( POINTING ?AUTO_205 ?AUTO_202 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_205 ?AUTO_202 ?AUTO_204 ?AUTO_203 )
      ( GET_IMAGE-VERIFY ?AUTO_202 ?AUTO_203 ) )
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
    ( and ( ON_BOARD ?AUTO_208 ?AUTO_209 ) ( SUPPORTS ?AUTO_208 ?AUTO_207 ) ( POWER_ON ?AUTO_208 ) ( POINTING ?AUTO_209 ?AUTO_206 ) ( CALIBRATION_TARGET ?AUTO_208 ?AUTO_206 ) ( NOT_CALIBRATED ?AUTO_208 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_209 ?AUTO_208 ?AUTO_206 )
      ( GET_IMAGE ?AUTO_206 ?AUTO_207 )
      ( GET_IMAGE-VERIFY ?AUTO_206 ?AUTO_207 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_210 - DIRECTION
      ?AUTO_211 - MODE
    )
    :vars
    (
      ?AUTO_213 - INSTRUMENT
      ?AUTO_212 - SATELLITE
      ?AUTO_214 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_213 ?AUTO_212 ) ( SUPPORTS ?AUTO_213 ?AUTO_211 ) ( POWER_ON ?AUTO_213 ) ( CALIBRATION_TARGET ?AUTO_213 ?AUTO_210 ) ( NOT_CALIBRATED ?AUTO_213 ) ( POINTING ?AUTO_212 ?AUTO_214 ) ( not ( = ?AUTO_210 ?AUTO_214 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_212 ?AUTO_210 ?AUTO_214 )
      ( GET_IMAGE ?AUTO_210 ?AUTO_211 )
      ( GET_IMAGE-VERIFY ?AUTO_210 ?AUTO_211 ) )
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
      ?AUTO_217 - SATELLITE
      ?AUTO_219 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_218 ?AUTO_217 ) ( SUPPORTS ?AUTO_218 ?AUTO_216 ) ( CALIBRATION_TARGET ?AUTO_218 ?AUTO_215 ) ( POINTING ?AUTO_217 ?AUTO_219 ) ( not ( = ?AUTO_215 ?AUTO_219 ) ) ( POWER_AVAIL ?AUTO_217 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_218 ?AUTO_217 )
      ( GET_IMAGE ?AUTO_215 ?AUTO_216 )
      ( GET_IMAGE-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_222 - DIRECTION
      ?AUTO_223 - MODE
    )
    :vars
    (
      ?AUTO_226 - INSTRUMENT
      ?AUTO_224 - SATELLITE
      ?AUTO_225 - DIRECTION
      ?AUTO_227 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_226 ?AUTO_224 ) ( SUPPORTS ?AUTO_226 ?AUTO_223 ) ( CALIBRATION_TARGET ?AUTO_226 ?AUTO_222 ) ( POINTING ?AUTO_224 ?AUTO_225 ) ( not ( = ?AUTO_222 ?AUTO_225 ) ) ( ON_BOARD ?AUTO_227 ?AUTO_224 ) ( POWER_ON ?AUTO_227 ) ( not ( = ?AUTO_226 ?AUTO_227 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_227 ?AUTO_224 )
      ( GET_IMAGE ?AUTO_222 ?AUTO_223 )
      ( GET_IMAGE-VERIFY ?AUTO_222 ?AUTO_223 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_242 - DIRECTION
      ?AUTO_243 - MODE
    )
    :vars
    (
      ?AUTO_244 - INSTRUMENT
      ?AUTO_245 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_244 ) ( ON_BOARD ?AUTO_244 ?AUTO_245 ) ( SUPPORTS ?AUTO_244 ?AUTO_243 ) ( POWER_ON ?AUTO_244 ) ( POINTING ?AUTO_245 ?AUTO_242 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_245 ?AUTO_242 ?AUTO_244 ?AUTO_243 )
      ( GET_IMAGE-VERIFY ?AUTO_242 ?AUTO_243 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_246 - DIRECTION
      ?AUTO_247 - MODE
    )
    :vars
    (
      ?AUTO_248 - INSTRUMENT
      ?AUTO_249 - SATELLITE
      ?AUTO_250 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_248 ) ( ON_BOARD ?AUTO_248 ?AUTO_249 ) ( SUPPORTS ?AUTO_248 ?AUTO_247 ) ( POWER_ON ?AUTO_248 ) ( POINTING ?AUTO_249 ?AUTO_250 ) ( not ( = ?AUTO_246 ?AUTO_250 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_249 ?AUTO_246 ?AUTO_250 )
      ( GET_IMAGE ?AUTO_246 ?AUTO_247 )
      ( GET_IMAGE-VERIFY ?AUTO_246 ?AUTO_247 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_253 - DIRECTION
      ?AUTO_254 - MODE
    )
    :vars
    (
      ?AUTO_256 - INSTRUMENT
      ?AUTO_257 - SATELLITE
      ?AUTO_255 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_256 ?AUTO_257 ) ( SUPPORTS ?AUTO_256 ?AUTO_254 ) ( POWER_ON ?AUTO_256 ) ( POINTING ?AUTO_257 ?AUTO_255 ) ( not ( = ?AUTO_253 ?AUTO_255 ) ) ( CALIBRATION_TARGET ?AUTO_256 ?AUTO_255 ) ( NOT_CALIBRATED ?AUTO_256 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_257 ?AUTO_256 ?AUTO_255 )
      ( GET_IMAGE ?AUTO_253 ?AUTO_254 )
      ( GET_IMAGE-VERIFY ?AUTO_253 ?AUTO_254 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_258 - DIRECTION
      ?AUTO_259 - MODE
    )
    :vars
    (
      ?AUTO_262 - INSTRUMENT
      ?AUTO_260 - SATELLITE
      ?AUTO_261 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_262 ?AUTO_260 ) ( SUPPORTS ?AUTO_262 ?AUTO_259 ) ( POWER_ON ?AUTO_262 ) ( not ( = ?AUTO_258 ?AUTO_261 ) ) ( CALIBRATION_TARGET ?AUTO_262 ?AUTO_261 ) ( NOT_CALIBRATED ?AUTO_262 ) ( POINTING ?AUTO_260 ?AUTO_258 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_260 ?AUTO_261 ?AUTO_258 )
      ( GET_IMAGE ?AUTO_258 ?AUTO_259 )
      ( GET_IMAGE-VERIFY ?AUTO_258 ?AUTO_259 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_263 - DIRECTION
      ?AUTO_264 - MODE
    )
    :vars
    (
      ?AUTO_267 - INSTRUMENT
      ?AUTO_266 - SATELLITE
      ?AUTO_265 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_267 ?AUTO_266 ) ( SUPPORTS ?AUTO_267 ?AUTO_264 ) ( not ( = ?AUTO_263 ?AUTO_265 ) ) ( CALIBRATION_TARGET ?AUTO_267 ?AUTO_265 ) ( POINTING ?AUTO_266 ?AUTO_263 ) ( POWER_AVAIL ?AUTO_266 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_267 ?AUTO_266 )
      ( GET_IMAGE ?AUTO_263 ?AUTO_264 )
      ( GET_IMAGE-VERIFY ?AUTO_263 ?AUTO_264 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_268 - DIRECTION
      ?AUTO_269 - MODE
    )
    :vars
    (
      ?AUTO_270 - INSTRUMENT
      ?AUTO_272 - SATELLITE
      ?AUTO_271 - DIRECTION
      ?AUTO_273 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_270 ?AUTO_272 ) ( SUPPORTS ?AUTO_270 ?AUTO_269 ) ( not ( = ?AUTO_268 ?AUTO_271 ) ) ( CALIBRATION_TARGET ?AUTO_270 ?AUTO_271 ) ( POWER_AVAIL ?AUTO_272 ) ( POINTING ?AUTO_272 ?AUTO_273 ) ( not ( = ?AUTO_268 ?AUTO_273 ) ) ( not ( = ?AUTO_271 ?AUTO_273 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_272 ?AUTO_268 ?AUTO_273 )
      ( GET_IMAGE ?AUTO_268 ?AUTO_269 )
      ( GET_IMAGE-VERIFY ?AUTO_268 ?AUTO_269 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_274 - DIRECTION
      ?AUTO_275 - MODE
    )
    :vars
    (
      ?AUTO_277 - INSTRUMENT
      ?AUTO_278 - SATELLITE
      ?AUTO_276 - DIRECTION
      ?AUTO_279 - DIRECTION
      ?AUTO_280 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_277 ?AUTO_278 ) ( SUPPORTS ?AUTO_277 ?AUTO_275 ) ( not ( = ?AUTO_274 ?AUTO_276 ) ) ( CALIBRATION_TARGET ?AUTO_277 ?AUTO_276 ) ( POINTING ?AUTO_278 ?AUTO_279 ) ( not ( = ?AUTO_274 ?AUTO_279 ) ) ( not ( = ?AUTO_276 ?AUTO_279 ) ) ( ON_BOARD ?AUTO_280 ?AUTO_278 ) ( POWER_ON ?AUTO_280 ) ( not ( = ?AUTO_277 ?AUTO_280 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_280 ?AUTO_278 )
      ( GET_IMAGE ?AUTO_274 ?AUTO_275 )
      ( GET_IMAGE-VERIFY ?AUTO_274 ?AUTO_275 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_283 - DIRECTION
      ?AUTO_284 - MODE
    )
    :vars
    (
      ?AUTO_286 - INSTRUMENT
      ?AUTO_289 - SATELLITE
      ?AUTO_285 - DIRECTION
      ?AUTO_288 - DIRECTION
      ?AUTO_287 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_286 ?AUTO_289 ) ( SUPPORTS ?AUTO_286 ?AUTO_284 ) ( not ( = ?AUTO_283 ?AUTO_285 ) ) ( CALIBRATION_TARGET ?AUTO_286 ?AUTO_285 ) ( not ( = ?AUTO_283 ?AUTO_288 ) ) ( not ( = ?AUTO_285 ?AUTO_288 ) ) ( ON_BOARD ?AUTO_287 ?AUTO_289 ) ( POWER_ON ?AUTO_287 ) ( not ( = ?AUTO_286 ?AUTO_287 ) ) ( POINTING ?AUTO_289 ?AUTO_283 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_289 ?AUTO_288 ?AUTO_283 )
      ( GET_IMAGE ?AUTO_283 ?AUTO_284 )
      ( GET_IMAGE-VERIFY ?AUTO_283 ?AUTO_284 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_292 - DIRECTION
      ?AUTO_293 - MODE
    )
    :vars
    (
      ?AUTO_294 - INSTRUMENT
      ?AUTO_295 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_294 ) ( ON_BOARD ?AUTO_294 ?AUTO_295 ) ( SUPPORTS ?AUTO_294 ?AUTO_293 ) ( POWER_ON ?AUTO_294 ) ( POINTING ?AUTO_295 ?AUTO_292 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_295 ?AUTO_292 ?AUTO_294 ?AUTO_293 )
      ( GET_IMAGE-VERIFY ?AUTO_292 ?AUTO_293 ) )
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
    ( and ( ON_BOARD ?AUTO_298 ?AUTO_299 ) ( SUPPORTS ?AUTO_298 ?AUTO_297 ) ( POWER_ON ?AUTO_298 ) ( POINTING ?AUTO_299 ?AUTO_296 ) ( CALIBRATION_TARGET ?AUTO_298 ?AUTO_296 ) ( NOT_CALIBRATED ?AUTO_298 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_299 ?AUTO_298 ?AUTO_296 )
      ( GET_IMAGE ?AUTO_296 ?AUTO_297 )
      ( GET_IMAGE-VERIFY ?AUTO_296 ?AUTO_297 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_300 - DIRECTION
      ?AUTO_301 - MODE
    )
    :vars
    (
      ?AUTO_303 - INSTRUMENT
      ?AUTO_302 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_303 ?AUTO_302 ) ( SUPPORTS ?AUTO_303 ?AUTO_301 ) ( POINTING ?AUTO_302 ?AUTO_300 ) ( CALIBRATION_TARGET ?AUTO_303 ?AUTO_300 ) ( POWER_AVAIL ?AUTO_302 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_303 ?AUTO_302 )
      ( GET_IMAGE ?AUTO_300 ?AUTO_301 )
      ( GET_IMAGE-VERIFY ?AUTO_300 ?AUTO_301 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_308 - DIRECTION
      ?AUTO_309 - MODE
    )
    :vars
    (
      ?AUTO_310 - INSTRUMENT
      ?AUTO_311 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_310 ) ( ON_BOARD ?AUTO_310 ?AUTO_311 ) ( SUPPORTS ?AUTO_310 ?AUTO_309 ) ( POWER_ON ?AUTO_310 ) ( POINTING ?AUTO_311 ?AUTO_308 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_311 ?AUTO_308 ?AUTO_310 ?AUTO_309 )
      ( GET_IMAGE-VERIFY ?AUTO_308 ?AUTO_309 ) )
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
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_314 ?AUTO_315 ) ( SUPPORTS ?AUTO_314 ?AUTO_313 ) ( POWER_ON ?AUTO_314 ) ( POINTING ?AUTO_315 ?AUTO_312 ) ( CALIBRATION_TARGET ?AUTO_314 ?AUTO_312 ) ( NOT_CALIBRATED ?AUTO_314 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_315 ?AUTO_314 ?AUTO_312 )
      ( GET_IMAGE ?AUTO_312 ?AUTO_313 )
      ( GET_IMAGE-VERIFY ?AUTO_312 ?AUTO_313 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_316 - DIRECTION
      ?AUTO_317 - MODE
    )
    :vars
    (
      ?AUTO_319 - INSTRUMENT
      ?AUTO_318 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_319 ?AUTO_318 ) ( SUPPORTS ?AUTO_319 ?AUTO_317 ) ( POINTING ?AUTO_318 ?AUTO_316 ) ( CALIBRATION_TARGET ?AUTO_319 ?AUTO_316 ) ( POWER_AVAIL ?AUTO_318 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_319 ?AUTO_318 )
      ( GET_IMAGE ?AUTO_316 ?AUTO_317 )
      ( GET_IMAGE-VERIFY ?AUTO_316 ?AUTO_317 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_330 - DIRECTION
      ?AUTO_331 - MODE
    )
    :vars
    (
      ?AUTO_332 - INSTRUMENT
      ?AUTO_333 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_332 ) ( ON_BOARD ?AUTO_332 ?AUTO_333 ) ( SUPPORTS ?AUTO_332 ?AUTO_331 ) ( POWER_ON ?AUTO_332 ) ( POINTING ?AUTO_333 ?AUTO_330 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_333 ?AUTO_330 ?AUTO_332 ?AUTO_331 )
      ( GET_IMAGE-VERIFY ?AUTO_330 ?AUTO_331 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_334 - DIRECTION
      ?AUTO_335 - MODE
    )
    :vars
    (
      ?AUTO_336 - INSTRUMENT
      ?AUTO_337 - SATELLITE
      ?AUTO_338 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_336 ) ( ON_BOARD ?AUTO_336 ?AUTO_337 ) ( SUPPORTS ?AUTO_336 ?AUTO_335 ) ( POWER_ON ?AUTO_336 ) ( POINTING ?AUTO_337 ?AUTO_338 ) ( not ( = ?AUTO_334 ?AUTO_338 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_337 ?AUTO_334 ?AUTO_338 )
      ( GET_IMAGE ?AUTO_334 ?AUTO_335 )
      ( GET_IMAGE-VERIFY ?AUTO_334 ?AUTO_335 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_339 - DIRECTION
      ?AUTO_340 - MODE
    )
    :vars
    (
      ?AUTO_342 - INSTRUMENT
      ?AUTO_341 - SATELLITE
      ?AUTO_343 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_342 ?AUTO_341 ) ( SUPPORTS ?AUTO_342 ?AUTO_340 ) ( POWER_ON ?AUTO_342 ) ( POINTING ?AUTO_341 ?AUTO_343 ) ( not ( = ?AUTO_339 ?AUTO_343 ) ) ( CALIBRATION_TARGET ?AUTO_342 ?AUTO_343 ) ( NOT_CALIBRATED ?AUTO_342 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_341 ?AUTO_342 ?AUTO_343 )
      ( GET_IMAGE ?AUTO_339 ?AUTO_340 )
      ( GET_IMAGE-VERIFY ?AUTO_339 ?AUTO_340 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_344 - DIRECTION
      ?AUTO_345 - MODE
    )
    :vars
    (
      ?AUTO_346 - INSTRUMENT
      ?AUTO_347 - SATELLITE
      ?AUTO_348 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_346 ?AUTO_347 ) ( SUPPORTS ?AUTO_346 ?AUTO_345 ) ( POINTING ?AUTO_347 ?AUTO_348 ) ( not ( = ?AUTO_344 ?AUTO_348 ) ) ( CALIBRATION_TARGET ?AUTO_346 ?AUTO_348 ) ( POWER_AVAIL ?AUTO_347 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_346 ?AUTO_347 )
      ( GET_IMAGE ?AUTO_344 ?AUTO_345 )
      ( GET_IMAGE-VERIFY ?AUTO_344 ?AUTO_345 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_349 - DIRECTION
      ?AUTO_350 - MODE
    )
    :vars
    (
      ?AUTO_352 - INSTRUMENT
      ?AUTO_351 - SATELLITE
      ?AUTO_353 - DIRECTION
      ?AUTO_354 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_352 ?AUTO_351 ) ( SUPPORTS ?AUTO_352 ?AUTO_350 ) ( POINTING ?AUTO_351 ?AUTO_353 ) ( not ( = ?AUTO_349 ?AUTO_353 ) ) ( CALIBRATION_TARGET ?AUTO_352 ?AUTO_353 ) ( ON_BOARD ?AUTO_354 ?AUTO_351 ) ( POWER_ON ?AUTO_354 ) ( not ( = ?AUTO_352 ?AUTO_354 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_354 ?AUTO_351 )
      ( GET_IMAGE ?AUTO_349 ?AUTO_350 )
      ( GET_IMAGE-VERIFY ?AUTO_349 ?AUTO_350 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_357 - DIRECTION
      ?AUTO_358 - MODE
    )
    :vars
    (
      ?AUTO_359 - INSTRUMENT
      ?AUTO_360 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_359 ) ( ON_BOARD ?AUTO_359 ?AUTO_360 ) ( SUPPORTS ?AUTO_359 ?AUTO_358 ) ( POWER_ON ?AUTO_359 ) ( POINTING ?AUTO_360 ?AUTO_357 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_360 ?AUTO_357 ?AUTO_359 ?AUTO_358 )
      ( GET_IMAGE-VERIFY ?AUTO_357 ?AUTO_358 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_361 - DIRECTION
      ?AUTO_362 - MODE
    )
    :vars
    (
      ?AUTO_363 - INSTRUMENT
      ?AUTO_364 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_363 ?AUTO_364 ) ( SUPPORTS ?AUTO_363 ?AUTO_362 ) ( POWER_ON ?AUTO_363 ) ( POINTING ?AUTO_364 ?AUTO_361 ) ( CALIBRATION_TARGET ?AUTO_363 ?AUTO_361 ) ( NOT_CALIBRATED ?AUTO_363 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_364 ?AUTO_363 ?AUTO_361 )
      ( GET_IMAGE ?AUTO_361 ?AUTO_362 )
      ( GET_IMAGE-VERIFY ?AUTO_361 ?AUTO_362 ) )
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
      ?AUTO_367 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_368 ?AUTO_367 ) ( SUPPORTS ?AUTO_368 ?AUTO_366 ) ( POINTING ?AUTO_367 ?AUTO_365 ) ( CALIBRATION_TARGET ?AUTO_368 ?AUTO_365 ) ( POWER_AVAIL ?AUTO_367 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_368 ?AUTO_367 )
      ( GET_IMAGE ?AUTO_365 ?AUTO_366 )
      ( GET_IMAGE-VERIFY ?AUTO_365 ?AUTO_366 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_371 - DIRECTION
      ?AUTO_372 - MODE
    )
    :vars
    (
      ?AUTO_373 - INSTRUMENT
      ?AUTO_374 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_373 ) ( ON_BOARD ?AUTO_373 ?AUTO_374 ) ( SUPPORTS ?AUTO_373 ?AUTO_372 ) ( POWER_ON ?AUTO_373 ) ( POINTING ?AUTO_374 ?AUTO_371 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_374 ?AUTO_371 ?AUTO_373 ?AUTO_372 )
      ( GET_IMAGE-VERIFY ?AUTO_371 ?AUTO_372 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_375 - DIRECTION
      ?AUTO_376 - MODE
    )
    :vars
    (
      ?AUTO_377 - INSTRUMENT
      ?AUTO_378 - SATELLITE
      ?AUTO_379 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_377 ) ( ON_BOARD ?AUTO_377 ?AUTO_378 ) ( SUPPORTS ?AUTO_377 ?AUTO_376 ) ( POWER_ON ?AUTO_377 ) ( POINTING ?AUTO_378 ?AUTO_379 ) ( not ( = ?AUTO_375 ?AUTO_379 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_378 ?AUTO_375 ?AUTO_379 )
      ( GET_IMAGE ?AUTO_375 ?AUTO_376 )
      ( GET_IMAGE-VERIFY ?AUTO_375 ?AUTO_376 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_382 - DIRECTION
      ?AUTO_383 - MODE
    )
    :vars
    (
      ?AUTO_386 - INSTRUMENT
      ?AUTO_385 - SATELLITE
      ?AUTO_384 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_386 ?AUTO_385 ) ( SUPPORTS ?AUTO_386 ?AUTO_383 ) ( POWER_ON ?AUTO_386 ) ( POINTING ?AUTO_385 ?AUTO_384 ) ( not ( = ?AUTO_382 ?AUTO_384 ) ) ( CALIBRATION_TARGET ?AUTO_386 ?AUTO_384 ) ( NOT_CALIBRATED ?AUTO_386 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_385 ?AUTO_386 ?AUTO_384 )
      ( GET_IMAGE ?AUTO_382 ?AUTO_383 )
      ( GET_IMAGE-VERIFY ?AUTO_382 ?AUTO_383 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_387 - DIRECTION
      ?AUTO_388 - MODE
    )
    :vars
    (
      ?AUTO_391 - INSTRUMENT
      ?AUTO_390 - SATELLITE
      ?AUTO_389 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_391 ?AUTO_390 ) ( SUPPORTS ?AUTO_391 ?AUTO_388 ) ( POINTING ?AUTO_390 ?AUTO_389 ) ( not ( = ?AUTO_387 ?AUTO_389 ) ) ( CALIBRATION_TARGET ?AUTO_391 ?AUTO_389 ) ( POWER_AVAIL ?AUTO_390 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_391 ?AUTO_390 )
      ( GET_IMAGE ?AUTO_387 ?AUTO_388 )
      ( GET_IMAGE-VERIFY ?AUTO_387 ?AUTO_388 ) )
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
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_400 ?AUTO_401 ) ( SUPPORTS ?AUTO_400 ?AUTO_399 ) ( POWER_ON ?AUTO_400 ) ( POINTING ?AUTO_401 ?AUTO_398 ) ( CALIBRATION_TARGET ?AUTO_400 ?AUTO_398 ) ( NOT_CALIBRATED ?AUTO_400 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_401 ?AUTO_400 ?AUTO_398 )
      ( GET_IMAGE ?AUTO_398 ?AUTO_399 )
      ( GET_IMAGE-VERIFY ?AUTO_398 ?AUTO_399 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_402 - DIRECTION
      ?AUTO_403 - MODE
    )
    :vars
    (
      ?AUTO_405 - INSTRUMENT
      ?AUTO_404 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_405 ?AUTO_404 ) ( SUPPORTS ?AUTO_405 ?AUTO_403 ) ( POINTING ?AUTO_404 ?AUTO_402 ) ( CALIBRATION_TARGET ?AUTO_405 ?AUTO_402 ) ( POWER_AVAIL ?AUTO_404 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_405 ?AUTO_404 )
      ( GET_IMAGE ?AUTO_402 ?AUTO_403 )
      ( GET_IMAGE-VERIFY ?AUTO_402 ?AUTO_403 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_406 - DIRECTION
      ?AUTO_407 - MODE
    )
    :vars
    (
      ?AUTO_409 - INSTRUMENT
      ?AUTO_408 - SATELLITE
      ?AUTO_410 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_409 ?AUTO_408 ) ( SUPPORTS ?AUTO_409 ?AUTO_407 ) ( POINTING ?AUTO_408 ?AUTO_406 ) ( CALIBRATION_TARGET ?AUTO_409 ?AUTO_406 ) ( ON_BOARD ?AUTO_410 ?AUTO_408 ) ( POWER_ON ?AUTO_410 ) ( not ( = ?AUTO_409 ?AUTO_410 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?AUTO_410 ?AUTO_408 )
      ( GET_IMAGE ?AUTO_406 ?AUTO_407 )
      ( GET_IMAGE-VERIFY ?AUTO_406 ?AUTO_407 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_413 - DIRECTION
      ?AUTO_414 - MODE
    )
    :vars
    (
      ?AUTO_416 - INSTRUMENT
      ?AUTO_417 - SATELLITE
      ?AUTO_415 - INSTRUMENT
      ?AUTO_418 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_416 ?AUTO_417 ) ( SUPPORTS ?AUTO_416 ?AUTO_414 ) ( CALIBRATION_TARGET ?AUTO_416 ?AUTO_413 ) ( ON_BOARD ?AUTO_415 ?AUTO_417 ) ( POWER_ON ?AUTO_415 ) ( not ( = ?AUTO_416 ?AUTO_415 ) ) ( POINTING ?AUTO_417 ?AUTO_418 ) ( not ( = ?AUTO_413 ?AUTO_418 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_417 ?AUTO_413 ?AUTO_418 )
      ( GET_IMAGE ?AUTO_413 ?AUTO_414 )
      ( GET_IMAGE-VERIFY ?AUTO_413 ?AUTO_414 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_423 - DIRECTION
      ?AUTO_424 - MODE
    )
    :vars
    (
      ?AUTO_426 - INSTRUMENT
      ?AUTO_427 - SATELLITE
      ?AUTO_425 - INSTRUMENT
      ?AUTO_428 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_426 ?AUTO_427 ) ( SUPPORTS ?AUTO_426 ?AUTO_424 ) ( CALIBRATION_TARGET ?AUTO_426 ?AUTO_423 ) ( ON_BOARD ?AUTO_425 ?AUTO_427 ) ( not ( = ?AUTO_426 ?AUTO_425 ) ) ( POINTING ?AUTO_427 ?AUTO_428 ) ( not ( = ?AUTO_423 ?AUTO_428 ) ) ( POWER_AVAIL ?AUTO_427 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_425 ?AUTO_427 )
      ( GET_IMAGE ?AUTO_423 ?AUTO_424 )
      ( GET_IMAGE-VERIFY ?AUTO_423 ?AUTO_424 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_431 - DIRECTION
      ?AUTO_432 - MODE
    )
    :vars
    (
      ?AUTO_433 - INSTRUMENT
      ?AUTO_434 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_433 ) ( ON_BOARD ?AUTO_433 ?AUTO_434 ) ( SUPPORTS ?AUTO_433 ?AUTO_432 ) ( POWER_ON ?AUTO_433 ) ( POINTING ?AUTO_434 ?AUTO_431 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_434 ?AUTO_431 ?AUTO_433 ?AUTO_432 )
      ( GET_IMAGE-VERIFY ?AUTO_431 ?AUTO_432 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_435 - DIRECTION
      ?AUTO_436 - MODE
    )
    :vars
    (
      ?AUTO_438 - INSTRUMENT
      ?AUTO_437 - SATELLITE
      ?AUTO_439 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?AUTO_438 ) ( ON_BOARD ?AUTO_438 ?AUTO_437 ) ( SUPPORTS ?AUTO_438 ?AUTO_436 ) ( POWER_ON ?AUTO_438 ) ( POINTING ?AUTO_437 ?AUTO_439 ) ( not ( = ?AUTO_435 ?AUTO_439 ) ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_437 ?AUTO_435 ?AUTO_439 )
      ( GET_IMAGE ?AUTO_435 ?AUTO_436 )
      ( GET_IMAGE-VERIFY ?AUTO_435 ?AUTO_436 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_442 - DIRECTION
      ?AUTO_443 - MODE
    )
    :vars
    (
      ?AUTO_446 - INSTRUMENT
      ?AUTO_445 - SATELLITE
      ?AUTO_444 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_446 ?AUTO_445 ) ( SUPPORTS ?AUTO_446 ?AUTO_443 ) ( POWER_ON ?AUTO_446 ) ( POINTING ?AUTO_445 ?AUTO_444 ) ( not ( = ?AUTO_442 ?AUTO_444 ) ) ( CALIBRATION_TARGET ?AUTO_446 ?AUTO_444 ) ( NOT_CALIBRATED ?AUTO_446 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_445 ?AUTO_446 ?AUTO_444 )
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
      ?AUTO_451 - INSTRUMENT
      ?AUTO_450 - SATELLITE
      ?AUTO_449 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_451 ?AUTO_450 ) ( SUPPORTS ?AUTO_451 ?AUTO_448 ) ( POINTING ?AUTO_450 ?AUTO_449 ) ( not ( = ?AUTO_447 ?AUTO_449 ) ) ( CALIBRATION_TARGET ?AUTO_451 ?AUTO_449 ) ( POWER_AVAIL ?AUTO_450 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_451 ?AUTO_450 )
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
      ?AUTO_456 - INSTRUMENT
      ?AUTO_455 - SATELLITE
      ?AUTO_454 - DIRECTION
      ?AUTO_457 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_456 ?AUTO_455 ) ( SUPPORTS ?AUTO_456 ?AUTO_453 ) ( POINTING ?AUTO_455 ?AUTO_454 ) ( not ( = ?AUTO_452 ?AUTO_454 ) ) ( CALIBRATION_TARGET ?AUTO_456 ?AUTO_454 ) ( ON_BOARD ?AUTO_457 ?AUTO_455 ) ( POWER_ON ?AUTO_457 ) ( not ( = ?AUTO_456 ?AUTO_457 ) ) )
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
      ?AUTO_462 - INSTRUMENT
      ?AUTO_464 - SATELLITE
      ?AUTO_463 - DIRECTION
      ?AUTO_465 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_462 ?AUTO_464 ) ( SUPPORTS ?AUTO_462 ?AUTO_461 ) ( not ( = ?AUTO_460 ?AUTO_463 ) ) ( CALIBRATION_TARGET ?AUTO_462 ?AUTO_463 ) ( ON_BOARD ?AUTO_465 ?AUTO_464 ) ( POWER_ON ?AUTO_465 ) ( not ( = ?AUTO_462 ?AUTO_465 ) ) ( POINTING ?AUTO_464 ?AUTO_460 ) )
    :subtasks
    ( ( !TURN_TO ?AUTO_464 ?AUTO_463 ?AUTO_460 )
      ( GET_IMAGE ?AUTO_460 ?AUTO_461 )
      ( GET_IMAGE-VERIFY ?AUTO_460 ?AUTO_461 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?AUTO_470 - DIRECTION
      ?AUTO_471 - MODE
    )
    :vars
    (
      ?AUTO_475 - INSTRUMENT
      ?AUTO_472 - SATELLITE
      ?AUTO_474 - DIRECTION
      ?AUTO_473 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?AUTO_475 ?AUTO_472 ) ( SUPPORTS ?AUTO_475 ?AUTO_471 ) ( not ( = ?AUTO_470 ?AUTO_474 ) ) ( CALIBRATION_TARGET ?AUTO_475 ?AUTO_474 ) ( ON_BOARD ?AUTO_473 ?AUTO_472 ) ( not ( = ?AUTO_475 ?AUTO_473 ) ) ( POINTING ?AUTO_472 ?AUTO_470 ) ( POWER_AVAIL ?AUTO_472 ) )
    :subtasks
    ( ( !SWITCH_ON ?AUTO_473 ?AUTO_472 )
      ( GET_IMAGE ?AUTO_470 ?AUTO_471 )
      ( GET_IMAGE-VERIFY ?AUTO_470 ?AUTO_471 ) )
  )

)

