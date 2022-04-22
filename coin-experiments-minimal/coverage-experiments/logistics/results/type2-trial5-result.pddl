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
      ?AUTO_4 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2 ?AUTO_4 ) ( AIRPLANE-AT ?AUTO_4 ?AUTO_3 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2 ?AUTO_4 ?AUTO_3 )
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
      ?AUTO_7 - AIRPLANE
      ?AUTO_8 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_5 ?AUTO_7 ) ( AIRPORT ?AUTO_8 ) ( AIRPORT ?AUTO_6 ) ( AIRPLANE-AT ?AUTO_7 ?AUTO_8 ) ( not ( = ?AUTO_8 ?AUTO_6 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7 ?AUTO_8 ?AUTO_6 )
      ( DELIVER-PKG ?AUTO_5 ?AUTO_6 )
      ( DELIVER-PKG-VERIFY ?AUTO_5 ?AUTO_6 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9 - OBJ
      ?AUTO_10 - LOCATION
    )
    :vars
    (
      ?AUTO_11 - LOCATION
      ?AUTO_12 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_11 ) ( AIRPORT ?AUTO_10 ) ( AIRPLANE-AT ?AUTO_12 ?AUTO_11 ) ( not ( = ?AUTO_11 ?AUTO_10 ) ) ( OBJ-AT ?AUTO_9 ?AUTO_11 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_9 ?AUTO_12 ?AUTO_11 )
      ( DELIVER-PKG ?AUTO_9 ?AUTO_10 )
      ( DELIVER-PKG-VERIFY ?AUTO_9 ?AUTO_10 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_13 - OBJ
      ?AUTO_14 - LOCATION
    )
    :vars
    (
      ?AUTO_15 - LOCATION
      ?AUTO_17 - LOCATION
      ?AUTO_16 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_15 ) ( AIRPORT ?AUTO_14 ) ( not ( = ?AUTO_15 ?AUTO_14 ) ) ( OBJ-AT ?AUTO_13 ?AUTO_15 ) ( AIRPORT ?AUTO_17 ) ( AIRPLANE-AT ?AUTO_16 ?AUTO_17 ) ( not ( = ?AUTO_17 ?AUTO_15 ) ) ( not ( = ?AUTO_14 ?AUTO_17 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_16 ?AUTO_17 ?AUTO_15 )
      ( DELIVER-PKG ?AUTO_13 ?AUTO_14 )
      ( DELIVER-PKG-VERIFY ?AUTO_13 ?AUTO_14 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_20 - OBJ
      ?AUTO_21 - LOCATION
    )
    :vars
    (
      ?AUTO_22 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_22 ?AUTO_21 ) ( IN-TRUCK ?AUTO_20 ?AUTO_22 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_20 ?AUTO_22 ?AUTO_21 )
      ( DELIVER-PKG-VERIFY ?AUTO_20 ?AUTO_21 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_23 - OBJ
      ?AUTO_24 - LOCATION
    )
    :vars
    (
      ?AUTO_25 - TRUCK
      ?AUTO_27 - LOCATION
      ?AUTO_26 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_23 ?AUTO_25 ) ( TRUCK-AT ?AUTO_25 ?AUTO_27 ) ( IN-CITY ?AUTO_27 ?AUTO_26 ) ( IN-CITY ?AUTO_24 ?AUTO_26 ) ( not ( = ?AUTO_24 ?AUTO_27 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_25 ?AUTO_27 ?AUTO_24 ?AUTO_26 )
      ( DELIVER-PKG ?AUTO_23 ?AUTO_24 )
      ( DELIVER-PKG-VERIFY ?AUTO_23 ?AUTO_24 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_28 - OBJ
      ?AUTO_29 - LOCATION
    )
    :vars
    (
      ?AUTO_30 - TRUCK
      ?AUTO_32 - LOCATION
      ?AUTO_31 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_30 ?AUTO_32 ) ( IN-CITY ?AUTO_32 ?AUTO_31 ) ( IN-CITY ?AUTO_29 ?AUTO_31 ) ( not ( = ?AUTO_29 ?AUTO_32 ) ) ( OBJ-AT ?AUTO_28 ?AUTO_32 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_28 ?AUTO_30 ?AUTO_32 )
      ( DELIVER-PKG ?AUTO_28 ?AUTO_29 )
      ( DELIVER-PKG-VERIFY ?AUTO_28 ?AUTO_29 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_33 - OBJ
      ?AUTO_34 - LOCATION
    )
    :vars
    (
      ?AUTO_37 - LOCATION
      ?AUTO_35 - CITY
      ?AUTO_36 - TRUCK
      ?AUTO_38 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_37 ?AUTO_35 ) ( IN-CITY ?AUTO_34 ?AUTO_35 ) ( not ( = ?AUTO_34 ?AUTO_37 ) ) ( OBJ-AT ?AUTO_33 ?AUTO_37 ) ( TRUCK-AT ?AUTO_36 ?AUTO_38 ) ( IN-CITY ?AUTO_38 ?AUTO_35 ) ( not ( = ?AUTO_37 ?AUTO_38 ) ) ( not ( = ?AUTO_34 ?AUTO_38 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_36 ?AUTO_38 ?AUTO_37 ?AUTO_35 )
      ( DELIVER-PKG ?AUTO_33 ?AUTO_34 )
      ( DELIVER-PKG-VERIFY ?AUTO_33 ?AUTO_34 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_60 - OBJ
      ?AUTO_61 - LOCATION
    )
    :vars
    (
      ?AUTO_63 - LOCATION
      ?AUTO_62 - AIRPLANE
      ?AUTO_64 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_63 ) ( AIRPORT ?AUTO_61 ) ( AIRPLANE-AT ?AUTO_62 ?AUTO_63 ) ( not ( = ?AUTO_63 ?AUTO_61 ) ) ( TRUCK-AT ?AUTO_64 ?AUTO_63 ) ( IN-TRUCK ?AUTO_60 ?AUTO_64 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_60 ?AUTO_64 ?AUTO_63 )
      ( DELIVER-PKG ?AUTO_60 ?AUTO_61 )
      ( DELIVER-PKG-VERIFY ?AUTO_60 ?AUTO_61 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_65 - OBJ
      ?AUTO_66 - LOCATION
    )
    :vars
    (
      ?AUTO_68 - LOCATION
      ?AUTO_69 - AIRPLANE
      ?AUTO_67 - TRUCK
      ?AUTO_71 - LOCATION
      ?AUTO_70 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_68 ) ( AIRPORT ?AUTO_66 ) ( AIRPLANE-AT ?AUTO_69 ?AUTO_68 ) ( not ( = ?AUTO_68 ?AUTO_66 ) ) ( IN-TRUCK ?AUTO_65 ?AUTO_67 ) ( TRUCK-AT ?AUTO_67 ?AUTO_71 ) ( IN-CITY ?AUTO_71 ?AUTO_70 ) ( IN-CITY ?AUTO_68 ?AUTO_70 ) ( not ( = ?AUTO_68 ?AUTO_71 ) ) ( not ( = ?AUTO_66 ?AUTO_71 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_67 ?AUTO_71 ?AUTO_68 ?AUTO_70 )
      ( DELIVER-PKG ?AUTO_65 ?AUTO_66 )
      ( DELIVER-PKG-VERIFY ?AUTO_65 ?AUTO_66 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_72 - OBJ
      ?AUTO_73 - LOCATION
    )
    :vars
    (
      ?AUTO_74 - LOCATION
      ?AUTO_77 - AIRPLANE
      ?AUTO_76 - TRUCK
      ?AUTO_75 - LOCATION
      ?AUTO_78 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_74 ) ( AIRPORT ?AUTO_73 ) ( AIRPLANE-AT ?AUTO_77 ?AUTO_74 ) ( not ( = ?AUTO_74 ?AUTO_73 ) ) ( TRUCK-AT ?AUTO_76 ?AUTO_75 ) ( IN-CITY ?AUTO_75 ?AUTO_78 ) ( IN-CITY ?AUTO_74 ?AUTO_78 ) ( not ( = ?AUTO_74 ?AUTO_75 ) ) ( not ( = ?AUTO_73 ?AUTO_75 ) ) ( OBJ-AT ?AUTO_72 ?AUTO_75 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_72 ?AUTO_76 ?AUTO_75 )
      ( DELIVER-PKG ?AUTO_72 ?AUTO_73 )
      ( DELIVER-PKG-VERIFY ?AUTO_72 ?AUTO_73 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_79 - OBJ
      ?AUTO_80 - LOCATION
    )
    :vars
    (
      ?AUTO_85 - LOCATION
      ?AUTO_84 - AIRPLANE
      ?AUTO_81 - LOCATION
      ?AUTO_82 - CITY
      ?AUTO_83 - TRUCK
      ?AUTO_86 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_85 ) ( AIRPORT ?AUTO_80 ) ( AIRPLANE-AT ?AUTO_84 ?AUTO_85 ) ( not ( = ?AUTO_85 ?AUTO_80 ) ) ( IN-CITY ?AUTO_81 ?AUTO_82 ) ( IN-CITY ?AUTO_85 ?AUTO_82 ) ( not ( = ?AUTO_85 ?AUTO_81 ) ) ( not ( = ?AUTO_80 ?AUTO_81 ) ) ( OBJ-AT ?AUTO_79 ?AUTO_81 ) ( TRUCK-AT ?AUTO_83 ?AUTO_86 ) ( IN-CITY ?AUTO_86 ?AUTO_82 ) ( not ( = ?AUTO_81 ?AUTO_86 ) ) ( not ( = ?AUTO_80 ?AUTO_86 ) ) ( not ( = ?AUTO_85 ?AUTO_86 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_83 ?AUTO_86 ?AUTO_81 ?AUTO_82 )
      ( DELIVER-PKG ?AUTO_79 ?AUTO_80 )
      ( DELIVER-PKG-VERIFY ?AUTO_79 ?AUTO_80 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_89 - OBJ
      ?AUTO_90 - LOCATION
    )
    :vars
    (
      ?AUTO_95 - LOCATION
      ?AUTO_96 - LOCATION
      ?AUTO_92 - CITY
      ?AUTO_91 - TRUCK
      ?AUTO_93 - LOCATION
      ?AUTO_97 - LOCATION
      ?AUTO_94 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_95 ) ( AIRPORT ?AUTO_90 ) ( not ( = ?AUTO_95 ?AUTO_90 ) ) ( IN-CITY ?AUTO_96 ?AUTO_92 ) ( IN-CITY ?AUTO_95 ?AUTO_92 ) ( not ( = ?AUTO_95 ?AUTO_96 ) ) ( not ( = ?AUTO_90 ?AUTO_96 ) ) ( OBJ-AT ?AUTO_89 ?AUTO_96 ) ( TRUCK-AT ?AUTO_91 ?AUTO_93 ) ( IN-CITY ?AUTO_93 ?AUTO_92 ) ( not ( = ?AUTO_96 ?AUTO_93 ) ) ( not ( = ?AUTO_90 ?AUTO_93 ) ) ( not ( = ?AUTO_95 ?AUTO_93 ) ) ( AIRPORT ?AUTO_97 ) ( AIRPLANE-AT ?AUTO_94 ?AUTO_97 ) ( not ( = ?AUTO_97 ?AUTO_95 ) ) ( not ( = ?AUTO_90 ?AUTO_97 ) ) ( not ( = ?AUTO_96 ?AUTO_97 ) ) ( not ( = ?AUTO_93 ?AUTO_97 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_94 ?AUTO_97 ?AUTO_95 )
      ( DELIVER-PKG ?AUTO_89 ?AUTO_90 )
      ( DELIVER-PKG-VERIFY ?AUTO_89 ?AUTO_90 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_141 - OBJ
      ?AUTO_142 - LOCATION
    )
    :vars
    (
      ?AUTO_144 - LOCATION
      ?AUTO_145 - CITY
      ?AUTO_143 - TRUCK
      ?AUTO_146 - LOCATION
      ?AUTO_147 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_144 ?AUTO_145 ) ( IN-CITY ?AUTO_142 ?AUTO_145 ) ( not ( = ?AUTO_142 ?AUTO_144 ) ) ( TRUCK-AT ?AUTO_143 ?AUTO_146 ) ( IN-CITY ?AUTO_146 ?AUTO_145 ) ( not ( = ?AUTO_144 ?AUTO_146 ) ) ( not ( = ?AUTO_142 ?AUTO_146 ) ) ( IN-AIRPLANE ?AUTO_141 ?AUTO_147 ) ( AIRPLANE-AT ?AUTO_147 ?AUTO_144 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_141 ?AUTO_147 ?AUTO_144 )
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
      ?AUTO_153 - CITY
      ?AUTO_151 - TRUCK
      ?AUTO_154 - LOCATION
      ?AUTO_152 - AIRPLANE
      ?AUTO_155 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_150 ?AUTO_153 ) ( IN-CITY ?AUTO_149 ?AUTO_153 ) ( not ( = ?AUTO_149 ?AUTO_150 ) ) ( TRUCK-AT ?AUTO_151 ?AUTO_154 ) ( IN-CITY ?AUTO_154 ?AUTO_153 ) ( not ( = ?AUTO_150 ?AUTO_154 ) ) ( not ( = ?AUTO_149 ?AUTO_154 ) ) ( IN-AIRPLANE ?AUTO_148 ?AUTO_152 ) ( AIRPORT ?AUTO_155 ) ( AIRPORT ?AUTO_150 ) ( AIRPLANE-AT ?AUTO_152 ?AUTO_155 ) ( not ( = ?AUTO_155 ?AUTO_150 ) ) ( not ( = ?AUTO_149 ?AUTO_155 ) ) ( not ( = ?AUTO_154 ?AUTO_155 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_152 ?AUTO_155 ?AUTO_150 )
      ( DELIVER-PKG ?AUTO_148 ?AUTO_149 )
      ( DELIVER-PKG-VERIFY ?AUTO_148 ?AUTO_149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_156 - OBJ
      ?AUTO_157 - LOCATION
    )
    :vars
    (
      ?AUTO_163 - LOCATION
      ?AUTO_161 - CITY
      ?AUTO_159 - TRUCK
      ?AUTO_162 - LOCATION
      ?AUTO_160 - LOCATION
      ?AUTO_158 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_163 ?AUTO_161 ) ( IN-CITY ?AUTO_157 ?AUTO_161 ) ( not ( = ?AUTO_157 ?AUTO_163 ) ) ( TRUCK-AT ?AUTO_159 ?AUTO_162 ) ( IN-CITY ?AUTO_162 ?AUTO_161 ) ( not ( = ?AUTO_163 ?AUTO_162 ) ) ( not ( = ?AUTO_157 ?AUTO_162 ) ) ( AIRPORT ?AUTO_160 ) ( AIRPORT ?AUTO_163 ) ( AIRPLANE-AT ?AUTO_158 ?AUTO_160 ) ( not ( = ?AUTO_160 ?AUTO_163 ) ) ( not ( = ?AUTO_157 ?AUTO_160 ) ) ( not ( = ?AUTO_162 ?AUTO_160 ) ) ( OBJ-AT ?AUTO_156 ?AUTO_160 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_156 ?AUTO_158 ?AUTO_160 )
      ( DELIVER-PKG ?AUTO_156 ?AUTO_157 )
      ( DELIVER-PKG-VERIFY ?AUTO_156 ?AUTO_157 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_164 - OBJ
      ?AUTO_165 - LOCATION
    )
    :vars
    (
      ?AUTO_171 - LOCATION
      ?AUTO_170 - CITY
      ?AUTO_169 - TRUCK
      ?AUTO_167 - LOCATION
      ?AUTO_168 - LOCATION
      ?AUTO_172 - LOCATION
      ?AUTO_166 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_171 ?AUTO_170 ) ( IN-CITY ?AUTO_165 ?AUTO_170 ) ( not ( = ?AUTO_165 ?AUTO_171 ) ) ( TRUCK-AT ?AUTO_169 ?AUTO_167 ) ( IN-CITY ?AUTO_167 ?AUTO_170 ) ( not ( = ?AUTO_171 ?AUTO_167 ) ) ( not ( = ?AUTO_165 ?AUTO_167 ) ) ( AIRPORT ?AUTO_168 ) ( AIRPORT ?AUTO_171 ) ( not ( = ?AUTO_168 ?AUTO_171 ) ) ( not ( = ?AUTO_165 ?AUTO_168 ) ) ( not ( = ?AUTO_167 ?AUTO_168 ) ) ( OBJ-AT ?AUTO_164 ?AUTO_168 ) ( AIRPORT ?AUTO_172 ) ( AIRPLANE-AT ?AUTO_166 ?AUTO_172 ) ( not ( = ?AUTO_172 ?AUTO_168 ) ) ( not ( = ?AUTO_165 ?AUTO_172 ) ) ( not ( = ?AUTO_171 ?AUTO_172 ) ) ( not ( = ?AUTO_167 ?AUTO_172 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_166 ?AUTO_172 ?AUTO_168 )
      ( DELIVER-PKG ?AUTO_164 ?AUTO_165 )
      ( DELIVER-PKG-VERIFY ?AUTO_164 ?AUTO_165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_195 - OBJ
      ?AUTO_196 - LOCATION
    )
    :vars
    (
      ?AUTO_199 - TRUCK
      ?AUTO_198 - LOCATION
      ?AUTO_197 - CITY
      ?AUTO_200 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_199 ?AUTO_198 ) ( IN-CITY ?AUTO_198 ?AUTO_197 ) ( IN-CITY ?AUTO_196 ?AUTO_197 ) ( not ( = ?AUTO_196 ?AUTO_198 ) ) ( IN-AIRPLANE ?AUTO_195 ?AUTO_200 ) ( AIRPLANE-AT ?AUTO_200 ?AUTO_198 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_195 ?AUTO_200 ?AUTO_198 )
      ( DELIVER-PKG ?AUTO_195 ?AUTO_196 )
      ( DELIVER-PKG-VERIFY ?AUTO_195 ?AUTO_196 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_201 - OBJ
      ?AUTO_202 - LOCATION
    )
    :vars
    (
      ?AUTO_205 - TRUCK
      ?AUTO_203 - LOCATION
      ?AUTO_204 - CITY
      ?AUTO_206 - AIRPLANE
      ?AUTO_207 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_205 ?AUTO_203 ) ( IN-CITY ?AUTO_203 ?AUTO_204 ) ( IN-CITY ?AUTO_202 ?AUTO_204 ) ( not ( = ?AUTO_202 ?AUTO_203 ) ) ( IN-AIRPLANE ?AUTO_201 ?AUTO_206 ) ( AIRPORT ?AUTO_207 ) ( AIRPORT ?AUTO_203 ) ( AIRPLANE-AT ?AUTO_206 ?AUTO_207 ) ( not ( = ?AUTO_207 ?AUTO_203 ) ) ( not ( = ?AUTO_202 ?AUTO_207 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_206 ?AUTO_207 ?AUTO_203 )
      ( DELIVER-PKG ?AUTO_201 ?AUTO_202 )
      ( DELIVER-PKG-VERIFY ?AUTO_201 ?AUTO_202 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_208 - OBJ
      ?AUTO_209 - LOCATION
    )
    :vars
    (
      ?AUTO_213 - TRUCK
      ?AUTO_210 - LOCATION
      ?AUTO_212 - CITY
      ?AUTO_214 - LOCATION
      ?AUTO_211 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_213 ?AUTO_210 ) ( IN-CITY ?AUTO_210 ?AUTO_212 ) ( IN-CITY ?AUTO_209 ?AUTO_212 ) ( not ( = ?AUTO_209 ?AUTO_210 ) ) ( AIRPORT ?AUTO_214 ) ( AIRPORT ?AUTO_210 ) ( AIRPLANE-AT ?AUTO_211 ?AUTO_214 ) ( not ( = ?AUTO_214 ?AUTO_210 ) ) ( not ( = ?AUTO_209 ?AUTO_214 ) ) ( OBJ-AT ?AUTO_208 ?AUTO_214 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_208 ?AUTO_211 ?AUTO_214 )
      ( DELIVER-PKG ?AUTO_208 ?AUTO_209 )
      ( DELIVER-PKG-VERIFY ?AUTO_208 ?AUTO_209 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_215 - OBJ
      ?AUTO_216 - LOCATION
    )
    :vars
    (
      ?AUTO_220 - TRUCK
      ?AUTO_217 - LOCATION
      ?AUTO_221 - CITY
      ?AUTO_219 - LOCATION
      ?AUTO_218 - AIRPLANE
      ?AUTO_222 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_220 ?AUTO_217 ) ( IN-CITY ?AUTO_217 ?AUTO_221 ) ( IN-CITY ?AUTO_216 ?AUTO_221 ) ( not ( = ?AUTO_216 ?AUTO_217 ) ) ( AIRPORT ?AUTO_219 ) ( AIRPORT ?AUTO_217 ) ( AIRPLANE-AT ?AUTO_218 ?AUTO_219 ) ( not ( = ?AUTO_219 ?AUTO_217 ) ) ( not ( = ?AUTO_216 ?AUTO_219 ) ) ( TRUCK-AT ?AUTO_222 ?AUTO_219 ) ( IN-TRUCK ?AUTO_215 ?AUTO_222 ) ( not ( = ?AUTO_220 ?AUTO_222 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_215 ?AUTO_222 ?AUTO_219 )
      ( DELIVER-PKG ?AUTO_215 ?AUTO_216 )
      ( DELIVER-PKG-VERIFY ?AUTO_215 ?AUTO_216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_223 - OBJ
      ?AUTO_224 - LOCATION
    )
    :vars
    (
      ?AUTO_229 - TRUCK
      ?AUTO_226 - LOCATION
      ?AUTO_225 - CITY
      ?AUTO_228 - LOCATION
      ?AUTO_227 - AIRPLANE
      ?AUTO_230 - TRUCK
      ?AUTO_232 - LOCATION
      ?AUTO_231 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_229 ?AUTO_226 ) ( IN-CITY ?AUTO_226 ?AUTO_225 ) ( IN-CITY ?AUTO_224 ?AUTO_225 ) ( not ( = ?AUTO_224 ?AUTO_226 ) ) ( AIRPORT ?AUTO_228 ) ( AIRPORT ?AUTO_226 ) ( AIRPLANE-AT ?AUTO_227 ?AUTO_228 ) ( not ( = ?AUTO_228 ?AUTO_226 ) ) ( not ( = ?AUTO_224 ?AUTO_228 ) ) ( IN-TRUCK ?AUTO_223 ?AUTO_230 ) ( not ( = ?AUTO_229 ?AUTO_230 ) ) ( TRUCK-AT ?AUTO_230 ?AUTO_232 ) ( IN-CITY ?AUTO_232 ?AUTO_231 ) ( IN-CITY ?AUTO_228 ?AUTO_231 ) ( not ( = ?AUTO_228 ?AUTO_232 ) ) ( not ( = ?AUTO_224 ?AUTO_232 ) ) ( not ( = ?AUTO_226 ?AUTO_232 ) ) ( not ( = ?AUTO_225 ?AUTO_231 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_230 ?AUTO_232 ?AUTO_228 ?AUTO_231 )
      ( DELIVER-PKG ?AUTO_223 ?AUTO_224 )
      ( DELIVER-PKG-VERIFY ?AUTO_223 ?AUTO_224 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_233 - OBJ
      ?AUTO_234 - LOCATION
    )
    :vars
    (
      ?AUTO_240 - TRUCK
      ?AUTO_238 - LOCATION
      ?AUTO_235 - CITY
      ?AUTO_236 - LOCATION
      ?AUTO_239 - AIRPLANE
      ?AUTO_237 - TRUCK
      ?AUTO_242 - LOCATION
      ?AUTO_241 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_240 ?AUTO_238 ) ( IN-CITY ?AUTO_238 ?AUTO_235 ) ( IN-CITY ?AUTO_234 ?AUTO_235 ) ( not ( = ?AUTO_234 ?AUTO_238 ) ) ( AIRPORT ?AUTO_236 ) ( AIRPORT ?AUTO_238 ) ( AIRPLANE-AT ?AUTO_239 ?AUTO_236 ) ( not ( = ?AUTO_236 ?AUTO_238 ) ) ( not ( = ?AUTO_234 ?AUTO_236 ) ) ( not ( = ?AUTO_240 ?AUTO_237 ) ) ( TRUCK-AT ?AUTO_237 ?AUTO_242 ) ( IN-CITY ?AUTO_242 ?AUTO_241 ) ( IN-CITY ?AUTO_236 ?AUTO_241 ) ( not ( = ?AUTO_236 ?AUTO_242 ) ) ( not ( = ?AUTO_234 ?AUTO_242 ) ) ( not ( = ?AUTO_238 ?AUTO_242 ) ) ( not ( = ?AUTO_235 ?AUTO_241 ) ) ( OBJ-AT ?AUTO_233 ?AUTO_242 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_233 ?AUTO_237 ?AUTO_242 )
      ( DELIVER-PKG ?AUTO_233 ?AUTO_234 )
      ( DELIVER-PKG-VERIFY ?AUTO_233 ?AUTO_234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_243 - OBJ
      ?AUTO_244 - LOCATION
    )
    :vars
    (
      ?AUTO_248 - TRUCK
      ?AUTO_251 - LOCATION
      ?AUTO_245 - CITY
      ?AUTO_246 - LOCATION
      ?AUTO_250 - AIRPLANE
      ?AUTO_252 - TRUCK
      ?AUTO_249 - LOCATION
      ?AUTO_247 - CITY
      ?AUTO_253 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_248 ?AUTO_251 ) ( IN-CITY ?AUTO_251 ?AUTO_245 ) ( IN-CITY ?AUTO_244 ?AUTO_245 ) ( not ( = ?AUTO_244 ?AUTO_251 ) ) ( AIRPORT ?AUTO_246 ) ( AIRPORT ?AUTO_251 ) ( AIRPLANE-AT ?AUTO_250 ?AUTO_246 ) ( not ( = ?AUTO_246 ?AUTO_251 ) ) ( not ( = ?AUTO_244 ?AUTO_246 ) ) ( not ( = ?AUTO_248 ?AUTO_252 ) ) ( IN-CITY ?AUTO_249 ?AUTO_247 ) ( IN-CITY ?AUTO_246 ?AUTO_247 ) ( not ( = ?AUTO_246 ?AUTO_249 ) ) ( not ( = ?AUTO_244 ?AUTO_249 ) ) ( not ( = ?AUTO_251 ?AUTO_249 ) ) ( not ( = ?AUTO_245 ?AUTO_247 ) ) ( OBJ-AT ?AUTO_243 ?AUTO_249 ) ( TRUCK-AT ?AUTO_252 ?AUTO_253 ) ( IN-CITY ?AUTO_253 ?AUTO_247 ) ( not ( = ?AUTO_249 ?AUTO_253 ) ) ( not ( = ?AUTO_244 ?AUTO_253 ) ) ( not ( = ?AUTO_251 ?AUTO_253 ) ) ( not ( = ?AUTO_246 ?AUTO_253 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_252 ?AUTO_253 ?AUTO_249 ?AUTO_247 )
      ( DELIVER-PKG ?AUTO_243 ?AUTO_244 )
      ( DELIVER-PKG-VERIFY ?AUTO_243 ?AUTO_244 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_256 - OBJ
      ?AUTO_257 - LOCATION
    )
    :vars
    (
      ?AUTO_260 - TRUCK
      ?AUTO_266 - LOCATION
      ?AUTO_258 - CITY
      ?AUTO_263 - LOCATION
      ?AUTO_259 - TRUCK
      ?AUTO_261 - LOCATION
      ?AUTO_265 - CITY
      ?AUTO_264 - LOCATION
      ?AUTO_267 - LOCATION
      ?AUTO_262 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_260 ?AUTO_266 ) ( IN-CITY ?AUTO_266 ?AUTO_258 ) ( IN-CITY ?AUTO_257 ?AUTO_258 ) ( not ( = ?AUTO_257 ?AUTO_266 ) ) ( AIRPORT ?AUTO_263 ) ( AIRPORT ?AUTO_266 ) ( not ( = ?AUTO_263 ?AUTO_266 ) ) ( not ( = ?AUTO_257 ?AUTO_263 ) ) ( not ( = ?AUTO_260 ?AUTO_259 ) ) ( IN-CITY ?AUTO_261 ?AUTO_265 ) ( IN-CITY ?AUTO_263 ?AUTO_265 ) ( not ( = ?AUTO_263 ?AUTO_261 ) ) ( not ( = ?AUTO_257 ?AUTO_261 ) ) ( not ( = ?AUTO_266 ?AUTO_261 ) ) ( not ( = ?AUTO_258 ?AUTO_265 ) ) ( OBJ-AT ?AUTO_256 ?AUTO_261 ) ( TRUCK-AT ?AUTO_259 ?AUTO_264 ) ( IN-CITY ?AUTO_264 ?AUTO_265 ) ( not ( = ?AUTO_261 ?AUTO_264 ) ) ( not ( = ?AUTO_257 ?AUTO_264 ) ) ( not ( = ?AUTO_266 ?AUTO_264 ) ) ( not ( = ?AUTO_263 ?AUTO_264 ) ) ( AIRPORT ?AUTO_267 ) ( AIRPLANE-AT ?AUTO_262 ?AUTO_267 ) ( not ( = ?AUTO_267 ?AUTO_263 ) ) ( not ( = ?AUTO_257 ?AUTO_267 ) ) ( not ( = ?AUTO_266 ?AUTO_267 ) ) ( not ( = ?AUTO_261 ?AUTO_267 ) ) ( not ( = ?AUTO_264 ?AUTO_267 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_262 ?AUTO_267 ?AUTO_263 )
      ( DELIVER-PKG ?AUTO_256 ?AUTO_257 )
      ( DELIVER-PKG-VERIFY ?AUTO_256 ?AUTO_257 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_728 - OBJ
      ?AUTO_729 - LOCATION
    )
    :vars
    (
      ?AUTO_730 - LOCATION
      ?AUTO_731 - CITY
      ?AUTO_732 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_730 ?AUTO_731 ) ( IN-CITY ?AUTO_729 ?AUTO_731 ) ( not ( = ?AUTO_729 ?AUTO_730 ) ) ( OBJ-AT ?AUTO_728 ?AUTO_730 ) ( TRUCK-AT ?AUTO_732 ?AUTO_729 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_732 ?AUTO_729 ?AUTO_730 ?AUTO_731 )
      ( DELIVER-PKG ?AUTO_728 ?AUTO_729 )
      ( DELIVER-PKG-VERIFY ?AUTO_728 ?AUTO_729 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_811 - OBJ
      ?AUTO_812 - LOCATION
    )
    :vars
    (
      ?AUTO_815 - LOCATION
      ?AUTO_816 - AIRPLANE
      ?AUTO_813 - LOCATION
      ?AUTO_817 - CITY
      ?AUTO_814 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_815 ) ( AIRPORT ?AUTO_812 ) ( AIRPLANE-AT ?AUTO_816 ?AUTO_815 ) ( not ( = ?AUTO_815 ?AUTO_812 ) ) ( IN-CITY ?AUTO_813 ?AUTO_817 ) ( IN-CITY ?AUTO_815 ?AUTO_817 ) ( not ( = ?AUTO_815 ?AUTO_813 ) ) ( not ( = ?AUTO_812 ?AUTO_813 ) ) ( OBJ-AT ?AUTO_811 ?AUTO_813 ) ( TRUCK-AT ?AUTO_814 ?AUTO_815 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_814 ?AUTO_815 ?AUTO_813 ?AUTO_817 )
      ( DELIVER-PKG ?AUTO_811 ?AUTO_812 )
      ( DELIVER-PKG-VERIFY ?AUTO_811 ?AUTO_812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_834 - OBJ
      ?AUTO_835 - LOCATION
    )
    :vars
    (
      ?AUTO_840 - LOCATION
      ?AUTO_837 - LOCATION
      ?AUTO_836 - CITY
      ?AUTO_838 - TRUCK
      ?AUTO_841 - LOCATION
      ?AUTO_839 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_840 ) ( AIRPORT ?AUTO_835 ) ( not ( = ?AUTO_840 ?AUTO_835 ) ) ( IN-CITY ?AUTO_837 ?AUTO_836 ) ( IN-CITY ?AUTO_840 ?AUTO_836 ) ( not ( = ?AUTO_840 ?AUTO_837 ) ) ( not ( = ?AUTO_835 ?AUTO_837 ) ) ( OBJ-AT ?AUTO_834 ?AUTO_837 ) ( TRUCK-AT ?AUTO_838 ?AUTO_840 ) ( AIRPORT ?AUTO_841 ) ( AIRPLANE-AT ?AUTO_839 ?AUTO_841 ) ( not ( = ?AUTO_841 ?AUTO_840 ) ) ( not ( = ?AUTO_835 ?AUTO_841 ) ) ( not ( = ?AUTO_837 ?AUTO_841 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_839 ?AUTO_841 ?AUTO_840 )
      ( DELIVER-PKG ?AUTO_834 ?AUTO_835 )
      ( DELIVER-PKG-VERIFY ?AUTO_834 ?AUTO_835 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_844 - OBJ
      ?AUTO_845 - LOCATION
    )
    :vars
    (
      ?AUTO_848 - LOCATION
      ?AUTO_851 - LOCATION
      ?AUTO_849 - CITY
      ?AUTO_850 - TRUCK
      ?AUTO_846 - LOCATION
      ?AUTO_847 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_848 ) ( AIRPORT ?AUTO_845 ) ( not ( = ?AUTO_848 ?AUTO_845 ) ) ( IN-CITY ?AUTO_851 ?AUTO_849 ) ( IN-CITY ?AUTO_848 ?AUTO_849 ) ( not ( = ?AUTO_848 ?AUTO_851 ) ) ( not ( = ?AUTO_845 ?AUTO_851 ) ) ( OBJ-AT ?AUTO_844 ?AUTO_851 ) ( TRUCK-AT ?AUTO_850 ?AUTO_848 ) ( AIRPORT ?AUTO_846 ) ( not ( = ?AUTO_846 ?AUTO_848 ) ) ( not ( = ?AUTO_845 ?AUTO_846 ) ) ( not ( = ?AUTO_851 ?AUTO_846 ) ) ( AIRPLANE-AT ?AUTO_847 ?AUTO_845 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_847 ?AUTO_845 ?AUTO_846 )
      ( DELIVER-PKG ?AUTO_844 ?AUTO_845 )
      ( DELIVER-PKG-VERIFY ?AUTO_844 ?AUTO_845 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1059 - OBJ
      ?AUTO_1060 - LOCATION
    )
    :vars
    (
      ?AUTO_1063 - LOCATION
      ?AUTO_1061 - LOCATION
      ?AUTO_1062 - AIRPLANE
      ?AUTO_1064 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1063 ) ( AIRPORT ?AUTO_1060 ) ( not ( = ?AUTO_1063 ?AUTO_1060 ) ) ( AIRPORT ?AUTO_1061 ) ( AIRPLANE-AT ?AUTO_1062 ?AUTO_1061 ) ( not ( = ?AUTO_1061 ?AUTO_1063 ) ) ( not ( = ?AUTO_1060 ?AUTO_1061 ) ) ( TRUCK-AT ?AUTO_1064 ?AUTO_1063 ) ( IN-TRUCK ?AUTO_1059 ?AUTO_1064 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1059 ?AUTO_1064 ?AUTO_1063 )
      ( DELIVER-PKG ?AUTO_1059 ?AUTO_1060 )
      ( DELIVER-PKG-VERIFY ?AUTO_1059 ?AUTO_1060 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1067 - OBJ
      ?AUTO_1068 - LOCATION
    )
    :vars
    (
      ?AUTO_1071 - LOCATION
      ?AUTO_1072 - LOCATION
      ?AUTO_1069 - AIRPLANE
      ?AUTO_1070 - TRUCK
      ?AUTO_1074 - LOCATION
      ?AUTO_1073 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1071 ) ( AIRPORT ?AUTO_1068 ) ( not ( = ?AUTO_1071 ?AUTO_1068 ) ) ( AIRPORT ?AUTO_1072 ) ( AIRPLANE-AT ?AUTO_1069 ?AUTO_1072 ) ( not ( = ?AUTO_1072 ?AUTO_1071 ) ) ( not ( = ?AUTO_1068 ?AUTO_1072 ) ) ( IN-TRUCK ?AUTO_1067 ?AUTO_1070 ) ( TRUCK-AT ?AUTO_1070 ?AUTO_1074 ) ( IN-CITY ?AUTO_1074 ?AUTO_1073 ) ( IN-CITY ?AUTO_1071 ?AUTO_1073 ) ( not ( = ?AUTO_1071 ?AUTO_1074 ) ) ( not ( = ?AUTO_1068 ?AUTO_1074 ) ) ( not ( = ?AUTO_1072 ?AUTO_1074 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1070 ?AUTO_1074 ?AUTO_1071 ?AUTO_1073 )
      ( DELIVER-PKG ?AUTO_1067 ?AUTO_1068 )
      ( DELIVER-PKG-VERIFY ?AUTO_1067 ?AUTO_1068 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1075 - OBJ
      ?AUTO_1076 - LOCATION
    )
    :vars
    (
      ?AUTO_1082 - LOCATION
      ?AUTO_1080 - LOCATION
      ?AUTO_1077 - AIRPLANE
      ?AUTO_1079 - TRUCK
      ?AUTO_1081 - LOCATION
      ?AUTO_1078 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1082 ) ( AIRPORT ?AUTO_1076 ) ( not ( = ?AUTO_1082 ?AUTO_1076 ) ) ( AIRPORT ?AUTO_1080 ) ( AIRPLANE-AT ?AUTO_1077 ?AUTO_1080 ) ( not ( = ?AUTO_1080 ?AUTO_1082 ) ) ( not ( = ?AUTO_1076 ?AUTO_1080 ) ) ( TRUCK-AT ?AUTO_1079 ?AUTO_1081 ) ( IN-CITY ?AUTO_1081 ?AUTO_1078 ) ( IN-CITY ?AUTO_1082 ?AUTO_1078 ) ( not ( = ?AUTO_1082 ?AUTO_1081 ) ) ( not ( = ?AUTO_1076 ?AUTO_1081 ) ) ( not ( = ?AUTO_1080 ?AUTO_1081 ) ) ( OBJ-AT ?AUTO_1075 ?AUTO_1081 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1075 ?AUTO_1079 ?AUTO_1081 )
      ( DELIVER-PKG ?AUTO_1075 ?AUTO_1076 )
      ( DELIVER-PKG-VERIFY ?AUTO_1075 ?AUTO_1076 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1194 - OBJ
      ?AUTO_1195 - LOCATION
    )
    :vars
    (
      ?AUTO_1200 - TRUCK
      ?AUTO_1197 - LOCATION
      ?AUTO_1198 - CITY
      ?AUTO_1196 - LOCATION
      ?AUTO_1201 - LOCATION
      ?AUTO_1199 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1200 ?AUTO_1197 ) ( IN-CITY ?AUTO_1197 ?AUTO_1198 ) ( IN-CITY ?AUTO_1195 ?AUTO_1198 ) ( not ( = ?AUTO_1195 ?AUTO_1197 ) ) ( AIRPORT ?AUTO_1196 ) ( AIRPORT ?AUTO_1197 ) ( not ( = ?AUTO_1196 ?AUTO_1197 ) ) ( not ( = ?AUTO_1195 ?AUTO_1196 ) ) ( OBJ-AT ?AUTO_1194 ?AUTO_1196 ) ( AIRPORT ?AUTO_1201 ) ( AIRPLANE-AT ?AUTO_1199 ?AUTO_1201 ) ( not ( = ?AUTO_1201 ?AUTO_1196 ) ) ( not ( = ?AUTO_1195 ?AUTO_1201 ) ) ( not ( = ?AUTO_1197 ?AUTO_1201 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1199 ?AUTO_1201 ?AUTO_1196 )
      ( DELIVER-PKG ?AUTO_1194 ?AUTO_1195 )
      ( DELIVER-PKG-VERIFY ?AUTO_1194 ?AUTO_1195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1214 - OBJ
      ?AUTO_1215 - LOCATION
    )
    :vars
    (
      ?AUTO_1218 - TRUCK
      ?AUTO_1217 - LOCATION
      ?AUTO_1216 - CITY
      ?AUTO_1221 - LOCATION
      ?AUTO_1220 - LOCATION
      ?AUTO_1219 - AIRPLANE
      ?AUTO_1222 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1218 ?AUTO_1217 ) ( IN-CITY ?AUTO_1217 ?AUTO_1216 ) ( IN-CITY ?AUTO_1215 ?AUTO_1216 ) ( not ( = ?AUTO_1215 ?AUTO_1217 ) ) ( AIRPORT ?AUTO_1221 ) ( AIRPORT ?AUTO_1217 ) ( not ( = ?AUTO_1221 ?AUTO_1217 ) ) ( not ( = ?AUTO_1215 ?AUTO_1221 ) ) ( AIRPORT ?AUTO_1220 ) ( AIRPLANE-AT ?AUTO_1219 ?AUTO_1220 ) ( not ( = ?AUTO_1220 ?AUTO_1221 ) ) ( not ( = ?AUTO_1215 ?AUTO_1220 ) ) ( not ( = ?AUTO_1217 ?AUTO_1220 ) ) ( TRUCK-AT ?AUTO_1222 ?AUTO_1221 ) ( IN-TRUCK ?AUTO_1214 ?AUTO_1222 ) ( not ( = ?AUTO_1218 ?AUTO_1222 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1214 ?AUTO_1222 ?AUTO_1221 )
      ( DELIVER-PKG ?AUTO_1214 ?AUTO_1215 )
      ( DELIVER-PKG-VERIFY ?AUTO_1214 ?AUTO_1215 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1225 - OBJ
      ?AUTO_1226 - LOCATION
    )
    :vars
    (
      ?AUTO_1229 - TRUCK
      ?AUTO_1232 - LOCATION
      ?AUTO_1233 - CITY
      ?AUTO_1231 - LOCATION
      ?AUTO_1230 - LOCATION
      ?AUTO_1228 - AIRPLANE
      ?AUTO_1227 - TRUCK
      ?AUTO_1235 - LOCATION
      ?AUTO_1234 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1229 ?AUTO_1232 ) ( IN-CITY ?AUTO_1232 ?AUTO_1233 ) ( IN-CITY ?AUTO_1226 ?AUTO_1233 ) ( not ( = ?AUTO_1226 ?AUTO_1232 ) ) ( AIRPORT ?AUTO_1231 ) ( AIRPORT ?AUTO_1232 ) ( not ( = ?AUTO_1231 ?AUTO_1232 ) ) ( not ( = ?AUTO_1226 ?AUTO_1231 ) ) ( AIRPORT ?AUTO_1230 ) ( AIRPLANE-AT ?AUTO_1228 ?AUTO_1230 ) ( not ( = ?AUTO_1230 ?AUTO_1231 ) ) ( not ( = ?AUTO_1226 ?AUTO_1230 ) ) ( not ( = ?AUTO_1232 ?AUTO_1230 ) ) ( IN-TRUCK ?AUTO_1225 ?AUTO_1227 ) ( not ( = ?AUTO_1229 ?AUTO_1227 ) ) ( TRUCK-AT ?AUTO_1227 ?AUTO_1235 ) ( IN-CITY ?AUTO_1235 ?AUTO_1234 ) ( IN-CITY ?AUTO_1231 ?AUTO_1234 ) ( not ( = ?AUTO_1231 ?AUTO_1235 ) ) ( not ( = ?AUTO_1226 ?AUTO_1235 ) ) ( not ( = ?AUTO_1232 ?AUTO_1235 ) ) ( not ( = ?AUTO_1233 ?AUTO_1234 ) ) ( not ( = ?AUTO_1230 ?AUTO_1235 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1227 ?AUTO_1235 ?AUTO_1231 ?AUTO_1234 )
      ( DELIVER-PKG ?AUTO_1225 ?AUTO_1226 )
      ( DELIVER-PKG-VERIFY ?AUTO_1225 ?AUTO_1226 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1236 - OBJ
      ?AUTO_1237 - LOCATION
    )
    :vars
    (
      ?AUTO_1240 - TRUCK
      ?AUTO_1241 - LOCATION
      ?AUTO_1238 - CITY
      ?AUTO_1244 - LOCATION
      ?AUTO_1243 - LOCATION
      ?AUTO_1242 - AIRPLANE
      ?AUTO_1239 - TRUCK
      ?AUTO_1246 - LOCATION
      ?AUTO_1245 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1240 ?AUTO_1241 ) ( IN-CITY ?AUTO_1241 ?AUTO_1238 ) ( IN-CITY ?AUTO_1237 ?AUTO_1238 ) ( not ( = ?AUTO_1237 ?AUTO_1241 ) ) ( AIRPORT ?AUTO_1244 ) ( AIRPORT ?AUTO_1241 ) ( not ( = ?AUTO_1244 ?AUTO_1241 ) ) ( not ( = ?AUTO_1237 ?AUTO_1244 ) ) ( AIRPORT ?AUTO_1243 ) ( AIRPLANE-AT ?AUTO_1242 ?AUTO_1243 ) ( not ( = ?AUTO_1243 ?AUTO_1244 ) ) ( not ( = ?AUTO_1237 ?AUTO_1243 ) ) ( not ( = ?AUTO_1241 ?AUTO_1243 ) ) ( not ( = ?AUTO_1240 ?AUTO_1239 ) ) ( TRUCK-AT ?AUTO_1239 ?AUTO_1246 ) ( IN-CITY ?AUTO_1246 ?AUTO_1245 ) ( IN-CITY ?AUTO_1244 ?AUTO_1245 ) ( not ( = ?AUTO_1244 ?AUTO_1246 ) ) ( not ( = ?AUTO_1237 ?AUTO_1246 ) ) ( not ( = ?AUTO_1241 ?AUTO_1246 ) ) ( not ( = ?AUTO_1238 ?AUTO_1245 ) ) ( not ( = ?AUTO_1243 ?AUTO_1246 ) ) ( OBJ-AT ?AUTO_1236 ?AUTO_1246 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1236 ?AUTO_1239 ?AUTO_1246 )
      ( DELIVER-PKG ?AUTO_1236 ?AUTO_1237 )
      ( DELIVER-PKG-VERIFY ?AUTO_1236 ?AUTO_1237 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1273 - OBJ
      ?AUTO_1274 - LOCATION
    )
    :vars
    (
      ?AUTO_1276 - LOCATION
      ?AUTO_1275 - CITY
      ?AUTO_1277 - TRUCK
      ?AUTO_1278 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1276 ?AUTO_1275 ) ( IN-CITY ?AUTO_1274 ?AUTO_1275 ) ( not ( = ?AUTO_1274 ?AUTO_1276 ) ) ( TRUCK-AT ?AUTO_1277 ?AUTO_1274 ) ( IN-AIRPLANE ?AUTO_1273 ?AUTO_1278 ) ( AIRPLANE-AT ?AUTO_1278 ?AUTO_1276 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1273 ?AUTO_1278 ?AUTO_1276 )
      ( DELIVER-PKG ?AUTO_1273 ?AUTO_1274 )
      ( DELIVER-PKG-VERIFY ?AUTO_1273 ?AUTO_1274 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1281 - OBJ
      ?AUTO_1282 - LOCATION
    )
    :vars
    (
      ?AUTO_1286 - LOCATION
      ?AUTO_1285 - CITY
      ?AUTO_1283 - TRUCK
      ?AUTO_1284 - AIRPLANE
      ?AUTO_1287 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1286 ?AUTO_1285 ) ( IN-CITY ?AUTO_1282 ?AUTO_1285 ) ( not ( = ?AUTO_1282 ?AUTO_1286 ) ) ( TRUCK-AT ?AUTO_1283 ?AUTO_1282 ) ( IN-AIRPLANE ?AUTO_1281 ?AUTO_1284 ) ( AIRPORT ?AUTO_1287 ) ( AIRPORT ?AUTO_1286 ) ( AIRPLANE-AT ?AUTO_1284 ?AUTO_1287 ) ( not ( = ?AUTO_1287 ?AUTO_1286 ) ) ( not ( = ?AUTO_1282 ?AUTO_1287 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1284 ?AUTO_1287 ?AUTO_1286 )
      ( DELIVER-PKG ?AUTO_1281 ?AUTO_1282 )
      ( DELIVER-PKG-VERIFY ?AUTO_1281 ?AUTO_1282 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1288 - OBJ
      ?AUTO_1289 - LOCATION
    )
    :vars
    (
      ?AUTO_1293 - LOCATION
      ?AUTO_1292 - CITY
      ?AUTO_1294 - TRUCK
      ?AUTO_1291 - LOCATION
      ?AUTO_1290 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1293 ?AUTO_1292 ) ( IN-CITY ?AUTO_1289 ?AUTO_1292 ) ( not ( = ?AUTO_1289 ?AUTO_1293 ) ) ( TRUCK-AT ?AUTO_1294 ?AUTO_1289 ) ( AIRPORT ?AUTO_1291 ) ( AIRPORT ?AUTO_1293 ) ( AIRPLANE-AT ?AUTO_1290 ?AUTO_1291 ) ( not ( = ?AUTO_1291 ?AUTO_1293 ) ) ( not ( = ?AUTO_1289 ?AUTO_1291 ) ) ( OBJ-AT ?AUTO_1288 ?AUTO_1291 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1288 ?AUTO_1290 ?AUTO_1291 )
      ( DELIVER-PKG ?AUTO_1288 ?AUTO_1289 )
      ( DELIVER-PKG-VERIFY ?AUTO_1288 ?AUTO_1289 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1295 - OBJ
      ?AUTO_1296 - LOCATION
    )
    :vars
    (
      ?AUTO_1299 - LOCATION
      ?AUTO_1300 - CITY
      ?AUTO_1301 - TRUCK
      ?AUTO_1297 - LOCATION
      ?AUTO_1298 - AIRPLANE
      ?AUTO_1302 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1299 ?AUTO_1300 ) ( IN-CITY ?AUTO_1296 ?AUTO_1300 ) ( not ( = ?AUTO_1296 ?AUTO_1299 ) ) ( TRUCK-AT ?AUTO_1301 ?AUTO_1296 ) ( AIRPORT ?AUTO_1297 ) ( AIRPORT ?AUTO_1299 ) ( AIRPLANE-AT ?AUTO_1298 ?AUTO_1297 ) ( not ( = ?AUTO_1297 ?AUTO_1299 ) ) ( not ( = ?AUTO_1296 ?AUTO_1297 ) ) ( TRUCK-AT ?AUTO_1302 ?AUTO_1297 ) ( IN-TRUCK ?AUTO_1295 ?AUTO_1302 ) ( not ( = ?AUTO_1301 ?AUTO_1302 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1295 ?AUTO_1302 ?AUTO_1297 )
      ( DELIVER-PKG ?AUTO_1295 ?AUTO_1296 )
      ( DELIVER-PKG-VERIFY ?AUTO_1295 ?AUTO_1296 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1303 - OBJ
      ?AUTO_1304 - LOCATION
    )
    :vars
    (
      ?AUTO_1305 - LOCATION
      ?AUTO_1306 - CITY
      ?AUTO_1309 - TRUCK
      ?AUTO_1307 - LOCATION
      ?AUTO_1308 - AIRPLANE
      ?AUTO_1310 - TRUCK
      ?AUTO_1312 - LOCATION
      ?AUTO_1311 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1305 ?AUTO_1306 ) ( IN-CITY ?AUTO_1304 ?AUTO_1306 ) ( not ( = ?AUTO_1304 ?AUTO_1305 ) ) ( TRUCK-AT ?AUTO_1309 ?AUTO_1304 ) ( AIRPORT ?AUTO_1307 ) ( AIRPORT ?AUTO_1305 ) ( AIRPLANE-AT ?AUTO_1308 ?AUTO_1307 ) ( not ( = ?AUTO_1307 ?AUTO_1305 ) ) ( not ( = ?AUTO_1304 ?AUTO_1307 ) ) ( IN-TRUCK ?AUTO_1303 ?AUTO_1310 ) ( not ( = ?AUTO_1309 ?AUTO_1310 ) ) ( TRUCK-AT ?AUTO_1310 ?AUTO_1312 ) ( IN-CITY ?AUTO_1312 ?AUTO_1311 ) ( IN-CITY ?AUTO_1307 ?AUTO_1311 ) ( not ( = ?AUTO_1307 ?AUTO_1312 ) ) ( not ( = ?AUTO_1304 ?AUTO_1312 ) ) ( not ( = ?AUTO_1305 ?AUTO_1312 ) ) ( not ( = ?AUTO_1306 ?AUTO_1311 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1310 ?AUTO_1312 ?AUTO_1307 ?AUTO_1311 )
      ( DELIVER-PKG ?AUTO_1303 ?AUTO_1304 )
      ( DELIVER-PKG-VERIFY ?AUTO_1303 ?AUTO_1304 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1337 - OBJ
      ?AUTO_1338 - LOCATION
    )
    :vars
    (
      ?AUTO_1341 - LOCATION
      ?AUTO_1345 - CITY
      ?AUTO_1343 - TRUCK
      ?AUTO_1344 - LOCATION
      ?AUTO_1342 - AIRPLANE
      ?AUTO_1339 - TRUCK
      ?AUTO_1346 - LOCATION
      ?AUTO_1340 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1341 ?AUTO_1345 ) ( IN-CITY ?AUTO_1338 ?AUTO_1345 ) ( not ( = ?AUTO_1338 ?AUTO_1341 ) ) ( TRUCK-AT ?AUTO_1343 ?AUTO_1338 ) ( AIRPORT ?AUTO_1344 ) ( AIRPORT ?AUTO_1341 ) ( AIRPLANE-AT ?AUTO_1342 ?AUTO_1344 ) ( not ( = ?AUTO_1344 ?AUTO_1341 ) ) ( not ( = ?AUTO_1338 ?AUTO_1344 ) ) ( not ( = ?AUTO_1343 ?AUTO_1339 ) ) ( TRUCK-AT ?AUTO_1339 ?AUTO_1346 ) ( IN-CITY ?AUTO_1346 ?AUTO_1340 ) ( IN-CITY ?AUTO_1344 ?AUTO_1340 ) ( not ( = ?AUTO_1344 ?AUTO_1346 ) ) ( not ( = ?AUTO_1338 ?AUTO_1346 ) ) ( not ( = ?AUTO_1341 ?AUTO_1346 ) ) ( not ( = ?AUTO_1345 ?AUTO_1340 ) ) ( OBJ-AT ?AUTO_1337 ?AUTO_1346 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1337 ?AUTO_1339 ?AUTO_1346 )
      ( DELIVER-PKG ?AUTO_1337 ?AUTO_1338 )
      ( DELIVER-PKG-VERIFY ?AUTO_1337 ?AUTO_1338 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1673 - OBJ
      ?AUTO_1674 - LOCATION
    )
    :vars
    (
      ?AUTO_1680 - LOCATION
      ?AUTO_1678 - CITY
      ?AUTO_1679 - LOCATION
      ?AUTO_1677 - AIRPLANE
      ?AUTO_1676 - TRUCK
      ?AUTO_1675 - TRUCK
      ?AUTO_1681 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1680 ?AUTO_1678 ) ( IN-CITY ?AUTO_1674 ?AUTO_1678 ) ( not ( = ?AUTO_1674 ?AUTO_1680 ) ) ( AIRPORT ?AUTO_1679 ) ( AIRPORT ?AUTO_1680 ) ( AIRPLANE-AT ?AUTO_1677 ?AUTO_1679 ) ( not ( = ?AUTO_1679 ?AUTO_1680 ) ) ( not ( = ?AUTO_1674 ?AUTO_1679 ) ) ( TRUCK-AT ?AUTO_1676 ?AUTO_1679 ) ( IN-TRUCK ?AUTO_1673 ?AUTO_1676 ) ( not ( = ?AUTO_1675 ?AUTO_1676 ) ) ( TRUCK-AT ?AUTO_1675 ?AUTO_1681 ) ( IN-CITY ?AUTO_1681 ?AUTO_1678 ) ( not ( = ?AUTO_1680 ?AUTO_1681 ) ) ( not ( = ?AUTO_1674 ?AUTO_1681 ) ) ( not ( = ?AUTO_1679 ?AUTO_1681 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1675 ?AUTO_1681 ?AUTO_1680 ?AUTO_1678 )
      ( DELIVER-PKG ?AUTO_1673 ?AUTO_1674 )
      ( DELIVER-PKG-VERIFY ?AUTO_1673 ?AUTO_1674 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1682 - OBJ
      ?AUTO_1683 - LOCATION
    )
    :vars
    (
      ?AUTO_1686 - LOCATION
      ?AUTO_1687 - CITY
      ?AUTO_1689 - LOCATION
      ?AUTO_1688 - AIRPLANE
      ?AUTO_1685 - TRUCK
      ?AUTO_1684 - TRUCK
      ?AUTO_1690 - LOCATION
      ?AUTO_1692 - LOCATION
      ?AUTO_1691 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1686 ?AUTO_1687 ) ( IN-CITY ?AUTO_1683 ?AUTO_1687 ) ( not ( = ?AUTO_1683 ?AUTO_1686 ) ) ( AIRPORT ?AUTO_1689 ) ( AIRPORT ?AUTO_1686 ) ( AIRPLANE-AT ?AUTO_1688 ?AUTO_1689 ) ( not ( = ?AUTO_1689 ?AUTO_1686 ) ) ( not ( = ?AUTO_1683 ?AUTO_1689 ) ) ( IN-TRUCK ?AUTO_1682 ?AUTO_1685 ) ( not ( = ?AUTO_1684 ?AUTO_1685 ) ) ( TRUCK-AT ?AUTO_1684 ?AUTO_1690 ) ( IN-CITY ?AUTO_1690 ?AUTO_1687 ) ( not ( = ?AUTO_1686 ?AUTO_1690 ) ) ( not ( = ?AUTO_1683 ?AUTO_1690 ) ) ( not ( = ?AUTO_1689 ?AUTO_1690 ) ) ( TRUCK-AT ?AUTO_1685 ?AUTO_1692 ) ( IN-CITY ?AUTO_1692 ?AUTO_1691 ) ( IN-CITY ?AUTO_1689 ?AUTO_1691 ) ( not ( = ?AUTO_1689 ?AUTO_1692 ) ) ( not ( = ?AUTO_1683 ?AUTO_1692 ) ) ( not ( = ?AUTO_1686 ?AUTO_1692 ) ) ( not ( = ?AUTO_1687 ?AUTO_1691 ) ) ( not ( = ?AUTO_1690 ?AUTO_1692 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1685 ?AUTO_1692 ?AUTO_1689 ?AUTO_1691 )
      ( DELIVER-PKG ?AUTO_1682 ?AUTO_1683 )
      ( DELIVER-PKG-VERIFY ?AUTO_1682 ?AUTO_1683 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1709 - OBJ
      ?AUTO_1710 - LOCATION
    )
    :vars
    (
      ?AUTO_1714 - LOCATION
      ?AUTO_1711 - CITY
      ?AUTO_1718 - LOCATION
      ?AUTO_1715 - AIRPLANE
      ?AUTO_1719 - TRUCK
      ?AUTO_1716 - TRUCK
      ?AUTO_1713 - LOCATION
      ?AUTO_1717 - LOCATION
      ?AUTO_1712 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1714 ?AUTO_1711 ) ( IN-CITY ?AUTO_1710 ?AUTO_1711 ) ( not ( = ?AUTO_1710 ?AUTO_1714 ) ) ( AIRPORT ?AUTO_1718 ) ( AIRPORT ?AUTO_1714 ) ( AIRPLANE-AT ?AUTO_1715 ?AUTO_1718 ) ( not ( = ?AUTO_1718 ?AUTO_1714 ) ) ( not ( = ?AUTO_1710 ?AUTO_1718 ) ) ( not ( = ?AUTO_1719 ?AUTO_1716 ) ) ( TRUCK-AT ?AUTO_1719 ?AUTO_1713 ) ( IN-CITY ?AUTO_1713 ?AUTO_1711 ) ( not ( = ?AUTO_1714 ?AUTO_1713 ) ) ( not ( = ?AUTO_1710 ?AUTO_1713 ) ) ( not ( = ?AUTO_1718 ?AUTO_1713 ) ) ( TRUCK-AT ?AUTO_1716 ?AUTO_1717 ) ( IN-CITY ?AUTO_1717 ?AUTO_1712 ) ( IN-CITY ?AUTO_1718 ?AUTO_1712 ) ( not ( = ?AUTO_1718 ?AUTO_1717 ) ) ( not ( = ?AUTO_1710 ?AUTO_1717 ) ) ( not ( = ?AUTO_1714 ?AUTO_1717 ) ) ( not ( = ?AUTO_1711 ?AUTO_1712 ) ) ( not ( = ?AUTO_1713 ?AUTO_1717 ) ) ( OBJ-AT ?AUTO_1709 ?AUTO_1717 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1709 ?AUTO_1716 ?AUTO_1717 )
      ( DELIVER-PKG ?AUTO_1709 ?AUTO_1710 )
      ( DELIVER-PKG-VERIFY ?AUTO_1709 ?AUTO_1710 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1720 - OBJ
      ?AUTO_1721 - LOCATION
    )
    :vars
    (
      ?AUTO_1729 - LOCATION
      ?AUTO_1726 - CITY
      ?AUTO_1730 - LOCATION
      ?AUTO_1725 - AIRPLANE
      ?AUTO_1722 - TRUCK
      ?AUTO_1724 - TRUCK
      ?AUTO_1723 - LOCATION
      ?AUTO_1728 - LOCATION
      ?AUTO_1727 - CITY
      ?AUTO_1731 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1729 ?AUTO_1726 ) ( IN-CITY ?AUTO_1721 ?AUTO_1726 ) ( not ( = ?AUTO_1721 ?AUTO_1729 ) ) ( AIRPORT ?AUTO_1730 ) ( AIRPORT ?AUTO_1729 ) ( AIRPLANE-AT ?AUTO_1725 ?AUTO_1730 ) ( not ( = ?AUTO_1730 ?AUTO_1729 ) ) ( not ( = ?AUTO_1721 ?AUTO_1730 ) ) ( not ( = ?AUTO_1722 ?AUTO_1724 ) ) ( TRUCK-AT ?AUTO_1722 ?AUTO_1723 ) ( IN-CITY ?AUTO_1723 ?AUTO_1726 ) ( not ( = ?AUTO_1729 ?AUTO_1723 ) ) ( not ( = ?AUTO_1721 ?AUTO_1723 ) ) ( not ( = ?AUTO_1730 ?AUTO_1723 ) ) ( IN-CITY ?AUTO_1728 ?AUTO_1727 ) ( IN-CITY ?AUTO_1730 ?AUTO_1727 ) ( not ( = ?AUTO_1730 ?AUTO_1728 ) ) ( not ( = ?AUTO_1721 ?AUTO_1728 ) ) ( not ( = ?AUTO_1729 ?AUTO_1728 ) ) ( not ( = ?AUTO_1726 ?AUTO_1727 ) ) ( not ( = ?AUTO_1723 ?AUTO_1728 ) ) ( OBJ-AT ?AUTO_1720 ?AUTO_1728 ) ( TRUCK-AT ?AUTO_1724 ?AUTO_1731 ) ( IN-CITY ?AUTO_1731 ?AUTO_1727 ) ( not ( = ?AUTO_1728 ?AUTO_1731 ) ) ( not ( = ?AUTO_1721 ?AUTO_1731 ) ) ( not ( = ?AUTO_1729 ?AUTO_1731 ) ) ( not ( = ?AUTO_1730 ?AUTO_1731 ) ) ( not ( = ?AUTO_1723 ?AUTO_1731 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1724 ?AUTO_1731 ?AUTO_1728 ?AUTO_1727 )
      ( DELIVER-PKG ?AUTO_1720 ?AUTO_1721 )
      ( DELIVER-PKG-VERIFY ?AUTO_1720 ?AUTO_1721 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1774 - OBJ
      ?AUTO_1775 - LOCATION
    )
    :vars
    (
      ?AUTO_1779 - LOCATION
      ?AUTO_1777 - CITY
      ?AUTO_1778 - AIRPLANE
      ?AUTO_1780 - LOCATION
      ?AUTO_1776 - TRUCK
      ?AUTO_1781 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1779 ?AUTO_1777 ) ( IN-CITY ?AUTO_1775 ?AUTO_1777 ) ( not ( = ?AUTO_1775 ?AUTO_1779 ) ) ( IN-AIRPLANE ?AUTO_1774 ?AUTO_1778 ) ( AIRPORT ?AUTO_1780 ) ( AIRPORT ?AUTO_1779 ) ( AIRPLANE-AT ?AUTO_1778 ?AUTO_1780 ) ( not ( = ?AUTO_1780 ?AUTO_1779 ) ) ( not ( = ?AUTO_1775 ?AUTO_1780 ) ) ( TRUCK-AT ?AUTO_1776 ?AUTO_1781 ) ( IN-CITY ?AUTO_1781 ?AUTO_1777 ) ( not ( = ?AUTO_1779 ?AUTO_1781 ) ) ( not ( = ?AUTO_1775 ?AUTO_1781 ) ) ( not ( = ?AUTO_1780 ?AUTO_1781 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1776 ?AUTO_1781 ?AUTO_1779 ?AUTO_1777 )
      ( DELIVER-PKG ?AUTO_1774 ?AUTO_1775 )
      ( DELIVER-PKG-VERIFY ?AUTO_1774 ?AUTO_1775 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1972 - OBJ
      ?AUTO_1973 - LOCATION
    )
    :vars
    (
      ?AUTO_1978 - LOCATION
      ?AUTO_1975 - CITY
      ?AUTO_1976 - TRUCK
      ?AUTO_1974 - LOCATION
      ?AUTO_1977 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1978 ?AUTO_1975 ) ( IN-CITY ?AUTO_1973 ?AUTO_1975 ) ( not ( = ?AUTO_1973 ?AUTO_1978 ) ) ( TRUCK-AT ?AUTO_1976 ?AUTO_1973 ) ( AIRPORT ?AUTO_1974 ) ( AIRPORT ?AUTO_1978 ) ( not ( = ?AUTO_1974 ?AUTO_1978 ) ) ( not ( = ?AUTO_1973 ?AUTO_1974 ) ) ( OBJ-AT ?AUTO_1972 ?AUTO_1974 ) ( AIRPLANE-AT ?AUTO_1977 ?AUTO_1978 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1977 ?AUTO_1978 ?AUTO_1974 )
      ( DELIVER-PKG ?AUTO_1972 ?AUTO_1973 )
      ( DELIVER-PKG-VERIFY ?AUTO_1972 ?AUTO_1973 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1981 - OBJ
      ?AUTO_1982 - LOCATION
    )
    :vars
    (
      ?AUTO_1987 - LOCATION
      ?AUTO_1985 - CITY
      ?AUTO_1984 - TRUCK
      ?AUTO_1986 - LOCATION
      ?AUTO_1983 - AIRPLANE
      ?AUTO_1988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1987 ?AUTO_1985 ) ( IN-CITY ?AUTO_1982 ?AUTO_1985 ) ( not ( = ?AUTO_1982 ?AUTO_1987 ) ) ( TRUCK-AT ?AUTO_1984 ?AUTO_1982 ) ( AIRPORT ?AUTO_1986 ) ( AIRPORT ?AUTO_1987 ) ( not ( = ?AUTO_1986 ?AUTO_1987 ) ) ( not ( = ?AUTO_1982 ?AUTO_1986 ) ) ( AIRPLANE-AT ?AUTO_1983 ?AUTO_1987 ) ( TRUCK-AT ?AUTO_1988 ?AUTO_1986 ) ( IN-TRUCK ?AUTO_1981 ?AUTO_1988 ) ( not ( = ?AUTO_1984 ?AUTO_1988 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1981 ?AUTO_1988 ?AUTO_1986 )
      ( DELIVER-PKG ?AUTO_1981 ?AUTO_1982 )
      ( DELIVER-PKG-VERIFY ?AUTO_1981 ?AUTO_1982 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1989 - OBJ
      ?AUTO_1990 - LOCATION
    )
    :vars
    (
      ?AUTO_1992 - LOCATION
      ?AUTO_1995 - CITY
      ?AUTO_1994 - TRUCK
      ?AUTO_1991 - LOCATION
      ?AUTO_1993 - AIRPLANE
      ?AUTO_1996 - TRUCK
      ?AUTO_1998 - LOCATION
      ?AUTO_1997 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1992 ?AUTO_1995 ) ( IN-CITY ?AUTO_1990 ?AUTO_1995 ) ( not ( = ?AUTO_1990 ?AUTO_1992 ) ) ( TRUCK-AT ?AUTO_1994 ?AUTO_1990 ) ( AIRPORT ?AUTO_1991 ) ( AIRPORT ?AUTO_1992 ) ( not ( = ?AUTO_1991 ?AUTO_1992 ) ) ( not ( = ?AUTO_1990 ?AUTO_1991 ) ) ( AIRPLANE-AT ?AUTO_1993 ?AUTO_1992 ) ( IN-TRUCK ?AUTO_1989 ?AUTO_1996 ) ( not ( = ?AUTO_1994 ?AUTO_1996 ) ) ( TRUCK-AT ?AUTO_1996 ?AUTO_1998 ) ( IN-CITY ?AUTO_1998 ?AUTO_1997 ) ( IN-CITY ?AUTO_1991 ?AUTO_1997 ) ( not ( = ?AUTO_1991 ?AUTO_1998 ) ) ( not ( = ?AUTO_1990 ?AUTO_1998 ) ) ( not ( = ?AUTO_1992 ?AUTO_1998 ) ) ( not ( = ?AUTO_1995 ?AUTO_1997 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1996 ?AUTO_1998 ?AUTO_1991 ?AUTO_1997 )
      ( DELIVER-PKG ?AUTO_1989 ?AUTO_1990 )
      ( DELIVER-PKG-VERIFY ?AUTO_1989 ?AUTO_1990 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1999 - OBJ
      ?AUTO_2000 - LOCATION
    )
    :vars
    (
      ?AUTO_2004 - LOCATION
      ?AUTO_2001 - CITY
      ?AUTO_2003 - TRUCK
      ?AUTO_2008 - LOCATION
      ?AUTO_2007 - AIRPLANE
      ?AUTO_2002 - TRUCK
      ?AUTO_2006 - LOCATION
      ?AUTO_2005 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2004 ?AUTO_2001 ) ( IN-CITY ?AUTO_2000 ?AUTO_2001 ) ( not ( = ?AUTO_2000 ?AUTO_2004 ) ) ( TRUCK-AT ?AUTO_2003 ?AUTO_2000 ) ( AIRPORT ?AUTO_2008 ) ( AIRPORT ?AUTO_2004 ) ( not ( = ?AUTO_2008 ?AUTO_2004 ) ) ( not ( = ?AUTO_2000 ?AUTO_2008 ) ) ( AIRPLANE-AT ?AUTO_2007 ?AUTO_2004 ) ( not ( = ?AUTO_2003 ?AUTO_2002 ) ) ( TRUCK-AT ?AUTO_2002 ?AUTO_2006 ) ( IN-CITY ?AUTO_2006 ?AUTO_2005 ) ( IN-CITY ?AUTO_2008 ?AUTO_2005 ) ( not ( = ?AUTO_2008 ?AUTO_2006 ) ) ( not ( = ?AUTO_2000 ?AUTO_2006 ) ) ( not ( = ?AUTO_2004 ?AUTO_2006 ) ) ( not ( = ?AUTO_2001 ?AUTO_2005 ) ) ( OBJ-AT ?AUTO_1999 ?AUTO_2006 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1999 ?AUTO_2002 ?AUTO_2006 )
      ( DELIVER-PKG ?AUTO_1999 ?AUTO_2000 )
      ( DELIVER-PKG-VERIFY ?AUTO_1999 ?AUTO_2000 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2143 - OBJ
      ?AUTO_2144 - LOCATION
    )
    :vars
    (
      ?AUTO_2145 - LOCATION
      ?AUTO_2149 - TRUCK
      ?AUTO_2147 - LOCATION
      ?AUTO_2148 - CITY
      ?AUTO_2150 - LOCATION
      ?AUTO_2146 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2145 ) ( AIRPORT ?AUTO_2144 ) ( not ( = ?AUTO_2145 ?AUTO_2144 ) ) ( IN-TRUCK ?AUTO_2143 ?AUTO_2149 ) ( TRUCK-AT ?AUTO_2149 ?AUTO_2147 ) ( IN-CITY ?AUTO_2147 ?AUTO_2148 ) ( IN-CITY ?AUTO_2145 ?AUTO_2148 ) ( not ( = ?AUTO_2145 ?AUTO_2147 ) ) ( not ( = ?AUTO_2144 ?AUTO_2147 ) ) ( AIRPORT ?AUTO_2150 ) ( AIRPLANE-AT ?AUTO_2146 ?AUTO_2150 ) ( not ( = ?AUTO_2150 ?AUTO_2145 ) ) ( not ( = ?AUTO_2144 ?AUTO_2150 ) ) ( not ( = ?AUTO_2147 ?AUTO_2150 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2146 ?AUTO_2150 ?AUTO_2145 )
      ( DELIVER-PKG ?AUTO_2143 ?AUTO_2144 )
      ( DELIVER-PKG-VERIFY ?AUTO_2143 ?AUTO_2144 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2175 - OBJ
      ?AUTO_2176 - LOCATION
    )
    :vars
    (
      ?AUTO_2178 - LOCATION
      ?AUTO_2180 - LOCATION
      ?AUTO_2181 - CITY
      ?AUTO_2177 - LOCATION
      ?AUTO_2182 - AIRPLANE
      ?AUTO_2179 - TRUCK
      ?AUTO_2183 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2178 ) ( AIRPORT ?AUTO_2176 ) ( not ( = ?AUTO_2178 ?AUTO_2176 ) ) ( IN-CITY ?AUTO_2180 ?AUTO_2181 ) ( IN-CITY ?AUTO_2178 ?AUTO_2181 ) ( not ( = ?AUTO_2178 ?AUTO_2180 ) ) ( not ( = ?AUTO_2176 ?AUTO_2180 ) ) ( AIRPORT ?AUTO_2177 ) ( AIRPLANE-AT ?AUTO_2182 ?AUTO_2177 ) ( not ( = ?AUTO_2177 ?AUTO_2178 ) ) ( not ( = ?AUTO_2176 ?AUTO_2177 ) ) ( not ( = ?AUTO_2180 ?AUTO_2177 ) ) ( OBJ-AT ?AUTO_2175 ?AUTO_2180 ) ( TRUCK-AT ?AUTO_2179 ?AUTO_2183 ) ( IN-CITY ?AUTO_2183 ?AUTO_2181 ) ( not ( = ?AUTO_2180 ?AUTO_2183 ) ) ( not ( = ?AUTO_2176 ?AUTO_2183 ) ) ( not ( = ?AUTO_2178 ?AUTO_2183 ) ) ( not ( = ?AUTO_2177 ?AUTO_2183 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2179 ?AUTO_2183 ?AUTO_2180 ?AUTO_2181 )
      ( DELIVER-PKG ?AUTO_2175 ?AUTO_2176 )
      ( DELIVER-PKG-VERIFY ?AUTO_2175 ?AUTO_2176 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2213 - OBJ
      ?AUTO_2214 - LOCATION
    )
    :vars
    (
      ?AUTO_2216 - LOCATION
      ?AUTO_2215 - CITY
      ?AUTO_2217 - AIRPLANE
      ?AUTO_2218 - TRUCK
      ?AUTO_2219 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2216 ?AUTO_2215 ) ( IN-CITY ?AUTO_2214 ?AUTO_2215 ) ( not ( = ?AUTO_2214 ?AUTO_2216 ) ) ( IN-AIRPLANE ?AUTO_2213 ?AUTO_2217 ) ( AIRPLANE-AT ?AUTO_2217 ?AUTO_2216 ) ( TRUCK-AT ?AUTO_2218 ?AUTO_2219 ) ( IN-CITY ?AUTO_2219 ?AUTO_2215 ) ( not ( = ?AUTO_2216 ?AUTO_2219 ) ) ( not ( = ?AUTO_2214 ?AUTO_2219 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2218 ?AUTO_2219 ?AUTO_2216 ?AUTO_2215 )
      ( DELIVER-PKG ?AUTO_2213 ?AUTO_2214 )
      ( DELIVER-PKG-VERIFY ?AUTO_2213 ?AUTO_2214 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2381 - OBJ
      ?AUTO_2382 - LOCATION
    )
    :vars
    (
      ?AUTO_2385 - LOCATION
      ?AUTO_2387 - CITY
      ?AUTO_2384 - TRUCK
      ?AUTO_2383 - LOCATION
      ?AUTO_2388 - LOCATION
      ?AUTO_2386 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2385 ?AUTO_2387 ) ( IN-CITY ?AUTO_2382 ?AUTO_2387 ) ( not ( = ?AUTO_2382 ?AUTO_2385 ) ) ( TRUCK-AT ?AUTO_2384 ?AUTO_2382 ) ( AIRPORT ?AUTO_2383 ) ( AIRPORT ?AUTO_2385 ) ( not ( = ?AUTO_2383 ?AUTO_2385 ) ) ( not ( = ?AUTO_2382 ?AUTO_2383 ) ) ( OBJ-AT ?AUTO_2381 ?AUTO_2383 ) ( AIRPORT ?AUTO_2388 ) ( AIRPLANE-AT ?AUTO_2386 ?AUTO_2388 ) ( not ( = ?AUTO_2388 ?AUTO_2383 ) ) ( not ( = ?AUTO_2382 ?AUTO_2388 ) ) ( not ( = ?AUTO_2385 ?AUTO_2388 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2386 ?AUTO_2388 ?AUTO_2383 )
      ( DELIVER-PKG ?AUTO_2381 ?AUTO_2382 )
      ( DELIVER-PKG-VERIFY ?AUTO_2381 ?AUTO_2382 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2637 - OBJ
      ?AUTO_2638 - LOCATION
    )
    :vars
    (
      ?AUTO_2640 - LOCATION
      ?AUTO_2642 - CITY
      ?AUTO_2643 - TRUCK
      ?AUTO_2641 - LOCATION
      ?AUTO_2639 - LOCATION
      ?AUTO_2644 - AIRPLANE
      ?AUTO_2645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2640 ?AUTO_2642 ) ( IN-CITY ?AUTO_2638 ?AUTO_2642 ) ( not ( = ?AUTO_2638 ?AUTO_2640 ) ) ( TRUCK-AT ?AUTO_2643 ?AUTO_2638 ) ( AIRPORT ?AUTO_2641 ) ( AIRPORT ?AUTO_2640 ) ( not ( = ?AUTO_2641 ?AUTO_2640 ) ) ( not ( = ?AUTO_2638 ?AUTO_2641 ) ) ( AIRPORT ?AUTO_2639 ) ( AIRPLANE-AT ?AUTO_2644 ?AUTO_2639 ) ( not ( = ?AUTO_2639 ?AUTO_2641 ) ) ( not ( = ?AUTO_2638 ?AUTO_2639 ) ) ( not ( = ?AUTO_2640 ?AUTO_2639 ) ) ( TRUCK-AT ?AUTO_2645 ?AUTO_2641 ) ( IN-TRUCK ?AUTO_2637 ?AUTO_2645 ) ( not ( = ?AUTO_2643 ?AUTO_2645 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2637 ?AUTO_2645 ?AUTO_2641 )
      ( DELIVER-PKG ?AUTO_2637 ?AUTO_2638 )
      ( DELIVER-PKG-VERIFY ?AUTO_2637 ?AUTO_2638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2646 - OBJ
      ?AUTO_2647 - LOCATION
    )
    :vars
    (
      ?AUTO_2653 - LOCATION
      ?AUTO_2648 - CITY
      ?AUTO_2650 - TRUCK
      ?AUTO_2649 - LOCATION
      ?AUTO_2651 - LOCATION
      ?AUTO_2652 - AIRPLANE
      ?AUTO_2654 - TRUCK
      ?AUTO_2656 - LOCATION
      ?AUTO_2655 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2653 ?AUTO_2648 ) ( IN-CITY ?AUTO_2647 ?AUTO_2648 ) ( not ( = ?AUTO_2647 ?AUTO_2653 ) ) ( TRUCK-AT ?AUTO_2650 ?AUTO_2647 ) ( AIRPORT ?AUTO_2649 ) ( AIRPORT ?AUTO_2653 ) ( not ( = ?AUTO_2649 ?AUTO_2653 ) ) ( not ( = ?AUTO_2647 ?AUTO_2649 ) ) ( AIRPORT ?AUTO_2651 ) ( AIRPLANE-AT ?AUTO_2652 ?AUTO_2651 ) ( not ( = ?AUTO_2651 ?AUTO_2649 ) ) ( not ( = ?AUTO_2647 ?AUTO_2651 ) ) ( not ( = ?AUTO_2653 ?AUTO_2651 ) ) ( IN-TRUCK ?AUTO_2646 ?AUTO_2654 ) ( not ( = ?AUTO_2650 ?AUTO_2654 ) ) ( TRUCK-AT ?AUTO_2654 ?AUTO_2656 ) ( IN-CITY ?AUTO_2656 ?AUTO_2655 ) ( IN-CITY ?AUTO_2649 ?AUTO_2655 ) ( not ( = ?AUTO_2649 ?AUTO_2656 ) ) ( not ( = ?AUTO_2647 ?AUTO_2656 ) ) ( not ( = ?AUTO_2653 ?AUTO_2656 ) ) ( not ( = ?AUTO_2648 ?AUTO_2655 ) ) ( not ( = ?AUTO_2651 ?AUTO_2656 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2654 ?AUTO_2656 ?AUTO_2649 ?AUTO_2655 )
      ( DELIVER-PKG ?AUTO_2646 ?AUTO_2647 )
      ( DELIVER-PKG-VERIFY ?AUTO_2646 ?AUTO_2647 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2663 - OBJ
      ?AUTO_2664 - LOCATION
    )
    :vars
    (
      ?AUTO_2671 - LOCATION
      ?AUTO_2666 - CITY
      ?AUTO_2672 - TRUCK
      ?AUTO_2665 - LOCATION
      ?AUTO_2667 - LOCATION
      ?AUTO_2669 - AIRPLANE
      ?AUTO_2673 - TRUCK
      ?AUTO_2668 - LOCATION
      ?AUTO_2670 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2671 ?AUTO_2666 ) ( IN-CITY ?AUTO_2664 ?AUTO_2666 ) ( not ( = ?AUTO_2664 ?AUTO_2671 ) ) ( TRUCK-AT ?AUTO_2672 ?AUTO_2664 ) ( AIRPORT ?AUTO_2665 ) ( AIRPORT ?AUTO_2671 ) ( not ( = ?AUTO_2665 ?AUTO_2671 ) ) ( not ( = ?AUTO_2664 ?AUTO_2665 ) ) ( AIRPORT ?AUTO_2667 ) ( AIRPLANE-AT ?AUTO_2669 ?AUTO_2667 ) ( not ( = ?AUTO_2667 ?AUTO_2665 ) ) ( not ( = ?AUTO_2664 ?AUTO_2667 ) ) ( not ( = ?AUTO_2671 ?AUTO_2667 ) ) ( not ( = ?AUTO_2672 ?AUTO_2673 ) ) ( TRUCK-AT ?AUTO_2673 ?AUTO_2668 ) ( IN-CITY ?AUTO_2668 ?AUTO_2670 ) ( IN-CITY ?AUTO_2665 ?AUTO_2670 ) ( not ( = ?AUTO_2665 ?AUTO_2668 ) ) ( not ( = ?AUTO_2664 ?AUTO_2668 ) ) ( not ( = ?AUTO_2671 ?AUTO_2668 ) ) ( not ( = ?AUTO_2666 ?AUTO_2670 ) ) ( not ( = ?AUTO_2667 ?AUTO_2668 ) ) ( OBJ-AT ?AUTO_2663 ?AUTO_2668 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2663 ?AUTO_2673 ?AUTO_2668 )
      ( DELIVER-PKG ?AUTO_2663 ?AUTO_2664 )
      ( DELIVER-PKG-VERIFY ?AUTO_2663 ?AUTO_2664 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2742 - OBJ
      ?AUTO_2743 - LOCATION
    )
    :vars
    (
      ?AUTO_2749 - LOCATION
      ?AUTO_2745 - CITY
      ?AUTO_2744 - TRUCK
      ?AUTO_2751 - LOCATION
      ?AUTO_2750 - TRUCK
      ?AUTO_2748 - LOCATION
      ?AUTO_2746 - CITY
      ?AUTO_2752 - LOCATION
      ?AUTO_2747 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2749 ?AUTO_2745 ) ( IN-CITY ?AUTO_2743 ?AUTO_2745 ) ( not ( = ?AUTO_2743 ?AUTO_2749 ) ) ( TRUCK-AT ?AUTO_2744 ?AUTO_2743 ) ( AIRPORT ?AUTO_2751 ) ( AIRPORT ?AUTO_2749 ) ( not ( = ?AUTO_2751 ?AUTO_2749 ) ) ( not ( = ?AUTO_2743 ?AUTO_2751 ) ) ( IN-TRUCK ?AUTO_2742 ?AUTO_2750 ) ( not ( = ?AUTO_2744 ?AUTO_2750 ) ) ( TRUCK-AT ?AUTO_2750 ?AUTO_2748 ) ( IN-CITY ?AUTO_2748 ?AUTO_2746 ) ( IN-CITY ?AUTO_2751 ?AUTO_2746 ) ( not ( = ?AUTO_2751 ?AUTO_2748 ) ) ( not ( = ?AUTO_2743 ?AUTO_2748 ) ) ( not ( = ?AUTO_2749 ?AUTO_2748 ) ) ( not ( = ?AUTO_2745 ?AUTO_2746 ) ) ( AIRPORT ?AUTO_2752 ) ( AIRPLANE-AT ?AUTO_2747 ?AUTO_2752 ) ( not ( = ?AUTO_2752 ?AUTO_2751 ) ) ( not ( = ?AUTO_2743 ?AUTO_2752 ) ) ( not ( = ?AUTO_2749 ?AUTO_2752 ) ) ( not ( = ?AUTO_2748 ?AUTO_2752 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2747 ?AUTO_2752 ?AUTO_2751 )
      ( DELIVER-PKG ?AUTO_2742 ?AUTO_2743 )
      ( DELIVER-PKG-VERIFY ?AUTO_2742 ?AUTO_2743 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2887 - OBJ
      ?AUTO_2888 - LOCATION
    )
    :vars
    (
      ?AUTO_2889 - LOCATION
      ?AUTO_2890 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2889 ) ( AIRPORT ?AUTO_2888 ) ( not ( = ?AUTO_2889 ?AUTO_2888 ) ) ( OBJ-AT ?AUTO_2887 ?AUTO_2889 ) ( AIRPLANE-AT ?AUTO_2890 ?AUTO_2888 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2890 ?AUTO_2888 ?AUTO_2889 )
      ( DELIVER-PKG ?AUTO_2887 ?AUTO_2888 )
      ( DELIVER-PKG-VERIFY ?AUTO_2887 ?AUTO_2888 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2891 - OBJ
      ?AUTO_2892 - LOCATION
    )
    :vars
    (
      ?AUTO_2894 - LOCATION
      ?AUTO_2893 - AIRPLANE
      ?AUTO_2895 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2894 ) ( AIRPORT ?AUTO_2892 ) ( not ( = ?AUTO_2894 ?AUTO_2892 ) ) ( AIRPLANE-AT ?AUTO_2893 ?AUTO_2892 ) ( TRUCK-AT ?AUTO_2895 ?AUTO_2894 ) ( IN-TRUCK ?AUTO_2891 ?AUTO_2895 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2891 ?AUTO_2895 ?AUTO_2894 )
      ( DELIVER-PKG ?AUTO_2891 ?AUTO_2892 )
      ( DELIVER-PKG-VERIFY ?AUTO_2891 ?AUTO_2892 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2898 - OBJ
      ?AUTO_2899 - LOCATION
    )
    :vars
    (
      ?AUTO_2900 - LOCATION
      ?AUTO_2901 - AIRPLANE
      ?AUTO_2902 - TRUCK
      ?AUTO_2904 - LOCATION
      ?AUTO_2903 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2900 ) ( AIRPORT ?AUTO_2899 ) ( not ( = ?AUTO_2900 ?AUTO_2899 ) ) ( AIRPLANE-AT ?AUTO_2901 ?AUTO_2899 ) ( IN-TRUCK ?AUTO_2898 ?AUTO_2902 ) ( TRUCK-AT ?AUTO_2902 ?AUTO_2904 ) ( IN-CITY ?AUTO_2904 ?AUTO_2903 ) ( IN-CITY ?AUTO_2900 ?AUTO_2903 ) ( not ( = ?AUTO_2900 ?AUTO_2904 ) ) ( not ( = ?AUTO_2899 ?AUTO_2904 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2902 ?AUTO_2904 ?AUTO_2900 ?AUTO_2903 )
      ( DELIVER-PKG ?AUTO_2898 ?AUTO_2899 )
      ( DELIVER-PKG-VERIFY ?AUTO_2898 ?AUTO_2899 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2905 - OBJ
      ?AUTO_2906 - LOCATION
    )
    :vars
    (
      ?AUTO_2908 - LOCATION
      ?AUTO_2907 - AIRPLANE
      ?AUTO_2909 - TRUCK
      ?AUTO_2910 - LOCATION
      ?AUTO_2911 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2908 ) ( AIRPORT ?AUTO_2906 ) ( not ( = ?AUTO_2908 ?AUTO_2906 ) ) ( AIRPLANE-AT ?AUTO_2907 ?AUTO_2906 ) ( TRUCK-AT ?AUTO_2909 ?AUTO_2910 ) ( IN-CITY ?AUTO_2910 ?AUTO_2911 ) ( IN-CITY ?AUTO_2908 ?AUTO_2911 ) ( not ( = ?AUTO_2908 ?AUTO_2910 ) ) ( not ( = ?AUTO_2906 ?AUTO_2910 ) ) ( OBJ-AT ?AUTO_2905 ?AUTO_2910 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2905 ?AUTO_2909 ?AUTO_2910 )
      ( DELIVER-PKG ?AUTO_2905 ?AUTO_2906 )
      ( DELIVER-PKG-VERIFY ?AUTO_2905 ?AUTO_2906 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2912 - OBJ
      ?AUTO_2913 - LOCATION
    )
    :vars
    (
      ?AUTO_2915 - LOCATION
      ?AUTO_2917 - AIRPLANE
      ?AUTO_2916 - LOCATION
      ?AUTO_2918 - CITY
      ?AUTO_2914 - TRUCK
      ?AUTO_2919 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2915 ) ( AIRPORT ?AUTO_2913 ) ( not ( = ?AUTO_2915 ?AUTO_2913 ) ) ( AIRPLANE-AT ?AUTO_2917 ?AUTO_2913 ) ( IN-CITY ?AUTO_2916 ?AUTO_2918 ) ( IN-CITY ?AUTO_2915 ?AUTO_2918 ) ( not ( = ?AUTO_2915 ?AUTO_2916 ) ) ( not ( = ?AUTO_2913 ?AUTO_2916 ) ) ( OBJ-AT ?AUTO_2912 ?AUTO_2916 ) ( TRUCK-AT ?AUTO_2914 ?AUTO_2919 ) ( IN-CITY ?AUTO_2919 ?AUTO_2918 ) ( not ( = ?AUTO_2916 ?AUTO_2919 ) ) ( not ( = ?AUTO_2913 ?AUTO_2919 ) ) ( not ( = ?AUTO_2915 ?AUTO_2919 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2914 ?AUTO_2919 ?AUTO_2916 ?AUTO_2918 )
      ( DELIVER-PKG ?AUTO_2912 ?AUTO_2913 )
      ( DELIVER-PKG-VERIFY ?AUTO_2912 ?AUTO_2913 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3012 - OBJ
      ?AUTO_3013 - LOCATION
    )
    :vars
    (
      ?AUTO_3015 - TRUCK
      ?AUTO_3021 - LOCATION
      ?AUTO_3020 - CITY
      ?AUTO_3017 - LOCATION
      ?AUTO_3019 - LOCATION
      ?AUTO_3022 - AIRPLANE
      ?AUTO_3014 - TRUCK
      ?AUTO_3016 - LOCATION
      ?AUTO_3018 - CITY
      ?AUTO_3023 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3015 ?AUTO_3021 ) ( IN-CITY ?AUTO_3021 ?AUTO_3020 ) ( IN-CITY ?AUTO_3013 ?AUTO_3020 ) ( not ( = ?AUTO_3013 ?AUTO_3021 ) ) ( AIRPORT ?AUTO_3017 ) ( AIRPORT ?AUTO_3021 ) ( not ( = ?AUTO_3017 ?AUTO_3021 ) ) ( not ( = ?AUTO_3013 ?AUTO_3017 ) ) ( AIRPORT ?AUTO_3019 ) ( AIRPLANE-AT ?AUTO_3022 ?AUTO_3019 ) ( not ( = ?AUTO_3019 ?AUTO_3017 ) ) ( not ( = ?AUTO_3013 ?AUTO_3019 ) ) ( not ( = ?AUTO_3021 ?AUTO_3019 ) ) ( not ( = ?AUTO_3015 ?AUTO_3014 ) ) ( IN-CITY ?AUTO_3016 ?AUTO_3018 ) ( IN-CITY ?AUTO_3017 ?AUTO_3018 ) ( not ( = ?AUTO_3017 ?AUTO_3016 ) ) ( not ( = ?AUTO_3013 ?AUTO_3016 ) ) ( not ( = ?AUTO_3021 ?AUTO_3016 ) ) ( not ( = ?AUTO_3020 ?AUTO_3018 ) ) ( not ( = ?AUTO_3019 ?AUTO_3016 ) ) ( OBJ-AT ?AUTO_3012 ?AUTO_3016 ) ( TRUCK-AT ?AUTO_3014 ?AUTO_3023 ) ( IN-CITY ?AUTO_3023 ?AUTO_3018 ) ( not ( = ?AUTO_3016 ?AUTO_3023 ) ) ( not ( = ?AUTO_3013 ?AUTO_3023 ) ) ( not ( = ?AUTO_3021 ?AUTO_3023 ) ) ( not ( = ?AUTO_3017 ?AUTO_3023 ) ) ( not ( = ?AUTO_3019 ?AUTO_3023 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3014 ?AUTO_3023 ?AUTO_3016 ?AUTO_3018 )
      ( DELIVER-PKG ?AUTO_3012 ?AUTO_3013 )
      ( DELIVER-PKG-VERIFY ?AUTO_3012 ?AUTO_3013 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3024 - OBJ
      ?AUTO_3025 - LOCATION
    )
    :vars
    (
      ?AUTO_3028 - LOCATION
      ?AUTO_3031 - CITY
      ?AUTO_3033 - LOCATION
      ?AUTO_3035 - LOCATION
      ?AUTO_3030 - AIRPLANE
      ?AUTO_3032 - TRUCK
      ?AUTO_3034 - TRUCK
      ?AUTO_3027 - LOCATION
      ?AUTO_3029 - CITY
      ?AUTO_3026 - LOCATION
      ?AUTO_3036 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3028 ?AUTO_3031 ) ( IN-CITY ?AUTO_3025 ?AUTO_3031 ) ( not ( = ?AUTO_3025 ?AUTO_3028 ) ) ( AIRPORT ?AUTO_3033 ) ( AIRPORT ?AUTO_3028 ) ( not ( = ?AUTO_3033 ?AUTO_3028 ) ) ( not ( = ?AUTO_3025 ?AUTO_3033 ) ) ( AIRPORT ?AUTO_3035 ) ( AIRPLANE-AT ?AUTO_3030 ?AUTO_3035 ) ( not ( = ?AUTO_3035 ?AUTO_3033 ) ) ( not ( = ?AUTO_3025 ?AUTO_3035 ) ) ( not ( = ?AUTO_3028 ?AUTO_3035 ) ) ( not ( = ?AUTO_3032 ?AUTO_3034 ) ) ( IN-CITY ?AUTO_3027 ?AUTO_3029 ) ( IN-CITY ?AUTO_3033 ?AUTO_3029 ) ( not ( = ?AUTO_3033 ?AUTO_3027 ) ) ( not ( = ?AUTO_3025 ?AUTO_3027 ) ) ( not ( = ?AUTO_3028 ?AUTO_3027 ) ) ( not ( = ?AUTO_3031 ?AUTO_3029 ) ) ( not ( = ?AUTO_3035 ?AUTO_3027 ) ) ( OBJ-AT ?AUTO_3024 ?AUTO_3027 ) ( TRUCK-AT ?AUTO_3034 ?AUTO_3026 ) ( IN-CITY ?AUTO_3026 ?AUTO_3029 ) ( not ( = ?AUTO_3027 ?AUTO_3026 ) ) ( not ( = ?AUTO_3025 ?AUTO_3026 ) ) ( not ( = ?AUTO_3028 ?AUTO_3026 ) ) ( not ( = ?AUTO_3033 ?AUTO_3026 ) ) ( not ( = ?AUTO_3035 ?AUTO_3026 ) ) ( TRUCK-AT ?AUTO_3032 ?AUTO_3036 ) ( IN-CITY ?AUTO_3036 ?AUTO_3031 ) ( not ( = ?AUTO_3028 ?AUTO_3036 ) ) ( not ( = ?AUTO_3025 ?AUTO_3036 ) ) ( not ( = ?AUTO_3033 ?AUTO_3036 ) ) ( not ( = ?AUTO_3035 ?AUTO_3036 ) ) ( not ( = ?AUTO_3027 ?AUTO_3036 ) ) ( not ( = ?AUTO_3026 ?AUTO_3036 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3032 ?AUTO_3036 ?AUTO_3028 ?AUTO_3031 )
      ( DELIVER-PKG ?AUTO_3024 ?AUTO_3025 )
      ( DELIVER-PKG-VERIFY ?AUTO_3024 ?AUTO_3025 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3132 - OBJ
      ?AUTO_3133 - LOCATION
    )
    :vars
    (
      ?AUTO_3135 - LOCATION
      ?AUTO_3134 - LOCATION
      ?AUTO_3136 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3135 ) ( AIRPORT ?AUTO_3133 ) ( not ( = ?AUTO_3135 ?AUTO_3133 ) ) ( OBJ-AT ?AUTO_3132 ?AUTO_3135 ) ( AIRPORT ?AUTO_3134 ) ( not ( = ?AUTO_3134 ?AUTO_3135 ) ) ( not ( = ?AUTO_3133 ?AUTO_3134 ) ) ( AIRPLANE-AT ?AUTO_3136 ?AUTO_3133 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3136 ?AUTO_3133 ?AUTO_3134 )
      ( DELIVER-PKG ?AUTO_3132 ?AUTO_3133 )
      ( DELIVER-PKG-VERIFY ?AUTO_3132 ?AUTO_3133 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3218 - OBJ
      ?AUTO_3219 - LOCATION
    )
    :vars
    (
      ?AUTO_3223 - TRUCK
      ?AUTO_3220 - LOCATION
      ?AUTO_3224 - CITY
      ?AUTO_3222 - LOCATION
      ?AUTO_3221 - LOCATION
      ?AUTO_3225 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3223 ?AUTO_3220 ) ( IN-CITY ?AUTO_3220 ?AUTO_3224 ) ( IN-CITY ?AUTO_3219 ?AUTO_3224 ) ( not ( = ?AUTO_3219 ?AUTO_3220 ) ) ( AIRPORT ?AUTO_3222 ) ( AIRPORT ?AUTO_3220 ) ( not ( = ?AUTO_3222 ?AUTO_3220 ) ) ( not ( = ?AUTO_3219 ?AUTO_3222 ) ) ( OBJ-AT ?AUTO_3218 ?AUTO_3222 ) ( AIRPORT ?AUTO_3221 ) ( not ( = ?AUTO_3221 ?AUTO_3222 ) ) ( not ( = ?AUTO_3219 ?AUTO_3221 ) ) ( not ( = ?AUTO_3220 ?AUTO_3221 ) ) ( AIRPLANE-AT ?AUTO_3225 ?AUTO_3220 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3225 ?AUTO_3220 ?AUTO_3221 )
      ( DELIVER-PKG ?AUTO_3218 ?AUTO_3219 )
      ( DELIVER-PKG-VERIFY ?AUTO_3218 ?AUTO_3219 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3723 - OBJ
      ?AUTO_3724 - LOCATION
    )
    :vars
    (
      ?AUTO_3727 - TRUCK
      ?AUTO_3729 - LOCATION
      ?AUTO_3728 - CITY
      ?AUTO_3725 - LOCATION
      ?AUTO_3726 - AIRPLANE
      ?AUTO_3730 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3727 ?AUTO_3729 ) ( IN-CITY ?AUTO_3729 ?AUTO_3728 ) ( IN-CITY ?AUTO_3724 ?AUTO_3728 ) ( not ( = ?AUTO_3724 ?AUTO_3729 ) ) ( AIRPORT ?AUTO_3725 ) ( AIRPORT ?AUTO_3729 ) ( not ( = ?AUTO_3725 ?AUTO_3729 ) ) ( not ( = ?AUTO_3724 ?AUTO_3725 ) ) ( AIRPLANE-AT ?AUTO_3726 ?AUTO_3729 ) ( TRUCK-AT ?AUTO_3730 ?AUTO_3725 ) ( IN-TRUCK ?AUTO_3723 ?AUTO_3730 ) ( not ( = ?AUTO_3727 ?AUTO_3730 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3723 ?AUTO_3730 ?AUTO_3725 )
      ( DELIVER-PKG ?AUTO_3723 ?AUTO_3724 )
      ( DELIVER-PKG-VERIFY ?AUTO_3723 ?AUTO_3724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3731 - OBJ
      ?AUTO_3732 - LOCATION
    )
    :vars
    (
      ?AUTO_3734 - TRUCK
      ?AUTO_3737 - LOCATION
      ?AUTO_3736 - CITY
      ?AUTO_3733 - LOCATION
      ?AUTO_3735 - AIRPLANE
      ?AUTO_3738 - TRUCK
      ?AUTO_3740 - LOCATION
      ?AUTO_3739 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3734 ?AUTO_3737 ) ( IN-CITY ?AUTO_3737 ?AUTO_3736 ) ( IN-CITY ?AUTO_3732 ?AUTO_3736 ) ( not ( = ?AUTO_3732 ?AUTO_3737 ) ) ( AIRPORT ?AUTO_3733 ) ( AIRPORT ?AUTO_3737 ) ( not ( = ?AUTO_3733 ?AUTO_3737 ) ) ( not ( = ?AUTO_3732 ?AUTO_3733 ) ) ( AIRPLANE-AT ?AUTO_3735 ?AUTO_3737 ) ( IN-TRUCK ?AUTO_3731 ?AUTO_3738 ) ( not ( = ?AUTO_3734 ?AUTO_3738 ) ) ( TRUCK-AT ?AUTO_3738 ?AUTO_3740 ) ( IN-CITY ?AUTO_3740 ?AUTO_3739 ) ( IN-CITY ?AUTO_3733 ?AUTO_3739 ) ( not ( = ?AUTO_3733 ?AUTO_3740 ) ) ( not ( = ?AUTO_3732 ?AUTO_3740 ) ) ( not ( = ?AUTO_3737 ?AUTO_3740 ) ) ( not ( = ?AUTO_3736 ?AUTO_3739 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3738 ?AUTO_3740 ?AUTO_3733 ?AUTO_3739 )
      ( DELIVER-PKG ?AUTO_3731 ?AUTO_3732 )
      ( DELIVER-PKG-VERIFY ?AUTO_3731 ?AUTO_3732 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3741 - OBJ
      ?AUTO_3742 - LOCATION
    )
    :vars
    (
      ?AUTO_3746 - TRUCK
      ?AUTO_3750 - LOCATION
      ?AUTO_3749 - CITY
      ?AUTO_3748 - LOCATION
      ?AUTO_3744 - AIRPLANE
      ?AUTO_3747 - TRUCK
      ?AUTO_3743 - LOCATION
      ?AUTO_3745 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3746 ?AUTO_3750 ) ( IN-CITY ?AUTO_3750 ?AUTO_3749 ) ( IN-CITY ?AUTO_3742 ?AUTO_3749 ) ( not ( = ?AUTO_3742 ?AUTO_3750 ) ) ( AIRPORT ?AUTO_3748 ) ( AIRPORT ?AUTO_3750 ) ( not ( = ?AUTO_3748 ?AUTO_3750 ) ) ( not ( = ?AUTO_3742 ?AUTO_3748 ) ) ( AIRPLANE-AT ?AUTO_3744 ?AUTO_3750 ) ( not ( = ?AUTO_3746 ?AUTO_3747 ) ) ( TRUCK-AT ?AUTO_3747 ?AUTO_3743 ) ( IN-CITY ?AUTO_3743 ?AUTO_3745 ) ( IN-CITY ?AUTO_3748 ?AUTO_3745 ) ( not ( = ?AUTO_3748 ?AUTO_3743 ) ) ( not ( = ?AUTO_3742 ?AUTO_3743 ) ) ( not ( = ?AUTO_3750 ?AUTO_3743 ) ) ( not ( = ?AUTO_3749 ?AUTO_3745 ) ) ( OBJ-AT ?AUTO_3741 ?AUTO_3743 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3741 ?AUTO_3747 ?AUTO_3743 )
      ( DELIVER-PKG ?AUTO_3741 ?AUTO_3742 )
      ( DELIVER-PKG-VERIFY ?AUTO_3741 ?AUTO_3742 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3302 - OBJ
      ?AUTO_3303 - LOCATION
    )
    :vars
    (
      ?AUTO_3306 - LOCATION
      ?AUTO_3308 - CITY
      ?AUTO_3305 - LOCATION
      ?AUTO_3307 - LOCATION
      ?AUTO_3304 - AIRPLANE
      ?AUTO_3309 - TRUCK
      ?AUTO_3310 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3306 ?AUTO_3308 ) ( IN-CITY ?AUTO_3303 ?AUTO_3308 ) ( not ( = ?AUTO_3303 ?AUTO_3306 ) ) ( AIRPORT ?AUTO_3305 ) ( AIRPORT ?AUTO_3306 ) ( not ( = ?AUTO_3305 ?AUTO_3306 ) ) ( not ( = ?AUTO_3303 ?AUTO_3305 ) ) ( OBJ-AT ?AUTO_3302 ?AUTO_3305 ) ( AIRPORT ?AUTO_3307 ) ( AIRPLANE-AT ?AUTO_3304 ?AUTO_3307 ) ( not ( = ?AUTO_3307 ?AUTO_3305 ) ) ( not ( = ?AUTO_3303 ?AUTO_3307 ) ) ( not ( = ?AUTO_3306 ?AUTO_3307 ) ) ( TRUCK-AT ?AUTO_3309 ?AUTO_3310 ) ( IN-CITY ?AUTO_3310 ?AUTO_3308 ) ( not ( = ?AUTO_3306 ?AUTO_3310 ) ) ( not ( = ?AUTO_3303 ?AUTO_3310 ) ) ( not ( = ?AUTO_3305 ?AUTO_3310 ) ) ( not ( = ?AUTO_3307 ?AUTO_3310 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3309 ?AUTO_3310 ?AUTO_3306 ?AUTO_3308 )
      ( DELIVER-PKG ?AUTO_3302 ?AUTO_3303 )
      ( DELIVER-PKG-VERIFY ?AUTO_3302 ?AUTO_3303 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3708 - OBJ
      ?AUTO_3709 - LOCATION
    )
    :vars
    (
      ?AUTO_3711 - TRUCK
      ?AUTO_3714 - LOCATION
      ?AUTO_3713 - CITY
      ?AUTO_3712 - LOCATION
      ?AUTO_3710 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3711 ?AUTO_3714 ) ( IN-CITY ?AUTO_3714 ?AUTO_3713 ) ( IN-CITY ?AUTO_3709 ?AUTO_3713 ) ( not ( = ?AUTO_3709 ?AUTO_3714 ) ) ( AIRPORT ?AUTO_3712 ) ( AIRPORT ?AUTO_3714 ) ( not ( = ?AUTO_3712 ?AUTO_3714 ) ) ( not ( = ?AUTO_3709 ?AUTO_3712 ) ) ( OBJ-AT ?AUTO_3708 ?AUTO_3712 ) ( AIRPLANE-AT ?AUTO_3710 ?AUTO_3714 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3710 ?AUTO_3714 ?AUTO_3712 )
      ( DELIVER-PKG ?AUTO_3708 ?AUTO_3709 )
      ( DELIVER-PKG-VERIFY ?AUTO_3708 ?AUTO_3709 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3751 - OBJ
      ?AUTO_3752 - LOCATION
    )
    :vars
    (
      ?AUTO_3754 - TRUCK
      ?AUTO_3755 - LOCATION
      ?AUTO_3757 - CITY
      ?AUTO_3753 - LOCATION
      ?AUTO_3760 - AIRPLANE
      ?AUTO_3758 - TRUCK
      ?AUTO_3756 - LOCATION
      ?AUTO_3759 - CITY
      ?AUTO_3761 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3754 ?AUTO_3755 ) ( IN-CITY ?AUTO_3755 ?AUTO_3757 ) ( IN-CITY ?AUTO_3752 ?AUTO_3757 ) ( not ( = ?AUTO_3752 ?AUTO_3755 ) ) ( AIRPORT ?AUTO_3753 ) ( AIRPORT ?AUTO_3755 ) ( not ( = ?AUTO_3753 ?AUTO_3755 ) ) ( not ( = ?AUTO_3752 ?AUTO_3753 ) ) ( AIRPLANE-AT ?AUTO_3760 ?AUTO_3755 ) ( not ( = ?AUTO_3754 ?AUTO_3758 ) ) ( IN-CITY ?AUTO_3756 ?AUTO_3759 ) ( IN-CITY ?AUTO_3753 ?AUTO_3759 ) ( not ( = ?AUTO_3753 ?AUTO_3756 ) ) ( not ( = ?AUTO_3752 ?AUTO_3756 ) ) ( not ( = ?AUTO_3755 ?AUTO_3756 ) ) ( not ( = ?AUTO_3757 ?AUTO_3759 ) ) ( OBJ-AT ?AUTO_3751 ?AUTO_3756 ) ( TRUCK-AT ?AUTO_3758 ?AUTO_3761 ) ( IN-CITY ?AUTO_3761 ?AUTO_3759 ) ( not ( = ?AUTO_3756 ?AUTO_3761 ) ) ( not ( = ?AUTO_3752 ?AUTO_3761 ) ) ( not ( = ?AUTO_3755 ?AUTO_3761 ) ) ( not ( = ?AUTO_3753 ?AUTO_3761 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3758 ?AUTO_3761 ?AUTO_3756 ?AUTO_3759 )
      ( DELIVER-PKG ?AUTO_3751 ?AUTO_3752 )
      ( DELIVER-PKG-VERIFY ?AUTO_3751 ?AUTO_3752 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3770 - OBJ
      ?AUTO_3771 - LOCATION
    )
    :vars
    (
      ?AUTO_3772 - LOCATION
      ?AUTO_3773 - CITY
      ?AUTO_3775 - LOCATION
      ?AUTO_3776 - AIRPLANE
      ?AUTO_3780 - TRUCK
      ?AUTO_3778 - TRUCK
      ?AUTO_3779 - LOCATION
      ?AUTO_3774 - CITY
      ?AUTO_3777 - LOCATION
      ?AUTO_3781 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3772 ?AUTO_3773 ) ( IN-CITY ?AUTO_3771 ?AUTO_3773 ) ( not ( = ?AUTO_3771 ?AUTO_3772 ) ) ( AIRPORT ?AUTO_3775 ) ( AIRPORT ?AUTO_3772 ) ( not ( = ?AUTO_3775 ?AUTO_3772 ) ) ( not ( = ?AUTO_3771 ?AUTO_3775 ) ) ( AIRPLANE-AT ?AUTO_3776 ?AUTO_3772 ) ( not ( = ?AUTO_3780 ?AUTO_3778 ) ) ( IN-CITY ?AUTO_3779 ?AUTO_3774 ) ( IN-CITY ?AUTO_3775 ?AUTO_3774 ) ( not ( = ?AUTO_3775 ?AUTO_3779 ) ) ( not ( = ?AUTO_3771 ?AUTO_3779 ) ) ( not ( = ?AUTO_3772 ?AUTO_3779 ) ) ( not ( = ?AUTO_3773 ?AUTO_3774 ) ) ( OBJ-AT ?AUTO_3770 ?AUTO_3779 ) ( TRUCK-AT ?AUTO_3778 ?AUTO_3777 ) ( IN-CITY ?AUTO_3777 ?AUTO_3774 ) ( not ( = ?AUTO_3779 ?AUTO_3777 ) ) ( not ( = ?AUTO_3771 ?AUTO_3777 ) ) ( not ( = ?AUTO_3772 ?AUTO_3777 ) ) ( not ( = ?AUTO_3775 ?AUTO_3777 ) ) ( TRUCK-AT ?AUTO_3780 ?AUTO_3781 ) ( IN-CITY ?AUTO_3781 ?AUTO_3773 ) ( not ( = ?AUTO_3772 ?AUTO_3781 ) ) ( not ( = ?AUTO_3771 ?AUTO_3781 ) ) ( not ( = ?AUTO_3775 ?AUTO_3781 ) ) ( not ( = ?AUTO_3779 ?AUTO_3781 ) ) ( not ( = ?AUTO_3777 ?AUTO_3781 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3780 ?AUTO_3781 ?AUTO_3772 ?AUTO_3773 )
      ( DELIVER-PKG ?AUTO_3770 ?AUTO_3771 )
      ( DELIVER-PKG-VERIFY ?AUTO_3770 ?AUTO_3771 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3864 - OBJ
      ?AUTO_3865 - LOCATION
    )
    :vars
    (
      ?AUTO_3866 - LOCATION
      ?AUTO_3871 - CITY
      ?AUTO_3872 - LOCATION
      ?AUTO_3869 - AIRPLANE
      ?AUTO_3873 - TRUCK
      ?AUTO_3868 - TRUCK
      ?AUTO_3870 - LOCATION
      ?AUTO_3867 - CITY
      ?AUTO_3874 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3866 ?AUTO_3871 ) ( IN-CITY ?AUTO_3865 ?AUTO_3871 ) ( not ( = ?AUTO_3865 ?AUTO_3866 ) ) ( AIRPORT ?AUTO_3872 ) ( AIRPORT ?AUTO_3866 ) ( not ( = ?AUTO_3872 ?AUTO_3866 ) ) ( not ( = ?AUTO_3865 ?AUTO_3872 ) ) ( AIRPLANE-AT ?AUTO_3869 ?AUTO_3866 ) ( IN-TRUCK ?AUTO_3864 ?AUTO_3873 ) ( not ( = ?AUTO_3868 ?AUTO_3873 ) ) ( TRUCK-AT ?AUTO_3873 ?AUTO_3870 ) ( IN-CITY ?AUTO_3870 ?AUTO_3867 ) ( IN-CITY ?AUTO_3872 ?AUTO_3867 ) ( not ( = ?AUTO_3872 ?AUTO_3870 ) ) ( not ( = ?AUTO_3865 ?AUTO_3870 ) ) ( not ( = ?AUTO_3866 ?AUTO_3870 ) ) ( not ( = ?AUTO_3871 ?AUTO_3867 ) ) ( TRUCK-AT ?AUTO_3868 ?AUTO_3874 ) ( IN-CITY ?AUTO_3874 ?AUTO_3871 ) ( not ( = ?AUTO_3866 ?AUTO_3874 ) ) ( not ( = ?AUTO_3865 ?AUTO_3874 ) ) ( not ( = ?AUTO_3872 ?AUTO_3874 ) ) ( not ( = ?AUTO_3870 ?AUTO_3874 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3868 ?AUTO_3874 ?AUTO_3866 ?AUTO_3871 )
      ( DELIVER-PKG ?AUTO_3864 ?AUTO_3865 )
      ( DELIVER-PKG-VERIFY ?AUTO_3864 ?AUTO_3865 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3877 - OBJ
      ?AUTO_3878 - LOCATION
    )
    :vars
    (
      ?AUTO_3882 - LOCATION
      ?AUTO_3887 - CITY
      ?AUTO_3884 - LOCATION
      ?AUTO_3885 - AIRPLANE
      ?AUTO_3886 - TRUCK
      ?AUTO_3880 - TRUCK
      ?AUTO_3883 - LOCATION
      ?AUTO_3879 - CITY
      ?AUTO_3881 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3882 ?AUTO_3887 ) ( IN-CITY ?AUTO_3878 ?AUTO_3887 ) ( not ( = ?AUTO_3878 ?AUTO_3882 ) ) ( AIRPORT ?AUTO_3884 ) ( AIRPORT ?AUTO_3882 ) ( not ( = ?AUTO_3884 ?AUTO_3882 ) ) ( not ( = ?AUTO_3878 ?AUTO_3884 ) ) ( AIRPLANE-AT ?AUTO_3885 ?AUTO_3882 ) ( not ( = ?AUTO_3886 ?AUTO_3880 ) ) ( TRUCK-AT ?AUTO_3880 ?AUTO_3883 ) ( IN-CITY ?AUTO_3883 ?AUTO_3879 ) ( IN-CITY ?AUTO_3884 ?AUTO_3879 ) ( not ( = ?AUTO_3884 ?AUTO_3883 ) ) ( not ( = ?AUTO_3878 ?AUTO_3883 ) ) ( not ( = ?AUTO_3882 ?AUTO_3883 ) ) ( not ( = ?AUTO_3887 ?AUTO_3879 ) ) ( TRUCK-AT ?AUTO_3886 ?AUTO_3881 ) ( IN-CITY ?AUTO_3881 ?AUTO_3887 ) ( not ( = ?AUTO_3882 ?AUTO_3881 ) ) ( not ( = ?AUTO_3878 ?AUTO_3881 ) ) ( not ( = ?AUTO_3884 ?AUTO_3881 ) ) ( not ( = ?AUTO_3883 ?AUTO_3881 ) ) ( OBJ-AT ?AUTO_3877 ?AUTO_3883 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3877 ?AUTO_3880 ?AUTO_3883 )
      ( DELIVER-PKG ?AUTO_3877 ?AUTO_3878 )
      ( DELIVER-PKG-VERIFY ?AUTO_3877 ?AUTO_3878 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4491 - OBJ
      ?AUTO_4492 - LOCATION
    )
    :vars
    (
      ?AUTO_4496 - TRUCK
      ?AUTO_4495 - LOCATION
      ?AUTO_4500 - CITY
      ?AUTO_4499 - LOCATION
      ?AUTO_4497 - AIRPLANE
      ?AUTO_4494 - TRUCK
      ?AUTO_4498 - LOCATION
      ?AUTO_4493 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4496 ?AUTO_4495 ) ( IN-CITY ?AUTO_4495 ?AUTO_4500 ) ( IN-CITY ?AUTO_4492 ?AUTO_4500 ) ( not ( = ?AUTO_4492 ?AUTO_4495 ) ) ( AIRPORT ?AUTO_4499 ) ( AIRPORT ?AUTO_4495 ) ( AIRPLANE-AT ?AUTO_4497 ?AUTO_4499 ) ( not ( = ?AUTO_4499 ?AUTO_4495 ) ) ( not ( = ?AUTO_4492 ?AUTO_4499 ) ) ( not ( = ?AUTO_4496 ?AUTO_4494 ) ) ( IN-CITY ?AUTO_4498 ?AUTO_4493 ) ( IN-CITY ?AUTO_4499 ?AUTO_4493 ) ( not ( = ?AUTO_4499 ?AUTO_4498 ) ) ( not ( = ?AUTO_4492 ?AUTO_4498 ) ) ( not ( = ?AUTO_4495 ?AUTO_4498 ) ) ( not ( = ?AUTO_4500 ?AUTO_4493 ) ) ( OBJ-AT ?AUTO_4491 ?AUTO_4498 ) ( TRUCK-AT ?AUTO_4494 ?AUTO_4499 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4494 ?AUTO_4499 ?AUTO_4498 ?AUTO_4493 )
      ( DELIVER-PKG ?AUTO_4491 ?AUTO_4492 )
      ( DELIVER-PKG-VERIFY ?AUTO_4491 ?AUTO_4492 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4774 - OBJ
      ?AUTO_4775 - LOCATION
    )
    :vars
    (
      ?AUTO_4782 - LOCATION
      ?AUTO_4777 - CITY
      ?AUTO_4776 - TRUCK
      ?AUTO_4778 - LOCATION
      ?AUTO_4779 - LOCATION
      ?AUTO_4780 - LOCATION
      ?AUTO_4781 - AIRPLANE
      ?AUTO_4783 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4782 ?AUTO_4777 ) ( IN-CITY ?AUTO_4775 ?AUTO_4777 ) ( not ( = ?AUTO_4775 ?AUTO_4782 ) ) ( TRUCK-AT ?AUTO_4776 ?AUTO_4778 ) ( IN-CITY ?AUTO_4778 ?AUTO_4777 ) ( not ( = ?AUTO_4782 ?AUTO_4778 ) ) ( not ( = ?AUTO_4775 ?AUTO_4778 ) ) ( AIRPORT ?AUTO_4779 ) ( AIRPORT ?AUTO_4782 ) ( not ( = ?AUTO_4779 ?AUTO_4782 ) ) ( not ( = ?AUTO_4775 ?AUTO_4779 ) ) ( not ( = ?AUTO_4778 ?AUTO_4779 ) ) ( AIRPORT ?AUTO_4780 ) ( AIRPLANE-AT ?AUTO_4781 ?AUTO_4780 ) ( not ( = ?AUTO_4780 ?AUTO_4779 ) ) ( not ( = ?AUTO_4775 ?AUTO_4780 ) ) ( not ( = ?AUTO_4782 ?AUTO_4780 ) ) ( not ( = ?AUTO_4778 ?AUTO_4780 ) ) ( TRUCK-AT ?AUTO_4783 ?AUTO_4779 ) ( IN-TRUCK ?AUTO_4774 ?AUTO_4783 ) ( not ( = ?AUTO_4776 ?AUTO_4783 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4774 ?AUTO_4783 ?AUTO_4779 )
      ( DELIVER-PKG ?AUTO_4774 ?AUTO_4775 )
      ( DELIVER-PKG-VERIFY ?AUTO_4774 ?AUTO_4775 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4788 - OBJ
      ?AUTO_4789 - LOCATION
    )
    :vars
    (
      ?AUTO_4790 - LOCATION
      ?AUTO_4792 - CITY
      ?AUTO_4795 - TRUCK
      ?AUTO_4794 - LOCATION
      ?AUTO_4797 - LOCATION
      ?AUTO_4793 - LOCATION
      ?AUTO_4791 - AIRPLANE
      ?AUTO_4796 - TRUCK
      ?AUTO_4799 - LOCATION
      ?AUTO_4798 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4790 ?AUTO_4792 ) ( IN-CITY ?AUTO_4789 ?AUTO_4792 ) ( not ( = ?AUTO_4789 ?AUTO_4790 ) ) ( TRUCK-AT ?AUTO_4795 ?AUTO_4794 ) ( IN-CITY ?AUTO_4794 ?AUTO_4792 ) ( not ( = ?AUTO_4790 ?AUTO_4794 ) ) ( not ( = ?AUTO_4789 ?AUTO_4794 ) ) ( AIRPORT ?AUTO_4797 ) ( AIRPORT ?AUTO_4790 ) ( not ( = ?AUTO_4797 ?AUTO_4790 ) ) ( not ( = ?AUTO_4789 ?AUTO_4797 ) ) ( not ( = ?AUTO_4794 ?AUTO_4797 ) ) ( AIRPORT ?AUTO_4793 ) ( AIRPLANE-AT ?AUTO_4791 ?AUTO_4793 ) ( not ( = ?AUTO_4793 ?AUTO_4797 ) ) ( not ( = ?AUTO_4789 ?AUTO_4793 ) ) ( not ( = ?AUTO_4790 ?AUTO_4793 ) ) ( not ( = ?AUTO_4794 ?AUTO_4793 ) ) ( IN-TRUCK ?AUTO_4788 ?AUTO_4796 ) ( not ( = ?AUTO_4795 ?AUTO_4796 ) ) ( TRUCK-AT ?AUTO_4796 ?AUTO_4799 ) ( IN-CITY ?AUTO_4799 ?AUTO_4798 ) ( IN-CITY ?AUTO_4797 ?AUTO_4798 ) ( not ( = ?AUTO_4797 ?AUTO_4799 ) ) ( not ( = ?AUTO_4789 ?AUTO_4799 ) ) ( not ( = ?AUTO_4790 ?AUTO_4799 ) ) ( not ( = ?AUTO_4792 ?AUTO_4798 ) ) ( not ( = ?AUTO_4794 ?AUTO_4799 ) ) ( not ( = ?AUTO_4793 ?AUTO_4799 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4796 ?AUTO_4799 ?AUTO_4797 ?AUTO_4798 )
      ( DELIVER-PKG ?AUTO_4788 ?AUTO_4789 )
      ( DELIVER-PKG-VERIFY ?AUTO_4788 ?AUTO_4789 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4800 - OBJ
      ?AUTO_4801 - LOCATION
    )
    :vars
    (
      ?AUTO_4806 - LOCATION
      ?AUTO_4810 - CITY
      ?AUTO_4804 - TRUCK
      ?AUTO_4811 - LOCATION
      ?AUTO_4802 - LOCATION
      ?AUTO_4809 - LOCATION
      ?AUTO_4803 - AIRPLANE
      ?AUTO_4805 - TRUCK
      ?AUTO_4807 - LOCATION
      ?AUTO_4808 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4806 ?AUTO_4810 ) ( IN-CITY ?AUTO_4801 ?AUTO_4810 ) ( not ( = ?AUTO_4801 ?AUTO_4806 ) ) ( TRUCK-AT ?AUTO_4804 ?AUTO_4811 ) ( IN-CITY ?AUTO_4811 ?AUTO_4810 ) ( not ( = ?AUTO_4806 ?AUTO_4811 ) ) ( not ( = ?AUTO_4801 ?AUTO_4811 ) ) ( AIRPORT ?AUTO_4802 ) ( AIRPORT ?AUTO_4806 ) ( not ( = ?AUTO_4802 ?AUTO_4806 ) ) ( not ( = ?AUTO_4801 ?AUTO_4802 ) ) ( not ( = ?AUTO_4811 ?AUTO_4802 ) ) ( AIRPORT ?AUTO_4809 ) ( AIRPLANE-AT ?AUTO_4803 ?AUTO_4809 ) ( not ( = ?AUTO_4809 ?AUTO_4802 ) ) ( not ( = ?AUTO_4801 ?AUTO_4809 ) ) ( not ( = ?AUTO_4806 ?AUTO_4809 ) ) ( not ( = ?AUTO_4811 ?AUTO_4809 ) ) ( not ( = ?AUTO_4804 ?AUTO_4805 ) ) ( TRUCK-AT ?AUTO_4805 ?AUTO_4807 ) ( IN-CITY ?AUTO_4807 ?AUTO_4808 ) ( IN-CITY ?AUTO_4802 ?AUTO_4808 ) ( not ( = ?AUTO_4802 ?AUTO_4807 ) ) ( not ( = ?AUTO_4801 ?AUTO_4807 ) ) ( not ( = ?AUTO_4806 ?AUTO_4807 ) ) ( not ( = ?AUTO_4810 ?AUTO_4808 ) ) ( not ( = ?AUTO_4811 ?AUTO_4807 ) ) ( not ( = ?AUTO_4809 ?AUTO_4807 ) ) ( OBJ-AT ?AUTO_4800 ?AUTO_4807 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4800 ?AUTO_4805 ?AUTO_4807 )
      ( DELIVER-PKG ?AUTO_4800 ?AUTO_4801 )
      ( DELIVER-PKG-VERIFY ?AUTO_4800 ?AUTO_4801 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4956 - OBJ
      ?AUTO_4957 - LOCATION
    )
    :vars
    (
      ?AUTO_4959 - LOCATION
      ?AUTO_4960 - CITY
      ?AUTO_4958 - LOCATION
      ?AUTO_4961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4959 ?AUTO_4960 ) ( IN-CITY ?AUTO_4957 ?AUTO_4960 ) ( not ( = ?AUTO_4957 ?AUTO_4959 ) ) ( OBJ-AT ?AUTO_4956 ?AUTO_4959 ) ( IN-CITY ?AUTO_4958 ?AUTO_4960 ) ( not ( = ?AUTO_4959 ?AUTO_4958 ) ) ( not ( = ?AUTO_4957 ?AUTO_4958 ) ) ( TRUCK-AT ?AUTO_4961 ?AUTO_4957 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4961 ?AUTO_4957 ?AUTO_4958 ?AUTO_4960 )
      ( DELIVER-PKG ?AUTO_4956 ?AUTO_4957 )
      ( DELIVER-PKG-VERIFY ?AUTO_4956 ?AUTO_4957 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6551 - OBJ
      ?AUTO_6552 - LOCATION
    )
    :vars
    (
      ?AUTO_6558 - LOCATION
      ?AUTO_6555 - CITY
      ?AUTO_6557 - TRUCK
      ?AUTO_6560 - LOCATION
      ?AUTO_6561 - LOCATION
      ?AUTO_6554 - AIRPLANE
      ?AUTO_6556 - TRUCK
      ?AUTO_6559 - LOCATION
      ?AUTO_6553 - CITY
      ?AUTO_6562 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6558 ?AUTO_6555 ) ( IN-CITY ?AUTO_6552 ?AUTO_6555 ) ( not ( = ?AUTO_6552 ?AUTO_6558 ) ) ( TRUCK-AT ?AUTO_6557 ?AUTO_6552 ) ( AIRPORT ?AUTO_6560 ) ( AIRPORT ?AUTO_6558 ) ( not ( = ?AUTO_6560 ?AUTO_6558 ) ) ( not ( = ?AUTO_6552 ?AUTO_6560 ) ) ( AIRPORT ?AUTO_6561 ) ( AIRPLANE-AT ?AUTO_6554 ?AUTO_6561 ) ( not ( = ?AUTO_6561 ?AUTO_6560 ) ) ( not ( = ?AUTO_6552 ?AUTO_6561 ) ) ( not ( = ?AUTO_6558 ?AUTO_6561 ) ) ( not ( = ?AUTO_6557 ?AUTO_6556 ) ) ( IN-CITY ?AUTO_6559 ?AUTO_6553 ) ( IN-CITY ?AUTO_6560 ?AUTO_6553 ) ( not ( = ?AUTO_6560 ?AUTO_6559 ) ) ( not ( = ?AUTO_6552 ?AUTO_6559 ) ) ( not ( = ?AUTO_6558 ?AUTO_6559 ) ) ( not ( = ?AUTO_6555 ?AUTO_6553 ) ) ( not ( = ?AUTO_6561 ?AUTO_6559 ) ) ( OBJ-AT ?AUTO_6551 ?AUTO_6559 ) ( TRUCK-AT ?AUTO_6556 ?AUTO_6562 ) ( IN-CITY ?AUTO_6562 ?AUTO_6553 ) ( not ( = ?AUTO_6559 ?AUTO_6562 ) ) ( not ( = ?AUTO_6552 ?AUTO_6562 ) ) ( not ( = ?AUTO_6558 ?AUTO_6562 ) ) ( not ( = ?AUTO_6560 ?AUTO_6562 ) ) ( not ( = ?AUTO_6561 ?AUTO_6562 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6556 ?AUTO_6562 ?AUTO_6559 ?AUTO_6553 )
      ( DELIVER-PKG ?AUTO_6551 ?AUTO_6552 )
      ( DELIVER-PKG-VERIFY ?AUTO_6551 ?AUTO_6552 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5470 - OBJ
      ?AUTO_5471 - LOCATION
    )
    :vars
    (
      ?AUTO_5473 - LOCATION
      ?AUTO_5478 - CITY
      ?AUTO_5472 - TRUCK
      ?AUTO_5477 - LOCATION
      ?AUTO_5479 - AIRPLANE
      ?AUTO_5474 - TRUCK
      ?AUTO_5476 - LOCATION
      ?AUTO_5475 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5473 ?AUTO_5478 ) ( IN-CITY ?AUTO_5471 ?AUTO_5478 ) ( not ( = ?AUTO_5471 ?AUTO_5473 ) ) ( TRUCK-AT ?AUTO_5472 ?AUTO_5471 ) ( AIRPORT ?AUTO_5477 ) ( AIRPORT ?AUTO_5473 ) ( AIRPLANE-AT ?AUTO_5479 ?AUTO_5477 ) ( not ( = ?AUTO_5477 ?AUTO_5473 ) ) ( not ( = ?AUTO_5471 ?AUTO_5477 ) ) ( not ( = ?AUTO_5472 ?AUTO_5474 ) ) ( IN-CITY ?AUTO_5476 ?AUTO_5475 ) ( IN-CITY ?AUTO_5477 ?AUTO_5475 ) ( not ( = ?AUTO_5477 ?AUTO_5476 ) ) ( not ( = ?AUTO_5471 ?AUTO_5476 ) ) ( not ( = ?AUTO_5473 ?AUTO_5476 ) ) ( not ( = ?AUTO_5478 ?AUTO_5475 ) ) ( OBJ-AT ?AUTO_5470 ?AUTO_5476 ) ( TRUCK-AT ?AUTO_5474 ?AUTO_5477 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5474 ?AUTO_5477 ?AUTO_5476 ?AUTO_5475 )
      ( DELIVER-PKG ?AUTO_5470 ?AUTO_5471 )
      ( DELIVER-PKG-VERIFY ?AUTO_5470 ?AUTO_5471 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5540 - OBJ
      ?AUTO_5541 - LOCATION
    )
    :vars
    (
      ?AUTO_5545 - LOCATION
      ?AUTO_5543 - CITY
      ?AUTO_5542 - TRUCK
      ?AUTO_5544 - LOCATION
      ?AUTO_5546 - LOCATION
      ?AUTO_5547 - AIRPLANE
      ?AUTO_5548 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5545 ?AUTO_5543 ) ( IN-CITY ?AUTO_5541 ?AUTO_5543 ) ( not ( = ?AUTO_5541 ?AUTO_5545 ) ) ( TRUCK-AT ?AUTO_5542 ?AUTO_5544 ) ( IN-CITY ?AUTO_5544 ?AUTO_5543 ) ( not ( = ?AUTO_5545 ?AUTO_5544 ) ) ( not ( = ?AUTO_5541 ?AUTO_5544 ) ) ( AIRPORT ?AUTO_5546 ) ( AIRPORT ?AUTO_5545 ) ( AIRPLANE-AT ?AUTO_5547 ?AUTO_5546 ) ( not ( = ?AUTO_5546 ?AUTO_5545 ) ) ( not ( = ?AUTO_5541 ?AUTO_5546 ) ) ( not ( = ?AUTO_5544 ?AUTO_5546 ) ) ( TRUCK-AT ?AUTO_5548 ?AUTO_5546 ) ( IN-TRUCK ?AUTO_5540 ?AUTO_5548 ) ( not ( = ?AUTO_5542 ?AUTO_5548 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5540 ?AUTO_5548 ?AUTO_5546 )
      ( DELIVER-PKG ?AUTO_5540 ?AUTO_5541 )
      ( DELIVER-PKG-VERIFY ?AUTO_5540 ?AUTO_5541 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5575 - OBJ
      ?AUTO_5576 - LOCATION
    )
    :vars
    (
      ?AUTO_5584 - LOCATION
      ?AUTO_5580 - CITY
      ?AUTO_5585 - TRUCK
      ?AUTO_5579 - LOCATION
      ?AUTO_5582 - LOCATION
      ?AUTO_5583 - AIRPLANE
      ?AUTO_5581 - TRUCK
      ?AUTO_5577 - LOCATION
      ?AUTO_5578 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5584 ?AUTO_5580 ) ( IN-CITY ?AUTO_5576 ?AUTO_5580 ) ( not ( = ?AUTO_5576 ?AUTO_5584 ) ) ( TRUCK-AT ?AUTO_5585 ?AUTO_5579 ) ( IN-CITY ?AUTO_5579 ?AUTO_5580 ) ( not ( = ?AUTO_5584 ?AUTO_5579 ) ) ( not ( = ?AUTO_5576 ?AUTO_5579 ) ) ( AIRPORT ?AUTO_5582 ) ( AIRPORT ?AUTO_5584 ) ( AIRPLANE-AT ?AUTO_5583 ?AUTO_5582 ) ( not ( = ?AUTO_5582 ?AUTO_5584 ) ) ( not ( = ?AUTO_5576 ?AUTO_5582 ) ) ( not ( = ?AUTO_5579 ?AUTO_5582 ) ) ( not ( = ?AUTO_5585 ?AUTO_5581 ) ) ( IN-CITY ?AUTO_5577 ?AUTO_5578 ) ( IN-CITY ?AUTO_5582 ?AUTO_5578 ) ( not ( = ?AUTO_5582 ?AUTO_5577 ) ) ( not ( = ?AUTO_5576 ?AUTO_5577 ) ) ( not ( = ?AUTO_5584 ?AUTO_5577 ) ) ( not ( = ?AUTO_5580 ?AUTO_5578 ) ) ( not ( = ?AUTO_5579 ?AUTO_5577 ) ) ( OBJ-AT ?AUTO_5575 ?AUTO_5577 ) ( TRUCK-AT ?AUTO_5581 ?AUTO_5582 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5581 ?AUTO_5582 ?AUTO_5577 ?AUTO_5578 )
      ( DELIVER-PKG ?AUTO_5575 ?AUTO_5576 )
      ( DELIVER-PKG-VERIFY ?AUTO_5575 ?AUTO_5576 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6021 - OBJ
      ?AUTO_6022 - LOCATION
    )
    :vars
    (
      ?AUTO_6024 - LOCATION
      ?AUTO_6026 - LOCATION
      ?AUTO_6025 - AIRPLANE
      ?AUTO_6027 - LOCATION
      ?AUTO_6023 - CITY
      ?AUTO_6028 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_6024 ) ( AIRPORT ?AUTO_6022 ) ( not ( = ?AUTO_6024 ?AUTO_6022 ) ) ( AIRPORT ?AUTO_6026 ) ( AIRPLANE-AT ?AUTO_6025 ?AUTO_6026 ) ( not ( = ?AUTO_6026 ?AUTO_6024 ) ) ( not ( = ?AUTO_6022 ?AUTO_6026 ) ) ( IN-CITY ?AUTO_6027 ?AUTO_6023 ) ( IN-CITY ?AUTO_6024 ?AUTO_6023 ) ( not ( = ?AUTO_6024 ?AUTO_6027 ) ) ( not ( = ?AUTO_6022 ?AUTO_6027 ) ) ( not ( = ?AUTO_6026 ?AUTO_6027 ) ) ( OBJ-AT ?AUTO_6021 ?AUTO_6027 ) ( TRUCK-AT ?AUTO_6028 ?AUTO_6024 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6028 ?AUTO_6024 ?AUTO_6027 ?AUTO_6023 )
      ( DELIVER-PKG ?AUTO_6021 ?AUTO_6022 )
      ( DELIVER-PKG-VERIFY ?AUTO_6021 ?AUTO_6022 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6362 - OBJ
      ?AUTO_6363 - LOCATION
    )
    :vars
    (
      ?AUTO_6367 - TRUCK
      ?AUTO_6371 - LOCATION
      ?AUTO_6370 - CITY
      ?AUTO_6366 - LOCATION
      ?AUTO_6368 - LOCATION
      ?AUTO_6364 - AIRPLANE
      ?AUTO_6372 - TRUCK
      ?AUTO_6369 - LOCATION
      ?AUTO_6365 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6367 ?AUTO_6371 ) ( IN-CITY ?AUTO_6371 ?AUTO_6370 ) ( IN-CITY ?AUTO_6363 ?AUTO_6370 ) ( not ( = ?AUTO_6363 ?AUTO_6371 ) ) ( AIRPORT ?AUTO_6366 ) ( AIRPORT ?AUTO_6371 ) ( not ( = ?AUTO_6366 ?AUTO_6371 ) ) ( not ( = ?AUTO_6363 ?AUTO_6366 ) ) ( AIRPORT ?AUTO_6368 ) ( AIRPLANE-AT ?AUTO_6364 ?AUTO_6368 ) ( not ( = ?AUTO_6368 ?AUTO_6366 ) ) ( not ( = ?AUTO_6363 ?AUTO_6368 ) ) ( not ( = ?AUTO_6371 ?AUTO_6368 ) ) ( not ( = ?AUTO_6367 ?AUTO_6372 ) ) ( IN-CITY ?AUTO_6369 ?AUTO_6365 ) ( IN-CITY ?AUTO_6366 ?AUTO_6365 ) ( not ( = ?AUTO_6366 ?AUTO_6369 ) ) ( not ( = ?AUTO_6363 ?AUTO_6369 ) ) ( not ( = ?AUTO_6371 ?AUTO_6369 ) ) ( not ( = ?AUTO_6370 ?AUTO_6365 ) ) ( not ( = ?AUTO_6368 ?AUTO_6369 ) ) ( OBJ-AT ?AUTO_6362 ?AUTO_6369 ) ( TRUCK-AT ?AUTO_6372 ?AUTO_6366 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6372 ?AUTO_6366 ?AUTO_6369 ?AUTO_6365 )
      ( DELIVER-PKG ?AUTO_6362 ?AUTO_6363 )
      ( DELIVER-PKG-VERIFY ?AUTO_6362 ?AUTO_6363 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6765 - OBJ
      ?AUTO_6766 - LOCATION
    )
    :vars
    (
      ?AUTO_6770 - TRUCK
      ?AUTO_6768 - LOCATION
      ?AUTO_6769 - CITY
      ?AUTO_6771 - LOCATION
      ?AUTO_6772 - TRUCK
      ?AUTO_6773 - LOCATION
      ?AUTO_6774 - CITY
      ?AUTO_6775 - LOCATION
      ?AUTO_6767 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_6770 ?AUTO_6768 ) ( IN-CITY ?AUTO_6768 ?AUTO_6769 ) ( IN-CITY ?AUTO_6766 ?AUTO_6769 ) ( not ( = ?AUTO_6766 ?AUTO_6768 ) ) ( AIRPORT ?AUTO_6771 ) ( AIRPORT ?AUTO_6768 ) ( not ( = ?AUTO_6771 ?AUTO_6768 ) ) ( not ( = ?AUTO_6766 ?AUTO_6771 ) ) ( IN-TRUCK ?AUTO_6765 ?AUTO_6772 ) ( not ( = ?AUTO_6770 ?AUTO_6772 ) ) ( TRUCK-AT ?AUTO_6772 ?AUTO_6773 ) ( IN-CITY ?AUTO_6773 ?AUTO_6774 ) ( IN-CITY ?AUTO_6771 ?AUTO_6774 ) ( not ( = ?AUTO_6771 ?AUTO_6773 ) ) ( not ( = ?AUTO_6766 ?AUTO_6773 ) ) ( not ( = ?AUTO_6768 ?AUTO_6773 ) ) ( not ( = ?AUTO_6769 ?AUTO_6774 ) ) ( AIRPORT ?AUTO_6775 ) ( AIRPLANE-AT ?AUTO_6767 ?AUTO_6775 ) ( not ( = ?AUTO_6775 ?AUTO_6771 ) ) ( not ( = ?AUTO_6766 ?AUTO_6775 ) ) ( not ( = ?AUTO_6768 ?AUTO_6775 ) ) ( not ( = ?AUTO_6773 ?AUTO_6775 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6767 ?AUTO_6775 ?AUTO_6771 )
      ( DELIVER-PKG ?AUTO_6765 ?AUTO_6766 )
      ( DELIVER-PKG-VERIFY ?AUTO_6765 ?AUTO_6766 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7285 - OBJ
      ?AUTO_7286 - LOCATION
    )
    :vars
    (
      ?AUTO_7291 - LOCATION
      ?AUTO_7290 - CITY
      ?AUTO_7287 - LOCATION
      ?AUTO_7288 - AIRPLANE
      ?AUTO_7289 - TRUCK
      ?AUTO_7292 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7291 ?AUTO_7290 ) ( IN-CITY ?AUTO_7286 ?AUTO_7290 ) ( not ( = ?AUTO_7286 ?AUTO_7291 ) ) ( AIRPORT ?AUTO_7287 ) ( AIRPORT ?AUTO_7291 ) ( not ( = ?AUTO_7287 ?AUTO_7291 ) ) ( not ( = ?AUTO_7286 ?AUTO_7287 ) ) ( OBJ-AT ?AUTO_7285 ?AUTO_7287 ) ( AIRPLANE-AT ?AUTO_7288 ?AUTO_7291 ) ( TRUCK-AT ?AUTO_7289 ?AUTO_7292 ) ( IN-CITY ?AUTO_7292 ?AUTO_7290 ) ( not ( = ?AUTO_7286 ?AUTO_7292 ) ) ( not ( = ?AUTO_7291 ?AUTO_7292 ) ) ( not ( = ?AUTO_7287 ?AUTO_7292 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7289 ?AUTO_7292 ?AUTO_7286 ?AUTO_7290 )
      ( DELIVER-PKG ?AUTO_7285 ?AUTO_7286 )
      ( DELIVER-PKG-VERIFY ?AUTO_7285 ?AUTO_7286 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7303 - OBJ
      ?AUTO_7304 - LOCATION
    )
    :vars
    (
      ?AUTO_7310 - LOCATION
      ?AUTO_7305 - CITY
      ?AUTO_7308 - LOCATION
      ?AUTO_7307 - AIRPLANE
      ?AUTO_7309 - TRUCK
      ?AUTO_7306 - LOCATION
      ?AUTO_7311 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7310 ?AUTO_7305 ) ( IN-CITY ?AUTO_7304 ?AUTO_7305 ) ( not ( = ?AUTO_7304 ?AUTO_7310 ) ) ( AIRPORT ?AUTO_7308 ) ( AIRPORT ?AUTO_7310 ) ( not ( = ?AUTO_7308 ?AUTO_7310 ) ) ( not ( = ?AUTO_7304 ?AUTO_7308 ) ) ( AIRPLANE-AT ?AUTO_7307 ?AUTO_7310 ) ( TRUCK-AT ?AUTO_7309 ?AUTO_7306 ) ( IN-CITY ?AUTO_7306 ?AUTO_7305 ) ( not ( = ?AUTO_7304 ?AUTO_7306 ) ) ( not ( = ?AUTO_7310 ?AUTO_7306 ) ) ( not ( = ?AUTO_7308 ?AUTO_7306 ) ) ( TRUCK-AT ?AUTO_7311 ?AUTO_7308 ) ( IN-TRUCK ?AUTO_7303 ?AUTO_7311 ) ( not ( = ?AUTO_7309 ?AUTO_7311 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_7303 ?AUTO_7311 ?AUTO_7308 )
      ( DELIVER-PKG ?AUTO_7303 ?AUTO_7304 )
      ( DELIVER-PKG-VERIFY ?AUTO_7303 ?AUTO_7304 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7312 - OBJ
      ?AUTO_7313 - LOCATION
    )
    :vars
    (
      ?AUTO_7319 - LOCATION
      ?AUTO_7315 - CITY
      ?AUTO_7317 - LOCATION
      ?AUTO_7316 - AIRPLANE
      ?AUTO_7318 - TRUCK
      ?AUTO_7314 - LOCATION
      ?AUTO_7320 - TRUCK
      ?AUTO_7322 - LOCATION
      ?AUTO_7321 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7319 ?AUTO_7315 ) ( IN-CITY ?AUTO_7313 ?AUTO_7315 ) ( not ( = ?AUTO_7313 ?AUTO_7319 ) ) ( AIRPORT ?AUTO_7317 ) ( AIRPORT ?AUTO_7319 ) ( not ( = ?AUTO_7317 ?AUTO_7319 ) ) ( not ( = ?AUTO_7313 ?AUTO_7317 ) ) ( AIRPLANE-AT ?AUTO_7316 ?AUTO_7319 ) ( TRUCK-AT ?AUTO_7318 ?AUTO_7314 ) ( IN-CITY ?AUTO_7314 ?AUTO_7315 ) ( not ( = ?AUTO_7313 ?AUTO_7314 ) ) ( not ( = ?AUTO_7319 ?AUTO_7314 ) ) ( not ( = ?AUTO_7317 ?AUTO_7314 ) ) ( IN-TRUCK ?AUTO_7312 ?AUTO_7320 ) ( not ( = ?AUTO_7318 ?AUTO_7320 ) ) ( TRUCK-AT ?AUTO_7320 ?AUTO_7322 ) ( IN-CITY ?AUTO_7322 ?AUTO_7321 ) ( IN-CITY ?AUTO_7317 ?AUTO_7321 ) ( not ( = ?AUTO_7317 ?AUTO_7322 ) ) ( not ( = ?AUTO_7313 ?AUTO_7322 ) ) ( not ( = ?AUTO_7319 ?AUTO_7322 ) ) ( not ( = ?AUTO_7315 ?AUTO_7321 ) ) ( not ( = ?AUTO_7314 ?AUTO_7322 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7320 ?AUTO_7322 ?AUTO_7317 ?AUTO_7321 )
      ( DELIVER-PKG ?AUTO_7312 ?AUTO_7313 )
      ( DELIVER-PKG-VERIFY ?AUTO_7312 ?AUTO_7313 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7334 - OBJ
      ?AUTO_7335 - LOCATION
    )
    :vars
    (
      ?AUTO_7337 - LOCATION
      ?AUTO_7340 - CITY
      ?AUTO_7342 - LOCATION
      ?AUTO_7344 - AIRPLANE
      ?AUTO_7338 - TRUCK
      ?AUTO_7336 - LOCATION
      ?AUTO_7341 - TRUCK
      ?AUTO_7339 - LOCATION
      ?AUTO_7343 - CITY
      ?AUTO_7345 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7337 ?AUTO_7340 ) ( IN-CITY ?AUTO_7335 ?AUTO_7340 ) ( not ( = ?AUTO_7335 ?AUTO_7337 ) ) ( AIRPORT ?AUTO_7342 ) ( AIRPORT ?AUTO_7337 ) ( not ( = ?AUTO_7342 ?AUTO_7337 ) ) ( not ( = ?AUTO_7335 ?AUTO_7342 ) ) ( AIRPLANE-AT ?AUTO_7344 ?AUTO_7337 ) ( TRUCK-AT ?AUTO_7338 ?AUTO_7336 ) ( IN-CITY ?AUTO_7336 ?AUTO_7340 ) ( not ( = ?AUTO_7335 ?AUTO_7336 ) ) ( not ( = ?AUTO_7337 ?AUTO_7336 ) ) ( not ( = ?AUTO_7342 ?AUTO_7336 ) ) ( not ( = ?AUTO_7338 ?AUTO_7341 ) ) ( IN-CITY ?AUTO_7339 ?AUTO_7343 ) ( IN-CITY ?AUTO_7342 ?AUTO_7343 ) ( not ( = ?AUTO_7342 ?AUTO_7339 ) ) ( not ( = ?AUTO_7335 ?AUTO_7339 ) ) ( not ( = ?AUTO_7337 ?AUTO_7339 ) ) ( not ( = ?AUTO_7340 ?AUTO_7343 ) ) ( not ( = ?AUTO_7336 ?AUTO_7339 ) ) ( OBJ-AT ?AUTO_7334 ?AUTO_7339 ) ( TRUCK-AT ?AUTO_7341 ?AUTO_7345 ) ( IN-CITY ?AUTO_7345 ?AUTO_7343 ) ( not ( = ?AUTO_7339 ?AUTO_7345 ) ) ( not ( = ?AUTO_7335 ?AUTO_7345 ) ) ( not ( = ?AUTO_7337 ?AUTO_7345 ) ) ( not ( = ?AUTO_7342 ?AUTO_7345 ) ) ( not ( = ?AUTO_7336 ?AUTO_7345 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7341 ?AUTO_7345 ?AUTO_7339 ?AUTO_7343 )
      ( DELIVER-PKG ?AUTO_7334 ?AUTO_7335 )
      ( DELIVER-PKG-VERIFY ?AUTO_7334 ?AUTO_7335 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7391 - OBJ
      ?AUTO_7392 - LOCATION
    )
    :vars
    (
      ?AUTO_7395 - LOCATION
      ?AUTO_7393 - TRUCK
      ?AUTO_7396 - LOCATION
      ?AUTO_7397 - CITY
      ?AUTO_7394 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7395 ) ( AIRPORT ?AUTO_7392 ) ( not ( = ?AUTO_7395 ?AUTO_7392 ) ) ( IN-TRUCK ?AUTO_7391 ?AUTO_7393 ) ( TRUCK-AT ?AUTO_7393 ?AUTO_7396 ) ( IN-CITY ?AUTO_7396 ?AUTO_7397 ) ( IN-CITY ?AUTO_7395 ?AUTO_7397 ) ( not ( = ?AUTO_7395 ?AUTO_7396 ) ) ( not ( = ?AUTO_7392 ?AUTO_7396 ) ) ( AIRPLANE-AT ?AUTO_7394 ?AUTO_7395 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7394 ?AUTO_7395 ?AUTO_7392 )
      ( DELIVER-PKG ?AUTO_7391 ?AUTO_7392 )
      ( DELIVER-PKG-VERIFY ?AUTO_7391 ?AUTO_7392 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7509 - OBJ
      ?AUTO_7510 - LOCATION
    )
    :vars
    (
      ?AUTO_7513 - LOCATION
      ?AUTO_7512 - CITY
      ?AUTO_7511 - TRUCK
      ?AUTO_7514 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7513 ?AUTO_7512 ) ( IN-CITY ?AUTO_7510 ?AUTO_7512 ) ( not ( = ?AUTO_7510 ?AUTO_7513 ) ) ( OBJ-AT ?AUTO_7509 ?AUTO_7513 ) ( TRUCK-AT ?AUTO_7511 ?AUTO_7514 ) ( IN-CITY ?AUTO_7514 ?AUTO_7512 ) ( not ( = ?AUTO_7510 ?AUTO_7514 ) ) ( not ( = ?AUTO_7513 ?AUTO_7514 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7511 ?AUTO_7514 ?AUTO_7510 ?AUTO_7512 )
      ( DELIVER-PKG ?AUTO_7509 ?AUTO_7510 )
      ( DELIVER-PKG-VERIFY ?AUTO_7509 ?AUTO_7510 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7662 - OBJ
      ?AUTO_7663 - LOCATION
    )
    :vars
    (
      ?AUTO_7667 - LOCATION
      ?AUTO_7668 - LOCATION
      ?AUTO_7666 - CITY
      ?AUTO_7664 - LOCATION
      ?AUTO_7669 - AIRPLANE
      ?AUTO_7665 - TRUCK
      ?AUTO_7670 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7667 ) ( AIRPORT ?AUTO_7663 ) ( not ( = ?AUTO_7667 ?AUTO_7663 ) ) ( IN-CITY ?AUTO_7668 ?AUTO_7666 ) ( IN-CITY ?AUTO_7667 ?AUTO_7666 ) ( not ( = ?AUTO_7667 ?AUTO_7668 ) ) ( not ( = ?AUTO_7663 ?AUTO_7668 ) ) ( OBJ-AT ?AUTO_7662 ?AUTO_7668 ) ( AIRPORT ?AUTO_7664 ) ( AIRPLANE-AT ?AUTO_7669 ?AUTO_7664 ) ( not ( = ?AUTO_7664 ?AUTO_7667 ) ) ( not ( = ?AUTO_7663 ?AUTO_7664 ) ) ( not ( = ?AUTO_7668 ?AUTO_7664 ) ) ( TRUCK-AT ?AUTO_7665 ?AUTO_7670 ) ( IN-CITY ?AUTO_7670 ?AUTO_7666 ) ( not ( = ?AUTO_7667 ?AUTO_7670 ) ) ( not ( = ?AUTO_7663 ?AUTO_7670 ) ) ( not ( = ?AUTO_7668 ?AUTO_7670 ) ) ( not ( = ?AUTO_7664 ?AUTO_7670 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7665 ?AUTO_7670 ?AUTO_7667 ?AUTO_7666 )
      ( DELIVER-PKG ?AUTO_7662 ?AUTO_7663 )
      ( DELIVER-PKG-VERIFY ?AUTO_7662 ?AUTO_7663 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7930 - OBJ
      ?AUTO_7931 - LOCATION
    )
    :vars
    (
      ?AUTO_7934 - LOCATION
      ?AUTO_7938 - CITY
      ?AUTO_7936 - LOCATION
      ?AUTO_7935 - TRUCK
      ?AUTO_7940 - TRUCK
      ?AUTO_7937 - LOCATION
      ?AUTO_7939 - CITY
      ?AUTO_7933 - LOCATION
      ?AUTO_7932 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7934 ?AUTO_7938 ) ( IN-CITY ?AUTO_7931 ?AUTO_7938 ) ( not ( = ?AUTO_7931 ?AUTO_7934 ) ) ( AIRPORT ?AUTO_7936 ) ( AIRPORT ?AUTO_7934 ) ( not ( = ?AUTO_7936 ?AUTO_7934 ) ) ( not ( = ?AUTO_7931 ?AUTO_7936 ) ) ( IN-TRUCK ?AUTO_7930 ?AUTO_7935 ) ( not ( = ?AUTO_7940 ?AUTO_7935 ) ) ( TRUCK-AT ?AUTO_7935 ?AUTO_7937 ) ( IN-CITY ?AUTO_7937 ?AUTO_7939 ) ( IN-CITY ?AUTO_7936 ?AUTO_7939 ) ( not ( = ?AUTO_7936 ?AUTO_7937 ) ) ( not ( = ?AUTO_7931 ?AUTO_7937 ) ) ( not ( = ?AUTO_7934 ?AUTO_7937 ) ) ( not ( = ?AUTO_7938 ?AUTO_7939 ) ) ( TRUCK-AT ?AUTO_7940 ?AUTO_7933 ) ( IN-CITY ?AUTO_7933 ?AUTO_7938 ) ( not ( = ?AUTO_7934 ?AUTO_7933 ) ) ( not ( = ?AUTO_7931 ?AUTO_7933 ) ) ( not ( = ?AUTO_7936 ?AUTO_7933 ) ) ( not ( = ?AUTO_7937 ?AUTO_7933 ) ) ( AIRPLANE-AT ?AUTO_7932 ?AUTO_7936 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7932 ?AUTO_7936 ?AUTO_7934 )
      ( DELIVER-PKG ?AUTO_7930 ?AUTO_7931 )
      ( DELIVER-PKG-VERIFY ?AUTO_7930 ?AUTO_7931 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7943 - OBJ
      ?AUTO_7944 - LOCATION
    )
    :vars
    (
      ?AUTO_7948 - LOCATION
      ?AUTO_7950 - CITY
      ?AUTO_7946 - LOCATION
      ?AUTO_7947 - TRUCK
      ?AUTO_7952 - TRUCK
      ?AUTO_7951 - LOCATION
      ?AUTO_7945 - CITY
      ?AUTO_7953 - LOCATION
      ?AUTO_7954 - LOCATION
      ?AUTO_7949 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7948 ?AUTO_7950 ) ( IN-CITY ?AUTO_7944 ?AUTO_7950 ) ( not ( = ?AUTO_7944 ?AUTO_7948 ) ) ( AIRPORT ?AUTO_7946 ) ( AIRPORT ?AUTO_7948 ) ( not ( = ?AUTO_7946 ?AUTO_7948 ) ) ( not ( = ?AUTO_7944 ?AUTO_7946 ) ) ( IN-TRUCK ?AUTO_7943 ?AUTO_7947 ) ( not ( = ?AUTO_7952 ?AUTO_7947 ) ) ( TRUCK-AT ?AUTO_7947 ?AUTO_7951 ) ( IN-CITY ?AUTO_7951 ?AUTO_7945 ) ( IN-CITY ?AUTO_7946 ?AUTO_7945 ) ( not ( = ?AUTO_7946 ?AUTO_7951 ) ) ( not ( = ?AUTO_7944 ?AUTO_7951 ) ) ( not ( = ?AUTO_7948 ?AUTO_7951 ) ) ( not ( = ?AUTO_7950 ?AUTO_7945 ) ) ( TRUCK-AT ?AUTO_7952 ?AUTO_7953 ) ( IN-CITY ?AUTO_7953 ?AUTO_7950 ) ( not ( = ?AUTO_7948 ?AUTO_7953 ) ) ( not ( = ?AUTO_7944 ?AUTO_7953 ) ) ( not ( = ?AUTO_7946 ?AUTO_7953 ) ) ( not ( = ?AUTO_7951 ?AUTO_7953 ) ) ( AIRPORT ?AUTO_7954 ) ( AIRPLANE-AT ?AUTO_7949 ?AUTO_7954 ) ( not ( = ?AUTO_7954 ?AUTO_7946 ) ) ( not ( = ?AUTO_7944 ?AUTO_7954 ) ) ( not ( = ?AUTO_7948 ?AUTO_7954 ) ) ( not ( = ?AUTO_7951 ?AUTO_7954 ) ) ( not ( = ?AUTO_7953 ?AUTO_7954 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7949 ?AUTO_7954 ?AUTO_7946 )
      ( DELIVER-PKG ?AUTO_7943 ?AUTO_7944 )
      ( DELIVER-PKG-VERIFY ?AUTO_7943 ?AUTO_7944 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9785 - OBJ
      ?AUTO_9786 - LOCATION
    )
    :vars
    (
      ?AUTO_9788 - LOCATION
      ?AUTO_9791 - CITY
      ?AUTO_9787 - LOCATION
      ?AUTO_9789 - AIRPLANE
      ?AUTO_9790 - TRUCK
      ?AUTO_9792 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9788 ?AUTO_9791 ) ( IN-CITY ?AUTO_9786 ?AUTO_9791 ) ( not ( = ?AUTO_9786 ?AUTO_9788 ) ) ( AIRPORT ?AUTO_9787 ) ( AIRPORT ?AUTO_9788 ) ( not ( = ?AUTO_9787 ?AUTO_9788 ) ) ( not ( = ?AUTO_9786 ?AUTO_9787 ) ) ( OBJ-AT ?AUTO_9785 ?AUTO_9787 ) ( AIRPLANE-AT ?AUTO_9789 ?AUTO_9788 ) ( TRUCK-AT ?AUTO_9790 ?AUTO_9792 ) ( IN-CITY ?AUTO_9792 ?AUTO_9791 ) ( not ( = ?AUTO_9788 ?AUTO_9792 ) ) ( not ( = ?AUTO_9786 ?AUTO_9792 ) ) ( not ( = ?AUTO_9787 ?AUTO_9792 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9790 ?AUTO_9792 ?AUTO_9788 ?AUTO_9791 )
      ( DELIVER-PKG ?AUTO_9785 ?AUTO_9786 )
      ( DELIVER-PKG-VERIFY ?AUTO_9785 ?AUTO_9786 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8447 - OBJ
      ?AUTO_8448 - LOCATION
    )
    :vars
    (
      ?AUTO_8452 - LOCATION
      ?AUTO_8453 - AIRPLANE
      ?AUTO_8450 - LOCATION
      ?AUTO_8449 - CITY
      ?AUTO_8451 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_8452 ) ( AIRPORT ?AUTO_8448 ) ( not ( = ?AUTO_8452 ?AUTO_8448 ) ) ( AIRPLANE-AT ?AUTO_8453 ?AUTO_8448 ) ( IN-CITY ?AUTO_8450 ?AUTO_8449 ) ( IN-CITY ?AUTO_8452 ?AUTO_8449 ) ( not ( = ?AUTO_8452 ?AUTO_8450 ) ) ( not ( = ?AUTO_8448 ?AUTO_8450 ) ) ( OBJ-AT ?AUTO_8447 ?AUTO_8450 ) ( TRUCK-AT ?AUTO_8451 ?AUTO_8452 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8451 ?AUTO_8452 ?AUTO_8450 ?AUTO_8449 )
      ( DELIVER-PKG ?AUTO_8447 ?AUTO_8448 )
      ( DELIVER-PKG-VERIFY ?AUTO_8447 ?AUTO_8448 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8639 - OBJ
      ?AUTO_8640 - LOCATION
    )
    :vars
    (
      ?AUTO_8644 - LOCATION
      ?AUTO_8643 - CITY
      ?AUTO_8642 - LOCATION
      ?AUTO_8649 - AIRPLANE
      ?AUTO_8647 - TRUCK
      ?AUTO_8645 - TRUCK
      ?AUTO_8648 - LOCATION
      ?AUTO_8646 - CITY
      ?AUTO_8641 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8644 ?AUTO_8643 ) ( IN-CITY ?AUTO_8640 ?AUTO_8643 ) ( not ( = ?AUTO_8640 ?AUTO_8644 ) ) ( AIRPORT ?AUTO_8642 ) ( AIRPORT ?AUTO_8644 ) ( not ( = ?AUTO_8642 ?AUTO_8644 ) ) ( not ( = ?AUTO_8640 ?AUTO_8642 ) ) ( AIRPLANE-AT ?AUTO_8649 ?AUTO_8644 ) ( not ( = ?AUTO_8647 ?AUTO_8645 ) ) ( IN-CITY ?AUTO_8648 ?AUTO_8646 ) ( IN-CITY ?AUTO_8642 ?AUTO_8646 ) ( not ( = ?AUTO_8642 ?AUTO_8648 ) ) ( not ( = ?AUTO_8640 ?AUTO_8648 ) ) ( not ( = ?AUTO_8644 ?AUTO_8648 ) ) ( not ( = ?AUTO_8643 ?AUTO_8646 ) ) ( TRUCK-AT ?AUTO_8647 ?AUTO_8641 ) ( IN-CITY ?AUTO_8641 ?AUTO_8643 ) ( not ( = ?AUTO_8644 ?AUTO_8641 ) ) ( not ( = ?AUTO_8640 ?AUTO_8641 ) ) ( not ( = ?AUTO_8642 ?AUTO_8641 ) ) ( not ( = ?AUTO_8648 ?AUTO_8641 ) ) ( OBJ-AT ?AUTO_8639 ?AUTO_8648 ) ( TRUCK-AT ?AUTO_8645 ?AUTO_8642 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8645 ?AUTO_8642 ?AUTO_8648 ?AUTO_8646 )
      ( DELIVER-PKG ?AUTO_8639 ?AUTO_8640 )
      ( DELIVER-PKG-VERIFY ?AUTO_8639 ?AUTO_8640 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9797 - OBJ
      ?AUTO_9798 - LOCATION
    )
    :vars
    (
      ?AUTO_9804 - LOCATION
      ?AUTO_9799 - CITY
      ?AUTO_9803 - LOCATION
      ?AUTO_9800 - AIRPLANE
      ?AUTO_9801 - LOCATION
      ?AUTO_9802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9804 ?AUTO_9799 ) ( IN-CITY ?AUTO_9798 ?AUTO_9799 ) ( not ( = ?AUTO_9798 ?AUTO_9804 ) ) ( AIRPORT ?AUTO_9803 ) ( AIRPORT ?AUTO_9804 ) ( not ( = ?AUTO_9803 ?AUTO_9804 ) ) ( not ( = ?AUTO_9798 ?AUTO_9803 ) ) ( OBJ-AT ?AUTO_9797 ?AUTO_9803 ) ( AIRPLANE-AT ?AUTO_9800 ?AUTO_9804 ) ( IN-CITY ?AUTO_9801 ?AUTO_9799 ) ( not ( = ?AUTO_9804 ?AUTO_9801 ) ) ( not ( = ?AUTO_9798 ?AUTO_9801 ) ) ( not ( = ?AUTO_9803 ?AUTO_9801 ) ) ( TRUCK-AT ?AUTO_9802 ?AUTO_9798 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_9802 ?AUTO_9798 ?AUTO_9801 ?AUTO_9799 )
      ( DELIVER-PKG ?AUTO_9797 ?AUTO_9798 )
      ( DELIVER-PKG-VERIFY ?AUTO_9797 ?AUTO_9798 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_9805 - OBJ
      ?AUTO_9806 - LOCATION
    )
    :vars
    (
      ?AUTO_9809 - LOCATION
      ?AUTO_9808 - CITY
      ?AUTO_9807 - LOCATION
      ?AUTO_9810 - LOCATION
      ?AUTO_9812 - TRUCK
      ?AUTO_9813 - LOCATION
      ?AUTO_9811 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_9809 ?AUTO_9808 ) ( IN-CITY ?AUTO_9806 ?AUTO_9808 ) ( not ( = ?AUTO_9806 ?AUTO_9809 ) ) ( AIRPORT ?AUTO_9807 ) ( AIRPORT ?AUTO_9809 ) ( not ( = ?AUTO_9807 ?AUTO_9809 ) ) ( not ( = ?AUTO_9806 ?AUTO_9807 ) ) ( OBJ-AT ?AUTO_9805 ?AUTO_9807 ) ( IN-CITY ?AUTO_9810 ?AUTO_9808 ) ( not ( = ?AUTO_9809 ?AUTO_9810 ) ) ( not ( = ?AUTO_9806 ?AUTO_9810 ) ) ( not ( = ?AUTO_9807 ?AUTO_9810 ) ) ( TRUCK-AT ?AUTO_9812 ?AUTO_9806 ) ( AIRPORT ?AUTO_9813 ) ( AIRPLANE-AT ?AUTO_9811 ?AUTO_9813 ) ( not ( = ?AUTO_9813 ?AUTO_9809 ) ) ( not ( = ?AUTO_9806 ?AUTO_9813 ) ) ( not ( = ?AUTO_9807 ?AUTO_9813 ) ) ( not ( = ?AUTO_9810 ?AUTO_9813 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_9811 ?AUTO_9813 ?AUTO_9809 )
      ( DELIVER-PKG ?AUTO_9805 ?AUTO_9806 )
      ( DELIVER-PKG-VERIFY ?AUTO_9805 ?AUTO_9806 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10258 - OBJ
      ?AUTO_10259 - LOCATION
    )
    :vars
    (
      ?AUTO_10262 - LOCATION
      ?AUTO_10261 - CITY
      ?AUTO_10265 - TRUCK
      ?AUTO_10267 - LOCATION
      ?AUTO_10264 - AIRPLANE
      ?AUTO_10263 - TRUCK
      ?AUTO_10266 - LOCATION
      ?AUTO_10260 - CITY
      ?AUTO_10268 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10262 ?AUTO_10261 ) ( IN-CITY ?AUTO_10259 ?AUTO_10261 ) ( not ( = ?AUTO_10259 ?AUTO_10262 ) ) ( TRUCK-AT ?AUTO_10265 ?AUTO_10259 ) ( AIRPORT ?AUTO_10267 ) ( AIRPORT ?AUTO_10262 ) ( AIRPLANE-AT ?AUTO_10264 ?AUTO_10267 ) ( not ( = ?AUTO_10267 ?AUTO_10262 ) ) ( not ( = ?AUTO_10259 ?AUTO_10267 ) ) ( not ( = ?AUTO_10265 ?AUTO_10263 ) ) ( IN-CITY ?AUTO_10266 ?AUTO_10260 ) ( IN-CITY ?AUTO_10267 ?AUTO_10260 ) ( not ( = ?AUTO_10267 ?AUTO_10266 ) ) ( not ( = ?AUTO_10259 ?AUTO_10266 ) ) ( not ( = ?AUTO_10262 ?AUTO_10266 ) ) ( not ( = ?AUTO_10261 ?AUTO_10260 ) ) ( OBJ-AT ?AUTO_10258 ?AUTO_10266 ) ( TRUCK-AT ?AUTO_10263 ?AUTO_10268 ) ( IN-CITY ?AUTO_10268 ?AUTO_10260 ) ( not ( = ?AUTO_10266 ?AUTO_10268 ) ) ( not ( = ?AUTO_10259 ?AUTO_10268 ) ) ( not ( = ?AUTO_10262 ?AUTO_10268 ) ) ( not ( = ?AUTO_10267 ?AUTO_10268 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10263 ?AUTO_10268 ?AUTO_10266 ?AUTO_10260 )
      ( DELIVER-PKG ?AUTO_10258 ?AUTO_10259 )
      ( DELIVER-PKG-VERIFY ?AUTO_10258 ?AUTO_10259 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10269 - OBJ
      ?AUTO_10270 - LOCATION
    )
    :vars
    (
      ?AUTO_10275 - LOCATION
      ?AUTO_10278 - CITY
      ?AUTO_10276 - TRUCK
      ?AUTO_10272 - LOCATION
      ?AUTO_10273 - TRUCK
      ?AUTO_10271 - LOCATION
      ?AUTO_10277 - CITY
      ?AUTO_10279 - LOCATION
      ?AUTO_10280 - LOCATION
      ?AUTO_10274 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10275 ?AUTO_10278 ) ( IN-CITY ?AUTO_10270 ?AUTO_10278 ) ( not ( = ?AUTO_10270 ?AUTO_10275 ) ) ( TRUCK-AT ?AUTO_10276 ?AUTO_10270 ) ( AIRPORT ?AUTO_10272 ) ( AIRPORT ?AUTO_10275 ) ( not ( = ?AUTO_10272 ?AUTO_10275 ) ) ( not ( = ?AUTO_10270 ?AUTO_10272 ) ) ( not ( = ?AUTO_10276 ?AUTO_10273 ) ) ( IN-CITY ?AUTO_10271 ?AUTO_10277 ) ( IN-CITY ?AUTO_10272 ?AUTO_10277 ) ( not ( = ?AUTO_10272 ?AUTO_10271 ) ) ( not ( = ?AUTO_10270 ?AUTO_10271 ) ) ( not ( = ?AUTO_10275 ?AUTO_10271 ) ) ( not ( = ?AUTO_10278 ?AUTO_10277 ) ) ( OBJ-AT ?AUTO_10269 ?AUTO_10271 ) ( TRUCK-AT ?AUTO_10273 ?AUTO_10279 ) ( IN-CITY ?AUTO_10279 ?AUTO_10277 ) ( not ( = ?AUTO_10271 ?AUTO_10279 ) ) ( not ( = ?AUTO_10270 ?AUTO_10279 ) ) ( not ( = ?AUTO_10275 ?AUTO_10279 ) ) ( not ( = ?AUTO_10272 ?AUTO_10279 ) ) ( AIRPORT ?AUTO_10280 ) ( AIRPLANE-AT ?AUTO_10274 ?AUTO_10280 ) ( not ( = ?AUTO_10280 ?AUTO_10272 ) ) ( not ( = ?AUTO_10270 ?AUTO_10280 ) ) ( not ( = ?AUTO_10275 ?AUTO_10280 ) ) ( not ( = ?AUTO_10271 ?AUTO_10280 ) ) ( not ( = ?AUTO_10279 ?AUTO_10280 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10274 ?AUTO_10280 ?AUTO_10272 )
      ( DELIVER-PKG ?AUTO_10269 ?AUTO_10270 )
      ( DELIVER-PKG-VERIFY ?AUTO_10269 ?AUTO_10270 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10567 - OBJ
      ?AUTO_10568 - LOCATION
    )
    :vars
    (
      ?AUTO_10570 - LOCATION
      ?AUTO_10571 - LOCATION
      ?AUTO_10569 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_10570 ) ( AIRPORT ?AUTO_10568 ) ( not ( = ?AUTO_10570 ?AUTO_10568 ) ) ( OBJ-AT ?AUTO_10567 ?AUTO_10570 ) ( AIRPORT ?AUTO_10571 ) ( AIRPLANE-AT ?AUTO_10569 ?AUTO_10571 ) ( not ( = ?AUTO_10571 ?AUTO_10568 ) ) ( not ( = ?AUTO_10570 ?AUTO_10571 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_10569 ?AUTO_10571 ?AUTO_10568 )
      ( DELIVER-PKG ?AUTO_10567 ?AUTO_10568 )
      ( DELIVER-PKG-VERIFY ?AUTO_10567 ?AUTO_10568 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_10718 - OBJ
      ?AUTO_10719 - LOCATION
    )
    :vars
    (
      ?AUTO_10722 - LOCATION
      ?AUTO_10720 - CITY
      ?AUTO_10723 - AIRPLANE
      ?AUTO_10721 - LOCATION
      ?AUTO_10725 - LOCATION
      ?AUTO_10724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_10722 ?AUTO_10720 ) ( IN-CITY ?AUTO_10719 ?AUTO_10720 ) ( not ( = ?AUTO_10719 ?AUTO_10722 ) ) ( IN-AIRPLANE ?AUTO_10718 ?AUTO_10723 ) ( AIRPORT ?AUTO_10721 ) ( AIRPORT ?AUTO_10722 ) ( AIRPLANE-AT ?AUTO_10723 ?AUTO_10721 ) ( not ( = ?AUTO_10721 ?AUTO_10722 ) ) ( not ( = ?AUTO_10719 ?AUTO_10721 ) ) ( IN-CITY ?AUTO_10725 ?AUTO_10720 ) ( not ( = ?AUTO_10722 ?AUTO_10725 ) ) ( not ( = ?AUTO_10719 ?AUTO_10725 ) ) ( not ( = ?AUTO_10721 ?AUTO_10725 ) ) ( TRUCK-AT ?AUTO_10724 ?AUTO_10719 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_10724 ?AUTO_10719 ?AUTO_10725 ?AUTO_10720 )
      ( DELIVER-PKG ?AUTO_10718 ?AUTO_10719 )
      ( DELIVER-PKG-VERIFY ?AUTO_10718 ?AUTO_10719 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_11473 - OBJ
      ?AUTO_11474 - LOCATION
    )
    :vars
    (
      ?AUTO_11477 - LOCATION
      ?AUTO_11475 - CITY
      ?AUTO_11483 - TRUCK
      ?AUTO_11478 - LOCATION
      ?AUTO_11476 - LOCATION
      ?AUTO_11482 - AIRPLANE
      ?AUTO_11479 - TRUCK
      ?AUTO_11480 - LOCATION
      ?AUTO_11481 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_11477 ?AUTO_11475 ) ( IN-CITY ?AUTO_11474 ?AUTO_11475 ) ( not ( = ?AUTO_11474 ?AUTO_11477 ) ) ( TRUCK-AT ?AUTO_11483 ?AUTO_11474 ) ( AIRPORT ?AUTO_11478 ) ( AIRPORT ?AUTO_11477 ) ( not ( = ?AUTO_11478 ?AUTO_11477 ) ) ( not ( = ?AUTO_11474 ?AUTO_11478 ) ) ( AIRPORT ?AUTO_11476 ) ( AIRPLANE-AT ?AUTO_11482 ?AUTO_11476 ) ( not ( = ?AUTO_11476 ?AUTO_11478 ) ) ( not ( = ?AUTO_11474 ?AUTO_11476 ) ) ( not ( = ?AUTO_11477 ?AUTO_11476 ) ) ( not ( = ?AUTO_11483 ?AUTO_11479 ) ) ( IN-CITY ?AUTO_11480 ?AUTO_11481 ) ( IN-CITY ?AUTO_11478 ?AUTO_11481 ) ( not ( = ?AUTO_11478 ?AUTO_11480 ) ) ( not ( = ?AUTO_11474 ?AUTO_11480 ) ) ( not ( = ?AUTO_11477 ?AUTO_11480 ) ) ( not ( = ?AUTO_11475 ?AUTO_11481 ) ) ( not ( = ?AUTO_11476 ?AUTO_11480 ) ) ( OBJ-AT ?AUTO_11473 ?AUTO_11480 ) ( TRUCK-AT ?AUTO_11479 ?AUTO_11478 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11479 ?AUTO_11478 ?AUTO_11480 ?AUTO_11481 )
      ( DELIVER-PKG ?AUTO_11473 ?AUTO_11474 )
      ( DELIVER-PKG-VERIFY ?AUTO_11473 ?AUTO_11474 ) )
  )

)

