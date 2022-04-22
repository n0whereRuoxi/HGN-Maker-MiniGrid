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
      ?AUTO_9 - LOCATION
      ?AUTO_8 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5 ?AUTO_7 ) ( TRUCK-AT ?AUTO_7 ?AUTO_9 ) ( IN-CITY ?AUTO_9 ?AUTO_8 ) ( IN-CITY ?AUTO_6 ?AUTO_8 ) ( not ( = ?AUTO_6 ?AUTO_9 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7 ?AUTO_9 ?AUTO_6 ?AUTO_8 )
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
      ?AUTO_13 - TRUCK
      ?AUTO_14 - LOCATION
      ?AUTO_12 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_13 ?AUTO_14 ) ( IN-CITY ?AUTO_14 ?AUTO_12 ) ( IN-CITY ?AUTO_11 ?AUTO_12 ) ( not ( = ?AUTO_11 ?AUTO_14 ) ) ( OBJ-AT ?AUTO_10 ?AUTO_14 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_10 ?AUTO_13 ?AUTO_14 )
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
      ?AUTO_18 - LOCATION
      ?AUTO_19 - CITY
      ?AUTO_17 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_18 ?AUTO_19 ) ( IN-CITY ?AUTO_16 ?AUTO_19 ) ( not ( = ?AUTO_16 ?AUTO_18 ) ) ( OBJ-AT ?AUTO_15 ?AUTO_18 ) ( TRUCK-AT ?AUTO_17 ?AUTO_16 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_17 ?AUTO_16 ?AUTO_18 ?AUTO_19 )
      ( DELIVER-PKG ?AUTO_15 ?AUTO_16 )
      ( DELIVER-PKG-VERIFY ?AUTO_15 ?AUTO_16 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_26 - OBJ
      ?AUTO_27 - LOCATION
    )
    :vars
    (
      ?AUTO_28 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_26 ?AUTO_28 ) ( AIRPLANE-AT ?AUTO_28 ?AUTO_27 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_26 ?AUTO_28 ?AUTO_27 )
      ( DELIVER-PKG-VERIFY ?AUTO_26 ?AUTO_27 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_29 - OBJ
      ?AUTO_30 - LOCATION
    )
    :vars
    (
      ?AUTO_31 - AIRPLANE
      ?AUTO_32 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_29 ?AUTO_31 ) ( AIRPORT ?AUTO_32 ) ( AIRPORT ?AUTO_30 ) ( AIRPLANE-AT ?AUTO_31 ?AUTO_32 ) ( not ( = ?AUTO_32 ?AUTO_30 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_31 ?AUTO_32 ?AUTO_30 )
      ( DELIVER-PKG ?AUTO_29 ?AUTO_30 )
      ( DELIVER-PKG-VERIFY ?AUTO_29 ?AUTO_30 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_35 - OBJ
      ?AUTO_36 - LOCATION
    )
    :vars
    (
      ?AUTO_38 - LOCATION
      ?AUTO_37 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_38 ) ( AIRPORT ?AUTO_36 ) ( AIRPLANE-AT ?AUTO_37 ?AUTO_38 ) ( not ( = ?AUTO_38 ?AUTO_36 ) ) ( OBJ-AT ?AUTO_35 ?AUTO_38 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_35 ?AUTO_37 ?AUTO_38 )
      ( DELIVER-PKG ?AUTO_35 ?AUTO_36 )
      ( DELIVER-PKG-VERIFY ?AUTO_35 ?AUTO_36 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_39 - OBJ
      ?AUTO_40 - LOCATION
    )
    :vars
    (
      ?AUTO_42 - LOCATION
      ?AUTO_41 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_42 ) ( AIRPORT ?AUTO_40 ) ( not ( = ?AUTO_42 ?AUTO_40 ) ) ( OBJ-AT ?AUTO_39 ?AUTO_42 ) ( AIRPLANE-AT ?AUTO_41 ?AUTO_40 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_41 ?AUTO_40 ?AUTO_42 )
      ( DELIVER-PKG ?AUTO_39 ?AUTO_40 )
      ( DELIVER-PKG-VERIFY ?AUTO_39 ?AUTO_40 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_53 - OBJ
      ?AUTO_54 - LOCATION
    )
    :vars
    (
      ?AUTO_55 - LOCATION
      ?AUTO_57 - LOCATION
      ?AUTO_56 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_55 ) ( AIRPORT ?AUTO_54 ) ( not ( = ?AUTO_55 ?AUTO_54 ) ) ( OBJ-AT ?AUTO_53 ?AUTO_55 ) ( AIRPORT ?AUTO_57 ) ( AIRPLANE-AT ?AUTO_56 ?AUTO_57 ) ( not ( = ?AUTO_57 ?AUTO_54 ) ) ( not ( = ?AUTO_55 ?AUTO_57 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_56 ?AUTO_57 ?AUTO_54 )
      ( DELIVER-PKG ?AUTO_53 ?AUTO_54 )
      ( DELIVER-PKG-VERIFY ?AUTO_53 ?AUTO_54 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_77 - OBJ
      ?AUTO_78 - LOCATION
    )
    :vars
    (
      ?AUTO_80 - LOCATION
      ?AUTO_81 - LOCATION
      ?AUTO_79 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_80 ) ( AIRPORT ?AUTO_78 ) ( not ( = ?AUTO_80 ?AUTO_78 ) ) ( OBJ-AT ?AUTO_77 ?AUTO_80 ) ( AIRPORT ?AUTO_81 ) ( AIRPLANE-AT ?AUTO_79 ?AUTO_81 ) ( not ( = ?AUTO_81 ?AUTO_80 ) ) ( not ( = ?AUTO_78 ?AUTO_81 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_79 ?AUTO_81 ?AUTO_80 )
      ( DELIVER-PKG ?AUTO_77 ?AUTO_78 )
      ( DELIVER-PKG-VERIFY ?AUTO_77 ?AUTO_78 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_82 - OBJ
      ?AUTO_83 - LOCATION
    )
    :vars
    (
      ?AUTO_84 - LOCATION
      ?AUTO_86 - LOCATION
      ?AUTO_85 - AIRPLANE
      ?AUTO_87 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_84 ) ( AIRPORT ?AUTO_83 ) ( not ( = ?AUTO_84 ?AUTO_83 ) ) ( AIRPORT ?AUTO_86 ) ( AIRPLANE-AT ?AUTO_85 ?AUTO_86 ) ( not ( = ?AUTO_86 ?AUTO_84 ) ) ( not ( = ?AUTO_83 ?AUTO_86 ) ) ( TRUCK-AT ?AUTO_87 ?AUTO_84 ) ( IN-TRUCK ?AUTO_82 ?AUTO_87 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_82 ?AUTO_87 ?AUTO_84 )
      ( DELIVER-PKG ?AUTO_82 ?AUTO_83 )
      ( DELIVER-PKG-VERIFY ?AUTO_82 ?AUTO_83 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_88 - OBJ
      ?AUTO_89 - LOCATION
    )
    :vars
    (
      ?AUTO_91 - LOCATION
      ?AUTO_92 - LOCATION
      ?AUTO_90 - AIRPLANE
      ?AUTO_93 - TRUCK
      ?AUTO_95 - LOCATION
      ?AUTO_94 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_91 ) ( AIRPORT ?AUTO_89 ) ( not ( = ?AUTO_91 ?AUTO_89 ) ) ( AIRPORT ?AUTO_92 ) ( AIRPLANE-AT ?AUTO_90 ?AUTO_92 ) ( not ( = ?AUTO_92 ?AUTO_91 ) ) ( not ( = ?AUTO_89 ?AUTO_92 ) ) ( IN-TRUCK ?AUTO_88 ?AUTO_93 ) ( TRUCK-AT ?AUTO_93 ?AUTO_95 ) ( IN-CITY ?AUTO_95 ?AUTO_94 ) ( IN-CITY ?AUTO_91 ?AUTO_94 ) ( not ( = ?AUTO_91 ?AUTO_95 ) ) ( not ( = ?AUTO_89 ?AUTO_95 ) ) ( not ( = ?AUTO_92 ?AUTO_95 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_93 ?AUTO_95 ?AUTO_91 ?AUTO_94 )
      ( DELIVER-PKG ?AUTO_88 ?AUTO_89 )
      ( DELIVER-PKG-VERIFY ?AUTO_88 ?AUTO_89 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_96 - OBJ
      ?AUTO_97 - LOCATION
    )
    :vars
    (
      ?AUTO_99 - LOCATION
      ?AUTO_102 - LOCATION
      ?AUTO_101 - AIRPLANE
      ?AUTO_98 - TRUCK
      ?AUTO_103 - LOCATION
      ?AUTO_100 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_99 ) ( AIRPORT ?AUTO_97 ) ( not ( = ?AUTO_99 ?AUTO_97 ) ) ( AIRPORT ?AUTO_102 ) ( AIRPLANE-AT ?AUTO_101 ?AUTO_102 ) ( not ( = ?AUTO_102 ?AUTO_99 ) ) ( not ( = ?AUTO_97 ?AUTO_102 ) ) ( TRUCK-AT ?AUTO_98 ?AUTO_103 ) ( IN-CITY ?AUTO_103 ?AUTO_100 ) ( IN-CITY ?AUTO_99 ?AUTO_100 ) ( not ( = ?AUTO_99 ?AUTO_103 ) ) ( not ( = ?AUTO_97 ?AUTO_103 ) ) ( not ( = ?AUTO_102 ?AUTO_103 ) ) ( OBJ-AT ?AUTO_96 ?AUTO_103 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_96 ?AUTO_98 ?AUTO_103 )
      ( DELIVER-PKG ?AUTO_96 ?AUTO_97 )
      ( DELIVER-PKG-VERIFY ?AUTO_96 ?AUTO_97 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_104 - OBJ
      ?AUTO_105 - LOCATION
    )
    :vars
    (
      ?AUTO_107 - LOCATION
      ?AUTO_111 - LOCATION
      ?AUTO_110 - AIRPLANE
      ?AUTO_106 - LOCATION
      ?AUTO_109 - CITY
      ?AUTO_108 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_107 ) ( AIRPORT ?AUTO_105 ) ( not ( = ?AUTO_107 ?AUTO_105 ) ) ( AIRPORT ?AUTO_111 ) ( AIRPLANE-AT ?AUTO_110 ?AUTO_111 ) ( not ( = ?AUTO_111 ?AUTO_107 ) ) ( not ( = ?AUTO_105 ?AUTO_111 ) ) ( IN-CITY ?AUTO_106 ?AUTO_109 ) ( IN-CITY ?AUTO_107 ?AUTO_109 ) ( not ( = ?AUTO_107 ?AUTO_106 ) ) ( not ( = ?AUTO_105 ?AUTO_106 ) ) ( not ( = ?AUTO_111 ?AUTO_106 ) ) ( OBJ-AT ?AUTO_104 ?AUTO_106 ) ( TRUCK-AT ?AUTO_108 ?AUTO_107 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_108 ?AUTO_107 ?AUTO_106 ?AUTO_109 )
      ( DELIVER-PKG ?AUTO_104 ?AUTO_105 )
      ( DELIVER-PKG-VERIFY ?AUTO_104 ?AUTO_105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_135 - OBJ
      ?AUTO_136 - LOCATION
    )
    :vars
    (
      ?AUTO_138 - TRUCK
      ?AUTO_139 - LOCATION
      ?AUTO_137 - CITY
      ?AUTO_140 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_138 ?AUTO_139 ) ( IN-CITY ?AUTO_139 ?AUTO_137 ) ( IN-CITY ?AUTO_136 ?AUTO_137 ) ( not ( = ?AUTO_136 ?AUTO_139 ) ) ( IN-AIRPLANE ?AUTO_135 ?AUTO_140 ) ( AIRPLANE-AT ?AUTO_140 ?AUTO_139 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_135 ?AUTO_140 ?AUTO_139 )
      ( DELIVER-PKG ?AUTO_135 ?AUTO_136 )
      ( DELIVER-PKG-VERIFY ?AUTO_135 ?AUTO_136 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_141 - OBJ
      ?AUTO_142 - LOCATION
    )
    :vars
    (
      ?AUTO_143 - TRUCK
      ?AUTO_145 - LOCATION
      ?AUTO_144 - CITY
      ?AUTO_146 - AIRPLANE
      ?AUTO_147 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_143 ?AUTO_145 ) ( IN-CITY ?AUTO_145 ?AUTO_144 ) ( IN-CITY ?AUTO_142 ?AUTO_144 ) ( not ( = ?AUTO_142 ?AUTO_145 ) ) ( IN-AIRPLANE ?AUTO_141 ?AUTO_146 ) ( AIRPORT ?AUTO_147 ) ( AIRPORT ?AUTO_145 ) ( AIRPLANE-AT ?AUTO_146 ?AUTO_147 ) ( not ( = ?AUTO_147 ?AUTO_145 ) ) ( not ( = ?AUTO_142 ?AUTO_147 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_146 ?AUTO_147 ?AUTO_145 )
      ( DELIVER-PKG ?AUTO_141 ?AUTO_142 )
      ( DELIVER-PKG-VERIFY ?AUTO_141 ?AUTO_142 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_150 - OBJ
      ?AUTO_151 - LOCATION
    )
    :vars
    (
      ?AUTO_156 - TRUCK
      ?AUTO_153 - LOCATION
      ?AUTO_154 - CITY
      ?AUTO_155 - LOCATION
      ?AUTO_152 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_156 ?AUTO_153 ) ( IN-CITY ?AUTO_153 ?AUTO_154 ) ( IN-CITY ?AUTO_151 ?AUTO_154 ) ( not ( = ?AUTO_151 ?AUTO_153 ) ) ( AIRPORT ?AUTO_155 ) ( AIRPORT ?AUTO_153 ) ( AIRPLANE-AT ?AUTO_152 ?AUTO_155 ) ( not ( = ?AUTO_155 ?AUTO_153 ) ) ( not ( = ?AUTO_151 ?AUTO_155 ) ) ( OBJ-AT ?AUTO_150 ?AUTO_155 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_150 ?AUTO_152 ?AUTO_155 )
      ( DELIVER-PKG ?AUTO_150 ?AUTO_151 )
      ( DELIVER-PKG-VERIFY ?AUTO_150 ?AUTO_151 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_157 - OBJ
      ?AUTO_158 - LOCATION
    )
    :vars
    (
      ?AUTO_163 - TRUCK
      ?AUTO_160 - LOCATION
      ?AUTO_162 - CITY
      ?AUTO_159 - LOCATION
      ?AUTO_161 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_163 ?AUTO_160 ) ( IN-CITY ?AUTO_160 ?AUTO_162 ) ( IN-CITY ?AUTO_158 ?AUTO_162 ) ( not ( = ?AUTO_158 ?AUTO_160 ) ) ( AIRPORT ?AUTO_159 ) ( AIRPORT ?AUTO_160 ) ( not ( = ?AUTO_159 ?AUTO_160 ) ) ( not ( = ?AUTO_158 ?AUTO_159 ) ) ( OBJ-AT ?AUTO_157 ?AUTO_159 ) ( AIRPLANE-AT ?AUTO_161 ?AUTO_160 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_161 ?AUTO_160 ?AUTO_159 )
      ( DELIVER-PKG ?AUTO_157 ?AUTO_158 )
      ( DELIVER-PKG-VERIFY ?AUTO_157 ?AUTO_158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_172 - OBJ
      ?AUTO_173 - LOCATION
    )
    :vars
    (
      ?AUTO_175 - LOCATION
      ?AUTO_174 - CITY
      ?AUTO_178 - LOCATION
      ?AUTO_176 - AIRPLANE
      ?AUTO_177 - TRUCK
      ?AUTO_179 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_175 ?AUTO_174 ) ( IN-CITY ?AUTO_173 ?AUTO_174 ) ( not ( = ?AUTO_173 ?AUTO_175 ) ) ( AIRPORT ?AUTO_178 ) ( AIRPORT ?AUTO_175 ) ( not ( = ?AUTO_178 ?AUTO_175 ) ) ( not ( = ?AUTO_173 ?AUTO_178 ) ) ( OBJ-AT ?AUTO_172 ?AUTO_178 ) ( AIRPLANE-AT ?AUTO_176 ?AUTO_175 ) ( TRUCK-AT ?AUTO_177 ?AUTO_179 ) ( IN-CITY ?AUTO_179 ?AUTO_174 ) ( not ( = ?AUTO_175 ?AUTO_179 ) ) ( not ( = ?AUTO_173 ?AUTO_179 ) ) ( not ( = ?AUTO_178 ?AUTO_179 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_177 ?AUTO_179 ?AUTO_175 ?AUTO_174 )
      ( DELIVER-PKG ?AUTO_172 ?AUTO_173 )
      ( DELIVER-PKG-VERIFY ?AUTO_172 ?AUTO_173 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_180 - OBJ
      ?AUTO_181 - LOCATION
    )
    :vars
    (
      ?AUTO_182 - LOCATION
      ?AUTO_183 - CITY
      ?AUTO_185 - LOCATION
      ?AUTO_184 - TRUCK
      ?AUTO_187 - LOCATION
      ?AUTO_188 - LOCATION
      ?AUTO_186 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_182 ?AUTO_183 ) ( IN-CITY ?AUTO_181 ?AUTO_183 ) ( not ( = ?AUTO_181 ?AUTO_182 ) ) ( AIRPORT ?AUTO_185 ) ( AIRPORT ?AUTO_182 ) ( not ( = ?AUTO_185 ?AUTO_182 ) ) ( not ( = ?AUTO_181 ?AUTO_185 ) ) ( OBJ-AT ?AUTO_180 ?AUTO_185 ) ( TRUCK-AT ?AUTO_184 ?AUTO_187 ) ( IN-CITY ?AUTO_187 ?AUTO_183 ) ( not ( = ?AUTO_182 ?AUTO_187 ) ) ( not ( = ?AUTO_181 ?AUTO_187 ) ) ( not ( = ?AUTO_185 ?AUTO_187 ) ) ( AIRPORT ?AUTO_188 ) ( AIRPLANE-AT ?AUTO_186 ?AUTO_188 ) ( not ( = ?AUTO_188 ?AUTO_182 ) ) ( not ( = ?AUTO_181 ?AUTO_188 ) ) ( not ( = ?AUTO_185 ?AUTO_188 ) ) ( not ( = ?AUTO_187 ?AUTO_188 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_186 ?AUTO_188 ?AUTO_182 )
      ( DELIVER-PKG ?AUTO_180 ?AUTO_181 )
      ( DELIVER-PKG-VERIFY ?AUTO_180 ?AUTO_181 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_215 - OBJ
      ?AUTO_216 - LOCATION
    )
    :vars
    (
      ?AUTO_219 - LOCATION
      ?AUTO_218 - CITY
      ?AUTO_217 - TRUCK
      ?AUTO_220 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_219 ?AUTO_218 ) ( IN-CITY ?AUTO_216 ?AUTO_218 ) ( not ( = ?AUTO_216 ?AUTO_219 ) ) ( TRUCK-AT ?AUTO_217 ?AUTO_216 ) ( IN-AIRPLANE ?AUTO_215 ?AUTO_220 ) ( AIRPLANE-AT ?AUTO_220 ?AUTO_219 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_215 ?AUTO_220 ?AUTO_219 )
      ( DELIVER-PKG ?AUTO_215 ?AUTO_216 )
      ( DELIVER-PKG-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_221 - OBJ
      ?AUTO_222 - LOCATION
    )
    :vars
    (
      ?AUTO_224 - LOCATION
      ?AUTO_223 - CITY
      ?AUTO_225 - TRUCK
      ?AUTO_226 - AIRPLANE
      ?AUTO_227 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_224 ?AUTO_223 ) ( IN-CITY ?AUTO_222 ?AUTO_223 ) ( not ( = ?AUTO_222 ?AUTO_224 ) ) ( TRUCK-AT ?AUTO_225 ?AUTO_222 ) ( IN-AIRPLANE ?AUTO_221 ?AUTO_226 ) ( AIRPORT ?AUTO_227 ) ( AIRPORT ?AUTO_224 ) ( AIRPLANE-AT ?AUTO_226 ?AUTO_227 ) ( not ( = ?AUTO_227 ?AUTO_224 ) ) ( not ( = ?AUTO_222 ?AUTO_227 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_226 ?AUTO_227 ?AUTO_224 )
      ( DELIVER-PKG ?AUTO_221 ?AUTO_222 )
      ( DELIVER-PKG-VERIFY ?AUTO_221 ?AUTO_222 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_232 - OBJ
      ?AUTO_233 - LOCATION
    )
    :vars
    (
      ?AUTO_238 - LOCATION
      ?AUTO_237 - CITY
      ?AUTO_235 - TRUCK
      ?AUTO_236 - LOCATION
      ?AUTO_234 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_238 ?AUTO_237 ) ( IN-CITY ?AUTO_233 ?AUTO_237 ) ( not ( = ?AUTO_233 ?AUTO_238 ) ) ( TRUCK-AT ?AUTO_235 ?AUTO_233 ) ( AIRPORT ?AUTO_236 ) ( AIRPORT ?AUTO_238 ) ( AIRPLANE-AT ?AUTO_234 ?AUTO_236 ) ( not ( = ?AUTO_236 ?AUTO_238 ) ) ( not ( = ?AUTO_233 ?AUTO_236 ) ) ( OBJ-AT ?AUTO_232 ?AUTO_236 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_232 ?AUTO_234 ?AUTO_236 )
      ( DELIVER-PKG ?AUTO_232 ?AUTO_233 )
      ( DELIVER-PKG-VERIFY ?AUTO_232 ?AUTO_233 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_241 - OBJ
      ?AUTO_242 - LOCATION
    )
    :vars
    (
      ?AUTO_244 - LOCATION
      ?AUTO_243 - CITY
      ?AUTO_246 - TRUCK
      ?AUTO_245 - LOCATION
      ?AUTO_248 - LOCATION
      ?AUTO_247 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_244 ?AUTO_243 ) ( IN-CITY ?AUTO_242 ?AUTO_243 ) ( not ( = ?AUTO_242 ?AUTO_244 ) ) ( TRUCK-AT ?AUTO_246 ?AUTO_242 ) ( AIRPORT ?AUTO_245 ) ( AIRPORT ?AUTO_244 ) ( not ( = ?AUTO_245 ?AUTO_244 ) ) ( not ( = ?AUTO_242 ?AUTO_245 ) ) ( OBJ-AT ?AUTO_241 ?AUTO_245 ) ( AIRPORT ?AUTO_248 ) ( AIRPLANE-AT ?AUTO_247 ?AUTO_248 ) ( not ( = ?AUTO_248 ?AUTO_245 ) ) ( not ( = ?AUTO_242 ?AUTO_248 ) ) ( not ( = ?AUTO_244 ?AUTO_248 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_247 ?AUTO_248 ?AUTO_245 )
      ( DELIVER-PKG ?AUTO_241 ?AUTO_242 )
      ( DELIVER-PKG-VERIFY ?AUTO_241 ?AUTO_242 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_249 - OBJ
      ?AUTO_250 - LOCATION
    )
    :vars
    (
      ?AUTO_252 - LOCATION
      ?AUTO_251 - CITY
      ?AUTO_254 - TRUCK
      ?AUTO_255 - LOCATION
      ?AUTO_253 - LOCATION
      ?AUTO_256 - AIRPLANE
      ?AUTO_257 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_252 ?AUTO_251 ) ( IN-CITY ?AUTO_250 ?AUTO_251 ) ( not ( = ?AUTO_250 ?AUTO_252 ) ) ( TRUCK-AT ?AUTO_254 ?AUTO_250 ) ( AIRPORT ?AUTO_255 ) ( AIRPORT ?AUTO_252 ) ( not ( = ?AUTO_255 ?AUTO_252 ) ) ( not ( = ?AUTO_250 ?AUTO_255 ) ) ( AIRPORT ?AUTO_253 ) ( AIRPLANE-AT ?AUTO_256 ?AUTO_253 ) ( not ( = ?AUTO_253 ?AUTO_255 ) ) ( not ( = ?AUTO_250 ?AUTO_253 ) ) ( not ( = ?AUTO_252 ?AUTO_253 ) ) ( TRUCK-AT ?AUTO_257 ?AUTO_255 ) ( IN-TRUCK ?AUTO_249 ?AUTO_257 ) ( not ( = ?AUTO_254 ?AUTO_257 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_249 ?AUTO_257 ?AUTO_255 )
      ( DELIVER-PKG ?AUTO_249 ?AUTO_250 )
      ( DELIVER-PKG-VERIFY ?AUTO_249 ?AUTO_250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_258 - OBJ
      ?AUTO_259 - LOCATION
    )
    :vars
    (
      ?AUTO_260 - LOCATION
      ?AUTO_261 - CITY
      ?AUTO_266 - TRUCK
      ?AUTO_263 - LOCATION
      ?AUTO_265 - LOCATION
      ?AUTO_262 - AIRPLANE
      ?AUTO_264 - TRUCK
      ?AUTO_268 - LOCATION
      ?AUTO_267 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_260 ?AUTO_261 ) ( IN-CITY ?AUTO_259 ?AUTO_261 ) ( not ( = ?AUTO_259 ?AUTO_260 ) ) ( TRUCK-AT ?AUTO_266 ?AUTO_259 ) ( AIRPORT ?AUTO_263 ) ( AIRPORT ?AUTO_260 ) ( not ( = ?AUTO_263 ?AUTO_260 ) ) ( not ( = ?AUTO_259 ?AUTO_263 ) ) ( AIRPORT ?AUTO_265 ) ( AIRPLANE-AT ?AUTO_262 ?AUTO_265 ) ( not ( = ?AUTO_265 ?AUTO_263 ) ) ( not ( = ?AUTO_259 ?AUTO_265 ) ) ( not ( = ?AUTO_260 ?AUTO_265 ) ) ( IN-TRUCK ?AUTO_258 ?AUTO_264 ) ( not ( = ?AUTO_266 ?AUTO_264 ) ) ( TRUCK-AT ?AUTO_264 ?AUTO_268 ) ( IN-CITY ?AUTO_268 ?AUTO_267 ) ( IN-CITY ?AUTO_263 ?AUTO_267 ) ( not ( = ?AUTO_263 ?AUTO_268 ) ) ( not ( = ?AUTO_259 ?AUTO_268 ) ) ( not ( = ?AUTO_260 ?AUTO_268 ) ) ( not ( = ?AUTO_261 ?AUTO_267 ) ) ( not ( = ?AUTO_265 ?AUTO_268 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_264 ?AUTO_268 ?AUTO_263 ?AUTO_267 )
      ( DELIVER-PKG ?AUTO_258 ?AUTO_259 )
      ( DELIVER-PKG-VERIFY ?AUTO_258 ?AUTO_259 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_269 - OBJ
      ?AUTO_270 - LOCATION
    )
    :vars
    (
      ?AUTO_275 - LOCATION
      ?AUTO_276 - CITY
      ?AUTO_272 - TRUCK
      ?AUTO_271 - LOCATION
      ?AUTO_279 - LOCATION
      ?AUTO_274 - AIRPLANE
      ?AUTO_273 - TRUCK
      ?AUTO_278 - LOCATION
      ?AUTO_277 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_275 ?AUTO_276 ) ( IN-CITY ?AUTO_270 ?AUTO_276 ) ( not ( = ?AUTO_270 ?AUTO_275 ) ) ( TRUCK-AT ?AUTO_272 ?AUTO_270 ) ( AIRPORT ?AUTO_271 ) ( AIRPORT ?AUTO_275 ) ( not ( = ?AUTO_271 ?AUTO_275 ) ) ( not ( = ?AUTO_270 ?AUTO_271 ) ) ( AIRPORT ?AUTO_279 ) ( AIRPLANE-AT ?AUTO_274 ?AUTO_279 ) ( not ( = ?AUTO_279 ?AUTO_271 ) ) ( not ( = ?AUTO_270 ?AUTO_279 ) ) ( not ( = ?AUTO_275 ?AUTO_279 ) ) ( not ( = ?AUTO_272 ?AUTO_273 ) ) ( TRUCK-AT ?AUTO_273 ?AUTO_278 ) ( IN-CITY ?AUTO_278 ?AUTO_277 ) ( IN-CITY ?AUTO_271 ?AUTO_277 ) ( not ( = ?AUTO_271 ?AUTO_278 ) ) ( not ( = ?AUTO_270 ?AUTO_278 ) ) ( not ( = ?AUTO_275 ?AUTO_278 ) ) ( not ( = ?AUTO_276 ?AUTO_277 ) ) ( not ( = ?AUTO_279 ?AUTO_278 ) ) ( OBJ-AT ?AUTO_269 ?AUTO_278 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_269 ?AUTO_273 ?AUTO_278 )
      ( DELIVER-PKG ?AUTO_269 ?AUTO_270 )
      ( DELIVER-PKG-VERIFY ?AUTO_269 ?AUTO_270 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_280 - OBJ
      ?AUTO_281 - LOCATION
    )
    :vars
    (
      ?AUTO_283 - LOCATION
      ?AUTO_290 - CITY
      ?AUTO_282 - TRUCK
      ?AUTO_285 - LOCATION
      ?AUTO_287 - LOCATION
      ?AUTO_286 - AIRPLANE
      ?AUTO_284 - TRUCK
      ?AUTO_288 - LOCATION
      ?AUTO_289 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_283 ?AUTO_290 ) ( IN-CITY ?AUTO_281 ?AUTO_290 ) ( not ( = ?AUTO_281 ?AUTO_283 ) ) ( TRUCK-AT ?AUTO_282 ?AUTO_281 ) ( AIRPORT ?AUTO_285 ) ( AIRPORT ?AUTO_283 ) ( not ( = ?AUTO_285 ?AUTO_283 ) ) ( not ( = ?AUTO_281 ?AUTO_285 ) ) ( AIRPORT ?AUTO_287 ) ( AIRPLANE-AT ?AUTO_286 ?AUTO_287 ) ( not ( = ?AUTO_287 ?AUTO_285 ) ) ( not ( = ?AUTO_281 ?AUTO_287 ) ) ( not ( = ?AUTO_283 ?AUTO_287 ) ) ( not ( = ?AUTO_282 ?AUTO_284 ) ) ( IN-CITY ?AUTO_288 ?AUTO_289 ) ( IN-CITY ?AUTO_285 ?AUTO_289 ) ( not ( = ?AUTO_285 ?AUTO_288 ) ) ( not ( = ?AUTO_281 ?AUTO_288 ) ) ( not ( = ?AUTO_283 ?AUTO_288 ) ) ( not ( = ?AUTO_290 ?AUTO_289 ) ) ( not ( = ?AUTO_287 ?AUTO_288 ) ) ( OBJ-AT ?AUTO_280 ?AUTO_288 ) ( TRUCK-AT ?AUTO_284 ?AUTO_285 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_284 ?AUTO_285 ?AUTO_288 ?AUTO_289 )
      ( DELIVER-PKG ?AUTO_280 ?AUTO_281 )
      ( DELIVER-PKG-VERIFY ?AUTO_280 ?AUTO_281 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_306 - OBJ
      ?AUTO_307 - LOCATION
    )
    :vars
    (
      ?AUTO_310 - LOCATION
      ?AUTO_308 - CITY
      ?AUTO_309 - TRUCK
      ?AUTO_311 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_310 ?AUTO_308 ) ( IN-CITY ?AUTO_307 ?AUTO_308 ) ( not ( = ?AUTO_307 ?AUTO_310 ) ) ( OBJ-AT ?AUTO_306 ?AUTO_310 ) ( TRUCK-AT ?AUTO_309 ?AUTO_311 ) ( IN-CITY ?AUTO_311 ?AUTO_308 ) ( not ( = ?AUTO_310 ?AUTO_311 ) ) ( not ( = ?AUTO_307 ?AUTO_311 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_309 ?AUTO_311 ?AUTO_310 ?AUTO_308 )
      ( DELIVER-PKG ?AUTO_306 ?AUTO_307 )
      ( DELIVER-PKG-VERIFY ?AUTO_306 ?AUTO_307 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_409 - OBJ
      ?AUTO_410 - LOCATION
    )
    :vars
    (
      ?AUTO_415 - LOCATION
      ?AUTO_412 - LOCATION
      ?AUTO_416 - AIRPLANE
      ?AUTO_413 - LOCATION
      ?AUTO_414 - CITY
      ?AUTO_411 - TRUCK
      ?AUTO_417 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_415 ) ( AIRPORT ?AUTO_410 ) ( not ( = ?AUTO_415 ?AUTO_410 ) ) ( AIRPORT ?AUTO_412 ) ( AIRPLANE-AT ?AUTO_416 ?AUTO_412 ) ( not ( = ?AUTO_412 ?AUTO_415 ) ) ( not ( = ?AUTO_410 ?AUTO_412 ) ) ( IN-CITY ?AUTO_413 ?AUTO_414 ) ( IN-CITY ?AUTO_415 ?AUTO_414 ) ( not ( = ?AUTO_415 ?AUTO_413 ) ) ( not ( = ?AUTO_410 ?AUTO_413 ) ) ( not ( = ?AUTO_412 ?AUTO_413 ) ) ( OBJ-AT ?AUTO_409 ?AUTO_413 ) ( TRUCK-AT ?AUTO_411 ?AUTO_417 ) ( IN-CITY ?AUTO_417 ?AUTO_414 ) ( not ( = ?AUTO_413 ?AUTO_417 ) ) ( not ( = ?AUTO_410 ?AUTO_417 ) ) ( not ( = ?AUTO_415 ?AUTO_417 ) ) ( not ( = ?AUTO_412 ?AUTO_417 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_411 ?AUTO_417 ?AUTO_413 ?AUTO_414 )
      ( DELIVER-PKG ?AUTO_409 ?AUTO_410 )
      ( DELIVER-PKG-VERIFY ?AUTO_409 ?AUTO_410 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_655 - OBJ
      ?AUTO_656 - LOCATION
    )
    :vars
    (
      ?AUTO_661 - TRUCK
      ?AUTO_659 - LOCATION
      ?AUTO_658 - CITY
      ?AUTO_657 - LOCATION
      ?AUTO_662 - LOCATION
      ?AUTO_660 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_661 ?AUTO_659 ) ( IN-CITY ?AUTO_659 ?AUTO_658 ) ( IN-CITY ?AUTO_656 ?AUTO_658 ) ( not ( = ?AUTO_656 ?AUTO_659 ) ) ( AIRPORT ?AUTO_657 ) ( AIRPORT ?AUTO_659 ) ( not ( = ?AUTO_657 ?AUTO_659 ) ) ( not ( = ?AUTO_656 ?AUTO_657 ) ) ( OBJ-AT ?AUTO_655 ?AUTO_657 ) ( AIRPORT ?AUTO_662 ) ( AIRPLANE-AT ?AUTO_660 ?AUTO_662 ) ( not ( = ?AUTO_662 ?AUTO_657 ) ) ( not ( = ?AUTO_656 ?AUTO_662 ) ) ( not ( = ?AUTO_659 ?AUTO_662 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_660 ?AUTO_662 ?AUTO_657 )
      ( DELIVER-PKG ?AUTO_655 ?AUTO_656 )
      ( DELIVER-PKG-VERIFY ?AUTO_655 ?AUTO_656 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_851 - OBJ
      ?AUTO_852 - LOCATION
    )
    :vars
    (
      ?AUTO_854 - LOCATION
      ?AUTO_856 - CITY
      ?AUTO_853 - TRUCK
      ?AUTO_855 - LOCATION
      ?AUTO_857 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_854 ?AUTO_856 ) ( IN-CITY ?AUTO_852 ?AUTO_856 ) ( not ( = ?AUTO_852 ?AUTO_854 ) ) ( TRUCK-AT ?AUTO_853 ?AUTO_855 ) ( IN-CITY ?AUTO_855 ?AUTO_856 ) ( not ( = ?AUTO_854 ?AUTO_855 ) ) ( not ( = ?AUTO_852 ?AUTO_855 ) ) ( IN-AIRPLANE ?AUTO_851 ?AUTO_857 ) ( AIRPLANE-AT ?AUTO_857 ?AUTO_854 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_851 ?AUTO_857 ?AUTO_854 )
      ( DELIVER-PKG ?AUTO_851 ?AUTO_852 )
      ( DELIVER-PKG-VERIFY ?AUTO_851 ?AUTO_852 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_858 - OBJ
      ?AUTO_859 - LOCATION
    )
    :vars
    (
      ?AUTO_860 - LOCATION
      ?AUTO_862 - CITY
      ?AUTO_861 - TRUCK
      ?AUTO_863 - LOCATION
      ?AUTO_864 - AIRPLANE
      ?AUTO_865 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_860 ?AUTO_862 ) ( IN-CITY ?AUTO_859 ?AUTO_862 ) ( not ( = ?AUTO_859 ?AUTO_860 ) ) ( TRUCK-AT ?AUTO_861 ?AUTO_863 ) ( IN-CITY ?AUTO_863 ?AUTO_862 ) ( not ( = ?AUTO_860 ?AUTO_863 ) ) ( not ( = ?AUTO_859 ?AUTO_863 ) ) ( IN-AIRPLANE ?AUTO_858 ?AUTO_864 ) ( AIRPORT ?AUTO_865 ) ( AIRPORT ?AUTO_860 ) ( AIRPLANE-AT ?AUTO_864 ?AUTO_865 ) ( not ( = ?AUTO_865 ?AUTO_860 ) ) ( not ( = ?AUTO_859 ?AUTO_865 ) ) ( not ( = ?AUTO_863 ?AUTO_865 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_864 ?AUTO_865 ?AUTO_860 )
      ( DELIVER-PKG ?AUTO_858 ?AUTO_859 )
      ( DELIVER-PKG-VERIFY ?AUTO_858 ?AUTO_859 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_890 - OBJ
      ?AUTO_891 - LOCATION
    )
    :vars
    (
      ?AUTO_893 - LOCATION
      ?AUTO_894 - CITY
      ?AUTO_892 - TRUCK
      ?AUTO_895 - LOCATION
      ?AUTO_896 - LOCATION
      ?AUTO_897 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_893 ?AUTO_894 ) ( IN-CITY ?AUTO_891 ?AUTO_894 ) ( not ( = ?AUTO_891 ?AUTO_893 ) ) ( TRUCK-AT ?AUTO_892 ?AUTO_895 ) ( IN-CITY ?AUTO_895 ?AUTO_894 ) ( not ( = ?AUTO_893 ?AUTO_895 ) ) ( not ( = ?AUTO_891 ?AUTO_895 ) ) ( AIRPORT ?AUTO_896 ) ( AIRPORT ?AUTO_893 ) ( AIRPLANE-AT ?AUTO_897 ?AUTO_896 ) ( not ( = ?AUTO_896 ?AUTO_893 ) ) ( not ( = ?AUTO_891 ?AUTO_896 ) ) ( not ( = ?AUTO_895 ?AUTO_896 ) ) ( OBJ-AT ?AUTO_890 ?AUTO_896 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_890 ?AUTO_897 ?AUTO_896 )
      ( DELIVER-PKG ?AUTO_890 ?AUTO_891 )
      ( DELIVER-PKG-VERIFY ?AUTO_890 ?AUTO_891 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_898 - OBJ
      ?AUTO_899 - LOCATION
    )
    :vars
    (
      ?AUTO_904 - LOCATION
      ?AUTO_900 - CITY
      ?AUTO_901 - TRUCK
      ?AUTO_902 - LOCATION
      ?AUTO_905 - LOCATION
      ?AUTO_903 - AIRPLANE
      ?AUTO_906 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_904 ?AUTO_900 ) ( IN-CITY ?AUTO_899 ?AUTO_900 ) ( not ( = ?AUTO_899 ?AUTO_904 ) ) ( TRUCK-AT ?AUTO_901 ?AUTO_902 ) ( IN-CITY ?AUTO_902 ?AUTO_900 ) ( not ( = ?AUTO_904 ?AUTO_902 ) ) ( not ( = ?AUTO_899 ?AUTO_902 ) ) ( AIRPORT ?AUTO_905 ) ( AIRPORT ?AUTO_904 ) ( AIRPLANE-AT ?AUTO_903 ?AUTO_905 ) ( not ( = ?AUTO_905 ?AUTO_904 ) ) ( not ( = ?AUTO_899 ?AUTO_905 ) ) ( not ( = ?AUTO_902 ?AUTO_905 ) ) ( TRUCK-AT ?AUTO_906 ?AUTO_905 ) ( IN-TRUCK ?AUTO_898 ?AUTO_906 ) ( not ( = ?AUTO_901 ?AUTO_906 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_898 ?AUTO_906 ?AUTO_905 )
      ( DELIVER-PKG ?AUTO_898 ?AUTO_899 )
      ( DELIVER-PKG-VERIFY ?AUTO_898 ?AUTO_899 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_907 - OBJ
      ?AUTO_908 - LOCATION
    )
    :vars
    (
      ?AUTO_914 - LOCATION
      ?AUTO_910 - CITY
      ?AUTO_909 - TRUCK
      ?AUTO_912 - LOCATION
      ?AUTO_913 - LOCATION
      ?AUTO_911 - AIRPLANE
      ?AUTO_915 - TRUCK
      ?AUTO_917 - LOCATION
      ?AUTO_916 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_914 ?AUTO_910 ) ( IN-CITY ?AUTO_908 ?AUTO_910 ) ( not ( = ?AUTO_908 ?AUTO_914 ) ) ( TRUCK-AT ?AUTO_909 ?AUTO_912 ) ( IN-CITY ?AUTO_912 ?AUTO_910 ) ( not ( = ?AUTO_914 ?AUTO_912 ) ) ( not ( = ?AUTO_908 ?AUTO_912 ) ) ( AIRPORT ?AUTO_913 ) ( AIRPORT ?AUTO_914 ) ( AIRPLANE-AT ?AUTO_911 ?AUTO_913 ) ( not ( = ?AUTO_913 ?AUTO_914 ) ) ( not ( = ?AUTO_908 ?AUTO_913 ) ) ( not ( = ?AUTO_912 ?AUTO_913 ) ) ( IN-TRUCK ?AUTO_907 ?AUTO_915 ) ( not ( = ?AUTO_909 ?AUTO_915 ) ) ( TRUCK-AT ?AUTO_915 ?AUTO_917 ) ( IN-CITY ?AUTO_917 ?AUTO_916 ) ( IN-CITY ?AUTO_913 ?AUTO_916 ) ( not ( = ?AUTO_913 ?AUTO_917 ) ) ( not ( = ?AUTO_908 ?AUTO_917 ) ) ( not ( = ?AUTO_914 ?AUTO_917 ) ) ( not ( = ?AUTO_910 ?AUTO_916 ) ) ( not ( = ?AUTO_912 ?AUTO_917 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_915 ?AUTO_917 ?AUTO_913 ?AUTO_916 )
      ( DELIVER-PKG ?AUTO_907 ?AUTO_908 )
      ( DELIVER-PKG-VERIFY ?AUTO_907 ?AUTO_908 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_918 - OBJ
      ?AUTO_919 - LOCATION
    )
    :vars
    (
      ?AUTO_924 - LOCATION
      ?AUTO_925 - CITY
      ?AUTO_923 - TRUCK
      ?AUTO_922 - LOCATION
      ?AUTO_921 - LOCATION
      ?AUTO_928 - AIRPLANE
      ?AUTO_927 - TRUCK
      ?AUTO_926 - LOCATION
      ?AUTO_920 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_924 ?AUTO_925 ) ( IN-CITY ?AUTO_919 ?AUTO_925 ) ( not ( = ?AUTO_919 ?AUTO_924 ) ) ( TRUCK-AT ?AUTO_923 ?AUTO_922 ) ( IN-CITY ?AUTO_922 ?AUTO_925 ) ( not ( = ?AUTO_924 ?AUTO_922 ) ) ( not ( = ?AUTO_919 ?AUTO_922 ) ) ( AIRPORT ?AUTO_921 ) ( AIRPORT ?AUTO_924 ) ( AIRPLANE-AT ?AUTO_928 ?AUTO_921 ) ( not ( = ?AUTO_921 ?AUTO_924 ) ) ( not ( = ?AUTO_919 ?AUTO_921 ) ) ( not ( = ?AUTO_922 ?AUTO_921 ) ) ( not ( = ?AUTO_923 ?AUTO_927 ) ) ( TRUCK-AT ?AUTO_927 ?AUTO_926 ) ( IN-CITY ?AUTO_926 ?AUTO_920 ) ( IN-CITY ?AUTO_921 ?AUTO_920 ) ( not ( = ?AUTO_921 ?AUTO_926 ) ) ( not ( = ?AUTO_919 ?AUTO_926 ) ) ( not ( = ?AUTO_924 ?AUTO_926 ) ) ( not ( = ?AUTO_925 ?AUTO_920 ) ) ( not ( = ?AUTO_922 ?AUTO_926 ) ) ( OBJ-AT ?AUTO_918 ?AUTO_926 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_918 ?AUTO_927 ?AUTO_926 )
      ( DELIVER-PKG ?AUTO_918 ?AUTO_919 )
      ( DELIVER-PKG-VERIFY ?AUTO_918 ?AUTO_919 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_929 - OBJ
      ?AUTO_930 - LOCATION
    )
    :vars
    (
      ?AUTO_934 - LOCATION
      ?AUTO_931 - CITY
      ?AUTO_935 - TRUCK
      ?AUTO_932 - LOCATION
      ?AUTO_933 - LOCATION
      ?AUTO_939 - AIRPLANE
      ?AUTO_938 - TRUCK
      ?AUTO_936 - LOCATION
      ?AUTO_937 - CITY
      ?AUTO_940 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_934 ?AUTO_931 ) ( IN-CITY ?AUTO_930 ?AUTO_931 ) ( not ( = ?AUTO_930 ?AUTO_934 ) ) ( TRUCK-AT ?AUTO_935 ?AUTO_932 ) ( IN-CITY ?AUTO_932 ?AUTO_931 ) ( not ( = ?AUTO_934 ?AUTO_932 ) ) ( not ( = ?AUTO_930 ?AUTO_932 ) ) ( AIRPORT ?AUTO_933 ) ( AIRPORT ?AUTO_934 ) ( AIRPLANE-AT ?AUTO_939 ?AUTO_933 ) ( not ( = ?AUTO_933 ?AUTO_934 ) ) ( not ( = ?AUTO_930 ?AUTO_933 ) ) ( not ( = ?AUTO_932 ?AUTO_933 ) ) ( not ( = ?AUTO_935 ?AUTO_938 ) ) ( IN-CITY ?AUTO_936 ?AUTO_937 ) ( IN-CITY ?AUTO_933 ?AUTO_937 ) ( not ( = ?AUTO_933 ?AUTO_936 ) ) ( not ( = ?AUTO_930 ?AUTO_936 ) ) ( not ( = ?AUTO_934 ?AUTO_936 ) ) ( not ( = ?AUTO_931 ?AUTO_937 ) ) ( not ( = ?AUTO_932 ?AUTO_936 ) ) ( OBJ-AT ?AUTO_929 ?AUTO_936 ) ( TRUCK-AT ?AUTO_938 ?AUTO_940 ) ( IN-CITY ?AUTO_940 ?AUTO_937 ) ( not ( = ?AUTO_936 ?AUTO_940 ) ) ( not ( = ?AUTO_930 ?AUTO_940 ) ) ( not ( = ?AUTO_934 ?AUTO_940 ) ) ( not ( = ?AUTO_932 ?AUTO_940 ) ) ( not ( = ?AUTO_933 ?AUTO_940 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_938 ?AUTO_940 ?AUTO_936 ?AUTO_937 )
      ( DELIVER-PKG ?AUTO_929 ?AUTO_930 )
      ( DELIVER-PKG-VERIFY ?AUTO_929 ?AUTO_930 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1023 - OBJ
      ?AUTO_1024 - LOCATION
    )
    :vars
    (
      ?AUTO_1030 - LOCATION
      ?AUTO_1028 - CITY
      ?AUTO_1026 - TRUCK
      ?AUTO_1029 - LOCATION
      ?AUTO_1027 - LOCATION
      ?AUTO_1031 - LOCATION
      ?AUTO_1025 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1030 ?AUTO_1028 ) ( IN-CITY ?AUTO_1024 ?AUTO_1028 ) ( not ( = ?AUTO_1024 ?AUTO_1030 ) ) ( TRUCK-AT ?AUTO_1026 ?AUTO_1029 ) ( IN-CITY ?AUTO_1029 ?AUTO_1028 ) ( not ( = ?AUTO_1030 ?AUTO_1029 ) ) ( not ( = ?AUTO_1024 ?AUTO_1029 ) ) ( AIRPORT ?AUTO_1027 ) ( AIRPORT ?AUTO_1030 ) ( not ( = ?AUTO_1027 ?AUTO_1030 ) ) ( not ( = ?AUTO_1024 ?AUTO_1027 ) ) ( not ( = ?AUTO_1029 ?AUTO_1027 ) ) ( OBJ-AT ?AUTO_1023 ?AUTO_1027 ) ( AIRPORT ?AUTO_1031 ) ( AIRPLANE-AT ?AUTO_1025 ?AUTO_1031 ) ( not ( = ?AUTO_1031 ?AUTO_1027 ) ) ( not ( = ?AUTO_1024 ?AUTO_1031 ) ) ( not ( = ?AUTO_1030 ?AUTO_1031 ) ) ( not ( = ?AUTO_1029 ?AUTO_1031 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1025 ?AUTO_1031 ?AUTO_1027 )
      ( DELIVER-PKG ?AUTO_1023 ?AUTO_1024 )
      ( DELIVER-PKG-VERIFY ?AUTO_1023 ?AUTO_1024 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1454 - OBJ
      ?AUTO_1455 - LOCATION
    )
    :vars
    (
      ?AUTO_1459 - LOCATION
      ?AUTO_1456 - LOCATION
      ?AUTO_1458 - AIRPLANE
      ?AUTO_1461 - LOCATION
      ?AUTO_1457 - CITY
      ?AUTO_1460 - LOCATION
      ?AUTO_1462 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1459 ) ( AIRPORT ?AUTO_1455 ) ( not ( = ?AUTO_1459 ?AUTO_1455 ) ) ( AIRPORT ?AUTO_1456 ) ( AIRPLANE-AT ?AUTO_1458 ?AUTO_1456 ) ( not ( = ?AUTO_1456 ?AUTO_1455 ) ) ( not ( = ?AUTO_1459 ?AUTO_1456 ) ) ( IN-CITY ?AUTO_1461 ?AUTO_1457 ) ( IN-CITY ?AUTO_1459 ?AUTO_1457 ) ( not ( = ?AUTO_1459 ?AUTO_1461 ) ) ( not ( = ?AUTO_1455 ?AUTO_1461 ) ) ( not ( = ?AUTO_1456 ?AUTO_1461 ) ) ( OBJ-AT ?AUTO_1454 ?AUTO_1461 ) ( IN-CITY ?AUTO_1460 ?AUTO_1457 ) ( not ( = ?AUTO_1461 ?AUTO_1460 ) ) ( not ( = ?AUTO_1455 ?AUTO_1460 ) ) ( not ( = ?AUTO_1459 ?AUTO_1460 ) ) ( not ( = ?AUTO_1456 ?AUTO_1460 ) ) ( TRUCK-AT ?AUTO_1462 ?AUTO_1459 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1462 ?AUTO_1459 ?AUTO_1460 ?AUTO_1457 )
      ( DELIVER-PKG ?AUTO_1454 ?AUTO_1455 )
      ( DELIVER-PKG-VERIFY ?AUTO_1454 ?AUTO_1455 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1687 - OBJ
      ?AUTO_1688 - LOCATION
    )
    :vars
    (
      ?AUTO_1693 - TRUCK
      ?AUTO_1692 - LOCATION
      ?AUTO_1691 - CITY
      ?AUTO_1689 - LOCATION
      ?AUTO_1694 - LOCATION
      ?AUTO_1690 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1693 ?AUTO_1692 ) ( IN-CITY ?AUTO_1692 ?AUTO_1691 ) ( IN-CITY ?AUTO_1688 ?AUTO_1691 ) ( not ( = ?AUTO_1688 ?AUTO_1692 ) ) ( AIRPORT ?AUTO_1689 ) ( AIRPORT ?AUTO_1692 ) ( not ( = ?AUTO_1689 ?AUTO_1692 ) ) ( not ( = ?AUTO_1688 ?AUTO_1689 ) ) ( OBJ-AT ?AUTO_1687 ?AUTO_1689 ) ( AIRPORT ?AUTO_1694 ) ( AIRPLANE-AT ?AUTO_1690 ?AUTO_1694 ) ( not ( = ?AUTO_1694 ?AUTO_1692 ) ) ( not ( = ?AUTO_1688 ?AUTO_1694 ) ) ( not ( = ?AUTO_1689 ?AUTO_1694 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1690 ?AUTO_1694 ?AUTO_1692 )
      ( DELIVER-PKG ?AUTO_1687 ?AUTO_1688 )
      ( DELIVER-PKG-VERIFY ?AUTO_1687 ?AUTO_1688 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1707 - OBJ
      ?AUTO_1708 - LOCATION
    )
    :vars
    (
      ?AUTO_1714 - TRUCK
      ?AUTO_1712 - LOCATION
      ?AUTO_1710 - CITY
      ?AUTO_1713 - LOCATION
      ?AUTO_1711 - LOCATION
      ?AUTO_1709 - AIRPLANE
      ?AUTO_1715 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1714 ?AUTO_1712 ) ( IN-CITY ?AUTO_1712 ?AUTO_1710 ) ( IN-CITY ?AUTO_1708 ?AUTO_1710 ) ( not ( = ?AUTO_1708 ?AUTO_1712 ) ) ( AIRPORT ?AUTO_1713 ) ( AIRPORT ?AUTO_1712 ) ( not ( = ?AUTO_1713 ?AUTO_1712 ) ) ( not ( = ?AUTO_1708 ?AUTO_1713 ) ) ( AIRPORT ?AUTO_1711 ) ( AIRPLANE-AT ?AUTO_1709 ?AUTO_1711 ) ( not ( = ?AUTO_1711 ?AUTO_1712 ) ) ( not ( = ?AUTO_1708 ?AUTO_1711 ) ) ( not ( = ?AUTO_1713 ?AUTO_1711 ) ) ( TRUCK-AT ?AUTO_1715 ?AUTO_1713 ) ( IN-TRUCK ?AUTO_1707 ?AUTO_1715 ) ( not ( = ?AUTO_1714 ?AUTO_1715 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1707 ?AUTO_1715 ?AUTO_1713 )
      ( DELIVER-PKG ?AUTO_1707 ?AUTO_1708 )
      ( DELIVER-PKG-VERIFY ?AUTO_1707 ?AUTO_1708 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1718 - OBJ
      ?AUTO_1719 - LOCATION
    )
    :vars
    (
      ?AUTO_1724 - TRUCK
      ?AUTO_1723 - LOCATION
      ?AUTO_1725 - CITY
      ?AUTO_1721 - LOCATION
      ?AUTO_1722 - LOCATION
      ?AUTO_1726 - AIRPLANE
      ?AUTO_1720 - TRUCK
      ?AUTO_1728 - LOCATION
      ?AUTO_1727 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1724 ?AUTO_1723 ) ( IN-CITY ?AUTO_1723 ?AUTO_1725 ) ( IN-CITY ?AUTO_1719 ?AUTO_1725 ) ( not ( = ?AUTO_1719 ?AUTO_1723 ) ) ( AIRPORT ?AUTO_1721 ) ( AIRPORT ?AUTO_1723 ) ( not ( = ?AUTO_1721 ?AUTO_1723 ) ) ( not ( = ?AUTO_1719 ?AUTO_1721 ) ) ( AIRPORT ?AUTO_1722 ) ( AIRPLANE-AT ?AUTO_1726 ?AUTO_1722 ) ( not ( = ?AUTO_1722 ?AUTO_1723 ) ) ( not ( = ?AUTO_1719 ?AUTO_1722 ) ) ( not ( = ?AUTO_1721 ?AUTO_1722 ) ) ( IN-TRUCK ?AUTO_1718 ?AUTO_1720 ) ( not ( = ?AUTO_1724 ?AUTO_1720 ) ) ( TRUCK-AT ?AUTO_1720 ?AUTO_1728 ) ( IN-CITY ?AUTO_1728 ?AUTO_1727 ) ( IN-CITY ?AUTO_1721 ?AUTO_1727 ) ( not ( = ?AUTO_1721 ?AUTO_1728 ) ) ( not ( = ?AUTO_1719 ?AUTO_1728 ) ) ( not ( = ?AUTO_1723 ?AUTO_1728 ) ) ( not ( = ?AUTO_1725 ?AUTO_1727 ) ) ( not ( = ?AUTO_1722 ?AUTO_1728 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1720 ?AUTO_1728 ?AUTO_1721 ?AUTO_1727 )
      ( DELIVER-PKG ?AUTO_1718 ?AUTO_1719 )
      ( DELIVER-PKG-VERIFY ?AUTO_1718 ?AUTO_1719 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1733 - OBJ
      ?AUTO_1734 - LOCATION
    )
    :vars
    (
      ?AUTO_1737 - TRUCK
      ?AUTO_1741 - LOCATION
      ?AUTO_1740 - CITY
      ?AUTO_1742 - LOCATION
      ?AUTO_1739 - LOCATION
      ?AUTO_1738 - AIRPLANE
      ?AUTO_1743 - TRUCK
      ?AUTO_1735 - LOCATION
      ?AUTO_1736 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1737 ?AUTO_1741 ) ( IN-CITY ?AUTO_1741 ?AUTO_1740 ) ( IN-CITY ?AUTO_1734 ?AUTO_1740 ) ( not ( = ?AUTO_1734 ?AUTO_1741 ) ) ( AIRPORT ?AUTO_1742 ) ( AIRPORT ?AUTO_1741 ) ( not ( = ?AUTO_1742 ?AUTO_1741 ) ) ( not ( = ?AUTO_1734 ?AUTO_1742 ) ) ( AIRPORT ?AUTO_1739 ) ( AIRPLANE-AT ?AUTO_1738 ?AUTO_1739 ) ( not ( = ?AUTO_1739 ?AUTO_1741 ) ) ( not ( = ?AUTO_1734 ?AUTO_1739 ) ) ( not ( = ?AUTO_1742 ?AUTO_1739 ) ) ( not ( = ?AUTO_1737 ?AUTO_1743 ) ) ( TRUCK-AT ?AUTO_1743 ?AUTO_1735 ) ( IN-CITY ?AUTO_1735 ?AUTO_1736 ) ( IN-CITY ?AUTO_1742 ?AUTO_1736 ) ( not ( = ?AUTO_1742 ?AUTO_1735 ) ) ( not ( = ?AUTO_1734 ?AUTO_1735 ) ) ( not ( = ?AUTO_1741 ?AUTO_1735 ) ) ( not ( = ?AUTO_1740 ?AUTO_1736 ) ) ( not ( = ?AUTO_1739 ?AUTO_1735 ) ) ( OBJ-AT ?AUTO_1733 ?AUTO_1735 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1733 ?AUTO_1743 ?AUTO_1735 )
      ( DELIVER-PKG ?AUTO_1733 ?AUTO_1734 )
      ( DELIVER-PKG-VERIFY ?AUTO_1733 ?AUTO_1734 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1744 - OBJ
      ?AUTO_1745 - LOCATION
    )
    :vars
    (
      ?AUTO_1750 - TRUCK
      ?AUTO_1754 - LOCATION
      ?AUTO_1752 - CITY
      ?AUTO_1748 - LOCATION
      ?AUTO_1751 - LOCATION
      ?AUTO_1753 - AIRPLANE
      ?AUTO_1747 - TRUCK
      ?AUTO_1749 - LOCATION
      ?AUTO_1746 - CITY
      ?AUTO_1755 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1750 ?AUTO_1754 ) ( IN-CITY ?AUTO_1754 ?AUTO_1752 ) ( IN-CITY ?AUTO_1745 ?AUTO_1752 ) ( not ( = ?AUTO_1745 ?AUTO_1754 ) ) ( AIRPORT ?AUTO_1748 ) ( AIRPORT ?AUTO_1754 ) ( not ( = ?AUTO_1748 ?AUTO_1754 ) ) ( not ( = ?AUTO_1745 ?AUTO_1748 ) ) ( AIRPORT ?AUTO_1751 ) ( AIRPLANE-AT ?AUTO_1753 ?AUTO_1751 ) ( not ( = ?AUTO_1751 ?AUTO_1754 ) ) ( not ( = ?AUTO_1745 ?AUTO_1751 ) ) ( not ( = ?AUTO_1748 ?AUTO_1751 ) ) ( not ( = ?AUTO_1750 ?AUTO_1747 ) ) ( IN-CITY ?AUTO_1749 ?AUTO_1746 ) ( IN-CITY ?AUTO_1748 ?AUTO_1746 ) ( not ( = ?AUTO_1748 ?AUTO_1749 ) ) ( not ( = ?AUTO_1745 ?AUTO_1749 ) ) ( not ( = ?AUTO_1754 ?AUTO_1749 ) ) ( not ( = ?AUTO_1752 ?AUTO_1746 ) ) ( not ( = ?AUTO_1751 ?AUTO_1749 ) ) ( OBJ-AT ?AUTO_1744 ?AUTO_1749 ) ( TRUCK-AT ?AUTO_1747 ?AUTO_1755 ) ( IN-CITY ?AUTO_1755 ?AUTO_1746 ) ( not ( = ?AUTO_1749 ?AUTO_1755 ) ) ( not ( = ?AUTO_1745 ?AUTO_1755 ) ) ( not ( = ?AUTO_1754 ?AUTO_1755 ) ) ( not ( = ?AUTO_1748 ?AUTO_1755 ) ) ( not ( = ?AUTO_1751 ?AUTO_1755 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1747 ?AUTO_1755 ?AUTO_1749 ?AUTO_1746 )
      ( DELIVER-PKG ?AUTO_1744 ?AUTO_1745 )
      ( DELIVER-PKG-VERIFY ?AUTO_1744 ?AUTO_1745 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1758 - OBJ
      ?AUTO_1759 - LOCATION
    )
    :vars
    (
      ?AUTO_1764 - TRUCK
      ?AUTO_1761 - LOCATION
      ?AUTO_1760 - CITY
      ?AUTO_1762 - LOCATION
      ?AUTO_1763 - LOCATION
      ?AUTO_1766 - AIRPLANE
      ?AUTO_1768 - TRUCK
      ?AUTO_1769 - LOCATION
      ?AUTO_1767 - CITY
      ?AUTO_1765 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1764 ?AUTO_1761 ) ( IN-CITY ?AUTO_1761 ?AUTO_1760 ) ( IN-CITY ?AUTO_1759 ?AUTO_1760 ) ( not ( = ?AUTO_1759 ?AUTO_1761 ) ) ( AIRPORT ?AUTO_1762 ) ( AIRPORT ?AUTO_1761 ) ( not ( = ?AUTO_1762 ?AUTO_1761 ) ) ( not ( = ?AUTO_1759 ?AUTO_1762 ) ) ( AIRPORT ?AUTO_1763 ) ( AIRPLANE-AT ?AUTO_1766 ?AUTO_1763 ) ( not ( = ?AUTO_1763 ?AUTO_1761 ) ) ( not ( = ?AUTO_1759 ?AUTO_1763 ) ) ( not ( = ?AUTO_1762 ?AUTO_1763 ) ) ( not ( = ?AUTO_1764 ?AUTO_1768 ) ) ( IN-CITY ?AUTO_1769 ?AUTO_1767 ) ( IN-CITY ?AUTO_1762 ?AUTO_1767 ) ( not ( = ?AUTO_1762 ?AUTO_1769 ) ) ( not ( = ?AUTO_1759 ?AUTO_1769 ) ) ( not ( = ?AUTO_1761 ?AUTO_1769 ) ) ( not ( = ?AUTO_1760 ?AUTO_1767 ) ) ( not ( = ?AUTO_1763 ?AUTO_1769 ) ) ( OBJ-AT ?AUTO_1758 ?AUTO_1769 ) ( IN-CITY ?AUTO_1765 ?AUTO_1767 ) ( not ( = ?AUTO_1769 ?AUTO_1765 ) ) ( not ( = ?AUTO_1759 ?AUTO_1765 ) ) ( not ( = ?AUTO_1761 ?AUTO_1765 ) ) ( not ( = ?AUTO_1762 ?AUTO_1765 ) ) ( not ( = ?AUTO_1763 ?AUTO_1765 ) ) ( TRUCK-AT ?AUTO_1768 ?AUTO_1762 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1768 ?AUTO_1762 ?AUTO_1765 ?AUTO_1767 )
      ( DELIVER-PKG ?AUTO_1758 ?AUTO_1759 )
      ( DELIVER-PKG-VERIFY ?AUTO_1758 ?AUTO_1759 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1770 - OBJ
      ?AUTO_1771 - LOCATION
    )
    :vars
    (
      ?AUTO_1777 - LOCATION
      ?AUTO_1774 - CITY
      ?AUTO_1779 - LOCATION
      ?AUTO_1781 - LOCATION
      ?AUTO_1780 - AIRPLANE
      ?AUTO_1778 - TRUCK
      ?AUTO_1776 - TRUCK
      ?AUTO_1773 - LOCATION
      ?AUTO_1775 - CITY
      ?AUTO_1772 - LOCATION
      ?AUTO_1782 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1777 ?AUTO_1774 ) ( IN-CITY ?AUTO_1771 ?AUTO_1774 ) ( not ( = ?AUTO_1771 ?AUTO_1777 ) ) ( AIRPORT ?AUTO_1779 ) ( AIRPORT ?AUTO_1777 ) ( not ( = ?AUTO_1779 ?AUTO_1777 ) ) ( not ( = ?AUTO_1771 ?AUTO_1779 ) ) ( AIRPORT ?AUTO_1781 ) ( AIRPLANE-AT ?AUTO_1780 ?AUTO_1781 ) ( not ( = ?AUTO_1781 ?AUTO_1777 ) ) ( not ( = ?AUTO_1771 ?AUTO_1781 ) ) ( not ( = ?AUTO_1779 ?AUTO_1781 ) ) ( not ( = ?AUTO_1778 ?AUTO_1776 ) ) ( IN-CITY ?AUTO_1773 ?AUTO_1775 ) ( IN-CITY ?AUTO_1779 ?AUTO_1775 ) ( not ( = ?AUTO_1779 ?AUTO_1773 ) ) ( not ( = ?AUTO_1771 ?AUTO_1773 ) ) ( not ( = ?AUTO_1777 ?AUTO_1773 ) ) ( not ( = ?AUTO_1774 ?AUTO_1775 ) ) ( not ( = ?AUTO_1781 ?AUTO_1773 ) ) ( OBJ-AT ?AUTO_1770 ?AUTO_1773 ) ( IN-CITY ?AUTO_1772 ?AUTO_1775 ) ( not ( = ?AUTO_1773 ?AUTO_1772 ) ) ( not ( = ?AUTO_1771 ?AUTO_1772 ) ) ( not ( = ?AUTO_1777 ?AUTO_1772 ) ) ( not ( = ?AUTO_1779 ?AUTO_1772 ) ) ( not ( = ?AUTO_1781 ?AUTO_1772 ) ) ( TRUCK-AT ?AUTO_1776 ?AUTO_1779 ) ( TRUCK-AT ?AUTO_1778 ?AUTO_1782 ) ( IN-CITY ?AUTO_1782 ?AUTO_1774 ) ( not ( = ?AUTO_1777 ?AUTO_1782 ) ) ( not ( = ?AUTO_1771 ?AUTO_1782 ) ) ( not ( = ?AUTO_1779 ?AUTO_1782 ) ) ( not ( = ?AUTO_1781 ?AUTO_1782 ) ) ( not ( = ?AUTO_1773 ?AUTO_1782 ) ) ( not ( = ?AUTO_1772 ?AUTO_1782 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1778 ?AUTO_1782 ?AUTO_1777 ?AUTO_1774 )
      ( DELIVER-PKG ?AUTO_1770 ?AUTO_1771 )
      ( DELIVER-PKG-VERIFY ?AUTO_1770 ?AUTO_1771 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1997 - OBJ
      ?AUTO_1998 - LOCATION
    )
    :vars
    (
      ?AUTO_1999 - LOCATION
      ?AUTO_2000 - AIRPLANE
      ?AUTO_2001 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1999 ) ( AIRPORT ?AUTO_1998 ) ( AIRPLANE-AT ?AUTO_2000 ?AUTO_1999 ) ( not ( = ?AUTO_1999 ?AUTO_1998 ) ) ( TRUCK-AT ?AUTO_2001 ?AUTO_1999 ) ( IN-TRUCK ?AUTO_1997 ?AUTO_2001 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1997 ?AUTO_2001 ?AUTO_1999 )
      ( DELIVER-PKG ?AUTO_1997 ?AUTO_1998 )
      ( DELIVER-PKG-VERIFY ?AUTO_1997 ?AUTO_1998 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2002 - OBJ
      ?AUTO_2003 - LOCATION
    )
    :vars
    (
      ?AUTO_2005 - LOCATION
      ?AUTO_2006 - AIRPLANE
      ?AUTO_2004 - TRUCK
      ?AUTO_2008 - LOCATION
      ?AUTO_2007 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2005 ) ( AIRPORT ?AUTO_2003 ) ( AIRPLANE-AT ?AUTO_2006 ?AUTO_2005 ) ( not ( = ?AUTO_2005 ?AUTO_2003 ) ) ( IN-TRUCK ?AUTO_2002 ?AUTO_2004 ) ( TRUCK-AT ?AUTO_2004 ?AUTO_2008 ) ( IN-CITY ?AUTO_2008 ?AUTO_2007 ) ( IN-CITY ?AUTO_2005 ?AUTO_2007 ) ( not ( = ?AUTO_2005 ?AUTO_2008 ) ) ( not ( = ?AUTO_2003 ?AUTO_2008 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2004 ?AUTO_2008 ?AUTO_2005 ?AUTO_2007 )
      ( DELIVER-PKG ?AUTO_2002 ?AUTO_2003 )
      ( DELIVER-PKG-VERIFY ?AUTO_2002 ?AUTO_2003 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2025 - OBJ
      ?AUTO_2026 - LOCATION
    )
    :vars
    (
      ?AUTO_2028 - LOCATION
      ?AUTO_2027 - TRUCK
      ?AUTO_2031 - LOCATION
      ?AUTO_2029 - CITY
      ?AUTO_2030 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2028 ) ( AIRPORT ?AUTO_2026 ) ( not ( = ?AUTO_2028 ?AUTO_2026 ) ) ( IN-TRUCK ?AUTO_2025 ?AUTO_2027 ) ( TRUCK-AT ?AUTO_2027 ?AUTO_2031 ) ( IN-CITY ?AUTO_2031 ?AUTO_2029 ) ( IN-CITY ?AUTO_2028 ?AUTO_2029 ) ( not ( = ?AUTO_2028 ?AUTO_2031 ) ) ( not ( = ?AUTO_2026 ?AUTO_2031 ) ) ( AIRPLANE-AT ?AUTO_2030 ?AUTO_2026 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2030 ?AUTO_2026 ?AUTO_2028 )
      ( DELIVER-PKG ?AUTO_2025 ?AUTO_2026 )
      ( DELIVER-PKG-VERIFY ?AUTO_2025 ?AUTO_2026 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2048 - OBJ
      ?AUTO_2049 - LOCATION
    )
    :vars
    (
      ?AUTO_2051 - LOCATION
      ?AUTO_2054 - TRUCK
      ?AUTO_2050 - LOCATION
      ?AUTO_2053 - CITY
      ?AUTO_2055 - LOCATION
      ?AUTO_2052 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2051 ) ( AIRPORT ?AUTO_2049 ) ( not ( = ?AUTO_2051 ?AUTO_2049 ) ) ( IN-TRUCK ?AUTO_2048 ?AUTO_2054 ) ( TRUCK-AT ?AUTO_2054 ?AUTO_2050 ) ( IN-CITY ?AUTO_2050 ?AUTO_2053 ) ( IN-CITY ?AUTO_2051 ?AUTO_2053 ) ( not ( = ?AUTO_2051 ?AUTO_2050 ) ) ( not ( = ?AUTO_2049 ?AUTO_2050 ) ) ( AIRPORT ?AUTO_2055 ) ( AIRPLANE-AT ?AUTO_2052 ?AUTO_2055 ) ( not ( = ?AUTO_2055 ?AUTO_2051 ) ) ( not ( = ?AUTO_2049 ?AUTO_2055 ) ) ( not ( = ?AUTO_2050 ?AUTO_2055 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2052 ?AUTO_2055 ?AUTO_2051 )
      ( DELIVER-PKG ?AUTO_2048 ?AUTO_2049 )
      ( DELIVER-PKG-VERIFY ?AUTO_2048 ?AUTO_2049 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2391 - OBJ
      ?AUTO_2392 - LOCATION
    )
    :vars
    (
      ?AUTO_2393 - LOCATION
      ?AUTO_2397 - CITY
      ?AUTO_2395 - LOCATION
      ?AUTO_2394 - LOCATION
      ?AUTO_2396 - AIRPLANE
      ?AUTO_2398 - TRUCK
      ?AUTO_2399 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2393 ?AUTO_2397 ) ( IN-CITY ?AUTO_2392 ?AUTO_2397 ) ( not ( = ?AUTO_2392 ?AUTO_2393 ) ) ( AIRPORT ?AUTO_2395 ) ( AIRPORT ?AUTO_2393 ) ( not ( = ?AUTO_2395 ?AUTO_2393 ) ) ( not ( = ?AUTO_2392 ?AUTO_2395 ) ) ( OBJ-AT ?AUTO_2391 ?AUTO_2395 ) ( AIRPORT ?AUTO_2394 ) ( AIRPLANE-AT ?AUTO_2396 ?AUTO_2394 ) ( not ( = ?AUTO_2394 ?AUTO_2393 ) ) ( not ( = ?AUTO_2392 ?AUTO_2394 ) ) ( not ( = ?AUTO_2395 ?AUTO_2394 ) ) ( TRUCK-AT ?AUTO_2398 ?AUTO_2399 ) ( IN-CITY ?AUTO_2399 ?AUTO_2397 ) ( not ( = ?AUTO_2393 ?AUTO_2399 ) ) ( not ( = ?AUTO_2392 ?AUTO_2399 ) ) ( not ( = ?AUTO_2395 ?AUTO_2399 ) ) ( not ( = ?AUTO_2394 ?AUTO_2399 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2398 ?AUTO_2399 ?AUTO_2393 ?AUTO_2397 )
      ( DELIVER-PKG ?AUTO_2391 ?AUTO_2392 )
      ( DELIVER-PKG-VERIFY ?AUTO_2391 ?AUTO_2392 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2464 - OBJ
      ?AUTO_2465 - LOCATION
    )
    :vars
    (
      ?AUTO_2469 - TRUCK
      ?AUTO_2466 - LOCATION
      ?AUTO_2467 - CITY
      ?AUTO_2468 - LOCATION
      ?AUTO_2470 - AIRPLANE
      ?AUTO_2471 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2469 ?AUTO_2466 ) ( IN-CITY ?AUTO_2466 ?AUTO_2467 ) ( IN-CITY ?AUTO_2465 ?AUTO_2467 ) ( not ( = ?AUTO_2465 ?AUTO_2466 ) ) ( AIRPORT ?AUTO_2468 ) ( AIRPORT ?AUTO_2466 ) ( AIRPLANE-AT ?AUTO_2470 ?AUTO_2468 ) ( not ( = ?AUTO_2468 ?AUTO_2466 ) ) ( not ( = ?AUTO_2465 ?AUTO_2468 ) ) ( TRUCK-AT ?AUTO_2471 ?AUTO_2468 ) ( IN-TRUCK ?AUTO_2464 ?AUTO_2471 ) ( not ( = ?AUTO_2469 ?AUTO_2471 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2464 ?AUTO_2471 ?AUTO_2468 )
      ( DELIVER-PKG ?AUTO_2464 ?AUTO_2465 )
      ( DELIVER-PKG-VERIFY ?AUTO_2464 ?AUTO_2465 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2472 - OBJ
      ?AUTO_2473 - LOCATION
    )
    :vars
    (
      ?AUTO_2478 - TRUCK
      ?AUTO_2477 - LOCATION
      ?AUTO_2476 - CITY
      ?AUTO_2474 - LOCATION
      ?AUTO_2475 - AIRPLANE
      ?AUTO_2479 - TRUCK
      ?AUTO_2481 - LOCATION
      ?AUTO_2480 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2478 ?AUTO_2477 ) ( IN-CITY ?AUTO_2477 ?AUTO_2476 ) ( IN-CITY ?AUTO_2473 ?AUTO_2476 ) ( not ( = ?AUTO_2473 ?AUTO_2477 ) ) ( AIRPORT ?AUTO_2474 ) ( AIRPORT ?AUTO_2477 ) ( AIRPLANE-AT ?AUTO_2475 ?AUTO_2474 ) ( not ( = ?AUTO_2474 ?AUTO_2477 ) ) ( not ( = ?AUTO_2473 ?AUTO_2474 ) ) ( IN-TRUCK ?AUTO_2472 ?AUTO_2479 ) ( not ( = ?AUTO_2478 ?AUTO_2479 ) ) ( TRUCK-AT ?AUTO_2479 ?AUTO_2481 ) ( IN-CITY ?AUTO_2481 ?AUTO_2480 ) ( IN-CITY ?AUTO_2474 ?AUTO_2480 ) ( not ( = ?AUTO_2474 ?AUTO_2481 ) ) ( not ( = ?AUTO_2473 ?AUTO_2481 ) ) ( not ( = ?AUTO_2477 ?AUTO_2481 ) ) ( not ( = ?AUTO_2476 ?AUTO_2480 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2479 ?AUTO_2481 ?AUTO_2474 ?AUTO_2480 )
      ( DELIVER-PKG ?AUTO_2472 ?AUTO_2473 )
      ( DELIVER-PKG-VERIFY ?AUTO_2472 ?AUTO_2473 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2498 - OBJ
      ?AUTO_2499 - LOCATION
    )
    :vars
    (
      ?AUTO_2504 - TRUCK
      ?AUTO_2507 - LOCATION
      ?AUTO_2502 - CITY
      ?AUTO_2506 - LOCATION
      ?AUTO_2503 - TRUCK
      ?AUTO_2505 - LOCATION
      ?AUTO_2500 - CITY
      ?AUTO_2501 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2504 ?AUTO_2507 ) ( IN-CITY ?AUTO_2507 ?AUTO_2502 ) ( IN-CITY ?AUTO_2499 ?AUTO_2502 ) ( not ( = ?AUTO_2499 ?AUTO_2507 ) ) ( AIRPORT ?AUTO_2506 ) ( AIRPORT ?AUTO_2507 ) ( not ( = ?AUTO_2506 ?AUTO_2507 ) ) ( not ( = ?AUTO_2499 ?AUTO_2506 ) ) ( IN-TRUCK ?AUTO_2498 ?AUTO_2503 ) ( not ( = ?AUTO_2504 ?AUTO_2503 ) ) ( TRUCK-AT ?AUTO_2503 ?AUTO_2505 ) ( IN-CITY ?AUTO_2505 ?AUTO_2500 ) ( IN-CITY ?AUTO_2506 ?AUTO_2500 ) ( not ( = ?AUTO_2506 ?AUTO_2505 ) ) ( not ( = ?AUTO_2499 ?AUTO_2505 ) ) ( not ( = ?AUTO_2507 ?AUTO_2505 ) ) ( not ( = ?AUTO_2502 ?AUTO_2500 ) ) ( AIRPLANE-AT ?AUTO_2501 ?AUTO_2507 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2501 ?AUTO_2507 ?AUTO_2506 )
      ( DELIVER-PKG ?AUTO_2498 ?AUTO_2499 )
      ( DELIVER-PKG-VERIFY ?AUTO_2498 ?AUTO_2499 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2524 - OBJ
      ?AUTO_2525 - LOCATION
    )
    :vars
    (
      ?AUTO_2528 - TRUCK
      ?AUTO_2527 - LOCATION
      ?AUTO_2530 - CITY
      ?AUTO_2532 - LOCATION
      ?AUTO_2526 - TRUCK
      ?AUTO_2529 - LOCATION
      ?AUTO_2531 - CITY
      ?AUTO_2534 - LOCATION
      ?AUTO_2533 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2528 ?AUTO_2527 ) ( IN-CITY ?AUTO_2527 ?AUTO_2530 ) ( IN-CITY ?AUTO_2525 ?AUTO_2530 ) ( not ( = ?AUTO_2525 ?AUTO_2527 ) ) ( AIRPORT ?AUTO_2532 ) ( AIRPORT ?AUTO_2527 ) ( not ( = ?AUTO_2532 ?AUTO_2527 ) ) ( not ( = ?AUTO_2525 ?AUTO_2532 ) ) ( IN-TRUCK ?AUTO_2524 ?AUTO_2526 ) ( not ( = ?AUTO_2528 ?AUTO_2526 ) ) ( TRUCK-AT ?AUTO_2526 ?AUTO_2529 ) ( IN-CITY ?AUTO_2529 ?AUTO_2531 ) ( IN-CITY ?AUTO_2532 ?AUTO_2531 ) ( not ( = ?AUTO_2532 ?AUTO_2529 ) ) ( not ( = ?AUTO_2525 ?AUTO_2529 ) ) ( not ( = ?AUTO_2527 ?AUTO_2529 ) ) ( not ( = ?AUTO_2530 ?AUTO_2531 ) ) ( AIRPORT ?AUTO_2534 ) ( AIRPLANE-AT ?AUTO_2533 ?AUTO_2534 ) ( not ( = ?AUTO_2534 ?AUTO_2532 ) ) ( not ( = ?AUTO_2525 ?AUTO_2534 ) ) ( not ( = ?AUTO_2527 ?AUTO_2534 ) ) ( not ( = ?AUTO_2529 ?AUTO_2534 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2533 ?AUTO_2534 ?AUTO_2532 )
      ( DELIVER-PKG ?AUTO_2524 ?AUTO_2525 )
      ( DELIVER-PKG-VERIFY ?AUTO_2524 ?AUTO_2525 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2551 - OBJ
      ?AUTO_2552 - LOCATION
    )
    :vars
    (
      ?AUTO_2554 - LOCATION
      ?AUTO_2555 - CITY
      ?AUTO_2561 - LOCATION
      ?AUTO_2559 - TRUCK
      ?AUTO_2558 - TRUCK
      ?AUTO_2553 - LOCATION
      ?AUTO_2556 - CITY
      ?AUTO_2557 - LOCATION
      ?AUTO_2560 - AIRPLANE
      ?AUTO_2562 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2554 ?AUTO_2555 ) ( IN-CITY ?AUTO_2552 ?AUTO_2555 ) ( not ( = ?AUTO_2552 ?AUTO_2554 ) ) ( AIRPORT ?AUTO_2561 ) ( AIRPORT ?AUTO_2554 ) ( not ( = ?AUTO_2561 ?AUTO_2554 ) ) ( not ( = ?AUTO_2552 ?AUTO_2561 ) ) ( IN-TRUCK ?AUTO_2551 ?AUTO_2559 ) ( not ( = ?AUTO_2558 ?AUTO_2559 ) ) ( TRUCK-AT ?AUTO_2559 ?AUTO_2553 ) ( IN-CITY ?AUTO_2553 ?AUTO_2556 ) ( IN-CITY ?AUTO_2561 ?AUTO_2556 ) ( not ( = ?AUTO_2561 ?AUTO_2553 ) ) ( not ( = ?AUTO_2552 ?AUTO_2553 ) ) ( not ( = ?AUTO_2554 ?AUTO_2553 ) ) ( not ( = ?AUTO_2555 ?AUTO_2556 ) ) ( AIRPORT ?AUTO_2557 ) ( AIRPLANE-AT ?AUTO_2560 ?AUTO_2557 ) ( not ( = ?AUTO_2557 ?AUTO_2561 ) ) ( not ( = ?AUTO_2552 ?AUTO_2557 ) ) ( not ( = ?AUTO_2554 ?AUTO_2557 ) ) ( not ( = ?AUTO_2553 ?AUTO_2557 ) ) ( TRUCK-AT ?AUTO_2558 ?AUTO_2562 ) ( IN-CITY ?AUTO_2562 ?AUTO_2555 ) ( not ( = ?AUTO_2554 ?AUTO_2562 ) ) ( not ( = ?AUTO_2552 ?AUTO_2562 ) ) ( not ( = ?AUTO_2561 ?AUTO_2562 ) ) ( not ( = ?AUTO_2553 ?AUTO_2562 ) ) ( not ( = ?AUTO_2557 ?AUTO_2562 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2558 ?AUTO_2562 ?AUTO_2554 ?AUTO_2555 )
      ( DELIVER-PKG ?AUTO_2551 ?AUTO_2552 )
      ( DELIVER-PKG-VERIFY ?AUTO_2551 ?AUTO_2552 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2674 - OBJ
      ?AUTO_2675 - LOCATION
    )
    :vars
    (
      ?AUTO_2677 - LOCATION
      ?AUTO_2679 - CITY
      ?AUTO_2678 - LOCATION
      ?AUTO_2676 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2677 ?AUTO_2679 ) ( IN-CITY ?AUTO_2675 ?AUTO_2679 ) ( not ( = ?AUTO_2675 ?AUTO_2677 ) ) ( OBJ-AT ?AUTO_2674 ?AUTO_2677 ) ( IN-CITY ?AUTO_2678 ?AUTO_2679 ) ( not ( = ?AUTO_2677 ?AUTO_2678 ) ) ( not ( = ?AUTO_2675 ?AUTO_2678 ) ) ( TRUCK-AT ?AUTO_2676 ?AUTO_2675 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2676 ?AUTO_2675 ?AUTO_2678 ?AUTO_2679 )
      ( DELIVER-PKG ?AUTO_2674 ?AUTO_2675 )
      ( DELIVER-PKG-VERIFY ?AUTO_2674 ?AUTO_2675 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3017 - OBJ
      ?AUTO_3018 - LOCATION
    )
    :vars
    (
      ?AUTO_3019 - LOCATION
      ?AUTO_3021 - CITY
      ?AUTO_3025 - LOCATION
      ?AUTO_3026 - LOCATION
      ?AUTO_3027 - AIRPLANE
      ?AUTO_3022 - TRUCK
      ?AUTO_3020 - TRUCK
      ?AUTO_3024 - LOCATION
      ?AUTO_3023 - CITY
      ?AUTO_3028 - LOCATION
      ?AUTO_3029 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3019 ?AUTO_3021 ) ( IN-CITY ?AUTO_3018 ?AUTO_3021 ) ( not ( = ?AUTO_3018 ?AUTO_3019 ) ) ( AIRPORT ?AUTO_3025 ) ( AIRPORT ?AUTO_3019 ) ( not ( = ?AUTO_3025 ?AUTO_3019 ) ) ( not ( = ?AUTO_3018 ?AUTO_3025 ) ) ( AIRPORT ?AUTO_3026 ) ( AIRPLANE-AT ?AUTO_3027 ?AUTO_3026 ) ( not ( = ?AUTO_3026 ?AUTO_3025 ) ) ( not ( = ?AUTO_3018 ?AUTO_3026 ) ) ( not ( = ?AUTO_3019 ?AUTO_3026 ) ) ( not ( = ?AUTO_3022 ?AUTO_3020 ) ) ( IN-CITY ?AUTO_3024 ?AUTO_3023 ) ( IN-CITY ?AUTO_3025 ?AUTO_3023 ) ( not ( = ?AUTO_3025 ?AUTO_3024 ) ) ( not ( = ?AUTO_3018 ?AUTO_3024 ) ) ( not ( = ?AUTO_3019 ?AUTO_3024 ) ) ( not ( = ?AUTO_3021 ?AUTO_3023 ) ) ( not ( = ?AUTO_3026 ?AUTO_3024 ) ) ( OBJ-AT ?AUTO_3017 ?AUTO_3024 ) ( TRUCK-AT ?AUTO_3020 ?AUTO_3028 ) ( IN-CITY ?AUTO_3028 ?AUTO_3023 ) ( not ( = ?AUTO_3024 ?AUTO_3028 ) ) ( not ( = ?AUTO_3018 ?AUTO_3028 ) ) ( not ( = ?AUTO_3019 ?AUTO_3028 ) ) ( not ( = ?AUTO_3025 ?AUTO_3028 ) ) ( not ( = ?AUTO_3026 ?AUTO_3028 ) ) ( TRUCK-AT ?AUTO_3022 ?AUTO_3029 ) ( IN-CITY ?AUTO_3029 ?AUTO_3021 ) ( not ( = ?AUTO_3019 ?AUTO_3029 ) ) ( not ( = ?AUTO_3018 ?AUTO_3029 ) ) ( not ( = ?AUTO_3025 ?AUTO_3029 ) ) ( not ( = ?AUTO_3026 ?AUTO_3029 ) ) ( not ( = ?AUTO_3024 ?AUTO_3029 ) ) ( not ( = ?AUTO_3028 ?AUTO_3029 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3022 ?AUTO_3029 ?AUTO_3019 ?AUTO_3021 )
      ( DELIVER-PKG ?AUTO_3017 ?AUTO_3018 )
      ( DELIVER-PKG-VERIFY ?AUTO_3017 ?AUTO_3018 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3071 - OBJ
      ?AUTO_3072 - LOCATION
    )
    :vars
    (
      ?AUTO_3073 - LOCATION
      ?AUTO_3075 - CITY
      ?AUTO_3074 - TRUCK
      ?AUTO_3076 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3073 ?AUTO_3075 ) ( IN-CITY ?AUTO_3072 ?AUTO_3075 ) ( not ( = ?AUTO_3072 ?AUTO_3073 ) ) ( OBJ-AT ?AUTO_3071 ?AUTO_3073 ) ( TRUCK-AT ?AUTO_3074 ?AUTO_3076 ) ( IN-CITY ?AUTO_3076 ?AUTO_3075 ) ( not ( = ?AUTO_3072 ?AUTO_3076 ) ) ( not ( = ?AUTO_3073 ?AUTO_3076 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3074 ?AUTO_3076 ?AUTO_3072 ?AUTO_3075 )
      ( DELIVER-PKG ?AUTO_3071 ?AUTO_3072 )
      ( DELIVER-PKG-VERIFY ?AUTO_3071 ?AUTO_3072 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3130 - OBJ
      ?AUTO_3131 - LOCATION
    )
    :vars
    (
      ?AUTO_3132 - LOCATION
      ?AUTO_3133 - AIRPLANE
      ?AUTO_3134 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3132 ) ( AIRPORT ?AUTO_3131 ) ( not ( = ?AUTO_3132 ?AUTO_3131 ) ) ( AIRPLANE-AT ?AUTO_3133 ?AUTO_3131 ) ( TRUCK-AT ?AUTO_3134 ?AUTO_3132 ) ( IN-TRUCK ?AUTO_3130 ?AUTO_3134 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3130 ?AUTO_3134 ?AUTO_3132 )
      ( DELIVER-PKG ?AUTO_3130 ?AUTO_3131 )
      ( DELIVER-PKG-VERIFY ?AUTO_3130 ?AUTO_3131 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3135 - OBJ
      ?AUTO_3136 - LOCATION
    )
    :vars
    (
      ?AUTO_3138 - LOCATION
      ?AUTO_3137 - AIRPLANE
      ?AUTO_3139 - TRUCK
      ?AUTO_3141 - LOCATION
      ?AUTO_3140 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3138 ) ( AIRPORT ?AUTO_3136 ) ( not ( = ?AUTO_3138 ?AUTO_3136 ) ) ( AIRPLANE-AT ?AUTO_3137 ?AUTO_3136 ) ( IN-TRUCK ?AUTO_3135 ?AUTO_3139 ) ( TRUCK-AT ?AUTO_3139 ?AUTO_3141 ) ( IN-CITY ?AUTO_3141 ?AUTO_3140 ) ( IN-CITY ?AUTO_3138 ?AUTO_3140 ) ( not ( = ?AUTO_3138 ?AUTO_3141 ) ) ( not ( = ?AUTO_3136 ?AUTO_3141 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3139 ?AUTO_3141 ?AUTO_3138 ?AUTO_3140 )
      ( DELIVER-PKG ?AUTO_3135 ?AUTO_3136 )
      ( DELIVER-PKG-VERIFY ?AUTO_3135 ?AUTO_3136 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3142 - OBJ
      ?AUTO_3143 - LOCATION
    )
    :vars
    (
      ?AUTO_3144 - LOCATION
      ?AUTO_3145 - AIRPLANE
      ?AUTO_3146 - TRUCK
      ?AUTO_3147 - LOCATION
      ?AUTO_3148 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3144 ) ( AIRPORT ?AUTO_3143 ) ( not ( = ?AUTO_3144 ?AUTO_3143 ) ) ( AIRPLANE-AT ?AUTO_3145 ?AUTO_3143 ) ( TRUCK-AT ?AUTO_3146 ?AUTO_3147 ) ( IN-CITY ?AUTO_3147 ?AUTO_3148 ) ( IN-CITY ?AUTO_3144 ?AUTO_3148 ) ( not ( = ?AUTO_3144 ?AUTO_3147 ) ) ( not ( = ?AUTO_3143 ?AUTO_3147 ) ) ( OBJ-AT ?AUTO_3142 ?AUTO_3147 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3142 ?AUTO_3146 ?AUTO_3147 )
      ( DELIVER-PKG ?AUTO_3142 ?AUTO_3143 )
      ( DELIVER-PKG-VERIFY ?AUTO_3142 ?AUTO_3143 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3149 - OBJ
      ?AUTO_3150 - LOCATION
    )
    :vars
    (
      ?AUTO_3152 - LOCATION
      ?AUTO_3151 - AIRPLANE
      ?AUTO_3153 - LOCATION
      ?AUTO_3155 - CITY
      ?AUTO_3154 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3152 ) ( AIRPORT ?AUTO_3150 ) ( not ( = ?AUTO_3152 ?AUTO_3150 ) ) ( AIRPLANE-AT ?AUTO_3151 ?AUTO_3150 ) ( IN-CITY ?AUTO_3153 ?AUTO_3155 ) ( IN-CITY ?AUTO_3152 ?AUTO_3155 ) ( not ( = ?AUTO_3152 ?AUTO_3153 ) ) ( not ( = ?AUTO_3150 ?AUTO_3153 ) ) ( OBJ-AT ?AUTO_3149 ?AUTO_3153 ) ( TRUCK-AT ?AUTO_3154 ?AUTO_3152 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3154 ?AUTO_3152 ?AUTO_3153 ?AUTO_3155 )
      ( DELIVER-PKG ?AUTO_3149 ?AUTO_3150 )
      ( DELIVER-PKG-VERIFY ?AUTO_3149 ?AUTO_3150 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3257 - OBJ
      ?AUTO_3258 - LOCATION
    )
    :vars
    (
      ?AUTO_3260 - TRUCK
      ?AUTO_3261 - LOCATION
      ?AUTO_3259 - CITY
      ?AUTO_3262 - LOCATION
      ?AUTO_3263 - AIRPLANE
      ?AUTO_3264 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3260 ?AUTO_3261 ) ( IN-CITY ?AUTO_3261 ?AUTO_3259 ) ( IN-CITY ?AUTO_3258 ?AUTO_3259 ) ( not ( = ?AUTO_3258 ?AUTO_3261 ) ) ( AIRPORT ?AUTO_3262 ) ( AIRPORT ?AUTO_3261 ) ( not ( = ?AUTO_3262 ?AUTO_3261 ) ) ( not ( = ?AUTO_3258 ?AUTO_3262 ) ) ( AIRPLANE-AT ?AUTO_3263 ?AUTO_3261 ) ( TRUCK-AT ?AUTO_3264 ?AUTO_3262 ) ( IN-TRUCK ?AUTO_3257 ?AUTO_3264 ) ( not ( = ?AUTO_3260 ?AUTO_3264 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3257 ?AUTO_3264 ?AUTO_3262 )
      ( DELIVER-PKG ?AUTO_3257 ?AUTO_3258 )
      ( DELIVER-PKG-VERIFY ?AUTO_3257 ?AUTO_3258 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3265 - OBJ
      ?AUTO_3266 - LOCATION
    )
    :vars
    (
      ?AUTO_3268 - TRUCK
      ?AUTO_3269 - LOCATION
      ?AUTO_3267 - CITY
      ?AUTO_3270 - LOCATION
      ?AUTO_3271 - AIRPLANE
      ?AUTO_3272 - TRUCK
      ?AUTO_3274 - LOCATION
      ?AUTO_3273 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3268 ?AUTO_3269 ) ( IN-CITY ?AUTO_3269 ?AUTO_3267 ) ( IN-CITY ?AUTO_3266 ?AUTO_3267 ) ( not ( = ?AUTO_3266 ?AUTO_3269 ) ) ( AIRPORT ?AUTO_3270 ) ( AIRPORT ?AUTO_3269 ) ( not ( = ?AUTO_3270 ?AUTO_3269 ) ) ( not ( = ?AUTO_3266 ?AUTO_3270 ) ) ( AIRPLANE-AT ?AUTO_3271 ?AUTO_3269 ) ( IN-TRUCK ?AUTO_3265 ?AUTO_3272 ) ( not ( = ?AUTO_3268 ?AUTO_3272 ) ) ( TRUCK-AT ?AUTO_3272 ?AUTO_3274 ) ( IN-CITY ?AUTO_3274 ?AUTO_3273 ) ( IN-CITY ?AUTO_3270 ?AUTO_3273 ) ( not ( = ?AUTO_3270 ?AUTO_3274 ) ) ( not ( = ?AUTO_3266 ?AUTO_3274 ) ) ( not ( = ?AUTO_3269 ?AUTO_3274 ) ) ( not ( = ?AUTO_3267 ?AUTO_3273 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3272 ?AUTO_3274 ?AUTO_3270 ?AUTO_3273 )
      ( DELIVER-PKG ?AUTO_3265 ?AUTO_3266 )
      ( DELIVER-PKG-VERIFY ?AUTO_3265 ?AUTO_3266 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3275 - OBJ
      ?AUTO_3276 - LOCATION
    )
    :vars
    (
      ?AUTO_3282 - TRUCK
      ?AUTO_3281 - LOCATION
      ?AUTO_3284 - CITY
      ?AUTO_3283 - LOCATION
      ?AUTO_3280 - AIRPLANE
      ?AUTO_3279 - TRUCK
      ?AUTO_3277 - LOCATION
      ?AUTO_3278 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3282 ?AUTO_3281 ) ( IN-CITY ?AUTO_3281 ?AUTO_3284 ) ( IN-CITY ?AUTO_3276 ?AUTO_3284 ) ( not ( = ?AUTO_3276 ?AUTO_3281 ) ) ( AIRPORT ?AUTO_3283 ) ( AIRPORT ?AUTO_3281 ) ( not ( = ?AUTO_3283 ?AUTO_3281 ) ) ( not ( = ?AUTO_3276 ?AUTO_3283 ) ) ( AIRPLANE-AT ?AUTO_3280 ?AUTO_3281 ) ( not ( = ?AUTO_3282 ?AUTO_3279 ) ) ( TRUCK-AT ?AUTO_3279 ?AUTO_3277 ) ( IN-CITY ?AUTO_3277 ?AUTO_3278 ) ( IN-CITY ?AUTO_3283 ?AUTO_3278 ) ( not ( = ?AUTO_3283 ?AUTO_3277 ) ) ( not ( = ?AUTO_3276 ?AUTO_3277 ) ) ( not ( = ?AUTO_3281 ?AUTO_3277 ) ) ( not ( = ?AUTO_3284 ?AUTO_3278 ) ) ( OBJ-AT ?AUTO_3275 ?AUTO_3277 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3275 ?AUTO_3279 ?AUTO_3277 )
      ( DELIVER-PKG ?AUTO_3275 ?AUTO_3276 )
      ( DELIVER-PKG-VERIFY ?AUTO_3275 ?AUTO_3276 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3285 - OBJ
      ?AUTO_3286 - LOCATION
    )
    :vars
    (
      ?AUTO_3293 - TRUCK
      ?AUTO_3291 - LOCATION
      ?AUTO_3292 - CITY
      ?AUTO_3290 - LOCATION
      ?AUTO_3289 - AIRPLANE
      ?AUTO_3287 - TRUCK
      ?AUTO_3288 - LOCATION
      ?AUTO_3294 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3293 ?AUTO_3291 ) ( IN-CITY ?AUTO_3291 ?AUTO_3292 ) ( IN-CITY ?AUTO_3286 ?AUTO_3292 ) ( not ( = ?AUTO_3286 ?AUTO_3291 ) ) ( AIRPORT ?AUTO_3290 ) ( AIRPORT ?AUTO_3291 ) ( not ( = ?AUTO_3290 ?AUTO_3291 ) ) ( not ( = ?AUTO_3286 ?AUTO_3290 ) ) ( AIRPLANE-AT ?AUTO_3289 ?AUTO_3291 ) ( not ( = ?AUTO_3293 ?AUTO_3287 ) ) ( IN-CITY ?AUTO_3288 ?AUTO_3294 ) ( IN-CITY ?AUTO_3290 ?AUTO_3294 ) ( not ( = ?AUTO_3290 ?AUTO_3288 ) ) ( not ( = ?AUTO_3286 ?AUTO_3288 ) ) ( not ( = ?AUTO_3291 ?AUTO_3288 ) ) ( not ( = ?AUTO_3292 ?AUTO_3294 ) ) ( OBJ-AT ?AUTO_3285 ?AUTO_3288 ) ( TRUCK-AT ?AUTO_3287 ?AUTO_3290 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3287 ?AUTO_3290 ?AUTO_3288 ?AUTO_3294 )
      ( DELIVER-PKG ?AUTO_3285 ?AUTO_3286 )
      ( DELIVER-PKG-VERIFY ?AUTO_3285 ?AUTO_3286 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3295 - OBJ
      ?AUTO_3296 - LOCATION
    )
    :vars
    (
      ?AUTO_3303 - LOCATION
      ?AUTO_3299 - CITY
      ?AUTO_3297 - LOCATION
      ?AUTO_3304 - AIRPLANE
      ?AUTO_3302 - TRUCK
      ?AUTO_3300 - TRUCK
      ?AUTO_3301 - LOCATION
      ?AUTO_3298 - CITY
      ?AUTO_3305 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3303 ?AUTO_3299 ) ( IN-CITY ?AUTO_3296 ?AUTO_3299 ) ( not ( = ?AUTO_3296 ?AUTO_3303 ) ) ( AIRPORT ?AUTO_3297 ) ( AIRPORT ?AUTO_3303 ) ( not ( = ?AUTO_3297 ?AUTO_3303 ) ) ( not ( = ?AUTO_3296 ?AUTO_3297 ) ) ( AIRPLANE-AT ?AUTO_3304 ?AUTO_3303 ) ( not ( = ?AUTO_3302 ?AUTO_3300 ) ) ( IN-CITY ?AUTO_3301 ?AUTO_3298 ) ( IN-CITY ?AUTO_3297 ?AUTO_3298 ) ( not ( = ?AUTO_3297 ?AUTO_3301 ) ) ( not ( = ?AUTO_3296 ?AUTO_3301 ) ) ( not ( = ?AUTO_3303 ?AUTO_3301 ) ) ( not ( = ?AUTO_3299 ?AUTO_3298 ) ) ( OBJ-AT ?AUTO_3295 ?AUTO_3301 ) ( TRUCK-AT ?AUTO_3300 ?AUTO_3297 ) ( TRUCK-AT ?AUTO_3302 ?AUTO_3305 ) ( IN-CITY ?AUTO_3305 ?AUTO_3299 ) ( not ( = ?AUTO_3303 ?AUTO_3305 ) ) ( not ( = ?AUTO_3296 ?AUTO_3305 ) ) ( not ( = ?AUTO_3297 ?AUTO_3305 ) ) ( not ( = ?AUTO_3301 ?AUTO_3305 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3302 ?AUTO_3305 ?AUTO_3303 ?AUTO_3299 )
      ( DELIVER-PKG ?AUTO_3295 ?AUTO_3296 )
      ( DELIVER-PKG-VERIFY ?AUTO_3295 ?AUTO_3296 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3367 - OBJ
      ?AUTO_3368 - LOCATION
    )
    :vars
    (
      ?AUTO_3371 - LOCATION
      ?AUTO_3370 - CITY
      ?AUTO_3377 - LOCATION
      ?AUTO_3373 - AIRPLANE
      ?AUTO_3374 - TRUCK
      ?AUTO_3369 - TRUCK
      ?AUTO_3376 - LOCATION
      ?AUTO_3375 - CITY
      ?AUTO_3372 - LOCATION
      ?AUTO_3378 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3371 ?AUTO_3370 ) ( IN-CITY ?AUTO_3368 ?AUTO_3370 ) ( not ( = ?AUTO_3368 ?AUTO_3371 ) ) ( AIRPORT ?AUTO_3377 ) ( AIRPORT ?AUTO_3371 ) ( not ( = ?AUTO_3377 ?AUTO_3371 ) ) ( not ( = ?AUTO_3368 ?AUTO_3377 ) ) ( AIRPLANE-AT ?AUTO_3373 ?AUTO_3371 ) ( not ( = ?AUTO_3374 ?AUTO_3369 ) ) ( IN-CITY ?AUTO_3376 ?AUTO_3375 ) ( IN-CITY ?AUTO_3377 ?AUTO_3375 ) ( not ( = ?AUTO_3377 ?AUTO_3376 ) ) ( not ( = ?AUTO_3368 ?AUTO_3376 ) ) ( not ( = ?AUTO_3371 ?AUTO_3376 ) ) ( not ( = ?AUTO_3370 ?AUTO_3375 ) ) ( TRUCK-AT ?AUTO_3369 ?AUTO_3377 ) ( TRUCK-AT ?AUTO_3374 ?AUTO_3372 ) ( IN-CITY ?AUTO_3372 ?AUTO_3370 ) ( not ( = ?AUTO_3371 ?AUTO_3372 ) ) ( not ( = ?AUTO_3368 ?AUTO_3372 ) ) ( not ( = ?AUTO_3377 ?AUTO_3372 ) ) ( not ( = ?AUTO_3376 ?AUTO_3372 ) ) ( TRUCK-AT ?AUTO_3378 ?AUTO_3376 ) ( IN-TRUCK ?AUTO_3367 ?AUTO_3378 ) ( not ( = ?AUTO_3374 ?AUTO_3378 ) ) ( not ( = ?AUTO_3369 ?AUTO_3378 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3367 ?AUTO_3378 ?AUTO_3376 )
      ( DELIVER-PKG ?AUTO_3367 ?AUTO_3368 )
      ( DELIVER-PKG-VERIFY ?AUTO_3367 ?AUTO_3368 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3641 - OBJ
      ?AUTO_3642 - LOCATION
    )
    :vars
    (
      ?AUTO_3646 - LOCATION
      ?AUTO_3643 - CITY
      ?AUTO_3647 - AIRPLANE
      ?AUTO_3645 - LOCATION
      ?AUTO_3644 - TRUCK
      ?AUTO_3648 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3646 ?AUTO_3643 ) ( IN-CITY ?AUTO_3642 ?AUTO_3643 ) ( not ( = ?AUTO_3642 ?AUTO_3646 ) ) ( IN-AIRPLANE ?AUTO_3641 ?AUTO_3647 ) ( AIRPORT ?AUTO_3645 ) ( AIRPORT ?AUTO_3646 ) ( AIRPLANE-AT ?AUTO_3647 ?AUTO_3645 ) ( not ( = ?AUTO_3645 ?AUTO_3646 ) ) ( not ( = ?AUTO_3642 ?AUTO_3645 ) ) ( TRUCK-AT ?AUTO_3644 ?AUTO_3648 ) ( IN-CITY ?AUTO_3648 ?AUTO_3643 ) ( not ( = ?AUTO_3646 ?AUTO_3648 ) ) ( not ( = ?AUTO_3642 ?AUTO_3648 ) ) ( not ( = ?AUTO_3645 ?AUTO_3648 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3644 ?AUTO_3648 ?AUTO_3646 ?AUTO_3643 )
      ( DELIVER-PKG ?AUTO_3641 ?AUTO_3642 )
      ( DELIVER-PKG-VERIFY ?AUTO_3641 ?AUTO_3642 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3869 - OBJ
      ?AUTO_3870 - LOCATION
    )
    :vars
    (
      ?AUTO_3873 - LOCATION
      ?AUTO_3872 - CITY
      ?AUTO_3875 - TRUCK
      ?AUTO_3874 - LOCATION
      ?AUTO_3871 - LOCATION
      ?AUTO_3876 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3873 ?AUTO_3872 ) ( IN-CITY ?AUTO_3870 ?AUTO_3872 ) ( not ( = ?AUTO_3870 ?AUTO_3873 ) ) ( TRUCK-AT ?AUTO_3875 ?AUTO_3874 ) ( IN-CITY ?AUTO_3874 ?AUTO_3872 ) ( not ( = ?AUTO_3873 ?AUTO_3874 ) ) ( not ( = ?AUTO_3870 ?AUTO_3874 ) ) ( AIRPORT ?AUTO_3871 ) ( AIRPORT ?AUTO_3873 ) ( not ( = ?AUTO_3871 ?AUTO_3873 ) ) ( not ( = ?AUTO_3870 ?AUTO_3871 ) ) ( not ( = ?AUTO_3874 ?AUTO_3871 ) ) ( OBJ-AT ?AUTO_3869 ?AUTO_3871 ) ( AIRPLANE-AT ?AUTO_3876 ?AUTO_3873 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3876 ?AUTO_3873 ?AUTO_3871 )
      ( DELIVER-PKG ?AUTO_3869 ?AUTO_3870 )
      ( DELIVER-PKG-VERIFY ?AUTO_3869 ?AUTO_3870 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3881 - OBJ
      ?AUTO_3882 - LOCATION
    )
    :vars
    (
      ?AUTO_3883 - LOCATION
      ?AUTO_3885 - CITY
      ?AUTO_3887 - LOCATION
      ?AUTO_3884 - LOCATION
      ?AUTO_3886 - AIRPLANE
      ?AUTO_3888 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3883 ?AUTO_3885 ) ( IN-CITY ?AUTO_3882 ?AUTO_3885 ) ( not ( = ?AUTO_3882 ?AUTO_3883 ) ) ( IN-CITY ?AUTO_3887 ?AUTO_3885 ) ( not ( = ?AUTO_3883 ?AUTO_3887 ) ) ( not ( = ?AUTO_3882 ?AUTO_3887 ) ) ( AIRPORT ?AUTO_3884 ) ( AIRPORT ?AUTO_3883 ) ( not ( = ?AUTO_3884 ?AUTO_3883 ) ) ( not ( = ?AUTO_3882 ?AUTO_3884 ) ) ( not ( = ?AUTO_3887 ?AUTO_3884 ) ) ( OBJ-AT ?AUTO_3881 ?AUTO_3884 ) ( AIRPLANE-AT ?AUTO_3886 ?AUTO_3883 ) ( TRUCK-AT ?AUTO_3888 ?AUTO_3882 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3888 ?AUTO_3882 ?AUTO_3887 ?AUTO_3885 )
      ( DELIVER-PKG ?AUTO_3881 ?AUTO_3882 )
      ( DELIVER-PKG-VERIFY ?AUTO_3881 ?AUTO_3882 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3978 - OBJ
      ?AUTO_3979 - LOCATION
    )
    :vars
    (
      ?AUTO_3980 - LOCATION
      ?AUTO_3983 - AIRPLANE
      ?AUTO_3982 - TRUCK
      ?AUTO_3981 - LOCATION
      ?AUTO_3984 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3980 ) ( AIRPORT ?AUTO_3979 ) ( AIRPLANE-AT ?AUTO_3983 ?AUTO_3980 ) ( not ( = ?AUTO_3980 ?AUTO_3979 ) ) ( TRUCK-AT ?AUTO_3982 ?AUTO_3981 ) ( IN-CITY ?AUTO_3981 ?AUTO_3984 ) ( IN-CITY ?AUTO_3980 ?AUTO_3984 ) ( not ( = ?AUTO_3980 ?AUTO_3981 ) ) ( not ( = ?AUTO_3979 ?AUTO_3981 ) ) ( OBJ-AT ?AUTO_3978 ?AUTO_3981 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3978 ?AUTO_3982 ?AUTO_3981 )
      ( DELIVER-PKG ?AUTO_3978 ?AUTO_3979 )
      ( DELIVER-PKG-VERIFY ?AUTO_3978 ?AUTO_3979 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3985 - OBJ
      ?AUTO_3986 - LOCATION
    )
    :vars
    (
      ?AUTO_3987 - LOCATION
      ?AUTO_3991 - AIRPLANE
      ?AUTO_3990 - LOCATION
      ?AUTO_3988 - CITY
      ?AUTO_3989 - TRUCK
      ?AUTO_3992 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3987 ) ( AIRPORT ?AUTO_3986 ) ( AIRPLANE-AT ?AUTO_3991 ?AUTO_3987 ) ( not ( = ?AUTO_3987 ?AUTO_3986 ) ) ( IN-CITY ?AUTO_3990 ?AUTO_3988 ) ( IN-CITY ?AUTO_3987 ?AUTO_3988 ) ( not ( = ?AUTO_3987 ?AUTO_3990 ) ) ( not ( = ?AUTO_3986 ?AUTO_3990 ) ) ( OBJ-AT ?AUTO_3985 ?AUTO_3990 ) ( TRUCK-AT ?AUTO_3989 ?AUTO_3992 ) ( IN-CITY ?AUTO_3992 ?AUTO_3988 ) ( not ( = ?AUTO_3990 ?AUTO_3992 ) ) ( not ( = ?AUTO_3986 ?AUTO_3992 ) ) ( not ( = ?AUTO_3987 ?AUTO_3992 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3989 ?AUTO_3992 ?AUTO_3990 ?AUTO_3988 )
      ( DELIVER-PKG ?AUTO_3985 ?AUTO_3986 )
      ( DELIVER-PKG-VERIFY ?AUTO_3985 ?AUTO_3986 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4113 - OBJ
      ?AUTO_4114 - LOCATION
    )
    :vars
    (
      ?AUTO_4121 - TRUCK
      ?AUTO_4116 - LOCATION
      ?AUTO_4119 - CITY
      ?AUTO_4118 - LOCATION
      ?AUTO_4120 - AIRPLANE
      ?AUTO_4117 - TRUCK
      ?AUTO_4122 - LOCATION
      ?AUTO_4115 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4121 ?AUTO_4116 ) ( IN-CITY ?AUTO_4116 ?AUTO_4119 ) ( IN-CITY ?AUTO_4114 ?AUTO_4119 ) ( not ( = ?AUTO_4114 ?AUTO_4116 ) ) ( AIRPORT ?AUTO_4118 ) ( AIRPORT ?AUTO_4116 ) ( AIRPLANE-AT ?AUTO_4120 ?AUTO_4118 ) ( not ( = ?AUTO_4118 ?AUTO_4116 ) ) ( not ( = ?AUTO_4114 ?AUTO_4118 ) ) ( not ( = ?AUTO_4121 ?AUTO_4117 ) ) ( TRUCK-AT ?AUTO_4117 ?AUTO_4122 ) ( IN-CITY ?AUTO_4122 ?AUTO_4115 ) ( IN-CITY ?AUTO_4118 ?AUTO_4115 ) ( not ( = ?AUTO_4118 ?AUTO_4122 ) ) ( not ( = ?AUTO_4114 ?AUTO_4122 ) ) ( not ( = ?AUTO_4116 ?AUTO_4122 ) ) ( not ( = ?AUTO_4119 ?AUTO_4115 ) ) ( OBJ-AT ?AUTO_4113 ?AUTO_4122 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4113 ?AUTO_4117 ?AUTO_4122 )
      ( DELIVER-PKG ?AUTO_4113 ?AUTO_4114 )
      ( DELIVER-PKG-VERIFY ?AUTO_4113 ?AUTO_4114 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4123 - OBJ
      ?AUTO_4124 - LOCATION
    )
    :vars
    (
      ?AUTO_4130 - TRUCK
      ?AUTO_4125 - LOCATION
      ?AUTO_4126 - CITY
      ?AUTO_4127 - LOCATION
      ?AUTO_4132 - AIRPLANE
      ?AUTO_4129 - TRUCK
      ?AUTO_4131 - LOCATION
      ?AUTO_4128 - CITY
      ?AUTO_4133 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4130 ?AUTO_4125 ) ( IN-CITY ?AUTO_4125 ?AUTO_4126 ) ( IN-CITY ?AUTO_4124 ?AUTO_4126 ) ( not ( = ?AUTO_4124 ?AUTO_4125 ) ) ( AIRPORT ?AUTO_4127 ) ( AIRPORT ?AUTO_4125 ) ( AIRPLANE-AT ?AUTO_4132 ?AUTO_4127 ) ( not ( = ?AUTO_4127 ?AUTO_4125 ) ) ( not ( = ?AUTO_4124 ?AUTO_4127 ) ) ( not ( = ?AUTO_4130 ?AUTO_4129 ) ) ( IN-CITY ?AUTO_4131 ?AUTO_4128 ) ( IN-CITY ?AUTO_4127 ?AUTO_4128 ) ( not ( = ?AUTO_4127 ?AUTO_4131 ) ) ( not ( = ?AUTO_4124 ?AUTO_4131 ) ) ( not ( = ?AUTO_4125 ?AUTO_4131 ) ) ( not ( = ?AUTO_4126 ?AUTO_4128 ) ) ( OBJ-AT ?AUTO_4123 ?AUTO_4131 ) ( TRUCK-AT ?AUTO_4129 ?AUTO_4133 ) ( IN-CITY ?AUTO_4133 ?AUTO_4128 ) ( not ( = ?AUTO_4131 ?AUTO_4133 ) ) ( not ( = ?AUTO_4124 ?AUTO_4133 ) ) ( not ( = ?AUTO_4125 ?AUTO_4133 ) ) ( not ( = ?AUTO_4127 ?AUTO_4133 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4129 ?AUTO_4133 ?AUTO_4131 ?AUTO_4128 )
      ( DELIVER-PKG ?AUTO_4123 ?AUTO_4124 )
      ( DELIVER-PKG-VERIFY ?AUTO_4123 ?AUTO_4124 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4369 - OBJ
      ?AUTO_4370 - LOCATION
    )
    :vars
    (
      ?AUTO_4371 - LOCATION
      ?AUTO_4374 - CITY
      ?AUTO_4372 - LOCATION
      ?AUTO_4376 - AIRPLANE
      ?AUTO_4375 - TRUCK
      ?AUTO_4373 - LOCATION
      ?AUTO_4377 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4371 ?AUTO_4374 ) ( IN-CITY ?AUTO_4370 ?AUTO_4374 ) ( not ( = ?AUTO_4370 ?AUTO_4371 ) ) ( AIRPORT ?AUTO_4372 ) ( AIRPORT ?AUTO_4371 ) ( not ( = ?AUTO_4372 ?AUTO_4371 ) ) ( not ( = ?AUTO_4370 ?AUTO_4372 ) ) ( AIRPLANE-AT ?AUTO_4376 ?AUTO_4371 ) ( TRUCK-AT ?AUTO_4375 ?AUTO_4373 ) ( IN-CITY ?AUTO_4373 ?AUTO_4374 ) ( not ( = ?AUTO_4371 ?AUTO_4373 ) ) ( not ( = ?AUTO_4370 ?AUTO_4373 ) ) ( not ( = ?AUTO_4372 ?AUTO_4373 ) ) ( TRUCK-AT ?AUTO_4377 ?AUTO_4372 ) ( IN-TRUCK ?AUTO_4369 ?AUTO_4377 ) ( not ( = ?AUTO_4375 ?AUTO_4377 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4369 ?AUTO_4377 ?AUTO_4372 )
      ( DELIVER-PKG ?AUTO_4369 ?AUTO_4370 )
      ( DELIVER-PKG-VERIFY ?AUTO_4369 ?AUTO_4370 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4380 - OBJ
      ?AUTO_4381 - LOCATION
    )
    :vars
    (
      ?AUTO_4384 - LOCATION
      ?AUTO_4383 - CITY
      ?AUTO_4388 - LOCATION
      ?AUTO_4385 - AIRPLANE
      ?AUTO_4386 - TRUCK
      ?AUTO_4382 - LOCATION
      ?AUTO_4387 - TRUCK
      ?AUTO_4390 - LOCATION
      ?AUTO_4389 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4384 ?AUTO_4383 ) ( IN-CITY ?AUTO_4381 ?AUTO_4383 ) ( not ( = ?AUTO_4381 ?AUTO_4384 ) ) ( AIRPORT ?AUTO_4388 ) ( AIRPORT ?AUTO_4384 ) ( not ( = ?AUTO_4388 ?AUTO_4384 ) ) ( not ( = ?AUTO_4381 ?AUTO_4388 ) ) ( AIRPLANE-AT ?AUTO_4385 ?AUTO_4384 ) ( TRUCK-AT ?AUTO_4386 ?AUTO_4382 ) ( IN-CITY ?AUTO_4382 ?AUTO_4383 ) ( not ( = ?AUTO_4384 ?AUTO_4382 ) ) ( not ( = ?AUTO_4381 ?AUTO_4382 ) ) ( not ( = ?AUTO_4388 ?AUTO_4382 ) ) ( IN-TRUCK ?AUTO_4380 ?AUTO_4387 ) ( not ( = ?AUTO_4386 ?AUTO_4387 ) ) ( TRUCK-AT ?AUTO_4387 ?AUTO_4390 ) ( IN-CITY ?AUTO_4390 ?AUTO_4389 ) ( IN-CITY ?AUTO_4388 ?AUTO_4389 ) ( not ( = ?AUTO_4388 ?AUTO_4390 ) ) ( not ( = ?AUTO_4381 ?AUTO_4390 ) ) ( not ( = ?AUTO_4384 ?AUTO_4390 ) ) ( not ( = ?AUTO_4383 ?AUTO_4389 ) ) ( not ( = ?AUTO_4382 ?AUTO_4390 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4387 ?AUTO_4390 ?AUTO_4388 ?AUTO_4389 )
      ( DELIVER-PKG ?AUTO_4380 ?AUTO_4381 )
      ( DELIVER-PKG-VERIFY ?AUTO_4380 ?AUTO_4381 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4391 - OBJ
      ?AUTO_4392 - LOCATION
    )
    :vars
    (
      ?AUTO_4395 - LOCATION
      ?AUTO_4393 - CITY
      ?AUTO_4398 - LOCATION
      ?AUTO_4394 - AIRPLANE
      ?AUTO_4399 - TRUCK
      ?AUTO_4397 - LOCATION
      ?AUTO_4396 - TRUCK
      ?AUTO_4401 - LOCATION
      ?AUTO_4400 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4395 ?AUTO_4393 ) ( IN-CITY ?AUTO_4392 ?AUTO_4393 ) ( not ( = ?AUTO_4392 ?AUTO_4395 ) ) ( AIRPORT ?AUTO_4398 ) ( AIRPORT ?AUTO_4395 ) ( not ( = ?AUTO_4398 ?AUTO_4395 ) ) ( not ( = ?AUTO_4392 ?AUTO_4398 ) ) ( AIRPLANE-AT ?AUTO_4394 ?AUTO_4395 ) ( TRUCK-AT ?AUTO_4399 ?AUTO_4397 ) ( IN-CITY ?AUTO_4397 ?AUTO_4393 ) ( not ( = ?AUTO_4395 ?AUTO_4397 ) ) ( not ( = ?AUTO_4392 ?AUTO_4397 ) ) ( not ( = ?AUTO_4398 ?AUTO_4397 ) ) ( not ( = ?AUTO_4399 ?AUTO_4396 ) ) ( TRUCK-AT ?AUTO_4396 ?AUTO_4401 ) ( IN-CITY ?AUTO_4401 ?AUTO_4400 ) ( IN-CITY ?AUTO_4398 ?AUTO_4400 ) ( not ( = ?AUTO_4398 ?AUTO_4401 ) ) ( not ( = ?AUTO_4392 ?AUTO_4401 ) ) ( not ( = ?AUTO_4395 ?AUTO_4401 ) ) ( not ( = ?AUTO_4393 ?AUTO_4400 ) ) ( not ( = ?AUTO_4397 ?AUTO_4401 ) ) ( OBJ-AT ?AUTO_4391 ?AUTO_4401 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4391 ?AUTO_4396 ?AUTO_4401 )
      ( DELIVER-PKG ?AUTO_4391 ?AUTO_4392 )
      ( DELIVER-PKG-VERIFY ?AUTO_4391 ?AUTO_4392 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4681 - OBJ
      ?AUTO_4682 - LOCATION
    )
    :vars
    (
      ?AUTO_4687 - LOCATION
      ?AUTO_4684 - AIRPLANE
      ?AUTO_4683 - LOCATION
      ?AUTO_4686 - CITY
      ?AUTO_4685 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4687 ) ( AIRPORT ?AUTO_4682 ) ( AIRPLANE-AT ?AUTO_4684 ?AUTO_4687 ) ( not ( = ?AUTO_4687 ?AUTO_4682 ) ) ( IN-CITY ?AUTO_4683 ?AUTO_4686 ) ( IN-CITY ?AUTO_4687 ?AUTO_4686 ) ( not ( = ?AUTO_4687 ?AUTO_4683 ) ) ( not ( = ?AUTO_4682 ?AUTO_4683 ) ) ( OBJ-AT ?AUTO_4681 ?AUTO_4683 ) ( TRUCK-AT ?AUTO_4685 ?AUTO_4687 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4685 ?AUTO_4687 ?AUTO_4683 ?AUTO_4686 )
      ( DELIVER-PKG ?AUTO_4681 ?AUTO_4682 )
      ( DELIVER-PKG-VERIFY ?AUTO_4681 ?AUTO_4682 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4692 - OBJ
      ?AUTO_4693 - LOCATION
    )
    :vars
    (
      ?AUTO_4696 - LOCATION
      ?AUTO_4697 - LOCATION
      ?AUTO_4695 - CITY
      ?AUTO_4698 - TRUCK
      ?AUTO_4694 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4696 ) ( AIRPORT ?AUTO_4693 ) ( not ( = ?AUTO_4696 ?AUTO_4693 ) ) ( IN-CITY ?AUTO_4697 ?AUTO_4695 ) ( IN-CITY ?AUTO_4696 ?AUTO_4695 ) ( not ( = ?AUTO_4696 ?AUTO_4697 ) ) ( not ( = ?AUTO_4693 ?AUTO_4697 ) ) ( OBJ-AT ?AUTO_4692 ?AUTO_4697 ) ( TRUCK-AT ?AUTO_4698 ?AUTO_4696 ) ( AIRPLANE-AT ?AUTO_4694 ?AUTO_4693 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4694 ?AUTO_4693 ?AUTO_4696 )
      ( DELIVER-PKG ?AUTO_4692 ?AUTO_4693 )
      ( DELIVER-PKG-VERIFY ?AUTO_4692 ?AUTO_4693 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4711 - OBJ
      ?AUTO_4712 - LOCATION
    )
    :vars
    (
      ?AUTO_4714 - LOCATION
      ?AUTO_4715 - AIRPLANE
      ?AUTO_4716 - LOCATION
      ?AUTO_4713 - CITY
      ?AUTO_4717 - TRUCK
      ?AUTO_4718 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4714 ) ( AIRPORT ?AUTO_4712 ) ( AIRPLANE-AT ?AUTO_4715 ?AUTO_4714 ) ( not ( = ?AUTO_4714 ?AUTO_4712 ) ) ( IN-CITY ?AUTO_4716 ?AUTO_4713 ) ( IN-CITY ?AUTO_4714 ?AUTO_4713 ) ( not ( = ?AUTO_4714 ?AUTO_4716 ) ) ( not ( = ?AUTO_4712 ?AUTO_4716 ) ) ( OBJ-AT ?AUTO_4711 ?AUTO_4716 ) ( TRUCK-AT ?AUTO_4717 ?AUTO_4718 ) ( IN-CITY ?AUTO_4718 ?AUTO_4713 ) ( not ( = ?AUTO_4714 ?AUTO_4718 ) ) ( not ( = ?AUTO_4712 ?AUTO_4718 ) ) ( not ( = ?AUTO_4716 ?AUTO_4718 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4717 ?AUTO_4718 ?AUTO_4714 ?AUTO_4713 )
      ( DELIVER-PKG ?AUTO_4711 ?AUTO_4712 )
      ( DELIVER-PKG-VERIFY ?AUTO_4711 ?AUTO_4712 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4745 - OBJ
      ?AUTO_4746 - LOCATION
    )
    :vars
    (
      ?AUTO_4752 - LOCATION
      ?AUTO_4751 - LOCATION
      ?AUTO_4749 - CITY
      ?AUTO_4747 - TRUCK
      ?AUTO_4748 - LOCATION
      ?AUTO_4753 - LOCATION
      ?AUTO_4750 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4752 ) ( AIRPORT ?AUTO_4746 ) ( not ( = ?AUTO_4752 ?AUTO_4746 ) ) ( IN-CITY ?AUTO_4751 ?AUTO_4749 ) ( IN-CITY ?AUTO_4752 ?AUTO_4749 ) ( not ( = ?AUTO_4752 ?AUTO_4751 ) ) ( not ( = ?AUTO_4746 ?AUTO_4751 ) ) ( OBJ-AT ?AUTO_4745 ?AUTO_4751 ) ( TRUCK-AT ?AUTO_4747 ?AUTO_4748 ) ( IN-CITY ?AUTO_4748 ?AUTO_4749 ) ( not ( = ?AUTO_4752 ?AUTO_4748 ) ) ( not ( = ?AUTO_4746 ?AUTO_4748 ) ) ( not ( = ?AUTO_4751 ?AUTO_4748 ) ) ( AIRPORT ?AUTO_4753 ) ( AIRPLANE-AT ?AUTO_4750 ?AUTO_4753 ) ( not ( = ?AUTO_4753 ?AUTO_4752 ) ) ( not ( = ?AUTO_4746 ?AUTO_4753 ) ) ( not ( = ?AUTO_4751 ?AUTO_4753 ) ) ( not ( = ?AUTO_4748 ?AUTO_4753 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4750 ?AUTO_4753 ?AUTO_4752 )
      ( DELIVER-PKG ?AUTO_4745 ?AUTO_4746 )
      ( DELIVER-PKG-VERIFY ?AUTO_4745 ?AUTO_4746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4857 - OBJ
      ?AUTO_4858 - LOCATION
    )
    :vars
    (
      ?AUTO_4862 - TRUCK
      ?AUTO_4864 - LOCATION
      ?AUTO_4861 - CITY
      ?AUTO_4860 - LOCATION
      ?AUTO_4866 - AIRPLANE
      ?AUTO_4859 - TRUCK
      ?AUTO_4863 - LOCATION
      ?AUTO_4865 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4862 ?AUTO_4864 ) ( IN-CITY ?AUTO_4864 ?AUTO_4861 ) ( IN-CITY ?AUTO_4858 ?AUTO_4861 ) ( not ( = ?AUTO_4858 ?AUTO_4864 ) ) ( AIRPORT ?AUTO_4860 ) ( AIRPORT ?AUTO_4864 ) ( AIRPLANE-AT ?AUTO_4866 ?AUTO_4860 ) ( not ( = ?AUTO_4860 ?AUTO_4864 ) ) ( not ( = ?AUTO_4858 ?AUTO_4860 ) ) ( not ( = ?AUTO_4862 ?AUTO_4859 ) ) ( IN-CITY ?AUTO_4863 ?AUTO_4865 ) ( IN-CITY ?AUTO_4860 ?AUTO_4865 ) ( not ( = ?AUTO_4860 ?AUTO_4863 ) ) ( not ( = ?AUTO_4858 ?AUTO_4863 ) ) ( not ( = ?AUTO_4864 ?AUTO_4863 ) ) ( not ( = ?AUTO_4861 ?AUTO_4865 ) ) ( OBJ-AT ?AUTO_4857 ?AUTO_4863 ) ( TRUCK-AT ?AUTO_4859 ?AUTO_4860 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4859 ?AUTO_4860 ?AUTO_4863 ?AUTO_4865 )
      ( DELIVER-PKG ?AUTO_4857 ?AUTO_4858 )
      ( DELIVER-PKG-VERIFY ?AUTO_4857 ?AUTO_4858 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4871 - OBJ
      ?AUTO_4872 - LOCATION
    )
    :vars
    (
      ?AUTO_4873 - TRUCK
      ?AUTO_4878 - LOCATION
      ?AUTO_4877 - CITY
      ?AUTO_4879 - LOCATION
      ?AUTO_4876 - TRUCK
      ?AUTO_4880 - LOCATION
      ?AUTO_4875 - CITY
      ?AUTO_4874 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4873 ?AUTO_4878 ) ( IN-CITY ?AUTO_4878 ?AUTO_4877 ) ( IN-CITY ?AUTO_4872 ?AUTO_4877 ) ( not ( = ?AUTO_4872 ?AUTO_4878 ) ) ( AIRPORT ?AUTO_4879 ) ( AIRPORT ?AUTO_4878 ) ( not ( = ?AUTO_4879 ?AUTO_4878 ) ) ( not ( = ?AUTO_4872 ?AUTO_4879 ) ) ( not ( = ?AUTO_4873 ?AUTO_4876 ) ) ( IN-CITY ?AUTO_4880 ?AUTO_4875 ) ( IN-CITY ?AUTO_4879 ?AUTO_4875 ) ( not ( = ?AUTO_4879 ?AUTO_4880 ) ) ( not ( = ?AUTO_4872 ?AUTO_4880 ) ) ( not ( = ?AUTO_4878 ?AUTO_4880 ) ) ( not ( = ?AUTO_4877 ?AUTO_4875 ) ) ( OBJ-AT ?AUTO_4871 ?AUTO_4880 ) ( TRUCK-AT ?AUTO_4876 ?AUTO_4879 ) ( AIRPLANE-AT ?AUTO_4874 ?AUTO_4878 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4874 ?AUTO_4878 ?AUTO_4879 )
      ( DELIVER-PKG ?AUTO_4871 ?AUTO_4872 )
      ( DELIVER-PKG-VERIFY ?AUTO_4871 ?AUTO_4872 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4893 - OBJ
      ?AUTO_4894 - LOCATION
    )
    :vars
    (
      ?AUTO_4897 - TRUCK
      ?AUTO_4898 - LOCATION
      ?AUTO_4896 - CITY
      ?AUTO_4901 - LOCATION
      ?AUTO_4902 - AIRPLANE
      ?AUTO_4900 - TRUCK
      ?AUTO_4899 - LOCATION
      ?AUTO_4895 - CITY
      ?AUTO_4903 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4897 ?AUTO_4898 ) ( IN-CITY ?AUTO_4898 ?AUTO_4896 ) ( IN-CITY ?AUTO_4894 ?AUTO_4896 ) ( not ( = ?AUTO_4894 ?AUTO_4898 ) ) ( AIRPORT ?AUTO_4901 ) ( AIRPORT ?AUTO_4898 ) ( AIRPLANE-AT ?AUTO_4902 ?AUTO_4901 ) ( not ( = ?AUTO_4901 ?AUTO_4898 ) ) ( not ( = ?AUTO_4894 ?AUTO_4901 ) ) ( not ( = ?AUTO_4897 ?AUTO_4900 ) ) ( IN-CITY ?AUTO_4899 ?AUTO_4895 ) ( IN-CITY ?AUTO_4901 ?AUTO_4895 ) ( not ( = ?AUTO_4901 ?AUTO_4899 ) ) ( not ( = ?AUTO_4894 ?AUTO_4899 ) ) ( not ( = ?AUTO_4898 ?AUTO_4899 ) ) ( not ( = ?AUTO_4896 ?AUTO_4895 ) ) ( OBJ-AT ?AUTO_4893 ?AUTO_4899 ) ( TRUCK-AT ?AUTO_4900 ?AUTO_4903 ) ( IN-CITY ?AUTO_4903 ?AUTO_4895 ) ( not ( = ?AUTO_4901 ?AUTO_4903 ) ) ( not ( = ?AUTO_4894 ?AUTO_4903 ) ) ( not ( = ?AUTO_4898 ?AUTO_4903 ) ) ( not ( = ?AUTO_4899 ?AUTO_4903 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4900 ?AUTO_4903 ?AUTO_4901 ?AUTO_4895 )
      ( DELIVER-PKG ?AUTO_4893 ?AUTO_4894 )
      ( DELIVER-PKG-VERIFY ?AUTO_4893 ?AUTO_4894 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4930 - OBJ
      ?AUTO_4931 - LOCATION
    )
    :vars
    (
      ?AUTO_4934 - TRUCK
      ?AUTO_4937 - LOCATION
      ?AUTO_4936 - CITY
      ?AUTO_4938 - LOCATION
      ?AUTO_4932 - TRUCK
      ?AUTO_4935 - LOCATION
      ?AUTO_4940 - CITY
      ?AUTO_4933 - LOCATION
      ?AUTO_4941 - LOCATION
      ?AUTO_4939 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4934 ?AUTO_4937 ) ( IN-CITY ?AUTO_4937 ?AUTO_4936 ) ( IN-CITY ?AUTO_4931 ?AUTO_4936 ) ( not ( = ?AUTO_4931 ?AUTO_4937 ) ) ( AIRPORT ?AUTO_4938 ) ( AIRPORT ?AUTO_4937 ) ( not ( = ?AUTO_4938 ?AUTO_4937 ) ) ( not ( = ?AUTO_4931 ?AUTO_4938 ) ) ( not ( = ?AUTO_4934 ?AUTO_4932 ) ) ( IN-CITY ?AUTO_4935 ?AUTO_4940 ) ( IN-CITY ?AUTO_4938 ?AUTO_4940 ) ( not ( = ?AUTO_4938 ?AUTO_4935 ) ) ( not ( = ?AUTO_4931 ?AUTO_4935 ) ) ( not ( = ?AUTO_4937 ?AUTO_4935 ) ) ( not ( = ?AUTO_4936 ?AUTO_4940 ) ) ( OBJ-AT ?AUTO_4930 ?AUTO_4935 ) ( TRUCK-AT ?AUTO_4932 ?AUTO_4933 ) ( IN-CITY ?AUTO_4933 ?AUTO_4940 ) ( not ( = ?AUTO_4938 ?AUTO_4933 ) ) ( not ( = ?AUTO_4931 ?AUTO_4933 ) ) ( not ( = ?AUTO_4937 ?AUTO_4933 ) ) ( not ( = ?AUTO_4935 ?AUTO_4933 ) ) ( AIRPORT ?AUTO_4941 ) ( AIRPLANE-AT ?AUTO_4939 ?AUTO_4941 ) ( not ( = ?AUTO_4941 ?AUTO_4938 ) ) ( not ( = ?AUTO_4931 ?AUTO_4941 ) ) ( not ( = ?AUTO_4937 ?AUTO_4941 ) ) ( not ( = ?AUTO_4935 ?AUTO_4941 ) ) ( not ( = ?AUTO_4933 ?AUTO_4941 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4939 ?AUTO_4941 ?AUTO_4938 )
      ( DELIVER-PKG ?AUTO_4930 ?AUTO_4931 )
      ( DELIVER-PKG-VERIFY ?AUTO_4930 ?AUTO_4931 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5243 - OBJ
      ?AUTO_5244 - LOCATION
    )
    :vars
    (
      ?AUTO_5247 - LOCATION
      ?AUTO_5248 - AIRPLANE
      ?AUTO_5245 - LOCATION
      ?AUTO_5249 - CITY
      ?AUTO_5246 - TRUCK
      ?AUTO_5250 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5247 ) ( AIRPORT ?AUTO_5244 ) ( not ( = ?AUTO_5247 ?AUTO_5244 ) ) ( AIRPLANE-AT ?AUTO_5248 ?AUTO_5244 ) ( IN-CITY ?AUTO_5245 ?AUTO_5249 ) ( IN-CITY ?AUTO_5247 ?AUTO_5249 ) ( not ( = ?AUTO_5247 ?AUTO_5245 ) ) ( not ( = ?AUTO_5244 ?AUTO_5245 ) ) ( OBJ-AT ?AUTO_5243 ?AUTO_5245 ) ( TRUCK-AT ?AUTO_5246 ?AUTO_5250 ) ( IN-CITY ?AUTO_5250 ?AUTO_5249 ) ( not ( = ?AUTO_5245 ?AUTO_5250 ) ) ( not ( = ?AUTO_5244 ?AUTO_5250 ) ) ( not ( = ?AUTO_5247 ?AUTO_5250 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5246 ?AUTO_5250 ?AUTO_5245 ?AUTO_5249 )
      ( DELIVER-PKG ?AUTO_5243 ?AUTO_5244 )
      ( DELIVER-PKG-VERIFY ?AUTO_5243 ?AUTO_5244 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5435 - OBJ
      ?AUTO_5436 - LOCATION
    )
    :vars
    (
      ?AUTO_5443 - LOCATION
      ?AUTO_5440 - CITY
      ?AUTO_5444 - LOCATION
      ?AUTO_5437 - AIRPLANE
      ?AUTO_5441 - TRUCK
      ?AUTO_5438 - LOCATION
      ?AUTO_5442 - TRUCK
      ?AUTO_5445 - LOCATION
      ?AUTO_5439 - CITY
      ?AUTO_5446 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5443 ?AUTO_5440 ) ( IN-CITY ?AUTO_5436 ?AUTO_5440 ) ( not ( = ?AUTO_5436 ?AUTO_5443 ) ) ( AIRPORT ?AUTO_5444 ) ( AIRPORT ?AUTO_5443 ) ( not ( = ?AUTO_5444 ?AUTO_5443 ) ) ( not ( = ?AUTO_5436 ?AUTO_5444 ) ) ( AIRPLANE-AT ?AUTO_5437 ?AUTO_5443 ) ( TRUCK-AT ?AUTO_5441 ?AUTO_5438 ) ( IN-CITY ?AUTO_5438 ?AUTO_5440 ) ( not ( = ?AUTO_5443 ?AUTO_5438 ) ) ( not ( = ?AUTO_5436 ?AUTO_5438 ) ) ( not ( = ?AUTO_5444 ?AUTO_5438 ) ) ( not ( = ?AUTO_5441 ?AUTO_5442 ) ) ( IN-CITY ?AUTO_5445 ?AUTO_5439 ) ( IN-CITY ?AUTO_5444 ?AUTO_5439 ) ( not ( = ?AUTO_5444 ?AUTO_5445 ) ) ( not ( = ?AUTO_5436 ?AUTO_5445 ) ) ( not ( = ?AUTO_5443 ?AUTO_5445 ) ) ( not ( = ?AUTO_5440 ?AUTO_5439 ) ) ( not ( = ?AUTO_5438 ?AUTO_5445 ) ) ( OBJ-AT ?AUTO_5435 ?AUTO_5445 ) ( TRUCK-AT ?AUTO_5442 ?AUTO_5446 ) ( IN-CITY ?AUTO_5446 ?AUTO_5439 ) ( not ( = ?AUTO_5445 ?AUTO_5446 ) ) ( not ( = ?AUTO_5436 ?AUTO_5446 ) ) ( not ( = ?AUTO_5443 ?AUTO_5446 ) ) ( not ( = ?AUTO_5444 ?AUTO_5446 ) ) ( not ( = ?AUTO_5438 ?AUTO_5446 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5442 ?AUTO_5446 ?AUTO_5445 ?AUTO_5439 )
      ( DELIVER-PKG ?AUTO_5435 ?AUTO_5436 )
      ( DELIVER-PKG-VERIFY ?AUTO_5435 ?AUTO_5436 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5521 - OBJ
      ?AUTO_5522 - LOCATION
    )
    :vars
    (
      ?AUTO_5529 - LOCATION
      ?AUTO_5526 - CITY
      ?AUTO_5523 - LOCATION
      ?AUTO_5527 - AIRPLANE
      ?AUTO_5525 - TRUCK
      ?AUTO_5528 - LOCATION
      ?AUTO_5524 - TRUCK
      ?AUTO_5531 - LOCATION
      ?AUTO_5530 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5529 ?AUTO_5526 ) ( IN-CITY ?AUTO_5522 ?AUTO_5526 ) ( not ( = ?AUTO_5522 ?AUTO_5529 ) ) ( AIRPORT ?AUTO_5523 ) ( AIRPORT ?AUTO_5529 ) ( not ( = ?AUTO_5523 ?AUTO_5529 ) ) ( not ( = ?AUTO_5522 ?AUTO_5523 ) ) ( AIRPLANE-AT ?AUTO_5527 ?AUTO_5529 ) ( TRUCK-AT ?AUTO_5525 ?AUTO_5528 ) ( IN-CITY ?AUTO_5528 ?AUTO_5526 ) ( not ( = ?AUTO_5529 ?AUTO_5528 ) ) ( not ( = ?AUTO_5522 ?AUTO_5528 ) ) ( not ( = ?AUTO_5523 ?AUTO_5528 ) ) ( not ( = ?AUTO_5525 ?AUTO_5524 ) ) ( IN-CITY ?AUTO_5531 ?AUTO_5530 ) ( IN-CITY ?AUTO_5523 ?AUTO_5530 ) ( not ( = ?AUTO_5523 ?AUTO_5531 ) ) ( not ( = ?AUTO_5522 ?AUTO_5531 ) ) ( not ( = ?AUTO_5529 ?AUTO_5531 ) ) ( not ( = ?AUTO_5526 ?AUTO_5530 ) ) ( not ( = ?AUTO_5528 ?AUTO_5531 ) ) ( OBJ-AT ?AUTO_5521 ?AUTO_5531 ) ( TRUCK-AT ?AUTO_5524 ?AUTO_5523 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5524 ?AUTO_5523 ?AUTO_5531 ?AUTO_5530 )
      ( DELIVER-PKG ?AUTO_5521 ?AUTO_5522 )
      ( DELIVER-PKG-VERIFY ?AUTO_5521 ?AUTO_5522 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5608 - OBJ
      ?AUTO_5609 - LOCATION
    )
    :vars
    (
      ?AUTO_5611 - LOCATION
      ?AUTO_5614 - CITY
      ?AUTO_5612 - LOCATION
      ?AUTO_5610 - AIRPLANE
      ?AUTO_5613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5611 ?AUTO_5614 ) ( IN-CITY ?AUTO_5609 ?AUTO_5614 ) ( not ( = ?AUTO_5609 ?AUTO_5611 ) ) ( AIRPORT ?AUTO_5612 ) ( AIRPORT ?AUTO_5611 ) ( not ( = ?AUTO_5612 ?AUTO_5611 ) ) ( not ( = ?AUTO_5609 ?AUTO_5612 ) ) ( OBJ-AT ?AUTO_5608 ?AUTO_5612 ) ( AIRPLANE-AT ?AUTO_5610 ?AUTO_5611 ) ( TRUCK-AT ?AUTO_5613 ?AUTO_5609 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5613 ?AUTO_5609 ?AUTO_5611 ?AUTO_5614 )
      ( DELIVER-PKG ?AUTO_5608 ?AUTO_5609 )
      ( DELIVER-PKG-VERIFY ?AUTO_5608 ?AUTO_5609 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5625 - OBJ
      ?AUTO_5626 - LOCATION
    )
    :vars
    (
      ?AUTO_5630 - LOCATION
      ?AUTO_5627 - CITY
      ?AUTO_5628 - LOCATION
      ?AUTO_5631 - AIRPLANE
      ?AUTO_5629 - TRUCK
      ?AUTO_5632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5630 ?AUTO_5627 ) ( IN-CITY ?AUTO_5626 ?AUTO_5627 ) ( not ( = ?AUTO_5626 ?AUTO_5630 ) ) ( AIRPORT ?AUTO_5628 ) ( AIRPORT ?AUTO_5630 ) ( not ( = ?AUTO_5628 ?AUTO_5630 ) ) ( not ( = ?AUTO_5626 ?AUTO_5628 ) ) ( AIRPLANE-AT ?AUTO_5631 ?AUTO_5630 ) ( TRUCK-AT ?AUTO_5629 ?AUTO_5626 ) ( TRUCK-AT ?AUTO_5632 ?AUTO_5628 ) ( IN-TRUCK ?AUTO_5625 ?AUTO_5632 ) ( not ( = ?AUTO_5629 ?AUTO_5632 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5625 ?AUTO_5632 ?AUTO_5628 )
      ( DELIVER-PKG ?AUTO_5625 ?AUTO_5626 )
      ( DELIVER-PKG-VERIFY ?AUTO_5625 ?AUTO_5626 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5635 - OBJ
      ?AUTO_5636 - LOCATION
    )
    :vars
    (
      ?AUTO_5637 - LOCATION
      ?AUTO_5641 - CITY
      ?AUTO_5638 - LOCATION
      ?AUTO_5640 - AIRPLANE
      ?AUTO_5639 - TRUCK
      ?AUTO_5642 - TRUCK
      ?AUTO_5644 - LOCATION
      ?AUTO_5643 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5637 ?AUTO_5641 ) ( IN-CITY ?AUTO_5636 ?AUTO_5641 ) ( not ( = ?AUTO_5636 ?AUTO_5637 ) ) ( AIRPORT ?AUTO_5638 ) ( AIRPORT ?AUTO_5637 ) ( not ( = ?AUTO_5638 ?AUTO_5637 ) ) ( not ( = ?AUTO_5636 ?AUTO_5638 ) ) ( AIRPLANE-AT ?AUTO_5640 ?AUTO_5637 ) ( TRUCK-AT ?AUTO_5639 ?AUTO_5636 ) ( IN-TRUCK ?AUTO_5635 ?AUTO_5642 ) ( not ( = ?AUTO_5639 ?AUTO_5642 ) ) ( TRUCK-AT ?AUTO_5642 ?AUTO_5644 ) ( IN-CITY ?AUTO_5644 ?AUTO_5643 ) ( IN-CITY ?AUTO_5638 ?AUTO_5643 ) ( not ( = ?AUTO_5638 ?AUTO_5644 ) ) ( not ( = ?AUTO_5636 ?AUTO_5644 ) ) ( not ( = ?AUTO_5637 ?AUTO_5644 ) ) ( not ( = ?AUTO_5641 ?AUTO_5643 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5642 ?AUTO_5644 ?AUTO_5638 ?AUTO_5643 )
      ( DELIVER-PKG ?AUTO_5635 ?AUTO_5636 )
      ( DELIVER-PKG-VERIFY ?AUTO_5635 ?AUTO_5636 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5645 - OBJ
      ?AUTO_5646 - LOCATION
    )
    :vars
    (
      ?AUTO_5652 - LOCATION
      ?AUTO_5649 - CITY
      ?AUTO_5650 - LOCATION
      ?AUTO_5648 - AIRPLANE
      ?AUTO_5653 - TRUCK
      ?AUTO_5651 - TRUCK
      ?AUTO_5647 - LOCATION
      ?AUTO_5654 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5652 ?AUTO_5649 ) ( IN-CITY ?AUTO_5646 ?AUTO_5649 ) ( not ( = ?AUTO_5646 ?AUTO_5652 ) ) ( AIRPORT ?AUTO_5650 ) ( AIRPORT ?AUTO_5652 ) ( not ( = ?AUTO_5650 ?AUTO_5652 ) ) ( not ( = ?AUTO_5646 ?AUTO_5650 ) ) ( AIRPLANE-AT ?AUTO_5648 ?AUTO_5652 ) ( TRUCK-AT ?AUTO_5653 ?AUTO_5646 ) ( not ( = ?AUTO_5653 ?AUTO_5651 ) ) ( TRUCK-AT ?AUTO_5651 ?AUTO_5647 ) ( IN-CITY ?AUTO_5647 ?AUTO_5654 ) ( IN-CITY ?AUTO_5650 ?AUTO_5654 ) ( not ( = ?AUTO_5650 ?AUTO_5647 ) ) ( not ( = ?AUTO_5646 ?AUTO_5647 ) ) ( not ( = ?AUTO_5652 ?AUTO_5647 ) ) ( not ( = ?AUTO_5649 ?AUTO_5654 ) ) ( OBJ-AT ?AUTO_5645 ?AUTO_5647 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5645 ?AUTO_5651 ?AUTO_5647 )
      ( DELIVER-PKG ?AUTO_5645 ?AUTO_5646 )
      ( DELIVER-PKG-VERIFY ?AUTO_5645 ?AUTO_5646 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5655 - OBJ
      ?AUTO_5656 - LOCATION
    )
    :vars
    (
      ?AUTO_5663 - LOCATION
      ?AUTO_5659 - CITY
      ?AUTO_5660 - LOCATION
      ?AUTO_5657 - AIRPLANE
      ?AUTO_5662 - TRUCK
      ?AUTO_5658 - TRUCK
      ?AUTO_5664 - LOCATION
      ?AUTO_5661 - CITY
      ?AUTO_5665 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5663 ?AUTO_5659 ) ( IN-CITY ?AUTO_5656 ?AUTO_5659 ) ( not ( = ?AUTO_5656 ?AUTO_5663 ) ) ( AIRPORT ?AUTO_5660 ) ( AIRPORT ?AUTO_5663 ) ( not ( = ?AUTO_5660 ?AUTO_5663 ) ) ( not ( = ?AUTO_5656 ?AUTO_5660 ) ) ( AIRPLANE-AT ?AUTO_5657 ?AUTO_5663 ) ( TRUCK-AT ?AUTO_5662 ?AUTO_5656 ) ( not ( = ?AUTO_5662 ?AUTO_5658 ) ) ( IN-CITY ?AUTO_5664 ?AUTO_5661 ) ( IN-CITY ?AUTO_5660 ?AUTO_5661 ) ( not ( = ?AUTO_5660 ?AUTO_5664 ) ) ( not ( = ?AUTO_5656 ?AUTO_5664 ) ) ( not ( = ?AUTO_5663 ?AUTO_5664 ) ) ( not ( = ?AUTO_5659 ?AUTO_5661 ) ) ( OBJ-AT ?AUTO_5655 ?AUTO_5664 ) ( TRUCK-AT ?AUTO_5658 ?AUTO_5665 ) ( IN-CITY ?AUTO_5665 ?AUTO_5661 ) ( not ( = ?AUTO_5664 ?AUTO_5665 ) ) ( not ( = ?AUTO_5656 ?AUTO_5665 ) ) ( not ( = ?AUTO_5663 ?AUTO_5665 ) ) ( not ( = ?AUTO_5660 ?AUTO_5665 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5658 ?AUTO_5665 ?AUTO_5664 ?AUTO_5661 )
      ( DELIVER-PKG ?AUTO_5655 ?AUTO_5656 )
      ( DELIVER-PKG-VERIFY ?AUTO_5655 ?AUTO_5656 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6135 - OBJ
      ?AUTO_6136 - LOCATION
    )
    :vars
    (
      ?AUTO_6137 - LOCATION
      ?AUTO_6138 - LOCATION
      ?AUTO_6139 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6137 ) ( AIRPORT ?AUTO_6136 ) ( not ( = ?AUTO_6137 ?AUTO_6136 ) ) ( OBJ-AT ?AUTO_6135 ?AUTO_6137 ) ( AIRPORT ?AUTO_6138 ) ( not ( = ?AUTO_6138 ?AUTO_6137 ) ) ( not ( = ?AUTO_6136 ?AUTO_6138 ) ) ( AIRPLANE-AT ?AUTO_6139 ?AUTO_6136 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6139 ?AUTO_6136 ?AUTO_6138 )
      ( DELIVER-PKG ?AUTO_6135 ?AUTO_6136 )
      ( DELIVER-PKG-VERIFY ?AUTO_6135 ?AUTO_6136 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6272 - OBJ
      ?AUTO_6273 - LOCATION
    )
    :vars
    (
      ?AUTO_6280 - LOCATION
      ?AUTO_6275 - CITY
      ?AUTO_6279 - LOCATION
      ?AUTO_6277 - LOCATION
      ?AUTO_6276 - AIRPLANE
      ?AUTO_6274 - TRUCK
      ?AUTO_6278 - LOCATION
      ?AUTO_6281 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6280 ?AUTO_6275 ) ( IN-CITY ?AUTO_6273 ?AUTO_6275 ) ( not ( = ?AUTO_6273 ?AUTO_6280 ) ) ( AIRPORT ?AUTO_6279 ) ( AIRPORT ?AUTO_6280 ) ( not ( = ?AUTO_6279 ?AUTO_6280 ) ) ( not ( = ?AUTO_6273 ?AUTO_6279 ) ) ( AIRPORT ?AUTO_6277 ) ( AIRPLANE-AT ?AUTO_6276 ?AUTO_6277 ) ( not ( = ?AUTO_6277 ?AUTO_6279 ) ) ( not ( = ?AUTO_6273 ?AUTO_6277 ) ) ( not ( = ?AUTO_6280 ?AUTO_6277 ) ) ( TRUCK-AT ?AUTO_6274 ?AUTO_6278 ) ( IN-CITY ?AUTO_6278 ?AUTO_6275 ) ( not ( = ?AUTO_6280 ?AUTO_6278 ) ) ( not ( = ?AUTO_6273 ?AUTO_6278 ) ) ( not ( = ?AUTO_6279 ?AUTO_6278 ) ) ( not ( = ?AUTO_6277 ?AUTO_6278 ) ) ( TRUCK-AT ?AUTO_6281 ?AUTO_6279 ) ( IN-TRUCK ?AUTO_6272 ?AUTO_6281 ) ( not ( = ?AUTO_6274 ?AUTO_6281 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_6272 ?AUTO_6281 ?AUTO_6279 )
      ( DELIVER-PKG ?AUTO_6272 ?AUTO_6273 )
      ( DELIVER-PKG-VERIFY ?AUTO_6272 ?AUTO_6273 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6290 - OBJ
      ?AUTO_6291 - LOCATION
    )
    :vars
    (
      ?AUTO_6292 - LOCATION
      ?AUTO_6297 - CITY
      ?AUTO_6298 - LOCATION
      ?AUTO_6295 - LOCATION
      ?AUTO_6294 - AIRPLANE
      ?AUTO_6299 - TRUCK
      ?AUTO_6296 - LOCATION
      ?AUTO_6293 - TRUCK
      ?AUTO_6301 - LOCATION
      ?AUTO_6300 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6292 ?AUTO_6297 ) ( IN-CITY ?AUTO_6291 ?AUTO_6297 ) ( not ( = ?AUTO_6291 ?AUTO_6292 ) ) ( AIRPORT ?AUTO_6298 ) ( AIRPORT ?AUTO_6292 ) ( not ( = ?AUTO_6298 ?AUTO_6292 ) ) ( not ( = ?AUTO_6291 ?AUTO_6298 ) ) ( AIRPORT ?AUTO_6295 ) ( AIRPLANE-AT ?AUTO_6294 ?AUTO_6295 ) ( not ( = ?AUTO_6295 ?AUTO_6298 ) ) ( not ( = ?AUTO_6291 ?AUTO_6295 ) ) ( not ( = ?AUTO_6292 ?AUTO_6295 ) ) ( TRUCK-AT ?AUTO_6299 ?AUTO_6296 ) ( IN-CITY ?AUTO_6296 ?AUTO_6297 ) ( not ( = ?AUTO_6292 ?AUTO_6296 ) ) ( not ( = ?AUTO_6291 ?AUTO_6296 ) ) ( not ( = ?AUTO_6298 ?AUTO_6296 ) ) ( not ( = ?AUTO_6295 ?AUTO_6296 ) ) ( IN-TRUCK ?AUTO_6290 ?AUTO_6293 ) ( not ( = ?AUTO_6299 ?AUTO_6293 ) ) ( TRUCK-AT ?AUTO_6293 ?AUTO_6301 ) ( IN-CITY ?AUTO_6301 ?AUTO_6300 ) ( IN-CITY ?AUTO_6298 ?AUTO_6300 ) ( not ( = ?AUTO_6298 ?AUTO_6301 ) ) ( not ( = ?AUTO_6291 ?AUTO_6301 ) ) ( not ( = ?AUTO_6292 ?AUTO_6301 ) ) ( not ( = ?AUTO_6297 ?AUTO_6300 ) ) ( not ( = ?AUTO_6295 ?AUTO_6301 ) ) ( not ( = ?AUTO_6296 ?AUTO_6301 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6293 ?AUTO_6301 ?AUTO_6298 ?AUTO_6300 )
      ( DELIVER-PKG ?AUTO_6290 ?AUTO_6291 )
      ( DELIVER-PKG-VERIFY ?AUTO_6290 ?AUTO_6291 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6302 - OBJ
      ?AUTO_6303 - LOCATION
    )
    :vars
    (
      ?AUTO_6313 - LOCATION
      ?AUTO_6308 - CITY
      ?AUTO_6306 - LOCATION
      ?AUTO_6311 - LOCATION
      ?AUTO_6305 - AIRPLANE
      ?AUTO_6307 - TRUCK
      ?AUTO_6304 - LOCATION
      ?AUTO_6312 - TRUCK
      ?AUTO_6310 - LOCATION
      ?AUTO_6309 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6313 ?AUTO_6308 ) ( IN-CITY ?AUTO_6303 ?AUTO_6308 ) ( not ( = ?AUTO_6303 ?AUTO_6313 ) ) ( AIRPORT ?AUTO_6306 ) ( AIRPORT ?AUTO_6313 ) ( not ( = ?AUTO_6306 ?AUTO_6313 ) ) ( not ( = ?AUTO_6303 ?AUTO_6306 ) ) ( AIRPORT ?AUTO_6311 ) ( AIRPLANE-AT ?AUTO_6305 ?AUTO_6311 ) ( not ( = ?AUTO_6311 ?AUTO_6306 ) ) ( not ( = ?AUTO_6303 ?AUTO_6311 ) ) ( not ( = ?AUTO_6313 ?AUTO_6311 ) ) ( TRUCK-AT ?AUTO_6307 ?AUTO_6304 ) ( IN-CITY ?AUTO_6304 ?AUTO_6308 ) ( not ( = ?AUTO_6313 ?AUTO_6304 ) ) ( not ( = ?AUTO_6303 ?AUTO_6304 ) ) ( not ( = ?AUTO_6306 ?AUTO_6304 ) ) ( not ( = ?AUTO_6311 ?AUTO_6304 ) ) ( not ( = ?AUTO_6307 ?AUTO_6312 ) ) ( TRUCK-AT ?AUTO_6312 ?AUTO_6310 ) ( IN-CITY ?AUTO_6310 ?AUTO_6309 ) ( IN-CITY ?AUTO_6306 ?AUTO_6309 ) ( not ( = ?AUTO_6306 ?AUTO_6310 ) ) ( not ( = ?AUTO_6303 ?AUTO_6310 ) ) ( not ( = ?AUTO_6313 ?AUTO_6310 ) ) ( not ( = ?AUTO_6308 ?AUTO_6309 ) ) ( not ( = ?AUTO_6311 ?AUTO_6310 ) ) ( not ( = ?AUTO_6304 ?AUTO_6310 ) ) ( OBJ-AT ?AUTO_6302 ?AUTO_6310 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_6302 ?AUTO_6312 ?AUTO_6310 )
      ( DELIVER-PKG ?AUTO_6302 ?AUTO_6303 )
      ( DELIVER-PKG-VERIFY ?AUTO_6302 ?AUTO_6303 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6397 - OBJ
      ?AUTO_6398 - LOCATION
    )
    :vars
    (
      ?AUTO_6401 - TRUCK
      ?AUTO_6399 - LOCATION
      ?AUTO_6402 - CITY
      ?AUTO_6403 - LOCATION
      ?AUTO_6404 - LOCATION
      ?AUTO_6400 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6401 ?AUTO_6399 ) ( IN-CITY ?AUTO_6399 ?AUTO_6402 ) ( IN-CITY ?AUTO_6398 ?AUTO_6402 ) ( not ( = ?AUTO_6398 ?AUTO_6399 ) ) ( AIRPORT ?AUTO_6403 ) ( AIRPORT ?AUTO_6399 ) ( not ( = ?AUTO_6403 ?AUTO_6399 ) ) ( not ( = ?AUTO_6398 ?AUTO_6403 ) ) ( OBJ-AT ?AUTO_6397 ?AUTO_6403 ) ( AIRPORT ?AUTO_6404 ) ( not ( = ?AUTO_6404 ?AUTO_6403 ) ) ( not ( = ?AUTO_6398 ?AUTO_6404 ) ) ( not ( = ?AUTO_6399 ?AUTO_6404 ) ) ( AIRPLANE-AT ?AUTO_6400 ?AUTO_6399 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6400 ?AUTO_6399 ?AUTO_6404 )
      ( DELIVER-PKG ?AUTO_6397 ?AUTO_6398 )
      ( DELIVER-PKG-VERIFY ?AUTO_6397 ?AUTO_6398 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6805 - OBJ
      ?AUTO_6806 - LOCATION
    )
    :vars
    (
      ?AUTO_6810 - LOCATION
      ?AUTO_6812 - CITY
      ?AUTO_6807 - LOCATION
      ?AUTO_6813 - LOCATION
      ?AUTO_6809 - AIRPLANE
      ?AUTO_6815 - TRUCK
      ?AUTO_6811 - LOCATION
      ?AUTO_6808 - TRUCK
      ?AUTO_6816 - LOCATION
      ?AUTO_6814 - CITY
      ?AUTO_6817 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6810 ?AUTO_6812 ) ( IN-CITY ?AUTO_6806 ?AUTO_6812 ) ( not ( = ?AUTO_6806 ?AUTO_6810 ) ) ( AIRPORT ?AUTO_6807 ) ( AIRPORT ?AUTO_6810 ) ( not ( = ?AUTO_6807 ?AUTO_6810 ) ) ( not ( = ?AUTO_6806 ?AUTO_6807 ) ) ( AIRPORT ?AUTO_6813 ) ( AIRPLANE-AT ?AUTO_6809 ?AUTO_6813 ) ( not ( = ?AUTO_6813 ?AUTO_6807 ) ) ( not ( = ?AUTO_6806 ?AUTO_6813 ) ) ( not ( = ?AUTO_6810 ?AUTO_6813 ) ) ( TRUCK-AT ?AUTO_6815 ?AUTO_6811 ) ( IN-CITY ?AUTO_6811 ?AUTO_6812 ) ( not ( = ?AUTO_6810 ?AUTO_6811 ) ) ( not ( = ?AUTO_6806 ?AUTO_6811 ) ) ( not ( = ?AUTO_6807 ?AUTO_6811 ) ) ( not ( = ?AUTO_6813 ?AUTO_6811 ) ) ( not ( = ?AUTO_6815 ?AUTO_6808 ) ) ( IN-CITY ?AUTO_6816 ?AUTO_6814 ) ( IN-CITY ?AUTO_6807 ?AUTO_6814 ) ( not ( = ?AUTO_6807 ?AUTO_6816 ) ) ( not ( = ?AUTO_6806 ?AUTO_6816 ) ) ( not ( = ?AUTO_6810 ?AUTO_6816 ) ) ( not ( = ?AUTO_6812 ?AUTO_6814 ) ) ( not ( = ?AUTO_6813 ?AUTO_6816 ) ) ( not ( = ?AUTO_6811 ?AUTO_6816 ) ) ( OBJ-AT ?AUTO_6805 ?AUTO_6816 ) ( TRUCK-AT ?AUTO_6808 ?AUTO_6817 ) ( IN-CITY ?AUTO_6817 ?AUTO_6814 ) ( not ( = ?AUTO_6816 ?AUTO_6817 ) ) ( not ( = ?AUTO_6806 ?AUTO_6817 ) ) ( not ( = ?AUTO_6810 ?AUTO_6817 ) ) ( not ( = ?AUTO_6807 ?AUTO_6817 ) ) ( not ( = ?AUTO_6813 ?AUTO_6817 ) ) ( not ( = ?AUTO_6811 ?AUTO_6817 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6808 ?AUTO_6817 ?AUTO_6816 ?AUTO_6814 )
      ( DELIVER-PKG ?AUTO_6805 ?AUTO_6806 )
      ( DELIVER-PKG-VERIFY ?AUTO_6805 ?AUTO_6806 ) )
  )

)

