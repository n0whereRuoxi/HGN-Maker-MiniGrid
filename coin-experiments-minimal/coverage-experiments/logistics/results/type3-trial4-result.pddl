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
      ?AUTO_44 - OBJ
      ?AUTO_45 - LOCATION
    )
    :vars
    (
      ?AUTO_46 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_44 ?AUTO_46 ) ( AIRPLANE-AT ?AUTO_46 ?AUTO_45 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_44 ?AUTO_46 ?AUTO_45 )
      ( DELIVER-PKG-VERIFY ?AUTO_44 ?AUTO_45 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_49 - OBJ
      ?AUTO_50 - LOCATION
    )
    :vars
    (
      ?AUTO_53 - AIRPLANE
      ?AUTO_55 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_49 ?AUTO_53 ) ( AIRPORT ?AUTO_55 ) ( AIRPORT ?AUTO_50 ) ( AIRPLANE-AT ?AUTO_53 ?AUTO_55 ) ( not ( = ?AUTO_55 ?AUTO_50 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_53 ?AUTO_55 ?AUTO_50 )
      ( DELIVER-PKG ?AUTO_49 ?AUTO_50 )
      ( DELIVER-PKG-VERIFY ?AUTO_49 ?AUTO_50 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_59 - OBJ
      ?AUTO_60 - LOCATION
    )
    :vars
    (
      ?AUTO_63 - LOCATION
      ?AUTO_61 - AIRPLANE
      ?AUTO_66 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_63 ) ( AIRPORT ?AUTO_60 ) ( AIRPLANE-AT ?AUTO_61 ?AUTO_63 ) ( not ( = ?AUTO_63 ?AUTO_60 ) ) ( OBJ-AT ?AUTO_59 ?AUTO_66 ) ( AIRPLANE-AT ?AUTO_61 ?AUTO_66 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_59 ?AUTO_61 ?AUTO_66 )
      ( DELIVER-PKG ?AUTO_59 ?AUTO_60 )
      ( DELIVER-PKG-VERIFY ?AUTO_59 ?AUTO_60 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_68 - OBJ
      ?AUTO_69 - LOCATION
    )
    :vars
    (
      ?AUTO_74 - LOCATION
      ?AUTO_76 - LOCATION
      ?AUTO_70 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_74 ) ( AIRPORT ?AUTO_69 ) ( not ( = ?AUTO_74 ?AUTO_69 ) ) ( OBJ-AT ?AUTO_68 ?AUTO_74 ) ( AIRPORT ?AUTO_76 ) ( AIRPLANE-AT ?AUTO_70 ?AUTO_76 ) ( not ( = ?AUTO_76 ?AUTO_74 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_70 ?AUTO_76 ?AUTO_74 )
      ( DELIVER-PKG ?AUTO_68 ?AUTO_69 )
      ( DELIVER-PKG-VERIFY ?AUTO_68 ?AUTO_69 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_92 - OBJ
      ?AUTO_93 - LOCATION
    )
    :vars
    (
      ?AUTO_94 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_92 ?AUTO_94 ) ( AIRPLANE-AT ?AUTO_94 ?AUTO_93 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_92 ?AUTO_94 ?AUTO_93 )
      ( DELIVER-PKG-VERIFY ?AUTO_92 ?AUTO_93 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_97 - OBJ
      ?AUTO_98 - LOCATION
    )
    :vars
    (
      ?AUTO_100 - AIRPLANE
      ?AUTO_103 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_97 ?AUTO_100 ) ( AIRPORT ?AUTO_103 ) ( AIRPORT ?AUTO_98 ) ( AIRPLANE-AT ?AUTO_100 ?AUTO_103 ) ( not ( = ?AUTO_103 ?AUTO_98 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_100 ?AUTO_103 ?AUTO_98 )
      ( DELIVER-PKG ?AUTO_97 ?AUTO_98 )
      ( DELIVER-PKG-VERIFY ?AUTO_97 ?AUTO_98 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_109 - OBJ
      ?AUTO_110 - LOCATION
    )
    :vars
    (
      ?AUTO_112 - LOCATION
      ?AUTO_111 - AIRPLANE
      ?AUTO_116 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_112 ) ( AIRPORT ?AUTO_110 ) ( AIRPLANE-AT ?AUTO_111 ?AUTO_112 ) ( not ( = ?AUTO_112 ?AUTO_110 ) ) ( OBJ-AT ?AUTO_109 ?AUTO_116 ) ( AIRPLANE-AT ?AUTO_111 ?AUTO_116 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_109 ?AUTO_111 ?AUTO_116 )
      ( DELIVER-PKG ?AUTO_109 ?AUTO_110 )
      ( DELIVER-PKG-VERIFY ?AUTO_109 ?AUTO_110 ) )
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
      ?AUTO_128 - LOCATION
      ?AUTO_125 - AIRPLANE
      ?AUTO_129 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_124 ) ( AIRPORT ?AUTO_123 ) ( not ( = ?AUTO_124 ?AUTO_123 ) ) ( AIRPORT ?AUTO_128 ) ( AIRPLANE-AT ?AUTO_125 ?AUTO_128 ) ( not ( = ?AUTO_128 ?AUTO_124 ) ) ( TRUCK-AT ?AUTO_129 ?AUTO_124 ) ( IN-TRUCK ?AUTO_122 ?AUTO_129 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_122 ?AUTO_129 ?AUTO_124 )
      ( DELIVER-PKG ?AUTO_122 ?AUTO_123 )
      ( DELIVER-PKG-VERIFY ?AUTO_122 ?AUTO_123 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_132 - OBJ
      ?AUTO_133 - LOCATION
    )
    :vars
    (
      ?AUTO_137 - LOCATION
      ?AUTO_138 - LOCATION
      ?AUTO_136 - AIRPLANE
      ?AUTO_139 - TRUCK
      ?AUTO_142 - LOCATION
      ?AUTO_141 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_137 ) ( AIRPORT ?AUTO_133 ) ( not ( = ?AUTO_137 ?AUTO_133 ) ) ( AIRPORT ?AUTO_138 ) ( AIRPLANE-AT ?AUTO_136 ?AUTO_138 ) ( not ( = ?AUTO_138 ?AUTO_137 ) ) ( IN-TRUCK ?AUTO_132 ?AUTO_139 ) ( TRUCK-AT ?AUTO_139 ?AUTO_142 ) ( IN-CITY ?AUTO_142 ?AUTO_141 ) ( IN-CITY ?AUTO_137 ?AUTO_141 ) ( not ( = ?AUTO_137 ?AUTO_142 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_139 ?AUTO_142 ?AUTO_137 ?AUTO_141 )
      ( DELIVER-PKG ?AUTO_132 ?AUTO_133 )
      ( DELIVER-PKG-VERIFY ?AUTO_132 ?AUTO_133 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_144 - OBJ
      ?AUTO_145 - LOCATION
    )
    :vars
    (
      ?AUTO_149 - LOCATION
      ?AUTO_151 - LOCATION
      ?AUTO_150 - AIRPLANE
      ?AUTO_152 - TRUCK
      ?AUTO_153 - LOCATION
      ?AUTO_146 - CITY
      ?AUTO_155 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_149 ) ( AIRPORT ?AUTO_145 ) ( not ( = ?AUTO_149 ?AUTO_145 ) ) ( AIRPORT ?AUTO_151 ) ( AIRPLANE-AT ?AUTO_150 ?AUTO_151 ) ( not ( = ?AUTO_151 ?AUTO_149 ) ) ( TRUCK-AT ?AUTO_152 ?AUTO_153 ) ( IN-CITY ?AUTO_153 ?AUTO_146 ) ( IN-CITY ?AUTO_149 ?AUTO_146 ) ( not ( = ?AUTO_149 ?AUTO_153 ) ) ( TRUCK-AT ?AUTO_152 ?AUTO_155 ) ( OBJ-AT ?AUTO_144 ?AUTO_155 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_144 ?AUTO_152 ?AUTO_155 )
      ( DELIVER-PKG ?AUTO_144 ?AUTO_145 )
      ( DELIVER-PKG-VERIFY ?AUTO_144 ?AUTO_145 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_157 - OBJ
      ?AUTO_158 - LOCATION
    )
    :vars
    (
      ?AUTO_165 - LOCATION
      ?AUTO_166 - LOCATION
      ?AUTO_167 - AIRPLANE
      ?AUTO_162 - LOCATION
      ?AUTO_160 - CITY
      ?AUTO_163 - TRUCK
      ?AUTO_170 - LOCATION
      ?AUTO_169 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_165 ) ( AIRPORT ?AUTO_158 ) ( not ( = ?AUTO_165 ?AUTO_158 ) ) ( AIRPORT ?AUTO_166 ) ( AIRPLANE-AT ?AUTO_167 ?AUTO_166 ) ( not ( = ?AUTO_166 ?AUTO_165 ) ) ( IN-CITY ?AUTO_162 ?AUTO_160 ) ( IN-CITY ?AUTO_165 ?AUTO_160 ) ( not ( = ?AUTO_165 ?AUTO_162 ) ) ( OBJ-AT ?AUTO_157 ?AUTO_162 ) ( TRUCK-AT ?AUTO_163 ?AUTO_170 ) ( IN-CITY ?AUTO_170 ?AUTO_169 ) ( IN-CITY ?AUTO_162 ?AUTO_169 ) ( not ( = ?AUTO_162 ?AUTO_170 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_163 ?AUTO_170 ?AUTO_162 ?AUTO_169 )
      ( DELIVER-PKG ?AUTO_157 ?AUTO_158 )
      ( DELIVER-PKG-VERIFY ?AUTO_157 ?AUTO_158 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_178 - OBJ
      ?AUTO_179 - LOCATION
    )
    :vars
    (
      ?AUTO_180 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_180 ?AUTO_179 ) ( IN-TRUCK ?AUTO_178 ?AUTO_180 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_178 ?AUTO_180 ?AUTO_179 )
      ( DELIVER-PKG-VERIFY ?AUTO_178 ?AUTO_179 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_183 - OBJ
      ?AUTO_184 - LOCATION
    )
    :vars
    (
      ?AUTO_187 - TRUCK
      ?AUTO_190 - LOCATION
      ?AUTO_189 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_183 ?AUTO_187 ) ( TRUCK-AT ?AUTO_187 ?AUTO_190 ) ( IN-CITY ?AUTO_190 ?AUTO_189 ) ( IN-CITY ?AUTO_184 ?AUTO_189 ) ( not ( = ?AUTO_184 ?AUTO_190 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_187 ?AUTO_190 ?AUTO_184 ?AUTO_189 )
      ( DELIVER-PKG ?AUTO_183 ?AUTO_184 )
      ( DELIVER-PKG-VERIFY ?AUTO_183 ?AUTO_184 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_192 - OBJ
      ?AUTO_193 - LOCATION
    )
    :vars
    (
      ?AUTO_196 - TRUCK
      ?AUTO_198 - LOCATION
      ?AUTO_197 - CITY
      ?AUTO_200 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_196 ?AUTO_198 ) ( IN-CITY ?AUTO_198 ?AUTO_197 ) ( IN-CITY ?AUTO_193 ?AUTO_197 ) ( not ( = ?AUTO_193 ?AUTO_198 ) ) ( TRUCK-AT ?AUTO_196 ?AUTO_200 ) ( OBJ-AT ?AUTO_192 ?AUTO_200 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_192 ?AUTO_196 ?AUTO_200 )
      ( DELIVER-PKG ?AUTO_192 ?AUTO_193 )
      ( DELIVER-PKG-VERIFY ?AUTO_192 ?AUTO_193 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_206 - OBJ
      ?AUTO_207 - LOCATION
    )
    :vars
    (
      ?AUTO_213 - TRUCK
      ?AUTO_212 - LOCATION
      ?AUTO_211 - CITY
      ?AUTO_210 - LOCATION
      ?AUTO_214 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_213 ?AUTO_212 ) ( IN-CITY ?AUTO_212 ?AUTO_211 ) ( IN-CITY ?AUTO_207 ?AUTO_211 ) ( not ( = ?AUTO_207 ?AUTO_212 ) ) ( TRUCK-AT ?AUTO_213 ?AUTO_210 ) ( IN-AIRPLANE ?AUTO_206 ?AUTO_214 ) ( AIRPLANE-AT ?AUTO_214 ?AUTO_210 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_206 ?AUTO_214 ?AUTO_210 )
      ( DELIVER-PKG ?AUTO_206 ?AUTO_207 )
      ( DELIVER-PKG-VERIFY ?AUTO_206 ?AUTO_207 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_217 - OBJ
      ?AUTO_218 - LOCATION
    )
    :vars
    (
      ?AUTO_222 - TRUCK
      ?AUTO_223 - LOCATION
      ?AUTO_221 - CITY
      ?AUTO_224 - LOCATION
      ?AUTO_225 - AIRPLANE
      ?AUTO_227 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_222 ?AUTO_223 ) ( IN-CITY ?AUTO_223 ?AUTO_221 ) ( IN-CITY ?AUTO_218 ?AUTO_221 ) ( not ( = ?AUTO_218 ?AUTO_223 ) ) ( TRUCK-AT ?AUTO_222 ?AUTO_224 ) ( IN-AIRPLANE ?AUTO_217 ?AUTO_225 ) ( AIRPORT ?AUTO_227 ) ( AIRPORT ?AUTO_224 ) ( AIRPLANE-AT ?AUTO_225 ?AUTO_227 ) ( not ( = ?AUTO_227 ?AUTO_224 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_225 ?AUTO_227 ?AUTO_224 )
      ( DELIVER-PKG ?AUTO_217 ?AUTO_218 )
      ( DELIVER-PKG-VERIFY ?AUTO_217 ?AUTO_218 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_231 - OBJ
      ?AUTO_232 - LOCATION
    )
    :vars
    (
      ?AUTO_234 - TRUCK
      ?AUTO_235 - LOCATION
      ?AUTO_233 - CITY
      ?AUTO_237 - LOCATION
      ?AUTO_240 - LOCATION
      ?AUTO_239 - AIRPLANE
      ?AUTO_242 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_234 ?AUTO_235 ) ( IN-CITY ?AUTO_235 ?AUTO_233 ) ( IN-CITY ?AUTO_232 ?AUTO_233 ) ( not ( = ?AUTO_232 ?AUTO_235 ) ) ( TRUCK-AT ?AUTO_234 ?AUTO_237 ) ( AIRPORT ?AUTO_240 ) ( AIRPORT ?AUTO_237 ) ( AIRPLANE-AT ?AUTO_239 ?AUTO_240 ) ( not ( = ?AUTO_240 ?AUTO_237 ) ) ( OBJ-AT ?AUTO_231 ?AUTO_242 ) ( AIRPLANE-AT ?AUTO_239 ?AUTO_242 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_231 ?AUTO_239 ?AUTO_242 )
      ( DELIVER-PKG ?AUTO_231 ?AUTO_232 )
      ( DELIVER-PKG-VERIFY ?AUTO_231 ?AUTO_232 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_244 - OBJ
      ?AUTO_245 - LOCATION
    )
    :vars
    (
      ?AUTO_251 - TRUCK
      ?AUTO_253 - LOCATION
      ?AUTO_249 - CITY
      ?AUTO_248 - LOCATION
      ?AUTO_254 - LOCATION
      ?AUTO_256 - LOCATION
      ?AUTO_250 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_251 ?AUTO_253 ) ( IN-CITY ?AUTO_253 ?AUTO_249 ) ( IN-CITY ?AUTO_245 ?AUTO_249 ) ( not ( = ?AUTO_245 ?AUTO_253 ) ) ( TRUCK-AT ?AUTO_251 ?AUTO_248 ) ( AIRPORT ?AUTO_254 ) ( AIRPORT ?AUTO_248 ) ( not ( = ?AUTO_254 ?AUTO_248 ) ) ( OBJ-AT ?AUTO_244 ?AUTO_254 ) ( AIRPORT ?AUTO_256 ) ( AIRPLANE-AT ?AUTO_250 ?AUTO_256 ) ( not ( = ?AUTO_256 ?AUTO_254 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_250 ?AUTO_256 ?AUTO_254 )
      ( DELIVER-PKG ?AUTO_244 ?AUTO_245 )
      ( DELIVER-PKG-VERIFY ?AUTO_244 ?AUTO_245 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_266 - OBJ
      ?AUTO_267 - LOCATION
    )
    :vars
    (
      ?AUTO_276 - LOCATION
      ?AUTO_272 - CITY
      ?AUTO_274 - LOCATION
      ?AUTO_273 - LOCATION
      ?AUTO_268 - AIRPLANE
      ?AUTO_275 - TRUCK
      ?AUTO_279 - LOCATION
      ?AUTO_278 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_276 ?AUTO_272 ) ( IN-CITY ?AUTO_267 ?AUTO_272 ) ( not ( = ?AUTO_267 ?AUTO_276 ) ) ( AIRPORT ?AUTO_274 ) ( AIRPORT ?AUTO_276 ) ( not ( = ?AUTO_274 ?AUTO_276 ) ) ( OBJ-AT ?AUTO_266 ?AUTO_274 ) ( AIRPORT ?AUTO_273 ) ( AIRPLANE-AT ?AUTO_268 ?AUTO_273 ) ( not ( = ?AUTO_273 ?AUTO_274 ) ) ( TRUCK-AT ?AUTO_275 ?AUTO_279 ) ( IN-CITY ?AUTO_279 ?AUTO_278 ) ( IN-CITY ?AUTO_276 ?AUTO_278 ) ( not ( = ?AUTO_276 ?AUTO_279 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_275 ?AUTO_279 ?AUTO_276 ?AUTO_278 )
      ( DELIVER-PKG ?AUTO_266 ?AUTO_267 )
      ( DELIVER-PKG-VERIFY ?AUTO_266 ?AUTO_267 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_285 - OBJ
      ?AUTO_286 - LOCATION
    )
    :vars
    (
      ?AUTO_287 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_287 ?AUTO_286 ) ( IN-TRUCK ?AUTO_285 ?AUTO_287 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_285 ?AUTO_287 ?AUTO_286 )
      ( DELIVER-PKG-VERIFY ?AUTO_285 ?AUTO_286 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_290 - OBJ
      ?AUTO_291 - LOCATION
    )
    :vars
    (
      ?AUTO_293 - TRUCK
      ?AUTO_297 - LOCATION
      ?AUTO_296 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_290 ?AUTO_293 ) ( TRUCK-AT ?AUTO_293 ?AUTO_297 ) ( IN-CITY ?AUTO_297 ?AUTO_296 ) ( IN-CITY ?AUTO_291 ?AUTO_296 ) ( not ( = ?AUTO_291 ?AUTO_297 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_293 ?AUTO_297 ?AUTO_291 ?AUTO_296 )
      ( DELIVER-PKG ?AUTO_290 ?AUTO_291 )
      ( DELIVER-PKG-VERIFY ?AUTO_290 ?AUTO_291 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_299 - OBJ
      ?AUTO_300 - LOCATION
    )
    :vars
    (
      ?AUTO_301 - TRUCK
      ?AUTO_305 - LOCATION
      ?AUTO_304 - CITY
      ?AUTO_307 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_301 ?AUTO_305 ) ( IN-CITY ?AUTO_305 ?AUTO_304 ) ( IN-CITY ?AUTO_300 ?AUTO_304 ) ( not ( = ?AUTO_300 ?AUTO_305 ) ) ( TRUCK-AT ?AUTO_301 ?AUTO_307 ) ( OBJ-AT ?AUTO_299 ?AUTO_307 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_299 ?AUTO_301 ?AUTO_307 )
      ( DELIVER-PKG ?AUTO_299 ?AUTO_300 )
      ( DELIVER-PKG-VERIFY ?AUTO_299 ?AUTO_300 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_309 - OBJ
      ?AUTO_310 - LOCATION
    )
    :vars
    (
      ?AUTO_313 - LOCATION
      ?AUTO_316 - CITY
      ?AUTO_312 - TRUCK
      ?AUTO_319 - LOCATION
      ?AUTO_318 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_313 ?AUTO_316 ) ( IN-CITY ?AUTO_310 ?AUTO_316 ) ( not ( = ?AUTO_310 ?AUTO_313 ) ) ( OBJ-AT ?AUTO_309 ?AUTO_313 ) ( TRUCK-AT ?AUTO_312 ?AUTO_319 ) ( IN-CITY ?AUTO_319 ?AUTO_318 ) ( IN-CITY ?AUTO_313 ?AUTO_318 ) ( not ( = ?AUTO_313 ?AUTO_319 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_312 ?AUTO_319 ?AUTO_313 ?AUTO_318 )
      ( DELIVER-PKG ?AUTO_309 ?AUTO_310 )
      ( DELIVER-PKG-VERIFY ?AUTO_309 ?AUTO_310 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_327 - OBJ
      ?AUTO_328 - LOCATION
    )
    :vars
    (
      ?AUTO_330 - LOCATION
      ?AUTO_334 - CITY
      ?AUTO_333 - TRUCK
      ?AUTO_329 - LOCATION
      ?AUTO_331 - CITY
      ?AUTO_336 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_330 ?AUTO_334 ) ( IN-CITY ?AUTO_328 ?AUTO_334 ) ( not ( = ?AUTO_328 ?AUTO_330 ) ) ( TRUCK-AT ?AUTO_333 ?AUTO_329 ) ( IN-CITY ?AUTO_329 ?AUTO_331 ) ( IN-CITY ?AUTO_330 ?AUTO_331 ) ( not ( = ?AUTO_330 ?AUTO_329 ) ) ( IN-AIRPLANE ?AUTO_327 ?AUTO_336 ) ( AIRPLANE-AT ?AUTO_336 ?AUTO_330 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_327 ?AUTO_336 ?AUTO_330 )
      ( DELIVER-PKG ?AUTO_327 ?AUTO_328 )
      ( DELIVER-PKG-VERIFY ?AUTO_327 ?AUTO_328 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_339 - OBJ
      ?AUTO_340 - LOCATION
    )
    :vars
    (
      ?AUTO_345 - LOCATION
      ?AUTO_344 - CITY
      ?AUTO_346 - TRUCK
      ?AUTO_343 - LOCATION
      ?AUTO_347 - CITY
      ?AUTO_348 - AIRPLANE
      ?AUTO_350 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_345 ?AUTO_344 ) ( IN-CITY ?AUTO_340 ?AUTO_344 ) ( not ( = ?AUTO_340 ?AUTO_345 ) ) ( TRUCK-AT ?AUTO_346 ?AUTO_343 ) ( IN-CITY ?AUTO_343 ?AUTO_347 ) ( IN-CITY ?AUTO_345 ?AUTO_347 ) ( not ( = ?AUTO_345 ?AUTO_343 ) ) ( IN-AIRPLANE ?AUTO_339 ?AUTO_348 ) ( AIRPORT ?AUTO_350 ) ( AIRPORT ?AUTO_345 ) ( AIRPLANE-AT ?AUTO_348 ?AUTO_350 ) ( not ( = ?AUTO_350 ?AUTO_345 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_348 ?AUTO_350 ?AUTO_345 )
      ( DELIVER-PKG ?AUTO_339 ?AUTO_340 )
      ( DELIVER-PKG-VERIFY ?AUTO_339 ?AUTO_340 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_356 - OBJ
      ?AUTO_357 - LOCATION
    )
    :vars
    (
      ?AUTO_359 - LOCATION
      ?AUTO_365 - CITY
      ?AUTO_363 - TRUCK
      ?AUTO_360 - LOCATION
      ?AUTO_366 - CITY
      ?AUTO_358 - LOCATION
      ?AUTO_362 - AIRPLANE
      ?AUTO_368 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_359 ?AUTO_365 ) ( IN-CITY ?AUTO_357 ?AUTO_365 ) ( not ( = ?AUTO_357 ?AUTO_359 ) ) ( TRUCK-AT ?AUTO_363 ?AUTO_360 ) ( IN-CITY ?AUTO_360 ?AUTO_366 ) ( IN-CITY ?AUTO_359 ?AUTO_366 ) ( not ( = ?AUTO_359 ?AUTO_360 ) ) ( AIRPORT ?AUTO_358 ) ( AIRPORT ?AUTO_359 ) ( AIRPLANE-AT ?AUTO_362 ?AUTO_358 ) ( not ( = ?AUTO_358 ?AUTO_359 ) ) ( OBJ-AT ?AUTO_356 ?AUTO_368 ) ( AIRPLANE-AT ?AUTO_362 ?AUTO_368 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_356 ?AUTO_362 ?AUTO_368 )
      ( DELIVER-PKG ?AUTO_356 ?AUTO_357 )
      ( DELIVER-PKG-VERIFY ?AUTO_356 ?AUTO_357 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_372 - OBJ
      ?AUTO_373 - LOCATION
    )
    :vars
    (
      ?AUTO_382 - LOCATION
      ?AUTO_383 - CITY
      ?AUTO_374 - TRUCK
      ?AUTO_378 - LOCATION
      ?AUTO_379 - CITY
      ?AUTO_381 - LOCATION
      ?AUTO_385 - LOCATION
      ?AUTO_380 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_382 ?AUTO_383 ) ( IN-CITY ?AUTO_373 ?AUTO_383 ) ( not ( = ?AUTO_373 ?AUTO_382 ) ) ( TRUCK-AT ?AUTO_374 ?AUTO_378 ) ( IN-CITY ?AUTO_378 ?AUTO_379 ) ( IN-CITY ?AUTO_382 ?AUTO_379 ) ( not ( = ?AUTO_382 ?AUTO_378 ) ) ( AIRPORT ?AUTO_381 ) ( AIRPORT ?AUTO_382 ) ( not ( = ?AUTO_381 ?AUTO_382 ) ) ( OBJ-AT ?AUTO_372 ?AUTO_381 ) ( AIRPORT ?AUTO_385 ) ( AIRPLANE-AT ?AUTO_380 ?AUTO_385 ) ( not ( = ?AUTO_385 ?AUTO_381 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_380 ?AUTO_385 ?AUTO_381 )
      ( DELIVER-PKG ?AUTO_372 ?AUTO_373 )
      ( DELIVER-PKG-VERIFY ?AUTO_372 ?AUTO_373 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_387 - OBJ
      ?AUTO_388 - LOCATION
    )
    :vars
    (
      ?AUTO_394 - LOCATION
      ?AUTO_390 - CITY
      ?AUTO_398 - TRUCK
      ?AUTO_396 - LOCATION
      ?AUTO_393 - CITY
      ?AUTO_391 - LOCATION
      ?AUTO_397 - LOCATION
      ?AUTO_395 - AIRPLANE
      ?AUTO_399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_394 ?AUTO_390 ) ( IN-CITY ?AUTO_388 ?AUTO_390 ) ( not ( = ?AUTO_388 ?AUTO_394 ) ) ( TRUCK-AT ?AUTO_398 ?AUTO_396 ) ( IN-CITY ?AUTO_396 ?AUTO_393 ) ( IN-CITY ?AUTO_394 ?AUTO_393 ) ( not ( = ?AUTO_394 ?AUTO_396 ) ) ( AIRPORT ?AUTO_391 ) ( AIRPORT ?AUTO_394 ) ( not ( = ?AUTO_391 ?AUTO_394 ) ) ( AIRPORT ?AUTO_397 ) ( AIRPLANE-AT ?AUTO_395 ?AUTO_397 ) ( not ( = ?AUTO_397 ?AUTO_391 ) ) ( TRUCK-AT ?AUTO_399 ?AUTO_391 ) ( IN-TRUCK ?AUTO_387 ?AUTO_399 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_387 ?AUTO_399 ?AUTO_391 )
      ( DELIVER-PKG ?AUTO_387 ?AUTO_388 )
      ( DELIVER-PKG-VERIFY ?AUTO_387 ?AUTO_388 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_402 - OBJ
      ?AUTO_403 - LOCATION
    )
    :vars
    (
      ?AUTO_406 - LOCATION
      ?AUTO_404 - CITY
      ?AUTO_405 - TRUCK
      ?AUTO_411 - LOCATION
      ?AUTO_407 - CITY
      ?AUTO_413 - LOCATION
      ?AUTO_408 - LOCATION
      ?AUTO_409 - AIRPLANE
      ?AUTO_414 - TRUCK
      ?AUTO_417 - LOCATION
      ?AUTO_416 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_406 ?AUTO_404 ) ( IN-CITY ?AUTO_403 ?AUTO_404 ) ( not ( = ?AUTO_403 ?AUTO_406 ) ) ( TRUCK-AT ?AUTO_405 ?AUTO_411 ) ( IN-CITY ?AUTO_411 ?AUTO_407 ) ( IN-CITY ?AUTO_406 ?AUTO_407 ) ( not ( = ?AUTO_406 ?AUTO_411 ) ) ( AIRPORT ?AUTO_413 ) ( AIRPORT ?AUTO_406 ) ( not ( = ?AUTO_413 ?AUTO_406 ) ) ( AIRPORT ?AUTO_408 ) ( AIRPLANE-AT ?AUTO_409 ?AUTO_408 ) ( not ( = ?AUTO_408 ?AUTO_413 ) ) ( IN-TRUCK ?AUTO_402 ?AUTO_414 ) ( TRUCK-AT ?AUTO_414 ?AUTO_417 ) ( IN-CITY ?AUTO_417 ?AUTO_416 ) ( IN-CITY ?AUTO_413 ?AUTO_416 ) ( not ( = ?AUTO_413 ?AUTO_417 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_414 ?AUTO_417 ?AUTO_413 ?AUTO_416 )
      ( DELIVER-PKG ?AUTO_402 ?AUTO_403 )
      ( DELIVER-PKG-VERIFY ?AUTO_402 ?AUTO_403 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_419 - OBJ
      ?AUTO_420 - LOCATION
    )
    :vars
    (
      ?AUTO_429 - LOCATION
      ?AUTO_426 - CITY
      ?AUTO_428 - TRUCK
      ?AUTO_421 - LOCATION
      ?AUTO_430 - CITY
      ?AUTO_432 - LOCATION
      ?AUTO_431 - LOCATION
      ?AUTO_427 - AIRPLANE
      ?AUTO_425 - TRUCK
      ?AUTO_433 - LOCATION
      ?AUTO_422 - CITY
      ?AUTO_435 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_429 ?AUTO_426 ) ( IN-CITY ?AUTO_420 ?AUTO_426 ) ( not ( = ?AUTO_420 ?AUTO_429 ) ) ( TRUCK-AT ?AUTO_428 ?AUTO_421 ) ( IN-CITY ?AUTO_421 ?AUTO_430 ) ( IN-CITY ?AUTO_429 ?AUTO_430 ) ( not ( = ?AUTO_429 ?AUTO_421 ) ) ( AIRPORT ?AUTO_432 ) ( AIRPORT ?AUTO_429 ) ( not ( = ?AUTO_432 ?AUTO_429 ) ) ( AIRPORT ?AUTO_431 ) ( AIRPLANE-AT ?AUTO_427 ?AUTO_431 ) ( not ( = ?AUTO_431 ?AUTO_432 ) ) ( TRUCK-AT ?AUTO_425 ?AUTO_433 ) ( IN-CITY ?AUTO_433 ?AUTO_422 ) ( IN-CITY ?AUTO_432 ?AUTO_422 ) ( not ( = ?AUTO_432 ?AUTO_433 ) ) ( TRUCK-AT ?AUTO_425 ?AUTO_435 ) ( OBJ-AT ?AUTO_419 ?AUTO_435 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_419 ?AUTO_425 ?AUTO_435 )
      ( DELIVER-PKG ?AUTO_419 ?AUTO_420 )
      ( DELIVER-PKG-VERIFY ?AUTO_419 ?AUTO_420 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_437 - OBJ
      ?AUTO_438 - LOCATION
    )
    :vars
    (
      ?AUTO_451 - LOCATION
      ?AUTO_450 - CITY
      ?AUTO_449 - TRUCK
      ?AUTO_448 - LOCATION
      ?AUTO_444 - CITY
      ?AUTO_445 - LOCATION
      ?AUTO_442 - LOCATION
      ?AUTO_447 - AIRPLANE
      ?AUTO_452 - LOCATION
      ?AUTO_443 - CITY
      ?AUTO_439 - TRUCK
      ?AUTO_455 - LOCATION
      ?AUTO_454 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_451 ?AUTO_450 ) ( IN-CITY ?AUTO_438 ?AUTO_450 ) ( not ( = ?AUTO_438 ?AUTO_451 ) ) ( TRUCK-AT ?AUTO_449 ?AUTO_448 ) ( IN-CITY ?AUTO_448 ?AUTO_444 ) ( IN-CITY ?AUTO_451 ?AUTO_444 ) ( not ( = ?AUTO_451 ?AUTO_448 ) ) ( AIRPORT ?AUTO_445 ) ( AIRPORT ?AUTO_451 ) ( not ( = ?AUTO_445 ?AUTO_451 ) ) ( AIRPORT ?AUTO_442 ) ( AIRPLANE-AT ?AUTO_447 ?AUTO_442 ) ( not ( = ?AUTO_442 ?AUTO_445 ) ) ( IN-CITY ?AUTO_452 ?AUTO_443 ) ( IN-CITY ?AUTO_445 ?AUTO_443 ) ( not ( = ?AUTO_445 ?AUTO_452 ) ) ( OBJ-AT ?AUTO_437 ?AUTO_452 ) ( TRUCK-AT ?AUTO_439 ?AUTO_455 ) ( IN-CITY ?AUTO_455 ?AUTO_454 ) ( IN-CITY ?AUTO_452 ?AUTO_454 ) ( not ( = ?AUTO_452 ?AUTO_455 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_439 ?AUTO_455 ?AUTO_452 ?AUTO_454 )
      ( DELIVER-PKG ?AUTO_437 ?AUTO_438 )
      ( DELIVER-PKG-VERIFY ?AUTO_437 ?AUTO_438 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_458 - OBJ
      ?AUTO_459 - LOCATION
    )
    :vars
    (
      ?AUTO_460 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_460 ?AUTO_459 ) ( IN-TRUCK ?AUTO_458 ?AUTO_460 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_458 ?AUTO_460 ?AUTO_459 )
      ( DELIVER-PKG-VERIFY ?AUTO_458 ?AUTO_459 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_463 - OBJ
      ?AUTO_464 - LOCATION
    )
    :vars
    (
      ?AUTO_467 - TRUCK
      ?AUTO_470 - LOCATION
      ?AUTO_469 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_463 ?AUTO_467 ) ( TRUCK-AT ?AUTO_467 ?AUTO_470 ) ( IN-CITY ?AUTO_470 ?AUTO_469 ) ( IN-CITY ?AUTO_464 ?AUTO_469 ) ( not ( = ?AUTO_464 ?AUTO_470 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_467 ?AUTO_470 ?AUTO_464 ?AUTO_469 )
      ( DELIVER-PKG ?AUTO_463 ?AUTO_464 )
      ( DELIVER-PKG-VERIFY ?AUTO_463 ?AUTO_464 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_482 - OBJ
      ?AUTO_483 - LOCATION
    )
    :vars
    (
      ?AUTO_487 - TRUCK
      ?AUTO_486 - LOCATION
      ?AUTO_485 - CITY
      ?AUTO_490 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_487 ?AUTO_486 ) ( IN-CITY ?AUTO_486 ?AUTO_485 ) ( IN-CITY ?AUTO_483 ?AUTO_485 ) ( not ( = ?AUTO_483 ?AUTO_486 ) ) ( TRUCK-AT ?AUTO_487 ?AUTO_490 ) ( OBJ-AT ?AUTO_482 ?AUTO_490 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_482 ?AUTO_487 ?AUTO_490 )
      ( DELIVER-PKG ?AUTO_482 ?AUTO_483 )
      ( DELIVER-PKG-VERIFY ?AUTO_482 ?AUTO_483 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_492 - OBJ
      ?AUTO_493 - LOCATION
    )
    :vars
    (
      ?AUTO_499 - LOCATION
      ?AUTO_497 - CITY
      ?AUTO_496 - TRUCK
      ?AUTO_502 - LOCATION
      ?AUTO_501 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_499 ?AUTO_497 ) ( IN-CITY ?AUTO_493 ?AUTO_497 ) ( not ( = ?AUTO_493 ?AUTO_499 ) ) ( OBJ-AT ?AUTO_492 ?AUTO_499 ) ( TRUCK-AT ?AUTO_496 ?AUTO_502 ) ( IN-CITY ?AUTO_502 ?AUTO_501 ) ( IN-CITY ?AUTO_499 ?AUTO_501 ) ( not ( = ?AUTO_499 ?AUTO_502 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_496 ?AUTO_502 ?AUTO_499 ?AUTO_501 )
      ( DELIVER-PKG ?AUTO_492 ?AUTO_493 )
      ( DELIVER-PKG-VERIFY ?AUTO_492 ?AUTO_493 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_506 - OBJ
      ?AUTO_507 - LOCATION
    )
    :vars
    (
      ?AUTO_508 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_508 ?AUTO_507 ) ( IN-TRUCK ?AUTO_506 ?AUTO_508 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_506 ?AUTO_508 ?AUTO_507 )
      ( DELIVER-PKG-VERIFY ?AUTO_506 ?AUTO_507 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_511 - OBJ
      ?AUTO_512 - LOCATION
    )
    :vars
    (
      ?AUTO_515 - TRUCK
      ?AUTO_518 - LOCATION
      ?AUTO_517 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_511 ?AUTO_515 ) ( TRUCK-AT ?AUTO_515 ?AUTO_518 ) ( IN-CITY ?AUTO_518 ?AUTO_517 ) ( IN-CITY ?AUTO_512 ?AUTO_517 ) ( not ( = ?AUTO_512 ?AUTO_518 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_515 ?AUTO_518 ?AUTO_512 ?AUTO_517 )
      ( DELIVER-PKG ?AUTO_511 ?AUTO_512 )
      ( DELIVER-PKG-VERIFY ?AUTO_511 ?AUTO_512 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_534 - OBJ
      ?AUTO_535 - LOCATION
    )
    :vars
    (
      ?AUTO_540 - TRUCK
      ?AUTO_539 - LOCATION
      ?AUTO_536 - CITY
      ?AUTO_542 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_540 ?AUTO_539 ) ( IN-CITY ?AUTO_539 ?AUTO_536 ) ( IN-CITY ?AUTO_535 ?AUTO_536 ) ( not ( = ?AUTO_535 ?AUTO_539 ) ) ( TRUCK-AT ?AUTO_540 ?AUTO_542 ) ( OBJ-AT ?AUTO_534 ?AUTO_542 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_534 ?AUTO_540 ?AUTO_542 )
      ( DELIVER-PKG ?AUTO_534 ?AUTO_535 )
      ( DELIVER-PKG-VERIFY ?AUTO_534 ?AUTO_535 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_550 - OBJ
      ?AUTO_551 - LOCATION
    )
    :vars
    (
      ?AUTO_552 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_550 ?AUTO_552 ) ( AIRPLANE-AT ?AUTO_552 ?AUTO_551 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_550 ?AUTO_552 ?AUTO_551 )
      ( DELIVER-PKG-VERIFY ?AUTO_550 ?AUTO_551 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_557 - OBJ
      ?AUTO_558 - LOCATION
    )
    :vars
    (
      ?AUTO_561 - AIRPLANE
      ?AUTO_563 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_557 ?AUTO_561 ) ( AIRPORT ?AUTO_563 ) ( AIRPORT ?AUTO_558 ) ( AIRPLANE-AT ?AUTO_561 ?AUTO_563 ) ( not ( = ?AUTO_563 ?AUTO_558 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_561 ?AUTO_563 ?AUTO_558 )
      ( DELIVER-PKG ?AUTO_557 ?AUTO_558 )
      ( DELIVER-PKG-VERIFY ?AUTO_557 ?AUTO_558 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_577 - OBJ
      ?AUTO_578 - LOCATION
    )
    :vars
    (
      ?AUTO_580 - LOCATION
      ?AUTO_582 - AIRPLANE
      ?AUTO_584 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_580 ) ( AIRPORT ?AUTO_578 ) ( AIRPLANE-AT ?AUTO_582 ?AUTO_580 ) ( not ( = ?AUTO_580 ?AUTO_578 ) ) ( OBJ-AT ?AUTO_577 ?AUTO_584 ) ( AIRPLANE-AT ?AUTO_582 ?AUTO_584 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_577 ?AUTO_582 ?AUTO_584 )
      ( DELIVER-PKG ?AUTO_577 ?AUTO_578 )
      ( DELIVER-PKG-VERIFY ?AUTO_577 ?AUTO_578 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_586 - OBJ
      ?AUTO_587 - LOCATION
    )
    :vars
    (
      ?AUTO_592 - LOCATION
      ?AUTO_594 - LOCATION
      ?AUTO_591 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_592 ) ( AIRPORT ?AUTO_587 ) ( not ( = ?AUTO_592 ?AUTO_587 ) ) ( OBJ-AT ?AUTO_586 ?AUTO_592 ) ( AIRPORT ?AUTO_594 ) ( AIRPLANE-AT ?AUTO_591 ?AUTO_594 ) ( not ( = ?AUTO_594 ?AUTO_592 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_591 ?AUTO_594 ?AUTO_592 )
      ( DELIVER-PKG ?AUTO_586 ?AUTO_587 )
      ( DELIVER-PKG-VERIFY ?AUTO_586 ?AUTO_587 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_608 - OBJ
      ?AUTO_609 - LOCATION
    )
    :vars
    (
      ?AUTO_610 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_608 ?AUTO_610 ) ( AIRPLANE-AT ?AUTO_610 ?AUTO_609 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_608 ?AUTO_610 ?AUTO_609 )
      ( DELIVER-PKG-VERIFY ?AUTO_608 ?AUTO_609 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_647 - OBJ
      ?AUTO_648 - LOCATION
    )
    :vars
    (
      ?AUTO_649 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_647 ?AUTO_649 ) ( AIRPLANE-AT ?AUTO_649 ?AUTO_648 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_647 ?AUTO_649 ?AUTO_648 )
      ( DELIVER-PKG-VERIFY ?AUTO_647 ?AUTO_648 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_670 - OBJ
      ?AUTO_671 - LOCATION
    )
    :vars
    (
      ?AUTO_675 - LOCATION
      ?AUTO_674 - AIRPLANE
      ?AUTO_677 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_675 ) ( AIRPORT ?AUTO_671 ) ( AIRPLANE-AT ?AUTO_674 ?AUTO_675 ) ( not ( = ?AUTO_675 ?AUTO_671 ) ) ( OBJ-AT ?AUTO_670 ?AUTO_677 ) ( AIRPLANE-AT ?AUTO_674 ?AUTO_677 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_670 ?AUTO_674 ?AUTO_677 )
      ( DELIVER-PKG ?AUTO_670 ?AUTO_671 )
      ( DELIVER-PKG-VERIFY ?AUTO_670 ?AUTO_671 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_679 - OBJ
      ?AUTO_680 - LOCATION
    )
    :vars
    (
      ?AUTO_683 - LOCATION
      ?AUTO_684 - AIRPLANE
      ?AUTO_685 - LOCATION
      ?AUTO_686 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_683 ) ( AIRPORT ?AUTO_680 ) ( AIRPLANE-AT ?AUTO_684 ?AUTO_683 ) ( not ( = ?AUTO_683 ?AUTO_680 ) ) ( AIRPLANE-AT ?AUTO_684 ?AUTO_685 ) ( TRUCK-AT ?AUTO_686 ?AUTO_685 ) ( IN-TRUCK ?AUTO_679 ?AUTO_686 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_679 ?AUTO_686 ?AUTO_685 )
      ( DELIVER-PKG ?AUTO_679 ?AUTO_680 )
      ( DELIVER-PKG-VERIFY ?AUTO_679 ?AUTO_680 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_689 - OBJ
      ?AUTO_690 - LOCATION
    )
    :vars
    (
      ?AUTO_696 - LOCATION
      ?AUTO_695 - AIRPLANE
      ?AUTO_693 - LOCATION
      ?AUTO_691 - TRUCK
      ?AUTO_699 - LOCATION
      ?AUTO_698 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_696 ) ( AIRPORT ?AUTO_690 ) ( AIRPLANE-AT ?AUTO_695 ?AUTO_696 ) ( not ( = ?AUTO_696 ?AUTO_690 ) ) ( AIRPLANE-AT ?AUTO_695 ?AUTO_693 ) ( IN-TRUCK ?AUTO_689 ?AUTO_691 ) ( TRUCK-AT ?AUTO_691 ?AUTO_699 ) ( IN-CITY ?AUTO_699 ?AUTO_698 ) ( IN-CITY ?AUTO_693 ?AUTO_698 ) ( not ( = ?AUTO_693 ?AUTO_699 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_691 ?AUTO_699 ?AUTO_693 ?AUTO_698 )
      ( DELIVER-PKG ?AUTO_689 ?AUTO_690 )
      ( DELIVER-PKG-VERIFY ?AUTO_689 ?AUTO_690 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_709 - OBJ
      ?AUTO_710 - LOCATION
    )
    :vars
    (
      ?AUTO_711 - LOCATION
      ?AUTO_718 - TRUCK
      ?AUTO_716 - LOCATION
      ?AUTO_717 - CITY
      ?AUTO_720 - LOCATION
      ?AUTO_714 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_711 ) ( AIRPORT ?AUTO_710 ) ( not ( = ?AUTO_711 ?AUTO_710 ) ) ( IN-TRUCK ?AUTO_709 ?AUTO_718 ) ( TRUCK-AT ?AUTO_718 ?AUTO_716 ) ( IN-CITY ?AUTO_716 ?AUTO_717 ) ( IN-CITY ?AUTO_711 ?AUTO_717 ) ( not ( = ?AUTO_711 ?AUTO_716 ) ) ( AIRPORT ?AUTO_720 ) ( AIRPLANE-AT ?AUTO_714 ?AUTO_720 ) ( not ( = ?AUTO_720 ?AUTO_711 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_714 ?AUTO_720 ?AUTO_711 )
      ( DELIVER-PKG ?AUTO_709 ?AUTO_710 )
      ( DELIVER-PKG-VERIFY ?AUTO_709 ?AUTO_710 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_726 - OBJ
      ?AUTO_727 - LOCATION
    )
    :vars
    (
      ?AUTO_735 - LOCATION
      ?AUTO_734 - TRUCK
      ?AUTO_730 - LOCATION
      ?AUTO_728 - CITY
      ?AUTO_729 - LOCATION
      ?AUTO_731 - AIRPLANE
      ?AUTO_737 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_735 ) ( AIRPORT ?AUTO_727 ) ( not ( = ?AUTO_735 ?AUTO_727 ) ) ( TRUCK-AT ?AUTO_734 ?AUTO_730 ) ( IN-CITY ?AUTO_730 ?AUTO_728 ) ( IN-CITY ?AUTO_735 ?AUTO_728 ) ( not ( = ?AUTO_735 ?AUTO_730 ) ) ( AIRPORT ?AUTO_729 ) ( AIRPLANE-AT ?AUTO_731 ?AUTO_729 ) ( not ( = ?AUTO_729 ?AUTO_735 ) ) ( TRUCK-AT ?AUTO_734 ?AUTO_737 ) ( OBJ-AT ?AUTO_726 ?AUTO_737 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_726 ?AUTO_734 ?AUTO_737 )
      ( DELIVER-PKG ?AUTO_726 ?AUTO_727 )
      ( DELIVER-PKG-VERIFY ?AUTO_726 ?AUTO_727 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_745 - OBJ
      ?AUTO_746 - LOCATION
    )
    :vars
    (
      ?AUTO_747 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_745 ?AUTO_747 ) ( AIRPLANE-AT ?AUTO_747 ?AUTO_746 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_745 ?AUTO_747 ?AUTO_746 )
      ( DELIVER-PKG-VERIFY ?AUTO_745 ?AUTO_746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_750 - OBJ
      ?AUTO_751 - LOCATION
    )
    :vars
    (
      ?AUTO_754 - AIRPLANE
      ?AUTO_756 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_750 ?AUTO_754 ) ( AIRPORT ?AUTO_756 ) ( AIRPORT ?AUTO_751 ) ( AIRPLANE-AT ?AUTO_754 ?AUTO_756 ) ( not ( = ?AUTO_756 ?AUTO_751 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_754 ?AUTO_756 ?AUTO_751 )
      ( DELIVER-PKG ?AUTO_750 ?AUTO_751 )
      ( DELIVER-PKG-VERIFY ?AUTO_750 ?AUTO_751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_774 - OBJ
      ?AUTO_775 - LOCATION
    )
    :vars
    (
      ?AUTO_776 - LOCATION
      ?AUTO_779 - AIRPLANE
      ?AUTO_781 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_776 ) ( AIRPORT ?AUTO_775 ) ( AIRPLANE-AT ?AUTO_779 ?AUTO_776 ) ( not ( = ?AUTO_776 ?AUTO_775 ) ) ( OBJ-AT ?AUTO_774 ?AUTO_781 ) ( AIRPLANE-AT ?AUTO_779 ?AUTO_781 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_774 ?AUTO_779 ?AUTO_781 )
      ( DELIVER-PKG ?AUTO_774 ?AUTO_775 )
      ( DELIVER-PKG-VERIFY ?AUTO_774 ?AUTO_775 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_783 - OBJ
      ?AUTO_784 - LOCATION
    )
    :vars
    (
      ?AUTO_789 - LOCATION
      ?AUTO_791 - LOCATION
      ?AUTO_788 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_789 ) ( AIRPORT ?AUTO_784 ) ( not ( = ?AUTO_789 ?AUTO_784 ) ) ( OBJ-AT ?AUTO_783 ?AUTO_789 ) ( AIRPORT ?AUTO_791 ) ( AIRPLANE-AT ?AUTO_788 ?AUTO_791 ) ( not ( = ?AUTO_791 ?AUTO_789 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_788 ?AUTO_791 ?AUTO_789 )
      ( DELIVER-PKG ?AUTO_783 ?AUTO_784 )
      ( DELIVER-PKG-VERIFY ?AUTO_783 ?AUTO_784 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_801 - OBJ
      ?AUTO_802 - LOCATION
    )
    :vars
    (
      ?AUTO_807 - LOCATION
      ?AUTO_804 - LOCATION
      ?AUTO_805 - AIRPLANE
      ?AUTO_808 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_807 ) ( AIRPORT ?AUTO_802 ) ( not ( = ?AUTO_807 ?AUTO_802 ) ) ( AIRPORT ?AUTO_804 ) ( AIRPLANE-AT ?AUTO_805 ?AUTO_804 ) ( not ( = ?AUTO_804 ?AUTO_807 ) ) ( TRUCK-AT ?AUTO_808 ?AUTO_807 ) ( IN-TRUCK ?AUTO_801 ?AUTO_808 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_801 ?AUTO_808 ?AUTO_807 )
      ( DELIVER-PKG ?AUTO_801 ?AUTO_802 )
      ( DELIVER-PKG-VERIFY ?AUTO_801 ?AUTO_802 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_811 - OBJ
      ?AUTO_812 - LOCATION
    )
    :vars
    (
      ?AUTO_817 - LOCATION
      ?AUTO_815 - LOCATION
      ?AUTO_816 - AIRPLANE
      ?AUTO_818 - TRUCK
      ?AUTO_821 - LOCATION
      ?AUTO_820 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_817 ) ( AIRPORT ?AUTO_812 ) ( not ( = ?AUTO_817 ?AUTO_812 ) ) ( AIRPORT ?AUTO_815 ) ( AIRPLANE-AT ?AUTO_816 ?AUTO_815 ) ( not ( = ?AUTO_815 ?AUTO_817 ) ) ( IN-TRUCK ?AUTO_811 ?AUTO_818 ) ( TRUCK-AT ?AUTO_818 ?AUTO_821 ) ( IN-CITY ?AUTO_821 ?AUTO_820 ) ( IN-CITY ?AUTO_817 ?AUTO_820 ) ( not ( = ?AUTO_817 ?AUTO_821 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_818 ?AUTO_821 ?AUTO_817 ?AUTO_820 )
      ( DELIVER-PKG ?AUTO_811 ?AUTO_812 )
      ( DELIVER-PKG-VERIFY ?AUTO_811 ?AUTO_812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_835 - OBJ
      ?AUTO_836 - LOCATION
    )
    :vars
    (
      ?AUTO_838 - LOCATION
      ?AUTO_844 - LOCATION
      ?AUTO_845 - CITY
      ?AUTO_843 - LOCATION
      ?AUTO_837 - AIRPLANE
      ?AUTO_840 - TRUCK
      ?AUTO_848 - LOCATION
      ?AUTO_847 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_838 ) ( AIRPORT ?AUTO_836 ) ( not ( = ?AUTO_838 ?AUTO_836 ) ) ( IN-CITY ?AUTO_844 ?AUTO_845 ) ( IN-CITY ?AUTO_838 ?AUTO_845 ) ( not ( = ?AUTO_838 ?AUTO_844 ) ) ( AIRPORT ?AUTO_843 ) ( AIRPLANE-AT ?AUTO_837 ?AUTO_843 ) ( not ( = ?AUTO_843 ?AUTO_838 ) ) ( OBJ-AT ?AUTO_835 ?AUTO_844 ) ( TRUCK-AT ?AUTO_840 ?AUTO_848 ) ( IN-CITY ?AUTO_848 ?AUTO_847 ) ( IN-CITY ?AUTO_844 ?AUTO_847 ) ( not ( = ?AUTO_844 ?AUTO_848 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_840 ?AUTO_848 ?AUTO_844 ?AUTO_847 )
      ( DELIVER-PKG ?AUTO_835 ?AUTO_836 )
      ( DELIVER-PKG-VERIFY ?AUTO_835 ?AUTO_836 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_852 - OBJ
      ?AUTO_853 - LOCATION
    )
    :vars
    (
      ?AUTO_854 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_854 ?AUTO_853 ) ( IN-TRUCK ?AUTO_852 ?AUTO_854 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_852 ?AUTO_854 ?AUTO_853 )
      ( DELIVER-PKG-VERIFY ?AUTO_852 ?AUTO_853 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_873 - OBJ
      ?AUTO_874 - LOCATION
    )
    :vars
    (
      ?AUTO_875 - TRUCK
      ?AUTO_880 - LOCATION
      ?AUTO_879 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_873 ?AUTO_875 ) ( TRUCK-AT ?AUTO_875 ?AUTO_880 ) ( IN-CITY ?AUTO_880 ?AUTO_879 ) ( IN-CITY ?AUTO_874 ?AUTO_879 ) ( not ( = ?AUTO_874 ?AUTO_880 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_875 ?AUTO_880 ?AUTO_874 ?AUTO_879 )
      ( DELIVER-PKG ?AUTO_873 ?AUTO_874 )
      ( DELIVER-PKG-VERIFY ?AUTO_873 ?AUTO_874 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_882 - OBJ
      ?AUTO_883 - LOCATION
    )
    :vars
    (
      ?AUTO_886 - TRUCK
      ?AUTO_888 - LOCATION
      ?AUTO_887 - CITY
      ?AUTO_890 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_886 ?AUTO_888 ) ( IN-CITY ?AUTO_888 ?AUTO_887 ) ( IN-CITY ?AUTO_883 ?AUTO_887 ) ( not ( = ?AUTO_883 ?AUTO_888 ) ) ( TRUCK-AT ?AUTO_886 ?AUTO_890 ) ( OBJ-AT ?AUTO_882 ?AUTO_890 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_882 ?AUTO_886 ?AUTO_890 )
      ( DELIVER-PKG ?AUTO_882 ?AUTO_883 )
      ( DELIVER-PKG-VERIFY ?AUTO_882 ?AUTO_883 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_904 - OBJ
      ?AUTO_905 - LOCATION
    )
    :vars
    (
      ?AUTO_907 - LOCATION
      ?AUTO_909 - CITY
      ?AUTO_910 - TRUCK
      ?AUTO_914 - LOCATION
      ?AUTO_913 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_907 ?AUTO_909 ) ( IN-CITY ?AUTO_905 ?AUTO_909 ) ( not ( = ?AUTO_905 ?AUTO_907 ) ) ( OBJ-AT ?AUTO_904 ?AUTO_907 ) ( TRUCK-AT ?AUTO_910 ?AUTO_914 ) ( IN-CITY ?AUTO_914 ?AUTO_913 ) ( IN-CITY ?AUTO_907 ?AUTO_913 ) ( not ( = ?AUTO_907 ?AUTO_914 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_910 ?AUTO_914 ?AUTO_907 ?AUTO_913 )
      ( DELIVER-PKG ?AUTO_904 ?AUTO_905 )
      ( DELIVER-PKG-VERIFY ?AUTO_904 ?AUTO_905 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_938 - OBJ
      ?AUTO_939 - LOCATION
    )
    :vars
    (
      ?AUTO_940 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_940 ?AUTO_939 ) ( IN-TRUCK ?AUTO_938 ?AUTO_940 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_938 ?AUTO_940 ?AUTO_939 )
      ( DELIVER-PKG-VERIFY ?AUTO_938 ?AUTO_939 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_947 - OBJ
      ?AUTO_948 - LOCATION
    )
    :vars
    (
      ?AUTO_951 - TRUCK
      ?AUTO_954 - LOCATION
      ?AUTO_953 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_947 ?AUTO_951 ) ( TRUCK-AT ?AUTO_951 ?AUTO_954 ) ( IN-CITY ?AUTO_954 ?AUTO_953 ) ( IN-CITY ?AUTO_948 ?AUTO_953 ) ( not ( = ?AUTO_948 ?AUTO_954 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_951 ?AUTO_954 ?AUTO_948 ?AUTO_953 )
      ( DELIVER-PKG ?AUTO_947 ?AUTO_948 )
      ( DELIVER-PKG-VERIFY ?AUTO_947 ?AUTO_948 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_956 - OBJ
      ?AUTO_957 - LOCATION
    )
    :vars
    (
      ?AUTO_960 - TRUCK
      ?AUTO_962 - LOCATION
      ?AUTO_961 - CITY
      ?AUTO_964 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_960 ?AUTO_962 ) ( IN-CITY ?AUTO_962 ?AUTO_961 ) ( IN-CITY ?AUTO_957 ?AUTO_961 ) ( not ( = ?AUTO_957 ?AUTO_962 ) ) ( TRUCK-AT ?AUTO_960 ?AUTO_964 ) ( OBJ-AT ?AUTO_956 ?AUTO_964 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_956 ?AUTO_960 ?AUTO_964 )
      ( DELIVER-PKG ?AUTO_956 ?AUTO_957 )
      ( DELIVER-PKG-VERIFY ?AUTO_956 ?AUTO_957 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_966 - OBJ
      ?AUTO_967 - LOCATION
    )
    :vars
    (
      ?AUTO_970 - TRUCK
      ?AUTO_972 - LOCATION
      ?AUTO_971 - CITY
      ?AUTO_973 - LOCATION
      ?AUTO_974 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_970 ?AUTO_972 ) ( IN-CITY ?AUTO_972 ?AUTO_971 ) ( IN-CITY ?AUTO_967 ?AUTO_971 ) ( not ( = ?AUTO_967 ?AUTO_972 ) ) ( TRUCK-AT ?AUTO_970 ?AUTO_973 ) ( IN-AIRPLANE ?AUTO_966 ?AUTO_974 ) ( AIRPLANE-AT ?AUTO_974 ?AUTO_973 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_966 ?AUTO_974 ?AUTO_973 )
      ( DELIVER-PKG ?AUTO_966 ?AUTO_967 )
      ( DELIVER-PKG-VERIFY ?AUTO_966 ?AUTO_967 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_977 - OBJ
      ?AUTO_978 - LOCATION
    )
    :vars
    (
      ?AUTO_983 - TRUCK
      ?AUTO_980 - LOCATION
      ?AUTO_985 - CITY
      ?AUTO_982 - LOCATION
      ?AUTO_979 - AIRPLANE
      ?AUTO_987 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_983 ?AUTO_980 ) ( IN-CITY ?AUTO_980 ?AUTO_985 ) ( IN-CITY ?AUTO_978 ?AUTO_985 ) ( not ( = ?AUTO_978 ?AUTO_980 ) ) ( TRUCK-AT ?AUTO_983 ?AUTO_982 ) ( IN-AIRPLANE ?AUTO_977 ?AUTO_979 ) ( AIRPORT ?AUTO_987 ) ( AIRPORT ?AUTO_982 ) ( AIRPLANE-AT ?AUTO_979 ?AUTO_987 ) ( not ( = ?AUTO_987 ?AUTO_982 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_979 ?AUTO_987 ?AUTO_982 )
      ( DELIVER-PKG ?AUTO_977 ?AUTO_978 )
      ( DELIVER-PKG-VERIFY ?AUTO_977 ?AUTO_978 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1005 - OBJ
      ?AUTO_1006 - LOCATION
    )
    :vars
    (
      ?AUTO_1014 - TRUCK
      ?AUTO_1008 - LOCATION
      ?AUTO_1013 - CITY
      ?AUTO_1010 - LOCATION
      ?AUTO_1011 - LOCATION
      ?AUTO_1007 - AIRPLANE
      ?AUTO_1016 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1014 ?AUTO_1008 ) ( IN-CITY ?AUTO_1008 ?AUTO_1013 ) ( IN-CITY ?AUTO_1006 ?AUTO_1013 ) ( not ( = ?AUTO_1006 ?AUTO_1008 ) ) ( TRUCK-AT ?AUTO_1014 ?AUTO_1010 ) ( AIRPORT ?AUTO_1011 ) ( AIRPORT ?AUTO_1010 ) ( AIRPLANE-AT ?AUTO_1007 ?AUTO_1011 ) ( not ( = ?AUTO_1011 ?AUTO_1010 ) ) ( OBJ-AT ?AUTO_1005 ?AUTO_1016 ) ( AIRPLANE-AT ?AUTO_1007 ?AUTO_1016 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1005 ?AUTO_1007 ?AUTO_1016 )
      ( DELIVER-PKG ?AUTO_1005 ?AUTO_1006 )
      ( DELIVER-PKG-VERIFY ?AUTO_1005 ?AUTO_1006 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1018 - OBJ
      ?AUTO_1019 - LOCATION
    )
    :vars
    (
      ?AUTO_1022 - TRUCK
      ?AUTO_1027 - LOCATION
      ?AUTO_1024 - CITY
      ?AUTO_1023 - LOCATION
      ?AUTO_1028 - LOCATION
      ?AUTO_1030 - LOCATION
      ?AUTO_1026 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1022 ?AUTO_1027 ) ( IN-CITY ?AUTO_1027 ?AUTO_1024 ) ( IN-CITY ?AUTO_1019 ?AUTO_1024 ) ( not ( = ?AUTO_1019 ?AUTO_1027 ) ) ( TRUCK-AT ?AUTO_1022 ?AUTO_1023 ) ( AIRPORT ?AUTO_1028 ) ( AIRPORT ?AUTO_1023 ) ( not ( = ?AUTO_1028 ?AUTO_1023 ) ) ( OBJ-AT ?AUTO_1018 ?AUTO_1028 ) ( AIRPORT ?AUTO_1030 ) ( AIRPLANE-AT ?AUTO_1026 ?AUTO_1030 ) ( not ( = ?AUTO_1030 ?AUTO_1028 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1026 ?AUTO_1030 ?AUTO_1028 )
      ( DELIVER-PKG ?AUTO_1018 ?AUTO_1019 )
      ( DELIVER-PKG-VERIFY ?AUTO_1018 ?AUTO_1019 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1040 - OBJ
      ?AUTO_1041 - LOCATION
    )
    :vars
    (
      ?AUTO_1049 - TRUCK
      ?AUTO_1045 - LOCATION
      ?AUTO_1044 - CITY
      ?AUTO_1048 - LOCATION
      ?AUTO_1043 - LOCATION
      ?AUTO_1047 - LOCATION
      ?AUTO_1042 - AIRPLANE
      ?AUTO_1051 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1049 ?AUTO_1045 ) ( IN-CITY ?AUTO_1045 ?AUTO_1044 ) ( IN-CITY ?AUTO_1041 ?AUTO_1044 ) ( not ( = ?AUTO_1041 ?AUTO_1045 ) ) ( TRUCK-AT ?AUTO_1049 ?AUTO_1048 ) ( AIRPORT ?AUTO_1043 ) ( AIRPORT ?AUTO_1048 ) ( not ( = ?AUTO_1043 ?AUTO_1048 ) ) ( AIRPORT ?AUTO_1047 ) ( AIRPLANE-AT ?AUTO_1042 ?AUTO_1047 ) ( not ( = ?AUTO_1047 ?AUTO_1043 ) ) ( TRUCK-AT ?AUTO_1051 ?AUTO_1043 ) ( IN-TRUCK ?AUTO_1040 ?AUTO_1051 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1040 ?AUTO_1051 ?AUTO_1043 )
      ( DELIVER-PKG ?AUTO_1040 ?AUTO_1041 )
      ( DELIVER-PKG-VERIFY ?AUTO_1040 ?AUTO_1041 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1054 - OBJ
      ?AUTO_1055 - LOCATION
    )
    :vars
    (
      ?AUTO_1059 - TRUCK
      ?AUTO_1061 - LOCATION
      ?AUTO_1063 - CITY
      ?AUTO_1060 - LOCATION
      ?AUTO_1058 - LOCATION
      ?AUTO_1064 - LOCATION
      ?AUTO_1062 - AIRPLANE
      ?AUTO_1065 - TRUCK
      ?AUTO_1068 - LOCATION
      ?AUTO_1067 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1059 ?AUTO_1061 ) ( IN-CITY ?AUTO_1061 ?AUTO_1063 ) ( IN-CITY ?AUTO_1055 ?AUTO_1063 ) ( not ( = ?AUTO_1055 ?AUTO_1061 ) ) ( TRUCK-AT ?AUTO_1059 ?AUTO_1060 ) ( AIRPORT ?AUTO_1058 ) ( AIRPORT ?AUTO_1060 ) ( not ( = ?AUTO_1058 ?AUTO_1060 ) ) ( AIRPORT ?AUTO_1064 ) ( AIRPLANE-AT ?AUTO_1062 ?AUTO_1064 ) ( not ( = ?AUTO_1064 ?AUTO_1058 ) ) ( IN-TRUCK ?AUTO_1054 ?AUTO_1065 ) ( TRUCK-AT ?AUTO_1065 ?AUTO_1068 ) ( IN-CITY ?AUTO_1068 ?AUTO_1067 ) ( IN-CITY ?AUTO_1058 ?AUTO_1067 ) ( not ( = ?AUTO_1058 ?AUTO_1068 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1065 ?AUTO_1068 ?AUTO_1058 ?AUTO_1067 )
      ( DELIVER-PKG ?AUTO_1054 ?AUTO_1055 )
      ( DELIVER-PKG-VERIFY ?AUTO_1054 ?AUTO_1055 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1080 - OBJ
      ?AUTO_1081 - LOCATION
    )
    :vars
    (
      ?AUTO_1087 - TRUCK
      ?AUTO_1092 - LOCATION
      ?AUTO_1090 - CITY
      ?AUTO_1091 - LOCATION
      ?AUTO_1084 - LOCATION
      ?AUTO_1093 - LOCATION
      ?AUTO_1085 - AIRPLANE
      ?AUTO_1088 - TRUCK
      ?AUTO_1086 - LOCATION
      ?AUTO_1083 - CITY
      ?AUTO_1095 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1087 ?AUTO_1092 ) ( IN-CITY ?AUTO_1092 ?AUTO_1090 ) ( IN-CITY ?AUTO_1081 ?AUTO_1090 ) ( not ( = ?AUTO_1081 ?AUTO_1092 ) ) ( TRUCK-AT ?AUTO_1087 ?AUTO_1091 ) ( AIRPORT ?AUTO_1084 ) ( AIRPORT ?AUTO_1091 ) ( not ( = ?AUTO_1084 ?AUTO_1091 ) ) ( AIRPORT ?AUTO_1093 ) ( AIRPLANE-AT ?AUTO_1085 ?AUTO_1093 ) ( not ( = ?AUTO_1093 ?AUTO_1084 ) ) ( TRUCK-AT ?AUTO_1088 ?AUTO_1086 ) ( IN-CITY ?AUTO_1086 ?AUTO_1083 ) ( IN-CITY ?AUTO_1084 ?AUTO_1083 ) ( not ( = ?AUTO_1084 ?AUTO_1086 ) ) ( TRUCK-AT ?AUTO_1088 ?AUTO_1095 ) ( OBJ-AT ?AUTO_1080 ?AUTO_1095 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1080 ?AUTO_1088 ?AUTO_1095 )
      ( DELIVER-PKG ?AUTO_1080 ?AUTO_1081 )
      ( DELIVER-PKG-VERIFY ?AUTO_1080 ?AUTO_1081 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1097 - OBJ
      ?AUTO_1098 - LOCATION
    )
    :vars
    (
      ?AUTO_1105 - TRUCK
      ?AUTO_1106 - LOCATION
      ?AUTO_1109 - CITY
      ?AUTO_1102 - LOCATION
      ?AUTO_1110 - LOCATION
      ?AUTO_1107 - LOCATION
      ?AUTO_1101 - AIRPLANE
      ?AUTO_1111 - LOCATION
      ?AUTO_1104 - CITY
      ?AUTO_1108 - TRUCK
      ?AUTO_1114 - LOCATION
      ?AUTO_1113 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1105 ?AUTO_1106 ) ( IN-CITY ?AUTO_1106 ?AUTO_1109 ) ( IN-CITY ?AUTO_1098 ?AUTO_1109 ) ( not ( = ?AUTO_1098 ?AUTO_1106 ) ) ( TRUCK-AT ?AUTO_1105 ?AUTO_1102 ) ( AIRPORT ?AUTO_1110 ) ( AIRPORT ?AUTO_1102 ) ( not ( = ?AUTO_1110 ?AUTO_1102 ) ) ( AIRPORT ?AUTO_1107 ) ( AIRPLANE-AT ?AUTO_1101 ?AUTO_1107 ) ( not ( = ?AUTO_1107 ?AUTO_1110 ) ) ( IN-CITY ?AUTO_1111 ?AUTO_1104 ) ( IN-CITY ?AUTO_1110 ?AUTO_1104 ) ( not ( = ?AUTO_1110 ?AUTO_1111 ) ) ( OBJ-AT ?AUTO_1097 ?AUTO_1111 ) ( TRUCK-AT ?AUTO_1108 ?AUTO_1114 ) ( IN-CITY ?AUTO_1114 ?AUTO_1113 ) ( IN-CITY ?AUTO_1111 ?AUTO_1113 ) ( not ( = ?AUTO_1111 ?AUTO_1114 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1108 ?AUTO_1114 ?AUTO_1111 ?AUTO_1113 )
      ( DELIVER-PKG ?AUTO_1097 ?AUTO_1098 )
      ( DELIVER-PKG-VERIFY ?AUTO_1097 ?AUTO_1098 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1118 - OBJ
      ?AUTO_1119 - LOCATION
    )
    :vars
    (
      ?AUTO_1120 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1120 ?AUTO_1119 ) ( IN-TRUCK ?AUTO_1118 ?AUTO_1120 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1118 ?AUTO_1120 ?AUTO_1119 )
      ( DELIVER-PKG-VERIFY ?AUTO_1118 ?AUTO_1119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1167 - OBJ
      ?AUTO_1168 - LOCATION
    )
    :vars
    (
      ?AUTO_1170 - LOCATION
      ?AUTO_1169 - CITY
      ?AUTO_1171 - AIRPLANE
      ?AUTO_1174 - LOCATION
      ?AUTO_1173 - TRUCK
      ?AUTO_1179 - LOCATION
      ?AUTO_1178 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1170 ?AUTO_1169 ) ( IN-CITY ?AUTO_1168 ?AUTO_1169 ) ( not ( = ?AUTO_1168 ?AUTO_1170 ) ) ( IN-AIRPLANE ?AUTO_1167 ?AUTO_1171 ) ( AIRPORT ?AUTO_1174 ) ( AIRPORT ?AUTO_1170 ) ( AIRPLANE-AT ?AUTO_1171 ?AUTO_1174 ) ( not ( = ?AUTO_1174 ?AUTO_1170 ) ) ( TRUCK-AT ?AUTO_1173 ?AUTO_1179 ) ( IN-CITY ?AUTO_1179 ?AUTO_1178 ) ( IN-CITY ?AUTO_1170 ?AUTO_1178 ) ( not ( = ?AUTO_1170 ?AUTO_1179 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1173 ?AUTO_1179 ?AUTO_1170 ?AUTO_1178 )
      ( DELIVER-PKG ?AUTO_1167 ?AUTO_1168 )
      ( DELIVER-PKG-VERIFY ?AUTO_1167 ?AUTO_1168 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1181 - OBJ
      ?AUTO_1182 - LOCATION
    )
    :vars
    (
      ?AUTO_1188 - LOCATION
      ?AUTO_1186 - CITY
      ?AUTO_1185 - LOCATION
      ?AUTO_1187 - AIRPLANE
      ?AUTO_1189 - TRUCK
      ?AUTO_1190 - LOCATION
      ?AUTO_1191 - CITY
      ?AUTO_1193 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1188 ?AUTO_1186 ) ( IN-CITY ?AUTO_1182 ?AUTO_1186 ) ( not ( = ?AUTO_1182 ?AUTO_1188 ) ) ( AIRPORT ?AUTO_1185 ) ( AIRPORT ?AUTO_1188 ) ( AIRPLANE-AT ?AUTO_1187 ?AUTO_1185 ) ( not ( = ?AUTO_1185 ?AUTO_1188 ) ) ( TRUCK-AT ?AUTO_1189 ?AUTO_1190 ) ( IN-CITY ?AUTO_1190 ?AUTO_1191 ) ( IN-CITY ?AUTO_1188 ?AUTO_1191 ) ( not ( = ?AUTO_1188 ?AUTO_1190 ) ) ( OBJ-AT ?AUTO_1181 ?AUTO_1193 ) ( AIRPLANE-AT ?AUTO_1187 ?AUTO_1193 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1181 ?AUTO_1187 ?AUTO_1193 )
      ( DELIVER-PKG ?AUTO_1181 ?AUTO_1182 )
      ( DELIVER-PKG-VERIFY ?AUTO_1181 ?AUTO_1182 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1195 - OBJ
      ?AUTO_1196 - LOCATION
    )
    :vars
    (
      ?AUTO_1197 - LOCATION
      ?AUTO_1204 - CITY
      ?AUTO_1206 - LOCATION
      ?AUTO_1200 - TRUCK
      ?AUTO_1201 - LOCATION
      ?AUTO_1199 - CITY
      ?AUTO_1208 - LOCATION
      ?AUTO_1198 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1197 ?AUTO_1204 ) ( IN-CITY ?AUTO_1196 ?AUTO_1204 ) ( not ( = ?AUTO_1196 ?AUTO_1197 ) ) ( AIRPORT ?AUTO_1206 ) ( AIRPORT ?AUTO_1197 ) ( not ( = ?AUTO_1206 ?AUTO_1197 ) ) ( TRUCK-AT ?AUTO_1200 ?AUTO_1201 ) ( IN-CITY ?AUTO_1201 ?AUTO_1199 ) ( IN-CITY ?AUTO_1197 ?AUTO_1199 ) ( not ( = ?AUTO_1197 ?AUTO_1201 ) ) ( OBJ-AT ?AUTO_1195 ?AUTO_1206 ) ( AIRPORT ?AUTO_1208 ) ( AIRPLANE-AT ?AUTO_1198 ?AUTO_1208 ) ( not ( = ?AUTO_1208 ?AUTO_1206 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1198 ?AUTO_1208 ?AUTO_1206 )
      ( DELIVER-PKG ?AUTO_1195 ?AUTO_1196 )
      ( DELIVER-PKG-VERIFY ?AUTO_1195 ?AUTO_1196 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1222 - OBJ
      ?AUTO_1223 - LOCATION
    )
    :vars
    (
      ?AUTO_1224 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1224 ?AUTO_1223 ) ( IN-TRUCK ?AUTO_1222 ?AUTO_1224 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1222 ?AUTO_1224 ?AUTO_1223 )
      ( DELIVER-PKG-VERIFY ?AUTO_1222 ?AUTO_1223 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1227 - OBJ
      ?AUTO_1228 - LOCATION
    )
    :vars
    (
      ?AUTO_1231 - TRUCK
      ?AUTO_1234 - LOCATION
      ?AUTO_1233 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1227 ?AUTO_1231 ) ( TRUCK-AT ?AUTO_1231 ?AUTO_1234 ) ( IN-CITY ?AUTO_1234 ?AUTO_1233 ) ( IN-CITY ?AUTO_1228 ?AUTO_1233 ) ( not ( = ?AUTO_1228 ?AUTO_1234 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1231 ?AUTO_1234 ?AUTO_1228 ?AUTO_1233 )
      ( DELIVER-PKG ?AUTO_1227 ?AUTO_1228 )
      ( DELIVER-PKG-VERIFY ?AUTO_1227 ?AUTO_1228 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1300 - OBJ
      ?AUTO_1301 - LOCATION
    )
    :vars
    (
      ?AUTO_1302 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1302 ?AUTO_1301 ) ( IN-TRUCK ?AUTO_1300 ?AUTO_1302 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1300 ?AUTO_1302 ?AUTO_1301 )
      ( DELIVER-PKG-VERIFY ?AUTO_1300 ?AUTO_1301 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1373 - OBJ
      ?AUTO_1374 - LOCATION
    )
    :vars
    (
      ?AUTO_1375 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1375 ?AUTO_1374 ) ( IN-TRUCK ?AUTO_1373 ?AUTO_1375 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1373 ?AUTO_1375 ?AUTO_1374 )
      ( DELIVER-PKG-VERIFY ?AUTO_1373 ?AUTO_1374 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1378 - OBJ
      ?AUTO_1379 - LOCATION
    )
    :vars
    (
      ?AUTO_1380 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1378 ?AUTO_1380 ) ( AIRPLANE-AT ?AUTO_1380 ?AUTO_1379 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1378 ?AUTO_1380 ?AUTO_1379 )
      ( DELIVER-PKG-VERIFY ?AUTO_1378 ?AUTO_1379 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1383 - OBJ
      ?AUTO_1384 - LOCATION
    )
    :vars
    (
      ?AUTO_1387 - AIRPLANE
      ?AUTO_1389 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1383 ?AUTO_1387 ) ( AIRPORT ?AUTO_1389 ) ( AIRPORT ?AUTO_1384 ) ( AIRPLANE-AT ?AUTO_1387 ?AUTO_1389 ) ( not ( = ?AUTO_1389 ?AUTO_1384 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1387 ?AUTO_1389 ?AUTO_1384 )
      ( DELIVER-PKG ?AUTO_1383 ?AUTO_1384 )
      ( DELIVER-PKG-VERIFY ?AUTO_1383 ?AUTO_1384 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1395 - OBJ
      ?AUTO_1396 - LOCATION
    )
    :vars
    (
      ?AUTO_1397 - LOCATION
      ?AUTO_1400 - AIRPLANE
      ?AUTO_1402 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1397 ) ( AIRPORT ?AUTO_1396 ) ( AIRPLANE-AT ?AUTO_1400 ?AUTO_1397 ) ( not ( = ?AUTO_1397 ?AUTO_1396 ) ) ( OBJ-AT ?AUTO_1395 ?AUTO_1402 ) ( AIRPLANE-AT ?AUTO_1400 ?AUTO_1402 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1395 ?AUTO_1400 ?AUTO_1402 )
      ( DELIVER-PKG ?AUTO_1395 ?AUTO_1396 )
      ( DELIVER-PKG-VERIFY ?AUTO_1395 ?AUTO_1396 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1406 - OBJ
      ?AUTO_1407 - LOCATION
    )
    :vars
    (
      ?AUTO_1408 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1406 ?AUTO_1408 ) ( AIRPLANE-AT ?AUTO_1408 ?AUTO_1407 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1406 ?AUTO_1408 ?AUTO_1407 )
      ( DELIVER-PKG-VERIFY ?AUTO_1406 ?AUTO_1407 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1411 - OBJ
      ?AUTO_1412 - LOCATION
    )
    :vars
    (
      ?AUTO_1415 - AIRPLANE
      ?AUTO_1417 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1411 ?AUTO_1415 ) ( AIRPORT ?AUTO_1417 ) ( AIRPORT ?AUTO_1412 ) ( AIRPLANE-AT ?AUTO_1415 ?AUTO_1417 ) ( not ( = ?AUTO_1417 ?AUTO_1412 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1415 ?AUTO_1417 ?AUTO_1412 )
      ( DELIVER-PKG ?AUTO_1411 ?AUTO_1412 )
      ( DELIVER-PKG-VERIFY ?AUTO_1411 ?AUTO_1412 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1429 - OBJ
      ?AUTO_1430 - LOCATION
    )
    :vars
    (
      ?AUTO_1434 - LOCATION
      ?AUTO_1431 - AIRPLANE
      ?AUTO_1436 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1434 ) ( AIRPORT ?AUTO_1430 ) ( AIRPLANE-AT ?AUTO_1431 ?AUTO_1434 ) ( not ( = ?AUTO_1434 ?AUTO_1430 ) ) ( OBJ-AT ?AUTO_1429 ?AUTO_1436 ) ( AIRPLANE-AT ?AUTO_1431 ?AUTO_1436 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1429 ?AUTO_1431 ?AUTO_1436 )
      ( DELIVER-PKG ?AUTO_1429 ?AUTO_1430 )
      ( DELIVER-PKG-VERIFY ?AUTO_1429 ?AUTO_1430 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1438 - OBJ
      ?AUTO_1439 - LOCATION
    )
    :vars
    (
      ?AUTO_1444 - LOCATION
      ?AUTO_1446 - LOCATION
      ?AUTO_1442 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1444 ) ( AIRPORT ?AUTO_1439 ) ( not ( = ?AUTO_1444 ?AUTO_1439 ) ) ( OBJ-AT ?AUTO_1438 ?AUTO_1444 ) ( AIRPORT ?AUTO_1446 ) ( AIRPLANE-AT ?AUTO_1442 ?AUTO_1446 ) ( not ( = ?AUTO_1446 ?AUTO_1444 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1442 ?AUTO_1446 ?AUTO_1444 )
      ( DELIVER-PKG ?AUTO_1438 ?AUTO_1439 )
      ( DELIVER-PKG-VERIFY ?AUTO_1438 ?AUTO_1439 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1452 - OBJ
      ?AUTO_1453 - LOCATION
    )
    :vars
    (
      ?AUTO_1454 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1454 ?AUTO_1453 ) ( IN-TRUCK ?AUTO_1452 ?AUTO_1454 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1452 ?AUTO_1454 ?AUTO_1453 )
      ( DELIVER-PKG-VERIFY ?AUTO_1452 ?AUTO_1453 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1469 - OBJ
      ?AUTO_1470 - LOCATION
    )
    :vars
    (
      ?AUTO_1473 - TRUCK
      ?AUTO_1476 - LOCATION
      ?AUTO_1475 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1469 ?AUTO_1473 ) ( TRUCK-AT ?AUTO_1473 ?AUTO_1476 ) ( IN-CITY ?AUTO_1476 ?AUTO_1475 ) ( IN-CITY ?AUTO_1470 ?AUTO_1475 ) ( not ( = ?AUTO_1470 ?AUTO_1476 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1473 ?AUTO_1476 ?AUTO_1470 ?AUTO_1475 )
      ( DELIVER-PKG ?AUTO_1469 ?AUTO_1470 )
      ( DELIVER-PKG-VERIFY ?AUTO_1469 ?AUTO_1470 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1478 - OBJ
      ?AUTO_1479 - LOCATION
    )
    :vars
    (
      ?AUTO_1482 - TRUCK
      ?AUTO_1484 - LOCATION
      ?AUTO_1483 - CITY
      ?AUTO_1486 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1482 ?AUTO_1484 ) ( IN-CITY ?AUTO_1484 ?AUTO_1483 ) ( IN-CITY ?AUTO_1479 ?AUTO_1483 ) ( not ( = ?AUTO_1479 ?AUTO_1484 ) ) ( TRUCK-AT ?AUTO_1482 ?AUTO_1486 ) ( OBJ-AT ?AUTO_1478 ?AUTO_1486 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1478 ?AUTO_1482 ?AUTO_1486 )
      ( DELIVER-PKG ?AUTO_1478 ?AUTO_1479 )
      ( DELIVER-PKG-VERIFY ?AUTO_1478 ?AUTO_1479 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1488 - OBJ
      ?AUTO_1489 - LOCATION
    )
    :vars
    (
      ?AUTO_1495 - LOCATION
      ?AUTO_1493 - CITY
      ?AUTO_1492 - TRUCK
      ?AUTO_1498 - LOCATION
      ?AUTO_1497 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1495 ?AUTO_1493 ) ( IN-CITY ?AUTO_1489 ?AUTO_1493 ) ( not ( = ?AUTO_1489 ?AUTO_1495 ) ) ( OBJ-AT ?AUTO_1488 ?AUTO_1495 ) ( TRUCK-AT ?AUTO_1492 ?AUTO_1498 ) ( IN-CITY ?AUTO_1498 ?AUTO_1497 ) ( IN-CITY ?AUTO_1495 ?AUTO_1497 ) ( not ( = ?AUTO_1495 ?AUTO_1498 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1492 ?AUTO_1498 ?AUTO_1495 ?AUTO_1497 )
      ( DELIVER-PKG ?AUTO_1488 ?AUTO_1489 )
      ( DELIVER-PKG-VERIFY ?AUTO_1488 ?AUTO_1489 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1512 - OBJ
      ?AUTO_1513 - LOCATION
    )
    :vars
    (
      ?AUTO_1514 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1514 ?AUTO_1513 ) ( IN-TRUCK ?AUTO_1512 ?AUTO_1514 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1512 ?AUTO_1514 ?AUTO_1513 )
      ( DELIVER-PKG-VERIFY ?AUTO_1512 ?AUTO_1513 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1519 - OBJ
      ?AUTO_1520 - LOCATION
    )
    :vars
    (
      ?AUTO_1523 - TRUCK
      ?AUTO_1526 - LOCATION
      ?AUTO_1525 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1519 ?AUTO_1523 ) ( TRUCK-AT ?AUTO_1523 ?AUTO_1526 ) ( IN-CITY ?AUTO_1526 ?AUTO_1525 ) ( IN-CITY ?AUTO_1520 ?AUTO_1525 ) ( not ( = ?AUTO_1520 ?AUTO_1526 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1523 ?AUTO_1526 ?AUTO_1520 ?AUTO_1525 )
      ( DELIVER-PKG ?AUTO_1519 ?AUTO_1520 )
      ( DELIVER-PKG-VERIFY ?AUTO_1519 ?AUTO_1520 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1528 - OBJ
      ?AUTO_1529 - LOCATION
    )
    :vars
    (
      ?AUTO_1532 - TRUCK
      ?AUTO_1534 - LOCATION
      ?AUTO_1533 - CITY
      ?AUTO_1536 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1532 ?AUTO_1534 ) ( IN-CITY ?AUTO_1534 ?AUTO_1533 ) ( IN-CITY ?AUTO_1529 ?AUTO_1533 ) ( not ( = ?AUTO_1529 ?AUTO_1534 ) ) ( TRUCK-AT ?AUTO_1532 ?AUTO_1536 ) ( OBJ-AT ?AUTO_1528 ?AUTO_1536 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1528 ?AUTO_1532 ?AUTO_1536 )
      ( DELIVER-PKG ?AUTO_1528 ?AUTO_1529 )
      ( DELIVER-PKG-VERIFY ?AUTO_1528 ?AUTO_1529 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1540 - OBJ
      ?AUTO_1541 - LOCATION
    )
    :vars
    (
      ?AUTO_1547 - LOCATION
      ?AUTO_1545 - CITY
      ?AUTO_1542 - TRUCK
      ?AUTO_1550 - LOCATION
      ?AUTO_1549 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1547 ?AUTO_1545 ) ( IN-CITY ?AUTO_1541 ?AUTO_1545 ) ( not ( = ?AUTO_1541 ?AUTO_1547 ) ) ( OBJ-AT ?AUTO_1540 ?AUTO_1547 ) ( TRUCK-AT ?AUTO_1542 ?AUTO_1550 ) ( IN-CITY ?AUTO_1550 ?AUTO_1549 ) ( IN-CITY ?AUTO_1547 ?AUTO_1549 ) ( not ( = ?AUTO_1547 ?AUTO_1550 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1542 ?AUTO_1550 ?AUTO_1547 ?AUTO_1549 )
      ( DELIVER-PKG ?AUTO_1540 ?AUTO_1541 )
      ( DELIVER-PKG-VERIFY ?AUTO_1540 ?AUTO_1541 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1574 - OBJ
      ?AUTO_1575 - LOCATION
    )
    :vars
    (
      ?AUTO_1576 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1576 ?AUTO_1575 ) ( IN-TRUCK ?AUTO_1574 ?AUTO_1576 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1574 ?AUTO_1576 ?AUTO_1575 )
      ( DELIVER-PKG-VERIFY ?AUTO_1574 ?AUTO_1575 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1579 - OBJ
      ?AUTO_1580 - LOCATION
    )
    :vars
    (
      ?AUTO_1583 - TRUCK
      ?AUTO_1586 - LOCATION
      ?AUTO_1585 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1579 ?AUTO_1583 ) ( TRUCK-AT ?AUTO_1583 ?AUTO_1586 ) ( IN-CITY ?AUTO_1586 ?AUTO_1585 ) ( IN-CITY ?AUTO_1580 ?AUTO_1585 ) ( not ( = ?AUTO_1580 ?AUTO_1586 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1583 ?AUTO_1586 ?AUTO_1580 ?AUTO_1585 )
      ( DELIVER-PKG ?AUTO_1579 ?AUTO_1580 )
      ( DELIVER-PKG-VERIFY ?AUTO_1579 ?AUTO_1580 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1588 - OBJ
      ?AUTO_1589 - LOCATION
    )
    :vars
    (
      ?AUTO_1592 - TRUCK
      ?AUTO_1594 - LOCATION
      ?AUTO_1593 - CITY
      ?AUTO_1596 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1592 ?AUTO_1594 ) ( IN-CITY ?AUTO_1594 ?AUTO_1593 ) ( IN-CITY ?AUTO_1589 ?AUTO_1593 ) ( not ( = ?AUTO_1589 ?AUTO_1594 ) ) ( TRUCK-AT ?AUTO_1592 ?AUTO_1596 ) ( OBJ-AT ?AUTO_1588 ?AUTO_1596 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1588 ?AUTO_1592 ?AUTO_1596 )
      ( DELIVER-PKG ?AUTO_1588 ?AUTO_1589 )
      ( DELIVER-PKG-VERIFY ?AUTO_1588 ?AUTO_1589 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1598 - OBJ
      ?AUTO_1599 - LOCATION
    )
    :vars
    (
      ?AUTO_1605 - LOCATION
      ?AUTO_1604 - CITY
      ?AUTO_1603 - TRUCK
      ?AUTO_1608 - LOCATION
      ?AUTO_1607 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1605 ?AUTO_1604 ) ( IN-CITY ?AUTO_1599 ?AUTO_1604 ) ( not ( = ?AUTO_1599 ?AUTO_1605 ) ) ( OBJ-AT ?AUTO_1598 ?AUTO_1605 ) ( TRUCK-AT ?AUTO_1603 ?AUTO_1608 ) ( IN-CITY ?AUTO_1608 ?AUTO_1607 ) ( IN-CITY ?AUTO_1605 ?AUTO_1607 ) ( not ( = ?AUTO_1605 ?AUTO_1608 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1603 ?AUTO_1608 ?AUTO_1605 ?AUTO_1607 )
      ( DELIVER-PKG ?AUTO_1598 ?AUTO_1599 )
      ( DELIVER-PKG-VERIFY ?AUTO_1598 ?AUTO_1599 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1644 - OBJ
      ?AUTO_1645 - LOCATION
    )
    :vars
    (
      ?AUTO_1646 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1646 ?AUTO_1645 ) ( IN-TRUCK ?AUTO_1644 ?AUTO_1646 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1644 ?AUTO_1646 ?AUTO_1645 )
      ( DELIVER-PKG-VERIFY ?AUTO_1644 ?AUTO_1645 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1653 - OBJ
      ?AUTO_1654 - LOCATION
    )
    :vars
    (
      ?AUTO_1657 - TRUCK
      ?AUTO_1660 - LOCATION
      ?AUTO_1659 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1653 ?AUTO_1657 ) ( TRUCK-AT ?AUTO_1657 ?AUTO_1660 ) ( IN-CITY ?AUTO_1660 ?AUTO_1659 ) ( IN-CITY ?AUTO_1654 ?AUTO_1659 ) ( not ( = ?AUTO_1654 ?AUTO_1660 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1657 ?AUTO_1660 ?AUTO_1654 ?AUTO_1659 )
      ( DELIVER-PKG ?AUTO_1653 ?AUTO_1654 )
      ( DELIVER-PKG-VERIFY ?AUTO_1653 ?AUTO_1654 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1682 - OBJ
      ?AUTO_1683 - LOCATION
    )
    :vars
    (
      ?AUTO_1687 - LOCATION
      ?AUTO_1690 - CITY
      ?AUTO_1689 - TRUCK
      ?AUTO_1685 - LOCATION
      ?AUTO_1684 - CITY
      ?AUTO_1691 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1687 ?AUTO_1690 ) ( IN-CITY ?AUTO_1683 ?AUTO_1690 ) ( not ( = ?AUTO_1683 ?AUTO_1687 ) ) ( TRUCK-AT ?AUTO_1689 ?AUTO_1685 ) ( IN-CITY ?AUTO_1685 ?AUTO_1684 ) ( IN-CITY ?AUTO_1687 ?AUTO_1684 ) ( not ( = ?AUTO_1687 ?AUTO_1685 ) ) ( IN-AIRPLANE ?AUTO_1682 ?AUTO_1691 ) ( AIRPLANE-AT ?AUTO_1691 ?AUTO_1687 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1682 ?AUTO_1691 ?AUTO_1687 )
      ( DELIVER-PKG ?AUTO_1682 ?AUTO_1683 )
      ( DELIVER-PKG-VERIFY ?AUTO_1682 ?AUTO_1683 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1694 - OBJ
      ?AUTO_1695 - LOCATION
    )
    :vars
    (
      ?AUTO_1702 - LOCATION
      ?AUTO_1699 - CITY
      ?AUTO_1701 - TRUCK
      ?AUTO_1698 - LOCATION
      ?AUTO_1700 - CITY
      ?AUTO_1703 - AIRPLANE
      ?AUTO_1705 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1702 ?AUTO_1699 ) ( IN-CITY ?AUTO_1695 ?AUTO_1699 ) ( not ( = ?AUTO_1695 ?AUTO_1702 ) ) ( TRUCK-AT ?AUTO_1701 ?AUTO_1698 ) ( IN-CITY ?AUTO_1698 ?AUTO_1700 ) ( IN-CITY ?AUTO_1702 ?AUTO_1700 ) ( not ( = ?AUTO_1702 ?AUTO_1698 ) ) ( IN-AIRPLANE ?AUTO_1694 ?AUTO_1703 ) ( AIRPORT ?AUTO_1705 ) ( AIRPORT ?AUTO_1702 ) ( AIRPLANE-AT ?AUTO_1703 ?AUTO_1705 ) ( not ( = ?AUTO_1705 ?AUTO_1702 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1703 ?AUTO_1705 ?AUTO_1702 )
      ( DELIVER-PKG ?AUTO_1694 ?AUTO_1695 )
      ( DELIVER-PKG-VERIFY ?AUTO_1694 ?AUTO_1695 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1717 - OBJ
      ?AUTO_1718 - LOCATION
    )
    :vars
    (
      ?AUTO_1726 - LOCATION
      ?AUTO_1721 - CITY
      ?AUTO_1725 - TRUCK
      ?AUTO_1724 - LOCATION
      ?AUTO_1727 - CITY
      ?AUTO_1719 - LOCATION
      ?AUTO_1723 - AIRPLANE
      ?AUTO_1729 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1726 ?AUTO_1721 ) ( IN-CITY ?AUTO_1718 ?AUTO_1721 ) ( not ( = ?AUTO_1718 ?AUTO_1726 ) ) ( TRUCK-AT ?AUTO_1725 ?AUTO_1724 ) ( IN-CITY ?AUTO_1724 ?AUTO_1727 ) ( IN-CITY ?AUTO_1726 ?AUTO_1727 ) ( not ( = ?AUTO_1726 ?AUTO_1724 ) ) ( AIRPORT ?AUTO_1719 ) ( AIRPORT ?AUTO_1726 ) ( AIRPLANE-AT ?AUTO_1723 ?AUTO_1719 ) ( not ( = ?AUTO_1719 ?AUTO_1726 ) ) ( OBJ-AT ?AUTO_1717 ?AUTO_1729 ) ( AIRPLANE-AT ?AUTO_1723 ?AUTO_1729 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1717 ?AUTO_1723 ?AUTO_1729 )
      ( DELIVER-PKG ?AUTO_1717 ?AUTO_1718 )
      ( DELIVER-PKG-VERIFY ?AUTO_1717 ?AUTO_1718 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1731 - OBJ
      ?AUTO_1732 - LOCATION
    )
    :vars
    (
      ?AUTO_1736 - LOCATION
      ?AUTO_1739 - CITY
      ?AUTO_1740 - TRUCK
      ?AUTO_1734 - LOCATION
      ?AUTO_1737 - CITY
      ?AUTO_1742 - LOCATION
      ?AUTO_1744 - LOCATION
      ?AUTO_1735 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1736 ?AUTO_1739 ) ( IN-CITY ?AUTO_1732 ?AUTO_1739 ) ( not ( = ?AUTO_1732 ?AUTO_1736 ) ) ( TRUCK-AT ?AUTO_1740 ?AUTO_1734 ) ( IN-CITY ?AUTO_1734 ?AUTO_1737 ) ( IN-CITY ?AUTO_1736 ?AUTO_1737 ) ( not ( = ?AUTO_1736 ?AUTO_1734 ) ) ( AIRPORT ?AUTO_1742 ) ( AIRPORT ?AUTO_1736 ) ( not ( = ?AUTO_1742 ?AUTO_1736 ) ) ( OBJ-AT ?AUTO_1731 ?AUTO_1742 ) ( AIRPORT ?AUTO_1744 ) ( AIRPLANE-AT ?AUTO_1735 ?AUTO_1744 ) ( not ( = ?AUTO_1744 ?AUTO_1742 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1735 ?AUTO_1744 ?AUTO_1742 )
      ( DELIVER-PKG ?AUTO_1731 ?AUTO_1732 )
      ( DELIVER-PKG-VERIFY ?AUTO_1731 ?AUTO_1732 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1750 - OBJ
      ?AUTO_1751 - LOCATION
    )
    :vars
    (
      ?AUTO_1752 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1750 ?AUTO_1752 ) ( AIRPLANE-AT ?AUTO_1752 ?AUTO_1751 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1750 ?AUTO_1752 ?AUTO_1751 )
      ( DELIVER-PKG-VERIFY ?AUTO_1750 ?AUTO_1751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1757 - OBJ
      ?AUTO_1758 - LOCATION
    )
    :vars
    (
      ?AUTO_1760 - AIRPLANE
      ?AUTO_1763 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1757 ?AUTO_1760 ) ( AIRPORT ?AUTO_1763 ) ( AIRPORT ?AUTO_1758 ) ( AIRPLANE-AT ?AUTO_1760 ?AUTO_1763 ) ( not ( = ?AUTO_1763 ?AUTO_1758 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1760 ?AUTO_1763 ?AUTO_1758 )
      ( DELIVER-PKG ?AUTO_1757 ?AUTO_1758 )
      ( DELIVER-PKG-VERIFY ?AUTO_1757 ?AUTO_1758 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1765 - OBJ
      ?AUTO_1766 - LOCATION
    )
    :vars
    (
      ?AUTO_1767 - LOCATION
      ?AUTO_1768 - AIRPLANE
      ?AUTO_1772 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1767 ) ( AIRPORT ?AUTO_1766 ) ( AIRPLANE-AT ?AUTO_1768 ?AUTO_1767 ) ( not ( = ?AUTO_1767 ?AUTO_1766 ) ) ( OBJ-AT ?AUTO_1765 ?AUTO_1772 ) ( AIRPLANE-AT ?AUTO_1768 ?AUTO_1772 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1765 ?AUTO_1768 ?AUTO_1772 )
      ( DELIVER-PKG ?AUTO_1765 ?AUTO_1766 )
      ( DELIVER-PKG-VERIFY ?AUTO_1765 ?AUTO_1766 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1776 - OBJ
      ?AUTO_1777 - LOCATION
    )
    :vars
    (
      ?AUTO_1780 - LOCATION
      ?AUTO_1778 - AIRPLANE
      ?AUTO_1781 - LOCATION
      ?AUTO_1783 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1780 ) ( AIRPORT ?AUTO_1777 ) ( AIRPLANE-AT ?AUTO_1778 ?AUTO_1780 ) ( not ( = ?AUTO_1780 ?AUTO_1777 ) ) ( AIRPLANE-AT ?AUTO_1778 ?AUTO_1781 ) ( TRUCK-AT ?AUTO_1783 ?AUTO_1781 ) ( IN-TRUCK ?AUTO_1776 ?AUTO_1783 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1776 ?AUTO_1783 ?AUTO_1781 )
      ( DELIVER-PKG ?AUTO_1776 ?AUTO_1777 )
      ( DELIVER-PKG-VERIFY ?AUTO_1776 ?AUTO_1777 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1786 - OBJ
      ?AUTO_1787 - LOCATION
    )
    :vars
    (
      ?AUTO_1792 - LOCATION
      ?AUTO_1790 - AIRPLANE
      ?AUTO_1791 - LOCATION
      ?AUTO_1793 - TRUCK
      ?AUTO_1796 - LOCATION
      ?AUTO_1795 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1792 ) ( AIRPORT ?AUTO_1787 ) ( AIRPLANE-AT ?AUTO_1790 ?AUTO_1792 ) ( not ( = ?AUTO_1792 ?AUTO_1787 ) ) ( AIRPLANE-AT ?AUTO_1790 ?AUTO_1791 ) ( IN-TRUCK ?AUTO_1786 ?AUTO_1793 ) ( TRUCK-AT ?AUTO_1793 ?AUTO_1796 ) ( IN-CITY ?AUTO_1796 ?AUTO_1795 ) ( IN-CITY ?AUTO_1791 ?AUTO_1795 ) ( not ( = ?AUTO_1791 ?AUTO_1796 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1793 ?AUTO_1796 ?AUTO_1791 ?AUTO_1795 )
      ( DELIVER-PKG ?AUTO_1786 ?AUTO_1787 )
      ( DELIVER-PKG-VERIFY ?AUTO_1786 ?AUTO_1787 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1798 - OBJ
      ?AUTO_1799 - LOCATION
    )
    :vars
    (
      ?AUTO_1804 - LOCATION
      ?AUTO_1806 - AIRPLANE
      ?AUTO_1805 - LOCATION
      ?AUTO_1803 - TRUCK
      ?AUTO_1807 - LOCATION
      ?AUTO_1801 - CITY
      ?AUTO_1809 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1804 ) ( AIRPORT ?AUTO_1799 ) ( AIRPLANE-AT ?AUTO_1806 ?AUTO_1804 ) ( not ( = ?AUTO_1804 ?AUTO_1799 ) ) ( AIRPLANE-AT ?AUTO_1806 ?AUTO_1805 ) ( TRUCK-AT ?AUTO_1803 ?AUTO_1807 ) ( IN-CITY ?AUTO_1807 ?AUTO_1801 ) ( IN-CITY ?AUTO_1805 ?AUTO_1801 ) ( not ( = ?AUTO_1805 ?AUTO_1807 ) ) ( TRUCK-AT ?AUTO_1803 ?AUTO_1809 ) ( OBJ-AT ?AUTO_1798 ?AUTO_1809 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1798 ?AUTO_1803 ?AUTO_1809 )
      ( DELIVER-PKG ?AUTO_1798 ?AUTO_1799 )
      ( DELIVER-PKG-VERIFY ?AUTO_1798 ?AUTO_1799 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1811 - OBJ
      ?AUTO_1812 - LOCATION
    )
    :vars
    (
      ?AUTO_1817 - LOCATION
      ?AUTO_1820 - AIRPLANE
      ?AUTO_1818 - LOCATION
      ?AUTO_1816 - LOCATION
      ?AUTO_1819 - CITY
      ?AUTO_1821 - TRUCK
      ?AUTO_1824 - LOCATION
      ?AUTO_1823 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1817 ) ( AIRPORT ?AUTO_1812 ) ( AIRPLANE-AT ?AUTO_1820 ?AUTO_1817 ) ( not ( = ?AUTO_1817 ?AUTO_1812 ) ) ( AIRPLANE-AT ?AUTO_1820 ?AUTO_1818 ) ( IN-CITY ?AUTO_1816 ?AUTO_1819 ) ( IN-CITY ?AUTO_1818 ?AUTO_1819 ) ( not ( = ?AUTO_1818 ?AUTO_1816 ) ) ( OBJ-AT ?AUTO_1811 ?AUTO_1816 ) ( TRUCK-AT ?AUTO_1821 ?AUTO_1824 ) ( IN-CITY ?AUTO_1824 ?AUTO_1823 ) ( IN-CITY ?AUTO_1816 ?AUTO_1823 ) ( not ( = ?AUTO_1816 ?AUTO_1824 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1821 ?AUTO_1824 ?AUTO_1816 ?AUTO_1823 )
      ( DELIVER-PKG ?AUTO_1811 ?AUTO_1812 )
      ( DELIVER-PKG-VERIFY ?AUTO_1811 ?AUTO_1812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1840 - OBJ
      ?AUTO_1841 - LOCATION
    )
    :vars
    (
      ?AUTO_1849 - LOCATION
      ?AUTO_1842 - LOCATION
      ?AUTO_1845 - CITY
      ?AUTO_1851 - TRUCK
      ?AUTO_1848 - LOCATION
      ?AUTO_1843 - CITY
      ?AUTO_1853 - LOCATION
      ?AUTO_1846 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1849 ) ( AIRPORT ?AUTO_1841 ) ( not ( = ?AUTO_1849 ?AUTO_1841 ) ) ( IN-CITY ?AUTO_1842 ?AUTO_1845 ) ( IN-CITY ?AUTO_1849 ?AUTO_1845 ) ( not ( = ?AUTO_1849 ?AUTO_1842 ) ) ( OBJ-AT ?AUTO_1840 ?AUTO_1842 ) ( TRUCK-AT ?AUTO_1851 ?AUTO_1848 ) ( IN-CITY ?AUTO_1848 ?AUTO_1843 ) ( IN-CITY ?AUTO_1842 ?AUTO_1843 ) ( not ( = ?AUTO_1842 ?AUTO_1848 ) ) ( AIRPORT ?AUTO_1853 ) ( AIRPLANE-AT ?AUTO_1846 ?AUTO_1853 ) ( not ( = ?AUTO_1853 ?AUTO_1849 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1846 ?AUTO_1853 ?AUTO_1849 )
      ( DELIVER-PKG ?AUTO_1840 ?AUTO_1841 )
      ( DELIVER-PKG-VERIFY ?AUTO_1840 ?AUTO_1841 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1873 - OBJ
      ?AUTO_1874 - LOCATION
    )
    :vars
    (
      ?AUTO_1875 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1875 ?AUTO_1874 ) ( IN-TRUCK ?AUTO_1873 ?AUTO_1875 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1873 ?AUTO_1875 ?AUTO_1874 )
      ( DELIVER-PKG-VERIFY ?AUTO_1873 ?AUTO_1874 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1878 - OBJ
      ?AUTO_1879 - LOCATION
    )
    :vars
    (
      ?AUTO_1882 - TRUCK
      ?AUTO_1885 - LOCATION
      ?AUTO_1884 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1878 ?AUTO_1882 ) ( TRUCK-AT ?AUTO_1882 ?AUTO_1885 ) ( IN-CITY ?AUTO_1885 ?AUTO_1884 ) ( IN-CITY ?AUTO_1879 ?AUTO_1884 ) ( not ( = ?AUTO_1879 ?AUTO_1885 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1882 ?AUTO_1885 ?AUTO_1879 ?AUTO_1884 )
      ( DELIVER-PKG ?AUTO_1878 ?AUTO_1879 )
      ( DELIVER-PKG-VERIFY ?AUTO_1878 ?AUTO_1879 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1887 - OBJ
      ?AUTO_1888 - LOCATION
    )
    :vars
    (
      ?AUTO_1891 - TRUCK
      ?AUTO_1893 - LOCATION
      ?AUTO_1892 - CITY
      ?AUTO_1895 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1891 ?AUTO_1893 ) ( IN-CITY ?AUTO_1893 ?AUTO_1892 ) ( IN-CITY ?AUTO_1888 ?AUTO_1892 ) ( not ( = ?AUTO_1888 ?AUTO_1893 ) ) ( TRUCK-AT ?AUTO_1891 ?AUTO_1895 ) ( OBJ-AT ?AUTO_1887 ?AUTO_1895 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1887 ?AUTO_1891 ?AUTO_1895 )
      ( DELIVER-PKG ?AUTO_1887 ?AUTO_1888 )
      ( DELIVER-PKG-VERIFY ?AUTO_1887 ?AUTO_1888 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1897 - OBJ
      ?AUTO_1898 - LOCATION
    )
    :vars
    (
      ?AUTO_1904 - LOCATION
      ?AUTO_1903 - CITY
      ?AUTO_1902 - TRUCK
      ?AUTO_1907 - LOCATION
      ?AUTO_1906 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1904 ?AUTO_1903 ) ( IN-CITY ?AUTO_1898 ?AUTO_1903 ) ( not ( = ?AUTO_1898 ?AUTO_1904 ) ) ( OBJ-AT ?AUTO_1897 ?AUTO_1904 ) ( TRUCK-AT ?AUTO_1902 ?AUTO_1907 ) ( IN-CITY ?AUTO_1907 ?AUTO_1906 ) ( IN-CITY ?AUTO_1904 ?AUTO_1906 ) ( not ( = ?AUTO_1904 ?AUTO_1907 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1902 ?AUTO_1907 ?AUTO_1904 ?AUTO_1906 )
      ( DELIVER-PKG ?AUTO_1897 ?AUTO_1898 )
      ( DELIVER-PKG-VERIFY ?AUTO_1897 ?AUTO_1898 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1910 - OBJ
      ?AUTO_1911 - LOCATION
    )
    :vars
    (
      ?AUTO_1912 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1912 ?AUTO_1911 ) ( IN-TRUCK ?AUTO_1910 ?AUTO_1912 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1910 ?AUTO_1912 ?AUTO_1911 )
      ( DELIVER-PKG-VERIFY ?AUTO_1910 ?AUTO_1911 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1915 - OBJ
      ?AUTO_1916 - LOCATION
    )
    :vars
    (
      ?AUTO_1919 - TRUCK
      ?AUTO_1922 - LOCATION
      ?AUTO_1921 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1915 ?AUTO_1919 ) ( TRUCK-AT ?AUTO_1919 ?AUTO_1922 ) ( IN-CITY ?AUTO_1922 ?AUTO_1921 ) ( IN-CITY ?AUTO_1916 ?AUTO_1921 ) ( not ( = ?AUTO_1916 ?AUTO_1922 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1919 ?AUTO_1922 ?AUTO_1916 ?AUTO_1921 )
      ( DELIVER-PKG ?AUTO_1915 ?AUTO_1916 )
      ( DELIVER-PKG-VERIFY ?AUTO_1915 ?AUTO_1916 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1924 - OBJ
      ?AUTO_1925 - LOCATION
    )
    :vars
    (
      ?AUTO_1928 - TRUCK
      ?AUTO_1930 - LOCATION
      ?AUTO_1929 - CITY
      ?AUTO_1932 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1928 ?AUTO_1930 ) ( IN-CITY ?AUTO_1930 ?AUTO_1929 ) ( IN-CITY ?AUTO_1925 ?AUTO_1929 ) ( not ( = ?AUTO_1925 ?AUTO_1930 ) ) ( TRUCK-AT ?AUTO_1928 ?AUTO_1932 ) ( OBJ-AT ?AUTO_1924 ?AUTO_1932 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1924 ?AUTO_1928 ?AUTO_1932 )
      ( DELIVER-PKG ?AUTO_1924 ?AUTO_1925 )
      ( DELIVER-PKG-VERIFY ?AUTO_1924 ?AUTO_1925 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1934 - OBJ
      ?AUTO_1935 - LOCATION
    )
    :vars
    (
      ?AUTO_1941 - LOCATION
      ?AUTO_1940 - CITY
      ?AUTO_1939 - TRUCK
      ?AUTO_1944 - LOCATION
      ?AUTO_1943 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1941 ?AUTO_1940 ) ( IN-CITY ?AUTO_1935 ?AUTO_1940 ) ( not ( = ?AUTO_1935 ?AUTO_1941 ) ) ( OBJ-AT ?AUTO_1934 ?AUTO_1941 ) ( TRUCK-AT ?AUTO_1939 ?AUTO_1944 ) ( IN-CITY ?AUTO_1944 ?AUTO_1943 ) ( IN-CITY ?AUTO_1941 ?AUTO_1943 ) ( not ( = ?AUTO_1941 ?AUTO_1944 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1939 ?AUTO_1944 ?AUTO_1941 ?AUTO_1943 )
      ( DELIVER-PKG ?AUTO_1934 ?AUTO_1935 )
      ( DELIVER-PKG-VERIFY ?AUTO_1934 ?AUTO_1935 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1948 - OBJ
      ?AUTO_1949 - LOCATION
    )
    :vars
    (
      ?AUTO_1950 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1950 ?AUTO_1949 ) ( IN-TRUCK ?AUTO_1948 ?AUTO_1950 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1948 ?AUTO_1950 ?AUTO_1949 )
      ( DELIVER-PKG-VERIFY ?AUTO_1948 ?AUTO_1949 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1959 - OBJ
      ?AUTO_1960 - LOCATION
    )
    :vars
    (
      ?AUTO_1963 - TRUCK
      ?AUTO_1966 - LOCATION
      ?AUTO_1965 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1959 ?AUTO_1963 ) ( TRUCK-AT ?AUTO_1963 ?AUTO_1966 ) ( IN-CITY ?AUTO_1966 ?AUTO_1965 ) ( IN-CITY ?AUTO_1960 ?AUTO_1965 ) ( not ( = ?AUTO_1960 ?AUTO_1966 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1963 ?AUTO_1966 ?AUTO_1960 ?AUTO_1965 )
      ( DELIVER-PKG ?AUTO_1959 ?AUTO_1960 )
      ( DELIVER-PKG-VERIFY ?AUTO_1959 ?AUTO_1960 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1968 - OBJ
      ?AUTO_1969 - LOCATION
    )
    :vars
    (
      ?AUTO_1972 - TRUCK
      ?AUTO_1974 - LOCATION
      ?AUTO_1973 - CITY
      ?AUTO_1976 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1972 ?AUTO_1974 ) ( IN-CITY ?AUTO_1974 ?AUTO_1973 ) ( IN-CITY ?AUTO_1969 ?AUTO_1973 ) ( not ( = ?AUTO_1969 ?AUTO_1974 ) ) ( TRUCK-AT ?AUTO_1972 ?AUTO_1976 ) ( OBJ-AT ?AUTO_1968 ?AUTO_1976 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1968 ?AUTO_1972 ?AUTO_1976 )
      ( DELIVER-PKG ?AUTO_1968 ?AUTO_1969 )
      ( DELIVER-PKG-VERIFY ?AUTO_1968 ?AUTO_1969 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1994 - OBJ
      ?AUTO_1995 - LOCATION
    )
    :vars
    (
      ?AUTO_1996 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1996 ?AUTO_1995 ) ( IN-TRUCK ?AUTO_1994 ?AUTO_1996 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1994 ?AUTO_1996 ?AUTO_1995 )
      ( DELIVER-PKG-VERIFY ?AUTO_1994 ?AUTO_1995 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1999 - OBJ
      ?AUTO_2000 - LOCATION
    )
    :vars
    (
      ?AUTO_2003 - TRUCK
      ?AUTO_2006 - LOCATION
      ?AUTO_2005 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1999 ?AUTO_2003 ) ( TRUCK-AT ?AUTO_2003 ?AUTO_2006 ) ( IN-CITY ?AUTO_2006 ?AUTO_2005 ) ( IN-CITY ?AUTO_2000 ?AUTO_2005 ) ( not ( = ?AUTO_2000 ?AUTO_2006 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2003 ?AUTO_2006 ?AUTO_2000 ?AUTO_2005 )
      ( DELIVER-PKG ?AUTO_1999 ?AUTO_2000 )
      ( DELIVER-PKG-VERIFY ?AUTO_1999 ?AUTO_2000 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2008 - OBJ
      ?AUTO_2009 - LOCATION
    )
    :vars
    (
      ?AUTO_2012 - TRUCK
      ?AUTO_2014 - LOCATION
      ?AUTO_2013 - CITY
      ?AUTO_2016 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2012 ?AUTO_2014 ) ( IN-CITY ?AUTO_2014 ?AUTO_2013 ) ( IN-CITY ?AUTO_2009 ?AUTO_2013 ) ( not ( = ?AUTO_2009 ?AUTO_2014 ) ) ( TRUCK-AT ?AUTO_2012 ?AUTO_2016 ) ( OBJ-AT ?AUTO_2008 ?AUTO_2016 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2008 ?AUTO_2012 ?AUTO_2016 )
      ( DELIVER-PKG ?AUTO_2008 ?AUTO_2009 )
      ( DELIVER-PKG-VERIFY ?AUTO_2008 ?AUTO_2009 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2018 - OBJ
      ?AUTO_2019 - LOCATION
    )
    :vars
    (
      ?AUTO_2025 - LOCATION
      ?AUTO_2024 - CITY
      ?AUTO_2023 - TRUCK
      ?AUTO_2028 - LOCATION
      ?AUTO_2027 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2025 ?AUTO_2024 ) ( IN-CITY ?AUTO_2019 ?AUTO_2024 ) ( not ( = ?AUTO_2019 ?AUTO_2025 ) ) ( OBJ-AT ?AUTO_2018 ?AUTO_2025 ) ( TRUCK-AT ?AUTO_2023 ?AUTO_2028 ) ( IN-CITY ?AUTO_2028 ?AUTO_2027 ) ( IN-CITY ?AUTO_2025 ?AUTO_2027 ) ( not ( = ?AUTO_2025 ?AUTO_2028 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2023 ?AUTO_2028 ?AUTO_2025 ?AUTO_2027 )
      ( DELIVER-PKG ?AUTO_2018 ?AUTO_2019 )
      ( DELIVER-PKG-VERIFY ?AUTO_2018 ?AUTO_2019 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2058 - OBJ
      ?AUTO_2059 - LOCATION
    )
    :vars
    (
      ?AUTO_2060 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2058 ?AUTO_2060 ) ( AIRPLANE-AT ?AUTO_2060 ?AUTO_2059 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2058 ?AUTO_2060 ?AUTO_2059 )
      ( DELIVER-PKG-VERIFY ?AUTO_2058 ?AUTO_2059 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2063 - OBJ
      ?AUTO_2064 - LOCATION
    )
    :vars
    (
      ?AUTO_2067 - AIRPLANE
      ?AUTO_2069 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2063 ?AUTO_2067 ) ( AIRPORT ?AUTO_2069 ) ( AIRPORT ?AUTO_2064 ) ( AIRPLANE-AT ?AUTO_2067 ?AUTO_2069 ) ( not ( = ?AUTO_2069 ?AUTO_2064 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2067 ?AUTO_2069 ?AUTO_2064 )
      ( DELIVER-PKG ?AUTO_2063 ?AUTO_2064 )
      ( DELIVER-PKG-VERIFY ?AUTO_2063 ?AUTO_2064 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2075 - OBJ
      ?AUTO_2076 - LOCATION
    )
    :vars
    (
      ?AUTO_2077 - LOCATION
      ?AUTO_2080 - AIRPLANE
      ?AUTO_2082 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2077 ) ( AIRPORT ?AUTO_2076 ) ( AIRPLANE-AT ?AUTO_2080 ?AUTO_2077 ) ( not ( = ?AUTO_2077 ?AUTO_2076 ) ) ( OBJ-AT ?AUTO_2075 ?AUTO_2082 ) ( AIRPLANE-AT ?AUTO_2080 ?AUTO_2082 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2075 ?AUTO_2080 ?AUTO_2082 )
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
      ?AUTO_2090 - LOCATION
      ?AUTO_2092 - LOCATION
      ?AUTO_2089 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2090 ) ( AIRPORT ?AUTO_2085 ) ( not ( = ?AUTO_2090 ?AUTO_2085 ) ) ( OBJ-AT ?AUTO_2084 ?AUTO_2090 ) ( AIRPORT ?AUTO_2092 ) ( AIRPLANE-AT ?AUTO_2089 ?AUTO_2092 ) ( not ( = ?AUTO_2092 ?AUTO_2090 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2089 ?AUTO_2092 ?AUTO_2090 )
      ( DELIVER-PKG ?AUTO_2084 ?AUTO_2085 )
      ( DELIVER-PKG-VERIFY ?AUTO_2084 ?AUTO_2085 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2120 - OBJ
      ?AUTO_2121 - LOCATION
    )
    :vars
    (
      ?AUTO_2124 - LOCATION
      ?AUTO_2126 - LOCATION
      ?AUTO_2125 - AIRPLANE
      ?AUTO_2127 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2124 ) ( AIRPORT ?AUTO_2121 ) ( not ( = ?AUTO_2124 ?AUTO_2121 ) ) ( AIRPORT ?AUTO_2126 ) ( AIRPLANE-AT ?AUTO_2125 ?AUTO_2126 ) ( not ( = ?AUTO_2126 ?AUTO_2124 ) ) ( TRUCK-AT ?AUTO_2127 ?AUTO_2124 ) ( IN-TRUCK ?AUTO_2120 ?AUTO_2127 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2120 ?AUTO_2127 ?AUTO_2124 )
      ( DELIVER-PKG ?AUTO_2120 ?AUTO_2121 )
      ( DELIVER-PKG-VERIFY ?AUTO_2120 ?AUTO_2121 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2130 - OBJ
      ?AUTO_2131 - LOCATION
    )
    :vars
    (
      ?AUTO_2136 - LOCATION
      ?AUTO_2135 - LOCATION
      ?AUTO_2134 - AIRPLANE
      ?AUTO_2137 - TRUCK
      ?AUTO_2140 - LOCATION
      ?AUTO_2139 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2136 ) ( AIRPORT ?AUTO_2131 ) ( not ( = ?AUTO_2136 ?AUTO_2131 ) ) ( AIRPORT ?AUTO_2135 ) ( AIRPLANE-AT ?AUTO_2134 ?AUTO_2135 ) ( not ( = ?AUTO_2135 ?AUTO_2136 ) ) ( IN-TRUCK ?AUTO_2130 ?AUTO_2137 ) ( TRUCK-AT ?AUTO_2137 ?AUTO_2140 ) ( IN-CITY ?AUTO_2140 ?AUTO_2139 ) ( IN-CITY ?AUTO_2136 ?AUTO_2139 ) ( not ( = ?AUTO_2136 ?AUTO_2140 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2137 ?AUTO_2140 ?AUTO_2136 ?AUTO_2139 )
      ( DELIVER-PKG ?AUTO_2130 ?AUTO_2131 )
      ( DELIVER-PKG-VERIFY ?AUTO_2130 ?AUTO_2131 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2142 - OBJ
      ?AUTO_2143 - LOCATION
    )
    :vars
    (
      ?AUTO_2145 - LOCATION
      ?AUTO_2149 - LOCATION
      ?AUTO_2144 - AIRPLANE
      ?AUTO_2150 - TRUCK
      ?AUTO_2151 - LOCATION
      ?AUTO_2146 - CITY
      ?AUTO_2153 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2145 ) ( AIRPORT ?AUTO_2143 ) ( not ( = ?AUTO_2145 ?AUTO_2143 ) ) ( AIRPORT ?AUTO_2149 ) ( AIRPLANE-AT ?AUTO_2144 ?AUTO_2149 ) ( not ( = ?AUTO_2149 ?AUTO_2145 ) ) ( TRUCK-AT ?AUTO_2150 ?AUTO_2151 ) ( IN-CITY ?AUTO_2151 ?AUTO_2146 ) ( IN-CITY ?AUTO_2145 ?AUTO_2146 ) ( not ( = ?AUTO_2145 ?AUTO_2151 ) ) ( TRUCK-AT ?AUTO_2150 ?AUTO_2153 ) ( OBJ-AT ?AUTO_2142 ?AUTO_2153 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2142 ?AUTO_2150 ?AUTO_2153 )
      ( DELIVER-PKG ?AUTO_2142 ?AUTO_2143 )
      ( DELIVER-PKG-VERIFY ?AUTO_2142 ?AUTO_2143 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2155 - OBJ
      ?AUTO_2156 - LOCATION
    )
    :vars
    (
      ?AUTO_2163 - LOCATION
      ?AUTO_2161 - LOCATION
      ?AUTO_2164 - AIRPLANE
      ?AUTO_2159 - LOCATION
      ?AUTO_2162 - CITY
      ?AUTO_2165 - TRUCK
      ?AUTO_2168 - LOCATION
      ?AUTO_2167 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2163 ) ( AIRPORT ?AUTO_2156 ) ( not ( = ?AUTO_2163 ?AUTO_2156 ) ) ( AIRPORT ?AUTO_2161 ) ( AIRPLANE-AT ?AUTO_2164 ?AUTO_2161 ) ( not ( = ?AUTO_2161 ?AUTO_2163 ) ) ( IN-CITY ?AUTO_2159 ?AUTO_2162 ) ( IN-CITY ?AUTO_2163 ?AUTO_2162 ) ( not ( = ?AUTO_2163 ?AUTO_2159 ) ) ( OBJ-AT ?AUTO_2155 ?AUTO_2159 ) ( TRUCK-AT ?AUTO_2165 ?AUTO_2168 ) ( IN-CITY ?AUTO_2168 ?AUTO_2167 ) ( IN-CITY ?AUTO_2159 ?AUTO_2167 ) ( not ( = ?AUTO_2159 ?AUTO_2168 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2165 ?AUTO_2168 ?AUTO_2159 ?AUTO_2167 )
      ( DELIVER-PKG ?AUTO_2155 ?AUTO_2156 )
      ( DELIVER-PKG-VERIFY ?AUTO_2155 ?AUTO_2156 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2172 - OBJ
      ?AUTO_2173 - LOCATION
    )
    :vars
    (
      ?AUTO_2174 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2172 ?AUTO_2174 ) ( AIRPLANE-AT ?AUTO_2174 ?AUTO_2173 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2172 ?AUTO_2174 ?AUTO_2173 )
      ( DELIVER-PKG-VERIFY ?AUTO_2172 ?AUTO_2173 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2179 - OBJ
      ?AUTO_2180 - LOCATION
    )
    :vars
    (
      ?AUTO_2183 - AIRPLANE
      ?AUTO_2185 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2179 ?AUTO_2183 ) ( AIRPORT ?AUTO_2185 ) ( AIRPORT ?AUTO_2180 ) ( AIRPLANE-AT ?AUTO_2183 ?AUTO_2185 ) ( not ( = ?AUTO_2185 ?AUTO_2180 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2183 ?AUTO_2185 ?AUTO_2180 )
      ( DELIVER-PKG ?AUTO_2179 ?AUTO_2180 )
      ( DELIVER-PKG-VERIFY ?AUTO_2179 ?AUTO_2180 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2191 - OBJ
      ?AUTO_2192 - LOCATION
    )
    :vars
    (
      ?AUTO_2194 - LOCATION
      ?AUTO_2196 - AIRPLANE
      ?AUTO_2198 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2194 ) ( AIRPORT ?AUTO_2192 ) ( AIRPLANE-AT ?AUTO_2196 ?AUTO_2194 ) ( not ( = ?AUTO_2194 ?AUTO_2192 ) ) ( OBJ-AT ?AUTO_2191 ?AUTO_2198 ) ( AIRPLANE-AT ?AUTO_2196 ?AUTO_2198 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2191 ?AUTO_2196 ?AUTO_2198 )
      ( DELIVER-PKG ?AUTO_2191 ?AUTO_2192 )
      ( DELIVER-PKG-VERIFY ?AUTO_2191 ?AUTO_2192 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2200 - OBJ
      ?AUTO_2201 - LOCATION
    )
    :vars
    (
      ?AUTO_2206 - LOCATION
      ?AUTO_2208 - LOCATION
      ?AUTO_2205 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2206 ) ( AIRPORT ?AUTO_2201 ) ( not ( = ?AUTO_2206 ?AUTO_2201 ) ) ( OBJ-AT ?AUTO_2200 ?AUTO_2206 ) ( AIRPORT ?AUTO_2208 ) ( AIRPLANE-AT ?AUTO_2205 ?AUTO_2208 ) ( not ( = ?AUTO_2208 ?AUTO_2206 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2205 ?AUTO_2208 ?AUTO_2206 )
      ( DELIVER-PKG ?AUTO_2200 ?AUTO_2201 )
      ( DELIVER-PKG-VERIFY ?AUTO_2200 ?AUTO_2201 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2250 - OBJ
      ?AUTO_2251 - LOCATION
    )
    :vars
    (
      ?AUTO_2252 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2252 ?AUTO_2251 ) ( IN-TRUCK ?AUTO_2250 ?AUTO_2252 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2250 ?AUTO_2252 ?AUTO_2251 )
      ( DELIVER-PKG-VERIFY ?AUTO_2250 ?AUTO_2251 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2255 - OBJ
      ?AUTO_2256 - LOCATION
    )
    :vars
    (
      ?AUTO_2259 - TRUCK
      ?AUTO_2262 - LOCATION
      ?AUTO_2261 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2255 ?AUTO_2259 ) ( TRUCK-AT ?AUTO_2259 ?AUTO_2262 ) ( IN-CITY ?AUTO_2262 ?AUTO_2261 ) ( IN-CITY ?AUTO_2256 ?AUTO_2261 ) ( not ( = ?AUTO_2256 ?AUTO_2262 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2259 ?AUTO_2262 ?AUTO_2256 ?AUTO_2261 )
      ( DELIVER-PKG ?AUTO_2255 ?AUTO_2256 )
      ( DELIVER-PKG-VERIFY ?AUTO_2255 ?AUTO_2256 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2318 - OBJ
      ?AUTO_2319 - LOCATION
    )
    :vars
    (
      ?AUTO_2320 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2320 ?AUTO_2319 ) ( IN-TRUCK ?AUTO_2318 ?AUTO_2320 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2318 ?AUTO_2320 ?AUTO_2319 )
      ( DELIVER-PKG-VERIFY ?AUTO_2318 ?AUTO_2319 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2381 - OBJ
      ?AUTO_2382 - LOCATION
    )
    :vars
    (
      ?AUTO_2383 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2383 ?AUTO_2382 ) ( IN-TRUCK ?AUTO_2381 ?AUTO_2383 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2381 ?AUTO_2383 ?AUTO_2382 )
      ( DELIVER-PKG-VERIFY ?AUTO_2381 ?AUTO_2382 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2446 - OBJ
      ?AUTO_2447 - LOCATION
    )
    :vars
    (
      ?AUTO_2448 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2448 ?AUTO_2447 ) ( IN-TRUCK ?AUTO_2446 ?AUTO_2448 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2446 ?AUTO_2448 ?AUTO_2447 )
      ( DELIVER-PKG-VERIFY ?AUTO_2446 ?AUTO_2447 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2451 - OBJ
      ?AUTO_2452 - LOCATION
    )
    :vars
    (
      ?AUTO_2455 - TRUCK
      ?AUTO_2458 - LOCATION
      ?AUTO_2457 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2451 ?AUTO_2455 ) ( TRUCK-AT ?AUTO_2455 ?AUTO_2458 ) ( IN-CITY ?AUTO_2458 ?AUTO_2457 ) ( IN-CITY ?AUTO_2452 ?AUTO_2457 ) ( not ( = ?AUTO_2452 ?AUTO_2458 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2455 ?AUTO_2458 ?AUTO_2452 ?AUTO_2457 )
      ( DELIVER-PKG ?AUTO_2451 ?AUTO_2452 )
      ( DELIVER-PKG-VERIFY ?AUTO_2451 ?AUTO_2452 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2460 - OBJ
      ?AUTO_2461 - LOCATION
    )
    :vars
    (
      ?AUTO_2464 - TRUCK
      ?AUTO_2466 - LOCATION
      ?AUTO_2465 - CITY
      ?AUTO_2468 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2464 ?AUTO_2466 ) ( IN-CITY ?AUTO_2466 ?AUTO_2465 ) ( IN-CITY ?AUTO_2461 ?AUTO_2465 ) ( not ( = ?AUTO_2461 ?AUTO_2466 ) ) ( TRUCK-AT ?AUTO_2464 ?AUTO_2468 ) ( OBJ-AT ?AUTO_2460 ?AUTO_2468 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2460 ?AUTO_2464 ?AUTO_2468 )
      ( DELIVER-PKG ?AUTO_2460 ?AUTO_2461 )
      ( DELIVER-PKG-VERIFY ?AUTO_2460 ?AUTO_2461 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2476 - OBJ
      ?AUTO_2477 - LOCATION
    )
    :vars
    (
      ?AUTO_2480 - LOCATION
      ?AUTO_2483 - CITY
      ?AUTO_2481 - TRUCK
      ?AUTO_2486 - LOCATION
      ?AUTO_2485 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2480 ?AUTO_2483 ) ( IN-CITY ?AUTO_2477 ?AUTO_2483 ) ( not ( = ?AUTO_2477 ?AUTO_2480 ) ) ( OBJ-AT ?AUTO_2476 ?AUTO_2480 ) ( TRUCK-AT ?AUTO_2481 ?AUTO_2486 ) ( IN-CITY ?AUTO_2486 ?AUTO_2485 ) ( IN-CITY ?AUTO_2480 ?AUTO_2485 ) ( not ( = ?AUTO_2480 ?AUTO_2486 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2481 ?AUTO_2486 ?AUTO_2480 ?AUTO_2485 )
      ( DELIVER-PKG ?AUTO_2476 ?AUTO_2477 )
      ( DELIVER-PKG-VERIFY ?AUTO_2476 ?AUTO_2477 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2494 - OBJ
      ?AUTO_2495 - LOCATION
    )
    :vars
    (
      ?AUTO_2502 - LOCATION
      ?AUTO_2499 - CITY
      ?AUTO_2498 - TRUCK
      ?AUTO_2500 - LOCATION
      ?AUTO_2496 - CITY
      ?AUTO_2503 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2502 ?AUTO_2499 ) ( IN-CITY ?AUTO_2495 ?AUTO_2499 ) ( not ( = ?AUTO_2495 ?AUTO_2502 ) ) ( TRUCK-AT ?AUTO_2498 ?AUTO_2500 ) ( IN-CITY ?AUTO_2500 ?AUTO_2496 ) ( IN-CITY ?AUTO_2502 ?AUTO_2496 ) ( not ( = ?AUTO_2502 ?AUTO_2500 ) ) ( IN-AIRPLANE ?AUTO_2494 ?AUTO_2503 ) ( AIRPLANE-AT ?AUTO_2503 ?AUTO_2502 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2494 ?AUTO_2503 ?AUTO_2502 )
      ( DELIVER-PKG ?AUTO_2494 ?AUTO_2495 )
      ( DELIVER-PKG-VERIFY ?AUTO_2494 ?AUTO_2495 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2506 - OBJ
      ?AUTO_2507 - LOCATION
    )
    :vars
    (
      ?AUTO_2512 - LOCATION
      ?AUTO_2513 - CITY
      ?AUTO_2514 - TRUCK
      ?AUTO_2511 - LOCATION
      ?AUTO_2510 - CITY
      ?AUTO_2515 - AIRPLANE
      ?AUTO_2517 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2512 ?AUTO_2513 ) ( IN-CITY ?AUTO_2507 ?AUTO_2513 ) ( not ( = ?AUTO_2507 ?AUTO_2512 ) ) ( TRUCK-AT ?AUTO_2514 ?AUTO_2511 ) ( IN-CITY ?AUTO_2511 ?AUTO_2510 ) ( IN-CITY ?AUTO_2512 ?AUTO_2510 ) ( not ( = ?AUTO_2512 ?AUTO_2511 ) ) ( IN-AIRPLANE ?AUTO_2506 ?AUTO_2515 ) ( AIRPORT ?AUTO_2517 ) ( AIRPORT ?AUTO_2512 ) ( AIRPLANE-AT ?AUTO_2515 ?AUTO_2517 ) ( not ( = ?AUTO_2517 ?AUTO_2512 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2515 ?AUTO_2517 ?AUTO_2512 )
      ( DELIVER-PKG ?AUTO_2506 ?AUTO_2507 )
      ( DELIVER-PKG-VERIFY ?AUTO_2506 ?AUTO_2507 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2523 - OBJ
      ?AUTO_2524 - LOCATION
    )
    :vars
    (
      ?AUTO_2525 - LOCATION
      ?AUTO_2528 - CITY
      ?AUTO_2529 - TRUCK
      ?AUTO_2527 - LOCATION
      ?AUTO_2532 - CITY
      ?AUTO_2531 - LOCATION
      ?AUTO_2526 - AIRPLANE
      ?AUTO_2535 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2525 ?AUTO_2528 ) ( IN-CITY ?AUTO_2524 ?AUTO_2528 ) ( not ( = ?AUTO_2524 ?AUTO_2525 ) ) ( TRUCK-AT ?AUTO_2529 ?AUTO_2527 ) ( IN-CITY ?AUTO_2527 ?AUTO_2532 ) ( IN-CITY ?AUTO_2525 ?AUTO_2532 ) ( not ( = ?AUTO_2525 ?AUTO_2527 ) ) ( AIRPORT ?AUTO_2531 ) ( AIRPORT ?AUTO_2525 ) ( AIRPLANE-AT ?AUTO_2526 ?AUTO_2531 ) ( not ( = ?AUTO_2531 ?AUTO_2525 ) ) ( OBJ-AT ?AUTO_2523 ?AUTO_2535 ) ( AIRPLANE-AT ?AUTO_2526 ?AUTO_2535 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2523 ?AUTO_2526 ?AUTO_2535 )
      ( DELIVER-PKG ?AUTO_2523 ?AUTO_2524 )
      ( DELIVER-PKG-VERIFY ?AUTO_2523 ?AUTO_2524 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2537 - OBJ
      ?AUTO_2538 - LOCATION
    )
    :vars
    (
      ?AUTO_2542 - LOCATION
      ?AUTO_2545 - CITY
      ?AUTO_2544 - TRUCK
      ?AUTO_2546 - LOCATION
      ?AUTO_2541 - CITY
      ?AUTO_2548 - LOCATION
      ?AUTO_2550 - LOCATION
      ?AUTO_2547 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2542 ?AUTO_2545 ) ( IN-CITY ?AUTO_2538 ?AUTO_2545 ) ( not ( = ?AUTO_2538 ?AUTO_2542 ) ) ( TRUCK-AT ?AUTO_2544 ?AUTO_2546 ) ( IN-CITY ?AUTO_2546 ?AUTO_2541 ) ( IN-CITY ?AUTO_2542 ?AUTO_2541 ) ( not ( = ?AUTO_2542 ?AUTO_2546 ) ) ( AIRPORT ?AUTO_2548 ) ( AIRPORT ?AUTO_2542 ) ( not ( = ?AUTO_2548 ?AUTO_2542 ) ) ( OBJ-AT ?AUTO_2537 ?AUTO_2548 ) ( AIRPORT ?AUTO_2550 ) ( AIRPLANE-AT ?AUTO_2547 ?AUTO_2550 ) ( not ( = ?AUTO_2550 ?AUTO_2548 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2547 ?AUTO_2550 ?AUTO_2548 )
      ( DELIVER-PKG ?AUTO_2537 ?AUTO_2538 )
      ( DELIVER-PKG-VERIFY ?AUTO_2537 ?AUTO_2538 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2578 - OBJ
      ?AUTO_2579 - LOCATION
    )
    :vars
    (
      ?AUTO_2585 - LOCATION
      ?AUTO_2583 - CITY
      ?AUTO_2587 - TRUCK
      ?AUTO_2586 - LOCATION
      ?AUTO_2589 - CITY
      ?AUTO_2581 - LOCATION
      ?AUTO_2588 - LOCATION
      ?AUTO_2580 - AIRPLANE
      ?AUTO_2590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2585 ?AUTO_2583 ) ( IN-CITY ?AUTO_2579 ?AUTO_2583 ) ( not ( = ?AUTO_2579 ?AUTO_2585 ) ) ( TRUCK-AT ?AUTO_2587 ?AUTO_2586 ) ( IN-CITY ?AUTO_2586 ?AUTO_2589 ) ( IN-CITY ?AUTO_2585 ?AUTO_2589 ) ( not ( = ?AUTO_2585 ?AUTO_2586 ) ) ( AIRPORT ?AUTO_2581 ) ( AIRPORT ?AUTO_2585 ) ( not ( = ?AUTO_2581 ?AUTO_2585 ) ) ( AIRPORT ?AUTO_2588 ) ( AIRPLANE-AT ?AUTO_2580 ?AUTO_2588 ) ( not ( = ?AUTO_2588 ?AUTO_2581 ) ) ( TRUCK-AT ?AUTO_2590 ?AUTO_2581 ) ( IN-TRUCK ?AUTO_2578 ?AUTO_2590 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2578 ?AUTO_2590 ?AUTO_2581 )
      ( DELIVER-PKG ?AUTO_2578 ?AUTO_2579 )
      ( DELIVER-PKG-VERIFY ?AUTO_2578 ?AUTO_2579 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2593 - OBJ
      ?AUTO_2594 - LOCATION
    )
    :vars
    (
      ?AUTO_2597 - LOCATION
      ?AUTO_2601 - CITY
      ?AUTO_2604 - TRUCK
      ?AUTO_2598 - LOCATION
      ?AUTO_2602 - CITY
      ?AUTO_2603 - LOCATION
      ?AUTO_2600 - LOCATION
      ?AUTO_2599 - AIRPLANE
      ?AUTO_2605 - TRUCK
      ?AUTO_2608 - LOCATION
      ?AUTO_2607 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2597 ?AUTO_2601 ) ( IN-CITY ?AUTO_2594 ?AUTO_2601 ) ( not ( = ?AUTO_2594 ?AUTO_2597 ) ) ( TRUCK-AT ?AUTO_2604 ?AUTO_2598 ) ( IN-CITY ?AUTO_2598 ?AUTO_2602 ) ( IN-CITY ?AUTO_2597 ?AUTO_2602 ) ( not ( = ?AUTO_2597 ?AUTO_2598 ) ) ( AIRPORT ?AUTO_2603 ) ( AIRPORT ?AUTO_2597 ) ( not ( = ?AUTO_2603 ?AUTO_2597 ) ) ( AIRPORT ?AUTO_2600 ) ( AIRPLANE-AT ?AUTO_2599 ?AUTO_2600 ) ( not ( = ?AUTO_2600 ?AUTO_2603 ) ) ( IN-TRUCK ?AUTO_2593 ?AUTO_2605 ) ( TRUCK-AT ?AUTO_2605 ?AUTO_2608 ) ( IN-CITY ?AUTO_2608 ?AUTO_2607 ) ( IN-CITY ?AUTO_2603 ?AUTO_2607 ) ( not ( = ?AUTO_2603 ?AUTO_2608 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2605 ?AUTO_2608 ?AUTO_2603 ?AUTO_2607 )
      ( DELIVER-PKG ?AUTO_2593 ?AUTO_2594 )
      ( DELIVER-PKG-VERIFY ?AUTO_2593 ?AUTO_2594 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2610 - OBJ
      ?AUTO_2611 - LOCATION
    )
    :vars
    (
      ?AUTO_2623 - LOCATION
      ?AUTO_2622 - CITY
      ?AUTO_2619 - TRUCK
      ?AUTO_2618 - LOCATION
      ?AUTO_2612 - CITY
      ?AUTO_2613 - LOCATION
      ?AUTO_2620 - LOCATION
      ?AUTO_2621 - AIRPLANE
      ?AUTO_2616 - TRUCK
      ?AUTO_2624 - LOCATION
      ?AUTO_2614 - CITY
      ?AUTO_2626 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2623 ?AUTO_2622 ) ( IN-CITY ?AUTO_2611 ?AUTO_2622 ) ( not ( = ?AUTO_2611 ?AUTO_2623 ) ) ( TRUCK-AT ?AUTO_2619 ?AUTO_2618 ) ( IN-CITY ?AUTO_2618 ?AUTO_2612 ) ( IN-CITY ?AUTO_2623 ?AUTO_2612 ) ( not ( = ?AUTO_2623 ?AUTO_2618 ) ) ( AIRPORT ?AUTO_2613 ) ( AIRPORT ?AUTO_2623 ) ( not ( = ?AUTO_2613 ?AUTO_2623 ) ) ( AIRPORT ?AUTO_2620 ) ( AIRPLANE-AT ?AUTO_2621 ?AUTO_2620 ) ( not ( = ?AUTO_2620 ?AUTO_2613 ) ) ( TRUCK-AT ?AUTO_2616 ?AUTO_2624 ) ( IN-CITY ?AUTO_2624 ?AUTO_2614 ) ( IN-CITY ?AUTO_2613 ?AUTO_2614 ) ( not ( = ?AUTO_2613 ?AUTO_2624 ) ) ( TRUCK-AT ?AUTO_2616 ?AUTO_2626 ) ( OBJ-AT ?AUTO_2610 ?AUTO_2626 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2610 ?AUTO_2616 ?AUTO_2626 )
      ( DELIVER-PKG ?AUTO_2610 ?AUTO_2611 )
      ( DELIVER-PKG-VERIFY ?AUTO_2610 ?AUTO_2611 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2628 - OBJ
      ?AUTO_2629 - LOCATION
    )
    :vars
    (
      ?AUTO_2640 - LOCATION
      ?AUTO_2641 - CITY
      ?AUTO_2631 - TRUCK
      ?AUTO_2642 - LOCATION
      ?AUTO_2639 - CITY
      ?AUTO_2637 - LOCATION
      ?AUTO_2638 - LOCATION
      ?AUTO_2632 - AIRPLANE
      ?AUTO_2643 - LOCATION
      ?AUTO_2636 - CITY
      ?AUTO_2630 - TRUCK
      ?AUTO_2646 - LOCATION
      ?AUTO_2645 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2640 ?AUTO_2641 ) ( IN-CITY ?AUTO_2629 ?AUTO_2641 ) ( not ( = ?AUTO_2629 ?AUTO_2640 ) ) ( TRUCK-AT ?AUTO_2631 ?AUTO_2642 ) ( IN-CITY ?AUTO_2642 ?AUTO_2639 ) ( IN-CITY ?AUTO_2640 ?AUTO_2639 ) ( not ( = ?AUTO_2640 ?AUTO_2642 ) ) ( AIRPORT ?AUTO_2637 ) ( AIRPORT ?AUTO_2640 ) ( not ( = ?AUTO_2637 ?AUTO_2640 ) ) ( AIRPORT ?AUTO_2638 ) ( AIRPLANE-AT ?AUTO_2632 ?AUTO_2638 ) ( not ( = ?AUTO_2638 ?AUTO_2637 ) ) ( IN-CITY ?AUTO_2643 ?AUTO_2636 ) ( IN-CITY ?AUTO_2637 ?AUTO_2636 ) ( not ( = ?AUTO_2637 ?AUTO_2643 ) ) ( OBJ-AT ?AUTO_2628 ?AUTO_2643 ) ( TRUCK-AT ?AUTO_2630 ?AUTO_2646 ) ( IN-CITY ?AUTO_2646 ?AUTO_2645 ) ( IN-CITY ?AUTO_2643 ?AUTO_2645 ) ( not ( = ?AUTO_2643 ?AUTO_2646 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2630 ?AUTO_2646 ?AUTO_2643 ?AUTO_2645 )
      ( DELIVER-PKG ?AUTO_2628 ?AUTO_2629 )
      ( DELIVER-PKG-VERIFY ?AUTO_2628 ?AUTO_2629 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2650 - OBJ
      ?AUTO_2651 - LOCATION
    )
    :vars
    (
      ?AUTO_2652 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2650 ?AUTO_2652 ) ( AIRPLANE-AT ?AUTO_2652 ?AUTO_2651 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2650 ?AUTO_2652 ?AUTO_2651 )
      ( DELIVER-PKG-VERIFY ?AUTO_2650 ?AUTO_2651 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2655 - OBJ
      ?AUTO_2656 - LOCATION
    )
    :vars
    (
      ?AUTO_2657 - AIRPLANE
      ?AUTO_2661 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2655 ?AUTO_2657 ) ( AIRPORT ?AUTO_2661 ) ( AIRPORT ?AUTO_2656 ) ( AIRPLANE-AT ?AUTO_2657 ?AUTO_2661 ) ( not ( = ?AUTO_2661 ?AUTO_2656 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2657 ?AUTO_2661 ?AUTO_2656 )
      ( DELIVER-PKG ?AUTO_2655 ?AUTO_2656 )
      ( DELIVER-PKG-VERIFY ?AUTO_2655 ?AUTO_2656 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2663 - OBJ
      ?AUTO_2664 - LOCATION
    )
    :vars
    (
      ?AUTO_2668 - LOCATION
      ?AUTO_2666 - AIRPLANE
      ?AUTO_2670 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2668 ) ( AIRPORT ?AUTO_2664 ) ( AIRPLANE-AT ?AUTO_2666 ?AUTO_2668 ) ( not ( = ?AUTO_2668 ?AUTO_2664 ) ) ( OBJ-AT ?AUTO_2663 ?AUTO_2670 ) ( AIRPLANE-AT ?AUTO_2666 ?AUTO_2670 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2663 ?AUTO_2666 ?AUTO_2670 )
      ( DELIVER-PKG ?AUTO_2663 ?AUTO_2664 )
      ( DELIVER-PKG-VERIFY ?AUTO_2663 ?AUTO_2664 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2672 - OBJ
      ?AUTO_2673 - LOCATION
    )
    :vars
    (
      ?AUTO_2678 - LOCATION
      ?AUTO_2680 - LOCATION
      ?AUTO_2674 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2678 ) ( AIRPORT ?AUTO_2673 ) ( not ( = ?AUTO_2678 ?AUTO_2673 ) ) ( OBJ-AT ?AUTO_2672 ?AUTO_2678 ) ( AIRPORT ?AUTO_2680 ) ( AIRPLANE-AT ?AUTO_2674 ?AUTO_2680 ) ( not ( = ?AUTO_2680 ?AUTO_2678 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2674 ?AUTO_2680 ?AUTO_2678 )
      ( DELIVER-PKG ?AUTO_2672 ?AUTO_2673 )
      ( DELIVER-PKG-VERIFY ?AUTO_2672 ?AUTO_2673 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2694 - OBJ
      ?AUTO_2695 - LOCATION
    )
    :vars
    (
      ?AUTO_2697 - LOCATION
      ?AUTO_2700 - LOCATION
      ?AUTO_2696 - AIRPLANE
      ?AUTO_2701 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2697 ) ( AIRPORT ?AUTO_2695 ) ( not ( = ?AUTO_2697 ?AUTO_2695 ) ) ( AIRPORT ?AUTO_2700 ) ( AIRPLANE-AT ?AUTO_2696 ?AUTO_2700 ) ( not ( = ?AUTO_2700 ?AUTO_2697 ) ) ( TRUCK-AT ?AUTO_2701 ?AUTO_2697 ) ( IN-TRUCK ?AUTO_2694 ?AUTO_2701 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2694 ?AUTO_2701 ?AUTO_2697 )
      ( DELIVER-PKG ?AUTO_2694 ?AUTO_2695 )
      ( DELIVER-PKG-VERIFY ?AUTO_2694 ?AUTO_2695 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2704 - OBJ
      ?AUTO_2705 - LOCATION
    )
    :vars
    (
      ?AUTO_2709 - LOCATION
      ?AUTO_2710 - LOCATION
      ?AUTO_2708 - AIRPLANE
      ?AUTO_2711 - TRUCK
      ?AUTO_2714 - LOCATION
      ?AUTO_2713 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2709 ) ( AIRPORT ?AUTO_2705 ) ( not ( = ?AUTO_2709 ?AUTO_2705 ) ) ( AIRPORT ?AUTO_2710 ) ( AIRPLANE-AT ?AUTO_2708 ?AUTO_2710 ) ( not ( = ?AUTO_2710 ?AUTO_2709 ) ) ( IN-TRUCK ?AUTO_2704 ?AUTO_2711 ) ( TRUCK-AT ?AUTO_2711 ?AUTO_2714 ) ( IN-CITY ?AUTO_2714 ?AUTO_2713 ) ( IN-CITY ?AUTO_2709 ?AUTO_2713 ) ( not ( = ?AUTO_2709 ?AUTO_2714 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2711 ?AUTO_2714 ?AUTO_2709 ?AUTO_2713 )
      ( DELIVER-PKG ?AUTO_2704 ?AUTO_2705 )
      ( DELIVER-PKG-VERIFY ?AUTO_2704 ?AUTO_2705 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2720 - OBJ
      ?AUTO_2721 - LOCATION
    )
    :vars
    (
      ?AUTO_2727 - LOCATION
      ?AUTO_2729 - LOCATION
      ?AUTO_2726 - TRUCK
      ?AUTO_2723 - LOCATION
      ?AUTO_2728 - CITY
      ?AUTO_2731 - LOCATION
      ?AUTO_2724 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2727 ) ( AIRPORT ?AUTO_2721 ) ( not ( = ?AUTO_2727 ?AUTO_2721 ) ) ( AIRPORT ?AUTO_2729 ) ( not ( = ?AUTO_2729 ?AUTO_2727 ) ) ( IN-TRUCK ?AUTO_2720 ?AUTO_2726 ) ( TRUCK-AT ?AUTO_2726 ?AUTO_2723 ) ( IN-CITY ?AUTO_2723 ?AUTO_2728 ) ( IN-CITY ?AUTO_2727 ?AUTO_2728 ) ( not ( = ?AUTO_2727 ?AUTO_2723 ) ) ( AIRPORT ?AUTO_2731 ) ( AIRPLANE-AT ?AUTO_2724 ?AUTO_2731 ) ( not ( = ?AUTO_2731 ?AUTO_2729 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2724 ?AUTO_2731 ?AUTO_2729 )
      ( DELIVER-PKG ?AUTO_2720 ?AUTO_2721 )
      ( DELIVER-PKG-VERIFY ?AUTO_2720 ?AUTO_2721 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2765 - OBJ
      ?AUTO_2766 - LOCATION
    )
    :vars
    (
      ?AUTO_2768 - LOCATION
      ?AUTO_2771 - LOCATION
      ?AUTO_2774 - TRUCK
      ?AUTO_2773 - LOCATION
      ?AUTO_2769 - CITY
      ?AUTO_2767 - LOCATION
      ?AUTO_2770 - AIRPLANE
      ?AUTO_2777 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2768 ) ( AIRPORT ?AUTO_2766 ) ( not ( = ?AUTO_2768 ?AUTO_2766 ) ) ( AIRPORT ?AUTO_2771 ) ( not ( = ?AUTO_2771 ?AUTO_2768 ) ) ( TRUCK-AT ?AUTO_2774 ?AUTO_2773 ) ( IN-CITY ?AUTO_2773 ?AUTO_2769 ) ( IN-CITY ?AUTO_2768 ?AUTO_2769 ) ( not ( = ?AUTO_2768 ?AUTO_2773 ) ) ( AIRPORT ?AUTO_2767 ) ( AIRPLANE-AT ?AUTO_2770 ?AUTO_2767 ) ( not ( = ?AUTO_2767 ?AUTO_2771 ) ) ( TRUCK-AT ?AUTO_2774 ?AUTO_2777 ) ( OBJ-AT ?AUTO_2765 ?AUTO_2777 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2765 ?AUTO_2774 ?AUTO_2777 )
      ( DELIVER-PKG ?AUTO_2765 ?AUTO_2766 )
      ( DELIVER-PKG-VERIFY ?AUTO_2765 ?AUTO_2766 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2779 - OBJ
      ?AUTO_2780 - LOCATION
    )
    :vars
    (
      ?AUTO_2787 - LOCATION
      ?AUTO_2789 - LOCATION
      ?AUTO_2788 - LOCATION
      ?AUTO_2786 - CITY
      ?AUTO_2790 - LOCATION
      ?AUTO_2785 - AIRPLANE
      ?AUTO_2783 - TRUCK
      ?AUTO_2793 - LOCATION
      ?AUTO_2792 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2787 ) ( AIRPORT ?AUTO_2780 ) ( not ( = ?AUTO_2787 ?AUTO_2780 ) ) ( AIRPORT ?AUTO_2789 ) ( not ( = ?AUTO_2789 ?AUTO_2787 ) ) ( IN-CITY ?AUTO_2788 ?AUTO_2786 ) ( IN-CITY ?AUTO_2787 ?AUTO_2786 ) ( not ( = ?AUTO_2787 ?AUTO_2788 ) ) ( AIRPORT ?AUTO_2790 ) ( AIRPLANE-AT ?AUTO_2785 ?AUTO_2790 ) ( not ( = ?AUTO_2790 ?AUTO_2789 ) ) ( OBJ-AT ?AUTO_2779 ?AUTO_2788 ) ( TRUCK-AT ?AUTO_2783 ?AUTO_2793 ) ( IN-CITY ?AUTO_2793 ?AUTO_2792 ) ( IN-CITY ?AUTO_2788 ?AUTO_2792 ) ( not ( = ?AUTO_2788 ?AUTO_2793 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2783 ?AUTO_2793 ?AUTO_2788 ?AUTO_2792 )
      ( DELIVER-PKG ?AUTO_2779 ?AUTO_2780 )
      ( DELIVER-PKG-VERIFY ?AUTO_2779 ?AUTO_2780 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2807 - OBJ
      ?AUTO_2808 - LOCATION
    )
    :vars
    (
      ?AUTO_2809 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2809 ?AUTO_2808 ) ( IN-TRUCK ?AUTO_2807 ?AUTO_2809 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2807 ?AUTO_2809 ?AUTO_2808 )
      ( DELIVER-PKG-VERIFY ?AUTO_2807 ?AUTO_2808 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2812 - OBJ
      ?AUTO_2813 - LOCATION
    )
    :vars
    (
      ?AUTO_2816 - TRUCK
      ?AUTO_2819 - LOCATION
      ?AUTO_2818 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2812 ?AUTO_2816 ) ( TRUCK-AT ?AUTO_2816 ?AUTO_2819 ) ( IN-CITY ?AUTO_2819 ?AUTO_2818 ) ( IN-CITY ?AUTO_2813 ?AUTO_2818 ) ( not ( = ?AUTO_2813 ?AUTO_2819 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2816 ?AUTO_2819 ?AUTO_2813 ?AUTO_2818 )
      ( DELIVER-PKG ?AUTO_2812 ?AUTO_2813 )
      ( DELIVER-PKG-VERIFY ?AUTO_2812 ?AUTO_2813 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2821 - OBJ
      ?AUTO_2822 - LOCATION
    )
    :vars
    (
      ?AUTO_2823 - TRUCK
      ?AUTO_2827 - LOCATION
      ?AUTO_2826 - CITY
      ?AUTO_2829 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2823 ?AUTO_2827 ) ( IN-CITY ?AUTO_2827 ?AUTO_2826 ) ( IN-CITY ?AUTO_2822 ?AUTO_2826 ) ( not ( = ?AUTO_2822 ?AUTO_2827 ) ) ( TRUCK-AT ?AUTO_2823 ?AUTO_2829 ) ( OBJ-AT ?AUTO_2821 ?AUTO_2829 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2821 ?AUTO_2823 ?AUTO_2829 )
      ( DELIVER-PKG ?AUTO_2821 ?AUTO_2822 )
      ( DELIVER-PKG-VERIFY ?AUTO_2821 ?AUTO_2822 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2831 - OBJ
      ?AUTO_2832 - LOCATION
    )
    :vars
    (
      ?AUTO_2838 - LOCATION
      ?AUTO_2837 - CITY
      ?AUTO_2834 - TRUCK
      ?AUTO_2841 - LOCATION
      ?AUTO_2840 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2838 ?AUTO_2837 ) ( IN-CITY ?AUTO_2832 ?AUTO_2837 ) ( not ( = ?AUTO_2832 ?AUTO_2838 ) ) ( OBJ-AT ?AUTO_2831 ?AUTO_2838 ) ( TRUCK-AT ?AUTO_2834 ?AUTO_2841 ) ( IN-CITY ?AUTO_2841 ?AUTO_2840 ) ( IN-CITY ?AUTO_2838 ?AUTO_2840 ) ( not ( = ?AUTO_2838 ?AUTO_2841 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2834 ?AUTO_2841 ?AUTO_2838 ?AUTO_2840 )
      ( DELIVER-PKG ?AUTO_2831 ?AUTO_2832 )
      ( DELIVER-PKG-VERIFY ?AUTO_2831 ?AUTO_2832 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2923 - OBJ
      ?AUTO_2924 - LOCATION
    )
    :vars
    (
      ?AUTO_2925 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2923 ?AUTO_2925 ) ( AIRPLANE-AT ?AUTO_2925 ?AUTO_2924 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2923 ?AUTO_2925 ?AUTO_2924 )
      ( DELIVER-PKG-VERIFY ?AUTO_2923 ?AUTO_2924 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2928 - OBJ
      ?AUTO_2929 - LOCATION
    )
    :vars
    (
      ?AUTO_2930 - AIRPLANE
      ?AUTO_2934 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2928 ?AUTO_2930 ) ( AIRPORT ?AUTO_2934 ) ( AIRPORT ?AUTO_2929 ) ( AIRPLANE-AT ?AUTO_2930 ?AUTO_2934 ) ( not ( = ?AUTO_2934 ?AUTO_2929 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2930 ?AUTO_2934 ?AUTO_2929 )
      ( DELIVER-PKG ?AUTO_2928 ?AUTO_2929 )
      ( DELIVER-PKG-VERIFY ?AUTO_2928 ?AUTO_2929 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2936 - OBJ
      ?AUTO_2937 - LOCATION
    )
    :vars
    (
      ?AUTO_2941 - LOCATION
      ?AUTO_2940 - AIRPLANE
      ?AUTO_2943 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2941 ) ( AIRPORT ?AUTO_2937 ) ( AIRPLANE-AT ?AUTO_2940 ?AUTO_2941 ) ( not ( = ?AUTO_2941 ?AUTO_2937 ) ) ( OBJ-AT ?AUTO_2936 ?AUTO_2943 ) ( AIRPLANE-AT ?AUTO_2940 ?AUTO_2943 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2936 ?AUTO_2940 ?AUTO_2943 )
      ( DELIVER-PKG ?AUTO_2936 ?AUTO_2937 )
      ( DELIVER-PKG-VERIFY ?AUTO_2936 ?AUTO_2937 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2945 - OBJ
      ?AUTO_2946 - LOCATION
    )
    :vars
    (
      ?AUTO_2950 - LOCATION
      ?AUTO_2949 - AIRPLANE
      ?AUTO_2951 - LOCATION
      ?AUTO_2952 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2950 ) ( AIRPORT ?AUTO_2946 ) ( AIRPLANE-AT ?AUTO_2949 ?AUTO_2950 ) ( not ( = ?AUTO_2950 ?AUTO_2946 ) ) ( AIRPLANE-AT ?AUTO_2949 ?AUTO_2951 ) ( TRUCK-AT ?AUTO_2952 ?AUTO_2951 ) ( IN-TRUCK ?AUTO_2945 ?AUTO_2952 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2945 ?AUTO_2952 ?AUTO_2951 )
      ( DELIVER-PKG ?AUTO_2945 ?AUTO_2946 )
      ( DELIVER-PKG-VERIFY ?AUTO_2945 ?AUTO_2946 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2955 - OBJ
      ?AUTO_2956 - LOCATION
    )
    :vars
    (
      ?AUTO_2957 - LOCATION
      ?AUTO_2961 - AIRPLANE
      ?AUTO_2960 - LOCATION
      ?AUTO_2962 - TRUCK
      ?AUTO_2965 - LOCATION
      ?AUTO_2964 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2957 ) ( AIRPORT ?AUTO_2956 ) ( AIRPLANE-AT ?AUTO_2961 ?AUTO_2957 ) ( not ( = ?AUTO_2957 ?AUTO_2956 ) ) ( AIRPLANE-AT ?AUTO_2961 ?AUTO_2960 ) ( IN-TRUCK ?AUTO_2955 ?AUTO_2962 ) ( TRUCK-AT ?AUTO_2962 ?AUTO_2965 ) ( IN-CITY ?AUTO_2965 ?AUTO_2964 ) ( IN-CITY ?AUTO_2960 ?AUTO_2964 ) ( not ( = ?AUTO_2960 ?AUTO_2965 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2962 ?AUTO_2965 ?AUTO_2960 ?AUTO_2964 )
      ( DELIVER-PKG ?AUTO_2955 ?AUTO_2956 )
      ( DELIVER-PKG-VERIFY ?AUTO_2955 ?AUTO_2956 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2967 - OBJ
      ?AUTO_2968 - LOCATION
    )
    :vars
    (
      ?AUTO_2974 - LOCATION
      ?AUTO_2972 - AIRPLANE
      ?AUTO_2976 - LOCATION
      ?AUTO_2975 - TRUCK
      ?AUTO_2970 - LOCATION
      ?AUTO_2969 - CITY
      ?AUTO_2978 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2974 ) ( AIRPORT ?AUTO_2968 ) ( AIRPLANE-AT ?AUTO_2972 ?AUTO_2974 ) ( not ( = ?AUTO_2974 ?AUTO_2968 ) ) ( AIRPLANE-AT ?AUTO_2972 ?AUTO_2976 ) ( TRUCK-AT ?AUTO_2975 ?AUTO_2970 ) ( IN-CITY ?AUTO_2970 ?AUTO_2969 ) ( IN-CITY ?AUTO_2976 ?AUTO_2969 ) ( not ( = ?AUTO_2976 ?AUTO_2970 ) ) ( TRUCK-AT ?AUTO_2975 ?AUTO_2978 ) ( OBJ-AT ?AUTO_2967 ?AUTO_2978 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2967 ?AUTO_2975 ?AUTO_2978 )
      ( DELIVER-PKG ?AUTO_2967 ?AUTO_2968 )
      ( DELIVER-PKG-VERIFY ?AUTO_2967 ?AUTO_2968 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2980 - OBJ
      ?AUTO_2981 - LOCATION
    )
    :vars
    (
      ?AUTO_2986 - LOCATION
      ?AUTO_2990 - AIRPLANE
      ?AUTO_2989 - LOCATION
      ?AUTO_2984 - LOCATION
      ?AUTO_2987 - CITY
      ?AUTO_2985 - TRUCK
      ?AUTO_2993 - LOCATION
      ?AUTO_2992 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2986 ) ( AIRPORT ?AUTO_2981 ) ( AIRPLANE-AT ?AUTO_2990 ?AUTO_2986 ) ( not ( = ?AUTO_2986 ?AUTO_2981 ) ) ( AIRPLANE-AT ?AUTO_2990 ?AUTO_2989 ) ( IN-CITY ?AUTO_2984 ?AUTO_2987 ) ( IN-CITY ?AUTO_2989 ?AUTO_2987 ) ( not ( = ?AUTO_2989 ?AUTO_2984 ) ) ( OBJ-AT ?AUTO_2980 ?AUTO_2984 ) ( TRUCK-AT ?AUTO_2985 ?AUTO_2993 ) ( IN-CITY ?AUTO_2993 ?AUTO_2992 ) ( IN-CITY ?AUTO_2984 ?AUTO_2992 ) ( not ( = ?AUTO_2984 ?AUTO_2993 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2985 ?AUTO_2993 ?AUTO_2984 ?AUTO_2992 )
      ( DELIVER-PKG ?AUTO_2980 ?AUTO_2981 )
      ( DELIVER-PKG-VERIFY ?AUTO_2980 ?AUTO_2981 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2999 - OBJ
      ?AUTO_3000 - LOCATION
    )
    :vars
    (
      ?AUTO_3006 - LOCATION
      ?AUTO_3005 - LOCATION
      ?AUTO_3007 - CITY
      ?AUTO_3003 - TRUCK
      ?AUTO_3001 - LOCATION
      ?AUTO_3002 - CITY
      ?AUTO_3012 - LOCATION
      ?AUTO_3004 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3006 ) ( AIRPORT ?AUTO_3000 ) ( not ( = ?AUTO_3006 ?AUTO_3000 ) ) ( IN-CITY ?AUTO_3005 ?AUTO_3007 ) ( IN-CITY ?AUTO_3006 ?AUTO_3007 ) ( not ( = ?AUTO_3006 ?AUTO_3005 ) ) ( OBJ-AT ?AUTO_2999 ?AUTO_3005 ) ( TRUCK-AT ?AUTO_3003 ?AUTO_3001 ) ( IN-CITY ?AUTO_3001 ?AUTO_3002 ) ( IN-CITY ?AUTO_3005 ?AUTO_3002 ) ( not ( = ?AUTO_3005 ?AUTO_3001 ) ) ( AIRPORT ?AUTO_3012 ) ( AIRPLANE-AT ?AUTO_3004 ?AUTO_3012 ) ( not ( = ?AUTO_3012 ?AUTO_3006 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3004 ?AUTO_3012 ?AUTO_3006 )
      ( DELIVER-PKG ?AUTO_2999 ?AUTO_3000 )
      ( DELIVER-PKG-VERIFY ?AUTO_2999 ?AUTO_3000 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3088 - OBJ
      ?AUTO_3089 - LOCATION
    )
    :vars
    (
      ?AUTO_3090 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3088 ?AUTO_3090 ) ( AIRPLANE-AT ?AUTO_3090 ?AUTO_3089 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3088 ?AUTO_3090 ?AUTO_3089 )
      ( DELIVER-PKG-VERIFY ?AUTO_3088 ?AUTO_3089 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3093 - OBJ
      ?AUTO_3094 - LOCATION
    )
    :vars
    (
      ?AUTO_3097 - AIRPLANE
      ?AUTO_3099 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3093 ?AUTO_3097 ) ( AIRPORT ?AUTO_3099 ) ( AIRPORT ?AUTO_3094 ) ( AIRPLANE-AT ?AUTO_3097 ?AUTO_3099 ) ( not ( = ?AUTO_3099 ?AUTO_3094 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3097 ?AUTO_3099 ?AUTO_3094 )
      ( DELIVER-PKG ?AUTO_3093 ?AUTO_3094 )
      ( DELIVER-PKG-VERIFY ?AUTO_3093 ?AUTO_3094 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3103 - OBJ
      ?AUTO_3104 - LOCATION
    )
    :vars
    (
      ?AUTO_3108 - LOCATION
      ?AUTO_3105 - AIRPLANE
      ?AUTO_3110 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3108 ) ( AIRPORT ?AUTO_3104 ) ( AIRPLANE-AT ?AUTO_3105 ?AUTO_3108 ) ( not ( = ?AUTO_3108 ?AUTO_3104 ) ) ( OBJ-AT ?AUTO_3103 ?AUTO_3110 ) ( AIRPLANE-AT ?AUTO_3105 ?AUTO_3110 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3103 ?AUTO_3105 ?AUTO_3110 )
      ( DELIVER-PKG ?AUTO_3103 ?AUTO_3104 )
      ( DELIVER-PKG-VERIFY ?AUTO_3103 ?AUTO_3104 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3112 - OBJ
      ?AUTO_3113 - LOCATION
    )
    :vars
    (
      ?AUTO_3118 - LOCATION
      ?AUTO_3120 - LOCATION
      ?AUTO_3116 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3118 ) ( AIRPORT ?AUTO_3113 ) ( not ( = ?AUTO_3118 ?AUTO_3113 ) ) ( OBJ-AT ?AUTO_3112 ?AUTO_3118 ) ( AIRPORT ?AUTO_3120 ) ( AIRPLANE-AT ?AUTO_3116 ?AUTO_3120 ) ( not ( = ?AUTO_3120 ?AUTO_3118 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3116 ?AUTO_3120 ?AUTO_3118 )
      ( DELIVER-PKG ?AUTO_3112 ?AUTO_3113 )
      ( DELIVER-PKG-VERIFY ?AUTO_3112 ?AUTO_3113 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3156 - OBJ
      ?AUTO_3157 - LOCATION
    )
    :vars
    (
      ?AUTO_3159 - LOCATION
      ?AUTO_3161 - LOCATION
      ?AUTO_3158 - AIRPLANE
      ?AUTO_3163 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3159 ) ( AIRPORT ?AUTO_3157 ) ( not ( = ?AUTO_3159 ?AUTO_3157 ) ) ( AIRPORT ?AUTO_3161 ) ( AIRPLANE-AT ?AUTO_3158 ?AUTO_3161 ) ( not ( = ?AUTO_3161 ?AUTO_3159 ) ) ( TRUCK-AT ?AUTO_3163 ?AUTO_3159 ) ( IN-TRUCK ?AUTO_3156 ?AUTO_3163 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3156 ?AUTO_3163 ?AUTO_3159 )
      ( DELIVER-PKG ?AUTO_3156 ?AUTO_3157 )
      ( DELIVER-PKG-VERIFY ?AUTO_3156 ?AUTO_3157 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3224 - OBJ
      ?AUTO_3225 - LOCATION
    )
    :vars
    (
      ?AUTO_3226 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3226 ?AUTO_3225 ) ( IN-TRUCK ?AUTO_3224 ?AUTO_3226 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3224 ?AUTO_3226 ?AUTO_3225 )
      ( DELIVER-PKG-VERIFY ?AUTO_3224 ?AUTO_3225 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3233 - OBJ
      ?AUTO_3234 - LOCATION
    )
    :vars
    (
      ?AUTO_3237 - TRUCK
      ?AUTO_3240 - LOCATION
      ?AUTO_3239 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3233 ?AUTO_3237 ) ( TRUCK-AT ?AUTO_3237 ?AUTO_3240 ) ( IN-CITY ?AUTO_3240 ?AUTO_3239 ) ( IN-CITY ?AUTO_3234 ?AUTO_3239 ) ( not ( = ?AUTO_3234 ?AUTO_3240 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3237 ?AUTO_3240 ?AUTO_3234 ?AUTO_3239 )
      ( DELIVER-PKG ?AUTO_3233 ?AUTO_3234 )
      ( DELIVER-PKG-VERIFY ?AUTO_3233 ?AUTO_3234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3270 - OBJ
      ?AUTO_3271 - LOCATION
    )
    :vars
    (
      ?AUTO_3274 - TRUCK
      ?AUTO_3272 - LOCATION
      ?AUTO_3273 - CITY
      ?AUTO_3277 - LOCATION
      ?AUTO_3278 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3274 ?AUTO_3272 ) ( IN-CITY ?AUTO_3272 ?AUTO_3273 ) ( IN-CITY ?AUTO_3271 ?AUTO_3273 ) ( not ( = ?AUTO_3271 ?AUTO_3272 ) ) ( TRUCK-AT ?AUTO_3274 ?AUTO_3277 ) ( IN-AIRPLANE ?AUTO_3270 ?AUTO_3278 ) ( AIRPLANE-AT ?AUTO_3278 ?AUTO_3277 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3270 ?AUTO_3278 ?AUTO_3277 )
      ( DELIVER-PKG ?AUTO_3270 ?AUTO_3271 )
      ( DELIVER-PKG-VERIFY ?AUTO_3270 ?AUTO_3271 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3281 - OBJ
      ?AUTO_3282 - LOCATION
    )
    :vars
    (
      ?AUTO_3289 - TRUCK
      ?AUTO_3286 - LOCATION
      ?AUTO_3287 - CITY
      ?AUTO_3285 - LOCATION
      ?AUTO_3288 - AIRPLANE
      ?AUTO_3291 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3289 ?AUTO_3286 ) ( IN-CITY ?AUTO_3286 ?AUTO_3287 ) ( IN-CITY ?AUTO_3282 ?AUTO_3287 ) ( not ( = ?AUTO_3282 ?AUTO_3286 ) ) ( TRUCK-AT ?AUTO_3289 ?AUTO_3285 ) ( IN-AIRPLANE ?AUTO_3281 ?AUTO_3288 ) ( AIRPORT ?AUTO_3291 ) ( AIRPORT ?AUTO_3285 ) ( AIRPLANE-AT ?AUTO_3288 ?AUTO_3291 ) ( not ( = ?AUTO_3291 ?AUTO_3285 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3288 ?AUTO_3291 ?AUTO_3285 )
      ( DELIVER-PKG ?AUTO_3281 ?AUTO_3282 )
      ( DELIVER-PKG-VERIFY ?AUTO_3281 ?AUTO_3282 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3293 - OBJ
      ?AUTO_3294 - LOCATION
    )
    :vars
    (
      ?AUTO_3301 - TRUCK
      ?AUTO_3298 - LOCATION
      ?AUTO_3297 - CITY
      ?AUTO_3302 - LOCATION
      ?AUTO_3299 - LOCATION
      ?AUTO_3295 - AIRPLANE
      ?AUTO_3304 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3301 ?AUTO_3298 ) ( IN-CITY ?AUTO_3298 ?AUTO_3297 ) ( IN-CITY ?AUTO_3294 ?AUTO_3297 ) ( not ( = ?AUTO_3294 ?AUTO_3298 ) ) ( TRUCK-AT ?AUTO_3301 ?AUTO_3302 ) ( AIRPORT ?AUTO_3299 ) ( AIRPORT ?AUTO_3302 ) ( AIRPLANE-AT ?AUTO_3295 ?AUTO_3299 ) ( not ( = ?AUTO_3299 ?AUTO_3302 ) ) ( OBJ-AT ?AUTO_3293 ?AUTO_3304 ) ( AIRPLANE-AT ?AUTO_3295 ?AUTO_3304 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3293 ?AUTO_3295 ?AUTO_3304 )
      ( DELIVER-PKG ?AUTO_3293 ?AUTO_3294 )
      ( DELIVER-PKG-VERIFY ?AUTO_3293 ?AUTO_3294 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3306 - OBJ
      ?AUTO_3307 - LOCATION
    )
    :vars
    (
      ?AUTO_3315 - TRUCK
      ?AUTO_3316 - LOCATION
      ?AUTO_3314 - CITY
      ?AUTO_3313 - LOCATION
      ?AUTO_3311 - LOCATION
      ?AUTO_3318 - LOCATION
      ?AUTO_3312 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3315 ?AUTO_3316 ) ( IN-CITY ?AUTO_3316 ?AUTO_3314 ) ( IN-CITY ?AUTO_3307 ?AUTO_3314 ) ( not ( = ?AUTO_3307 ?AUTO_3316 ) ) ( TRUCK-AT ?AUTO_3315 ?AUTO_3313 ) ( AIRPORT ?AUTO_3311 ) ( AIRPORT ?AUTO_3313 ) ( not ( = ?AUTO_3311 ?AUTO_3313 ) ) ( OBJ-AT ?AUTO_3306 ?AUTO_3311 ) ( AIRPORT ?AUTO_3318 ) ( AIRPLANE-AT ?AUTO_3312 ?AUTO_3318 ) ( not ( = ?AUTO_3318 ?AUTO_3311 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3312 ?AUTO_3318 ?AUTO_3311 )
      ( DELIVER-PKG ?AUTO_3306 ?AUTO_3307 )
      ( DELIVER-PKG-VERIFY ?AUTO_3306 ?AUTO_3307 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3332 - OBJ
      ?AUTO_3333 - LOCATION
    )
    :vars
    (
      ?AUTO_3339 - TRUCK
      ?AUTO_3338 - LOCATION
      ?AUTO_3337 - CITY
      ?AUTO_3340 - LOCATION
      ?AUTO_3341 - LOCATION
      ?AUTO_3334 - LOCATION
      ?AUTO_3336 - AIRPLANE
      ?AUTO_3343 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3339 ?AUTO_3338 ) ( IN-CITY ?AUTO_3338 ?AUTO_3337 ) ( IN-CITY ?AUTO_3333 ?AUTO_3337 ) ( not ( = ?AUTO_3333 ?AUTO_3338 ) ) ( TRUCK-AT ?AUTO_3339 ?AUTO_3340 ) ( AIRPORT ?AUTO_3341 ) ( AIRPORT ?AUTO_3340 ) ( not ( = ?AUTO_3341 ?AUTO_3340 ) ) ( AIRPORT ?AUTO_3334 ) ( AIRPLANE-AT ?AUTO_3336 ?AUTO_3334 ) ( not ( = ?AUTO_3334 ?AUTO_3341 ) ) ( TRUCK-AT ?AUTO_3343 ?AUTO_3341 ) ( IN-TRUCK ?AUTO_3332 ?AUTO_3343 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3332 ?AUTO_3343 ?AUTO_3341 )
      ( DELIVER-PKG ?AUTO_3332 ?AUTO_3333 )
      ( DELIVER-PKG-VERIFY ?AUTO_3332 ?AUTO_3333 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3346 - OBJ
      ?AUTO_3347 - LOCATION
    )
    :vars
    (
      ?AUTO_3355 - TRUCK
      ?AUTO_3353 - LOCATION
      ?AUTO_3352 - CITY
      ?AUTO_3354 - LOCATION
      ?AUTO_3350 - LOCATION
      ?AUTO_3351 - LOCATION
      ?AUTO_3356 - AIRPLANE
      ?AUTO_3357 - TRUCK
      ?AUTO_3360 - LOCATION
      ?AUTO_3359 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3355 ?AUTO_3353 ) ( IN-CITY ?AUTO_3353 ?AUTO_3352 ) ( IN-CITY ?AUTO_3347 ?AUTO_3352 ) ( not ( = ?AUTO_3347 ?AUTO_3353 ) ) ( TRUCK-AT ?AUTO_3355 ?AUTO_3354 ) ( AIRPORT ?AUTO_3350 ) ( AIRPORT ?AUTO_3354 ) ( not ( = ?AUTO_3350 ?AUTO_3354 ) ) ( AIRPORT ?AUTO_3351 ) ( AIRPLANE-AT ?AUTO_3356 ?AUTO_3351 ) ( not ( = ?AUTO_3351 ?AUTO_3350 ) ) ( IN-TRUCK ?AUTO_3346 ?AUTO_3357 ) ( TRUCK-AT ?AUTO_3357 ?AUTO_3360 ) ( IN-CITY ?AUTO_3360 ?AUTO_3359 ) ( IN-CITY ?AUTO_3350 ?AUTO_3359 ) ( not ( = ?AUTO_3350 ?AUTO_3360 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3357 ?AUTO_3360 ?AUTO_3350 ?AUTO_3359 )
      ( DELIVER-PKG ?AUTO_3346 ?AUTO_3347 )
      ( DELIVER-PKG-VERIFY ?AUTO_3346 ?AUTO_3347 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3366 - OBJ
      ?AUTO_3367 - LOCATION
    )
    :vars
    (
      ?AUTO_3369 - TRUCK
      ?AUTO_3375 - LOCATION
      ?AUTO_3376 - CITY
      ?AUTO_3377 - LOCATION
      ?AUTO_3372 - LOCATION
      ?AUTO_3371 - LOCATION
      ?AUTO_3368 - TRUCK
      ?AUTO_3373 - LOCATION
      ?AUTO_3374 - CITY
      ?AUTO_3381 - LOCATION
      ?AUTO_3378 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3369 ?AUTO_3375 ) ( IN-CITY ?AUTO_3375 ?AUTO_3376 ) ( IN-CITY ?AUTO_3367 ?AUTO_3376 ) ( not ( = ?AUTO_3367 ?AUTO_3375 ) ) ( TRUCK-AT ?AUTO_3369 ?AUTO_3377 ) ( AIRPORT ?AUTO_3372 ) ( AIRPORT ?AUTO_3377 ) ( not ( = ?AUTO_3372 ?AUTO_3377 ) ) ( AIRPORT ?AUTO_3371 ) ( not ( = ?AUTO_3371 ?AUTO_3372 ) ) ( IN-TRUCK ?AUTO_3366 ?AUTO_3368 ) ( TRUCK-AT ?AUTO_3368 ?AUTO_3373 ) ( IN-CITY ?AUTO_3373 ?AUTO_3374 ) ( IN-CITY ?AUTO_3372 ?AUTO_3374 ) ( not ( = ?AUTO_3372 ?AUTO_3373 ) ) ( AIRPORT ?AUTO_3381 ) ( AIRPLANE-AT ?AUTO_3378 ?AUTO_3381 ) ( not ( = ?AUTO_3381 ?AUTO_3371 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3378 ?AUTO_3381 ?AUTO_3371 )
      ( DELIVER-PKG ?AUTO_3366 ?AUTO_3367 )
      ( DELIVER-PKG-VERIFY ?AUTO_3366 ?AUTO_3367 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3405 - OBJ
      ?AUTO_3406 - LOCATION
    )
    :vars
    (
      ?AUTO_3411 - LOCATION
      ?AUTO_3413 - CITY
      ?AUTO_3414 - LOCATION
      ?AUTO_3409 - LOCATION
      ?AUTO_3415 - TRUCK
      ?AUTO_3418 - LOCATION
      ?AUTO_3417 - CITY
      ?AUTO_3412 - LOCATION
      ?AUTO_3407 - AIRPLANE
      ?AUTO_3416 - TRUCK
      ?AUTO_3422 - LOCATION
      ?AUTO_3421 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3411 ?AUTO_3413 ) ( IN-CITY ?AUTO_3406 ?AUTO_3413 ) ( not ( = ?AUTO_3406 ?AUTO_3411 ) ) ( AIRPORT ?AUTO_3414 ) ( AIRPORT ?AUTO_3411 ) ( not ( = ?AUTO_3414 ?AUTO_3411 ) ) ( AIRPORT ?AUTO_3409 ) ( not ( = ?AUTO_3409 ?AUTO_3414 ) ) ( IN-TRUCK ?AUTO_3405 ?AUTO_3415 ) ( TRUCK-AT ?AUTO_3415 ?AUTO_3418 ) ( IN-CITY ?AUTO_3418 ?AUTO_3417 ) ( IN-CITY ?AUTO_3414 ?AUTO_3417 ) ( not ( = ?AUTO_3414 ?AUTO_3418 ) ) ( AIRPORT ?AUTO_3412 ) ( AIRPLANE-AT ?AUTO_3407 ?AUTO_3412 ) ( not ( = ?AUTO_3412 ?AUTO_3409 ) ) ( TRUCK-AT ?AUTO_3416 ?AUTO_3422 ) ( IN-CITY ?AUTO_3422 ?AUTO_3421 ) ( IN-CITY ?AUTO_3411 ?AUTO_3421 ) ( not ( = ?AUTO_3411 ?AUTO_3422 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3416 ?AUTO_3422 ?AUTO_3411 ?AUTO_3421 )
      ( DELIVER-PKG ?AUTO_3405 ?AUTO_3406 )
      ( DELIVER-PKG-VERIFY ?AUTO_3405 ?AUTO_3406 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3432 - OBJ
      ?AUTO_3433 - LOCATION
    )
    :vars
    (
      ?AUTO_3437 - LOCATION
      ?AUTO_3442 - CITY
      ?AUTO_3444 - LOCATION
      ?AUTO_3441 - LOCATION
      ?AUTO_3447 - TRUCK
      ?AUTO_3440 - LOCATION
      ?AUTO_3446 - CITY
      ?AUTO_3435 - LOCATION
      ?AUTO_3438 - AIRPLANE
      ?AUTO_3434 - TRUCK
      ?AUTO_3439 - LOCATION
      ?AUTO_3436 - CITY
      ?AUTO_3449 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3437 ?AUTO_3442 ) ( IN-CITY ?AUTO_3433 ?AUTO_3442 ) ( not ( = ?AUTO_3433 ?AUTO_3437 ) ) ( AIRPORT ?AUTO_3444 ) ( AIRPORT ?AUTO_3437 ) ( not ( = ?AUTO_3444 ?AUTO_3437 ) ) ( AIRPORT ?AUTO_3441 ) ( not ( = ?AUTO_3441 ?AUTO_3444 ) ) ( TRUCK-AT ?AUTO_3447 ?AUTO_3440 ) ( IN-CITY ?AUTO_3440 ?AUTO_3446 ) ( IN-CITY ?AUTO_3444 ?AUTO_3446 ) ( not ( = ?AUTO_3444 ?AUTO_3440 ) ) ( AIRPORT ?AUTO_3435 ) ( AIRPLANE-AT ?AUTO_3438 ?AUTO_3435 ) ( not ( = ?AUTO_3435 ?AUTO_3441 ) ) ( TRUCK-AT ?AUTO_3434 ?AUTO_3439 ) ( IN-CITY ?AUTO_3439 ?AUTO_3436 ) ( IN-CITY ?AUTO_3437 ?AUTO_3436 ) ( not ( = ?AUTO_3437 ?AUTO_3439 ) ) ( TRUCK-AT ?AUTO_3447 ?AUTO_3449 ) ( OBJ-AT ?AUTO_3432 ?AUTO_3449 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3432 ?AUTO_3447 ?AUTO_3449 )
      ( DELIVER-PKG ?AUTO_3432 ?AUTO_3433 )
      ( DELIVER-PKG-VERIFY ?AUTO_3432 ?AUTO_3433 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3451 - OBJ
      ?AUTO_3452 - LOCATION
    )
    :vars
    (
      ?AUTO_3461 - LOCATION
      ?AUTO_3455 - CITY
      ?AUTO_3460 - LOCATION
      ?AUTO_3465 - LOCATION
      ?AUTO_3467 - LOCATION
      ?AUTO_3464 - CITY
      ?AUTO_3454 - LOCATION
      ?AUTO_3453 - AIRPLANE
      ?AUTO_3466 - TRUCK
      ?AUTO_3458 - LOCATION
      ?AUTO_3463 - CITY
      ?AUTO_3457 - TRUCK
      ?AUTO_3470 - LOCATION
      ?AUTO_3469 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3461 ?AUTO_3455 ) ( IN-CITY ?AUTO_3452 ?AUTO_3455 ) ( not ( = ?AUTO_3452 ?AUTO_3461 ) ) ( AIRPORT ?AUTO_3460 ) ( AIRPORT ?AUTO_3461 ) ( not ( = ?AUTO_3460 ?AUTO_3461 ) ) ( AIRPORT ?AUTO_3465 ) ( not ( = ?AUTO_3465 ?AUTO_3460 ) ) ( IN-CITY ?AUTO_3467 ?AUTO_3464 ) ( IN-CITY ?AUTO_3460 ?AUTO_3464 ) ( not ( = ?AUTO_3460 ?AUTO_3467 ) ) ( AIRPORT ?AUTO_3454 ) ( AIRPLANE-AT ?AUTO_3453 ?AUTO_3454 ) ( not ( = ?AUTO_3454 ?AUTO_3465 ) ) ( TRUCK-AT ?AUTO_3466 ?AUTO_3458 ) ( IN-CITY ?AUTO_3458 ?AUTO_3463 ) ( IN-CITY ?AUTO_3461 ?AUTO_3463 ) ( not ( = ?AUTO_3461 ?AUTO_3458 ) ) ( OBJ-AT ?AUTO_3451 ?AUTO_3467 ) ( TRUCK-AT ?AUTO_3457 ?AUTO_3470 ) ( IN-CITY ?AUTO_3470 ?AUTO_3469 ) ( IN-CITY ?AUTO_3467 ?AUTO_3469 ) ( not ( = ?AUTO_3467 ?AUTO_3470 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3457 ?AUTO_3470 ?AUTO_3467 ?AUTO_3469 )
      ( DELIVER-PKG ?AUTO_3451 ?AUTO_3452 )
      ( DELIVER-PKG-VERIFY ?AUTO_3451 ?AUTO_3452 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3484 - OBJ
      ?AUTO_3485 - LOCATION
    )
    :vars
    (
      ?AUTO_3486 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3486 ?AUTO_3485 ) ( IN-TRUCK ?AUTO_3484 ?AUTO_3486 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3484 ?AUTO_3486 ?AUTO_3485 )
      ( DELIVER-PKG-VERIFY ?AUTO_3484 ?AUTO_3485 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3489 - OBJ
      ?AUTO_3490 - LOCATION
    )
    :vars
    (
      ?AUTO_3491 - TRUCK
      ?AUTO_3496 - LOCATION
      ?AUTO_3495 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3489 ?AUTO_3491 ) ( TRUCK-AT ?AUTO_3491 ?AUTO_3496 ) ( IN-CITY ?AUTO_3496 ?AUTO_3495 ) ( IN-CITY ?AUTO_3490 ?AUTO_3495 ) ( not ( = ?AUTO_3490 ?AUTO_3496 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3491 ?AUTO_3496 ?AUTO_3490 ?AUTO_3495 )
      ( DELIVER-PKG ?AUTO_3489 ?AUTO_3490 )
      ( DELIVER-PKG-VERIFY ?AUTO_3489 ?AUTO_3490 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3506 - OBJ
      ?AUTO_3507 - LOCATION
    )
    :vars
    (
      ?AUTO_3511 - TRUCK
      ?AUTO_3508 - LOCATION
      ?AUTO_3509 - CITY
      ?AUTO_3514 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3511 ?AUTO_3508 ) ( IN-CITY ?AUTO_3508 ?AUTO_3509 ) ( IN-CITY ?AUTO_3507 ?AUTO_3509 ) ( not ( = ?AUTO_3507 ?AUTO_3508 ) ) ( TRUCK-AT ?AUTO_3511 ?AUTO_3514 ) ( OBJ-AT ?AUTO_3506 ?AUTO_3514 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3506 ?AUTO_3511 ?AUTO_3514 )
      ( DELIVER-PKG ?AUTO_3506 ?AUTO_3507 )
      ( DELIVER-PKG-VERIFY ?AUTO_3506 ?AUTO_3507 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3516 - OBJ
      ?AUTO_3517 - LOCATION
    )
    :vars
    (
      ?AUTO_3522 - TRUCK
      ?AUTO_3521 - LOCATION
      ?AUTO_3520 - CITY
      ?AUTO_3523 - LOCATION
      ?AUTO_3524 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3522 ?AUTO_3521 ) ( IN-CITY ?AUTO_3521 ?AUTO_3520 ) ( IN-CITY ?AUTO_3517 ?AUTO_3520 ) ( not ( = ?AUTO_3517 ?AUTO_3521 ) ) ( TRUCK-AT ?AUTO_3522 ?AUTO_3523 ) ( IN-AIRPLANE ?AUTO_3516 ?AUTO_3524 ) ( AIRPLANE-AT ?AUTO_3524 ?AUTO_3523 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3516 ?AUTO_3524 ?AUTO_3523 )
      ( DELIVER-PKG ?AUTO_3516 ?AUTO_3517 )
      ( DELIVER-PKG-VERIFY ?AUTO_3516 ?AUTO_3517 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3527 - OBJ
      ?AUTO_3528 - LOCATION
    )
    :vars
    (
      ?AUTO_3535 - TRUCK
      ?AUTO_3529 - LOCATION
      ?AUTO_3530 - CITY
      ?AUTO_3533 - LOCATION
      ?AUTO_3532 - AIRPLANE
      ?AUTO_3537 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3535 ?AUTO_3529 ) ( IN-CITY ?AUTO_3529 ?AUTO_3530 ) ( IN-CITY ?AUTO_3528 ?AUTO_3530 ) ( not ( = ?AUTO_3528 ?AUTO_3529 ) ) ( TRUCK-AT ?AUTO_3535 ?AUTO_3533 ) ( IN-AIRPLANE ?AUTO_3527 ?AUTO_3532 ) ( AIRPORT ?AUTO_3537 ) ( AIRPORT ?AUTO_3533 ) ( AIRPLANE-AT ?AUTO_3532 ?AUTO_3537 ) ( not ( = ?AUTO_3537 ?AUTO_3533 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3532 ?AUTO_3537 ?AUTO_3533 )
      ( DELIVER-PKG ?AUTO_3527 ?AUTO_3528 )
      ( DELIVER-PKG-VERIFY ?AUTO_3527 ?AUTO_3528 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3541 - OBJ
      ?AUTO_3542 - LOCATION
    )
    :vars
    (
      ?AUTO_3547 - TRUCK
      ?AUTO_3543 - LOCATION
      ?AUTO_3548 - CITY
      ?AUTO_3549 - LOCATION
      ?AUTO_3550 - LOCATION
      ?AUTO_3544 - AIRPLANE
      ?AUTO_3552 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3547 ?AUTO_3543 ) ( IN-CITY ?AUTO_3543 ?AUTO_3548 ) ( IN-CITY ?AUTO_3542 ?AUTO_3548 ) ( not ( = ?AUTO_3542 ?AUTO_3543 ) ) ( TRUCK-AT ?AUTO_3547 ?AUTO_3549 ) ( AIRPORT ?AUTO_3550 ) ( AIRPORT ?AUTO_3549 ) ( AIRPLANE-AT ?AUTO_3544 ?AUTO_3550 ) ( not ( = ?AUTO_3550 ?AUTO_3549 ) ) ( OBJ-AT ?AUTO_3541 ?AUTO_3552 ) ( AIRPLANE-AT ?AUTO_3544 ?AUTO_3552 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3541 ?AUTO_3544 ?AUTO_3552 )
      ( DELIVER-PKG ?AUTO_3541 ?AUTO_3542 )
      ( DELIVER-PKG-VERIFY ?AUTO_3541 ?AUTO_3542 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3554 - OBJ
      ?AUTO_3555 - LOCATION
    )
    :vars
    (
      ?AUTO_3563 - TRUCK
      ?AUTO_3560 - LOCATION
      ?AUTO_3562 - CITY
      ?AUTO_3561 - LOCATION
      ?AUTO_3564 - LOCATION
      ?AUTO_3566 - LOCATION
      ?AUTO_3558 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3563 ?AUTO_3560 ) ( IN-CITY ?AUTO_3560 ?AUTO_3562 ) ( IN-CITY ?AUTO_3555 ?AUTO_3562 ) ( not ( = ?AUTO_3555 ?AUTO_3560 ) ) ( TRUCK-AT ?AUTO_3563 ?AUTO_3561 ) ( AIRPORT ?AUTO_3564 ) ( AIRPORT ?AUTO_3561 ) ( not ( = ?AUTO_3564 ?AUTO_3561 ) ) ( OBJ-AT ?AUTO_3554 ?AUTO_3564 ) ( AIRPORT ?AUTO_3566 ) ( AIRPLANE-AT ?AUTO_3558 ?AUTO_3566 ) ( not ( = ?AUTO_3566 ?AUTO_3564 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3558 ?AUTO_3566 ?AUTO_3564 )
      ( DELIVER-PKG ?AUTO_3554 ?AUTO_3555 )
      ( DELIVER-PKG-VERIFY ?AUTO_3554 ?AUTO_3555 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3576 - OBJ
      ?AUTO_3577 - LOCATION
    )
    :vars
    (
      ?AUTO_3580 - LOCATION
      ?AUTO_3583 - CITY
      ?AUTO_3579 - LOCATION
      ?AUTO_3578 - LOCATION
      ?AUTO_3584 - AIRPLANE
      ?AUTO_3585 - TRUCK
      ?AUTO_3589 - LOCATION
      ?AUTO_3588 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3580 ?AUTO_3583 ) ( IN-CITY ?AUTO_3577 ?AUTO_3583 ) ( not ( = ?AUTO_3577 ?AUTO_3580 ) ) ( AIRPORT ?AUTO_3579 ) ( AIRPORT ?AUTO_3580 ) ( not ( = ?AUTO_3579 ?AUTO_3580 ) ) ( OBJ-AT ?AUTO_3576 ?AUTO_3579 ) ( AIRPORT ?AUTO_3578 ) ( AIRPLANE-AT ?AUTO_3584 ?AUTO_3578 ) ( not ( = ?AUTO_3578 ?AUTO_3579 ) ) ( TRUCK-AT ?AUTO_3585 ?AUTO_3589 ) ( IN-CITY ?AUTO_3589 ?AUTO_3588 ) ( IN-CITY ?AUTO_3580 ?AUTO_3588 ) ( not ( = ?AUTO_3580 ?AUTO_3589 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3585 ?AUTO_3589 ?AUTO_3580 ?AUTO_3588 )
      ( DELIVER-PKG ?AUTO_3576 ?AUTO_3577 )
      ( DELIVER-PKG-VERIFY ?AUTO_3576 ?AUTO_3577 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3615 - OBJ
      ?AUTO_3616 - LOCATION
    )
    :vars
    (
      ?AUTO_3625 - LOCATION
      ?AUTO_3622 - CITY
      ?AUTO_3620 - LOCATION
      ?AUTO_3624 - LOCATION
      ?AUTO_3618 - AIRPLANE
      ?AUTO_3623 - TRUCK
      ?AUTO_3621 - LOCATION
      ?AUTO_3617 - CITY
      ?AUTO_3627 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3625 ?AUTO_3622 ) ( IN-CITY ?AUTO_3616 ?AUTO_3622 ) ( not ( = ?AUTO_3616 ?AUTO_3625 ) ) ( AIRPORT ?AUTO_3620 ) ( AIRPORT ?AUTO_3625 ) ( not ( = ?AUTO_3620 ?AUTO_3625 ) ) ( AIRPORT ?AUTO_3624 ) ( AIRPLANE-AT ?AUTO_3618 ?AUTO_3624 ) ( not ( = ?AUTO_3624 ?AUTO_3620 ) ) ( TRUCK-AT ?AUTO_3623 ?AUTO_3621 ) ( IN-CITY ?AUTO_3621 ?AUTO_3617 ) ( IN-CITY ?AUTO_3625 ?AUTO_3617 ) ( not ( = ?AUTO_3625 ?AUTO_3621 ) ) ( TRUCK-AT ?AUTO_3627 ?AUTO_3620 ) ( IN-TRUCK ?AUTO_3615 ?AUTO_3627 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3615 ?AUTO_3627 ?AUTO_3620 )
      ( DELIVER-PKG ?AUTO_3615 ?AUTO_3616 )
      ( DELIVER-PKG-VERIFY ?AUTO_3615 ?AUTO_3616 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3664 - OBJ
      ?AUTO_3665 - LOCATION
    )
    :vars
    (
      ?AUTO_3667 - LOCATION
      ?AUTO_3678 - CITY
      ?AUTO_3673 - LOCATION
      ?AUTO_3670 - LOCATION
      ?AUTO_3668 - TRUCK
      ?AUTO_3669 - LOCATION
      ?AUTO_3671 - CITY
      ?AUTO_3666 - LOCATION
      ?AUTO_3679 - AIRPLANE
      ?AUTO_3672 - TRUCK
      ?AUTO_3675 - LOCATION
      ?AUTO_3677 - CITY
      ?AUTO_3681 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3667 ?AUTO_3678 ) ( IN-CITY ?AUTO_3665 ?AUTO_3678 ) ( not ( = ?AUTO_3665 ?AUTO_3667 ) ) ( AIRPORT ?AUTO_3673 ) ( AIRPORT ?AUTO_3667 ) ( not ( = ?AUTO_3673 ?AUTO_3667 ) ) ( AIRPORT ?AUTO_3670 ) ( not ( = ?AUTO_3670 ?AUTO_3673 ) ) ( TRUCK-AT ?AUTO_3668 ?AUTO_3669 ) ( IN-CITY ?AUTO_3669 ?AUTO_3671 ) ( IN-CITY ?AUTO_3673 ?AUTO_3671 ) ( not ( = ?AUTO_3673 ?AUTO_3669 ) ) ( AIRPORT ?AUTO_3666 ) ( AIRPLANE-AT ?AUTO_3679 ?AUTO_3666 ) ( not ( = ?AUTO_3666 ?AUTO_3670 ) ) ( TRUCK-AT ?AUTO_3672 ?AUTO_3675 ) ( IN-CITY ?AUTO_3675 ?AUTO_3677 ) ( IN-CITY ?AUTO_3667 ?AUTO_3677 ) ( not ( = ?AUTO_3667 ?AUTO_3675 ) ) ( TRUCK-AT ?AUTO_3668 ?AUTO_3681 ) ( OBJ-AT ?AUTO_3664 ?AUTO_3681 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3664 ?AUTO_3668 ?AUTO_3681 )
      ( DELIVER-PKG ?AUTO_3664 ?AUTO_3665 )
      ( DELIVER-PKG-VERIFY ?AUTO_3664 ?AUTO_3665 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3683 - OBJ
      ?AUTO_3684 - LOCATION
    )
    :vars
    (
      ?AUTO_3694 - LOCATION
      ?AUTO_3685 - CITY
      ?AUTO_3691 - LOCATION
      ?AUTO_3696 - LOCATION
      ?AUTO_3686 - LOCATION
      ?AUTO_3695 - CITY
      ?AUTO_3698 - LOCATION
      ?AUTO_3692 - AIRPLANE
      ?AUTO_3690 - TRUCK
      ?AUTO_3697 - LOCATION
      ?AUTO_3688 - CITY
      ?AUTO_3699 - TRUCK
      ?AUTO_3702 - LOCATION
      ?AUTO_3701 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3694 ?AUTO_3685 ) ( IN-CITY ?AUTO_3684 ?AUTO_3685 ) ( not ( = ?AUTO_3684 ?AUTO_3694 ) ) ( AIRPORT ?AUTO_3691 ) ( AIRPORT ?AUTO_3694 ) ( not ( = ?AUTO_3691 ?AUTO_3694 ) ) ( AIRPORT ?AUTO_3696 ) ( not ( = ?AUTO_3696 ?AUTO_3691 ) ) ( IN-CITY ?AUTO_3686 ?AUTO_3695 ) ( IN-CITY ?AUTO_3691 ?AUTO_3695 ) ( not ( = ?AUTO_3691 ?AUTO_3686 ) ) ( AIRPORT ?AUTO_3698 ) ( AIRPLANE-AT ?AUTO_3692 ?AUTO_3698 ) ( not ( = ?AUTO_3698 ?AUTO_3696 ) ) ( TRUCK-AT ?AUTO_3690 ?AUTO_3697 ) ( IN-CITY ?AUTO_3697 ?AUTO_3688 ) ( IN-CITY ?AUTO_3694 ?AUTO_3688 ) ( not ( = ?AUTO_3694 ?AUTO_3697 ) ) ( OBJ-AT ?AUTO_3683 ?AUTO_3686 ) ( TRUCK-AT ?AUTO_3699 ?AUTO_3702 ) ( IN-CITY ?AUTO_3702 ?AUTO_3701 ) ( IN-CITY ?AUTO_3686 ?AUTO_3701 ) ( not ( = ?AUTO_3686 ?AUTO_3702 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3699 ?AUTO_3702 ?AUTO_3686 ?AUTO_3701 )
      ( DELIVER-PKG ?AUTO_3683 ?AUTO_3684 )
      ( DELIVER-PKG-VERIFY ?AUTO_3683 ?AUTO_3684 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3724 - OBJ
      ?AUTO_3725 - LOCATION
    )
    :vars
    (
      ?AUTO_3726 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3724 ?AUTO_3726 ) ( AIRPLANE-AT ?AUTO_3726 ?AUTO_3725 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3724 ?AUTO_3726 ?AUTO_3725 )
      ( DELIVER-PKG-VERIFY ?AUTO_3724 ?AUTO_3725 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3737 - OBJ
      ?AUTO_3738 - LOCATION
    )
    :vars
    (
      ?AUTO_3740 - AIRPLANE
      ?AUTO_3743 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3737 ?AUTO_3740 ) ( AIRPORT ?AUTO_3743 ) ( AIRPORT ?AUTO_3738 ) ( AIRPLANE-AT ?AUTO_3740 ?AUTO_3743 ) ( not ( = ?AUTO_3743 ?AUTO_3738 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3740 ?AUTO_3743 ?AUTO_3738 )
      ( DELIVER-PKG ?AUTO_3737 ?AUTO_3738 )
      ( DELIVER-PKG-VERIFY ?AUTO_3737 ?AUTO_3738 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3753 - OBJ
      ?AUTO_3754 - LOCATION
    )
    :vars
    (
      ?AUTO_3756 - LOCATION
      ?AUTO_3758 - AIRPLANE
      ?AUTO_3760 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3756 ) ( AIRPORT ?AUTO_3754 ) ( AIRPLANE-AT ?AUTO_3758 ?AUTO_3756 ) ( not ( = ?AUTO_3756 ?AUTO_3754 ) ) ( OBJ-AT ?AUTO_3753 ?AUTO_3760 ) ( AIRPLANE-AT ?AUTO_3758 ?AUTO_3760 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3753 ?AUTO_3758 ?AUTO_3760 )
      ( DELIVER-PKG ?AUTO_3753 ?AUTO_3754 )
      ( DELIVER-PKG-VERIFY ?AUTO_3753 ?AUTO_3754 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3798 - OBJ
      ?AUTO_3799 - LOCATION
    )
    :vars
    (
      ?AUTO_3802 - LOCATION
      ?AUTO_3800 - LOCATION
      ?AUTO_3803 - AIRPLANE
      ?AUTO_3805 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3802 ) ( AIRPORT ?AUTO_3799 ) ( not ( = ?AUTO_3802 ?AUTO_3799 ) ) ( AIRPORT ?AUTO_3800 ) ( AIRPLANE-AT ?AUTO_3803 ?AUTO_3800 ) ( not ( = ?AUTO_3800 ?AUTO_3802 ) ) ( TRUCK-AT ?AUTO_3805 ?AUTO_3802 ) ( IN-TRUCK ?AUTO_3798 ?AUTO_3805 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3798 ?AUTO_3805 ?AUTO_3802 )
      ( DELIVER-PKG ?AUTO_3798 ?AUTO_3799 )
      ( DELIVER-PKG-VERIFY ?AUTO_3798 ?AUTO_3799 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3868 - OBJ
      ?AUTO_3869 - LOCATION
    )
    :vars
    (
      ?AUTO_3870 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3868 ?AUTO_3870 ) ( AIRPLANE-AT ?AUTO_3870 ?AUTO_3869 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3868 ?AUTO_3870 ?AUTO_3869 )
      ( DELIVER-PKG-VERIFY ?AUTO_3868 ?AUTO_3869 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3873 - OBJ
      ?AUTO_3874 - LOCATION
    )
    :vars
    (
      ?AUTO_3877 - AIRPLANE
      ?AUTO_3879 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3873 ?AUTO_3877 ) ( AIRPORT ?AUTO_3879 ) ( AIRPORT ?AUTO_3874 ) ( AIRPLANE-AT ?AUTO_3877 ?AUTO_3879 ) ( not ( = ?AUTO_3879 ?AUTO_3874 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3877 ?AUTO_3879 ?AUTO_3874 )
      ( DELIVER-PKG ?AUTO_3873 ?AUTO_3874 )
      ( DELIVER-PKG-VERIFY ?AUTO_3873 ?AUTO_3874 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3889 - OBJ
      ?AUTO_3890 - LOCATION
    )
    :vars
    (
      ?AUTO_3891 - LOCATION
      ?AUTO_3894 - AIRPLANE
      ?AUTO_3896 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3891 ) ( AIRPORT ?AUTO_3890 ) ( AIRPLANE-AT ?AUTO_3894 ?AUTO_3891 ) ( not ( = ?AUTO_3891 ?AUTO_3890 ) ) ( OBJ-AT ?AUTO_3889 ?AUTO_3896 ) ( AIRPLANE-AT ?AUTO_3894 ?AUTO_3896 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3889 ?AUTO_3894 ?AUTO_3896 )
      ( DELIVER-PKG ?AUTO_3889 ?AUTO_3890 )
      ( DELIVER-PKG-VERIFY ?AUTO_3889 ?AUTO_3890 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3898 - OBJ
      ?AUTO_3899 - LOCATION
    )
    :vars
    (
      ?AUTO_3904 - LOCATION
      ?AUTO_3906 - LOCATION
      ?AUTO_3903 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3904 ) ( AIRPORT ?AUTO_3899 ) ( not ( = ?AUTO_3904 ?AUTO_3899 ) ) ( OBJ-AT ?AUTO_3898 ?AUTO_3904 ) ( AIRPORT ?AUTO_3906 ) ( AIRPLANE-AT ?AUTO_3903 ?AUTO_3906 ) ( not ( = ?AUTO_3906 ?AUTO_3904 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3903 ?AUTO_3906 ?AUTO_3904 )
      ( DELIVER-PKG ?AUTO_3898 ?AUTO_3899 )
      ( DELIVER-PKG-VERIFY ?AUTO_3898 ?AUTO_3899 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3984 - OBJ
      ?AUTO_3985 - LOCATION
    )
    :vars
    (
      ?AUTO_3993 - LOCATION
      ?AUTO_3988 - LOCATION
      ?AUTO_3989 - AIRPLANE
      ?AUTO_3987 - TRUCK
      ?AUTO_3990 - LOCATION
      ?AUTO_3991 - CITY
      ?AUTO_3995 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3993 ) ( AIRPORT ?AUTO_3985 ) ( not ( = ?AUTO_3993 ?AUTO_3985 ) ) ( AIRPORT ?AUTO_3988 ) ( AIRPLANE-AT ?AUTO_3989 ?AUTO_3988 ) ( not ( = ?AUTO_3988 ?AUTO_3993 ) ) ( TRUCK-AT ?AUTO_3987 ?AUTO_3990 ) ( IN-CITY ?AUTO_3990 ?AUTO_3991 ) ( IN-CITY ?AUTO_3993 ?AUTO_3991 ) ( not ( = ?AUTO_3993 ?AUTO_3990 ) ) ( TRUCK-AT ?AUTO_3987 ?AUTO_3995 ) ( OBJ-AT ?AUTO_3984 ?AUTO_3995 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3984 ?AUTO_3987 ?AUTO_3995 )
      ( DELIVER-PKG ?AUTO_3984 ?AUTO_3985 )
      ( DELIVER-PKG-VERIFY ?AUTO_3984 ?AUTO_3985 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4027 - OBJ
      ?AUTO_4028 - LOCATION
    )
    :vars
    (
      ?AUTO_4029 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4029 ?AUTO_4028 ) ( IN-TRUCK ?AUTO_4027 ?AUTO_4029 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4027 ?AUTO_4029 ?AUTO_4028 )
      ( DELIVER-PKG-VERIFY ?AUTO_4027 ?AUTO_4028 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4032 - OBJ
      ?AUTO_4033 - LOCATION
    )
    :vars
    (
      ?AUTO_4036 - TRUCK
      ?AUTO_4039 - LOCATION
      ?AUTO_4038 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4032 ?AUTO_4036 ) ( TRUCK-AT ?AUTO_4036 ?AUTO_4039 ) ( IN-CITY ?AUTO_4039 ?AUTO_4038 ) ( IN-CITY ?AUTO_4033 ?AUTO_4038 ) ( not ( = ?AUTO_4033 ?AUTO_4039 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4036 ?AUTO_4039 ?AUTO_4033 ?AUTO_4038 )
      ( DELIVER-PKG ?AUTO_4032 ?AUTO_4033 )
      ( DELIVER-PKG-VERIFY ?AUTO_4032 ?AUTO_4033 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4041 - OBJ
      ?AUTO_4042 - LOCATION
    )
    :vars
    (
      ?AUTO_4045 - TRUCK
      ?AUTO_4047 - LOCATION
      ?AUTO_4046 - CITY
      ?AUTO_4049 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4045 ?AUTO_4047 ) ( IN-CITY ?AUTO_4047 ?AUTO_4046 ) ( IN-CITY ?AUTO_4042 ?AUTO_4046 ) ( not ( = ?AUTO_4042 ?AUTO_4047 ) ) ( TRUCK-AT ?AUTO_4045 ?AUTO_4049 ) ( OBJ-AT ?AUTO_4041 ?AUTO_4049 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4041 ?AUTO_4045 ?AUTO_4049 )
      ( DELIVER-PKG ?AUTO_4041 ?AUTO_4042 )
      ( DELIVER-PKG-VERIFY ?AUTO_4041 ?AUTO_4042 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4051 - OBJ
      ?AUTO_4052 - LOCATION
    )
    :vars
    (
      ?AUTO_4057 - TRUCK
      ?AUTO_4056 - LOCATION
      ?AUTO_4053 - CITY
      ?AUTO_4058 - LOCATION
      ?AUTO_4059 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4057 ?AUTO_4056 ) ( IN-CITY ?AUTO_4056 ?AUTO_4053 ) ( IN-CITY ?AUTO_4052 ?AUTO_4053 ) ( not ( = ?AUTO_4052 ?AUTO_4056 ) ) ( TRUCK-AT ?AUTO_4057 ?AUTO_4058 ) ( IN-AIRPLANE ?AUTO_4051 ?AUTO_4059 ) ( AIRPLANE-AT ?AUTO_4059 ?AUTO_4058 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4051 ?AUTO_4059 ?AUTO_4058 )
      ( DELIVER-PKG ?AUTO_4051 ?AUTO_4052 )
      ( DELIVER-PKG-VERIFY ?AUTO_4051 ?AUTO_4052 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4062 - OBJ
      ?AUTO_4063 - LOCATION
    )
    :vars
    (
      ?AUTO_4065 - TRUCK
      ?AUTO_4069 - LOCATION
      ?AUTO_4070 - CITY
      ?AUTO_4067 - LOCATION
      ?AUTO_4064 - AIRPLANE
      ?AUTO_4072 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4065 ?AUTO_4069 ) ( IN-CITY ?AUTO_4069 ?AUTO_4070 ) ( IN-CITY ?AUTO_4063 ?AUTO_4070 ) ( not ( = ?AUTO_4063 ?AUTO_4069 ) ) ( TRUCK-AT ?AUTO_4065 ?AUTO_4067 ) ( IN-AIRPLANE ?AUTO_4062 ?AUTO_4064 ) ( AIRPORT ?AUTO_4072 ) ( AIRPORT ?AUTO_4067 ) ( AIRPLANE-AT ?AUTO_4064 ?AUTO_4072 ) ( not ( = ?AUTO_4072 ?AUTO_4067 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4064 ?AUTO_4072 ?AUTO_4067 )
      ( DELIVER-PKG ?AUTO_4062 ?AUTO_4063 )
      ( DELIVER-PKG-VERIFY ?AUTO_4062 ?AUTO_4063 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4082 - OBJ
      ?AUTO_4083 - LOCATION
    )
    :vars
    (
      ?AUTO_4084 - TRUCK
      ?AUTO_4085 - LOCATION
      ?AUTO_4090 - CITY
      ?AUTO_4091 - LOCATION
      ?AUTO_4087 - LOCATION
      ?AUTO_4089 - AIRPLANE
      ?AUTO_4093 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4084 ?AUTO_4085 ) ( IN-CITY ?AUTO_4085 ?AUTO_4090 ) ( IN-CITY ?AUTO_4083 ?AUTO_4090 ) ( not ( = ?AUTO_4083 ?AUTO_4085 ) ) ( TRUCK-AT ?AUTO_4084 ?AUTO_4091 ) ( AIRPORT ?AUTO_4087 ) ( AIRPORT ?AUTO_4091 ) ( AIRPLANE-AT ?AUTO_4089 ?AUTO_4087 ) ( not ( = ?AUTO_4087 ?AUTO_4091 ) ) ( OBJ-AT ?AUTO_4082 ?AUTO_4093 ) ( AIRPLANE-AT ?AUTO_4089 ?AUTO_4093 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4082 ?AUTO_4089 ?AUTO_4093 )
      ( DELIVER-PKG ?AUTO_4082 ?AUTO_4083 )
      ( DELIVER-PKG-VERIFY ?AUTO_4082 ?AUTO_4083 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4095 - OBJ
      ?AUTO_4096 - LOCATION
    )
    :vars
    (
      ?AUTO_4099 - TRUCK
      ?AUTO_4098 - LOCATION
      ?AUTO_4102 - CITY
      ?AUTO_4103 - LOCATION
      ?AUTO_4105 - LOCATION
      ?AUTO_4107 - LOCATION
      ?AUTO_4101 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4099 ?AUTO_4098 ) ( IN-CITY ?AUTO_4098 ?AUTO_4102 ) ( IN-CITY ?AUTO_4096 ?AUTO_4102 ) ( not ( = ?AUTO_4096 ?AUTO_4098 ) ) ( TRUCK-AT ?AUTO_4099 ?AUTO_4103 ) ( AIRPORT ?AUTO_4105 ) ( AIRPORT ?AUTO_4103 ) ( not ( = ?AUTO_4105 ?AUTO_4103 ) ) ( OBJ-AT ?AUTO_4095 ?AUTO_4105 ) ( AIRPORT ?AUTO_4107 ) ( AIRPLANE-AT ?AUTO_4101 ?AUTO_4107 ) ( not ( = ?AUTO_4107 ?AUTO_4105 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4101 ?AUTO_4107 ?AUTO_4105 )
      ( DELIVER-PKG ?AUTO_4095 ?AUTO_4096 )
      ( DELIVER-PKG-VERIFY ?AUTO_4095 ?AUTO_4096 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4183 - OBJ
      ?AUTO_4184 - LOCATION
    )
    :vars
    (
      ?AUTO_4191 - LOCATION
      ?AUTO_4192 - CITY
      ?AUTO_4193 - LOCATION
      ?AUTO_4190 - LOCATION
      ?AUTO_4194 - AIRPLANE
      ?AUTO_4195 - TRUCK
      ?AUTO_4186 - LOCATION
      ?AUTO_4189 - CITY
      ?AUTO_4188 - TRUCK
      ?AUTO_4198 - LOCATION
      ?AUTO_4197 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4191 ?AUTO_4192 ) ( IN-CITY ?AUTO_4184 ?AUTO_4192 ) ( not ( = ?AUTO_4184 ?AUTO_4191 ) ) ( AIRPORT ?AUTO_4193 ) ( AIRPORT ?AUTO_4191 ) ( not ( = ?AUTO_4193 ?AUTO_4191 ) ) ( AIRPORT ?AUTO_4190 ) ( AIRPLANE-AT ?AUTO_4194 ?AUTO_4190 ) ( not ( = ?AUTO_4190 ?AUTO_4193 ) ) ( TRUCK-AT ?AUTO_4195 ?AUTO_4186 ) ( IN-CITY ?AUTO_4186 ?AUTO_4189 ) ( IN-CITY ?AUTO_4191 ?AUTO_4189 ) ( not ( = ?AUTO_4191 ?AUTO_4186 ) ) ( IN-TRUCK ?AUTO_4183 ?AUTO_4188 ) ( TRUCK-AT ?AUTO_4188 ?AUTO_4198 ) ( IN-CITY ?AUTO_4198 ?AUTO_4197 ) ( IN-CITY ?AUTO_4193 ?AUTO_4197 ) ( not ( = ?AUTO_4193 ?AUTO_4198 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4188 ?AUTO_4198 ?AUTO_4193 ?AUTO_4197 )
      ( DELIVER-PKG ?AUTO_4183 ?AUTO_4184 )
      ( DELIVER-PKG-VERIFY ?AUTO_4183 ?AUTO_4184 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4200 - OBJ
      ?AUTO_4201 - LOCATION
    )
    :vars
    (
      ?AUTO_4207 - LOCATION
      ?AUTO_4211 - CITY
      ?AUTO_4213 - LOCATION
      ?AUTO_4209 - LOCATION
      ?AUTO_4203 - AIRPLANE
      ?AUTO_4206 - TRUCK
      ?AUTO_4212 - LOCATION
      ?AUTO_4208 - CITY
      ?AUTO_4214 - TRUCK
      ?AUTO_4205 - LOCATION
      ?AUTO_4204 - CITY
      ?AUTO_4216 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4207 ?AUTO_4211 ) ( IN-CITY ?AUTO_4201 ?AUTO_4211 ) ( not ( = ?AUTO_4201 ?AUTO_4207 ) ) ( AIRPORT ?AUTO_4213 ) ( AIRPORT ?AUTO_4207 ) ( not ( = ?AUTO_4213 ?AUTO_4207 ) ) ( AIRPORT ?AUTO_4209 ) ( AIRPLANE-AT ?AUTO_4203 ?AUTO_4209 ) ( not ( = ?AUTO_4209 ?AUTO_4213 ) ) ( TRUCK-AT ?AUTO_4206 ?AUTO_4212 ) ( IN-CITY ?AUTO_4212 ?AUTO_4208 ) ( IN-CITY ?AUTO_4207 ?AUTO_4208 ) ( not ( = ?AUTO_4207 ?AUTO_4212 ) ) ( TRUCK-AT ?AUTO_4214 ?AUTO_4205 ) ( IN-CITY ?AUTO_4205 ?AUTO_4204 ) ( IN-CITY ?AUTO_4213 ?AUTO_4204 ) ( not ( = ?AUTO_4213 ?AUTO_4205 ) ) ( TRUCK-AT ?AUTO_4214 ?AUTO_4216 ) ( OBJ-AT ?AUTO_4200 ?AUTO_4216 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4200 ?AUTO_4214 ?AUTO_4216 )
      ( DELIVER-PKG ?AUTO_4200 ?AUTO_4201 )
      ( DELIVER-PKG-VERIFY ?AUTO_4200 ?AUTO_4201 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4218 - OBJ
      ?AUTO_4219 - LOCATION
    )
    :vars
    (
      ?AUTO_4222 - LOCATION
      ?AUTO_4227 - CITY
      ?AUTO_4231 - LOCATION
      ?AUTO_4229 - LOCATION
      ?AUTO_4223 - AIRPLANE
      ?AUTO_4228 - TRUCK
      ?AUTO_4232 - LOCATION
      ?AUTO_4226 - CITY
      ?AUTO_4233 - LOCATION
      ?AUTO_4224 - CITY
      ?AUTO_4225 - TRUCK
      ?AUTO_4236 - LOCATION
      ?AUTO_4235 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4222 ?AUTO_4227 ) ( IN-CITY ?AUTO_4219 ?AUTO_4227 ) ( not ( = ?AUTO_4219 ?AUTO_4222 ) ) ( AIRPORT ?AUTO_4231 ) ( AIRPORT ?AUTO_4222 ) ( not ( = ?AUTO_4231 ?AUTO_4222 ) ) ( AIRPORT ?AUTO_4229 ) ( AIRPLANE-AT ?AUTO_4223 ?AUTO_4229 ) ( not ( = ?AUTO_4229 ?AUTO_4231 ) ) ( TRUCK-AT ?AUTO_4228 ?AUTO_4232 ) ( IN-CITY ?AUTO_4232 ?AUTO_4226 ) ( IN-CITY ?AUTO_4222 ?AUTO_4226 ) ( not ( = ?AUTO_4222 ?AUTO_4232 ) ) ( IN-CITY ?AUTO_4233 ?AUTO_4224 ) ( IN-CITY ?AUTO_4231 ?AUTO_4224 ) ( not ( = ?AUTO_4231 ?AUTO_4233 ) ) ( OBJ-AT ?AUTO_4218 ?AUTO_4233 ) ( TRUCK-AT ?AUTO_4225 ?AUTO_4236 ) ( IN-CITY ?AUTO_4236 ?AUTO_4235 ) ( IN-CITY ?AUTO_4233 ?AUTO_4235 ) ( not ( = ?AUTO_4233 ?AUTO_4236 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4225 ?AUTO_4236 ?AUTO_4233 ?AUTO_4235 )
      ( DELIVER-PKG ?AUTO_4218 ?AUTO_4219 )
      ( DELIVER-PKG-VERIFY ?AUTO_4218 ?AUTO_4219 ) )
  )

)

