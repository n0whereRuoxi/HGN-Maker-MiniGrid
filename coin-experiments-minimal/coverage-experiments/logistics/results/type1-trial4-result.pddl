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
      ?AUTO_15 - LOCATION
      ?AUTO_13 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7 ?AUTO_11 ) ( TRUCK-AT ?AUTO_11 ?AUTO_15 ) ( IN-CITY ?AUTO_15 ?AUTO_13 ) ( IN-CITY ?AUTO_8 ?AUTO_13 ) ( not ( = ?AUTO_8 ?AUTO_15 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11 ?AUTO_15 ?AUTO_8 ?AUTO_13 )
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
      ?AUTO_37 - LOCATION
      ?AUTO_35 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_28 ?AUTO_31 ) ( IN-CITY ?AUTO_27 ?AUTO_31 ) ( not ( = ?AUTO_27 ?AUTO_28 ) ) ( OBJ-AT ?AUTO_26 ?AUTO_28 ) ( TRUCK-AT ?AUTO_32 ?AUTO_37 ) ( IN-CITY ?AUTO_37 ?AUTO_35 ) ( IN-CITY ?AUTO_28 ?AUTO_35 ) ( not ( = ?AUTO_28 ?AUTO_37 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_32 ?AUTO_37 ?AUTO_28 ?AUTO_35 )
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
      ?AUTO_56 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_49 ?AUTO_53 ) ( AIRPORT ?AUTO_56 ) ( AIRPORT ?AUTO_50 ) ( AIRPLANE-AT ?AUTO_53 ?AUTO_56 ) ( not ( = ?AUTO_56 ?AUTO_50 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_53 ?AUTO_56 ?AUTO_50 )
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
      ?AUTO_62 - LOCATION
      ?AUTO_64 - AIRPLANE
      ?AUTO_66 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_62 ) ( AIRPORT ?AUTO_60 ) ( AIRPLANE-AT ?AUTO_64 ?AUTO_62 ) ( not ( = ?AUTO_62 ?AUTO_60 ) ) ( OBJ-AT ?AUTO_59 ?AUTO_66 ) ( AIRPLANE-AT ?AUTO_64 ?AUTO_66 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_59 ?AUTO_64 ?AUTO_66 )
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
      ?AUTO_77 - LOCATION
      ?AUTO_73 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_74 ) ( AIRPORT ?AUTO_69 ) ( not ( = ?AUTO_74 ?AUTO_69 ) ) ( OBJ-AT ?AUTO_68 ?AUTO_74 ) ( AIRPORT ?AUTO_77 ) ( AIRPLANE-AT ?AUTO_73 ?AUTO_77 ) ( not ( = ?AUTO_77 ?AUTO_74 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_73 ?AUTO_77 ?AUTO_74 )
      ( DELIVER-PKG ?AUTO_68 ?AUTO_69 )
      ( DELIVER-PKG-VERIFY ?AUTO_68 ?AUTO_69 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_122 - OBJ
      ?AUTO_123 - LOCATION
    )
    :vars
    (
      ?AUTO_127 - LOCATION
      ?AUTO_126 - LOCATION
      ?AUTO_125 - AIRPLANE
      ?AUTO_129 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_127 ) ( AIRPORT ?AUTO_123 ) ( not ( = ?AUTO_127 ?AUTO_123 ) ) ( AIRPORT ?AUTO_126 ) ( AIRPLANE-AT ?AUTO_125 ?AUTO_126 ) ( not ( = ?AUTO_126 ?AUTO_127 ) ) ( TRUCK-AT ?AUTO_129 ?AUTO_127 ) ( IN-TRUCK ?AUTO_122 ?AUTO_129 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_122 ?AUTO_129 ?AUTO_127 )
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
      ?AUTO_143 - LOCATION
      ?AUTO_141 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_137 ) ( AIRPORT ?AUTO_133 ) ( not ( = ?AUTO_137 ?AUTO_133 ) ) ( AIRPORT ?AUTO_138 ) ( AIRPLANE-AT ?AUTO_136 ?AUTO_138 ) ( not ( = ?AUTO_138 ?AUTO_137 ) ) ( IN-TRUCK ?AUTO_132 ?AUTO_139 ) ( TRUCK-AT ?AUTO_139 ?AUTO_143 ) ( IN-CITY ?AUTO_143 ?AUTO_141 ) ( IN-CITY ?AUTO_137 ?AUTO_141 ) ( not ( = ?AUTO_137 ?AUTO_143 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_139 ?AUTO_143 ?AUTO_137 ?AUTO_141 )
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
      ?AUTO_148 - LOCATION
      ?AUTO_152 - LOCATION
      ?AUTO_153 - AIRPLANE
      ?AUTO_151 - TRUCK
      ?AUTO_147 - LOCATION
      ?AUTO_146 - CITY
      ?AUTO_155 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_148 ) ( AIRPORT ?AUTO_145 ) ( not ( = ?AUTO_148 ?AUTO_145 ) ) ( AIRPORT ?AUTO_152 ) ( AIRPLANE-AT ?AUTO_153 ?AUTO_152 ) ( not ( = ?AUTO_152 ?AUTO_148 ) ) ( TRUCK-AT ?AUTO_151 ?AUTO_147 ) ( IN-CITY ?AUTO_147 ?AUTO_146 ) ( IN-CITY ?AUTO_148 ?AUTO_146 ) ( not ( = ?AUTO_148 ?AUTO_147 ) ) ( TRUCK-AT ?AUTO_151 ?AUTO_155 ) ( OBJ-AT ?AUTO_144 ?AUTO_155 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_144 ?AUTO_151 ?AUTO_155 )
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
      ?AUTO_160 - LOCATION
      ?AUTO_163 - AIRPLANE
      ?AUTO_167 - LOCATION
      ?AUTO_159 - CITY
      ?AUTO_166 - TRUCK
      ?AUTO_171 - LOCATION
      ?AUTO_169 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_165 ) ( AIRPORT ?AUTO_158 ) ( not ( = ?AUTO_165 ?AUTO_158 ) ) ( AIRPORT ?AUTO_160 ) ( AIRPLANE-AT ?AUTO_163 ?AUTO_160 ) ( not ( = ?AUTO_160 ?AUTO_165 ) ) ( IN-CITY ?AUTO_167 ?AUTO_159 ) ( IN-CITY ?AUTO_165 ?AUTO_159 ) ( not ( = ?AUTO_165 ?AUTO_167 ) ) ( OBJ-AT ?AUTO_157 ?AUTO_167 ) ( TRUCK-AT ?AUTO_166 ?AUTO_171 ) ( IN-CITY ?AUTO_171 ?AUTO_169 ) ( IN-CITY ?AUTO_167 ?AUTO_169 ) ( not ( = ?AUTO_167 ?AUTO_171 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_166 ?AUTO_171 ?AUTO_167 ?AUTO_169 )
      ( DELIVER-PKG ?AUTO_157 ?AUTO_158 )
      ( DELIVER-PKG-VERIFY ?AUTO_157 ?AUTO_158 ) )
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
      ?AUTO_210 - LOCATION
      ?AUTO_212 - CITY
      ?AUTO_209 - LOCATION
      ?AUTO_214 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_213 ?AUTO_210 ) ( IN-CITY ?AUTO_210 ?AUTO_212 ) ( IN-CITY ?AUTO_207 ?AUTO_212 ) ( not ( = ?AUTO_207 ?AUTO_210 ) ) ( TRUCK-AT ?AUTO_213 ?AUTO_209 ) ( IN-AIRPLANE ?AUTO_206 ?AUTO_214 ) ( AIRPLANE-AT ?AUTO_214 ?AUTO_209 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_206 ?AUTO_214 ?AUTO_209 )
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
      ?AUTO_220 - TRUCK
      ?AUTO_222 - LOCATION
      ?AUTO_221 - CITY
      ?AUTO_219 - LOCATION
      ?AUTO_225 - AIRPLANE
      ?AUTO_228 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_220 ?AUTO_222 ) ( IN-CITY ?AUTO_222 ?AUTO_221 ) ( IN-CITY ?AUTO_218 ?AUTO_221 ) ( not ( = ?AUTO_218 ?AUTO_222 ) ) ( TRUCK-AT ?AUTO_220 ?AUTO_219 ) ( IN-AIRPLANE ?AUTO_217 ?AUTO_225 ) ( AIRPORT ?AUTO_228 ) ( AIRPORT ?AUTO_219 ) ( AIRPLANE-AT ?AUTO_225 ?AUTO_228 ) ( not ( = ?AUTO_228 ?AUTO_219 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_225 ?AUTO_228 ?AUTO_219 )
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
      ?AUTO_239 - TRUCK
      ?AUTO_235 - LOCATION
      ?AUTO_234 - CITY
      ?AUTO_233 - LOCATION
      ?AUTO_236 - LOCATION
      ?AUTO_240 - AIRPLANE
      ?AUTO_242 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_239 ?AUTO_235 ) ( IN-CITY ?AUTO_235 ?AUTO_234 ) ( IN-CITY ?AUTO_232 ?AUTO_234 ) ( not ( = ?AUTO_232 ?AUTO_235 ) ) ( TRUCK-AT ?AUTO_239 ?AUTO_233 ) ( AIRPORT ?AUTO_236 ) ( AIRPORT ?AUTO_233 ) ( AIRPLANE-AT ?AUTO_240 ?AUTO_236 ) ( not ( = ?AUTO_236 ?AUTO_233 ) ) ( OBJ-AT ?AUTO_231 ?AUTO_242 ) ( AIRPLANE-AT ?AUTO_240 ?AUTO_242 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_231 ?AUTO_240 ?AUTO_242 )
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
      ?AUTO_253 - TRUCK
      ?AUTO_249 - LOCATION
      ?AUTO_246 - CITY
      ?AUTO_251 - LOCATION
      ?AUTO_254 - LOCATION
      ?AUTO_257 - LOCATION
      ?AUTO_252 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_253 ?AUTO_249 ) ( IN-CITY ?AUTO_249 ?AUTO_246 ) ( IN-CITY ?AUTO_245 ?AUTO_246 ) ( not ( = ?AUTO_245 ?AUTO_249 ) ) ( TRUCK-AT ?AUTO_253 ?AUTO_251 ) ( AIRPORT ?AUTO_254 ) ( AIRPORT ?AUTO_251 ) ( not ( = ?AUTO_254 ?AUTO_251 ) ) ( OBJ-AT ?AUTO_244 ?AUTO_254 ) ( AIRPORT ?AUTO_257 ) ( AIRPLANE-AT ?AUTO_252 ?AUTO_257 ) ( not ( = ?AUTO_257 ?AUTO_254 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_252 ?AUTO_257 ?AUTO_254 )
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
      ?AUTO_272 - LOCATION
      ?AUTO_275 - CITY
      ?AUTO_274 - LOCATION
      ?AUTO_269 - LOCATION
      ?AUTO_271 - AIRPLANE
      ?AUTO_270 - TRUCK
      ?AUTO_280 - LOCATION
      ?AUTO_278 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_272 ?AUTO_275 ) ( IN-CITY ?AUTO_267 ?AUTO_275 ) ( not ( = ?AUTO_267 ?AUTO_272 ) ) ( AIRPORT ?AUTO_274 ) ( AIRPORT ?AUTO_272 ) ( not ( = ?AUTO_274 ?AUTO_272 ) ) ( OBJ-AT ?AUTO_266 ?AUTO_274 ) ( AIRPORT ?AUTO_269 ) ( AIRPLANE-AT ?AUTO_271 ?AUTO_269 ) ( not ( = ?AUTO_269 ?AUTO_274 ) ) ( TRUCK-AT ?AUTO_270 ?AUTO_280 ) ( IN-CITY ?AUTO_280 ?AUTO_278 ) ( IN-CITY ?AUTO_272 ?AUTO_278 ) ( not ( = ?AUTO_272 ?AUTO_280 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_270 ?AUTO_280 ?AUTO_272 ?AUTO_278 )
      ( DELIVER-PKG ?AUTO_266 ?AUTO_267 )
      ( DELIVER-PKG-VERIFY ?AUTO_266 ?AUTO_267 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_327 - OBJ
      ?AUTO_328 - LOCATION
    )
    :vars
    (
      ?AUTO_332 - LOCATION
      ?AUTO_331 - CITY
      ?AUTO_330 - TRUCK
      ?AUTO_334 - LOCATION
      ?AUTO_333 - CITY
      ?AUTO_336 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_332 ?AUTO_331 ) ( IN-CITY ?AUTO_328 ?AUTO_331 ) ( not ( = ?AUTO_328 ?AUTO_332 ) ) ( TRUCK-AT ?AUTO_330 ?AUTO_334 ) ( IN-CITY ?AUTO_334 ?AUTO_333 ) ( IN-CITY ?AUTO_332 ?AUTO_333 ) ( not ( = ?AUTO_332 ?AUTO_334 ) ) ( IN-AIRPLANE ?AUTO_327 ?AUTO_336 ) ( AIRPLANE-AT ?AUTO_336 ?AUTO_332 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_327 ?AUTO_336 ?AUTO_332 )
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
      ?AUTO_344 - LOCATION
      ?AUTO_347 - CITY
      ?AUTO_345 - TRUCK
      ?AUTO_343 - LOCATION
      ?AUTO_346 - CITY
      ?AUTO_348 - AIRPLANE
      ?AUTO_351 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_344 ?AUTO_347 ) ( IN-CITY ?AUTO_340 ?AUTO_347 ) ( not ( = ?AUTO_340 ?AUTO_344 ) ) ( TRUCK-AT ?AUTO_345 ?AUTO_343 ) ( IN-CITY ?AUTO_343 ?AUTO_346 ) ( IN-CITY ?AUTO_344 ?AUTO_346 ) ( not ( = ?AUTO_344 ?AUTO_343 ) ) ( IN-AIRPLANE ?AUTO_339 ?AUTO_348 ) ( AIRPORT ?AUTO_351 ) ( AIRPORT ?AUTO_344 ) ( AIRPLANE-AT ?AUTO_348 ?AUTO_351 ) ( not ( = ?AUTO_351 ?AUTO_344 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_348 ?AUTO_351 ?AUTO_344 )
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
      ?AUTO_358 - LOCATION
      ?AUTO_363 - CITY
      ?AUTO_360 - TRUCK
      ?AUTO_361 - LOCATION
      ?AUTO_359 - CITY
      ?AUTO_366 - LOCATION
      ?AUTO_365 - AIRPLANE
      ?AUTO_368 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_358 ?AUTO_363 ) ( IN-CITY ?AUTO_357 ?AUTO_363 ) ( not ( = ?AUTO_357 ?AUTO_358 ) ) ( TRUCK-AT ?AUTO_360 ?AUTO_361 ) ( IN-CITY ?AUTO_361 ?AUTO_359 ) ( IN-CITY ?AUTO_358 ?AUTO_359 ) ( not ( = ?AUTO_358 ?AUTO_361 ) ) ( AIRPORT ?AUTO_366 ) ( AIRPORT ?AUTO_358 ) ( AIRPLANE-AT ?AUTO_365 ?AUTO_366 ) ( not ( = ?AUTO_366 ?AUTO_358 ) ) ( OBJ-AT ?AUTO_356 ?AUTO_368 ) ( AIRPLANE-AT ?AUTO_365 ?AUTO_368 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_356 ?AUTO_365 ?AUTO_368 )
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
      ?AUTO_377 - LOCATION
      ?AUTO_375 - CITY
      ?AUTO_382 - TRUCK
      ?AUTO_380 - LOCATION
      ?AUTO_378 - CITY
      ?AUTO_381 - LOCATION
      ?AUTO_386 - LOCATION
      ?AUTO_379 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_377 ?AUTO_375 ) ( IN-CITY ?AUTO_373 ?AUTO_375 ) ( not ( = ?AUTO_373 ?AUTO_377 ) ) ( TRUCK-AT ?AUTO_382 ?AUTO_380 ) ( IN-CITY ?AUTO_380 ?AUTO_378 ) ( IN-CITY ?AUTO_377 ?AUTO_378 ) ( not ( = ?AUTO_377 ?AUTO_380 ) ) ( AIRPORT ?AUTO_381 ) ( AIRPORT ?AUTO_377 ) ( not ( = ?AUTO_381 ?AUTO_377 ) ) ( OBJ-AT ?AUTO_372 ?AUTO_381 ) ( AIRPORT ?AUTO_386 ) ( AIRPLANE-AT ?AUTO_379 ?AUTO_386 ) ( not ( = ?AUTO_386 ?AUTO_381 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_379 ?AUTO_386 ?AUTO_381 )
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
      ?AUTO_395 - LOCATION
      ?AUTO_394 - CITY
      ?AUTO_391 - TRUCK
      ?AUTO_389 - LOCATION
      ?AUTO_392 - CITY
      ?AUTO_396 - LOCATION
      ?AUTO_398 - LOCATION
      ?AUTO_397 - AIRPLANE
      ?AUTO_399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_395 ?AUTO_394 ) ( IN-CITY ?AUTO_388 ?AUTO_394 ) ( not ( = ?AUTO_388 ?AUTO_395 ) ) ( TRUCK-AT ?AUTO_391 ?AUTO_389 ) ( IN-CITY ?AUTO_389 ?AUTO_392 ) ( IN-CITY ?AUTO_395 ?AUTO_392 ) ( not ( = ?AUTO_395 ?AUTO_389 ) ) ( AIRPORT ?AUTO_396 ) ( AIRPORT ?AUTO_395 ) ( not ( = ?AUTO_396 ?AUTO_395 ) ) ( AIRPORT ?AUTO_398 ) ( AIRPLANE-AT ?AUTO_397 ?AUTO_398 ) ( not ( = ?AUTO_398 ?AUTO_396 ) ) ( TRUCK-AT ?AUTO_399 ?AUTO_396 ) ( IN-TRUCK ?AUTO_387 ?AUTO_399 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_387 ?AUTO_399 ?AUTO_396 )
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
      ?AUTO_410 - LOCATION
      ?AUTO_405 - CITY
      ?AUTO_413 - TRUCK
      ?AUTO_409 - LOCATION
      ?AUTO_412 - CITY
      ?AUTO_404 - LOCATION
      ?AUTO_406 - LOCATION
      ?AUTO_407 - AIRPLANE
      ?AUTO_414 - TRUCK
      ?AUTO_418 - LOCATION
      ?AUTO_416 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_410 ?AUTO_405 ) ( IN-CITY ?AUTO_403 ?AUTO_405 ) ( not ( = ?AUTO_403 ?AUTO_410 ) ) ( TRUCK-AT ?AUTO_413 ?AUTO_409 ) ( IN-CITY ?AUTO_409 ?AUTO_412 ) ( IN-CITY ?AUTO_410 ?AUTO_412 ) ( not ( = ?AUTO_410 ?AUTO_409 ) ) ( AIRPORT ?AUTO_404 ) ( AIRPORT ?AUTO_410 ) ( not ( = ?AUTO_404 ?AUTO_410 ) ) ( AIRPORT ?AUTO_406 ) ( AIRPLANE-AT ?AUTO_407 ?AUTO_406 ) ( not ( = ?AUTO_406 ?AUTO_404 ) ) ( IN-TRUCK ?AUTO_402 ?AUTO_414 ) ( TRUCK-AT ?AUTO_414 ?AUTO_418 ) ( IN-CITY ?AUTO_418 ?AUTO_416 ) ( IN-CITY ?AUTO_404 ?AUTO_416 ) ( not ( = ?AUTO_404 ?AUTO_418 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_414 ?AUTO_418 ?AUTO_404 ?AUTO_416 )
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
      ?AUTO_430 - LOCATION
      ?AUTO_426 - CITY
      ?AUTO_433 - TRUCK
      ?AUTO_428 - LOCATION
      ?AUTO_429 - CITY
      ?AUTO_424 - LOCATION
      ?AUTO_427 - LOCATION
      ?AUTO_425 - AIRPLANE
      ?AUTO_422 - TRUCK
      ?AUTO_432 - LOCATION
      ?AUTO_431 - CITY
      ?AUTO_435 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_430 ?AUTO_426 ) ( IN-CITY ?AUTO_420 ?AUTO_426 ) ( not ( = ?AUTO_420 ?AUTO_430 ) ) ( TRUCK-AT ?AUTO_433 ?AUTO_428 ) ( IN-CITY ?AUTO_428 ?AUTO_429 ) ( IN-CITY ?AUTO_430 ?AUTO_429 ) ( not ( = ?AUTO_430 ?AUTO_428 ) ) ( AIRPORT ?AUTO_424 ) ( AIRPORT ?AUTO_430 ) ( not ( = ?AUTO_424 ?AUTO_430 ) ) ( AIRPORT ?AUTO_427 ) ( AIRPLANE-AT ?AUTO_425 ?AUTO_427 ) ( not ( = ?AUTO_427 ?AUTO_424 ) ) ( TRUCK-AT ?AUTO_422 ?AUTO_432 ) ( IN-CITY ?AUTO_432 ?AUTO_431 ) ( IN-CITY ?AUTO_424 ?AUTO_431 ) ( not ( = ?AUTO_424 ?AUTO_432 ) ) ( TRUCK-AT ?AUTO_422 ?AUTO_435 ) ( OBJ-AT ?AUTO_419 ?AUTO_435 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_419 ?AUTO_422 ?AUTO_435 )
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
      ?AUTO_443 - LOCATION
      ?AUTO_451 - CITY
      ?AUTO_445 - TRUCK
      ?AUTO_447 - LOCATION
      ?AUTO_450 - CITY
      ?AUTO_442 - LOCATION
      ?AUTO_452 - LOCATION
      ?AUTO_449 - AIRPLANE
      ?AUTO_448 - LOCATION
      ?AUTO_440 - CITY
      ?AUTO_441 - TRUCK
      ?AUTO_456 - LOCATION
      ?AUTO_454 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_443 ?AUTO_451 ) ( IN-CITY ?AUTO_438 ?AUTO_451 ) ( not ( = ?AUTO_438 ?AUTO_443 ) ) ( TRUCK-AT ?AUTO_445 ?AUTO_447 ) ( IN-CITY ?AUTO_447 ?AUTO_450 ) ( IN-CITY ?AUTO_443 ?AUTO_450 ) ( not ( = ?AUTO_443 ?AUTO_447 ) ) ( AIRPORT ?AUTO_442 ) ( AIRPORT ?AUTO_443 ) ( not ( = ?AUTO_442 ?AUTO_443 ) ) ( AIRPORT ?AUTO_452 ) ( AIRPLANE-AT ?AUTO_449 ?AUTO_452 ) ( not ( = ?AUTO_452 ?AUTO_442 ) ) ( IN-CITY ?AUTO_448 ?AUTO_440 ) ( IN-CITY ?AUTO_442 ?AUTO_440 ) ( not ( = ?AUTO_442 ?AUTO_448 ) ) ( OBJ-AT ?AUTO_437 ?AUTO_448 ) ( TRUCK-AT ?AUTO_441 ?AUTO_456 ) ( IN-CITY ?AUTO_456 ?AUTO_454 ) ( IN-CITY ?AUTO_448 ?AUTO_454 ) ( not ( = ?AUTO_448 ?AUTO_456 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_441 ?AUTO_456 ?AUTO_448 ?AUTO_454 )
      ( DELIVER-PKG ?AUTO_437 ?AUTO_438 )
      ( DELIVER-PKG-VERIFY ?AUTO_437 ?AUTO_438 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_680 - OBJ
      ?AUTO_681 - LOCATION
    )
    :vars
    (
      ?AUTO_684 - LOCATION
      ?AUTO_685 - AIRPLANE
      ?AUTO_686 - LOCATION
      ?AUTO_687 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_684 ) ( AIRPORT ?AUTO_681 ) ( AIRPLANE-AT ?AUTO_685 ?AUTO_684 ) ( not ( = ?AUTO_684 ?AUTO_681 ) ) ( AIRPLANE-AT ?AUTO_685 ?AUTO_686 ) ( TRUCK-AT ?AUTO_687 ?AUTO_686 ) ( IN-TRUCK ?AUTO_680 ?AUTO_687 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_680 ?AUTO_687 ?AUTO_686 )
      ( DELIVER-PKG ?AUTO_680 ?AUTO_681 )
      ( DELIVER-PKG-VERIFY ?AUTO_680 ?AUTO_681 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_690 - OBJ
      ?AUTO_691 - LOCATION
    )
    :vars
    (
      ?AUTO_697 - LOCATION
      ?AUTO_696 - AIRPLANE
      ?AUTO_694 - LOCATION
      ?AUTO_693 - TRUCK
      ?AUTO_701 - LOCATION
      ?AUTO_699 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_697 ) ( AIRPORT ?AUTO_691 ) ( AIRPLANE-AT ?AUTO_696 ?AUTO_697 ) ( not ( = ?AUTO_697 ?AUTO_691 ) ) ( AIRPLANE-AT ?AUTO_696 ?AUTO_694 ) ( IN-TRUCK ?AUTO_690 ?AUTO_693 ) ( TRUCK-AT ?AUTO_693 ?AUTO_701 ) ( IN-CITY ?AUTO_701 ?AUTO_699 ) ( IN-CITY ?AUTO_694 ?AUTO_699 ) ( not ( = ?AUTO_694 ?AUTO_701 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_693 ?AUTO_701 ?AUTO_694 ?AUTO_699 )
      ( DELIVER-PKG ?AUTO_690 ?AUTO_691 )
      ( DELIVER-PKG-VERIFY ?AUTO_690 ?AUTO_691 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_710 - OBJ
      ?AUTO_711 - LOCATION
    )
    :vars
    (
      ?AUTO_713 - LOCATION
      ?AUTO_715 - TRUCK
      ?AUTO_717 - LOCATION
      ?AUTO_714 - CITY
      ?AUTO_722 - LOCATION
      ?AUTO_716 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_713 ) ( AIRPORT ?AUTO_711 ) ( not ( = ?AUTO_713 ?AUTO_711 ) ) ( IN-TRUCK ?AUTO_710 ?AUTO_715 ) ( TRUCK-AT ?AUTO_715 ?AUTO_717 ) ( IN-CITY ?AUTO_717 ?AUTO_714 ) ( IN-CITY ?AUTO_713 ?AUTO_714 ) ( not ( = ?AUTO_713 ?AUTO_717 ) ) ( AIRPORT ?AUTO_722 ) ( AIRPLANE-AT ?AUTO_716 ?AUTO_722 ) ( not ( = ?AUTO_722 ?AUTO_713 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_716 ?AUTO_722 ?AUTO_713 )
      ( DELIVER-PKG ?AUTO_710 ?AUTO_711 )
      ( DELIVER-PKG-VERIFY ?AUTO_710 ?AUTO_711 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1041 - OBJ
      ?AUTO_1042 - LOCATION
    )
    :vars
    (
      ?AUTO_1046 - TRUCK
      ?AUTO_1050 - LOCATION
      ?AUTO_1045 - CITY
      ?AUTO_1048 - LOCATION
      ?AUTO_1051 - LOCATION
      ?AUTO_1047 - LOCATION
      ?AUTO_1043 - AIRPLANE
      ?AUTO_1052 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1046 ?AUTO_1050 ) ( IN-CITY ?AUTO_1050 ?AUTO_1045 ) ( IN-CITY ?AUTO_1042 ?AUTO_1045 ) ( not ( = ?AUTO_1042 ?AUTO_1050 ) ) ( TRUCK-AT ?AUTO_1046 ?AUTO_1048 ) ( AIRPORT ?AUTO_1051 ) ( AIRPORT ?AUTO_1048 ) ( not ( = ?AUTO_1051 ?AUTO_1048 ) ) ( AIRPORT ?AUTO_1047 ) ( AIRPLANE-AT ?AUTO_1043 ?AUTO_1047 ) ( not ( = ?AUTO_1047 ?AUTO_1051 ) ) ( TRUCK-AT ?AUTO_1052 ?AUTO_1051 ) ( IN-TRUCK ?AUTO_1041 ?AUTO_1052 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1041 ?AUTO_1052 ?AUTO_1051 )
      ( DELIVER-PKG ?AUTO_1041 ?AUTO_1042 )
      ( DELIVER-PKG-VERIFY ?AUTO_1041 ?AUTO_1042 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1055 - OBJ
      ?AUTO_1056 - LOCATION
    )
    :vars
    (
      ?AUTO_1060 - TRUCK
      ?AUTO_1059 - LOCATION
      ?AUTO_1062 - CITY
      ?AUTO_1064 - LOCATION
      ?AUTO_1063 - LOCATION
      ?AUTO_1065 - LOCATION
      ?AUTO_1061 - AIRPLANE
      ?AUTO_1066 - TRUCK
      ?AUTO_1070 - LOCATION
      ?AUTO_1068 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1060 ?AUTO_1059 ) ( IN-CITY ?AUTO_1059 ?AUTO_1062 ) ( IN-CITY ?AUTO_1056 ?AUTO_1062 ) ( not ( = ?AUTO_1056 ?AUTO_1059 ) ) ( TRUCK-AT ?AUTO_1060 ?AUTO_1064 ) ( AIRPORT ?AUTO_1063 ) ( AIRPORT ?AUTO_1064 ) ( not ( = ?AUTO_1063 ?AUTO_1064 ) ) ( AIRPORT ?AUTO_1065 ) ( AIRPLANE-AT ?AUTO_1061 ?AUTO_1065 ) ( not ( = ?AUTO_1065 ?AUTO_1063 ) ) ( IN-TRUCK ?AUTO_1055 ?AUTO_1066 ) ( TRUCK-AT ?AUTO_1066 ?AUTO_1070 ) ( IN-CITY ?AUTO_1070 ?AUTO_1068 ) ( IN-CITY ?AUTO_1063 ?AUTO_1068 ) ( not ( = ?AUTO_1063 ?AUTO_1070 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1066 ?AUTO_1070 ?AUTO_1063 ?AUTO_1068 )
      ( DELIVER-PKG ?AUTO_1055 ?AUTO_1056 )
      ( DELIVER-PKG-VERIFY ?AUTO_1055 ?AUTO_1056 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1081 - OBJ
      ?AUTO_1082 - LOCATION
    )
    :vars
    (
      ?AUTO_1083 - TRUCK
      ?AUTO_1089 - LOCATION
      ?AUTO_1088 - CITY
      ?AUTO_1090 - LOCATION
      ?AUTO_1094 - LOCATION
      ?AUTO_1092 - LOCATION
      ?AUTO_1085 - AIRPLANE
      ?AUTO_1091 - TRUCK
      ?AUTO_1093 - LOCATION
      ?AUTO_1087 - CITY
      ?AUTO_1096 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1083 ?AUTO_1089 ) ( IN-CITY ?AUTO_1089 ?AUTO_1088 ) ( IN-CITY ?AUTO_1082 ?AUTO_1088 ) ( not ( = ?AUTO_1082 ?AUTO_1089 ) ) ( TRUCK-AT ?AUTO_1083 ?AUTO_1090 ) ( AIRPORT ?AUTO_1094 ) ( AIRPORT ?AUTO_1090 ) ( not ( = ?AUTO_1094 ?AUTO_1090 ) ) ( AIRPORT ?AUTO_1092 ) ( AIRPLANE-AT ?AUTO_1085 ?AUTO_1092 ) ( not ( = ?AUTO_1092 ?AUTO_1094 ) ) ( TRUCK-AT ?AUTO_1091 ?AUTO_1093 ) ( IN-CITY ?AUTO_1093 ?AUTO_1087 ) ( IN-CITY ?AUTO_1094 ?AUTO_1087 ) ( not ( = ?AUTO_1094 ?AUTO_1093 ) ) ( TRUCK-AT ?AUTO_1091 ?AUTO_1096 ) ( OBJ-AT ?AUTO_1081 ?AUTO_1096 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1081 ?AUTO_1091 ?AUTO_1096 )
      ( DELIVER-PKG ?AUTO_1081 ?AUTO_1082 )
      ( DELIVER-PKG-VERIFY ?AUTO_1081 ?AUTO_1082 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1098 - OBJ
      ?AUTO_1099 - LOCATION
    )
    :vars
    (
      ?AUTO_1104 - TRUCK
      ?AUTO_1109 - LOCATION
      ?AUTO_1106 - CITY
      ?AUTO_1105 - LOCATION
      ?AUTO_1108 - LOCATION
      ?AUTO_1102 - LOCATION
      ?AUTO_1111 - AIRPLANE
      ?AUTO_1112 - LOCATION
      ?AUTO_1103 - CITY
      ?AUTO_1110 - TRUCK
      ?AUTO_1116 - LOCATION
      ?AUTO_1114 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1104 ?AUTO_1109 ) ( IN-CITY ?AUTO_1109 ?AUTO_1106 ) ( IN-CITY ?AUTO_1099 ?AUTO_1106 ) ( not ( = ?AUTO_1099 ?AUTO_1109 ) ) ( TRUCK-AT ?AUTO_1104 ?AUTO_1105 ) ( AIRPORT ?AUTO_1108 ) ( AIRPORT ?AUTO_1105 ) ( not ( = ?AUTO_1108 ?AUTO_1105 ) ) ( AIRPORT ?AUTO_1102 ) ( AIRPLANE-AT ?AUTO_1111 ?AUTO_1102 ) ( not ( = ?AUTO_1102 ?AUTO_1108 ) ) ( IN-CITY ?AUTO_1112 ?AUTO_1103 ) ( IN-CITY ?AUTO_1108 ?AUTO_1103 ) ( not ( = ?AUTO_1108 ?AUTO_1112 ) ) ( OBJ-AT ?AUTO_1098 ?AUTO_1112 ) ( TRUCK-AT ?AUTO_1110 ?AUTO_1116 ) ( IN-CITY ?AUTO_1116 ?AUTO_1114 ) ( IN-CITY ?AUTO_1112 ?AUTO_1114 ) ( not ( = ?AUTO_1112 ?AUTO_1116 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1110 ?AUTO_1116 ?AUTO_1112 ?AUTO_1114 )
      ( DELIVER-PKG ?AUTO_1098 ?AUTO_1099 )
      ( DELIVER-PKG-VERIFY ?AUTO_1098 ?AUTO_1099 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1168 - OBJ
      ?AUTO_1169 - LOCATION
    )
    :vars
    (
      ?AUTO_1170 - LOCATION
      ?AUTO_1175 - CITY
      ?AUTO_1171 - AIRPLANE
      ?AUTO_1173 - LOCATION
      ?AUTO_1176 - TRUCK
      ?AUTO_1181 - LOCATION
      ?AUTO_1179 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1170 ?AUTO_1175 ) ( IN-CITY ?AUTO_1169 ?AUTO_1175 ) ( not ( = ?AUTO_1169 ?AUTO_1170 ) ) ( IN-AIRPLANE ?AUTO_1168 ?AUTO_1171 ) ( AIRPORT ?AUTO_1173 ) ( AIRPORT ?AUTO_1170 ) ( AIRPLANE-AT ?AUTO_1171 ?AUTO_1173 ) ( not ( = ?AUTO_1173 ?AUTO_1170 ) ) ( TRUCK-AT ?AUTO_1176 ?AUTO_1181 ) ( IN-CITY ?AUTO_1181 ?AUTO_1179 ) ( IN-CITY ?AUTO_1170 ?AUTO_1179 ) ( not ( = ?AUTO_1170 ?AUTO_1181 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1176 ?AUTO_1181 ?AUTO_1170 ?AUTO_1179 )
      ( DELIVER-PKG ?AUTO_1168 ?AUTO_1169 )
      ( DELIVER-PKG-VERIFY ?AUTO_1168 ?AUTO_1169 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1604 - OBJ
      ?AUTO_1605 - LOCATION
    )
    :vars
    (
      ?AUTO_1611 - LOCATION
      ?AUTO_1609 - AIRPLANE
      ?AUTO_1612 - LOCATION
      ?AUTO_1610 - TRUCK
      ?AUTO_1613 - LOCATION
      ?AUTO_1606 - CITY
      ?AUTO_1615 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1611 ) ( AIRPORT ?AUTO_1605 ) ( AIRPLANE-AT ?AUTO_1609 ?AUTO_1611 ) ( not ( = ?AUTO_1611 ?AUTO_1605 ) ) ( AIRPLANE-AT ?AUTO_1609 ?AUTO_1612 ) ( TRUCK-AT ?AUTO_1610 ?AUTO_1613 ) ( IN-CITY ?AUTO_1613 ?AUTO_1606 ) ( IN-CITY ?AUTO_1612 ?AUTO_1606 ) ( not ( = ?AUTO_1612 ?AUTO_1613 ) ) ( TRUCK-AT ?AUTO_1610 ?AUTO_1615 ) ( OBJ-AT ?AUTO_1604 ?AUTO_1615 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1604 ?AUTO_1610 ?AUTO_1615 )
      ( DELIVER-PKG ?AUTO_1604 ?AUTO_1605 )
      ( DELIVER-PKG-VERIFY ?AUTO_1604 ?AUTO_1605 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1617 - OBJ
      ?AUTO_1618 - LOCATION
    )
    :vars
    (
      ?AUTO_1621 - LOCATION
      ?AUTO_1627 - AIRPLANE
      ?AUTO_1625 - LOCATION
      ?AUTO_1622 - LOCATION
      ?AUTO_1624 - CITY
      ?AUTO_1626 - TRUCK
      ?AUTO_1631 - LOCATION
      ?AUTO_1629 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1621 ) ( AIRPORT ?AUTO_1618 ) ( AIRPLANE-AT ?AUTO_1627 ?AUTO_1621 ) ( not ( = ?AUTO_1621 ?AUTO_1618 ) ) ( AIRPLANE-AT ?AUTO_1627 ?AUTO_1625 ) ( IN-CITY ?AUTO_1622 ?AUTO_1624 ) ( IN-CITY ?AUTO_1625 ?AUTO_1624 ) ( not ( = ?AUTO_1625 ?AUTO_1622 ) ) ( OBJ-AT ?AUTO_1617 ?AUTO_1622 ) ( TRUCK-AT ?AUTO_1626 ?AUTO_1631 ) ( IN-CITY ?AUTO_1631 ?AUTO_1629 ) ( IN-CITY ?AUTO_1622 ?AUTO_1629 ) ( not ( = ?AUTO_1622 ?AUTO_1631 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1626 ?AUTO_1631 ?AUTO_1622 ?AUTO_1629 )
      ( DELIVER-PKG ?AUTO_1617 ?AUTO_1618 )
      ( DELIVER-PKG-VERIFY ?AUTO_1617 ?AUTO_1618 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1646 - OBJ
      ?AUTO_1647 - LOCATION
    )
    :vars
    (
      ?AUTO_1653 - LOCATION
      ?AUTO_1656 - LOCATION
      ?AUTO_1652 - CITY
      ?AUTO_1650 - TRUCK
      ?AUTO_1654 - LOCATION
      ?AUTO_1657 - CITY
      ?AUTO_1660 - LOCATION
      ?AUTO_1651 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1653 ) ( AIRPORT ?AUTO_1647 ) ( not ( = ?AUTO_1653 ?AUTO_1647 ) ) ( IN-CITY ?AUTO_1656 ?AUTO_1652 ) ( IN-CITY ?AUTO_1653 ?AUTO_1652 ) ( not ( = ?AUTO_1653 ?AUTO_1656 ) ) ( OBJ-AT ?AUTO_1646 ?AUTO_1656 ) ( TRUCK-AT ?AUTO_1650 ?AUTO_1654 ) ( IN-CITY ?AUTO_1654 ?AUTO_1657 ) ( IN-CITY ?AUTO_1656 ?AUTO_1657 ) ( not ( = ?AUTO_1656 ?AUTO_1654 ) ) ( AIRPORT ?AUTO_1660 ) ( AIRPLANE-AT ?AUTO_1651 ?AUTO_1660 ) ( not ( = ?AUTO_1660 ?AUTO_1653 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1651 ?AUTO_1660 ?AUTO_1653 )
      ( DELIVER-PKG ?AUTO_1646 ?AUTO_1647 )
      ( DELIVER-PKG-VERIFY ?AUTO_1646 ?AUTO_1647 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2473 - OBJ
      ?AUTO_2474 - LOCATION
    )
    :vars
    (
      ?AUTO_2482 - LOCATION
      ?AUTO_2481 - LOCATION
      ?AUTO_2479 - TRUCK
      ?AUTO_2477 - LOCATION
      ?AUTO_2476 - CITY
      ?AUTO_2485 - LOCATION
      ?AUTO_2475 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2482 ) ( AIRPORT ?AUTO_2474 ) ( not ( = ?AUTO_2482 ?AUTO_2474 ) ) ( AIRPORT ?AUTO_2481 ) ( not ( = ?AUTO_2481 ?AUTO_2482 ) ) ( IN-TRUCK ?AUTO_2473 ?AUTO_2479 ) ( TRUCK-AT ?AUTO_2479 ?AUTO_2477 ) ( IN-CITY ?AUTO_2477 ?AUTO_2476 ) ( IN-CITY ?AUTO_2482 ?AUTO_2476 ) ( not ( = ?AUTO_2482 ?AUTO_2477 ) ) ( AIRPORT ?AUTO_2485 ) ( AIRPLANE-AT ?AUTO_2475 ?AUTO_2485 ) ( not ( = ?AUTO_2485 ?AUTO_2481 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2475 ?AUTO_2485 ?AUTO_2481 )
      ( DELIVER-PKG ?AUTO_2473 ?AUTO_2474 )
      ( DELIVER-PKG-VERIFY ?AUTO_2473 ?AUTO_2474 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2518 - OBJ
      ?AUTO_2519 - LOCATION
    )
    :vars
    (
      ?AUTO_2521 - LOCATION
      ?AUTO_2525 - LOCATION
      ?AUTO_2526 - TRUCK
      ?AUTO_2524 - LOCATION
      ?AUTO_2523 - CITY
      ?AUTO_2528 - LOCATION
      ?AUTO_2520 - AIRPLANE
      ?AUTO_2530 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2521 ) ( AIRPORT ?AUTO_2519 ) ( not ( = ?AUTO_2521 ?AUTO_2519 ) ) ( AIRPORT ?AUTO_2525 ) ( not ( = ?AUTO_2525 ?AUTO_2521 ) ) ( TRUCK-AT ?AUTO_2526 ?AUTO_2524 ) ( IN-CITY ?AUTO_2524 ?AUTO_2523 ) ( IN-CITY ?AUTO_2521 ?AUTO_2523 ) ( not ( = ?AUTO_2521 ?AUTO_2524 ) ) ( AIRPORT ?AUTO_2528 ) ( AIRPLANE-AT ?AUTO_2520 ?AUTO_2528 ) ( not ( = ?AUTO_2528 ?AUTO_2525 ) ) ( TRUCK-AT ?AUTO_2526 ?AUTO_2530 ) ( OBJ-AT ?AUTO_2518 ?AUTO_2530 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2518 ?AUTO_2526 ?AUTO_2530 )
      ( DELIVER-PKG ?AUTO_2518 ?AUTO_2519 )
      ( DELIVER-PKG-VERIFY ?AUTO_2518 ?AUTO_2519 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2532 - OBJ
      ?AUTO_2533 - LOCATION
    )
    :vars
    (
      ?AUTO_2539 - LOCATION
      ?AUTO_2536 - LOCATION
      ?AUTO_2541 - LOCATION
      ?AUTO_2538 - CITY
      ?AUTO_2540 - LOCATION
      ?AUTO_2543 - AIRPLANE
      ?AUTO_2537 - TRUCK
      ?AUTO_2547 - LOCATION
      ?AUTO_2545 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2539 ) ( AIRPORT ?AUTO_2533 ) ( not ( = ?AUTO_2539 ?AUTO_2533 ) ) ( AIRPORT ?AUTO_2536 ) ( not ( = ?AUTO_2536 ?AUTO_2539 ) ) ( IN-CITY ?AUTO_2541 ?AUTO_2538 ) ( IN-CITY ?AUTO_2539 ?AUTO_2538 ) ( not ( = ?AUTO_2539 ?AUTO_2541 ) ) ( AIRPORT ?AUTO_2540 ) ( AIRPLANE-AT ?AUTO_2543 ?AUTO_2540 ) ( not ( = ?AUTO_2540 ?AUTO_2536 ) ) ( OBJ-AT ?AUTO_2532 ?AUTO_2541 ) ( TRUCK-AT ?AUTO_2537 ?AUTO_2547 ) ( IN-CITY ?AUTO_2547 ?AUTO_2545 ) ( IN-CITY ?AUTO_2541 ?AUTO_2545 ) ( not ( = ?AUTO_2541 ?AUTO_2547 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2537 ?AUTO_2547 ?AUTO_2541 ?AUTO_2545 )
      ( DELIVER-PKG ?AUTO_2532 ?AUTO_2533 )
      ( DELIVER-PKG-VERIFY ?AUTO_2532 ?AUTO_2533 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3119 - OBJ
      ?AUTO_3120 - LOCATION
    )
    :vars
    (
      ?AUTO_3124 - TRUCK
      ?AUTO_3126 - LOCATION
      ?AUTO_3129 - CITY
      ?AUTO_3128 - LOCATION
      ?AUTO_3127 - LOCATION
      ?AUTO_3123 - LOCATION
      ?AUTO_3131 - TRUCK
      ?AUTO_3125 - LOCATION
      ?AUTO_3121 - CITY
      ?AUTO_3135 - LOCATION
      ?AUTO_3130 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3124 ?AUTO_3126 ) ( IN-CITY ?AUTO_3126 ?AUTO_3129 ) ( IN-CITY ?AUTO_3120 ?AUTO_3129 ) ( not ( = ?AUTO_3120 ?AUTO_3126 ) ) ( TRUCK-AT ?AUTO_3124 ?AUTO_3128 ) ( AIRPORT ?AUTO_3127 ) ( AIRPORT ?AUTO_3128 ) ( not ( = ?AUTO_3127 ?AUTO_3128 ) ) ( AIRPORT ?AUTO_3123 ) ( not ( = ?AUTO_3123 ?AUTO_3127 ) ) ( IN-TRUCK ?AUTO_3119 ?AUTO_3131 ) ( TRUCK-AT ?AUTO_3131 ?AUTO_3125 ) ( IN-CITY ?AUTO_3125 ?AUTO_3121 ) ( IN-CITY ?AUTO_3127 ?AUTO_3121 ) ( not ( = ?AUTO_3127 ?AUTO_3125 ) ) ( AIRPORT ?AUTO_3135 ) ( AIRPLANE-AT ?AUTO_3130 ?AUTO_3135 ) ( not ( = ?AUTO_3135 ?AUTO_3123 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3130 ?AUTO_3135 ?AUTO_3123 )
      ( DELIVER-PKG ?AUTO_3119 ?AUTO_3120 )
      ( DELIVER-PKG-VERIFY ?AUTO_3119 ?AUTO_3120 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3158 - OBJ
      ?AUTO_3159 - LOCATION
    )
    :vars
    (
      ?AUTO_3170 - LOCATION
      ?AUTO_3160 - CITY
      ?AUTO_3163 - LOCATION
      ?AUTO_3169 - LOCATION
      ?AUTO_3168 - TRUCK
      ?AUTO_3161 - LOCATION
      ?AUTO_3165 - CITY
      ?AUTO_3162 - LOCATION
      ?AUTO_3171 - AIRPLANE
      ?AUTO_3172 - TRUCK
      ?AUTO_3176 - LOCATION
      ?AUTO_3174 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3170 ?AUTO_3160 ) ( IN-CITY ?AUTO_3159 ?AUTO_3160 ) ( not ( = ?AUTO_3159 ?AUTO_3170 ) ) ( AIRPORT ?AUTO_3163 ) ( AIRPORT ?AUTO_3170 ) ( not ( = ?AUTO_3163 ?AUTO_3170 ) ) ( AIRPORT ?AUTO_3169 ) ( not ( = ?AUTO_3169 ?AUTO_3163 ) ) ( IN-TRUCK ?AUTO_3158 ?AUTO_3168 ) ( TRUCK-AT ?AUTO_3168 ?AUTO_3161 ) ( IN-CITY ?AUTO_3161 ?AUTO_3165 ) ( IN-CITY ?AUTO_3163 ?AUTO_3165 ) ( not ( = ?AUTO_3163 ?AUTO_3161 ) ) ( AIRPORT ?AUTO_3162 ) ( AIRPLANE-AT ?AUTO_3171 ?AUTO_3162 ) ( not ( = ?AUTO_3162 ?AUTO_3169 ) ) ( TRUCK-AT ?AUTO_3172 ?AUTO_3176 ) ( IN-CITY ?AUTO_3176 ?AUTO_3174 ) ( IN-CITY ?AUTO_3170 ?AUTO_3174 ) ( not ( = ?AUTO_3170 ?AUTO_3176 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3172 ?AUTO_3176 ?AUTO_3170 ?AUTO_3174 )
      ( DELIVER-PKG ?AUTO_3158 ?AUTO_3159 )
      ( DELIVER-PKG-VERIFY ?AUTO_3158 ?AUTO_3159 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3185 - OBJ
      ?AUTO_3186 - LOCATION
    )
    :vars
    (
      ?AUTO_3197 - LOCATION
      ?AUTO_3187 - CITY
      ?AUTO_3191 - LOCATION
      ?AUTO_3198 - LOCATION
      ?AUTO_3189 - TRUCK
      ?AUTO_3199 - LOCATION
      ?AUTO_3192 - CITY
      ?AUTO_3193 - LOCATION
      ?AUTO_3196 - AIRPLANE
      ?AUTO_3194 - TRUCK
      ?AUTO_3195 - LOCATION
      ?AUTO_3188 - CITY
      ?AUTO_3202 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3197 ?AUTO_3187 ) ( IN-CITY ?AUTO_3186 ?AUTO_3187 ) ( not ( = ?AUTO_3186 ?AUTO_3197 ) ) ( AIRPORT ?AUTO_3191 ) ( AIRPORT ?AUTO_3197 ) ( not ( = ?AUTO_3191 ?AUTO_3197 ) ) ( AIRPORT ?AUTO_3198 ) ( not ( = ?AUTO_3198 ?AUTO_3191 ) ) ( TRUCK-AT ?AUTO_3189 ?AUTO_3199 ) ( IN-CITY ?AUTO_3199 ?AUTO_3192 ) ( IN-CITY ?AUTO_3191 ?AUTO_3192 ) ( not ( = ?AUTO_3191 ?AUTO_3199 ) ) ( AIRPORT ?AUTO_3193 ) ( AIRPLANE-AT ?AUTO_3196 ?AUTO_3193 ) ( not ( = ?AUTO_3193 ?AUTO_3198 ) ) ( TRUCK-AT ?AUTO_3194 ?AUTO_3195 ) ( IN-CITY ?AUTO_3195 ?AUTO_3188 ) ( IN-CITY ?AUTO_3197 ?AUTO_3188 ) ( not ( = ?AUTO_3197 ?AUTO_3195 ) ) ( TRUCK-AT ?AUTO_3189 ?AUTO_3202 ) ( OBJ-AT ?AUTO_3185 ?AUTO_3202 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3185 ?AUTO_3189 ?AUTO_3202 )
      ( DELIVER-PKG ?AUTO_3185 ?AUTO_3186 )
      ( DELIVER-PKG-VERIFY ?AUTO_3185 ?AUTO_3186 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3204 - OBJ
      ?AUTO_3205 - LOCATION
    )
    :vars
    (
      ?AUTO_3210 - LOCATION
      ?AUTO_3212 - CITY
      ?AUTO_3214 - LOCATION
      ?AUTO_3209 - LOCATION
      ?AUTO_3213 - LOCATION
      ?AUTO_3220 - CITY
      ?AUTO_3208 - LOCATION
      ?AUTO_3219 - AIRPLANE
      ?AUTO_3216 - TRUCK
      ?AUTO_3206 - LOCATION
      ?AUTO_3218 - CITY
      ?AUTO_3211 - TRUCK
      ?AUTO_3224 - LOCATION
      ?AUTO_3222 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3210 ?AUTO_3212 ) ( IN-CITY ?AUTO_3205 ?AUTO_3212 ) ( not ( = ?AUTO_3205 ?AUTO_3210 ) ) ( AIRPORT ?AUTO_3214 ) ( AIRPORT ?AUTO_3210 ) ( not ( = ?AUTO_3214 ?AUTO_3210 ) ) ( AIRPORT ?AUTO_3209 ) ( not ( = ?AUTO_3209 ?AUTO_3214 ) ) ( IN-CITY ?AUTO_3213 ?AUTO_3220 ) ( IN-CITY ?AUTO_3214 ?AUTO_3220 ) ( not ( = ?AUTO_3214 ?AUTO_3213 ) ) ( AIRPORT ?AUTO_3208 ) ( AIRPLANE-AT ?AUTO_3219 ?AUTO_3208 ) ( not ( = ?AUTO_3208 ?AUTO_3209 ) ) ( TRUCK-AT ?AUTO_3216 ?AUTO_3206 ) ( IN-CITY ?AUTO_3206 ?AUTO_3218 ) ( IN-CITY ?AUTO_3210 ?AUTO_3218 ) ( not ( = ?AUTO_3210 ?AUTO_3206 ) ) ( OBJ-AT ?AUTO_3204 ?AUTO_3213 ) ( TRUCK-AT ?AUTO_3211 ?AUTO_3224 ) ( IN-CITY ?AUTO_3224 ?AUTO_3222 ) ( IN-CITY ?AUTO_3213 ?AUTO_3222 ) ( not ( = ?AUTO_3213 ?AUTO_3224 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3211 ?AUTO_3224 ?AUTO_3213 ?AUTO_3222 )
      ( DELIVER-PKG ?AUTO_3204 ?AUTO_3205 )
      ( DELIVER-PKG-VERIFY ?AUTO_3204 ?AUTO_3205 ) )
  )

)

