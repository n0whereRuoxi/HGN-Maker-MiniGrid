( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?A - OBJ ?B - LOCATION )
    ( TRUCK-AT ?C - TRUCK ?D - LOCATION )
    ( AIRPLANE-AT ?E - AIRPLANE ?F - LOCATION )
    ( IN-TRUCK ?G - OBJ ?H - TRUCK )
    ( IN-AIRPLANE ?I - OBJ ?J - AIRPLANE )
    ( IN-CITY ?K - LOCATION ?L - CITY )
    ( DIFFERENT ?M - LOCATION ?N - LOCATION )
    ( AIRPORT ?O - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?OBJ - OBJ
      ?TRUCK - TRUCK
      ?LOC - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?TRUCK ?LOC ) ( OBJ-AT ?OBJ ?LOC ) )
    :effect
    ( and ( not ( OBJ-AT ?OBJ ?LOC ) ) ( IN-TRUCK ?OBJ ?TRUCK ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?OBJ - OBJ
      ?AIRPLANE - AIRPLANE
      ?LOC - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?OBJ ?LOC ) ( AIRPLANE-AT ?AIRPLANE ?LOC ) )
    :effect
    ( and ( not ( OBJ-AT ?OBJ ?LOC ) ) ( IN-AIRPLANE ?OBJ ?AIRPLANE ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?OBJ - OBJ
      ?TRUCK - TRUCK
      ?LOC - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?TRUCK ?LOC ) ( IN-TRUCK ?OBJ ?TRUCK ) )
    :effect
    ( and ( not ( IN-TRUCK ?OBJ ?TRUCK ) ) ( OBJ-AT ?OBJ ?LOC ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?OBJ - OBJ
      ?AIRPLANE - AIRPLANE
      ?LOC - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?OBJ ?AIRPLANE ) ( AIRPLANE-AT ?AIRPLANE ?LOC ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?OBJ ?AIRPLANE ) ) ( OBJ-AT ?OBJ ?LOC ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?TRUCK - TRUCK
      ?LOC-FROM - LOCATION
      ?LOC-TO - LOCATION
      ?CITY - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?TRUCK ?LOC-FROM ) ( IN-CITY ?LOC-FROM ?CITY ) ( IN-CITY ?LOC-TO ?CITY ) ( not ( = ?LOC-FROM ?LOC-TO ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?TRUCK ?LOC-FROM ) ) ( TRUCK-AT ?TRUCK ?LOC-TO ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?AIRPLANE - AIRPLANE
      ?LOC-FROM - LOCATION
      ?LOC-TO - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?LOC-FROM ) ( AIRPORT ?LOC-TO ) ( AIRPLANE-AT ?AIRPLANE ?LOC-FROM ) ( not ( = ?LOC-FROM ?LOC-TO ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?AIRPLANE ?LOC-FROM ) ) ( AIRPLANE-AT ?AIRPLANE ?LOC-TO ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?OBJ - OBJ
      ?DST - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?OBJ ?DST ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-PKG-VERIFY
    :parameters
    (
      ?OBJ - OBJ
      ?DST - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?OBJ ?DST ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2 - OBJ
      ?AUTO_3 - LOCATION
    )
    :vars
    (
      ?AUTO_4 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4 ?AUTO_3 ) ( IN-TRUCK ?AUTO_2 ?AUTO_4 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2 ?AUTO_4 ?AUTO_3 )
      ( DELIVER-PKG-VERIFY ?AUTO_2 ?AUTO_3 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5 - OBJ
      ?AUTO_6 - LOCATION
    )
    :vars
    (
      ?AUTO_7 - TRUCK
      ?AUTO_8 - LOCATION
      ?AUTO_9 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5 ?AUTO_7 ) ( TRUCK-AT ?AUTO_7 ?AUTO_8 ) ( IN-CITY ?AUTO_8 ?AUTO_9 ) ( IN-CITY ?AUTO_6 ?AUTO_9 ) ( not ( = ?AUTO_6 ?AUTO_8 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7 ?AUTO_8 ?AUTO_6 ?AUTO_9 )
      ( DELIVER-PKG ?AUTO_5 ?AUTO_6 )
      ( DELIVER-PKG-VERIFY ?AUTO_5 ?AUTO_6 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10 - OBJ
      ?AUTO_11 - LOCATION
    )
    :vars
    (
      ?AUTO_14 - TRUCK
      ?AUTO_13 - LOCATION
      ?AUTO_12 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_14 ?AUTO_13 ) ( IN-CITY ?AUTO_13 ?AUTO_12 ) ( IN-CITY ?AUTO_11 ?AUTO_12 ) ( not ( = ?AUTO_11 ?AUTO_13 ) ) ( OBJ-AT ?AUTO_10 ?AUTO_13 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10 ?AUTO_14 ?AUTO_13 )
      ( DELIVER-PKG ?AUTO_10 ?AUTO_11 )
      ( DELIVER-PKG-VERIFY ?AUTO_10 ?AUTO_11 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_15 - OBJ
      ?AUTO_16 - LOCATION
    )
    :vars
    (
      ?AUTO_17 - LOCATION
      ?AUTO_19 - CITY
      ?AUTO_18 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_17 ?AUTO_19 ) ( IN-CITY ?AUTO_16 ?AUTO_19 ) ( not ( = ?AUTO_16 ?AUTO_17 ) ) ( OBJ-AT ?AUTO_15 ?AUTO_17 ) ( TRUCK-AT ?AUTO_18 ?AUTO_16 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_18 ?AUTO_16 ?AUTO_17 ?AUTO_19 )
      ( DELIVER-PKG ?AUTO_15 ?AUTO_16 )
      ( DELIVER-PKG-VERIFY ?AUTO_15 ?AUTO_16 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_24 - OBJ
      ?AUTO_25 - LOCATION
    )
    :vars
    (
      ?AUTO_26 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_26 ?AUTO_25 ) ( IN-TRUCK ?AUTO_24 ?AUTO_26 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_24 ?AUTO_26 ?AUTO_25 )
      ( DELIVER-PKG-VERIFY ?AUTO_24 ?AUTO_25 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_27 - OBJ
      ?AUTO_28 - LOCATION
    )
    :vars
    (
      ?AUTO_29 - TRUCK
      ?AUTO_30 - LOCATION
      ?AUTO_31 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_27 ?AUTO_29 ) ( TRUCK-AT ?AUTO_29 ?AUTO_30 ) ( IN-CITY ?AUTO_30 ?AUTO_31 ) ( IN-CITY ?AUTO_28 ?AUTO_31 ) ( not ( = ?AUTO_28 ?AUTO_30 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_29 ?AUTO_30 ?AUTO_28 ?AUTO_31 )
      ( DELIVER-PKG ?AUTO_27 ?AUTO_28 )
      ( DELIVER-PKG-VERIFY ?AUTO_27 ?AUTO_28 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_32 - OBJ
      ?AUTO_33 - LOCATION
    )
    :vars
    (
      ?AUTO_34 - TRUCK
      ?AUTO_35 - LOCATION
      ?AUTO_36 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_34 ?AUTO_35 ) ( IN-CITY ?AUTO_35 ?AUTO_36 ) ( IN-CITY ?AUTO_33 ?AUTO_36 ) ( not ( = ?AUTO_33 ?AUTO_35 ) ) ( OBJ-AT ?AUTO_32 ?AUTO_35 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_32 ?AUTO_34 ?AUTO_35 )
      ( DELIVER-PKG ?AUTO_32 ?AUTO_33 )
      ( DELIVER-PKG-VERIFY ?AUTO_32 ?AUTO_33 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_37 - OBJ
      ?AUTO_38 - LOCATION
    )
    :vars
    (
      ?AUTO_39 - LOCATION
      ?AUTO_41 - CITY
      ?AUTO_40 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_39 ?AUTO_41 ) ( IN-CITY ?AUTO_38 ?AUTO_41 ) ( not ( = ?AUTO_38 ?AUTO_39 ) ) ( OBJ-AT ?AUTO_37 ?AUTO_39 ) ( TRUCK-AT ?AUTO_40 ?AUTO_38 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_40 ?AUTO_38 ?AUTO_39 ?AUTO_41 )
      ( DELIVER-PKG ?AUTO_37 ?AUTO_38 )
      ( DELIVER-PKG-VERIFY ?AUTO_37 ?AUTO_38 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_58 - OBJ
      ?AUTO_59 - LOCATION
    )
    :vars
    (
      ?AUTO_60 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_58 ?AUTO_60 ) ( AIRPLANE-AT ?AUTO_60 ?AUTO_59 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_58 ?AUTO_60 ?AUTO_59 )
      ( DELIVER-PKG-VERIFY ?AUTO_58 ?AUTO_59 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_61 - OBJ
      ?AUTO_62 - LOCATION
    )
    :vars
    (
      ?AUTO_63 - AIRPLANE
      ?AUTO_64 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_61 ?AUTO_63 ) ( AIRPORT ?AUTO_64 ) ( AIRPORT ?AUTO_62 ) ( AIRPLANE-AT ?AUTO_63 ?AUTO_64 ) ( not ( = ?AUTO_64 ?AUTO_62 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_63 ?AUTO_64 ?AUTO_62 )
      ( DELIVER-PKG ?AUTO_61 ?AUTO_62 )
      ( DELIVER-PKG-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_77 - OBJ
      ?AUTO_78 - LOCATION
    )
    :vars
    (
      ?AUTO_79 - LOCATION
      ?AUTO_80 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_79 ) ( AIRPORT ?AUTO_78 ) ( AIRPLANE-AT ?AUTO_80 ?AUTO_79 ) ( not ( = ?AUTO_79 ?AUTO_78 ) ) ( OBJ-AT ?AUTO_77 ?AUTO_79 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_77 ?AUTO_80 ?AUTO_79 )
      ( DELIVER-PKG ?AUTO_77 ?AUTO_78 )
      ( DELIVER-PKG-VERIFY ?AUTO_77 ?AUTO_78 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_81 - OBJ
      ?AUTO_82 - LOCATION
    )
    :vars
    (
      ?AUTO_83 - LOCATION
      ?AUTO_84 - AIRPLANE
      ?AUTO_85 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_83 ) ( AIRPORT ?AUTO_82 ) ( AIRPLANE-AT ?AUTO_84 ?AUTO_83 ) ( not ( = ?AUTO_83 ?AUTO_82 ) ) ( TRUCK-AT ?AUTO_85 ?AUTO_83 ) ( IN-TRUCK ?AUTO_81 ?AUTO_85 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_81 ?AUTO_85 ?AUTO_83 )
      ( DELIVER-PKG ?AUTO_81 ?AUTO_82 )
      ( DELIVER-PKG-VERIFY ?AUTO_81 ?AUTO_82 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_86 - OBJ
      ?AUTO_87 - LOCATION
    )
    :vars
    (
      ?AUTO_88 - LOCATION
      ?AUTO_89 - AIRPLANE
      ?AUTO_90 - TRUCK
      ?AUTO_91 - LOCATION
      ?AUTO_92 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_88 ) ( AIRPORT ?AUTO_87 ) ( AIRPLANE-AT ?AUTO_89 ?AUTO_88 ) ( not ( = ?AUTO_88 ?AUTO_87 ) ) ( IN-TRUCK ?AUTO_86 ?AUTO_90 ) ( TRUCK-AT ?AUTO_90 ?AUTO_91 ) ( IN-CITY ?AUTO_91 ?AUTO_92 ) ( IN-CITY ?AUTO_88 ?AUTO_92 ) ( not ( = ?AUTO_88 ?AUTO_91 ) ) ( not ( = ?AUTO_87 ?AUTO_91 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_90 ?AUTO_91 ?AUTO_88 ?AUTO_92 )
      ( DELIVER-PKG ?AUTO_86 ?AUTO_87 )
      ( DELIVER-PKG-VERIFY ?AUTO_86 ?AUTO_87 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_93 - OBJ
      ?AUTO_94 - LOCATION
    )
    :vars
    (
      ?AUTO_96 - LOCATION
      ?AUTO_95 - AIRPLANE
      ?AUTO_97 - TRUCK
      ?AUTO_99 - LOCATION
      ?AUTO_98 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_96 ) ( AIRPORT ?AUTO_94 ) ( AIRPLANE-AT ?AUTO_95 ?AUTO_96 ) ( not ( = ?AUTO_96 ?AUTO_94 ) ) ( TRUCK-AT ?AUTO_97 ?AUTO_99 ) ( IN-CITY ?AUTO_99 ?AUTO_98 ) ( IN-CITY ?AUTO_96 ?AUTO_98 ) ( not ( = ?AUTO_96 ?AUTO_99 ) ) ( not ( = ?AUTO_94 ?AUTO_99 ) ) ( OBJ-AT ?AUTO_93 ?AUTO_99 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_93 ?AUTO_97 ?AUTO_99 )
      ( DELIVER-PKG ?AUTO_93 ?AUTO_94 )
      ( DELIVER-PKG-VERIFY ?AUTO_93 ?AUTO_94 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_100 - OBJ
      ?AUTO_101 - LOCATION
    )
    :vars
    (
      ?AUTO_102 - LOCATION
      ?AUTO_106 - AIRPLANE
      ?AUTO_103 - LOCATION
      ?AUTO_105 - CITY
      ?AUTO_104 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_102 ) ( AIRPORT ?AUTO_101 ) ( AIRPLANE-AT ?AUTO_106 ?AUTO_102 ) ( not ( = ?AUTO_102 ?AUTO_101 ) ) ( IN-CITY ?AUTO_103 ?AUTO_105 ) ( IN-CITY ?AUTO_102 ?AUTO_105 ) ( not ( = ?AUTO_102 ?AUTO_103 ) ) ( not ( = ?AUTO_101 ?AUTO_103 ) ) ( OBJ-AT ?AUTO_100 ?AUTO_103 ) ( TRUCK-AT ?AUTO_104 ?AUTO_102 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_104 ?AUTO_102 ?AUTO_103 ?AUTO_105 )
      ( DELIVER-PKG ?AUTO_100 ?AUTO_101 )
      ( DELIVER-PKG-VERIFY ?AUTO_100 ?AUTO_101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_111 - OBJ
      ?AUTO_112 - LOCATION
    )
    :vars
    (
      ?AUTO_113 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_111 ?AUTO_113 ) ( AIRPLANE-AT ?AUTO_113 ?AUTO_112 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_111 ?AUTO_113 ?AUTO_112 )
      ( DELIVER-PKG-VERIFY ?AUTO_111 ?AUTO_112 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_118 - OBJ
      ?AUTO_119 - LOCATION
    )
    :vars
    (
      ?AUTO_121 - LOCATION
      ?AUTO_120 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_121 ) ( AIRPORT ?AUTO_119 ) ( AIRPLANE-AT ?AUTO_120 ?AUTO_121 ) ( not ( = ?AUTO_121 ?AUTO_119 ) ) ( OBJ-AT ?AUTO_118 ?AUTO_121 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_118 ?AUTO_120 ?AUTO_121 )
      ( DELIVER-PKG ?AUTO_118 ?AUTO_119 )
      ( DELIVER-PKG-VERIFY ?AUTO_118 ?AUTO_119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_122 - OBJ
      ?AUTO_123 - LOCATION
    )
    :vars
    (
      ?AUTO_124 - LOCATION
      ?AUTO_125 - AIRPLANE
      ?AUTO_126 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_124 ) ( AIRPORT ?AUTO_123 ) ( AIRPLANE-AT ?AUTO_125 ?AUTO_124 ) ( not ( = ?AUTO_124 ?AUTO_123 ) ) ( TRUCK-AT ?AUTO_126 ?AUTO_124 ) ( IN-TRUCK ?AUTO_122 ?AUTO_126 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_122 ?AUTO_126 ?AUTO_124 )
      ( DELIVER-PKG ?AUTO_122 ?AUTO_123 )
      ( DELIVER-PKG-VERIFY ?AUTO_122 ?AUTO_123 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_127 - OBJ
      ?AUTO_128 - LOCATION
    )
    :vars
    (
      ?AUTO_130 - LOCATION
      ?AUTO_129 - AIRPLANE
      ?AUTO_131 - TRUCK
      ?AUTO_132 - LOCATION
      ?AUTO_133 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_130 ) ( AIRPORT ?AUTO_128 ) ( AIRPLANE-AT ?AUTO_129 ?AUTO_130 ) ( not ( = ?AUTO_130 ?AUTO_128 ) ) ( IN-TRUCK ?AUTO_127 ?AUTO_131 ) ( TRUCK-AT ?AUTO_131 ?AUTO_132 ) ( IN-CITY ?AUTO_132 ?AUTO_133 ) ( IN-CITY ?AUTO_130 ?AUTO_133 ) ( not ( = ?AUTO_130 ?AUTO_132 ) ) ( not ( = ?AUTO_128 ?AUTO_132 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_131 ?AUTO_132 ?AUTO_130 ?AUTO_133 )
      ( DELIVER-PKG ?AUTO_127 ?AUTO_128 )
      ( DELIVER-PKG-VERIFY ?AUTO_127 ?AUTO_128 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_134 - OBJ
      ?AUTO_135 - LOCATION
    )
    :vars
    (
      ?AUTO_136 - LOCATION
      ?AUTO_137 - AIRPLANE
      ?AUTO_138 - TRUCK
      ?AUTO_140 - LOCATION
      ?AUTO_139 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_136 ) ( AIRPORT ?AUTO_135 ) ( AIRPLANE-AT ?AUTO_137 ?AUTO_136 ) ( not ( = ?AUTO_136 ?AUTO_135 ) ) ( TRUCK-AT ?AUTO_138 ?AUTO_140 ) ( IN-CITY ?AUTO_140 ?AUTO_139 ) ( IN-CITY ?AUTO_136 ?AUTO_139 ) ( not ( = ?AUTO_136 ?AUTO_140 ) ) ( not ( = ?AUTO_135 ?AUTO_140 ) ) ( OBJ-AT ?AUTO_134 ?AUTO_140 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_134 ?AUTO_138 ?AUTO_140 )
      ( DELIVER-PKG ?AUTO_134 ?AUTO_135 )
      ( DELIVER-PKG-VERIFY ?AUTO_134 ?AUTO_135 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_141 - OBJ
      ?AUTO_142 - LOCATION
    )
    :vars
    (
      ?AUTO_143 - LOCATION
      ?AUTO_146 - AIRPLANE
      ?AUTO_144 - LOCATION
      ?AUTO_147 - CITY
      ?AUTO_145 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_143 ) ( AIRPORT ?AUTO_142 ) ( AIRPLANE-AT ?AUTO_146 ?AUTO_143 ) ( not ( = ?AUTO_143 ?AUTO_142 ) ) ( IN-CITY ?AUTO_144 ?AUTO_147 ) ( IN-CITY ?AUTO_143 ?AUTO_147 ) ( not ( = ?AUTO_143 ?AUTO_144 ) ) ( not ( = ?AUTO_142 ?AUTO_144 ) ) ( OBJ-AT ?AUTO_141 ?AUTO_144 ) ( TRUCK-AT ?AUTO_145 ?AUTO_143 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_145 ?AUTO_143 ?AUTO_144 ?AUTO_147 )
      ( DELIVER-PKG ?AUTO_141 ?AUTO_142 )
      ( DELIVER-PKG-VERIFY ?AUTO_141 ?AUTO_142 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_148 - OBJ
      ?AUTO_149 - LOCATION
    )
    :vars
    (
      ?AUTO_150 - LOCATION
      ?AUTO_154 - LOCATION
      ?AUTO_153 - CITY
      ?AUTO_151 - TRUCK
      ?AUTO_155 - LOCATION
      ?AUTO_152 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_150 ) ( AIRPORT ?AUTO_149 ) ( not ( = ?AUTO_150 ?AUTO_149 ) ) ( IN-CITY ?AUTO_154 ?AUTO_153 ) ( IN-CITY ?AUTO_150 ?AUTO_153 ) ( not ( = ?AUTO_150 ?AUTO_154 ) ) ( not ( = ?AUTO_149 ?AUTO_154 ) ) ( OBJ-AT ?AUTO_148 ?AUTO_154 ) ( TRUCK-AT ?AUTO_151 ?AUTO_150 ) ( AIRPORT ?AUTO_155 ) ( AIRPLANE-AT ?AUTO_152 ?AUTO_155 ) ( not ( = ?AUTO_155 ?AUTO_150 ) ) ( not ( = ?AUTO_149 ?AUTO_155 ) ) ( not ( = ?AUTO_154 ?AUTO_155 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_152 ?AUTO_155 ?AUTO_150 )
      ( DELIVER-PKG ?AUTO_148 ?AUTO_149 )
      ( DELIVER-PKG-VERIFY ?AUTO_148 ?AUTO_149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_170 - OBJ
      ?AUTO_171 - LOCATION
    )
    :vars
    (
      ?AUTO_172 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_172 ?AUTO_171 ) ( IN-TRUCK ?AUTO_170 ?AUTO_172 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_170 ?AUTO_172 ?AUTO_171 )
      ( DELIVER-PKG-VERIFY ?AUTO_170 ?AUTO_171 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_173 - OBJ
      ?AUTO_174 - LOCATION
    )
    :vars
    (
      ?AUTO_175 - TRUCK
      ?AUTO_176 - LOCATION
      ?AUTO_177 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_173 ?AUTO_175 ) ( TRUCK-AT ?AUTO_175 ?AUTO_176 ) ( IN-CITY ?AUTO_176 ?AUTO_177 ) ( IN-CITY ?AUTO_174 ?AUTO_177 ) ( not ( = ?AUTO_174 ?AUTO_176 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_175 ?AUTO_176 ?AUTO_174 ?AUTO_177 )
      ( DELIVER-PKG ?AUTO_173 ?AUTO_174 )
      ( DELIVER-PKG-VERIFY ?AUTO_173 ?AUTO_174 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_210 - OBJ
      ?AUTO_211 - LOCATION
    )
    :vars
    (
      ?AUTO_212 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_212 ?AUTO_211 ) ( IN-TRUCK ?AUTO_210 ?AUTO_212 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_210 ?AUTO_212 ?AUTO_211 )
      ( DELIVER-PKG-VERIFY ?AUTO_210 ?AUTO_211 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_217 - OBJ
      ?AUTO_218 - LOCATION
    )
    :vars
    (
      ?AUTO_219 - TRUCK
      ?AUTO_220 - LOCATION
      ?AUTO_221 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_217 ?AUTO_219 ) ( TRUCK-AT ?AUTO_219 ?AUTO_220 ) ( IN-CITY ?AUTO_220 ?AUTO_221 ) ( IN-CITY ?AUTO_218 ?AUTO_221 ) ( not ( = ?AUTO_218 ?AUTO_220 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_219 ?AUTO_220 ?AUTO_218 ?AUTO_221 )
      ( DELIVER-PKG ?AUTO_217 ?AUTO_218 )
      ( DELIVER-PKG-VERIFY ?AUTO_217 ?AUTO_218 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_222 - OBJ
      ?AUTO_223 - LOCATION
    )
    :vars
    (
      ?AUTO_224 - TRUCK
      ?AUTO_225 - LOCATION
      ?AUTO_226 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_224 ?AUTO_225 ) ( IN-CITY ?AUTO_225 ?AUTO_226 ) ( IN-CITY ?AUTO_223 ?AUTO_226 ) ( not ( = ?AUTO_223 ?AUTO_225 ) ) ( OBJ-AT ?AUTO_222 ?AUTO_225 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_222 ?AUTO_224 ?AUTO_225 )
      ( DELIVER-PKG ?AUTO_222 ?AUTO_223 )
      ( DELIVER-PKG-VERIFY ?AUTO_222 ?AUTO_223 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_229 - OBJ
      ?AUTO_230 - LOCATION
    )
    :vars
    (
      ?AUTO_231 - LOCATION
      ?AUTO_232 - CITY
      ?AUTO_233 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_231 ?AUTO_232 ) ( IN-CITY ?AUTO_230 ?AUTO_232 ) ( not ( = ?AUTO_230 ?AUTO_231 ) ) ( OBJ-AT ?AUTO_229 ?AUTO_231 ) ( TRUCK-AT ?AUTO_233 ?AUTO_230 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_233 ?AUTO_230 ?AUTO_231 ?AUTO_232 )
      ( DELIVER-PKG ?AUTO_229 ?AUTO_230 )
      ( DELIVER-PKG-VERIFY ?AUTO_229 ?AUTO_230 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_236 - OBJ
      ?AUTO_237 - LOCATION
    )
    :vars
    (
      ?AUTO_238 - LOCATION
      ?AUTO_240 - CITY
      ?AUTO_239 - TRUCK
      ?AUTO_241 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_238 ?AUTO_240 ) ( IN-CITY ?AUTO_237 ?AUTO_240 ) ( not ( = ?AUTO_237 ?AUTO_238 ) ) ( TRUCK-AT ?AUTO_239 ?AUTO_237 ) ( IN-AIRPLANE ?AUTO_236 ?AUTO_241 ) ( AIRPLANE-AT ?AUTO_241 ?AUTO_238 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_236 ?AUTO_241 ?AUTO_238 )
      ( DELIVER-PKG ?AUTO_236 ?AUTO_237 )
      ( DELIVER-PKG-VERIFY ?AUTO_236 ?AUTO_237 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_242 - OBJ
      ?AUTO_243 - LOCATION
    )
    :vars
    (
      ?AUTO_245 - LOCATION
      ?AUTO_246 - CITY
      ?AUTO_244 - TRUCK
      ?AUTO_247 - AIRPLANE
      ?AUTO_248 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_245 ?AUTO_246 ) ( IN-CITY ?AUTO_243 ?AUTO_246 ) ( not ( = ?AUTO_243 ?AUTO_245 ) ) ( TRUCK-AT ?AUTO_244 ?AUTO_243 ) ( IN-AIRPLANE ?AUTO_242 ?AUTO_247 ) ( AIRPORT ?AUTO_248 ) ( AIRPORT ?AUTO_245 ) ( AIRPLANE-AT ?AUTO_247 ?AUTO_248 ) ( not ( = ?AUTO_248 ?AUTO_245 ) ) ( not ( = ?AUTO_243 ?AUTO_248 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_247 ?AUTO_248 ?AUTO_245 )
      ( DELIVER-PKG ?AUTO_242 ?AUTO_243 )
      ( DELIVER-PKG-VERIFY ?AUTO_242 ?AUTO_243 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_261 - OBJ
      ?AUTO_262 - LOCATION
    )
    :vars
    (
      ?AUTO_265 - LOCATION
      ?AUTO_267 - CITY
      ?AUTO_264 - TRUCK
      ?AUTO_263 - LOCATION
      ?AUTO_266 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_265 ?AUTO_267 ) ( IN-CITY ?AUTO_262 ?AUTO_267 ) ( not ( = ?AUTO_262 ?AUTO_265 ) ) ( TRUCK-AT ?AUTO_264 ?AUTO_262 ) ( AIRPORT ?AUTO_263 ) ( AIRPORT ?AUTO_265 ) ( AIRPLANE-AT ?AUTO_266 ?AUTO_263 ) ( not ( = ?AUTO_263 ?AUTO_265 ) ) ( not ( = ?AUTO_262 ?AUTO_263 ) ) ( OBJ-AT ?AUTO_261 ?AUTO_263 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_261 ?AUTO_266 ?AUTO_263 )
      ( DELIVER-PKG ?AUTO_261 ?AUTO_262 )
      ( DELIVER-PKG-VERIFY ?AUTO_261 ?AUTO_262 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_268 - OBJ
      ?AUTO_269 - LOCATION
    )
    :vars
    (
      ?AUTO_274 - LOCATION
      ?AUTO_272 - CITY
      ?AUTO_270 - TRUCK
      ?AUTO_271 - LOCATION
      ?AUTO_273 - AIRPLANE
      ?AUTO_275 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_274 ?AUTO_272 ) ( IN-CITY ?AUTO_269 ?AUTO_272 ) ( not ( = ?AUTO_269 ?AUTO_274 ) ) ( TRUCK-AT ?AUTO_270 ?AUTO_269 ) ( AIRPORT ?AUTO_271 ) ( AIRPORT ?AUTO_274 ) ( AIRPLANE-AT ?AUTO_273 ?AUTO_271 ) ( not ( = ?AUTO_271 ?AUTO_274 ) ) ( not ( = ?AUTO_269 ?AUTO_271 ) ) ( TRUCK-AT ?AUTO_275 ?AUTO_271 ) ( IN-TRUCK ?AUTO_268 ?AUTO_275 ) ( not ( = ?AUTO_270 ?AUTO_275 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_268 ?AUTO_275 ?AUTO_271 )
      ( DELIVER-PKG ?AUTO_268 ?AUTO_269 )
      ( DELIVER-PKG-VERIFY ?AUTO_268 ?AUTO_269 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_276 - OBJ
      ?AUTO_277 - LOCATION
    )
    :vars
    (
      ?AUTO_278 - LOCATION
      ?AUTO_281 - CITY
      ?AUTO_282 - TRUCK
      ?AUTO_279 - LOCATION
      ?AUTO_280 - AIRPLANE
      ?AUTO_283 - TRUCK
      ?AUTO_284 - LOCATION
      ?AUTO_285 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_278 ?AUTO_281 ) ( IN-CITY ?AUTO_277 ?AUTO_281 ) ( not ( = ?AUTO_277 ?AUTO_278 ) ) ( TRUCK-AT ?AUTO_282 ?AUTO_277 ) ( AIRPORT ?AUTO_279 ) ( AIRPORT ?AUTO_278 ) ( AIRPLANE-AT ?AUTO_280 ?AUTO_279 ) ( not ( = ?AUTO_279 ?AUTO_278 ) ) ( not ( = ?AUTO_277 ?AUTO_279 ) ) ( IN-TRUCK ?AUTO_276 ?AUTO_283 ) ( not ( = ?AUTO_282 ?AUTO_283 ) ) ( TRUCK-AT ?AUTO_283 ?AUTO_284 ) ( IN-CITY ?AUTO_284 ?AUTO_285 ) ( IN-CITY ?AUTO_279 ?AUTO_285 ) ( not ( = ?AUTO_279 ?AUTO_284 ) ) ( not ( = ?AUTO_277 ?AUTO_284 ) ) ( not ( = ?AUTO_278 ?AUTO_284 ) ) ( not ( = ?AUTO_281 ?AUTO_285 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_283 ?AUTO_284 ?AUTO_279 ?AUTO_285 )
      ( DELIVER-PKG ?AUTO_276 ?AUTO_277 )
      ( DELIVER-PKG-VERIFY ?AUTO_276 ?AUTO_277 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_286 - OBJ
      ?AUTO_287 - LOCATION
    )
    :vars
    (
      ?AUTO_288 - LOCATION
      ?AUTO_290 - CITY
      ?AUTO_291 - TRUCK
      ?AUTO_295 - LOCATION
      ?AUTO_293 - AIRPLANE
      ?AUTO_294 - TRUCK
      ?AUTO_289 - LOCATION
      ?AUTO_292 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_288 ?AUTO_290 ) ( IN-CITY ?AUTO_287 ?AUTO_290 ) ( not ( = ?AUTO_287 ?AUTO_288 ) ) ( TRUCK-AT ?AUTO_291 ?AUTO_287 ) ( AIRPORT ?AUTO_295 ) ( AIRPORT ?AUTO_288 ) ( AIRPLANE-AT ?AUTO_293 ?AUTO_295 ) ( not ( = ?AUTO_295 ?AUTO_288 ) ) ( not ( = ?AUTO_287 ?AUTO_295 ) ) ( not ( = ?AUTO_291 ?AUTO_294 ) ) ( TRUCK-AT ?AUTO_294 ?AUTO_289 ) ( IN-CITY ?AUTO_289 ?AUTO_292 ) ( IN-CITY ?AUTO_295 ?AUTO_292 ) ( not ( = ?AUTO_295 ?AUTO_289 ) ) ( not ( = ?AUTO_287 ?AUTO_289 ) ) ( not ( = ?AUTO_288 ?AUTO_289 ) ) ( not ( = ?AUTO_290 ?AUTO_292 ) ) ( OBJ-AT ?AUTO_286 ?AUTO_289 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_286 ?AUTO_294 ?AUTO_289 )
      ( DELIVER-PKG ?AUTO_286 ?AUTO_287 )
      ( DELIVER-PKG-VERIFY ?AUTO_286 ?AUTO_287 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_296 - OBJ
      ?AUTO_297 - LOCATION
    )
    :vars
    (
      ?AUTO_300 - LOCATION
      ?AUTO_305 - CITY
      ?AUTO_302 - TRUCK
      ?AUTO_304 - LOCATION
      ?AUTO_299 - AIRPLANE
      ?AUTO_301 - TRUCK
      ?AUTO_298 - LOCATION
      ?AUTO_303 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_300 ?AUTO_305 ) ( IN-CITY ?AUTO_297 ?AUTO_305 ) ( not ( = ?AUTO_297 ?AUTO_300 ) ) ( TRUCK-AT ?AUTO_302 ?AUTO_297 ) ( AIRPORT ?AUTO_304 ) ( AIRPORT ?AUTO_300 ) ( AIRPLANE-AT ?AUTO_299 ?AUTO_304 ) ( not ( = ?AUTO_304 ?AUTO_300 ) ) ( not ( = ?AUTO_297 ?AUTO_304 ) ) ( not ( = ?AUTO_302 ?AUTO_301 ) ) ( IN-CITY ?AUTO_298 ?AUTO_303 ) ( IN-CITY ?AUTO_304 ?AUTO_303 ) ( not ( = ?AUTO_304 ?AUTO_298 ) ) ( not ( = ?AUTO_297 ?AUTO_298 ) ) ( not ( = ?AUTO_300 ?AUTO_298 ) ) ( not ( = ?AUTO_305 ?AUTO_303 ) ) ( OBJ-AT ?AUTO_296 ?AUTO_298 ) ( TRUCK-AT ?AUTO_301 ?AUTO_304 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_301 ?AUTO_304 ?AUTO_298 ?AUTO_303 )
      ( DELIVER-PKG ?AUTO_296 ?AUTO_297 )
      ( DELIVER-PKG-VERIFY ?AUTO_296 ?AUTO_297 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_310 - OBJ
      ?AUTO_311 - LOCATION
    )
    :vars
    (
      ?AUTO_312 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_310 ?AUTO_312 ) ( AIRPLANE-AT ?AUTO_312 ?AUTO_311 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_310 ?AUTO_312 ?AUTO_311 )
      ( DELIVER-PKG-VERIFY ?AUTO_310 ?AUTO_311 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_315 - OBJ
      ?AUTO_316 - LOCATION
    )
    :vars
    (
      ?AUTO_317 - AIRPLANE
      ?AUTO_318 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_315 ?AUTO_317 ) ( AIRPORT ?AUTO_318 ) ( AIRPORT ?AUTO_316 ) ( AIRPLANE-AT ?AUTO_317 ?AUTO_318 ) ( not ( = ?AUTO_318 ?AUTO_316 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_317 ?AUTO_318 ?AUTO_316 )
      ( DELIVER-PKG ?AUTO_315 ?AUTO_316 )
      ( DELIVER-PKG-VERIFY ?AUTO_315 ?AUTO_316 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_319 - OBJ
      ?AUTO_320 - LOCATION
    )
    :vars
    (
      ?AUTO_322 - LOCATION
      ?AUTO_321 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_322 ) ( AIRPORT ?AUTO_320 ) ( AIRPLANE-AT ?AUTO_321 ?AUTO_322 ) ( not ( = ?AUTO_322 ?AUTO_320 ) ) ( OBJ-AT ?AUTO_319 ?AUTO_322 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_319 ?AUTO_321 ?AUTO_322 )
      ( DELIVER-PKG ?AUTO_319 ?AUTO_320 )
      ( DELIVER-PKG-VERIFY ?AUTO_319 ?AUTO_320 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_327 - OBJ
      ?AUTO_328 - LOCATION
    )
    :vars
    (
      ?AUTO_329 - LOCATION
      ?AUTO_330 - AIRPLANE
      ?AUTO_331 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_329 ) ( AIRPORT ?AUTO_328 ) ( AIRPLANE-AT ?AUTO_330 ?AUTO_329 ) ( not ( = ?AUTO_329 ?AUTO_328 ) ) ( TRUCK-AT ?AUTO_331 ?AUTO_329 ) ( IN-TRUCK ?AUTO_327 ?AUTO_331 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_327 ?AUTO_331 ?AUTO_329 )
      ( DELIVER-PKG ?AUTO_327 ?AUTO_328 )
      ( DELIVER-PKG-VERIFY ?AUTO_327 ?AUTO_328 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_332 - OBJ
      ?AUTO_333 - LOCATION
    )
    :vars
    (
      ?AUTO_334 - LOCATION
      ?AUTO_335 - AIRPLANE
      ?AUTO_336 - TRUCK
      ?AUTO_337 - LOCATION
      ?AUTO_338 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_334 ) ( AIRPORT ?AUTO_333 ) ( AIRPLANE-AT ?AUTO_335 ?AUTO_334 ) ( not ( = ?AUTO_334 ?AUTO_333 ) ) ( IN-TRUCK ?AUTO_332 ?AUTO_336 ) ( TRUCK-AT ?AUTO_336 ?AUTO_337 ) ( IN-CITY ?AUTO_337 ?AUTO_338 ) ( IN-CITY ?AUTO_334 ?AUTO_338 ) ( not ( = ?AUTO_334 ?AUTO_337 ) ) ( not ( = ?AUTO_333 ?AUTO_337 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_336 ?AUTO_337 ?AUTO_334 ?AUTO_338 )
      ( DELIVER-PKG ?AUTO_332 ?AUTO_333 )
      ( DELIVER-PKG-VERIFY ?AUTO_332 ?AUTO_333 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_343 - OBJ
      ?AUTO_344 - LOCATION
    )
    :vars
    (
      ?AUTO_345 - LOCATION
      ?AUTO_346 - TRUCK
      ?AUTO_347 - LOCATION
      ?AUTO_348 - CITY
      ?AUTO_350 - LOCATION
      ?AUTO_349 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_345 ) ( AIRPORT ?AUTO_344 ) ( not ( = ?AUTO_345 ?AUTO_344 ) ) ( IN-TRUCK ?AUTO_343 ?AUTO_346 ) ( TRUCK-AT ?AUTO_346 ?AUTO_347 ) ( IN-CITY ?AUTO_347 ?AUTO_348 ) ( IN-CITY ?AUTO_345 ?AUTO_348 ) ( not ( = ?AUTO_345 ?AUTO_347 ) ) ( not ( = ?AUTO_344 ?AUTO_347 ) ) ( AIRPORT ?AUTO_350 ) ( AIRPLANE-AT ?AUTO_349 ?AUTO_350 ) ( not ( = ?AUTO_350 ?AUTO_345 ) ) ( not ( = ?AUTO_344 ?AUTO_350 ) ) ( not ( = ?AUTO_347 ?AUTO_350 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_349 ?AUTO_350 ?AUTO_345 )
      ( DELIVER-PKG ?AUTO_343 ?AUTO_344 )
      ( DELIVER-PKG-VERIFY ?AUTO_343 ?AUTO_344 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_353 - OBJ
      ?AUTO_354 - LOCATION
    )
    :vars
    (
      ?AUTO_355 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_353 ?AUTO_355 ) ( AIRPLANE-AT ?AUTO_355 ?AUTO_354 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_353 ?AUTO_355 ?AUTO_354 )
      ( DELIVER-PKG-VERIFY ?AUTO_353 ?AUTO_354 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_356 - OBJ
      ?AUTO_357 - LOCATION
    )
    :vars
    (
      ?AUTO_358 - AIRPLANE
      ?AUTO_359 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_356 ?AUTO_358 ) ( AIRPORT ?AUTO_359 ) ( AIRPORT ?AUTO_357 ) ( AIRPLANE-AT ?AUTO_358 ?AUTO_359 ) ( not ( = ?AUTO_359 ?AUTO_357 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_358 ?AUTO_359 ?AUTO_357 )
      ( DELIVER-PKG ?AUTO_356 ?AUTO_357 )
      ( DELIVER-PKG-VERIFY ?AUTO_356 ?AUTO_357 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_360 - OBJ
      ?AUTO_361 - LOCATION
    )
    :vars
    (
      ?AUTO_363 - LOCATION
      ?AUTO_362 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_363 ) ( AIRPORT ?AUTO_361 ) ( AIRPLANE-AT ?AUTO_362 ?AUTO_363 ) ( not ( = ?AUTO_363 ?AUTO_361 ) ) ( OBJ-AT ?AUTO_360 ?AUTO_363 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_360 ?AUTO_362 ?AUTO_363 )
      ( DELIVER-PKG ?AUTO_360 ?AUTO_361 )
      ( DELIVER-PKG-VERIFY ?AUTO_360 ?AUTO_361 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_364 - OBJ
      ?AUTO_365 - LOCATION
    )
    :vars
    (
      ?AUTO_367 - LOCATION
      ?AUTO_368 - LOCATION
      ?AUTO_366 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_367 ) ( AIRPORT ?AUTO_365 ) ( not ( = ?AUTO_367 ?AUTO_365 ) ) ( OBJ-AT ?AUTO_364 ?AUTO_367 ) ( AIRPORT ?AUTO_368 ) ( AIRPLANE-AT ?AUTO_366 ?AUTO_368 ) ( not ( = ?AUTO_368 ?AUTO_367 ) ) ( not ( = ?AUTO_365 ?AUTO_368 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_366 ?AUTO_368 ?AUTO_367 )
      ( DELIVER-PKG ?AUTO_364 ?AUTO_365 )
      ( DELIVER-PKG-VERIFY ?AUTO_364 ?AUTO_365 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_371 - OBJ
      ?AUTO_372 - LOCATION
    )
    :vars
    (
      ?AUTO_373 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_373 ?AUTO_372 ) ( IN-TRUCK ?AUTO_371 ?AUTO_373 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_371 ?AUTO_373 ?AUTO_372 )
      ( DELIVER-PKG-VERIFY ?AUTO_371 ?AUTO_372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_374 - OBJ
      ?AUTO_375 - LOCATION
    )
    :vars
    (
      ?AUTO_376 - TRUCK
      ?AUTO_377 - LOCATION
      ?AUTO_378 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_374 ?AUTO_376 ) ( TRUCK-AT ?AUTO_376 ?AUTO_377 ) ( IN-CITY ?AUTO_377 ?AUTO_378 ) ( IN-CITY ?AUTO_375 ?AUTO_378 ) ( not ( = ?AUTO_375 ?AUTO_377 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_376 ?AUTO_377 ?AUTO_375 ?AUTO_378 )
      ( DELIVER-PKG ?AUTO_374 ?AUTO_375 )
      ( DELIVER-PKG-VERIFY ?AUTO_374 ?AUTO_375 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_379 - OBJ
      ?AUTO_380 - LOCATION
    )
    :vars
    (
      ?AUTO_381 - TRUCK
      ?AUTO_382 - LOCATION
      ?AUTO_383 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_381 ?AUTO_382 ) ( IN-CITY ?AUTO_382 ?AUTO_383 ) ( IN-CITY ?AUTO_380 ?AUTO_383 ) ( not ( = ?AUTO_380 ?AUTO_382 ) ) ( OBJ-AT ?AUTO_379 ?AUTO_382 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_379 ?AUTO_381 ?AUTO_382 )
      ( DELIVER-PKG ?AUTO_379 ?AUTO_380 )
      ( DELIVER-PKG-VERIFY ?AUTO_379 ?AUTO_380 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_384 - OBJ
      ?AUTO_385 - LOCATION
    )
    :vars
    (
      ?AUTO_386 - LOCATION
      ?AUTO_388 - CITY
      ?AUTO_387 - TRUCK
      ?AUTO_389 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_386 ?AUTO_388 ) ( IN-CITY ?AUTO_385 ?AUTO_388 ) ( not ( = ?AUTO_385 ?AUTO_386 ) ) ( OBJ-AT ?AUTO_384 ?AUTO_386 ) ( TRUCK-AT ?AUTO_387 ?AUTO_389 ) ( IN-CITY ?AUTO_389 ?AUTO_388 ) ( not ( = ?AUTO_386 ?AUTO_389 ) ) ( not ( = ?AUTO_385 ?AUTO_389 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_387 ?AUTO_389 ?AUTO_386 ?AUTO_388 )
      ( DELIVER-PKG ?AUTO_384 ?AUTO_385 )
      ( DELIVER-PKG-VERIFY ?AUTO_384 ?AUTO_385 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_392 - OBJ
      ?AUTO_393 - LOCATION
    )
    :vars
    (
      ?AUTO_394 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_392 ?AUTO_394 ) ( AIRPLANE-AT ?AUTO_394 ?AUTO_393 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_392 ?AUTO_394 ?AUTO_393 )
      ( DELIVER-PKG-VERIFY ?AUTO_392 ?AUTO_393 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_395 - OBJ
      ?AUTO_396 - LOCATION
    )
    :vars
    (
      ?AUTO_397 - AIRPLANE
      ?AUTO_398 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_395 ?AUTO_397 ) ( AIRPORT ?AUTO_398 ) ( AIRPORT ?AUTO_396 ) ( AIRPLANE-AT ?AUTO_397 ?AUTO_398 ) ( not ( = ?AUTO_398 ?AUTO_396 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_397 ?AUTO_398 ?AUTO_396 )
      ( DELIVER-PKG ?AUTO_395 ?AUTO_396 )
      ( DELIVER-PKG-VERIFY ?AUTO_395 ?AUTO_396 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_401 - OBJ
      ?AUTO_402 - LOCATION
    )
    :vars
    (
      ?AUTO_404 - LOCATION
      ?AUTO_403 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_404 ) ( AIRPORT ?AUTO_402 ) ( AIRPLANE-AT ?AUTO_403 ?AUTO_404 ) ( not ( = ?AUTO_404 ?AUTO_402 ) ) ( OBJ-AT ?AUTO_401 ?AUTO_404 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_401 ?AUTO_403 ?AUTO_404 )
      ( DELIVER-PKG ?AUTO_401 ?AUTO_402 )
      ( DELIVER-PKG-VERIFY ?AUTO_401 ?AUTO_402 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_405 - OBJ
      ?AUTO_406 - LOCATION
    )
    :vars
    (
      ?AUTO_408 - LOCATION
      ?AUTO_409 - LOCATION
      ?AUTO_407 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_408 ) ( AIRPORT ?AUTO_406 ) ( not ( = ?AUTO_408 ?AUTO_406 ) ) ( OBJ-AT ?AUTO_405 ?AUTO_408 ) ( AIRPORT ?AUTO_409 ) ( AIRPLANE-AT ?AUTO_407 ?AUTO_409 ) ( not ( = ?AUTO_409 ?AUTO_408 ) ) ( not ( = ?AUTO_406 ?AUTO_409 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_407 ?AUTO_409 ?AUTO_408 )
      ( DELIVER-PKG ?AUTO_405 ?AUTO_406 )
      ( DELIVER-PKG-VERIFY ?AUTO_405 ?AUTO_406 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_432 - OBJ
      ?AUTO_433 - LOCATION
    )
    :vars
    (
      ?AUTO_434 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_432 ?AUTO_434 ) ( AIRPLANE-AT ?AUTO_434 ?AUTO_433 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_432 ?AUTO_434 ?AUTO_433 )
      ( DELIVER-PKG-VERIFY ?AUTO_432 ?AUTO_433 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_435 - OBJ
      ?AUTO_436 - LOCATION
    )
    :vars
    (
      ?AUTO_437 - AIRPLANE
      ?AUTO_438 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_435 ?AUTO_437 ) ( AIRPORT ?AUTO_438 ) ( AIRPORT ?AUTO_436 ) ( AIRPLANE-AT ?AUTO_437 ?AUTO_438 ) ( not ( = ?AUTO_438 ?AUTO_436 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_437 ?AUTO_438 ?AUTO_436 )
      ( DELIVER-PKG ?AUTO_435 ?AUTO_436 )
      ( DELIVER-PKG-VERIFY ?AUTO_435 ?AUTO_436 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_465 - OBJ
      ?AUTO_466 - LOCATION
    )
    :vars
    (
      ?AUTO_467 - LOCATION
      ?AUTO_468 - LOCATION
      ?AUTO_469 - AIRPLANE
      ?AUTO_470 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_467 ) ( AIRPORT ?AUTO_466 ) ( not ( = ?AUTO_467 ?AUTO_466 ) ) ( AIRPORT ?AUTO_468 ) ( AIRPLANE-AT ?AUTO_469 ?AUTO_468 ) ( not ( = ?AUTO_468 ?AUTO_467 ) ) ( not ( = ?AUTO_466 ?AUTO_468 ) ) ( TRUCK-AT ?AUTO_470 ?AUTO_467 ) ( IN-TRUCK ?AUTO_465 ?AUTO_470 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_465 ?AUTO_470 ?AUTO_467 )
      ( DELIVER-PKG ?AUTO_465 ?AUTO_466 )
      ( DELIVER-PKG-VERIFY ?AUTO_465 ?AUTO_466 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_471 - OBJ
      ?AUTO_472 - LOCATION
    )
    :vars
    (
      ?AUTO_474 - LOCATION
      ?AUTO_473 - LOCATION
      ?AUTO_475 - AIRPLANE
      ?AUTO_476 - TRUCK
      ?AUTO_477 - LOCATION
      ?AUTO_478 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_474 ) ( AIRPORT ?AUTO_472 ) ( not ( = ?AUTO_474 ?AUTO_472 ) ) ( AIRPORT ?AUTO_473 ) ( AIRPLANE-AT ?AUTO_475 ?AUTO_473 ) ( not ( = ?AUTO_473 ?AUTO_474 ) ) ( not ( = ?AUTO_472 ?AUTO_473 ) ) ( IN-TRUCK ?AUTO_471 ?AUTO_476 ) ( TRUCK-AT ?AUTO_476 ?AUTO_477 ) ( IN-CITY ?AUTO_477 ?AUTO_478 ) ( IN-CITY ?AUTO_474 ?AUTO_478 ) ( not ( = ?AUTO_474 ?AUTO_477 ) ) ( not ( = ?AUTO_472 ?AUTO_477 ) ) ( not ( = ?AUTO_473 ?AUTO_477 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_476 ?AUTO_477 ?AUTO_474 ?AUTO_478 )
      ( DELIVER-PKG ?AUTO_471 ?AUTO_472 )
      ( DELIVER-PKG-VERIFY ?AUTO_471 ?AUTO_472 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_479 - OBJ
      ?AUTO_480 - LOCATION
    )
    :vars
    (
      ?AUTO_483 - LOCATION
      ?AUTO_481 - LOCATION
      ?AUTO_486 - AIRPLANE
      ?AUTO_482 - TRUCK
      ?AUTO_485 - LOCATION
      ?AUTO_484 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_483 ) ( AIRPORT ?AUTO_480 ) ( not ( = ?AUTO_483 ?AUTO_480 ) ) ( AIRPORT ?AUTO_481 ) ( AIRPLANE-AT ?AUTO_486 ?AUTO_481 ) ( not ( = ?AUTO_481 ?AUTO_483 ) ) ( not ( = ?AUTO_480 ?AUTO_481 ) ) ( TRUCK-AT ?AUTO_482 ?AUTO_485 ) ( IN-CITY ?AUTO_485 ?AUTO_484 ) ( IN-CITY ?AUTO_483 ?AUTO_484 ) ( not ( = ?AUTO_483 ?AUTO_485 ) ) ( not ( = ?AUTO_480 ?AUTO_485 ) ) ( not ( = ?AUTO_481 ?AUTO_485 ) ) ( OBJ-AT ?AUTO_479 ?AUTO_485 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_479 ?AUTO_482 ?AUTO_485 )
      ( DELIVER-PKG ?AUTO_479 ?AUTO_480 )
      ( DELIVER-PKG-VERIFY ?AUTO_479 ?AUTO_480 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_487 - OBJ
      ?AUTO_488 - LOCATION
    )
    :vars
    (
      ?AUTO_493 - LOCATION
      ?AUTO_490 - LOCATION
      ?AUTO_492 - AIRPLANE
      ?AUTO_491 - LOCATION
      ?AUTO_494 - CITY
      ?AUTO_489 - TRUCK
      ?AUTO_495 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_493 ) ( AIRPORT ?AUTO_488 ) ( not ( = ?AUTO_493 ?AUTO_488 ) ) ( AIRPORT ?AUTO_490 ) ( AIRPLANE-AT ?AUTO_492 ?AUTO_490 ) ( not ( = ?AUTO_490 ?AUTO_493 ) ) ( not ( = ?AUTO_488 ?AUTO_490 ) ) ( IN-CITY ?AUTO_491 ?AUTO_494 ) ( IN-CITY ?AUTO_493 ?AUTO_494 ) ( not ( = ?AUTO_493 ?AUTO_491 ) ) ( not ( = ?AUTO_488 ?AUTO_491 ) ) ( not ( = ?AUTO_490 ?AUTO_491 ) ) ( OBJ-AT ?AUTO_487 ?AUTO_491 ) ( TRUCK-AT ?AUTO_489 ?AUTO_495 ) ( IN-CITY ?AUTO_495 ?AUTO_494 ) ( not ( = ?AUTO_491 ?AUTO_495 ) ) ( not ( = ?AUTO_488 ?AUTO_495 ) ) ( not ( = ?AUTO_493 ?AUTO_495 ) ) ( not ( = ?AUTO_490 ?AUTO_495 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_489 ?AUTO_495 ?AUTO_491 ?AUTO_494 )
      ( DELIVER-PKG ?AUTO_487 ?AUTO_488 )
      ( DELIVER-PKG-VERIFY ?AUTO_487 ?AUTO_488 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_498 - OBJ
      ?AUTO_499 - LOCATION
    )
    :vars
    (
      ?AUTO_500 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_498 ?AUTO_500 ) ( AIRPLANE-AT ?AUTO_500 ?AUTO_499 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_498 ?AUTO_500 ?AUTO_499 )
      ( DELIVER-PKG-VERIFY ?AUTO_498 ?AUTO_499 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_541 - OBJ
      ?AUTO_542 - LOCATION
    )
    :vars
    (
      ?AUTO_543 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_541 ?AUTO_543 ) ( AIRPLANE-AT ?AUTO_543 ?AUTO_542 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_541 ?AUTO_543 ?AUTO_542 )
      ( DELIVER-PKG-VERIFY ?AUTO_541 ?AUTO_542 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_586 - OBJ
      ?AUTO_587 - LOCATION
    )
    :vars
    (
      ?AUTO_588 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_586 ?AUTO_588 ) ( AIRPLANE-AT ?AUTO_588 ?AUTO_587 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_586 ?AUTO_588 ?AUTO_587 )
      ( DELIVER-PKG-VERIFY ?AUTO_586 ?AUTO_587 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_633 - OBJ
      ?AUTO_634 - LOCATION
    )
    :vars
    (
      ?AUTO_635 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_633 ?AUTO_635 ) ( AIRPLANE-AT ?AUTO_635 ?AUTO_634 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_633 ?AUTO_635 ?AUTO_634 )
      ( DELIVER-PKG-VERIFY ?AUTO_633 ?AUTO_634 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_654 - OBJ
      ?AUTO_655 - LOCATION
    )
    :vars
    (
      ?AUTO_657 - LOCATION
      ?AUTO_656 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_657 ) ( AIRPORT ?AUTO_655 ) ( AIRPLANE-AT ?AUTO_656 ?AUTO_657 ) ( not ( = ?AUTO_657 ?AUTO_655 ) ) ( OBJ-AT ?AUTO_654 ?AUTO_657 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_654 ?AUTO_656 ?AUTO_657 )
      ( DELIVER-PKG ?AUTO_654 ?AUTO_655 )
      ( DELIVER-PKG-VERIFY ?AUTO_654 ?AUTO_655 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_684 - OBJ
      ?AUTO_685 - LOCATION
    )
    :vars
    (
      ?AUTO_686 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_686 ?AUTO_685 ) ( IN-TRUCK ?AUTO_684 ?AUTO_686 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_684 ?AUTO_686 ?AUTO_685 )
      ( DELIVER-PKG-VERIFY ?AUTO_684 ?AUTO_685 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_701 - OBJ
      ?AUTO_702 - LOCATION
    )
    :vars
    (
      ?AUTO_703 - TRUCK
      ?AUTO_704 - LOCATION
      ?AUTO_705 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_701 ?AUTO_703 ) ( TRUCK-AT ?AUTO_703 ?AUTO_704 ) ( IN-CITY ?AUTO_704 ?AUTO_705 ) ( IN-CITY ?AUTO_702 ?AUTO_705 ) ( not ( = ?AUTO_702 ?AUTO_704 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_703 ?AUTO_704 ?AUTO_702 ?AUTO_705 )
      ( DELIVER-PKG ?AUTO_701 ?AUTO_702 )
      ( DELIVER-PKG-VERIFY ?AUTO_701 ?AUTO_702 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_706 - OBJ
      ?AUTO_707 - LOCATION
    )
    :vars
    (
      ?AUTO_708 - TRUCK
      ?AUTO_709 - LOCATION
      ?AUTO_710 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_708 ?AUTO_709 ) ( IN-CITY ?AUTO_709 ?AUTO_710 ) ( IN-CITY ?AUTO_707 ?AUTO_710 ) ( not ( = ?AUTO_707 ?AUTO_709 ) ) ( OBJ-AT ?AUTO_706 ?AUTO_709 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_706 ?AUTO_708 ?AUTO_709 )
      ( DELIVER-PKG ?AUTO_706 ?AUTO_707 )
      ( DELIVER-PKG-VERIFY ?AUTO_706 ?AUTO_707 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_711 - OBJ
      ?AUTO_712 - LOCATION
    )
    :vars
    (
      ?AUTO_714 - TRUCK
      ?AUTO_713 - LOCATION
      ?AUTO_715 - CITY
      ?AUTO_716 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_714 ?AUTO_713 ) ( IN-CITY ?AUTO_713 ?AUTO_715 ) ( IN-CITY ?AUTO_712 ?AUTO_715 ) ( not ( = ?AUTO_712 ?AUTO_713 ) ) ( IN-AIRPLANE ?AUTO_711 ?AUTO_716 ) ( AIRPLANE-AT ?AUTO_716 ?AUTO_713 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_711 ?AUTO_716 ?AUTO_713 )
      ( DELIVER-PKG ?AUTO_711 ?AUTO_712 )
      ( DELIVER-PKG-VERIFY ?AUTO_711 ?AUTO_712 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_717 - OBJ
      ?AUTO_718 - LOCATION
    )
    :vars
    (
      ?AUTO_721 - TRUCK
      ?AUTO_719 - LOCATION
      ?AUTO_720 - CITY
      ?AUTO_722 - AIRPLANE
      ?AUTO_723 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_721 ?AUTO_719 ) ( IN-CITY ?AUTO_719 ?AUTO_720 ) ( IN-CITY ?AUTO_718 ?AUTO_720 ) ( not ( = ?AUTO_718 ?AUTO_719 ) ) ( IN-AIRPLANE ?AUTO_717 ?AUTO_722 ) ( AIRPORT ?AUTO_723 ) ( AIRPORT ?AUTO_719 ) ( AIRPLANE-AT ?AUTO_722 ?AUTO_723 ) ( not ( = ?AUTO_723 ?AUTO_719 ) ) ( not ( = ?AUTO_718 ?AUTO_723 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_722 ?AUTO_723 ?AUTO_719 )
      ( DELIVER-PKG ?AUTO_717 ?AUTO_718 )
      ( DELIVER-PKG-VERIFY ?AUTO_717 ?AUTO_718 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_726 - OBJ
      ?AUTO_727 - LOCATION
    )
    :vars
    (
      ?AUTO_728 - TRUCK
      ?AUTO_732 - LOCATION
      ?AUTO_731 - CITY
      ?AUTO_729 - LOCATION
      ?AUTO_730 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_728 ?AUTO_732 ) ( IN-CITY ?AUTO_732 ?AUTO_731 ) ( IN-CITY ?AUTO_727 ?AUTO_731 ) ( not ( = ?AUTO_727 ?AUTO_732 ) ) ( AIRPORT ?AUTO_729 ) ( AIRPORT ?AUTO_732 ) ( AIRPLANE-AT ?AUTO_730 ?AUTO_729 ) ( not ( = ?AUTO_729 ?AUTO_732 ) ) ( not ( = ?AUTO_727 ?AUTO_729 ) ) ( OBJ-AT ?AUTO_726 ?AUTO_729 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_726 ?AUTO_730 ?AUTO_729 )
      ( DELIVER-PKG ?AUTO_726 ?AUTO_727 )
      ( DELIVER-PKG-VERIFY ?AUTO_726 ?AUTO_727 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_733 - OBJ
      ?AUTO_734 - LOCATION
    )
    :vars
    (
      ?AUTO_735 - TRUCK
      ?AUTO_737 - LOCATION
      ?AUTO_739 - CITY
      ?AUTO_738 - LOCATION
      ?AUTO_740 - LOCATION
      ?AUTO_736 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_735 ?AUTO_737 ) ( IN-CITY ?AUTO_737 ?AUTO_739 ) ( IN-CITY ?AUTO_734 ?AUTO_739 ) ( not ( = ?AUTO_734 ?AUTO_737 ) ) ( AIRPORT ?AUTO_738 ) ( AIRPORT ?AUTO_737 ) ( not ( = ?AUTO_738 ?AUTO_737 ) ) ( not ( = ?AUTO_734 ?AUTO_738 ) ) ( OBJ-AT ?AUTO_733 ?AUTO_738 ) ( AIRPORT ?AUTO_740 ) ( AIRPLANE-AT ?AUTO_736 ?AUTO_740 ) ( not ( = ?AUTO_740 ?AUTO_738 ) ) ( not ( = ?AUTO_734 ?AUTO_740 ) ) ( not ( = ?AUTO_737 ?AUTO_740 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_736 ?AUTO_740 ?AUTO_738 )
      ( DELIVER-PKG ?AUTO_733 ?AUTO_734 )
      ( DELIVER-PKG-VERIFY ?AUTO_733 ?AUTO_734 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_763 - OBJ
      ?AUTO_764 - LOCATION
    )
    :vars
    (
      ?AUTO_765 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_763 ?AUTO_765 ) ( AIRPLANE-AT ?AUTO_765 ?AUTO_764 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_763 ?AUTO_765 ?AUTO_764 )
      ( DELIVER-PKG-VERIFY ?AUTO_763 ?AUTO_764 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_818 - OBJ
      ?AUTO_819 - LOCATION
    )
    :vars
    (
      ?AUTO_820 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_818 ?AUTO_820 ) ( AIRPLANE-AT ?AUTO_820 ?AUTO_819 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_818 ?AUTO_820 ?AUTO_819 )
      ( DELIVER-PKG-VERIFY ?AUTO_818 ?AUTO_819 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_821 - OBJ
      ?AUTO_822 - LOCATION
    )
    :vars
    (
      ?AUTO_823 - AIRPLANE
      ?AUTO_824 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_821 ?AUTO_823 ) ( AIRPORT ?AUTO_824 ) ( AIRPORT ?AUTO_822 ) ( AIRPLANE-AT ?AUTO_823 ?AUTO_824 ) ( not ( = ?AUTO_824 ?AUTO_822 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_823 ?AUTO_824 ?AUTO_822 )
      ( DELIVER-PKG ?AUTO_821 ?AUTO_822 )
      ( DELIVER-PKG-VERIFY ?AUTO_821 ?AUTO_822 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_829 - OBJ
      ?AUTO_830 - LOCATION
    )
    :vars
    (
      ?AUTO_831 - LOCATION
      ?AUTO_832 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_831 ) ( AIRPORT ?AUTO_830 ) ( AIRPLANE-AT ?AUTO_832 ?AUTO_831 ) ( not ( = ?AUTO_831 ?AUTO_830 ) ) ( OBJ-AT ?AUTO_829 ?AUTO_831 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_829 ?AUTO_832 ?AUTO_831 )
      ( DELIVER-PKG ?AUTO_829 ?AUTO_830 )
      ( DELIVER-PKG-VERIFY ?AUTO_829 ?AUTO_830 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_843 - OBJ
      ?AUTO_844 - LOCATION
    )
    :vars
    (
      ?AUTO_845 - LOCATION
      ?AUTO_847 - LOCATION
      ?AUTO_846 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_845 ) ( AIRPORT ?AUTO_844 ) ( not ( = ?AUTO_845 ?AUTO_844 ) ) ( OBJ-AT ?AUTO_843 ?AUTO_845 ) ( AIRPORT ?AUTO_847 ) ( AIRPLANE-AT ?AUTO_846 ?AUTO_847 ) ( not ( = ?AUTO_847 ?AUTO_845 ) ) ( not ( = ?AUTO_844 ?AUTO_847 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_846 ?AUTO_847 ?AUTO_845 )
      ( DELIVER-PKG ?AUTO_843 ?AUTO_844 )
      ( DELIVER-PKG-VERIFY ?AUTO_843 ?AUTO_844 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_884 - OBJ
      ?AUTO_885 - LOCATION
    )
    :vars
    (
      ?AUTO_886 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_886 ?AUTO_885 ) ( IN-TRUCK ?AUTO_884 ?AUTO_886 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_884 ?AUTO_886 ?AUTO_885 )
      ( DELIVER-PKG-VERIFY ?AUTO_884 ?AUTO_885 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_887 - OBJ
      ?AUTO_888 - LOCATION
    )
    :vars
    (
      ?AUTO_889 - TRUCK
      ?AUTO_890 - LOCATION
      ?AUTO_891 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_887 ?AUTO_889 ) ( TRUCK-AT ?AUTO_889 ?AUTO_890 ) ( IN-CITY ?AUTO_890 ?AUTO_891 ) ( IN-CITY ?AUTO_888 ?AUTO_891 ) ( not ( = ?AUTO_888 ?AUTO_890 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_889 ?AUTO_890 ?AUTO_888 ?AUTO_891 )
      ( DELIVER-PKG ?AUTO_887 ?AUTO_888 )
      ( DELIVER-PKG-VERIFY ?AUTO_887 ?AUTO_888 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_900 - OBJ
      ?AUTO_901 - LOCATION
    )
    :vars
    (
      ?AUTO_902 - TRUCK
      ?AUTO_903 - LOCATION
      ?AUTO_904 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_902 ?AUTO_903 ) ( IN-CITY ?AUTO_903 ?AUTO_904 ) ( IN-CITY ?AUTO_901 ?AUTO_904 ) ( not ( = ?AUTO_901 ?AUTO_903 ) ) ( OBJ-AT ?AUTO_900 ?AUTO_903 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_900 ?AUTO_902 ?AUTO_903 )
      ( DELIVER-PKG ?AUTO_900 ?AUTO_901 )
      ( DELIVER-PKG-VERIFY ?AUTO_900 ?AUTO_901 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_905 - OBJ
      ?AUTO_906 - LOCATION
    )
    :vars
    (
      ?AUTO_908 - LOCATION
      ?AUTO_909 - CITY
      ?AUTO_907 - TRUCK
      ?AUTO_910 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_908 ?AUTO_909 ) ( IN-CITY ?AUTO_906 ?AUTO_909 ) ( not ( = ?AUTO_906 ?AUTO_908 ) ) ( OBJ-AT ?AUTO_905 ?AUTO_908 ) ( TRUCK-AT ?AUTO_907 ?AUTO_910 ) ( IN-CITY ?AUTO_910 ?AUTO_909 ) ( not ( = ?AUTO_908 ?AUTO_910 ) ) ( not ( = ?AUTO_906 ?AUTO_910 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_907 ?AUTO_910 ?AUTO_908 ?AUTO_909 )
      ( DELIVER-PKG ?AUTO_905 ?AUTO_906 )
      ( DELIVER-PKG-VERIFY ?AUTO_905 ?AUTO_906 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_929 - OBJ
      ?AUTO_930 - LOCATION
    )
    :vars
    (
      ?AUTO_932 - LOCATION
      ?AUTO_933 - CITY
      ?AUTO_934 - TRUCK
      ?AUTO_931 - LOCATION
      ?AUTO_935 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_932 ?AUTO_933 ) ( IN-CITY ?AUTO_930 ?AUTO_933 ) ( not ( = ?AUTO_930 ?AUTO_932 ) ) ( TRUCK-AT ?AUTO_934 ?AUTO_931 ) ( IN-CITY ?AUTO_931 ?AUTO_933 ) ( not ( = ?AUTO_932 ?AUTO_931 ) ) ( not ( = ?AUTO_930 ?AUTO_931 ) ) ( IN-AIRPLANE ?AUTO_929 ?AUTO_935 ) ( AIRPLANE-AT ?AUTO_935 ?AUTO_932 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_929 ?AUTO_935 ?AUTO_932 )
      ( DELIVER-PKG ?AUTO_929 ?AUTO_930 )
      ( DELIVER-PKG-VERIFY ?AUTO_929 ?AUTO_930 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_936 - OBJ
      ?AUTO_937 - LOCATION
    )
    :vars
    (
      ?AUTO_938 - LOCATION
      ?AUTO_941 - CITY
      ?AUTO_940 - TRUCK
      ?AUTO_939 - LOCATION
      ?AUTO_942 - AIRPLANE
      ?AUTO_943 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_938 ?AUTO_941 ) ( IN-CITY ?AUTO_937 ?AUTO_941 ) ( not ( = ?AUTO_937 ?AUTO_938 ) ) ( TRUCK-AT ?AUTO_940 ?AUTO_939 ) ( IN-CITY ?AUTO_939 ?AUTO_941 ) ( not ( = ?AUTO_938 ?AUTO_939 ) ) ( not ( = ?AUTO_937 ?AUTO_939 ) ) ( IN-AIRPLANE ?AUTO_936 ?AUTO_942 ) ( AIRPORT ?AUTO_943 ) ( AIRPORT ?AUTO_938 ) ( AIRPLANE-AT ?AUTO_942 ?AUTO_943 ) ( not ( = ?AUTO_943 ?AUTO_938 ) ) ( not ( = ?AUTO_937 ?AUTO_943 ) ) ( not ( = ?AUTO_939 ?AUTO_943 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_942 ?AUTO_943 ?AUTO_938 )
      ( DELIVER-PKG ?AUTO_936 ?AUTO_937 )
      ( DELIVER-PKG-VERIFY ?AUTO_936 ?AUTO_937 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_968 - OBJ
      ?AUTO_969 - LOCATION
    )
    :vars
    (
      ?AUTO_973 - LOCATION
      ?AUTO_970 - CITY
      ?AUTO_971 - TRUCK
      ?AUTO_972 - LOCATION
      ?AUTO_974 - LOCATION
      ?AUTO_975 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_973 ?AUTO_970 ) ( IN-CITY ?AUTO_969 ?AUTO_970 ) ( not ( = ?AUTO_969 ?AUTO_973 ) ) ( TRUCK-AT ?AUTO_971 ?AUTO_972 ) ( IN-CITY ?AUTO_972 ?AUTO_970 ) ( not ( = ?AUTO_973 ?AUTO_972 ) ) ( not ( = ?AUTO_969 ?AUTO_972 ) ) ( AIRPORT ?AUTO_974 ) ( AIRPORT ?AUTO_973 ) ( AIRPLANE-AT ?AUTO_975 ?AUTO_974 ) ( not ( = ?AUTO_974 ?AUTO_973 ) ) ( not ( = ?AUTO_969 ?AUTO_974 ) ) ( not ( = ?AUTO_972 ?AUTO_974 ) ) ( OBJ-AT ?AUTO_968 ?AUTO_974 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_968 ?AUTO_975 ?AUTO_974 )
      ( DELIVER-PKG ?AUTO_968 ?AUTO_969 )
      ( DELIVER-PKG-VERIFY ?AUTO_968 ?AUTO_969 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_976 - OBJ
      ?AUTO_977 - LOCATION
    )
    :vars
    (
      ?AUTO_981 - LOCATION
      ?AUTO_983 - CITY
      ?AUTO_980 - TRUCK
      ?AUTO_978 - LOCATION
      ?AUTO_982 - LOCATION
      ?AUTO_979 - AIRPLANE
      ?AUTO_984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_981 ?AUTO_983 ) ( IN-CITY ?AUTO_977 ?AUTO_983 ) ( not ( = ?AUTO_977 ?AUTO_981 ) ) ( TRUCK-AT ?AUTO_980 ?AUTO_978 ) ( IN-CITY ?AUTO_978 ?AUTO_983 ) ( not ( = ?AUTO_981 ?AUTO_978 ) ) ( not ( = ?AUTO_977 ?AUTO_978 ) ) ( AIRPORT ?AUTO_982 ) ( AIRPORT ?AUTO_981 ) ( AIRPLANE-AT ?AUTO_979 ?AUTO_982 ) ( not ( = ?AUTO_982 ?AUTO_981 ) ) ( not ( = ?AUTO_977 ?AUTO_982 ) ) ( not ( = ?AUTO_978 ?AUTO_982 ) ) ( TRUCK-AT ?AUTO_984 ?AUTO_982 ) ( IN-TRUCK ?AUTO_976 ?AUTO_984 ) ( not ( = ?AUTO_980 ?AUTO_984 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_976 ?AUTO_984 ?AUTO_982 )
      ( DELIVER-PKG ?AUTO_976 ?AUTO_977 )
      ( DELIVER-PKG-VERIFY ?AUTO_976 ?AUTO_977 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_985 - OBJ
      ?AUTO_986 - LOCATION
    )
    :vars
    (
      ?AUTO_989 - LOCATION
      ?AUTO_992 - CITY
      ?AUTO_987 - TRUCK
      ?AUTO_990 - LOCATION
      ?AUTO_991 - LOCATION
      ?AUTO_988 - AIRPLANE
      ?AUTO_993 - TRUCK
      ?AUTO_994 - LOCATION
      ?AUTO_995 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_989 ?AUTO_992 ) ( IN-CITY ?AUTO_986 ?AUTO_992 ) ( not ( = ?AUTO_986 ?AUTO_989 ) ) ( TRUCK-AT ?AUTO_987 ?AUTO_990 ) ( IN-CITY ?AUTO_990 ?AUTO_992 ) ( not ( = ?AUTO_989 ?AUTO_990 ) ) ( not ( = ?AUTO_986 ?AUTO_990 ) ) ( AIRPORT ?AUTO_991 ) ( AIRPORT ?AUTO_989 ) ( AIRPLANE-AT ?AUTO_988 ?AUTO_991 ) ( not ( = ?AUTO_991 ?AUTO_989 ) ) ( not ( = ?AUTO_986 ?AUTO_991 ) ) ( not ( = ?AUTO_990 ?AUTO_991 ) ) ( IN-TRUCK ?AUTO_985 ?AUTO_993 ) ( not ( = ?AUTO_987 ?AUTO_993 ) ) ( TRUCK-AT ?AUTO_993 ?AUTO_994 ) ( IN-CITY ?AUTO_994 ?AUTO_995 ) ( IN-CITY ?AUTO_991 ?AUTO_995 ) ( not ( = ?AUTO_991 ?AUTO_994 ) ) ( not ( = ?AUTO_986 ?AUTO_994 ) ) ( not ( = ?AUTO_989 ?AUTO_994 ) ) ( not ( = ?AUTO_992 ?AUTO_995 ) ) ( not ( = ?AUTO_990 ?AUTO_994 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_993 ?AUTO_994 ?AUTO_991 ?AUTO_995 )
      ( DELIVER-PKG ?AUTO_985 ?AUTO_986 )
      ( DELIVER-PKG-VERIFY ?AUTO_985 ?AUTO_986 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_996 - OBJ
      ?AUTO_997 - LOCATION
    )
    :vars
    (
      ?AUTO_1004 - LOCATION
      ?AUTO_1001 - CITY
      ?AUTO_998 - TRUCK
      ?AUTO_1000 - LOCATION
      ?AUTO_999 - LOCATION
      ?AUTO_1002 - AIRPLANE
      ?AUTO_1006 - TRUCK
      ?AUTO_1003 - LOCATION
      ?AUTO_1005 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1004 ?AUTO_1001 ) ( IN-CITY ?AUTO_997 ?AUTO_1001 ) ( not ( = ?AUTO_997 ?AUTO_1004 ) ) ( TRUCK-AT ?AUTO_998 ?AUTO_1000 ) ( IN-CITY ?AUTO_1000 ?AUTO_1001 ) ( not ( = ?AUTO_1004 ?AUTO_1000 ) ) ( not ( = ?AUTO_997 ?AUTO_1000 ) ) ( AIRPORT ?AUTO_999 ) ( AIRPORT ?AUTO_1004 ) ( AIRPLANE-AT ?AUTO_1002 ?AUTO_999 ) ( not ( = ?AUTO_999 ?AUTO_1004 ) ) ( not ( = ?AUTO_997 ?AUTO_999 ) ) ( not ( = ?AUTO_1000 ?AUTO_999 ) ) ( not ( = ?AUTO_998 ?AUTO_1006 ) ) ( TRUCK-AT ?AUTO_1006 ?AUTO_1003 ) ( IN-CITY ?AUTO_1003 ?AUTO_1005 ) ( IN-CITY ?AUTO_999 ?AUTO_1005 ) ( not ( = ?AUTO_999 ?AUTO_1003 ) ) ( not ( = ?AUTO_997 ?AUTO_1003 ) ) ( not ( = ?AUTO_1004 ?AUTO_1003 ) ) ( not ( = ?AUTO_1001 ?AUTO_1005 ) ) ( not ( = ?AUTO_1000 ?AUTO_1003 ) ) ( OBJ-AT ?AUTO_996 ?AUTO_1003 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_996 ?AUTO_1006 ?AUTO_1003 )
      ( DELIVER-PKG ?AUTO_996 ?AUTO_997 )
      ( DELIVER-PKG-VERIFY ?AUTO_996 ?AUTO_997 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1007 - OBJ
      ?AUTO_1008 - LOCATION
    )
    :vars
    (
      ?AUTO_1014 - LOCATION
      ?AUTO_1012 - CITY
      ?AUTO_1015 - TRUCK
      ?AUTO_1009 - LOCATION
      ?AUTO_1011 - LOCATION
      ?AUTO_1013 - AIRPLANE
      ?AUTO_1016 - TRUCK
      ?AUTO_1010 - LOCATION
      ?AUTO_1017 - CITY
      ?AUTO_1018 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1014 ?AUTO_1012 ) ( IN-CITY ?AUTO_1008 ?AUTO_1012 ) ( not ( = ?AUTO_1008 ?AUTO_1014 ) ) ( TRUCK-AT ?AUTO_1015 ?AUTO_1009 ) ( IN-CITY ?AUTO_1009 ?AUTO_1012 ) ( not ( = ?AUTO_1014 ?AUTO_1009 ) ) ( not ( = ?AUTO_1008 ?AUTO_1009 ) ) ( AIRPORT ?AUTO_1011 ) ( AIRPORT ?AUTO_1014 ) ( AIRPLANE-AT ?AUTO_1013 ?AUTO_1011 ) ( not ( = ?AUTO_1011 ?AUTO_1014 ) ) ( not ( = ?AUTO_1008 ?AUTO_1011 ) ) ( not ( = ?AUTO_1009 ?AUTO_1011 ) ) ( not ( = ?AUTO_1015 ?AUTO_1016 ) ) ( IN-CITY ?AUTO_1010 ?AUTO_1017 ) ( IN-CITY ?AUTO_1011 ?AUTO_1017 ) ( not ( = ?AUTO_1011 ?AUTO_1010 ) ) ( not ( = ?AUTO_1008 ?AUTO_1010 ) ) ( not ( = ?AUTO_1014 ?AUTO_1010 ) ) ( not ( = ?AUTO_1012 ?AUTO_1017 ) ) ( not ( = ?AUTO_1009 ?AUTO_1010 ) ) ( OBJ-AT ?AUTO_1007 ?AUTO_1010 ) ( TRUCK-AT ?AUTO_1016 ?AUTO_1018 ) ( IN-CITY ?AUTO_1018 ?AUTO_1017 ) ( not ( = ?AUTO_1010 ?AUTO_1018 ) ) ( not ( = ?AUTO_1008 ?AUTO_1018 ) ) ( not ( = ?AUTO_1014 ?AUTO_1018 ) ) ( not ( = ?AUTO_1009 ?AUTO_1018 ) ) ( not ( = ?AUTO_1011 ?AUTO_1018 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1016 ?AUTO_1018 ?AUTO_1010 ?AUTO_1017 )
      ( DELIVER-PKG ?AUTO_1007 ?AUTO_1008 )
      ( DELIVER-PKG-VERIFY ?AUTO_1007 ?AUTO_1008 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1021 - OBJ
      ?AUTO_1022 - LOCATION
    )
    :vars
    (
      ?AUTO_1023 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1023 ?AUTO_1022 ) ( IN-TRUCK ?AUTO_1021 ?AUTO_1023 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1021 ?AUTO_1023 ?AUTO_1022 )
      ( DELIVER-PKG-VERIFY ?AUTO_1021 ?AUTO_1022 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1024 - OBJ
      ?AUTO_1025 - LOCATION
    )
    :vars
    (
      ?AUTO_1026 - TRUCK
      ?AUTO_1027 - LOCATION
      ?AUTO_1028 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1024 ?AUTO_1026 ) ( TRUCK-AT ?AUTO_1026 ?AUTO_1027 ) ( IN-CITY ?AUTO_1027 ?AUTO_1028 ) ( IN-CITY ?AUTO_1025 ?AUTO_1028 ) ( not ( = ?AUTO_1025 ?AUTO_1027 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1026 ?AUTO_1027 ?AUTO_1025 ?AUTO_1028 )
      ( DELIVER-PKG ?AUTO_1024 ?AUTO_1025 )
      ( DELIVER-PKG-VERIFY ?AUTO_1024 ?AUTO_1025 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1037 - OBJ
      ?AUTO_1038 - LOCATION
    )
    :vars
    (
      ?AUTO_1041 - TRUCK
      ?AUTO_1040 - LOCATION
      ?AUTO_1039 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1041 ?AUTO_1040 ) ( IN-CITY ?AUTO_1040 ?AUTO_1039 ) ( IN-CITY ?AUTO_1038 ?AUTO_1039 ) ( not ( = ?AUTO_1038 ?AUTO_1040 ) ) ( OBJ-AT ?AUTO_1037 ?AUTO_1040 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1037 ?AUTO_1041 ?AUTO_1040 )
      ( DELIVER-PKG ?AUTO_1037 ?AUTO_1038 )
      ( DELIVER-PKG-VERIFY ?AUTO_1037 ?AUTO_1038 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1062 - OBJ
      ?AUTO_1063 - LOCATION
    )
    :vars
    (
      ?AUTO_1066 - LOCATION
      ?AUTO_1067 - CITY
      ?AUTO_1064 - TRUCK
      ?AUTO_1065 - LOCATION
      ?AUTO_1068 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1066 ?AUTO_1067 ) ( IN-CITY ?AUTO_1063 ?AUTO_1067 ) ( not ( = ?AUTO_1063 ?AUTO_1066 ) ) ( TRUCK-AT ?AUTO_1064 ?AUTO_1065 ) ( IN-CITY ?AUTO_1065 ?AUTO_1067 ) ( not ( = ?AUTO_1066 ?AUTO_1065 ) ) ( not ( = ?AUTO_1063 ?AUTO_1065 ) ) ( IN-AIRPLANE ?AUTO_1062 ?AUTO_1068 ) ( AIRPLANE-AT ?AUTO_1068 ?AUTO_1066 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1062 ?AUTO_1068 ?AUTO_1066 )
      ( DELIVER-PKG ?AUTO_1062 ?AUTO_1063 )
      ( DELIVER-PKG-VERIFY ?AUTO_1062 ?AUTO_1063 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1091 - OBJ
      ?AUTO_1092 - LOCATION
    )
    :vars
    (
      ?AUTO_1095 - LOCATION
      ?AUTO_1097 - CITY
      ?AUTO_1093 - TRUCK
      ?AUTO_1098 - LOCATION
      ?AUTO_1094 - LOCATION
      ?AUTO_1096 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1095 ?AUTO_1097 ) ( IN-CITY ?AUTO_1092 ?AUTO_1097 ) ( not ( = ?AUTO_1092 ?AUTO_1095 ) ) ( TRUCK-AT ?AUTO_1093 ?AUTO_1098 ) ( IN-CITY ?AUTO_1098 ?AUTO_1097 ) ( not ( = ?AUTO_1095 ?AUTO_1098 ) ) ( not ( = ?AUTO_1092 ?AUTO_1098 ) ) ( AIRPORT ?AUTO_1094 ) ( AIRPORT ?AUTO_1095 ) ( AIRPLANE-AT ?AUTO_1096 ?AUTO_1094 ) ( not ( = ?AUTO_1094 ?AUTO_1095 ) ) ( not ( = ?AUTO_1092 ?AUTO_1094 ) ) ( not ( = ?AUTO_1098 ?AUTO_1094 ) ) ( OBJ-AT ?AUTO_1091 ?AUTO_1094 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1091 ?AUTO_1096 ?AUTO_1094 )
      ( DELIVER-PKG ?AUTO_1091 ?AUTO_1092 )
      ( DELIVER-PKG-VERIFY ?AUTO_1091 ?AUTO_1092 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1101 - OBJ
      ?AUTO_1102 - LOCATION
    )
    :vars
    (
      ?AUTO_1104 - LOCATION
      ?AUTO_1105 - CITY
      ?AUTO_1107 - TRUCK
      ?AUTO_1108 - LOCATION
      ?AUTO_1103 - LOCATION
      ?AUTO_1109 - LOCATION
      ?AUTO_1106 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1104 ?AUTO_1105 ) ( IN-CITY ?AUTO_1102 ?AUTO_1105 ) ( not ( = ?AUTO_1102 ?AUTO_1104 ) ) ( TRUCK-AT ?AUTO_1107 ?AUTO_1108 ) ( IN-CITY ?AUTO_1108 ?AUTO_1105 ) ( not ( = ?AUTO_1104 ?AUTO_1108 ) ) ( not ( = ?AUTO_1102 ?AUTO_1108 ) ) ( AIRPORT ?AUTO_1103 ) ( AIRPORT ?AUTO_1104 ) ( not ( = ?AUTO_1103 ?AUTO_1104 ) ) ( not ( = ?AUTO_1102 ?AUTO_1103 ) ) ( not ( = ?AUTO_1108 ?AUTO_1103 ) ) ( OBJ-AT ?AUTO_1101 ?AUTO_1103 ) ( AIRPORT ?AUTO_1109 ) ( AIRPLANE-AT ?AUTO_1106 ?AUTO_1109 ) ( not ( = ?AUTO_1109 ?AUTO_1103 ) ) ( not ( = ?AUTO_1102 ?AUTO_1109 ) ) ( not ( = ?AUTO_1104 ?AUTO_1109 ) ) ( not ( = ?AUTO_1108 ?AUTO_1109 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1106 ?AUTO_1109 ?AUTO_1103 )
      ( DELIVER-PKG ?AUTO_1101 ?AUTO_1102 )
      ( DELIVER-PKG-VERIFY ?AUTO_1101 ?AUTO_1102 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1124 - OBJ
      ?AUTO_1125 - LOCATION
    )
    :vars
    (
      ?AUTO_1126 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1126 ?AUTO_1125 ) ( IN-TRUCK ?AUTO_1124 ?AUTO_1126 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1124 ?AUTO_1126 ?AUTO_1125 )
      ( DELIVER-PKG-VERIFY ?AUTO_1124 ?AUTO_1125 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1127 - OBJ
      ?AUTO_1128 - LOCATION
    )
    :vars
    (
      ?AUTO_1129 - TRUCK
      ?AUTO_1130 - LOCATION
      ?AUTO_1131 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1127 ?AUTO_1129 ) ( TRUCK-AT ?AUTO_1129 ?AUTO_1130 ) ( IN-CITY ?AUTO_1130 ?AUTO_1131 ) ( IN-CITY ?AUTO_1128 ?AUTO_1131 ) ( not ( = ?AUTO_1128 ?AUTO_1130 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1129 ?AUTO_1130 ?AUTO_1128 ?AUTO_1131 )
      ( DELIVER-PKG ?AUTO_1127 ?AUTO_1128 )
      ( DELIVER-PKG-VERIFY ?AUTO_1127 ?AUTO_1128 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1210 - OBJ
      ?AUTO_1211 - LOCATION
    )
    :vars
    (
      ?AUTO_1212 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1212 ?AUTO_1211 ) ( IN-TRUCK ?AUTO_1210 ?AUTO_1212 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1210 ?AUTO_1212 ?AUTO_1211 )
      ( DELIVER-PKG-VERIFY ?AUTO_1210 ?AUTO_1211 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1227 - OBJ
      ?AUTO_1228 - LOCATION
    )
    :vars
    (
      ?AUTO_1230 - TRUCK
      ?AUTO_1229 - LOCATION
      ?AUTO_1231 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1230 ?AUTO_1229 ) ( IN-CITY ?AUTO_1229 ?AUTO_1231 ) ( IN-CITY ?AUTO_1228 ?AUTO_1231 ) ( not ( = ?AUTO_1228 ?AUTO_1229 ) ) ( OBJ-AT ?AUTO_1227 ?AUTO_1229 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1227 ?AUTO_1230 ?AUTO_1229 )
      ( DELIVER-PKG ?AUTO_1227 ?AUTO_1228 )
      ( DELIVER-PKG-VERIFY ?AUTO_1227 ?AUTO_1228 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1252 - OBJ
      ?AUTO_1253 - LOCATION
    )
    :vars
    (
      ?AUTO_1257 - LOCATION
      ?AUTO_1255 - CITY
      ?AUTO_1256 - TRUCK
      ?AUTO_1254 - LOCATION
      ?AUTO_1258 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1257 ?AUTO_1255 ) ( IN-CITY ?AUTO_1253 ?AUTO_1255 ) ( not ( = ?AUTO_1253 ?AUTO_1257 ) ) ( TRUCK-AT ?AUTO_1256 ?AUTO_1254 ) ( IN-CITY ?AUTO_1254 ?AUTO_1255 ) ( not ( = ?AUTO_1257 ?AUTO_1254 ) ) ( not ( = ?AUTO_1253 ?AUTO_1254 ) ) ( IN-AIRPLANE ?AUTO_1252 ?AUTO_1258 ) ( AIRPLANE-AT ?AUTO_1258 ?AUTO_1257 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1252 ?AUTO_1258 ?AUTO_1257 )
      ( DELIVER-PKG ?AUTO_1252 ?AUTO_1253 )
      ( DELIVER-PKG-VERIFY ?AUTO_1252 ?AUTO_1253 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1281 - OBJ
      ?AUTO_1282 - LOCATION
    )
    :vars
    (
      ?AUTO_1288 - LOCATION
      ?AUTO_1286 - CITY
      ?AUTO_1284 - TRUCK
      ?AUTO_1283 - LOCATION
      ?AUTO_1287 - LOCATION
      ?AUTO_1285 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1288 ?AUTO_1286 ) ( IN-CITY ?AUTO_1282 ?AUTO_1286 ) ( not ( = ?AUTO_1282 ?AUTO_1288 ) ) ( TRUCK-AT ?AUTO_1284 ?AUTO_1283 ) ( IN-CITY ?AUTO_1283 ?AUTO_1286 ) ( not ( = ?AUTO_1288 ?AUTO_1283 ) ) ( not ( = ?AUTO_1282 ?AUTO_1283 ) ) ( AIRPORT ?AUTO_1287 ) ( AIRPORT ?AUTO_1288 ) ( AIRPLANE-AT ?AUTO_1285 ?AUTO_1287 ) ( not ( = ?AUTO_1287 ?AUTO_1288 ) ) ( not ( = ?AUTO_1282 ?AUTO_1287 ) ) ( not ( = ?AUTO_1283 ?AUTO_1287 ) ) ( OBJ-AT ?AUTO_1281 ?AUTO_1287 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1281 ?AUTO_1285 ?AUTO_1287 )
      ( DELIVER-PKG ?AUTO_1281 ?AUTO_1282 )
      ( DELIVER-PKG-VERIFY ?AUTO_1281 ?AUTO_1282 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1309 - OBJ
      ?AUTO_1310 - LOCATION
    )
    :vars
    (
      ?AUTO_1311 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1311 ?AUTO_1310 ) ( IN-TRUCK ?AUTO_1309 ?AUTO_1311 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1309 ?AUTO_1311 ?AUTO_1310 )
      ( DELIVER-PKG-VERIFY ?AUTO_1309 ?AUTO_1310 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1312 - OBJ
      ?AUTO_1313 - LOCATION
    )
    :vars
    (
      ?AUTO_1314 - TRUCK
      ?AUTO_1315 - LOCATION
      ?AUTO_1316 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1312 ?AUTO_1314 ) ( TRUCK-AT ?AUTO_1314 ?AUTO_1315 ) ( IN-CITY ?AUTO_1315 ?AUTO_1316 ) ( IN-CITY ?AUTO_1313 ?AUTO_1316 ) ( not ( = ?AUTO_1313 ?AUTO_1315 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1314 ?AUTO_1315 ?AUTO_1313 ?AUTO_1316 )
      ( DELIVER-PKG ?AUTO_1312 ?AUTO_1313 )
      ( DELIVER-PKG-VERIFY ?AUTO_1312 ?AUTO_1313 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1331 - OBJ
      ?AUTO_1332 - LOCATION
    )
    :vars
    (
      ?AUTO_1335 - TRUCK
      ?AUTO_1333 - LOCATION
      ?AUTO_1334 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1335 ?AUTO_1333 ) ( IN-CITY ?AUTO_1333 ?AUTO_1334 ) ( IN-CITY ?AUTO_1332 ?AUTO_1334 ) ( not ( = ?AUTO_1332 ?AUTO_1333 ) ) ( OBJ-AT ?AUTO_1331 ?AUTO_1333 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1331 ?AUTO_1335 ?AUTO_1333 )
      ( DELIVER-PKG ?AUTO_1331 ?AUTO_1332 )
      ( DELIVER-PKG-VERIFY ?AUTO_1331 ?AUTO_1332 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1344 - OBJ
      ?AUTO_1345 - LOCATION
    )
    :vars
    (
      ?AUTO_1347 - LOCATION
      ?AUTO_1346 - CITY
      ?AUTO_1348 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1347 ?AUTO_1346 ) ( IN-CITY ?AUTO_1345 ?AUTO_1346 ) ( not ( = ?AUTO_1345 ?AUTO_1347 ) ) ( OBJ-AT ?AUTO_1344 ?AUTO_1347 ) ( TRUCK-AT ?AUTO_1348 ?AUTO_1345 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1348 ?AUTO_1345 ?AUTO_1347 ?AUTO_1346 )
      ( DELIVER-PKG ?AUTO_1344 ?AUTO_1345 )
      ( DELIVER-PKG-VERIFY ?AUTO_1344 ?AUTO_1345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1359 - OBJ
      ?AUTO_1360 - LOCATION
    )
    :vars
    (
      ?AUTO_1362 - LOCATION
      ?AUTO_1363 - CITY
      ?AUTO_1361 - TRUCK
      ?AUTO_1364 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1362 ?AUTO_1363 ) ( IN-CITY ?AUTO_1360 ?AUTO_1363 ) ( not ( = ?AUTO_1360 ?AUTO_1362 ) ) ( TRUCK-AT ?AUTO_1361 ?AUTO_1360 ) ( IN-AIRPLANE ?AUTO_1359 ?AUTO_1364 ) ( AIRPLANE-AT ?AUTO_1364 ?AUTO_1362 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1359 ?AUTO_1364 ?AUTO_1362 )
      ( DELIVER-PKG ?AUTO_1359 ?AUTO_1360 )
      ( DELIVER-PKG-VERIFY ?AUTO_1359 ?AUTO_1360 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1373 - OBJ
      ?AUTO_1374 - LOCATION
    )
    :vars
    (
      ?AUTO_1375 - LOCATION
      ?AUTO_1376 - CITY
      ?AUTO_1377 - TRUCK
      ?AUTO_1378 - AIRPLANE
      ?AUTO_1379 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1375 ?AUTO_1376 ) ( IN-CITY ?AUTO_1374 ?AUTO_1376 ) ( not ( = ?AUTO_1374 ?AUTO_1375 ) ) ( TRUCK-AT ?AUTO_1377 ?AUTO_1374 ) ( IN-AIRPLANE ?AUTO_1373 ?AUTO_1378 ) ( AIRPORT ?AUTO_1379 ) ( AIRPORT ?AUTO_1375 ) ( AIRPLANE-AT ?AUTO_1378 ?AUTO_1379 ) ( not ( = ?AUTO_1379 ?AUTO_1375 ) ) ( not ( = ?AUTO_1374 ?AUTO_1379 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1378 ?AUTO_1379 ?AUTO_1375 )
      ( DELIVER-PKG ?AUTO_1373 ?AUTO_1374 )
      ( DELIVER-PKG-VERIFY ?AUTO_1373 ?AUTO_1374 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1388 - OBJ
      ?AUTO_1389 - LOCATION
    )
    :vars
    (
      ?AUTO_1392 - LOCATION
      ?AUTO_1393 - CITY
      ?AUTO_1390 - TRUCK
      ?AUTO_1394 - LOCATION
      ?AUTO_1391 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1392 ?AUTO_1393 ) ( IN-CITY ?AUTO_1389 ?AUTO_1393 ) ( not ( = ?AUTO_1389 ?AUTO_1392 ) ) ( TRUCK-AT ?AUTO_1390 ?AUTO_1389 ) ( AIRPORT ?AUTO_1394 ) ( AIRPORT ?AUTO_1392 ) ( AIRPLANE-AT ?AUTO_1391 ?AUTO_1394 ) ( not ( = ?AUTO_1394 ?AUTO_1392 ) ) ( not ( = ?AUTO_1389 ?AUTO_1394 ) ) ( OBJ-AT ?AUTO_1388 ?AUTO_1394 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1388 ?AUTO_1391 ?AUTO_1394 )
      ( DELIVER-PKG ?AUTO_1388 ?AUTO_1389 )
      ( DELIVER-PKG-VERIFY ?AUTO_1388 ?AUTO_1389 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1397 - OBJ
      ?AUTO_1398 - LOCATION
    )
    :vars
    (
      ?AUTO_1401 - LOCATION
      ?AUTO_1400 - CITY
      ?AUTO_1402 - TRUCK
      ?AUTO_1403 - LOCATION
      ?AUTO_1404 - LOCATION
      ?AUTO_1399 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1401 ?AUTO_1400 ) ( IN-CITY ?AUTO_1398 ?AUTO_1400 ) ( not ( = ?AUTO_1398 ?AUTO_1401 ) ) ( TRUCK-AT ?AUTO_1402 ?AUTO_1398 ) ( AIRPORT ?AUTO_1403 ) ( AIRPORT ?AUTO_1401 ) ( not ( = ?AUTO_1403 ?AUTO_1401 ) ) ( not ( = ?AUTO_1398 ?AUTO_1403 ) ) ( OBJ-AT ?AUTO_1397 ?AUTO_1403 ) ( AIRPORT ?AUTO_1404 ) ( AIRPLANE-AT ?AUTO_1399 ?AUTO_1404 ) ( not ( = ?AUTO_1404 ?AUTO_1403 ) ) ( not ( = ?AUTO_1398 ?AUTO_1404 ) ) ( not ( = ?AUTO_1401 ?AUTO_1404 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1399 ?AUTO_1404 ?AUTO_1403 )
      ( DELIVER-PKG ?AUTO_1397 ?AUTO_1398 )
      ( DELIVER-PKG-VERIFY ?AUTO_1397 ?AUTO_1398 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1407 - OBJ
      ?AUTO_1408 - LOCATION
    )
    :vars
    (
      ?AUTO_1409 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1409 ?AUTO_1408 ) ( IN-TRUCK ?AUTO_1407 ?AUTO_1409 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1407 ?AUTO_1409 ?AUTO_1408 )
      ( DELIVER-PKG-VERIFY ?AUTO_1407 ?AUTO_1408 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1410 - OBJ
      ?AUTO_1411 - LOCATION
    )
    :vars
    (
      ?AUTO_1412 - TRUCK
      ?AUTO_1413 - LOCATION
      ?AUTO_1414 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1410 ?AUTO_1412 ) ( TRUCK-AT ?AUTO_1412 ?AUTO_1413 ) ( IN-CITY ?AUTO_1413 ?AUTO_1414 ) ( IN-CITY ?AUTO_1411 ?AUTO_1414 ) ( not ( = ?AUTO_1411 ?AUTO_1413 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1412 ?AUTO_1413 ?AUTO_1411 ?AUTO_1414 )
      ( DELIVER-PKG ?AUTO_1410 ?AUTO_1411 )
      ( DELIVER-PKG-VERIFY ?AUTO_1410 ?AUTO_1411 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1419 - OBJ
      ?AUTO_1420 - LOCATION
    )
    :vars
    (
      ?AUTO_1423 - TRUCK
      ?AUTO_1421 - LOCATION
      ?AUTO_1422 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1423 ?AUTO_1421 ) ( IN-CITY ?AUTO_1421 ?AUTO_1422 ) ( IN-CITY ?AUTO_1420 ?AUTO_1422 ) ( not ( = ?AUTO_1420 ?AUTO_1421 ) ) ( OBJ-AT ?AUTO_1419 ?AUTO_1421 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1419 ?AUTO_1423 ?AUTO_1421 )
      ( DELIVER-PKG ?AUTO_1419 ?AUTO_1420 )
      ( DELIVER-PKG-VERIFY ?AUTO_1419 ?AUTO_1420 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1424 - OBJ
      ?AUTO_1425 - LOCATION
    )
    :vars
    (
      ?AUTO_1426 - LOCATION
      ?AUTO_1427 - CITY
      ?AUTO_1428 - TRUCK
      ?AUTO_1429 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1426 ?AUTO_1427 ) ( IN-CITY ?AUTO_1425 ?AUTO_1427 ) ( not ( = ?AUTO_1425 ?AUTO_1426 ) ) ( OBJ-AT ?AUTO_1424 ?AUTO_1426 ) ( TRUCK-AT ?AUTO_1428 ?AUTO_1429 ) ( IN-CITY ?AUTO_1429 ?AUTO_1427 ) ( not ( = ?AUTO_1426 ?AUTO_1429 ) ) ( not ( = ?AUTO_1425 ?AUTO_1429 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1428 ?AUTO_1429 ?AUTO_1426 ?AUTO_1427 )
      ( DELIVER-PKG ?AUTO_1424 ?AUTO_1425 )
      ( DELIVER-PKG-VERIFY ?AUTO_1424 ?AUTO_1425 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1432 - OBJ
      ?AUTO_1433 - LOCATION
    )
    :vars
    (
      ?AUTO_1434 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1434 ?AUTO_1433 ) ( IN-TRUCK ?AUTO_1432 ?AUTO_1434 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1432 ?AUTO_1434 ?AUTO_1433 )
      ( DELIVER-PKG-VERIFY ?AUTO_1432 ?AUTO_1433 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1439 - OBJ
      ?AUTO_1440 - LOCATION
    )
    :vars
    (
      ?AUTO_1442 - TRUCK
      ?AUTO_1441 - LOCATION
      ?AUTO_1443 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1442 ?AUTO_1441 ) ( IN-CITY ?AUTO_1441 ?AUTO_1443 ) ( IN-CITY ?AUTO_1440 ?AUTO_1443 ) ( not ( = ?AUTO_1440 ?AUTO_1441 ) ) ( OBJ-AT ?AUTO_1439 ?AUTO_1441 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1439 ?AUTO_1442 ?AUTO_1441 )
      ( DELIVER-PKG ?AUTO_1439 ?AUTO_1440 )
      ( DELIVER-PKG-VERIFY ?AUTO_1439 ?AUTO_1440 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1444 - OBJ
      ?AUTO_1445 - LOCATION
    )
    :vars
    (
      ?AUTO_1447 - LOCATION
      ?AUTO_1448 - CITY
      ?AUTO_1446 - TRUCK
      ?AUTO_1449 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1447 ?AUTO_1448 ) ( IN-CITY ?AUTO_1445 ?AUTO_1448 ) ( not ( = ?AUTO_1445 ?AUTO_1447 ) ) ( OBJ-AT ?AUTO_1444 ?AUTO_1447 ) ( TRUCK-AT ?AUTO_1446 ?AUTO_1449 ) ( IN-CITY ?AUTO_1449 ?AUTO_1448 ) ( not ( = ?AUTO_1447 ?AUTO_1449 ) ) ( not ( = ?AUTO_1445 ?AUTO_1449 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1446 ?AUTO_1449 ?AUTO_1447 ?AUTO_1448 )
      ( DELIVER-PKG ?AUTO_1444 ?AUTO_1445 )
      ( DELIVER-PKG-VERIFY ?AUTO_1444 ?AUTO_1445 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1456 - OBJ
      ?AUTO_1457 - LOCATION
    )
    :vars
    (
      ?AUTO_1458 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1458 ?AUTO_1457 ) ( IN-TRUCK ?AUTO_1456 ?AUTO_1458 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1456 ?AUTO_1458 ?AUTO_1457 )
      ( DELIVER-PKG-VERIFY ?AUTO_1456 ?AUTO_1457 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1459 - OBJ
      ?AUTO_1460 - LOCATION
    )
    :vars
    (
      ?AUTO_1461 - TRUCK
      ?AUTO_1462 - LOCATION
      ?AUTO_1463 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1459 ?AUTO_1461 ) ( TRUCK-AT ?AUTO_1461 ?AUTO_1462 ) ( IN-CITY ?AUTO_1462 ?AUTO_1463 ) ( IN-CITY ?AUTO_1460 ?AUTO_1463 ) ( not ( = ?AUTO_1460 ?AUTO_1462 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1461 ?AUTO_1462 ?AUTO_1460 ?AUTO_1463 )
      ( DELIVER-PKG ?AUTO_1459 ?AUTO_1460 )
      ( DELIVER-PKG-VERIFY ?AUTO_1459 ?AUTO_1460 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1464 - OBJ
      ?AUTO_1465 - LOCATION
    )
    :vars
    (
      ?AUTO_1468 - TRUCK
      ?AUTO_1466 - LOCATION
      ?AUTO_1467 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1468 ?AUTO_1466 ) ( IN-CITY ?AUTO_1466 ?AUTO_1467 ) ( IN-CITY ?AUTO_1465 ?AUTO_1467 ) ( not ( = ?AUTO_1465 ?AUTO_1466 ) ) ( OBJ-AT ?AUTO_1464 ?AUTO_1466 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1464 ?AUTO_1468 ?AUTO_1466 )
      ( DELIVER-PKG ?AUTO_1464 ?AUTO_1465 )
      ( DELIVER-PKG-VERIFY ?AUTO_1464 ?AUTO_1465 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1469 - OBJ
      ?AUTO_1470 - LOCATION
    )
    :vars
    (
      ?AUTO_1472 - LOCATION
      ?AUTO_1471 - CITY
      ?AUTO_1473 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1472 ?AUTO_1471 ) ( IN-CITY ?AUTO_1470 ?AUTO_1471 ) ( not ( = ?AUTO_1470 ?AUTO_1472 ) ) ( OBJ-AT ?AUTO_1469 ?AUTO_1472 ) ( TRUCK-AT ?AUTO_1473 ?AUTO_1470 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1473 ?AUTO_1470 ?AUTO_1472 ?AUTO_1471 )
      ( DELIVER-PKG ?AUTO_1469 ?AUTO_1470 )
      ( DELIVER-PKG-VERIFY ?AUTO_1469 ?AUTO_1470 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1492 - OBJ
      ?AUTO_1493 - LOCATION
    )
    :vars
    (
      ?AUTO_1494 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1494 ?AUTO_1493 ) ( IN-TRUCK ?AUTO_1492 ?AUTO_1494 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1492 ?AUTO_1494 ?AUTO_1493 )
      ( DELIVER-PKG-VERIFY ?AUTO_1492 ?AUTO_1493 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1495 - OBJ
      ?AUTO_1496 - LOCATION
    )
    :vars
    (
      ?AUTO_1497 - TRUCK
      ?AUTO_1498 - LOCATION
      ?AUTO_1499 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1495 ?AUTO_1497 ) ( TRUCK-AT ?AUTO_1497 ?AUTO_1498 ) ( IN-CITY ?AUTO_1498 ?AUTO_1499 ) ( IN-CITY ?AUTO_1496 ?AUTO_1499 ) ( not ( = ?AUTO_1496 ?AUTO_1498 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1497 ?AUTO_1498 ?AUTO_1496 ?AUTO_1499 )
      ( DELIVER-PKG ?AUTO_1495 ?AUTO_1496 )
      ( DELIVER-PKG-VERIFY ?AUTO_1495 ?AUTO_1496 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1526 - OBJ
      ?AUTO_1527 - LOCATION
    )
    :vars
    (
      ?AUTO_1528 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1526 ?AUTO_1528 ) ( AIRPLANE-AT ?AUTO_1528 ?AUTO_1527 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1526 ?AUTO_1528 ?AUTO_1527 )
      ( DELIVER-PKG-VERIFY ?AUTO_1526 ?AUTO_1527 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1531 - OBJ
      ?AUTO_1532 - LOCATION
    )
    :vars
    (
      ?AUTO_1533 - AIRPLANE
      ?AUTO_1534 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1531 ?AUTO_1533 ) ( AIRPORT ?AUTO_1534 ) ( AIRPORT ?AUTO_1532 ) ( AIRPLANE-AT ?AUTO_1533 ?AUTO_1534 ) ( not ( = ?AUTO_1534 ?AUTO_1532 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1533 ?AUTO_1534 ?AUTO_1532 )
      ( DELIVER-PKG ?AUTO_1531 ?AUTO_1532 )
      ( DELIVER-PKG-VERIFY ?AUTO_1531 ?AUTO_1532 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1535 - OBJ
      ?AUTO_1536 - LOCATION
    )
    :vars
    (
      ?AUTO_1538 - LOCATION
      ?AUTO_1537 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1538 ) ( AIRPORT ?AUTO_1536 ) ( AIRPLANE-AT ?AUTO_1537 ?AUTO_1538 ) ( not ( = ?AUTO_1538 ?AUTO_1536 ) ) ( OBJ-AT ?AUTO_1535 ?AUTO_1538 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1535 ?AUTO_1537 ?AUTO_1538 )
      ( DELIVER-PKG ?AUTO_1535 ?AUTO_1536 )
      ( DELIVER-PKG-VERIFY ?AUTO_1535 ?AUTO_1536 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1539 - OBJ
      ?AUTO_1540 - LOCATION
    )
    :vars
    (
      ?AUTO_1542 - LOCATION
      ?AUTO_1541 - AIRPLANE
      ?AUTO_1543 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1542 ) ( AIRPORT ?AUTO_1540 ) ( AIRPLANE-AT ?AUTO_1541 ?AUTO_1542 ) ( not ( = ?AUTO_1542 ?AUTO_1540 ) ) ( TRUCK-AT ?AUTO_1543 ?AUTO_1542 ) ( IN-TRUCK ?AUTO_1539 ?AUTO_1543 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1539 ?AUTO_1543 ?AUTO_1542 )
      ( DELIVER-PKG ?AUTO_1539 ?AUTO_1540 )
      ( DELIVER-PKG-VERIFY ?AUTO_1539 ?AUTO_1540 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1544 - OBJ
      ?AUTO_1545 - LOCATION
    )
    :vars
    (
      ?AUTO_1547 - LOCATION
      ?AUTO_1546 - AIRPLANE
      ?AUTO_1548 - TRUCK
      ?AUTO_1549 - LOCATION
      ?AUTO_1550 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1547 ) ( AIRPORT ?AUTO_1545 ) ( AIRPLANE-AT ?AUTO_1546 ?AUTO_1547 ) ( not ( = ?AUTO_1547 ?AUTO_1545 ) ) ( IN-TRUCK ?AUTO_1544 ?AUTO_1548 ) ( TRUCK-AT ?AUTO_1548 ?AUTO_1549 ) ( IN-CITY ?AUTO_1549 ?AUTO_1550 ) ( IN-CITY ?AUTO_1547 ?AUTO_1550 ) ( not ( = ?AUTO_1547 ?AUTO_1549 ) ) ( not ( = ?AUTO_1545 ?AUTO_1549 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1548 ?AUTO_1549 ?AUTO_1547 ?AUTO_1550 )
      ( DELIVER-PKG ?AUTO_1544 ?AUTO_1545 )
      ( DELIVER-PKG-VERIFY ?AUTO_1544 ?AUTO_1545 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1559 - OBJ
      ?AUTO_1560 - LOCATION
    )
    :vars
    (
      ?AUTO_1562 - LOCATION
      ?AUTO_1564 - AIRPLANE
      ?AUTO_1561 - TRUCK
      ?AUTO_1563 - LOCATION
      ?AUTO_1565 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1562 ) ( AIRPORT ?AUTO_1560 ) ( AIRPLANE-AT ?AUTO_1564 ?AUTO_1562 ) ( not ( = ?AUTO_1562 ?AUTO_1560 ) ) ( TRUCK-AT ?AUTO_1561 ?AUTO_1563 ) ( IN-CITY ?AUTO_1563 ?AUTO_1565 ) ( IN-CITY ?AUTO_1562 ?AUTO_1565 ) ( not ( = ?AUTO_1562 ?AUTO_1563 ) ) ( not ( = ?AUTO_1560 ?AUTO_1563 ) ) ( OBJ-AT ?AUTO_1559 ?AUTO_1563 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1559 ?AUTO_1561 ?AUTO_1563 )
      ( DELIVER-PKG ?AUTO_1559 ?AUTO_1560 )
      ( DELIVER-PKG-VERIFY ?AUTO_1559 ?AUTO_1560 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1582 - OBJ
      ?AUTO_1583 - LOCATION
    )
    :vars
    (
      ?AUTO_1584 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1582 ?AUTO_1584 ) ( AIRPLANE-AT ?AUTO_1584 ?AUTO_1583 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1582 ?AUTO_1584 ?AUTO_1583 )
      ( DELIVER-PKG-VERIFY ?AUTO_1582 ?AUTO_1583 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1585 - OBJ
      ?AUTO_1586 - LOCATION
    )
    :vars
    (
      ?AUTO_1587 - AIRPLANE
      ?AUTO_1588 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1585 ?AUTO_1587 ) ( AIRPORT ?AUTO_1588 ) ( AIRPORT ?AUTO_1586 ) ( AIRPLANE-AT ?AUTO_1587 ?AUTO_1588 ) ( not ( = ?AUTO_1588 ?AUTO_1586 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1587 ?AUTO_1588 ?AUTO_1586 )
      ( DELIVER-PKG ?AUTO_1585 ?AUTO_1586 )
      ( DELIVER-PKG-VERIFY ?AUTO_1585 ?AUTO_1586 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1591 - OBJ
      ?AUTO_1592 - LOCATION
    )
    :vars
    (
      ?AUTO_1593 - LOCATION
      ?AUTO_1594 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1593 ) ( AIRPORT ?AUTO_1592 ) ( AIRPLANE-AT ?AUTO_1594 ?AUTO_1593 ) ( not ( = ?AUTO_1593 ?AUTO_1592 ) ) ( OBJ-AT ?AUTO_1591 ?AUTO_1593 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1591 ?AUTO_1594 ?AUTO_1593 )
      ( DELIVER-PKG ?AUTO_1591 ?AUTO_1592 )
      ( DELIVER-PKG-VERIFY ?AUTO_1591 ?AUTO_1592 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1595 - OBJ
      ?AUTO_1596 - LOCATION
    )
    :vars
    (
      ?AUTO_1597 - LOCATION
      ?AUTO_1598 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1597 ) ( AIRPORT ?AUTO_1596 ) ( not ( = ?AUTO_1597 ?AUTO_1596 ) ) ( OBJ-AT ?AUTO_1595 ?AUTO_1597 ) ( AIRPLANE-AT ?AUTO_1598 ?AUTO_1596 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1598 ?AUTO_1596 ?AUTO_1597 )
      ( DELIVER-PKG ?AUTO_1595 ?AUTO_1596 )
      ( DELIVER-PKG-VERIFY ?AUTO_1595 ?AUTO_1596 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1605 - OBJ
      ?AUTO_1606 - LOCATION
    )
    :vars
    (
      ?AUTO_1608 - LOCATION
      ?AUTO_1607 - AIRPLANE
      ?AUTO_1609 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1608 ) ( AIRPORT ?AUTO_1606 ) ( not ( = ?AUTO_1608 ?AUTO_1606 ) ) ( AIRPLANE-AT ?AUTO_1607 ?AUTO_1606 ) ( TRUCK-AT ?AUTO_1609 ?AUTO_1608 ) ( IN-TRUCK ?AUTO_1605 ?AUTO_1609 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1605 ?AUTO_1609 ?AUTO_1608 )
      ( DELIVER-PKG ?AUTO_1605 ?AUTO_1606 )
      ( DELIVER-PKG-VERIFY ?AUTO_1605 ?AUTO_1606 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1610 - OBJ
      ?AUTO_1611 - LOCATION
    )
    :vars
    (
      ?AUTO_1614 - LOCATION
      ?AUTO_1613 - AIRPLANE
      ?AUTO_1612 - TRUCK
      ?AUTO_1615 - LOCATION
      ?AUTO_1616 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1614 ) ( AIRPORT ?AUTO_1611 ) ( not ( = ?AUTO_1614 ?AUTO_1611 ) ) ( AIRPLANE-AT ?AUTO_1613 ?AUTO_1611 ) ( IN-TRUCK ?AUTO_1610 ?AUTO_1612 ) ( TRUCK-AT ?AUTO_1612 ?AUTO_1615 ) ( IN-CITY ?AUTO_1615 ?AUTO_1616 ) ( IN-CITY ?AUTO_1614 ?AUTO_1616 ) ( not ( = ?AUTO_1614 ?AUTO_1615 ) ) ( not ( = ?AUTO_1611 ?AUTO_1615 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1612 ?AUTO_1615 ?AUTO_1614 ?AUTO_1616 )
      ( DELIVER-PKG ?AUTO_1610 ?AUTO_1611 )
      ( DELIVER-PKG-VERIFY ?AUTO_1610 ?AUTO_1611 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1617 - OBJ
      ?AUTO_1618 - LOCATION
    )
    :vars
    (
      ?AUTO_1623 - LOCATION
      ?AUTO_1620 - AIRPLANE
      ?AUTO_1622 - TRUCK
      ?AUTO_1621 - LOCATION
      ?AUTO_1619 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1623 ) ( AIRPORT ?AUTO_1618 ) ( not ( = ?AUTO_1623 ?AUTO_1618 ) ) ( AIRPLANE-AT ?AUTO_1620 ?AUTO_1618 ) ( TRUCK-AT ?AUTO_1622 ?AUTO_1621 ) ( IN-CITY ?AUTO_1621 ?AUTO_1619 ) ( IN-CITY ?AUTO_1623 ?AUTO_1619 ) ( not ( = ?AUTO_1623 ?AUTO_1621 ) ) ( not ( = ?AUTO_1618 ?AUTO_1621 ) ) ( OBJ-AT ?AUTO_1617 ?AUTO_1621 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1617 ?AUTO_1622 ?AUTO_1621 )
      ( DELIVER-PKG ?AUTO_1617 ?AUTO_1618 )
      ( DELIVER-PKG-VERIFY ?AUTO_1617 ?AUTO_1618 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1624 - OBJ
      ?AUTO_1625 - LOCATION
    )
    :vars
    (
      ?AUTO_1629 - LOCATION
      ?AUTO_1626 - AIRPLANE
      ?AUTO_1630 - LOCATION
      ?AUTO_1627 - CITY
      ?AUTO_1628 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1629 ) ( AIRPORT ?AUTO_1625 ) ( not ( = ?AUTO_1629 ?AUTO_1625 ) ) ( AIRPLANE-AT ?AUTO_1626 ?AUTO_1625 ) ( IN-CITY ?AUTO_1630 ?AUTO_1627 ) ( IN-CITY ?AUTO_1629 ?AUTO_1627 ) ( not ( = ?AUTO_1629 ?AUTO_1630 ) ) ( not ( = ?AUTO_1625 ?AUTO_1630 ) ) ( OBJ-AT ?AUTO_1624 ?AUTO_1630 ) ( TRUCK-AT ?AUTO_1628 ?AUTO_1629 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1628 ?AUTO_1629 ?AUTO_1630 ?AUTO_1627 )
      ( DELIVER-PKG ?AUTO_1624 ?AUTO_1625 )
      ( DELIVER-PKG-VERIFY ?AUTO_1624 ?AUTO_1625 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1649 - OBJ
      ?AUTO_1650 - LOCATION
    )
    :vars
    (
      ?AUTO_1651 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1649 ?AUTO_1651 ) ( AIRPLANE-AT ?AUTO_1651 ?AUTO_1650 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1649 ?AUTO_1651 ?AUTO_1650 )
      ( DELIVER-PKG-VERIFY ?AUTO_1649 ?AUTO_1650 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1652 - OBJ
      ?AUTO_1653 - LOCATION
    )
    :vars
    (
      ?AUTO_1654 - AIRPLANE
      ?AUTO_1655 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1652 ?AUTO_1654 ) ( AIRPORT ?AUTO_1655 ) ( AIRPORT ?AUTO_1653 ) ( AIRPLANE-AT ?AUTO_1654 ?AUTO_1655 ) ( not ( = ?AUTO_1655 ?AUTO_1653 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1654 ?AUTO_1655 ?AUTO_1653 )
      ( DELIVER-PKG ?AUTO_1652 ?AUTO_1653 )
      ( DELIVER-PKG-VERIFY ?AUTO_1652 ?AUTO_1653 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1658 - OBJ
      ?AUTO_1659 - LOCATION
    )
    :vars
    (
      ?AUTO_1661 - LOCATION
      ?AUTO_1660 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1661 ) ( AIRPORT ?AUTO_1659 ) ( AIRPLANE-AT ?AUTO_1660 ?AUTO_1661 ) ( not ( = ?AUTO_1661 ?AUTO_1659 ) ) ( OBJ-AT ?AUTO_1658 ?AUTO_1661 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1658 ?AUTO_1660 ?AUTO_1661 )
      ( DELIVER-PKG ?AUTO_1658 ?AUTO_1659 )
      ( DELIVER-PKG-VERIFY ?AUTO_1658 ?AUTO_1659 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1662 - OBJ
      ?AUTO_1663 - LOCATION
    )
    :vars
    (
      ?AUTO_1665 - LOCATION
      ?AUTO_1664 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1665 ) ( AIRPORT ?AUTO_1663 ) ( not ( = ?AUTO_1665 ?AUTO_1663 ) ) ( OBJ-AT ?AUTO_1662 ?AUTO_1665 ) ( AIRPLANE-AT ?AUTO_1664 ?AUTO_1663 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1664 ?AUTO_1663 ?AUTO_1665 )
      ( DELIVER-PKG ?AUTO_1662 ?AUTO_1663 )
      ( DELIVER-PKG-VERIFY ?AUTO_1662 ?AUTO_1663 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1706 - OBJ
      ?AUTO_1707 - LOCATION
    )
    :vars
    (
      ?AUTO_1708 - LOCATION
      ?AUTO_1710 - AIRPLANE
      ?AUTO_1709 - LOCATION
      ?AUTO_1711 - CITY
      ?AUTO_1712 - TRUCK
      ?AUTO_1713 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1708 ) ( AIRPORT ?AUTO_1707 ) ( not ( = ?AUTO_1708 ?AUTO_1707 ) ) ( AIRPLANE-AT ?AUTO_1710 ?AUTO_1707 ) ( IN-CITY ?AUTO_1709 ?AUTO_1711 ) ( IN-CITY ?AUTO_1708 ?AUTO_1711 ) ( not ( = ?AUTO_1708 ?AUTO_1709 ) ) ( not ( = ?AUTO_1707 ?AUTO_1709 ) ) ( OBJ-AT ?AUTO_1706 ?AUTO_1709 ) ( TRUCK-AT ?AUTO_1712 ?AUTO_1713 ) ( IN-CITY ?AUTO_1713 ?AUTO_1711 ) ( not ( = ?AUTO_1709 ?AUTO_1713 ) ) ( not ( = ?AUTO_1707 ?AUTO_1713 ) ) ( not ( = ?AUTO_1708 ?AUTO_1713 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1712 ?AUTO_1713 ?AUTO_1709 ?AUTO_1711 )
      ( DELIVER-PKG ?AUTO_1706 ?AUTO_1707 )
      ( DELIVER-PKG-VERIFY ?AUTO_1706 ?AUTO_1707 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1716 - OBJ
      ?AUTO_1717 - LOCATION
    )
    :vars
    (
      ?AUTO_1718 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1716 ?AUTO_1718 ) ( AIRPLANE-AT ?AUTO_1718 ?AUTO_1717 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1716 ?AUTO_1718 ?AUTO_1717 )
      ( DELIVER-PKG-VERIFY ?AUTO_1716 ?AUTO_1717 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1723 - OBJ
      ?AUTO_1724 - LOCATION
    )
    :vars
    (
      ?AUTO_1725 - LOCATION
      ?AUTO_1726 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1725 ) ( AIRPORT ?AUTO_1724 ) ( AIRPLANE-AT ?AUTO_1726 ?AUTO_1725 ) ( not ( = ?AUTO_1725 ?AUTO_1724 ) ) ( OBJ-AT ?AUTO_1723 ?AUTO_1725 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1723 ?AUTO_1726 ?AUTO_1725 )
      ( DELIVER-PKG ?AUTO_1723 ?AUTO_1724 )
      ( DELIVER-PKG-VERIFY ?AUTO_1723 ?AUTO_1724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1767 - OBJ
      ?AUTO_1768 - LOCATION
    )
    :vars
    (
      ?AUTO_1769 - LOCATION
      ?AUTO_1770 - AIRPLANE
      ?AUTO_1773 - LOCATION
      ?AUTO_1772 - CITY
      ?AUTO_1771 - TRUCK
      ?AUTO_1774 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1769 ) ( AIRPORT ?AUTO_1768 ) ( not ( = ?AUTO_1769 ?AUTO_1768 ) ) ( AIRPLANE-AT ?AUTO_1770 ?AUTO_1768 ) ( IN-CITY ?AUTO_1773 ?AUTO_1772 ) ( IN-CITY ?AUTO_1769 ?AUTO_1772 ) ( not ( = ?AUTO_1769 ?AUTO_1773 ) ) ( not ( = ?AUTO_1768 ?AUTO_1773 ) ) ( OBJ-AT ?AUTO_1767 ?AUTO_1773 ) ( TRUCK-AT ?AUTO_1771 ?AUTO_1774 ) ( IN-CITY ?AUTO_1774 ?AUTO_1772 ) ( not ( = ?AUTO_1773 ?AUTO_1774 ) ) ( not ( = ?AUTO_1768 ?AUTO_1774 ) ) ( not ( = ?AUTO_1769 ?AUTO_1774 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1771 ?AUTO_1774 ?AUTO_1773 ?AUTO_1772 )
      ( DELIVER-PKG ?AUTO_1767 ?AUTO_1768 )
      ( DELIVER-PKG-VERIFY ?AUTO_1767 ?AUTO_1768 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1781 - OBJ
      ?AUTO_1782 - LOCATION
    )
    :vars
    (
      ?AUTO_1783 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1783 ?AUTO_1782 ) ( IN-TRUCK ?AUTO_1781 ?AUTO_1783 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1781 ?AUTO_1783 ?AUTO_1782 )
      ( DELIVER-PKG-VERIFY ?AUTO_1781 ?AUTO_1782 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1784 - OBJ
      ?AUTO_1785 - LOCATION
    )
    :vars
    (
      ?AUTO_1786 - TRUCK
      ?AUTO_1787 - LOCATION
      ?AUTO_1788 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1784 ?AUTO_1786 ) ( TRUCK-AT ?AUTO_1786 ?AUTO_1787 ) ( IN-CITY ?AUTO_1787 ?AUTO_1788 ) ( IN-CITY ?AUTO_1785 ?AUTO_1788 ) ( not ( = ?AUTO_1785 ?AUTO_1787 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1786 ?AUTO_1787 ?AUTO_1785 ?AUTO_1788 )
      ( DELIVER-PKG ?AUTO_1784 ?AUTO_1785 )
      ( DELIVER-PKG-VERIFY ?AUTO_1784 ?AUTO_1785 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1791 - OBJ
      ?AUTO_1792 - LOCATION
    )
    :vars
    (
      ?AUTO_1793 - TRUCK
      ?AUTO_1795 - LOCATION
      ?AUTO_1794 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1793 ?AUTO_1795 ) ( IN-CITY ?AUTO_1795 ?AUTO_1794 ) ( IN-CITY ?AUTO_1792 ?AUTO_1794 ) ( not ( = ?AUTO_1792 ?AUTO_1795 ) ) ( OBJ-AT ?AUTO_1791 ?AUTO_1795 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1791 ?AUTO_1793 ?AUTO_1795 )
      ( DELIVER-PKG ?AUTO_1791 ?AUTO_1792 )
      ( DELIVER-PKG-VERIFY ?AUTO_1791 ?AUTO_1792 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1798 - OBJ
      ?AUTO_1799 - LOCATION
    )
    :vars
    (
      ?AUTO_1800 - TRUCK
      ?AUTO_1801 - LOCATION
      ?AUTO_1802 - CITY
      ?AUTO_1803 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1800 ?AUTO_1801 ) ( IN-CITY ?AUTO_1801 ?AUTO_1802 ) ( IN-CITY ?AUTO_1799 ?AUTO_1802 ) ( not ( = ?AUTO_1799 ?AUTO_1801 ) ) ( IN-AIRPLANE ?AUTO_1798 ?AUTO_1803 ) ( AIRPLANE-AT ?AUTO_1803 ?AUTO_1801 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1798 ?AUTO_1803 ?AUTO_1801 )
      ( DELIVER-PKG ?AUTO_1798 ?AUTO_1799 )
      ( DELIVER-PKG-VERIFY ?AUTO_1798 ?AUTO_1799 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1804 - OBJ
      ?AUTO_1805 - LOCATION
    )
    :vars
    (
      ?AUTO_1807 - TRUCK
      ?AUTO_1808 - LOCATION
      ?AUTO_1806 - CITY
      ?AUTO_1809 - AIRPLANE
      ?AUTO_1810 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1807 ?AUTO_1808 ) ( IN-CITY ?AUTO_1808 ?AUTO_1806 ) ( IN-CITY ?AUTO_1805 ?AUTO_1806 ) ( not ( = ?AUTO_1805 ?AUTO_1808 ) ) ( IN-AIRPLANE ?AUTO_1804 ?AUTO_1809 ) ( AIRPORT ?AUTO_1810 ) ( AIRPORT ?AUTO_1808 ) ( AIRPLANE-AT ?AUTO_1809 ?AUTO_1810 ) ( not ( = ?AUTO_1810 ?AUTO_1808 ) ) ( not ( = ?AUTO_1805 ?AUTO_1810 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1809 ?AUTO_1810 ?AUTO_1808 )
      ( DELIVER-PKG ?AUTO_1804 ?AUTO_1805 )
      ( DELIVER-PKG-VERIFY ?AUTO_1804 ?AUTO_1805 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1813 - OBJ
      ?AUTO_1814 - LOCATION
    )
    :vars
    (
      ?AUTO_1818 - TRUCK
      ?AUTO_1817 - LOCATION
      ?AUTO_1819 - CITY
      ?AUTO_1816 - LOCATION
      ?AUTO_1815 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1818 ?AUTO_1817 ) ( IN-CITY ?AUTO_1817 ?AUTO_1819 ) ( IN-CITY ?AUTO_1814 ?AUTO_1819 ) ( not ( = ?AUTO_1814 ?AUTO_1817 ) ) ( AIRPORT ?AUTO_1816 ) ( AIRPORT ?AUTO_1817 ) ( AIRPLANE-AT ?AUTO_1815 ?AUTO_1816 ) ( not ( = ?AUTO_1816 ?AUTO_1817 ) ) ( not ( = ?AUTO_1814 ?AUTO_1816 ) ) ( OBJ-AT ?AUTO_1813 ?AUTO_1816 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1813 ?AUTO_1815 ?AUTO_1816 )
      ( DELIVER-PKG ?AUTO_1813 ?AUTO_1814 )
      ( DELIVER-PKG-VERIFY ?AUTO_1813 ?AUTO_1814 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1820 - OBJ
      ?AUTO_1821 - LOCATION
    )
    :vars
    (
      ?AUTO_1824 - TRUCK
      ?AUTO_1826 - LOCATION
      ?AUTO_1822 - CITY
      ?AUTO_1825 - LOCATION
      ?AUTO_1823 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1824 ?AUTO_1826 ) ( IN-CITY ?AUTO_1826 ?AUTO_1822 ) ( IN-CITY ?AUTO_1821 ?AUTO_1822 ) ( not ( = ?AUTO_1821 ?AUTO_1826 ) ) ( AIRPORT ?AUTO_1825 ) ( AIRPORT ?AUTO_1826 ) ( not ( = ?AUTO_1825 ?AUTO_1826 ) ) ( not ( = ?AUTO_1821 ?AUTO_1825 ) ) ( OBJ-AT ?AUTO_1820 ?AUTO_1825 ) ( AIRPLANE-AT ?AUTO_1823 ?AUTO_1826 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1823 ?AUTO_1826 ?AUTO_1825 )
      ( DELIVER-PKG ?AUTO_1820 ?AUTO_1821 )
      ( DELIVER-PKG-VERIFY ?AUTO_1820 ?AUTO_1821 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1843 - OBJ
      ?AUTO_1844 - LOCATION
    )
    :vars
    (
      ?AUTO_1849 - LOCATION
      ?AUTO_1847 - CITY
      ?AUTO_1845 - LOCATION
      ?AUTO_1846 - AIRPLANE
      ?AUTO_1848 - TRUCK
      ?AUTO_1850 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1849 ?AUTO_1847 ) ( IN-CITY ?AUTO_1844 ?AUTO_1847 ) ( not ( = ?AUTO_1844 ?AUTO_1849 ) ) ( AIRPORT ?AUTO_1845 ) ( AIRPORT ?AUTO_1849 ) ( not ( = ?AUTO_1845 ?AUTO_1849 ) ) ( not ( = ?AUTO_1844 ?AUTO_1845 ) ) ( OBJ-AT ?AUTO_1843 ?AUTO_1845 ) ( AIRPLANE-AT ?AUTO_1846 ?AUTO_1849 ) ( TRUCK-AT ?AUTO_1848 ?AUTO_1850 ) ( IN-CITY ?AUTO_1850 ?AUTO_1847 ) ( not ( = ?AUTO_1849 ?AUTO_1850 ) ) ( not ( = ?AUTO_1844 ?AUTO_1850 ) ) ( not ( = ?AUTO_1845 ?AUTO_1850 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1848 ?AUTO_1850 ?AUTO_1849 ?AUTO_1847 )
      ( DELIVER-PKG ?AUTO_1843 ?AUTO_1844 )
      ( DELIVER-PKG-VERIFY ?AUTO_1843 ?AUTO_1844 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1863 - OBJ
      ?AUTO_1864 - LOCATION
    )
    :vars
    (
      ?AUTO_1866 - LOCATION
      ?AUTO_1868 - CITY
      ?AUTO_1867 - LOCATION
      ?AUTO_1869 - AIRPLANE
      ?AUTO_1865 - TRUCK
      ?AUTO_1870 - LOCATION
      ?AUTO_1871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1866 ?AUTO_1868 ) ( IN-CITY ?AUTO_1864 ?AUTO_1868 ) ( not ( = ?AUTO_1864 ?AUTO_1866 ) ) ( AIRPORT ?AUTO_1867 ) ( AIRPORT ?AUTO_1866 ) ( not ( = ?AUTO_1867 ?AUTO_1866 ) ) ( not ( = ?AUTO_1864 ?AUTO_1867 ) ) ( AIRPLANE-AT ?AUTO_1869 ?AUTO_1866 ) ( TRUCK-AT ?AUTO_1865 ?AUTO_1870 ) ( IN-CITY ?AUTO_1870 ?AUTO_1868 ) ( not ( = ?AUTO_1866 ?AUTO_1870 ) ) ( not ( = ?AUTO_1864 ?AUTO_1870 ) ) ( not ( = ?AUTO_1867 ?AUTO_1870 ) ) ( TRUCK-AT ?AUTO_1871 ?AUTO_1867 ) ( IN-TRUCK ?AUTO_1863 ?AUTO_1871 ) ( not ( = ?AUTO_1865 ?AUTO_1871 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1863 ?AUTO_1871 ?AUTO_1867 )
      ( DELIVER-PKG ?AUTO_1863 ?AUTO_1864 )
      ( DELIVER-PKG-VERIFY ?AUTO_1863 ?AUTO_1864 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1872 - OBJ
      ?AUTO_1873 - LOCATION
    )
    :vars
    (
      ?AUTO_1875 - LOCATION
      ?AUTO_1879 - CITY
      ?AUTO_1880 - LOCATION
      ?AUTO_1878 - AIRPLANE
      ?AUTO_1876 - TRUCK
      ?AUTO_1874 - LOCATION
      ?AUTO_1877 - TRUCK
      ?AUTO_1881 - LOCATION
      ?AUTO_1882 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1875 ?AUTO_1879 ) ( IN-CITY ?AUTO_1873 ?AUTO_1879 ) ( not ( = ?AUTO_1873 ?AUTO_1875 ) ) ( AIRPORT ?AUTO_1880 ) ( AIRPORT ?AUTO_1875 ) ( not ( = ?AUTO_1880 ?AUTO_1875 ) ) ( not ( = ?AUTO_1873 ?AUTO_1880 ) ) ( AIRPLANE-AT ?AUTO_1878 ?AUTO_1875 ) ( TRUCK-AT ?AUTO_1876 ?AUTO_1874 ) ( IN-CITY ?AUTO_1874 ?AUTO_1879 ) ( not ( = ?AUTO_1875 ?AUTO_1874 ) ) ( not ( = ?AUTO_1873 ?AUTO_1874 ) ) ( not ( = ?AUTO_1880 ?AUTO_1874 ) ) ( IN-TRUCK ?AUTO_1872 ?AUTO_1877 ) ( not ( = ?AUTO_1876 ?AUTO_1877 ) ) ( TRUCK-AT ?AUTO_1877 ?AUTO_1881 ) ( IN-CITY ?AUTO_1881 ?AUTO_1882 ) ( IN-CITY ?AUTO_1880 ?AUTO_1882 ) ( not ( = ?AUTO_1880 ?AUTO_1881 ) ) ( not ( = ?AUTO_1873 ?AUTO_1881 ) ) ( not ( = ?AUTO_1875 ?AUTO_1881 ) ) ( not ( = ?AUTO_1879 ?AUTO_1882 ) ) ( not ( = ?AUTO_1874 ?AUTO_1881 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1877 ?AUTO_1881 ?AUTO_1880 ?AUTO_1882 )
      ( DELIVER-PKG ?AUTO_1872 ?AUTO_1873 )
      ( DELIVER-PKG-VERIFY ?AUTO_1872 ?AUTO_1873 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1887 - OBJ
      ?AUTO_1888 - LOCATION
    )
    :vars
    (
      ?AUTO_1891 - LOCATION
      ?AUTO_1892 - CITY
      ?AUTO_1896 - LOCATION
      ?AUTO_1893 - AIRPLANE
      ?AUTO_1895 - TRUCK
      ?AUTO_1889 - LOCATION
      ?AUTO_1897 - TRUCK
      ?AUTO_1894 - LOCATION
      ?AUTO_1890 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1891 ?AUTO_1892 ) ( IN-CITY ?AUTO_1888 ?AUTO_1892 ) ( not ( = ?AUTO_1888 ?AUTO_1891 ) ) ( AIRPORT ?AUTO_1896 ) ( AIRPORT ?AUTO_1891 ) ( not ( = ?AUTO_1896 ?AUTO_1891 ) ) ( not ( = ?AUTO_1888 ?AUTO_1896 ) ) ( AIRPLANE-AT ?AUTO_1893 ?AUTO_1891 ) ( TRUCK-AT ?AUTO_1895 ?AUTO_1889 ) ( IN-CITY ?AUTO_1889 ?AUTO_1892 ) ( not ( = ?AUTO_1891 ?AUTO_1889 ) ) ( not ( = ?AUTO_1888 ?AUTO_1889 ) ) ( not ( = ?AUTO_1896 ?AUTO_1889 ) ) ( not ( = ?AUTO_1895 ?AUTO_1897 ) ) ( TRUCK-AT ?AUTO_1897 ?AUTO_1894 ) ( IN-CITY ?AUTO_1894 ?AUTO_1890 ) ( IN-CITY ?AUTO_1896 ?AUTO_1890 ) ( not ( = ?AUTO_1896 ?AUTO_1894 ) ) ( not ( = ?AUTO_1888 ?AUTO_1894 ) ) ( not ( = ?AUTO_1891 ?AUTO_1894 ) ) ( not ( = ?AUTO_1892 ?AUTO_1890 ) ) ( not ( = ?AUTO_1889 ?AUTO_1894 ) ) ( OBJ-AT ?AUTO_1887 ?AUTO_1894 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1887 ?AUTO_1897 ?AUTO_1894 )
      ( DELIVER-PKG ?AUTO_1887 ?AUTO_1888 )
      ( DELIVER-PKG-VERIFY ?AUTO_1887 ?AUTO_1888 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1898 - OBJ
      ?AUTO_1899 - LOCATION
    )
    :vars
    (
      ?AUTO_1901 - LOCATION
      ?AUTO_1907 - CITY
      ?AUTO_1904 - LOCATION
      ?AUTO_1903 - AIRPLANE
      ?AUTO_1906 - TRUCK
      ?AUTO_1900 - LOCATION
      ?AUTO_1905 - TRUCK
      ?AUTO_1902 - LOCATION
      ?AUTO_1908 - CITY
      ?AUTO_1909 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1901 ?AUTO_1907 ) ( IN-CITY ?AUTO_1899 ?AUTO_1907 ) ( not ( = ?AUTO_1899 ?AUTO_1901 ) ) ( AIRPORT ?AUTO_1904 ) ( AIRPORT ?AUTO_1901 ) ( not ( = ?AUTO_1904 ?AUTO_1901 ) ) ( not ( = ?AUTO_1899 ?AUTO_1904 ) ) ( AIRPLANE-AT ?AUTO_1903 ?AUTO_1901 ) ( TRUCK-AT ?AUTO_1906 ?AUTO_1900 ) ( IN-CITY ?AUTO_1900 ?AUTO_1907 ) ( not ( = ?AUTO_1901 ?AUTO_1900 ) ) ( not ( = ?AUTO_1899 ?AUTO_1900 ) ) ( not ( = ?AUTO_1904 ?AUTO_1900 ) ) ( not ( = ?AUTO_1906 ?AUTO_1905 ) ) ( IN-CITY ?AUTO_1902 ?AUTO_1908 ) ( IN-CITY ?AUTO_1904 ?AUTO_1908 ) ( not ( = ?AUTO_1904 ?AUTO_1902 ) ) ( not ( = ?AUTO_1899 ?AUTO_1902 ) ) ( not ( = ?AUTO_1901 ?AUTO_1902 ) ) ( not ( = ?AUTO_1907 ?AUTO_1908 ) ) ( not ( = ?AUTO_1900 ?AUTO_1902 ) ) ( OBJ-AT ?AUTO_1898 ?AUTO_1902 ) ( TRUCK-AT ?AUTO_1905 ?AUTO_1909 ) ( IN-CITY ?AUTO_1909 ?AUTO_1908 ) ( not ( = ?AUTO_1902 ?AUTO_1909 ) ) ( not ( = ?AUTO_1899 ?AUTO_1909 ) ) ( not ( = ?AUTO_1901 ?AUTO_1909 ) ) ( not ( = ?AUTO_1904 ?AUTO_1909 ) ) ( not ( = ?AUTO_1900 ?AUTO_1909 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1905 ?AUTO_1909 ?AUTO_1902 ?AUTO_1908 )
      ( DELIVER-PKG ?AUTO_1898 ?AUTO_1899 )
      ( DELIVER-PKG-VERIFY ?AUTO_1898 ?AUTO_1899 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1912 - OBJ
      ?AUTO_1913 - LOCATION
    )
    :vars
    (
      ?AUTO_1914 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1914 ?AUTO_1913 ) ( IN-TRUCK ?AUTO_1912 ?AUTO_1914 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1912 ?AUTO_1914 ?AUTO_1913 )
      ( DELIVER-PKG-VERIFY ?AUTO_1912 ?AUTO_1913 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1953 - OBJ
      ?AUTO_1954 - LOCATION
    )
    :vars
    (
      ?AUTO_1958 - LOCATION
      ?AUTO_1955 - CITY
      ?AUTO_1956 - LOCATION
      ?AUTO_1957 - AIRPLANE
      ?AUTO_1959 - TRUCK
      ?AUTO_1960 - LOCATION
      ?AUTO_1961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1958 ?AUTO_1955 ) ( IN-CITY ?AUTO_1954 ?AUTO_1955 ) ( not ( = ?AUTO_1954 ?AUTO_1958 ) ) ( AIRPORT ?AUTO_1956 ) ( AIRPORT ?AUTO_1958 ) ( not ( = ?AUTO_1956 ?AUTO_1958 ) ) ( not ( = ?AUTO_1954 ?AUTO_1956 ) ) ( AIRPLANE-AT ?AUTO_1957 ?AUTO_1958 ) ( TRUCK-AT ?AUTO_1959 ?AUTO_1960 ) ( IN-CITY ?AUTO_1960 ?AUTO_1955 ) ( not ( = ?AUTO_1958 ?AUTO_1960 ) ) ( not ( = ?AUTO_1954 ?AUTO_1960 ) ) ( not ( = ?AUTO_1956 ?AUTO_1960 ) ) ( TRUCK-AT ?AUTO_1961 ?AUTO_1956 ) ( IN-TRUCK ?AUTO_1953 ?AUTO_1961 ) ( not ( = ?AUTO_1959 ?AUTO_1961 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1953 ?AUTO_1961 ?AUTO_1956 )
      ( DELIVER-PKG ?AUTO_1953 ?AUTO_1954 )
      ( DELIVER-PKG-VERIFY ?AUTO_1953 ?AUTO_1954 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1962 - OBJ
      ?AUTO_1963 - LOCATION
    )
    :vars
    (
      ?AUTO_1967 - LOCATION
      ?AUTO_1964 - CITY
      ?AUTO_1969 - LOCATION
      ?AUTO_1968 - AIRPLANE
      ?AUTO_1966 - TRUCK
      ?AUTO_1965 - LOCATION
      ?AUTO_1970 - TRUCK
      ?AUTO_1971 - LOCATION
      ?AUTO_1972 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1967 ?AUTO_1964 ) ( IN-CITY ?AUTO_1963 ?AUTO_1964 ) ( not ( = ?AUTO_1963 ?AUTO_1967 ) ) ( AIRPORT ?AUTO_1969 ) ( AIRPORT ?AUTO_1967 ) ( not ( = ?AUTO_1969 ?AUTO_1967 ) ) ( not ( = ?AUTO_1963 ?AUTO_1969 ) ) ( AIRPLANE-AT ?AUTO_1968 ?AUTO_1967 ) ( TRUCK-AT ?AUTO_1966 ?AUTO_1965 ) ( IN-CITY ?AUTO_1965 ?AUTO_1964 ) ( not ( = ?AUTO_1967 ?AUTO_1965 ) ) ( not ( = ?AUTO_1963 ?AUTO_1965 ) ) ( not ( = ?AUTO_1969 ?AUTO_1965 ) ) ( IN-TRUCK ?AUTO_1962 ?AUTO_1970 ) ( not ( = ?AUTO_1966 ?AUTO_1970 ) ) ( TRUCK-AT ?AUTO_1970 ?AUTO_1971 ) ( IN-CITY ?AUTO_1971 ?AUTO_1972 ) ( IN-CITY ?AUTO_1969 ?AUTO_1972 ) ( not ( = ?AUTO_1969 ?AUTO_1971 ) ) ( not ( = ?AUTO_1963 ?AUTO_1971 ) ) ( not ( = ?AUTO_1967 ?AUTO_1971 ) ) ( not ( = ?AUTO_1964 ?AUTO_1972 ) ) ( not ( = ?AUTO_1965 ?AUTO_1971 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1970 ?AUTO_1971 ?AUTO_1969 ?AUTO_1972 )
      ( DELIVER-PKG ?AUTO_1962 ?AUTO_1963 )
      ( DELIVER-PKG-VERIFY ?AUTO_1962 ?AUTO_1963 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1973 - OBJ
      ?AUTO_1974 - LOCATION
    )
    :vars
    (
      ?AUTO_1983 - LOCATION
      ?AUTO_1979 - CITY
      ?AUTO_1982 - LOCATION
      ?AUTO_1981 - AIRPLANE
      ?AUTO_1977 - TRUCK
      ?AUTO_1978 - LOCATION
      ?AUTO_1976 - TRUCK
      ?AUTO_1980 - LOCATION
      ?AUTO_1975 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1983 ?AUTO_1979 ) ( IN-CITY ?AUTO_1974 ?AUTO_1979 ) ( not ( = ?AUTO_1974 ?AUTO_1983 ) ) ( AIRPORT ?AUTO_1982 ) ( AIRPORT ?AUTO_1983 ) ( not ( = ?AUTO_1982 ?AUTO_1983 ) ) ( not ( = ?AUTO_1974 ?AUTO_1982 ) ) ( AIRPLANE-AT ?AUTO_1981 ?AUTO_1983 ) ( TRUCK-AT ?AUTO_1977 ?AUTO_1978 ) ( IN-CITY ?AUTO_1978 ?AUTO_1979 ) ( not ( = ?AUTO_1983 ?AUTO_1978 ) ) ( not ( = ?AUTO_1974 ?AUTO_1978 ) ) ( not ( = ?AUTO_1982 ?AUTO_1978 ) ) ( not ( = ?AUTO_1977 ?AUTO_1976 ) ) ( TRUCK-AT ?AUTO_1976 ?AUTO_1980 ) ( IN-CITY ?AUTO_1980 ?AUTO_1975 ) ( IN-CITY ?AUTO_1982 ?AUTO_1975 ) ( not ( = ?AUTO_1982 ?AUTO_1980 ) ) ( not ( = ?AUTO_1974 ?AUTO_1980 ) ) ( not ( = ?AUTO_1983 ?AUTO_1980 ) ) ( not ( = ?AUTO_1979 ?AUTO_1975 ) ) ( not ( = ?AUTO_1978 ?AUTO_1980 ) ) ( OBJ-AT ?AUTO_1973 ?AUTO_1980 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1973 ?AUTO_1976 ?AUTO_1980 )
      ( DELIVER-PKG ?AUTO_1973 ?AUTO_1974 )
      ( DELIVER-PKG-VERIFY ?AUTO_1973 ?AUTO_1974 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1984 - OBJ
      ?AUTO_1985 - LOCATION
    )
    :vars
    (
      ?AUTO_1994 - LOCATION
      ?AUTO_1988 - CITY
      ?AUTO_1989 - LOCATION
      ?AUTO_1991 - AIRPLANE
      ?AUTO_1992 - TRUCK
      ?AUTO_1993 - LOCATION
      ?AUTO_1986 - TRUCK
      ?AUTO_1990 - LOCATION
      ?AUTO_1987 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1994 ?AUTO_1988 ) ( IN-CITY ?AUTO_1985 ?AUTO_1988 ) ( not ( = ?AUTO_1985 ?AUTO_1994 ) ) ( AIRPORT ?AUTO_1989 ) ( AIRPORT ?AUTO_1994 ) ( not ( = ?AUTO_1989 ?AUTO_1994 ) ) ( not ( = ?AUTO_1985 ?AUTO_1989 ) ) ( AIRPLANE-AT ?AUTO_1991 ?AUTO_1994 ) ( TRUCK-AT ?AUTO_1992 ?AUTO_1993 ) ( IN-CITY ?AUTO_1993 ?AUTO_1988 ) ( not ( = ?AUTO_1994 ?AUTO_1993 ) ) ( not ( = ?AUTO_1985 ?AUTO_1993 ) ) ( not ( = ?AUTO_1989 ?AUTO_1993 ) ) ( not ( = ?AUTO_1992 ?AUTO_1986 ) ) ( IN-CITY ?AUTO_1990 ?AUTO_1987 ) ( IN-CITY ?AUTO_1989 ?AUTO_1987 ) ( not ( = ?AUTO_1989 ?AUTO_1990 ) ) ( not ( = ?AUTO_1985 ?AUTO_1990 ) ) ( not ( = ?AUTO_1994 ?AUTO_1990 ) ) ( not ( = ?AUTO_1988 ?AUTO_1987 ) ) ( not ( = ?AUTO_1993 ?AUTO_1990 ) ) ( OBJ-AT ?AUTO_1984 ?AUTO_1990 ) ( TRUCK-AT ?AUTO_1986 ?AUTO_1989 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1986 ?AUTO_1989 ?AUTO_1990 ?AUTO_1987 )
      ( DELIVER-PKG ?AUTO_1984 ?AUTO_1985 )
      ( DELIVER-PKG-VERIFY ?AUTO_1984 ?AUTO_1985 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2013 - OBJ
      ?AUTO_2014 - LOCATION
    )
    :vars
    (
      ?AUTO_2015 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2015 ?AUTO_2014 ) ( IN-TRUCK ?AUTO_2013 ?AUTO_2015 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2013 ?AUTO_2015 ?AUTO_2014 )
      ( DELIVER-PKG-VERIFY ?AUTO_2013 ?AUTO_2014 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2016 - OBJ
      ?AUTO_2017 - LOCATION
    )
    :vars
    (
      ?AUTO_2018 - TRUCK
      ?AUTO_2019 - LOCATION
      ?AUTO_2020 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2016 ?AUTO_2018 ) ( TRUCK-AT ?AUTO_2018 ?AUTO_2019 ) ( IN-CITY ?AUTO_2019 ?AUTO_2020 ) ( IN-CITY ?AUTO_2017 ?AUTO_2020 ) ( not ( = ?AUTO_2017 ?AUTO_2019 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2018 ?AUTO_2019 ?AUTO_2017 ?AUTO_2020 )
      ( DELIVER-PKG ?AUTO_2016 ?AUTO_2017 )
      ( DELIVER-PKG-VERIFY ?AUTO_2016 ?AUTO_2017 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2027 - OBJ
      ?AUTO_2028 - LOCATION
    )
    :vars
    (
      ?AUTO_2031 - TRUCK
      ?AUTO_2029 - LOCATION
      ?AUTO_2030 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2031 ?AUTO_2029 ) ( IN-CITY ?AUTO_2029 ?AUTO_2030 ) ( IN-CITY ?AUTO_2028 ?AUTO_2030 ) ( not ( = ?AUTO_2028 ?AUTO_2029 ) ) ( OBJ-AT ?AUTO_2027 ?AUTO_2029 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2027 ?AUTO_2031 ?AUTO_2029 )
      ( DELIVER-PKG ?AUTO_2027 ?AUTO_2028 )
      ( DELIVER-PKG-VERIFY ?AUTO_2027 ?AUTO_2028 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2034 - OBJ
      ?AUTO_2035 - LOCATION
    )
    :vars
    (
      ?AUTO_2036 - TRUCK
      ?AUTO_2038 - LOCATION
      ?AUTO_2037 - CITY
      ?AUTO_2039 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2036 ?AUTO_2038 ) ( IN-CITY ?AUTO_2038 ?AUTO_2037 ) ( IN-CITY ?AUTO_2035 ?AUTO_2037 ) ( not ( = ?AUTO_2035 ?AUTO_2038 ) ) ( IN-AIRPLANE ?AUTO_2034 ?AUTO_2039 ) ( AIRPLANE-AT ?AUTO_2039 ?AUTO_2038 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2034 ?AUTO_2039 ?AUTO_2038 )
      ( DELIVER-PKG ?AUTO_2034 ?AUTO_2035 )
      ( DELIVER-PKG-VERIFY ?AUTO_2034 ?AUTO_2035 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2044 - OBJ
      ?AUTO_2045 - LOCATION
    )
    :vars
    (
      ?AUTO_2050 - TRUCK
      ?AUTO_2048 - LOCATION
      ?AUTO_2049 - CITY
      ?AUTO_2046 - LOCATION
      ?AUTO_2047 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2050 ?AUTO_2048 ) ( IN-CITY ?AUTO_2048 ?AUTO_2049 ) ( IN-CITY ?AUTO_2045 ?AUTO_2049 ) ( not ( = ?AUTO_2045 ?AUTO_2048 ) ) ( AIRPORT ?AUTO_2046 ) ( AIRPORT ?AUTO_2048 ) ( AIRPLANE-AT ?AUTO_2047 ?AUTO_2046 ) ( not ( = ?AUTO_2046 ?AUTO_2048 ) ) ( not ( = ?AUTO_2045 ?AUTO_2046 ) ) ( OBJ-AT ?AUTO_2044 ?AUTO_2046 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2044 ?AUTO_2047 ?AUTO_2046 )
      ( DELIVER-PKG ?AUTO_2044 ?AUTO_2045 )
      ( DELIVER-PKG-VERIFY ?AUTO_2044 ?AUTO_2045 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2071 - OBJ
      ?AUTO_2072 - LOCATION
    )
    :vars
    (
      ?AUTO_2075 - LOCATION
      ?AUTO_2073 - CITY
      ?AUTO_2077 - LOCATION
      ?AUTO_2074 - AIRPLANE
      ?AUTO_2076 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2075 ?AUTO_2073 ) ( IN-CITY ?AUTO_2072 ?AUTO_2073 ) ( not ( = ?AUTO_2072 ?AUTO_2075 ) ) ( AIRPORT ?AUTO_2077 ) ( AIRPORT ?AUTO_2075 ) ( not ( = ?AUTO_2077 ?AUTO_2075 ) ) ( not ( = ?AUTO_2072 ?AUTO_2077 ) ) ( OBJ-AT ?AUTO_2071 ?AUTO_2077 ) ( AIRPLANE-AT ?AUTO_2074 ?AUTO_2075 ) ( TRUCK-AT ?AUTO_2076 ?AUTO_2072 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2076 ?AUTO_2072 ?AUTO_2075 ?AUTO_2073 )
      ( DELIVER-PKG ?AUTO_2071 ?AUTO_2072 )
      ( DELIVER-PKG-VERIFY ?AUTO_2071 ?AUTO_2072 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2088 - OBJ
      ?AUTO_2089 - LOCATION
    )
    :vars
    (
      ?AUTO_2091 - LOCATION
      ?AUTO_2094 - CITY
      ?AUTO_2090 - LOCATION
      ?AUTO_2093 - AIRPLANE
      ?AUTO_2092 - TRUCK
      ?AUTO_2095 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2091 ?AUTO_2094 ) ( IN-CITY ?AUTO_2089 ?AUTO_2094 ) ( not ( = ?AUTO_2089 ?AUTO_2091 ) ) ( AIRPORT ?AUTO_2090 ) ( AIRPORT ?AUTO_2091 ) ( not ( = ?AUTO_2090 ?AUTO_2091 ) ) ( not ( = ?AUTO_2089 ?AUTO_2090 ) ) ( AIRPLANE-AT ?AUTO_2093 ?AUTO_2091 ) ( TRUCK-AT ?AUTO_2092 ?AUTO_2089 ) ( TRUCK-AT ?AUTO_2095 ?AUTO_2090 ) ( IN-TRUCK ?AUTO_2088 ?AUTO_2095 ) ( not ( = ?AUTO_2092 ?AUTO_2095 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2088 ?AUTO_2095 ?AUTO_2090 )
      ( DELIVER-PKG ?AUTO_2088 ?AUTO_2089 )
      ( DELIVER-PKG-VERIFY ?AUTO_2088 ?AUTO_2089 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2098 - OBJ
      ?AUTO_2099 - LOCATION
    )
    :vars
    (
      ?AUTO_2102 - LOCATION
      ?AUTO_2104 - CITY
      ?AUTO_2100 - LOCATION
      ?AUTO_2101 - AIRPLANE
      ?AUTO_2103 - TRUCK
      ?AUTO_2105 - TRUCK
      ?AUTO_2106 - LOCATION
      ?AUTO_2107 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2102 ?AUTO_2104 ) ( IN-CITY ?AUTO_2099 ?AUTO_2104 ) ( not ( = ?AUTO_2099 ?AUTO_2102 ) ) ( AIRPORT ?AUTO_2100 ) ( AIRPORT ?AUTO_2102 ) ( not ( = ?AUTO_2100 ?AUTO_2102 ) ) ( not ( = ?AUTO_2099 ?AUTO_2100 ) ) ( AIRPLANE-AT ?AUTO_2101 ?AUTO_2102 ) ( TRUCK-AT ?AUTO_2103 ?AUTO_2099 ) ( IN-TRUCK ?AUTO_2098 ?AUTO_2105 ) ( not ( = ?AUTO_2103 ?AUTO_2105 ) ) ( TRUCK-AT ?AUTO_2105 ?AUTO_2106 ) ( IN-CITY ?AUTO_2106 ?AUTO_2107 ) ( IN-CITY ?AUTO_2100 ?AUTO_2107 ) ( not ( = ?AUTO_2100 ?AUTO_2106 ) ) ( not ( = ?AUTO_2099 ?AUTO_2106 ) ) ( not ( = ?AUTO_2102 ?AUTO_2106 ) ) ( not ( = ?AUTO_2104 ?AUTO_2107 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2105 ?AUTO_2106 ?AUTO_2100 ?AUTO_2107 )
      ( DELIVER-PKG ?AUTO_2098 ?AUTO_2099 )
      ( DELIVER-PKG-VERIFY ?AUTO_2098 ?AUTO_2099 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2108 - OBJ
      ?AUTO_2109 - LOCATION
    )
    :vars
    (
      ?AUTO_2116 - LOCATION
      ?AUTO_2114 - CITY
      ?AUTO_2117 - LOCATION
      ?AUTO_2111 - AIRPLANE
      ?AUTO_2112 - TRUCK
      ?AUTO_2110 - TRUCK
      ?AUTO_2115 - LOCATION
      ?AUTO_2113 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2116 ?AUTO_2114 ) ( IN-CITY ?AUTO_2109 ?AUTO_2114 ) ( not ( = ?AUTO_2109 ?AUTO_2116 ) ) ( AIRPORT ?AUTO_2117 ) ( AIRPORT ?AUTO_2116 ) ( not ( = ?AUTO_2117 ?AUTO_2116 ) ) ( not ( = ?AUTO_2109 ?AUTO_2117 ) ) ( AIRPLANE-AT ?AUTO_2111 ?AUTO_2116 ) ( TRUCK-AT ?AUTO_2112 ?AUTO_2109 ) ( not ( = ?AUTO_2112 ?AUTO_2110 ) ) ( TRUCK-AT ?AUTO_2110 ?AUTO_2115 ) ( IN-CITY ?AUTO_2115 ?AUTO_2113 ) ( IN-CITY ?AUTO_2117 ?AUTO_2113 ) ( not ( = ?AUTO_2117 ?AUTO_2115 ) ) ( not ( = ?AUTO_2109 ?AUTO_2115 ) ) ( not ( = ?AUTO_2116 ?AUTO_2115 ) ) ( not ( = ?AUTO_2114 ?AUTO_2113 ) ) ( OBJ-AT ?AUTO_2108 ?AUTO_2115 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2108 ?AUTO_2110 ?AUTO_2115 )
      ( DELIVER-PKG ?AUTO_2108 ?AUTO_2109 )
      ( DELIVER-PKG-VERIFY ?AUTO_2108 ?AUTO_2109 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2118 - OBJ
      ?AUTO_2119 - LOCATION
    )
    :vars
    (
      ?AUTO_2120 - LOCATION
      ?AUTO_2125 - CITY
      ?AUTO_2126 - LOCATION
      ?AUTO_2123 - AIRPLANE
      ?AUTO_2124 - TRUCK
      ?AUTO_2121 - TRUCK
      ?AUTO_2122 - LOCATION
      ?AUTO_2127 - CITY
      ?AUTO_2128 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2120 ?AUTO_2125 ) ( IN-CITY ?AUTO_2119 ?AUTO_2125 ) ( not ( = ?AUTO_2119 ?AUTO_2120 ) ) ( AIRPORT ?AUTO_2126 ) ( AIRPORT ?AUTO_2120 ) ( not ( = ?AUTO_2126 ?AUTO_2120 ) ) ( not ( = ?AUTO_2119 ?AUTO_2126 ) ) ( AIRPLANE-AT ?AUTO_2123 ?AUTO_2120 ) ( TRUCK-AT ?AUTO_2124 ?AUTO_2119 ) ( not ( = ?AUTO_2124 ?AUTO_2121 ) ) ( IN-CITY ?AUTO_2122 ?AUTO_2127 ) ( IN-CITY ?AUTO_2126 ?AUTO_2127 ) ( not ( = ?AUTO_2126 ?AUTO_2122 ) ) ( not ( = ?AUTO_2119 ?AUTO_2122 ) ) ( not ( = ?AUTO_2120 ?AUTO_2122 ) ) ( not ( = ?AUTO_2125 ?AUTO_2127 ) ) ( OBJ-AT ?AUTO_2118 ?AUTO_2122 ) ( TRUCK-AT ?AUTO_2121 ?AUTO_2128 ) ( IN-CITY ?AUTO_2128 ?AUTO_2127 ) ( not ( = ?AUTO_2122 ?AUTO_2128 ) ) ( not ( = ?AUTO_2119 ?AUTO_2128 ) ) ( not ( = ?AUTO_2120 ?AUTO_2128 ) ) ( not ( = ?AUTO_2126 ?AUTO_2128 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2121 ?AUTO_2128 ?AUTO_2122 ?AUTO_2127 )
      ( DELIVER-PKG ?AUTO_2118 ?AUTO_2119 )
      ( DELIVER-PKG-VERIFY ?AUTO_2118 ?AUTO_2119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2131 - OBJ
      ?AUTO_2132 - LOCATION
    )
    :vars
    (
      ?AUTO_2133 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2133 ?AUTO_2132 ) ( IN-TRUCK ?AUTO_2131 ?AUTO_2133 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2131 ?AUTO_2133 ?AUTO_2132 )
      ( DELIVER-PKG-VERIFY ?AUTO_2131 ?AUTO_2132 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2134 - OBJ
      ?AUTO_2135 - LOCATION
    )
    :vars
    (
      ?AUTO_2136 - TRUCK
      ?AUTO_2137 - LOCATION
      ?AUTO_2138 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2134 ?AUTO_2136 ) ( TRUCK-AT ?AUTO_2136 ?AUTO_2137 ) ( IN-CITY ?AUTO_2137 ?AUTO_2138 ) ( IN-CITY ?AUTO_2135 ?AUTO_2138 ) ( not ( = ?AUTO_2135 ?AUTO_2137 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2136 ?AUTO_2137 ?AUTO_2135 ?AUTO_2138 )
      ( DELIVER-PKG ?AUTO_2134 ?AUTO_2135 )
      ( DELIVER-PKG-VERIFY ?AUTO_2134 ?AUTO_2135 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2139 - OBJ
      ?AUTO_2140 - LOCATION
    )
    :vars
    (
      ?AUTO_2141 - TRUCK
      ?AUTO_2142 - LOCATION
      ?AUTO_2143 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2141 ?AUTO_2142 ) ( IN-CITY ?AUTO_2142 ?AUTO_2143 ) ( IN-CITY ?AUTO_2140 ?AUTO_2143 ) ( not ( = ?AUTO_2140 ?AUTO_2142 ) ) ( OBJ-AT ?AUTO_2139 ?AUTO_2142 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2139 ?AUTO_2141 ?AUTO_2142 )
      ( DELIVER-PKG ?AUTO_2139 ?AUTO_2140 )
      ( DELIVER-PKG-VERIFY ?AUTO_2139 ?AUTO_2140 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2146 - OBJ
      ?AUTO_2147 - LOCATION
    )
    :vars
    (
      ?AUTO_2148 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2146 ?AUTO_2148 ) ( AIRPLANE-AT ?AUTO_2148 ?AUTO_2147 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2146 ?AUTO_2148 ?AUTO_2147 )
      ( DELIVER-PKG-VERIFY ?AUTO_2146 ?AUTO_2147 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2149 - OBJ
      ?AUTO_2150 - LOCATION
    )
    :vars
    (
      ?AUTO_2151 - AIRPLANE
      ?AUTO_2152 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2149 ?AUTO_2151 ) ( AIRPORT ?AUTO_2152 ) ( AIRPORT ?AUTO_2150 ) ( AIRPLANE-AT ?AUTO_2151 ?AUTO_2152 ) ( not ( = ?AUTO_2152 ?AUTO_2150 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2151 ?AUTO_2152 ?AUTO_2150 )
      ( DELIVER-PKG ?AUTO_2149 ?AUTO_2150 )
      ( DELIVER-PKG-VERIFY ?AUTO_2149 ?AUTO_2150 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2155 - OBJ
      ?AUTO_2156 - LOCATION
    )
    :vars
    (
      ?AUTO_2158 - LOCATION
      ?AUTO_2157 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2158 ) ( AIRPORT ?AUTO_2156 ) ( AIRPLANE-AT ?AUTO_2157 ?AUTO_2158 ) ( not ( = ?AUTO_2158 ?AUTO_2156 ) ) ( OBJ-AT ?AUTO_2155 ?AUTO_2158 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2155 ?AUTO_2157 ?AUTO_2158 )
      ( DELIVER-PKG ?AUTO_2155 ?AUTO_2156 )
      ( DELIVER-PKG-VERIFY ?AUTO_2155 ?AUTO_2156 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2159 - OBJ
      ?AUTO_2160 - LOCATION
    )
    :vars
    (
      ?AUTO_2162 - LOCATION
      ?AUTO_2163 - LOCATION
      ?AUTO_2161 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2162 ) ( AIRPORT ?AUTO_2160 ) ( not ( = ?AUTO_2162 ?AUTO_2160 ) ) ( OBJ-AT ?AUTO_2159 ?AUTO_2162 ) ( AIRPORT ?AUTO_2163 ) ( AIRPLANE-AT ?AUTO_2161 ?AUTO_2163 ) ( not ( = ?AUTO_2163 ?AUTO_2162 ) ) ( not ( = ?AUTO_2160 ?AUTO_2163 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2161 ?AUTO_2163 ?AUTO_2162 )
      ( DELIVER-PKG ?AUTO_2159 ?AUTO_2160 )
      ( DELIVER-PKG-VERIFY ?AUTO_2159 ?AUTO_2160 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2170 - OBJ
      ?AUTO_2171 - LOCATION
    )
    :vars
    (
      ?AUTO_2172 - LOCATION
      ?AUTO_2174 - LOCATION
      ?AUTO_2173 - AIRPLANE
      ?AUTO_2175 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2172 ) ( AIRPORT ?AUTO_2171 ) ( not ( = ?AUTO_2172 ?AUTO_2171 ) ) ( AIRPORT ?AUTO_2174 ) ( AIRPLANE-AT ?AUTO_2173 ?AUTO_2174 ) ( not ( = ?AUTO_2174 ?AUTO_2172 ) ) ( not ( = ?AUTO_2171 ?AUTO_2174 ) ) ( TRUCK-AT ?AUTO_2175 ?AUTO_2172 ) ( IN-TRUCK ?AUTO_2170 ?AUTO_2175 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2170 ?AUTO_2175 ?AUTO_2172 )
      ( DELIVER-PKG ?AUTO_2170 ?AUTO_2171 )
      ( DELIVER-PKG-VERIFY ?AUTO_2170 ?AUTO_2171 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2176 - OBJ
      ?AUTO_2177 - LOCATION
    )
    :vars
    (
      ?AUTO_2180 - LOCATION
      ?AUTO_2179 - LOCATION
      ?AUTO_2178 - AIRPLANE
      ?AUTO_2181 - TRUCK
      ?AUTO_2182 - LOCATION
      ?AUTO_2183 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2180 ) ( AIRPORT ?AUTO_2177 ) ( not ( = ?AUTO_2180 ?AUTO_2177 ) ) ( AIRPORT ?AUTO_2179 ) ( AIRPLANE-AT ?AUTO_2178 ?AUTO_2179 ) ( not ( = ?AUTO_2179 ?AUTO_2180 ) ) ( not ( = ?AUTO_2177 ?AUTO_2179 ) ) ( IN-TRUCK ?AUTO_2176 ?AUTO_2181 ) ( TRUCK-AT ?AUTO_2181 ?AUTO_2182 ) ( IN-CITY ?AUTO_2182 ?AUTO_2183 ) ( IN-CITY ?AUTO_2180 ?AUTO_2183 ) ( not ( = ?AUTO_2180 ?AUTO_2182 ) ) ( not ( = ?AUTO_2177 ?AUTO_2182 ) ) ( not ( = ?AUTO_2179 ?AUTO_2182 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2181 ?AUTO_2182 ?AUTO_2180 ?AUTO_2183 )
      ( DELIVER-PKG ?AUTO_2176 ?AUTO_2177 )
      ( DELIVER-PKG-VERIFY ?AUTO_2176 ?AUTO_2177 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2184 - OBJ
      ?AUTO_2185 - LOCATION
    )
    :vars
    (
      ?AUTO_2191 - LOCATION
      ?AUTO_2187 - LOCATION
      ?AUTO_2186 - AIRPLANE
      ?AUTO_2190 - TRUCK
      ?AUTO_2188 - LOCATION
      ?AUTO_2189 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2191 ) ( AIRPORT ?AUTO_2185 ) ( not ( = ?AUTO_2191 ?AUTO_2185 ) ) ( AIRPORT ?AUTO_2187 ) ( AIRPLANE-AT ?AUTO_2186 ?AUTO_2187 ) ( not ( = ?AUTO_2187 ?AUTO_2191 ) ) ( not ( = ?AUTO_2185 ?AUTO_2187 ) ) ( TRUCK-AT ?AUTO_2190 ?AUTO_2188 ) ( IN-CITY ?AUTO_2188 ?AUTO_2189 ) ( IN-CITY ?AUTO_2191 ?AUTO_2189 ) ( not ( = ?AUTO_2191 ?AUTO_2188 ) ) ( not ( = ?AUTO_2185 ?AUTO_2188 ) ) ( not ( = ?AUTO_2187 ?AUTO_2188 ) ) ( OBJ-AT ?AUTO_2184 ?AUTO_2188 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2184 ?AUTO_2190 ?AUTO_2188 )
      ( DELIVER-PKG ?AUTO_2184 ?AUTO_2185 )
      ( DELIVER-PKG-VERIFY ?AUTO_2184 ?AUTO_2185 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2194 - OBJ
      ?AUTO_2195 - LOCATION
    )
    :vars
    (
      ?AUTO_2196 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2196 ?AUTO_2195 ) ( IN-TRUCK ?AUTO_2194 ?AUTO_2196 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2194 ?AUTO_2196 ?AUTO_2195 )
      ( DELIVER-PKG-VERIFY ?AUTO_2194 ?AUTO_2195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2201 - OBJ
      ?AUTO_2202 - LOCATION
    )
    :vars
    (
      ?AUTO_2203 - TRUCK
      ?AUTO_2204 - LOCATION
      ?AUTO_2205 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2201 ?AUTO_2203 ) ( TRUCK-AT ?AUTO_2203 ?AUTO_2204 ) ( IN-CITY ?AUTO_2204 ?AUTO_2205 ) ( IN-CITY ?AUTO_2202 ?AUTO_2205 ) ( not ( = ?AUTO_2202 ?AUTO_2204 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2203 ?AUTO_2204 ?AUTO_2202 ?AUTO_2205 )
      ( DELIVER-PKG ?AUTO_2201 ?AUTO_2202 )
      ( DELIVER-PKG-VERIFY ?AUTO_2201 ?AUTO_2202 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2208 - OBJ
      ?AUTO_2209 - LOCATION
    )
    :vars
    (
      ?AUTO_2211 - TRUCK
      ?AUTO_2212 - LOCATION
      ?AUTO_2210 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2211 ?AUTO_2212 ) ( IN-CITY ?AUTO_2212 ?AUTO_2210 ) ( IN-CITY ?AUTO_2209 ?AUTO_2210 ) ( not ( = ?AUTO_2209 ?AUTO_2212 ) ) ( OBJ-AT ?AUTO_2208 ?AUTO_2212 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2208 ?AUTO_2211 ?AUTO_2212 )
      ( DELIVER-PKG ?AUTO_2208 ?AUTO_2209 )
      ( DELIVER-PKG-VERIFY ?AUTO_2208 ?AUTO_2209 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2213 - OBJ
      ?AUTO_2214 - LOCATION
    )
    :vars
    (
      ?AUTO_2217 - TRUCK
      ?AUTO_2216 - LOCATION
      ?AUTO_2215 - CITY
      ?AUTO_2218 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2217 ?AUTO_2216 ) ( IN-CITY ?AUTO_2216 ?AUTO_2215 ) ( IN-CITY ?AUTO_2214 ?AUTO_2215 ) ( not ( = ?AUTO_2214 ?AUTO_2216 ) ) ( IN-AIRPLANE ?AUTO_2213 ?AUTO_2218 ) ( AIRPLANE-AT ?AUTO_2218 ?AUTO_2216 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2213 ?AUTO_2218 ?AUTO_2216 )
      ( DELIVER-PKG ?AUTO_2213 ?AUTO_2214 )
      ( DELIVER-PKG-VERIFY ?AUTO_2213 ?AUTO_2214 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2219 - OBJ
      ?AUTO_2220 - LOCATION
    )
    :vars
    (
      ?AUTO_2224 - TRUCK
      ?AUTO_2221 - LOCATION
      ?AUTO_2222 - CITY
      ?AUTO_2223 - AIRPLANE
      ?AUTO_2225 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2224 ?AUTO_2221 ) ( IN-CITY ?AUTO_2221 ?AUTO_2222 ) ( IN-CITY ?AUTO_2220 ?AUTO_2222 ) ( not ( = ?AUTO_2220 ?AUTO_2221 ) ) ( IN-AIRPLANE ?AUTO_2219 ?AUTO_2223 ) ( AIRPORT ?AUTO_2225 ) ( AIRPORT ?AUTO_2221 ) ( AIRPLANE-AT ?AUTO_2223 ?AUTO_2225 ) ( not ( = ?AUTO_2225 ?AUTO_2221 ) ) ( not ( = ?AUTO_2220 ?AUTO_2225 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2223 ?AUTO_2225 ?AUTO_2221 )
      ( DELIVER-PKG ?AUTO_2219 ?AUTO_2220 )
      ( DELIVER-PKG-VERIFY ?AUTO_2219 ?AUTO_2220 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2228 - OBJ
      ?AUTO_2229 - LOCATION
    )
    :vars
    (
      ?AUTO_2233 - TRUCK
      ?AUTO_2232 - LOCATION
      ?AUTO_2234 - CITY
      ?AUTO_2231 - LOCATION
      ?AUTO_2230 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2233 ?AUTO_2232 ) ( IN-CITY ?AUTO_2232 ?AUTO_2234 ) ( IN-CITY ?AUTO_2229 ?AUTO_2234 ) ( not ( = ?AUTO_2229 ?AUTO_2232 ) ) ( AIRPORT ?AUTO_2231 ) ( AIRPORT ?AUTO_2232 ) ( AIRPLANE-AT ?AUTO_2230 ?AUTO_2231 ) ( not ( = ?AUTO_2231 ?AUTO_2232 ) ) ( not ( = ?AUTO_2229 ?AUTO_2231 ) ) ( OBJ-AT ?AUTO_2228 ?AUTO_2231 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2228 ?AUTO_2230 ?AUTO_2231 )
      ( DELIVER-PKG ?AUTO_2228 ?AUTO_2229 )
      ( DELIVER-PKG-VERIFY ?AUTO_2228 ?AUTO_2229 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2235 - OBJ
      ?AUTO_2236 - LOCATION
    )
    :vars
    (
      ?AUTO_2240 - TRUCK
      ?AUTO_2237 - LOCATION
      ?AUTO_2241 - CITY
      ?AUTO_2239 - LOCATION
      ?AUTO_2242 - LOCATION
      ?AUTO_2238 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2240 ?AUTO_2237 ) ( IN-CITY ?AUTO_2237 ?AUTO_2241 ) ( IN-CITY ?AUTO_2236 ?AUTO_2241 ) ( not ( = ?AUTO_2236 ?AUTO_2237 ) ) ( AIRPORT ?AUTO_2239 ) ( AIRPORT ?AUTO_2237 ) ( not ( = ?AUTO_2239 ?AUTO_2237 ) ) ( not ( = ?AUTO_2236 ?AUTO_2239 ) ) ( OBJ-AT ?AUTO_2235 ?AUTO_2239 ) ( AIRPORT ?AUTO_2242 ) ( AIRPLANE-AT ?AUTO_2238 ?AUTO_2242 ) ( not ( = ?AUTO_2242 ?AUTO_2239 ) ) ( not ( = ?AUTO_2236 ?AUTO_2242 ) ) ( not ( = ?AUTO_2237 ?AUTO_2242 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2238 ?AUTO_2242 ?AUTO_2239 )
      ( DELIVER-PKG ?AUTO_2235 ?AUTO_2236 )
      ( DELIVER-PKG-VERIFY ?AUTO_2235 ?AUTO_2236 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2249 - OBJ
      ?AUTO_2250 - LOCATION
    )
    :vars
    (
      ?AUTO_2255 - TRUCK
      ?AUTO_2256 - LOCATION
      ?AUTO_2252 - CITY
      ?AUTO_2253 - LOCATION
      ?AUTO_2254 - LOCATION
      ?AUTO_2251 - AIRPLANE
      ?AUTO_2257 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2255 ?AUTO_2256 ) ( IN-CITY ?AUTO_2256 ?AUTO_2252 ) ( IN-CITY ?AUTO_2250 ?AUTO_2252 ) ( not ( = ?AUTO_2250 ?AUTO_2256 ) ) ( AIRPORT ?AUTO_2253 ) ( AIRPORT ?AUTO_2256 ) ( not ( = ?AUTO_2253 ?AUTO_2256 ) ) ( not ( = ?AUTO_2250 ?AUTO_2253 ) ) ( AIRPORT ?AUTO_2254 ) ( AIRPLANE-AT ?AUTO_2251 ?AUTO_2254 ) ( not ( = ?AUTO_2254 ?AUTO_2253 ) ) ( not ( = ?AUTO_2250 ?AUTO_2254 ) ) ( not ( = ?AUTO_2256 ?AUTO_2254 ) ) ( TRUCK-AT ?AUTO_2257 ?AUTO_2253 ) ( IN-TRUCK ?AUTO_2249 ?AUTO_2257 ) ( not ( = ?AUTO_2255 ?AUTO_2257 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2249 ?AUTO_2257 ?AUTO_2253 )
      ( DELIVER-PKG ?AUTO_2249 ?AUTO_2250 )
      ( DELIVER-PKG-VERIFY ?AUTO_2249 ?AUTO_2250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2258 - OBJ
      ?AUTO_2259 - LOCATION
    )
    :vars
    (
      ?AUTO_2265 - TRUCK
      ?AUTO_2262 - LOCATION
      ?AUTO_2260 - CITY
      ?AUTO_2264 - LOCATION
      ?AUTO_2263 - LOCATION
      ?AUTO_2261 - AIRPLANE
      ?AUTO_2266 - TRUCK
      ?AUTO_2267 - LOCATION
      ?AUTO_2268 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2265 ?AUTO_2262 ) ( IN-CITY ?AUTO_2262 ?AUTO_2260 ) ( IN-CITY ?AUTO_2259 ?AUTO_2260 ) ( not ( = ?AUTO_2259 ?AUTO_2262 ) ) ( AIRPORT ?AUTO_2264 ) ( AIRPORT ?AUTO_2262 ) ( not ( = ?AUTO_2264 ?AUTO_2262 ) ) ( not ( = ?AUTO_2259 ?AUTO_2264 ) ) ( AIRPORT ?AUTO_2263 ) ( AIRPLANE-AT ?AUTO_2261 ?AUTO_2263 ) ( not ( = ?AUTO_2263 ?AUTO_2264 ) ) ( not ( = ?AUTO_2259 ?AUTO_2263 ) ) ( not ( = ?AUTO_2262 ?AUTO_2263 ) ) ( IN-TRUCK ?AUTO_2258 ?AUTO_2266 ) ( not ( = ?AUTO_2265 ?AUTO_2266 ) ) ( TRUCK-AT ?AUTO_2266 ?AUTO_2267 ) ( IN-CITY ?AUTO_2267 ?AUTO_2268 ) ( IN-CITY ?AUTO_2264 ?AUTO_2268 ) ( not ( = ?AUTO_2264 ?AUTO_2267 ) ) ( not ( = ?AUTO_2259 ?AUTO_2267 ) ) ( not ( = ?AUTO_2262 ?AUTO_2267 ) ) ( not ( = ?AUTO_2260 ?AUTO_2268 ) ) ( not ( = ?AUTO_2263 ?AUTO_2267 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2266 ?AUTO_2267 ?AUTO_2264 ?AUTO_2268 )
      ( DELIVER-PKG ?AUTO_2258 ?AUTO_2259 )
      ( DELIVER-PKG-VERIFY ?AUTO_2258 ?AUTO_2259 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2269 - OBJ
      ?AUTO_2270 - LOCATION
    )
    :vars
    (
      ?AUTO_2273 - TRUCK
      ?AUTO_2279 - LOCATION
      ?AUTO_2275 - CITY
      ?AUTO_2271 - LOCATION
      ?AUTO_2272 - LOCATION
      ?AUTO_2277 - AIRPLANE
      ?AUTO_2274 - TRUCK
      ?AUTO_2278 - LOCATION
      ?AUTO_2276 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2273 ?AUTO_2279 ) ( IN-CITY ?AUTO_2279 ?AUTO_2275 ) ( IN-CITY ?AUTO_2270 ?AUTO_2275 ) ( not ( = ?AUTO_2270 ?AUTO_2279 ) ) ( AIRPORT ?AUTO_2271 ) ( AIRPORT ?AUTO_2279 ) ( not ( = ?AUTO_2271 ?AUTO_2279 ) ) ( not ( = ?AUTO_2270 ?AUTO_2271 ) ) ( AIRPORT ?AUTO_2272 ) ( AIRPLANE-AT ?AUTO_2277 ?AUTO_2272 ) ( not ( = ?AUTO_2272 ?AUTO_2271 ) ) ( not ( = ?AUTO_2270 ?AUTO_2272 ) ) ( not ( = ?AUTO_2279 ?AUTO_2272 ) ) ( not ( = ?AUTO_2273 ?AUTO_2274 ) ) ( TRUCK-AT ?AUTO_2274 ?AUTO_2278 ) ( IN-CITY ?AUTO_2278 ?AUTO_2276 ) ( IN-CITY ?AUTO_2271 ?AUTO_2276 ) ( not ( = ?AUTO_2271 ?AUTO_2278 ) ) ( not ( = ?AUTO_2270 ?AUTO_2278 ) ) ( not ( = ?AUTO_2279 ?AUTO_2278 ) ) ( not ( = ?AUTO_2275 ?AUTO_2276 ) ) ( not ( = ?AUTO_2272 ?AUTO_2278 ) ) ( OBJ-AT ?AUTO_2269 ?AUTO_2278 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2269 ?AUTO_2274 ?AUTO_2278 )
      ( DELIVER-PKG ?AUTO_2269 ?AUTO_2270 )
      ( DELIVER-PKG-VERIFY ?AUTO_2269 ?AUTO_2270 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2282 - OBJ
      ?AUTO_2283 - LOCATION
    )
    :vars
    (
      ?AUTO_2284 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2284 ?AUTO_2283 ) ( IN-TRUCK ?AUTO_2282 ?AUTO_2284 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2282 ?AUTO_2284 ?AUTO_2283 )
      ( DELIVER-PKG-VERIFY ?AUTO_2282 ?AUTO_2283 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2285 - OBJ
      ?AUTO_2286 - LOCATION
    )
    :vars
    (
      ?AUTO_2287 - TRUCK
      ?AUTO_2288 - LOCATION
      ?AUTO_2289 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2285 ?AUTO_2287 ) ( TRUCK-AT ?AUTO_2287 ?AUTO_2288 ) ( IN-CITY ?AUTO_2288 ?AUTO_2289 ) ( IN-CITY ?AUTO_2286 ?AUTO_2289 ) ( not ( = ?AUTO_2286 ?AUTO_2288 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2287 ?AUTO_2288 ?AUTO_2286 ?AUTO_2289 )
      ( DELIVER-PKG ?AUTO_2285 ?AUTO_2286 )
      ( DELIVER-PKG-VERIFY ?AUTO_2285 ?AUTO_2286 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2294 - OBJ
      ?AUTO_2295 - LOCATION
    )
    :vars
    (
      ?AUTO_2298 - TRUCK
      ?AUTO_2296 - LOCATION
      ?AUTO_2297 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2298 ?AUTO_2296 ) ( IN-CITY ?AUTO_2296 ?AUTO_2297 ) ( IN-CITY ?AUTO_2295 ?AUTO_2297 ) ( not ( = ?AUTO_2295 ?AUTO_2296 ) ) ( OBJ-AT ?AUTO_2294 ?AUTO_2296 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2294 ?AUTO_2298 ?AUTO_2296 )
      ( DELIVER-PKG ?AUTO_2294 ?AUTO_2295 )
      ( DELIVER-PKG-VERIFY ?AUTO_2294 ?AUTO_2295 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2299 - OBJ
      ?AUTO_2300 - LOCATION
    )
    :vars
    (
      ?AUTO_2302 - LOCATION
      ?AUTO_2301 - CITY
      ?AUTO_2303 - TRUCK
      ?AUTO_2304 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2302 ?AUTO_2301 ) ( IN-CITY ?AUTO_2300 ?AUTO_2301 ) ( not ( = ?AUTO_2300 ?AUTO_2302 ) ) ( OBJ-AT ?AUTO_2299 ?AUTO_2302 ) ( TRUCK-AT ?AUTO_2303 ?AUTO_2304 ) ( IN-CITY ?AUTO_2304 ?AUTO_2301 ) ( not ( = ?AUTO_2302 ?AUTO_2304 ) ) ( not ( = ?AUTO_2300 ?AUTO_2304 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2303 ?AUTO_2304 ?AUTO_2302 ?AUTO_2301 )
      ( DELIVER-PKG ?AUTO_2299 ?AUTO_2300 )
      ( DELIVER-PKG-VERIFY ?AUTO_2299 ?AUTO_2300 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2333 - OBJ
      ?AUTO_2334 - LOCATION
    )
    :vars
    (
      ?AUTO_2335 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2333 ?AUTO_2335 ) ( AIRPLANE-AT ?AUTO_2335 ?AUTO_2334 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2333 ?AUTO_2335 ?AUTO_2334 )
      ( DELIVER-PKG-VERIFY ?AUTO_2333 ?AUTO_2334 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2342 - OBJ
      ?AUTO_2343 - LOCATION
    )
    :vars
    (
      ?AUTO_2344 - AIRPLANE
      ?AUTO_2345 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2342 ?AUTO_2344 ) ( AIRPORT ?AUTO_2345 ) ( AIRPORT ?AUTO_2343 ) ( AIRPLANE-AT ?AUTO_2344 ?AUTO_2345 ) ( not ( = ?AUTO_2345 ?AUTO_2343 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2344 ?AUTO_2345 ?AUTO_2343 )
      ( DELIVER-PKG ?AUTO_2342 ?AUTO_2343 )
      ( DELIVER-PKG-VERIFY ?AUTO_2342 ?AUTO_2343 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2350 - OBJ
      ?AUTO_2351 - LOCATION
    )
    :vars
    (
      ?AUTO_2352 - LOCATION
      ?AUTO_2353 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2352 ) ( AIRPORT ?AUTO_2351 ) ( AIRPLANE-AT ?AUTO_2353 ?AUTO_2352 ) ( not ( = ?AUTO_2352 ?AUTO_2351 ) ) ( OBJ-AT ?AUTO_2350 ?AUTO_2352 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2350 ?AUTO_2353 ?AUTO_2352 )
      ( DELIVER-PKG ?AUTO_2350 ?AUTO_2351 )
      ( DELIVER-PKG-VERIFY ?AUTO_2350 ?AUTO_2351 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2358 - OBJ
      ?AUTO_2359 - LOCATION
    )
    :vars
    (
      ?AUTO_2361 - LOCATION
      ?AUTO_2362 - LOCATION
      ?AUTO_2360 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2361 ) ( AIRPORT ?AUTO_2359 ) ( not ( = ?AUTO_2361 ?AUTO_2359 ) ) ( OBJ-AT ?AUTO_2358 ?AUTO_2361 ) ( AIRPORT ?AUTO_2362 ) ( AIRPLANE-AT ?AUTO_2360 ?AUTO_2362 ) ( not ( = ?AUTO_2362 ?AUTO_2361 ) ) ( not ( = ?AUTO_2359 ?AUTO_2362 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2360 ?AUTO_2362 ?AUTO_2361 )
      ( DELIVER-PKG ?AUTO_2358 ?AUTO_2359 )
      ( DELIVER-PKG-VERIFY ?AUTO_2358 ?AUTO_2359 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2383 - OBJ
      ?AUTO_2384 - LOCATION
    )
    :vars
    (
      ?AUTO_2385 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2383 ?AUTO_2385 ) ( AIRPLANE-AT ?AUTO_2385 ?AUTO_2384 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2383 ?AUTO_2385 ?AUTO_2384 )
      ( DELIVER-PKG-VERIFY ?AUTO_2383 ?AUTO_2384 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2386 - OBJ
      ?AUTO_2387 - LOCATION
    )
    :vars
    (
      ?AUTO_2388 - AIRPLANE
      ?AUTO_2389 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2386 ?AUTO_2388 ) ( AIRPORT ?AUTO_2389 ) ( AIRPORT ?AUTO_2387 ) ( AIRPLANE-AT ?AUTO_2388 ?AUTO_2389 ) ( not ( = ?AUTO_2389 ?AUTO_2387 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2388 ?AUTO_2389 ?AUTO_2387 )
      ( DELIVER-PKG ?AUTO_2386 ?AUTO_2387 )
      ( DELIVER-PKG-VERIFY ?AUTO_2386 ?AUTO_2387 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2390 - OBJ
      ?AUTO_2391 - LOCATION
    )
    :vars
    (
      ?AUTO_2393 - LOCATION
      ?AUTO_2392 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2393 ) ( AIRPORT ?AUTO_2391 ) ( AIRPLANE-AT ?AUTO_2392 ?AUTO_2393 ) ( not ( = ?AUTO_2393 ?AUTO_2391 ) ) ( OBJ-AT ?AUTO_2390 ?AUTO_2393 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2390 ?AUTO_2392 ?AUTO_2393 )
      ( DELIVER-PKG ?AUTO_2390 ?AUTO_2391 )
      ( DELIVER-PKG-VERIFY ?AUTO_2390 ?AUTO_2391 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2396 - OBJ
      ?AUTO_2397 - LOCATION
    )
    :vars
    (
      ?AUTO_2399 - LOCATION
      ?AUTO_2400 - LOCATION
      ?AUTO_2398 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2399 ) ( AIRPORT ?AUTO_2397 ) ( not ( = ?AUTO_2399 ?AUTO_2397 ) ) ( OBJ-AT ?AUTO_2396 ?AUTO_2399 ) ( AIRPORT ?AUTO_2400 ) ( AIRPLANE-AT ?AUTO_2398 ?AUTO_2400 ) ( not ( = ?AUTO_2400 ?AUTO_2399 ) ) ( not ( = ?AUTO_2397 ?AUTO_2400 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2398 ?AUTO_2400 ?AUTO_2399 )
      ( DELIVER-PKG ?AUTO_2396 ?AUTO_2397 )
      ( DELIVER-PKG-VERIFY ?AUTO_2396 ?AUTO_2397 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2405 - OBJ
      ?AUTO_2406 - LOCATION
    )
    :vars
    (
      ?AUTO_2408 - LOCATION
      ?AUTO_2409 - LOCATION
      ?AUTO_2407 - AIRPLANE
      ?AUTO_2410 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2408 ) ( AIRPORT ?AUTO_2406 ) ( not ( = ?AUTO_2408 ?AUTO_2406 ) ) ( AIRPORT ?AUTO_2409 ) ( AIRPLANE-AT ?AUTO_2407 ?AUTO_2409 ) ( not ( = ?AUTO_2409 ?AUTO_2408 ) ) ( not ( = ?AUTO_2406 ?AUTO_2409 ) ) ( TRUCK-AT ?AUTO_2410 ?AUTO_2408 ) ( IN-TRUCK ?AUTO_2405 ?AUTO_2410 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2405 ?AUTO_2410 ?AUTO_2408 )
      ( DELIVER-PKG ?AUTO_2405 ?AUTO_2406 )
      ( DELIVER-PKG-VERIFY ?AUTO_2405 ?AUTO_2406 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2411 - OBJ
      ?AUTO_2412 - LOCATION
    )
    :vars
    (
      ?AUTO_2413 - LOCATION
      ?AUTO_2415 - LOCATION
      ?AUTO_2414 - AIRPLANE
      ?AUTO_2416 - TRUCK
      ?AUTO_2417 - LOCATION
      ?AUTO_2418 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2413 ) ( AIRPORT ?AUTO_2412 ) ( not ( = ?AUTO_2413 ?AUTO_2412 ) ) ( AIRPORT ?AUTO_2415 ) ( AIRPLANE-AT ?AUTO_2414 ?AUTO_2415 ) ( not ( = ?AUTO_2415 ?AUTO_2413 ) ) ( not ( = ?AUTO_2412 ?AUTO_2415 ) ) ( IN-TRUCK ?AUTO_2411 ?AUTO_2416 ) ( TRUCK-AT ?AUTO_2416 ?AUTO_2417 ) ( IN-CITY ?AUTO_2417 ?AUTO_2418 ) ( IN-CITY ?AUTO_2413 ?AUTO_2418 ) ( not ( = ?AUTO_2413 ?AUTO_2417 ) ) ( not ( = ?AUTO_2412 ?AUTO_2417 ) ) ( not ( = ?AUTO_2415 ?AUTO_2417 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2416 ?AUTO_2417 ?AUTO_2413 ?AUTO_2418 )
      ( DELIVER-PKG ?AUTO_2411 ?AUTO_2412 )
      ( DELIVER-PKG-VERIFY ?AUTO_2411 ?AUTO_2412 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2423 - OBJ
      ?AUTO_2424 - LOCATION
    )
    :vars
    (
      ?AUTO_2427 - LOCATION
      ?AUTO_2425 - LOCATION
      ?AUTO_2429 - AIRPLANE
      ?AUTO_2428 - TRUCK
      ?AUTO_2426 - LOCATION
      ?AUTO_2430 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2427 ) ( AIRPORT ?AUTO_2424 ) ( not ( = ?AUTO_2427 ?AUTO_2424 ) ) ( AIRPORT ?AUTO_2425 ) ( AIRPLANE-AT ?AUTO_2429 ?AUTO_2425 ) ( not ( = ?AUTO_2425 ?AUTO_2427 ) ) ( not ( = ?AUTO_2424 ?AUTO_2425 ) ) ( TRUCK-AT ?AUTO_2428 ?AUTO_2426 ) ( IN-CITY ?AUTO_2426 ?AUTO_2430 ) ( IN-CITY ?AUTO_2427 ?AUTO_2430 ) ( not ( = ?AUTO_2427 ?AUTO_2426 ) ) ( not ( = ?AUTO_2424 ?AUTO_2426 ) ) ( not ( = ?AUTO_2425 ?AUTO_2426 ) ) ( OBJ-AT ?AUTO_2423 ?AUTO_2426 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2423 ?AUTO_2428 ?AUTO_2426 )
      ( DELIVER-PKG ?AUTO_2423 ?AUTO_2424 )
      ( DELIVER-PKG-VERIFY ?AUTO_2423 ?AUTO_2424 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2431 - OBJ
      ?AUTO_2432 - LOCATION
    )
    :vars
    (
      ?AUTO_2438 - LOCATION
      ?AUTO_2434 - LOCATION
      ?AUTO_2436 - AIRPLANE
      ?AUTO_2433 - LOCATION
      ?AUTO_2435 - CITY
      ?AUTO_2437 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2438 ) ( AIRPORT ?AUTO_2432 ) ( not ( = ?AUTO_2438 ?AUTO_2432 ) ) ( AIRPORT ?AUTO_2434 ) ( AIRPLANE-AT ?AUTO_2436 ?AUTO_2434 ) ( not ( = ?AUTO_2434 ?AUTO_2438 ) ) ( not ( = ?AUTO_2432 ?AUTO_2434 ) ) ( IN-CITY ?AUTO_2433 ?AUTO_2435 ) ( IN-CITY ?AUTO_2438 ?AUTO_2435 ) ( not ( = ?AUTO_2438 ?AUTO_2433 ) ) ( not ( = ?AUTO_2432 ?AUTO_2433 ) ) ( not ( = ?AUTO_2434 ?AUTO_2433 ) ) ( OBJ-AT ?AUTO_2431 ?AUTO_2433 ) ( TRUCK-AT ?AUTO_2437 ?AUTO_2434 ) ( IN-CITY ?AUTO_2434 ?AUTO_2435 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2437 ?AUTO_2434 ?AUTO_2433 ?AUTO_2435 )
      ( DELIVER-PKG ?AUTO_2431 ?AUTO_2432 )
      ( DELIVER-PKG-VERIFY ?AUTO_2431 ?AUTO_2432 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2445 - OBJ
      ?AUTO_2446 - LOCATION
    )
    :vars
    (
      ?AUTO_2449 - LOCATION
      ?AUTO_2448 - LOCATION
      ?AUTO_2451 - LOCATION
      ?AUTO_2450 - CITY
      ?AUTO_2447 - TRUCK
      ?AUTO_2453 - LOCATION
      ?AUTO_2452 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2449 ) ( AIRPORT ?AUTO_2446 ) ( not ( = ?AUTO_2449 ?AUTO_2446 ) ) ( AIRPORT ?AUTO_2448 ) ( not ( = ?AUTO_2448 ?AUTO_2449 ) ) ( not ( = ?AUTO_2446 ?AUTO_2448 ) ) ( IN-CITY ?AUTO_2451 ?AUTO_2450 ) ( IN-CITY ?AUTO_2449 ?AUTO_2450 ) ( not ( = ?AUTO_2449 ?AUTO_2451 ) ) ( not ( = ?AUTO_2446 ?AUTO_2451 ) ) ( not ( = ?AUTO_2448 ?AUTO_2451 ) ) ( OBJ-AT ?AUTO_2445 ?AUTO_2451 ) ( TRUCK-AT ?AUTO_2447 ?AUTO_2448 ) ( IN-CITY ?AUTO_2448 ?AUTO_2450 ) ( AIRPORT ?AUTO_2453 ) ( AIRPLANE-AT ?AUTO_2452 ?AUTO_2453 ) ( not ( = ?AUTO_2453 ?AUTO_2448 ) ) ( not ( = ?AUTO_2446 ?AUTO_2453 ) ) ( not ( = ?AUTO_2449 ?AUTO_2453 ) ) ( not ( = ?AUTO_2451 ?AUTO_2453 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2452 ?AUTO_2453 ?AUTO_2448 )
      ( DELIVER-PKG ?AUTO_2445 ?AUTO_2446 )
      ( DELIVER-PKG-VERIFY ?AUTO_2445 ?AUTO_2446 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2474 - OBJ
      ?AUTO_2475 - LOCATION
    )
    :vars
    (
      ?AUTO_2476 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2474 ?AUTO_2476 ) ( AIRPLANE-AT ?AUTO_2476 ?AUTO_2475 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2474 ?AUTO_2476 ?AUTO_2475 )
      ( DELIVER-PKG-VERIFY ?AUTO_2474 ?AUTO_2475 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2479 - OBJ
      ?AUTO_2480 - LOCATION
    )
    :vars
    (
      ?AUTO_2481 - AIRPLANE
      ?AUTO_2482 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2479 ?AUTO_2481 ) ( AIRPORT ?AUTO_2482 ) ( AIRPORT ?AUTO_2480 ) ( AIRPLANE-AT ?AUTO_2481 ?AUTO_2482 ) ( not ( = ?AUTO_2482 ?AUTO_2480 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2481 ?AUTO_2482 ?AUTO_2480 )
      ( DELIVER-PKG ?AUTO_2479 ?AUTO_2480 )
      ( DELIVER-PKG-VERIFY ?AUTO_2479 ?AUTO_2480 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2491 - OBJ
      ?AUTO_2492 - LOCATION
    )
    :vars
    (
      ?AUTO_2493 - LOCATION
      ?AUTO_2494 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2493 ) ( AIRPORT ?AUTO_2492 ) ( not ( = ?AUTO_2493 ?AUTO_2492 ) ) ( OBJ-AT ?AUTO_2491 ?AUTO_2493 ) ( AIRPLANE-AT ?AUTO_2494 ?AUTO_2492 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2494 ?AUTO_2492 ?AUTO_2493 )
      ( DELIVER-PKG ?AUTO_2491 ?AUTO_2492 )
      ( DELIVER-PKG-VERIFY ?AUTO_2491 ?AUTO_2492 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2539 - OBJ
      ?AUTO_2540 - LOCATION
    )
    :vars
    (
      ?AUTO_2541 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2541 ?AUTO_2540 ) ( IN-TRUCK ?AUTO_2539 ?AUTO_2541 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2539 ?AUTO_2541 ?AUTO_2540 )
      ( DELIVER-PKG-VERIFY ?AUTO_2539 ?AUTO_2540 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2544 - OBJ
      ?AUTO_2545 - LOCATION
    )
    :vars
    (
      ?AUTO_2546 - TRUCK
      ?AUTO_2547 - LOCATION
      ?AUTO_2548 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2544 ?AUTO_2546 ) ( TRUCK-AT ?AUTO_2546 ?AUTO_2547 ) ( IN-CITY ?AUTO_2547 ?AUTO_2548 ) ( IN-CITY ?AUTO_2545 ?AUTO_2548 ) ( not ( = ?AUTO_2545 ?AUTO_2547 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2546 ?AUTO_2547 ?AUTO_2545 ?AUTO_2548 )
      ( DELIVER-PKG ?AUTO_2544 ?AUTO_2545 )
      ( DELIVER-PKG-VERIFY ?AUTO_2544 ?AUTO_2545 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2605 - OBJ
      ?AUTO_2606 - LOCATION
    )
    :vars
    (
      ?AUTO_2607 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2605 ?AUTO_2607 ) ( AIRPLANE-AT ?AUTO_2607 ?AUTO_2606 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2605 ?AUTO_2607 ?AUTO_2606 )
      ( DELIVER-PKG-VERIFY ?AUTO_2605 ?AUTO_2606 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2612 - OBJ
      ?AUTO_2613 - LOCATION
    )
    :vars
    (
      ?AUTO_2614 - AIRPLANE
      ?AUTO_2615 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2612 ?AUTO_2614 ) ( AIRPORT ?AUTO_2615 ) ( AIRPORT ?AUTO_2613 ) ( AIRPLANE-AT ?AUTO_2614 ?AUTO_2615 ) ( not ( = ?AUTO_2615 ?AUTO_2613 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2614 ?AUTO_2615 ?AUTO_2613 )
      ( DELIVER-PKG ?AUTO_2612 ?AUTO_2613 )
      ( DELIVER-PKG-VERIFY ?AUTO_2612 ?AUTO_2613 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2616 - OBJ
      ?AUTO_2617 - LOCATION
    )
    :vars
    (
      ?AUTO_2619 - LOCATION
      ?AUTO_2618 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2619 ) ( AIRPORT ?AUTO_2617 ) ( AIRPLANE-AT ?AUTO_2618 ?AUTO_2619 ) ( not ( = ?AUTO_2619 ?AUTO_2617 ) ) ( OBJ-AT ?AUTO_2616 ?AUTO_2619 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2616 ?AUTO_2618 ?AUTO_2619 )
      ( DELIVER-PKG ?AUTO_2616 ?AUTO_2617 )
      ( DELIVER-PKG-VERIFY ?AUTO_2616 ?AUTO_2617 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2620 - OBJ
      ?AUTO_2621 - LOCATION
    )
    :vars
    (
      ?AUTO_2623 - LOCATION
      ?AUTO_2622 - AIRPLANE
      ?AUTO_2624 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2623 ) ( AIRPORT ?AUTO_2621 ) ( AIRPLANE-AT ?AUTO_2622 ?AUTO_2623 ) ( not ( = ?AUTO_2623 ?AUTO_2621 ) ) ( TRUCK-AT ?AUTO_2624 ?AUTO_2623 ) ( IN-TRUCK ?AUTO_2620 ?AUTO_2624 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2620 ?AUTO_2624 ?AUTO_2623 )
      ( DELIVER-PKG ?AUTO_2620 ?AUTO_2621 )
      ( DELIVER-PKG-VERIFY ?AUTO_2620 ?AUTO_2621 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2627 - OBJ
      ?AUTO_2628 - LOCATION
    )
    :vars
    (
      ?AUTO_2631 - LOCATION
      ?AUTO_2629 - AIRPLANE
      ?AUTO_2630 - TRUCK
      ?AUTO_2632 - LOCATION
      ?AUTO_2633 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2631 ) ( AIRPORT ?AUTO_2628 ) ( AIRPLANE-AT ?AUTO_2629 ?AUTO_2631 ) ( not ( = ?AUTO_2631 ?AUTO_2628 ) ) ( IN-TRUCK ?AUTO_2627 ?AUTO_2630 ) ( TRUCK-AT ?AUTO_2630 ?AUTO_2632 ) ( IN-CITY ?AUTO_2632 ?AUTO_2633 ) ( IN-CITY ?AUTO_2631 ?AUTO_2633 ) ( not ( = ?AUTO_2631 ?AUTO_2632 ) ) ( not ( = ?AUTO_2628 ?AUTO_2632 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2630 ?AUTO_2632 ?AUTO_2631 ?AUTO_2633 )
      ( DELIVER-PKG ?AUTO_2627 ?AUTO_2628 )
      ( DELIVER-PKG-VERIFY ?AUTO_2627 ?AUTO_2628 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2634 - OBJ
      ?AUTO_2635 - LOCATION
    )
    :vars
    (
      ?AUTO_2636 - LOCATION
      ?AUTO_2638 - TRUCK
      ?AUTO_2640 - LOCATION
      ?AUTO_2639 - CITY
      ?AUTO_2641 - LOCATION
      ?AUTO_2637 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2636 ) ( AIRPORT ?AUTO_2635 ) ( not ( = ?AUTO_2636 ?AUTO_2635 ) ) ( IN-TRUCK ?AUTO_2634 ?AUTO_2638 ) ( TRUCK-AT ?AUTO_2638 ?AUTO_2640 ) ( IN-CITY ?AUTO_2640 ?AUTO_2639 ) ( IN-CITY ?AUTO_2636 ?AUTO_2639 ) ( not ( = ?AUTO_2636 ?AUTO_2640 ) ) ( not ( = ?AUTO_2635 ?AUTO_2640 ) ) ( AIRPORT ?AUTO_2641 ) ( AIRPLANE-AT ?AUTO_2637 ?AUTO_2641 ) ( not ( = ?AUTO_2641 ?AUTO_2636 ) ) ( not ( = ?AUTO_2635 ?AUTO_2641 ) ) ( not ( = ?AUTO_2640 ?AUTO_2641 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2637 ?AUTO_2641 ?AUTO_2636 )
      ( DELIVER-PKG ?AUTO_2634 ?AUTO_2635 )
      ( DELIVER-PKG-VERIFY ?AUTO_2634 ?AUTO_2635 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2644 - OBJ
      ?AUTO_2645 - LOCATION
    )
    :vars
    (
      ?AUTO_2647 - LOCATION
      ?AUTO_2650 - TRUCK
      ?AUTO_2646 - LOCATION
      ?AUTO_2648 - CITY
      ?AUTO_2649 - LOCATION
      ?AUTO_2651 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2647 ) ( AIRPORT ?AUTO_2645 ) ( not ( = ?AUTO_2647 ?AUTO_2645 ) ) ( IN-TRUCK ?AUTO_2644 ?AUTO_2650 ) ( TRUCK-AT ?AUTO_2650 ?AUTO_2646 ) ( IN-CITY ?AUTO_2646 ?AUTO_2648 ) ( IN-CITY ?AUTO_2647 ?AUTO_2648 ) ( not ( = ?AUTO_2647 ?AUTO_2646 ) ) ( not ( = ?AUTO_2645 ?AUTO_2646 ) ) ( AIRPORT ?AUTO_2649 ) ( not ( = ?AUTO_2649 ?AUTO_2647 ) ) ( not ( = ?AUTO_2645 ?AUTO_2649 ) ) ( not ( = ?AUTO_2646 ?AUTO_2649 ) ) ( AIRPLANE-AT ?AUTO_2651 ?AUTO_2645 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2651 ?AUTO_2645 ?AUTO_2649 )
      ( DELIVER-PKG ?AUTO_2644 ?AUTO_2645 )
      ( DELIVER-PKG-VERIFY ?AUTO_2644 ?AUTO_2645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2702 - OBJ
      ?AUTO_2703 - LOCATION
    )
    :vars
    (
      ?AUTO_2704 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2704 ?AUTO_2703 ) ( IN-TRUCK ?AUTO_2702 ?AUTO_2704 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2702 ?AUTO_2704 ?AUTO_2703 )
      ( DELIVER-PKG-VERIFY ?AUTO_2702 ?AUTO_2703 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2707 - OBJ
      ?AUTO_2708 - LOCATION
    )
    :vars
    (
      ?AUTO_2709 - TRUCK
      ?AUTO_2710 - LOCATION
      ?AUTO_2711 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2707 ?AUTO_2709 ) ( TRUCK-AT ?AUTO_2709 ?AUTO_2710 ) ( IN-CITY ?AUTO_2710 ?AUTO_2711 ) ( IN-CITY ?AUTO_2708 ?AUTO_2711 ) ( not ( = ?AUTO_2708 ?AUTO_2710 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2709 ?AUTO_2710 ?AUTO_2708 ?AUTO_2711 )
      ( DELIVER-PKG ?AUTO_2707 ?AUTO_2708 )
      ( DELIVER-PKG-VERIFY ?AUTO_2707 ?AUTO_2708 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2712 - OBJ
      ?AUTO_2713 - LOCATION
    )
    :vars
    (
      ?AUTO_2714 - TRUCK
      ?AUTO_2715 - LOCATION
      ?AUTO_2716 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2714 ?AUTO_2715 ) ( IN-CITY ?AUTO_2715 ?AUTO_2716 ) ( IN-CITY ?AUTO_2713 ?AUTO_2716 ) ( not ( = ?AUTO_2713 ?AUTO_2715 ) ) ( OBJ-AT ?AUTO_2712 ?AUTO_2715 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2712 ?AUTO_2714 ?AUTO_2715 )
      ( DELIVER-PKG ?AUTO_2712 ?AUTO_2713 )
      ( DELIVER-PKG-VERIFY ?AUTO_2712 ?AUTO_2713 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2723 - OBJ
      ?AUTO_2724 - LOCATION
    )
    :vars
    (
      ?AUTO_2727 - TRUCK
      ?AUTO_2725 - LOCATION
      ?AUTO_2726 - CITY
      ?AUTO_2728 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2727 ?AUTO_2725 ) ( IN-CITY ?AUTO_2725 ?AUTO_2726 ) ( IN-CITY ?AUTO_2724 ?AUTO_2726 ) ( not ( = ?AUTO_2724 ?AUTO_2725 ) ) ( IN-AIRPLANE ?AUTO_2723 ?AUTO_2728 ) ( AIRPLANE-AT ?AUTO_2728 ?AUTO_2725 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2723 ?AUTO_2728 ?AUTO_2725 )
      ( DELIVER-PKG ?AUTO_2723 ?AUTO_2724 )
      ( DELIVER-PKG-VERIFY ?AUTO_2723 ?AUTO_2724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2731 - OBJ
      ?AUTO_2732 - LOCATION
    )
    :vars
    (
      ?AUTO_2733 - TRUCK
      ?AUTO_2736 - LOCATION
      ?AUTO_2734 - CITY
      ?AUTO_2735 - AIRPLANE
      ?AUTO_2737 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2733 ?AUTO_2736 ) ( IN-CITY ?AUTO_2736 ?AUTO_2734 ) ( IN-CITY ?AUTO_2732 ?AUTO_2734 ) ( not ( = ?AUTO_2732 ?AUTO_2736 ) ) ( IN-AIRPLANE ?AUTO_2731 ?AUTO_2735 ) ( AIRPORT ?AUTO_2737 ) ( AIRPORT ?AUTO_2736 ) ( AIRPLANE-AT ?AUTO_2735 ?AUTO_2737 ) ( not ( = ?AUTO_2737 ?AUTO_2736 ) ) ( not ( = ?AUTO_2732 ?AUTO_2737 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2735 ?AUTO_2737 ?AUTO_2736 )
      ( DELIVER-PKG ?AUTO_2731 ?AUTO_2732 )
      ( DELIVER-PKG-VERIFY ?AUTO_2731 ?AUTO_2732 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2744 - OBJ
      ?AUTO_2745 - LOCATION
    )
    :vars
    (
      ?AUTO_2748 - TRUCK
      ?AUTO_2747 - LOCATION
      ?AUTO_2750 - CITY
      ?AUTO_2746 - LOCATION
      ?AUTO_2749 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2748 ?AUTO_2747 ) ( IN-CITY ?AUTO_2747 ?AUTO_2750 ) ( IN-CITY ?AUTO_2745 ?AUTO_2750 ) ( not ( = ?AUTO_2745 ?AUTO_2747 ) ) ( AIRPORT ?AUTO_2746 ) ( AIRPORT ?AUTO_2747 ) ( AIRPLANE-AT ?AUTO_2749 ?AUTO_2746 ) ( not ( = ?AUTO_2746 ?AUTO_2747 ) ) ( not ( = ?AUTO_2745 ?AUTO_2746 ) ) ( OBJ-AT ?AUTO_2744 ?AUTO_2746 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2744 ?AUTO_2749 ?AUTO_2746 )
      ( DELIVER-PKG ?AUTO_2744 ?AUTO_2745 )
      ( DELIVER-PKG-VERIFY ?AUTO_2744 ?AUTO_2745 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2751 - OBJ
      ?AUTO_2752 - LOCATION
    )
    :vars
    (
      ?AUTO_2757 - TRUCK
      ?AUTO_2753 - LOCATION
      ?AUTO_2755 - CITY
      ?AUTO_2754 - LOCATION
      ?AUTO_2756 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2757 ?AUTO_2753 ) ( IN-CITY ?AUTO_2753 ?AUTO_2755 ) ( IN-CITY ?AUTO_2752 ?AUTO_2755 ) ( not ( = ?AUTO_2752 ?AUTO_2753 ) ) ( AIRPORT ?AUTO_2754 ) ( AIRPORT ?AUTO_2753 ) ( not ( = ?AUTO_2754 ?AUTO_2753 ) ) ( not ( = ?AUTO_2752 ?AUTO_2754 ) ) ( OBJ-AT ?AUTO_2751 ?AUTO_2754 ) ( AIRPLANE-AT ?AUTO_2756 ?AUTO_2753 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2756 ?AUTO_2753 ?AUTO_2754 )
      ( DELIVER-PKG ?AUTO_2751 ?AUTO_2752 )
      ( DELIVER-PKG-VERIFY ?AUTO_2751 ?AUTO_2752 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2758 - OBJ
      ?AUTO_2759 - LOCATION
    )
    :vars
    (
      ?AUTO_2761 - TRUCK
      ?AUTO_2760 - LOCATION
      ?AUTO_2763 - CITY
      ?AUTO_2762 - LOCATION
      ?AUTO_2765 - LOCATION
      ?AUTO_2764 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2761 ?AUTO_2760 ) ( IN-CITY ?AUTO_2760 ?AUTO_2763 ) ( IN-CITY ?AUTO_2759 ?AUTO_2763 ) ( not ( = ?AUTO_2759 ?AUTO_2760 ) ) ( AIRPORT ?AUTO_2762 ) ( AIRPORT ?AUTO_2760 ) ( not ( = ?AUTO_2762 ?AUTO_2760 ) ) ( not ( = ?AUTO_2759 ?AUTO_2762 ) ) ( OBJ-AT ?AUTO_2758 ?AUTO_2762 ) ( AIRPORT ?AUTO_2765 ) ( AIRPLANE-AT ?AUTO_2764 ?AUTO_2765 ) ( not ( = ?AUTO_2765 ?AUTO_2760 ) ) ( not ( = ?AUTO_2759 ?AUTO_2765 ) ) ( not ( = ?AUTO_2762 ?AUTO_2765 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2764 ?AUTO_2765 ?AUTO_2760 )
      ( DELIVER-PKG ?AUTO_2758 ?AUTO_2759 )
      ( DELIVER-PKG-VERIFY ?AUTO_2758 ?AUTO_2759 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2768 - OBJ
      ?AUTO_2769 - LOCATION
    )
    :vars
    (
      ?AUTO_2770 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2770 ?AUTO_2769 ) ( IN-TRUCK ?AUTO_2768 ?AUTO_2770 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2768 ?AUTO_2770 ?AUTO_2769 )
      ( DELIVER-PKG-VERIFY ?AUTO_2768 ?AUTO_2769 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2773 - OBJ
      ?AUTO_2774 - LOCATION
    )
    :vars
    (
      ?AUTO_2775 - TRUCK
      ?AUTO_2776 - LOCATION
      ?AUTO_2777 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2773 ?AUTO_2775 ) ( TRUCK-AT ?AUTO_2775 ?AUTO_2776 ) ( IN-CITY ?AUTO_2776 ?AUTO_2777 ) ( IN-CITY ?AUTO_2774 ?AUTO_2777 ) ( not ( = ?AUTO_2774 ?AUTO_2776 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2775 ?AUTO_2776 ?AUTO_2774 ?AUTO_2777 )
      ( DELIVER-PKG ?AUTO_2773 ?AUTO_2774 )
      ( DELIVER-PKG-VERIFY ?AUTO_2773 ?AUTO_2774 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2778 - OBJ
      ?AUTO_2779 - LOCATION
    )
    :vars
    (
      ?AUTO_2780 - TRUCK
      ?AUTO_2781 - LOCATION
      ?AUTO_2782 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2780 ?AUTO_2781 ) ( IN-CITY ?AUTO_2781 ?AUTO_2782 ) ( IN-CITY ?AUTO_2779 ?AUTO_2782 ) ( not ( = ?AUTO_2779 ?AUTO_2781 ) ) ( OBJ-AT ?AUTO_2778 ?AUTO_2781 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2778 ?AUTO_2780 ?AUTO_2781 )
      ( DELIVER-PKG ?AUTO_2778 ?AUTO_2779 )
      ( DELIVER-PKG-VERIFY ?AUTO_2778 ?AUTO_2779 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2783 - OBJ
      ?AUTO_2784 - LOCATION
    )
    :vars
    (
      ?AUTO_2785 - LOCATION
      ?AUTO_2787 - CITY
      ?AUTO_2786 - TRUCK
      ?AUTO_2788 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2785 ?AUTO_2787 ) ( IN-CITY ?AUTO_2784 ?AUTO_2787 ) ( not ( = ?AUTO_2784 ?AUTO_2785 ) ) ( OBJ-AT ?AUTO_2783 ?AUTO_2785 ) ( TRUCK-AT ?AUTO_2786 ?AUTO_2788 ) ( IN-CITY ?AUTO_2788 ?AUTO_2787 ) ( not ( = ?AUTO_2785 ?AUTO_2788 ) ) ( not ( = ?AUTO_2784 ?AUTO_2788 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2786 ?AUTO_2788 ?AUTO_2785 ?AUTO_2787 )
      ( DELIVER-PKG ?AUTO_2783 ?AUTO_2784 )
      ( DELIVER-PKG-VERIFY ?AUTO_2783 ?AUTO_2784 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2791 - OBJ
      ?AUTO_2792 - LOCATION
    )
    :vars
    (
      ?AUTO_2793 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2793 ?AUTO_2792 ) ( IN-TRUCK ?AUTO_2791 ?AUTO_2793 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2791 ?AUTO_2793 ?AUTO_2792 )
      ( DELIVER-PKG-VERIFY ?AUTO_2791 ?AUTO_2792 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2794 - OBJ
      ?AUTO_2795 - LOCATION
    )
    :vars
    (
      ?AUTO_2796 - TRUCK
      ?AUTO_2797 - LOCATION
      ?AUTO_2798 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2794 ?AUTO_2796 ) ( TRUCK-AT ?AUTO_2796 ?AUTO_2797 ) ( IN-CITY ?AUTO_2797 ?AUTO_2798 ) ( IN-CITY ?AUTO_2795 ?AUTO_2798 ) ( not ( = ?AUTO_2795 ?AUTO_2797 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2796 ?AUTO_2797 ?AUTO_2795 ?AUTO_2798 )
      ( DELIVER-PKG ?AUTO_2794 ?AUTO_2795 )
      ( DELIVER-PKG-VERIFY ?AUTO_2794 ?AUTO_2795 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2813 - OBJ
      ?AUTO_2814 - LOCATION
    )
    :vars
    (
      ?AUTO_2817 - TRUCK
      ?AUTO_2815 - LOCATION
      ?AUTO_2816 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2817 ?AUTO_2815 ) ( IN-CITY ?AUTO_2815 ?AUTO_2816 ) ( IN-CITY ?AUTO_2814 ?AUTO_2816 ) ( not ( = ?AUTO_2814 ?AUTO_2815 ) ) ( OBJ-AT ?AUTO_2813 ?AUTO_2815 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2813 ?AUTO_2817 ?AUTO_2815 )
      ( DELIVER-PKG ?AUTO_2813 ?AUTO_2814 )
      ( DELIVER-PKG-VERIFY ?AUTO_2813 ?AUTO_2814 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2826 - OBJ
      ?AUTO_2827 - LOCATION
    )
    :vars
    (
      ?AUTO_2828 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2826 ?AUTO_2828 ) ( AIRPLANE-AT ?AUTO_2828 ?AUTO_2827 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2826 ?AUTO_2828 ?AUTO_2827 )
      ( DELIVER-PKG-VERIFY ?AUTO_2826 ?AUTO_2827 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2835 - OBJ
      ?AUTO_2836 - LOCATION
    )
    :vars
    (
      ?AUTO_2837 - AIRPLANE
      ?AUTO_2838 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2835 ?AUTO_2837 ) ( AIRPORT ?AUTO_2838 ) ( AIRPORT ?AUTO_2836 ) ( AIRPLANE-AT ?AUTO_2837 ?AUTO_2838 ) ( not ( = ?AUTO_2838 ?AUTO_2836 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2837 ?AUTO_2838 ?AUTO_2836 )
      ( DELIVER-PKG ?AUTO_2835 ?AUTO_2836 )
      ( DELIVER-PKG-VERIFY ?AUTO_2835 ?AUTO_2836 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2845 - OBJ
      ?AUTO_2846 - LOCATION
    )
    :vars
    (
      ?AUTO_2847 - LOCATION
      ?AUTO_2848 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2847 ) ( AIRPORT ?AUTO_2846 ) ( AIRPLANE-AT ?AUTO_2848 ?AUTO_2847 ) ( not ( = ?AUTO_2847 ?AUTO_2846 ) ) ( OBJ-AT ?AUTO_2845 ?AUTO_2847 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2845 ?AUTO_2848 ?AUTO_2847 )
      ( DELIVER-PKG ?AUTO_2845 ?AUTO_2846 )
      ( DELIVER-PKG-VERIFY ?AUTO_2845 ?AUTO_2846 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2849 - OBJ
      ?AUTO_2850 - LOCATION
    )
    :vars
    (
      ?AUTO_2851 - LOCATION
      ?AUTO_2853 - LOCATION
      ?AUTO_2852 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2851 ) ( AIRPORT ?AUTO_2850 ) ( not ( = ?AUTO_2851 ?AUTO_2850 ) ) ( OBJ-AT ?AUTO_2849 ?AUTO_2851 ) ( AIRPORT ?AUTO_2853 ) ( AIRPLANE-AT ?AUTO_2852 ?AUTO_2853 ) ( not ( = ?AUTO_2853 ?AUTO_2851 ) ) ( not ( = ?AUTO_2850 ?AUTO_2853 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2852 ?AUTO_2853 ?AUTO_2851 )
      ( DELIVER-PKG ?AUTO_2849 ?AUTO_2850 )
      ( DELIVER-PKG-VERIFY ?AUTO_2849 ?AUTO_2850 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2854 - OBJ
      ?AUTO_2855 - LOCATION
    )
    :vars
    (
      ?AUTO_2856 - LOCATION
      ?AUTO_2858 - LOCATION
      ?AUTO_2857 - AIRPLANE
      ?AUTO_2859 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2856 ) ( AIRPORT ?AUTO_2855 ) ( not ( = ?AUTO_2856 ?AUTO_2855 ) ) ( AIRPORT ?AUTO_2858 ) ( AIRPLANE-AT ?AUTO_2857 ?AUTO_2858 ) ( not ( = ?AUTO_2858 ?AUTO_2856 ) ) ( not ( = ?AUTO_2855 ?AUTO_2858 ) ) ( TRUCK-AT ?AUTO_2859 ?AUTO_2856 ) ( IN-TRUCK ?AUTO_2854 ?AUTO_2859 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2854 ?AUTO_2859 ?AUTO_2856 )
      ( DELIVER-PKG ?AUTO_2854 ?AUTO_2855 )
      ( DELIVER-PKG-VERIFY ?AUTO_2854 ?AUTO_2855 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2862 - OBJ
      ?AUTO_2863 - LOCATION
    )
    :vars
    (
      ?AUTO_2866 - LOCATION
      ?AUTO_2867 - LOCATION
      ?AUTO_2864 - AIRPLANE
      ?AUTO_2865 - TRUCK
      ?AUTO_2868 - LOCATION
      ?AUTO_2869 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2866 ) ( AIRPORT ?AUTO_2863 ) ( not ( = ?AUTO_2866 ?AUTO_2863 ) ) ( AIRPORT ?AUTO_2867 ) ( AIRPLANE-AT ?AUTO_2864 ?AUTO_2867 ) ( not ( = ?AUTO_2867 ?AUTO_2866 ) ) ( not ( = ?AUTO_2863 ?AUTO_2867 ) ) ( IN-TRUCK ?AUTO_2862 ?AUTO_2865 ) ( TRUCK-AT ?AUTO_2865 ?AUTO_2868 ) ( IN-CITY ?AUTO_2868 ?AUTO_2869 ) ( IN-CITY ?AUTO_2866 ?AUTO_2869 ) ( not ( = ?AUTO_2866 ?AUTO_2868 ) ) ( not ( = ?AUTO_2863 ?AUTO_2868 ) ) ( not ( = ?AUTO_2867 ?AUTO_2868 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2865 ?AUTO_2868 ?AUTO_2866 ?AUTO_2869 )
      ( DELIVER-PKG ?AUTO_2862 ?AUTO_2863 )
      ( DELIVER-PKG-VERIFY ?AUTO_2862 ?AUTO_2863 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2870 - OBJ
      ?AUTO_2871 - LOCATION
    )
    :vars
    (
      ?AUTO_2875 - LOCATION
      ?AUTO_2872 - LOCATION
      ?AUTO_2873 - AIRPLANE
      ?AUTO_2874 - TRUCK
      ?AUTO_2877 - LOCATION
      ?AUTO_2876 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2875 ) ( AIRPORT ?AUTO_2871 ) ( not ( = ?AUTO_2875 ?AUTO_2871 ) ) ( AIRPORT ?AUTO_2872 ) ( AIRPLANE-AT ?AUTO_2873 ?AUTO_2872 ) ( not ( = ?AUTO_2872 ?AUTO_2875 ) ) ( not ( = ?AUTO_2871 ?AUTO_2872 ) ) ( TRUCK-AT ?AUTO_2874 ?AUTO_2877 ) ( IN-CITY ?AUTO_2877 ?AUTO_2876 ) ( IN-CITY ?AUTO_2875 ?AUTO_2876 ) ( not ( = ?AUTO_2875 ?AUTO_2877 ) ) ( not ( = ?AUTO_2871 ?AUTO_2877 ) ) ( not ( = ?AUTO_2872 ?AUTO_2877 ) ) ( OBJ-AT ?AUTO_2870 ?AUTO_2877 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2870 ?AUTO_2874 ?AUTO_2877 )
      ( DELIVER-PKG ?AUTO_2870 ?AUTO_2871 )
      ( DELIVER-PKG-VERIFY ?AUTO_2870 ?AUTO_2871 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2878 - OBJ
      ?AUTO_2879 - LOCATION
    )
    :vars
    (
      ?AUTO_2885 - LOCATION
      ?AUTO_2881 - LOCATION
      ?AUTO_2880 - AIRPLANE
      ?AUTO_2883 - LOCATION
      ?AUTO_2882 - CITY
      ?AUTO_2884 - TRUCK
      ?AUTO_2886 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2885 ) ( AIRPORT ?AUTO_2879 ) ( not ( = ?AUTO_2885 ?AUTO_2879 ) ) ( AIRPORT ?AUTO_2881 ) ( AIRPLANE-AT ?AUTO_2880 ?AUTO_2881 ) ( not ( = ?AUTO_2881 ?AUTO_2885 ) ) ( not ( = ?AUTO_2879 ?AUTO_2881 ) ) ( IN-CITY ?AUTO_2883 ?AUTO_2882 ) ( IN-CITY ?AUTO_2885 ?AUTO_2882 ) ( not ( = ?AUTO_2885 ?AUTO_2883 ) ) ( not ( = ?AUTO_2879 ?AUTO_2883 ) ) ( not ( = ?AUTO_2881 ?AUTO_2883 ) ) ( OBJ-AT ?AUTO_2878 ?AUTO_2883 ) ( TRUCK-AT ?AUTO_2884 ?AUTO_2886 ) ( IN-CITY ?AUTO_2886 ?AUTO_2882 ) ( not ( = ?AUTO_2883 ?AUTO_2886 ) ) ( not ( = ?AUTO_2879 ?AUTO_2886 ) ) ( not ( = ?AUTO_2885 ?AUTO_2886 ) ) ( not ( = ?AUTO_2881 ?AUTO_2886 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2884 ?AUTO_2886 ?AUTO_2883 ?AUTO_2882 )
      ( DELIVER-PKG ?AUTO_2878 ?AUTO_2879 )
      ( DELIVER-PKG-VERIFY ?AUTO_2878 ?AUTO_2879 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2889 - OBJ
      ?AUTO_2890 - LOCATION
    )
    :vars
    (
      ?AUTO_2891 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2889 ?AUTO_2891 ) ( AIRPLANE-AT ?AUTO_2891 ?AUTO_2890 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2889 ?AUTO_2891 ?AUTO_2890 )
      ( DELIVER-PKG-VERIFY ?AUTO_2889 ?AUTO_2890 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2892 - OBJ
      ?AUTO_2893 - LOCATION
    )
    :vars
    (
      ?AUTO_2894 - AIRPLANE
      ?AUTO_2895 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2892 ?AUTO_2894 ) ( AIRPORT ?AUTO_2895 ) ( AIRPORT ?AUTO_2893 ) ( AIRPLANE-AT ?AUTO_2894 ?AUTO_2895 ) ( not ( = ?AUTO_2895 ?AUTO_2893 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2894 ?AUTO_2895 ?AUTO_2893 )
      ( DELIVER-PKG ?AUTO_2892 ?AUTO_2893 )
      ( DELIVER-PKG-VERIFY ?AUTO_2892 ?AUTO_2893 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2914 - OBJ
      ?AUTO_2915 - LOCATION
    )
    :vars
    (
      ?AUTO_2917 - LOCATION
      ?AUTO_2916 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2917 ) ( AIRPORT ?AUTO_2915 ) ( AIRPLANE-AT ?AUTO_2916 ?AUTO_2917 ) ( not ( = ?AUTO_2917 ?AUTO_2915 ) ) ( OBJ-AT ?AUTO_2914 ?AUTO_2917 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2914 ?AUTO_2916 ?AUTO_2917 )
      ( DELIVER-PKG ?AUTO_2914 ?AUTO_2915 )
      ( DELIVER-PKG-VERIFY ?AUTO_2914 ?AUTO_2915 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2934 - OBJ
      ?AUTO_2935 - LOCATION
    )
    :vars
    (
      ?AUTO_2936 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2934 ?AUTO_2936 ) ( AIRPLANE-AT ?AUTO_2936 ?AUTO_2935 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2934 ?AUTO_2936 ?AUTO_2935 )
      ( DELIVER-PKG-VERIFY ?AUTO_2934 ?AUTO_2935 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2947 - OBJ
      ?AUTO_2948 - LOCATION
    )
    :vars
    (
      ?AUTO_2950 - LOCATION
      ?AUTO_2949 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2950 ) ( AIRPORT ?AUTO_2948 ) ( AIRPLANE-AT ?AUTO_2949 ?AUTO_2950 ) ( not ( = ?AUTO_2950 ?AUTO_2948 ) ) ( OBJ-AT ?AUTO_2947 ?AUTO_2950 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2947 ?AUTO_2949 ?AUTO_2950 )
      ( DELIVER-PKG ?AUTO_2947 ?AUTO_2948 )
      ( DELIVER-PKG-VERIFY ?AUTO_2947 ?AUTO_2948 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2951 - OBJ
      ?AUTO_2952 - LOCATION
    )
    :vars
    (
      ?AUTO_2954 - LOCATION
      ?AUTO_2953 - AIRPLANE
      ?AUTO_2955 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2954 ) ( AIRPORT ?AUTO_2952 ) ( AIRPLANE-AT ?AUTO_2953 ?AUTO_2954 ) ( not ( = ?AUTO_2954 ?AUTO_2952 ) ) ( TRUCK-AT ?AUTO_2955 ?AUTO_2954 ) ( IN-TRUCK ?AUTO_2951 ?AUTO_2955 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2951 ?AUTO_2955 ?AUTO_2954 )
      ( DELIVER-PKG ?AUTO_2951 ?AUTO_2952 )
      ( DELIVER-PKG-VERIFY ?AUTO_2951 ?AUTO_2952 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2956 - OBJ
      ?AUTO_2957 - LOCATION
    )
    :vars
    (
      ?AUTO_2958 - LOCATION
      ?AUTO_2959 - AIRPLANE
      ?AUTO_2960 - TRUCK
      ?AUTO_2961 - LOCATION
      ?AUTO_2962 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2958 ) ( AIRPORT ?AUTO_2957 ) ( AIRPLANE-AT ?AUTO_2959 ?AUTO_2958 ) ( not ( = ?AUTO_2958 ?AUTO_2957 ) ) ( IN-TRUCK ?AUTO_2956 ?AUTO_2960 ) ( TRUCK-AT ?AUTO_2960 ?AUTO_2961 ) ( IN-CITY ?AUTO_2961 ?AUTO_2962 ) ( IN-CITY ?AUTO_2958 ?AUTO_2962 ) ( not ( = ?AUTO_2958 ?AUTO_2961 ) ) ( not ( = ?AUTO_2957 ?AUTO_2961 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2960 ?AUTO_2961 ?AUTO_2958 ?AUTO_2962 )
      ( DELIVER-PKG ?AUTO_2956 ?AUTO_2957 )
      ( DELIVER-PKG-VERIFY ?AUTO_2956 ?AUTO_2957 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2963 - OBJ
      ?AUTO_2964 - LOCATION
    )
    :vars
    (
      ?AUTO_2965 - LOCATION
      ?AUTO_2967 - TRUCK
      ?AUTO_2968 - LOCATION
      ?AUTO_2969 - CITY
      ?AUTO_2970 - LOCATION
      ?AUTO_2966 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2965 ) ( AIRPORT ?AUTO_2964 ) ( not ( = ?AUTO_2965 ?AUTO_2964 ) ) ( IN-TRUCK ?AUTO_2963 ?AUTO_2967 ) ( TRUCK-AT ?AUTO_2967 ?AUTO_2968 ) ( IN-CITY ?AUTO_2968 ?AUTO_2969 ) ( IN-CITY ?AUTO_2965 ?AUTO_2969 ) ( not ( = ?AUTO_2965 ?AUTO_2968 ) ) ( not ( = ?AUTO_2964 ?AUTO_2968 ) ) ( AIRPORT ?AUTO_2970 ) ( AIRPLANE-AT ?AUTO_2966 ?AUTO_2970 ) ( not ( = ?AUTO_2970 ?AUTO_2965 ) ) ( not ( = ?AUTO_2964 ?AUTO_2970 ) ) ( not ( = ?AUTO_2968 ?AUTO_2970 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2966 ?AUTO_2970 ?AUTO_2965 )
      ( DELIVER-PKG ?AUTO_2963 ?AUTO_2964 )
      ( DELIVER-PKG-VERIFY ?AUTO_2963 ?AUTO_2964 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2983 - OBJ
      ?AUTO_2984 - LOCATION
    )
    :vars
    (
      ?AUTO_2989 - LOCATION
      ?AUTO_2986 - TRUCK
      ?AUTO_2990 - LOCATION
      ?AUTO_2988 - CITY
      ?AUTO_2987 - LOCATION
      ?AUTO_2985 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2989 ) ( AIRPORT ?AUTO_2984 ) ( not ( = ?AUTO_2989 ?AUTO_2984 ) ) ( TRUCK-AT ?AUTO_2986 ?AUTO_2990 ) ( IN-CITY ?AUTO_2990 ?AUTO_2988 ) ( IN-CITY ?AUTO_2989 ?AUTO_2988 ) ( not ( = ?AUTO_2989 ?AUTO_2990 ) ) ( not ( = ?AUTO_2984 ?AUTO_2990 ) ) ( AIRPORT ?AUTO_2987 ) ( AIRPLANE-AT ?AUTO_2985 ?AUTO_2987 ) ( not ( = ?AUTO_2987 ?AUTO_2989 ) ) ( not ( = ?AUTO_2984 ?AUTO_2987 ) ) ( not ( = ?AUTO_2990 ?AUTO_2987 ) ) ( OBJ-AT ?AUTO_2983 ?AUTO_2990 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2983 ?AUTO_2986 ?AUTO_2990 )
      ( DELIVER-PKG ?AUTO_2983 ?AUTO_2984 )
      ( DELIVER-PKG-VERIFY ?AUTO_2983 ?AUTO_2984 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2999 - OBJ
      ?AUTO_3000 - LOCATION
    )
    :vars
    (
      ?AUTO_3001 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3001 ?AUTO_3000 ) ( IN-TRUCK ?AUTO_2999 ?AUTO_3001 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2999 ?AUTO_3001 ?AUTO_3000 )
      ( DELIVER-PKG-VERIFY ?AUTO_2999 ?AUTO_3000 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3018 - OBJ
      ?AUTO_3019 - LOCATION
    )
    :vars
    (
      ?AUTO_3020 - TRUCK
      ?AUTO_3021 - LOCATION
      ?AUTO_3022 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3018 ?AUTO_3020 ) ( TRUCK-AT ?AUTO_3020 ?AUTO_3021 ) ( IN-CITY ?AUTO_3021 ?AUTO_3022 ) ( IN-CITY ?AUTO_3019 ?AUTO_3022 ) ( not ( = ?AUTO_3019 ?AUTO_3021 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3020 ?AUTO_3021 ?AUTO_3019 ?AUTO_3022 )
      ( DELIVER-PKG ?AUTO_3018 ?AUTO_3019 )
      ( DELIVER-PKG-VERIFY ?AUTO_3018 ?AUTO_3019 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3023 - OBJ
      ?AUTO_3024 - LOCATION
    )
    :vars
    (
      ?AUTO_3025 - TRUCK
      ?AUTO_3026 - LOCATION
      ?AUTO_3027 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3025 ?AUTO_3026 ) ( IN-CITY ?AUTO_3026 ?AUTO_3027 ) ( IN-CITY ?AUTO_3024 ?AUTO_3027 ) ( not ( = ?AUTO_3024 ?AUTO_3026 ) ) ( OBJ-AT ?AUTO_3023 ?AUTO_3026 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3023 ?AUTO_3025 ?AUTO_3026 )
      ( DELIVER-PKG ?AUTO_3023 ?AUTO_3024 )
      ( DELIVER-PKG-VERIFY ?AUTO_3023 ?AUTO_3024 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3028 - OBJ
      ?AUTO_3029 - LOCATION
    )
    :vars
    (
      ?AUTO_3030 - TRUCK
      ?AUTO_3031 - LOCATION
      ?AUTO_3032 - CITY
      ?AUTO_3033 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3030 ?AUTO_3031 ) ( IN-CITY ?AUTO_3031 ?AUTO_3032 ) ( IN-CITY ?AUTO_3029 ?AUTO_3032 ) ( not ( = ?AUTO_3029 ?AUTO_3031 ) ) ( IN-AIRPLANE ?AUTO_3028 ?AUTO_3033 ) ( AIRPLANE-AT ?AUTO_3033 ?AUTO_3031 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3028 ?AUTO_3033 ?AUTO_3031 )
      ( DELIVER-PKG ?AUTO_3028 ?AUTO_3029 )
      ( DELIVER-PKG-VERIFY ?AUTO_3028 ?AUTO_3029 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3038 - OBJ
      ?AUTO_3039 - LOCATION
    )
    :vars
    (
      ?AUTO_3043 - LOCATION
      ?AUTO_3040 - CITY
      ?AUTO_3042 - AIRPLANE
      ?AUTO_3041 - TRUCK
      ?AUTO_3044 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3043 ?AUTO_3040 ) ( IN-CITY ?AUTO_3039 ?AUTO_3040 ) ( not ( = ?AUTO_3039 ?AUTO_3043 ) ) ( IN-AIRPLANE ?AUTO_3038 ?AUTO_3042 ) ( AIRPLANE-AT ?AUTO_3042 ?AUTO_3043 ) ( TRUCK-AT ?AUTO_3041 ?AUTO_3044 ) ( IN-CITY ?AUTO_3044 ?AUTO_3040 ) ( not ( = ?AUTO_3043 ?AUTO_3044 ) ) ( not ( = ?AUTO_3039 ?AUTO_3044 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3041 ?AUTO_3044 ?AUTO_3043 ?AUTO_3040 )
      ( DELIVER-PKG ?AUTO_3038 ?AUTO_3039 )
      ( DELIVER-PKG-VERIFY ?AUTO_3038 ?AUTO_3039 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3045 - OBJ
      ?AUTO_3046 - LOCATION
    )
    :vars
    (
      ?AUTO_3050 - LOCATION
      ?AUTO_3048 - CITY
      ?AUTO_3049 - AIRPLANE
      ?AUTO_3047 - TRUCK
      ?AUTO_3051 - LOCATION
      ?AUTO_3052 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3050 ?AUTO_3048 ) ( IN-CITY ?AUTO_3046 ?AUTO_3048 ) ( not ( = ?AUTO_3046 ?AUTO_3050 ) ) ( IN-AIRPLANE ?AUTO_3045 ?AUTO_3049 ) ( TRUCK-AT ?AUTO_3047 ?AUTO_3051 ) ( IN-CITY ?AUTO_3051 ?AUTO_3048 ) ( not ( = ?AUTO_3050 ?AUTO_3051 ) ) ( not ( = ?AUTO_3046 ?AUTO_3051 ) ) ( AIRPORT ?AUTO_3052 ) ( AIRPORT ?AUTO_3050 ) ( AIRPLANE-AT ?AUTO_3049 ?AUTO_3052 ) ( not ( = ?AUTO_3052 ?AUTO_3050 ) ) ( not ( = ?AUTO_3046 ?AUTO_3052 ) ) ( not ( = ?AUTO_3051 ?AUTO_3052 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3049 ?AUTO_3052 ?AUTO_3050 )
      ( DELIVER-PKG ?AUTO_3045 ?AUTO_3046 )
      ( DELIVER-PKG-VERIFY ?AUTO_3045 ?AUTO_3046 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3059 - OBJ
      ?AUTO_3060 - LOCATION
    )
    :vars
    (
      ?AUTO_3064 - LOCATION
      ?AUTO_3062 - CITY
      ?AUTO_3066 - TRUCK
      ?AUTO_3061 - LOCATION
      ?AUTO_3063 - LOCATION
      ?AUTO_3065 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3064 ?AUTO_3062 ) ( IN-CITY ?AUTO_3060 ?AUTO_3062 ) ( not ( = ?AUTO_3060 ?AUTO_3064 ) ) ( TRUCK-AT ?AUTO_3066 ?AUTO_3061 ) ( IN-CITY ?AUTO_3061 ?AUTO_3062 ) ( not ( = ?AUTO_3064 ?AUTO_3061 ) ) ( not ( = ?AUTO_3060 ?AUTO_3061 ) ) ( AIRPORT ?AUTO_3063 ) ( AIRPORT ?AUTO_3064 ) ( AIRPLANE-AT ?AUTO_3065 ?AUTO_3063 ) ( not ( = ?AUTO_3063 ?AUTO_3064 ) ) ( not ( = ?AUTO_3060 ?AUTO_3063 ) ) ( not ( = ?AUTO_3061 ?AUTO_3063 ) ) ( OBJ-AT ?AUTO_3059 ?AUTO_3063 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3059 ?AUTO_3065 ?AUTO_3063 )
      ( DELIVER-PKG ?AUTO_3059 ?AUTO_3060 )
      ( DELIVER-PKG-VERIFY ?AUTO_3059 ?AUTO_3060 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3067 - OBJ
      ?AUTO_3068 - LOCATION
    )
    :vars
    (
      ?AUTO_3073 - LOCATION
      ?AUTO_3074 - CITY
      ?AUTO_3070 - TRUCK
      ?AUTO_3069 - LOCATION
      ?AUTO_3072 - LOCATION
      ?AUTO_3075 - LOCATION
      ?AUTO_3071 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3073 ?AUTO_3074 ) ( IN-CITY ?AUTO_3068 ?AUTO_3074 ) ( not ( = ?AUTO_3068 ?AUTO_3073 ) ) ( TRUCK-AT ?AUTO_3070 ?AUTO_3069 ) ( IN-CITY ?AUTO_3069 ?AUTO_3074 ) ( not ( = ?AUTO_3073 ?AUTO_3069 ) ) ( not ( = ?AUTO_3068 ?AUTO_3069 ) ) ( AIRPORT ?AUTO_3072 ) ( AIRPORT ?AUTO_3073 ) ( not ( = ?AUTO_3072 ?AUTO_3073 ) ) ( not ( = ?AUTO_3068 ?AUTO_3072 ) ) ( not ( = ?AUTO_3069 ?AUTO_3072 ) ) ( OBJ-AT ?AUTO_3067 ?AUTO_3072 ) ( AIRPORT ?AUTO_3075 ) ( AIRPLANE-AT ?AUTO_3071 ?AUTO_3075 ) ( not ( = ?AUTO_3075 ?AUTO_3072 ) ) ( not ( = ?AUTO_3068 ?AUTO_3075 ) ) ( not ( = ?AUTO_3073 ?AUTO_3075 ) ) ( not ( = ?AUTO_3069 ?AUTO_3075 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3071 ?AUTO_3075 ?AUTO_3072 )
      ( DELIVER-PKG ?AUTO_3067 ?AUTO_3068 )
      ( DELIVER-PKG-VERIFY ?AUTO_3067 ?AUTO_3068 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3076 - OBJ
      ?AUTO_3077 - LOCATION
    )
    :vars
    (
      ?AUTO_3079 - LOCATION
      ?AUTO_3078 - CITY
      ?AUTO_3080 - TRUCK
      ?AUTO_3083 - LOCATION
      ?AUTO_3081 - LOCATION
      ?AUTO_3084 - LOCATION
      ?AUTO_3082 - AIRPLANE
      ?AUTO_3085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3079 ?AUTO_3078 ) ( IN-CITY ?AUTO_3077 ?AUTO_3078 ) ( not ( = ?AUTO_3077 ?AUTO_3079 ) ) ( TRUCK-AT ?AUTO_3080 ?AUTO_3083 ) ( IN-CITY ?AUTO_3083 ?AUTO_3078 ) ( not ( = ?AUTO_3079 ?AUTO_3083 ) ) ( not ( = ?AUTO_3077 ?AUTO_3083 ) ) ( AIRPORT ?AUTO_3081 ) ( AIRPORT ?AUTO_3079 ) ( not ( = ?AUTO_3081 ?AUTO_3079 ) ) ( not ( = ?AUTO_3077 ?AUTO_3081 ) ) ( not ( = ?AUTO_3083 ?AUTO_3081 ) ) ( AIRPORT ?AUTO_3084 ) ( AIRPLANE-AT ?AUTO_3082 ?AUTO_3084 ) ( not ( = ?AUTO_3084 ?AUTO_3081 ) ) ( not ( = ?AUTO_3077 ?AUTO_3084 ) ) ( not ( = ?AUTO_3079 ?AUTO_3084 ) ) ( not ( = ?AUTO_3083 ?AUTO_3084 ) ) ( TRUCK-AT ?AUTO_3085 ?AUTO_3081 ) ( IN-TRUCK ?AUTO_3076 ?AUTO_3085 ) ( not ( = ?AUTO_3080 ?AUTO_3085 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3076 ?AUTO_3085 ?AUTO_3081 )
      ( DELIVER-PKG ?AUTO_3076 ?AUTO_3077 )
      ( DELIVER-PKG-VERIFY ?AUTO_3076 ?AUTO_3077 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3088 - OBJ
      ?AUTO_3089 - LOCATION
    )
    :vars
    (
      ?AUTO_3097 - LOCATION
      ?AUTO_3093 - CITY
      ?AUTO_3094 - TRUCK
      ?AUTO_3095 - LOCATION
      ?AUTO_3091 - LOCATION
      ?AUTO_3090 - LOCATION
      ?AUTO_3092 - AIRPLANE
      ?AUTO_3096 - TRUCK
      ?AUTO_3098 - LOCATION
      ?AUTO_3099 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3097 ?AUTO_3093 ) ( IN-CITY ?AUTO_3089 ?AUTO_3093 ) ( not ( = ?AUTO_3089 ?AUTO_3097 ) ) ( TRUCK-AT ?AUTO_3094 ?AUTO_3095 ) ( IN-CITY ?AUTO_3095 ?AUTO_3093 ) ( not ( = ?AUTO_3097 ?AUTO_3095 ) ) ( not ( = ?AUTO_3089 ?AUTO_3095 ) ) ( AIRPORT ?AUTO_3091 ) ( AIRPORT ?AUTO_3097 ) ( not ( = ?AUTO_3091 ?AUTO_3097 ) ) ( not ( = ?AUTO_3089 ?AUTO_3091 ) ) ( not ( = ?AUTO_3095 ?AUTO_3091 ) ) ( AIRPORT ?AUTO_3090 ) ( AIRPLANE-AT ?AUTO_3092 ?AUTO_3090 ) ( not ( = ?AUTO_3090 ?AUTO_3091 ) ) ( not ( = ?AUTO_3089 ?AUTO_3090 ) ) ( not ( = ?AUTO_3097 ?AUTO_3090 ) ) ( not ( = ?AUTO_3095 ?AUTO_3090 ) ) ( IN-TRUCK ?AUTO_3088 ?AUTO_3096 ) ( not ( = ?AUTO_3094 ?AUTO_3096 ) ) ( TRUCK-AT ?AUTO_3096 ?AUTO_3098 ) ( IN-CITY ?AUTO_3098 ?AUTO_3099 ) ( IN-CITY ?AUTO_3091 ?AUTO_3099 ) ( not ( = ?AUTO_3091 ?AUTO_3098 ) ) ( not ( = ?AUTO_3089 ?AUTO_3098 ) ) ( not ( = ?AUTO_3097 ?AUTO_3098 ) ) ( not ( = ?AUTO_3093 ?AUTO_3099 ) ) ( not ( = ?AUTO_3095 ?AUTO_3098 ) ) ( not ( = ?AUTO_3090 ?AUTO_3098 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3096 ?AUTO_3098 ?AUTO_3091 ?AUTO_3099 )
      ( DELIVER-PKG ?AUTO_3088 ?AUTO_3089 )
      ( DELIVER-PKG-VERIFY ?AUTO_3088 ?AUTO_3089 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3100 - OBJ
      ?AUTO_3101 - LOCATION
    )
    :vars
    (
      ?AUTO_3104 - LOCATION
      ?AUTO_3102 - CITY
      ?AUTO_3103 - TRUCK
      ?AUTO_3110 - LOCATION
      ?AUTO_3108 - LOCATION
      ?AUTO_3109 - LOCATION
      ?AUTO_3106 - AIRPLANE
      ?AUTO_3105 - TRUCK
      ?AUTO_3107 - LOCATION
      ?AUTO_3111 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3104 ?AUTO_3102 ) ( IN-CITY ?AUTO_3101 ?AUTO_3102 ) ( not ( = ?AUTO_3101 ?AUTO_3104 ) ) ( TRUCK-AT ?AUTO_3103 ?AUTO_3110 ) ( IN-CITY ?AUTO_3110 ?AUTO_3102 ) ( not ( = ?AUTO_3104 ?AUTO_3110 ) ) ( not ( = ?AUTO_3101 ?AUTO_3110 ) ) ( AIRPORT ?AUTO_3108 ) ( AIRPORT ?AUTO_3104 ) ( not ( = ?AUTO_3108 ?AUTO_3104 ) ) ( not ( = ?AUTO_3101 ?AUTO_3108 ) ) ( not ( = ?AUTO_3110 ?AUTO_3108 ) ) ( AIRPORT ?AUTO_3109 ) ( AIRPLANE-AT ?AUTO_3106 ?AUTO_3109 ) ( not ( = ?AUTO_3109 ?AUTO_3108 ) ) ( not ( = ?AUTO_3101 ?AUTO_3109 ) ) ( not ( = ?AUTO_3104 ?AUTO_3109 ) ) ( not ( = ?AUTO_3110 ?AUTO_3109 ) ) ( not ( = ?AUTO_3103 ?AUTO_3105 ) ) ( TRUCK-AT ?AUTO_3105 ?AUTO_3107 ) ( IN-CITY ?AUTO_3107 ?AUTO_3111 ) ( IN-CITY ?AUTO_3108 ?AUTO_3111 ) ( not ( = ?AUTO_3108 ?AUTO_3107 ) ) ( not ( = ?AUTO_3101 ?AUTO_3107 ) ) ( not ( = ?AUTO_3104 ?AUTO_3107 ) ) ( not ( = ?AUTO_3102 ?AUTO_3111 ) ) ( not ( = ?AUTO_3110 ?AUTO_3107 ) ) ( not ( = ?AUTO_3109 ?AUTO_3107 ) ) ( OBJ-AT ?AUTO_3100 ?AUTO_3107 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3100 ?AUTO_3105 ?AUTO_3107 )
      ( DELIVER-PKG ?AUTO_3100 ?AUTO_3101 )
      ( DELIVER-PKG-VERIFY ?AUTO_3100 ?AUTO_3101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3112 - OBJ
      ?AUTO_3113 - LOCATION
    )
    :vars
    (
      ?AUTO_3123 - LOCATION
      ?AUTO_3117 - CITY
      ?AUTO_3114 - TRUCK
      ?AUTO_3119 - LOCATION
      ?AUTO_3121 - LOCATION
      ?AUTO_3120 - LOCATION
      ?AUTO_3116 - AIRPLANE
      ?AUTO_3122 - TRUCK
      ?AUTO_3115 - LOCATION
      ?AUTO_3118 - CITY
      ?AUTO_3124 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3123 ?AUTO_3117 ) ( IN-CITY ?AUTO_3113 ?AUTO_3117 ) ( not ( = ?AUTO_3113 ?AUTO_3123 ) ) ( TRUCK-AT ?AUTO_3114 ?AUTO_3119 ) ( IN-CITY ?AUTO_3119 ?AUTO_3117 ) ( not ( = ?AUTO_3123 ?AUTO_3119 ) ) ( not ( = ?AUTO_3113 ?AUTO_3119 ) ) ( AIRPORT ?AUTO_3121 ) ( AIRPORT ?AUTO_3123 ) ( not ( = ?AUTO_3121 ?AUTO_3123 ) ) ( not ( = ?AUTO_3113 ?AUTO_3121 ) ) ( not ( = ?AUTO_3119 ?AUTO_3121 ) ) ( AIRPORT ?AUTO_3120 ) ( AIRPLANE-AT ?AUTO_3116 ?AUTO_3120 ) ( not ( = ?AUTO_3120 ?AUTO_3121 ) ) ( not ( = ?AUTO_3113 ?AUTO_3120 ) ) ( not ( = ?AUTO_3123 ?AUTO_3120 ) ) ( not ( = ?AUTO_3119 ?AUTO_3120 ) ) ( not ( = ?AUTO_3114 ?AUTO_3122 ) ) ( IN-CITY ?AUTO_3115 ?AUTO_3118 ) ( IN-CITY ?AUTO_3121 ?AUTO_3118 ) ( not ( = ?AUTO_3121 ?AUTO_3115 ) ) ( not ( = ?AUTO_3113 ?AUTO_3115 ) ) ( not ( = ?AUTO_3123 ?AUTO_3115 ) ) ( not ( = ?AUTO_3117 ?AUTO_3118 ) ) ( not ( = ?AUTO_3119 ?AUTO_3115 ) ) ( not ( = ?AUTO_3120 ?AUTO_3115 ) ) ( OBJ-AT ?AUTO_3112 ?AUTO_3115 ) ( TRUCK-AT ?AUTO_3122 ?AUTO_3124 ) ( IN-CITY ?AUTO_3124 ?AUTO_3118 ) ( not ( = ?AUTO_3115 ?AUTO_3124 ) ) ( not ( = ?AUTO_3113 ?AUTO_3124 ) ) ( not ( = ?AUTO_3123 ?AUTO_3124 ) ) ( not ( = ?AUTO_3119 ?AUTO_3124 ) ) ( not ( = ?AUTO_3121 ?AUTO_3124 ) ) ( not ( = ?AUTO_3120 ?AUTO_3124 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3122 ?AUTO_3124 ?AUTO_3115 ?AUTO_3118 )
      ( DELIVER-PKG ?AUTO_3112 ?AUTO_3113 )
      ( DELIVER-PKG-VERIFY ?AUTO_3112 ?AUTO_3113 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3127 - OBJ
      ?AUTO_3128 - LOCATION
    )
    :vars
    (
      ?AUTO_3129 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3129 ?AUTO_3128 ) ( IN-TRUCK ?AUTO_3127 ?AUTO_3129 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3127 ?AUTO_3129 ?AUTO_3128 )
      ( DELIVER-PKG-VERIFY ?AUTO_3127 ?AUTO_3128 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3132 - OBJ
      ?AUTO_3133 - LOCATION
    )
    :vars
    (
      ?AUTO_3134 - TRUCK
      ?AUTO_3135 - LOCATION
      ?AUTO_3136 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3132 ?AUTO_3134 ) ( TRUCK-AT ?AUTO_3134 ?AUTO_3135 ) ( IN-CITY ?AUTO_3135 ?AUTO_3136 ) ( IN-CITY ?AUTO_3133 ?AUTO_3136 ) ( not ( = ?AUTO_3133 ?AUTO_3135 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3134 ?AUTO_3135 ?AUTO_3133 ?AUTO_3136 )
      ( DELIVER-PKG ?AUTO_3132 ?AUTO_3133 )
      ( DELIVER-PKG-VERIFY ?AUTO_3132 ?AUTO_3133 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3143 - OBJ
      ?AUTO_3144 - LOCATION
    )
    :vars
    (
      ?AUTO_3145 - TRUCK
      ?AUTO_3147 - LOCATION
      ?AUTO_3146 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3145 ?AUTO_3147 ) ( IN-CITY ?AUTO_3147 ?AUTO_3146 ) ( IN-CITY ?AUTO_3144 ?AUTO_3146 ) ( not ( = ?AUTO_3144 ?AUTO_3147 ) ) ( OBJ-AT ?AUTO_3143 ?AUTO_3147 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3143 ?AUTO_3145 ?AUTO_3147 )
      ( DELIVER-PKG ?AUTO_3143 ?AUTO_3144 )
      ( DELIVER-PKG-VERIFY ?AUTO_3143 ?AUTO_3144 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3150 - OBJ
      ?AUTO_3151 - LOCATION
    )
    :vars
    (
      ?AUTO_3152 - TRUCK
      ?AUTO_3153 - LOCATION
      ?AUTO_3154 - CITY
      ?AUTO_3155 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3152 ?AUTO_3153 ) ( IN-CITY ?AUTO_3153 ?AUTO_3154 ) ( IN-CITY ?AUTO_3151 ?AUTO_3154 ) ( not ( = ?AUTO_3151 ?AUTO_3153 ) ) ( IN-AIRPLANE ?AUTO_3150 ?AUTO_3155 ) ( AIRPLANE-AT ?AUTO_3155 ?AUTO_3153 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3150 ?AUTO_3155 ?AUTO_3153 )
      ( DELIVER-PKG ?AUTO_3150 ?AUTO_3151 )
      ( DELIVER-PKG-VERIFY ?AUTO_3150 ?AUTO_3151 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3156 - OBJ
      ?AUTO_3157 - LOCATION
    )
    :vars
    (
      ?AUTO_3158 - TRUCK
      ?AUTO_3160 - LOCATION
      ?AUTO_3159 - CITY
      ?AUTO_3161 - AIRPLANE
      ?AUTO_3162 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3158 ?AUTO_3160 ) ( IN-CITY ?AUTO_3160 ?AUTO_3159 ) ( IN-CITY ?AUTO_3157 ?AUTO_3159 ) ( not ( = ?AUTO_3157 ?AUTO_3160 ) ) ( IN-AIRPLANE ?AUTO_3156 ?AUTO_3161 ) ( AIRPORT ?AUTO_3162 ) ( AIRPORT ?AUTO_3160 ) ( AIRPLANE-AT ?AUTO_3161 ?AUTO_3162 ) ( not ( = ?AUTO_3162 ?AUTO_3160 ) ) ( not ( = ?AUTO_3157 ?AUTO_3162 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3161 ?AUTO_3162 ?AUTO_3160 )
      ( DELIVER-PKG ?AUTO_3156 ?AUTO_3157 )
      ( DELIVER-PKG-VERIFY ?AUTO_3156 ?AUTO_3157 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3181 - OBJ
      ?AUTO_3182 - LOCATION
    )
    :vars
    (
      ?AUTO_3186 - TRUCK
      ?AUTO_3185 - LOCATION
      ?AUTO_3187 - CITY
      ?AUTO_3183 - LOCATION
      ?AUTO_3184 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3186 ?AUTO_3185 ) ( IN-CITY ?AUTO_3185 ?AUTO_3187 ) ( IN-CITY ?AUTO_3182 ?AUTO_3187 ) ( not ( = ?AUTO_3182 ?AUTO_3185 ) ) ( AIRPORT ?AUTO_3183 ) ( AIRPORT ?AUTO_3185 ) ( AIRPLANE-AT ?AUTO_3184 ?AUTO_3183 ) ( not ( = ?AUTO_3183 ?AUTO_3185 ) ) ( not ( = ?AUTO_3182 ?AUTO_3183 ) ) ( OBJ-AT ?AUTO_3181 ?AUTO_3183 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3181 ?AUTO_3184 ?AUTO_3183 )
      ( DELIVER-PKG ?AUTO_3181 ?AUTO_3182 )
      ( DELIVER-PKG-VERIFY ?AUTO_3181 ?AUTO_3182 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3204 - OBJ
      ?AUTO_3205 - LOCATION
    )
    :vars
    (
      ?AUTO_3206 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3204 ?AUTO_3206 ) ( AIRPLANE-AT ?AUTO_3206 ?AUTO_3205 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3204 ?AUTO_3206 ?AUTO_3205 )
      ( DELIVER-PKG-VERIFY ?AUTO_3204 ?AUTO_3205 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3243 - OBJ
      ?AUTO_3244 - LOCATION
    )
    :vars
    (
      ?AUTO_3246 - LOCATION
      ?AUTO_3247 - LOCATION
      ?AUTO_3245 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3246 ) ( AIRPORT ?AUTO_3244 ) ( not ( = ?AUTO_3246 ?AUTO_3244 ) ) ( OBJ-AT ?AUTO_3243 ?AUTO_3246 ) ( AIRPORT ?AUTO_3247 ) ( AIRPLANE-AT ?AUTO_3245 ?AUTO_3247 ) ( not ( = ?AUTO_3247 ?AUTO_3246 ) ) ( not ( = ?AUTO_3244 ?AUTO_3247 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3245 ?AUTO_3247 ?AUTO_3246 )
      ( DELIVER-PKG ?AUTO_3243 ?AUTO_3244 )
      ( DELIVER-PKG-VERIFY ?AUTO_3243 ?AUTO_3244 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3266 - OBJ
      ?AUTO_3267 - LOCATION
    )
    :vars
    (
      ?AUTO_3268 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3268 ?AUTO_3267 ) ( IN-TRUCK ?AUTO_3266 ?AUTO_3268 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3266 ?AUTO_3268 ?AUTO_3267 )
      ( DELIVER-PKG-VERIFY ?AUTO_3266 ?AUTO_3267 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3281 - OBJ
      ?AUTO_3282 - LOCATION
    )
    :vars
    (
      ?AUTO_3283 - TRUCK
      ?AUTO_3284 - LOCATION
      ?AUTO_3285 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3283 ?AUTO_3284 ) ( IN-CITY ?AUTO_3284 ?AUTO_3285 ) ( IN-CITY ?AUTO_3282 ?AUTO_3285 ) ( not ( = ?AUTO_3282 ?AUTO_3284 ) ) ( OBJ-AT ?AUTO_3281 ?AUTO_3284 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3281 ?AUTO_3283 ?AUTO_3284 )
      ( DELIVER-PKG ?AUTO_3281 ?AUTO_3282 )
      ( DELIVER-PKG-VERIFY ?AUTO_3281 ?AUTO_3282 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3288 - OBJ
      ?AUTO_3289 - LOCATION
    )
    :vars
    (
      ?AUTO_3291 - TRUCK
      ?AUTO_3290 - LOCATION
      ?AUTO_3292 - CITY
      ?AUTO_3293 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3291 ?AUTO_3290 ) ( IN-CITY ?AUTO_3290 ?AUTO_3292 ) ( IN-CITY ?AUTO_3289 ?AUTO_3292 ) ( not ( = ?AUTO_3289 ?AUTO_3290 ) ) ( IN-AIRPLANE ?AUTO_3288 ?AUTO_3293 ) ( AIRPLANE-AT ?AUTO_3293 ?AUTO_3290 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3288 ?AUTO_3293 ?AUTO_3290 )
      ( DELIVER-PKG ?AUTO_3288 ?AUTO_3289 )
      ( DELIVER-PKG-VERIFY ?AUTO_3288 ?AUTO_3289 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3304 - OBJ
      ?AUTO_3305 - LOCATION
    )
    :vars
    (
      ?AUTO_3310 - TRUCK
      ?AUTO_3308 - LOCATION
      ?AUTO_3309 - CITY
      ?AUTO_3306 - LOCATION
      ?AUTO_3307 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3310 ?AUTO_3308 ) ( IN-CITY ?AUTO_3308 ?AUTO_3309 ) ( IN-CITY ?AUTO_3305 ?AUTO_3309 ) ( not ( = ?AUTO_3305 ?AUTO_3308 ) ) ( AIRPORT ?AUTO_3306 ) ( AIRPORT ?AUTO_3308 ) ( AIRPLANE-AT ?AUTO_3307 ?AUTO_3306 ) ( not ( = ?AUTO_3306 ?AUTO_3308 ) ) ( not ( = ?AUTO_3305 ?AUTO_3306 ) ) ( OBJ-AT ?AUTO_3304 ?AUTO_3306 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3304 ?AUTO_3307 ?AUTO_3306 )
      ( DELIVER-PKG ?AUTO_3304 ?AUTO_3305 )
      ( DELIVER-PKG-VERIFY ?AUTO_3304 ?AUTO_3305 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3311 - OBJ
      ?AUTO_3312 - LOCATION
    )
    :vars
    (
      ?AUTO_3317 - TRUCK
      ?AUTO_3314 - LOCATION
      ?AUTO_3315 - CITY
      ?AUTO_3316 - LOCATION
      ?AUTO_3313 - AIRPLANE
      ?AUTO_3318 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3317 ?AUTO_3314 ) ( IN-CITY ?AUTO_3314 ?AUTO_3315 ) ( IN-CITY ?AUTO_3312 ?AUTO_3315 ) ( not ( = ?AUTO_3312 ?AUTO_3314 ) ) ( AIRPORT ?AUTO_3316 ) ( AIRPORT ?AUTO_3314 ) ( AIRPLANE-AT ?AUTO_3313 ?AUTO_3316 ) ( not ( = ?AUTO_3316 ?AUTO_3314 ) ) ( not ( = ?AUTO_3312 ?AUTO_3316 ) ) ( TRUCK-AT ?AUTO_3318 ?AUTO_3316 ) ( IN-TRUCK ?AUTO_3311 ?AUTO_3318 ) ( not ( = ?AUTO_3317 ?AUTO_3318 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3311 ?AUTO_3318 ?AUTO_3316 )
      ( DELIVER-PKG ?AUTO_3311 ?AUTO_3312 )
      ( DELIVER-PKG-VERIFY ?AUTO_3311 ?AUTO_3312 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3319 - OBJ
      ?AUTO_3320 - LOCATION
    )
    :vars
    (
      ?AUTO_3326 - TRUCK
      ?AUTO_3321 - LOCATION
      ?AUTO_3325 - CITY
      ?AUTO_3322 - LOCATION
      ?AUTO_3324 - AIRPLANE
      ?AUTO_3323 - TRUCK
      ?AUTO_3327 - LOCATION
      ?AUTO_3328 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3326 ?AUTO_3321 ) ( IN-CITY ?AUTO_3321 ?AUTO_3325 ) ( IN-CITY ?AUTO_3320 ?AUTO_3325 ) ( not ( = ?AUTO_3320 ?AUTO_3321 ) ) ( AIRPORT ?AUTO_3322 ) ( AIRPORT ?AUTO_3321 ) ( AIRPLANE-AT ?AUTO_3324 ?AUTO_3322 ) ( not ( = ?AUTO_3322 ?AUTO_3321 ) ) ( not ( = ?AUTO_3320 ?AUTO_3322 ) ) ( IN-TRUCK ?AUTO_3319 ?AUTO_3323 ) ( not ( = ?AUTO_3326 ?AUTO_3323 ) ) ( TRUCK-AT ?AUTO_3323 ?AUTO_3327 ) ( IN-CITY ?AUTO_3327 ?AUTO_3328 ) ( IN-CITY ?AUTO_3322 ?AUTO_3328 ) ( not ( = ?AUTO_3322 ?AUTO_3327 ) ) ( not ( = ?AUTO_3320 ?AUTO_3327 ) ) ( not ( = ?AUTO_3321 ?AUTO_3327 ) ) ( not ( = ?AUTO_3325 ?AUTO_3328 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3323 ?AUTO_3327 ?AUTO_3322 ?AUTO_3328 )
      ( DELIVER-PKG ?AUTO_3319 ?AUTO_3320 )
      ( DELIVER-PKG-VERIFY ?AUTO_3319 ?AUTO_3320 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3329 - OBJ
      ?AUTO_3330 - LOCATION
    )
    :vars
    (
      ?AUTO_3334 - TRUCK
      ?AUTO_3333 - LOCATION
      ?AUTO_3335 - CITY
      ?AUTO_3331 - LOCATION
      ?AUTO_3336 - TRUCK
      ?AUTO_3338 - LOCATION
      ?AUTO_3337 - CITY
      ?AUTO_3339 - LOCATION
      ?AUTO_3332 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3334 ?AUTO_3333 ) ( IN-CITY ?AUTO_3333 ?AUTO_3335 ) ( IN-CITY ?AUTO_3330 ?AUTO_3335 ) ( not ( = ?AUTO_3330 ?AUTO_3333 ) ) ( AIRPORT ?AUTO_3331 ) ( AIRPORT ?AUTO_3333 ) ( not ( = ?AUTO_3331 ?AUTO_3333 ) ) ( not ( = ?AUTO_3330 ?AUTO_3331 ) ) ( IN-TRUCK ?AUTO_3329 ?AUTO_3336 ) ( not ( = ?AUTO_3334 ?AUTO_3336 ) ) ( TRUCK-AT ?AUTO_3336 ?AUTO_3338 ) ( IN-CITY ?AUTO_3338 ?AUTO_3337 ) ( IN-CITY ?AUTO_3331 ?AUTO_3337 ) ( not ( = ?AUTO_3331 ?AUTO_3338 ) ) ( not ( = ?AUTO_3330 ?AUTO_3338 ) ) ( not ( = ?AUTO_3333 ?AUTO_3338 ) ) ( not ( = ?AUTO_3335 ?AUTO_3337 ) ) ( AIRPORT ?AUTO_3339 ) ( AIRPLANE-AT ?AUTO_3332 ?AUTO_3339 ) ( not ( = ?AUTO_3339 ?AUTO_3331 ) ) ( not ( = ?AUTO_3330 ?AUTO_3339 ) ) ( not ( = ?AUTO_3333 ?AUTO_3339 ) ) ( not ( = ?AUTO_3338 ?AUTO_3339 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3332 ?AUTO_3339 ?AUTO_3331 )
      ( DELIVER-PKG ?AUTO_3329 ?AUTO_3330 )
      ( DELIVER-PKG-VERIFY ?AUTO_3329 ?AUTO_3330 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3352 - OBJ
      ?AUTO_3353 - LOCATION
    )
    :vars
    (
      ?AUTO_3356 - TRUCK
      ?AUTO_3361 - LOCATION
      ?AUTO_3358 - CITY
      ?AUTO_3359 - LOCATION
      ?AUTO_3362 - TRUCK
      ?AUTO_3355 - LOCATION
      ?AUTO_3360 - CITY
      ?AUTO_3357 - LOCATION
      ?AUTO_3354 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3356 ?AUTO_3361 ) ( IN-CITY ?AUTO_3361 ?AUTO_3358 ) ( IN-CITY ?AUTO_3353 ?AUTO_3358 ) ( not ( = ?AUTO_3353 ?AUTO_3361 ) ) ( AIRPORT ?AUTO_3359 ) ( AIRPORT ?AUTO_3361 ) ( not ( = ?AUTO_3359 ?AUTO_3361 ) ) ( not ( = ?AUTO_3353 ?AUTO_3359 ) ) ( not ( = ?AUTO_3356 ?AUTO_3362 ) ) ( TRUCK-AT ?AUTO_3362 ?AUTO_3355 ) ( IN-CITY ?AUTO_3355 ?AUTO_3360 ) ( IN-CITY ?AUTO_3359 ?AUTO_3360 ) ( not ( = ?AUTO_3359 ?AUTO_3355 ) ) ( not ( = ?AUTO_3353 ?AUTO_3355 ) ) ( not ( = ?AUTO_3361 ?AUTO_3355 ) ) ( not ( = ?AUTO_3358 ?AUTO_3360 ) ) ( AIRPORT ?AUTO_3357 ) ( AIRPLANE-AT ?AUTO_3354 ?AUTO_3357 ) ( not ( = ?AUTO_3357 ?AUTO_3359 ) ) ( not ( = ?AUTO_3353 ?AUTO_3357 ) ) ( not ( = ?AUTO_3361 ?AUTO_3357 ) ) ( not ( = ?AUTO_3355 ?AUTO_3357 ) ) ( OBJ-AT ?AUTO_3352 ?AUTO_3355 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3352 ?AUTO_3362 ?AUTO_3355 )
      ( DELIVER-PKG ?AUTO_3352 ?AUTO_3353 )
      ( DELIVER-PKG-VERIFY ?AUTO_3352 ?AUTO_3353 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3371 - OBJ
      ?AUTO_3372 - LOCATION
    )
    :vars
    (
      ?AUTO_3373 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3373 ?AUTO_3372 ) ( IN-TRUCK ?AUTO_3371 ?AUTO_3373 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3371 ?AUTO_3373 ?AUTO_3372 )
      ( DELIVER-PKG-VERIFY ?AUTO_3371 ?AUTO_3372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3384 - OBJ
      ?AUTO_3385 - LOCATION
    )
    :vars
    (
      ?AUTO_3387 - TRUCK
      ?AUTO_3388 - LOCATION
      ?AUTO_3386 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3387 ?AUTO_3388 ) ( IN-CITY ?AUTO_3388 ?AUTO_3386 ) ( IN-CITY ?AUTO_3385 ?AUTO_3386 ) ( not ( = ?AUTO_3385 ?AUTO_3388 ) ) ( OBJ-AT ?AUTO_3384 ?AUTO_3388 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3384 ?AUTO_3387 ?AUTO_3388 )
      ( DELIVER-PKG ?AUTO_3384 ?AUTO_3385 )
      ( DELIVER-PKG-VERIFY ?AUTO_3384 ?AUTO_3385 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3389 - OBJ
      ?AUTO_3390 - LOCATION
    )
    :vars
    (
      ?AUTO_3393 - LOCATION
      ?AUTO_3392 - CITY
      ?AUTO_3391 - TRUCK
      ?AUTO_3394 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3393 ?AUTO_3392 ) ( IN-CITY ?AUTO_3390 ?AUTO_3392 ) ( not ( = ?AUTO_3390 ?AUTO_3393 ) ) ( OBJ-AT ?AUTO_3389 ?AUTO_3393 ) ( TRUCK-AT ?AUTO_3391 ?AUTO_3394 ) ( IN-CITY ?AUTO_3394 ?AUTO_3392 ) ( not ( = ?AUTO_3393 ?AUTO_3394 ) ) ( not ( = ?AUTO_3390 ?AUTO_3394 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3391 ?AUTO_3394 ?AUTO_3393 ?AUTO_3392 )
      ( DELIVER-PKG ?AUTO_3389 ?AUTO_3390 )
      ( DELIVER-PKG-VERIFY ?AUTO_3389 ?AUTO_3390 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3397 - OBJ
      ?AUTO_3398 - LOCATION
    )
    :vars
    (
      ?AUTO_3399 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3399 ?AUTO_3398 ) ( IN-TRUCK ?AUTO_3397 ?AUTO_3399 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3397 ?AUTO_3399 ?AUTO_3398 )
      ( DELIVER-PKG-VERIFY ?AUTO_3397 ?AUTO_3398 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3400 - OBJ
      ?AUTO_3401 - LOCATION
    )
    :vars
    (
      ?AUTO_3402 - TRUCK
      ?AUTO_3403 - LOCATION
      ?AUTO_3404 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3400 ?AUTO_3402 ) ( TRUCK-AT ?AUTO_3402 ?AUTO_3403 ) ( IN-CITY ?AUTO_3403 ?AUTO_3404 ) ( IN-CITY ?AUTO_3401 ?AUTO_3404 ) ( not ( = ?AUTO_3401 ?AUTO_3403 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3402 ?AUTO_3403 ?AUTO_3401 ?AUTO_3404 )
      ( DELIVER-PKG ?AUTO_3400 ?AUTO_3401 )
      ( DELIVER-PKG-VERIFY ?AUTO_3400 ?AUTO_3401 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3405 - OBJ
      ?AUTO_3406 - LOCATION
    )
    :vars
    (
      ?AUTO_3407 - TRUCK
      ?AUTO_3408 - LOCATION
      ?AUTO_3409 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3407 ?AUTO_3408 ) ( IN-CITY ?AUTO_3408 ?AUTO_3409 ) ( IN-CITY ?AUTO_3406 ?AUTO_3409 ) ( not ( = ?AUTO_3406 ?AUTO_3408 ) ) ( OBJ-AT ?AUTO_3405 ?AUTO_3408 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3405 ?AUTO_3407 ?AUTO_3408 )
      ( DELIVER-PKG ?AUTO_3405 ?AUTO_3406 )
      ( DELIVER-PKG-VERIFY ?AUTO_3405 ?AUTO_3406 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3410 - OBJ
      ?AUTO_3411 - LOCATION
    )
    :vars
    (
      ?AUTO_3412 - LOCATION
      ?AUTO_3414 - CITY
      ?AUTO_3413 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3412 ?AUTO_3414 ) ( IN-CITY ?AUTO_3411 ?AUTO_3414 ) ( not ( = ?AUTO_3411 ?AUTO_3412 ) ) ( OBJ-AT ?AUTO_3410 ?AUTO_3412 ) ( TRUCK-AT ?AUTO_3413 ?AUTO_3411 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3413 ?AUTO_3411 ?AUTO_3412 ?AUTO_3414 )
      ( DELIVER-PKG ?AUTO_3410 ?AUTO_3411 )
      ( DELIVER-PKG-VERIFY ?AUTO_3410 ?AUTO_3411 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3427 - OBJ
      ?AUTO_3428 - LOCATION
    )
    :vars
    (
      ?AUTO_3429 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3429 ?AUTO_3428 ) ( IN-TRUCK ?AUTO_3427 ?AUTO_3429 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3427 ?AUTO_3429 ?AUTO_3428 )
      ( DELIVER-PKG-VERIFY ?AUTO_3427 ?AUTO_3428 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3430 - OBJ
      ?AUTO_3431 - LOCATION
    )
    :vars
    (
      ?AUTO_3432 - TRUCK
      ?AUTO_3433 - LOCATION
      ?AUTO_3434 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3430 ?AUTO_3432 ) ( TRUCK-AT ?AUTO_3432 ?AUTO_3433 ) ( IN-CITY ?AUTO_3433 ?AUTO_3434 ) ( IN-CITY ?AUTO_3431 ?AUTO_3434 ) ( not ( = ?AUTO_3431 ?AUTO_3433 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3432 ?AUTO_3433 ?AUTO_3431 ?AUTO_3434 )
      ( DELIVER-PKG ?AUTO_3430 ?AUTO_3431 )
      ( DELIVER-PKG-VERIFY ?AUTO_3430 ?AUTO_3431 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3439 - OBJ
      ?AUTO_3440 - LOCATION
    )
    :vars
    (
      ?AUTO_3443 - TRUCK
      ?AUTO_3441 - LOCATION
      ?AUTO_3442 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3443 ?AUTO_3441 ) ( IN-CITY ?AUTO_3441 ?AUTO_3442 ) ( IN-CITY ?AUTO_3440 ?AUTO_3442 ) ( not ( = ?AUTO_3440 ?AUTO_3441 ) ) ( OBJ-AT ?AUTO_3439 ?AUTO_3441 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3439 ?AUTO_3443 ?AUTO_3441 )
      ( DELIVER-PKG ?AUTO_3439 ?AUTO_3440 )
      ( DELIVER-PKG-VERIFY ?AUTO_3439 ?AUTO_3440 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3444 - OBJ
      ?AUTO_3445 - LOCATION
    )
    :vars
    (
      ?AUTO_3446 - LOCATION
      ?AUTO_3447 - CITY
      ?AUTO_3448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3446 ?AUTO_3447 ) ( IN-CITY ?AUTO_3445 ?AUTO_3447 ) ( not ( = ?AUTO_3445 ?AUTO_3446 ) ) ( OBJ-AT ?AUTO_3444 ?AUTO_3446 ) ( TRUCK-AT ?AUTO_3448 ?AUTO_3445 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3448 ?AUTO_3445 ?AUTO_3446 ?AUTO_3447 )
      ( DELIVER-PKG ?AUTO_3444 ?AUTO_3445 )
      ( DELIVER-PKG-VERIFY ?AUTO_3444 ?AUTO_3445 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3469 - OBJ
      ?AUTO_3470 - LOCATION
    )
    :vars
    (
      ?AUTO_3471 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3471 ?AUTO_3470 ) ( IN-TRUCK ?AUTO_3469 ?AUTO_3471 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3469 ?AUTO_3471 ?AUTO_3470 )
      ( DELIVER-PKG-VERIFY ?AUTO_3469 ?AUTO_3470 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3478 - OBJ
      ?AUTO_3479 - LOCATION
    )
    :vars
    (
      ?AUTO_3481 - TRUCK
      ?AUTO_3482 - LOCATION
      ?AUTO_3480 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3481 ?AUTO_3482 ) ( IN-CITY ?AUTO_3482 ?AUTO_3480 ) ( IN-CITY ?AUTO_3479 ?AUTO_3480 ) ( not ( = ?AUTO_3479 ?AUTO_3482 ) ) ( OBJ-AT ?AUTO_3478 ?AUTO_3482 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3478 ?AUTO_3481 ?AUTO_3482 )
      ( DELIVER-PKG ?AUTO_3478 ?AUTO_3479 )
      ( DELIVER-PKG-VERIFY ?AUTO_3478 ?AUTO_3479 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3507 - OBJ
      ?AUTO_3508 - LOCATION
    )
    :vars
    (
      ?AUTO_3509 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3509 ?AUTO_3508 ) ( IN-TRUCK ?AUTO_3507 ?AUTO_3509 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3507 ?AUTO_3509 ?AUTO_3508 )
      ( DELIVER-PKG-VERIFY ?AUTO_3507 ?AUTO_3508 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3516 - OBJ
      ?AUTO_3517 - LOCATION
    )
    :vars
    (
      ?AUTO_3519 - TRUCK
      ?AUTO_3520 - LOCATION
      ?AUTO_3518 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3519 ?AUTO_3520 ) ( IN-CITY ?AUTO_3520 ?AUTO_3518 ) ( IN-CITY ?AUTO_3517 ?AUTO_3518 ) ( not ( = ?AUTO_3517 ?AUTO_3520 ) ) ( OBJ-AT ?AUTO_3516 ?AUTO_3520 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3516 ?AUTO_3519 ?AUTO_3520 )
      ( DELIVER-PKG ?AUTO_3516 ?AUTO_3517 )
      ( DELIVER-PKG-VERIFY ?AUTO_3516 ?AUTO_3517 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3547 - OBJ
      ?AUTO_3548 - LOCATION
    )
    :vars
    (
      ?AUTO_3549 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3547 ?AUTO_3549 ) ( AIRPLANE-AT ?AUTO_3549 ?AUTO_3548 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3547 ?AUTO_3549 ?AUTO_3548 )
      ( DELIVER-PKG-VERIFY ?AUTO_3547 ?AUTO_3548 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3550 - OBJ
      ?AUTO_3551 - LOCATION
    )
    :vars
    (
      ?AUTO_3552 - AIRPLANE
      ?AUTO_3553 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3550 ?AUTO_3552 ) ( AIRPORT ?AUTO_3553 ) ( AIRPORT ?AUTO_3551 ) ( AIRPLANE-AT ?AUTO_3552 ?AUTO_3553 ) ( not ( = ?AUTO_3553 ?AUTO_3551 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3552 ?AUTO_3553 ?AUTO_3551 )
      ( DELIVER-PKG ?AUTO_3550 ?AUTO_3551 )
      ( DELIVER-PKG-VERIFY ?AUTO_3550 ?AUTO_3551 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3554 - OBJ
      ?AUTO_3555 - LOCATION
    )
    :vars
    (
      ?AUTO_3557 - LOCATION
      ?AUTO_3556 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3557 ) ( AIRPORT ?AUTO_3555 ) ( AIRPLANE-AT ?AUTO_3556 ?AUTO_3557 ) ( not ( = ?AUTO_3557 ?AUTO_3555 ) ) ( OBJ-AT ?AUTO_3554 ?AUTO_3557 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3554 ?AUTO_3556 ?AUTO_3557 )
      ( DELIVER-PKG ?AUTO_3554 ?AUTO_3555 )
      ( DELIVER-PKG-VERIFY ?AUTO_3554 ?AUTO_3555 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3558 - OBJ
      ?AUTO_3559 - LOCATION
    )
    :vars
    (
      ?AUTO_3561 - LOCATION
      ?AUTO_3562 - LOCATION
      ?AUTO_3560 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3561 ) ( AIRPORT ?AUTO_3559 ) ( not ( = ?AUTO_3561 ?AUTO_3559 ) ) ( OBJ-AT ?AUTO_3558 ?AUTO_3561 ) ( AIRPORT ?AUTO_3562 ) ( AIRPLANE-AT ?AUTO_3560 ?AUTO_3562 ) ( not ( = ?AUTO_3562 ?AUTO_3561 ) ) ( not ( = ?AUTO_3559 ?AUTO_3562 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3560 ?AUTO_3562 ?AUTO_3561 )
      ( DELIVER-PKG ?AUTO_3558 ?AUTO_3559 )
      ( DELIVER-PKG-VERIFY ?AUTO_3558 ?AUTO_3559 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3587 - OBJ
      ?AUTO_3588 - LOCATION
    )
    :vars
    (
      ?AUTO_3589 - LOCATION
      ?AUTO_3591 - LOCATION
      ?AUTO_3590 - AIRPLANE
      ?AUTO_3592 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3589 ) ( AIRPORT ?AUTO_3588 ) ( not ( = ?AUTO_3589 ?AUTO_3588 ) ) ( AIRPORT ?AUTO_3591 ) ( AIRPLANE-AT ?AUTO_3590 ?AUTO_3591 ) ( not ( = ?AUTO_3591 ?AUTO_3589 ) ) ( not ( = ?AUTO_3588 ?AUTO_3591 ) ) ( TRUCK-AT ?AUTO_3592 ?AUTO_3589 ) ( IN-TRUCK ?AUTO_3587 ?AUTO_3592 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3587 ?AUTO_3592 ?AUTO_3589 )
      ( DELIVER-PKG ?AUTO_3587 ?AUTO_3588 )
      ( DELIVER-PKG-VERIFY ?AUTO_3587 ?AUTO_3588 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3593 - OBJ
      ?AUTO_3594 - LOCATION
    )
    :vars
    (
      ?AUTO_3596 - LOCATION
      ?AUTO_3597 - LOCATION
      ?AUTO_3595 - AIRPLANE
      ?AUTO_3598 - TRUCK
      ?AUTO_3599 - LOCATION
      ?AUTO_3600 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3596 ) ( AIRPORT ?AUTO_3594 ) ( not ( = ?AUTO_3596 ?AUTO_3594 ) ) ( AIRPORT ?AUTO_3597 ) ( AIRPLANE-AT ?AUTO_3595 ?AUTO_3597 ) ( not ( = ?AUTO_3597 ?AUTO_3596 ) ) ( not ( = ?AUTO_3594 ?AUTO_3597 ) ) ( IN-TRUCK ?AUTO_3593 ?AUTO_3598 ) ( TRUCK-AT ?AUTO_3598 ?AUTO_3599 ) ( IN-CITY ?AUTO_3599 ?AUTO_3600 ) ( IN-CITY ?AUTO_3596 ?AUTO_3600 ) ( not ( = ?AUTO_3596 ?AUTO_3599 ) ) ( not ( = ?AUTO_3594 ?AUTO_3599 ) ) ( not ( = ?AUTO_3597 ?AUTO_3599 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3598 ?AUTO_3599 ?AUTO_3596 ?AUTO_3600 )
      ( DELIVER-PKG ?AUTO_3593 ?AUTO_3594 )
      ( DELIVER-PKG-VERIFY ?AUTO_3593 ?AUTO_3594 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3601 - OBJ
      ?AUTO_3602 - LOCATION
    )
    :vars
    (
      ?AUTO_3605 - LOCATION
      ?AUTO_3608 - LOCATION
      ?AUTO_3603 - AIRPLANE
      ?AUTO_3604 - TRUCK
      ?AUTO_3606 - LOCATION
      ?AUTO_3607 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3605 ) ( AIRPORT ?AUTO_3602 ) ( not ( = ?AUTO_3605 ?AUTO_3602 ) ) ( AIRPORT ?AUTO_3608 ) ( AIRPLANE-AT ?AUTO_3603 ?AUTO_3608 ) ( not ( = ?AUTO_3608 ?AUTO_3605 ) ) ( not ( = ?AUTO_3602 ?AUTO_3608 ) ) ( TRUCK-AT ?AUTO_3604 ?AUTO_3606 ) ( IN-CITY ?AUTO_3606 ?AUTO_3607 ) ( IN-CITY ?AUTO_3605 ?AUTO_3607 ) ( not ( = ?AUTO_3605 ?AUTO_3606 ) ) ( not ( = ?AUTO_3602 ?AUTO_3606 ) ) ( not ( = ?AUTO_3608 ?AUTO_3606 ) ) ( OBJ-AT ?AUTO_3601 ?AUTO_3606 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3601 ?AUTO_3604 ?AUTO_3606 )
      ( DELIVER-PKG ?AUTO_3601 ?AUTO_3602 )
      ( DELIVER-PKG-VERIFY ?AUTO_3601 ?AUTO_3602 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3609 - OBJ
      ?AUTO_3610 - LOCATION
    )
    :vars
    (
      ?AUTO_3615 - LOCATION
      ?AUTO_3614 - LOCATION
      ?AUTO_3611 - AIRPLANE
      ?AUTO_3616 - LOCATION
      ?AUTO_3613 - CITY
      ?AUTO_3612 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3615 ) ( AIRPORT ?AUTO_3610 ) ( not ( = ?AUTO_3615 ?AUTO_3610 ) ) ( AIRPORT ?AUTO_3614 ) ( AIRPLANE-AT ?AUTO_3611 ?AUTO_3614 ) ( not ( = ?AUTO_3614 ?AUTO_3615 ) ) ( not ( = ?AUTO_3610 ?AUTO_3614 ) ) ( IN-CITY ?AUTO_3616 ?AUTO_3613 ) ( IN-CITY ?AUTO_3615 ?AUTO_3613 ) ( not ( = ?AUTO_3615 ?AUTO_3616 ) ) ( not ( = ?AUTO_3610 ?AUTO_3616 ) ) ( not ( = ?AUTO_3614 ?AUTO_3616 ) ) ( OBJ-AT ?AUTO_3609 ?AUTO_3616 ) ( TRUCK-AT ?AUTO_3612 ?AUTO_3615 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3612 ?AUTO_3615 ?AUTO_3616 ?AUTO_3613 )
      ( DELIVER-PKG ?AUTO_3609 ?AUTO_3610 )
      ( DELIVER-PKG-VERIFY ?AUTO_3609 ?AUTO_3610 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3629 - OBJ
      ?AUTO_3630 - LOCATION
    )
    :vars
    (
      ?AUTO_3631 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3631 ?AUTO_3630 ) ( IN-TRUCK ?AUTO_3629 ?AUTO_3631 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3629 ?AUTO_3631 ?AUTO_3630 )
      ( DELIVER-PKG-VERIFY ?AUTO_3629 ?AUTO_3630 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3632 - OBJ
      ?AUTO_3633 - LOCATION
    )
    :vars
    (
      ?AUTO_3634 - TRUCK
      ?AUTO_3635 - LOCATION
      ?AUTO_3636 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3632 ?AUTO_3634 ) ( TRUCK-AT ?AUTO_3634 ?AUTO_3635 ) ( IN-CITY ?AUTO_3635 ?AUTO_3636 ) ( IN-CITY ?AUTO_3633 ?AUTO_3636 ) ( not ( = ?AUTO_3633 ?AUTO_3635 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3634 ?AUTO_3635 ?AUTO_3633 ?AUTO_3636 )
      ( DELIVER-PKG ?AUTO_3632 ?AUTO_3633 )
      ( DELIVER-PKG-VERIFY ?AUTO_3632 ?AUTO_3633 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3637 - OBJ
      ?AUTO_3638 - LOCATION
    )
    :vars
    (
      ?AUTO_3639 - TRUCK
      ?AUTO_3640 - LOCATION
      ?AUTO_3641 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3639 ?AUTO_3640 ) ( IN-CITY ?AUTO_3640 ?AUTO_3641 ) ( IN-CITY ?AUTO_3638 ?AUTO_3641 ) ( not ( = ?AUTO_3638 ?AUTO_3640 ) ) ( OBJ-AT ?AUTO_3637 ?AUTO_3640 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3637 ?AUTO_3639 ?AUTO_3640 )
      ( DELIVER-PKG ?AUTO_3637 ?AUTO_3638 )
      ( DELIVER-PKG-VERIFY ?AUTO_3637 ?AUTO_3638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3644 - OBJ
      ?AUTO_3645 - LOCATION
    )
    :vars
    (
      ?AUTO_3646 - TRUCK
      ?AUTO_3648 - LOCATION
      ?AUTO_3647 - CITY
      ?AUTO_3649 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3646 ?AUTO_3648 ) ( IN-CITY ?AUTO_3648 ?AUTO_3647 ) ( IN-CITY ?AUTO_3645 ?AUTO_3647 ) ( not ( = ?AUTO_3645 ?AUTO_3648 ) ) ( IN-AIRPLANE ?AUTO_3644 ?AUTO_3649 ) ( AIRPLANE-AT ?AUTO_3649 ?AUTO_3648 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3644 ?AUTO_3649 ?AUTO_3648 )
      ( DELIVER-PKG ?AUTO_3644 ?AUTO_3645 )
      ( DELIVER-PKG-VERIFY ?AUTO_3644 ?AUTO_3645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3650 - OBJ
      ?AUTO_3651 - LOCATION
    )
    :vars
    (
      ?AUTO_3652 - TRUCK
      ?AUTO_3654 - LOCATION
      ?AUTO_3653 - CITY
      ?AUTO_3655 - AIRPLANE
      ?AUTO_3656 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3652 ?AUTO_3654 ) ( IN-CITY ?AUTO_3654 ?AUTO_3653 ) ( IN-CITY ?AUTO_3651 ?AUTO_3653 ) ( not ( = ?AUTO_3651 ?AUTO_3654 ) ) ( IN-AIRPLANE ?AUTO_3650 ?AUTO_3655 ) ( AIRPORT ?AUTO_3656 ) ( AIRPORT ?AUTO_3654 ) ( AIRPLANE-AT ?AUTO_3655 ?AUTO_3656 ) ( not ( = ?AUTO_3656 ?AUTO_3654 ) ) ( not ( = ?AUTO_3651 ?AUTO_3656 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3655 ?AUTO_3656 ?AUTO_3654 )
      ( DELIVER-PKG ?AUTO_3650 ?AUTO_3651 )
      ( DELIVER-PKG-VERIFY ?AUTO_3650 ?AUTO_3651 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3657 - OBJ
      ?AUTO_3658 - LOCATION
    )
    :vars
    (
      ?AUTO_3660 - TRUCK
      ?AUTO_3662 - LOCATION
      ?AUTO_3661 - CITY
      ?AUTO_3663 - LOCATION
      ?AUTO_3659 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3660 ?AUTO_3662 ) ( IN-CITY ?AUTO_3662 ?AUTO_3661 ) ( IN-CITY ?AUTO_3658 ?AUTO_3661 ) ( not ( = ?AUTO_3658 ?AUTO_3662 ) ) ( AIRPORT ?AUTO_3663 ) ( AIRPORT ?AUTO_3662 ) ( AIRPLANE-AT ?AUTO_3659 ?AUTO_3663 ) ( not ( = ?AUTO_3663 ?AUTO_3662 ) ) ( not ( = ?AUTO_3658 ?AUTO_3663 ) ) ( OBJ-AT ?AUTO_3657 ?AUTO_3663 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3657 ?AUTO_3659 ?AUTO_3663 )
      ( DELIVER-PKG ?AUTO_3657 ?AUTO_3658 )
      ( DELIVER-PKG-VERIFY ?AUTO_3657 ?AUTO_3658 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3664 - OBJ
      ?AUTO_3665 - LOCATION
    )
    :vars
    (
      ?AUTO_3670 - TRUCK
      ?AUTO_3667 - LOCATION
      ?AUTO_3666 - CITY
      ?AUTO_3668 - LOCATION
      ?AUTO_3671 - LOCATION
      ?AUTO_3669 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3670 ?AUTO_3667 ) ( IN-CITY ?AUTO_3667 ?AUTO_3666 ) ( IN-CITY ?AUTO_3665 ?AUTO_3666 ) ( not ( = ?AUTO_3665 ?AUTO_3667 ) ) ( AIRPORT ?AUTO_3668 ) ( AIRPORT ?AUTO_3667 ) ( not ( = ?AUTO_3668 ?AUTO_3667 ) ) ( not ( = ?AUTO_3665 ?AUTO_3668 ) ) ( OBJ-AT ?AUTO_3664 ?AUTO_3668 ) ( AIRPORT ?AUTO_3671 ) ( AIRPLANE-AT ?AUTO_3669 ?AUTO_3671 ) ( not ( = ?AUTO_3671 ?AUTO_3668 ) ) ( not ( = ?AUTO_3665 ?AUTO_3671 ) ) ( not ( = ?AUTO_3667 ?AUTO_3671 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3669 ?AUTO_3671 ?AUTO_3668 )
      ( DELIVER-PKG ?AUTO_3664 ?AUTO_3665 )
      ( DELIVER-PKG-VERIFY ?AUTO_3664 ?AUTO_3665 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3696 - OBJ
      ?AUTO_3697 - LOCATION
    )
    :vars
    (
      ?AUTO_3702 - TRUCK
      ?AUTO_3700 - LOCATION
      ?AUTO_3703 - CITY
      ?AUTO_3698 - LOCATION
      ?AUTO_3701 - LOCATION
      ?AUTO_3699 - AIRPLANE
      ?AUTO_3704 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3702 ?AUTO_3700 ) ( IN-CITY ?AUTO_3700 ?AUTO_3703 ) ( IN-CITY ?AUTO_3697 ?AUTO_3703 ) ( not ( = ?AUTO_3697 ?AUTO_3700 ) ) ( AIRPORT ?AUTO_3698 ) ( AIRPORT ?AUTO_3700 ) ( not ( = ?AUTO_3698 ?AUTO_3700 ) ) ( not ( = ?AUTO_3697 ?AUTO_3698 ) ) ( AIRPORT ?AUTO_3701 ) ( AIRPLANE-AT ?AUTO_3699 ?AUTO_3701 ) ( not ( = ?AUTO_3701 ?AUTO_3698 ) ) ( not ( = ?AUTO_3697 ?AUTO_3701 ) ) ( not ( = ?AUTO_3700 ?AUTO_3701 ) ) ( TRUCK-AT ?AUTO_3704 ?AUTO_3698 ) ( IN-TRUCK ?AUTO_3696 ?AUTO_3704 ) ( not ( = ?AUTO_3702 ?AUTO_3704 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3696 ?AUTO_3704 ?AUTO_3698 )
      ( DELIVER-PKG ?AUTO_3696 ?AUTO_3697 )
      ( DELIVER-PKG-VERIFY ?AUTO_3696 ?AUTO_3697 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3705 - OBJ
      ?AUTO_3706 - LOCATION
    )
    :vars
    (
      ?AUTO_3711 - TRUCK
      ?AUTO_3712 - LOCATION
      ?AUTO_3710 - CITY
      ?AUTO_3708 - LOCATION
      ?AUTO_3713 - LOCATION
      ?AUTO_3709 - AIRPLANE
      ?AUTO_3707 - TRUCK
      ?AUTO_3714 - LOCATION
      ?AUTO_3715 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3711 ?AUTO_3712 ) ( IN-CITY ?AUTO_3712 ?AUTO_3710 ) ( IN-CITY ?AUTO_3706 ?AUTO_3710 ) ( not ( = ?AUTO_3706 ?AUTO_3712 ) ) ( AIRPORT ?AUTO_3708 ) ( AIRPORT ?AUTO_3712 ) ( not ( = ?AUTO_3708 ?AUTO_3712 ) ) ( not ( = ?AUTO_3706 ?AUTO_3708 ) ) ( AIRPORT ?AUTO_3713 ) ( AIRPLANE-AT ?AUTO_3709 ?AUTO_3713 ) ( not ( = ?AUTO_3713 ?AUTO_3708 ) ) ( not ( = ?AUTO_3706 ?AUTO_3713 ) ) ( not ( = ?AUTO_3712 ?AUTO_3713 ) ) ( IN-TRUCK ?AUTO_3705 ?AUTO_3707 ) ( not ( = ?AUTO_3711 ?AUTO_3707 ) ) ( TRUCK-AT ?AUTO_3707 ?AUTO_3714 ) ( IN-CITY ?AUTO_3714 ?AUTO_3715 ) ( IN-CITY ?AUTO_3708 ?AUTO_3715 ) ( not ( = ?AUTO_3708 ?AUTO_3714 ) ) ( not ( = ?AUTO_3706 ?AUTO_3714 ) ) ( not ( = ?AUTO_3712 ?AUTO_3714 ) ) ( not ( = ?AUTO_3710 ?AUTO_3715 ) ) ( not ( = ?AUTO_3713 ?AUTO_3714 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3707 ?AUTO_3714 ?AUTO_3708 ?AUTO_3715 )
      ( DELIVER-PKG ?AUTO_3705 ?AUTO_3706 )
      ( DELIVER-PKG-VERIFY ?AUTO_3705 ?AUTO_3706 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3716 - OBJ
      ?AUTO_3717 - LOCATION
    )
    :vars
    (
      ?AUTO_3724 - TRUCK
      ?AUTO_3721 - LOCATION
      ?AUTO_3726 - CITY
      ?AUTO_3718 - LOCATION
      ?AUTO_3720 - LOCATION
      ?AUTO_3725 - AIRPLANE
      ?AUTO_3719 - TRUCK
      ?AUTO_3722 - LOCATION
      ?AUTO_3723 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3724 ?AUTO_3721 ) ( IN-CITY ?AUTO_3721 ?AUTO_3726 ) ( IN-CITY ?AUTO_3717 ?AUTO_3726 ) ( not ( = ?AUTO_3717 ?AUTO_3721 ) ) ( AIRPORT ?AUTO_3718 ) ( AIRPORT ?AUTO_3721 ) ( not ( = ?AUTO_3718 ?AUTO_3721 ) ) ( not ( = ?AUTO_3717 ?AUTO_3718 ) ) ( AIRPORT ?AUTO_3720 ) ( AIRPLANE-AT ?AUTO_3725 ?AUTO_3720 ) ( not ( = ?AUTO_3720 ?AUTO_3718 ) ) ( not ( = ?AUTO_3717 ?AUTO_3720 ) ) ( not ( = ?AUTO_3721 ?AUTO_3720 ) ) ( not ( = ?AUTO_3724 ?AUTO_3719 ) ) ( TRUCK-AT ?AUTO_3719 ?AUTO_3722 ) ( IN-CITY ?AUTO_3722 ?AUTO_3723 ) ( IN-CITY ?AUTO_3718 ?AUTO_3723 ) ( not ( = ?AUTO_3718 ?AUTO_3722 ) ) ( not ( = ?AUTO_3717 ?AUTO_3722 ) ) ( not ( = ?AUTO_3721 ?AUTO_3722 ) ) ( not ( = ?AUTO_3726 ?AUTO_3723 ) ) ( not ( = ?AUTO_3720 ?AUTO_3722 ) ) ( OBJ-AT ?AUTO_3716 ?AUTO_3722 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3716 ?AUTO_3719 ?AUTO_3722 )
      ( DELIVER-PKG ?AUTO_3716 ?AUTO_3717 )
      ( DELIVER-PKG-VERIFY ?AUTO_3716 ?AUTO_3717 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3727 - OBJ
      ?AUTO_3728 - LOCATION
    )
    :vars
    (
      ?AUTO_3735 - TRUCK
      ?AUTO_3733 - LOCATION
      ?AUTO_3737 - CITY
      ?AUTO_3731 - LOCATION
      ?AUTO_3736 - LOCATION
      ?AUTO_3734 - AIRPLANE
      ?AUTO_3730 - TRUCK
      ?AUTO_3729 - LOCATION
      ?AUTO_3732 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3735 ?AUTO_3733 ) ( IN-CITY ?AUTO_3733 ?AUTO_3737 ) ( IN-CITY ?AUTO_3728 ?AUTO_3737 ) ( not ( = ?AUTO_3728 ?AUTO_3733 ) ) ( AIRPORT ?AUTO_3731 ) ( AIRPORT ?AUTO_3733 ) ( not ( = ?AUTO_3731 ?AUTO_3733 ) ) ( not ( = ?AUTO_3728 ?AUTO_3731 ) ) ( AIRPORT ?AUTO_3736 ) ( AIRPLANE-AT ?AUTO_3734 ?AUTO_3736 ) ( not ( = ?AUTO_3736 ?AUTO_3731 ) ) ( not ( = ?AUTO_3728 ?AUTO_3736 ) ) ( not ( = ?AUTO_3733 ?AUTO_3736 ) ) ( not ( = ?AUTO_3735 ?AUTO_3730 ) ) ( IN-CITY ?AUTO_3729 ?AUTO_3732 ) ( IN-CITY ?AUTO_3731 ?AUTO_3732 ) ( not ( = ?AUTO_3731 ?AUTO_3729 ) ) ( not ( = ?AUTO_3728 ?AUTO_3729 ) ) ( not ( = ?AUTO_3733 ?AUTO_3729 ) ) ( not ( = ?AUTO_3737 ?AUTO_3732 ) ) ( not ( = ?AUTO_3736 ?AUTO_3729 ) ) ( OBJ-AT ?AUTO_3727 ?AUTO_3729 ) ( TRUCK-AT ?AUTO_3730 ?AUTO_3731 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3730 ?AUTO_3731 ?AUTO_3729 ?AUTO_3732 )
      ( DELIVER-PKG ?AUTO_3727 ?AUTO_3728 )
      ( DELIVER-PKG-VERIFY ?AUTO_3727 ?AUTO_3728 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3750 - OBJ
      ?AUTO_3751 - LOCATION
    )
    :vars
    (
      ?AUTO_3752 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3750 ?AUTO_3752 ) ( AIRPLANE-AT ?AUTO_3752 ?AUTO_3751 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3750 ?AUTO_3752 ?AUTO_3751 )
      ( DELIVER-PKG-VERIFY ?AUTO_3750 ?AUTO_3751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3761 - OBJ
      ?AUTO_3762 - LOCATION
    )
    :vars
    (
      ?AUTO_3763 - AIRPLANE
      ?AUTO_3764 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3761 ?AUTO_3763 ) ( AIRPORT ?AUTO_3764 ) ( AIRPORT ?AUTO_3762 ) ( AIRPLANE-AT ?AUTO_3763 ?AUTO_3764 ) ( not ( = ?AUTO_3764 ?AUTO_3762 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3763 ?AUTO_3764 ?AUTO_3762 )
      ( DELIVER-PKG ?AUTO_3761 ?AUTO_3762 )
      ( DELIVER-PKG-VERIFY ?AUTO_3761 ?AUTO_3762 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3785 - OBJ
      ?AUTO_3786 - LOCATION
    )
    :vars
    (
      ?AUTO_3787 - LOCATION
      ?AUTO_3789 - LOCATION
      ?AUTO_3788 - AIRPLANE
      ?AUTO_3790 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3787 ) ( AIRPORT ?AUTO_3786 ) ( not ( = ?AUTO_3787 ?AUTO_3786 ) ) ( AIRPORT ?AUTO_3789 ) ( AIRPLANE-AT ?AUTO_3788 ?AUTO_3789 ) ( not ( = ?AUTO_3789 ?AUTO_3787 ) ) ( not ( = ?AUTO_3786 ?AUTO_3789 ) ) ( TRUCK-AT ?AUTO_3790 ?AUTO_3787 ) ( IN-TRUCK ?AUTO_3785 ?AUTO_3790 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3785 ?AUTO_3790 ?AUTO_3787 )
      ( DELIVER-PKG ?AUTO_3785 ?AUTO_3786 )
      ( DELIVER-PKG-VERIFY ?AUTO_3785 ?AUTO_3786 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3791 - OBJ
      ?AUTO_3792 - LOCATION
    )
    :vars
    (
      ?AUTO_3796 - LOCATION
      ?AUTO_3795 - LOCATION
      ?AUTO_3794 - AIRPLANE
      ?AUTO_3793 - TRUCK
      ?AUTO_3797 - LOCATION
      ?AUTO_3798 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3796 ) ( AIRPORT ?AUTO_3792 ) ( not ( = ?AUTO_3796 ?AUTO_3792 ) ) ( AIRPORT ?AUTO_3795 ) ( AIRPLANE-AT ?AUTO_3794 ?AUTO_3795 ) ( not ( = ?AUTO_3795 ?AUTO_3796 ) ) ( not ( = ?AUTO_3792 ?AUTO_3795 ) ) ( IN-TRUCK ?AUTO_3791 ?AUTO_3793 ) ( TRUCK-AT ?AUTO_3793 ?AUTO_3797 ) ( IN-CITY ?AUTO_3797 ?AUTO_3798 ) ( IN-CITY ?AUTO_3796 ?AUTO_3798 ) ( not ( = ?AUTO_3796 ?AUTO_3797 ) ) ( not ( = ?AUTO_3792 ?AUTO_3797 ) ) ( not ( = ?AUTO_3795 ?AUTO_3797 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3793 ?AUTO_3797 ?AUTO_3796 ?AUTO_3798 )
      ( DELIVER-PKG ?AUTO_3791 ?AUTO_3792 )
      ( DELIVER-PKG-VERIFY ?AUTO_3791 ?AUTO_3792 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3803 - OBJ
      ?AUTO_3804 - LOCATION
    )
    :vars
    (
      ?AUTO_3809 - LOCATION
      ?AUTO_3806 - LOCATION
      ?AUTO_3807 - AIRPLANE
      ?AUTO_3810 - TRUCK
      ?AUTO_3805 - LOCATION
      ?AUTO_3808 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3809 ) ( AIRPORT ?AUTO_3804 ) ( not ( = ?AUTO_3809 ?AUTO_3804 ) ) ( AIRPORT ?AUTO_3806 ) ( AIRPLANE-AT ?AUTO_3807 ?AUTO_3806 ) ( not ( = ?AUTO_3806 ?AUTO_3809 ) ) ( not ( = ?AUTO_3804 ?AUTO_3806 ) ) ( TRUCK-AT ?AUTO_3810 ?AUTO_3805 ) ( IN-CITY ?AUTO_3805 ?AUTO_3808 ) ( IN-CITY ?AUTO_3809 ?AUTO_3808 ) ( not ( = ?AUTO_3809 ?AUTO_3805 ) ) ( not ( = ?AUTO_3804 ?AUTO_3805 ) ) ( not ( = ?AUTO_3806 ?AUTO_3805 ) ) ( OBJ-AT ?AUTO_3803 ?AUTO_3805 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3803 ?AUTO_3810 ?AUTO_3805 )
      ( DELIVER-PKG ?AUTO_3803 ?AUTO_3804 )
      ( DELIVER-PKG-VERIFY ?AUTO_3803 ?AUTO_3804 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3811 - OBJ
      ?AUTO_3812 - LOCATION
    )
    :vars
    (
      ?AUTO_3818 - LOCATION
      ?AUTO_3815 - LOCATION
      ?AUTO_3817 - AIRPLANE
      ?AUTO_3813 - LOCATION
      ?AUTO_3816 - CITY
      ?AUTO_3814 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3818 ) ( AIRPORT ?AUTO_3812 ) ( not ( = ?AUTO_3818 ?AUTO_3812 ) ) ( AIRPORT ?AUTO_3815 ) ( AIRPLANE-AT ?AUTO_3817 ?AUTO_3815 ) ( not ( = ?AUTO_3815 ?AUTO_3818 ) ) ( not ( = ?AUTO_3812 ?AUTO_3815 ) ) ( IN-CITY ?AUTO_3813 ?AUTO_3816 ) ( IN-CITY ?AUTO_3818 ?AUTO_3816 ) ( not ( = ?AUTO_3818 ?AUTO_3813 ) ) ( not ( = ?AUTO_3812 ?AUTO_3813 ) ) ( not ( = ?AUTO_3815 ?AUTO_3813 ) ) ( OBJ-AT ?AUTO_3811 ?AUTO_3813 ) ( TRUCK-AT ?AUTO_3814 ?AUTO_3818 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3814 ?AUTO_3818 ?AUTO_3813 ?AUTO_3816 )
      ( DELIVER-PKG ?AUTO_3811 ?AUTO_3812 )
      ( DELIVER-PKG-VERIFY ?AUTO_3811 ?AUTO_3812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3839 - OBJ
      ?AUTO_3840 - LOCATION
    )
    :vars
    (
      ?AUTO_3841 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3841 ?AUTO_3840 ) ( IN-TRUCK ?AUTO_3839 ?AUTO_3841 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3839 ?AUTO_3841 ?AUTO_3840 )
      ( DELIVER-PKG-VERIFY ?AUTO_3839 ?AUTO_3840 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3846 - OBJ
      ?AUTO_3847 - LOCATION
    )
    :vars
    (
      ?AUTO_3848 - TRUCK
      ?AUTO_3849 - LOCATION
      ?AUTO_3850 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3846 ?AUTO_3848 ) ( TRUCK-AT ?AUTO_3848 ?AUTO_3849 ) ( IN-CITY ?AUTO_3849 ?AUTO_3850 ) ( IN-CITY ?AUTO_3847 ?AUTO_3850 ) ( not ( = ?AUTO_3847 ?AUTO_3849 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3848 ?AUTO_3849 ?AUTO_3847 ?AUTO_3850 )
      ( DELIVER-PKG ?AUTO_3846 ?AUTO_3847 )
      ( DELIVER-PKG-VERIFY ?AUTO_3846 ?AUTO_3847 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3911 - OBJ
      ?AUTO_3912 - LOCATION
    )
    :vars
    (
      ?AUTO_3913 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3913 ?AUTO_3912 ) ( IN-TRUCK ?AUTO_3911 ?AUTO_3913 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3911 ?AUTO_3913 ?AUTO_3912 )
      ( DELIVER-PKG-VERIFY ?AUTO_3911 ?AUTO_3912 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3982 - OBJ
      ?AUTO_3983 - LOCATION
    )
    :vars
    (
      ?AUTO_3984 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3982 ?AUTO_3984 ) ( AIRPLANE-AT ?AUTO_3984 ?AUTO_3983 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3982 ?AUTO_3984 ?AUTO_3983 )
      ( DELIVER-PKG-VERIFY ?AUTO_3982 ?AUTO_3983 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3993 - OBJ
      ?AUTO_3994 - LOCATION
    )
    :vars
    (
      ?AUTO_3995 - AIRPLANE
      ?AUTO_3996 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3993 ?AUTO_3995 ) ( AIRPORT ?AUTO_3996 ) ( AIRPORT ?AUTO_3994 ) ( AIRPLANE-AT ?AUTO_3995 ?AUTO_3996 ) ( not ( = ?AUTO_3996 ?AUTO_3994 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3995 ?AUTO_3996 ?AUTO_3994 )
      ( DELIVER-PKG ?AUTO_3993 ?AUTO_3994 )
      ( DELIVER-PKG-VERIFY ?AUTO_3993 ?AUTO_3994 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4061 - OBJ
      ?AUTO_4062 - LOCATION
    )
    :vars
    (
      ?AUTO_4063 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4061 ?AUTO_4063 ) ( AIRPLANE-AT ?AUTO_4063 ?AUTO_4062 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4061 ?AUTO_4063 ?AUTO_4062 )
      ( DELIVER-PKG-VERIFY ?AUTO_4061 ?AUTO_4062 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4064 - OBJ
      ?AUTO_4065 - LOCATION
    )
    :vars
    (
      ?AUTO_4066 - AIRPLANE
      ?AUTO_4067 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4064 ?AUTO_4066 ) ( AIRPORT ?AUTO_4067 ) ( AIRPORT ?AUTO_4065 ) ( AIRPLANE-AT ?AUTO_4066 ?AUTO_4067 ) ( not ( = ?AUTO_4067 ?AUTO_4065 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4066 ?AUTO_4067 ?AUTO_4065 )
      ( DELIVER-PKG ?AUTO_4064 ?AUTO_4065 )
      ( DELIVER-PKG-VERIFY ?AUTO_4064 ?AUTO_4065 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4110 - OBJ
      ?AUTO_4111 - LOCATION
    )
    :vars
    (
      ?AUTO_4116 - TRUCK
      ?AUTO_4114 - LOCATION
      ?AUTO_4117 - CITY
      ?AUTO_4112 - LOCATION
      ?AUTO_4115 - LOCATION
      ?AUTO_4113 - AIRPLANE
      ?AUTO_4118 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4116 ?AUTO_4114 ) ( IN-CITY ?AUTO_4114 ?AUTO_4117 ) ( IN-CITY ?AUTO_4111 ?AUTO_4117 ) ( not ( = ?AUTO_4111 ?AUTO_4114 ) ) ( AIRPORT ?AUTO_4112 ) ( AIRPORT ?AUTO_4114 ) ( not ( = ?AUTO_4112 ?AUTO_4114 ) ) ( not ( = ?AUTO_4111 ?AUTO_4112 ) ) ( AIRPORT ?AUTO_4115 ) ( AIRPLANE-AT ?AUTO_4113 ?AUTO_4115 ) ( not ( = ?AUTO_4115 ?AUTO_4112 ) ) ( not ( = ?AUTO_4111 ?AUTO_4115 ) ) ( not ( = ?AUTO_4114 ?AUTO_4115 ) ) ( TRUCK-AT ?AUTO_4118 ?AUTO_4112 ) ( IN-TRUCK ?AUTO_4110 ?AUTO_4118 ) ( not ( = ?AUTO_4116 ?AUTO_4118 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4110 ?AUTO_4118 ?AUTO_4112 )
      ( DELIVER-PKG ?AUTO_4110 ?AUTO_4111 )
      ( DELIVER-PKG-VERIFY ?AUTO_4110 ?AUTO_4111 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4125 - OBJ
      ?AUTO_4126 - LOCATION
    )
    :vars
    (
      ?AUTO_4130 - LOCATION
      ?AUTO_4132 - LOCATION
      ?AUTO_4129 - AIRPLANE
      ?AUTO_4131 - TRUCK
      ?AUTO_4127 - LOCATION
      ?AUTO_4128 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4130 ) ( AIRPORT ?AUTO_4126 ) ( not ( = ?AUTO_4130 ?AUTO_4126 ) ) ( AIRPORT ?AUTO_4132 ) ( AIRPLANE-AT ?AUTO_4129 ?AUTO_4132 ) ( not ( = ?AUTO_4132 ?AUTO_4130 ) ) ( not ( = ?AUTO_4126 ?AUTO_4132 ) ) ( TRUCK-AT ?AUTO_4131 ?AUTO_4127 ) ( IN-CITY ?AUTO_4127 ?AUTO_4128 ) ( IN-CITY ?AUTO_4130 ?AUTO_4128 ) ( not ( = ?AUTO_4130 ?AUTO_4127 ) ) ( not ( = ?AUTO_4126 ?AUTO_4127 ) ) ( not ( = ?AUTO_4132 ?AUTO_4127 ) ) ( OBJ-AT ?AUTO_4125 ?AUTO_4127 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4125 ?AUTO_4131 ?AUTO_4127 )
      ( DELIVER-PKG ?AUTO_4125 ?AUTO_4126 )
      ( DELIVER-PKG-VERIFY ?AUTO_4125 ?AUTO_4126 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4157 - OBJ
      ?AUTO_4158 - LOCATION
    )
    :vars
    (
      ?AUTO_4159 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4159 ?AUTO_4158 ) ( IN-TRUCK ?AUTO_4157 ?AUTO_4159 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4157 ?AUTO_4159 ?AUTO_4158 )
      ( DELIVER-PKG-VERIFY ?AUTO_4157 ?AUTO_4158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4168 - OBJ
      ?AUTO_4169 - LOCATION
    )
    :vars
    (
      ?AUTO_4170 - TRUCK
      ?AUTO_4171 - LOCATION
      ?AUTO_4172 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4168 ?AUTO_4170 ) ( TRUCK-AT ?AUTO_4170 ?AUTO_4171 ) ( IN-CITY ?AUTO_4171 ?AUTO_4172 ) ( IN-CITY ?AUTO_4169 ?AUTO_4172 ) ( not ( = ?AUTO_4169 ?AUTO_4171 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4170 ?AUTO_4171 ?AUTO_4169 ?AUTO_4172 )
      ( DELIVER-PKG ?AUTO_4168 ?AUTO_4169 )
      ( DELIVER-PKG-VERIFY ?AUTO_4168 ?AUTO_4169 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4173 - OBJ
      ?AUTO_4174 - LOCATION
    )
    :vars
    (
      ?AUTO_4175 - TRUCK
      ?AUTO_4176 - LOCATION
      ?AUTO_4177 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4175 ?AUTO_4176 ) ( IN-CITY ?AUTO_4176 ?AUTO_4177 ) ( IN-CITY ?AUTO_4174 ?AUTO_4177 ) ( not ( = ?AUTO_4174 ?AUTO_4176 ) ) ( OBJ-AT ?AUTO_4173 ?AUTO_4176 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4173 ?AUTO_4175 ?AUTO_4176 )
      ( DELIVER-PKG ?AUTO_4173 ?AUTO_4174 )
      ( DELIVER-PKG-VERIFY ?AUTO_4173 ?AUTO_4174 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4184 - OBJ
      ?AUTO_4185 - LOCATION
    )
    :vars
    (
      ?AUTO_4186 - TRUCK
      ?AUTO_4188 - LOCATION
      ?AUTO_4187 - CITY
      ?AUTO_4189 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4186 ?AUTO_4188 ) ( IN-CITY ?AUTO_4188 ?AUTO_4187 ) ( IN-CITY ?AUTO_4185 ?AUTO_4187 ) ( not ( = ?AUTO_4185 ?AUTO_4188 ) ) ( IN-AIRPLANE ?AUTO_4184 ?AUTO_4189 ) ( AIRPLANE-AT ?AUTO_4189 ?AUTO_4188 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4184 ?AUTO_4189 ?AUTO_4188 )
      ( DELIVER-PKG ?AUTO_4184 ?AUTO_4185 )
      ( DELIVER-PKG-VERIFY ?AUTO_4184 ?AUTO_4185 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4198 - OBJ
      ?AUTO_4199 - LOCATION
    )
    :vars
    (
      ?AUTO_4200 - TRUCK
      ?AUTO_4201 - LOCATION
      ?AUTO_4202 - CITY
      ?AUTO_4203 - AIRPLANE
      ?AUTO_4204 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4200 ?AUTO_4201 ) ( IN-CITY ?AUTO_4201 ?AUTO_4202 ) ( IN-CITY ?AUTO_4199 ?AUTO_4202 ) ( not ( = ?AUTO_4199 ?AUTO_4201 ) ) ( IN-AIRPLANE ?AUTO_4198 ?AUTO_4203 ) ( AIRPORT ?AUTO_4204 ) ( AIRPORT ?AUTO_4201 ) ( AIRPLANE-AT ?AUTO_4203 ?AUTO_4204 ) ( not ( = ?AUTO_4204 ?AUTO_4201 ) ) ( not ( = ?AUTO_4199 ?AUTO_4204 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4203 ?AUTO_4204 ?AUTO_4201 )
      ( DELIVER-PKG ?AUTO_4198 ?AUTO_4199 )
      ( DELIVER-PKG-VERIFY ?AUTO_4198 ?AUTO_4199 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4227 - OBJ
      ?AUTO_4228 - LOCATION
    )
    :vars
    (
      ?AUTO_4231 - TRUCK
      ?AUTO_4234 - LOCATION
      ?AUTO_4230 - CITY
      ?AUTO_4229 - LOCATION
      ?AUTO_4235 - LOCATION
      ?AUTO_4233 - AIRPLANE
      ?AUTO_4232 - TRUCK
      ?AUTO_4236 - LOCATION
      ?AUTO_4237 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4231 ?AUTO_4234 ) ( IN-CITY ?AUTO_4234 ?AUTO_4230 ) ( IN-CITY ?AUTO_4228 ?AUTO_4230 ) ( not ( = ?AUTO_4228 ?AUTO_4234 ) ) ( AIRPORT ?AUTO_4229 ) ( AIRPORT ?AUTO_4234 ) ( not ( = ?AUTO_4229 ?AUTO_4234 ) ) ( not ( = ?AUTO_4228 ?AUTO_4229 ) ) ( AIRPORT ?AUTO_4235 ) ( AIRPLANE-AT ?AUTO_4233 ?AUTO_4235 ) ( not ( = ?AUTO_4235 ?AUTO_4229 ) ) ( not ( = ?AUTO_4228 ?AUTO_4235 ) ) ( not ( = ?AUTO_4234 ?AUTO_4235 ) ) ( IN-TRUCK ?AUTO_4227 ?AUTO_4232 ) ( not ( = ?AUTO_4231 ?AUTO_4232 ) ) ( TRUCK-AT ?AUTO_4232 ?AUTO_4236 ) ( IN-CITY ?AUTO_4236 ?AUTO_4237 ) ( IN-CITY ?AUTO_4229 ?AUTO_4237 ) ( not ( = ?AUTO_4229 ?AUTO_4236 ) ) ( not ( = ?AUTO_4228 ?AUTO_4236 ) ) ( not ( = ?AUTO_4234 ?AUTO_4236 ) ) ( not ( = ?AUTO_4230 ?AUTO_4237 ) ) ( not ( = ?AUTO_4235 ?AUTO_4236 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4232 ?AUTO_4236 ?AUTO_4229 ?AUTO_4237 )
      ( DELIVER-PKG ?AUTO_4227 ?AUTO_4228 )
      ( DELIVER-PKG-VERIFY ?AUTO_4227 ?AUTO_4228 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4242 - OBJ
      ?AUTO_4243 - LOCATION
    )
    :vars
    (
      ?AUTO_4248 - TRUCK
      ?AUTO_4246 - LOCATION
      ?AUTO_4244 - CITY
      ?AUTO_4249 - LOCATION
      ?AUTO_4252 - LOCATION
      ?AUTO_4250 - AIRPLANE
      ?AUTO_4247 - TRUCK
      ?AUTO_4245 - LOCATION
      ?AUTO_4251 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4248 ?AUTO_4246 ) ( IN-CITY ?AUTO_4246 ?AUTO_4244 ) ( IN-CITY ?AUTO_4243 ?AUTO_4244 ) ( not ( = ?AUTO_4243 ?AUTO_4246 ) ) ( AIRPORT ?AUTO_4249 ) ( AIRPORT ?AUTO_4246 ) ( not ( = ?AUTO_4249 ?AUTO_4246 ) ) ( not ( = ?AUTO_4243 ?AUTO_4249 ) ) ( AIRPORT ?AUTO_4252 ) ( AIRPLANE-AT ?AUTO_4250 ?AUTO_4252 ) ( not ( = ?AUTO_4252 ?AUTO_4249 ) ) ( not ( = ?AUTO_4243 ?AUTO_4252 ) ) ( not ( = ?AUTO_4246 ?AUTO_4252 ) ) ( not ( = ?AUTO_4248 ?AUTO_4247 ) ) ( TRUCK-AT ?AUTO_4247 ?AUTO_4245 ) ( IN-CITY ?AUTO_4245 ?AUTO_4251 ) ( IN-CITY ?AUTO_4249 ?AUTO_4251 ) ( not ( = ?AUTO_4249 ?AUTO_4245 ) ) ( not ( = ?AUTO_4243 ?AUTO_4245 ) ) ( not ( = ?AUTO_4246 ?AUTO_4245 ) ) ( not ( = ?AUTO_4244 ?AUTO_4251 ) ) ( not ( = ?AUTO_4252 ?AUTO_4245 ) ) ( OBJ-AT ?AUTO_4242 ?AUTO_4245 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4242 ?AUTO_4247 ?AUTO_4245 )
      ( DELIVER-PKG ?AUTO_4242 ?AUTO_4243 )
      ( DELIVER-PKG-VERIFY ?AUTO_4242 ?AUTO_4243 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4253 - OBJ
      ?AUTO_4254 - LOCATION
    )
    :vars
    (
      ?AUTO_4259 - TRUCK
      ?AUTO_4261 - LOCATION
      ?AUTO_4262 - CITY
      ?AUTO_4258 - LOCATION
      ?AUTO_4257 - LOCATION
      ?AUTO_4260 - AIRPLANE
      ?AUTO_4255 - TRUCK
      ?AUTO_4256 - LOCATION
      ?AUTO_4263 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4259 ?AUTO_4261 ) ( IN-CITY ?AUTO_4261 ?AUTO_4262 ) ( IN-CITY ?AUTO_4254 ?AUTO_4262 ) ( not ( = ?AUTO_4254 ?AUTO_4261 ) ) ( AIRPORT ?AUTO_4258 ) ( AIRPORT ?AUTO_4261 ) ( not ( = ?AUTO_4258 ?AUTO_4261 ) ) ( not ( = ?AUTO_4254 ?AUTO_4258 ) ) ( AIRPORT ?AUTO_4257 ) ( AIRPLANE-AT ?AUTO_4260 ?AUTO_4257 ) ( not ( = ?AUTO_4257 ?AUTO_4258 ) ) ( not ( = ?AUTO_4254 ?AUTO_4257 ) ) ( not ( = ?AUTO_4261 ?AUTO_4257 ) ) ( not ( = ?AUTO_4259 ?AUTO_4255 ) ) ( IN-CITY ?AUTO_4256 ?AUTO_4263 ) ( IN-CITY ?AUTO_4258 ?AUTO_4263 ) ( not ( = ?AUTO_4258 ?AUTO_4256 ) ) ( not ( = ?AUTO_4254 ?AUTO_4256 ) ) ( not ( = ?AUTO_4261 ?AUTO_4256 ) ) ( not ( = ?AUTO_4262 ?AUTO_4263 ) ) ( not ( = ?AUTO_4257 ?AUTO_4256 ) ) ( OBJ-AT ?AUTO_4253 ?AUTO_4256 ) ( TRUCK-AT ?AUTO_4255 ?AUTO_4258 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4255 ?AUTO_4258 ?AUTO_4256 ?AUTO_4263 )
      ( DELIVER-PKG ?AUTO_4253 ?AUTO_4254 )
      ( DELIVER-PKG-VERIFY ?AUTO_4253 ?AUTO_4254 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4266 - OBJ
      ?AUTO_4267 - LOCATION
    )
    :vars
    (
      ?AUTO_4270 - LOCATION
      ?AUTO_4274 - CITY
      ?AUTO_4275 - LOCATION
      ?AUTO_4276 - LOCATION
      ?AUTO_4273 - AIRPLANE
      ?AUTO_4268 - TRUCK
      ?AUTO_4269 - TRUCK
      ?AUTO_4272 - LOCATION
      ?AUTO_4271 - CITY
      ?AUTO_4277 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4270 ?AUTO_4274 ) ( IN-CITY ?AUTO_4267 ?AUTO_4274 ) ( not ( = ?AUTO_4267 ?AUTO_4270 ) ) ( AIRPORT ?AUTO_4275 ) ( AIRPORT ?AUTO_4270 ) ( not ( = ?AUTO_4275 ?AUTO_4270 ) ) ( not ( = ?AUTO_4267 ?AUTO_4275 ) ) ( AIRPORT ?AUTO_4276 ) ( AIRPLANE-AT ?AUTO_4273 ?AUTO_4276 ) ( not ( = ?AUTO_4276 ?AUTO_4275 ) ) ( not ( = ?AUTO_4267 ?AUTO_4276 ) ) ( not ( = ?AUTO_4270 ?AUTO_4276 ) ) ( not ( = ?AUTO_4268 ?AUTO_4269 ) ) ( IN-CITY ?AUTO_4272 ?AUTO_4271 ) ( IN-CITY ?AUTO_4275 ?AUTO_4271 ) ( not ( = ?AUTO_4275 ?AUTO_4272 ) ) ( not ( = ?AUTO_4267 ?AUTO_4272 ) ) ( not ( = ?AUTO_4270 ?AUTO_4272 ) ) ( not ( = ?AUTO_4274 ?AUTO_4271 ) ) ( not ( = ?AUTO_4276 ?AUTO_4272 ) ) ( OBJ-AT ?AUTO_4266 ?AUTO_4272 ) ( TRUCK-AT ?AUTO_4269 ?AUTO_4275 ) ( TRUCK-AT ?AUTO_4268 ?AUTO_4277 ) ( IN-CITY ?AUTO_4277 ?AUTO_4274 ) ( not ( = ?AUTO_4270 ?AUTO_4277 ) ) ( not ( = ?AUTO_4267 ?AUTO_4277 ) ) ( not ( = ?AUTO_4275 ?AUTO_4277 ) ) ( not ( = ?AUTO_4276 ?AUTO_4277 ) ) ( not ( = ?AUTO_4272 ?AUTO_4277 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4268 ?AUTO_4277 ?AUTO_4270 ?AUTO_4274 )
      ( DELIVER-PKG ?AUTO_4266 ?AUTO_4267 )
      ( DELIVER-PKG-VERIFY ?AUTO_4266 ?AUTO_4267 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4294 - OBJ
      ?AUTO_4295 - LOCATION
    )
    :vars
    (
      ?AUTO_4296 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4294 ?AUTO_4296 ) ( AIRPLANE-AT ?AUTO_4296 ?AUTO_4295 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4294 ?AUTO_4296 ?AUTO_4295 )
      ( DELIVER-PKG-VERIFY ?AUTO_4294 ?AUTO_4295 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4299 - OBJ
      ?AUTO_4300 - LOCATION
    )
    :vars
    (
      ?AUTO_4301 - AIRPLANE
      ?AUTO_4302 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4299 ?AUTO_4301 ) ( AIRPORT ?AUTO_4302 ) ( AIRPORT ?AUTO_4300 ) ( AIRPLANE-AT ?AUTO_4301 ?AUTO_4302 ) ( not ( = ?AUTO_4302 ?AUTO_4300 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4301 ?AUTO_4302 ?AUTO_4300 )
      ( DELIVER-PKG ?AUTO_4299 ?AUTO_4300 )
      ( DELIVER-PKG-VERIFY ?AUTO_4299 ?AUTO_4300 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4347 - OBJ
      ?AUTO_4348 - LOCATION
    )
    :vars
    (
      ?AUTO_4351 - LOCATION
      ?AUTO_4350 - LOCATION
      ?AUTO_4349 - AIRPLANE
      ?AUTO_4352 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4351 ) ( AIRPORT ?AUTO_4348 ) ( not ( = ?AUTO_4351 ?AUTO_4348 ) ) ( AIRPORT ?AUTO_4350 ) ( AIRPLANE-AT ?AUTO_4349 ?AUTO_4350 ) ( not ( = ?AUTO_4350 ?AUTO_4351 ) ) ( not ( = ?AUTO_4348 ?AUTO_4350 ) ) ( TRUCK-AT ?AUTO_4352 ?AUTO_4351 ) ( IN-TRUCK ?AUTO_4347 ?AUTO_4352 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4347 ?AUTO_4352 ?AUTO_4351 )
      ( DELIVER-PKG ?AUTO_4347 ?AUTO_4348 )
      ( DELIVER-PKG-VERIFY ?AUTO_4347 ?AUTO_4348 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4359 - OBJ
      ?AUTO_4360 - LOCATION
    )
    :vars
    (
      ?AUTO_4364 - LOCATION
      ?AUTO_4365 - LOCATION
      ?AUTO_4361 - AIRPLANE
      ?AUTO_4362 - TRUCK
      ?AUTO_4363 - LOCATION
      ?AUTO_4366 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4364 ) ( AIRPORT ?AUTO_4360 ) ( not ( = ?AUTO_4364 ?AUTO_4360 ) ) ( AIRPORT ?AUTO_4365 ) ( AIRPLANE-AT ?AUTO_4361 ?AUTO_4365 ) ( not ( = ?AUTO_4365 ?AUTO_4364 ) ) ( not ( = ?AUTO_4360 ?AUTO_4365 ) ) ( TRUCK-AT ?AUTO_4362 ?AUTO_4363 ) ( IN-CITY ?AUTO_4363 ?AUTO_4366 ) ( IN-CITY ?AUTO_4364 ?AUTO_4366 ) ( not ( = ?AUTO_4364 ?AUTO_4363 ) ) ( not ( = ?AUTO_4360 ?AUTO_4363 ) ) ( not ( = ?AUTO_4365 ?AUTO_4363 ) ) ( OBJ-AT ?AUTO_4359 ?AUTO_4363 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4359 ?AUTO_4362 ?AUTO_4363 )
      ( DELIVER-PKG ?AUTO_4359 ?AUTO_4360 )
      ( DELIVER-PKG-VERIFY ?AUTO_4359 ?AUTO_4360 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4393 - OBJ
      ?AUTO_4394 - LOCATION
    )
    :vars
    (
      ?AUTO_4395 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4393 ?AUTO_4395 ) ( AIRPLANE-AT ?AUTO_4395 ?AUTO_4394 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4393 ?AUTO_4395 ?AUTO_4394 )
      ( DELIVER-PKG-VERIFY ?AUTO_4393 ?AUTO_4394 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4396 - OBJ
      ?AUTO_4397 - LOCATION
    )
    :vars
    (
      ?AUTO_4398 - AIRPLANE
      ?AUTO_4399 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4396 ?AUTO_4398 ) ( AIRPORT ?AUTO_4399 ) ( AIRPORT ?AUTO_4397 ) ( AIRPLANE-AT ?AUTO_4398 ?AUTO_4399 ) ( not ( = ?AUTO_4399 ?AUTO_4397 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4398 ?AUTO_4399 ?AUTO_4397 )
      ( DELIVER-PKG ?AUTO_4396 ?AUTO_4397 )
      ( DELIVER-PKG-VERIFY ?AUTO_4396 ?AUTO_4397 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4402 - OBJ
      ?AUTO_4403 - LOCATION
    )
    :vars
    (
      ?AUTO_4404 - LOCATION
      ?AUTO_4405 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4404 ) ( AIRPORT ?AUTO_4403 ) ( AIRPLANE-AT ?AUTO_4405 ?AUTO_4404 ) ( not ( = ?AUTO_4404 ?AUTO_4403 ) ) ( OBJ-AT ?AUTO_4402 ?AUTO_4404 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4402 ?AUTO_4405 ?AUTO_4404 )
      ( DELIVER-PKG ?AUTO_4402 ?AUTO_4403 )
      ( DELIVER-PKG-VERIFY ?AUTO_4402 ?AUTO_4403 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4406 - OBJ
      ?AUTO_4407 - LOCATION
    )
    :vars
    (
      ?AUTO_4408 - LOCATION
      ?AUTO_4409 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4408 ) ( AIRPORT ?AUTO_4407 ) ( not ( = ?AUTO_4408 ?AUTO_4407 ) ) ( OBJ-AT ?AUTO_4406 ?AUTO_4408 ) ( AIRPLANE-AT ?AUTO_4409 ?AUTO_4407 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4409 ?AUTO_4407 ?AUTO_4408 )
      ( DELIVER-PKG ?AUTO_4406 ?AUTO_4407 )
      ( DELIVER-PKG-VERIFY ?AUTO_4406 ?AUTO_4407 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4428 - OBJ
      ?AUTO_4429 - LOCATION
    )
    :vars
    (
      ?AUTO_4430 - LOCATION
      ?AUTO_4431 - AIRPLANE
      ?AUTO_4432 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4430 ) ( AIRPORT ?AUTO_4429 ) ( not ( = ?AUTO_4430 ?AUTO_4429 ) ) ( AIRPLANE-AT ?AUTO_4431 ?AUTO_4429 ) ( TRUCK-AT ?AUTO_4432 ?AUTO_4430 ) ( IN-TRUCK ?AUTO_4428 ?AUTO_4432 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4428 ?AUTO_4432 ?AUTO_4430 )
      ( DELIVER-PKG ?AUTO_4428 ?AUTO_4429 )
      ( DELIVER-PKG-VERIFY ?AUTO_4428 ?AUTO_4429 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4437 - OBJ
      ?AUTO_4438 - LOCATION
    )
    :vars
    (
      ?AUTO_4439 - LOCATION
      ?AUTO_4440 - AIRPLANE
      ?AUTO_4441 - TRUCK
      ?AUTO_4442 - LOCATION
      ?AUTO_4443 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4439 ) ( AIRPORT ?AUTO_4438 ) ( not ( = ?AUTO_4439 ?AUTO_4438 ) ) ( AIRPLANE-AT ?AUTO_4440 ?AUTO_4438 ) ( IN-TRUCK ?AUTO_4437 ?AUTO_4441 ) ( TRUCK-AT ?AUTO_4441 ?AUTO_4442 ) ( IN-CITY ?AUTO_4442 ?AUTO_4443 ) ( IN-CITY ?AUTO_4439 ?AUTO_4443 ) ( not ( = ?AUTO_4439 ?AUTO_4442 ) ) ( not ( = ?AUTO_4438 ?AUTO_4442 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4441 ?AUTO_4442 ?AUTO_4439 ?AUTO_4443 )
      ( DELIVER-PKG ?AUTO_4437 ?AUTO_4438 )
      ( DELIVER-PKG-VERIFY ?AUTO_4437 ?AUTO_4438 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4504 - OBJ
      ?AUTO_4505 - LOCATION
    )
    :vars
    (
      ?AUTO_4506 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4504 ?AUTO_4506 ) ( AIRPLANE-AT ?AUTO_4506 ?AUTO_4505 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4504 ?AUTO_4506 ?AUTO_4505 )
      ( DELIVER-PKG-VERIFY ?AUTO_4504 ?AUTO_4505 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4511 - OBJ
      ?AUTO_4512 - LOCATION
    )
    :vars
    (
      ?AUTO_4514 - LOCATION
      ?AUTO_4513 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4514 ) ( AIRPORT ?AUTO_4512 ) ( AIRPLANE-AT ?AUTO_4513 ?AUTO_4514 ) ( not ( = ?AUTO_4514 ?AUTO_4512 ) ) ( OBJ-AT ?AUTO_4511 ?AUTO_4514 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4511 ?AUTO_4513 ?AUTO_4514 )
      ( DELIVER-PKG ?AUTO_4511 ?AUTO_4512 )
      ( DELIVER-PKG-VERIFY ?AUTO_4511 ?AUTO_4512 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4535 - OBJ
      ?AUTO_4536 - LOCATION
    )
    :vars
    (
      ?AUTO_4537 - LOCATION
      ?AUTO_4538 - AIRPLANE
      ?AUTO_4539 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4537 ) ( AIRPORT ?AUTO_4536 ) ( not ( = ?AUTO_4537 ?AUTO_4536 ) ) ( AIRPLANE-AT ?AUTO_4538 ?AUTO_4536 ) ( TRUCK-AT ?AUTO_4539 ?AUTO_4537 ) ( IN-TRUCK ?AUTO_4535 ?AUTO_4539 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4535 ?AUTO_4539 ?AUTO_4537 )
      ( DELIVER-PKG ?AUTO_4535 ?AUTO_4536 )
      ( DELIVER-PKG-VERIFY ?AUTO_4535 ?AUTO_4536 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4608 - OBJ
      ?AUTO_4609 - LOCATION
    )
    :vars
    (
      ?AUTO_4610 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4610 ?AUTO_4609 ) ( IN-TRUCK ?AUTO_4608 ?AUTO_4610 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4608 ?AUTO_4610 ?AUTO_4609 )
      ( DELIVER-PKG-VERIFY ?AUTO_4608 ?AUTO_4609 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4615 - OBJ
      ?AUTO_4616 - LOCATION
    )
    :vars
    (
      ?AUTO_4617 - TRUCK
      ?AUTO_4618 - LOCATION
      ?AUTO_4619 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4615 ?AUTO_4617 ) ( TRUCK-AT ?AUTO_4617 ?AUTO_4618 ) ( IN-CITY ?AUTO_4618 ?AUTO_4619 ) ( IN-CITY ?AUTO_4616 ?AUTO_4619 ) ( not ( = ?AUTO_4616 ?AUTO_4618 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4617 ?AUTO_4618 ?AUTO_4616 ?AUTO_4619 )
      ( DELIVER-PKG ?AUTO_4615 ?AUTO_4616 )
      ( DELIVER-PKG-VERIFY ?AUTO_4615 ?AUTO_4616 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4620 - OBJ
      ?AUTO_4621 - LOCATION
    )
    :vars
    (
      ?AUTO_4622 - TRUCK
      ?AUTO_4623 - LOCATION
      ?AUTO_4624 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4622 ?AUTO_4623 ) ( IN-CITY ?AUTO_4623 ?AUTO_4624 ) ( IN-CITY ?AUTO_4621 ?AUTO_4624 ) ( not ( = ?AUTO_4621 ?AUTO_4623 ) ) ( OBJ-AT ?AUTO_4620 ?AUTO_4623 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4620 ?AUTO_4622 ?AUTO_4623 )
      ( DELIVER-PKG ?AUTO_4620 ?AUTO_4621 )
      ( DELIVER-PKG-VERIFY ?AUTO_4620 ?AUTO_4621 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4627 - OBJ
      ?AUTO_4628 - LOCATION
    )
    :vars
    (
      ?AUTO_4630 - TRUCK
      ?AUTO_4629 - LOCATION
      ?AUTO_4631 - CITY
      ?AUTO_4632 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4630 ?AUTO_4629 ) ( IN-CITY ?AUTO_4629 ?AUTO_4631 ) ( IN-CITY ?AUTO_4628 ?AUTO_4631 ) ( not ( = ?AUTO_4628 ?AUTO_4629 ) ) ( IN-AIRPLANE ?AUTO_4627 ?AUTO_4632 ) ( AIRPLANE-AT ?AUTO_4632 ?AUTO_4629 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4627 ?AUTO_4632 ?AUTO_4629 )
      ( DELIVER-PKG ?AUTO_4627 ?AUTO_4628 )
      ( DELIVER-PKG-VERIFY ?AUTO_4627 ?AUTO_4628 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4633 - OBJ
      ?AUTO_4634 - LOCATION
    )
    :vars
    (
      ?AUTO_4636 - TRUCK
      ?AUTO_4635 - LOCATION
      ?AUTO_4637 - CITY
      ?AUTO_4638 - AIRPLANE
      ?AUTO_4639 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4636 ?AUTO_4635 ) ( IN-CITY ?AUTO_4635 ?AUTO_4637 ) ( IN-CITY ?AUTO_4634 ?AUTO_4637 ) ( not ( = ?AUTO_4634 ?AUTO_4635 ) ) ( IN-AIRPLANE ?AUTO_4633 ?AUTO_4638 ) ( AIRPORT ?AUTO_4639 ) ( AIRPORT ?AUTO_4635 ) ( AIRPLANE-AT ?AUTO_4638 ?AUTO_4639 ) ( not ( = ?AUTO_4639 ?AUTO_4635 ) ) ( not ( = ?AUTO_4634 ?AUTO_4639 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4638 ?AUTO_4639 ?AUTO_4635 )
      ( DELIVER-PKG ?AUTO_4633 ?AUTO_4634 )
      ( DELIVER-PKG-VERIFY ?AUTO_4633 ?AUTO_4634 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4642 - OBJ
      ?AUTO_4643 - LOCATION
    )
    :vars
    (
      ?AUTO_4648 - TRUCK
      ?AUTO_4645 - LOCATION
      ?AUTO_4644 - CITY
      ?AUTO_4646 - LOCATION
      ?AUTO_4647 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4648 ?AUTO_4645 ) ( IN-CITY ?AUTO_4645 ?AUTO_4644 ) ( IN-CITY ?AUTO_4643 ?AUTO_4644 ) ( not ( = ?AUTO_4643 ?AUTO_4645 ) ) ( AIRPORT ?AUTO_4646 ) ( AIRPORT ?AUTO_4645 ) ( AIRPLANE-AT ?AUTO_4647 ?AUTO_4646 ) ( not ( = ?AUTO_4646 ?AUTO_4645 ) ) ( not ( = ?AUTO_4643 ?AUTO_4646 ) ) ( OBJ-AT ?AUTO_4642 ?AUTO_4646 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4642 ?AUTO_4647 ?AUTO_4646 )
      ( DELIVER-PKG ?AUTO_4642 ?AUTO_4643 )
      ( DELIVER-PKG-VERIFY ?AUTO_4642 ?AUTO_4643 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4649 - OBJ
      ?AUTO_4650 - LOCATION
    )
    :vars
    (
      ?AUTO_4652 - TRUCK
      ?AUTO_4651 - LOCATION
      ?AUTO_4653 - CITY
      ?AUTO_4655 - LOCATION
      ?AUTO_4654 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4652 ?AUTO_4651 ) ( IN-CITY ?AUTO_4651 ?AUTO_4653 ) ( IN-CITY ?AUTO_4650 ?AUTO_4653 ) ( not ( = ?AUTO_4650 ?AUTO_4651 ) ) ( AIRPORT ?AUTO_4655 ) ( AIRPORT ?AUTO_4651 ) ( not ( = ?AUTO_4655 ?AUTO_4651 ) ) ( not ( = ?AUTO_4650 ?AUTO_4655 ) ) ( OBJ-AT ?AUTO_4649 ?AUTO_4655 ) ( AIRPLANE-AT ?AUTO_4654 ?AUTO_4651 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4654 ?AUTO_4651 ?AUTO_4655 )
      ( DELIVER-PKG ?AUTO_4649 ?AUTO_4650 )
      ( DELIVER-PKG-VERIFY ?AUTO_4649 ?AUTO_4650 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4674 - OBJ
      ?AUTO_4675 - LOCATION
    )
    :vars
    (
      ?AUTO_4679 - TRUCK
      ?AUTO_4677 - LOCATION
      ?AUTO_4676 - CITY
      ?AUTO_4678 - LOCATION
      ?AUTO_4680 - AIRPLANE
      ?AUTO_4681 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4679 ?AUTO_4677 ) ( IN-CITY ?AUTO_4677 ?AUTO_4676 ) ( IN-CITY ?AUTO_4675 ?AUTO_4676 ) ( not ( = ?AUTO_4675 ?AUTO_4677 ) ) ( AIRPORT ?AUTO_4678 ) ( AIRPORT ?AUTO_4677 ) ( not ( = ?AUTO_4678 ?AUTO_4677 ) ) ( not ( = ?AUTO_4675 ?AUTO_4678 ) ) ( AIRPLANE-AT ?AUTO_4680 ?AUTO_4677 ) ( TRUCK-AT ?AUTO_4681 ?AUTO_4678 ) ( IN-TRUCK ?AUTO_4674 ?AUTO_4681 ) ( not ( = ?AUTO_4679 ?AUTO_4681 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4674 ?AUTO_4681 ?AUTO_4678 )
      ( DELIVER-PKG ?AUTO_4674 ?AUTO_4675 )
      ( DELIVER-PKG-VERIFY ?AUTO_4674 ?AUTO_4675 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4686 - OBJ
      ?AUTO_4687 - LOCATION
    )
    :vars
    (
      ?AUTO_4693 - TRUCK
      ?AUTO_4690 - LOCATION
      ?AUTO_4688 - CITY
      ?AUTO_4691 - LOCATION
      ?AUTO_4689 - AIRPLANE
      ?AUTO_4692 - TRUCK
      ?AUTO_4694 - LOCATION
      ?AUTO_4695 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4693 ?AUTO_4690 ) ( IN-CITY ?AUTO_4690 ?AUTO_4688 ) ( IN-CITY ?AUTO_4687 ?AUTO_4688 ) ( not ( = ?AUTO_4687 ?AUTO_4690 ) ) ( AIRPORT ?AUTO_4691 ) ( AIRPORT ?AUTO_4690 ) ( not ( = ?AUTO_4691 ?AUTO_4690 ) ) ( not ( = ?AUTO_4687 ?AUTO_4691 ) ) ( AIRPLANE-AT ?AUTO_4689 ?AUTO_4690 ) ( IN-TRUCK ?AUTO_4686 ?AUTO_4692 ) ( not ( = ?AUTO_4693 ?AUTO_4692 ) ) ( TRUCK-AT ?AUTO_4692 ?AUTO_4694 ) ( IN-CITY ?AUTO_4694 ?AUTO_4695 ) ( IN-CITY ?AUTO_4691 ?AUTO_4695 ) ( not ( = ?AUTO_4691 ?AUTO_4694 ) ) ( not ( = ?AUTO_4687 ?AUTO_4694 ) ) ( not ( = ?AUTO_4690 ?AUTO_4694 ) ) ( not ( = ?AUTO_4688 ?AUTO_4695 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4692 ?AUTO_4694 ?AUTO_4691 ?AUTO_4695 )
      ( DELIVER-PKG ?AUTO_4686 ?AUTO_4687 )
      ( DELIVER-PKG-VERIFY ?AUTO_4686 ?AUTO_4687 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4756 - OBJ
      ?AUTO_4757 - LOCATION
    )
    :vars
    (
      ?AUTO_4758 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4758 ?AUTO_4757 ) ( IN-TRUCK ?AUTO_4756 ?AUTO_4758 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4756 ?AUTO_4758 ?AUTO_4757 )
      ( DELIVER-PKG-VERIFY ?AUTO_4756 ?AUTO_4757 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4761 - OBJ
      ?AUTO_4762 - LOCATION
    )
    :vars
    (
      ?AUTO_4763 - TRUCK
      ?AUTO_4764 - LOCATION
      ?AUTO_4765 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4761 ?AUTO_4763 ) ( TRUCK-AT ?AUTO_4763 ?AUTO_4764 ) ( IN-CITY ?AUTO_4764 ?AUTO_4765 ) ( IN-CITY ?AUTO_4762 ?AUTO_4765 ) ( not ( = ?AUTO_4762 ?AUTO_4764 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4763 ?AUTO_4764 ?AUTO_4762 ?AUTO_4765 )
      ( DELIVER-PKG ?AUTO_4761 ?AUTO_4762 )
      ( DELIVER-PKG-VERIFY ?AUTO_4761 ?AUTO_4762 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4766 - OBJ
      ?AUTO_4767 - LOCATION
    )
    :vars
    (
      ?AUTO_4768 - TRUCK
      ?AUTO_4769 - LOCATION
      ?AUTO_4770 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4768 ?AUTO_4769 ) ( IN-CITY ?AUTO_4769 ?AUTO_4770 ) ( IN-CITY ?AUTO_4767 ?AUTO_4770 ) ( not ( = ?AUTO_4767 ?AUTO_4769 ) ) ( OBJ-AT ?AUTO_4766 ?AUTO_4769 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4766 ?AUTO_4768 ?AUTO_4769 )
      ( DELIVER-PKG ?AUTO_4766 ?AUTO_4767 )
      ( DELIVER-PKG-VERIFY ?AUTO_4766 ?AUTO_4767 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4775 - OBJ
      ?AUTO_4776 - LOCATION
    )
    :vars
    (
      ?AUTO_4779 - TRUCK
      ?AUTO_4778 - LOCATION
      ?AUTO_4777 - CITY
      ?AUTO_4780 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4779 ?AUTO_4778 ) ( IN-CITY ?AUTO_4778 ?AUTO_4777 ) ( IN-CITY ?AUTO_4776 ?AUTO_4777 ) ( not ( = ?AUTO_4776 ?AUTO_4778 ) ) ( IN-AIRPLANE ?AUTO_4775 ?AUTO_4780 ) ( AIRPLANE-AT ?AUTO_4780 ?AUTO_4778 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4775 ?AUTO_4780 ?AUTO_4778 )
      ( DELIVER-PKG ?AUTO_4775 ?AUTO_4776 )
      ( DELIVER-PKG-VERIFY ?AUTO_4775 ?AUTO_4776 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4785 - OBJ
      ?AUTO_4786 - LOCATION
    )
    :vars
    (
      ?AUTO_4791 - TRUCK
      ?AUTO_4788 - LOCATION
      ?AUTO_4787 - CITY
      ?AUTO_4790 - LOCATION
      ?AUTO_4789 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4791 ?AUTO_4788 ) ( IN-CITY ?AUTO_4788 ?AUTO_4787 ) ( IN-CITY ?AUTO_4786 ?AUTO_4787 ) ( not ( = ?AUTO_4786 ?AUTO_4788 ) ) ( AIRPORT ?AUTO_4790 ) ( AIRPORT ?AUTO_4788 ) ( AIRPLANE-AT ?AUTO_4789 ?AUTO_4790 ) ( not ( = ?AUTO_4790 ?AUTO_4788 ) ) ( not ( = ?AUTO_4786 ?AUTO_4790 ) ) ( OBJ-AT ?AUTO_4785 ?AUTO_4790 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4785 ?AUTO_4789 ?AUTO_4790 )
      ( DELIVER-PKG ?AUTO_4785 ?AUTO_4786 )
      ( DELIVER-PKG-VERIFY ?AUTO_4785 ?AUTO_4786 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4812 - OBJ
      ?AUTO_4813 - LOCATION
    )
    :vars
    (
      ?AUTO_4814 - TRUCK
      ?AUTO_4815 - LOCATION
      ?AUTO_4816 - CITY
      ?AUTO_4817 - LOCATION
      ?AUTO_4818 - AIRPLANE
      ?AUTO_4819 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4814 ?AUTO_4815 ) ( IN-CITY ?AUTO_4815 ?AUTO_4816 ) ( IN-CITY ?AUTO_4813 ?AUTO_4816 ) ( not ( = ?AUTO_4813 ?AUTO_4815 ) ) ( AIRPORT ?AUTO_4817 ) ( AIRPORT ?AUTO_4815 ) ( not ( = ?AUTO_4817 ?AUTO_4815 ) ) ( not ( = ?AUTO_4813 ?AUTO_4817 ) ) ( AIRPLANE-AT ?AUTO_4818 ?AUTO_4815 ) ( TRUCK-AT ?AUTO_4819 ?AUTO_4817 ) ( IN-TRUCK ?AUTO_4812 ?AUTO_4819 ) ( not ( = ?AUTO_4814 ?AUTO_4819 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4812 ?AUTO_4819 ?AUTO_4817 )
      ( DELIVER-PKG ?AUTO_4812 ?AUTO_4813 )
      ( DELIVER-PKG-VERIFY ?AUTO_4812 ?AUTO_4813 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4822 - OBJ
      ?AUTO_4823 - LOCATION
    )
    :vars
    (
      ?AUTO_4824 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4824 ?AUTO_4823 ) ( IN-TRUCK ?AUTO_4822 ?AUTO_4824 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4822 ?AUTO_4824 ?AUTO_4823 )
      ( DELIVER-PKG-VERIFY ?AUTO_4822 ?AUTO_4823 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4825 - OBJ
      ?AUTO_4826 - LOCATION
    )
    :vars
    (
      ?AUTO_4827 - TRUCK
      ?AUTO_4828 - LOCATION
      ?AUTO_4829 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4825 ?AUTO_4827 ) ( TRUCK-AT ?AUTO_4827 ?AUTO_4828 ) ( IN-CITY ?AUTO_4828 ?AUTO_4829 ) ( IN-CITY ?AUTO_4826 ?AUTO_4829 ) ( not ( = ?AUTO_4826 ?AUTO_4828 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4827 ?AUTO_4828 ?AUTO_4826 ?AUTO_4829 )
      ( DELIVER-PKG ?AUTO_4825 ?AUTO_4826 )
      ( DELIVER-PKG-VERIFY ?AUTO_4825 ?AUTO_4826 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4830 - OBJ
      ?AUTO_4831 - LOCATION
    )
    :vars
    (
      ?AUTO_4832 - TRUCK
      ?AUTO_4833 - LOCATION
      ?AUTO_4834 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4832 ?AUTO_4833 ) ( IN-CITY ?AUTO_4833 ?AUTO_4834 ) ( IN-CITY ?AUTO_4831 ?AUTO_4834 ) ( not ( = ?AUTO_4831 ?AUTO_4833 ) ) ( OBJ-AT ?AUTO_4830 ?AUTO_4833 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4830 ?AUTO_4832 ?AUTO_4833 )
      ( DELIVER-PKG ?AUTO_4830 ?AUTO_4831 )
      ( DELIVER-PKG-VERIFY ?AUTO_4830 ?AUTO_4831 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4835 - OBJ
      ?AUTO_4836 - LOCATION
    )
    :vars
    (
      ?AUTO_4837 - LOCATION
      ?AUTO_4839 - CITY
      ?AUTO_4838 - TRUCK
      ?AUTO_4840 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4837 ?AUTO_4839 ) ( IN-CITY ?AUTO_4836 ?AUTO_4839 ) ( not ( = ?AUTO_4836 ?AUTO_4837 ) ) ( OBJ-AT ?AUTO_4835 ?AUTO_4837 ) ( TRUCK-AT ?AUTO_4838 ?AUTO_4840 ) ( IN-CITY ?AUTO_4840 ?AUTO_4839 ) ( not ( = ?AUTO_4837 ?AUTO_4840 ) ) ( not ( = ?AUTO_4836 ?AUTO_4840 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4838 ?AUTO_4840 ?AUTO_4837 ?AUTO_4839 )
      ( DELIVER-PKG ?AUTO_4835 ?AUTO_4836 )
      ( DELIVER-PKG-VERIFY ?AUTO_4835 ?AUTO_4836 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4843 - OBJ
      ?AUTO_4844 - LOCATION
    )
    :vars
    (
      ?AUTO_4845 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4843 ?AUTO_4845 ) ( AIRPLANE-AT ?AUTO_4845 ?AUTO_4844 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4843 ?AUTO_4845 ?AUTO_4844 )
      ( DELIVER-PKG-VERIFY ?AUTO_4843 ?AUTO_4844 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4846 - OBJ
      ?AUTO_4847 - LOCATION
    )
    :vars
    (
      ?AUTO_4848 - AIRPLANE
      ?AUTO_4849 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4846 ?AUTO_4848 ) ( AIRPORT ?AUTO_4849 ) ( AIRPORT ?AUTO_4847 ) ( AIRPLANE-AT ?AUTO_4848 ?AUTO_4849 ) ( not ( = ?AUTO_4849 ?AUTO_4847 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4848 ?AUTO_4849 ?AUTO_4847 )
      ( DELIVER-PKG ?AUTO_4846 ?AUTO_4847 )
      ( DELIVER-PKG-VERIFY ?AUTO_4846 ?AUTO_4847 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4850 - OBJ
      ?AUTO_4851 - LOCATION
    )
    :vars
    (
      ?AUTO_4853 - LOCATION
      ?AUTO_4852 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4853 ) ( AIRPORT ?AUTO_4851 ) ( AIRPLANE-AT ?AUTO_4852 ?AUTO_4853 ) ( not ( = ?AUTO_4853 ?AUTO_4851 ) ) ( OBJ-AT ?AUTO_4850 ?AUTO_4853 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4850 ?AUTO_4852 ?AUTO_4853 )
      ( DELIVER-PKG ?AUTO_4850 ?AUTO_4851 )
      ( DELIVER-PKG-VERIFY ?AUTO_4850 ?AUTO_4851 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4854 - OBJ
      ?AUTO_4855 - LOCATION
    )
    :vars
    (
      ?AUTO_4857 - LOCATION
      ?AUTO_4858 - LOCATION
      ?AUTO_4856 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4857 ) ( AIRPORT ?AUTO_4855 ) ( not ( = ?AUTO_4857 ?AUTO_4855 ) ) ( OBJ-AT ?AUTO_4854 ?AUTO_4857 ) ( AIRPORT ?AUTO_4858 ) ( AIRPLANE-AT ?AUTO_4856 ?AUTO_4858 ) ( not ( = ?AUTO_4858 ?AUTO_4857 ) ) ( not ( = ?AUTO_4855 ?AUTO_4858 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4856 ?AUTO_4858 ?AUTO_4857 )
      ( DELIVER-PKG ?AUTO_4854 ?AUTO_4855 )
      ( DELIVER-PKG-VERIFY ?AUTO_4854 ?AUTO_4855 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4859 - OBJ
      ?AUTO_4860 - LOCATION
    )
    :vars
    (
      ?AUTO_4861 - LOCATION
      ?AUTO_4863 - LOCATION
      ?AUTO_4862 - AIRPLANE
      ?AUTO_4864 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4861 ) ( AIRPORT ?AUTO_4860 ) ( not ( = ?AUTO_4861 ?AUTO_4860 ) ) ( AIRPORT ?AUTO_4863 ) ( AIRPLANE-AT ?AUTO_4862 ?AUTO_4863 ) ( not ( = ?AUTO_4863 ?AUTO_4861 ) ) ( not ( = ?AUTO_4860 ?AUTO_4863 ) ) ( TRUCK-AT ?AUTO_4864 ?AUTO_4861 ) ( IN-TRUCK ?AUTO_4859 ?AUTO_4864 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4859 ?AUTO_4864 ?AUTO_4861 )
      ( DELIVER-PKG ?AUTO_4859 ?AUTO_4860 )
      ( DELIVER-PKG-VERIFY ?AUTO_4859 ?AUTO_4860 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4865 - OBJ
      ?AUTO_4866 - LOCATION
    )
    :vars
    (
      ?AUTO_4867 - LOCATION
      ?AUTO_4869 - LOCATION
      ?AUTO_4868 - AIRPLANE
      ?AUTO_4870 - TRUCK
      ?AUTO_4871 - LOCATION
      ?AUTO_4872 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4867 ) ( AIRPORT ?AUTO_4866 ) ( not ( = ?AUTO_4867 ?AUTO_4866 ) ) ( AIRPORT ?AUTO_4869 ) ( AIRPLANE-AT ?AUTO_4868 ?AUTO_4869 ) ( not ( = ?AUTO_4869 ?AUTO_4867 ) ) ( not ( = ?AUTO_4866 ?AUTO_4869 ) ) ( IN-TRUCK ?AUTO_4865 ?AUTO_4870 ) ( TRUCK-AT ?AUTO_4870 ?AUTO_4871 ) ( IN-CITY ?AUTO_4871 ?AUTO_4872 ) ( IN-CITY ?AUTO_4867 ?AUTO_4872 ) ( not ( = ?AUTO_4867 ?AUTO_4871 ) ) ( not ( = ?AUTO_4866 ?AUTO_4871 ) ) ( not ( = ?AUTO_4869 ?AUTO_4871 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4870 ?AUTO_4871 ?AUTO_4867 ?AUTO_4872 )
      ( DELIVER-PKG ?AUTO_4865 ?AUTO_4866 )
      ( DELIVER-PKG-VERIFY ?AUTO_4865 ?AUTO_4866 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4873 - OBJ
      ?AUTO_4874 - LOCATION
    )
    :vars
    (
      ?AUTO_4879 - LOCATION
      ?AUTO_4880 - LOCATION
      ?AUTO_4875 - AIRPLANE
      ?AUTO_4878 - TRUCK
      ?AUTO_4876 - LOCATION
      ?AUTO_4877 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4879 ) ( AIRPORT ?AUTO_4874 ) ( not ( = ?AUTO_4879 ?AUTO_4874 ) ) ( AIRPORT ?AUTO_4880 ) ( AIRPLANE-AT ?AUTO_4875 ?AUTO_4880 ) ( not ( = ?AUTO_4880 ?AUTO_4879 ) ) ( not ( = ?AUTO_4874 ?AUTO_4880 ) ) ( TRUCK-AT ?AUTO_4878 ?AUTO_4876 ) ( IN-CITY ?AUTO_4876 ?AUTO_4877 ) ( IN-CITY ?AUTO_4879 ?AUTO_4877 ) ( not ( = ?AUTO_4879 ?AUTO_4876 ) ) ( not ( = ?AUTO_4874 ?AUTO_4876 ) ) ( not ( = ?AUTO_4880 ?AUTO_4876 ) ) ( OBJ-AT ?AUTO_4873 ?AUTO_4876 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4873 ?AUTO_4878 ?AUTO_4876 )
      ( DELIVER-PKG ?AUTO_4873 ?AUTO_4874 )
      ( DELIVER-PKG-VERIFY ?AUTO_4873 ?AUTO_4874 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4881 - OBJ
      ?AUTO_4882 - LOCATION
    )
    :vars
    (
      ?AUTO_4885 - LOCATION
      ?AUTO_4886 - LOCATION
      ?AUTO_4883 - AIRPLANE
      ?AUTO_4884 - LOCATION
      ?AUTO_4887 - CITY
      ?AUTO_4888 - TRUCK
      ?AUTO_4889 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4885 ) ( AIRPORT ?AUTO_4882 ) ( not ( = ?AUTO_4885 ?AUTO_4882 ) ) ( AIRPORT ?AUTO_4886 ) ( AIRPLANE-AT ?AUTO_4883 ?AUTO_4886 ) ( not ( = ?AUTO_4886 ?AUTO_4885 ) ) ( not ( = ?AUTO_4882 ?AUTO_4886 ) ) ( IN-CITY ?AUTO_4884 ?AUTO_4887 ) ( IN-CITY ?AUTO_4885 ?AUTO_4887 ) ( not ( = ?AUTO_4885 ?AUTO_4884 ) ) ( not ( = ?AUTO_4882 ?AUTO_4884 ) ) ( not ( = ?AUTO_4886 ?AUTO_4884 ) ) ( OBJ-AT ?AUTO_4881 ?AUTO_4884 ) ( TRUCK-AT ?AUTO_4888 ?AUTO_4889 ) ( IN-CITY ?AUTO_4889 ?AUTO_4887 ) ( not ( = ?AUTO_4884 ?AUTO_4889 ) ) ( not ( = ?AUTO_4882 ?AUTO_4889 ) ) ( not ( = ?AUTO_4885 ?AUTO_4889 ) ) ( not ( = ?AUTO_4886 ?AUTO_4889 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4888 ?AUTO_4889 ?AUTO_4884 ?AUTO_4887 )
      ( DELIVER-PKG ?AUTO_4881 ?AUTO_4882 )
      ( DELIVER-PKG-VERIFY ?AUTO_4881 ?AUTO_4882 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4892 - OBJ
      ?AUTO_4893 - LOCATION
    )
    :vars
    (
      ?AUTO_4894 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4894 ?AUTO_4893 ) ( IN-TRUCK ?AUTO_4892 ?AUTO_4894 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4892 ?AUTO_4894 ?AUTO_4893 )
      ( DELIVER-PKG-VERIFY ?AUTO_4892 ?AUTO_4893 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4895 - OBJ
      ?AUTO_4896 - LOCATION
    )
    :vars
    (
      ?AUTO_4897 - TRUCK
      ?AUTO_4898 - LOCATION
      ?AUTO_4899 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4895 ?AUTO_4897 ) ( TRUCK-AT ?AUTO_4897 ?AUTO_4898 ) ( IN-CITY ?AUTO_4898 ?AUTO_4899 ) ( IN-CITY ?AUTO_4896 ?AUTO_4899 ) ( not ( = ?AUTO_4896 ?AUTO_4898 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4897 ?AUTO_4898 ?AUTO_4896 ?AUTO_4899 )
      ( DELIVER-PKG ?AUTO_4895 ?AUTO_4896 )
      ( DELIVER-PKG-VERIFY ?AUTO_4895 ?AUTO_4896 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4904 - OBJ
      ?AUTO_4905 - LOCATION
    )
    :vars
    (
      ?AUTO_4908 - TRUCK
      ?AUTO_4906 - LOCATION
      ?AUTO_4907 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4908 ?AUTO_4906 ) ( IN-CITY ?AUTO_4906 ?AUTO_4907 ) ( IN-CITY ?AUTO_4905 ?AUTO_4907 ) ( not ( = ?AUTO_4905 ?AUTO_4906 ) ) ( OBJ-AT ?AUTO_4904 ?AUTO_4906 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4904 ?AUTO_4908 ?AUTO_4906 )
      ( DELIVER-PKG ?AUTO_4904 ?AUTO_4905 )
      ( DELIVER-PKG-VERIFY ?AUTO_4904 ?AUTO_4905 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4927 - OBJ
      ?AUTO_4928 - LOCATION
    )
    :vars
    (
      ?AUTO_4929 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4929 ?AUTO_4928 ) ( IN-TRUCK ?AUTO_4927 ?AUTO_4929 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4927 ?AUTO_4929 ?AUTO_4928 )
      ( DELIVER-PKG-VERIFY ?AUTO_4927 ?AUTO_4928 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4930 - OBJ
      ?AUTO_4931 - LOCATION
    )
    :vars
    (
      ?AUTO_4932 - TRUCK
      ?AUTO_4933 - LOCATION
      ?AUTO_4934 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4930 ?AUTO_4932 ) ( TRUCK-AT ?AUTO_4932 ?AUTO_4933 ) ( IN-CITY ?AUTO_4933 ?AUTO_4934 ) ( IN-CITY ?AUTO_4931 ?AUTO_4934 ) ( not ( = ?AUTO_4931 ?AUTO_4933 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4932 ?AUTO_4933 ?AUTO_4931 ?AUTO_4934 )
      ( DELIVER-PKG ?AUTO_4930 ?AUTO_4931 )
      ( DELIVER-PKG-VERIFY ?AUTO_4930 ?AUTO_4931 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4939 - OBJ
      ?AUTO_4940 - LOCATION
    )
    :vars
    (
      ?AUTO_4943 - TRUCK
      ?AUTO_4941 - LOCATION
      ?AUTO_4942 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4943 ?AUTO_4941 ) ( IN-CITY ?AUTO_4941 ?AUTO_4942 ) ( IN-CITY ?AUTO_4940 ?AUTO_4942 ) ( not ( = ?AUTO_4940 ?AUTO_4941 ) ) ( OBJ-AT ?AUTO_4939 ?AUTO_4941 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4939 ?AUTO_4943 ?AUTO_4941 )
      ( DELIVER-PKG ?AUTO_4939 ?AUTO_4940 )
      ( DELIVER-PKG-VERIFY ?AUTO_4939 ?AUTO_4940 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4944 - OBJ
      ?AUTO_4945 - LOCATION
    )
    :vars
    (
      ?AUTO_4947 - LOCATION
      ?AUTO_4946 - CITY
      ?AUTO_4948 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4947 ?AUTO_4946 ) ( IN-CITY ?AUTO_4945 ?AUTO_4946 ) ( not ( = ?AUTO_4945 ?AUTO_4947 ) ) ( OBJ-AT ?AUTO_4944 ?AUTO_4947 ) ( TRUCK-AT ?AUTO_4948 ?AUTO_4945 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4948 ?AUTO_4945 ?AUTO_4947 ?AUTO_4946 )
      ( DELIVER-PKG ?AUTO_4944 ?AUTO_4945 )
      ( DELIVER-PKG-VERIFY ?AUTO_4944 ?AUTO_4945 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4951 - OBJ
      ?AUTO_4952 - LOCATION
    )
    :vars
    (
      ?AUTO_4954 - LOCATION
      ?AUTO_4955 - CITY
      ?AUTO_4953 - TRUCK
      ?AUTO_4956 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4954 ?AUTO_4955 ) ( IN-CITY ?AUTO_4952 ?AUTO_4955 ) ( not ( = ?AUTO_4952 ?AUTO_4954 ) ) ( TRUCK-AT ?AUTO_4953 ?AUTO_4952 ) ( IN-AIRPLANE ?AUTO_4951 ?AUTO_4956 ) ( AIRPLANE-AT ?AUTO_4956 ?AUTO_4954 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4951 ?AUTO_4956 ?AUTO_4954 )
      ( DELIVER-PKG ?AUTO_4951 ?AUTO_4952 )
      ( DELIVER-PKG-VERIFY ?AUTO_4951 ?AUTO_4952 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4957 - OBJ
      ?AUTO_4958 - LOCATION
    )
    :vars
    (
      ?AUTO_4961 - LOCATION
      ?AUTO_4959 - CITY
      ?AUTO_4960 - TRUCK
      ?AUTO_4962 - AIRPLANE
      ?AUTO_4963 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4961 ?AUTO_4959 ) ( IN-CITY ?AUTO_4958 ?AUTO_4959 ) ( not ( = ?AUTO_4958 ?AUTO_4961 ) ) ( TRUCK-AT ?AUTO_4960 ?AUTO_4958 ) ( IN-AIRPLANE ?AUTO_4957 ?AUTO_4962 ) ( AIRPORT ?AUTO_4963 ) ( AIRPORT ?AUTO_4961 ) ( AIRPLANE-AT ?AUTO_4962 ?AUTO_4963 ) ( not ( = ?AUTO_4963 ?AUTO_4961 ) ) ( not ( = ?AUTO_4958 ?AUTO_4963 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4962 ?AUTO_4963 ?AUTO_4961 )
      ( DELIVER-PKG ?AUTO_4957 ?AUTO_4958 )
      ( DELIVER-PKG-VERIFY ?AUTO_4957 ?AUTO_4958 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4964 - OBJ
      ?AUTO_4965 - LOCATION
    )
    :vars
    (
      ?AUTO_4968 - LOCATION
      ?AUTO_4966 - CITY
      ?AUTO_4967 - TRUCK
      ?AUTO_4969 - LOCATION
      ?AUTO_4970 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4968 ?AUTO_4966 ) ( IN-CITY ?AUTO_4965 ?AUTO_4966 ) ( not ( = ?AUTO_4965 ?AUTO_4968 ) ) ( TRUCK-AT ?AUTO_4967 ?AUTO_4965 ) ( AIRPORT ?AUTO_4969 ) ( AIRPORT ?AUTO_4968 ) ( AIRPLANE-AT ?AUTO_4970 ?AUTO_4969 ) ( not ( = ?AUTO_4969 ?AUTO_4968 ) ) ( not ( = ?AUTO_4965 ?AUTO_4969 ) ) ( OBJ-AT ?AUTO_4964 ?AUTO_4969 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4964 ?AUTO_4970 ?AUTO_4969 )
      ( DELIVER-PKG ?AUTO_4964 ?AUTO_4965 )
      ( DELIVER-PKG-VERIFY ?AUTO_4964 ?AUTO_4965 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4971 - OBJ
      ?AUTO_4972 - LOCATION
    )
    :vars
    (
      ?AUTO_4974 - LOCATION
      ?AUTO_4976 - CITY
      ?AUTO_4975 - TRUCK
      ?AUTO_4973 - LOCATION
      ?AUTO_4978 - LOCATION
      ?AUTO_4977 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4974 ?AUTO_4976 ) ( IN-CITY ?AUTO_4972 ?AUTO_4976 ) ( not ( = ?AUTO_4972 ?AUTO_4974 ) ) ( TRUCK-AT ?AUTO_4975 ?AUTO_4972 ) ( AIRPORT ?AUTO_4973 ) ( AIRPORT ?AUTO_4974 ) ( not ( = ?AUTO_4973 ?AUTO_4974 ) ) ( not ( = ?AUTO_4972 ?AUTO_4973 ) ) ( OBJ-AT ?AUTO_4971 ?AUTO_4973 ) ( AIRPORT ?AUTO_4978 ) ( AIRPLANE-AT ?AUTO_4977 ?AUTO_4978 ) ( not ( = ?AUTO_4978 ?AUTO_4973 ) ) ( not ( = ?AUTO_4972 ?AUTO_4978 ) ) ( not ( = ?AUTO_4974 ?AUTO_4978 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4977 ?AUTO_4978 ?AUTO_4973 )
      ( DELIVER-PKG ?AUTO_4971 ?AUTO_4972 )
      ( DELIVER-PKG-VERIFY ?AUTO_4971 ?AUTO_4972 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4979 - OBJ
      ?AUTO_4980 - LOCATION
    )
    :vars
    (
      ?AUTO_4985 - LOCATION
      ?AUTO_4982 - CITY
      ?AUTO_4981 - TRUCK
      ?AUTO_4983 - LOCATION
      ?AUTO_4986 - LOCATION
      ?AUTO_4984 - AIRPLANE
      ?AUTO_4987 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4985 ?AUTO_4982 ) ( IN-CITY ?AUTO_4980 ?AUTO_4982 ) ( not ( = ?AUTO_4980 ?AUTO_4985 ) ) ( TRUCK-AT ?AUTO_4981 ?AUTO_4980 ) ( AIRPORT ?AUTO_4983 ) ( AIRPORT ?AUTO_4985 ) ( not ( = ?AUTO_4983 ?AUTO_4985 ) ) ( not ( = ?AUTO_4980 ?AUTO_4983 ) ) ( AIRPORT ?AUTO_4986 ) ( AIRPLANE-AT ?AUTO_4984 ?AUTO_4986 ) ( not ( = ?AUTO_4986 ?AUTO_4983 ) ) ( not ( = ?AUTO_4980 ?AUTO_4986 ) ) ( not ( = ?AUTO_4985 ?AUTO_4986 ) ) ( TRUCK-AT ?AUTO_4987 ?AUTO_4983 ) ( IN-TRUCK ?AUTO_4979 ?AUTO_4987 ) ( not ( = ?AUTO_4981 ?AUTO_4987 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4979 ?AUTO_4987 ?AUTO_4983 )
      ( DELIVER-PKG ?AUTO_4979 ?AUTO_4980 )
      ( DELIVER-PKG-VERIFY ?AUTO_4979 ?AUTO_4980 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4988 - OBJ
      ?AUTO_4989 - LOCATION
    )
    :vars
    (
      ?AUTO_4995 - LOCATION
      ?AUTO_4991 - CITY
      ?AUTO_4990 - TRUCK
      ?AUTO_4996 - LOCATION
      ?AUTO_4992 - LOCATION
      ?AUTO_4994 - AIRPLANE
      ?AUTO_4993 - TRUCK
      ?AUTO_4997 - LOCATION
      ?AUTO_4998 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4995 ?AUTO_4991 ) ( IN-CITY ?AUTO_4989 ?AUTO_4991 ) ( not ( = ?AUTO_4989 ?AUTO_4995 ) ) ( TRUCK-AT ?AUTO_4990 ?AUTO_4989 ) ( AIRPORT ?AUTO_4996 ) ( AIRPORT ?AUTO_4995 ) ( not ( = ?AUTO_4996 ?AUTO_4995 ) ) ( not ( = ?AUTO_4989 ?AUTO_4996 ) ) ( AIRPORT ?AUTO_4992 ) ( AIRPLANE-AT ?AUTO_4994 ?AUTO_4992 ) ( not ( = ?AUTO_4992 ?AUTO_4996 ) ) ( not ( = ?AUTO_4989 ?AUTO_4992 ) ) ( not ( = ?AUTO_4995 ?AUTO_4992 ) ) ( IN-TRUCK ?AUTO_4988 ?AUTO_4993 ) ( not ( = ?AUTO_4990 ?AUTO_4993 ) ) ( TRUCK-AT ?AUTO_4993 ?AUTO_4997 ) ( IN-CITY ?AUTO_4997 ?AUTO_4998 ) ( IN-CITY ?AUTO_4996 ?AUTO_4998 ) ( not ( = ?AUTO_4996 ?AUTO_4997 ) ) ( not ( = ?AUTO_4989 ?AUTO_4997 ) ) ( not ( = ?AUTO_4995 ?AUTO_4997 ) ) ( not ( = ?AUTO_4991 ?AUTO_4998 ) ) ( not ( = ?AUTO_4992 ?AUTO_4997 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4993 ?AUTO_4997 ?AUTO_4996 ?AUTO_4998 )
      ( DELIVER-PKG ?AUTO_4988 ?AUTO_4989 )
      ( DELIVER-PKG-VERIFY ?AUTO_4988 ?AUTO_4989 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4999 - OBJ
      ?AUTO_5000 - LOCATION
    )
    :vars
    (
      ?AUTO_5002 - LOCATION
      ?AUTO_5001 - CITY
      ?AUTO_5004 - TRUCK
      ?AUTO_5003 - LOCATION
      ?AUTO_5008 - LOCATION
      ?AUTO_5005 - AIRPLANE
      ?AUTO_5007 - TRUCK
      ?AUTO_5009 - LOCATION
      ?AUTO_5006 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5002 ?AUTO_5001 ) ( IN-CITY ?AUTO_5000 ?AUTO_5001 ) ( not ( = ?AUTO_5000 ?AUTO_5002 ) ) ( TRUCK-AT ?AUTO_5004 ?AUTO_5000 ) ( AIRPORT ?AUTO_5003 ) ( AIRPORT ?AUTO_5002 ) ( not ( = ?AUTO_5003 ?AUTO_5002 ) ) ( not ( = ?AUTO_5000 ?AUTO_5003 ) ) ( AIRPORT ?AUTO_5008 ) ( AIRPLANE-AT ?AUTO_5005 ?AUTO_5008 ) ( not ( = ?AUTO_5008 ?AUTO_5003 ) ) ( not ( = ?AUTO_5000 ?AUTO_5008 ) ) ( not ( = ?AUTO_5002 ?AUTO_5008 ) ) ( not ( = ?AUTO_5004 ?AUTO_5007 ) ) ( TRUCK-AT ?AUTO_5007 ?AUTO_5009 ) ( IN-CITY ?AUTO_5009 ?AUTO_5006 ) ( IN-CITY ?AUTO_5003 ?AUTO_5006 ) ( not ( = ?AUTO_5003 ?AUTO_5009 ) ) ( not ( = ?AUTO_5000 ?AUTO_5009 ) ) ( not ( = ?AUTO_5002 ?AUTO_5009 ) ) ( not ( = ?AUTO_5001 ?AUTO_5006 ) ) ( not ( = ?AUTO_5008 ?AUTO_5009 ) ) ( OBJ-AT ?AUTO_4999 ?AUTO_5009 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4999 ?AUTO_5007 ?AUTO_5009 )
      ( DELIVER-PKG ?AUTO_4999 ?AUTO_5000 )
      ( DELIVER-PKG-VERIFY ?AUTO_4999 ?AUTO_5000 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5010 - OBJ
      ?AUTO_5011 - LOCATION
    )
    :vars
    (
      ?AUTO_5012 - LOCATION
      ?AUTO_5013 - CITY
      ?AUTO_5016 - TRUCK
      ?AUTO_5015 - LOCATION
      ?AUTO_5017 - LOCATION
      ?AUTO_5014 - AIRPLANE
      ?AUTO_5019 - TRUCK
      ?AUTO_5020 - LOCATION
      ?AUTO_5018 - CITY
      ?AUTO_5021 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5012 ?AUTO_5013 ) ( IN-CITY ?AUTO_5011 ?AUTO_5013 ) ( not ( = ?AUTO_5011 ?AUTO_5012 ) ) ( TRUCK-AT ?AUTO_5016 ?AUTO_5011 ) ( AIRPORT ?AUTO_5015 ) ( AIRPORT ?AUTO_5012 ) ( not ( = ?AUTO_5015 ?AUTO_5012 ) ) ( not ( = ?AUTO_5011 ?AUTO_5015 ) ) ( AIRPORT ?AUTO_5017 ) ( AIRPLANE-AT ?AUTO_5014 ?AUTO_5017 ) ( not ( = ?AUTO_5017 ?AUTO_5015 ) ) ( not ( = ?AUTO_5011 ?AUTO_5017 ) ) ( not ( = ?AUTO_5012 ?AUTO_5017 ) ) ( not ( = ?AUTO_5016 ?AUTO_5019 ) ) ( IN-CITY ?AUTO_5020 ?AUTO_5018 ) ( IN-CITY ?AUTO_5015 ?AUTO_5018 ) ( not ( = ?AUTO_5015 ?AUTO_5020 ) ) ( not ( = ?AUTO_5011 ?AUTO_5020 ) ) ( not ( = ?AUTO_5012 ?AUTO_5020 ) ) ( not ( = ?AUTO_5013 ?AUTO_5018 ) ) ( not ( = ?AUTO_5017 ?AUTO_5020 ) ) ( OBJ-AT ?AUTO_5010 ?AUTO_5020 ) ( TRUCK-AT ?AUTO_5019 ?AUTO_5021 ) ( IN-CITY ?AUTO_5021 ?AUTO_5018 ) ( not ( = ?AUTO_5020 ?AUTO_5021 ) ) ( not ( = ?AUTO_5011 ?AUTO_5021 ) ) ( not ( = ?AUTO_5012 ?AUTO_5021 ) ) ( not ( = ?AUTO_5015 ?AUTO_5021 ) ) ( not ( = ?AUTO_5017 ?AUTO_5021 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5019 ?AUTO_5021 ?AUTO_5020 ?AUTO_5018 )
      ( DELIVER-PKG ?AUTO_5010 ?AUTO_5011 )
      ( DELIVER-PKG-VERIFY ?AUTO_5010 ?AUTO_5011 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5024 - OBJ
      ?AUTO_5025 - LOCATION
    )
    :vars
    (
      ?AUTO_5026 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5026 ?AUTO_5025 ) ( IN-TRUCK ?AUTO_5024 ?AUTO_5026 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5024 ?AUTO_5026 ?AUTO_5025 )
      ( DELIVER-PKG-VERIFY ?AUTO_5024 ?AUTO_5025 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5027 - OBJ
      ?AUTO_5028 - LOCATION
    )
    :vars
    (
      ?AUTO_5029 - TRUCK
      ?AUTO_5030 - LOCATION
      ?AUTO_5031 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5027 ?AUTO_5029 ) ( TRUCK-AT ?AUTO_5029 ?AUTO_5030 ) ( IN-CITY ?AUTO_5030 ?AUTO_5031 ) ( IN-CITY ?AUTO_5028 ?AUTO_5031 ) ( not ( = ?AUTO_5028 ?AUTO_5030 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5029 ?AUTO_5030 ?AUTO_5028 ?AUTO_5031 )
      ( DELIVER-PKG ?AUTO_5027 ?AUTO_5028 )
      ( DELIVER-PKG-VERIFY ?AUTO_5027 ?AUTO_5028 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5032 - OBJ
      ?AUTO_5033 - LOCATION
    )
    :vars
    (
      ?AUTO_5034 - TRUCK
      ?AUTO_5035 - LOCATION
      ?AUTO_5036 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5034 ?AUTO_5035 ) ( IN-CITY ?AUTO_5035 ?AUTO_5036 ) ( IN-CITY ?AUTO_5033 ?AUTO_5036 ) ( not ( = ?AUTO_5033 ?AUTO_5035 ) ) ( OBJ-AT ?AUTO_5032 ?AUTO_5035 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5032 ?AUTO_5034 ?AUTO_5035 )
      ( DELIVER-PKG ?AUTO_5032 ?AUTO_5033 )
      ( DELIVER-PKG-VERIFY ?AUTO_5032 ?AUTO_5033 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5039 - OBJ
      ?AUTO_5040 - LOCATION
    )
    :vars
    (
      ?AUTO_5041 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5039 ?AUTO_5041 ) ( AIRPLANE-AT ?AUTO_5041 ?AUTO_5040 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5039 ?AUTO_5041 ?AUTO_5040 )
      ( DELIVER-PKG-VERIFY ?AUTO_5039 ?AUTO_5040 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5044 - OBJ
      ?AUTO_5045 - LOCATION
    )
    :vars
    (
      ?AUTO_5046 - AIRPLANE
      ?AUTO_5047 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5044 ?AUTO_5046 ) ( AIRPORT ?AUTO_5047 ) ( AIRPORT ?AUTO_5045 ) ( AIRPLANE-AT ?AUTO_5046 ?AUTO_5047 ) ( not ( = ?AUTO_5047 ?AUTO_5045 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5046 ?AUTO_5047 ?AUTO_5045 )
      ( DELIVER-PKG ?AUTO_5044 ?AUTO_5045 )
      ( DELIVER-PKG-VERIFY ?AUTO_5044 ?AUTO_5045 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5048 - OBJ
      ?AUTO_5049 - LOCATION
    )
    :vars
    (
      ?AUTO_5051 - LOCATION
      ?AUTO_5050 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5051 ) ( AIRPORT ?AUTO_5049 ) ( AIRPLANE-AT ?AUTO_5050 ?AUTO_5051 ) ( not ( = ?AUTO_5051 ?AUTO_5049 ) ) ( OBJ-AT ?AUTO_5048 ?AUTO_5051 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5048 ?AUTO_5050 ?AUTO_5051 )
      ( DELIVER-PKG ?AUTO_5048 ?AUTO_5049 )
      ( DELIVER-PKG-VERIFY ?AUTO_5048 ?AUTO_5049 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5052 - OBJ
      ?AUTO_5053 - LOCATION
    )
    :vars
    (
      ?AUTO_5055 - LOCATION
      ?AUTO_5054 - AIRPLANE
      ?AUTO_5056 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5055 ) ( AIRPORT ?AUTO_5053 ) ( AIRPLANE-AT ?AUTO_5054 ?AUTO_5055 ) ( not ( = ?AUTO_5055 ?AUTO_5053 ) ) ( TRUCK-AT ?AUTO_5056 ?AUTO_5055 ) ( IN-TRUCK ?AUTO_5052 ?AUTO_5056 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5052 ?AUTO_5056 ?AUTO_5055 )
      ( DELIVER-PKG ?AUTO_5052 ?AUTO_5053 )
      ( DELIVER-PKG-VERIFY ?AUTO_5052 ?AUTO_5053 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5057 - OBJ
      ?AUTO_5058 - LOCATION
    )
    :vars
    (
      ?AUTO_5060 - LOCATION
      ?AUTO_5059 - AIRPLANE
      ?AUTO_5061 - TRUCK
      ?AUTO_5062 - LOCATION
      ?AUTO_5063 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5060 ) ( AIRPORT ?AUTO_5058 ) ( AIRPLANE-AT ?AUTO_5059 ?AUTO_5060 ) ( not ( = ?AUTO_5060 ?AUTO_5058 ) ) ( IN-TRUCK ?AUTO_5057 ?AUTO_5061 ) ( TRUCK-AT ?AUTO_5061 ?AUTO_5062 ) ( IN-CITY ?AUTO_5062 ?AUTO_5063 ) ( IN-CITY ?AUTO_5060 ?AUTO_5063 ) ( not ( = ?AUTO_5060 ?AUTO_5062 ) ) ( not ( = ?AUTO_5058 ?AUTO_5062 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5061 ?AUTO_5062 ?AUTO_5060 ?AUTO_5063 )
      ( DELIVER-PKG ?AUTO_5057 ?AUTO_5058 )
      ( DELIVER-PKG-VERIFY ?AUTO_5057 ?AUTO_5058 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5064 - OBJ
      ?AUTO_5065 - LOCATION
    )
    :vars
    (
      ?AUTO_5066 - LOCATION
      ?AUTO_5067 - AIRPLANE
      ?AUTO_5068 - TRUCK
      ?AUTO_5070 - LOCATION
      ?AUTO_5069 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5066 ) ( AIRPORT ?AUTO_5065 ) ( AIRPLANE-AT ?AUTO_5067 ?AUTO_5066 ) ( not ( = ?AUTO_5066 ?AUTO_5065 ) ) ( TRUCK-AT ?AUTO_5068 ?AUTO_5070 ) ( IN-CITY ?AUTO_5070 ?AUTO_5069 ) ( IN-CITY ?AUTO_5066 ?AUTO_5069 ) ( not ( = ?AUTO_5066 ?AUTO_5070 ) ) ( not ( = ?AUTO_5065 ?AUTO_5070 ) ) ( OBJ-AT ?AUTO_5064 ?AUTO_5070 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5064 ?AUTO_5068 ?AUTO_5070 )
      ( DELIVER-PKG ?AUTO_5064 ?AUTO_5065 )
      ( DELIVER-PKG-VERIFY ?AUTO_5064 ?AUTO_5065 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5073 - OBJ
      ?AUTO_5074 - LOCATION
    )
    :vars
    (
      ?AUTO_5075 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5073 ?AUTO_5075 ) ( AIRPLANE-AT ?AUTO_5075 ?AUTO_5074 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5073 ?AUTO_5075 ?AUTO_5074 )
      ( DELIVER-PKG-VERIFY ?AUTO_5073 ?AUTO_5074 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5082 - OBJ
      ?AUTO_5083 - LOCATION
    )
    :vars
    (
      ?AUTO_5084 - AIRPLANE
      ?AUTO_5085 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5082 ?AUTO_5084 ) ( AIRPORT ?AUTO_5085 ) ( AIRPORT ?AUTO_5083 ) ( AIRPLANE-AT ?AUTO_5084 ?AUTO_5085 ) ( not ( = ?AUTO_5085 ?AUTO_5083 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5084 ?AUTO_5085 ?AUTO_5083 )
      ( DELIVER-PKG ?AUTO_5082 ?AUTO_5083 )
      ( DELIVER-PKG-VERIFY ?AUTO_5082 ?AUTO_5083 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5088 - OBJ
      ?AUTO_5089 - LOCATION
    )
    :vars
    (
      ?AUTO_5091 - LOCATION
      ?AUTO_5090 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5091 ) ( AIRPORT ?AUTO_5089 ) ( AIRPLANE-AT ?AUTO_5090 ?AUTO_5091 ) ( not ( = ?AUTO_5091 ?AUTO_5089 ) ) ( OBJ-AT ?AUTO_5088 ?AUTO_5091 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5088 ?AUTO_5090 ?AUTO_5091 )
      ( DELIVER-PKG ?AUTO_5088 ?AUTO_5089 )
      ( DELIVER-PKG-VERIFY ?AUTO_5088 ?AUTO_5089 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5094 - OBJ
      ?AUTO_5095 - LOCATION
    )
    :vars
    (
      ?AUTO_5097 - LOCATION
      ?AUTO_5098 - LOCATION
      ?AUTO_5096 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5097 ) ( AIRPORT ?AUTO_5095 ) ( not ( = ?AUTO_5097 ?AUTO_5095 ) ) ( OBJ-AT ?AUTO_5094 ?AUTO_5097 ) ( AIRPORT ?AUTO_5098 ) ( AIRPLANE-AT ?AUTO_5096 ?AUTO_5098 ) ( not ( = ?AUTO_5098 ?AUTO_5097 ) ) ( not ( = ?AUTO_5095 ?AUTO_5098 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5096 ?AUTO_5098 ?AUTO_5097 )
      ( DELIVER-PKG ?AUTO_5094 ?AUTO_5095 )
      ( DELIVER-PKG-VERIFY ?AUTO_5094 ?AUTO_5095 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5111 - OBJ
      ?AUTO_5112 - LOCATION
    )
    :vars
    (
      ?AUTO_5113 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5111 ?AUTO_5113 ) ( AIRPLANE-AT ?AUTO_5113 ?AUTO_5112 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5111 ?AUTO_5113 ?AUTO_5112 )
      ( DELIVER-PKG-VERIFY ?AUTO_5111 ?AUTO_5112 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5114 - OBJ
      ?AUTO_5115 - LOCATION
    )
    :vars
    (
      ?AUTO_5116 - AIRPLANE
      ?AUTO_5117 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5114 ?AUTO_5116 ) ( AIRPORT ?AUTO_5117 ) ( AIRPORT ?AUTO_5115 ) ( AIRPLANE-AT ?AUTO_5116 ?AUTO_5117 ) ( not ( = ?AUTO_5117 ?AUTO_5115 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5116 ?AUTO_5117 ?AUTO_5115 )
      ( DELIVER-PKG ?AUTO_5114 ?AUTO_5115 )
      ( DELIVER-PKG-VERIFY ?AUTO_5114 ?AUTO_5115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5128 - OBJ
      ?AUTO_5129 - LOCATION
    )
    :vars
    (
      ?AUTO_5131 - LOCATION
      ?AUTO_5130 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5131 ) ( AIRPORT ?AUTO_5129 ) ( AIRPLANE-AT ?AUTO_5130 ?AUTO_5131 ) ( not ( = ?AUTO_5131 ?AUTO_5129 ) ) ( OBJ-AT ?AUTO_5128 ?AUTO_5131 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5128 ?AUTO_5130 ?AUTO_5131 )
      ( DELIVER-PKG ?AUTO_5128 ?AUTO_5129 )
      ( DELIVER-PKG-VERIFY ?AUTO_5128 ?AUTO_5129 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5150 - OBJ
      ?AUTO_5151 - LOCATION
    )
    :vars
    (
      ?AUTO_5152 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5152 ?AUTO_5151 ) ( IN-TRUCK ?AUTO_5150 ?AUTO_5152 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5150 ?AUTO_5152 ?AUTO_5151 )
      ( DELIVER-PKG-VERIFY ?AUTO_5150 ?AUTO_5151 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5163 - OBJ
      ?AUTO_5164 - LOCATION
    )
    :vars
    (
      ?AUTO_5165 - TRUCK
      ?AUTO_5166 - LOCATION
      ?AUTO_5167 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5163 ?AUTO_5165 ) ( TRUCK-AT ?AUTO_5165 ?AUTO_5166 ) ( IN-CITY ?AUTO_5166 ?AUTO_5167 ) ( IN-CITY ?AUTO_5164 ?AUTO_5167 ) ( not ( = ?AUTO_5164 ?AUTO_5166 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5165 ?AUTO_5166 ?AUTO_5164 ?AUTO_5167 )
      ( DELIVER-PKG ?AUTO_5163 ?AUTO_5164 )
      ( DELIVER-PKG-VERIFY ?AUTO_5163 ?AUTO_5164 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5168 - OBJ
      ?AUTO_5169 - LOCATION
    )
    :vars
    (
      ?AUTO_5170 - TRUCK
      ?AUTO_5171 - LOCATION
      ?AUTO_5172 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5170 ?AUTO_5171 ) ( IN-CITY ?AUTO_5171 ?AUTO_5172 ) ( IN-CITY ?AUTO_5169 ?AUTO_5172 ) ( not ( = ?AUTO_5169 ?AUTO_5171 ) ) ( OBJ-AT ?AUTO_5168 ?AUTO_5171 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5168 ?AUTO_5170 ?AUTO_5171 )
      ( DELIVER-PKG ?AUTO_5168 ?AUTO_5169 )
      ( DELIVER-PKG-VERIFY ?AUTO_5168 ?AUTO_5169 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5195 - OBJ
      ?AUTO_5196 - LOCATION
    )
    :vars
    (
      ?AUTO_5197 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5197 ?AUTO_5196 ) ( IN-TRUCK ?AUTO_5195 ?AUTO_5197 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5195 ?AUTO_5197 ?AUTO_5196 )
      ( DELIVER-PKG-VERIFY ?AUTO_5195 ?AUTO_5196 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5200 - OBJ
      ?AUTO_5201 - LOCATION
    )
    :vars
    (
      ?AUTO_5202 - TRUCK
      ?AUTO_5203 - LOCATION
      ?AUTO_5204 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5200 ?AUTO_5202 ) ( TRUCK-AT ?AUTO_5202 ?AUTO_5203 ) ( IN-CITY ?AUTO_5203 ?AUTO_5204 ) ( IN-CITY ?AUTO_5201 ?AUTO_5204 ) ( not ( = ?AUTO_5201 ?AUTO_5203 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5202 ?AUTO_5203 ?AUTO_5201 ?AUTO_5204 )
      ( DELIVER-PKG ?AUTO_5200 ?AUTO_5201 )
      ( DELIVER-PKG-VERIFY ?AUTO_5200 ?AUTO_5201 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5215 - OBJ
      ?AUTO_5216 - LOCATION
    )
    :vars
    (
      ?AUTO_5218 - TRUCK
      ?AUTO_5217 - LOCATION
      ?AUTO_5219 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5218 ?AUTO_5217 ) ( IN-CITY ?AUTO_5217 ?AUTO_5219 ) ( IN-CITY ?AUTO_5216 ?AUTO_5219 ) ( not ( = ?AUTO_5216 ?AUTO_5217 ) ) ( OBJ-AT ?AUTO_5215 ?AUTO_5217 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5215 ?AUTO_5218 ?AUTO_5217 )
      ( DELIVER-PKG ?AUTO_5215 ?AUTO_5216 )
      ( DELIVER-PKG-VERIFY ?AUTO_5215 ?AUTO_5216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5230 - OBJ
      ?AUTO_5231 - LOCATION
    )
    :vars
    (
      ?AUTO_5233 - TRUCK
      ?AUTO_5232 - LOCATION
      ?AUTO_5234 - CITY
      ?AUTO_5235 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5233 ?AUTO_5232 ) ( IN-CITY ?AUTO_5232 ?AUTO_5234 ) ( IN-CITY ?AUTO_5231 ?AUTO_5234 ) ( not ( = ?AUTO_5231 ?AUTO_5232 ) ) ( IN-AIRPLANE ?AUTO_5230 ?AUTO_5235 ) ( AIRPLANE-AT ?AUTO_5235 ?AUTO_5232 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5230 ?AUTO_5235 ?AUTO_5232 )
      ( DELIVER-PKG ?AUTO_5230 ?AUTO_5231 )
      ( DELIVER-PKG-VERIFY ?AUTO_5230 ?AUTO_5231 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5238 - OBJ
      ?AUTO_5239 - LOCATION
    )
    :vars
    (
      ?AUTO_5243 - TRUCK
      ?AUTO_5240 - LOCATION
      ?AUTO_5241 - CITY
      ?AUTO_5242 - AIRPLANE
      ?AUTO_5244 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5243 ?AUTO_5240 ) ( IN-CITY ?AUTO_5240 ?AUTO_5241 ) ( IN-CITY ?AUTO_5239 ?AUTO_5241 ) ( not ( = ?AUTO_5239 ?AUTO_5240 ) ) ( IN-AIRPLANE ?AUTO_5238 ?AUTO_5242 ) ( AIRPORT ?AUTO_5244 ) ( AIRPORT ?AUTO_5240 ) ( AIRPLANE-AT ?AUTO_5242 ?AUTO_5244 ) ( not ( = ?AUTO_5244 ?AUTO_5240 ) ) ( not ( = ?AUTO_5239 ?AUTO_5244 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5242 ?AUTO_5244 ?AUTO_5240 )
      ( DELIVER-PKG ?AUTO_5238 ?AUTO_5239 )
      ( DELIVER-PKG-VERIFY ?AUTO_5238 ?AUTO_5239 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5245 - OBJ
      ?AUTO_5246 - LOCATION
    )
    :vars
    (
      ?AUTO_5249 - TRUCK
      ?AUTO_5248 - LOCATION
      ?AUTO_5250 - CITY
      ?AUTO_5251 - LOCATION
      ?AUTO_5247 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5249 ?AUTO_5248 ) ( IN-CITY ?AUTO_5248 ?AUTO_5250 ) ( IN-CITY ?AUTO_5246 ?AUTO_5250 ) ( not ( = ?AUTO_5246 ?AUTO_5248 ) ) ( AIRPORT ?AUTO_5251 ) ( AIRPORT ?AUTO_5248 ) ( AIRPLANE-AT ?AUTO_5247 ?AUTO_5251 ) ( not ( = ?AUTO_5251 ?AUTO_5248 ) ) ( not ( = ?AUTO_5246 ?AUTO_5251 ) ) ( OBJ-AT ?AUTO_5245 ?AUTO_5251 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5245 ?AUTO_5247 ?AUTO_5251 )
      ( DELIVER-PKG ?AUTO_5245 ?AUTO_5246 )
      ( DELIVER-PKG-VERIFY ?AUTO_5245 ?AUTO_5246 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5252 - OBJ
      ?AUTO_5253 - LOCATION
    )
    :vars
    (
      ?AUTO_5255 - TRUCK
      ?AUTO_5254 - LOCATION
      ?AUTO_5256 - CITY
      ?AUTO_5257 - LOCATION
      ?AUTO_5258 - AIRPLANE
      ?AUTO_5259 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5255 ?AUTO_5254 ) ( IN-CITY ?AUTO_5254 ?AUTO_5256 ) ( IN-CITY ?AUTO_5253 ?AUTO_5256 ) ( not ( = ?AUTO_5253 ?AUTO_5254 ) ) ( AIRPORT ?AUTO_5257 ) ( AIRPORT ?AUTO_5254 ) ( AIRPLANE-AT ?AUTO_5258 ?AUTO_5257 ) ( not ( = ?AUTO_5257 ?AUTO_5254 ) ) ( not ( = ?AUTO_5253 ?AUTO_5257 ) ) ( TRUCK-AT ?AUTO_5259 ?AUTO_5257 ) ( IN-TRUCK ?AUTO_5252 ?AUTO_5259 ) ( not ( = ?AUTO_5255 ?AUTO_5259 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5252 ?AUTO_5259 ?AUTO_5257 )
      ( DELIVER-PKG ?AUTO_5252 ?AUTO_5253 )
      ( DELIVER-PKG-VERIFY ?AUTO_5252 ?AUTO_5253 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5260 - OBJ
      ?AUTO_5261 - LOCATION
    )
    :vars
    (
      ?AUTO_5266 - TRUCK
      ?AUTO_5263 - LOCATION
      ?AUTO_5264 - CITY
      ?AUTO_5262 - LOCATION
      ?AUTO_5265 - AIRPLANE
      ?AUTO_5267 - TRUCK
      ?AUTO_5268 - LOCATION
      ?AUTO_5269 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5266 ?AUTO_5263 ) ( IN-CITY ?AUTO_5263 ?AUTO_5264 ) ( IN-CITY ?AUTO_5261 ?AUTO_5264 ) ( not ( = ?AUTO_5261 ?AUTO_5263 ) ) ( AIRPORT ?AUTO_5262 ) ( AIRPORT ?AUTO_5263 ) ( AIRPLANE-AT ?AUTO_5265 ?AUTO_5262 ) ( not ( = ?AUTO_5262 ?AUTO_5263 ) ) ( not ( = ?AUTO_5261 ?AUTO_5262 ) ) ( IN-TRUCK ?AUTO_5260 ?AUTO_5267 ) ( not ( = ?AUTO_5266 ?AUTO_5267 ) ) ( TRUCK-AT ?AUTO_5267 ?AUTO_5268 ) ( IN-CITY ?AUTO_5268 ?AUTO_5269 ) ( IN-CITY ?AUTO_5262 ?AUTO_5269 ) ( not ( = ?AUTO_5262 ?AUTO_5268 ) ) ( not ( = ?AUTO_5261 ?AUTO_5268 ) ) ( not ( = ?AUTO_5263 ?AUTO_5268 ) ) ( not ( = ?AUTO_5264 ?AUTO_5269 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5267 ?AUTO_5268 ?AUTO_5262 ?AUTO_5269 )
      ( DELIVER-PKG ?AUTO_5260 ?AUTO_5261 )
      ( DELIVER-PKG-VERIFY ?AUTO_5260 ?AUTO_5261 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5270 - OBJ
      ?AUTO_5271 - LOCATION
    )
    :vars
    (
      ?AUTO_5274 - TRUCK
      ?AUTO_5273 - LOCATION
      ?AUTO_5277 - CITY
      ?AUTO_5272 - LOCATION
      ?AUTO_5275 - AIRPLANE
      ?AUTO_5278 - TRUCK
      ?AUTO_5279 - LOCATION
      ?AUTO_5276 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5274 ?AUTO_5273 ) ( IN-CITY ?AUTO_5273 ?AUTO_5277 ) ( IN-CITY ?AUTO_5271 ?AUTO_5277 ) ( not ( = ?AUTO_5271 ?AUTO_5273 ) ) ( AIRPORT ?AUTO_5272 ) ( AIRPORT ?AUTO_5273 ) ( AIRPLANE-AT ?AUTO_5275 ?AUTO_5272 ) ( not ( = ?AUTO_5272 ?AUTO_5273 ) ) ( not ( = ?AUTO_5271 ?AUTO_5272 ) ) ( not ( = ?AUTO_5274 ?AUTO_5278 ) ) ( TRUCK-AT ?AUTO_5278 ?AUTO_5279 ) ( IN-CITY ?AUTO_5279 ?AUTO_5276 ) ( IN-CITY ?AUTO_5272 ?AUTO_5276 ) ( not ( = ?AUTO_5272 ?AUTO_5279 ) ) ( not ( = ?AUTO_5271 ?AUTO_5279 ) ) ( not ( = ?AUTO_5273 ?AUTO_5279 ) ) ( not ( = ?AUTO_5277 ?AUTO_5276 ) ) ( OBJ-AT ?AUTO_5270 ?AUTO_5279 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5270 ?AUTO_5278 ?AUTO_5279 )
      ( DELIVER-PKG ?AUTO_5270 ?AUTO_5271 )
      ( DELIVER-PKG-VERIFY ?AUTO_5270 ?AUTO_5271 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5282 - OBJ
      ?AUTO_5283 - LOCATION
    )
    :vars
    (
      ?AUTO_5284 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5284 ?AUTO_5283 ) ( IN-TRUCK ?AUTO_5282 ?AUTO_5284 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5282 ?AUTO_5284 ?AUTO_5283 )
      ( DELIVER-PKG-VERIFY ?AUTO_5282 ?AUTO_5283 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5285 - OBJ
      ?AUTO_5286 - LOCATION
    )
    :vars
    (
      ?AUTO_5287 - TRUCK
      ?AUTO_5288 - LOCATION
      ?AUTO_5289 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5285 ?AUTO_5287 ) ( TRUCK-AT ?AUTO_5287 ?AUTO_5288 ) ( IN-CITY ?AUTO_5288 ?AUTO_5289 ) ( IN-CITY ?AUTO_5286 ?AUTO_5289 ) ( not ( = ?AUTO_5286 ?AUTO_5288 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5287 ?AUTO_5288 ?AUTO_5286 ?AUTO_5289 )
      ( DELIVER-PKG ?AUTO_5285 ?AUTO_5286 )
      ( DELIVER-PKG-VERIFY ?AUTO_5285 ?AUTO_5286 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5292 - OBJ
      ?AUTO_5293 - LOCATION
    )
    :vars
    (
      ?AUTO_5294 - TRUCK
      ?AUTO_5296 - LOCATION
      ?AUTO_5295 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5294 ?AUTO_5296 ) ( IN-CITY ?AUTO_5296 ?AUTO_5295 ) ( IN-CITY ?AUTO_5293 ?AUTO_5295 ) ( not ( = ?AUTO_5293 ?AUTO_5296 ) ) ( OBJ-AT ?AUTO_5292 ?AUTO_5296 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5292 ?AUTO_5294 ?AUTO_5296 )
      ( DELIVER-PKG ?AUTO_5292 ?AUTO_5293 )
      ( DELIVER-PKG-VERIFY ?AUTO_5292 ?AUTO_5293 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5297 - OBJ
      ?AUTO_5298 - LOCATION
    )
    :vars
    (
      ?AUTO_5300 - LOCATION
      ?AUTO_5301 - CITY
      ?AUTO_5299 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5300 ?AUTO_5301 ) ( IN-CITY ?AUTO_5298 ?AUTO_5301 ) ( not ( = ?AUTO_5298 ?AUTO_5300 ) ) ( OBJ-AT ?AUTO_5297 ?AUTO_5300 ) ( TRUCK-AT ?AUTO_5299 ?AUTO_5298 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5299 ?AUTO_5298 ?AUTO_5300 ?AUTO_5301 )
      ( DELIVER-PKG ?AUTO_5297 ?AUTO_5298 )
      ( DELIVER-PKG-VERIFY ?AUTO_5297 ?AUTO_5298 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5340 - OBJ
      ?AUTO_5341 - LOCATION
    )
    :vars
    (
      ?AUTO_5342 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5340 ?AUTO_5342 ) ( AIRPLANE-AT ?AUTO_5342 ?AUTO_5341 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5340 ?AUTO_5342 ?AUTO_5341 )
      ( DELIVER-PKG-VERIFY ?AUTO_5340 ?AUTO_5341 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5343 - OBJ
      ?AUTO_5344 - LOCATION
    )
    :vars
    (
      ?AUTO_5345 - AIRPLANE
      ?AUTO_5346 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5343 ?AUTO_5345 ) ( AIRPORT ?AUTO_5346 ) ( AIRPORT ?AUTO_5344 ) ( AIRPLANE-AT ?AUTO_5345 ?AUTO_5346 ) ( not ( = ?AUTO_5346 ?AUTO_5344 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5345 ?AUTO_5346 ?AUTO_5344 )
      ( DELIVER-PKG ?AUTO_5343 ?AUTO_5344 )
      ( DELIVER-PKG-VERIFY ?AUTO_5343 ?AUTO_5344 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5347 - OBJ
      ?AUTO_5348 - LOCATION
    )
    :vars
    (
      ?AUTO_5350 - LOCATION
      ?AUTO_5349 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5350 ) ( AIRPORT ?AUTO_5348 ) ( AIRPLANE-AT ?AUTO_5349 ?AUTO_5350 ) ( not ( = ?AUTO_5350 ?AUTO_5348 ) ) ( OBJ-AT ?AUTO_5347 ?AUTO_5350 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5347 ?AUTO_5349 ?AUTO_5350 )
      ( DELIVER-PKG ?AUTO_5347 ?AUTO_5348 )
      ( DELIVER-PKG-VERIFY ?AUTO_5347 ?AUTO_5348 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5351 - OBJ
      ?AUTO_5352 - LOCATION
    )
    :vars
    (
      ?AUTO_5354 - LOCATION
      ?AUTO_5353 - AIRPLANE
      ?AUTO_5355 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5354 ) ( AIRPORT ?AUTO_5352 ) ( AIRPLANE-AT ?AUTO_5353 ?AUTO_5354 ) ( not ( = ?AUTO_5354 ?AUTO_5352 ) ) ( TRUCK-AT ?AUTO_5355 ?AUTO_5354 ) ( IN-TRUCK ?AUTO_5351 ?AUTO_5355 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5351 ?AUTO_5355 ?AUTO_5354 )
      ( DELIVER-PKG ?AUTO_5351 ?AUTO_5352 )
      ( DELIVER-PKG-VERIFY ?AUTO_5351 ?AUTO_5352 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5356 - OBJ
      ?AUTO_5357 - LOCATION
    )
    :vars
    (
      ?AUTO_5359 - LOCATION
      ?AUTO_5358 - AIRPLANE
      ?AUTO_5360 - TRUCK
      ?AUTO_5361 - LOCATION
      ?AUTO_5362 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5359 ) ( AIRPORT ?AUTO_5357 ) ( AIRPLANE-AT ?AUTO_5358 ?AUTO_5359 ) ( not ( = ?AUTO_5359 ?AUTO_5357 ) ) ( IN-TRUCK ?AUTO_5356 ?AUTO_5360 ) ( TRUCK-AT ?AUTO_5360 ?AUTO_5361 ) ( IN-CITY ?AUTO_5361 ?AUTO_5362 ) ( IN-CITY ?AUTO_5359 ?AUTO_5362 ) ( not ( = ?AUTO_5359 ?AUTO_5361 ) ) ( not ( = ?AUTO_5357 ?AUTO_5361 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5360 ?AUTO_5361 ?AUTO_5359 ?AUTO_5362 )
      ( DELIVER-PKG ?AUTO_5356 ?AUTO_5357 )
      ( DELIVER-PKG-VERIFY ?AUTO_5356 ?AUTO_5357 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5365 - OBJ
      ?AUTO_5366 - LOCATION
    )
    :vars
    (
      ?AUTO_5370 - LOCATION
      ?AUTO_5371 - AIRPLANE
      ?AUTO_5367 - TRUCK
      ?AUTO_5369 - LOCATION
      ?AUTO_5368 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5370 ) ( AIRPORT ?AUTO_5366 ) ( AIRPLANE-AT ?AUTO_5371 ?AUTO_5370 ) ( not ( = ?AUTO_5370 ?AUTO_5366 ) ) ( TRUCK-AT ?AUTO_5367 ?AUTO_5369 ) ( IN-CITY ?AUTO_5369 ?AUTO_5368 ) ( IN-CITY ?AUTO_5370 ?AUTO_5368 ) ( not ( = ?AUTO_5370 ?AUTO_5369 ) ) ( not ( = ?AUTO_5366 ?AUTO_5369 ) ) ( OBJ-AT ?AUTO_5365 ?AUTO_5369 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5365 ?AUTO_5367 ?AUTO_5369 )
      ( DELIVER-PKG ?AUTO_5365 ?AUTO_5366 )
      ( DELIVER-PKG-VERIFY ?AUTO_5365 ?AUTO_5366 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5372 - OBJ
      ?AUTO_5373 - LOCATION
    )
    :vars
    (
      ?AUTO_5377 - LOCATION
      ?AUTO_5378 - AIRPLANE
      ?AUTO_5375 - LOCATION
      ?AUTO_5376 - CITY
      ?AUTO_5374 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5377 ) ( AIRPORT ?AUTO_5373 ) ( AIRPLANE-AT ?AUTO_5378 ?AUTO_5377 ) ( not ( = ?AUTO_5377 ?AUTO_5373 ) ) ( IN-CITY ?AUTO_5375 ?AUTO_5376 ) ( IN-CITY ?AUTO_5377 ?AUTO_5376 ) ( not ( = ?AUTO_5377 ?AUTO_5375 ) ) ( not ( = ?AUTO_5373 ?AUTO_5375 ) ) ( OBJ-AT ?AUTO_5372 ?AUTO_5375 ) ( TRUCK-AT ?AUTO_5374 ?AUTO_5377 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5374 ?AUTO_5377 ?AUTO_5375 ?AUTO_5376 )
      ( DELIVER-PKG ?AUTO_5372 ?AUTO_5373 )
      ( DELIVER-PKG-VERIFY ?AUTO_5372 ?AUTO_5373 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5417 - OBJ
      ?AUTO_5418 - LOCATION
    )
    :vars
    (
      ?AUTO_5419 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5419 ?AUTO_5418 ) ( IN-TRUCK ?AUTO_5417 ?AUTO_5419 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5417 ?AUTO_5419 ?AUTO_5418 )
      ( DELIVER-PKG-VERIFY ?AUTO_5417 ?AUTO_5418 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5420 - OBJ
      ?AUTO_5421 - LOCATION
    )
    :vars
    (
      ?AUTO_5422 - TRUCK
      ?AUTO_5423 - LOCATION
      ?AUTO_5424 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5420 ?AUTO_5422 ) ( TRUCK-AT ?AUTO_5422 ?AUTO_5423 ) ( IN-CITY ?AUTO_5423 ?AUTO_5424 ) ( IN-CITY ?AUTO_5421 ?AUTO_5424 ) ( not ( = ?AUTO_5421 ?AUTO_5423 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5422 ?AUTO_5423 ?AUTO_5421 ?AUTO_5424 )
      ( DELIVER-PKG ?AUTO_5420 ?AUTO_5421 )
      ( DELIVER-PKG-VERIFY ?AUTO_5420 ?AUTO_5421 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5425 - OBJ
      ?AUTO_5426 - LOCATION
    )
    :vars
    (
      ?AUTO_5428 - TRUCK
      ?AUTO_5429 - LOCATION
      ?AUTO_5427 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5428 ?AUTO_5429 ) ( IN-CITY ?AUTO_5429 ?AUTO_5427 ) ( IN-CITY ?AUTO_5426 ?AUTO_5427 ) ( not ( = ?AUTO_5426 ?AUTO_5429 ) ) ( OBJ-AT ?AUTO_5425 ?AUTO_5429 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5425 ?AUTO_5428 ?AUTO_5429 )
      ( DELIVER-PKG ?AUTO_5425 ?AUTO_5426 )
      ( DELIVER-PKG-VERIFY ?AUTO_5425 ?AUTO_5426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5430 - OBJ
      ?AUTO_5431 - LOCATION
    )
    :vars
    (
      ?AUTO_5433 - LOCATION
      ?AUTO_5432 - CITY
      ?AUTO_5434 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5433 ?AUTO_5432 ) ( IN-CITY ?AUTO_5431 ?AUTO_5432 ) ( not ( = ?AUTO_5431 ?AUTO_5433 ) ) ( OBJ-AT ?AUTO_5430 ?AUTO_5433 ) ( TRUCK-AT ?AUTO_5434 ?AUTO_5431 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5434 ?AUTO_5431 ?AUTO_5433 ?AUTO_5432 )
      ( DELIVER-PKG ?AUTO_5430 ?AUTO_5431 )
      ( DELIVER-PKG-VERIFY ?AUTO_5430 ?AUTO_5431 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5435 - OBJ
      ?AUTO_5436 - LOCATION
    )
    :vars
    (
      ?AUTO_5439 - LOCATION
      ?AUTO_5437 - CITY
      ?AUTO_5438 - TRUCK
      ?AUTO_5440 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5439 ?AUTO_5437 ) ( IN-CITY ?AUTO_5436 ?AUTO_5437 ) ( not ( = ?AUTO_5436 ?AUTO_5439 ) ) ( TRUCK-AT ?AUTO_5438 ?AUTO_5436 ) ( IN-AIRPLANE ?AUTO_5435 ?AUTO_5440 ) ( AIRPLANE-AT ?AUTO_5440 ?AUTO_5439 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5435 ?AUTO_5440 ?AUTO_5439 )
      ( DELIVER-PKG ?AUTO_5435 ?AUTO_5436 )
      ( DELIVER-PKG-VERIFY ?AUTO_5435 ?AUTO_5436 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5441 - OBJ
      ?AUTO_5442 - LOCATION
    )
    :vars
    (
      ?AUTO_5446 - LOCATION
      ?AUTO_5444 - CITY
      ?AUTO_5443 - TRUCK
      ?AUTO_5445 - AIRPLANE
      ?AUTO_5447 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5446 ?AUTO_5444 ) ( IN-CITY ?AUTO_5442 ?AUTO_5444 ) ( not ( = ?AUTO_5442 ?AUTO_5446 ) ) ( TRUCK-AT ?AUTO_5443 ?AUTO_5442 ) ( IN-AIRPLANE ?AUTO_5441 ?AUTO_5445 ) ( AIRPORT ?AUTO_5447 ) ( AIRPORT ?AUTO_5446 ) ( AIRPLANE-AT ?AUTO_5445 ?AUTO_5447 ) ( not ( = ?AUTO_5447 ?AUTO_5446 ) ) ( not ( = ?AUTO_5442 ?AUTO_5447 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5445 ?AUTO_5447 ?AUTO_5446 )
      ( DELIVER-PKG ?AUTO_5441 ?AUTO_5442 )
      ( DELIVER-PKG-VERIFY ?AUTO_5441 ?AUTO_5442 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5448 - OBJ
      ?AUTO_5449 - LOCATION
    )
    :vars
    (
      ?AUTO_5451 - LOCATION
      ?AUTO_5450 - CITY
      ?AUTO_5452 - TRUCK
      ?AUTO_5454 - LOCATION
      ?AUTO_5453 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5451 ?AUTO_5450 ) ( IN-CITY ?AUTO_5449 ?AUTO_5450 ) ( not ( = ?AUTO_5449 ?AUTO_5451 ) ) ( TRUCK-AT ?AUTO_5452 ?AUTO_5449 ) ( AIRPORT ?AUTO_5454 ) ( AIRPORT ?AUTO_5451 ) ( AIRPLANE-AT ?AUTO_5453 ?AUTO_5454 ) ( not ( = ?AUTO_5454 ?AUTO_5451 ) ) ( not ( = ?AUTO_5449 ?AUTO_5454 ) ) ( OBJ-AT ?AUTO_5448 ?AUTO_5454 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5448 ?AUTO_5453 ?AUTO_5454 )
      ( DELIVER-PKG ?AUTO_5448 ?AUTO_5449 )
      ( DELIVER-PKG-VERIFY ?AUTO_5448 ?AUTO_5449 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5455 - OBJ
      ?AUTO_5456 - LOCATION
    )
    :vars
    (
      ?AUTO_5460 - LOCATION
      ?AUTO_5459 - CITY
      ?AUTO_5458 - TRUCK
      ?AUTO_5461 - LOCATION
      ?AUTO_5457 - AIRPLANE
      ?AUTO_5462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5460 ?AUTO_5459 ) ( IN-CITY ?AUTO_5456 ?AUTO_5459 ) ( not ( = ?AUTO_5456 ?AUTO_5460 ) ) ( TRUCK-AT ?AUTO_5458 ?AUTO_5456 ) ( AIRPORT ?AUTO_5461 ) ( AIRPORT ?AUTO_5460 ) ( AIRPLANE-AT ?AUTO_5457 ?AUTO_5461 ) ( not ( = ?AUTO_5461 ?AUTO_5460 ) ) ( not ( = ?AUTO_5456 ?AUTO_5461 ) ) ( TRUCK-AT ?AUTO_5462 ?AUTO_5461 ) ( IN-TRUCK ?AUTO_5455 ?AUTO_5462 ) ( not ( = ?AUTO_5458 ?AUTO_5462 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5455 ?AUTO_5462 ?AUTO_5461 )
      ( DELIVER-PKG ?AUTO_5455 ?AUTO_5456 )
      ( DELIVER-PKG-VERIFY ?AUTO_5455 ?AUTO_5456 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5463 - OBJ
      ?AUTO_5464 - LOCATION
    )
    :vars
    (
      ?AUTO_5467 - LOCATION
      ?AUTO_5466 - CITY
      ?AUTO_5468 - TRUCK
      ?AUTO_5469 - LOCATION
      ?AUTO_5465 - AIRPLANE
      ?AUTO_5470 - TRUCK
      ?AUTO_5471 - LOCATION
      ?AUTO_5472 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5467 ?AUTO_5466 ) ( IN-CITY ?AUTO_5464 ?AUTO_5466 ) ( not ( = ?AUTO_5464 ?AUTO_5467 ) ) ( TRUCK-AT ?AUTO_5468 ?AUTO_5464 ) ( AIRPORT ?AUTO_5469 ) ( AIRPORT ?AUTO_5467 ) ( AIRPLANE-AT ?AUTO_5465 ?AUTO_5469 ) ( not ( = ?AUTO_5469 ?AUTO_5467 ) ) ( not ( = ?AUTO_5464 ?AUTO_5469 ) ) ( IN-TRUCK ?AUTO_5463 ?AUTO_5470 ) ( not ( = ?AUTO_5468 ?AUTO_5470 ) ) ( TRUCK-AT ?AUTO_5470 ?AUTO_5471 ) ( IN-CITY ?AUTO_5471 ?AUTO_5472 ) ( IN-CITY ?AUTO_5469 ?AUTO_5472 ) ( not ( = ?AUTO_5469 ?AUTO_5471 ) ) ( not ( = ?AUTO_5464 ?AUTO_5471 ) ) ( not ( = ?AUTO_5467 ?AUTO_5471 ) ) ( not ( = ?AUTO_5466 ?AUTO_5472 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5470 ?AUTO_5471 ?AUTO_5469 ?AUTO_5472 )
      ( DELIVER-PKG ?AUTO_5463 ?AUTO_5464 )
      ( DELIVER-PKG-VERIFY ?AUTO_5463 ?AUTO_5464 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5475 - OBJ
      ?AUTO_5476 - LOCATION
    )
    :vars
    (
      ?AUTO_5480 - LOCATION
      ?AUTO_5481 - CITY
      ?AUTO_5482 - TRUCK
      ?AUTO_5484 - LOCATION
      ?AUTO_5483 - AIRPLANE
      ?AUTO_5478 - TRUCK
      ?AUTO_5479 - LOCATION
      ?AUTO_5477 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5480 ?AUTO_5481 ) ( IN-CITY ?AUTO_5476 ?AUTO_5481 ) ( not ( = ?AUTO_5476 ?AUTO_5480 ) ) ( TRUCK-AT ?AUTO_5482 ?AUTO_5476 ) ( AIRPORT ?AUTO_5484 ) ( AIRPORT ?AUTO_5480 ) ( AIRPLANE-AT ?AUTO_5483 ?AUTO_5484 ) ( not ( = ?AUTO_5484 ?AUTO_5480 ) ) ( not ( = ?AUTO_5476 ?AUTO_5484 ) ) ( not ( = ?AUTO_5482 ?AUTO_5478 ) ) ( TRUCK-AT ?AUTO_5478 ?AUTO_5479 ) ( IN-CITY ?AUTO_5479 ?AUTO_5477 ) ( IN-CITY ?AUTO_5484 ?AUTO_5477 ) ( not ( = ?AUTO_5484 ?AUTO_5479 ) ) ( not ( = ?AUTO_5476 ?AUTO_5479 ) ) ( not ( = ?AUTO_5480 ?AUTO_5479 ) ) ( not ( = ?AUTO_5481 ?AUTO_5477 ) ) ( OBJ-AT ?AUTO_5475 ?AUTO_5479 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5475 ?AUTO_5478 ?AUTO_5479 )
      ( DELIVER-PKG ?AUTO_5475 ?AUTO_5476 )
      ( DELIVER-PKG-VERIFY ?AUTO_5475 ?AUTO_5476 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5485 - OBJ
      ?AUTO_5486 - LOCATION
    )
    :vars
    (
      ?AUTO_5494 - LOCATION
      ?AUTO_5492 - CITY
      ?AUTO_5489 - TRUCK
      ?AUTO_5490 - LOCATION
      ?AUTO_5487 - AIRPLANE
      ?AUTO_5491 - TRUCK
      ?AUTO_5488 - LOCATION
      ?AUTO_5493 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5494 ?AUTO_5492 ) ( IN-CITY ?AUTO_5486 ?AUTO_5492 ) ( not ( = ?AUTO_5486 ?AUTO_5494 ) ) ( TRUCK-AT ?AUTO_5489 ?AUTO_5486 ) ( AIRPORT ?AUTO_5490 ) ( AIRPORT ?AUTO_5494 ) ( AIRPLANE-AT ?AUTO_5487 ?AUTO_5490 ) ( not ( = ?AUTO_5490 ?AUTO_5494 ) ) ( not ( = ?AUTO_5486 ?AUTO_5490 ) ) ( not ( = ?AUTO_5489 ?AUTO_5491 ) ) ( IN-CITY ?AUTO_5488 ?AUTO_5493 ) ( IN-CITY ?AUTO_5490 ?AUTO_5493 ) ( not ( = ?AUTO_5490 ?AUTO_5488 ) ) ( not ( = ?AUTO_5486 ?AUTO_5488 ) ) ( not ( = ?AUTO_5494 ?AUTO_5488 ) ) ( not ( = ?AUTO_5492 ?AUTO_5493 ) ) ( OBJ-AT ?AUTO_5485 ?AUTO_5488 ) ( TRUCK-AT ?AUTO_5491 ?AUTO_5490 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5491 ?AUTO_5490 ?AUTO_5488 ?AUTO_5493 )
      ( DELIVER-PKG ?AUTO_5485 ?AUTO_5486 )
      ( DELIVER-PKG-VERIFY ?AUTO_5485 ?AUTO_5486 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5497 - OBJ
      ?AUTO_5498 - LOCATION
    )
    :vars
    (
      ?AUTO_5499 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5499 ?AUTO_5498 ) ( IN-TRUCK ?AUTO_5497 ?AUTO_5499 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5497 ?AUTO_5499 ?AUTO_5498 )
      ( DELIVER-PKG-VERIFY ?AUTO_5497 ?AUTO_5498 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5504 - OBJ
      ?AUTO_5505 - LOCATION
    )
    :vars
    (
      ?AUTO_5506 - TRUCK
      ?AUTO_5507 - LOCATION
      ?AUTO_5508 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5504 ?AUTO_5506 ) ( TRUCK-AT ?AUTO_5506 ?AUTO_5507 ) ( IN-CITY ?AUTO_5507 ?AUTO_5508 ) ( IN-CITY ?AUTO_5505 ?AUTO_5508 ) ( not ( = ?AUTO_5505 ?AUTO_5507 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5506 ?AUTO_5507 ?AUTO_5505 ?AUTO_5508 )
      ( DELIVER-PKG ?AUTO_5504 ?AUTO_5505 )
      ( DELIVER-PKG-VERIFY ?AUTO_5504 ?AUTO_5505 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5513 - OBJ
      ?AUTO_5514 - LOCATION
    )
    :vars
    (
      ?AUTO_5517 - TRUCK
      ?AUTO_5515 - LOCATION
      ?AUTO_5516 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5517 ?AUTO_5515 ) ( IN-CITY ?AUTO_5515 ?AUTO_5516 ) ( IN-CITY ?AUTO_5514 ?AUTO_5516 ) ( not ( = ?AUTO_5514 ?AUTO_5515 ) ) ( OBJ-AT ?AUTO_5513 ?AUTO_5515 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5513 ?AUTO_5517 ?AUTO_5515 )
      ( DELIVER-PKG ?AUTO_5513 ?AUTO_5514 )
      ( DELIVER-PKG-VERIFY ?AUTO_5513 ?AUTO_5514 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5520 - OBJ
      ?AUTO_5521 - LOCATION
    )
    :vars
    (
      ?AUTO_5522 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5522 ?AUTO_5521 ) ( IN-TRUCK ?AUTO_5520 ?AUTO_5522 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5520 ?AUTO_5522 ?AUTO_5521 )
      ( DELIVER-PKG-VERIFY ?AUTO_5520 ?AUTO_5521 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5531 - OBJ
      ?AUTO_5532 - LOCATION
    )
    :vars
    (
      ?AUTO_5534 - TRUCK
      ?AUTO_5533 - LOCATION
      ?AUTO_5535 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5534 ?AUTO_5533 ) ( IN-CITY ?AUTO_5533 ?AUTO_5535 ) ( IN-CITY ?AUTO_5532 ?AUTO_5535 ) ( not ( = ?AUTO_5532 ?AUTO_5533 ) ) ( OBJ-AT ?AUTO_5531 ?AUTO_5533 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5531 ?AUTO_5534 ?AUTO_5533 )
      ( DELIVER-PKG ?AUTO_5531 ?AUTO_5532 )
      ( DELIVER-PKG-VERIFY ?AUTO_5531 ?AUTO_5532 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5536 - OBJ
      ?AUTO_5537 - LOCATION
    )
    :vars
    (
      ?AUTO_5539 - LOCATION
      ?AUTO_5540 - CITY
      ?AUTO_5538 - TRUCK
      ?AUTO_5541 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5539 ?AUTO_5540 ) ( IN-CITY ?AUTO_5537 ?AUTO_5540 ) ( not ( = ?AUTO_5537 ?AUTO_5539 ) ) ( OBJ-AT ?AUTO_5536 ?AUTO_5539 ) ( TRUCK-AT ?AUTO_5538 ?AUTO_5541 ) ( IN-CITY ?AUTO_5541 ?AUTO_5540 ) ( not ( = ?AUTO_5539 ?AUTO_5541 ) ) ( not ( = ?AUTO_5537 ?AUTO_5541 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5538 ?AUTO_5541 ?AUTO_5539 ?AUTO_5540 )
      ( DELIVER-PKG ?AUTO_5536 ?AUTO_5537 )
      ( DELIVER-PKG-VERIFY ?AUTO_5536 ?AUTO_5537 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5546 - OBJ
      ?AUTO_5547 - LOCATION
    )
    :vars
    (
      ?AUTO_5548 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5548 ?AUTO_5547 ) ( IN-TRUCK ?AUTO_5546 ?AUTO_5548 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5546 ?AUTO_5548 ?AUTO_5547 )
      ( DELIVER-PKG-VERIFY ?AUTO_5546 ?AUTO_5547 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5555 - OBJ
      ?AUTO_5556 - LOCATION
    )
    :vars
    (
      ?AUTO_5557 - TRUCK
      ?AUTO_5558 - LOCATION
      ?AUTO_5559 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5555 ?AUTO_5557 ) ( TRUCK-AT ?AUTO_5557 ?AUTO_5558 ) ( IN-CITY ?AUTO_5558 ?AUTO_5559 ) ( IN-CITY ?AUTO_5556 ?AUTO_5559 ) ( not ( = ?AUTO_5556 ?AUTO_5558 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5557 ?AUTO_5558 ?AUTO_5556 ?AUTO_5559 )
      ( DELIVER-PKG ?AUTO_5555 ?AUTO_5556 )
      ( DELIVER-PKG-VERIFY ?AUTO_5555 ?AUTO_5556 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5560 - OBJ
      ?AUTO_5561 - LOCATION
    )
    :vars
    (
      ?AUTO_5562 - TRUCK
      ?AUTO_5563 - LOCATION
      ?AUTO_5564 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5562 ?AUTO_5563 ) ( IN-CITY ?AUTO_5563 ?AUTO_5564 ) ( IN-CITY ?AUTO_5561 ?AUTO_5564 ) ( not ( = ?AUTO_5561 ?AUTO_5563 ) ) ( OBJ-AT ?AUTO_5560 ?AUTO_5563 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5560 ?AUTO_5562 ?AUTO_5563 )
      ( DELIVER-PKG ?AUTO_5560 ?AUTO_5561 )
      ( DELIVER-PKG-VERIFY ?AUTO_5560 ?AUTO_5561 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5571 - OBJ
      ?AUTO_5572 - LOCATION
    )
    :vars
    (
      ?AUTO_5575 - LOCATION
      ?AUTO_5574 - CITY
      ?AUTO_5573 - TRUCK
      ?AUTO_5576 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5575 ?AUTO_5574 ) ( IN-CITY ?AUTO_5572 ?AUTO_5574 ) ( not ( = ?AUTO_5572 ?AUTO_5575 ) ) ( OBJ-AT ?AUTO_5571 ?AUTO_5575 ) ( TRUCK-AT ?AUTO_5573 ?AUTO_5576 ) ( IN-CITY ?AUTO_5576 ?AUTO_5574 ) ( not ( = ?AUTO_5575 ?AUTO_5576 ) ) ( not ( = ?AUTO_5572 ?AUTO_5576 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5573 ?AUTO_5576 ?AUTO_5575 ?AUTO_5574 )
      ( DELIVER-PKG ?AUTO_5571 ?AUTO_5572 )
      ( DELIVER-PKG-VERIFY ?AUTO_5571 ?AUTO_5572 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5587 - OBJ
      ?AUTO_5588 - LOCATION
    )
    :vars
    (
      ?AUTO_5589 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5589 ?AUTO_5588 ) ( IN-TRUCK ?AUTO_5587 ?AUTO_5589 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5587 ?AUTO_5589 ?AUTO_5588 )
      ( DELIVER-PKG-VERIFY ?AUTO_5587 ?AUTO_5588 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5590 - OBJ
      ?AUTO_5591 - LOCATION
    )
    :vars
    (
      ?AUTO_5592 - TRUCK
      ?AUTO_5593 - LOCATION
      ?AUTO_5594 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5590 ?AUTO_5592 ) ( TRUCK-AT ?AUTO_5592 ?AUTO_5593 ) ( IN-CITY ?AUTO_5593 ?AUTO_5594 ) ( IN-CITY ?AUTO_5591 ?AUTO_5594 ) ( not ( = ?AUTO_5591 ?AUTO_5593 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5592 ?AUTO_5593 ?AUTO_5591 ?AUTO_5594 )
      ( DELIVER-PKG ?AUTO_5590 ?AUTO_5591 )
      ( DELIVER-PKG-VERIFY ?AUTO_5590 ?AUTO_5591 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5597 - OBJ
      ?AUTO_5598 - LOCATION
    )
    :vars
    (
      ?AUTO_5599 - TRUCK
      ?AUTO_5601 - LOCATION
      ?AUTO_5600 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5599 ?AUTO_5601 ) ( IN-CITY ?AUTO_5601 ?AUTO_5600 ) ( IN-CITY ?AUTO_5598 ?AUTO_5600 ) ( not ( = ?AUTO_5598 ?AUTO_5601 ) ) ( OBJ-AT ?AUTO_5597 ?AUTO_5601 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5597 ?AUTO_5599 ?AUTO_5601 )
      ( DELIVER-PKG ?AUTO_5597 ?AUTO_5598 )
      ( DELIVER-PKG-VERIFY ?AUTO_5597 ?AUTO_5598 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5602 - OBJ
      ?AUTO_5603 - LOCATION
    )
    :vars
    (
      ?AUTO_5605 - LOCATION
      ?AUTO_5606 - CITY
      ?AUTO_5604 - TRUCK
      ?AUTO_5607 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5605 ?AUTO_5606 ) ( IN-CITY ?AUTO_5603 ?AUTO_5606 ) ( not ( = ?AUTO_5603 ?AUTO_5605 ) ) ( OBJ-AT ?AUTO_5602 ?AUTO_5605 ) ( TRUCK-AT ?AUTO_5604 ?AUTO_5607 ) ( IN-CITY ?AUTO_5607 ?AUTO_5606 ) ( not ( = ?AUTO_5605 ?AUTO_5607 ) ) ( not ( = ?AUTO_5603 ?AUTO_5607 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5604 ?AUTO_5607 ?AUTO_5605 ?AUTO_5606 )
      ( DELIVER-PKG ?AUTO_5602 ?AUTO_5603 )
      ( DELIVER-PKG-VERIFY ?AUTO_5602 ?AUTO_5603 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5644 - OBJ
      ?AUTO_5645 - LOCATION
    )
    :vars
    (
      ?AUTO_5646 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5646 ?AUTO_5645 ) ( IN-TRUCK ?AUTO_5644 ?AUTO_5646 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5644 ?AUTO_5646 ?AUTO_5645 )
      ( DELIVER-PKG-VERIFY ?AUTO_5644 ?AUTO_5645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5653 - OBJ
      ?AUTO_5654 - LOCATION
    )
    :vars
    (
      ?AUTO_5656 - TRUCK
      ?AUTO_5655 - LOCATION
      ?AUTO_5657 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5656 ?AUTO_5655 ) ( IN-CITY ?AUTO_5655 ?AUTO_5657 ) ( IN-CITY ?AUTO_5654 ?AUTO_5657 ) ( not ( = ?AUTO_5654 ?AUTO_5655 ) ) ( OBJ-AT ?AUTO_5653 ?AUTO_5655 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5653 ?AUTO_5656 ?AUTO_5655 )
      ( DELIVER-PKG ?AUTO_5653 ?AUTO_5654 )
      ( DELIVER-PKG-VERIFY ?AUTO_5653 ?AUTO_5654 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5698 - OBJ
      ?AUTO_5699 - LOCATION
    )
    :vars
    (
      ?AUTO_5700 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5700 ?AUTO_5699 ) ( IN-TRUCK ?AUTO_5698 ?AUTO_5700 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5698 ?AUTO_5700 ?AUTO_5699 )
      ( DELIVER-PKG-VERIFY ?AUTO_5698 ?AUTO_5699 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5701 - OBJ
      ?AUTO_5702 - LOCATION
    )
    :vars
    (
      ?AUTO_5703 - TRUCK
      ?AUTO_5704 - LOCATION
      ?AUTO_5705 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5701 ?AUTO_5703 ) ( TRUCK-AT ?AUTO_5703 ?AUTO_5704 ) ( IN-CITY ?AUTO_5704 ?AUTO_5705 ) ( IN-CITY ?AUTO_5702 ?AUTO_5705 ) ( not ( = ?AUTO_5702 ?AUTO_5704 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5703 ?AUTO_5704 ?AUTO_5702 ?AUTO_5705 )
      ( DELIVER-PKG ?AUTO_5701 ?AUTO_5702 )
      ( DELIVER-PKG-VERIFY ?AUTO_5701 ?AUTO_5702 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5706 - OBJ
      ?AUTO_5707 - LOCATION
    )
    :vars
    (
      ?AUTO_5708 - TRUCK
      ?AUTO_5709 - LOCATION
      ?AUTO_5710 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5708 ?AUTO_5709 ) ( IN-CITY ?AUTO_5709 ?AUTO_5710 ) ( IN-CITY ?AUTO_5707 ?AUTO_5710 ) ( not ( = ?AUTO_5707 ?AUTO_5709 ) ) ( OBJ-AT ?AUTO_5706 ?AUTO_5709 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5706 ?AUTO_5708 ?AUTO_5709 )
      ( DELIVER-PKG ?AUTO_5706 ?AUTO_5707 )
      ( DELIVER-PKG-VERIFY ?AUTO_5706 ?AUTO_5707 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5711 - OBJ
      ?AUTO_5712 - LOCATION
    )
    :vars
    (
      ?AUTO_5713 - LOCATION
      ?AUTO_5715 - CITY
      ?AUTO_5714 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5713 ?AUTO_5715 ) ( IN-CITY ?AUTO_5712 ?AUTO_5715 ) ( not ( = ?AUTO_5712 ?AUTO_5713 ) ) ( OBJ-AT ?AUTO_5711 ?AUTO_5713 ) ( TRUCK-AT ?AUTO_5714 ?AUTO_5712 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5714 ?AUTO_5712 ?AUTO_5713 ?AUTO_5715 )
      ( DELIVER-PKG ?AUTO_5711 ?AUTO_5712 )
      ( DELIVER-PKG-VERIFY ?AUTO_5711 ?AUTO_5712 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5768 - OBJ
      ?AUTO_5769 - LOCATION
    )
    :vars
    (
      ?AUTO_5770 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5768 ?AUTO_5770 ) ( AIRPLANE-AT ?AUTO_5770 ?AUTO_5769 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5768 ?AUTO_5770 ?AUTO_5769 )
      ( DELIVER-PKG-VERIFY ?AUTO_5768 ?AUTO_5769 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5775 - OBJ
      ?AUTO_5776 - LOCATION
    )
    :vars
    (
      ?AUTO_5777 - AIRPLANE
      ?AUTO_5778 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5775 ?AUTO_5777 ) ( AIRPORT ?AUTO_5778 ) ( AIRPORT ?AUTO_5776 ) ( AIRPLANE-AT ?AUTO_5777 ?AUTO_5778 ) ( not ( = ?AUTO_5778 ?AUTO_5776 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5777 ?AUTO_5778 ?AUTO_5776 )
      ( DELIVER-PKG ?AUTO_5775 ?AUTO_5776 )
      ( DELIVER-PKG-VERIFY ?AUTO_5775 ?AUTO_5776 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5815 - OBJ
      ?AUTO_5816 - LOCATION
    )
    :vars
    (
      ?AUTO_5817 - LOCATION
      ?AUTO_5818 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5817 ) ( AIRPORT ?AUTO_5816 ) ( AIRPLANE-AT ?AUTO_5818 ?AUTO_5817 ) ( not ( = ?AUTO_5817 ?AUTO_5816 ) ) ( OBJ-AT ?AUTO_5815 ?AUTO_5817 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5815 ?AUTO_5818 ?AUTO_5817 )
      ( DELIVER-PKG ?AUTO_5815 ?AUTO_5816 )
      ( DELIVER-PKG-VERIFY ?AUTO_5815 ?AUTO_5816 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5827 - OBJ
      ?AUTO_5828 - LOCATION
    )
    :vars
    (
      ?AUTO_5830 - LOCATION
      ?AUTO_5831 - LOCATION
      ?AUTO_5829 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5830 ) ( AIRPORT ?AUTO_5828 ) ( not ( = ?AUTO_5830 ?AUTO_5828 ) ) ( OBJ-AT ?AUTO_5827 ?AUTO_5830 ) ( AIRPORT ?AUTO_5831 ) ( AIRPLANE-AT ?AUTO_5829 ?AUTO_5831 ) ( not ( = ?AUTO_5831 ?AUTO_5830 ) ) ( not ( = ?AUTO_5828 ?AUTO_5831 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5829 ?AUTO_5831 ?AUTO_5830 )
      ( DELIVER-PKG ?AUTO_5827 ?AUTO_5828 )
      ( DELIVER-PKG-VERIFY ?AUTO_5827 ?AUTO_5828 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5844 - OBJ
      ?AUTO_5845 - LOCATION
    )
    :vars
    (
      ?AUTO_5846 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5844 ?AUTO_5846 ) ( AIRPLANE-AT ?AUTO_5846 ?AUTO_5845 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5844 ?AUTO_5846 ?AUTO_5845 )
      ( DELIVER-PKG-VERIFY ?AUTO_5844 ?AUTO_5845 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5847 - OBJ
      ?AUTO_5848 - LOCATION
    )
    :vars
    (
      ?AUTO_5849 - AIRPLANE
      ?AUTO_5850 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5847 ?AUTO_5849 ) ( AIRPORT ?AUTO_5850 ) ( AIRPORT ?AUTO_5848 ) ( AIRPLANE-AT ?AUTO_5849 ?AUTO_5850 ) ( not ( = ?AUTO_5850 ?AUTO_5848 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5849 ?AUTO_5850 ?AUTO_5848 )
      ( DELIVER-PKG ?AUTO_5847 ?AUTO_5848 )
      ( DELIVER-PKG-VERIFY ?AUTO_5847 ?AUTO_5848 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5891 - OBJ
      ?AUTO_5892 - LOCATION
    )
    :vars
    (
      ?AUTO_5894 - LOCATION
      ?AUTO_5893 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5894 ) ( AIRPORT ?AUTO_5892 ) ( AIRPLANE-AT ?AUTO_5893 ?AUTO_5894 ) ( not ( = ?AUTO_5894 ?AUTO_5892 ) ) ( OBJ-AT ?AUTO_5891 ?AUTO_5894 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5891 ?AUTO_5893 ?AUTO_5894 )
      ( DELIVER-PKG ?AUTO_5891 ?AUTO_5892 )
      ( DELIVER-PKG-VERIFY ?AUTO_5891 ?AUTO_5892 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5895 - OBJ
      ?AUTO_5896 - LOCATION
    )
    :vars
    (
      ?AUTO_5897 - LOCATION
      ?AUTO_5899 - LOCATION
      ?AUTO_5898 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5897 ) ( AIRPORT ?AUTO_5896 ) ( not ( = ?AUTO_5897 ?AUTO_5896 ) ) ( OBJ-AT ?AUTO_5895 ?AUTO_5897 ) ( AIRPORT ?AUTO_5899 ) ( AIRPLANE-AT ?AUTO_5898 ?AUTO_5899 ) ( not ( = ?AUTO_5899 ?AUTO_5897 ) ) ( not ( = ?AUTO_5896 ?AUTO_5899 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5898 ?AUTO_5899 ?AUTO_5897 )
      ( DELIVER-PKG ?AUTO_5895 ?AUTO_5896 )
      ( DELIVER-PKG-VERIFY ?AUTO_5895 ?AUTO_5896 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5924 - OBJ
      ?AUTO_5925 - LOCATION
    )
    :vars
    (
      ?AUTO_5926 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5924 ?AUTO_5926 ) ( AIRPLANE-AT ?AUTO_5926 ?AUTO_5925 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5924 ?AUTO_5926 ?AUTO_5925 )
      ( DELIVER-PKG-VERIFY ?AUTO_5924 ?AUTO_5925 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5935 - OBJ
      ?AUTO_5936 - LOCATION
    )
    :vars
    (
      ?AUTO_5937 - LOCATION
      ?AUTO_5938 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5937 ) ( AIRPORT ?AUTO_5936 ) ( AIRPLANE-AT ?AUTO_5938 ?AUTO_5937 ) ( not ( = ?AUTO_5937 ?AUTO_5936 ) ) ( OBJ-AT ?AUTO_5935 ?AUTO_5937 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5935 ?AUTO_5938 ?AUTO_5937 )
      ( DELIVER-PKG ?AUTO_5935 ?AUTO_5936 )
      ( DELIVER-PKG-VERIFY ?AUTO_5935 ?AUTO_5936 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5939 - OBJ
      ?AUTO_5940 - LOCATION
    )
    :vars
    (
      ?AUTO_5941 - LOCATION
      ?AUTO_5943 - LOCATION
      ?AUTO_5942 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5941 ) ( AIRPORT ?AUTO_5940 ) ( not ( = ?AUTO_5941 ?AUTO_5940 ) ) ( OBJ-AT ?AUTO_5939 ?AUTO_5941 ) ( AIRPORT ?AUTO_5943 ) ( AIRPLANE-AT ?AUTO_5942 ?AUTO_5943 ) ( not ( = ?AUTO_5943 ?AUTO_5941 ) ) ( not ( = ?AUTO_5940 ?AUTO_5943 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5942 ?AUTO_5943 ?AUTO_5941 )
      ( DELIVER-PKG ?AUTO_5939 ?AUTO_5940 )
      ( DELIVER-PKG-VERIFY ?AUTO_5939 ?AUTO_5940 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5988 - OBJ
      ?AUTO_5989 - LOCATION
    )
    :vars
    (
      ?AUTO_5992 - LOCATION
      ?AUTO_5990 - LOCATION
      ?AUTO_5991 - AIRPLANE
      ?AUTO_5993 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5992 ) ( AIRPORT ?AUTO_5989 ) ( not ( = ?AUTO_5992 ?AUTO_5989 ) ) ( AIRPORT ?AUTO_5990 ) ( AIRPLANE-AT ?AUTO_5991 ?AUTO_5990 ) ( not ( = ?AUTO_5990 ?AUTO_5992 ) ) ( not ( = ?AUTO_5989 ?AUTO_5990 ) ) ( TRUCK-AT ?AUTO_5993 ?AUTO_5992 ) ( IN-TRUCK ?AUTO_5988 ?AUTO_5993 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5988 ?AUTO_5993 ?AUTO_5992 )
      ( DELIVER-PKG ?AUTO_5988 ?AUTO_5989 )
      ( DELIVER-PKG-VERIFY ?AUTO_5988 ?AUTO_5989 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5998 - OBJ
      ?AUTO_5999 - LOCATION
    )
    :vars
    (
      ?AUTO_6002 - LOCATION
      ?AUTO_6001 - LOCATION
      ?AUTO_6000 - AIRPLANE
      ?AUTO_6003 - TRUCK
      ?AUTO_6004 - LOCATION
      ?AUTO_6005 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6002 ) ( AIRPORT ?AUTO_5999 ) ( not ( = ?AUTO_6002 ?AUTO_5999 ) ) ( AIRPORT ?AUTO_6001 ) ( AIRPLANE-AT ?AUTO_6000 ?AUTO_6001 ) ( not ( = ?AUTO_6001 ?AUTO_6002 ) ) ( not ( = ?AUTO_5999 ?AUTO_6001 ) ) ( IN-TRUCK ?AUTO_5998 ?AUTO_6003 ) ( TRUCK-AT ?AUTO_6003 ?AUTO_6004 ) ( IN-CITY ?AUTO_6004 ?AUTO_6005 ) ( IN-CITY ?AUTO_6002 ?AUTO_6005 ) ( not ( = ?AUTO_6002 ?AUTO_6004 ) ) ( not ( = ?AUTO_5999 ?AUTO_6004 ) ) ( not ( = ?AUTO_6001 ?AUTO_6004 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6003 ?AUTO_6004 ?AUTO_6002 ?AUTO_6005 )
      ( DELIVER-PKG ?AUTO_5998 ?AUTO_5999 )
      ( DELIVER-PKG-VERIFY ?AUTO_5998 ?AUTO_5999 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6010 - OBJ
      ?AUTO_6011 - LOCATION
    )
    :vars
    (
      ?AUTO_6016 - LOCATION
      ?AUTO_6017 - LOCATION
      ?AUTO_6013 - AIRPLANE
      ?AUTO_6015 - TRUCK
      ?AUTO_6012 - LOCATION
      ?AUTO_6014 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6016 ) ( AIRPORT ?AUTO_6011 ) ( not ( = ?AUTO_6016 ?AUTO_6011 ) ) ( AIRPORT ?AUTO_6017 ) ( AIRPLANE-AT ?AUTO_6013 ?AUTO_6017 ) ( not ( = ?AUTO_6017 ?AUTO_6016 ) ) ( not ( = ?AUTO_6011 ?AUTO_6017 ) ) ( TRUCK-AT ?AUTO_6015 ?AUTO_6012 ) ( IN-CITY ?AUTO_6012 ?AUTO_6014 ) ( IN-CITY ?AUTO_6016 ?AUTO_6014 ) ( not ( = ?AUTO_6016 ?AUTO_6012 ) ) ( not ( = ?AUTO_6011 ?AUTO_6012 ) ) ( not ( = ?AUTO_6017 ?AUTO_6012 ) ) ( OBJ-AT ?AUTO_6010 ?AUTO_6012 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6010 ?AUTO_6015 ?AUTO_6012 )
      ( DELIVER-PKG ?AUTO_6010 ?AUTO_6011 )
      ( DELIVER-PKG-VERIFY ?AUTO_6010 ?AUTO_6011 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6020 - OBJ
      ?AUTO_6021 - LOCATION
    )
    :vars
    (
      ?AUTO_6022 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6020 ?AUTO_6022 ) ( AIRPLANE-AT ?AUTO_6022 ?AUTO_6021 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6020 ?AUTO_6022 ?AUTO_6021 )
      ( DELIVER-PKG-VERIFY ?AUTO_6020 ?AUTO_6021 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6051 - OBJ
      ?AUTO_6052 - LOCATION
    )
    :vars
    (
      ?AUTO_6053 - LOCATION
      ?AUTO_6054 - AIRPLANE
      ?AUTO_6055 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6053 ) ( AIRPORT ?AUTO_6052 ) ( AIRPLANE-AT ?AUTO_6054 ?AUTO_6053 ) ( not ( = ?AUTO_6053 ?AUTO_6052 ) ) ( TRUCK-AT ?AUTO_6055 ?AUTO_6053 ) ( IN-TRUCK ?AUTO_6051 ?AUTO_6055 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6051 ?AUTO_6055 ?AUTO_6053 )
      ( DELIVER-PKG ?AUTO_6051 ?AUTO_6052 )
      ( DELIVER-PKG-VERIFY ?AUTO_6051 ?AUTO_6052 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6056 - OBJ
      ?AUTO_6057 - LOCATION
    )
    :vars
    (
      ?AUTO_6058 - LOCATION
      ?AUTO_6059 - AIRPLANE
      ?AUTO_6060 - TRUCK
      ?AUTO_6061 - LOCATION
      ?AUTO_6062 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6058 ) ( AIRPORT ?AUTO_6057 ) ( AIRPLANE-AT ?AUTO_6059 ?AUTO_6058 ) ( not ( = ?AUTO_6058 ?AUTO_6057 ) ) ( IN-TRUCK ?AUTO_6056 ?AUTO_6060 ) ( TRUCK-AT ?AUTO_6060 ?AUTO_6061 ) ( IN-CITY ?AUTO_6061 ?AUTO_6062 ) ( IN-CITY ?AUTO_6058 ?AUTO_6062 ) ( not ( = ?AUTO_6058 ?AUTO_6061 ) ) ( not ( = ?AUTO_6057 ?AUTO_6061 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6060 ?AUTO_6061 ?AUTO_6058 ?AUTO_6062 )
      ( DELIVER-PKG ?AUTO_6056 ?AUTO_6057 )
      ( DELIVER-PKG-VERIFY ?AUTO_6056 ?AUTO_6057 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6065 - OBJ
      ?AUTO_6066 - LOCATION
    )
    :vars
    (
      ?AUTO_6071 - LOCATION
      ?AUTO_6070 - AIRPLANE
      ?AUTO_6069 - TRUCK
      ?AUTO_6067 - LOCATION
      ?AUTO_6068 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6071 ) ( AIRPORT ?AUTO_6066 ) ( AIRPLANE-AT ?AUTO_6070 ?AUTO_6071 ) ( not ( = ?AUTO_6071 ?AUTO_6066 ) ) ( TRUCK-AT ?AUTO_6069 ?AUTO_6067 ) ( IN-CITY ?AUTO_6067 ?AUTO_6068 ) ( IN-CITY ?AUTO_6071 ?AUTO_6068 ) ( not ( = ?AUTO_6071 ?AUTO_6067 ) ) ( not ( = ?AUTO_6066 ?AUTO_6067 ) ) ( OBJ-AT ?AUTO_6065 ?AUTO_6067 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6065 ?AUTO_6069 ?AUTO_6067 )
      ( DELIVER-PKG ?AUTO_6065 ?AUTO_6066 )
      ( DELIVER-PKG-VERIFY ?AUTO_6065 ?AUTO_6066 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6072 - OBJ
      ?AUTO_6073 - LOCATION
    )
    :vars
    (
      ?AUTO_6076 - LOCATION
      ?AUTO_6075 - AIRPLANE
      ?AUTO_6077 - LOCATION
      ?AUTO_6078 - CITY
      ?AUTO_6074 - TRUCK
      ?AUTO_6079 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6076 ) ( AIRPORT ?AUTO_6073 ) ( AIRPLANE-AT ?AUTO_6075 ?AUTO_6076 ) ( not ( = ?AUTO_6076 ?AUTO_6073 ) ) ( IN-CITY ?AUTO_6077 ?AUTO_6078 ) ( IN-CITY ?AUTO_6076 ?AUTO_6078 ) ( not ( = ?AUTO_6076 ?AUTO_6077 ) ) ( not ( = ?AUTO_6073 ?AUTO_6077 ) ) ( OBJ-AT ?AUTO_6072 ?AUTO_6077 ) ( TRUCK-AT ?AUTO_6074 ?AUTO_6079 ) ( IN-CITY ?AUTO_6079 ?AUTO_6078 ) ( not ( = ?AUTO_6077 ?AUTO_6079 ) ) ( not ( = ?AUTO_6073 ?AUTO_6079 ) ) ( not ( = ?AUTO_6076 ?AUTO_6079 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6074 ?AUTO_6079 ?AUTO_6077 ?AUTO_6078 )
      ( DELIVER-PKG ?AUTO_6072 ?AUTO_6073 )
      ( DELIVER-PKG-VERIFY ?AUTO_6072 ?AUTO_6073 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6080 - OBJ
      ?AUTO_6081 - LOCATION
    )
    :vars
    (
      ?AUTO_6085 - LOCATION
      ?AUTO_6086 - LOCATION
      ?AUTO_6087 - CITY
      ?AUTO_6082 - TRUCK
      ?AUTO_6084 - LOCATION
      ?AUTO_6088 - LOCATION
      ?AUTO_6083 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6085 ) ( AIRPORT ?AUTO_6081 ) ( not ( = ?AUTO_6085 ?AUTO_6081 ) ) ( IN-CITY ?AUTO_6086 ?AUTO_6087 ) ( IN-CITY ?AUTO_6085 ?AUTO_6087 ) ( not ( = ?AUTO_6085 ?AUTO_6086 ) ) ( not ( = ?AUTO_6081 ?AUTO_6086 ) ) ( OBJ-AT ?AUTO_6080 ?AUTO_6086 ) ( TRUCK-AT ?AUTO_6082 ?AUTO_6084 ) ( IN-CITY ?AUTO_6084 ?AUTO_6087 ) ( not ( = ?AUTO_6086 ?AUTO_6084 ) ) ( not ( = ?AUTO_6081 ?AUTO_6084 ) ) ( not ( = ?AUTO_6085 ?AUTO_6084 ) ) ( AIRPORT ?AUTO_6088 ) ( AIRPLANE-AT ?AUTO_6083 ?AUTO_6088 ) ( not ( = ?AUTO_6088 ?AUTO_6085 ) ) ( not ( = ?AUTO_6081 ?AUTO_6088 ) ) ( not ( = ?AUTO_6086 ?AUTO_6088 ) ) ( not ( = ?AUTO_6084 ?AUTO_6088 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6083 ?AUTO_6088 ?AUTO_6085 )
      ( DELIVER-PKG ?AUTO_6080 ?AUTO_6081 )
      ( DELIVER-PKG-VERIFY ?AUTO_6080 ?AUTO_6081 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6123 - OBJ
      ?AUTO_6124 - LOCATION
    )
    :vars
    (
      ?AUTO_6125 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6123 ?AUTO_6125 ) ( AIRPLANE-AT ?AUTO_6125 ?AUTO_6124 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6123 ?AUTO_6125 ?AUTO_6124 )
      ( DELIVER-PKG-VERIFY ?AUTO_6123 ?AUTO_6124 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6176 - OBJ
      ?AUTO_6177 - LOCATION
    )
    :vars
    (
      ?AUTO_6178 - LOCATION
      ?AUTO_6179 - LOCATION
      ?AUTO_6180 - AIRPLANE
      ?AUTO_6181 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6178 ) ( AIRPORT ?AUTO_6177 ) ( not ( = ?AUTO_6178 ?AUTO_6177 ) ) ( AIRPORT ?AUTO_6179 ) ( AIRPLANE-AT ?AUTO_6180 ?AUTO_6179 ) ( not ( = ?AUTO_6179 ?AUTO_6178 ) ) ( not ( = ?AUTO_6177 ?AUTO_6179 ) ) ( TRUCK-AT ?AUTO_6181 ?AUTO_6178 ) ( IN-TRUCK ?AUTO_6176 ?AUTO_6181 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6176 ?AUTO_6181 ?AUTO_6178 )
      ( DELIVER-PKG ?AUTO_6176 ?AUTO_6177 )
      ( DELIVER-PKG-VERIFY ?AUTO_6176 ?AUTO_6177 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6188 - OBJ
      ?AUTO_6189 - LOCATION
    )
    :vars
    (
      ?AUTO_6192 - LOCATION
      ?AUTO_6190 - LOCATION
      ?AUTO_6191 - AIRPLANE
      ?AUTO_6193 - TRUCK
      ?AUTO_6194 - LOCATION
      ?AUTO_6195 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6192 ) ( AIRPORT ?AUTO_6189 ) ( not ( = ?AUTO_6192 ?AUTO_6189 ) ) ( AIRPORT ?AUTO_6190 ) ( AIRPLANE-AT ?AUTO_6191 ?AUTO_6190 ) ( not ( = ?AUTO_6190 ?AUTO_6192 ) ) ( not ( = ?AUTO_6189 ?AUTO_6190 ) ) ( IN-TRUCK ?AUTO_6188 ?AUTO_6193 ) ( TRUCK-AT ?AUTO_6193 ?AUTO_6194 ) ( IN-CITY ?AUTO_6194 ?AUTO_6195 ) ( IN-CITY ?AUTO_6192 ?AUTO_6195 ) ( not ( = ?AUTO_6192 ?AUTO_6194 ) ) ( not ( = ?AUTO_6189 ?AUTO_6194 ) ) ( not ( = ?AUTO_6190 ?AUTO_6194 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6193 ?AUTO_6194 ?AUTO_6192 ?AUTO_6195 )
      ( DELIVER-PKG ?AUTO_6188 ?AUTO_6189 )
      ( DELIVER-PKG-VERIFY ?AUTO_6188 ?AUTO_6189 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6196 - OBJ
      ?AUTO_6197 - LOCATION
    )
    :vars
    (
      ?AUTO_6199 - LOCATION
      ?AUTO_6201 - LOCATION
      ?AUTO_6200 - AIRPLANE
      ?AUTO_6198 - TRUCK
      ?AUTO_6203 - LOCATION
      ?AUTO_6202 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6199 ) ( AIRPORT ?AUTO_6197 ) ( not ( = ?AUTO_6199 ?AUTO_6197 ) ) ( AIRPORT ?AUTO_6201 ) ( AIRPLANE-AT ?AUTO_6200 ?AUTO_6201 ) ( not ( = ?AUTO_6201 ?AUTO_6199 ) ) ( not ( = ?AUTO_6197 ?AUTO_6201 ) ) ( TRUCK-AT ?AUTO_6198 ?AUTO_6203 ) ( IN-CITY ?AUTO_6203 ?AUTO_6202 ) ( IN-CITY ?AUTO_6199 ?AUTO_6202 ) ( not ( = ?AUTO_6199 ?AUTO_6203 ) ) ( not ( = ?AUTO_6197 ?AUTO_6203 ) ) ( not ( = ?AUTO_6201 ?AUTO_6203 ) ) ( OBJ-AT ?AUTO_6196 ?AUTO_6203 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6196 ?AUTO_6198 ?AUTO_6203 )
      ( DELIVER-PKG ?AUTO_6196 ?AUTO_6197 )
      ( DELIVER-PKG-VERIFY ?AUTO_6196 ?AUTO_6197 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6222 - OBJ
      ?AUTO_6223 - LOCATION
    )
    :vars
    (
      ?AUTO_6224 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6222 ?AUTO_6224 ) ( AIRPLANE-AT ?AUTO_6224 ?AUTO_6223 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6222 ?AUTO_6224 ?AUTO_6223 )
      ( DELIVER-PKG-VERIFY ?AUTO_6222 ?AUTO_6223 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6225 - OBJ
      ?AUTO_6226 - LOCATION
    )
    :vars
    (
      ?AUTO_6227 - AIRPLANE
      ?AUTO_6228 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6225 ?AUTO_6227 ) ( AIRPORT ?AUTO_6228 ) ( AIRPORT ?AUTO_6226 ) ( AIRPLANE-AT ?AUTO_6227 ?AUTO_6228 ) ( not ( = ?AUTO_6228 ?AUTO_6226 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6227 ?AUTO_6228 ?AUTO_6226 )
      ( DELIVER-PKG ?AUTO_6225 ?AUTO_6226 )
      ( DELIVER-PKG-VERIFY ?AUTO_6225 ?AUTO_6226 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6245 - OBJ
      ?AUTO_6246 - LOCATION
    )
    :vars
    (
      ?AUTO_6247 - LOCATION
      ?AUTO_6248 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6247 ) ( AIRPORT ?AUTO_6246 ) ( AIRPLANE-AT ?AUTO_6248 ?AUTO_6247 ) ( not ( = ?AUTO_6247 ?AUTO_6246 ) ) ( OBJ-AT ?AUTO_6245 ?AUTO_6247 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6245 ?AUTO_6248 ?AUTO_6247 )
      ( DELIVER-PKG ?AUTO_6245 ?AUTO_6246 )
      ( DELIVER-PKG-VERIFY ?AUTO_6245 ?AUTO_6246 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6251 - OBJ
      ?AUTO_6252 - LOCATION
    )
    :vars
    (
      ?AUTO_6254 - LOCATION
      ?AUTO_6253 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6254 ) ( AIRPORT ?AUTO_6252 ) ( not ( = ?AUTO_6254 ?AUTO_6252 ) ) ( OBJ-AT ?AUTO_6251 ?AUTO_6254 ) ( AIRPLANE-AT ?AUTO_6253 ?AUTO_6252 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6253 ?AUTO_6252 ?AUTO_6254 )
      ( DELIVER-PKG ?AUTO_6251 ?AUTO_6252 )
      ( DELIVER-PKG-VERIFY ?AUTO_6251 ?AUTO_6252 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6315 - OBJ
      ?AUTO_6316 - LOCATION
    )
    :vars
    (
      ?AUTO_6317 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6315 ?AUTO_6317 ) ( AIRPLANE-AT ?AUTO_6317 ?AUTO_6316 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6315 ?AUTO_6317 ?AUTO_6316 )
      ( DELIVER-PKG-VERIFY ?AUTO_6315 ?AUTO_6316 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6322 - OBJ
      ?AUTO_6323 - LOCATION
    )
    :vars
    (
      ?AUTO_6324 - AIRPLANE
      ?AUTO_6325 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_6322 ?AUTO_6324 ) ( AIRPORT ?AUTO_6325 ) ( AIRPORT ?AUTO_6323 ) ( AIRPLANE-AT ?AUTO_6324 ?AUTO_6325 ) ( not ( = ?AUTO_6325 ?AUTO_6323 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6324 ?AUTO_6325 ?AUTO_6323 )
      ( DELIVER-PKG ?AUTO_6322 ?AUTO_6323 )
      ( DELIVER-PKG-VERIFY ?AUTO_6322 ?AUTO_6323 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6362 - OBJ
      ?AUTO_6363 - LOCATION
    )
    :vars
    (
      ?AUTO_6365 - LOCATION
      ?AUTO_6364 - AIRPLANE
      ?AUTO_6366 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6365 ) ( AIRPORT ?AUTO_6363 ) ( AIRPLANE-AT ?AUTO_6364 ?AUTO_6365 ) ( not ( = ?AUTO_6365 ?AUTO_6363 ) ) ( TRUCK-AT ?AUTO_6366 ?AUTO_6365 ) ( IN-TRUCK ?AUTO_6362 ?AUTO_6366 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6362 ?AUTO_6366 ?AUTO_6365 )
      ( DELIVER-PKG ?AUTO_6362 ?AUTO_6363 )
      ( DELIVER-PKG-VERIFY ?AUTO_6362 ?AUTO_6363 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6373 - OBJ
      ?AUTO_6374 - LOCATION
    )
    :vars
    (
      ?AUTO_6379 - LOCATION
      ?AUTO_6377 - AIRPLANE
      ?AUTO_6376 - TRUCK
      ?AUTO_6378 - LOCATION
      ?AUTO_6375 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6379 ) ( AIRPORT ?AUTO_6374 ) ( AIRPLANE-AT ?AUTO_6377 ?AUTO_6379 ) ( not ( = ?AUTO_6379 ?AUTO_6374 ) ) ( TRUCK-AT ?AUTO_6376 ?AUTO_6378 ) ( IN-CITY ?AUTO_6378 ?AUTO_6375 ) ( IN-CITY ?AUTO_6379 ?AUTO_6375 ) ( not ( = ?AUTO_6379 ?AUTO_6378 ) ) ( not ( = ?AUTO_6374 ?AUTO_6378 ) ) ( OBJ-AT ?AUTO_6373 ?AUTO_6378 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6373 ?AUTO_6376 ?AUTO_6378 )
      ( DELIVER-PKG ?AUTO_6373 ?AUTO_6374 )
      ( DELIVER-PKG-VERIFY ?AUTO_6373 ?AUTO_6374 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6420 - OBJ
      ?AUTO_6421 - LOCATION
    )
    :vars
    (
      ?AUTO_6422 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6422 ?AUTO_6421 ) ( IN-TRUCK ?AUTO_6420 ?AUTO_6422 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6420 ?AUTO_6422 ?AUTO_6421 )
      ( DELIVER-PKG-VERIFY ?AUTO_6420 ?AUTO_6421 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6437 - OBJ
      ?AUTO_6438 - LOCATION
    )
    :vars
    (
      ?AUTO_6439 - TRUCK
      ?AUTO_6440 - LOCATION
      ?AUTO_6441 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6437 ?AUTO_6439 ) ( TRUCK-AT ?AUTO_6439 ?AUTO_6440 ) ( IN-CITY ?AUTO_6440 ?AUTO_6441 ) ( IN-CITY ?AUTO_6438 ?AUTO_6441 ) ( not ( = ?AUTO_6438 ?AUTO_6440 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6439 ?AUTO_6440 ?AUTO_6438 ?AUTO_6441 )
      ( DELIVER-PKG ?AUTO_6437 ?AUTO_6438 )
      ( DELIVER-PKG-VERIFY ?AUTO_6437 ?AUTO_6438 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6442 - OBJ
      ?AUTO_6443 - LOCATION
    )
    :vars
    (
      ?AUTO_6444 - TRUCK
      ?AUTO_6445 - LOCATION
      ?AUTO_6446 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6444 ?AUTO_6445 ) ( IN-CITY ?AUTO_6445 ?AUTO_6446 ) ( IN-CITY ?AUTO_6443 ?AUTO_6446 ) ( not ( = ?AUTO_6443 ?AUTO_6445 ) ) ( OBJ-AT ?AUTO_6442 ?AUTO_6445 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6442 ?AUTO_6444 ?AUTO_6445 )
      ( DELIVER-PKG ?AUTO_6442 ?AUTO_6443 )
      ( DELIVER-PKG-VERIFY ?AUTO_6442 ?AUTO_6443 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6455 - OBJ
      ?AUTO_6456 - LOCATION
    )
    :vars
    (
      ?AUTO_6459 - TRUCK
      ?AUTO_6458 - LOCATION
      ?AUTO_6457 - CITY
      ?AUTO_6460 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6459 ?AUTO_6458 ) ( IN-CITY ?AUTO_6458 ?AUTO_6457 ) ( IN-CITY ?AUTO_6456 ?AUTO_6457 ) ( not ( = ?AUTO_6456 ?AUTO_6458 ) ) ( IN-AIRPLANE ?AUTO_6455 ?AUTO_6460 ) ( AIRPLANE-AT ?AUTO_6460 ?AUTO_6458 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6455 ?AUTO_6460 ?AUTO_6458 )
      ( DELIVER-PKG ?AUTO_6455 ?AUTO_6456 )
      ( DELIVER-PKG-VERIFY ?AUTO_6455 ?AUTO_6456 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6465 - OBJ
      ?AUTO_6466 - LOCATION
    )
    :vars
    (
      ?AUTO_6470 - TRUCK
      ?AUTO_6468 - LOCATION
      ?AUTO_6469 - CITY
      ?AUTO_6467 - AIRPLANE
      ?AUTO_6471 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6470 ?AUTO_6468 ) ( IN-CITY ?AUTO_6468 ?AUTO_6469 ) ( IN-CITY ?AUTO_6466 ?AUTO_6469 ) ( not ( = ?AUTO_6466 ?AUTO_6468 ) ) ( IN-AIRPLANE ?AUTO_6465 ?AUTO_6467 ) ( AIRPORT ?AUTO_6471 ) ( AIRPORT ?AUTO_6468 ) ( AIRPLANE-AT ?AUTO_6467 ?AUTO_6471 ) ( not ( = ?AUTO_6471 ?AUTO_6468 ) ) ( not ( = ?AUTO_6466 ?AUTO_6471 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6467 ?AUTO_6471 ?AUTO_6468 )
      ( DELIVER-PKG ?AUTO_6465 ?AUTO_6466 )
      ( DELIVER-PKG-VERIFY ?AUTO_6465 ?AUTO_6466 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6508 - OBJ
      ?AUTO_6509 - LOCATION
    )
    :vars
    (
      ?AUTO_6510 - TRUCK
      ?AUTO_6511 - LOCATION
      ?AUTO_6514 - CITY
      ?AUTO_6513 - LOCATION
      ?AUTO_6512 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6510 ?AUTO_6511 ) ( IN-CITY ?AUTO_6511 ?AUTO_6514 ) ( IN-CITY ?AUTO_6509 ?AUTO_6514 ) ( not ( = ?AUTO_6509 ?AUTO_6511 ) ) ( AIRPORT ?AUTO_6513 ) ( AIRPORT ?AUTO_6511 ) ( AIRPLANE-AT ?AUTO_6512 ?AUTO_6513 ) ( not ( = ?AUTO_6513 ?AUTO_6511 ) ) ( not ( = ?AUTO_6509 ?AUTO_6513 ) ) ( OBJ-AT ?AUTO_6508 ?AUTO_6513 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6508 ?AUTO_6512 ?AUTO_6513 )
      ( DELIVER-PKG ?AUTO_6508 ?AUTO_6509 )
      ( DELIVER-PKG-VERIFY ?AUTO_6508 ?AUTO_6509 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6523 - OBJ
      ?AUTO_6524 - LOCATION
    )
    :vars
    (
      ?AUTO_6527 - TRUCK
      ?AUTO_6526 - LOCATION
      ?AUTO_6529 - CITY
      ?AUTO_6528 - LOCATION
      ?AUTO_6530 - LOCATION
      ?AUTO_6525 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6527 ?AUTO_6526 ) ( IN-CITY ?AUTO_6526 ?AUTO_6529 ) ( IN-CITY ?AUTO_6524 ?AUTO_6529 ) ( not ( = ?AUTO_6524 ?AUTO_6526 ) ) ( AIRPORT ?AUTO_6528 ) ( AIRPORT ?AUTO_6526 ) ( not ( = ?AUTO_6528 ?AUTO_6526 ) ) ( not ( = ?AUTO_6524 ?AUTO_6528 ) ) ( OBJ-AT ?AUTO_6523 ?AUTO_6528 ) ( AIRPORT ?AUTO_6530 ) ( AIRPLANE-AT ?AUTO_6525 ?AUTO_6530 ) ( not ( = ?AUTO_6530 ?AUTO_6528 ) ) ( not ( = ?AUTO_6524 ?AUTO_6530 ) ) ( not ( = ?AUTO_6526 ?AUTO_6530 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6525 ?AUTO_6530 ?AUTO_6528 )
      ( DELIVER-PKG ?AUTO_6523 ?AUTO_6524 )
      ( DELIVER-PKG-VERIFY ?AUTO_6523 ?AUTO_6524 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6533 - OBJ
      ?AUTO_6534 - LOCATION
    )
    :vars
    (
      ?AUTO_6536 - LOCATION
      ?AUTO_6540 - CITY
      ?AUTO_6539 - LOCATION
      ?AUTO_6537 - LOCATION
      ?AUTO_6535 - AIRPLANE
      ?AUTO_6538 - TRUCK
      ?AUTO_6541 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6536 ?AUTO_6540 ) ( IN-CITY ?AUTO_6534 ?AUTO_6540 ) ( not ( = ?AUTO_6534 ?AUTO_6536 ) ) ( AIRPORT ?AUTO_6539 ) ( AIRPORT ?AUTO_6536 ) ( not ( = ?AUTO_6539 ?AUTO_6536 ) ) ( not ( = ?AUTO_6534 ?AUTO_6539 ) ) ( OBJ-AT ?AUTO_6533 ?AUTO_6539 ) ( AIRPORT ?AUTO_6537 ) ( AIRPLANE-AT ?AUTO_6535 ?AUTO_6537 ) ( not ( = ?AUTO_6537 ?AUTO_6539 ) ) ( not ( = ?AUTO_6534 ?AUTO_6537 ) ) ( not ( = ?AUTO_6536 ?AUTO_6537 ) ) ( TRUCK-AT ?AUTO_6538 ?AUTO_6541 ) ( IN-CITY ?AUTO_6541 ?AUTO_6540 ) ( not ( = ?AUTO_6536 ?AUTO_6541 ) ) ( not ( = ?AUTO_6534 ?AUTO_6541 ) ) ( not ( = ?AUTO_6539 ?AUTO_6541 ) ) ( not ( = ?AUTO_6537 ?AUTO_6541 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6538 ?AUTO_6541 ?AUTO_6536 ?AUTO_6540 )
      ( DELIVER-PKG ?AUTO_6533 ?AUTO_6534 )
      ( DELIVER-PKG-VERIFY ?AUTO_6533 ?AUTO_6534 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6550 - OBJ
      ?AUTO_6551 - LOCATION
    )
    :vars
    (
      ?AUTO_6552 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6552 ?AUTO_6551 ) ( IN-TRUCK ?AUTO_6550 ?AUTO_6552 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6550 ?AUTO_6552 ?AUTO_6551 )
      ( DELIVER-PKG-VERIFY ?AUTO_6550 ?AUTO_6551 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6557 - OBJ
      ?AUTO_6558 - LOCATION
    )
    :vars
    (
      ?AUTO_6559 - TRUCK
      ?AUTO_6560 - LOCATION
      ?AUTO_6561 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6557 ?AUTO_6559 ) ( TRUCK-AT ?AUTO_6559 ?AUTO_6560 ) ( IN-CITY ?AUTO_6560 ?AUTO_6561 ) ( IN-CITY ?AUTO_6558 ?AUTO_6561 ) ( not ( = ?AUTO_6558 ?AUTO_6560 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6559 ?AUTO_6560 ?AUTO_6558 ?AUTO_6561 )
      ( DELIVER-PKG ?AUTO_6557 ?AUTO_6558 )
      ( DELIVER-PKG-VERIFY ?AUTO_6557 ?AUTO_6558 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6562 - OBJ
      ?AUTO_6563 - LOCATION
    )
    :vars
    (
      ?AUTO_6564 - TRUCK
      ?AUTO_6565 - LOCATION
      ?AUTO_6566 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6564 ?AUTO_6565 ) ( IN-CITY ?AUTO_6565 ?AUTO_6566 ) ( IN-CITY ?AUTO_6563 ?AUTO_6566 ) ( not ( = ?AUTO_6563 ?AUTO_6565 ) ) ( OBJ-AT ?AUTO_6562 ?AUTO_6565 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6562 ?AUTO_6564 ?AUTO_6565 )
      ( DELIVER-PKG ?AUTO_6562 ?AUTO_6563 )
      ( DELIVER-PKG-VERIFY ?AUTO_6562 ?AUTO_6563 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6569 - OBJ
      ?AUTO_6570 - LOCATION
    )
    :vars
    (
      ?AUTO_6571 - TRUCK
      ?AUTO_6572 - LOCATION
      ?AUTO_6573 - CITY
      ?AUTO_6574 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6571 ?AUTO_6572 ) ( IN-CITY ?AUTO_6572 ?AUTO_6573 ) ( IN-CITY ?AUTO_6570 ?AUTO_6573 ) ( not ( = ?AUTO_6570 ?AUTO_6572 ) ) ( IN-AIRPLANE ?AUTO_6569 ?AUTO_6574 ) ( AIRPLANE-AT ?AUTO_6574 ?AUTO_6572 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6569 ?AUTO_6574 ?AUTO_6572 )
      ( DELIVER-PKG ?AUTO_6569 ?AUTO_6570 )
      ( DELIVER-PKG-VERIFY ?AUTO_6569 ?AUTO_6570 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6575 - OBJ
      ?AUTO_6576 - LOCATION
    )
    :vars
    (
      ?AUTO_6578 - TRUCK
      ?AUTO_6577 - LOCATION
      ?AUTO_6579 - CITY
      ?AUTO_6580 - AIRPLANE
      ?AUTO_6581 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6578 ?AUTO_6577 ) ( IN-CITY ?AUTO_6577 ?AUTO_6579 ) ( IN-CITY ?AUTO_6576 ?AUTO_6579 ) ( not ( = ?AUTO_6576 ?AUTO_6577 ) ) ( IN-AIRPLANE ?AUTO_6575 ?AUTO_6580 ) ( AIRPORT ?AUTO_6581 ) ( AIRPORT ?AUTO_6577 ) ( AIRPLANE-AT ?AUTO_6580 ?AUTO_6581 ) ( not ( = ?AUTO_6581 ?AUTO_6577 ) ) ( not ( = ?AUTO_6576 ?AUTO_6581 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6580 ?AUTO_6581 ?AUTO_6577 )
      ( DELIVER-PKG ?AUTO_6575 ?AUTO_6576 )
      ( DELIVER-PKG-VERIFY ?AUTO_6575 ?AUTO_6576 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6598 - OBJ
      ?AUTO_6599 - LOCATION
    )
    :vars
    (
      ?AUTO_6602 - TRUCK
      ?AUTO_6604 - LOCATION
      ?AUTO_6601 - CITY
      ?AUTO_6600 - LOCATION
      ?AUTO_6603 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6602 ?AUTO_6604 ) ( IN-CITY ?AUTO_6604 ?AUTO_6601 ) ( IN-CITY ?AUTO_6599 ?AUTO_6601 ) ( not ( = ?AUTO_6599 ?AUTO_6604 ) ) ( AIRPORT ?AUTO_6600 ) ( AIRPORT ?AUTO_6604 ) ( AIRPLANE-AT ?AUTO_6603 ?AUTO_6600 ) ( not ( = ?AUTO_6600 ?AUTO_6604 ) ) ( not ( = ?AUTO_6599 ?AUTO_6600 ) ) ( OBJ-AT ?AUTO_6598 ?AUTO_6600 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6598 ?AUTO_6603 ?AUTO_6600 )
      ( DELIVER-PKG ?AUTO_6598 ?AUTO_6599 )
      ( DELIVER-PKG-VERIFY ?AUTO_6598 ?AUTO_6599 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6607 - OBJ
      ?AUTO_6608 - LOCATION
    )
    :vars
    (
      ?AUTO_6611 - TRUCK
      ?AUTO_6609 - LOCATION
      ?AUTO_6612 - CITY
      ?AUTO_6613 - LOCATION
      ?AUTO_6610 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6611 ?AUTO_6609 ) ( IN-CITY ?AUTO_6609 ?AUTO_6612 ) ( IN-CITY ?AUTO_6608 ?AUTO_6612 ) ( not ( = ?AUTO_6608 ?AUTO_6609 ) ) ( AIRPORT ?AUTO_6613 ) ( AIRPORT ?AUTO_6609 ) ( not ( = ?AUTO_6613 ?AUTO_6609 ) ) ( not ( = ?AUTO_6608 ?AUTO_6613 ) ) ( OBJ-AT ?AUTO_6607 ?AUTO_6613 ) ( AIRPLANE-AT ?AUTO_6610 ?AUTO_6609 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6610 ?AUTO_6609 ?AUTO_6613 )
      ( DELIVER-PKG ?AUTO_6607 ?AUTO_6608 )
      ( DELIVER-PKG-VERIFY ?AUTO_6607 ?AUTO_6608 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6630 - OBJ
      ?AUTO_6631 - LOCATION
    )
    :vars
    (
      ?AUTO_6633 - LOCATION
      ?AUTO_6632 - CITY
      ?AUTO_6635 - LOCATION
      ?AUTO_6634 - AIRPLANE
      ?AUTO_6636 - TRUCK
      ?AUTO_6637 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6633 ?AUTO_6632 ) ( IN-CITY ?AUTO_6631 ?AUTO_6632 ) ( not ( = ?AUTO_6631 ?AUTO_6633 ) ) ( AIRPORT ?AUTO_6635 ) ( AIRPORT ?AUTO_6633 ) ( not ( = ?AUTO_6635 ?AUTO_6633 ) ) ( not ( = ?AUTO_6631 ?AUTO_6635 ) ) ( OBJ-AT ?AUTO_6630 ?AUTO_6635 ) ( AIRPLANE-AT ?AUTO_6634 ?AUTO_6633 ) ( TRUCK-AT ?AUTO_6636 ?AUTO_6637 ) ( IN-CITY ?AUTO_6637 ?AUTO_6632 ) ( not ( = ?AUTO_6633 ?AUTO_6637 ) ) ( not ( = ?AUTO_6631 ?AUTO_6637 ) ) ( not ( = ?AUTO_6635 ?AUTO_6637 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6636 ?AUTO_6637 ?AUTO_6633 ?AUTO_6632 )
      ( DELIVER-PKG ?AUTO_6630 ?AUTO_6631 )
      ( DELIVER-PKG-VERIFY ?AUTO_6630 ?AUTO_6631 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6642 - OBJ
      ?AUTO_6643 - LOCATION
    )
    :vars
    (
      ?AUTO_6649 - LOCATION
      ?AUTO_6648 - CITY
      ?AUTO_6647 - LOCATION
      ?AUTO_6645 - AIRPLANE
      ?AUTO_6646 - LOCATION
      ?AUTO_6644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6649 ?AUTO_6648 ) ( IN-CITY ?AUTO_6643 ?AUTO_6648 ) ( not ( = ?AUTO_6643 ?AUTO_6649 ) ) ( AIRPORT ?AUTO_6647 ) ( AIRPORT ?AUTO_6649 ) ( not ( = ?AUTO_6647 ?AUTO_6649 ) ) ( not ( = ?AUTO_6643 ?AUTO_6647 ) ) ( OBJ-AT ?AUTO_6642 ?AUTO_6647 ) ( AIRPLANE-AT ?AUTO_6645 ?AUTO_6649 ) ( IN-CITY ?AUTO_6646 ?AUTO_6648 ) ( not ( = ?AUTO_6649 ?AUTO_6646 ) ) ( not ( = ?AUTO_6643 ?AUTO_6646 ) ) ( not ( = ?AUTO_6647 ?AUTO_6646 ) ) ( TRUCK-AT ?AUTO_6644 ?AUTO_6643 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6644 ?AUTO_6643 ?AUTO_6646 ?AUTO_6648 )
      ( DELIVER-PKG ?AUTO_6642 ?AUTO_6643 )
      ( DELIVER-PKG-VERIFY ?AUTO_6642 ?AUTO_6643 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6650 - OBJ
      ?AUTO_6651 - LOCATION
    )
    :vars
    (
      ?AUTO_6655 - LOCATION
      ?AUTO_6657 - CITY
      ?AUTO_6652 - LOCATION
      ?AUTO_6656 - LOCATION
      ?AUTO_6653 - TRUCK
      ?AUTO_6658 - LOCATION
      ?AUTO_6654 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6655 ?AUTO_6657 ) ( IN-CITY ?AUTO_6651 ?AUTO_6657 ) ( not ( = ?AUTO_6651 ?AUTO_6655 ) ) ( AIRPORT ?AUTO_6652 ) ( AIRPORT ?AUTO_6655 ) ( not ( = ?AUTO_6652 ?AUTO_6655 ) ) ( not ( = ?AUTO_6651 ?AUTO_6652 ) ) ( OBJ-AT ?AUTO_6650 ?AUTO_6652 ) ( IN-CITY ?AUTO_6656 ?AUTO_6657 ) ( not ( = ?AUTO_6655 ?AUTO_6656 ) ) ( not ( = ?AUTO_6651 ?AUTO_6656 ) ) ( not ( = ?AUTO_6652 ?AUTO_6656 ) ) ( TRUCK-AT ?AUTO_6653 ?AUTO_6651 ) ( AIRPORT ?AUTO_6658 ) ( AIRPLANE-AT ?AUTO_6654 ?AUTO_6658 ) ( not ( = ?AUTO_6658 ?AUTO_6655 ) ) ( not ( = ?AUTO_6651 ?AUTO_6658 ) ) ( not ( = ?AUTO_6652 ?AUTO_6658 ) ) ( not ( = ?AUTO_6656 ?AUTO_6658 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6654 ?AUTO_6658 ?AUTO_6655 )
      ( DELIVER-PKG ?AUTO_6650 ?AUTO_6651 )
      ( DELIVER-PKG-VERIFY ?AUTO_6650 ?AUTO_6651 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6675 - OBJ
      ?AUTO_6676 - LOCATION
    )
    :vars
    (
      ?AUTO_6680 - LOCATION
      ?AUTO_6682 - CITY
      ?AUTO_6681 - LOCATION
      ?AUTO_6678 - LOCATION
      ?AUTO_6683 - TRUCK
      ?AUTO_6677 - LOCATION
      ?AUTO_6679 - AIRPLANE
      ?AUTO_6684 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6680 ?AUTO_6682 ) ( IN-CITY ?AUTO_6676 ?AUTO_6682 ) ( not ( = ?AUTO_6676 ?AUTO_6680 ) ) ( AIRPORT ?AUTO_6681 ) ( AIRPORT ?AUTO_6680 ) ( not ( = ?AUTO_6681 ?AUTO_6680 ) ) ( not ( = ?AUTO_6676 ?AUTO_6681 ) ) ( IN-CITY ?AUTO_6678 ?AUTO_6682 ) ( not ( = ?AUTO_6680 ?AUTO_6678 ) ) ( not ( = ?AUTO_6676 ?AUTO_6678 ) ) ( not ( = ?AUTO_6681 ?AUTO_6678 ) ) ( TRUCK-AT ?AUTO_6683 ?AUTO_6676 ) ( AIRPORT ?AUTO_6677 ) ( AIRPLANE-AT ?AUTO_6679 ?AUTO_6677 ) ( not ( = ?AUTO_6677 ?AUTO_6680 ) ) ( not ( = ?AUTO_6676 ?AUTO_6677 ) ) ( not ( = ?AUTO_6681 ?AUTO_6677 ) ) ( not ( = ?AUTO_6678 ?AUTO_6677 ) ) ( TRUCK-AT ?AUTO_6684 ?AUTO_6681 ) ( IN-TRUCK ?AUTO_6675 ?AUTO_6684 ) ( not ( = ?AUTO_6683 ?AUTO_6684 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6675 ?AUTO_6684 ?AUTO_6681 )
      ( DELIVER-PKG ?AUTO_6675 ?AUTO_6676 )
      ( DELIVER-PKG-VERIFY ?AUTO_6675 ?AUTO_6676 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6691 - OBJ
      ?AUTO_6692 - LOCATION
    )
    :vars
    (
      ?AUTO_6700 - LOCATION
      ?AUTO_6699 - CITY
      ?AUTO_6698 - LOCATION
      ?AUTO_6697 - LOCATION
      ?AUTO_6695 - TRUCK
      ?AUTO_6693 - LOCATION
      ?AUTO_6694 - AIRPLANE
      ?AUTO_6696 - TRUCK
      ?AUTO_6701 - LOCATION
      ?AUTO_6702 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6700 ?AUTO_6699 ) ( IN-CITY ?AUTO_6692 ?AUTO_6699 ) ( not ( = ?AUTO_6692 ?AUTO_6700 ) ) ( AIRPORT ?AUTO_6698 ) ( AIRPORT ?AUTO_6700 ) ( not ( = ?AUTO_6698 ?AUTO_6700 ) ) ( not ( = ?AUTO_6692 ?AUTO_6698 ) ) ( IN-CITY ?AUTO_6697 ?AUTO_6699 ) ( not ( = ?AUTO_6700 ?AUTO_6697 ) ) ( not ( = ?AUTO_6692 ?AUTO_6697 ) ) ( not ( = ?AUTO_6698 ?AUTO_6697 ) ) ( TRUCK-AT ?AUTO_6695 ?AUTO_6692 ) ( AIRPORT ?AUTO_6693 ) ( AIRPLANE-AT ?AUTO_6694 ?AUTO_6693 ) ( not ( = ?AUTO_6693 ?AUTO_6700 ) ) ( not ( = ?AUTO_6692 ?AUTO_6693 ) ) ( not ( = ?AUTO_6698 ?AUTO_6693 ) ) ( not ( = ?AUTO_6697 ?AUTO_6693 ) ) ( IN-TRUCK ?AUTO_6691 ?AUTO_6696 ) ( not ( = ?AUTO_6695 ?AUTO_6696 ) ) ( TRUCK-AT ?AUTO_6696 ?AUTO_6701 ) ( IN-CITY ?AUTO_6701 ?AUTO_6702 ) ( IN-CITY ?AUTO_6698 ?AUTO_6702 ) ( not ( = ?AUTO_6698 ?AUTO_6701 ) ) ( not ( = ?AUTO_6692 ?AUTO_6701 ) ) ( not ( = ?AUTO_6700 ?AUTO_6701 ) ) ( not ( = ?AUTO_6699 ?AUTO_6702 ) ) ( not ( = ?AUTO_6697 ?AUTO_6701 ) ) ( not ( = ?AUTO_6693 ?AUTO_6701 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6696 ?AUTO_6701 ?AUTO_6698 ?AUTO_6702 )
      ( DELIVER-PKG ?AUTO_6691 ?AUTO_6692 )
      ( DELIVER-PKG-VERIFY ?AUTO_6691 ?AUTO_6692 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6703 - OBJ
      ?AUTO_6704 - LOCATION
    )
    :vars
    (
      ?AUTO_6708 - LOCATION
      ?AUTO_6711 - CITY
      ?AUTO_6707 - LOCATION
      ?AUTO_6705 - LOCATION
      ?AUTO_6709 - TRUCK
      ?AUTO_6706 - LOCATION
      ?AUTO_6710 - AIRPLANE
      ?AUTO_6712 - TRUCK
      ?AUTO_6714 - LOCATION
      ?AUTO_6713 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6708 ?AUTO_6711 ) ( IN-CITY ?AUTO_6704 ?AUTO_6711 ) ( not ( = ?AUTO_6704 ?AUTO_6708 ) ) ( AIRPORT ?AUTO_6707 ) ( AIRPORT ?AUTO_6708 ) ( not ( = ?AUTO_6707 ?AUTO_6708 ) ) ( not ( = ?AUTO_6704 ?AUTO_6707 ) ) ( IN-CITY ?AUTO_6705 ?AUTO_6711 ) ( not ( = ?AUTO_6708 ?AUTO_6705 ) ) ( not ( = ?AUTO_6704 ?AUTO_6705 ) ) ( not ( = ?AUTO_6707 ?AUTO_6705 ) ) ( TRUCK-AT ?AUTO_6709 ?AUTO_6704 ) ( AIRPORT ?AUTO_6706 ) ( AIRPLANE-AT ?AUTO_6710 ?AUTO_6706 ) ( not ( = ?AUTO_6706 ?AUTO_6708 ) ) ( not ( = ?AUTO_6704 ?AUTO_6706 ) ) ( not ( = ?AUTO_6707 ?AUTO_6706 ) ) ( not ( = ?AUTO_6705 ?AUTO_6706 ) ) ( not ( = ?AUTO_6709 ?AUTO_6712 ) ) ( TRUCK-AT ?AUTO_6712 ?AUTO_6714 ) ( IN-CITY ?AUTO_6714 ?AUTO_6713 ) ( IN-CITY ?AUTO_6707 ?AUTO_6713 ) ( not ( = ?AUTO_6707 ?AUTO_6714 ) ) ( not ( = ?AUTO_6704 ?AUTO_6714 ) ) ( not ( = ?AUTO_6708 ?AUTO_6714 ) ) ( not ( = ?AUTO_6711 ?AUTO_6713 ) ) ( not ( = ?AUTO_6705 ?AUTO_6714 ) ) ( not ( = ?AUTO_6706 ?AUTO_6714 ) ) ( OBJ-AT ?AUTO_6703 ?AUTO_6714 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6703 ?AUTO_6712 ?AUTO_6714 )
      ( DELIVER-PKG ?AUTO_6703 ?AUTO_6704 )
      ( DELIVER-PKG-VERIFY ?AUTO_6703 ?AUTO_6704 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6715 - OBJ
      ?AUTO_6716 - LOCATION
    )
    :vars
    (
      ?AUTO_6723 - LOCATION
      ?AUTO_6717 - CITY
      ?AUTO_6724 - LOCATION
      ?AUTO_6726 - LOCATION
      ?AUTO_6721 - TRUCK
      ?AUTO_6722 - LOCATION
      ?AUTO_6719 - AIRPLANE
      ?AUTO_6720 - TRUCK
      ?AUTO_6718 - LOCATION
      ?AUTO_6725 - CITY
      ?AUTO_6727 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6723 ?AUTO_6717 ) ( IN-CITY ?AUTO_6716 ?AUTO_6717 ) ( not ( = ?AUTO_6716 ?AUTO_6723 ) ) ( AIRPORT ?AUTO_6724 ) ( AIRPORT ?AUTO_6723 ) ( not ( = ?AUTO_6724 ?AUTO_6723 ) ) ( not ( = ?AUTO_6716 ?AUTO_6724 ) ) ( IN-CITY ?AUTO_6726 ?AUTO_6717 ) ( not ( = ?AUTO_6723 ?AUTO_6726 ) ) ( not ( = ?AUTO_6716 ?AUTO_6726 ) ) ( not ( = ?AUTO_6724 ?AUTO_6726 ) ) ( TRUCK-AT ?AUTO_6721 ?AUTO_6716 ) ( AIRPORT ?AUTO_6722 ) ( AIRPLANE-AT ?AUTO_6719 ?AUTO_6722 ) ( not ( = ?AUTO_6722 ?AUTO_6723 ) ) ( not ( = ?AUTO_6716 ?AUTO_6722 ) ) ( not ( = ?AUTO_6724 ?AUTO_6722 ) ) ( not ( = ?AUTO_6726 ?AUTO_6722 ) ) ( not ( = ?AUTO_6721 ?AUTO_6720 ) ) ( IN-CITY ?AUTO_6718 ?AUTO_6725 ) ( IN-CITY ?AUTO_6724 ?AUTO_6725 ) ( not ( = ?AUTO_6724 ?AUTO_6718 ) ) ( not ( = ?AUTO_6716 ?AUTO_6718 ) ) ( not ( = ?AUTO_6723 ?AUTO_6718 ) ) ( not ( = ?AUTO_6717 ?AUTO_6725 ) ) ( not ( = ?AUTO_6726 ?AUTO_6718 ) ) ( not ( = ?AUTO_6722 ?AUTO_6718 ) ) ( OBJ-AT ?AUTO_6715 ?AUTO_6718 ) ( TRUCK-AT ?AUTO_6720 ?AUTO_6727 ) ( IN-CITY ?AUTO_6727 ?AUTO_6725 ) ( not ( = ?AUTO_6718 ?AUTO_6727 ) ) ( not ( = ?AUTO_6716 ?AUTO_6727 ) ) ( not ( = ?AUTO_6723 ?AUTO_6727 ) ) ( not ( = ?AUTO_6724 ?AUTO_6727 ) ) ( not ( = ?AUTO_6726 ?AUTO_6727 ) ) ( not ( = ?AUTO_6722 ?AUTO_6727 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6720 ?AUTO_6727 ?AUTO_6718 ?AUTO_6725 )
      ( DELIVER-PKG ?AUTO_6715 ?AUTO_6716 )
      ( DELIVER-PKG-VERIFY ?AUTO_6715 ?AUTO_6716 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6732 - OBJ
      ?AUTO_6733 - LOCATION
    )
    :vars
    (
      ?AUTO_6734 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6734 ?AUTO_6733 ) ( IN-TRUCK ?AUTO_6732 ?AUTO_6734 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6732 ?AUTO_6734 ?AUTO_6733 )
      ( DELIVER-PKG-VERIFY ?AUTO_6732 ?AUTO_6733 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6735 - OBJ
      ?AUTO_6736 - LOCATION
    )
    :vars
    (
      ?AUTO_6737 - TRUCK
      ?AUTO_6738 - LOCATION
      ?AUTO_6739 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_6735 ?AUTO_6737 ) ( TRUCK-AT ?AUTO_6737 ?AUTO_6738 ) ( IN-CITY ?AUTO_6738 ?AUTO_6739 ) ( IN-CITY ?AUTO_6736 ?AUTO_6739 ) ( not ( = ?AUTO_6736 ?AUTO_6738 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6737 ?AUTO_6738 ?AUTO_6736 ?AUTO_6739 )
      ( DELIVER-PKG ?AUTO_6735 ?AUTO_6736 )
      ( DELIVER-PKG-VERIFY ?AUTO_6735 ?AUTO_6736 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6744 - OBJ
      ?AUTO_6745 - LOCATION
    )
    :vars
    (
      ?AUTO_6748 - TRUCK
      ?AUTO_6746 - LOCATION
      ?AUTO_6747 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6748 ?AUTO_6746 ) ( IN-CITY ?AUTO_6746 ?AUTO_6747 ) ( IN-CITY ?AUTO_6745 ?AUTO_6747 ) ( not ( = ?AUTO_6745 ?AUTO_6746 ) ) ( OBJ-AT ?AUTO_6744 ?AUTO_6746 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6744 ?AUTO_6748 ?AUTO_6746 )
      ( DELIVER-PKG ?AUTO_6744 ?AUTO_6745 )
      ( DELIVER-PKG-VERIFY ?AUTO_6744 ?AUTO_6745 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6749 - OBJ
      ?AUTO_6750 - LOCATION
    )
    :vars
    (
      ?AUTO_6751 - LOCATION
      ?AUTO_6752 - CITY
      ?AUTO_6753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6751 ?AUTO_6752 ) ( IN-CITY ?AUTO_6750 ?AUTO_6752 ) ( not ( = ?AUTO_6750 ?AUTO_6751 ) ) ( OBJ-AT ?AUTO_6749 ?AUTO_6751 ) ( TRUCK-AT ?AUTO_6753 ?AUTO_6750 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6753 ?AUTO_6750 ?AUTO_6751 ?AUTO_6752 )
      ( DELIVER-PKG ?AUTO_6749 ?AUTO_6750 )
      ( DELIVER-PKG-VERIFY ?AUTO_6749 ?AUTO_6750 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6780 - OBJ
      ?AUTO_6781 - LOCATION
    )
    :vars
    (
      ?AUTO_6783 - LOCATION
      ?AUTO_6782 - CITY
      ?AUTO_6784 - TRUCK
      ?AUTO_6785 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6783 ?AUTO_6782 ) ( IN-CITY ?AUTO_6781 ?AUTO_6782 ) ( not ( = ?AUTO_6781 ?AUTO_6783 ) ) ( TRUCK-AT ?AUTO_6784 ?AUTO_6781 ) ( IN-AIRPLANE ?AUTO_6780 ?AUTO_6785 ) ( AIRPLANE-AT ?AUTO_6785 ?AUTO_6783 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6780 ?AUTO_6785 ?AUTO_6783 )
      ( DELIVER-PKG ?AUTO_6780 ?AUTO_6781 )
      ( DELIVER-PKG-VERIFY ?AUTO_6780 ?AUTO_6781 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6786 - OBJ
      ?AUTO_6787 - LOCATION
    )
    :vars
    (
      ?AUTO_6789 - LOCATION
      ?AUTO_6788 - CITY
      ?AUTO_6790 - TRUCK
      ?AUTO_6791 - AIRPLANE
      ?AUTO_6792 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6789 ?AUTO_6788 ) ( IN-CITY ?AUTO_6787 ?AUTO_6788 ) ( not ( = ?AUTO_6787 ?AUTO_6789 ) ) ( TRUCK-AT ?AUTO_6790 ?AUTO_6787 ) ( IN-AIRPLANE ?AUTO_6786 ?AUTO_6791 ) ( AIRPORT ?AUTO_6792 ) ( AIRPORT ?AUTO_6789 ) ( AIRPLANE-AT ?AUTO_6791 ?AUTO_6792 ) ( not ( = ?AUTO_6792 ?AUTO_6789 ) ) ( not ( = ?AUTO_6787 ?AUTO_6792 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6791 ?AUTO_6792 ?AUTO_6789 )
      ( DELIVER-PKG ?AUTO_6786 ?AUTO_6787 )
      ( DELIVER-PKG-VERIFY ?AUTO_6786 ?AUTO_6787 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6833 - OBJ
      ?AUTO_6834 - LOCATION
    )
    :vars
    (
      ?AUTO_6839 - LOCATION
      ?AUTO_6837 - CITY
      ?AUTO_6838 - TRUCK
      ?AUTO_6836 - LOCATION
      ?AUTO_6835 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6839 ?AUTO_6837 ) ( IN-CITY ?AUTO_6834 ?AUTO_6837 ) ( not ( = ?AUTO_6834 ?AUTO_6839 ) ) ( TRUCK-AT ?AUTO_6838 ?AUTO_6834 ) ( AIRPORT ?AUTO_6836 ) ( AIRPORT ?AUTO_6839 ) ( AIRPLANE-AT ?AUTO_6835 ?AUTO_6836 ) ( not ( = ?AUTO_6836 ?AUTO_6839 ) ) ( not ( = ?AUTO_6834 ?AUTO_6836 ) ) ( OBJ-AT ?AUTO_6833 ?AUTO_6836 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6833 ?AUTO_6835 ?AUTO_6836 )
      ( DELIVER-PKG ?AUTO_6833 ?AUTO_6834 )
      ( DELIVER-PKG-VERIFY ?AUTO_6833 ?AUTO_6834 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6866 - OBJ
      ?AUTO_6867 - LOCATION
    )
    :vars
    (
      ?AUTO_6868 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6868 ?AUTO_6867 ) ( IN-TRUCK ?AUTO_6866 ?AUTO_6868 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6866 ?AUTO_6868 ?AUTO_6867 )
      ( DELIVER-PKG-VERIFY ?AUTO_6866 ?AUTO_6867 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6875 - OBJ
      ?AUTO_6876 - LOCATION
    )
    :vars
    (
      ?AUTO_6878 - TRUCK
      ?AUTO_6879 - LOCATION
      ?AUTO_6877 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6878 ?AUTO_6879 ) ( IN-CITY ?AUTO_6879 ?AUTO_6877 ) ( IN-CITY ?AUTO_6876 ?AUTO_6877 ) ( not ( = ?AUTO_6876 ?AUTO_6879 ) ) ( OBJ-AT ?AUTO_6875 ?AUTO_6879 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6875 ?AUTO_6878 ?AUTO_6879 )
      ( DELIVER-PKG ?AUTO_6875 ?AUTO_6876 )
      ( DELIVER-PKG-VERIFY ?AUTO_6875 ?AUTO_6876 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6908 - OBJ
      ?AUTO_6909 - LOCATION
    )
    :vars
    (
      ?AUTO_6911 - LOCATION
      ?AUTO_6912 - CITY
      ?AUTO_6910 - TRUCK
      ?AUTO_6913 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6911 ?AUTO_6912 ) ( IN-CITY ?AUTO_6909 ?AUTO_6912 ) ( not ( = ?AUTO_6909 ?AUTO_6911 ) ) ( TRUCK-AT ?AUTO_6910 ?AUTO_6909 ) ( IN-AIRPLANE ?AUTO_6908 ?AUTO_6913 ) ( AIRPLANE-AT ?AUTO_6913 ?AUTO_6911 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_6908 ?AUTO_6913 ?AUTO_6911 )
      ( DELIVER-PKG ?AUTO_6908 ?AUTO_6909 )
      ( DELIVER-PKG-VERIFY ?AUTO_6908 ?AUTO_6909 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6922 - OBJ
      ?AUTO_6923 - LOCATION
    )
    :vars
    (
      ?AUTO_6926 - LOCATION
      ?AUTO_6927 - CITY
      ?AUTO_6928 - TRUCK
      ?AUTO_6924 - LOCATION
      ?AUTO_6925 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6926 ?AUTO_6927 ) ( IN-CITY ?AUTO_6923 ?AUTO_6927 ) ( not ( = ?AUTO_6923 ?AUTO_6926 ) ) ( TRUCK-AT ?AUTO_6928 ?AUTO_6923 ) ( AIRPORT ?AUTO_6924 ) ( AIRPORT ?AUTO_6926 ) ( AIRPLANE-AT ?AUTO_6925 ?AUTO_6924 ) ( not ( = ?AUTO_6924 ?AUTO_6926 ) ) ( not ( = ?AUTO_6923 ?AUTO_6924 ) ) ( OBJ-AT ?AUTO_6922 ?AUTO_6924 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_6922 ?AUTO_6925 ?AUTO_6924 )
      ( DELIVER-PKG ?AUTO_6922 ?AUTO_6923 )
      ( DELIVER-PKG-VERIFY ?AUTO_6922 ?AUTO_6923 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6929 - OBJ
      ?AUTO_6930 - LOCATION
    )
    :vars
    (
      ?AUTO_6934 - LOCATION
      ?AUTO_6935 - CITY
      ?AUTO_6933 - TRUCK
      ?AUTO_6931 - LOCATION
      ?AUTO_6936 - LOCATION
      ?AUTO_6932 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6934 ?AUTO_6935 ) ( IN-CITY ?AUTO_6930 ?AUTO_6935 ) ( not ( = ?AUTO_6930 ?AUTO_6934 ) ) ( TRUCK-AT ?AUTO_6933 ?AUTO_6930 ) ( AIRPORT ?AUTO_6931 ) ( AIRPORT ?AUTO_6934 ) ( not ( = ?AUTO_6931 ?AUTO_6934 ) ) ( not ( = ?AUTO_6930 ?AUTO_6931 ) ) ( OBJ-AT ?AUTO_6929 ?AUTO_6931 ) ( AIRPORT ?AUTO_6936 ) ( AIRPLANE-AT ?AUTO_6932 ?AUTO_6936 ) ( not ( = ?AUTO_6936 ?AUTO_6931 ) ) ( not ( = ?AUTO_6930 ?AUTO_6936 ) ) ( not ( = ?AUTO_6934 ?AUTO_6936 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6932 ?AUTO_6936 ?AUTO_6931 )
      ( DELIVER-PKG ?AUTO_6929 ?AUTO_6930 )
      ( DELIVER-PKG-VERIFY ?AUTO_6929 ?AUTO_6930 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6997 - OBJ
      ?AUTO_6998 - LOCATION
    )
    :vars
    (
      ?AUTO_6999 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6999 ?AUTO_6998 ) ( IN-TRUCK ?AUTO_6997 ?AUTO_6999 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6997 ?AUTO_6999 ?AUTO_6998 )
      ( DELIVER-PKG-VERIFY ?AUTO_6997 ?AUTO_6998 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7006 - OBJ
      ?AUTO_7007 - LOCATION
    )
    :vars
    (
      ?AUTO_7009 - TRUCK
      ?AUTO_7010 - LOCATION
      ?AUTO_7008 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7009 ?AUTO_7010 ) ( IN-CITY ?AUTO_7010 ?AUTO_7008 ) ( IN-CITY ?AUTO_7007 ?AUTO_7008 ) ( not ( = ?AUTO_7007 ?AUTO_7010 ) ) ( OBJ-AT ?AUTO_7006 ?AUTO_7010 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7006 ?AUTO_7009 ?AUTO_7010 )
      ( DELIVER-PKG ?AUTO_7006 ?AUTO_7007 )
      ( DELIVER-PKG-VERIFY ?AUTO_7006 ?AUTO_7007 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7039 - OBJ
      ?AUTO_7040 - LOCATION
    )
    :vars
    (
      ?AUTO_7041 - LOCATION
      ?AUTO_7042 - CITY
      ?AUTO_7043 - TRUCK
      ?AUTO_7044 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7041 ?AUTO_7042 ) ( IN-CITY ?AUTO_7040 ?AUTO_7042 ) ( not ( = ?AUTO_7040 ?AUTO_7041 ) ) ( TRUCK-AT ?AUTO_7043 ?AUTO_7040 ) ( IN-AIRPLANE ?AUTO_7039 ?AUTO_7044 ) ( AIRPLANE-AT ?AUTO_7044 ?AUTO_7041 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7039 ?AUTO_7044 ?AUTO_7041 )
      ( DELIVER-PKG ?AUTO_7039 ?AUTO_7040 )
      ( DELIVER-PKG-VERIFY ?AUTO_7039 ?AUTO_7040 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7073 - OBJ
      ?AUTO_7074 - LOCATION
    )
    :vars
    (
      ?AUTO_7079 - LOCATION
      ?AUTO_7076 - CITY
      ?AUTO_7077 - TRUCK
      ?AUTO_7075 - LOCATION
      ?AUTO_7078 - AIRPLANE
      ?AUTO_7080 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7079 ?AUTO_7076 ) ( IN-CITY ?AUTO_7074 ?AUTO_7076 ) ( not ( = ?AUTO_7074 ?AUTO_7079 ) ) ( TRUCK-AT ?AUTO_7077 ?AUTO_7074 ) ( AIRPORT ?AUTO_7075 ) ( AIRPORT ?AUTO_7079 ) ( AIRPLANE-AT ?AUTO_7078 ?AUTO_7075 ) ( not ( = ?AUTO_7075 ?AUTO_7079 ) ) ( not ( = ?AUTO_7074 ?AUTO_7075 ) ) ( TRUCK-AT ?AUTO_7080 ?AUTO_7075 ) ( IN-TRUCK ?AUTO_7073 ?AUTO_7080 ) ( not ( = ?AUTO_7077 ?AUTO_7080 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7073 ?AUTO_7080 ?AUTO_7075 )
      ( DELIVER-PKG ?AUTO_7073 ?AUTO_7074 )
      ( DELIVER-PKG-VERIFY ?AUTO_7073 ?AUTO_7074 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7081 - OBJ
      ?AUTO_7082 - LOCATION
    )
    :vars
    (
      ?AUTO_7088 - LOCATION
      ?AUTO_7085 - CITY
      ?AUTO_7084 - TRUCK
      ?AUTO_7083 - LOCATION
      ?AUTO_7086 - AIRPLANE
      ?AUTO_7087 - TRUCK
      ?AUTO_7089 - LOCATION
      ?AUTO_7090 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7088 ?AUTO_7085 ) ( IN-CITY ?AUTO_7082 ?AUTO_7085 ) ( not ( = ?AUTO_7082 ?AUTO_7088 ) ) ( TRUCK-AT ?AUTO_7084 ?AUTO_7082 ) ( AIRPORT ?AUTO_7083 ) ( AIRPORT ?AUTO_7088 ) ( AIRPLANE-AT ?AUTO_7086 ?AUTO_7083 ) ( not ( = ?AUTO_7083 ?AUTO_7088 ) ) ( not ( = ?AUTO_7082 ?AUTO_7083 ) ) ( IN-TRUCK ?AUTO_7081 ?AUTO_7087 ) ( not ( = ?AUTO_7084 ?AUTO_7087 ) ) ( TRUCK-AT ?AUTO_7087 ?AUTO_7089 ) ( IN-CITY ?AUTO_7089 ?AUTO_7090 ) ( IN-CITY ?AUTO_7083 ?AUTO_7090 ) ( not ( = ?AUTO_7083 ?AUTO_7089 ) ) ( not ( = ?AUTO_7082 ?AUTO_7089 ) ) ( not ( = ?AUTO_7088 ?AUTO_7089 ) ) ( not ( = ?AUTO_7085 ?AUTO_7090 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7087 ?AUTO_7089 ?AUTO_7083 ?AUTO_7090 )
      ( DELIVER-PKG ?AUTO_7081 ?AUTO_7082 )
      ( DELIVER-PKG-VERIFY ?AUTO_7081 ?AUTO_7082 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7093 - OBJ
      ?AUTO_7094 - LOCATION
    )
    :vars
    (
      ?AUTO_7101 - LOCATION
      ?AUTO_7099 - CITY
      ?AUTO_7100 - TRUCK
      ?AUTO_7098 - LOCATION
      ?AUTO_7095 - AIRPLANE
      ?AUTO_7102 - TRUCK
      ?AUTO_7096 - LOCATION
      ?AUTO_7097 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7101 ?AUTO_7099 ) ( IN-CITY ?AUTO_7094 ?AUTO_7099 ) ( not ( = ?AUTO_7094 ?AUTO_7101 ) ) ( TRUCK-AT ?AUTO_7100 ?AUTO_7094 ) ( AIRPORT ?AUTO_7098 ) ( AIRPORT ?AUTO_7101 ) ( AIRPLANE-AT ?AUTO_7095 ?AUTO_7098 ) ( not ( = ?AUTO_7098 ?AUTO_7101 ) ) ( not ( = ?AUTO_7094 ?AUTO_7098 ) ) ( not ( = ?AUTO_7100 ?AUTO_7102 ) ) ( TRUCK-AT ?AUTO_7102 ?AUTO_7096 ) ( IN-CITY ?AUTO_7096 ?AUTO_7097 ) ( IN-CITY ?AUTO_7098 ?AUTO_7097 ) ( not ( = ?AUTO_7098 ?AUTO_7096 ) ) ( not ( = ?AUTO_7094 ?AUTO_7096 ) ) ( not ( = ?AUTO_7101 ?AUTO_7096 ) ) ( not ( = ?AUTO_7099 ?AUTO_7097 ) ) ( OBJ-AT ?AUTO_7093 ?AUTO_7096 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7093 ?AUTO_7102 ?AUTO_7096 )
      ( DELIVER-PKG ?AUTO_7093 ?AUTO_7094 )
      ( DELIVER-PKG-VERIFY ?AUTO_7093 ?AUTO_7094 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7103 - OBJ
      ?AUTO_7104 - LOCATION
    )
    :vars
    (
      ?AUTO_7112 - LOCATION
      ?AUTO_7111 - CITY
      ?AUTO_7107 - TRUCK
      ?AUTO_7110 - LOCATION
      ?AUTO_7106 - AIRPLANE
      ?AUTO_7108 - TRUCK
      ?AUTO_7109 - LOCATION
      ?AUTO_7105 - CITY
      ?AUTO_7113 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7112 ?AUTO_7111 ) ( IN-CITY ?AUTO_7104 ?AUTO_7111 ) ( not ( = ?AUTO_7104 ?AUTO_7112 ) ) ( TRUCK-AT ?AUTO_7107 ?AUTO_7104 ) ( AIRPORT ?AUTO_7110 ) ( AIRPORT ?AUTO_7112 ) ( AIRPLANE-AT ?AUTO_7106 ?AUTO_7110 ) ( not ( = ?AUTO_7110 ?AUTO_7112 ) ) ( not ( = ?AUTO_7104 ?AUTO_7110 ) ) ( not ( = ?AUTO_7107 ?AUTO_7108 ) ) ( IN-CITY ?AUTO_7109 ?AUTO_7105 ) ( IN-CITY ?AUTO_7110 ?AUTO_7105 ) ( not ( = ?AUTO_7110 ?AUTO_7109 ) ) ( not ( = ?AUTO_7104 ?AUTO_7109 ) ) ( not ( = ?AUTO_7112 ?AUTO_7109 ) ) ( not ( = ?AUTO_7111 ?AUTO_7105 ) ) ( OBJ-AT ?AUTO_7103 ?AUTO_7109 ) ( TRUCK-AT ?AUTO_7108 ?AUTO_7113 ) ( IN-CITY ?AUTO_7113 ?AUTO_7105 ) ( not ( = ?AUTO_7109 ?AUTO_7113 ) ) ( not ( = ?AUTO_7104 ?AUTO_7113 ) ) ( not ( = ?AUTO_7112 ?AUTO_7113 ) ) ( not ( = ?AUTO_7110 ?AUTO_7113 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7108 ?AUTO_7113 ?AUTO_7109 ?AUTO_7105 )
      ( DELIVER-PKG ?AUTO_7103 ?AUTO_7104 )
      ( DELIVER-PKG-VERIFY ?AUTO_7103 ?AUTO_7104 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7114 - OBJ
      ?AUTO_7115 - LOCATION
    )
    :vars
    (
      ?AUTO_7116 - LOCATION
      ?AUTO_7121 - CITY
      ?AUTO_7123 - TRUCK
      ?AUTO_7118 - LOCATION
      ?AUTO_7117 - TRUCK
      ?AUTO_7124 - LOCATION
      ?AUTO_7119 - CITY
      ?AUTO_7122 - LOCATION
      ?AUTO_7125 - LOCATION
      ?AUTO_7120 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7116 ?AUTO_7121 ) ( IN-CITY ?AUTO_7115 ?AUTO_7121 ) ( not ( = ?AUTO_7115 ?AUTO_7116 ) ) ( TRUCK-AT ?AUTO_7123 ?AUTO_7115 ) ( AIRPORT ?AUTO_7118 ) ( AIRPORT ?AUTO_7116 ) ( not ( = ?AUTO_7118 ?AUTO_7116 ) ) ( not ( = ?AUTO_7115 ?AUTO_7118 ) ) ( not ( = ?AUTO_7123 ?AUTO_7117 ) ) ( IN-CITY ?AUTO_7124 ?AUTO_7119 ) ( IN-CITY ?AUTO_7118 ?AUTO_7119 ) ( not ( = ?AUTO_7118 ?AUTO_7124 ) ) ( not ( = ?AUTO_7115 ?AUTO_7124 ) ) ( not ( = ?AUTO_7116 ?AUTO_7124 ) ) ( not ( = ?AUTO_7121 ?AUTO_7119 ) ) ( OBJ-AT ?AUTO_7114 ?AUTO_7124 ) ( TRUCK-AT ?AUTO_7117 ?AUTO_7122 ) ( IN-CITY ?AUTO_7122 ?AUTO_7119 ) ( not ( = ?AUTO_7124 ?AUTO_7122 ) ) ( not ( = ?AUTO_7115 ?AUTO_7122 ) ) ( not ( = ?AUTO_7116 ?AUTO_7122 ) ) ( not ( = ?AUTO_7118 ?AUTO_7122 ) ) ( AIRPORT ?AUTO_7125 ) ( AIRPLANE-AT ?AUTO_7120 ?AUTO_7125 ) ( not ( = ?AUTO_7125 ?AUTO_7118 ) ) ( not ( = ?AUTO_7115 ?AUTO_7125 ) ) ( not ( = ?AUTO_7116 ?AUTO_7125 ) ) ( not ( = ?AUTO_7124 ?AUTO_7125 ) ) ( not ( = ?AUTO_7122 ?AUTO_7125 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7120 ?AUTO_7125 ?AUTO_7118 )
      ( DELIVER-PKG ?AUTO_7114 ?AUTO_7115 )
      ( DELIVER-PKG-VERIFY ?AUTO_7114 ?AUTO_7115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7128 - OBJ
      ?AUTO_7129 - LOCATION
    )
    :vars
    (
      ?AUTO_7130 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7130 ?AUTO_7129 ) ( IN-TRUCK ?AUTO_7128 ?AUTO_7130 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7128 ?AUTO_7130 ?AUTO_7129 )
      ( DELIVER-PKG-VERIFY ?AUTO_7128 ?AUTO_7129 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7131 - OBJ
      ?AUTO_7132 - LOCATION
    )
    :vars
    (
      ?AUTO_7133 - TRUCK
      ?AUTO_7134 - LOCATION
      ?AUTO_7135 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7131 ?AUTO_7133 ) ( TRUCK-AT ?AUTO_7133 ?AUTO_7134 ) ( IN-CITY ?AUTO_7134 ?AUTO_7135 ) ( IN-CITY ?AUTO_7132 ?AUTO_7135 ) ( not ( = ?AUTO_7132 ?AUTO_7134 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7133 ?AUTO_7134 ?AUTO_7132 ?AUTO_7135 )
      ( DELIVER-PKG ?AUTO_7131 ?AUTO_7132 )
      ( DELIVER-PKG-VERIFY ?AUTO_7131 ?AUTO_7132 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7136 - OBJ
      ?AUTO_7137 - LOCATION
    )
    :vars
    (
      ?AUTO_7138 - TRUCK
      ?AUTO_7139 - LOCATION
      ?AUTO_7140 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7138 ?AUTO_7139 ) ( IN-CITY ?AUTO_7139 ?AUTO_7140 ) ( IN-CITY ?AUTO_7137 ?AUTO_7140 ) ( not ( = ?AUTO_7137 ?AUTO_7139 ) ) ( OBJ-AT ?AUTO_7136 ?AUTO_7139 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7136 ?AUTO_7138 ?AUTO_7139 )
      ( DELIVER-PKG ?AUTO_7136 ?AUTO_7137 )
      ( DELIVER-PKG-VERIFY ?AUTO_7136 ?AUTO_7137 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7141 - OBJ
      ?AUTO_7142 - LOCATION
    )
    :vars
    (
      ?AUTO_7143 - LOCATION
      ?AUTO_7145 - CITY
      ?AUTO_7144 - TRUCK
      ?AUTO_7146 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7143 ?AUTO_7145 ) ( IN-CITY ?AUTO_7142 ?AUTO_7145 ) ( not ( = ?AUTO_7142 ?AUTO_7143 ) ) ( OBJ-AT ?AUTO_7141 ?AUTO_7143 ) ( TRUCK-AT ?AUTO_7144 ?AUTO_7146 ) ( IN-CITY ?AUTO_7146 ?AUTO_7145 ) ( not ( = ?AUTO_7143 ?AUTO_7146 ) ) ( not ( = ?AUTO_7142 ?AUTO_7146 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7144 ?AUTO_7146 ?AUTO_7143 ?AUTO_7145 )
      ( DELIVER-PKG ?AUTO_7141 ?AUTO_7142 )
      ( DELIVER-PKG-VERIFY ?AUTO_7141 ?AUTO_7142 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7149 - OBJ
      ?AUTO_7150 - LOCATION
    )
    :vars
    (
      ?AUTO_7151 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7151 ?AUTO_7150 ) ( IN-TRUCK ?AUTO_7149 ?AUTO_7151 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7149 ?AUTO_7151 ?AUTO_7150 )
      ( DELIVER-PKG-VERIFY ?AUTO_7149 ?AUTO_7150 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7158 - OBJ
      ?AUTO_7159 - LOCATION
    )
    :vars
    (
      ?AUTO_7160 - TRUCK
      ?AUTO_7161 - LOCATION
      ?AUTO_7162 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7158 ?AUTO_7160 ) ( TRUCK-AT ?AUTO_7160 ?AUTO_7161 ) ( IN-CITY ?AUTO_7161 ?AUTO_7162 ) ( IN-CITY ?AUTO_7159 ?AUTO_7162 ) ( not ( = ?AUTO_7159 ?AUTO_7161 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7160 ?AUTO_7161 ?AUTO_7159 ?AUTO_7162 )
      ( DELIVER-PKG ?AUTO_7158 ?AUTO_7159 )
      ( DELIVER-PKG-VERIFY ?AUTO_7158 ?AUTO_7159 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7163 - OBJ
      ?AUTO_7164 - LOCATION
    )
    :vars
    (
      ?AUTO_7165 - TRUCK
      ?AUTO_7166 - LOCATION
      ?AUTO_7167 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7165 ?AUTO_7166 ) ( IN-CITY ?AUTO_7166 ?AUTO_7167 ) ( IN-CITY ?AUTO_7164 ?AUTO_7167 ) ( not ( = ?AUTO_7164 ?AUTO_7166 ) ) ( OBJ-AT ?AUTO_7163 ?AUTO_7166 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7163 ?AUTO_7165 ?AUTO_7166 )
      ( DELIVER-PKG ?AUTO_7163 ?AUTO_7164 )
      ( DELIVER-PKG-VERIFY ?AUTO_7163 ?AUTO_7164 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7184 - OBJ
      ?AUTO_7185 - LOCATION
    )
    :vars
    (
      ?AUTO_7186 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7186 ?AUTO_7185 ) ( IN-TRUCK ?AUTO_7184 ?AUTO_7186 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7184 ?AUTO_7186 ?AUTO_7185 )
      ( DELIVER-PKG-VERIFY ?AUTO_7184 ?AUTO_7185 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7187 - OBJ
      ?AUTO_7188 - LOCATION
    )
    :vars
    (
      ?AUTO_7189 - TRUCK
      ?AUTO_7190 - LOCATION
      ?AUTO_7191 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7187 ?AUTO_7189 ) ( TRUCK-AT ?AUTO_7189 ?AUTO_7190 ) ( IN-CITY ?AUTO_7190 ?AUTO_7191 ) ( IN-CITY ?AUTO_7188 ?AUTO_7191 ) ( not ( = ?AUTO_7188 ?AUTO_7190 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7189 ?AUTO_7190 ?AUTO_7188 ?AUTO_7191 )
      ( DELIVER-PKG ?AUTO_7187 ?AUTO_7188 )
      ( DELIVER-PKG-VERIFY ?AUTO_7187 ?AUTO_7188 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7192 - OBJ
      ?AUTO_7193 - LOCATION
    )
    :vars
    (
      ?AUTO_7194 - TRUCK
      ?AUTO_7195 - LOCATION
      ?AUTO_7196 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7194 ?AUTO_7195 ) ( IN-CITY ?AUTO_7195 ?AUTO_7196 ) ( IN-CITY ?AUTO_7193 ?AUTO_7196 ) ( not ( = ?AUTO_7193 ?AUTO_7195 ) ) ( OBJ-AT ?AUTO_7192 ?AUTO_7195 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7192 ?AUTO_7194 ?AUTO_7195 )
      ( DELIVER-PKG ?AUTO_7192 ?AUTO_7193 )
      ( DELIVER-PKG-VERIFY ?AUTO_7192 ?AUTO_7193 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7197 - OBJ
      ?AUTO_7198 - LOCATION
    )
    :vars
    (
      ?AUTO_7199 - LOCATION
      ?AUTO_7201 - CITY
      ?AUTO_7200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7199 ?AUTO_7201 ) ( IN-CITY ?AUTO_7198 ?AUTO_7201 ) ( not ( = ?AUTO_7198 ?AUTO_7199 ) ) ( OBJ-AT ?AUTO_7197 ?AUTO_7199 ) ( TRUCK-AT ?AUTO_7200 ?AUTO_7198 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7200 ?AUTO_7198 ?AUTO_7199 ?AUTO_7201 )
      ( DELIVER-PKG ?AUTO_7197 ?AUTO_7198 )
      ( DELIVER-PKG-VERIFY ?AUTO_7197 ?AUTO_7198 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7230 - OBJ
      ?AUTO_7231 - LOCATION
    )
    :vars
    (
      ?AUTO_7232 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7230 ?AUTO_7232 ) ( AIRPLANE-AT ?AUTO_7232 ?AUTO_7231 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7230 ?AUTO_7232 ?AUTO_7231 )
      ( DELIVER-PKG-VERIFY ?AUTO_7230 ?AUTO_7231 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7233 - OBJ
      ?AUTO_7234 - LOCATION
    )
    :vars
    (
      ?AUTO_7235 - AIRPLANE
      ?AUTO_7236 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7233 ?AUTO_7235 ) ( AIRPORT ?AUTO_7236 ) ( AIRPORT ?AUTO_7234 ) ( AIRPLANE-AT ?AUTO_7235 ?AUTO_7236 ) ( not ( = ?AUTO_7236 ?AUTO_7234 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7235 ?AUTO_7236 ?AUTO_7234 )
      ( DELIVER-PKG ?AUTO_7233 ?AUTO_7234 )
      ( DELIVER-PKG-VERIFY ?AUTO_7233 ?AUTO_7234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7241 - OBJ
      ?AUTO_7242 - LOCATION
    )
    :vars
    (
      ?AUTO_7243 - LOCATION
      ?AUTO_7244 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7243 ) ( AIRPORT ?AUTO_7242 ) ( AIRPLANE-AT ?AUTO_7244 ?AUTO_7243 ) ( not ( = ?AUTO_7243 ?AUTO_7242 ) ) ( OBJ-AT ?AUTO_7241 ?AUTO_7243 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7241 ?AUTO_7244 ?AUTO_7243 )
      ( DELIVER-PKG ?AUTO_7241 ?AUTO_7242 )
      ( DELIVER-PKG-VERIFY ?AUTO_7241 ?AUTO_7242 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7245 - OBJ
      ?AUTO_7246 - LOCATION
    )
    :vars
    (
      ?AUTO_7247 - LOCATION
      ?AUTO_7248 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7247 ) ( AIRPORT ?AUTO_7246 ) ( not ( = ?AUTO_7247 ?AUTO_7246 ) ) ( OBJ-AT ?AUTO_7245 ?AUTO_7247 ) ( AIRPLANE-AT ?AUTO_7248 ?AUTO_7246 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7248 ?AUTO_7246 ?AUTO_7247 )
      ( DELIVER-PKG ?AUTO_7245 ?AUTO_7246 )
      ( DELIVER-PKG-VERIFY ?AUTO_7245 ?AUTO_7246 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7275 - OBJ
      ?AUTO_7276 - LOCATION
    )
    :vars
    (
      ?AUTO_7277 - LOCATION
      ?AUTO_7278 - AIRPLANE
      ?AUTO_7279 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7277 ) ( AIRPORT ?AUTO_7276 ) ( not ( = ?AUTO_7277 ?AUTO_7276 ) ) ( AIRPLANE-AT ?AUTO_7278 ?AUTO_7276 ) ( TRUCK-AT ?AUTO_7279 ?AUTO_7277 ) ( IN-TRUCK ?AUTO_7275 ?AUTO_7279 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7275 ?AUTO_7279 ?AUTO_7277 )
      ( DELIVER-PKG ?AUTO_7275 ?AUTO_7276 )
      ( DELIVER-PKG-VERIFY ?AUTO_7275 ?AUTO_7276 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7280 - OBJ
      ?AUTO_7281 - LOCATION
    )
    :vars
    (
      ?AUTO_7282 - LOCATION
      ?AUTO_7283 - AIRPLANE
      ?AUTO_7284 - TRUCK
      ?AUTO_7285 - LOCATION
      ?AUTO_7286 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7282 ) ( AIRPORT ?AUTO_7281 ) ( not ( = ?AUTO_7282 ?AUTO_7281 ) ) ( AIRPLANE-AT ?AUTO_7283 ?AUTO_7281 ) ( IN-TRUCK ?AUTO_7280 ?AUTO_7284 ) ( TRUCK-AT ?AUTO_7284 ?AUTO_7285 ) ( IN-CITY ?AUTO_7285 ?AUTO_7286 ) ( IN-CITY ?AUTO_7282 ?AUTO_7286 ) ( not ( = ?AUTO_7282 ?AUTO_7285 ) ) ( not ( = ?AUTO_7281 ?AUTO_7285 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7284 ?AUTO_7285 ?AUTO_7282 ?AUTO_7286 )
      ( DELIVER-PKG ?AUTO_7280 ?AUTO_7281 )
      ( DELIVER-PKG-VERIFY ?AUTO_7280 ?AUTO_7281 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7287 - OBJ
      ?AUTO_7288 - LOCATION
    )
    :vars
    (
      ?AUTO_7290 - LOCATION
      ?AUTO_7289 - AIRPLANE
      ?AUTO_7291 - TRUCK
      ?AUTO_7293 - LOCATION
      ?AUTO_7292 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7290 ) ( AIRPORT ?AUTO_7288 ) ( not ( = ?AUTO_7290 ?AUTO_7288 ) ) ( AIRPLANE-AT ?AUTO_7289 ?AUTO_7288 ) ( TRUCK-AT ?AUTO_7291 ?AUTO_7293 ) ( IN-CITY ?AUTO_7293 ?AUTO_7292 ) ( IN-CITY ?AUTO_7290 ?AUTO_7292 ) ( not ( = ?AUTO_7290 ?AUTO_7293 ) ) ( not ( = ?AUTO_7288 ?AUTO_7293 ) ) ( OBJ-AT ?AUTO_7287 ?AUTO_7293 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7287 ?AUTO_7291 ?AUTO_7293 )
      ( DELIVER-PKG ?AUTO_7287 ?AUTO_7288 )
      ( DELIVER-PKG-VERIFY ?AUTO_7287 ?AUTO_7288 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7294 - OBJ
      ?AUTO_7295 - LOCATION
    )
    :vars
    (
      ?AUTO_7298 - LOCATION
      ?AUTO_7297 - AIRPLANE
      ?AUTO_7296 - LOCATION
      ?AUTO_7299 - CITY
      ?AUTO_7300 - TRUCK
      ?AUTO_7301 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7298 ) ( AIRPORT ?AUTO_7295 ) ( not ( = ?AUTO_7298 ?AUTO_7295 ) ) ( AIRPLANE-AT ?AUTO_7297 ?AUTO_7295 ) ( IN-CITY ?AUTO_7296 ?AUTO_7299 ) ( IN-CITY ?AUTO_7298 ?AUTO_7299 ) ( not ( = ?AUTO_7298 ?AUTO_7296 ) ) ( not ( = ?AUTO_7295 ?AUTO_7296 ) ) ( OBJ-AT ?AUTO_7294 ?AUTO_7296 ) ( TRUCK-AT ?AUTO_7300 ?AUTO_7301 ) ( IN-CITY ?AUTO_7301 ?AUTO_7299 ) ( not ( = ?AUTO_7296 ?AUTO_7301 ) ) ( not ( = ?AUTO_7295 ?AUTO_7301 ) ) ( not ( = ?AUTO_7298 ?AUTO_7301 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7300 ?AUTO_7301 ?AUTO_7296 ?AUTO_7299 )
      ( DELIVER-PKG ?AUTO_7294 ?AUTO_7295 )
      ( DELIVER-PKG-VERIFY ?AUTO_7294 ?AUTO_7295 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7304 - OBJ
      ?AUTO_7305 - LOCATION
    )
    :vars
    (
      ?AUTO_7306 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7304 ?AUTO_7306 ) ( AIRPLANE-AT ?AUTO_7306 ?AUTO_7305 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7304 ?AUTO_7306 ?AUTO_7305 )
      ( DELIVER-PKG-VERIFY ?AUTO_7304 ?AUTO_7305 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7309 - OBJ
      ?AUTO_7310 - LOCATION
    )
    :vars
    (
      ?AUTO_7311 - AIRPLANE
      ?AUTO_7312 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7309 ?AUTO_7311 ) ( AIRPORT ?AUTO_7312 ) ( AIRPORT ?AUTO_7310 ) ( AIRPLANE-AT ?AUTO_7311 ?AUTO_7312 ) ( not ( = ?AUTO_7312 ?AUTO_7310 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7311 ?AUTO_7312 ?AUTO_7310 )
      ( DELIVER-PKG ?AUTO_7309 ?AUTO_7310 )
      ( DELIVER-PKG-VERIFY ?AUTO_7309 ?AUTO_7310 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7317 - OBJ
      ?AUTO_7318 - LOCATION
    )
    :vars
    (
      ?AUTO_7319 - LOCATION
      ?AUTO_7320 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7319 ) ( AIRPORT ?AUTO_7318 ) ( AIRPLANE-AT ?AUTO_7320 ?AUTO_7319 ) ( not ( = ?AUTO_7319 ?AUTO_7318 ) ) ( OBJ-AT ?AUTO_7317 ?AUTO_7319 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7317 ?AUTO_7320 ?AUTO_7319 )
      ( DELIVER-PKG ?AUTO_7317 ?AUTO_7318 )
      ( DELIVER-PKG-VERIFY ?AUTO_7317 ?AUTO_7318 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7321 - OBJ
      ?AUTO_7322 - LOCATION
    )
    :vars
    (
      ?AUTO_7324 - LOCATION
      ?AUTO_7325 - LOCATION
      ?AUTO_7323 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7324 ) ( AIRPORT ?AUTO_7322 ) ( not ( = ?AUTO_7324 ?AUTO_7322 ) ) ( OBJ-AT ?AUTO_7321 ?AUTO_7324 ) ( AIRPORT ?AUTO_7325 ) ( AIRPLANE-AT ?AUTO_7323 ?AUTO_7325 ) ( not ( = ?AUTO_7325 ?AUTO_7324 ) ) ( not ( = ?AUTO_7322 ?AUTO_7325 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7323 ?AUTO_7325 ?AUTO_7324 )
      ( DELIVER-PKG ?AUTO_7321 ?AUTO_7322 )
      ( DELIVER-PKG-VERIFY ?AUTO_7321 ?AUTO_7322 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7366 - OBJ
      ?AUTO_7367 - LOCATION
    )
    :vars
    (
      ?AUTO_7368 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7368 ?AUTO_7367 ) ( IN-TRUCK ?AUTO_7366 ?AUTO_7368 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7366 ?AUTO_7368 ?AUTO_7367 )
      ( DELIVER-PKG-VERIFY ?AUTO_7366 ?AUTO_7367 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7369 - OBJ
      ?AUTO_7370 - LOCATION
    )
    :vars
    (
      ?AUTO_7371 - TRUCK
      ?AUTO_7372 - LOCATION
      ?AUTO_7373 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7369 ?AUTO_7371 ) ( TRUCK-AT ?AUTO_7371 ?AUTO_7372 ) ( IN-CITY ?AUTO_7372 ?AUTO_7373 ) ( IN-CITY ?AUTO_7370 ?AUTO_7373 ) ( not ( = ?AUTO_7370 ?AUTO_7372 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7371 ?AUTO_7372 ?AUTO_7370 ?AUTO_7373 )
      ( DELIVER-PKG ?AUTO_7369 ?AUTO_7370 )
      ( DELIVER-PKG-VERIFY ?AUTO_7369 ?AUTO_7370 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7414 - OBJ
      ?AUTO_7415 - LOCATION
    )
    :vars
    (
      ?AUTO_7417 - LOCATION
      ?AUTO_7416 - CITY
      ?AUTO_7418 - TRUCK
      ?AUTO_7419 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7417 ?AUTO_7416 ) ( IN-CITY ?AUTO_7415 ?AUTO_7416 ) ( not ( = ?AUTO_7415 ?AUTO_7417 ) ) ( OBJ-AT ?AUTO_7414 ?AUTO_7417 ) ( TRUCK-AT ?AUTO_7418 ?AUTO_7419 ) ( IN-CITY ?AUTO_7419 ?AUTO_7416 ) ( not ( = ?AUTO_7417 ?AUTO_7419 ) ) ( not ( = ?AUTO_7415 ?AUTO_7419 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7418 ?AUTO_7419 ?AUTO_7417 ?AUTO_7416 )
      ( DELIVER-PKG ?AUTO_7414 ?AUTO_7415 )
      ( DELIVER-PKG-VERIFY ?AUTO_7414 ?AUTO_7415 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7432 - OBJ
      ?AUTO_7433 - LOCATION
    )
    :vars
    (
      ?AUTO_7434 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7434 ?AUTO_7433 ) ( IN-TRUCK ?AUTO_7432 ?AUTO_7434 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7432 ?AUTO_7434 ?AUTO_7433 )
      ( DELIVER-PKG-VERIFY ?AUTO_7432 ?AUTO_7433 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7471 - OBJ
      ?AUTO_7472 - LOCATION
    )
    :vars
    (
      ?AUTO_7475 - LOCATION
      ?AUTO_7474 - CITY
      ?AUTO_7473 - TRUCK
      ?AUTO_7476 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7475 ?AUTO_7474 ) ( IN-CITY ?AUTO_7472 ?AUTO_7474 ) ( not ( = ?AUTO_7472 ?AUTO_7475 ) ) ( OBJ-AT ?AUTO_7471 ?AUTO_7475 ) ( TRUCK-AT ?AUTO_7473 ?AUTO_7476 ) ( IN-CITY ?AUTO_7476 ?AUTO_7474 ) ( not ( = ?AUTO_7475 ?AUTO_7476 ) ) ( not ( = ?AUTO_7472 ?AUTO_7476 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7473 ?AUTO_7476 ?AUTO_7475 ?AUTO_7474 )
      ( DELIVER-PKG ?AUTO_7471 ?AUTO_7472 )
      ( DELIVER-PKG-VERIFY ?AUTO_7471 ?AUTO_7472 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7497 - OBJ
      ?AUTO_7498 - LOCATION
    )
    :vars
    (
      ?AUTO_7499 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7499 ?AUTO_7498 ) ( IN-TRUCK ?AUTO_7497 ?AUTO_7499 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7497 ?AUTO_7499 ?AUTO_7498 )
      ( DELIVER-PKG-VERIFY ?AUTO_7497 ?AUTO_7498 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7560 - OBJ
      ?AUTO_7561 - LOCATION
    )
    :vars
    (
      ?AUTO_7562 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7562 ?AUTO_7561 ) ( IN-TRUCK ?AUTO_7560 ?AUTO_7562 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7560 ?AUTO_7562 ?AUTO_7561 )
      ( DELIVER-PKG-VERIFY ?AUTO_7560 ?AUTO_7561 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7563 - OBJ
      ?AUTO_7564 - LOCATION
    )
    :vars
    (
      ?AUTO_7565 - TRUCK
      ?AUTO_7566 - LOCATION
      ?AUTO_7567 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7563 ?AUTO_7565 ) ( TRUCK-AT ?AUTO_7565 ?AUTO_7566 ) ( IN-CITY ?AUTO_7566 ?AUTO_7567 ) ( IN-CITY ?AUTO_7564 ?AUTO_7567 ) ( not ( = ?AUTO_7564 ?AUTO_7566 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7565 ?AUTO_7566 ?AUTO_7564 ?AUTO_7567 )
      ( DELIVER-PKG ?AUTO_7563 ?AUTO_7564 )
      ( DELIVER-PKG-VERIFY ?AUTO_7563 ?AUTO_7564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7568 - OBJ
      ?AUTO_7569 - LOCATION
    )
    :vars
    (
      ?AUTO_7570 - TRUCK
      ?AUTO_7571 - LOCATION
      ?AUTO_7572 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7570 ?AUTO_7571 ) ( IN-CITY ?AUTO_7571 ?AUTO_7572 ) ( IN-CITY ?AUTO_7569 ?AUTO_7572 ) ( not ( = ?AUTO_7569 ?AUTO_7571 ) ) ( OBJ-AT ?AUTO_7568 ?AUTO_7571 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7568 ?AUTO_7570 ?AUTO_7571 )
      ( DELIVER-PKG ?AUTO_7568 ?AUTO_7569 )
      ( DELIVER-PKG-VERIFY ?AUTO_7568 ?AUTO_7569 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7579 - OBJ
      ?AUTO_7580 - LOCATION
    )
    :vars
    (
      ?AUTO_7583 - LOCATION
      ?AUTO_7582 - CITY
      ?AUTO_7581 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7583 ?AUTO_7582 ) ( IN-CITY ?AUTO_7580 ?AUTO_7582 ) ( not ( = ?AUTO_7580 ?AUTO_7583 ) ) ( OBJ-AT ?AUTO_7579 ?AUTO_7583 ) ( TRUCK-AT ?AUTO_7581 ?AUTO_7580 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7581 ?AUTO_7580 ?AUTO_7583 ?AUTO_7582 )
      ( DELIVER-PKG ?AUTO_7579 ?AUTO_7580 )
      ( DELIVER-PKG-VERIFY ?AUTO_7579 ?AUTO_7580 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7590 - OBJ
      ?AUTO_7591 - LOCATION
    )
    :vars
    (
      ?AUTO_7592 - LOCATION
      ?AUTO_7594 - CITY
      ?AUTO_7593 - TRUCK
      ?AUTO_7595 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7592 ?AUTO_7594 ) ( IN-CITY ?AUTO_7591 ?AUTO_7594 ) ( not ( = ?AUTO_7591 ?AUTO_7592 ) ) ( TRUCK-AT ?AUTO_7593 ?AUTO_7591 ) ( IN-AIRPLANE ?AUTO_7590 ?AUTO_7595 ) ( AIRPLANE-AT ?AUTO_7595 ?AUTO_7592 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7590 ?AUTO_7595 ?AUTO_7592 )
      ( DELIVER-PKG ?AUTO_7590 ?AUTO_7591 )
      ( DELIVER-PKG-VERIFY ?AUTO_7590 ?AUTO_7591 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7596 - OBJ
      ?AUTO_7597 - LOCATION
    )
    :vars
    (
      ?AUTO_7599 - LOCATION
      ?AUTO_7600 - CITY
      ?AUTO_7598 - TRUCK
      ?AUTO_7601 - AIRPLANE
      ?AUTO_7602 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7599 ?AUTO_7600 ) ( IN-CITY ?AUTO_7597 ?AUTO_7600 ) ( not ( = ?AUTO_7597 ?AUTO_7599 ) ) ( TRUCK-AT ?AUTO_7598 ?AUTO_7597 ) ( IN-AIRPLANE ?AUTO_7596 ?AUTO_7601 ) ( AIRPORT ?AUTO_7602 ) ( AIRPORT ?AUTO_7599 ) ( AIRPLANE-AT ?AUTO_7601 ?AUTO_7602 ) ( not ( = ?AUTO_7602 ?AUTO_7599 ) ) ( not ( = ?AUTO_7597 ?AUTO_7602 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7601 ?AUTO_7602 ?AUTO_7599 )
      ( DELIVER-PKG ?AUTO_7596 ?AUTO_7597 )
      ( DELIVER-PKG-VERIFY ?AUTO_7596 ?AUTO_7597 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7607 - OBJ
      ?AUTO_7608 - LOCATION
    )
    :vars
    (
      ?AUTO_7610 - LOCATION
      ?AUTO_7613 - CITY
      ?AUTO_7609 - TRUCK
      ?AUTO_7612 - LOCATION
      ?AUTO_7611 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7610 ?AUTO_7613 ) ( IN-CITY ?AUTO_7608 ?AUTO_7613 ) ( not ( = ?AUTO_7608 ?AUTO_7610 ) ) ( TRUCK-AT ?AUTO_7609 ?AUTO_7608 ) ( AIRPORT ?AUTO_7612 ) ( AIRPORT ?AUTO_7610 ) ( AIRPLANE-AT ?AUTO_7611 ?AUTO_7612 ) ( not ( = ?AUTO_7612 ?AUTO_7610 ) ) ( not ( = ?AUTO_7608 ?AUTO_7612 ) ) ( OBJ-AT ?AUTO_7607 ?AUTO_7612 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7607 ?AUTO_7611 ?AUTO_7612 )
      ( DELIVER-PKG ?AUTO_7607 ?AUTO_7608 )
      ( DELIVER-PKG-VERIFY ?AUTO_7607 ?AUTO_7608 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7614 - OBJ
      ?AUTO_7615 - LOCATION
    )
    :vars
    (
      ?AUTO_7617 - LOCATION
      ?AUTO_7619 - CITY
      ?AUTO_7616 - TRUCK
      ?AUTO_7620 - LOCATION
      ?AUTO_7618 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7617 ?AUTO_7619 ) ( IN-CITY ?AUTO_7615 ?AUTO_7619 ) ( not ( = ?AUTO_7615 ?AUTO_7617 ) ) ( TRUCK-AT ?AUTO_7616 ?AUTO_7615 ) ( AIRPORT ?AUTO_7620 ) ( AIRPORT ?AUTO_7617 ) ( not ( = ?AUTO_7620 ?AUTO_7617 ) ) ( not ( = ?AUTO_7615 ?AUTO_7620 ) ) ( OBJ-AT ?AUTO_7614 ?AUTO_7620 ) ( AIRPLANE-AT ?AUTO_7618 ?AUTO_7617 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7618 ?AUTO_7617 ?AUTO_7620 )
      ( DELIVER-PKG ?AUTO_7614 ?AUTO_7615 )
      ( DELIVER-PKG-VERIFY ?AUTO_7614 ?AUTO_7615 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7635 - OBJ
      ?AUTO_7636 - LOCATION
    )
    :vars
    (
      ?AUTO_7639 - LOCATION
      ?AUTO_7637 - CITY
      ?AUTO_7638 - LOCATION
      ?AUTO_7641 - AIRPLANE
      ?AUTO_7640 - TRUCK
      ?AUTO_7642 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7639 ?AUTO_7637 ) ( IN-CITY ?AUTO_7636 ?AUTO_7637 ) ( not ( = ?AUTO_7636 ?AUTO_7639 ) ) ( AIRPORT ?AUTO_7638 ) ( AIRPORT ?AUTO_7639 ) ( not ( = ?AUTO_7638 ?AUTO_7639 ) ) ( not ( = ?AUTO_7636 ?AUTO_7638 ) ) ( OBJ-AT ?AUTO_7635 ?AUTO_7638 ) ( AIRPLANE-AT ?AUTO_7641 ?AUTO_7639 ) ( TRUCK-AT ?AUTO_7640 ?AUTO_7642 ) ( IN-CITY ?AUTO_7642 ?AUTO_7637 ) ( not ( = ?AUTO_7636 ?AUTO_7642 ) ) ( not ( = ?AUTO_7639 ?AUTO_7642 ) ) ( not ( = ?AUTO_7638 ?AUTO_7642 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7640 ?AUTO_7642 ?AUTO_7636 ?AUTO_7637 )
      ( DELIVER-PKG ?AUTO_7635 ?AUTO_7636 )
      ( DELIVER-PKG-VERIFY ?AUTO_7635 ?AUTO_7636 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7653 - OBJ
      ?AUTO_7654 - LOCATION
    )
    :vars
    (
      ?AUTO_7659 - LOCATION
      ?AUTO_7658 - CITY
      ?AUTO_7657 - LOCATION
      ?AUTO_7660 - AIRPLANE
      ?AUTO_7655 - TRUCK
      ?AUTO_7656 - LOCATION
      ?AUTO_7661 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7659 ?AUTO_7658 ) ( IN-CITY ?AUTO_7654 ?AUTO_7658 ) ( not ( = ?AUTO_7654 ?AUTO_7659 ) ) ( AIRPORT ?AUTO_7657 ) ( AIRPORT ?AUTO_7659 ) ( not ( = ?AUTO_7657 ?AUTO_7659 ) ) ( not ( = ?AUTO_7654 ?AUTO_7657 ) ) ( AIRPLANE-AT ?AUTO_7660 ?AUTO_7659 ) ( TRUCK-AT ?AUTO_7655 ?AUTO_7656 ) ( IN-CITY ?AUTO_7656 ?AUTO_7658 ) ( not ( = ?AUTO_7654 ?AUTO_7656 ) ) ( not ( = ?AUTO_7659 ?AUTO_7656 ) ) ( not ( = ?AUTO_7657 ?AUTO_7656 ) ) ( TRUCK-AT ?AUTO_7661 ?AUTO_7657 ) ( IN-TRUCK ?AUTO_7653 ?AUTO_7661 ) ( not ( = ?AUTO_7655 ?AUTO_7661 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7653 ?AUTO_7661 ?AUTO_7657 )
      ( DELIVER-PKG ?AUTO_7653 ?AUTO_7654 )
      ( DELIVER-PKG-VERIFY ?AUTO_7653 ?AUTO_7654 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7662 - OBJ
      ?AUTO_7663 - LOCATION
    )
    :vars
    (
      ?AUTO_7668 - LOCATION
      ?AUTO_7667 - CITY
      ?AUTO_7666 - LOCATION
      ?AUTO_7669 - AIRPLANE
      ?AUTO_7665 - TRUCK
      ?AUTO_7664 - LOCATION
      ?AUTO_7670 - TRUCK
      ?AUTO_7671 - LOCATION
      ?AUTO_7672 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7668 ?AUTO_7667 ) ( IN-CITY ?AUTO_7663 ?AUTO_7667 ) ( not ( = ?AUTO_7663 ?AUTO_7668 ) ) ( AIRPORT ?AUTO_7666 ) ( AIRPORT ?AUTO_7668 ) ( not ( = ?AUTO_7666 ?AUTO_7668 ) ) ( not ( = ?AUTO_7663 ?AUTO_7666 ) ) ( AIRPLANE-AT ?AUTO_7669 ?AUTO_7668 ) ( TRUCK-AT ?AUTO_7665 ?AUTO_7664 ) ( IN-CITY ?AUTO_7664 ?AUTO_7667 ) ( not ( = ?AUTO_7663 ?AUTO_7664 ) ) ( not ( = ?AUTO_7668 ?AUTO_7664 ) ) ( not ( = ?AUTO_7666 ?AUTO_7664 ) ) ( IN-TRUCK ?AUTO_7662 ?AUTO_7670 ) ( not ( = ?AUTO_7665 ?AUTO_7670 ) ) ( TRUCK-AT ?AUTO_7670 ?AUTO_7671 ) ( IN-CITY ?AUTO_7671 ?AUTO_7672 ) ( IN-CITY ?AUTO_7666 ?AUTO_7672 ) ( not ( = ?AUTO_7666 ?AUTO_7671 ) ) ( not ( = ?AUTO_7663 ?AUTO_7671 ) ) ( not ( = ?AUTO_7668 ?AUTO_7671 ) ) ( not ( = ?AUTO_7667 ?AUTO_7672 ) ) ( not ( = ?AUTO_7664 ?AUTO_7671 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7670 ?AUTO_7671 ?AUTO_7666 ?AUTO_7672 )
      ( DELIVER-PKG ?AUTO_7662 ?AUTO_7663 )
      ( DELIVER-PKG-VERIFY ?AUTO_7662 ?AUTO_7663 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7673 - OBJ
      ?AUTO_7674 - LOCATION
    )
    :vars
    (
      ?AUTO_7677 - LOCATION
      ?AUTO_7681 - CITY
      ?AUTO_7680 - LOCATION
      ?AUTO_7682 - AIRPLANE
      ?AUTO_7675 - TRUCK
      ?AUTO_7676 - LOCATION
      ?AUTO_7683 - TRUCK
      ?AUTO_7679 - LOCATION
      ?AUTO_7678 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7677 ?AUTO_7681 ) ( IN-CITY ?AUTO_7674 ?AUTO_7681 ) ( not ( = ?AUTO_7674 ?AUTO_7677 ) ) ( AIRPORT ?AUTO_7680 ) ( AIRPORT ?AUTO_7677 ) ( not ( = ?AUTO_7680 ?AUTO_7677 ) ) ( not ( = ?AUTO_7674 ?AUTO_7680 ) ) ( AIRPLANE-AT ?AUTO_7682 ?AUTO_7677 ) ( TRUCK-AT ?AUTO_7675 ?AUTO_7676 ) ( IN-CITY ?AUTO_7676 ?AUTO_7681 ) ( not ( = ?AUTO_7674 ?AUTO_7676 ) ) ( not ( = ?AUTO_7677 ?AUTO_7676 ) ) ( not ( = ?AUTO_7680 ?AUTO_7676 ) ) ( not ( = ?AUTO_7675 ?AUTO_7683 ) ) ( TRUCK-AT ?AUTO_7683 ?AUTO_7679 ) ( IN-CITY ?AUTO_7679 ?AUTO_7678 ) ( IN-CITY ?AUTO_7680 ?AUTO_7678 ) ( not ( = ?AUTO_7680 ?AUTO_7679 ) ) ( not ( = ?AUTO_7674 ?AUTO_7679 ) ) ( not ( = ?AUTO_7677 ?AUTO_7679 ) ) ( not ( = ?AUTO_7681 ?AUTO_7678 ) ) ( not ( = ?AUTO_7676 ?AUTO_7679 ) ) ( OBJ-AT ?AUTO_7673 ?AUTO_7679 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7673 ?AUTO_7683 ?AUTO_7679 )
      ( DELIVER-PKG ?AUTO_7673 ?AUTO_7674 )
      ( DELIVER-PKG-VERIFY ?AUTO_7673 ?AUTO_7674 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7684 - OBJ
      ?AUTO_7685 - LOCATION
    )
    :vars
    (
      ?AUTO_7688 - LOCATION
      ?AUTO_7694 - CITY
      ?AUTO_7690 - LOCATION
      ?AUTO_7689 - AIRPLANE
      ?AUTO_7692 - TRUCK
      ?AUTO_7686 - LOCATION
      ?AUTO_7693 - TRUCK
      ?AUTO_7691 - LOCATION
      ?AUTO_7687 - CITY
      ?AUTO_7695 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7688 ?AUTO_7694 ) ( IN-CITY ?AUTO_7685 ?AUTO_7694 ) ( not ( = ?AUTO_7685 ?AUTO_7688 ) ) ( AIRPORT ?AUTO_7690 ) ( AIRPORT ?AUTO_7688 ) ( not ( = ?AUTO_7690 ?AUTO_7688 ) ) ( not ( = ?AUTO_7685 ?AUTO_7690 ) ) ( AIRPLANE-AT ?AUTO_7689 ?AUTO_7688 ) ( TRUCK-AT ?AUTO_7692 ?AUTO_7686 ) ( IN-CITY ?AUTO_7686 ?AUTO_7694 ) ( not ( = ?AUTO_7685 ?AUTO_7686 ) ) ( not ( = ?AUTO_7688 ?AUTO_7686 ) ) ( not ( = ?AUTO_7690 ?AUTO_7686 ) ) ( not ( = ?AUTO_7692 ?AUTO_7693 ) ) ( IN-CITY ?AUTO_7691 ?AUTO_7687 ) ( IN-CITY ?AUTO_7690 ?AUTO_7687 ) ( not ( = ?AUTO_7690 ?AUTO_7691 ) ) ( not ( = ?AUTO_7685 ?AUTO_7691 ) ) ( not ( = ?AUTO_7688 ?AUTO_7691 ) ) ( not ( = ?AUTO_7694 ?AUTO_7687 ) ) ( not ( = ?AUTO_7686 ?AUTO_7691 ) ) ( OBJ-AT ?AUTO_7684 ?AUTO_7691 ) ( TRUCK-AT ?AUTO_7693 ?AUTO_7695 ) ( IN-CITY ?AUTO_7695 ?AUTO_7687 ) ( not ( = ?AUTO_7691 ?AUTO_7695 ) ) ( not ( = ?AUTO_7685 ?AUTO_7695 ) ) ( not ( = ?AUTO_7688 ?AUTO_7695 ) ) ( not ( = ?AUTO_7690 ?AUTO_7695 ) ) ( not ( = ?AUTO_7686 ?AUTO_7695 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7693 ?AUTO_7695 ?AUTO_7691 ?AUTO_7687 )
      ( DELIVER-PKG ?AUTO_7684 ?AUTO_7685 )
      ( DELIVER-PKG-VERIFY ?AUTO_7684 ?AUTO_7685 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7698 - OBJ
      ?AUTO_7699 - LOCATION
    )
    :vars
    (
      ?AUTO_7700 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7698 ?AUTO_7700 ) ( AIRPLANE-AT ?AUTO_7700 ?AUTO_7699 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7698 ?AUTO_7700 ?AUTO_7699 )
      ( DELIVER-PKG-VERIFY ?AUTO_7698 ?AUTO_7699 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7701 - OBJ
      ?AUTO_7702 - LOCATION
    )
    :vars
    (
      ?AUTO_7703 - AIRPLANE
      ?AUTO_7704 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7701 ?AUTO_7703 ) ( AIRPORT ?AUTO_7704 ) ( AIRPORT ?AUTO_7702 ) ( AIRPLANE-AT ?AUTO_7703 ?AUTO_7704 ) ( not ( = ?AUTO_7704 ?AUTO_7702 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7703 ?AUTO_7704 ?AUTO_7702 )
      ( DELIVER-PKG ?AUTO_7701 ?AUTO_7702 )
      ( DELIVER-PKG-VERIFY ?AUTO_7701 ?AUTO_7702 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7705 - OBJ
      ?AUTO_7706 - LOCATION
    )
    :vars
    (
      ?AUTO_7708 - LOCATION
      ?AUTO_7707 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7708 ) ( AIRPORT ?AUTO_7706 ) ( AIRPLANE-AT ?AUTO_7707 ?AUTO_7708 ) ( not ( = ?AUTO_7708 ?AUTO_7706 ) ) ( OBJ-AT ?AUTO_7705 ?AUTO_7708 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7705 ?AUTO_7707 ?AUTO_7708 )
      ( DELIVER-PKG ?AUTO_7705 ?AUTO_7706 )
      ( DELIVER-PKG-VERIFY ?AUTO_7705 ?AUTO_7706 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7709 - OBJ
      ?AUTO_7710 - LOCATION
    )
    :vars
    (
      ?AUTO_7712 - LOCATION
      ?AUTO_7711 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7712 ) ( AIRPORT ?AUTO_7710 ) ( not ( = ?AUTO_7712 ?AUTO_7710 ) ) ( OBJ-AT ?AUTO_7709 ?AUTO_7712 ) ( AIRPLANE-AT ?AUTO_7711 ?AUTO_7710 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7711 ?AUTO_7710 ?AUTO_7712 )
      ( DELIVER-PKG ?AUTO_7709 ?AUTO_7710 )
      ( DELIVER-PKG-VERIFY ?AUTO_7709 ?AUTO_7710 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7725 - OBJ
      ?AUTO_7726 - LOCATION
    )
    :vars
    (
      ?AUTO_7727 - LOCATION
      ?AUTO_7728 - AIRPLANE
      ?AUTO_7729 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7727 ) ( AIRPORT ?AUTO_7726 ) ( not ( = ?AUTO_7727 ?AUTO_7726 ) ) ( AIRPLANE-AT ?AUTO_7728 ?AUTO_7726 ) ( TRUCK-AT ?AUTO_7729 ?AUTO_7727 ) ( IN-TRUCK ?AUTO_7725 ?AUTO_7729 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7725 ?AUTO_7729 ?AUTO_7727 )
      ( DELIVER-PKG ?AUTO_7725 ?AUTO_7726 )
      ( DELIVER-PKG-VERIFY ?AUTO_7725 ?AUTO_7726 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7730 - OBJ
      ?AUTO_7731 - LOCATION
    )
    :vars
    (
      ?AUTO_7732 - LOCATION
      ?AUTO_7733 - AIRPLANE
      ?AUTO_7734 - TRUCK
      ?AUTO_7735 - LOCATION
      ?AUTO_7736 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7732 ) ( AIRPORT ?AUTO_7731 ) ( not ( = ?AUTO_7732 ?AUTO_7731 ) ) ( AIRPLANE-AT ?AUTO_7733 ?AUTO_7731 ) ( IN-TRUCK ?AUTO_7730 ?AUTO_7734 ) ( TRUCK-AT ?AUTO_7734 ?AUTO_7735 ) ( IN-CITY ?AUTO_7735 ?AUTO_7736 ) ( IN-CITY ?AUTO_7732 ?AUTO_7736 ) ( not ( = ?AUTO_7732 ?AUTO_7735 ) ) ( not ( = ?AUTO_7731 ?AUTO_7735 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7734 ?AUTO_7735 ?AUTO_7732 ?AUTO_7736 )
      ( DELIVER-PKG ?AUTO_7730 ?AUTO_7731 )
      ( DELIVER-PKG-VERIFY ?AUTO_7730 ?AUTO_7731 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7741 - OBJ
      ?AUTO_7742 - LOCATION
    )
    :vars
    (
      ?AUTO_7745 - LOCATION
      ?AUTO_7744 - TRUCK
      ?AUTO_7743 - LOCATION
      ?AUTO_7746 - CITY
      ?AUTO_7747 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7745 ) ( AIRPORT ?AUTO_7742 ) ( not ( = ?AUTO_7745 ?AUTO_7742 ) ) ( IN-TRUCK ?AUTO_7741 ?AUTO_7744 ) ( TRUCK-AT ?AUTO_7744 ?AUTO_7743 ) ( IN-CITY ?AUTO_7743 ?AUTO_7746 ) ( IN-CITY ?AUTO_7745 ?AUTO_7746 ) ( not ( = ?AUTO_7745 ?AUTO_7743 ) ) ( not ( = ?AUTO_7742 ?AUTO_7743 ) ) ( AIRPLANE-AT ?AUTO_7747 ?AUTO_7745 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7747 ?AUTO_7745 ?AUTO_7742 )
      ( DELIVER-PKG ?AUTO_7741 ?AUTO_7742 )
      ( DELIVER-PKG-VERIFY ?AUTO_7741 ?AUTO_7742 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7750 - OBJ
      ?AUTO_7751 - LOCATION
    )
    :vars
    (
      ?AUTO_7756 - LOCATION
      ?AUTO_7753 - TRUCK
      ?AUTO_7754 - LOCATION
      ?AUTO_7752 - CITY
      ?AUTO_7757 - LOCATION
      ?AUTO_7755 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7756 ) ( AIRPORT ?AUTO_7751 ) ( not ( = ?AUTO_7756 ?AUTO_7751 ) ) ( IN-TRUCK ?AUTO_7750 ?AUTO_7753 ) ( TRUCK-AT ?AUTO_7753 ?AUTO_7754 ) ( IN-CITY ?AUTO_7754 ?AUTO_7752 ) ( IN-CITY ?AUTO_7756 ?AUTO_7752 ) ( not ( = ?AUTO_7756 ?AUTO_7754 ) ) ( not ( = ?AUTO_7751 ?AUTO_7754 ) ) ( AIRPORT ?AUTO_7757 ) ( AIRPLANE-AT ?AUTO_7755 ?AUTO_7757 ) ( not ( = ?AUTO_7757 ?AUTO_7756 ) ) ( not ( = ?AUTO_7751 ?AUTO_7757 ) ) ( not ( = ?AUTO_7754 ?AUTO_7757 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7755 ?AUTO_7757 ?AUTO_7756 )
      ( DELIVER-PKG ?AUTO_7750 ?AUTO_7751 )
      ( DELIVER-PKG-VERIFY ?AUTO_7750 ?AUTO_7751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7786 - OBJ
      ?AUTO_7787 - LOCATION
    )
    :vars
    (
      ?AUTO_7789 - LOCATION
      ?AUTO_7788 - TRUCK
      ?AUTO_7790 - LOCATION
      ?AUTO_7791 - CITY
      ?AUTO_7792 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7789 ) ( AIRPORT ?AUTO_7787 ) ( not ( = ?AUTO_7789 ?AUTO_7787 ) ) ( TRUCK-AT ?AUTO_7788 ?AUTO_7790 ) ( IN-CITY ?AUTO_7790 ?AUTO_7791 ) ( IN-CITY ?AUTO_7789 ?AUTO_7791 ) ( not ( = ?AUTO_7789 ?AUTO_7790 ) ) ( not ( = ?AUTO_7787 ?AUTO_7790 ) ) ( AIRPLANE-AT ?AUTO_7792 ?AUTO_7789 ) ( OBJ-AT ?AUTO_7786 ?AUTO_7790 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7786 ?AUTO_7788 ?AUTO_7790 )
      ( DELIVER-PKG ?AUTO_7786 ?AUTO_7787 )
      ( DELIVER-PKG-VERIFY ?AUTO_7786 ?AUTO_7787 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7793 - OBJ
      ?AUTO_7794 - LOCATION
    )
    :vars
    (
      ?AUTO_7798 - LOCATION
      ?AUTO_7795 - LOCATION
      ?AUTO_7797 - CITY
      ?AUTO_7796 - AIRPLANE
      ?AUTO_7799 - TRUCK
      ?AUTO_7800 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7798 ) ( AIRPORT ?AUTO_7794 ) ( not ( = ?AUTO_7798 ?AUTO_7794 ) ) ( IN-CITY ?AUTO_7795 ?AUTO_7797 ) ( IN-CITY ?AUTO_7798 ?AUTO_7797 ) ( not ( = ?AUTO_7798 ?AUTO_7795 ) ) ( not ( = ?AUTO_7794 ?AUTO_7795 ) ) ( AIRPLANE-AT ?AUTO_7796 ?AUTO_7798 ) ( OBJ-AT ?AUTO_7793 ?AUTO_7795 ) ( TRUCK-AT ?AUTO_7799 ?AUTO_7800 ) ( IN-CITY ?AUTO_7800 ?AUTO_7797 ) ( not ( = ?AUTO_7795 ?AUTO_7800 ) ) ( not ( = ?AUTO_7794 ?AUTO_7800 ) ) ( not ( = ?AUTO_7798 ?AUTO_7800 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7799 ?AUTO_7800 ?AUTO_7795 ?AUTO_7797 )
      ( DELIVER-PKG ?AUTO_7793 ?AUTO_7794 )
      ( DELIVER-PKG-VERIFY ?AUTO_7793 ?AUTO_7794 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7813 - OBJ
      ?AUTO_7814 - LOCATION
    )
    :vars
    (
      ?AUTO_7815 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7815 ?AUTO_7814 ) ( IN-TRUCK ?AUTO_7813 ?AUTO_7815 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7813 ?AUTO_7815 ?AUTO_7814 )
      ( DELIVER-PKG-VERIFY ?AUTO_7813 ?AUTO_7814 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7816 - OBJ
      ?AUTO_7817 - LOCATION
    )
    :vars
    (
      ?AUTO_7818 - TRUCK
      ?AUTO_7819 - LOCATION
      ?AUTO_7820 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7816 ?AUTO_7818 ) ( TRUCK-AT ?AUTO_7818 ?AUTO_7819 ) ( IN-CITY ?AUTO_7819 ?AUTO_7820 ) ( IN-CITY ?AUTO_7817 ?AUTO_7820 ) ( not ( = ?AUTO_7817 ?AUTO_7819 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7818 ?AUTO_7819 ?AUTO_7817 ?AUTO_7820 )
      ( DELIVER-PKG ?AUTO_7816 ?AUTO_7817 )
      ( DELIVER-PKG-VERIFY ?AUTO_7816 ?AUTO_7817 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7821 - OBJ
      ?AUTO_7822 - LOCATION
    )
    :vars
    (
      ?AUTO_7823 - TRUCK
      ?AUTO_7824 - LOCATION
      ?AUTO_7825 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_7823 ?AUTO_7824 ) ( IN-CITY ?AUTO_7824 ?AUTO_7825 ) ( IN-CITY ?AUTO_7822 ?AUTO_7825 ) ( not ( = ?AUTO_7822 ?AUTO_7824 ) ) ( OBJ-AT ?AUTO_7821 ?AUTO_7824 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7821 ?AUTO_7823 ?AUTO_7824 )
      ( DELIVER-PKG ?AUTO_7821 ?AUTO_7822 )
      ( DELIVER-PKG-VERIFY ?AUTO_7821 ?AUTO_7822 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7826 - OBJ
      ?AUTO_7827 - LOCATION
    )
    :vars
    (
      ?AUTO_7828 - LOCATION
      ?AUTO_7830 - CITY
      ?AUTO_7829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7828 ?AUTO_7830 ) ( IN-CITY ?AUTO_7827 ?AUTO_7830 ) ( not ( = ?AUTO_7827 ?AUTO_7828 ) ) ( OBJ-AT ?AUTO_7826 ?AUTO_7828 ) ( TRUCK-AT ?AUTO_7829 ?AUTO_7827 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7829 ?AUTO_7827 ?AUTO_7828 ?AUTO_7830 )
      ( DELIVER-PKG ?AUTO_7826 ?AUTO_7827 )
      ( DELIVER-PKG-VERIFY ?AUTO_7826 ?AUTO_7827 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7859 - OBJ
      ?AUTO_7860 - LOCATION
    )
    :vars
    (
      ?AUTO_7861 - LOCATION
      ?AUTO_7863 - CITY
      ?AUTO_7862 - TRUCK
      ?AUTO_7864 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7861 ?AUTO_7863 ) ( IN-CITY ?AUTO_7860 ?AUTO_7863 ) ( not ( = ?AUTO_7860 ?AUTO_7861 ) ) ( OBJ-AT ?AUTO_7859 ?AUTO_7861 ) ( TRUCK-AT ?AUTO_7862 ?AUTO_7864 ) ( IN-CITY ?AUTO_7864 ?AUTO_7863 ) ( not ( = ?AUTO_7860 ?AUTO_7864 ) ) ( not ( = ?AUTO_7861 ?AUTO_7864 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7862 ?AUTO_7864 ?AUTO_7860 ?AUTO_7863 )
      ( DELIVER-PKG ?AUTO_7859 ?AUTO_7860 )
      ( DELIVER-PKG-VERIFY ?AUTO_7859 ?AUTO_7860 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7915 - OBJ
      ?AUTO_7916 - LOCATION
    )
    :vars
    (
      ?AUTO_7917 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7915 ?AUTO_7917 ) ( AIRPLANE-AT ?AUTO_7917 ?AUTO_7916 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_7915 ?AUTO_7917 ?AUTO_7916 )
      ( DELIVER-PKG-VERIFY ?AUTO_7915 ?AUTO_7916 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7918 - OBJ
      ?AUTO_7919 - LOCATION
    )
    :vars
    (
      ?AUTO_7920 - AIRPLANE
      ?AUTO_7921 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7918 ?AUTO_7920 ) ( AIRPORT ?AUTO_7921 ) ( AIRPORT ?AUTO_7919 ) ( AIRPLANE-AT ?AUTO_7920 ?AUTO_7921 ) ( not ( = ?AUTO_7921 ?AUTO_7919 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7920 ?AUTO_7921 ?AUTO_7919 )
      ( DELIVER-PKG ?AUTO_7918 ?AUTO_7919 )
      ( DELIVER-PKG-VERIFY ?AUTO_7918 ?AUTO_7919 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7922 - OBJ
      ?AUTO_7923 - LOCATION
    )
    :vars
    (
      ?AUTO_7925 - LOCATION
      ?AUTO_7924 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7925 ) ( AIRPORT ?AUTO_7923 ) ( AIRPLANE-AT ?AUTO_7924 ?AUTO_7925 ) ( not ( = ?AUTO_7925 ?AUTO_7923 ) ) ( OBJ-AT ?AUTO_7922 ?AUTO_7925 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_7922 ?AUTO_7924 ?AUTO_7925 )
      ( DELIVER-PKG ?AUTO_7922 ?AUTO_7923 )
      ( DELIVER-PKG-VERIFY ?AUTO_7922 ?AUTO_7923 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7926 - OBJ
      ?AUTO_7927 - LOCATION
    )
    :vars
    (
      ?AUTO_7929 - LOCATION
      ?AUTO_7928 - AIRPLANE
      ?AUTO_7930 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7929 ) ( AIRPORT ?AUTO_7927 ) ( AIRPLANE-AT ?AUTO_7928 ?AUTO_7929 ) ( not ( = ?AUTO_7929 ?AUTO_7927 ) ) ( TRUCK-AT ?AUTO_7930 ?AUTO_7929 ) ( IN-TRUCK ?AUTO_7926 ?AUTO_7930 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7926 ?AUTO_7930 ?AUTO_7929 )
      ( DELIVER-PKG ?AUTO_7926 ?AUTO_7927 )
      ( DELIVER-PKG-VERIFY ?AUTO_7926 ?AUTO_7927 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7931 - OBJ
      ?AUTO_7932 - LOCATION
    )
    :vars
    (
      ?AUTO_7934 - LOCATION
      ?AUTO_7933 - AIRPLANE
      ?AUTO_7935 - TRUCK
      ?AUTO_7936 - LOCATION
      ?AUTO_7937 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7934 ) ( AIRPORT ?AUTO_7932 ) ( AIRPLANE-AT ?AUTO_7933 ?AUTO_7934 ) ( not ( = ?AUTO_7934 ?AUTO_7932 ) ) ( IN-TRUCK ?AUTO_7931 ?AUTO_7935 ) ( TRUCK-AT ?AUTO_7935 ?AUTO_7936 ) ( IN-CITY ?AUTO_7936 ?AUTO_7937 ) ( IN-CITY ?AUTO_7934 ?AUTO_7937 ) ( not ( = ?AUTO_7934 ?AUTO_7936 ) ) ( not ( = ?AUTO_7932 ?AUTO_7936 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7935 ?AUTO_7936 ?AUTO_7934 ?AUTO_7937 )
      ( DELIVER-PKG ?AUTO_7931 ?AUTO_7932 )
      ( DELIVER-PKG-VERIFY ?AUTO_7931 ?AUTO_7932 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7938 - OBJ
      ?AUTO_7939 - LOCATION
    )
    :vars
    (
      ?AUTO_7941 - LOCATION
      ?AUTO_7940 - AIRPLANE
      ?AUTO_7942 - TRUCK
      ?AUTO_7944 - LOCATION
      ?AUTO_7943 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7941 ) ( AIRPORT ?AUTO_7939 ) ( AIRPLANE-AT ?AUTO_7940 ?AUTO_7941 ) ( not ( = ?AUTO_7941 ?AUTO_7939 ) ) ( TRUCK-AT ?AUTO_7942 ?AUTO_7944 ) ( IN-CITY ?AUTO_7944 ?AUTO_7943 ) ( IN-CITY ?AUTO_7941 ?AUTO_7943 ) ( not ( = ?AUTO_7941 ?AUTO_7944 ) ) ( not ( = ?AUTO_7939 ?AUTO_7944 ) ) ( OBJ-AT ?AUTO_7938 ?AUTO_7944 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_7938 ?AUTO_7942 ?AUTO_7944 )
      ( DELIVER-PKG ?AUTO_7938 ?AUTO_7939 )
      ( DELIVER-PKG-VERIFY ?AUTO_7938 ?AUTO_7939 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7945 - OBJ
      ?AUTO_7946 - LOCATION
    )
    :vars
    (
      ?AUTO_7947 - LOCATION
      ?AUTO_7951 - AIRPLANE
      ?AUTO_7948 - LOCATION
      ?AUTO_7950 - CITY
      ?AUTO_7949 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7947 ) ( AIRPORT ?AUTO_7946 ) ( AIRPLANE-AT ?AUTO_7951 ?AUTO_7947 ) ( not ( = ?AUTO_7947 ?AUTO_7946 ) ) ( IN-CITY ?AUTO_7948 ?AUTO_7950 ) ( IN-CITY ?AUTO_7947 ?AUTO_7950 ) ( not ( = ?AUTO_7947 ?AUTO_7948 ) ) ( not ( = ?AUTO_7946 ?AUTO_7948 ) ) ( OBJ-AT ?AUTO_7945 ?AUTO_7948 ) ( TRUCK-AT ?AUTO_7949 ?AUTO_7947 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7949 ?AUTO_7947 ?AUTO_7948 ?AUTO_7950 )
      ( DELIVER-PKG ?AUTO_7945 ?AUTO_7946 )
      ( DELIVER-PKG-VERIFY ?AUTO_7945 ?AUTO_7946 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7956 - OBJ
      ?AUTO_7957 - LOCATION
    )
    :vars
    (
      ?AUTO_7962 - LOCATION
      ?AUTO_7960 - LOCATION
      ?AUTO_7959 - CITY
      ?AUTO_7958 - TRUCK
      ?AUTO_7963 - LOCATION
      ?AUTO_7961 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7962 ) ( AIRPORT ?AUTO_7957 ) ( not ( = ?AUTO_7962 ?AUTO_7957 ) ) ( IN-CITY ?AUTO_7960 ?AUTO_7959 ) ( IN-CITY ?AUTO_7962 ?AUTO_7959 ) ( not ( = ?AUTO_7962 ?AUTO_7960 ) ) ( not ( = ?AUTO_7957 ?AUTO_7960 ) ) ( OBJ-AT ?AUTO_7956 ?AUTO_7960 ) ( TRUCK-AT ?AUTO_7958 ?AUTO_7962 ) ( AIRPORT ?AUTO_7963 ) ( AIRPLANE-AT ?AUTO_7961 ?AUTO_7963 ) ( not ( = ?AUTO_7963 ?AUTO_7962 ) ) ( not ( = ?AUTO_7957 ?AUTO_7963 ) ) ( not ( = ?AUTO_7960 ?AUTO_7963 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7961 ?AUTO_7963 ?AUTO_7962 )
      ( DELIVER-PKG ?AUTO_7956 ?AUTO_7957 )
      ( DELIVER-PKG-VERIFY ?AUTO_7956 ?AUTO_7957 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8012 - OBJ
      ?AUTO_8013 - LOCATION
    )
    :vars
    (
      ?AUTO_8019 - LOCATION
      ?AUTO_8017 - LOCATION
      ?AUTO_8015 - CITY
      ?AUTO_8014 - LOCATION
      ?AUTO_8018 - AIRPLANE
      ?AUTO_8016 - TRUCK
      ?AUTO_8020 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8019 ) ( AIRPORT ?AUTO_8013 ) ( not ( = ?AUTO_8019 ?AUTO_8013 ) ) ( IN-CITY ?AUTO_8017 ?AUTO_8015 ) ( IN-CITY ?AUTO_8019 ?AUTO_8015 ) ( not ( = ?AUTO_8019 ?AUTO_8017 ) ) ( not ( = ?AUTO_8013 ?AUTO_8017 ) ) ( OBJ-AT ?AUTO_8012 ?AUTO_8017 ) ( AIRPORT ?AUTO_8014 ) ( AIRPLANE-AT ?AUTO_8018 ?AUTO_8014 ) ( not ( = ?AUTO_8014 ?AUTO_8019 ) ) ( not ( = ?AUTO_8013 ?AUTO_8014 ) ) ( not ( = ?AUTO_8017 ?AUTO_8014 ) ) ( TRUCK-AT ?AUTO_8016 ?AUTO_8020 ) ( IN-CITY ?AUTO_8020 ?AUTO_8015 ) ( not ( = ?AUTO_8019 ?AUTO_8020 ) ) ( not ( = ?AUTO_8013 ?AUTO_8020 ) ) ( not ( = ?AUTO_8017 ?AUTO_8020 ) ) ( not ( = ?AUTO_8014 ?AUTO_8020 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8016 ?AUTO_8020 ?AUTO_8019 ?AUTO_8015 )
      ( DELIVER-PKG ?AUTO_8012 ?AUTO_8013 )
      ( DELIVER-PKG-VERIFY ?AUTO_8012 ?AUTO_8013 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8045 - OBJ
      ?AUTO_8046 - LOCATION
    )
    :vars
    (
      ?AUTO_8047 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8045 ?AUTO_8047 ) ( AIRPLANE-AT ?AUTO_8047 ?AUTO_8046 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8045 ?AUTO_8047 ?AUTO_8046 )
      ( DELIVER-PKG-VERIFY ?AUTO_8045 ?AUTO_8046 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8048 - OBJ
      ?AUTO_8049 - LOCATION
    )
    :vars
    (
      ?AUTO_8050 - AIRPLANE
      ?AUTO_8051 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8048 ?AUTO_8050 ) ( AIRPORT ?AUTO_8051 ) ( AIRPORT ?AUTO_8049 ) ( AIRPLANE-AT ?AUTO_8050 ?AUTO_8051 ) ( not ( = ?AUTO_8051 ?AUTO_8049 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8050 ?AUTO_8051 ?AUTO_8049 )
      ( DELIVER-PKG ?AUTO_8048 ?AUTO_8049 )
      ( DELIVER-PKG-VERIFY ?AUTO_8048 ?AUTO_8049 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8054 - OBJ
      ?AUTO_8055 - LOCATION
    )
    :vars
    (
      ?AUTO_8057 - LOCATION
      ?AUTO_8056 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8057 ) ( AIRPORT ?AUTO_8055 ) ( AIRPLANE-AT ?AUTO_8056 ?AUTO_8057 ) ( not ( = ?AUTO_8057 ?AUTO_8055 ) ) ( OBJ-AT ?AUTO_8054 ?AUTO_8057 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8054 ?AUTO_8056 ?AUTO_8057 )
      ( DELIVER-PKG ?AUTO_8054 ?AUTO_8055 )
      ( DELIVER-PKG-VERIFY ?AUTO_8054 ?AUTO_8055 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8058 - OBJ
      ?AUTO_8059 - LOCATION
    )
    :vars
    (
      ?AUTO_8061 - LOCATION
      ?AUTO_8062 - LOCATION
      ?AUTO_8060 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8061 ) ( AIRPORT ?AUTO_8059 ) ( not ( = ?AUTO_8061 ?AUTO_8059 ) ) ( OBJ-AT ?AUTO_8058 ?AUTO_8061 ) ( AIRPORT ?AUTO_8062 ) ( AIRPLANE-AT ?AUTO_8060 ?AUTO_8062 ) ( not ( = ?AUTO_8062 ?AUTO_8061 ) ) ( not ( = ?AUTO_8059 ?AUTO_8062 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8060 ?AUTO_8062 ?AUTO_8061 )
      ( DELIVER-PKG ?AUTO_8058 ?AUTO_8059 )
      ( DELIVER-PKG-VERIFY ?AUTO_8058 ?AUTO_8059 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8065 - OBJ
      ?AUTO_8066 - LOCATION
    )
    :vars
    (
      ?AUTO_8069 - LOCATION
      ?AUTO_8067 - LOCATION
      ?AUTO_8068 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8069 ) ( AIRPORT ?AUTO_8066 ) ( not ( = ?AUTO_8069 ?AUTO_8066 ) ) ( OBJ-AT ?AUTO_8065 ?AUTO_8069 ) ( AIRPORT ?AUTO_8067 ) ( not ( = ?AUTO_8067 ?AUTO_8069 ) ) ( not ( = ?AUTO_8066 ?AUTO_8067 ) ) ( AIRPLANE-AT ?AUTO_8068 ?AUTO_8066 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8068 ?AUTO_8066 ?AUTO_8067 )
      ( DELIVER-PKG ?AUTO_8065 ?AUTO_8066 )
      ( DELIVER-PKG-VERIFY ?AUTO_8065 ?AUTO_8066 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8100 - OBJ
      ?AUTO_8101 - LOCATION
    )
    :vars
    (
      ?AUTO_8104 - LOCATION
      ?AUTO_8103 - LOCATION
      ?AUTO_8102 - AIRPLANE
      ?AUTO_8105 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8104 ) ( AIRPORT ?AUTO_8101 ) ( not ( = ?AUTO_8104 ?AUTO_8101 ) ) ( AIRPORT ?AUTO_8103 ) ( not ( = ?AUTO_8103 ?AUTO_8104 ) ) ( not ( = ?AUTO_8101 ?AUTO_8103 ) ) ( AIRPLANE-AT ?AUTO_8102 ?AUTO_8101 ) ( TRUCK-AT ?AUTO_8105 ?AUTO_8104 ) ( IN-TRUCK ?AUTO_8100 ?AUTO_8105 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8100 ?AUTO_8105 ?AUTO_8104 )
      ( DELIVER-PKG ?AUTO_8100 ?AUTO_8101 )
      ( DELIVER-PKG-VERIFY ?AUTO_8100 ?AUTO_8101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8142 - OBJ
      ?AUTO_8143 - LOCATION
    )
    :vars
    (
      ?AUTO_8146 - LOCATION
      ?AUTO_8145 - AIRPLANE
      ?AUTO_8148 - LOCATION
      ?AUTO_8144 - CITY
      ?AUTO_8147 - TRUCK
      ?AUTO_8149 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8146 ) ( AIRPORT ?AUTO_8143 ) ( AIRPLANE-AT ?AUTO_8145 ?AUTO_8146 ) ( not ( = ?AUTO_8146 ?AUTO_8143 ) ) ( IN-CITY ?AUTO_8148 ?AUTO_8144 ) ( IN-CITY ?AUTO_8146 ?AUTO_8144 ) ( not ( = ?AUTO_8146 ?AUTO_8148 ) ) ( not ( = ?AUTO_8143 ?AUTO_8148 ) ) ( OBJ-AT ?AUTO_8142 ?AUTO_8148 ) ( TRUCK-AT ?AUTO_8147 ?AUTO_8149 ) ( IN-CITY ?AUTO_8149 ?AUTO_8144 ) ( not ( = ?AUTO_8148 ?AUTO_8149 ) ) ( not ( = ?AUTO_8143 ?AUTO_8149 ) ) ( not ( = ?AUTO_8146 ?AUTO_8149 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8147 ?AUTO_8149 ?AUTO_8148 ?AUTO_8144 )
      ( DELIVER-PKG ?AUTO_8142 ?AUTO_8143 )
      ( DELIVER-PKG-VERIFY ?AUTO_8142 ?AUTO_8143 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8170 - OBJ
      ?AUTO_8171 - LOCATION
    )
    :vars
    (
      ?AUTO_8172 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8172 ?AUTO_8171 ) ( IN-TRUCK ?AUTO_8170 ?AUTO_8172 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8170 ?AUTO_8172 ?AUTO_8171 )
      ( DELIVER-PKG-VERIFY ?AUTO_8170 ?AUTO_8171 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8177 - OBJ
      ?AUTO_8178 - LOCATION
    )
    :vars
    (
      ?AUTO_8179 - TRUCK
      ?AUTO_8180 - LOCATION
      ?AUTO_8181 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8177 ?AUTO_8179 ) ( TRUCK-AT ?AUTO_8179 ?AUTO_8180 ) ( IN-CITY ?AUTO_8180 ?AUTO_8181 ) ( IN-CITY ?AUTO_8178 ?AUTO_8181 ) ( not ( = ?AUTO_8178 ?AUTO_8180 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8179 ?AUTO_8180 ?AUTO_8178 ?AUTO_8181 )
      ( DELIVER-PKG ?AUTO_8177 ?AUTO_8178 )
      ( DELIVER-PKG-VERIFY ?AUTO_8177 ?AUTO_8178 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8210 - OBJ
      ?AUTO_8211 - LOCATION
    )
    :vars
    (
      ?AUTO_8214 - TRUCK
      ?AUTO_8213 - LOCATION
      ?AUTO_8212 - CITY
      ?AUTO_8215 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8214 ?AUTO_8213 ) ( IN-CITY ?AUTO_8213 ?AUTO_8212 ) ( IN-CITY ?AUTO_8211 ?AUTO_8212 ) ( not ( = ?AUTO_8211 ?AUTO_8213 ) ) ( IN-AIRPLANE ?AUTO_8210 ?AUTO_8215 ) ( AIRPLANE-AT ?AUTO_8215 ?AUTO_8213 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8210 ?AUTO_8215 ?AUTO_8213 )
      ( DELIVER-PKG ?AUTO_8210 ?AUTO_8211 )
      ( DELIVER-PKG-VERIFY ?AUTO_8210 ?AUTO_8211 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8216 - OBJ
      ?AUTO_8217 - LOCATION
    )
    :vars
    (
      ?AUTO_8220 - TRUCK
      ?AUTO_8219 - LOCATION
      ?AUTO_8218 - CITY
      ?AUTO_8221 - AIRPLANE
      ?AUTO_8222 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8220 ?AUTO_8219 ) ( IN-CITY ?AUTO_8219 ?AUTO_8218 ) ( IN-CITY ?AUTO_8217 ?AUTO_8218 ) ( not ( = ?AUTO_8217 ?AUTO_8219 ) ) ( IN-AIRPLANE ?AUTO_8216 ?AUTO_8221 ) ( AIRPORT ?AUTO_8222 ) ( AIRPORT ?AUTO_8219 ) ( AIRPLANE-AT ?AUTO_8221 ?AUTO_8222 ) ( not ( = ?AUTO_8222 ?AUTO_8219 ) ) ( not ( = ?AUTO_8217 ?AUTO_8222 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8221 ?AUTO_8222 ?AUTO_8219 )
      ( DELIVER-PKG ?AUTO_8216 ?AUTO_8217 )
      ( DELIVER-PKG-VERIFY ?AUTO_8216 ?AUTO_8217 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8223 - OBJ
      ?AUTO_8224 - LOCATION
    )
    :vars
    (
      ?AUTO_8228 - TRUCK
      ?AUTO_8225 - LOCATION
      ?AUTO_8227 - CITY
      ?AUTO_8229 - LOCATION
      ?AUTO_8226 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8228 ?AUTO_8225 ) ( IN-CITY ?AUTO_8225 ?AUTO_8227 ) ( IN-CITY ?AUTO_8224 ?AUTO_8227 ) ( not ( = ?AUTO_8224 ?AUTO_8225 ) ) ( AIRPORT ?AUTO_8229 ) ( AIRPORT ?AUTO_8225 ) ( AIRPLANE-AT ?AUTO_8226 ?AUTO_8229 ) ( not ( = ?AUTO_8229 ?AUTO_8225 ) ) ( not ( = ?AUTO_8224 ?AUTO_8229 ) ) ( OBJ-AT ?AUTO_8223 ?AUTO_8229 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8223 ?AUTO_8226 ?AUTO_8229 )
      ( DELIVER-PKG ?AUTO_8223 ?AUTO_8224 )
      ( DELIVER-PKG-VERIFY ?AUTO_8223 ?AUTO_8224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8230 - OBJ
      ?AUTO_8231 - LOCATION
    )
    :vars
    (
      ?AUTO_8233 - TRUCK
      ?AUTO_8235 - LOCATION
      ?AUTO_8232 - CITY
      ?AUTO_8234 - LOCATION
      ?AUTO_8236 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8233 ?AUTO_8235 ) ( IN-CITY ?AUTO_8235 ?AUTO_8232 ) ( IN-CITY ?AUTO_8231 ?AUTO_8232 ) ( not ( = ?AUTO_8231 ?AUTO_8235 ) ) ( AIRPORT ?AUTO_8234 ) ( AIRPORT ?AUTO_8235 ) ( not ( = ?AUTO_8234 ?AUTO_8235 ) ) ( not ( = ?AUTO_8231 ?AUTO_8234 ) ) ( OBJ-AT ?AUTO_8230 ?AUTO_8234 ) ( AIRPLANE-AT ?AUTO_8236 ?AUTO_8235 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8236 ?AUTO_8235 ?AUTO_8234 )
      ( DELIVER-PKG ?AUTO_8230 ?AUTO_8231 )
      ( DELIVER-PKG-VERIFY ?AUTO_8230 ?AUTO_8231 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8249 - OBJ
      ?AUTO_8250 - LOCATION
    )
    :vars
    (
      ?AUTO_8254 - TRUCK
      ?AUTO_8251 - LOCATION
      ?AUTO_8253 - CITY
      ?AUTO_8255 - LOCATION
      ?AUTO_8252 - AIRPLANE
      ?AUTO_8256 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8254 ?AUTO_8251 ) ( IN-CITY ?AUTO_8251 ?AUTO_8253 ) ( IN-CITY ?AUTO_8250 ?AUTO_8253 ) ( not ( = ?AUTO_8250 ?AUTO_8251 ) ) ( AIRPORT ?AUTO_8255 ) ( AIRPORT ?AUTO_8251 ) ( not ( = ?AUTO_8255 ?AUTO_8251 ) ) ( not ( = ?AUTO_8250 ?AUTO_8255 ) ) ( AIRPLANE-AT ?AUTO_8252 ?AUTO_8251 ) ( TRUCK-AT ?AUTO_8256 ?AUTO_8255 ) ( IN-TRUCK ?AUTO_8249 ?AUTO_8256 ) ( not ( = ?AUTO_8254 ?AUTO_8256 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8249 ?AUTO_8256 ?AUTO_8255 )
      ( DELIVER-PKG ?AUTO_8249 ?AUTO_8250 )
      ( DELIVER-PKG-VERIFY ?AUTO_8249 ?AUTO_8250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8257 - OBJ
      ?AUTO_8258 - LOCATION
    )
    :vars
    (
      ?AUTO_8263 - TRUCK
      ?AUTO_8260 - LOCATION
      ?AUTO_8262 - CITY
      ?AUTO_8264 - LOCATION
      ?AUTO_8259 - AIRPLANE
      ?AUTO_8261 - TRUCK
      ?AUTO_8265 - LOCATION
      ?AUTO_8266 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8263 ?AUTO_8260 ) ( IN-CITY ?AUTO_8260 ?AUTO_8262 ) ( IN-CITY ?AUTO_8258 ?AUTO_8262 ) ( not ( = ?AUTO_8258 ?AUTO_8260 ) ) ( AIRPORT ?AUTO_8264 ) ( AIRPORT ?AUTO_8260 ) ( not ( = ?AUTO_8264 ?AUTO_8260 ) ) ( not ( = ?AUTO_8258 ?AUTO_8264 ) ) ( AIRPLANE-AT ?AUTO_8259 ?AUTO_8260 ) ( IN-TRUCK ?AUTO_8257 ?AUTO_8261 ) ( not ( = ?AUTO_8263 ?AUTO_8261 ) ) ( TRUCK-AT ?AUTO_8261 ?AUTO_8265 ) ( IN-CITY ?AUTO_8265 ?AUTO_8266 ) ( IN-CITY ?AUTO_8264 ?AUTO_8266 ) ( not ( = ?AUTO_8264 ?AUTO_8265 ) ) ( not ( = ?AUTO_8258 ?AUTO_8265 ) ) ( not ( = ?AUTO_8260 ?AUTO_8265 ) ) ( not ( = ?AUTO_8262 ?AUTO_8266 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8261 ?AUTO_8265 ?AUTO_8264 ?AUTO_8266 )
      ( DELIVER-PKG ?AUTO_8257 ?AUTO_8258 )
      ( DELIVER-PKG-VERIFY ?AUTO_8257 ?AUTO_8258 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8269 - OBJ
      ?AUTO_8270 - LOCATION
    )
    :vars
    (
      ?AUTO_8278 - LOCATION
      ?AUTO_8271 - CITY
      ?AUTO_8276 - LOCATION
      ?AUTO_8277 - AIRPLANE
      ?AUTO_8272 - TRUCK
      ?AUTO_8275 - TRUCK
      ?AUTO_8274 - LOCATION
      ?AUTO_8273 - CITY
      ?AUTO_8279 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8278 ?AUTO_8271 ) ( IN-CITY ?AUTO_8270 ?AUTO_8271 ) ( not ( = ?AUTO_8270 ?AUTO_8278 ) ) ( AIRPORT ?AUTO_8276 ) ( AIRPORT ?AUTO_8278 ) ( not ( = ?AUTO_8276 ?AUTO_8278 ) ) ( not ( = ?AUTO_8270 ?AUTO_8276 ) ) ( AIRPLANE-AT ?AUTO_8277 ?AUTO_8278 ) ( IN-TRUCK ?AUTO_8269 ?AUTO_8272 ) ( not ( = ?AUTO_8275 ?AUTO_8272 ) ) ( TRUCK-AT ?AUTO_8272 ?AUTO_8274 ) ( IN-CITY ?AUTO_8274 ?AUTO_8273 ) ( IN-CITY ?AUTO_8276 ?AUTO_8273 ) ( not ( = ?AUTO_8276 ?AUTO_8274 ) ) ( not ( = ?AUTO_8270 ?AUTO_8274 ) ) ( not ( = ?AUTO_8278 ?AUTO_8274 ) ) ( not ( = ?AUTO_8271 ?AUTO_8273 ) ) ( TRUCK-AT ?AUTO_8275 ?AUTO_8279 ) ( IN-CITY ?AUTO_8279 ?AUTO_8271 ) ( not ( = ?AUTO_8278 ?AUTO_8279 ) ) ( not ( = ?AUTO_8270 ?AUTO_8279 ) ) ( not ( = ?AUTO_8276 ?AUTO_8279 ) ) ( not ( = ?AUTO_8274 ?AUTO_8279 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8275 ?AUTO_8279 ?AUTO_8278 ?AUTO_8271 )
      ( DELIVER-PKG ?AUTO_8269 ?AUTO_8270 )
      ( DELIVER-PKG-VERIFY ?AUTO_8269 ?AUTO_8270 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8280 - OBJ
      ?AUTO_8281 - LOCATION
    )
    :vars
    (
      ?AUTO_8287 - LOCATION
      ?AUTO_8285 - CITY
      ?AUTO_8288 - LOCATION
      ?AUTO_8284 - TRUCK
      ?AUTO_8286 - TRUCK
      ?AUTO_8289 - LOCATION
      ?AUTO_8283 - CITY
      ?AUTO_8290 - LOCATION
      ?AUTO_8282 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8287 ?AUTO_8285 ) ( IN-CITY ?AUTO_8281 ?AUTO_8285 ) ( not ( = ?AUTO_8281 ?AUTO_8287 ) ) ( AIRPORT ?AUTO_8288 ) ( AIRPORT ?AUTO_8287 ) ( not ( = ?AUTO_8288 ?AUTO_8287 ) ) ( not ( = ?AUTO_8281 ?AUTO_8288 ) ) ( IN-TRUCK ?AUTO_8280 ?AUTO_8284 ) ( not ( = ?AUTO_8286 ?AUTO_8284 ) ) ( TRUCK-AT ?AUTO_8284 ?AUTO_8289 ) ( IN-CITY ?AUTO_8289 ?AUTO_8283 ) ( IN-CITY ?AUTO_8288 ?AUTO_8283 ) ( not ( = ?AUTO_8288 ?AUTO_8289 ) ) ( not ( = ?AUTO_8281 ?AUTO_8289 ) ) ( not ( = ?AUTO_8287 ?AUTO_8289 ) ) ( not ( = ?AUTO_8285 ?AUTO_8283 ) ) ( TRUCK-AT ?AUTO_8286 ?AUTO_8290 ) ( IN-CITY ?AUTO_8290 ?AUTO_8285 ) ( not ( = ?AUTO_8287 ?AUTO_8290 ) ) ( not ( = ?AUTO_8281 ?AUTO_8290 ) ) ( not ( = ?AUTO_8288 ?AUTO_8290 ) ) ( not ( = ?AUTO_8289 ?AUTO_8290 ) ) ( AIRPLANE-AT ?AUTO_8282 ?AUTO_8288 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8282 ?AUTO_8288 ?AUTO_8287 )
      ( DELIVER-PKG ?AUTO_8280 ?AUTO_8281 )
      ( DELIVER-PKG-VERIFY ?AUTO_8280 ?AUTO_8281 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8293 - OBJ
      ?AUTO_8294 - LOCATION
    )
    :vars
    (
      ?AUTO_8302 - LOCATION
      ?AUTO_8299 - CITY
      ?AUTO_8297 - LOCATION
      ?AUTO_8300 - TRUCK
      ?AUTO_8295 - TRUCK
      ?AUTO_8301 - LOCATION
      ?AUTO_8298 - CITY
      ?AUTO_8296 - LOCATION
      ?AUTO_8304 - LOCATION
      ?AUTO_8303 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8302 ?AUTO_8299 ) ( IN-CITY ?AUTO_8294 ?AUTO_8299 ) ( not ( = ?AUTO_8294 ?AUTO_8302 ) ) ( AIRPORT ?AUTO_8297 ) ( AIRPORT ?AUTO_8302 ) ( not ( = ?AUTO_8297 ?AUTO_8302 ) ) ( not ( = ?AUTO_8294 ?AUTO_8297 ) ) ( IN-TRUCK ?AUTO_8293 ?AUTO_8300 ) ( not ( = ?AUTO_8295 ?AUTO_8300 ) ) ( TRUCK-AT ?AUTO_8300 ?AUTO_8301 ) ( IN-CITY ?AUTO_8301 ?AUTO_8298 ) ( IN-CITY ?AUTO_8297 ?AUTO_8298 ) ( not ( = ?AUTO_8297 ?AUTO_8301 ) ) ( not ( = ?AUTO_8294 ?AUTO_8301 ) ) ( not ( = ?AUTO_8302 ?AUTO_8301 ) ) ( not ( = ?AUTO_8299 ?AUTO_8298 ) ) ( TRUCK-AT ?AUTO_8295 ?AUTO_8296 ) ( IN-CITY ?AUTO_8296 ?AUTO_8299 ) ( not ( = ?AUTO_8302 ?AUTO_8296 ) ) ( not ( = ?AUTO_8294 ?AUTO_8296 ) ) ( not ( = ?AUTO_8297 ?AUTO_8296 ) ) ( not ( = ?AUTO_8301 ?AUTO_8296 ) ) ( AIRPORT ?AUTO_8304 ) ( AIRPLANE-AT ?AUTO_8303 ?AUTO_8304 ) ( not ( = ?AUTO_8304 ?AUTO_8297 ) ) ( not ( = ?AUTO_8294 ?AUTO_8304 ) ) ( not ( = ?AUTO_8302 ?AUTO_8304 ) ) ( not ( = ?AUTO_8301 ?AUTO_8304 ) ) ( not ( = ?AUTO_8296 ?AUTO_8304 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8303 ?AUTO_8304 ?AUTO_8297 )
      ( DELIVER-PKG ?AUTO_8293 ?AUTO_8294 )
      ( DELIVER-PKG-VERIFY ?AUTO_8293 ?AUTO_8294 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8333 - OBJ
      ?AUTO_8334 - LOCATION
    )
    :vars
    (
      ?AUTO_8338 - LOCATION
      ?AUTO_8336 - CITY
      ?AUTO_8342 - LOCATION
      ?AUTO_8335 - TRUCK
      ?AUTO_8341 - TRUCK
      ?AUTO_8343 - LOCATION
      ?AUTO_8337 - CITY
      ?AUTO_8339 - LOCATION
      ?AUTO_8340 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8338 ?AUTO_8336 ) ( IN-CITY ?AUTO_8334 ?AUTO_8336 ) ( not ( = ?AUTO_8334 ?AUTO_8338 ) ) ( AIRPORT ?AUTO_8342 ) ( AIRPORT ?AUTO_8338 ) ( not ( = ?AUTO_8342 ?AUTO_8338 ) ) ( not ( = ?AUTO_8334 ?AUTO_8342 ) ) ( not ( = ?AUTO_8335 ?AUTO_8341 ) ) ( TRUCK-AT ?AUTO_8341 ?AUTO_8343 ) ( IN-CITY ?AUTO_8343 ?AUTO_8337 ) ( IN-CITY ?AUTO_8342 ?AUTO_8337 ) ( not ( = ?AUTO_8342 ?AUTO_8343 ) ) ( not ( = ?AUTO_8334 ?AUTO_8343 ) ) ( not ( = ?AUTO_8338 ?AUTO_8343 ) ) ( not ( = ?AUTO_8336 ?AUTO_8337 ) ) ( TRUCK-AT ?AUTO_8335 ?AUTO_8339 ) ( IN-CITY ?AUTO_8339 ?AUTO_8336 ) ( not ( = ?AUTO_8338 ?AUTO_8339 ) ) ( not ( = ?AUTO_8334 ?AUTO_8339 ) ) ( not ( = ?AUTO_8342 ?AUTO_8339 ) ) ( not ( = ?AUTO_8343 ?AUTO_8339 ) ) ( AIRPLANE-AT ?AUTO_8340 ?AUTO_8342 ) ( OBJ-AT ?AUTO_8333 ?AUTO_8343 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8333 ?AUTO_8341 ?AUTO_8343 )
      ( DELIVER-PKG ?AUTO_8333 ?AUTO_8334 )
      ( DELIVER-PKG-VERIFY ?AUTO_8333 ?AUTO_8334 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8344 - OBJ
      ?AUTO_8345 - LOCATION
    )
    :vars
    (
      ?AUTO_8351 - LOCATION
      ?AUTO_8347 - CITY
      ?AUTO_8353 - LOCATION
      ?AUTO_8352 - TRUCK
      ?AUTO_8346 - TRUCK
      ?AUTO_8348 - LOCATION
      ?AUTO_8354 - CITY
      ?AUTO_8350 - LOCATION
      ?AUTO_8349 - AIRPLANE
      ?AUTO_8355 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8351 ?AUTO_8347 ) ( IN-CITY ?AUTO_8345 ?AUTO_8347 ) ( not ( = ?AUTO_8345 ?AUTO_8351 ) ) ( AIRPORT ?AUTO_8353 ) ( AIRPORT ?AUTO_8351 ) ( not ( = ?AUTO_8353 ?AUTO_8351 ) ) ( not ( = ?AUTO_8345 ?AUTO_8353 ) ) ( not ( = ?AUTO_8352 ?AUTO_8346 ) ) ( IN-CITY ?AUTO_8348 ?AUTO_8354 ) ( IN-CITY ?AUTO_8353 ?AUTO_8354 ) ( not ( = ?AUTO_8353 ?AUTO_8348 ) ) ( not ( = ?AUTO_8345 ?AUTO_8348 ) ) ( not ( = ?AUTO_8351 ?AUTO_8348 ) ) ( not ( = ?AUTO_8347 ?AUTO_8354 ) ) ( TRUCK-AT ?AUTO_8352 ?AUTO_8350 ) ( IN-CITY ?AUTO_8350 ?AUTO_8347 ) ( not ( = ?AUTO_8351 ?AUTO_8350 ) ) ( not ( = ?AUTO_8345 ?AUTO_8350 ) ) ( not ( = ?AUTO_8353 ?AUTO_8350 ) ) ( not ( = ?AUTO_8348 ?AUTO_8350 ) ) ( AIRPLANE-AT ?AUTO_8349 ?AUTO_8353 ) ( OBJ-AT ?AUTO_8344 ?AUTO_8348 ) ( TRUCK-AT ?AUTO_8346 ?AUTO_8355 ) ( IN-CITY ?AUTO_8355 ?AUTO_8354 ) ( not ( = ?AUTO_8348 ?AUTO_8355 ) ) ( not ( = ?AUTO_8345 ?AUTO_8355 ) ) ( not ( = ?AUTO_8351 ?AUTO_8355 ) ) ( not ( = ?AUTO_8353 ?AUTO_8355 ) ) ( not ( = ?AUTO_8350 ?AUTO_8355 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8346 ?AUTO_8355 ?AUTO_8348 ?AUTO_8354 )
      ( DELIVER-PKG ?AUTO_8344 ?AUTO_8345 )
      ( DELIVER-PKG-VERIFY ?AUTO_8344 ?AUTO_8345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8368 - OBJ
      ?AUTO_8369 - LOCATION
    )
    :vars
    (
      ?AUTO_8370 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8370 ?AUTO_8369 ) ( IN-TRUCK ?AUTO_8368 ?AUTO_8370 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8368 ?AUTO_8370 ?AUTO_8369 )
      ( DELIVER-PKG-VERIFY ?AUTO_8368 ?AUTO_8369 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8371 - OBJ
      ?AUTO_8372 - LOCATION
    )
    :vars
    (
      ?AUTO_8373 - TRUCK
      ?AUTO_8374 - LOCATION
      ?AUTO_8375 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8371 ?AUTO_8373 ) ( TRUCK-AT ?AUTO_8373 ?AUTO_8374 ) ( IN-CITY ?AUTO_8374 ?AUTO_8375 ) ( IN-CITY ?AUTO_8372 ?AUTO_8375 ) ( not ( = ?AUTO_8372 ?AUTO_8374 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8373 ?AUTO_8374 ?AUTO_8372 ?AUTO_8375 )
      ( DELIVER-PKG ?AUTO_8371 ?AUTO_8372 )
      ( DELIVER-PKG-VERIFY ?AUTO_8371 ?AUTO_8372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8384 - OBJ
      ?AUTO_8385 - LOCATION
    )
    :vars
    (
      ?AUTO_8387 - TRUCK
      ?AUTO_8388 - LOCATION
      ?AUTO_8386 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8387 ?AUTO_8388 ) ( IN-CITY ?AUTO_8388 ?AUTO_8386 ) ( IN-CITY ?AUTO_8385 ?AUTO_8386 ) ( not ( = ?AUTO_8385 ?AUTO_8388 ) ) ( OBJ-AT ?AUTO_8384 ?AUTO_8388 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8384 ?AUTO_8387 ?AUTO_8388 )
      ( DELIVER-PKG ?AUTO_8384 ?AUTO_8385 )
      ( DELIVER-PKG-VERIFY ?AUTO_8384 ?AUTO_8385 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8389 - OBJ
      ?AUTO_8390 - LOCATION
    )
    :vars
    (
      ?AUTO_8391 - TRUCK
      ?AUTO_8393 - LOCATION
      ?AUTO_8392 - CITY
      ?AUTO_8394 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8391 ?AUTO_8393 ) ( IN-CITY ?AUTO_8393 ?AUTO_8392 ) ( IN-CITY ?AUTO_8390 ?AUTO_8392 ) ( not ( = ?AUTO_8390 ?AUTO_8393 ) ) ( IN-AIRPLANE ?AUTO_8389 ?AUTO_8394 ) ( AIRPLANE-AT ?AUTO_8394 ?AUTO_8393 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8389 ?AUTO_8394 ?AUTO_8393 )
      ( DELIVER-PKG ?AUTO_8389 ?AUTO_8390 )
      ( DELIVER-PKG-VERIFY ?AUTO_8389 ?AUTO_8390 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8395 - OBJ
      ?AUTO_8396 - LOCATION
    )
    :vars
    (
      ?AUTO_8397 - TRUCK
      ?AUTO_8398 - LOCATION
      ?AUTO_8399 - CITY
      ?AUTO_8400 - AIRPLANE
      ?AUTO_8401 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8397 ?AUTO_8398 ) ( IN-CITY ?AUTO_8398 ?AUTO_8399 ) ( IN-CITY ?AUTO_8396 ?AUTO_8399 ) ( not ( = ?AUTO_8396 ?AUTO_8398 ) ) ( IN-AIRPLANE ?AUTO_8395 ?AUTO_8400 ) ( AIRPORT ?AUTO_8401 ) ( AIRPORT ?AUTO_8398 ) ( AIRPLANE-AT ?AUTO_8400 ?AUTO_8401 ) ( not ( = ?AUTO_8401 ?AUTO_8398 ) ) ( not ( = ?AUTO_8396 ?AUTO_8401 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8400 ?AUTO_8401 ?AUTO_8398 )
      ( DELIVER-PKG ?AUTO_8395 ?AUTO_8396 )
      ( DELIVER-PKG-VERIFY ?AUTO_8395 ?AUTO_8396 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8404 - OBJ
      ?AUTO_8405 - LOCATION
    )
    :vars
    (
      ?AUTO_8408 - TRUCK
      ?AUTO_8410 - LOCATION
      ?AUTO_8406 - CITY
      ?AUTO_8407 - LOCATION
      ?AUTO_8409 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8408 ?AUTO_8410 ) ( IN-CITY ?AUTO_8410 ?AUTO_8406 ) ( IN-CITY ?AUTO_8405 ?AUTO_8406 ) ( not ( = ?AUTO_8405 ?AUTO_8410 ) ) ( AIRPORT ?AUTO_8407 ) ( AIRPORT ?AUTO_8410 ) ( AIRPLANE-AT ?AUTO_8409 ?AUTO_8407 ) ( not ( = ?AUTO_8407 ?AUTO_8410 ) ) ( not ( = ?AUTO_8405 ?AUTO_8407 ) ) ( OBJ-AT ?AUTO_8404 ?AUTO_8407 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8404 ?AUTO_8409 ?AUTO_8407 )
      ( DELIVER-PKG ?AUTO_8404 ?AUTO_8405 )
      ( DELIVER-PKG-VERIFY ?AUTO_8404 ?AUTO_8405 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8411 - OBJ
      ?AUTO_8412 - LOCATION
    )
    :vars
    (
      ?AUTO_8414 - TRUCK
      ?AUTO_8416 - LOCATION
      ?AUTO_8415 - CITY
      ?AUTO_8413 - LOCATION
      ?AUTO_8418 - LOCATION
      ?AUTO_8417 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8414 ?AUTO_8416 ) ( IN-CITY ?AUTO_8416 ?AUTO_8415 ) ( IN-CITY ?AUTO_8412 ?AUTO_8415 ) ( not ( = ?AUTO_8412 ?AUTO_8416 ) ) ( AIRPORT ?AUTO_8413 ) ( AIRPORT ?AUTO_8416 ) ( not ( = ?AUTO_8413 ?AUTO_8416 ) ) ( not ( = ?AUTO_8412 ?AUTO_8413 ) ) ( OBJ-AT ?AUTO_8411 ?AUTO_8413 ) ( AIRPORT ?AUTO_8418 ) ( AIRPLANE-AT ?AUTO_8417 ?AUTO_8418 ) ( not ( = ?AUTO_8418 ?AUTO_8413 ) ) ( not ( = ?AUTO_8412 ?AUTO_8418 ) ) ( not ( = ?AUTO_8416 ?AUTO_8418 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8417 ?AUTO_8418 ?AUTO_8413 )
      ( DELIVER-PKG ?AUTO_8411 ?AUTO_8412 )
      ( DELIVER-PKG-VERIFY ?AUTO_8411 ?AUTO_8412 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8421 - OBJ
      ?AUTO_8422 - LOCATION
    )
    :vars
    (
      ?AUTO_8427 - TRUCK
      ?AUTO_8426 - LOCATION
      ?AUTO_8423 - CITY
      ?AUTO_8425 - LOCATION
      ?AUTO_8428 - LOCATION
      ?AUTO_8424 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8427 ?AUTO_8426 ) ( IN-CITY ?AUTO_8426 ?AUTO_8423 ) ( IN-CITY ?AUTO_8422 ?AUTO_8423 ) ( not ( = ?AUTO_8422 ?AUTO_8426 ) ) ( AIRPORT ?AUTO_8425 ) ( AIRPORT ?AUTO_8426 ) ( not ( = ?AUTO_8425 ?AUTO_8426 ) ) ( not ( = ?AUTO_8422 ?AUTO_8425 ) ) ( OBJ-AT ?AUTO_8421 ?AUTO_8425 ) ( AIRPORT ?AUTO_8428 ) ( not ( = ?AUTO_8428 ?AUTO_8425 ) ) ( not ( = ?AUTO_8422 ?AUTO_8428 ) ) ( not ( = ?AUTO_8426 ?AUTO_8428 ) ) ( AIRPLANE-AT ?AUTO_8424 ?AUTO_8426 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8424 ?AUTO_8426 ?AUTO_8428 )
      ( DELIVER-PKG ?AUTO_8421 ?AUTO_8422 )
      ( DELIVER-PKG-VERIFY ?AUTO_8421 ?AUTO_8422 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8433 - OBJ
      ?AUTO_8434 - LOCATION
    )
    :vars
    (
      ?AUTO_8436 - LOCATION
      ?AUTO_8439 - CITY
      ?AUTO_8438 - LOCATION
      ?AUTO_8435 - LOCATION
      ?AUTO_8437 - AIRPLANE
      ?AUTO_8440 - TRUCK
      ?AUTO_8441 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8436 ?AUTO_8439 ) ( IN-CITY ?AUTO_8434 ?AUTO_8439 ) ( not ( = ?AUTO_8434 ?AUTO_8436 ) ) ( AIRPORT ?AUTO_8438 ) ( AIRPORT ?AUTO_8436 ) ( not ( = ?AUTO_8438 ?AUTO_8436 ) ) ( not ( = ?AUTO_8434 ?AUTO_8438 ) ) ( OBJ-AT ?AUTO_8433 ?AUTO_8438 ) ( AIRPORT ?AUTO_8435 ) ( not ( = ?AUTO_8435 ?AUTO_8438 ) ) ( not ( = ?AUTO_8434 ?AUTO_8435 ) ) ( not ( = ?AUTO_8436 ?AUTO_8435 ) ) ( AIRPLANE-AT ?AUTO_8437 ?AUTO_8436 ) ( TRUCK-AT ?AUTO_8440 ?AUTO_8441 ) ( IN-CITY ?AUTO_8441 ?AUTO_8439 ) ( not ( = ?AUTO_8436 ?AUTO_8441 ) ) ( not ( = ?AUTO_8434 ?AUTO_8441 ) ) ( not ( = ?AUTO_8438 ?AUTO_8441 ) ) ( not ( = ?AUTO_8435 ?AUTO_8441 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8440 ?AUTO_8441 ?AUTO_8436 ?AUTO_8439 )
      ( DELIVER-PKG ?AUTO_8433 ?AUTO_8434 )
      ( DELIVER-PKG-VERIFY ?AUTO_8433 ?AUTO_8434 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8466 - OBJ
      ?AUTO_8467 - LOCATION
    )
    :vars
    (
      ?AUTO_8473 - TRUCK
      ?AUTO_8470 - LOCATION
      ?AUTO_8468 - CITY
      ?AUTO_8471 - LOCATION
      ?AUTO_8469 - LOCATION
      ?AUTO_8472 - AIRPLANE
      ?AUTO_8474 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8473 ?AUTO_8470 ) ( IN-CITY ?AUTO_8470 ?AUTO_8468 ) ( IN-CITY ?AUTO_8467 ?AUTO_8468 ) ( not ( = ?AUTO_8467 ?AUTO_8470 ) ) ( AIRPORT ?AUTO_8471 ) ( AIRPORT ?AUTO_8470 ) ( not ( = ?AUTO_8471 ?AUTO_8470 ) ) ( not ( = ?AUTO_8467 ?AUTO_8471 ) ) ( AIRPORT ?AUTO_8469 ) ( not ( = ?AUTO_8469 ?AUTO_8471 ) ) ( not ( = ?AUTO_8467 ?AUTO_8469 ) ) ( not ( = ?AUTO_8470 ?AUTO_8469 ) ) ( AIRPLANE-AT ?AUTO_8472 ?AUTO_8470 ) ( TRUCK-AT ?AUTO_8474 ?AUTO_8471 ) ( IN-TRUCK ?AUTO_8466 ?AUTO_8474 ) ( not ( = ?AUTO_8473 ?AUTO_8474 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8466 ?AUTO_8474 ?AUTO_8471 )
      ( DELIVER-PKG ?AUTO_8466 ?AUTO_8467 )
      ( DELIVER-PKG-VERIFY ?AUTO_8466 ?AUTO_8467 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8509 - OBJ
      ?AUTO_8510 - LOCATION
    )
    :vars
    (
      ?AUTO_8519 - LOCATION
      ?AUTO_8513 - CITY
      ?AUTO_8518 - LOCATION
      ?AUTO_8512 - TRUCK
      ?AUTO_8515 - TRUCK
      ?AUTO_8517 - LOCATION
      ?AUTO_8516 - CITY
      ?AUTO_8511 - LOCATION
      ?AUTO_8514 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8519 ?AUTO_8513 ) ( IN-CITY ?AUTO_8510 ?AUTO_8513 ) ( not ( = ?AUTO_8510 ?AUTO_8519 ) ) ( AIRPORT ?AUTO_8518 ) ( AIRPORT ?AUTO_8519 ) ( not ( = ?AUTO_8518 ?AUTO_8519 ) ) ( not ( = ?AUTO_8510 ?AUTO_8518 ) ) ( not ( = ?AUTO_8512 ?AUTO_8515 ) ) ( TRUCK-AT ?AUTO_8515 ?AUTO_8517 ) ( IN-CITY ?AUTO_8517 ?AUTO_8516 ) ( IN-CITY ?AUTO_8518 ?AUTO_8516 ) ( not ( = ?AUTO_8518 ?AUTO_8517 ) ) ( not ( = ?AUTO_8510 ?AUTO_8517 ) ) ( not ( = ?AUTO_8519 ?AUTO_8517 ) ) ( not ( = ?AUTO_8513 ?AUTO_8516 ) ) ( TRUCK-AT ?AUTO_8512 ?AUTO_8511 ) ( IN-CITY ?AUTO_8511 ?AUTO_8513 ) ( not ( = ?AUTO_8519 ?AUTO_8511 ) ) ( not ( = ?AUTO_8510 ?AUTO_8511 ) ) ( not ( = ?AUTO_8518 ?AUTO_8511 ) ) ( not ( = ?AUTO_8517 ?AUTO_8511 ) ) ( AIRPLANE-AT ?AUTO_8514 ?AUTO_8518 ) ( OBJ-AT ?AUTO_8509 ?AUTO_8517 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8509 ?AUTO_8515 ?AUTO_8517 )
      ( DELIVER-PKG ?AUTO_8509 ?AUTO_8510 )
      ( DELIVER-PKG-VERIFY ?AUTO_8509 ?AUTO_8510 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8520 - OBJ
      ?AUTO_8521 - LOCATION
    )
    :vars
    (
      ?AUTO_8529 - LOCATION
      ?AUTO_8524 - CITY
      ?AUTO_8527 - LOCATION
      ?AUTO_8522 - TRUCK
      ?AUTO_8526 - TRUCK
      ?AUTO_8530 - LOCATION
      ?AUTO_8525 - CITY
      ?AUTO_8528 - LOCATION
      ?AUTO_8523 - AIRPLANE
      ?AUTO_8531 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8529 ?AUTO_8524 ) ( IN-CITY ?AUTO_8521 ?AUTO_8524 ) ( not ( = ?AUTO_8521 ?AUTO_8529 ) ) ( AIRPORT ?AUTO_8527 ) ( AIRPORT ?AUTO_8529 ) ( not ( = ?AUTO_8527 ?AUTO_8529 ) ) ( not ( = ?AUTO_8521 ?AUTO_8527 ) ) ( not ( = ?AUTO_8522 ?AUTO_8526 ) ) ( IN-CITY ?AUTO_8530 ?AUTO_8525 ) ( IN-CITY ?AUTO_8527 ?AUTO_8525 ) ( not ( = ?AUTO_8527 ?AUTO_8530 ) ) ( not ( = ?AUTO_8521 ?AUTO_8530 ) ) ( not ( = ?AUTO_8529 ?AUTO_8530 ) ) ( not ( = ?AUTO_8524 ?AUTO_8525 ) ) ( TRUCK-AT ?AUTO_8522 ?AUTO_8528 ) ( IN-CITY ?AUTO_8528 ?AUTO_8524 ) ( not ( = ?AUTO_8529 ?AUTO_8528 ) ) ( not ( = ?AUTO_8521 ?AUTO_8528 ) ) ( not ( = ?AUTO_8527 ?AUTO_8528 ) ) ( not ( = ?AUTO_8530 ?AUTO_8528 ) ) ( AIRPLANE-AT ?AUTO_8523 ?AUTO_8527 ) ( OBJ-AT ?AUTO_8520 ?AUTO_8530 ) ( TRUCK-AT ?AUTO_8526 ?AUTO_8531 ) ( IN-CITY ?AUTO_8531 ?AUTO_8525 ) ( not ( = ?AUTO_8530 ?AUTO_8531 ) ) ( not ( = ?AUTO_8521 ?AUTO_8531 ) ) ( not ( = ?AUTO_8529 ?AUTO_8531 ) ) ( not ( = ?AUTO_8527 ?AUTO_8531 ) ) ( not ( = ?AUTO_8528 ?AUTO_8531 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8526 ?AUTO_8531 ?AUTO_8530 ?AUTO_8525 )
      ( DELIVER-PKG ?AUTO_8520 ?AUTO_8521 )
      ( DELIVER-PKG-VERIFY ?AUTO_8520 ?AUTO_8521 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8552 - OBJ
      ?AUTO_8553 - LOCATION
    )
    :vars
    (
      ?AUTO_8554 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8552 ?AUTO_8554 ) ( AIRPLANE-AT ?AUTO_8554 ?AUTO_8553 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8552 ?AUTO_8554 ?AUTO_8553 )
      ( DELIVER-PKG-VERIFY ?AUTO_8552 ?AUTO_8553 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8563 - OBJ
      ?AUTO_8564 - LOCATION
    )
    :vars
    (
      ?AUTO_8565 - AIRPLANE
      ?AUTO_8566 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8563 ?AUTO_8565 ) ( AIRPORT ?AUTO_8566 ) ( AIRPORT ?AUTO_8564 ) ( AIRPLANE-AT ?AUTO_8565 ?AUTO_8566 ) ( not ( = ?AUTO_8566 ?AUTO_8564 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8565 ?AUTO_8566 ?AUTO_8564 )
      ( DELIVER-PKG ?AUTO_8563 ?AUTO_8564 )
      ( DELIVER-PKG-VERIFY ?AUTO_8563 ?AUTO_8564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8575 - OBJ
      ?AUTO_8576 - LOCATION
    )
    :vars
    (
      ?AUTO_8577 - LOCATION
      ?AUTO_8578 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8577 ) ( AIRPORT ?AUTO_8576 ) ( AIRPLANE-AT ?AUTO_8578 ?AUTO_8577 ) ( not ( = ?AUTO_8577 ?AUTO_8576 ) ) ( OBJ-AT ?AUTO_8575 ?AUTO_8577 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8575 ?AUTO_8578 ?AUTO_8577 )
      ( DELIVER-PKG ?AUTO_8575 ?AUTO_8576 )
      ( DELIVER-PKG-VERIFY ?AUTO_8575 ?AUTO_8576 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8615 - OBJ
      ?AUTO_8616 - LOCATION
    )
    :vars
    (
      ?AUTO_8619 - LOCATION
      ?AUTO_8617 - LOCATION
      ?AUTO_8618 - AIRPLANE
      ?AUTO_8620 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8619 ) ( AIRPORT ?AUTO_8616 ) ( not ( = ?AUTO_8619 ?AUTO_8616 ) ) ( AIRPORT ?AUTO_8617 ) ( AIRPLANE-AT ?AUTO_8618 ?AUTO_8617 ) ( not ( = ?AUTO_8617 ?AUTO_8619 ) ) ( not ( = ?AUTO_8616 ?AUTO_8617 ) ) ( TRUCK-AT ?AUTO_8620 ?AUTO_8619 ) ( IN-TRUCK ?AUTO_8615 ?AUTO_8620 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8615 ?AUTO_8620 ?AUTO_8619 )
      ( DELIVER-PKG ?AUTO_8615 ?AUTO_8616 )
      ( DELIVER-PKG-VERIFY ?AUTO_8615 ?AUTO_8616 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8625 - OBJ
      ?AUTO_8626 - LOCATION
    )
    :vars
    (
      ?AUTO_8627 - LOCATION
      ?AUTO_8629 - LOCATION
      ?AUTO_8630 - AIRPLANE
      ?AUTO_8628 - TRUCK
      ?AUTO_8631 - LOCATION
      ?AUTO_8632 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8627 ) ( AIRPORT ?AUTO_8626 ) ( not ( = ?AUTO_8627 ?AUTO_8626 ) ) ( AIRPORT ?AUTO_8629 ) ( AIRPLANE-AT ?AUTO_8630 ?AUTO_8629 ) ( not ( = ?AUTO_8629 ?AUTO_8627 ) ) ( not ( = ?AUTO_8626 ?AUTO_8629 ) ) ( IN-TRUCK ?AUTO_8625 ?AUTO_8628 ) ( TRUCK-AT ?AUTO_8628 ?AUTO_8631 ) ( IN-CITY ?AUTO_8631 ?AUTO_8632 ) ( IN-CITY ?AUTO_8627 ?AUTO_8632 ) ( not ( = ?AUTO_8627 ?AUTO_8631 ) ) ( not ( = ?AUTO_8626 ?AUTO_8631 ) ) ( not ( = ?AUTO_8629 ?AUTO_8631 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8628 ?AUTO_8631 ?AUTO_8627 ?AUTO_8632 )
      ( DELIVER-PKG ?AUTO_8625 ?AUTO_8626 )
      ( DELIVER-PKG-VERIFY ?AUTO_8625 ?AUTO_8626 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8687 - OBJ
      ?AUTO_8688 - LOCATION
    )
    :vars
    (
      ?AUTO_8689 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8687 ?AUTO_8689 ) ( AIRPLANE-AT ?AUTO_8689 ?AUTO_8688 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8687 ?AUTO_8689 ?AUTO_8688 )
      ( DELIVER-PKG-VERIFY ?AUTO_8687 ?AUTO_8688 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8690 - OBJ
      ?AUTO_8691 - LOCATION
    )
    :vars
    (
      ?AUTO_8692 - AIRPLANE
      ?AUTO_8693 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_8690 ?AUTO_8692 ) ( AIRPORT ?AUTO_8693 ) ( AIRPORT ?AUTO_8691 ) ( AIRPLANE-AT ?AUTO_8692 ?AUTO_8693 ) ( not ( = ?AUTO_8693 ?AUTO_8691 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8692 ?AUTO_8693 ?AUTO_8691 )
      ( DELIVER-PKG ?AUTO_8690 ?AUTO_8691 )
      ( DELIVER-PKG-VERIFY ?AUTO_8690 ?AUTO_8691 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8702 - OBJ
      ?AUTO_8703 - LOCATION
    )
    :vars
    (
      ?AUTO_8704 - LOCATION
      ?AUTO_8705 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8704 ) ( AIRPORT ?AUTO_8703 ) ( AIRPLANE-AT ?AUTO_8705 ?AUTO_8704 ) ( not ( = ?AUTO_8704 ?AUTO_8703 ) ) ( OBJ-AT ?AUTO_8702 ?AUTO_8704 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8702 ?AUTO_8705 ?AUTO_8704 )
      ( DELIVER-PKG ?AUTO_8702 ?AUTO_8703 )
      ( DELIVER-PKG-VERIFY ?AUTO_8702 ?AUTO_8703 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8706 - OBJ
      ?AUTO_8707 - LOCATION
    )
    :vars
    (
      ?AUTO_8708 - LOCATION
      ?AUTO_8710 - LOCATION
      ?AUTO_8709 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8708 ) ( AIRPORT ?AUTO_8707 ) ( not ( = ?AUTO_8708 ?AUTO_8707 ) ) ( OBJ-AT ?AUTO_8706 ?AUTO_8708 ) ( AIRPORT ?AUTO_8710 ) ( AIRPLANE-AT ?AUTO_8709 ?AUTO_8710 ) ( not ( = ?AUTO_8710 ?AUTO_8708 ) ) ( not ( = ?AUTO_8707 ?AUTO_8710 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8709 ?AUTO_8710 ?AUTO_8708 )
      ( DELIVER-PKG ?AUTO_8706 ?AUTO_8707 )
      ( DELIVER-PKG-VERIFY ?AUTO_8706 ?AUTO_8707 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8717 - OBJ
      ?AUTO_8718 - LOCATION
    )
    :vars
    (
      ?AUTO_8719 - LOCATION
      ?AUTO_8721 - LOCATION
      ?AUTO_8720 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8719 ) ( AIRPORT ?AUTO_8718 ) ( not ( = ?AUTO_8719 ?AUTO_8718 ) ) ( OBJ-AT ?AUTO_8717 ?AUTO_8719 ) ( AIRPORT ?AUTO_8721 ) ( not ( = ?AUTO_8721 ?AUTO_8719 ) ) ( not ( = ?AUTO_8718 ?AUTO_8721 ) ) ( AIRPLANE-AT ?AUTO_8720 ?AUTO_8718 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8720 ?AUTO_8718 ?AUTO_8721 )
      ( DELIVER-PKG ?AUTO_8717 ?AUTO_8718 )
      ( DELIVER-PKG-VERIFY ?AUTO_8717 ?AUTO_8718 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8790 - OBJ
      ?AUTO_8791 - LOCATION
    )
    :vars
    (
      ?AUTO_8792 - LOCATION
      ?AUTO_8796 - AIRPLANE
      ?AUTO_8794 - TRUCK
      ?AUTO_8793 - LOCATION
      ?AUTO_8795 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8792 ) ( AIRPORT ?AUTO_8791 ) ( not ( = ?AUTO_8792 ?AUTO_8791 ) ) ( AIRPLANE-AT ?AUTO_8796 ?AUTO_8791 ) ( TRUCK-AT ?AUTO_8794 ?AUTO_8793 ) ( IN-CITY ?AUTO_8793 ?AUTO_8795 ) ( IN-CITY ?AUTO_8792 ?AUTO_8795 ) ( not ( = ?AUTO_8792 ?AUTO_8793 ) ) ( not ( = ?AUTO_8791 ?AUTO_8793 ) ) ( OBJ-AT ?AUTO_8790 ?AUTO_8793 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8790 ?AUTO_8794 ?AUTO_8793 )
      ( DELIVER-PKG ?AUTO_8790 ?AUTO_8791 )
      ( DELIVER-PKG-VERIFY ?AUTO_8790 ?AUTO_8791 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8797 - OBJ
      ?AUTO_8798 - LOCATION
    )
    :vars
    (
      ?AUTO_8799 - LOCATION
      ?AUTO_8800 - AIRPLANE
      ?AUTO_8803 - LOCATION
      ?AUTO_8801 - CITY
      ?AUTO_8802 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8799 ) ( AIRPORT ?AUTO_8798 ) ( not ( = ?AUTO_8799 ?AUTO_8798 ) ) ( AIRPLANE-AT ?AUTO_8800 ?AUTO_8798 ) ( IN-CITY ?AUTO_8803 ?AUTO_8801 ) ( IN-CITY ?AUTO_8799 ?AUTO_8801 ) ( not ( = ?AUTO_8799 ?AUTO_8803 ) ) ( not ( = ?AUTO_8798 ?AUTO_8803 ) ) ( OBJ-AT ?AUTO_8797 ?AUTO_8803 ) ( TRUCK-AT ?AUTO_8802 ?AUTO_8799 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8802 ?AUTO_8799 ?AUTO_8803 ?AUTO_8801 )
      ( DELIVER-PKG ?AUTO_8797 ?AUTO_8798 )
      ( DELIVER-PKG-VERIFY ?AUTO_8797 ?AUTO_8798 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8832 - OBJ
      ?AUTO_8833 - LOCATION
    )
    :vars
    (
      ?AUTO_8834 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8834 ?AUTO_8833 ) ( IN-TRUCK ?AUTO_8832 ?AUTO_8834 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8832 ?AUTO_8834 ?AUTO_8833 )
      ( DELIVER-PKG-VERIFY ?AUTO_8832 ?AUTO_8833 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8835 - OBJ
      ?AUTO_8836 - LOCATION
    )
    :vars
    (
      ?AUTO_8837 - TRUCK
      ?AUTO_8838 - LOCATION
      ?AUTO_8839 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_8835 ?AUTO_8837 ) ( TRUCK-AT ?AUTO_8837 ?AUTO_8838 ) ( IN-CITY ?AUTO_8838 ?AUTO_8839 ) ( IN-CITY ?AUTO_8836 ?AUTO_8839 ) ( not ( = ?AUTO_8836 ?AUTO_8838 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8837 ?AUTO_8838 ?AUTO_8836 ?AUTO_8839 )
      ( DELIVER-PKG ?AUTO_8835 ?AUTO_8836 )
      ( DELIVER-PKG-VERIFY ?AUTO_8835 ?AUTO_8836 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8840 - OBJ
      ?AUTO_8841 - LOCATION
    )
    :vars
    (
      ?AUTO_8842 - TRUCK
      ?AUTO_8843 - LOCATION
      ?AUTO_8844 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8842 ?AUTO_8843 ) ( IN-CITY ?AUTO_8843 ?AUTO_8844 ) ( IN-CITY ?AUTO_8841 ?AUTO_8844 ) ( not ( = ?AUTO_8841 ?AUTO_8843 ) ) ( OBJ-AT ?AUTO_8840 ?AUTO_8843 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8840 ?AUTO_8842 ?AUTO_8843 )
      ( DELIVER-PKG ?AUTO_8840 ?AUTO_8841 )
      ( DELIVER-PKG-VERIFY ?AUTO_8840 ?AUTO_8841 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8845 - OBJ
      ?AUTO_8846 - LOCATION
    )
    :vars
    (
      ?AUTO_8848 - TRUCK
      ?AUTO_8847 - LOCATION
      ?AUTO_8849 - CITY
      ?AUTO_8850 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8848 ?AUTO_8847 ) ( IN-CITY ?AUTO_8847 ?AUTO_8849 ) ( IN-CITY ?AUTO_8846 ?AUTO_8849 ) ( not ( = ?AUTO_8846 ?AUTO_8847 ) ) ( IN-AIRPLANE ?AUTO_8845 ?AUTO_8850 ) ( AIRPLANE-AT ?AUTO_8850 ?AUTO_8847 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_8845 ?AUTO_8850 ?AUTO_8847 )
      ( DELIVER-PKG ?AUTO_8845 ?AUTO_8846 )
      ( DELIVER-PKG-VERIFY ?AUTO_8845 ?AUTO_8846 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8851 - OBJ
      ?AUTO_8852 - LOCATION
    )
    :vars
    (
      ?AUTO_8854 - TRUCK
      ?AUTO_8855 - LOCATION
      ?AUTO_8853 - CITY
      ?AUTO_8856 - AIRPLANE
      ?AUTO_8857 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8854 ?AUTO_8855 ) ( IN-CITY ?AUTO_8855 ?AUTO_8853 ) ( IN-CITY ?AUTO_8852 ?AUTO_8853 ) ( not ( = ?AUTO_8852 ?AUTO_8855 ) ) ( IN-AIRPLANE ?AUTO_8851 ?AUTO_8856 ) ( AIRPORT ?AUTO_8857 ) ( AIRPORT ?AUTO_8855 ) ( AIRPLANE-AT ?AUTO_8856 ?AUTO_8857 ) ( not ( = ?AUTO_8857 ?AUTO_8855 ) ) ( not ( = ?AUTO_8852 ?AUTO_8857 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8856 ?AUTO_8857 ?AUTO_8855 )
      ( DELIVER-PKG ?AUTO_8851 ?AUTO_8852 )
      ( DELIVER-PKG-VERIFY ?AUTO_8851 ?AUTO_8852 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8866 - OBJ
      ?AUTO_8867 - LOCATION
    )
    :vars
    (
      ?AUTO_8872 - TRUCK
      ?AUTO_8868 - LOCATION
      ?AUTO_8869 - CITY
      ?AUTO_8870 - LOCATION
      ?AUTO_8871 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8872 ?AUTO_8868 ) ( IN-CITY ?AUTO_8868 ?AUTO_8869 ) ( IN-CITY ?AUTO_8867 ?AUTO_8869 ) ( not ( = ?AUTO_8867 ?AUTO_8868 ) ) ( AIRPORT ?AUTO_8870 ) ( AIRPORT ?AUTO_8868 ) ( AIRPLANE-AT ?AUTO_8871 ?AUTO_8870 ) ( not ( = ?AUTO_8870 ?AUTO_8868 ) ) ( not ( = ?AUTO_8867 ?AUTO_8870 ) ) ( OBJ-AT ?AUTO_8866 ?AUTO_8870 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_8866 ?AUTO_8871 ?AUTO_8870 )
      ( DELIVER-PKG ?AUTO_8866 ?AUTO_8867 )
      ( DELIVER-PKG-VERIFY ?AUTO_8866 ?AUTO_8867 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8873 - OBJ
      ?AUTO_8874 - LOCATION
    )
    :vars
    (
      ?AUTO_8879 - TRUCK
      ?AUTO_8875 - LOCATION
      ?AUTO_8876 - CITY
      ?AUTO_8877 - LOCATION
      ?AUTO_8880 - LOCATION
      ?AUTO_8878 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8879 ?AUTO_8875 ) ( IN-CITY ?AUTO_8875 ?AUTO_8876 ) ( IN-CITY ?AUTO_8874 ?AUTO_8876 ) ( not ( = ?AUTO_8874 ?AUTO_8875 ) ) ( AIRPORT ?AUTO_8877 ) ( AIRPORT ?AUTO_8875 ) ( not ( = ?AUTO_8877 ?AUTO_8875 ) ) ( not ( = ?AUTO_8874 ?AUTO_8877 ) ) ( OBJ-AT ?AUTO_8873 ?AUTO_8877 ) ( AIRPORT ?AUTO_8880 ) ( AIRPLANE-AT ?AUTO_8878 ?AUTO_8880 ) ( not ( = ?AUTO_8880 ?AUTO_8877 ) ) ( not ( = ?AUTO_8874 ?AUTO_8880 ) ) ( not ( = ?AUTO_8875 ?AUTO_8880 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8878 ?AUTO_8880 ?AUTO_8877 )
      ( DELIVER-PKG ?AUTO_8873 ?AUTO_8874 )
      ( DELIVER-PKG-VERIFY ?AUTO_8873 ?AUTO_8874 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8887 - OBJ
      ?AUTO_8888 - LOCATION
    )
    :vars
    (
      ?AUTO_8889 - TRUCK
      ?AUTO_8891 - LOCATION
      ?AUTO_8894 - CITY
      ?AUTO_8893 - LOCATION
      ?AUTO_8890 - LOCATION
      ?AUTO_8892 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8889 ?AUTO_8891 ) ( IN-CITY ?AUTO_8891 ?AUTO_8894 ) ( IN-CITY ?AUTO_8888 ?AUTO_8894 ) ( not ( = ?AUTO_8888 ?AUTO_8891 ) ) ( AIRPORT ?AUTO_8893 ) ( AIRPORT ?AUTO_8891 ) ( not ( = ?AUTO_8893 ?AUTO_8891 ) ) ( not ( = ?AUTO_8888 ?AUTO_8893 ) ) ( OBJ-AT ?AUTO_8887 ?AUTO_8893 ) ( AIRPORT ?AUTO_8890 ) ( not ( = ?AUTO_8890 ?AUTO_8893 ) ) ( not ( = ?AUTO_8888 ?AUTO_8890 ) ) ( not ( = ?AUTO_8891 ?AUTO_8890 ) ) ( AIRPLANE-AT ?AUTO_8892 ?AUTO_8891 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8892 ?AUTO_8891 ?AUTO_8890 )
      ( DELIVER-PKG ?AUTO_8887 ?AUTO_8888 )
      ( DELIVER-PKG-VERIFY ?AUTO_8887 ?AUTO_8888 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8925 - OBJ
      ?AUTO_8926 - LOCATION
    )
    :vars
    (
      ?AUTO_8930 - LOCATION
      ?AUTO_8931 - CITY
      ?AUTO_8929 - LOCATION
      ?AUTO_8928 - LOCATION
      ?AUTO_8932 - AIRPLANE
      ?AUTO_8927 - TRUCK
      ?AUTO_8933 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8930 ?AUTO_8931 ) ( IN-CITY ?AUTO_8926 ?AUTO_8931 ) ( not ( = ?AUTO_8926 ?AUTO_8930 ) ) ( AIRPORT ?AUTO_8929 ) ( AIRPORT ?AUTO_8930 ) ( not ( = ?AUTO_8929 ?AUTO_8930 ) ) ( not ( = ?AUTO_8926 ?AUTO_8929 ) ) ( OBJ-AT ?AUTO_8925 ?AUTO_8929 ) ( AIRPORT ?AUTO_8928 ) ( AIRPLANE-AT ?AUTO_8932 ?AUTO_8928 ) ( not ( = ?AUTO_8928 ?AUTO_8929 ) ) ( not ( = ?AUTO_8926 ?AUTO_8928 ) ) ( not ( = ?AUTO_8930 ?AUTO_8928 ) ) ( TRUCK-AT ?AUTO_8927 ?AUTO_8933 ) ( IN-CITY ?AUTO_8933 ?AUTO_8931 ) ( not ( = ?AUTO_8930 ?AUTO_8933 ) ) ( not ( = ?AUTO_8926 ?AUTO_8933 ) ) ( not ( = ?AUTO_8929 ?AUTO_8933 ) ) ( not ( = ?AUTO_8928 ?AUTO_8933 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8927 ?AUTO_8933 ?AUTO_8930 ?AUTO_8931 )
      ( DELIVER-PKG ?AUTO_8925 ?AUTO_8926 )
      ( DELIVER-PKG-VERIFY ?AUTO_8925 ?AUTO_8926 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8966 - OBJ
      ?AUTO_8967 - LOCATION
    )
    :vars
    (
      ?AUTO_8972 - LOCATION
      ?AUTO_8968 - CITY
      ?AUTO_8973 - LOCATION
      ?AUTO_8974 - LOCATION
      ?AUTO_8969 - AIRPLANE
      ?AUTO_8970 - TRUCK
      ?AUTO_8971 - LOCATION
      ?AUTO_8975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8972 ?AUTO_8968 ) ( IN-CITY ?AUTO_8967 ?AUTO_8968 ) ( not ( = ?AUTO_8967 ?AUTO_8972 ) ) ( AIRPORT ?AUTO_8973 ) ( AIRPORT ?AUTO_8972 ) ( not ( = ?AUTO_8973 ?AUTO_8972 ) ) ( not ( = ?AUTO_8967 ?AUTO_8973 ) ) ( AIRPORT ?AUTO_8974 ) ( not ( = ?AUTO_8974 ?AUTO_8973 ) ) ( not ( = ?AUTO_8967 ?AUTO_8974 ) ) ( not ( = ?AUTO_8972 ?AUTO_8974 ) ) ( AIRPLANE-AT ?AUTO_8969 ?AUTO_8972 ) ( TRUCK-AT ?AUTO_8970 ?AUTO_8971 ) ( IN-CITY ?AUTO_8971 ?AUTO_8968 ) ( not ( = ?AUTO_8972 ?AUTO_8971 ) ) ( not ( = ?AUTO_8967 ?AUTO_8971 ) ) ( not ( = ?AUTO_8973 ?AUTO_8971 ) ) ( not ( = ?AUTO_8974 ?AUTO_8971 ) ) ( TRUCK-AT ?AUTO_8975 ?AUTO_8973 ) ( IN-TRUCK ?AUTO_8966 ?AUTO_8975 ) ( not ( = ?AUTO_8970 ?AUTO_8975 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_8966 ?AUTO_8975 ?AUTO_8973 )
      ( DELIVER-PKG ?AUTO_8966 ?AUTO_8967 )
      ( DELIVER-PKG-VERIFY ?AUTO_8966 ?AUTO_8967 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8978 - OBJ
      ?AUTO_8979 - LOCATION
    )
    :vars
    (
      ?AUTO_8982 - LOCATION
      ?AUTO_8984 - CITY
      ?AUTO_8987 - LOCATION
      ?AUTO_8983 - AIRPLANE
      ?AUTO_8981 - TRUCK
      ?AUTO_8986 - TRUCK
      ?AUTO_8980 - LOCATION
      ?AUTO_8985 - CITY
      ?AUTO_8988 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8982 ?AUTO_8984 ) ( IN-CITY ?AUTO_8979 ?AUTO_8984 ) ( not ( = ?AUTO_8979 ?AUTO_8982 ) ) ( AIRPORT ?AUTO_8987 ) ( AIRPORT ?AUTO_8982 ) ( not ( = ?AUTO_8987 ?AUTO_8982 ) ) ( not ( = ?AUTO_8979 ?AUTO_8987 ) ) ( AIRPLANE-AT ?AUTO_8983 ?AUTO_8982 ) ( not ( = ?AUTO_8981 ?AUTO_8986 ) ) ( TRUCK-AT ?AUTO_8986 ?AUTO_8980 ) ( IN-CITY ?AUTO_8980 ?AUTO_8985 ) ( IN-CITY ?AUTO_8987 ?AUTO_8985 ) ( not ( = ?AUTO_8987 ?AUTO_8980 ) ) ( not ( = ?AUTO_8979 ?AUTO_8980 ) ) ( not ( = ?AUTO_8982 ?AUTO_8980 ) ) ( not ( = ?AUTO_8984 ?AUTO_8985 ) ) ( TRUCK-AT ?AUTO_8981 ?AUTO_8988 ) ( IN-CITY ?AUTO_8988 ?AUTO_8984 ) ( not ( = ?AUTO_8982 ?AUTO_8988 ) ) ( not ( = ?AUTO_8979 ?AUTO_8988 ) ) ( not ( = ?AUTO_8987 ?AUTO_8988 ) ) ( not ( = ?AUTO_8980 ?AUTO_8988 ) ) ( OBJ-AT ?AUTO_8978 ?AUTO_8980 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_8978 ?AUTO_8986 ?AUTO_8980 )
      ( DELIVER-PKG ?AUTO_8978 ?AUTO_8979 )
      ( DELIVER-PKG-VERIFY ?AUTO_8978 ?AUTO_8979 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8989 - OBJ
      ?AUTO_8990 - LOCATION
    )
    :vars
    (
      ?AUTO_8998 - LOCATION
      ?AUTO_8995 - CITY
      ?AUTO_8997 - LOCATION
      ?AUTO_8992 - AIRPLANE
      ?AUTO_8991 - TRUCK
      ?AUTO_8999 - TRUCK
      ?AUTO_8994 - LOCATION
      ?AUTO_8993 - CITY
      ?AUTO_8996 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8998 ?AUTO_8995 ) ( IN-CITY ?AUTO_8990 ?AUTO_8995 ) ( not ( = ?AUTO_8990 ?AUTO_8998 ) ) ( AIRPORT ?AUTO_8997 ) ( AIRPORT ?AUTO_8998 ) ( not ( = ?AUTO_8997 ?AUTO_8998 ) ) ( not ( = ?AUTO_8990 ?AUTO_8997 ) ) ( AIRPLANE-AT ?AUTO_8992 ?AUTO_8998 ) ( not ( = ?AUTO_8991 ?AUTO_8999 ) ) ( IN-CITY ?AUTO_8994 ?AUTO_8993 ) ( IN-CITY ?AUTO_8997 ?AUTO_8993 ) ( not ( = ?AUTO_8997 ?AUTO_8994 ) ) ( not ( = ?AUTO_8990 ?AUTO_8994 ) ) ( not ( = ?AUTO_8998 ?AUTO_8994 ) ) ( not ( = ?AUTO_8995 ?AUTO_8993 ) ) ( TRUCK-AT ?AUTO_8991 ?AUTO_8996 ) ( IN-CITY ?AUTO_8996 ?AUTO_8995 ) ( not ( = ?AUTO_8998 ?AUTO_8996 ) ) ( not ( = ?AUTO_8990 ?AUTO_8996 ) ) ( not ( = ?AUTO_8997 ?AUTO_8996 ) ) ( not ( = ?AUTO_8994 ?AUTO_8996 ) ) ( OBJ-AT ?AUTO_8989 ?AUTO_8994 ) ( TRUCK-AT ?AUTO_8999 ?AUTO_8997 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8999 ?AUTO_8997 ?AUTO_8994 ?AUTO_8993 )
      ( DELIVER-PKG ?AUTO_8989 ?AUTO_8990 )
      ( DELIVER-PKG-VERIFY ?AUTO_8989 ?AUTO_8990 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9002 - OBJ
      ?AUTO_9003 - LOCATION
    )
    :vars
    (
      ?AUTO_9004 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9004 ?AUTO_9003 ) ( IN-TRUCK ?AUTO_9002 ?AUTO_9004 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9002 ?AUTO_9004 ?AUTO_9003 )
      ( DELIVER-PKG-VERIFY ?AUTO_9002 ?AUTO_9003 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9005 - OBJ
      ?AUTO_9006 - LOCATION
    )
    :vars
    (
      ?AUTO_9007 - TRUCK
      ?AUTO_9008 - LOCATION
      ?AUTO_9009 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9005 ?AUTO_9007 ) ( TRUCK-AT ?AUTO_9007 ?AUTO_9008 ) ( IN-CITY ?AUTO_9008 ?AUTO_9009 ) ( IN-CITY ?AUTO_9006 ?AUTO_9009 ) ( not ( = ?AUTO_9006 ?AUTO_9008 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9007 ?AUTO_9008 ?AUTO_9006 ?AUTO_9009 )
      ( DELIVER-PKG ?AUTO_9005 ?AUTO_9006 )
      ( DELIVER-PKG-VERIFY ?AUTO_9005 ?AUTO_9006 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9010 - OBJ
      ?AUTO_9011 - LOCATION
    )
    :vars
    (
      ?AUTO_9012 - TRUCK
      ?AUTO_9013 - LOCATION
      ?AUTO_9014 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9012 ?AUTO_9013 ) ( IN-CITY ?AUTO_9013 ?AUTO_9014 ) ( IN-CITY ?AUTO_9011 ?AUTO_9014 ) ( not ( = ?AUTO_9011 ?AUTO_9013 ) ) ( OBJ-AT ?AUTO_9010 ?AUTO_9013 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9010 ?AUTO_9012 ?AUTO_9013 )
      ( DELIVER-PKG ?AUTO_9010 ?AUTO_9011 )
      ( DELIVER-PKG-VERIFY ?AUTO_9010 ?AUTO_9011 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9015 - OBJ
      ?AUTO_9016 - LOCATION
    )
    :vars
    (
      ?AUTO_9017 - LOCATION
      ?AUTO_9019 - CITY
      ?AUTO_9018 - TRUCK
      ?AUTO_9020 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9017 ?AUTO_9019 ) ( IN-CITY ?AUTO_9016 ?AUTO_9019 ) ( not ( = ?AUTO_9016 ?AUTO_9017 ) ) ( OBJ-AT ?AUTO_9015 ?AUTO_9017 ) ( TRUCK-AT ?AUTO_9018 ?AUTO_9020 ) ( IN-CITY ?AUTO_9020 ?AUTO_9019 ) ( not ( = ?AUTO_9017 ?AUTO_9020 ) ) ( not ( = ?AUTO_9016 ?AUTO_9020 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9018 ?AUTO_9020 ?AUTO_9017 ?AUTO_9019 )
      ( DELIVER-PKG ?AUTO_9015 ?AUTO_9016 )
      ( DELIVER-PKG-VERIFY ?AUTO_9015 ?AUTO_9016 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9023 - OBJ
      ?AUTO_9024 - LOCATION
    )
    :vars
    (
      ?AUTO_9025 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9023 ?AUTO_9025 ) ( AIRPLANE-AT ?AUTO_9025 ?AUTO_9024 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9023 ?AUTO_9025 ?AUTO_9024 )
      ( DELIVER-PKG-VERIFY ?AUTO_9023 ?AUTO_9024 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9026 - OBJ
      ?AUTO_9027 - LOCATION
    )
    :vars
    (
      ?AUTO_9028 - AIRPLANE
      ?AUTO_9029 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9026 ?AUTO_9028 ) ( AIRPORT ?AUTO_9029 ) ( AIRPORT ?AUTO_9027 ) ( AIRPLANE-AT ?AUTO_9028 ?AUTO_9029 ) ( not ( = ?AUTO_9029 ?AUTO_9027 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9028 ?AUTO_9029 ?AUTO_9027 )
      ( DELIVER-PKG ?AUTO_9026 ?AUTO_9027 )
      ( DELIVER-PKG-VERIFY ?AUTO_9026 ?AUTO_9027 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9034 - OBJ
      ?AUTO_9035 - LOCATION
    )
    :vars
    (
      ?AUTO_9036 - LOCATION
      ?AUTO_9037 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9036 ) ( AIRPORT ?AUTO_9035 ) ( AIRPLANE-AT ?AUTO_9037 ?AUTO_9036 ) ( not ( = ?AUTO_9036 ?AUTO_9035 ) ) ( OBJ-AT ?AUTO_9034 ?AUTO_9036 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9034 ?AUTO_9037 ?AUTO_9036 )
      ( DELIVER-PKG ?AUTO_9034 ?AUTO_9035 )
      ( DELIVER-PKG-VERIFY ?AUTO_9034 ?AUTO_9035 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9038 - OBJ
      ?AUTO_9039 - LOCATION
    )
    :vars
    (
      ?AUTO_9040 - LOCATION
      ?AUTO_9042 - LOCATION
      ?AUTO_9041 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9040 ) ( AIRPORT ?AUTO_9039 ) ( not ( = ?AUTO_9040 ?AUTO_9039 ) ) ( OBJ-AT ?AUTO_9038 ?AUTO_9040 ) ( AIRPORT ?AUTO_9042 ) ( AIRPLANE-AT ?AUTO_9041 ?AUTO_9042 ) ( not ( = ?AUTO_9042 ?AUTO_9040 ) ) ( not ( = ?AUTO_9039 ?AUTO_9042 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9041 ?AUTO_9042 ?AUTO_9040 )
      ( DELIVER-PKG ?AUTO_9038 ?AUTO_9039 )
      ( DELIVER-PKG-VERIFY ?AUTO_9038 ?AUTO_9039 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9043 - OBJ
      ?AUTO_9044 - LOCATION
    )
    :vars
    (
      ?AUTO_9046 - LOCATION
      ?AUTO_9045 - LOCATION
      ?AUTO_9047 - AIRPLANE
      ?AUTO_9048 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9046 ) ( AIRPORT ?AUTO_9044 ) ( not ( = ?AUTO_9046 ?AUTO_9044 ) ) ( AIRPORT ?AUTO_9045 ) ( AIRPLANE-AT ?AUTO_9047 ?AUTO_9045 ) ( not ( = ?AUTO_9045 ?AUTO_9046 ) ) ( not ( = ?AUTO_9044 ?AUTO_9045 ) ) ( TRUCK-AT ?AUTO_9048 ?AUTO_9046 ) ( IN-TRUCK ?AUTO_9043 ?AUTO_9048 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9043 ?AUTO_9048 ?AUTO_9046 )
      ( DELIVER-PKG ?AUTO_9043 ?AUTO_9044 )
      ( DELIVER-PKG-VERIFY ?AUTO_9043 ?AUTO_9044 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9049 - OBJ
      ?AUTO_9050 - LOCATION
    )
    :vars
    (
      ?AUTO_9052 - LOCATION
      ?AUTO_9051 - LOCATION
      ?AUTO_9053 - AIRPLANE
      ?AUTO_9054 - TRUCK
      ?AUTO_9055 - LOCATION
      ?AUTO_9056 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9052 ) ( AIRPORT ?AUTO_9050 ) ( not ( = ?AUTO_9052 ?AUTO_9050 ) ) ( AIRPORT ?AUTO_9051 ) ( AIRPLANE-AT ?AUTO_9053 ?AUTO_9051 ) ( not ( = ?AUTO_9051 ?AUTO_9052 ) ) ( not ( = ?AUTO_9050 ?AUTO_9051 ) ) ( IN-TRUCK ?AUTO_9049 ?AUTO_9054 ) ( TRUCK-AT ?AUTO_9054 ?AUTO_9055 ) ( IN-CITY ?AUTO_9055 ?AUTO_9056 ) ( IN-CITY ?AUTO_9052 ?AUTO_9056 ) ( not ( = ?AUTO_9052 ?AUTO_9055 ) ) ( not ( = ?AUTO_9050 ?AUTO_9055 ) ) ( not ( = ?AUTO_9051 ?AUTO_9055 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9054 ?AUTO_9055 ?AUTO_9052 ?AUTO_9056 )
      ( DELIVER-PKG ?AUTO_9049 ?AUTO_9050 )
      ( DELIVER-PKG-VERIFY ?AUTO_9049 ?AUTO_9050 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9057 - OBJ
      ?AUTO_9058 - LOCATION
    )
    :vars
    (
      ?AUTO_9060 - LOCATION
      ?AUTO_9062 - LOCATION
      ?AUTO_9064 - AIRPLANE
      ?AUTO_9059 - TRUCK
      ?AUTO_9063 - LOCATION
      ?AUTO_9061 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9060 ) ( AIRPORT ?AUTO_9058 ) ( not ( = ?AUTO_9060 ?AUTO_9058 ) ) ( AIRPORT ?AUTO_9062 ) ( AIRPLANE-AT ?AUTO_9064 ?AUTO_9062 ) ( not ( = ?AUTO_9062 ?AUTO_9060 ) ) ( not ( = ?AUTO_9058 ?AUTO_9062 ) ) ( TRUCK-AT ?AUTO_9059 ?AUTO_9063 ) ( IN-CITY ?AUTO_9063 ?AUTO_9061 ) ( IN-CITY ?AUTO_9060 ?AUTO_9061 ) ( not ( = ?AUTO_9060 ?AUTO_9063 ) ) ( not ( = ?AUTO_9058 ?AUTO_9063 ) ) ( not ( = ?AUTO_9062 ?AUTO_9063 ) ) ( OBJ-AT ?AUTO_9057 ?AUTO_9063 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9057 ?AUTO_9059 ?AUTO_9063 )
      ( DELIVER-PKG ?AUTO_9057 ?AUTO_9058 )
      ( DELIVER-PKG-VERIFY ?AUTO_9057 ?AUTO_9058 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9065 - OBJ
      ?AUTO_9066 - LOCATION
    )
    :vars
    (
      ?AUTO_9067 - LOCATION
      ?AUTO_9072 - LOCATION
      ?AUTO_9070 - AIRPLANE
      ?AUTO_9069 - LOCATION
      ?AUTO_9071 - CITY
      ?AUTO_9068 - TRUCK
      ?AUTO_9073 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9067 ) ( AIRPORT ?AUTO_9066 ) ( not ( = ?AUTO_9067 ?AUTO_9066 ) ) ( AIRPORT ?AUTO_9072 ) ( AIRPLANE-AT ?AUTO_9070 ?AUTO_9072 ) ( not ( = ?AUTO_9072 ?AUTO_9067 ) ) ( not ( = ?AUTO_9066 ?AUTO_9072 ) ) ( IN-CITY ?AUTO_9069 ?AUTO_9071 ) ( IN-CITY ?AUTO_9067 ?AUTO_9071 ) ( not ( = ?AUTO_9067 ?AUTO_9069 ) ) ( not ( = ?AUTO_9066 ?AUTO_9069 ) ) ( not ( = ?AUTO_9072 ?AUTO_9069 ) ) ( OBJ-AT ?AUTO_9065 ?AUTO_9069 ) ( TRUCK-AT ?AUTO_9068 ?AUTO_9073 ) ( IN-CITY ?AUTO_9073 ?AUTO_9071 ) ( not ( = ?AUTO_9069 ?AUTO_9073 ) ) ( not ( = ?AUTO_9066 ?AUTO_9073 ) ) ( not ( = ?AUTO_9067 ?AUTO_9073 ) ) ( not ( = ?AUTO_9072 ?AUTO_9073 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9068 ?AUTO_9073 ?AUTO_9069 ?AUTO_9071 )
      ( DELIVER-PKG ?AUTO_9065 ?AUTO_9066 )
      ( DELIVER-PKG-VERIFY ?AUTO_9065 ?AUTO_9066 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9076 - OBJ
      ?AUTO_9077 - LOCATION
    )
    :vars
    (
      ?AUTO_9078 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9076 ?AUTO_9078 ) ( AIRPLANE-AT ?AUTO_9078 ?AUTO_9077 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9076 ?AUTO_9078 ?AUTO_9077 )
      ( DELIVER-PKG-VERIFY ?AUTO_9076 ?AUTO_9077 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9079 - OBJ
      ?AUTO_9080 - LOCATION
    )
    :vars
    (
      ?AUTO_9081 - AIRPLANE
      ?AUTO_9082 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9079 ?AUTO_9081 ) ( AIRPORT ?AUTO_9082 ) ( AIRPORT ?AUTO_9080 ) ( AIRPLANE-AT ?AUTO_9081 ?AUTO_9082 ) ( not ( = ?AUTO_9082 ?AUTO_9080 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9081 ?AUTO_9082 ?AUTO_9080 )
      ( DELIVER-PKG ?AUTO_9079 ?AUTO_9080 )
      ( DELIVER-PKG-VERIFY ?AUTO_9079 ?AUTO_9080 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9087 - OBJ
      ?AUTO_9088 - LOCATION
    )
    :vars
    (
      ?AUTO_9089 - LOCATION
      ?AUTO_9090 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9089 ) ( AIRPORT ?AUTO_9088 ) ( AIRPLANE-AT ?AUTO_9090 ?AUTO_9089 ) ( not ( = ?AUTO_9089 ?AUTO_9088 ) ) ( OBJ-AT ?AUTO_9087 ?AUTO_9089 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9087 ?AUTO_9090 ?AUTO_9089 )
      ( DELIVER-PKG ?AUTO_9087 ?AUTO_9088 )
      ( DELIVER-PKG-VERIFY ?AUTO_9087 ?AUTO_9088 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9091 - OBJ
      ?AUTO_9092 - LOCATION
    )
    :vars
    (
      ?AUTO_9094 - LOCATION
      ?AUTO_9095 - LOCATION
      ?AUTO_9093 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9094 ) ( AIRPORT ?AUTO_9092 ) ( not ( = ?AUTO_9094 ?AUTO_9092 ) ) ( OBJ-AT ?AUTO_9091 ?AUTO_9094 ) ( AIRPORT ?AUTO_9095 ) ( AIRPLANE-AT ?AUTO_9093 ?AUTO_9095 ) ( not ( = ?AUTO_9095 ?AUTO_9094 ) ) ( not ( = ?AUTO_9092 ?AUTO_9095 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9093 ?AUTO_9095 ?AUTO_9094 )
      ( DELIVER-PKG ?AUTO_9091 ?AUTO_9092 )
      ( DELIVER-PKG-VERIFY ?AUTO_9091 ?AUTO_9092 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9110 - OBJ
      ?AUTO_9111 - LOCATION
    )
    :vars
    (
      ?AUTO_9112 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9112 ?AUTO_9111 ) ( IN-TRUCK ?AUTO_9110 ?AUTO_9112 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9110 ?AUTO_9112 ?AUTO_9111 )
      ( DELIVER-PKG-VERIFY ?AUTO_9110 ?AUTO_9111 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9117 - OBJ
      ?AUTO_9118 - LOCATION
    )
    :vars
    (
      ?AUTO_9119 - TRUCK
      ?AUTO_9120 - LOCATION
      ?AUTO_9121 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9117 ?AUTO_9119 ) ( TRUCK-AT ?AUTO_9119 ?AUTO_9120 ) ( IN-CITY ?AUTO_9120 ?AUTO_9121 ) ( IN-CITY ?AUTO_9118 ?AUTO_9121 ) ( not ( = ?AUTO_9118 ?AUTO_9120 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9119 ?AUTO_9120 ?AUTO_9118 ?AUTO_9121 )
      ( DELIVER-PKG ?AUTO_9117 ?AUTO_9118 )
      ( DELIVER-PKG-VERIFY ?AUTO_9117 ?AUTO_9118 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9122 - OBJ
      ?AUTO_9123 - LOCATION
    )
    :vars
    (
      ?AUTO_9124 - TRUCK
      ?AUTO_9125 - LOCATION
      ?AUTO_9126 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9124 ?AUTO_9125 ) ( IN-CITY ?AUTO_9125 ?AUTO_9126 ) ( IN-CITY ?AUTO_9123 ?AUTO_9126 ) ( not ( = ?AUTO_9123 ?AUTO_9125 ) ) ( OBJ-AT ?AUTO_9122 ?AUTO_9125 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9122 ?AUTO_9124 ?AUTO_9125 )
      ( DELIVER-PKG ?AUTO_9122 ?AUTO_9123 )
      ( DELIVER-PKG-VERIFY ?AUTO_9122 ?AUTO_9123 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9131 - OBJ
      ?AUTO_9132 - LOCATION
    )
    :vars
    (
      ?AUTO_9133 - TRUCK
      ?AUTO_9134 - LOCATION
      ?AUTO_9135 - CITY
      ?AUTO_9136 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9133 ?AUTO_9134 ) ( IN-CITY ?AUTO_9134 ?AUTO_9135 ) ( IN-CITY ?AUTO_9132 ?AUTO_9135 ) ( not ( = ?AUTO_9132 ?AUTO_9134 ) ) ( IN-AIRPLANE ?AUTO_9131 ?AUTO_9136 ) ( AIRPLANE-AT ?AUTO_9136 ?AUTO_9134 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9131 ?AUTO_9136 ?AUTO_9134 )
      ( DELIVER-PKG ?AUTO_9131 ?AUTO_9132 )
      ( DELIVER-PKG-VERIFY ?AUTO_9131 ?AUTO_9132 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9137 - OBJ
      ?AUTO_9138 - LOCATION
    )
    :vars
    (
      ?AUTO_9140 - TRUCK
      ?AUTO_9139 - LOCATION
      ?AUTO_9141 - CITY
      ?AUTO_9142 - AIRPLANE
      ?AUTO_9143 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9140 ?AUTO_9139 ) ( IN-CITY ?AUTO_9139 ?AUTO_9141 ) ( IN-CITY ?AUTO_9138 ?AUTO_9141 ) ( not ( = ?AUTO_9138 ?AUTO_9139 ) ) ( IN-AIRPLANE ?AUTO_9137 ?AUTO_9142 ) ( AIRPORT ?AUTO_9143 ) ( AIRPORT ?AUTO_9139 ) ( AIRPLANE-AT ?AUTO_9142 ?AUTO_9143 ) ( not ( = ?AUTO_9143 ?AUTO_9139 ) ) ( not ( = ?AUTO_9138 ?AUTO_9143 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9142 ?AUTO_9143 ?AUTO_9139 )
      ( DELIVER-PKG ?AUTO_9137 ?AUTO_9138 )
      ( DELIVER-PKG-VERIFY ?AUTO_9137 ?AUTO_9138 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9148 - OBJ
      ?AUTO_9149 - LOCATION
    )
    :vars
    (
      ?AUTO_9154 - TRUCK
      ?AUTO_9150 - LOCATION
      ?AUTO_9151 - CITY
      ?AUTO_9153 - LOCATION
      ?AUTO_9152 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9154 ?AUTO_9150 ) ( IN-CITY ?AUTO_9150 ?AUTO_9151 ) ( IN-CITY ?AUTO_9149 ?AUTO_9151 ) ( not ( = ?AUTO_9149 ?AUTO_9150 ) ) ( AIRPORT ?AUTO_9153 ) ( AIRPORT ?AUTO_9150 ) ( AIRPLANE-AT ?AUTO_9152 ?AUTO_9153 ) ( not ( = ?AUTO_9153 ?AUTO_9150 ) ) ( not ( = ?AUTO_9149 ?AUTO_9153 ) ) ( OBJ-AT ?AUTO_9148 ?AUTO_9153 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9148 ?AUTO_9152 ?AUTO_9153 )
      ( DELIVER-PKG ?AUTO_9148 ?AUTO_9149 )
      ( DELIVER-PKG-VERIFY ?AUTO_9148 ?AUTO_9149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9155 - OBJ
      ?AUTO_9156 - LOCATION
    )
    :vars
    (
      ?AUTO_9161 - TRUCK
      ?AUTO_9157 - LOCATION
      ?AUTO_9158 - CITY
      ?AUTO_9159 - LOCATION
      ?AUTO_9162 - LOCATION
      ?AUTO_9160 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9161 ?AUTO_9157 ) ( IN-CITY ?AUTO_9157 ?AUTO_9158 ) ( IN-CITY ?AUTO_9156 ?AUTO_9158 ) ( not ( = ?AUTO_9156 ?AUTO_9157 ) ) ( AIRPORT ?AUTO_9159 ) ( AIRPORT ?AUTO_9157 ) ( not ( = ?AUTO_9159 ?AUTO_9157 ) ) ( not ( = ?AUTO_9156 ?AUTO_9159 ) ) ( OBJ-AT ?AUTO_9155 ?AUTO_9159 ) ( AIRPORT ?AUTO_9162 ) ( AIRPLANE-AT ?AUTO_9160 ?AUTO_9162 ) ( not ( = ?AUTO_9162 ?AUTO_9159 ) ) ( not ( = ?AUTO_9156 ?AUTO_9162 ) ) ( not ( = ?AUTO_9157 ?AUTO_9162 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9160 ?AUTO_9162 ?AUTO_9159 )
      ( DELIVER-PKG ?AUTO_9155 ?AUTO_9156 )
      ( DELIVER-PKG-VERIFY ?AUTO_9155 ?AUTO_9156 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9163 - OBJ
      ?AUTO_9164 - LOCATION
    )
    :vars
    (
      ?AUTO_9167 - TRUCK
      ?AUTO_9168 - LOCATION
      ?AUTO_9165 - CITY
      ?AUTO_9166 - LOCATION
      ?AUTO_9170 - LOCATION
      ?AUTO_9169 - AIRPLANE
      ?AUTO_9171 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9167 ?AUTO_9168 ) ( IN-CITY ?AUTO_9168 ?AUTO_9165 ) ( IN-CITY ?AUTO_9164 ?AUTO_9165 ) ( not ( = ?AUTO_9164 ?AUTO_9168 ) ) ( AIRPORT ?AUTO_9166 ) ( AIRPORT ?AUTO_9168 ) ( not ( = ?AUTO_9166 ?AUTO_9168 ) ) ( not ( = ?AUTO_9164 ?AUTO_9166 ) ) ( AIRPORT ?AUTO_9170 ) ( AIRPLANE-AT ?AUTO_9169 ?AUTO_9170 ) ( not ( = ?AUTO_9170 ?AUTO_9166 ) ) ( not ( = ?AUTO_9164 ?AUTO_9170 ) ) ( not ( = ?AUTO_9168 ?AUTO_9170 ) ) ( TRUCK-AT ?AUTO_9171 ?AUTO_9166 ) ( IN-TRUCK ?AUTO_9163 ?AUTO_9171 ) ( not ( = ?AUTO_9167 ?AUTO_9171 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9163 ?AUTO_9171 ?AUTO_9166 )
      ( DELIVER-PKG ?AUTO_9163 ?AUTO_9164 )
      ( DELIVER-PKG-VERIFY ?AUTO_9163 ?AUTO_9164 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9172 - OBJ
      ?AUTO_9173 - LOCATION
    )
    :vars
    (
      ?AUTO_9180 - TRUCK
      ?AUTO_9178 - LOCATION
      ?AUTO_9176 - CITY
      ?AUTO_9174 - LOCATION
      ?AUTO_9175 - LOCATION
      ?AUTO_9179 - AIRPLANE
      ?AUTO_9177 - TRUCK
      ?AUTO_9181 - LOCATION
      ?AUTO_9182 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9180 ?AUTO_9178 ) ( IN-CITY ?AUTO_9178 ?AUTO_9176 ) ( IN-CITY ?AUTO_9173 ?AUTO_9176 ) ( not ( = ?AUTO_9173 ?AUTO_9178 ) ) ( AIRPORT ?AUTO_9174 ) ( AIRPORT ?AUTO_9178 ) ( not ( = ?AUTO_9174 ?AUTO_9178 ) ) ( not ( = ?AUTO_9173 ?AUTO_9174 ) ) ( AIRPORT ?AUTO_9175 ) ( AIRPLANE-AT ?AUTO_9179 ?AUTO_9175 ) ( not ( = ?AUTO_9175 ?AUTO_9174 ) ) ( not ( = ?AUTO_9173 ?AUTO_9175 ) ) ( not ( = ?AUTO_9178 ?AUTO_9175 ) ) ( IN-TRUCK ?AUTO_9172 ?AUTO_9177 ) ( not ( = ?AUTO_9180 ?AUTO_9177 ) ) ( TRUCK-AT ?AUTO_9177 ?AUTO_9181 ) ( IN-CITY ?AUTO_9181 ?AUTO_9182 ) ( IN-CITY ?AUTO_9174 ?AUTO_9182 ) ( not ( = ?AUTO_9174 ?AUTO_9181 ) ) ( not ( = ?AUTO_9173 ?AUTO_9181 ) ) ( not ( = ?AUTO_9178 ?AUTO_9181 ) ) ( not ( = ?AUTO_9176 ?AUTO_9182 ) ) ( not ( = ?AUTO_9175 ?AUTO_9181 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9177 ?AUTO_9181 ?AUTO_9174 ?AUTO_9182 )
      ( DELIVER-PKG ?AUTO_9172 ?AUTO_9173 )
      ( DELIVER-PKG-VERIFY ?AUTO_9172 ?AUTO_9173 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9183 - OBJ
      ?AUTO_9184 - LOCATION
    )
    :vars
    (
      ?AUTO_9185 - TRUCK
      ?AUTO_9193 - LOCATION
      ?AUTO_9190 - CITY
      ?AUTO_9187 - LOCATION
      ?AUTO_9188 - LOCATION
      ?AUTO_9186 - AIRPLANE
      ?AUTO_9189 - TRUCK
      ?AUTO_9191 - LOCATION
      ?AUTO_9192 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9185 ?AUTO_9193 ) ( IN-CITY ?AUTO_9193 ?AUTO_9190 ) ( IN-CITY ?AUTO_9184 ?AUTO_9190 ) ( not ( = ?AUTO_9184 ?AUTO_9193 ) ) ( AIRPORT ?AUTO_9187 ) ( AIRPORT ?AUTO_9193 ) ( not ( = ?AUTO_9187 ?AUTO_9193 ) ) ( not ( = ?AUTO_9184 ?AUTO_9187 ) ) ( AIRPORT ?AUTO_9188 ) ( AIRPLANE-AT ?AUTO_9186 ?AUTO_9188 ) ( not ( = ?AUTO_9188 ?AUTO_9187 ) ) ( not ( = ?AUTO_9184 ?AUTO_9188 ) ) ( not ( = ?AUTO_9193 ?AUTO_9188 ) ) ( not ( = ?AUTO_9185 ?AUTO_9189 ) ) ( TRUCK-AT ?AUTO_9189 ?AUTO_9191 ) ( IN-CITY ?AUTO_9191 ?AUTO_9192 ) ( IN-CITY ?AUTO_9187 ?AUTO_9192 ) ( not ( = ?AUTO_9187 ?AUTO_9191 ) ) ( not ( = ?AUTO_9184 ?AUTO_9191 ) ) ( not ( = ?AUTO_9193 ?AUTO_9191 ) ) ( not ( = ?AUTO_9190 ?AUTO_9192 ) ) ( not ( = ?AUTO_9188 ?AUTO_9191 ) ) ( OBJ-AT ?AUTO_9183 ?AUTO_9191 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9183 ?AUTO_9189 ?AUTO_9191 )
      ( DELIVER-PKG ?AUTO_9183 ?AUTO_9184 )
      ( DELIVER-PKG-VERIFY ?AUTO_9183 ?AUTO_9184 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9194 - OBJ
      ?AUTO_9195 - LOCATION
    )
    :vars
    (
      ?AUTO_9197 - TRUCK
      ?AUTO_9204 - LOCATION
      ?AUTO_9202 - CITY
      ?AUTO_9200 - LOCATION
      ?AUTO_9196 - LOCATION
      ?AUTO_9198 - AIRPLANE
      ?AUTO_9199 - TRUCK
      ?AUTO_9203 - LOCATION
      ?AUTO_9201 - CITY
      ?AUTO_9205 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9197 ?AUTO_9204 ) ( IN-CITY ?AUTO_9204 ?AUTO_9202 ) ( IN-CITY ?AUTO_9195 ?AUTO_9202 ) ( not ( = ?AUTO_9195 ?AUTO_9204 ) ) ( AIRPORT ?AUTO_9200 ) ( AIRPORT ?AUTO_9204 ) ( not ( = ?AUTO_9200 ?AUTO_9204 ) ) ( not ( = ?AUTO_9195 ?AUTO_9200 ) ) ( AIRPORT ?AUTO_9196 ) ( AIRPLANE-AT ?AUTO_9198 ?AUTO_9196 ) ( not ( = ?AUTO_9196 ?AUTO_9200 ) ) ( not ( = ?AUTO_9195 ?AUTO_9196 ) ) ( not ( = ?AUTO_9204 ?AUTO_9196 ) ) ( not ( = ?AUTO_9197 ?AUTO_9199 ) ) ( IN-CITY ?AUTO_9203 ?AUTO_9201 ) ( IN-CITY ?AUTO_9200 ?AUTO_9201 ) ( not ( = ?AUTO_9200 ?AUTO_9203 ) ) ( not ( = ?AUTO_9195 ?AUTO_9203 ) ) ( not ( = ?AUTO_9204 ?AUTO_9203 ) ) ( not ( = ?AUTO_9202 ?AUTO_9201 ) ) ( not ( = ?AUTO_9196 ?AUTO_9203 ) ) ( OBJ-AT ?AUTO_9194 ?AUTO_9203 ) ( TRUCK-AT ?AUTO_9199 ?AUTO_9205 ) ( IN-CITY ?AUTO_9205 ?AUTO_9201 ) ( not ( = ?AUTO_9203 ?AUTO_9205 ) ) ( not ( = ?AUTO_9195 ?AUTO_9205 ) ) ( not ( = ?AUTO_9204 ?AUTO_9205 ) ) ( not ( = ?AUTO_9200 ?AUTO_9205 ) ) ( not ( = ?AUTO_9196 ?AUTO_9205 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9199 ?AUTO_9205 ?AUTO_9203 ?AUTO_9201 )
      ( DELIVER-PKG ?AUTO_9194 ?AUTO_9195 )
      ( DELIVER-PKG-VERIFY ?AUTO_9194 ?AUTO_9195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9208 - OBJ
      ?AUTO_9209 - LOCATION
    )
    :vars
    (
      ?AUTO_9210 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9210 ?AUTO_9209 ) ( IN-TRUCK ?AUTO_9208 ?AUTO_9210 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9208 ?AUTO_9210 ?AUTO_9209 )
      ( DELIVER-PKG-VERIFY ?AUTO_9208 ?AUTO_9209 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9213 - OBJ
      ?AUTO_9214 - LOCATION
    )
    :vars
    (
      ?AUTO_9215 - TRUCK
      ?AUTO_9216 - LOCATION
      ?AUTO_9217 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9213 ?AUTO_9215 ) ( TRUCK-AT ?AUTO_9215 ?AUTO_9216 ) ( IN-CITY ?AUTO_9216 ?AUTO_9217 ) ( IN-CITY ?AUTO_9214 ?AUTO_9217 ) ( not ( = ?AUTO_9214 ?AUTO_9216 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9215 ?AUTO_9216 ?AUTO_9214 ?AUTO_9217 )
      ( DELIVER-PKG ?AUTO_9213 ?AUTO_9214 )
      ( DELIVER-PKG-VERIFY ?AUTO_9213 ?AUTO_9214 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9218 - OBJ
      ?AUTO_9219 - LOCATION
    )
    :vars
    (
      ?AUTO_9220 - TRUCK
      ?AUTO_9221 - LOCATION
      ?AUTO_9222 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9220 ?AUTO_9221 ) ( IN-CITY ?AUTO_9221 ?AUTO_9222 ) ( IN-CITY ?AUTO_9219 ?AUTO_9222 ) ( not ( = ?AUTO_9219 ?AUTO_9221 ) ) ( OBJ-AT ?AUTO_9218 ?AUTO_9221 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9218 ?AUTO_9220 ?AUTO_9221 )
      ( DELIVER-PKG ?AUTO_9218 ?AUTO_9219 )
      ( DELIVER-PKG-VERIFY ?AUTO_9218 ?AUTO_9219 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9227 - OBJ
      ?AUTO_9228 - LOCATION
    )
    :vars
    (
      ?AUTO_9231 - TRUCK
      ?AUTO_9230 - LOCATION
      ?AUTO_9229 - CITY
      ?AUTO_9232 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9231 ?AUTO_9230 ) ( IN-CITY ?AUTO_9230 ?AUTO_9229 ) ( IN-CITY ?AUTO_9228 ?AUTO_9229 ) ( not ( = ?AUTO_9228 ?AUTO_9230 ) ) ( IN-AIRPLANE ?AUTO_9227 ?AUTO_9232 ) ( AIRPLANE-AT ?AUTO_9232 ?AUTO_9230 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9227 ?AUTO_9232 ?AUTO_9230 )
      ( DELIVER-PKG ?AUTO_9227 ?AUTO_9228 )
      ( DELIVER-PKG-VERIFY ?AUTO_9227 ?AUTO_9228 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9233 - OBJ
      ?AUTO_9234 - LOCATION
    )
    :vars
    (
      ?AUTO_9237 - TRUCK
      ?AUTO_9235 - LOCATION
      ?AUTO_9236 - CITY
      ?AUTO_9238 - AIRPLANE
      ?AUTO_9239 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9237 ?AUTO_9235 ) ( IN-CITY ?AUTO_9235 ?AUTO_9236 ) ( IN-CITY ?AUTO_9234 ?AUTO_9236 ) ( not ( = ?AUTO_9234 ?AUTO_9235 ) ) ( IN-AIRPLANE ?AUTO_9233 ?AUTO_9238 ) ( AIRPORT ?AUTO_9239 ) ( AIRPORT ?AUTO_9235 ) ( AIRPLANE-AT ?AUTO_9238 ?AUTO_9239 ) ( not ( = ?AUTO_9239 ?AUTO_9235 ) ) ( not ( = ?AUTO_9234 ?AUTO_9239 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9238 ?AUTO_9239 ?AUTO_9235 )
      ( DELIVER-PKG ?AUTO_9233 ?AUTO_9234 )
      ( DELIVER-PKG-VERIFY ?AUTO_9233 ?AUTO_9234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9244 - OBJ
      ?AUTO_9245 - LOCATION
    )
    :vars
    (
      ?AUTO_9247 - TRUCK
      ?AUTO_9250 - LOCATION
      ?AUTO_9246 - CITY
      ?AUTO_9249 - LOCATION
      ?AUTO_9248 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9247 ?AUTO_9250 ) ( IN-CITY ?AUTO_9250 ?AUTO_9246 ) ( IN-CITY ?AUTO_9245 ?AUTO_9246 ) ( not ( = ?AUTO_9245 ?AUTO_9250 ) ) ( AIRPORT ?AUTO_9249 ) ( AIRPORT ?AUTO_9250 ) ( AIRPLANE-AT ?AUTO_9248 ?AUTO_9249 ) ( not ( = ?AUTO_9249 ?AUTO_9250 ) ) ( not ( = ?AUTO_9245 ?AUTO_9249 ) ) ( OBJ-AT ?AUTO_9244 ?AUTO_9249 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9244 ?AUTO_9248 ?AUTO_9249 )
      ( DELIVER-PKG ?AUTO_9244 ?AUTO_9245 )
      ( DELIVER-PKG-VERIFY ?AUTO_9244 ?AUTO_9245 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9251 - OBJ
      ?AUTO_9252 - LOCATION
    )
    :vars
    (
      ?AUTO_9254 - TRUCK
      ?AUTO_9257 - LOCATION
      ?AUTO_9253 - CITY
      ?AUTO_9256 - LOCATION
      ?AUTO_9258 - LOCATION
      ?AUTO_9255 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9254 ?AUTO_9257 ) ( IN-CITY ?AUTO_9257 ?AUTO_9253 ) ( IN-CITY ?AUTO_9252 ?AUTO_9253 ) ( not ( = ?AUTO_9252 ?AUTO_9257 ) ) ( AIRPORT ?AUTO_9256 ) ( AIRPORT ?AUTO_9257 ) ( not ( = ?AUTO_9256 ?AUTO_9257 ) ) ( not ( = ?AUTO_9252 ?AUTO_9256 ) ) ( OBJ-AT ?AUTO_9251 ?AUTO_9256 ) ( AIRPORT ?AUTO_9258 ) ( AIRPLANE-AT ?AUTO_9255 ?AUTO_9258 ) ( not ( = ?AUTO_9258 ?AUTO_9256 ) ) ( not ( = ?AUTO_9252 ?AUTO_9258 ) ) ( not ( = ?AUTO_9257 ?AUTO_9258 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9255 ?AUTO_9258 ?AUTO_9256 )
      ( DELIVER-PKG ?AUTO_9251 ?AUTO_9252 )
      ( DELIVER-PKG-VERIFY ?AUTO_9251 ?AUTO_9252 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9261 - OBJ
      ?AUTO_9262 - LOCATION
    )
    :vars
    (
      ?AUTO_9263 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9263 ?AUTO_9262 ) ( IN-TRUCK ?AUTO_9261 ?AUTO_9263 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9261 ?AUTO_9263 ?AUTO_9262 )
      ( DELIVER-PKG-VERIFY ?AUTO_9261 ?AUTO_9262 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9264 - OBJ
      ?AUTO_9265 - LOCATION
    )
    :vars
    (
      ?AUTO_9266 - TRUCK
      ?AUTO_9267 - LOCATION
      ?AUTO_9268 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9264 ?AUTO_9266 ) ( TRUCK-AT ?AUTO_9266 ?AUTO_9267 ) ( IN-CITY ?AUTO_9267 ?AUTO_9268 ) ( IN-CITY ?AUTO_9265 ?AUTO_9268 ) ( not ( = ?AUTO_9265 ?AUTO_9267 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9266 ?AUTO_9267 ?AUTO_9265 ?AUTO_9268 )
      ( DELIVER-PKG ?AUTO_9264 ?AUTO_9265 )
      ( DELIVER-PKG-VERIFY ?AUTO_9264 ?AUTO_9265 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9269 - OBJ
      ?AUTO_9270 - LOCATION
    )
    :vars
    (
      ?AUTO_9271 - TRUCK
      ?AUTO_9272 - LOCATION
      ?AUTO_9273 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9271 ?AUTO_9272 ) ( IN-CITY ?AUTO_9272 ?AUTO_9273 ) ( IN-CITY ?AUTO_9270 ?AUTO_9273 ) ( not ( = ?AUTO_9270 ?AUTO_9272 ) ) ( OBJ-AT ?AUTO_9269 ?AUTO_9272 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9269 ?AUTO_9271 ?AUTO_9272 )
      ( DELIVER-PKG ?AUTO_9269 ?AUTO_9270 )
      ( DELIVER-PKG-VERIFY ?AUTO_9269 ?AUTO_9270 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9274 - OBJ
      ?AUTO_9275 - LOCATION
    )
    :vars
    (
      ?AUTO_9276 - LOCATION
      ?AUTO_9278 - CITY
      ?AUTO_9277 - TRUCK
      ?AUTO_9279 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9276 ?AUTO_9278 ) ( IN-CITY ?AUTO_9275 ?AUTO_9278 ) ( not ( = ?AUTO_9275 ?AUTO_9276 ) ) ( OBJ-AT ?AUTO_9274 ?AUTO_9276 ) ( TRUCK-AT ?AUTO_9277 ?AUTO_9279 ) ( IN-CITY ?AUTO_9279 ?AUTO_9278 ) ( not ( = ?AUTO_9276 ?AUTO_9279 ) ) ( not ( = ?AUTO_9275 ?AUTO_9279 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9277 ?AUTO_9279 ?AUTO_9276 ?AUTO_9278 )
      ( DELIVER-PKG ?AUTO_9274 ?AUTO_9275 )
      ( DELIVER-PKG-VERIFY ?AUTO_9274 ?AUTO_9275 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9282 - OBJ
      ?AUTO_9283 - LOCATION
    )
    :vars
    (
      ?AUTO_9284 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9282 ?AUTO_9284 ) ( AIRPLANE-AT ?AUTO_9284 ?AUTO_9283 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9282 ?AUTO_9284 ?AUTO_9283 )
      ( DELIVER-PKG-VERIFY ?AUTO_9282 ?AUTO_9283 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9285 - OBJ
      ?AUTO_9286 - LOCATION
    )
    :vars
    (
      ?AUTO_9287 - AIRPLANE
      ?AUTO_9288 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9285 ?AUTO_9287 ) ( AIRPORT ?AUTO_9288 ) ( AIRPORT ?AUTO_9286 ) ( AIRPLANE-AT ?AUTO_9287 ?AUTO_9288 ) ( not ( = ?AUTO_9288 ?AUTO_9286 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9287 ?AUTO_9288 ?AUTO_9286 )
      ( DELIVER-PKG ?AUTO_9285 ?AUTO_9286 )
      ( DELIVER-PKG-VERIFY ?AUTO_9285 ?AUTO_9286 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9291 - OBJ
      ?AUTO_9292 - LOCATION
    )
    :vars
    (
      ?AUTO_9294 - LOCATION
      ?AUTO_9293 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9294 ) ( AIRPORT ?AUTO_9292 ) ( AIRPLANE-AT ?AUTO_9293 ?AUTO_9294 ) ( not ( = ?AUTO_9294 ?AUTO_9292 ) ) ( OBJ-AT ?AUTO_9291 ?AUTO_9294 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9291 ?AUTO_9293 ?AUTO_9294 )
      ( DELIVER-PKG ?AUTO_9291 ?AUTO_9292 )
      ( DELIVER-PKG-VERIFY ?AUTO_9291 ?AUTO_9292 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9295 - OBJ
      ?AUTO_9296 - LOCATION
    )
    :vars
    (
      ?AUTO_9298 - LOCATION
      ?AUTO_9297 - AIRPLANE
      ?AUTO_9299 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9298 ) ( AIRPORT ?AUTO_9296 ) ( AIRPLANE-AT ?AUTO_9297 ?AUTO_9298 ) ( not ( = ?AUTO_9298 ?AUTO_9296 ) ) ( TRUCK-AT ?AUTO_9299 ?AUTO_9298 ) ( IN-TRUCK ?AUTO_9295 ?AUTO_9299 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9295 ?AUTO_9299 ?AUTO_9298 )
      ( DELIVER-PKG ?AUTO_9295 ?AUTO_9296 )
      ( DELIVER-PKG-VERIFY ?AUTO_9295 ?AUTO_9296 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9300 - OBJ
      ?AUTO_9301 - LOCATION
    )
    :vars
    (
      ?AUTO_9302 - LOCATION
      ?AUTO_9303 - AIRPLANE
      ?AUTO_9304 - TRUCK
      ?AUTO_9305 - LOCATION
      ?AUTO_9306 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9302 ) ( AIRPORT ?AUTO_9301 ) ( AIRPLANE-AT ?AUTO_9303 ?AUTO_9302 ) ( not ( = ?AUTO_9302 ?AUTO_9301 ) ) ( IN-TRUCK ?AUTO_9300 ?AUTO_9304 ) ( TRUCK-AT ?AUTO_9304 ?AUTO_9305 ) ( IN-CITY ?AUTO_9305 ?AUTO_9306 ) ( IN-CITY ?AUTO_9302 ?AUTO_9306 ) ( not ( = ?AUTO_9302 ?AUTO_9305 ) ) ( not ( = ?AUTO_9301 ?AUTO_9305 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9304 ?AUTO_9305 ?AUTO_9302 ?AUTO_9306 )
      ( DELIVER-PKG ?AUTO_9300 ?AUTO_9301 )
      ( DELIVER-PKG-VERIFY ?AUTO_9300 ?AUTO_9301 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9307 - OBJ
      ?AUTO_9308 - LOCATION
    )
    :vars
    (
      ?AUTO_9312 - LOCATION
      ?AUTO_9311 - AIRPLANE
      ?AUTO_9313 - TRUCK
      ?AUTO_9309 - LOCATION
      ?AUTO_9310 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9312 ) ( AIRPORT ?AUTO_9308 ) ( AIRPLANE-AT ?AUTO_9311 ?AUTO_9312 ) ( not ( = ?AUTO_9312 ?AUTO_9308 ) ) ( TRUCK-AT ?AUTO_9313 ?AUTO_9309 ) ( IN-CITY ?AUTO_9309 ?AUTO_9310 ) ( IN-CITY ?AUTO_9312 ?AUTO_9310 ) ( not ( = ?AUTO_9312 ?AUTO_9309 ) ) ( not ( = ?AUTO_9308 ?AUTO_9309 ) ) ( OBJ-AT ?AUTO_9307 ?AUTO_9309 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9307 ?AUTO_9313 ?AUTO_9309 )
      ( DELIVER-PKG ?AUTO_9307 ?AUTO_9308 )
      ( DELIVER-PKG-VERIFY ?AUTO_9307 ?AUTO_9308 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9314 - OBJ
      ?AUTO_9315 - LOCATION
    )
    :vars
    (
      ?AUTO_9319 - LOCATION
      ?AUTO_9318 - AIRPLANE
      ?AUTO_9316 - LOCATION
      ?AUTO_9320 - CITY
      ?AUTO_9317 - TRUCK
      ?AUTO_9321 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9319 ) ( AIRPORT ?AUTO_9315 ) ( AIRPLANE-AT ?AUTO_9318 ?AUTO_9319 ) ( not ( = ?AUTO_9319 ?AUTO_9315 ) ) ( IN-CITY ?AUTO_9316 ?AUTO_9320 ) ( IN-CITY ?AUTO_9319 ?AUTO_9320 ) ( not ( = ?AUTO_9319 ?AUTO_9316 ) ) ( not ( = ?AUTO_9315 ?AUTO_9316 ) ) ( OBJ-AT ?AUTO_9314 ?AUTO_9316 ) ( TRUCK-AT ?AUTO_9317 ?AUTO_9321 ) ( IN-CITY ?AUTO_9321 ?AUTO_9320 ) ( not ( = ?AUTO_9316 ?AUTO_9321 ) ) ( not ( = ?AUTO_9315 ?AUTO_9321 ) ) ( not ( = ?AUTO_9319 ?AUTO_9321 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9317 ?AUTO_9321 ?AUTO_9316 ?AUTO_9320 )
      ( DELIVER-PKG ?AUTO_9314 ?AUTO_9315 )
      ( DELIVER-PKG-VERIFY ?AUTO_9314 ?AUTO_9315 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9324 - OBJ
      ?AUTO_9325 - LOCATION
    )
    :vars
    (
      ?AUTO_9326 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9326 ?AUTO_9325 ) ( IN-TRUCK ?AUTO_9324 ?AUTO_9326 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9324 ?AUTO_9326 ?AUTO_9325 )
      ( DELIVER-PKG-VERIFY ?AUTO_9324 ?AUTO_9325 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9327 - OBJ
      ?AUTO_9328 - LOCATION
    )
    :vars
    (
      ?AUTO_9329 - TRUCK
      ?AUTO_9330 - LOCATION
      ?AUTO_9331 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9327 ?AUTO_9329 ) ( TRUCK-AT ?AUTO_9329 ?AUTO_9330 ) ( IN-CITY ?AUTO_9330 ?AUTO_9331 ) ( IN-CITY ?AUTO_9328 ?AUTO_9331 ) ( not ( = ?AUTO_9328 ?AUTO_9330 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9329 ?AUTO_9330 ?AUTO_9328 ?AUTO_9331 )
      ( DELIVER-PKG ?AUTO_9327 ?AUTO_9328 )
      ( DELIVER-PKG-VERIFY ?AUTO_9327 ?AUTO_9328 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9332 - OBJ
      ?AUTO_9333 - LOCATION
    )
    :vars
    (
      ?AUTO_9334 - TRUCK
      ?AUTO_9335 - LOCATION
      ?AUTO_9336 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9334 ?AUTO_9335 ) ( IN-CITY ?AUTO_9335 ?AUTO_9336 ) ( IN-CITY ?AUTO_9333 ?AUTO_9336 ) ( not ( = ?AUTO_9333 ?AUTO_9335 ) ) ( OBJ-AT ?AUTO_9332 ?AUTO_9335 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9332 ?AUTO_9334 ?AUTO_9335 )
      ( DELIVER-PKG ?AUTO_9332 ?AUTO_9333 )
      ( DELIVER-PKG-VERIFY ?AUTO_9332 ?AUTO_9333 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9337 - OBJ
      ?AUTO_9338 - LOCATION
    )
    :vars
    (
      ?AUTO_9339 - LOCATION
      ?AUTO_9341 - CITY
      ?AUTO_9340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9339 ?AUTO_9341 ) ( IN-CITY ?AUTO_9338 ?AUTO_9341 ) ( not ( = ?AUTO_9338 ?AUTO_9339 ) ) ( OBJ-AT ?AUTO_9337 ?AUTO_9339 ) ( TRUCK-AT ?AUTO_9340 ?AUTO_9338 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9340 ?AUTO_9338 ?AUTO_9339 ?AUTO_9341 )
      ( DELIVER-PKG ?AUTO_9337 ?AUTO_9338 )
      ( DELIVER-PKG-VERIFY ?AUTO_9337 ?AUTO_9338 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9360 - OBJ
      ?AUTO_9361 - LOCATION
    )
    :vars
    (
      ?AUTO_9362 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9360 ?AUTO_9362 ) ( AIRPLANE-AT ?AUTO_9362 ?AUTO_9361 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9360 ?AUTO_9362 ?AUTO_9361 )
      ( DELIVER-PKG-VERIFY ?AUTO_9360 ?AUTO_9361 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9363 - OBJ
      ?AUTO_9364 - LOCATION
    )
    :vars
    (
      ?AUTO_9365 - AIRPLANE
      ?AUTO_9366 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9363 ?AUTO_9365 ) ( AIRPORT ?AUTO_9366 ) ( AIRPORT ?AUTO_9364 ) ( AIRPLANE-AT ?AUTO_9365 ?AUTO_9366 ) ( not ( = ?AUTO_9366 ?AUTO_9364 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9365 ?AUTO_9366 ?AUTO_9364 )
      ( DELIVER-PKG ?AUTO_9363 ?AUTO_9364 )
      ( DELIVER-PKG-VERIFY ?AUTO_9363 ?AUTO_9364 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9367 - OBJ
      ?AUTO_9368 - LOCATION
    )
    :vars
    (
      ?AUTO_9370 - LOCATION
      ?AUTO_9369 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9370 ) ( AIRPORT ?AUTO_9368 ) ( AIRPLANE-AT ?AUTO_9369 ?AUTO_9370 ) ( not ( = ?AUTO_9370 ?AUTO_9368 ) ) ( OBJ-AT ?AUTO_9367 ?AUTO_9370 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9367 ?AUTO_9369 ?AUTO_9370 )
      ( DELIVER-PKG ?AUTO_9367 ?AUTO_9368 )
      ( DELIVER-PKG-VERIFY ?AUTO_9367 ?AUTO_9368 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9371 - OBJ
      ?AUTO_9372 - LOCATION
    )
    :vars
    (
      ?AUTO_9374 - LOCATION
      ?AUTO_9373 - AIRPLANE
      ?AUTO_9375 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9374 ) ( AIRPORT ?AUTO_9372 ) ( AIRPLANE-AT ?AUTO_9373 ?AUTO_9374 ) ( not ( = ?AUTO_9374 ?AUTO_9372 ) ) ( TRUCK-AT ?AUTO_9375 ?AUTO_9374 ) ( IN-TRUCK ?AUTO_9371 ?AUTO_9375 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9371 ?AUTO_9375 ?AUTO_9374 )
      ( DELIVER-PKG ?AUTO_9371 ?AUTO_9372 )
      ( DELIVER-PKG-VERIFY ?AUTO_9371 ?AUTO_9372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9376 - OBJ
      ?AUTO_9377 - LOCATION
    )
    :vars
    (
      ?AUTO_9379 - LOCATION
      ?AUTO_9378 - AIRPLANE
      ?AUTO_9380 - TRUCK
      ?AUTO_9381 - LOCATION
      ?AUTO_9382 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9379 ) ( AIRPORT ?AUTO_9377 ) ( AIRPLANE-AT ?AUTO_9378 ?AUTO_9379 ) ( not ( = ?AUTO_9379 ?AUTO_9377 ) ) ( IN-TRUCK ?AUTO_9376 ?AUTO_9380 ) ( TRUCK-AT ?AUTO_9380 ?AUTO_9381 ) ( IN-CITY ?AUTO_9381 ?AUTO_9382 ) ( IN-CITY ?AUTO_9379 ?AUTO_9382 ) ( not ( = ?AUTO_9379 ?AUTO_9381 ) ) ( not ( = ?AUTO_9377 ?AUTO_9381 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9380 ?AUTO_9381 ?AUTO_9379 ?AUTO_9382 )
      ( DELIVER-PKG ?AUTO_9376 ?AUTO_9377 )
      ( DELIVER-PKG-VERIFY ?AUTO_9376 ?AUTO_9377 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9383 - OBJ
      ?AUTO_9384 - LOCATION
    )
    :vars
    (
      ?AUTO_9386 - LOCATION
      ?AUTO_9385 - AIRPLANE
      ?AUTO_9387 - TRUCK
      ?AUTO_9389 - LOCATION
      ?AUTO_9388 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9386 ) ( AIRPORT ?AUTO_9384 ) ( AIRPLANE-AT ?AUTO_9385 ?AUTO_9386 ) ( not ( = ?AUTO_9386 ?AUTO_9384 ) ) ( TRUCK-AT ?AUTO_9387 ?AUTO_9389 ) ( IN-CITY ?AUTO_9389 ?AUTO_9388 ) ( IN-CITY ?AUTO_9386 ?AUTO_9388 ) ( not ( = ?AUTO_9386 ?AUTO_9389 ) ) ( not ( = ?AUTO_9384 ?AUTO_9389 ) ) ( OBJ-AT ?AUTO_9383 ?AUTO_9389 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9383 ?AUTO_9387 ?AUTO_9389 )
      ( DELIVER-PKG ?AUTO_9383 ?AUTO_9384 )
      ( DELIVER-PKG-VERIFY ?AUTO_9383 ?AUTO_9384 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9390 - OBJ
      ?AUTO_9391 - LOCATION
    )
    :vars
    (
      ?AUTO_9392 - LOCATION
      ?AUTO_9396 - AIRPLANE
      ?AUTO_9393 - LOCATION
      ?AUTO_9395 - CITY
      ?AUTO_9394 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9392 ) ( AIRPORT ?AUTO_9391 ) ( AIRPLANE-AT ?AUTO_9396 ?AUTO_9392 ) ( not ( = ?AUTO_9392 ?AUTO_9391 ) ) ( IN-CITY ?AUTO_9393 ?AUTO_9395 ) ( IN-CITY ?AUTO_9392 ?AUTO_9395 ) ( not ( = ?AUTO_9392 ?AUTO_9393 ) ) ( not ( = ?AUTO_9391 ?AUTO_9393 ) ) ( OBJ-AT ?AUTO_9390 ?AUTO_9393 ) ( TRUCK-AT ?AUTO_9394 ?AUTO_9392 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9394 ?AUTO_9392 ?AUTO_9393 ?AUTO_9395 )
      ( DELIVER-PKG ?AUTO_9390 ?AUTO_9391 )
      ( DELIVER-PKG-VERIFY ?AUTO_9390 ?AUTO_9391 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9399 - OBJ
      ?AUTO_9400 - LOCATION
    )
    :vars
    (
      ?AUTO_9403 - LOCATION
      ?AUTO_9401 - LOCATION
      ?AUTO_9404 - CITY
      ?AUTO_9405 - TRUCK
      ?AUTO_9406 - LOCATION
      ?AUTO_9402 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_9403 ) ( AIRPORT ?AUTO_9400 ) ( not ( = ?AUTO_9403 ?AUTO_9400 ) ) ( IN-CITY ?AUTO_9401 ?AUTO_9404 ) ( IN-CITY ?AUTO_9403 ?AUTO_9404 ) ( not ( = ?AUTO_9403 ?AUTO_9401 ) ) ( not ( = ?AUTO_9400 ?AUTO_9401 ) ) ( OBJ-AT ?AUTO_9399 ?AUTO_9401 ) ( TRUCK-AT ?AUTO_9405 ?AUTO_9403 ) ( AIRPORT ?AUTO_9406 ) ( AIRPLANE-AT ?AUTO_9402 ?AUTO_9406 ) ( not ( = ?AUTO_9406 ?AUTO_9403 ) ) ( not ( = ?AUTO_9400 ?AUTO_9406 ) ) ( not ( = ?AUTO_9401 ?AUTO_9406 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9402 ?AUTO_9406 ?AUTO_9403 )
      ( DELIVER-PKG ?AUTO_9399 ?AUTO_9400 )
      ( DELIVER-PKG-VERIFY ?AUTO_9399 ?AUTO_9400 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9421 - OBJ
      ?AUTO_9422 - LOCATION
    )
    :vars
    (
      ?AUTO_9423 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9423 ?AUTO_9422 ) ( IN-TRUCK ?AUTO_9421 ?AUTO_9423 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9421 ?AUTO_9423 ?AUTO_9422 )
      ( DELIVER-PKG-VERIFY ?AUTO_9421 ?AUTO_9422 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9424 - OBJ
      ?AUTO_9425 - LOCATION
    )
    :vars
    (
      ?AUTO_9426 - TRUCK
      ?AUTO_9427 - LOCATION
      ?AUTO_9428 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9424 ?AUTO_9426 ) ( TRUCK-AT ?AUTO_9426 ?AUTO_9427 ) ( IN-CITY ?AUTO_9427 ?AUTO_9428 ) ( IN-CITY ?AUTO_9425 ?AUTO_9428 ) ( not ( = ?AUTO_9425 ?AUTO_9427 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9426 ?AUTO_9427 ?AUTO_9425 ?AUTO_9428 )
      ( DELIVER-PKG ?AUTO_9424 ?AUTO_9425 )
      ( DELIVER-PKG-VERIFY ?AUTO_9424 ?AUTO_9425 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9433 - OBJ
      ?AUTO_9434 - LOCATION
    )
    :vars
    (
      ?AUTO_9437 - TRUCK
      ?AUTO_9435 - LOCATION
      ?AUTO_9436 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9437 ?AUTO_9435 ) ( IN-CITY ?AUTO_9435 ?AUTO_9436 ) ( IN-CITY ?AUTO_9434 ?AUTO_9436 ) ( not ( = ?AUTO_9434 ?AUTO_9435 ) ) ( OBJ-AT ?AUTO_9433 ?AUTO_9435 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9433 ?AUTO_9437 ?AUTO_9435 )
      ( DELIVER-PKG ?AUTO_9433 ?AUTO_9434 )
      ( DELIVER-PKG-VERIFY ?AUTO_9433 ?AUTO_9434 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9438 - OBJ
      ?AUTO_9439 - LOCATION
    )
    :vars
    (
      ?AUTO_9440 - LOCATION
      ?AUTO_9441 - CITY
      ?AUTO_9442 - TRUCK
      ?AUTO_9443 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9440 ?AUTO_9441 ) ( IN-CITY ?AUTO_9439 ?AUTO_9441 ) ( not ( = ?AUTO_9439 ?AUTO_9440 ) ) ( OBJ-AT ?AUTO_9438 ?AUTO_9440 ) ( TRUCK-AT ?AUTO_9442 ?AUTO_9443 ) ( IN-CITY ?AUTO_9443 ?AUTO_9441 ) ( not ( = ?AUTO_9440 ?AUTO_9443 ) ) ( not ( = ?AUTO_9439 ?AUTO_9443 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9442 ?AUTO_9443 ?AUTO_9440 ?AUTO_9441 )
      ( DELIVER-PKG ?AUTO_9438 ?AUTO_9439 )
      ( DELIVER-PKG-VERIFY ?AUTO_9438 ?AUTO_9439 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9476 - OBJ
      ?AUTO_9477 - LOCATION
    )
    :vars
    (
      ?AUTO_9478 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9478 ?AUTO_9477 ) ( IN-TRUCK ?AUTO_9476 ?AUTO_9478 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9476 ?AUTO_9478 ?AUTO_9477 )
      ( DELIVER-PKG-VERIFY ?AUTO_9476 ?AUTO_9477 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9479 - OBJ
      ?AUTO_9480 - LOCATION
    )
    :vars
    (
      ?AUTO_9481 - TRUCK
      ?AUTO_9482 - LOCATION
      ?AUTO_9483 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9479 ?AUTO_9481 ) ( TRUCK-AT ?AUTO_9481 ?AUTO_9482 ) ( IN-CITY ?AUTO_9482 ?AUTO_9483 ) ( IN-CITY ?AUTO_9480 ?AUTO_9483 ) ( not ( = ?AUTO_9480 ?AUTO_9482 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9481 ?AUTO_9482 ?AUTO_9480 ?AUTO_9483 )
      ( DELIVER-PKG ?AUTO_9479 ?AUTO_9480 )
      ( DELIVER-PKG-VERIFY ?AUTO_9479 ?AUTO_9480 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9488 - OBJ
      ?AUTO_9489 - LOCATION
    )
    :vars
    (
      ?AUTO_9492 - TRUCK
      ?AUTO_9490 - LOCATION
      ?AUTO_9491 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9492 ?AUTO_9490 ) ( IN-CITY ?AUTO_9490 ?AUTO_9491 ) ( IN-CITY ?AUTO_9489 ?AUTO_9491 ) ( not ( = ?AUTO_9489 ?AUTO_9490 ) ) ( OBJ-AT ?AUTO_9488 ?AUTO_9490 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9488 ?AUTO_9492 ?AUTO_9490 )
      ( DELIVER-PKG ?AUTO_9488 ?AUTO_9489 )
      ( DELIVER-PKG-VERIFY ?AUTO_9488 ?AUTO_9489 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9493 - OBJ
      ?AUTO_9494 - LOCATION
    )
    :vars
    (
      ?AUTO_9496 - LOCATION
      ?AUTO_9495 - CITY
      ?AUTO_9497 - TRUCK
      ?AUTO_9498 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9496 ?AUTO_9495 ) ( IN-CITY ?AUTO_9494 ?AUTO_9495 ) ( not ( = ?AUTO_9494 ?AUTO_9496 ) ) ( OBJ-AT ?AUTO_9493 ?AUTO_9496 ) ( TRUCK-AT ?AUTO_9497 ?AUTO_9498 ) ( IN-CITY ?AUTO_9498 ?AUTO_9495 ) ( not ( = ?AUTO_9496 ?AUTO_9498 ) ) ( not ( = ?AUTO_9494 ?AUTO_9498 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9497 ?AUTO_9498 ?AUTO_9496 ?AUTO_9495 )
      ( DELIVER-PKG ?AUTO_9493 ?AUTO_9494 )
      ( DELIVER-PKG-VERIFY ?AUTO_9493 ?AUTO_9494 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9501 - OBJ
      ?AUTO_9502 - LOCATION
    )
    :vars
    (
      ?AUTO_9505 - LOCATION
      ?AUTO_9503 - CITY
      ?AUTO_9504 - LOCATION
      ?AUTO_9506 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9505 ?AUTO_9503 ) ( IN-CITY ?AUTO_9502 ?AUTO_9503 ) ( not ( = ?AUTO_9502 ?AUTO_9505 ) ) ( OBJ-AT ?AUTO_9501 ?AUTO_9505 ) ( IN-CITY ?AUTO_9504 ?AUTO_9503 ) ( not ( = ?AUTO_9505 ?AUTO_9504 ) ) ( not ( = ?AUTO_9502 ?AUTO_9504 ) ) ( TRUCK-AT ?AUTO_9506 ?AUTO_9502 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9506 ?AUTO_9502 ?AUTO_9504 ?AUTO_9503 )
      ( DELIVER-PKG ?AUTO_9501 ?AUTO_9502 )
      ( DELIVER-PKG-VERIFY ?AUTO_9501 ?AUTO_9502 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9507 - OBJ
      ?AUTO_9508 - LOCATION
    )
    :vars
    (
      ?AUTO_9510 - LOCATION
      ?AUTO_9511 - CITY
      ?AUTO_9512 - LOCATION
      ?AUTO_9509 - TRUCK
      ?AUTO_9513 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9510 ?AUTO_9511 ) ( IN-CITY ?AUTO_9508 ?AUTO_9511 ) ( not ( = ?AUTO_9508 ?AUTO_9510 ) ) ( IN-CITY ?AUTO_9512 ?AUTO_9511 ) ( not ( = ?AUTO_9510 ?AUTO_9512 ) ) ( not ( = ?AUTO_9508 ?AUTO_9512 ) ) ( TRUCK-AT ?AUTO_9509 ?AUTO_9508 ) ( IN-AIRPLANE ?AUTO_9507 ?AUTO_9513 ) ( AIRPLANE-AT ?AUTO_9513 ?AUTO_9510 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_9507 ?AUTO_9513 ?AUTO_9510 )
      ( DELIVER-PKG ?AUTO_9507 ?AUTO_9508 )
      ( DELIVER-PKG-VERIFY ?AUTO_9507 ?AUTO_9508 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9514 - OBJ
      ?AUTO_9515 - LOCATION
    )
    :vars
    (
      ?AUTO_9517 - LOCATION
      ?AUTO_9518 - CITY
      ?AUTO_9520 - LOCATION
      ?AUTO_9516 - TRUCK
      ?AUTO_9519 - AIRPLANE
      ?AUTO_9521 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9517 ?AUTO_9518 ) ( IN-CITY ?AUTO_9515 ?AUTO_9518 ) ( not ( = ?AUTO_9515 ?AUTO_9517 ) ) ( IN-CITY ?AUTO_9520 ?AUTO_9518 ) ( not ( = ?AUTO_9517 ?AUTO_9520 ) ) ( not ( = ?AUTO_9515 ?AUTO_9520 ) ) ( TRUCK-AT ?AUTO_9516 ?AUTO_9515 ) ( IN-AIRPLANE ?AUTO_9514 ?AUTO_9519 ) ( AIRPORT ?AUTO_9521 ) ( AIRPORT ?AUTO_9517 ) ( AIRPLANE-AT ?AUTO_9519 ?AUTO_9521 ) ( not ( = ?AUTO_9521 ?AUTO_9517 ) ) ( not ( = ?AUTO_9515 ?AUTO_9521 ) ) ( not ( = ?AUTO_9520 ?AUTO_9521 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9519 ?AUTO_9521 ?AUTO_9517 )
      ( DELIVER-PKG ?AUTO_9514 ?AUTO_9515 )
      ( DELIVER-PKG-VERIFY ?AUTO_9514 ?AUTO_9515 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9522 - OBJ
      ?AUTO_9523 - LOCATION
    )
    :vars
    (
      ?AUTO_9524 - LOCATION
      ?AUTO_9529 - CITY
      ?AUTO_9527 - LOCATION
      ?AUTO_9525 - TRUCK
      ?AUTO_9528 - LOCATION
      ?AUTO_9526 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9524 ?AUTO_9529 ) ( IN-CITY ?AUTO_9523 ?AUTO_9529 ) ( not ( = ?AUTO_9523 ?AUTO_9524 ) ) ( IN-CITY ?AUTO_9527 ?AUTO_9529 ) ( not ( = ?AUTO_9524 ?AUTO_9527 ) ) ( not ( = ?AUTO_9523 ?AUTO_9527 ) ) ( TRUCK-AT ?AUTO_9525 ?AUTO_9523 ) ( AIRPORT ?AUTO_9528 ) ( AIRPORT ?AUTO_9524 ) ( AIRPLANE-AT ?AUTO_9526 ?AUTO_9528 ) ( not ( = ?AUTO_9528 ?AUTO_9524 ) ) ( not ( = ?AUTO_9523 ?AUTO_9528 ) ) ( not ( = ?AUTO_9527 ?AUTO_9528 ) ) ( OBJ-AT ?AUTO_9522 ?AUTO_9528 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9522 ?AUTO_9526 ?AUTO_9528 )
      ( DELIVER-PKG ?AUTO_9522 ?AUTO_9523 )
      ( DELIVER-PKG-VERIFY ?AUTO_9522 ?AUTO_9523 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9530 - OBJ
      ?AUTO_9531 - LOCATION
    )
    :vars
    (
      ?AUTO_9533 - LOCATION
      ?AUTO_9537 - CITY
      ?AUTO_9532 - LOCATION
      ?AUTO_9535 - TRUCK
      ?AUTO_9536 - LOCATION
      ?AUTO_9534 - AIRPLANE
      ?AUTO_9538 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9533 ?AUTO_9537 ) ( IN-CITY ?AUTO_9531 ?AUTO_9537 ) ( not ( = ?AUTO_9531 ?AUTO_9533 ) ) ( IN-CITY ?AUTO_9532 ?AUTO_9537 ) ( not ( = ?AUTO_9533 ?AUTO_9532 ) ) ( not ( = ?AUTO_9531 ?AUTO_9532 ) ) ( TRUCK-AT ?AUTO_9535 ?AUTO_9531 ) ( AIRPORT ?AUTO_9536 ) ( AIRPORT ?AUTO_9533 ) ( AIRPLANE-AT ?AUTO_9534 ?AUTO_9536 ) ( not ( = ?AUTO_9536 ?AUTO_9533 ) ) ( not ( = ?AUTO_9531 ?AUTO_9536 ) ) ( not ( = ?AUTO_9532 ?AUTO_9536 ) ) ( TRUCK-AT ?AUTO_9538 ?AUTO_9536 ) ( IN-TRUCK ?AUTO_9530 ?AUTO_9538 ) ( not ( = ?AUTO_9535 ?AUTO_9538 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9530 ?AUTO_9538 ?AUTO_9536 )
      ( DELIVER-PKG ?AUTO_9530 ?AUTO_9531 )
      ( DELIVER-PKG-VERIFY ?AUTO_9530 ?AUTO_9531 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9539 - OBJ
      ?AUTO_9540 - LOCATION
    )
    :vars
    (
      ?AUTO_9545 - LOCATION
      ?AUTO_9546 - CITY
      ?AUTO_9542 - LOCATION
      ?AUTO_9541 - TRUCK
      ?AUTO_9543 - LOCATION
      ?AUTO_9544 - AIRPLANE
      ?AUTO_9547 - TRUCK
      ?AUTO_9548 - LOCATION
      ?AUTO_9549 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9545 ?AUTO_9546 ) ( IN-CITY ?AUTO_9540 ?AUTO_9546 ) ( not ( = ?AUTO_9540 ?AUTO_9545 ) ) ( IN-CITY ?AUTO_9542 ?AUTO_9546 ) ( not ( = ?AUTO_9545 ?AUTO_9542 ) ) ( not ( = ?AUTO_9540 ?AUTO_9542 ) ) ( TRUCK-AT ?AUTO_9541 ?AUTO_9540 ) ( AIRPORT ?AUTO_9543 ) ( AIRPORT ?AUTO_9545 ) ( AIRPLANE-AT ?AUTO_9544 ?AUTO_9543 ) ( not ( = ?AUTO_9543 ?AUTO_9545 ) ) ( not ( = ?AUTO_9540 ?AUTO_9543 ) ) ( not ( = ?AUTO_9542 ?AUTO_9543 ) ) ( IN-TRUCK ?AUTO_9539 ?AUTO_9547 ) ( not ( = ?AUTO_9541 ?AUTO_9547 ) ) ( TRUCK-AT ?AUTO_9547 ?AUTO_9548 ) ( IN-CITY ?AUTO_9548 ?AUTO_9549 ) ( IN-CITY ?AUTO_9543 ?AUTO_9549 ) ( not ( = ?AUTO_9543 ?AUTO_9548 ) ) ( not ( = ?AUTO_9540 ?AUTO_9548 ) ) ( not ( = ?AUTO_9545 ?AUTO_9548 ) ) ( not ( = ?AUTO_9546 ?AUTO_9549 ) ) ( not ( = ?AUTO_9542 ?AUTO_9548 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9547 ?AUTO_9548 ?AUTO_9543 ?AUTO_9549 )
      ( DELIVER-PKG ?AUTO_9539 ?AUTO_9540 )
      ( DELIVER-PKG-VERIFY ?AUTO_9539 ?AUTO_9540 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9550 - OBJ
      ?AUTO_9551 - LOCATION
    )
    :vars
    (
      ?AUTO_9557 - LOCATION
      ?AUTO_9554 - CITY
      ?AUTO_9552 - LOCATION
      ?AUTO_9555 - TRUCK
      ?AUTO_9560 - LOCATION
      ?AUTO_9556 - AIRPLANE
      ?AUTO_9553 - TRUCK
      ?AUTO_9558 - LOCATION
      ?AUTO_9559 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9557 ?AUTO_9554 ) ( IN-CITY ?AUTO_9551 ?AUTO_9554 ) ( not ( = ?AUTO_9551 ?AUTO_9557 ) ) ( IN-CITY ?AUTO_9552 ?AUTO_9554 ) ( not ( = ?AUTO_9557 ?AUTO_9552 ) ) ( not ( = ?AUTO_9551 ?AUTO_9552 ) ) ( TRUCK-AT ?AUTO_9555 ?AUTO_9551 ) ( AIRPORT ?AUTO_9560 ) ( AIRPORT ?AUTO_9557 ) ( AIRPLANE-AT ?AUTO_9556 ?AUTO_9560 ) ( not ( = ?AUTO_9560 ?AUTO_9557 ) ) ( not ( = ?AUTO_9551 ?AUTO_9560 ) ) ( not ( = ?AUTO_9552 ?AUTO_9560 ) ) ( not ( = ?AUTO_9555 ?AUTO_9553 ) ) ( TRUCK-AT ?AUTO_9553 ?AUTO_9558 ) ( IN-CITY ?AUTO_9558 ?AUTO_9559 ) ( IN-CITY ?AUTO_9560 ?AUTO_9559 ) ( not ( = ?AUTO_9560 ?AUTO_9558 ) ) ( not ( = ?AUTO_9551 ?AUTO_9558 ) ) ( not ( = ?AUTO_9557 ?AUTO_9558 ) ) ( not ( = ?AUTO_9554 ?AUTO_9559 ) ) ( not ( = ?AUTO_9552 ?AUTO_9558 ) ) ( OBJ-AT ?AUTO_9550 ?AUTO_9558 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_9550 ?AUTO_9553 ?AUTO_9558 )
      ( DELIVER-PKG ?AUTO_9550 ?AUTO_9551 )
      ( DELIVER-PKG-VERIFY ?AUTO_9550 ?AUTO_9551 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9561 - OBJ
      ?AUTO_9562 - LOCATION
    )
    :vars
    (
      ?AUTO_9567 - LOCATION
      ?AUTO_9565 - CITY
      ?AUTO_9568 - LOCATION
      ?AUTO_9563 - TRUCK
      ?AUTO_9570 - LOCATION
      ?AUTO_9566 - AIRPLANE
      ?AUTO_9569 - TRUCK
      ?AUTO_9564 - LOCATION
      ?AUTO_9571 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9567 ?AUTO_9565 ) ( IN-CITY ?AUTO_9562 ?AUTO_9565 ) ( not ( = ?AUTO_9562 ?AUTO_9567 ) ) ( IN-CITY ?AUTO_9568 ?AUTO_9565 ) ( not ( = ?AUTO_9567 ?AUTO_9568 ) ) ( not ( = ?AUTO_9562 ?AUTO_9568 ) ) ( TRUCK-AT ?AUTO_9563 ?AUTO_9562 ) ( AIRPORT ?AUTO_9570 ) ( AIRPORT ?AUTO_9567 ) ( AIRPLANE-AT ?AUTO_9566 ?AUTO_9570 ) ( not ( = ?AUTO_9570 ?AUTO_9567 ) ) ( not ( = ?AUTO_9562 ?AUTO_9570 ) ) ( not ( = ?AUTO_9568 ?AUTO_9570 ) ) ( not ( = ?AUTO_9563 ?AUTO_9569 ) ) ( IN-CITY ?AUTO_9564 ?AUTO_9571 ) ( IN-CITY ?AUTO_9570 ?AUTO_9571 ) ( not ( = ?AUTO_9570 ?AUTO_9564 ) ) ( not ( = ?AUTO_9562 ?AUTO_9564 ) ) ( not ( = ?AUTO_9567 ?AUTO_9564 ) ) ( not ( = ?AUTO_9565 ?AUTO_9571 ) ) ( not ( = ?AUTO_9568 ?AUTO_9564 ) ) ( OBJ-AT ?AUTO_9561 ?AUTO_9564 ) ( TRUCK-AT ?AUTO_9569 ?AUTO_9570 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9569 ?AUTO_9570 ?AUTO_9564 ?AUTO_9571 )
      ( DELIVER-PKG ?AUTO_9561 ?AUTO_9562 )
      ( DELIVER-PKG-VERIFY ?AUTO_9561 ?AUTO_9562 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9574 - OBJ
      ?AUTO_9575 - LOCATION
    )
    :vars
    (
      ?AUTO_9583 - LOCATION
      ?AUTO_9579 - CITY
      ?AUTO_9580 - LOCATION
      ?AUTO_9582 - TRUCK
      ?AUTO_9578 - LOCATION
      ?AUTO_9581 - TRUCK
      ?AUTO_9584 - LOCATION
      ?AUTO_9577 - CITY
      ?AUTO_9585 - LOCATION
      ?AUTO_9576 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9583 ?AUTO_9579 ) ( IN-CITY ?AUTO_9575 ?AUTO_9579 ) ( not ( = ?AUTO_9575 ?AUTO_9583 ) ) ( IN-CITY ?AUTO_9580 ?AUTO_9579 ) ( not ( = ?AUTO_9583 ?AUTO_9580 ) ) ( not ( = ?AUTO_9575 ?AUTO_9580 ) ) ( TRUCK-AT ?AUTO_9582 ?AUTO_9575 ) ( AIRPORT ?AUTO_9578 ) ( AIRPORT ?AUTO_9583 ) ( not ( = ?AUTO_9578 ?AUTO_9583 ) ) ( not ( = ?AUTO_9575 ?AUTO_9578 ) ) ( not ( = ?AUTO_9580 ?AUTO_9578 ) ) ( not ( = ?AUTO_9582 ?AUTO_9581 ) ) ( IN-CITY ?AUTO_9584 ?AUTO_9577 ) ( IN-CITY ?AUTO_9578 ?AUTO_9577 ) ( not ( = ?AUTO_9578 ?AUTO_9584 ) ) ( not ( = ?AUTO_9575 ?AUTO_9584 ) ) ( not ( = ?AUTO_9583 ?AUTO_9584 ) ) ( not ( = ?AUTO_9579 ?AUTO_9577 ) ) ( not ( = ?AUTO_9580 ?AUTO_9584 ) ) ( OBJ-AT ?AUTO_9574 ?AUTO_9584 ) ( TRUCK-AT ?AUTO_9581 ?AUTO_9578 ) ( AIRPORT ?AUTO_9585 ) ( AIRPLANE-AT ?AUTO_9576 ?AUTO_9585 ) ( not ( = ?AUTO_9585 ?AUTO_9578 ) ) ( not ( = ?AUTO_9575 ?AUTO_9585 ) ) ( not ( = ?AUTO_9583 ?AUTO_9585 ) ) ( not ( = ?AUTO_9580 ?AUTO_9585 ) ) ( not ( = ?AUTO_9584 ?AUTO_9585 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9576 ?AUTO_9585 ?AUTO_9578 )
      ( DELIVER-PKG ?AUTO_9574 ?AUTO_9575 )
      ( DELIVER-PKG-VERIFY ?AUTO_9574 ?AUTO_9575 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9600 - OBJ
      ?AUTO_9601 - LOCATION
    )
    :vars
    (
      ?AUTO_9602 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_9602 ?AUTO_9601 ) ( IN-TRUCK ?AUTO_9600 ?AUTO_9602 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_9600 ?AUTO_9602 ?AUTO_9601 )
      ( DELIVER-PKG-VERIFY ?AUTO_9600 ?AUTO_9601 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9603 - OBJ
      ?AUTO_9604 - LOCATION
    )
    :vars
    (
      ?AUTO_9605 - TRUCK
      ?AUTO_9606 - LOCATION
      ?AUTO_9607 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_9603 ?AUTO_9605 ) ( TRUCK-AT ?AUTO_9605 ?AUTO_9606 ) ( IN-CITY ?AUTO_9606 ?AUTO_9607 ) ( IN-CITY ?AUTO_9604 ?AUTO_9607 ) ( not ( = ?AUTO_9604 ?AUTO_9606 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9605 ?AUTO_9606 ?AUTO_9604 ?AUTO_9607 )
      ( DELIVER-PKG ?AUTO_9603 ?AUTO_9604 )
      ( DELIVER-PKG-VERIFY ?AUTO_9603 ?AUTO_9604 ) )
  )

)

