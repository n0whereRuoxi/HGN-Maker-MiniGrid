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
      ?AUTO_7 - OBJ
      ?AUTO_8 - LOCATION
    )
    :vars
    (
      ?AUTO_11 - TRUCK
      ?AUTO_14 - LOCATION
      ?AUTO_13 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7 ?AUTO_11 ) ( TRUCK-AT ?AUTO_11 ?AUTO_14 ) ( IN-CITY ?AUTO_14 ?AUTO_13 ) ( IN-CITY ?AUTO_8 ?AUTO_13 ) ( not ( = ?AUTO_8 ?AUTO_14 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11 ?AUTO_14 ?AUTO_8 ?AUTO_13 )
      ( DELIVER-PKG ?AUTO_7 ?AUTO_8 )
      ( DELIVER-PKG-VERIFY ?AUTO_7 ?AUTO_8 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_16 - OBJ
      ?AUTO_17 - LOCATION
    )
    :vars
    (
      ?AUTO_20 - TRUCK
      ?AUTO_22 - LOCATION
      ?AUTO_21 - CITY
      ?AUTO_24 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_20 ?AUTO_22 ) ( IN-CITY ?AUTO_22 ?AUTO_21 ) ( IN-CITY ?AUTO_17 ?AUTO_21 ) ( not ( = ?AUTO_17 ?AUTO_22 ) ) ( TRUCK-AT ?AUTO_20 ?AUTO_24 ) ( OBJ-AT ?AUTO_16 ?AUTO_24 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_16 ?AUTO_20 ?AUTO_24 )
      ( DELIVER-PKG ?AUTO_16 ?AUTO_17 )
      ( DELIVER-PKG-VERIFY ?AUTO_16 ?AUTO_17 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_26 - OBJ
      ?AUTO_27 - LOCATION
    )
    :vars
    (
      ?AUTO_28 - LOCATION
      ?AUTO_31 - CITY
      ?AUTO_32 - TRUCK
      ?AUTO_36 - LOCATION
      ?AUTO_35 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_28 ?AUTO_31 ) ( IN-CITY ?AUTO_27 ?AUTO_31 ) ( not ( = ?AUTO_27 ?AUTO_28 ) ) ( OBJ-AT ?AUTO_26 ?AUTO_28 ) ( TRUCK-AT ?AUTO_32 ?AUTO_36 ) ( IN-CITY ?AUTO_36 ?AUTO_35 ) ( IN-CITY ?AUTO_28 ?AUTO_35 ) ( not ( = ?AUTO_28 ?AUTO_36 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_32 ?AUTO_36 ?AUTO_28 ?AUTO_35 )
      ( DELIVER-PKG ?AUTO_26 ?AUTO_27 )
      ( DELIVER-PKG-VERIFY ?AUTO_26 ?AUTO_27 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_42 - OBJ
      ?AUTO_43 - LOCATION
    )
    :vars
    (
      ?AUTO_44 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_44 ?AUTO_43 ) ( IN-TRUCK ?AUTO_42 ?AUTO_44 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_42 ?AUTO_44 ?AUTO_43 )
      ( DELIVER-PKG-VERIFY ?AUTO_42 ?AUTO_43 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_47 - OBJ
      ?AUTO_48 - LOCATION
    )
    :vars
    (
      ?AUTO_51 - TRUCK
      ?AUTO_54 - LOCATION
      ?AUTO_53 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_47 ?AUTO_51 ) ( TRUCK-AT ?AUTO_51 ?AUTO_54 ) ( IN-CITY ?AUTO_54 ?AUTO_53 ) ( IN-CITY ?AUTO_48 ?AUTO_53 ) ( not ( = ?AUTO_48 ?AUTO_54 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_51 ?AUTO_54 ?AUTO_48 ?AUTO_53 )
      ( DELIVER-PKG ?AUTO_47 ?AUTO_48 )
      ( DELIVER-PKG-VERIFY ?AUTO_47 ?AUTO_48 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_56 - OBJ
      ?AUTO_57 - LOCATION
    )
    :vars
    (
      ?AUTO_60 - TRUCK
      ?AUTO_62 - LOCATION
      ?AUTO_61 - CITY
      ?AUTO_64 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_60 ?AUTO_62 ) ( IN-CITY ?AUTO_62 ?AUTO_61 ) ( IN-CITY ?AUTO_57 ?AUTO_61 ) ( not ( = ?AUTO_57 ?AUTO_62 ) ) ( TRUCK-AT ?AUTO_60 ?AUTO_64 ) ( OBJ-AT ?AUTO_56 ?AUTO_64 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_56 ?AUTO_60 ?AUTO_64 )
      ( DELIVER-PKG ?AUTO_56 ?AUTO_57 )
      ( DELIVER-PKG-VERIFY ?AUTO_56 ?AUTO_57 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_66 - OBJ
      ?AUTO_67 - LOCATION
    )
    :vars
    (
      ?AUTO_68 - LOCATION
      ?AUTO_72 - CITY
      ?AUTO_71 - TRUCK
      ?AUTO_76 - LOCATION
      ?AUTO_75 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_68 ?AUTO_72 ) ( IN-CITY ?AUTO_67 ?AUTO_72 ) ( not ( = ?AUTO_67 ?AUTO_68 ) ) ( OBJ-AT ?AUTO_66 ?AUTO_68 ) ( TRUCK-AT ?AUTO_71 ?AUTO_76 ) ( IN-CITY ?AUTO_76 ?AUTO_75 ) ( IN-CITY ?AUTO_68 ?AUTO_75 ) ( not ( = ?AUTO_68 ?AUTO_76 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_71 ?AUTO_76 ?AUTO_68 ?AUTO_75 )
      ( DELIVER-PKG ?AUTO_66 ?AUTO_67 )
      ( DELIVER-PKG-VERIFY ?AUTO_66 ?AUTO_67 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_94 - OBJ
      ?AUTO_95 - LOCATION
    )
    :vars
    (
      ?AUTO_96 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_94 ?AUTO_96 ) ( AIRPLANE-AT ?AUTO_96 ?AUTO_95 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_94 ?AUTO_96 ?AUTO_95 )
      ( DELIVER-PKG-VERIFY ?AUTO_94 ?AUTO_95 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_99 - OBJ
      ?AUTO_100 - LOCATION
    )
    :vars
    (
      ?AUTO_103 - AIRPLANE
      ?AUTO_105 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_99 ?AUTO_103 ) ( AIRPORT ?AUTO_105 ) ( AIRPORT ?AUTO_100 ) ( AIRPLANE-AT ?AUTO_103 ?AUTO_105 ) ( not ( = ?AUTO_105 ?AUTO_100 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_103 ?AUTO_105 ?AUTO_100 )
      ( DELIVER-PKG ?AUTO_99 ?AUTO_100 )
      ( DELIVER-PKG-VERIFY ?AUTO_99 ?AUTO_100 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_119 - OBJ
      ?AUTO_120 - LOCATION
    )
    :vars
    (
      ?AUTO_122 - LOCATION
      ?AUTO_121 - AIRPLANE
      ?AUTO_126 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_122 ) ( AIRPORT ?AUTO_120 ) ( AIRPLANE-AT ?AUTO_121 ?AUTO_122 ) ( not ( = ?AUTO_122 ?AUTO_120 ) ) ( OBJ-AT ?AUTO_119 ?AUTO_126 ) ( AIRPLANE-AT ?AUTO_121 ?AUTO_126 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_119 ?AUTO_121 ?AUTO_126 )
      ( DELIVER-PKG ?AUTO_119 ?AUTO_120 )
      ( DELIVER-PKG-VERIFY ?AUTO_119 ?AUTO_120 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_128 - OBJ
      ?AUTO_129 - LOCATION
    )
    :vars
    (
      ?AUTO_132 - LOCATION
      ?AUTO_133 - AIRPLANE
      ?AUTO_134 - LOCATION
      ?AUTO_135 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_132 ) ( AIRPORT ?AUTO_129 ) ( AIRPLANE-AT ?AUTO_133 ?AUTO_132 ) ( not ( = ?AUTO_132 ?AUTO_129 ) ) ( AIRPLANE-AT ?AUTO_133 ?AUTO_134 ) ( TRUCK-AT ?AUTO_135 ?AUTO_134 ) ( IN-TRUCK ?AUTO_128 ?AUTO_135 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_128 ?AUTO_135 ?AUTO_134 )
      ( DELIVER-PKG ?AUTO_128 ?AUTO_129 )
      ( DELIVER-PKG-VERIFY ?AUTO_128 ?AUTO_129 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_138 - OBJ
      ?AUTO_139 - LOCATION
    )
    :vars
    (
      ?AUTO_145 - LOCATION
      ?AUTO_143 - AIRPLANE
      ?AUTO_142 - LOCATION
      ?AUTO_144 - TRUCK
      ?AUTO_148 - LOCATION
      ?AUTO_147 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_145 ) ( AIRPORT ?AUTO_139 ) ( AIRPLANE-AT ?AUTO_143 ?AUTO_145 ) ( not ( = ?AUTO_145 ?AUTO_139 ) ) ( AIRPLANE-AT ?AUTO_143 ?AUTO_142 ) ( IN-TRUCK ?AUTO_138 ?AUTO_144 ) ( TRUCK-AT ?AUTO_144 ?AUTO_148 ) ( IN-CITY ?AUTO_148 ?AUTO_147 ) ( IN-CITY ?AUTO_142 ?AUTO_147 ) ( not ( = ?AUTO_142 ?AUTO_148 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_144 ?AUTO_148 ?AUTO_142 ?AUTO_147 )
      ( DELIVER-PKG ?AUTO_138 ?AUTO_139 )
      ( DELIVER-PKG-VERIFY ?AUTO_138 ?AUTO_139 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_150 - OBJ
      ?AUTO_151 - LOCATION
    )
    :vars
    (
      ?AUTO_153 - LOCATION
      ?AUTO_158 - AIRPLANE
      ?AUTO_156 - LOCATION
      ?AUTO_157 - TRUCK
      ?AUTO_159 - LOCATION
      ?AUTO_154 - CITY
      ?AUTO_161 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_153 ) ( AIRPORT ?AUTO_151 ) ( AIRPLANE-AT ?AUTO_158 ?AUTO_153 ) ( not ( = ?AUTO_153 ?AUTO_151 ) ) ( AIRPLANE-AT ?AUTO_158 ?AUTO_156 ) ( TRUCK-AT ?AUTO_157 ?AUTO_159 ) ( IN-CITY ?AUTO_159 ?AUTO_154 ) ( IN-CITY ?AUTO_156 ?AUTO_154 ) ( not ( = ?AUTO_156 ?AUTO_159 ) ) ( TRUCK-AT ?AUTO_157 ?AUTO_161 ) ( OBJ-AT ?AUTO_150 ?AUTO_161 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_150 ?AUTO_157 ?AUTO_161 )
      ( DELIVER-PKG ?AUTO_150 ?AUTO_151 )
      ( DELIVER-PKG-VERIFY ?AUTO_150 ?AUTO_151 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_163 - OBJ
      ?AUTO_164 - LOCATION
    )
    :vars
    (
      ?AUTO_172 - LOCATION
      ?AUTO_173 - AIRPLANE
      ?AUTO_166 - LOCATION
      ?AUTO_169 - LOCATION
      ?AUTO_165 - CITY
      ?AUTO_170 - TRUCK
      ?AUTO_176 - LOCATION
      ?AUTO_175 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_172 ) ( AIRPORT ?AUTO_164 ) ( AIRPLANE-AT ?AUTO_173 ?AUTO_172 ) ( not ( = ?AUTO_172 ?AUTO_164 ) ) ( AIRPLANE-AT ?AUTO_173 ?AUTO_166 ) ( IN-CITY ?AUTO_169 ?AUTO_165 ) ( IN-CITY ?AUTO_166 ?AUTO_165 ) ( not ( = ?AUTO_166 ?AUTO_169 ) ) ( OBJ-AT ?AUTO_163 ?AUTO_169 ) ( TRUCK-AT ?AUTO_170 ?AUTO_176 ) ( IN-CITY ?AUTO_176 ?AUTO_175 ) ( IN-CITY ?AUTO_169 ?AUTO_175 ) ( not ( = ?AUTO_169 ?AUTO_176 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_170 ?AUTO_176 ?AUTO_169 ?AUTO_175 )
      ( DELIVER-PKG ?AUTO_163 ?AUTO_164 )
      ( DELIVER-PKG-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_182 - OBJ
      ?AUTO_183 - LOCATION
    )
    :vars
    (
      ?AUTO_184 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_182 ?AUTO_184 ) ( AIRPLANE-AT ?AUTO_184 ?AUTO_183 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_182 ?AUTO_184 ?AUTO_183 )
      ( DELIVER-PKG-VERIFY ?AUTO_182 ?AUTO_183 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_191 - OBJ
      ?AUTO_192 - LOCATION
    )
    :vars
    (
      ?AUTO_196 - LOCATION
      ?AUTO_193 - AIRPLANE
      ?AUTO_198 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_196 ) ( AIRPORT ?AUTO_192 ) ( AIRPLANE-AT ?AUTO_193 ?AUTO_196 ) ( not ( = ?AUTO_196 ?AUTO_192 ) ) ( OBJ-AT ?AUTO_191 ?AUTO_198 ) ( AIRPLANE-AT ?AUTO_193 ?AUTO_198 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_191 ?AUTO_193 ?AUTO_198 )
      ( DELIVER-PKG ?AUTO_191 ?AUTO_192 )
      ( DELIVER-PKG-VERIFY ?AUTO_191 ?AUTO_192 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_200 - OBJ
      ?AUTO_201 - LOCATION
    )
    :vars
    (
      ?AUTO_205 - LOCATION
      ?AUTO_204 - AIRPLANE
      ?AUTO_206 - LOCATION
      ?AUTO_207 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_205 ) ( AIRPORT ?AUTO_201 ) ( AIRPLANE-AT ?AUTO_204 ?AUTO_205 ) ( not ( = ?AUTO_205 ?AUTO_201 ) ) ( AIRPLANE-AT ?AUTO_204 ?AUTO_206 ) ( TRUCK-AT ?AUTO_207 ?AUTO_206 ) ( IN-TRUCK ?AUTO_200 ?AUTO_207 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_200 ?AUTO_207 ?AUTO_206 )
      ( DELIVER-PKG ?AUTO_200 ?AUTO_201 )
      ( DELIVER-PKG-VERIFY ?AUTO_200 ?AUTO_201 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_210 - OBJ
      ?AUTO_211 - LOCATION
    )
    :vars
    (
      ?AUTO_214 - LOCATION
      ?AUTO_217 - AIRPLANE
      ?AUTO_216 - LOCATION
      ?AUTO_213 - TRUCK
      ?AUTO_220 - LOCATION
      ?AUTO_219 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_214 ) ( AIRPORT ?AUTO_211 ) ( AIRPLANE-AT ?AUTO_217 ?AUTO_214 ) ( not ( = ?AUTO_214 ?AUTO_211 ) ) ( AIRPLANE-AT ?AUTO_217 ?AUTO_216 ) ( IN-TRUCK ?AUTO_210 ?AUTO_213 ) ( TRUCK-AT ?AUTO_213 ?AUTO_220 ) ( IN-CITY ?AUTO_220 ?AUTO_219 ) ( IN-CITY ?AUTO_216 ?AUTO_219 ) ( not ( = ?AUTO_216 ?AUTO_220 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_213 ?AUTO_220 ?AUTO_216 ?AUTO_219 )
      ( DELIVER-PKG ?AUTO_210 ?AUTO_211 )
      ( DELIVER-PKG-VERIFY ?AUTO_210 ?AUTO_211 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_222 - OBJ
      ?AUTO_223 - LOCATION
    )
    :vars
    (
      ?AUTO_228 - LOCATION
      ?AUTO_230 - AIRPLANE
      ?AUTO_229 - LOCATION
      ?AUTO_227 - TRUCK
      ?AUTO_231 - LOCATION
      ?AUTO_225 - CITY
      ?AUTO_233 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_228 ) ( AIRPORT ?AUTO_223 ) ( AIRPLANE-AT ?AUTO_230 ?AUTO_228 ) ( not ( = ?AUTO_228 ?AUTO_223 ) ) ( AIRPLANE-AT ?AUTO_230 ?AUTO_229 ) ( TRUCK-AT ?AUTO_227 ?AUTO_231 ) ( IN-CITY ?AUTO_231 ?AUTO_225 ) ( IN-CITY ?AUTO_229 ?AUTO_225 ) ( not ( = ?AUTO_229 ?AUTO_231 ) ) ( TRUCK-AT ?AUTO_227 ?AUTO_233 ) ( OBJ-AT ?AUTO_222 ?AUTO_233 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_222 ?AUTO_227 ?AUTO_233 )
      ( DELIVER-PKG ?AUTO_222 ?AUTO_223 )
      ( DELIVER-PKG-VERIFY ?AUTO_222 ?AUTO_223 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_235 - OBJ
      ?AUTO_236 - LOCATION
    )
    :vars
    (
      ?AUTO_240 - LOCATION
      ?AUTO_242 - AIRPLANE
      ?AUTO_243 - LOCATION
      ?AUTO_241 - LOCATION
      ?AUTO_244 - CITY
      ?AUTO_245 - TRUCK
      ?AUTO_248 - LOCATION
      ?AUTO_247 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_240 ) ( AIRPORT ?AUTO_236 ) ( AIRPLANE-AT ?AUTO_242 ?AUTO_240 ) ( not ( = ?AUTO_240 ?AUTO_236 ) ) ( AIRPLANE-AT ?AUTO_242 ?AUTO_243 ) ( IN-CITY ?AUTO_241 ?AUTO_244 ) ( IN-CITY ?AUTO_243 ?AUTO_244 ) ( not ( = ?AUTO_243 ?AUTO_241 ) ) ( OBJ-AT ?AUTO_235 ?AUTO_241 ) ( TRUCK-AT ?AUTO_245 ?AUTO_248 ) ( IN-CITY ?AUTO_248 ?AUTO_247 ) ( IN-CITY ?AUTO_241 ?AUTO_247 ) ( not ( = ?AUTO_241 ?AUTO_248 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_245 ?AUTO_248 ?AUTO_241 ?AUTO_247 )
      ( DELIVER-PKG ?AUTO_235 ?AUTO_236 )
      ( DELIVER-PKG-VERIFY ?AUTO_235 ?AUTO_236 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_250 - OBJ
      ?AUTO_251 - LOCATION
    )
    :vars
    (
      ?AUTO_254 - LOCATION
      ?AUTO_260 - LOCATION
      ?AUTO_257 - CITY
      ?AUTO_258 - TRUCK
      ?AUTO_261 - LOCATION
      ?AUTO_259 - CITY
      ?AUTO_263 - LOCATION
      ?AUTO_256 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_254 ) ( AIRPORT ?AUTO_251 ) ( not ( = ?AUTO_254 ?AUTO_251 ) ) ( IN-CITY ?AUTO_260 ?AUTO_257 ) ( IN-CITY ?AUTO_254 ?AUTO_257 ) ( not ( = ?AUTO_254 ?AUTO_260 ) ) ( OBJ-AT ?AUTO_250 ?AUTO_260 ) ( TRUCK-AT ?AUTO_258 ?AUTO_261 ) ( IN-CITY ?AUTO_261 ?AUTO_259 ) ( IN-CITY ?AUTO_260 ?AUTO_259 ) ( not ( = ?AUTO_260 ?AUTO_261 ) ) ( AIRPORT ?AUTO_263 ) ( AIRPLANE-AT ?AUTO_256 ?AUTO_263 ) ( not ( = ?AUTO_263 ?AUTO_254 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_256 ?AUTO_263 ?AUTO_254 )
      ( DELIVER-PKG ?AUTO_250 ?AUTO_251 )
      ( DELIVER-PKG-VERIFY ?AUTO_250 ?AUTO_251 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_279 - OBJ
      ?AUTO_280 - LOCATION
    )
    :vars
    (
      ?AUTO_281 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_281 ?AUTO_280 ) ( IN-TRUCK ?AUTO_279 ?AUTO_281 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_279 ?AUTO_281 ?AUTO_280 )
      ( DELIVER-PKG-VERIFY ?AUTO_279 ?AUTO_280 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_284 - OBJ
      ?AUTO_285 - LOCATION
    )
    :vars
    (
      ?AUTO_288 - TRUCK
      ?AUTO_291 - LOCATION
      ?AUTO_290 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_284 ?AUTO_288 ) ( TRUCK-AT ?AUTO_288 ?AUTO_291 ) ( IN-CITY ?AUTO_291 ?AUTO_290 ) ( IN-CITY ?AUTO_285 ?AUTO_290 ) ( not ( = ?AUTO_285 ?AUTO_291 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_288 ?AUTO_291 ?AUTO_285 ?AUTO_290 )
      ( DELIVER-PKG ?AUTO_284 ?AUTO_285 )
      ( DELIVER-PKG-VERIFY ?AUTO_284 ?AUTO_285 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_325 - OBJ
      ?AUTO_326 - LOCATION
    )
    :vars
    (
      ?AUTO_327 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_327 ?AUTO_326 ) ( IN-TRUCK ?AUTO_325 ?AUTO_327 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_325 ?AUTO_327 ?AUTO_326 )
      ( DELIVER-PKG-VERIFY ?AUTO_325 ?AUTO_326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_334 - OBJ
      ?AUTO_335 - LOCATION
    )
    :vars
    (
      ?AUTO_337 - TRUCK
      ?AUTO_341 - LOCATION
      ?AUTO_340 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_334 ?AUTO_337 ) ( TRUCK-AT ?AUTO_337 ?AUTO_341 ) ( IN-CITY ?AUTO_341 ?AUTO_340 ) ( IN-CITY ?AUTO_335 ?AUTO_340 ) ( not ( = ?AUTO_335 ?AUTO_341 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_337 ?AUTO_341 ?AUTO_335 ?AUTO_340 )
      ( DELIVER-PKG ?AUTO_334 ?AUTO_335 )
      ( DELIVER-PKG-VERIFY ?AUTO_334 ?AUTO_335 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_343 - OBJ
      ?AUTO_344 - LOCATION
    )
    :vars
    (
      ?AUTO_347 - TRUCK
      ?AUTO_349 - LOCATION
      ?AUTO_348 - CITY
      ?AUTO_351 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_347 ?AUTO_349 ) ( IN-CITY ?AUTO_349 ?AUTO_348 ) ( IN-CITY ?AUTO_344 ?AUTO_348 ) ( not ( = ?AUTO_344 ?AUTO_349 ) ) ( TRUCK-AT ?AUTO_347 ?AUTO_351 ) ( OBJ-AT ?AUTO_343 ?AUTO_351 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_343 ?AUTO_347 ?AUTO_351 )
      ( DELIVER-PKG ?AUTO_343 ?AUTO_344 )
      ( DELIVER-PKG-VERIFY ?AUTO_343 ?AUTO_344 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_355 - OBJ
      ?AUTO_356 - LOCATION
    )
    :vars
    (
      ?AUTO_362 - LOCATION
      ?AUTO_360 - CITY
      ?AUTO_359 - TRUCK
      ?AUTO_365 - LOCATION
      ?AUTO_364 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_362 ?AUTO_360 ) ( IN-CITY ?AUTO_356 ?AUTO_360 ) ( not ( = ?AUTO_356 ?AUTO_362 ) ) ( OBJ-AT ?AUTO_355 ?AUTO_362 ) ( TRUCK-AT ?AUTO_359 ?AUTO_365 ) ( IN-CITY ?AUTO_365 ?AUTO_364 ) ( IN-CITY ?AUTO_362 ?AUTO_364 ) ( not ( = ?AUTO_362 ?AUTO_365 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_359 ?AUTO_365 ?AUTO_362 ?AUTO_364 )
      ( DELIVER-PKG ?AUTO_355 ?AUTO_356 )
      ( DELIVER-PKG-VERIFY ?AUTO_355 ?AUTO_356 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_369 - OBJ
      ?AUTO_370 - LOCATION
    )
    :vars
    (
      ?AUTO_372 - LOCATION
      ?AUTO_371 - CITY
      ?AUTO_374 - TRUCK
      ?AUTO_376 - LOCATION
      ?AUTO_377 - CITY
      ?AUTO_378 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_372 ?AUTO_371 ) ( IN-CITY ?AUTO_370 ?AUTO_371 ) ( not ( = ?AUTO_370 ?AUTO_372 ) ) ( TRUCK-AT ?AUTO_374 ?AUTO_376 ) ( IN-CITY ?AUTO_376 ?AUTO_377 ) ( IN-CITY ?AUTO_372 ?AUTO_377 ) ( not ( = ?AUTO_372 ?AUTO_376 ) ) ( IN-AIRPLANE ?AUTO_369 ?AUTO_378 ) ( AIRPLANE-AT ?AUTO_378 ?AUTO_372 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_369 ?AUTO_378 ?AUTO_372 )
      ( DELIVER-PKG ?AUTO_369 ?AUTO_370 )
      ( DELIVER-PKG-VERIFY ?AUTO_369 ?AUTO_370 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_381 - OBJ
      ?AUTO_382 - LOCATION
    )
    :vars
    (
      ?AUTO_387 - LOCATION
      ?AUTO_386 - CITY
      ?AUTO_389 - TRUCK
      ?AUTO_385 - LOCATION
      ?AUTO_388 - CITY
      ?AUTO_390 - AIRPLANE
      ?AUTO_392 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_387 ?AUTO_386 ) ( IN-CITY ?AUTO_382 ?AUTO_386 ) ( not ( = ?AUTO_382 ?AUTO_387 ) ) ( TRUCK-AT ?AUTO_389 ?AUTO_385 ) ( IN-CITY ?AUTO_385 ?AUTO_388 ) ( IN-CITY ?AUTO_387 ?AUTO_388 ) ( not ( = ?AUTO_387 ?AUTO_385 ) ) ( IN-AIRPLANE ?AUTO_381 ?AUTO_390 ) ( AIRPORT ?AUTO_392 ) ( AIRPORT ?AUTO_387 ) ( AIRPLANE-AT ?AUTO_390 ?AUTO_392 ) ( not ( = ?AUTO_392 ?AUTO_387 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_390 ?AUTO_392 ?AUTO_387 )
      ( DELIVER-PKG ?AUTO_381 ?AUTO_382 )
      ( DELIVER-PKG-VERIFY ?AUTO_381 ?AUTO_382 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_406 - OBJ
      ?AUTO_407 - LOCATION
    )
    :vars
    (
      ?AUTO_411 - LOCATION
      ?AUTO_410 - CITY
      ?AUTO_409 - TRUCK
      ?AUTO_416 - LOCATION
      ?AUTO_408 - CITY
      ?AUTO_414 - LOCATION
      ?AUTO_415 - AIRPLANE
      ?AUTO_418 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_411 ?AUTO_410 ) ( IN-CITY ?AUTO_407 ?AUTO_410 ) ( not ( = ?AUTO_407 ?AUTO_411 ) ) ( TRUCK-AT ?AUTO_409 ?AUTO_416 ) ( IN-CITY ?AUTO_416 ?AUTO_408 ) ( IN-CITY ?AUTO_411 ?AUTO_408 ) ( not ( = ?AUTO_411 ?AUTO_416 ) ) ( AIRPORT ?AUTO_414 ) ( AIRPORT ?AUTO_411 ) ( AIRPLANE-AT ?AUTO_415 ?AUTO_414 ) ( not ( = ?AUTO_414 ?AUTO_411 ) ) ( OBJ-AT ?AUTO_406 ?AUTO_418 ) ( AIRPLANE-AT ?AUTO_415 ?AUTO_418 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_406 ?AUTO_415 ?AUTO_418 )
      ( DELIVER-PKG ?AUTO_406 ?AUTO_407 )
      ( DELIVER-PKG-VERIFY ?AUTO_406 ?AUTO_407 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_420 - OBJ
      ?AUTO_421 - LOCATION
    )
    :vars
    (
      ?AUTO_429 - LOCATION
      ?AUTO_431 - CITY
      ?AUTO_424 - TRUCK
      ?AUTO_427 - LOCATION
      ?AUTO_426 - CITY
      ?AUTO_425 - LOCATION
      ?AUTO_430 - AIRPLANE
      ?AUTO_428 - LOCATION
      ?AUTO_432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_429 ?AUTO_431 ) ( IN-CITY ?AUTO_421 ?AUTO_431 ) ( not ( = ?AUTO_421 ?AUTO_429 ) ) ( TRUCK-AT ?AUTO_424 ?AUTO_427 ) ( IN-CITY ?AUTO_427 ?AUTO_426 ) ( IN-CITY ?AUTO_429 ?AUTO_426 ) ( not ( = ?AUTO_429 ?AUTO_427 ) ) ( AIRPORT ?AUTO_425 ) ( AIRPORT ?AUTO_429 ) ( AIRPLANE-AT ?AUTO_430 ?AUTO_425 ) ( not ( = ?AUTO_425 ?AUTO_429 ) ) ( AIRPLANE-AT ?AUTO_430 ?AUTO_428 ) ( TRUCK-AT ?AUTO_432 ?AUTO_428 ) ( IN-TRUCK ?AUTO_420 ?AUTO_432 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_420 ?AUTO_432 ?AUTO_428 )
      ( DELIVER-PKG ?AUTO_420 ?AUTO_421 )
      ( DELIVER-PKG-VERIFY ?AUTO_420 ?AUTO_421 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_435 - OBJ
      ?AUTO_436 - LOCATION
    )
    :vars
    (
      ?AUTO_447 - LOCATION
      ?AUTO_438 - CITY
      ?AUTO_439 - TRUCK
      ?AUTO_442 - LOCATION
      ?AUTO_446 - CITY
      ?AUTO_441 - LOCATION
      ?AUTO_440 - AIRPLANE
      ?AUTO_437 - LOCATION
      ?AUTO_445 - TRUCK
      ?AUTO_450 - LOCATION
      ?AUTO_449 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_447 ?AUTO_438 ) ( IN-CITY ?AUTO_436 ?AUTO_438 ) ( not ( = ?AUTO_436 ?AUTO_447 ) ) ( TRUCK-AT ?AUTO_439 ?AUTO_442 ) ( IN-CITY ?AUTO_442 ?AUTO_446 ) ( IN-CITY ?AUTO_447 ?AUTO_446 ) ( not ( = ?AUTO_447 ?AUTO_442 ) ) ( AIRPORT ?AUTO_441 ) ( AIRPORT ?AUTO_447 ) ( AIRPLANE-AT ?AUTO_440 ?AUTO_441 ) ( not ( = ?AUTO_441 ?AUTO_447 ) ) ( AIRPLANE-AT ?AUTO_440 ?AUTO_437 ) ( IN-TRUCK ?AUTO_435 ?AUTO_445 ) ( TRUCK-AT ?AUTO_445 ?AUTO_450 ) ( IN-CITY ?AUTO_450 ?AUTO_449 ) ( IN-CITY ?AUTO_437 ?AUTO_449 ) ( not ( = ?AUTO_437 ?AUTO_450 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_445 ?AUTO_450 ?AUTO_437 ?AUTO_449 )
      ( DELIVER-PKG ?AUTO_435 ?AUTO_436 )
      ( DELIVER-PKG-VERIFY ?AUTO_435 ?AUTO_436 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_452 - OBJ
      ?AUTO_453 - LOCATION
    )
    :vars
    (
      ?AUTO_465 - LOCATION
      ?AUTO_463 - CITY
      ?AUTO_455 - TRUCK
      ?AUTO_462 - LOCATION
      ?AUTO_454 - CITY
      ?AUTO_459 - LOCATION
      ?AUTO_466 - AIRPLANE
      ?AUTO_457 - LOCATION
      ?AUTO_464 - TRUCK
      ?AUTO_461 - LOCATION
      ?AUTO_460 - CITY
      ?AUTO_468 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_465 ?AUTO_463 ) ( IN-CITY ?AUTO_453 ?AUTO_463 ) ( not ( = ?AUTO_453 ?AUTO_465 ) ) ( TRUCK-AT ?AUTO_455 ?AUTO_462 ) ( IN-CITY ?AUTO_462 ?AUTO_454 ) ( IN-CITY ?AUTO_465 ?AUTO_454 ) ( not ( = ?AUTO_465 ?AUTO_462 ) ) ( AIRPORT ?AUTO_459 ) ( AIRPORT ?AUTO_465 ) ( AIRPLANE-AT ?AUTO_466 ?AUTO_459 ) ( not ( = ?AUTO_459 ?AUTO_465 ) ) ( AIRPLANE-AT ?AUTO_466 ?AUTO_457 ) ( TRUCK-AT ?AUTO_464 ?AUTO_461 ) ( IN-CITY ?AUTO_461 ?AUTO_460 ) ( IN-CITY ?AUTO_457 ?AUTO_460 ) ( not ( = ?AUTO_457 ?AUTO_461 ) ) ( TRUCK-AT ?AUTO_464 ?AUTO_468 ) ( OBJ-AT ?AUTO_452 ?AUTO_468 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_452 ?AUTO_464 ?AUTO_468 )
      ( DELIVER-PKG ?AUTO_452 ?AUTO_453 )
      ( DELIVER-PKG-VERIFY ?AUTO_452 ?AUTO_453 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_470 - OBJ
      ?AUTO_471 - LOCATION
    )
    :vars
    (
      ?AUTO_477 - LOCATION
      ?AUTO_485 - CITY
      ?AUTO_481 - TRUCK
      ?AUTO_484 - LOCATION
      ?AUTO_479 - CITY
      ?AUTO_474 - LOCATION
      ?AUTO_475 - AIRPLANE
      ?AUTO_472 - LOCATION
      ?AUTO_473 - LOCATION
      ?AUTO_476 - CITY
      ?AUTO_478 - TRUCK
      ?AUTO_488 - LOCATION
      ?AUTO_487 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_477 ?AUTO_485 ) ( IN-CITY ?AUTO_471 ?AUTO_485 ) ( not ( = ?AUTO_471 ?AUTO_477 ) ) ( TRUCK-AT ?AUTO_481 ?AUTO_484 ) ( IN-CITY ?AUTO_484 ?AUTO_479 ) ( IN-CITY ?AUTO_477 ?AUTO_479 ) ( not ( = ?AUTO_477 ?AUTO_484 ) ) ( AIRPORT ?AUTO_474 ) ( AIRPORT ?AUTO_477 ) ( AIRPLANE-AT ?AUTO_475 ?AUTO_474 ) ( not ( = ?AUTO_474 ?AUTO_477 ) ) ( AIRPLANE-AT ?AUTO_475 ?AUTO_472 ) ( IN-CITY ?AUTO_473 ?AUTO_476 ) ( IN-CITY ?AUTO_472 ?AUTO_476 ) ( not ( = ?AUTO_472 ?AUTO_473 ) ) ( OBJ-AT ?AUTO_470 ?AUTO_473 ) ( TRUCK-AT ?AUTO_478 ?AUTO_488 ) ( IN-CITY ?AUTO_488 ?AUTO_487 ) ( IN-CITY ?AUTO_473 ?AUTO_487 ) ( not ( = ?AUTO_473 ?AUTO_488 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_478 ?AUTO_488 ?AUTO_473 ?AUTO_487 )
      ( DELIVER-PKG ?AUTO_470 ?AUTO_471 )
      ( DELIVER-PKG-VERIFY ?AUTO_470 ?AUTO_471 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_494 - OBJ
      ?AUTO_495 - LOCATION
    )
    :vars
    (
      ?AUTO_496 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_494 ?AUTO_496 ) ( AIRPLANE-AT ?AUTO_496 ?AUTO_495 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_494 ?AUTO_496 ?AUTO_495 )
      ( DELIVER-PKG-VERIFY ?AUTO_494 ?AUTO_495 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_501 - OBJ
      ?AUTO_502 - LOCATION
    )
    :vars
    (
      ?AUTO_503 - AIRPLANE
      ?AUTO_507 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_501 ?AUTO_503 ) ( AIRPORT ?AUTO_507 ) ( AIRPORT ?AUTO_502 ) ( AIRPLANE-AT ?AUTO_503 ?AUTO_507 ) ( not ( = ?AUTO_507 ?AUTO_502 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_503 ?AUTO_507 ?AUTO_502 )
      ( DELIVER-PKG ?AUTO_501 ?AUTO_502 )
      ( DELIVER-PKG-VERIFY ?AUTO_501 ?AUTO_502 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_509 - OBJ
      ?AUTO_510 - LOCATION
    )
    :vars
    (
      ?AUTO_514 - LOCATION
      ?AUTO_513 - AIRPLANE
      ?AUTO_516 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_514 ) ( AIRPORT ?AUTO_510 ) ( AIRPLANE-AT ?AUTO_513 ?AUTO_514 ) ( not ( = ?AUTO_514 ?AUTO_510 ) ) ( OBJ-AT ?AUTO_509 ?AUTO_516 ) ( AIRPLANE-AT ?AUTO_513 ?AUTO_516 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_509 ?AUTO_513 ?AUTO_516 )
      ( DELIVER-PKG ?AUTO_509 ?AUTO_510 )
      ( DELIVER-PKG-VERIFY ?AUTO_509 ?AUTO_510 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_522 - OBJ
      ?AUTO_523 - LOCATION
    )
    :vars
    (
      ?AUTO_525 - LOCATION
      ?AUTO_526 - AIRPLANE
      ?AUTO_524 - LOCATION
      ?AUTO_529 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_525 ) ( AIRPORT ?AUTO_523 ) ( AIRPLANE-AT ?AUTO_526 ?AUTO_525 ) ( not ( = ?AUTO_525 ?AUTO_523 ) ) ( AIRPLANE-AT ?AUTO_526 ?AUTO_524 ) ( TRUCK-AT ?AUTO_529 ?AUTO_524 ) ( IN-TRUCK ?AUTO_522 ?AUTO_529 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_522 ?AUTO_529 ?AUTO_524 )
      ( DELIVER-PKG ?AUTO_522 ?AUTO_523 )
      ( DELIVER-PKG-VERIFY ?AUTO_522 ?AUTO_523 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_532 - OBJ
      ?AUTO_533 - LOCATION
    )
    :vars
    (
      ?AUTO_537 - LOCATION
      ?AUTO_538 - AIRPLANE
      ?AUTO_536 - LOCATION
      ?AUTO_539 - TRUCK
      ?AUTO_542 - LOCATION
      ?AUTO_541 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_537 ) ( AIRPORT ?AUTO_533 ) ( AIRPLANE-AT ?AUTO_538 ?AUTO_537 ) ( not ( = ?AUTO_537 ?AUTO_533 ) ) ( AIRPLANE-AT ?AUTO_538 ?AUTO_536 ) ( IN-TRUCK ?AUTO_532 ?AUTO_539 ) ( TRUCK-AT ?AUTO_539 ?AUTO_542 ) ( IN-CITY ?AUTO_542 ?AUTO_541 ) ( IN-CITY ?AUTO_536 ?AUTO_541 ) ( not ( = ?AUTO_536 ?AUTO_542 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_539 ?AUTO_542 ?AUTO_536 ?AUTO_541 )
      ( DELIVER-PKG ?AUTO_532 ?AUTO_533 )
      ( DELIVER-PKG-VERIFY ?AUTO_532 ?AUTO_533 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_548 - OBJ
      ?AUTO_549 - LOCATION
    )
    :vars
    (
      ?AUTO_555 - LOCATION
      ?AUTO_550 - TRUCK
      ?AUTO_554 - LOCATION
      ?AUTO_551 - CITY
      ?AUTO_559 - LOCATION
      ?AUTO_552 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_555 ) ( AIRPORT ?AUTO_549 ) ( not ( = ?AUTO_555 ?AUTO_549 ) ) ( IN-TRUCK ?AUTO_548 ?AUTO_550 ) ( TRUCK-AT ?AUTO_550 ?AUTO_554 ) ( IN-CITY ?AUTO_554 ?AUTO_551 ) ( IN-CITY ?AUTO_555 ?AUTO_551 ) ( not ( = ?AUTO_555 ?AUTO_554 ) ) ( AIRPORT ?AUTO_559 ) ( AIRPLANE-AT ?AUTO_552 ?AUTO_559 ) ( not ( = ?AUTO_559 ?AUTO_555 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_552 ?AUTO_559 ?AUTO_555 )
      ( DELIVER-PKG ?AUTO_548 ?AUTO_549 )
      ( DELIVER-PKG-VERIFY ?AUTO_548 ?AUTO_549 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_562 - OBJ
      ?AUTO_563 - LOCATION
    )
    :vars
    (
      ?AUTO_564 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_562 ?AUTO_564 ) ( AIRPLANE-AT ?AUTO_564 ?AUTO_563 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_562 ?AUTO_564 ?AUTO_563 )
      ( DELIVER-PKG-VERIFY ?AUTO_562 ?AUTO_563 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_567 - OBJ
      ?AUTO_568 - LOCATION
    )
    :vars
    (
      ?AUTO_571 - AIRPLANE
      ?AUTO_573 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_567 ?AUTO_571 ) ( AIRPORT ?AUTO_573 ) ( AIRPORT ?AUTO_568 ) ( AIRPLANE-AT ?AUTO_571 ?AUTO_573 ) ( not ( = ?AUTO_573 ?AUTO_568 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_571 ?AUTO_573 ?AUTO_568 )
      ( DELIVER-PKG ?AUTO_567 ?AUTO_568 )
      ( DELIVER-PKG-VERIFY ?AUTO_567 ?AUTO_568 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_575 - OBJ
      ?AUTO_576 - LOCATION
    )
    :vars
    (
      ?AUTO_580 - LOCATION
      ?AUTO_579 - AIRPLANE
      ?AUTO_582 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_580 ) ( AIRPORT ?AUTO_576 ) ( AIRPLANE-AT ?AUTO_579 ?AUTO_580 ) ( not ( = ?AUTO_580 ?AUTO_576 ) ) ( OBJ-AT ?AUTO_575 ?AUTO_582 ) ( AIRPLANE-AT ?AUTO_579 ?AUTO_582 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_575 ?AUTO_579 ?AUTO_582 )
      ( DELIVER-PKG ?AUTO_575 ?AUTO_576 )
      ( DELIVER-PKG-VERIFY ?AUTO_575 ?AUTO_576 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_584 - OBJ
      ?AUTO_585 - LOCATION
    )
    :vars
    (
      ?AUTO_586 - LOCATION
      ?AUTO_592 - LOCATION
      ?AUTO_590 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_586 ) ( AIRPORT ?AUTO_585 ) ( not ( = ?AUTO_586 ?AUTO_585 ) ) ( OBJ-AT ?AUTO_584 ?AUTO_586 ) ( AIRPORT ?AUTO_592 ) ( AIRPLANE-AT ?AUTO_590 ?AUTO_592 ) ( not ( = ?AUTO_592 ?AUTO_586 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_590 ?AUTO_592 ?AUTO_586 )
      ( DELIVER-PKG ?AUTO_584 ?AUTO_585 )
      ( DELIVER-PKG-VERIFY ?AUTO_584 ?AUTO_585 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_595 - OBJ
      ?AUTO_596 - LOCATION
    )
    :vars
    (
      ?AUTO_597 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_597 ?AUTO_596 ) ( IN-TRUCK ?AUTO_595 ?AUTO_597 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_595 ?AUTO_597 ?AUTO_596 )
      ( DELIVER-PKG-VERIFY ?AUTO_595 ?AUTO_596 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_600 - OBJ
      ?AUTO_601 - LOCATION
    )
    :vars
    (
      ?AUTO_602 - TRUCK
      ?AUTO_607 - LOCATION
      ?AUTO_606 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_600 ?AUTO_602 ) ( TRUCK-AT ?AUTO_602 ?AUTO_607 ) ( IN-CITY ?AUTO_607 ?AUTO_606 ) ( IN-CITY ?AUTO_601 ?AUTO_606 ) ( not ( = ?AUTO_601 ?AUTO_607 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_602 ?AUTO_607 ?AUTO_601 ?AUTO_606 )
      ( DELIVER-PKG ?AUTO_600 ?AUTO_601 )
      ( DELIVER-PKG-VERIFY ?AUTO_600 ?AUTO_601 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_609 - OBJ
      ?AUTO_610 - LOCATION
    )
    :vars
    (
      ?AUTO_613 - TRUCK
      ?AUTO_615 - LOCATION
      ?AUTO_614 - CITY
      ?AUTO_617 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_613 ?AUTO_615 ) ( IN-CITY ?AUTO_615 ?AUTO_614 ) ( IN-CITY ?AUTO_610 ?AUTO_614 ) ( not ( = ?AUTO_610 ?AUTO_615 ) ) ( TRUCK-AT ?AUTO_613 ?AUTO_617 ) ( OBJ-AT ?AUTO_609 ?AUTO_617 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_609 ?AUTO_613 ?AUTO_617 )
      ( DELIVER-PKG ?AUTO_609 ?AUTO_610 )
      ( DELIVER-PKG-VERIFY ?AUTO_609 ?AUTO_610 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_619 - OBJ
      ?AUTO_620 - LOCATION
    )
    :vars
    (
      ?AUTO_621 - LOCATION
      ?AUTO_626 - CITY
      ?AUTO_625 - TRUCK
      ?AUTO_629 - LOCATION
      ?AUTO_628 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_621 ?AUTO_626 ) ( IN-CITY ?AUTO_620 ?AUTO_626 ) ( not ( = ?AUTO_620 ?AUTO_621 ) ) ( OBJ-AT ?AUTO_619 ?AUTO_621 ) ( TRUCK-AT ?AUTO_625 ?AUTO_629 ) ( IN-CITY ?AUTO_629 ?AUTO_628 ) ( IN-CITY ?AUTO_621 ?AUTO_628 ) ( not ( = ?AUTO_621 ?AUTO_629 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_625 ?AUTO_629 ?AUTO_621 ?AUTO_628 )
      ( DELIVER-PKG ?AUTO_619 ?AUTO_620 )
      ( DELIVER-PKG-VERIFY ?AUTO_619 ?AUTO_620 ) )
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
      ?AUTO_638 - OBJ
      ?AUTO_639 - LOCATION
    )
    :vars
    (
      ?AUTO_642 - AIRPLANE
      ?AUTO_644 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_638 ?AUTO_642 ) ( AIRPORT ?AUTO_644 ) ( AIRPORT ?AUTO_639 ) ( AIRPLANE-AT ?AUTO_642 ?AUTO_644 ) ( not ( = ?AUTO_644 ?AUTO_639 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_642 ?AUTO_644 ?AUTO_639 )
      ( DELIVER-PKG ?AUTO_638 ?AUTO_639 )
      ( DELIVER-PKG-VERIFY ?AUTO_638 ?AUTO_639 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_648 - OBJ
      ?AUTO_649 - LOCATION
    )
    :vars
    (
      ?AUTO_653 - LOCATION
      ?AUTO_650 - AIRPLANE
      ?AUTO_655 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_653 ) ( AIRPORT ?AUTO_649 ) ( AIRPLANE-AT ?AUTO_650 ?AUTO_653 ) ( not ( = ?AUTO_653 ?AUTO_649 ) ) ( OBJ-AT ?AUTO_648 ?AUTO_655 ) ( AIRPLANE-AT ?AUTO_650 ?AUTO_655 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_648 ?AUTO_650 ?AUTO_655 )
      ( DELIVER-PKG ?AUTO_648 ?AUTO_649 )
      ( DELIVER-PKG-VERIFY ?AUTO_648 ?AUTO_649 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_657 - OBJ
      ?AUTO_658 - LOCATION
    )
    :vars
    (
      ?AUTO_663 - LOCATION
      ?AUTO_665 - LOCATION
      ?AUTO_661 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_663 ) ( AIRPORT ?AUTO_658 ) ( not ( = ?AUTO_663 ?AUTO_658 ) ) ( OBJ-AT ?AUTO_657 ?AUTO_663 ) ( AIRPORT ?AUTO_665 ) ( AIRPLANE-AT ?AUTO_661 ?AUTO_665 ) ( not ( = ?AUTO_665 ?AUTO_663 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_661 ?AUTO_665 ?AUTO_663 )
      ( DELIVER-PKG ?AUTO_657 ?AUTO_658 )
      ( DELIVER-PKG-VERIFY ?AUTO_657 ?AUTO_658 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_689 - OBJ
      ?AUTO_690 - LOCATION
    )
    :vars
    (
      ?AUTO_691 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_689 ?AUTO_691 ) ( AIRPLANE-AT ?AUTO_691 ?AUTO_690 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_689 ?AUTO_691 ?AUTO_690 )
      ( DELIVER-PKG-VERIFY ?AUTO_689 ?AUTO_690 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_694 - OBJ
      ?AUTO_695 - LOCATION
    )
    :vars
    (
      ?AUTO_698 - AIRPLANE
      ?AUTO_700 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_694 ?AUTO_698 ) ( AIRPORT ?AUTO_700 ) ( AIRPORT ?AUTO_695 ) ( AIRPLANE-AT ?AUTO_698 ?AUTO_700 ) ( not ( = ?AUTO_700 ?AUTO_695 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_698 ?AUTO_700 ?AUTO_695 )
      ( DELIVER-PKG ?AUTO_694 ?AUTO_695 )
      ( DELIVER-PKG-VERIFY ?AUTO_694 ?AUTO_695 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_728 - OBJ
      ?AUTO_729 - LOCATION
    )
    :vars
    (
      ?AUTO_732 - LOCATION
      ?AUTO_733 - LOCATION
      ?AUTO_734 - AIRPLANE
      ?AUTO_735 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_732 ) ( AIRPORT ?AUTO_729 ) ( not ( = ?AUTO_732 ?AUTO_729 ) ) ( AIRPORT ?AUTO_733 ) ( AIRPLANE-AT ?AUTO_734 ?AUTO_733 ) ( not ( = ?AUTO_733 ?AUTO_732 ) ) ( TRUCK-AT ?AUTO_735 ?AUTO_732 ) ( IN-TRUCK ?AUTO_728 ?AUTO_735 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_728 ?AUTO_735 ?AUTO_732 )
      ( DELIVER-PKG ?AUTO_728 ?AUTO_729 )
      ( DELIVER-PKG-VERIFY ?AUTO_728 ?AUTO_729 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_738 - OBJ
      ?AUTO_739 - LOCATION
    )
    :vars
    (
      ?AUTO_744 - LOCATION
      ?AUTO_743 - LOCATION
      ?AUTO_742 - AIRPLANE
      ?AUTO_745 - TRUCK
      ?AUTO_748 - LOCATION
      ?AUTO_747 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_744 ) ( AIRPORT ?AUTO_739 ) ( not ( = ?AUTO_744 ?AUTO_739 ) ) ( AIRPORT ?AUTO_743 ) ( AIRPLANE-AT ?AUTO_742 ?AUTO_743 ) ( not ( = ?AUTO_743 ?AUTO_744 ) ) ( IN-TRUCK ?AUTO_738 ?AUTO_745 ) ( TRUCK-AT ?AUTO_745 ?AUTO_748 ) ( IN-CITY ?AUTO_748 ?AUTO_747 ) ( IN-CITY ?AUTO_744 ?AUTO_747 ) ( not ( = ?AUTO_744 ?AUTO_748 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_745 ?AUTO_748 ?AUTO_744 ?AUTO_747 )
      ( DELIVER-PKG ?AUTO_738 ?AUTO_739 )
      ( DELIVER-PKG-VERIFY ?AUTO_738 ?AUTO_739 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_750 - OBJ
      ?AUTO_751 - LOCATION
    )
    :vars
    (
      ?AUTO_758 - LOCATION
      ?AUTO_753 - LOCATION
      ?AUTO_757 - AIRPLANE
      ?AUTO_756 - TRUCK
      ?AUTO_759 - LOCATION
      ?AUTO_752 - CITY
      ?AUTO_761 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_758 ) ( AIRPORT ?AUTO_751 ) ( not ( = ?AUTO_758 ?AUTO_751 ) ) ( AIRPORT ?AUTO_753 ) ( AIRPLANE-AT ?AUTO_757 ?AUTO_753 ) ( not ( = ?AUTO_753 ?AUTO_758 ) ) ( TRUCK-AT ?AUTO_756 ?AUTO_759 ) ( IN-CITY ?AUTO_759 ?AUTO_752 ) ( IN-CITY ?AUTO_758 ?AUTO_752 ) ( not ( = ?AUTO_758 ?AUTO_759 ) ) ( TRUCK-AT ?AUTO_756 ?AUTO_761 ) ( OBJ-AT ?AUTO_750 ?AUTO_761 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_750 ?AUTO_756 ?AUTO_761 )
      ( DELIVER-PKG ?AUTO_750 ?AUTO_751 )
      ( DELIVER-PKG-VERIFY ?AUTO_750 ?AUTO_751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_763 - OBJ
      ?AUTO_764 - LOCATION
    )
    :vars
    (
      ?AUTO_768 - LOCATION
      ?AUTO_771 - LOCATION
      ?AUTO_773 - AIRPLANE
      ?AUTO_770 - LOCATION
      ?AUTO_772 - CITY
      ?AUTO_765 - TRUCK
      ?AUTO_776 - LOCATION
      ?AUTO_775 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_768 ) ( AIRPORT ?AUTO_764 ) ( not ( = ?AUTO_768 ?AUTO_764 ) ) ( AIRPORT ?AUTO_771 ) ( AIRPLANE-AT ?AUTO_773 ?AUTO_771 ) ( not ( = ?AUTO_771 ?AUTO_768 ) ) ( IN-CITY ?AUTO_770 ?AUTO_772 ) ( IN-CITY ?AUTO_768 ?AUTO_772 ) ( not ( = ?AUTO_768 ?AUTO_770 ) ) ( OBJ-AT ?AUTO_763 ?AUTO_770 ) ( TRUCK-AT ?AUTO_765 ?AUTO_776 ) ( IN-CITY ?AUTO_776 ?AUTO_775 ) ( IN-CITY ?AUTO_770 ?AUTO_775 ) ( not ( = ?AUTO_770 ?AUTO_776 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_765 ?AUTO_776 ?AUTO_770 ?AUTO_775 )
      ( DELIVER-PKG ?AUTO_763 ?AUTO_764 )
      ( DELIVER-PKG-VERIFY ?AUTO_763 ?AUTO_764 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_780 - OBJ
      ?AUTO_781 - LOCATION
    )
    :vars
    (
      ?AUTO_782 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_780 ?AUTO_782 ) ( AIRPLANE-AT ?AUTO_782 ?AUTO_781 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_780 ?AUTO_782 ?AUTO_781 )
      ( DELIVER-PKG-VERIFY ?AUTO_780 ?AUTO_781 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_825 - OBJ
      ?AUTO_826 - LOCATION
    )
    :vars
    (
      ?AUTO_827 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_825 ?AUTO_827 ) ( AIRPLANE-AT ?AUTO_827 ?AUTO_826 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_825 ?AUTO_827 ?AUTO_826 )
      ( DELIVER-PKG-VERIFY ?AUTO_825 ?AUTO_826 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_872 - OBJ
      ?AUTO_873 - LOCATION
    )
    :vars
    (
      ?AUTO_874 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_872 ?AUTO_874 ) ( AIRPLANE-AT ?AUTO_874 ?AUTO_873 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_872 ?AUTO_874 ?AUTO_873 )
      ( DELIVER-PKG-VERIFY ?AUTO_872 ?AUTO_873 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_921 - OBJ
      ?AUTO_922 - LOCATION
    )
    :vars
    (
      ?AUTO_923 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_921 ?AUTO_923 ) ( AIRPLANE-AT ?AUTO_923 ?AUTO_922 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_921 ?AUTO_923 ?AUTO_922 )
      ( DELIVER-PKG-VERIFY ?AUTO_921 ?AUTO_922 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_944 - OBJ
      ?AUTO_945 - LOCATION
    )
    :vars
    (
      ?AUTO_946 - LOCATION
      ?AUTO_947 - AIRPLANE
      ?AUTO_951 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_946 ) ( AIRPORT ?AUTO_945 ) ( AIRPLANE-AT ?AUTO_947 ?AUTO_946 ) ( not ( = ?AUTO_946 ?AUTO_945 ) ) ( OBJ-AT ?AUTO_944 ?AUTO_951 ) ( AIRPLANE-AT ?AUTO_947 ?AUTO_951 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_944 ?AUTO_947 ?AUTO_951 )
      ( DELIVER-PKG ?AUTO_944 ?AUTO_945 )
      ( DELIVER-PKG-VERIFY ?AUTO_944 ?AUTO_945 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_979 - OBJ
      ?AUTO_980 - LOCATION
    )
    :vars
    (
      ?AUTO_981 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_981 ?AUTO_980 ) ( IN-TRUCK ?AUTO_979 ?AUTO_981 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_979 ?AUTO_981 ?AUTO_980 )
      ( DELIVER-PKG-VERIFY ?AUTO_979 ?AUTO_980 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_998 - OBJ
      ?AUTO_999 - LOCATION
    )
    :vars
    (
      ?AUTO_1000 - TRUCK
      ?AUTO_1005 - LOCATION
      ?AUTO_1004 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_998 ?AUTO_1000 ) ( TRUCK-AT ?AUTO_1000 ?AUTO_1005 ) ( IN-CITY ?AUTO_1005 ?AUTO_1004 ) ( IN-CITY ?AUTO_999 ?AUTO_1004 ) ( not ( = ?AUTO_999 ?AUTO_1005 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1000 ?AUTO_1005 ?AUTO_999 ?AUTO_1004 )
      ( DELIVER-PKG ?AUTO_998 ?AUTO_999 )
      ( DELIVER-PKG-VERIFY ?AUTO_998 ?AUTO_999 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1007 - OBJ
      ?AUTO_1008 - LOCATION
    )
    :vars
    (
      ?AUTO_1011 - TRUCK
      ?AUTO_1013 - LOCATION
      ?AUTO_1012 - CITY
      ?AUTO_1015 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1011 ?AUTO_1013 ) ( IN-CITY ?AUTO_1013 ?AUTO_1012 ) ( IN-CITY ?AUTO_1008 ?AUTO_1012 ) ( not ( = ?AUTO_1008 ?AUTO_1013 ) ) ( TRUCK-AT ?AUTO_1011 ?AUTO_1015 ) ( OBJ-AT ?AUTO_1007 ?AUTO_1015 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1007 ?AUTO_1011 ?AUTO_1015 )
      ( DELIVER-PKG ?AUTO_1007 ?AUTO_1008 )
      ( DELIVER-PKG-VERIFY ?AUTO_1007 ?AUTO_1008 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1017 - OBJ
      ?AUTO_1018 - LOCATION
    )
    :vars
    (
      ?AUTO_1021 - TRUCK
      ?AUTO_1023 - LOCATION
      ?AUTO_1022 - CITY
      ?AUTO_1024 - LOCATION
      ?AUTO_1025 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1021 ?AUTO_1023 ) ( IN-CITY ?AUTO_1023 ?AUTO_1022 ) ( IN-CITY ?AUTO_1018 ?AUTO_1022 ) ( not ( = ?AUTO_1018 ?AUTO_1023 ) ) ( TRUCK-AT ?AUTO_1021 ?AUTO_1024 ) ( IN-AIRPLANE ?AUTO_1017 ?AUTO_1025 ) ( AIRPLANE-AT ?AUTO_1025 ?AUTO_1024 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1017 ?AUTO_1025 ?AUTO_1024 )
      ( DELIVER-PKG ?AUTO_1017 ?AUTO_1018 )
      ( DELIVER-PKG-VERIFY ?AUTO_1017 ?AUTO_1018 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1028 - OBJ
      ?AUTO_1029 - LOCATION
    )
    :vars
    (
      ?AUTO_1036 - TRUCK
      ?AUTO_1031 - LOCATION
      ?AUTO_1032 - CITY
      ?AUTO_1035 - LOCATION
      ?AUTO_1030 - AIRPLANE
      ?AUTO_1038 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1036 ?AUTO_1031 ) ( IN-CITY ?AUTO_1031 ?AUTO_1032 ) ( IN-CITY ?AUTO_1029 ?AUTO_1032 ) ( not ( = ?AUTO_1029 ?AUTO_1031 ) ) ( TRUCK-AT ?AUTO_1036 ?AUTO_1035 ) ( IN-AIRPLANE ?AUTO_1028 ?AUTO_1030 ) ( AIRPORT ?AUTO_1038 ) ( AIRPORT ?AUTO_1035 ) ( AIRPLANE-AT ?AUTO_1030 ?AUTO_1038 ) ( not ( = ?AUTO_1038 ?AUTO_1035 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1030 ?AUTO_1038 ?AUTO_1035 )
      ( DELIVER-PKG ?AUTO_1028 ?AUTO_1029 )
      ( DELIVER-PKG-VERIFY ?AUTO_1028 ?AUTO_1029 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1042 - OBJ
      ?AUTO_1043 - LOCATION
    )
    :vars
    (
      ?AUTO_1048 - TRUCK
      ?AUTO_1044 - LOCATION
      ?AUTO_1045 - CITY
      ?AUTO_1047 - LOCATION
      ?AUTO_1051 - LOCATION
      ?AUTO_1049 - AIRPLANE
      ?AUTO_1053 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1048 ?AUTO_1044 ) ( IN-CITY ?AUTO_1044 ?AUTO_1045 ) ( IN-CITY ?AUTO_1043 ?AUTO_1045 ) ( not ( = ?AUTO_1043 ?AUTO_1044 ) ) ( TRUCK-AT ?AUTO_1048 ?AUTO_1047 ) ( AIRPORT ?AUTO_1051 ) ( AIRPORT ?AUTO_1047 ) ( AIRPLANE-AT ?AUTO_1049 ?AUTO_1051 ) ( not ( = ?AUTO_1051 ?AUTO_1047 ) ) ( OBJ-AT ?AUTO_1042 ?AUTO_1053 ) ( AIRPLANE-AT ?AUTO_1049 ?AUTO_1053 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1042 ?AUTO_1049 ?AUTO_1053 )
      ( DELIVER-PKG ?AUTO_1042 ?AUTO_1043 )
      ( DELIVER-PKG-VERIFY ?AUTO_1042 ?AUTO_1043 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1055 - OBJ
      ?AUTO_1056 - LOCATION
    )
    :vars
    (
      ?AUTO_1061 - TRUCK
      ?AUTO_1064 - LOCATION
      ?AUTO_1063 - CITY
      ?AUTO_1062 - LOCATION
      ?AUTO_1065 - LOCATION
      ?AUTO_1067 - LOCATION
      ?AUTO_1060 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1061 ?AUTO_1064 ) ( IN-CITY ?AUTO_1064 ?AUTO_1063 ) ( IN-CITY ?AUTO_1056 ?AUTO_1063 ) ( not ( = ?AUTO_1056 ?AUTO_1064 ) ) ( TRUCK-AT ?AUTO_1061 ?AUTO_1062 ) ( AIRPORT ?AUTO_1065 ) ( AIRPORT ?AUTO_1062 ) ( not ( = ?AUTO_1065 ?AUTO_1062 ) ) ( OBJ-AT ?AUTO_1055 ?AUTO_1065 ) ( AIRPORT ?AUTO_1067 ) ( AIRPLANE-AT ?AUTO_1060 ?AUTO_1067 ) ( not ( = ?AUTO_1067 ?AUTO_1065 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1060 ?AUTO_1067 ?AUTO_1065 )
      ( DELIVER-PKG ?AUTO_1055 ?AUTO_1056 )
      ( DELIVER-PKG-VERIFY ?AUTO_1055 ?AUTO_1056 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1091 - OBJ
      ?AUTO_1092 - LOCATION
    )
    :vars
    (
      ?AUTO_1093 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1091 ?AUTO_1093 ) ( AIRPLANE-AT ?AUTO_1093 ?AUTO_1092 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1091 ?AUTO_1093 ?AUTO_1092 )
      ( DELIVER-PKG-VERIFY ?AUTO_1091 ?AUTO_1092 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1148 - OBJ
      ?AUTO_1149 - LOCATION
    )
    :vars
    (
      ?AUTO_1150 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1148 ?AUTO_1150 ) ( AIRPLANE-AT ?AUTO_1150 ?AUTO_1149 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1148 ?AUTO_1150 ?AUTO_1149 )
      ( DELIVER-PKG-VERIFY ?AUTO_1148 ?AUTO_1149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1153 - OBJ
      ?AUTO_1154 - LOCATION
    )
    :vars
    (
      ?AUTO_1157 - AIRPLANE
      ?AUTO_1159 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1153 ?AUTO_1157 ) ( AIRPORT ?AUTO_1159 ) ( AIRPORT ?AUTO_1154 ) ( AIRPLANE-AT ?AUTO_1157 ?AUTO_1159 ) ( not ( = ?AUTO_1159 ?AUTO_1154 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1157 ?AUTO_1159 ?AUTO_1154 )
      ( DELIVER-PKG ?AUTO_1153 ?AUTO_1154 )
      ( DELIVER-PKG-VERIFY ?AUTO_1153 ?AUTO_1154 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1165 - OBJ
      ?AUTO_1166 - LOCATION
    )
    :vars
    (
      ?AUTO_1167 - LOCATION
      ?AUTO_1170 - AIRPLANE
      ?AUTO_1172 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1167 ) ( AIRPORT ?AUTO_1166 ) ( AIRPLANE-AT ?AUTO_1170 ?AUTO_1167 ) ( not ( = ?AUTO_1167 ?AUTO_1166 ) ) ( OBJ-AT ?AUTO_1165 ?AUTO_1172 ) ( AIRPLANE-AT ?AUTO_1170 ?AUTO_1172 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1165 ?AUTO_1170 ?AUTO_1172 )
      ( DELIVER-PKG ?AUTO_1165 ?AUTO_1166 )
      ( DELIVER-PKG-VERIFY ?AUTO_1165 ?AUTO_1166 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1184 - OBJ
      ?AUTO_1185 - LOCATION
    )
    :vars
    (
      ?AUTO_1188 - LOCATION
      ?AUTO_1192 - LOCATION
      ?AUTO_1186 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1188 ) ( AIRPORT ?AUTO_1185 ) ( not ( = ?AUTO_1188 ?AUTO_1185 ) ) ( OBJ-AT ?AUTO_1184 ?AUTO_1188 ) ( AIRPORT ?AUTO_1192 ) ( AIRPLANE-AT ?AUTO_1186 ?AUTO_1192 ) ( not ( = ?AUTO_1192 ?AUTO_1188 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1186 ?AUTO_1192 ?AUTO_1188 )
      ( DELIVER-PKG ?AUTO_1184 ?AUTO_1185 )
      ( DELIVER-PKG-VERIFY ?AUTO_1184 ?AUTO_1185 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1230 - OBJ
      ?AUTO_1231 - LOCATION
    )
    :vars
    (
      ?AUTO_1232 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1232 ?AUTO_1231 ) ( IN-TRUCK ?AUTO_1230 ?AUTO_1232 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1230 ?AUTO_1232 ?AUTO_1231 )
      ( DELIVER-PKG-VERIFY ?AUTO_1230 ?AUTO_1231 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1235 - OBJ
      ?AUTO_1236 - LOCATION
    )
    :vars
    (
      ?AUTO_1239 - TRUCK
      ?AUTO_1242 - LOCATION
      ?AUTO_1241 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1235 ?AUTO_1239 ) ( TRUCK-AT ?AUTO_1239 ?AUTO_1242 ) ( IN-CITY ?AUTO_1242 ?AUTO_1241 ) ( IN-CITY ?AUTO_1236 ?AUTO_1241 ) ( not ( = ?AUTO_1236 ?AUTO_1242 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1239 ?AUTO_1242 ?AUTO_1236 ?AUTO_1241 )
      ( DELIVER-PKG ?AUTO_1235 ?AUTO_1236 )
      ( DELIVER-PKG-VERIFY ?AUTO_1235 ?AUTO_1236 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1252 - OBJ
      ?AUTO_1253 - LOCATION
    )
    :vars
    (
      ?AUTO_1255 - TRUCK
      ?AUTO_1254 - LOCATION
      ?AUTO_1256 - CITY
      ?AUTO_1260 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1255 ?AUTO_1254 ) ( IN-CITY ?AUTO_1254 ?AUTO_1256 ) ( IN-CITY ?AUTO_1253 ?AUTO_1256 ) ( not ( = ?AUTO_1253 ?AUTO_1254 ) ) ( TRUCK-AT ?AUTO_1255 ?AUTO_1260 ) ( OBJ-AT ?AUTO_1252 ?AUTO_1260 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1252 ?AUTO_1255 ?AUTO_1260 )
      ( DELIVER-PKG ?AUTO_1252 ?AUTO_1253 )
      ( DELIVER-PKG-VERIFY ?AUTO_1252 ?AUTO_1253 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1262 - OBJ
      ?AUTO_1263 - LOCATION
    )
    :vars
    (
      ?AUTO_1269 - LOCATION
      ?AUTO_1268 - CITY
      ?AUTO_1267 - TRUCK
      ?AUTO_1272 - LOCATION
      ?AUTO_1271 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1269 ?AUTO_1268 ) ( IN-CITY ?AUTO_1263 ?AUTO_1268 ) ( not ( = ?AUTO_1263 ?AUTO_1269 ) ) ( OBJ-AT ?AUTO_1262 ?AUTO_1269 ) ( TRUCK-AT ?AUTO_1267 ?AUTO_1272 ) ( IN-CITY ?AUTO_1272 ?AUTO_1271 ) ( IN-CITY ?AUTO_1269 ?AUTO_1271 ) ( not ( = ?AUTO_1269 ?AUTO_1272 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1267 ?AUTO_1272 ?AUTO_1269 ?AUTO_1271 )
      ( DELIVER-PKG ?AUTO_1262 ?AUTO_1263 )
      ( DELIVER-PKG-VERIFY ?AUTO_1262 ?AUTO_1263 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1292 - OBJ
      ?AUTO_1293 - LOCATION
    )
    :vars
    (
      ?AUTO_1298 - LOCATION
      ?AUTO_1295 - CITY
      ?AUTO_1300 - TRUCK
      ?AUTO_1294 - LOCATION
      ?AUTO_1297 - CITY
      ?AUTO_1301 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1298 ?AUTO_1295 ) ( IN-CITY ?AUTO_1293 ?AUTO_1295 ) ( not ( = ?AUTO_1293 ?AUTO_1298 ) ) ( TRUCK-AT ?AUTO_1300 ?AUTO_1294 ) ( IN-CITY ?AUTO_1294 ?AUTO_1297 ) ( IN-CITY ?AUTO_1298 ?AUTO_1297 ) ( not ( = ?AUTO_1298 ?AUTO_1294 ) ) ( IN-AIRPLANE ?AUTO_1292 ?AUTO_1301 ) ( AIRPLANE-AT ?AUTO_1301 ?AUTO_1298 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1292 ?AUTO_1301 ?AUTO_1298 )
      ( DELIVER-PKG ?AUTO_1292 ?AUTO_1293 )
      ( DELIVER-PKG-VERIFY ?AUTO_1292 ?AUTO_1293 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1304 - OBJ
      ?AUTO_1305 - LOCATION
    )
    :vars
    (
      ?AUTO_1311 - LOCATION
      ?AUTO_1308 - CITY
      ?AUTO_1309 - TRUCK
      ?AUTO_1312 - LOCATION
      ?AUTO_1310 - CITY
      ?AUTO_1313 - AIRPLANE
      ?AUTO_1315 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1311 ?AUTO_1308 ) ( IN-CITY ?AUTO_1305 ?AUTO_1308 ) ( not ( = ?AUTO_1305 ?AUTO_1311 ) ) ( TRUCK-AT ?AUTO_1309 ?AUTO_1312 ) ( IN-CITY ?AUTO_1312 ?AUTO_1310 ) ( IN-CITY ?AUTO_1311 ?AUTO_1310 ) ( not ( = ?AUTO_1311 ?AUTO_1312 ) ) ( IN-AIRPLANE ?AUTO_1304 ?AUTO_1313 ) ( AIRPORT ?AUTO_1315 ) ( AIRPORT ?AUTO_1311 ) ( AIRPLANE-AT ?AUTO_1313 ?AUTO_1315 ) ( not ( = ?AUTO_1315 ?AUTO_1311 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1313 ?AUTO_1315 ?AUTO_1311 )
      ( DELIVER-PKG ?AUTO_1304 ?AUTO_1305 )
      ( DELIVER-PKG-VERIFY ?AUTO_1304 ?AUTO_1305 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1341 - OBJ
      ?AUTO_1342 - LOCATION
    )
    :vars
    (
      ?AUTO_1348 - LOCATION
      ?AUTO_1347 - CITY
      ?AUTO_1344 - TRUCK
      ?AUTO_1345 - LOCATION
      ?AUTO_1346 - CITY
      ?AUTO_1349 - LOCATION
      ?AUTO_1343 - AIRPLANE
      ?AUTO_1353 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1348 ?AUTO_1347 ) ( IN-CITY ?AUTO_1342 ?AUTO_1347 ) ( not ( = ?AUTO_1342 ?AUTO_1348 ) ) ( TRUCK-AT ?AUTO_1344 ?AUTO_1345 ) ( IN-CITY ?AUTO_1345 ?AUTO_1346 ) ( IN-CITY ?AUTO_1348 ?AUTO_1346 ) ( not ( = ?AUTO_1348 ?AUTO_1345 ) ) ( AIRPORT ?AUTO_1349 ) ( AIRPORT ?AUTO_1348 ) ( AIRPLANE-AT ?AUTO_1343 ?AUTO_1349 ) ( not ( = ?AUTO_1349 ?AUTO_1348 ) ) ( OBJ-AT ?AUTO_1341 ?AUTO_1353 ) ( AIRPLANE-AT ?AUTO_1343 ?AUTO_1353 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1341 ?AUTO_1343 ?AUTO_1353 )
      ( DELIVER-PKG ?AUTO_1341 ?AUTO_1342 )
      ( DELIVER-PKG-VERIFY ?AUTO_1341 ?AUTO_1342 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1355 - OBJ
      ?AUTO_1356 - LOCATION
    )
    :vars
    (
      ?AUTO_1362 - LOCATION
      ?AUTO_1360 - CITY
      ?AUTO_1363 - TRUCK
      ?AUTO_1361 - LOCATION
      ?AUTO_1364 - CITY
      ?AUTO_1365 - LOCATION
      ?AUTO_1359 - AIRPLANE
      ?AUTO_1366 - LOCATION
      ?AUTO_1367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1362 ?AUTO_1360 ) ( IN-CITY ?AUTO_1356 ?AUTO_1360 ) ( not ( = ?AUTO_1356 ?AUTO_1362 ) ) ( TRUCK-AT ?AUTO_1363 ?AUTO_1361 ) ( IN-CITY ?AUTO_1361 ?AUTO_1364 ) ( IN-CITY ?AUTO_1362 ?AUTO_1364 ) ( not ( = ?AUTO_1362 ?AUTO_1361 ) ) ( AIRPORT ?AUTO_1365 ) ( AIRPORT ?AUTO_1362 ) ( AIRPLANE-AT ?AUTO_1359 ?AUTO_1365 ) ( not ( = ?AUTO_1365 ?AUTO_1362 ) ) ( AIRPLANE-AT ?AUTO_1359 ?AUTO_1366 ) ( TRUCK-AT ?AUTO_1367 ?AUTO_1366 ) ( IN-TRUCK ?AUTO_1355 ?AUTO_1367 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1355 ?AUTO_1367 ?AUTO_1366 )
      ( DELIVER-PKG ?AUTO_1355 ?AUTO_1356 )
      ( DELIVER-PKG-VERIFY ?AUTO_1355 ?AUTO_1356 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1370 - OBJ
      ?AUTO_1371 - LOCATION
    )
    :vars
    (
      ?AUTO_1378 - LOCATION
      ?AUTO_1376 - CITY
      ?AUTO_1374 - TRUCK
      ?AUTO_1379 - LOCATION
      ?AUTO_1380 - CITY
      ?AUTO_1377 - LOCATION
      ?AUTO_1372 - AIRPLANE
      ?AUTO_1381 - LOCATION
      ?AUTO_1382 - TRUCK
      ?AUTO_1385 - LOCATION
      ?AUTO_1384 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1378 ?AUTO_1376 ) ( IN-CITY ?AUTO_1371 ?AUTO_1376 ) ( not ( = ?AUTO_1371 ?AUTO_1378 ) ) ( TRUCK-AT ?AUTO_1374 ?AUTO_1379 ) ( IN-CITY ?AUTO_1379 ?AUTO_1380 ) ( IN-CITY ?AUTO_1378 ?AUTO_1380 ) ( not ( = ?AUTO_1378 ?AUTO_1379 ) ) ( AIRPORT ?AUTO_1377 ) ( AIRPORT ?AUTO_1378 ) ( AIRPLANE-AT ?AUTO_1372 ?AUTO_1377 ) ( not ( = ?AUTO_1377 ?AUTO_1378 ) ) ( AIRPLANE-AT ?AUTO_1372 ?AUTO_1381 ) ( IN-TRUCK ?AUTO_1370 ?AUTO_1382 ) ( TRUCK-AT ?AUTO_1382 ?AUTO_1385 ) ( IN-CITY ?AUTO_1385 ?AUTO_1384 ) ( IN-CITY ?AUTO_1381 ?AUTO_1384 ) ( not ( = ?AUTO_1381 ?AUTO_1385 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1382 ?AUTO_1385 ?AUTO_1381 ?AUTO_1384 )
      ( DELIVER-PKG ?AUTO_1370 ?AUTO_1371 )
      ( DELIVER-PKG-VERIFY ?AUTO_1370 ?AUTO_1371 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1387 - OBJ
      ?AUTO_1388 - LOCATION
    )
    :vars
    (
      ?AUTO_1396 - LOCATION
      ?AUTO_1397 - CITY
      ?AUTO_1390 - TRUCK
      ?AUTO_1399 - LOCATION
      ?AUTO_1394 - CITY
      ?AUTO_1391 - LOCATION
      ?AUTO_1395 - AIRPLANE
      ?AUTO_1398 - LOCATION
      ?AUTO_1392 - TRUCK
      ?AUTO_1401 - LOCATION
      ?AUTO_1400 - CITY
      ?AUTO_1403 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1396 ?AUTO_1397 ) ( IN-CITY ?AUTO_1388 ?AUTO_1397 ) ( not ( = ?AUTO_1388 ?AUTO_1396 ) ) ( TRUCK-AT ?AUTO_1390 ?AUTO_1399 ) ( IN-CITY ?AUTO_1399 ?AUTO_1394 ) ( IN-CITY ?AUTO_1396 ?AUTO_1394 ) ( not ( = ?AUTO_1396 ?AUTO_1399 ) ) ( AIRPORT ?AUTO_1391 ) ( AIRPORT ?AUTO_1396 ) ( AIRPLANE-AT ?AUTO_1395 ?AUTO_1391 ) ( not ( = ?AUTO_1391 ?AUTO_1396 ) ) ( AIRPLANE-AT ?AUTO_1395 ?AUTO_1398 ) ( TRUCK-AT ?AUTO_1392 ?AUTO_1401 ) ( IN-CITY ?AUTO_1401 ?AUTO_1400 ) ( IN-CITY ?AUTO_1398 ?AUTO_1400 ) ( not ( = ?AUTO_1398 ?AUTO_1401 ) ) ( TRUCK-AT ?AUTO_1392 ?AUTO_1403 ) ( OBJ-AT ?AUTO_1387 ?AUTO_1403 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1387 ?AUTO_1392 ?AUTO_1403 )
      ( DELIVER-PKG ?AUTO_1387 ?AUTO_1388 )
      ( DELIVER-PKG-VERIFY ?AUTO_1387 ?AUTO_1388 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1405 - OBJ
      ?AUTO_1406 - LOCATION
    )
    :vars
    (
      ?AUTO_1416 - LOCATION
      ?AUTO_1418 - CITY
      ?AUTO_1413 - TRUCK
      ?AUTO_1410 - LOCATION
      ?AUTO_1411 - CITY
      ?AUTO_1417 - LOCATION
      ?AUTO_1415 - AIRPLANE
      ?AUTO_1408 - LOCATION
      ?AUTO_1420 - LOCATION
      ?AUTO_1419 - CITY
      ?AUTO_1412 - TRUCK
      ?AUTO_1423 - LOCATION
      ?AUTO_1422 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1416 ?AUTO_1418 ) ( IN-CITY ?AUTO_1406 ?AUTO_1418 ) ( not ( = ?AUTO_1406 ?AUTO_1416 ) ) ( TRUCK-AT ?AUTO_1413 ?AUTO_1410 ) ( IN-CITY ?AUTO_1410 ?AUTO_1411 ) ( IN-CITY ?AUTO_1416 ?AUTO_1411 ) ( not ( = ?AUTO_1416 ?AUTO_1410 ) ) ( AIRPORT ?AUTO_1417 ) ( AIRPORT ?AUTO_1416 ) ( AIRPLANE-AT ?AUTO_1415 ?AUTO_1417 ) ( not ( = ?AUTO_1417 ?AUTO_1416 ) ) ( AIRPLANE-AT ?AUTO_1415 ?AUTO_1408 ) ( IN-CITY ?AUTO_1420 ?AUTO_1419 ) ( IN-CITY ?AUTO_1408 ?AUTO_1419 ) ( not ( = ?AUTO_1408 ?AUTO_1420 ) ) ( OBJ-AT ?AUTO_1405 ?AUTO_1420 ) ( TRUCK-AT ?AUTO_1412 ?AUTO_1423 ) ( IN-CITY ?AUTO_1423 ?AUTO_1422 ) ( IN-CITY ?AUTO_1420 ?AUTO_1422 ) ( not ( = ?AUTO_1420 ?AUTO_1423 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1412 ?AUTO_1423 ?AUTO_1420 ?AUTO_1422 )
      ( DELIVER-PKG ?AUTO_1405 ?AUTO_1406 )
      ( DELIVER-PKG-VERIFY ?AUTO_1405 ?AUTO_1406 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1427 - OBJ
      ?AUTO_1428 - LOCATION
    )
    :vars
    (
      ?AUTO_1429 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1429 ?AUTO_1428 ) ( IN-TRUCK ?AUTO_1427 ?AUTO_1429 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1427 ?AUTO_1429 ?AUTO_1428 )
      ( DELIVER-PKG-VERIFY ?AUTO_1427 ?AUTO_1428 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1432 - OBJ
      ?AUTO_1433 - LOCATION
    )
    :vars
    (
      ?AUTO_1435 - TRUCK
      ?AUTO_1439 - LOCATION
      ?AUTO_1438 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1432 ?AUTO_1435 ) ( TRUCK-AT ?AUTO_1435 ?AUTO_1439 ) ( IN-CITY ?AUTO_1439 ?AUTO_1438 ) ( IN-CITY ?AUTO_1433 ?AUTO_1438 ) ( not ( = ?AUTO_1433 ?AUTO_1439 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1435 ?AUTO_1439 ?AUTO_1433 ?AUTO_1438 )
      ( DELIVER-PKG ?AUTO_1432 ?AUTO_1433 )
      ( DELIVER-PKG-VERIFY ?AUTO_1432 ?AUTO_1433 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1449 - OBJ
      ?AUTO_1450 - LOCATION
    )
    :vars
    (
      ?AUTO_1452 - TRUCK
      ?AUTO_1453 - LOCATION
      ?AUTO_1454 - CITY
      ?AUTO_1457 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1452 ?AUTO_1453 ) ( IN-CITY ?AUTO_1453 ?AUTO_1454 ) ( IN-CITY ?AUTO_1450 ?AUTO_1454 ) ( not ( = ?AUTO_1450 ?AUTO_1453 ) ) ( TRUCK-AT ?AUTO_1452 ?AUTO_1457 ) ( OBJ-AT ?AUTO_1449 ?AUTO_1457 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1449 ?AUTO_1452 ?AUTO_1457 )
      ( DELIVER-PKG ?AUTO_1449 ?AUTO_1450 )
      ( DELIVER-PKG-VERIFY ?AUTO_1449 ?AUTO_1450 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1479 - OBJ
      ?AUTO_1480 - LOCATION
    )
    :vars
    (
      ?AUTO_1483 - LOCATION
      ?AUTO_1484 - CITY
      ?AUTO_1485 - TRUCK
      ?AUTO_1487 - LOCATION
      ?AUTO_1481 - CITY
      ?AUTO_1488 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1483 ?AUTO_1484 ) ( IN-CITY ?AUTO_1480 ?AUTO_1484 ) ( not ( = ?AUTO_1480 ?AUTO_1483 ) ) ( TRUCK-AT ?AUTO_1485 ?AUTO_1487 ) ( IN-CITY ?AUTO_1487 ?AUTO_1481 ) ( IN-CITY ?AUTO_1483 ?AUTO_1481 ) ( not ( = ?AUTO_1483 ?AUTO_1487 ) ) ( IN-AIRPLANE ?AUTO_1479 ?AUTO_1488 ) ( AIRPLANE-AT ?AUTO_1488 ?AUTO_1483 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1479 ?AUTO_1488 ?AUTO_1483 )
      ( DELIVER-PKG ?AUTO_1479 ?AUTO_1480 )
      ( DELIVER-PKG-VERIFY ?AUTO_1479 ?AUTO_1480 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1513 - OBJ
      ?AUTO_1514 - LOCATION
    )
    :vars
    (
      ?AUTO_1515 - LOCATION
      ?AUTO_1519 - CITY
      ?AUTO_1520 - TRUCK
      ?AUTO_1522 - LOCATION
      ?AUTO_1518 - CITY
      ?AUTO_1523 - LOCATION
      ?AUTO_1516 - AIRPLANE
      ?AUTO_1525 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1515 ?AUTO_1519 ) ( IN-CITY ?AUTO_1514 ?AUTO_1519 ) ( not ( = ?AUTO_1514 ?AUTO_1515 ) ) ( TRUCK-AT ?AUTO_1520 ?AUTO_1522 ) ( IN-CITY ?AUTO_1522 ?AUTO_1518 ) ( IN-CITY ?AUTO_1515 ?AUTO_1518 ) ( not ( = ?AUTO_1515 ?AUTO_1522 ) ) ( AIRPORT ?AUTO_1523 ) ( AIRPORT ?AUTO_1515 ) ( AIRPLANE-AT ?AUTO_1516 ?AUTO_1523 ) ( not ( = ?AUTO_1523 ?AUTO_1515 ) ) ( OBJ-AT ?AUTO_1513 ?AUTO_1525 ) ( AIRPLANE-AT ?AUTO_1516 ?AUTO_1525 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1513 ?AUTO_1516 ?AUTO_1525 )
      ( DELIVER-PKG ?AUTO_1513 ?AUTO_1514 )
      ( DELIVER-PKG-VERIFY ?AUTO_1513 ?AUTO_1514 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1529 - OBJ
      ?AUTO_1530 - LOCATION
    )
    :vars
    (
      ?AUTO_1540 - LOCATION
      ?AUTO_1538 - CITY
      ?AUTO_1536 - TRUCK
      ?AUTO_1535 - LOCATION
      ?AUTO_1531 - CITY
      ?AUTO_1537 - LOCATION
      ?AUTO_1542 - LOCATION
      ?AUTO_1539 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1540 ?AUTO_1538 ) ( IN-CITY ?AUTO_1530 ?AUTO_1538 ) ( not ( = ?AUTO_1530 ?AUTO_1540 ) ) ( TRUCK-AT ?AUTO_1536 ?AUTO_1535 ) ( IN-CITY ?AUTO_1535 ?AUTO_1531 ) ( IN-CITY ?AUTO_1540 ?AUTO_1531 ) ( not ( = ?AUTO_1540 ?AUTO_1535 ) ) ( AIRPORT ?AUTO_1537 ) ( AIRPORT ?AUTO_1540 ) ( not ( = ?AUTO_1537 ?AUTO_1540 ) ) ( OBJ-AT ?AUTO_1529 ?AUTO_1537 ) ( AIRPORT ?AUTO_1542 ) ( AIRPLANE-AT ?AUTO_1539 ?AUTO_1542 ) ( not ( = ?AUTO_1542 ?AUTO_1537 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1539 ?AUTO_1542 ?AUTO_1537 )
      ( DELIVER-PKG ?AUTO_1529 ?AUTO_1530 )
      ( DELIVER-PKG-VERIFY ?AUTO_1529 ?AUTO_1530 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1558 - OBJ
      ?AUTO_1559 - LOCATION
    )
    :vars
    (
      ?AUTO_1560 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1560 ?AUTO_1559 ) ( IN-TRUCK ?AUTO_1558 ?AUTO_1560 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1558 ?AUTO_1560 ?AUTO_1559 )
      ( DELIVER-PKG-VERIFY ?AUTO_1558 ?AUTO_1559 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1563 - OBJ
      ?AUTO_1564 - LOCATION
    )
    :vars
    (
      ?AUTO_1567 - TRUCK
      ?AUTO_1570 - LOCATION
      ?AUTO_1569 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1563 ?AUTO_1567 ) ( TRUCK-AT ?AUTO_1567 ?AUTO_1570 ) ( IN-CITY ?AUTO_1570 ?AUTO_1569 ) ( IN-CITY ?AUTO_1564 ?AUTO_1569 ) ( not ( = ?AUTO_1564 ?AUTO_1570 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1567 ?AUTO_1570 ?AUTO_1564 ?AUTO_1569 )
      ( DELIVER-PKG ?AUTO_1563 ?AUTO_1564 )
      ( DELIVER-PKG-VERIFY ?AUTO_1563 ?AUTO_1564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1650 - OBJ
      ?AUTO_1651 - LOCATION
    )
    :vars
    (
      ?AUTO_1652 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1652 ?AUTO_1651 ) ( IN-TRUCK ?AUTO_1650 ?AUTO_1652 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1650 ?AUTO_1652 ?AUTO_1651 )
      ( DELIVER-PKG-VERIFY ?AUTO_1650 ?AUTO_1651 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1669 - OBJ
      ?AUTO_1670 - LOCATION
    )
    :vars
    (
      ?AUTO_1672 - TRUCK
      ?AUTO_1673 - LOCATION
      ?AUTO_1671 - CITY
      ?AUTO_1677 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1672 ?AUTO_1673 ) ( IN-CITY ?AUTO_1673 ?AUTO_1671 ) ( IN-CITY ?AUTO_1670 ?AUTO_1671 ) ( not ( = ?AUTO_1670 ?AUTO_1673 ) ) ( TRUCK-AT ?AUTO_1672 ?AUTO_1677 ) ( OBJ-AT ?AUTO_1669 ?AUTO_1677 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1669 ?AUTO_1672 ?AUTO_1677 )
      ( DELIVER-PKG ?AUTO_1669 ?AUTO_1670 )
      ( DELIVER-PKG-VERIFY ?AUTO_1669 ?AUTO_1670 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1699 - OBJ
      ?AUTO_1700 - LOCATION
    )
    :vars
    (
      ?AUTO_1707 - LOCATION
      ?AUTO_1702 - CITY
      ?AUTO_1705 - TRUCK
      ?AUTO_1701 - LOCATION
      ?AUTO_1703 - CITY
      ?AUTO_1708 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1707 ?AUTO_1702 ) ( IN-CITY ?AUTO_1700 ?AUTO_1702 ) ( not ( = ?AUTO_1700 ?AUTO_1707 ) ) ( TRUCK-AT ?AUTO_1705 ?AUTO_1701 ) ( IN-CITY ?AUTO_1701 ?AUTO_1703 ) ( IN-CITY ?AUTO_1707 ?AUTO_1703 ) ( not ( = ?AUTO_1707 ?AUTO_1701 ) ) ( IN-AIRPLANE ?AUTO_1699 ?AUTO_1708 ) ( AIRPLANE-AT ?AUTO_1708 ?AUTO_1707 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1699 ?AUTO_1708 ?AUTO_1707 )
      ( DELIVER-PKG ?AUTO_1699 ?AUTO_1700 )
      ( DELIVER-PKG-VERIFY ?AUTO_1699 ?AUTO_1700 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1733 - OBJ
      ?AUTO_1734 - LOCATION
    )
    :vars
    (
      ?AUTO_1738 - LOCATION
      ?AUTO_1737 - CITY
      ?AUTO_1740 - TRUCK
      ?AUTO_1741 - LOCATION
      ?AUTO_1736 - CITY
      ?AUTO_1742 - LOCATION
      ?AUTO_1735 - AIRPLANE
      ?AUTO_1745 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1738 ?AUTO_1737 ) ( IN-CITY ?AUTO_1734 ?AUTO_1737 ) ( not ( = ?AUTO_1734 ?AUTO_1738 ) ) ( TRUCK-AT ?AUTO_1740 ?AUTO_1741 ) ( IN-CITY ?AUTO_1741 ?AUTO_1736 ) ( IN-CITY ?AUTO_1738 ?AUTO_1736 ) ( not ( = ?AUTO_1738 ?AUTO_1741 ) ) ( AIRPORT ?AUTO_1742 ) ( AIRPORT ?AUTO_1738 ) ( AIRPLANE-AT ?AUTO_1735 ?AUTO_1742 ) ( not ( = ?AUTO_1742 ?AUTO_1738 ) ) ( OBJ-AT ?AUTO_1733 ?AUTO_1745 ) ( AIRPLANE-AT ?AUTO_1735 ?AUTO_1745 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1733 ?AUTO_1735 ?AUTO_1745 )
      ( DELIVER-PKG ?AUTO_1733 ?AUTO_1734 )
      ( DELIVER-PKG-VERIFY ?AUTO_1733 ?AUTO_1734 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1767 - OBJ
      ?AUTO_1768 - LOCATION
    )
    :vars
    (
      ?AUTO_1769 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1769 ?AUTO_1768 ) ( IN-TRUCK ?AUTO_1767 ?AUTO_1769 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1767 ?AUTO_1769 ?AUTO_1768 )
      ( DELIVER-PKG-VERIFY ?AUTO_1767 ?AUTO_1768 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1772 - OBJ
      ?AUTO_1773 - LOCATION
    )
    :vars
    (
      ?AUTO_1776 - TRUCK
      ?AUTO_1779 - LOCATION
      ?AUTO_1778 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1772 ?AUTO_1776 ) ( TRUCK-AT ?AUTO_1776 ?AUTO_1779 ) ( IN-CITY ?AUTO_1779 ?AUTO_1778 ) ( IN-CITY ?AUTO_1773 ?AUTO_1778 ) ( not ( = ?AUTO_1773 ?AUTO_1779 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1776 ?AUTO_1779 ?AUTO_1773 ?AUTO_1778 )
      ( DELIVER-PKG ?AUTO_1772 ?AUTO_1773 )
      ( DELIVER-PKG-VERIFY ?AUTO_1772 ?AUTO_1773 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1795 - OBJ
      ?AUTO_1796 - LOCATION
    )
    :vars
    (
      ?AUTO_1800 - TRUCK
      ?AUTO_1798 - LOCATION
      ?AUTO_1799 - CITY
      ?AUTO_1803 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1800 ?AUTO_1798 ) ( IN-CITY ?AUTO_1798 ?AUTO_1799 ) ( IN-CITY ?AUTO_1796 ?AUTO_1799 ) ( not ( = ?AUTO_1796 ?AUTO_1798 ) ) ( TRUCK-AT ?AUTO_1800 ?AUTO_1803 ) ( OBJ-AT ?AUTO_1795 ?AUTO_1803 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1795 ?AUTO_1800 ?AUTO_1803 )
      ( DELIVER-PKG ?AUTO_1795 ?AUTO_1796 )
      ( DELIVER-PKG-VERIFY ?AUTO_1795 ?AUTO_1796 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1825 - OBJ
      ?AUTO_1826 - LOCATION
    )
    :vars
    (
      ?AUTO_1829 - LOCATION
      ?AUTO_1828 - CITY
      ?AUTO_1827 - TRUCK
      ?AUTO_1831 - LOCATION
      ?AUTO_1830 - CITY
      ?AUTO_1834 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1829 ?AUTO_1828 ) ( IN-CITY ?AUTO_1826 ?AUTO_1828 ) ( not ( = ?AUTO_1826 ?AUTO_1829 ) ) ( TRUCK-AT ?AUTO_1827 ?AUTO_1831 ) ( IN-CITY ?AUTO_1831 ?AUTO_1830 ) ( IN-CITY ?AUTO_1829 ?AUTO_1830 ) ( not ( = ?AUTO_1829 ?AUTO_1831 ) ) ( IN-AIRPLANE ?AUTO_1825 ?AUTO_1834 ) ( AIRPLANE-AT ?AUTO_1834 ?AUTO_1829 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1825 ?AUTO_1834 ?AUTO_1829 )
      ( DELIVER-PKG ?AUTO_1825 ?AUTO_1826 )
      ( DELIVER-PKG-VERIFY ?AUTO_1825 ?AUTO_1826 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1855 - OBJ
      ?AUTO_1856 - LOCATION
    )
    :vars
    (
      ?AUTO_1861 - LOCATION
      ?AUTO_1859 - CITY
      ?AUTO_1862 - TRUCK
      ?AUTO_1858 - LOCATION
      ?AUTO_1860 - CITY
      ?AUTO_1864 - LOCATION
      ?AUTO_1857 - AIRPLANE
      ?AUTO_1867 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1861 ?AUTO_1859 ) ( IN-CITY ?AUTO_1856 ?AUTO_1859 ) ( not ( = ?AUTO_1856 ?AUTO_1861 ) ) ( TRUCK-AT ?AUTO_1862 ?AUTO_1858 ) ( IN-CITY ?AUTO_1858 ?AUTO_1860 ) ( IN-CITY ?AUTO_1861 ?AUTO_1860 ) ( not ( = ?AUTO_1861 ?AUTO_1858 ) ) ( AIRPORT ?AUTO_1864 ) ( AIRPORT ?AUTO_1861 ) ( AIRPLANE-AT ?AUTO_1857 ?AUTO_1864 ) ( not ( = ?AUTO_1864 ?AUTO_1861 ) ) ( OBJ-AT ?AUTO_1855 ?AUTO_1867 ) ( AIRPLANE-AT ?AUTO_1857 ?AUTO_1867 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1855 ?AUTO_1857 ?AUTO_1867 )
      ( DELIVER-PKG ?AUTO_1855 ?AUTO_1856 )
      ( DELIVER-PKG-VERIFY ?AUTO_1855 ?AUTO_1856 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1871 - OBJ
      ?AUTO_1872 - LOCATION
    )
    :vars
    (
      ?AUTO_1878 - LOCATION
      ?AUTO_1879 - CITY
      ?AUTO_1874 - TRUCK
      ?AUTO_1881 - LOCATION
      ?AUTO_1877 - CITY
      ?AUTO_1880 - LOCATION
      ?AUTO_1884 - LOCATION
      ?AUTO_1882 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1878 ?AUTO_1879 ) ( IN-CITY ?AUTO_1872 ?AUTO_1879 ) ( not ( = ?AUTO_1872 ?AUTO_1878 ) ) ( TRUCK-AT ?AUTO_1874 ?AUTO_1881 ) ( IN-CITY ?AUTO_1881 ?AUTO_1877 ) ( IN-CITY ?AUTO_1878 ?AUTO_1877 ) ( not ( = ?AUTO_1878 ?AUTO_1881 ) ) ( AIRPORT ?AUTO_1880 ) ( AIRPORT ?AUTO_1878 ) ( not ( = ?AUTO_1880 ?AUTO_1878 ) ) ( OBJ-AT ?AUTO_1871 ?AUTO_1880 ) ( AIRPORT ?AUTO_1884 ) ( AIRPLANE-AT ?AUTO_1882 ?AUTO_1884 ) ( not ( = ?AUTO_1884 ?AUTO_1880 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1882 ?AUTO_1884 ?AUTO_1880 )
      ( DELIVER-PKG ?AUTO_1871 ?AUTO_1872 )
      ( DELIVER-PKG-VERIFY ?AUTO_1871 ?AUTO_1872 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1887 - OBJ
      ?AUTO_1888 - LOCATION
    )
    :vars
    (
      ?AUTO_1889 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1889 ?AUTO_1888 ) ( IN-TRUCK ?AUTO_1887 ?AUTO_1889 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1887 ?AUTO_1889 ?AUTO_1888 )
      ( DELIVER-PKG-VERIFY ?AUTO_1887 ?AUTO_1888 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1892 - OBJ
      ?AUTO_1893 - LOCATION
    )
    :vars
    (
      ?AUTO_1896 - TRUCK
      ?AUTO_1899 - LOCATION
      ?AUTO_1898 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1892 ?AUTO_1896 ) ( TRUCK-AT ?AUTO_1896 ?AUTO_1899 ) ( IN-CITY ?AUTO_1899 ?AUTO_1898 ) ( IN-CITY ?AUTO_1893 ?AUTO_1898 ) ( not ( = ?AUTO_1893 ?AUTO_1899 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1896 ?AUTO_1899 ?AUTO_1893 ?AUTO_1898 )
      ( DELIVER-PKG ?AUTO_1892 ?AUTO_1893 )
      ( DELIVER-PKG-VERIFY ?AUTO_1892 ?AUTO_1893 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1905 - OBJ
      ?AUTO_1906 - LOCATION
    )
    :vars
    (
      ?AUTO_1911 - TRUCK
      ?AUTO_1910 - LOCATION
      ?AUTO_1909 - CITY
      ?AUTO_1913 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1911 ?AUTO_1910 ) ( IN-CITY ?AUTO_1910 ?AUTO_1909 ) ( IN-CITY ?AUTO_1906 ?AUTO_1909 ) ( not ( = ?AUTO_1906 ?AUTO_1910 ) ) ( TRUCK-AT ?AUTO_1911 ?AUTO_1913 ) ( OBJ-AT ?AUTO_1905 ?AUTO_1913 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1905 ?AUTO_1911 ?AUTO_1913 )
      ( DELIVER-PKG ?AUTO_1905 ?AUTO_1906 )
      ( DELIVER-PKG-VERIFY ?AUTO_1905 ?AUTO_1906 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1915 - OBJ
      ?AUTO_1916 - LOCATION
    )
    :vars
    (
      ?AUTO_1922 - LOCATION
      ?AUTO_1919 - CITY
      ?AUTO_1917 - TRUCK
      ?AUTO_1925 - LOCATION
      ?AUTO_1924 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1922 ?AUTO_1919 ) ( IN-CITY ?AUTO_1916 ?AUTO_1919 ) ( not ( = ?AUTO_1916 ?AUTO_1922 ) ) ( OBJ-AT ?AUTO_1915 ?AUTO_1922 ) ( TRUCK-AT ?AUTO_1917 ?AUTO_1925 ) ( IN-CITY ?AUTO_1925 ?AUTO_1924 ) ( IN-CITY ?AUTO_1922 ?AUTO_1924 ) ( not ( = ?AUTO_1922 ?AUTO_1925 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1917 ?AUTO_1925 ?AUTO_1922 ?AUTO_1924 )
      ( DELIVER-PKG ?AUTO_1915 ?AUTO_1916 )
      ( DELIVER-PKG-VERIFY ?AUTO_1915 ?AUTO_1916 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1929 - OBJ
      ?AUTO_1930 - LOCATION
    )
    :vars
    (
      ?AUTO_1931 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1931 ?AUTO_1930 ) ( IN-TRUCK ?AUTO_1929 ?AUTO_1931 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1929 ?AUTO_1931 ?AUTO_1930 )
      ( DELIVER-PKG-VERIFY ?AUTO_1929 ?AUTO_1930 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1938 - OBJ
      ?AUTO_1939 - LOCATION
    )
    :vars
    (
      ?AUTO_1940 - TRUCK
      ?AUTO_1944 - LOCATION
      ?AUTO_1942 - CITY
      ?AUTO_1946 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1940 ?AUTO_1944 ) ( IN-CITY ?AUTO_1944 ?AUTO_1942 ) ( IN-CITY ?AUTO_1939 ?AUTO_1942 ) ( not ( = ?AUTO_1939 ?AUTO_1944 ) ) ( TRUCK-AT ?AUTO_1940 ?AUTO_1946 ) ( OBJ-AT ?AUTO_1938 ?AUTO_1946 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1938 ?AUTO_1940 ?AUTO_1946 )
      ( DELIVER-PKG ?AUTO_1938 ?AUTO_1939 )
      ( DELIVER-PKG-VERIFY ?AUTO_1938 ?AUTO_1939 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1948 - OBJ
      ?AUTO_1949 - LOCATION
    )
    :vars
    (
      ?AUTO_1955 - LOCATION
      ?AUTO_1954 - CITY
      ?AUTO_1952 - TRUCK
      ?AUTO_1958 - LOCATION
      ?AUTO_1957 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1955 ?AUTO_1954 ) ( IN-CITY ?AUTO_1949 ?AUTO_1954 ) ( not ( = ?AUTO_1949 ?AUTO_1955 ) ) ( OBJ-AT ?AUTO_1948 ?AUTO_1955 ) ( TRUCK-AT ?AUTO_1952 ?AUTO_1958 ) ( IN-CITY ?AUTO_1958 ?AUTO_1957 ) ( IN-CITY ?AUTO_1955 ?AUTO_1957 ) ( not ( = ?AUTO_1955 ?AUTO_1958 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1952 ?AUTO_1958 ?AUTO_1955 ?AUTO_1957 )
      ( DELIVER-PKG ?AUTO_1948 ?AUTO_1949 )
      ( DELIVER-PKG-VERIFY ?AUTO_1948 ?AUTO_1949 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1966 - OBJ
      ?AUTO_1967 - LOCATION
    )
    :vars
    (
      ?AUTO_1968 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1968 ?AUTO_1967 ) ( IN-TRUCK ?AUTO_1966 ?AUTO_1968 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1966 ?AUTO_1968 ?AUTO_1967 )
      ( DELIVER-PKG-VERIFY ?AUTO_1966 ?AUTO_1967 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1971 - OBJ
      ?AUTO_1972 - LOCATION
    )
    :vars
    (
      ?AUTO_1975 - TRUCK
      ?AUTO_1978 - LOCATION
      ?AUTO_1977 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1971 ?AUTO_1975 ) ( TRUCK-AT ?AUTO_1975 ?AUTO_1978 ) ( IN-CITY ?AUTO_1978 ?AUTO_1977 ) ( IN-CITY ?AUTO_1972 ?AUTO_1977 ) ( not ( = ?AUTO_1972 ?AUTO_1978 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1975 ?AUTO_1978 ?AUTO_1972 ?AUTO_1977 )
      ( DELIVER-PKG ?AUTO_1971 ?AUTO_1972 )
      ( DELIVER-PKG-VERIFY ?AUTO_1971 ?AUTO_1972 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1980 - OBJ
      ?AUTO_1981 - LOCATION
    )
    :vars
    (
      ?AUTO_1984 - TRUCK
      ?AUTO_1986 - LOCATION
      ?AUTO_1985 - CITY
      ?AUTO_1988 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1984 ?AUTO_1986 ) ( IN-CITY ?AUTO_1986 ?AUTO_1985 ) ( IN-CITY ?AUTO_1981 ?AUTO_1985 ) ( not ( = ?AUTO_1981 ?AUTO_1986 ) ) ( TRUCK-AT ?AUTO_1984 ?AUTO_1988 ) ( OBJ-AT ?AUTO_1980 ?AUTO_1988 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1980 ?AUTO_1984 ?AUTO_1988 )
      ( DELIVER-PKG ?AUTO_1980 ?AUTO_1981 )
      ( DELIVER-PKG-VERIFY ?AUTO_1980 ?AUTO_1981 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1990 - OBJ
      ?AUTO_1991 - LOCATION
    )
    :vars
    (
      ?AUTO_1997 - LOCATION
      ?AUTO_1996 - CITY
      ?AUTO_1995 - TRUCK
      ?AUTO_2000 - LOCATION
      ?AUTO_1999 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1997 ?AUTO_1996 ) ( IN-CITY ?AUTO_1991 ?AUTO_1996 ) ( not ( = ?AUTO_1991 ?AUTO_1997 ) ) ( OBJ-AT ?AUTO_1990 ?AUTO_1997 ) ( TRUCK-AT ?AUTO_1995 ?AUTO_2000 ) ( IN-CITY ?AUTO_2000 ?AUTO_1999 ) ( IN-CITY ?AUTO_1997 ?AUTO_1999 ) ( not ( = ?AUTO_1997 ?AUTO_2000 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1995 ?AUTO_2000 ?AUTO_1997 ?AUTO_1999 )
      ( DELIVER-PKG ?AUTO_1990 ?AUTO_1991 )
      ( DELIVER-PKG-VERIFY ?AUTO_1990 ?AUTO_1991 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2020 - OBJ
      ?AUTO_2021 - LOCATION
    )
    :vars
    (
      ?AUTO_2022 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2022 ?AUTO_2021 ) ( IN-TRUCK ?AUTO_2020 ?AUTO_2022 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2020 ?AUTO_2022 ?AUTO_2021 )
      ( DELIVER-PKG-VERIFY ?AUTO_2020 ?AUTO_2021 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2025 - OBJ
      ?AUTO_2026 - LOCATION
    )
    :vars
    (
      ?AUTO_2029 - TRUCK
      ?AUTO_2032 - LOCATION
      ?AUTO_2031 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2025 ?AUTO_2029 ) ( TRUCK-AT ?AUTO_2029 ?AUTO_2032 ) ( IN-CITY ?AUTO_2032 ?AUTO_2031 ) ( IN-CITY ?AUTO_2026 ?AUTO_2031 ) ( not ( = ?AUTO_2026 ?AUTO_2032 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2029 ?AUTO_2032 ?AUTO_2026 ?AUTO_2031 )
      ( DELIVER-PKG ?AUTO_2025 ?AUTO_2026 )
      ( DELIVER-PKG-VERIFY ?AUTO_2025 ?AUTO_2026 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2060 - OBJ
      ?AUTO_2061 - LOCATION
    )
    :vars
    (
      ?AUTO_2062 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2060 ?AUTO_2062 ) ( AIRPLANE-AT ?AUTO_2062 ?AUTO_2061 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2060 ?AUTO_2062 ?AUTO_2061 )
      ( DELIVER-PKG-VERIFY ?AUTO_2060 ?AUTO_2061 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2067 - OBJ
      ?AUTO_2068 - LOCATION
    )
    :vars
    (
      ?AUTO_2071 - AIRPLANE
      ?AUTO_2073 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2067 ?AUTO_2071 ) ( AIRPORT ?AUTO_2073 ) ( AIRPORT ?AUTO_2068 ) ( AIRPLANE-AT ?AUTO_2071 ?AUTO_2073 ) ( not ( = ?AUTO_2073 ?AUTO_2068 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2071 ?AUTO_2073 ?AUTO_2068 )
      ( DELIVER-PKG ?AUTO_2067 ?AUTO_2068 )
      ( DELIVER-PKG-VERIFY ?AUTO_2067 ?AUTO_2068 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2075 - OBJ
      ?AUTO_2076 - LOCATION
    )
    :vars
    (
      ?AUTO_2080 - LOCATION
      ?AUTO_2079 - AIRPLANE
      ?AUTO_2082 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2080 ) ( AIRPORT ?AUTO_2076 ) ( AIRPLANE-AT ?AUTO_2079 ?AUTO_2080 ) ( not ( = ?AUTO_2080 ?AUTO_2076 ) ) ( OBJ-AT ?AUTO_2075 ?AUTO_2082 ) ( AIRPLANE-AT ?AUTO_2079 ?AUTO_2082 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2075 ?AUTO_2079 ?AUTO_2082 )
      ( DELIVER-PKG ?AUTO_2075 ?AUTO_2076 )
      ( DELIVER-PKG-VERIFY ?AUTO_2075 ?AUTO_2076 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2084 - OBJ
      ?AUTO_2085 - LOCATION
    )
    :vars
    (
      ?AUTO_2089 - LOCATION
      ?AUTO_2088 - AIRPLANE
      ?AUTO_2090 - LOCATION
      ?AUTO_2091 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2089 ) ( AIRPORT ?AUTO_2085 ) ( AIRPLANE-AT ?AUTO_2088 ?AUTO_2089 ) ( not ( = ?AUTO_2089 ?AUTO_2085 ) ) ( AIRPLANE-AT ?AUTO_2088 ?AUTO_2090 ) ( TRUCK-AT ?AUTO_2091 ?AUTO_2090 ) ( IN-TRUCK ?AUTO_2084 ?AUTO_2091 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2084 ?AUTO_2091 ?AUTO_2090 )
      ( DELIVER-PKG ?AUTO_2084 ?AUTO_2085 )
      ( DELIVER-PKG-VERIFY ?AUTO_2084 ?AUTO_2085 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2094 - OBJ
      ?AUTO_2095 - LOCATION
    )
    :vars
    (
      ?AUTO_2097 - LOCATION
      ?AUTO_2100 - AIRPLANE
      ?AUTO_2099 - LOCATION
      ?AUTO_2101 - TRUCK
      ?AUTO_2104 - LOCATION
      ?AUTO_2103 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2097 ) ( AIRPORT ?AUTO_2095 ) ( AIRPLANE-AT ?AUTO_2100 ?AUTO_2097 ) ( not ( = ?AUTO_2097 ?AUTO_2095 ) ) ( AIRPLANE-AT ?AUTO_2100 ?AUTO_2099 ) ( IN-TRUCK ?AUTO_2094 ?AUTO_2101 ) ( TRUCK-AT ?AUTO_2101 ?AUTO_2104 ) ( IN-CITY ?AUTO_2104 ?AUTO_2103 ) ( IN-CITY ?AUTO_2099 ?AUTO_2103 ) ( not ( = ?AUTO_2099 ?AUTO_2104 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2101 ?AUTO_2104 ?AUTO_2099 ?AUTO_2103 )
      ( DELIVER-PKG ?AUTO_2094 ?AUTO_2095 )
      ( DELIVER-PKG-VERIFY ?AUTO_2094 ?AUTO_2095 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2114 - OBJ
      ?AUTO_2115 - LOCATION
    )
    :vars
    (
      ?AUTO_2117 - LOCATION
      ?AUTO_2123 - AIRPLANE
      ?AUTO_2121 - LOCATION
      ?AUTO_2118 - TRUCK
      ?AUTO_2120 - LOCATION
      ?AUTO_2119 - CITY
      ?AUTO_2125 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2117 ) ( AIRPORT ?AUTO_2115 ) ( AIRPLANE-AT ?AUTO_2123 ?AUTO_2117 ) ( not ( = ?AUTO_2117 ?AUTO_2115 ) ) ( AIRPLANE-AT ?AUTO_2123 ?AUTO_2121 ) ( TRUCK-AT ?AUTO_2118 ?AUTO_2120 ) ( IN-CITY ?AUTO_2120 ?AUTO_2119 ) ( IN-CITY ?AUTO_2121 ?AUTO_2119 ) ( not ( = ?AUTO_2121 ?AUTO_2120 ) ) ( TRUCK-AT ?AUTO_2118 ?AUTO_2125 ) ( OBJ-AT ?AUTO_2114 ?AUTO_2125 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2114 ?AUTO_2118 ?AUTO_2125 )
      ( DELIVER-PKG ?AUTO_2114 ?AUTO_2115 )
      ( DELIVER-PKG-VERIFY ?AUTO_2114 ?AUTO_2115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2143 - OBJ
      ?AUTO_2144 - LOCATION
    )
    :vars
    (
      ?AUTO_2145 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2143 ?AUTO_2145 ) ( AIRPLANE-AT ?AUTO_2145 ?AUTO_2144 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2143 ?AUTO_2145 ?AUTO_2144 )
      ( DELIVER-PKG-VERIFY ?AUTO_2143 ?AUTO_2144 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2148 - OBJ
      ?AUTO_2149 - LOCATION
    )
    :vars
    (
      ?AUTO_2150 - AIRPLANE
      ?AUTO_2154 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2148 ?AUTO_2150 ) ( AIRPORT ?AUTO_2154 ) ( AIRPORT ?AUTO_2149 ) ( AIRPLANE-AT ?AUTO_2150 ?AUTO_2154 ) ( not ( = ?AUTO_2154 ?AUTO_2149 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2150 ?AUTO_2154 ?AUTO_2149 )
      ( DELIVER-PKG ?AUTO_2148 ?AUTO_2149 )
      ( DELIVER-PKG-VERIFY ?AUTO_2148 ?AUTO_2149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2158 - OBJ
      ?AUTO_2159 - LOCATION
    )
    :vars
    (
      ?AUTO_2163 - LOCATION
      ?AUTO_2160 - AIRPLANE
      ?AUTO_2165 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2163 ) ( AIRPORT ?AUTO_2159 ) ( AIRPLANE-AT ?AUTO_2160 ?AUTO_2163 ) ( not ( = ?AUTO_2163 ?AUTO_2159 ) ) ( OBJ-AT ?AUTO_2158 ?AUTO_2165 ) ( AIRPLANE-AT ?AUTO_2160 ?AUTO_2165 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2158 ?AUTO_2160 ?AUTO_2165 )
      ( DELIVER-PKG ?AUTO_2158 ?AUTO_2159 )
      ( DELIVER-PKG-VERIFY ?AUTO_2158 ?AUTO_2159 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2167 - OBJ
      ?AUTO_2168 - LOCATION
    )
    :vars
    (
      ?AUTO_2173 - LOCATION
      ?AUTO_2175 - LOCATION
      ?AUTO_2171 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2173 ) ( AIRPORT ?AUTO_2168 ) ( not ( = ?AUTO_2173 ?AUTO_2168 ) ) ( OBJ-AT ?AUTO_2167 ?AUTO_2173 ) ( AIRPORT ?AUTO_2175 ) ( AIRPLANE-AT ?AUTO_2171 ?AUTO_2175 ) ( not ( = ?AUTO_2175 ?AUTO_2173 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2171 ?AUTO_2175 ?AUTO_2173 )
      ( DELIVER-PKG ?AUTO_2167 ?AUTO_2168 )
      ( DELIVER-PKG-VERIFY ?AUTO_2167 ?AUTO_2168 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2183 - OBJ
      ?AUTO_2184 - LOCATION
    )
    :vars
    (
      ?AUTO_2185 - LOCATION
      ?AUTO_2186 - LOCATION
      ?AUTO_2189 - AIRPLANE
      ?AUTO_2190 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2185 ) ( AIRPORT ?AUTO_2184 ) ( not ( = ?AUTO_2185 ?AUTO_2184 ) ) ( AIRPORT ?AUTO_2186 ) ( AIRPLANE-AT ?AUTO_2189 ?AUTO_2186 ) ( not ( = ?AUTO_2186 ?AUTO_2185 ) ) ( TRUCK-AT ?AUTO_2190 ?AUTO_2185 ) ( IN-TRUCK ?AUTO_2183 ?AUTO_2190 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2183 ?AUTO_2190 ?AUTO_2185 )
      ( DELIVER-PKG ?AUTO_2183 ?AUTO_2184 )
      ( DELIVER-PKG-VERIFY ?AUTO_2183 ?AUTO_2184 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2193 - OBJ
      ?AUTO_2194 - LOCATION
    )
    :vars
    (
      ?AUTO_2196 - LOCATION
      ?AUTO_2197 - LOCATION
      ?AUTO_2199 - AIRPLANE
      ?AUTO_2200 - TRUCK
      ?AUTO_2203 - LOCATION
      ?AUTO_2202 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2196 ) ( AIRPORT ?AUTO_2194 ) ( not ( = ?AUTO_2196 ?AUTO_2194 ) ) ( AIRPORT ?AUTO_2197 ) ( AIRPLANE-AT ?AUTO_2199 ?AUTO_2197 ) ( not ( = ?AUTO_2197 ?AUTO_2196 ) ) ( IN-TRUCK ?AUTO_2193 ?AUTO_2200 ) ( TRUCK-AT ?AUTO_2200 ?AUTO_2203 ) ( IN-CITY ?AUTO_2203 ?AUTO_2202 ) ( IN-CITY ?AUTO_2196 ?AUTO_2202 ) ( not ( = ?AUTO_2196 ?AUTO_2203 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2200 ?AUTO_2203 ?AUTO_2196 ?AUTO_2202 )
      ( DELIVER-PKG ?AUTO_2193 ?AUTO_2194 )
      ( DELIVER-PKG-VERIFY ?AUTO_2193 ?AUTO_2194 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2205 - OBJ
      ?AUTO_2206 - LOCATION
    )
    :vars
    (
      ?AUTO_2213 - LOCATION
      ?AUTO_2209 - LOCATION
      ?AUTO_2210 - AIRPLANE
      ?AUTO_2211 - TRUCK
      ?AUTO_2214 - LOCATION
      ?AUTO_2212 - CITY
      ?AUTO_2216 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2213 ) ( AIRPORT ?AUTO_2206 ) ( not ( = ?AUTO_2213 ?AUTO_2206 ) ) ( AIRPORT ?AUTO_2209 ) ( AIRPLANE-AT ?AUTO_2210 ?AUTO_2209 ) ( not ( = ?AUTO_2209 ?AUTO_2213 ) ) ( TRUCK-AT ?AUTO_2211 ?AUTO_2214 ) ( IN-CITY ?AUTO_2214 ?AUTO_2212 ) ( IN-CITY ?AUTO_2213 ?AUTO_2212 ) ( not ( = ?AUTO_2213 ?AUTO_2214 ) ) ( TRUCK-AT ?AUTO_2211 ?AUTO_2216 ) ( OBJ-AT ?AUTO_2205 ?AUTO_2216 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2205 ?AUTO_2211 ?AUTO_2216 )
      ( DELIVER-PKG ?AUTO_2205 ?AUTO_2206 )
      ( DELIVER-PKG-VERIFY ?AUTO_2205 ?AUTO_2206 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2218 - OBJ
      ?AUTO_2219 - LOCATION
    )
    :vars
    (
      ?AUTO_2224 - LOCATION
      ?AUTO_2226 - LOCATION
      ?AUTO_2228 - AIRPLANE
      ?AUTO_2222 - LOCATION
      ?AUTO_2227 - CITY
      ?AUTO_2225 - TRUCK
      ?AUTO_2231 - LOCATION
      ?AUTO_2230 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2224 ) ( AIRPORT ?AUTO_2219 ) ( not ( = ?AUTO_2224 ?AUTO_2219 ) ) ( AIRPORT ?AUTO_2226 ) ( AIRPLANE-AT ?AUTO_2228 ?AUTO_2226 ) ( not ( = ?AUTO_2226 ?AUTO_2224 ) ) ( IN-CITY ?AUTO_2222 ?AUTO_2227 ) ( IN-CITY ?AUTO_2224 ?AUTO_2227 ) ( not ( = ?AUTO_2224 ?AUTO_2222 ) ) ( OBJ-AT ?AUTO_2218 ?AUTO_2222 ) ( TRUCK-AT ?AUTO_2225 ?AUTO_2231 ) ( IN-CITY ?AUTO_2231 ?AUTO_2230 ) ( IN-CITY ?AUTO_2222 ?AUTO_2230 ) ( not ( = ?AUTO_2222 ?AUTO_2231 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2225 ?AUTO_2231 ?AUTO_2222 ?AUTO_2230 )
      ( DELIVER-PKG ?AUTO_2218 ?AUTO_2219 )
      ( DELIVER-PKG-VERIFY ?AUTO_2218 ?AUTO_2219 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2251 - OBJ
      ?AUTO_2252 - LOCATION
    )
    :vars
    (
      ?AUTO_2253 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2251 ?AUTO_2253 ) ( AIRPLANE-AT ?AUTO_2253 ?AUTO_2252 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2251 ?AUTO_2253 ?AUTO_2252 )
      ( DELIVER-PKG-VERIFY ?AUTO_2251 ?AUTO_2252 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2256 - OBJ
      ?AUTO_2257 - LOCATION
    )
    :vars
    (
      ?AUTO_2259 - AIRPLANE
      ?AUTO_2262 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2256 ?AUTO_2259 ) ( AIRPORT ?AUTO_2262 ) ( AIRPORT ?AUTO_2257 ) ( AIRPLANE-AT ?AUTO_2259 ?AUTO_2262 ) ( not ( = ?AUTO_2262 ?AUTO_2257 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2259 ?AUTO_2262 ?AUTO_2257 )
      ( DELIVER-PKG ?AUTO_2256 ?AUTO_2257 )
      ( DELIVER-PKG-VERIFY ?AUTO_2256 ?AUTO_2257 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2266 - OBJ
      ?AUTO_2267 - LOCATION
    )
    :vars
    (
      ?AUTO_2271 - LOCATION
      ?AUTO_2269 - AIRPLANE
      ?AUTO_2273 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2271 ) ( AIRPORT ?AUTO_2267 ) ( AIRPLANE-AT ?AUTO_2269 ?AUTO_2271 ) ( not ( = ?AUTO_2271 ?AUTO_2267 ) ) ( OBJ-AT ?AUTO_2266 ?AUTO_2273 ) ( AIRPLANE-AT ?AUTO_2269 ?AUTO_2273 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2266 ?AUTO_2269 ?AUTO_2273 )
      ( DELIVER-PKG ?AUTO_2266 ?AUTO_2267 )
      ( DELIVER-PKG-VERIFY ?AUTO_2266 ?AUTO_2267 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2275 - OBJ
      ?AUTO_2276 - LOCATION
    )
    :vars
    (
      ?AUTO_2281 - LOCATION
      ?AUTO_2283 - LOCATION
      ?AUTO_2279 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2281 ) ( AIRPORT ?AUTO_2276 ) ( not ( = ?AUTO_2281 ?AUTO_2276 ) ) ( OBJ-AT ?AUTO_2275 ?AUTO_2281 ) ( AIRPORT ?AUTO_2283 ) ( AIRPLANE-AT ?AUTO_2279 ?AUTO_2283 ) ( not ( = ?AUTO_2283 ?AUTO_2281 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2279 ?AUTO_2283 ?AUTO_2281 )
      ( DELIVER-PKG ?AUTO_2275 ?AUTO_2276 )
      ( DELIVER-PKG-VERIFY ?AUTO_2275 ?AUTO_2276 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2329 - OBJ
      ?AUTO_2330 - LOCATION
    )
    :vars
    (
      ?AUTO_2331 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2329 ?AUTO_2331 ) ( AIRPLANE-AT ?AUTO_2331 ?AUTO_2330 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2329 ?AUTO_2331 ?AUTO_2330 )
      ( DELIVER-PKG-VERIFY ?AUTO_2329 ?AUTO_2330 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2338 - OBJ
      ?AUTO_2339 - LOCATION
    )
    :vars
    (
      ?AUTO_2340 - LOCATION
      ?AUTO_2343 - AIRPLANE
      ?AUTO_2345 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2340 ) ( AIRPORT ?AUTO_2339 ) ( AIRPLANE-AT ?AUTO_2343 ?AUTO_2340 ) ( not ( = ?AUTO_2340 ?AUTO_2339 ) ) ( OBJ-AT ?AUTO_2338 ?AUTO_2345 ) ( AIRPLANE-AT ?AUTO_2343 ?AUTO_2345 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2338 ?AUTO_2343 ?AUTO_2345 )
      ( DELIVER-PKG ?AUTO_2338 ?AUTO_2339 )
      ( DELIVER-PKG-VERIFY ?AUTO_2338 ?AUTO_2339 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2395 - OBJ
      ?AUTO_2396 - LOCATION
    )
    :vars
    (
      ?AUTO_2397 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2397 ?AUTO_2396 ) ( IN-TRUCK ?AUTO_2395 ?AUTO_2397 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2395 ?AUTO_2397 ?AUTO_2396 )
      ( DELIVER-PKG-VERIFY ?AUTO_2395 ?AUTO_2396 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2400 - OBJ
      ?AUTO_2401 - LOCATION
    )
    :vars
    (
      ?AUTO_2404 - TRUCK
      ?AUTO_2407 - LOCATION
      ?AUTO_2406 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2400 ?AUTO_2404 ) ( TRUCK-AT ?AUTO_2404 ?AUTO_2407 ) ( IN-CITY ?AUTO_2407 ?AUTO_2406 ) ( IN-CITY ?AUTO_2401 ?AUTO_2406 ) ( not ( = ?AUTO_2401 ?AUTO_2407 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2404 ?AUTO_2407 ?AUTO_2401 ?AUTO_2406 )
      ( DELIVER-PKG ?AUTO_2400 ?AUTO_2401 )
      ( DELIVER-PKG-VERIFY ?AUTO_2400 ?AUTO_2401 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2411 - OBJ
      ?AUTO_2412 - LOCATION
    )
    :vars
    (
      ?AUTO_2417 - TRUCK
      ?AUTO_2415 - LOCATION
      ?AUTO_2416 - CITY
      ?AUTO_2419 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2417 ?AUTO_2415 ) ( IN-CITY ?AUTO_2415 ?AUTO_2416 ) ( IN-CITY ?AUTO_2412 ?AUTO_2416 ) ( not ( = ?AUTO_2412 ?AUTO_2415 ) ) ( TRUCK-AT ?AUTO_2417 ?AUTO_2419 ) ( OBJ-AT ?AUTO_2411 ?AUTO_2419 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2411 ?AUTO_2417 ?AUTO_2419 )
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
      ?AUTO_2429 - TRUCK
      ?AUTO_2428 - LOCATION
      ?AUTO_2430 - CITY
      ?AUTO_2427 - LOCATION
      ?AUTO_2431 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2429 ?AUTO_2428 ) ( IN-CITY ?AUTO_2428 ?AUTO_2430 ) ( IN-CITY ?AUTO_2424 ?AUTO_2430 ) ( not ( = ?AUTO_2424 ?AUTO_2428 ) ) ( TRUCK-AT ?AUTO_2429 ?AUTO_2427 ) ( IN-AIRPLANE ?AUTO_2423 ?AUTO_2431 ) ( AIRPLANE-AT ?AUTO_2431 ?AUTO_2427 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2423 ?AUTO_2431 ?AUTO_2427 )
      ( DELIVER-PKG ?AUTO_2423 ?AUTO_2424 )
      ( DELIVER-PKG-VERIFY ?AUTO_2423 ?AUTO_2424 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2434 - OBJ
      ?AUTO_2435 - LOCATION
    )
    :vars
    (
      ?AUTO_2441 - TRUCK
      ?AUTO_2440 - LOCATION
      ?AUTO_2439 - CITY
      ?AUTO_2438 - LOCATION
      ?AUTO_2442 - AIRPLANE
      ?AUTO_2444 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2441 ?AUTO_2440 ) ( IN-CITY ?AUTO_2440 ?AUTO_2439 ) ( IN-CITY ?AUTO_2435 ?AUTO_2439 ) ( not ( = ?AUTO_2435 ?AUTO_2440 ) ) ( TRUCK-AT ?AUTO_2441 ?AUTO_2438 ) ( IN-AIRPLANE ?AUTO_2434 ?AUTO_2442 ) ( AIRPORT ?AUTO_2444 ) ( AIRPORT ?AUTO_2438 ) ( AIRPLANE-AT ?AUTO_2442 ?AUTO_2444 ) ( not ( = ?AUTO_2444 ?AUTO_2438 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2442 ?AUTO_2444 ?AUTO_2438 )
      ( DELIVER-PKG ?AUTO_2434 ?AUTO_2435 )
      ( DELIVER-PKG-VERIFY ?AUTO_2434 ?AUTO_2435 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2448 - OBJ
      ?AUTO_2449 - LOCATION
    )
    :vars
    (
      ?AUTO_2457 - TRUCK
      ?AUTO_2451 - LOCATION
      ?AUTO_2454 - CITY
      ?AUTO_2455 - LOCATION
      ?AUTO_2452 - LOCATION
      ?AUTO_2453 - AIRPLANE
      ?AUTO_2459 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2457 ?AUTO_2451 ) ( IN-CITY ?AUTO_2451 ?AUTO_2454 ) ( IN-CITY ?AUTO_2449 ?AUTO_2454 ) ( not ( = ?AUTO_2449 ?AUTO_2451 ) ) ( TRUCK-AT ?AUTO_2457 ?AUTO_2455 ) ( AIRPORT ?AUTO_2452 ) ( AIRPORT ?AUTO_2455 ) ( AIRPLANE-AT ?AUTO_2453 ?AUTO_2452 ) ( not ( = ?AUTO_2452 ?AUTO_2455 ) ) ( OBJ-AT ?AUTO_2448 ?AUTO_2459 ) ( AIRPLANE-AT ?AUTO_2453 ?AUTO_2459 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2448 ?AUTO_2453 ?AUTO_2459 )
      ( DELIVER-PKG ?AUTO_2448 ?AUTO_2449 )
      ( DELIVER-PKG-VERIFY ?AUTO_2448 ?AUTO_2449 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2461 - OBJ
      ?AUTO_2462 - LOCATION
    )
    :vars
    (
      ?AUTO_2468 - TRUCK
      ?AUTO_2466 - LOCATION
      ?AUTO_2470 - CITY
      ?AUTO_2467 - LOCATION
      ?AUTO_2471 - LOCATION
      ?AUTO_2473 - LOCATION
      ?AUTO_2469 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2468 ?AUTO_2466 ) ( IN-CITY ?AUTO_2466 ?AUTO_2470 ) ( IN-CITY ?AUTO_2462 ?AUTO_2470 ) ( not ( = ?AUTO_2462 ?AUTO_2466 ) ) ( TRUCK-AT ?AUTO_2468 ?AUTO_2467 ) ( AIRPORT ?AUTO_2471 ) ( AIRPORT ?AUTO_2467 ) ( not ( = ?AUTO_2471 ?AUTO_2467 ) ) ( OBJ-AT ?AUTO_2461 ?AUTO_2471 ) ( AIRPORT ?AUTO_2473 ) ( AIRPLANE-AT ?AUTO_2469 ?AUTO_2473 ) ( not ( = ?AUTO_2473 ?AUTO_2471 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2469 ?AUTO_2473 ?AUTO_2471 )
      ( DELIVER-PKG ?AUTO_2461 ?AUTO_2462 )
      ( DELIVER-PKG-VERIFY ?AUTO_2461 ?AUTO_2462 ) )
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
      ?AUTO_2500 - CITY
      ?AUTO_2494 - LOCATION
      ?AUTO_2501 - LOCATION
      ?AUTO_2497 - AIRPLANE
      ?AUTO_2496 - TRUCK
      ?AUTO_2504 - LOCATION
      ?AUTO_2503 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2493 ?AUTO_2500 ) ( IN-CITY ?AUTO_2492 ?AUTO_2500 ) ( not ( = ?AUTO_2492 ?AUTO_2493 ) ) ( AIRPORT ?AUTO_2494 ) ( AIRPORT ?AUTO_2493 ) ( not ( = ?AUTO_2494 ?AUTO_2493 ) ) ( OBJ-AT ?AUTO_2491 ?AUTO_2494 ) ( AIRPORT ?AUTO_2501 ) ( AIRPLANE-AT ?AUTO_2497 ?AUTO_2501 ) ( not ( = ?AUTO_2501 ?AUTO_2494 ) ) ( TRUCK-AT ?AUTO_2496 ?AUTO_2504 ) ( IN-CITY ?AUTO_2504 ?AUTO_2503 ) ( IN-CITY ?AUTO_2493 ?AUTO_2503 ) ( not ( = ?AUTO_2493 ?AUTO_2504 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2496 ?AUTO_2504 ?AUTO_2493 ?AUTO_2503 )
      ( DELIVER-PKG ?AUTO_2491 ?AUTO_2492 )
      ( DELIVER-PKG-VERIFY ?AUTO_2491 ?AUTO_2492 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2518 - OBJ
      ?AUTO_2519 - LOCATION
    )
    :vars
    (
      ?AUTO_2526 - LOCATION
      ?AUTO_2521 - CITY
      ?AUTO_2527 - LOCATION
      ?AUTO_2529 - LOCATION
      ?AUTO_2522 - AIRPLANE
      ?AUTO_2524 - TRUCK
      ?AUTO_2520 - LOCATION
      ?AUTO_2528 - CITY
      ?AUTO_2530 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2526 ?AUTO_2521 ) ( IN-CITY ?AUTO_2519 ?AUTO_2521 ) ( not ( = ?AUTO_2519 ?AUTO_2526 ) ) ( AIRPORT ?AUTO_2527 ) ( AIRPORT ?AUTO_2526 ) ( not ( = ?AUTO_2527 ?AUTO_2526 ) ) ( AIRPORT ?AUTO_2529 ) ( AIRPLANE-AT ?AUTO_2522 ?AUTO_2529 ) ( not ( = ?AUTO_2529 ?AUTO_2527 ) ) ( TRUCK-AT ?AUTO_2524 ?AUTO_2520 ) ( IN-CITY ?AUTO_2520 ?AUTO_2528 ) ( IN-CITY ?AUTO_2526 ?AUTO_2528 ) ( not ( = ?AUTO_2526 ?AUTO_2520 ) ) ( TRUCK-AT ?AUTO_2530 ?AUTO_2527 ) ( IN-TRUCK ?AUTO_2518 ?AUTO_2530 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2518 ?AUTO_2530 ?AUTO_2527 )
      ( DELIVER-PKG ?AUTO_2518 ?AUTO_2519 )
      ( DELIVER-PKG-VERIFY ?AUTO_2518 ?AUTO_2519 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2533 - OBJ
      ?AUTO_2534 - LOCATION
    )
    :vars
    (
      ?AUTO_2539 - LOCATION
      ?AUTO_2544 - CITY
      ?AUTO_2537 - LOCATION
      ?AUTO_2545 - LOCATION
      ?AUTO_2541 - AIRPLANE
      ?AUTO_2543 - TRUCK
      ?AUTO_2538 - LOCATION
      ?AUTO_2540 - CITY
      ?AUTO_2542 - TRUCK
      ?AUTO_2548 - LOCATION
      ?AUTO_2547 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2539 ?AUTO_2544 ) ( IN-CITY ?AUTO_2534 ?AUTO_2544 ) ( not ( = ?AUTO_2534 ?AUTO_2539 ) ) ( AIRPORT ?AUTO_2537 ) ( AIRPORT ?AUTO_2539 ) ( not ( = ?AUTO_2537 ?AUTO_2539 ) ) ( AIRPORT ?AUTO_2545 ) ( AIRPLANE-AT ?AUTO_2541 ?AUTO_2545 ) ( not ( = ?AUTO_2545 ?AUTO_2537 ) ) ( TRUCK-AT ?AUTO_2543 ?AUTO_2538 ) ( IN-CITY ?AUTO_2538 ?AUTO_2540 ) ( IN-CITY ?AUTO_2539 ?AUTO_2540 ) ( not ( = ?AUTO_2539 ?AUTO_2538 ) ) ( IN-TRUCK ?AUTO_2533 ?AUTO_2542 ) ( TRUCK-AT ?AUTO_2542 ?AUTO_2548 ) ( IN-CITY ?AUTO_2548 ?AUTO_2547 ) ( IN-CITY ?AUTO_2537 ?AUTO_2547 ) ( not ( = ?AUTO_2537 ?AUTO_2548 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2542 ?AUTO_2548 ?AUTO_2537 ?AUTO_2547 )
      ( DELIVER-PKG ?AUTO_2533 ?AUTO_2534 )
      ( DELIVER-PKG-VERIFY ?AUTO_2533 ?AUTO_2534 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2554 - OBJ
      ?AUTO_2555 - LOCATION
    )
    :vars
    (
      ?AUTO_2562 - LOCATION
      ?AUTO_2563 - CITY
      ?AUTO_2556 - LOCATION
      ?AUTO_2564 - LOCATION
      ?AUTO_2560 - AIRPLANE
      ?AUTO_2558 - TRUCK
      ?AUTO_2568 - LOCATION
      ?AUTO_2557 - CITY
      ?AUTO_2559 - TRUCK
      ?AUTO_2567 - LOCATION
      ?AUTO_2565 - CITY
      ?AUTO_2570 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2562 ?AUTO_2563 ) ( IN-CITY ?AUTO_2555 ?AUTO_2563 ) ( not ( = ?AUTO_2555 ?AUTO_2562 ) ) ( AIRPORT ?AUTO_2556 ) ( AIRPORT ?AUTO_2562 ) ( not ( = ?AUTO_2556 ?AUTO_2562 ) ) ( AIRPORT ?AUTO_2564 ) ( AIRPLANE-AT ?AUTO_2560 ?AUTO_2564 ) ( not ( = ?AUTO_2564 ?AUTO_2556 ) ) ( TRUCK-AT ?AUTO_2558 ?AUTO_2568 ) ( IN-CITY ?AUTO_2568 ?AUTO_2557 ) ( IN-CITY ?AUTO_2562 ?AUTO_2557 ) ( not ( = ?AUTO_2562 ?AUTO_2568 ) ) ( TRUCK-AT ?AUTO_2559 ?AUTO_2567 ) ( IN-CITY ?AUTO_2567 ?AUTO_2565 ) ( IN-CITY ?AUTO_2556 ?AUTO_2565 ) ( not ( = ?AUTO_2556 ?AUTO_2567 ) ) ( TRUCK-AT ?AUTO_2559 ?AUTO_2570 ) ( OBJ-AT ?AUTO_2554 ?AUTO_2570 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2554 ?AUTO_2559 ?AUTO_2570 )
      ( DELIVER-PKG ?AUTO_2554 ?AUTO_2555 )
      ( DELIVER-PKG-VERIFY ?AUTO_2554 ?AUTO_2555 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2572 - OBJ
      ?AUTO_2573 - LOCATION
    )
    :vars
    (
      ?AUTO_2581 - LOCATION
      ?AUTO_2580 - CITY
      ?AUTO_2584 - LOCATION
      ?AUTO_2582 - LOCATION
      ?AUTO_2574 - AIRPLANE
      ?AUTO_2583 - TRUCK
      ?AUTO_2586 - LOCATION
      ?AUTO_2585 - CITY
      ?AUTO_2579 - LOCATION
      ?AUTO_2575 - CITY
      ?AUTO_2587 - TRUCK
      ?AUTO_2590 - LOCATION
      ?AUTO_2589 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2581 ?AUTO_2580 ) ( IN-CITY ?AUTO_2573 ?AUTO_2580 ) ( not ( = ?AUTO_2573 ?AUTO_2581 ) ) ( AIRPORT ?AUTO_2584 ) ( AIRPORT ?AUTO_2581 ) ( not ( = ?AUTO_2584 ?AUTO_2581 ) ) ( AIRPORT ?AUTO_2582 ) ( AIRPLANE-AT ?AUTO_2574 ?AUTO_2582 ) ( not ( = ?AUTO_2582 ?AUTO_2584 ) ) ( TRUCK-AT ?AUTO_2583 ?AUTO_2586 ) ( IN-CITY ?AUTO_2586 ?AUTO_2585 ) ( IN-CITY ?AUTO_2581 ?AUTO_2585 ) ( not ( = ?AUTO_2581 ?AUTO_2586 ) ) ( IN-CITY ?AUTO_2579 ?AUTO_2575 ) ( IN-CITY ?AUTO_2584 ?AUTO_2575 ) ( not ( = ?AUTO_2584 ?AUTO_2579 ) ) ( OBJ-AT ?AUTO_2572 ?AUTO_2579 ) ( TRUCK-AT ?AUTO_2587 ?AUTO_2590 ) ( IN-CITY ?AUTO_2590 ?AUTO_2589 ) ( IN-CITY ?AUTO_2579 ?AUTO_2589 ) ( not ( = ?AUTO_2579 ?AUTO_2590 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2587 ?AUTO_2590 ?AUTO_2579 ?AUTO_2589 )
      ( DELIVER-PKG ?AUTO_2572 ?AUTO_2573 )
      ( DELIVER-PKG-VERIFY ?AUTO_2572 ?AUTO_2573 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2594 - OBJ
      ?AUTO_2595 - LOCATION
    )
    :vars
    (
      ?AUTO_2596 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2596 ?AUTO_2595 ) ( IN-TRUCK ?AUTO_2594 ?AUTO_2596 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2594 ?AUTO_2596 ?AUTO_2595 )
      ( DELIVER-PKG-VERIFY ?AUTO_2594 ?AUTO_2595 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2637 - OBJ
      ?AUTO_2638 - LOCATION
    )
    :vars
    (
      ?AUTO_2644 - LOCATION
      ?AUTO_2648 - CITY
      ?AUTO_2642 - LOCATION
      ?AUTO_2643 - LOCATION
      ?AUTO_2639 - AIRPLANE
      ?AUTO_2640 - TRUCK
      ?AUTO_2647 - LOCATION
      ?AUTO_2645 - CITY
      ?AUTO_2649 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2644 ?AUTO_2648 ) ( IN-CITY ?AUTO_2638 ?AUTO_2648 ) ( not ( = ?AUTO_2638 ?AUTO_2644 ) ) ( AIRPORT ?AUTO_2642 ) ( AIRPORT ?AUTO_2644 ) ( not ( = ?AUTO_2642 ?AUTO_2644 ) ) ( AIRPORT ?AUTO_2643 ) ( AIRPLANE-AT ?AUTO_2639 ?AUTO_2643 ) ( not ( = ?AUTO_2643 ?AUTO_2642 ) ) ( TRUCK-AT ?AUTO_2640 ?AUTO_2647 ) ( IN-CITY ?AUTO_2647 ?AUTO_2645 ) ( IN-CITY ?AUTO_2644 ?AUTO_2645 ) ( not ( = ?AUTO_2644 ?AUTO_2647 ) ) ( TRUCK-AT ?AUTO_2649 ?AUTO_2642 ) ( IN-TRUCK ?AUTO_2637 ?AUTO_2649 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2637 ?AUTO_2649 ?AUTO_2642 )
      ( DELIVER-PKG ?AUTO_2637 ?AUTO_2638 )
      ( DELIVER-PKG-VERIFY ?AUTO_2637 ?AUTO_2638 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2652 - OBJ
      ?AUTO_2653 - LOCATION
    )
    :vars
    (
      ?AUTO_2659 - LOCATION
      ?AUTO_2658 - CITY
      ?AUTO_2660 - LOCATION
      ?AUTO_2661 - LOCATION
      ?AUTO_2657 - AIRPLANE
      ?AUTO_2656 - TRUCK
      ?AUTO_2663 - LOCATION
      ?AUTO_2662 - CITY
      ?AUTO_2664 - TRUCK
      ?AUTO_2667 - LOCATION
      ?AUTO_2666 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2659 ?AUTO_2658 ) ( IN-CITY ?AUTO_2653 ?AUTO_2658 ) ( not ( = ?AUTO_2653 ?AUTO_2659 ) ) ( AIRPORT ?AUTO_2660 ) ( AIRPORT ?AUTO_2659 ) ( not ( = ?AUTO_2660 ?AUTO_2659 ) ) ( AIRPORT ?AUTO_2661 ) ( AIRPLANE-AT ?AUTO_2657 ?AUTO_2661 ) ( not ( = ?AUTO_2661 ?AUTO_2660 ) ) ( TRUCK-AT ?AUTO_2656 ?AUTO_2663 ) ( IN-CITY ?AUTO_2663 ?AUTO_2662 ) ( IN-CITY ?AUTO_2659 ?AUTO_2662 ) ( not ( = ?AUTO_2659 ?AUTO_2663 ) ) ( IN-TRUCK ?AUTO_2652 ?AUTO_2664 ) ( TRUCK-AT ?AUTO_2664 ?AUTO_2667 ) ( IN-CITY ?AUTO_2667 ?AUTO_2666 ) ( IN-CITY ?AUTO_2660 ?AUTO_2666 ) ( not ( = ?AUTO_2660 ?AUTO_2667 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2664 ?AUTO_2667 ?AUTO_2660 ?AUTO_2666 )
      ( DELIVER-PKG ?AUTO_2652 ?AUTO_2653 )
      ( DELIVER-PKG-VERIFY ?AUTO_2652 ?AUTO_2653 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2669 - OBJ
      ?AUTO_2670 - LOCATION
    )
    :vars
    (
      ?AUTO_2675 - LOCATION
      ?AUTO_2681 - CITY
      ?AUTO_2677 - LOCATION
      ?AUTO_2678 - LOCATION
      ?AUTO_2680 - AIRPLANE
      ?AUTO_2682 - TRUCK
      ?AUTO_2676 - LOCATION
      ?AUTO_2679 - CITY
      ?AUTO_2674 - TRUCK
      ?AUTO_2683 - LOCATION
      ?AUTO_2671 - CITY
      ?AUTO_2685 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2675 ?AUTO_2681 ) ( IN-CITY ?AUTO_2670 ?AUTO_2681 ) ( not ( = ?AUTO_2670 ?AUTO_2675 ) ) ( AIRPORT ?AUTO_2677 ) ( AIRPORT ?AUTO_2675 ) ( not ( = ?AUTO_2677 ?AUTO_2675 ) ) ( AIRPORT ?AUTO_2678 ) ( AIRPLANE-AT ?AUTO_2680 ?AUTO_2678 ) ( not ( = ?AUTO_2678 ?AUTO_2677 ) ) ( TRUCK-AT ?AUTO_2682 ?AUTO_2676 ) ( IN-CITY ?AUTO_2676 ?AUTO_2679 ) ( IN-CITY ?AUTO_2675 ?AUTO_2679 ) ( not ( = ?AUTO_2675 ?AUTO_2676 ) ) ( TRUCK-AT ?AUTO_2674 ?AUTO_2683 ) ( IN-CITY ?AUTO_2683 ?AUTO_2671 ) ( IN-CITY ?AUTO_2677 ?AUTO_2671 ) ( not ( = ?AUTO_2677 ?AUTO_2683 ) ) ( TRUCK-AT ?AUTO_2674 ?AUTO_2685 ) ( OBJ-AT ?AUTO_2669 ?AUTO_2685 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2669 ?AUTO_2674 ?AUTO_2685 )
      ( DELIVER-PKG ?AUTO_2669 ?AUTO_2670 )
      ( DELIVER-PKG-VERIFY ?AUTO_2669 ?AUTO_2670 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2687 - OBJ
      ?AUTO_2688 - LOCATION
    )
    :vars
    (
      ?AUTO_2696 - LOCATION
      ?AUTO_2700 - CITY
      ?AUTO_2689 - LOCATION
      ?AUTO_2695 - LOCATION
      ?AUTO_2701 - AIRPLANE
      ?AUTO_2691 - TRUCK
      ?AUTO_2697 - LOCATION
      ?AUTO_2690 - CITY
      ?AUTO_2702 - LOCATION
      ?AUTO_2698 - CITY
      ?AUTO_2694 - TRUCK
      ?AUTO_2705 - LOCATION
      ?AUTO_2704 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2696 ?AUTO_2700 ) ( IN-CITY ?AUTO_2688 ?AUTO_2700 ) ( not ( = ?AUTO_2688 ?AUTO_2696 ) ) ( AIRPORT ?AUTO_2689 ) ( AIRPORT ?AUTO_2696 ) ( not ( = ?AUTO_2689 ?AUTO_2696 ) ) ( AIRPORT ?AUTO_2695 ) ( AIRPLANE-AT ?AUTO_2701 ?AUTO_2695 ) ( not ( = ?AUTO_2695 ?AUTO_2689 ) ) ( TRUCK-AT ?AUTO_2691 ?AUTO_2697 ) ( IN-CITY ?AUTO_2697 ?AUTO_2690 ) ( IN-CITY ?AUTO_2696 ?AUTO_2690 ) ( not ( = ?AUTO_2696 ?AUTO_2697 ) ) ( IN-CITY ?AUTO_2702 ?AUTO_2698 ) ( IN-CITY ?AUTO_2689 ?AUTO_2698 ) ( not ( = ?AUTO_2689 ?AUTO_2702 ) ) ( OBJ-AT ?AUTO_2687 ?AUTO_2702 ) ( TRUCK-AT ?AUTO_2694 ?AUTO_2705 ) ( IN-CITY ?AUTO_2705 ?AUTO_2704 ) ( IN-CITY ?AUTO_2702 ?AUTO_2704 ) ( not ( = ?AUTO_2702 ?AUTO_2705 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2694 ?AUTO_2705 ?AUTO_2702 ?AUTO_2704 )
      ( DELIVER-PKG ?AUTO_2687 ?AUTO_2688 )
      ( DELIVER-PKG-VERIFY ?AUTO_2687 ?AUTO_2688 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2725 - OBJ
      ?AUTO_2726 - LOCATION
    )
    :vars
    (
      ?AUTO_2727 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2727 ?AUTO_2726 ) ( IN-TRUCK ?AUTO_2725 ?AUTO_2727 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2725 ?AUTO_2727 ?AUTO_2726 )
      ( DELIVER-PKG-VERIFY ?AUTO_2725 ?AUTO_2726 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2730 - OBJ
      ?AUTO_2731 - LOCATION
    )
    :vars
    (
      ?AUTO_2734 - TRUCK
      ?AUTO_2737 - LOCATION
      ?AUTO_2736 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2730 ?AUTO_2734 ) ( TRUCK-AT ?AUTO_2734 ?AUTO_2737 ) ( IN-CITY ?AUTO_2737 ?AUTO_2736 ) ( IN-CITY ?AUTO_2731 ?AUTO_2736 ) ( not ( = ?AUTO_2731 ?AUTO_2737 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2734 ?AUTO_2737 ?AUTO_2731 ?AUTO_2736 )
      ( DELIVER-PKG ?AUTO_2730 ?AUTO_2731 )
      ( DELIVER-PKG-VERIFY ?AUTO_2730 ?AUTO_2731 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2745 - OBJ
      ?AUTO_2746 - LOCATION
    )
    :vars
    (
      ?AUTO_2750 - TRUCK
      ?AUTO_2751 - LOCATION
      ?AUTO_2747 - CITY
      ?AUTO_2753 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2750 ?AUTO_2751 ) ( IN-CITY ?AUTO_2751 ?AUTO_2747 ) ( IN-CITY ?AUTO_2746 ?AUTO_2747 ) ( not ( = ?AUTO_2746 ?AUTO_2751 ) ) ( TRUCK-AT ?AUTO_2750 ?AUTO_2753 ) ( OBJ-AT ?AUTO_2745 ?AUTO_2753 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2745 ?AUTO_2750 ?AUTO_2753 )
      ( DELIVER-PKG ?AUTO_2745 ?AUTO_2746 )
      ( DELIVER-PKG-VERIFY ?AUTO_2745 ?AUTO_2746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2757 - OBJ
      ?AUTO_2758 - LOCATION
    )
    :vars
    (
      ?AUTO_2762 - TRUCK
      ?AUTO_2763 - LOCATION
      ?AUTO_2764 - CITY
      ?AUTO_2761 - LOCATION
      ?AUTO_2765 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2762 ?AUTO_2763 ) ( IN-CITY ?AUTO_2763 ?AUTO_2764 ) ( IN-CITY ?AUTO_2758 ?AUTO_2764 ) ( not ( = ?AUTO_2758 ?AUTO_2763 ) ) ( TRUCK-AT ?AUTO_2762 ?AUTO_2761 ) ( IN-AIRPLANE ?AUTO_2757 ?AUTO_2765 ) ( AIRPLANE-AT ?AUTO_2765 ?AUTO_2761 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2757 ?AUTO_2765 ?AUTO_2761 )
      ( DELIVER-PKG ?AUTO_2757 ?AUTO_2758 )
      ( DELIVER-PKG-VERIFY ?AUTO_2757 ?AUTO_2758 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2772 - OBJ
      ?AUTO_2773 - LOCATION
    )
    :vars
    (
      ?AUTO_2775 - TRUCK
      ?AUTO_2781 - LOCATION
      ?AUTO_2780 - CITY
      ?AUTO_2779 - LOCATION
      ?AUTO_2778 - LOCATION
      ?AUTO_2777 - AIRPLANE
      ?AUTO_2783 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2775 ?AUTO_2781 ) ( IN-CITY ?AUTO_2781 ?AUTO_2780 ) ( IN-CITY ?AUTO_2773 ?AUTO_2780 ) ( not ( = ?AUTO_2773 ?AUTO_2781 ) ) ( TRUCK-AT ?AUTO_2775 ?AUTO_2779 ) ( AIRPORT ?AUTO_2778 ) ( AIRPORT ?AUTO_2779 ) ( AIRPLANE-AT ?AUTO_2777 ?AUTO_2778 ) ( not ( = ?AUTO_2778 ?AUTO_2779 ) ) ( OBJ-AT ?AUTO_2772 ?AUTO_2783 ) ( AIRPLANE-AT ?AUTO_2777 ?AUTO_2783 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2772 ?AUTO_2777 ?AUTO_2783 )
      ( DELIVER-PKG ?AUTO_2772 ?AUTO_2773 )
      ( DELIVER-PKG-VERIFY ?AUTO_2772 ?AUTO_2773 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2786 - OBJ
      ?AUTO_2787 - LOCATION
    )
    :vars
    (
      ?AUTO_2788 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2788 ?AUTO_2787 ) ( IN-TRUCK ?AUTO_2786 ?AUTO_2788 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2786 ?AUTO_2788 ?AUTO_2787 )
      ( DELIVER-PKG-VERIFY ?AUTO_2786 ?AUTO_2787 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2791 - OBJ
      ?AUTO_2792 - LOCATION
    )
    :vars
    (
      ?AUTO_2795 - TRUCK
      ?AUTO_2798 - LOCATION
      ?AUTO_2797 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2791 ?AUTO_2795 ) ( TRUCK-AT ?AUTO_2795 ?AUTO_2798 ) ( IN-CITY ?AUTO_2798 ?AUTO_2797 ) ( IN-CITY ?AUTO_2792 ?AUTO_2797 ) ( not ( = ?AUTO_2792 ?AUTO_2798 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2795 ?AUTO_2798 ?AUTO_2792 ?AUTO_2797 )
      ( DELIVER-PKG ?AUTO_2791 ?AUTO_2792 )
      ( DELIVER-PKG-VERIFY ?AUTO_2791 ?AUTO_2792 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2800 - OBJ
      ?AUTO_2801 - LOCATION
    )
    :vars
    (
      ?AUTO_2804 - TRUCK
      ?AUTO_2806 - LOCATION
      ?AUTO_2805 - CITY
      ?AUTO_2808 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2804 ?AUTO_2806 ) ( IN-CITY ?AUTO_2806 ?AUTO_2805 ) ( IN-CITY ?AUTO_2801 ?AUTO_2805 ) ( not ( = ?AUTO_2801 ?AUTO_2806 ) ) ( TRUCK-AT ?AUTO_2804 ?AUTO_2808 ) ( OBJ-AT ?AUTO_2800 ?AUTO_2808 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2800 ?AUTO_2804 ?AUTO_2808 )
      ( DELIVER-PKG ?AUTO_2800 ?AUTO_2801 )
      ( DELIVER-PKG-VERIFY ?AUTO_2800 ?AUTO_2801 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2810 - OBJ
      ?AUTO_2811 - LOCATION
    )
    :vars
    (
      ?AUTO_2817 - LOCATION
      ?AUTO_2816 - CITY
      ?AUTO_2815 - TRUCK
      ?AUTO_2820 - LOCATION
      ?AUTO_2819 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2817 ?AUTO_2816 ) ( IN-CITY ?AUTO_2811 ?AUTO_2816 ) ( not ( = ?AUTO_2811 ?AUTO_2817 ) ) ( OBJ-AT ?AUTO_2810 ?AUTO_2817 ) ( TRUCK-AT ?AUTO_2815 ?AUTO_2820 ) ( IN-CITY ?AUTO_2820 ?AUTO_2819 ) ( IN-CITY ?AUTO_2817 ?AUTO_2819 ) ( not ( = ?AUTO_2817 ?AUTO_2820 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2815 ?AUTO_2820 ?AUTO_2817 ?AUTO_2819 )
      ( DELIVER-PKG ?AUTO_2810 ?AUTO_2811 )
      ( DELIVER-PKG-VERIFY ?AUTO_2810 ?AUTO_2811 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2834 - OBJ
      ?AUTO_2835 - LOCATION
    )
    :vars
    (
      ?AUTO_2836 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2836 ?AUTO_2835 ) ( IN-TRUCK ?AUTO_2834 ?AUTO_2836 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2834 ?AUTO_2836 ?AUTO_2835 )
      ( DELIVER-PKG-VERIFY ?AUTO_2834 ?AUTO_2835 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2839 - OBJ
      ?AUTO_2840 - LOCATION
    )
    :vars
    (
      ?AUTO_2843 - TRUCK
      ?AUTO_2846 - LOCATION
      ?AUTO_2845 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2839 ?AUTO_2843 ) ( TRUCK-AT ?AUTO_2843 ?AUTO_2846 ) ( IN-CITY ?AUTO_2846 ?AUTO_2845 ) ( IN-CITY ?AUTO_2840 ?AUTO_2845 ) ( not ( = ?AUTO_2840 ?AUTO_2846 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2843 ?AUTO_2846 ?AUTO_2840 ?AUTO_2845 )
      ( DELIVER-PKG ?AUTO_2839 ?AUTO_2840 )
      ( DELIVER-PKG-VERIFY ?AUTO_2839 ?AUTO_2840 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2852 - OBJ
      ?AUTO_2853 - LOCATION
    )
    :vars
    (
      ?AUTO_2858 - TRUCK
      ?AUTO_2855 - LOCATION
      ?AUTO_2854 - CITY
      ?AUTO_2860 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2858 ?AUTO_2855 ) ( IN-CITY ?AUTO_2855 ?AUTO_2854 ) ( IN-CITY ?AUTO_2853 ?AUTO_2854 ) ( not ( = ?AUTO_2853 ?AUTO_2855 ) ) ( TRUCK-AT ?AUTO_2858 ?AUTO_2860 ) ( OBJ-AT ?AUTO_2852 ?AUTO_2860 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2852 ?AUTO_2858 ?AUTO_2860 )
      ( DELIVER-PKG ?AUTO_2852 ?AUTO_2853 )
      ( DELIVER-PKG-VERIFY ?AUTO_2852 ?AUTO_2853 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2862 - OBJ
      ?AUTO_2863 - LOCATION
    )
    :vars
    (
      ?AUTO_2869 - LOCATION
      ?AUTO_2866 - CITY
      ?AUTO_2868 - TRUCK
      ?AUTO_2872 - LOCATION
      ?AUTO_2871 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2869 ?AUTO_2866 ) ( IN-CITY ?AUTO_2863 ?AUTO_2866 ) ( not ( = ?AUTO_2863 ?AUTO_2869 ) ) ( OBJ-AT ?AUTO_2862 ?AUTO_2869 ) ( TRUCK-AT ?AUTO_2868 ?AUTO_2872 ) ( IN-CITY ?AUTO_2872 ?AUTO_2871 ) ( IN-CITY ?AUTO_2869 ?AUTO_2871 ) ( not ( = ?AUTO_2869 ?AUTO_2872 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2868 ?AUTO_2872 ?AUTO_2869 ?AUTO_2871 )
      ( DELIVER-PKG ?AUTO_2862 ?AUTO_2863 )
      ( DELIVER-PKG-VERIFY ?AUTO_2862 ?AUTO_2863 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2894 - OBJ
      ?AUTO_2895 - LOCATION
    )
    :vars
    (
      ?AUTO_2896 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2896 ?AUTO_2895 ) ( IN-TRUCK ?AUTO_2894 ?AUTO_2896 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2894 ?AUTO_2896 ?AUTO_2895 )
      ( DELIVER-PKG-VERIFY ?AUTO_2894 ?AUTO_2895 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2905 - OBJ
      ?AUTO_2906 - LOCATION
    )
    :vars
    (
      ?AUTO_2910 - TRUCK
      ?AUTO_2908 - LOCATION
      ?AUTO_2911 - CITY
      ?AUTO_2913 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2910 ?AUTO_2908 ) ( IN-CITY ?AUTO_2908 ?AUTO_2911 ) ( IN-CITY ?AUTO_2906 ?AUTO_2911 ) ( not ( = ?AUTO_2906 ?AUTO_2908 ) ) ( TRUCK-AT ?AUTO_2910 ?AUTO_2913 ) ( OBJ-AT ?AUTO_2905 ?AUTO_2913 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2905 ?AUTO_2910 ?AUTO_2913 )
      ( DELIVER-PKG ?AUTO_2905 ?AUTO_2906 )
      ( DELIVER-PKG-VERIFY ?AUTO_2905 ?AUTO_2906 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2939 - OBJ
      ?AUTO_2940 - LOCATION
    )
    :vars
    (
      ?AUTO_2941 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2941 ?AUTO_2940 ) ( IN-TRUCK ?AUTO_2939 ?AUTO_2941 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2939 ?AUTO_2941 ?AUTO_2940 )
      ( DELIVER-PKG-VERIFY ?AUTO_2939 ?AUTO_2940 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2950 - OBJ
      ?AUTO_2951 - LOCATION
    )
    :vars
    (
      ?AUTO_2955 - TRUCK
      ?AUTO_2953 - LOCATION
      ?AUTO_2956 - CITY
      ?AUTO_2958 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2955 ?AUTO_2953 ) ( IN-CITY ?AUTO_2953 ?AUTO_2956 ) ( IN-CITY ?AUTO_2951 ?AUTO_2956 ) ( not ( = ?AUTO_2951 ?AUTO_2953 ) ) ( TRUCK-AT ?AUTO_2955 ?AUTO_2958 ) ( OBJ-AT ?AUTO_2950 ?AUTO_2958 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2950 ?AUTO_2955 ?AUTO_2958 )
      ( DELIVER-PKG ?AUTO_2950 ?AUTO_2951 )
      ( DELIVER-PKG-VERIFY ?AUTO_2950 ?AUTO_2951 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2986 - OBJ
      ?AUTO_2987 - LOCATION
    )
    :vars
    (
      ?AUTO_2988 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2986 ?AUTO_2988 ) ( AIRPLANE-AT ?AUTO_2988 ?AUTO_2987 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2986 ?AUTO_2988 ?AUTO_2987 )
      ( DELIVER-PKG-VERIFY ?AUTO_2986 ?AUTO_2987 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2991 - OBJ
      ?AUTO_2992 - LOCATION
    )
    :vars
    (
      ?AUTO_2995 - AIRPLANE
      ?AUTO_2997 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2991 ?AUTO_2995 ) ( AIRPORT ?AUTO_2997 ) ( AIRPORT ?AUTO_2992 ) ( AIRPLANE-AT ?AUTO_2995 ?AUTO_2997 ) ( not ( = ?AUTO_2997 ?AUTO_2992 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2995 ?AUTO_2997 ?AUTO_2992 )
      ( DELIVER-PKG ?AUTO_2991 ?AUTO_2992 )
      ( DELIVER-PKG-VERIFY ?AUTO_2991 ?AUTO_2992 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2999 - OBJ
      ?AUTO_3000 - LOCATION
    )
    :vars
    (
      ?AUTO_3004 - LOCATION
      ?AUTO_3003 - AIRPLANE
      ?AUTO_3006 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3004 ) ( AIRPORT ?AUTO_3000 ) ( AIRPLANE-AT ?AUTO_3003 ?AUTO_3004 ) ( not ( = ?AUTO_3004 ?AUTO_3000 ) ) ( OBJ-AT ?AUTO_2999 ?AUTO_3006 ) ( AIRPLANE-AT ?AUTO_3003 ?AUTO_3006 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2999 ?AUTO_3003 ?AUTO_3006 )
      ( DELIVER-PKG ?AUTO_2999 ?AUTO_3000 )
      ( DELIVER-PKG-VERIFY ?AUTO_2999 ?AUTO_3000 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3008 - OBJ
      ?AUTO_3009 - LOCATION
    )
    :vars
    (
      ?AUTO_3014 - LOCATION
      ?AUTO_3016 - LOCATION
      ?AUTO_3012 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3014 ) ( AIRPORT ?AUTO_3009 ) ( not ( = ?AUTO_3014 ?AUTO_3009 ) ) ( OBJ-AT ?AUTO_3008 ?AUTO_3014 ) ( AIRPORT ?AUTO_3016 ) ( AIRPLANE-AT ?AUTO_3012 ?AUTO_3016 ) ( not ( = ?AUTO_3016 ?AUTO_3014 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3012 ?AUTO_3016 ?AUTO_3014 )
      ( DELIVER-PKG ?AUTO_3008 ?AUTO_3009 )
      ( DELIVER-PKG-VERIFY ?AUTO_3008 ?AUTO_3009 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3042 - OBJ
      ?AUTO_3043 - LOCATION
    )
    :vars
    (
      ?AUTO_3045 - LOCATION
      ?AUTO_3046 - LOCATION
      ?AUTO_3044 - AIRPLANE
      ?AUTO_3049 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3045 ) ( AIRPORT ?AUTO_3043 ) ( not ( = ?AUTO_3045 ?AUTO_3043 ) ) ( AIRPORT ?AUTO_3046 ) ( AIRPLANE-AT ?AUTO_3044 ?AUTO_3046 ) ( not ( = ?AUTO_3046 ?AUTO_3045 ) ) ( TRUCK-AT ?AUTO_3049 ?AUTO_3045 ) ( IN-TRUCK ?AUTO_3042 ?AUTO_3049 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3042 ?AUTO_3049 ?AUTO_3045 )
      ( DELIVER-PKG ?AUTO_3042 ?AUTO_3043 )
      ( DELIVER-PKG-VERIFY ?AUTO_3042 ?AUTO_3043 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3052 - OBJ
      ?AUTO_3053 - LOCATION
    )
    :vars
    (
      ?AUTO_3056 - LOCATION
      ?AUTO_3057 - LOCATION
      ?AUTO_3058 - AIRPLANE
      ?AUTO_3059 - TRUCK
      ?AUTO_3062 - LOCATION
      ?AUTO_3061 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3056 ) ( AIRPORT ?AUTO_3053 ) ( not ( = ?AUTO_3056 ?AUTO_3053 ) ) ( AIRPORT ?AUTO_3057 ) ( AIRPLANE-AT ?AUTO_3058 ?AUTO_3057 ) ( not ( = ?AUTO_3057 ?AUTO_3056 ) ) ( IN-TRUCK ?AUTO_3052 ?AUTO_3059 ) ( TRUCK-AT ?AUTO_3059 ?AUTO_3062 ) ( IN-CITY ?AUTO_3062 ?AUTO_3061 ) ( IN-CITY ?AUTO_3056 ?AUTO_3061 ) ( not ( = ?AUTO_3056 ?AUTO_3062 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3059 ?AUTO_3062 ?AUTO_3056 ?AUTO_3061 )
      ( DELIVER-PKG ?AUTO_3052 ?AUTO_3053 )
      ( DELIVER-PKG-VERIFY ?AUTO_3052 ?AUTO_3053 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3064 - OBJ
      ?AUTO_3065 - LOCATION
    )
    :vars
    (
      ?AUTO_3071 - LOCATION
      ?AUTO_3070 - LOCATION
      ?AUTO_3072 - AIRPLANE
      ?AUTO_3066 - TRUCK
      ?AUTO_3073 - LOCATION
      ?AUTO_3067 - CITY
      ?AUTO_3075 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3071 ) ( AIRPORT ?AUTO_3065 ) ( not ( = ?AUTO_3071 ?AUTO_3065 ) ) ( AIRPORT ?AUTO_3070 ) ( AIRPLANE-AT ?AUTO_3072 ?AUTO_3070 ) ( not ( = ?AUTO_3070 ?AUTO_3071 ) ) ( TRUCK-AT ?AUTO_3066 ?AUTO_3073 ) ( IN-CITY ?AUTO_3073 ?AUTO_3067 ) ( IN-CITY ?AUTO_3071 ?AUTO_3067 ) ( not ( = ?AUTO_3071 ?AUTO_3073 ) ) ( TRUCK-AT ?AUTO_3066 ?AUTO_3075 ) ( OBJ-AT ?AUTO_3064 ?AUTO_3075 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3064 ?AUTO_3066 ?AUTO_3075 )
      ( DELIVER-PKG ?AUTO_3064 ?AUTO_3065 )
      ( DELIVER-PKG-VERIFY ?AUTO_3064 ?AUTO_3065 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3077 - OBJ
      ?AUTO_3078 - LOCATION
    )
    :vars
    (
      ?AUTO_3086 - LOCATION
      ?AUTO_3087 - LOCATION
      ?AUTO_3079 - AIRPLANE
      ?AUTO_3082 - LOCATION
      ?AUTO_3084 - CITY
      ?AUTO_3085 - TRUCK
      ?AUTO_3090 - LOCATION
      ?AUTO_3089 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3086 ) ( AIRPORT ?AUTO_3078 ) ( not ( = ?AUTO_3086 ?AUTO_3078 ) ) ( AIRPORT ?AUTO_3087 ) ( AIRPLANE-AT ?AUTO_3079 ?AUTO_3087 ) ( not ( = ?AUTO_3087 ?AUTO_3086 ) ) ( IN-CITY ?AUTO_3082 ?AUTO_3084 ) ( IN-CITY ?AUTO_3086 ?AUTO_3084 ) ( not ( = ?AUTO_3086 ?AUTO_3082 ) ) ( OBJ-AT ?AUTO_3077 ?AUTO_3082 ) ( TRUCK-AT ?AUTO_3085 ?AUTO_3090 ) ( IN-CITY ?AUTO_3090 ?AUTO_3089 ) ( IN-CITY ?AUTO_3082 ?AUTO_3089 ) ( not ( = ?AUTO_3082 ?AUTO_3090 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3085 ?AUTO_3090 ?AUTO_3082 ?AUTO_3089 )
      ( DELIVER-PKG ?AUTO_3077 ?AUTO_3078 )
      ( DELIVER-PKG-VERIFY ?AUTO_3077 ?AUTO_3078 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3104 - OBJ
      ?AUTO_3105 - LOCATION
    )
    :vars
    (
      ?AUTO_3106 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3106 ?AUTO_3105 ) ( IN-TRUCK ?AUTO_3104 ?AUTO_3106 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3104 ?AUTO_3106 ?AUTO_3105 )
      ( DELIVER-PKG-VERIFY ?AUTO_3104 ?AUTO_3105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3109 - OBJ
      ?AUTO_3110 - LOCATION
    )
    :vars
    (
      ?AUTO_3113 - TRUCK
      ?AUTO_3116 - LOCATION
      ?AUTO_3115 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3109 ?AUTO_3113 ) ( TRUCK-AT ?AUTO_3113 ?AUTO_3116 ) ( IN-CITY ?AUTO_3116 ?AUTO_3115 ) ( IN-CITY ?AUTO_3110 ?AUTO_3115 ) ( not ( = ?AUTO_3110 ?AUTO_3116 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3113 ?AUTO_3116 ?AUTO_3110 ?AUTO_3115 )
      ( DELIVER-PKG ?AUTO_3109 ?AUTO_3110 )
      ( DELIVER-PKG-VERIFY ?AUTO_3109 ?AUTO_3110 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3118 - OBJ
      ?AUTO_3119 - LOCATION
    )
    :vars
    (
      ?AUTO_3122 - TRUCK
      ?AUTO_3124 - LOCATION
      ?AUTO_3123 - CITY
      ?AUTO_3126 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3122 ?AUTO_3124 ) ( IN-CITY ?AUTO_3124 ?AUTO_3123 ) ( IN-CITY ?AUTO_3119 ?AUTO_3123 ) ( not ( = ?AUTO_3119 ?AUTO_3124 ) ) ( TRUCK-AT ?AUTO_3122 ?AUTO_3126 ) ( OBJ-AT ?AUTO_3118 ?AUTO_3126 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3118 ?AUTO_3122 ?AUTO_3126 )
      ( DELIVER-PKG ?AUTO_3118 ?AUTO_3119 )
      ( DELIVER-PKG-VERIFY ?AUTO_3118 ?AUTO_3119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3130 - OBJ
      ?AUTO_3131 - LOCATION
    )
    :vars
    (
      ?AUTO_3136 - TRUCK
      ?AUTO_3133 - LOCATION
      ?AUTO_3137 - CITY
      ?AUTO_3135 - LOCATION
      ?AUTO_3138 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3136 ?AUTO_3133 ) ( IN-CITY ?AUTO_3133 ?AUTO_3137 ) ( IN-CITY ?AUTO_3131 ?AUTO_3137 ) ( not ( = ?AUTO_3131 ?AUTO_3133 ) ) ( TRUCK-AT ?AUTO_3136 ?AUTO_3135 ) ( IN-AIRPLANE ?AUTO_3130 ?AUTO_3138 ) ( AIRPLANE-AT ?AUTO_3138 ?AUTO_3135 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3130 ?AUTO_3138 ?AUTO_3135 )
      ( DELIVER-PKG ?AUTO_3130 ?AUTO_3131 )
      ( DELIVER-PKG-VERIFY ?AUTO_3130 ?AUTO_3131 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3141 - OBJ
      ?AUTO_3142 - LOCATION
    )
    :vars
    (
      ?AUTO_3147 - TRUCK
      ?AUTO_3146 - LOCATION
      ?AUTO_3145 - CITY
      ?AUTO_3149 - LOCATION
      ?AUTO_3148 - AIRPLANE
      ?AUTO_3151 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3147 ?AUTO_3146 ) ( IN-CITY ?AUTO_3146 ?AUTO_3145 ) ( IN-CITY ?AUTO_3142 ?AUTO_3145 ) ( not ( = ?AUTO_3142 ?AUTO_3146 ) ) ( TRUCK-AT ?AUTO_3147 ?AUTO_3149 ) ( IN-AIRPLANE ?AUTO_3141 ?AUTO_3148 ) ( AIRPORT ?AUTO_3151 ) ( AIRPORT ?AUTO_3149 ) ( AIRPLANE-AT ?AUTO_3148 ?AUTO_3151 ) ( not ( = ?AUTO_3151 ?AUTO_3149 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3148 ?AUTO_3151 ?AUTO_3149 )
      ( DELIVER-PKG ?AUTO_3141 ?AUTO_3142 )
      ( DELIVER-PKG-VERIFY ?AUTO_3141 ?AUTO_3142 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3153 - OBJ
      ?AUTO_3154 - LOCATION
    )
    :vars
    (
      ?AUTO_3157 - TRUCK
      ?AUTO_3162 - LOCATION
      ?AUTO_3161 - CITY
      ?AUTO_3160 - LOCATION
      ?AUTO_3156 - LOCATION
      ?AUTO_3159 - AIRPLANE
      ?AUTO_3164 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3157 ?AUTO_3162 ) ( IN-CITY ?AUTO_3162 ?AUTO_3161 ) ( IN-CITY ?AUTO_3154 ?AUTO_3161 ) ( not ( = ?AUTO_3154 ?AUTO_3162 ) ) ( TRUCK-AT ?AUTO_3157 ?AUTO_3160 ) ( AIRPORT ?AUTO_3156 ) ( AIRPORT ?AUTO_3160 ) ( AIRPLANE-AT ?AUTO_3159 ?AUTO_3156 ) ( not ( = ?AUTO_3156 ?AUTO_3160 ) ) ( OBJ-AT ?AUTO_3153 ?AUTO_3164 ) ( AIRPLANE-AT ?AUTO_3159 ?AUTO_3164 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3153 ?AUTO_3159 ?AUTO_3164 )
      ( DELIVER-PKG ?AUTO_3153 ?AUTO_3154 )
      ( DELIVER-PKG-VERIFY ?AUTO_3153 ?AUTO_3154 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3166 - OBJ
      ?AUTO_3167 - LOCATION
    )
    :vars
    (
      ?AUTO_3173 - TRUCK
      ?AUTO_3170 - LOCATION
      ?AUTO_3171 - CITY
      ?AUTO_3172 - LOCATION
      ?AUTO_3169 - LOCATION
      ?AUTO_3178 - LOCATION
      ?AUTO_3168 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3173 ?AUTO_3170 ) ( IN-CITY ?AUTO_3170 ?AUTO_3171 ) ( IN-CITY ?AUTO_3167 ?AUTO_3171 ) ( not ( = ?AUTO_3167 ?AUTO_3170 ) ) ( TRUCK-AT ?AUTO_3173 ?AUTO_3172 ) ( AIRPORT ?AUTO_3169 ) ( AIRPORT ?AUTO_3172 ) ( not ( = ?AUTO_3169 ?AUTO_3172 ) ) ( OBJ-AT ?AUTO_3166 ?AUTO_3169 ) ( AIRPORT ?AUTO_3178 ) ( AIRPLANE-AT ?AUTO_3168 ?AUTO_3178 ) ( not ( = ?AUTO_3178 ?AUTO_3169 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3168 ?AUTO_3178 ?AUTO_3169 )
      ( DELIVER-PKG ?AUTO_3166 ?AUTO_3167 )
      ( DELIVER-PKG-VERIFY ?AUTO_3166 ?AUTO_3167 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3204 - OBJ
      ?AUTO_3205 - LOCATION
    )
    :vars
    (
      ?AUTO_3208 - TRUCK
      ?AUTO_3209 - LOCATION
      ?AUTO_3212 - CITY
      ?AUTO_3210 - LOCATION
      ?AUTO_3214 - LOCATION
      ?AUTO_3211 - LOCATION
      ?AUTO_3206 - AIRPLANE
      ?AUTO_3215 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3208 ?AUTO_3209 ) ( IN-CITY ?AUTO_3209 ?AUTO_3212 ) ( IN-CITY ?AUTO_3205 ?AUTO_3212 ) ( not ( = ?AUTO_3205 ?AUTO_3209 ) ) ( TRUCK-AT ?AUTO_3208 ?AUTO_3210 ) ( AIRPORT ?AUTO_3214 ) ( AIRPORT ?AUTO_3210 ) ( not ( = ?AUTO_3214 ?AUTO_3210 ) ) ( AIRPORT ?AUTO_3211 ) ( AIRPLANE-AT ?AUTO_3206 ?AUTO_3211 ) ( not ( = ?AUTO_3211 ?AUTO_3214 ) ) ( TRUCK-AT ?AUTO_3215 ?AUTO_3214 ) ( IN-TRUCK ?AUTO_3204 ?AUTO_3215 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3204 ?AUTO_3215 ?AUTO_3214 )
      ( DELIVER-PKG ?AUTO_3204 ?AUTO_3205 )
      ( DELIVER-PKG-VERIFY ?AUTO_3204 ?AUTO_3205 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3218 - OBJ
      ?AUTO_3219 - LOCATION
    )
    :vars
    (
      ?AUTO_3228 - TRUCK
      ?AUTO_3229 - LOCATION
      ?AUTO_3225 - CITY
      ?AUTO_3223 - LOCATION
      ?AUTO_3224 - LOCATION
      ?AUTO_3227 - LOCATION
      ?AUTO_3226 - AIRPLANE
      ?AUTO_3221 - TRUCK
      ?AUTO_3232 - LOCATION
      ?AUTO_3231 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3228 ?AUTO_3229 ) ( IN-CITY ?AUTO_3229 ?AUTO_3225 ) ( IN-CITY ?AUTO_3219 ?AUTO_3225 ) ( not ( = ?AUTO_3219 ?AUTO_3229 ) ) ( TRUCK-AT ?AUTO_3228 ?AUTO_3223 ) ( AIRPORT ?AUTO_3224 ) ( AIRPORT ?AUTO_3223 ) ( not ( = ?AUTO_3224 ?AUTO_3223 ) ) ( AIRPORT ?AUTO_3227 ) ( AIRPLANE-AT ?AUTO_3226 ?AUTO_3227 ) ( not ( = ?AUTO_3227 ?AUTO_3224 ) ) ( IN-TRUCK ?AUTO_3218 ?AUTO_3221 ) ( TRUCK-AT ?AUTO_3221 ?AUTO_3232 ) ( IN-CITY ?AUTO_3232 ?AUTO_3231 ) ( IN-CITY ?AUTO_3224 ?AUTO_3231 ) ( not ( = ?AUTO_3224 ?AUTO_3232 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3221 ?AUTO_3232 ?AUTO_3224 ?AUTO_3231 )
      ( DELIVER-PKG ?AUTO_3218 ?AUTO_3219 )
      ( DELIVER-PKG-VERIFY ?AUTO_3218 ?AUTO_3219 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3234 - OBJ
      ?AUTO_3235 - LOCATION
    )
    :vars
    (
      ?AUTO_3240 - TRUCK
      ?AUTO_3243 - LOCATION
      ?AUTO_3241 - CITY
      ?AUTO_3244 - LOCATION
      ?AUTO_3246 - LOCATION
      ?AUTO_3237 - LOCATION
      ?AUTO_3242 - AIRPLANE
      ?AUTO_3245 - TRUCK
      ?AUTO_3247 - LOCATION
      ?AUTO_3238 - CITY
      ?AUTO_3249 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3240 ?AUTO_3243 ) ( IN-CITY ?AUTO_3243 ?AUTO_3241 ) ( IN-CITY ?AUTO_3235 ?AUTO_3241 ) ( not ( = ?AUTO_3235 ?AUTO_3243 ) ) ( TRUCK-AT ?AUTO_3240 ?AUTO_3244 ) ( AIRPORT ?AUTO_3246 ) ( AIRPORT ?AUTO_3244 ) ( not ( = ?AUTO_3246 ?AUTO_3244 ) ) ( AIRPORT ?AUTO_3237 ) ( AIRPLANE-AT ?AUTO_3242 ?AUTO_3237 ) ( not ( = ?AUTO_3237 ?AUTO_3246 ) ) ( TRUCK-AT ?AUTO_3245 ?AUTO_3247 ) ( IN-CITY ?AUTO_3247 ?AUTO_3238 ) ( IN-CITY ?AUTO_3246 ?AUTO_3238 ) ( not ( = ?AUTO_3246 ?AUTO_3247 ) ) ( TRUCK-AT ?AUTO_3245 ?AUTO_3249 ) ( OBJ-AT ?AUTO_3234 ?AUTO_3249 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3234 ?AUTO_3245 ?AUTO_3249 )
      ( DELIVER-PKG ?AUTO_3234 ?AUTO_3235 )
      ( DELIVER-PKG-VERIFY ?AUTO_3234 ?AUTO_3235 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3251 - OBJ
      ?AUTO_3252 - LOCATION
    )
    :vars
    (
      ?AUTO_3262 - TRUCK
      ?AUTO_3264 - LOCATION
      ?AUTO_3263 - CITY
      ?AUTO_3259 - LOCATION
      ?AUTO_3260 - LOCATION
      ?AUTO_3261 - LOCATION
      ?AUTO_3254 - AIRPLANE
      ?AUTO_3265 - LOCATION
      ?AUTO_3257 - CITY
      ?AUTO_3253 - TRUCK
      ?AUTO_3268 - LOCATION
      ?AUTO_3267 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3262 ?AUTO_3264 ) ( IN-CITY ?AUTO_3264 ?AUTO_3263 ) ( IN-CITY ?AUTO_3252 ?AUTO_3263 ) ( not ( = ?AUTO_3252 ?AUTO_3264 ) ) ( TRUCK-AT ?AUTO_3262 ?AUTO_3259 ) ( AIRPORT ?AUTO_3260 ) ( AIRPORT ?AUTO_3259 ) ( not ( = ?AUTO_3260 ?AUTO_3259 ) ) ( AIRPORT ?AUTO_3261 ) ( AIRPLANE-AT ?AUTO_3254 ?AUTO_3261 ) ( not ( = ?AUTO_3261 ?AUTO_3260 ) ) ( IN-CITY ?AUTO_3265 ?AUTO_3257 ) ( IN-CITY ?AUTO_3260 ?AUTO_3257 ) ( not ( = ?AUTO_3260 ?AUTO_3265 ) ) ( OBJ-AT ?AUTO_3251 ?AUTO_3265 ) ( TRUCK-AT ?AUTO_3253 ?AUTO_3268 ) ( IN-CITY ?AUTO_3268 ?AUTO_3267 ) ( IN-CITY ?AUTO_3265 ?AUTO_3267 ) ( not ( = ?AUTO_3265 ?AUTO_3268 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3253 ?AUTO_3268 ?AUTO_3265 ?AUTO_3267 )
      ( DELIVER-PKG ?AUTO_3251 ?AUTO_3252 )
      ( DELIVER-PKG-VERIFY ?AUTO_3251 ?AUTO_3252 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3282 - OBJ
      ?AUTO_3283 - LOCATION
    )
    :vars
    (
      ?AUTO_3284 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3282 ?AUTO_3284 ) ( AIRPLANE-AT ?AUTO_3284 ?AUTO_3283 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3282 ?AUTO_3284 ?AUTO_3283 )
      ( DELIVER-PKG-VERIFY ?AUTO_3282 ?AUTO_3283 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3295 - OBJ
      ?AUTO_3296 - LOCATION
    )
    :vars
    (
      ?AUTO_3298 - AIRPLANE
      ?AUTO_3301 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3295 ?AUTO_3298 ) ( AIRPORT ?AUTO_3301 ) ( AIRPORT ?AUTO_3296 ) ( AIRPLANE-AT ?AUTO_3298 ?AUTO_3301 ) ( not ( = ?AUTO_3301 ?AUTO_3296 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3298 ?AUTO_3301 ?AUTO_3296 )
      ( DELIVER-PKG ?AUTO_3295 ?AUTO_3296 )
      ( DELIVER-PKG-VERIFY ?AUTO_3295 ?AUTO_3296 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3323 - OBJ
      ?AUTO_3324 - LOCATION
    )
    :vars
    (
      ?AUTO_3325 - LOCATION
      ?AUTO_3329 - LOCATION
      ?AUTO_3327 - AIRPLANE
      ?AUTO_3330 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3325 ) ( AIRPORT ?AUTO_3324 ) ( not ( = ?AUTO_3325 ?AUTO_3324 ) ) ( AIRPORT ?AUTO_3329 ) ( AIRPLANE-AT ?AUTO_3327 ?AUTO_3329 ) ( not ( = ?AUTO_3329 ?AUTO_3325 ) ) ( TRUCK-AT ?AUTO_3330 ?AUTO_3325 ) ( IN-TRUCK ?AUTO_3323 ?AUTO_3330 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3323 ?AUTO_3330 ?AUTO_3325 )
      ( DELIVER-PKG ?AUTO_3323 ?AUTO_3324 )
      ( DELIVER-PKG-VERIFY ?AUTO_3323 ?AUTO_3324 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3333 - OBJ
      ?AUTO_3334 - LOCATION
    )
    :vars
    (
      ?AUTO_3340 - LOCATION
      ?AUTO_3337 - LOCATION
      ?AUTO_3339 - AIRPLANE
      ?AUTO_3338 - TRUCK
      ?AUTO_3343 - LOCATION
      ?AUTO_3342 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3340 ) ( AIRPORT ?AUTO_3334 ) ( not ( = ?AUTO_3340 ?AUTO_3334 ) ) ( AIRPORT ?AUTO_3337 ) ( AIRPLANE-AT ?AUTO_3339 ?AUTO_3337 ) ( not ( = ?AUTO_3337 ?AUTO_3340 ) ) ( IN-TRUCK ?AUTO_3333 ?AUTO_3338 ) ( TRUCK-AT ?AUTO_3338 ?AUTO_3343 ) ( IN-CITY ?AUTO_3343 ?AUTO_3342 ) ( IN-CITY ?AUTO_3340 ?AUTO_3342 ) ( not ( = ?AUTO_3340 ?AUTO_3343 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3338 ?AUTO_3343 ?AUTO_3340 ?AUTO_3342 )
      ( DELIVER-PKG ?AUTO_3333 ?AUTO_3334 )
      ( DELIVER-PKG-VERIFY ?AUTO_3333 ?AUTO_3334 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3349 - OBJ
      ?AUTO_3350 - LOCATION
    )
    :vars
    (
      ?AUTO_3358 - LOCATION
      ?AUTO_3355 - LOCATION
      ?AUTO_3353 - AIRPLANE
      ?AUTO_3356 - TRUCK
      ?AUTO_3357 - LOCATION
      ?AUTO_3352 - CITY
      ?AUTO_3360 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3358 ) ( AIRPORT ?AUTO_3350 ) ( not ( = ?AUTO_3358 ?AUTO_3350 ) ) ( AIRPORT ?AUTO_3355 ) ( AIRPLANE-AT ?AUTO_3353 ?AUTO_3355 ) ( not ( = ?AUTO_3355 ?AUTO_3358 ) ) ( TRUCK-AT ?AUTO_3356 ?AUTO_3357 ) ( IN-CITY ?AUTO_3357 ?AUTO_3352 ) ( IN-CITY ?AUTO_3358 ?AUTO_3352 ) ( not ( = ?AUTO_3358 ?AUTO_3357 ) ) ( TRUCK-AT ?AUTO_3356 ?AUTO_3360 ) ( OBJ-AT ?AUTO_3349 ?AUTO_3360 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3349 ?AUTO_3356 ?AUTO_3360 )
      ( DELIVER-PKG ?AUTO_3349 ?AUTO_3350 )
      ( DELIVER-PKG-VERIFY ?AUTO_3349 ?AUTO_3350 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3362 - OBJ
      ?AUTO_3363 - LOCATION
    )
    :vars
    (
      ?AUTO_3371 - LOCATION
      ?AUTO_3370 - LOCATION
      ?AUTO_3368 - AIRPLANE
      ?AUTO_3372 - LOCATION
      ?AUTO_3367 - CITY
      ?AUTO_3369 - TRUCK
      ?AUTO_3375 - LOCATION
      ?AUTO_3374 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3371 ) ( AIRPORT ?AUTO_3363 ) ( not ( = ?AUTO_3371 ?AUTO_3363 ) ) ( AIRPORT ?AUTO_3370 ) ( AIRPLANE-AT ?AUTO_3368 ?AUTO_3370 ) ( not ( = ?AUTO_3370 ?AUTO_3371 ) ) ( IN-CITY ?AUTO_3372 ?AUTO_3367 ) ( IN-CITY ?AUTO_3371 ?AUTO_3367 ) ( not ( = ?AUTO_3371 ?AUTO_3372 ) ) ( OBJ-AT ?AUTO_3362 ?AUTO_3372 ) ( TRUCK-AT ?AUTO_3369 ?AUTO_3375 ) ( IN-CITY ?AUTO_3375 ?AUTO_3374 ) ( IN-CITY ?AUTO_3372 ?AUTO_3374 ) ( not ( = ?AUTO_3372 ?AUTO_3375 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3369 ?AUTO_3375 ?AUTO_3372 ?AUTO_3374 )
      ( DELIVER-PKG ?AUTO_3362 ?AUTO_3363 )
      ( DELIVER-PKG-VERIFY ?AUTO_3362 ?AUTO_3363 ) )
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
      ?AUTO_3406 - OBJ
      ?AUTO_3407 - LOCATION
    )
    :vars
    (
      ?AUTO_3409 - TRUCK
      ?AUTO_3413 - LOCATION
      ?AUTO_3412 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3406 ?AUTO_3409 ) ( TRUCK-AT ?AUTO_3409 ?AUTO_3413 ) ( IN-CITY ?AUTO_3413 ?AUTO_3412 ) ( IN-CITY ?AUTO_3407 ?AUTO_3412 ) ( not ( = ?AUTO_3407 ?AUTO_3413 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3409 ?AUTO_3413 ?AUTO_3407 ?AUTO_3412 )
      ( DELIVER-PKG ?AUTO_3406 ?AUTO_3407 )
      ( DELIVER-PKG-VERIFY ?AUTO_3406 ?AUTO_3407 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3475 - OBJ
      ?AUTO_3476 - LOCATION
    )
    :vars
    (
      ?AUTO_3477 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3477 ?AUTO_3476 ) ( IN-TRUCK ?AUTO_3475 ?AUTO_3477 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3475 ?AUTO_3477 ?AUTO_3476 )
      ( DELIVER-PKG-VERIFY ?AUTO_3475 ?AUTO_3476 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3548 - OBJ
      ?AUTO_3549 - LOCATION
    )
    :vars
    (
      ?AUTO_3550 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3548 ?AUTO_3550 ) ( AIRPLANE-AT ?AUTO_3550 ?AUTO_3549 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3548 ?AUTO_3550 ?AUTO_3549 )
      ( DELIVER-PKG-VERIFY ?AUTO_3548 ?AUTO_3549 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3561 - OBJ
      ?AUTO_3562 - LOCATION
    )
    :vars
    (
      ?AUTO_3564 - AIRPLANE
      ?AUTO_3567 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3561 ?AUTO_3564 ) ( AIRPORT ?AUTO_3567 ) ( AIRPORT ?AUTO_3562 ) ( AIRPLANE-AT ?AUTO_3564 ?AUTO_3567 ) ( not ( = ?AUTO_3567 ?AUTO_3562 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3564 ?AUTO_3567 ?AUTO_3562 )
      ( DELIVER-PKG ?AUTO_3561 ?AUTO_3562 )
      ( DELIVER-PKG-VERIFY ?AUTO_3561 ?AUTO_3562 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3633 - OBJ
      ?AUTO_3634 - LOCATION
    )
    :vars
    (
      ?AUTO_3635 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3633 ?AUTO_3635 ) ( AIRPLANE-AT ?AUTO_3635 ?AUTO_3634 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3633 ?AUTO_3635 ?AUTO_3634 )
      ( DELIVER-PKG-VERIFY ?AUTO_3633 ?AUTO_3634 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3638 - OBJ
      ?AUTO_3639 - LOCATION
    )
    :vars
    (
      ?AUTO_3642 - AIRPLANE
      ?AUTO_3644 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3638 ?AUTO_3642 ) ( AIRPORT ?AUTO_3644 ) ( AIRPORT ?AUTO_3639 ) ( AIRPLANE-AT ?AUTO_3642 ?AUTO_3644 ) ( not ( = ?AUTO_3644 ?AUTO_3639 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3642 ?AUTO_3644 ?AUTO_3639 )
      ( DELIVER-PKG ?AUTO_3638 ?AUTO_3639 )
      ( DELIVER-PKG-VERIFY ?AUTO_3638 ?AUTO_3639 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3688 - OBJ
      ?AUTO_3689 - LOCATION
    )
    :vars
    (
      ?AUTO_3695 - TRUCK
      ?AUTO_3691 - LOCATION
      ?AUTO_3697 - CITY
      ?AUTO_3692 - LOCATION
      ?AUTO_3698 - LOCATION
      ?AUTO_3693 - LOCATION
      ?AUTO_3696 - AIRPLANE
      ?AUTO_3699 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3695 ?AUTO_3691 ) ( IN-CITY ?AUTO_3691 ?AUTO_3697 ) ( IN-CITY ?AUTO_3689 ?AUTO_3697 ) ( not ( = ?AUTO_3689 ?AUTO_3691 ) ) ( TRUCK-AT ?AUTO_3695 ?AUTO_3692 ) ( AIRPORT ?AUTO_3698 ) ( AIRPORT ?AUTO_3692 ) ( not ( = ?AUTO_3698 ?AUTO_3692 ) ) ( AIRPORT ?AUTO_3693 ) ( AIRPLANE-AT ?AUTO_3696 ?AUTO_3693 ) ( not ( = ?AUTO_3693 ?AUTO_3698 ) ) ( TRUCK-AT ?AUTO_3699 ?AUTO_3698 ) ( IN-TRUCK ?AUTO_3688 ?AUTO_3699 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3688 ?AUTO_3699 ?AUTO_3698 )
      ( DELIVER-PKG ?AUTO_3688 ?AUTO_3689 )
      ( DELIVER-PKG-VERIFY ?AUTO_3688 ?AUTO_3689 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3708 - OBJ
      ?AUTO_3709 - LOCATION
    )
    :vars
    (
      ?AUTO_3713 - LOCATION
      ?AUTO_3717 - LOCATION
      ?AUTO_3710 - AIRPLANE
      ?AUTO_3715 - TRUCK
      ?AUTO_3716 - LOCATION
      ?AUTO_3711 - CITY
      ?AUTO_3719 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3713 ) ( AIRPORT ?AUTO_3709 ) ( not ( = ?AUTO_3713 ?AUTO_3709 ) ) ( AIRPORT ?AUTO_3717 ) ( AIRPLANE-AT ?AUTO_3710 ?AUTO_3717 ) ( not ( = ?AUTO_3717 ?AUTO_3713 ) ) ( TRUCK-AT ?AUTO_3715 ?AUTO_3716 ) ( IN-CITY ?AUTO_3716 ?AUTO_3711 ) ( IN-CITY ?AUTO_3713 ?AUTO_3711 ) ( not ( = ?AUTO_3713 ?AUTO_3716 ) ) ( TRUCK-AT ?AUTO_3715 ?AUTO_3719 ) ( OBJ-AT ?AUTO_3708 ?AUTO_3719 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3708 ?AUTO_3715 ?AUTO_3719 )
      ( DELIVER-PKG ?AUTO_3708 ?AUTO_3709 )
      ( DELIVER-PKG-VERIFY ?AUTO_3708 ?AUTO_3709 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3745 - OBJ
      ?AUTO_3746 - LOCATION
    )
    :vars
    (
      ?AUTO_3747 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3747 ?AUTO_3746 ) ( IN-TRUCK ?AUTO_3745 ?AUTO_3747 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3745 ?AUTO_3747 ?AUTO_3746 )
      ( DELIVER-PKG-VERIFY ?AUTO_3745 ?AUTO_3746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3758 - OBJ
      ?AUTO_3759 - LOCATION
    )
    :vars
    (
      ?AUTO_3760 - TRUCK
      ?AUTO_3765 - LOCATION
      ?AUTO_3764 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3758 ?AUTO_3760 ) ( TRUCK-AT ?AUTO_3760 ?AUTO_3765 ) ( IN-CITY ?AUTO_3765 ?AUTO_3764 ) ( IN-CITY ?AUTO_3759 ?AUTO_3764 ) ( not ( = ?AUTO_3759 ?AUTO_3765 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3760 ?AUTO_3765 ?AUTO_3759 ?AUTO_3764 )
      ( DELIVER-PKG ?AUTO_3758 ?AUTO_3759 )
      ( DELIVER-PKG-VERIFY ?AUTO_3758 ?AUTO_3759 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3767 - OBJ
      ?AUTO_3768 - LOCATION
    )
    :vars
    (
      ?AUTO_3771 - TRUCK
      ?AUTO_3773 - LOCATION
      ?AUTO_3772 - CITY
      ?AUTO_3775 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3771 ?AUTO_3773 ) ( IN-CITY ?AUTO_3773 ?AUTO_3772 ) ( IN-CITY ?AUTO_3768 ?AUTO_3772 ) ( not ( = ?AUTO_3768 ?AUTO_3773 ) ) ( TRUCK-AT ?AUTO_3771 ?AUTO_3775 ) ( OBJ-AT ?AUTO_3767 ?AUTO_3775 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3767 ?AUTO_3771 ?AUTO_3775 )
      ( DELIVER-PKG ?AUTO_3767 ?AUTO_3768 )
      ( DELIVER-PKG-VERIFY ?AUTO_3767 ?AUTO_3768 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3783 - OBJ
      ?AUTO_3784 - LOCATION
    )
    :vars
    (
      ?AUTO_3787 - TRUCK
      ?AUTO_3790 - LOCATION
      ?AUTO_3788 - CITY
      ?AUTO_3789 - LOCATION
      ?AUTO_3791 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3787 ?AUTO_3790 ) ( IN-CITY ?AUTO_3790 ?AUTO_3788 ) ( IN-CITY ?AUTO_3784 ?AUTO_3788 ) ( not ( = ?AUTO_3784 ?AUTO_3790 ) ) ( TRUCK-AT ?AUTO_3787 ?AUTO_3789 ) ( IN-AIRPLANE ?AUTO_3783 ?AUTO_3791 ) ( AIRPLANE-AT ?AUTO_3791 ?AUTO_3789 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3783 ?AUTO_3791 ?AUTO_3789 )
      ( DELIVER-PKG ?AUTO_3783 ?AUTO_3784 )
      ( DELIVER-PKG-VERIFY ?AUTO_3783 ?AUTO_3784 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3802 - OBJ
      ?AUTO_3803 - LOCATION
    )
    :vars
    (
      ?AUTO_3808 - TRUCK
      ?AUTO_3805 - LOCATION
      ?AUTO_3810 - CITY
      ?AUTO_3809 - LOCATION
      ?AUTO_3807 - AIRPLANE
      ?AUTO_3812 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3808 ?AUTO_3805 ) ( IN-CITY ?AUTO_3805 ?AUTO_3810 ) ( IN-CITY ?AUTO_3803 ?AUTO_3810 ) ( not ( = ?AUTO_3803 ?AUTO_3805 ) ) ( TRUCK-AT ?AUTO_3808 ?AUTO_3809 ) ( IN-AIRPLANE ?AUTO_3802 ?AUTO_3807 ) ( AIRPORT ?AUTO_3812 ) ( AIRPORT ?AUTO_3809 ) ( AIRPLANE-AT ?AUTO_3807 ?AUTO_3812 ) ( not ( = ?AUTO_3812 ?AUTO_3809 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3807 ?AUTO_3812 ?AUTO_3809 )
      ( DELIVER-PKG ?AUTO_3802 ?AUTO_3803 )
      ( DELIVER-PKG-VERIFY ?AUTO_3802 ?AUTO_3803 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3836 - OBJ
      ?AUTO_3837 - LOCATION
    )
    :vars
    (
      ?AUTO_3845 - TRUCK
      ?AUTO_3838 - LOCATION
      ?AUTO_3841 - CITY
      ?AUTO_3839 - LOCATION
      ?AUTO_3846 - LOCATION
      ?AUTO_3844 - LOCATION
      ?AUTO_3847 - AIRPLANE
      ?AUTO_3843 - TRUCK
      ?AUTO_3850 - LOCATION
      ?AUTO_3849 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3845 ?AUTO_3838 ) ( IN-CITY ?AUTO_3838 ?AUTO_3841 ) ( IN-CITY ?AUTO_3837 ?AUTO_3841 ) ( not ( = ?AUTO_3837 ?AUTO_3838 ) ) ( TRUCK-AT ?AUTO_3845 ?AUTO_3839 ) ( AIRPORT ?AUTO_3846 ) ( AIRPORT ?AUTO_3839 ) ( not ( = ?AUTO_3846 ?AUTO_3839 ) ) ( AIRPORT ?AUTO_3844 ) ( AIRPLANE-AT ?AUTO_3847 ?AUTO_3844 ) ( not ( = ?AUTO_3844 ?AUTO_3846 ) ) ( IN-TRUCK ?AUTO_3836 ?AUTO_3843 ) ( TRUCK-AT ?AUTO_3843 ?AUTO_3850 ) ( IN-CITY ?AUTO_3850 ?AUTO_3849 ) ( IN-CITY ?AUTO_3846 ?AUTO_3849 ) ( not ( = ?AUTO_3846 ?AUTO_3850 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3843 ?AUTO_3850 ?AUTO_3846 ?AUTO_3849 )
      ( DELIVER-PKG ?AUTO_3836 ?AUTO_3837 )
      ( DELIVER-PKG-VERIFY ?AUTO_3836 ?AUTO_3837 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3856 - OBJ
      ?AUTO_3857 - LOCATION
    )
    :vars
    (
      ?AUTO_3865 - TRUCK
      ?AUTO_3862 - LOCATION
      ?AUTO_3869 - CITY
      ?AUTO_3867 - LOCATION
      ?AUTO_3863 - LOCATION
      ?AUTO_3861 - LOCATION
      ?AUTO_3858 - AIRPLANE
      ?AUTO_3859 - TRUCK
      ?AUTO_3864 - LOCATION
      ?AUTO_3868 - CITY
      ?AUTO_3871 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3865 ?AUTO_3862 ) ( IN-CITY ?AUTO_3862 ?AUTO_3869 ) ( IN-CITY ?AUTO_3857 ?AUTO_3869 ) ( not ( = ?AUTO_3857 ?AUTO_3862 ) ) ( TRUCK-AT ?AUTO_3865 ?AUTO_3867 ) ( AIRPORT ?AUTO_3863 ) ( AIRPORT ?AUTO_3867 ) ( not ( = ?AUTO_3863 ?AUTO_3867 ) ) ( AIRPORT ?AUTO_3861 ) ( AIRPLANE-AT ?AUTO_3858 ?AUTO_3861 ) ( not ( = ?AUTO_3861 ?AUTO_3863 ) ) ( TRUCK-AT ?AUTO_3859 ?AUTO_3864 ) ( IN-CITY ?AUTO_3864 ?AUTO_3868 ) ( IN-CITY ?AUTO_3863 ?AUTO_3868 ) ( not ( = ?AUTO_3863 ?AUTO_3864 ) ) ( TRUCK-AT ?AUTO_3859 ?AUTO_3871 ) ( OBJ-AT ?AUTO_3856 ?AUTO_3871 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3856 ?AUTO_3859 ?AUTO_3871 )
      ( DELIVER-PKG ?AUTO_3856 ?AUTO_3857 )
      ( DELIVER-PKG-VERIFY ?AUTO_3856 ?AUTO_3857 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3873 - OBJ
      ?AUTO_3874 - LOCATION
    )
    :vars
    (
      ?AUTO_3879 - TRUCK
      ?AUTO_3885 - LOCATION
      ?AUTO_3886 - CITY
      ?AUTO_3887 - LOCATION
      ?AUTO_3880 - LOCATION
      ?AUTO_3883 - LOCATION
      ?AUTO_3884 - AIRPLANE
      ?AUTO_3875 - LOCATION
      ?AUTO_3878 - CITY
      ?AUTO_3882 - TRUCK
      ?AUTO_3890 - LOCATION
      ?AUTO_3889 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3879 ?AUTO_3885 ) ( IN-CITY ?AUTO_3885 ?AUTO_3886 ) ( IN-CITY ?AUTO_3874 ?AUTO_3886 ) ( not ( = ?AUTO_3874 ?AUTO_3885 ) ) ( TRUCK-AT ?AUTO_3879 ?AUTO_3887 ) ( AIRPORT ?AUTO_3880 ) ( AIRPORT ?AUTO_3887 ) ( not ( = ?AUTO_3880 ?AUTO_3887 ) ) ( AIRPORT ?AUTO_3883 ) ( AIRPLANE-AT ?AUTO_3884 ?AUTO_3883 ) ( not ( = ?AUTO_3883 ?AUTO_3880 ) ) ( IN-CITY ?AUTO_3875 ?AUTO_3878 ) ( IN-CITY ?AUTO_3880 ?AUTO_3878 ) ( not ( = ?AUTO_3880 ?AUTO_3875 ) ) ( OBJ-AT ?AUTO_3873 ?AUTO_3875 ) ( TRUCK-AT ?AUTO_3882 ?AUTO_3890 ) ( IN-CITY ?AUTO_3890 ?AUTO_3889 ) ( IN-CITY ?AUTO_3875 ?AUTO_3889 ) ( not ( = ?AUTO_3875 ?AUTO_3890 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3882 ?AUTO_3890 ?AUTO_3875 ?AUTO_3889 )
      ( DELIVER-PKG ?AUTO_3873 ?AUTO_3874 )
      ( DELIVER-PKG-VERIFY ?AUTO_3873 ?AUTO_3874 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3894 - OBJ
      ?AUTO_3895 - LOCATION
    )
    :vars
    (
      ?AUTO_3909 - LOCATION
      ?AUTO_3900 - CITY
      ?AUTO_3899 - LOCATION
      ?AUTO_3904 - LOCATION
      ?AUTO_3908 - AIRPLANE
      ?AUTO_3907 - LOCATION
      ?AUTO_3903 - CITY
      ?AUTO_3901 - TRUCK
      ?AUTO_3897 - LOCATION
      ?AUTO_3905 - CITY
      ?AUTO_3902 - TRUCK
      ?AUTO_3912 - LOCATION
      ?AUTO_3911 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3909 ?AUTO_3900 ) ( IN-CITY ?AUTO_3895 ?AUTO_3900 ) ( not ( = ?AUTO_3895 ?AUTO_3909 ) ) ( AIRPORT ?AUTO_3899 ) ( AIRPORT ?AUTO_3909 ) ( not ( = ?AUTO_3899 ?AUTO_3909 ) ) ( AIRPORT ?AUTO_3904 ) ( AIRPLANE-AT ?AUTO_3908 ?AUTO_3904 ) ( not ( = ?AUTO_3904 ?AUTO_3899 ) ) ( IN-CITY ?AUTO_3907 ?AUTO_3903 ) ( IN-CITY ?AUTO_3899 ?AUTO_3903 ) ( not ( = ?AUTO_3899 ?AUTO_3907 ) ) ( OBJ-AT ?AUTO_3894 ?AUTO_3907 ) ( TRUCK-AT ?AUTO_3901 ?AUTO_3897 ) ( IN-CITY ?AUTO_3897 ?AUTO_3905 ) ( IN-CITY ?AUTO_3907 ?AUTO_3905 ) ( not ( = ?AUTO_3907 ?AUTO_3897 ) ) ( TRUCK-AT ?AUTO_3902 ?AUTO_3912 ) ( IN-CITY ?AUTO_3912 ?AUTO_3911 ) ( IN-CITY ?AUTO_3909 ?AUTO_3911 ) ( not ( = ?AUTO_3909 ?AUTO_3912 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3902 ?AUTO_3912 ?AUTO_3909 ?AUTO_3911 )
      ( DELIVER-PKG ?AUTO_3894 ?AUTO_3895 )
      ( DELIVER-PKG-VERIFY ?AUTO_3894 ?AUTO_3895 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3930 - OBJ
      ?AUTO_3931 - LOCATION
    )
    :vars
    (
      ?AUTO_3932 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3930 ?AUTO_3932 ) ( AIRPLANE-AT ?AUTO_3932 ?AUTO_3931 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3930 ?AUTO_3932 ?AUTO_3931 )
      ( DELIVER-PKG-VERIFY ?AUTO_3930 ?AUTO_3931 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3937 - OBJ
      ?AUTO_3938 - LOCATION
    )
    :vars
    (
      ?AUTO_3940 - AIRPLANE
      ?AUTO_3943 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3937 ?AUTO_3940 ) ( AIRPORT ?AUTO_3943 ) ( AIRPORT ?AUTO_3938 ) ( AIRPLANE-AT ?AUTO_3940 ?AUTO_3943 ) ( not ( = ?AUTO_3943 ?AUTO_3938 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3940 ?AUTO_3943 ?AUTO_3938 )
      ( DELIVER-PKG ?AUTO_3937 ?AUTO_3938 )
      ( DELIVER-PKG-VERIFY ?AUTO_3937 ?AUTO_3938 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3989 - OBJ
      ?AUTO_3990 - LOCATION
    )
    :vars
    (
      ?AUTO_3994 - LOCATION
      ?AUTO_3992 - LOCATION
      ?AUTO_3995 - AIRPLANE
      ?AUTO_3996 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3994 ) ( AIRPORT ?AUTO_3990 ) ( not ( = ?AUTO_3994 ?AUTO_3990 ) ) ( AIRPORT ?AUTO_3992 ) ( AIRPLANE-AT ?AUTO_3995 ?AUTO_3992 ) ( not ( = ?AUTO_3992 ?AUTO_3994 ) ) ( TRUCK-AT ?AUTO_3996 ?AUTO_3994 ) ( IN-TRUCK ?AUTO_3989 ?AUTO_3996 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3989 ?AUTO_3996 ?AUTO_3994 )
      ( DELIVER-PKG ?AUTO_3989 ?AUTO_3990 )
      ( DELIVER-PKG-VERIFY ?AUTO_3989 ?AUTO_3990 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4005 - OBJ
      ?AUTO_4006 - LOCATION
    )
    :vars
    (
      ?AUTO_4014 - LOCATION
      ?AUTO_4009 - LOCATION
      ?AUTO_4010 - AIRPLANE
      ?AUTO_4013 - TRUCK
      ?AUTO_4011 - LOCATION
      ?AUTO_4008 - CITY
      ?AUTO_4016 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4014 ) ( AIRPORT ?AUTO_4006 ) ( not ( = ?AUTO_4014 ?AUTO_4006 ) ) ( AIRPORT ?AUTO_4009 ) ( AIRPLANE-AT ?AUTO_4010 ?AUTO_4009 ) ( not ( = ?AUTO_4009 ?AUTO_4014 ) ) ( TRUCK-AT ?AUTO_4013 ?AUTO_4011 ) ( IN-CITY ?AUTO_4011 ?AUTO_4008 ) ( IN-CITY ?AUTO_4014 ?AUTO_4008 ) ( not ( = ?AUTO_4014 ?AUTO_4011 ) ) ( TRUCK-AT ?AUTO_4013 ?AUTO_4016 ) ( OBJ-AT ?AUTO_4005 ?AUTO_4016 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4005 ?AUTO_4013 ?AUTO_4016 )
      ( DELIVER-PKG ?AUTO_4005 ?AUTO_4006 )
      ( DELIVER-PKG-VERIFY ?AUTO_4005 ?AUTO_4006 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4044 - OBJ
      ?AUTO_4045 - LOCATION
    )
    :vars
    (
      ?AUTO_4046 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4044 ?AUTO_4046 ) ( AIRPLANE-AT ?AUTO_4046 ?AUTO_4045 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4044 ?AUTO_4046 ?AUTO_4045 )
      ( DELIVER-PKG-VERIFY ?AUTO_4044 ?AUTO_4045 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4049 - OBJ
      ?AUTO_4050 - LOCATION
    )
    :vars
    (
      ?AUTO_4052 - AIRPLANE
      ?AUTO_4055 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4049 ?AUTO_4052 ) ( AIRPORT ?AUTO_4055 ) ( AIRPORT ?AUTO_4050 ) ( AIRPLANE-AT ?AUTO_4052 ?AUTO_4055 ) ( not ( = ?AUTO_4055 ?AUTO_4050 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4052 ?AUTO_4055 ?AUTO_4050 )
      ( DELIVER-PKG ?AUTO_4049 ?AUTO_4050 )
      ( DELIVER-PKG-VERIFY ?AUTO_4049 ?AUTO_4050 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4059 - OBJ
      ?AUTO_4060 - LOCATION
    )
    :vars
    (
      ?AUTO_4064 - LOCATION
      ?AUTO_4061 - AIRPLANE
      ?AUTO_4066 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4064 ) ( AIRPORT ?AUTO_4060 ) ( AIRPLANE-AT ?AUTO_4061 ?AUTO_4064 ) ( not ( = ?AUTO_4064 ?AUTO_4060 ) ) ( OBJ-AT ?AUTO_4059 ?AUTO_4066 ) ( AIRPLANE-AT ?AUTO_4061 ?AUTO_4066 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4059 ?AUTO_4061 ?AUTO_4066 )
      ( DELIVER-PKG ?AUTO_4059 ?AUTO_4060 )
      ( DELIVER-PKG-VERIFY ?AUTO_4059 ?AUTO_4060 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4068 - OBJ
      ?AUTO_4069 - LOCATION
    )
    :vars
    (
      ?AUTO_4074 - LOCATION
      ?AUTO_4076 - LOCATION
      ?AUTO_4072 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4074 ) ( AIRPORT ?AUTO_4069 ) ( not ( = ?AUTO_4074 ?AUTO_4069 ) ) ( OBJ-AT ?AUTO_4068 ?AUTO_4074 ) ( AIRPORT ?AUTO_4076 ) ( AIRPLANE-AT ?AUTO_4072 ?AUTO_4076 ) ( not ( = ?AUTO_4076 ?AUTO_4074 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4072 ?AUTO_4076 ?AUTO_4074 )
      ( DELIVER-PKG ?AUTO_4068 ?AUTO_4069 )
      ( DELIVER-PKG-VERIFY ?AUTO_4068 ?AUTO_4069 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4096 - OBJ
      ?AUTO_4097 - LOCATION
    )
    :vars
    (
      ?AUTO_4102 - LOCATION
      ?AUTO_4100 - LOCATION
      ?AUTO_4098 - AIRPLANE
      ?AUTO_4103 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4102 ) ( AIRPORT ?AUTO_4097 ) ( not ( = ?AUTO_4102 ?AUTO_4097 ) ) ( AIRPORT ?AUTO_4100 ) ( AIRPLANE-AT ?AUTO_4098 ?AUTO_4100 ) ( not ( = ?AUTO_4100 ?AUTO_4102 ) ) ( TRUCK-AT ?AUTO_4103 ?AUTO_4102 ) ( IN-TRUCK ?AUTO_4096 ?AUTO_4103 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4096 ?AUTO_4103 ?AUTO_4102 )
      ( DELIVER-PKG ?AUTO_4096 ?AUTO_4097 )
      ( DELIVER-PKG-VERIFY ?AUTO_4096 ?AUTO_4097 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4110 - OBJ
      ?AUTO_4111 - LOCATION
    )
    :vars
    (
      ?AUTO_4114 - LOCATION
      ?AUTO_4115 - LOCATION
      ?AUTO_4117 - AIRPLANE
      ?AUTO_4112 - TRUCK
      ?AUTO_4120 - LOCATION
      ?AUTO_4119 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4114 ) ( AIRPORT ?AUTO_4111 ) ( not ( = ?AUTO_4114 ?AUTO_4111 ) ) ( AIRPORT ?AUTO_4115 ) ( AIRPLANE-AT ?AUTO_4117 ?AUTO_4115 ) ( not ( = ?AUTO_4115 ?AUTO_4114 ) ) ( IN-TRUCK ?AUTO_4110 ?AUTO_4112 ) ( TRUCK-AT ?AUTO_4112 ?AUTO_4120 ) ( IN-CITY ?AUTO_4120 ?AUTO_4119 ) ( IN-CITY ?AUTO_4114 ?AUTO_4119 ) ( not ( = ?AUTO_4114 ?AUTO_4120 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4112 ?AUTO_4120 ?AUTO_4114 ?AUTO_4119 )
      ( DELIVER-PKG ?AUTO_4110 ?AUTO_4111 )
      ( DELIVER-PKG-VERIFY ?AUTO_4110 ?AUTO_4111 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4182 - OBJ
      ?AUTO_4183 - LOCATION
    )
    :vars
    (
      ?AUTO_4184 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4182 ?AUTO_4184 ) ( AIRPLANE-AT ?AUTO_4184 ?AUTO_4183 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4182 ?AUTO_4184 ?AUTO_4183 )
      ( DELIVER-PKG-VERIFY ?AUTO_4182 ?AUTO_4183 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4191 - OBJ
      ?AUTO_4192 - LOCATION
    )
    :vars
    (
      ?AUTO_4193 - LOCATION
      ?AUTO_4196 - AIRPLANE
      ?AUTO_4198 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4193 ) ( AIRPORT ?AUTO_4192 ) ( AIRPLANE-AT ?AUTO_4196 ?AUTO_4193 ) ( not ( = ?AUTO_4193 ?AUTO_4192 ) ) ( OBJ-AT ?AUTO_4191 ?AUTO_4198 ) ( AIRPLANE-AT ?AUTO_4196 ?AUTO_4198 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4191 ?AUTO_4196 ?AUTO_4198 )
      ( DELIVER-PKG ?AUTO_4191 ?AUTO_4192 )
      ( DELIVER-PKG-VERIFY ?AUTO_4191 ?AUTO_4192 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4220 - OBJ
      ?AUTO_4221 - LOCATION
    )
    :vars
    (
      ?AUTO_4226 - LOCATION
      ?AUTO_4223 - LOCATION
      ?AUTO_4225 - AIRPLANE
      ?AUTO_4227 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4226 ) ( AIRPORT ?AUTO_4221 ) ( not ( = ?AUTO_4226 ?AUTO_4221 ) ) ( AIRPORT ?AUTO_4223 ) ( AIRPLANE-AT ?AUTO_4225 ?AUTO_4223 ) ( not ( = ?AUTO_4223 ?AUTO_4226 ) ) ( TRUCK-AT ?AUTO_4227 ?AUTO_4226 ) ( IN-TRUCK ?AUTO_4220 ?AUTO_4227 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4220 ?AUTO_4227 ?AUTO_4226 )
      ( DELIVER-PKG ?AUTO_4220 ?AUTO_4221 )
      ( DELIVER-PKG-VERIFY ?AUTO_4220 ?AUTO_4221 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4298 - OBJ
      ?AUTO_4299 - LOCATION
    )
    :vars
    (
      ?AUTO_4300 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4300 ?AUTO_4299 ) ( IN-TRUCK ?AUTO_4298 ?AUTO_4300 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4298 ?AUTO_4300 ?AUTO_4299 )
      ( DELIVER-PKG-VERIFY ?AUTO_4298 ?AUTO_4299 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4307 - OBJ
      ?AUTO_4308 - LOCATION
    )
    :vars
    (
      ?AUTO_4311 - TRUCK
      ?AUTO_4314 - LOCATION
      ?AUTO_4313 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4307 ?AUTO_4311 ) ( TRUCK-AT ?AUTO_4311 ?AUTO_4314 ) ( IN-CITY ?AUTO_4314 ?AUTO_4313 ) ( IN-CITY ?AUTO_4308 ?AUTO_4313 ) ( not ( = ?AUTO_4308 ?AUTO_4314 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4311 ?AUTO_4314 ?AUTO_4308 ?AUTO_4313 )
      ( DELIVER-PKG ?AUTO_4307 ?AUTO_4308 )
      ( DELIVER-PKG-VERIFY ?AUTO_4307 ?AUTO_4308 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4316 - OBJ
      ?AUTO_4317 - LOCATION
    )
    :vars
    (
      ?AUTO_4320 - TRUCK
      ?AUTO_4322 - LOCATION
      ?AUTO_4321 - CITY
      ?AUTO_4324 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4320 ?AUTO_4322 ) ( IN-CITY ?AUTO_4322 ?AUTO_4321 ) ( IN-CITY ?AUTO_4317 ?AUTO_4321 ) ( not ( = ?AUTO_4317 ?AUTO_4322 ) ) ( TRUCK-AT ?AUTO_4320 ?AUTO_4324 ) ( OBJ-AT ?AUTO_4316 ?AUTO_4324 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4316 ?AUTO_4320 ?AUTO_4324 )
      ( DELIVER-PKG ?AUTO_4316 ?AUTO_4317 )
      ( DELIVER-PKG-VERIFY ?AUTO_4316 ?AUTO_4317 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4328 - OBJ
      ?AUTO_4329 - LOCATION
    )
    :vars
    (
      ?AUTO_4332 - TRUCK
      ?AUTO_4334 - LOCATION
      ?AUTO_4333 - CITY
      ?AUTO_4335 - LOCATION
      ?AUTO_4336 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4332 ?AUTO_4334 ) ( IN-CITY ?AUTO_4334 ?AUTO_4333 ) ( IN-CITY ?AUTO_4329 ?AUTO_4333 ) ( not ( = ?AUTO_4329 ?AUTO_4334 ) ) ( TRUCK-AT ?AUTO_4332 ?AUTO_4335 ) ( IN-AIRPLANE ?AUTO_4328 ?AUTO_4336 ) ( AIRPLANE-AT ?AUTO_4336 ?AUTO_4335 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4328 ?AUTO_4336 ?AUTO_4335 )
      ( DELIVER-PKG ?AUTO_4328 ?AUTO_4329 )
      ( DELIVER-PKG-VERIFY ?AUTO_4328 ?AUTO_4329 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4339 - OBJ
      ?AUTO_4340 - LOCATION
    )
    :vars
    (
      ?AUTO_4346 - TRUCK
      ?AUTO_4344 - LOCATION
      ?AUTO_4345 - CITY
      ?AUTO_4343 - LOCATION
      ?AUTO_4347 - AIRPLANE
      ?AUTO_4349 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4346 ?AUTO_4344 ) ( IN-CITY ?AUTO_4344 ?AUTO_4345 ) ( IN-CITY ?AUTO_4340 ?AUTO_4345 ) ( not ( = ?AUTO_4340 ?AUTO_4344 ) ) ( TRUCK-AT ?AUTO_4346 ?AUTO_4343 ) ( IN-AIRPLANE ?AUTO_4339 ?AUTO_4347 ) ( AIRPORT ?AUTO_4349 ) ( AIRPORT ?AUTO_4343 ) ( AIRPLANE-AT ?AUTO_4347 ?AUTO_4349 ) ( not ( = ?AUTO_4349 ?AUTO_4343 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4347 ?AUTO_4349 ?AUTO_4343 )
      ( DELIVER-PKG ?AUTO_4339 ?AUTO_4340 )
      ( DELIVER-PKG-VERIFY ?AUTO_4339 ?AUTO_4340 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4353 - OBJ
      ?AUTO_4354 - LOCATION
    )
    :vars
    (
      ?AUTO_4358 - TRUCK
      ?AUTO_4356 - LOCATION
      ?AUTO_4361 - CITY
      ?AUTO_4359 - LOCATION
      ?AUTO_4357 - LOCATION
      ?AUTO_4360 - AIRPLANE
      ?AUTO_4364 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4358 ?AUTO_4356 ) ( IN-CITY ?AUTO_4356 ?AUTO_4361 ) ( IN-CITY ?AUTO_4354 ?AUTO_4361 ) ( not ( = ?AUTO_4354 ?AUTO_4356 ) ) ( TRUCK-AT ?AUTO_4358 ?AUTO_4359 ) ( AIRPORT ?AUTO_4357 ) ( AIRPORT ?AUTO_4359 ) ( AIRPLANE-AT ?AUTO_4360 ?AUTO_4357 ) ( not ( = ?AUTO_4357 ?AUTO_4359 ) ) ( OBJ-AT ?AUTO_4353 ?AUTO_4364 ) ( AIRPLANE-AT ?AUTO_4360 ?AUTO_4364 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4353 ?AUTO_4360 ?AUTO_4364 )
      ( DELIVER-PKG ?AUTO_4353 ?AUTO_4354 )
      ( DELIVER-PKG-VERIFY ?AUTO_4353 ?AUTO_4354 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4366 - OBJ
      ?AUTO_4367 - LOCATION
    )
    :vars
    (
      ?AUTO_4375 - TRUCK
      ?AUTO_4373 - LOCATION
      ?AUTO_4374 - CITY
      ?AUTO_4372 - LOCATION
      ?AUTO_4376 - LOCATION
      ?AUTO_4378 - LOCATION
      ?AUTO_4370 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4375 ?AUTO_4373 ) ( IN-CITY ?AUTO_4373 ?AUTO_4374 ) ( IN-CITY ?AUTO_4367 ?AUTO_4374 ) ( not ( = ?AUTO_4367 ?AUTO_4373 ) ) ( TRUCK-AT ?AUTO_4375 ?AUTO_4372 ) ( AIRPORT ?AUTO_4376 ) ( AIRPORT ?AUTO_4372 ) ( not ( = ?AUTO_4376 ?AUTO_4372 ) ) ( OBJ-AT ?AUTO_4366 ?AUTO_4376 ) ( AIRPORT ?AUTO_4378 ) ( AIRPLANE-AT ?AUTO_4370 ?AUTO_4378 ) ( not ( = ?AUTO_4378 ?AUTO_4376 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4370 ?AUTO_4378 ?AUTO_4376 )
      ( DELIVER-PKG ?AUTO_4366 ?AUTO_4367 )
      ( DELIVER-PKG-VERIFY ?AUTO_4366 ?AUTO_4367 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4398 - OBJ
      ?AUTO_4399 - LOCATION
    )
    :vars
    (
      ?AUTO_4402 - TRUCK
      ?AUTO_4406 - LOCATION
      ?AUTO_4405 - CITY
      ?AUTO_4400 - LOCATION
      ?AUTO_4401 - LOCATION
      ?AUTO_4407 - LOCATION
      ?AUTO_4408 - AIRPLANE
      ?AUTO_4409 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4402 ?AUTO_4406 ) ( IN-CITY ?AUTO_4406 ?AUTO_4405 ) ( IN-CITY ?AUTO_4399 ?AUTO_4405 ) ( not ( = ?AUTO_4399 ?AUTO_4406 ) ) ( TRUCK-AT ?AUTO_4402 ?AUTO_4400 ) ( AIRPORT ?AUTO_4401 ) ( AIRPORT ?AUTO_4400 ) ( not ( = ?AUTO_4401 ?AUTO_4400 ) ) ( AIRPORT ?AUTO_4407 ) ( AIRPLANE-AT ?AUTO_4408 ?AUTO_4407 ) ( not ( = ?AUTO_4407 ?AUTO_4401 ) ) ( TRUCK-AT ?AUTO_4409 ?AUTO_4401 ) ( IN-TRUCK ?AUTO_4398 ?AUTO_4409 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4398 ?AUTO_4409 ?AUTO_4401 )
      ( DELIVER-PKG ?AUTO_4398 ?AUTO_4399 )
      ( DELIVER-PKG-VERIFY ?AUTO_4398 ?AUTO_4399 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4416 - OBJ
      ?AUTO_4417 - LOCATION
    )
    :vars
    (
      ?AUTO_4426 - TRUCK
      ?AUTO_4427 - LOCATION
      ?AUTO_4425 - CITY
      ?AUTO_4423 - LOCATION
      ?AUTO_4421 - LOCATION
      ?AUTO_4420 - LOCATION
      ?AUTO_4422 - AIRPLANE
      ?AUTO_4424 - TRUCK
      ?AUTO_4430 - LOCATION
      ?AUTO_4429 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4426 ?AUTO_4427 ) ( IN-CITY ?AUTO_4427 ?AUTO_4425 ) ( IN-CITY ?AUTO_4417 ?AUTO_4425 ) ( not ( = ?AUTO_4417 ?AUTO_4427 ) ) ( TRUCK-AT ?AUTO_4426 ?AUTO_4423 ) ( AIRPORT ?AUTO_4421 ) ( AIRPORT ?AUTO_4423 ) ( not ( = ?AUTO_4421 ?AUTO_4423 ) ) ( AIRPORT ?AUTO_4420 ) ( AIRPLANE-AT ?AUTO_4422 ?AUTO_4420 ) ( not ( = ?AUTO_4420 ?AUTO_4421 ) ) ( IN-TRUCK ?AUTO_4416 ?AUTO_4424 ) ( TRUCK-AT ?AUTO_4424 ?AUTO_4430 ) ( IN-CITY ?AUTO_4430 ?AUTO_4429 ) ( IN-CITY ?AUTO_4421 ?AUTO_4429 ) ( not ( = ?AUTO_4421 ?AUTO_4430 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4424 ?AUTO_4430 ?AUTO_4421 ?AUTO_4429 )
      ( DELIVER-PKG ?AUTO_4416 ?AUTO_4417 )
      ( DELIVER-PKG-VERIFY ?AUTO_4416 ?AUTO_4417 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4492 - OBJ
      ?AUTO_4493 - LOCATION
    )
    :vars
    (
      ?AUTO_4494 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4494 ?AUTO_4493 ) ( IN-TRUCK ?AUTO_4492 ?AUTO_4494 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4492 ?AUTO_4494 ?AUTO_4493 )
      ( DELIVER-PKG-VERIFY ?AUTO_4492 ?AUTO_4493 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4499 - OBJ
      ?AUTO_4500 - LOCATION
    )
    :vars
    (
      ?AUTO_4502 - TRUCK
      ?AUTO_4506 - LOCATION
      ?AUTO_4505 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4499 ?AUTO_4502 ) ( TRUCK-AT ?AUTO_4502 ?AUTO_4506 ) ( IN-CITY ?AUTO_4506 ?AUTO_4505 ) ( IN-CITY ?AUTO_4500 ?AUTO_4505 ) ( not ( = ?AUTO_4500 ?AUTO_4506 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4502 ?AUTO_4506 ?AUTO_4500 ?AUTO_4505 )
      ( DELIVER-PKG ?AUTO_4499 ?AUTO_4500 )
      ( DELIVER-PKG-VERIFY ?AUTO_4499 ?AUTO_4500 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4508 - OBJ
      ?AUTO_4509 - LOCATION
    )
    :vars
    (
      ?AUTO_4511 - TRUCK
      ?AUTO_4513 - LOCATION
      ?AUTO_4512 - CITY
      ?AUTO_4516 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4511 ?AUTO_4513 ) ( IN-CITY ?AUTO_4513 ?AUTO_4512 ) ( IN-CITY ?AUTO_4509 ?AUTO_4512 ) ( not ( = ?AUTO_4509 ?AUTO_4513 ) ) ( TRUCK-AT ?AUTO_4511 ?AUTO_4516 ) ( OBJ-AT ?AUTO_4508 ?AUTO_4516 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4508 ?AUTO_4511 ?AUTO_4516 )
      ( DELIVER-PKG ?AUTO_4508 ?AUTO_4509 )
      ( DELIVER-PKG-VERIFY ?AUTO_4508 ?AUTO_4509 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4522 - OBJ
      ?AUTO_4523 - LOCATION
    )
    :vars
    (
      ?AUTO_4527 - TRUCK
      ?AUTO_4524 - LOCATION
      ?AUTO_4528 - CITY
      ?AUTO_4529 - LOCATION
      ?AUTO_4530 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4527 ?AUTO_4524 ) ( IN-CITY ?AUTO_4524 ?AUTO_4528 ) ( IN-CITY ?AUTO_4523 ?AUTO_4528 ) ( not ( = ?AUTO_4523 ?AUTO_4524 ) ) ( TRUCK-AT ?AUTO_4527 ?AUTO_4529 ) ( IN-AIRPLANE ?AUTO_4522 ?AUTO_4530 ) ( AIRPLANE-AT ?AUTO_4530 ?AUTO_4529 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4522 ?AUTO_4530 ?AUTO_4529 )
      ( DELIVER-PKG ?AUTO_4522 ?AUTO_4523 )
      ( DELIVER-PKG-VERIFY ?AUTO_4522 ?AUTO_4523 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4537 - OBJ
      ?AUTO_4538 - LOCATION
    )
    :vars
    (
      ?AUTO_4546 - TRUCK
      ?AUTO_4542 - LOCATION
      ?AUTO_4543 - CITY
      ?AUTO_4540 - LOCATION
      ?AUTO_4545 - LOCATION
      ?AUTO_4541 - AIRPLANE
      ?AUTO_4548 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4546 ?AUTO_4542 ) ( IN-CITY ?AUTO_4542 ?AUTO_4543 ) ( IN-CITY ?AUTO_4538 ?AUTO_4543 ) ( not ( = ?AUTO_4538 ?AUTO_4542 ) ) ( TRUCK-AT ?AUTO_4546 ?AUTO_4540 ) ( AIRPORT ?AUTO_4545 ) ( AIRPORT ?AUTO_4540 ) ( AIRPLANE-AT ?AUTO_4541 ?AUTO_4545 ) ( not ( = ?AUTO_4545 ?AUTO_4540 ) ) ( OBJ-AT ?AUTO_4537 ?AUTO_4548 ) ( AIRPLANE-AT ?AUTO_4541 ?AUTO_4548 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4537 ?AUTO_4541 ?AUTO_4548 )
      ( DELIVER-PKG ?AUTO_4537 ?AUTO_4538 )
      ( DELIVER-PKG-VERIFY ?AUTO_4537 ?AUTO_4538 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4570 - OBJ
      ?AUTO_4571 - LOCATION
    )
    :vars
    (
      ?AUTO_4573 - TRUCK
      ?AUTO_4576 - LOCATION
      ?AUTO_4574 - CITY
      ?AUTO_4580 - LOCATION
      ?AUTO_4579 - LOCATION
      ?AUTO_4578 - LOCATION
      ?AUTO_4575 - AIRPLANE
      ?AUTO_4581 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4573 ?AUTO_4576 ) ( IN-CITY ?AUTO_4576 ?AUTO_4574 ) ( IN-CITY ?AUTO_4571 ?AUTO_4574 ) ( not ( = ?AUTO_4571 ?AUTO_4576 ) ) ( TRUCK-AT ?AUTO_4573 ?AUTO_4580 ) ( AIRPORT ?AUTO_4579 ) ( AIRPORT ?AUTO_4580 ) ( not ( = ?AUTO_4579 ?AUTO_4580 ) ) ( AIRPORT ?AUTO_4578 ) ( AIRPLANE-AT ?AUTO_4575 ?AUTO_4578 ) ( not ( = ?AUTO_4578 ?AUTO_4579 ) ) ( TRUCK-AT ?AUTO_4581 ?AUTO_4579 ) ( IN-TRUCK ?AUTO_4570 ?AUTO_4581 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4570 ?AUTO_4581 ?AUTO_4579 )
      ( DELIVER-PKG ?AUTO_4570 ?AUTO_4571 )
      ( DELIVER-PKG-VERIFY ?AUTO_4570 ?AUTO_4571 ) )
  )

)

