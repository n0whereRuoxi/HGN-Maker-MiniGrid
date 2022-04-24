( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?i - INSTRUMENT ?s - SATELLITE )
    ( SUPPORTS ?i - INSTRUMENT ?m - MODE )
    ( POINTING ?s - SATELLITE ?d - DIRECTION )
    ( POWER_AVAIL ?s - SATELLITE )
    ( POWER_ON ?i - INSTRUMENT )
    ( CALIBRATED ?i - INSTRUMENT )
    ( NOT_CALIBRATED ?i - INSTRUMENT )
    ( HAVE_IMAGE ?d - DIRECTION ?m - MODE )
    ( CALIBRATION_TARGET ?i - INSTRUMENT ?d - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?s - SATELLITE
      ?d_new - DIRECTION
      ?d_prev - DIRECTION
    )
    :precondition
    ( and ( POINTING ?s ?d_prev ) ( not ( = ?d_new ?d_prev ) ) )
    :effect
    ( and ( POINTING ?s ?d_new ) ( not ( POINTING ?s ?d_prev ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_AVAIL ?s ) )
    :effect
    ( and ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) ( not ( CALIBRATED ?i ) ) ( not ( POWER_AVAIL ?s ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_ON ?i ) )
    :effect
    ( and ( POWER_AVAIL ?s ) ( not ( POWER_ON ?i ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?s - SATELLITE
      ?i - INSTRUMENT
      ?d - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( CALIBRATION_TARGET ?i ?d ) ( POINTING ?s ?d ) ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) )
    :effect
    ( and ( CALIBRATED ?i ) ( not ( NOT_CALIBRATED ?i ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - SATELLITE
      ?d - DIRECTION
      ?i - INSTRUMENT
      ?m - MODE
    )
    :precondition
    ( and ( CALIBRATED ?i ) ( ON_BOARD ?i ?s ) ( SUPPORTS ?i ?m ) ( POWER_ON ?i ) ( POINTING ?s ?d ) ( POWER_ON ?i ) )
    :effect
    ( and ( HAVE_IMAGE ?d ?m ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET_IMAGE-VERIFY
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_2 - DIRECTION
      ?auto_3 - MODE
    )
    :vars
    (
      ?auto_4 - INSTRUMENT
      ?auto_5 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_4 ) ( ON_BOARD ?auto_4 ?auto_5 ) ( SUPPORTS ?auto_4 ?auto_3 ) ( POWER_ON ?auto_4 ) ( POINTING ?auto_5 ?auto_2 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_5 ?auto_2 ?auto_4 ?auto_3 )
      ( GET_IMAGE-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_6 - DIRECTION
      ?auto_7 - MODE
    )
    :vars
    (
      ?auto_9 - INSTRUMENT
      ?auto_8 - SATELLITE
      ?auto_10 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9 ) ( ON_BOARD ?auto_9 ?auto_8 ) ( SUPPORTS ?auto_9 ?auto_7 ) ( POWER_ON ?auto_9 ) ( POINTING ?auto_8 ?auto_10 ) ( not ( = ?auto_6 ?auto_10 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_8 ?auto_6 ?auto_10 )
      ( GET_IMAGE ?auto_6 ?auto_7 )
      ( GET_IMAGE-VERIFY ?auto_6 ?auto_7 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_11 - DIRECTION
      ?auto_12 - MODE
    )
    :vars
    (
      ?auto_13 - INSTRUMENT
      ?auto_15 - SATELLITE
      ?auto_14 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13 ?auto_15 ) ( SUPPORTS ?auto_13 ?auto_12 ) ( POWER_ON ?auto_13 ) ( POINTING ?auto_15 ?auto_14 ) ( not ( = ?auto_11 ?auto_14 ) ) ( CALIBRATION_TARGET ?auto_13 ?auto_14 ) ( NOT_CALIBRATED ?auto_13 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_15 ?auto_13 ?auto_14 )
      ( GET_IMAGE ?auto_11 ?auto_12 )
      ( GET_IMAGE-VERIFY ?auto_11 ?auto_12 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_16 - DIRECTION
      ?auto_17 - MODE
    )
    :vars
    (
      ?auto_19 - INSTRUMENT
      ?auto_18 - SATELLITE
      ?auto_20 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19 ?auto_18 ) ( SUPPORTS ?auto_19 ?auto_17 ) ( POINTING ?auto_18 ?auto_20 ) ( not ( = ?auto_16 ?auto_20 ) ) ( CALIBRATION_TARGET ?auto_19 ?auto_20 ) ( POWER_AVAIL ?auto_18 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_19 ?auto_18 )
      ( GET_IMAGE ?auto_16 ?auto_17 )
      ( GET_IMAGE-VERIFY ?auto_16 ?auto_17 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_21 - DIRECTION
      ?auto_22 - MODE
    )
    :vars
    (
      ?auto_25 - INSTRUMENT
      ?auto_24 - SATELLITE
      ?auto_23 - DIRECTION
      ?auto_26 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25 ?auto_24 ) ( SUPPORTS ?auto_25 ?auto_22 ) ( not ( = ?auto_21 ?auto_23 ) ) ( CALIBRATION_TARGET ?auto_25 ?auto_23 ) ( POWER_AVAIL ?auto_24 ) ( POINTING ?auto_24 ?auto_26 ) ( not ( = ?auto_23 ?auto_26 ) ) ( not ( = ?auto_21 ?auto_26 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_24 ?auto_23 ?auto_26 )
      ( GET_IMAGE ?auto_21 ?auto_22 )
      ( GET_IMAGE-VERIFY ?auto_21 ?auto_22 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_29 - DIRECTION
      ?auto_30 - MODE
    )
    :vars
    (
      ?auto_31 - INSTRUMENT
      ?auto_32 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_31 ) ( ON_BOARD ?auto_31 ?auto_32 ) ( SUPPORTS ?auto_31 ?auto_30 ) ( POWER_ON ?auto_31 ) ( POINTING ?auto_32 ?auto_29 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_32 ?auto_29 ?auto_31 ?auto_30 )
      ( GET_IMAGE-VERIFY ?auto_29 ?auto_30 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_33 - DIRECTION
      ?auto_34 - MODE
    )
    :vars
    (
      ?auto_35 - INSTRUMENT
      ?auto_36 - SATELLITE
      ?auto_37 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_35 ) ( ON_BOARD ?auto_35 ?auto_36 ) ( SUPPORTS ?auto_35 ?auto_34 ) ( POWER_ON ?auto_35 ) ( POINTING ?auto_36 ?auto_37 ) ( not ( = ?auto_33 ?auto_37 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_36 ?auto_33 ?auto_37 )
      ( GET_IMAGE ?auto_33 ?auto_34 )
      ( GET_IMAGE-VERIFY ?auto_33 ?auto_34 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_43 - DIRECTION
      ?auto_44 - MODE
    )
    :vars
    (
      ?auto_47 - INSTRUMENT
      ?auto_46 - SATELLITE
      ?auto_45 - DIRECTION
      ?auto_48 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_47 ) ( ON_BOARD ?auto_47 ?auto_46 ) ( SUPPORTS ?auto_47 ?auto_44 ) ( POWER_ON ?auto_47 ) ( not ( = ?auto_43 ?auto_45 ) ) ( POINTING ?auto_46 ?auto_48 ) ( not ( = ?auto_45 ?auto_48 ) ) ( not ( = ?auto_43 ?auto_48 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_46 ?auto_45 ?auto_48 )
      ( GET_IMAGE ?auto_43 ?auto_44 )
      ( GET_IMAGE-VERIFY ?auto_43 ?auto_44 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_49 - DIRECTION
      ?auto_50 - MODE
    )
    :vars
    (
      ?auto_51 - INSTRUMENT
      ?auto_53 - SATELLITE
      ?auto_54 - DIRECTION
      ?auto_52 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_51 ?auto_53 ) ( SUPPORTS ?auto_51 ?auto_50 ) ( POWER_ON ?auto_51 ) ( not ( = ?auto_49 ?auto_54 ) ) ( POINTING ?auto_53 ?auto_52 ) ( not ( = ?auto_54 ?auto_52 ) ) ( not ( = ?auto_49 ?auto_52 ) ) ( CALIBRATION_TARGET ?auto_51 ?auto_52 ) ( NOT_CALIBRATED ?auto_51 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_53 ?auto_51 ?auto_52 )
      ( GET_IMAGE ?auto_49 ?auto_50 )
      ( GET_IMAGE-VERIFY ?auto_49 ?auto_50 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_55 - DIRECTION
      ?auto_56 - MODE
    )
    :vars
    (
      ?auto_57 - INSTRUMENT
      ?auto_58 - SATELLITE
      ?auto_60 - DIRECTION
      ?auto_59 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_57 ?auto_58 ) ( SUPPORTS ?auto_57 ?auto_56 ) ( not ( = ?auto_55 ?auto_60 ) ) ( POINTING ?auto_58 ?auto_59 ) ( not ( = ?auto_60 ?auto_59 ) ) ( not ( = ?auto_55 ?auto_59 ) ) ( CALIBRATION_TARGET ?auto_57 ?auto_59 ) ( POWER_AVAIL ?auto_58 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_57 ?auto_58 )
      ( GET_IMAGE ?auto_55 ?auto_56 )
      ( GET_IMAGE-VERIFY ?auto_55 ?auto_56 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_61 - DIRECTION
      ?auto_62 - MODE
    )
    :vars
    (
      ?auto_63 - INSTRUMENT
      ?auto_66 - SATELLITE
      ?auto_65 - DIRECTION
      ?auto_64 - DIRECTION
      ?auto_67 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_63 ?auto_66 ) ( SUPPORTS ?auto_63 ?auto_62 ) ( not ( = ?auto_61 ?auto_65 ) ) ( not ( = ?auto_65 ?auto_64 ) ) ( not ( = ?auto_61 ?auto_64 ) ) ( CALIBRATION_TARGET ?auto_63 ?auto_64 ) ( POWER_AVAIL ?auto_66 ) ( POINTING ?auto_66 ?auto_67 ) ( not ( = ?auto_64 ?auto_67 ) ) ( not ( = ?auto_61 ?auto_67 ) ) ( not ( = ?auto_65 ?auto_67 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_66 ?auto_64 ?auto_67 )
      ( GET_IMAGE ?auto_61 ?auto_62 )
      ( GET_IMAGE-VERIFY ?auto_61 ?auto_62 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_70 - DIRECTION
      ?auto_71 - MODE
    )
    :vars
    (
      ?auto_72 - INSTRUMENT
      ?auto_73 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_72 ) ( ON_BOARD ?auto_72 ?auto_73 ) ( SUPPORTS ?auto_72 ?auto_71 ) ( POWER_ON ?auto_72 ) ( POINTING ?auto_73 ?auto_70 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_73 ?auto_70 ?auto_72 ?auto_71 )
      ( GET_IMAGE-VERIFY ?auto_70 ?auto_71 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_74 - DIRECTION
      ?auto_75 - MODE
    )
    :vars
    (
      ?auto_76 - INSTRUMENT
      ?auto_77 - SATELLITE
      ?auto_78 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_76 ) ( ON_BOARD ?auto_76 ?auto_77 ) ( SUPPORTS ?auto_76 ?auto_75 ) ( POWER_ON ?auto_76 ) ( POINTING ?auto_77 ?auto_78 ) ( not ( = ?auto_74 ?auto_78 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_77 ?auto_74 ?auto_78 )
      ( GET_IMAGE ?auto_74 ?auto_75 )
      ( GET_IMAGE-VERIFY ?auto_74 ?auto_75 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_84 - DIRECTION
      ?auto_85 - MODE
    )
    :vars
    (
      ?auto_88 - INSTRUMENT
      ?auto_86 - SATELLITE
      ?auto_87 - DIRECTION
      ?auto_89 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_88 ) ( ON_BOARD ?auto_88 ?auto_86 ) ( SUPPORTS ?auto_88 ?auto_85 ) ( POWER_ON ?auto_88 ) ( not ( = ?auto_84 ?auto_87 ) ) ( POINTING ?auto_86 ?auto_89 ) ( not ( = ?auto_87 ?auto_89 ) ) ( not ( = ?auto_84 ?auto_89 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_86 ?auto_87 ?auto_89 )
      ( GET_IMAGE ?auto_84 ?auto_85 )
      ( GET_IMAGE-VERIFY ?auto_84 ?auto_85 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_96 - DIRECTION
      ?auto_97 - MODE
    )
    :vars
    (
      ?auto_98 - INSTRUMENT
      ?auto_100 - SATELLITE
      ?auto_99 - DIRECTION
      ?auto_101 - DIRECTION
      ?auto_102 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_98 ) ( ON_BOARD ?auto_98 ?auto_100 ) ( SUPPORTS ?auto_98 ?auto_97 ) ( POWER_ON ?auto_98 ) ( not ( = ?auto_96 ?auto_99 ) ) ( not ( = ?auto_99 ?auto_101 ) ) ( not ( = ?auto_96 ?auto_101 ) ) ( POINTING ?auto_100 ?auto_102 ) ( not ( = ?auto_101 ?auto_102 ) ) ( not ( = ?auto_96 ?auto_102 ) ) ( not ( = ?auto_99 ?auto_102 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_100 ?auto_101 ?auto_102 )
      ( GET_IMAGE ?auto_96 ?auto_97 )
      ( GET_IMAGE-VERIFY ?auto_96 ?auto_97 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_103 - DIRECTION
      ?auto_104 - MODE
    )
    :vars
    (
      ?auto_109 - INSTRUMENT
      ?auto_105 - SATELLITE
      ?auto_107 - DIRECTION
      ?auto_106 - DIRECTION
      ?auto_108 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_109 ?auto_105 ) ( SUPPORTS ?auto_109 ?auto_104 ) ( POWER_ON ?auto_109 ) ( not ( = ?auto_103 ?auto_107 ) ) ( not ( = ?auto_107 ?auto_106 ) ) ( not ( = ?auto_103 ?auto_106 ) ) ( POINTING ?auto_105 ?auto_108 ) ( not ( = ?auto_106 ?auto_108 ) ) ( not ( = ?auto_103 ?auto_108 ) ) ( not ( = ?auto_107 ?auto_108 ) ) ( CALIBRATION_TARGET ?auto_109 ?auto_108 ) ( NOT_CALIBRATED ?auto_109 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_105 ?auto_109 ?auto_108 )
      ( GET_IMAGE ?auto_103 ?auto_104 )
      ( GET_IMAGE-VERIFY ?auto_103 ?auto_104 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_110 - DIRECTION
      ?auto_111 - MODE
    )
    :vars
    (
      ?auto_112 - INSTRUMENT
      ?auto_116 - SATELLITE
      ?auto_113 - DIRECTION
      ?auto_115 - DIRECTION
      ?auto_114 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112 ?auto_116 ) ( SUPPORTS ?auto_112 ?auto_111 ) ( not ( = ?auto_110 ?auto_113 ) ) ( not ( = ?auto_113 ?auto_115 ) ) ( not ( = ?auto_110 ?auto_115 ) ) ( POINTING ?auto_116 ?auto_114 ) ( not ( = ?auto_115 ?auto_114 ) ) ( not ( = ?auto_110 ?auto_114 ) ) ( not ( = ?auto_113 ?auto_114 ) ) ( CALIBRATION_TARGET ?auto_112 ?auto_114 ) ( POWER_AVAIL ?auto_116 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_112 ?auto_116 )
      ( GET_IMAGE ?auto_110 ?auto_111 )
      ( GET_IMAGE-VERIFY ?auto_110 ?auto_111 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_117 - DIRECTION
      ?auto_118 - MODE
    )
    :vars
    (
      ?auto_119 - INSTRUMENT
      ?auto_122 - SATELLITE
      ?auto_123 - DIRECTION
      ?auto_120 - DIRECTION
      ?auto_121 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_119 ?auto_122 ) ( SUPPORTS ?auto_119 ?auto_118 ) ( not ( = ?auto_117 ?auto_123 ) ) ( not ( = ?auto_123 ?auto_120 ) ) ( not ( = ?auto_117 ?auto_120 ) ) ( not ( = ?auto_120 ?auto_121 ) ) ( not ( = ?auto_117 ?auto_121 ) ) ( not ( = ?auto_123 ?auto_121 ) ) ( CALIBRATION_TARGET ?auto_119 ?auto_121 ) ( POWER_AVAIL ?auto_122 ) ( POINTING ?auto_122 ?auto_117 ) )
    :subtasks
    ( ( !TURN_TO ?auto_122 ?auto_121 ?auto_117 )
      ( GET_IMAGE ?auto_117 ?auto_118 )
      ( GET_IMAGE-VERIFY ?auto_117 ?auto_118 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_126 - DIRECTION
      ?auto_127 - MODE
    )
    :vars
    (
      ?auto_128 - INSTRUMENT
      ?auto_129 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_128 ) ( ON_BOARD ?auto_128 ?auto_129 ) ( SUPPORTS ?auto_128 ?auto_127 ) ( POWER_ON ?auto_128 ) ( POINTING ?auto_129 ?auto_126 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_129 ?auto_126 ?auto_128 ?auto_127 )
      ( GET_IMAGE-VERIFY ?auto_126 ?auto_127 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_130 - DIRECTION
      ?auto_131 - MODE
    )
    :vars
    (
      ?auto_133 - INSTRUMENT
      ?auto_132 - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?auto_133 ?auto_132 ) ( SUPPORTS ?auto_133 ?auto_131 ) ( POWER_ON ?auto_133 ) ( POINTING ?auto_132 ?auto_130 ) ( CALIBRATION_TARGET ?auto_133 ?auto_130 ) ( NOT_CALIBRATED ?auto_133 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_132 ?auto_133 ?auto_130 )
      ( GET_IMAGE ?auto_130 ?auto_131 )
      ( GET_IMAGE-VERIFY ?auto_130 ?auto_131 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_134 - DIRECTION
      ?auto_135 - MODE
    )
    :vars
    (
      ?auto_136 - INSTRUMENT
      ?auto_137 - SATELLITE
      ?auto_138 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_136 ?auto_137 ) ( SUPPORTS ?auto_136 ?auto_135 ) ( POWER_ON ?auto_136 ) ( CALIBRATION_TARGET ?auto_136 ?auto_134 ) ( NOT_CALIBRATED ?auto_136 ) ( POINTING ?auto_137 ?auto_138 ) ( not ( = ?auto_134 ?auto_138 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_137 ?auto_134 ?auto_138 )
      ( GET_IMAGE ?auto_134 ?auto_135 )
      ( GET_IMAGE-VERIFY ?auto_134 ?auto_135 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_139 - DIRECTION
      ?auto_140 - MODE
    )
    :vars
    (
      ?auto_141 - INSTRUMENT
      ?auto_142 - SATELLITE
      ?auto_143 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_141 ?auto_142 ) ( SUPPORTS ?auto_141 ?auto_140 ) ( CALIBRATION_TARGET ?auto_141 ?auto_139 ) ( POINTING ?auto_142 ?auto_143 ) ( not ( = ?auto_139 ?auto_143 ) ) ( POWER_AVAIL ?auto_142 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_141 ?auto_142 )
      ( GET_IMAGE ?auto_139 ?auto_140 )
      ( GET_IMAGE-VERIFY ?auto_139 ?auto_140 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_144 - DIRECTION
      ?auto_145 - MODE
    )
    :vars
    (
      ?auto_146 - INSTRUMENT
      ?auto_148 - SATELLITE
      ?auto_147 - DIRECTION
      ?auto_149 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146 ?auto_148 ) ( SUPPORTS ?auto_146 ?auto_145 ) ( CALIBRATION_TARGET ?auto_146 ?auto_144 ) ( POINTING ?auto_148 ?auto_147 ) ( not ( = ?auto_144 ?auto_147 ) ) ( ON_BOARD ?auto_149 ?auto_148 ) ( POWER_ON ?auto_149 ) ( not ( = ?auto_146 ?auto_149 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_149 ?auto_148 )
      ( GET_IMAGE ?auto_144 ?auto_145 )
      ( GET_IMAGE-VERIFY ?auto_144 ?auto_145 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_156 - DIRECTION
      ?auto_157 - MODE
    )
    :vars
    (
      ?auto_161 - INSTRUMENT
      ?auto_159 - SATELLITE
      ?auto_160 - DIRECTION
      ?auto_158 - INSTRUMENT
      ?auto_162 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_161 ?auto_159 ) ( SUPPORTS ?auto_161 ?auto_157 ) ( CALIBRATION_TARGET ?auto_161 ?auto_156 ) ( not ( = ?auto_156 ?auto_160 ) ) ( ON_BOARD ?auto_158 ?auto_159 ) ( POWER_ON ?auto_158 ) ( not ( = ?auto_161 ?auto_158 ) ) ( POINTING ?auto_159 ?auto_162 ) ( not ( = ?auto_160 ?auto_162 ) ) ( not ( = ?auto_156 ?auto_162 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_159 ?auto_160 ?auto_162 )
      ( GET_IMAGE ?auto_156 ?auto_157 )
      ( GET_IMAGE-VERIFY ?auto_156 ?auto_157 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_170 - DIRECTION
      ?auto_171 - MODE
    )
    :vars
    (
      ?auto_174 - INSTRUMENT
      ?auto_173 - SATELLITE
      ?auto_175 - DIRECTION
      ?auto_176 - INSTRUMENT
      ?auto_172 - DIRECTION
      ?auto_177 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_174 ?auto_173 ) ( SUPPORTS ?auto_174 ?auto_171 ) ( CALIBRATION_TARGET ?auto_174 ?auto_170 ) ( not ( = ?auto_170 ?auto_175 ) ) ( ON_BOARD ?auto_176 ?auto_173 ) ( POWER_ON ?auto_176 ) ( not ( = ?auto_174 ?auto_176 ) ) ( not ( = ?auto_175 ?auto_172 ) ) ( not ( = ?auto_170 ?auto_172 ) ) ( POINTING ?auto_173 ?auto_177 ) ( not ( = ?auto_172 ?auto_177 ) ) ( not ( = ?auto_170 ?auto_177 ) ) ( not ( = ?auto_175 ?auto_177 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_173 ?auto_172 ?auto_177 )
      ( GET_IMAGE ?auto_170 ?auto_171 )
      ( GET_IMAGE-VERIFY ?auto_170 ?auto_171 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_186 - DIRECTION
      ?auto_187 - MODE
    )
    :vars
    (
      ?auto_192 - INSTRUMENT
      ?auto_189 - SATELLITE
      ?auto_188 - DIRECTION
      ?auto_191 - INSTRUMENT
      ?auto_190 - DIRECTION
      ?auto_193 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_192 ?auto_189 ) ( SUPPORTS ?auto_192 ?auto_187 ) ( CALIBRATION_TARGET ?auto_192 ?auto_186 ) ( not ( = ?auto_186 ?auto_188 ) ) ( ON_BOARD ?auto_191 ?auto_189 ) ( POWER_ON ?auto_191 ) ( not ( = ?auto_192 ?auto_191 ) ) ( not ( = ?auto_188 ?auto_190 ) ) ( not ( = ?auto_186 ?auto_190 ) ) ( not ( = ?auto_190 ?auto_193 ) ) ( not ( = ?auto_186 ?auto_193 ) ) ( not ( = ?auto_188 ?auto_193 ) ) ( POINTING ?auto_189 ?auto_186 ) )
    :subtasks
    ( ( !TURN_TO ?auto_189 ?auto_193 ?auto_186 )
      ( GET_IMAGE ?auto_186 ?auto_187 )
      ( GET_IMAGE-VERIFY ?auto_186 ?auto_187 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_202 - DIRECTION
      ?auto_203 - MODE
    )
    :vars
    (
      ?auto_209 - INSTRUMENT
      ?auto_205 - SATELLITE
      ?auto_204 - DIRECTION
      ?auto_207 - INSTRUMENT
      ?auto_208 - DIRECTION
      ?auto_206 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_209 ?auto_205 ) ( SUPPORTS ?auto_209 ?auto_203 ) ( CALIBRATION_TARGET ?auto_209 ?auto_202 ) ( not ( = ?auto_202 ?auto_204 ) ) ( ON_BOARD ?auto_207 ?auto_205 ) ( not ( = ?auto_209 ?auto_207 ) ) ( not ( = ?auto_204 ?auto_208 ) ) ( not ( = ?auto_202 ?auto_208 ) ) ( not ( = ?auto_208 ?auto_206 ) ) ( not ( = ?auto_202 ?auto_206 ) ) ( not ( = ?auto_204 ?auto_206 ) ) ( POINTING ?auto_205 ?auto_202 ) ( POWER_AVAIL ?auto_205 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_207 ?auto_205 )
      ( GET_IMAGE ?auto_202 ?auto_203 )
      ( GET_IMAGE-VERIFY ?auto_202 ?auto_203 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_210 - DIRECTION
      ?auto_211 - MODE
    )
    :vars
    (
      ?auto_213 - INSTRUMENT
      ?auto_214 - SATELLITE
      ?auto_217 - DIRECTION
      ?auto_216 - INSTRUMENT
      ?auto_215 - DIRECTION
      ?auto_212 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_213 ?auto_214 ) ( SUPPORTS ?auto_213 ?auto_211 ) ( CALIBRATION_TARGET ?auto_213 ?auto_210 ) ( not ( = ?auto_210 ?auto_217 ) ) ( ON_BOARD ?auto_216 ?auto_214 ) ( not ( = ?auto_213 ?auto_216 ) ) ( not ( = ?auto_217 ?auto_215 ) ) ( not ( = ?auto_210 ?auto_215 ) ) ( not ( = ?auto_215 ?auto_212 ) ) ( not ( = ?auto_210 ?auto_212 ) ) ( not ( = ?auto_217 ?auto_212 ) ) ( POWER_AVAIL ?auto_214 ) ( POINTING ?auto_214 ?auto_217 ) )
    :subtasks
    ( ( !TURN_TO ?auto_214 ?auto_210 ?auto_217 )
      ( GET_IMAGE ?auto_210 ?auto_211 )
      ( GET_IMAGE-VERIFY ?auto_210 ?auto_211 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_220 - DIRECTION
      ?auto_221 - MODE
    )
    :vars
    (
      ?auto_222 - INSTRUMENT
      ?auto_223 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_222 ) ( ON_BOARD ?auto_222 ?auto_223 ) ( SUPPORTS ?auto_222 ?auto_221 ) ( POWER_ON ?auto_222 ) ( POINTING ?auto_223 ?auto_220 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_223 ?auto_220 ?auto_222 ?auto_221 )
      ( GET_IMAGE-VERIFY ?auto_220 ?auto_221 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_224 - DIRECTION
      ?auto_225 - MODE
    )
    :vars
    (
      ?auto_227 - INSTRUMENT
      ?auto_226 - SATELLITE
      ?auto_228 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_227 ) ( ON_BOARD ?auto_227 ?auto_226 ) ( SUPPORTS ?auto_227 ?auto_225 ) ( POWER_ON ?auto_227 ) ( POINTING ?auto_226 ?auto_228 ) ( not ( = ?auto_224 ?auto_228 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_226 ?auto_224 ?auto_228 )
      ( GET_IMAGE ?auto_224 ?auto_225 )
      ( GET_IMAGE-VERIFY ?auto_224 ?auto_225 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_234 - DIRECTION
      ?auto_235 - MODE
    )
    :vars
    (
      ?auto_236 - INSTRUMENT
      ?auto_238 - SATELLITE
      ?auto_237 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_236 ?auto_238 ) ( SUPPORTS ?auto_236 ?auto_235 ) ( POWER_ON ?auto_236 ) ( POINTING ?auto_238 ?auto_237 ) ( not ( = ?auto_234 ?auto_237 ) ) ( CALIBRATION_TARGET ?auto_236 ?auto_237 ) ( NOT_CALIBRATED ?auto_236 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_238 ?auto_236 ?auto_237 )
      ( GET_IMAGE ?auto_234 ?auto_235 )
      ( GET_IMAGE-VERIFY ?auto_234 ?auto_235 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_239 - DIRECTION
      ?auto_240 - MODE
    )
    :vars
    (
      ?auto_241 - INSTRUMENT
      ?auto_242 - SATELLITE
      ?auto_243 - DIRECTION
      ?auto_244 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_241 ?auto_242 ) ( SUPPORTS ?auto_241 ?auto_240 ) ( POWER_ON ?auto_241 ) ( not ( = ?auto_239 ?auto_243 ) ) ( CALIBRATION_TARGET ?auto_241 ?auto_243 ) ( NOT_CALIBRATED ?auto_241 ) ( POINTING ?auto_242 ?auto_244 ) ( not ( = ?auto_243 ?auto_244 ) ) ( not ( = ?auto_239 ?auto_244 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_242 ?auto_243 ?auto_244 )
      ( GET_IMAGE ?auto_239 ?auto_240 )
      ( GET_IMAGE-VERIFY ?auto_239 ?auto_240 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_245 - DIRECTION
      ?auto_246 - MODE
    )
    :vars
    (
      ?auto_250 - INSTRUMENT
      ?auto_249 - SATELLITE
      ?auto_247 - DIRECTION
      ?auto_248 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_250 ?auto_249 ) ( SUPPORTS ?auto_250 ?auto_246 ) ( not ( = ?auto_245 ?auto_247 ) ) ( CALIBRATION_TARGET ?auto_250 ?auto_247 ) ( POINTING ?auto_249 ?auto_248 ) ( not ( = ?auto_247 ?auto_248 ) ) ( not ( = ?auto_245 ?auto_248 ) ) ( POWER_AVAIL ?auto_249 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_250 ?auto_249 )
      ( GET_IMAGE ?auto_245 ?auto_246 )
      ( GET_IMAGE-VERIFY ?auto_245 ?auto_246 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_251 - DIRECTION
      ?auto_252 - MODE
    )
    :vars
    (
      ?auto_254 - INSTRUMENT
      ?auto_253 - SATELLITE
      ?auto_256 - DIRECTION
      ?auto_255 - DIRECTION
      ?auto_257 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_254 ?auto_253 ) ( SUPPORTS ?auto_254 ?auto_252 ) ( not ( = ?auto_251 ?auto_256 ) ) ( CALIBRATION_TARGET ?auto_254 ?auto_256 ) ( POINTING ?auto_253 ?auto_255 ) ( not ( = ?auto_256 ?auto_255 ) ) ( not ( = ?auto_251 ?auto_255 ) ) ( ON_BOARD ?auto_257 ?auto_253 ) ( POWER_ON ?auto_257 ) ( not ( = ?auto_254 ?auto_257 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_257 ?auto_253 )
      ( GET_IMAGE ?auto_251 ?auto_252 )
      ( GET_IMAGE-VERIFY ?auto_251 ?auto_252 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_265 - DIRECTION
      ?auto_266 - MODE
    )
    :vars
    (
      ?auto_268 - INSTRUMENT
      ?auto_271 - SATELLITE
      ?auto_269 - DIRECTION
      ?auto_267 - DIRECTION
      ?auto_270 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_268 ?auto_271 ) ( SUPPORTS ?auto_268 ?auto_266 ) ( not ( = ?auto_265 ?auto_269 ) ) ( CALIBRATION_TARGET ?auto_268 ?auto_269 ) ( not ( = ?auto_269 ?auto_267 ) ) ( not ( = ?auto_265 ?auto_267 ) ) ( ON_BOARD ?auto_270 ?auto_271 ) ( POWER_ON ?auto_270 ) ( not ( = ?auto_268 ?auto_270 ) ) ( POINTING ?auto_271 ?auto_265 ) )
    :subtasks
    ( ( !TURN_TO ?auto_271 ?auto_267 ?auto_265 )
      ( GET_IMAGE ?auto_265 ?auto_266 )
      ( GET_IMAGE-VERIFY ?auto_265 ?auto_266 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_279 - DIRECTION
      ?auto_280 - MODE
    )
    :vars
    (
      ?auto_284 - INSTRUMENT
      ?auto_285 - SATELLITE
      ?auto_283 - DIRECTION
      ?auto_282 - DIRECTION
      ?auto_281 - INSTRUMENT
      ?auto_286 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_284 ?auto_285 ) ( SUPPORTS ?auto_284 ?auto_280 ) ( not ( = ?auto_279 ?auto_283 ) ) ( CALIBRATION_TARGET ?auto_284 ?auto_283 ) ( not ( = ?auto_283 ?auto_282 ) ) ( not ( = ?auto_279 ?auto_282 ) ) ( ON_BOARD ?auto_281 ?auto_285 ) ( POWER_ON ?auto_281 ) ( not ( = ?auto_284 ?auto_281 ) ) ( POINTING ?auto_285 ?auto_286 ) ( not ( = ?auto_279 ?auto_286 ) ) ( not ( = ?auto_283 ?auto_286 ) ) ( not ( = ?auto_282 ?auto_286 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_285 ?auto_279 ?auto_286 )
      ( GET_IMAGE ?auto_279 ?auto_280 )
      ( GET_IMAGE-VERIFY ?auto_279 ?auto_280 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_295 - DIRECTION
      ?auto_296 - MODE
    )
    :vars
    (
      ?auto_298 - INSTRUMENT
      ?auto_299 - SATELLITE
      ?auto_300 - DIRECTION
      ?auto_301 - DIRECTION
      ?auto_297 - INSTRUMENT
      ?auto_302 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_298 ?auto_299 ) ( SUPPORTS ?auto_298 ?auto_296 ) ( not ( = ?auto_295 ?auto_300 ) ) ( CALIBRATION_TARGET ?auto_298 ?auto_300 ) ( not ( = ?auto_300 ?auto_301 ) ) ( not ( = ?auto_295 ?auto_301 ) ) ( ON_BOARD ?auto_297 ?auto_299 ) ( POWER_ON ?auto_297 ) ( not ( = ?auto_298 ?auto_297 ) ) ( not ( = ?auto_295 ?auto_302 ) ) ( not ( = ?auto_300 ?auto_302 ) ) ( not ( = ?auto_301 ?auto_302 ) ) ( POINTING ?auto_299 ?auto_300 ) )
    :subtasks
    ( ( !TURN_TO ?auto_299 ?auto_302 ?auto_300 )
      ( GET_IMAGE ?auto_295 ?auto_296 )
      ( GET_IMAGE-VERIFY ?auto_295 ?auto_296 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_311 - DIRECTION
      ?auto_312 - MODE
    )
    :vars
    (
      ?auto_315 - INSTRUMENT
      ?auto_313 - SATELLITE
      ?auto_314 - DIRECTION
      ?auto_316 - DIRECTION
      ?auto_318 - INSTRUMENT
      ?auto_317 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_315 ?auto_313 ) ( SUPPORTS ?auto_315 ?auto_312 ) ( not ( = ?auto_311 ?auto_314 ) ) ( CALIBRATION_TARGET ?auto_315 ?auto_314 ) ( not ( = ?auto_314 ?auto_316 ) ) ( not ( = ?auto_311 ?auto_316 ) ) ( ON_BOARD ?auto_318 ?auto_313 ) ( not ( = ?auto_315 ?auto_318 ) ) ( not ( = ?auto_311 ?auto_317 ) ) ( not ( = ?auto_314 ?auto_317 ) ) ( not ( = ?auto_316 ?auto_317 ) ) ( POINTING ?auto_313 ?auto_314 ) ( POWER_AVAIL ?auto_313 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_318 ?auto_313 )
      ( GET_IMAGE ?auto_311 ?auto_312 )
      ( GET_IMAGE-VERIFY ?auto_311 ?auto_312 ) )
  )

  ( :method GET_IMAGE
    :parameters
    (
      ?auto_319 - DIRECTION
      ?auto_320 - MODE
    )
    :vars
    (
      ?auto_323 - INSTRUMENT
      ?auto_326 - SATELLITE
      ?auto_324 - DIRECTION
      ?auto_325 - DIRECTION
      ?auto_321 - INSTRUMENT
      ?auto_322 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_323 ?auto_326 ) ( SUPPORTS ?auto_323 ?auto_320 ) ( not ( = ?auto_319 ?auto_324 ) ) ( CALIBRATION_TARGET ?auto_323 ?auto_324 ) ( not ( = ?auto_324 ?auto_325 ) ) ( not ( = ?auto_319 ?auto_325 ) ) ( ON_BOARD ?auto_321 ?auto_326 ) ( not ( = ?auto_323 ?auto_321 ) ) ( not ( = ?auto_319 ?auto_322 ) ) ( not ( = ?auto_324 ?auto_322 ) ) ( not ( = ?auto_325 ?auto_322 ) ) ( POWER_AVAIL ?auto_326 ) ( POINTING ?auto_326 ?auto_325 ) )
    :subtasks
    ( ( !TURN_TO ?auto_326 ?auto_324 ?auto_325 )
      ( GET_IMAGE ?auto_319 ?auto_320 )
      ( GET_IMAGE-VERIFY ?auto_319 ?auto_320 ) )
  )

)

