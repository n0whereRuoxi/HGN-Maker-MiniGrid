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
      ?AUTO_9 - OBJ
      ?AUTO_10 - LOCATION
    )
    :vars
    (
      ?AUTO_12 - AIRPLANE
      ?AUTO_15 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_9 ?AUTO_12 ) ( AIRPORT ?AUTO_15 ) ( AIRPORT ?AUTO_10 ) ( AIRPLANE-AT ?AUTO_12 ?AUTO_15 ) ( not ( = ?AUTO_15 ?AUTO_10 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_12 ?AUTO_15 ?AUTO_10 )
      ( DELIVER-PKG ?AUTO_9 ?AUTO_10 )
      ( DELIVER-PKG-VERIFY ?AUTO_9 ?AUTO_10 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_21 - OBJ
      ?AUTO_22 - LOCATION
    )
    :vars
    (
      ?AUTO_24 - LOCATION
      ?AUTO_26 - AIRPLANE
      ?AUTO_28 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_24 ) ( AIRPORT ?AUTO_22 ) ( AIRPLANE-AT ?AUTO_26 ?AUTO_24 ) ( not ( = ?AUTO_24 ?AUTO_22 ) ) ( OBJ-AT ?AUTO_21 ?AUTO_28 ) ( AIRPLANE-AT ?AUTO_26 ?AUTO_28 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_21 ?AUTO_26 ?AUTO_28 )
      ( DELIVER-PKG ?AUTO_21 ?AUTO_22 )
      ( DELIVER-PKG-VERIFY ?AUTO_21 ?AUTO_22 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_30 - OBJ
      ?AUTO_31 - LOCATION
    )
    :vars
    (
      ?AUTO_36 - LOCATION
      ?AUTO_38 - LOCATION
      ?AUTO_33 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_36 ) ( AIRPORT ?AUTO_31 ) ( not ( = ?AUTO_36 ?AUTO_31 ) ) ( OBJ-AT ?AUTO_30 ?AUTO_36 ) ( AIRPORT ?AUTO_38 ) ( AIRPLANE-AT ?AUTO_33 ?AUTO_38 ) ( not ( = ?AUTO_38 ?AUTO_36 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_33 ?AUTO_38 ?AUTO_36 )
      ( DELIVER-PKG ?AUTO_30 ?AUTO_31 )
      ( DELIVER-PKG-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_42 - OBJ
      ?AUTO_43 - LOCATION
    )
    :vars
    (
      ?AUTO_44 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_42 ?AUTO_44 ) ( AIRPLANE-AT ?AUTO_44 ?AUTO_43 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_42 ?AUTO_44 ?AUTO_43 )
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
      ?AUTO_50 - AIRPLANE
      ?AUTO_53 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_47 ?AUTO_50 ) ( AIRPORT ?AUTO_53 ) ( AIRPORT ?AUTO_48 ) ( AIRPLANE-AT ?AUTO_50 ?AUTO_53 ) ( not ( = ?AUTO_53 ?AUTO_48 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_50 ?AUTO_53 ?AUTO_48 )
      ( DELIVER-PKG ?AUTO_47 ?AUTO_48 )
      ( DELIVER-PKG-VERIFY ?AUTO_47 ?AUTO_48 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_61 - OBJ
      ?AUTO_62 - LOCATION
    )
    :vars
    (
      ?AUTO_64 - LOCATION
      ?AUTO_65 - AIRPLANE
      ?AUTO_68 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_64 ) ( AIRPORT ?AUTO_62 ) ( AIRPLANE-AT ?AUTO_65 ?AUTO_64 ) ( not ( = ?AUTO_64 ?AUTO_62 ) ) ( OBJ-AT ?AUTO_61 ?AUTO_68 ) ( AIRPLANE-AT ?AUTO_65 ?AUTO_68 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_61 ?AUTO_65 ?AUTO_68 )
      ( DELIVER-PKG ?AUTO_61 ?AUTO_62 )
      ( DELIVER-PKG-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_70 - OBJ
      ?AUTO_71 - LOCATION
    )
    :vars
    (
      ?AUTO_76 - LOCATION
      ?AUTO_78 - LOCATION
      ?AUTO_75 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_76 ) ( AIRPORT ?AUTO_71 ) ( not ( = ?AUTO_76 ?AUTO_71 ) ) ( OBJ-AT ?AUTO_70 ?AUTO_76 ) ( AIRPORT ?AUTO_78 ) ( AIRPLANE-AT ?AUTO_75 ?AUTO_78 ) ( not ( = ?AUTO_78 ?AUTO_76 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_75 ?AUTO_78 ?AUTO_76 )
      ( DELIVER-PKG ?AUTO_70 ?AUTO_71 )
      ( DELIVER-PKG-VERIFY ?AUTO_70 ?AUTO_71 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_86 - OBJ
      ?AUTO_87 - LOCATION
    )
    :vars
    (
      ?AUTO_88 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_88 ?AUTO_87 ) ( IN-TRUCK ?AUTO_86 ?AUTO_88 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_86 ?AUTO_88 ?AUTO_87 )
      ( DELIVER-PKG-VERIFY ?AUTO_86 ?AUTO_87 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_95 - OBJ
      ?AUTO_96 - LOCATION
    )
    :vars
    (
      ?AUTO_99 - TRUCK
      ?AUTO_102 - LOCATION
      ?AUTO_101 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_95 ?AUTO_99 ) ( TRUCK-AT ?AUTO_99 ?AUTO_102 ) ( IN-CITY ?AUTO_102 ?AUTO_101 ) ( IN-CITY ?AUTO_96 ?AUTO_101 ) ( not ( = ?AUTO_96 ?AUTO_102 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_99 ?AUTO_102 ?AUTO_96 ?AUTO_101 )
      ( DELIVER-PKG ?AUTO_95 ?AUTO_96 )
      ( DELIVER-PKG-VERIFY ?AUTO_95 ?AUTO_96 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_104 - OBJ
      ?AUTO_105 - LOCATION
    )
    :vars
    (
      ?AUTO_108 - TRUCK
      ?AUTO_110 - LOCATION
      ?AUTO_109 - CITY
      ?AUTO_112 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_108 ?AUTO_110 ) ( IN-CITY ?AUTO_110 ?AUTO_109 ) ( IN-CITY ?AUTO_105 ?AUTO_109 ) ( not ( = ?AUTO_105 ?AUTO_110 ) ) ( TRUCK-AT ?AUTO_108 ?AUTO_112 ) ( OBJ-AT ?AUTO_104 ?AUTO_112 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_104 ?AUTO_108 ?AUTO_112 )
      ( DELIVER-PKG ?AUTO_104 ?AUTO_105 )
      ( DELIVER-PKG-VERIFY ?AUTO_104 ?AUTO_105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_118 - OBJ
      ?AUTO_119 - LOCATION
    )
    :vars
    (
      ?AUTO_124 - TRUCK
      ?AUTO_120 - LOCATION
      ?AUTO_121 - CITY
      ?AUTO_125 - LOCATION
      ?AUTO_126 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_124 ?AUTO_120 ) ( IN-CITY ?AUTO_120 ?AUTO_121 ) ( IN-CITY ?AUTO_119 ?AUTO_121 ) ( not ( = ?AUTO_119 ?AUTO_120 ) ) ( TRUCK-AT ?AUTO_124 ?AUTO_125 ) ( IN-AIRPLANE ?AUTO_118 ?AUTO_126 ) ( AIRPLANE-AT ?AUTO_126 ?AUTO_125 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_118 ?AUTO_126 ?AUTO_125 )
      ( DELIVER-PKG ?AUTO_118 ?AUTO_119 )
      ( DELIVER-PKG-VERIFY ?AUTO_118 ?AUTO_119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_129 - OBJ
      ?AUTO_130 - LOCATION
    )
    :vars
    (
      ?AUTO_134 - LOCATION
      ?AUTO_133 - CITY
      ?AUTO_137 - AIRPLANE
      ?AUTO_135 - TRUCK
      ?AUTO_140 - LOCATION
      ?AUTO_139 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_134 ?AUTO_133 ) ( IN-CITY ?AUTO_130 ?AUTO_133 ) ( not ( = ?AUTO_130 ?AUTO_134 ) ) ( IN-AIRPLANE ?AUTO_129 ?AUTO_137 ) ( AIRPLANE-AT ?AUTO_137 ?AUTO_134 ) ( TRUCK-AT ?AUTO_135 ?AUTO_140 ) ( IN-CITY ?AUTO_140 ?AUTO_139 ) ( IN-CITY ?AUTO_134 ?AUTO_139 ) ( not ( = ?AUTO_134 ?AUTO_140 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_135 ?AUTO_140 ?AUTO_134 ?AUTO_139 )
      ( DELIVER-PKG ?AUTO_129 ?AUTO_130 )
      ( DELIVER-PKG-VERIFY ?AUTO_129 ?AUTO_130 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_142 - OBJ
      ?AUTO_143 - LOCATION
    )
    :vars
    (
      ?AUTO_149 - LOCATION
      ?AUTO_148 - CITY
      ?AUTO_147 - AIRPLANE
      ?AUTO_150 - TRUCK
      ?AUTO_151 - LOCATION
      ?AUTO_145 - CITY
      ?AUTO_153 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_149 ?AUTO_148 ) ( IN-CITY ?AUTO_143 ?AUTO_148 ) ( not ( = ?AUTO_143 ?AUTO_149 ) ) ( IN-AIRPLANE ?AUTO_142 ?AUTO_147 ) ( TRUCK-AT ?AUTO_150 ?AUTO_151 ) ( IN-CITY ?AUTO_151 ?AUTO_145 ) ( IN-CITY ?AUTO_149 ?AUTO_145 ) ( not ( = ?AUTO_149 ?AUTO_151 ) ) ( AIRPORT ?AUTO_153 ) ( AIRPORT ?AUTO_149 ) ( AIRPLANE-AT ?AUTO_147 ?AUTO_153 ) ( not ( = ?AUTO_153 ?AUTO_149 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_147 ?AUTO_153 ?AUTO_149 )
      ( DELIVER-PKG ?AUTO_142 ?AUTO_143 )
      ( DELIVER-PKG-VERIFY ?AUTO_142 ?AUTO_143 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_159 - OBJ
      ?AUTO_160 - LOCATION
    )
    :vars
    (
      ?AUTO_161 - LOCATION
      ?AUTO_169 - CITY
      ?AUTO_168 - TRUCK
      ?AUTO_162 - LOCATION
      ?AUTO_165 - CITY
      ?AUTO_167 - LOCATION
      ?AUTO_166 - AIRPLANE
      ?AUTO_171 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_161 ?AUTO_169 ) ( IN-CITY ?AUTO_160 ?AUTO_169 ) ( not ( = ?AUTO_160 ?AUTO_161 ) ) ( TRUCK-AT ?AUTO_168 ?AUTO_162 ) ( IN-CITY ?AUTO_162 ?AUTO_165 ) ( IN-CITY ?AUTO_161 ?AUTO_165 ) ( not ( = ?AUTO_161 ?AUTO_162 ) ) ( AIRPORT ?AUTO_167 ) ( AIRPORT ?AUTO_161 ) ( AIRPLANE-AT ?AUTO_166 ?AUTO_167 ) ( not ( = ?AUTO_167 ?AUTO_161 ) ) ( OBJ-AT ?AUTO_159 ?AUTO_171 ) ( AIRPLANE-AT ?AUTO_166 ?AUTO_171 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_159 ?AUTO_166 ?AUTO_171 )
      ( DELIVER-PKG ?AUTO_159 ?AUTO_160 )
      ( DELIVER-PKG-VERIFY ?AUTO_159 ?AUTO_160 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_173 - OBJ
      ?AUTO_174 - LOCATION
    )
    :vars
    (
      ?AUTO_180 - LOCATION
      ?AUTO_179 - CITY
      ?AUTO_178 - TRUCK
      ?AUTO_176 - LOCATION
      ?AUTO_181 - CITY
      ?AUTO_184 - LOCATION
      ?AUTO_186 - LOCATION
      ?AUTO_182 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_180 ?AUTO_179 ) ( IN-CITY ?AUTO_174 ?AUTO_179 ) ( not ( = ?AUTO_174 ?AUTO_180 ) ) ( TRUCK-AT ?AUTO_178 ?AUTO_176 ) ( IN-CITY ?AUTO_176 ?AUTO_181 ) ( IN-CITY ?AUTO_180 ?AUTO_181 ) ( not ( = ?AUTO_180 ?AUTO_176 ) ) ( AIRPORT ?AUTO_184 ) ( AIRPORT ?AUTO_180 ) ( not ( = ?AUTO_184 ?AUTO_180 ) ) ( OBJ-AT ?AUTO_173 ?AUTO_184 ) ( AIRPORT ?AUTO_186 ) ( AIRPLANE-AT ?AUTO_182 ?AUTO_186 ) ( not ( = ?AUTO_186 ?AUTO_184 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_182 ?AUTO_186 ?AUTO_184 )
      ( DELIVER-PKG ?AUTO_173 ?AUTO_174 )
      ( DELIVER-PKG-VERIFY ?AUTO_173 ?AUTO_174 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_190 - OBJ
      ?AUTO_191 - LOCATION
    )
    :vars
    (
      ?AUTO_192 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_192 ?AUTO_191 ) ( IN-TRUCK ?AUTO_190 ?AUTO_192 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_190 ?AUTO_192 ?AUTO_191 )
      ( DELIVER-PKG-VERIFY ?AUTO_190 ?AUTO_191 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_197 - OBJ
      ?AUTO_198 - LOCATION
    )
    :vars
    (
      ?AUTO_201 - TRUCK
      ?AUTO_204 - LOCATION
      ?AUTO_203 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_197 ?AUTO_201 ) ( TRUCK-AT ?AUTO_201 ?AUTO_204 ) ( IN-CITY ?AUTO_204 ?AUTO_203 ) ( IN-CITY ?AUTO_198 ?AUTO_203 ) ( not ( = ?AUTO_198 ?AUTO_204 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_201 ?AUTO_204 ?AUTO_198 ?AUTO_203 )
      ( DELIVER-PKG ?AUTO_197 ?AUTO_198 )
      ( DELIVER-PKG-VERIFY ?AUTO_197 ?AUTO_198 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_206 - OBJ
      ?AUTO_207 - LOCATION
    )
    :vars
    (
      ?AUTO_210 - TRUCK
      ?AUTO_212 - LOCATION
      ?AUTO_211 - CITY
      ?AUTO_214 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_210 ?AUTO_212 ) ( IN-CITY ?AUTO_212 ?AUTO_211 ) ( IN-CITY ?AUTO_207 ?AUTO_211 ) ( not ( = ?AUTO_207 ?AUTO_212 ) ) ( TRUCK-AT ?AUTO_210 ?AUTO_214 ) ( OBJ-AT ?AUTO_206 ?AUTO_214 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_206 ?AUTO_210 ?AUTO_214 )
      ( DELIVER-PKG ?AUTO_206 ?AUTO_207 )
      ( DELIVER-PKG-VERIFY ?AUTO_206 ?AUTO_207 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_220 - OBJ
      ?AUTO_221 - LOCATION
    )
    :vars
    (
      ?AUTO_225 - TRUCK
      ?AUTO_222 - LOCATION
      ?AUTO_223 - CITY
      ?AUTO_227 - LOCATION
      ?AUTO_228 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_225 ?AUTO_222 ) ( IN-CITY ?AUTO_222 ?AUTO_223 ) ( IN-CITY ?AUTO_221 ?AUTO_223 ) ( not ( = ?AUTO_221 ?AUTO_222 ) ) ( TRUCK-AT ?AUTO_225 ?AUTO_227 ) ( IN-AIRPLANE ?AUTO_220 ?AUTO_228 ) ( AIRPLANE-AT ?AUTO_228 ?AUTO_227 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_220 ?AUTO_228 ?AUTO_227 )
      ( DELIVER-PKG ?AUTO_220 ?AUTO_221 )
      ( DELIVER-PKG-VERIFY ?AUTO_220 ?AUTO_221 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_231 - OBJ
      ?AUTO_232 - LOCATION
    )
    :vars
    (
      ?AUTO_238 - TRUCK
      ?AUTO_237 - LOCATION
      ?AUTO_236 - CITY
      ?AUTO_239 - LOCATION
      ?AUTO_233 - AIRPLANE
      ?AUTO_241 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_238 ?AUTO_237 ) ( IN-CITY ?AUTO_237 ?AUTO_236 ) ( IN-CITY ?AUTO_232 ?AUTO_236 ) ( not ( = ?AUTO_232 ?AUTO_237 ) ) ( TRUCK-AT ?AUTO_238 ?AUTO_239 ) ( IN-AIRPLANE ?AUTO_231 ?AUTO_233 ) ( AIRPORT ?AUTO_241 ) ( AIRPORT ?AUTO_239 ) ( AIRPLANE-AT ?AUTO_233 ?AUTO_241 ) ( not ( = ?AUTO_241 ?AUTO_239 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_233 ?AUTO_241 ?AUTO_239 )
      ( DELIVER-PKG ?AUTO_231 ?AUTO_232 )
      ( DELIVER-PKG-VERIFY ?AUTO_231 ?AUTO_232 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_249 - OBJ
      ?AUTO_250 - LOCATION
    )
    :vars
    (
      ?AUTO_257 - TRUCK
      ?AUTO_256 - LOCATION
      ?AUTO_252 - CITY
      ?AUTO_253 - LOCATION
      ?AUTO_254 - LOCATION
      ?AUTO_255 - AIRPLANE
      ?AUTO_260 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_257 ?AUTO_256 ) ( IN-CITY ?AUTO_256 ?AUTO_252 ) ( IN-CITY ?AUTO_250 ?AUTO_252 ) ( not ( = ?AUTO_250 ?AUTO_256 ) ) ( TRUCK-AT ?AUTO_257 ?AUTO_253 ) ( AIRPORT ?AUTO_254 ) ( AIRPORT ?AUTO_253 ) ( AIRPLANE-AT ?AUTO_255 ?AUTO_254 ) ( not ( = ?AUTO_254 ?AUTO_253 ) ) ( OBJ-AT ?AUTO_249 ?AUTO_260 ) ( AIRPLANE-AT ?AUTO_255 ?AUTO_260 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_249 ?AUTO_255 ?AUTO_260 )
      ( DELIVER-PKG ?AUTO_249 ?AUTO_250 )
      ( DELIVER-PKG-VERIFY ?AUTO_249 ?AUTO_250 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_262 - OBJ
      ?AUTO_263 - LOCATION
    )
    :vars
    (
      ?AUTO_266 - TRUCK
      ?AUTO_270 - LOCATION
      ?AUTO_268 - CITY
      ?AUTO_267 - LOCATION
      ?AUTO_272 - LOCATION
      ?AUTO_274 - LOCATION
      ?AUTO_269 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_266 ?AUTO_270 ) ( IN-CITY ?AUTO_270 ?AUTO_268 ) ( IN-CITY ?AUTO_263 ?AUTO_268 ) ( not ( = ?AUTO_263 ?AUTO_270 ) ) ( TRUCK-AT ?AUTO_266 ?AUTO_267 ) ( AIRPORT ?AUTO_272 ) ( AIRPORT ?AUTO_267 ) ( not ( = ?AUTO_272 ?AUTO_267 ) ) ( OBJ-AT ?AUTO_262 ?AUTO_272 ) ( AIRPORT ?AUTO_274 ) ( AIRPLANE-AT ?AUTO_269 ?AUTO_274 ) ( not ( = ?AUTO_274 ?AUTO_272 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_269 ?AUTO_274 ?AUTO_272 )
      ( DELIVER-PKG ?AUTO_262 ?AUTO_263 )
      ( DELIVER-PKG-VERIFY ?AUTO_262 ?AUTO_263 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_282 - OBJ
      ?AUTO_283 - LOCATION
    )
    :vars
    (
      ?AUTO_284 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_284 ?AUTO_283 ) ( IN-TRUCK ?AUTO_282 ?AUTO_284 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_282 ?AUTO_284 ?AUTO_283 )
      ( DELIVER-PKG-VERIFY ?AUTO_282 ?AUTO_283 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_287 - OBJ
      ?AUTO_288 - LOCATION
    )
    :vars
    (
      ?AUTO_291 - TRUCK
      ?AUTO_294 - LOCATION
      ?AUTO_293 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_287 ?AUTO_291 ) ( TRUCK-AT ?AUTO_291 ?AUTO_294 ) ( IN-CITY ?AUTO_294 ?AUTO_293 ) ( IN-CITY ?AUTO_288 ?AUTO_293 ) ( not ( = ?AUTO_288 ?AUTO_294 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_291 ?AUTO_294 ?AUTO_288 ?AUTO_293 )
      ( DELIVER-PKG ?AUTO_287 ?AUTO_288 )
      ( DELIVER-PKG-VERIFY ?AUTO_287 ?AUTO_288 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_296 - OBJ
      ?AUTO_297 - LOCATION
    )
    :vars
    (
      ?AUTO_300 - TRUCK
      ?AUTO_302 - LOCATION
      ?AUTO_301 - CITY
      ?AUTO_304 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_300 ?AUTO_302 ) ( IN-CITY ?AUTO_302 ?AUTO_301 ) ( IN-CITY ?AUTO_297 ?AUTO_301 ) ( not ( = ?AUTO_297 ?AUTO_302 ) ) ( TRUCK-AT ?AUTO_300 ?AUTO_304 ) ( OBJ-AT ?AUTO_296 ?AUTO_304 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_296 ?AUTO_300 ?AUTO_304 )
      ( DELIVER-PKG ?AUTO_296 ?AUTO_297 )
      ( DELIVER-PKG-VERIFY ?AUTO_296 ?AUTO_297 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_306 - OBJ
      ?AUTO_307 - LOCATION
    )
    :vars
    (
      ?AUTO_309 - LOCATION
      ?AUTO_313 - CITY
      ?AUTO_312 - TRUCK
      ?AUTO_316 - LOCATION
      ?AUTO_315 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_309 ?AUTO_313 ) ( IN-CITY ?AUTO_307 ?AUTO_313 ) ( not ( = ?AUTO_307 ?AUTO_309 ) ) ( OBJ-AT ?AUTO_306 ?AUTO_309 ) ( TRUCK-AT ?AUTO_312 ?AUTO_316 ) ( IN-CITY ?AUTO_316 ?AUTO_315 ) ( IN-CITY ?AUTO_309 ?AUTO_315 ) ( not ( = ?AUTO_309 ?AUTO_316 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_312 ?AUTO_316 ?AUTO_309 ?AUTO_315 )
      ( DELIVER-PKG ?AUTO_306 ?AUTO_307 )
      ( DELIVER-PKG-VERIFY ?AUTO_306 ?AUTO_307 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_319 - OBJ
      ?AUTO_320 - LOCATION
    )
    :vars
    (
      ?AUTO_321 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_321 ?AUTO_320 ) ( IN-TRUCK ?AUTO_319 ?AUTO_321 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_319 ?AUTO_321 ?AUTO_320 )
      ( DELIVER-PKG-VERIFY ?AUTO_319 ?AUTO_320 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_330 - OBJ
      ?AUTO_331 - LOCATION
    )
    :vars
    (
      ?AUTO_332 - TRUCK
      ?AUTO_337 - LOCATION
      ?AUTO_336 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_330 ?AUTO_332 ) ( TRUCK-AT ?AUTO_332 ?AUTO_337 ) ( IN-CITY ?AUTO_337 ?AUTO_336 ) ( IN-CITY ?AUTO_331 ?AUTO_336 ) ( not ( = ?AUTO_331 ?AUTO_337 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_332 ?AUTO_337 ?AUTO_331 ?AUTO_336 )
      ( DELIVER-PKG ?AUTO_330 ?AUTO_331 )
      ( DELIVER-PKG-VERIFY ?AUTO_330 ?AUTO_331 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_339 - OBJ
      ?AUTO_340 - LOCATION
    )
    :vars
    (
      ?AUTO_343 - TRUCK
      ?AUTO_345 - LOCATION
      ?AUTO_344 - CITY
      ?AUTO_347 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_343 ?AUTO_345 ) ( IN-CITY ?AUTO_345 ?AUTO_344 ) ( IN-CITY ?AUTO_340 ?AUTO_344 ) ( not ( = ?AUTO_340 ?AUTO_345 ) ) ( TRUCK-AT ?AUTO_343 ?AUTO_347 ) ( OBJ-AT ?AUTO_339 ?AUTO_347 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_339 ?AUTO_343 ?AUTO_347 )
      ( DELIVER-PKG ?AUTO_339 ?AUTO_340 )
      ( DELIVER-PKG-VERIFY ?AUTO_339 ?AUTO_340 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_349 - OBJ
      ?AUTO_350 - LOCATION
    )
    :vars
    (
      ?AUTO_356 - LOCATION
      ?AUTO_354 - CITY
      ?AUTO_353 - TRUCK
      ?AUTO_359 - LOCATION
      ?AUTO_358 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_356 ?AUTO_354 ) ( IN-CITY ?AUTO_350 ?AUTO_354 ) ( not ( = ?AUTO_350 ?AUTO_356 ) ) ( OBJ-AT ?AUTO_349 ?AUTO_356 ) ( TRUCK-AT ?AUTO_353 ?AUTO_359 ) ( IN-CITY ?AUTO_359 ?AUTO_358 ) ( IN-CITY ?AUTO_356 ?AUTO_358 ) ( not ( = ?AUTO_356 ?AUTO_359 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_353 ?AUTO_359 ?AUTO_356 ?AUTO_358 )
      ( DELIVER-PKG ?AUTO_349 ?AUTO_350 )
      ( DELIVER-PKG-VERIFY ?AUTO_349 ?AUTO_350 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_363 - OBJ
      ?AUTO_364 - LOCATION
    )
    :vars
    (
      ?AUTO_365 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_363 ?AUTO_365 ) ( AIRPLANE-AT ?AUTO_365 ?AUTO_364 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_363 ?AUTO_365 ?AUTO_364 )
      ( DELIVER-PKG-VERIFY ?AUTO_363 ?AUTO_364 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_372 - OBJ
      ?AUTO_373 - LOCATION
    )
    :vars
    (
      ?AUTO_376 - AIRPLANE
      ?AUTO_378 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_372 ?AUTO_376 ) ( AIRPORT ?AUTO_378 ) ( AIRPORT ?AUTO_373 ) ( AIRPLANE-AT ?AUTO_376 ?AUTO_378 ) ( not ( = ?AUTO_378 ?AUTO_373 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_376 ?AUTO_378 ?AUTO_373 )
      ( DELIVER-PKG ?AUTO_372 ?AUTO_373 )
      ( DELIVER-PKG-VERIFY ?AUTO_372 ?AUTO_373 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_380 - OBJ
      ?AUTO_381 - LOCATION
    )
    :vars
    (
      ?AUTO_385 - LOCATION
      ?AUTO_384 - AIRPLANE
      ?AUTO_387 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_385 ) ( AIRPORT ?AUTO_381 ) ( AIRPLANE-AT ?AUTO_384 ?AUTO_385 ) ( not ( = ?AUTO_385 ?AUTO_381 ) ) ( OBJ-AT ?AUTO_380 ?AUTO_387 ) ( AIRPLANE-AT ?AUTO_384 ?AUTO_387 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_380 ?AUTO_384 ?AUTO_387 )
      ( DELIVER-PKG ?AUTO_380 ?AUTO_381 )
      ( DELIVER-PKG-VERIFY ?AUTO_380 ?AUTO_381 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_397 - OBJ
      ?AUTO_398 - LOCATION
    )
    :vars
    (
      ?AUTO_399 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_399 ?AUTO_398 ) ( IN-TRUCK ?AUTO_397 ?AUTO_399 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_397 ?AUTO_399 ?AUTO_398 )
      ( DELIVER-PKG-VERIFY ?AUTO_397 ?AUTO_398 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_408 - OBJ
      ?AUTO_409 - LOCATION
    )
    :vars
    (
      ?AUTO_411 - TRUCK
      ?AUTO_415 - LOCATION
      ?AUTO_414 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_408 ?AUTO_411 ) ( TRUCK-AT ?AUTO_411 ?AUTO_415 ) ( IN-CITY ?AUTO_415 ?AUTO_414 ) ( IN-CITY ?AUTO_409 ?AUTO_414 ) ( not ( = ?AUTO_409 ?AUTO_415 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_411 ?AUTO_415 ?AUTO_409 ?AUTO_414 )
      ( DELIVER-PKG ?AUTO_408 ?AUTO_409 )
      ( DELIVER-PKG-VERIFY ?AUTO_408 ?AUTO_409 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_417 - OBJ
      ?AUTO_418 - LOCATION
    )
    :vars
    (
      ?AUTO_421 - TRUCK
      ?AUTO_423 - LOCATION
      ?AUTO_422 - CITY
      ?AUTO_425 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_421 ?AUTO_423 ) ( IN-CITY ?AUTO_423 ?AUTO_422 ) ( IN-CITY ?AUTO_418 ?AUTO_422 ) ( not ( = ?AUTO_418 ?AUTO_423 ) ) ( TRUCK-AT ?AUTO_421 ?AUTO_425 ) ( OBJ-AT ?AUTO_417 ?AUTO_425 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_417 ?AUTO_421 ?AUTO_425 )
      ( DELIVER-PKG ?AUTO_417 ?AUTO_418 )
      ( DELIVER-PKG-VERIFY ?AUTO_417 ?AUTO_418 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_427 - OBJ
      ?AUTO_428 - LOCATION
    )
    :vars
    (
      ?AUTO_431 - TRUCK
      ?AUTO_433 - LOCATION
      ?AUTO_432 - CITY
      ?AUTO_434 - LOCATION
      ?AUTO_435 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_431 ?AUTO_433 ) ( IN-CITY ?AUTO_433 ?AUTO_432 ) ( IN-CITY ?AUTO_428 ?AUTO_432 ) ( not ( = ?AUTO_428 ?AUTO_433 ) ) ( TRUCK-AT ?AUTO_431 ?AUTO_434 ) ( IN-AIRPLANE ?AUTO_427 ?AUTO_435 ) ( AIRPLANE-AT ?AUTO_435 ?AUTO_434 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_427 ?AUTO_435 ?AUTO_434 )
      ( DELIVER-PKG ?AUTO_427 ?AUTO_428 )
      ( DELIVER-PKG-VERIFY ?AUTO_427 ?AUTO_428 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_442 - OBJ
      ?AUTO_443 - LOCATION
    )
    :vars
    (
      ?AUTO_446 - TRUCK
      ?AUTO_445 - LOCATION
      ?AUTO_450 - CITY
      ?AUTO_449 - LOCATION
      ?AUTO_448 - AIRPLANE
      ?AUTO_452 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_446 ?AUTO_445 ) ( IN-CITY ?AUTO_445 ?AUTO_450 ) ( IN-CITY ?AUTO_443 ?AUTO_450 ) ( not ( = ?AUTO_443 ?AUTO_445 ) ) ( TRUCK-AT ?AUTO_446 ?AUTO_449 ) ( IN-AIRPLANE ?AUTO_442 ?AUTO_448 ) ( AIRPORT ?AUTO_452 ) ( AIRPORT ?AUTO_449 ) ( AIRPLANE-AT ?AUTO_448 ?AUTO_452 ) ( not ( = ?AUTO_452 ?AUTO_449 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_448 ?AUTO_452 ?AUTO_449 )
      ( DELIVER-PKG ?AUTO_442 ?AUTO_443 )
      ( DELIVER-PKG-VERIFY ?AUTO_442 ?AUTO_443 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_454 - OBJ
      ?AUTO_455 - LOCATION
    )
    :vars
    (
      ?AUTO_462 - TRUCK
      ?AUTO_458 - LOCATION
      ?AUTO_459 - CITY
      ?AUTO_460 - LOCATION
      ?AUTO_463 - LOCATION
      ?AUTO_461 - AIRPLANE
      ?AUTO_465 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_462 ?AUTO_458 ) ( IN-CITY ?AUTO_458 ?AUTO_459 ) ( IN-CITY ?AUTO_455 ?AUTO_459 ) ( not ( = ?AUTO_455 ?AUTO_458 ) ) ( TRUCK-AT ?AUTO_462 ?AUTO_460 ) ( AIRPORT ?AUTO_463 ) ( AIRPORT ?AUTO_460 ) ( AIRPLANE-AT ?AUTO_461 ?AUTO_463 ) ( not ( = ?AUTO_463 ?AUTO_460 ) ) ( OBJ-AT ?AUTO_454 ?AUTO_465 ) ( AIRPLANE-AT ?AUTO_461 ?AUTO_465 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_454 ?AUTO_461 ?AUTO_465 )
      ( DELIVER-PKG ?AUTO_454 ?AUTO_455 )
      ( DELIVER-PKG-VERIFY ?AUTO_454 ?AUTO_455 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_475 - OBJ
      ?AUTO_476 - LOCATION
    )
    :vars
    (
      ?AUTO_477 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_475 ?AUTO_477 ) ( AIRPLANE-AT ?AUTO_477 ?AUTO_476 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_475 ?AUTO_477 ?AUTO_476 )
      ( DELIVER-PKG-VERIFY ?AUTO_475 ?AUTO_476 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_484 - OBJ
      ?AUTO_485 - LOCATION
    )
    :vars
    (
      ?AUTO_488 - AIRPLANE
      ?AUTO_490 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_484 ?AUTO_488 ) ( AIRPORT ?AUTO_490 ) ( AIRPORT ?AUTO_485 ) ( AIRPLANE-AT ?AUTO_488 ?AUTO_490 ) ( not ( = ?AUTO_490 ?AUTO_485 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_488 ?AUTO_490 ?AUTO_485 )
      ( DELIVER-PKG ?AUTO_484 ?AUTO_485 )
      ( DELIVER-PKG-VERIFY ?AUTO_484 ?AUTO_485 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_492 - OBJ
      ?AUTO_493 - LOCATION
    )
    :vars
    (
      ?AUTO_497 - LOCATION
      ?AUTO_496 - AIRPLANE
      ?AUTO_499 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_497 ) ( AIRPORT ?AUTO_493 ) ( AIRPLANE-AT ?AUTO_496 ?AUTO_497 ) ( not ( = ?AUTO_497 ?AUTO_493 ) ) ( OBJ-AT ?AUTO_492 ?AUTO_499 ) ( AIRPLANE-AT ?AUTO_496 ?AUTO_499 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_492 ?AUTO_496 ?AUTO_499 )
      ( DELIVER-PKG ?AUTO_492 ?AUTO_493 )
      ( DELIVER-PKG-VERIFY ?AUTO_492 ?AUTO_493 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_523 - OBJ
      ?AUTO_524 - LOCATION
    )
    :vars
    (
      ?AUTO_525 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_523 ?AUTO_525 ) ( AIRPLANE-AT ?AUTO_525 ?AUTO_524 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_523 ?AUTO_525 ?AUTO_524 )
      ( DELIVER-PKG-VERIFY ?AUTO_523 ?AUTO_524 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_528 - OBJ
      ?AUTO_529 - LOCATION
    )
    :vars
    (
      ?AUTO_532 - AIRPLANE
      ?AUTO_534 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_528 ?AUTO_532 ) ( AIRPORT ?AUTO_534 ) ( AIRPORT ?AUTO_529 ) ( AIRPLANE-AT ?AUTO_532 ?AUTO_534 ) ( not ( = ?AUTO_534 ?AUTO_529 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_532 ?AUTO_534 ?AUTO_529 )
      ( DELIVER-PKG ?AUTO_528 ?AUTO_529 )
      ( DELIVER-PKG-VERIFY ?AUTO_528 ?AUTO_529 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_568 - OBJ
      ?AUTO_569 - LOCATION
    )
    :vars
    (
      ?AUTO_570 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_568 ?AUTO_570 ) ( AIRPLANE-AT ?AUTO_570 ?AUTO_569 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_568 ?AUTO_570 ?AUTO_569 )
      ( DELIVER-PKG-VERIFY ?AUTO_568 ?AUTO_569 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_577 - OBJ
      ?AUTO_578 - LOCATION
    )
    :vars
    (
      ?AUTO_581 - AIRPLANE
      ?AUTO_583 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_577 ?AUTO_581 ) ( AIRPORT ?AUTO_583 ) ( AIRPORT ?AUTO_578 ) ( AIRPLANE-AT ?AUTO_581 ?AUTO_583 ) ( not ( = ?AUTO_583 ?AUTO_578 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_581 ?AUTO_583 ?AUTO_578 )
      ( DELIVER-PKG ?AUTO_577 ?AUTO_578 )
      ( DELIVER-PKG-VERIFY ?AUTO_577 ?AUTO_578 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_585 - OBJ
      ?AUTO_586 - LOCATION
    )
    :vars
    (
      ?AUTO_590 - LOCATION
      ?AUTO_589 - AIRPLANE
      ?AUTO_592 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_590 ) ( AIRPORT ?AUTO_586 ) ( AIRPLANE-AT ?AUTO_589 ?AUTO_590 ) ( not ( = ?AUTO_590 ?AUTO_586 ) ) ( OBJ-AT ?AUTO_585 ?AUTO_592 ) ( AIRPLANE-AT ?AUTO_589 ?AUTO_592 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_585 ?AUTO_589 ?AUTO_592 )
      ( DELIVER-PKG ?AUTO_585 ?AUTO_586 )
      ( DELIVER-PKG-VERIFY ?AUTO_585 ?AUTO_586 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_594 - OBJ
      ?AUTO_595 - LOCATION
    )
    :vars
    (
      ?AUTO_596 - LOCATION
      ?AUTO_602 - LOCATION
      ?AUTO_599 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_596 ) ( AIRPORT ?AUTO_595 ) ( not ( = ?AUTO_596 ?AUTO_595 ) ) ( OBJ-AT ?AUTO_594 ?AUTO_596 ) ( AIRPORT ?AUTO_602 ) ( AIRPLANE-AT ?AUTO_599 ?AUTO_602 ) ( not ( = ?AUTO_602 ?AUTO_596 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_599 ?AUTO_602 ?AUTO_596 )
      ( DELIVER-PKG ?AUTO_594 ?AUTO_595 )
      ( DELIVER-PKG-VERIFY ?AUTO_594 ?AUTO_595 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_624 - OBJ
      ?AUTO_625 - LOCATION
    )
    :vars
    (
      ?AUTO_628 - LOCATION
      ?AUTO_626 - LOCATION
      ?AUTO_630 - AIRPLANE
      ?AUTO_631 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_628 ) ( AIRPORT ?AUTO_625 ) ( not ( = ?AUTO_628 ?AUTO_625 ) ) ( AIRPORT ?AUTO_626 ) ( AIRPLANE-AT ?AUTO_630 ?AUTO_626 ) ( not ( = ?AUTO_626 ?AUTO_628 ) ) ( TRUCK-AT ?AUTO_631 ?AUTO_628 ) ( IN-TRUCK ?AUTO_624 ?AUTO_631 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_624 ?AUTO_631 ?AUTO_628 )
      ( DELIVER-PKG ?AUTO_624 ?AUTO_625 )
      ( DELIVER-PKG-VERIFY ?AUTO_624 ?AUTO_625 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_640 - OBJ
      ?AUTO_641 - LOCATION
    )
    :vars
    (
      ?AUTO_642 - LOCATION
      ?AUTO_644 - LOCATION
      ?AUTO_643 - AIRPLANE
      ?AUTO_646 - TRUCK
      ?AUTO_650 - LOCATION
      ?AUTO_649 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_642 ) ( AIRPORT ?AUTO_641 ) ( not ( = ?AUTO_642 ?AUTO_641 ) ) ( AIRPORT ?AUTO_644 ) ( AIRPLANE-AT ?AUTO_643 ?AUTO_644 ) ( not ( = ?AUTO_644 ?AUTO_642 ) ) ( IN-TRUCK ?AUTO_640 ?AUTO_646 ) ( TRUCK-AT ?AUTO_646 ?AUTO_650 ) ( IN-CITY ?AUTO_650 ?AUTO_649 ) ( IN-CITY ?AUTO_642 ?AUTO_649 ) ( not ( = ?AUTO_642 ?AUTO_650 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_646 ?AUTO_650 ?AUTO_642 ?AUTO_649 )
      ( DELIVER-PKG ?AUTO_640 ?AUTO_641 )
      ( DELIVER-PKG-VERIFY ?AUTO_640 ?AUTO_641 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_652 - OBJ
      ?AUTO_653 - LOCATION
    )
    :vars
    (
      ?AUTO_657 - LOCATION
      ?AUTO_661 - LOCATION
      ?AUTO_656 - AIRPLANE
      ?AUTO_658 - TRUCK
      ?AUTO_659 - LOCATION
      ?AUTO_660 - CITY
      ?AUTO_663 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_657 ) ( AIRPORT ?AUTO_653 ) ( not ( = ?AUTO_657 ?AUTO_653 ) ) ( AIRPORT ?AUTO_661 ) ( AIRPLANE-AT ?AUTO_656 ?AUTO_661 ) ( not ( = ?AUTO_661 ?AUTO_657 ) ) ( TRUCK-AT ?AUTO_658 ?AUTO_659 ) ( IN-CITY ?AUTO_659 ?AUTO_660 ) ( IN-CITY ?AUTO_657 ?AUTO_660 ) ( not ( = ?AUTO_657 ?AUTO_659 ) ) ( TRUCK-AT ?AUTO_658 ?AUTO_663 ) ( OBJ-AT ?AUTO_652 ?AUTO_663 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_652 ?AUTO_658 ?AUTO_663 )
      ( DELIVER-PKG ?AUTO_652 ?AUTO_653 )
      ( DELIVER-PKG-VERIFY ?AUTO_652 ?AUTO_653 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_665 - OBJ
      ?AUTO_666 - LOCATION
    )
    :vars
    (
      ?AUTO_675 - LOCATION
      ?AUTO_674 - LOCATION
      ?AUTO_670 - AIRPLANE
      ?AUTO_671 - LOCATION
      ?AUTO_672 - CITY
      ?AUTO_673 - TRUCK
      ?AUTO_678 - LOCATION
      ?AUTO_677 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_675 ) ( AIRPORT ?AUTO_666 ) ( not ( = ?AUTO_675 ?AUTO_666 ) ) ( AIRPORT ?AUTO_674 ) ( AIRPLANE-AT ?AUTO_670 ?AUTO_674 ) ( not ( = ?AUTO_674 ?AUTO_675 ) ) ( IN-CITY ?AUTO_671 ?AUTO_672 ) ( IN-CITY ?AUTO_675 ?AUTO_672 ) ( not ( = ?AUTO_675 ?AUTO_671 ) ) ( OBJ-AT ?AUTO_665 ?AUTO_671 ) ( TRUCK-AT ?AUTO_673 ?AUTO_678 ) ( IN-CITY ?AUTO_678 ?AUTO_677 ) ( IN-CITY ?AUTO_671 ?AUTO_677 ) ( not ( = ?AUTO_671 ?AUTO_678 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_673 ?AUTO_678 ?AUTO_671 ?AUTO_677 )
      ( DELIVER-PKG ?AUTO_665 ?AUTO_666 )
      ( DELIVER-PKG-VERIFY ?AUTO_665 ?AUTO_666 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_682 - OBJ
      ?AUTO_683 - LOCATION
    )
    :vars
    (
      ?AUTO_684 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_684 ?AUTO_683 ) ( IN-TRUCK ?AUTO_682 ?AUTO_684 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_682 ?AUTO_684 ?AUTO_683 )
      ( DELIVER-PKG-VERIFY ?AUTO_682 ?AUTO_683 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_689 - OBJ
      ?AUTO_690 - LOCATION
    )
    :vars
    (
      ?AUTO_693 - TRUCK
      ?AUTO_696 - LOCATION
      ?AUTO_695 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_689 ?AUTO_693 ) ( TRUCK-AT ?AUTO_693 ?AUTO_696 ) ( IN-CITY ?AUTO_696 ?AUTO_695 ) ( IN-CITY ?AUTO_690 ?AUTO_695 ) ( not ( = ?AUTO_690 ?AUTO_696 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_693 ?AUTO_696 ?AUTO_690 ?AUTO_695 )
      ( DELIVER-PKG ?AUTO_689 ?AUTO_690 )
      ( DELIVER-PKG-VERIFY ?AUTO_689 ?AUTO_690 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_698 - OBJ
      ?AUTO_699 - LOCATION
    )
    :vars
    (
      ?AUTO_702 - TRUCK
      ?AUTO_704 - LOCATION
      ?AUTO_703 - CITY
      ?AUTO_706 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_702 ?AUTO_704 ) ( IN-CITY ?AUTO_704 ?AUTO_703 ) ( IN-CITY ?AUTO_699 ?AUTO_703 ) ( not ( = ?AUTO_699 ?AUTO_704 ) ) ( TRUCK-AT ?AUTO_702 ?AUTO_706 ) ( OBJ-AT ?AUTO_698 ?AUTO_706 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_698 ?AUTO_702 ?AUTO_706 )
      ( DELIVER-PKG ?AUTO_698 ?AUTO_699 )
      ( DELIVER-PKG-VERIFY ?AUTO_698 ?AUTO_699 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_714 - OBJ
      ?AUTO_715 - LOCATION
    )
    :vars
    (
      ?AUTO_716 - TRUCK
      ?AUTO_719 - LOCATION
      ?AUTO_718 - CITY
      ?AUTO_721 - LOCATION
      ?AUTO_722 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_716 ?AUTO_719 ) ( IN-CITY ?AUTO_719 ?AUTO_718 ) ( IN-CITY ?AUTO_715 ?AUTO_718 ) ( not ( = ?AUTO_715 ?AUTO_719 ) ) ( TRUCK-AT ?AUTO_716 ?AUTO_721 ) ( IN-AIRPLANE ?AUTO_714 ?AUTO_722 ) ( AIRPLANE-AT ?AUTO_722 ?AUTO_721 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_714 ?AUTO_722 ?AUTO_721 )
      ( DELIVER-PKG ?AUTO_714 ?AUTO_715 )
      ( DELIVER-PKG-VERIFY ?AUTO_714 ?AUTO_715 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_725 - OBJ
      ?AUTO_726 - LOCATION
    )
    :vars
    (
      ?AUTO_730 - TRUCK
      ?AUTO_731 - LOCATION
      ?AUTO_732 - CITY
      ?AUTO_729 - LOCATION
      ?AUTO_733 - AIRPLANE
      ?AUTO_735 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_730 ?AUTO_731 ) ( IN-CITY ?AUTO_731 ?AUTO_732 ) ( IN-CITY ?AUTO_726 ?AUTO_732 ) ( not ( = ?AUTO_726 ?AUTO_731 ) ) ( TRUCK-AT ?AUTO_730 ?AUTO_729 ) ( IN-AIRPLANE ?AUTO_725 ?AUTO_733 ) ( AIRPORT ?AUTO_735 ) ( AIRPORT ?AUTO_729 ) ( AIRPLANE-AT ?AUTO_733 ?AUTO_735 ) ( not ( = ?AUTO_735 ?AUTO_729 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_733 ?AUTO_735 ?AUTO_729 )
      ( DELIVER-PKG ?AUTO_725 ?AUTO_726 )
      ( DELIVER-PKG-VERIFY ?AUTO_725 ?AUTO_726 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_755 - OBJ
      ?AUTO_756 - LOCATION
    )
    :vars
    (
      ?AUTO_758 - TRUCK
      ?AUTO_761 - LOCATION
      ?AUTO_759 - CITY
      ?AUTO_760 - LOCATION
      ?AUTO_757 - LOCATION
      ?AUTO_762 - AIRPLANE
      ?AUTO_766 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_758 ?AUTO_761 ) ( IN-CITY ?AUTO_761 ?AUTO_759 ) ( IN-CITY ?AUTO_756 ?AUTO_759 ) ( not ( = ?AUTO_756 ?AUTO_761 ) ) ( TRUCK-AT ?AUTO_758 ?AUTO_760 ) ( AIRPORT ?AUTO_757 ) ( AIRPORT ?AUTO_760 ) ( AIRPLANE-AT ?AUTO_762 ?AUTO_757 ) ( not ( = ?AUTO_757 ?AUTO_760 ) ) ( OBJ-AT ?AUTO_755 ?AUTO_766 ) ( AIRPLANE-AT ?AUTO_762 ?AUTO_766 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_755 ?AUTO_762 ?AUTO_766 )
      ( DELIVER-PKG ?AUTO_755 ?AUTO_756 )
      ( DELIVER-PKG-VERIFY ?AUTO_755 ?AUTO_756 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_769 - OBJ
      ?AUTO_770 - LOCATION
    )
    :vars
    (
      ?AUTO_771 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_771 ?AUTO_770 ) ( IN-TRUCK ?AUTO_769 ?AUTO_771 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_769 ?AUTO_771 ?AUTO_770 )
      ( DELIVER-PKG-VERIFY ?AUTO_769 ?AUTO_770 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_774 - OBJ
      ?AUTO_775 - LOCATION
    )
    :vars
    (
      ?AUTO_778 - TRUCK
      ?AUTO_781 - LOCATION
      ?AUTO_780 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_774 ?AUTO_778 ) ( TRUCK-AT ?AUTO_778 ?AUTO_781 ) ( IN-CITY ?AUTO_781 ?AUTO_780 ) ( IN-CITY ?AUTO_775 ?AUTO_780 ) ( not ( = ?AUTO_775 ?AUTO_781 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_778 ?AUTO_781 ?AUTO_775 ?AUTO_780 )
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
      ?AUTO_787 - TRUCK
      ?AUTO_789 - LOCATION
      ?AUTO_788 - CITY
      ?AUTO_791 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_787 ?AUTO_789 ) ( IN-CITY ?AUTO_789 ?AUTO_788 ) ( IN-CITY ?AUTO_784 ?AUTO_788 ) ( not ( = ?AUTO_784 ?AUTO_789 ) ) ( TRUCK-AT ?AUTO_787 ?AUTO_791 ) ( OBJ-AT ?AUTO_783 ?AUTO_791 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_783 ?AUTO_787 ?AUTO_791 )
      ( DELIVER-PKG ?AUTO_783 ?AUTO_784 )
      ( DELIVER-PKG-VERIFY ?AUTO_783 ?AUTO_784 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_793 - OBJ
      ?AUTO_794 - LOCATION
    )
    :vars
    (
      ?AUTO_796 - LOCATION
      ?AUTO_800 - CITY
      ?AUTO_799 - TRUCK
      ?AUTO_803 - LOCATION
      ?AUTO_802 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_796 ?AUTO_800 ) ( IN-CITY ?AUTO_794 ?AUTO_800 ) ( not ( = ?AUTO_794 ?AUTO_796 ) ) ( OBJ-AT ?AUTO_793 ?AUTO_796 ) ( TRUCK-AT ?AUTO_799 ?AUTO_803 ) ( IN-CITY ?AUTO_803 ?AUTO_802 ) ( IN-CITY ?AUTO_796 ?AUTO_802 ) ( not ( = ?AUTO_796 ?AUTO_803 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_799 ?AUTO_803 ?AUTO_796 ?AUTO_802 )
      ( DELIVER-PKG ?AUTO_793 ?AUTO_794 )
      ( DELIVER-PKG-VERIFY ?AUTO_793 ?AUTO_794 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_807 - OBJ
      ?AUTO_808 - LOCATION
    )
    :vars
    (
      ?AUTO_809 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_809 ?AUTO_808 ) ( IN-TRUCK ?AUTO_807 ?AUTO_809 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_807 ?AUTO_809 ?AUTO_808 )
      ( DELIVER-PKG-VERIFY ?AUTO_807 ?AUTO_808 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_812 - OBJ
      ?AUTO_813 - LOCATION
    )
    :vars
    (
      ?AUTO_816 - TRUCK
      ?AUTO_819 - LOCATION
      ?AUTO_818 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_812 ?AUTO_816 ) ( TRUCK-AT ?AUTO_816 ?AUTO_819 ) ( IN-CITY ?AUTO_819 ?AUTO_818 ) ( IN-CITY ?AUTO_813 ?AUTO_818 ) ( not ( = ?AUTO_813 ?AUTO_819 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_816 ?AUTO_819 ?AUTO_813 ?AUTO_818 )
      ( DELIVER-PKG ?AUTO_812 ?AUTO_813 )
      ( DELIVER-PKG-VERIFY ?AUTO_812 ?AUTO_813 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_821 - OBJ
      ?AUTO_822 - LOCATION
    )
    :vars
    (
      ?AUTO_826 - TRUCK
      ?AUTO_825 - LOCATION
      ?AUTO_827 - CITY
      ?AUTO_829 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_826 ?AUTO_825 ) ( IN-CITY ?AUTO_825 ?AUTO_827 ) ( IN-CITY ?AUTO_822 ?AUTO_827 ) ( not ( = ?AUTO_822 ?AUTO_825 ) ) ( TRUCK-AT ?AUTO_826 ?AUTO_829 ) ( OBJ-AT ?AUTO_821 ?AUTO_829 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_821 ?AUTO_826 ?AUTO_829 )
      ( DELIVER-PKG ?AUTO_821 ?AUTO_822 )
      ( DELIVER-PKG-VERIFY ?AUTO_821 ?AUTO_822 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_831 - OBJ
      ?AUTO_832 - LOCATION
    )
    :vars
    (
      ?AUTO_834 - LOCATION
      ?AUTO_833 - CITY
      ?AUTO_838 - TRUCK
      ?AUTO_841 - LOCATION
      ?AUTO_840 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_834 ?AUTO_833 ) ( IN-CITY ?AUTO_832 ?AUTO_833 ) ( not ( = ?AUTO_832 ?AUTO_834 ) ) ( OBJ-AT ?AUTO_831 ?AUTO_834 ) ( TRUCK-AT ?AUTO_838 ?AUTO_841 ) ( IN-CITY ?AUTO_841 ?AUTO_840 ) ( IN-CITY ?AUTO_834 ?AUTO_840 ) ( not ( = ?AUTO_834 ?AUTO_841 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_838 ?AUTO_841 ?AUTO_834 ?AUTO_840 )
      ( DELIVER-PKG ?AUTO_831 ?AUTO_832 )
      ( DELIVER-PKG-VERIFY ?AUTO_831 ?AUTO_832 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_853 - OBJ
      ?AUTO_854 - LOCATION
    )
    :vars
    (
      ?AUTO_855 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_853 ?AUTO_855 ) ( AIRPLANE-AT ?AUTO_855 ?AUTO_854 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_853 ?AUTO_855 ?AUTO_854 )
      ( DELIVER-PKG-VERIFY ?AUTO_853 ?AUTO_854 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_860 - OBJ
      ?AUTO_861 - LOCATION
    )
    :vars
    (
      ?AUTO_864 - AIRPLANE
      ?AUTO_866 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_860 ?AUTO_864 ) ( AIRPORT ?AUTO_866 ) ( AIRPORT ?AUTO_861 ) ( AIRPLANE-AT ?AUTO_864 ?AUTO_866 ) ( not ( = ?AUTO_866 ?AUTO_861 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_864 ?AUTO_866 ?AUTO_861 )
      ( DELIVER-PKG ?AUTO_860 ?AUTO_861 )
      ( DELIVER-PKG-VERIFY ?AUTO_860 ?AUTO_861 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_868 - OBJ
      ?AUTO_869 - LOCATION
    )
    :vars
    (
      ?AUTO_873 - LOCATION
      ?AUTO_872 - AIRPLANE
      ?AUTO_875 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_873 ) ( AIRPORT ?AUTO_869 ) ( AIRPLANE-AT ?AUTO_872 ?AUTO_873 ) ( not ( = ?AUTO_873 ?AUTO_869 ) ) ( OBJ-AT ?AUTO_868 ?AUTO_875 ) ( AIRPLANE-AT ?AUTO_872 ?AUTO_875 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_868 ?AUTO_872 ?AUTO_875 )
      ( DELIVER-PKG ?AUTO_868 ?AUTO_869 )
      ( DELIVER-PKG-VERIFY ?AUTO_868 ?AUTO_869 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_877 - OBJ
      ?AUTO_878 - LOCATION
    )
    :vars
    (
      ?AUTO_883 - LOCATION
      ?AUTO_885 - LOCATION
      ?AUTO_881 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_883 ) ( AIRPORT ?AUTO_878 ) ( not ( = ?AUTO_883 ?AUTO_878 ) ) ( OBJ-AT ?AUTO_877 ?AUTO_883 ) ( AIRPORT ?AUTO_885 ) ( AIRPLANE-AT ?AUTO_881 ?AUTO_885 ) ( not ( = ?AUTO_885 ?AUTO_883 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_881 ?AUTO_885 ?AUTO_883 )
      ( DELIVER-PKG ?AUTO_877 ?AUTO_878 )
      ( DELIVER-PKG-VERIFY ?AUTO_877 ?AUTO_878 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_911 - OBJ
      ?AUTO_912 - LOCATION
    )
    :vars
    (
      ?AUTO_913 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_911 ?AUTO_913 ) ( AIRPLANE-AT ?AUTO_913 ?AUTO_912 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_911 ?AUTO_913 ?AUTO_912 )
      ( DELIVER-PKG-VERIFY ?AUTO_911 ?AUTO_912 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_918 - OBJ
      ?AUTO_919 - LOCATION
    )
    :vars
    (
      ?AUTO_922 - AIRPLANE
      ?AUTO_924 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_918 ?AUTO_922 ) ( AIRPORT ?AUTO_924 ) ( AIRPORT ?AUTO_919 ) ( AIRPLANE-AT ?AUTO_922 ?AUTO_924 ) ( not ( = ?AUTO_924 ?AUTO_919 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_922 ?AUTO_924 ?AUTO_919 )
      ( DELIVER-PKG ?AUTO_918 ?AUTO_919 )
      ( DELIVER-PKG-VERIFY ?AUTO_918 ?AUTO_919 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_928 - OBJ
      ?AUTO_929 - LOCATION
    )
    :vars
    (
      ?AUTO_932 - LOCATION
      ?AUTO_930 - AIRPLANE
      ?AUTO_935 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_932 ) ( AIRPORT ?AUTO_929 ) ( AIRPLANE-AT ?AUTO_930 ?AUTO_932 ) ( not ( = ?AUTO_932 ?AUTO_929 ) ) ( OBJ-AT ?AUTO_928 ?AUTO_935 ) ( AIRPLANE-AT ?AUTO_930 ?AUTO_935 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_928 ?AUTO_930 ?AUTO_935 )
      ( DELIVER-PKG ?AUTO_928 ?AUTO_929 )
      ( DELIVER-PKG-VERIFY ?AUTO_928 ?AUTO_929 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_937 - OBJ
      ?AUTO_938 - LOCATION
    )
    :vars
    (
      ?AUTO_943 - LOCATION
      ?AUTO_945 - LOCATION
      ?AUTO_941 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_943 ) ( AIRPORT ?AUTO_938 ) ( not ( = ?AUTO_943 ?AUTO_938 ) ) ( OBJ-AT ?AUTO_937 ?AUTO_943 ) ( AIRPORT ?AUTO_945 ) ( AIRPLANE-AT ?AUTO_941 ?AUTO_945 ) ( not ( = ?AUTO_945 ?AUTO_943 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_941 ?AUTO_945 ?AUTO_943 )
      ( DELIVER-PKG ?AUTO_937 ?AUTO_938 )
      ( DELIVER-PKG-VERIFY ?AUTO_937 ?AUTO_938 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_957 - OBJ
      ?AUTO_958 - LOCATION
    )
    :vars
    (
      ?AUTO_959 - LOCATION
      ?AUTO_961 - LOCATION
      ?AUTO_963 - AIRPLANE
      ?AUTO_964 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_959 ) ( AIRPORT ?AUTO_958 ) ( not ( = ?AUTO_959 ?AUTO_958 ) ) ( AIRPORT ?AUTO_961 ) ( AIRPLANE-AT ?AUTO_963 ?AUTO_961 ) ( not ( = ?AUTO_961 ?AUTO_959 ) ) ( TRUCK-AT ?AUTO_964 ?AUTO_959 ) ( IN-TRUCK ?AUTO_957 ?AUTO_964 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_957 ?AUTO_964 ?AUTO_959 )
      ( DELIVER-PKG ?AUTO_957 ?AUTO_958 )
      ( DELIVER-PKG-VERIFY ?AUTO_957 ?AUTO_958 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_967 - OBJ
      ?AUTO_968 - LOCATION
    )
    :vars
    (
      ?AUTO_971 - LOCATION
      ?AUTO_973 - LOCATION
      ?AUTO_972 - AIRPLANE
      ?AUTO_974 - TRUCK
      ?AUTO_977 - LOCATION
      ?AUTO_976 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_971 ) ( AIRPORT ?AUTO_968 ) ( not ( = ?AUTO_971 ?AUTO_968 ) ) ( AIRPORT ?AUTO_973 ) ( AIRPLANE-AT ?AUTO_972 ?AUTO_973 ) ( not ( = ?AUTO_973 ?AUTO_971 ) ) ( IN-TRUCK ?AUTO_967 ?AUTO_974 ) ( TRUCK-AT ?AUTO_974 ?AUTO_977 ) ( IN-CITY ?AUTO_977 ?AUTO_976 ) ( IN-CITY ?AUTO_971 ?AUTO_976 ) ( not ( = ?AUTO_971 ?AUTO_977 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_974 ?AUTO_977 ?AUTO_971 ?AUTO_976 )
      ( DELIVER-PKG ?AUTO_967 ?AUTO_968 )
      ( DELIVER-PKG-VERIFY ?AUTO_967 ?AUTO_968 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_979 - OBJ
      ?AUTO_980 - LOCATION
    )
    :vars
    (
      ?AUTO_986 - LOCATION
      ?AUTO_984 - LOCATION
      ?AUTO_987 - AIRPLANE
      ?AUTO_982 - TRUCK
      ?AUTO_988 - LOCATION
      ?AUTO_981 - CITY
      ?AUTO_990 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_986 ) ( AIRPORT ?AUTO_980 ) ( not ( = ?AUTO_986 ?AUTO_980 ) ) ( AIRPORT ?AUTO_984 ) ( AIRPLANE-AT ?AUTO_987 ?AUTO_984 ) ( not ( = ?AUTO_984 ?AUTO_986 ) ) ( TRUCK-AT ?AUTO_982 ?AUTO_988 ) ( IN-CITY ?AUTO_988 ?AUTO_981 ) ( IN-CITY ?AUTO_986 ?AUTO_981 ) ( not ( = ?AUTO_986 ?AUTO_988 ) ) ( TRUCK-AT ?AUTO_982 ?AUTO_990 ) ( OBJ-AT ?AUTO_979 ?AUTO_990 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_979 ?AUTO_982 ?AUTO_990 )
      ( DELIVER-PKG ?AUTO_979 ?AUTO_980 )
      ( DELIVER-PKG-VERIFY ?AUTO_979 ?AUTO_980 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_992 - OBJ
      ?AUTO_993 - LOCATION
    )
    :vars
    (
      ?AUTO_1002 - LOCATION
      ?AUTO_1001 - LOCATION
      ?AUTO_996 - AIRPLANE
      ?AUTO_997 - LOCATION
      ?AUTO_999 - CITY
      ?AUTO_1000 - TRUCK
      ?AUTO_1005 - LOCATION
      ?AUTO_1004 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1002 ) ( AIRPORT ?AUTO_993 ) ( not ( = ?AUTO_1002 ?AUTO_993 ) ) ( AIRPORT ?AUTO_1001 ) ( AIRPLANE-AT ?AUTO_996 ?AUTO_1001 ) ( not ( = ?AUTO_1001 ?AUTO_1002 ) ) ( IN-CITY ?AUTO_997 ?AUTO_999 ) ( IN-CITY ?AUTO_1002 ?AUTO_999 ) ( not ( = ?AUTO_1002 ?AUTO_997 ) ) ( OBJ-AT ?AUTO_992 ?AUTO_997 ) ( TRUCK-AT ?AUTO_1000 ?AUTO_1005 ) ( IN-CITY ?AUTO_1005 ?AUTO_1004 ) ( IN-CITY ?AUTO_997 ?AUTO_1004 ) ( not ( = ?AUTO_997 ?AUTO_1005 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1000 ?AUTO_1005 ?AUTO_997 ?AUTO_1004 )
      ( DELIVER-PKG ?AUTO_992 ?AUTO_993 )
      ( DELIVER-PKG-VERIFY ?AUTO_992 ?AUTO_993 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1017 - OBJ
      ?AUTO_1018 - LOCATION
    )
    :vars
    (
      ?AUTO_1019 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1017 ?AUTO_1019 ) ( AIRPLANE-AT ?AUTO_1019 ?AUTO_1018 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1017 ?AUTO_1019 ?AUTO_1018 )
      ( DELIVER-PKG-VERIFY ?AUTO_1017 ?AUTO_1018 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1062 - OBJ
      ?AUTO_1063 - LOCATION
    )
    :vars
    (
      ?AUTO_1064 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1062 ?AUTO_1064 ) ( AIRPLANE-AT ?AUTO_1064 ?AUTO_1063 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1062 ?AUTO_1064 ?AUTO_1063 )
      ( DELIVER-PKG-VERIFY ?AUTO_1062 ?AUTO_1063 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1067 - OBJ
      ?AUTO_1068 - LOCATION
    )
    :vars
    (
      ?AUTO_1071 - AIRPLANE
      ?AUTO_1073 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1067 ?AUTO_1071 ) ( AIRPORT ?AUTO_1073 ) ( AIRPORT ?AUTO_1068 ) ( AIRPLANE-AT ?AUTO_1071 ?AUTO_1073 ) ( not ( = ?AUTO_1073 ?AUTO_1068 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1071 ?AUTO_1073 ?AUTO_1068 )
      ( DELIVER-PKG ?AUTO_1067 ?AUTO_1068 )
      ( DELIVER-PKG-VERIFY ?AUTO_1067 ?AUTO_1068 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1079 - OBJ
      ?AUTO_1080 - LOCATION
    )
    :vars
    (
      ?AUTO_1081 - LOCATION
      ?AUTO_1084 - AIRPLANE
      ?AUTO_1086 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1081 ) ( AIRPORT ?AUTO_1080 ) ( AIRPLANE-AT ?AUTO_1084 ?AUTO_1081 ) ( not ( = ?AUTO_1081 ?AUTO_1080 ) ) ( OBJ-AT ?AUTO_1079 ?AUTO_1086 ) ( AIRPLANE-AT ?AUTO_1084 ?AUTO_1086 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1079 ?AUTO_1084 ?AUTO_1086 )
      ( DELIVER-PKG ?AUTO_1079 ?AUTO_1080 )
      ( DELIVER-PKG-VERIFY ?AUTO_1079 ?AUTO_1080 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1088 - OBJ
      ?AUTO_1089 - LOCATION
    )
    :vars
    (
      ?AUTO_1094 - LOCATION
      ?AUTO_1096 - LOCATION
      ?AUTO_1093 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1094 ) ( AIRPORT ?AUTO_1089 ) ( not ( = ?AUTO_1094 ?AUTO_1089 ) ) ( OBJ-AT ?AUTO_1088 ?AUTO_1094 ) ( AIRPORT ?AUTO_1096 ) ( AIRPLANE-AT ?AUTO_1093 ?AUTO_1096 ) ( not ( = ?AUTO_1096 ?AUTO_1094 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1093 ?AUTO_1096 ?AUTO_1094 )
      ( DELIVER-PKG ?AUTO_1088 ?AUTO_1089 )
      ( DELIVER-PKG-VERIFY ?AUTO_1088 ?AUTO_1089 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1132 - OBJ
      ?AUTO_1133 - LOCATION
    )
    :vars
    (
      ?AUTO_1134 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1132 ?AUTO_1134 ) ( AIRPLANE-AT ?AUTO_1134 ?AUTO_1133 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1132 ?AUTO_1134 ?AUTO_1133 )
      ( DELIVER-PKG-VERIFY ?AUTO_1132 ?AUTO_1133 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1183 - OBJ
      ?AUTO_1184 - LOCATION
    )
    :vars
    (
      ?AUTO_1185 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1185 ?AUTO_1184 ) ( IN-TRUCK ?AUTO_1183 ?AUTO_1185 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1183 ?AUTO_1185 ?AUTO_1184 )
      ( DELIVER-PKG-VERIFY ?AUTO_1183 ?AUTO_1184 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1190 - OBJ
      ?AUTO_1191 - LOCATION
    )
    :vars
    (
      ?AUTO_1194 - TRUCK
      ?AUTO_1197 - LOCATION
      ?AUTO_1196 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1190 ?AUTO_1194 ) ( TRUCK-AT ?AUTO_1194 ?AUTO_1197 ) ( IN-CITY ?AUTO_1197 ?AUTO_1196 ) ( IN-CITY ?AUTO_1191 ?AUTO_1196 ) ( not ( = ?AUTO_1191 ?AUTO_1197 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1194 ?AUTO_1197 ?AUTO_1191 ?AUTO_1196 )
      ( DELIVER-PKG ?AUTO_1190 ?AUTO_1191 )
      ( DELIVER-PKG-VERIFY ?AUTO_1190 ?AUTO_1191 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1201 - OBJ
      ?AUTO_1202 - LOCATION
    )
    :vars
    (
      ?AUTO_1203 - TRUCK
      ?AUTO_1205 - LOCATION
      ?AUTO_1206 - CITY
      ?AUTO_1209 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1203 ?AUTO_1205 ) ( IN-CITY ?AUTO_1205 ?AUTO_1206 ) ( IN-CITY ?AUTO_1202 ?AUTO_1206 ) ( not ( = ?AUTO_1202 ?AUTO_1205 ) ) ( TRUCK-AT ?AUTO_1203 ?AUTO_1209 ) ( OBJ-AT ?AUTO_1201 ?AUTO_1209 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1201 ?AUTO_1203 ?AUTO_1209 )
      ( DELIVER-PKG ?AUTO_1201 ?AUTO_1202 )
      ( DELIVER-PKG-VERIFY ?AUTO_1201 ?AUTO_1202 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1213 - OBJ
      ?AUTO_1214 - LOCATION
    )
    :vars
    (
      ?AUTO_1218 - TRUCK
      ?AUTO_1219 - LOCATION
      ?AUTO_1220 - CITY
      ?AUTO_1217 - LOCATION
      ?AUTO_1221 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1218 ?AUTO_1219 ) ( IN-CITY ?AUTO_1219 ?AUTO_1220 ) ( IN-CITY ?AUTO_1214 ?AUTO_1220 ) ( not ( = ?AUTO_1214 ?AUTO_1219 ) ) ( TRUCK-AT ?AUTO_1218 ?AUTO_1217 ) ( IN-AIRPLANE ?AUTO_1213 ?AUTO_1221 ) ( AIRPLANE-AT ?AUTO_1221 ?AUTO_1217 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1213 ?AUTO_1221 ?AUTO_1217 )
      ( DELIVER-PKG ?AUTO_1213 ?AUTO_1214 )
      ( DELIVER-PKG-VERIFY ?AUTO_1213 ?AUTO_1214 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1224 - OBJ
      ?AUTO_1225 - LOCATION
    )
    :vars
    (
      ?AUTO_1230 - TRUCK
      ?AUTO_1228 - LOCATION
      ?AUTO_1229 - CITY
      ?AUTO_1231 - LOCATION
      ?AUTO_1232 - AIRPLANE
      ?AUTO_1234 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1230 ?AUTO_1228 ) ( IN-CITY ?AUTO_1228 ?AUTO_1229 ) ( IN-CITY ?AUTO_1225 ?AUTO_1229 ) ( not ( = ?AUTO_1225 ?AUTO_1228 ) ) ( TRUCK-AT ?AUTO_1230 ?AUTO_1231 ) ( IN-AIRPLANE ?AUTO_1224 ?AUTO_1232 ) ( AIRPORT ?AUTO_1234 ) ( AIRPORT ?AUTO_1231 ) ( AIRPLANE-AT ?AUTO_1232 ?AUTO_1234 ) ( not ( = ?AUTO_1234 ?AUTO_1231 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1232 ?AUTO_1234 ?AUTO_1231 )
      ( DELIVER-PKG ?AUTO_1224 ?AUTO_1225 )
      ( DELIVER-PKG-VERIFY ?AUTO_1224 ?AUTO_1225 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1240 - OBJ
      ?AUTO_1241 - LOCATION
    )
    :vars
    (
      ?AUTO_1248 - TRUCK
      ?AUTO_1247 - LOCATION
      ?AUTO_1244 - CITY
      ?AUTO_1243 - LOCATION
      ?AUTO_1249 - LOCATION
      ?AUTO_1245 - AIRPLANE
      ?AUTO_1251 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1248 ?AUTO_1247 ) ( IN-CITY ?AUTO_1247 ?AUTO_1244 ) ( IN-CITY ?AUTO_1241 ?AUTO_1244 ) ( not ( = ?AUTO_1241 ?AUTO_1247 ) ) ( TRUCK-AT ?AUTO_1248 ?AUTO_1243 ) ( AIRPORT ?AUTO_1249 ) ( AIRPORT ?AUTO_1243 ) ( AIRPLANE-AT ?AUTO_1245 ?AUTO_1249 ) ( not ( = ?AUTO_1249 ?AUTO_1243 ) ) ( OBJ-AT ?AUTO_1240 ?AUTO_1251 ) ( AIRPLANE-AT ?AUTO_1245 ?AUTO_1251 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1240 ?AUTO_1245 ?AUTO_1251 )
      ( DELIVER-PKG ?AUTO_1240 ?AUTO_1241 )
      ( DELIVER-PKG-VERIFY ?AUTO_1240 ?AUTO_1241 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1253 - OBJ
      ?AUTO_1254 - LOCATION
    )
    :vars
    (
      ?AUTO_1259 - TRUCK
      ?AUTO_1263 - LOCATION
      ?AUTO_1262 - CITY
      ?AUTO_1258 - LOCATION
      ?AUTO_1255 - LOCATION
      ?AUTO_1265 - LOCATION
      ?AUTO_1260 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1259 ?AUTO_1263 ) ( IN-CITY ?AUTO_1263 ?AUTO_1262 ) ( IN-CITY ?AUTO_1254 ?AUTO_1262 ) ( not ( = ?AUTO_1254 ?AUTO_1263 ) ) ( TRUCK-AT ?AUTO_1259 ?AUTO_1258 ) ( AIRPORT ?AUTO_1255 ) ( AIRPORT ?AUTO_1258 ) ( not ( = ?AUTO_1255 ?AUTO_1258 ) ) ( OBJ-AT ?AUTO_1253 ?AUTO_1255 ) ( AIRPORT ?AUTO_1265 ) ( AIRPLANE-AT ?AUTO_1260 ?AUTO_1265 ) ( not ( = ?AUTO_1265 ?AUTO_1255 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1260 ?AUTO_1265 ?AUTO_1255 )
      ( DELIVER-PKG ?AUTO_1253 ?AUTO_1254 )
      ( DELIVER-PKG-VERIFY ?AUTO_1253 ?AUTO_1254 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1301 - OBJ
      ?AUTO_1302 - LOCATION
    )
    :vars
    (
      ?AUTO_1303 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1303 ?AUTO_1302 ) ( IN-TRUCK ?AUTO_1301 ?AUTO_1303 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1301 ?AUTO_1303 ?AUTO_1302 )
      ( DELIVER-PKG-VERIFY ?AUTO_1301 ?AUTO_1302 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1312 - OBJ
      ?AUTO_1313 - LOCATION
    )
    :vars
    (
      ?AUTO_1315 - TRUCK
      ?AUTO_1316 - LOCATION
      ?AUTO_1314 - CITY
      ?AUTO_1320 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1315 ?AUTO_1316 ) ( IN-CITY ?AUTO_1316 ?AUTO_1314 ) ( IN-CITY ?AUTO_1313 ?AUTO_1314 ) ( not ( = ?AUTO_1313 ?AUTO_1316 ) ) ( TRUCK-AT ?AUTO_1315 ?AUTO_1320 ) ( OBJ-AT ?AUTO_1312 ?AUTO_1320 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1312 ?AUTO_1315 ?AUTO_1320 )
      ( DELIVER-PKG ?AUTO_1312 ?AUTO_1313 )
      ( DELIVER-PKG-VERIFY ?AUTO_1312 ?AUTO_1313 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1324 - OBJ
      ?AUTO_1325 - LOCATION
    )
    :vars
    (
      ?AUTO_1328 - TRUCK
      ?AUTO_1330 - LOCATION
      ?AUTO_1329 - CITY
      ?AUTO_1331 - LOCATION
      ?AUTO_1332 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1328 ?AUTO_1330 ) ( IN-CITY ?AUTO_1330 ?AUTO_1329 ) ( IN-CITY ?AUTO_1325 ?AUTO_1329 ) ( not ( = ?AUTO_1325 ?AUTO_1330 ) ) ( TRUCK-AT ?AUTO_1328 ?AUTO_1331 ) ( IN-AIRPLANE ?AUTO_1324 ?AUTO_1332 ) ( AIRPLANE-AT ?AUTO_1332 ?AUTO_1331 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1324 ?AUTO_1332 ?AUTO_1331 )
      ( DELIVER-PKG ?AUTO_1324 ?AUTO_1325 )
      ( DELIVER-PKG-VERIFY ?AUTO_1324 ?AUTO_1325 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1371 - OBJ
      ?AUTO_1372 - LOCATION
    )
    :vars
    (
      ?AUTO_1374 - TRUCK
      ?AUTO_1373 - LOCATION
      ?AUTO_1380 - CITY
      ?AUTO_1377 - LOCATION
      ?AUTO_1378 - LOCATION
      ?AUTO_1376 - LOCATION
      ?AUTO_1375 - AIRPLANE
      ?AUTO_1382 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1374 ?AUTO_1373 ) ( IN-CITY ?AUTO_1373 ?AUTO_1380 ) ( IN-CITY ?AUTO_1372 ?AUTO_1380 ) ( not ( = ?AUTO_1372 ?AUTO_1373 ) ) ( TRUCK-AT ?AUTO_1374 ?AUTO_1377 ) ( AIRPORT ?AUTO_1378 ) ( AIRPORT ?AUTO_1377 ) ( not ( = ?AUTO_1378 ?AUTO_1377 ) ) ( AIRPORT ?AUTO_1376 ) ( AIRPLANE-AT ?AUTO_1375 ?AUTO_1376 ) ( not ( = ?AUTO_1376 ?AUTO_1378 ) ) ( TRUCK-AT ?AUTO_1382 ?AUTO_1378 ) ( IN-TRUCK ?AUTO_1371 ?AUTO_1382 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1371 ?AUTO_1382 ?AUTO_1378 )
      ( DELIVER-PKG ?AUTO_1371 ?AUTO_1372 )
      ( DELIVER-PKG-VERIFY ?AUTO_1371 ?AUTO_1372 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1385 - OBJ
      ?AUTO_1386 - LOCATION
    )
    :vars
    (
      ?AUTO_1396 - TRUCK
      ?AUTO_1392 - LOCATION
      ?AUTO_1395 - CITY
      ?AUTO_1391 - LOCATION
      ?AUTO_1390 - LOCATION
      ?AUTO_1393 - LOCATION
      ?AUTO_1394 - AIRPLANE
      ?AUTO_1388 - TRUCK
      ?AUTO_1399 - LOCATION
      ?AUTO_1398 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1396 ?AUTO_1392 ) ( IN-CITY ?AUTO_1392 ?AUTO_1395 ) ( IN-CITY ?AUTO_1386 ?AUTO_1395 ) ( not ( = ?AUTO_1386 ?AUTO_1392 ) ) ( TRUCK-AT ?AUTO_1396 ?AUTO_1391 ) ( AIRPORT ?AUTO_1390 ) ( AIRPORT ?AUTO_1391 ) ( not ( = ?AUTO_1390 ?AUTO_1391 ) ) ( AIRPORT ?AUTO_1393 ) ( AIRPLANE-AT ?AUTO_1394 ?AUTO_1393 ) ( not ( = ?AUTO_1393 ?AUTO_1390 ) ) ( IN-TRUCK ?AUTO_1385 ?AUTO_1388 ) ( TRUCK-AT ?AUTO_1388 ?AUTO_1399 ) ( IN-CITY ?AUTO_1399 ?AUTO_1398 ) ( IN-CITY ?AUTO_1390 ?AUTO_1398 ) ( not ( = ?AUTO_1390 ?AUTO_1399 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1388 ?AUTO_1399 ?AUTO_1390 ?AUTO_1398 )
      ( DELIVER-PKG ?AUTO_1385 ?AUTO_1386 )
      ( DELIVER-PKG-VERIFY ?AUTO_1385 ?AUTO_1386 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1401 - OBJ
      ?AUTO_1402 - LOCATION
    )
    :vars
    (
      ?AUTO_1411 - TRUCK
      ?AUTO_1412 - LOCATION
      ?AUTO_1405 - CITY
      ?AUTO_1403 - LOCATION
      ?AUTO_1408 - LOCATION
      ?AUTO_1413 - LOCATION
      ?AUTO_1409 - AIRPLANE
      ?AUTO_1406 - TRUCK
      ?AUTO_1410 - LOCATION
      ?AUTO_1414 - CITY
      ?AUTO_1416 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1411 ?AUTO_1412 ) ( IN-CITY ?AUTO_1412 ?AUTO_1405 ) ( IN-CITY ?AUTO_1402 ?AUTO_1405 ) ( not ( = ?AUTO_1402 ?AUTO_1412 ) ) ( TRUCK-AT ?AUTO_1411 ?AUTO_1403 ) ( AIRPORT ?AUTO_1408 ) ( AIRPORT ?AUTO_1403 ) ( not ( = ?AUTO_1408 ?AUTO_1403 ) ) ( AIRPORT ?AUTO_1413 ) ( AIRPLANE-AT ?AUTO_1409 ?AUTO_1413 ) ( not ( = ?AUTO_1413 ?AUTO_1408 ) ) ( TRUCK-AT ?AUTO_1406 ?AUTO_1410 ) ( IN-CITY ?AUTO_1410 ?AUTO_1414 ) ( IN-CITY ?AUTO_1408 ?AUTO_1414 ) ( not ( = ?AUTO_1408 ?AUTO_1410 ) ) ( TRUCK-AT ?AUTO_1406 ?AUTO_1416 ) ( OBJ-AT ?AUTO_1401 ?AUTO_1416 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1401 ?AUTO_1406 ?AUTO_1416 )
      ( DELIVER-PKG ?AUTO_1401 ?AUTO_1402 )
      ( DELIVER-PKG-VERIFY ?AUTO_1401 ?AUTO_1402 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1418 - OBJ
      ?AUTO_1419 - LOCATION
    )
    :vars
    (
      ?AUTO_1425 - TRUCK
      ?AUTO_1432 - LOCATION
      ?AUTO_1430 - CITY
      ?AUTO_1420 - LOCATION
      ?AUTO_1427 - LOCATION
      ?AUTO_1426 - LOCATION
      ?AUTO_1423 - AIRPLANE
      ?AUTO_1431 - LOCATION
      ?AUTO_1424 - CITY
      ?AUTO_1422 - TRUCK
      ?AUTO_1435 - LOCATION
      ?AUTO_1434 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1425 ?AUTO_1432 ) ( IN-CITY ?AUTO_1432 ?AUTO_1430 ) ( IN-CITY ?AUTO_1419 ?AUTO_1430 ) ( not ( = ?AUTO_1419 ?AUTO_1432 ) ) ( TRUCK-AT ?AUTO_1425 ?AUTO_1420 ) ( AIRPORT ?AUTO_1427 ) ( AIRPORT ?AUTO_1420 ) ( not ( = ?AUTO_1427 ?AUTO_1420 ) ) ( AIRPORT ?AUTO_1426 ) ( AIRPLANE-AT ?AUTO_1423 ?AUTO_1426 ) ( not ( = ?AUTO_1426 ?AUTO_1427 ) ) ( IN-CITY ?AUTO_1431 ?AUTO_1424 ) ( IN-CITY ?AUTO_1427 ?AUTO_1424 ) ( not ( = ?AUTO_1427 ?AUTO_1431 ) ) ( OBJ-AT ?AUTO_1418 ?AUTO_1431 ) ( TRUCK-AT ?AUTO_1422 ?AUTO_1435 ) ( IN-CITY ?AUTO_1435 ?AUTO_1434 ) ( IN-CITY ?AUTO_1431 ?AUTO_1434 ) ( not ( = ?AUTO_1431 ?AUTO_1435 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1422 ?AUTO_1435 ?AUTO_1431 ?AUTO_1434 )
      ( DELIVER-PKG ?AUTO_1418 ?AUTO_1419 )
      ( DELIVER-PKG-VERIFY ?AUTO_1418 ?AUTO_1419 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1439 - OBJ
      ?AUTO_1440 - LOCATION
    )
    :vars
    (
      ?AUTO_1441 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1441 ?AUTO_1440 ) ( IN-TRUCK ?AUTO_1439 ?AUTO_1441 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1439 ?AUTO_1441 ?AUTO_1440 )
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
      ?AUTO_1446 - TRUCK
      ?AUTO_1451 - LOCATION
      ?AUTO_1450 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1444 ?AUTO_1446 ) ( TRUCK-AT ?AUTO_1446 ?AUTO_1451 ) ( IN-CITY ?AUTO_1451 ?AUTO_1450 ) ( IN-CITY ?AUTO_1445 ?AUTO_1450 ) ( not ( = ?AUTO_1445 ?AUTO_1451 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1446 ?AUTO_1451 ?AUTO_1445 ?AUTO_1450 )
      ( DELIVER-PKG ?AUTO_1444 ?AUTO_1445 )
      ( DELIVER-PKG-VERIFY ?AUTO_1444 ?AUTO_1445 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1457 - OBJ
      ?AUTO_1458 - LOCATION
    )
    :vars
    (
      ?AUTO_1460 - TRUCK
      ?AUTO_1459 - LOCATION
      ?AUTO_1461 - CITY
      ?AUTO_1465 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1460 ?AUTO_1459 ) ( IN-CITY ?AUTO_1459 ?AUTO_1461 ) ( IN-CITY ?AUTO_1458 ?AUTO_1461 ) ( not ( = ?AUTO_1458 ?AUTO_1459 ) ) ( TRUCK-AT ?AUTO_1460 ?AUTO_1465 ) ( OBJ-AT ?AUTO_1457 ?AUTO_1465 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1457 ?AUTO_1460 ?AUTO_1465 )
      ( DELIVER-PKG ?AUTO_1457 ?AUTO_1458 )
      ( DELIVER-PKG-VERIFY ?AUTO_1457 ?AUTO_1458 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1467 - OBJ
      ?AUTO_1468 - LOCATION
    )
    :vars
    (
      ?AUTO_1474 - LOCATION
      ?AUTO_1473 - CITY
      ?AUTO_1471 - TRUCK
      ?AUTO_1477 - LOCATION
      ?AUTO_1476 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1474 ?AUTO_1473 ) ( IN-CITY ?AUTO_1468 ?AUTO_1473 ) ( not ( = ?AUTO_1468 ?AUTO_1474 ) ) ( OBJ-AT ?AUTO_1467 ?AUTO_1474 ) ( TRUCK-AT ?AUTO_1471 ?AUTO_1477 ) ( IN-CITY ?AUTO_1477 ?AUTO_1476 ) ( IN-CITY ?AUTO_1474 ?AUTO_1476 ) ( not ( = ?AUTO_1474 ?AUTO_1477 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1471 ?AUTO_1477 ?AUTO_1474 ?AUTO_1476 )
      ( DELIVER-PKG ?AUTO_1467 ?AUTO_1468 )
      ( DELIVER-PKG-VERIFY ?AUTO_1467 ?AUTO_1468 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1480 - OBJ
      ?AUTO_1481 - LOCATION
    )
    :vars
    (
      ?AUTO_1482 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1482 ?AUTO_1481 ) ( IN-TRUCK ?AUTO_1480 ?AUTO_1482 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1480 ?AUTO_1482 ?AUTO_1481 )
      ( DELIVER-PKG-VERIFY ?AUTO_1480 ?AUTO_1481 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1485 - OBJ
      ?AUTO_1486 - LOCATION
    )
    :vars
    (
      ?AUTO_1489 - TRUCK
      ?AUTO_1492 - LOCATION
      ?AUTO_1491 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1485 ?AUTO_1489 ) ( TRUCK-AT ?AUTO_1489 ?AUTO_1492 ) ( IN-CITY ?AUTO_1492 ?AUTO_1491 ) ( IN-CITY ?AUTO_1486 ?AUTO_1491 ) ( not ( = ?AUTO_1486 ?AUTO_1492 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1489 ?AUTO_1492 ?AUTO_1486 ?AUTO_1491 )
      ( DELIVER-PKG ?AUTO_1485 ?AUTO_1486 )
      ( DELIVER-PKG-VERIFY ?AUTO_1485 ?AUTO_1486 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1504 - OBJ
      ?AUTO_1505 - LOCATION
    )
    :vars
    (
      ?AUTO_1509 - TRUCK
      ?AUTO_1510 - LOCATION
      ?AUTO_1507 - CITY
      ?AUTO_1512 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1509 ?AUTO_1510 ) ( IN-CITY ?AUTO_1510 ?AUTO_1507 ) ( IN-CITY ?AUTO_1505 ?AUTO_1507 ) ( not ( = ?AUTO_1505 ?AUTO_1510 ) ) ( TRUCK-AT ?AUTO_1509 ?AUTO_1512 ) ( OBJ-AT ?AUTO_1504 ?AUTO_1512 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1504 ?AUTO_1509 ?AUTO_1512 )
      ( DELIVER-PKG ?AUTO_1504 ?AUTO_1505 )
      ( DELIVER-PKG-VERIFY ?AUTO_1504 ?AUTO_1505 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1516 - OBJ
      ?AUTO_1517 - LOCATION
    )
    :vars
    (
      ?AUTO_1518 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1518 ?AUTO_1517 ) ( IN-TRUCK ?AUTO_1516 ?AUTO_1518 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1516 ?AUTO_1518 ?AUTO_1517 )
      ( DELIVER-PKG-VERIFY ?AUTO_1516 ?AUTO_1517 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1533 - OBJ
      ?AUTO_1534 - LOCATION
    )
    :vars
    (
      ?AUTO_1537 - TRUCK
      ?AUTO_1539 - LOCATION
      ?AUTO_1538 - CITY
      ?AUTO_1541 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1537 ?AUTO_1539 ) ( IN-CITY ?AUTO_1539 ?AUTO_1538 ) ( IN-CITY ?AUTO_1534 ?AUTO_1538 ) ( not ( = ?AUTO_1534 ?AUTO_1539 ) ) ( TRUCK-AT ?AUTO_1537 ?AUTO_1541 ) ( OBJ-AT ?AUTO_1533 ?AUTO_1541 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1533 ?AUTO_1537 ?AUTO_1541 )
      ( DELIVER-PKG ?AUTO_1533 ?AUTO_1534 )
      ( DELIVER-PKG-VERIFY ?AUTO_1533 ?AUTO_1534 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1547 - OBJ
      ?AUTO_1548 - LOCATION
    )
    :vars
    (
      ?AUTO_1549 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1549 ?AUTO_1548 ) ( IN-TRUCK ?AUTO_1547 ?AUTO_1549 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1547 ?AUTO_1549 ?AUTO_1548 )
      ( DELIVER-PKG-VERIFY ?AUTO_1547 ?AUTO_1548 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1562 - OBJ
      ?AUTO_1563 - LOCATION
    )
    :vars
    (
      ?AUTO_1568 - TRUCK
      ?AUTO_1564 - LOCATION
      ?AUTO_1565 - CITY
      ?AUTO_1570 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1568 ?AUTO_1564 ) ( IN-CITY ?AUTO_1564 ?AUTO_1565 ) ( IN-CITY ?AUTO_1563 ?AUTO_1565 ) ( not ( = ?AUTO_1563 ?AUTO_1564 ) ) ( TRUCK-AT ?AUTO_1568 ?AUTO_1570 ) ( OBJ-AT ?AUTO_1562 ?AUTO_1570 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1562 ?AUTO_1568 ?AUTO_1570 )
      ( DELIVER-PKG ?AUTO_1562 ?AUTO_1563 )
      ( DELIVER-PKG-VERIFY ?AUTO_1562 ?AUTO_1563 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1580 - OBJ
      ?AUTO_1581 - LOCATION
    )
    :vars
    (
      ?AUTO_1582 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1582 ?AUTO_1581 ) ( IN-TRUCK ?AUTO_1580 ?AUTO_1582 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1580 ?AUTO_1582 ?AUTO_1581 )
      ( DELIVER-PKG-VERIFY ?AUTO_1580 ?AUTO_1581 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1595 - OBJ
      ?AUTO_1596 - LOCATION
    )
    :vars
    (
      ?AUTO_1600 - TRUCK
      ?AUTO_1598 - LOCATION
      ?AUTO_1601 - CITY
      ?AUTO_1603 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1600 ?AUTO_1598 ) ( IN-CITY ?AUTO_1598 ?AUTO_1601 ) ( IN-CITY ?AUTO_1596 ?AUTO_1601 ) ( not ( = ?AUTO_1596 ?AUTO_1598 ) ) ( TRUCK-AT ?AUTO_1600 ?AUTO_1603 ) ( OBJ-AT ?AUTO_1595 ?AUTO_1603 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1595 ?AUTO_1600 ?AUTO_1603 )
      ( DELIVER-PKG ?AUTO_1595 ?AUTO_1596 )
      ( DELIVER-PKG-VERIFY ?AUTO_1595 ?AUTO_1596 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1609 - OBJ
      ?AUTO_1610 - LOCATION
    )
    :vars
    (
      ?AUTO_1616 - LOCATION
      ?AUTO_1612 - CITY
      ?AUTO_1611 - TRUCK
      ?AUTO_1619 - LOCATION
      ?AUTO_1618 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1616 ?AUTO_1612 ) ( IN-CITY ?AUTO_1610 ?AUTO_1612 ) ( not ( = ?AUTO_1610 ?AUTO_1616 ) ) ( OBJ-AT ?AUTO_1609 ?AUTO_1616 ) ( TRUCK-AT ?AUTO_1611 ?AUTO_1619 ) ( IN-CITY ?AUTO_1619 ?AUTO_1618 ) ( IN-CITY ?AUTO_1616 ?AUTO_1618 ) ( not ( = ?AUTO_1616 ?AUTO_1619 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1611 ?AUTO_1619 ?AUTO_1616 ?AUTO_1618 )
      ( DELIVER-PKG ?AUTO_1609 ?AUTO_1610 )
      ( DELIVER-PKG-VERIFY ?AUTO_1609 ?AUTO_1610 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1627 - OBJ
      ?AUTO_1628 - LOCATION
    )
    :vars
    (
      ?AUTO_1629 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1627 ?AUTO_1629 ) ( AIRPLANE-AT ?AUTO_1629 ?AUTO_1628 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1627 ?AUTO_1629 ?AUTO_1628 )
      ( DELIVER-PKG-VERIFY ?AUTO_1627 ?AUTO_1628 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1632 - OBJ
      ?AUTO_1633 - LOCATION
    )
    :vars
    (
      ?AUTO_1636 - AIRPLANE
      ?AUTO_1638 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1632 ?AUTO_1636 ) ( AIRPORT ?AUTO_1638 ) ( AIRPORT ?AUTO_1633 ) ( AIRPLANE-AT ?AUTO_1636 ?AUTO_1638 ) ( not ( = ?AUTO_1638 ?AUTO_1633 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1636 ?AUTO_1638 ?AUTO_1633 )
      ( DELIVER-PKG ?AUTO_1632 ?AUTO_1633 )
      ( DELIVER-PKG-VERIFY ?AUTO_1632 ?AUTO_1633 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1644 - OBJ
      ?AUTO_1645 - LOCATION
    )
    :vars
    (
      ?AUTO_1646 - LOCATION
      ?AUTO_1649 - AIRPLANE
      ?AUTO_1651 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1646 ) ( AIRPORT ?AUTO_1645 ) ( AIRPLANE-AT ?AUTO_1649 ?AUTO_1646 ) ( not ( = ?AUTO_1646 ?AUTO_1645 ) ) ( OBJ-AT ?AUTO_1644 ?AUTO_1651 ) ( AIRPLANE-AT ?AUTO_1649 ?AUTO_1651 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1644 ?AUTO_1649 ?AUTO_1651 )
      ( DELIVER-PKG ?AUTO_1644 ?AUTO_1645 )
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
      ?AUTO_1659 - LOCATION
      ?AUTO_1661 - LOCATION
      ?AUTO_1658 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1659 ) ( AIRPORT ?AUTO_1654 ) ( not ( = ?AUTO_1659 ?AUTO_1654 ) ) ( OBJ-AT ?AUTO_1653 ?AUTO_1659 ) ( AIRPORT ?AUTO_1661 ) ( AIRPLANE-AT ?AUTO_1658 ?AUTO_1661 ) ( not ( = ?AUTO_1661 ?AUTO_1659 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1658 ?AUTO_1661 ?AUTO_1659 )
      ( DELIVER-PKG ?AUTO_1653 ?AUTO_1654 )
      ( DELIVER-PKG-VERIFY ?AUTO_1653 ?AUTO_1654 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1679 - OBJ
      ?AUTO_1680 - LOCATION
    )
    :vars
    (
      ?AUTO_1683 - LOCATION
      ?AUTO_1685 - LOCATION
      ?AUTO_1684 - AIRPLANE
      ?AUTO_1686 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1683 ) ( AIRPORT ?AUTO_1680 ) ( not ( = ?AUTO_1683 ?AUTO_1680 ) ) ( AIRPORT ?AUTO_1685 ) ( AIRPLANE-AT ?AUTO_1684 ?AUTO_1685 ) ( not ( = ?AUTO_1685 ?AUTO_1683 ) ) ( TRUCK-AT ?AUTO_1686 ?AUTO_1683 ) ( IN-TRUCK ?AUTO_1679 ?AUTO_1686 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1679 ?AUTO_1686 ?AUTO_1683 )
      ( DELIVER-PKG ?AUTO_1679 ?AUTO_1680 )
      ( DELIVER-PKG-VERIFY ?AUTO_1679 ?AUTO_1680 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1689 - OBJ
      ?AUTO_1690 - LOCATION
    )
    :vars
    (
      ?AUTO_1695 - LOCATION
      ?AUTO_1693 - LOCATION
      ?AUTO_1694 - AIRPLANE
      ?AUTO_1696 - TRUCK
      ?AUTO_1699 - LOCATION
      ?AUTO_1698 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1695 ) ( AIRPORT ?AUTO_1690 ) ( not ( = ?AUTO_1695 ?AUTO_1690 ) ) ( AIRPORT ?AUTO_1693 ) ( AIRPLANE-AT ?AUTO_1694 ?AUTO_1693 ) ( not ( = ?AUTO_1693 ?AUTO_1695 ) ) ( IN-TRUCK ?AUTO_1689 ?AUTO_1696 ) ( TRUCK-AT ?AUTO_1696 ?AUTO_1699 ) ( IN-CITY ?AUTO_1699 ?AUTO_1698 ) ( IN-CITY ?AUTO_1695 ?AUTO_1698 ) ( not ( = ?AUTO_1695 ?AUTO_1699 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1696 ?AUTO_1699 ?AUTO_1695 ?AUTO_1698 )
      ( DELIVER-PKG ?AUTO_1689 ?AUTO_1690 )
      ( DELIVER-PKG-VERIFY ?AUTO_1689 ?AUTO_1690 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1711 - OBJ
      ?AUTO_1712 - LOCATION
    )
    :vars
    (
      ?AUTO_1718 - LOCATION
      ?AUTO_1720 - LOCATION
      ?AUTO_1719 - AIRPLANE
      ?AUTO_1716 - TRUCK
      ?AUTO_1713 - LOCATION
      ?AUTO_1715 - CITY
      ?AUTO_1722 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1718 ) ( AIRPORT ?AUTO_1712 ) ( not ( = ?AUTO_1718 ?AUTO_1712 ) ) ( AIRPORT ?AUTO_1720 ) ( AIRPLANE-AT ?AUTO_1719 ?AUTO_1720 ) ( not ( = ?AUTO_1720 ?AUTO_1718 ) ) ( TRUCK-AT ?AUTO_1716 ?AUTO_1713 ) ( IN-CITY ?AUTO_1713 ?AUTO_1715 ) ( IN-CITY ?AUTO_1718 ?AUTO_1715 ) ( not ( = ?AUTO_1718 ?AUTO_1713 ) ) ( TRUCK-AT ?AUTO_1716 ?AUTO_1722 ) ( OBJ-AT ?AUTO_1711 ?AUTO_1722 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1711 ?AUTO_1716 ?AUTO_1722 )
      ( DELIVER-PKG ?AUTO_1711 ?AUTO_1712 )
      ( DELIVER-PKG-VERIFY ?AUTO_1711 ?AUTO_1712 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1726 - OBJ
      ?AUTO_1727 - LOCATION
    )
    :vars
    (
      ?AUTO_1728 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1726 ?AUTO_1728 ) ( AIRPLANE-AT ?AUTO_1728 ?AUTO_1727 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1726 ?AUTO_1728 ?AUTO_1727 )
      ( DELIVER-PKG-VERIFY ?AUTO_1726 ?AUTO_1727 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1737 - OBJ
      ?AUTO_1738 - LOCATION
    )
    :vars
    (
      ?AUTO_1742 - LOCATION
      ?AUTO_1741 - AIRPLANE
      ?AUTO_1744 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1742 ) ( AIRPORT ?AUTO_1738 ) ( AIRPLANE-AT ?AUTO_1741 ?AUTO_1742 ) ( not ( = ?AUTO_1742 ?AUTO_1738 ) ) ( OBJ-AT ?AUTO_1737 ?AUTO_1744 ) ( AIRPLANE-AT ?AUTO_1741 ?AUTO_1744 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1737 ?AUTO_1741 ?AUTO_1744 )
      ( DELIVER-PKG ?AUTO_1737 ?AUTO_1738 )
      ( DELIVER-PKG-VERIFY ?AUTO_1737 ?AUTO_1738 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1764 - OBJ
      ?AUTO_1765 - LOCATION
    )
    :vars
    (
      ?AUTO_1769 - LOCATION
      ?AUTO_1768 - LOCATION
      ?AUTO_1767 - AIRPLANE
      ?AUTO_1771 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1769 ) ( AIRPORT ?AUTO_1765 ) ( not ( = ?AUTO_1769 ?AUTO_1765 ) ) ( AIRPORT ?AUTO_1768 ) ( AIRPLANE-AT ?AUTO_1767 ?AUTO_1768 ) ( not ( = ?AUTO_1768 ?AUTO_1769 ) ) ( TRUCK-AT ?AUTO_1771 ?AUTO_1769 ) ( IN-TRUCK ?AUTO_1764 ?AUTO_1771 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1764 ?AUTO_1771 ?AUTO_1769 )
      ( DELIVER-PKG ?AUTO_1764 ?AUTO_1765 )
      ( DELIVER-PKG-VERIFY ?AUTO_1764 ?AUTO_1765 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1786 - OBJ
      ?AUTO_1787 - LOCATION
    )
    :vars
    (
      ?AUTO_1794 - LOCATION
      ?AUTO_1788 - LOCATION
      ?AUTO_1792 - AIRPLANE
      ?AUTO_1791 - TRUCK
      ?AUTO_1793 - LOCATION
      ?AUTO_1789 - CITY
      ?AUTO_1797 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1794 ) ( AIRPORT ?AUTO_1787 ) ( not ( = ?AUTO_1794 ?AUTO_1787 ) ) ( AIRPORT ?AUTO_1788 ) ( AIRPLANE-AT ?AUTO_1792 ?AUTO_1788 ) ( not ( = ?AUTO_1788 ?AUTO_1794 ) ) ( TRUCK-AT ?AUTO_1791 ?AUTO_1793 ) ( IN-CITY ?AUTO_1793 ?AUTO_1789 ) ( IN-CITY ?AUTO_1794 ?AUTO_1789 ) ( not ( = ?AUTO_1794 ?AUTO_1793 ) ) ( TRUCK-AT ?AUTO_1791 ?AUTO_1797 ) ( OBJ-AT ?AUTO_1786 ?AUTO_1797 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1786 ?AUTO_1791 ?AUTO_1797 )
      ( DELIVER-PKG ?AUTO_1786 ?AUTO_1787 )
      ( DELIVER-PKG-VERIFY ?AUTO_1786 ?AUTO_1787 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1803 - OBJ
      ?AUTO_1804 - LOCATION
    )
    :vars
    (
      ?AUTO_1805 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1805 ?AUTO_1804 ) ( IN-TRUCK ?AUTO_1803 ?AUTO_1805 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1803 ?AUTO_1805 ?AUTO_1804 )
      ( DELIVER-PKG-VERIFY ?AUTO_1803 ?AUTO_1804 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1826 - OBJ
      ?AUTO_1827 - LOCATION
    )
    :vars
    (
      ?AUTO_1830 - TRUCK
      ?AUTO_1833 - LOCATION
      ?AUTO_1832 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1826 ?AUTO_1830 ) ( TRUCK-AT ?AUTO_1830 ?AUTO_1833 ) ( IN-CITY ?AUTO_1833 ?AUTO_1832 ) ( IN-CITY ?AUTO_1827 ?AUTO_1832 ) ( not ( = ?AUTO_1827 ?AUTO_1833 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1830 ?AUTO_1833 ?AUTO_1827 ?AUTO_1832 )
      ( DELIVER-PKG ?AUTO_1826 ?AUTO_1827 )
      ( DELIVER-PKG-VERIFY ?AUTO_1826 ?AUTO_1827 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1835 - OBJ
      ?AUTO_1836 - LOCATION
    )
    :vars
    (
      ?AUTO_1839 - TRUCK
      ?AUTO_1841 - LOCATION
      ?AUTO_1840 - CITY
      ?AUTO_1843 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1839 ?AUTO_1841 ) ( IN-CITY ?AUTO_1841 ?AUTO_1840 ) ( IN-CITY ?AUTO_1836 ?AUTO_1840 ) ( not ( = ?AUTO_1836 ?AUTO_1841 ) ) ( TRUCK-AT ?AUTO_1839 ?AUTO_1843 ) ( OBJ-AT ?AUTO_1835 ?AUTO_1843 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1835 ?AUTO_1839 ?AUTO_1843 )
      ( DELIVER-PKG ?AUTO_1835 ?AUTO_1836 )
      ( DELIVER-PKG-VERIFY ?AUTO_1835 ?AUTO_1836 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1847 - OBJ
      ?AUTO_1848 - LOCATION
    )
    :vars
    (
      ?AUTO_1853 - LOCATION
      ?AUTO_1851 - CITY
      ?AUTO_1849 - TRUCK
      ?AUTO_1857 - LOCATION
      ?AUTO_1856 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1853 ?AUTO_1851 ) ( IN-CITY ?AUTO_1848 ?AUTO_1851 ) ( not ( = ?AUTO_1848 ?AUTO_1853 ) ) ( OBJ-AT ?AUTO_1847 ?AUTO_1853 ) ( TRUCK-AT ?AUTO_1849 ?AUTO_1857 ) ( IN-CITY ?AUTO_1857 ?AUTO_1856 ) ( IN-CITY ?AUTO_1853 ?AUTO_1856 ) ( not ( = ?AUTO_1853 ?AUTO_1857 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1849 ?AUTO_1857 ?AUTO_1853 ?AUTO_1856 )
      ( DELIVER-PKG ?AUTO_1847 ?AUTO_1848 )
      ( DELIVER-PKG-VERIFY ?AUTO_1847 ?AUTO_1848 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1881 - OBJ
      ?AUTO_1882 - LOCATION
    )
    :vars
    (
      ?AUTO_1883 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1881 ?AUTO_1883 ) ( AIRPLANE-AT ?AUTO_1883 ?AUTO_1882 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1881 ?AUTO_1883 ?AUTO_1882 )
      ( DELIVER-PKG-VERIFY ?AUTO_1881 ?AUTO_1882 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1914 - OBJ
      ?AUTO_1915 - LOCATION
    )
    :vars
    (
      ?AUTO_1917 - LOCATION
      ?AUTO_1916 - AIRPLANE
      ?AUTO_1918 - LOCATION
      ?AUTO_1921 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1917 ) ( AIRPORT ?AUTO_1915 ) ( AIRPLANE-AT ?AUTO_1916 ?AUTO_1917 ) ( not ( = ?AUTO_1917 ?AUTO_1915 ) ) ( AIRPLANE-AT ?AUTO_1916 ?AUTO_1918 ) ( TRUCK-AT ?AUTO_1921 ?AUTO_1918 ) ( IN-TRUCK ?AUTO_1914 ?AUTO_1921 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1914 ?AUTO_1921 ?AUTO_1918 )
      ( DELIVER-PKG ?AUTO_1914 ?AUTO_1915 )
      ( DELIVER-PKG-VERIFY ?AUTO_1914 ?AUTO_1915 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1934 - OBJ
      ?AUTO_1935 - LOCATION
    )
    :vars
    (
      ?AUTO_1936 - LOCATION
      ?AUTO_1938 - LOCATION
      ?AUTO_1942 - AIRPLANE
      ?AUTO_1940 - TRUCK
      ?AUTO_1941 - LOCATION
      ?AUTO_1937 - CITY
      ?AUTO_1945 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1936 ) ( AIRPORT ?AUTO_1935 ) ( not ( = ?AUTO_1936 ?AUTO_1935 ) ) ( AIRPORT ?AUTO_1938 ) ( AIRPLANE-AT ?AUTO_1942 ?AUTO_1938 ) ( not ( = ?AUTO_1938 ?AUTO_1936 ) ) ( TRUCK-AT ?AUTO_1940 ?AUTO_1941 ) ( IN-CITY ?AUTO_1941 ?AUTO_1937 ) ( IN-CITY ?AUTO_1936 ?AUTO_1937 ) ( not ( = ?AUTO_1936 ?AUTO_1941 ) ) ( TRUCK-AT ?AUTO_1940 ?AUTO_1945 ) ( OBJ-AT ?AUTO_1934 ?AUTO_1945 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1934 ?AUTO_1940 ?AUTO_1945 )
      ( DELIVER-PKG ?AUTO_1934 ?AUTO_1935 )
      ( DELIVER-PKG-VERIFY ?AUTO_1934 ?AUTO_1935 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1955 - OBJ
      ?AUTO_1956 - LOCATION
    )
    :vars
    (
      ?AUTO_1957 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1955 ?AUTO_1957 ) ( AIRPLANE-AT ?AUTO_1957 ?AUTO_1956 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1955 ?AUTO_1957 ?AUTO_1956 )
      ( DELIVER-PKG-VERIFY ?AUTO_1955 ?AUTO_1956 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1960 - OBJ
      ?AUTO_1961 - LOCATION
    )
    :vars
    (
      ?AUTO_1963 - AIRPLANE
      ?AUTO_1966 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1960 ?AUTO_1963 ) ( AIRPORT ?AUTO_1966 ) ( AIRPORT ?AUTO_1961 ) ( AIRPLANE-AT ?AUTO_1963 ?AUTO_1966 ) ( not ( = ?AUTO_1966 ?AUTO_1961 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1963 ?AUTO_1966 ?AUTO_1961 )
      ( DELIVER-PKG ?AUTO_1960 ?AUTO_1961 )
      ( DELIVER-PKG-VERIFY ?AUTO_1960 ?AUTO_1961 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1978 - OBJ
      ?AUTO_1979 - LOCATION
    )
    :vars
    (
      ?AUTO_1983 - LOCATION
      ?AUTO_1981 - AIRPLANE
      ?AUTO_1985 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1983 ) ( AIRPORT ?AUTO_1979 ) ( AIRPLANE-AT ?AUTO_1981 ?AUTO_1983 ) ( not ( = ?AUTO_1983 ?AUTO_1979 ) ) ( OBJ-AT ?AUTO_1978 ?AUTO_1985 ) ( AIRPLANE-AT ?AUTO_1981 ?AUTO_1985 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1978 ?AUTO_1981 ?AUTO_1985 )
      ( DELIVER-PKG ?AUTO_1978 ?AUTO_1979 )
      ( DELIVER-PKG-VERIFY ?AUTO_1978 ?AUTO_1979 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2001 - OBJ
      ?AUTO_2002 - LOCATION
    )
    :vars
    (
      ?AUTO_2006 - LOCATION
      ?AUTO_2003 - LOCATION
      ?AUTO_2005 - AIRPLANE
      ?AUTO_2008 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2006 ) ( AIRPORT ?AUTO_2002 ) ( not ( = ?AUTO_2006 ?AUTO_2002 ) ) ( AIRPORT ?AUTO_2003 ) ( AIRPLANE-AT ?AUTO_2005 ?AUTO_2003 ) ( not ( = ?AUTO_2003 ?AUTO_2006 ) ) ( TRUCK-AT ?AUTO_2008 ?AUTO_2006 ) ( IN-TRUCK ?AUTO_2001 ?AUTO_2008 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2001 ?AUTO_2008 ?AUTO_2006 )
      ( DELIVER-PKG ?AUTO_2001 ?AUTO_2002 )
      ( DELIVER-PKG-VERIFY ?AUTO_2001 ?AUTO_2002 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2021 - OBJ
      ?AUTO_2022 - LOCATION
    )
    :vars
    (
      ?AUTO_2030 - LOCATION
      ?AUTO_2023 - LOCATION
      ?AUTO_2025 - AIRPLANE
      ?AUTO_2029 - TRUCK
      ?AUTO_2024 - LOCATION
      ?AUTO_2028 - CITY
      ?AUTO_2032 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2030 ) ( AIRPORT ?AUTO_2022 ) ( not ( = ?AUTO_2030 ?AUTO_2022 ) ) ( AIRPORT ?AUTO_2023 ) ( AIRPLANE-AT ?AUTO_2025 ?AUTO_2023 ) ( not ( = ?AUTO_2023 ?AUTO_2030 ) ) ( TRUCK-AT ?AUTO_2029 ?AUTO_2024 ) ( IN-CITY ?AUTO_2024 ?AUTO_2028 ) ( IN-CITY ?AUTO_2030 ?AUTO_2028 ) ( not ( = ?AUTO_2030 ?AUTO_2024 ) ) ( TRUCK-AT ?AUTO_2029 ?AUTO_2032 ) ( OBJ-AT ?AUTO_2021 ?AUTO_2032 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2021 ?AUTO_2029 ?AUTO_2032 )
      ( DELIVER-PKG ?AUTO_2021 ?AUTO_2022 )
      ( DELIVER-PKG-VERIFY ?AUTO_2021 ?AUTO_2022 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2038 - OBJ
      ?AUTO_2039 - LOCATION
    )
    :vars
    (
      ?AUTO_2047 - LOCATION
      ?AUTO_2041 - LOCATION
      ?AUTO_2040 - AIRPLANE
      ?AUTO_2045 - LOCATION
      ?AUTO_2048 - CITY
      ?AUTO_2042 - TRUCK
      ?AUTO_2051 - LOCATION
      ?AUTO_2050 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2047 ) ( AIRPORT ?AUTO_2039 ) ( not ( = ?AUTO_2047 ?AUTO_2039 ) ) ( AIRPORT ?AUTO_2041 ) ( AIRPLANE-AT ?AUTO_2040 ?AUTO_2041 ) ( not ( = ?AUTO_2041 ?AUTO_2047 ) ) ( IN-CITY ?AUTO_2045 ?AUTO_2048 ) ( IN-CITY ?AUTO_2047 ?AUTO_2048 ) ( not ( = ?AUTO_2047 ?AUTO_2045 ) ) ( OBJ-AT ?AUTO_2038 ?AUTO_2045 ) ( TRUCK-AT ?AUTO_2042 ?AUTO_2051 ) ( IN-CITY ?AUTO_2051 ?AUTO_2050 ) ( IN-CITY ?AUTO_2045 ?AUTO_2050 ) ( not ( = ?AUTO_2045 ?AUTO_2051 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2042 ?AUTO_2051 ?AUTO_2045 ?AUTO_2050 )
      ( DELIVER-PKG ?AUTO_2038 ?AUTO_2039 )
      ( DELIVER-PKG-VERIFY ?AUTO_2038 ?AUTO_2039 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2059 - OBJ
      ?AUTO_2060 - LOCATION
    )
    :vars
    (
      ?AUTO_2061 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2061 ?AUTO_2060 ) ( IN-TRUCK ?AUTO_2059 ?AUTO_2061 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2059 ?AUTO_2061 ?AUTO_2060 )
      ( DELIVER-PKG-VERIFY ?AUTO_2059 ?AUTO_2060 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2064 - OBJ
      ?AUTO_2065 - LOCATION
    )
    :vars
    (
      ?AUTO_2068 - TRUCK
      ?AUTO_2071 - LOCATION
      ?AUTO_2070 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2064 ?AUTO_2068 ) ( TRUCK-AT ?AUTO_2068 ?AUTO_2071 ) ( IN-CITY ?AUTO_2071 ?AUTO_2070 ) ( IN-CITY ?AUTO_2065 ?AUTO_2070 ) ( not ( = ?AUTO_2065 ?AUTO_2071 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2068 ?AUTO_2071 ?AUTO_2065 ?AUTO_2070 )
      ( DELIVER-PKG ?AUTO_2064 ?AUTO_2065 )
      ( DELIVER-PKG-VERIFY ?AUTO_2064 ?AUTO_2065 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2075 - OBJ
      ?AUTO_2076 - LOCATION
    )
    :vars
    (
      ?AUTO_2077 - TRUCK
      ?AUTO_2079 - LOCATION
      ?AUTO_2080 - CITY
      ?AUTO_2083 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2077 ?AUTO_2079 ) ( IN-CITY ?AUTO_2079 ?AUTO_2080 ) ( IN-CITY ?AUTO_2076 ?AUTO_2080 ) ( not ( = ?AUTO_2076 ?AUTO_2079 ) ) ( TRUCK-AT ?AUTO_2077 ?AUTO_2083 ) ( OBJ-AT ?AUTO_2075 ?AUTO_2083 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2075 ?AUTO_2077 ?AUTO_2083 )
      ( DELIVER-PKG ?AUTO_2075 ?AUTO_2076 )
      ( DELIVER-PKG-VERIFY ?AUTO_2075 ?AUTO_2076 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2085 - OBJ
      ?AUTO_2086 - LOCATION
    )
    :vars
    (
      ?AUTO_2092 - LOCATION
      ?AUTO_2091 - CITY
      ?AUTO_2089 - TRUCK
      ?AUTO_2095 - LOCATION
      ?AUTO_2094 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2092 ?AUTO_2091 ) ( IN-CITY ?AUTO_2086 ?AUTO_2091 ) ( not ( = ?AUTO_2086 ?AUTO_2092 ) ) ( OBJ-AT ?AUTO_2085 ?AUTO_2092 ) ( TRUCK-AT ?AUTO_2089 ?AUTO_2095 ) ( IN-CITY ?AUTO_2095 ?AUTO_2094 ) ( IN-CITY ?AUTO_2092 ?AUTO_2094 ) ( not ( = ?AUTO_2092 ?AUTO_2095 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2089 ?AUTO_2095 ?AUTO_2092 ?AUTO_2094 )
      ( DELIVER-PKG ?AUTO_2085 ?AUTO_2086 )
      ( DELIVER-PKG-VERIFY ?AUTO_2085 ?AUTO_2086 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2153 - OBJ
      ?AUTO_2154 - LOCATION
    )
    :vars
    (
      ?AUTO_2155 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2155 ?AUTO_2154 ) ( IN-TRUCK ?AUTO_2153 ?AUTO_2155 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2153 ?AUTO_2155 ?AUTO_2154 )
      ( DELIVER-PKG-VERIFY ?AUTO_2153 ?AUTO_2154 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2162 - OBJ
      ?AUTO_2163 - LOCATION
    )
    :vars
    (
      ?AUTO_2165 - TRUCK
      ?AUTO_2166 - LOCATION
      ?AUTO_2164 - CITY
      ?AUTO_2170 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2165 ?AUTO_2166 ) ( IN-CITY ?AUTO_2166 ?AUTO_2164 ) ( IN-CITY ?AUTO_2163 ?AUTO_2164 ) ( not ( = ?AUTO_2163 ?AUTO_2166 ) ) ( TRUCK-AT ?AUTO_2165 ?AUTO_2170 ) ( OBJ-AT ?AUTO_2162 ?AUTO_2170 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2162 ?AUTO_2165 ?AUTO_2170 )
      ( DELIVER-PKG ?AUTO_2162 ?AUTO_2163 )
      ( DELIVER-PKG-VERIFY ?AUTO_2162 ?AUTO_2163 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2232 - OBJ
      ?AUTO_2233 - LOCATION
    )
    :vars
    (
      ?AUTO_2234 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2232 ?AUTO_2234 ) ( AIRPLANE-AT ?AUTO_2234 ?AUTO_2233 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2232 ?AUTO_2234 ?AUTO_2233 )
      ( DELIVER-PKG-VERIFY ?AUTO_2232 ?AUTO_2233 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2237 - OBJ
      ?AUTO_2238 - LOCATION
    )
    :vars
    (
      ?AUTO_2241 - AIRPLANE
      ?AUTO_2243 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2237 ?AUTO_2241 ) ( AIRPORT ?AUTO_2243 ) ( AIRPORT ?AUTO_2238 ) ( AIRPLANE-AT ?AUTO_2241 ?AUTO_2243 ) ( not ( = ?AUTO_2243 ?AUTO_2238 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2241 ?AUTO_2243 ?AUTO_2238 )
      ( DELIVER-PKG ?AUTO_2237 ?AUTO_2238 )
      ( DELIVER-PKG-VERIFY ?AUTO_2237 ?AUTO_2238 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2247 - OBJ
      ?AUTO_2248 - LOCATION
    )
    :vars
    (
      ?AUTO_2252 - LOCATION
      ?AUTO_2250 - AIRPLANE
      ?AUTO_2254 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2252 ) ( AIRPORT ?AUTO_2248 ) ( AIRPLANE-AT ?AUTO_2250 ?AUTO_2252 ) ( not ( = ?AUTO_2252 ?AUTO_2248 ) ) ( OBJ-AT ?AUTO_2247 ?AUTO_2254 ) ( AIRPLANE-AT ?AUTO_2250 ?AUTO_2254 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2247 ?AUTO_2250 ?AUTO_2254 )
      ( DELIVER-PKG ?AUTO_2247 ?AUTO_2248 )
      ( DELIVER-PKG-VERIFY ?AUTO_2247 ?AUTO_2248 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2258 - OBJ
      ?AUTO_2259 - LOCATION
    )
    :vars
    (
      ?AUTO_2262 - LOCATION
      ?AUTO_2264 - AIRPLANE
      ?AUTO_2263 - LOCATION
      ?AUTO_2265 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2262 ) ( AIRPORT ?AUTO_2259 ) ( AIRPLANE-AT ?AUTO_2264 ?AUTO_2262 ) ( not ( = ?AUTO_2262 ?AUTO_2259 ) ) ( AIRPLANE-AT ?AUTO_2264 ?AUTO_2263 ) ( TRUCK-AT ?AUTO_2265 ?AUTO_2263 ) ( IN-TRUCK ?AUTO_2258 ?AUTO_2265 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2258 ?AUTO_2265 ?AUTO_2263 )
      ( DELIVER-PKG ?AUTO_2258 ?AUTO_2259 )
      ( DELIVER-PKG-VERIFY ?AUTO_2258 ?AUTO_2259 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2268 - OBJ
      ?AUTO_2269 - LOCATION
    )
    :vars
    (
      ?AUTO_2273 - LOCATION
      ?AUTO_2274 - AIRPLANE
      ?AUTO_2272 - LOCATION
      ?AUTO_2275 - TRUCK
      ?AUTO_2278 - LOCATION
      ?AUTO_2277 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2273 ) ( AIRPORT ?AUTO_2269 ) ( AIRPLANE-AT ?AUTO_2274 ?AUTO_2273 ) ( not ( = ?AUTO_2273 ?AUTO_2269 ) ) ( AIRPLANE-AT ?AUTO_2274 ?AUTO_2272 ) ( IN-TRUCK ?AUTO_2268 ?AUTO_2275 ) ( TRUCK-AT ?AUTO_2275 ?AUTO_2278 ) ( IN-CITY ?AUTO_2278 ?AUTO_2277 ) ( IN-CITY ?AUTO_2272 ?AUTO_2277 ) ( not ( = ?AUTO_2272 ?AUTO_2278 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2275 ?AUTO_2278 ?AUTO_2272 ?AUTO_2277 )
      ( DELIVER-PKG ?AUTO_2268 ?AUTO_2269 )
      ( DELIVER-PKG-VERIFY ?AUTO_2268 ?AUTO_2269 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2282 - OBJ
      ?AUTO_2283 - LOCATION
    )
    :vars
    (
      ?AUTO_2289 - LOCATION
      ?AUTO_2287 - AIRPLANE
      ?AUTO_2291 - LOCATION
      ?AUTO_2288 - TRUCK
      ?AUTO_2290 - LOCATION
      ?AUTO_2285 - CITY
      ?AUTO_2293 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2289 ) ( AIRPORT ?AUTO_2283 ) ( AIRPLANE-AT ?AUTO_2287 ?AUTO_2289 ) ( not ( = ?AUTO_2289 ?AUTO_2283 ) ) ( AIRPLANE-AT ?AUTO_2287 ?AUTO_2291 ) ( TRUCK-AT ?AUTO_2288 ?AUTO_2290 ) ( IN-CITY ?AUTO_2290 ?AUTO_2285 ) ( IN-CITY ?AUTO_2291 ?AUTO_2285 ) ( not ( = ?AUTO_2291 ?AUTO_2290 ) ) ( TRUCK-AT ?AUTO_2288 ?AUTO_2293 ) ( OBJ-AT ?AUTO_2282 ?AUTO_2293 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2282 ?AUTO_2288 ?AUTO_2293 )
      ( DELIVER-PKG ?AUTO_2282 ?AUTO_2283 )
      ( DELIVER-PKG-VERIFY ?AUTO_2282 ?AUTO_2283 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2295 - OBJ
      ?AUTO_2296 - LOCATION
    )
    :vars
    (
      ?AUTO_2304 - LOCATION
      ?AUTO_2303 - AIRPLANE
      ?AUTO_2299 - LOCATION
      ?AUTO_2305 - LOCATION
      ?AUTO_2300 - CITY
      ?AUTO_2301 - TRUCK
      ?AUTO_2308 - LOCATION
      ?AUTO_2307 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2304 ) ( AIRPORT ?AUTO_2296 ) ( AIRPLANE-AT ?AUTO_2303 ?AUTO_2304 ) ( not ( = ?AUTO_2304 ?AUTO_2296 ) ) ( AIRPLANE-AT ?AUTO_2303 ?AUTO_2299 ) ( IN-CITY ?AUTO_2305 ?AUTO_2300 ) ( IN-CITY ?AUTO_2299 ?AUTO_2300 ) ( not ( = ?AUTO_2299 ?AUTO_2305 ) ) ( OBJ-AT ?AUTO_2295 ?AUTO_2305 ) ( TRUCK-AT ?AUTO_2301 ?AUTO_2308 ) ( IN-CITY ?AUTO_2308 ?AUTO_2307 ) ( IN-CITY ?AUTO_2305 ?AUTO_2307 ) ( not ( = ?AUTO_2305 ?AUTO_2308 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2301 ?AUTO_2308 ?AUTO_2305 ?AUTO_2307 )
      ( DELIVER-PKG ?AUTO_2295 ?AUTO_2296 )
      ( DELIVER-PKG-VERIFY ?AUTO_2295 ?AUTO_2296 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2312 - OBJ
      ?AUTO_2313 - LOCATION
    )
    :vars
    (
      ?AUTO_2315 - LOCATION
      ?AUTO_2321 - LOCATION
      ?AUTO_2323 - CITY
      ?AUTO_2319 - TRUCK
      ?AUTO_2314 - LOCATION
      ?AUTO_2316 - CITY
      ?AUTO_2325 - LOCATION
      ?AUTO_2317 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2315 ) ( AIRPORT ?AUTO_2313 ) ( not ( = ?AUTO_2315 ?AUTO_2313 ) ) ( IN-CITY ?AUTO_2321 ?AUTO_2323 ) ( IN-CITY ?AUTO_2315 ?AUTO_2323 ) ( not ( = ?AUTO_2315 ?AUTO_2321 ) ) ( OBJ-AT ?AUTO_2312 ?AUTO_2321 ) ( TRUCK-AT ?AUTO_2319 ?AUTO_2314 ) ( IN-CITY ?AUTO_2314 ?AUTO_2316 ) ( IN-CITY ?AUTO_2321 ?AUTO_2316 ) ( not ( = ?AUTO_2321 ?AUTO_2314 ) ) ( AIRPORT ?AUTO_2325 ) ( AIRPLANE-AT ?AUTO_2317 ?AUTO_2325 ) ( not ( = ?AUTO_2325 ?AUTO_2315 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2317 ?AUTO_2325 ?AUTO_2315 )
      ( DELIVER-PKG ?AUTO_2312 ?AUTO_2313 )
      ( DELIVER-PKG-VERIFY ?AUTO_2312 ?AUTO_2313 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2379 - OBJ
      ?AUTO_2380 - LOCATION
    )
    :vars
    (
      ?AUTO_2381 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2379 ?AUTO_2381 ) ( AIRPLANE-AT ?AUTO_2381 ?AUTO_2380 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2379 ?AUTO_2381 ?AUTO_2380 )
      ( DELIVER-PKG-VERIFY ?AUTO_2379 ?AUTO_2380 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2388 - OBJ
      ?AUTO_2389 - LOCATION
    )
    :vars
    (
      ?AUTO_2390 - LOCATION
      ?AUTO_2391 - AIRPLANE
      ?AUTO_2395 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2390 ) ( AIRPORT ?AUTO_2389 ) ( AIRPLANE-AT ?AUTO_2391 ?AUTO_2390 ) ( not ( = ?AUTO_2390 ?AUTO_2389 ) ) ( OBJ-AT ?AUTO_2388 ?AUTO_2395 ) ( AIRPLANE-AT ?AUTO_2391 ?AUTO_2395 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2388 ?AUTO_2391 ?AUTO_2395 )
      ( DELIVER-PKG ?AUTO_2388 ?AUTO_2389 )
      ( DELIVER-PKG-VERIFY ?AUTO_2388 ?AUTO_2389 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2399 - OBJ
      ?AUTO_2400 - LOCATION
    )
    :vars
    (
      ?AUTO_2404 - LOCATION
      ?AUTO_2402 - AIRPLANE
      ?AUTO_2405 - LOCATION
      ?AUTO_2406 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2404 ) ( AIRPORT ?AUTO_2400 ) ( AIRPLANE-AT ?AUTO_2402 ?AUTO_2404 ) ( not ( = ?AUTO_2404 ?AUTO_2400 ) ) ( AIRPLANE-AT ?AUTO_2402 ?AUTO_2405 ) ( TRUCK-AT ?AUTO_2406 ?AUTO_2405 ) ( IN-TRUCK ?AUTO_2399 ?AUTO_2406 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2399 ?AUTO_2406 ?AUTO_2405 )
      ( DELIVER-PKG ?AUTO_2399 ?AUTO_2400 )
      ( DELIVER-PKG-VERIFY ?AUTO_2399 ?AUTO_2400 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2413 - OBJ
      ?AUTO_2414 - LOCATION
    )
    :vars
    (
      ?AUTO_2417 - LOCATION
      ?AUTO_2421 - AIRPLANE
      ?AUTO_2415 - LOCATION
      ?AUTO_2418 - TRUCK
      ?AUTO_2416 - LOCATION
      ?AUTO_2420 - CITY
      ?AUTO_2424 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2417 ) ( AIRPORT ?AUTO_2414 ) ( AIRPLANE-AT ?AUTO_2421 ?AUTO_2417 ) ( not ( = ?AUTO_2417 ?AUTO_2414 ) ) ( AIRPLANE-AT ?AUTO_2421 ?AUTO_2415 ) ( TRUCK-AT ?AUTO_2418 ?AUTO_2416 ) ( IN-CITY ?AUTO_2416 ?AUTO_2420 ) ( IN-CITY ?AUTO_2415 ?AUTO_2420 ) ( not ( = ?AUTO_2415 ?AUTO_2416 ) ) ( TRUCK-AT ?AUTO_2418 ?AUTO_2424 ) ( OBJ-AT ?AUTO_2413 ?AUTO_2424 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2413 ?AUTO_2418 ?AUTO_2424 )
      ( DELIVER-PKG ?AUTO_2413 ?AUTO_2414 )
      ( DELIVER-PKG-VERIFY ?AUTO_2413 ?AUTO_2414 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2486 - OBJ
      ?AUTO_2487 - LOCATION
    )
    :vars
    (
      ?AUTO_2488 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2488 ?AUTO_2487 ) ( IN-TRUCK ?AUTO_2486 ?AUTO_2488 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2486 ?AUTO_2488 ?AUTO_2487 )
      ( DELIVER-PKG-VERIFY ?AUTO_2486 ?AUTO_2487 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2491 - OBJ
      ?AUTO_2492 - LOCATION
    )
    :vars
    (
      ?AUTO_2495 - TRUCK
      ?AUTO_2498 - LOCATION
      ?AUTO_2497 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2491 ?AUTO_2495 ) ( TRUCK-AT ?AUTO_2495 ?AUTO_2498 ) ( IN-CITY ?AUTO_2498 ?AUTO_2497 ) ( IN-CITY ?AUTO_2492 ?AUTO_2497 ) ( not ( = ?AUTO_2492 ?AUTO_2498 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2495 ?AUTO_2498 ?AUTO_2492 ?AUTO_2497 )
      ( DELIVER-PKG ?AUTO_2491 ?AUTO_2492 )
      ( DELIVER-PKG-VERIFY ?AUTO_2491 ?AUTO_2492 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2502 - OBJ
      ?AUTO_2503 - LOCATION
    )
    :vars
    (
      ?AUTO_2504 - TRUCK
      ?AUTO_2505 - LOCATION
      ?AUTO_2507 - CITY
      ?AUTO_2510 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2504 ?AUTO_2505 ) ( IN-CITY ?AUTO_2505 ?AUTO_2507 ) ( IN-CITY ?AUTO_2503 ?AUTO_2507 ) ( not ( = ?AUTO_2503 ?AUTO_2505 ) ) ( TRUCK-AT ?AUTO_2504 ?AUTO_2510 ) ( OBJ-AT ?AUTO_2502 ?AUTO_2510 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2502 ?AUTO_2504 ?AUTO_2510 )
      ( DELIVER-PKG ?AUTO_2502 ?AUTO_2503 )
      ( DELIVER-PKG-VERIFY ?AUTO_2502 ?AUTO_2503 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2512 - OBJ
      ?AUTO_2513 - LOCATION
    )
    :vars
    (
      ?AUTO_2519 - LOCATION
      ?AUTO_2518 - CITY
      ?AUTO_2516 - TRUCK
      ?AUTO_2522 - LOCATION
      ?AUTO_2521 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2519 ?AUTO_2518 ) ( IN-CITY ?AUTO_2513 ?AUTO_2518 ) ( not ( = ?AUTO_2513 ?AUTO_2519 ) ) ( OBJ-AT ?AUTO_2512 ?AUTO_2519 ) ( TRUCK-AT ?AUTO_2516 ?AUTO_2522 ) ( IN-CITY ?AUTO_2522 ?AUTO_2521 ) ( IN-CITY ?AUTO_2519 ?AUTO_2521 ) ( not ( = ?AUTO_2519 ?AUTO_2522 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2516 ?AUTO_2522 ?AUTO_2519 ?AUTO_2521 )
      ( DELIVER-PKG ?AUTO_2512 ?AUTO_2513 )
      ( DELIVER-PKG-VERIFY ?AUTO_2512 ?AUTO_2513 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2556 - OBJ
      ?AUTO_2557 - LOCATION
    )
    :vars
    (
      ?AUTO_2559 - LOCATION
      ?AUTO_2563 - CITY
      ?AUTO_2562 - TRUCK
      ?AUTO_2564 - LOCATION
      ?AUTO_2561 - CITY
      ?AUTO_2565 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2559 ?AUTO_2563 ) ( IN-CITY ?AUTO_2557 ?AUTO_2563 ) ( not ( = ?AUTO_2557 ?AUTO_2559 ) ) ( TRUCK-AT ?AUTO_2562 ?AUTO_2564 ) ( IN-CITY ?AUTO_2564 ?AUTO_2561 ) ( IN-CITY ?AUTO_2559 ?AUTO_2561 ) ( not ( = ?AUTO_2559 ?AUTO_2564 ) ) ( IN-AIRPLANE ?AUTO_2556 ?AUTO_2565 ) ( AIRPLANE-AT ?AUTO_2565 ?AUTO_2559 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2556 ?AUTO_2565 ?AUTO_2559 )
      ( DELIVER-PKG ?AUTO_2556 ?AUTO_2557 )
      ( DELIVER-PKG-VERIFY ?AUTO_2556 ?AUTO_2557 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2568 - OBJ
      ?AUTO_2569 - LOCATION
    )
    :vars
    (
      ?AUTO_2571 - LOCATION
      ?AUTO_2575 - CITY
      ?AUTO_2573 - TRUCK
      ?AUTO_2574 - LOCATION
      ?AUTO_2576 - CITY
      ?AUTO_2577 - AIRPLANE
      ?AUTO_2579 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2571 ?AUTO_2575 ) ( IN-CITY ?AUTO_2569 ?AUTO_2575 ) ( not ( = ?AUTO_2569 ?AUTO_2571 ) ) ( TRUCK-AT ?AUTO_2573 ?AUTO_2574 ) ( IN-CITY ?AUTO_2574 ?AUTO_2576 ) ( IN-CITY ?AUTO_2571 ?AUTO_2576 ) ( not ( = ?AUTO_2571 ?AUTO_2574 ) ) ( IN-AIRPLANE ?AUTO_2568 ?AUTO_2577 ) ( AIRPORT ?AUTO_2579 ) ( AIRPORT ?AUTO_2571 ) ( AIRPLANE-AT ?AUTO_2577 ?AUTO_2579 ) ( not ( = ?AUTO_2579 ?AUTO_2571 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2577 ?AUTO_2579 ?AUTO_2571 )
      ( DELIVER-PKG ?AUTO_2568 ?AUTO_2569 )
      ( DELIVER-PKG-VERIFY ?AUTO_2568 ?AUTO_2569 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2585 - OBJ
      ?AUTO_2586 - LOCATION
    )
    :vars
    (
      ?AUTO_2589 - LOCATION
      ?AUTO_2587 - CITY
      ?AUTO_2595 - TRUCK
      ?AUTO_2592 - LOCATION
      ?AUTO_2594 - CITY
      ?AUTO_2593 - LOCATION
      ?AUTO_2588 - AIRPLANE
      ?AUTO_2597 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2589 ?AUTO_2587 ) ( IN-CITY ?AUTO_2586 ?AUTO_2587 ) ( not ( = ?AUTO_2586 ?AUTO_2589 ) ) ( TRUCK-AT ?AUTO_2595 ?AUTO_2592 ) ( IN-CITY ?AUTO_2592 ?AUTO_2594 ) ( IN-CITY ?AUTO_2589 ?AUTO_2594 ) ( not ( = ?AUTO_2589 ?AUTO_2592 ) ) ( AIRPORT ?AUTO_2593 ) ( AIRPORT ?AUTO_2589 ) ( AIRPLANE-AT ?AUTO_2588 ?AUTO_2593 ) ( not ( = ?AUTO_2593 ?AUTO_2589 ) ) ( OBJ-AT ?AUTO_2585 ?AUTO_2597 ) ( AIRPLANE-AT ?AUTO_2588 ?AUTO_2597 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2585 ?AUTO_2588 ?AUTO_2597 )
      ( DELIVER-PKG ?AUTO_2585 ?AUTO_2586 )
      ( DELIVER-PKG-VERIFY ?AUTO_2585 ?AUTO_2586 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2599 - OBJ
      ?AUTO_2600 - LOCATION
    )
    :vars
    (
      ?AUTO_2603 - LOCATION
      ?AUTO_2606 - CITY
      ?AUTO_2607 - TRUCK
      ?AUTO_2609 - LOCATION
      ?AUTO_2605 - CITY
      ?AUTO_2610 - LOCATION
      ?AUTO_2612 - LOCATION
      ?AUTO_2608 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2603 ?AUTO_2606 ) ( IN-CITY ?AUTO_2600 ?AUTO_2606 ) ( not ( = ?AUTO_2600 ?AUTO_2603 ) ) ( TRUCK-AT ?AUTO_2607 ?AUTO_2609 ) ( IN-CITY ?AUTO_2609 ?AUTO_2605 ) ( IN-CITY ?AUTO_2603 ?AUTO_2605 ) ( not ( = ?AUTO_2603 ?AUTO_2609 ) ) ( AIRPORT ?AUTO_2610 ) ( AIRPORT ?AUTO_2603 ) ( not ( = ?AUTO_2610 ?AUTO_2603 ) ) ( OBJ-AT ?AUTO_2599 ?AUTO_2610 ) ( AIRPORT ?AUTO_2612 ) ( AIRPLANE-AT ?AUTO_2608 ?AUTO_2612 ) ( not ( = ?AUTO_2612 ?AUTO_2610 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2608 ?AUTO_2612 ?AUTO_2610 )
      ( DELIVER-PKG ?AUTO_2599 ?AUTO_2600 )
      ( DELIVER-PKG-VERIFY ?AUTO_2599 ?AUTO_2600 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2630 - OBJ
      ?AUTO_2631 - LOCATION
    )
    :vars
    (
      ?AUTO_2632 - LOCATION
      ?AUTO_2639 - CITY
      ?AUTO_2637 - TRUCK
      ?AUTO_2634 - LOCATION
      ?AUTO_2636 - CITY
      ?AUTO_2640 - LOCATION
      ?AUTO_2641 - LOCATION
      ?AUTO_2638 - AIRPLANE
      ?AUTO_2642 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2632 ?AUTO_2639 ) ( IN-CITY ?AUTO_2631 ?AUTO_2639 ) ( not ( = ?AUTO_2631 ?AUTO_2632 ) ) ( TRUCK-AT ?AUTO_2637 ?AUTO_2634 ) ( IN-CITY ?AUTO_2634 ?AUTO_2636 ) ( IN-CITY ?AUTO_2632 ?AUTO_2636 ) ( not ( = ?AUTO_2632 ?AUTO_2634 ) ) ( AIRPORT ?AUTO_2640 ) ( AIRPORT ?AUTO_2632 ) ( not ( = ?AUTO_2640 ?AUTO_2632 ) ) ( AIRPORT ?AUTO_2641 ) ( AIRPLANE-AT ?AUTO_2638 ?AUTO_2641 ) ( not ( = ?AUTO_2641 ?AUTO_2640 ) ) ( TRUCK-AT ?AUTO_2642 ?AUTO_2640 ) ( IN-TRUCK ?AUTO_2630 ?AUTO_2642 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2630 ?AUTO_2642 ?AUTO_2640 )
      ( DELIVER-PKG ?AUTO_2630 ?AUTO_2631 )
      ( DELIVER-PKG-VERIFY ?AUTO_2630 ?AUTO_2631 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2645 - OBJ
      ?AUTO_2646 - LOCATION
    )
    :vars
    (
      ?AUTO_2657 - LOCATION
      ?AUTO_2653 - CITY
      ?AUTO_2655 - TRUCK
      ?AUTO_2651 - LOCATION
      ?AUTO_2649 - CITY
      ?AUTO_2654 - LOCATION
      ?AUTO_2656 - LOCATION
      ?AUTO_2650 - AIRPLANE
      ?AUTO_2647 - TRUCK
      ?AUTO_2660 - LOCATION
      ?AUTO_2659 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2657 ?AUTO_2653 ) ( IN-CITY ?AUTO_2646 ?AUTO_2653 ) ( not ( = ?AUTO_2646 ?AUTO_2657 ) ) ( TRUCK-AT ?AUTO_2655 ?AUTO_2651 ) ( IN-CITY ?AUTO_2651 ?AUTO_2649 ) ( IN-CITY ?AUTO_2657 ?AUTO_2649 ) ( not ( = ?AUTO_2657 ?AUTO_2651 ) ) ( AIRPORT ?AUTO_2654 ) ( AIRPORT ?AUTO_2657 ) ( not ( = ?AUTO_2654 ?AUTO_2657 ) ) ( AIRPORT ?AUTO_2656 ) ( AIRPLANE-AT ?AUTO_2650 ?AUTO_2656 ) ( not ( = ?AUTO_2656 ?AUTO_2654 ) ) ( IN-TRUCK ?AUTO_2645 ?AUTO_2647 ) ( TRUCK-AT ?AUTO_2647 ?AUTO_2660 ) ( IN-CITY ?AUTO_2660 ?AUTO_2659 ) ( IN-CITY ?AUTO_2654 ?AUTO_2659 ) ( not ( = ?AUTO_2654 ?AUTO_2660 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2647 ?AUTO_2660 ?AUTO_2654 ?AUTO_2659 )
      ( DELIVER-PKG ?AUTO_2645 ?AUTO_2646 )
      ( DELIVER-PKG-VERIFY ?AUTO_2645 ?AUTO_2646 ) )
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
      ?AUTO_2674 - CITY
      ?AUTO_2676 - TRUCK
      ?AUTO_2683 - LOCATION
      ?AUTO_2681 - CITY
      ?AUTO_2685 - LOCATION
      ?AUTO_2686 - LOCATION
      ?AUTO_2677 - AIRPLANE
      ?AUTO_2680 - TRUCK
      ?AUTO_2684 - LOCATION
      ?AUTO_2679 - CITY
      ?AUTO_2688 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2678 ?AUTO_2674 ) ( IN-CITY ?AUTO_2673 ?AUTO_2674 ) ( not ( = ?AUTO_2673 ?AUTO_2678 ) ) ( TRUCK-AT ?AUTO_2676 ?AUTO_2683 ) ( IN-CITY ?AUTO_2683 ?AUTO_2681 ) ( IN-CITY ?AUTO_2678 ?AUTO_2681 ) ( not ( = ?AUTO_2678 ?AUTO_2683 ) ) ( AIRPORT ?AUTO_2685 ) ( AIRPORT ?AUTO_2678 ) ( not ( = ?AUTO_2685 ?AUTO_2678 ) ) ( AIRPORT ?AUTO_2686 ) ( AIRPLANE-AT ?AUTO_2677 ?AUTO_2686 ) ( not ( = ?AUTO_2686 ?AUTO_2685 ) ) ( TRUCK-AT ?AUTO_2680 ?AUTO_2684 ) ( IN-CITY ?AUTO_2684 ?AUTO_2679 ) ( IN-CITY ?AUTO_2685 ?AUTO_2679 ) ( not ( = ?AUTO_2685 ?AUTO_2684 ) ) ( TRUCK-AT ?AUTO_2680 ?AUTO_2688 ) ( OBJ-AT ?AUTO_2672 ?AUTO_2688 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2672 ?AUTO_2680 ?AUTO_2688 )
      ( DELIVER-PKG ?AUTO_2672 ?AUTO_2673 )
      ( DELIVER-PKG-VERIFY ?AUTO_2672 ?AUTO_2673 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2692 - OBJ
      ?AUTO_2693 - LOCATION
    )
    :vars
    (
      ?AUTO_2694 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2694 ?AUTO_2693 ) ( IN-TRUCK ?AUTO_2692 ?AUTO_2694 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2692 ?AUTO_2694 ?AUTO_2693 )
      ( DELIVER-PKG-VERIFY ?AUTO_2692 ?AUTO_2693 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2701 - OBJ
      ?AUTO_2702 - LOCATION
    )
    :vars
    (
      ?AUTO_2704 - TRUCK
      ?AUTO_2705 - LOCATION
      ?AUTO_2703 - CITY
      ?AUTO_2709 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2704 ?AUTO_2705 ) ( IN-CITY ?AUTO_2705 ?AUTO_2703 ) ( IN-CITY ?AUTO_2702 ?AUTO_2703 ) ( not ( = ?AUTO_2702 ?AUTO_2705 ) ) ( TRUCK-AT ?AUTO_2704 ?AUTO_2709 ) ( OBJ-AT ?AUTO_2701 ?AUTO_2709 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2701 ?AUTO_2704 ?AUTO_2709 )
      ( DELIVER-PKG ?AUTO_2701 ?AUTO_2702 )
      ( DELIVER-PKG-VERIFY ?AUTO_2701 ?AUTO_2702 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2745 - OBJ
      ?AUTO_2746 - LOCATION
    )
    :vars
    (
      ?AUTO_2749 - LOCATION
      ?AUTO_2750 - CITY
      ?AUTO_2751 - TRUCK
      ?AUTO_2748 - LOCATION
      ?AUTO_2752 - CITY
      ?AUTO_2754 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2749 ?AUTO_2750 ) ( IN-CITY ?AUTO_2746 ?AUTO_2750 ) ( not ( = ?AUTO_2746 ?AUTO_2749 ) ) ( TRUCK-AT ?AUTO_2751 ?AUTO_2748 ) ( IN-CITY ?AUTO_2748 ?AUTO_2752 ) ( IN-CITY ?AUTO_2749 ?AUTO_2752 ) ( not ( = ?AUTO_2749 ?AUTO_2748 ) ) ( IN-AIRPLANE ?AUTO_2745 ?AUTO_2754 ) ( AIRPLANE-AT ?AUTO_2754 ?AUTO_2749 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2745 ?AUTO_2754 ?AUTO_2749 )
      ( DELIVER-PKG ?AUTO_2745 ?AUTO_2746 )
      ( DELIVER-PKG-VERIFY ?AUTO_2745 ?AUTO_2746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2763 - OBJ
      ?AUTO_2764 - LOCATION
    )
    :vars
    (
      ?AUTO_2769 - LOCATION
      ?AUTO_2770 - CITY
      ?AUTO_2768 - TRUCK
      ?AUTO_2767 - LOCATION
      ?AUTO_2771 - CITY
      ?AUTO_2772 - LOCATION
      ?AUTO_2766 - AIRPLANE
      ?AUTO_2775 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2769 ?AUTO_2770 ) ( IN-CITY ?AUTO_2764 ?AUTO_2770 ) ( not ( = ?AUTO_2764 ?AUTO_2769 ) ) ( TRUCK-AT ?AUTO_2768 ?AUTO_2767 ) ( IN-CITY ?AUTO_2767 ?AUTO_2771 ) ( IN-CITY ?AUTO_2769 ?AUTO_2771 ) ( not ( = ?AUTO_2769 ?AUTO_2767 ) ) ( AIRPORT ?AUTO_2772 ) ( AIRPORT ?AUTO_2769 ) ( AIRPLANE-AT ?AUTO_2766 ?AUTO_2772 ) ( not ( = ?AUTO_2772 ?AUTO_2769 ) ) ( OBJ-AT ?AUTO_2763 ?AUTO_2775 ) ( AIRPLANE-AT ?AUTO_2766 ?AUTO_2775 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2763 ?AUTO_2766 ?AUTO_2775 )
      ( DELIVER-PKG ?AUTO_2763 ?AUTO_2764 )
      ( DELIVER-PKG-VERIFY ?AUTO_2763 ?AUTO_2764 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2795 - OBJ
      ?AUTO_2796 - LOCATION
    )
    :vars
    (
      ?AUTO_2803 - LOCATION
      ?AUTO_2798 - CITY
      ?AUTO_2800 - TRUCK
      ?AUTO_2802 - LOCATION
      ?AUTO_2806 - CITY
      ?AUTO_2805 - LOCATION
      ?AUTO_2804 - LOCATION
      ?AUTO_2801 - AIRPLANE
      ?AUTO_2807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2803 ?AUTO_2798 ) ( IN-CITY ?AUTO_2796 ?AUTO_2798 ) ( not ( = ?AUTO_2796 ?AUTO_2803 ) ) ( TRUCK-AT ?AUTO_2800 ?AUTO_2802 ) ( IN-CITY ?AUTO_2802 ?AUTO_2806 ) ( IN-CITY ?AUTO_2803 ?AUTO_2806 ) ( not ( = ?AUTO_2803 ?AUTO_2802 ) ) ( AIRPORT ?AUTO_2805 ) ( AIRPORT ?AUTO_2803 ) ( not ( = ?AUTO_2805 ?AUTO_2803 ) ) ( AIRPORT ?AUTO_2804 ) ( AIRPLANE-AT ?AUTO_2801 ?AUTO_2804 ) ( not ( = ?AUTO_2804 ?AUTO_2805 ) ) ( TRUCK-AT ?AUTO_2807 ?AUTO_2805 ) ( IN-TRUCK ?AUTO_2795 ?AUTO_2807 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2795 ?AUTO_2807 ?AUTO_2805 )
      ( DELIVER-PKG ?AUTO_2795 ?AUTO_2796 )
      ( DELIVER-PKG-VERIFY ?AUTO_2795 ?AUTO_2796 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2822 - OBJ
      ?AUTO_2823 - LOCATION
    )
    :vars
    (
      ?AUTO_2828 - LOCATION
      ?AUTO_2826 - CITY
      ?AUTO_2836 - TRUCK
      ?AUTO_2832 - LOCATION
      ?AUTO_2827 - CITY
      ?AUTO_2830 - LOCATION
      ?AUTO_2829 - LOCATION
      ?AUTO_2825 - AIRPLANE
      ?AUTO_2834 - TRUCK
      ?AUTO_2831 - LOCATION
      ?AUTO_2833 - CITY
      ?AUTO_2838 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2828 ?AUTO_2826 ) ( IN-CITY ?AUTO_2823 ?AUTO_2826 ) ( not ( = ?AUTO_2823 ?AUTO_2828 ) ) ( TRUCK-AT ?AUTO_2836 ?AUTO_2832 ) ( IN-CITY ?AUTO_2832 ?AUTO_2827 ) ( IN-CITY ?AUTO_2828 ?AUTO_2827 ) ( not ( = ?AUTO_2828 ?AUTO_2832 ) ) ( AIRPORT ?AUTO_2830 ) ( AIRPORT ?AUTO_2828 ) ( not ( = ?AUTO_2830 ?AUTO_2828 ) ) ( AIRPORT ?AUTO_2829 ) ( AIRPLANE-AT ?AUTO_2825 ?AUTO_2829 ) ( not ( = ?AUTO_2829 ?AUTO_2830 ) ) ( TRUCK-AT ?AUTO_2834 ?AUTO_2831 ) ( IN-CITY ?AUTO_2831 ?AUTO_2833 ) ( IN-CITY ?AUTO_2830 ?AUTO_2833 ) ( not ( = ?AUTO_2830 ?AUTO_2831 ) ) ( TRUCK-AT ?AUTO_2834 ?AUTO_2838 ) ( OBJ-AT ?AUTO_2822 ?AUTO_2838 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2822 ?AUTO_2834 ?AUTO_2838 )
      ( DELIVER-PKG ?AUTO_2822 ?AUTO_2823 )
      ( DELIVER-PKG-VERIFY ?AUTO_2822 ?AUTO_2823 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2844 - OBJ
      ?AUTO_2845 - LOCATION
    )
    :vars
    (
      ?AUTO_2846 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2846 ?AUTO_2845 ) ( IN-TRUCK ?AUTO_2844 ?AUTO_2846 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2844 ?AUTO_2846 ?AUTO_2845 )
      ( DELIVER-PKG-VERIFY ?AUTO_2844 ?AUTO_2845 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2849 - OBJ
      ?AUTO_2850 - LOCATION
    )
    :vars
    (
      ?AUTO_2851 - TRUCK
      ?AUTO_2856 - LOCATION
      ?AUTO_2855 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2849 ?AUTO_2851 ) ( TRUCK-AT ?AUTO_2851 ?AUTO_2856 ) ( IN-CITY ?AUTO_2856 ?AUTO_2855 ) ( IN-CITY ?AUTO_2850 ?AUTO_2855 ) ( not ( = ?AUTO_2850 ?AUTO_2856 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2851 ?AUTO_2856 ?AUTO_2850 ?AUTO_2855 )
      ( DELIVER-PKG ?AUTO_2849 ?AUTO_2850 )
      ( DELIVER-PKG-VERIFY ?AUTO_2849 ?AUTO_2850 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2860 - OBJ
      ?AUTO_2861 - LOCATION
    )
    :vars
    (
      ?AUTO_2862 - TRUCK
      ?AUTO_2863 - LOCATION
      ?AUTO_2865 - CITY
      ?AUTO_2868 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2862 ?AUTO_2863 ) ( IN-CITY ?AUTO_2863 ?AUTO_2865 ) ( IN-CITY ?AUTO_2861 ?AUTO_2865 ) ( not ( = ?AUTO_2861 ?AUTO_2863 ) ) ( TRUCK-AT ?AUTO_2862 ?AUTO_2868 ) ( OBJ-AT ?AUTO_2860 ?AUTO_2868 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2860 ?AUTO_2862 ?AUTO_2868 )
      ( DELIVER-PKG ?AUTO_2860 ?AUTO_2861 )
      ( DELIVER-PKG-VERIFY ?AUTO_2860 ?AUTO_2861 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2872 - OBJ
      ?AUTO_2873 - LOCATION
    )
    :vars
    (
      ?AUTO_2876 - LOCATION
      ?AUTO_2879 - CITY
      ?AUTO_2877 - TRUCK
      ?AUTO_2882 - LOCATION
      ?AUTO_2881 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2876 ?AUTO_2879 ) ( IN-CITY ?AUTO_2873 ?AUTO_2879 ) ( not ( = ?AUTO_2873 ?AUTO_2876 ) ) ( OBJ-AT ?AUTO_2872 ?AUTO_2876 ) ( TRUCK-AT ?AUTO_2877 ?AUTO_2882 ) ( IN-CITY ?AUTO_2882 ?AUTO_2881 ) ( IN-CITY ?AUTO_2876 ?AUTO_2881 ) ( not ( = ?AUTO_2876 ?AUTO_2882 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2877 ?AUTO_2882 ?AUTO_2876 ?AUTO_2881 )
      ( DELIVER-PKG ?AUTO_2872 ?AUTO_2873 )
      ( DELIVER-PKG-VERIFY ?AUTO_2872 ?AUTO_2873 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2896 - OBJ
      ?AUTO_2897 - LOCATION
    )
    :vars
    (
      ?AUTO_2900 - LOCATION
      ?AUTO_2901 - CITY
      ?AUTO_2903 - TRUCK
      ?AUTO_2902 - LOCATION
      ?AUTO_2899 - CITY
      ?AUTO_2905 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2900 ?AUTO_2901 ) ( IN-CITY ?AUTO_2897 ?AUTO_2901 ) ( not ( = ?AUTO_2897 ?AUTO_2900 ) ) ( TRUCK-AT ?AUTO_2903 ?AUTO_2902 ) ( IN-CITY ?AUTO_2902 ?AUTO_2899 ) ( IN-CITY ?AUTO_2900 ?AUTO_2899 ) ( not ( = ?AUTO_2900 ?AUTO_2902 ) ) ( IN-AIRPLANE ?AUTO_2896 ?AUTO_2905 ) ( AIRPLANE-AT ?AUTO_2905 ?AUTO_2900 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2896 ?AUTO_2905 ?AUTO_2900 )
      ( DELIVER-PKG ?AUTO_2896 ?AUTO_2897 )
      ( DELIVER-PKG-VERIFY ?AUTO_2896 ?AUTO_2897 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2910 - OBJ
      ?AUTO_2911 - LOCATION
    )
    :vars
    (
      ?AUTO_2918 - LOCATION
      ?AUTO_2919 - CITY
      ?AUTO_2916 - TRUCK
      ?AUTO_2914 - LOCATION
      ?AUTO_2915 - CITY
      ?AUTO_2917 - AIRPLANE
      ?AUTO_2921 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2918 ?AUTO_2919 ) ( IN-CITY ?AUTO_2911 ?AUTO_2919 ) ( not ( = ?AUTO_2911 ?AUTO_2918 ) ) ( TRUCK-AT ?AUTO_2916 ?AUTO_2914 ) ( IN-CITY ?AUTO_2914 ?AUTO_2915 ) ( IN-CITY ?AUTO_2918 ?AUTO_2915 ) ( not ( = ?AUTO_2918 ?AUTO_2914 ) ) ( IN-AIRPLANE ?AUTO_2910 ?AUTO_2917 ) ( AIRPORT ?AUTO_2921 ) ( AIRPORT ?AUTO_2918 ) ( AIRPLANE-AT ?AUTO_2917 ?AUTO_2921 ) ( not ( = ?AUTO_2921 ?AUTO_2918 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2917 ?AUTO_2921 ?AUTO_2918 )
      ( DELIVER-PKG ?AUTO_2910 ?AUTO_2911 )
      ( DELIVER-PKG-VERIFY ?AUTO_2910 ?AUTO_2911 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2923 - OBJ
      ?AUTO_2924 - LOCATION
    )
    :vars
    (
      ?AUTO_2927 - LOCATION
      ?AUTO_2929 - CITY
      ?AUTO_2932 - TRUCK
      ?AUTO_2925 - LOCATION
      ?AUTO_2931 - CITY
      ?AUTO_2933 - LOCATION
      ?AUTO_2928 - AIRPLANE
      ?AUTO_2935 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2927 ?AUTO_2929 ) ( IN-CITY ?AUTO_2924 ?AUTO_2929 ) ( not ( = ?AUTO_2924 ?AUTO_2927 ) ) ( TRUCK-AT ?AUTO_2932 ?AUTO_2925 ) ( IN-CITY ?AUTO_2925 ?AUTO_2931 ) ( IN-CITY ?AUTO_2927 ?AUTO_2931 ) ( not ( = ?AUTO_2927 ?AUTO_2925 ) ) ( AIRPORT ?AUTO_2933 ) ( AIRPORT ?AUTO_2927 ) ( AIRPLANE-AT ?AUTO_2928 ?AUTO_2933 ) ( not ( = ?AUTO_2933 ?AUTO_2927 ) ) ( OBJ-AT ?AUTO_2923 ?AUTO_2935 ) ( AIRPLANE-AT ?AUTO_2928 ?AUTO_2935 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2923 ?AUTO_2928 ?AUTO_2935 )
      ( DELIVER-PKG ?AUTO_2923 ?AUTO_2924 )
      ( DELIVER-PKG-VERIFY ?AUTO_2923 ?AUTO_2924 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2939 - OBJ
      ?AUTO_2940 - LOCATION
    )
    :vars
    (
      ?AUTO_2948 - LOCATION
      ?AUTO_2947 - CITY
      ?AUTO_2950 - TRUCK
      ?AUTO_2949 - LOCATION
      ?AUTO_2942 - CITY
      ?AUTO_2944 - LOCATION
      ?AUTO_2946 - AIRPLANE
      ?AUTO_2945 - LOCATION
      ?AUTO_2951 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2948 ?AUTO_2947 ) ( IN-CITY ?AUTO_2940 ?AUTO_2947 ) ( not ( = ?AUTO_2940 ?AUTO_2948 ) ) ( TRUCK-AT ?AUTO_2950 ?AUTO_2949 ) ( IN-CITY ?AUTO_2949 ?AUTO_2942 ) ( IN-CITY ?AUTO_2948 ?AUTO_2942 ) ( not ( = ?AUTO_2948 ?AUTO_2949 ) ) ( AIRPORT ?AUTO_2944 ) ( AIRPORT ?AUTO_2948 ) ( AIRPLANE-AT ?AUTO_2946 ?AUTO_2944 ) ( not ( = ?AUTO_2944 ?AUTO_2948 ) ) ( AIRPLANE-AT ?AUTO_2946 ?AUTO_2945 ) ( TRUCK-AT ?AUTO_2951 ?AUTO_2945 ) ( IN-TRUCK ?AUTO_2939 ?AUTO_2951 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2939 ?AUTO_2951 ?AUTO_2945 )
      ( DELIVER-PKG ?AUTO_2939 ?AUTO_2940 )
      ( DELIVER-PKG-VERIFY ?AUTO_2939 ?AUTO_2940 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2956 - OBJ
      ?AUTO_2957 - LOCATION
    )
    :vars
    (
      ?AUTO_2963 - LOCATION
      ?AUTO_2965 - CITY
      ?AUTO_2958 - TRUCK
      ?AUTO_2962 - LOCATION
      ?AUTO_2959 - CITY
      ?AUTO_2967 - LOCATION
      ?AUTO_2964 - AIRPLANE
      ?AUTO_2968 - LOCATION
      ?AUTO_2966 - TRUCK
      ?AUTO_2971 - LOCATION
      ?AUTO_2970 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2963 ?AUTO_2965 ) ( IN-CITY ?AUTO_2957 ?AUTO_2965 ) ( not ( = ?AUTO_2957 ?AUTO_2963 ) ) ( TRUCK-AT ?AUTO_2958 ?AUTO_2962 ) ( IN-CITY ?AUTO_2962 ?AUTO_2959 ) ( IN-CITY ?AUTO_2963 ?AUTO_2959 ) ( not ( = ?AUTO_2963 ?AUTO_2962 ) ) ( AIRPORT ?AUTO_2967 ) ( AIRPORT ?AUTO_2963 ) ( AIRPLANE-AT ?AUTO_2964 ?AUTO_2967 ) ( not ( = ?AUTO_2967 ?AUTO_2963 ) ) ( AIRPLANE-AT ?AUTO_2964 ?AUTO_2968 ) ( IN-TRUCK ?AUTO_2956 ?AUTO_2966 ) ( TRUCK-AT ?AUTO_2966 ?AUTO_2971 ) ( IN-CITY ?AUTO_2971 ?AUTO_2970 ) ( IN-CITY ?AUTO_2968 ?AUTO_2970 ) ( not ( = ?AUTO_2968 ?AUTO_2971 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2966 ?AUTO_2971 ?AUTO_2968 ?AUTO_2970 )
      ( DELIVER-PKG ?AUTO_2956 ?AUTO_2957 )
      ( DELIVER-PKG-VERIFY ?AUTO_2956 ?AUTO_2957 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2973 - OBJ
      ?AUTO_2974 - LOCATION
    )
    :vars
    (
      ?AUTO_2977 - LOCATION
      ?AUTO_2982 - CITY
      ?AUTO_2978 - TRUCK
      ?AUTO_2984 - LOCATION
      ?AUTO_2980 - CITY
      ?AUTO_2981 - LOCATION
      ?AUTO_2985 - AIRPLANE
      ?AUTO_2979 - LOCATION
      ?AUTO_2983 - TRUCK
      ?AUTO_2987 - LOCATION
      ?AUTO_2986 - CITY
      ?AUTO_2989 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2977 ?AUTO_2982 ) ( IN-CITY ?AUTO_2974 ?AUTO_2982 ) ( not ( = ?AUTO_2974 ?AUTO_2977 ) ) ( TRUCK-AT ?AUTO_2978 ?AUTO_2984 ) ( IN-CITY ?AUTO_2984 ?AUTO_2980 ) ( IN-CITY ?AUTO_2977 ?AUTO_2980 ) ( not ( = ?AUTO_2977 ?AUTO_2984 ) ) ( AIRPORT ?AUTO_2981 ) ( AIRPORT ?AUTO_2977 ) ( AIRPLANE-AT ?AUTO_2985 ?AUTO_2981 ) ( not ( = ?AUTO_2981 ?AUTO_2977 ) ) ( AIRPLANE-AT ?AUTO_2985 ?AUTO_2979 ) ( TRUCK-AT ?AUTO_2983 ?AUTO_2987 ) ( IN-CITY ?AUTO_2987 ?AUTO_2986 ) ( IN-CITY ?AUTO_2979 ?AUTO_2986 ) ( not ( = ?AUTO_2979 ?AUTO_2987 ) ) ( TRUCK-AT ?AUTO_2983 ?AUTO_2989 ) ( OBJ-AT ?AUTO_2973 ?AUTO_2989 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2973 ?AUTO_2983 ?AUTO_2989 )
      ( DELIVER-PKG ?AUTO_2973 ?AUTO_2974 )
      ( DELIVER-PKG-VERIFY ?AUTO_2973 ?AUTO_2974 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2993 - OBJ
      ?AUTO_2994 - LOCATION
    )
    :vars
    (
      ?AUTO_2998 - LOCATION
      ?AUTO_3002 - CITY
      ?AUTO_3000 - TRUCK
      ?AUTO_3008 - LOCATION
      ?AUTO_3004 - CITY
      ?AUTO_3005 - LOCATION
      ?AUTO_3007 - AIRPLANE
      ?AUTO_3003 - LOCATION
      ?AUTO_2997 - LOCATION
      ?AUTO_2996 - CITY
      ?AUTO_3006 - TRUCK
      ?AUTO_3011 - LOCATION
      ?AUTO_3010 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2998 ?AUTO_3002 ) ( IN-CITY ?AUTO_2994 ?AUTO_3002 ) ( not ( = ?AUTO_2994 ?AUTO_2998 ) ) ( TRUCK-AT ?AUTO_3000 ?AUTO_3008 ) ( IN-CITY ?AUTO_3008 ?AUTO_3004 ) ( IN-CITY ?AUTO_2998 ?AUTO_3004 ) ( not ( = ?AUTO_2998 ?AUTO_3008 ) ) ( AIRPORT ?AUTO_3005 ) ( AIRPORT ?AUTO_2998 ) ( AIRPLANE-AT ?AUTO_3007 ?AUTO_3005 ) ( not ( = ?AUTO_3005 ?AUTO_2998 ) ) ( AIRPLANE-AT ?AUTO_3007 ?AUTO_3003 ) ( IN-CITY ?AUTO_2997 ?AUTO_2996 ) ( IN-CITY ?AUTO_3003 ?AUTO_2996 ) ( not ( = ?AUTO_3003 ?AUTO_2997 ) ) ( OBJ-AT ?AUTO_2993 ?AUTO_2997 ) ( TRUCK-AT ?AUTO_3006 ?AUTO_3011 ) ( IN-CITY ?AUTO_3011 ?AUTO_3010 ) ( IN-CITY ?AUTO_2997 ?AUTO_3010 ) ( not ( = ?AUTO_2997 ?AUTO_3011 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3006 ?AUTO_3011 ?AUTO_2997 ?AUTO_3010 )
      ( DELIVER-PKG ?AUTO_2993 ?AUTO_2994 )
      ( DELIVER-PKG-VERIFY ?AUTO_2993 ?AUTO_2994 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3015 - OBJ
      ?AUTO_3016 - LOCATION
    )
    :vars
    (
      ?AUTO_3020 - LOCATION
      ?AUTO_3017 - CITY
      ?AUTO_3023 - TRUCK
      ?AUTO_3028 - LOCATION
      ?AUTO_3027 - CITY
      ?AUTO_3030 - LOCATION
      ?AUTO_3019 - LOCATION
      ?AUTO_3022 - CITY
      ?AUTO_3026 - TRUCK
      ?AUTO_3029 - LOCATION
      ?AUTO_3025 - CITY
      ?AUTO_3033 - LOCATION
      ?AUTO_3018 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3020 ?AUTO_3017 ) ( IN-CITY ?AUTO_3016 ?AUTO_3017 ) ( not ( = ?AUTO_3016 ?AUTO_3020 ) ) ( TRUCK-AT ?AUTO_3023 ?AUTO_3028 ) ( IN-CITY ?AUTO_3028 ?AUTO_3027 ) ( IN-CITY ?AUTO_3020 ?AUTO_3027 ) ( not ( = ?AUTO_3020 ?AUTO_3028 ) ) ( AIRPORT ?AUTO_3030 ) ( AIRPORT ?AUTO_3020 ) ( not ( = ?AUTO_3030 ?AUTO_3020 ) ) ( IN-CITY ?AUTO_3019 ?AUTO_3022 ) ( IN-CITY ?AUTO_3030 ?AUTO_3022 ) ( not ( = ?AUTO_3030 ?AUTO_3019 ) ) ( OBJ-AT ?AUTO_3015 ?AUTO_3019 ) ( TRUCK-AT ?AUTO_3026 ?AUTO_3029 ) ( IN-CITY ?AUTO_3029 ?AUTO_3025 ) ( IN-CITY ?AUTO_3019 ?AUTO_3025 ) ( not ( = ?AUTO_3019 ?AUTO_3029 ) ) ( AIRPORT ?AUTO_3033 ) ( AIRPLANE-AT ?AUTO_3018 ?AUTO_3033 ) ( not ( = ?AUTO_3033 ?AUTO_3030 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3018 ?AUTO_3033 ?AUTO_3030 )
      ( DELIVER-PKG ?AUTO_3015 ?AUTO_3016 )
      ( DELIVER-PKG-VERIFY ?AUTO_3015 ?AUTO_3016 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3087 - OBJ
      ?AUTO_3088 - LOCATION
    )
    :vars
    (
      ?AUTO_3089 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3089 ?AUTO_3088 ) ( IN-TRUCK ?AUTO_3087 ?AUTO_3089 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3087 ?AUTO_3089 ?AUTO_3088 )
      ( DELIVER-PKG-VERIFY ?AUTO_3087 ?AUTO_3088 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3092 - OBJ
      ?AUTO_3093 - LOCATION
    )
    :vars
    (
      ?AUTO_3096 - TRUCK
      ?AUTO_3099 - LOCATION
      ?AUTO_3098 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3092 ?AUTO_3096 ) ( TRUCK-AT ?AUTO_3096 ?AUTO_3099 ) ( IN-CITY ?AUTO_3099 ?AUTO_3098 ) ( IN-CITY ?AUTO_3093 ?AUTO_3098 ) ( not ( = ?AUTO_3093 ?AUTO_3099 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3096 ?AUTO_3099 ?AUTO_3093 ?AUTO_3098 )
      ( DELIVER-PKG ?AUTO_3092 ?AUTO_3093 )
      ( DELIVER-PKG-VERIFY ?AUTO_3092 ?AUTO_3093 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3203 - OBJ
      ?AUTO_3204 - LOCATION
    )
    :vars
    (
      ?AUTO_3205 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3205 ?AUTO_3204 ) ( IN-TRUCK ?AUTO_3203 ?AUTO_3205 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3203 ?AUTO_3205 ?AUTO_3204 )
      ( DELIVER-PKG-VERIFY ?AUTO_3203 ?AUTO_3204 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3216 - OBJ
      ?AUTO_3217 - LOCATION
    )
    :vars
    (
      ?AUTO_3220 - TRUCK
      ?AUTO_3221 - LOCATION
      ?AUTO_3219 - CITY
      ?AUTO_3224 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3220 ?AUTO_3221 ) ( IN-CITY ?AUTO_3221 ?AUTO_3219 ) ( IN-CITY ?AUTO_3217 ?AUTO_3219 ) ( not ( = ?AUTO_3217 ?AUTO_3221 ) ) ( TRUCK-AT ?AUTO_3220 ?AUTO_3224 ) ( OBJ-AT ?AUTO_3216 ?AUTO_3224 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3216 ?AUTO_3220 ?AUTO_3224 )
      ( DELIVER-PKG ?AUTO_3216 ?AUTO_3217 )
      ( DELIVER-PKG-VERIFY ?AUTO_3216 ?AUTO_3217 ) )
  )

)

