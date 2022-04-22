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
      ?AUTO_7 - OBJ
      ?AUTO_8 - LOCATION
    )
    :vars
    (
      ?AUTO_11 - AIRPLANE
      ?AUTO_14 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_7 ?AUTO_11 ) ( AIRPORT ?AUTO_14 ) ( AIRPORT ?AUTO_8 ) ( AIRPLANE-AT ?AUTO_11 ?AUTO_14 ) ( not ( = ?AUTO_14 ?AUTO_8 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_11 ?AUTO_14 ?AUTO_8 )
      ( DELIVER-PKG ?AUTO_7 ?AUTO_8 )
      ( DELIVER-PKG-VERIFY ?AUTO_7 ?AUTO_8 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_15 - OBJ
      ?AUTO_16 - LOCATION
    )
    :vars
    (
      ?AUTO_20 - LOCATION
      ?AUTO_19 - AIRPLANE
      ?AUTO_22 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_20 ) ( AIRPORT ?AUTO_16 ) ( AIRPLANE-AT ?AUTO_19 ?AUTO_20 ) ( not ( = ?AUTO_20 ?AUTO_16 ) ) ( OBJ-AT ?AUTO_15 ?AUTO_22 ) ( AIRPLANE-AT ?AUTO_19 ?AUTO_22 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_15 ?AUTO_19 ?AUTO_22 )
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
      ?AUTO_26 - LOCATION
      ?AUTO_33 - LOCATION
      ?AUTO_29 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_26 ) ( AIRPORT ?AUTO_25 ) ( not ( = ?AUTO_26 ?AUTO_25 ) ) ( OBJ-AT ?AUTO_24 ?AUTO_26 ) ( AIRPORT ?AUTO_33 ) ( AIRPLANE-AT ?AUTO_29 ?AUTO_33 ) ( not ( = ?AUTO_33 ?AUTO_26 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_29 ?AUTO_33 ?AUTO_26 )
      ( DELIVER-PKG ?AUTO_24 ?AUTO_25 )
      ( DELIVER-PKG-VERIFY ?AUTO_24 ?AUTO_25 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_36 - OBJ
      ?AUTO_37 - LOCATION
    )
    :vars
    (
      ?AUTO_38 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_38 ?AUTO_37 ) ( IN-TRUCK ?AUTO_36 ?AUTO_38 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_36 ?AUTO_38 ?AUTO_37 )
      ( DELIVER-PKG-VERIFY ?AUTO_36 ?AUTO_37 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_41 - OBJ
      ?AUTO_42 - LOCATION
    )
    :vars
    (
      ?AUTO_43 - TRUCK
      ?AUTO_49 - LOCATION
      ?AUTO_47 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_41 ?AUTO_43 ) ( TRUCK-AT ?AUTO_43 ?AUTO_49 ) ( IN-CITY ?AUTO_49 ?AUTO_47 ) ( IN-CITY ?AUTO_42 ?AUTO_47 ) ( not ( = ?AUTO_42 ?AUTO_49 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_43 ?AUTO_49 ?AUTO_42 ?AUTO_47 )
      ( DELIVER-PKG ?AUTO_41 ?AUTO_42 )
      ( DELIVER-PKG-VERIFY ?AUTO_41 ?AUTO_42 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_50 - OBJ
      ?AUTO_51 - LOCATION
    )
    :vars
    (
      ?AUTO_54 - TRUCK
      ?AUTO_56 - LOCATION
      ?AUTO_55 - CITY
      ?AUTO_58 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_54 ?AUTO_56 ) ( IN-CITY ?AUTO_56 ?AUTO_55 ) ( IN-CITY ?AUTO_51 ?AUTO_55 ) ( not ( = ?AUTO_51 ?AUTO_56 ) ) ( TRUCK-AT ?AUTO_54 ?AUTO_58 ) ( OBJ-AT ?AUTO_50 ?AUTO_58 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_50 ?AUTO_54 ?AUTO_58 )
      ( DELIVER-PKG ?AUTO_50 ?AUTO_51 )
      ( DELIVER-PKG-VERIFY ?AUTO_50 ?AUTO_51 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_60 - OBJ
      ?AUTO_61 - LOCATION
    )
    :vars
    (
      ?AUTO_62 - LOCATION
      ?AUTO_66 - CITY
      ?AUTO_65 - TRUCK
      ?AUTO_71 - LOCATION
      ?AUTO_69 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_62 ?AUTO_66 ) ( IN-CITY ?AUTO_61 ?AUTO_66 ) ( not ( = ?AUTO_61 ?AUTO_62 ) ) ( OBJ-AT ?AUTO_60 ?AUTO_62 ) ( TRUCK-AT ?AUTO_65 ?AUTO_71 ) ( IN-CITY ?AUTO_71 ?AUTO_69 ) ( IN-CITY ?AUTO_62 ?AUTO_69 ) ( not ( = ?AUTO_62 ?AUTO_71 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_65 ?AUTO_71 ?AUTO_62 ?AUTO_69 )
      ( DELIVER-PKG ?AUTO_60 ?AUTO_61 )
      ( DELIVER-PKG-VERIFY ?AUTO_60 ?AUTO_61 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_104 - OBJ
      ?AUTO_105 - LOCATION
    )
    :vars
    (
      ?AUTO_109 - LOCATION
      ?AUTO_108 - AIRPLANE
      ?AUTO_110 - LOCATION
      ?AUTO_111 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_109 ) ( AIRPORT ?AUTO_105 ) ( AIRPLANE-AT ?AUTO_108 ?AUTO_109 ) ( not ( = ?AUTO_109 ?AUTO_105 ) ) ( AIRPLANE-AT ?AUTO_108 ?AUTO_110 ) ( TRUCK-AT ?AUTO_111 ?AUTO_110 ) ( IN-TRUCK ?AUTO_104 ?AUTO_111 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_104 ?AUTO_111 ?AUTO_110 )
      ( DELIVER-PKG ?AUTO_104 ?AUTO_105 )
      ( DELIVER-PKG-VERIFY ?AUTO_104 ?AUTO_105 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_114 - OBJ
      ?AUTO_115 - LOCATION
    )
    :vars
    (
      ?AUTO_117 - LOCATION
      ?AUTO_120 - AIRPLANE
      ?AUTO_118 - LOCATION
      ?AUTO_119 - TRUCK
      ?AUTO_125 - LOCATION
      ?AUTO_123 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_117 ) ( AIRPORT ?AUTO_115 ) ( AIRPLANE-AT ?AUTO_120 ?AUTO_117 ) ( not ( = ?AUTO_117 ?AUTO_115 ) ) ( AIRPLANE-AT ?AUTO_120 ?AUTO_118 ) ( IN-TRUCK ?AUTO_114 ?AUTO_119 ) ( TRUCK-AT ?AUTO_119 ?AUTO_125 ) ( IN-CITY ?AUTO_125 ?AUTO_123 ) ( IN-CITY ?AUTO_118 ?AUTO_123 ) ( not ( = ?AUTO_118 ?AUTO_125 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_119 ?AUTO_125 ?AUTO_118 ?AUTO_123 )
      ( DELIVER-PKG ?AUTO_114 ?AUTO_115 )
      ( DELIVER-PKG-VERIFY ?AUTO_114 ?AUTO_115 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_126 - OBJ
      ?AUTO_127 - LOCATION
    )
    :vars
    (
      ?AUTO_130 - LOCATION
      ?AUTO_134 - AIRPLANE
      ?AUTO_132 - LOCATION
      ?AUTO_133 - TRUCK
      ?AUTO_135 - LOCATION
      ?AUTO_128 - CITY
      ?AUTO_137 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_130 ) ( AIRPORT ?AUTO_127 ) ( AIRPLANE-AT ?AUTO_134 ?AUTO_130 ) ( not ( = ?AUTO_130 ?AUTO_127 ) ) ( AIRPLANE-AT ?AUTO_134 ?AUTO_132 ) ( TRUCK-AT ?AUTO_133 ?AUTO_135 ) ( IN-CITY ?AUTO_135 ?AUTO_128 ) ( IN-CITY ?AUTO_132 ?AUTO_128 ) ( not ( = ?AUTO_132 ?AUTO_135 ) ) ( TRUCK-AT ?AUTO_133 ?AUTO_137 ) ( OBJ-AT ?AUTO_126 ?AUTO_137 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_126 ?AUTO_133 ?AUTO_137 )
      ( DELIVER-PKG ?AUTO_126 ?AUTO_127 )
      ( DELIVER-PKG-VERIFY ?AUTO_126 ?AUTO_127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_139 - OBJ
      ?AUTO_140 - LOCATION
    )
    :vars
    (
      ?AUTO_148 - LOCATION
      ?AUTO_144 - AIRPLANE
      ?AUTO_143 - LOCATION
      ?AUTO_149 - LOCATION
      ?AUTO_146 - CITY
      ?AUTO_145 - TRUCK
      ?AUTO_153 - LOCATION
      ?AUTO_151 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_148 ) ( AIRPORT ?AUTO_140 ) ( AIRPLANE-AT ?AUTO_144 ?AUTO_148 ) ( not ( = ?AUTO_148 ?AUTO_140 ) ) ( AIRPLANE-AT ?AUTO_144 ?AUTO_143 ) ( IN-CITY ?AUTO_149 ?AUTO_146 ) ( IN-CITY ?AUTO_143 ?AUTO_146 ) ( not ( = ?AUTO_143 ?AUTO_149 ) ) ( OBJ-AT ?AUTO_139 ?AUTO_149 ) ( TRUCK-AT ?AUTO_145 ?AUTO_153 ) ( IN-CITY ?AUTO_153 ?AUTO_151 ) ( IN-CITY ?AUTO_149 ?AUTO_151 ) ( not ( = ?AUTO_149 ?AUTO_153 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_145 ?AUTO_153 ?AUTO_149 ?AUTO_151 )
      ( DELIVER-PKG ?AUTO_139 ?AUTO_140 )
      ( DELIVER-PKG-VERIFY ?AUTO_139 ?AUTO_140 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_156 - OBJ
      ?AUTO_157 - LOCATION
    )
    :vars
    (
      ?AUTO_161 - LOCATION
      ?AUTO_166 - LOCATION
      ?AUTO_158 - CITY
      ?AUTO_167 - TRUCK
      ?AUTO_162 - LOCATION
      ?AUTO_160 - CITY
      ?AUTO_170 - LOCATION
      ?AUTO_165 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_161 ) ( AIRPORT ?AUTO_157 ) ( not ( = ?AUTO_161 ?AUTO_157 ) ) ( IN-CITY ?AUTO_166 ?AUTO_158 ) ( IN-CITY ?AUTO_161 ?AUTO_158 ) ( not ( = ?AUTO_161 ?AUTO_166 ) ) ( OBJ-AT ?AUTO_156 ?AUTO_166 ) ( TRUCK-AT ?AUTO_167 ?AUTO_162 ) ( IN-CITY ?AUTO_162 ?AUTO_160 ) ( IN-CITY ?AUTO_166 ?AUTO_160 ) ( not ( = ?AUTO_166 ?AUTO_162 ) ) ( AIRPORT ?AUTO_170 ) ( AIRPLANE-AT ?AUTO_165 ?AUTO_170 ) ( not ( = ?AUTO_170 ?AUTO_161 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_165 ?AUTO_170 ?AUTO_161 )
      ( DELIVER-PKG ?AUTO_156 ?AUTO_157 )
      ( DELIVER-PKG-VERIFY ?AUTO_156 ?AUTO_157 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_231 - OBJ
      ?AUTO_232 - LOCATION
    )
    :vars
    (
      ?AUTO_236 - LOCATION
      ?AUTO_239 - CITY
      ?AUTO_237 - TRUCK
      ?AUTO_235 - LOCATION
      ?AUTO_234 - CITY
      ?AUTO_240 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_236 ?AUTO_239 ) ( IN-CITY ?AUTO_232 ?AUTO_239 ) ( not ( = ?AUTO_232 ?AUTO_236 ) ) ( TRUCK-AT ?AUTO_237 ?AUTO_235 ) ( IN-CITY ?AUTO_235 ?AUTO_234 ) ( IN-CITY ?AUTO_236 ?AUTO_234 ) ( not ( = ?AUTO_236 ?AUTO_235 ) ) ( IN-AIRPLANE ?AUTO_231 ?AUTO_240 ) ( AIRPLANE-AT ?AUTO_240 ?AUTO_236 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_231 ?AUTO_240 ?AUTO_236 )
      ( DELIVER-PKG ?AUTO_231 ?AUTO_232 )
      ( DELIVER-PKG-VERIFY ?AUTO_231 ?AUTO_232 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_243 - OBJ
      ?AUTO_244 - LOCATION
    )
    :vars
    (
      ?AUTO_250 - LOCATION
      ?AUTO_246 - CITY
      ?AUTO_249 - TRUCK
      ?AUTO_251 - LOCATION
      ?AUTO_248 - CITY
      ?AUTO_252 - AIRPLANE
      ?AUTO_255 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_250 ?AUTO_246 ) ( IN-CITY ?AUTO_244 ?AUTO_246 ) ( not ( = ?AUTO_244 ?AUTO_250 ) ) ( TRUCK-AT ?AUTO_249 ?AUTO_251 ) ( IN-CITY ?AUTO_251 ?AUTO_248 ) ( IN-CITY ?AUTO_250 ?AUTO_248 ) ( not ( = ?AUTO_250 ?AUTO_251 ) ) ( IN-AIRPLANE ?AUTO_243 ?AUTO_252 ) ( AIRPORT ?AUTO_255 ) ( AIRPORT ?AUTO_250 ) ( AIRPLANE-AT ?AUTO_252 ?AUTO_255 ) ( not ( = ?AUTO_255 ?AUTO_250 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_252 ?AUTO_255 ?AUTO_250 )
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
      ?AUTO_266 - LOCATION
      ?AUTO_262 - CITY
      ?AUTO_265 - TRUCK
      ?AUTO_261 - LOCATION
      ?AUTO_263 - CITY
      ?AUTO_258 - LOCATION
      ?AUTO_264 - AIRPLANE
      ?AUTO_268 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_266 ?AUTO_262 ) ( IN-CITY ?AUTO_257 ?AUTO_262 ) ( not ( = ?AUTO_257 ?AUTO_266 ) ) ( TRUCK-AT ?AUTO_265 ?AUTO_261 ) ( IN-CITY ?AUTO_261 ?AUTO_263 ) ( IN-CITY ?AUTO_266 ?AUTO_263 ) ( not ( = ?AUTO_266 ?AUTO_261 ) ) ( AIRPORT ?AUTO_258 ) ( AIRPORT ?AUTO_266 ) ( AIRPLANE-AT ?AUTO_264 ?AUTO_258 ) ( not ( = ?AUTO_258 ?AUTO_266 ) ) ( OBJ-AT ?AUTO_256 ?AUTO_268 ) ( AIRPLANE-AT ?AUTO_264 ?AUTO_268 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_256 ?AUTO_264 ?AUTO_268 )
      ( DELIVER-PKG ?AUTO_256 ?AUTO_257 )
      ( DELIVER-PKG-VERIFY ?AUTO_256 ?AUTO_257 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_270 - OBJ
      ?AUTO_271 - LOCATION
    )
    :vars
    (
      ?AUTO_276 - LOCATION
      ?AUTO_281 - CITY
      ?AUTO_272 - TRUCK
      ?AUTO_280 - LOCATION
      ?AUTO_279 - CITY
      ?AUTO_278 - LOCATION
      ?AUTO_284 - LOCATION
      ?AUTO_273 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_276 ?AUTO_281 ) ( IN-CITY ?AUTO_271 ?AUTO_281 ) ( not ( = ?AUTO_271 ?AUTO_276 ) ) ( TRUCK-AT ?AUTO_272 ?AUTO_280 ) ( IN-CITY ?AUTO_280 ?AUTO_279 ) ( IN-CITY ?AUTO_276 ?AUTO_279 ) ( not ( = ?AUTO_276 ?AUTO_280 ) ) ( AIRPORT ?AUTO_278 ) ( AIRPORT ?AUTO_276 ) ( not ( = ?AUTO_278 ?AUTO_276 ) ) ( OBJ-AT ?AUTO_270 ?AUTO_278 ) ( AIRPORT ?AUTO_284 ) ( AIRPLANE-AT ?AUTO_273 ?AUTO_284 ) ( not ( = ?AUTO_284 ?AUTO_278 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_273 ?AUTO_284 ?AUTO_278 )
      ( DELIVER-PKG ?AUTO_270 ?AUTO_271 )
      ( DELIVER-PKG-VERIFY ?AUTO_270 ?AUTO_271 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_314 - OBJ
      ?AUTO_315 - LOCATION
    )
    :vars
    (
      ?AUTO_319 - TRUCK
      ?AUTO_321 - LOCATION
      ?AUTO_320 - CITY
      ?AUTO_317 - LOCATION
      ?AUTO_322 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_319 ?AUTO_321 ) ( IN-CITY ?AUTO_321 ?AUTO_320 ) ( IN-CITY ?AUTO_315 ?AUTO_320 ) ( not ( = ?AUTO_315 ?AUTO_321 ) ) ( TRUCK-AT ?AUTO_319 ?AUTO_317 ) ( IN-AIRPLANE ?AUTO_314 ?AUTO_322 ) ( AIRPLANE-AT ?AUTO_322 ?AUTO_317 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_314 ?AUTO_322 ?AUTO_317 )
      ( DELIVER-PKG ?AUTO_314 ?AUTO_315 )
      ( DELIVER-PKG-VERIFY ?AUTO_314 ?AUTO_315 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_325 - OBJ
      ?AUTO_326 - LOCATION
    )
    :vars
    (
      ?AUTO_332 - TRUCK
      ?AUTO_331 - LOCATION
      ?AUTO_329 - CITY
      ?AUTO_330 - LOCATION
      ?AUTO_333 - AIRPLANE
      ?AUTO_336 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_332 ?AUTO_331 ) ( IN-CITY ?AUTO_331 ?AUTO_329 ) ( IN-CITY ?AUTO_326 ?AUTO_329 ) ( not ( = ?AUTO_326 ?AUTO_331 ) ) ( TRUCK-AT ?AUTO_332 ?AUTO_330 ) ( IN-AIRPLANE ?AUTO_325 ?AUTO_333 ) ( AIRPORT ?AUTO_336 ) ( AIRPORT ?AUTO_330 ) ( AIRPLANE-AT ?AUTO_333 ?AUTO_336 ) ( not ( = ?AUTO_336 ?AUTO_330 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_333 ?AUTO_336 ?AUTO_330 )
      ( DELIVER-PKG ?AUTO_325 ?AUTO_326 )
      ( DELIVER-PKG-VERIFY ?AUTO_325 ?AUTO_326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_337 - OBJ
      ?AUTO_338 - LOCATION
    )
    :vars
    (
      ?AUTO_342 - TRUCK
      ?AUTO_340 - LOCATION
      ?AUTO_345 - CITY
      ?AUTO_344 - LOCATION
      ?AUTO_346 - LOCATION
      ?AUTO_343 - AIRPLANE
      ?AUTO_348 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_342 ?AUTO_340 ) ( IN-CITY ?AUTO_340 ?AUTO_345 ) ( IN-CITY ?AUTO_338 ?AUTO_345 ) ( not ( = ?AUTO_338 ?AUTO_340 ) ) ( TRUCK-AT ?AUTO_342 ?AUTO_344 ) ( AIRPORT ?AUTO_346 ) ( AIRPORT ?AUTO_344 ) ( AIRPLANE-AT ?AUTO_343 ?AUTO_346 ) ( not ( = ?AUTO_346 ?AUTO_344 ) ) ( OBJ-AT ?AUTO_337 ?AUTO_348 ) ( AIRPLANE-AT ?AUTO_343 ?AUTO_348 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_337 ?AUTO_343 ?AUTO_348 )
      ( DELIVER-PKG ?AUTO_337 ?AUTO_338 )
      ( DELIVER-PKG-VERIFY ?AUTO_337 ?AUTO_338 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_350 - OBJ
      ?AUTO_351 - LOCATION
    )
    :vars
    (
      ?AUTO_356 - TRUCK
      ?AUTO_355 - LOCATION
      ?AUTO_360 - CITY
      ?AUTO_359 - LOCATION
      ?AUTO_357 - LOCATION
      ?AUTO_354 - AIRPLANE
      ?AUTO_358 - LOCATION
      ?AUTO_361 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_356 ?AUTO_355 ) ( IN-CITY ?AUTO_355 ?AUTO_360 ) ( IN-CITY ?AUTO_351 ?AUTO_360 ) ( not ( = ?AUTO_351 ?AUTO_355 ) ) ( TRUCK-AT ?AUTO_356 ?AUTO_359 ) ( AIRPORT ?AUTO_357 ) ( AIRPORT ?AUTO_359 ) ( AIRPLANE-AT ?AUTO_354 ?AUTO_357 ) ( not ( = ?AUTO_357 ?AUTO_359 ) ) ( AIRPLANE-AT ?AUTO_354 ?AUTO_358 ) ( TRUCK-AT ?AUTO_361 ?AUTO_358 ) ( IN-TRUCK ?AUTO_350 ?AUTO_361 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_350 ?AUTO_361 ?AUTO_358 )
      ( DELIVER-PKG ?AUTO_350 ?AUTO_351 )
      ( DELIVER-PKG-VERIFY ?AUTO_350 ?AUTO_351 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_364 - OBJ
      ?AUTO_365 - LOCATION
    )
    :vars
    (
      ?AUTO_369 - TRUCK
      ?AUTO_370 - LOCATION
      ?AUTO_373 - CITY
      ?AUTO_367 - LOCATION
      ?AUTO_374 - LOCATION
      ?AUTO_371 - AIRPLANE
      ?AUTO_368 - LOCATION
      ?AUTO_375 - TRUCK
      ?AUTO_379 - LOCATION
      ?AUTO_377 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_369 ?AUTO_370 ) ( IN-CITY ?AUTO_370 ?AUTO_373 ) ( IN-CITY ?AUTO_365 ?AUTO_373 ) ( not ( = ?AUTO_365 ?AUTO_370 ) ) ( TRUCK-AT ?AUTO_369 ?AUTO_367 ) ( AIRPORT ?AUTO_374 ) ( AIRPORT ?AUTO_367 ) ( AIRPLANE-AT ?AUTO_371 ?AUTO_374 ) ( not ( = ?AUTO_374 ?AUTO_367 ) ) ( AIRPLANE-AT ?AUTO_371 ?AUTO_368 ) ( IN-TRUCK ?AUTO_364 ?AUTO_375 ) ( TRUCK-AT ?AUTO_375 ?AUTO_379 ) ( IN-CITY ?AUTO_379 ?AUTO_377 ) ( IN-CITY ?AUTO_368 ?AUTO_377 ) ( not ( = ?AUTO_368 ?AUTO_379 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_375 ?AUTO_379 ?AUTO_368 ?AUTO_377 )
      ( DELIVER-PKG ?AUTO_364 ?AUTO_365 )
      ( DELIVER-PKG-VERIFY ?AUTO_364 ?AUTO_365 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_380 - OBJ
      ?AUTO_381 - LOCATION
    )
    :vars
    (
      ?AUTO_382 - TRUCK
      ?AUTO_384 - LOCATION
      ?AUTO_392 - CITY
      ?AUTO_385 - LOCATION
      ?AUTO_390 - LOCATION
      ?AUTO_391 - AIRPLANE
      ?AUTO_388 - LOCATION
      ?AUTO_389 - TRUCK
      ?AUTO_386 - LOCATION
      ?AUTO_393 - CITY
      ?AUTO_395 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_382 ?AUTO_384 ) ( IN-CITY ?AUTO_384 ?AUTO_392 ) ( IN-CITY ?AUTO_381 ?AUTO_392 ) ( not ( = ?AUTO_381 ?AUTO_384 ) ) ( TRUCK-AT ?AUTO_382 ?AUTO_385 ) ( AIRPORT ?AUTO_390 ) ( AIRPORT ?AUTO_385 ) ( AIRPLANE-AT ?AUTO_391 ?AUTO_390 ) ( not ( = ?AUTO_390 ?AUTO_385 ) ) ( AIRPLANE-AT ?AUTO_391 ?AUTO_388 ) ( TRUCK-AT ?AUTO_389 ?AUTO_386 ) ( IN-CITY ?AUTO_386 ?AUTO_393 ) ( IN-CITY ?AUTO_388 ?AUTO_393 ) ( not ( = ?AUTO_388 ?AUTO_386 ) ) ( TRUCK-AT ?AUTO_389 ?AUTO_395 ) ( OBJ-AT ?AUTO_380 ?AUTO_395 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_380 ?AUTO_389 ?AUTO_395 )
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
      ?AUTO_407 - TRUCK
      ?AUTO_406 - LOCATION
      ?AUTO_404 - CITY
      ?AUTO_403 - LOCATION
      ?AUTO_402 - LOCATION
      ?AUTO_401 - AIRPLANE
      ?AUTO_411 - LOCATION
      ?AUTO_405 - LOCATION
      ?AUTO_409 - CITY
      ?AUTO_410 - TRUCK
      ?AUTO_415 - LOCATION
      ?AUTO_413 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_407 ?AUTO_406 ) ( IN-CITY ?AUTO_406 ?AUTO_404 ) ( IN-CITY ?AUTO_398 ?AUTO_404 ) ( not ( = ?AUTO_398 ?AUTO_406 ) ) ( TRUCK-AT ?AUTO_407 ?AUTO_403 ) ( AIRPORT ?AUTO_402 ) ( AIRPORT ?AUTO_403 ) ( AIRPLANE-AT ?AUTO_401 ?AUTO_402 ) ( not ( = ?AUTO_402 ?AUTO_403 ) ) ( AIRPLANE-AT ?AUTO_401 ?AUTO_411 ) ( IN-CITY ?AUTO_405 ?AUTO_409 ) ( IN-CITY ?AUTO_411 ?AUTO_409 ) ( not ( = ?AUTO_411 ?AUTO_405 ) ) ( OBJ-AT ?AUTO_397 ?AUTO_405 ) ( TRUCK-AT ?AUTO_410 ?AUTO_415 ) ( IN-CITY ?AUTO_415 ?AUTO_413 ) ( IN-CITY ?AUTO_405 ?AUTO_413 ) ( not ( = ?AUTO_405 ?AUTO_415 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_410 ?AUTO_415 ?AUTO_405 ?AUTO_413 )
      ( DELIVER-PKG ?AUTO_397 ?AUTO_398 )
      ( DELIVER-PKG-VERIFY ?AUTO_397 ?AUTO_398 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_418 - OBJ
      ?AUTO_419 - LOCATION
    )
    :vars
    (
      ?AUTO_423 - TRUCK
      ?AUTO_432 - LOCATION
      ?AUTO_425 - CITY
      ?AUTO_420 - LOCATION
      ?AUTO_430 - LOCATION
      ?AUTO_431 - LOCATION
      ?AUTO_433 - CITY
      ?AUTO_422 - TRUCK
      ?AUTO_427 - LOCATION
      ?AUTO_424 - CITY
      ?AUTO_436 - LOCATION
      ?AUTO_421 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_423 ?AUTO_432 ) ( IN-CITY ?AUTO_432 ?AUTO_425 ) ( IN-CITY ?AUTO_419 ?AUTO_425 ) ( not ( = ?AUTO_419 ?AUTO_432 ) ) ( TRUCK-AT ?AUTO_423 ?AUTO_420 ) ( AIRPORT ?AUTO_430 ) ( AIRPORT ?AUTO_420 ) ( not ( = ?AUTO_430 ?AUTO_420 ) ) ( IN-CITY ?AUTO_431 ?AUTO_433 ) ( IN-CITY ?AUTO_430 ?AUTO_433 ) ( not ( = ?AUTO_430 ?AUTO_431 ) ) ( OBJ-AT ?AUTO_418 ?AUTO_431 ) ( TRUCK-AT ?AUTO_422 ?AUTO_427 ) ( IN-CITY ?AUTO_427 ?AUTO_424 ) ( IN-CITY ?AUTO_431 ?AUTO_424 ) ( not ( = ?AUTO_431 ?AUTO_427 ) ) ( AIRPORT ?AUTO_436 ) ( AIRPLANE-AT ?AUTO_421 ?AUTO_436 ) ( not ( = ?AUTO_436 ?AUTO_430 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_421 ?AUTO_436 ?AUTO_430 )
      ( DELIVER-PKG ?AUTO_418 ?AUTO_419 )
      ( DELIVER-PKG-VERIFY ?AUTO_418 ?AUTO_419 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_731 - OBJ
      ?AUTO_732 - LOCATION
    )
    :vars
    (
      ?AUTO_735 - LOCATION
      ?AUTO_736 - LOCATION
      ?AUTO_734 - AIRPLANE
      ?AUTO_738 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_735 ) ( AIRPORT ?AUTO_732 ) ( not ( = ?AUTO_735 ?AUTO_732 ) ) ( AIRPORT ?AUTO_736 ) ( AIRPLANE-AT ?AUTO_734 ?AUTO_736 ) ( not ( = ?AUTO_736 ?AUTO_735 ) ) ( TRUCK-AT ?AUTO_738 ?AUTO_735 ) ( IN-TRUCK ?AUTO_731 ?AUTO_738 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_731 ?AUTO_738 ?AUTO_735 )
      ( DELIVER-PKG ?AUTO_731 ?AUTO_732 )
      ( DELIVER-PKG-VERIFY ?AUTO_731 ?AUTO_732 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_743 - OBJ
      ?AUTO_744 - LOCATION
    )
    :vars
    (
      ?AUTO_750 - LOCATION
      ?AUTO_749 - LOCATION
      ?AUTO_746 - AIRPLANE
      ?AUTO_748 - TRUCK
      ?AUTO_754 - LOCATION
      ?AUTO_752 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_750 ) ( AIRPORT ?AUTO_744 ) ( not ( = ?AUTO_750 ?AUTO_744 ) ) ( AIRPORT ?AUTO_749 ) ( AIRPLANE-AT ?AUTO_746 ?AUTO_749 ) ( not ( = ?AUTO_749 ?AUTO_750 ) ) ( IN-TRUCK ?AUTO_743 ?AUTO_748 ) ( TRUCK-AT ?AUTO_748 ?AUTO_754 ) ( IN-CITY ?AUTO_754 ?AUTO_752 ) ( IN-CITY ?AUTO_750 ?AUTO_752 ) ( not ( = ?AUTO_750 ?AUTO_754 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_748 ?AUTO_754 ?AUTO_750 ?AUTO_752 )
      ( DELIVER-PKG ?AUTO_743 ?AUTO_744 )
      ( DELIVER-PKG-VERIFY ?AUTO_743 ?AUTO_744 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_755 - OBJ
      ?AUTO_756 - LOCATION
    )
    :vars
    (
      ?AUTO_760 - LOCATION
      ?AUTO_758 - LOCATION
      ?AUTO_759 - AIRPLANE
      ?AUTO_763 - TRUCK
      ?AUTO_764 - LOCATION
      ?AUTO_761 - CITY
      ?AUTO_766 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_760 ) ( AIRPORT ?AUTO_756 ) ( not ( = ?AUTO_760 ?AUTO_756 ) ) ( AIRPORT ?AUTO_758 ) ( AIRPLANE-AT ?AUTO_759 ?AUTO_758 ) ( not ( = ?AUTO_758 ?AUTO_760 ) ) ( TRUCK-AT ?AUTO_763 ?AUTO_764 ) ( IN-CITY ?AUTO_764 ?AUTO_761 ) ( IN-CITY ?AUTO_760 ?AUTO_761 ) ( not ( = ?AUTO_760 ?AUTO_764 ) ) ( TRUCK-AT ?AUTO_763 ?AUTO_766 ) ( OBJ-AT ?AUTO_755 ?AUTO_766 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_755 ?AUTO_763 ?AUTO_766 )
      ( DELIVER-PKG ?AUTO_755 ?AUTO_756 )
      ( DELIVER-PKG-VERIFY ?AUTO_755 ?AUTO_756 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_933 - OBJ
      ?AUTO_934 - LOCATION
    )
    :vars
    (
      ?AUTO_938 - TRUCK
      ?AUTO_942 - LOCATION
      ?AUTO_937 - CITY
      ?AUTO_940 - LOCATION
      ?AUTO_943 - LOCATION
      ?AUTO_946 - LOCATION
      ?AUTO_939 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_938 ?AUTO_942 ) ( IN-CITY ?AUTO_942 ?AUTO_937 ) ( IN-CITY ?AUTO_934 ?AUTO_937 ) ( not ( = ?AUTO_934 ?AUTO_942 ) ) ( TRUCK-AT ?AUTO_938 ?AUTO_940 ) ( AIRPORT ?AUTO_943 ) ( AIRPORT ?AUTO_940 ) ( not ( = ?AUTO_943 ?AUTO_940 ) ) ( OBJ-AT ?AUTO_933 ?AUTO_943 ) ( AIRPORT ?AUTO_946 ) ( AIRPLANE-AT ?AUTO_939 ?AUTO_946 ) ( not ( = ?AUTO_946 ?AUTO_943 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_939 ?AUTO_946 ?AUTO_943 )
      ( DELIVER-PKG ?AUTO_933 ?AUTO_934 )
      ( DELIVER-PKG-VERIFY ?AUTO_933 ?AUTO_934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_959 - OBJ
      ?AUTO_960 - LOCATION
    )
    :vars
    (
      ?AUTO_963 - TRUCK
      ?AUTO_969 - LOCATION
      ?AUTO_964 - CITY
      ?AUTO_965 - LOCATION
      ?AUTO_967 - LOCATION
      ?AUTO_968 - LOCATION
      ?AUTO_962 - AIRPLANE
      ?AUTO_970 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_963 ?AUTO_969 ) ( IN-CITY ?AUTO_969 ?AUTO_964 ) ( IN-CITY ?AUTO_960 ?AUTO_964 ) ( not ( = ?AUTO_960 ?AUTO_969 ) ) ( TRUCK-AT ?AUTO_963 ?AUTO_965 ) ( AIRPORT ?AUTO_967 ) ( AIRPORT ?AUTO_965 ) ( not ( = ?AUTO_967 ?AUTO_965 ) ) ( AIRPORT ?AUTO_968 ) ( AIRPLANE-AT ?AUTO_962 ?AUTO_968 ) ( not ( = ?AUTO_968 ?AUTO_967 ) ) ( TRUCK-AT ?AUTO_970 ?AUTO_967 ) ( IN-TRUCK ?AUTO_959 ?AUTO_970 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_959 ?AUTO_970 ?AUTO_967 )
      ( DELIVER-PKG ?AUTO_959 ?AUTO_960 )
      ( DELIVER-PKG-VERIFY ?AUTO_959 ?AUTO_960 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_975 - OBJ
      ?AUTO_976 - LOCATION
    )
    :vars
    (
      ?AUTO_979 - TRUCK
      ?AUTO_983 - LOCATION
      ?AUTO_984 - CITY
      ?AUTO_986 - LOCATION
      ?AUTO_977 - LOCATION
      ?AUTO_981 - LOCATION
      ?AUTO_982 - AIRPLANE
      ?AUTO_985 - TRUCK
      ?AUTO_990 - LOCATION
      ?AUTO_988 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_979 ?AUTO_983 ) ( IN-CITY ?AUTO_983 ?AUTO_984 ) ( IN-CITY ?AUTO_976 ?AUTO_984 ) ( not ( = ?AUTO_976 ?AUTO_983 ) ) ( TRUCK-AT ?AUTO_979 ?AUTO_986 ) ( AIRPORT ?AUTO_977 ) ( AIRPORT ?AUTO_986 ) ( not ( = ?AUTO_977 ?AUTO_986 ) ) ( AIRPORT ?AUTO_981 ) ( AIRPLANE-AT ?AUTO_982 ?AUTO_981 ) ( not ( = ?AUTO_981 ?AUTO_977 ) ) ( IN-TRUCK ?AUTO_975 ?AUTO_985 ) ( TRUCK-AT ?AUTO_985 ?AUTO_990 ) ( IN-CITY ?AUTO_990 ?AUTO_988 ) ( IN-CITY ?AUTO_977 ?AUTO_988 ) ( not ( = ?AUTO_977 ?AUTO_990 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_985 ?AUTO_990 ?AUTO_977 ?AUTO_988 )
      ( DELIVER-PKG ?AUTO_975 ?AUTO_976 )
      ( DELIVER-PKG-VERIFY ?AUTO_975 ?AUTO_976 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_991 - OBJ
      ?AUTO_992 - LOCATION
    )
    :vars
    (
      ?AUTO_1001 - TRUCK
      ?AUTO_999 - LOCATION
      ?AUTO_1000 - CITY
      ?AUTO_998 - LOCATION
      ?AUTO_997 - LOCATION
      ?AUTO_996 - LOCATION
      ?AUTO_1002 - AIRPLANE
      ?AUTO_995 - TRUCK
      ?AUTO_1003 - LOCATION
      ?AUTO_1004 - CITY
      ?AUTO_1006 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1001 ?AUTO_999 ) ( IN-CITY ?AUTO_999 ?AUTO_1000 ) ( IN-CITY ?AUTO_992 ?AUTO_1000 ) ( not ( = ?AUTO_992 ?AUTO_999 ) ) ( TRUCK-AT ?AUTO_1001 ?AUTO_998 ) ( AIRPORT ?AUTO_997 ) ( AIRPORT ?AUTO_998 ) ( not ( = ?AUTO_997 ?AUTO_998 ) ) ( AIRPORT ?AUTO_996 ) ( AIRPLANE-AT ?AUTO_1002 ?AUTO_996 ) ( not ( = ?AUTO_996 ?AUTO_997 ) ) ( TRUCK-AT ?AUTO_995 ?AUTO_1003 ) ( IN-CITY ?AUTO_1003 ?AUTO_1004 ) ( IN-CITY ?AUTO_997 ?AUTO_1004 ) ( not ( = ?AUTO_997 ?AUTO_1003 ) ) ( TRUCK-AT ?AUTO_995 ?AUTO_1006 ) ( OBJ-AT ?AUTO_991 ?AUTO_1006 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_991 ?AUTO_995 ?AUTO_1006 )
      ( DELIVER-PKG ?AUTO_991 ?AUTO_992 )
      ( DELIVER-PKG-VERIFY ?AUTO_991 ?AUTO_992 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1093 - OBJ
      ?AUTO_1094 - LOCATION
    )
    :vars
    (
      ?AUTO_1098 - LOCATION
      ?AUTO_1097 - CITY
      ?AUTO_1101 - TRUCK
      ?AUTO_1100 - LOCATION
      ?AUTO_1103 - CITY
      ?AUTO_1099 - LOCATION
      ?AUTO_1102 - AIRPLANE
      ?AUTO_1104 - LOCATION
      ?AUTO_1105 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1098 ?AUTO_1097 ) ( IN-CITY ?AUTO_1094 ?AUTO_1097 ) ( not ( = ?AUTO_1094 ?AUTO_1098 ) ) ( TRUCK-AT ?AUTO_1101 ?AUTO_1100 ) ( IN-CITY ?AUTO_1100 ?AUTO_1103 ) ( IN-CITY ?AUTO_1098 ?AUTO_1103 ) ( not ( = ?AUTO_1098 ?AUTO_1100 ) ) ( AIRPORT ?AUTO_1099 ) ( AIRPORT ?AUTO_1098 ) ( AIRPLANE-AT ?AUTO_1102 ?AUTO_1099 ) ( not ( = ?AUTO_1099 ?AUTO_1098 ) ) ( AIRPLANE-AT ?AUTO_1102 ?AUTO_1104 ) ( TRUCK-AT ?AUTO_1105 ?AUTO_1104 ) ( IN-TRUCK ?AUTO_1093 ?AUTO_1105 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1093 ?AUTO_1105 ?AUTO_1104 )
      ( DELIVER-PKG ?AUTO_1093 ?AUTO_1094 )
      ( DELIVER-PKG-VERIFY ?AUTO_1093 ?AUTO_1094 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1108 - OBJ
      ?AUTO_1109 - LOCATION
    )
    :vars
    (
      ?AUTO_1113 - LOCATION
      ?AUTO_1120 - CITY
      ?AUTO_1112 - TRUCK
      ?AUTO_1116 - LOCATION
      ?AUTO_1115 - CITY
      ?AUTO_1119 - LOCATION
      ?AUTO_1117 - AIRPLANE
      ?AUTO_1118 - LOCATION
      ?AUTO_1114 - TRUCK
      ?AUTO_1124 - LOCATION
      ?AUTO_1122 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1113 ?AUTO_1120 ) ( IN-CITY ?AUTO_1109 ?AUTO_1120 ) ( not ( = ?AUTO_1109 ?AUTO_1113 ) ) ( TRUCK-AT ?AUTO_1112 ?AUTO_1116 ) ( IN-CITY ?AUTO_1116 ?AUTO_1115 ) ( IN-CITY ?AUTO_1113 ?AUTO_1115 ) ( not ( = ?AUTO_1113 ?AUTO_1116 ) ) ( AIRPORT ?AUTO_1119 ) ( AIRPORT ?AUTO_1113 ) ( AIRPLANE-AT ?AUTO_1117 ?AUTO_1119 ) ( not ( = ?AUTO_1119 ?AUTO_1113 ) ) ( AIRPLANE-AT ?AUTO_1117 ?AUTO_1118 ) ( IN-TRUCK ?AUTO_1108 ?AUTO_1114 ) ( TRUCK-AT ?AUTO_1114 ?AUTO_1124 ) ( IN-CITY ?AUTO_1124 ?AUTO_1122 ) ( IN-CITY ?AUTO_1118 ?AUTO_1122 ) ( not ( = ?AUTO_1118 ?AUTO_1124 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1114 ?AUTO_1124 ?AUTO_1118 ?AUTO_1122 )
      ( DELIVER-PKG ?AUTO_1108 ?AUTO_1109 )
      ( DELIVER-PKG-VERIFY ?AUTO_1108 ?AUTO_1109 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1149 - OBJ
      ?AUTO_1150 - LOCATION
    )
    :vars
    (
      ?AUTO_1158 - LOCATION
      ?AUTO_1152 - CITY
      ?AUTO_1157 - TRUCK
      ?AUTO_1162 - LOCATION
      ?AUTO_1154 - CITY
      ?AUTO_1153 - LOCATION
      ?AUTO_1159 - AIRPLANE
      ?AUTO_1151 - LOCATION
      ?AUTO_1160 - TRUCK
      ?AUTO_1161 - LOCATION
      ?AUTO_1163 - CITY
      ?AUTO_1165 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1158 ?AUTO_1152 ) ( IN-CITY ?AUTO_1150 ?AUTO_1152 ) ( not ( = ?AUTO_1150 ?AUTO_1158 ) ) ( TRUCK-AT ?AUTO_1157 ?AUTO_1162 ) ( IN-CITY ?AUTO_1162 ?AUTO_1154 ) ( IN-CITY ?AUTO_1158 ?AUTO_1154 ) ( not ( = ?AUTO_1158 ?AUTO_1162 ) ) ( AIRPORT ?AUTO_1153 ) ( AIRPORT ?AUTO_1158 ) ( AIRPLANE-AT ?AUTO_1159 ?AUTO_1153 ) ( not ( = ?AUTO_1153 ?AUTO_1158 ) ) ( AIRPLANE-AT ?AUTO_1159 ?AUTO_1151 ) ( TRUCK-AT ?AUTO_1160 ?AUTO_1161 ) ( IN-CITY ?AUTO_1161 ?AUTO_1163 ) ( IN-CITY ?AUTO_1151 ?AUTO_1163 ) ( not ( = ?AUTO_1151 ?AUTO_1161 ) ) ( TRUCK-AT ?AUTO_1160 ?AUTO_1165 ) ( OBJ-AT ?AUTO_1149 ?AUTO_1165 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1149 ?AUTO_1160 ?AUTO_1165 )
      ( DELIVER-PKG ?AUTO_1149 ?AUTO_1150 )
      ( DELIVER-PKG-VERIFY ?AUTO_1149 ?AUTO_1150 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1606 - OBJ
      ?AUTO_1607 - LOCATION
    )
    :vars
    (
      ?AUTO_1614 - LOCATION
      ?AUTO_1617 - CITY
      ?AUTO_1612 - LOCATION
      ?AUTO_1613 - AIRPLANE
      ?AUTO_1609 - LOCATION
      ?AUTO_1615 - TRUCK
      ?AUTO_1616 - TRUCK
      ?AUTO_1621 - LOCATION
      ?AUTO_1619 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1614 ?AUTO_1617 ) ( IN-CITY ?AUTO_1607 ?AUTO_1617 ) ( not ( = ?AUTO_1607 ?AUTO_1614 ) ) ( AIRPORT ?AUTO_1612 ) ( AIRPORT ?AUTO_1614 ) ( AIRPLANE-AT ?AUTO_1613 ?AUTO_1612 ) ( not ( = ?AUTO_1612 ?AUTO_1614 ) ) ( AIRPLANE-AT ?AUTO_1613 ?AUTO_1609 ) ( TRUCK-AT ?AUTO_1615 ?AUTO_1609 ) ( IN-TRUCK ?AUTO_1606 ?AUTO_1615 ) ( TRUCK-AT ?AUTO_1616 ?AUTO_1621 ) ( IN-CITY ?AUTO_1621 ?AUTO_1619 ) ( IN-CITY ?AUTO_1614 ?AUTO_1619 ) ( not ( = ?AUTO_1614 ?AUTO_1621 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1616 ?AUTO_1621 ?AUTO_1614 ?AUTO_1619 )
      ( DELIVER-PKG ?AUTO_1606 ?AUTO_1607 )
      ( DELIVER-PKG-VERIFY ?AUTO_1606 ?AUTO_1607 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1673 - OBJ
      ?AUTO_1674 - LOCATION
    )
    :vars
    (
      ?AUTO_1684 - LOCATION
      ?AUTO_1679 - CITY
      ?AUTO_1687 - LOCATION
      ?AUTO_1677 - AIRPLANE
      ?AUTO_1686 - LOCATION
      ?AUTO_1683 - TRUCK
      ?AUTO_1682 - LOCATION
      ?AUTO_1680 - CITY
      ?AUTO_1688 - LOCATION
      ?AUTO_1685 - CITY
      ?AUTO_1681 - TRUCK
      ?AUTO_1692 - LOCATION
      ?AUTO_1690 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1684 ?AUTO_1679 ) ( IN-CITY ?AUTO_1674 ?AUTO_1679 ) ( not ( = ?AUTO_1674 ?AUTO_1684 ) ) ( AIRPORT ?AUTO_1687 ) ( AIRPORT ?AUTO_1684 ) ( AIRPLANE-AT ?AUTO_1677 ?AUTO_1687 ) ( not ( = ?AUTO_1687 ?AUTO_1684 ) ) ( AIRPLANE-AT ?AUTO_1677 ?AUTO_1686 ) ( TRUCK-AT ?AUTO_1683 ?AUTO_1682 ) ( IN-CITY ?AUTO_1682 ?AUTO_1680 ) ( IN-CITY ?AUTO_1684 ?AUTO_1680 ) ( not ( = ?AUTO_1684 ?AUTO_1682 ) ) ( IN-CITY ?AUTO_1688 ?AUTO_1685 ) ( IN-CITY ?AUTO_1686 ?AUTO_1685 ) ( not ( = ?AUTO_1686 ?AUTO_1688 ) ) ( OBJ-AT ?AUTO_1673 ?AUTO_1688 ) ( TRUCK-AT ?AUTO_1681 ?AUTO_1692 ) ( IN-CITY ?AUTO_1692 ?AUTO_1690 ) ( IN-CITY ?AUTO_1688 ?AUTO_1690 ) ( not ( = ?AUTO_1688 ?AUTO_1692 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1681 ?AUTO_1692 ?AUTO_1688 ?AUTO_1690 )
      ( DELIVER-PKG ?AUTO_1673 ?AUTO_1674 )
      ( DELIVER-PKG-VERIFY ?AUTO_1673 ?AUTO_1674 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1742 - OBJ
      ?AUTO_1743 - LOCATION
    )
    :vars
    (
      ?AUTO_1746 - LOCATION
      ?AUTO_1750 - CITY
      ?AUTO_1744 - AIRPLANE
      ?AUTO_1749 - LOCATION
      ?AUTO_1745 - TRUCK
      ?AUTO_1755 - LOCATION
      ?AUTO_1753 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1746 ?AUTO_1750 ) ( IN-CITY ?AUTO_1743 ?AUTO_1750 ) ( not ( = ?AUTO_1743 ?AUTO_1746 ) ) ( IN-AIRPLANE ?AUTO_1742 ?AUTO_1744 ) ( AIRPORT ?AUTO_1749 ) ( AIRPORT ?AUTO_1746 ) ( AIRPLANE-AT ?AUTO_1744 ?AUTO_1749 ) ( not ( = ?AUTO_1749 ?AUTO_1746 ) ) ( TRUCK-AT ?AUTO_1745 ?AUTO_1755 ) ( IN-CITY ?AUTO_1755 ?AUTO_1753 ) ( IN-CITY ?AUTO_1746 ?AUTO_1753 ) ( not ( = ?AUTO_1746 ?AUTO_1755 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1745 ?AUTO_1755 ?AUTO_1746 ?AUTO_1753 )
      ( DELIVER-PKG ?AUTO_1742 ?AUTO_1743 )
      ( DELIVER-PKG-VERIFY ?AUTO_1742 ?AUTO_1743 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2088 - OBJ
      ?AUTO_2089 - LOCATION
    )
    :vars
    (
      ?AUTO_2094 - LOCATION
      ?AUTO_2099 - CITY
      ?AUTO_2090 - TRUCK
      ?AUTO_2091 - LOCATION
      ?AUTO_2097 - CITY
      ?AUTO_2092 - LOCATION
      ?AUTO_2098 - LOCATION
      ?AUTO_2093 - AIRPLANE
      ?AUTO_2100 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2094 ?AUTO_2099 ) ( IN-CITY ?AUTO_2089 ?AUTO_2099 ) ( not ( = ?AUTO_2089 ?AUTO_2094 ) ) ( TRUCK-AT ?AUTO_2090 ?AUTO_2091 ) ( IN-CITY ?AUTO_2091 ?AUTO_2097 ) ( IN-CITY ?AUTO_2094 ?AUTO_2097 ) ( not ( = ?AUTO_2094 ?AUTO_2091 ) ) ( AIRPORT ?AUTO_2092 ) ( AIRPORT ?AUTO_2094 ) ( not ( = ?AUTO_2092 ?AUTO_2094 ) ) ( AIRPORT ?AUTO_2098 ) ( AIRPLANE-AT ?AUTO_2093 ?AUTO_2098 ) ( not ( = ?AUTO_2098 ?AUTO_2092 ) ) ( TRUCK-AT ?AUTO_2100 ?AUTO_2092 ) ( IN-TRUCK ?AUTO_2088 ?AUTO_2100 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2088 ?AUTO_2100 ?AUTO_2092 )
      ( DELIVER-PKG ?AUTO_2088 ?AUTO_2089 )
      ( DELIVER-PKG-VERIFY ?AUTO_2088 ?AUTO_2089 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2103 - OBJ
      ?AUTO_2104 - LOCATION
    )
    :vars
    (
      ?AUTO_2114 - LOCATION
      ?AUTO_2115 - CITY
      ?AUTO_2111 - TRUCK
      ?AUTO_2108 - LOCATION
      ?AUTO_2107 - CITY
      ?AUTO_2109 - LOCATION
      ?AUTO_2110 - LOCATION
      ?AUTO_2112 - AIRPLANE
      ?AUTO_2113 - TRUCK
      ?AUTO_2119 - LOCATION
      ?AUTO_2117 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2114 ?AUTO_2115 ) ( IN-CITY ?AUTO_2104 ?AUTO_2115 ) ( not ( = ?AUTO_2104 ?AUTO_2114 ) ) ( TRUCK-AT ?AUTO_2111 ?AUTO_2108 ) ( IN-CITY ?AUTO_2108 ?AUTO_2107 ) ( IN-CITY ?AUTO_2114 ?AUTO_2107 ) ( not ( = ?AUTO_2114 ?AUTO_2108 ) ) ( AIRPORT ?AUTO_2109 ) ( AIRPORT ?AUTO_2114 ) ( not ( = ?AUTO_2109 ?AUTO_2114 ) ) ( AIRPORT ?AUTO_2110 ) ( AIRPLANE-AT ?AUTO_2112 ?AUTO_2110 ) ( not ( = ?AUTO_2110 ?AUTO_2109 ) ) ( IN-TRUCK ?AUTO_2103 ?AUTO_2113 ) ( TRUCK-AT ?AUTO_2113 ?AUTO_2119 ) ( IN-CITY ?AUTO_2119 ?AUTO_2117 ) ( IN-CITY ?AUTO_2109 ?AUTO_2117 ) ( not ( = ?AUTO_2109 ?AUTO_2119 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2113 ?AUTO_2119 ?AUTO_2109 ?AUTO_2117 )
      ( DELIVER-PKG ?AUTO_2103 ?AUTO_2104 )
      ( DELIVER-PKG-VERIFY ?AUTO_2103 ?AUTO_2104 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2120 - OBJ
      ?AUTO_2121 - LOCATION
    )
    :vars
    (
      ?AUTO_2133 - LOCATION
      ?AUTO_2129 - CITY
      ?AUTO_2122 - TRUCK
      ?AUTO_2132 - LOCATION
      ?AUTO_2124 - CITY
      ?AUTO_2131 - LOCATION
      ?AUTO_2125 - LOCATION
      ?AUTO_2127 - AIRPLANE
      ?AUTO_2123 - TRUCK
      ?AUTO_2134 - LOCATION
      ?AUTO_2126 - CITY
      ?AUTO_2136 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2133 ?AUTO_2129 ) ( IN-CITY ?AUTO_2121 ?AUTO_2129 ) ( not ( = ?AUTO_2121 ?AUTO_2133 ) ) ( TRUCK-AT ?AUTO_2122 ?AUTO_2132 ) ( IN-CITY ?AUTO_2132 ?AUTO_2124 ) ( IN-CITY ?AUTO_2133 ?AUTO_2124 ) ( not ( = ?AUTO_2133 ?AUTO_2132 ) ) ( AIRPORT ?AUTO_2131 ) ( AIRPORT ?AUTO_2133 ) ( not ( = ?AUTO_2131 ?AUTO_2133 ) ) ( AIRPORT ?AUTO_2125 ) ( AIRPLANE-AT ?AUTO_2127 ?AUTO_2125 ) ( not ( = ?AUTO_2125 ?AUTO_2131 ) ) ( TRUCK-AT ?AUTO_2123 ?AUTO_2134 ) ( IN-CITY ?AUTO_2134 ?AUTO_2126 ) ( IN-CITY ?AUTO_2131 ?AUTO_2126 ) ( not ( = ?AUTO_2131 ?AUTO_2134 ) ) ( TRUCK-AT ?AUTO_2123 ?AUTO_2136 ) ( OBJ-AT ?AUTO_2120 ?AUTO_2136 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2120 ?AUTO_2123 ?AUTO_2136 )
      ( DELIVER-PKG ?AUTO_2120 ?AUTO_2121 )
      ( DELIVER-PKG-VERIFY ?AUTO_2120 ?AUTO_2121 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2297 - OBJ
      ?AUTO_2298 - LOCATION
    )
    :vars
    (
      ?AUTO_2303 - LOCATION
      ?AUTO_2299 - LOCATION
      ?AUTO_2304 - AIRPLANE
      ?AUTO_2307 - LOCATION
      ?AUTO_2305 - CITY
      ?AUTO_2302 - TRUCK
      ?AUTO_2311 - LOCATION
      ?AUTO_2309 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2303 ) ( AIRPORT ?AUTO_2298 ) ( not ( = ?AUTO_2303 ?AUTO_2298 ) ) ( AIRPORT ?AUTO_2299 ) ( AIRPLANE-AT ?AUTO_2304 ?AUTO_2299 ) ( not ( = ?AUTO_2299 ?AUTO_2303 ) ) ( IN-CITY ?AUTO_2307 ?AUTO_2305 ) ( IN-CITY ?AUTO_2303 ?AUTO_2305 ) ( not ( = ?AUTO_2303 ?AUTO_2307 ) ) ( OBJ-AT ?AUTO_2297 ?AUTO_2307 ) ( TRUCK-AT ?AUTO_2302 ?AUTO_2311 ) ( IN-CITY ?AUTO_2311 ?AUTO_2309 ) ( IN-CITY ?AUTO_2307 ?AUTO_2309 ) ( not ( = ?AUTO_2307 ?AUTO_2311 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2302 ?AUTO_2311 ?AUTO_2307 ?AUTO_2309 )
      ( DELIVER-PKG ?AUTO_2297 ?AUTO_2298 )
      ( DELIVER-PKG-VERIFY ?AUTO_2297 ?AUTO_2298 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2533 - OBJ
      ?AUTO_2534 - LOCATION
    )
    :vars
    (
      ?AUTO_2539 - TRUCK
      ?AUTO_2541 - LOCATION
      ?AUTO_2537 - CITY
      ?AUTO_2542 - LOCATION
      ?AUTO_2545 - LOCATION
      ?AUTO_2544 - LOCATION
      ?AUTO_2536 - AIRPLANE
      ?AUTO_2543 - LOCATION
      ?AUTO_2540 - CITY
      ?AUTO_2546 - TRUCK
      ?AUTO_2551 - LOCATION
      ?AUTO_2549 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2539 ?AUTO_2541 ) ( IN-CITY ?AUTO_2541 ?AUTO_2537 ) ( IN-CITY ?AUTO_2534 ?AUTO_2537 ) ( not ( = ?AUTO_2534 ?AUTO_2541 ) ) ( TRUCK-AT ?AUTO_2539 ?AUTO_2542 ) ( AIRPORT ?AUTO_2545 ) ( AIRPORT ?AUTO_2542 ) ( not ( = ?AUTO_2545 ?AUTO_2542 ) ) ( AIRPORT ?AUTO_2544 ) ( AIRPLANE-AT ?AUTO_2536 ?AUTO_2544 ) ( not ( = ?AUTO_2544 ?AUTO_2545 ) ) ( IN-CITY ?AUTO_2543 ?AUTO_2540 ) ( IN-CITY ?AUTO_2545 ?AUTO_2540 ) ( not ( = ?AUTO_2545 ?AUTO_2543 ) ) ( OBJ-AT ?AUTO_2533 ?AUTO_2543 ) ( TRUCK-AT ?AUTO_2546 ?AUTO_2551 ) ( IN-CITY ?AUTO_2551 ?AUTO_2549 ) ( IN-CITY ?AUTO_2543 ?AUTO_2549 ) ( not ( = ?AUTO_2543 ?AUTO_2551 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2546 ?AUTO_2551 ?AUTO_2543 ?AUTO_2549 )
      ( DELIVER-PKG ?AUTO_2533 ?AUTO_2534 )
      ( DELIVER-PKG-VERIFY ?AUTO_2533 ?AUTO_2534 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2552 - OBJ
      ?AUTO_2553 - LOCATION
    )
    :vars
    (
      ?AUTO_2567 - LOCATION
      ?AUTO_2564 - CITY
      ?AUTO_2565 - LOCATION
      ?AUTO_2566 - LOCATION
      ?AUTO_2554 - AIRPLANE
      ?AUTO_2561 - LOCATION
      ?AUTO_2562 - CITY
      ?AUTO_2559 - TRUCK
      ?AUTO_2557 - LOCATION
      ?AUTO_2563 - CITY
      ?AUTO_2558 - TRUCK
      ?AUTO_2571 - LOCATION
      ?AUTO_2569 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2567 ?AUTO_2564 ) ( IN-CITY ?AUTO_2553 ?AUTO_2564 ) ( not ( = ?AUTO_2553 ?AUTO_2567 ) ) ( AIRPORT ?AUTO_2565 ) ( AIRPORT ?AUTO_2567 ) ( not ( = ?AUTO_2565 ?AUTO_2567 ) ) ( AIRPORT ?AUTO_2566 ) ( AIRPLANE-AT ?AUTO_2554 ?AUTO_2566 ) ( not ( = ?AUTO_2566 ?AUTO_2565 ) ) ( IN-CITY ?AUTO_2561 ?AUTO_2562 ) ( IN-CITY ?AUTO_2565 ?AUTO_2562 ) ( not ( = ?AUTO_2565 ?AUTO_2561 ) ) ( OBJ-AT ?AUTO_2552 ?AUTO_2561 ) ( TRUCK-AT ?AUTO_2559 ?AUTO_2557 ) ( IN-CITY ?AUTO_2557 ?AUTO_2563 ) ( IN-CITY ?AUTO_2561 ?AUTO_2563 ) ( not ( = ?AUTO_2561 ?AUTO_2557 ) ) ( TRUCK-AT ?AUTO_2558 ?AUTO_2571 ) ( IN-CITY ?AUTO_2571 ?AUTO_2569 ) ( IN-CITY ?AUTO_2567 ?AUTO_2569 ) ( not ( = ?AUTO_2567 ?AUTO_2571 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2558 ?AUTO_2571 ?AUTO_2567 ?AUTO_2569 )
      ( DELIVER-PKG ?AUTO_2552 ?AUTO_2553 )
      ( DELIVER-PKG-VERIFY ?AUTO_2552 ?AUTO_2553 ) )
  )

)

